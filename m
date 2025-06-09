Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36081D7999;
	Mon,  9 Jun 2025 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485002; cv=none; b=nFC9oxR/C8NUgbesM6uk+RT/uRpJ0bCI43pkGKg/kZsHAiSThpUkLfVO2QxT22M3hHrsnDvY+Bt+RFgdDv+ZYRYrqCiETvLwDNXDtHeMVq5nlwNOjmRjZ0qo4eJaW5iG9gSZw/6Ze0AtLlG6f4U+Txe9MapV3UjBJMuT67dqJjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485002; c=relaxed/simple;
	bh=Kp/NTlrvXjRtay9xcRY38fHO9S3vFj89fcXu1mx8a3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpF0Turgop4kAyneyZcc0VgwGyHdjJYOjghfX6K3aay+6kloY3j8hsBxOVJ4gXxMVp8Ay38hRmrFtwOM1aa06ISJaOz+vuAo5JeSxdWDZ1Om2sJffUQiRJQg7ILCWwPVLQOB/ZkjTtAvIaf55eQY/L2cUMFXjhwkRO94ryvtq80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O53xgeT0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O53xgeT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C84C4CEEB;
	Mon,  9 Jun 2025 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485002;
	bh=Kp/NTlrvXjRtay9xcRY38fHO9S3vFj89fcXu1mx8a3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O53xgeT0xMQ7WkdILi0titHR+l9WlKCyu+lfdTwnd93b06Q9r5YOOBxFWlPjZZDsM
	 D2gpLyq7GReO7h/mm/rnu9TuEvAEyClyaap0phr6bkEX5Pm3dQ3Bv+OX2jSyB7Caps
	 0Q/Bzoaa3vrlgR3XE6TKwTQrKBTtnD4scSznZGPhXb3tEkRlonx1w3hZtAwBgSnaso
	 nOmrSnD+tPm4U0gnW4tJxWc40uiervok9vFwrNUF12dth7v5oM6A0tVuobzJIG0Mc6
	 zBzMl37Xz3shkf4n1pz1E5QwZk4hze+/NHKU7wJxKH1B+6Pm6TAF3UKuNL6itIpkvO
	 /TAE692nMYoIw==
Date: Mon, 9 Jun 2025 17:03:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsun Lai <i@chainsx.cn>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	heiko@sntech.de, andrew@lunn.ch, inindev@gmail.com,
	quentin.schulz@cherry.de, jonas@kwiboo.se, sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org, linux-rockchip@lists.infradead.org
Subject: Re: [RESEND PATCH v5 1/2] dt-bindings: arm: rockchip: Add Firefly
 ROC-RK3588S-PC
Message-ID: <20250609-undiluted-giggling-65f3751de78e@spud>
References: <20250609113044.8846-1-i@chainsx.cn>
 <20250609113044.8846-2-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="drNe0XH7oe7eadcd"
Content-Disposition: inline
In-Reply-To: <20250609113044.8846-2-i@chainsx.cn>


--drNe0XH7oe7eadcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 07:30:43PM +0800, Hsun Lai wrote:
> This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.
>=20
> Link: https://wiki.t-firefly.com/en/Station-M3/index.html
>=20
> Signed-off-by: Hsun Lai <i@chainsx.cn>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--drNe0XH7oe7eadcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcFxAAKCRB4tDGHoIJi
0ivmAP0SUEPU9XV0AJYQlDwUnQjC0k4TkFd6vo4Osi486h5d4gD6A2RnAPs5+Wo+
SIkO8Q2TaLDNjTkl83igAeqmWhUsiQU=
=R2PU
-----END PGP SIGNATURE-----

--drNe0XH7oe7eadcd--
