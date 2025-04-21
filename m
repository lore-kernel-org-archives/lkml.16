Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AC35FDA7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745207182; cv=none; b=myznaPAxuzKvN9TO5mAMjsVpyTAZJRq/D76R1xiaVlELrxeVzgib9YD1zzv6sXf/iKtlm7AEeHIAtO4sINK/wyYAR9L6XrcjaCcZXuUnTjobEUUJaPBDcOegR35T9+s/QtRYrsdyJxiHx457atf3CgNqKb0k+KNsVm4HVPUDLMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745207182; c=relaxed/simple;
	bh=WDWbIvSU773gRjsi9Bt8QnyBPdTx2jqcvGDaCCgw+xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VrXkF9ADKWLepihzj+h+5Dy29iAPcvMU/Cq8x++EtT+aOS3M8hQIyVmTn1mGCABXA2psI2GsnQQCM59W9mcQ30b+WEsfq+yZ8lALAGmwvKBMNZ5nAc6lTSvv2Hf2H6CVgHqwMx13IVlvpceRKiVq3E7+5FczNj5eI3iT4AgLZ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQKqd+bg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQKqd+bg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745207179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9MmNHzTsOXktJvVrWiuSPufs0RXIPgJ4SHes9h94zrI=;
	b=eQKqd+bgySb3n2oFtJqPLi1otd/z9soAeg19HEUnkJcvX4/9NQSeKbMFZZlWUH4AVTRoav
	joar3A38i2HZBznNOsl5pDJ2iTIJu6dtSEIc8EFT20Wa4HOx1ZJl1Ags31R84rFfq7FB0f
	9A9qaclVCv0chkEJlqf5iOUyPTikz80=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-girSVqliMbCJWBd5i9jxEA-1; Sun, 20 Apr 2025 23:46:18 -0400
X-MC-Unique: girSVqliMbCJWBd5i9jxEA-1
X-Mimecast-MFC-AGG-ID: girSVqliMbCJWBd5i9jxEA_1745207178
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-524021ac776so815428e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 20:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745207178; x=1745811978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MmNHzTsOXktJvVrWiuSPufs0RXIPgJ4SHes9h94zrI=;
        b=kDoRafRLTu4WS4wk7QhuidbhVbl809FZCWI/sWrHWoofPuhYH85DrOG+xOOyou0JxB
         81P5ls81THfBFjHsVppoQsw9gXovHpv1LfRC3b+mw/h/izzl63GN7btQuKJT09S5HPdf
         RS5LbVQrokNRYnaFWhs706QBnWF0uS1r57DJ6C7xVke8ThmgGDokcAGNu+KClAYV4CdJ
         N5FafAqvBAlkFokpgbolO28bzsiofZIQOOUdYOBMKNL6v65HIC8eRUkT/uRD0pesaPBT
         d3+x4mxwWBjHiHwnL4WQ05mp08KbxqRsJpLU+mV5e7w5UH7xhqcYVSYzJgKEEJD+IrGk
         ZzSg==
X-Forwarded-Encrypted: i=1; AJvYcCXyGLEDxHnPmPpXhXCTifXfcKFLQubjzpyUP848tqgmQ9aWosSJqVmjBxnZtZTe2aJzukBPQzGaHsCy49A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhRHxdQJA4tKQL45QEZ0hSz0l1BcIAUW4vEOYrafeK/PUQpLj2
	ZN9wiTizsHwI47TSTGr7jzJBw91rzIMFwVJdRriI89q9/zb28d9JWGBPmNZ5MwC5D2rtWDDdn8k
	CxDmv6C0e+GyfVSZvl2BUmQ7vXSvx0I3uV7NlePGV/4u3uPkeVvHCZaM/++nKuu+wcdWlYa9fzl
	XMDyuH5EWMUVBnrpEwokxLCx8YYy1JEsFIGjgI
X-Gm-Gg: ASbGncuLATnVVn7whkAIQGtCISHOS18SWkdxdwvDjCyzismbnGc4Y9Bx8/bJ1Dqo18Z
	unFDSPYwbbCSpkP7Ke+6uh7vs1njyGRnJDvGdsiCUU2/8CftamWIm67Ia+ixviXd6ltY/JA==
X-Received: by 2002:a67:f085:0:b0:4cb:5d6e:e6c8 with SMTP id ada2fe7eead31-4cb80128dcamr5512631137.9.1745207177638;
        Sun, 20 Apr 2025 20:46:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjeQwKCOfHzvN3lUTtfHim7VBEQTh/TCbfRNy3QnFlzQ8hxPYthyT/QZOXVv5k8ci+MMU+1s1BplANJT3lPBo=
X-Received: by 2002:a67:f085:0:b0:4cb:5d6e:e6c8 with SMTP id
 ada2fe7eead31-4cb80128dcamr5512625137.9.1745207177278; Sun, 20 Apr 2025
 20:46:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421024457.112163-1-lulu@redhat.com> <20250421024457.112163-5-lulu@redhat.com>
 <CACGkMEt-ewTqeHDMq847WDEGiW+x-TEPG6GTDDUbayVmuiVvzg@mail.gmail.com>
In-Reply-To: <CACGkMEt-ewTqeHDMq847WDEGiW+x-TEPG6GTDDUbayVmuiVvzg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Apr 2025 11:46:04 +0800
X-Gm-Features: ATxdqUHeO85TtbIdV-aJBSr0-Cr6xqgcKTQNuiFED9cSXLQ7VllgtcbY3bYiDRg
Message-ID: <CACGkMEte6Lobr+tFM9ZmrDWYOpMtN6Xy=rzvTy=YxSPkHaVdPA@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 11:45=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
>
> On Mon, Apr 21, 2025 at 10:45=E2=80=AFAM Cindy Lu <lulu@redhat.com> wrote=
:
> >
> > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> > to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> > is disabled, and any attempt to use it will result in failure.
>
> I think we need to describe why the default value was chosen to be false.
>
> What's more, should we document the implications here?
>
> inherit_owner was set to false: this means "legacy" userspace may

I meant "true" actually.

> still be broken unless it can do VHOST_FORK_FROM_OWNER which is
> impractical. Does this defeat the purpose of this series actually?
>
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  drivers/vhost/Kconfig | 15 +++++++++++++++
> >  drivers/vhost/vhost.c |  3 +++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> > index 020d4fbb947c..bc8fadb06f98 100644
> > --- a/drivers/vhost/Kconfig
> > +++ b/drivers/vhost/Kconfig
> > @@ -96,3 +96,18 @@ config VHOST_CROSS_ENDIAN_LEGACY
> >           If unsure, say "N".
> >
> >  endif
> > +
> > +config VHOST_ENABLE_FORK_OWNER_IOCTL
> > +       bool "Enable IOCTL VHOST_FORK_FROM_OWNER"
> > +       default n
> > +       help
> > +         This option enables the IOCTL VHOST_FORK_FROM_OWNER, which al=
lows
> > +         userspace applications to modify the thread mode for vhost de=
vices.
> > +
> > +          By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL` is set to=
 `n`,
> > +          meaning the ioctl is disabled and any operation using this i=
octl
> > +          will fail.
> > +          When the configuration is enabled (y), the ioctl becomes
> > +          available, allowing users to set the mode if needed.
> > +
> > +         If unsure, say "N".
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > index fb0c7fb43f78..568e43cb54a9 100644
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> > @@ -2294,6 +2294,8 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigne=
d int ioctl, void __user *argp)
> >                 r =3D vhost_dev_set_owner(d);
> >                 goto done;
> >         }
> > +
> > +#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
> >         if (ioctl =3D=3D VHOST_FORK_FROM_OWNER) {
> >                 u8 inherit_owner;
> >                 /*inherit_owner can only be modified before owner is se=
t*/
> > @@ -2313,6 +2315,7 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigne=
d int ioctl, void __user *argp)
> >                 r =3D 0;
> >                 goto done;
> >         }
> > +#endif
> >         /* You must be the owner to do anything else */
> >         r =3D vhost_dev_check_owner(d);
> >         if (r)
> > --
> > 2.45.0
> >
>
> Thanks

Thanks

