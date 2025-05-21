Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5780D1EB3D
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747789252; cv=none; b=q/ELU82d3BKtZU4mrFDsRDmcjGngAAlXFj8rlLZMkrDIO8T8hsPzjtzq4ImxtFzTShCIbG6cYukl+e0laT7vNFKZbYZJ1YbNGaqcmCX00YpI8T56jonmSX/mNMjihb+tRSYLLIVaioCO1RfPu+gSc3IFWXFPgGkqlfZJTy01EBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747789252; c=relaxed/simple;
	bh=UwyvllrCJPVWC5ocFz+1hBFct3kBz9xuj8wxTC0pGPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRhYcrkx1SCkhIw5CnEdGaacNZieWi1fp0zy2EUxo1FgXaQN+QfG/K0YLGCzmL83MyJ468cMSCFlep6KkgA+WmjXOZOPAftpl/AAJld0MS1kyyXIgQHcYki/RVrkfdmZPkRxK5y3F5Cx/1qI75uLUCPCHQGh8hUxtNUiBx/d2os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K8byYcHh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K8byYcHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747789249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M5UU96bQp+9c05rasuJ8OHXH1EUH9d+HdLZb9k7tA/A=;
	b=K8byYcHhCiNIkmg5I7dhYcI117KPimeS2k1CPJ5wPeOpox8vvapN5q/OTJkwFwD6Ug8D1a
	W2RHzMzkButGBDGmOek/7w0M8rUxckb98Lc8A2nrEn//UpEz4ULc+GV7YKljbDRBpKHmNk
	bBJ365+xIqsV4GWxiRQhfUjqXiMpXxk=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-dH2xdVvsM9qonRwOe8NThA-1; Tue, 20 May 2025 21:00:47 -0400
X-MC-Unique: dH2xdVvsM9qonRwOe8NThA-1
X-Mimecast-MFC-AGG-ID: dH2xdVvsM9qonRwOe8NThA_1747789246
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3108d5538c0so183176a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747789246; x=1748394046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5UU96bQp+9c05rasuJ8OHXH1EUH9d+HdLZb9k7tA/A=;
        b=L+EYrduZTelHH8EDtyCyn649TBBMnl68gxLY9qUCE1RduHZs8dBbJbf06NUXMTn+ju
         odvhPHTj4O5w01kR/yx2RwPcc63I8cLYGwL36lIkfkQLcRK8Jat7lAXnBFmhfNv+lOjR
         OhQrniY2InsZpETwCkZEoFEB+TLBMeoRpk4fQpX3apxw8PVSFbpanhpL+VXcAiGe+GKl
         B6eHU2LK9djo0S7xhOl0HeDjmYFi6DgN0J5a6iYOdRqqhe6/G213rPaEo9dc4XSpnNK1
         aOMvwPjQlyORaDdL9z6NjRZkMaYqwEC1CUurJ2DPya909FKUnzqpY+8BRN9KreB10v7M
         cnbQ==
X-Gm-Message-State: AOJu0Ywzkq+hdSHs2zXDJojGZwytYhysnJKCGZ3MbAoeuQZOIDshtuLz
	2kZNHUbibLjF1CioXxRav2/CW0Ln+RlarJE09m2BCzjtvGEs+HUxlIWgP4GLrIEFkd9/8ySAb8a
	gjYCxeep9L/8HE0Sg2eDgFuWUx1Q1ftc2y/xaEx4H/4C90cgmHPdIE3gw+fkNG34CrJYH5ighRM
	ajQf/VJ4h4chXbCBR8z8w4/voxTwiN0eIrnXOVY8kJ7yTGnqJoPOofGHiF
X-Gm-Gg: ASbGnct/oKBoLTxjqYd4WVOJdW4U3P/n78wg80WkCh0P+3EECM25kttFOpv7ElCJYvB
	AQFIZBrpKHBwNVvg0RY4gl81+Y2dcYl2rNW9ti6QF49o9kzuHoThFV5BFa6zW0az7PBbC2A==
X-Received: by 2002:a17:90b:48ce:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-30e7d53fedcmr34181860a91.17.1747789245666;
        Tue, 20 May 2025 18:00:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwcEKoM8Rbsn/a4WndKnzdXbjNGmiuWmbI2Y5I8bxlXXtoVUQyT+CI3h7RbvzZ1zmkJYmKWfeUsMGX5k4wCxw=
X-Received: by 2002:a17:90b:48ce:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-30e7d53fedcmr34181821a91.17.1747789245236; Tue, 20 May 2025
 18:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520110526.635507-1-lvivier@redhat.com> <20250520110526.635507-2-lvivier@redhat.com>
In-Reply-To: <20250520110526.635507-2-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 21 May 2025 09:00:33 +0800
X-Gm-Features: AX0GCFss55bkUwZRoC8YeL_R-ecnSY7xZLVonSottICbFZGTPlnRjiGhH-GAQn0
Message-ID: <CACGkMEsO2XFFmJm4Y__9ELo5YQOve1DgE2TVOO2FgB1rmZh58g@mail.gmail.com>
Subject: Re: [PATCH 1/2] virtio_ring: Fix error reporting in virtqueue_resize
To: Laurent Vivier <lvivier@redhat.com>
Cc: linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 7:05=E2=80=AFPM Laurent Vivier <lvivier@redhat.com>=
 wrote:
>
> The virtqueue_resize() function was not correctly propagating error codes
> from its internal resize helper functions, specifically
> virtqueue_resize_packet() and virtqueue_resize_split(). If these helpers
> returned an error, but the subsequent call to virtqueue_enable_after_rese=
t()
> succeeded, the original error from the resize operation would be masked.
> Consequently, virtqueue_resize() could incorrectly report success to its
> caller despite an underlying resize failure.
>
> This change restores the original code behavior:
>
>        if (vdev->config->enable_vq_after_reset(_vq))
>                return -EBUSY;
>
>        return err;
>
> Fix: commit ad48d53b5b3f ("virtio_ring: separate the logic of reset/enabl=
e from virtqueue_resize")
> Cc: xuanzhuo@linux.alibaba.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  drivers/virtio/virtio_ring.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index b784aab66867..4397392bfef0 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -2797,7 +2797,7 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num=
,
>                      void (*recycle_done)(struct virtqueue *vq))
>  {
>         struct vring_virtqueue *vq =3D to_vvq(_vq);
> -       int err;
> +       int err, err_reset;
>
>         if (num > vq->vq.num_max)
>                 return -E2BIG;
> @@ -2819,7 +2819,11 @@ int virtqueue_resize(struct virtqueue *_vq, u32 nu=
m,
>         else
>                 err =3D virtqueue_resize_split(_vq, num);
>
> -       return virtqueue_enable_after_reset(_vq);
> +       err_reset =3D virtqueue_enable_after_reset(_vq);

I wonder if we should call virtqueue_enable_after_reset() when
virtqueue_resize_xxx() fail.

Thanks

> +       if (err_reset)
> +               return err_reset;
> +
> +       return err;
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_resize);
>
> --
> 2.49.0
>

