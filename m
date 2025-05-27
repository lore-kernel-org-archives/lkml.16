Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4779B3C2F;
	Tue, 27 May 2025 06:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748326736; cv=none; b=IEfB+EAgy9r0f1gytZRuWbKw3iLepyYyTwc7iKUZQelUSWqaQ3lmBJQKphgSViHsXqadOjIMqae3gttxbZonaZiyw3pt1aZhZsdb+4ck3rR8a3boexITTnONcErYRxyJu7DtTs34oXIfrx11hixYXT3jCq+J8GQkalEeZRX5fxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748326736; c=relaxed/simple;
	bh=09RqvVHkA4jz4eqLTGLvP2nGn8NGNbT2uJ9xt+xPbgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aduvCDOJqmzqkm5dcK3DRQ6DjIDGwq7ap+BVjQmFdbxXv9tod6ke3ehZLhB0HO6FhyTXGRAdziIWuiSFOYExfqTR+ht2kBLJxdq5U9jLyHdGuL9HNF/BnBe7ShORsKnwUZ+Jv2w5qbeL2IcgrQ1Bf3IXiWqU+Dr5aawloHz8uqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvbMzv+9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvbMzv+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186E7C4CEEA;
	Tue, 27 May 2025 06:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748326735;
	bh=09RqvVHkA4jz4eqLTGLvP2nGn8NGNbT2uJ9xt+xPbgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvbMzv+9U3ltIoMS75HV/Cn+Oy84J48Vg5O9JYfY2q5pQTMrfBUtInCeZcnp2Yre+
	 M4eeTGet1CugFz0f1/5yg60jgwYK0eSo75GBgjbtcb35fXQ9xPsbUzUA9o1BD352+0
	 AExg/8UAV90R/XqLlDMFmhvevijgRV1MzzDHJ3ryTMTncVD8BfG55uWJ61ZKKtpt94
	 XLqfJrZbi7UL1XCeqoeEBmuH0Fnl3V3WLkXcYrdqpy4yesPeymDrBRgh3uDz2stfls
	 83tfIgbs8Wea/GgJb2eq/oGFs/QQSTRTmklq1HG9YVA6Wz2UcfEsnz+D0WUvU0p6Uh
	 FQ8l9H0RE+sDw==
Date: Tue, 27 May 2025 08:18:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: interrupt-controller: Add
 arm,armv7m-nvic and fix #interrupt-cells
Message-ID: <20250527-olive-kakapo-of-action-a8d68a@kuoka>
References: <20250523143637.536759-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250523143637.536759-1-Frank.Li@nxp.com>

On Fri, May 23, 2025 at 10:36:36AM GMT, Frank Li wrote:
> According to existed dts arch/arm/boot/dts/armv7-m.dtsi, compatible string

and drivers... more important btw.

> should be arm,armv7m-nvic, #interrupt-cells is 1 and
> arm,num-irq-priority-bits is optional property.
> 
> Fix below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /interrupt-controller@e000e100:
>     failed to match any schema with compatible: ['arm,armv7m-nvic']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/interrupt-controller/arm,nvic.yaml  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
> index d89eca956c5fa..a08632804d052 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
> @@ -17,6 +17,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - arm,armv7m-nvic
>        - arm,v6m-nvic
>        - arm,v7m-nvic

You need to drop (or deprecate if it is used) old compatible.

Best regards,
Krzysztof

