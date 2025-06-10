Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEF8280CD0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545617; cv=none; b=FdKeMmgpPPpFsm4Z5NVLfy8nKXO2ivFjRUdQpiq1jrmLtYjj+/XADl2sbzYQk9E/4dH4P6VIgjB9jcq4xuiRSv8TCv9FXImbhStfRmxoLoB+NzKVCpvffC6uVZbkb6HV4iMpfOfsJv5w9wMWKKH7Cl/teqyrUsOatyMWTOU2TM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545617; c=relaxed/simple;
	bh=0DpUZ9KkrwL5L0LBxsRrJTljyTI0zyHeRhsfl1KdLQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPQE5Hx8C344Xhq4LuVrIEg2OtWRtWdG+ZOjpmF5aeZpqI6mrq5p9JUA5PzoIBp8U9MeB0BN4QCFTO4uDUpI//nOPghpysstsPDj+TE2Fe5obB05ysgxkMlRJT60sEOr/zy5an+VlYNBu9yNc8bKy19gdnxsrWhXvWlMEhBtrLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K4BjTzX9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K4BjTzX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749545614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BLr0XlGOIN+Wt+CCLv/Qc/6mxQSoqncCTsMpm4BEGzs=;
	b=K4BjTzX9SL3D1doyDasGcKjxgV6bDk4IQhKZrry8gHJIs56JWc5EWe1NkE0ryWyxmBK6Xm
	UmkAYQMsnHiwxjL47t2Z+6WWS8b4AVeIZW7uw9m8c6ivHOiRv1mjsuaLN2G59XVp5ro7dK
	B+A5m0MS+j/Woq6ZyuxNHQLqdJbK5LE=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-y55ibX8qN3CPzFRfHQzqhg-1; Tue, 10 Jun 2025 04:53:33 -0400
X-MC-Unique: y55ibX8qN3CPzFRfHQzqhg-1
X-Mimecast-MFC-AGG-ID: y55ibX8qN3CPzFRfHQzqhg_1749545613
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7482e90feacso3007983b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749545612; x=1750150412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLr0XlGOIN+Wt+CCLv/Qc/6mxQSoqncCTsMpm4BEGzs=;
        b=YVQCTEghUQVCvSzo2WC8pT4S5RXhKolMzA6jLZBhI8J8VRbRC1AthGJSKgVThy8BJ7
         TSUopJrnZpxxjnO2PQn3IRYHk63Y+cS0hjf3AMzg281vrQZn6ezfNc4PtRoKR/WL6pkl
         ovoyErg0g58EL8kkvynXGd9FtIYkSGpsfAL20UGVwyCoTM77ir1o8VqJPFJvuwSeKA2B
         e1Iq/brJIRBdqb1RMfldtSKXuyAtmjCN546Kprg5AcowMW7eKzpo1agfv4+GK4q+2cbV
         m8avuPwREdYOkE/Ypbc+xvyarpRhRHri8EKZkjYUWXz7/rkbZNCkmaEwir2dtsL82rSb
         Cyhg==
X-Forwarded-Encrypted: i=1; AJvYcCWruUNyJsqYSoqfAcCzPunic1p9zudNlpWM8LaH7Pl/HWpRC6WjHkMbO2Cy4lhGG1vtQMeMPeC7S5oacJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbNknhQq6vr0XdxtKZ50wfYTDs9MW72A75A7I8oL3wPSUmg2HE
	VZ62XzlWOjJAREBxj1HJSbDXDdpHyloA0O6uihYFu9nUBxglyST35M7LjM5FBn44/M9qsZrNQSF
	gV1HmOmqMIGDB+1h5R62A0c1SRi/DrtUzHYQQ+rqYTBtbSXb2ov6YetO1SWpLHQPm2VH/7DruYB
	CObQ1+JNnlQ0K0eocpoSYJjfNrrL+jILHPE2CUo8Hv
X-Gm-Gg: ASbGnctR1Roa8H6KQDzTukdTNZuqNF1/hPQxIBzxjAiV8/tx5SUQR4TcZDSlGX0eI7e
	nKA0/5aByWgtMWGPs8/PiI/uyUf0JrMqDuZ903ggM9bTDOtT/zb1dBysG6p5Cm9WpWBzuOMk6wj
	LNzWeb
X-Received: by 2002:a05:6a00:488b:b0:748:2eb7:8cc7 with SMTP id d2e1a72fcca58-7482eb793b6mr14576144b3a.21.1749545612511;
        Tue, 10 Jun 2025 01:53:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDtQATZhNUeHCayiq82Q3uWbh+a992wQoACyQuVqjg1uIut3p9JRqy80WxfvRLTLkZ3TwDx6H3hdyFEwqiPfI=
X-Received: by 2002:a05:6a00:488b:b0:748:2eb7:8cc7 with SMTP id
 d2e1a72fcca58-7482eb793b6mr14576134b3a.21.1749545612160; Tue, 10 Jun 2025
 01:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606115012.1331551-1-eperezma@redhat.com> <20250606115012.1331551-3-eperezma@redhat.com>
 <CACGkMEuGC6NQmfUgXj1YVyURQ6-S2YT2qkAuYQGLpqVaV75kJg@mail.gmail.com> <CAJaqyWcvHx7kwcTceN2jazT0nKNo1r5zdzqWHqpxdna-kCS1RA@mail.gmail.com>
In-Reply-To: <CAJaqyWcvHx7kwcTceN2jazT0nKNo1r5zdzqWHqpxdna-kCS1RA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 10 Jun 2025 16:53:20 +0800
X-Gm-Features: AX0GCFuqGQsBNSumlUewaUtQcwP98_Y_ku7R1josEfD_6XY6HQFkMkPp5R96B_Q
Message-ID: <CACGkMEu+s_4feR6X2MBOPQFjwULEkD933ZTbQnkG+GfZ9rqcMg@mail.gmail.com>
Subject: Re: [RFC 2/6] vduse: add vq group support
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Yongji Xie <xieyongji@bytedance.com>, Cindy Lu <lulu@redhat.com>, 
	linux-kernel@vger.kernel.org, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Maxime Coquelin <mcoqueli@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 2:03=E2=80=AFPM Eugenio Perez Martin <eperezma@redha=
t.com> wrote:
>
> On Mon, Jun 9, 2025 at 3:55=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
> >
> > On Fri, Jun 6, 2025 at 7:50=E2=80=AFPM Eugenio P=C3=A9rez <eperezma@red=
hat.com> wrote:
> > >
> > > The virtqueue group is the minimal set of virtqueues that must share =
an
> > > address space.  And the address space identifier could only be attach=
ed
> > > to a specific virtqueue group.  The virtqueue is attached to a
> > > virtqueue group for all the life of the device.
> > >
> > > During vDPA device allocation, the VDUSE device needs to report the
> > > number of virtqueue groups supported. At this moment only vhost_vdpa =
is
> > > able to do it.
> > >
> > > This helps to isolate the environments for the virtqueue that will no=
t
> > > be assigned directly. E.g in the case of virtio-net, the control
> > > virtqueue will not be assigned directly to guest.
> > >
> > > As we need to back the vq groups with a struct device for the file
> > > operations, let's keep this number as low as possible at the moment: =
2.
> > > We can back one VQ group with the vduse device and the other one with
> > > the vdpa device.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  drivers/vdpa/vdpa_user/vduse_dev.c | 44 ++++++++++++++++++++++++++++=
+-
> > >  include/uapi/linux/vduse.h         | 17 +++++++++++-
> > >  2 files changed, 59 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_u=
ser/vduse_dev.c
> > > index 6a9a37351310..6fa687bc4912 100644
> > > --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> > > +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> > > @@ -46,6 +46,11 @@
> > >  #define VDUSE_IOVA_SIZE (VDUSE_MAX_BOUNCE_SIZE + 128 * 1024 * 1024)
> > >  #define VDUSE_MSG_DEFAULT_TIMEOUT 30
> > >
> > > +/*
> > > + * Let's make it 2 for simplicity.
> > > + */
> > > +#define VDUSE_MAX_VQ_GROUPS 2
> > > +
> > >  #define IRQ_UNBOUND -1
> > >
> > >  struct vduse_virtqueue {
> > > @@ -114,6 +119,7 @@ struct vduse_dev {
> > >         u8 status;
> > >         u32 vq_num;
> > >         u32 vq_align;
> > > +       u32 ngroups;
> > >         struct vduse_umem *umem;
> > >         struct mutex mem_lock;
> > >         unsigned int bounce_size;
> > > @@ -592,6 +598,25 @@ static int vduse_vdpa_set_vq_state(struct vdpa_d=
evice *vdpa, u16 idx,
> > >         return 0;
> > >  }
> > >
> > > +static u32 vduse_get_vq_group(struct vdpa_device *vdpa, u16 idx)
> > > +{
> > > +       struct vduse_dev *dev =3D vdpa_to_vduse(vdpa);
> > > +       struct vduse_dev_msg msg =3D { 0 };
> > > +       int ret;
> > > +
> > > +       if (dev->api_version < VDUSE_API_VERSION_1)
> > > +               return 0;
> > > +
> > > +       msg.req.type =3D VDUSE_GET_VQ_GROUP;
> > > +       msg.req.vq_group.index =3D idx;
> >
> > Considering there will be a set_group_asid request, could the kernel
> > cache the result so we don't need to bother with requests from
> > userspace?
> >
>
> Yes we can, actually a previous version did it. But what's the use? It
> is not used in the dataplane, so we reduce complexity if we don't
> store it.

It helps to reduce the chance to wait for the userspace. I think it's safer=
.

For example, we cache device status as well, if needed userspace can
update the status via ioctl().

>
> What's more, in the case of the net device, the vq number -> vq group
> association can change in a reset as the CVQ is either the last one or
> #2 if MQ is negotiated. We need to code when to reset this
> association, so complexity grows even more. And the vq group are not
> asked by QEMU after that point anyway.

Yes, we can have an array. E.g simulator has something like:

        struct vhost_iotlb *iommu;

Thanks

