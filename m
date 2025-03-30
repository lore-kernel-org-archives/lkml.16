Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590291AF0B4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743356908; cv=none; b=GRY8wrSl4KV7azLYeUCg9xocg/EkFKq8WidwuQJKwzajbpYQ/L9tesmgAiFxvRrkCuMl9LP/yTuRdnxBgnpj4uZnZMFcqhbtNRplvNrBOegqIhBOTyyIcD/rvR7qV3VTe8YfcbMax2YDA9R3SpB+Erz+R7lYdB76pm0pblakQbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743356908; c=relaxed/simple;
	bh=+rbwlh2Lpi252SEHsNYj7QdcLxm3jaNax1dXG9Xukg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHQ9iE9XKEFLHxkjnMal6fJDLHZeJE53viCqdu0DV7VbaifY2tBNb5IWtXvKFkTSZRqFXDZLVc3KDPfiAZqTV9Marc4bTu2v2qikODVIsslLxh2XERtq4EYNM2WV7qMp10S8BQ+pdALs5+Xs5nuCaExOcALIE/D6bHRZpJDWZPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GanEaDFg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GanEaDFg"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso2958542f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743356904; x=1743961704; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8bnYz3+E08nz4vPfLMJN2WUkwfYbX9/TWfImS8zWww=;
        b=GanEaDFgQaae5voPHlVG5dIfda/CnOPZ9aJoKKg8a65oM+U2eIX/Xp+7KQQNs6eE2Q
         Sci1D7iqU0l8hoXw5RUhhY6DeLhsms6JqqEBI1JN+7WxBVfk8m0/kf69Z9TO3XCk+3QU
         DIZKIo/mEzJbXyclJbiK1v4wDUuf/kTjJJM5MtQnlzTNZHIkPvncM+A75/1u7hqQsCEa
         iLoND67Hzbt12K3Ws9mMeNRUNfDzwmxGPZLpegF+e5Rzk/+GY7/YNFLuxowQRIeCt42L
         82bhdableZ84PpoEkpeM9hPPQnTyTvOVbDnYqMcimN73OKzbn4/IaasEfV7E2lLp1cej
         jthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743356904; x=1743961704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8bnYz3+E08nz4vPfLMJN2WUkwfYbX9/TWfImS8zWww=;
        b=fNRfCzyX4h6GmY/+ufOFf26AqWFeqW0njWR8GQfCxZ1cbyCB1CgIi37zIHcr9/s++C
         s9a3QN8w2l+fnvv/o5s2/dQnoAsAMvFdjZ/XSnzDyUAzRoF2qhIUc0tkEWs7NY0TRuO1
         48tyz8RN9UDG0kQVs6JfVIT472eI2Pn84q7XBIkM+oX9urXk1sA7KBUJhFb2897CZqxk
         dC3W6Or9uSePMykrrb8ujPxesfzrX8cz7NnYziFWvYE5jGch74HnsgyE4k/ZF08FgP1W
         aPbbebmljwwcu0Z0NgOIzhPsudIPRgWEfrx1zzSLBcKwzmjhqIAKpCmljNOiGG0EDxWR
         r5wA==
X-Forwarded-Encrypted: i=1; AJvYcCUnbuDnygtZm1qpBmpNl6k8yQFLyf91ap9PKHwSfjX5ZMMSMF4ouOPqYOLc2ws4S67a6GF8VhWRZzCXxGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlJtwS5EMzH/rWOPK8F9eSxO0uUY+wIZPQfhfjVzPTSJOyKkyl
	XpQY2MOHh8IGayV8x7tAg3g8r2oa2RttKLXLjdtOEMXHe31a0fdEC8Wik84CjlXTFY0lFFOD7Cx
	0uga/9iZtuw1sgDod8NgEmkeL0eQRmJZKQVWM2A==
X-Gm-Gg: ASbGncssk1hk1ZKj3KBgRHrPL7y8ueJg3zEIk02AqEElq1PI2n8WCzNKbyKDUiNaIcQ
	nfhYDJL9T2O8KbAqtc8HKUAzbU9b6U6ZVT/rj7ctoteEM4jCNJTH/yl5RbrJE3WM3GO93ovWYqF
	PU+II8N0rSBJyJYOk+zuj4OCSkZmeK3SNQw5CAzPYGaMNipsqJr9pWRwjr+X0=
X-Google-Smtp-Source: AGHT+IG79/a/46o2+sWdSeSPFtl5xnoQ2heiea7o699JBwREuKo4OWeTmE61/YDvN7FF4/h2efgSCu7+R2pWTQXg+yY=
X-Received: by 2002:a05:6000:40e1:b0:390:e9ee:f27a with SMTP id
 ffacd0b85a97d-39c11ba5136mr5357215f8f.28.1743356904556; Sun, 30 Mar 2025
 10:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v4-1-85ef0991bdf8@linaro.org>
 <CAO9ioeUhx96EYXuMZL0LHBb=Z-prkwX0mPETMvsj-c1qddPtXg@mail.gmail.com>
In-Reply-To: <CAO9ioeUhx96EYXuMZL0LHBb=Z-prkwX0mPETMvsj-c1qddPtXg@mail.gmail.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 18:48:13 +0100
X-Gm-Features: AQ5f1JrClIRKzKQQ3iyO9g--jGlWaoJ7hyeVGCPzif40VYGm9gtHa6Z15nDZeU8
Message-ID: <CACr-zFCN25V0zAttZ_7sSQN3UUEdEdkAv684cuRshqnRtExSKA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 30 Mar 2025 at 18:45, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, 30 Mar 2025 at 20:31, Christopher Obbard
> <christopher.obbard@linaro.org> wrote:
> >
> > According to the eDP specification (VESA Embedded DisplayPort Standard
> > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > the MIN value as the effective PWM bit count.
> >
> > This commit updates the logic to clamp the reported
> > DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> > DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
> > the behavior is modified such that reading _CAP_MIN and _CAP_MAX
> > registers is now required to succeed. Before reading these registers
> > was optional.
> >
> > This ensures correct handling of eDP panels that report a zero PWM
> > bit count but still provide valid non-zero MIN and MAX capability
> > values. Without this clamping, brightness values may be interpreted
> > incorrectly, leading to a dim or non-functional backlight.
> >
> > For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> > ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> > supports AUX backlight control and declares a valid 11-bit range.
> > Clamping ensures brightness scaling works as intended on such panels.
> >
> > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> > Changes in v4:
> > - Remove unrelated whitespace changes.
> > - Remove unrelated commit change.
> > - Add note to commit message about changing read of PWMGEN_BIT_COUNT_CAP_MIN
> >   and _CAP__MAX from optional to required.
> > - Link to v3: https://lore.kernel.org/r/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org
> >
> > Changes in v3:
> > - Properly rebase patch on top of latest version of drm-misc-next.
> > - Make patch more generic by clamping PWM bit count to advertised MIN
> >   and MAX capabilities (suggested by Dmitry).
> > - Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org
> >
> > Changes in v2:
> > - Split backlight brightness patch from T14s OLED enablement series.
> > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > - Rework commit message to reference eDP spec.
> > - Rebase on drm-misc-next.
> > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 42 +++++++++++++++++++++------------
> >  1 file changed, 27 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index e2439c8a7fefe116b04aaa689b557e2387b05540..b5c8a75d036b5d65262417de363409e3ff3f4560 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -28,6 +28,7 @@
> >  #include <linux/init.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/kernel.h>
> > +#include <linux/minmax.h>
> >  #include <linux/module.h>
> >  #include <linux/sched.h>
> >  #include <linux/seq_file.h>
> > @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >         }
> >
> >         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +       ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > +       if (ret != 1) {
>
> NAK. See previous discussion.

Sorry, I must be blind. That is blazingly obvious to me now!



> > +               drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > +                           aux->name, ret);
> > +               return -ENODEV;
> > +       }
> > +       pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>
>
> --
> With best wishes
> Dmitry
