Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BEB1A23B6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 10:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748859436; cv=none; b=pHXDUDIHBI2ubxt0ZaqoYTNp/aRqJsqDZNbRMbcQpym1F5utbGR2NdUpyzVxXyzBt52BDGrOVgtTPtgxELxH7301T/M3kwTlW+6ZeFPLz17kfcevJTXbO2J7L+xbbizmuewupbBMourBzUAwUxQyOtRxVUNViVlnMkSyalhIKMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748859436; c=relaxed/simple;
	bh=pEyblw1ZF05CXEYNgROXAcVImF3tve5gvGba+f35nQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFL/L2ayivc++McGToRqfo8TmNjxrhi6hUN2XUDZGjfBXTUrZEMm/oTz6J6Cg9yd8ytsVuNsUJaP9RU9HJFLB46z+TOrrM5Nj5zGmq5zI9fdUDYRZ/tu7Xy3Cau8v2f1Z5iX8d2v8ga5euiAbaoQK/Kf3G10SH51SVM3svm08uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S0cEX5zt; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S0cEX5zt"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5532a30ac45so4267775e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 03:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748859432; x=1749464232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGO9sUY+r7vqr6gLOI6qlkiYKXTKtTQAWLD2mIokncE=;
        b=S0cEX5ztlLK808ycniXZr1H9/H7xNzCtX79FukKmhSGvEttA+EdcE3SDTfdS8Zj0sB
         5SOfwONgUcs2rN/dw/TXR28w9tQhrHu1cTDJ7HkWV3pmX8YSOgCn8aDoExkeGy+fdysi
         KpzUEZ7ueCuTdaVapPm52Kddsv1TxUEqc+JzEgHEUwBOls/FdWq54+kXPBJothd236d5
         s3scgXi0NpyCT+yWPy1esu1uUeZ8h7oo2iYtJCobVBDMZb2ouMDQQw0bSTwn8b26Ttm+
         NTzfB85nlVtY4bL0kVtRuD++jUbb8W2MVlWJ3djL5caCERGjNBYExhS+rfPH7oB38S7L
         5hjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859432; x=1749464232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGO9sUY+r7vqr6gLOI6qlkiYKXTKtTQAWLD2mIokncE=;
        b=VUhy/9uZANSYSDGcdxFpzIDYoEaqysMPw8gkQA0rf4cq4gkwJQhBxgafpWPbher3HV
         CoCzonL816iWRA5bGwklHQ8+oFk/BqDY+WJU6XBb0oJMo9uj9K5PvV4X9/SN9oDkMALu
         wLydixZoqEdPSQKkYmCD06DDAU0UFVO1QfoRzRkIzqir3hAMqVOTKqaM1BQyx0dxwhIg
         TZZPd8Goo71vE+EflaETDB73Dlx8a4M2qM2TcZmG8DsaenkbCsc2cXx5Vp2kOa/jHqQT
         kzWMunjO5HsrLrt6knH2rVeYAwVnQAf5ApqG0QmrzO7YHw5yw1ydoFIShxzWaC1vamz+
         0kPg==
X-Forwarded-Encrypted: i=1; AJvYcCWH/a9WX0QyiXqw88btb4heE9SHZVKvHDRxCFIBwGvB8JSIXdKwd+Vra3giFc66W4sAly46xLv3GxGJC0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxsjq2XrBqW6nBCs6rOY8nP8emZFpWmw6qf0HT/Tp5zR0jR353
	FXRgSUCAwc9FTWBgMj1I2ikd2FJGHXuHUEImgfFubGqGw1yOpIraExu581eFqZoiWjtIFMyis/D
	f6lo64HT9ojJEJoyxghyFD68B+xO3Xgf/RXzG7L0cBA==
X-Gm-Gg: ASbGncvoBI9brSLvjBCijIjPn3QoBCxyaGeCTsEmm2OQvbLR4k1BeK6GXgmbGM1vKgz
	S+q9DlHa5Tu99mwbGWX+/VU5lgvqXMTQK7BRe/c67O9gxLSer9Luk4qOe0UzKQ2XP0dBpPYOY2v
	HvUoWINWzuqMXjpTu+WzQEiYZiW8mlFq7lHF+IN4dMu5GImAJqrfxg2eYrcO41untY
X-Google-Smtp-Source: AGHT+IE2ScFlgSOO/jzGpylrUkqPYvdmuNlMMD0/AntL/Q/1ICr4QgrhpUxX3vIEoEkKGY8aofftc7B/+e+Cne9Hayk=
X-Received: by 2002:a05:6512:1108:b0:553:2927:9864 with SMTP id
 2adb3069b0e04-5533ba23ab1mr3564157e87.6.1748859432178; Mon, 02 Jun 2025
 03:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Jun 2025 12:17:01 +0200
X-Gm-Features: AX0GCFsfGl-iahXc2ZEy1lSOQx3uH8u4YrEEg6MXx4A4twZNi28c07s79G74fwQ
Message-ID: <CAMRc=MckQhB4diiWc+Rtk84PtwaKqr34At3heT0vyAgJ9VA7Hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Anand Moon <linux.amoon@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 12:55=E2=80=AFAM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> Add the ability to enable optional slot clock into the pwrctrl driver.
> This is used to enable slot clock in split-clock topologies, where the
> PCIe host/controller supply and PCIe slot supply are not provided by
> the same clock. The PCIe host/controller clock should be described in
> the controller node as the controller clock, while the slot clock should
> be described in controller bridge/slot subnode.
>
> Example DT snippet:
> &pcicontroller {
>     clocks =3D <&clk_dif 0>;             /* PCIe controller clock */
>
>     pci@0,0 {
>         #address-cells =3D <3>;
>         #size-cells =3D <2>;
>         reg =3D <0x0 0x0 0x0 0x0 0x0>;
>         compatible =3D "pciclass,0604";
>         device_type =3D "pci";
>         clocks =3D <&clk_dif 1>;         /* PCIe slot clock */
>         vpcie3v3-supply =3D <&reg_3p3v>;
>         ranges;
>     };
> };
>
> Example clock topology:
>  ____________                    ____________
> |  PCIe host |                  | PCIe slot  |
> |            |                  |            |
> |    PCIe RX<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|>PCI=
e TX    |
> |    PCIe TX<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|>PCI=
e RX    |
> |            |                  |            |
> |   PCIe CLK<|=3D=3D=3D=3D=3D=3D..  ..=3D=3D=3D=3D=3D=3D|>PCIe CLK   |
> '------------'      ||  ||      '------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|=3D=3D=3D=3D=3D=3D''  ||
> |   CLK DIF1<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
>
> Reviewed-by: Anand Moon <linux.amoon@gmail.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
