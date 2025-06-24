Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622C32D29CD
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773529; cv=none; b=t//PKHqPwcHFKVLEWWtd5XbaHegiTIOfU0CvU122Yzt0au/m6vJgj2b9gs9mja3cmofHYbN77daqgbMdI0pDtHiaPP+e1eIBzkSA3xBQqKs46w7zOMkG/iYhFSQGxBVSdLiHDSvq7VBv/ANjNBWj4FYpzD4Vqf/KKbtfRD+6GAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773529; c=relaxed/simple;
	bh=XUt8M7Qj0XAX/j53u7KBrdb/VCy0WfTxYiKyGRKRaZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GF1V7edzIR6NLCZNyMpsGSHjklqYcigBoDXJxb8ZcTs8fdFgCWJqRatfdkCJ+AodFdx8znLuPtskkOA7wNVxffM7GN8RUL+9zuTDVjFfFBKKCCU1zslQ+WyTZi/R8gpm9TCymvBMLX4tOHL9u0Pf0j7KjCcg/crz14qFJorPmhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=crJapZjC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="crJapZjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750773526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=do7xolh+n7ZDTTjkYvfnEj8eQ9HN2pJMkNxgs8hBa7c=;
	b=crJapZjCC04E3kGEnWQfRdwAzoZbQwmYaIe3jvmC/sEr/WzMMGlM6MWqU4osA6fGsX5KrV
	ePNMU5TAJixU/t6pTYiUlcG46fpLicd4EekJwX7Q63VWI3gt3/Cv2BWGxfJI3yuaFPHAZu
	ARuYxMiYQ8hwcYgdpIRKZsdyBay8U3U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-Iymv_2DRPzmyT7TM7SLcWQ-1; Tue, 24 Jun 2025 09:58:45 -0400
X-MC-Unique: Iymv_2DRPzmyT7TM7SLcWQ-1
X-Mimecast-MFC-AGG-ID: Iymv_2DRPzmyT7TM7SLcWQ_1750773524
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4535ad64d30so43706285e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773523; x=1751378323;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=do7xolh+n7ZDTTjkYvfnEj8eQ9HN2pJMkNxgs8hBa7c=;
        b=ChGcWaI1TflYvemk/BQ91q3cPFDvgsBu7TBeEWlq51t1jnaMiXydsYxvvOIMSzlbqe
         FIz9Qsbwpx1eKf3msLeG7UUJNITWTxO9vxPygXRiu/SaDPPpz2UXGbwYKNT5sVAhzwM/
         TRGHg6pD2oKhY7QokUy4tckhkTI9uZpYKOXM7BdgV3IUfMxDHZds7i43JWEXyiKwZ2H4
         Q8ELNTKp65zyhXsZpn6SykiWM0qxZnw7xkQzdd8iJN9giNPpTNYjRbfKq/R2AdNC2eqQ
         787wQC2kmkUKEaEZpv80/aQ+cp7qN0vFSbD5vPDKYHziXcW1AaqQGRvFJtP6UYPVYXZ4
         0vyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvZVSmus+seQwzperl0+XA/iCP8rnmwNFI+qzfYDtkjemmYLxcFr8DJf72CGFVt3dKe39yGmpr/6Wzj+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/31PtimI8AAX6aZMANyIi8ykp4s8het7QTl7XIYEXlrppfMxH
	x/0AT/hwTO92iQD2hjjvSyx8/wb/x4KtQAQIimPEzRqOw9TQPvmPSfDXMVtJXdqnRrca7ghvnvx
	aGir2KluZYsxs5xOkGvUkVQHwHo7Mg0XYjY92ZyCOPWqDdjB4JU2ydOrR2W67yUm2Qw==
X-Gm-Gg: ASbGncuO44jaX2o50Zq7KKIkjycTAt0iM4hGdprNDCKqG+YebwyX+kk1ugmDAOWZsT8
	RccTptk57flyqH/+G+vDpivmr49JREI+twrM8EC3CvB8C87cFi6gffy8/UmGe59wvFeehKR/Ops
	LonoEEmoahLepWlU2TrdKwFpCOB+k2zFGanwoS1khBQhd1fyCL7MESvZj0jU8ecKhFeEe12aY30
	MdO9J41eXL+u5m4/Brgs7s97N33e4MQCz85xZIZGhsRZYMb20Sg8hp7VrldQiwSLmdhnd521OzK
	4CwqdvFL0YlzAcvoMavy7Dc1Nmtnv1hPXMWndhl0tIVioJcPZUFmhGA=
X-Received: by 2002:a05:600c:138e:b0:453:6150:de41 with SMTP id 5b1f17b1804b1-453659ccfafmr171023145e9.17.1750773523575;
        Tue, 24 Jun 2025 06:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTVtMD9TDbpb2clIdQ7As+1c0S2YPRV6Ex1Dat+6mQ8VVibEFezYD225fY43gmnIFL0Ftmzg==
X-Received: by 2002:a05:600c:138e:b0:453:6150:de41 with SMTP id 5b1f17b1804b1-453659ccfafmr171022855e9.17.1750773523151;
        Tue, 24 Jun 2025 06:58:43 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535fdf82f9sm171243685e9.29.2025.06.24.06.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:58:42 -0700 (PDT)
Message-ID: <e6e20d9e-ceb4-4e18-8859-5255ef1aa525@redhat.com>
Date: Tue, 24 Jun 2025 15:58:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm, madvise: simplify anon_name handling
To: Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-1-600075462a11@suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250624-anon_name_cleanup-v2-1-600075462a11@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.06.25 15:03, Vlastimil Babka wrote:
> Since the introduction in 9a10064f5625 ("mm: add a field to store names
> for private anonymous memory") the code to set anon_name on a vma has
> been using madvise_update_vma() to call replace_anon_vma_name(). Since
> the former is called also by a number of other madvise behaviours that
> do not set a new anon_name, they have been passing the existing
> anon_name of the vma to make replace_vma_anon_name() a no-op.
> 
> This is rather wasteful as it needs anon_vma_name_eq() to determine the
> no-op situations, and checks for when replace_vma_anon_name() is allowed
> (the vma is anon/shmem) duplicate the checks already done earlier in
> madvise_vma_behavior(). It has also lead to commit 942341dcc574 ("mm:
> fix use-after-free when anon vma name is used after vma is freed")
> adding anon_name refcount get/put operations exactly to the cases that
> actually do not change anon_name - just so the replace_vma_anon_name()
> can keep safely determining it has nothing to do.
> 
> The recent madvise cleanups made this suboptimal handling very obvious,
> but happily also allow for an easy fix. madvise_update_vma() now has the
> complete information whether it's been called to set a new anon_name, so
> stop passing it the existing vma's name and doing the refcount get/put
> in its only caller madvise_vma_behavior().
> 
> In madvise_update_vma() itself, limit calling of replace_anon_vma_name()
> only to cases where we are setting a new name, otherwise we know it's a
> no-op. We can rely solely on the __MADV_SET_ANON_VMA_NAME behaviour and
> can remove the duplicate checks for vma being anon/shmem that were done
> already in madvise_vma_behavior().
> 
> Additionally, by using vma_modify_flags() when not modifying the
> anon_name, avoid explicitly passing the existing vma's anon_name and
> storing a pointer to it in struct madv_behavior or a local variable.
> This prevents the danger of accessing a freed anon_name after vma
> merging, previously fixed by commit 942341dcc574.
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>   mm/madvise.c | 37 +++++++++++++------------------------
>   1 file changed, 13 insertions(+), 24 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 4491bf080f55d6d1aeffb2ff0b8fdd28904af950..fca0e9b3e844ad766e83ac04cc0d7f4099c74005 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -176,25 +176,29 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>   }
>   #endif /* CONFIG_ANON_VMA_NAME */
>   /*
> - * Update the vm_flags on region of a vma, splitting it or merging it as
> - * necessary.  Must be called with mmap_lock held for writing;
> - * Caller should ensure anon_name stability by raising its refcount even when
> - * anon_name belongs to a valid vma because this function might free that vma.
> + * Update the vm_flags and/or anon_name on region of a vma, splitting it or
> + * merging it as necessary. Must be called with mmap_lock held for writing.
>    */
>   static int madvise_update_vma(vm_flags_t new_flags,
>   		struct madvise_behavior *madv_behavior)
>   {
> -	int error;
>   	struct vm_area_struct *vma = madv_behavior->vma;
>   	struct madvise_behavior_range *range = &madv_behavior->range;
>   	struct anon_vma_name *anon_name = madv_behavior->anon_name;
> +	bool set_new_anon_name = madv_behavior->behavior == __MADV_SET_ANON_VMA_NAME;
>   	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
>   
> -	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name))
> +	if (new_flags == vma->vm_flags && (!set_new_anon_name ||
> +			anon_vma_name_eq(anon_vma_name(vma), anon_name)))
>   		return 0;
>   
> -	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
> +	if (set_new_anon_name)
> +		vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
>   			range->start, range->end, new_flags, anon_name);
> +	else
> +		vma = vma_modify_flags(&vmi, madv_behavior->prev, vma,
> +			range->start, range->end, new_flags);
> +
>   	if (IS_ERR(vma))
>   		return PTR_ERR(vma);
>   
> @@ -203,11 +207,8 @@ static int madvise_update_vma(vm_flags_t new_flags,
>   	/* vm_flags is protected by the mmap_lock held in write mode. */
>   	vma_start_write(vma);
>   	vm_flags_reset(vma, new_flags);
> -	if (!vma->vm_file || vma_is_anon_shmem(vma)) {
> -		error = replace_anon_vma_name(vma, anon_name);
> -		if (error)
> -			return error;
> -	}
> +	if (set_new_anon_name)
> +		return replace_anon_vma_name(vma, anon_name);

Took me a second to find where this is already checked (-> 
madvise_vma_behavior()).

:)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

