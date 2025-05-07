Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638401F91C5
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612243; cv=none; b=LZ687EeKC7NasbTf9VKuKavxFG49Rbnezkgk+PZ9Mc/KWw39L6W8TJ9pFjDcXRiFvtfLDFQnGkp+ZBqhTCbfXTrQjowH+3d/1zhz5F0L5wxgpx96SND9dyYj3YwRwjXzMugqKP/yvoxHPDUisvB6QrC5JEgIbwZexNsBzO84tGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612243; c=relaxed/simple;
	bh=gxUcvFxEQeJRVHZYs1wmm3YXWJopX57fSlVbCJPBuUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgA/ygCgLlgaXYpBvEDnlUGcOQA036D77Rs+4lJcFNWZd7wJW+Ch3E6rlv7ZKCaDZPcHT5C4IvM5jywXGTGzcibdzN3D13OOBC0FtyPbuoBcnzf8tUglOdTnsn3Jt7fA3Vs2QEn2+eNgyIGdkauo4WaNOf0VG4Z3gt3hODbZuhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h4PIdtza; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h4PIdtza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746612240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=g2GMveolPb6LRUsn8jg9kY20Vuq+7rnnOeA0xnqllL0=;
	b=h4PIdtzag1xy/tw8+b/JFqF3AaG+v/mi/Dt2pDjneaI5v8R8XaviSZWfkHTiYE9SnUIjio
	AnXvXl4/HwfXqKfUkpgd7HYk5vyxN9d2piRUNr6vP6jGAoSCAaqQKuuRVWWC9ELpccXTKY
	sYjKXBq/f4/BtGDU095qFlwOfo9n56w=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-oLeVX5EqP52tfrRZG2aPmA-1; Wed, 07 May 2025 06:03:58 -0400
X-MC-Unique: oLeVX5EqP52tfrRZG2aPmA-1
X-Mimecast-MFC-AGG-ID: oLeVX5EqP52tfrRZG2aPmA_1746612238
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73e0094706bso9411155b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 03:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746612238; x=1747217038;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g2GMveolPb6LRUsn8jg9kY20Vuq+7rnnOeA0xnqllL0=;
        b=IvI6VLdHd1hjb5RRr6SRPn0IB6xW4svmfKaiR4ob7rURLlGvN+3OWA6LDaVIrTEMEo
         ikDAMhJAEbDRtebI21nNqQ+89T6zWSIZx4BwRbnlOyn9+sjeA9k4FqfsD4l6OudnROUB
         y3VNooiw6l5EDik5QhJzPgSoK/nbClwyQFSJ2XQnwls4iqrUf4+QSe6QO1pw+5hm5jJ+
         Gldg/MzriNXjj92GR5ImDUxWTNZr2X5dnaX2QG0UCThJPzkOzPUfexSuGCf+N4osZwue
         2s+9ancZxEFKNab9KGyhFqHJNcMNGp19eG+47d13PPTMH4649TJ2UTN9F1UlucnD7nAE
         nBYA==
X-Forwarded-Encrypted: i=1; AJvYcCUAKVclNLs4kcdMZDW4jdvsUllHboJlLBadyn8HEkSL90T/oD2H8oo8fQFMZfOlpHFyLryQVpVmXmmAmes=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAlp+iQ6bSOp9b4Oic1A/8AWXwIC2JJYljmOiAaNDp2/Ivr457
	Bggz4FW2cYFuq1h75+7BGLTP0OcfOzSwzb9XYlS/vq0YI7q94s2bUfA2dj8VDjk8N7vrHSlNRgL
	emdJR8/0mUX4XEMSO6/iLKosHJym56lIhcy2xIsSpOkUSnxN1re3hT/4z5wXr2Q==
X-Gm-Gg: ASbGnctFOBnBhswNN83ZVArdLU6t+tpjKx+zgZWRMpQUAKVgKDuMjG5POArZNNCPXbE
	Ja5vOQS905poy0xp47HhrjZMSbsHYFOeI/2HvDYoVfIvGuS83uFt8f5+14TJ+Ot/l6m2i4XltsO
	OcOU7QXKGhxDFrXJo3Eo3kw6nj19GjmbufitRetcT8eqtnMT89pGsgKnd+8ZebVPRf1m7MRc5Oe
	0dAd+bsYLvC9oj54bV1yL6bEm5cjYSPSxWb7xLjo1Hr2VY1d9fO6Nm8MVTHU6g2B559850CMAFo
	RI1/DpTQekuHyhzGDAyZv9aOuuf50VegzzRJNPDPOUF2on9PowHnglwCv9yxzhOFPUptvsH7Qn1
	Vwmxv9jlmKyZu2MiN1oLgN+hozQMmq3zUgXGi400=
X-Received: by 2002:a05:6a00:aa0d:b0:740:6f80:f855 with SMTP id d2e1a72fcca58-7409cf4da96mr3526153b3a.9.1746612237657;
        Wed, 07 May 2025 03:03:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4UReti3rSlLm3lWeDjiRifY6cYVSAxWVuPyBTUTuuwK3fjisXS8OHpAIhItY594wcDbECvA==
X-Received: by 2002:a05:6a00:aa0d:b0:740:6f80:f855 with SMTP id d2e1a72fcca58-7409cf4da96mr3526134b3a.9.1746612237313;
        Wed, 07 May 2025 03:03:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:d400:ed3c:fb0c:1ec0:c628? (p200300d82f12d400ed3cfb0c1ec0c628.dip0.t-ipconnect.de. [2003:d8:2f12:d400:ed3c:fb0c:1ec0:c628])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058deb363sm10783439b3a.73.2025.05.07.03.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 03:03:56 -0700 (PDT)
Message-ID: <887fb371-409e-4dad-b4ff-38b85bfddf95@redhat.com>
Date: Wed, 7 May 2025 12:03:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm: Add generic helper to hint a large folio
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-3-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250506050056.59250-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.05.25 07:00, Dev Jain wrote:
> To use PTE batching, we want to determine whether the folio mapped by
> the PTE is large, thus requiring the use of vm_normal_folio(). We want
> to avoid the cost of vm_normal_folio() if the code path doesn't already
> require the folio. For arm64, pte_batch_hint() does the job. To generalize
> this hint, add a helper which will determine whether two consecutive PTEs
> point to consecutive PFNs, in which case there is a high probability that
> the underlying folio is large.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>   include/linux/pgtable.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b50447ef1c92..28e21fcc7837 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -369,6 +369,22 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>   }
>   #endif
>   
> +/* Caller must ensure that ptep + 1 exists */
> +static inline bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
> +{
> +	pte_t *next_ptep, next_pte;
> +
> +	if (pte_batch_hint(ptep, pte) != 1)
> +		return true;
> +
> +	next_ptep = ptep + 1;
> +	next_pte = ptep_get(next_ptep);
> +	if (!pte_present(next_pte))
> +		return false;
> +
> +	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == PAGE_SIZE);
> +}

So, where we want to use that is:

if (pte_present(old_pte)) {
	if ((max_nr != 1) && maybe_contiguous_pte_pfns(old_ptep, old_pte)) {
		struct folio *folio = vm_normal_folio(vma, old_addr, old_pte);

		if (folio && folio_test_large(folio))
			nr = folio_pte_batch(folio, old_addr, old_ptep,
					     old_pte, max_nr, fpb_flags, NULL, NULL, NULL);
	}
}

where we won't need the folio later. But want it all part of the same folio?


And the simpler version would be


if (pte_present(old_pte)) {
	if (max_nr != 1) {
		struct folio *folio = vm_normal_folio(vma, old_addr, old_pte);

		if (folio && folio_test_large(folio))
			nr = folio_pte_batch(folio, old_addr, old_ptep,
					     old_pte, max_nr, fpb_flags, NULL, NULL, NULL);
	}
}


Two things come to mind:

(1) Do we *really* care about the vm_normal_folio() + folio_test_large() call that much, that you
have to add this optimization ahead of times ? :)

(2) Do we really need "must be part of the same folio", or could be just batch over present
ptes that map consecutive PFNs? In that case, a helper that avoids folio_pte_batch() completely
might be better.

-- 
Cheers,

David / dhildenb

