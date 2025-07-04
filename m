Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9B133E1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 03:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751600375; cv=none; b=ls2nRgpJiiKTn9meS/Ox/1xDJJKam+Xl4lqaU3FWnyvba9jJXUdrq6xcHYJw8Dqsvc3dOd72oC7YK65G6O3edaHYUHXYut2OSOwh4egxlPNulBX//i4eKI6Mr/Bz+uPsdqpkhp61qdD/0lYQdZk+/vVmbEArM0U4jQRs8bguC3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751600375; c=relaxed/simple;
	bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyePeA7M5gdf6vlqdUuK54WE7zcCKKCqpMkY24Bv8YkOXkeWj1NmuUyI+/euIFeM0SUw6uFoDWQ0mQ0qCRF9CevlMCP7oJ62EikX5o7nSmjQP1xVPGIX3V5TMUVXVVYC6XpO03PblniUgUnZteauzCaBDNonAhFplCxsB4D1tH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OLuVguGL; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OLuVguGL"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70f94fe1e40so18991967b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 20:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751600372; x=1752205172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=OLuVguGLapU1DVOBXQr9TBFMHhyCcKPUQgw3gVNYXZZwmf1ze0ywI4wVFzzcEKA/5G
         M+nNeJbTY2CaeiFKXBTiGvtf2XdTOmx/FWz5zZZiTZeHt5TFiceJiVebT8HCilKamrJ6
         Oec30N+6wTY9iZucF63UK1VorYhFPa2ytYzp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751600372; x=1752205172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=gFAaAKLseO0uoqRSi9+Akv08iyh36eGz2D+83YMDkOxeyy3KUlYSJ4Aaw+7EJjgFvS
         rt+X1WCiYBOSV+7d/JaOjcBEP8TMDbEBHljoWzPHuBBnvSRfrBjjkbMP7aNJnECqm4ph
         wwqSAcxXvHwhjcqP0R5hjDcfvrKDe5BJgC43DDjOiB/QfID67H6f+7L989aiM9KrNjEL
         51SiDUIVnaTRn7PHE/QtLWzD/+QbL4yzOncAVbKqg7hNSodjMK+GAIEMAwCFnoCrs0Hs
         OxKz/oQzjkr49HyyiOsOtBMuCAG2VQfISLUvO9Ix1WHuGiZanj1N55JLvLnky/sbh04C
         J8Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWCKPBQkC8NIjKvZ7OlHpyGO3ELTjRoDYPxVLBDW/XohkTdABwKsGCW2syHX533SOVm5AmLffRsAE+2uis=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp1wTnQcBCcUVK7BtiWeemx8c7LKAK5MiEoHdJ0ImJziuRxc73
	Tj8ltwDwyzYZyPO6cmnEMqWg6dSn/WyxJxlP0eOaGBPskdwusBA6ScGJEzZtzctcIec+S2AX4bD
	XsBmaHdzzqcoznXoDI3nng38IkUX7nkxru3HlXDkH
X-Gm-Gg: ASbGncsKITyjblXxgxspKa7b1RTjVihizI/n/qlEqIY92EzfPkFM5h8LpBPTGK+ylr2
	ETp18+KqEnoHnqj29BIxRN+ZqM0sCsgIrf6EJvVr1Ts/zoWqjWRorl7CSKInm9YURI/QqqGK1mo
	9wxV8h/RUCqfpEJBtd2ELccYiGeuKL43fD8CQT+0E5BJXZ
X-Google-Smtp-Source: AGHT+IEpv4/ABsyEPWBaSbnhDaxcTMMoASH0qOMAb1EUBzfvoB9Rs9KL0TsrqeATirMWAbb6GqIiVFu78+U/gU30DoM=
X-Received: by 2002:a05:690c:46c5:b0:712:cc11:aff with SMTP id
 00721157ae682-716672d3d02mr24980587b3.11.1751600372350; Thu, 03 Jul 2025
 20:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703183523.2075276-1-robh@kernel.org> <aGdAmGGPDA71rDE3@google.com>
In-Reply-To: <aGdAmGGPDA71rDE3@google.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 4 Jul 2025 11:39:05 +0800
X-Gm-Features: Ac12FXx1clDJs40GrPtAnmhl7h9XO9sxxgXTs_ThD6wPGcXtPD9F4XTO-6ZiN-s
Message-ID: <CAFv8NwJcwD0wqJAoe99M+dQYA383n0g9U+5+Z77uuQ2d=Ac5pA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:46=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jul 03, 2025 at 01:35:21PM -0500, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() function to
> > handle "memory-region" properties.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks for the patch!

Reviewed-by: Cheng-Yi Chiang <cychiang@chromium.org>
