Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412AB17993
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 23:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747353146; cv=none; b=VKxVVrdu18kWEsNbf2P6kkRKl+Lbx+8utbTiEiVsqPHY4LKpXQeIRGu5mziWqrdA/Pv3dcqw7m9UwMtpKjeXmhuuS3yZ1a9fIQWbQWMiX+/LH9bWIPWP/0VSHmUjU7KnbAmS5UmuqmGJfBOv1A5VVX2dXupU1JVCdURratG4o+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747353146; c=relaxed/simple;
	bh=zIMM09LgwI+ahHDhun6Q+EKtJoN8+FU1uUTccg092Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mo7fPp2vEtIgU2rYMkjBjoqAYmlzT84otnZ9+eWgHL3KWNpnL34+JLJAZrqjawcrvR9Gl15SWBgKsRQCrwDI5lwZ5JlF+FH9wMBKw4IRuwQ+oesP2TYgWzVBJ+8QvVYgww00sTBM6c0qTBF1s8OOQmneeWywP2gd2RI4AEyDRHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoShdByZ; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoShdByZ"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-401be80368fso721118b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747353144; x=1747957944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dvu88ev1VdWU5DxXw0FZJRoIRYMo1iE9Ijw3Gfebd28=;
        b=OoShdByZYZuRzwICGHVkjhWAAOe+redy/vOYp3/mPQCtsJDfeZoAHyCgSUKzc9k8Me
         WcxrM5MXzmbENmT+i9qQyZKXUncEAU9y8gTg9zeoXpiicYAWECATqWNs8kFgOfSmhKAV
         /mvH0zO+dQiFW39hiwjwyblt1lvms3gPUBV3CPv54liMyTG/cOUUXElApQEjfSGQVB2S
         z2Vs/pSlYxglbV7yn7ac3YxwaVDucTeQfi7p89MBalqsSXJi+VSn6rj1Z/o3nr1N6eW3
         FveMBTV0S35eESy1R76WLE0e985pkljh5BqdRDjua+BwQj2/c3R1l+EBJLOSOnZpKyo3
         g1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747353144; x=1747957944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dvu88ev1VdWU5DxXw0FZJRoIRYMo1iE9Ijw3Gfebd28=;
        b=ECpjIaACd6DKdtWtRG3g7masTreLX5wICR8wbx9/UAH053CZdXIooOCO6sgEWSiSVO
         SiQ+0sy+mJMCG8DIQ8k3Ld37ad9dS2IO/Xxh7XWYH3q85Ilm+HjMgA5OspzJV121RBYu
         4HgiYYYgzMs8yGCTeItsENXqT/eyZ0tQ3899SydQ1CoX0uDa5gs/9XxZ8g9AcMaQ0LuR
         JteLtZwe8AJZ6NKpbjjZOO013kbLc1R6JaU7cytGUBQpsWMtgAYuP+oGxUnkUHHkoqjZ
         JW1jHVixwBlzyUmM1tOavWJqal4VbLEyiMus8sG4jsyobdn6bi+ITe38J+gnElJd9qlx
         Nb7g==
X-Forwarded-Encrypted: i=1; AJvYcCUI4dlaid6lJYtoOTGlb2k6hA4P88JyLA9fcIhMLkPVsWzejwG0fu2Wy2njTtVDCn+iBZXtECi48qR/6yE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbit+hhicQwOYai5XR+zqS710FlQgQhl9Lf66JAYiRSpnvj7g+
	zWqEKN9JS6A6GSaWuDZbMe/8D4lW6HJvn/Dca45sF8QLCq/Xr4DgUVXMdA5W90srRxnR9gkuNVV
	o7PBRd2UxM9LQv76B/L2HU6qOY8+8Yo8=
X-Gm-Gg: ASbGncvgjyVrs3cPtiXU/gF/Et/nOwSZ3rnYUPe9gxl5lY58UON2lm2/PCeXxKvyHIr
	pzv+92XbfoOgbJaHyAqmgX3ME6rJrYJSL2xTGoUyWxkVsAbyp3n645jxs6OUhzn092PphbrsfDb
	YV/rcoeDOMeEUPFluU1zb0T6PXOG16S34=
X-Google-Smtp-Source: AGHT+IF7l+OfeWDxmtMQ/n0NGjONLriHzg84x+VxoXL/MEoU+nBi+ArpmI1jmKMqH8iuRgHL5o1427WBgaE5H/loxm8=
X-Received: by 2002:a05:6808:2f18:b0:403:6fd2:d97c with SMTP id
 5614622812f47-404d869dcc3mr1361963b6e.14.1747353144041; Thu, 15 May 2025
 16:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737644530.git.jani.nikula@intel.com> <dfe6e774883e6ef93cfaa2b6fe92b804061ab9d9.1737644530.git.jani.nikula@intel.com>
 <98201050-82eb-453d-a669-036eeefa354e@gmail.com>
In-Reply-To: <98201050-82eb-453d-a669-036eeefa354e@gmail.com>
From: Bill Wendling <isanbard@gmail.com>
Date: Thu, 15 May 2025 16:52:12 -0700
X-Gm-Features: AX0GCFsG1lMUbV8e9u6zQamu0DG4uq2UWcnglLtzwznz1X3UhF0PTDEVH-90KBk
Message-ID: <CAEzuVAdfY-KiLF7AArQ2Wkw=qP1hnyuG1UmSsv_ZtgrUpfm-3A@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/print: require struct drm_device for drm_err()
 and friends
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, gustavo.sousa@intel.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org, 
	kees@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 1:18=E2=80=AFPM Bill Wendling <isanbard@gmail.com> =
wrote:
> On 1/23/25 7:09 AM, Jani Nikula wrote:
> > The expectation is that the struct drm_device based logging helpers get
> > passed an actual struct drm_device pointer rather than some random
> > struct pointer where you can dereference the ->dev member.
> >
> > Add a static inline helper to convert struct drm_device to struct
> > device, with the main benefit being the type checking of the macro
> > argument.
> >
> > As a side effect, this also reduces macro argument double references.
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >   include/drm/drm_print.h | 41 +++++++++++++++++++++++-----------------=
-
> >   1 file changed, 23 insertions(+), 18 deletions(-)
> >
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> > index 9732f514566d..f31eba1c7cab 100644
> > --- a/include/drm/drm_print.h
> > +++ b/include/drm/drm_print.h
> > @@ -584,9 +584,15 @@ void __drm_dev_dbg(struct _ddebug *desc, const str=
uct device *dev,
> >    * Prefer drm_device based logging over device or prink based logging=
.
> >    */
> >
> > +/* Helper to enforce struct drm_device type */
> > +static inline struct device *__drm_to_dev(const struct drm_device *drm=
)
> > +{
> > +     return drm ? drm->dev : NULL;
> > +}
> > +
> >   /* Helper for struct drm_device based logging. */
> >   #define __drm_printk(drm, level, type, fmt, ...)                    \
> > -     dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA=
_ARGS__)
> > +     dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
> >
> >
> >   #define drm_info(drm, fmt, ...)                                     \
> > @@ -620,25 +626,25 @@ void __drm_dev_dbg(struct _ddebug *desc, const st=
ruct device *dev,
> >
> >
> >   #define drm_dbg_core(drm, fmt, ...)                                 \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_A=
RGS__)
> > -#define drm_dbg_driver(drm, fmt, ...)                                 =
               \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA=
_ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
> > +#define drm_dbg_driver(drm, fmt, ...)                                 =
       \
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_kms(drm, fmt, ...)                                  \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_AR=
GS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_prime(drm, fmt, ...)                                 =
       \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_=
ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_atomic(drm, fmt, ...)                                =
       \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA=
_ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_vbl(drm, fmt, ...)                                  \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_AR=
GS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_state(drm, fmt, ...)                                 =
       \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_=
ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_lease(drm, fmt, ...)                                 =
       \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_=
ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_dp(drm, fmt, ...)                                   \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARG=
S__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
> >   #define drm_dbg_drmres(drm, fmt, ...)                                =
       \
> > -     drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA=
_ARGS__)
> > +     drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> >
> >   #define drm_dbg(drm, fmt, ...)      drm_dbg_driver(drm, fmt, ##__VA_A=
RGS__)
> >
> > @@ -727,10 +733,9 @@ void __drm_err(const char *format, ...);
> >   #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)        =
                               \
> >   ({                                                                   =
                       \
> >       static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DE=
FAULT_RATELIMIT_BURST);\
> > -     const struct drm_device *drm_ =3D (drm);                         =
                         \
> >                                                                        =
                       \
> >       if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_)) =
                       \
> > -             drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, =
## __VA_ARGS__);       \
> > +             drm_dev_printk(__drm_to_dev(drm), KERN_DEBUG, fmt, ## __V=
A_ARGS__);             \
> >   })
> >
> >   #define drm_dbg_ratelimited(drm, fmt, ...) \
> > @@ -752,13 +757,13 @@ void __drm_err(const char *format, ...);
> >   /* Helper for struct drm_device based WARNs */
> >   #define drm_WARN(drm, condition, format, arg...)                    \
> >       WARN(condition, "%s %s: [drm] " format,                         \
> > -                     dev_driver_string((drm)->dev),                  \
> > -                     dev_name((drm)->dev), ## arg)
> > +                     dev_driver_string(__drm_to_dev(drm)),           \
> > +                     dev_name(__drm_to_dev(drm)), ## arg)
> >
> >   #define drm_WARN_ONCE(drm, condition, format, arg...)                =
       \
> >       WARN_ONCE(condition, "%s %s: [drm] " format,                    \
> > -                     dev_driver_string((drm)->dev),                  \
> > -                     dev_name((drm)->dev), ## arg)
> > +                     dev_driver_string(__drm_to_dev(drm)),           \
> > +                     dev_name(__drm_to_dev(drm)), ## arg)
> >
> Hi Jani,
>
> These two changes introduce undefined behavior into these macros. The fin=
al
> code generation becomes this (from 'bxt_port_to_phy_channel'):
>
>         __warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
>                       dev_driver_string(__drm_to_dev(display->drm)),
>                       dev_name(__drm_to_dev(display->drm)),
>                       (port + 'A'));
>
> The issue lies in 'dev_name(__drm_to_dev(display->drm))'. After inlining,=
 it
> becomes this (pseudo code):
>
>         struct device *device =3D display->drm ? display->drm->dev : NULL=
;
>         const char *name =3D device->init_name ? device->init_name
>                                              : kobject_name(&device->kobj=
);
>
>         __warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
>                       dev_driver_string(device), name, (port + 'A'));
>
> The issue, of course, is that the 'device' may be NULL when attempting
> to get
> 'device->init_name'. The compiler sees this as undefined behavior, which =
may
> lead to unexpected outcomes, especially with Clang where paths
> determined to be
> undefined are removed entirely under certain conditions.
>
> (Note, I'm working on making this behavior less draconian by adopting a G=
CC
> pass, but this will take time to filter out to Linux devs.)
>
I potential fix for this would be something like this (untested). I'm
not familiar with how 'dev_name' is used to know whether or not this
could cause issues:

diff --git a/include/linux/device.h b/include/linux/device.h
index 79e49fe494b7..ea20d439fe8e 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -778,6 +778,9 @@ static inline bool device_iommu_mapped(struct device *d=
ev)
  */
 static inline const char *dev_name(const struct device *dev)
 {
+       if (!dev)
+               return "default";
+
        /* Use the init name until the kobject becomes available */
        if (dev->init_name)
                return dev->init_name;

-bw
