Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8292227E04C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388518; cv=none; b=u6w0LS1lScaU4ffPOCadDdjJ7DnOZnsqrupQp+s6tVCYGnMGHn4oNhWUANdAr9pAwAMmbSee128xtwN2TG1jIcUyP1ngobNoUE3HIx3Dgvt86y6hs1Evzwk5gXL5o9fB3jjtY/PGb40rIxGeV2hu0K50jA0QlFR8nF+a2sDRAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388518; c=relaxed/simple;
	bh=tI+4wKtSKHs0zOZaF0kRYAvQFo9ILAwIjWfI+LgVGds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6ql7eLJ0dRoytRum9GDHrcraekflaDoBQRbvpFRD9isWYZZMcTfX9wuGkwt2GxAURSbPvo0UfgM7g/HL3UhfoTxjJ4ilfmaAKWr/rV7Hu85726F6JmgkKnsj4RjJnb2+o74+f4eAxz2bLSQ5pf7Kxjnxgi9JVVjHkrqZc9GpSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gn7tnQPJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gn7tnQPJ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553bcf41440so6038675e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751388515; x=1751993315; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P8f/YI2ig587JvEzYvoYDEUyD2K6VzX+ZT6F/a8hE1A=;
        b=Gn7tnQPJoiH5qGeItQ6A/GaH2ZSrC85k8kUQaLapl+/rWZRZa5gM/NIn0oXEpEXJZs
         s/WC3ZuLq42Yf+fNbCwqmi4kdFovTDorvlHCELTZ4m5gAm+Iy9WzO7iVcGTnBm+msl/Q
         HpxY+dBcftMQ7sFkQ1fCkvSQeC2X1a6tCzPiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751388515; x=1751993315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8f/YI2ig587JvEzYvoYDEUyD2K6VzX+ZT6F/a8hE1A=;
        b=GL86vQ6Sa2akMYN4o12rDezxDa+2yBLvzFsVt6huKeKVmOlt+Bnyp6Boq0ASE6zdyK
         T0iIxrmDRQT1ziQH7mkALCju07D1qMEeYmI3ch2Ak+4R5D/BLxwBmOC+rbJaNalRNGEg
         zU7ZxqLANm6XuyM4rwHF7vjDnuaQJsnBcn8PNNcEK7Ke+biqatewyOfexCB3Ijkntckn
         //ZtVmtVCax32c5YY7FMAjQj8YF7K8KHf1zwB8jl5i3S4Q9Uns+ys77cqZAra4Nxl2qC
         x+yT2TUJnzwEd4awm601GKd8sVsjjtG1y8aB8hpS//70KHVuMT0wPaQrtdCtFEq2+Jrc
         euPg==
X-Forwarded-Encrypted: i=1; AJvYcCWy7Om1ZCPL8ZP5sX49sLpT7WvKTC//NZOEBOqZ78+jjBQUB15sl1OdD/Tjfp8JQfUjkVM+crhsb2r8jt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQOv06mgzHng6aooKr+qYz1hmTwxNEuT8uy3FneCHe0b+nlT5a
	8R4yLPLk4TFH3mj/Ibb5mouce2cBeJerKU2g1xM2e8iWDn4BatR1B1uYa3p/NX9A/sCjpli4Mdd
	eik9OSA==
X-Gm-Gg: ASbGncv2yDp17AjnDfElo9MW+jvmjtZyPG4BeoUIjaysavxr/Rphu07b2urMfxKjMT5
	NjVIotAhkKRzCjmbCMURdYXty8Ni+oBRBdpYQ7rKhjvVpYrC7scGrvFjHQTmGI0ftSh1qmBgkoG
	fvro+X/LSlieNOkxAP1BSOeazgqax/Sb0q2deHPhYlqUXWaEopfrnVzzivRdnG0l+Pfk3mR3H2v
	BEhGx0u0cOHcR8pf5kRGLdoRIEu2ZazyCX8VTUVKU5+1w4LC0Srtc93ORnySWa7nHv/perMKy3A
	KnHTwj+ufj20mdhfvhbPLtZCBb2l6yW/pFGNrUFDmrS0V6uS3AxGMGaalde0m1HdOkCgCyJYxZ8
	XMAysIzH5UNfGasO9l5NdnCyg
X-Google-Smtp-Source: AGHT+IHeV9ZxCWkbbpWP/6LZW1huh4fBGOM+GugJbGkU80/eDKDBiDZHp9svgLx5olHlbhVXdos8ZA==
X-Received: by 2002:a05:6512:3d10:b0:553:af30:1e8b with SMTP id 2adb3069b0e04-5550ba114bfmr5656503e87.38.1751388514523;
        Tue, 01 Jul 2025 09:48:34 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24028esm1889177e87.19.2025.07.01.09.48.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 09:48:34 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5551a770828so2765092e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:48:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpB6QYqnMub2gJK05xRuGmFvVsfZwskXMzj4ce//D6h8pMBsprac8shNp41nYzw82nxL2YlMz/vzV/yYo=@vger.kernel.org
X-Received: by 2002:a05:6512:b97:b0:553:adff:87da with SMTP id
 2adb3069b0e04-5550b9eec3cmr5635002e87.29.1751388513261; Tue, 01 Jul 2025
 09:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701145240.105959-1-desnesn@redhat.com>
In-Reply-To: <20250701145240.105959-1-desnesn@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Jul 2025 18:48:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCs_Pz-wgnYNVA7Zt4RhtgN256i32aCw0mE4XFv3b49ygw@mail.gmail.com>
X-Gm-Features: Ac12FXySL1Z_QmxcJurW6V_oa_rceHTH3CgKaysROWFAC3NSUzFBeTQCoFgVYQw
Message-ID: <CANiDSCs_Pz-wgnYNVA7Zt4RhtgN256i32aCw0mE4XFv3b49ygw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
To: Desnes Nunes <desnesn@redhat.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Desnes

On Tue, 1 Jul 2025 at 16:59, Desnes Nunes <desnesn@redhat.com> wrote:
>
> This avoids a variable loop shadowing occurring between the local loop
> iterating through the uvc_entity's controls and the global one going
> through the pending async controls of the file handle
>
> Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter per IOCTL")
If you add a fixes you need to add
Cc: stable@kernel.org

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 44b6513c5264..91cc874da798 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3260,7 +3260,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>         struct uvc_entity *entity;
> -       int i;
>
>         guard(mutex)(&handle->chain->ctrl_mutex);
>
> @@ -3278,7 +3277,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>         if (!WARN_ON(handle->pending_async_ctrls))
>                 return;
>
> -       for (i = 0; i < handle->pending_async_ctrls; i++)

nitpick: I would have called the variable i, not j.  For me j usually
means nested loop. But up to you

I am also not against your first version with a different commit message.

Thanks!
> +       for (unsigned int j = 0; j < handle->pending_async_ctrls; j++)
>                 uvc_pm_put(handle->stream->dev);
>  }
>
> --
> 2.49.0
>
>


-- 
Ricardo Ribalda
