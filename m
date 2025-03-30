Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4671DE2C2;
	Sun, 30 Mar 2025 21:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743369041; cv=none; b=D10wt6gIIjYAnD8T/YHjZAoalvxRmIZHvG2bTWKqcqjHpaGYo6eOx/J4+JotjrF/HJW/ZrrZIsixHmpxKvysjRuyLAWIwlKpRSkA0p3Oz1KXC2FiiY5PKDuMWYkW11LYDg3jnf+mlvXHW+wZ+6CnFbOExauQqaP04AfDNkG/trg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743369041; c=relaxed/simple;
	bh=xoBfgfkIqXjcBrop+nOuaaOt7tuIPPpmVu1LXwn86I0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNew6m4XZ7BB7AgaUybXzZmHYKghxuSGvgRRq1V0Y9AWyO7I3+K2IQ1Zz5oVY6KOT9YykgmDIauTUF6Z+xkWvQ+4c1S8zV7VUnPD3hCJhWdHBL96FdZ0bynqyk+l26DBuAJRu7G0soVzX+8S87R+2VF3/kh+xed39C9j7pU7GKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=C9O9xv6b; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="C9O9xv6b"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2243803b776so51884985ad.0;
        Sun, 30 Mar 2025 14:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743369039; x=1743973839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um1wOWHml/UzYVpawVxxwTUXJz9obh5pK6O3uqssEdc=;
        b=C9O9xv6bJP1e/9xQn8NqdBgNYrW6lYmnJ7IhbNBVWij1ujWdOHqAD0PSwvGH0PHcxV
         751feCQIj7nTpFZ4GdGztf/1oJs5jQEEFU+SaH7S0jXQfpfRSIFq2Dh30Ndz7RxUnNhm
         lLJqymmf9assf4R4iLkKDdX7Ha9v12jzM4yX8UON+wYuqE60HRNmT/wOFN1R6Gn8f4pS
         mPF5jecV3g/dpNPRKRTXU/FQMUyEwg8C3oUEXHsdEUZYVJM4zQmwhlZl/mZC+MwSTNfg
         7LBGWu17LFsevHvdhuSPrzeoxhSRglZKy3+X2Gp4YsRraL3IVkOBqzoc90iWujLpEV3F
         b6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743369039; x=1743973839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um1wOWHml/UzYVpawVxxwTUXJz9obh5pK6O3uqssEdc=;
        b=g2aKQSjbZHmXNJlMYo+7Gs3KpoYUQQzCK00qhLBr+uyCSwpMXrk6a91oT8+NrosTkn
         vr8qsxDP0uUNNfC9JEE3mZlbjmXALok3FVouUFTBnTSEEfnV16fhOYqbG54jMO/AxAvF
         bseImhwQAcBjUKwSlgSE5kzEuAu2awGDRx89TULXjNWouHR9yh7jKqzO4LlQc3/Kltkf
         KbCt184XlQQ40SXu3F/LNfguC+iu25TMMRCRlMmEY8oRl64qKtuN2J5Cwpg3Z400W/XI
         uhhyiFFLYULxXw8XYDwStonZZQ8T9dGRO8NYDt8Zu5UlcWjN5phEAdb+/U+u3v4oB01Z
         DA7w==
X-Forwarded-Encrypted: i=1; AJvYcCUQuc0jqa2PamUMk2j49NlbJOa1ick2Cmb+apmvT627bdQtnorNWZlfz5EEkZ6nDix1QD8CQJe6L/y1@vger.kernel.org, AJvYcCVPnEkBHLH2K+H5QPltguJPzvzDe+GQRp/Pa/1sVIfqurajl+Fi9Y5P1lsVg6QnTEZlxJhm6KH/W+Ob9IXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwwwtIb1odOUtRATh10tf320YqXPKMN138dE4nmiOr0Dq61Nnkw
	xdDSvnebXf1paq5ouoBKXdmmJnr6YjovtcwJC784jv9PhoRSdWz1/Az4pyGGQj+YqEC/fS2EIPL
	TPKDBCP+vNj8VDle5p9LtJuLxp+HiLpuZ
X-Gm-Gg: ASbGncsjI3pER6w1hIeq0LmzjkIljgP1kUfVfL4w6P1PNoLzVjXuPJU14s/7eKrGUk2
	NkrdNfSOwVSyX96E8ql2kDvZKcymlnC21Ct18G5o1C3Q7fHjFw40g33ojQYaKzT68odOImIig75
	01MnpPIfNOduZ6k8zT1UK7c3NC5s9hw+CtdOMVQFq4qic9ZvlYLWQ0qh/Rwx0=
X-Google-Smtp-Source: AGHT+IGG8TQ/aML9NKHr9fatF2KsYLKFfgoL9nDkVZai2+M8OApdKY34UCov5OwIf2Xe/caQxnERpRKq31UEig1iKE4=
X-Received: by 2002:a17:903:19ee:b0:224:10a2:cad5 with SMTP id
 d9443c01a7336-2292f942a6amr130079115ad.10.1743369038858; Sun, 30 Mar 2025
 14:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net> <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
In-Reply-To: <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Mar 2025 23:10:28 +0200
X-Gm-Features: AQ5f1JpHPy4BrslsaR2BuaGOJO_CEScsXGIyscHyEtnp4vipG1FtG1_j-1eqkLs
Message-ID: <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your patch!

On Sun, Mar 23, 2025 at 1:38=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
[...]
> +               eth_phy0: ethernet-phy@0 {
> +                       /* IC Plus IP101A (0x02430c54) */
> +                       reg =3D <0>;
Does reg =3D <1> also work on your board?
0 is the broadcast address. It's unfortunately something that we still
have incorrect in a lot of .dts files.

[...]
> +&i2c_AO {
> +       status =3D "okay";
> +       pinctrl-0 =3D <&i2c_ao_pins>;
> +       pinctrl-names =3D "default";
> +
> +       pmic@32 {
> +               compatible =3D "ricoh,rn5t618";
> +               reg =3D <0x32>;
> +               system-power-controller;
Here I'm a bit surprised:
Aren't some of the outputs used to drive VCCK (CPU power rail) and
VDDEE (everything else power rail, which also powers the GPU)?

[...]
> +&usb1 {
> +       status =3D "okay";
> +       dr_mode =3D "host";
> +       /*
> +        * This bus features a Realtek RTL8188 2.4GHz WiFi module, with a
> +        * 3.3V supply voltage that must be enabled before use.
> +        */
> +       vbus-supply =3D <&wifi_3v3>;
If you want to go for perfection then you can use
Documentation/devicetree/bindings/sound/xmos,xvf3500.yaml as
reference.
It's also an "onboard" USB device which requires toggling a GPIO and regula=
tors.
The driver side is super easy to manage as it's generic (meaning: it
parses any GPIO and regulator as long as the USB ID is registered):
drivers/usb/misc/onboard_usb_dev.c

That way you can just describe the RTL8188 on the USB bus and assign
it's vd33-supply without having to (ab)use vbus-supply of the USB
controller.

[...]
> +               sdxc_c_pins: sdxc-c {
> +                       mux {
> +                               groups =3D "sdxc_d0_c", "sdxc_d13_c",
> +                                       "sdxc_clk_c", "sdxc_cmd_c",
> +                                       "sdxc_d47_c";
> +                               function =3D "sdxc_c";
> +                               bias_pull_up;
This has to be bias-pull-up (dashes instead of underscores).


Best regards,
Martin
