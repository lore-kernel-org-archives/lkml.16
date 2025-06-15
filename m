Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C7F27A460;
	Sun, 15 Jun 2025 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001933; cv=none; b=fQGrin9ExcjTvRVdrtHr78EGZleG5cH/G1uvclkuCXcKJDRzYErqjP0x5f+Uid04Asv7rKskJgjHCKa/PQWmfQcr7EqZLh2ze5FRaN4h5NDVXR4CEy+Hdzz7Gbd23WILqMJxuAa0ULabd3ZqHb0OD/qCQeU2Tv5naP20e+VD3v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001933; c=relaxed/simple;
	bh=skC6593jz8Qp2NsHpKrIAnI67OLxHbPapnUj8QQBRmI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IXmRdNWfD+1mB/N2kMMkPiXxXOeNp5T32Vm4Ajb7kk0nzP4ZyigXktTPJgHvBjF1UuWqfB/R3lDYS116SvAeRWFkdDVLL4BYcih4ZcBRplSENHirsmXZzbgvSjeo+MDOI81NJFDM9pmAcPNNzztoNqpY8jKGmr1kSDNZlDmp/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hr9eX2fO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hr9eX2fO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453066fad06so27126805e9.2;
        Sun, 15 Jun 2025 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001930; x=1750606730; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FMkRqL2nxrCdwWJa8/yANGr1OdyPoFDin5WjJhsL30k=;
        b=Hr9eX2fOsbc6dgkcX+jzJH1ZDxY8LYCooUjCv21FJa6z5TSPn5P9HwDV3gaDA+V21J
         Dk17hGsJFRlnzt2ogfC/1qb7Lg91sqWqKOfQmBgLXQOeXJk4GQs7eTcoDQ8eiuV3EPwy
         9vr8qtYcTzKT8ZhseOsnhOZjwODt5nyG1CAh/bXlnRmfaWOrI66oVCVAnwwU+kjLP26B
         QMZrzZQfyN8EQGwjC4d9Niawrme/0iTSIFcNae1gbQZXhTGCQOxTgBhU5Vm/Jeg07Bew
         piSn8j3zPwH3W8G5/+ebIiOLe4bwYtULPHjkVGueRTQ4+DINDXJdPeTtSLVsADzsaAn8
         tC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001930; x=1750606730;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMkRqL2nxrCdwWJa8/yANGr1OdyPoFDin5WjJhsL30k=;
        b=SWlmtfu1S5s2MAXw+bLj9bljw77Yz14IXIlQBgDuFpQXE5kVLedCq+ykecn6javOig
         P5leXZNhIw5QAB8pQCXFeKyjdrWalS7GtJvmzv2WxeNx2nHUjTyZFa9jbjW3QBre1T2I
         4hTKugAWEVUg+7Pvv9OQQBnT8l3JzNc8ncBhZZbETAXGibn5YwJkx08wYyxUP3SBCheX
         deS6mCM8Z4caHP5rXYbC/5HY3SV1uSIpIzH94xEb8v7ahU4rW7yOcDutotp2Om+8r8mD
         0gQWxvSraWpqGdmtO52OEyg/00RQJRXFMgtM0uILsdX8UMw7wMClhblCa7P83Wiu4BZR
         xJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwRkJga7M03QTcxxuW4qHgyy65DHKpP/7cWzKl110WWFkZJy2XlyagpVY86U6WMfb2fewHPaHLiRlw5jQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMEEp297svEJj1cwEJSDTK6aiX1bk2EY4sZ/QIj5HB0RU6Lunj
	+b1D4fR4M47ecUeF0ePbCBC9U+Htb4FLDqf0pVISSMlUo3Xs4EvNLDKO
X-Gm-Gg: ASbGnctftKHsrYPoqXG/udRAkFETFYunY7dCzB+3DCF1REpz9D3UCuyYtg4qqeReJU8
	twmrRfTkD7b8myPPbd44tW0PcxSMACJ2Y4VEHyv+Z4rZbD/Ohp+UXu81G4DAhJBVgyRgVANKntL
	hThTW6cnxg/Ooj711P65wtNtPUm5PWCiyrPBqYNNfU6xckAwaPJvEmgQ9MdbOsYvJ5z/JPQsGJF
	X+Z3ehV1xJGTyjdCh9rUHPE3ryvu5Pj3DhBk/Kz4UJ/yt/ZuW6mm2ZnsHFwfs8XexUb2Tuww3V0
	sbZedDihh4ZWAgCUXnQWEV2QRxVOt8F3OlACiPDAETRjW2DMdm9yv9LDP6lIaqlLQaL77bX7SI9
	XjXCd5Q==
X-Google-Smtp-Source: AGHT+IHq8I3l0fYXwdm0ToztfHAms4IMFhN9WcmIcQ8Gnw+CeqvwulyWE63yVmbbovDyVZ8tPZqcTA==
X-Received: by 2002:a05:600c:5248:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-4533ca4fa68mr56483445e9.9.1750001929862;
        Sun, 15 Jun 2025 08:38:49 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b74313sm8116792f8f.96.2025.06.15.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:38:49 -0700 (PDT)
Message-ID: <16c8dc85cbbfb4d4e1528261f464eee64ed6362d.camel@gmail.com>
Subject: Re: [PATCH RFC 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
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
Date: Sun, 15 Jun 2025 17:39:01 +0200
In-Reply-To: <20250611082452.1218817-3-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
	 <20250611082452.1218817-3-inochiama@gmail.com>
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
> Add top syscon node and all subdevice nodes for cv18xx series SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Successfully tested in host mode on Milk-V Duo Module 01 EVB:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 +++++++++++++++++++++++=
+++
> =C2=A01 file changed, 26 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts=
/sophgo/cv180x.dtsi
> index 929864ba1b26..65eceaa5d2f8 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -25,6 +25,32 @@ soc {
> =C2=A0		#size-cells =3D <1>;
> =C2=A0		ranges;
> =C2=A0
> +		syscon: syscon@3000000 {
> +			compatible =3D "sophgo,cv1800b-top-syscon",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "syscon", "simple-mfd";
> +			reg =3D <0x03000000 0x1000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			usbphy: phy@48 {
> +				compatible =3D "sophgo,cv1800b-usb2-phy";
> +				reg =3D <0x48 0x4>;
> +				#phy-cells =3D <0>;
> +				clocks =3D <&clk CLK_USB_125M>,
> +					 <&clk CLK_USB_33K>,
> +					 <&clk CLK_USB_12M>;
> +				clock-names =3D "app", "stb", "lpm";
> +				resets =3D <&rst RST_COMBO_PHY0>;
> +			};
> +
> +			dmamux: dma-router@154 {
> +				compatible =3D "sophgo,cv1800b-dmamux";
> +				reg =3D <0x154 0x8>, <0x298 0x4>;
> +				#dma-cells =3D <2>;
> +				dma-masters =3D <&dmac>;
> +			};
> +		};

--=20
Alexander Sverdlin.
