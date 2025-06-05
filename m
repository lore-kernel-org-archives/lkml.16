Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19CA3C2F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749093435; cv=none; b=pN7fXHYyL9IlK1jXNJdD+QphSYzfCeWkuPnVnluNZ59C/Znklb7ZH3pxqWesMU50aaF6khIinoizyD74M6+Xt5zHgYCvczPttd7KV/3I3xo2FMKTgs7AI6ofSTn/UCgMkscInp2pcHZNnHiJ/y2pMOgqO3Ad8/KSee2X+FNJxNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749093435; c=relaxed/simple;
	bh=OZK6b8msq6X9GCjEhF+Ir0LQgVfF5QMWvAR/Gp09L3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pS8rBpkUvxCNyEj3VB6OEAFh13zr42wTGAdm9hefPykoj3hKKnPN1Goj6v0KqeUL7asuiC8ao/7RylFAR+8fPNQT8q1q8VLVilRAe0R3olvg4EnOd0P7nR/UdhOJkzSe8yAqnkKsxyIxK7fp7W4xhgYd6MsMHEX3qksi2DKyZpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=PQVlcpf0; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="PQVlcpf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Dgb/YpmpOW9VYXVuxgnzQsBVv3IKixywt4/deZXRAWI=;
	b=PQVlcpf0R/mFposwvMPvj0ej/YwAbHw25+egKBmSOah1LnRYNhJUBOx7wXKiUA
	p7Q/0oOi6CQh4EXb6BP7o4J3e73CyBDno5nQwXmOtlNgQAv/YAi6MZMegIeY1u+o
	pUl0iPuJzA3RCW6tA0vaz8C9qGgTBFPnHzMz7maypz1HU=
Received: from [172.19.20.199] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD31wtZ6EBox0ZuBA--.54588S2;
	Thu, 05 Jun 2025 08:44:10 +0800 (CST)
Message-ID: <c15bfa20-2113-4299-98bf-1865b6b535ef@126.com>
Date: Thu, 5 Jun 2025 08:44:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mm/hugetlb: remove unnecessary holding of hugetlb_lock
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
 david@redhat.com, baolin.wang@linux.alibaba.com, muchun.song@linux.dev,
 osalvador@suse.de, liuzixing@hygon.cn
References: <1748317010-16272-1-git-send-email-yangge1116@126.com>
 <20250604154754.a30e327c3f1640173c8b9cb8@linux-foundation.org>
From: Ge Yang <yangge1116@126.com>
In-Reply-To: <20250604154754.a30e327c3f1640173c8b9cb8@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD31wtZ6EBox0ZuBA--.54588S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw18KFy3Cr1ruF45WFyUKFg_yoW8AryrpF
	yjkF90kF4DJ3yqkw4xtr4rAF1rZws8Xa45trZ5JFWY9rs8XF92gFsrZw1qyay8Crn3Xw4I
	qFWjgrWqqFn0y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbHUDUUUUU=
X-CM-SenderInfo: 51dqwwjhrrila6rslhhfrp/1tbidQdjG2hA5Jtt0wAAsj



在 2025/6/5 6:47, Andrew Morton 写道:
> On Tue, 27 May 2025 11:36:50 +0800 yangge1116@126.com wrote:
> 
>> From: Ge Yang <yangge1116@126.com>
>>
>> In the isolate_or_dissolve_huge_folio() function, after acquiring the
>> hugetlb_lock, it is only for the purpose of obtaining the correct hstate,
>> which is then passed to the alloc_and_dissolve_hugetlb_folio() function.
>>
>> The alloc_and_dissolve_hugetlb_folio() function itself also acquires the
>> hugetlb_lock. We can have the alloc_and_dissolve_hugetlb_folio() function
>> obtain the hstate by itself, so that the isolate_or_dissolve_huge_folio()
>> function no longer needs to acquire the hugetlb_lock. In addition, we keep
>> the folio_test_hugetlb() check within the isolate_or_dissolve_huge_folio()
>> function. By doing so, we can avoid disrupting the normal path by vainly
>> holding the hugetlb_lock.
>>
>> The replace_free_hugepage_folios() function has the same issue, and we
>> should address it as well.
>>
> 
> This change addresses a possible performance issue which was introduced
> by 113ed54ad276 ("mm/hugetlb: fix kernel NULL pointer dereference when
> replacing free hugetlb folios").  113ed54ad276 was added recently and
> was cc:stable.
> 
> David said:
> https://lkml.kernel.org/r/87521d93-cc03-480d-a2ef-3ef8c84481c9@redhat.com
> 
> 
> Question is, will that bugfix's performance impact be sufficiently
> serious for us to also backport this new patch?

In some low-probability scenarios, there could be severe impacts. For 
example, when multiple CPUs execute the replace_free_hugepage_folios() 
function simultaneously. It seems that we need to backport this new 
patch. Thank you.

