Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A43145323;
	Thu, 15 May 2025 16:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326130; cv=none; b=AcJDrVbRkiwSj7b0Oi+a5vnGinwrn9Ktoy52Xw/9juxCeZ88FtjO9xNqZ7RfehTFBieeXMe2WElBTKtffXHMxG1trvOR/aQON1DcGDN0sBOIcxv4t153mZt/oxLWEoDGbj9JuGppAjM+33bpBPwuFiPvN6IanzpJIFjbDJOgXQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326130; c=relaxed/simple;
	bh=gmffZcjjV36K+giSrR7DuhXIkDj+Hp7uIkaCnvjXFfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5A/xi5QtH/CLLgMIyMgky9ErZz+VnVn8hgpT8mwGLBFJURx7rWSBYkZ9rD8RvzDtAtgzsTDdHp3Pa6xEyNxzbi2bBlO3SPh7X96aOLOieHCJak5SVqcaSO7DBA/tJcPutqUKtLTty+6BQWERBpaEZvGkUCCPSAKV1Padh5DfHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPsyrd/x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPsyrd/x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF2EC4CEE7;
	Thu, 15 May 2025 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747326129;
	bh=gmffZcjjV36K+giSrR7DuhXIkDj+Hp7uIkaCnvjXFfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPsyrd/xwxzU2gC0CYgrqcHlaaJL3ncZofQHsyNlah0ygAjXT1kieDI0wb0b5tOCx
	 odeuiYXAWZUZoFShAXawCs8CTQ5gZI84tYwzduvB8S1fzRrpOeavLD7G3ES1WtqwRL
	 bDVxTYBNE5mT/QEAIhAgIepOqPBSTmCcZ5IP0fN5M/O2ZNsjoK2kWZDXAANG/hLSnG
	 ROZDxLpiU4J56P0//L7pTefh3stKHa3CugDx0jhvpkSzZ0mDMQYlHNLLVRCaxoWBIg
	 ho8xMuCGFgt8aw2P/+rVFh28pSxK6psBPmVR5cb1h40P/f3wmnKgQIwhuJse23o1Gy
	 42x4eZV/mxm+Q==
Date: Thu, 15 May 2025 17:22:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	~lkcamp/patches@lists.sr.ht, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: trivial-devices: Add VZ89TE to trivial
Message-ID: <20250515-unreal-throttle-d633a18fe859@spud>
References: <20250515000225.79239-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oVQnVteNBZx1ifEZ"
Content-Disposition: inline
In-Reply-To: <20250515000225.79239-1-rodrigo.gobbi.7@gmail.com>


--oVQnVteNBZx1ifEZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 09:00:40PM -0300, Rodrigo Gobbi wrote:
> Add sgx,vz89te partnumber since it is equivalent to sgx,vz89x,
> which is at trivial-devices.

I think "equivalent" mybe isn't the right word, your link below seems to
have custom handling for this part. Different read and write sizes for
example.
s/equivalent/similar/ - maybe whoever is applying the patch can do it on
appliation.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> At [1] "add support for VZ89TE part" was added, but
> no binding were updated. This is similar to a existing trivial
> device, so just add it.
> Tks and regards.
>=20
> [1] https://github.com/torvalds/linux/commit/0a735aa07f2eb5bcb04fb022b463=
c70cd1cf1399
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index 377722af6c00..6a49e8efc0f7 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -345,6 +345,8 @@ properties:
>            - sensortek,stk8ba50
>              # SGX Sensortech VZ89X Sensors
>            - sgx,vz89x
> +            # SGX Sensortech VZ89TE Sensors
> +          - sgx,vz89te
>              # Silicon Labs EM3581 Zigbee SoC with SPI interface
>            - silabs,em3581
>              # Silicon Labs SI3210 Programmable CMOS SLIC/CODEC with SPI =
interface
> --=20
> 2.49.0
>=20

--oVQnVteNBZx1ifEZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCYUrQAKCRB4tDGHoIJi
0hFeAP4mDAqrXO86AF3l4/1tvhXnFrR+EXAdtTDh9N0UBSBjcwEA+5dx2ssFqTHG
6Pd1jZqmc0Y1Co5YdoxXQr98qtuH9Aw=
=RFFT
-----END PGP SIGNATURE-----

--oVQnVteNBZx1ifEZ--
