Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C212820A0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396765; cv=none; b=RCmu41tij21XyPLZoiPzFtI3QJrf8T+0ot1L7jcJHL5TmBOL+2QXOI/IO2zYHKdRM7gLdDuboEDFJn8hCwPUVfr9MLkioXJ/a2cXUuD+kkJTqNQWpbn2Fm0oUvRDYxTPyMOvSIUflv9Vj0l9yGfk1/R4HNGgVz9QWLszASALnQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396765; c=relaxed/simple;
	bh=p6/XqN280IkAJFF5P5KHzujwv+QUHuSl4ozM3BoRZsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9mIJm2ijy5ESPdTmZOOQ49QVoowjrSDbgLRUJsdwyf0T7nIg5yLQhAZwS9gJ+mv+HjGbGXX6HpoYGFzx7dQE5mvSYtOJWFt3fLOVbZxFXaJsILQ666MBTLbcUYhMTjG37l4tSJNQ4Rvswg6CRH1aR6RPF5LCvxQG0rUsT53/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bbIOktId; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bbIOktId"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32cdc9544ceso31094271fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751396762; x=1752001562; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OztRvSb6DKrNM/Q8mdgSvvCpah/vYheo31tsm4TiWc4=;
        b=bbIOktId9jNfSRVDzKS2t2v0mvSRzLibDd/oSlIkYIbgzczwQTFcX/HYXSOTmhzHoV
         UfbgB4xi8qCjXvUzMCfOkSjBw7uGfm/9BxHalXTcqNqJdCd3kEH2S+Am0bHPuEa847ej
         IOgx46lWnnBcF5LM5JMO17nS/tVsuWw04nvq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396762; x=1752001562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OztRvSb6DKrNM/Q8mdgSvvCpah/vYheo31tsm4TiWc4=;
        b=GOCJ4VdG4lmb7wIZnqMdRpqn2M856GcYcGNDqMqlRM7Qx5Etcaoh2RRQPGfg/BiVSb
         ViHxg2cyrQKxTHCzje8FF9hHwaH0aE4XFVlHdWpj1iRokSCYKe/TR/fjjxV7sapl0pMp
         W1jD/caEoEyNg5+8jMBVvf4FC4JvXZgYDRHctllsHDAlQP1dHgD0BXpgrT3EesRv4gYz
         d/Qr3LnSupNEhlpYJSvplzsUbouRLlKEpzBmffwc4eDKMQ6I6AXt9fP8LhRNxN9id2uD
         qprhEYTy4Lm8Uh37RaDLp0BKUKPgNDrFyvIY6YqtfcvVlpM9YtGzBP96RWsJ/2W7/R2r
         FyBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8cqBbh2u7OQLTpJxrC6K9td6lS2cDMGeanpb2mN4l6TPChRDv0pXbG83Pw5NwCa7w06bX0QI8OUM8mmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMx1N5wZidCUrsEMyoC5BMMBQxyXRhulw3EHxaTxrVAVrNIozd
	GYdtKuEh8hdFjhww6T82NGZIUeUdVd7wtYbc9OdVvEG/fp8Aeg/YziC1DpA2mMY2VT0J8HQ3eSI
	o4bhpjg==
X-Gm-Gg: ASbGncuc84EYmRuys+2P8h2/hnlOVBJOXFJfXK29clbiNt5K9zU2hOA51Gvm5M3RTnP
	r2MoQjdGzQKVUw+NGiI7RLS1q2BeonpjMdZLUOh1FJBAfEHAlDockxISMlIftuiKwb4MGGzLb3a
	NUXx2DQ1wmYsJN+/jaSph2qwcSe7T2urpYFbSDP+YA4Csmk1yYbVCvW7kH784Q0j8dmcuSjNHc1
	e2M/h8K6/aEKGHTN7z9jcJxp0+Za3Zgiz9PAzASYMISP4Y0grgTp1Fm7ki7G9rGo+jhVFU7i4Ha
	cEpV+nB8LEYLceeirxtjxAqtmW7OJx52I6h5Fxs7Y48kiyHHCNi+xn7Bwp2/5rkTunxohKZXKWU
	g4QIKWmB+xPyREU+V3QIQtmcB
X-Google-Smtp-Source: AGHT+IHqVq1b37VOmKvdx1bn5TbTxfl7U4mdFOE5d7DkDajbcuDqo2BLzoqIpuRsJzaHXtWsOyhgyw==
X-Received: by 2002:a2e:a588:0:b0:32a:8c63:a8b2 with SMTP id 38308e7fff4ca-32dfff514d7mr876151fa.8.1751396761775;
        Tue, 01 Jul 2025 12:06:01 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2deae10sm17001741fa.21.2025.07.01.12.06.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:06:00 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553dceb342aso3354049e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:06:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbPpQ0fn+fqLkpDMn225aJo0fx5EJFIhaRuidDXW9b1YwkaFCBt9Coo4ST4SCozPEcVNw17JM2zVKkGwM=@vger.kernel.org
X-Received: by 2002:a05:6512:1046:b0:553:d573:cd6b with SMTP id
 2adb3069b0e04-556282b48bdmr32743e87.10.1751396759656; Tue, 01 Jul 2025
 12:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701172556.117872-1-desnesn@redhat.com>
In-Reply-To: <20250701172556.117872-1-desnesn@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 21:05:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCvMwyPo2ZDnBP84oRXEON_1Lda3oWh_5YZ0aTh4kDc3DQ@mail.gmail.com>
X-Gm-Features: Ac12FXyehtMimSZE5IfsufDIGL7kQPuiODqwi6T9oMoHxqi-PVf6QJ_fyL41l3Q
Message-ID: <CANiDSCvMwyPo2ZDnBP84oRXEON_1Lda3oWh_5YZ0aTh4kDc3DQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
To: Desnes Nunes <desnesn@redhat.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Jul 2025 at 19:27, Desnes Nunes <desnesn@redhat.com> wrote:
>
> This avoids a variable loop shadowing occurring between the local loop
> iterating through the uvc_entity's controls and the global one going
> through the pending async controls of the file handle
>
> Cc: stable@kernel.org
> Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 44b6513c5264..532615d8484b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>         struct uvc_entity *entity;
> -       int i;
> +       unsigned int i;
>
>         guard(mutex)(&handle->chain->ctrl_mutex);
>
> @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>                 return;
>
>         list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> -               for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> +               for (i = 0; i < entity->ncontrols; ++i) {
>                         if (entity->controls[i].handle != handle)
>                                 continue;
>                         uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);
> --
> 2.49.0
>
>


-- 
Ricardo Ribalda
