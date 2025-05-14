Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8291BC3F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214245; cv=none; b=LyixKn383r8/xyaWiwiHUjkn6/AqPKy/uq4VITG+MjEwqBwHzCaryKMylUTQcQ4H66TXad6r3VmeD9Kc/aK2zvEsEU5066cTfeiFXe2te/RTR1wGCHdW3TKE92dqzuJnINoE3cl+NUF6Pk2unz4XTLw+qSQMiQnRbvQnuxZSS9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214245; c=relaxed/simple;
	bh=pEmPsXkZn2LmqIE/lJhivP5HaBIetx4VZNaXDTcmm/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCan6vbeMjkGKNcipy7qZ4SvNkJLtVqAdzyNkkBGzjVwctpZEi9FymED+IWydPAjCAL+CVVC+ooos4mGFW7ry2y9bYai9JwnR05dJFEB1xCQhLeS42S2KshVtMDCgvqjyevjckyW9Ac5v9bqAbmIN6GH8yy17Lep3DtOLO1lo3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TXca49Zk; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TXca49Zk"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3104ddb8051so68928041fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747214241; x=1747819041; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9l61OPQYUyrwxbE4WLEA0UZlwRfXVKqAkVC77MMSPUY=;
        b=TXca49Zk3xquiP4FDZe8OxVcWeKmm2swhgGg0/oQsGVQcfWHmPl3d6cIGnE41qEw/m
         icmwaXt65pMx5RDmDrbYFmX2T8OPB1d8II7w4tlsZMM8eLnzJIinUs2P2fE+C/PtFS9m
         QEAKyqH8mUYvWoRomh+IGPp47WKBEevF1y+mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747214241; x=1747819041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9l61OPQYUyrwxbE4WLEA0UZlwRfXVKqAkVC77MMSPUY=;
        b=B0siPfztGD5B5+SPJnGIuQQFenuQjjSZPD5zyAwGUpov96VThg8l9PPjT8BIDoxGSF
         C99GkEvEN/bL0+IVNmjmlYfW7jI+FGMPsuQEqCNvy/RQkF84VZiDQXhgnUvqKd2fWzfs
         Gv1q9bewK2aNbH6rrsvQpUnW5MH0YZZbXj8jUs4rmCRgN+UTnNnPIpEmqe++bvcNDUPZ
         49lSiQTwIelHd3WBEWSVMkLsK10Jor/ZrWpMpOhBR98TnGYzHiR5GIm/Ekp7NQ8sAmMI
         sRKkZ8xnNqKitLEUE9rzjXrUNpsyafQJQX0a3lsDCfP/5kJBJayqKrWcg5CkpQyCywIW
         gdjg==
X-Forwarded-Encrypted: i=1; AJvYcCVAoKNVp4Sgn/nzlVXfhZBBq7xRjunUfoc9+SK7SrWyqWEP1iNzBbI+wwE/bAkl3WLCOfd3KyLylINwyHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+Nkc9NLPCm3YE85BV4Cv6Nx4mHOxyzQL3L0H02q+Ps3XesAZ
	rVFxiSnytneofv+1JCBqbxC5tYFKUFLKIDfYfRkQ48HD3Z/Q1prgoKlHq1rC5Qeg4dWvvJSy8Qg
	=
X-Gm-Gg: ASbGncsObX65ADZMbczLp3Mtr5/u56rLaXAX7ALGk57TVsSlwOPo9+pVhzdNZS4hOcM
	dQUQlmTWzmqsi7ZFWx1r2QyaYRHHdf7bCSP7sYjD+VnlLse/GVKerBzPBdRBQCr6BNHr00+fKdP
	aV14BwCXDaUyG/UVOKtBXz7nWsK3D9eKueSndra09bS3QR6zYJ7frgUibvO+MT4SYWAFBp0J6Wj
	Fl16ZkUPN3Xfs/x1pdpPNIve11zrq3+pEP6tom38q4PO+3YOter9vXwZ/f+Qahk015NR7ilqyKk
	bBxpYEvkSL/CzJtJBlSjKXmZa2VCjFWhHOQdne4aXf7tnJs3jupZYPtjtldofYTnCnnrWYZ/5PW
	KiiYY+R9M5tkgbs2gPA==
X-Google-Smtp-Source: AGHT+IGTI8/jLc0MSYivDbvsa3BnNpwpK0AW7mTqsFIKfoFGjnrnK3YxQUXQQG4Kk4o6I8jDKrWfmA==
X-Received: by 2002:a2e:be0b:0:b0:308:fbd5:9d2d with SMTP id 38308e7fff4ca-327ed2015a6mr10443611fa.37.1747214241114;
        Wed, 14 May 2025 02:17:21 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c3502dbcsm18990171fa.66.2025.05.14.02.17.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 02:17:20 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3104ddb8051so68927651fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:17:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUd3YG1q1G3G6OAEjXB80HawX7n450Zlf1q2jLx3NxsxgUsdh3BTZj1b2VqlFwiLYxkdwbtNO/NKK8UYBE=@vger.kernel.org
X-Received: by 2002:a05:651c:2206:b0:31e:9d54:62bc with SMTP id
 38308e7fff4ca-327ed0d66a9mr9898921fa.14.1747214239624; Wed, 14 May 2025
 02:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510061803.811433-1-ccc194101@163.com>
In-Reply-To: <20250510061803.811433-1-ccc194101@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 May 2025 11:17:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCsXPgQZVtq9RL_TkXCAW9Bt3kMO3-cR4X8GZaQvmYCQyA@mail.gmail.com>
X-Gm-Features: AX0GCFvV5LPFwjfvUWgotcxdHtaNHc8xIDNoSaAFhOasi7TjbYfRetkWjqFlOtU
Message-ID: <CANiDSCsXPgQZVtq9RL_TkXCAW9Bt3kMO3-cR4X8GZaQvmYCQyA@mail.gmail.com>
Subject: Re: [PATCH v10] media: uvcvideo: Fix bandwidth issue for Alcor camera.
To: chenchangcheng <ccc194101@163.com>
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chenchangcheng <chenchangcheng@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

Hi chenchangcheng

Thanks for your patience fixing the warnings from media-ci :)

Regards

On Sat, 10 May 2025 at 08:18, chenchangcheng <ccc194101@163.com> wrote:
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
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_video.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..a74cf89852d1 100644
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
> +                                    "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
> +                                    ctrl->dwMaxPayloadTransferSize,

Minor nitpick. I am trying to standarize "UVC non compliance" header
in the logs for this kind of things.

"UVC non compliance: the max payload transmission size (%d) exceededs
the size of the ep max packet (%d). Using the max size.\n"
> +                                    stream->maxpsize);
> +               ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
> +       }
>  }
>
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
>
> base-commit: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
> --
> 2.25.1
>


-- 
Ricardo Ribalda
