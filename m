Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E8A20D4E4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580800; cv=none; b=om7hd/ImEWKL3AJFezrNX2mcipX7YorRuT070GO17BoxyFpe6jFjmc3uWjH4eiXJgPHG3rhTiMV2qph4MtWjkFo/hQ0UBojqFwsT5vWs6kN1aZ08piwFltznYR16ZnoKfJWYj+aeqAbw7cs9J5nTxHvjlZIwG38Cl2M83zutxFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580800; c=relaxed/simple;
	bh=+j3tMr1pGXJh9dcAKRFqecoRIGkqk+YxWNkDjI3B2/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MtouowvsG+HqASlchrp2YhmCVVyXJ5+5TS7jfB9qCCeyo3BpK61uNskknFqsoHQv+elg2t08lxYzBRbhpSvC8ijHxu1J/SG2b06HrJ+6ZcdQzF85OkQtWyeVJfyFBHvQ6OmxJSeXdc1QiW8K3W/4ModOK4uvjQkTYkjt8CwsKAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AFI7lgWY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AFI7lgWY"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227aaa82fafso124675435ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 00:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743580798; x=1744185598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPDVVRxOhKXTk+phnJ6FdLjX7X2JQOoWpPLX8L2VaGs=;
        b=AFI7lgWYbuqMz/XcBzRodGPbLqRgYpPxoXIHMhQdcL1cAcriC4vh8br1+HhgNfSvjy
         97n2UfAyJ7qOShUn3Tdi+XXO/TTIh7RrtARyLKARx1+EHyKOVj+wAWSQzXFRRsiWDO9S
         oOr/ECB3XH2j83G5S1b1zXj5manIdODe27qfaI2dPTQ40yVTQZD5rkVwqF1aTInMGoEz
         DeiF/cSvpu/RuzsfTtH9UsgpJ34O5HR8nHoRhGBWhSBnLaYNf19d2Vt8mW+V90rjA4He
         cdEb2Av7xkY83ph8bjXJ1jvRuy8XqcZmE7P27ik/CIDUNgBq9m+b20ajIE5FnKaafZLR
         VeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580798; x=1744185598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zPDVVRxOhKXTk+phnJ6FdLjX7X2JQOoWpPLX8L2VaGs=;
        b=O7YeLyD0GNu9Zj1C+E8TahLWhlbchTkEArQ1bdiyIn5Xx7JCPnHj8zdIymOTTHcyNB
         KMSb2c9U09l2sJI1RKQf03/H3DCtX020YQdNAZ9d/y129WxiUobP9pm40Doo7pkVGaNw
         Si7y2+Y/Hw/7LESWcKxtqNz+VyLWUSTKgf3/BD6vNCdTbn9JxjQtB6q2bCm808ZkolWw
         M9QSYzgLe5fDN+CmJ9ZIhvJnWjcReCRNXHpVr68G4Ij490TWohYbrnPHIxgJ9tlimRSE
         Ej2rSIjl7+OQ2W/9DPyC/tWnGe/uRFqxtPba+a5VieNC1GvfrvuyvA0lLahV8s32erN2
         NpUg==
X-Forwarded-Encrypted: i=1; AJvYcCUl4WWEfvfcVsgcZm7CdGFDbQZIchay74FxAcCsde62E/OG/B+48NLzVCwxYkfTxZXaBEr9VJX+Lo7d5hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFit+bltzrfSnkIg8idsMvpqVFUB3euxYnye4PmgrxHmVEiOuN
	U1iS618UjeSTBYTZBnozCzBstr3Tw3SVXVSJ+q8w3uus9/1VkBqXVwvajc4WWT0=
X-Gm-Gg: ASbGnctB7K38CQ4y6b3gtCQvOVDJZ/RtiyLkIezrQx0vMoeC8KsHmf7FNMfOwO1QsUi
	aa0e8XdvZjDjVn7F8xLn8AGuYGIBjWr5GL9Jfs1vn6NWjH5WZa1WS4Yi6/jjPQD8OxR/9dEIFEY
	gQuzvjbXWx9y8AY532ujyPPlSnK+dVJffocQ0j/BCa6GIIYd+IfWMVQkiIldDVZSy14+vnwUiQY
	YwRwsAAmP1uXQbMUpuAo0w8Owacjo3M46EbG6nUEJw2fPfrSVVRc9nEI4JKMYULicSGVsqe8Idr
	Z7DZPGjYXTeSlYxFT0FAb6obksmfPeSX0sxcxtrDyj9oNhWg6J422I5uamflhohTVO5VUiQ=
X-Google-Smtp-Source: AGHT+IF6Gu2YVRXxfjljJAG2pLHFFH74A1KEuubhL99+wBdbkqiu+hQkMJQJRROAkkw2a98bzu/mBQ==
X-Received: by 2002:a05:6a00:2181:b0:736:a4ca:62e1 with SMTP id d2e1a72fcca58-7398037c626mr21515664b3a.6.1743580797846;
        Wed, 02 Apr 2025 00:59:57 -0700 (PDT)
Received: from [10.254.167.15] ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7398cd1cc3dsm7041680b3a.80.2025.04.02.00.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 00:59:57 -0700 (PDT)
Message-ID: <ade19125-c9da-47dc-aab5-4d83b799e54d@bytedance.com>
Date: Wed, 2 Apr 2025 15:59:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: page_alloc: Remove redundant READ_ONCE
To: Songtang Liu <liusongtang@bytedance.com>, akpm@linux-foundation.org,
 ying.huang@linux.alibaba.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 zhengqi.arch@bytedance.com, songmuchun@bytedance.com
References: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/2/25 3:41 PM, Songtang Liu wrote:
> In the current code, batch is a local variable, and it cannot be
> concurrently modified. It's unnecessary to use READ_ONCE here,
> so remove it.
> 
> Fixes: 51a755c56dc0 ("mm: tune PCP high automatically")
> Signed-off-by: Songtang Liu <liusongtang@bytedance.com>
> ---
>   mm/page_alloc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e3ea5bf5c459..6edc6e57d4f8 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -2661,7 +2661,7 @@ static void free_frozen_page_commit(struct zone *zone,
>   		free_high = (pcp->free_count >= batch &&
>   			     (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) &&
>   			     (!(pcp->flags & PCPF_FREE_HIGH_BATCH) ||
> -			      pcp->count >= READ_ONCE(batch)));
> +			      pcp->count >= batch));
>   		pcp->flags |= PCPF_PREV_FREE_HIGH_ORDER;
>   	} else if (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) {
>   		pcp->flags &= ~PCPF_PREV_FREE_HIGH_ORDER;

Reviewed-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks!
