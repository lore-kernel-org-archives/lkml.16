Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F74627A925
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357875; cv=none; b=grZpbDSd9lyo7wMefA4hBRB5uccRMHpZh1VEdET9He4I5DGuVRNRy7Ufx2ctlBMiaCYicoL/7M0acmDTyPKMj3VFlGppelgaexpO8hjA55e8yttOYKGIpLh7Hdn/TNUMuI2ncPXlqQdgitvwbHy5KSysmtRMJhI/FWa+D0lFCw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357875; c=relaxed/simple;
	bh=6c8NYwxQYQ3V862xbvTlYlSVIDJLz9fGUYXs65CCQPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFZgTmqXizcIUKZxCu6HlPH0TFNkpPaA6ttGtQXT+Nwdqm2ZWqpQckZOBVXQxnT21zDtL44GIQTIv9Yt4rtE4a1hEl4WPtqv7D1qijbwUYRQI7zMu6iny2h+cRll9geNfaQxUjOC9eb2/BBmSTpc40Ce4wNB9nxLOLvlCFiUwUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZ/N/AV1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZ/N/AV1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF27C4CEED;
	Tue, 27 May 2025 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748357873;
	bh=6c8NYwxQYQ3V862xbvTlYlSVIDJLz9fGUYXs65CCQPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZ/N/AV1VxebNxlwGSCrP2AhiFSN4bdwpZoS6C+ydOav4vmyu8C7xhTAldizOUcQR
	 eajI7VJ5TBAuBATJaFgUtBv4DffQAcN6uMcDXkgi5HdpWOmqiKO9CYeMw0vJD/Pi+O
	 dQMFss4g8Wu7S9YLoFY+mpBk36XZpGKGw05lLtpoDOiJnFfF/Dy6E+LR+CANtTKvYd
	 5G81TRsGJM9zLdbAjf5AoehXvUSywkaQJYLc3tFGJivIn+E50zGicitDpQ2LkQTQJE
	 DpU5oHvDAeJacQpI9vv6Z+inpNQBXzrc0C3T9NUt1raZfMSGBzrovtkAra9KZVlW56
	 x9p6Wmq1zamfA==
Date: Tue, 27 May 2025 16:57:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
Message-ID: <20250527-winged-prawn-of-virtuosity-d11a47@houat>
References: <87o6wfwcef.fsf@intel.com>
 <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com>
 <20250519-singing-silent-stingray-fe5c9b@houat>
 <87sekztwyc.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vrxhigte2cmrplrl"
Content-Disposition: inline
In-Reply-To: <87sekztwyc.fsf@intel.com>


--vrxhigte2cmrplrl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
MIME-Version: 1.0

On Tue, May 20, 2025 at 01:09:47PM +0300, Jani Nikula wrote:
>=20
> Maxime -
>=20
> I'm cutting a lot of context here. Not because I don't think it deserves
> an answer, but because I seem to be failing at communication.
>=20
> On Mon, 19 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > You still haven't explained why it would take anything more than
> > registering a dumb device at probe time though.
>=20
> With that, do you mean a dumb struct device, or any struct device with a
> suitable lifetime, that we'd pass to devm_drm_panel_alloc()?
>=20
> Is using devm_drm_panel_alloc() like that instead of our own allocation
> with drm_panel_init() the main point of contention for you? If yes, we
> can do that.

Yeah, I was thinking of something along the lines of:

const struct drm_panel_funcs dummy_funcs =3D {};

struct drm_panel *register_panel() {
    struct faux_device *faux;
    struct drm_panel *panel;
    int ret;

    faux =3D faux_device_create(...);
    if IS_ERR(faux)
       return ERR_CAST(faux);

    return __devm_drm_panel_alloc(&faux->dev, sizeof(*panel), 0, &dummy_fun=
cs, $CONNECTOR_TYPE);
}

And you have a panel, under your control, with exactly the same
setup than anyone else.

Maxime

--vrxhigte2cmrplrl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDXS6wAKCRAnX84Zoj2+
dkDUAYC5iZn1TuEBLw27T/PkCrKe8tbxEuy7qgQ0R0AkVjHAaVk5ip9n6kkwLRmX
TkcmqWwBfRH9yn4WuyWOb4dNBTub0wm0ycegfvKL655zm3YXGO7USOj4aGjG/Ou9
AEXevAVGuw==
=lUVs
-----END PGP SIGNATURE-----

--vrxhigte2cmrplrl--
