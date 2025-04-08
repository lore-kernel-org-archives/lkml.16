Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F7222F392;
	Tue,  8 Apr 2025 16:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744130604; cv=none; b=oPHejroiPU/2wVNl0bBG3eF3kY5uQk20Kmhe5lZJIoRXlOghFts4OqSlV8OLsCYvYa2465yx1re4YrdLjFbsQCg0oe3C4Ja1w2uY1ctg/f9hS29yhy0PaOmar3CCxElAK8n+Nrn5tHPr1ukp+JntyeWVgkZnucDavZd2ZyRx8+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744130604; c=relaxed/simple;
	bh=raJz/ai0ZijncBOlpXxt8uuwgqGiy01W9ag8yTzBix8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1bsGQN2VUQd/cVxvw9UHzwADqlh6cxF8NMSmdBJfc/p8klNNsithLuXyTXD49CtoPM+Yq/yHDurHuJo8FF/fYNtT/5AYIdP4fKN6yKCpNIPkoml1YTkn10Ukq9uudVQzPqDlDp6fiVtkVXk1WFp/v/8+iWiyjJOrrztuM2oKk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CN5QCqo8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CN5QCqo8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35166C4CEE5;
	Tue,  8 Apr 2025 16:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744130604;
	bh=raJz/ai0ZijncBOlpXxt8uuwgqGiy01W9ag8yTzBix8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CN5QCqo8FfJuS+kH2SrW9SXisJd5pHEXM8AdUowcpWagegjOXBQVbBANE07oZlmzQ
	 li5c+mCiTm83gAQ3bOAX+pfgdLKJBTZvlL2u7f3xCCNDIQEeWP1a60PccTMgN8wXtO
	 bMrQt1hXozSe81baudtBer5uThmcSifBWXLWrigdtGK6mwSX5oKw8vkizKf8RKZxnZ
	 JETomvJV5XQZnyZFxsKx/aGxKNE8xkAQU8wlrIgL7jdZqAvJxcCeBRcyD2g1s3k43m
	 I7sEGUcGFtK3bnTaQQhzLyWWJA2oKRJz+mDPuaJ2APbfB5vh7NgeA3IDvVjL2LrwE8
	 eFV0zUGdNCPaw==
Date: Tue, 8 Apr 2025 17:43:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tglx@linutronix.de, daniel.lezcano@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com
Subject: Re: [PATCH 7/9] riscv: dts: andes: add QiLai SoC device tree
Message-ID: <20250408-activism-botany-351c2e49b4e9@spud>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-8-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="awb5ELcIZKsHge4i"
Content-Disposition: inline
In-Reply-To: <20250407104937.315783-8-ben717@andestech.com>


--awb5ELcIZKsHge4i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 06:49:35PM +0800, Ben Zong-You Xie wrote:
> Introduce the initial device tree support for the Andes QiLai SoC.
>=20
> For further information, you can refer to [1].
>=20
> [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/q=
ilai-chip/
>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  MAINTAINERS                          |   1 +
>  arch/riscv/boot/dts/andes/qilai.dtsi | 194 +++++++++++++++++++++++++++
>  2 files changed, 195 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/andes/qilai.dtsi
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1e1b98dfe7b..b974e83c9f10 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20731,6 +20731,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/interrupt-controller/andestech,plic=
sw.yaml
>  F:	Documentation/devicetree/bindings/riscv/andes.yaml
>  F:	Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
> +F:	arch/riscv/boot/dts/andes/

New platform, but your maintainers entry contains no git tree. Who are
you expecting to apply patches and send PRs to the soc maintainers for
this platform? Hint: I really hope it is you.

If it is you, please look at the soc platform maintainers documentation
entry:
https://docs.kernel.org/process/maintainer-soc.html

Cheers,
Conor.

--awb5ELcIZKsHge4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/VSJwAKCRB4tDGHoIJi
0vZcAP9RbDFg/af3ECEvZAxIZ+AZ8LsCFlFr9kWSatf+nA5aEAEAtS1YMjdLacjF
5TjTqZ65HkYhQTbXoa6mn6dLiR1j6gE=
=oOMV
-----END PGP SIGNATURE-----

--awb5ELcIZKsHge4i--
