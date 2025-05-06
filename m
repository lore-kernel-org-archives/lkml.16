Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E3C2820CE;
	Tue,  6 May 2025 16:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548080; cv=none; b=KYRV4WTM/t77SsrEubAHzsC2kPUbgxbasigWnCeaNFr/QOdIdjS76h0BQNCfycB/ijs0UzFP5yuNG/a3y3uvnWh1fuftfK007Gi2+JirqprEaDPmAJ8UPmWoM10cHWCwNH7uhvUA7tbtQRvxCo5En8vVWQ069MFxoY/wvHO8vvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548080; c=relaxed/simple;
	bh=1ypU94/spMRuuaW8oUslWrYwTwesWHuCxWvGpHpQRE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRO7UDFiHkbH12+0FLCNwVXxsFUIoBDb5rrC69aWpw9b9lekcOmW08JAad3b6Ds98NHJdfSXix15A3gXFGLPYH6MpqY82OUQb0qcb8cd+GRYBQVBQE3+IWpV48m0bgQA8FN29Z7/q8eanG/v8TH/3oumeXxJAORcUO5axJldZDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVusvau3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVusvau3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A75C4CEE4;
	Tue,  6 May 2025 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548079;
	bh=1ypU94/spMRuuaW8oUslWrYwTwesWHuCxWvGpHpQRE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVusvau3SFraqt+t3mhXCGUNHZNXuR8YT1Blj/uHtNCgOPPzKoJVfXJc6RMj2k1Uj
	 LGLZRcoOlXxUdx5HBUKSOL8hr/QRS6D0CKJPEIlUIbCW+u6gygJlUSn2HOzQkponZT
	 crySLupoTkG2s2SJnC+mnn39i/3EvwQN2otljBn6qbyXoOus9GpQsPyWlzkdNDEOpM
	 yi5rdgHSiEnAYM49pNKpGWJvWSCZgLqbjpuOqNvjTe7UM8mb1id22qqH04p2wOnMVV
	 9jsdq+djbJk0uQA7WLtZWJv2+wlILDuuc0KrZB3QLzDSd2Uo3Ge0jbxha48DlsMnVh
	 ZJ2aT39tzrggw==
Date: Tue, 6 May 2025 17:14:35 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: Drop st,stm32h7-rcc.txt
Message-ID: <20250506-pavilion-untitled-4fe58ac3ea8d@spud>
References: <20250505161933.1432791-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CYQGms6AKNaAAgzh"
Content-Disposition: inline
In-Reply-To: <20250505161933.1432791-1-robh@kernel.org>


--CYQGms6AKNaAAgzh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 05, 2025 at 11:19:32AM -0500, Rob Herring (Arm) wrote:
> The binding is already covered by st,stm32-rcc.yaml.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CYQGms6AKNaAAgzh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo1agAKCRB4tDGHoIJi
0jxWAP9pzilu/jY6IaMdihNS0DPg0F+ztLgSX7uvqQmKhjOleAD+NeE9OmJMCM0r
+rVYYYXrjSJM8i8/MtW3R9duxH03fww=
=JA1k
-----END PGP SIGNATURE-----

--CYQGms6AKNaAAgzh--
