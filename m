Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A26F3208
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750098626; cv=none; b=AScLEAYsmmJ08hlyRTIAW+4U5whi2HehSHQPr3qHXP/z0h7SRhoi9oXLX9vyCwuRhb3r8FBud2QSJ+zT3ye4SRacVZeZ91tVYPaWV4xFp6K2haAVpPlahCiBD0oezPy7ENGGBwvJ3nGm276csoyydDUOTbZrOHFWvzAe2nG/ALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750098626; c=relaxed/simple;
	bh=u/p1MEeH0LvXhyjPfsX1jOREtL9EVmvllrVaj8DvJXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdWKNabIJZ9fu8PbNwzPUxUYZ5udw4dD8+IzKLSLtKGFVsBh63h6qOY22mRQu1o3ZZTIprlhyOz32eLdXg8NnxX6qYrl9yEnF6Y88lWDc6ezZSxEkmSTLZ9KJmOcVi5Rlya7hXT+O3XBjpnWLxO1Tlwqrjbq7o6t1ca3nA5awI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Aumf3X1u; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Aumf3X1u"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553b6a349ccso2466673e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750098622; x=1750703422; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V1WMZi81PHwr4jBJZHKXDmlp0Cgol9Gi5kwiUzgCVRo=;
        b=Aumf3X1u6ywHxqC06wCHF7hTa2KJrKXt13B8Af2Y7nxFSfHS3L85o5ynuS5WP5hjo4
         iWFCFNZK0Ul3VLAR0q0Ry1znlum3AziK8bGZVGfOp5KPs3Un2ngdKRQgr6dpxoIL58vA
         euqkyXhj5oydE12niZYNUd1wPrijLaCoOlaVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750098622; x=1750703422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1WMZi81PHwr4jBJZHKXDmlp0Cgol9Gi5kwiUzgCVRo=;
        b=T3Dq1r798yLVTpUt/Mb4pfn7R6b8F1LQZ3TV06QUBD6ZxGqGUt5FLzbdB+kx3fIfxM
         vIc2hgv32GEtPHYNpJmlPjNjMGqKxE69bpgEGPFvr3hbNwwth7u0mmnYLaep58eNxI81
         FPuMLwUscUXruVItOaZIFTo+Fks3BmwlXoQijYbS/wfyjfhm3L5U+HNLtYt5hKlznr3E
         tSVxijCQzeY9NNFnanqwlIeaB1t8icJMa6wc9VsKtl37iad/AxvLHRJQ9b3djmqeijIk
         AMznlvF4UiJePpNUCHtuPnamL6bRxvnEQ9n8OxTE6DuOJlla78cb5ULujnCaL66af3s9
         MCzw==
X-Forwarded-Encrypted: i=1; AJvYcCWVSe7LHiUrzi4QZhHMXNOBI8xE66CgzhJA1XyWMMgqTjB5KeYcc3q2WiPSLGaKE4xqj5zE8wPR8L1cDiU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm6yQYtL6yzPhkRMTvnUmgyNBwEUi/3UrU6fUXCo4czEuPoXNW
	CwKyyG5vCepc8gDVxpfN4cAY1hHlP3aOIn+JmFLvZ+xs1WEKMJJhU/BWY1vD61aYs1gocHez8SU
	YY8c=
X-Gm-Gg: ASbGnctnKyC8rtxejZocd9apCQZMilxb+njBfKOepOt9zLshrhi80zy4e+qD07//84G
	8hyvRuxF5hSUwHI9EoqBl6AbruG2zx3KZBFCgJKNBasuynJ0oxKASbNpswZz1Wsii4WaKoQjttW
	alNbCoxiE6M0mc37AWf3SLJmCKnmF8qkKzToHWoYZdbPHurtb+I5xbz9T4UaJA8Zd/oVsiVof7n
	T2kV/CUf2ym7Dc/pWesO37nyrcYWmaC0oNwi9EGoDEiQ+IAH/RguhXpLqSWGOoyQ5mp8mS0NFCz
	FjT3URu/lc1YclICZO2meusDvFzgM39lpxRPOVDHKbKY3xTEqOYk4ZMb28fPGeSM5nmxGWMnUWD
	rpIcJlEi5dsOv3Rg23rRA9+6jPhOX
X-Google-Smtp-Source: AGHT+IHKZ6TZY7jNBj4UsNqGhFme7pIRH9/oCK1n4/xOVK+Rr7wE1WntQ2XLGEnXnKNMxvkA0WPqBQ==
X-Received: by 2002:a05:6512:b97:b0:553:2420:7c41 with SMTP id 2adb3069b0e04-553b6f28318mr2020033e87.26.1750098622159;
        Mon, 16 Jun 2025 11:30:22 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1fd63esm1637004e87.256.2025.06.16.11.30.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 11:30:21 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32add56e9ddso38950101fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:30:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQddJUTza9jQQ1OBcUs0Q5nXA8fjT2RAXWklkfWTPOTRIW4wJEor6sB2SDuq5UrcPshWscBchIUefBxIc=@vger.kernel.org
X-Received: by 2002:a19:8c01:0:b0:553:518d:8494 with SMTP id
 2adb3069b0e04-553b71156f8mr2003965e87.54.1750098621173; Mon, 16 Jun 2025
 11:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org> <20250616-uvc-fop-v4-5-250286570ee7@chromium.org>
In-Reply-To: <20250616-uvc-fop-v4-5-250286570ee7@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 20:30:08 +0200
X-Gmail-Original-Message-ID: <CANiDSCur8zys_CSZC9+-QdD0U556A7HLLdSN8mJuOpXm+Ls8Wg@mail.gmail.com>
X-Gm-Features: AX0GCFuSVj4gR5PIv06qRxs6vkwLfVIRJba9StmeI5qYG15kbJz24DCaX_Q8qBc
Message-ID: <CANiDSCur8zys_CSZC9+-QdD0U556A7HLLdSN8mJuOpXm+Ls8Wg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] media: uvcvideo: Use prio state from v4l2_device
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Hans Verkuil <hans@jjverkuil.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello All

On Mon, 16 Jun 2025 at 17:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Currently, a UVC device can have multiple chains, and each chain maintains
> its own priority state. While this behavior is technically correct for UVC,
> uvcvideo is the *only* V4L2 driver that does not utilize the priority state
> defined within `v4l2_device`.
>
> This patch modifies uvcvideo to use the `v4l2_device` priority state. While
> this might not be strictly "correct" for uvcvideo's multi-chain design, it
> aligns uvcvideo with the rest of the V4L2 drivers, providing "correct enough"
> behavior and enabling code cleanup in v4l2-core. Also, multi-chain
> devices are extremely rare, they are typically implemented as two
> independent usb devices.

As the cover letter says, this last patch 5/5 is a RFC. We can decide
if it is worth to keep it or not.

The pros is that we can do some cleanup in the core, the cons is that
it might break kAPI.

I checked in the debian sourcecode and I could only find a user of
PRIORITY for dvb and was optional.




>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 2 --
>  drivers/media/usb/uvc/uvcvideo.h   | 1 -
>  2 files changed, 3 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index accfb4ca3c72cb899185ddc8ecf4e29143d58fc6..e3795e40f14dc325e5bd120f5f45b60937841641 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1728,7 +1728,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
>         INIT_LIST_HEAD(&chain->entities);
>         mutex_init(&chain->ctrl_mutex);
>         chain->dev = dev;
> -       v4l2_prio_init(&chain->prio);
>
>         return chain;
>  }
> @@ -2008,7 +2007,6 @@ int uvc_register_video_device(struct uvc_device *dev,
>         vdev->fops = fops;
>         vdev->ioctl_ops = ioctl_ops;
>         vdev->release = uvc_release;
> -       vdev->prio = &stream->chain->prio;
>         vdev->queue = &queue->queue;
>         vdev->lock = &queue->mutex;
>         if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 3e6d2d912f3a1cfcf63b2bc8edd3f86f3da305db..5ed9785d59c698cc7e0ac69955b892f932961617 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -354,7 +354,6 @@ struct uvc_video_chain {
>                                                  * uvc_fh.pending_async_ctrls
>                                                  */
>
> -       struct v4l2_prio_state prio;            /* V4L2 priority state */
>         u32 caps;                               /* V4L2 chain-wide caps */
>         u8 ctrl_class_bitmap;                   /* Bitmap of valid classes */
>  };
>
> --
> 2.50.0.rc1.591.g9c95f17f64-goog
>


-- 
Ricardo Ribalda
