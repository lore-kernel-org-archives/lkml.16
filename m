Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D2A2820CE;
	Mon, 28 Apr 2025 16:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859178; cv=none; b=SuPbuMxVAOCQQHUObi3opcqvsmcMpWfHMruyWUeqr5ZLhOHd4/tBG8ojqJdHQZHcubsJiBWeR1J34CuO/ZJ25k8l2lNw+f2gUSS7lr93Q/oz4lDvQnpL6Bg1tbKcbYcOhtHapA9bi8VRUfSbrOAF7gykzsx1gUlase7JHpkEQ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859178; c=relaxed/simple;
	bh=pI6hRChqlANd3TecWcb41Oh8OAvvjaVSWeKsY3yEuzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xoql57HwaddbIowSVfspn2aMDj0on07gKKOwUIIvz8AuIlq3kR/h3cSM6nHoPxwrPkEO/byZzHZhOqL/HCSqgv58jjkGdQQklQGuzgMQ70BxmgCa2fhQbXZs+EPBHCgmWZA8+h64Crxt4yg5SbN62oBPUxDZZnhJiAl4GRdbiA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jngz/xE3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jngz/xE3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D93C4CEEC;
	Mon, 28 Apr 2025 16:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745859178;
	bh=pI6hRChqlANd3TecWcb41Oh8OAvvjaVSWeKsY3yEuzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jngz/xE3VRgYdOP5FFPjdrAXuTFs/nLzMIEAHSlf322k0q7gncsf/GGojuYzDsp5S
	 BNJDlrsOhHxhjProwexPa5h0Pt+usdtysKtHnR8UPoSQWEkIyQAAHIXG0F/26NVrz1
	 J0fC6ZZGSLMFYY5hdBiLr8FkGQGr22UeZWnUcU1vk0Uykg7edAzLCZGaYicG0+j3v/
	 z9HO3ILHQsCYwEQ4afHLJZJMSGU/ZBX0J7PGlBScxow/RpaVxaKL067VApRfw6WsAV
	 s3T0Cja8HL88ix+611GRh3TcSwFngRWelycA2BEURj4xdgMZnDsfaOD/AahJJqR/FP
	 ZzSSOG6bchqBQ==
Date: Mon, 28 Apr 2025 17:52:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yuntao Dai <d1581209858@live.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: add Sophgo CV18XX series SoC
Message-ID: <20250428-glade-unripe-4cdb4913ede4@spud>
References: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
 <20250428-cv18xx-mbox-v3-1-ed18dfd836d1@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="808Y5OGEYRt8756B"
Content-Disposition: inline
In-Reply-To: <20250428-cv18xx-mbox-v3-1-ed18dfd836d1@pigmoral.tech>


--808Y5OGEYRt8756B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 08:39:44PM +0800, Junhui Liu wrote:
> From: Yuntao Dai <d1581209858@live.com>
>=20
> Introduce the mailbox module for CV18XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
>=20
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/mailbox/sophgo,cv1800b-mailbox.yaml   | 57 ++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mai=
lbox.yaml b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbo=
x.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..5815dc02189c973d681f5b4ff=
22a9fb7536802b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.ya=
ml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/sophgo,cv1800b-mailbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800/SG2000 mailbox controller
> +
> +maintainers:
> +  - Yuntao Dai <d1581209858@live.com>
> +  - Junhui Liu <junhui.liu@pigmoral.tech>
> +
> +description: |
> +  Mailboxes integrated in Sophgo CV1800/SG2000 SoCs have 8 channels, each
> +  shipping an 8-byte FIFO. Any processor can write to an arbitrary chann=
el
> +  and raise interrupts to receivers. Sending messages to itself is also
> +  supported.

> +  Sophgo CV1800/SG2000 SoCs include the following processors, numbered a=
s:
> +  <0> Cortex-A53 (Only available on CV181X/SG200X)
> +  <1> C906B
> +  <2> C906L
> +  <3> 8051

I think this section should be moved to the mbox-cells property, since it
is describing how to use the mboxes property.

> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-mailbox

Remind me, why only a cv1800b compatible when you also mention sg2000?
Rebranding of the same SoC, or something like that?

Cheers,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell indicates the channel index (0-7), the second cell
> +      indicates the target processor ID (0-3) to which messages are sent.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    mailbox@1900000 {
> +        compatible =3D "sophgo,cv1800b-mailbox";
> +        reg =3D <0x01900000 0x1000>;
> +        interrupts =3D <101 IRQ_TYPE_LEVEL_HIGH>;
> +        #mbox-cells =3D <2>;
> +    };
>=20
> --=20
> 2.49.0
>=20

--808Y5OGEYRt8756B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaA+yZAAKCRB4tDGHoIJi
0t1lAP9V2g2LIIJRAKEvyHiOiSZqBssxSKYR38pDHKDgwVNB8QD/WW5d+UskSt4X
aQBF7jtO3m4hOntZ5PTi7OrEe6twXwc=
=XbeY
-----END PGP SIGNATURE-----

--808Y5OGEYRt8756B--
