Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CF027780D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745320451; cv=none; b=CNx2/bvLjRCzZGxSHb12/4UAc9TokhVPnmeaxhW4vA4Syi2PH4lwZkjFF6SQtgAElThRf7h57ii0ohl66X9MYFn8LmRCs+0BA/FTOnEFJ4Np8zbTRWhzfNUf+zGE6T5drrZUuNYprknlH4WwmTcHU3Cqr+YRpRYEIa+IriCacXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745320451; c=relaxed/simple;
	bh=qSiznDXleNOAkSCZwIiatCf6cfKR8iaH+F7+sUjnUek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZI1r1kgVZ6+ed8jiZcjFbz20C0+9PNBCBLN8Etrz0SGBil0PCQ8+rUea1FrmJ0DqkKfGeIBpiZ460M/tmrdInCDm/NSDt9/HXp/Lm1nPvgvdIatSOoZAZITyuLFEohH3fdBDb/wrYiCgR77wRoG1EUD0zOAZocjmlgziFALXpR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=txhIeU8c; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="txhIeU8c"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso6972377a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745320447; x=1745925247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgbXNBvCuEJYIE0pXZDQAMWNUKSSQY6ygdNKadxfU44=;
        b=txhIeU8cresKrGRAxVnUSEKCxUwXJ6OM/3JK9is+dKxoYOKa7dPG9iV27WSKtUBtJz
         H+ssBmMJqcc5dfSr2lYZv/DTfk+kkEDBppGr7zXYoW0jBz8PpUMufFRyEaCQCKBnKpCH
         FCRHB4qTr2mkTQJYyH9g1DqqOsGLl4UfFJe19hu32FKSAiNBju2ByxtQdii/sU9JuGv+
         XFkM+3f2BFjbpVC0ucn+Lo5+cNb4B07K8FYXy5Jtn9NxTtHuc/OgAGzaOZ2oetHTurud
         CbHtTeorZg2QnboH8GSVjmtexsklJFzlIW1KpjWUDW25YXa/clDYRurIMrtuCAC+dkUc
         K9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745320447; x=1745925247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgbXNBvCuEJYIE0pXZDQAMWNUKSSQY6ygdNKadxfU44=;
        b=tRnfB5mvdChhEN+ydLELKZCMb46jcRUqrbjz5wdissbak1AU2TrwvAklB+MWmmK8pX
         BDN4/iaYMp54OwH5NBdXLiRJNnOhf0StZ9/sOZCMYvle5/Wxw5Dw0CPRiOuA4Z3TgLYS
         hjX9Ol6oCE2VVBU8Zf4X3M1zNhxMa111GFMWaHeBoTIQ9f7OzUrKiyMCOgs8oThpUh0+
         rRsO7udMzveBcvhHT3GRydKPKs7DKfcaowrx6kqgI069ACTfWxcj6mZbGcRvHiQ4UR7/
         rj/gbGehvGL9Ib+2y/kXe/PcfrJidNYCr52wyBgoIZw6GF/DIXlsZXEWimFOt/aYHFMy
         /Spw==
X-Forwarded-Encrypted: i=1; AJvYcCUU4xwQAwNEaF1c7RBuHM1e2eGf1Bub155v5fWGRuiuFbUVoA3QotJHNavl0UkoRCI1y/Cmn2RJ0fSb4SY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsKMKeFY2pLZJmM9nzDKuqvCmdSU4A6uRwkmSWB/aNz3XVEU+b
	2qADprsftdxpXK0+B1gX73fWcSSLHXQ/5Gu79Mh3sgXc6ULRj3aytKoPhSWlEWw=
X-Gm-Gg: ASbGncuUk8+I5JePVfGKYTjD53X2uZKzsxs3tgQFZMg9nMrwfkV2j4OXf6osyCTjPSV
	Zpkd4V+vL8AS+EeGLpaEpZ2fm8QYi0HFaVBHyOzCLEH+blB1wRiefARVoeLrwxyurSQCWQO0wLZ
	tI/OygRvAYBsMCJPKs8oobOHnSGrhU16wykSMc/+YdKdDvl2L96C09HfGZOsbWAQJ+0/T9LXS8M
	JJGismiTOyYM8pzzKjAl5k0EBC9RR03zxXdSeANjmTvqztA8ZBfHrA5DgoEVAkL455c3ADQG+EE
	XYqpB5h+LY/R9bqjwPndjAV+BsxL5yemsN1aPA==
X-Google-Smtp-Source: AGHT+IE06nR0A/M7mSLIupDO7jo77HX95fMZtgnkNH2aWjHYV8Q6JOYWLb9+gf9S2Egl0ZiFBB5SzQ==
X-Received: by 2002:a17:907:7f91:b0:ac7:19f0:aa5a with SMTP id a640c23a62f3a-acb74b87099mr1491712366b.27.1745320447274;
        Tue, 22 Apr 2025 04:14:07 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acbb96f3396sm152840366b.120.2025.04.22.04.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:14:06 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:14:04 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e001de-devkit: Fix pin config
 for USB0 retimer vregs
Message-ID: <aAd5/IEi9j7WAq5D@linaro.org>
References: <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-0-1c092f630b0c@linaro.org>
 <20250318-x1e001de-devkit-dts-fix-retimer-gpios-v1-2-1c092f630b0c@linaro.org>
 <abcf5f26-930a-4ce8-89ff-fc5405fe7b19@oss.qualcomm.com>
 <Z_kD8DJCPCJSu9-F@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_kD8DJCPCJSu9-F@hovoldconsulting.com>

On 25-04-11 13:58:40, Johan Hovold wrote:
> On Sat, Apr 05, 2025 at 01:08:46AM +0200, Konrad Dybcio wrote:
> > On 3/18/25 4:50 PM, Abel Vesa wrote:
> > > Describe the missing power source, bias and direction for each of the USB0
> > > retimer gpio-controlled voltage regulators related pin configuration.
> > > 
> > > Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> > > index 902335396c586a991c4a2de19906b039d887780f..8e88e00c335a05d0d36b4b08b85df82f38ef4355 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> > > +++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> > > @@ -1039,6 +1039,10 @@ rtmr0_default: rtmr0-reset-n-active-state {
> > >  	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
> > >  		pins = "gpio11";
> > >  		function = "normal";
> > > +		power-source = <1>; /* 1.8V */
> > 
> > Not sure if I'm a fan of these comments but sure
> 
> How come? 
> 
> Due to the incomplete bindings for these PMICs this is currently the
> only way we have to document this information. And AFAIU the voltage
> mapping can even differ from pin to pin on the same device.

I agree.

> 
> I would prefer to see a space before the SI unit though.

Will do.

> 
> Johan

Thanks for reviewing!

Abel
