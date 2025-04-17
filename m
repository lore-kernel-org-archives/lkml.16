Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82D321ADAB;
	Thu, 17 Apr 2025 06:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872999; cv=none; b=aQW0ssbGP+lm7cY8lMDwS0weBr6KXKNQHutkBgOwVeOWlqpJBK2nx4rCaM2Haow0xiDTNi2gZj4V7PAL8TEmkbcfpsvTpSxgWA/63ovQkn2kGIi6kGesbsW+jRQ38jUS8+92mrlcBZGEZnnzqsl4TlykfIasjDbYVelqY+StK6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872999; c=relaxed/simple;
	bh=94/KX2GjYz2N9JAPsojJnUJAFMOUlgKCxSZ0WjvUW3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVByRMi6KbS9wT5rZpO+j27Aq4ec2+vMRp0E7rcnAJEaYESARyWRGZpCLlqueqmUApexDtVZ3lwQoI6u5+23khbPlTs0Q2EFRHfUq0JEUy3LvIzp+SGozrid2NWQHqMMXzX1WWGu3499ZhuZhG023UW6fQ+5lvT2t2wjdyzG9u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4A/dWYg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4A/dWYg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A849AC4CEE4;
	Thu, 17 Apr 2025 06:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744872999;
	bh=94/KX2GjYz2N9JAPsojJnUJAFMOUlgKCxSZ0WjvUW3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L4A/dWYgQVaFF1cTdRfhNl24mWuQxLEvXEtyA0czyDEkhtUJSnjW/tS4CI1kJNW00
	 WBaLlNHRV4cBVJQeAeUTym8syOtJcfHhHt1xLJX9L8hhWqTrMtH+sU2gLK5XSN8xB3
	 qY9T8bYvVI0BekjB2AFX2TzWBZkZ6HheCBk9C1VNO6IPVStuJkqKirM7QfNmAWpt7j
	 sLakMk4HmpXnA6IYGt5QBNN92bO95JeFkjSA1xvPFgkt1S+Lm1R/xDym74k1OAHSwV
	 AK6CK/leK/qAtkmHHAdUce4k6ylABcAt2ro/d1/jUf1q4XlY8gDMmDW5Rz8F21/kAH
	 wIxCGjq8y5JFg==
Date: Thu, 17 Apr 2025 08:56:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Wunderlich <frank-w@public-files.de>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Daniel Golle <daniel@makrotopia.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 4/8] dt-bindings: phy: mtk-xs-phy: support type switch
 by pericfg
Message-ID: <20250417-competent-rattlesnake-of-intensity-98d6ff@kuoka>
References: <20250416095402.90543-1-linux@fw-web.de>
 <20250416095402.90543-5-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250416095402.90543-5-linux@fw-web.de>

On Wed, Apr 16, 2025 at 11:53:56AM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add support for type switch by pericfg register between USB3/PCIe.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/phy/mediatek,xsphy.yaml  | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> index 3b5253659e6f..5033d77c1239 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> @@ -151,6 +151,22 @@ patternProperties:
>          minimum: 1
>          maximum: 31
>  
> +      mediatek,syscon-type:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        maxItems: 1
> +        description:
> +          A phandle to syscon used to access the register of type switch,
> +          the field should always be 3 cells long.
> +        items:
> +          items:

Missing -, because you have one phandle.

> +            - description:
> +                The first cell represents a phandle to syscon

Don't repeat constraints in free form text. "Foo bar system controller"
or "Phandle to foo bar system controller"

> +            - description:
> +                The second cell represents the register offset

"Baz register offset"

> +            - description:
> +                The third cell represents the index of config segment

"Index of config segment", but what is index of config?

Best regards,
Krzysztof

