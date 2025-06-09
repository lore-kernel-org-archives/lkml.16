Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB723597B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 22:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749508669; cv=none; b=rPsIWl/i2KNwDo7OHrmUVEDxDZ4fCwvA/doZgL5t8F823PrMzyQ5wHPd0D4MfavujBFMGBBD++yC5pHOmhdRl/uBZcu1Vf2cVmItmbQc/EB8WQ34RX8KipJ3C+X/IXvk0LCo4Mqgqq7oxoLQl1xSYnghM+6XxysnhREz/oEmZfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749508669; c=relaxed/simple;
	bh=CdDWu2GQBivXHzpGjrz2rXW/P0OEfK9OtJ68r9lKLDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekzsVfd8lMxdLhtMins7d9CCvGa7GvkbEEs4m2oJ7Pte0wVMqCTrsvqxS6NaXpvjfQWldoVCCq0+end8WlPjkkKTPAKf71w+cZvTdkteMy1eJT69a1z978uhNRKNgavZQaa5tt2XXXyeNIzyayzp3Kgz2zms8lJFyYnwxOAcwSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GbV+t6ud; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GbV+t6ud"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a43cbc1ab0so58959811cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749508666; x=1750113466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCHI8hBSZbe7jWpVWG5E6iUU6NcGTN8I1nvVgCwantQ=;
        b=GbV+t6udFz4wVEcdZ2MNea8M50faCYHX2XVpX4U6q3ZzqKRjrUyxO1o83/r0HNaldI
         jqfjdYacUgEV06JBNzwV0KAJHiLLLn1vpulYqtZTtnN5aHlIt84StFKwHg9034HLyJjO
         8D82eSPp0StEh9i6CAutE6C0pOx3yNvG4A/nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749508666; x=1750113466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCHI8hBSZbe7jWpVWG5E6iUU6NcGTN8I1nvVgCwantQ=;
        b=PdKQ3vB8Etp2imJ92sNgSdZA8pEogsEekRgwuUU6GM8krY9r6TPNPADt52NQnGUF3y
         +aOSAOGLDt0E3weogrnu6ZNedB2h86CT2YF/3opPS4bi0UeQt3p/cjSCfg9csNSsMqoO
         fhbJD/7bKArac6c6Een/vTa2ju4Je6i2NZpJ+kARViK4T2LbmjTVh+JSRbxVs7bKQith
         3AM0qexkgEegKJ+6ziWcDZ//OR4IbJ/PkDjPOwBOCQtvYw1ToVfol87BHjDCAZwtelZJ
         C4YIQwf8BbaRziHAlJxG8MlbfxyPSMFAbXE2DQf2gS71XrYhEVgzE/hgYIhKP1o7y9GR
         v5JA==
X-Forwarded-Encrypted: i=1; AJvYcCUFqId86tNpr9gcy4wwRw0QyWJXl1pZnCOZrrNSFVz64bTBlNYuVAp3laPJIN8AqxluCDN/vnLS0nH6Cyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyenQKdtL+Yl+KALQ1BjVa21ZL3MmYqWmkgNL6Ek0m0AKpWfVEZ
	BnAHU4F6PvJqYt3/q57iBTdH3Ah52YXa61xDgGtyOm1bolt1AOXUrUo68PPZoQZ0gYEHjOu6L7L
	4qvHRBA==
X-Gm-Gg: ASbGncs/pcjpC1ZgosKSywx96dvhC76MlmvaOZm0hIOqwp9rppwxEhhivPQzr1IpdjJ
	AspxceYt2QywwEpRoa8TurIamL1YD57OrverY1me6hHUyR8hfz39WOiPF+CU6VM14hPaoX6WdYc
	X6vZOn6L0/KAq8Im+Qvpw1745j29jHmKF6zBngZOhytNhQIZTMYRmPRUx2eMlf8I+BRYa4szHvI
	IXnAL0IKTo5Q6Z2lYywy2NA0WcG9Lu1txU48k9DbGGjwkiesSgwESQDSWR0m2MOrYAai0do9jXy
	LmODglL43Ah2WWS3upSSBRKrzqU3/1OcnNlbexYoQvc5I+EZ9ZODa6hQ3STpJqU0WNxJV2K+hY0
	kyT6IfX8MSMVI7L14FikiiTz4Nw==
X-Google-Smtp-Source: AGHT+IFDGM9iQOuiD+CiYsN/Nvl0TlW0ms2k43OB2PvTTFb6DACVsEsHIWdXnznt4ou2WexvEGl3Lg==
X-Received: by 2002:a05:6122:4698:b0:52a:863f:78dd with SMTP id 71dfb90a1353d-530e4897711mr13494870e0c.6.1749508654091;
        Mon, 09 Jun 2025 15:37:34 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53113a7e666sm417820e0c.10.2025.06.09.15.37.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 15:37:33 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e45bfb885cso3114878137.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:37:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1XtC30ofiqvDCGbUF9FF3lg36cjN+Wz1lm7XSL/OE2El1lMTAXu0V3aCTsWs4C/MjOpTfdNTDobA//QU=@vger.kernel.org
X-Received: by 2002:a17:90b:38cc:b0:311:af8c:51cd with SMTP id
 98e67ed59e1d1-3134740bc52mr24180504a91.18.1749508180316; Mon, 09 Jun 2025
 15:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528132148.1087890-1-mwalle@kernel.org>
In-Reply-To: <20250528132148.1087890-1-mwalle@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 15:29:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
X-Gm-Features: AX0GCFt2omRlNA1zSC_GcQLoAaXlrYVa5kPcv0qbGu9sC3O4EQDw4Pp-3x8Mhmc
Message-ID: <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
To: Michael Walle <mwalle@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jayesh Choudhary <j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 28, 2025 at 6:21=E2=80=AFAM Michael Walle <mwalle@kernel.org> w=
rote:
>
> The bridge has three bootstrap pins which are sampled to determine the
> frequency of the external reference clock. The driver will also
> (over)write that setting. But it seems this is racy after the bridge is
> enabled. It was observed that although the driver write the correct
> value (by sniffing on the I2C bus), the register has the wrong value.
> The datasheet states that the GPIO lines have to be stable for at least
> 5us after asserting the EN signal. Thus, there seems to be some logic
> which samples the GPIO lines and this logic appears to overwrite the
> register value which was set by the driver. Waiting 20us after
> asserting the EN line resolves this issue.

+Jayesh might have some insight?



> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> I couldn't find a good commit for a Fixes: tag and I'm not sure how
> fixes are handled in drm.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 60224f476e1d..fcef43154558 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -386,6 +386,17 @@ static int __maybe_unused ti_sn65dsi86_resume(struct=
 device *dev)
>
>         gpiod_set_value_cansleep(pdata->enable_gpio, 1);
>
> +       /*
> +        * After EN is deasserted and an external clock is detected, the =
bridge
> +        * will sample GPIO3:1 to determine its frequency. The driver wil=
l
> +        * overwrite this setting. But this is racy. Thus we have to wait=
 a
> +        * couple of us. According to the datasheet the GPIO lines has to=
 be
> +        * stable at least 5 us (td5) but it seems that is not enough and=
 the
> +        * refclk frequency value is lost/overwritten by the bridge itsel=
f.
> +        * Waiting for 20us seems to work.
> +        */
> +       usleep_range(20, 30);

It might be worth pointing at _where_ the driver overwrites this
setting, or maybe at least pointing to something that makes it easy to
find which exact bits you're talking about.

This looks reasonable to me, though.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
