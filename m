Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4E22AF1E;
	Wed, 21 May 2025 15:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841162; cv=none; b=ZndGZtM07SJsNbkLZa3ppr2sTYmU10AzpnzETJnf3B6PcWUx08KPDPMoTNinW72x2sprsr+TDDcNjjSUVhgeMfpMa8yycHznk0bQfYTTb53uFOBN9mh/5AI9foYG9TuoF5h4Y7bNyzGwMqp/rIb9JCJSL5QMp0x9yW/t69bOiGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841162; c=relaxed/simple;
	bh=MDKD9lGxNck7Ne+uaSDs1WAO4Wl3ZxiYCJEk3xlWYQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aw5I4lnFp8LTTgckKhw2ICR/8Z44s6h010jLclnCRcWP7atrYVtGMr0Rk+4e1004swlzV2DxmoKY95cYZLOuHRLVMLpZDQkmLlUlyV6cTkkOoupcCMaORQ5QGBqzqE4H7dwR+AEqSuvFkJB8qu1l8cBA9jmIt0mbMhpWSruOwpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auaZZXT2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auaZZXT2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A09C4CEE4;
	Wed, 21 May 2025 15:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747841162;
	bh=MDKD9lGxNck7Ne+uaSDs1WAO4Wl3ZxiYCJEk3xlWYQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=auaZZXT2l+8GZIC3AVHmxcjl3G5L1QU1tF1rtJddcr3k9zk+gLZ3cWQZj5r0CsoMM
	 5XjsDeAruOgf8HOM39k3Js/2MTXoag2DC7QRlBXns0wht6SverBWuDxTQQRxg6iCWx
	 OHmdPkPhWg/5ik1rUC9kR6vZzfMD0CJ5aV9+1JNNHFE8FqmBufF/I1rL4iTtrZr14h
	 E7jOM1LoGi9VvH5QMA+Cp9UoiWpE9jvTRXoUQ2G/9XjaVtk1saH1Q9BikwRvmFWQ9v
	 mve1aET3ZhOq+JhKSOkp177mxeQDegQ7GAJf4pGQwzwisC044XScvPLJX1KOCnCpjS
	 rZuHwpVW+zCUQ==
Date: Wed, 21 May 2025 16:25:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: stm32: add STM32MP21 clocks and
 reset bindings
Message-ID: <20250521-quantum-flashily-611a7d5f4f06@spud>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-1-cac9d8f63d20@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DDoC0JY4QW9yHonk"
Content-Disposition: inline
In-Reply-To: <20250521-upstream_rcc_mp21-v3-1-cac9d8f63d20@foss.st.com>


--DDoC0JY4QW9yHonk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 02:38:49PM +0200, Gabriel Fernandez wrote:
> Adds clock and reset binding entries for STM32MP21 SoC family.
>=20
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp21-rcc.yaml           | 199 ++++++++++
>  include/dt-bindings/clock/st,stm32mp21-rcc.h       | 426 +++++++++++++++=
++++++
>  include/dt-bindings/reset/st,stm32mp21-rcc.h       | 138 +++++++
>  3 files changed, 763 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yam=
l b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d41f0b963aceee534acea77bc=
9d276fd0c9b1548
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
> @@ -0,0 +1,199 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/st,stm32mp21-rcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP21 Reset Clock Controller
> +
> +maintainers:
> +  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> +
> +description: |
> +  The RCC hardware block is both a reset and a clock controller.
> +  RCC makes also power management (resume/suspend).
> +
> +  See also::

I believe you missing some comments from Rob about removing the :: from
here, and from the source you copied it from (if one exists).

Otherwise,

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +    include/dt-bindings/clock/st,stm32mp21-rcc.h
> +    include/dt-bindings/reset/st,stm32mp21-rcc.h

--DDoC0JY4QW9yHonk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC3whQAKCRB4tDGHoIJi
0gw7AQDclF/KssvPyuRlJxORbowXvNW9eQ2qNLO+ANWJeMmAqgEA0ulde5mpAGbH
AZx6s03+erRmI/Hkhg+AZke5WIMQmQ0=
=YaFH
-----END PGP SIGNATURE-----

--DDoC0JY4QW9yHonk--
