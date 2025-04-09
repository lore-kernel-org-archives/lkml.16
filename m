Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BBC228CA5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192373; cv=none; b=Jh73mhlJyuUG66LXuzGAlHMMlNJvofun9t7LwEF5yiUFG6FWpRLD6nR28XI/7hNMiy37QTCFfb4xohf1SGd8gmi6NzOeltkIlV/JIjgu50++pWtChoOMc+shII7y2yjzaLlKjIDltWoNKqn0rb6hcRhpV2liTNWe+M5hXvwzhy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192373; c=relaxed/simple;
	bh=eeCo0sMmdR8i/Iu4RG5CjC5RNSolfENtViEP36b7Wag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsTc4KdcPMQ69lvpGp26srvy1OpeErSMG94WKJsqtyKhDVCvjW1yYTwty16R2hTczxZX31THe5k8fk6pz4OGdpdeCEj+L3k0roUsJ1OnHFuwTUXirnGOgLYV0ZvAJ2ZEvOJwZTlBfFr6k7cDu8GJsBLDT9sEatUx5VASA3p1Mn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CkSqg3iI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CkSqg3iI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744192370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AgOPvhz1Bm1GCeL39ng6pkGLakXCK+cbKOAvDwFeABA=;
	b=CkSqg3iIlm+TMXw4bY0HBvZh2DVVUIqSTYJIZOUtAqXLRDlcQ0BQ1YaBdvbzrqdq+VMwi3
	q0T+Uqmst3oNWcsus1NOSPKTrDfwieQcpznooT/d/d5/D/CqMGG5E876ftiDViKWUxU9mX
	vSsgCMnYYjrzbGHItdJJIgL8La0On04=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-slqOYxVdOc-0rgAcSP19sg-1; Wed, 09 Apr 2025 05:52:47 -0400
X-MC-Unique: slqOYxVdOc-0rgAcSP19sg-1
X-Mimecast-MFC-AGG-ID: slqOYxVdOc-0rgAcSP19sg_1744192366
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912fe32a30so2672634f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744192366; x=1744797166;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AgOPvhz1Bm1GCeL39ng6pkGLakXCK+cbKOAvDwFeABA=;
        b=ZqX6M207dzltxlXAs0kcVWhVCbUhHaWsz+eEWDOAssg8rgiNkYuzXdUVM1yjtWoU+/
         0u5NbHEivcrfD9FfyMNOHfVIk7BJbNoSJKPa+KRs0ljbvVgxnyK1hD/zCiHNAd9NBX4+
         UoN/0tjCbi7XqcY62GKg8r5RYE6zDyHYXAtsanusfzaPy5QDHOmpMSnOQyIk7UN4pcFI
         6+cDciE0qPJp30dUbJMmPSBvGrk+H1bTSTo5AxiwPxW50avGgWnJenaDdN/vOwl59ojn
         FkT4hqsCj0JqGuKWmDYUEDU4e0YScX3pfzwDEUfQt29kxU/Vi1J7QQRp6ZZtQfmvA84q
         hZ8g==
X-Forwarded-Encrypted: i=1; AJvYcCUmnYL+Z559yAN/xy927Zsvmm8/Xw6vHk29qZN8h4WaHDfQz0SiF9UulNLXAQdUeVoE+a+Zs1ttjj7BaTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIyBbSe6G73dXJ52BWCtlLhZdfTOiyXPWWgVopzSL3JPlesEjD
	ovA9EoeHGaizkpJjy4/w8EDXtiOusAivy1BBfVGYz6y52YBHcJICdN/ERNrM0gWTlMTt/N+O/Cp
	o0onNNayXYW7EHqK99pptm7cxp7WbEiwkYQn8eu6thkgwd5o0doemsc+95dRu2Q==
X-Gm-Gg: ASbGncuD+ABPNYKXwMsCe/BeRjkXLljqNQvGs27ydTI1YigfqXn2m5z2ORWJcrA6OUH
	N4faWKkPJ5kgioMgYm5SrPifXZROryKlwMehTFTcf3cx1uO5UTaoYxXgzpBS4hGIsETGR/0aM+k
	P6KCcUZhAkfpAnhM44ANH2hGjAqUtKHP9xRdhtrlu2TOOgr0yVfxPlkYQXEn+/iKtgpSYZm2ae9
	w/EXx+hNgArb9wIOB9MY02turS+Vb2xrH28H5lSSTE4J14ZfmBS8g6LB1l5yLGiaovxDv+VEBUa
	+ycJjVx2i7HeolqklislwhKHOYp2GCFXQRT02B6jSr/17w6GIMhJ4BF+xAt4pvF+nyNmm2D9/4V
	HLoZ3LF500IJp3sASHxp9vt3kGs4Qr1DsRg==
X-Received: by 2002:a05:6000:1883:b0:391:13ef:1b1b with SMTP id ffacd0b85a97d-39d87acf243mr2008552f8f.30.1744192365733;
        Wed, 09 Apr 2025 02:52:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx9GrICGi81uP1xDkomZUSWBX9fsD54soYQUm/gxbsAhKoxt9FjFNAo72hvshuK7hA7PCmDQ==
X-Received: by 2002:a05:6000:1883:b0:391:13ef:1b1b with SMTP id ffacd0b85a97d-39d87acf243mr2008536f8f.30.1744192365381;
        Wed, 09 Apr 2025 02:52:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70d:8400:ed9b:a3a:88e5:c6a? (p200300cbc70d8400ed9b0a3a88e50c6a.dip0.t-ipconnect.de. [2003:cb:c70d:8400:ed9b:a3a:88e5:c6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdf9asm1112253f8f.84.2025.04.09.02.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 02:52:44 -0700 (PDT)
Message-ID: <00a37819-b2ae-4399-b21d-86339059c46a@redhat.com>
Date: Wed, 9 Apr 2025 11:52:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: fix apply_to_existing_page_range()
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Daniel Axtens <dja@axtens.net>
References: <20250409094043.1629234-1-kirill.shutemov@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250409094043.1629234-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.04.25 11:40, Kirill A. Shutemov wrote:
> In the case of apply_to_existing_page_range(), apply_to_pte_range() is
> reached with 'create' set to false. When !create, the loop over the PTE
> page table is broken.
> 
> apply_to_pte_range() will only move to the next PTE entry if 'create' is
> true or if the current entry is not pte_none().
> 
> This means that the user of apply_to_existing_page_range() will not have
> 'fn' called for any entries after the first pte_none() in the PTE page
> table.
> 
> Fix the loop logic in apply_to_pte_range().
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Fixes: be1db4753ee6 ("mm/memory.c: add apply_to_existing_page_range() helper")
> Cc: Daniel Axtens <dja@axtens.net>
> ---
>   mm/memory.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index fb7b8dc75167..2094564f4dfb 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2907,11 +2907,11 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>   	if (fn) {
>   		do {
>   			if (create || !pte_none(ptep_get(pte))) {
> -				err = fn(pte++, addr, data);
> +				err = fn(pte, addr, data);
>   				if (err)
>   					break;
>   			}
> -		} while (addr += PAGE_SIZE, addr != end);
> +		} while (pte++, addr += PAGE_SIZE, addr != end);
>   	}
>   	*mask |= PGTBL_PTE_MODIFIED;
>   

LGTM. just curious, did you run into any actual issues that are worth 
describing?

It should affect apply_to_existing_page_range() users where 
create==false. There are not many, and likely most PTEs in the range 
they are passing are all non-none.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

