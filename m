Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFCF1EE017
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748593639; cv=none; b=HYbQVc82t1P2urUntizbSE83YVzKCqS6Qo0vTCygAgSuNT1MyKZwvnxu6ooUdgVhiu47ZbsWyxKcUK+y54nwT8DeQo26SyFgNkfuYHG+wn0BE9L9mPtUC+uZEC76+nra1avU/zOaHDkHARToYReyXaGqJ/HPBOUPhXL2F/wYITA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748593639; c=relaxed/simple;
	bh=vRrRzjvalC4b5vsqPDE18UuRNxy3sXp/LnYLU8RtL7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mj0ct9dckImup277CQyr3UL13YKgnk491jf6mI30+mjcbjDsBcPL8fdsdf6K6yhd1aiZz55BCmqO2lnOc5s7nQx2rGAHlyQOV5pcpLVoHvgRCKu202ImpTJKC73+u7d8kobHAKV3eIVS8CcnVct2X6rdVcI/K47iAdQsuYuvgnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqRiW8a3; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqRiW8a3"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e78e04e48so14249697b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748593637; x=1749198437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYOli4oTQ0MFkGdltVUUX/1x4FeeDlNH5ixoZJpfc0Y=;
        b=eqRiW8a3/dfUqAkOBk61G9ThYudPPGEAMbmEKWzTYVgPsUbyhV7tK793o3hwSoU85y
         x4KrvebM6QN+G1ucZHrJWdJZIrww16MPhVdpx6YP3Sf1VSy8dFjd5Fa+L0xDAAcXDa6P
         FOE7hQAG0Xdqzi3xK9lhGbrHDK+RyWSM4RVJW2WFHSotyU8EIgSPMAqWSYV8V4c3hXYC
         I+IAPxKDG0af1aQkAzu2n4Io5FCBskkBI3gXRERzhSwORX985e7X6jQ9Y5h/8FDkrvkL
         IZoJOZ5Zwk9qN1Rm6MLmSkQsrrX7TZC80zIk2ciFf0fI7mBNZYnVaksUNmek4ZmuQwwN
         Hc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748593637; x=1749198437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYOli4oTQ0MFkGdltVUUX/1x4FeeDlNH5ixoZJpfc0Y=;
        b=ZS1hTH72FaIPweWxjMcBahGH89jL/IHS4ax3gQgX+F8s4+ypiJ/BCCfEWzRTJsVdgI
         JOBjHX5SOj5tpSSB/hUjOOKlHvEIY+TO2KyFgFXIgMcCMDU6LxPzot9uYnkBFo5el6i6
         BCOobQskWwWCFgSj9q0I0sb/yHt7gWwnyXp8z72MGft5W7hA15F2RXcKaZ651Ey/H/iG
         zgBmSS3Hgqs0h3zM2TvHtRrYOJ8WIWNOJYdWzxo+UmSPv9y138dEVTKj6Cru1u4EyZC5
         kTfHKi8R2Njy/VhWBzjKSsBbdD0ATjexyiiz8xTGkhlKxiRFLHBdeysL3a9ZCdTVayzd
         THnw==
X-Gm-Message-State: AOJu0YzrYtsf6f65/yUwVqNK6pFTNpkXFTcGmqR/pxWjthf82InbOcRs
	k3FMrvYS5LACeqUWx55Lyh3c/KwLj9H52WBWY6ThpikouMD2VeGWq1JRt7dXjD9DqAeMDj6A/q6
	MH759RNDqSy+x4wrpeprcJSMMJIrT7mU=
X-Gm-Gg: ASbGncvgA4hmkOunOhzEIDDSIJPlSXaKaL2V6Ot6Z6y0DFB5y51HALbdLQBnzvkwbM+
	AmU4wwdPNsdbrCusSehMioZU3DkJP7HEs8Nhq2BEsgQ0k8VHQRqQewFzMG9x9MQDwDsnb1DpRKa
	CNg2BV8i8LnkfQmtLJpW5jfNtO9OV3jm4=
X-Google-Smtp-Source: AGHT+IFsqOwz2hH/6SkMcb4g5Yt5gM++f/aIIg84Ru4n0ZJdf4J+GaGTDN2HUDMjHnisBhrlGkZG3VMjpTsxTu67sqE=
X-Received: by 2002:a05:690c:ed4:b0:70e:2168:7330 with SMTP id
 00721157ae682-70f97ebe21cmr35975617b3.19.1748593637073; Fri, 30 May 2025
 01:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530034713.4165309-1-dregan@broadcom.com>
In-Reply-To: <20250530034713.4165309-1-dregan@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Fri, 30 May 2025 10:27:05 +0200
X-Gm-Features: AX0GCFu20_wlEHN11fGmhScteajc3WuMgALK6hLnwRgWbt4ITw7IMg-Z42znGps
Message-ID: <CAOiHx=nzNZiOiBKUVqpTA5S8uY+ZNdPpLpEQGGDN9jP2-4Lj8Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: brcmnand: fix mtd corrected bits stat
To: David Regan <dregan@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, william.zhang@broadcom.com, 
	anand.gore@broadcom.com, florian.fainelli@broadcom.com, 
	kamal.dasu@broadcom.com, dan.beygelman@broadcom.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	rafal@milecki.pl, computersforpeace@gmail.com, frieder.schrempf@kontron.de, 
	vigneshr@ti.com, richard@nod.at, bbrezillon@kernel.org, kdasu.kdev@gmail.com, 
	jaimeliao.tw@gmail.com, kilobyte@angband.pl, dgcbueu@gmail.com, 
	dregan@mail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 30, 2025 at 5:48=E2=80=AFAM David Regan <dregan@broadcom.com> w=
rote:
>
> Currently we attempt to get the amount of flipped bits from a hardware
> location which is reset on every subpage. Instead obtain total flipped
> bits stat from hardware accumulator. In addition identify the correct
> maximum subpage corrected bits.
>
> Signed-off-by: David Regan <dregan@broadcom.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 48 ++++++++++++++++++------
>  1 file changed, 37 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/=
raw/brcmnand/brcmnand.c
> index 62bdda3be92f..43ab4aedda55 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -361,6 +361,7 @@ enum brcmnand_reg {
>         BRCMNAND_CORR_COUNT,
>         BRCMNAND_CORR_EXT_ADDR,
>         BRCMNAND_CORR_ADDR,
> +       BRCMNAND_READ_ERROR_COUNT,
>         BRCMNAND_UNCORR_EXT_ADDR,
>         BRCMNAND_UNCORR_ADDR,
>         BRCMNAND_SEMAPHORE,
> @@ -389,6 +390,7 @@ static const u16 brcmnand_regs_v21[] =3D {
>         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D     0,
>         [BRCMNAND_UNCORR_COUNT]         =3D     0,
>         [BRCMNAND_CORR_COUNT]           =3D     0,
> +       [BRCMNAND_READ_ERROR_COUNT]     =3D     0,
>         [BRCMNAND_CORR_EXT_ADDR]        =3D  0x60,
>         [BRCMNAND_CORR_ADDR]            =3D  0x64,
>         [BRCMNAND_UNCORR_EXT_ADDR]      =3D  0x68,
> @@ -419,6 +421,7 @@ static const u16 brcmnand_regs_v33[] =3D {
>         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D     0,
>         [BRCMNAND_UNCORR_COUNT]         =3D     0,
>         [BRCMNAND_CORR_COUNT]           =3D     0,
> +       [BRCMNAND_READ_ERROR_COUNT]     =3D     0,
>         [BRCMNAND_CORR_EXT_ADDR]        =3D  0x70,
>         [BRCMNAND_CORR_ADDR]            =3D  0x74,
>         [BRCMNAND_UNCORR_EXT_ADDR]      =3D  0x78,
> @@ -449,6 +452,7 @@ static const u16 brcmnand_regs_v50[] =3D {
>         [BRCMNAND_CORR_THRESHOLD_EXT]   =3D     0,
>         [BRCMNAND_UNCORR_COUNT]         =3D     0,
>         [BRCMNAND_CORR_COUNT]           =3D     0,
> +       [BRCMNAND_READ_ERROR_COUNT]     =3D     0,

I see this register in BCM63268's NAND controller at 0x80, which is a
v4.x one, so I'm surprised v5.0 doesn't have it. Or does it not work
there? I don't know if v3.3 also has it or if using this on v4.x would
require a separate brcmnand_regs entry.

Can't really comment on the remaining changes.

Regards,
Jonas
