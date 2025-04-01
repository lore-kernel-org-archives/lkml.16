Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55321D8A10;
	Tue,  1 Apr 2025 06:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743487999; cv=none; b=Eeb6YzX3qdEkbd3ShPVO0ko+V/rwWi8pR+x1/pat6d3IH07B+CVjIT3b49x0UIcxD85MSHaBRtJ7jTzxt1r8KFzX64XKT/UgYj54GDFDwoW2peJszwNKECtxcSfqA+AxGRR9vBGNi/+0Eh6g5mL1Ef0pSxyE4YINRHPqJYFP0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743487999; c=relaxed/simple;
	bh=+7e7yU5H/NuIchhcMj3L76DexybYnv4KBiK/p47KTFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFQ6+C+l+QR9BvqSjqAFl6uCpEcBt40AZKb2eNgrKSPl91qPKDQ6ZECEp+/jwUTFNpbjaGW9Pian0zsiLD0kB3ZDjQoYb5cZD4YyvJz9fJ1gT2nqTN21QhoSujdLgJqnp+X2lsxgKhprD/QbTrHNw5w5OV9UAeWJ2aiCtrbGEJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2nJTj8j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2nJTj8j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40883C4CEEA;
	Tue,  1 Apr 2025 06:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743487998;
	bh=+7e7yU5H/NuIchhcMj3L76DexybYnv4KBiK/p47KTFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2nJTj8j0OYgv+n+pbSS90uOlMOWhZMmOiL6k94nbzgmiq6XLYo14Gx+wFu6rbOxA
	 1BPkVTI4F87e9Olz3mPQzqRrGBHNVE95YGGXqVCiIghjJH3Xf963efwPVuh9VrwROc
	 YUgntKp07i5NnTtQx4/zpm6KUOij1V3asEH05gX32efQrbLEqnzYR+6aviGU6JxNMr
	 ECGmPuaUu/6GOGPqIE+bZU8voAqvK1ecg+biZbxUDrbqczwtHSta4ZdahfBQf9FwwT
	 OTiylc7HXoFUBTo5+mx5INLcf+QLffhl9C9/LRm6EtnUfHNWS74Y3aCMGTHZaGvlq2
	 ZcXf9Ug2D4tFA==
Date: Tue, 1 Apr 2025 08:13:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Farouk Bouabid <farouk.bouabid@cherry.de>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: amc6821: add fan and PWM
 output
Message-ID: <20250401-boisterous-teal-bison-533b01@krzk-bin>
References: <20250331155229.147879-1-francesco@dolcini.it>
 <20250331155229.147879-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250331155229.147879-2-francesco@dolcini.it>

On Mon, Mar 31, 2025 at 05:52:28PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add properties to describe the fan and the PWM controller output.
> 
> Link: https://www.ti.com/lit/gpn/amc6821
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v3:
>  - explicitly describe the fan, use standard PWM and FAN bindings
>  - pwm.yaml cannot be referenced, because of the $nodename pattern that is
>    enforced there
> v2: https://lore.kernel.org/all/20250224180801.128685-2-francesco@dolcini.it/
>  - no changes
> v1: https://lore.kernel.org/all/20250218165633.106867-2-francesco@dolcini.it/
> ---
>  .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> index 5d33f1a23d03..94aca9c378e6 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> @@ -28,6 +28,13 @@ properties:
>    i2c-mux:
>      type: object
>  
> +  fan:
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false

Why do you need the child, instead of referencing fan-common in the top
level?

Best regards,
Krzysztof

