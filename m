Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7108613AD3F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324858; cv=none; b=GteDIOc22NLkAvhnbkaMUsZ3/WFOvwH3sduy+qL8DcFQLpesWsnyt+PHVZ+hmGc5CgC3s2bbCr3nqok/Co7VCQ3h4eRB0DwmSL7PFvsEFFX5KYNsBEsv5eDx/8sFSy438xQgefNzLrSE+MwWoDGheFdYpNliFJBQnLBaE9B1txA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324858; c=relaxed/simple;
	bh=dv35agKUmjJyWkKju8n7GfQM/eqBqGelJiqdUmMGHx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4aZ/aFMoQHP6ewEtKdK0F/BUJZ2fYQ6cff4QG9nXf2tSlfFPz+tH2EyXnNPAKxlovGXJwXTiotk+ae5Kwv9RPGDm0vwGU1pbXgp+UJtwnQS1knxOmH3ArfdQVZodvyuieux8IchvesS7+QzGGF2jLZvJ5al8PZwwqsZfhKOiOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X5mIUXQW; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X5mIUXQW"
Message-ID: <1876bf9a-a77d-40a5-bedd-643df939bfbf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748324844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GOjuGdUJzsWJUj/GE72t8vAkHTVxJTsMRBXBjrztw0=;
	b=X5mIUXQWcU3REAESituGcRmT9iU0WFJ8keZ3ALlVCzjktZZU9fdH/EWsRercOEO1HpQyL6
	L16pjvOvr6BdiRlYgusKrW5epacrwgvPcrJJEEwMWLTG9wC0645NBfxMJXfPznA9jwxDbr
	PfkLwHZgPpZBt71F62GQbPf0nfcw5Wc=
Date: Tue, 27 May 2025 13:47:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Loongarch:Fixed up panic cause by a NULL-pmd
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, zhanghongchen@loongson.cn, wangming01@loongson.cn,
 peterx@redhat.com
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250526065512.13215-1-zhangtianyang@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250526065512.13215-1-zhangtianyang@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 5/26/25 2:55 PM, Tianyang Zhang 写道:
> From: zhangtianyang <zhangtianyang@loongson.cn>
> 
> Fixes: bd51834d1cf6 ("LoongArch: Return NULL from huge_pte_offset() for invalid PMD")
> ERROR INFO:
> 
> CPU 25 Unable to handle kernel paging request at virtual address 0x0
>           ...
>   Call Trace:
>   [<900000000023c30c>] huge_pte_offset+0x3c/0x58
>   [<900000000057fd4c>] hugetlb_follow_page_mask+0x74/0x438
>   [<900000000051fee8>] __get_user_pages+0xe0/0x4c8
>   [<9000000000522414>] faultin_page_range+0x84/0x380
>   [<9000000000564e8c>] madvise_vma_behavior+0x534/0xa48
>   [<900000000056689c>] do_madvise+0x1bc/0x3e8
>   [<9000000000566df4>] sys_madvise+0x24/0x38
>   [<90000000015b9e88>] do_syscall+0x78/0x98
>   [<9000000000221f18>] handle_syscall+0xb8/0x158
> 

> In some cases, pmd may be NULL and rely on NULL as the return value
> for processing, so it is necessary to determine this situation here

Your description is a bit vague. Could you please specify
on which machines and in what scenarios this bug can be
reproduced? I believe such information should be included
in the commit message.

Thanks,
Yanteng

