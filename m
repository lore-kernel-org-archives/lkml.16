Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34F2186E40;
	Thu, 22 May 2025 17:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935393; cv=none; b=q372QBDpMeKXvuaoG+4hVufS8CGVV8pQSTTj9dFLONjpZqsVhwWiyeet0Olsu0phO9femIOqpYY/T1JoA8pUXZKnhHTdQ92v0L0nfIQ76IBYjGPNsaf6h4vV+U1/XAUvkkPWXvHbxya6uOXFB4z99qU77hqcJ+4CPpilt8+pyMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935393; c=relaxed/simple;
	bh=h6IKV+exwH+SnsugW1f4T3DXGUbr8ypKtFYzOAn4Ocg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuBPiJFoLamx6obqgNFQmskui0SsWCgQC3n6RJFABqGXt9F7o7Jsi16pCuO21rWL++9aBJYw8j+JvbefFCMR9U2cBDu+ho+MXukLFKqNG1p1OVr7McejnBmp925r4p0dhyQdhHZNvjji2g2o6XWesOPqxwohe72w0TV1tBDCZ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOjA/KIm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOjA/KIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AEAC4CEE4;
	Thu, 22 May 2025 17:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747935392;
	bh=h6IKV+exwH+SnsugW1f4T3DXGUbr8ypKtFYzOAn4Ocg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KOjA/KImvxaUsNdGMidxp1cmvE2SgGpnsl3a/2eQA9oL+kTxn9zTUQ7FGAKEwbXlQ
	 7cMfLAMnaswxA6SQD2u3b7YyAfNE/7tfG5viRgzSRMEryUV8gsIaVsLWW/0IGANwgA
	 sL+Gswb12F6eZd5ESO0F/CBEUCu3C5DMhLW0mPhHJtH98R102ALLyUNsk+OXWjrs/U
	 Ze2Cw6oHUMvJhmc0uRuS7VYBYreewpdSddFDiFV6MfKtZRcFIoKvRaUEzPEM9J/hWI
	 FTijBnpwulJvcDFfcu0vzirjCcro314pCYUaE2NxcDUCRJIBG6FL+pRMsmVx4xAL5B
	 X8dZ5/QdCFlFQ==
Message-ID: <ab6bfdd7-13af-4abd-94e1-25fb3d0edb1c@kernel.org>
Date: Thu, 22 May 2025 19:36:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: gnss: add u-blox,neo-9m compatible
To: alejandroe1@geotab.com, Johan Hovold <johan@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250522-ubx-m9-v2-1-6ecd470527bc@geotab.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250522-ubx-m9-v2-1-6ecd470527bc@geotab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 18:18, Alejandro Enrique via B4 Relay wrote:
> From: Alejandro Enrique <alejandroe1@geotab.com>
> 
> Add compatible for u-blox NEO-9M GPS module.
> 
> Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> ---
> This series just add the compatible string for u-blox NEO-9M module,
> using neo-m8 as fallback. I have tested the driver with such a module
> and it is working fine.
> ---
> Changes in v2:
> - Modify the binding to allow falling back to neo-m8
> - Remove compatible string from u-blox driver
> - Link to v1: https://lore.kernel.org/r/20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com
> ---
>  Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> index 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..215f8931ca08c1b0954fc2f70eabe3ec8d89edea 100644
> --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> @@ -18,10 +18,16 @@ description: >
>  
>  properties:
>    compatible:
> -    enum:
> -      - u-blox,neo-6m
> -      - u-blox,neo-8
> -      - u-blox,neo-m8
> +    oneOf:
> +      - items:

Drop items here, just enum directly.

> +          - enum:
> +              - u-blox,neo-6m
> +              - u-blox,neo-8
> +              - u-blox,neo-m8
> +

Drop blank line.

> +      - items:
> +          - const: u-blox,neo-m9
> +          - const: u-blox,neo-m8
>  
>    reg:
>      description: >
> @@ -63,3 +69,14 @@ examples:
>              reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
>          };
>      };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    serial {
> +        gnss {
> +            compatible = "u-blox,neo-m9", "u-blox,neo-m8";

No need for new example, it's the same as previous.


Best regards,
Krzysztof
