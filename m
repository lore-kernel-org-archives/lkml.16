Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE8F2CA9;
	Sun, 15 Jun 2025 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001924; cv=none; b=Dm8lPbNS+bt76qGlHk0dNp6DknLQBLl198sTaCBKDHx2KLJip35/KnvblQZkdeLddHTFabSN4zYMMjlXR/8ofUHpJEQc3t8cOIq0P1+TJCWIxF4YYPNKnIVXQcMTWZfuZjv1Sn31JBWde93t4kIBJDEkNjeWXIZ3uR5L5XoWxqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001924; c=relaxed/simple;
	bh=Pfeuuw3IsnDBW2D5UO9BFg1ySfLGBBquA323G6W4mEI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lpWx9qnVXU1/5OFTizl7PeyFga85IQKJKYlJhQeAKZZQDEGHbD0iT7DvPy24VGO8aDo0cyeY4G9k2Mt0XAhuRuXvBYK17akJ0nN1xkNs9OjrJUkCnxDJVlEqTC5r/mSpxBGjeohWffuvP6phriEUhRhVZjRs2UYRp4O7GInEY5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNI/8w06; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNI/8w06"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so44496275e9.1;
        Sun, 15 Jun 2025 08:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001920; x=1750606720; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4w6ojSVvxCZBkFChAR2nLk88h1Twoyfnt00LPkC7ZcE=;
        b=iNI/8w06amzgQCINYvxw2WG276Ckuj0bArYMdvzgi5nJsoiMPV+fSd6vGfSMPggF2O
         f6FIEOiR2HEvgmwsU2is0SN7IFw3IFqGZJ5JNF4C8z36B4iP/gXwED1ieP08OgxgI2J8
         YTy3AuFwTqGh9nlecvu1PAZsuRM/MhG1JL/R/vtjwET5OYKo8pBpsK49y7HyILF2iBVG
         J1Wi1xQzNOJvcm3QTNjbDgrUhgvcKZtzK6RPKE9UtIgDhAHegm3HyDCFkwmlDn69lLHy
         eAbN1sDm8UVj6BQgh7CVzeo1I5bUUFvJ4d8dC9ZcjDxqGViN8Cgto2T4LD1EgME8EQ6O
         s/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001920; x=1750606720;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4w6ojSVvxCZBkFChAR2nLk88h1Twoyfnt00LPkC7ZcE=;
        b=buSBDOmXcvZCmvax1fKA4aPHqRRZWoB1p+cvc58bOAPn5ayRNboEa02A52ozMmOuDs
         r4M2dPvpCh9tY9ORuDB2B+w/spcYZjprDvFDZcNUgJhhtt0IYhMiLe9Q8RVykaBbCG7Y
         1aXGNwxpc94YJKxB+MrfNQB952fNhA1JLu+sfruT8tMvgZdCviUt0AGwUGmRllXraJVC
         0Wl9coMc+aNbjL703EeJa0ibcx6Z0driE0foM87RQ78mDzOXn6Aelz7JE5/HU2Xytq6+
         a6cX1H+N+OUhO2pVMRaSEG0RqP2CYfJYpthfJxuZABuJe8z29r/JCUHLtkPRxcTsdHtC
         9tGg==
X-Forwarded-Encrypted: i=1; AJvYcCVxzRIycq1eWlhMn3o3j5suMf+LKS48hy3HY1wMnoAds5F4y+yg9jJB0kLIUgo0c2TVT8owfQkI4Axo5UA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3O84rfnqgFpnhCwKDmkrs9MYig6t0597WtDwFiz/Z3sfR/q+
	EN593sp1V/kg+twzUMcYSvGORvjC5d1bxc9IZJ/dfxU56xWvR0LYsg5v
X-Gm-Gg: ASbGncu1nbTfkCTLRp2DyXtGrWRwB022b6jpACI/6psiBpMbg4853M2IoGXLHHEwCZT
	r/Bv953MT7gTbze4B2nv9PNdYYIC6KgCtd2S1UgIrQ88fRJXyf34jhzzU0WqjwGOjOVpdEtwSy0
	hB6SxLmJricQeEJDyu09BAjWWKcemunDBwYYJRaAaR/BfYVJJi8gbJCIw5djqsHekJRnUuEIBYD
	xpoR9SckR9eZOB7WvVgB7zG/71NN1KXYeJJTmWbvzNivqoq3P3DZ3UkTTzQpE2+YdutIS78pLnl
	fT5xCAMOLExy1sd+zpL3VlnKN9GegALq0cY/AkDfy5ncn73ulpQBJFqHt64dvQ6erA5J/45yR2n
	x4LkJew==
X-Google-Smtp-Source: AGHT+IGoVcAhO+1NBubftFooLD3lc7sYs3mbVA5mxnraWLvf7WIREXdSgu30kDJRwmw5ULOGEm+IRA==
X-Received: by 2002:a05:600c:3584:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-4533cac908fmr58103055e9.30.1750001920409;
        Sun, 15 Jun 2025 08:38:40 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c4b1sm114934925e9.2.2025.06.15.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:38:39 -0700 (PDT)
Message-ID: <5478c3df766079f4139ba1dfffa2f938ab4a9259.camel@gmail.com>
Subject: Re: [PATCH RFC 3/3] riscv: dts: sophgo: Add USB support for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Yu Yuan
 <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang
 <huangze@whut.edu.cn>,  Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Longbin Li
	 <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:38:52 +0200
In-Reply-To: <20250611082452.1218817-4-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
	 <20250611082452.1218817-4-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks for the patch, Inochi!

On Wed, 2025-06-11 at 16:24 +0800, Inochi Amaoto wrote:
> Add USB controller node for cv18xx and enable it for Huashan Pi.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Successfully tested in host mode on Milk-V Duo Module 01 EVB:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++++++++++
> =C2=A0arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts |=C2=A0 4 ++++
> =C2=A02 files changed, 18 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts=
/sophgo/cv180x.dtsi
> index 65eceaa5d2f8..3ea3a1af103f 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -428,5 +428,19 @@ dmac: dma-controller@4330000 {
> =C2=A0			snps,data-width =3D <2>;
> =C2=A0			status =3D "disabled";
> =C2=A0		};
> +
> +		usb: usb@4340000 {
> +			compatible =3D "sophgo,cv1800-usb";
> +			reg =3D <0x04340000 0x10000>;
> +			clocks =3D <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
> +			clock-names =3D "otg", "utmi";
> +			g-np-tx-fifo-size =3D <32>;
> +			g-rx-fifo-size =3D <536>;
> +			g-tx-fifo-size =3D <768 512 512 384 128 128>;
> +			interrupts =3D <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
> +			phys =3D <&usbphy>;
> +			phy-names =3D "usb2-phy";
> +			status =3D "disabled";
> +		};

--=20
Alexander Sverdlin.
