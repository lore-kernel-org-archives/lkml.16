Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FD015A856
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750294949; cv=none; b=TmwGyM0Z6rMJzm8E8qSVk2HrPlBfPdl+n9NP6bhmYzCBdanO3xPCob9u5TS2OZpzaRUlJwkYAdME3maJ28Q8FUo1yYaQoOKmELxeg+3rzSIijF4EeAPjII822AT4IKrKLB3KgWmb2GPDqRPzj6mQUve7SFiQJkxLdE13PJHI1+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750294949; c=relaxed/simple;
	bh=Gh2HTqjo6HqHISVOKNkZllB0IT8SZEBJKMzIIC1BIaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S17fA5DDz0Ni+ItP1FTGh9aiY2X6qRAwJD2gtA+Ag/62BdzDvrEGM9s12LzFEENhuXbX7oU2KKrOFfPsAEetTqIXjixAWtcWfXgGu+aKsePjF7V9mSqLA8Abn/1BhDj6Me7Z89hyNbPa5nHJjJLXbfVdXkUeBYuXPNXZecpT85w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OT79OqfA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OT79OqfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750294946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l65TrwKTqa28Ab3gvX6Whw90rT+WUXHj8udnKRnKtFc=;
	b=OT79OqfApvnu1E9zTD0koX7+45EIWvIEDJKB9MCWQbJFD8NND6G9wWcEdRgW0/U/Kg2Xlp
	O7kjDreggsKMj3JCuwhj7Hx5jH6EB6/VJX4H5VpGsEWOR+ZHAuQQ5zMkAWnKuCWNHPCkhj
	z/rN9V7y8aPBCGcBQDKkKc4SGtiNrGY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-7treXa1FO52zpprBZUzHKQ-1; Wed, 18 Jun 2025 21:02:24 -0400
X-MC-Unique: 7treXa1FO52zpprBZUzHKQ-1
X-Mimecast-MFC-AGG-ID: 7treXa1FO52zpprBZUzHKQ_1750294944
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so189771a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750294943; x=1750899743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l65TrwKTqa28Ab3gvX6Whw90rT+WUXHj8udnKRnKtFc=;
        b=MJFq2OPi5oqAMJgCkrGsJRT4Cf8S/QmLuvLpKal8aiDG5/qlACMpFYDQyPOboYIcE9
         bJGwvfyWIHbkYfImJkvyr44mmg2OCXbIAmTOwd9efSCETMoNqkEEBq47lwhm5tkclgSg
         kZjJ5Af1DwOq1+HGWFHde2pJBa/BH214OcjNL70DzHGIjJI4fj0VjnzqBfcbm0SNbVWI
         cR9hB2AZ5/4+G8hB3mlGBz9muxquh06A2E0zTw4Lnul4ZX1GlbrsRyzAHf+kFPM8f9qt
         FBvJZY2MTD/aeDT4KE0BxlMtdkjQwYm7aPeCzv3rwaINK+tqAS+r/HA++xoN2ILS6VNn
         8NKw==
X-Forwarded-Encrypted: i=1; AJvYcCUTVSb0eg4dPe3Y9GfnWbjV7twywE/xfgsy0hpJAVMnm62iHkuTubxVCmC3UpIYbli6dDoRS9RaDasjUqs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SZ74VlpPUOMNlaNxgku3ASXGfaO8XqSbpAhXv9jY/WFXTLv0
	Lw5ayTeiQKU8cHtF4oAffGTz4P+BKUooh+p/1ivrZj5zba+nKf0D1/FUGiNURlrxbtatcVNPsQt
	iD73fReCGTvshkfQxGmjuTvbasuMzRtPBbt+2sUUeB6cSWNO1EmKcGdylDB6C2rPgGexCoGf6A5
	HO3V4AqClWcAP2HP2bWQqBPR738wLVbNZMq3GOlfy5
X-Gm-Gg: ASbGncvkmqgzON63xEDcsiNsmYs+aYZqKIfR1E4Tz5EAIb1GpSKr0EIwun7u8NveEHm
	6PiBGCX7KCqCN0OhKIswawApMKTCTRiSGVG8gudub6Na/MxPEJfbkWMxK6Bsbr4h8kG6kruaTfT
	Uo
X-Received: by 2002:a17:90b:4b07:b0:311:e358:c4af with SMTP id 98e67ed59e1d1-313f1d4e22fmr33298308a91.16.1750294943516;
        Wed, 18 Jun 2025 18:02:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvD1oNGfqVd8IaeRKyp0By/ZB9vOLf69wY8Wdjl95C+Bq7i6eW/n+2Kf6VIikkjjMZqqg/6jugigwoZuc6aLU=
X-Received: by 2002:a17:90b:4b07:b0:311:e358:c4af with SMTP id
 98e67ed59e1d1-313f1d4e22fmr33298246a91.16.1750294942980; Wed, 18 Jun 2025
 18:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616062922.682558-1-lulu@redhat.com> <20250616062922.682558-2-lulu@redhat.com>
 <6107dcb2-51a3-42f8-b856-f443c0e2a60d@6wind.com>
In-Reply-To: <6107dcb2-51a3-42f8-b856-f443c0e2a60d@6wind.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 19 Jun 2025 09:02:11 +0800
X-Gm-Features: AX0GCFsYtNF6CJUPUnvICkqbfymXVtXGjil77zAKX7_d_Qq1yhWIuFMie025ixE
Message-ID: <CACGkMEsJdfeNuHdKu0OH=sT4RYhN3d_VOnDcu4_-FquRXo24Xw@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] vhost: Reintroduces support of kthread API and
 adds mode selection
To: nicolas.dichtel@6wind.com
Cc: Cindy Lu <lulu@redhat.com>, mst@redhat.com, michael.christie@oracle.com, 
	sgarzare@redhat.com, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 8:06=E2=80=AFPM Nicolas Dichtel
<nicolas.dichtel@6wind.com> wrote:
>
> Le 16/06/2025 =C3=A0 08:28, Cindy Lu a =C3=A9crit :
> > This patch reintroduces kthread mode for vhost workers and provides
> > configuration to select between kthread and task worker.
> >
> > - Add 'fork_owner' parameter to vhost_dev to let users select kthread
> >   or task mode. Default mode is task mode(VHOST_FORK_OWNER_TASK).
> >
> > - Reintroduce kthread mode support:
> >   * Bring back the original vhost_worker() implementation,
> >     and renamed to vhost_run_work_kthread_list().
> >   * Add cgroup support for the kthread
> >   * Introduce struct vhost_worker_ops:
> >     - Encapsulates create / stop / wake=E2=80=91up callbacks.
> >     - vhost_worker_create() selects the proper ops according to
> >       inherit_owner.
> >
> > - Userspace configuration interface:
> >   * New IOCTLs:
> >       - VHOST_SET_FORK_FROM_OWNER lets userspace select task mode
> >         (VHOST_FORK_OWNER_TASK) or kthread mode (VHOST_FORK_OWNER_KTHRE=
AD)
> >       - VHOST_GET_FORK_FROM_OWNER reads the current worker mode
> >   * Expose module parameter 'fork_from_owner_default' to allow system
> >     administrators to configure the default mode for vhost workers
> >   * Kconfig option CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL controls whet=
her
> >     these IOCTLs and the parameter are available (for distros that may
> >     want to disable them)
> >
> > - The VHOST_NEW_WORKER functionality requires fork_owner to be set
> >   to true, with validation added to ensure proper configuration
> >
> > This partially reverts or improves upon:
> >   commit 6e890c5d5021 ("vhost: use vhost_tasks for worker threads")
> >   commit 1cdaafa1b8b4 ("vhost: replace single worker pointer with xarra=
y")
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  drivers/vhost/Kconfig      |  17 +++
> >  drivers/vhost/vhost.c      | 244 ++++++++++++++++++++++++++++++++++---
> >  drivers/vhost/vhost.h      |  22 ++++
> >  include/uapi/linux/vhost.h |  29 +++++
> >  4 files changed, 294 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> > index 020d4fbb947c..1b3602b1f8e2 100644
> > --- a/drivers/vhost/Kconfig
> > +++ b/drivers/vhost/Kconfig
> > @@ -95,4 +95,21 @@ config VHOST_CROSS_ENDIAN_LEGACY
> >
> >         If unsure, say "N".
> >
> > +config VHOST_ENABLE_FORK_OWNER_CONTROL
> > +     bool "Enable VHOST_ENABLE_FORK_OWNER_CONTROL"
> > +     default n
> Why disabling this option by default?

I think we should enable this by default.

Thanks

>
> Regards,
> Nicolas
>

