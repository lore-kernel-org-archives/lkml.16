Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C264AEE2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862497; cv=none; b=BAWKbA0j0TzBEbzSt6ZPyV+FKmpO8VN+PjgFlkewDxZrl1YEJVtaKuGTkpdp4iJy4BqzVw6dwtlzGRhdllSURUBb3kihOLYW+BRnx/8BWLJu/8SupAQfWHEU8T55PlZrKOt8kYqZbtP/W+KCgRipo8IS+WSOTmsiYEMzsxcSOEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862497; c=relaxed/simple;
	bh=jWXOCVZkFHj/VcDgv2xU9asu2w3m/3zaM/fO1ILaYV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrRlUhWUBYJljc03NyQdpNvadY7fur645NpAdJ+pY+YUqT+ymXvOmueyoHCZ6smqEy/TcBG9+uefZauHJ3E5t/sAlAFFcHeHTYsl45L24RJbf1y0aV2QPiuuUno7WWZle+k5Pv08Qy7TCdOUf8D6IaC4CzddWOu0T895tf/aKdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ndt4JKgI; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ndt4JKgI"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ff4faf858cso35804467b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745862494; x=1746467294; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Br89HP6MhUe/ahwBGiB5/BbIYpp/iTR1g5Mpqa7I33k=;
        b=ndt4JKgIzhVXVKP9AIQoYHmcr0mUqiiyOVxK1wNfIy4eCvk3P6PVh83Adnt7YJA2MD
         ePM6v/EwwYPYdq4ynj9rZxJ/Sx+XLJoHmp9eYQJWM74yQ0BZEOy1QEbjFKoEyO2A/jXe
         Tg+ISlO8xgZCFjqv7hn7sR/w2uoBdxrZhcuJNeNQul1mv6jsTHvKp8i26MPEqdHynKEG
         eDKo6OlLdyVIR6MYiZ+wn/5h+6uJNuhfr2af4uY+i5mjG/IvJ44Rl0AYxhwe45TnNQDm
         xaa+UihRsAFaDdmkVfCEdCPGGtzE+l+S/v5Ob3BjN0USNhI+tBSSHKdoDTiBZ3ZJUxqF
         oh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862494; x=1746467294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Br89HP6MhUe/ahwBGiB5/BbIYpp/iTR1g5Mpqa7I33k=;
        b=cyeT3j23ps+j2GCAijQ72X6ZbbfOTfLArdv6bZwmej7Q2hqoDlcJwiFuCQxjYy8eLG
         2JhAeh6yI8P0fhVJ2xFCkF9xrXIg+aR2RhF9O09JPG2nk+Fg9tF8Lj8B67f3YcAOejqg
         WWwt7hmtqJfzit1z7vIfIX3DEaRiaTrCRrYlDBydxgR52ib59xQcbtxKDpUTDtERFBzD
         LqflBX8qQUmhfdW24sCmUKtesvoF0yR2v5PY3mz0bkXmzPHNBPYvmMYgdTuhizciVpxc
         XnO1MAHhMSzAnbY2UMvDuTJwR8df0JTM2Jsz9FH7EPEDcvcDzPRZ+vL/4LlvCrQ+HPBk
         WXYA==
X-Forwarded-Encrypted: i=1; AJvYcCW3fQ3Bi30QkwMT5bk1T+d7dOcwoKbYAA5e6aaJJW0X77oIc622B50n/PppYVRTyp5rn0QU9SrS2waE2Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMn/zFZomD0UToCsDxGxFN+GreixGGL0RBUqHdpjrEEcYFwyrm
	XTlK9bsJeXzaWzxcdUaVM0U4Bcith1WAeJyoWvdme4ezry6TBHF5hONJAfsybnd0h9NUd6Mq//R
	IrkCn144ytUm3uDD7SBjjSR4dh9jmvMCt27abSA==
X-Gm-Gg: ASbGncsqZWGxmttJVpjALMzCvQxYePbv3VGRoQ/ZdwBsY6POdlh3kXI4DkTG15Wk6Fh
	mQYB8X3g4ALkS5ddgRgeusazniOGCXagVb4ysXctkhZUlcVNI5RDS8CsVvc2YGKU9zUQs2xg+Gg
	dgffbgdkQsIfUWRBpFTuKw/Rr7oxDb1ngowC8NFUrwf9QhV8cxFI5p
X-Google-Smtp-Source: AGHT+IGqT38ux5vaBWGblzcdGmBhZyaMpSO70W/U+56Y5rFaiMiEKupGmQkwT4XDzj6P2STWaAz7Pgso32FQ1wf1fIw=
X-Received: by 2002:a05:690c:6d01:b0:708:3a47:3d2c with SMTP id
 00721157ae682-7089965c286mr10536507b3.13.1745862494536; Mon, 28 Apr 2025
 10:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426-vc4-audio-inf-probe-v1-1-a500785b71df@gmail.com>
In-Reply-To: <20250426-vc4-audio-inf-probe-v1-1-a500785b71df@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 18:47:58 +0100
X-Gm-Features: ATxdqUGhyN8MsnmzldLq3CrZVM8rsc0UmD66HlBXP3YuWCGQVL9or9qwouRQw84
Message-ID: <CAPY8ntDqKBBt-uOb9m58jKhCn79RE26890X0EdxKiwWrypXN4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: fix infinite EPROBE_DEFER loop
To: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Gabriel

On Sat, 26 Apr 2025 at 07:23, Gabriel Dalimonte
<gabriel.dalimonte@gmail.com> wrote:
>
> `vc4_hdmi_audio_init` calls `devm_snd_dmaengine_pcm_register` which may
> return EPROBE_DEFER. Calling `drm_connector_hdmi_audio_init` adds a
> child device. The driver model docs[1] state that adding a child device
> prior to returning EPROBE_DEFER may result in an infinite loop.
>
> [1] https://www.kernel.org/doc/html/v6.14/driver-api/driver-model/driver.html
>
> Signed-off-by: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
> ---
> Starting with v6.14, my Raspberry Pi 4B on the mainline kernel started seeing
> the vc4 driver looping during probe with:
>
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> Registered IR keymap rc-cec
> rc rc0: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0
> input: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0/input3503
> vc4_hdmi fef00700.hdmi: Could not register PCM component: -517
>
> repeating several times per second.
>
> From my understanding, this happens due to the mainline kernel missing the
> patches to support audio portion of the HDMI interface. In this case, or
> other cases where the sound subsystem can't create a device, it returns
> -517 (EPROBE_DEFER). All of this is consistent with what I experienced prior
> to 6.14 as well. However, prior to 6.14 it did not try to probe infinitely.

Mainline should have all the bits for HDMI audio on Pi4.
It doesn't have the bits for Pi5 as it needs the newer DMA controller.

> Bisecting 6.13 -> 6.14, it looks like
> 9640f1437a88d8c617ff5523f1f9dc8c3ff29121 [1] moved HDMI audio connector
> initialization from audio vc4 audio initialization to vc4 connector
> initialization. If my understanding is correct, this change causes a child
> device to be added before EPROBE_DEFER is returned and queues the device probe
> to happen when a new device is added, which happens immediately because the
> audio child device was added earlier in the probe.

cc Dmitry as the author of that patch.

However I don't see an issue with moving the init back to vc4_hdmi_audio_init.
I'm not an expert on the sequencing of things around the audio side
though, so I wonder if Dmitry or Maxime could comment.

The patch could do with a Fixes: tag if 9640f1437a88 if it is
definitely the commit that breaks things.

Thanks
  Dave

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9640f1437a88d8c617ff5523f1f9dc8c3ff29121
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index a29a6ef266f9a5952af53030a9a2d313e2ecdfce..163d092bd973bb3dfc5ea61187ec5fdf4f4f6029 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -560,12 +560,6 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
>         if (ret)
>                 return ret;
>
> -       ret = drm_connector_hdmi_audio_init(connector, dev->dev,
> -                                           &vc4_hdmi_audio_funcs,
> -                                           8, false, -1);
> -       if (ret)
> -               return ret;
> -
>         drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
>
>         /*
> @@ -2291,6 +2285,12 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>                 return ret;
>         }
>
> +       ret = drm_connector_hdmi_audio_init(&vc4_hdmi->connector, dev,
> +                                           &vc4_hdmi_audio_funcs, 8, false,
> +                                           -1);
> +       if (ret)
> +               return ret;
> +
>         dai_link->cpus          = &vc4_hdmi->audio.cpu;
>         dai_link->codecs        = &vc4_hdmi->audio.codec;
>         dai_link->platforms     = &vc4_hdmi->audio.platform;
>
> ---
> base-commit: b60301774a8fe6c30b14a95104ec099290a2e904
> change-id: 20250426-vc4-audio-inf-probe-f67a8aa2a180
>
> Best regards,
> --
> Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
>
