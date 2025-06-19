Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A77324167D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315045; cv=none; b=ExU3qJnvsyK9UNrzVMyGnwyj9SO/31XE/7RTgTNiGFbvO6x3dHpNfaWVWUhJim2RNv0bh1zKa1ii/5J0QNQdHDx9/u1546yRZ5kdQg/o4RMSIDd3Ls5duc0VlN4UgShczNFn1ra7z5PhE425xD1ASnfMwDkgx1d7GKE7gRUHBU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315045; c=relaxed/simple;
	bh=lg3ViviuHKRtuxRr6EtVrs3PYIgqIOuqD4vH6n5ib9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNY/j6lRFeBWXinJ0z0jhYnOLvFFl/QbGk0P6F4VGIcVHT45wRLJnjSWc9vIldBzCbklY2V/jQBba+vRrSv/IPEtLFtCf+bBlRDGYyrlq/2A61EyHsjJn8UZAdVSxcBFvyRNZJ0qJu4DfXVojGCD2QhcOkNS8giNSjJHnqCjyN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DHuunBNe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DHuunBNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750315042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7uNMBk0wAlkZx/rfLqOzJesJna8POdoskmu3HAnO65Y=;
	b=DHuunBNeQP2x9AzJ2u0HvsgpDBO0nyWnqHXmtQaQLgY9OE/3tkls5fXUtpVGD1lIVbnzLy
	/L+Vscp2dTzt9wkwGlVQwwA7kDPxMfRvO1wJNtOvNleln5ZU3G7q8d3KKAp4zFZ+lwQXov
	f+S4G8m9DwAzic1t17v9+SBctnXYmtk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-ZZJ6UioAMYGYhxxPaGJzfA-1; Thu, 19 Jun 2025 02:37:20 -0400
X-MC-Unique: ZZJ6UioAMYGYhxxPaGJzfA-1
X-Mimecast-MFC-AGG-ID: ZZJ6UioAMYGYhxxPaGJzfA_1750315039
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311f4f2e6baso462320a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750315039; x=1750919839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uNMBk0wAlkZx/rfLqOzJesJna8POdoskmu3HAnO65Y=;
        b=EEDoICpRrSeCqG0B/0hWux+k4pMyufjInKolMqmtzPVmZaharsaSq2DUSakFUy4shI
         gu48myQ8vGfoQwsHj81Qn0wGATqzkXFgnGlxOIMjt5+YkHnXSHoR+UkPkP93EM0rpC/Y
         QgVLh8DMgXWSWyXXrvqru2N/Uyk72jFgAcJxxdv7inh9Ag3NrL/5UZbqCeiekVJKxPr+
         pbSxDpPxd8wRjiRzfPmf1EdKXcBDbyUViO8UzeSJQTaQGOgOrwaBUL3RVO+KVYpID3Eu
         j0G3+pu/nOXIdG66E29WmzQrC5bRYgxJ71OhW4GsAXsoCf5SJ300tJKgeZ+SNc/RsNVn
         lojA==
X-Forwarded-Encrypted: i=1; AJvYcCUxn5M7Ov4hMWW+fp9RBqQhrHlV51Ol7DRt3ERkNKHlT/IjNgEoq/MWBmWBB8uo+dBZiPY8l3v/vPYXQ5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJaQ1v4nFg68/X95oMhURWvzTKk3bBgzBmVzR7cbok7uZ5ClOH
	d8rIMwOmaAsQEhEV2lwVScFUDx7vm1DRlEBnRQIurN8SfT+ZqJ3EdMQuIjl714q5FWrpmw0E7FN
	Z29fjLffzQO/5O0xltefntloKXj1Rz3yf4C6wNyAK4yK3151e0Id7rwRl/6SEGeEZXvdvBFSCw1
	NS/CMW4NuV8h8BvHhP+VTCmpM0ygx8ObmJmnE/IKz2
X-Gm-Gg: ASbGncvNLjtjU2HMPV7ZzAGGDglKejXQbttisGnJTsDgb8v8hrpKBLrxPLB5f+aZRFy
	1xT0pPTu/PHHDNELRZHG5Nm39EmX1LT862SLnkbkT2eeZc7pSUM/5Gzdw590U+b2DRIm27Uguuu
	8x8ODqa54boOpl0LP33GuBxnbX9IAAYcdCOWxvDQ==
X-Received: by 2002:a17:90b:528f:b0:312:2bb:aa89 with SMTP id 98e67ed59e1d1-313f1d50e08mr28234696a91.20.1750315039368;
        Wed, 18 Jun 2025 23:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX7GnjAlVhwgCg3zE5Ch7H7SHvP9QUYPvl7kO44iyN3b8BgkXc1zdxaWZ+FGkVn/hULPc5fRFcJjWwX6646bY=
X-Received: by 2002:a17:90b:528f:b0:312:2bb:aa89 with SMTP id
 98e67ed59e1d1-313f1d50e08mr28234671a91.20.1750315038936; Wed, 18 Jun 2025
 23:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613132023.106946-1-ryasuoka@redhat.com> <30f0ea0c-d8fb-461e-86ab-6e7677beac3c@redhat.com>
In-Reply-To: <30f0ea0c-d8fb-461e-86ab-6e7677beac3c@redhat.com>
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
Date: Thu, 19 Jun 2025 15:37:06 +0900
X-Gm-Features: AX0GCFvSMUcq1h_W5ABI167G5MpNn8Cu_AvBDu-QBtX7eKvqtg0izjF5ovDEkb4
Message-ID: <CAHpthZqfzOXfxzv7OTaLK0x_qro1sHKOHqPeFxwNA4_5FYQrRw@mail.gmail.com>
Subject: Re: [PATCH drm-next] drm/bochs: Add support for drm_panic
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 3:12=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
>
> On 13/06/2025 15:20, Ryosuke Yasuoka wrote:
> > Add drm_panic moudle for bochs drm so that panic screen can be displaye=
d
> > on panic.
>
> Thanks for the patch, it's simple and looks good to me.
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>
> If no objections, I will push it next Monday.
>
> Best regards,
>
> --
>
> Jocelyn

Thank you Jocelyn for reviewing my patch.
Now I found a typo in the commit message; moudle -> module.

Let me fix it in v2.

Ryosuke

> >
> > Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> > ---
> >   drivers/gpu/drm/tiny/bochs.c | 19 +++++++++++++++++++
> >   1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.=
c
> > index 8706763af8fb..ed42ad5c4927 100644
> > --- a/drivers/gpu/drm/tiny/bochs.c
> > +++ b/drivers/gpu/drm/tiny/bochs.c
> > @@ -19,6 +19,7 @@
> >   #include <drm/drm_gem_shmem_helper.h>
> >   #include <drm/drm_managed.h>
> >   #include <drm/drm_module.h>
> > +#include <drm/drm_panic.h>
> >   #include <drm/drm_plane_helper.h>
> >   #include <drm/drm_probe_helper.h>
> >
> > @@ -469,10 +470,28 @@ static void bochs_primary_plane_helper_atomic_upd=
ate(struct drm_plane *plane,
> >       bochs_hw_setformat(bochs, fb->format);
> >   }
> >
> > +static int bochs_primary_plane_helper_get_scanout_buffer(struct drm_pl=
ane *plane,
> > +                                                       struct drm_scan=
out_buffer *sb)
> > +{
> > +     struct bochs_device *bochs =3D to_bochs_device(plane->dev);
> > +     struct iosys_map map =3D IOSYS_MAP_INIT_VADDR_IOMEM(bochs->fb_map=
);
> > +
> > +     if (plane->state && plane->state->fb) {
> > +             sb->format =3D plane->state->fb->format;
> > +             sb->width =3D plane->state->fb->width;
> > +             sb->height =3D plane->state->fb->height;
> > +             sb->pitch[0] =3D plane->state->fb->pitches[0];
> > +             sb->map[0] =3D map;
> > +             return 0;
> > +     }
> > +     return -ENODEV;
> > +}
> > +
> >   static const struct drm_plane_helper_funcs bochs_primary_plane_helper=
_funcs =3D {
> >       DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> >       .atomic_check =3D bochs_primary_plane_helper_atomic_check,
> >       .atomic_update =3D bochs_primary_plane_helper_atomic_update,
> > +     .get_scanout_buffer =3D bochs_primary_plane_helper_get_scanout_bu=
ffer,
> >   };
> >
> >   static const struct drm_plane_funcs bochs_primary_plane_funcs =3D {
> >
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>

