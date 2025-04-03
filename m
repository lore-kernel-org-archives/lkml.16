Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18E717E8E2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659391; cv=none; b=B+wZv2tbd0G1iFrFalER2PnHk8QdB/peiuh7cLi+/FGrfebAK6TNBhfGmZ30724TnnCQDCTCQaT2OcOrPPYBxuvec/ax8PtznBrqas5Q2Wrlxv2iAwVDgxF22/ZGxX/1yV1YcZvWGeJ6kekPk/8g9IQMlOWIfC6fiC/e1LyNbSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659391; c=relaxed/simple;
	bh=FJmm1WgaUGtVr0255+qylffWIZyP0RAouYyXZJ8u+RU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XR49/m7KFocEP6hHuzydGSgKFNULwzGvggCnZsKKT83sRppWmcmtg66J0GzHHIx3tFZE5qN5xM0P1Ha3p7DxLIH1H0vVTPh4P1PO11IYJgkReUwk00bu2LmwQ9oN1YcoTGPjKcdwSB2d77abxviH8uurmu8Oqwjls3Dl1SZ9Oyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ikwNpdXf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ikwNpdXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743659387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lGOUCwnLFb2DGhe7rL9rPyM+h3AAwNQ0nyeu269GqgE=;
	b=ikwNpdXflr/c1PgU9T9SKZKSjjLbYbqP93gxEcFN/1/UM1NIkD6LN9VEniPWXQny82U/x6
	E/LWzORkHI8bt2en3X/DAJBrNK0qBSst532/ceitCeaqydCnQ8LrOZeeh5Gh2+5/Ivkf0J
	xl1JEKv8Zurz0Nqcm82kmc8NOEySP3U=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-4QUyLxkAPG6onHPTRaGOqQ-1; Thu, 03 Apr 2025 01:49:45 -0400
X-MC-Unique: 4QUyLxkAPG6onHPTRaGOqQ-1
X-Mimecast-MFC-AGG-ID: 4QUyLxkAPG6onHPTRaGOqQ_1743659385
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac37ed2b99fso38640166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 22:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743659384; x=1744264184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGOUCwnLFb2DGhe7rL9rPyM+h3AAwNQ0nyeu269GqgE=;
        b=Rn+03Qw5myB/3b88TNchXoU1lXPbSzaTudAheDgYQxYxI3h0WixCfufKNJLJnkNC+c
         YAuvcsh1vCOlZA3KrZ5k3BJ12RyFgTZwKbWB1xVmI5OP1hiaizJef5Ji+0jymTqEuK0S
         KAdfoS412po3wNmpxhawFaUosVoEt1/DrccV8E+q3E8DhCVecR0c3kfeo5Hl1NlV2k+D
         /cDFrf5+oq5QA6nqC5Y61VnBi4dTZAH3oZOLbZxNhOR9KcuH3lJq9N43N9kThm+IJ+Aw
         NZ3lfJgCevG/fbjXuJriGbBEFtB89Qyz0A7odq7Z9SHK48LUHQdUFNQ3E9RmwpK7jsln
         qbmw==
X-Forwarded-Encrypted: i=1; AJvYcCUtC+8hSgRwg4hhkr0JFJDbl5BVgUhmfr6GOLRAjwu0LbOdTnG3z0Okbx76R/usd+zT/+8FSpi71+/JKDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqg3j7DouEnN+MtgW/y2qjt0DXkWJPMPsdI2f/0qAQsAOewjyO
	rp19F9D1ixVhz7EJFkrtMTUV8xD3/5QWQDLsEHWmIbg4gy5JjNFDruSd6+fS/Jc+qMCqHweB8pi
	JZWHMtTVqM/4PnyaiQzJOLb42icTxCT57pVJ3goNbZt5wvJ/7mA+YxLSrlIDjasf/hWcPOxXcou
	+vP7eWtJ8WuPBsKBP95W6B0XIcCGxEbz1lCQmy
X-Gm-Gg: ASbGncvzuHR1U6BuWFgdSlzOFgrfACOEGiHFTHXDcU3XwG0r/aLJDDEMGIkaxOgDw/f
	lh03srHJ6cRxDl4Tpea+6q9qwH5MAbYtRR8OnNqO43n31exlsN1jO4xV++P7yXnRYEMSy5tzTag
	==
X-Received: by 2002:a17:907:9693:b0:abf:6a53:2cd5 with SMTP id a640c23a62f3a-ac738bee1bfmr1738563866b.48.1743659384617;
        Wed, 02 Apr 2025 22:49:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz4yBfQlsL4mjZciTzHbBn7fCLVHD6K77EGTEFJy1FS/52vh/BwGXdtwiiQaNJWcmUiMtg7i216HCs0W4l6Ao=
X-Received: by 2002:a17:907:9693:b0:abf:6a53:2cd5 with SMTP id
 a640c23a62f3a-ac738bee1bfmr1738558866b.48.1743659383835; Wed, 02 Apr 2025
 22:49:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328100359.1306072-1-lulu@redhat.com> <20250328100359.1306072-9-lulu@redhat.com>
 <3zmkrimo2nghk42iatj4tuhfb7qrxx235srleuavi4at5dsv26@zj6wqgj7hj62>
In-Reply-To: <3zmkrimo2nghk42iatj4tuhfb7qrxx235srleuavi4at5dsv26@zj6wqgj7hj62>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 3 Apr 2025 13:49:06 +0800
X-Gm-Features: ATxdqUEbovQ8ttG-mQdSdHhj7EeYF7BEzCWN7RY_HyZJvUnN6Z_zvqXd3kASYjA
Message-ID: <CACLfguX7FJXdMi7CGxyDR+CtkHdgQOXm7T4fO6hBsFJ0Wa-2WA@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 9:21=E2=80=AFPM Stefano Garzarella <sgarzare@redhat.=
com> wrote:
>
> On Fri, Mar 28, 2025 at 06:02:52PM +0800, Cindy Lu wrote:
> >Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> >to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> >When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> >is disabled, and any attempt to use it will result in failure.
> >
> >Signed-off-by: Cindy Lu <lulu@redhat.com>
> >---
> > drivers/vhost/Kconfig | 15 +++++++++++++++
> > drivers/vhost/vhost.c |  3 +++
> > 2 files changed, 18 insertions(+)
>
> IMHO this patch should be squashed with "[PATCH v8 6/8] vhost: uapi to
> control task mode (owner vs kthread)".
>
> It might break the bisection to support an ioctl, and after a few
> commits enable or disable it depending on a kernel configuration.
>
> >
> >diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> >index b455d9ab6f3d..e5b9dcbf31b6 100644
> >--- a/drivers/vhost/Kconfig
> >+++ b/drivers/vhost/Kconfig
> >@@ -95,3 +95,18 @@ config VHOST_CROSS_ENDIAN_LEGACY
> >         If unsure, say "N".
> >
> > endif
>
> nit: there is a mix of tabs and spaces in the next block, should we
> fix it?
>
sure ,will fix this
Thanks
Cindy
> >+
> >+config VHOST_ENABLE_FORK_OWNER_IOCTL
> >+      bool "Enable IOCTL VHOST_FORK_FROM_OWNER"
> >+      default n
> >+      help
> >+        This option enables the IOCTL VHOST_FORK_FROM_OWNER, which allo=
ws
> >+        userspace applications to modify the thread mode for vhost devi=
ces.
>    ^
>    tabs
>
> >+
> >+          By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL` is set to =
`n`,
> >+          meaning the ioctl is disabled and any operation using this io=
ctl
> >+          will fail.
> >+          When the configuration is enabled (y), the ioctl becomes
> >+          available, allowing users to set the mode if needed.
>    ^
>    spaces
> >+
> >+        If unsure, say "N".
>    ^
>    tabs
>
will fix this
Thanks
Cindy
> >diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> >index fb0c7fb43f78..568e43cb54a9 100644
> >--- a/drivers/vhost/vhost.c
> >+++ b/drivers/vhost/vhost.c
> >@@ -2294,6 +2294,8 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned=
 int ioctl, void __user *argp)
> >               r =3D vhost_dev_set_owner(d);
> >               goto done;
> >       }
> >+
> >+#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
> >       if (ioctl =3D=3D VHOST_FORK_FROM_OWNER) {
> >               u8 inherit_owner;
> >               /*inherit_owner can only be modified before owner is set*=
/
> >@@ -2313,6 +2315,7 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned=
 int ioctl, void __user *argp)
> >               r =3D 0;
> >               goto done;
> >       }
> >+#endif
> >       /* You must be the owner to do anything else */
> >       r =3D vhost_dev_check_owner(d);
> >       if (r)
> >--
> >2.45.0
> >
>

