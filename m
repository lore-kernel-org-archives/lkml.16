Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1208870800
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748313704; cv=none; b=a8Wu9090HKAAKOO0YfOh6OWUIgLL0WzI9gTb3u92ZpWXgdvB0gTOkoHB+XoKxf6tGhIUsrIr39SQYd7hRH2J3K2pbdhQ3KknPTO/PuKQ19i4nlXz6MPHCKiUFWd1YWR3aOs1QcFqxBse4jywxIU+SkzoORFvDJjTxUYQ56HG1Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748313704; c=relaxed/simple;
	bh=hFopwnwGuxFX70zetyJsWh8D7vCNnSwoCh/cnSFt3tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVBlHqkXgZepiPiEoOIgf0G8ebjHiYn4lKeiZG17u9s+zbsaE2vvilAL+6/P6UR9PQbE2bDf6+fGjzkVWoEe5STGYIXLtXLmZad+NGSLX/seQjC06RTjcbQjz1ppoG1K/0+bPYnT1toMNLprf9VbMWnzJxB/z7GpF6itS36RA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=i6DW77x6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="i6DW77x6"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so565974066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 19:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748313699; x=1748918499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZERauyRIXerSc9GUNUPNmoyTTV2jjjUNrho3ew4khU=;
        b=i6DW77x643dHtWcW0iGqI6lBSw3s5K1bVS3jrbeIRFObkslIJAIbw5HmmgfvMCwVq2
         IRvJp26LMTKpBxXsjq2JLIJc6NSJEtcPMh/FISrKSlDNthvgOfVqf5660i/rblMP6ZUv
         YbNopFGbOXtQpoFJE3R3ta6V35RM4cAVxG1JbYOHGFZTJk+W99Dd0sukMmivTw9g+ajQ
         00Fwzx0l+M6k4Xf7hnEqqAlk60PA4yKyzq/D6KQQRFQcmL/YtcsyEpXlelVaXhUWimSp
         CnEfHwum4B7SYCFP+P9nPkNfOVT0Jd5ENnEWuKFfXHuOY/VIl2O1O662+QG6uiD85NeC
         m/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748313699; x=1748918499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZERauyRIXerSc9GUNUPNmoyTTV2jjjUNrho3ew4khU=;
        b=cnsToYKg2zmx+/XBLAdlrJu+kdCDDlaHGEyJrIDxLtBcqyZZt4WBHeco7VqDtQ2IDD
         wTxeR1A7U+H7NyHsVds7PFFciJrVcTfRgzm1lhObZucRB+G4N0Q7ow4VpwhDKyRGgjT7
         gvtXBV1hzUoNtACh1RJxo02iHO3CcXuEXrhViOECXulciPwRiF1CpBNEVMIpkm2Y1kJ1
         +4/gyi6YK8ZcOD7yhhXcpJtyifxhsmmvupuEOvu6TRkmCR985zOTnM4Poi90G0yPffqH
         iAclWG5jVaYNfsIB3qvLBN5rytfE40M/qQiPKpgTR54d5gwNgaRDC9E2pVHhZTGOVSnv
         f9TA==
X-Forwarded-Encrypted: i=1; AJvYcCWUJfGoh2a98t/mN4yofpByZ67rU7sw+ADvFK1bZZt1ZifuWe+pXo003btMnIG68zjw7pR5NQWnTqbUw7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhqS7ZPAeXyR1H7c43hGDFTziCkxWYwl0hvj1Hga6obwB5dy38
	NxY8igdAgDH9jTgYJD/sxWxUkgUyD7GFQTuPBEKwq/FLT6qfbfu+LAUENpCDWyu4PXm3XWPqPT+
	PLuUCXr2RcVhdMdDAsoJe/6WGz3F0IZhHK3rmIpjB4w==
X-Gm-Gg: ASbGncvyUkxWW4XPRG0v5k4Zu2FB32fOOwQWtWb7ijgO5zigwlD0JPGRooVhv0Hep4X
	rDUOFQoTxIoxynm+VMkFgMsGNMi9VxgT8bkjgElqLiCZbhWxVdlCpKO0M66TcqqSohF1b/fRCvr
	EZr01359LDkCv7+2vCP1wBfqZeITZnnW14eg==
X-Google-Smtp-Source: AGHT+IEwDBoO6fPNQbhz18OXkU1emYXVf9ol8i2RRW8+CYwMWPShuzxk64vRiGzkPz9segng6DJBOqMGPdvXU6MevTk=
X-Received: by 2002:a17:907:3ea9:b0:ad2:2fdb:b0ab with SMTP id
 a640c23a62f3a-ad859b5436emr1083211866b.29.1748313699251; Mon, 26 May 2025
 19:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com> <lgjntm2v4qtp3uwccriodxdefdc4vqydzl4dmula4avhws4zfi@xevkgzfuhyhl>
In-Reply-To: <lgjntm2v4qtp3uwccriodxdefdc4vqydzl4dmula4avhws4zfi@xevkgzfuhyhl>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 27 May 2025 10:41:20 +0800
X-Gm-Features: AX0GCFtJk0m16OgxkbmqVbr299LwditdBcOLPf3TQyBjUg1Ado6GD-l3Ru51kO0
Message-ID: <CAH1PCMZBBmDibwSLUAhDAyjAORgpS+D-U5_kfLJkbZ2r=XpFDA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, heikki.krogerus@linux.intel.com, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 1:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Tue, Apr 29, 2025 at 04:50:42PM +0800, Guodong Xu wrote:
> > This patchset adds support for the SpacemiT K1 SoC in the PWM_PXA drive=
r
> > and updates related device tree bindings. The changes enable PWM
> > functionality on the K1 platform through driver enhancements,
> > configuration updates, and device tree additions.
> >
> > Functionality has been verified on the Banana Pi BPI-F3 board using PWM=
14,
> > configured as a pwm-backlight. Per community feedback, the actual
> > pwm-backlight node is not included in this patchset but can be found in
> > patch 7 of the v1 series, with modification of pwms property to 4-cell
> > format to match updated binding (#pwm-cells =3D <3>) since v3.
> >
> > +             pwms =3D <&pwm14 0 2000 0>;
> >
> > This patchset is based on [spacemit/for-next]
> >   base: https://github.com/spacemit-com/linux for-next
> >
> > Plus the following dependencies:
> > 1. Clock controller driver, posted by Heylen Chu (v8), with most of it =
has
> >    been accepted:
> > https://lore.kernel.org/all/20250416135406.16284-1-heylenay@4d2.org/
> > 2. Reset controller driver, posted by Alex Elder (v5):
> > https://lore.kernel.org/all/20250418145401.2603648-1-elder@riscstar.com=
/
>
> It's not clear to me if I have to look into this github tree and the
> listed dependencies. My impression is that it can go in on without these
> changes. Maybe it only starts working when these are also applied, but
> that shouldn't stop me applying this series, right?
>

Thanks Uwe for the review.

The dependency is in patch 3, where I added the PWM nodes (pwm0-pwm19) to
k1.dtsi. These nodes reference RESET_PWM0 to RESET_PWM19, which are only
defined after applying the spacemit reset patchset (Patch 1/6),
available here:

https://lore.kernel.org/all/20250513215345.3631593-2-elder@riscstar.com/

You're right that patches 1, 2, and 5 do not depend on that reset series
and can be applied independently.

> There is a patch in pwm/for-6.16-rc1 (namely commit df08fff8add2 ("pwm:
> pxa: Improve using dev_err_probe()")) that conflicts with this series.
> I applied patches 1, 2 and 5 on top of my pwm/for-nexxt branch resolving
> that conflict and rewording the commit log of patch 5. The result was
> pushed to
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.gi=
t pwm/pxa-spacemit
>

I've reviewed the three patches in pwm/pxa-spacemit, and they look good
to me.

Thanks again for handling the conflict and rewording the commit log.

> . If you confirm that you're happy with my modifications and it's
> correct to apply them without the listed dependencies I will add the
> patches to my queue for 6.17-rc1.
>

Yeah. And I confirm that they can be applied without the reset
dependencies.

Thanks.

BR,
Guodong

> Best regards
> Uwe
