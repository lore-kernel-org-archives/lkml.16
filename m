Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4802C634;
	Fri,  7 Feb 2025 00:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738886581; cv=none; b=qQ+0RmgFV3qvMdtU6kcR3UvmIN2d0sa0qrmqoFp0EWLPIyk8US1BSxVeWv5ip97h87B+WRtFTNwmM+7+pUibsFvJQrKGypYKoS/DFJYk8HLHNVJvIBhKsJLxmNSHoUVViVefXF+77fmAGzRO1Cul7sQ9ohr5ZkBNcM01/5EWTZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738886581; c=relaxed/simple;
	bh=jFU7fO5yQm432EwC+/7/qkrCLs+tSpaeUFSBEO2zKYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIwQLGcydWW/TI+2WenoEURIIc2k4fcAxNYFA4gNYNcWbecaG15OCVO+UDZ9lVqpdOYq8jbSZQ1wZ0EZyXlzkGnhGe8B0F3oDZLol3INyeZH3F00zL+39FET+AfiMW2Ft2WwcvfLG0Wp8IACxBFlF51YkciZbRLNLtM8PDSwWNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKGCSTsI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKGCSTsI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BD0C4CEDD;
	Fri,  7 Feb 2025 00:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738886580;
	bh=jFU7fO5yQm432EwC+/7/qkrCLs+tSpaeUFSBEO2zKYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKGCSTsIwsjMvT03gam8wglLzm/Bd16TS3xWgPWta+891d35c3vLwNOdmspvw3mEM
	 lsgBEBDKgwey6xn8NIrt4b2asYF8rrzKtLtzZXXGgFehKI3+Jo/a54bpo7+IQ3NcX8
	 c+xN718OG5MSzD8liCmbsFhAnB4T/5g3KhNNo1R6VHN57f83gYelUJ9wGnYTNPHFU+
	 NsVWxFDDMm1caVDwHxpNtY290/8EVT5nwHMuYsNdPgokYjRA9/dCAGqlvDtvzVPwQf
	 +vZtcSkmb2M4j+kH1zzf3mZPoWXLflfpwuPkWmr/Yr0eIzRROfLJ80IWQ/DCkUaP9+
	 fwxGeiP3pMRhA==
Date: Fri, 7 Feb 2025 00:02:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] RISC-V: add vector crypto extension validation
 checks
Message-ID: <20250206-prong-sandfish-417a3bf9de29@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-quench-entrench-09bed8c8c823@spud>
 <20250206203249.GC1237@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IZJucm0+VF10qkQ0"
Content-Disposition: inline
In-Reply-To: <20250206203249.GC1237@sol.localdomain>


--IZJucm0+VF10qkQ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 12:32:49PM -0800, Eric Biggers wrote:
> On Wed, Feb 05, 2025 at 04:05:08PM +0000, Conor Dooley wrote:
> > The 1.0.0 Vector crypto spec states:
> > 	The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly
> > 	the composite extensions Zvkn and Zvks-- require a Zve64x base,
> > 	or application ("V") base Vector Extension. All of the other
> > 	Vector Crypto Extensions can be built on any embedded (Zve*) or
> > 	application ("V") base Vector Extension.
>=20
> As previously discussed, the above paragraph incorrectly lists the set of=
 crypto
> extensions that require support for 64-bit elements.  I have fixed this i=
n the
> latest RISC-V ISA manual.  It looks like this patch would still do the sa=
me
> thing either way, since it actually just checks that vector is available =
in some
> form.  But this is not the best version of the manual to quote from.

/sigh, I updated the binding commit message but not the code one. That
one should probably change too, given that's now merged.
That's a stupid oversight, thanks.

--IZJucm0+VF10qkQ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6VNsAAKCRB4tDGHoIJi
0hAuAQDNV4s4Ij8PSTwiHujFDprhlcxQkhi3bLa7A2lFvdIJKgD/cAFZR2Jwg3RN
bDVM7Pp/OSKNt+5qMoFzqfkTMPr17Q4=
=/epo
-----END PGP SIGNATURE-----

--IZJucm0+VF10qkQ0--
