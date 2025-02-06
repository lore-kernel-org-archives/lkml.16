Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8955919ABAB;
	Thu,  6 Feb 2025 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865651; cv=none; b=gt6CZIKgtgy727PlXO11B5gn6C1pnbaPKbM7fjwlJW2blSBYiUM+Cc3LRsu+l6xHdFxJfIOHaX/VwCZsnE13q5RPU5KdHq+OYQnIo7JmdVXtHYhW3h4BQNFTBp7/2XgPYFUww13vgmAuzK4S+CNXERZ4zGZ3Xi8d/lzbJD9kvHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865651; c=relaxed/simple;
	bh=dy+DMOoMSDp0jcd2rmqCEWg/B4n87lTgMHpZiZiqrEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiGxWjcAvHIHUKVVrrj6XY2YFpt3/Qd6YErMsJTrYYMlauyTiQgI+rcufrWI/eFZug6fepV3lZ3gDcGJ9Mq9WgFy5m42ZHLI6d7TzXnpfbFQ1QdETMWPMTzfisbkVmFV5tQXshzd+gDHkUdB5cJw24RcVMB7Qkr+8ge9nwmeqLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fzf4Oc6E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fzf4Oc6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B317C4CEDD;
	Thu,  6 Feb 2025 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738865650;
	bh=dy+DMOoMSDp0jcd2rmqCEWg/B4n87lTgMHpZiZiqrEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fzf4Oc6E5RNr689O2kugtZAGZ6ttSzviLz94XRVlA8tVfLOojh8PCAZil0o57K0U+
	 wI46mvw3mDuOA6QABSys86j56ntUfeJo2WWZ/LU5Z/hE+5aM7S8VNWbfDcsv2E9V4T
	 52JuW2v2xlIXSDdQ8BH2LlXzRAruzJOfVVoidv5sAoE7sLDBWKqy33k46C65aA+Mws
	 7FlDXzlaTiyrJX2rwtySpfvHzz54SIhcNVIrGa0zd4U6vx1ZnXRVEm9DkTbvEEk2tO
	 S9rSfT5djBrxAzc6id2kUt8lZXDMp9EQXyPKIICfUEjogi0CooJNrnoyUsqY5D0PrA
	 FraEjYVOpLaHQ==
Date: Thu, 6 Feb 2025 18:14:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add compatible for
 CSOT PNA957QT1-1
Message-ID: <20250206-uselessly-riverbank-14c097e62ae2@spud>
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wll5mPIV/lTSeNrB"
Content-Disposition: inline
In-Reply-To: <20250206131300.1295111-3-yelangyan@huaqin.corp-partner.google.com>


--wll5mPIV/lTSeNrB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 09:12:59PM +0800, Langyan Ye wrote:
> Add a new compatible for the panel CSOT PNA957QT1-1. This panel uses
> HX83102 IC, so add the compatible to the hx83102 binding files.
>=20
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--wll5mPIV/lTSeNrB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6T77QAKCRB4tDGHoIJi
0mbmAP94P8Cn/5ZgmegabpD8SSqFNPWR6gjGdIJczaNNPxnN6QD+OIIWROfuaczB
9MQ4ipOv15tNQ08WfOiR2XqD0jORpQ0=
=tuM0
-----END PGP SIGNATURE-----

--wll5mPIV/lTSeNrB--
