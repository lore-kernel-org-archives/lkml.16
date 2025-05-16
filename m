Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405E627A935
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747428129; cv=none; b=GK5C4qY/SXvIwT3U7ZL1ALeiCU/kA5Q8QyD6Y8ZWwfc6llGrMhFAksJeD5uIrZgJtP6Wui5PEyQ8eIZgDJO5tfSFTmzkthY2JCp52YiGf3pS7ZxMYHa3CtklHmCj+R0IxG5QSSYZHbmIgwK7eezYfLvFIoR2Sr7S/LR5qtIPgA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747428129; c=relaxed/simple;
	bh=xnXoDCDL/H/92KcXd8O0dA9htLQYNeVaV5oW8tFr/Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqPS2Rb1KdBb8k8V/KLx7WyG0xahZcQ9X9Cx+e2RCxl+aRk3Na52uiBXw4GydtxcnQh4Cyz7E2Zf5Jm7kHDq9Ec8SBGJEcNqAu9sdEgdjA4vo+l77/QbwVHwRsoaSK8F0NuFZqh5NC+nFnthWmHxCaoaljNpvKYspPxlDp25aUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vc/mdc7H; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vc/mdc7H"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-60402c94319so1784557eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747428127; x=1748032927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++pgd4lWtGe5gVbWEu9BXWAu4/0l6ZQAQhVYnZuFWpc=;
        b=Vc/mdc7Hi+upWQSYkeuFK0pl+ma063U2mdDQkmPuBYg3MSXJ9Y0mktkG6pQNZ5PC5d
         tMGpzJdo5dBIwE3zfHZLsAJP7De2J+P1bCVA/bebaU5Jjea1/jAqIBssranI5yXt9efc
         iJXVCUWNhja6Ksk3bJLpxeQVWV35X4pHjxZ95yS5+PRAxqQQMfwXmOKaQYkMCAlA+qkG
         8jLEqUQOUMkcCmHw8dUL8EHFhYTWQo48AD7t4Zjue22cAeDfT3Wm8HDT18laJwIyh29b
         UYLD46mhn7N9f9IJeNfBSCkkfZzicb8j4re6LmIxEj5FK2mSX9ZQIkuSNb/tabLNi7lU
         jtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747428127; x=1748032927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++pgd4lWtGe5gVbWEu9BXWAu4/0l6ZQAQhVYnZuFWpc=;
        b=kU7A/zrZN8VmX2Japx0HmG0rlF6GgXWe3ATx1ClgvPRCkfOicOzlJx6EZ/2PORQ6+e
         o1SQMJhPAQflL8b3wV+hNb9DTiuoFFtkJpXFT85bU9EAZTMoPS1QxcS0QM5CMBEFqF48
         gmT4cVzYTFvuUKenuoZsS7pOiaOxiW8pOSjznhuzUBPtP1iPHuT4jvCLYtN3n72kkBl2
         x5msoKjB9vqaXeKSJ/oMm/rduFuP9p+15HJhJ25kJwoSGmf0BqrcMeAF1QoFlQ/o5awV
         6z1hnY2z8koVRYjVfej0y4fhaZ5lnNccUdvtgEwjRc6RBo2yoXTvSzaeiNo38qP4fXcG
         C0lA==
X-Forwarded-Encrypted: i=1; AJvYcCWnmJYmqOvOWMEjI2vmLf8ruSC2iOYEufXsYbVAR2WpeN7YnCsevEQ4ik8Pt+DIPP0S3Qlr/gdXQn2171k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbzXaGMAFWdf2qjzyfiDq5AAmj96CBJXcSEzL1SxfmQ3oT2vFJ
	BXdLvZsMcJTn5c6l1c1cMKpfvIphnTzZMcZbSgxBM+tb0kD3KH9KeuUhFGBh1qwT6eUPKCax43C
	iik5rFmUO526PbkqLqf7lcgGbGw1D8JfTfyDEdG2arg==
X-Gm-Gg: ASbGncujz/g8UhOSt7iWLZcTl3SsPJe+UrfgjW5WPsMoi+xIHRuAYgIplafnFw8mqOr
	dSeIuuFj2uU8StQnpEk0KSLhHEJTr8xr59OBBEe3VVCtR8mMxRPUzfn6GVvaIi3L70YpKKh9+D0
	MJEMxRG6CZ5CH9cZMx9Inv8xV+GsB5Vlg=
X-Google-Smtp-Source: AGHT+IHR+fnGjVQ6LsJ/OmPMbiA6XNjnPLOboi1Mi9DnsD3Les3kYywT0vBHV91Lac+yDiDoypiukbNZKMv0wICzY2A=
X-Received: by 2002:a05:6820:218:b0:606:26bb:db78 with SMTP id
 006d021491bc7-609f37b8c4amr2645416eaf.8.1747428126931; Fri, 16 May 2025
 13:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737644530.git.jani.nikula@intel.com> <dfe6e774883e6ef93cfaa2b6fe92b804061ab9d9.1737644530.git.jani.nikula@intel.com>
 <98201050-82eb-453d-a669-036eeefa354e@gmail.com> <87tt5kx4wv.fsf@intel.com>
In-Reply-To: <87tt5kx4wv.fsf@intel.com>
From: Bill Wendling <isanbard@gmail.com>
Date: Fri, 16 May 2025 13:41:56 -0700
X-Gm-Features: AX0GCFvRm5FS98B6TnFQ7HNNXpyCZJsgFZEIq5XNCm3L9LA9ALlSEsiUmJq23w4
Message-ID: <CAEzuVAcTSVSBfOPFcgz4uv4bFyvu618RLfKzB6j=sVF2qbygXA@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/print: require struct drm_device for drm_err()
 and friends
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	gustavo.sousa@intel.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	linux-kernel@vger.kernel.org, kees@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 2:48=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
> On Thu, 15 May 2025, Bill Wendling <isanbard@gmail.com> wrote:
> > On 1/23/25 7:09 AM, Jani Nikula wrote:
> >> The expectation is that the struct drm_device based logging helpers ge=
t
> >> passed an actual struct drm_device pointer rather than some random
> >> struct pointer where you can dereference the ->dev member.
> >>
> >> Add a static inline helper to convert struct drm_device to struct
> >> device, with the main benefit being the type checking of the macro
> >> argument.
> >>
> >> As a side effect, this also reduces macro argument double references.
> >>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>   include/drm/drm_print.h | 41 +++++++++++++++++++++++----------------=
--
> >>   1 file changed, 23 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> >> index 9732f514566d..f31eba1c7cab 100644
> >> --- a/include/drm/drm_print.h
> >> +++ b/include/drm/drm_print.h
> >> @@ -584,9 +584,15 @@ void __drm_dev_dbg(struct _ddebug *desc, const st=
ruct device *dev,
> >>    * Prefer drm_device based logging over device or prink based loggin=
g.
> >>    */
> >>
> >> +/* Helper to enforce struct drm_device type */
> >> +static inline struct device *__drm_to_dev(const struct drm_device *dr=
m)
> >> +{
> >> +    return drm ? drm->dev : NULL;
> >> +}
> >> +
> >>   /* Helper for struct drm_device based logging. */
> >>   #define __drm_printk(drm, level, type, fmt, ...)                   \
> >> -    dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA=
_ARGS__)
> >> +    dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
> >>
> >>
> >>   #define drm_info(drm, fmt, ...)                                    \
> >> @@ -620,25 +626,25 @@ void __drm_dev_dbg(struct _ddebug *desc, const s=
truct device *dev,
> >>
> >>
> >>   #define drm_dbg_core(drm, fmt, ...)                                 =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_A=
RGS__)
> >> -#define drm_dbg_driver(drm, fmt, ...)                                =
               \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA=
_ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
> >> +#define drm_dbg_driver(drm, fmt, ...)                                =
       \
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_kms(drm, fmt, ...)                                 \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_AR=
GS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_prime(drm, fmt, ...)                                =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_=
ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_atomic(drm, fmt, ...)                               =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA=
_ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_vbl(drm, fmt, ...)                                 \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_AR=
GS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_state(drm, fmt, ...)                                =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_=
ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_lease(drm, fmt, ...)                                =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_=
ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_dp(drm, fmt, ...)                                  \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARG=
S__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
> >>   #define drm_dbg_drmres(drm, fmt, ...)                               =
       \
> >> -    drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA=
_ARGS__)
> >> +    drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> >>
> >>   #define drm_dbg(drm, fmt, ...)     drm_dbg_driver(drm, fmt, ##__VA_A=
RGS__)
> >>
> >> @@ -727,10 +733,9 @@ void __drm_err(const char *format, ...);
> >>   #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)       =
                               \
> >>   ({                                                                  =
                       \
> >>      static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DE=
FAULT_RATELIMIT_BURST);\
> >> -    const struct drm_device *drm_ =3D (drm);                         =
                         \
> >>                                                                       =
                       \
> >>      if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_)) =
                       \
> >> -            drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, =
## __VA_ARGS__);       \
> >> +            drm_dev_printk(__drm_to_dev(drm), KERN_DEBUG, fmt, ## __V=
A_ARGS__);             \
> >>   })
> >>
> >>   #define drm_dbg_ratelimited(drm, fmt, ...) \
> >> @@ -752,13 +757,13 @@ void __drm_err(const char *format, ...);
> >>   /* Helper for struct drm_device based WARNs */
> >>   #define drm_WARN(drm, condition, format, arg...)                   \
> >>      WARN(condition, "%s %s: [drm] " format,                         \
> >> -                    dev_driver_string((drm)->dev),                  \
> >> -                    dev_name((drm)->dev), ## arg)
> >> +                    dev_driver_string(__drm_to_dev(drm)),           \
> >> +                    dev_name(__drm_to_dev(drm)), ## arg)
> >>
> >>   #define drm_WARN_ONCE(drm, condition, format, arg...)               =
       \
> >>      WARN_ONCE(condition, "%s %s: [drm] " format,                    \
> >> -                    dev_driver_string((drm)->dev),                  \
> >> -                    dev_name((drm)->dev), ## arg)
> >> +                    dev_driver_string(__drm_to_dev(drm)),           \
> >> +                    dev_name(__drm_to_dev(drm)), ## arg)
> >>
> > Hi Jani,
> >
> > These two changes introduce undefined behavior into these macros. The f=
inal
> > code generation becomes this (from 'bxt_port_to_phy_channel'):
> >
> >       __warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
> >                     dev_driver_string(__drm_to_dev(display->drm)),
> >                     dev_name(__drm_to_dev(display->drm)),
> >                     (port + 'A'));
> >
> > The issue lies in 'dev_name(__drm_to_dev(display->drm))'. After inlinin=
g, it
> > becomes this (pseudo code):
> >
> >       struct device *device =3D display->drm ? display->drm->dev : NULL=
;
> >       const char *name =3D device->init_name ? device->init_name
> >                                            : kobject_name(&device->kobj=
);
> >
> >       __warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
> >                     dev_driver_string(device), name, (port + 'A'));
> >
> > The issue, of course, is that the 'device' may be NULL when attempting
> > to get
> > 'device->init_name'. The compiler sees this as undefined behavior, whic=
h may
> > lead to unexpected outcomes, especially with Clang where paths
> > determined to be
> > undefined are removed entirely under certain conditions.
>
> Would it be better to just revert the drm_WARN() and drm_WARN_ONCE()
> macros to use (drm)->dev directly?
>
> It's not ideal, but as the quick fix.
>
> I don't think adding the check in dev_name() would go down well, as
> there are roughly 5k users of it, and feels like unnecessary code size
> bloat.
>
I did a quick check and vmlinux size changed by only about 0.0078%.
Most modules didn't change size, some did increase, but typically less
than 1%, and a few actually shrank in size (??). The largest change
was 6.5840% : counter.ko.

Reverting the patches would probably work, but that relies upon 'drm'
never being NULL. Indeed, it looks like 'dev_driver_string' is wary of
a NULL 'drm', though it still accesses the argument as if it couldn't
be NULL... This all seems like a disaster waiting to happen, to be
honest. There should either be no way for 'drm' to be NULL or handling
for when it is. What happened with this series of patches is adding
only partial handling for when it is NULL.

-bw
