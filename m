Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF46280008;
	Tue,  6 May 2025 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547866; cv=none; b=dbMC1L0a/YVtay0ME9sxo24/iGUBr4Sw9LWOOlIIhvekhFiDE4Ov3Q4FbCe+QNU3hGN6rfUpRJtls5nAG71GJT9jYu1cahm5lgerJYV+nji06WCV6FqN4XHJa+Jacyk6kAHB1qrSA7q3Ol/9u7QMXOcwTy1WyRyoTYy3L8Gq+JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547866; c=relaxed/simple;
	bh=N9LxGo67U8S/ha5ag2nBlir7WXYDRaO7ZbHT7Qw/tk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZXQGwZpRygUycEVF1b3qan9fxImG+LV4h4yQfFDmdWMqqTV27gNb8Q9W8OnZjqauzkfDf/x4tjuLKQlaHx+ttIEZGVC/1uJMJeAUR483+RUILXQoAH78fwAayPjSyXIMYNeDU5QLvEC640ZSq6xlA4qEg1v53JumP3m50sff1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ksqh5E+v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ksqh5E+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0E1C4CEE4;
	Tue,  6 May 2025 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746547865;
	bh=N9LxGo67U8S/ha5ag2nBlir7WXYDRaO7ZbHT7Qw/tk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ksqh5E+vlPYV4Iefz4/uKLdivGgzx6ExSKwh4KnzUhd2QpmWPL1xMAN9BU+CznI/1
	 ENQt+MbYua1NEXpqSk5g9sgPL8YubC20vFiBf/m3wda6lqyMiLwN+KidRsxAbDhjcf
	 HJRxG52QzQHz44SKKcPfCVXwqT765sGfzYNF75swt1hk77bezqR54D1GXooVjzd6db
	 r12sqN2hbJFI+k7Srale50su+oHbXDDjiuPqYHCvFdiC7+SRYDNiinxqO/XjMVvhal
	 J56g/g2QGmMlK+7vkyyY7jGxTkrZuMxUHNlNXG7jc1UJ+PEAk5WJcuzIfvu0GOnU3X
	 bWm9/5hiBrVNA==
Date: Tue, 6 May 2025 17:11:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Wenliang Yan <wenliang202407@163.com>
Cc: linux@roeck-us.net, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	christophe.jaillet@wanadoo.fr, derek.lin@silergycorp.com,
	miguel.lee@silergycorp.com, chris.ho@silergycorp.com,
	eason.liao@silergycorp.com
Subject: Re: [PATCH v7 4/4] dt-bindings:Add SQ52206 to ina2xx devicetree
 bindings
Message-ID: <20250506-reload-thimble-a0d7b6fd9696@spud>
References: <20250506053741.4837-1-wenliang202407@163.com>
 <20250506053741.4837-5-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1HZzb8hbYXZ4WHE/"
Content-Disposition: inline
In-Reply-To: <20250506053741.4837-5-wenliang202407@163.com>


--1HZzb8hbYXZ4WHE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 01:37:41AM -0400, Wenliang Yan wrote:
> Add the sq52206 compatible to the ina2xx.yaml
>=20
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--1HZzb8hbYXZ4WHE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo0lAAKCRB4tDGHoIJi
0jefAP4kFMBOHhuT97nr68L74nAxW8w17ny8cyn2d3cflFXrhQEAy96BlvBN0x82
B4p9e1Uvv+pMf9hV8vf8iR4HcRYZ2gw=
=WI4v
-----END PGP SIGNATURE-----

--1HZzb8hbYXZ4WHE/--
