Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD0C3085A9;
	Wed, 18 Jun 2025 17:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269153; cv=none; b=B4Qd+1Eyv7uaCO3tHT9wEzNO5BwaZgvazS5YtG0hK3gXZ+yPQ89Z5AMP7BhSK8S9sKCY6Se6R0LcC30QZN+ePm7aCDDKeaRdsXaGzc/yETRHvdo7y/IwNO5S0las5j0a+041Lt0YNxcgBYClPovdJLYGIEkewP+KLjxa1EVYTLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269153; c=relaxed/simple;
	bh=wrLCEEBagHinaka5txnVA6Vx2nhKm58YqTyUeMm0ogI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIgX6eorsBblHJzR47VlI4qVmKjTyBpwMhsI/n6uEo/gVLDOwVK3f+cgUHtz924o6QuKB7CSSnAXbor+pGmMt+lvZMWJfM6nmxt/OSzqpN97bplLcIq7oQPsz11H72aJ3aZJFPwKUP0sF7Sa3XwhSI52M1NYKfNokS/gGtD540s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDR6gzGH; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDR6gzGH"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso25259185ab.3;
        Wed, 18 Jun 2025 10:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750269150; x=1750873950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiZhn9um+VeiLM3OTddCldxchfZplFLnri2Dg7rfYTM=;
        b=DDR6gzGH6e2jk7Vwwz22T3W64+fSCKCZOCHkypZ02EC0/U/92lSztn2vuns/ZQLY/q
         +hSkVOkwciS+ob5b3FnvUj+0yA5J3yaSirv5Uc/ZpYJHQmQXUHvspyVWbbIILGWjup70
         5vtnVGoTfKk33NEMefop52vnE4sm5rNpP1WKi2Cy2EMvUXc5HI3crTNhZsGqHI3Xl346
         ESjEjbPgeGaD0pAUS8hyksGwEu0HVnew5TYRoHlltjaGLw3oE+J2xCQ/+2c7EovA52Uf
         0jWhaNKN4gyVYh0nDxFrKCDZc6lPqtHRhH8cWt/CdbQqpThIx8gvonFDsxuOYTH8rT+m
         LfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750269150; x=1750873950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiZhn9um+VeiLM3OTddCldxchfZplFLnri2Dg7rfYTM=;
        b=Y/y6lNC372yq+g5z+nPUBEkUOusXHZ1cJaZIPCdvR/6xq0aKb/SGvO2XthdyFYcmAB
         qwQbR/f12FPmPUD0PjhnmLBMJ554UulkCrxA7UgnMp23bhUq68yK6D/vUL07Ivz/+ReU
         2MasmaXxhebSbgubSHpZJmkh8IolvocquO8lf9oZoFhOXgntRJcFXkSHH8w21b4nEBG/
         3L2w1ZTWvxRFb29UZJYMoqoMnVzRAgiBuhML250Je0qPRFXA/CTW6QGhZPzkP5XZrQSb
         Cuf1dAokbJN0rkMaMTCQ1Y0rQZk8yNS+CkpQgqkE+HpD2gmOv95Mt4h5UJesWiBjVZWl
         Xoog==
X-Forwarded-Encrypted: i=1; AJvYcCX/cItSFWyltiYvBDV1UTglyH17E/QUjRr2VllavdC1DqN0rh+I2zpy/I5jZo4Q/rB1PpDWtUqBXnWADuQT@vger.kernel.org, AJvYcCXPJdkMjxhr57yroj7ll+hLc9txdVeZORpUxsDzbLdKjUr1a8E5C3TVNlr92Q0/NSdw7QX7gBuWKjrk@vger.kernel.org
X-Gm-Message-State: AOJu0YyRWxkfVcyc7jvCYTxA9tnpC3uTdgI9jy5fZXPV9iVvjw1dGvY1
	W4d9R479oRcXVURmwla1nKD9n5ymR7apuGz+PmLgLN2YDGOveqgJZSS0hhRrB8EdYEGktvMTmgP
	jue02DuO5bhhxOTqlVhifcTYyClOQkGKN7S++
X-Gm-Gg: ASbGnctOsE1RuXayiDsndDqc5W2D3NB1TQh5KCbQlZafIUOUPX0BeSAxdOgf+q/cRcg
	LW0DlFSIC71vEcmIpj+xZXGozZDgr2y4CNZylN7mEfGJtpwkUtihwLqY0x13DXuw7/CzvSeiM4Q
	vVDASSdVlY9YmNYwb1QFGfWQhdMwx9eC+KOw5UNfmNiw==
X-Google-Smtp-Source: AGHT+IEd+rxhOFmrifmrmXK2OULn0BsywltupdAkxwojvOIkJBUKs5x9bwegJMYFGrDHhRvroIH5VJJAUb2GFou8V5I=
X-Received: by 2002:a05:6e02:1529:b0:3dd:cbbb:b731 with SMTP id
 e9e14a558f8ab-3de07c55b92mr205125115ab.9.1750269150311; Wed, 18 Jun 2025
 10:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617-rk3588s-cm5-io-dts-upstream-v5-0-8d96854a5bbd@gmail.com>
 <20250617-rk3588s-cm5-io-dts-upstream-v5-3-8d96854a5bbd@gmail.com> <CALWfF7+G6MRvuSm8a-a0KcPduXz=sYsJT0bB300rAqmtt2w-cg@mail.gmail.com>
In-Reply-To: <CALWfF7+G6MRvuSm8a-a0KcPduXz=sYsJT0bB300rAqmtt2w-cg@mail.gmail.com>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 18 Jun 2025 10:51:54 -0700
X-Gm-Features: AX0GCFuJuejOzHsp-CvdKX0VYtCf4cr4vDQS7O0UvLWU7-HV3kQfFUCTGAEajEo
Message-ID: <CAMWSM7g8ptE4VkUAKrWrYmU5HZWboVn=NFY2GzLHF3oGmNG-Qw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add support for CM5 IO carrier
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Steve deRosier <derosier@cal-sierra.com>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 6:59=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com> w=
rote:
>
> On Tue, Jun 17, 2025 at 5:12=E2=80=AFPM Joseph Kogut <joseph.kogut@gmail.=
com> wrote:
> > +
> > +&gmac1 {
> > +       clock_in_out =3D "output";
> > +       phy-handle =3D <&rgmii_phy1>;
> > +       phy-mode =3D "rgmii-id";
> > +       phy-supply =3D <&vcc_3v3_s0>;
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&gmac1_miim
> > +                    &gmac1_tx_bus2
> > +                    &gmac1_rx_bus2
> > +                    &gmac1_rgmii_clk
> > +                    &gmac1_rgmii_bus
> > +                    &gmac1_clkinout>;
> > +       status =3D "okay";
> > +};
> > +
> Sorry, I meant only the status property should go to the board DTS.
> The rest of the gmac1 definition makes sense to put in the SoM dtsi,
> since the PHY is on the SoM (as defined in  the mdio1 node). So all
> the pins between the MAC and PHY will be the same.
>
> Jimmy
>

Ah, thanks for the clarification. That's a small fixup, no worries.

Thanks for the feedback, I'll follow up.

Joseph
