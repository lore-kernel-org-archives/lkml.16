Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32536158218
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004556; cv=none; b=Zv4ug6J5xSiaKFZiaIdX8IxjDulW6A7GphUmV6EErobWyE1ujZ7YG6/fRaIAbMlmaBjwyc5SDDjs1/KCrCZz4FtHP5u3jzHE4qmDy5nJ3bloV14c2Y0+WSSlTKX5QA4wrWdql9ewSlaV50Y2gjXoDlG5scC0VUy5tvDzvC+dBJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004556; c=relaxed/simple;
	bh=WtneIc0QDfp7DDBdSDxXokPJOzOSITmmPNHBQnSD4cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbmmHdtKxVhIay9flSfzssYiuY1owA7veuNPs3r3nm/NVf7Ggl++15/U9qH+ylNWX5PvZTdWCERBeJSOxcUugFgbUZptxqAVpG09gysGFxpluPpjMINJz0nZoPaZMgUnlpAsSkgAmJHn7/VxJn1vNHZ/oonIXGRbiEt024FNokg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cTQn8R5Q; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cTQn8R5Q"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so5329192f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746004552; x=1746609352; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iGp+BEJIsu8tiMnSTnVm5SKGOdus+/7Cz1jcp7uu/9c=;
        b=cTQn8R5Q7G3HjGw/qU212gP76XQx3D3AQWqevQV9Irzo8jD2roHaxf/misjNRu6KLp
         s+TdkBoZ3fuePN5p7H4SOFOYTO5xKe5OSSkEJTm2TyVCzILIzK8eb0bM65ApmlnJk9xA
         kck2KrSehPyZAQGtO9TaC3/d/TXALbjhkRS8fcmLVduFJ6YvJ0xuel9831nmiByoaxY4
         nPCJfo1eY2xd00p7DFWhXxnVm4ahM692ao991SA6Oov/kAZHh1Ium8xlj2n05X4AXEr5
         cAa6jGoPhi7Sb8JInj9CWwo9sGm/uMByq08SNPikDdDJ75FeGZmN7yKGH5sfKG+kXL/F
         UOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004552; x=1746609352;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGp+BEJIsu8tiMnSTnVm5SKGOdus+/7Cz1jcp7uu/9c=;
        b=uqCMIVe3XI4n2196GDwwh6EgnM6pMxTMbwj/uzeJONJgpCbFJbQ8Z3D42gO/ETlATl
         WuD6bdjgSZF6KfqkBNskazlq8xgizoKwVFMIEaEjxFRKEurl8wG3YFBgvQVnrAbbqphU
         rvmGyLHjkTr8y7O9nQ/IEPiScde/Qa8pEMtRpMJVMz9iljX/L3cLeK2RfYb0Dj08a6zP
         txIboVv0rWpYqqt2594i9pdASZKieuam6zCt37/iltjtoeeJG+F5XBHg+rJRWB6gJHWp
         LRSoP/Hm3LgD/wM4sTbggOHEoUYZbihzlYCWBeHaI8W+k/lil7fsrDPebjbWjwCpSAB2
         XwOw==
X-Forwarded-Encrypted: i=1; AJvYcCVhw9U28ehZ5HER/tjdVydg/1ewd54Zej94rpKEOuV5rZvbzICKIEfPmfrzanYZ0ucDTazTxxwUkv1QwAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzodsR2cveGkd76auzmErbAaHbmazYMYnhOSvqAtmKXP9DAQytk
	UPEHhOeHx/77LTjq9CIrF12xAi3beglGYz94ULPsUHmGHb6UPoHbhAmsR1yOHKw=
X-Gm-Gg: ASbGnctppRyOPNJVzGMIGX79XoSX2hS1+6m1jEFJqcWDYikx//b3MEPt4jMocFtA3sI
	0UNnguB92lB1VZN7PCh2la/Atlv81rJgMp4S0zcje5RIXgOwfVqjUdeX3Itr5eGWDNeoolUG8Wj
	SRDNRrDxiQGq2GzNrnf6vAWfjaeH4Yv5XeEWpza1wYwu+nEb8MKyfwh+/ZCtYFkUiWP1aCd0d7O
	yKozZ2+k9USCKyxmm16xQt19/sEJ9Wz+xT0Ldsbi8J3tiJB2aSy2IdVwXkjMDq/uG21hQ+UwSkK
	qAaUg3y12Nx2vm6K3UphfM5C8v7oWCAtXlagF0DezjrepbnB76JQFcsLn6ONHzdJF/izqxZcFIh
	3Kv4=
X-Google-Smtp-Source: AGHT+IFkPR//rOgO0Nj6VP0et5o5R5weTdk43Q9O48THz0Bb0Mc82kvtuhKb+SHshn3v5YQdadMBLQ==
X-Received: by 2002:a05:6000:2284:b0:3a0:8c68:19b7 with SMTP id ffacd0b85a97d-3a08f7985d0mr2116855f8f.3.1746004552519;
        Wed, 30 Apr 2025 02:15:52 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cc4025sm16666218f8f.56.2025.04.30.02.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:15:52 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:15:50 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ye.li@nxp.com, joy.zou@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RESEND v6 2/2] thermal: imx91: Add support for i.MX91
 thermal monitoring unit
Message-ID: <aBHqRu7qmDlXyFeR@mai.linaro.org>
References: <20250407-imx91tmu-v6-0-e48c2aa3ae44@nxp.com>
 <20250407-imx91tmu-v6-2-e48c2aa3ae44@nxp.com>
 <aAIkAF_AHta8_vuS@mai.linaro.org>
 <aAJtwxBtBX4ofy/o@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAJtwxBtBX4ofy/o@lizhi-Precision-Tower-5810>

On Fri, Apr 18, 2025 at 11:20:35AM -0400, Frank Li wrote:

[ ... ]

> > > +static int imx91_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
> > > +{
> > > +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> > > +	s16 data;
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(tmu->dev);
> > > +	if (ret < 0)
> > > +		return ret;
> >
> > Why using pm_runtime* all over the place ?
> >
> > It would make sense to have in the probe/remove functions (or in the set_mode -
> > enabled / disabled), suspend / resume but the other place it does not make
> > sense IMO. If the sensor is enabled by the set_mode function and then
> > pm_runtime_get() is called, then the ref is taken during all the time the
> > sensor is in use, so others pm_runtime_get / pm_runtime_put will be helpless,
> > no ?
> >
> >
> > > +	/* DATA0 is 16bit signed number */
> > > +	data = readw_relaxed(tmu->base + IMX91_TMU_DATA0);
> > > +	*temp = imx91_tmu_to_mcelsius(data);
> > > +	if (*temp < IMX91_TMU_TEMP_LOW_LIMIT || *temp > IMX91_TMU_TEMP_HIGH_LIMIT)
> > > +		ret = -EAGAIN;
> >
> > When the measured temperature can be out of limits ?
> 
> It is safety check. It may be caused by incorrect calibration data or some
> glitch at ref voltage.

In which circumstances do that can happen ? At boot time or any time at runtime ?

> > > +	if (*temp <= tmu->high && tmu->enable) {
> >
> > I suggest to provide a change in the thermal core to return -EAGAIN if the
> > thermal zone is not enabled when calling thermal_zone_get_temp() and get rid of the tmu->enable
> >
> > > +		writel_relaxed(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> > > +		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_SET);
> > > +	}
> >
> > For my understanding what are for these REG_CLR and REG_SET in this function?
> 
> REG_CLR\REG_SET is offset 8\4 for each register, which used clear\set only
> some bits without touch other value
> 
> 	SET register work as
> 
> 	val = readl(reg);
> 	val |= mask;
>         writel (val, reg);
> 
> the benenfit of use CLR/SET register make code simple and it is atomic change
> one bit.

Actually, I meant what are they for and why are they in the get_temp() function ?

> > > +	pm_runtime_put(tmu->dev);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int imx91_tmu_set_trips(struct thermal_zone_device *tz, int low, int high)
> > > +{
> > > +	struct imx91_tmu *tmu = thermal_zone_device_priv(tz);
> > > +	int val;
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(tmu->dev);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	if (high >= IMX91_TMU_TEMP_HIGH_LIMIT)
> > > +		return -EINVAL;
> > > +
> > > +	writel_relaxed(IMX91_TMU_CTRL0_THR1_IE, tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
> > > +
> > > +	/* Comparator1 for temperature threshold */
> > > +	writel_relaxed(IMX91_TMU_THR_CTRL01_THR1_MASK, tmu->base + IMX91_TMU_THR_CTRL01 + REG_CLR);
> > > +	val = FIELD_PREP(IMX91_TMU_THR_CTRL01_THR1_MASK, imx91_tmu_from_mcelsius(high));
> > > +	writel_relaxed(val, tmu->base + IMX91_TMU_THR_CTRL01 + REG_SET);
> > > +
> > > +	writel_relaxed(IMX91_TMU_STAT0_THR1_IF, tmu->base + IMX91_TMU_STAT0 + REG_CLR);
> > > +
> > > +	tmu->high = high;
> >
> > Why is 'high' needed?
> 
> Need re-enable irq when tempture below high.

You should not need that. There may be something wrong with the
temperature threshold interrupt routine.

[ ... ]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
