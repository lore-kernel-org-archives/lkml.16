Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43636199FAB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749016903; cv=none; b=UFGRCxv75ZguhuRHqcjpnaD0NiJABaEm+mlo6lIVgbMU3K4ESL0q7uX1jWn85hyZxEZ5UGWx2TcuYP+G0GCTZ+xDkj5+FxSeraaue81wSh4rqEzm5eiWU06aHu25K3qDrTh6928moGUdody2+J3SrnVn0bVmm1k3zxWeIcja5CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749016903; c=relaxed/simple;
	bh=4TyRBG1G4EzdBNunppuanZ43NQgPH8fGRCpZBDbYUus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jh3oBIPxpDNLMkMrBZdC7vXB+Dzq04e1haxjkM9pqQ5cR1c4ueYhn0ErpyvY/p1mYKRGclKyP7qaxHaIxB86f4j6DFmHmkmPV9oLr9X7kvKeicQf28PMRoU35Cfwhx5NGgOZKePqm5r7Swg8CJXo9mokkMUPEz8QjZ/yDcoHBGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WXc3N7wW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WXc3N7wW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749016900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zuRWRJUNtoA1IwLH7xLOPSpkGMVdWFOSz6YPLpJ70Q8=;
	b=WXc3N7wW1PLLSKXOExxYmGo2Fw7+4jUShSzvhw02P0Fp3vOwbgFs40qXLw4sZqlN22tFCd
	UtO4sus+z2dFl9+q0iQo7NpX/5fNAFjeX+GAcDTQqCk+LuMunX8pG6iZLan79DvY5y6cZk
	3MvTF0YZkcH5U+Iy9gIB0xkP0FaxeLY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-2DyHaVVQPqyHICp2_brVMA-1; Wed, 04 Jun 2025 02:01:37 -0400
X-MC-Unique: 2DyHaVVQPqyHICp2_brVMA-1
X-Mimecast-MFC-AGG-ID: 2DyHaVVQPqyHICp2_brVMA_1749016896
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad88ac202c0so55917966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 23:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749016896; x=1749621696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuRWRJUNtoA1IwLH7xLOPSpkGMVdWFOSz6YPLpJ70Q8=;
        b=eAdzRM2EtqLtAQgB6OMPUUEFmxYGFJSH2dWAcri1kJ7EY9lfDxXoztkarnJFYFFPS3
         K0N/uDmy4EQt3kHD4SxoD+LP9FvMMSLptRBJadUm4pHSVastymiAnNrPzGwpjYnabNuU
         e6luBLc6jo4kfCfKgF+HFDQy9XzUv/rsAXMfGkLWao9XXCCANcL3GN2QaPqqASvvzMtq
         HgfH9+rnvZUBbKmRb5qQePwCr7nnCbCbvEveI2wAnAFlWIUc2z8+WIzw/e9aB2Jdorwy
         eIejBZ/Euo1X7KB4yUTwMNEoOjJ7fM5CDhGFPG0BgNdfrfaYS4lbCsaWswBFty4EyTsK
         uOBg==
X-Forwarded-Encrypted: i=1; AJvYcCUbVmiaaHBAeXdr3GWGKAD9N6WO94GpYUvmLl+pXqxzDfF3Zw8AyEpcGMuqXp08fhuxdNPADcc4V+89M44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Ya0eHiNbY74gcxCPNIdAaG4gv4/2PnJitq8P/x1aA4Ogrr1Z
	IoeOqnj/99e3988EoTEx/zRCap4lHgyMGYM7fA/qMKm3R4yhmH/jJqbZL2G27bS9WAcp4sZPU9O
	GKICBpGJDjoNhM272OxU0D9De0RY8Hp1GDxYVIbnGySevsLlsHJSNUeNPU/Pfk3JbfpUkWPHnAj
	f8d/j5XAT4Ig9vX2u/6gghyJvFdKZE0OnFJfnhvHCh7FYXzNYcyJw=
X-Gm-Gg: ASbGncubuBfDDmv5cdJvc1BQr1791/6y0ML9jFrOd4wkvJQmDytQIFC2IDBNNxTGXbe
	b0h2MBAepgy6C3z3alRS/sUXwIMB7bJ8Y254Bq4DU/F0JHhuBl/i6QhARc/QGXn4lFSmD1Q==
X-Received: by 2002:a17:907:3e27:b0:ad8:932e:77c9 with SMTP id a640c23a62f3a-addf6e5309dmr151677566b.3.1749016895878;
        Tue, 03 Jun 2025 23:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq7zshd+Mlb0ExzQc1p+OYd8O3naYB2lELgamGzeWirUG3oP6mxKyenZR4eIlwQzxmUZ2DblEvLugnFUc5+nI=
X-Received: by 2002:a17:907:3e27:b0:ad8:932e:77c9 with SMTP id
 a640c23a62f3a-addf6e5309dmr151674666b.3.1749016895432; Tue, 03 Jun 2025
 23:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531095800.160043-1-lulu@redhat.com>
In-Reply-To: <20250531095800.160043-1-lulu@redhat.com>
From: Lei Yang <leiyang@redhat.com>
Date: Wed, 4 Jun 2025 14:00:57 +0800
X-Gm-Features: AX0GCFudKt31CUN4yXL1ybV6SffNxLvQTIurYx8hfUPGvIKESpW4_6rDnGimkiw
Message-ID: <CAPpAL=w24Wwq8Qa9uQr8OQqdg8vMiK0FSOUGdCHAvB0O2B_T7Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 0/3] vhost: Add support of kthread API
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	sgarzare@redhat.com, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested this patch with virtio-net regression tests, everything works fine.

Tested-by: Lei Yang <leiyang@redhat.com>

On Sat, May 31, 2025 at 5:58=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrote:
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
>
> Changelog v10:
>  1.Add support for the module_param.
>  2.Squash patches 3 and 4.
>  3.Make minor fixes in the commit log.
>  4.Fix the mismatched tabs in Kconfig.
>  5.Rebase on the latest kernel.
>
> Tested with QEMU with kthread mode/task mode/kthread+task mode
>
> Cindy Lu (3):
>   vhost: Add a new modparam to allow userspace select kthread
>   vhost: Reintroduce kthread mode support in vhost
>   vhost: Add new UAPI to select kthread mode and KConfig to enable this
>     IOCTL
>
>  drivers/vhost/Kconfig      |  13 +++
>  drivers/vhost/vhost.c      | 223 +++++++++++++++++++++++++++++++++----
>  drivers/vhost/vhost.h      |  22 ++++
>  include/uapi/linux/vhost.h |  16 +++
>  4 files changed, 255 insertions(+), 19 deletions(-)
>
> --
> 2.45.0
>
>

