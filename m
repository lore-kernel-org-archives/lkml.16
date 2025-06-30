Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D3C280338
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284121; cv=none; b=QPAzrgymxwI8RuS5Sz6zMN5hvhgPJsbiQZddz0yQM9jAPkIWMutgLQch9SBRjhJeTVcSDTN+BrPOhD8PFH9GrJgcn2h3IalaXocHbIldvosJzySzJ4laEOZsIXGig5teO352bnF49l14LsdeBnLj9uFmld1KfNqBD5BjmjWsnTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284121; c=relaxed/simple;
	bh=H184gVZ771yrtruI4xoO2jE86Qijx3ArlxTZ+pxORMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxxr1Bsbi2ecZIfUMTEk52SJFbRk7H3HNmipDJo8SiQ94954Ah96nOrPdeg5CRrOVnjx1bk87LpRfYmuxOztbJZcJSLvVCnVQvJJINfOhrut/GGmbN+6rK7xcMY7yn+uKaNMZqGuFAwBiXKGPso3CrxP6iSRnjtbcInci/ddWS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QERaeucq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QERaeucq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71F3C4CEE3;
	Mon, 30 Jun 2025 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751284121;
	bh=H184gVZ771yrtruI4xoO2jE86Qijx3ArlxTZ+pxORMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QERaeucq4JWA9Qvl9kditWF4DbVCIQnmMeEDY7Wtr5mEgARFkJUr7J3T8tKscDDzq
	 K+dvgRrID1nLArVWRaMFC+jOchrOKdohKMTolg6Q3nRkG+Z25pvuidzk+rd7Z0S6Dr
	 exZUEtd1Mo2Abwpub3yH0ZaUOr8ncabv/FQDLDu1qHYX9bW1+wNxDkGMByKDc6FoaJ
	 mN6tteUfm54fwlb40Z5fcLx29pMIAXMW2JqMN9RMnHgdZA1MaNYB02U4CTvsm92Qt3
	 aB9ZynBO4wuOuYspGz7vVZGTeXyW/mxMJ97awTVnGoUZ+/CsLskhomQ90kGWJid80n
	 O21/WxgINJDTg==
Date: Mon, 30 Jun 2025 13:48:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, 
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Michal Simek <michal.simek@amd.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Message-ID: <20250630-enormous-evasive-scorpion-58bcbd@houat>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
 <20250630-psychedelic-tested-smilodon-adcbb3@houat>
 <20250630091156.GE24861@pendragon.ideasonboard.com>
 <20250630-phenomenal-taipan-of-imagination-59b300@houat>
 <20250630093335.GC20333@pendragon.ideasonboard.com>
 <20250630-delicate-stirring-sawfly-dd81be@houat>
 <20250630113008.GD20333@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6cnjeiuqjwcs7vod"
Content-Disposition: inline
In-Reply-To: <20250630113008.GD20333@pendragon.ideasonboard.com>


--6cnjeiuqjwcs7vod
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 02:30:08PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 30, 2025 at 12:52:48PM +0200, Maxime Ripard wrote:
> > On Mon, Jun 30, 2025 at 12:33:35PM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 30, 2025 at 11:29:08AM +0200, Maxime Ripard wrote:
> > > > On Mon, Jun 30, 2025 at 12:11:56PM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Jun 30, 2025 at 10:27:55AM +0200, Maxime Ripard wrote:
> > > > > > On Mon, Jun 30, 2025 at 10:03:16AM +0200, Mike Looijmans wrote:
> > > > > > > On 27-06-2025 20:19, Laurent Pinchart wrote:
> > > > > > > > On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wr=
ote:
> > > > > > > > > XRGB8888 is the default mode that Xorg will want to use. =
Add support
> > > > > > > > > for this to the Zynqmp DisplayPort driver, so that applic=
ations can use
> > > > > > > > > 32-bit framebuffers. This solves that the X server would =
fail to start
> > > > > > > > > unless one provided an xorg.conf that sets DefaultDepth t=
o 16.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > > > > > > > > ---
> > > > > > > > >=20
> > > > > > > > >   drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
> > > > > > > > >   1 file changed, 5 insertions(+)
> > > > > > > > >=20
> > > > > > > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers=
/gpu/drm/xlnx/zynqmp_disp.c
> > > > > > > > > index 80d1e499a18d..501428437000 100644
> > > > > > > > > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > > > > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > > > > > > @@ -312,6 +312,11 @@ static const struct zynqmp_disp_form=
at avbuf_gfx_fmts[] =3D {
> > > > > > > > >   		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > > > > > > >   		.swap		=3D true,
> > > > > > > > >   		.sf		=3D scaling_factors_888,
> > > > > > > > > +	}, {
> > > > > > > > > +		.drm_fmt	=3D DRM_FORMAT_XRGB8888,
> > > > > > > > > +		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > > > > > > > +		.swap		=3D true,
> > > > > > > > > +		.sf		=3D scaling_factors_888,
> > > > > > > >=20
> > > > > > > > I'm afraid that's not enough. There's a crucial difference =
between
> > > > > > > > DRM_FORMAT_ARGB8888 (already supported by this driver) and
> > > > > > > > DRM_FORMAT_XRGB8888: for the latter, the 'X' component must=
 be ignored.
> > > > > > > > The graphics layer is blended on top of the video layer, an=
d the blender
> > > > > > > > uses both a global alpha parameter and the alpha channel of=
 the graphics
> > > > > > > > layer for 32-bit RGB formats. This will lead to incorrect o=
peration when
> > > > > > > > the 'X' component is not set to full opacity.
> > > > > > >=20
> > > > > > > I spent a few hours digging in the source code and what I cou=
ld find in the
> > > > > > > TRM and register maps, but there's not enough information in =
there to
> > > > > > > explain how the blender works. The obvious "XRGB" implementat=
ion would be to
> > > > > > > just disable the blender.
> > > > > > >=20
> > > > > > > What I got from experimenting so far is that the alpha compon=
ent is ignored
> > > > > > > anyway while the video path isn't active. So as long as one i=
sn't using the
> > > > > > > video blending path, the ARGB and XRGB modes are identical.
> > > > > > >=20
> > > > > > > Guess I'll need assistance from AMD/Xilinx to completely impl=
ement the XRGB
> > > > > > > modes.
> > > > > > >=20
> > > > > > > (For our application, this patch is sufficient as it solves t=
he issues like
> > > > > > > X11 not starting up, OpenGL not working and horrendously slow=
 scaling
> > > > > > > performance)
> > > > > >=20
> > > > > > Given that we consider XRGB8888 mandatory,
> > > > >=20
> > > > > How about platforms that can't support it at all ?
> > > >=20
> > > > We emulate it.
> > >=20
> > > Does that imply a full memcpy of the frame buffer in the kernel drive=
r,
> > > or is it emulated in userspace ?
> >=20
> > Neither :)
> >=20
> > The kernel deals with it through drm_fb_xrgb8888_to_* helpers, but only
> > on the parts of the framebuffer that were modified through the damage
> > API.
>=20
> Aahhh OK, it's for the fbdev emulation. So that means that drivers are
> not required to support XRGB8888 ?

No, it's for KMS.

Maxime

--6cnjeiuqjwcs7vod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGJ5kgAKCRAnX84Zoj2+
dtHkAXwNtyyEjsQUv8JQdIBXT6tm3KJUjlzGhpdjE5afhE4oZw2ADEyDXOnl54o2
NwOIvLUBf3Mz48PkLBlxwmZ/gjbSF8CEQWhXESLyMBhNlyn/SG1J5QxjCXKVIxfO
/sSVScdEYA==
=AOip
-----END PGP SIGNATURE-----

--6cnjeiuqjwcs7vod--
