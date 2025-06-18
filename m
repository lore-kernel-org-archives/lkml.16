Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3F527EFEF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233403; cv=none; b=qbjmUFEe1lhqwMPo+Ze9p4qY7A0PdyKwriBKduHcAgqMBxcPcn2G5h1rrBnibvumUuJnCRLb0dTPqKJG0nrnfEfyzxm31hDH2bLiLu31dHlrHb6ItJOy5PSceHnty0aw9kA4moGUc/fFcPUo/B34cAyAHGezfQW28bwYjP/ok40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233403; c=relaxed/simple;
	bh=B725ObtQfopboWhV89KAmKWEgh99Un+X+ST1WY74ubs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnosc9jM1sO5wa2FtVpDJUUClEqxcZB/SL8R3UXKiEsjG33aB1IaIIRrDipqRUSeSc6yq8ACo+9eBR43oO61SX0RiiB53RxZpweSBTLqDNMIxzGryjMqfhlqFF25TaGyfhjdxOPl7zJukPkUbGEv5QzUfkU99mxgbJO8vnfyTPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ej9vC9oQ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ej9vC9oQ"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5534edc6493so7138878e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750233398; x=1750838198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ0GqfXFkwy2lsXPToSFORUxwHaztFRgNFLsON7VOMg=;
        b=ej9vC9oQnhqmVLWPRW04Quv4XT3JKiCTMF9GFs61BbMQos5s5iDSUwdwsfrwtqzj3z
         vx3O187mtH3BqzNPoW/Qsac3NBxc6dCQyIlAHYw9pVPiqV5AWjQpf3AVgY4Tnq7DdUzH
         BHDghgJ9nEg5Q+MWKbwTNOXxDktekGDkMW5mrbSTdsbVp5mWFnw41fHs/CF6lIheJLhX
         D40sOk+tsNa89UnrT5sRYSUlGa1UC6PS5oBr+69lf1B+aEVfm0vT6YBAPmxZZHW5ArSd
         pZYRYnbvs+uC0lbQubkpOAAOkYXnyYYGGeymFiWW0ZQhm3PF6Mdi7yJxmu7GG6ikIK8l
         mN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750233398; x=1750838198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJ0GqfXFkwy2lsXPToSFORUxwHaztFRgNFLsON7VOMg=;
        b=xL2CrmLVm52Ne6xQTLRHsluT62oLZzrrNicTXINc6m3TzseNdtLDQZtKe/5xUuaSao
         jxA6/gZiWsna9L1svshc3fzrbEoSrXp/r6O6SBC+ardRDfi9Msv8hedR6Hx+h/PEkfUd
         IPVGbiBnFvKj9lfur6oxblvp8b4srhz8jqyofgWxR+ThI0UVSfeURqGRswQP9fBmxCUk
         tFlCjNFdicmVyt6WohsBAoc6rNgiQPBiIV/2CvG22L+FVeXH6nTIHGc2mAvLDr/SBLSN
         /R3R/pdAPJR8MfaVU+D+LSxUT105mq/jx0ceTS5mKqPxWhixsyyXkFxyh67KPJMuasW7
         CB2A==
X-Forwarded-Encrypted: i=1; AJvYcCXDnZ2dDclYXzKhUge8mQU77lQM9Jg+YUUdo0/Ce6k0yG7z9KB9rcyGbhhuTrmx4NH2cPDkkrmNDWHiC8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKXF4wtsTC70TUEi9yjqE/Xu6Gj6bOaUO6sYCmpmKSWdvaiTM
	YWhj+DDWDJJorNbVgg/Bu9aSUWtmO+oFXAz9TmFaD7ZlRwReDbKbWZo4HEHcSD2smhHOSh+7jaX
	xVAE14sNuPkfjVi3UU8FWmheOUg0trLRsdBnQYKLdmw==
X-Gm-Gg: ASbGncvvgui3G/NWTU12qXz1Smy19Y8JUHTYXR3gNY2BlG7+CSeJ/36S8tL4VMOzxbp
	i1SKDrcu56N1BAfaR/d5tw3VzNI5huN/hRrIA2LWiokyoo8Pi5aPlvWstXC5QbTr2rjiHzrBg7V
	f3bFRaPols7LhniTYFK+GPdu56vuvQmRuOxgEtbqCw/YOmTKf8aibeCjUaquMM4NiQ6GS2squ+U
	Q==
X-Google-Smtp-Source: AGHT+IE695IdkbI0XaFitv8pj0RWUPD02k49e73uDCAYKNdE+Er9d4BDgEqRq3VwoZJvHMQj3QGfbfx0tg3NN2LZjpM=
X-Received: by 2002:a05:6512:1050:b0:553:3486:1d9b with SMTP id
 2adb3069b0e04-553b6f20ademr4250186e87.30.1750233397768; Wed, 18 Jun 2025
 00:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612082019.19161-5-brgl@bgdev.pl> <20250617233539.GA1177120@bhelgaas>
In-Reply-To: <20250617233539.GA1177120@bhelgaas>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 09:56:26 +0200
X-Gm-Features: AX0GCFte5APiTF5pvx6EYjGuNuCbnNBT7QTZx8AlXbjqtbSDs9YTuBKoXyu0R7Q
Message-ID: <CAMRc=MfbZAz_7PomZirQzY2Hq1i=uvpO3wH74nYq-ohjTavjMg@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] PCI/pwrctl: Add PCI power control core code
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Amit Pundir <amit.pundir@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Caleb Connolly <caleb.connolly@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 1:35=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Wed, Jun 12, 2024 at 10:20:17AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some PCI devices must be powered-on before they can be detected on the
> > bus. Introduce a simple framework reusing the existing PCI OF
> > infrastructure.
>
> > +/**
> > + * struct pci_pwrctl - PCI device power control context.
> > + * @dev: Address of the power controlling device.
> > + *
> > + * An object of this type must be allocated by the PCI power control d=
evice and
> > + * passed to the pwrctl subsystem to trigger a bus rescan and setup a =
device
> > + * link with the device once it's up.
> > + */
> > +struct pci_pwrctl {
> > +     struct device *dev;
> > +
> > +     /* Private: don't use. */
> > +     struct notifier_block nb;
> > +     struct device_link *link;
> > +};
>
> This is old and I should have noticed before, but we have partial
> kernel-doc for this struct:
>
>   $ find include -name \*pci\* | xargs scripts/kernel-doc -none
>   Warning: include/linux/pci-pwrctrl.h:45 struct member 'nb' not describe=
d in 'pci_pwrctrl'
>   Warning: include/linux/pci-pwrctrl.h:45 struct member 'link' not descri=
bed in 'pci_pwrctrl'
>   Warning: include/linux/pci-pwrctrl.h:45 struct member 'work' not descri=
bed in 'pci_pwrctrl'
>

I didn't want to document these as they're not part of the API.
Probably should have been "/* private: internal use only */". I will
check and send a patch.

Bart
