Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ED73594B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576893; cv=none; b=csITpBsQOJfbdf/2XvL8nUgHiwkUlpKM2jc7pPG6Iy7LsmenEiAOtxWWHVJPUtFxbyyPQOWPdQk7xX9JOIXbchcw8OV3oCa61gHwBQ43tHrDUu5R8rg6l748oSWzDcwK1kakghXIcjkHv51lUjFsks7+HquT3otzF+Y0xMJpm7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576893; c=relaxed/simple;
	bh=V9giy5MX7MQSqkqjoJi+cO3oEo1PEdyOZ3ruRKzX5XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyAh8Ae4olD8tcvdeCNPORXVtxLrZM9eEX2/27x1B70n2/tOhAT75dJ6wsTOSHAU/e5fVjLimA49c6r/b7/SJd9LtkCCf6yY+hPZ+s4pfiKxKrigJVDaQFX5FiV/bzLAIlgBuMcni7ZgDFpHECBAIcwWNBa5/lcntNsLDU8fj9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fx5CF1bS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fx5CF1bS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B60C4CED2;
	Mon,  3 Feb 2025 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738576891;
	bh=V9giy5MX7MQSqkqjoJi+cO3oEo1PEdyOZ3ruRKzX5XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fx5CF1bS+Y/KZTcL1rmhAhY7/bcfAJ+nXP+GaOavGFpHeYn+ijO/aNwHcTsjkfhdT
	 F9x29ZrdgRiLk3H+wCE6zfud/e3MiyZgbLkpTsjHi8YWTmTTr6se+p9PPbqFuqjF+a
	 CfQSSMLPZ7UcE3l68LnxlxsER5ujm1X/zYbCvaeRBDzkUgJGzV/5pcRj7aRKZBX4WK
	 2DqBps2D4jU8s4h4p5ynKpKo39ukQsGMN1HSt5Ll2Lc1mvVV0X3fguDjjpyTpjrL8s
	 McWuiwHaEM2b4i6TVr9yR0t+WjSk0A6W5r9y5aw/0ZmVLrM6zwk9LkBP6zDr+Kz4G8
	 tt7qEXalUplzg==
Date: Mon, 3 Feb 2025 11:01:28 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
Message-ID: <20250203-orthodox-watchful-poodle-4018f4@houat>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-29-9a2fecd886a6@kernel.org>
 <cfn3xpwyoo6lbugaxjwxvcq4l7eqbznlgnunxxfg4jnbrwtnpo@wdoizsk6ckvg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hb7p4hxkklv2bgl3"
Content-Disposition: inline
In-Reply-To: <cfn3xpwyoo6lbugaxjwxvcq4l7eqbznlgnunxxfg4jnbrwtnpo@wdoizsk6ckvg>


--hb7p4hxkklv2bgl3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
MIME-Version: 1.0

Hi Dmitry,

On Thu, Jan 16, 2025 at 03:08:00AM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 15, 2025 at 10:05:36PM +0100, Maxime Ripard wrote:
> > The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> > deprecated and shouldn't be used by atomic drivers.
> >=20
> > This was due to the fact that we did't have any other alternative to
> > retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> > in the bridge state, so we can move to atomic callbacks and drop that
> > deprecated pointer usage.
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 41 ++++++++++++++++++++-------=
--------
> >  1 file changed, 24 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index b3d617505dda7d22b38c000fb79de46376adf3f1..c17d9486cf5c36d61eb00af=
2bdf9ba1b6f890ffd 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -242,15 +242,16 @@ static void ti_sn65dsi86_write_u16(struct ti_sn65=
dsi86 *pdata,
> >  	u8 buf[2] =3D { val & 0xff, val >> 8 };
> > =20
> >  	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
> >  }
> > =20
> > -static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> > +static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata,
> > +				     struct drm_bridge_state *bridge_state)
> >  {
> >  	u32 bit_rate_khz, clk_freq_khz;
> >  	struct drm_display_mode *mode =3D
> > -		&pdata->bridge.encoder->crtc->state->adjusted_mode;
> > +		&bridge_state->crtc->state->adjusted_mode;
>=20
> At least we should document why is it safe to follow the crtc->state.

What do you have in mind there? crtc->state is a pointer that is widely
used, what is there to document?

Maxime

--hb7p4hxkklv2bgl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6CT+AAKCRAnX84Zoj2+
dtdLAYCdHjDt4GIpb9n69qtZ2rJopO8NmJl9wHbaVQ+n3z0enAPsXbbi+FdbPYBG
5WXU9s8BgLlhSxE2FiJeFCmxnPWMhMw2Z3tZ+D84/jOXbZaDOuekJubWJ06RCVkm
Gw5KIKrPww==
=nrxJ
-----END PGP SIGNATURE-----

--hb7p4hxkklv2bgl3--
