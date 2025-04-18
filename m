Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C636BA2D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744937657; cv=none; b=bkxjRvF20jFzMOYml71ygQq37YBE+LeE4cfnx3LeTmdyDzPWnASJIUKb0cUhO5yTXVYYuPVnXxbgoa8E0Hs8/wFl2RQ7TYO1Z3iLbhnkegiuLrjhPPxjsznq/8+Iy8ep+pK7TppgCmh/ynrAcJF89EF0X+l/yW/ffQHcS0bAQ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744937657; c=relaxed/simple;
	bh=kYw96PJDZxr1gtwXp/xI+3EWhFmokKT4Hr/AtyA3lAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJIk/abf+Q64Fbx5FB3Hk1GckivatJXDsQwzHT4aSdykPrKkUSXy/0c9mD0e5dNofl/HGKlPZF+nSYVk4QMiEYSKKcDPDg56AcCAzwGfmItCFQukbHf/0Fxo97qvvsBxcfpVaR85uAga4ZkSiDi9hKt5LohXGgJv9ZQ2N1WOpqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EsmQukaM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EsmQukaM"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b10594812so1487078e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744937653; x=1745542453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7v6a64FwreaJA0pCAKVOqC5CViB7StYRn/BcrMkSKM=;
        b=EsmQukaM/yx+SlqeXxgDNAaNfMRfKcG1hh/W4CEAdUGfwRIMqnLA4Y7/czczNqHoaV
         q6BvLDjY9S9p0m0wWpcqyC1exuQ4gSIB/2aqnt4adrt5OQrbnTZBNvAlFLbxlwMj0DBj
         z4lUgcBxthS2Rs6XfHOD7QAScm62ynGsHB3Vw4fYAGVRjq1VrENtajhDGl/dwLMqnfiB
         ZZUuSHoUcm5ya7tlcMx1CTtOlTIcjlg+TtC78getfOh7UgXD4XOo/lbd2xZmraj6CiY+
         5pnYKcKz1eOka4ePN4u440D2t5LQQstRCKVTAJL54AjFJN++H/3JX/SY8GuZvvefRclA
         +g5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744937653; x=1745542453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7v6a64FwreaJA0pCAKVOqC5CViB7StYRn/BcrMkSKM=;
        b=sR3MiubL7JkynrB0X+a6hHa9/aB6xnyNt05aQGP3JV9n8+Ad0rU4q+QxuAKH4D7ZhN
         aDyZGiv4OoS9pp6WdlaW7kVmavdosNN8lx78xB8nUzuF4k/n+6Mu0Gpv6iy8lWoDAXXy
         V1DiERuNS7SRanbe1KjebzgOFtuJcvyJ8ugjXtji5E3kbLBKJG0ub+grAFxO1dLxLqmH
         FhnHXRR2B1Qbx03xUlKOn0qkKIN9nh4u0wb3bGptd0HvGh4SNwPEhvw2MzDR9H3F5M3D
         IgdK7I03tzfo9wuMhiV4IbcH8gbJaRt80kpm2aczLdVbjpq1hM407zqSot8sE3JbRbnr
         e2wg==
X-Forwarded-Encrypted: i=1; AJvYcCWhp7riCqnVhzrVSIESS3C39KV/YAA6zekv7mz1W2bhPCy2DjmYI7m3HFnRtj723ApoZVBScpAgRJctX0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNgaPd+DQTiZbemWCA5a8Xagu5tGTgTqWSJ/70Ge9a7X777sOH
	Z5/exuSayjJQ0ljZHiU0XLx59wo0z/4kpe83ltwfwntwQwdq9Q/BKAHUrXdMwI75TTPPO5hsSfP
	09Fwm/oSLn3SCDKz6Enl8XDi+QcZ+pSeCQ5yT
X-Gm-Gg: ASbGnctCVmYO63p5tQ3vKxkuo7sm0F8tiGgn3rsfvMFCJ9HOhoSxA8KZnfuGYe04y0N
	Yuub6oz21rLp8Rvx03d4fp+tylC9F0G4pUJ6dXN9NTjCfEtgzeT0q5AQ/v4tSx1u275RL0s3upI
	7ivj0AxFH8CUAbyATA6P0x58boOnOSkjfVcgpBXxpU/8NVjjY=
X-Google-Smtp-Source: AGHT+IHUdZc5HDjrZYA8LWyh9msnR6W71lP04fz39bJlOI9JeLCz/9ra+wyxcFCuEbg77rntJwlmJg7XBKEi694wwtw=
X-Received: by 2002:a05:6512:1045:b0:545:2d4d:36de with SMTP id
 2adb3069b0e04-54d6e6352a2mr234675e87.31.1744937653242; Thu, 17 Apr 2025
 17:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 17 Apr 2025 17:53:36 -0700
X-Gm-Features: ATxdqUHzOUVh8E2tR73MoZ4FAVpBQN57AXnmN-9HADX6gA9CnvHoa6p8qDTye_I
Message-ID: <CAGETcx_=hEuOs09=gRe58+34PFa0bfsYoAK9kYOn90FP5nDjmw@mail.gmail.com>
Subject: Re: [PATCH 00/11] pmdomain: Add generic ->sync_state() support to genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 7:25=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> If a PM domain (genpd) is powered-on during boot, there is probably a goo=
d
> reason for it. Therefore it's known to be a bad idea to allow such genpd =
to be
> powered-off before all of its consumer devices have been probed. This ser=
ies
> intends to fix this problem.
>
> We have been discussing these issues at LKML and at various Linux-confere=
nces
> in the past. I have therefore tried to include the people I can recall be=
ing
> involved, but I may have forgotten some (my apologies), feel free to loop=
 them
> in.
>
> A few notes:
> *)
> Even if this looks good, the last patch can't go in without some addition=
al
> changes to a couple of existing genpd provider drivers. Typically genpd p=
rovider
> drivers that implements ->sync_state() need to call of_genpd_sync_state()=
, but I
> will fix this asap, if we think the series makes sense.
>
> *)
> Patch 1 -> 3 are just preparatory cleanups.
>
> *)
> I have tested this with QEMU with a bunch of local test-drivers and DT no=
des.
> Let me know if you want me to share this code too.
>
>
> Please help review and test!
> Finally, a big thanks to Saravana for all the support!

You are welcome! Thank you for getting this series done! Happy to see
sync_state() support being added to another framework.

I skimmed the series and at a high level it looks right. Not too
familiar with power domain code, so I didn't go deep. Just reviewed
the fw_devlink and driver core parts of it.

-Saravana

>
> Kind regards
> Ulf Hansson
>
>
> Saravana Kannan (1):
>   driver core: Add dev_set_drv_sync_state()
>
> Ulf Hansson (10):
>   pmdomain: core: Convert genpd_power_off() to void
>   pmdomain: core: Simplify return statement in genpd_power_off()
>   pmdomain: core: Use genpd->opp_table to simplify error/remove path
>   pmdomain: core: Add a bus and a driver for genpd providers
>   pmdomain: core: Use device_set_node() to assign the fwnode too
>   pmdomain: core: Add the genpd->dev to the genpd provider bus
>   pmdomain: core: Export a common ->sync_state() helper for genpd
>     providers
>   pmdomain: core: Add internal ->sync_state() support for genpd
>     providers
>   pmdomain: core: Default to use of_genpd_sync_state() for genpd
>     providers
>   pmdomain: core: Leave powered-on genpds on until ->sync_state()
>
>  drivers/pmdomain/core.c   | 273 +++++++++++++++++++++++++++++++-------
>  include/linux/device.h    |  12 ++
>  include/linux/pm_domain.h |  11 ++
>  3 files changed, 249 insertions(+), 47 deletions(-)
>
> --
> 2.43.0
>
