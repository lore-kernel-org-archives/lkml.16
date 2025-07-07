Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294D518EFD4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751859192; cv=none; b=NqFRLY+IEXAoah/2R7Y3RtWHb76c2Y4CW4kYRxY8Jigvo4kF2tGACYdIudfAu7ho0kkFTqhXEzFm0ZpN29VM6iXFu3uu6mVClRh+EEZth0e+fzKmrj/gxZc7btsTwXPfELN73/AIRbSGvU3YWtqDVviqLyrkDMq+4uqq316s6f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751859192; c=relaxed/simple;
	bh=Jq0Y4mCPFIHRXjfR/FlwJ0+bDTFVSNwAPufYop1VhZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwiIO07qa7gHzLgJVXhzw7BsVFIdHRmHg+AFENsey70d1wj09N4BB+MJ6w2LqtuEg6CdBSExOQOZIsfjZJ5ceekgN88m04ZmXMFsnkTqlhCLDQwCfX2CB771lcUiWK2WNJPc6GqZfNw8ZAApGcAkwmLdGHcA3FKScyxynrQUlBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ST5/eQuD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ST5/eQuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751859190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fwZ3KqRzfgqLjjd1xwyBVzly0Lrtnhh1dps8A7XpVbI=;
	b=ST5/eQuDGg3nJ9/JIKu35Lm2YarJtIatk6CibnYWu8MqgpJEpFoKvFs/yPpHYv4l22PbCb
	b1xhPYH5j5hrEw5NwBIhAf96JEfe6f7/YKE93hr2VDRmQKlBRijKDtlvbZgsHQhcc57iQ5
	7bxB4SpWemuObpSNY3VSEK9/CSgPYZk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-3RkPcxjwOD-AUSg-l3FpQg-1; Sun, 06 Jul 2025 23:33:08 -0400
X-MC-Unique: 3RkPcxjwOD-AUSg-l3FpQg-1
X-Mimecast-MFC-AGG-ID: 3RkPcxjwOD-AUSg-l3FpQg_1751859188
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-315af0857f2so2567387a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751859188; x=1752463988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwZ3KqRzfgqLjjd1xwyBVzly0Lrtnhh1dps8A7XpVbI=;
        b=LZsCx8NBKMImmRGIxxM6xWzQY3xAROnchbhh0I7G/z5dvVrJToeybrrWGuqmtpdZ7b
         SM7c1iuD5N7Wpw5amX3OVqNZ1LCpFlYDGNFnHTqbQE9a1+cDvHMtu9bEFXp6sqAwlHUK
         o803kayAZQKVLSEQCiNyl/YXIaETBjdrxxnjwk4QberHsWTbSfHqVcMiLtxSZL5z78fN
         jGk2sBBqcwme9qCa7tPxxNCNQHnsxIVFXMmw1U7cTFidqJ4u7t1nEwG2mFDrPDleE60G
         vAMIISMZea+V0l/tv1s1K+4hsBpWfamrVrDKkky3X+gj1DTdqeTTFnS6Bpy9rNmqwdCz
         oKcA==
X-Gm-Message-State: AOJu0Yyrpo86oQLZWqG9wPOTV9p4QKVgm+4B2K9zpOQUsjB1JPXmbFbh
	fauQFAicxKIif9S416B5RJ65j0TVOUPWtBCvJyz9UvNy2Z5CA/bec7qX7v1MBVT9ugIdgbakxi/
	utXqyaxMLTdssbqKPIDNwm2OF68izUDXtFFI9kfpvuBuRwzUWsnWbvJDFygjIs9MxXBlON7fokD
	nX2ChUWu5Sw+jJPXRkgfBb+nwl914bVyA67C8yngmq
X-Gm-Gg: ASbGncsMInmzYHG+FZ4Z99Ocn2CEwGYJr48qSk5TIzCZDH1GXfrPcGgDMW1/ZYCZuVr
	IWyuzbbLc4ReEmGM6LIDFG6AOb5XN4Dt9Cld3HYVXP/3oWKXPMpkGdTtUcpv/1yfWfkR8vqsZgy
	RRobpd
X-Received: by 2002:a17:90b:2dcd:b0:312:e9d:4002 with SMTP id 98e67ed59e1d1-31aaddba55cmr14493876a91.28.1751859187745;
        Sun, 06 Jul 2025 20:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfd1JklTgrSKkWns2/g5bWkYfcXeUIh20Encd0tkRz6YfD4x1KIuMJQVE2Gm53/AeUdgpbciXmBU3JKBoP10w=
X-Received: by 2002:a17:90b:2dcd:b0:312:e9d:4002 with SMTP id
 98e67ed59e1d1-31aaddba55cmr14493832a91.28.1751859187124; Sun, 06 Jul 2025
 20:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1751534711.git.mst@redhat.com> <5cc87ae71e8a61f53e4534bab92f7ad19fc3524a.1751534711.git.mst@redhat.com>
In-Reply-To: <5cc87ae71e8a61f53e4534bab92f7ad19fc3524a.1751534711.git.mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Jul 2025 11:32:55 +0800
X-Gm-Features: Ac12FXxBb2m6BgFm_EZUN5yA15314g0sZHeAlTedCu_YkJcaLerfU82UC14D9VQ
Message-ID: <CACGkMEuix+Y2AWd=+xNDNPmSxOC=7o4nOCZjy8ANJUTiJ2eQ+Q@mail.gmail.com>
Subject: Re: [PATCH RFC v4 2/5] virtio: fix comments, readability
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	Keith Busch <kbusch@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Parav Pandit <parav@nvidia.com>, 
	virtualization@lists.linux.dev, stefanha@redhat.com, alok.a.tiwari@oracle.com, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 5:26=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> Fix a couple of comments to match reality.
> Initialize config_driver_disabled to be consistent with
> other fields (note: the structure is already zero initialized,
> so this is not a bugfix as such).
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  drivers/virtio/virtio.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index 95d5d7993e5b..c441c8cc71ef 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -147,7 +147,7 @@ EXPORT_SYMBOL_GPL(virtio_config_changed);
>
>  /**
>   * virtio_config_driver_disable - disable config change reporting by dri=
vers
> - * @dev: the device to reset
> + * @dev: the device to disable
>   *
>   * This is only allowed to be called by a driver and disabling can't
>   * be nested.
> @@ -162,7 +162,7 @@ EXPORT_SYMBOL_GPL(virtio_config_driver_disable);
>
>  /**
>   * virtio_config_driver_enable - enable config change reporting by drive=
rs
> - * @dev: the device to reset
> + * @dev: the device to enable
>   *
>   * This is only allowed to be called by a driver and enabling can't
>   * be nested.
> @@ -530,6 +530,7 @@ int register_virtio_device(struct virtio_device *dev)
>                 goto out_ida_remove;
>
>         spin_lock_init(&dev->config_lock);
> +       dev->config_driver_disabled =3D false;
>         dev->config_core_enabled =3D false;
>         dev->config_change_pending =3D false;
>
> --
> MST
>

