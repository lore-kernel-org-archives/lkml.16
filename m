Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C224B1B85CC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 03:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746589449; cv=none; b=ON8eE9eJdusbpmnEGyfSjV/WBdF1V0EDUc4D64FxvZNR5/63eT4if28Oi2+yjpYhLlJRvShDIBd2BwQuYkFbAZk8auKXa2RDExNevhDu17YeFcOlRKo9xnU6NEajp00Zh5vr9vgQnh1bhvShcEkGeo8gOSLjGMxzU1HZ+T3tBO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746589449; c=relaxed/simple;
	bh=s06UFZ3k5NVbKJqsLAUYUxKBPOp9Y1OeTT1MNrGbbCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFH8rkUjX5WLyTILUqvgRxQvmkWYBv678CvqKSung1G5gyCAG0XojnjHyqLQ/EJlqUt+ZriOR4bDdrL+omain9NlJln9P9/afLylNNXHHkhK4GeDNzWINMo8iJpqoPgtT25KuzrO181Qzerrgx9z0jv0nKLTloGITMpg6tHcJHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87B732F;
	Tue,  6 May 2025 20:43:55 -0700 (PDT)
Received: from [10.162.43.22] (unknown [10.162.43.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 229DB3F673;
	Tue,  6 May 2025 20:43:58 -0700 (PDT)
Message-ID: <34ed0b92-ee75-4d2a-8aa7-6ede9287c740@arm.com>
Date: Wed, 7 May 2025 09:13:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm: Add generic helper to hint a large folio
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 david@redhat.com, peterx@redhat.com, ryan.roberts@arm.com, mingo@kernel.org,
 libang.li@antgroup.com, maobibo@loongson.cn, zhengqi.arch@bytedance.com,
 baohua@kernel.org, anshuman.khandual@arm.com, ioworker0@gmail.com,
 yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-3-dev.jain@arm.com>
 <aBou5i71eiLSvzUU@casper.infradead.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aBou5i71eiLSvzUU@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/05/25 9:16 pm, Matthew Wilcox wrote:
> On Tue, May 06, 2025 at 10:30:55AM +0530, Dev Jain wrote:
>> +	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == PAGE_SIZE);
> 
> umm ... PFN is in units of PAGE_SIZE.  Did you mean == 1?

My bad, thanks for pointing out.
