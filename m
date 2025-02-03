Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E96D14F12D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595818; cv=none; b=IcGn+pXx3ZKkClYjo4cruu+5G8y8Tzr7pb4awzmLtvLitR7+M9OzFXNbPoAt4y3MVyb0h7axmFQkxjEFERaz8hmKagL56DB0lb1/KpDvFlFbs9b/3JRwp8H7RXBqR7mqRpdJQnv+qF9FjkZP650I/8ZH6ekSlqzoEdNdGKl3geY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595818; c=relaxed/simple;
	bh=cTbrNYJLCNdhhwnl8aRo/ZlBGCgcrth/NNaKS4Dl3I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tncV1Hyp6JsWp+bzNaBM337mR7ig4cuDgNonJayjvihZROksIuzoPpbL4xqSjMS8wpKc0HdDLQsuQvn1tyr2hjpWzpWfwB4Dk2MKVPthzBDkx6DqNUYjulDI0Ztyu41yKVjVgcS6uanjKJhHS/Eti7HxM7I90DuXFFcokD9RhS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bqxzwYD7; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bqxzwYD7"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401c68b89eso4148006e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738595813; x=1739200613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vyj67VRTVYAUNFxIG4OB3HpFs4YteBVpT2TtAqLX6IY=;
        b=bqxzwYD74+gmpc19QIPgSZvpZEIONYQ5r9FegQRbqzokR6ZsIg9D6kTWxv+lJJwvSf
         hdDbFGXSjdZOQzcUonkZjPyiNNg1JRmc5TsO7Vs1EHR2jhMJfakTWPvfJY7bAfvdXIuy
         ZT8mdWe8lj79VqiQv4MCCp4VXtLnv0Jcb2vhS7IWkeFlEbtbV/2pc1BsIfvrJO/GfomE
         xEOyW7pezMiGggv9Zf/34d7yEIaJat2wG3WSSFR/rWOgaaFy5FsCbFdvA6hcF+c5jE2h
         tMSoG8VhnJR1NavOzLSaxhtmqtFdbO3pukFvXsMSJeQTpdH53ZNEw0EbJRWPQIw075Ce
         S8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595813; x=1739200613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vyj67VRTVYAUNFxIG4OB3HpFs4YteBVpT2TtAqLX6IY=;
        b=BxL7vHyg7DEC2onD5O/H1uUeRXAvizBYO2hX6Ct2gFQLF6e8/osznxV+/1t4P+nA1B
         v9mOdzPPmZ48M5B64cpdE9WX+TRK24ny80BpQAvRgNJR/YuPiSWcrQcCMmtfwbgl8ayH
         1Vi7LleiJ+YgBUcZw3BDyyyXsECJrY+4UTd22BMyOz5pjEodvXalW0lX5pyw1rVNlCsS
         cxIFBwkseqMFe2Gn8u59HzuquLxZCQDexgZs9TdZ4CJKfZOxZj9+ae8QEzelsAh1QgDI
         EUgsuPMA5CElmZml2mzjtfNUNtkgJi/AtVfw313pZ7xTuqPrxfb0fUVzmY3xLJULG/2y
         A5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCX7WWaCcZIuW0VNljw/VyAAd5LKg+0MHUqp32W7jf4OvY6QGaIZ3XjDulO0m2ZvgGk7Fy0as6EVl5ECAIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoDu20AanpPxxvaCu3w1OwXEJYJnkioGSgZj1Jiruy3FnhTS3q
	lQSjYVoLU3Y1QwzXe3p+2+Ug0V81+oOBaQV1AMi3WSQZLp4d7nNVujL6TqZXZg0=
X-Gm-Gg: ASbGnctp72Va4ff3ekqqEADuP4LAIhH9TMz59TZfQM7WIx8716rFqxFAR3mNoxX6Cqi
	t6Z/WoXcelnE9IxmXcfXFKLihQdZ7itG9j/H/Pr7fS/jEx3i8mE/8OUbt/uubXH/foAGTGhZeMK
	d3WBfVdHEXfIujNmaH5VYVBK1I9gnCbRMdi0STrvFwgHuREF504yAPgZgx68vLNnCMz8/UC/TTN
	sEsCseUjSyR4rPuv/r/h8VHG38LsMw0zU6GwcrB3Ztl/JVdqzMlUfBQO/W4q+ROCEhXg4Rgh7pI
	qivXBOK+vCcGCLr7FseDeIu6mu87FWMZu5fhVk7uR0FbSMEyMh00f41BHX4Ugv4orMB0H34=
X-Google-Smtp-Source: AGHT+IFvcunhehAneV8WOuwnEKnlJW9yoQuXlRAFhfSrhoXK3pww1JqdTTeDy8iee3YPZkps+263Uw==
X-Received: by 2002:a05:6512:2343:b0:543:e4de:3e12 with SMTP id 2adb3069b0e04-543f0f25405mr4806134e87.18.1738595813396;
        Mon, 03 Feb 2025 07:16:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebec5esm1322732e87.236.2025.02.03.07.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:16:51 -0800 (PST)
Date: Mon, 3 Feb 2025 17:16:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	quic_vgarodia@quicinc.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	p.zabel@pengutronix.de, hverkuil@xs4all.nl, sebastian.fricke@collabora.com, 
	bryan.odonoghue@linaro.org, neil.armstrong@linaro.org, nicolas@ndufresne.ca, 
	u.kleine-koenig@baylibre.com, stefan.schmidt@linaro.org, lujianhua000@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6B822-6UTxQfX46@hovoldconsulting.com>

On Mon, Feb 03, 2025 at 09:22:51AM +0100, Johan Hovold wrote:
> On Fri, Jan 31, 2025 at 10:44:28AM -0800, Abhinav Kumar wrote:
> > On 1/29/2025 2:44 AM, Krzysztof Kozlowski wrote:
> > > On 28/01/2025 09:04, Dikshita Agarwal wrote:
> 
> > >> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > >> index 954cc7c0cc97..276461ade811 100644
> > >> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > >> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > >> @@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
> > >>   	u64 dma_mask;
> > >>   	int ret;
> > >>   
> > >> +	if (!video_drv_should_bind(&pdev->dev, true))
> > >> +		return -ENODEV;
> > > 
> > > Wouldn't it mark the probe as failed and cause dmesg regressions?
> 
> No, this is perfectly fine. Probe can return -ENODEV and driver core
> will continue with any further matches.
> 
> > >> +#if !IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS) || !IS_REACHABLE(CONFIG_VIDEO_QCOM_IRIS)
> > >> +bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
> > >> +{
> > >> +	/* If just a single driver is enabled, use it no matter what */
> > >> +	return true;
> > >> +}
> > >> +
> > >> +#else
> > >> +static bool prefer_venus = true;
> > >> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
> > >> +module_param(prefer_venus, bool, 0444);
> > > 
> > > 
> > > The choice of driver is by module blacklisting, not by failing probes.
> > > 
> > > I don't understand why this patchset is needed and neither commit msg
> > > nor above longer code comment explain me that. Just blacklist the module.
> 
> > Summarizing the discussion with myself, Krzysztof and Dmitry:
> > 
> > 1) module blacklisting solution will not be ideal if users want to have 
> > both venus and iris or either of them built-in
> 
> Module blacklisting is not the way to go, you shouldn't have two drivers
> racing to bind to the same device ever.
> 
> > 2) with current approach, one of the probes (either venus or iris) will 
> > certainly fail as video_drv_should_bind() will fail for one of them. 
> > This can be considered as a regression and should not happen.
> 
> How can that be a regression? One driver must fail to probe (see above).

I also don't think that it's a regression. I think Krzysztof was
concerned about the 'failed to bind' messages in dmesg.

> > Solution: If the user prefers iris driver and iris driver has not probed 
> > yet, and if venus tries to probe ahead of iris we keep -EDEFERing till 
> > iris probes and succeeds. Vice-versa when the preference is venus as well.
> 
> This sounds wrong too.
> 
> Look, first you guys need to explain *why* you want to have two drivers
> for the same hardware (not just to me, in the commit message and cover
> letter).
>
> That's something that really should never be the case and would need to
> be motivated properly.

I think it has been written several time (not sure about this commit):
to provide a way for a migration path _while_ people are working on Iris
features. Being able to A/B test Venus and Iris drivers and to report
possible regressions or lack of those on the common platforms supported
by those (sm8250 at this moment).

> Second, if the reasons for keeping both drivers are deemed justifiable,
> you need to come up with mechanism for only binding one of them.
> 
> I already told you that module parameters is not the way to go here (and
> the msm drm driver's abuse of module parameters is not a good precedent
> here).
> 
> If this is a transitional thing (which it must be), then just add a
> Kconfig symbol to determine which driver should probe. That's good
> enough for evaluating whatever needs to be evaluated, and doesn't
> depend on adding anti-patterns like module parameters (and helper
> modules for them).

No, Kconfig complicates A/B testing. What you usually want to do is to
boot a kernel, then go over a bunch of files testing that they work with
both drivers. Kconfig implies booting abother kernel, etc.

> 
> Keep it simple.
> 
> Johan

-- 
With best wishes
Dmitry
