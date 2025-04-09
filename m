Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF23254AF2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744191968; cv=none; b=ZRjILLeYYrsjka5uvDMcAz0KNs9nM13OKoWUw7lnKi62ngsBwZcNo8/vD7xnApBX+W9hJLNcCcrLeUOUFnJNdvv53ukPEZxT027t7/S3KN8mrfqhyVN7pste+3wMItGlbNFXCpaAcp5QeVTxGoiZq7MUoyd4zmt1rpgTPDctsHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744191968; c=relaxed/simple;
	bh=3ySdHubyWVioKzmGVmpCbUC86IJUOXMKCbZ1JQ7EK/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWOmXIms/ffxtxrFjYIvYuqH4Pj1tHqBC4Wshatt5gRL3SWx3gCr2jPqVETEZxu6ChiZhtrGJBK6TghERyFps2oEZyBdvLKj6PIhXjUQLbpARDPgOowoR5AMJFoMl1Rg2eCH0c76r6jDMEvowizzSOfquNbrED1BJBjp+xBv7SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G1viapXS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G1viapXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744191965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=w6JJ1MNEwPIbvtLy4zjASq6QnAsVV1RrzVqZvnN2Xi4=;
	b=G1viapXSwV6RgsUmLmfLxIZ9u51sKV3JxIgS5i7uffOrzmYK7AdxaVtUhyVjZg8/iKcUb0
	ea8ylvk2tBNbL+Q/XGDnIKDfIAddzEDXuM2H9EIT8q4rjW2oynAgPG0n56yTiSadB4XWot
	RahOmlnLF7ZYMSOH76WqkhG87LkK8To=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-F-9VQhtNNh6BS24YIfhqdQ-1; Wed, 09 Apr 2025 05:46:04 -0400
X-MC-Unique: F-9VQhtNNh6BS24YIfhqdQ-1
X-Mimecast-MFC-AGG-ID: F-9VQhtNNh6BS24YIfhqdQ_1744191963
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43f251dc364so1976865e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744191963; x=1744796763;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w6JJ1MNEwPIbvtLy4zjASq6QnAsVV1RrzVqZvnN2Xi4=;
        b=m6jN2D+IF0sbPeoMODjVhopvlEtSFwDUSyTDvnMD+RGRf/eW0ke4lZ6QX6dZGHwAbo
         CzYhyf3LkAKbAmXeeW/wCnx7aAqlgm0ibkP2/tcVEJP6hdUBsniowXJ1HlTHWFMbEX0q
         Sqe27g6Uc5OuTAesAC4q4GVsckG+7cWMlyyCg73ZHNv3omVDJqKeVJ2g2IfHJ/JfTl6a
         cJV5RFzXUr1eaFbO02MO9WW9GwdOQpVTnsSp6wefeN2boWjHIliHH+RAMmge4EVKlYY2
         QORcTrRZMd4sEPuZLk2sFyJi595Qrw7kKyopq16rmbiSl6b/MsD8yPOHrYf+WtzkJFIb
         6H2g==
X-Forwarded-Encrypted: i=1; AJvYcCUzmrJp5QY6M+gC62E6C2NuyHmhVxn2P3Jg18Nkwolose1N/HJZNvrpC3YxX+11c3bdOFC3xYCBTSnJG7c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxepb5p+Vf5LtpAvcERiOHegGo6nTMSG2aET792OaA46VkVP4F
	RL+o9AxoQ6ioCDAB+xY9qs1oVkVEoiG4i+jTazT9Uo91tos8y3tbBiJhAcQtvMZk6lEWL+cBEC5
	LYKAJux/tH/gOZTb9ev0h2AFR8A9lgMSIISJXYDzluBMBWMDDg9F2jpj6BezcAg==
X-Gm-Gg: ASbGncvNNILnUijCbFzGnRFUB+xlLyKZhV0PxnQ3VKNYA9XmSFBWyfTza6rRnEUGXNv
	uXidzXBrxA2jiHF45TRq71YfBx0ht/VhJiQiJnWmaTM86ubKgT7no3VOoKIKG30Uli6u/znFIzS
	+F+8T6xK9je8NzDD2lwPwlMVBaeQUAf4bxdrHUVEE4U/xadmNXvZ5GLkiqtzxYxRycIRMdyzHC7
	qBAPktb/SVidAUL/ReVfEE6PG4szMeWPXphWzirY2GQZJZX8LpVARStn2EtAk2YO8Zg2fDKxQxK
	ljvuS4dOianwqfNECY7fMcJ+XSBRsURjZ1x+3zzZDITEL0CyVHttEycd9TLUH0KZkayE+yhm93z
	0pL2UnOcayhs8a8MSQg2NHHFxr5I9zqdg7g==
X-Received: by 2002:a05:600c:310b:b0:43d:4e9:27fe with SMTP id 5b1f17b1804b1-43f1ecad6f5mr18336245e9.8.1744191963099;
        Wed, 09 Apr 2025 02:46:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNrjXrhVZX8m4ksxZSc0Ec3By6f6KOl5fSHobVTlhi22MQimlCyJQ5zisL/YtRzWcCv1apuA==
X-Received: by 2002:a05:600c:310b:b0:43d:4e9:27fe with SMTP id 5b1f17b1804b1-43f1ecad6f5mr18336005e9.8.1744191962661;
        Wed, 09 Apr 2025 02:46:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70d:8400:ed9b:a3a:88e5:c6a? (p200300cbc70d8400ed9b0a3a88e50c6a.dip0.t-ipconnect.de. [2003:cb:c70d:8400:ed9b:a3a:88e5:c6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fff15sm1116208f8f.95.2025.04.09.02.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 02:46:02 -0700 (PDT)
Message-ID: <39176ab9-33d5-4919-b368-2fd2467f08fe@redhat.com>
Date: Wed, 9 Apr 2025 11:46:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: huge_memory: add folio_mark_accessed() when zapping
 file THP
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: willy@infradead.org, hannes@cmpxchg.org, 21cnbao@gmail.com,
 ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <fc117f60d7b686f87067f36a0ef7cdbc3a78109c.1744190345.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fc117f60d7b686f87067f36a0ef7cdbc3a78109c.1744190345.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.04.25 11:38, Baolin Wang wrote:
> When investigating performance issues during file folio unmap, I noticed some
> behavioral differences in handling non-PMD-sized folios and PMD-sized folios.
> For non-PMD-sized file folios, it will call folio_mark_accessed() to mark the
> folio as having seen activity, but this is not done for PMD-sized folios.
> 
> This might not cause obvious issues, but a potential problem could be that,
> it might lead to reclaim hot file folios under memory pressure, as quoted
> from Johannes:
> 
> "
> Sometimes file contents are only accessed through relatively short-lived
> mappings. But they can nevertheless be accessed a lot and be hot. It's
> important to not lose that information on unmap, and end up kicking out a
> frequently used cache page.
> "
> 
> Therefore, we should also add folio_mark_accessed() for PMD-sized file
> folios when unmapping.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> ---
> Changes from RFC:
>   - Update the commit message, per Johannes.
>   - Collect Acked tags from Johannes and Zi. Thanks.
> ---
>   mm/huge_memory.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2a47682d1ab7..955781b4e946 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2260,6 +2260,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   				zap_deposited_table(tlb->mm, pmd);
>   			add_mm_counter(tlb->mm, mm_counter_file(folio),
>   				       -HPAGE_PMD_NR);
> +
> +			if (flush_needed && pmd_young(orig_pmd) &&
> +			    likely(vma_has_recency(vma)))
> +				folio_mark_accessed(folio);

So the flush_needed check is really just a pmd_present() check. (the 
latter would be clearer, but I don't mind)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

