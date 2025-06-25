Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7F0267714
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863166; cv=none; b=MFREqy0zAsCXdH3X7WDjQDAb+KbqgXasZu4nK1/wa81nvS5D7NDE3o0Da2Up+Bq++QRgtaZQWxcldjmdT/z8x9m8kLJ5GI+u7ChnjWIphcpUDA5JyPqRaJpFZrYIEGWQGT6jcKcKZHKM0DhtivyiAcskY8oyEz2TiiLbRJjr/lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863166; c=relaxed/simple;
	bh=35ZMHiH7DNk2k/G+PG9VoiO+fZW7rVcSZEt1VjYwWxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MlWzX0klvJiKPMW1NNnLCxpe8Pl5OAPeFpBt9Ke6KHU3qfV1O/GpZ5dvBnpItFsPETO360SodVDgrMyw7SIBfzUh/s4P6oCcDq+ESU2pPJfI+6e0rCUOfiACXxzBwARYGYEyKiOWWGvdMfzeXIhFtfNETyfTt4cNL2DD+HI7zn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EcrFOEmZ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EcrFOEmZ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3220c39cffso3665591a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750863161; x=1751467961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4Xs6XJwBk5ATm+AWbM8XBAqiRwBbqTDrt/zohXQm4Y=;
        b=EcrFOEmZNkjIwV4XtSfbp1Z09TOeS8KWIFYwKCXiv9kz7+4PfRMGI74krxzBqVgcGQ
         yzUEp1xhh6hHr7CCoH8yz7YRPkAvMLyJM/AOP5jw1Eg21K0Hs9O4/Lish7B/QnMidUqU
         uVEnRFDRvCLEbjO/PXBEUzp50mrlXXyDfeJkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863161; x=1751467961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4Xs6XJwBk5ATm+AWbM8XBAqiRwBbqTDrt/zohXQm4Y=;
        b=OlDTR6CbJ0Vk+rlZF8+mjZv8zLCnlNnGthS1ZJDGjOcfuqgEcUyugxIVp68Co1e8Bg
         FE+ZkdWnyv7b8eeo10j+HszHHJ3hvjDY8Wp4BWA3Tw1/iYG6vIAnXwQLtPoejRpVP7Vd
         FoOM2PXjYCGF7x6pp07zspRRJZpIBdLHMzqUlBbVHOodzW9f2xy67GZn7c9eQdumEcOM
         Io1FiHO2NHsEDfRcSWAGqphPf16Yz51bS/D4mWb3bmCo0pDygfXNijvjG9nasdp+I22N
         8kbHoGdY0/f2qfE6G9t2vU+Ycs3SFt0egj+x3QbqgjpXE88zz7sQTohYnLqfro4MwIRW
         CrtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7xIXSh0e6JRGht8YL+bLxmCRwNBgudgXNERkqFjrpzn0PIe/prZ6i/D+ABcmpK200pnEnUqo3QYh2PYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ6kKfw9y/fbXzOngcVEr5QpgXkMjoSctVzUGRYO6EBpoJkBZA
	1iHv0iqorTBL2RYFUBI0UTuU+QZ65m0p1xwPENfjroziiZ4LjWC+g3yky6mznp+JSVjg52qEr4Q
	bcdA=
X-Gm-Gg: ASbGncutbH9v+Tq+GihkYgzGhkJ8ngcsF903YpsjLsDAEjuGR4eQrDVoPwd19R3EnPa
	8fBdCtHXG6kY6jioBc8X0xBBxRMW7BT1n2NQjWbtq/dBI9ZjGVof4gf3UyN/slyqTaE4Yi7+K2n
	tu5ouv0yQ7+2k5KmUuBb2dFCjBMS7MGLPt3zNvWSn72me6btRhCIOTI41mHvO+3jkG7fpincRTy
	hV8gHxWGvPBIrZ3UNk/tUIoH1WNhFxAR4StgtqkKcMUqCO65nIDI84qd4oTqRsILw26H7KbvhXW
	eBmjDcBJRq078WU4jYIOzfHRWDuYx4nJK0h0OWeejJsN1PseGVJRfl41IAxYvgJqVxXj3BO02YQ
	dMzEnznSFTAUILTdhdugUU9FN/w==
X-Google-Smtp-Source: AGHT+IEc1GjRNP+k0We9uf8OtGPlA0cxPpD0C164sPaYR0F4Ka/W5xvuvyIf0VdyMlgS6mrIoEEp0w==
X-Received: by 2002:a05:6a20:7350:b0:1f5:8f7f:8f19 with SMTP id adf61e73a8af0-2207f1d7e4bmr4885294637.10.1750863160954;
        Wed, 25 Jun 2025 07:52:40 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119e820sm12808515a12.23.2025.06.25.07.52.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:52:39 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-315c1b0623cso3931351a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:52:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdTb/GsUS4I7FSWlD+zi56i/QZRkeKgdvDLRxocJ9KzbCK6cLl6dLo+kgnZsjPad4aOE/HRa1Nmr1Hxfo=@vger.kernel.org
X-Received: by 2002:a17:90b:2642:b0:311:ffe8:20e2 with SMTP id
 98e67ed59e1d1-315f25edc7fmr4807961a91.4.1750863158142; Wed, 25 Jun 2025
 07:52:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624044835.165708-1-j-choudhary@ti.com> <CAD=FV=WgLCwZ5De1B0Cs6MS7310xRa45po_LW7065W2bPNT3Xg@mail.gmail.com>
In-Reply-To: <CAD=FV=WgLCwZ5De1B0Cs6MS7310xRa45po_LW7065W2bPNT3Xg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 Jun 2025 07:52:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UiTh+HUoxWEmn8r-9wJtJqN0cnnZ_fKYZCt20NHGrZAQ@mail.gmail.com>
X-Gm-Features: AX0GCFvcMR3By960fl02ujgav6xL6OJUNQ0SybHdAVpYoRiy5TvUdEPb4K8kB9s
Message-ID: <CAD=FV=UiTh+HUoxWEmn8r-9wJtJqN0cnnZ_fKYZCt20NHGrZAQ@mail.gmail.com>
Subject: Re: [PATCH v6] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	devarsht@ti.com, tomi.valkeinen@ideasonboard.com, 
	kieran.bingham+renesas@ideasonboard.com, ernest.vanhoecke@toradex.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com, geert@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 24, 2025 at 1:59=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Jun 23, 2025 at 9:48=E2=80=AFPM Jayesh Choudhary <j-choudhary@ti.=
com> wrote:
> >
> > By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> > added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enab=
le
> > call which was moved to other function calls subsequently.
> > Later on, commit "c312b0df3b13" added detect utility for DP mode. But w=
ith
> > HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounc=
ed
> > state always return 1 (always connected state).
> >
> > Set HPD_DISABLE bit conditionally based on display sink's connector typ=
e.
> > Since the HPD_STATE is reflected correctly only after waiting for debou=
nce
> > time (~100-400ms) and adding this delay in detect() is not feasible
> > owing to the performace impact (glitches and frame drop), remove runtim=
e
> > calls in detect() and add hpd_enable()/disable() bridge hooks with runt=
ime
> > calls, to detect hpd properly without any delay.
> >
> > [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
> >
> > Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connec=
tor operations for DP")
> > Cc: Max Krummenacher <max.krummenacher@toradex.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > ---
> >
> > Changelog v5->v6:
> > - Drop pm_runtime_mark_last_busy()
> > - Pick up tags
> >
> > v5 patch link:
> > <https://lore.kernel.org/all/20250616093240.499094-1-j-choudhary@ti.com=
/>
> >
> > Changelog v4->v5:
> > - Make suspend asynchronous in hpd_disable()
> > - Update HPD_DISABLE in probe function to address the case for when
> >   comms are already enabled. Comments taken verbatim from [2]
> > - Update comments
> >
> > v4 patch link:
> > <https://lore.kernel.org/all/20250611052947.5776-1-j-choudhary@ti.com/>
> >
> > Changelog v3->v4:
> > - Remove "no-hpd" support due to backward compatibility issues
> > - Change the conditional from "no-hpd" back to connector type
> >   but still address [1]
> >
> > v3 patch link:
> > <https://lore.kernel.org/all/20250529110418.481756-1-j-choudhary@ti.com=
/>
> >
> > Changelog v2->v3:
> > - Change conditional based on no-hpd property to address [1]
> > - Remove runtime calls in detect() with appropriate comments
> > - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
> >
> > v2 patch link:
> > <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com=
/>
> >
> > Changelog v1->v2:
> > - Drop additional property in bindings and use conditional.
> > - Instead of register read for HPD state, use dpcd read which returns 0
> >   for success and error codes for no connection
> > - Add relevant history for the required change in commit message
> > - Drop RFC subject-prefix in v2
> > - Add "Cc:" tag
> >
> > v1 patch link:
> > <https://lore.kernel.org/all/20250424105432.255309-1-j-choudhary@ti.com=
/>
> >
> > [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43roke=
gvul7fk266lys@5h2euthpk7vq/>
> > [2]: <https://lore.kernel.org/all/CAD=3DFV=3DWvH73d78De3PrbiG7b6OaS_Bys=
GtxQ=3DmJTj4z-h0LYWA@mail.gmail.com/>
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 69 +++++++++++++++++++++++----
> >  1 file changed, 60 insertions(+), 9 deletions(-)
>
> I'll plan to push this to drm-misc-fixes tomorrow morning unless there
> are any objections or requests for me to wait.

Pushed to drm-misc-fixes:

[1/1] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type
      commit: 55e8ff842051b1150461d7595d8f1d033c69d66b
