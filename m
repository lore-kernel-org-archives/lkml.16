Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419393A8C1;
	Fri,  6 Jun 2025 16:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749228150; cv=none; b=d2HnCtQAOEgQc3aykiIQ5d8bwFfirxsUrVOxSyu7ofNBEmyQRosPH4O6eOxr0q10GToIVNICOCHRSGQCebq3CW34Jz4dI4R3evyaC9f1fKAitwUz3V0n/YY5MmQaxocSLJsPNGnzpgbtxb5Q9cO23apJbQet1ObmGHB941ppXnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749228150; c=relaxed/simple;
	bh=FXCAeqxR1LAON9Pwe6CC8F9hsonCO1tuK/KA9y9w1Ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5gy8DDDLTaJId1nJsc/ldqEQMOUsugc0dOIEqw/J5ekesO+hG502FD0sMeggh7JH8SD+HIhnhXjY92RZc9GJmZ5ahymEj1xy9L/XngsKmVfKmJw4H3Z6fyNvi5JaEG5YByCz4C9NtORaa7IjP9JivLXvRqZDy4iyVQ69dLhs/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKHVMVYl; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKHVMVYl"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3dc729471e3so7945565ab.1;
        Fri, 06 Jun 2025 09:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749228148; x=1749832948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMeYsxUgjqxog+Ak4U2urOTlJ0rw3A1XKz5qXAyaQdo=;
        b=aKHVMVYlZatJdJSjx76k1fkOglZCKURH7L36Xuud9hmjOWAaFS7OwPqfHR/SF58B55
         4CBHcTAhUiWSqw296weVoBYbJJlkAJKxAim41eqcbG9tF1unn+K2uJLtiapoeUm2tN1c
         5bR6XN2ktJIle3O2WqxREWp2jclpwChK/WTbFA5f5PqRnr59pXPQwyQcJp3XsSRxg/R4
         8gdOEYA6RDZ9jDX0WUWNW6cxqYvo4PrRk9znS/urqbprVja1DSVC9/TnoBphi4Sza64T
         1JiI0bQ/X5uTbtFwhBIbpB2w98lIHQVgslT5v4mPPPynNCh7qBAmjQo8K0YIC6uvLrLB
         J1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749228148; x=1749832948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMeYsxUgjqxog+Ak4U2urOTlJ0rw3A1XKz5qXAyaQdo=;
        b=eEfMYqboRbulN4JwvjvMVx6dz+Et/fk//Uu+99Py7/YMLo+uqWpXlurl8reY5hkNlf
         eS9cuBqlL3916gzsP2IGARUwS40+WDDmEz/HHqoxrL7HJr63fb7gcVxcNymG6Ws5LRSJ
         iRnPGxISXVhN60HoSDsbG2Ygde2jAJ4edYuWLP24bHBnHIp5Wf1AyZX0ZYWkHy8JB7IU
         A4wcMaszUTn4hjgySNQTcUOjxOOsCrCzXNk6ZCMs/RClIyrKs6CTem5OxVMjGzlcvUmf
         iBxcCC/367p8tDBhAEi7Zs36dT6gFVg+Kd4RvtO8HkFb4kHkzz3Vo4LI83yQ3mR9qrO6
         bgMQ==
X-Forwarded-Encrypted: i=1; AJvYcCULR9KLjCewGbHXLfawqT8IzIfTYQ9CKpz7Y81S14JccUXSuXIBDDi3VWQDfVf2ADPnWciJrjU0EQ7E@vger.kernel.org, AJvYcCXMF9PaPtMtSbgTyN2zubWXYeC7AVqDOcYzFZfnTJiiwK3Mf5Vkf87MwzbtydZl+7q7PVOtjv6VngSzg2Jr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqf7AdxOZTeFBMSjcxVeXQV+XUgZ/RqSjnbbKZStrOTnfOCrdJ
	qK98VPbpER9wKf3rkEc4jtNMw4Y+IjVyENHe+a0mSBVwDcAOco+15MRnqkTVx7ac76VuVfs1sS4
	zQ4cohT30xaEZEwNM9jvZfYNrmA2wzMSZaSfi
X-Gm-Gg: ASbGnctMZmNTCl3qOdnypktUDwwsapYJKyGVXqIApj90qCaj0So1SwD6+9UcrOEbAuf
	1yGjSJQ6+4MRvrseniMKRc4SRg+zeLST9mSMCbMDKBp4r8WLe5YvIrIA+xY8/Md30tEYcZ8dqjO
	/urZftqGsErz7UuwC3dFE4tYlaqfHQ6HUEgHs7njvL7dKFi+zYmnkb
X-Google-Smtp-Source: AGHT+IFlV+kTTqKAlFNc6/Q8eaL8fHicj7OQNSk3pESNYyA27MAqC5cCScNwhcB8fj/OsGWlxBp0LvXax4FYxj83epQ=
X-Received: by 2002:a05:6e02:4518:20b0:3dd:d189:8a6c with SMTP id
 e9e14a558f8ab-3ddd1898dd9mr19809775ab.4.1749228148149; Fri, 06 Jun 2025
 09:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-rk3588s-cm5-io-dts-upstream-v4-0-8445db5ca6b0@gmail.com>
 <20250605-rk3588s-cm5-io-dts-upstream-v4-2-8445db5ca6b0@gmail.com> <CALWfF7J-Lygg+N3oH+p7XkPvH_6ZbvTRY6CaZzFqDixzSgDHBA@mail.gmail.com>
In-Reply-To: <CALWfF7J-Lygg+N3oH+p7XkPvH_6ZbvTRY6CaZzFqDixzSgDHBA@mail.gmail.com>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 6 Jun 2025 09:41:52 -0700
X-Gm-Features: AX0GCFsGQAfqG6AckaE2dzN-sFHMIgG2nS5Dtrqvn7bKG-PkR87MSRPoQm07c1U
Message-ID: <CAMWSM7gD0Tiu-JOUqyoASHQHrz79rnW3+kfQ4wnRSOx051GB4Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: rockchip: Add rk3588 based Radxa CM5
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Steve deRosier <derosier@cal-sierra.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 5:51=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com> wr=
ote:
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi b/arch=
/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..d7946fe2bb4e721689e3eb4=
d60d8e9783402f05e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
> > @@ -0,0 +1,156 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2025 Joseph Kogut <joseph.kogut@gmail.com>
> > + */
> > +
> > +/*
> > + * CM5 data sheet
> > + * https://dl.radxa.com/cm5/v2210/radxa_cm5_v2210_schematic.pdf
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/soc/rockchip,vop2.h>
> > +#include <dt-bindings/usb/pd.h>
> > +
> > +/ {
> > +       compatible =3D "radxa,cm5", "rockchip,rk3588s";
> > +
> > +       aliases {
> > +               mmc0 =3D &sdmmc;
> Since the microSD card is on the carrier board, this alias should be
> moved to the board DTS.
>

Good point, I'll move this to the board DTS. This is a remnant from
copying aspects of the downstream DTS, and adapting it for mainline
conventions.

> > +               mmc1 =3D &sdhci;
> Most of the other Radxa rk3588 boards have the eMMC alias to mmc0. Why
> does this use another convention?
>
> > +               mmc2 =3D &sdio;
> The sdio is not enabled. This alias won't be used.
>

These were copied from the downstream DTS. I'll go ahead and use the
mainline convention here as well.

> > +       };
> > +
> > +       leds {
> > +               compatible =3D "gpio-leds";
> > +
> > +               led_sys: led-0 {
> > +                       color =3D <LED_COLOR_ID_BLUE>;
> > +                       default-state =3D "on";
> > +                       function =3D LED_FUNCTION_HEARTBEAT;
> > +                       gpios =3D <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>;
> > +                       linux,default-trigger =3D "heartbeat";
> > +               };
> > +       };
> > +};
> > +
> > +&cpu_b0 {
> > +       cpu-supply =3D <&vdd_cpu_big0_s0>;
> > +};
> > +
> > +&cpu_b1 {
> > +       cpu-supply =3D <&vdd_cpu_big0_s0>;
> > +};
> > +
> > +&cpu_b2 {
> > +       cpu-supply =3D <&vdd_cpu_big1_s0>;
> > +};
> > +
> > +&cpu_b3 {
> > +       cpu-supply =3D <&vdd_cpu_big1_s0>;
> > +};
> > +
> > +&cpu_l0 {
> > +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> > +};
> > +
> > +&cpu_l1 {
> > +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> > +};
> > +
> > +&cpu_l2 {
> > +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> > +};
> > +
> > +&cpu_l3 {
> > +       cpu-supply =3D <&vdd_cpu_lit_s0>;
> > +};
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
> Should this be left disabled on the SoM dtsi? And only enabled on the
> carrier board, if the carrier board has the RJ45 jack?
> i.e. a handheld using the CM5 may not have ethernet
> https://github.com/StonedEdge/Retro-Lite-CM5
>

I think that makes sense, not every carrier is guaranteed to have ethernet.

> > +
> > +&gpu {
> > +       mali-supply =3D <&vdd_gpu_s0>;
> > +       status =3D "okay";
> > +};
> > +
> > +&hdmi0 {
> > +       status =3D "okay";
> > +};
> This should be moved to the carrier board DTS where all the other
> HDMI0 nodes are.
>

That makes sense, I'll make this change. Thanks for the feedback, Jimmy.


Joseph
