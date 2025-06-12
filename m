Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800EF522F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767503; cv=none; b=tn5nXh55bOMigQuAiyG+q8qmtvC3B2Xi4fB5UKVasMEM7J3A4xMTWcUXMDp8fDxx/FYEo1VT/Ye6Ojqp/EnV3+T4UZnxBIH5aM4nsBpQfeHeXaE2cZzWnu4Ry19piXpU6Y4gBfKHMLcJWbBAXxZ1aKtLNpAim3indxmVyMqg8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767503; c=relaxed/simple;
	bh=dwyktbvIBKH1tMyMKD5NbLWHIgpp8+A1vniQwg1gUU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dzfc1MTCkpVh5UP+IiKIZMb8CxUQX+oCwxppuZDQk2VDi6rD/aZMSiX+FJrX13ed8GqXDaOiFx/H1VZV/8qcdhrtemgbbQtpdfEwZ23Q3RKhdyD7H08kD4LgV4aE9jVAmn+cHoCMTCToXEUc7bobIBXdpItjsrR6IxZnbfjb0c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L6JHFx0l; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L6JHFx0l"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747c2cc3419so1311588b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749767500; x=1750372300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwyktbvIBKH1tMyMKD5NbLWHIgpp8+A1vniQwg1gUU0=;
        b=L6JHFx0l9TRkr1IVpdNtSRg82jML1QnIzrI5yY0OEA5YlZgQQQve9S5nM3FmXqoIqI
         Zttl/OJDgRJsRlqVJCIu1GHFDBaT8SmHuSX1RkS+Gxw9JfXUcu7SptJKrbhEAG7KqgA5
         94mk3SWqfFhsfQkOmVc6f1M+6m65EjeCDhrC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749767500; x=1750372300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwyktbvIBKH1tMyMKD5NbLWHIgpp8+A1vniQwg1gUU0=;
        b=MqPj5duzyXYZkBaSomZyqHd4Kb5YFUKZdya/mxaHe2807fwLkft/2rCiHx0pbEEjti
         I9BaUCP2U9w36Xz6xbDTeSEF1S/ZZ683zIxDL66Nk6QxlaRFryTaU/yRJtmd9w9OLmyI
         lhXsv5iMBSdY7c1RIy3f1UTX3W0xIl40yBd6RPSlJTfZhMyvX2VZvrTAdtTDABlMTQGe
         TDQCq5HN1f1Wj87OVXMxA+eXuUE+EBzvxg9sgtSliA+HuOEOy0xZiidM+ofFo6BlhAyS
         5Db8yN6oA2W094x1ytD1bzcgGYGyFxFXxlVv5r+i4h4FgZmMvSqmkn495A+dzTiKu1Wx
         2Rdg==
X-Forwarded-Encrypted: i=1; AJvYcCWBKdWuyNv3UXv/1alubu1BAWNIy2Mey31oV3nl7h5hIHAOTN3E3mi96nLzaYIOAikoD+CdYixnUgghnvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1NlsstXga+AomnRju6goB3rluBUOzcZzrGTt8UKoHcdpy8Zob
	CqBInuRJHwWpwB+ny1mdhyqDzK+8PFzlcACbOXUh7NcULjxOx4v4b4JUiRpQKMduHWACqT8PrcO
	D0j8=
X-Gm-Gg: ASbGncv3P2AKmbZWn0k7PJVrk98VNSxUScoGGBs/plQML8UPrYTqpDcLPwf3T+cVy8h
	qnocDh844fYcH+Kboyyn9zMRRtptG/Z354GkxMcnRa6gVI9LrQm49WcXH/QfwoqxZe49OLNB1LD
	1ht6j/dkHDwLRf38aIUz22OU+PMyEDteIsmhvtVgNl8m6tw1jxLkekeitYaCr33tEXYVQ7Af+L+
	JcA/N3djQ6iBgtV22lVu6RvZPPFomijzJjQesBT+wbN3AZrZpFZXOp8DGwb3qNmXOCVshJb8iPv
	ROMCdVNZVnkJENgbpJh9DUz2Ww9YAzA820vkGG6iF6/HTuOKqTlToYQp15IIL5xn+7o8Kd8lI4+
	N/kVPcFS5wOH3M1e9poUoO5Xqa85nDw==
X-Google-Smtp-Source: AGHT+IHr+ypOu5Ct9mTu1dhItrzaUhB4LkqSO1wq/R9TFc6kes5pUGp8alWbYGT3ZwLPvMy2ak9O/Q==
X-Received: by 2002:aa7:888b:0:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-7488f63d26bmr1243985b3a.10.1749767499712;
        Thu, 12 Jun 2025 15:31:39 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900074f1sm274460b3a.67.2025.06.12.15.31.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 15:31:38 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234bfe37cccso19919125ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:31:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUS2S/Tt2928HEI5y7ZWLCXNM5c+RkA1enjdg+WlHNCiCnQT2qt3KDk1AWzO9ZKW0BzPyoxrkXMyPn474=@vger.kernel.org
X-Received: by 2002:a17:902:7897:b0:235:f45f:ed2b with SMTP id
 d9443c01a7336-2365d8899b5mr7590235ad.1.1749767497346; Thu, 12 Jun 2025
 15:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528132148.1087890-1-mwalle@kernel.org> <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
 <9272e36e-e764-4007-9d9e-8e09b9c08d34@ti.com> <c0027ff0e63bcc0fd21aab37af991baf@kernel.org>
 <affbef6e-f253-4dbb-bf64-3cc7d244acbb@ti.com> <CAD=FV=W8RNcZvg5zgL1wDRmaH_eXrc79YQsMr9Be5HVtOWwwcw@mail.gmail.com>
In-Reply-To: <CAD=FV=W8RNcZvg5zgL1wDRmaH_eXrc79YQsMr9Be5HVtOWwwcw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Jun 2025 15:31:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTjEVfNtAOww1=UXbAknXNzWd0fcB5UMBEJrO2gt_hvg@mail.gmail.com>
X-Gm-Features: AX0GCFvUyoDVZ-yfWfDuQVyUKmfjzsNqfasYr_Z32aszeEmyUIEU-2Jt1vX3uuU
Message-ID: <CAD=FV=XTjEVfNtAOww1=UXbAknXNzWd0fcB5UMBEJrO2gt_hvg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
To: Jayesh Choudhary <j-choudhary@ti.com>, Lucas Stach <dev@lynxeye.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 12, 2025 at 10:52=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Thu, Jun 12, 2025 at 12:35=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti=
.com> wrote:
> >
> > >> If refclk is described in devicetree node, then I see that
> > >> the driver modifies it in every resume call based solely on the
> > >> clock value in dts.
> > >
> > > Exactly. But that is racy with what the chip itself is doing. I.e.
> > > if you don't have that usleep() above, the chip will win the race
> > > and the refclk frequency setting will be set according to the
> > > external GPIOs (which is poorly described in the datasheet, btw),
> > > regardless what the linux driver is setting (because that I2C write
> > > happens too early).
> >
> > I am a little confused here.
> > Won't it be opposite?
> > If we have this delay here, GPIO will stabilize and set the register
> > accordingly?
> >
> > In the driver, I came across the case when we do not have refclk.
> > (My platform does have a refclk, I am just removing the property from
> > the dts node to check the affect of GPIO[3:1] in question because clock
> > is not a required property for the bridge as per the bindings)
> >
> > In the ti_sn65dsi86_probe(), before we read SN_DEVICE_ID_REGS,
> > when we go to resume(), we do not do enable_comms() that calls
> > ti_sn_bridge_set_refclk_freq() to set SN_DPPLL_SRC_REG.
> > I see that register read for SN_DEVICE_ID_REGS fails in that case.
> >
> > Adding this delay fixes that issue. This made me think that we need
> > the delay for GPIO to stabilize and set the refclk.
>
> FWIW, it's been on my plate for a while to delete the "no refclk"
> support. The chip is really hard to use properly without a refclk and
> I'm not at all convinced that the current code actually works properly
> without a refclk. I'm not aware of any current hardware working this
> way. I know we had some very early prototype hardware ages ago that
> tried it and we got it limping along at one point, but the driver
> looked _very_ different then. I believe someone on the lists once
> mentioned trying to do something without a refclk and it didn't work
> and I strongly encouraged them to add a refclk.

Actually, I may have to eat my words here. I double-checked the dts
and I see there's at least two mainline users
("meson-g12b-bananapi-cm4-mnt-reform2.dts" and
"/imx8mq-mnt-reform2.dts") that don't seem to be specifying a `refclk`
to `ti,sn65dsi86`.

Neil / Lucas: is that correct? ...and it actually works?

-Doug
