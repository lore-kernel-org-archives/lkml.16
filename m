Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6E427718;
	Mon,  9 Jun 2025 18:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493421; cv=none; b=IeGlqevrglgeadzYjWGAz+2v6278w360Zcg3M5wOH+cmds5hAPFPYakaPTluyM+RRDBvMxoIRlprTN4ILnrq1RHweahUOTIWWsysInoGMF3IpKXjq8gp6wVCupuDVTM3A8FeXH74JBgInsGulf3YI+RremTmW+yJLIk3xMc/ZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493421; c=relaxed/simple;
	bh=4xVRH7yRkfu3VnlWI3iF65T8q5VomcV67pSWNmihj9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Do8bbNx4J5t9LomEQKZkAP1HpMHtVZzmdb4I2IqOzFlnLMFptzQVgtebjtkg1sZ23BnwbJNpi8koh/idhVfHKNDyX2KqQwV9IKLWOh1p//sP7MbLzaJCYniMr0w8gpwCwsksD/qBO3jUO2hnxrnXMUZOvfchGTV6/5/6Y42vnd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imE8nUPt; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imE8nUPt"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad891bb0957so744313066b.3;
        Mon, 09 Jun 2025 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749493415; x=1750098215; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CW/d3YTjSFycjX6/LB8McvZq17h6mxN+2rNQt6R27Hc=;
        b=imE8nUPtKAhEBpsofQxGtRQUxtwfVspfpp1NvQ/DHEUOlyyBMrw9yZYtwBV8MlrBt+
         a54srRvn3/n57GLHNs9Jli0utFB8ejH3MsgNYfazsPOA1zAiwCZwe9PsCJD1J533WNZH
         Yrna4uNDk687sIM2rxsgzcT/FkOJk6SjZtltliu88uFFchIM1s0+JIwbnidgPqngL6nT
         9IwBRVe6Y06r4IAxNc9zU2em2NQjNhwusmR2G/pt7byN7gFsc1dRGJNs0U8WisC4zh/0
         cjdk6CbWgnH2XCDGwD9qYvF74wz8XI9iiGOBLrnvyt6vk2Xl6y4chKJDFgJ/18OQwxIy
         pnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749493415; x=1750098215;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CW/d3YTjSFycjX6/LB8McvZq17h6mxN+2rNQt6R27Hc=;
        b=Lyubd4V2QC/yU1Q4IJRbA6VgxxBj3f0xlsEprGAKwtK9H1ZD08+QmvSBQvREIsCAHN
         DDHMyjHBAe0sYtlfqqOt89Lq7WqBk9bkd2QJKr8hX4XY5DBwlGIY8JnW0+hAwB3Hq5XY
         /8+TI3VaOyi/kxL/9XCvfqBZl4lh1m/8uPG7JCkXK7Fj8fF7Yl3yKpRAup/MztM3y3sU
         knXvpuPn42Y1ROU0CpmrlNGaSzpcJd/8EBHby8B/o9qynYas4jDXzINRVQYF2OTQ7qrH
         N5pePMGW3K77p+/MSAptm7KsQl659tZxn7MWnyVxTTaySxuVp1/J22PIasaQ9uiMgw4R
         UQyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+cs4kKrg5LrRwLKKw3A8Y0OY1O9VSbl5xHtv9urViVusu5+oU/m6R5cbn1P8rltQUSxusKj0XUi/gu6P@vger.kernel.org, AJvYcCVyi0O6Xfm82Zv2ABKqk0XEBboIazf0jSTsTv92AQi7YHRylMqZqGFFNf5/7jjJyVESutIJR9nOEgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLOMEndNA5YNKJ46IbfYrdTEe9/Az3XNRWVjVuLvU/Jdkje0SN
	Zhd5l+juQkWaaeY3T5GF0svC+I0tb/JRKho0e4FyRSlHOWYd//wZi/6ww91wZQYVp/jWWjMzZ1F
	G5pdNnBiC2pRT8G7ysXD9zXXHYFOUNNo=
X-Gm-Gg: ASbGnctbQtsd3MOzssZwdVhvEnYN0dynz38RG/dUC9Zi/z2LagysH6CiXh3Vqjfldzw
	5lQoRe8V2XGS8N0Wsq7zdkvlS9b19prJCaaCWqVBuAkVQC8aRfslcfe9b65KJpxhSVS/35QJ0xo
	xMlRLUK71zWQucOraCtsrmWPmt1yRUpNcfFIRo/ar98vuJyM5Wx0zzHQZ4n+onAnUmESR1d03LH
	oo1zQ==
X-Google-Smtp-Source: AGHT+IFtV58+b7TdEn169blBTSTg97IoZAMWiVqeKLwKeXRa9wvFaPoz+n0HH+xJYo631uo3xl7Wtx01TrmgPDB7kbo=
X-Received: by 2002:a17:907:1b16:b0:adb:469d:221f with SMTP id
 a640c23a62f3a-ade1aa15864mr1341933766b.31.1749493414544; Mon, 09 Jun 2025
 11:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
 <aDz-Pq4eMAYmzqsJ@archie.me> <aEBaJ5zMHfzhpdlz@phenom.ffwll.local>
In-Reply-To: <aEBaJ5zMHfzhpdlz@phenom.ffwll.local>
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Mon, 9 Jun 2025 14:23:24 -0400
X-Gm-Features: AX0GCFtT5VtTHa-jojzi8kLV9z5EuWYa1-xJcEXWWcyNlt2BE-xhusWO-NpDrzU
Message-ID: <CAC0Z3JupfeHHrfj7ZeQ3E-1+E9jBrd9SPBn-eJUjEMN6iMB3aw@mail.gmail.com>
Subject: Re: [PATCH v4] drm: add overview diagram for drm stack
To: Bagas Sanjaya <bagasdotme@gmail.com>, Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Should I go ahead make the diagram more detailed or just add the links
in 'Slides and articles' & 'Conference talks'  to the existing
diagram?

Best regards,

On Wed, Jun 4, 2025 at 10:37=E2=80=AFAM Simona Vetter <simona.vetter@ffwll.=
ch> wrote:
>
> On Mon, Jun 02, 2025 at 08:28:30AM +0700, Bagas Sanjaya wrote:
> > On Sun, Jun 01, 2025 at 06:18:47PM -0400, Abdulrasaq Lawani wrote:
> > > Add an overview diagram of Linux DRM architecture for
> > > graphics and compute to introduction.rst
> > >
> > > Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> > > ---
> > > <snipped>...
> > > diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/i=
ntroduction.rst
> > > index 3cd0c8860b949408ed570d3f9384edd5f03df002..a8d3f953a470180b395ec=
52a45d0f3f4561424e0 100644
> > > --- a/Documentation/gpu/introduction.rst
> > > +++ b/Documentation/gpu/introduction.rst
> > > @@ -14,7 +14,45 @@ including the TTM memory manager, output configura=
tion and mode setting,
> > >  and the new vblank internals, in addition to all the regular feature=
s
> > >  found in current kernels.
> > >
> > > -[Insert diagram of typical DRM stack here]
> > > +Overview of the Linux DRM Architecture
> > > +--------------------------------------
> > > +::
> > > +
> > > +        +-----------------------------+
> > > +        |     User-space Apps         |
> > > +        | (Games, Browsers, ML, etc.) |
> > > +        +-----------------------------+
> > > +                      |
> > > +                      v
> > > +        +---------------------------------------+
> > > +        |    Graphics APIs   |   Compute APIs   |
> > > +        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> > > +        +---------------------------------------+
> > > +                |                   |
> > > +                v                   v
> > > +        +---------------------+  +-----------------------+
> > > +        |  User-space Driver  |  |    Compute Runtime    |
> > > +        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> > > +        +---------------------+  +-----------------------+
> > > +                |                   |
> > > +                +--------+----------+
> > > +                         |
> > > +                         v
> > > +                +-----------------------+
> > > +                |   libdrm (DRM API)    |
> > > +                +-----------------------+
> > > +                          |
> > > +                          v
> > > +        +-------------------------------------------+
> > > +        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
> > > +        |     nouveau, etc.)                        |
> > > +        +-------------------------------------------+
> > > +                |                       |
> > > +                v                       v
> > > +        +----------------+     +-------------------+
> > > +        | GPU Display HW |     | GPU Compute Units |
> > > +        +----------------+     +-------------------+
> > > +
>
> I'm a bit late to the party, apologies. I'm not sure how much use there i=
s
> in an extremely simplified diagram like this, least because it's really
> incomplete and leaves out the entire display and compositor side.
>
> My idea was that we'd instead link to the large pile of introductory and
> overview talks further down in this file, if people want to get an
> overview over what drm does.
>
> If you want I guess you could add some links to the relevant wikipedia
> pages, I think they also do a fairly decent job of explaining the big
> picture.
>
> Thanks, Sima
>
>
> > >
> > >  Style Guidelines
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> >
> > The patch LGTM, thanks!
> >
> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> >
> > --
> > An old man doll... just what I always wanted! - Clara
>
>
>
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
