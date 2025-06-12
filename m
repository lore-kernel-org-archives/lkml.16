Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F6217AE1D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749750763; cv=none; b=LLcalrdEcQxu7HwScMWixVOCmm3VVzJiNs78MshXS18eAyGSiBAjNGe0VQqkRQOv1yvqF75uf8c+S+QXvk+NAZ69Qf56wfSf+i6BgKAZLXrl7HlO4lTja2f1cmbpzjnvXL8P3jbj+sE8K+Xd2w6qb2lBJfofIOsWpb5O/En8cY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749750763; c=relaxed/simple;
	bh=clnvPnA+08sAa8soPFxCY8o8wyfr/+hfTXH3Dbn55uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6MHsOCUcPJruprN3FVmm1kbbhOZeYF6eG+bBAs60+d5eFQOWDtEEGVKD93gVFGvaZxaxBOgThBjTtwBm4DAIlJKeidekKJ6MbD7ryxFLjR6ztVO44/+YYMoIGjj3qQcA09DXUTmlL2McLp+QosIhzOF8PAT7Guy3dOIL6M183o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KxofcJPI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KxofcJPI"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-236470b2dceso12825335ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749750756; x=1750355556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clnvPnA+08sAa8soPFxCY8o8wyfr/+hfTXH3Dbn55uQ=;
        b=KxofcJPIquOMEohcnbSi81w63VHwtpl61/bRg4MY9YiJpSOvAf99qQlWLhtsPwoqOT
         CEqaP6YLhJCPMHfxfh1fch1y/WLDL2eMS2sPtRT9FtN+skdXdGCjDKmgLV79vEunflqO
         cnDRIjnjw52YATFD9bdCXgwYrwj7sSxhu+izQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749750756; x=1750355556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clnvPnA+08sAa8soPFxCY8o8wyfr/+hfTXH3Dbn55uQ=;
        b=aQmHdwp9R1XwecPIy913+E9L24jJyfQvIMphagFkI5ihi9knM+SQQrUAfSATACy4EG
         59PUMohTmdA7mmMKEsoXX60m5EGfIs+8ruX8Y3upQAc9PEwi9GSaXMZ5EThagPmpKkJm
         Zy7h3+B8kcV1188qFQoTHKRxM6XfFC797+r+qX9JbcIJqEv9MCxY89jBH20eD9dvvXTT
         +DNhxViVQ0oSuom0VoZ48iw5Ui7NxvsLJ3hJd+BuBWIr6an2a4RtzRZCTWytI+7VMhGN
         leA6XogrIC3C5CD1DXpUt5Fku37b4JTGS3XbU2FJTNgYl1ngbslPNzbqZpRh98ddAA3R
         wtoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpcUdUR+WwGXvbK/DQdlmo+DtYAL+YVcqrVDbBs7lKW1bPj2/2cuHj8YNjA64fw3SVeCxicLFy0Gk2MnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSVzuCKOTLN1ctEpuk6gGS4p6S4fK4PoC9mY0a4D36p9xfhAWm
	UVmTFUNPVUiVnEFExTnseGEDV3G/Q4G7JVgif5QcCGczujAaR4FLpSUGIDB7dCPHNGGBf0wpBEa
	H1EI=
X-Gm-Gg: ASbGncsOedZ9VBKOzZRTB43I24afdmkyUqtiQz5Xx+rEarjFXLcmMD8jd0/n18VHgVb
	6wMA883w7RCCalEPmyfQwDdv8QbchJpE1QMNQjqoj4cIr7dPR6YjCOsTjQZFzeo5Y/XIWrO0o+9
	U+6tpKjo/96qb/hiQOM/JS8hZvBMhqkNaC3B1GiiicIrjl7J84W24/SJ00OJuTsPNLSeZrusP+w
	wbFst6LuYwiWVdXeybo6S7DMHUXQxfLhu8/Ch9+mEdy1S4UkXi61TUtqD7hgwAW+SejJ56Z98DP
	ukC8s+x1qne6tVds13czcGG8R1uCWLzAlSQ/kNNsSbnWFtF6cqNk80GvGOfe4VfzogKL4MAQAF/
	M/16INZG03ATuTWLD4LDgpX9DMQ==
X-Google-Smtp-Source: AGHT+IGA5LBbhGsKdkeGKg4zLDVr/N4W4NhGz2bw/D7utFmCgjcxsfOxcT9HxGQCdhs0rC/KVrHo/w==
X-Received: by 2002:a17:903:2b07:b0:234:c549:d9f1 with SMTP id d9443c01a7336-2365c5f3154mr5155865ad.47.1749750756280;
        Thu, 12 Jun 2025 10:52:36 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d439sm17314475ad.75.2025.06.12.10.52.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 10:52:34 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3122a63201bso1284269a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7ciA4NB0IZjVuVdTFNHHeZmxYtLkrpgiiJV8KrImTVj4aMbNKKBfeybCYUjkSkofVd+3Exce3RhZetJw=@vger.kernel.org
X-Received: by 2002:a17:90b:4cca:b0:312:1d2d:18e1 with SMTP id
 98e67ed59e1d1-313d9eaec5cmr99658a91.22.1749750753525; Thu, 12 Jun 2025
 10:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528132148.1087890-1-mwalle@kernel.org> <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
 <9272e36e-e764-4007-9d9e-8e09b9c08d34@ti.com> <c0027ff0e63bcc0fd21aab37af991baf@kernel.org>
 <affbef6e-f253-4dbb-bf64-3cc7d244acbb@ti.com>
In-Reply-To: <affbef6e-f253-4dbb-bf64-3cc7d244acbb@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Jun 2025 10:52:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W8RNcZvg5zgL1wDRmaH_eXrc79YQsMr9Be5HVtOWwwcw@mail.gmail.com>
X-Gm-Features: AX0GCFtU6lZ0xHaIRefuKnlMqTPtRQEV5sBzejA1hcWYrlDz4Mnrn_vwiO-dslY
Message-ID: <CAD=FV=W8RNcZvg5zgL1wDRmaH_eXrc79YQsMr9Be5HVtOWwwcw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: Michael Walle <mwalle@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 12, 2025 at 12:35=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.c=
om> wrote:
>
> >> If refclk is described in devicetree node, then I see that
> >> the driver modifies it in every resume call based solely on the
> >> clock value in dts.
> >
> > Exactly. But that is racy with what the chip itself is doing. I.e.
> > if you don't have that usleep() above, the chip will win the race
> > and the refclk frequency setting will be set according to the
> > external GPIOs (which is poorly described in the datasheet, btw),
> > regardless what the linux driver is setting (because that I2C write
> > happens too early).
>
> I am a little confused here.
> Won't it be opposite?
> If we have this delay here, GPIO will stabilize and set the register
> accordingly?
>
> In the driver, I came across the case when we do not have refclk.
> (My platform does have a refclk, I am just removing the property from
> the dts node to check the affect of GPIO[3:1] in question because clock
> is not a required property for the bridge as per the bindings)
>
> In the ti_sn65dsi86_probe(), before we read SN_DEVICE_ID_REGS,
> when we go to resume(), we do not do enable_comms() that calls
> ti_sn_bridge_set_refclk_freq() to set SN_DPPLL_SRC_REG.
> I see that register read for SN_DEVICE_ID_REGS fails in that case.
>
> Adding this delay fixes that issue. This made me think that we need
> the delay for GPIO to stabilize and set the refclk.

FWIW, it's been on my plate for a while to delete the "no refclk"
support. The chip is really hard to use properly without a refclk and
I'm not at all convinced that the current code actually works properly
without a refclk. I'm not aware of any current hardware working this
way. I know we had some very early prototype hardware ages ago that
tried it and we got it limping along at one point, but the driver
looked _very_ different then. I believe someone on the lists once
mentioned trying to do something without a refclk and it didn't work
and I strongly encouraged them to add a refclk.

-Doug
