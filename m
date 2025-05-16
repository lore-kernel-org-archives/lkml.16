Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F6B3209;
	Fri, 16 May 2025 14:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404967; cv=none; b=hf3sxXjWyqyG13OEleBetbmM/kj6to82+WkAj/g7C9h8HPr5BEN5jco+G1630P8PNeaAsSLWOTyqhYU6z/9jX/Ml9A0gZ/jkGQNP1rVX38wHQf+mNomxedtX/xeYoRW3Vz3sAc6JBmaT10FCJbM4Ryfpx5KiMKSBH8UaAf2nfI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404967; c=relaxed/simple;
	bh=Ir57TohQL0KRns31TnG4/ir/T9F377bTIMsPI537Qvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nX0xQKzclwlRfIu3p0XTWTnnoSdBO8wrUR3jg0wFXMkRFasiNedr5dR6i/tg1uNQ3Z7gabR/XYGXS3xCrBFOSQ7YqhqLu6lif4BL9S2wakPh7rHUWCQjKGf7tJFcSHfdpR+q4rOG/74cBnZQAWlRh3V4ehCVRztxNBW6E8InWdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu4aWrEU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu4aWrEU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE996C4CEEF;
	Fri, 16 May 2025 14:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747404967;
	bh=Ir57TohQL0KRns31TnG4/ir/T9F377bTIMsPI537Qvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nu4aWrEUI/5uqe3wKQxK2G6ddxYztWjS/tlakBcslFmqlFhuQN5AyNPn9DzFhqYzM
	 ay2//QXgJHaZg1ZxRohNy+0nkyXTzH/WvIhyse573PEawRazrkmsEiETzNQSo4Q+Ew
	 QhMH+ZaTf7WhesfSL3ZHBc8SKs5k3BeAznCujNNgcPvj2G4JQGxnlMh3JXxxCzxap3
	 Q73YUlGBAMfg+FzSiqqzMQDGqdVYtaGAVpEJLCenbTwomlPfpm5hrfngsdkOBL/fh8
	 rCbu5moP6gIhSchaimz5vKWCoV4pcr1PMKr60iFgQhiasQInQJmGHrnynyfqmIEfxM
	 GTvu0t7jA9+cg==
Date: Fri, 16 May 2025 15:16:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [PATCH] dt-bindings: usb: dwc3-xilinx: allow dma-coherent
Message-ID: <20250516-exclusion-suffocate-94a1c87c1262@spud>
References: <1747401516-286356-1-git-send-email-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="++J8wUPqIH71Ph6D"
Content-Disposition: inline
In-Reply-To: <1747401516-286356-1-git-send-email-radhey.shyam.pandey@amd.com>


--++J8wUPqIH71Ph6D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 06:48:36PM +0530, Radhey Shyam Pandey wrote:
> On Versal Gen 2 SoC the LPD USB DMA controller is coherent with the CPU
> so allow specifying the information.

Sounds like it should actually be marked required on this platform, no?

>=20
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Doc=
umentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> index 379dacacb526..36f5c644d959 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
> @@ -26,6 +26,8 @@ properties:
> =20
>    ranges: true
> =20
> +  dma-coherent: true
> +
>    power-domains:
>      description: specifies a phandle to PM domain provider node
>      maxItems: 1
>=20
> base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
> --=20
> 2.34.1
>=20

--++J8wUPqIH71Ph6D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCdIogAKCRB4tDGHoIJi
0iOiAQDWypdVROV/PgOlz0vB9+pT8ItFOLzc373ZCWhYPG4v9wEAs590WVLjPkDS
zFLXLiN0iThggG8xi6fqQW6pQFIthgs=
=2pq7
-----END PGP SIGNATURE-----

--++J8wUPqIH71Ph6D--
