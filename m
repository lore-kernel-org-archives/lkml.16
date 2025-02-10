Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2C924BCFD;
	Mon, 10 Feb 2025 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201186; cv=none; b=GMDE4iDH/fiXCoSxUAWrLqmV6XhjmGjjDIGuWDtPBJvVW9kDngZ0CFjotiFm4y87lBKs1VPlZJOyASCXZ1OnOEju1hWWaYW20ZWk5g8wToe8GksRJxFi1EAw/Qtm5/A3kuGCjlbh/33w4LceyrTU9Q/vliTvPIMI1Y/hwwfBAgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201186; c=relaxed/simple;
	bh=rgjBGIwbwdCHfwK+dMv2p0xxA5lB/D3muieewI3L6bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJ3tt36oqySLzzbgKqXhIR2AGxhESA4BlL8MKSPF9Z+VxzrZ4B9WzPzC8Oik2MqN0YhGAKM85L9Z/jAOzagYgdSSDrR3Hk6aKXjtH7Eap7xpdcM6enQwEE64H/20lX78AMkdIFPel3pscZiGsMNR5M2kUvv4bsoxiCLS7AcW2WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTkcfh6Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTkcfh6Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8C4C4CEDF;
	Mon, 10 Feb 2025 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739201185;
	bh=rgjBGIwbwdCHfwK+dMv2p0xxA5lB/D3muieewI3L6bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTkcfh6QAswEIujmFctjgh7vjIeBc9JdiGQ/qG6025Con878swP2TOG1Zs7rKKxA1
	 SYL1MaqA3nvASUzZXodO2+f0skIvzWXZgpXZmRjbeLJoO/OpgR5clRS0R9COvUpKWP
	 /9bP2msKE4WiJlCal9XRW55DT/blGbp+m3X6HM9RRog+dGeGAgvI+RGkarj/ntpyG0
	 RMhb5KiMby/NzPgLBLUZ1+GO2ZG9eHv3XYx5zVtEqfVrtbN52S8LaKzkIl+A3aM7rA
	 aFRyAw3uQi0saSKQ34z5evcQ0//zpgx6uGx/yP18iHM69neQXRR2uBzARE3toxORgr
	 OGM+3bjybMTvg==
Date: Mon, 10 Feb 2025 15:26:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] hwmon: (gpio-fan) Add regulator support
Message-ID: <0c82f6dc-4f5b-4787-9e43-4990681ea6a2@sirena.org.uk>
References: <20250210145934.761280-1-alexander.stein@ew.tq-group.com>
 <20250210145934.761280-6-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vR4IdK7od5hKEhVI"
Content-Disposition: inline
In-Reply-To: <20250210145934.761280-6-alexander.stein@ew.tq-group.com>
X-Cookie: A beer delayed is a beer denied.


--vR4IdK7od5hKEhVI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2025 at 03:59:33PM +0100, Alexander Stein wrote:

> +	fan_data->supply = devm_regulator_get_optional(dev, "fan");
> +	if (IS_ERR(fan_data->supply)) {
> +		err = PTR_ERR(fan_data->supply);

Unless fans are expected to operate without power (which does seem
unlikely) the supply should really be mandatory.

--vR4IdK7od5hKEhVI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeqGpwACgkQJNaLcl1U
h9BaCgf+LxGkVSPEwiLl6y11Qu6r2QZL+Ac8X/1BzsVRoXUMBtyBaApXVkg+HtKf
EtmBA27aahQDADQGgUYovwgm7ITuI9LjL9irTfj1bKKoBDvo0oka/6uFxxmJhmDS
VIDzf6ZQBqrdkNIKVS1bywuZ++Dj/uf7KCERdf2lKTWAr00WwSxhj0dhtfn/rN/l
V74c7X5Eak2LrT00rlJX/Dn4japgc/wjtFAcAC8uE/+RKb3+63irXmZOzvPWtMD0
bipk7ifhXyAqsMjEec040TiOnml5YOcaIlrh9p5mrt9PzBxPZAC1D9MAuMtOmeQa
/ubKVeVzx4OD99OIvhJ10Mc1Ndctaw==
=x7MM
-----END PGP SIGNATURE-----

--vR4IdK7od5hKEhVI--
