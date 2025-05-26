Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625D3288DB;
	Mon, 26 May 2025 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748274991; cv=none; b=eB2yA+0nxuWPoGcbdHNUn2FqHhPawazXRhyerDeUc4hGyeamO1ReyYlgP/jeQvz12gnUpRj+hlHxWiAk8bQ/NC5McVzhmBEn14Oaul/sW7othfAPZK30Kixqbs+uJKuxBSX3NBYs+LBTB93244oto3U0oJhsmpW+2Svj1IWkOLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748274991; c=relaxed/simple;
	bh=7QuVyiWUvo9ZI9mwGAu+VmY8g1EYEinZTBq+CtvGij4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7XQL9VHUT5lYcArF7f//eABLwSyb9771w0h2wGe7g++2II7ffiza0f5r6em9elkydkrxaiiMAhAZD68qoeLQt8n2sLQ8WF/OBVfsZ44zrqTnaQm79ZgY3S9NmSBQ0FIwSMHDsbMeINCEihjFw+AdL1g+CwZQyqDAG17abAkh+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7pPSbPO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7pPSbPO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F06C4CEE7;
	Mon, 26 May 2025 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748274990;
	bh=7QuVyiWUvo9ZI9mwGAu+VmY8g1EYEinZTBq+CtvGij4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7pPSbPOmQafVzEZQYZoMGGlxGzFLNg8YYAhMyqY3aHbg1TNTceDWaLIzQGVK9wp8
	 Ri0CBtjSJYLlugk43tNS9JdF9eeWo5Cots3efGaTbnKF8miDdEYFzVMtW7UTiw5Sq3
	 HtLYRCm/uHPiu/roKW7K3uCeTDO0OjtjwcGv403CgGjd8sYAQcEbDO03ekOKKKaDkM
	 lgNzKWz23k0ExRAj+5yw8ndWSSeiHIrq6a7P/FIbSpWNMvRJIdzp//y5KZJFowt79C
	 qeHjKUtK3p0I0ml6IGoCRUz/7SP5iAxnCuROmrve2Fjzifk3Mgtf5GlMVo+Nhau/KX
	 0YXJgLTwQCgsQ==
Date: Mon, 26 May 2025 16:56:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: timer: Add fsl,vf610-pit.yaml
Message-ID: <20250526-busboy-unkempt-a0da285be859@spud>
References: <20250522205710.502779-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lGNHcCBdP8q94Zoh"
Content-Disposition: inline
In-Reply-To: <20250522205710.502779-1-Frank.Li@nxp.com>


--lGNHcCBdP8q94Zoh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 04:57:09PM -0400, Frank Li wrote:
> Add binding doc fsl,vf610-pit.yaml to fix below CHECK_DTB warnings:
>=20
> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb:
>   /soc/bus@40000000/pit@40037000: failed to match any schema with compati=
ble: ['fsl,vf610-pit']
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--lGNHcCBdP8q94Zoh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDSPKgAKCRB4tDGHoIJi
0tcwAQCf/rSOeIKznZSSt20Tkv9u7rQ232gQd67wV45quKgg/QD+JFGMgRe25v8P
epTsTbPLCIOaBk4cWzAC4dKjiNE9Wwg=
=02iW
-----END PGP SIGNATURE-----

--lGNHcCBdP8q94Zoh--
