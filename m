Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2872557C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 06:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746428035; cv=none; b=mVAOmteJSsDKnrl6h88ySa7qheWzX3VzAW7NviRyrKJR4P20yUFiwiuu7/smmAkALONn6iicQFKXZXz6jw0WK4jOTMhE5ejr0/K4G8c6wV6jkWdTV68aSNuPb2bSrtV5+MyFobcsvdb/QvY1WumIj9J8LdzbeEmgtHC7DRkpTRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746428035; c=relaxed/simple;
	bh=p9k7a7plfHPirL4/D1vmJbydTyrgcTwLFl+TNsvaFkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiAtd3larVwDBgpGlKRw1y5prt79WPqkEMu8Kpi6ipqtS3yhHsCLqQ6y+nPKpGM2PryxKQjLS/kQIP25Zhm5p1VHbrZmil7mgYgpXO4Z3WGM/eF+rmFWffXfNY4bRYJNIc8jqXbm2JGGJBkac56c1r/CXGuW5/3m5/YzNQvtpFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5rMJTEa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5rMJTEa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88C9C4CEE4;
	Mon,  5 May 2025 06:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746428034;
	bh=p9k7a7plfHPirL4/D1vmJbydTyrgcTwLFl+TNsvaFkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5rMJTEa7mYrgk7h407p65ojM9JSgmKDzS57MHcQm9VxFE3hv7fTcFxAbmyvI06+U
	 2iKuOKIQT/pM1u6S/1PvRpHmuZFyVWqrcGsImow9Ixn7a+0l+SaUXo6W49ie03Cq07
	 0IZKd22+wd1iz7vM8gDDVf5Pss5jtaFa3/xQUW0Eo57Va5STHwDYHAMd5mmXZzsxMg
	 EkwzMA1rmhOlY4GaafoLRFxZMXoaLHJlgg1hD26LcUh7RHnAT7xt/mw/cQsRf72xrH
	 5pvp6z0M8zGZcM/dqfmleo0npSb5xcLR6AqI6qInqabOfY+cqOvXSfg1KqweefPQhE
	 0R07fNo6zaSbw==
Date: Mon, 5 May 2025 08:53:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
Message-ID: <20250505-slim-bizarre-marten-a674ac@houat>
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="at4hkhrsv3fzhc5v"
Content-Disposition: inline
In-Reply-To: <87o6wfwcef.fsf@intel.com>


--at4hkhrsv3fzhc5v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
MIME-Version: 1.0

Hi Jani,

On Tue, Apr 29, 2025 at 12:22:00PM +0300, Jani Nikula wrote:
> On Tue, 29 Apr 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > Hi Jani,
> >
> > On Mon, Apr 28, 2025 at 07:31:50PM +0300, Jani Nikula wrote:
> >> On Mon, 31 Mar 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> >> > Allocate panel via reference counting. Add _get() and _put() helper
> >> > functions to ensure panel allocations are refcounted. Avoid use after
> >> > free by ensuring panel pointer is valid and can be usable till the l=
ast
> >> > reference is put.
> >> >
> >> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> >> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> >> >
> >> > ---
> >> > v4: Add refcounting documentation in this patch (Maxime)
> >> >
> >> > v3: Add include in this patch (Luca)
> >> >
> >> > v2: Export drm_panel_put/get() (Maxime)
> >> > - Change commit log with better workding (Luca, Maxime)
> >> > - Change drm_panel_put() to return void (Luca)
> >> > - Code Cleanups - add return in documentation, replace bridge to
> >> > panel (Luca)
> >> > ---
> >> >  drivers/gpu/drm/drm_panel.c | 64 ++++++++++++++++++++++++++++++++++=
++++++++++-
> >> >  include/drm/drm_panel.h     | 19 ++++++++++++++
> >> >  2 files changed, 82 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel=
=2Ec
> >> > index bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc303170=
9919564d2e4d8332f748 100644
> >> > --- a/drivers/gpu/drm/drm_panel.c
> >> > +++ b/drivers/gpu/drm/drm_panel.c
> >> > @@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(const stru=
ct device_node *np)
> >> >  }
> >> >  EXPORT_SYMBOL(of_drm_find_panel);
> >> > =20
> >> > +static void __drm_panel_free(struct kref *kref)
> >> > +{
> >> > +	struct drm_panel *panel =3D container_of(kref, struct drm_panel, r=
efcount);
> >> > +
> >> > +	kfree(panel->container);
> >> > +}
> >> > +
> >> > +/**
> >> > + * drm_panel_get - Acquire a panel reference
> >> > + * @panel: DRM panel
> >> > + *
> >> > + * This function increments the panel's refcount.
> >> > + * Returns:
> >> > + * Pointer to @panel
> >> > + */
> >> > +struct drm_panel *drm_panel_get(struct drm_panel *panel)
> >> > +{
> >> > +	if (!panel)
> >> > +		return panel;
> >> > +
> >> > +	kref_get(&panel->refcount);
> >> > +
> >> > +	return panel;
> >> > +}
> >> > +EXPORT_SYMBOL(drm_panel_get);
> >> > +
> >> > +/**
> >> > + * drm_panel_put - Release a panel reference
> >> > + * @panel: DRM panel
> >> > + *
> >> > + * This function decrements the panel's reference count and frees t=
he
> >> > + * object if the reference count drops to zero.
> >> > + */
> >> > +void drm_panel_put(struct drm_panel *panel)
> >> > +{
> >> > +	if (panel)
> >> > +		kref_put(&panel->refcount, __drm_panel_free);
> >> > +}
> >> > +EXPORT_SYMBOL(drm_panel_put);
> >> > +
> >> > +/**
> >> > + * drm_panel_put_void - wrapper to drm_panel_put() taking a void po=
inter
> >> > + *
> >> > + * @data: pointer to @struct drm_panel, cast to a void pointer
> >> > + *
> >> > + * Wrapper of drm_panel_put() to be used when a function taking a v=
oid
> >> > + * pointer is needed, for example as a devm action.
> >> > + */
> >> > +static void drm_panel_put_void(void *data)
> >> > +{
> >> > +	struct drm_panel *panel =3D (struct drm_panel *)data;
> >> > +
> >> > +	drm_panel_put(panel);
> >> > +}
> >> > +
> >> >  void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_=
t offset,
> >> >  			     const struct drm_panel_funcs *funcs,
> >> >  			     int connector_type)
> >> >  {
> >> >  	void *container;
> >> >  	struct drm_panel *panel;
> >> > +	int err;
> >> > =20
> >> >  	if (!funcs) {
> >> >  		dev_warn(dev, "Missing funcs pointer\n");
> >> >  		return ERR_PTR(-EINVAL);
> >> >  	}
> >> > =20
> >> > -	container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> >> > +	container =3D kzalloc(size, GFP_KERNEL);
> >> >  	if (!container)
> >> >  		return ERR_PTR(-ENOMEM);
> >> > =20
> >> >  	panel =3D container + offset;
> >> > +	panel->container =3D container;
> >> >  	panel->funcs =3D funcs;
> >> > +	kref_init(&panel->refcount);
> >>=20
> >> Hi Anusha, this should be done in drm_panel_init() instead.
> >>
> >> There are many users of drm_panel that don't use devm_drm_panel_alloc()
> >> but allocate separately, and call drm_panel_init() only.
> >
> > That wouldn't really work, because then drivers would have allocated the
> > panel with devm_kzalloc and thus the structure would be freed when the
> > device is removed, no matter the reference counting state.
> >
> >> They'll all have refcount set to 0 instead of 1 like kref_init() does.
> >>=20
> >> This means all subsequent get/put pairs on such panels will lead to
> >> __drm_panel_free() being called! But through a lucky coincidence, that
> >> will be a nop because panel->container is also not initialized...
> >>=20
> >> I'm sorry to say, the drm refcounting interface is quite broken for su=
ch
> >> use cases.
> >
> > The plan is to convert all panel drivers to that function, and Anusha
> > already sent series to do. It still needs a bit of work, but it should
> > land soon-ish.
> >
> > For the transitional period though, it's not clear to me what you think
> > is broken at the moment, and / or what should be fixed.
> >
> > Would you prefer an explicit check on container not being 0, with a
> > comment?
>=20
> I'm looking at what it would take to add drm_panel support to i915 so
> that you could have drm_panel_followers on it. There are gaps of course,
> but initially it would mean allocating and freeing drm_panel ourselves,
> not via devm_drm_panel_alloc() nor devm_kzalloc(), because none of the
> other stuff is allocated that way. drm_panel would just sit as a
> sub-struct inside struct intel_panel, which is a sub-struct of struct
> intel_connector, which has its own allocation...

I'm not entirely sure why you would need to allocate it from i915? The
drm_panel structure is only meant to be allocated by panel drivers, and
afaik no panel interface controller is allocating it.

> But basically in its current state, the refcounting would not be
> reliable for that use case. I guess with panel->container being NULL
> nothing happens, but the idea that the refcount drops back to 0 after a
> get/put is a bit scary.
>=20
> Anyway, I think there should be no harm in moving the kref init to
> drm_panel_init(), right?

I mean, there is because the plan so far was to remove drm_panel_init() :)

Maxime

--at4hkhrsv3fzhc5v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBhgegAKCRAnX84Zoj2+
dp7oAYDmYPmUVVaIg5Fgz3zr+lOpECrQrhm3BOQQSJx9l8zv6s4/XMktx0y/ctZH
btaQhzABgM/oaYCJp3H6gTEJX0xHmWPKch/cv0rdl8Mkelkri7CaYLsGfwLK83D+
H/1RgOhJyA==
=2bYT
-----END PGP SIGNATURE-----

--at4hkhrsv3fzhc5v--
