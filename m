Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7C1D7E4A;
	Thu, 24 Apr 2025 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745508475; cv=none; b=NBgRYUfUoTFsTFLK+wREQWG9BN/zffUx+DstXZRYvSyZkScgYJqoBjP1/ZxJzMdSwYSmISwEENuLlreqXv1rkuD8rVBS35h5DhZLPuS7lFXytCLk/2jbDPWTf9qTKveeTp4iL2jQK5UzQFsMCtNsGO3YR84T4+6TMSTw+zyVDN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745508475; c=relaxed/simple;
	bh=u/QtdMUzBzBtMDX1S0v4wSSMPI+jL4o/EmMuWHiQGew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHqLHKuJKC1iq7XCVk03Jy2I6zfHiuHnIShRkhEMBdgPiWLULec0EJ3EKm4lUxE1aaQM5UJAoSgiZ1NM11VErCualVECqqx0+sLZzfI3IcGoWWHguEjLmS0PHLhpHI99faVWB5nrbBqWr0C+TE3NSvO8ZzQSCL+XGzIa+ObM6+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IoerhUH1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IoerhUH1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4E6C4CEE3;
	Thu, 24 Apr 2025 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745508474;
	bh=u/QtdMUzBzBtMDX1S0v4wSSMPI+jL4o/EmMuWHiQGew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IoerhUH1fRxW5aABJs8abtvAg/u8a0qria0HkXkB8rUzGG38+W3mOpesD9vLeaGF8
	 klyOb1at3fSI2jwXvK8nA+iF6OMVmeZ7AyhPTjshM0dEkj0BYc887GThrQpEIQSAyJ
	 saU/QUY0JJTiwxhJeBpEicQKQ4tJHZM5OPk679dh6uJjDMRLIs5n+NlX5UrbKBZwKm
	 PNZpiCTCJG15ZW7isPDuc2/d3qvKPGZ+XrKiXmRpsO7QvZe6p96zLRhfiDLASrlxr5
	 swdvLB5k+t4cWNb0vCwCsOPzxZ1L4DnYMTpnPEgdTmbeCAzxEYle7+SC+QstLKX1O2
	 /SleApDzN6HQA==
Date: Thu, 24 Apr 2025 16:27:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: generic-ehci: Add VIA/WonderMedia
 compatible
Message-ID: <20250424-chaffing-mating-e512c198c0e6@spud>
References: <20250423-vt8500-ehci-binding-v1-1-1edcb0d330c2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AkuIQLd6f/4BOskW"
Content-Disposition: inline
In-Reply-To: <20250423-vt8500-ehci-binding-v1-1-1edcb0d330c2@gmail.com>


--AkuIQLd6f/4BOskW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 11:49:45PM +0400, Alexey Charkov wrote:
> VIA/WonderMedia SoCs use a plain vanilla EHCI controller with a
> compatible string "via,vt8500-ehci". Add it to the binding.

You should elaborate here that this is already in the driver and dts
files. With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ehci.yaml
> index 223f2abd5e592ff8cc3ad97f9a325356ea57044a..508d958e698c2e8dad748a6fc=
def65d6e883b97d 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -86,6 +86,7 @@ properties:
>            - nuvoton,npcm845-ehci
>            - ti,ehci-omap
>            - usb-ehci
> +          - via,vt8500-ehci
> =20
>    reg:
>      minItems: 1
>=20
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250423-vt8500-ehci-binding-e607bfafdcbf
>=20
> Best regards,
> --=20
> Alexey Charkov <alchark@gmail.com>
>=20

--AkuIQLd6f/4BOskW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaApYdgAKCRB4tDGHoIJi
0pqXAP9UXO7DomFd+ehGdU6VYHx7BPH5waiSfQwdAxqurbIoLwEAm1wFLmWrACe4
zDXd4Iak4cyD/GEfwFKwLIqprYjaKQQ=
=n/2W
-----END PGP SIGNATURE-----

--AkuIQLd6f/4BOskW--
