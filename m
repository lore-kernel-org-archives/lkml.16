Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8592627F9;
	Tue, 20 May 2025 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756595; cv=none; b=trHHT1ggNsf2xizY8uNpybaVXQHJLlNF/ug0ImhbTP2Whvg9zoCKg1Z4l5R+Y1nmReIjZ9MKdUMSCXuq30E+3MEDQZizPVss8QOscXhiQ4QT1wjJsvIR4+YLgwp0Llw7iiGtAaj2UyMM2pnSj2msZJ6IbiWnujEpXMzUwg+srcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756595; c=relaxed/simple;
	bh=n1pxIM65d8MoHw115XP1NVDZAKKeEk/k6mze3yHO8s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4Xu3IcRGTMcadMrwtg/S7Va+hdsOUb2tk5f0NnqFgZu69ZQwyFCBkbW7ziWGKCtbn9OGDVor0fJ3ADTCNl7QR7gMFhkS/HQdsToRzlxLHAk2rKTad85+ysl92WtYQ+7y49+K2F3BRwkm3YIJtghkyAUFYClondHIF+cAOrgivE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7XBpT+e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7XBpT+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD3AC4CEE9;
	Tue, 20 May 2025 15:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747756593;
	bh=n1pxIM65d8MoHw115XP1NVDZAKKeEk/k6mze3yHO8s4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7XBpT+epQQjXsP8yAqN2XraGSgMh8piR5ajbSpVPDUaH4r+x5+81+SVQq34FXmTz
	 AbuW/jbx1xIcfy+2hw+gF3aWO1+lojCd/9Pg5qx4jMWLYXwPrs7mnOLTie8cmN0Z4u
	 jE6FqXRZOjuV2gQcwkuZghvDXum/x0IbticiC4VExuxfZjdDd2kZmiXHMIpZd01P4T
	 VhiHsuXI1TW4trYh99AJ5yx27EJyCESSPhDxclDQQs7LFER5PyBQRlPMd3R3aHaTaN
	 kBu5EZNwKHLlrw/eAwAZ4/3365c/87QtuEw/prjx1v9unenMntbKknWXn8GK+EBSUf
	 ags6MohDMZPGA==
Date: Tue, 20 May 2025 16:56:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: stm32: add STM32MP21 clocks and
 reset bindings
Message-ID: <20250520-absence-sixtyfold-0fd9bb03a42d@spud>
References: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
 <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jx9VuttWMZGkwh2m"
Content-Disposition: inline
In-Reply-To: <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>


--jx9VuttWMZGkwh2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 20, 2025 at 05:28:37PM +0200, Gabriel Fernandez wrote:
> +
> +  access-controllers:
> +    description: phandle to the rifsc device to check access right.
> +    items:
> +      - description: phandle to access controller
> +
> +    minItems: 1
> +    maxItems: 1

That's just maxItems: 1, the minItems is redundant.


> +    rcc: clock-controller@44200000 {

Remove the label, there's no user.

--jx9VuttWMZGkwh2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCymLAAKCRB4tDGHoIJi
0kaJAP4grAh/GT4IdIk9FDbZ3XvjNvZh5my/Az0+lUyaEjrXHwD8CskVJGC8F6if
ly0yvkmRUH6dHXpa2Y3SE/anCpfV+QQ=
=C2Ym
-----END PGP SIGNATURE-----

--jx9VuttWMZGkwh2m--
