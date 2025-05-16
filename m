Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FE622F77D;
	Fri, 16 May 2025 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389387; cv=none; b=O3k/qlkO4ist8jk00lHz2o66jDfHYtiA+ETsr+wt0pBfYjm/XtXcpuFsGkuvjow+QzXNq6ydMZZmeHTZBdO7/gAVce7+AlZ6/i0DwXn8bSnWl5a63YLn5FXZqnKpsiiCo6Ki/A5UO0tYTJWWIDRV7wpKJIPni+Tnwvqr8kNdBL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389387; c=relaxed/simple;
	bh=6qeyCCT7zpD3fvBMzDh5PQih0K0gpp9zF5Ci9QuAQKU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=j6zqHdszEPoKWDOsLD1oNfh74L9VvYip1pyfB1iX9GyHR/rzhC3jxt3lTSahjGO7uNlVCTLI8lVX8bBEiOFx6IZ94trFku+zLRwjR7paFJ3quzjAAfyW4XbCqFRAAUCBO360YCXitVbx+Q8X+T6I7yJjRF0tqi1hXyAOjlGDbbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQaiVqgc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQaiVqgc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FFDC4CEE4;
	Fri, 16 May 2025 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747389387;
	bh=6qeyCCT7zpD3fvBMzDh5PQih0K0gpp9zF5Ci9QuAQKU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OQaiVqgcB4Yu1+5FQF3O+JYdhQOUxOL6ue+z9lgTS/63FWdwt5JKcjGthvKHTelL5
	 TYjZ2XGort85qrI+rPdUCj8Q3qSh/keXgZA3DHr11CyS0Bq29vB3m4+gJej5K7FMbe
	 Itl5Wkwu4n+sUioWXy+vOpUpbqq7AFlRRAYuLJfcqsowHRpiojOwyWTlnA44AHzH/I
	 dE2nIpCf5drU842wxWPDW4iZpBQAztXf7VHzLBgclkDOunJJ579HZJLYmRT+N0bWaW
	 rPUzRJtCNGFz0uDL6VS1Z7UOASHz6QpDPbHytF6TmyuPT+R9c3Y8Bs7yjGfEWHtnjC
	 jbZDXoW9puzpQ==
Date: Fri, 16 May 2025 04:56:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-clk@vger.kernel.org, Tero Kristo <kristo@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
To: Sukrut Bellary <sbellary@baylibre.com>
In-Reply-To: <20250516081612.767559-2-sbellary@baylibre.com>
References: <20250516081612.767559-1-sbellary@baylibre.com>
 <20250516081612.767559-2-sbellary@baylibre.com>
Message-Id: <174738938517.2667160.10906175729020548648.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: ti: Convert autoidle
 binding to yaml


On Fri, 16 May 2025 01:16:10 -0700, Sukrut Bellary wrote:
> Autoidle clock is not an individual clock; it is always a derivate of some
> basic clock like a gate, divider, or fixed-factor. This binding will be
> referred in ti,divider-clock.yaml, and ti,fixed-factor-clock.yaml.
> 
> As all clocks don't support the autoidle feature e.g.,
> in DRA77xx/AM57xx[1], dpll_abe_x2* and dpll_per_x2 don't have
> autoidle, remove required properties from the binding.
> 
> Add the creator of the original binding as a maintainer.
> 
> [1] https://www.ti.com/lit/ug/spruhz6l/spruhz6l.pdf
> 
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> ---
>  .../devicetree/bindings/clock/ti/autoidle.txt | 37 -------------------
>  .../bindings/clock/ti/ti,autoidle.yaml        | 34 +++++++++++++++++
>  2 files changed, 34 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/autoidle.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,autoidle.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/autoidle.txt
Warning: Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/autoidle.txt
Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt: Documentation/devicetree/bindings/clock/ti/autoidle.txt
Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml: Documentation/devicetree/bindings/clock/ti/autoidle.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250516081612.767559-2-sbellary@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

