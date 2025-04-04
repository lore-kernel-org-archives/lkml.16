Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E192550DC;
	Fri,  4 Apr 2025 19:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795728; cv=none; b=l/rG9q8eXKYB2loaMGveDnWdne5wDUQXASDafI8xxPnAcLHjJYWMrRlQCOJgoKF+GFyyTgVhNhYb2weJyRxgZT6a7SASzX9LHojeSg4G9y+/AuCrnnJCABNyVYNYVuunK25VlHM7mFED70fKvUiJ+wAouIaSr8fnHFVykN303gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795728; c=relaxed/simple;
	bh=4bmtkJ0tkqMxxZGgS50lINazr5//yxL3K8KgkYu4BS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WffbCjyPlNy5NQfmtjGuFOydSWdAPiddFO4I4iU2+/byQ5+T8sLjgk+WAIIkKdhpFdVqaFc5DnD+yE33ntUjA1w26D4qx1TfxhVQNqDxh2i6bFx7A5ef6cicPNmhMzf/mjZwTxHNC6u1yi+w64UXxABHb2nmjMmo4X2mzqX2nqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rk4v5oqR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rk4v5oqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EB9C4CEDD;
	Fri,  4 Apr 2025 19:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743795727;
	bh=4bmtkJ0tkqMxxZGgS50lINazr5//yxL3K8KgkYu4BS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rk4v5oqR6TrOKM5QrN48yy6A7HJaKuu8yhkiLIAU3aQaNRyBYcrCtGLkShsOr84DC
	 l7TI/Vf07wyepQSag3eP3naek1Ha/K0iHRdNGisbIk1UtknuffVGz5OPBHC2KazJg+
	 q4hIlOLXPsrMezNfRo+bSzx62nUR8AXRWodAxyuQhD/qUXO348YFd8xBmpI4HXqU53
	 Yip1Pyz99n007p7H+EGI12RAC5eXVZBz59JoTyWMACZ+EpPMIqLjQ4Qrw8wcX4SJQk
	 xYAnsdEi0OaFYuRUqjEZxYlXLJ2jZm+gGeSDix5HpKAz5nndflI6tOO4oFowaHpW4e
	 b07cl89H7o22Q==
Date: Fri, 4 Apr 2025 14:42:06 -0500
From: Rob Herring <robh@kernel.org>
To: Sukrut Bellary <sbellary@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: clock: ti: add ti,autoidle.yaml
 reference
Message-ID: <20250404194206.GA171263-robh@kernel.org>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-5-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404014500.2789830-5-sbellary@baylibre.com>

On Thu, Apr 03, 2025 at 06:45:00PM -0700, Sukrut Bellary wrote:
> ti,divider-clock uses properties from ti,autoidle.
> 
> As we are converting autoidle binding to ti,autoidle.yaml,
> fix the reference here.
> 
> Add dual license.

Do you have rights to do so?

> 
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> ---
>  .../bindings/clock/ti/ti,divider-clock.yaml   | 24 ++++---------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> index 3fbe236eb565..aba879ae302d 100644
> --- a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> @@ -1,4 +1,4 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
> @@ -55,9 +55,10 @@ description: |
>    is missing it is the same as supplying a zero shift.
>  
>    This binding can also optionally provide support to the hardware autoidle
> -  feature, see [1].
> +  feature.
>  
> -  [1] Documentation/devicetree/bindings/clock/ti/autoidle.txt
> +allOf:
> +  - $ref: /schemas/clock/ti/ti,autoidle.yaml#
>  
>  properties:
>    compatible:
> @@ -97,7 +98,6 @@ properties:
>      minimum: 1
>      default: 1
>  
> -
>    ti,max-div:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -116,20 +116,6 @@ properties:
>        valid divisor programming must be a power of two,
>        only valid if ti,dividers is not defined.
>  
> -  ti,autoidle-shift:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -    description:
> -      bit shift of the autoidle enable bit for the clock,
> -      see [1].
> -    maximum: 31
> -    default: 0
> -
> -  ti,invert-autoidle-bit:
> -    type: boolean
> -    description:
> -      autoidle is enabled by setting the bit to 0,
> -      see [1]
> -
>    ti,set-rate-parent:
>      type: boolean
>      description:
> @@ -156,7 +142,7 @@ required:
>    - clocks
>    - reg
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.34.1
> 
