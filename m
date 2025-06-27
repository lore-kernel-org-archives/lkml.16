Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AEC3C01;
	Fri, 27 Jun 2025 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011252; cv=none; b=AkuNRAInHco4bBn+n+nzkMNvLmPoXf0qE7L6yA7iPXRuVU/jWkqFhlL+2lPJObbXfK2KyODOPErdsm7EEl5Hiz3OAAZUyYnzoRVNSdJSPK/Iow+nOvy1yR1nwOKBlu56AnTeyqLBo6gMGGXEhr9mZSiYICZgsKPDJXiBy2zCHto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011252; c=relaxed/simple;
	bh=1J0iFmJfdbb7rPJXIZol2KN7AY5npkF+GT3DXoaZ6s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2eVWOu7HgoqAAzypoB5YCBxWIHLQ4Sq/pPJ3KQuo7G9lwMcYFHC1YclwpCCuviojWnaXjvEInOQDkoneo56n1VIR13yyC8JkKsbOeIJ000cEDTf2T1wQhofprd7SiNX3nwzk2VUDqZIIYBhFr5p28D5WYbP1B7qQI3wHiVY9BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRgGIkjY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRgGIkjY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBA0C4CEE3;
	Fri, 27 Jun 2025 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751011252;
	bh=1J0iFmJfdbb7rPJXIZol2KN7AY5npkF+GT3DXoaZ6s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRgGIkjY7woIXbTyo6yaJMLwIqLPb0x9b0ciJULzeN6nhTn+jdkkGvoM5kv1OZ+tq
	 xLSfyQzG0oFt9hg/+xey/AIBIAFkwVFym+IoCHIQJzpz7D4VLJFnKt94b8XsONDJow
	 Q/4OIKrvMJNDIuxw4IyDrsAJxK2hIzS0nhnutw2Lea7tHlg20GMR+PmPBn1UjuhW0s
	 1teGqyA4U5HyHml4tMnP55TCQEkVTC15u7gaHcWKweEzo/IOb08vaxlRftGYrq2Cwy
	 ekLd1Z3bmNbuOf9v2TrAOa+7QRl6ne1z+7JZOwLek8QT5nNb1J+460kes30cyHK+LP
	 t5+Qp5ux8Reng==
Date: Fri, 27 Jun 2025 10:00:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] dt-bindings: clock: airoha: Document support
 for AN7583 clock
Message-ID: <20250627-courageous-pheasant-of-advance-ec7a18@krzk-bin>
References: <20250617130455.32682-1-ansuelsmth@gmail.com>
 <20250617130455.32682-10-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617130455.32682-10-ansuelsmth@gmail.com>

On Tue, Jun 17, 2025 at 03:04:52PM +0200, Christian Marangi wrote:
> Document support for Airoha AN7583 clock. This is based on the EN7523
> clock schema with the new requirement of the "airoha,chip-scu"
> (previously optional for EN7581).
> 
> Add additional binding for additional clock and reset lines.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     |  9 +++
>  include/dt-bindings/clock/en7523-clk.h        |  3 +
>  .../dt-bindings/reset/airoha,an7583-reset.h   | 61 +++++++++++++++++++
>  3 files changed, 73 insertions(+)
>  create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index bce77a14c938..be9759b86fdc 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -32,6 +32,7 @@ properties:
>        - enum:
>            - airoha,en7523-scu
>            - airoha,en7581-scu
> +          - airoha,an7583-scu
>  
>    reg:
>      items:
> @@ -82,6 +83,14 @@ allOf:
>          reg:
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          const: airoha,an7583-scu
> +    then:
> +      required:
> +        - airoha,chip-scu

Not really. SCU does not need phandle to SCU.

Best regards,
Krzysztof

