Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA961A239F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716634; cv=none; b=bXJoiAN+cxVrLIplkNaKbiMUoEV5GxfLbqU+7fED8FLNks3w/Diy495m0PoMzL4goJC0GEsKI7HhB0nAcMUNmstmkBHdFre/4TTXxMXxZXTnlbYnISq4ix+R6+kNh/TA0Yn1CCEobKdP7kA+duqn5D27xeeIiMW24CTe4JPEfd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716634; c=relaxed/simple;
	bh=Te3Rp66uIuDKAYOuy9D6T8Qi0yB9d4NQxWotSp9mZVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDHXwN9npXX6gBvNzz8A8vqKw/Jo00IyayN69/7PKszpoIJ7Q1y4PXMGizmlEP0XXrChCSh5zwja/cwgLyYAHlJX3kLZamsGaXjbYahkNiX7k4fC4BKoXRLnDWthQalbYPJ8kjumPxN2cKSPDftm7N+JPKw0iTAveQRg5YtobLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XU4oLeqQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XU4oLeqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746716631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0A3k4r7gW5UVXrE6QQjqPyS0bUfFQ+JNzCXgzNYHnZo=;
	b=XU4oLeqQ/ZhIdGDDOX+NYkkwq5muKvTmPThv/snaR4dROBnXXDexhj33RPnCjtrghYBVTU
	dPWkytPH4GMieRN9YY+ddLRVPZ4ILF9bN9Li4WcDHwaRyuFNWoUNj4wXy0gTFn2HgEbwvl
	jg+qf0CbsYQ+bnruDLybms5juL8uJfA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-knwAw2XPOeqQAgtNlXuLKg-1; Thu, 08 May 2025 11:03:50 -0400
X-MC-Unique: knwAw2XPOeqQAgtNlXuLKg-1
X-Mimecast-MFC-AGG-ID: knwAw2XPOeqQAgtNlXuLKg_1746716629
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a064c45f03so501299f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716629; x=1747321429;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0A3k4r7gW5UVXrE6QQjqPyS0bUfFQ+JNzCXgzNYHnZo=;
        b=i1VfDMZkU3wk60OttODHEJrfeqP8io8/rNsCog4JH2oWixobhwo/pa+uIC80xIwW7v
         fMf6bQfo2hCDg2ZtpE8S8wVtJ07OI56ebO57Y/YsYWeBEw0zIBlBUxrvHrtFCZFWf/lk
         eitbXvTR3hzMOkD7i5IKyP8CwB+XgzcMwqegKlvPH2m26mQ/BImnej1AsguG/84SQFIm
         6yzvX9s3vkRVqI1aYrTbxkN5uM4iBE1uvuNRk16NUmSWESkrA3q+J1eVkrudsaW2mz1s
         ANp88eVBdPKaJCLWt2dbU+s/WoXnSVrPd6OMEm8O2ehUfDZtIOAIilJ4uqspnqwr01mO
         Z7hg==
X-Gm-Message-State: AOJu0YwgWJGUiTj/+DKNx8teVbfd7TPsnIkjia2Nf0gqYA+kE2XUa1sM
	641VKx+kasVk/c892n44+3JK3FNmKjtFHL02x7cAHmw4S3Qq8VcYnr/XyW9sMvmgjId4VKQmBI0
	r53EPkXvxwyhjslprb6pKjC2P/QJZny0mz9cdF9QeRFqO2cQ5DqbD7Xbh5X2/vw==
X-Gm-Gg: ASbGncueHrG/p4oQo4zhUE2PwpgF8/D8bCR6Y+qrD49XPv6FE2ksDVT92bHA2/8Tsao
	xDyJ4aaaikqtWQdRiWW+ke9/3ZO/kE8J8tRzc7hGQhzPt7cnArhKy7PFIr+zhoR+LD4mAC3hNCJ
	cg6aylzw3PTpzQA55GMl0NDDMTSY0Hj/Cb7dZ78AIssREM9B828YPMHVHcrrUQIoLK9YPvjqecs
	tIvv3CkhrMJnFarF4TMc1vw6owFOaUwWZ0zrF4K5RgKWpbNqnmVyfAcOo+sM6T04nRL6HnMI30E
	NjugeHUOt032NaSbANEW3BW7PFJwD3okdHSWb38fO3NoNBA+krdU+Zw0Y2vOPno/DG8WB/fzM+t
	FVX54X+T0bLYjov3CS5dqY12ubqEJ7e1aN5U87i0=
X-Received: by 2002:a05:6000:2a7:b0:3a0:8c01:d463 with SMTP id ffacd0b85a97d-3a0b990e2b2mr3562903f8f.9.1746716628728;
        Thu, 08 May 2025 08:03:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx8yXNIhT1hUz4xWiwQQ29Va0Sgz3iLNOyvxn9tuUzOatsvNXpRv8L6O8svQ44smramfRUxQ==
X-Received: by 2002:a05:6000:2a7:b0:3a0:8c01:d463 with SMTP id ffacd0b85a97d-3a0b990e2b2mr3562840f8f.9.1746716628057;
        Thu, 08 May 2025 08:03:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2f58sm215860f8f.49.2025.05.08.08.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:03:47 -0700 (PDT)
Message-ID: <99ed92b7-c1b2-4e12-a7ee-776a7f890b47@redhat.com>
Date: Thu, 8 May 2025 17:03:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Fix zero copy I/O on __get_user_pages allocated pages
To: Pantelis Antoniou <p.antoniou@partner.samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Artem Krupotkin <artem.k@samsung.com>,
 Charles Briere <c.briere@samsung.com>,
 Wade Farnsworth <wade.farnsworth@siemens.com>, Peter Xu <peterx@redhat.com>
References: <20250507154105.763088-1-p.antoniou@partner.samsung.com>
 <CGME20250507154119uscas1p17799fe7589e4f1bd53d2d3dc7f44cb8c@uscas1p1.samsung.com>
 <20250507154105.763088-2-p.antoniou@partner.samsung.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250507154105.763088-2-p.antoniou@partner.samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.05.25 17:41, Pantelis Antoniou wrote:

Hi,

> Recent updates to net filesystems enabled zero copy operations,
> which require getting a user space page pinned.
> 
> This does not work for pages that were allocated via __get_user_pages
> and then mapped to user-space via remap_pfn_rage.

Right. Because the struct page of a VM_PFNMAP *must not be touched*. It 
has to be treated like it doesn't exist.

> 
> remap_pfn_range_internal() will turn on VM_IO | VM_PFNMAP vma bits.
> VM_PFNMAP in particular mark the pages as not having struct_page
> associated with them, which is not the case for __get_user_pages()
> 
> This in turn makes any attempt to lock a page fail, and breaking
> I/O from that address range.
> 
> This patch address it by special casing pages in those VMAs and not
> calling vm_normal_page() for them.
> 
> Signed-off-by: Pantelis Antoniou <p.antoniou@partner.samsung.com>
> ---
>   mm/gup.c | 22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 84461d384ae2..e185c18c0c81 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -833,6 +833,20 @@ static inline bool can_follow_write_pte(pte_t pte, struct page *page,
>   	return !userfaultfd_pte_wp(vma, pte);
>   }
>   
> +static struct page *gup_normal_page(struct vm_area_struct *vma,
> +		unsigned long address, pte_t pte)
> +{
> +	unsigned long pfn;
> +
> +	if (vma->vm_flags & (VM_MIXEDMAP | VM_PFNMAP)) {
> +		pfn = pte_pfn(pte);
> +		if (!pfn_valid(pfn) || is_zero_pfn(pfn) || pfn > highest_memmap_pfn)
> +			return NULL;
> +		return pfn_to_page(pfn);
> +	}
> +	return vm_normal_page(vma, address, pte);

I enjoy seeing vm_normal_page() checks in GUP code.

I don't enjoy seeing what you added before that :)

If vm_normal_page() tells you "this is not a normal", then we should not 
touch it. There is one exception: the shared zeropage.


So, unfortunately, this is wrong.

-- 
Cheers,

David / dhildenb

