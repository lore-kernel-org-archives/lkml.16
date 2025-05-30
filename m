Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F51420409A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748589723; cv=none; b=IpHeBNYDyLxaue3PVGWp5qDdZUMq1q4ajbn0YZZWturB0aw+C0P4gLDwcvyvG9B7JxSQEq8wY7vLA+ElKPSXnPiL89WeOaAP/UJYkQA9Cvz2/g2SHm0TpAUkYuQWaJDlMbDQ5N0shS/wHdcL1JYQp2jZKjveT9HH9TBifzEgDso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748589723; c=relaxed/simple;
	bh=qXkisE7VqD51yKouULNp9l74lMboUFqrKQL5xYfnOj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPaCTSQtcraxgTUMjD3VB5Uq/AJNtJzj1zv7n2XIEhM6n/ig1ojoPjp8euBSGUmFBIKgp5eduYLsrohmmAoSSd/Zcf+plHtZ1qZeOeJxA7JFL8QA7wkLcg8Jg6nMuk45AJ3oUxaFd2URLWZVAH+gP+FdEO7JGzrj3xBnTgVl4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Px7kw2oy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Px7kw2oy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748589720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pmkVP+uhasaLbURIs12Cbav5wTMej3hFnwYbbQ+hjbo=;
	b=Px7kw2oyPl3n1x7Rr82kKnED4Qm0ve9ijO6sTIlh7F0MGXqg84L35K0oXdH92Fx9aNUzfK
	nnEQ6PHTbFkK2Kq5tSrH3J3k0+L2fX/6u74Lq2zGiiIcgz8HfdxLpHsb7awCuiP/o/WG76
	9exR6DtzQ1kdVVFf0nVtjghmZJwc5mA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-b56UmEWbPACDUZLGdouh-w-1; Fri, 30 May 2025 03:21:59 -0400
X-MC-Unique: b56UmEWbPACDUZLGdouh-w-1
X-Mimecast-MFC-AGG-ID: b56UmEWbPACDUZLGdouh-w_1748589718
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311d670ad35so1644474a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748589718; x=1749194518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmkVP+uhasaLbURIs12Cbav5wTMej3hFnwYbbQ+hjbo=;
        b=qxyZk5VvCra5/H+TBmmvTGJa+Fnrpm+ObrvHRM4XMKNOo84rIP4oGg2qcay7bKTW06
         72SbyIJagEI8I6XhnnLh4BYMstmdin8JUJlIPzb3ZLycw/f3fYjWIItCZJ8U1uG+2nmx
         lWNOtSoYFSDcwkeSrFVoDc9uKq3XmlZchYcZa7b7896JgDBqS0g0GUPxLyu6V2sEcO3A
         lDhmR360bNkoseBzsTp6HICMjU1laOZvhRrD50q+k1yqNAZA/aNdNmSrwTHucqoZzEV8
         6UamJnznLyTPfERC2flB0ZGAcHmUppDNjRNUAyAF/dgH3qCLqLswGihmrYyCyY6M0nOy
         pvug==
X-Forwarded-Encrypted: i=1; AJvYcCXP+X+zKGD81FaaKEui9R6Mr7sziHXU7h/NrzDMHrzcpepKFKt0+n/yONcorvUcVCGuW4z3F6DdMXHRiBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMB+p/YJcUpY6yeql1nfFHXpUr50qLwlaFktj/dX06AMWalEfz
	lZhLzb2EQLhCH9+TUxqfcRymtE281v6y+xNRpUwKRhybl55AO8fVUyvWnDnDAgBiHjUTkz1p8P6
	SEtn7Q8yF0Y0j330e+SCv2Syu9/VvUbu2mh2qu4ZSo0cDq4aSHvWlA2o3AOT7j6T1Avtxf55WFS
	qA8MbACfqLZqTcJcKYUc9LCgwpZOOlkyXDdffdcvXmoOxdDLbtAAc=
X-Gm-Gg: ASbGncvuH7d9AVJ4ObhZWH/xtEKZwn6I1cfvpWs9d86ngiWewfkrqXAYXWlfAeSncKt
	0TUESAW+oE2Q7fjWvxDGNL7G2Rt/aqGoJYjYGCkD08MO4jQ6zJkImZKh/Hrnzd9X6MLix
X-Received: by 2002:a17:90b:2f8c:b0:311:f2bd:dc23 with SMTP id 98e67ed59e1d1-31241735c16mr3959059a91.15.1748589718001;
        Fri, 30 May 2025 00:21:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq0txzqdTiLc6XdEgPp3LFgOJf68f9fcV9c27gVZrTx/1a5AxvxvGj5zXv4GGHDJ6XqZeHJ5Hi/5gKhPtFt+M=
X-Received: by 2002:a17:90b:2f8c:b0:311:f2bd:dc23 with SMTP id
 98e67ed59e1d1-31241735c16mr3959032a91.15.1748589717562; Fri, 30 May 2025
 00:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7808f2f7e484987b95f172fffb6c71a5da20ed1e.1748503784.git.viresh.kumar@linaro.org>
In-Reply-To: <7808f2f7e484987b95f172fffb6c71a5da20ed1e.1748503784.git.viresh.kumar@linaro.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 30 May 2025 09:21:19 +0200
X-Gm-Features: AX0GCFtgQ2X-0AoBTHg5OW599d01liZonZ-1_cIwnv6fwLwvw9hXAXBcivLWZWc
Message-ID: <CAJaqyWdp3MJJBB1EpEhCQH+9XCtYvEhePMf1D4ADW9eUZDttjg@mail.gmail.com>
Subject: Re: [PATCH] virtio-vdpa: Remove virtqueue list
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 9:30=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> The virtio vdpa implementation creates a list of virtqueues, while the
> same is already available in the struct virtio_device.
>
> This list is never traversed though, and only the pointer to the struct
> virtio_vdpa_vq_info is used in the callback, where the virtqueue pointer
> could be directly used.
>
> Remove the unwanted code to simplify the driver.
>

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> Only build tested.
> ---
>  drivers/virtio/virtio_vdpa.c | 44 +++---------------------------------
>  1 file changed, 3 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
> index 1f60c9d5cb18..e25610e3393a 100644
> --- a/drivers/virtio/virtio_vdpa.c
> +++ b/drivers/virtio/virtio_vdpa.c
> @@ -28,19 +28,6 @@ struct virtio_vdpa_device {
>         struct virtio_device vdev;
>         struct vdpa_device *vdpa;
>         u64 features;
> -
> -       /* The lock to protect virtqueue list */
> -       spinlock_t lock;
> -       /* List of virtio_vdpa_vq_info */
> -       struct list_head virtqueues;
> -};
> -
> -struct virtio_vdpa_vq_info {
> -       /* the actual virtqueue */
> -       struct virtqueue *vq;
> -
> -       /* the list node for the virtqueues list */
> -       struct list_head node;
>  };
>
>  static inline struct virtio_vdpa_device *
> @@ -135,9 +122,9 @@ static irqreturn_t virtio_vdpa_config_cb(void *privat=
e)
>
>  static irqreturn_t virtio_vdpa_virtqueue_cb(void *private)
>  {
> -       struct virtio_vdpa_vq_info *info =3D private;
> +       struct virtqueue *vq =3D private;
>
> -       return vring_interrupt(0, info->vq);
> +       return vring_interrupt(0, vq);
>  }
>
>  static struct virtqueue *
> @@ -145,18 +132,15 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, un=
signed int index,
>                      void (*callback)(struct virtqueue *vq),
>                      const char *name, bool ctx)
>  {
> -       struct virtio_vdpa_device *vd_dev =3D to_virtio_vdpa_device(vdev)=
;
>         struct vdpa_device *vdpa =3D vd_get_vdpa(vdev);
>         struct device *dma_dev;
>         const struct vdpa_config_ops *ops =3D vdpa->config;
> -       struct virtio_vdpa_vq_info *info;
>         bool (*notify)(struct virtqueue *vq) =3D virtio_vdpa_notify;
>         struct vdpa_callback cb;
>         struct virtqueue *vq;
>         u64 desc_addr, driver_addr, device_addr;
>         /* Assume split virtqueue, switch to packed if necessary */
>         struct vdpa_vq_state state =3D {0};
> -       unsigned long flags;
>         u32 align, max_num, min_num =3D 1;
>         bool may_reduce_num =3D true;
>         int err;
> @@ -179,10 +163,6 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, uns=
igned int index,
>         if (ops->get_vq_ready(vdpa, index))
>                 return ERR_PTR(-ENOENT);
>
> -       /* Allocate and fill out our active queue description */
> -       info =3D kmalloc(sizeof(*info), GFP_KERNEL);
> -       if (!info)
> -               return ERR_PTR(-ENOMEM);
>         if (ops->get_vq_size)
>                 max_num =3D ops->get_vq_size(vdpa, index);
>         else
> @@ -217,7 +197,7 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsi=
gned int index,
>
>         /* Setup virtqueue callback */
>         cb.callback =3D callback ? virtio_vdpa_virtqueue_cb : NULL;
> -       cb.private =3D info;
> +       cb.private =3D vq;
>         cb.trigger =3D NULL;
>         ops->set_vq_cb(vdpa, index, &cb);
>         ops->set_vq_num(vdpa, index, virtqueue_get_vring_size(vq));
> @@ -248,13 +228,6 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, uns=
igned int index,
>
>         ops->set_vq_ready(vdpa, index, 1);
>
> -       vq->priv =3D info;
> -       info->vq =3D vq;
> -
> -       spin_lock_irqsave(&vd_dev->lock, flags);
> -       list_add(&info->node, &vd_dev->virtqueues);
> -       spin_unlock_irqrestore(&vd_dev->lock, flags);
> -
>         return vq;
>
>  err_vq:
> @@ -263,7 +236,6 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsi=
gned int index,
>         ops->set_vq_ready(vdpa, index, 0);
>         /* VDPA driver should make sure vq is stopeed here */
>         WARN_ON(ops->get_vq_ready(vdpa, index));
> -       kfree(info);
>         return ERR_PTR(err);
>  }
>
> @@ -272,20 +244,12 @@ static void virtio_vdpa_del_vq(struct virtqueue *vq=
)
>         struct virtio_vdpa_device *vd_dev =3D to_virtio_vdpa_device(vq->v=
dev);
>         struct vdpa_device *vdpa =3D vd_dev->vdpa;
>         const struct vdpa_config_ops *ops =3D vdpa->config;
> -       struct virtio_vdpa_vq_info *info =3D vq->priv;
>         unsigned int index =3D vq->index;
> -       unsigned long flags;
> -
> -       spin_lock_irqsave(&vd_dev->lock, flags);
> -       list_del(&info->node);
> -       spin_unlock_irqrestore(&vd_dev->lock, flags);
>
>         /* Select and deactivate the queue (best effort) */
>         ops->set_vq_ready(vdpa, index, 0);
>
>         vring_del_virtqueue(vq);
> -
> -       kfree(info);
>  }
>
>  static void virtio_vdpa_del_vqs(struct virtio_device *vdev)
> @@ -501,8 +465,6 @@ static int virtio_vdpa_probe(struct vdpa_device *vdpa=
)
>         vd_dev->vdev.dev.release =3D virtio_vdpa_release_dev;
>         vd_dev->vdev.config =3D &virtio_vdpa_config_ops;
>         vd_dev->vdpa =3D vdpa;
> -       INIT_LIST_HEAD(&vd_dev->virtqueues);
> -       spin_lock_init(&vd_dev->lock);
>
>         vd_dev->vdev.id.device =3D ops->get_device_id(vdpa);
>         if (vd_dev->vdev.id.device =3D=3D 0)
> --
> 2.31.1.272.g89b43f80a514
>

