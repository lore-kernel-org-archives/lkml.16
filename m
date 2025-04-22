Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BB419DFAB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335565; cv=none; b=LDZZPalqgETX6yZ1HOK4Fe0JXPrid9naHoDH/tIBPHT1J25ofpCJaWHS2o1yIHk/M9NRfMhqtCmzV2rzYYCCEDof9IFlWguOwGS0VXaFwFoiDl5ONlg/5FCOyrnUSyhq48mT2mwhLhBTbdAm6gNOkXxNIFPiFGqbiwA8Z4RC0xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335565; c=relaxed/simple;
	bh=FUqhC2JI5AKpG+AsXkQaZzwfO0ZJzlVncxbO5FUbjdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLLYCk3pHRiC5dNJjsFtd6ZWFP8F51ctXu/upNoxDF77od+/I00wGFHLj89bfD05Jpo3fkfYEmGx3Kxx6+SeqFVJbKKXbRMP4NNcgZZMyNMdmnXsBE77lUPlP0+obKuW0hGid6YJUxKKQqcnDETuDvduPrBuTQ4x1ULh0I/1IwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVVz67i2; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVVz67i2"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52413efd0d3so2068095e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745335562; x=1745940362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzNfDmE6ryFy4nS3P9XDvD3y3RhYJvbmPTm1DAkC1kc=;
        b=dVVz67i2iD4NK9OLhH4p7zUCK43IuELwnw7f+Vsxby6xROv9UNX3JF8lHfO5wLwEGR
         rVwYzFxsDaORmsUFAZvxjXtug/1wxmHI5je8yiMVHqAeP7k29xLHw68yqfq8HyzwEqnH
         hGZwNXYhoJZxsDdnhcZNalvrwf8lfmXYG/lPmUmSG3U6Fk5opvsAeVvqCBY7GTre73ei
         0z3IJFTbzrK4VFO7Ll+QGypG4xRv31GODgIOC0SzXkuICFQ5e8OPjzm48UXqaOlOo/Wi
         peI+957LeWGa1LcdXwsZfScMi9h3KtJq89uD3CA8xGuYz35E2RvFozcJ9K6hb1oaaf8C
         RLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745335562; x=1745940362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzNfDmE6ryFy4nS3P9XDvD3y3RhYJvbmPTm1DAkC1kc=;
        b=TqjzYJpC0QMgS65aVt3qrRJfCaY1/OAK+oHZbj3GDsVdtNGm81KcHkNqn1x3p4e4Oc
         MV9MsZeOQR5hN+u0NWplCgkuaQPbpZu+ukoc21ez4CJSlfYQarqGhwtnmEgkRIjEl/gw
         QRJx1iTXlOdo4rl01dBHGOHYtrQYHP1IATSzvDj2EHfYVHHO6b3w6X5Rgi+86H/aW1Xn
         v0MBKDpQRJet6BXRcB0U2fD+DW2l6OGkaeMvGEn/ZtFe11gec9k4a6bckeYSo2k/yqNx
         LZ9G5yUwc5BJr9TEw5HZ5G53ScX7FnYjPt0YXIbdhKO33qExBqSlj1dCWlwJjbAjim0J
         rj1A==
X-Forwarded-Encrypted: i=1; AJvYcCU8lI35G2ADfpUQwF+ySb5y/nMa2BWvyubtykdCe0nGSWxKVDQyRKwIfVWybm4vcAMYx38XpyG28ms7F0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwByAJTw05Hi4/OyuiHPRAuwImss1EbF4pJb2Rmq+KXUcB7IbSM
	C8jij0fUTFX3HBG6Gqre5ckXkCRbKYpTEKHvgBukv1DxMlBHoyI+Hz3tWIojokYeOEklykS3Ljp
	1RbpbvKqy+rEBKvz5a8thepsRsTY=
X-Gm-Gg: ASbGncs/TRZfwyFHWGCdiTATTp2J4vKkC857V5/UhzIcaBYDFJbkqrwm/KhhH9o6pl8
	vp8C+9xwogloPOIF5ZOn40e4Ff3ZnP+uVUWHUdN4c/Wx9rvbGq6ieZPJeCWRoKpG8TqUE5nUFMa
	pw3gZ8KvmQs/t/05DyeWNz
X-Google-Smtp-Source: AGHT+IEEm3+dIdGauwIjZW9S+BY/bSJwy2PMr1CcA6bB8azyzuwdyP9NjEB9/AeyMd0PEJdGUbkFKXhWDh6kNk4YrPs=
X-Received: by 2002:a05:6122:d96:b0:50a:c70b:9453 with SMTP id
 71dfb90a1353d-529254fb492mr10699729e0c.10.1745335562148; Tue, 22 Apr 2025
 08:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421085907.24972-1-jagathjog1996@gmail.com>
 <20250421085907.24972-2-jagathjog1996@gmail.com> <lhjibofycex36n23edeb6m7uc4n55nqg4y3qdzoe2wdpc5twrh@ytyvawvgdhuz>
In-Reply-To: <lhjibofycex36n23edeb6m7uc4n55nqg4y3qdzoe2wdpc5twrh@ytyvawvgdhuz>
From: Jagath Jog J <jagathjog1996@gmail.com>
Date: Tue, 22 Apr 2025 20:55:50 +0530
X-Gm-Features: ATxdqUF1D67yTmhQ6f3dP5eoLeuG5KOTyBgcSuwwE5qpUwgLzSwyutR9C3kgyMI
Message-ID: <CAM+2EuJKPO0iGPK2uqPhdTpLvR0-+Vwh_K-FWTMJ96+AvzLO1A@mail.gmail.com>
Subject: Re: [RFC 1/1] drm/mipi-dbi: Use drm_device for debugfs, drop
 drm_minor and .debugfs_init
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, mcanal@igalia.com, maarten.lankhorst@linux.intel.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry

Thanks for the reply

On Mon, Apr 21, 2025 at 3:59=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Apr 21, 2025 at 02:29:07PM +0530, Jagath Jog J wrote:
> > Refactor to use drm_device.debugfs_root instead of drm_minor for
> > debugfs file creation. The driver can now initialize debugfs directly
> > in probe(), before drm_dev_register(). This also removes the use of
> > .debugfs_init callback.
>
> Why? The callback was designed to add debugfs files. Likewise most if
> not all DRM drivers add files under the corresponding minor node.

My intention here was to follow the direction suggested in the DRM TODO lis=
t
https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support

It recommends using drm_device instead of drm_minor, transitioning towards
drm_device.debugfs_root, and avoiding .debugfs_init. The RFC patch was
an initial
step to gather feedback.

Related to this todo, some drivers use drm_debugfs_add_files() instead of
drm_debugfs_create_files(). For example

hdlcd - https://patchwork.freedesktop.org/patch/msgid/20221226155029.244355=
-4-mcanal@igalia.com
v3d - https://patchwork.freedesktop.org/patch/msgid/20221219120621.15086-6-=
mcanal@igalia.com
https://elixir.bootlin.com/linux/v6.14.3/source/include/drm/drm_device.h#L9=
2

Please let me know your thoughts on this.


Regards
Jagath
>
> >
> > Signed-off-by: Jagath Jog J <jagathjog1996@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_mipi_dbi.c        | 8 ++++----
> >  drivers/gpu/drm/tiny/ili9163.c        | 3 ++-
> >  drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
> >  include/drm/drm_mipi_dbi.h            | 4 ++--
> >  4 files changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_=
dbi.c
> > index 89e05a5bed1d..66f292c48a78 100644
> > --- a/drivers/gpu/drm/drm_mipi_dbi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> > @@ -1488,17 +1488,17 @@ static const struct file_operations mipi_dbi_de=
bugfs_command_fops =3D {
> >   *
> >   * This function creates a 'command' debugfs file for sending commands=
 to the
> >   * controller or getting the read command values.
> > - * Drivers can use this as their &drm_driver->debugfs_init callback.
> > + * Drivers can call this function before registering their device to d=
rm.
> >   *
> >   */
> > -void mipi_dbi_debugfs_init(struct drm_minor *minor)
> > +void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev)
> >  {
> > -     struct mipi_dbi_dev *dbidev =3D drm_to_mipi_dbi_dev(minor->dev);
> >       umode_t mode =3D S_IFREG | S_IWUSR;
> >
> >       if (dbidev->dbi.read_commands)
> >               mode |=3D S_IRUGO;
> > -     debugfs_create_file("command", mode, minor->debugfs_root, dbidev,
> > +
> > +     debugfs_create_file("command", mode, dbidev->drm.debugfs_root, db=
idev,
> >                           &mipi_dbi_debugfs_command_fops);
> >  }
> >  EXPORT_SYMBOL(mipi_dbi_debugfs_init);
> > diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9=
163.c
> > index 62cadf5e033d..351d2a5b9f27 100644
> > --- a/drivers/gpu/drm/tiny/ili9163.c
> > +++ b/drivers/gpu/drm/tiny/ili9163.c
> > @@ -115,7 +115,6 @@ static struct drm_driver ili9163_driver =3D {
> >       .fops                   =3D &ili9163_fops,
> >       DRM_GEM_DMA_DRIVER_OPS_VMAP,
> >       DRM_FBDEV_DMA_DRIVER_OPS,
> > -     .debugfs_init           =3D mipi_dbi_debugfs_init,
> >       .name                   =3D "ili9163",
> >       .desc                   =3D "Ilitek ILI9163",
> >       .major                  =3D 1,
> > @@ -182,6 +181,8 @@ static int ili9163_probe(struct spi_device *spi)
> >
> >       drm_mode_config_reset(drm);
> >
> > +     mipi_dbi_debugfs_init(dbidev);
> > +
> >       ret =3D drm_dev_register(drm, 0);
> >       if (ret)
> >               return ret;
> > diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/ti=
ny/panel-mipi-dbi.c
> > index 0460ecaef4bd..94466dd8db9f 100644
> > --- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> > +++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> > @@ -267,7 +267,6 @@ static const struct drm_driver panel_mipi_dbi_drive=
r =3D {
> >       .fops                   =3D &panel_mipi_dbi_fops,
> >       DRM_GEM_DMA_DRIVER_OPS_VMAP,
> >       DRM_FBDEV_DMA_DRIVER_OPS,
> > -     .debugfs_init           =3D mipi_dbi_debugfs_init,
> >       .name                   =3D "panel-mipi-dbi",
> >       .desc                   =3D "MIPI DBI compatible display panel",
> >       .major                  =3D 1,
> > @@ -384,6 +383,8 @@ static int panel_mipi_dbi_spi_probe(struct spi_devi=
ce *spi)
> >
> >       drm_mode_config_reset(drm);
> >
> > +     mipi_dbi_debugfs_init(dbidev);
> > +
> >       ret =3D drm_dev_register(drm, 0);
> >       if (ret)
> >               return ret;
> > diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> > index f45f9612c0bc..88a9c87a1e99 100644
> > --- a/include/drm/drm_mipi_dbi.h
> > +++ b/include/drm/drm_mipi_dbi.h
> > @@ -230,9 +230,9 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *=
src, struct drm_framebuffer *
> >  })
> >
> >  #ifdef CONFIG_DEBUG_FS
> > -void mipi_dbi_debugfs_init(struct drm_minor *minor);
> > +void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev);
> >  #else
> > -static inline void mipi_dbi_debugfs_init(struct drm_minor *minor) {}
> > +static inline void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev) =
{}
> >  #endif
> >
> >  /**
> > --
> > 2.20.1
> >
>
> --
> With best wishes
> Dmitry
