Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E822092
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091093; cv=none; b=ETxmbVQy48qM7cuPHKcmrml7xgXp1PisVrqT8/v3TCNhc9kW6M6LfnB3cXCHykoS11x7gO/PO+tzTdo9iQfOcerH9o6jSEbeGy9DEmrXMgVHfdd2nYxoKylp2kMM6SggNLYEA59NIyjYaJwaLkkNSF/C/kexffoqPZr9HTfXZdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091093; c=relaxed/simple;
	bh=+T/usutYATIVJfozhR4QP9BWZs9KHkrppHeNUlZMcUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDEQJvaF5ddr8EWKL+glJ+QF2slR/PDQ5GWaVJA8wU8U8jxbyhrGwFwMfjgbtBue1LZo1EKr7wO6gBt6ZtqKqVCDEzAdXQ/uf/OhSM68RIedk0jftChHqeSeTDoUJzBgMaOykuHK0GTNII16e5cewjJm3b65LmxyJCoT9j6Bhbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLXOkz4N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLXOkz4N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF5EC4CEDD;
	Thu, 27 Mar 2025 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743091093;
	bh=+T/usutYATIVJfozhR4QP9BWZs9KHkrppHeNUlZMcUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLXOkz4NICk3LeU9a51rb1cNbtgnYUi1Z2CbH1mQCrsILKXrqN919KWthsEsJyXNl
	 i65VJbDXihOA6KUB8w0C2ZJ0d4JVi7NrEayN89hGVw9uIdrEYW6Zzb+q0D+hXUvSid
	 ehogUdAmIkBRIKvwXGjDVu8W3rr1Fai8QJM0RXCsmuBCHshEDK/K9lJQ4bl1xJXHv1
	 IbKqZCmJz54Zf2U9h+S9YtsFDvjoHyJCMX9yznYSBKjtnb+S1hTm32nkcfiFW+nq6G
	 EEM6SaZU30HvOM4uhhJfxMGXuJLJsdE3SDb4zmcLWMuO+/zPy3cwdXq+0gugvCQ8nB
	 ode0g0XUOjSLA==
Date: Thu, 27 Mar 2025 16:58:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
Message-ID: <20250327-noisy-versed-mosquito-df380a@houat>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
 <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iqyvzhj7dwg7egtk"
Content-Disposition: inline
In-Reply-To: <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>


--iqyvzhj7dwg7egtk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
MIME-Version: 1.0

On Thu, Mar 27, 2025 at 10:55:39AM -0400, Anusha Srivatsa wrote:
> Introduce reference counted allocations for panels to avoid
> use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> to allocate a new refcounted panel. Followed the documentation for
> drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> implementations for this purpose.
>=20
> v2: Better documentation for connector_type field - follow drm_panel_init
> documentation. (Luca)
> - Clarify the refcount initialisation in comments.(Maxime)
> - Correct the documentation of the return type (Maxime)
>=20
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 25 +++++++++++++++++++++++++
>  include/drm/drm_panel.h     | 23 +++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index c627e42a7ce70459f50eb5095fffc806ca45dabf..bdeab5710ee324dc1742fbc77=
582250960556308 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -355,6 +355,31 @@ struct drm_panel *of_drm_find_panel(const struct dev=
ice_node *np)
>  }
>  EXPORT_SYMBOL(of_drm_find_panel);
> =20
> +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t off=
set,
> +			     const struct drm_panel_funcs *funcs,
> +			     int connector_type)
> +{
> +	void *container;
> +	struct drm_panel *panel;
> +
> +	if (!funcs) {
> +		dev_warn(dev, "Missing funcs pointer\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	container =3D devm_kzalloc(dev, size, GFP_KERNEL);
> +	if (!container)
> +		return ERR_PTR(-ENOMEM);
> +
> +	panel =3D container + offset;
> +	panel->funcs =3D funcs;
> +
> +	drm_panel_init(panel, dev, funcs, connector_type);
> +
> +	return container;
> +}
> +EXPORT_SYMBOL(__devm_drm_panel_alloc);
> +
>  /**
>   * of_drm_get_panel_orientation - look up the orientation of the panel t=
hrough
>   * the "rotation" binding from a device tree node
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index a9c042c8dea1a82ef979c7a68204e0b55483fc28..53251c6b11d78149ede3dad41=
ffa6a88f3c3c58b 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -28,6 +28,7 @@
>  #include <linux/errno.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/kref.h>
> =20
>  struct backlight_device;
>  struct dentry;
> @@ -268,6 +269,28 @@ struct drm_panel {
>  	bool enabled;
>  };
> =20
> +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t off=
set,
> +			     const struct drm_panel_funcs *funcs,
> +			     int connector_type);
> +
> +/**
> + * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
> + * @dev: struct device of the panel device
> + * @type: the type of the struct which contains struct &drm_panel
> + * @member: the name of the &drm_panel within @type
> + * @funcs: callbacks for this panel
> + * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) correspond=
ing to
> + * the panel interface
> + * Returns:
> + * Pointer to container structure embedding the panel, ERR_PTR on failur=
e.
> + * The reference count is initialised to 1 and is automatically  given b=
ack
> + * by devm action.

Sorry, I noticed after the facts, but this can't be in the Returns
section, it needs to be in the main one.

Maxime

--iqyvzhj7dwg7egtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+V1kgAKCRDj7w1vZxhR
xRo2AP9AtLjLAlr805rM08KGllPi/Q/SpMKm5ADXMvTcMMJ6RgEAz4XZt2XnJyvd
5Sacavhet4R18oz5XGrXlEQLC2rhxAM=
=S4rr
-----END PGP SIGNATURE-----

--iqyvzhj7dwg7egtk--
