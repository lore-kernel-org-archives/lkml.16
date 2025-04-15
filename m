Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71481422AB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737590; cv=none; b=j5gcd4qdSeRR/JizG8pKFxeFFeu3pk3mkmvUxeJnOifv9awcUN/cctnmZ6xkc2FpCMuUlbHtGjvVA4uHD3UYQxJTxFt+iscPvWlBaOmRtCSztmnNNxvVtfw9PK9f9xk007+U10ZXVThhhgAGQpL5ZxRbelVFBFstOEGWa0S/ulw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737590; c=relaxed/simple;
	bh=1ceVoQhZD6IqAEebUHSCIUW93FW6CPi0FpPcGiSSZUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u96V0v+8DCLviWJZdr3+khWnthn1/8KOIhzNO5AR3RI5czMYu2e+L76jrbtb9e6R3+YeuA5wUKYeiAqYEQNKTOMexsnGtotA38uBCmM5lMXrt8aUnY4XL/JVHLEzvgLvRXq0GtBB+LYDgSKVyEgTKPgdsdOUYfckkbtjXuEou94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FBmfO6ez; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FBmfO6ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744737587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=n/WiWhHz3wCNB2SPSnX0CQIauJ8v4+S0+w60f+G4Ibc=;
	b=FBmfO6ez7PYDU93wON950+QMZOexICOhtEjR0blYIsN8xu4IIYBZzrP2xgcBjJGs/8q+bS
	alxpui/vjUQvEUia0y0ifkziAb6jcIqCzFz48L+pJsRB0mbalEX3m7rnl3Lry0OFrIg7PT
	TjSGprKucAiuiPsJDQsb/tpjpoGVwco=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-Od1inBtnPuyEt0iHI8NU3Q-1; Tue, 15 Apr 2025 13:19:45 -0400
X-MC-Unique: Od1inBtnPuyEt0iHI8NU3Q-1
X-Mimecast-MFC-AGG-ID: Od1inBtnPuyEt0iHI8NU3Q_1744737585
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so41489375e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737584; x=1745342384;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n/WiWhHz3wCNB2SPSnX0CQIauJ8v4+S0+w60f+G4Ibc=;
        b=YuVhXH7+dIQK247Mfn/DL4qyf1kdyZiPwSboncVngVjAtooaq6ccseisGy+AQBlVEj
         09oUgffB2F+9QTADTrrVkexOk2fBa05Z+QcIS022IzCXv8SRYCavwlFdw/+mFe6iT7c1
         1b7WtIL2gj8RISZCFWc1aiNEKUIR87z8oz29UE8wtjXmJzy2KqYaEgOPeHXOUgcuBCA+
         YvBltuAeWI3wGnF4TCEZFUcnIpBXCCNcYeUy4bAm6/D13l5apDrcy/sYG28LLdjGs5so
         n6zz4QrEOPg5VpvCAMOrPnFRr5lbSyt5qZi5RE+EHt1fbQIs+LdHFjcAytuoTW8Q1bih
         wzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiU2JrwsLqojQHDLHMEouYAU+WmmnL4rRjqWdonemKWKMw1dacxYQ81oMZTVa30P0AZpWkuK40HCLecRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQWKTDDlOf6dJ9W/6csjDHNEq3sCDXFoTvAhwtyLp6XOuMRjHk
	yodEDiXYZ0wiBmjwK1V/DuBl5jf1jqK/Q4bOR+BTSj+QmfF42V3o8dKn9JTiZb+OW5lZWPUzhSj
	wtFoEaW2GGtSF100Bd8gaEZf/jv/HDuwtaakX6yIYHztSM/GoXAg8+I2S0UoJ0yQriQy6knwEcP
	c=
X-Gm-Gg: ASbGncvroOdKhIUbfkC55jcqVn8lA/uPP5UIrgjx0XtY5/q2IZKzsfogr4MO3Ovj439
	duHaauj3S77+E+t0xv9hYlL2hXmzWWa+DIiz3nuCXCP1z0Ggr+4O8x10Ddp43xoWRCik0AoQHGk
	CcHQE3dbT2/4G73cPWwUMT5VGcNx0zGxIZ4xbIsT2xYslVMscgaIQewOTUzLM+QiCFYKqINCDMS
	UG1FSN3hyt4mSpKcf6BAcaoiA/VrnTo5iZX64iZURx3eW6F5OfneygNlfNBYa9k6Iot8VUrRmPJ
	CPud3URK/QGhltn0SuLrJ71L8vxcJT0zmpq7mIY3QnEDUTxb75T6koTvPXh8SOKOkEJ2yW/QecG
	OXTnvAfDBEXq9uw2IbUQFTDqincAVPnl+/XN1ag==
X-Received: by 2002:a05:600c:46d1:b0:43c:ec28:d310 with SMTP id 5b1f17b1804b1-43f3a93cc34mr188804805e9.10.1744737584634;
        Tue, 15 Apr 2025 10:19:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF90DLFY6+ZNm763RnpwCaCiwpAH5nBHh0Zl2YyXyyRn/SHXfAylMFrj7kqfB45/gtqduyPQQ==
X-Received: by 2002:a05:600c:46d1:b0:43c:ec28:d310 with SMTP id 5b1f17b1804b1-43f3a93cc34mr188804445e9.10.1744737584268;
        Tue, 15 Apr 2025 10:19:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625eeesm217141755e9.11.2025.04.15.10.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 10:19:43 -0700 (PDT)
Message-ID: <56d25bb1-c6ff-4e92-bbab-72c9eee8015a@redhat.com>
Date: Tue, 15 Apr 2025 19:19:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mempolicy: Optimize queue_folios_pte_range by PTE
 batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, hughd@google.com, vishal.moola@gmail.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250415145731.86281-1-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250415145731.86281-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.04.25 16:57, Dev Jain wrote:
> After the check for queue_folio_required(), the code only cares about the
> folio in the for loop, i.e the PTEs are redundant. Therefore, optimize
> this loop by skipping over a PTE batch mapping the same folio.
> 
> With a test program migrating pages of the calling process, which includes
> a mapped VMA of size 4GB with pte-mapped large folios of order-9, and
> migrating once back and forth node-0 and node-1, the average execution
> time reduces from 7.5 to 4 seconds, giving an approx 47% speedup.
> 
> v1->v2:
>   - Follow reverse xmas tree declarations
>   - Don't initialize nr
>   - Move folio_pte_batch() immediately after retrieving a normal folio
>   - increment nr_failed in one shot
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   mm/mempolicy.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index b28a1e6ae096..ca90cdcd3207 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -566,6 +566,7 @@ static void queue_folios_pmd(pmd_t *pmd, struct mm_walk *walk)
>   static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   			unsigned long end, struct mm_walk *walk)
>   {
> +	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>   	struct vm_area_struct *vma = walk->vma;
>   	struct folio *folio;
>   	struct queue_pages *qp = walk->private;
> @@ -573,6 +574,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   	pte_t *pte, *mapped_pte;
>   	pte_t ptent;
>   	spinlock_t *ptl;
> +	int max_nr, nr;
>   
>   	ptl = pmd_trans_huge_lock(pmd, vma);
>   	if (ptl) {
> @@ -586,7 +588,8 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   		walk->action = ACTION_AGAIN;
>   		return 0;
>   	}
> -	for (; addr != end; pte++, addr += PAGE_SIZE) {
> +	for (; addr != end; pte += nr, addr += nr * PAGE_SIZE) {
> +		nr = 1;
>   		ptent = ptep_get(pte);
>   		if (pte_none(ptent))
>   			continue;
> @@ -598,6 +601,11 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   		folio = vm_normal_folio(vma, addr, ptent);
>   		if (!folio || folio_is_zone_device(folio))
>   			continue;
> +		if (folio_test_large(folio) &&
> +		   (max_nr = ((end - addr) >> PAGE_SHIFT)) != 1)

That's real nasty :)

Let's simply do at the beginning of the loop:

	max_nr = (end - addr) >> PAGE_SHIFT;
	nr = 1;

Then here

if (folio_test_large(folio) && max_nr != 1)
	nr = ...

The compiler is smart enough to optimize the computation of values where 
really required.

With that

Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
Cheers,

David / dhildenb

