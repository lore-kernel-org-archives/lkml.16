Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693AA7485;
	Fri,  4 Apr 2025 10:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743763591; cv=none; b=E8SkJjLSxIXkdoS0y6N3LP6wl4hGl4UCT3a4SDbtWP4DBndnvpR+gFnE9qqyrJldNISIRXbJn72txXWN52botadhy+6mNMm2ccfC3i+GIZpZPkp151Y95cEBTjwzLl+Hi1F3uhRHvEiHuayuTwyKH+aqRbtDzKIgz3/NzKjZkHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743763591; c=relaxed/simple;
	bh=3IO+zfldDM8piydemhzVywsi9TuDxbhhUONjscTHv5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLCKknw72+vV47SQaa+XVJe+EmkQd+kdJ4LLK2kTbraR6LTGBKOX1Md2WdJp9AbMX5V77j5y4gtOfIeluf4XKDmzZrz15WK0iLQBjJ0UqfksP1vyH5bhMQGPZ4PMkjbjeXz1eCUIdBC5Jvotx4ht43I/Yk547dliKC7Ei+L5TCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WzR7Seko; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzR7Seko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C848C4CEDD;
	Fri,  4 Apr 2025 10:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743763590;
	bh=3IO+zfldDM8piydemhzVywsi9TuDxbhhUONjscTHv5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WzR7SekoWAMQxBqTVkP944qa9r0NJ4oLMuHgB05Ku4AgLDIpm/qeAC2Rqxd42F3Hs
	 IhHcJ41Fo4ZKEcl7l55k7gtqUzXE+Qh4iV6JvCgf8lqZKUF7rNOpM7FevM4NSh6c4w
	 yFDDsmB6G0QyP9btt8em9FynkuV9zVjgNkRTsnZxRCcY5AzoEuxh3ho5TIBrm+Uehg
	 G80ObbGy5neHmgRM8x718z+bncKLKEBPSOeyw3YZMDuSyN9X8ai9GAXJQ78BHOCiwi
	 pp1S4cD9odvpEvS9OoqsHPPHSaq1tjIep0aVcUG0pMxyFRx6EFkkJvgWEAknRv61u7
	 c1fE1Ezo9kZ9A==
Date: Fri, 4 Apr 2025 12:46:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sukrut Bellary <sbellary@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tero Kristo <kristo@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <20250404-tangible-reindeer-of-penetration-ae9ca3@shite>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-3-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404014500.2789830-3-sbellary@baylibre.com>

On Thu, Apr 03, 2025 at 06:44:58PM GMT, Sukrut Bellary wrote:
> +maintainers:
> +  - Tero Kristo <kristo@kernel.org>
> +  - Sukrut Bellary <sbellary@baylibre.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Every clock on TI SoC belongs to one clockdomain. For specific clocks, the
> +  parent clockdomain has to be controlled when the clock is enabled/disabled.
> +  This binding doesn't define a new clock binding type, it is used to group
> +  the existing clock nodes under hardware hierarchy.
> +
> +properties:
> +  compatible:
> +    const: ti,clockdomain
> +
> +  clocks:
> +    description:
> +      Clocks within this domain

Missing constraints.

> +
> +required:
> +  - compatible
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    l3init_clkdm: l3init_clkdm {

Follow DTS coding style. Also drop unused label.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "ti,clockdomain";
> +        clocks = <&dpll_usb_ck>;
> +    };
> -- 
> 2.34.1
> 
