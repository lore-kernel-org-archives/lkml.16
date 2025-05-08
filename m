Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E001953A1
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 02:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746670100; cv=none; b=b3N7YulwnHQ/DKgs+tdW/rMUx5MyZbrUgg5lO9hTnRP4HBcppVNVItiRty/673KzgkmZMj9qbJFiObD3evOx+VFZ94GLuxHQoDH1STxKxiZcLDL4fIGFHbgtQ8PSOa15Ufv6DEnkE6euxek/vs+C4jSTg/C5vVT0U8/k9FJH/20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746670100; c=relaxed/simple;
	bh=+fiuCkSuSeF8r/HyL/gskSHL4eQowWcyzkDlFyJiEVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+JUF9MlwH+/xbkDjoVJjRaEXalnq6WxD5vuEdyCfKYuAGdUPNzV1V49CXUcmB7SmrTNWOc+YFQ30b+pOm4ACwncvjPWMJq02fJwvmIv24XFcWOQ70iEJXA/d9+LOw9MSq3jM7XBlVEfOTv2vu4uJKcj54975fIvzfmjlYnliEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=W+wrrW9e; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="W+wrrW9e"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746670091; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=XU2tUPMbXFANOISEpeXWUxvB5DcpMsMzlgYdMXpTRzg=;
	b=W+wrrW9e6ag7GxBwGb1wh1lEu9JpBG2zlqz1meWSJ5URnIbS8ByvdJ74O0iE8bs9Qo0+GdXV+1xy/anuH59VvYmzDjiCWGYjgcAeUZBxDBhbvf6ncoSuW+mox3sIMDhKZWmf1sT3TDm4Aydh3csiMGtq3K2WWNf2+ptCjjuRpvE=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WZyiDYG_1746670088 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 May 2025 10:08:09 +0800
Message-ID: <5ffc814f-72e9-4173-9a77-5b45f941565c@linux.alibaba.com>
Date: Thu, 8 May 2025 10:08:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: khugepaged: convert set_huge_pmd() to take a
 folio
To: David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
 <aBtMYHE9BgiT8nT-@casper.infradead.org>
 <70785e68-5152-459f-b241-fa5abc3b88ae@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <70785e68-5152-459f-b241-fa5abc3b88ae@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/8 05:19, David Hildenbrand wrote:
> On 07.05.25 14:04, Matthew Wilcox wrote:
>> On Wed, May 07, 2025 at 05:26:12PM +0800, Baolin Wang wrote:
>>> @@ -1476,13 +1476,13 @@ static int set_huge_pmd(struct vm_area_struct 
>>> *vma, unsigned long addr,
>>>           .pmd = pmdp,
>>>       };
>>> -    VM_BUG_ON(!PageTransHuge(hpage));
>>> +    VM_BUG_ON(!folio_test_large(folio));
>>
>> I don't think this is aterribly useful assertion to keep in a static
>> function with one caller, do you?

Yes. Will remove this VM_BUG_ON.

> I'll not that -- whatever we do here -- we can (finally) get rid of 
> PageTransHuge.

Right. I will remove the PageTransHuge in the next version.
