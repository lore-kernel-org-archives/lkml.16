Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E9C211A11
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738788859; cv=none; b=LV9AOkTDA7kAFJoz+mBoT8pgCLsJhDNige+GE2gKAuTqUz5oysTTo9BP/ryCMgt2fqG4u7cgeRLIE8iQVpD2Vq71+/vErFY0CerIKqEIDP+FxqWSQuDj2YwCOiUhmcbGb0T9rfQb9xvAaC9WaHkOoWTtitTCi6IUc3GiXHeAEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738788859; c=relaxed/simple;
	bh=O2u7exxkTvFqNGxtE3/iz3j3tBUxGhsU/63nNZHndsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIQ4sFgrdtpbg/E1+KYa0gE+xU2M323wrg44PhPUKpUkY6j2GtTCUf+VcOdyJOqyiGVzvfseO0//Zmltvmhhah1q/NnOiPxfU8hkWEKD/ov6cJU1HIOKAPBGPE7Swi6ACzhwCSb8zAek6MjY9cnnfeSJtCUyjAZD2gX4ugPjUFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hLbDD3pJ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hLbDD3pJ"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5439e331cceso239137e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738788852; x=1739393652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANoLh61Td7sDUcsOJIPzUPWYEKND5mf1HpgxNeIqOG0=;
        b=hLbDD3pJImeoyK2UO3Xb4eZY1DEpuV0vf2lGDSDpmJdVTWfff4y9ZG1AUDwIkLLi9V
         A9CefmUIZyiPxPUISeWc64PPOlDmGEEDtx5dDwSKMsIXtqWpc25VQMFSVIuSgexGmsqA
         vKQUdKyaRQWnWEd8M9J8F4eJ1Cq1gEH7x+h7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738788852; x=1739393652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANoLh61Td7sDUcsOJIPzUPWYEKND5mf1HpgxNeIqOG0=;
        b=dU0RzhGLbMBQr0T7SM+Uo8In5Yu4m7MZaF9zfQXkHriS3G8OBUNSV47aFi3WcPwhk0
         Ib3uWgZSPvehjik7c8OtWyZ04ul0IFkFIpcXndhwHaUg84cZ5mydXjI5NddZTLAkwDUF
         C0Vg/gfi/wAZqJvNs+X/RLmAyf5tKkAbcwu6SCNBPp0/ocqPYatD3+YN1/g3RH42W6Du
         wmiVFN3wzTDqFkmzl9c5VgvA4bqvmRTNe9zKF1bBnbGV+cihjtGP/yL9qKDaCyldQimp
         TveAg+Ig111D0EZq/b9d9lqwT7I3O5kZZUDtB0Vorlq4YsyLQWnLFFkss2jHJQ2Wx1Un
         FXZg==
X-Forwarded-Encrypted: i=1; AJvYcCXsvcutdT6gTy4Qkb9muU3jfGnXyjG/7lAfmy4xvD5q5L2iTDuFQ6yJCpz3fhwa/SmOeomU0KgdN4E7F/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDzxUTMhqz/bUOAoCCzg9lT8YwHrvoqDGD8y/GsdJcYEwp0/kZ
	1+dAjQNgmLLU3ijQoQuIt1yTTMTdGscrcG1mhY4XLhqpR2XSPbVTvzEF6i6q32opY+XBm+0d9aE
	cOw==
X-Gm-Gg: ASbGnctiL4IWOYqf5pdihhe9LE61wYGrb0hYDXaK1tcOmpOkRsARV5fOHjZbo3sEJet
	qwlNkyxe33u/U5d/7h0dQur/iCja+ZYAS67XSCjV5a0Y1HbGIjCRB82dCwRvFXqIsOXXTdUOSZW
	A0aoIFTmH46qAXwFOt4MZU41LXKNOWxYcQu1E+aXeoxj7rnzY3sI01EoVxrOgu+M7E0y2/+Q6iD
	4fAiQ0pGkINvcfR9LhdB209TrjmyhB9GEY3LORmGuTxFnH+faFZHJwhSZxvrU64A/WvhE/1BO6H
	D3ce4AEFpAbdhbL5mdqouQU3I1vOzx8q/bCL+IgNh3ia8VvQt5+4eOc=
X-Google-Smtp-Source: AGHT+IHwCoHhUKayX/5LvmbtknV+lvp1IMMsaYcB99UhHFnZLLMcZ6XZuf/4encarQkv67jUx7fv8g==
X-Received: by 2002:a05:6512:3b9a:b0:542:98bb:5686 with SMTP id 2adb3069b0e04-54405a0d914mr1477978e87.22.1738788851776;
        Wed, 05 Feb 2025 12:54:11 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe105c0sm1971157e87.98.2025.02.05.12.54.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 12:54:11 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5439e331cceso239041e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:54:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSt5aOyvrAqajbgcPGUN4RidhiAIHES2vjnQbYiGtSuxoC+ShlgSzRI25BzawuabqFwm/NvRl69nGf5ac=@vger.kernel.org
X-Received: by 2002:a05:6512:3f1f:b0:540:3561:8897 with SMTP id
 2adb3069b0e04-54405a4387dmr1581740e87.39.1738788848739; Wed, 05 Feb 2025
 12:54:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205094734.562992-1-damon.ding@rock-chips.com>
In-Reply-To: <20250205094734.562992-1-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2025 12:53:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X99T4EQzY4VYdDoiiYdUPZkYtGYsZ6Aj5v1g2sW-i=-A@mail.gmail.com>
X-Gm-Features: AWEUYZlvxLY7nHdhy0kireLndag67-xwYIEC98ToU3plgocErcjX-uvcWTYiMyY
Message-ID: <CAD=FV=X99T4EQzY4VYdDoiiYdUPZkYtGYsZ6Aj5v1g2sW-i=-A@mail.gmail.com>
Subject: Re: [PATCH v7] drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
To: Damon Ding <damon.ding@rock-chips.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	dmitry.baryshkov@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 5, 2025 at 1:54=E2=80=AFAM Damon Ding <damon.ding@rock-chips.co=
m> wrote:
>
> The raw edid for LP079QX1-SP0V panel model is:
>
> 00 ff ff ff ff ff ff 00 16 83 00 00 00 00 00 00
> 04 17 01 00 a5 10 0c 78 06 ef 05 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 ea 4e 00 4c 60 00 14 80 0c 10
> 84 00 78 a0 00 00 00 18 00 00 00 10 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 fe 00 4c
> 50 30 37 39 51 58 31 2d 53 50 30 56 00 00 00 fc
> 00 43 6f 6c 6f 72 20 4c 43 44 0a 20 20 20 00 3f
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>
> ---
>
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D927765
>
> changes in v7:
> - Add &panel_delay.disable and &panel_delay.powered_on_to_enable
>   according to the datasheet
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

nit: in the future, please post patches against drm-misc-next. I had
to resolve a context conflict when applying.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/edp-panel: Add LG Display panel model LP079QX1-SP0V
      commit: 0e1daf2b32dc85559cb1bb67e91c5a42db332cba
