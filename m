Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA592E9EB2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545202; cv=none; b=G07QbRkPrI+7wF6rdKxtNA6YAUGwsJU9dHYDEUGyPgjge2BtUFEdVSWN4ou9aEJknh2IX01GLxLZJUOxdK/N0mvDiLLkT31fS54K/88MLFbCNXj/FNnjDjrpYMUx/A3pRZGLuwFvERXY/JTPMGNg0b2fP03f4cugE2LN6u/oJtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545202; c=relaxed/simple;
	bh=kKL3IDHxSL9ur5slPrsn/ZT6vo1aStrKbY0F9D9k7cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shWodr6f+vTg8EFF0PWV4BSaG7NaiyWL914vMEO32RHiJuqtgyrCZ7qx66cD2U8uV4RsJ5Q91/ahTnoiGbjGO5XSb8sLpAmkGV16r8a5Sr/sDOU7zKpVMkviT03yVPpc+ToAw21cZMd1kVy4k07J/E2rM+jLYT5V/Oluuf7h/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mUGzxWfL; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mUGzxWfL"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so4936204276.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751545199; x=1752149999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5OmxI4SidnpS0vVfCbFw2K2gtQJNYphQeO8RrhcQo8=;
        b=mUGzxWfLcANgIxZC82zeORoSi9LpLxJy/TrmbbrTWvsWDXtbUhAMg7g/UfWKxCiLdx
         pWg9dQnI5SRs4wpZWbevVtXSYFK1A/wXGbrrrVDSBqsEG7U0D6INKcOnnUbFU6iksZ5K
         wqbVe1R5YEEeFeNJVXKZSWzyfWe0dJ/FvV2CLvMIyEPrCjN/idtFvrNrKJT/hHWDfYlH
         idUDFdL3MWn5fjFuOZyAiVx6wDx5puarMwaCDb0H+wlqE4wHrMSms6P00vMY7ZIGGYFZ
         pxQ7Qq4kRnttqwTEdMznfEsA7ly806I0CbvOUkMdIuFEoOiadaJ5wbsRjZsk1P6K93T2
         LIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545199; x=1752149999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5OmxI4SidnpS0vVfCbFw2K2gtQJNYphQeO8RrhcQo8=;
        b=g54fXB0+YXcj7donWS9lEWANOIOk2dbHcczVuwPDUfu0IfG/DPvnkSfJJ5H7VEYRox
         4kW39wzoxEMXY5B5rgkRIT2Y+EiDMN0Q28sm9cG1CrfpJH7+E4X/IxqQaZs/MHx8/Xuh
         ruGrUtk2fxgZ82PZFcxJXoUps0mJy6sfkO8UNftFuGwX037MzIy/tBijKWhV0/PPG+Uh
         3Tfjt89ichE1Ww9n8mCh9mrE7RzR8k5dPHYar29wvBTKIG6jmA02aNzvyyLkHbSkWRgx
         A2WO/syBbtn2NWZnRKPykPVxR1VS8Mg2q4fpdffin/4wexavAAKug0J5rraOTrLrlQDa
         uq4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUauNs8UtkY+qIpMYbPejCSPgO2KTwf55K9AOQ/Me4BkGDd8v2fhwPyJE6GCEo0rBShen5tVHb3RuOInns=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiy5H8m2O5Z1QTW9TMJUFioaR0YGAc9R3O9jgm97n9HDorR0XH
	yeYc88Kp8jrcDgZgLqoiIKxXocTnLFSm4xht/IxXTFjOBBoTX3ktT/Fmc2BP3hVnnGyWaXYk5A0
	L/tu77iG3GehNeD3d8UIPBPQKIvEAIoV9WDtwUfWMbA==
X-Gm-Gg: ASbGncv9xeVPNsEgBypLTT1wNxEbjugBoOjyz0dXYPYUcaFB9xoomwiinOw0TOkAfs5
	zNoP2s5KCA+/mOe4qX2zFmRjz2ArGAij+n244ZtSSBt5l2JRmlRCwrX4IDACaZmJZ+PGBYu0WsG
	zJIqDWqEaJXxXth/D6O/UNPoA1mnT8NN30KQgyPQpGn+Hl
X-Google-Smtp-Source: AGHT+IGeQ25BfOeCZ6K58In/sB8b1ZR/YJwrPf+U8PqmfpS8N2JgDxJX3EH5egsVw60A4HjnBNqsJSLLaMm5U7EBU3c=
X-Received: by 2002:a05:690c:4802:b0:714:268:a9f8 with SMTP id
 00721157ae682-716590ec815mr46729757b3.27.1751545199558; Thu, 03 Jul 2025
 05:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626112442.9791-1-edson.drosdeck@gmail.com>
 <81d519f5-caac-4fd8-8491-3580ce1b6060@intel.com> <CAMSsBRyvdvxgAQMkoB3UTZUs8MDEdPEVcKh2fFto6TFz-hUeiA@mail.gmail.com>
In-Reply-To: <CAMSsBRyvdvxgAQMkoB3UTZUs8MDEdPEVcKh2fFto6TFz-hUeiA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 14:19:23 +0200
X-Gm-Features: Ac12FXz3uWlhWrNuVR3FR61kkpyGiUJaNlibnmXBnTwXEWNnSDIxaj442r_4-YA
Message-ID: <CAPDyKFrLBV=AwDTiSC14N+qBknU+zM7bK-Vtj4a=c+byiUOgZA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci: Quirk for broken command queuing on Intel
 GLK-based Positivo models
To: edson drosdeck <edson.drosdeck@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Jul 2025 at 01:07, edson drosdeck <edson.drosdeck@gmail.com> wrot=
e:
>
> Thanks for the feedback!
>
> Just to confirm: should I resend this as v2 with the corrected subject li=
ne?

No need for that this time.

I have applied it for fixes and amended the patch according to
Adrian's suggestions, thanks!

Kind regards
Uffe


>
> Best regards,
> Edson Juliano Drosdeck
>
>
> Em qui., 26 de jun. de 2025 =C3=A0s 11:05, Adrian Hunter
> <adrian.hunter@intel.com> escreveu:
> >
> > On 26/06/2025 14:24, Edson Juliano Drosdeck wrote:
> > > Disable command queuing on Intel GLK-based Positivo models.
> > >
> > > Without this quirk, CQE (Command Queuing Engine) causes instability
> > > or I/O errors during operation. Disabling it ensures stable
> > > operation on affected devices.
> > >
> > > Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
> >
> > Subject would normally begin "mmc: sdhci-pci:" instead of "mmc: sdhci:"
> >
> > Otherwise:
> >
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> >
> > Also I guess:
> >
> > Fixes: bedf9fc01ff1 ("mmc: sdhci: Workaround broken command queuing on =
Intel GLK")
> > Cc: stable@vger.kernel.org
> >
> > > ---
> > >  drivers/mmc/host/sdhci-pci-core.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdh=
ci-pci-core.c
> > > index 13a84b9309e0..e3877a1c72a9 100644
> > > --- a/drivers/mmc/host/sdhci-pci-core.c
> > > +++ b/drivers/mmc/host/sdhci-pci-core.c
> > > @@ -913,7 +913,8 @@ static bool glk_broken_cqhci(struct sdhci_pci_slo=
t *slot)
> > >  {
> > >       return slot->chip->pdev->device =3D=3D PCI_DEVICE_ID_INTEL_GLK_=
EMMC &&
> > >              (dmi_match(DMI_BIOS_VENDOR, "LENOVO") ||
> > > -             dmi_match(DMI_SYS_VENDOR, "IRBIS"));
> > > +             dmi_match(DMI_SYS_VENDOR, "IRBIS") ||
> > > +             dmi_match(DMI_SYS_VENDOR, "Positivo Tecnologia SA"));
> > >  }
> > >
> > >  static bool jsl_broken_hs400es(struct sdhci_pci_slot *slot)
> >
