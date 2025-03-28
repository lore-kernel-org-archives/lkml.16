Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88EF18DB2B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150300; cv=none; b=QmMMxvpIow0Pm6j4Ytab9cRoKdVmFQG8opWSATWKBo81DtY++rU1OSu/ME0QBJXyxLdE10LZW11P9yLA4XCHBNGGfwiBfza68G8YgNqw0NdoZl4NzyHQAE8PtODFbvCYHYscbIxjp9HJVSVHEz2gjhJsfG5zs0MgEbQxxI2R2SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150300; c=relaxed/simple;
	bh=2SQ18ucLJlA/WDehkdf9V9I8lMbGgu+W41AmkvrU9lA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzoXxC5s24XQ4vKEGX8WpG4WURwkq2/LzXfzNJ/IjWgu2L/os7qzneXTBugMPNSoecBp6Kc01jh0en5rkaQ7Kjnr/lC9jqBXldhoGrXjxYx8mK0/pJmgSdFslQr/98K2piesvg5/DAPlXQR/Q3SSl4rziBhN6ymUonglQT3jm68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MpoJcvSy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MpoJcvSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743150296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BByPHc1EbJ+bRVfFsgitlx6Z4FNGFeovzxNX8sqbyWM=;
	b=MpoJcvSyAdAWsUnpoz7k3IKn4Go5l/b/adLXT14egEtes93bfY9yT5RG1IkSBa1ISrooM4
	ZF8cTZlx175jglFhLx3gV0hOInpvsNnmpnQtTKKDAWEbWVsxPh9Ky0vVPH5rlbwX/4eXYg
	EoKHXArNblyGw1O4eWChwBitAkZ6z0Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-nf6r8Zi-OgGh2n6kiiqWfQ-1; Fri, 28 Mar 2025 04:24:55 -0400
X-MC-Unique: nf6r8Zi-OgGh2n6kiiqWfQ-1
X-Mimecast-MFC-AGG-ID: nf6r8Zi-OgGh2n6kiiqWfQ_1743150294
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac25852291cso172583966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743150294; x=1743755094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BByPHc1EbJ+bRVfFsgitlx6Z4FNGFeovzxNX8sqbyWM=;
        b=OPCbf7d1YluxdxpQYGqE7v7eMpi8nJLF4BtYpt+BaL0So/cDKjK7HONEJyDS8SL3AP
         NtYwX6Jj58+FNASjyS2acUGu/xkEd+VOZorgtV/4BPXjrpFNQSZebrHDmAMB6NH/r9nI
         1NSFsJoxT3P2WivMwDyJOPEpjzLccCnVUhN32MLPe7TzFpb4GkudOSKwDTL8D0W51pi6
         Iz0wbUOuhD1u2iFDsqHDOc11odyX/0NYgzrbPMVm2mKk1e8gSoOwJOVtMD6BAzY/ZYEb
         jf/7wyHJIF8Bf7/AlnbrxmdYDXmDUo1CvLtJGohfXiufMNTtc/N24mwnLNIt+csiBJ5s
         e5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4ZKK6o7S4T4FJmEtKP0o9e/zKiUY+SqwgQdIZKX5XfdN2Km5C7kPlxpUgsuxJLLRKK/eRM5yN3gwZyaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUNeOLGeIkkxO/SupncRveUB2OKRfK4MwZPsDQFAfjvpDQd9T
	xmc9edpsySPf3Ewi0zU0TWIK4njcJFgFJzoDPJQBVrPhpBaw2e/DoVnNsNePrNVNuQZUcWPrePa
	NraM/u0YaTW5Hn/uXjZ3MzBGVaw9QQD1QXLw7C2drf0P43tOwmCtdScm4qRFO01orB4cjX11lh4
	0mWyWlv57NjQ4AXRnWBN178CagAkzOxiI757Kd
X-Gm-Gg: ASbGncvdrQP+dW3I9sBKvCNcLBRhfevjhKYJtvrnPdNNi7+d/tTlp8WhT3lSVrJN51M
	NhzzJfxNvINTyWVLdlTOfp3FJZZOv/mGWfjyJkURb8fRhwujaMIlcZjv1bWeSoE72s/5X1+ZD3Q
	==
X-Received: by 2002:a17:907:3da1:b0:ac2:6bb5:413c with SMTP id a640c23a62f3a-ac6faf45fbcmr606738166b.31.1743150293890;
        Fri, 28 Mar 2025 01:24:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtMhfeTWQPQjJeKYr+nJHbqXTHzDbGeqlUciCnVAp35iT66VTiKxpvEvBTFOnIR4IcWISTOodMTXSNsbNA918=
X-Received: by 2002:a17:907:3da1:b0:ac2:6bb5:413c with SMTP id
 a640c23a62f3a-ac6faf45fbcmr606736266b.31.1743150293417; Fri, 28 Mar 2025
 01:24:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302143259.1221569-1-lulu@redhat.com> <20250302143259.1221569-9-lulu@redhat.com>
 <CACGkMEv7WdOds0D+QtfMSW86TNMAbjcdKvO1x623sLANkE5jig@mail.gmail.com> <20250303122619-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250303122619-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Fri, 28 Mar 2025 16:24:16 +0800
X-Gm-Features: AQ5f1JqvVP-O68vnR03mHsDRfnjJbKsFvNhVjO1Pg4znL65FpHw8MZuudqkctsg
Message-ID: <CACLfguWmXVDr6hgGvCEsNBpTEd-3zePR2fMk6BhBf7z8F4r0uA@mail.gmail.com>
Subject: Re: [PATCH v7 8/8] vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 1:33=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Mon, Mar 03, 2025 at 01:52:06PM +0800, Jason Wang wrote:
> > On Sun, Mar 2, 2025 at 10:34=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrot=
e:
> > >
> > > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> > > to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> > > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> > > is disabled, and any attempt to use it will result in failure.
> > >
> > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > > ---
> > >  drivers/vhost/Kconfig | 15 +++++++++++++++
> > >  drivers/vhost/vhost.c | 11 +++++++++++
> > >  2 files changed, 26 insertions(+)
> > >
> > > diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> > > index b455d9ab6f3d..e5b9dcbf31b6 100644
> > > --- a/drivers/vhost/Kconfig
> > > +++ b/drivers/vhost/Kconfig
> > > @@ -95,3 +95,18 @@ config VHOST_CROSS_ENDIAN_LEGACY
> > >           If unsure, say "N".
> > >
> > >  endif
> > > +
> > > +config VHOST_ENABLE_FORK_OWNER_IOCTL
> > > +       bool "Enable IOCTL VHOST_FORK_FROM_OWNER"
> > > +       default n
> > > +       help
> > > +         This option enables the IOCTL VHOST_FORK_FROM_OWNER, which =
allows
> > > +         userspace applications to modify the thread mode for vhost =
devices.
> > > +
> > > +          By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL` is set =
to `n`,
> > > +          meaning the ioctl is disabled and any operation using this=
 ioctl
> > > +          will fail.
> > > +          When the configuration is enabled (y), the ioctl becomes
> > > +          available, allowing users to set the mode if needed.
> > > +
> > > +         If unsure, say "N".
> > > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > > index fb0c7fb43f78..09e5e44dc516 100644
> > > --- a/drivers/vhost/vhost.c
> > > +++ b/drivers/vhost/vhost.c
> > > @@ -2294,6 +2294,8 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsig=
ned int ioctl, void __user *argp)
> > >                 r =3D vhost_dev_set_owner(d);
> > >                 goto done;
> > >         }
> > > +
> > > +#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
> > >         if (ioctl =3D=3D VHOST_FORK_FROM_OWNER) {
> > >                 u8 inherit_owner;
> > >                 /*inherit_owner can only be modified before owner is =
set*/
> > > @@ -2313,6 +2315,15 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsi=
gned int ioctl, void __user *argp)
> > >                 r =3D 0;
> > >                 goto done;
> > >         }
> > > +
> > > +#else
> > > +       if (ioctl =3D=3D VHOST_FORK_FROM_OWNER) {
> > > +               /* When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is 'n', =
return error */
> > > +               r =3D -ENOTTY;
> > > +               goto done;
> > > +       }
>
> why do we need this? won't it fail as any other unsupported ioctl?
>
Sure, will remove  this
thanks
cindy
> > > +#endif
> > > +
> > >         /* You must be the owner to do anything else */
> > >         r =3D vhost_dev_check_owner(d);
> > >         if (r)
> > > --
> > > 2.45.0
> >
> > Do we need to change the default value of the inhert_owner? For example=
:
> >
> > #ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
> > inherit_owner =3D false;
> > #else
> > inherit_onwer =3D true;
> > #endif
> >
> > ?
>
> I feel it is best to keep the default consistent.
> All the kconfig should do, is block the ioctl.
>
>
> > Other patches look good to me.
> >
> > Thanks
> >
> > >
>

