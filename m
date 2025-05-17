Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CCD1367;
	Sat, 17 May 2025 18:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747505177; cv=none; b=JDhsBmCrpgfY8Z0vjgeENRaxpTT0crSnangq0RJIO81qV/aDY0AQ/IBlGTXKrOnoE0cqCJdTHQD8Mq4JUkQHA1wVubk16xkZC35KRnx6HRm7dRDkvj1sr0hESj+FN27WllHR9aSJE3lB/NLbH774y7Eu3sr6vWHJDMGpXMdjUto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747505177; c=relaxed/simple;
	bh=9+h1ovfHuN/3wPA02D/nmMQE3r1DllHMRk/oSCTS1Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovU1MqCqWpp4mgVsAuWofEnRvls29WdENYyL8kjUSHyw+/uKzFy979Y7Kv6CxgzPUiR62eY7aikd2bwWxYei4gbGCVu/H64SN4jVs/yNx6giENQEl3n41dUHAhzMiXkt1aOhW5ZUOS8GzOiXm5NobC9VYfnla4x2wMNf5DMwc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvP9tHw2; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvP9tHw2"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87bee00b392so1119492241.3;
        Sat, 17 May 2025 11:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747505174; x=1748109974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1schRBN0woVB0x+Am0mrrm4rSAKoNb5LVQXWFxsgYM=;
        b=TvP9tHw2RlIDpigivcA4PIDZw1YxU+m0YB7aI02/QghOcL1MLisp5V06ZTD4NLSXyL
         z6aYxhsowIA9RoO8ztjfP6M/UPPYJhvDUCGhhbw6lT8owep89mxPDROO5+GIeK/OHQGj
         leDULPc3IOEukbrlAdL4hMbEDHZg8Wbl3Rh9k7rIlvMfTr/DWEl1kDSMbpYBXyjfTwmd
         8mXDEubrE53SKfSRF+pUmfyN89AYRlNe+N1kfEhnOsag+LuZrm34964kugqXCd/QPxVs
         9uQrmrJq/wm66c3r8JWVWX0vbU2lo0RTKpJNaDp4/XNwhPgnUvzibiBHBHUPFWYGWd22
         BwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747505174; x=1748109974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1schRBN0woVB0x+Am0mrrm4rSAKoNb5LVQXWFxsgYM=;
        b=ZsdygAQhPfoD4GPYc4h+JbwjqMGN6wecgKbjRlcl6/9CNkj/SngAPdCjFfhk+ZSxHg
         80jzTTsLXA0jUE/NFDY6LoPvosjtaGS9aWZdNO+dmo8WcjoHulLwC0d9gXDH1inbhnXv
         ln2EhxVtco26QkSa586DB69WZEODxmith62jjK/4zVhNMCvT5GjH3tyqxXjUUmkijdHP
         rJOvescnTl6o2SmEJmRbW1LY2BhA/IP63PB1ArpoeHp2Ss36v4ZkE44S4F7dtHFyQ1Jg
         HFWt+/qIBX0Oy/ouMcuGZzOiJd4IjZVLw2583I1jY/TANzF6tNbjaZnU3T9mIZ0xc4F6
         QUSw==
X-Forwarded-Encrypted: i=1; AJvYcCUcz04l9HL8AnJnIjAobRZLAoeTo3MfYMaTyZdf/SMlb9t31d1DjzftSu1iMDdvQQ24bd7tIgJYTj28w7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgc8xLk3JCc+B91PvHZMdH4WFI67DZTh3HbKzUQVccOVzdcaEW
	P5qd8jfdSl6ND4W5QoswvQdT/oitIDULH1nQ1kiveQZBS6+qOMyE+jJSmR/D7iEiQQVUgY/QKp+
	Dkx51PIkueDZNItka2DzOJrY6bkcjkDs=
X-Gm-Gg: ASbGncsIQfcB1OLJYwXAHatBr1CxBCx3VXF+9m/Uz6zq3RSKxKGbr3wqxsGglExai2Z
	LUhxg3r6cLUMZMuG7T0yOUOp+57nYWR1o5iPZhg9poheLhslsJsbM/P8qS4Qpd3oUU8W1miMVVt
	tx/4CKiMtoI/b/AP6XRHCpPAksb4FOPqx1yYh8ta/zvxCM
X-Google-Smtp-Source: AGHT+IH66PFdaZi5J8HDbVArPmOY4TBk+24AltynhiohhEtefKF4b5APmjMEeCNcvpc2ZeWTrAZPNwbAZPkXZvyAPfQ=
X-Received: by 2002:a05:6102:3e95:b0:4df:8f03:13dd with SMTP id
 ada2fe7eead31-4dfa6ae735fmr7820730137.5.1747505173766; Sat, 17 May 2025
 11:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747231254.git.rabenda.cn@gmail.com> <4f5eaf5285dbeb0de1c8aa4700ca0910273e7674.1747231254.git.rabenda.cn@gmail.com>
 <MA0P287MB2262AB8F3A790B876AA2E989FE92A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2262AB8F3A790B876AA2E989FE92A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sun, 18 May 2025 02:06:02 +0800
X-Gm-Features: AX0GCFtHMGcnarhky-ATNItjF_XCNfJdq0UotRwJwXxNaOVTLJwz1YvpazgWyKs
Message-ID: <CAAT7Ki9X0KOuuZnVjT2=uexD67rfyL4Gq18ZDgr15CeaoNOmpA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X
 board device tree
To: Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Added ethernet support based on [4].

[4]: https://lore.kernel.org/all/20250506093256.1107770-5-inochiama@gmail.c=
om/

On Sat, May 17, 2025 at 11:22=E2=80=AFAM Chen Wang <unicorn_wang@outlook.co=
m> wrote:
>
> Hi, Han,
>
> On 2025/5/14 22:09, Han Gao wrote:
> > Sophgo SG2042_EVB_V1.X [1] is a prototype development board based on SG=
2042
> >
> > Currently supports serial port, sdcard/emmc, pwm, fan speed control.
> >
> > Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG20=
42-x8-EVB [1]
> >
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >   arch/riscv/boot/dts/sophgo/Makefile          |   1 +
> >   arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 247 ++++++++++++++++++=
+
> >   2 files changed, 248 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/=
sophgo/Makefile
> > index 47d4243a8f35..2470e30ae901 100644
> > --- a/arch/riscv/boot/dts/sophgo/Makefile
> > +++ b/arch/riscv/boot/dts/sophgo/Makefile
> > @@ -3,3 +3,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1800b-milkv-duo.dtb
> >   dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1812h-huashan-pi.dtb
> >   dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2002-licheerv-nano-b.dtb
> >   dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-milkv-pioneer.dtb
> > +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-evb-v1.dtb
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/=
boot/dts/sophgo/sg2042-evb-v1.dts
> > new file mode 100644
> > index 000000000000..4f39a2575b8e
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
>
> Please run "make CHECK_DTBS=3Dy W=3D1 your_dtb_file" before submitting
> patch. I have a quick check and get following warnings/errors:
>
> Error: ....../arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts:67.1-7 Label
> or path gmac0 not found
> Error: ....../arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts:86.14-15
> syntax error
> FATAL ERROR: Unable to parse input tree
>
> And the similar issues existing for sg2042-evb-v2.dts.
>
> [......]
>
> > +&gmac0 {
> > +     phy-handle =3D <&phy0>;
> > +     phy-mode =3D "rgmii-id";
> > +     status =3D "okay";
> > +
> > +     mdio {
> > +             phy0: phy@0 {
> > +                     compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <0>;
> > +                     reset-gpios =3D <&port0a 27 GPIO_ACTIVE_LOW>;
> > +                     reset-assert-us =3D <100000>;
> > +                     reset-deassert-us =3D <100000>;
> > +             };
> > +     };
> > +};
>
> This should be dropped, we can add this after ethernet support is
> upstreamed.
>
> The same for evb_v2.
>
> [......]
>
> Thanks.
>
> Chen
>
>
