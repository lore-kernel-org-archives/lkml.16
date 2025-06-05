Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C311876;
	Thu,  5 Jun 2025 06:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105147; cv=none; b=NkrVsudIMAdbRs3vt01aJE+8jWM8Hx4bWJ35noeVS2gmTNgwGR3HqhgRO5jDsVszBdWOUAO8u+DaysIaCxrLgb3dudxusgzqc7P+i0+js6Z6sgPESAKrvt73OufRuVNIjEHtGz78lUdXjVXhRbw12rgxHGj8z2BghKJVbyIlU4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105147; c=relaxed/simple;
	bh=gB6fIwIufnfLkaIn9IQOpIzAXVJMfLb+nWj7kaZiqFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRXP900JZFkclE6vM5bbpQZ/4+rTmuwae0HNzbkyAeFtxumdZL1wpWP559zybKxhH0kcdLopQczQJVbogiML74AHAemfaSaTsg8tBcsR6QehCzchKVJNiuKrxkQsrmFXKrnmULAqJhQoFYTVJ8CAcDJhuXE515m2W3RVdqatUK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6FgwEw1; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6FgwEw1"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7481600130eso805747b3a.3;
        Wed, 04 Jun 2025 23:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749105145; x=1749709945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVNbV2XHvQT3/8z4B+RVq7tYXw6lKXe0E7JWahAFCMk=;
        b=F6FgwEw1Rydz9fVqAOvy4qfjLHfZHPt3NE02FdKM54YAxyeh1h20YBBp3vgGnncNK9
         To+NfCjCDzGamfhZ2ZF0ZVEg9jUjarKbrhVWKa9BrLXWszrsiu91JQYzoNYoSPbEpZFs
         D0VxtNdaRd+iuDbxgvnD9EwSvlH6aZgMfRKIP79a6wwY+LF+a+h5+geIx/wLXqJflkAV
         AqxW6+9yD7QlV7IdqvXdJ42vscLZk/VL9XRURMHnnfWb0UmhzT2HGkP1GMSBKnhCA2Fn
         MEh7HyDayy67zHXuYaDCaOW2XU6WvYwdFsdq4KAGlpe2T4e/yfAZT0NUZYEzPfZp3GkR
         ne1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749105145; x=1749709945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVNbV2XHvQT3/8z4B+RVq7tYXw6lKXe0E7JWahAFCMk=;
        b=Ho8wWgx7KUF5RMeV3nVNZg3Ql++hUk1RWdpSg0tQWiHtaqiPlkOY/W/Mt8k7H7gOoi
         hBrjFTDbSOpwebqYsNVn4Pvnya9LHXFHnqighYxlsrjmq/NPqVg0CtnlC47P1EVSE1HL
         lGwTiUIzBGh3zkur4eM32TmX0cmSc1mjBZq4SNAKy6GFvbIXTgitQc4h2nGebe6hjWhK
         mBICINXLKudRc/zu/Bku5/Lqz/mMhVwwaEO5n5NSDwYDDjVeaiGh/AdLy6vnTjjq0DnH
         1r1P328DCTMwBr2BvWIu3ZxT1uHKH2DFzNahx628aGgivOyYwEnhS49ftHqY/zbftiov
         qNaw==
X-Forwarded-Encrypted: i=1; AJvYcCUljQiDNCRZ2QI8HNEt0QbcO4m7A3t7oKsoWNua0nAKX/iiomZmrkydNIIYYMST/5txsi0giIiqWZN6@vger.kernel.org, AJvYcCXG48lr0MeO2x3rco2d/uEZVs5ymvU9N0SOKVuTnYnWl2vyqeWV/9ckRy/z72Q7INt4zREtdIe1wR8f3fgX@vger.kernel.org
X-Gm-Message-State: AOJu0YwdWnJQLiooLnNlKThdypiKEQkja9TQRXn94PJ0Oz5pVy+BsjGP
	60PexvBaLUD1KdVpDdzKaZtpGHarfeVGAN2it9bdBeHkATKuDEiwV4P+0mRy2P8dMxiwX6gUObT
	KfV1FsHstctfZ7RKKFG+23y+iBLWDuSbQyvBAgbnqIdt3
X-Gm-Gg: ASbGncvlfcQP3tRDNpIsLWEpcNE8a9BsdRcfdRIcehLOAD7xp3dj7O3dm2Bx95T0x0y
	jNkf8iOheENeNsp/3LqGf079xs/1mX1poskVrU9Ai9W03w5xD13IX078C2JFDZRnSzEsbZV/glW
	Mm5ZaWGMM+/RwnEjJTK9euoY5dMP/Arp72G2+aA/j4I2fbfZ1tt+G/GrteUBoGfTNPVw==
X-Google-Smtp-Source: AGHT+IH4DMJVVSc23A8ySI5zWwdnqMPJwI4JcymO9uLuxpbdW2R54hTNG5gzhmW7FhrMsuuLb3uqrUpjAv6uXp6wyzs=
X-Received: by 2002:a05:622a:578f:b0:4a4:3c3e:5754 with SMTP id
 d75a77b69052e-4a5a587c45emr97845681cf.32.1749105134671; Wed, 04 Jun 2025
 23:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com> <CALWfF7JOJSihtfqrFiZtTxnzvoU6FP3WXuWjYOVaAvjPJZWWgg@mail.gmail.com>
In-Reply-To: <CALWfF7JOJSihtfqrFiZtTxnzvoU6FP3WXuWjYOVaAvjPJZWWgg@mail.gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 5 Jun 2025 10:32:06 +0400
X-Gm-Features: AX0GCFuUQCw_ESq8wm50RxhnfDipXmHgsUt5otEO_3lzHNgvENZEo2Fw1AWJjAY
Message-ID: <CABjd4Yyw5xStJYU5c5snUGpBjEYL8=qoj=bWYLnuzSWzr8shaA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 6:43=E2=80=AFAM Jimmy Hon <honyuenkwun@gmail.com> wr=
ote:
>
> >
> > +&sdio {
> > +       bus-width =3D <4>;
> > +       cap-sdio-irq;
> > +       disable-wp;
> > +       keep-power-in-suspend;
> > +       mmc-pwrseq =3D <&sdio_pwrseq>;
> > +       no-sd;
> > +       no-mmc;
> > +       non-removable;
> > +       sd-uhs-sdr50;
> > +       sd-uhs-sdr104;
> > +       vmmc-supply =3D <&vcc_3v3_s3>;
> > +       vqmmc-supply =3D <&vcc_1v8_s3>;
> > +       wakeup-source;
> > +       status =3D "okay";
> > +};
>
> When you enable the sdio node on your v1.2 board with the broadcom
> chip (using SYN43752), does the btsdio.ko bind to the device and
> create an extra rfkill bluetooth node?

Good question, I didn't have it enabled in my build:

# CONFIG_BT_HCIBTSDIO is not set

Let me add it and report back.

> If so, you'll want to blacklist the SYN43752 chip in the btsdio.ko.
> Similar to https://github.com/jimmyhon/linux/commit/81c14dc2dea2ceaea8d39=
0188b352d32e278abc8
> The original logic was introduced in
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/bluetooth/btsdio.c?id=3Db4cdaba274247c9c841c6a682c08fa91fb3aa549

I will check, thank you for the pointers!

Best regards,
Alexey
