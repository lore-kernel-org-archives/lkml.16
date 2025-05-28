Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9B7244670
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448324; cv=none; b=Xary9JY+FXAG0GHeEBY8cnfvgQEK3GkG1BtBlquoBE4OQ0Ic2hMEkjJTNnvpL9r270vMvYgZI6uXwOT1LrsgiQU+Y08ClOcY2ENK6wRsk5Q9n96eoElrzF9z0wfzrc2D4OwegjphBC5tKOtlyokn8/wJRNkDly6FYvU0+xuqqns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448324; c=relaxed/simple;
	bh=DcRREdQ0ZIb5xF00hDHe1rvvAjFzi38y8N1Y5D0c45k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWQQPDkq6jnyJZlgiXg1Di0naezR+a89cG1IojxKH0QwnVTxJNYuHiIz8pwQGGS8kwZE0HR36rQaW+UHjoDn/R8tuC5102C4ZuyR8vKNS/Tnx/stqQD4lkz8oCJuXEEqLsLIHGe0NbW1g7TkY6MYKs5m+crVpgnjgM1Kl8DeoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qSshGpZ6; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qSshGpZ6"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7d925ff60bso3377355276.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748448322; x=1749053122; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w6tC/IsairDziVWtXhkaDimMYA0/jNvKbB4X1Lbk06g=;
        b=qSshGpZ6ItWc+JjyMXR2REHAQc/3Pziq99/UpT7Ijf1RBHG0RPIc1TRpPb+A22tglG
         zUD8QdytkIx5O8U+/Vw+wZNYZ63f2fFKmo+3h7AhAhUwkd8fEiSJ0Pm9BICC73TnlwUo
         Bn+xHyXgrUd6egnSBpgo8wyrbR6Xzy6ph0MunleESFgCWgtcquwhJSYu1WK4SaccwP/H
         Fq7xz4hVk7MnYE0ixGsZk+l90k9R8+L/U3n5mlHdRtYRNYahWSXunL1qQaZn0n5RZaiR
         +gnuJx+lq4/mDapjVAGRW3pyzWSCjqitGKdJBzpowDlzoCYBn+ln4rdNiJbabBrmSlXw
         J+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448322; x=1749053122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6tC/IsairDziVWtXhkaDimMYA0/jNvKbB4X1Lbk06g=;
        b=Zf5ZZaDZry4OV16fk6iiit9VSiKtOKJJRR5MVQ8H4IzaJlVdPkSgrU3/q8QXn7UyM8
         DjQUWbWUw1kLZvnUrpvejKBvHCaBmGnNvtOmrWdXKwDRb9Vzj/iJGP4lk7xXXAXOGD0c
         2WuCyCWk8b34u6khDjEdsyJDN4eSF5vtf01rYWXo7XaTGN2lDqc/4EbW8X3usiLLV9pQ
         N32olUcTcEArqu6TXB6GBAwwWaVUBOl3GlcKaLduDto6NKKS8g4LRye1PyW37GAN5tWA
         Ra+Lb1Kaz2SdV9ewxf7iaOWwWHKwc1Ts7hmuEgevsf8/mRUBOwZ5ikTfrrK5ZvxgXdh7
         1iaw==
X-Forwarded-Encrypted: i=1; AJvYcCXXSbVnW7hQHQtdMz48CUzg2mY0/+V3Q9cdn6DbKfFMOAVmGFLGx6zcIXV2ei1MlFDke3IOl0MT1dROgiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+v3xGCOl3UWFPZDEPK8yzWpNhfXcfB1Nd7shr/eWw/r1ZKJw
	/KzYvperym9x/4WnMj7km/u0KHSiVJ7A2NAb3hpurbpYiG90vWcHq5LZh1D/5KKsskiOdrUUwHv
	AcSNUUSWN3PcLLGdEQxEkMKq1yz/7WaphlLxBhjMo3w==
X-Gm-Gg: ASbGncvD00InDeeh1Uao74TvIW3Xbz2TA+LxPZP1vcNqS1FMIBbbyncUxI+CYBqz1n+
	y9oqEvmZsiaCtGmwimbx7cSUg9i9BTkUbtcHGMpEnpsxOPPExfasEcGgl4hMCS2CowMpLBiQowT
	pPvqfu8WyLPIeRJOjlDVhcCLvfFEZxd5vgsA==
X-Google-Smtp-Source: AGHT+IFnwa31CIcmyHHl56Vao4/q5XtrthfioWrNJoyx+lhgVVPWYbbs9O9qtYqlGYN36k/DfrFLU8QJs8LWaKoEyMQ=
X-Received: by 2002:a05:6902:2203:b0:e7d:b107:d829 with SMTP id
 3f1490d57ef6-e7db107e038mr15334137276.34.1748448322260; Wed, 28 May 2025
 09:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
 <20250526122054.65532-2-claudiu.beznea.uj@bp.renesas.com> <hojdkntm3q5a5ywya7n5i4zy24auko4u6zdqm25infhd44nyfx@x2evb6sc2d45>
 <111d2d6c-8ac0-40b9-94c3-02f2f64ef9fe@tuxon.dev>
In-Reply-To: <111d2d6c-8ac0-40b9-94c3-02f2f64ef9fe@tuxon.dev>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 May 2025 18:04:45 +0200
X-Gm-Features: AX0GCFuID4VhGiX2apyC0Knv4lDmWLbvgXL8Xh33MSHxiRPOzOEH1v_hZ2IXp8w
Message-ID: <CAPDyKFoQYTNBhtBXY-Ds7E0TohtA6558W1Jf3cLsnXDQC74DSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PM: domains: Add devres variant for dev_pm_domain_attach()
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, len.brown@intel.com, pavel@kernel.org, 
	jic23@kernel.org, daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, bhelgaas@google.com, geert@linux-m68k.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

[...]

> >> +/**
> >> + * devm_pm_domain_attach - devres-enabled version of dev_pm_domain_attach()
> >> + * @dev: Device to attach.
> >> + * @attach_power_on: Use to indicate whether we should power on the device
> >> + *                   when attaching (true indicates the device is powered on
> >> + *                   when attaching).
> >> + * @detach_power_off: Used to indicate whether we should power off the device
> >> + *                    when detaching (true indicates the device is powered off
> >> + *                    when detaching).
> >> + *
> >> + * NOTE: this will also handle calling dev_pm_domain_detach() for
> >> + * you during remove phase.
> >> + *
> >> + * Returns 0 on successfully attached PM domain, or a negative error code in
> >> + * case of a failure.
> >> + */
> >> +int devm_pm_domain_attach(struct device *dev, bool attach_power_on,
> >> +                      bool detach_power_off)
> >
> > Do we have examples where we power on a device and leave it powered on
> > (or do not power on device on attach but power off it on detach)? I
>
> I haven't found one yet.
>
> > believe devm release should strictly mirror the acquisition, so separate
> > flag is not needed.
>
> I was in the middle whether I should do it with 2 flags or only to revert
> the acquisition.
>
> >
> >
> >> +{
> >> +    int ret;
> >> +
> >> +    ret = dev_pm_domain_attach(dev, attach_power_on);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    if (detach_power_off)
> >> +            return devm_add_action_or_reset(dev, devm_pm_domain_detach_off,
> >> +                                            dev);
> >> +
> >> +    return devm_add_action_or_reset(dev, devm_pm_domain_detach_on, dev);
> >
> > Instead of 2 separate cleanup methods maybe define dedicated devres:
> >
> > struct dev_pm_domain_devres {
> >       struct device *dev;
> >       bool power_off;
> > }
> >
> > ?
>
> That was the other option I've thought about but I found the one with 2
> cleanup methods to be simpler. What would you prefer here?
>
> Ulf: could you please let me know what would you prefer here?

As it looks like we agreed to use one cleanup method, the struct
dev_pm_domain_devres seems superfluous to me.

[...]

Kind regards
Uffe
