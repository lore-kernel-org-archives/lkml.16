Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE5B7080C;
	Fri, 30 May 2025 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748623283; cv=none; b=Sc2PM2MDZmE+25NCnjuyK0CPWQIKNM/fBGT0/4qBs+DEYAbI12fM6kvLTpejnptRZa1ierwArCdk9MJ6JSbYpJy1eFWXMH2Mu1EvPNqApM9/pDzrCJtVcPYFWALCd0inJ/Vi8j8Je5XuycMCImtp1izHCX1gD+gwsyK7kVRIN60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748623283; c=relaxed/simple;
	bh=NNIZMqtV5b/laCJ78xBzh8tAvbijms9RwhfGqszJY4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwCIE3hK925OHKOKCj82bPhl5PRnvUnhu7Ey6dFTWHJLbhnIlq5hz3BFs/Scw2ftYG1TVmRfOMsrqc0BmCzfEfc32okaB4FFu7n8QBpVDrsVLF0AOI/nT7DX2OYhZVT/d1Ep2E9KtldP21Jrk4UCZH4EIaSXm24A2s3nK8xKRRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6rdKF6E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6rdKF6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363FEC4CEE9;
	Fri, 30 May 2025 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748623283;
	bh=NNIZMqtV5b/laCJ78xBzh8tAvbijms9RwhfGqszJY4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6rdKF6EW0yFAyrcq2MrEEVWAhxbmkkpt/vleZ8NidsgHlFzNbSP6QGAlzRhLWaAE
	 uUs1Fa42tEFx3aPUZPLnFBKusm3zESYUyUqdvTHxn60y2Rg3bD7rRUlB7fEGG+n6DQ
	 +P4KeASYSUuWASNe8ALRkMfHScGUtgdhIpHPcjwRCdSHF9ibe+eT/NDtTT9H2U8EKb
	 V825bsIFE7WHppnu6OFXLPqsZKR9gYVd8t3Xo9WQTkQjsZelQbQWBbM0/Hb9wsLUQQ
	 w12RDR6rNlKW1CLnJS9MGzJI/JaWw8pCW0qJm+jYB9MK+9c12mEkKdqOSbO7pNrnZi
	 6xKHRYv8rMdyw==
Date: Fri, 30 May 2025 17:41:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/23] dt-bindings: clock: Add RPMI clock service
 controller bindings
Message-ID: <20250530-squatting-chatroom-230f035f18ef@spud>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-10-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nkVldtvynGlh9wsR"
Content-Disposition: inline
In-Reply-To: <20250525084710.1665648-10-apatel@ventanamicro.com>


--nkVldtvynGlh9wsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 02:16:56PM +0530, Anup Patel wrote:
> Add device tree bindings for the RPMI clock service group based
> controller for the supervisor software.
>=20
> The RPMI clock service group is defined by the RISC-V platform
> management interface (RPMI) specification.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../bindings/clock/riscv,rpmi-clock.yaml      | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-cl=
ock.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yam=
l b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> new file mode 100644
> index 000000000000..9c672a38595a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI clock service group based clock controller
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> +  messaging protocol which is modular and extensible. The supervisor
> +  software can send/receive RPMI messages via SBI MPXY extension [2]
> +  or some dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines clock service group for accessing
> +  system clocks managed by a platform microcontroller. The supervisor
> +  software can access RPMI clock service group via SBI MPXY channel or
> +  some dedicated supervisor-mode RPMI transport.
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the supervisor software.
> +    const: riscv,rpmi-clock
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport or SBI message pr=
oxy channel.
> +
> +  "#clock-cells":
> +    const: 1

Could you please add some description here as to what this clock-cell
actually does? On a normal clock controller someone might cite an
include file with a huge list of defines for what numbers map to what
clock. In this case, this value is CLOCK_ID in the spec, so it's
completely platform specific as to what they mean so citing some include
isn't helpful, so just mention that it is CLOCK_ID and the meanings are
platform specific.

I suppose technically it can be something other than CLOCK_ID, if this is
used when the SBI message proxy extension is provided by an SBI
implementation that uses a non-RPMI transport, but I don't think that's a
can of worms worth bringing up in the binding. Anyone doing that can put
2+2 together I think.

Otherwise, the bindings are all:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - mboxes
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller {
> +        compatible =3D "riscv,rpmi-clock";
> +        mboxes =3D <&mpxy_mbox 0x1000 0x0>;
> +        #clock-cells =3D <1>;
> +    };
> +...
> --=20
> 2.43.0
>=20

--nkVldtvynGlh9wsR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDnfrAAKCRB4tDGHoIJi
0uDZAP44sukoA1LPqYegMtV2uiSKQF4gXRTD8Qx7XhkuHFJQfwD7B2qEkWLyTKAW
D1359VQetNBQvvyAK7YiFoZG3o+KcgM=
=LFdp
-----END PGP SIGNATURE-----

--nkVldtvynGlh9wsR--
