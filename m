Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C65720DD79
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743140626; cv=none; b=iURaGlyge02T+PCM+GfpiUM2Igwd04+zihArWJG6MwNwV9JIY95BV/Ef2uH5bO8mYYoDVGWzlFERN79Md9gJZr+EnTYsiCodu11R8x/oSABTRcDWJUR61Eq7Y0mtxki1RQgrjg7OE/8So+Rmzn6W5eRxJL006TJ43x3Sfc/9P1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743140626; c=relaxed/simple;
	bh=R1Cd1RWDi2fBuC1OYcPiJgOwZpJZ3ikPbq83P1CyQQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q09HmsSSBlu9K6bgvzrUNSzqAUKxyIVel9K3Fq1ztD/Swr6qfRkDN4Ms4kFRK165XQmGjIIVLSfC4+AHOrPgjweoQ8UQpRp8Ej8A2VxXJ2PHoBVi/DAoZzII6iCkdnOY3poyLVl+4fUEsGPUHe5J3/jOVW9rXuuEVIZiIuECm18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bRIJ/CHi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bRIJ/CHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743140622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wksMuYw/9GpKsbd4SKNGSlHUTKX13CwUN+KU7W5lxQ=;
	b=bRIJ/CHigNm6EY31Gpn3xt0nPlOlgi2K/W/UFgoQkb5yni4XFI+IQhqEjrzqgIyaFksYEx
	eAEh8F6h7k6wqfEiT5BxrOBAljBYdDuBf1tJLQ7BZNj4yMNPRDFbEQZIgiRwmuns2+ojUa
	xpuhDKfx63/ATx9TjakVwWHTmm4HSsY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-794KoKxCMBeqgF1d4ZcL0w-1; Fri, 28 Mar 2025 01:43:39 -0400
X-MC-Unique: 794KoKxCMBeqgF1d4ZcL0w-1
X-Mimecast-MFC-AGG-ID: 794KoKxCMBeqgF1d4ZcL0w_1743140618
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ab397fff5a3so179270766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743140618; x=1743745418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wksMuYw/9GpKsbd4SKNGSlHUTKX13CwUN+KU7W5lxQ=;
        b=CIZ3gtyt1bTlWoZQWgTntO0wUU76PIPn98r2/sD1TOD4TWYSPFs9R0HjB4TqmJpVDr
         7ueIeymEE2xm4NdfSRaNk9bWP5gm5RNH7GDvImxg8rPDIN+FhJdQN/rlfXkohuXdgu8L
         Upl91nqF+Cjv/vU3oBE6n8AXgYuRIEqing46+Mt4SytUDuzFwT9CS/qTz7hyqcVkeewk
         xlGz6dfBFxMg2sNsmpOZ5qchrDNRdyRc8Wx9OqgEJQIAyKB5wVKzjz012XMAZhB8J17Y
         ZBhPU1CCmhJtnIvuDR900dmBvk4Fj6h2de4JxkaSaWXN3buiETYcPjOGYWRAnq0F5D2V
         x/Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXNcPHWOkgVTEXlyc+rb5nKj+ZuSnezE2MrTpKqQfhOIhmGXqWqPGhDShYFNvfqJnOkj2M+3iVeucTOlvY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2BLcvxb4Cv3fivgZ57hAHy0ikebsSvqgazhfpVeJ3VY2Xb2hz
	PvKko71zA/7S3455Vsc0yk6ubV2FB9gDrXRx5WnFqAanw0CpRzmhjRSRTh+GAQNjoMx8MnToseZ
	qXlp1Ht0RJkpwMdoURVC4szLTEciq4/OT3gC5JzRZPOP0bsWxJ03SmYb/9doK2lkkgB6WQRuAgo
	z8ydY6Hlz1t1C44XIYvxU5Hgvt+guZlJ3rQ78dGV5Zcbxv
X-Gm-Gg: ASbGncu5nk3djPmOcNQzqgq/SZGejBFFOpUWXnYkyY4T4dntS2ppa9AO1TKg4pXCE+C
	sP3xhtrXI/M64RfFvVrWPQE9fHsYSZB/4HmDNGpviOVzXvcsyoE+Xq1uv/4zuL54bEYOOIrvJ/w
	==
X-Received: by 2002:a17:907:d09:b0:abf:48df:bf07 with SMTP id a640c23a62f3a-ac71ec953a4mr133952966b.15.1743140618027;
        Thu, 27 Mar 2025 22:43:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbNxIeMm1LXUGFUqFwfktfKRuuPWGPkRIHX8SMtj4Le0B0TdFaZ3P0I7nYy+Mxe+zRAUGYAlqF6VzzU8SAANg=
X-Received: by 2002:a17:907:d09:b0:abf:48df:bf07 with SMTP id
 a640c23a62f3a-ac71ec953a4mr133951066b.15.1743140617642; Thu, 27 Mar 2025
 22:43:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302143259.1221569-1-lulu@redhat.com> <20250321153611-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250321153611-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Fri, 28 Mar 2025 13:43:01 +0800
X-Gm-Features: AQ5f1JrnFEMx6y_4Kqib8q0i7cd7Ag5bB8-g7oD9EIrR0itmEqRSBH6v1-QxRBY
Message-ID: <CACLfguWG+rxAu-pBSKRd1etNQ0GBA33LHtG5vdKasub-1fueEQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] vhost: Add support of kthread API
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 3:37=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Sun, Mar 02, 2025 at 10:32:02PM +0800, Cindy Lu wrote:
> > In commit 6e890c5d5021 ("vhost: use vhost_tasks for worker threads"),
> > the vhost now uses vhost_task and operates as a child of the
> > owner thread. This aligns with containerization principles.
> > However, this change has caused confusion for some legacy
> > userspace applications. Therefore, we are reintroducing
> > support for the kthread API.
> >
> > In this series, a new UAPI is implemented to allow
> > userspace applications to configure their thread mode.
>
> This seems to be on top of an old tree.
> Can you rebase pls?
>
sure, I will rebase this
Thanks
Cindy
> > Changelog v2:
> >  1. Change the module_param's name to enforce_inherit_owner, and the de=
fault value is true.
> >  2. Change the UAPI's name to VHOST_SET_INHERIT_FROM_OWNER.
> >
> > Changelog v3:
> >  1. Change the module_param's name to inherit_owner_default, and the de=
fault value is true.
> >  2. Add a structure for task function; the worker will select a differe=
nt mode based on the value inherit_owner.
> >  3. device will have their own inherit_owner in struct vhost_dev
> >  4. Address other comments
> >
> > Changelog v4:
> >  1. remove the module_param, only keep the UAPI
> >  2. remove the structure for task function; change to use the function =
pointer in vhost_worker
> >  3. fix the issue in vhost_worker_create and vhost_dev_ioctl
> >  4. Address other comments
> >
> > Changelog v5:
> >  1. Change wakeup and stop function pointers in struct vhost_worker to =
void.
> >  2. merging patches 4, 5, 6 in a single patch
> >  3. Fix spelling issues and address other comments.
> >
> > Changelog v6:
> >  1. move the check of VHOST_NEW_WORKER from vhost_scsi to vhost
> >  2. Change the ioctl name VHOST_SET_INHERIT_FROM_OWNER to VHOST_FORK_FR=
OM_OWNER
> >  3. reuse the function __vhost_worker_flush
> >  4. use a ops sturct to support worker relates function
> >  5. reset the value of inherit_owner in vhost_dev_reset_owner s.
> >
> > Changelog v7:
> >  1. add a KConfig knob to disable legacy app support
> >  2. Split the changes into two patches to separately introduce the ops =
and add kthread support.
> >  3. Utilized INX_MAX to avoid modifications in __vhost_worker_flush
> >  4. Rebased on the latest kernel
> >  5. Address other comments
> >
> > Tested with QEMU with kthread mode/task mode/kthread+task mode
> >
> > Cindy Lu (8):
> >   vhost: Add a new parameter in vhost_dev to allow user select kthread
> >   vhost: Reintroduce vhost_worker to support kthread
> >   vhost: Add the cgroup related function
> >   vhost: Introduce vhost_worker_ops in vhost_worker
> >   vhost: Reintroduce kthread mode support in vhost
> >   vhost: uapi to control task mode (owner vs kthread)
> >   vhost: Add check for inherit_owner status
> >   vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
> >
> >  drivers/vhost/Kconfig      |  15 +++
> >  drivers/vhost/vhost.c      | 227 +++++++++++++++++++++++++++++++++----
> >  drivers/vhost/vhost.h      |  21 ++++
> >  include/uapi/linux/vhost.h |  15 +++
> >  4 files changed, 259 insertions(+), 19 deletions(-)
> >
> > --
> > 2.45.0
>

