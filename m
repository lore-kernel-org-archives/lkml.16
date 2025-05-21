Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23997262FD9;
	Wed, 21 May 2025 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827657; cv=none; b=c9lhxxh1l+a8XZvNCogJAr03JnkbHemzRsN8ui6UpoDPlL+Ml8mevvl4C5lSWIW5Ap/qGux6GnL0S6IQ+cMqwhJRtdQgmeJXgGip6BBxbqF4Td56MKaeysLA2WRdjYEpSZMJUQoqcC/0k5138mBWqyFOEjnHqSYSOaAgOaXXA5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827657; c=relaxed/simple;
	bh=s/NcY3SINg1iBtbSiIAXOaPuq5jYZKVkctKM8NepVdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovhHyn8Uf+Rrl3E3jZUA7CcH499ZG4wtJwp7E1w5YyyOXKx6zQSzTDUemECY9xvX0F4TqhGfmSu/xCbYqcw/VF+Dxl2Hvq+gSmWjFp6r8GY/VxxWFRKMddFBvX+hKjRO60McfaP2FUg71nwOckBPc+lOFQ7A6Mtwv9kADrlBooQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhXf/0u+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhXf/0u+"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-551f14dc30dso3388351e87.1;
        Wed, 21 May 2025 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747827654; x=1748432454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9d59y1AAUBQBeLns7WWUxwr1G+hlDyrZidnmum2/Ds=;
        b=UhXf/0u+/k7jmZ8d/yQ9H8hnGW6ISfLYa2d7YFNDh4OVR7zQ/l927+Th4e0j4eyw9P
         StZ0XCZcj39Q4joR+3I3s+S88bP1Ll5GyUdL2mbQdBI/XL04QxrNjFXYs/QE2YBopQPV
         a2GGknnu8MjAtKWlxdnQK8TFsLnJYv1BjZ99/1IhQ4ntpO5C/VOxpV9DgVz4NtdrNTFz
         e8R5XK0mmxdcqk+/DqldEOsCfsAhlE3raq9aXcPhGVmGJNyCqHEvnH6Dfy7o1cJimTFF
         z2taF4oDnaof4RAN0DxKleujljti1yG1En8iVEUqe3Es/OMQy6dU4iIS7XqIWGg/AzVJ
         b5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827654; x=1748432454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9d59y1AAUBQBeLns7WWUxwr1G+hlDyrZidnmum2/Ds=;
        b=U4Cg+uvjdrxVMtZlvn7rNx/vYmRELsNgVbvWL92SZ2/kct1WGq6EicB9pvE9B0R9Xh
         EEtC6FdI3De9qPQt8G/JrSNtrRy/NuXuuY9fsCWRAnDboBe14e6wKB8eYb1ACzTpSPdz
         Wrhv5HJdNrvKSfyfgZHT1Ykeh9eCLCiO6gnNSxm9pcznfy+33mnhpgp+bYEu1KTpUOYj
         1dWUUTrCIfEZkgBvUIn0Yimx1K8REcBSXEqoSSanpMn0WQzzBJFetrKDZU5+V/5EAHvp
         qNekn9PMGj63kmmPjRfDMa7O/cxwPXFI6e9SxA5p5mq4KQu1uUoAORBikOrJRyXTvnOY
         0luA==
X-Forwarded-Encrypted: i=1; AJvYcCVRPr+4HzNKnwvihAWuBrS51nNWD/gAf1QM0q2JZ7CCrzezRsKBCWhki+emnJqwn5NZhrS8fqfY3UDj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+In6t6zxjdjLnKLqcSHub+2k2yeDFhPqrFU4SBwMT59291iUJ
	kZ55QvXEr4sRh9YWBoUPpoxoK3PbmsCqNTR8gNY8Vqd5l340QwT2Zoq5GOUo81d8amL+6dm//HO
	9lVDsClCa09vM9ClFvNjAm91yCPkCnbkgXw==
X-Gm-Gg: ASbGncsFi8RDM1dnz8Wvj9AsnCSyOXHjPzX0C5feasv2LKY0qVEo6UYOnwAvPeM2I1g
	zi+9Wjbqjt/yd2W1Un8FImtfBWVA2ba756HS8T9LTMU0vde6VCdixA9b58KN3mF/Jf991Cw5Qfs
	HN3dyePfYklXOKA2muVQS7MVdPjiC5PLn3husGhAqbktsD4GL0AHkETZtkQB4PujRvgGvHHPDBy
	gw=
X-Google-Smtp-Source: AGHT+IEBT7uTeEaD1M6QcMlftPN+Diu0RdjP2HkZ+bs8PtCVUYHorsV+7TdTYTFNdPAyQT5oPUXJJVDEF5pcsY0RnQI=
X-Received: by 2002:a05:6512:3c85:b0:551:ebc1:bc84 with SMTP id
 2adb3069b0e04-551ebc1bff9mr4320652e87.8.1747827653907; Wed, 21 May 2025
 04:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com> <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 May 2025 08:40:41 -0300
X-Gm-Features: AX0GCFvuahJEGWjKzRmbj_fSU5phUy4za7_-MZjI-5ppsFQyUQtxl9C1m5zGqss
Message-ID: <CAOMZO5D-d7bmBfXKe936W5QjmsukRRX3y0ge+xtizqFx0HPE8A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dario,

On Wed, May 21, 2025 at 6:28=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The board includes the following resources:
>  - 256 Mbytes NAND Flash
>  - 256 Mbytes SRAM

SRAM or DDR?

>  - LCD-TFT controller

The LCD support is not described in the dts.

> +/ {
> +       model =3D "Amarula i.MX28 rmm";
> +       compatible =3D "amarula,imx28-rmm", "fsl,imx28";
> +
> +       memory@40000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x40000000 0x08000000>;

In the commit log, you say 256 MB, but here we have 128 MB.

> +&i2c0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c0_pins_a>;
> +       status =3D "okay";
> +
> +       polytouch: edt-ft5x06@38 {

Node names should be generic: touchscreen@38

> +
> +&pinctrl {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&hog_pins_a>;
> +
> +       hog_pins_a: hog-0 {
> +               reg =3D <0>;
> +               fsl,pinmux-ids =3D <
> +                       MX28_PAD_LCD_RESET__GPIO_3_30 /* LCD reset */
> +                       MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power *=
/

Proper panel bindings should better describe these pins than hog pins.

Do you plan to add display support?
