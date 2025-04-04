Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7A5B672;
	Fri,  4 Apr 2025 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743763482; cv=none; b=KaeV3xd5f8DGcDSQrl6GRpe8ciPHVftOGP91SaTZeZfZb0rZpxuGy7GP295JzXL93zNtvCDe2lV5MlSzuEoou0gYaPYl5+QSNcbAW+K4X1X/9BRf9+P2d6m52Nt16rCKVu7NotAcRF+d0HMR/pgHiVEZ6aZsaIY/Z07b+yQov1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743763482; c=relaxed/simple;
	bh=KcCjhQu5pmSWlhfcZAtR5zn8A30gei3qyyiiiKA2nYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvghaulbH0XhaeNvgdjs7QH02GVFbRuZWUw8atLmxC9NMBvc9HKGKJScJ8i/omfiCEMtBksK4C2SELrV7PDVQhwT6tyGRRywyxoRPe1QMRnWuDy1JBGxskqhWCHpx/Dhfv8rH04UHgMPoSIe1QuLsyeHejN64Cp40TYyiLmxWGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aj50uN2D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aj50uN2D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE68C4CEDD;
	Fri,  4 Apr 2025 10:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743763482;
	bh=KcCjhQu5pmSWlhfcZAtR5zn8A30gei3qyyiiiKA2nYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aj50uN2DaDndKL9CPMYyYLutx8KAHNx5yWa3jrIIBPCgUfYZuseXtqUus9XtKs6wv
	 dZBYGIxL/kQZ5DiKJuo1xpywX4lyGuOR3qgbKV33unMQ6HtDF7RQbiYt4LEtzL337Y
	 crwezevI8N98UbleuO4+Te9nelQyRj+bT64U+l7xy8bG0zxsSLA4ZkZw0dcLRMLFJL
	 Mpz4CPURmUJ7tmPXe2wyJefgLntQWj9OThwzJSqJtuJXza0dJv1Whelpx30hhGLYwv
	 QoHr7O8p9Wp+BSfu/GG722ThdBxBxa7C92M3WYdDI7MRDoT3uEHiPkYv5bpOc1xfT4
	 aGYw9ZPYXKupA==
Date: Fri, 4 Apr 2025 12:44:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sukrut Bellary <sbellary@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tero Kristo <kristo@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <20250404-famous-rottweiler-of-perspective-e5dcbc@shite>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-2-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404014500.2789830-2-sbellary@baylibre.com>

On Thu, Apr 03, 2025 at 06:44:57PM GMT, Sukrut Bellary wrote:
> +properties:
> +  reg:
> +    maxItems: 1

How reg is part of this? Every clock has reg, doesn't it? Otherwise how
do you control it? Drop.

> +
> +  ti,autoidle-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      bit shift of the autoidle enable bit for the clock
> +    maximum: 31
> +    default: 0
> +
> +  ti,invert-autoidle-bit:
> +    type: boolean
> +    description:
> +      autoidle is enabled by setting the bit to 0

required:
  - ti,autoidle-shift
  - ti,invert-autoidle-bit - although this makes no sense, so probably
old binding was not correct here

> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    bus {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      clock@1b4 {
> +        reg = <0x01b4>;
> +        ti,autoidle-shift = <8>;
> +        ti,invert-autoidle-bit;
> +      };

Drop example, pointless here - noop due to lack of compatible. Instead
provide complete examples in schemas referencing this.

> +    };
> -- 
> 2.34.1
> 
