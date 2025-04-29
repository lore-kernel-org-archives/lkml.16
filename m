Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F67E23E32B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942109; cv=none; b=vBKnE32SxwRr5gzDBDquNg6t51l+flAXBHNIfxqOoFz+cawp3LmhzWI/yoiCL52sSn2bWZx8bD1+2WOcCGEZ9NklJuGMzN4getHfpFMdAM43HCM7wroHhjSM17mRy/PLUoUL5GlDzQPiO+lunvMUoeyrRLD8xEwpPxG1PivEy3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942109; c=relaxed/simple;
	bh=C2yit2/4ph5Fuf8jW69Kb4trJBdX2LSCMXtWurKfb00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVa6Ysrl9As7KnkkVSB0oTFZ/0sxziaRkkHYCLBq736zoQG5MJAqSINO4BqOnfq/Is5+1c/QKUi4NRVUpCwsGd7+ZF/dkad54FnO1BTVJqiNeWZ9IFQ/WKHw9ZArn5O7oE4fUMk7EQPtxVs/xr9x4NzDzgCZGC296Jut/m461Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fHpZJ9lc; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fHpZJ9lc"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74019695377so2005078b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745942102; x=1746546902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yw4dRegYXEd+wmbXYe4jM8oKmljBSa+e8EyYUljkOc0=;
        b=fHpZJ9lcGsnBhfcSKUz0nucxJ/w1Xt84sQ0aV4xrn4u1Nt1JggVlOWu3Mspc2D1bgD
         DMY0K6WjxfEZ+ptBHpT31TqU4vM04c4QxVR+DRYfhxyex4eXKsJy1n8a94EM3XIlUIjE
         RuG3VZAsswC8yEmp1o/1DYvW7AkWXOuNdjkXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745942102; x=1746546902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yw4dRegYXEd+wmbXYe4jM8oKmljBSa+e8EyYUljkOc0=;
        b=f9fgVbGMYIG8sOtfYsTeNoghEv2x7QyT1uvnCK7U4nvQRUCWPLeEkYnGe809wFWDma
         GtWmCyvnlitdQPHCcA/wfRtEXt1WdvwA+Gd1Nn0Wru7Qp5ZsNLnvdFPqTouQkWdyrAmR
         TYOnPJvhPGIgdLjoFNkQ8GSMdv5ca1GhVIfkiIRnOb9dgl6Zhrn4NIKGk8/CsS0wi1Yr
         cY2d7BvNx5DcDkiN2ITYBnh6J9mH+iAvf95Jypr/psmSuAcGtXdcGg9ni55aNQtkPSRz
         1G4xfxKCN8UFQiCDC0c3kJOjs3vddhay7MzvowFOGhszV7PqTRWzA1RAJL+DmA+UMAj/
         t0tA==
X-Forwarded-Encrypted: i=1; AJvYcCUiXEJjUx2qJWdxVVeQtauCVpDAhSd11sfGb/+eXDZLzpUA4dH4W8qIGksTI2V5Hq6sWFO+4f7+HxJTxxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFWBK7RjHmkO0ly3qtT2KU9CKdekBL4bcSvUYxFQhXUmnzjzco
	+/5B1f5T9D7vmLmhezpVcSnKVCG07hmdbpNHt9jgXNKnDZEocMS3H7b47C6+v2SFggeJy8tC9hk
	=
X-Gm-Gg: ASbGncvTw7AulFghxkuLu0uy7v/x4hRASEaffF4PnaQwePbUJbAnvG9jlzq/hF6batN
	8L++kbcCb8a+gUTcV5v6WIYCgBITlxSrwbbbyyvoSfsXv3cL6H6OOZCiUKpO6aRhjb6uaBi1NGG
	DjzRZh2Nh0r0FYQNCfXzuyFoAoeNWOUqcTeenwAo6UdRvevHfn15wgZmEoUfEfc+9dFteZgE2xI
	npAA46tAG5N9eDt9CKFstTx2hhHzZltmppqPwCeBfXCEPOc9fRX6MgqP1xk6AA2NghHfjr9DNJ0
	+jcKckDCA3alGIKdwq4dBx23PGcgu2bxP0nBuYy5OKYTzNskLiuVyz5NRJyTb/bN+l1+EsOtK1j
	NZfmB
X-Google-Smtp-Source: AGHT+IF5bv4uiNyks8RRYjxvd0IE41mpvNsmFeqpfxdzLgptD1YT1Pxfpx7YnEWcU78z8jew7ij49g==
X-Received: by 2002:a05:6a00:2446:b0:72f:590f:2859 with SMTP id d2e1a72fcca58-740271687dcmr5342887b3a.13.1745942102446;
        Tue, 29 Apr 2025 08:55:02 -0700 (PDT)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com. [209.85.216.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941be8sm10455244b3a.58.2025.04.29.08.55.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:55:00 -0700 (PDT)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff64550991so4971205a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:55:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWs1IDSegQR71fPaUIIcRXuAn431uqlpyPJdA3iK6/YQIsoq2VJT3QPTbvnAj+lxN1x7qpRiEUYpV0xkO8=@vger.kernel.org
X-Received: by 2002:a17:90b:55d0:b0:2ee:c2b5:97a0 with SMTP id
 98e67ed59e1d1-30a21593a3emr5985847a91.25.1745942100102; Tue, 29 Apr 2025
 08:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
In-Reply-To: <20250429-drm-msm-gpu-hot-devfreq-boot-v1-1-8aa9c5f266b4@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Apr 2025 08:54:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UjtkFY=1V5mFpoyfe3yvxUaRLaqXy1cFfeXE_Ka9W1iQ@mail.gmail.com>
X-Gm-Features: ATxdqUGCzdY0LXwBhAEJ2CeDRyHbock5i9Oan9LqNpeHcunKB9U1sJnJz2v4j0U
Message-ID: <CAD=FV=UjtkFY=1V5mFpoyfe3yvxUaRLaqXy1cFfeXE_Ka9W1iQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Fix crash when throttling GPU immediately
 during boot
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 29, 2025 at 1:34=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> There is a small chance that the GPU is already hot during boot. In that
> case, the call to of_devfreq_cooling_register() will immediately try to
> apply devfreq cooling, as seen in the following crash:
>
>   Unable to handle kernel paging request at virtual address 0000000000014=
110
>   pc : a6xx_gpu_busy+0x1c/0x58 [msm]
>   lr : msm_devfreq_get_dev_status+0xbc/0x140 [msm]
>   Call trace:
>    a6xx_gpu_busy+0x1c/0x58 [msm] (P)
>    devfreq_simple_ondemand_func+0x3c/0x150
>    devfreq_update_target+0x44/0xd8
>    qos_max_notifier_call+0x30/0x84
>    blocking_notifier_call_chain+0x6c/0xa0
>    pm_qos_update_target+0xd0/0x110
>    freq_qos_apply+0x3c/0x74
>    apply_constraint+0x88/0x148
>    __dev_pm_qos_update_request+0x7c/0xcc
>    dev_pm_qos_update_request+0x38/0x5c
>    devfreq_cooling_set_cur_state+0x98/0xf0
>    __thermal_cdev_update+0x64/0xb4
>    thermal_cdev_update+0x4c/0x58
>    step_wise_manage+0x1f0/0x318
>    __thermal_zone_device_update+0x278/0x424
>    __thermal_cooling_device_register+0x2bc/0x308
>    thermal_of_cooling_device_register+0x10/0x1c
>    of_devfreq_cooling_register_power+0x240/0x2bc
>    of_devfreq_cooling_register+0x14/0x20
>    msm_devfreq_init+0xc4/0x1a0 [msm]
>    msm_gpu_init+0x304/0x574 [msm]
>    adreno_gpu_init+0x1c4/0x2e0 [msm]
>    a6xx_gpu_init+0x5c8/0x9c8 [msm]
>    adreno_bind+0x2a8/0x33c [msm]
>    ...
>
> At this point we haven't initialized the GMU at all yet, so we cannot rea=
d
> the GMU registers inside a6xx_gpu_busy(). A similar issue was fixed befor=
e
> in commit 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in
> 6xx gpu_busy"): msm_devfreq_init() does call devfreq_suspend_device(), bu=
t
> unlike msm_devfreq_suspend(), it doesn't set the df->suspended flag
> accordingly. This means the df->suspended flag does not match the actual
> devfreq state after initialization and msm_devfreq_get_dev_status() will
> end up accessing GMU registers, causing the crash.
>
> Fix this by setting df->suspended correctly during initialization.
>
> Cc: stable@vger.kernel.org
> Fixes: 6694482a70e9 ("drm/msm: Avoid unclocked GMU register access in 6xx=
 gpu_busy")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
