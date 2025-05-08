Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB5827B4E8;
	Thu,  8 May 2025 15:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717179; cv=none; b=XqxULrZNjMCq1Y11tRn7tMy2Zkw0WNpR+NkCd1xxhhh0YXmkArkTS0UPMNBIAoE1pDUT/iow/HCJf4ZCdHr0zOJbjxcKJsLoBLfK9hPchYdOk7/UWUhLoCKIXw+61GL61urvrqOuzneovT98Iv566PXf9TX/kCXzkr1UEzbRr5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717179; c=relaxed/simple;
	bh=1FBdXjj5dIlpEEGLNFH2EjYrwNsi54oDoLefxoQmJgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgGfh98vz+9cGskmEcbcTr/5G4ks4EJCA2rYAf94bgbAmnuSspu7WRjF/n1yRNQKM4nO3+8js3ZDK+xOtEEENI4IyByvQ9H9noxMNYcXEvJvt8ME8/IXfLPuW5od61CmwC3ljUVj9mpYfYTa7PY5MQIQ/Rz/n1YzHQJLbeF1K3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkxmdBWM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkxmdBWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A71C4CEF3;
	Thu,  8 May 2025 15:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746717179;
	bh=1FBdXjj5dIlpEEGLNFH2EjYrwNsi54oDoLefxoQmJgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkxmdBWMf1dNCvZhDdwpXZT6BEPL2dtWpd0Y2VGOpqdR8J6iY4lpdpX8ZxX/2evGo
	 qAMCMIRxQDytEjFuq8KwR3ws8lJ/GkJddG48oZXI4sWmXEmDNg22/PUgrd/JsnuEOl
	 D72OKPTC3ND59y2RCUsUXl/OGxL/QxPSeE5Qq0gojf2o3SqcHVr+AJSR28w2WChN9T
	 Hq/nUGAN/fc0WEyb+VmzeOruM4TjkAZTVAo+ITGCG6jU3GfNg44vMU7bK2oj1VpklD
	 1UUmOswz3OOdqQsPbqLVlxh97gy0RwBuWfSloJ7TLE4VoqUFi2fMsiQZ/VmKcsP6gf
	 A0VUbTkuyvPdA==
Date: Thu, 8 May 2025 16:12:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 3/6] dt-bindings: arm: rockchip: add PX30-Cobra boards
 from Theobroma Systems
Message-ID: <20250508-frosty-facility-39eee13870dc@spud>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <20250508150955.1897702-4-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JJRiOfQ3YU0HTA4I"
Content-Disposition: inline
In-Reply-To: <20250508150955.1897702-4-heiko@sntech.de>


--JJRiOfQ3YU0HTA4I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 05:09:52PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> Cobra are Touchscreen devices built around the PX30 SoC using
> a variety of display options.
>=20
> The devices feature an EMMC, network port, usb host + OTG ports and
> a 720x1280 display with a touchscreen.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--JJRiOfQ3YU0HTA4I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzJ9gAKCRB4tDGHoIJi
0tvOAQDrujT+TKQ25zyokjWVf7DY5LtWTPxftRqTZZquT2qJrQD+OWT/TfjIhS+g
+XjoU9DnuB4tieyeaM2WLPqDSdkHZwg=
=F1A9
-----END PGP SIGNATURE-----

--JJRiOfQ3YU0HTA4I--
