Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E8721A424
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750276814; cv=none; b=RmJL7WKKD6/e6ln8RvnjGg36vWYRbyG1krPdPWrsoBPu4jJLXmwovMemHUsHSTSEMsxHxB42YZCD3BQXk71i4ImRT7cp9/KE5mC6LgFgMW8rV+lxNNqtSwCojYVc6k/zBm9d0rn0dCDybb3LiCX0phFCQrtJ/7PHns+vK75+xp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750276814; c=relaxed/simple;
	bh=Thq4Q06cdpVu9pDEN+/3JBZrpgyjUXOgoUe0gvNvhSk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kLS+dFogbzYwvepLTJlXuoln3mxh32Y30CiCoNSj6GdvpGFOWZ5Tv8TixU9WRBG2ximrUAR3smeTtNXXoqiwKdOvT+wDixT7hkT1Dl/PZemAnDCVMBtEXvuNTWTec4TXaHtZ3r25GWirhXwhE9mvMTNJQiD2dYqMTc8uPgJp3HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=f+HQw1a8; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="f+HQw1a8"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b271f3ae786so81927a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750276812; x=1750881612; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KiOzVfjBcF1fRtJg0Y1H//g4cNADDmQDLTn0mBy9kzo=;
        b=f+HQw1a8sMcwX9xo2U1ygWT+QWYLU0F4HBcOvrIkAhCmztVGuDaq3zoVf/NAP0kpfw
         b//W5zthQDGjYjyaDRMyN+Vcnbe3zV5Nr6eA5NBgoD21zoiEIKj5XGz8UmEKhmkhSSjP
         5UIZtEbw8qUOmBAgLNSxnqYCIRQKGVfkxQQ+5PAhVTqCJspZmoDvMZLberAIxHiWb9+8
         E17c2hE79UE6tIXmsD2oGjxPt9ffdno7l/yYSpPPiVPQf6+bZWgsejQCwpSAiGcirihs
         6odCbGg5ExPNl15Tr/DCA2ExS8YbnMOl0bMF1ygsFr+6j1t2ZuD4YEvoosB6mIduVVnD
         +Giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750276812; x=1750881612;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiOzVfjBcF1fRtJg0Y1H//g4cNADDmQDLTn0mBy9kzo=;
        b=ijqWDvL6Hnn84XD6O4//lVtvuCNgf76Ft6EKJQU6gpzJWIFD2+Gt5ZiCLSKAt1I2Nc
         kQjG36ZlVkduCSpz1Cu9dnyX0agybpvGdoqmlY8Swljx3u+ypG/MVIi0SiZKbjDyGdW4
         DCyfR7IcDmZYv03dOeyxCHY4iLgS1FrikeMyGEXgTvvp4vBO+AVprrvR3glrKF3SyIEB
         ABfyJIBggVNdp9Pw8fiOb2rvi8Rqzj20JbykNql/LLK7oZsVkrb/cuGnKu38/xz985zT
         pfPy/r58n53d4KtRVyL7ryCMNdhf4JFF84TZKQs+mE6MuuuQSLIDaIBMpkzAU22fbrtb
         aMdA==
X-Forwarded-Encrypted: i=1; AJvYcCV0GSLUM/5RGC6tbaFt+oKBo+ypCTzNtGVtr79lda44WdzqM34yfFOIoLpV1dvzIhNi3O38thJDCUDoAG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaTGuZ6kQgrhNL6JpVGh8exKZK4jb21zNHUq8QFX8uCbXGC107
	CTt0n8WRD1owx7toaiDOt6xPjO5FvpNXDLwD73G4Nt8WRAnAkW/aT6ZsGeUQqfZFKSw=
X-Gm-Gg: ASbGncsfZcmxeQdMLd2SiRzksLtEWaWxoos1YZfuVeLk7yFdv+p0h7N6bT4gKJhJ1k8
	iBowln2KaPcNUpyIdMk1lY0JF9hlIfI4ijRFzcL72kcG5GVLumVK51KF70Y6+z6MGq4HE4JIj2Y
	eJmD41J8edwwgZ0zR6Dfb9xswr0nSpBYQ6aVeepYBJ31OP1JDPZlArWh2BEvMkBeBVmnDu6ovrt
	uUr5/S1yGTKbZ+t9wKohk/IgJL4C8/yWAiOUnvrk2MEX0FS2Hki2eLIRkrkQ0pQzzm/BwtTRJsm
	P422Pzxwsct30+fqwopUzsZbMrLXZ3ShCnZzoQNLIrBbKHgHYe48LccW2nqi
X-Google-Smtp-Source: AGHT+IH3xjpyQ4ebVaMo9DbY1gh/tZqYj3qhoffl3icr75QW+zCNKAPlpcq7GyNn9O1WQp4oMM2scw==
X-Received: by 2002:a17:90b:2dd2:b0:312:f88d:25f9 with SMTP id 98e67ed59e1d1-313f1c7dacfmr29693399a91.7.1750276811912;
        Wed, 18 Jun 2025 13:00:11 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3157a605f21sm1629583a91.0.2025.06.18.13.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:00:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/2] pmdomain: core: add support for subdomains
 using power-domain-map
In-Reply-To: <e463a278-7e6e-4287-9093-42d0a0d365d2@suswa.mountain>
References: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
 <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
 <CAPDyKFrO9rb0eDb2qO+EGaVjOFG=7emgca8511XACDhWY=dt5g@mail.gmail.com>
 <7hsejzp4xg.fsf@baylibre.com>
 <CAPDyKFo-iPBPgkM43q+5cGR2sptkLk4E6TAERCQbCu24o1RfFQ@mail.gmail.com>
 <7hcyb1os9y.fsf@baylibre.com>
 <e463a278-7e6e-4287-9093-42d0a0d365d2@suswa.mountain>
Date: Wed, 18 Jun 2025 13:00:10 -0700
Message-ID: <7h5xgsq0qd.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Dan,

Dan Carpenter <dan.carpenter@linaro.org> writes:

> On Wed, Jun 18, 2025 at 10:48:09AM -0700, Kevin Hilman wrote:
>> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
>> index 88819659df83..3ede4baa4bee 100644
>> --- a/drivers/pmdomain/core.c
>> +++ b/drivers/pmdomain/core.c
>> @@ -3220,6 +3220,40 @@ int of_genpd_parse_idle_states(struct device_node *dn,
>>  }
>>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
>>  
>> +int of_genpd_add_subdomain_map(struct device_node *np,
>> +			       struct generic_pm_domain *domain,
>> +			       int index)
>> +{
>> +	struct of_phandle_args parent_args;
>> +	struct generic_pm_domain *parent_pd;
>> +	struct device *dev = &domain->dev;
>> +	int ret;
>> +
>> +	if (!domain)
>> +		return -ENODEV;
>> +
>> +	/*
>> +	 * Check for power-domain-map, which implies the primary
>> +	 * power-doamin is a subdomain of the parent found in the map.
>> +	 */
>> +	ret = of_parse_phandle_with_args_map(np, NULL, "power-domain",
>> +					     index, &parent_args);
>> +	if (!ret && parent_args.np) {
>
> Sorry for the pedanticry but could we flip this around?

Sure.  This is early prototype code for discsussing the big-picture
approach, but I appreciate the review.  I'll clean that up when I get
past the RFC phase.

Thanks!

Kevin
