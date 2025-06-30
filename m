Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8BA23BD02
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275752; cv=none; b=OXNlhdrB/DR6awRGB/7G3POzCPXmk+eNbnGJfnf+metpK1TSwj8AsylTXJXB/yIEswSslnb17q1j4LmQpt1erU/Sj0ufEhi+8jWJvB/jpkeKpxn/oje5KprNO6dvd2qybGwAGlbHXKKd4kbMqW6C0m4Snl811sJUx/ui0dITHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275752; c=relaxed/simple;
	bh=437iRHQ1kVo1I1bdmcM0HzQdapNSC6C9U96ExY4bl3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5w5KpbuLByMKS+3Z/tNIJPXeGCqjFKLYIHKQhIIdsX2bDthsuZKF/60k/mvqSJSimZbVZMGzjPY4zs24GFUVq0S2JJWwPImewfCtW2uTcljiMw66zn70nOzP6qhndyhqQXG66M08V1nkPbmlA9dj+AIyBqkaBbna80Q6Ip0eNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9OQvGUN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9OQvGUN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8EDC4CEE3;
	Mon, 30 Jun 2025 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751275750;
	bh=437iRHQ1kVo1I1bdmcM0HzQdapNSC6C9U96ExY4bl3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9OQvGUN3Uhm6Zu9JJ/mULf0DJk/a1Kxxe86EImJaT96wUIp4EgtDDlVsiyzpnRjh
	 eSdOBI987tjfc41erMWgM6GE9icms8tT+PwZK8DgxVMcphmY/c13Yl03FxFgILbCu4
	 TEL40VMfa2cmfYymPZicr2NfGbAYXdmS32OJD2pNWPaOfoWP3+miikbDk5PPy4eMrR
	 sn/T4TbqLix1VCmZR1G6/fnTDCrr1oXgJZkiD7fnQe9cn8y9qxQKG97HPMQfFc1KRz
	 ylhr55xXUGHxa2sDkfW80xPkduCXJy1C/st9D6Fn8/gi7toRcnMiM13BeU+FAXyF3Y
	 criSiYFx8FsVA==
Date: Mon, 30 Jun 2025 11:29:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, 
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Michal Simek <michal.simek@amd.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Message-ID: <20250630-phenomenal-taipan-of-imagination-59b300@houat>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
 <20250630-psychedelic-tested-smilodon-adcbb3@houat>
 <20250630091156.GE24861@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="37ifcnljyhys7j4q"
Content-Disposition: inline
In-Reply-To: <20250630091156.GE24861@pendragon.ideasonboard.com>


--37ifcnljyhys7j4q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 12:11:56PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 30, 2025 at 10:27:55AM +0200, Maxime Ripard wrote:
> > On Mon, Jun 30, 2025 at 10:03:16AM +0200, Mike Looijmans wrote:
> > > On 27-06-2025 20:19, Laurent Pinchart wrote:
> > > > On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
> > > > > XRGB8888 is the default mode that Xorg will want to use. Add supp=
ort
> > > > > for this to the Zynqmp DisplayPort driver, so that applications c=
an use
> > > > > 32-bit framebuffers. This solves that the X server would fail to =
start
> > > > > unless one provided an xorg.conf that sets DefaultDepth to 16.
> > > > >=20
> > > > > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > > > > ---
> > > > >=20
> > > > >   drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
> > > > >   1 file changed, 5 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm=
/xlnx/zynqmp_disp.c
> > > > > index 80d1e499a18d..501428437000 100644
> > > > > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > > @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf=
_gfx_fmts[] =3D {
> > > > >   		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > > >   		.swap		=3D true,
> > > > >   		.sf		=3D scaling_factors_888,
> > > > > +	}, {
> > > > > +		.drm_fmt	=3D DRM_FORMAT_XRGB8888,
> > > > > +		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > > > +		.swap		=3D true,
> > > > > +		.sf		=3D scaling_factors_888,
> > > >=20
> > > > I'm afraid that's not enough. There's a crucial difference between
> > > > DRM_FORMAT_ARGB8888 (already supported by this driver) and
> > > > DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be igno=
red.
> > > > The graphics layer is blended on top of the video layer, and the bl=
ender
> > > > uses both a global alpha parameter and the alpha channel of the gra=
phics
> > > > layer for 32-bit RGB formats. This will lead to incorrect operation=
 when
> > > > the 'X' component is not set to full opacity.
> > >=20
> > > I spent a few hours digging in the source code and what I could find =
in the
> > > TRM and register maps, but there's not enough information in there to
> > > explain how the blender works. The obvious "XRGB" implementation woul=
d be to
> > > just disable the blender.
> > >=20
> > > What I got from experimenting so far is that the alpha component is i=
gnored
> > > anyway while the video path isn't active. So as long as one isn't usi=
ng the
> > > video blending path, the ARGB and XRGB modes are identical.
> > >=20
> > > Guess I'll need assistance from AMD/Xilinx to completely implement th=
e XRGB
> > > modes.
> > >=20
> > > (For our application, this patch is sufficient as it solves the issue=
s like
> > > X11 not starting up, OpenGL not working and horrendously slow scaling
> > > performance)
> >=20
> > Given that we consider XRGB8888 mandatory,
>=20
> How about platforms that can't support it at all ?

We emulate it.

> > this patch is a good thing to
> > have anyway, even if suboptimal, or broken in some scenario we can
> > always fix later.
>=20
> It needs to at least be updated to disallow XRGB8888 usage when the
> video plan is enabled, or when global alpha is set to a non-opaque
> value.

Yeah, that's reasonable

Maxime

--37ifcnljyhys7j4q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGJY4AAKCRAnX84Zoj2+
djcdAX9XeDP4a0b+L4+Q51KHH0AusnC4bhV5PW9Ldv3Pfm9A4gsqoH/bJoXZylZq
OoXr/JcBf3eojPGs1t7Jj5LIBd7oIkmWJrvqcdOoovWrORVTUClRiuye50aBjKwq
o4fKpfBWtA==
=yngw
-----END PGP SIGNATURE-----

--37ifcnljyhys7j4q--
