Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809F8261564
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296397; cv=none; b=iUkXAr9ujzwaSe/bK38os5WpnYYTCrCnRbfOQd2B83T3EauCYOVfF2l1e4eQ7YMYrMW9dNEAN1dDOFbC2MjuNvX8WnSMgn8U3OrnD0I2bsESHUyPVhBPW+qsvChu6dLX1R5OlAliMN0YVo2imifUyfgSFxBT3idKpZ7HkWaG5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296397; c=relaxed/simple;
	bh=WQIK6SG4kEOYBVavoBrOk+Q4q7+RucT2qbIsvhXNYao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDXoR+65wYZShj+tLuWRRFKxVtby4Tgsf1PuJCHNsfSXs1O969gqcjWrZ8cu9y1mjx3utQFypPrH9Tj31yUkBs/FHKhgewdXTxG64tTfPxpbPbUM1bre2Ewy5tnYsVyKRaylQVFP+7WTrRute0qnKCrzBzT3wtncWUpQsgIkCro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VfrG4NjX; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VfrG4NjX"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-543cc81ddebso6538488e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739296391; x=1739901191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY83P5jhCxgHqHTVpMuhAh2S0BdJ9Am5Mi6Xo129a7M=;
        b=VfrG4NjXE53CUSYmAeVtPfs5hLLZJL1wVmRb46gh4qm286DYw8x+8yPCsnHVc876B4
         Qn4rtQA6lVCYFJH4pkS0KLiBj74j8kJs/is2/yRVD0gGx1l1B/9bQtUoALYoprgc+7rD
         vORS14PpsJISZa8fWYjOLXznZRtb2kSkxp9Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739296391; x=1739901191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hY83P5jhCxgHqHTVpMuhAh2S0BdJ9Am5Mi6Xo129a7M=;
        b=F5yYKzv7y1pg+V2NNtADJ4nalc3CFara03WOZBaxezQ7inLwBVvc+gNciS+ckKGUqn
         s1TBm6z0tWVYDgqHm5WTxNyq1nEFas9tHsmSB7keKaiXbewBWZpaSkeLIUdH4XncaN7s
         PLKbJuj2Lz1PT7XpcV/4hVoM3VkOSCVYNJEicVpXZoq97uUNxfZld3b7opLmIFaWccwa
         kkCP37xWwmhz++d3rQliHQ6RZqhzITF20/0fMMVhxpMe0Zz9TYkV1UKBLAmvVjRn8YHK
         wYweKAmb0U6GISGFkfGnXUj9GIDRH1CqhUiymxSbJ9+z2RihJSEcNEzA4FAebJ2NQlNk
         t9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXiVZLlcJiF5ziyS3jYj9ECS6Zvo26M86P+N3YMT8ifLKNPUY0MJLw31YLN9aJGnhLP8+V+dVRiva7EIA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt3kJCVwmR+1ZOCCwSDUOpNIIUR3BiD8la21Z/OQ5ILuNmLZJ9
	LTHoX0f95QV63EKb5XZeMlC3W3nV9LAa82BRQkLpQeKvBpaG5T6VBm3wi12hLNG1pjlRIDFnkoq
	SQg==
X-Gm-Gg: ASbGncs9FFtF+BJqQapzujqf9hYjH2kLZ6sZke0lTSPH80R+q9IfXuKK7a3tdjWqzEY
	j75d+Q3cTP3C8GJa2fhFXTvus/cLzQ9B0wkODMd+KhJfu2fyuhd47XZB0G5ElX2476Mx972vxpU
	2Lzx3pI8uDvstxAJgirVIAS0aGRPddhbRNOMtLJ60cBr8Nru9RGF1Q/5bVu2gMMJuBYV+OwpSKL
	kTtU1WOzjA30FvV7B4klcqqKjb5rS4hjFhnGC8UQNdfu82yI9sEfLj2ys6SEMq4g5Nu2SDiMIhG
	2ILjxR7fvlnwtetuL8eHvARHH6NaQFyabrgn6OLVgbf9zk/im54lN7c=
X-Google-Smtp-Source: AGHT+IG84s492bm/d/KvH4djXIXwfo2kKewXPhWcaC3I7YmvnMNeGItPkMeW4czLxxj+tEItF7asMw==
X-Received: by 2002:a05:6512:10c8:b0:545:fd2:5c12 with SMTP id 2adb3069b0e04-5450fd25e87mr2166960e87.17.1739296391080;
        Tue, 11 Feb 2025 09:53:11 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506cf59a4sm968752e87.228.2025.02.11.09.53.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:53:08 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54504a6955aso3038343e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:53:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRcVEMEyhLaxZsY4RSovzIDzE68EhvXaf3T9ro1MrK3qyDvArw3KafbG3mBIf3jM3kZWnjN3GXNsxrEkk=@vger.kernel.org
X-Received: by 2002:a05:6512:239e:b0:545:944:aaf5 with SMTP id
 2adb3069b0e04-5450944ac8dmr2819438e87.9.1739296387978; Tue, 11 Feb 2025
 09:53:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-35-35dd6c834e08@kernel.org> <CAD=FV=X0axD+QMfdp_VLBB9AkGcnNSrYVY4-B=ydqAe_6wY9vw@mail.gmail.com>
 <20250211-taupe-moth-of-awe-0722e1@houat>
In-Reply-To: <20250211-taupe-moth-of-awe-0722e1@houat>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Feb 2025 09:52:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WriQU4bGrPrrZDncKS0HmL4sfTguGBs9DbVx6yg2ezXw@mail.gmail.com>
X-Gm-Features: AWEUYZnY62phbKZjaL_kWfEqpOtD7hrns2gkLGvyvEMHSIpK0Kgi3V6PvSqjqQk
Message-ID: <CAD=FV=WriQU4bGrPrrZDncKS0HmL4sfTguGBs9DbVx6yg2ezXw@mail.gmail.com>
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

On Tue, Feb 11, 2025 at 5:14=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Feb 07, 2025 at 05:44:38PM -0800, Doug Anderson wrote:
> > On Tue, Feb 4, 2025 at 7:01=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> > >
> > > The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> > > deprecated and shouldn't be used by atomic drivers.
> > >
> > > This was due to the fact that we did't have any other alternative to
> > > retrieve the CRTC pointer. Fortunately, the crtc pointer is now provi=
ded
> > > in the bridge state, so we can move to atomic callbacks and drop that
> > > deprecated pointer usage.
> > >
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 50 ++++++++++++++++++++++---=
----------
> > >  1 file changed, 32 insertions(+), 18 deletions(-)
> >
> > I'm about out of time for now, but I finally managed to at least test
> > this and can confirm it _doesn't_ work. If I take the rest of the
> > series without this patch then things seem OK. When I add this patch
> > then the splash screen on my Chromebook comes up but the browser never
> > boots. :(
>
> Thanks for testing still :)
>
> Could you add your tested-by on the previous patches if you found that
> they were working?

Two of the previous patches didn't compile (which I replied about). I
was going to wait till v3 and then reply with Tested-by on any patches
that were at least exercised on my basic test.



> > > @@ -374,12 +377,15 @@ static int __maybe_unused ti_sn65dsi86_resume(s=
truct device *dev)
> > >          * panel (including the aux channel) w/out any need for an in=
put clock
> > >          * so we can do it in resume which lets us read the EDID befo=
re
> > >          * pre_enable(). Without a reference clock we need the MIPI r=
eference
> > >          * clock so reading early doesn't work.
> > >          */
> > > -       if (pdata->refclk)
> > > -               ti_sn65dsi86_enable_comms(pdata);
> > > +       if (pdata->refclk) {
> > > +               drm_modeset_lock(&pdata->bridge.base.lock, NULL);
> > > +               ti_sn65dsi86_enable_comms(pdata, drm_bridge_get_curre=
nt_state(&pdata->bridge));
> > > +               drm_modeset_unlock(&pdata->bridge.base.lock);
> > > +       }
> >
> > I believe grabbing the locks here is the problem. Sure enough,
> > commenting that out fixes things. Also, if I wait long enough:
> >
> > [  247.151951] INFO: task DrmThread:1838 blocked for more than 122 seco=
nds.
> > [  247.158862]       Tainted: G        W
> > 6.14.0-rc1-00226-g4144859f9421 #1
> > [  247.166474] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> > disables this message.
> > [  247.174541] task:DrmThread       state:D stack:0     pid:1838
> > tgid:1756  ppid:1      task_flags:0x400040 flags:0x00000a0d
> > [  247.185904] Call trace:
> > [  247.188450]  __switch_to+0x12c/0x1e0 (T)
> > [  247.192520]  __schedule+0x2d0/0x4a0
> > [  247.196132]  schedule_preempt_disabled+0x50/0x88
> > [  247.200904]  __ww_mutex_lock+0x3d8/0xa68
> > [  247.204970]  __ww_mutex_lock_slowpath+0x24/0x38
> > [  247.209653]  ww_mutex_lock+0x7c/0x140
> > [  247.213441]  drm_modeset_lock+0xd4/0x110
> > [  247.217493]  ti_sn65dsi86_resume+0x78/0xe0
> > [  247.221730]  __rpm_callback+0x84/0x148
> > [  247.225619]  rpm_callback+0x34/0x98
> > [  247.229232]  rpm_resume+0x320/0x488
> > [  247.232842]  __pm_runtime_resume+0x54/0xa8
> > [  247.237073]  ti_sn_bridge_gpio_get+0x48/0xb8
> > [  247.241486]  gpiod_get_raw_value_commit+0x70/0x178
> > [  247.246436]  gpiod_get_value_cansleep+0x34/0x88
> > [  247.251122]  panel_edp_resume+0xf0/0x270
> > [  247.255187]  __rpm_callback+0x84/0x148
> > [  247.259072]  rpm_callback+0x34/0x98
> > [  247.262685]  rpm_resume+0x320/0x488
> > [  247.266293]  __pm_runtime_resume+0x54/0xa8
> > [  247.270536]  panel_edp_prepare+0x2c/0x68
> > [  247.274591]  drm_panel_prepare+0x54/0x118
> > [  247.278743]  panel_bridge_atomic_pre_enable+0x60/0x78
> > [  247.283965]  drm_atomic_bridge_chain_pre_enable+0x110/0x168
> > [  247.289723]  drm_atomic_helper_commit_modeset_enables+0x204/0x288
> > [  247.296005]  msm_atomic_commit_tail+0x1b4/0x510
> > [  247.300690]  commit_tail+0xa8/0x178
> > [  247.304298]  drm_atomic_helper_commit+0xec/0x180
> > [  247.309066]  drm_atomic_commit+0xa8/0xf8
> > [  247.313125]  drm_mode_atomic_ioctl+0x718/0xcd8
> > [  247.317717]  drm_ioctl+0x1ec/0x450
> > [  247.321248]  __arm64_sys_ioctl+0x3e4/0x4d8
> > [  247.325494]  invoke_syscall+0x4c/0xf0
> > [  247.329284]  do_el0_svc+0x70/0xf8
> > [  247.332717]  el0_svc+0x38/0x68
> > [  247.335886]  el0t_64_sync_handler+0x20/0x128
> > [  247.340296]  el0t_64_sync+0x1b0/0x1b8
> >
> > I guess the problem is that the HPD gpio (which is given to the panel)
> > is implemented by ti-sn65dsi86. It's been a long time, but probably we
> > don't need to "enable comms" just to access a GPIO, but there's only
> > one level of runtime PM. Maybe the fix would be to separately enable
> > pm_runtime for the various sub-devices and the GPIO? ...and then the
> > "aux" channel enables comms and the bridge one also grabs a PM runtime
> > reference to the aux sub-device? Not sure I have time to dig into that
> > myself now.
>
> I don't know the hardware, so I can't really comment, unfortunately.
> I'll drop it if it's broken.

Though it's unsafe, you could drop the locks and replace them with a
comment saying that they should be grabbed here if we can figure out
the deadlock. I don't think the newer code is any less safe without
the locks than the existing code, right?

-Doug
