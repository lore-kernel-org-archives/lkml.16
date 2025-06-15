Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B4426B2A1
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 14:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749996498; cv=none; b=LRPTmm6MgCeU31xHVVxr91lQIE+qVXMcsnQJPc5N0JUKcnIi71ngrn1hwknqJ5sEgdUFNpC/+IlTEnp0tLUoJqqn9CEe1tmNBbbT0vvpG6vc0ua+fF9j/sY5BfuOBq5AB6ZotAoi/amKXL0GDwg4oxXAiwsfj/JU6ahiLRFhwdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749996498; c=relaxed/simple;
	bh=ZMkuY8utSlgX4E1TJgbabBifoab9L056uppzdIxIscI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EcED/lUpCkku7hpzeBLbImEc2N0YJUKlCKICKbrr7rppbYVCT1FKpbcB4x5jWIuHhPKWmo3rKmAtnIcbabYLc8cod6wGWFzJDL3Ln+ywIbwRz1hbeB8FWmOb67o5mAMJWfqHgqkHr/PSz0EAB3mpFgUe+1qemoU3g0YJ3LjNWtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V48fO4Qf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V48fO4Qf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749996493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5F9RD1nifDmIVXEq5JzNevYty30dQQi6BLivh0kLXI=;
	b=V48fO4QfWtcUvSEhdmitTSvVSNskna/VkYzmUAWjEe7y8XvHRpDplaMkhBNA9AzIKUEHK4
	XORtwIBlWRwr1aKu4ooRiw4T59yWWPFPIq3AYqsk9HfARNbAKQmVnucM5tCyUzWSP6Q032
	srbhV3YS2SbrhSZDcstIz9Rq5iXDgys=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-Iv84DjtcNDeSWPK_pHHM6A-1; Sun, 15 Jun 2025 10:08:12 -0400
X-MC-Unique: Iv84DjtcNDeSWPK_pHHM6A-1
X-Mimecast-MFC-AGG-ID: Iv84DjtcNDeSWPK_pHHM6A_1749996492
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so1292800485a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 07:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749996492; x=1750601292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5F9RD1nifDmIVXEq5JzNevYty30dQQi6BLivh0kLXI=;
        b=B/5FAFYGyyhwiAqFeCJwfl2ntGGVm3HArh1T3vq8rl/zqeGCb5BRMhGi4qf+YqXXp1
         CpQngG5xcH8dhZsGPVvZYu3nST+bT4TDzelv4M7H3L0sdQnbq/7b9NEjA4unvqMXL8dZ
         d1hDRfKUf0s9nnQW9A0tqRzyZdmKt5ACNeFxJvOfZ4rhpshTDoBOUKtCeytykCcBpeno
         POLVSV699U1fSNkaO042MVKczJOfGs01aAnjxnCJr2S3Nltqz3dyJ/32iAdQPHCbBQ7w
         ZUnuUkSeTo4elZy1g58fbZK7wX0HM5wRF2e3I17u610fmnGf5VQclomVXCn8fOm7bCQs
         LFEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHYYVP/AB63rRR2iSxZMo0oes6x0vtyTCozAjDsnSB8xy7ciPPPWCxGWcLuqE/E5XRhE3Xa7MjZ9uuje0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2oKOSyuNrxv0T7E6dAV6osWwpZDyi3OIVyHYXfGwCL9xQGK03
	bSlXTwUBp6tSKqMx2Xfqz0Q7ma1uFvbmHqZB9HxoetzcyvvfppltucY6lDrVbydP0jhdQqfEkPy
	knlOesoPspNNBEJ1bMz1pnVw+KKo8Wk9vqNkEf0ak/pwRi1HWq7qAUZQrVo89rVWWNOYDOLGVel
	jz7WNzoEcaAyQfhlPKNlqroOXfjbrJRGuTt8CZB5kY
X-Gm-Gg: ASbGncvLW4t7Oze8De5iNSjMJSvxdxNRhgrFVV2zy/z6lQH7b87t2WGQPrrJuVHKPKG
	MKSYEh0hY5Slq0xSHmyHWEIgoD38i2vabczlZ4Kwxpb3P5VlFSbxLD89r6vZJyXObp+VsxDBLHI
	7mnRmh
X-Received: by 2002:a05:620a:424b:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7d3c6c04a42mr976767485a.4.1749996491839;
        Sun, 15 Jun 2025 07:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx0K+fxFSP4BqeDRz0y+o/8CQcKF4SvXSEuhhUCRwUNvz+In8dyZXZqILXiqwaViRTlSKW5mWNGj/EecyaUpU=
X-Received: by 2002:a05:620a:424b:b0:7c5:562d:ccf4 with SMTP id
 af79cd13be357-7d3c6c04a42mr976764285a.4.1749996491522; Sun, 15 Jun 2025
 07:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609073430.442159-1-lulu@redhat.com> <20250612022012-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250612022012-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Sun, 15 Jun 2025 22:07:34 +0800
X-Gm-Features: AX0GCFswiCco_DauL--0e2ckwRlj1O7zbAgJChjHQQatloXrMYTxWULtZX6JYno
Message-ID: <CACLfguVOmz5dzvX+08X_0bBQP1iEoxjX=eh=id3mWGtjSodSrQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/3] vhost: Add support of kthread API
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:20=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Jun 09, 2025 at 03:33:06PM +0800, Cindy Lu wrote:
> > In this series, a new UAPI is implemented to allow
> > userspace applications to configure their thread mode.
>
>
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
> >  5. reset the value of inherit_owner in vhost_dev_reset_owner.
> >
> > Changelog v7:
> >  1. add a KConfig knob to disable legacy app support
> >  2. Split the changes into two patches to separately introduce the ops =
and add kthread support.
> >  3. Utilized INX_MAX to avoid modifications in __vhost_worker_flush
> >  4. Rebased on the latest kernel
> >  5. Address other comments
> >
> > Changelog v8:
> >  1. Rebased on the latest kernel
> >  2. Address some other comments
> >
> > Changelog v9:
> >  1. Rebased on the latest kernel.
> >  2. Squashed patches 6=E2=80=917.
> >  3. Squashed patches 2=E2=80=914.
> >  4. Minor fixes in commit log
> >
> > Changelog v10:
> >  1.Add support for the module_param.
> >  2.Squash patches 3 and 4.
> >  3.Make minor fixes in the commit log.
> >  4.Fix the mismatched tabs in Kconfig.
> >  5.Rebase on the latest kernel.
> >
> > Changelog v11:
> >  1.make the module_param under Kconfig
> >  2.Make minor fixes in the commit log.
> >  3.change the name inherit_owner to fork_owner
> >  4.add NEW ioctl VHOST_GET_FORK_FROM_OWNER
> >  5.Rebase on the latest kernel
> >
> > Tested with QEMU with kthread mode/task mode/kthread+task mode
> >
> > Cindy Lu (3):
> >   vhost: Add a new parameter in vhost_dev to allow user select kthread
> >   vhost: Reintroduce kthread mode support in vhost
> >   vhost: Add configuration controls for vhost worker's mode
>
>
> All of this should be squashed in a single patch.
>
Sure will do
Thanks
cindy
> >
> >  drivers/vhost/Kconfig      |  17 +++
> >  drivers/vhost/vhost.c      | 234 ++++++++++++++++++++++++++++++++++---
> >  drivers/vhost/vhost.h      |  22 ++++
> >  include/uapi/linux/vhost.h |  25 ++++
> >  4 files changed, 280 insertions(+), 18 deletions(-)
> >
> > --
> > 2.45.0
>

