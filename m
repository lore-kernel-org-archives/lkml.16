Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7C5283FC7;
	Tue,  6 May 2025 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548525; cv=none; b=tQ0E3Gnf71zqFvES+zPMG3R4tr8OQE5zHuqoK+RZJqZJJeK/YFVeYqJoRJJc7DKU1Pyw/4Pvt4Owy3LDe4bZKMHCef/QWi2+yjARHV32RdfDSoQ9m6OPGA/oeRS/9AZDChBn2bQbuRiY8g5k3H5NgAPYFoNlZj+e/h7d2N0G2FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548525; c=relaxed/simple;
	bh=a7CrHfM/6OUIx5WLKSIBCgdXg/9zZ/Qq+T8aEmLIPMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtrmXWQKUu6V55N6VAji6hCnze8cF9yhLL3oGEfRfmMdfQTcPjMFULtF4QgpFdbVfXFziBsRzfGy6RIPxBw6kegxYTtwj6p/R3U1yHPnjRTZJcgw+6mLtspAyPm2Y8bZYtYbeTBZC3hxeITAPYGw5VVciHmffiNlsvLkLcPuc/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZYRKCiR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZYRKCiR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C306C4CEE4;
	Tue,  6 May 2025 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548524;
	bh=a7CrHfM/6OUIx5WLKSIBCgdXg/9zZ/Qq+T8aEmLIPMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kZYRKCiRG0cNb0qTnUb0L7aSdnYxnSRoliCi2wVa2VKts9Rs/iOzAinmPnkNZRNsg
	 k9zwqWQkQ3kNUU6aF/Fa2/iW/mph+bDSIIRoqpgmmCZSWMnfF4C4SeN96+gVVPidad
	 ruHmYRfZ3WbRlgggodJwX3FZMBVh305QRVIIZ2jH57ptrwRNTklXSeZu03+Q24dE5W
	 uQSgD+TpZa0GLkJUxm6KcRLlrKnjoHA4ldza3O1RjorSsNk57+14B/DIP6MetF2zqG
	 cM+wJhYXLL/1ITq1D4Vap4SKKjR0ruNqMkYq9sB866F9VbVq7/HMZapZFQqj1FU0Sa
	 AnePo3W+bn4RA==
Date: Tue, 6 May 2025 17:22:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: rockchip,inno-usb2phy: add rk3036
 compatible
Message-ID: <20250506-ahead-angelfish-7dd7ad36f17a@spud>
References: <20250503201512.991277-1-heiko@sntech.de>
 <20250503201512.991277-2-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hWu723nQy6Wtc/+2"
Content-Disposition: inline
In-Reply-To: <20250503201512.991277-2-heiko@sntech.de>


--hWu723nQy6Wtc/+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 10:15:10PM +0200, Heiko Stuebner wrote:
> Add compatible for the USB2 phy in the Rockchip RK3036 SoC.
>=20
> Apart from some bits that got swapped around in the phy registers, the
> block is nearly the same as the one on the rk3128.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--hWu723nQy6Wtc/+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo3KAAKCRB4tDGHoIJi
0koTAQCvRx1zKgbUctLAI7tbaIgn0fC5wRNKHgdGi0S651g4PgD8DTVPMRGZrbsi
MP1Jqz9wxZbZ51bzr8wSTkDJUnsDTAo=
=V5Tq
-----END PGP SIGNATURE-----

--hWu723nQy6Wtc/+2--
