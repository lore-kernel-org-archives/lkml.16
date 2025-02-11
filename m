Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695CF257AC4;
	Tue, 11 Feb 2025 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291986; cv=none; b=JgaqaNQTFbGFEbYARJux37V2JX2JkIAlOTsePOOCqYWP4YwqQ7rmEZbrOTi1T5e0oWg/80EcowLyvhPlSCvenmwf3omlVWlSsUCeYKWvrXjav8rR4gZkXCBYeZgm+m4Sy1F7bY59kLjOOKxXJDQRCGaW86kkzaa+ucam2pKfAdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291986; c=relaxed/simple;
	bh=n1tpYT/FEf64u/FY9tw6DOskntyo3y2tuWRaFzOfXeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERawZ3Bl9OcD3aY/tgOiUQf9BcnycdTjpvEJVAV6qZS04P8CnYMpLwNao4yot/++lgsHFB3OMXZVObpzBQSSCyY/UW09qa9VE0KqjGJRXjABbXrTxm+AUHsS9FUDPqa5rU4irt5IaHctn1LgosD4XmOn3P8ULXYHPmBV0/pGy5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HRKoVjAo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HRKoVjAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53221C4CEDD;
	Tue, 11 Feb 2025 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291986;
	bh=n1tpYT/FEf64u/FY9tw6DOskntyo3y2tuWRaFzOfXeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRKoVjAoNV23MiZEh232xe9tnhznnaeFXbMrp4QefhLnMVVU9pCCI/PKRaWA+pDw6
	 oeXVK+i0FVh0BIKa3csOFNLoCRTEsq/8gR1Ikp7EfiM7XVkrUFoY1I6F69zFojJ75K
	 ioqz9u6EQw9LUZBM5My2PCz6+xG7I619YP7m4lOzVrroJEFhFnFGH5XMVmI97ekAtU
	 /7hNSOSUi+LNrbMDoyGsA505m7IxOIZlWXtdUhfOn43o9dZg/onQO4fusBQU+XsYdm
	 TH3JKhxWtJ7rAQL2BgiMjYMs0IyTpHUF1tOL470mQLwwfPzZ/5F3EIUbhI4uF7+OMb
	 /gzQhctary9NQ==
Date: Tue, 11 Feb 2025 16:39:41 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: Add Himax
 HX8279/HX8279-D
Message-ID: <20250211-manly-backlight-a3904a9e79a7@spud>
References: <20250211114429.1519148-1-angelogioacchino.delregno@collabora.com>
 <20250211114429.1519148-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K61yT/4xlRiEL2k9"
Content-Disposition: inline
In-Reply-To: <20250211114429.1519148-2-angelogioacchino.delregno@collabora.com>


--K61yT/4xlRiEL2k9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 12:44:28PM +0100, AngeloGioacchino Del Regno wrote:
> Himax HX8279 is a Display DriverIC suitable for driving LCD
> MIPI-DSI panels.
>=20
> Describe this DriverIC and the Startek KD070FHFID078 panel found
> on newer revisions of the MediaTek Genio 510/700/1200 Evaluation
> Kits (EVK).
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--K61yT/4xlRiEL2k9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6t9TQAKCRB4tDGHoIJi
0ud/AQCyEFDNhfi2DVH9b/xngpiFAhVpDl6JRDylVWH/AZlctAEAlkIBgrYHlqU2
+EYBA87Nu6Xj4HxqvNkVjhqzQZWqugw=
=aCqm
-----END PGP SIGNATURE-----

--K61yT/4xlRiEL2k9--
