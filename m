Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467EE21D594
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540594; cv=none; b=Pe1ZRh8TlPB5b2lE0iaH3/DDXYEg3ejS4vdDXj2EO4QJXGSc1JZmiT4+Gfo0ht+wKcx1eFHcG44cBp/guyQGbzaZOCy76H/bAZ4Dbw/XP14Jg+vX4MXC+7Bq5yAE+UwRB6nIZYwN3K3JdVQfLWgnXwk9Z9OfdjIW5ySP9qlG3D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540594; c=relaxed/simple;
	bh=5oAC8/KOLWvcD+AgChYntbLN0tecf14N332ANLMQENk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVttJakZbMO2mFv0dNU4Gg8knKQ48TZ725mVpaIchdWEoZsFFS2tiSNN0b73e88SQ/KLG0gkr9solloR4TO/bU1jX1rIFvg37DzxGqtDdyy+pcn43c+LldPsbpMndHX2JArwG+9QKf5XzaSvW3v9HAoMhBCplJ16LCET7tPUGbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GU2UnBLt; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GU2UnBLt"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso3709928a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749540592; x=1750145392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/c/nvFBTk1rF9mbHMZr8X1pL6twdsG/UeweRIdwNzck=;
        b=GU2UnBLt0bnmHebpeCf3lLPPAypPUcg3J3uNzTU/c7zkar287vBiLlntEGYKq5lrXh
         pfEqVPF86fPfw3dxYtOgah34WwHlzVot7zvgKnuXk/T8BGQo0wcozNZpi96+7eHfGenG
         WCQxQf34WIuh1IIRCbX5PlZFSHeOe2M83s82aTeoHz7wOfO/Y/pKZ97aGF2+0/zHntaZ
         X+na0M2F4lExIVtDSMO1c6nn6tsTWyAn3bT3cfCTSIv2W1D6uiDtHs2jcj5xv4hRfUlb
         tsit3fxQVt21A/O7yX0InvgZfRXoiltn4xffEKvftZDrZYGu8sO6/s70sPBvdq8s4TLN
         0hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749540592; x=1750145392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/c/nvFBTk1rF9mbHMZr8X1pL6twdsG/UeweRIdwNzck=;
        b=YTVepdhlYnAJ8rAwhgsFu+QtKkBSMYCNSGHylCVbVfaEYz3EOZt5yIAg+buVQW9pXo
         v9wTFcDM/cQY+jqRICJp5LsDXDl9dBUpxKydIjZCRmBPW055xcE0UyaABIxM3Pv2pms7
         qW72aKp4jVgzsOP88KMjUvUYIuekxn4w/wuxW6+Hhr8v8KhjXbK43DEmjgdJJLIQ230G
         DXgz7QgNSF5tVjggeMQXfIZQT3O/xKDp/90D66G3JrIm7xxtpeuj+jbXJY18TL/WK2KE
         hGFzOG3llO8cDcVor9O9t25VAgNCBkchuxvv/Y+NviQQYDWyV7wIE1P7ta5+mGANa1GS
         Pk/A==
X-Forwarded-Encrypted: i=1; AJvYcCWXKJzV89fUUMx1xFwHjdbpQ+gRFjCTnM6mdBbewEuLBkR+pSETle7WjAnErVL1MMyF1t/+EGcwUDuJ1l4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGFwI8I97Bao17+EO+sOGGUifK7uEJXUKFzz1K4/EIoWNj8XFf
	IK12lYYxsxNJprKcY6N6gu+pb/LmNKGkqO8+IgKjpICfqVfmvCrjZ511BPLpvocOZqFLGmmWAJV
	A79Zb1JbmJWLLwuTdqKlbu8Y5a3BwJ9E=
X-Gm-Gg: ASbGnctqxX0+tNx1jM54axKoQC3vWsKY64FoY4Ew/y0R31izTFFgpnPZjPuRErg9jIS
	zk4q7kGPAMMBaqzKgi3dZFDAdX0IC2QjxAXLvd4lSNvX/tZhhc9hq3t8Fvk5mH4FpUBSn/Y39ze
	WHqdcjhwz+g4O4ECNndMbLLONEbwjBZX7vQlHLM1vOuVE=
X-Google-Smtp-Source: AGHT+IG61dYIWcqcw0OE8hs09XYLIpm7c0zzcURHFCO/KWRCm6ZbvMCefIG4bpV9Cf2AP1XG2hyRnFdosznPUxqh0OI=
X-Received: by 2002:a17:90b:3c04:b0:312:f2ee:a895 with SMTP id
 98e67ed59e1d1-3134706fbebmr22686005a91.31.1749540592421; Tue, 10 Jun 2025
 00:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com> <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org> <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net> <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
In-Reply-To: <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 10 Jun 2025 15:29:24 +0800
X-Gm-Features: AX0GCFuAD83STnCHvnaOnAf33LKrtH_sKdhEdIlLIkxv-j2z0CHQ59q_ioyCu2A
Message-ID: <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Pratyush Yadav <pratyush@kernel.org>, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tudor Ambarus <tudor.ambarus@linaro.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=881=
0=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:46=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
>
>
> On 6/10/25 1:14 AM, Guenter Roeck wrote:
> > On 6/8/25 18:13, Guenter Roeck wrote:
> >> On 6/8/25 05:53, Pratyush Yadav wrote:
> >>> On Sat, Jun 07 2025, Guenter Roeck wrote:
> >>>
> >>>> Hi,
> >>>>
> >>>> On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
> >>>>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> >>>>>
> >>>>> Many flash devices share the same ID but have different part number=
s.
> >>>>> To avoid confusion, the part number field is removed.
> >>>>>
> >>>>> Additionally, since SFDP already provides size information and
> >>>>> functionality covered by no_sfdp_flags, these fields are also remov=
ed.
> >>>>>
> >>>>> Furthermore, when 4-byte address instruction table is available,
> >>>>> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
> >>>>>
> >>>>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> >>>>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >>>>
> >>>> With this patch in place, some of my qemu tests no longer recognize =
the
> >>>> flash chips (MX25L25635E/F). Do you have a suggestion on how to hand=
le
> >>>> this other than avoiding Macronix flash chips when working with qemu=
 ?
> >>>
> >>> Could you share some logs? Does the flash fail to detect, or does the
> >>> SFDP-based probing fail? Since this is qemu, it would be even better =
if
> >>> you can share a setup/reproduction guide. I have been meaning to set =
up
> >>> qemu for SPI NOR testing for some time now, but never got around to
> >>> figuring it out.
> >>>
> >>
> >> I suspect that the SFDP data for the affected flashes is incorrect in
> >> qemu.
> >> Since this is very likely a qemu problem, I'll just configure
> >> different flash
> >> chips when running affected tests.
> >>
> >
> > I was able to confirm the above. This is from the kernel log:
> >
> > [    4.500000] spi-nor spi0.0: BFPT parsing failed. Please consider
> > using SPI_NOR_SKIP_SFDP when declaring the flash
> > [    4.500000] spi-nor spi0.0: probe with driver spi-nor failed with
> > error -22
> >
>
> It's likely the problem where the same flash ID is used for different
> flavors of flashes. Typically we differentiate the flavors by comparing
> their SFDP data and use post SFDP hooks to amend where needed. If no one
> cares about fixing it, we can undo the change for the affected flash or
> revert the patch entirely. Cheng?
>

Since this patch removed the size field, the issue occurs because the
"spi_nor_init_params" function now processes the "spi_nor_parse_sfdp"
function. As a result, the error is likely caused by a problem during the
SFDP parsing, which leads to the failure of "spi_nor_init_params".

The issue can be resolved by adding .size =3D SZ_32M to the flash_info for
MX25L25635E to prevent failures caused by SFDP parsing.

The root cause of this problem lies in the failure of parsing the SFDP
data for the flash, rather than an issue with the patch itself. I believe
we should not revert this patch.

Thanks,
Cheng Ming Lin
