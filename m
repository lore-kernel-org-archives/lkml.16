Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC9D2EBDEA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948836; cv=none; b=GFm/3WrRTEb07wSnIJjN6RQgCqMtSFTQKmJU55jE/h6C6Um5QSco1AzNqvpKra0d/q/PFq8r34Pzyx8icH0ooXgc78/7p14JWA+t8qvmLho5PXiETyXsRMYzVNTpeRDY093VVXPZYNCT0u8HfeJwk2QqJ6hjSRJw/xSbRbiayRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948836; c=relaxed/simple;
	bh=AI8QyK5VbmzODrK/iLx119zZFzi6+nVsa4oz+0yWfvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4jytjjoJ2FRpQUv5dYKtYgSr0tS2KDqjB6l3Ptpv0NkDLHJ2xGFLrp1cS2R7+VHWBF73i73mFCAk4VKhLDBeHu6GHuhLwd3OIeLIMNJtN/KqE8HsspIoO97hpNOP1WS+PicGvUx1TJzD/bn4zdc+qTZ39SqCWYc9eT3Gfu9/7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RTh+bAmd; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RTh+bAmd"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234d366e5f2so15226265ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750948830; x=1751553630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktVHpVwkar6BpRFpT2c0I23iBcQUDcPsZbqMOUPU8EM=;
        b=RTh+bAmd9Rs/1F9YaSUEgoE6AZWmfWbo0A8c+Z+//hSXCBfFL0aEPu02QkIcWR8xhV
         7EF/nv2fkg5Q2LBFsEUDOf1alTswnJxUPoIHC323WrBFoKzvzMWk0K9CzlqGTcsWwIJj
         n6wIiF8jcquai5QEJid2Y4sFn1XcImLh5stdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948830; x=1751553630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktVHpVwkar6BpRFpT2c0I23iBcQUDcPsZbqMOUPU8EM=;
        b=C6hh3SjKX6SU5SQiGDij76pb2E9fDG0hX3QoJUhw7tKjOhy9OwSMY5XNgiwFvL2plH
         qcQdpBtcgY8b9ejff4EvZeqHN6bJqzANwAyZFkO5vrCefcTqqe7DF2PK2rjHoO80M/En
         nv+hxAnGgow2oV63mElNijE/oUHA30sSisw8yZJ+OM7fVdPAHCIrBhetgEYiQbaLMT7t
         PbfCnhy6bDH+TJbFBglKfhvcHnUrUYxSta/VzJJVFQXh0eJQTRhtBmawc4BxmK4Ir7Zy
         ISJq3KBW2M6tvdhJE4/7gvZtxI0jJCAb/wJyKpZQDAvOwCAKyMq/u1GVh+5KoBgPA3vi
         p/bA==
X-Forwarded-Encrypted: i=1; AJvYcCVm40NbpChs8Cs7ORVLQbHaLjZ+mJLTUCputurGEtopCA4CVTycVlE/ngBFfAasUcM6i6dJ4BTbqtfYDGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJnhhRCASGbhpqzPExHUqr/F5qnkC9znjGQnMeGRZiztU7BGOz
	zVshkZiEz0sQiMJUx0i9JDsY+grn4HENmm8Vune05U+q7vjIc2C4Lyxn9ykeuXMHhQpDeBv8pqo
	N4rmKk+k4
X-Gm-Gg: ASbGncvn8ez3l2VlRAzhJfLbXNmNDTWOBSr10eEaPZ+fQuetTNIiYZQq26pCaJU90cC
	BC2Dr2DCABLbUEdYx/oTQYoJsrIq1y9HYuT2U0hucr0Nq6wLwNvg1uHk53S/R4Zp+mYH7dqaDwa
	vzZ/F6XTei13KsMP2U+MTOlKvrdZ29c9zVubuzVmNEre4nmHlMEulCpmZttHZdSjLCZZy3/EC1Y
	8K3BaqNz0iXO3PEgigO4TpCNIM5GEcQzi51NUSNm7Vw2pYDsgRMui38iEkqZ/ibK8nOjYtAVFZC
	9lRarRTuEzy7tNL0Wldu6mikapN6gpFKY33qga5dfgYu1h0ep6zfxosE8Qjdx6+NA+7l5hIzgsZ
	OK1vD8EPP/F3qcvJ9VYeb/C/HCA==
X-Google-Smtp-Source: AGHT+IHqR1YhFPNbRzG8oLnT4mjq7svhC4i6FLFMulTftv75vhwEF7H1Js0HL5HY8FP0VxF1S2D4Lw==
X-Received: by 2002:a17:903:2292:b0:237:ed38:a5b3 with SMTP id d9443c01a7336-23823f98035mr90301855ad.8.1750948830631;
        Thu, 26 Jun 2025 07:40:30 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe312922sm140205ad.23.2025.06.26.07.40.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:40:25 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-315c1b0623cso1262668a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:40:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQ8heEfjeObvtdXRXe3aqc61wOD39NlUdpxb80yWhgaZV4HvwbEaRamWXuc43ZsgC0DqFaPQ3wlp/m6Ns=@vger.kernel.org
X-Received: by 2002:a17:90b:2c84:b0:311:e9ac:f5ce with SMTP id
 98e67ed59e1d1-315f26965camr9459965a91.21.1750948825200; Thu, 26 Jun 2025
 07:40:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620074951.32758-1-brgl@bgdev.pl> <CAD=FV=XD1bfz4e=JOscqa3pGL_Z1RBRjQdDh31yfxac9ZPX6YQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XD1bfz4e=JOscqa3pGL_Z1RBRjQdDh31yfxac9ZPX6YQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Jun 2025 07:40:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-XPij=ztJprp3O0eo3Xe80vS59+bAP_nERobEBNPXxw@mail.gmail.com>
X-Gm-Features: Ac12FXy9GKHhd2g2BMUwILWpLqK8s1l4nJf-UsGjEGsCX_D33Z1nSU4jBJCrYPI
Message-ID: <CAD=FV=V-XPij=ztJprp3O0eo3Xe80vS59+bAP_nERobEBNPXxw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: remove unnecessary GPIO line
 direction check
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 25, 2025 at 11:25=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Fri, Jun 20, 2025 at 12:50=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on inp=
ut
> > lines"), the GPIO core makes sure values cannot be set on input lines.
> > Remove the unnecessary check.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 -----
> >  1 file changed, 5 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/bridge: ti-sn65dsi86: remove unnecessary GPIO line direction chec=
k
      commit: bffc0692359f8d06d989657c00b274802a791692
