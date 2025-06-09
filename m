Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3239D610D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749450874; cv=none; b=C4XWnAsXCCETWsWThJLH3U0KTVY/c1De3W43WtZ8CzYPamhPjAQOYogVMogc1DK+9RRTBeQtOkRqFeXmUaGXYxEeD7ireJxkLi/vRvi3TKcCorc+qegLGhP8AQ9vXKz5FS7H+Ik8ogTr0fmw17NkRi2LG/bYIJ1DKDXGAsF4lg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749450874; c=relaxed/simple;
	bh=XtZywwT74fhBJ7HGACmE0m1DYA+0813djtpZI39+90g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nf2h105B+klUmlY/4nIJ/9XuplSisAostgGg5ZYj0LT8awFkzmwzEaPafmuXwlWBeuKaDZflJ7ek7gUmWaSw/jYJA9L1KL7F0AtYVHH5R5uXUEoOU8D3yJqSO1pxLU+LLAsYObcj5zqbLrLMTsm0lwKWxYILSPgEnYnZjnI4tBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QVYirElk; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QVYirElk"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749450863; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=bEbolKbxdXCTdkf5HWqUnpJFb7LwWG+f6HB8rKtQLSw=;
	b=QVYirElk7DdZ9lLGmy6186cfmXAhDQq0v+4xHYkuZcLZ3eoGlNPMM7hVxngZp2/VWwcfswJv141cwbSLUberOv80BG8T6OrJ8MbJCY1KPKUblV9ELlxEg+CTEusbTre3PBlNBF+gl1fh3xNKBs+6z7mpV/cg2AQj5fhJ3QsoZ84=
Received: from 30.74.144.144(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WdLx-iu_1749450862 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Jun 2025 14:34:22 +0800
Message-ID: <aa6aa559-431e-43c0-bd24-828e6558bac3@linux.alibaba.com>
Date: Mon, 9 Jun 2025 14:34:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: shmem: disallow hugepages if the system-wide
 shmem THP sysfs settings are disabled
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <39d7617a6142c6091f233357171c5793e0992d36.1749109709.git.baolin.wang@linux.alibaba.com>
 <b6ae32e5-60e0-44dd-a1e8-37c162d04ed3@lucifer.local>
 <b455db10-f129-4603-a087-43a1b52ff09c@lucifer.local>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <b455db10-f129-4603-a087-43a1b52ff09c@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/7 20:17, Lorenzo Stoakes wrote:
> On Sat, Jun 07, 2025 at 01:14:41PM +0100, Lorenzo Stoakes wrote:
>> On Thu, Jun 05, 2025 at 04:00:59PM +0800, Baolin Wang wrote:
> [snip]
>>>
>>> Another rule for madvise, referring to David's suggestion: “allowing for collapsing
>>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>
>> Hm I'm not sure if this is enforced is it? I may have missed something here
>> however.
> 
> Oh right actually I think it is implicitly - if TVA_ENFORCE_SYSFS is not
> specified in tva_flags, then we don't bother applying an madvise filter at all
> anyway, and we account for that in our 'enabled' check in
> thp_vma_allowable_orders().
> 
> But I don't think this patch changes anything, I actually _think_ we can just
> drop this one.

See my previous replies. Shmem mTHP sysfs settings are different from 
Anonymous pages.

Thanks for reviewing.
