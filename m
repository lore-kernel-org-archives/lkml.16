Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25EF4120B;
	Fri, 23 May 2025 16:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748018256; cv=none; b=EVFTPaedWuhhvSrhD40s0PvtyadCN2T7dn38qVwP8ILpxfgNUplQgD4DfFu8RyFiy/kn14mV4VVE+ApvQjHTfjgtkW07jMtB+hwk3fXE2QkUTysErigI+U9hK3S4Nnss0p7bDqG4QxUTJqve0bJxlCxj0CF1K2VmSzujgMFUNKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748018256; c=relaxed/simple;
	bh=m5gwN4NjdOfkUkmLGul4JQ7Ns2AXDme3VMTGdkNGO/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTpZAy6FgmA50jZX8S2NIcdgjctcU9b8bHQtIm2DJkGnzn9IH8K8LyZ0bjZT70ZCwO6yj0CoeWnmmHHBuT+fcESIwbbOsmvzN38tXmO1Q5jyzIRlxnETMbqBRecpePBKaCBVn+Y98PKTTrrLXuo6YNJS0W302r4K7lqFQDRaekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjCR/1Sa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjCR/1Sa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4274DC4CEE9;
	Fri, 23 May 2025 16:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748018256;
	bh=m5gwN4NjdOfkUkmLGul4JQ7Ns2AXDme3VMTGdkNGO/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NjCR/1SahfzIbyb5y0+WTlPnVoV0T9SNuWpLo+byH/LIe0AipjfzoOsYsYJQPt7Ac
	 hpN/n8fu97s7McFZ0WrKZuh+ALY4/0d1EB+p/8kW6Ru22FrgobSjZ3Jy1SpmPH6Hhd
	 Y4niM+QxxNCTtkumoGq1xFPNgFUZb4niPmay24+dLJE28Kr+5lvI5EZw/K+JYOiG8F
	 YApJB19VCDOJg+adEBAdjBowFygjulwzOWr/tO6LwnKCzIDuEyNBXK2xf52uYZXTQ5
	 95LlNh2f9DqwuePAonQvXLJ/bJHPmUPWY1RdPfs+nlSDNkS8xAR9IgB71u7d2aGBmA
	 ghNM3ctttk4aQ==
Date: Fri, 23 May 2025 17:37:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Noah Wang <noahwang.wang@outlook.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: trivial-devices: Add compatible string
 adi,adt7411
Message-ID: <20250523-enactment-basics-ceb5ae318611@spud>
References: <20250523151338.541529-1-Frank.Li@nxp.com>
 <20250523-fridge-scarecrow-982578c16bf0@spud>
 <e11aade8-f646-4d94-942c-6186f06fe783@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b6+YlcjOA3JGlAsN"
Content-Disposition: inline
In-Reply-To: <e11aade8-f646-4d94-942c-6186f06fe783@roeck-us.net>


--b6+YlcjOA3JGlAsN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 09:02:12AM -0700, Guenter Roeck wrote:
> On 5/23/25 08:30, Conor Dooley wrote:
> > On Fri, May 23, 2025 at 11:13:37AM -0400, Frank Li wrote:
> > > Add compatible string adi,adt7411, which is temperature sensor and
> > > 8-Channel ADC.
> >=20
> > Usually for iio devices supplies are meant to be documented, and this
> > device has one.
> >=20
>=20
> FWIW, the driver supporting this chip is some 15 years old. I don't think
> anyone was talking about supplies at that time.

That extra context is helpful.

> Also, this is currently implemented as hwmon driver. Is there an effort
> to move the driver out of hwmon and into iio ? Fine with me if this is
> where things are going (one less driver to maintain), but I would caution
> that this will result in an ABI break for users of the hwmon driver.

What subsystem doesn't really matter, particularly the difference
between what is a hwmon or not seems to be up to the whims of the first
submitter for some devices. I don't know anything about moving drivers
or w/e, I am literally just reviewing this one patch that landed in my
inbox that had a supply missing.

If this is some 15 year old device, then I can live without the supply
I suppose.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Really trivial-devices should have an optional supply in it, if someone
comes along with a generic name for that supply..

--b6+YlcjOA3JGlAsN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDCkSgAKCRB4tDGHoIJi
0hAIAQCY7UdN5zM+5S7oFgE5QxFmBFbfQlc4LZeoZ6XyXaMIfwEA7ZYDor3Q/sjX
dITUvgxMifquqX5H5dV1Yg7dcLM1nAM=
=BWpj
-----END PGP SIGNATURE-----

--b6+YlcjOA3JGlAsN--
