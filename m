Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA37A26F466;
	Thu,  8 May 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715714; cv=none; b=OlCAEw26xz21RrRzYJu/L6iSIVKvm9UvS/qJ8fT7mCdQ9gCxpvGfIc++SrcNmOqJxmIX7gA6T7lmpRSHzZOZ4qf7cGLJTHOVDRdY2UBbDshEFwmcvBwHDFeQsYruZqXF8hCwDn+8fpyyLX8i67pnXdrBMkv2etSRe2f9gBybqOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715714; c=relaxed/simple;
	bh=B9AeV/I++i7Bk7tOgydnTHZvyHSJOGKVCcbaMsF1F6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYfkAiKLI+UQZ7rlvcRZVaq+tavkA+2vpmb5SQ44DtumD8Uml/kaSj844wNa49AaePRE1fshgiJcaeCg1LUtS79JRcClv86LCtWmFImoJ3Rh8PDHihgtX2XsZv7bzKvKSMOYB12dda5tAClCsjHWauAjb/37AyfEKi15+KHj+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaSLuKhq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaSLuKhq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A865FC4CEED;
	Thu,  8 May 2025 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715713;
	bh=B9AeV/I++i7Bk7tOgydnTHZvyHSJOGKVCcbaMsF1F6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaSLuKhqVM3WYUsKUrfKX4nnQ6RLqwG/k0AEh0aw0klA47XAZIwcvOwkx84PVfcDQ
	 uzGxasQTQqa7qvE7EJ3SYWSEv39n4ulcODmydXDXM2oKOUJ20fkhiyNxbZukytABNy
	 ANYJV9GSSA2h5AxDBWZuNtphjBKUJQHcrpvYZ/v9n5EuhY7NMXjeJ6BDZXw1CBlyS1
	 v1RFFW0ffW+Dh7e1N1zJ8ahNXL3cWRAJAvDsG4LopqkR4FZvHVoSOZJNoFpy+MWza8
	 WSuQCjigKMuN/fMoSRUtJPn1beT293rK9KNfar1Cuw0RTRkY7MskkkjS2RmE+RGmSu
	 b8LHabQ6Tp3mg==
Date: Thu, 8 May 2025 15:48:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, praneeth@ti.com, kristo@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
Message-ID: <20250508-sufferer-evolution-e8f9c36fc911@spud>
References: <20250508091422.288876-1-p-bhagat@ti.com>
 <20250508091422.288876-2-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ebtE20JlmmST2Bac"
Content-Disposition: inline
In-Reply-To: <20250508091422.288876-2-p-bhagat@ti.com>


--ebtE20JlmmST2Bac
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 08, 2025 at 02:44:20PM +0530, Paresh Bhagat wrote:
> The AM62D2 SoC belongs to the K3 Multicore SoC architecture with DSP core
> targeted for applications needing high-performance Digital Signal
> Processing. It is used in applications like automotive audio systems,
> professional sound equipment, radar and radio for aerospace, sonar in
> marine devices, and ultrasound in medical imaging. It also supports
> precise signal analysis in test and measurement tools.
>=20
> Some highlights of AM62D2 SoC are:
>=20
> * Quad-Cortex-A53s (running up to 1.4GHz) in a single cluster. Dual/Single
>   core variants are provided in the same package to allow HW compatible
>   designs.
> * One Device manager Cortex-R5F for system power and resource management,
>   and one Cortex-R5F for Functional Safety or general-purpose usage.
> * DSP with Matrix Multiplication Accelerator(MMA) (up to 2 TOPS) based on
>   single core C7x.
> * 3x Multichannel Audio Serial Ports (McASP) Up to 4/6/16 Serial Data Pins
>   which can Transmit and Receive Clocks up to 50MHz, with multi-channel I=
2S
>   and TDM Audio inputs and outputs.
> * Integrated Giga-bit Ethernet switch supporting up to a total of two
>   external ports with TSN capable to enable audio networking features such
>   as, Ethernet Audio Video Bridging (eAVB) and Dante.
> * 9xUARTs, 5xSPI, 6xI2C, 2xUSB2, 3xCAN-FD, 3x eMMC and SD, OSPI memory
>   controller, 1x CSI-RX-4L for Camera, eCAP/eQEP, ePWM, among other
>   peripherals.
> * Dedicated Centralized Hardware Security Module with support for secure
>   boot, debug security and crypto acceleration and trusted execution
>   environment.
> * One 32 bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
> * Low power mode support: Partial IO support for CAN/GPIO/UART wakeup.
>=20
> This SoC is part K3 AM62x family, which includes the AM62A and AM62P
> variants. While the AM62A and AM62D are largely similar, the AM62D is
> specifically targeted for general-purpose DSP applications, whereas the
> AM62A focuses on edge AI workloads. A key distinction is that the AM62D
> does not include multimedia components such as the video encoder/decoder,
> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
> processing, or the display subsystem. Additionally, the AM62D has a
> different pin configuration compared to the AM62A, which impacts embedded
> software development.
>=20
> This adds dt bindings for TI's AM62D2 family of devices.
>=20
> More details about the SoCs can be found in the Technical Reference Manua=
l:
> https://www.ti.com/lit/pdf/sprujd4
>=20
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ebtE20JlmmST2Bac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzEPAAKCRB4tDGHoIJi
0rTwAP9+9XYHVqasEK6q5qgXwf11wK84ap5HWyMjexLTOdyjHwEA19BxGR0c9k8b
BXaHJfQUx0Rv+XuQHeX4DHLngwp5CgY=
=JpI0
-----END PGP SIGNATURE-----

--ebtE20JlmmST2Bac--
