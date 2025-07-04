Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B05230D14
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751627770; cv=none; b=CdVGWMxpGd58LwGyfcwt17TnPbEmYk8WZbFzV9k+LaAXGaEoQP3Lcm/L21bjue9bCeQQoT9P9rhps8EuM1XKFWCa/cZ/Ocv1c339Vgd6NMe/KlrGjmKIB31SYm6MS5RfDuTigIEJNmxAlEspD0BwhKxbrNxihaHsq01VQaolca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751627770; c=relaxed/simple;
	bh=b9rtoKDrBAYC3BaF1M9Ck1YA+omLHf3ebvKNPvZnx2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jaa5slROf7KDSz1OqQbNPjnu8Ey8R2VG+YF5x1fDmkERDLy/cViTr8mEOvfMC4kjEYJxiPpDjbLhJG9JgCrkn6x4UDakkAdlu2JwHXgz90rBDY1zsmwy84BBGZrKjuIKkF3vko0nLvuimjQyx9LwKb9VMsYkVADDGekPAFfjdfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tQyS3S4B; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tQyS3S4B"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e85e06a7f63so700131276.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 04:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751627767; x=1752232567; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PjpGYVa/Cr3/NCJD8CT9IY6HzXhXvTQMbsQZwOON6l4=;
        b=tQyS3S4B2wbGP1Dqsu7JNrBtVdj91LQh2w8veoQ7h0MrGDi1p7vqMTB2KnEfYSxOYT
         nCeOIdg0bzfoUS9fknPL6U/uxlkZoBZmwNkMV4zBDt1GmAfbMkwVeKutU2q2RNlrQDpR
         6prf8vynMeEeFXAOcHn0YsENBARqw9mHcSL6Sq/8ElrEo3wIGrX7fqJWQ1wie3U8xryT
         7IezF6IwbQ86ZUR+nRM3Q2oweyf2+uWHTZWLmUmL7uDSz65WecELfxdVUzs3c92fAZIL
         AGmaOLE0mGwpaUqqqNHdyNAHU9oKyisiMgEfGXhUHqOvRVJrQrtdTvhr+8krET00XqJ5
         CoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751627767; x=1752232567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjpGYVa/Cr3/NCJD8CT9IY6HzXhXvTQMbsQZwOON6l4=;
        b=qzh0kUG9nmewLUFv+gLpe95aQB/f44SlYdWekyG9HJw3/xiN/l4FbScXH+FlILsMZL
         7YucOsFPj47iKMnEXSn4lvONE+KUt9UCLCP5GWK1wBgBO0GVWvkZgk2HYoObg+2oSmgH
         RBtoGGlGgE/CpyBU+drosziY1nhvn9vCMKpLmt5fEdEdJDxlIJdtq2XLq7P38fm+4tgm
         j4Jib3/dHkuVNTgjHzQUkEjANmzPKbreI16izIRSYbfMWQCVQyPBL/jHIqJSi6Zbu1aV
         K/BsTl72p2r2sW0M3LmgACQbDVVy4gIm2jiATz4fTY/WSWu910ecCWpHPiy53U3PO7vf
         5vvw==
X-Forwarded-Encrypted: i=1; AJvYcCXu5r1Ugj21m3i6yLxOpPyYF49sizkXTaSRTEFcDpLUFHFMOkZ0WQJp2j3ENs+TVVY6WG5eK4b2/DYSoXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU+Z8Lsb4x1nqYPjBTE+tS/WT3xIqyOB31gYSnVRP31bOJeDZj
	HWrtim/gPTV7p5NDGbjesdyK+SPqv44KIf4QkfIes8qRTtCbvLUcArLCeXGY75C/n8B6Pk1/0Ux
	swR8b0mGAZbbDqHWphoaX6z2bx8lkzHzQcFQzZvv5uA==
X-Gm-Gg: ASbGnctn4I5KJs3WnmJgs6ARc0LivPj1ZTjinBb9qZwPMIC7j0tFngr4UWj6hsbVOTu
	O0/3MHXQ5OGnqaLB9heENbW7DvU7CVpYf8wSY7Uibr6B2J/ORJM48ZjhawMkHvLl8wD+S0ZrSL1
	MhE6wpe435WAhyOiJhgFzZvnJpmplOO0/wP/X/fGk2AmwE
X-Google-Smtp-Source: AGHT+IHAW8UyCQ9W+pvHvcTvef9aFULLZGbhQe98R4X9+6EEdiQxhHHKyUMUuOYP0+BDeQPC3PK4UvgN4CdOsI4nxiQ=
X-Received: by 2002:a05:690c:9c09:b0:70f:9fcd:2075 with SMTP id
 00721157ae682-71668c0e0ddmr26398687b3.3.1751627767124; Fri, 04 Jul 2025
 04:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Jul 2025 13:15:31 +0200
X-Gm-Features: Ac12FXwfheYVCqCiLAFVR27m9ptp6dfE-AwljIFg4O16ch_FdabejHZIDOFh5ww
Message-ID: <CAPDyKFoznqfdX7Dvu3VPa5Me10VHGphnRRHrU17w-fie7HrQ5g@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] PM: domains: Detach on device_unbind_cleanup()
To: Claudiu <claudiu.beznea@tuxon.dev>, rafael@kernel.org
Cc: linux@armlinux.org.uk, gregkh@linuxfoundation.org, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	dakr@kernel.org, len.brown@intel.com, pavel@kernel.org, andersson@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	wsa+renesas@sang-engineering.com, mathieu.poirier@linaro.org, 
	vkoul@kernel.org, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev, broonie@kernel.org, robh@kernel.org, 
	jirislaby@kernel.org, saravanak@google.com, jic23@kernel.org, 
	dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, bhelgaas@google.com, geert@linux-m68k.org, 
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	fabrizio.castro.jz@renesas.com, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 13:27, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Hi,
>
> Series drops the dev_pm_domain_detach() from platform bus remove and
> adds it in device_unbind_cleanup() to avoid runtime resumming the device
> after it was detached from its PM domain.
>
> Please provide your feedback.
>
> Thank you,
> Claudiu
>
> Changes in v5:
> - added PD_FLAG_ATTACH_POWER_ON, PD_FLAG_DETACH_POWER_OFF;
>   due to this a new patch was introduced
>   "PM: domains: Add flags to specify power on attach/detach"
>
> Changes in v4:
> - added a flag in dev_pm_info that is saved in dev_pm_domain_attach()
>   and used in device_unbind_cleanup()
>
> Changes in v3:
> - add devm_pm_domain_attach()
>
> Changes in v2:
> - dropped the devres group open/close approach and use
>   devm_pm_domain_attach()
> - adjusted patch description to reflect the new approach
>
>
> Claudiu Beznea (3):
>   PM: domains: Add flags to specify power on attach/detach
>   PM: domains: Detach on device_unbind_cleanup()
>   driver core: platform: Drop dev_pm_domain_detach() call
>
>  drivers/amba/bus.c                       |  4 ++--
>  drivers/base/auxiliary.c                 |  2 +-
>  drivers/base/dd.c                        |  2 ++
>  drivers/base/platform.c                  |  9 +++------
>  drivers/base/power/common.c              |  9 ++++++---
>  drivers/clk/qcom/apcs-sdx55.c            |  2 +-
>  drivers/gpu/drm/display/drm_dp_aux_bus.c |  2 +-
>  drivers/i2c/i2c-core-base.c              |  2 +-
>  drivers/mmc/core/sdio_bus.c              |  2 +-
>  drivers/rpmsg/rpmsg_core.c               |  2 +-
>  drivers/soundwire/bus_type.c             |  2 +-
>  drivers/spi/spi.c                        |  2 +-
>  drivers/tty/serdev/core.c                |  2 +-
>  include/linux/pm.h                       |  1 +
>  include/linux/pm_domain.h                | 10 ++++++++--
>  15 files changed, 31 insertions(+), 22 deletions(-)
>
> --
> 2.43.0
>

The series looks good to me, please add:
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Rafael, do you intend to pick this via your tree?

Another note, the similar thing that is being done in patch3 from the
platform bus, is needed for other buses too (at least the amba bus for
sure). Claudiu, are you planning to do that as a step on top - or are
you expecting others to help out?

Kind regards
Uffe
