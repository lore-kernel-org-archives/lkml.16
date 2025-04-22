Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237DD280CC8;
	Tue, 22 Apr 2025 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328367; cv=none; b=rgO0eyZguj92MMg//AKLp7X/bDiICq0sZfQfpq3FBvLfu0odUwjt3fzVtmDJwzS5iC4rbb0E2gsWbfF+5MeYP3SuTtRfRMNJbAB4o9SgbVWOQ3lPeKxlCbKdNLaEn/DOUk6SANiB4SlnqNXqaIT9495hQwWZL7j1uRYrQsxMtsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328367; c=relaxed/simple;
	bh=k1Y/qetGti0rkyMy0rwXscAFL19+dI0z8OoONtOmPwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhoEx+4xsf2X7QtckH4gHodObtTLe5cY+wO0yyh0qgxWH70xIdIiy6oDtlQbbxC1ufmhhcP7WsWU+Lj54RkwkPSje3OSGVhewg5etMvTMsTcYpg4aI1+zhNYjYcz6LWxilQwO3Pa9OhRO6a0xP5v60v+2T0qWX/bLLeSci+S81k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRoPxL1r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRoPxL1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63221C4CEEA;
	Tue, 22 Apr 2025 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745328364;
	bh=k1Y/qetGti0rkyMy0rwXscAFL19+dI0z8OoONtOmPwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BRoPxL1rZNp2I0cNOt/WXMF79Sfz9fXXdLZ9+SIi30qVR0DLZ5ZszYg1b8G1KcA9M
	 0zeA8piZi3WIBK8q/qtbWj1FMIj8mEN9OEkkqhRQpxER0kJxiJk47jj6iWqxvqEPsj
	 FcNSMQPS0b2VK+al6eCYjzR2dQXdTw5gTfk83dE2EU+8MMl6F642BK5Px/F84/bnxy
	 Dun2NDDqpvx4ZzLeVw7blWt0GTw55ZKCqO5L9M4MnDHgr3NBQP0rIQ2bNIZlicEauS
	 qkWyA6E4nfDErN4wcoZCyFEX8LWuryzVlWFjH78IqG5/B/Hwt4T2IRj1I4bJFEUfLg
	 a6zoqSNQZ2w0A==
Date: Tue, 22 Apr 2025 08:26:02 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ti,tmp102: document optional V+
 supply property
Message-ID: <20250422132602.GA1092156-robh@kernel.org>
References: <20250417180426.3872314-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417180426.3872314-1-peter@korsgaard.com>

On Thu, Apr 17, 2025 at 08:04:25PM +0200, Peter Korsgaard wrote:
> TMP102 is powered by its V+ supply, document it. The property is called
> "vcc-supply" since the plus sign (+) is not a valid property character.

Wouldn't "vplus-supply" or "vp-supply" work?

> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
> index 7e5b62a0215dd..4c89448eba0dc 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
> @@ -23,6 +23,9 @@ properties:
>    "#thermal-sensor-cells":
>      const: 1
>  
> +  vcc-supply:
> +    description: Power supply for tmp102
> +
>  required:
>    - compatible
>    - reg
> @@ -42,6 +45,7 @@ examples:
>              reg = <0x48>;
>              interrupt-parent = <&gpio7>;
>              interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> +            vcc-supply = <&supply>;
>              #thermal-sensor-cells = <1>;
>          };
>      };
> -- 
> 2.39.5
> 
