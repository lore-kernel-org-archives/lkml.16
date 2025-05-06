Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328C225949A;
	Tue,  6 May 2025 16:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548679; cv=none; b=dG+w2QEIiT7QiYQInLyInt8fY9Q+Qxrf0JZ4Wu+MBRLin9Tku5M+3FU+wzcKOLBXU0v42mh3B0t/m7Gw0QPxwQjTQs0xzPCMNVCimuvcRkUQYLyC3oEBCeOYvazGTNEKz81/IVDtn+zVAwTXFnEJV6FlRBTgtqLqz5ZhIn4tCEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548679; c=relaxed/simple;
	bh=6+AzYXO0+ZpuHKJPEjy4CD2Mhi6+e9atkIbMEDc7uPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPkgxW94XPC+bRmFXMZw+vLkrmVlM8lJ/QM7REy983HCwkRaRuoxFEBmaj+UK0g8H6uQxg1tfsV1XvfjpYVH8KiFpXQLM28m0NxkaxYvZNBOmS4P6ouzTcnuv8rDn4dWwMUJDqcBt4O/e6zt1YRj/ljNE3P2LaEJGp2YpxBlQNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxV3Vry2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxV3Vry2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E5DC4CEE4;
	Tue,  6 May 2025 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548678;
	bh=6+AzYXO0+ZpuHKJPEjy4CD2Mhi6+e9atkIbMEDc7uPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZxV3Vry2aNCG/2NFKmWiKWDWiA8hz7CA/FrBuvTyTK47Qkk0Sc3JfTba6MswVoTkc
	 fPGfD+kCi3ywCx/sEVKzCCRW4Bg/hikHoEZ2A1mDWIsW5O1555t6y/PFhas9ptd9/e
	 87Okr2xqzFKzczpU105GCgilbleGfvTGUxyBAfo96MifiGk5nQx7ml8qphHdzewWjq
	 1biE73DYbbC52Cr5v5PO4y7hnjE4swcj703c5NwYVnJ5NRghatc6CC7YC/+LH66W1R
	 2d9do0ma+M10fKBG1Wkd86hzGNuSN80uBb7tht0jTw27GDZ8Q0rr4+hJzwgWcx2TRA
	 AH6kPqYKje67w==
Date: Tue, 6 May 2025 17:24:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH v2 4/9] dt-bindings: interrupt-controller: add Andes
 machine-level software interrupt controller
Message-ID: <20250506-vocation-herbs-a2c84688ce03@spud>
References: <20250503151829.605006-1-ben717@andestech.com>
 <20250503151829.605006-5-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0bdWrlMUgMOcOWqv"
Content-Disposition: inline
In-Reply-To: <20250503151829.605006-5-ben717@andestech.com>


--0bdWrlMUgMOcOWqv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 11:18:24PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine-level software
> interrupt controller.
>=20
> In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> second time with all interrupt sources tied to zero as the software
> interrupt controller (PLICSW). PLICSW can generate machine-level software
> interrupts through programming its registers.
>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--0bdWrlMUgMOcOWqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo3wQAKCRB4tDGHoIJi
0o8zAP92lbwWkHAN8n5L5vt7gwGbaVT5MfKv0s0yWfVwM3ObhwEApTIMtPUnOpOJ
IatmZoOtytwSw9dPTa/GXpGpJ02+CA4=
=JFu/
-----END PGP SIGNATURE-----

--0bdWrlMUgMOcOWqv--
