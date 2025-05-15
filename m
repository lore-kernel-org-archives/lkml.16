Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A1714B092;
	Thu, 15 May 2025 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747325978; cv=none; b=NmSOCAJKIBo6ZsSKT5o+Yob7Kqm2/4GXq0F3cGm9cruSMxoaRp8NVRGDMltUWIndf4ZkD09BReGVcKDYydwPdOR/tsmVK0HIa4OHzJ8Cg9cuc6t6ukwJ5JEHqdP+SZDZ4y7eE0eqOLpHlPJXh9kwku52KtCw0ssy53SUGPFF4bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747325978; c=relaxed/simple;
	bh=ez8MDEMttK1bKnzmq0rF96I9JAzIFJFaCU/dUgP+Cck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4tnFieuPFLQXOrFtfpr2TeJYv03cHdc01MeaeWVHEK/IUVX0Gdwp5dyhl0W+tqk9bqpQPp5F9NV3WeaSfW98MSRnJ/Yid8wd5Zf+X6aKuXSZzsYksMtAGT8iQWHIWsClnv5JXHAvjqil4JjqrqahA1Dy4eBtUtak7Ux/uft8zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeBzh+lr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeBzh+lr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD526C4CEE7;
	Thu, 15 May 2025 16:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747325977;
	bh=ez8MDEMttK1bKnzmq0rF96I9JAzIFJFaCU/dUgP+Cck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VeBzh+lrBIbeKThUB5IeGMJGIKY0nhucsk/YQ07ctm2jRgYEcuyBZTXDrD9Hb9PXt
	 6OZLEmJMSS83/BxSYC6+57P63d9cDoz1lqF55xPe4ZC/VxQWOVV6IEyJn4Uwm6rkMN
	 DhRFAnrZG8qlUmfaUTalicqu6Ur9Y8bsndzsaeMFY3f2drvfE70uZMBMSsjy/p69Vu
	 Aw1JhuWPKVEDW7EbVrJhEYAOBu66+BNkwoivyKEjlPc5eKvJS2bfFjaQ9mh2cOjjeR
	 Nx+ZlZPJq0OByDYPCKLmenk5E1YwvyWSljufgys4910IBTK/6WD4sp6PBzAykQGV0/
	 7FDLMnMOLLdJA==
Date: Thu, 15 May 2025 17:19:33 +0100
From: Conor Dooley <conor@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, nuno.sa@analog.com,
	andy@kernel.org, ~lkcamp/patches@lists.sr.ht,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings:iio:gyroscope:invensense,itg3200: add binding
Message-ID: <20250515-tingling-perkiness-4d686d8da695@spud>
References: <20250515002817.81863-1-rodrigo.gobbi.7@gmail.com>
 <81b2a499-1927-4fb3-b581-a533c64507a6@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1/nZIj7icH+isTOz"
Content-Disposition: inline
In-Reply-To: <81b2a499-1927-4fb3-b581-a533c64507a6@baylibre.com>


--1/nZIj7icH+isTOz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 09:04:57AM -0500, David Lechner wrote:
>=20
>            gyro@68
>=20
> Generic names are preferred.

Which probably just means "gyroscope" in this case.


--1/nZIj7icH+isTOz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCYUFQAKCRB4tDGHoIJi
0jdMAQCYvamjDz2ct+JZw1O5+MAQWSTiivkZhfMgOiC/RDchVgEAj6J4GewJM5VW
3hLnB84CEk8KmiNkQvhMh+Ok7i3xBwI=
=KCPy
-----END PGP SIGNATURE-----

--1/nZIj7icH+isTOz--
