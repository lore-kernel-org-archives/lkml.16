Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BAE218ABA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761362; cv=none; b=XAC9+eNYaki4lF2e3pOBBHp7tgRpMu34gOCzCAGRJ8buAd4ecw5ZOLXbLZTgaXpuhDzDfIPBnBj7bgFHAoaQKxUf57o+QioHdf470vvU9lt8k7g9BL861FAcWfuxMUyw87FXPuuYQYGp+Bt0x2Ime7NbhQwHxyetHITNfgvkPmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761362; c=relaxed/simple;
	bh=6CViWuPX00eU2i8EAuavfyf3Zqe6PhQ83HuHdPBTl2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0mdAgoNKFZFv0NZsLN8dWQOJpDWVn8s/3mJ1wlV1kLcbSmEYTxs8lUuAdNihMAubhKyCqtkYcOwG6N0mu7XX+cmx59a2lEARjHgBR66JVgnm3dOiZonMHSozSeOfJSV26XTuSEq2f1PUbwAb6V2JvBGE1yvnTgiPs6pzScOvlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KXPZAEQi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KXPZAEQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750761359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3LLsiuFWfA6idjZrblBAge6t85zqJ/pmKfL0AuNa2U=;
	b=KXPZAEQi7WwrwBZqsLAZ4EQnDqmeQgNKog8kDNj+onYjRfpOIGKhokOclLGf9RsKDDse4W
	6eAitxELRqNc2TwPFPXC1hGIAyfAohziwj9NE4Vt1FUMhr7b2B3IZmkdP4fFW7c9O4M+xI
	4gQWRz8zEENQLWa1eQV53r6/Zmqs2oU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-ljqJNFCaN_a_6Pt638OGjw-1; Tue, 24 Jun 2025 06:35:57 -0400
X-MC-Unique: ljqJNFCaN_a_6Pt638OGjw-1
X-Mimecast-MFC-AGG-ID: ljqJNFCaN_a_6Pt638OGjw_1750761357
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-606aea61721so300344a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761357; x=1751366157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3LLsiuFWfA6idjZrblBAge6t85zqJ/pmKfL0AuNa2U=;
        b=JqYRWlFYkrpo1xUSQLjMe7y7nK4L99gbID4kz5DgHXiV87ErmHvXMFZLOuPu5Row+W
         Nt4LUdbMakFHlUKFuhi8CORRVNjxDJ4H7XSr32uj7ZQTB6dCkzCHq/X/cO1u4PMtNDej
         fU44rSIJUbQLpYfQF0LXw4nN6IP0IeuMbVUZT+EAkUbCON0U4JS1pfNYmZZ3ekiq/K0f
         MYsAs5ATG2xzCLYw0KDnHGwP2Vt0dM+znjOgA6OtJrEQxsgVgYKhJ55c9dipeMw5oEzL
         fGqs4RD8xY2NEA5+kVOU50K+5+zJs0th+Yl20wX4ncXIgO4hqfgx2nz0hOpBO1BOGsHE
         /sJA==
X-Forwarded-Encrypted: i=1; AJvYcCWbRfCDeK+pu5G2VlUMKwTIljlum5qN+e1Cv8+0xrRmFVbO19ruJE3rUgMGsn5LtcPX3IAjzmuokp52sZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5oAhT3DIGDQGAtkTmeBrIZE2h6lsAw/UHZ82KTgquOgi8UjB
	a/6Bqgyv4GXjA6aWNVWLoFMWCc3phNDGmvtJat4hmCxIffw+cfcCpuP/dEyWzSo7G4gEvS1No1/
	qKmtgj6DuXnCVpNakL2QfOdjWDQYJ3UzwUH3NIkL6ot5krKIpTY/3CPvf6pp1DKuW23qb/hY3tP
	i0SxJaruKORaR6P0XGKTeMhUejYkIQhCKBuBZfGq3R
X-Gm-Gg: ASbGncuQ3tK1wmEOTT9q3HwIzr5FF01VPgmzBSTxJPyrpaYLwYwVbfC2Ge0y8UfbVNm
	XjHEA9sgQHndaFbcOt2N27jD8a6NpKtOPV5xPWjrw9O554a7A9q2beI1X9MTv++BIDmLbuq9NJP
	rKQrp2
X-Received: by 2002:a17:906:6a05:b0:ace:cc7f:8abe with SMTP id a640c23a62f3a-ae057b39bdfmr1751261066b.31.1750761356621;
        Tue, 24 Jun 2025 03:35:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG945gyIWXiR+ffSgL3olytMGzXmaQ3MYtuPPSyPyclXoNDFXHfuOBd36+G6jQmYhGmRc0OV6LyDDHJ4f9ky0E=
X-Received: by 2002:a17:906:6a05:b0:ace:cc7f:8abe with SMTP id
 a640c23a62f3a-ae057b39bdfmr1751259566b.31.1750761356252; Tue, 24 Jun 2025
 03:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616082518.10411-1-jasowang@redhat.com> <20250616082518.10411-2-jasowang@redhat.com>
In-Reply-To: <20250616082518.10411-2-jasowang@redhat.com>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 24 Jun 2025 18:35:18 +0800
X-Gm-Features: Ac12FXyfv18Bnl6zW9gEC4TfyPem9I0gsnQH2c14IyIgNpT2vz0N9HVKpPOYF10
Message-ID: <CAPpAL=wHn_Ak+5qNwqv6rEv=ROQPzra2nJuLD0HxOpZfjsEjVA@mail.gmail.com>
Subject: Re: [PATCH V3 01/19] virtio_ring: rename virtqueue_reinit_xxx to virtqueue_reset_xxx()
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I used the "virtio-net-pci,...,in_order=3Don" to test this series of
patches v3 with regression tests, everything works fine.

Tested-by: Lei Yang <leiyang@redhat.com>

On Mon, Jun 16, 2025 at 4:27=E2=80=AFPM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> To be consistent with virtqueue_reset().
>
> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/virtio/virtio_ring.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index b784aab66867..afdd51fc3c9c 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1005,7 +1005,7 @@ static void virtqueue_vring_init_split(struct vring=
_virtqueue_split *vring_split
>         }
>  }
>
> -static void virtqueue_reinit_split(struct vring_virtqueue *vq)
> +static void virtqueue_reset_split(struct vring_virtqueue *vq)
>  {
>         int num;
>
> @@ -1248,7 +1248,7 @@ static int virtqueue_resize_split(struct virtqueue =
*_vq, u32 num)
>  err_state_extra:
>         vring_free_split(&vring_split, vdev, vring_dma_dev(vq));
>  err:
> -       virtqueue_reinit_split(vq);
> +       virtqueue_reset_split(vq);
>         return -ENOMEM;
>  }
>
> @@ -2092,7 +2092,7 @@ static void virtqueue_vring_attach_packed(struct vr=
ing_virtqueue *vq,
>         vq->free_head =3D 0;
>  }
>
> -static void virtqueue_reinit_packed(struct vring_virtqueue *vq)
> +static void virtqueue_reset_packed(struct vring_virtqueue *vq)
>  {
>         memset(vq->packed.vring.device, 0, vq->packed.event_size_in_bytes=
);
>         memset(vq->packed.vring.driver, 0, vq->packed.event_size_in_bytes=
);
> @@ -2219,7 +2219,7 @@ static int virtqueue_resize_packed(struct virtqueue=
 *_vq, u32 num)
>  err_state_extra:
>         vring_free_packed(&vring_packed, vdev, vring_dma_dev(vq));
>  err_ring:
> -       virtqueue_reinit_packed(vq);
> +       virtqueue_reset_packed(vq);
>         return -ENOMEM;
>  }
>
> @@ -2852,9 +2852,9 @@ int virtqueue_reset(struct virtqueue *_vq,
>                 recycle_done(_vq);
>
>         if (vq->packed_ring)
> -               virtqueue_reinit_packed(vq);
> +               virtqueue_reset_packed(vq);
>         else
> -               virtqueue_reinit_split(vq);
> +               virtqueue_reset_split(vq);
>
>         return virtqueue_enable_after_reset(_vq);
>  }
> --
> 2.34.1
>
>

