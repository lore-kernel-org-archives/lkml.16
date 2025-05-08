Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A04223704
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746705705; cv=none; b=MHO+CpNGg/XZY8Vb/Q9bXT293Sbgw26kjBfhDtsVngnYfyX07SkZ3oJQqm4AKMqVcSiCLwq3wHC0uX1lj3LyJWtQFOgYnlzDYyYsFDyNOxCjOO2iSh7bwAsNc1fA6KzB3S9YI6YuXLmv6I+PAmD/ozFNF4RkSkdK/6cKjFN64tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746705705; c=relaxed/simple;
	bh=aoq+1ai5jljWfY8lvpWzm/jc3o3kYngisUx1pgYXVV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIPmk3nKcwIzuYvwqotDIZS1/Yh/vaZExpOJsP7wxFxOQlYvRT6DHZ3CDc7NCsNNA5nJ4/iSbfcaXlVNYiZJsJdwxLhwrvLa18Z76491SXHDkjycuZlgJ8Tfx31yom10npTq6EnTGZ1jjmZF8JS/ns0I3Md/NHt5iMKjdt6u8Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cx02ovlt; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cx02ovlt"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549967c72bcso972480e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746705702; x=1747310502; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=koC3Xo5VETzaFWT0ZHdovmwZ2LQFRyK7891UyO5ffiQ=;
        b=Cx02ovltxrh5APmiVZXxwdW08o8aVEzz+YfcxpPb/fpqyd0sRMgOqcfH4qgyzM9lJd
         WPCjbOjAkmEyKbo6uo9mjNu3DGvW8H4FZhn0r1mnBXgY8U1QoGXTKTtRad9iXOjoO9bA
         QVO3n9lVCI4ftBlw84PgBtstN/ujQLPqS8EXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746705702; x=1747310502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=koC3Xo5VETzaFWT0ZHdovmwZ2LQFRyK7891UyO5ffiQ=;
        b=xAxXKr2C+ejk5+5dYhA1oEDL2DDoSeEg0u6w1s8sGcBmcl7yoBHLFdfsodURZGkgJx
         LjIXoTQzFA5MLxRNH2xQ+bcl3nVqeHGWc+U4kKxIpBapaTJdtJWrVv5TfO5lRlJZx1Jl
         ZSfmMKLO0/EU9aXF61HUUdDXwALo/jpAckr2PPdfflQsmZt9yERbm5SNZ06HMYWuthKw
         jV7BPBrphvkzmmbkbsfpCI/Chs0RNoypa+6NrNLf6DTQbidO/iUP/95vxndxy2Qp/MGF
         oNp0z/YGai/aHgv7BrCDYU8CBNukyUAEFx4fPH2kz3UytUC+x3OHdpwrqEnXw289MT8X
         m+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXaiwMswvKlvgdgZ15z7SNeLUPp5kPBrW9gVUhNU1P5Su0WAKIo/kUQv1UynSP3e6WUab++xEDHN3I4FwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpT7q4TKRA7L2QFcTuOtF6F2ukouVysqH4mn27+iZCxf6PP53y
	B0qfeBBixqx5EcBiejoCZZUDELQVc4MraI1bdi4RvqXAUbwjXtpcn7oXn1uocyoPXHOpEixWcno
	=
X-Gm-Gg: ASbGncs38Lsh0/CPIOGSR+e2e8ryCWW1LO2CyadqaAa5G6H7cRbvqTsxiXDc+koS7dd
	i2fGGwBLNWooN7RCM+Br94vy8HNSchu8xVjAHVgkLORDdB+giYMaiI+YxnKK3VKgkn7IkLNUeju
	8tG0TPmrjuPBVEhmuhAW35FTz3HF+sKTo1lD7WR/fBngHsMCMcaSKBRkBOmWOjXJdoToCeB3qfo
	c1n4t+RDFvbfq0nXj9BYHswaYI5IpuGY+JkZryG1YWLlk00m4ukBxCQnBagsSf+EGAjaHtZ+NBH
	WWqcV8UcZwHoJNuw+/6KQrTRyeFgwhQ0sB2KLj4PdAvBjgAGYL03vKd+m41gH/F0uwsGoxBkKNx
	dxq0=
X-Google-Smtp-Source: AGHT+IG1jikSxszrTT0ybhrx0B6SwE44G8Vq/CQgYRxlx/kyr5vZOQLaY5RXJ6/mSyTEztHVcfHlXA==
X-Received: by 2002:a05:6512:1050:b0:54d:65d9:9988 with SMTP id 2adb3069b0e04-54fbfbf50f4mr974026e87.23.1746705699281;
        Thu, 08 May 2025 05:01:39 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc356e421sm110246e87.231.2025.05.08.05.01.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 05:01:38 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so1158581e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:01:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtJRmPq6vDpc6DGVbFbK8VBOcG5zViHXaM3vJ1IptAfC6war8+HH6GJHNLywaGq/JneqkVRVQxJh9AAsY=@vger.kernel.org
X-Received: by 2002:a05:6512:1395:b0:545:d27:e367 with SMTP id
 2adb3069b0e04-54fbfc3cacdmr986715e87.42.1746705697261; Thu, 08 May 2025
 05:01:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508015542.148301-1-ccc194101@163.com>
In-Reply-To: <20250508015542.148301-1-ccc194101@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 8 May 2025 14:01:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCtbR=CnLmMG3cJi+-rVFaP7F1Cuk6OMe_ojVKL=jH68hg@mail.gmail.com>
X-Gm-Features: ATxdqUG49aCmh_tAnQUZOAQ8bUDfDWm2eca2unCOw_TMwSU75E444Iw2hlXhj8Y
Message-ID: <CANiDSCtbR=CnLmMG3cJi+-rVFaP7F1Cuk6OMe_ojVKL=jH68hg@mail.gmail.com>
Subject: Re: [PATCH v8] media: uvcvideo: Fix bandwidth issue for Alcor camera.
To: chenchangcheng <ccc194101@163.com>
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-kernel@vger.kernel.org, chenchangcheng <chenchangcheng@kylinos.cn>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi

Could you please resend ccing linux-media? Otherwise the patch wont be
processed.

Regards!


On Thu, 8 May 2025 at 03:56, chenchangcheng <ccc194101@163.com> wrote:
>
> From: chenchangcheng <chenchangcheng@kylinos.cn>
>
> Some broken device return wrong dwMaxPayloadTransferSize fields
> as follows:
>     [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
>     [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.
>
> When dwMaxPayloadTransferSize is greater than maxpsize,
> it will prevent the camera from starting.
> So use the bandwidth of maxpsize.
>
> Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505072016.LlOxF8BG-lkp@intel.com/
There is no need to add the reported-by and closes:
The patch has not landed any tree yet.

> ---
>  drivers/media/usb/uvc/uvc_video.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..0d5c17509ceb 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -262,6 +262,15 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>
>                 ctrl->dwMaxPayloadTransferSize = bandwidth;
>         }
> +
> +       if (stream->intf->num_altsetting > 1 &&
> +           ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
> +               dev_warn_ratelimited(&stream->intf->dev,
> +                                  "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
> +                                  ctrl->dwMaxPayloadTransferSize,
> +                                  stream->maxpsize);
> +               ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
> +       }
>  }
>
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
>
> base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
> --
> 2.25.1
>


--
Ricardo Ribalda
