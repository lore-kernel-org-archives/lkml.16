Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361591F152B;
	Tue, 11 Feb 2025 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279454; cv=none; b=TsIbYBg3nZt29u382xJxbutV3UuHxDs7ezhffCxXYhKJ8ia0a0IxsD+8gfqb3jJ+17ian+yfiZEk5IS0uMlJXrRd96VR1E1EOsDGJd59c6UxZ7BIHn8mOP+6x4IyHfwfhyEIi8rrAV704fq8xdLfz30rkaCe/mn9sOdEwzoqaa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279454; c=relaxed/simple;
	bh=zCwcyv3kbEyKWryzgxE+sn/VYvW7bcH+mWkluDzIc7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2NOaku9cWscxVy6xvZbcHxwvGsDTB4RtYM3HzwHIrOd3s8oFiNbIbNSbbTroK5+nc4v2BklPUwnjCcRxvwXcLDWwKR1Gjjz+q+5ovjdBB9D4XNBEM+tjL1zDD5H2rBCpvi2I4uEBtnddqS9ZJmHycIqhF7nIBZ0ZieGR8Nkm/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SynAD06u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SynAD06u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B908C4CEDD;
	Tue, 11 Feb 2025 13:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739279453;
	bh=zCwcyv3kbEyKWryzgxE+sn/VYvW7bcH+mWkluDzIc7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SynAD06u+Nqjs/vNE9db7hEnFjITSDw86k2mbGZPYEzmGz0TQrPLZRFJMQJ5D1ixj
	 vFLSOsSB9oPG4kNSJmdfmvcDLWLRkMzCalvsZ4J4W14BWl+NnCwImnKBeavtqgnpkn
	 GutcGdpB8uB9gydRo/lB+2bD6he+Sfm5bc+AI07w7bjdHjHnNBdd/F5CiGfV+vD0HT
	 VkxCSWyu7btWBOiW8NlctXlZ0MkkCAS2go0FKyyRFBXVmvo9Jzjk0xvhmPxXoHQLyx
	 2pJXMbSvaBsYm915Yaqh4Y+/Qi+GRSyTzJ4CcOS3vYNkc2rpESCHksLg3TKClRiPcr
	 a6q4XEd9UJQPg==
Date: Tue, 11 Feb 2025 14:10:50 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250211-merciful-nyala-of-justice-a4fabb@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <20250210181252.5ee028d4@booty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jzuoj5zcrqyznzxo"
Content-Disposition: inline
In-Reply-To: <20250210181252.5ee028d4@booty>


--jzuoj5zcrqyznzxo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Mon, Feb 10, 2025 at 06:12:52PM +0100, Luca Ceresoli wrote:
> Hello Maxime,
>=20
> On Fri, 7 Feb 2025 12:47:51 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > index ad7ba444a13e5ecf16f996de3742e4ac67dc21f1..43cef0f6ccd36034f64ad=
2babfebea62db1d9e43 100644
> > > --- a/include/drm/drm_bridge.h
> > > +++ b/include/drm/drm_bridge.h
> > > @@ -31,6 +31,7 @@
> > >  #include <drm/drm_encoder.h>
> > >  #include <drm/drm_mode_object.h>
> > >  #include <drm/drm_modes.h>
> > > +#include <drm/drm_print.h>
> > > =20
> > >  struct device_node;
> > > =20
> > > @@ -863,6 +864,22 @@ struct drm_bridge {
> > >  	const struct drm_bridge_timings *timings;
> > >  	/** @funcs: control functions */
> > >  	const struct drm_bridge_funcs *funcs;
> > > +
> > > +	/**
> > > +	 * @container_offset: Offset of this struct within the container
> > > +	 * struct embedding it. Used for refcounted bridges to free the
> > > +	 * embeddeing struct when the refcount drops to zero. Unused on
> > > +	 * legacy bridges.
> > > +	 */
> > > +	size_t container_offset; =20
> >=20
> > This shouldn't be in there. You can create an intermediate structure and
> > store both pointers for the action to consume.
>=20
> You mean to store container_offset + refcount + is_refcounted?

No, I meant for the private structure pointer and the drm_bridge
pointer. refcount should be in drm_bridge, and I think is_refcounted
should be dropped.

> It can be named drm_bridge_object maybe, as it is somewhat resembling
> struct drm_mode_object?
>=20
> > > +	/**
> > > +	 * @refcount: reference count for bridges with dynamic lifetime
> > > +	 * (see drm_bridge_init)
> > > +	 */
> > > +	struct kref refcount;
> > > +	/** @is_refcounted: this bridge has dynamic lifetime management */
> > > +	bool is_refcounted;
> > > + =20
> >=20
> > I'm not sure we want to treat both paths separately too. It'll require
> > to update most of/all the drivers, but it's not too hard with
> > coccinelle:
> >=20
> > virtual patch
> >=20
> > @@
> > identifier f;
> > identifier b, c, d;
> > expression bf;
> > type T;
> > @@
> >=20
> >  f(...)
> >  {
> > 	...
> > -	T *c;
> > +	T *c;
> > 	...
> > -	c =3D devm_kzalloc(d, ...);
> > +	c =3D devm_drm_bridge_alloc(d, T, b, bf);
> > 	...
> > -	c->b.funcs =3D bf;
> > 	...
> > 	drm_bridge_add(&c->b);
> > 	...
> >  }
> >=20
> > We need to add a bit more variations (like kzalloc vs devm_kzalloc,
> > drm_bridge_add vs devm_drm_bridge_add, etc.), but it should be a good
> > first approximation
>=20
> Sure, this can be useful, thanks.

You can identify all the bridges affected by this issue using:

virtual report

@ find_add @
identifier add_f;
identifier c;
identifier b;
expression d;
position p;
identifier r;
type T;
@@

 add_f(...)
 {
 	...
- 	T *c;
+ 	T *c;
 	...
(
	drm_bridge_add(&c->b)@p;
|
	devm_drm_bridge_add(d, &c->b)@p;
|
	r =3D devm_drm_bridge_add(d, &c->b)@p;
)
	...
 }

@ find_allocation depends on find_add @
identifier alloc_f;
type find_add.T;
identifier cal;
position p;
@@

 alloc_f(...)
 {
     ...
-    T *cal;
+    T *cal;
     ...
(
     cal =3D kzalloc(...)@p;
|
     cal =3D devm_kzalloc(...)@p;
)
     ...
 }

@ script:python depends on report && (find_add && find_allocation) @
add_f << find_add.add_f;
alloc_f << find_allocation.alloc_f;
add_p << find_add.p;
alloc_p << find_allocation.p;
@@

coccilib.report.print_report(alloc_p[0], "ERROR: Bridge Driver is unsafely =
allocated in %s and added in %s" % (alloc_f, add_f))


Maxime

--jzuoj5zcrqyznzxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6tMVgAKCRAnX84Zoj2+
dvuyAX4plK46W2Ffi7di1efNeIv7LaT3uh+UAH4FRDQ5MKUwZ4LmvyqLK9FZwWE7
ireqvrMBfAr1LoKByFV9hGrqAhkjtdY5xC+IWfnIP/J/LrGaFiHyP1kBeE1/W9YQ
OfY69IvilQ==
=vEgM
-----END PGP SIGNATURE-----

--jzuoj5zcrqyznzxo--
