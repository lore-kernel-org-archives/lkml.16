Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3411A315C;
	Fri,  4 Apr 2025 11:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765948; cv=none; b=HPDkhhXP12vZiCRIlNyOIkoYRCXP73YOVWQkxyKVjueGxXG5fpe1GrItMTEY3XiD8muAZJDw7+liPIGBhAAue/+M08IC+u6euEVYNoPKOUb5QjkgZZ8k6N7psdXoNWbzwTUMAREO39PmdQGbczDGOua6TURPMpeyCesxJdt6INY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765948; c=relaxed/simple;
	bh=0tQ/t1mzdr6retFmDkrkFsBJ3Zo6UBCaL1vFCtbj47w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErHXJL1yykwi0hCyqGS8C7zFfLAzl3vk3RmmcK/ATRYRObIQrXj2P99ezXoS2c2Tdjp7cIUYPuJgJJEusfvD4U/4afd9e1MF0+ogyXcUEY/cnuaMjzXvWvuqfbr1kSZS3SAaRX4+y78xI2+NHbyiytCPdCRZCpG7ZMjFmyIDefk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRwgl0jF; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRwgl0jF"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30332dfc821so1430689a91.3;
        Fri, 04 Apr 2025 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743765946; x=1744370746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2H82D3ceyz7r5Ot6awJCahu6BBXmvQb/jfXpvl9UcwY=;
        b=IRwgl0jFR5dGjZEHfeCXxhL4LlAMro0cUVm6WMebNxBEfbNN65ZyT3wZ4VmbEWfNtl
         /r9HVYXDbevo7Ec9utKWUj6gWJwnran+XCkcgbsb3WlY+5T1aVEIKTZiegoRuL2x3URa
         UuCe71EgMD58a9J2Hzke4HnuSk9iqwoR+CNIfG9Ec7IjmB1dhsL/mUFt321ydfZRgof9
         +UaqoSwqFX86EjIh3fH50qZuMjs5HNg947CWuJ5zIGn2D9pvBfGhL4HFt8XSKJmZX9kI
         WDOzjrmJEU+nwsp96u/PDLsLG6DmFRwvz65+n+oWbo7F7Ui1CF+tuiWdepuD04GcBvPg
         mAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765946; x=1744370746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2H82D3ceyz7r5Ot6awJCahu6BBXmvQb/jfXpvl9UcwY=;
        b=wrFMlptRApT7cjJFWluSz2gAztkcSZm8pUDBynJZnYYcggL8TW+NeYMM6FU8ksRfI8
         TmUVUDv6u4Msh6ZdSrYkaGY5xd9c8yDn7Kj0pRSERSqnN6wAJ4MZfBivHUu8phNkIHxZ
         PFCIxkMNn7KSiMEMUYCpwrh8mYPupz3psMNatk+YWIxuQI9GMeDCXnp4AH0cwUizc9CO
         uaWDN5hnBCX9wb5qBAb6ppaPCifZeZe8PikXhig221J7RWkHqlZKnXDzrLNH5xEKWxdT
         hXf9P7+ziyEOC6EiVzZfNrrAG1qrZWJ8aOh8apVApjasjzPSAWctUMQTzHcAHaSLx5qI
         JevQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm60JdVzsfnIQ5eugdG0IAilJscznIn1rPtWYDQGmN6fH2cvIqxWsWSHhxKAtqOMvDy0OUCmz4/Wx5TFra@vger.kernel.org, AJvYcCVE7LRsw8bXx2e+pM85WtTeGnMVtw/EpJ3ZGKGy4329sMkfJqRKHVoZ0MPA6kLasm4VTTtC6z2EctBz@vger.kernel.org
X-Gm-Message-State: AOJu0YznbyAfhZ40ezKDuSzCXIbydhcnxxzqpvQwcCl/5bRq3xEHaxb2
	wyBIuQZO74Jm+JufdwPpPMVAvro6ZJ/kttY5bU3Dan0UKMz0dMYzgdkx1FDpDy3FDxs3zIa8W18
	lyrSEZ0MGSYhhxh+FHMLG9Fcq/8I=
X-Gm-Gg: ASbGnctSMVLV1t/3QPvgfMSAou9IjrUWVOvtaiF+0iJ2MBtsMgmAfF2j/XRRLO36ewQ
	cauD7wEOX7SmFOUI1at5J9G91KFlWcNS+yDSmJwQeggor18iB8kZgzjDBm+WTw+RJAwCuJ9IPY1
	0dW+UNaZsby0unYtDoM+LWmtE=
X-Google-Smtp-Source: AGHT+IHzfIJRZpdeONCKC1hscbpEHgL+eOok3ABpVp7t0jI5xsF+h571shGT73MMq7pH/ucoJCkY3wGkF1YG+WPKcMw=
X-Received: by 2002:a17:90b:5443:b0:2ff:796b:4d05 with SMTP id
 98e67ed59e1d1-306a485edb0mr4690761a91.11.1743765945929; Fri, 04 Apr 2025
 04:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404105359.18632-1-ivitro@gmail.com> <20250404105359.18632-2-ivitro@gmail.com>
In-Reply-To: <20250404105359.18632-2-ivitro@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 4 Apr 2025 14:27:31 +0300
X-Gm-Features: AQ5f1Jo_vwVCsJBIV6IqomEQgPPhk2OrizKxFzdzrwjdmKaE32nMnNYDWv9ZEsk
Message-ID: <CAEnQRZAkPJJRit7qrxHc4KtaR8Xej9qBZYgYTukWtKM6fwTSnw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: freescale: add Toradex SMARC iMX8MP
To: Vitor Soares <ivitro@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vitor Soares <vitor.soares@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 1:56=E2=80=AFPM Vitor Soares <ivitro@gmail.com> wrot=
e:
>
> From: Vitor Soares <vitor.soares@toradex.com>
>
> Add DT support for Toradex SMARC iMX8MP SoM and Toradex SMARC Development
> carrier board.
>
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-im=
x-8m-plus
> Link: https://www.toradex.com/products/carrier-board/smarc-development-bo=
ard-kit
> Co-developed-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |    1 +
>  .../freescale/imx8mp-toradex-smarc-dev.dts    |  297 ++++
>  .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 1288 +++++++++++++++++
>  3 files changed, 1586 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-de=
v.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dt=
si
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index b6d3fe26d621..8106dbeffd3e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -221,6 +221,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw73xx-2x.d=
tb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw74xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw75xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-venice-gw82xx-2x.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-toradex-smarc-dev.dtb

I think here we should go in alphabetical order. So move this in the
proper place.

>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-verdin-nonwifi-dahlia.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-verdin-nonwifi-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-verdin-nonwifi-ivy.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b=
/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
