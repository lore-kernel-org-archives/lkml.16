Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7101918EFD4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771429; cv=none; b=ucXlS9E747XU5iEKGnBw38qaCuic8OE0gpzl6YbgmUBaZEqgHd+WzSX+K10RAfQ870ur8uR9xEaelHzGQ/pMBvxCymaulPZXwCJH33PkcSahHU6hRkijDkWjtq5gp5WF2tSdCAgWVpzll0y4DRo7b1+aGjPWyCUPsTRbpRAMZf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771429; c=relaxed/simple;
	bh=/5WnD2pyHsPRtA1mr4QsqnK6gJ0k5VrM/vH2/p9t0vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2g4/m7h+S0v+RNr4L3QytHTJ6Em/+O6t5xy0nJdkSHBxwr0l8bpCwfybwCGV5HXfjpsb3W7PqvfAX+/ih1hyqIdsmIePKS8sq01n7qQA+v9btYXdB3q7ZnLzMFcMaNqb9en1CpMOBbXvKuH0XoGowFCMaD9fXldzyXfoC1Y+IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W/m5ye6B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W/m5ye6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743771426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q3DMfaX7enMK+CS7Fw8aqK7Kb4zBw5LAQWIhlF/2oKY=;
	b=W/m5ye6BAMjdyUPwYUi3MY6Ue4voDXa/DnXL2mY45icYLVomJeYYxKBJnR+krk+tM50uXB
	vPZrq3fDAsjhzH1Fd708AAzRl4mSXFlx1gJ+9OmXxV/+KXK7VWSZcWvdwPYJcQTOFZqw6T
	Khec+bBZ3J0l03RSPCCctqqtSB3l7xw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-VM5dcx03OCmd5uCZquGSLw-1; Fri, 04 Apr 2025 08:57:05 -0400
X-MC-Unique: VM5dcx03OCmd5uCZquGSLw-1
X-Mimecast-MFC-AGG-ID: VM5dcx03OCmd5uCZquGSLw_1743771424
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so14796855e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 05:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743771424; x=1744376224;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3DMfaX7enMK+CS7Fw8aqK7Kb4zBw5LAQWIhlF/2oKY=;
        b=ZxK1CK1sBWzXFTS4ZCbIxM3JWBm55uUT1OzX8NXxalzNjQMnVrjbV/qKk0Jl+BKRwG
         9k+OMaE7E8rfctXKF1B5C2NdH/IpV3sCn3Cxn+b726dwIWr5zXZyOB9hPopzkcZifdui
         fslvRdO/1iThs49Cg7Vyz1aQKokfBOma36Uco0tsYiG56Rrw/96cjkaTZ2UtrOARp1NB
         QOK03IGr1/A377Z3ym9I9Su9YME1k4w2UuPgnBhp49Iah2kTO4zWn3hSCfqv4SOEGfaw
         547mL/eyL6q30UlUt9xhtzqApGRzLBCwJSse4NkmQxR5uVUxL9F22cQ0ZqTwbrXQp9j2
         pooA==
X-Forwarded-Encrypted: i=1; AJvYcCVWnyLO9+QPfH0xEfJ9k3QU2fDeMGKcSddbOa29lm4cQdC4mD+BUnz1uumMlTR3H3FzJL8Fb0fljZaO/L4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7+xFsOMdtONor665DKRuhOWpIsSQjDXxhgJCN8dxjlRNeZtf
	FhEI7X+CKRa5WvXZlDpFKeK5nRtokEcQdrGT/40K3Cu+9vQTg8wDUafxwkrhXnUTFFiJR1YQMbG
	9rXsG4PPoVXWAs8sqdIgoiRurstCO11MXb7lfUDfye4r1lkkhTqNYNB6PwgX6wA==
X-Gm-Gg: ASbGncuqRR4o2WRpDry7MUcgd7CWusRQKYXizUFXW4CpdFKH5IctMs4j0CeLwDAafqP
	n1ELos1ekiGM1vlpQqP73EJz79Gvp8aTOkY9Otr6pshanr3/reQgE6Rx4FDAGrmgtE4Uko0Zgvk
	D/w5lRKNUSMBhHTQ4RFRr/DMo3dy+tjpKjdff7/3mVIc7hp9r4RXxqWHb+ye1eZLd/N9X72EfAp
	6PefF0L7+pUNgbEnxzt28HN9KRjuzZ8nxmHAo6dvajo+GSUtsbrdW0g5THAnMHBYJ110YWykma0
	Php9wRYUOd8jOiIC3Gi0pi61YS62op67zns/ToyDDIu2GKd1BEqOaAxQ2RHLfrpkoKDVWp0XaMS
	HVylKvooWUQvrTkeETDJ64sysb3WF+qik44xTq4GJXm4=
X-Received: by 2002:a05:600c:3b14:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43ed0bf6aeemr26013805e9.11.1743771424051;
        Fri, 04 Apr 2025 05:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsTD0NEe/13x1nCp/BwHj5jtQGwunCbeDSGxQPUJ97SNdpBIw8pTlFFk7pwqO9xIGqvwm+/w==
X-Received: by 2002:a05:600c:3b14:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43ed0bf6aeemr26013625e9.11.1743771423678;
        Fri, 04 Apr 2025 05:57:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366a88csm44392385e9.37.2025.04.04.05.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:57:03 -0700 (PDT)
Message-ID: <75884033-9474-4d0c-b737-d9b6aebe298b@redhat.com>
Date: Fri, 4 Apr 2025 14:57:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: gshan@redhat.com, rppt@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
 ryan.roberts@arm.com, urezki@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250403052844.61818-1-dev.jain@arm.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250403052844.61818-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.04.25 07:28, Dev Jain wrote:
> arm64 uses apply_to_page_range to change permissions for kernel vmalloc mappings,
> which does not support changing permissions for block mappings. This function
> will change permissions until it encounters a block mapping, and will bail
> out with a warning. Since there are no reports of this triggering, it
> implies that there are currently no cases of code doing a vmalloc_huge()
> followed by partial permission change. But this is a footgun waiting to
> go off, so let's detect it early and avoid the possibility of permissions
> in an intermediate state. So,  explicitly disallow changing permissions
> for VM_ALLOW_HUGE_VMAP mappings.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> v1->v2:
>   - Improve changelog, keep mention of page mappings in comment
> 
>   arch/arm64/mm/pageattr.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..04d4a8f676db 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -96,8 +96,8 @@ static int change_memory_common(unsigned long addr, int numpages,
>   	 * we are operating on does not result in such splitting.
>   	 *
>   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Those are guaranteed to consist entirely of page mappings, and
> -	 * splitting is never needed.
> +	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> +	 * mappings are updated and splitting is never needed.
>   	 *
>   	 * So check whether the [addr, addr + size) interval is entirely
>   	 * covered by precisely one VM area that has the VM_ALLOC flag set.
> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>   	area = find_vm_area((void *)addr);
>   	if (!area ||
>   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    !(area->flags & VM_ALLOC))
> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>   		return -EINVAL;
>   
>   	if (!numpages)

Makes sense to me. Whenever required, we can improve the checks (or even 
try supporting splitting).

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

