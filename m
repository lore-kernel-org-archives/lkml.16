Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB2E2F19BD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555503; cv=none; b=GruIhdswaBl0rvb5HqlFLwZvgCtdvTmp0fcrYVsnGviLOVd/3PtKOUb6y9XaC4TiWr9Vc7rmYMl89huoI0cpeMM5ghHvGEOoF7cIiQENsJhbaokWrfX4u4tKbDHxQVTi731Q/bkvVF/id+fr+9dFqyowtgAjGNsycaakTwSZIdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555503; c=relaxed/simple;
	bh=RbxVGJNbXM6OAp0vOrGJKnDsx6+rYr6yWLn2VhGH7Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmR3mUFtIHejbaZeXgvIvqPy02dgTQdSABjVMKugF9tzIPfCWAcKb+0MQqtIQOgReZBdzl8qts5ui7hZDFT+cHbYF/BjrBNOJpmrT6U8H5bnVb3h7eWmU1GW7OLQVaHTnkqyfmUgCk/zA7/5dey1UJkG0Cay0SUUBh4cfWjFa84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FAsAGwib; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FAsAGwib"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ade76b8356cso1066098866b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555499; x=1752160299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxkvsrSL+5JDtGQsAevbH9zmJ4Ly3BiCGEDd5Aq9Bn8=;
        b=FAsAGwibJLZY4/pQfaLQPndB2E4CSKCBnRWArGBsgBJMdnBOgk1alHsZKQwPHykWDC
         zogWqrZ811ugLKo0VHjcgGDunzlhr/Smwjzhn5t03E7rSLCzzv6ogG2/BCw3Fjfz97hW
         zWpQs621C5BqvpqImQaYEZBug7w7gcHMNYUSrtMP5Yd3r1igW1nhdHs+pfmC/4z2n6KS
         JKkiYK6Jl7gXWmHeXW3DLd83tBTWs8TMeTRajldhu8fwzeeioR97wXk4D+cpEDNvcpYw
         MaObdp1leTci4jh7X5hFxcFch/WkObjMQ6IGAdg+yiMv3WDPyp3XHqBJZSEvKZ0jtANZ
         zg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555499; x=1752160299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxkvsrSL+5JDtGQsAevbH9zmJ4Ly3BiCGEDd5Aq9Bn8=;
        b=xTyGqg1zc+7b7Hmi3F4t98fML1sC25bb2wEUih9N8RYgZHL7nG8dpvNBZtE50VGDwQ
         CLIE7XtG8WJxZDsP2ohPQKjo6txbSm7JVIK0Mr4AuI19wUd7UXk2HLtIk6UoA6Vw6Em2
         FPCI4ouC8u82k3PFmkkH9fHBiqEpm9l7wRysXAKXu9GfTnd3lqGQGu7LiOMsn677LYrg
         5427YxADDIRVkon0bqcN7DlgQJUu0/+HvI6AqoxjoEQFvS/z9rdJ2ZkJje75/4IfqzFZ
         CZHK33fvqmofl4NUSERviN+YW19u8iDkGTDmubk7MRS+3oO1BiOXMiKwvkvzyZ1ZEb6V
         GXDg==
X-Forwarded-Encrypted: i=1; AJvYcCWnnpdkzgJ11DJT4YNoyj2j2uzeXIsPyw+8v/nxzm6xM1LOa7+R3/5ic1TU7mxd0IQl7b2VjaQ4npbrZlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT01lTC3aXDSbfAZ+blRGGAPbbR5YLkdjyGkuz/nNy3TyVEkHv
	5Slf96DDwd52T0N54/6FdrvCXZAiHxh9Dxi3OA/y7vWaukiejLgAk6iSx6RlKkeh+Fk=
X-Gm-Gg: ASbGncspIZPUQC+cQhwm+RyHF4MwnTk5XEuhF2bdqJ2xYDjo+pfrACi4DY4TMDYCeMf
	RZC4CBZGRV1ttoEvJRlzdpsYmJMk+eHmp1AKFd1TpI6UA9T8pdrku1ZY4M73XG2iviuRDyzo97L
	UcMGO8GaHb3J+amLl4lB3V2vy1MrdZe8Gp1Vm1Gr51nMGHHgwRl5GskSNcLMozm+t3d82B1ts0H
	nM74MZpjnSRebaIn/M/UfTDtuIcAUR+1wkzTFJ520JNyh/prScKL+wFv19q96kbFoZ/JB2GNYTG
	/4UsPXWAKI6B7PdagVbhozm0yq5VeOCtSKjMfNlB4Ysr4nbCx+ssdQhyfBE=
X-Google-Smtp-Source: AGHT+IHdpH0Sd2LIExCI7zlJsSgp4lqg2r2dh7poJIycXB81JioP7FOT54h9vFTuZ+M/bEMSFmF3pw==
X-Received: by 2002:a17:907:72c4:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-ae3d84f7aa3mr410481766b.36.1751555499231;
        Thu, 03 Jul 2025 08:11:39 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831b3e29sm11077956a12.42.2025.07.03.08.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:11:38 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:11:36 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 2/5] clk: imx95-blk-ctl: Fix synchronous abort
Message-ID: <aGadqB5pP6DjNuRH@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-2-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-2-b378ad796330@nxp.com>

On 25-07-03 11:40:21, Peng Fan wrote:
> From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> 
> When enabling runtime PM for clock suppliers that also belong to a power
> domain, the following crash is thrown:
> 
> ---
> Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : clk_mux_get_parent+0x60/0x90
> lr : clk_core_reparent_orphans_nolock+0x58/0xd8
> Call trace:
>  clk_mux_get_parent+0x60/0x90
>  clk_core_reparent_orphans_nolock+0x58/0xd8
>  of_clk_add_hw_provider.part.0+0x90/0x100
>  of_clk_add_hw_provider+0x1c/0x38
>  imx95_bc_probe+0x2e0/0x3f0
>  platform_probe+0x70/0xd8
> 
> Enabling runtime PM without explicitly resuming the device caused
> the power domain cut off after clk_register() is called. As a result,
> a crash happens when the clock hardware provider is added and attempts
> to access the BLK_CTL register
> 
> Fix this by using devm_pm_runtime_enable() instead of pm_runtime_enable()
> and getting rid of the pm_runtime_disable() in the cleanup path.
> 
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
