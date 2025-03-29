Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDFD2D78A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 07:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743234467; cv=none; b=IqysLQizz0rA5PCoZR3Y7SXx7+2o3C2e7jlWnHMrqyKAv2+fU7jBgTypXeiT825J+IiHLJUWB5EVwfU/4m0s+phhaGxOmz+eH5/IcZjEKh00rJJEkLVjkWLMWmIUopxp2OBq723pzo+pX1f+xIdq/FOqq4ACziUiIa7OTOj7y8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743234467; c=relaxed/simple;
	bh=C20d2b1ecWHafw0RsWP9pzHTkp/strdWqSaK2TJDC5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hv9D2nnpvNLsO5oVYyCds3bWasFwOHLjhNS3+bt3NjhCsg4XzXtOiwEA4GP7CU6CMZ585elSc4gT1UG6Ylb8ot1+iatIa1jFak97Ww1E/Jw9q0GLAuX8JgjriibhvCs4Vju0OTnbbKzffNlZaktjTTod8lXrUcxWPXBUqr8/THQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jGerbvBw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jGerbvBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=C20d
	2b1ecWHafw0RsWP9pzHTkp/strdWqSaK2TJDC5k=; b=jGerbvBw/UNqEpxqkoLM
	JElNJ6gGmF9qBAK+u3uCG6o2VRhfEq9WKnRryoBU6aNEWYcnIvfGP2S8DdtHBPuU
	HhtXN3dWLsoR1/6UJM+CXFSGCWjJhlXYR6IOoC7XGOvrXtaJwRhmhHtIxy8s9o6n
	1jWRIfd2U9Odk4gT9HMnuManYumf6NaT7KrrxIePHmLPTJQATE8M1E3h9EYJqxkr
	st8NHPo6BfRCcF+tsmVdTEQXpmSVIV5lraGOoJ0zC703zrtKh2xGQGfQc98pJtnv
	LIsr6kFK/rxy0Q0JQJMzgzX4rppRsZeZznUiFB93+dcfzJ3ONG+psvTxNDVHilUK
	dQ==
Received: (qmail 508034 invoked from network); 29 Mar 2025 08:47:42 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Mar 2025 08:47:42 +0100
X-UD-Smtp-Session: l3s3148p1@S/3iZnYx8w1tKjJV
Date: Sat, 29 Mar 2025 08:47:42 +0100
From: Wolfram Sang <wsa-dev@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to
 `rdev_get_drvdata'
Message-ID: <Z-elnqikbmhzTbGn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa-dev@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Mark Brown <broonie@kernel.org>, kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
References: <202503290554.zASQT70Q-lkp@intel.com>
 <TY3PR01MB11346FEE53574DBF768BA9B8686A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z-eeiMFsQQNMt2nn@shikoro>
 <TY3PR01MB11346D7FE2EC7FA3631C48A0C86A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z-ehAHFRK_WaGVJp@shikoro>
 <TY3PR01MB11346540D1D1A2FD128A5EBDF86A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bLjOGq/+oqxCwi/V"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346540D1D1A2FD128A5EBDF86A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--bLjOGq/+oqxCwi/V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Not sure about Regulator should do same for sytems that have Regulator undefined?

I am aware that regulators could do this, dunno why they don't. Maybe
noone did it so far, or they have other reasons. Beyond my bandwidth,
though, so I am okay with your approach + "if ARCH_RENESAS".


--bLjOGq/+oqxCwi/V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfnpZoACgkQFA3kzBSg
KbZ9tw//XC99uM89dwHbqln1OcMY+RdcS1HwWvrNvHXHJnaJnVt9H6LaOUJuEoD0
xHbhWGoftAfZ8rcCD3S5KK/CE0jpgXQQUxoL6x+xfwJjTc6Aw3wyDLtCu5q138L5
WPb4t6UqsccGB+PAycKVfeDs6wLMNtLleOUaW/hZ46iK8hD63QdI0QN/xfenCSdQ
z7EXG4euhvYlEELYLDKF8OXrN5AVb2VuUmsV0tSN/spk2US0Zntjkal2hot0uNMD
fwgww7ubLXF5KzHIO3GtAGIEsuqQdaf6wjduP1tpJkjTwZDsEOWcbqmt3uNP116s
SjHm/G5/yFE4NfUv95tENNcWWriOuHWcStvoq2kcNoPDq/xaaWFHHxeIO9gLDpOK
Zya6MuYkKdcBkrkTaIhYM80NrgaPITkHx3DBp1KE7P+Y/i4hW3Y1cwVtBBZTPw7U
55zs0Ewg6DpHqm3B85VFqqwFNhmfpTd+88eyU7uQqWHeLQIAf8+gA7pjzMsV1CNq
PnehXcPexMfTEv1Q8pf+cgLdnRrziM7MSMNGshZZQSXbBrZ7a3o0zD9WwWTb4ZmE
VSQwuts7Fl5rqET9je7n749ee83MfSZEfg9wG6wQnP6n1QUOOd8T6JAl39xoa9sP
3vbDCoqYEsjD2nynE9fBqtPtp4tkyMtQd/oiWYcw0Zgun2dbJ1w=
=2Pbx
-----END PGP SIGNATURE-----

--bLjOGq/+oqxCwi/V--
