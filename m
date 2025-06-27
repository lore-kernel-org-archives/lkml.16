Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEA21C5D55
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750998716; cv=none; b=mCKt4t/CFmLa2vY1rrioy2BXkJA4kWmu0HSOYJarFyxbHbQVEje97QSZ29N+1kqejSJ3QMEEBTdMIwuomJjG3v9ddR2u1efHFOsujfMud//BAKOtR24bZXfLHrdFLiuXZPHSLlKPww2wjcpo7T0BqwtbwPxS0OMWLNXLPT24Ea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750998716; c=relaxed/simple;
	bh=aSS61x7QxUVX5LHjhVG9mpyAuio6UUIkxWqfveR0i8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BY2r9OxojbYtwfQXmc6C5L/MK7amHYtmcgRMVicdQYE94f6lA9aFZ8nLgegvhFVhio0d7ypt41ir8AHWD+9VobWeFZt2idnWet0fuY89d4vTzWm+IcSZyqXnwYH4H8/iSHzj+ei83Rz8bnDvsuTmyDv6K6ggvsj5Y54fAMPsRHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=itz7cGWo; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="itz7cGWo"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d38b84984dso261440485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750998713; x=1751603513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AK4VOOLTD1hGNQ+BsO/cCMm/PctZ7mlNTcGJ9xnEe40=;
        b=itz7cGWooWeZigvYEC2P/lkqQgqvBkjxwLT1DB5TCVBUUBQCQ6nJm3XKMzDyyrAEBd
         KjrkMGhF+Ug10doKASpOVmdRto4sDjmy/cXhC0sPxln7qFW77s3V1N+lT7B+x9LDCSgh
         WH/parCyxQ/cviwVokHgNl6PyA7VvA8kPEjbICeWGl8jD4yNx8b6yzSorGRnDg3srnqY
         jKrcQiK363Y+XCpDOE7Dqs3A6PWdfxqB2pMC2EDzeIZVkTEFq18jlZouZfyhprSt/3UU
         zgcPvYgXkvthf4WUVIgUtucMBZXtZv82qs/X3H54IqfWkp5yO/6CZwUdYx+dnFoOje1t
         +Pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750998713; x=1751603513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AK4VOOLTD1hGNQ+BsO/cCMm/PctZ7mlNTcGJ9xnEe40=;
        b=TVSdVc8G8H3UFLmPdPLthWltf3PEteCZRx3oXUJmICKa91RTS1gmBpLBqZEJjpRR4C
         4mShoiOSjcwzEq0wpS3HsWIAMx2YmOnHSTD80yxkoZZ1zSCq6cXyvoecQUwQOpEpP7r9
         /90d36A2jylYqooJSpqlfoN/NP1uyYDfNKMeJI4S2Hbj3jWwXv8aR1vQSxaM1wFL1Rdt
         qbC0lwqi6rGTP85YRulRL4XxtKZJ6PVYVzrFXHuBk/VlRzhAHnI/ZVrAnxrDnUFuTsAR
         dSB6Q63yTMF5y1ySOW5U9gMl11JA/OP+PgT2zMcE06y4JkBzcvQ4a2ekLKHxEhSrTC2K
         rWzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4Put5hcuBEi7zFOkB1RsVy/iF1HxHxfxD8T0JaMbzJdipFqwA4OZ1wFb1E0lw+HX/pDyaW3E2+FoD+3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqzUh1EmozgllF0rzUOMcvTBOXX6+h5l5gabyPKETfx3IF1ep9
	2sErZJmKXc4sMtclvs5DZc8YCYYxu5YW9NyTa+UmCVHWJZijhzdfT4zyAhfNo910uuFlDbwsw8e
	RbEys
X-Gm-Gg: ASbGncsZkkKjOfMHs17eRqlsilxtQseUOSCl84/lluD+tqbVq00TshMoj7HiIcHI0Rz
	oOQtL30/pFQsVfvgWlZT5CbNp2gjV9WY6tP5RGC+5YEQSJ8M5n9MDcAvxP73Bs/NitqpYI3uRtB
	mPea1828yhP6dvbEeA7d7D52tj/DxFCWpV6jCbfFnh+f3J5aMu3kh2iL37bgEl4OcuCof0q2fly
	zXGleiunkEzWcX00Qx3qfWdvJv3WGc77ZjyixGf0Hm6YCpHAqvc50IXb+Rg+Oijz8Vm1jqFFbkF
	HKljQhJcoc4SNiTPs0Y+AM84TmNl9PUskyjK51SVDZR6AdKBBAXbF0Qgj7A0n8plhxftlmt2uFl
	J2xvRM9/y0xHSoKrI/ir13XVJs7J570T4pMSpksaBVQ==
X-Google-Smtp-Source: AGHT+IH1qhiDneuCGwRTL1z4mVoftoxpeVCWpGYeP8yiqZyGuT4TqPRiebMHNkC9qWIOQXsZpT71+w==
X-Received: by 2002:a05:620a:458a:b0:7d4:295c:884c with SMTP id af79cd13be357-7d443926eb9mr310862885a.7.1750998713547;
        Thu, 26 Jun 2025 21:31:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443223219sm75897285a.84.2025.06.26.21.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 21:31:53 -0700 (PDT)
Date: Fri, 27 Jun 2025 00:31:51 -0400
From: Gregory Price <gourry@gourry.net>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Byungchul Park <byungchul@sk.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm/mempolicy: Simplify weighted interleave bulk
 alloc calculations
Message-ID: <aF4etw9dELyW7FEZ@gourry-fedora-PF4VCD3F>
References: <20250626200936.3974420-1-joshua.hahnjy@gmail.com>
 <20250626200936.3974420-2-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626200936.3974420-2-joshua.hahnjy@gmail.com>

On Thu, Jun 26, 2025 at 01:09:33PM -0700, Joshua Hahn wrote:
> Simplify the math used to figure out how many pages should be allocated
> per node. Instead of making conditional additions and deletions, we can just
> make them unconditional by using min(). No functional changes intended.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

you're better at concise math than I am :]

Reviewed-by: Gregory Price <gourry@gourry.net>

> 
> ---
>  mm/mempolicy.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 3b1dfd08338b..78ad74a0e249 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2645,18 +2645,15 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>  	for (i = 0; i < nnodes; i++) {
>  		node = next_node_in(prev_node, nodes);
>  		weight = weights[node];
> -		node_pages = weight * rounds;
> -		/* If a delta exists, add this node's portion of the delta */
> -		if (delta > weight) {
> -			node_pages += weight;
> -			delta -= weight;
> -		} else if (delta) {
> -			/* when delta is depleted, resume from that node */
> -			node_pages += delta;
> +		/* when delta is depleted, resume from that node */
> +		if (delta && delta < weight) {
>  			resume_node = node;
>  			resume_weight = weight - delta;
> -			delta = 0;
>  		}
> +		/* Add the node's portion of the delta, if there is one */
> +		node_pages = weight * rounds + min(delta, weight);
> +		delta -= min(delta, weight);
> +
>  		/* node_pages can be 0 if an allocation fails and rounds == 0 */
>  		if (!node_pages)
>  			break;
> -- 
> 2.47.1
