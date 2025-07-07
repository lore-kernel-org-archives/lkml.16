Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E044DDA9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751872300; cv=none; b=Y3I/6KfIQcFHHNIE+/h067eBUvd9rcNd7ICaminKHXxkKbpjP44oO5QItkdz6d+GgBd5TCTya0dPOqqmUFiDTpWR2EVHNC2Ea3kw6IXXo3uUJjn5MUIY4RM1RgfBaMfgB5Ph6g1ms7U8CZv2oi3o3MLowJs83f8tMUoeK8zGbV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751872300; c=relaxed/simple;
	bh=FTbzH7sUYfIh5vRRzY4mEg4YlWyIJ80eJTsG4k14wUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=do1Z4xwhapXJHWmKwvuA1YauOEFzsrc4wT+PQhB0OZUGgdpEKtSJ8Md+cV+OAmz+1SqDMCCzFu4YB5O16SToajxtvCVJo0/oIFscgRJ++kx3xZ8Xb2CJ3AMIs2MZqQ1jbzpoYCDnzgEr97LyOjuTMghBhrkGvFudCaKuNt6HCz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Pg6HkEpv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Pg6HkEpv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a52874d593so2290799f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751872297; x=1752477097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mhpmcEfpmP10cZ/KxQHb4VkQYn5Otwx0q5WEU7PxZY8=;
        b=Pg6HkEpvuMF/npV98qcPqIvK9Mkg0Cefyiv8a08+si1+GMOKSRYRutgL6StZ0PGsE2
         LCEQOUQhLiu1SRLXWUT+gMwbdXq7BiEqHjtHlsndUPmgY1ZtT844vEwy6hl0dQt7isrl
         oELsNyinp7wdKQHQaxNxopsBhecMME31zARXA6Dx2ok7gFoDFAs33REC9fCDXvJEwrhw
         uE8B8OL6t0lI37NP+IsNlrlmI1PbB9SIgKhL/PUxpEht1jrwcuA9YiXS4fGuiaaKKivY
         U740XRg+2iyz7/7I/Jka1mNUpLvqGzYHQ8jf2H2ZUMKN2vXm3MzNTf7fEg6RWG1YspnH
         BD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751872297; x=1752477097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhpmcEfpmP10cZ/KxQHb4VkQYn5Otwx0q5WEU7PxZY8=;
        b=LGPFopP2QIooCs7jvFTErIjgsU140e4OIo2UXP+yiQZRDSPqBmOiDvDB3YJPefvGdE
         LxH9K6L4GvHNEuYNRyB4mmURfZmgpawyJEUuv+VYJzfIpTCDUvzfc9D/xrWifHPUmud7
         6sD0rK+35hdzahPtKEVQpALGnX2DPwtlu+LDQKrC357Fng1W0d3BdO11OlIMhgK1Moas
         sli6GCSQ/E1t1Z4nlRZUZjPFoqlKSfKewT3SOkFlRgxURS5wCHIfdDSpjTVr/BteDnRs
         xkRq8WUeQm4dy1sNsRo4uXRUhHI295pxLQ+koV2ipbPj2DMC4ZUPIlGetbz+Dfn+UYRe
         r8nw==
X-Forwarded-Encrypted: i=1; AJvYcCX42Khjkk+ey4AJwHvJZW3XsPuC/KyaVR3tR7LWjB6Up2GWh7ToDSSGNezfgSSIic9dkgwmUYyquvgFNuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoT/JNTL4diU4Xzqs4XpIbwind7MMf82swbnZShCgZyLF4NEUw
	JI1CzETls1eXhKYl6OMAIIQZoYZZLbPHW93tu4Dy5uFGt5Hv+uIbJJk+4qOS4Ri9TLU=
X-Gm-Gg: ASbGncst/P3NEqP1vKgH2ax79CEAlpcfvVZumdU6OajRSBFfMcz3ENBX+TkNZ6fisHJ
	8x/vEkluShHc4VnDaXmcEqQSkBUDLpxj9G/7M5OQBAtsofKE++f7Qnvxo26+nGMm+/AFChzdDpj
	NHFzBPrch8PRrFK5a0nMlttTyiRIBL9QIAQCzV5yYtz+b0gN9Ydyuu6vybOaevq1vLse8TgHkib
	4RzC2H/b2GepIUNSTz/GZR7tXi98MY/0JddTeN2+uu6Px6t7T4bLPFKrvBGZNqtc/h5EmGT8X9y
	xmf4MpLY9eV05avSAbQ88LQS2u23cWuuBpyL7ggv10ux9qn5vsQEjOIspB8ZCIzxApepDNBfCuE
	=
X-Google-Smtp-Source: AGHT+IH92dqetXit3ZJCizl1QYi+uzMQpWlbHYRZOw7IVfprOTQBcR+Z3r5aSrbsz/VpOdBwLgy7pQ==
X-Received: by 2002:a05:6000:400a:b0:3a5:8d08:6239 with SMTP id ffacd0b85a97d-3b4964fed61mr9032469f8f.21.1751872296703;
        Mon, 07 Jul 2025 00:11:36 -0700 (PDT)
Received: from localhost (109-81-17-167.rct.o2.cz. [109.81.17.167])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9bdf038sm132858925e9.27.2025.07.07.00.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:11:36 -0700 (PDT)
Date: Mon, 7 Jul 2025 09:11:35 +0200
From: Michal Hocko <mhocko@suse.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>
Subject: Re: [RFC 2/7] mm/vmalloc: Support non-blocking GFP flags in
 alloc_vmap_area()
Message-ID: <aGtzJyYPKA7Hn6kQ@tiehlicka>
References: <20250704152537.55724-1-urezki@gmail.com>
 <20250704152537.55724-3-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704152537.55724-3-urezki@gmail.com>

On Fri 04-07-25 17:25:32, Uladzislau Rezki wrote:
[...]
> @@ -2030,7 +2033,8 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
>  	 */
>  	va = node_alloc(size, align, vstart, vend, &addr, &vn_id);
>  	if (!va) {
> -		gfp_mask = gfp_mask & GFP_RECLAIM_MASK;
> +		if (allow_block)
> +			gfp_mask = gfp_mask & GFP_RECLAIM_MASK;

I don't follow here and is this even correct?

>  
>  		va = kmem_cache_alloc_node(vmap_area_cachep, gfp_mask, node);
>  		if (unlikely(!va))
> @@ -2057,8 +2061,14 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
>  	 * If an allocation fails, the error value is
>  	 * returned. Therefore trigger the overflow path.
>  	 */
> -	if (IS_ERR_VALUE(addr))
> +	if (IS_ERR_VALUE(addr)) {
> +		if (!allow_block) {
> +			kmem_cache_free(vmap_area_cachep, va);
> +			return ERR_PTR(-ENOMEM);

I would suggest to add a comment for this. Something like

for blockable requests trigger the overflow paths because that
relies on vmap_purge_lock mutex and blocking notifiers.

> +		}
> +
>  		goto overflow;
> +	}
>  
>  	va->va_start = addr;
>  	va->va_end = addr + size;
> -- 
> 2.39.5

-- 
Michal Hocko
SUSE Labs
