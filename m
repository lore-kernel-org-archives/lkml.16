Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75140255F51;
	Mon, 12 May 2025 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747047636; cv=none; b=PKImSOjCFQrhBkfkE2j5TAKbqEKEkGCxenRIi3KM4yXnfIy9RB/KmJZNfFRzGfbvvLwCH6bOUA/KVSlOCOviEJ1Wr8gK0sE5x+4QmgsiKMps6XudjhGzWMt6ZtqG844f/nJeCfQWy4FuCzyZ1ZXftXPSavl3gSQDtm3mIeMAXGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747047636; c=relaxed/simple;
	bh=3CUeLBiq43ESS07ytjkjdkGSrLDtW10YLcITOlNk0Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mf5Ref8nrOQ/GkyLQZaXc/HDp1is4hwB6Zo9Rhwbuj00Wlir+MkT73HVzaQ0V0a/hb7tlYggchB3vz5DyKHE65recEH+H530Hp2Pm4hHQWKBYuLRqn0YlBZ9vP5umZfVuZwJ2OWcKsLpIjvt5lWFdfNHAJWoZHmDqu1Gj2t6qp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0BaDP0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0BaDP0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD321C4CEE7;
	Mon, 12 May 2025 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747047635;
	bh=3CUeLBiq43ESS07ytjkjdkGSrLDtW10YLcITOlNk0Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0BaDP0x3WYI5lv7vmNU8AMs6gtkYE2dUP0ykAHciRG9tYSCsCICTSaYaxeO8xytD
	 wujdXaZOCugbAv+NZ7Pc5vRAou8ssrkOHgDPAVf52G0d2RXxR5H1AgjMZ0iefRz/38
	 LpRCf3Ap2ijHsvu35NFPnf/w8b0aQMLRA1kJlPr9uYgEUbn6IE68VJWSiomXOKjypS
	 FsQXGs551zVyQwg+XBgvt1fJjyXg0tkj9PszzDYtvjuzC7FswuFsLvksk5IJFXH24D
	 d0M3mec49KJdrJ03MYJYPsmfmhPBXUVeMfp0Vz8ACRQpMizJ7hYeZi54QIMrpKRRzU
	 WpRYVY9KnLSng==
Date: Mon, 12 May 2025 12:00:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Hu <nick.hu@sifive.com>, Cyan Yang <cyan.yang@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management
 controllers
Message-ID: <20250512-popcorn-clustered-7ab2c57c7f39@spud>
References: <20250509021605.26764-1-nick.hu@sifive.com>
 <20250509-small-graceful-limpet-d0ea41@kuoka>
 <CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com>
 <bd001136-eb48-44f0-8724-09eeb022df8e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rEAzhEWO5LPl9b4j"
Content-Disposition: inline
In-Reply-To: <bd001136-eb48-44f0-8724-09eeb022df8e@kernel.org>


--rEAzhEWO5LPl9b4j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 12:39:37PM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2025 05:20, Nick Hu wrote:
> > On Fri, May 9, 2025 at 2:40=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
> >>
> >> On Fri, May 09, 2025 at 10:16:04AM GMT, Nick Hu wrote:
> >>> SiFive Domain Management controller includes the following components
> >>> - SiFive Tile Management Controller
> >>> - SiFive Cluster Management Controller
> >>> - SiFive Core Complex Management Controller
> >>>
> >>> These controllers control the clock and power domain of the
> >>> corresponding domain.
> >>>
> >>> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> >>> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> >>> ---
> >>>  .../devicetree/bindings/power/sifive,tmc.yaml | 89 +++++++++++++++++=
++
> >>
> >> Where is a patch with the driver (user of the binding)?
> >>
> > We are hoping the driver can be submitted at a later stage.
> > The driver that handles the MMIO is implemented in OpenSBI and depends
> > on some prerequisite patches [1], so it will follow afterward.
>=20
> This patch alone makes little sense and brings little benefit. Post this
> with user.

Unless the justification is that they're submitting a driver to OpenSBI
that uses this binding, but in that case link it in the commit message
and explain.

--rEAzhEWO5LPl9b4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCHUzwAKCRB4tDGHoIJi
0scJAQDCCNZPASUEEC0yp7XmtvMCNjrvSTAqlpkpw56Mt5WVggD/f3/eerb2ZMfz
pnUobj4FK/24InsyO75VNNGPP8KTHgU=
=Z7nY
-----END PGP SIGNATURE-----

--rEAzhEWO5LPl9b4j--
