Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597A1624FE;
	Thu, 19 Jun 2025 07:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318929; cv=none; b=IcwLfcO7tA1Oy3fFZBHnmNdta43t3AdgcSOwXvo4SPCM5GU4a4Nbm2As18fMq8G+gPMrkNpQCIJx0bLlOiiGqVV0O5tM6sz/GD2LuyKRlzgqsi8bovrnJFKyvTB//ss62dZMWx1SMIsY7dE4wFOQ6xqZYGbPh6ohc9rK0fgmMFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318929; c=relaxed/simple;
	bh=JS9XHw+PeP81VV63507B4fUmB28qpg71AUHMCfdVdTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VysXzQvEx5iq7eL8hcpAWNnIKywMw6tN2dDmVHaf/QfDoSo+h/Jc9WwYzL/CHfA0y3YauQcq7lJS//WwUJ3sQaqK4lRiVhlkZAxrnRDbnCQV6aD0u9/2gnmVuNoQ6k3GLChKBEiFo9DeF4+Pi5oAQ1G0gvXLSBsgSul+QK15eTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4qh+box; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4qh+box"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E29C4CEF2;
	Thu, 19 Jun 2025 07:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750318929;
	bh=JS9XHw+PeP81VV63507B4fUmB28qpg71AUHMCfdVdTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4qh+boxQGWWBKicSQkt8ZyfPpLZpGLAElmdv4xvq1UGkzVSuthur+LPgyjVHK0sO
	 nZZ4LcH0dxuqxrgcgGLV9OzL5JuXmXaoiwK8MsBECb0i3yT6O+eGpIh+jp0iryXTH8
	 YBzFwz+4hQ5wP+h99lEj5Sd/gzaR+9c/E3RVfsdV2jVfs78tgbXD4k1OAbdng5UOsd
	 AGQaWMVFNfpriM08HEB6OFm4qicoCJri/VByaRlTmIkhaWzRjPy9D9G2G3xsCWAPsh
	 bmTKhsWd3BtkL8m9gk7YQzUlFIFYHpFM8gQE2kMiwwYg/W3jOScdYantSWAaYsi25n
	 ZpEC4Z1sy+61w==
Date: Thu, 19 Jun 2025 09:42:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, 
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v5 3/4] dt-bindings: clock: cdce6214: add binding for pin
 configuration
Message-ID: <20250619-arboreal-jaguarundi-of-passion-a2eaa1@kuoka>
References: <20250618-clk-cdce6214-v5-0-9938b8ed0b94@pengutronix.de>
 <20250618-clk-cdce6214-v5-3-9938b8ed0b94@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250618-clk-cdce6214-v5-3-9938b8ed0b94@pengutronix.de>

On Wed, Jun 18, 2025 at 11:21:14AM GMT, Sascha Hauer wrote:
> Add pin configuration binding for the TI CDCE6214. The CDCE6214 has
> an internal EEPROM to to fully configure the chip, but this EEPROM
> might be empty, so add support for configuring the chip through
> the device tree.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/clock/ti,cdce6214.yaml     | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)


This should be part of previous patch. Bindings should be complete, not
added in partial sets.

Best regards,
Krzysztof

