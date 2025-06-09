Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06431C54AA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483810; cv=none; b=N5zGDr/0PqqvtpyHbgY+Y2xX27Ipm0EUMnEf7Vgxo2U2452dSWF51DvyA4Kj4PEpLk7L/SSXYSdoQms0ssHKRv2NXt++4B7YJaPbGsQnnghU32U0aW93UKwOArgLmD7S3/M6u6hqv+tqnGFqMivwblWJo6dgHHJIUDcBBC4aG40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483810; c=relaxed/simple;
	bh=MF8URYVd6paFLRNZA/wbEoqFzCWsn4Uq07b2eMDDSJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Raybhx2sQfJvE6j23lGMGDC958L5+X/PkDYHI/DdhEuQHv9xlskXuMLpFFYzQJFf1YnnEJmKp/DQrOa1+W00mNDrMSl36sUBFyvEOxbmPCxmbxncGC8LX1zsBhrtnogspC1gI06K7rgA4GWNx9wGho0VlbZjYy9wumT3yh2fMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nBIRYmaJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nBIRYmaJ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2352400344aso37891995ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749483808; x=1750088608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=nBIRYmaJ5Wz2TJG1DapSyBDzy35UzS6K7dMSKQnl7Knn05Bryk5ScGCvqg6T4fA9y/
         isY7VkyMvoQ9mlxRNHAuIb6EwnsC6JEY8OoNtWzMAHp5lEWbI/iUjD7Frr+fQVMmWiDP
         to2gNy9K4p7wpkgKjGUdUStL1UVdPLamtfARM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483808; x=1750088608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=dKCNjAlMkWhD5XEALgKAKgznQxB5gHdoggdhYW1Bo6zfGyhvDEWdQdETkxxk68dTCz
         Jokes6HLkqNhRCyPJpXDA+Y7WYcc+QisGm2PjXEdFfwHIMSl0IdFD6GqceM/kBr4CySZ
         em71iz5+kRH8veg8h78909f7vePAIaAYDQSI1+pCi28eIEULhi9tHYYt4GwWFD6xOJ8g
         YrYVszh8F4tmk5+lfNS3m+6+ZbRM5NUPysKwLk9Hn9H7xpQt3y0ey7/RL1hJ+B+2IVY1
         JCZ5GFPcD1YJYAZRXeaaN2XiLHpGNiycU+CHeMnrwm+yQDthvUQqS8C+UHXS9Ewnilqu
         2Vpg==
X-Forwarded-Encrypted: i=1; AJvYcCWrAECwmyjENi5Jtan+a6yOrgylH1fyxVWkDiN1M7cMkdmTcjBLdTZ7rvmmOJ8U0VqeAYG2dM7ixcogPwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxsXiuGKJH3GM0sz+BQ34swVFiXyfEAZiH0C5GebHJlnMuRIZR
	andttRGMNmylWQPf22P+l3QSKPGPdgPl7WKe4DWqxE56tPnyd9+zyGt4VZVLKPjY6RIs7KzSWCD
	WlEQ=
X-Gm-Gg: ASbGncu0sHNP7ETQ05awB/BEh7yA1V7oHReqTQm2dL4ofKILFkjx1YQa5Krt2F4S8mB
	/mR6dyS7PYlh+zNipjAfAA4U5uE9GHZL5X1Xa3Ik/JixCVWP/lVZ32lTp2Vlq2e8lSHP0j0xoYr
	RT37rIlxbRGHynx5RWrEJ3zzlWBgp/Kdqv5MNi6+tBoXZYup6p2/myyh6tNQVN7BuIWPnq3zLkJ
	IKO7Wyqf/AMzIHzOdnnYFNsDpsQxPyggI5eG6Ck2JsExtbtASQy5D+zNHzpHjAoFmtoxfLHriGt
	cbmVec6CxLVh95vzNwyPLNk1M0RAGvVGu7bN7UJE6oZXy8KTC7n7BfGB5R6H3/imP8SaY3MrR0+
	nYzAvz1BIc8cW6Mk=
X-Google-Smtp-Source: AGHT+IGjT/126PP9O1JzU5gDAPU1Co9kQqjVFa56F0vNSGonGNTGUMNbN4gaSlk5lJiGEciBXRkPMw==
X-Received: by 2002:a17:903:40cb:b0:234:a139:11ee with SMTP id d9443c01a7336-23601d74a5amr189159845ad.37.1749483808006;
        Mon, 09 Jun 2025 08:43:28 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034059besm55907185ad.174.2025.06.09.08.43.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so3521865a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpyVpcG1hG8mJA1+Wuh9l76GxJY2cakjOvHbiBS0GQSM/6/3i+CwX38LedmwsYAuyDlF4eEEDmMMp8Y+o=@vger.kernel.org
X-Received: by 2002:a17:90b:4c4e:b0:313:27e5:7ff1 with SMTP id
 98e67ed59e1d1-313472d3204mr17932741a91.1.1749483806734; Mon, 09 Jun 2025
 08:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com> <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 08:43:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
X-Gm-Features: AX0GCFvkFbIIK7ULGaQhmTqdCQ0r1uM5Yw-QxUNG98qVpJtj4RBGOmfISaSOf8g
Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:
>
> > Hi,
> >
> > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibr=
e.com> wrote:
> >>
> >> The auxiliary device creation of this driver is simple enough to
> >> use the available auxiliary device creation helper.
> >>
> >> Use it and remove some boilerplate code.
> >>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++---------------------=
---------
> >>  1 file changed, 7 insertions(+), 42 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll snooze this for a bunch of weeks and check back to see if this
> > can be landed in drm-misc-next every once in a while. If you notice
> > that drm-misc-next has the necessary patches before I do then feel
> > free to poke me and I'll commit it.
>
> Hi Doug,
>
> FYI, this is safe to take with v6.16-rc1.
> Please let know in case you prefer a resend.

Thanks for the reminder. Unfortunately, I still need to wait. This
patch will need to land through drm-misc-next and that doesn't have
v6.16-rc1 yet.

https://cgit.freedesktop.org/drm/drm-misc/

...presumably v6.16-rc1 will get merged in before too much longer.
I'll try to keep an eye on it.

-Doug
