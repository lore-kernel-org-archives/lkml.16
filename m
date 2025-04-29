Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EC22A7EA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917256; cv=none; b=KSQj6OQ5nXlyxZ0Zgrreu8Tnk8Wpzi0p21A10H6xrrih3sk+T6JiUxareIuw3C/AN2pBerfJmavA5wF+SiY2VmiXUxTCTsr+h45fd2b9yWX7U0dx7nuVOFk8yLQZAcUBXHbc9GskFk4+NSndg9UUWCWBgUa5a8jIC7tO8wCqxs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917256; c=relaxed/simple;
	bh=WmDkklVX0n6c5Sf9WXGX/saBkZRthPM5qFFF2hWXnAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ecass3EhpOvckCNdBvAr8qG5TpV3jEBDrQRuM2QB1hqRUyk2NLqgnLDpxbfCfO5Dwbjbl53lzpi/FqGkc2tr5t/u1tLlqobLf3L2TdAq4LxORlE5EAI08ZshL7VybWzlS+66jFLdY2E+DdTzcgl5pLTCI6Sv7UWll+w5IjjCmMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKMLxt3g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKMLxt3g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887A6C4CEE3;
	Tue, 29 Apr 2025 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745917255;
	bh=WmDkklVX0n6c5Sf9WXGX/saBkZRthPM5qFFF2hWXnAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKMLxt3guip2uuqX65oh55j5gqp8qGQenthu2QNHbxJx3g7C8fY4EeLkZH+CKdBN7
	 j4No5cHK/LfNTpBycUEYKINFFveKaJVH/5rAve+TDYaBdMCOCp/qZ9oZnm6+p+swoS
	 stPcS58kXN4SgAp4NjSEIG6hUwxppwcxLw/oWqmW3O3wHRjSKEAXLVjD4BVL43eRl0
	 6gBmafl+7gKET9NLGgicX9Tn5CHdfmUR4dx6IfwN9eKj9CI7AL4bSfjfI6kHfDmNMh
	 XzS46YDYE8ww2bV1jQllldYOr1sPJwGge/PZz5LOX7aKB3g0juBSlnVYMdaf05M9/r
	 yZ11j6w6d+bfw==
Date: Tue, 29 Apr 2025 11:00:53 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
Message-ID: <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ngzh5a5h63dgkx3v"
Content-Disposition: inline
In-Reply-To: <87y0vkw8ll.fsf@intel.com>


--ngzh5a5h63dgkx3v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
MIME-Version: 1.0

Hi Jani,

On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wrote:
> On Mon, 31 Mar 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> > Allocate panel via reference counting. Add _get() and _put() helper
> > functions to ensure panel allocations are refcounted. Avoid use after
> > free by ensuring panel pointer is valid and can be usable till the last
> > reference is put.
> >
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> >
> > ---
> > v4: Add refcounting documentation in this patch (Maxime)
> >
> > v3: Add include in this patch (Luca)
> >
> > v2: Export drm_panel_put/get() (Maxime)
> > - Change commit log with better workding (Luca, Maxime)
> > - Change drm_panel_put() to return void (Luca)
> > - Code Cleanups - add return in documentation, replace bridge to
> > panel (Luca)
> > ---
> >  drivers/gpu/drm/drm_panel.c | 64 +++++++++++++++++++++++++++++++++++++=
+++++++-
> >  include/drm/drm_panel.h     | 19 ++++++++++++++
> >  2 files changed, 82 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc303170991=
9564d2e4d8332f748 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(const struct =
device_node *np)
> >  }
> >  EXPORT_SYMBOL(of_drm_find_panel);
> > =20
> > +static void __drm_panel_free(struct kref *kref)
> > +{
> > +	struct drm_panel *panel =3D container_of(kref, struct drm_panel, refc=
ount);
> > +
> > +	kfree(panel->container);
> > +}
> > +
> > +/**
> > + * drm_panel_get - Acquire a panel reference
> > + * @panel: DRM panel
> > + *
> > + * This function increments the panel's refcount.
> > + * Returns:
> > + * Pointer to @panel
> > + */
> > +struct drm_panel *drm_panel_get(struct drm_panel *panel)
> > +{
> > +	if (!panel)
> > +		return panel;
> > +
> > +	kref_get(&panel->refcount);
> > +
> > +	return panel;
> > +}
> > +EXPORT_SYMBOL(drm_panel_get);
> > +
> > +/**
> > + * drm_panel_put - Release a panel reference
> > + * @panel: DRM panel
> > + *
> > + * This function decrements the panel's reference count and frees the
> > + * object if the reference count drops to zero.
> > + */
> > +void drm_panel_put(struct drm_panel *panel)
> > +{
> > +	if (panel)
> > +		kref_put(&panel->refcount, __drm_panel_free);
> > +}
> > +EXPORT_SYMBOL(drm_panel_put);
> > +
> > +/**
> > + * drm_panel_put_void - wrapper to drm_panel_put() taking a void point=
er
> > + *
> > + * @data: pointer to @struct drm_panel, cast to a void pointer
> > + *
> > + * Wrapper of drm_panel_put() to be used when a function taking a void
> > + * pointer is needed, for example as a devm action.
> > + */
> > +static void drm_panel_put_void(void *data)
> > +{
> > +	struct drm_panel *panel =3D (struct drm_panel *)data;
> > +
> > +	drm_panel_put(panel);
> > +}
> > +
> >  void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t o=
ffset,
> >  			     const struct drm_panel_funcs *funcs,
> >  			     int connector_type)
> >  {
> >  	void *container;
> >  	struct drm_panel *panel;
> > +	int err;
> > =20
> >  	if (!funcs) {
> >  		dev_warn(dev, "Missing funcs pointer\n");
> >  		return ERR_PTR(-EINVAL);
> >  	}
> > =20
> > -	container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> > +	container =3D kzalloc(size, GFP_KERNEL);
> >  	if (!container)
> >  		return ERR_PTR(-ENOMEM);
> > =20
> >  	panel =3D container + offset;
> > +	panel->container =3D container;
> >  	panel->funcs =3D funcs;
> > +	kref_init(&panel->refcount);
>=20
> Hi Anusha, this should be done in drm_panel_init() instead.
>
> There are many users of drm_panel that don't use devm_drm_panel_alloc()
> but allocate separately, and call drm_panel_init() only.

That wouldn't really work, because then drivers would have allocated the
panel with devm_kzalloc and thus the structure would be freed when the
device is removed, no matter the reference counting state.

> They'll all have refcount set to 0 instead of 1 like kref_init() does.
>=20
> This means all subsequent get/put pairs on such panels will lead to
> __drm_panel_free() being called! But through a lucky coincidence, that
> will be a nop because panel->container is also not initialized...
>=20
> I'm sorry to say, the drm refcounting interface is quite broken for such
> use cases.

The plan is to convert all panel drivers to that function, and Anusha
already sent series to do. It still needs a bit of work, but it should
land soon-ish.

For the transitional period though, it's not clear to me what you think
is broken at the moment, and / or what should be fixed.

Would you prefer an explicit check on container not being 0, with a
comment?

Maxime

--ngzh5a5h63dgkx3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBCVQAAKCRAnX84Zoj2+
dlcyAYCLuYsYcSdc9dAOHTQk8MikEMnbO5BDgHiHrjAVnO3r3ut6hDDT2xkOq5jD
VEFQDJUBgM7QSkS+kyu4+sK/D1Up5XXZm221iSF4xBdNY+1p4V2UacWKP0+iKa5T
ITyHBMOVvQ==
=2qUE
-----END PGP SIGNATURE-----

--ngzh5a5h63dgkx3v--
