Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A191A2545
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749108883; cv=none; b=C4YMi9TZn3E/9uQ9xf/voQJx49gLiO4biJtNydK+Gm1JrrlI8dpzIBV+PmCnV8YRNZ0JbQPcBGSi7EcEWXwmnSC8jaoUARK5bBJl+Lq3P0Yf+n8ydkDJoqGrMt/G6Yaofe6Ca7X2ddSX+LCz2sCegO1eoFnMYboNyrz65w9hmPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749108883; c=relaxed/simple;
	bh=KvU6Opi9kGXzP56d+/qD/Di+CulXN96GXgpj2Q7ikZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bt3rTj0zvx+4gArn+dhoN1SdFaYioDn/BJO2ihGWqMF/ThT1yFonUIUzThO+5LHsTSfmpu3FalNefmVCYGu6Eo9zXuEi0tYKWITq6/KVsvpHxmxE5jrFroun+jewnBSJBKBY73rUbihR/RKC64m1kFIIYbfYEZ4+9/TALrFZWEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dipTyh+Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dipTyh+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749108879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VHnzJv9LA2nj2uz8Wh287T9rM+Per3aLlUbT6DCwHiw=;
	b=dipTyh+ZK+/+54DV+Oer26cHTJLDuPyxGtO+T+HBfTjWmfj8VEfDRC7e1Ox9opYi7mi6Rw
	iK5Vyi/aHagW96p3bid1bSyoS9Uo3FBdiKEG9u+FIPw0Ni9anJUEGCrXUzt07KqIrhqnA3
	Vksg6mLtkEKLMv1JcO8woyO/euIfKgY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-_A_kSwBRMyWuIA9aW-XH7g-1; Thu, 05 Jun 2025 03:34:38 -0400
X-MC-Unique: _A_kSwBRMyWuIA9aW-XH7g-1
X-Mimecast-MFC-AGG-ID: _A_kSwBRMyWuIA9aW-XH7g_1749108878
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-52e324fa27fso177957e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749108878; x=1749713678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHnzJv9LA2nj2uz8Wh287T9rM+Per3aLlUbT6DCwHiw=;
        b=wOeOPLrirwB53F/K/ZEoSrSOsps65naZsCXUUetkF9pquA4HGhpmyDUxLVhLJDkqZ+
         RlvQmqMIP9WBBeu2WmazB9c3KIciw2B8AN0qZzuCSQr+oVGfGYiyLmJNok7u0pzVQqiT
         OH2M9vSCvXudzU9dhkT61go1zNVCj4Jj9zhty24NtwmYsL5iNVWjiYMA/W1YUfRt8QG9
         zKxSrZI+7uJ77M8PAhTvp06d86D/uh4oiv6AC5z5bC+MfQlZ9YztNoDSjs5qv0cesnnB
         5el0xgSwnbCYEVMTXRp9LaH1IvPTRDTAgR+mFU79FPUVoUD+Fy/1u4yTHKdG8SzeM/3s
         DM7A==
X-Forwarded-Encrypted: i=1; AJvYcCUUjhO0WOd0WiJDYP1BQSF1mFZEi504pjbVrD+EVfA+2rDeVouDvZc2pCc7nLJj0jvxxkK9N7SVNOMoSrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6BEeyF1OpMChst76/XkPWqdF2zz++TrlTSrPlWznWth3efXm
	jppIRqimdYmaP7snVml46qCPW34yPLrGYN7buPYg9lHWvAwwoxolQgdSkl6IA783GPsShybFdVM
	v7U6sq9KUCp2gdCxmU1b5Dg+IZ9yxcZ1WmQ6jlrZxzcUCcAe8UtwSm8l2EOuBGpDVfaCvO3vW1Q
	Vnnn6fc4AWfVpqmLJC8aYzZ5ue5t2+Z87mgIgE60KF
X-Gm-Gg: ASbGncuzbOAln7jdkn0jFYetChUD6vGItVWcTArNHb7I7aYOkOTWw9gA2lw63CrXHPQ
	ofWN4SDbbSeLmJVP0liPmbD9LK2DUE5HN/r62DnYMCXf5GCxHDFAmaEGQoZPCkGlAi2dcng==
X-Received: by 2002:a05:6122:2a06:b0:520:64ea:c479 with SMTP id 71dfb90a1353d-530c738fb3cmr4593825e0c.10.1749108877962;
        Thu, 05 Jun 2025 00:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER5ITUNDLcK9grbqWm5Pg6Bli/9p0K1++5vEDb2JsKQLZyOL2hncqmDmJdkJXon3YT/PF2oQWgj25knXxdiUo=
X-Received: by 2002:a05:6122:2a06:b0:520:64ea:c479 with SMTP id
 71dfb90a1353d-530c738fb3cmr4593815e0c.10.1749108877663; Thu, 05 Jun 2025
 00:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531095800.160043-1-lulu@redhat.com> <20250531095800.160043-4-lulu@redhat.com>
 <20250601064429-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250601064429-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 5 Jun 2025 15:34:01 +0800
X-Gm-Features: AX0GCFsucvW1N5vvL9k5P8A2rP0lcWEDUo_lq6fMWFm6KBSsQNV3SxnYbfjllj4
Message-ID: <CACLfguWWcTNRXt7KO4D-Bwno2QF14Tkptw3HwM3P_RX62zu=uw@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 3/3] vhost: Add new UAPI to select kthread mode
 and KConfig to enable this IOCTL
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 1, 2025 at 6:49=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Sat, May 31, 2025 at 05:57:28PM +0800, Cindy Lu wrote:
> > This patch introduces a new UAPI that allows the vhost device to select
> > in kthread mode. Userspace applications can utilize IOCTL
> > VHOST_FORK_FROM_OWNER to select between task and kthread modes, which
> > must be invoked before IOCTL VHOST_SET_OWNER, as the worker will be
> > created during that call.
> >
> > The VHOST_NEW_WORKER requires the inherit_owner setting to be true, and
> > a check has been added to ensure proper configuration.
> >
> > Additionally, a new KConfig option, CONFIG_VHOST_ENABLE_FORK_OWNER_IOCT=
L,
> > is introduced to control the availability of the IOCTL
> > VHOST_FORK_FROM_OWNER. When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set
> > to n, the IOCTL is disabled, and any attempt to use it will result in a
> > failure.
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
>
> I propose renaming
> CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
> to
> CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL
> and it should also control the presence of the module parameter
> and a get ioctl (more on which below).
>
> Otherwise we can get a situation where task mode is disabled and
> there is no way for userspace to override or check.
>
>
sure, will do
Thanks
cindy
>
> > ---
> >  drivers/vhost/Kconfig      | 13 +++++++++++++
> >  drivers/vhost/vhost.c      | 30 +++++++++++++++++++++++++++++-
> >  include/uapi/linux/vhost.h | 16 ++++++++++++++++
> >  3 files changed, 58 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> > index 020d4fbb947c..300e474b60fd 100644
> > --- a/drivers/vhost/Kconfig
> > +++ b/drivers/vhost/Kconfig
> > @@ -96,3 +96,16 @@ config VHOST_CROSS_ENDIAN_LEGACY
> >         If unsure, say "N".
> >
> >  endif
> > +
> > +config VHOST_ENABLE_FORK_OWNER_IOCTL
> > +     bool "Enable IOCTL VHOST_FORK_FROM_OWNER"
> > +     default n
> > +     help
> > +       This option enables the IOCTL VHOST_FORK_FROM_OWNER, allowing
> > +       userspace applications to modify the thread mode for vhost devi=
ces.
> > +
> > +       By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL` is set to `n=
`,
> > +       which disables the IOCTL. When enabled (y), the IOCTL allows
> > +       users to set the mode as needed.
> > +
> > +       If unsure, say "N".
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > index 2d2909be1bb2..cfa60dc438f9 100644
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> > @@ -1022,6 +1022,13 @@ long vhost_worker_ioctl(struct vhost_dev *dev, u=
nsigned int ioctl,
> >       switch (ioctl) {
> >       /* dev worker ioctls */
> >       case VHOST_NEW_WORKER:
> > +             /*
> > +              * vhost_tasks will account for worker threads under the =
parent's
> > +              * NPROC value but kthreads do not. To avoid userspace ov=
erflowing
> > +              * the system with worker threads inherit_owner must be t=
rue.
> > +              */
> > +             if (!dev->inherit_owner)
> > +                     return -EFAULT;
> >               ret =3D vhost_new_worker(dev, &state);
> >               if (!ret && copy_to_user(argp, &state, sizeof(state)))
> >                       ret =3D -EFAULT;
> > @@ -1138,7 +1145,7 @@ void vhost_dev_reset_owner(struct vhost_dev *dev,=
 struct vhost_iotlb *umem)
> >       int i;
> >
> >       vhost_dev_cleanup(dev);
> > -
> > +     dev->inherit_owner =3D inherit_owner_default;
> >       dev->umem =3D umem;
> >       /* We don't need VQ locks below since vhost_dev_cleanup makes sur=
e
> >        * VQs aren't running.
> > @@ -2292,6 +2299,27 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsign=
ed int ioctl, void __user *argp)
> >               goto done;
> >       }
> >
> > +#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
> > +     if (ioctl =3D=3D VHOST_FORK_FROM_OWNER) {
> > +             u8 inherit_owner;
> > +             /*inherit_owner can only be modified before owner is set*=
/
> > +             if (vhost_dev_has_owner(d)) {
> > +                     r =3D -EBUSY;
> > +                     goto done;
> > +             }
> > +             if (copy_from_user(&inherit_owner, argp, sizeof(u8))) {
> > +                     r =3D -EFAULT;
> > +                     goto done;
> > +             }
> > +             if (inherit_owner > 1) {
> > +                     r =3D -EINVAL;
> > +                     goto done;
> > +             }
> > +             d->inherit_owner =3D (bool)inherit_owner;
> > +             r =3D 0;
> > +             goto done;
> > +     }
> > +#endif
> >       /* You must be the owner to do anything else */
> >       r =3D vhost_dev_check_owner(d);
> >       if (r)
> > diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
> > index d4b3e2ae1314..d2692c7ef450 100644
> > --- a/include/uapi/linux/vhost.h
> > +++ b/include/uapi/linux/vhost.h
> > @@ -235,4 +235,20 @@
> >   */
> >  #define VHOST_VDPA_GET_VRING_SIZE    _IOWR(VHOST_VIRTIO, 0x82,       \
> >                                             struct vhost_vring_state)
> > +
> > +/**
> > + * VHOST_FORK_FROM_OWNER - Set the inherit_owner flag for the vhost de=
vice,
> > + * This ioctl must called before VHOST_SET_OWNER.
> > + *
> > + * @param inherit_owner: An 8-bit value that determines the vhost thre=
ad mode
> > + *
> > + * When inherit_owner is set to 1(default value):
> > + *   - Vhost will create tasks similar to processes forked from the ow=
ner,
> > + *     inheriting all of the owner's attributes.
> > + *
> > + * When inherit_owner is set to 0:
> > + *   - Vhost will create tasks as kernel thread.
> > + */
> > +#define VHOST_FORK_FROM_OWNER _IOW(VHOST_VIRTIO, 0x83, __u8)
>
>
>
> Given default now depends on the module parameter, we should
> have both GET and SET ioctls. All controlled by the kconfig knob.
>
Sure, will do
Thanks
cindy

> > +
> >  #endif
> > --
> > 2.45.0
>

