Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70C81547E4;
	Fri, 31 Jan 2025 22:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738362320; cv=none; b=Eu+UuzTyVKtub3sF28FFZQgcgbPOJcHlnnsPsCir0UDW0ORh6b8PzWHEVu/ZM43ItEDELiCRxe7YLWmiG+vbv8SZK7OQXIkp3TKwtTgRTsujGUMp8zs1UvVErL6iuVoHqpn5zZKJ0fuOJiKhh1zK1mJT3h3Rhe6BNM34pDRCRdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738362320; c=relaxed/simple;
	bh=vl24BqivGjhLYX6axlg/21Ey2N6zTIaWDZ7/dHU2DKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpMV9qmpmHuoKLDNoXVzQH32GYgnF03vc2WWzsHBeKAzKzlcn55brj/SSMRfrza1RtD8ioEUroVjbrFCZh5x/dWDSHEzxJSQYbYzSvvt3LfDgusymJhXAfSueiqwJ80yL29N/OBq/5G5CBbCNu49Gqxf1DJLClwYWSZ7NoeW7r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLvMVuXs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLvMVuXs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA78C4CEE1;
	Fri, 31 Jan 2025 22:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738362320;
	bh=vl24BqivGjhLYX6axlg/21Ey2N6zTIaWDZ7/dHU2DKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qLvMVuXsG97Diz4bMQF1/q5zAkilBPjCKweZIwU4+/NHOTAv09BZvY/wJ8/FBI49B
	 V/LHoTphny64tQBM43Q7rLtbALej2dbG+xtQ7ASoANjx+H0IiRtMFugCgRzL/iNAMc
	 zaHTCxH7Xo9bYVXXJXdAQmaFWGd3kxX/Ia8F7dh4VjCXLbhGOFAgkEQDhLU05wMBdq
	 VCa9MTRrRjoYQtuIi9t7wQJzXA/kZ6mmFgvxl0Ob4GoIKwWGw0Nvox+nuQK1LFNjbn
	 +qdP5Lna5SzmPV1mdERxhfelVRLDUgYrwqjR3+X6RLGFoOY8yuLlB11dMLsPlbwG8m
	 IohEt5dU+e2dw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5db6890b64eso4586097a12.3;
        Fri, 31 Jan 2025 14:25:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfHIfjHs0382+T1hKNc+meQexhoinc0uv6nFSyb5IRK+qMORWueUdoG+lctb/HqQVITbrH4E58YSjy2fzT@vger.kernel.org, AJvYcCXHQLa88+J2okPaEG/yt27fiaZhAXD2XnG/I7AqZ3BbDTfv7yQFHEoLU5Zp7w9S4oTUZmDZBLMiorMx@vger.kernel.org
X-Gm-Message-State: AOJu0YzhtnjdnT1jVtvKbmkC6L1u3JmkC1yMGOhHw/7ouy1iGMHKFQVq
	yzk4rNbt1BeaUN+IFDu5lZeBxJptcHV0gXXaQGm3jcjZaGtgYSJe1T6FVlVbPSeJ7gvUgOGyR3L
	qaIsYYgWu5/aOXyXlMWTzhiERgA==
X-Google-Smtp-Source: AGHT+IE5vrGGJ5Zm1+RS3K1jNpAzW9Otpq5deNsBcjcVaXmxnBPZjCC2liQHw+ACI9IhEnmNLkswm+ORG1zbl53uTdw=
X-Received: by 2002:a05:6402:84c:b0:5d3:e9fd:9a15 with SMTP id
 4fb4d7f45d1cf-5dc5f0084abmr14029562a12.32.1738362318826; Fri, 31 Jan 2025
 14:25:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114181359.4192564-1-masahiroy@kernel.org> <20250114181359.4192564-4-masahiroy@kernel.org>
In-Reply-To: <20250114181359.4192564-4-masahiroy@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 Jan 2025 16:25:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJyNiUF8--wz2DsngUAuSUboq8oqZRxAzqY+iBRM7rkjQ@mail.gmail.com>
X-Gm-Features: AWEUYZmE_vBws_oo0KO86dAjktU5Se11A4_0qwRKYjGYL0pB6r16BeUDQIMsBBE
Message-ID: <CAL_JsqJyNiUF8--wz2DsngUAuSUboq8oqZRxAzqY+iBRM7rkjQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] microblaze: remove unnecessary system.dts
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:15=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> The default image linux.bin does not contain any DTB, but a separate
> system.dtb is compiled.
>
> Michal Simek clearly explained "system.dtb is really old dtb more for
> demonstration purpose and nothing else and likely it is not working on
> any existing board." [1]
>
> The system.dts is not necessary even for demonstration purposes. There
> is no need to compile out-of-tree *.dts under arch/microblaze/boot/dts/
> unless it is embedded into the kernel. Users can directly use dtc.
>
> [1]: https://lore.kernel.org/all/d2bdfbfd-3721-407f-991e-566d48392add@amd=
.com/
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/microblaze/boot/dts/Makefile   |   3 +-
>  arch/microblaze/boot/dts/system.dts | 353 ----------------------------
>  2 files changed, 1 insertion(+), 355 deletions(-)
>  delete mode 100644 arch/microblaze/boot/dts/system.dts
>
> diff --git a/arch/microblaze/boot/dts/Makefile b/arch/microblaze/boot/dts=
/Makefile
> index 932dc7550a1b..fa0a6c0854ca 100644
> --- a/arch/microblaze/boot/dts/Makefile
> +++ b/arch/microblaze/boot/dts/Makefile
> @@ -1,8 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
>
> -dtb-y :=3D system.dtb
> -
>  ifneq ($(DTB),)
>  obj-y +=3D linked_dtb.o
>
> @@ -11,6 +9,7 @@ $(obj)/linked_dtb.o: $(obj)/system.dtb
>
>  # Generate system.dtb from $(DTB).dtb
>  ifneq ($(DTB),system)

Can't this be dropped as setting DTB=3Dsystem.dtb should work if there's
not an in-tree system.dts anymore.

> +targets +=3D system.dtb
>  $(obj)/system.dtb: $(obj)/$(DTB).dtb FORCE
>         $(call if_changed,copy)
>  endif
