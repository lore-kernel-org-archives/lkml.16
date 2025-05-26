Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04471F4E4F;
	Mon, 26 May 2025 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748257642; cv=none; b=mPo6xC8Ed4wzcTJdJV1Y3OKf88XdDwRYkYHnvbQPhd4+E+Kfla56DaNMBaurhez3FVxgNjphAmj4M3dYtgSmHHcUlTvqpR0EVBrVZiIb+sl/iSkIBo+SEp+xv++nq0qV769CFIH/kGMbkO58o136+A808nuqvuMEr62RbHkYaVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748257642; c=relaxed/simple;
	bh=UJPyNfsZn3c6m79iQJR4snROO6tMz5x2Xulu0fzwq9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRyC9+LXogp26M5H3564JzDfc3rl07kuOLPAN7i5tiMLmoC94TPMY79QHs7sTkYxUObQcBAuTJrOzW4Qu0Rbd8f50TcMxrCJ0rgE73XwKYdhDtNmCgw3Bb6yOkPNw8JGvDfra1C/54v3WW5QyHo0JZPxr7YcmP96zOa8/Gw8J3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRYbFCQt; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRYbFCQt"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234496a33a1so6739775ad.1;
        Mon, 26 May 2025 04:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748257639; x=1748862439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPDFO6KuBc5ez4kafCcPtzLE3emZL3oCUAM81ZWzwGA=;
        b=aRYbFCQtGxwfaL2iXSi2UChZo75vWyLAQal0vMLXt3vXrdMgzKNQIa6epGBCi8MwGp
         tiUlCd77o6d3mCLvd/LfIWXclCUBIZoWlo6vuD52K16fdE/FH3zDvRhb49kyLqKhN4/B
         T+Dptm/ukznbzZZy0Rzys7mDv1Y04Qw0IPNSWnQ+PJ51bEqzwkthBEyxtvWTUTABFrOq
         cFnrBDr4HjuvmpoU50Sw43wFzIU4QMZTYFnxm/4fuqDRrvpi/ntqyiYh7OFrLOXhOsK+
         c5aKMMq+VTTLXb0aQLF7xBdVej0cOcv2QUJSABwBMaioftKY76IrstO/NYXT1aQGugML
         gdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748257639; x=1748862439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPDFO6KuBc5ez4kafCcPtzLE3emZL3oCUAM81ZWzwGA=;
        b=OGxO5WbSkafRAuRD84SuQHnDNw5k6+C7SQI2EsdXUmMyuqV0ft8eKxCa7OWiQihhQl
         VLkVIR3Yb2s8BzO+T8q3sDn68R4XqSBLDr39vwp7/oEpGUS+rwAVIeoeAlTxi45BpwOT
         QboRwAnX+060WBm806TJZewEtOlSA8mZGZ61UU6+Vzv7NDhGjBkYHWTlq1kgPta7YN/7
         /yRYro+o0Fl7F6Rgw6Q6yJiWxtlYG3bEId1+IwFg4QGPZ6uNvPxV9N+SROh/Bxmmqc6y
         18/qFSw98msX/szyzX/ZsUYLNWZ8T0WpLE9K4eCJUsBtwPSpeAqk+5RTaC2X8PcI54dl
         2XHA==
X-Forwarded-Encrypted: i=1; AJvYcCVfKUt3TwemlJb/8DF4oOkMOwElxp6yDZ/s9r1750bGuZnyJXYImjLxmpvWoAFxgXeCP7dhh+kAzu9EP+LA@vger.kernel.org, AJvYcCWlTLeHSsysvy5MTUoIP3AyRZCUutJ+B6uyw8BGfapXhl8OME8fVXNgyRaUa7qP7+uDthG/vO4I3aaC@vger.kernel.org
X-Gm-Message-State: AOJu0YzWswrpRSidJpkr0wIOij7nAEo43Cg9KIx9xBV6HMiUxVG28SXZ
	oBLV3hQf5i4H42uDTZDcLmQyprCqGsq8HToHSyT3nz/wmesK2ZkD3bFdz6gaag/M0rfPcG3c0Cr
	a31f5yHHN/FB/IsMiJcPHVaDfNjAW1io=
X-Gm-Gg: ASbGncsHhw+dP0CAZ3KNFJsFhCgfLVfenJ4M9aZoK3C/DEuO7ha6L0YFSRI9SmI7idg
	/tNSpztv8x55Zq5R05lpW9EITmBRyjZPmB8brheDXEpqm9sU+BQTv5W591SmE7Wt65ncJvO/YVm
	cc2/fMoPrigseWuru7i6oUUlBp64Lbbw==
X-Google-Smtp-Source: AGHT+IFNUkARStkUU0yA3GEirT+p8/UabY84M61srXw809EWJlrTdy0hxaH1tDIgKxVdp+S1wPaDN/JBZ+LBbWYliac=
X-Received: by 2002:a17:902:cf03:b0:231:f5a8:174d with SMTP id
 d9443c01a7336-23414fc0745mr113084145ad.44.1748257638727; Mon, 26 May 2025
 04:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 May 2025 14:09:00 +0300
X-Gm-Features: AX0GCFvFAHKTv9eLfMcc2ymFlTkdSDqneLYcacXjWWR2TG_Yd0O5c-iBoyzpmKk
Message-ID: <CAEnQRZC27dgATvvALcEq+8t4PrqkHJSrnThT9P58idnn3bve0Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] imx8mp: add support for the IMX AIPSTZ bridge
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

Gentle ping.

On Tue, Apr 15, 2025 at 8:21=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The AIPSTZ bridge offers some security-related configurations which can
> be used to restrict master access to certain peripherals on the bridge.
>
> Normally, this could be done from a secure environment such as ATF before
> Linux boots but the configuration of AIPSTZ5 is lost each time the power
> domain is powered off and then powered on. Because of this, it has to be
> configured each time the power domain is turned on and before any master
> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
>
> The child-parent relationship between the bridge and its peripherals
> should guarantee that the bridge is configured before the AP attempts
> to access the IPs.
>
> Other masters should use the 'access-controllers' property to enforce
> a dependency between their device and the bridge device (see the DSP,
> for example).
>
> The initial version of the series can be found at [1]. The new version
> should provide better management of the device dependencies.
>
> [1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-da=
niel.baluta@nxp.com/
>
> ---
> Changes in v6:
> * drop the 'IMX8MP_AIPSTZ_HIFI4_T_RW_PL' macro. Its whole point was to
> help with making the DTS more readable but if it makes it look worse
> then there's no point in keeping it.
> * use consumer ID as first AC cell and consumer type as the second cell.
> Better to go with a format that more people are used to as long as it
> still makes sense.
> * pick up Rob's R-b
> * link to v5: https://lore.kernel.org/lkml/20250408154236.49421-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v5:
> * merge imx-aipstz.h into imx8mp-aipstz.h. imx-aipstz.h is
> currently only used in the DTS so it can't be added as a binding.
> * place 'ranges' property just after 'reg' in the binding DT example
> as Frank suggested.
> * use the  (1 << x) notation for the configuration bits. Previously,
> hex values were used which didn't make it very clear that the
> configuration options are bits.
> * shorten the description of the bridge's AC cells.
> * shorten the message of the commit introducing the bridge's binding.
> * pick up some more R-b's on patches that remained untouched since V4.
> * link to v4: https://lore.kernel.org/lkml/20250401154404.45932-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v4:
> * AIPS5 node now only contains a single memory region: that of the AC
> (just like in V2). 'reg-names' property is dropped.
> * AIPS5 node now uses 'ranges' property to restrict the size of the bus
> (1:1 mapping)
> * change the number of AC cells from 0 to 3
> * add binding headers
> * link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v3:
> * make '#address-cells' and '#size-cells' constants and equal to 1 in the
> binding. The bus is 32-bit.
> * add child node in the example DT snippet.
> * the 'aips5' DT node now contains 2 memory regions: that of the
> peripherals accessible via this bridge and that of the access controller.
> * link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurent=
iumihalcea111@gmail.com/
>
> Changes in v2:
> * adress Frank Li's comments
> * pick up some A-b/R-b's
> * don't use "simple-bus" as the second compatible. As per Krzysztof's
> comment, AIPSTZ is not a "simple-bus".
> * link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurent=
iumihalcea111@gmail.com/
> ---
>
> Laurentiu Mihalcea (6):
>   dt-bindings: bus: document the IMX AIPSTZ bridge
>   dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
>   bus: add driver for IMX AIPSTZ bridge
>   arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
>   arm64: dts: imx8mp: add aipstz-related definitions
>   arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
>
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
>  arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  33 ++++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  16 ++-
>  drivers/bus/Kconfig                           |   6 +
>  drivers/bus/Makefile                          |   1 +
>  drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
>  7 files changed, 251 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aips=
tz.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
>  create mode 100644 drivers/bus/imx-aipstz.c
>
> --
> 2.34.1
>
>
