Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE445283686;
	Tue,  6 May 2025 16:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548810; cv=none; b=usoMNkuIgyfpyJHsC9ADhrTV90MQh1LHF5mxIlB46ACljWXDlzB35B4x09tk+0uDBAjrwI81oMNDngf0K+tXlOICucoUvVOOhvGaDTvMM4UaDJfCjXjMjrp9f8KQOdWY71MjEq4a2YmXeemlOm8ZwkFpy6hWG6iXF18iO5fbk8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548810; c=relaxed/simple;
	bh=qqnaCN+QUPYHPuDmxiApoJhIGYIBjx2h4vMiQAZJhHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mo9ofseIQFSdVdpFvMQE0+wPNgKnfJTzrLtZgYOFPA2s2ULYtzOOCXoRhQvEbYNiH6VW4MabqsxpjYPJ7Fp2NTnZPkMxBHIk6EsZWV+rfs6ZxOPoq9+lA+yTufL1miKay5x4evnEXoz5Lg1s0SOsKovqWDGQ0HVUqMwveUmBovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFHuWwt8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFHuWwt8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB54EC4CEE4;
	Tue,  6 May 2025 16:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548810;
	bh=qqnaCN+QUPYHPuDmxiApoJhIGYIBjx2h4vMiQAZJhHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LFHuWwt8KEmzfbjluK08PXJ75odEuQdIzn1DQ34fKIIrWPAFJ6UM8PkQlbT/P2Zzx
	 Ln+8bbdrBzXviTn/DhBbupzYUJA5F3aGeIQBmMZCTkLEj5STbZGp+Ay3vWps/iopps
	 qeiavphfsQGCL+VEYBQ760Fcd/c6fHw3Gx0kAZFgoKE01TsKfhK+IHBh8tHQtmPL3z
	 YCJp6hAQDiIrQJHoL5MRNnvkoDiLdXR1vnojmdG6KpdZqyzqRAXVCuzz8Ghq4p3Nfi
	 /45IAq1a47qN0hMB8P0+wntcUHzGd64/IEiEstVR8GUN66NV+E0srIF8KRaKru4Kx2
	 NdE91e8vXaakg==
Date: Tue, 6 May 2025 17:26:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH v2 9/9] riscv: defconfig: enable Andes SoC
Message-ID: <20250506-gargle-lustrous-4fbf8c7d28e8@spud>
References: <20250503151829.605006-1-ben717@andestech.com>
 <20250503151829.605006-10-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jKXAgiWgHNZ7yjmY"
Content-Disposition: inline
In-Reply-To: <20250503151829.605006-10-ben717@andestech.com>


--jKXAgiWgHNZ7yjmY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 11:18:29PM +0800, Ben Zong-You Xie wrote:
> Enable Andes SoC config in defconfig to allow the default
> upstream kernel to boot on Voyager board.
>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--jKXAgiWgHNZ7yjmY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo4RQAKCRB4tDGHoIJi
0uAUAP92hrP7s3WaVFynMqKTElxT3ELtr+tufOcVF07+D/ugAgD/SdMXiT8FhPv8
+Z0WDTWilrlPNUYIGLIDgiYcsrxsFwo=
=Vig7
-----END PGP SIGNATURE-----

--jKXAgiWgHNZ7yjmY--
