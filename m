Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A125464E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 04:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744171801; cv=none; b=lvC/lWD7y+hVCyJorvBybifmi71hhI3HdnzMTIxa0VRkauj3+klMj82DqrORpagYZ9wIRRp8JvJP61npTpgGAUKQZz4gR7crCKXBrWI00PQRxJvgw9n93sLwBpwo02vt3WSxTQEysk/kzswaH/Ja2jUEaHSw8RuIdaUYXod5s9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744171801; c=relaxed/simple;
	bh=SEM1FQWfdTJs99BQowY/GC1EGGWzdX8ybjIuRjXPQts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZV3D8CmtTxGcEfD1rsjrmp268cRXrJOKLt0xd5EBqlvLf2LA9fX+B8pO0FAfyK1yP0EIAd/FH1Eoz8JWcAstNeDWeoJdbGJvzpiJ9wMY8atEYACBsqBlbjBpp6phwgyzCfpCEgmZZrsMQswlKHM4waxxYv3pvXZbRnCWkCMRek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JaN4Ti/w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JaN4Ti/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744171797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSI3UNKYofTp543q1/Qr6IAWFz5MtsY1nglzBATd4M4=;
	b=JaN4Ti/wuIMV2O6LrniomctCa+cmsNzXFpD/3piWJP1uTRGuITEhexjN8EG+JXks5A5qIj
	nT87/wU1wWWWMrs4nNSHj3X+UQqd2lFOPeUe/ZLpxVKI6WAEXnV8A3tHHWRP8sgtZu/qnq
	lWFvE/+nlTDzF3vdPGUTAwJoU88TfHc=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-31IbcO8MO-q4rxSGS5-YyA-1; Wed, 09 Apr 2025 00:09:55 -0400
X-MC-Unique: 31IbcO8MO-q4rxSGS5-YyA-1
X-Mimecast-MFC-AGG-ID: 31IbcO8MO-q4rxSGS5-YyA_1744171794
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2254bdd4982so89646255ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 21:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744171794; x=1744776594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSI3UNKYofTp543q1/Qr6IAWFz5MtsY1nglzBATd4M4=;
        b=IFfNH84GCdnbcvYS9HEf3lMYwxErwii6GaUdey03Pw1K9ZAYc93YHFZXKx55GcoTlX
         oW9XxDFE5s9RWv46lqkzG+MLrGHAePKcK5uswf4pqO6pkzdEsbUDRe1mD5x+esEEPc4M
         9L/PH50YdkCAYFg/ccR0401HoyAP+Nc6Z6ncrXRuhY/iCwwpJWVwaaav8UJ728kS7IUq
         J4fE62Cv+v+mqWfdsbZ30Yga1ESuhvsw74ljeMzguilC4OghAoo3p90Mt/zM7HSbLrJr
         HcsZAXFwijQKT6n2V2I1Ek5Ayqql2YWoz6hejIk5HeQm5DlHIQL6qXgyi4SZKOu+Vuja
         Pzog==
X-Forwarded-Encrypted: i=1; AJvYcCVEghXN9tvsdd8YTFqPhxaFsd2VKwyacmFdwwJ1cBzWoUYzZx+zCwEnFu21fiIw914i7bJ/7BvjRryQYq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi78Gx3YJzPP5sUNYsWZMkf/HFjQRjk7bpDqIKMM32d22j9JnO
	a8bKV+GgAWKbSAZkodVvjC3J2INHdNCMUB6GXs7wlMHpyuUS4LpB+cAOxLSW4lzPubNpHyDOh3Z
	94d2R+lj/ThfavNbXCjSkbYnVkY2WFpQkDnmn3uGVgga0JODbDlSt8C/V9jawDw==
X-Gm-Gg: ASbGncseLTmqHEJTywiQsFRBp1hCZaazPO3XyobtlLb6xNUufcqH4KjDq09dxD+oMt0
	1WqqKib/s6JefovuIx/WAFVCQbXoo1E5QIikB5cEjs2lhTiXEYL7hZVUfLo1/02LUOB+/MAMoEs
	dNlm3n11Yw66Ghs52mNb7BTQYBeqoPb3OzBUdlQZDu1KFeMoDnagtwjfiweaopEgmOV4hxtByeZ
	tP1CJv03bYy+13JyaromlYUuIZL3YXvq979tDsGKw9TsyJKU47ntnECP4V7QQEmDULOD5U9JHfz
	SE22iojnnbUu/RAa
X-Received: by 2002:a17:902:fc50:b0:223:397f:46be with SMTP id d9443c01a7336-22ac2c27a77mr26295045ad.47.1744171794388;
        Tue, 08 Apr 2025 21:09:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmv6DnXKtojfENv0odMP0dosLKhvs41f17wSDjBrU54GG/MO60a3AtYyuTyksYyTBRpOZlUQ==
X-Received: by 2002:a17:902:fc50:b0:223:397f:46be with SMTP id d9443c01a7336-22ac2c27a77mr26294775ad.47.1744171794048;
        Tue, 08 Apr 2025 21:09:54 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb344sm1556945ad.216.2025.04.08.21.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 21:09:53 -0700 (PDT)
Message-ID: <34a4bf01-6324-482b-a011-32974d68e02f@redhat.com>
Date: Wed, 9 Apr 2025 14:09:48 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/contpte: Optimize loop to reduce redundant
 operations
To: Xavier <xavier_qy@163.com>, dev.jain@arm.com, akpm@linux-foundation.org,
 baohua@kernel.org, ryan.roberts@arm.com, catalin.marinas@arm.com,
 ioworker0@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 will@kernel.org
References: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
 <20250408085809.2217618-1-xavier_qy@163.com>
 <20250408085809.2217618-2-xavier_qy@163.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250408085809.2217618-2-xavier_qy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xavier,

On 4/8/25 6:58 PM, Xavier wrote:
> This commit optimizes the contpte_ptep_get function by adding early
>   termination logic. It checks if the dirty and young bits of orig_pte
>   are already set and skips redundant bit-setting operations during
>   the loop. This reduces unnecessary iterations and improves performance.
> 
> Signed-off-by: Xavier <xavier_qy@163.com>
> ---
>   arch/arm64/mm/contpte.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..034d153d7d19 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -152,6 +152,18 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>   }
>   EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>   

I'm wandering how it can work. More details are given below.

> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> +	do { \
> +		int _start = start; \
> +		pte_t *_ptep = ptep; \
> +		while (_start++ < CONT_PTES) { \
> +			if (pte_##flag(__ptep_get(_ptep++))) { \
> +				orig_pte = pte_mk##flag(orig_pte); \
> +				break; \
> +			} \
> +		} \
> +	} while (0)
> +

CONT_PTES is 16 with the assumption of 4KB base page size. CHECK_CONTPTE_FLAG()
collects the flag for ptep[start, CONT_PTES].

>   pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>   {
>   	/*
> @@ -169,11 +181,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>   	for (i = 0; i < CONT_PTES; i++, ptep++) {
>   		pte = __ptep_get(ptep);
>   
> -		if (pte_dirty(pte))
> +		if (pte_dirty(pte)) {
>   			orig_pte = pte_mkdirty(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
> +			break;
> +		}
>   
> -		if (pte_young(pte))
> +		if (pte_young(pte)) {
>   			orig_pte = pte_mkyoung(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
> +			break;
> +		}
>   	}
>   
>   	return orig_pte;

There are two issues as I can see: (1) The loop stops on any dirty or young flag. Another
flag can be missed when one flag is seen. For example, when ptep[0] has both dirty/young
flag, only the dirty flag is collected. (2) CHECK_CONTPTE_FLAG() iterates ptep[i, CONT_PTES],
conflicting to the outer loop, which iterates ptep[0, CONT_PTES].

Besides, I also doubt how much performance can be gained by bailing early on (dirty | young).
However, it's avoided to cross the L1D cache line boundary if possible. With 4KB base page
size, 128 bytes are needed for ptep[CONT_PTES], equal to two cache lines. If we can bail
early with luck, we don't have to step into another cache line. Note that extra checks needs
more CPU cycles.

Thanks,
Gavin

