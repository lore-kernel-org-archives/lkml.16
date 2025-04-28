Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83211BE67
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824709; cv=none; b=lRHZ2SxqPHw2RQAzNF0/iqJ3RJbs+02+rAN1wg/WbkdeDEdTJaKNPcnMpjuzqgrepdMSdlee411DENb1bkXsdj9uhZjcGYJeWkfYSBcFm0ZykbnjFagJGj5TS1X6AXm/8vz0XcUoufeYBrUHHfU1WIbBQNmzuJrEVECcM0Vl5zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824709; c=relaxed/simple;
	bh=rM/M8U4Sk55XVsH8oXK18HsR+za+YhR8lTHSsQQ7e0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prmUUSH1FQRgrM2wtZX0g4cP83GrVk6Ymm4Zf9wIwoc07s/NEzeV+136soD+PW8iT7fBXQMwSUQWbWSNP/trg72IUd/a1VCpfgGokWz3nt6YQGiJAC11z0bPGLVBVIJkCEfz4+5ihqUOK/o0Sti1Hqiy/y6RWJopwKePfKSY+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SjjwhZaE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SjjwhZaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745824706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Hl/eg/Xd5t08sY71UU5pvHE5cX2PnfJ+PDNMH8JdN/k=;
	b=SjjwhZaEGkylmLx813mP2PliJmTrDrLPDJDo44HFsyIln/Ra2UPYDeAt3bAMwT/bCN8yuk
	/O+GH8SBPmTE7JgA6Nt+vVvNRg6blAnW4ofMZYip6dfgX+nbDQOVGJyC56I34OvQaTCH4O
	8BCWRhHESNcmoVgZgnzNtc8apzE9HxM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-t2BI90JqOZ2qKy03bkc34w-1; Mon, 28 Apr 2025 03:18:22 -0400
X-MC-Unique: t2BI90JqOZ2qKy03bkc34w-1
X-Mimecast-MFC-AGG-ID: t2BI90JqOZ2qKy03bkc34w_1745824701
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912b54611dso2218106f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824701; x=1746429501;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hl/eg/Xd5t08sY71UU5pvHE5cX2PnfJ+PDNMH8JdN/k=;
        b=ZPPo7i4jrEGG/TV7PADsvmFqEaqj8skJ1rwQABoGcfP5skliySIdLA9nrDvwbQSToU
         6ybE8OrgGu35vBH7oEMf8BnfAa5kp9bvHs6LA4N23eIpvyxmEFKbDEbQuaRbIFB6SZ4P
         MmaruoZTM0YNGkGyKZGXCwUPQcKj1CmocODlEGj6rnZWP+26b+Npm4lHewWdvR58oYjr
         yr2tyDIiu1Qr3IBiScLbI3t+U/GkjpCoC01IPrg/pUeLvMzLlWPwnjfadR7R5Z9I7CtF
         2kU3MWUJDD2cp5qBbHv5QjbUCeSf82xys/cEuyIF6VTY5HydXAGjVbgjgW0gK9w0m1ui
         s7xQ==
X-Gm-Message-State: AOJu0YyklfM0TITHxFl64OrytMDEQHoJTYrg1jmE8IahN7nCXEmBLGkX
	QXkeQZHjXFTU/2TgMWerBtjQWHa9WQeaOSUZ4XGLSpyMrSwKDB2LV5tvqJ91fjhmkdjY+sV9Eds
	tX/vlXf9wPMCSXdC59VBm2zH+feWUATd+AOYph7xT8LWV1qyAoCoYWLYAbZxQ5VsXN2Kzmw==
X-Gm-Gg: ASbGncuZKYjNljjWZii7ko+1HgCJP+a/qIhFVC3Yb5jY0qwfYCY989XkLKX3EbQ5anL
	b+6iSmgVJDMps4DvB+XXmwJxHu3Le6ItmGI2mes2FgbyOxgpTluY/Zt0sy3aqQxEuXSUG684HeK
	IkTM3bQPuad05yTaTUW03CJAW7oJqCuGelZ1+SBWnTcB2AaftxZihz2mVy8Q4KQvtpK6+kxn4uj
	VAhRJIrKpIDh9GNtQyiQv9Y2gPfsRHJTD0Nz7O5Hd31nJRy7bXp01kR9RBe6HDlCzjeWDBuoO/D
	s0/MCcjscMVmczUuzqW5jmIi+FWW4s9WLuj+dir8sAaiamsmoy7Zcxb0Dy0LZS5X8lsYtdwlyvL
	ZIQsNuPsHnmxbnPIfkx1y1s/42YJ+gCJXpZv8Bgg=
X-Received: by 2002:a5d:5f82:0:b0:39c:30d9:3b5c with SMTP id ffacd0b85a97d-3a074f39730mr8804938f8f.39.1745824701045;
        Mon, 28 Apr 2025 00:18:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Z9SYwV7X/D46qnbh7MvRm+KRJA6BuSKYTHlRlSf9NZYpN57m1RNCkvqmYsbjHqGLwnfpgA==
X-Received: by 2002:a5d:5f82:0:b0:39c:30d9:3b5c with SMTP id ffacd0b85a97d-3a074f39730mr8804905f8f.39.1745824700642;
        Mon, 28 Apr 2025 00:18:20 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e198sm10475664f8f.97.2025.04.28.00.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:18:20 -0700 (PDT)
Message-ID: <f93dd717-f382-4fbf-a7cb-d9a395e283f2@redhat.com>
Date: Mon, 28 Apr 2025 09:18:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm/io-mapping: precompute remap protection flags for
 clarity
To: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rppt@kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, harry.yoo@oracle.com,
 riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
References: <20250427100442.958352-1-ye.liu@linux.dev>
 <20250427100442.958352-2-ye.liu@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250427100442.958352-2-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.04.25 12:04, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> In io_mapping_map_user(), precompute the page protection flags in a local
> variable before calling remap_pfn_range_notrack().
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>   mm/io-mapping.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/io-mapping.c b/mm/io-mapping.c
> index 01b362799930..f44a6a134712 100644
> --- a/mm/io-mapping.c
> +++ b/mm/io-mapping.c
> @@ -21,9 +21,10 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
>   	if (WARN_ON_ONCE((vma->vm_flags & expected_flags) != expected_flags))
>   		return -EINVAL;
>   
> +	pgprot_t remap_prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
> +				       (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK));
> +
>   	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
> -	return remap_pfn_range_notrack(vma, addr, pfn, size,
> -		__pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
> -			 (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK)));
> +	return remap_pfn_range_notrack(vma, addr, pfn, size, remap_prot);
>   }
>   EXPORT_SYMBOL_GPL(io_mapping_map_user);

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

