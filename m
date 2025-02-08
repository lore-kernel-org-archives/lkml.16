Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6BC125D6
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 01:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738979099; cv=none; b=trNKORPPJsc2GCHDTvuJEcMF/uA1p5hcIy5CGjO1OUEPU+wAFqkJx36vrYp6nymA08S5y/JfXyBQB4ho3BvVrBPTqBowFGKHoAZGxRVP2MsyamDuP63dgM32DK/M9I6IVnamxKtg8Yuv6KPYN/MEK6jgJNh1q77oCB4bIFKybdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738979099; c=relaxed/simple;
	bh=cNYftIBCWjelZt5lLAluOf6xipHJiF5GrZ15RvC1jwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryJArUf7lKgjAl6cwR2V++yBjdB6esbLq4HXA/kawtA6nh5jvR6DVSMYlPQQtUQ4DpFfy6fpOHjOvA2HchSH9E9RB8dEDchk+4sVRfHBIaZexoaPZZ61W6a6VCCu0Sr1cBNnf4ipGzKjzQSKwBSmYjhMeQcnsbbYJKnkEjq68P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SrEM7r0H; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SrEM7r0H"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-307d9a13782so22777331fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 17:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738979093; x=1739583893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbjV8m+TBGStFUUXZqFnjiUZmRlgUrbxjlmh11C3PiE=;
        b=SrEM7r0HrZgbT11L3NERrHwQa46lADVuFjv/GxlQfg9JA7oblN1nwujtgskcSBwkvD
         xMHNHWX3jJ3DkLtfcqTkM97xdF4c1PxyRhrDx2lx6g0x9f9jMflpLC07Os/LPslaKQpr
         05/8cET8f25iaQlFn+WSJ0FV/Os1fM28qBVhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738979093; x=1739583893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbjV8m+TBGStFUUXZqFnjiUZmRlgUrbxjlmh11C3PiE=;
        b=tslYGQ4ub001G/tua4C3KBd0g/TkOPsGzkXu4rOfReQMcWvzZFlvKihRdazz1QVWxF
         WER/vIdsW1xwI7UTWVW7230WRZnPuqP8kRWRKVpaVnMZBG/uS/NkIjdq53rY6mUK5MHu
         zwGpZvmBF5ti5k/PW8OGUAO+3Vxcc2uVwl7CgKztHH+3KFrQuHauaplFdUdAh/6WRpwg
         DMOIa7sZQ9FAAd+WPY1F2uc2r8GZWXVTw48GzWJP+BulxdQbyqJJmQRWrLXHfyvW+tOv
         cTq8ArGkwI0W2cKCj+/VIn8umUsbs2QJ7XU6+hq7IkpvZPnGXCfcu6OdxzxLz+spH5c0
         X7gA==
X-Forwarded-Encrypted: i=1; AJvYcCWMwbG8213pRyt1hld16VLpwx8IMlrH0B9Q5imRVt0FRTMz7GJgrHdZ0hVjJwuRU6g7seav8tVQ2xmdasQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym8KqBHV2BpfxUpxxJXF0gK2ndmmDFyXQmSpjg1GU0dpTf5165
	bbHYaJB1n1eFE8obdj1Fn6xEJHu8kfPXIV53NlWbwTsLahWq8FFYJ2HD5aeWPSNV2+EPyl7ll84
	TbSmp
X-Gm-Gg: ASbGnctwORcbkDyA59bz0FET83SdLjzcSHOBwaLhDHU0Cxun3d0tkuzYpP5slTTOFKD
	1pxm1X1PZiuHxFdjBY04gEpevXrGubcWmKvODGyAUiL23SGikebU05hxa8ATeZvc9WDRLwzL5al
	5nTSxT41slLuzPHmlfdTPXa3lQZu8MFeSiAuCD05EiIU1uL08qwa4a482PIXmHsufKbrIOJqvef
	lEG3RUUKCTfLCakFaR4UNLo9bcdNRz0F2gghDjoAcXdNwhBqNe/fG6jsjMbiudoJC4IHoNC9Vkq
	A3hhGcz9RcVkBkiTfHq1CzRmSgC0dW5FkR4IuQY+82xO/3VoGNzdFOg=
X-Google-Smtp-Source: AGHT+IGE8O9gyEKrYyPYL7vadp/r9m+LenSLjS8P6+gUP4qls+tO6uYUDLaOiQoGJir6kjEu45n6Mg==
X-Received: by 2002:a05:6512:2814:b0:544:1201:c0bb with SMTP id 2adb3069b0e04-54414a9649emr1352182e87.2.1738979092837;
        Fri, 07 Feb 2025 17:44:52 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545057859b9sm23991e87.221.2025.02.07.17.44.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 17:44:51 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-544ff616065so932891e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 17:44:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMNzZhf8KgEZuRudqM5eLXd6kVwmKrwchPrgK/BAxoeBljxPfetEYuSV/PIuyiP5EPWH7LckyFTDWJTGo=@vger.kernel.org
X-Received: by 2002:a05:6512:328d:b0:545:17b:3cf9 with SMTP id
 2adb3069b0e04-545017b3e22mr754880e87.48.1738979090969; Fri, 07 Feb 2025
 17:44:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org> <20250204-bridge-connector-v2-35-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-35-35dd6c834e08@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 17:44:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X0axD+QMfdp_VLBB9AkGcnNSrYVY4-B=ydqAe_6wY9vw@mail.gmail.com>
X-Gm-Features: AWEUYZnarrh0TSQ__CM8Ry5C0vmBnGGx4hlsNFveb-3-H15QutiQYqNVRSaSaOo
Message-ID: <CAD=FV=X0axD+QMfdp_VLBB9AkGcnNSrYVY4-B=ydqAe_6wY9vw@mail.gmail.com>
Subject: Re: [PATCH v2 35/35] drm/bridge: ti-sn65dsi86: Use bridge_state crtc pointer
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 4, 2025 at 7:01=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
>
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 50 ++++++++++++++++++++++-------=
------
>  1 file changed, 32 insertions(+), 18 deletions(-)

I'm about out of time for now, but I finally managed to at least test
this and can confirm it _doesn't_ work. If I take the rest of the
series without this patch then things seem OK. When I add this patch
then the splash screen on my Chromebook comes up but the browser never
boots. :(


> @@ -374,12 +377,15 @@ static int __maybe_unused ti_sn65dsi86_resume(struc=
t device *dev)
>          * panel (including the aux channel) w/out any need for an input =
clock
>          * so we can do it in resume which lets us read the EDID before
>          * pre_enable(). Without a reference clock we need the MIPI refer=
ence
>          * clock so reading early doesn't work.
>          */
> -       if (pdata->refclk)
> -               ti_sn65dsi86_enable_comms(pdata);
> +       if (pdata->refclk) {
> +               drm_modeset_lock(&pdata->bridge.base.lock, NULL);
> +               ti_sn65dsi86_enable_comms(pdata, drm_bridge_get_current_s=
tate(&pdata->bridge));
> +               drm_modeset_unlock(&pdata->bridge.base.lock);
> +       }

I believe grabbing the locks here is the problem. Sure enough,
commenting that out fixes things. Also, if I wait long enough:

[  247.151951] INFO: task DrmThread:1838 blocked for more than 122 seconds.
[  247.158862]       Tainted: G        W
6.14.0-rc1-00226-g4144859f9421 #1
[  247.166474] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  247.174541] task:DrmThread       state:D stack:0     pid:1838
tgid:1756  ppid:1      task_flags:0x400040 flags:0x00000a0d
[  247.185904] Call trace:
[  247.188450]  __switch_to+0x12c/0x1e0 (T)
[  247.192520]  __schedule+0x2d0/0x4a0
[  247.196132]  schedule_preempt_disabled+0x50/0x88
[  247.200904]  __ww_mutex_lock+0x3d8/0xa68
[  247.204970]  __ww_mutex_lock_slowpath+0x24/0x38
[  247.209653]  ww_mutex_lock+0x7c/0x140
[  247.213441]  drm_modeset_lock+0xd4/0x110
[  247.217493]  ti_sn65dsi86_resume+0x78/0xe0
[  247.221730]  __rpm_callback+0x84/0x148
[  247.225619]  rpm_callback+0x34/0x98
[  247.229232]  rpm_resume+0x320/0x488
[  247.232842]  __pm_runtime_resume+0x54/0xa8
[  247.237073]  ti_sn_bridge_gpio_get+0x48/0xb8
[  247.241486]  gpiod_get_raw_value_commit+0x70/0x178
[  247.246436]  gpiod_get_value_cansleep+0x34/0x88
[  247.251122]  panel_edp_resume+0xf0/0x270
[  247.255187]  __rpm_callback+0x84/0x148
[  247.259072]  rpm_callback+0x34/0x98
[  247.262685]  rpm_resume+0x320/0x488
[  247.266293]  __pm_runtime_resume+0x54/0xa8
[  247.270536]  panel_edp_prepare+0x2c/0x68
[  247.274591]  drm_panel_prepare+0x54/0x118
[  247.278743]  panel_bridge_atomic_pre_enable+0x60/0x78
[  247.283965]  drm_atomic_bridge_chain_pre_enable+0x110/0x168
[  247.289723]  drm_atomic_helper_commit_modeset_enables+0x204/0x288
[  247.296005]  msm_atomic_commit_tail+0x1b4/0x510
[  247.300690]  commit_tail+0xa8/0x178
[  247.304298]  drm_atomic_helper_commit+0xec/0x180
[  247.309066]  drm_atomic_commit+0xa8/0xf8
[  247.313125]  drm_mode_atomic_ioctl+0x718/0xcd8
[  247.317717]  drm_ioctl+0x1ec/0x450
[  247.321248]  __arm64_sys_ioctl+0x3e4/0x4d8
[  247.325494]  invoke_syscall+0x4c/0xf0
[  247.329284]  do_el0_svc+0x70/0xf8
[  247.332717]  el0_svc+0x38/0x68
[  247.335886]  el0t_64_sync_handler+0x20/0x128
[  247.340296]  el0t_64_sync+0x1b0/0x1b8

I guess the problem is that the HPD gpio (which is given to the panel)
is implemented by ti-sn65dsi86. It's been a long time, but probably we
don't need to "enable comms" just to access a GPIO, but there's only
one level of runtime PM. Maybe the fix would be to separately enable
pm_runtime for the various sub-devices and the GPIO? ...and then the
"aux" channel enables comms and the bridge one also grabs a PM runtime
reference to the aux sub-device? Not sure I have time to dig into that
myself now.
