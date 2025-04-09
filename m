Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D30D265CDA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212301; cv=none; b=YvXqiFED8zvXIwpjhXNOIjjgMozo/l6cEQbnE+9QKR3VElX5T/QJviu6dg0L/pxLdFxQsRW7EpvTEfatbndnYEakem6UuOR8Vsfj48QUN3NLepztQXvAw0cVrFzVh6X0KTYmAuj9R+T1l0LWoMbiQ5HPKkDfyDuT31ktLcaARqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212301; c=relaxed/simple;
	bh=f/FO5GTKMU9ObZYbBYCNeNcnVE8l9ubyQfnRoLVD0eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugKgfllkLGWb7WefeXWsYpYLadqeWAHYFSaM3zlClfXhYXMUqXw/kJWRuKAMGCWKwEFsWS9LEvdh2GbuWxs4GbRRadbGTxCNW5wZHf+qMW7rWGkQyA52mITR39+VP10NG/mmTltro7gIny4QdcPIZCQVhZByPYCsxAt6Ove/L3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVipaGgY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVipaGgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06874C4CEE2;
	Wed,  9 Apr 2025 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744212301;
	bh=f/FO5GTKMU9ObZYbBYCNeNcnVE8l9ubyQfnRoLVD0eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVipaGgYSuP3YLyMIS1uw8IOrgvs4BJzGrD0hGMndXXMk8C0I/EsKhLo843Q4AmEk
	 MpZceQ8tMOZVbOOxUtDqsO0xhnrkug7ffUkh+iaXVKBqu8JI7dkFKQ7kK0U6cyNGi3
	 HFephaMOofyA8oSvl6U2LQvtkGh5eqAeop/lOGC8exmQO2JG5JDuLtGmBEwwl8wowk
	 WfSHxkFRTpKU03NdfcN3/ctv+F6KGUPPkhwr+FZ8uynC9vyYTb9sGDyek8DHJp3M4F
	 mMLd84CIoj/PPjaa0MPHNYsL1voUQi/oLBkTJwtb+bP3WLZBM9x98Vx+ecCjeT1CMN
	 gPAdL3PAkofcw==
Date: Wed, 9 Apr 2025 17:24:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/15] drm/tests: hdmi: Drop unused
 drm_kunit_helper_connector_hdmi_init_funcs()
Message-ID: <20250409-refreshing-overjoyed-frigatebird-d3ee47@houat>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-11-294d3ebbb4b2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5hwuap5phutbkzyf"
Content-Disposition: inline
In-Reply-To: <20250326-hdmi-conn-yuv-v3-11-294d3ebbb4b2@collabora.com>


--5hwuap5phutbkzyf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 11/15] drm/tests: hdmi: Drop unused
 drm_kunit_helper_connector_hdmi_init_funcs()
MIME-Version: 1.0

On Wed, Mar 26, 2025 at 12:20:00PM +0200, Cristian Ciocaltea wrote:
> After updating the code to make use of the new EDID setup helpers,
> drm_kunit_helper_connector_hdmi_init_funcs() became unused, hence drop
> it.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 7b2aaee5009ce58e6edf2649e2182c43ba834523..1e32694041277a541f0f8941d=
9c35e8ca9264599 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -207,9 +207,6 @@ connector_hdmi_init_with_edid_funcs(struct kunit *tes=
t,
>  	return priv;
>  }
> =20
> -#define drm_kunit_helper_connector_hdmi_init_funcs(test, formats, max_bp=
c, funcs)		\
> -	connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, NULL=
, 0)
> -

Oh, so there's still one we don't need.

I really don't like that back and forth. I think we can avoid it by doing s=
omething like:

- Create a common __connector_hdmi_init function out of drm_kunit_helper_co=
nnector_hdmi_init.

- Add an EDID parameter to that common function. The API of drm_kunit_helpe=
r_connector_hdmi_init and
  drm_kunit_helper_connector_hdmi_init_funcs doesn't need to change at that=
 point.

- Create a _with_edid_funcs macro. Note that only that one needs to be a ma=
cro.

- Convert the users to _with_edid_funcs, and drop drm_kunit_helper_connecto=
r_hdmi_init_funcs.

Maxime

--5hwuap5phutbkzyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/aRSgAKCRDj7w1vZxhR
xZCTAP0QLHIE3823ulZrDW349IaFaVrYXqOkwW/ts+jszLhuBAEAq0TJoEtq0/va
rNDfSOaaVYviZr9aJwERGRHhKHliPgc=
=kjv7
-----END PGP SIGNATURE-----

--5hwuap5phutbkzyf--
