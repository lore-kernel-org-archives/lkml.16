Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6305E155393
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422420; cv=none; b=GIaGvp1XmigD6b2Dz8Jfw/MO3ufANtOe45R17npcc9aTiS3Ocb48IVl+yDxGvGARNWBOHUEsubShQ7k0ri2q3kX+dW/cLQxVunLa66yoXp3Q9DFS39AvDLsfEERh6YsmdYU36FunJGPgZH8FwnEYMvWL+lx7pBOkyAFGt4L6Ymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422420; c=relaxed/simple;
	bh=76SU+zIo7WlCNaXWUl6aelYPfKu7lO0vioy9H+xSEnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g6XUpKWkNYiqIgHmd4/fZeAtaWTQ8y5RmyQ8aLAMqWplPZfF+KgNwJTRLd/l3KftQTdns4Ql3kzDwbjxCdT0QCi52R2nJaT05ZF+fh7o7Q0rlheaY/VcEm2hLF+skSNhg56JyVBwGyno54nNa8dFked+K0y/CSm2TJQh+4Cr1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PgxcX5KJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PgxcX5KJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743422417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SALfqHpaVZ7H1/T2YDaQ+8Ub/OE8/ksE1OnbpJljKQE=;
	b=PgxcX5KJYBVcF13kaDHwhDeuMUC3TVEVFxGBNf2qlOga0148XC8lUDKGNCCQm4a21iR0zY
	vOGtE5vPAWbXySwmoGt4+1Frm71MjtscTlwuKmrDWsafkQkd45c16xUF8HzUR3PAxdhb+u
	UUYexB4m1D6PU2vyh1m/QgMkXg6fWFw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-6KdJV4xdN_ybXCYB8OcLNg-1; Mon, 31 Mar 2025 08:00:15 -0400
X-MC-Unique: 6KdJV4xdN_ybXCYB8OcLNg-1
X-Mimecast-MFC-AGG-ID: 6KdJV4xdN_ybXCYB8OcLNg_1743422415
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac293748694so417754066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 05:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743422414; x=1744027214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SALfqHpaVZ7H1/T2YDaQ+8Ub/OE8/ksE1OnbpJljKQE=;
        b=b8oUpNh66KyVO1CQDAkxdRktLCxthC9mAwkOPhd0JALeBfOc5GdwO/J1xtXRV8m5CE
         ElE00ACuZQKvI72UQUexvIcUlKhQVjCOM69/16e4bOlVGeIABgS31/73ggvpwELlZR0x
         eZ3NXt3aTDcZX/NOwWaHxko+7yRKT8sNl8uJjTRsFRfCUSclZs2/9cOLdLrIePwA6UAi
         wPBTiPgqMuFAtFnh04GOXiU6KSIrUnZ+clagkvNP+/XgTs94GMBPNiits0P8pTqdK6rz
         ixHm3gcM8ymOliHxy+otaW/A+rgLxh7L9ls34s0ZbnYt0tHFCVQOQH7K1o8cj0RBZwPm
         HhGg==
X-Forwarded-Encrypted: i=1; AJvYcCUnMAr8YLD5laNjGNWtJeDfPNO1rTMaFLVVg+DbLI4GUC27QZIuryhy5Zl+Z4bfiG6Wf6UIyGYldkSHVNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOrU6frUJc30KT+F7uLVRC4GI9tvubZ+F38UzB/Q94fUMoM0TN
	kC+VIFCsIeYLjCxZ3G0nYb93s7eXurQUT0Os07aoeY3B01S3Z3CC+3+2VJFVpTI90U+HUxJAjKD
	/X/bmd5PKuMGD/fjHuFjegRORFZQ1rQl5ukoWY/QK0Rk6nptp42Fun2BQi/s4pV5d/qPoL6RITp
	7+xkgvlr0/iRWT2+pHxt9WK2LABnAfLh/FCHIG
X-Gm-Gg: ASbGncske9rqC7yvZkPYPM6jZXzq1K8bk7pJYlYvqh8l1QSiTJVtLzO5G9Fv2O2Lizb
	bK6mnLxJplWXLp2xYWRM6TB5kUwY9H8R9lShk7uE0fYnE3t/ewSK5TdcUjeafi2xfIbLBoNad1w
	==
X-Received: by 2002:a17:907:a08a:b0:ac3:cff:80f1 with SMTP id a640c23a62f3a-ac738c880d3mr758638166b.54.1743422414484;
        Mon, 31 Mar 2025 05:00:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDnA3ED+fmlUHGPDP9zSXTFcjlj2+EA7N/YnNwtisbC+ekVhCoZq1nyT+pnlJz/9pdqBVMe0AoZpt/YKM5Oao=
X-Received: by 2002:a17:907:a08a:b0:ac3:cff:80f1 with SMTP id
 a640c23a62f3a-ac738c880d3mr758635266b.54.1743422414079; Mon, 31 Mar 2025
 05:00:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328100359.1306072-1-lulu@redhat.com>
In-Reply-To: <20250328100359.1306072-1-lulu@redhat.com>
From: Lei Yang <leiyang@redhat.com>
Date: Mon, 31 Mar 2025 19:59:37 +0800
X-Gm-Features: AQ5f1JroAFl0j8Y8E1rVmceWhY1UAp8ypP7a0k97xGC3a_KBzP4oWFz8KEo9czA
Message-ID: <CAPpAL=x00fw7qV3GdOCQPZcry-VyQFFUq1NXu7uOH7zVmESNqA@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] vhost: Add support of kthread API
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	sgarzare@redhat.com, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

QE tested this series of v8 with virtio-net regression tests,
everything works fine.

Tested-by: Lei Yang <leiyang@redhat.com>

On Fri, Mar 28, 2025 at 6:04=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrote:
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
> Tested with QEMU with kthread mode/task mode/kthread+task mode
>
> Cindy Lu (8):
>   vhost: Add a new parameter in vhost_dev to allow user select kthread
>   vhost: Reintroduce vhost_worker to support kthread
>   vhost: Add the cgroup related function
>   vhost: Introduce vhost_worker_ops in vhost_worker
>   vhost: Reintroduce kthread mode support in vhost
>   vhost: uapi to control task mode (owner vs kthread)
>   vhost: Add check for inherit_owner status
>   vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
>
>  drivers/vhost/Kconfig      |  15 +++
>  drivers/vhost/vhost.c      | 219 +++++++++++++++++++++++++++++++++----
>  drivers/vhost/vhost.h      |  21 ++++
>  include/uapi/linux/vhost.h |  16 +++
>  4 files changed, 252 insertions(+), 19 deletions(-)
>
> --
> 2.45.0
>
>

