Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C131291170;
	Wed, 23 Apr 2025 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422078; cv=none; b=j4aQo7lkfQnr9Cuz5yAuDMhj9jTpYGCW8HhpZ6Nf5i8tvkOUiIqjq4g0WkCaM3R8VCjB6kOk1MckivAzCoUYh6XeLMvYpOQKuS+Ao2oGkLN8T4P4F0lsEaAjaW6I22zdlk9PC9eSDaNT4bT+pc6ZSkKRs70vi0cEYls5hXustnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422078; c=relaxed/simple;
	bh=KY+tkNDWDQZc8s3Rmj/OQu/O+PqFkhqgtS5wh4QnnsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFAOdB11yIhB72q5YE4tn7bQfkGR42G4p0l/uwrA+VhKUZbRThEkDC0ZBjsD83jzcx1XITY3HwdjS86k9dlk9mJQwI0xfdFvggZDtG9eTJMjYP6B8Lgzl7XmVLYwRn1nYp9Ze7+RQX4IBz7LQ6akIQLBjhzIhR4NG/FK375k18k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3zXwlaU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3zXwlaU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEF1C4CEE3;
	Wed, 23 Apr 2025 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745422078;
	bh=KY+tkNDWDQZc8s3Rmj/OQu/O+PqFkhqgtS5wh4QnnsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3zXwlaUmJmzED06i0Arh6uR15KC4Rmlp9ZDHW51VPPjYu4t+4jwaqw65GFMq1BtN
	 BGh/lYNWxPIwVKZkIVdetzumhA4yLoRoZrLI313fhOBDW6m8Mu5E37EUaGO8DrtLby
	 Z5/mAiOQQgHeMv4lVH5dVD4oGs+oD9IOLalmou4l4DowFa7j9/n64SRzBInZdSHrKe
	 upNppygtWOMY0hDpi3jEqYbmPIokkY8EavdFSMz7N/PO9IhPO7c223pEesJUxEnqJ3
	 8mTBBAI66I/yIvFaNK39X5v2H+MpPolr1/9URVUI1SC/kceH8hCdJN9aW/X8OCeQrO
	 VYhORklofkxtg==
Date: Wed, 23 Apr 2025 16:27:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: mti,gcru
Message-ID: <20250423-blazer-obtain-ef4a0cd0a23d@spud>
References: <DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
 <DU0PR09MB619646561DF9B4F262F8B2B7F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iO+1mqSGaor1E+bf"
Content-Disposition: inline
In-Reply-To: <DU0PR09MB619646561DF9B4F262F8B2B7F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>


--iO+1mqSGaor1E+bf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 12:14:26PM +0000, Aleksa Paunovic wrote:
> HTEC Public
>=20
> Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
> platforms. The GCR.U memory region contains shadow copies of the RISC-V
> mtime register and the hrtime Global Configuration Register.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  .../devicetree/bindings/timer/mti,gcru.yaml   | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/mti,gcru.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/timer/mti,gcru.yaml b/Docu=
mentation/devicetree/bindings/timer/mti,gcru.yaml
> new file mode 100644
> index 000000000000..6555dbab402e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/mti,gcru.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/mti,gcru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GCR.U timer device for RISC-V platforms
> +
> +maintainers:
> +  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> +
> +description:
> +  The GCR.U memory region contains memory mapped shadow copies of
> +  mtime and hrtime Global Configuration Registers,
> +  which software can choose to make accessible from user mode.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: mti,gcru
> +
> +  required:
> +    - compatible

Why is this select required?
I don't see why it would be since there's not a fallback to a compatble
=66rom some toher binding.

> +
> +properties:
> +  compatible:
> +    const: mti,gcru
> +
> +  reg:
> +    items:
> +      - description: Read-only shadow copy of the RISC-V mtime register.
> +      - description: Read-only shadow copy of the high resolution timer =
register.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gcru: timer@1617F000 {

Drop the "gcru" label from here, there are no users.

> +        compatible =3D "mti,gcru";
> +        reg =3D <0x1617F050 0x8>,
> +              <0x1617F090 0x8>;
> +    };
> --
> 2.34.1

--iO+1mqSGaor1E+bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaAkG+QAKCRB4tDGHoIJi
0m/WAQDYPIh35x33CEHzP0x5YIEB2rQl4h95pdgfeAO5nr4vpQEAlP+ccB+DDUpu
svNC2aK4eMOyUOMWxmIQQH4KYNchcwE=
=fPzU
-----END PGP SIGNATURE-----

--iO+1mqSGaor1E+bf--
