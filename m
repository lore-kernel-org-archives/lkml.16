Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8E239572
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738862836; cv=none; b=u3r27MuomRAK1vGxCO9rvP8qcoVjfbKmuSdJax6H1HOujin9VK95P+CIOcNXz0N48cNcUXiJnXf//pPSSfQv69JseKAhu7+VE/7rv6Qm9o76AWphDZqz4C3Q91kUPhNGIVSKEr6sGGozPEOPOXXhI/b+Y2lptKxEPXUhUfwdgI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738862836; c=relaxed/simple;
	bh=s6UGG5nxxtDqXxEYz2Wl/ff5qkgM2dgUdAn0Tgk7yPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i20YyNeZBWsLjmroxqMlPGnJUXs3bHkb8m0xRz+0t0ohNgPcGBDPHlvYV+1sfpcqjlrsxihNLedJKYN/JX/4CAf5f/coj//3b6POa/GBZYpxAF9VgwpciwgAtD6u6zHHiQcQOjp4FWAfdJRnPIxReyELWpAIIvJwu7IliyaGo3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FlCto4+1; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FlCto4+1"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401e6efffcso1204093e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738862829; x=1739467629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBijg/MWWNMLTZeDAl4JcMDsL9YDu4fhpZGRnrHfPao=;
        b=FlCto4+1W8Cle+cOZ6K301rL5fm+37OS2pnqpe0MkhcxLJgbp2VcbNTONOv6CbpGZu
         koXjcHdSr3ExElKfNR++g/XqISpE8YykBNXEIqTlKQppgT6iYSC43QGp/u7uOhMKGoNI
         KLFD9ReuXcOxI5BRpZV56wTZL68Bva4/mI/jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738862829; x=1739467629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBijg/MWWNMLTZeDAl4JcMDsL9YDu4fhpZGRnrHfPao=;
        b=xDrxihlNh/RAPEcR9kodEXktBQyFAcM040XwI11HiLbKsFv6l2E7D3Ivv+kPqwhy6S
         9gkbmxZuKZfV+cxBq7K9QrVTFpsmstgexkSwGfsmG6DwBKuTxVwdXmp84QL5eRoYCz9P
         vKgn9ltyiQVHMNLMYT1UyrenTdl6hm8Eyz/9GWJxkACgro9nZCuPMcioVbof+L3xIdUD
         leBk2HcHS+lWUM9B2IxGCXwn6krYlbR1s+WywqipdxDJ2cvzHFX6l3uzAZ52yc89qVV7
         btRgKJ/vKMO0rPFT6DMfrVk2JNF5z/23z0qqR2+1k9u116o9gnxU5oyOvHthVUJolL6c
         1Wfg==
X-Forwarded-Encrypted: i=1; AJvYcCVhql7OJM0nzgd+gFeE9N1xHUwl4zZ8PMkUEds1QfRI1pmkDhUrypQwe9vh0DsunERD2CCPWKxf0ZM1ViM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMo1Fu39qhVMrNLpnndfJ7WAFy9oE/Z8M3ssr/05c9IAdYYwPc
	t/CKR333bfnR4wb3lQFT4C3A4PrqwPftmDnmqe0LVw7rhaOy0HawLTLaT0U8EvXZYWUUHOMOcN/
	sTlKD
X-Gm-Gg: ASbGncuB2bSNCx37e4883tjS7O1YrKtf7SgRY5aIuDDpEwJarD11w9K/1q1y9GC+Fqi
	hd1OMYjX57djlLLOSYrGzYP8EDy2ubIqyqSGsvrynhIV4MzNHc98dgquGfgolgHRJHUFlsOv9IZ
	9/WCcgmYsOUal+R2JCUyZugpC8q2sqt4xy8I/goGq/O9cGW7EpTAcAeneIRnBOrzdDoGj0LyPqK
	yv/QCFAwXGRbQ9zqHrNpTZDI++dcaJEQNDfYnTTo6vwmo85oMarEGN5vyLa0CAxKRVzGM5AYFVT
	aVqsxKNtMSPUJIYSD77mjLj1jBWxD9lhN5YpvsgDm+zLySgUxz02XaIfPYs=
X-Google-Smtp-Source: AGHT+IE7pNhlcbNXgbAtyihNY0ZS7xgndkvtEivhkqsuWjXkjPpm1b/C1qed1ZRnowoN4gPuKihW2Q==
X-Received: by 2002:a05:6512:2398:b0:541:1c49:26a with SMTP id 2adb3069b0e04-54405a72440mr3400501e87.43.1738862829297;
        Thu, 06 Feb 2025 09:27:09 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bfca4sm182351e87.130.2025.02.06.09.27.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:27:08 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so9400371fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:27:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9w6Wvz2juqWc+pxjl0bwo1FMBaR7b9e7htYfzKwSvdfT2v36yR60W22nQKq/fHlCID0GBtD3LUmDxj4U=@vger.kernel.org
X-Received: by 2002:a2e:b8ce:0:b0:306:10d6:28b3 with SMTP id
 38308e7fff4ca-307cf2f0ab0mr29592191fa.1.1738862827317; Thu, 06 Feb 2025
 09:27:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com> <20250206-drm-cleanups-v1-8-93df60faa756@bootlin.com>
In-Reply-To: <20250206-drm-cleanups-v1-8-93df60faa756@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:26:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UiL4-QMq-YW1vz39exETr+feAfUgk8CKbvB6AWpqo+1Q@mail.gmail.com>
X-Gm-Features: AWEUYZnZB-Z2teoI_9owUXED11rcj_EPx60vyBFO2w0QVK0rgG-h8fLXZ7hnhKk
Message-ID: <CAD=FV=UiL4-QMq-YW1vz39exETr+feAfUgk8CKbvB6AWpqo+1Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/bridge: ti-sn65dsi86: remove unused drm_panel.h include
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 6, 2025 at 9:03=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com> wrote:
>
> The file uses the panel_bridge APIs from drm_bridge.h, but no drm_panel
> APIs from drm_panel.h.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 1 -
>  1 file changed, 1 deletion(-)

I'm not sure I'd really even say it uses any "panel_bridge" APIs, but
that's a bit of a nitpick. In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
