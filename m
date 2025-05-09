Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3462367B1;
	Fri,  9 May 2025 16:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806981; cv=none; b=Opp37p2/7SSjO2P/3Y0s5t2SRTNg/rCV/ggVQ5cvbeytq5cT5I+tfbMDSTFY7NpvMG3zvdxIaf9GLU1MnmNXJOFtTqnHkj59u1/WYHXTIG/ilXhfjIMptPzmzMJ9N7atPwWcoxjDeRkfhH1x+dVn9MCktLNydY2J+X+qz4fvhWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806981; c=relaxed/simple;
	bh=UKE+0RPXtg1WdCPj4nwbiF1vj2IOeaeA5oRzi512CWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o68Mq+K5qw5R06f/ij7RHTwSOJmKVXkbo5eNZ1LeWZuiOpnG8rFhMC9J6KukHnJk1hEHAl9cVz5QXfrAg/2VWNkscDwtIGwUgkPnMhZWp5UOI5H0jzaWhJcxjFhhfRvgYIB3oYZ3WpQbZwjg7XeiWazm9Br7yrTIqdu9ckEPUvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPC0FmTZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPC0FmTZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE49C4CEE4;
	Fri,  9 May 2025 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746806981;
	bh=UKE+0RPXtg1WdCPj4nwbiF1vj2IOeaeA5oRzi512CWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPC0FmTZSPv2FVwCNKrUkVSSIOAQb7ciEg/NJH3r0zJToSXmZ25/70zo6e5/IUVfD
	 DNBL5akw+oun8/VLTLGtgv0kRXgc6K1lvfFwpwu57oNjXohFlLXy+RVAQj80QpTYNY
	 8iwuCW9VBpaMlzDurbxlWpXmpmRDn6ecCB4jI2gxrZl1pSGPlpRzJ3E1xYDKyV76up
	 Hqo/Gstiq+dfpc36GbisWa/nxSUyL7eKSrJSQhE4UdJD8cjyIKOEOfSIZR7NnFS3pR
	 PQihPX1gc/8KhHD5CfgAvAQ3IUBj1G5uR+VTVChdK9jcpJdEmwlLsKWl5cLtLkgEhs
	 z/trChP54b+JQ==
Date: Fri, 9 May 2025 17:09:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: add Amlogic T7 PLL clock
 controller
Message-ID: <20250509-straddle-parish-92306b78486b@spud>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
 <20250509074825.1933254-2-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0Fuzjvst7gC5JW8H"
Content-Disposition: inline
In-Reply-To: <20250509074825.1933254-2-jian.hu@amlogic.com>


--0Fuzjvst7gC5JW8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 07:48:19AM +0000, Jian Hu wrote:
> Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.
>=20
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Looks like Rob's comments got resolved,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--0Fuzjvst7gC5JW8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaB4ovwAKCRB4tDGHoIJi
0r1NAP9mZrXhZY6WXko9PL6fkCqKeL/fwtgoQwBt3GzCJr/9MQD+LeFD+itCESb7
ZGtjYJ+O87BFn1X8MeYi+O4FZ6CYMw8=
=bC3h
-----END PGP SIGNATURE-----

--0Fuzjvst7gC5JW8H--
