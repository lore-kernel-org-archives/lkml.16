Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC97E221288;
	Fri, 23 May 2025 15:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748015393; cv=none; b=hFdEbOlOdBFUOxRMZ3PGhXAH3ProDEZLehlC4wBu36cnN9YdspNvMU5GovrBRJfDE7WXOg8HeOxAB7522ngIfffSSYpa6kt57BmzuR6LG9MRXDnBPuHaMceOcaEuZALLvW4B/o7PNwKW2MMWwDcjsmI/Wteokv9RbCmcS7Zgbyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748015393; c=relaxed/simple;
	bh=fiY3ukj75Ww/UrThE+gzm+DhDv3YDleZ6Dz/VBwi1U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTzCKGBq4VL6e5ZoOcz4sRRRNR/0Ecjecv1vaC4BKpfWlb7mfJ/OiZXkDo4lbuz+8ahGIU3k6u+LjnJ9V1c3/NgBkUhtQSoChGiVvDm8SQb1amvfupvlSYrbae9iZnm7XbnUx2uSvXPQNIVrAbEZqDY5JmI02qN62b5MkxGf0Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkjr4wrK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkjr4wrK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4D4C4CEE9;
	Fri, 23 May 2025 15:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748015392;
	bh=fiY3ukj75Ww/UrThE+gzm+DhDv3YDleZ6Dz/VBwi1U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkjr4wrKB5J3ImQokx+/Ah1nnE4IhCNMuHV+OvrHxgezMUmOORiCDyhdLVuCvL9Q/
	 0r3E1k/cQBC29ldNAsRdRC0jz4dfDAUPw33xU36rrGaCYFvxo2od422d9u/klYrOMq
	 7DurEj/SKjpfxpZmGhR2kX2rDmQwVvkX7SO6B5h70656rrJkjnUVYwZJPWjmr+oKu1
	 /HifKjcDyREk7zVWytaE+XSt0e0MCgh+6VXMt58gHi0Cciayo2Q1tZ9TnjrvRrni6F
	 AoIopz88Uc4A3BwFT/eDsxKTuWA4cGIOB/e1Rz1A5VgXejrbJyTNIEQjeVJMb5AeJc
	 KbQcAZ6hgQ1kw==
Date: Fri, 23 May 2025 16:49:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Wig Cheng <onlywig@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: rename nutsboard to
 mayqueen
Message-ID: <20250523-congenial-overbite-b4b1d121b98e@spud>
References: <20250522152220.3408999-1-onlywig@gmail.com>
 <20250522-difficult-yummy-84376495b270@spud>
 <20250522155810.3414273-1-onlywig@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+ZMPsZr17F+tsd3z"
Content-Disposition: inline
In-Reply-To: <20250522155810.3414273-1-onlywig@gmail.com>


--+ZMPsZr17F+tsd3z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:58:08PM +0800, Wig Cheng wrote:
> Hi Conor,
>=20
> Apologies for the typo. It's been a while since I last used git send-mail.
>=20
> Thanks for the clarification and guidance on the rules.

An additional piece of guidance, please wrap lines in your emails.

> I believe the nutsboard prefix is no longer in use, as the related device=
 tree files were removed from mainline starting from kernel 6.1. Additional=
ly, we have informed all our customers to upgrade to the new hardware. Howe=
ver, I appreciate your explanation and will mark the old prefix as deprecat=
ed instead of removing it.

grepping the tree disagrees with yout, there's a board still in the
tree.

> I also have a question regarding the new prefix. The reason for this chan=
ge is that we=E2=80=99ve developed a DRM driver, and the platform device in=
 the driver uses a compatible string referring to the device tree. Without =
a vendor prefix, I=E2=80=99m unable to upstream the DRM driver because it l=
acks a valid compatible string.
>=20
> How should this situation be handled? Is it acceptable to introduce the n=
ew vendor prefix first for this purpose?
>=20

A new company can have a new prefix, this patch adding it should come
with the drm device binding that uses it.


> Product page:
> https://github.com/MayQueenTechCommunity/PIXPAPER-213-C
>=20
> Wig

--+ZMPsZr17F+tsd3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDCZHAAKCRB4tDGHoIJi
0pujAP4ns9G2soEvwfAFeLOAv7j9SO06JJDfYxvC7vrFWVFvJgEAlhaYuUbjWd+v
RXc5iPvkmY3TjzczdJ+NdkaRvoVYewc=
=B2I5
-----END PGP SIGNATURE-----

--+ZMPsZr17F+tsd3z--
