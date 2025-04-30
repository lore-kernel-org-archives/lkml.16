Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A65E2DC765
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002822; cv=none; b=AFO8Gq4XbtJJorpr6FrYDrJCG+eMOgy6Px+U9qURkFfgpngzn/SQlNaS4uwlIOW6vHEHTZIept1yjDziGNCBZWckiQUZKSgxxoPOVnSvf+j26i6ntzl3LMJlNhg/65SaxEzE5HZZbW+QtVo32fpduWSLjk4Dunrc8E++p3byFGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002822; c=relaxed/simple;
	bh=Y9EbBv9uhTQU/4WYy7VxL5xhYLllbFHdTeX3Z/LCSbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6yCyRodOO/DeD3/Fx8wXDrsUiokeNFq/AuB9CRn8JvxvHnDe9bqbedAEqcG55uM3NhHOAg6VTB8w8QgbBNJ7w3TyovPZ+Lff4BVzgebE61mZhF7cb/zZuSqzvV2vCtTdZzWI74wD589YFip7gmCERkPK4mkY2Ld2TTkyg8OXhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8fxuge+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8fxuge+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso6295303a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746002820; x=1746607620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ps/GlO1XvNY/W7BO10G7AD+oWxCe2mK1nHWx1SJsW+4=;
        b=z8fxuge+hR2OVuksWIz7AdhAMDMc9PyK93b7VA4uTYAQ2D5gL6SaoaoK8NnCutElXT
         cd+Gu4ofvdGXSUOXXXhyCsNIvMZ+8oa4NCRtwBxG1hDMWBov1VaDO32gRGeVfdvGAJS6
         rNJLy76dkqS/Ms+Kug+U+06OxPmuDlQcEWJMHSiG8P4ZmnDGQ5KKZdSVbwIDbS5xsvoB
         M0h9ho5EgMS2vmpp7OgQ1GgJKcyp2NMCDUIxPjCFdEfiVhCOkWH3NhlbmfUHIW8YHiCf
         imRFfXRWkRdobA9lM7ac5Rq1aigs7yFLYqHzwSmWjiNa9tGT0Q6sCHjFxAcpyuEQ9Uxf
         qjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002820; x=1746607620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps/GlO1XvNY/W7BO10G7AD+oWxCe2mK1nHWx1SJsW+4=;
        b=mm9ns5st6jGhuRlihqVwWD3tGrZWf3b2/Jq7T4K1IzQcsQmH2oL+T96fRManzWcri2
         SzlKSnLarqOk3FPzoUSd8dUSAdlAJ+/nWVhlkXFfuwERP6geWs5Mlsz7/WwDVxf8u1UL
         8x9ZG41X5WNF92mt4PhsI0r8MFXgEInsYoN9QlBMOM81b8mo6GRFZ5Oj9v6TYvGwo+tD
         T2vkgnZkmKqUlpnrkrhObc7ZlGJOH/MJWToxdt5BeZ9HxI0Ykgg9EzsAXwwjXZ55wcAU
         GLFBUfi3zUUPhqyCEqjm8FXwcOLAcdUSA7NK4JCQuF8xKdN/A8vtHOlRr7n/UTL4YMZE
         lSHg==
X-Forwarded-Encrypted: i=1; AJvYcCU+J5t6Px5sBWoctxkFZEPJ55MW689wHad1qW/ulZ+XzqWvmBLwNiStLPGVSJQuvM4NVKEC634ul5XNGLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUovt60EJRtGH9vN3Nh3jcm1V6FHNQJPwc5T/tc6mR7mkvc5Io
	syq10asMo4jRNSP0/VGBFc9bRp70EJCN2bO8JTSeJHyO4OXnBYpQkEjjq44TShs=
X-Gm-Gg: ASbGncutGrTbOjr2XPuE/OeJ6NxfkEAHsTcncq+HlzISKrf9FeV6DGXuBIIzerLVjnT
	X8HFhqrN4fyyaG1I+OmyKZri5LMYmId/TDw/AS0ABfnFOfUe7ckJ9hjCOKgxZ1M4X2Nu5WoFr8Y
	bmChgJ8cTHQPqX5HnnLjSqwXt86keM1iPpzVul/oXgAZ50D5F9qwIj1mfOv6B5ROhPkNz3iLG6M
	TXjrq4WwFKWWf+/HGhZM1mu1JRXvF5mclxkBjmZ5IJOx+Gz+FTCksiNhX7lXT5mrUf/OdeOH2So
	wweMULLJEfN6IZ3fBDsDMEDm91Is70yUyEYfHfQQdQ==
X-Google-Smtp-Source: AGHT+IE71Ft93uGd7KPOG74PkFqMkkrdRnPcFWUsK9xk65jelbG+5UbR6p6ZpkO97gGUVEbhaAbNzg==
X-Received: by 2002:a17:90b:2747:b0:308:5273:4dee with SMTP id 98e67ed59e1d1-30a3330d535mr3768179a91.15.1746002819741;
        Wed, 30 Apr 2025 01:46:59 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a349fff9bsm1023758a91.18.2025.04.30.01.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:46:59 -0700 (PDT)
Date: Wed, 30 Apr 2025 14:16:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] OPP: core: Fix loop in dev_pm_opp_sync_regulators()
Message-ID: <20250430084656.otga5l6nv3u5frug@vireshk-i7>
References: <aBHaOOE8xHTsMap2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBHaOOE8xHTsMap2@stanley.mountain>

On 30-04-25, 11:07, Dan Carpenter wrote:
> We accidentally deleted the if statement in this loop during a cleanup.
> Add it back.
> 
> Fixes: 5330d0dab736 ("OPP: Define and use scope-based cleanup helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/opp/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index fc9874946453..f56ddae35ef2 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2889,7 +2889,7 @@ int dev_pm_opp_sync_regulators(struct device *dev)
>  {
>  	struct opp_table *opp_table __free(put_opp_table);
>  	struct regulator *reg;
> -	int i;
> +	int i, ret;
>  
>  	/* Device may not have OPP table */
>  	opp_table = _find_opp_table(dev);
> @@ -2906,7 +2906,9 @@ int dev_pm_opp_sync_regulators(struct device *dev)
>  
>  	for (i = 0; i < opp_table->regulator_count; i++) {
>  		reg = opp_table->regulators[i];
> -		return regulator_sync_voltage(reg);
> +		ret = regulator_sync_voltage(reg);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	return 0;

Ahh, thanks for the fix Dan. I have folded this in the original patch
itself.

-- 
viresh
