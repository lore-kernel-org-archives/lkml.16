Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889C117A316
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152744; cv=none; b=LM0j2sC8N/Dkwq9kV57YEC8gQufGzfEjLLRGiXfZMcm5D4I51r9vboMcpZD9ZNjJMp5aLN2Jd2AKXk5Uqqx5+DOsHNh+I3ZiEeAzAtT0rIa1LOB9S9ePyeaPrQ7qgPYxToD6PUNNuU7SFpganTHHRSNt7bqmorfrGcZ4jTI/OS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152744; c=relaxed/simple;
	bh=cLQBA67Ba0qiIZ5CrnS7UX0rwNAyNLraLvUpiKHqEIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2mJwlDaTJzqR4RAqsVqusMDSwXSfjBZbgby4QL5aBisSDU+Bdzt/Q7staIE4GPSOtp61sibTsKnb9/FkoVPAheQgAa11saggj1ovd9amAGKcIS9Z1cwOXy4vD1DVteHJtbhB5sQSxm7RRFxTTivWso0Ywb66eFifpXTMlq8gVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxkWA2zF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxkWA2zF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E12C4CEE4;
	Fri, 28 Mar 2025 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743152743;
	bh=cLQBA67Ba0qiIZ5CrnS7UX0rwNAyNLraLvUpiKHqEIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VxkWA2zF3ZXXS/+6CT43xESeRUUFT8bO68NrlXVjIVa2wpiAOn+F5kwVq8FtE9Xfl
	 Iae0pRL4HS/HYbFbLF6M4old/gy9mgc4x/LKWEUYqJ0kzvYieIoCS9PVzFldB47xpN
	 0nYyIbJk3btZKVmjD5Tl1aq4DfKneGiK6PONutzBietqq4VwoXTrd4WeS6oH0A5jCz
	 rWZxiifPaVMcImpfd4tHlS1PzVuF5Oje5sciKbxIBdT+MfXZTTJ4kgPZaCR2+WIOQ3
	 FEiazV0PVjGHnFEDEWf9JYIET36LSKt1O+hx40QYnGYr2snjRHYQMLRaUWuwBopr/f
	 tQflHDtcyHaGQ==
Date: Fri, 28 Mar 2025 10:05:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
Message-ID: <20250328-ochre-rattlesnake-of-glamour-e3afea@houat>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
 <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
 <20250327-noisy-versed-mosquito-df380a@houat>
 <CAN9Xe3QCL=KwhS0KLfaOaDc_TthQg6Gt-pLf1oEEg=1EBLZE2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="npakimqlc44lqz6i"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3QCL=KwhS0KLfaOaDc_TthQg6Gt-pLf1oEEg=1EBLZE2w@mail.gmail.com>


--npakimqlc44lqz6i
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
MIME-Version: 1.0

On Thu, Mar 27, 2025 at 11:33:15AM -0400, Anusha Srivatsa wrote:
> On Thu, Mar 27, 2025 at 11:58=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
>=20
> > On Thu, Mar 27, 2025 at 10:55:39AM -0400, Anusha Srivatsa wrote:
> > > Introduce reference counted allocations for panels to avoid
> > > use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> > > to allocate a new refcounted panel. Followed the documentation for
> > > drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> > > implementations for this purpose.
> > >
> > > v2: Better documentation for connector_type field - follow drm_panel_=
init
> > > documentation. (Luca)
> > > - Clarify the refcount initialisation in comments.(Maxime)
> > > - Correct the documentation of the return type (Maxime)
> > >
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > > ---
> > >  drivers/gpu/drm/drm_panel.c | 25 +++++++++++++++++++++++++
> > >  include/drm/drm_panel.h     | 23 +++++++++++++++++++++++
> > >  2 files changed, 48 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > > index
> > c627e42a7ce70459f50eb5095fffc806ca45dabf..bdeab5710ee324dc1742fbc775822=
50960556308
> > 100644
> > > --- a/drivers/gpu/drm/drm_panel.c
> > > +++ b/drivers/gpu/drm/drm_panel.c
> > > @@ -355,6 +355,31 @@ struct drm_panel *of_drm_find_panel(const struct
> > device_node *np)
> > >  }
> > >  EXPORT_SYMBOL(of_drm_find_panel);
> > >
> > > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t
> > offset,
> > > +                          const struct drm_panel_funcs *funcs,
> > > +                          int connector_type)
> > > +{
> > > +     void *container;
> > > +     struct drm_panel *panel;
> > > +
> > > +     if (!funcs) {
> > > +             dev_warn(dev, "Missing funcs pointer\n");
> > > +             return ERR_PTR(-EINVAL);
> > > +     }
> > > +
> > > +     container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> > > +     if (!container)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     panel =3D container + offset;
> > > +     panel->funcs =3D funcs;
> > > +
> > > +     drm_panel_init(panel, dev, funcs, connector_type);
> > > +
> > > +     return container;
> > > +}
> > > +EXPORT_SYMBOL(__devm_drm_panel_alloc);
> > > +
> > >  /**
> > >   * of_drm_get_panel_orientation - look up the orientation of the pan=
el
> > through
> > >   * the "rotation" binding from a device tree node
> > > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > > index
> > a9c042c8dea1a82ef979c7a68204e0b55483fc28..53251c6b11d78149ede3dad41ffa6=
a88f3c3c58b
> > 100644
> > > --- a/include/drm/drm_panel.h
> > > +++ b/include/drm/drm_panel.h
> > > @@ -28,6 +28,7 @@
> > >  #include <linux/errno.h>
> > >  #include <linux/list.h>
> > >  #include <linux/mutex.h>
> > > +#include <linux/kref.h>
> > >
> > >  struct backlight_device;
> > >  struct dentry;
> > > @@ -268,6 +269,28 @@ struct drm_panel {
> > >       bool enabled;
> > >  };
> > >
> > > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t
> > offset,
> > > +                          const struct drm_panel_funcs *funcs,
> > > +                          int connector_type);
> > > +
> > > +/**
> > > + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
> > > + * @dev: struct device of the panel device
> > > + * @type: the type of the struct which contains struct &drm_panel
> > > + * @member: the name of the &drm_panel within @type
> > > + * @funcs: callbacks for this panel
> > > + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*)
> > corresponding to
> > > + * the panel interface
> > > + * Returns:
> > > + * Pointer to container structure embedding the panel, ERR_PTR on
> > failure.
> > > + * The reference count is initialised to 1 and is automatically  giv=
en
> > back
> > > + * by devm action.
> >
> > Sorry, I noticed after the facts, but this can't be in the Returns
> > section, it needs to be in the main one.
>
> Maxime, Not really following you. Are you suggesting this explanation
> needs to be in the helper documentation instead of in returns?

This is a general documentation thing, so it needs to be in the main
documentation section, thus between the argumnts and returned values
one.

Maxime

--npakimqlc44lqz6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+ZmYwAKCRDj7w1vZxhR
xe9AAQDJ1NtGWXZcg6iEX2wbn7qH42wMVJ4zXo3LlCHZ7pBOYwD/Y1KDZdkdr188
cPcBYpcQhZVETrVe31/WfeAyYJSlfwY=
=+hE0
-----END PGP SIGNATURE-----

--npakimqlc44lqz6i--
