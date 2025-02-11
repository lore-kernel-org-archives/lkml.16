Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07243261564;
	Tue, 11 Feb 2025 17:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296530; cv=none; b=SPaFQHYx21cYb5qMzxqccJ3vTDEShm37AjKBQAfCtQiaF3b8TRk4G86/ihre99+boczNyvyVhI16svLThvTMEHUIQcnVsXt8zGUjenNdaHmnXKseQ9If/vJNgyewvCBvhCjYofsLba6q2haSvJLeTRAasuDFkZpWy4ImD/QmdH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296530; c=relaxed/simple;
	bh=daaP9ivLRlaVJRR0FdV2E485+B1tFasfnuTeDeoCx64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijyxJ2TV0DXvO6vSh4FEfh3GiqsykCtzHGswoiPABiL2FzWIG3BB+aLf3/ACDz0GIXKes8EI18Cr9AX4saTaC5crA77yjyJv6YUT9E/Os0RLwwx09M/X81Gt+w7VCutOB47jZ6boAN37XC9kmN28Dfay+HJxyibnv1RjY1UyxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/2T/84z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/2T/84z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326A4C4CEDD;
	Tue, 11 Feb 2025 17:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739296529;
	bh=daaP9ivLRlaVJRR0FdV2E485+B1tFasfnuTeDeoCx64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/2T/84zni+MLaiIA8zuppiehPyj+/6syQyqqYQt6yDIaWcIY2EUj5XeZHHWCN2Ut
	 RNYQRqPtLpTI/48KzD7a4cb0Q0fLC/E4zHn1lQBmbwqFLzaP72OTCSYivyFipbO4qx
	 pQ+zVc+OPZWgrOQFaE9NLkyk7RfgFVBXzWotAuGPegOeAgSkK8EP4cjH61VkxxAjr4
	 L2TqQ/LgvuWKaIAQm8p7laE70v+teKaO019cnd8otCZ82HFuIFsfzUtbzGvy8zJkOF
	 KNuyQpp9/IOCfZSO8Zg1jjrFQS4yD/diEBCh+dvIa45s2JlNfkLQYAjgn/n0vNBO+r
	 0xWH7GD0T92nQ==
Date: Tue, 11 Feb 2025 17:55:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: srinivas.kandagatla@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH RESEND v2 4/6] dt-bindings: nvmem: rockchip,otp: Add
 compatible for RK3576
Message-ID: <20250211-anthology-probation-e63c66321590@spud>
References: <20250210224510.1194963-1-heiko@sntech.de>
 <20250210224510.1194963-5-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uIhrL8S7RmlAJj9x"
Content-Disposition: inline
In-Reply-To: <20250210224510.1194963-5-heiko@sntech.de>


--uIhrL8S7RmlAJj9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:45:08PM +0100, Heiko Stuebner wrote:
> Document the OTP memory found on Rockchip RK3576 SoC.
>=20
> The RK3576 uses the same set of clocks as the px30/rk3308
> but has one reset more, so adapt the binding to handle this
> variant as well.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uIhrL8S7RmlAJj9x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uPDQAKCRB4tDGHoIJi
0qBsAPwNq2KSXu5wBkYu8Q2FSXgq9YAlDU7EwwkvEplZu7B+bwD+LItI+FTgqJU5
O0CQoda+tF+w4nCK2f5B6zkcQ/rx1gE=
=5yrV
-----END PGP SIGNATURE-----

--uIhrL8S7RmlAJj9x--
