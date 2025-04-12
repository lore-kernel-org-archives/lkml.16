Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5907917C77
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744430593; cv=none; b=mCf5X4eQ3NQfWBCqwiFVO3+kaYQnQoW1AozRinMgWHF/9oltePPFbGyHxINU90ldkiRj2p8FAXAzajCRaNlYAgrY5j5vDRkoigYmUqdMSaGahkrjuoaaipvKSls0mVFUNBDIo23gtKwBlK9ZY4N1NMVc2I0p6xT3tikF0/gl6fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744430593; c=relaxed/simple;
	bh=wXyqIaTpw9afllPvX5CGHehKOzXZG0L9KEgBgbEVOgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UyuOfXJ1yGcDCFo3+xbuS/jLDurl49pCXmbkXPS9vT6YOtcXd+fz0QNzX+bV7hAbEhAh1er7mNFaoVfLdrwCedEeQleFSBqvOlPYAVqqMX/hQ+GmIIEFqvsOBo0MadDRQiCR6n3g2SDtLebjivZv1BB+KJ3ydX3c94tca9T+64c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=edrK/mwL; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="edrK/mwL"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so3394395a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744430590; x=1745035390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUbODakS+dMo9JCC0ZJQTM4QsCGguqQTrC9WcbsAzHs=;
        b=edrK/mwLFUIry7ph3sLO3Bv/TpqNnzheb0e3QbxERFA3dQPx7EUNrjoV62oErdz4CG
         aHyNb+7S6UFsoKC3Q3Dw9iqAEMXwrYwk5NFfEmbXiU1+rzq0FnDemk9K/arA6HVXoTRU
         wfRR/cZEyynbZ0TGMwM2b4jS5dwBo8xcAoXgTfPnPcffE238ZN/vMeIreV7rb4gu3xm3
         +uUDe3hOTEteMB0D3Ul7kR94QRRWtsWnX/dZ62HVnIB3JwbnM9r5PbfRAxQ+vCGaqpYh
         mfqDmhHTRa1oGvzNGTUh1PovTw14DtNKJuL8E2U/cDuokGryI/7fyouGRejkgJDuS8wy
         +oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744430590; x=1745035390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUbODakS+dMo9JCC0ZJQTM4QsCGguqQTrC9WcbsAzHs=;
        b=Oa2g3drIH4nk5X/8R9rr8ah/tUG0ZLdq6BWDHy1+u7Cxual3TmSO0+OfxMQ00pA8jV
         ch5F1yjWAwh26uxhIbWDZWMEQrXzx7j8gTEuqGHkkiwIQ1byVdbpJ1ceTZUHLos1HW1R
         pQAcq21Egd/KaRMQDuyQAP791vN9QFnB/gS10J3O88l2cz1r5pLv9GnWAp1qL5lqGkl1
         wXCyqD2MMHHoJXeVLwVVh+jjfpIQlrijvoajWU6dkmeIlOLc9lqhYMcPtKp+81xTOn88
         h+I1egLWH5vBQQG30wBMNByap4dy03uG9Wehz8tGV8eLjvlUrBPik0/KiD2QSzRa1DCV
         4W6w==
X-Forwarded-Encrypted: i=1; AJvYcCVvSy/ZC1iwxJePQXb0Fxc7bjYOF8wWGMHfpWSVkXSClZg+HN0BcUsXD92jnaxFu/g//SeV3v8vJyIu8x8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPYjlLcf6XrRm8qjXvBgQ1Hc4SEfjOPqj19EKcZdMasHmC2yB2
	wsUZCFk0BaRRygKUi9VAQNMVcREQJh7Gvo1g45ncpTQE7UkF2SPaCiMiuN1Rp2Z3s388TTkoGXu
	fPDZ6Tymav4TwvxZ2NSRbBuVrCCRHDCf+hp6+ng==
X-Gm-Gg: ASbGnctZwU9KUskxfG/mhZmmgk6+GxDz7RMifdCGFflijYKIfRAsPWMpxhFiPVBWiZC
	ukj1LsmGdIs7xOwCikRLkQEOyoQfD4mZkM+iICPZcs+7yONrsbjurCPfPE+Ic1pmEsxueQ5AIOs
	eaG47jl9imAatUEVwdey4xQ2Q4AQ==
X-Google-Smtp-Source: AGHT+IGsh1nJdWpngVYdZEjRa500viVTDTIM2UIG4kOF5wKJ53y1JA8yU/LJhMtvputUGsrQYMa3hGX2PPtSxqSmAd8=
X-Received: by 2002:a17:907:3f17:b0:ac6:f6ea:cc21 with SMTP id
 a640c23a62f3a-acad36bde74mr430450766b.55.1744430588921; Fri, 11 Apr 2025
 21:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-10-guodong@riscstar.com> <6fywndrxglozw2oqrfs66l3hxxsrv5uf5hdiuyv4a2uczwiiki@tmijrmuidlin>
In-Reply-To: <6fywndrxglozw2oqrfs66l3hxxsrv5uf5hdiuyv4a2uczwiiki@tmijrmuidlin>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 12 Apr 2025 12:02:56 +0800
X-Gm-Features: ATxdqUFY_6ozkYJSalNYLyr5XEWoGtVTgxstwPMi-eNqZST8o16MQumLG_Ya4qg
Message-ID: <CAH1PCMY6xKULTbekr+p6mA_gRDogeg5tyMHFuTKG5SzbVMACfQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
To: Inochi Amaoto <inochiama@gmail.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, 
	drew@pdp7.com, geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	elder@riscstar.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 6:52=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com>=
 wrote:
>
> On Fri, Apr 11, 2025 at 09:14:23PM +0800, Guodong Xu wrote:
> > Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
> > to support the PWM controller used on the SpacemiT K1 SoC.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> >  arch/riscv/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfi=
g
> > index 4888529df1d8..9bd972867e0a 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -259,6 +259,8 @@ CONFIG_RPMSG_CTRL=3Dy
> >  CONFIG_RPMSG_VIRTIO=3Dy
> >  CONFIG_PM_DEVFREQ=3Dy
> >  CONFIG_IIO=3Dy
> > +CONFIG_PWM=3Dy
>
> > +CONFIG_PWM_PXA=3Dy
>
> Why not m? This can reduce the Image size.
>

Thanks Inochi. It's better to use m.
I will fix that in the next version.

-Guodong

> >  CONFIG_THEAD_C900_ACLINT_SSWI=3Dy
> >  CONFIG_PHY_SUN4I_USB=3Dm
> >  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=3Dm
> > --
> > 2.43.0
> >
