Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787EE265CC6;
	Mon, 19 May 2025 07:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641526; cv=none; b=dUtC27E0kfjM3dUFCVSOe1vRxYyucMQRF7HQvbhC9OSJnijKl9m5cnss5lK+vp9H7OMVe/2VzvEThIcgNnvBugF8scthwZaEwF/HpeWsJDsYUd+Me7lhTLfkGk8gR2rfT/w318X58GIzJyJam2ddtEX3tmub49lYUDIqLFjX4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641526; c=relaxed/simple;
	bh=mOU7IsSOvAhYo6I0KK3r+Onvtvmk+4/SxHf4/3GGJCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NocIif7FO2s5kPOnYBEZo6d5N8GzgdwOhZ9NmqKOzgmrlvn1RydNowDwOVIGQzquifo/ilee6AIy8g5g0bHeyyxioWuB9barfdLCoZWXTQ+uV3Mm4iIFMlF4Rml2cHXKc/FBDu3a3gMR/Zq0sAgZ3SaRWyDpNocCJdv8HtrHnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwdwPqWx; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwdwPqWx"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad216a5a59cso585281566b.3;
        Mon, 19 May 2025 00:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747641523; x=1748246323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jOUNrOt8oUJ3qXNVdVJQs0v1Ku/Xv8o3RbXOBWWKp4=;
        b=NwdwPqWx/hA1W0B/dMHUtc9vioSrQCWcCGVZl1EMbhnpb7GkX/DC4icYAojjfoCWt2
         EyUePVZGhqciz1hle4UxNVZb/xht4xNjzg9LfC+5Ihz9AcSrD5ItZWh3IZg0TlC61cOj
         48UabMWgEaEBlUu+KVCp+C0fj1i6DmqGt2g3UZg2FdoaaXlW8PLi6lxAKyVxXcR8ivtA
         PYMh4snCJE2Ap6l6lUlmyj4EEEYZVDqGMVmmIVUKh7ExbgEdGTX06iIaVReLaeeeszXw
         jlMPEuDfNpwDTnrqpONzQZXN33wzWqGwM3YrrARyaMVcBtkVLmBNcgWvez6EHM2Q030A
         houA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747641523; x=1748246323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jOUNrOt8oUJ3qXNVdVJQs0v1Ku/Xv8o3RbXOBWWKp4=;
        b=GB6NWqdnYmX+yydmMD1YUEW9sPLnph/FOh6PINArtAzoTIPxnL+/vax0qOxASJSVX3
         MXEqP1oUj3m6zETJwjyR4qgVJvyWNzrDInSYaM3JuJJXk2e7m+CHA8h6njkmYd33XnY8
         UT8dF4hDHjqhbGkxUQveSISoTF5a/Vmcu3VL+3akBVwQXi+j9Gkugm+4VOP8fjmjPFKv
         WPTE/FQFsCpY1iioTCIA2lgE6q60A82MVo8UAcCSC7UU5nIBYfMRNYFw8jvOkyDCXrZr
         9IAOKrSzwP6W7vzOklVpfdanhL2JDFk3yauYa6CpLSNqCmq96sHE3Oar2hXGeFa0TuGV
         X6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKMQm49/Hkj1thRVFRMqko41b7D0/AJr6nZXn66xaGck++O0hT1IiShBfUeojW2LzmFWBjuZhKiU9i@vger.kernel.org, AJvYcCXM19q8FRy3Z/cmiQ5Kat6kklrrDwbhLj8xTBc5C30GXlDbCvbsMtg9DQi8lsry2CeRr/JlP7Mquiy4c3bp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0cwcE6NG8tXSk9DOa+R25lAIiOLt44C91NqyiDWOP0oGa4SEF
	BUrPLNCp6CCwUieaEuegSoGTt6bDwSwLGkiRKvt9nvfgOqYA4QwVLmUjJt7kbRkeTRWx1L5DEtl
	5pUD+oSJ46asrJKAbTruM0ulI5QJQz10=
X-Gm-Gg: ASbGncvRxqvCfTdAcUwTIb5bKsWZb2r213q60G8mFaWrqKFFD2PtK3Pdns/JMc5GlXV
	cBQ9uC29CZBLZfQJFNu5u5OGmXnXleJ5t+lR3OF4NxmWkBVA7pkBr0MjmDPmvWGzpPzA7YsyFEm
	n20+sD3e6JU61IaTUs4f3am05sUVVj1Ya9VKOkm1pfHws=
X-Google-Smtp-Source: AGHT+IFBGC/Q7v8K+52sdgNsLjIb/o4fDl+jQjGNqG2kgSxX/P6VubQI1Lv144CKx7pzHNQ0FY/xbGhze7s+ZtcJHVA=
X-Received: by 2002:a17:906:d542:b0:ad5:6b26:b1e2 with SMTP id
 a640c23a62f3a-ad56b26b431mr307613866b.49.1747641522568; Mon, 19 May 2025
 00:58:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518080356.43885-1-ziyao@disroot.org> <20250518080356.43885-5-ziyao@disroot.org>
In-Reply-To: <20250518080356.43885-5-ziyao@disroot.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 19 May 2025 15:58:29 +0800
X-Gm-Features: AX0GCFvezx2cYlvQnH5iZD0p15ilC-Mldt_FcCKPiY4Jq4fpAcSkai4bZT1DS0U
Message-ID: <CAMpQs4+GiZpLfSHx9k_QfWjXtyrNS4LS4dOuCKLbS-F8OhpoWg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] LoongArch: dts: Add initial devicetree for CTCISZ
 Forever Pi
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yao:

On Sun, May 18, 2025 at 4:05=E2=80=AFPM Yao Zi <ziyao@disroot.org> wrote:
>
> Enable UART0 as it's the boot UART used by firmware.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/loongarch/boot/dts/Makefile              |  1 +
>  .../boot/dts/ls2k0300-ctcisz-forever-pi.dts   | 45 +++++++++++++++++++

A minor suggestion:
As we can see, the existing dtsi/dts files are prefixed with
=E2=80=9Cloongosn-2k=E2=80=9D, would it be possible to keep the filenames c=
onsistent?

>  2 files changed, 46 insertions(+)
>  create mode 100644 arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dt=
s
>
> diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/M=
akefile
> index 15d5e14fe418..9fff9e8be3de 100644
> --- a/arch/loongarch/boot/dts/Makefile
> +++ b/arch/loongarch/boot/dts/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  dtb-y =3D loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k200=
0-ref.dtb
> +dtb-y +=3D ls2k0300-ctcisz-forever-pi.dtb
> diff --git a/arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dts b/arc=
h/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dts
> new file mode 100644
> index 000000000000..a033c086461f
> --- /dev/null
> +++ b/arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dts
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 Yao Zi <ziyao@disroot.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "loongson-2k0300.dtsi"
> +
> +/ {
> +       compatible =3D "ctcisz,forever-pi", "loongson,ls2k0300";
> +       model =3D "CTCISZ Forever Pi";
> +
> +       aliases {
> +               serial0 =3D &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial0:115200n8";
> +       };
> +
> +       memory@200000 {
> +               device_type =3D "memory";
> +               reg =3D <0 0x00200000 0 0x0ee00000>,
> +                     <0 0x90000000 0 0x10000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +
> +               linux,cma {
> +                       compatible =3D "shared-dma-pool";
> +                       reusable;
> +                       size =3D <0 0x02000000>;
> +                       linux,cma-default;
> +               };
> +       };
> +};
> +
> +&uart0 {
> +       clock-frequency =3D <100000000>;
> +       status =3D "okay";
> +};
> --
> 2.49.0
>
>

--=20
Thanks.
Binbin
