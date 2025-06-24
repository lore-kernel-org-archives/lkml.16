Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86AA17D7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750734408; cv=none; b=pPt1LKQGHSKwosnpCsL3y1/Di+SPNRcFyxCOKLlBrxoESxLaRHgMjQC149LogE65I7J92sjN2epjQAtTMLk6E7uySbyU9uR02s7WTaRj3NlRDzpDAEaMPu61RFbp9nVw5Vstz6kWPmCf5/FDMVGfiDVsqQMFLXbtPtcDIUqmnH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750734408; c=relaxed/simple;
	bh=Hf4pTDvMYaPZ6cEcFPUxwJ3dIHRZ97tgnAGbROXDCAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E+4ipHiE6WeJQ/yjo3Xab2SQ5ziKwrskjJ0ZWqhER318OCT1y63PeNPLJvRLa2zsCq84aP8pcU9Ir31fZ0WXAXTRwYX9e0nR9ay+axQ8eenKQmCkR8Fupe8fb1ps6pXAhZzvhoJ2MuFXFDVInU97TyA6I09nvbXOd6UgoqWSyKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FFKjU/Yj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FFKjU/Yj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750734404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qx6sgmMMgVG7mUKi7Kr+wT8T087UyGpYIyapJqyqMJY=;
	b=FFKjU/Yj/LO6FCWlUX/XxYRNubiMVfDuBqrKe8aNikiSwyvZmVr+M0ZwA+MA8hNmJsGqHy
	kJP5subTVzVXlfsRFpoMCgEq5dyFTLjEoCJcowMmm3KXJ9+EW33cfiu79Pz7Tx1JhcnMMz
	T1hmcOZaofm8H2dsX0WfbQXZM6KDYc4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-GvLYpfTOMW6KRdkFlZUPEA-1; Mon, 23 Jun 2025 23:06:43 -0400
X-MC-Unique: GvLYpfTOMW6KRdkFlZUPEA-1
X-Mimecast-MFC-AGG-ID: GvLYpfTOMW6KRdkFlZUPEA_1750734402
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad9a8a5ecc6so419291266b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750734402; x=1751339202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qx6sgmMMgVG7mUKi7Kr+wT8T087UyGpYIyapJqyqMJY=;
        b=Ou1FenBBtfaE5om5oHrGnNSm/pS9SOwELLIIkMyA0WtoAD5J1F1xhIO3F+kZgQ+Dj6
         9QCiBSXvKG5iueLhQlpg7hflKRpRwwW5+HGtkFcQ6mU28fHHtUJ9P4W6skKhxi6CQavI
         w0L7abk+r5FTVtuPJ1uACyIN9NemYmNLK/2CCvdFbsPq7D8cl1zMeTZ95lW6tErYCFGs
         wprDAMldWyH3szovHfN9D4e/Y5BLzuZTpywaunEpkiW0c4L6E9J/nZdV6sWZoFF1gsxm
         OPzC4JU5Eyh7AhOHVHCqr7zCNxv6hwJpLWHnR/RK0f9l07BPo1W8XiI+RaUIimI94HkT
         j6SA==
X-Forwarded-Encrypted: i=1; AJvYcCWQxlqwElxauJfwjAodh56wE+KO7CuW2j6k9Bm04LLHY293dICozErng3okGG0rLnmRbAvFvkBSA4uQ+w8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfuz/jPsSLIKlGxEJ9s5qExsCIuObWWSlPt/sCwq2EYHt/ks1e
	pgidZu1laghPnLbg9F0vSRD5BYhz+b2LTBgoB2wYcVGx8zBm3OI1nyiM19rX/am5kR8ZOBZEhW9
	jsp/euqnHmVi0eSdiMqxcjRrkrLsYep8gci2qGea1x/GXr77DuGLa3P9sU7jrlTb9gB2KFyKAAD
	TMXiLLQiOmmvaLFcd5zXjq55cfSb6TQEAZO0R2bU78
X-Gm-Gg: ASbGncs4j7EulaLpfhkb8l0HaPgujYjmJloK3KSIEVBw/jNcZflIDOnkFzUhhtZlRv0
	dJGp2DqD7XpyVIKSQt8bqB4DiYptlcr9VhhFBJJdLQhb2a4JBkZnLvRW6I/8PVQ3jTlX7Ed5EOF
	BKDBog
X-Received: by 2002:a17:907:7e82:b0:ade:44a6:4a46 with SMTP id a640c23a62f3a-ae0579646camr1357685266b.24.1750734401891;
        Mon, 23 Jun 2025 20:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCafKAXMcIHxmBhRwK7iS3XqemOJaV64Z8YrHbwgZKXjFKieDbmnmUfsC1RX0ZnO0TrS5tn9NXnxrmG/36Ll0=
X-Received: by 2002:a17:907:7e82:b0:ade:44a6:4a46 with SMTP id
 a640c23a62f3a-ae0579646camr1357684166b.24.1750734401547; Mon, 23 Jun 2025
 20:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616062922.682558-1-lulu@redhat.com>
In-Reply-To: <20250616062922.682558-1-lulu@redhat.com>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 24 Jun 2025 11:06:04 +0800
X-Gm-Features: Ac12FXxonylFwEpUfkwEJ5y5yjB5bxPnbHAzx0yEInUcezXskog1NQQnLXV30mQ
Message-ID: <CAPpAL=y8WxyFiXifBDARFZf+wcEO1r3MYPg09MKz8aMAXBFtSw@mail.gmail.com>
Subject: Re: [PATCH v12 0/1] vhost: Add support of kthread API
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	sgarzare@redhat.com, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested this series of patches with virtio-net regression tests,
everything works fine.

Tested-by: Lei Yang <leiyang@redhat.com>

On Mon, Jun 16, 2025 at 2:29=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrote:
>
> In commit 6e890c5d5021 ("vhost: use vhost_tasks for worker threads"),
> the vhost now uses vhost_task and operates as a child of the
> owner thread. This aligns with containerization principles.
> However, this change has caused confusion for some legacy
> userspace applications. Therefore, we are reintroducing
> support for the kthread API.
>
> In this series, a new UAPI is implemented to allow
> userspace applications to configure their thread mode.
>
> Changelog v2:
>  1. Change the module_param's name to enforce_inherit_owner, and the defa=
ult value is true.
>  2. Change the UAPI's name to VHOST_SET_INHERIT_FROM_OWNER.
>
> Changelog v3:
>  1. Change the module_param's name to inherit_owner_default, and the defa=
ult value is true.
>  2. Add a structure for task function; the worker will select a different=
 mode based on the value inherit_owner.
>  3. device will have their own inherit_owner in struct vhost_dev
>  4. Address other comments
>
> Changelog v4:
>  1. remove the module_param, only keep the UAPI
>  2. remove the structure for task function; change to use the function po=
inter in vhost_worker
>  3. fix the issue in vhost_worker_create and vhost_dev_ioctl
>  4. Address other comments
>
> Changelog v5:
>  1. Change wakeup and stop function pointers in struct vhost_worker to vo=
id.
>  2. merging patches 4, 5, 6 in a single patch
>  3. Fix spelling issues and address other comments.
>
> Changelog v6:
>  1. move the check of VHOST_NEW_WORKER from vhost_scsi to vhost
>  2. Change the ioctl name VHOST_SET_INHERIT_FROM_OWNER to VHOST_FORK_FROM=
_OWNER
>  3. reuse the function __vhost_worker_flush
>  4. use a ops sturct to support worker relates function
>  5. reset the value of inherit_owner in vhost_dev_reset_owner.
>
> Changelog v7:
>  1. add a KConfig knob to disable legacy app support
>  2. Split the changes into two patches to separately introduce the ops an=
d add kthread support.
>  3. Utilized INX_MAX to avoid modifications in __vhost_worker_flush
>  4. Rebased on the latest kernel
>  5. Address other comments
>
> Changelog v8:
>  1. Rebased on the latest kernel
>  2. Address some other comments
>
> Changelog v9:
>  1. Rebased on the latest kernel.
>  2. Squashed patches 6=E2=80=917.
>  3. Squashed patches 2=E2=80=914.
>  4. Minor fixes in commit log
>
> Changelog v10:
>  1.Add support for the module_param.
>  2.Squash patches 3 and 4.
>  3.Make minor fixes in the commit log.
>  4.Fix the mismatched tabs in Kconfig.
>  5.Rebase on the latest kernel.
>
> Changelog v11:
>  1.make the module_param under Kconfig
>  2.Make minor fixes in the commit log.
>  3.change the name inherit_owner to fork_owner
>  4.add NEW ioctl VHOST_GET_FORK_FROM_OWNER
>  5.Rebase on the latest kernel
>
> Changelog v12:
> 1.Squash all patches to 1.
> 2.Add define for task mode and kthread mode
> 3.Address some other comments
> 4.Rebase on the latest kernel
>
> Tested with QEMU with kthread mode/task mode/kthread+task mode
>
>
> Cindy Lu (1):
>   vhost: Reintroduces support of kthread API and adds mode selection
>
>  drivers/vhost/Kconfig      |  17 +++
>  drivers/vhost/vhost.c      | 244 ++++++++++++++++++++++++++++++++++---
>  drivers/vhost/vhost.h      |  22 ++++
>  include/uapi/linux/vhost.h |  29 +++++
>  4 files changed, 294 insertions(+), 18 deletions(-)
>
> --
> 2.45.0
>
>

