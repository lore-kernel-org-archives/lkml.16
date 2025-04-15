Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00CD1F3BBC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712279; cv=none; b=D6nn2tVHBalU+jeyDscgyRj5SANFQkYs1fEN16nsbkCFXQI3loDBWmVAEtIAqP5psj5zQl9+b42NcujO5pNWK6Xcv76EGm+e8tjfYyYDDbJkakuaJsazXkYNv/zqyi+IDlLKSYy2L8csAEBT1OWs6u7vrw42OeNd+HhXc4c82zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712279; c=relaxed/simple;
	bh=cFbRZRKhGdbL0bvU2DdkHpnl8aAAq1RD0baEGY8NZNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W315nExN/vDT6B4PYqgXgQm/ScbGlBiukB2rrJdPCmtT0mw74AuHz9PRsrOL/jX6cPAA2AfRthg9a8wEpTb7/7XR2r09UJRqX25iekDXzQvjpNbToPukt7IqcwqXE8gRnZ15Sx2QRwJct23zuSqm1UUJttKJNMz3TqxQcZPZVpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H72VfRpc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H72VfRpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744712275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UhDWeoisgkuL+LDt7V1TN5LNvd/DdLM9WpzCNYFX7ps=;
	b=H72VfRpc79/VSutsbD4Un+J+067JvkReParEasregaMeAOKzPMJlk7N/pVpgbZTMfNXmr1
	sgzfNu+dYcvZx9/JhB+T2MdyeXA1QZXNCOhdbhCnDj3U+oMAgz61DxEF62SJHgmbIuo8jp
	jZMD70HqPM0zAt40UMq+sSjdS+21f+E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-7Buc5VxAN_G-y2p7pQTu8A-1; Tue, 15 Apr 2025 06:17:54 -0400
X-MC-Unique: 7Buc5VxAN_G-y2p7pQTu8A-1
X-Mimecast-MFC-AGG-ID: 7Buc5VxAN_G-y2p7pQTu8A_1744712273
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39126c3469fso2005811f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712273; x=1745317073;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UhDWeoisgkuL+LDt7V1TN5LNvd/DdLM9WpzCNYFX7ps=;
        b=qCwpfobqf21lvH/HdSNL+l+AajjroILF/2AYuOerhBsXBDAfwz8bcx18iZSDOtGdC7
         6sztF8nJkh/8W/erqHyA1CsT+IQK/dNP2g8ib5IEhq8GRPZXJWxdgbZTo98PKZdqgmbY
         JAEK5ji4peVBe/uKO4N0niBdDZP907uAPtJq971JJoIPSmXWaHSVk2El7MmB4+NoQlZ1
         tzb7xlQNiuRwzTvN8urXhY2AlyEdumFJv0sLixvDKvqtZkHyC346H9lNJeJ41maS4WTB
         cre5ViWPafw+qGmrEhNvOt+O2OqDaoiIZga2m9gBGwpeWcsz4Go34xJhD75hjNeTxMfn
         Ef2A==
X-Forwarded-Encrypted: i=1; AJvYcCVCCP0tI091VpGlUqj3YloCL7wsSrGHWgAW9g3WmEHPhMSAoN1c19DDMM2tzuNdNBCY2iJJ/rEt60lDzkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmOHdlU4yFlSWthG51hUz1zFpA1CEyVn8jueCEBecNlaEWndEm
	phQUVUYR6LzputjIoNDtHo4ZkOfmBGo7e+P2pOSVZjcS6AU8ixFEh5XfYh4ELxJeU2+upQTxOKJ
	YnYTAgZlGTaBw342KCstMAUbqQGCSwlJ1m78is4+zOjM3PrYK7OGM2vofPpAXjQ==
X-Gm-Gg: ASbGnctFceisOYpC5G5pENA7FUgXfL8/qSh1p6716byXVPh0BOrsnDjEoRFIfvLicbd
	qz0mlBUqB57aTn/HoqmC33yGIoTsXt/5rq9DWE1H6QP2gdHSpBu47BIBG0hfVFtGhpF926bJXC+
	64b76+abnQTME+1XLU2Gk3+U75wlgXXffE7NJa/8vFGzpNdZeAGGBXumr0Oe4PrnjpgxBj9mP5I
	YbeoZvJGOAEN2b9/EYNygvSGJooz0R+tdNu9q2kuwLJC39rCv7xoOdod8e1ct182Iv9a2zLkop+
	804JAZ4Gwvs//RczjNyx/9/ZtX1w4PUyXctVm6hKaJ1zi0F00H6XG+VLLt8VxelPn1IFOOUGCJ2
	mKRN0EqGbUt5YWd9Rvwu4Tf3cBjSD0GSiieGwbg==
X-Received: by 2002:a05:6000:144d:b0:391:4999:776c with SMTP id ffacd0b85a97d-39eaaecdb44mr13308815f8f.40.1744712273111;
        Tue, 15 Apr 2025 03:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+m/vZLEigaFrpxid7/oezrvwYKf74dyF+/Grsi/KR+MczRYYDOjAiKGjT20DFE5nES4asfg==
X-Received: by 2002:a05:6000:144d:b0:391:4999:776c with SMTP id ffacd0b85a97d-39eaaecdb44mr13308799f8f.40.1744712272754;
        Tue, 15 Apr 2025 03:17:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c70csm13938263f8f.38.2025.04.15.03.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:17:52 -0700 (PDT)
Message-ID: <09c77ab5-65fc-4bca-a7e5-2b11bba9330d@redhat.com>
Date: Tue, 15 Apr 2025 12:17:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mempolicy: Optimize queue_folios_pte_range by PTE
 batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, hughd@google.com, vishal.moola@gmail.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250411081301.8533-1-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250411081301.8533-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.04.25 10:13, Dev Jain wrote:
> After the check for queue_folio_required(), the code only cares about the
> folio in the for loop, i.e the PTEs are redundant. Therefore, optimize this
> loop by skipping over a PTE batch mapping the same folio.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> Unfortunately I have only build tested this since my test environment is
> broken.
> 
>   mm/mempolicy.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index b28a1e6ae096..b019524da8a2 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -573,6 +573,9 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   	pte_t *pte, *mapped_pte;
>   	pte_t ptent;
>   	spinlock_t *ptl;
> +	int max_nr;
> +	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	int nr = 1;

Try sticking to reverse xmas tree, please. (not completely the case 
here, but fpb_flags can easily be moved all he way to the top)

Also, why are you initializing nr to 1 here if you reinitialize it below?

>   
 >   	ptl = pmd_trans_huge_lock(pmd, vma);>   	if (ptl) {
> @@ -586,7 +589,8 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   		walk->action = ACTION_AGAIN;
>   		return 0;
>   	}
 > -	for (; addr != end; pte++, addr += PAGE_SIZE) {> +	for (; addr != 
end; pte += nr, addr += nr * PAGE_SIZE) {
> +		nr = 1;
>   		ptent = ptep_get(pte);
>   		if (pte_none(ptent))
>   			continue;
> @@ -607,6 +611,11 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   		if (!queue_folio_required(folio, qp))
>   			continue;
>   		if (folio_test_large(folio)) {
> +			max_nr = (end - addr) >> PAGE_SHIFT;
> +			if (max_nr != 1)
> +				nr = folio_pte_batch(folio, addr, pte, ptent,
> +						     max_nr, fpb_flags,
> +						     NULL, NULL, NULL);

We should probably do that immediately after we verified that 
vm_normal_folio() have us something reasonable.

>   			/*
>   			 * A large folio can only be isolated from LRU once,
>   			 * but may be mapped by many PTEs (and Copy-On-Write may
> @@ -633,6 +642,7 @@ static int queue_folios_pte_range(pmd_t *pmd, unsigned long addr,
>   			qp->nr_failed++;
>   			if (strictly_unmovable(flags))
>   				break;
> +			qp->nr_failed += nr - 1;

Can't we do qp->nr_failed += nr; above?

Weird enough, queue_folios_pmd() also only does qp->nr_failed++, but 
queue_pages_range() documents it that way.

>   		}
>   	}
>   	pte_unmap_unlock(mapped_pte, ptl);


-- 
Cheers,

David / dhildenb

