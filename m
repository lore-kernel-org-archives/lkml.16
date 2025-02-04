Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9907C25A62C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738704385; cv=none; b=O+4m1eu8m2Uw703805f4n+9kpXF4hc+Dg6gAfp8JJbM6Z23LXamoGOWh7mFmlESoG5RfqrLZJu40arH5fc6AyUdOp7PWEj4tTuD8Ky7m6Eovz2MvgVLdJgZ5jjuEslLxltQJpOxQ8zbib4efw9LTD1pu+M/w7v+5R3mxwtsUAZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738704385; c=relaxed/simple;
	bh=K6+DEtPj6as9aClWGI1gaDT8DytO6DnuoqmIMXT+d7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6jq8aGwTE5EEk9joWBE4NmQ8ON5DFH3guO5ltjTervTOM2KVxRykFyFBeDo+jTfGl9DKioRghYAUwuI9WRFjqNxkR6oDN/v+rD7jLX338OMcg/JeKb8XMMjBqu9EdvowSwbRdDjepbE9+okjxU8/HDdIYDW+GZXrIbF8bvXbIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOzLD1IV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOzLD1IV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f0bc811dbso2866415ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 13:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738704383; x=1739309183; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pLG3b6wrvTjLLumb4GVLjVo7+oGwVehFq4QkFVKNzsc=;
        b=hOzLD1IVAAhxCRMKVWyLJiAd8+Ee1hVeVuVTTrPy7YqXPhDB158RVxzRCSUmuAGD1J
         4D+fkhDEOIfbsCRh+mmW93xra9QrtuIC/bExCTNuW+8DiigkRH9/z3TZTDCyj3hhBjaZ
         hZB/jwMuKRSFKXAHwAJ6PHroZsuQ6sI/r4+BE15V+i8bXp6iFrKp7mDAZswDhd0IZCcb
         +xVc/CmR4zX6tItIrDBRJs67qB5fhH0kU9i3Fh6adUCJ+/E4uNImmpUL8Jw49utfFjBl
         zyZ1/VfmFWzBjCEVcZgmjxUaxXC4GKXANtq3ZfafHiAKc86qC6ReVsFIhwdzGWCZ/KC+
         ASvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738704383; x=1739309183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLG3b6wrvTjLLumb4GVLjVo7+oGwVehFq4QkFVKNzsc=;
        b=m1MTK1W504r2pKn0cjGB/135QHptIipPzwPXv4i83Yivx0fcrSPsRg7U5pFodeOuJ4
         TKHWfnG5GYLgXDz6Q/NyAqYuH3OaOmCnIgOiyPBhrPp0j0ve55PExl9tXqwkqRpMlPNj
         CBHvD16LcaPqWjbTBEboduRwGAJip1/a3Z7Xtbe84NEAb4MsBUiUd2ElDBt1RCvJqk5j
         GwR1DNf0GlOWVz4uhWgb1dtgaVGKo/aoYG92mHRnpcEpH5apu8nd41iEpZFVMR1YADTv
         mV69HIu73UCNSPD3d+/VnZ6WVYuxiitdfPAgpvjs+9DhQN1gi7Xao2I+82OB7KmQ6X89
         yRGw==
X-Forwarded-Encrypted: i=1; AJvYcCXBVYtSCxGfHNLKgB0sNuev253dKW9tIthqCfs5n8rOF8gwUYJuQ00oBgkLxQzFqLetK9POiuevYokSa0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL0pF0h4Z96gYxhZJDTRaF7SvNYhNYNTBh6yP9medKfrXwYP2r
	tBC0ZvGbW8eGeRPlb048Ph7JetrPZyLG5YNa7BCl/E5YKXmXagsv
X-Gm-Gg: ASbGncs1+0CyHDZzuzRDgbLLu2mmbphXR9Ke67TIuJ3m7PGPV2RSLmC27K+TRVYUlI+
	fx+h7JNCbsYHNblx8sbujbRYuRp+a7+cDDzfX7HTIqSij+98rLEFt4wg95VM3ScQ/iLbOBKypeV
	KrS4gAZNVmQfl2Vaou48vkXtZptelvs87eRriVRcuvqhmEv+l5a0AqfnhN4XcVvahQPE9pfVTqA
	XT10QEQ4s1w3XVDc+s/1aJ8Xj3yo4QpO7t6b0KMQKCwAyPrDkSQIZzDtjzsD9bhaplKd9qyZWGp
	PtpEFKUwWiZl+Lo=
X-Google-Smtp-Source: AGHT+IEw1kg8FA/jHfAhD3qpjLv/gqWl68O7iERmN2+l8B8QL3gqIWHQ0bcb0lzP410+cvM5TD/jPA==
X-Received: by 2002:a05:6a00:2e14:b0:725:f359:4641 with SMTP id d2e1a72fcca58-730351129bemr719983b3a.1.1738704382623;
        Tue, 04 Feb 2025 13:26:22 -0800 (PST)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11258202b3a.137.2025.02.04.13.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 13:26:22 -0800 (PST)
Date: Tue, 4 Feb 2025 16:26:20 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] linux/bits.h: Squash unsigned comparison warning for
 GENMASK
Message-ID: <Z6KF8UBsQ4NmR9KS@thinkpad>
References: <20250204-fix-genmask-warn-v1-1-626de7a30090@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204-fix-genmask-warn-v1-1-626de7a30090@amd.com>

On Tue, Feb 04, 2025 at 05:13:16PM +0000, Yazen Ghannam wrote:
> Cast inputs to 'long' to avoid the following 'type-limits' warning:
>   warning: comparison of unsigned expression in ‘< 0’ is always false
> 
> The 'long' type can hold +/- 2G which far exceeds valid inputs for the
> GENMASK helpers (current max use is 128 bits).
> 
> Idea is similar to implementation in __is_nonneg().
> 
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
> Note to maintainers:
> I found some previous discussions on this topic in the mailing list
> archives. The upstream code has changed a bit since then, and this
> proposed solution seems fairly simple when based on the latest code.
> 
> I figured I'd look at something outside my normal focus areas. I
> apologize for the noise if this solution is too naive or incomplete.
> 
> Thanks!

Hi Yazen,

Wtype-limits is enabled in W=2 only, see scripts/Makefile.extrawarn.
We normally shouldn't see this type of warnings even when compiling
with W=1, at all. 

We have quite a lot callers in kernel already that do GENMASK(xxx, 0)

  yury:linux$ git grep GENMASK | grep 0\) | wc -l
  13788

And nobody complained so far. 

Still, I tried to compile a small userspace app that calls
__GENMASK(10,0), and found no warnings with Wall, Wextra and
Wtype-limits enabled.

Can you share more about your compiler, compilation command and config?

> ---
>  include/linux/bits.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/bits.h b/include/linux/bits.h
> index 61a75d3f294b..318346f2a5a6 100644
> --- a/include/linux/bits.h
> +++ b/include/linux/bits.h
> @@ -21,7 +21,7 @@
>  #if !defined(__ASSEMBLY__)
>  #include <linux/build_bug.h>
>  #include <linux/compiler.h>
> -#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
> +#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((long)(l) > (long)(h)))

This implies that GENMASK() is OK with signed input, so negative too.
It's not true. For me typecasting to a signed type just to shut the
compiler is a bad idea

Thanks,
Yury

>  #else
>  /*
>   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
> 
> ---
> base-commit: 0de63bb7d91975e73338300a57c54b93d3cc151c
> change-id: 20250204-fix-genmask-warn-489a6480779f
