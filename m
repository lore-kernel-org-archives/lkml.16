Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3953319BBA;
	Thu,  5 Jun 2025 14:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749132891; cv=none; b=M61/TRAzRU7bZFMEGe+scNUlBIg3TLvLKWFk/xr1K//jdEcdsjGPw6oq66mJcFHOo/qtZEow7fOwO/hiyG60fxxrq7vwmlPc5C0sJEHcb8wzf9aPKM4lvSWUkPc9ueMRoMsc5BTxTqgK3ClHAaznkRJJaFvrKL0g9dl0GBJXyjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749132891; c=relaxed/simple;
	bh=JrtNKlh2fzjn8rIMh4pAOowoaYbhoOng+xQ2RiDFzA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXpn/Ym/uTIeoSpEmplu7PW+ACDS2xtQ8XY/QbUXVgOE1LrK+aRWEsr/kdY5PviSR2D7NS2u+so+3liE3UZV8ocRLZ3mT+Z6gfNj+TlZHUV5nMA7C7eqPsl9g/ONf+8ONeanfObjXclornZj2Exd+udk/0lR7bn9Dq1w1eYPQkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAQwkHbE; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAQwkHbE"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a58b120bedso11493311cf.2;
        Thu, 05 Jun 2025 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749132889; x=1749737689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkpL8b/AS9RsSObYgLJmIHBt5nNILWA82P2+A8mQBU8=;
        b=JAQwkHbEGHha1zc5UJLrA32Mke4NqqKOjShIpkd/r5+x+OpV36fb8kJ67UnFbOoqbj
         AYBA3+QpEI5lSKaWYT/UFhTCaMgOZzR7Na8ddzx8+XzFN3ZfJ3S16+99FMvrI5qFTKjj
         biLrZkQZnnOriii/0dbM3qoMxlSOkCwzAR85Ua4ciWYzq0W4oc70k83BtPBnNWJjnBac
         x3v/nq3cjxYArNTrVzxpKohbLYEI0mvahyzQJBHv38y3INTaD2XI5Txb07TBwB1SeZKL
         1Oj3oc7h4Uk4Z1UWC3EVbqIAgbvDFIEOEGtA5XRXFUOvGhd8MrMLB8fs+3UYFN/lfgSr
         okIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749132889; x=1749737689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkpL8b/AS9RsSObYgLJmIHBt5nNILWA82P2+A8mQBU8=;
        b=rXTv1yf/xcypnP7Pc4ewTFTljLk1nzzbFdVG0fg8hmR+RuP8ZGMIeIXnHaUdAOW7T6
         ECAVNvK98ByucJ1xcmQYCSQNuNdM9FB/tCiSJsy9ugUXxtJqP5ByukFyZOOJb4hfGSIL
         cWsJ0NFF05e+RMbCVXmS3Um+xz61xAzhsVi3RqCHvt9uOm8W8KeoktD2jVSBhpd5QofV
         nPWXIVlJL+GR4/qjQLP15jXT1bK23qcaFLJZea9yGe+iNGC6LhE5am8HEbx4O9EDdO1G
         UOUk2ZC/1d7I5VzfsePM4s9A2ZrHyDvEuqT30WPQ03KyJhX1VdEf9VTEcEwhLeM1Aeld
         gOVw==
X-Forwarded-Encrypted: i=1; AJvYcCVQpTXsYUQGkN9fl9xBaj9TmQbgu4aRYtorzPC3Eca/ruCqFUoZ4T7g9HElRbHu/vVqMArdDzsKrTR2dIWT@vger.kernel.org, AJvYcCX8OlrKqkjat1QvcEg6DexspYlIsPoRpNwvZJQolyWzlXTkl0xCvzhPMWxy632sbgS/HhE8wuC8ZZ8D@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8IyKEIx66rZd+Zdl6Ufx+R46nWYp+Z/zcfwSpeH4D3K7GdXQx
	enAdi2UnS34kWESWAmx/iwnMVlngGaVKb2+yzy2ULTl3s7+piHb/s7i3dYyKQP7X4puZlcsq/PC
	/I37SawdkYuVucIY1FSsWu0Gacjx3K+4=
X-Gm-Gg: ASbGncsfyAK4cBga9ZjqaZJCPWvLWlOsQd9b6RRw4EDKhx9TQXVP0Cxia+bbviayvTt
	bP4PjNcddjcHnXyBUf5bhYSR8y9q6HVklvnKwtXPdMqGNtK3LTxaZQTGe0cqgmkwa3YrJOeepTd
	r7SAG8Neu6xIHam8q22lZ9tWD1NQPcWKL2RHdThQA+XUSY
X-Google-Smtp-Source: AGHT+IGa9rjNtqi2gcZ+Jy9RBTcGFMFtkIHolkdkm7GT5pfvGPDtmpQYLeHP/w7YNZqumqgJlkxOAca7Kn7xJSgw5Xg=
X-Received: by 2002:a05:622a:2597:b0:477:ea0:1b27 with SMTP id
 d75a77b69052e-4a5a585940emr88797861cf.26.1749132888682; Thu, 05 Jun 2025
 07:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com> <CALWfF7JOJSihtfqrFiZtTxnzvoU6FP3WXuWjYOVaAvjPJZWWgg@mail.gmail.com>
 <CABjd4Yyw5xStJYU5c5snUGpBjEYL8=qoj=bWYLnuzSWzr8shaA@mail.gmail.com>
In-Reply-To: <CABjd4Yyw5xStJYU5c5snUGpBjEYL8=qoj=bWYLnuzSWzr8shaA@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 5 Jun 2025 18:14:41 +0400
X-Gm-Features: AX0GCFsmALQLaM1XKsOi1NqcR0aDewH5t0oKv8VcCgYbI3soKcm6cUbwmVeg7L0
Message-ID: <CABjd4YxfG3WZxRL3ihQLtdVdp_3Hq=TKKrZJktJ_C5i+xCM2Ag@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 10:32=E2=80=AFAM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> On Thu, Jun 5, 2025 at 6:43=E2=80=AFAM Jimmy Hon <honyuenkwun@gmail.com> =
wrote:
> >
> > >
> > > +&sdio {
> > > +       bus-width =3D <4>;
> > > +       cap-sdio-irq;
> > > +       disable-wp;
> > > +       keep-power-in-suspend;
> > > +       mmc-pwrseq =3D <&sdio_pwrseq>;
> > > +       no-sd;
> > > +       no-mmc;
> > > +       non-removable;
> > > +       sd-uhs-sdr50;
> > > +       sd-uhs-sdr104;
> > > +       vmmc-supply =3D <&vcc_3v3_s3>;
> > > +       vqmmc-supply =3D <&vcc_1v8_s3>;
> > > +       wakeup-source;
> > > +       status =3D "okay";
> > > +};
> >
> > When you enable the sdio node on your v1.2 board with the broadcom
> > chip (using SYN43752), does the btsdio.ko bind to the device and
> > create an extra rfkill bluetooth node?
>
> Good question, I didn't have it enabled in my build:
>
> # CONFIG_BT_HCIBTSDIO is not set
>
> Let me add it and report back.

So I've rebuilt it with btsdio.ko module enabled. As I boot the
system, WiFi (via SDIO) and Bluetooth (via UART) drivers get probed
and load their respective firmwares. btsdio.ko doesn't get
auto-loaded. If I load it manually after booting, it doesn't bind to
anything and doesn't create any extra rfkill nodes.

Is there anything else I need to check or look out for?

Best regards,
Alexey

> > If so, you'll want to blacklist the SYN43752 chip in the btsdio.ko.
> > Similar to https://github.com/jimmyhon/linux/commit/81c14dc2dea2ceaea8d=
390188b352d32e278abc8
> > The original logic was introduced in
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/bluetooth/btsdio.c?id=3Db4cdaba274247c9c841c6a682c08fa91fb3aa549
>
> I will check, thank you for the pointers!
>
> Best regards,
> Alexey
