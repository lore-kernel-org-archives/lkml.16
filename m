Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB4D18DB20;
	Thu,  3 Apr 2025 06:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662433; cv=none; b=k/QRABpCKB97Yi7po3PxmTkxZb5WmlxMzGc9ZzE2uN12WlD6Qu+qeAGhsinNewS6FORX+mVIvK36k7VBfPVtFOhRxDv5ik6EyEFCM1rUnfQYHQibJuCEioYB0zupZ19XGE0mTkDEUArXDBHmJzs+jFuHiLfG+jT7ILWy68qZq1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662433; c=relaxed/simple;
	bh=zq+3fMG2WfTVwYbK2Hp/ChQGKq4YepyOfpKgfVGzbIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdllZBw2aJlpI1O2YMPEn7lvaEl/jgZJmoSdIJc1sYUsGiJOz/TYDHlmtBgOHRz+O3be5mkUN1MEZ14ToWkVtWFgNYrIx1JU404BETorPqa1EKjjtgPRYyBOspZDZDaVg3Vb9hsUUHt0MVs9V7yJ0wzTFK7iCbSx0ufMvbRmPkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvEAX5al; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvEAX5al"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2726C4CEE3;
	Thu,  3 Apr 2025 06:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743662432;
	bh=zq+3fMG2WfTVwYbK2Hp/ChQGKq4YepyOfpKgfVGzbIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvEAX5alJ0pyklEN+W+WVFvswzDVLyXfkkWN9Uegofk47NUJAr+LkOoSw5+vW94Ta
	 sxruJitJVTOVhVUtSIwGAQAG4uRth4nFdYVQb0MqTou9+I/KeYQeoVmFM6JKw35WUe
	 b9pzU27cge0w+Bh5D6sK60Wm3E8iJ+PdrDfzXRvGNXetPn23eESjMA+mhHPgkMq4s0
	 rUocnnJ1VDA8iwznZQ1qUG4QSv9lsKUQu8YpbtFuTKg/l22AJlhKYnVZKaTEvYDLit
	 O3gX/bOHnU0vM3snDSS8RUdJbAZHfvKjQnDzFb+FuEWKqNhYjtTC9ATnqrO7k/sdcz
	 BjqdbsGdf6hYw==
Date: Thu, 3 Apr 2025 08:40:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] regulator: dt-bindings: adi,adp5055-regulator:
 Add adp5055 support
Message-ID: <20250403-unselfish-thoughtful-wallaby-ccd38e@krzk-bin>
References: <20250403-upstream-adp5055-v3-0-8eb170f4f94e@analog.com>
 <20250403-upstream-adp5055-v3-1-8eb170f4f94e@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403-upstream-adp5055-v3-1-8eb170f4f94e@analog.com>

On Thu, Apr 03, 2025 at 10:43:10AM +0800, Alexis Czezar Torreno wrote:
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^buck[0-2]$":

If there is going to be new version, use consistent quotes, either " or '

...

> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false

> +      adi,fast-transient:
> +        description:
> +          Configures the fast transient sensitivity for each regulator.
> +          "none"    - No fast transient.
> +          "3G_1.5%" - 1.5% window with 3*350uA/V
> +          "5G_1.5%" - 1.5% window with 5*350uA/V
> +          "5G_2.5%" - 2.5% window with 5*350uA/V
> +        enum: [none, 3G_1.5%, 5G_1.5%, 5G_2.5%]
> +        default: 5G_2.5

Missing percent:
5G_2.5%

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

