Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E585BA36
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745207154; cv=none; b=MisZuNXaEMYiF5xT15KpL/+25hyYRUDwDmWhzs/CTGxfOQmlOBwY+wks1d0wJtvgfu3qF7c3iOG50Qs9Tlwke2ts/J6EYl0ZM1+qlO2RW0ziIpfXMQ8Jw4Xh3GCFzy40La8B8BonQDD3S4TiyPqMj6QjPwh1/Sk92/8xxvebQYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745207154; c=relaxed/simple;
	bh=KNP4l2yPMw2FLp/XhZlTQQJKvOxgUeTNWGn0vwmpkpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxVdMggtTCVZ+hlKejMdA3eHwRw/Cz5oUF2isIF3J2kaybDeT5My55KujCJ6LvOVvyhE1a6qYt3achxFFY6zxyOrAhHD5kaeoT4146NYPEW2EGvw+R/S7I9XWfKMyjDXrr8P42Zy4vprNNOludlVd8QA2HrGfNCkNKSs2WRJP1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VL3WHph5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VL3WHph5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745207151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GCTn28hDkTI90JLQ1WUbwuCZY09MgQ9MgcwPXgLFgGw=;
	b=VL3WHph5Nof0SVARxJGAydDfjXif+Of/AW8rFsM0wBCyAU3AIxTx8PR5CQfhdaYm3uyyc0
	Ca/VCvfyzcVAcs0x6RwqarrJJ91XegPUWhnM+96jOHVKRomMsYe/PTJfHy/i96qfq7Bavz
	IrNKX6nHrrdcN3R+fz+NOBVxiTVOEu4=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-g5O3KWIuNnCey-jM8GilYg-1; Sun, 20 Apr 2025 23:45:49 -0400
X-MC-Unique: g5O3KWIuNnCey-jM8GilYg-1
X-Mimecast-MFC-AGG-ID: g5O3KWIuNnCey-jM8GilYg_1745207149
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-523de364463so735934e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 20:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745207149; x=1745811949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCTn28hDkTI90JLQ1WUbwuCZY09MgQ9MgcwPXgLFgGw=;
        b=Y9KNdZhSD449eG1gzj+VqLQCSiZTZ1xs+QSgj4Qng5mXBQ2oPHKMIEzgNbxjJfGCEx
         XZEJVmb/JJy0bm09oY16b9YQBshyoYY9FNLfjVhczD5ZmZNeY0rk/Qv2KjWs51rFx3QZ
         ivMP338Ni0slcFOxnja9+Dw2KA/hwiOWc7Xdeo6XaA+f7udZ57vUTHFXfpDe/8HpzYEN
         iq/SdZuHmgPI6By8eswnGZoFZANKJQ7rYVINdq8tinox4DDOYWFEe0rZyIg2ufp7klnf
         qDPm/YFCfasUEx/b7DFVzzUaUI+i+37Wmc2kyhSDd202drymtn5MZukPo/6mHDu5IN95
         MexQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvFclMCCbp2yZXltB1hp2tAx1oH0jXsjtSio5BoPsKw3AUGqWaH57gg+/QMkmKTRQlNtyRWARrHmbdF14=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR7HhkSI7goH4/XKFMEK0pLKFhZoZwl12BXLl73BaXugACmTg4
	t4Ggcz/I4+OcVmc3bAv4MJSSYZOVDa/lYQm6+RJ2nVaMq6DUwlzCn2l12PrvIWKNuL8T2tnaBd2
	16oSSwpYTBQB79h/JVmAiIh1EHLMM/jc9Is1FjjI7DB6sC/lCH8Jd4xBdn5mKdUXuCqKGbrPINY
	j2FR5Qqn/oMBHeg7UazIBr0QVekacTwMxVMmGG
X-Gm-Gg: ASbGncvSTeZldi5y7UNqZntcL9wWdX2FCWQfB2V1gwtJdjV7hhearTr+k8DhFF9hCnc
	XmOI0u6AhSlj7KwZDYyxTaPxZl3d3NxhDKftTI01Tl7Fd3dG0+WDpNLZkBZ9cHdoupqJFWA==
X-Received: by 2002:a67:f089:0:b0:4bb:9b46:3f87 with SMTP id ada2fe7eead31-4cb8011d7e6mr5033341137.6.1745207149225;
        Sun, 20 Apr 2025 20:45:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1i5MplA0k7CxdohZHJOAN8NXQrZKkjU3zR0UFMuopnzkvSvPRh2gSe1jL70oe+NUnRQzp/TgYqM732XBN6FQ=
X-Received: by 2002:a67:f089:0:b0:4bb:9b46:3f87 with SMTP id
 ada2fe7eead31-4cb8011d7e6mr5033333137.6.1745207148893; Sun, 20 Apr 2025
 20:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421024457.112163-1-lulu@redhat.com> <20250421024457.112163-5-lulu@redhat.com>
In-Reply-To: <20250421024457.112163-5-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Apr 2025 11:45:32 +0800
X-Gm-Features: ATxdqUFgCCkJJ0JXdJQwN88OxMbo6yfhaiyGCN8WzeAS9Lrj99kC3ES_wTxfQwY
Message-ID: <CACGkMEt-ewTqeHDMq847WDEGiW+x-TEPG6GTDDUbayVmuiVvzg@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 10:45=E2=80=AFAM Cindy Lu <lulu@redhat.com> wrote:
>
> Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> is disabled, and any attempt to use it will result in failure.

I think we need to describe why the default value was chosen to be false.

What's more, should we document the implications here?

inherit_owner was set to false: this means "legacy" userspace may
still be broken unless it can do VHOST_FORK_FROM_OWNER which is
impractical. Does this defeat the purpose of this series actually?

>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  drivers/vhost/Kconfig | 15 +++++++++++++++
>  drivers/vhost/vhost.c |  3 +++
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index 020d4fbb947c..bc8fadb06f98 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -96,3 +96,18 @@ config VHOST_CROSS_ENDIAN_LEGACY
>           If unsure, say "N".
>
>  endif
> +
> +config VHOST_ENABLE_FORK_OWNER_IOCTL
> +       bool "Enable IOCTL VHOST_FORK_FROM_OWNER"
> +       default n
> +       help
> +         This option enables the IOCTL VHOST_FORK_FROM_OWNER, which allo=
ws
> +         userspace applications to modify the thread mode for vhost devi=
ces.
> +
> +          By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL` is set to `=
n`,
> +          meaning the ioctl is disabled and any operation using this ioc=
tl
> +          will fail.
> +          When the configuration is enabled (y), the ioctl becomes
> +          available, allowing users to set the mode if needed.
> +
> +         If unsure, say "N".
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index fb0c7fb43f78..568e43cb54a9 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2294,6 +2294,8 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned =
int ioctl, void __user *argp)
>                 r =3D vhost_dev_set_owner(d);
>                 goto done;
>         }
> +
> +#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
>         if (ioctl =3D=3D VHOST_FORK_FROM_OWNER) {
>                 u8 inherit_owner;
>                 /*inherit_owner can only be modified before owner is set*=
/
> @@ -2313,6 +2315,7 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned =
int ioctl, void __user *argp)
>                 r =3D 0;
>                 goto done;
>         }
> +#endif
>         /* You must be the owner to do anything else */
>         r =3D vhost_dev_check_owner(d);
>         if (r)
> --
> 2.45.0
>

Thanks

