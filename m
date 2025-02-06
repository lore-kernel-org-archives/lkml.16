Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85AD239572
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738862686; cv=none; b=rKdDOSRyr6YIMrlV+lpRnJGk4h1I/8Tk28bE94pwf/HDK7rrXo60+VyBXFwDx+XWwmKLiVrZF8Vs/GAMcTWhTXxUFmvDKdor93SyVsiX2X6o9TBzpzjZvhpt8Re1czcDFK62VCoso2goPBraU15NBA/v35rAGnoDRTytriRChpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738862686; c=relaxed/simple;
	bh=YwA9dD+vOD5UI6kTXZNZ2vBjxgbh0fFAR3uwaLJeW3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alVx6JpA5OHt6WMUzCs5hEPTblQkYCcmLsSsoc9IxVeNatI3NHayKIKrgP/g/iF0YY+es2Gps0kokJ+C2Z0B0jGno4p4R9D3CetHthPyxbFA+C/9Lco0zdHIUXsmwjaZdRDJCIJFEGICLjsN08LodqUg0aK9G/FLhQdeMUVx4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iHzj4vLz; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iHzj4vLz"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54410d769f7so840252e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738862679; x=1739467479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ed7lT/vrZVPJbPUzm9AOnCzmZ1I0Y/f6j1mnOtXgaMc=;
        b=iHzj4vLzPTwl6Ayd3eh5mcaSu3IpHXO5Z6eNQIaVCY2yMGFVsWxl/PC29wPskXe33P
         73nFVp20R6p4bLk+Inq/lPW/p+ToDfKeUAYCNL8aMJQOZrxn6VQIXCVEP6fI1py+bhQi
         fSJQjLYdb21CabUOEA9RkxAcVx2k2GTDzJ6qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738862679; x=1739467479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed7lT/vrZVPJbPUzm9AOnCzmZ1I0Y/f6j1mnOtXgaMc=;
        b=ChQIZIGze9TrdDgZai16XvC8dHUviPq5+3GZuR8JcPr+cL46VCJbwCHfhDh0GaByfb
         u14cOHzaa3iCLwDSIzLJqAY+jTktzKP7CltaO/O5/Et9A41XoASoKaBRVsInMJ0J4XFV
         N937mqDSaDJDdPDX+5I5yj/9OWal+KiBf7s2UeIBDfXdgOutn/yG990xOr14N+I4wg3o
         pfTUOrSgHCZepCv3+fXVyUvc3YDqgJ5BgAxakNwd0r5JYF+jAgs/2lNeNxNC6vbjwj2I
         WPyQ6ifET9J+f0j8P6d2UC3aE5oLF5OHjS3FFiZ9SJE3VUXzRtOdAbqFHXUH9deD4F40
         lFbg==
X-Forwarded-Encrypted: i=1; AJvYcCUQBed/T/T2Plm5lcpgNjt2eqNz3pmHWYbpBC/l1igb065EP+tXhg3xOmGI/K6cBCgyzg8DG5PGSaBShak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5A7GbK4PEAHECJNxrstSrStnlc+OpnLbiLK4f5RP21Yt26DQp
	uqsVJBDX4UJrReqHt/0P+PZHsOzVBVkx7lqUaEoTHL59fJWQmpIKWB1vSuEafEeYWVuyCOsn1yZ
	7sGfX
X-Gm-Gg: ASbGncve+U+aInigOiOQoTgGhRp76sYya6o3K2ghszHbWq96ZNQLNoJ1xQojYrBDj4W
	/MrhHvpoSEsyoa2mbNwahVBOs3LmUaOQxh5Kq0xorEQMU5vHD4JktA8OB5XO8r9nOtEs8TEuB6M
	Sn+HLL+TE/CTq+SrKjWl+QYZpUaFnJvILBwn9rDN8I1LNH7IHTB6adFWizWDABkTp3lPSOzePou
	cZq50ZQPWpBXAYsmZzjHxWGXsU8/YBUt6ArIrQBWvwRm+tZb/hybUaT1V9JXbDdIYsLuIvFT6gt
	P79xqKLs95HjCAjCHXPHheS/h7pfuHn9rUp8yovLk/yMBH3fpvcFOK6E2+Y=
X-Google-Smtp-Source: AGHT+IHlr5IupuwOWzjQtK0b/tWMU1NdLnSzfuOdBSue7TBT9Tid/2RcJl4dVqC2TY3wY/Dq6Wmhhw==
X-Received: by 2002:ac2:4e0e:0:b0:540:358d:d9b5 with SMTP id 2adb3069b0e04-54405981be6mr3038799e87.0.1738862679305;
        Thu, 06 Feb 2025 09:24:39 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54410554151sm182809e87.63.2025.02.06.09.24.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:24:38 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-307e00d6b09so6251001fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:24:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFfJxhZnioUa3+fQq9pQuefllYwhOfEWbSyMoGrRbmuO97tVu4bURM9/mB+RtS8mKaNRr2m14v+9XHfEA=@vger.kernel.org
X-Received: by 2002:a2e:bc27:0:b0:302:29a5:6e21 with SMTP id
 38308e7fff4ca-307cf2ecceemr28052561fa.3.1738862677388; Thu, 06 Feb 2025
 09:24:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com> <20250206-drm-cleanups-v1-4-93df60faa756@bootlin.com>
In-Reply-To: <20250206-drm-cleanups-v1-4-93df60faa756@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:24:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wpd7uweOrLJfxzBBL0DSs=5++QpfaQZQ98++en2=4fmA@mail.gmail.com>
X-Gm-Features: AWEUYZkPAnqgw5tLJHzsOP5sDbr1MervVm8zS8Lc-qKKD9rrDdhPe1XWkMlYEhw
Message-ID: <CAD=FV=Wpd7uweOrLJfxzBBL0DSs=5++QpfaQZQ98++en2=4fmA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/bridge: parade-ps8640: remove unused drm_panel.h include
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

On Thu, Feb 6, 2025 at 9:02=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com> wrote:
>
> The file uses the panel_bridge APIs from drm_bridge.h, but no drm_panel
> APIs from drm_panel.h.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
