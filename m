Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF8F253F21;
	Mon,  7 Apr 2025 13:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032020; cv=none; b=hLoeeL+nwKQVTZQwNPyp58VbS+5DTUpIqdQxw1eSc9LlJISwvcNP/163NI2G+sJhELOVNpqywYKi5BhmsOM3y0BzCzF1oLZvbbAQ0ddrsD+LXrYsFikbq9aXvEhzyxzuBbrCOosFA+8KRRfOdFwHw5JaqwbJTsIyj7ghh4SiNF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032020; c=relaxed/simple;
	bh=filjrS06rqZ0ew/T3d0sXhHExTLXZr6chgbI6OChQmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKDGKNFMpXP4ncYVXavxyBXHsnMcZ5MfTjco9YSCuRw2fdYckqkh3nUDQUsLVrVcOWT16zjjm3y7VzLyR/f8dHR8vqYygqoDoPKGw3+ecJzX4/WDMMJFx62IyVgbfcpM2LsmEbTr0GYGTKKROpjzCq3j+kCTN6rCwYjmRPOyuA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/yNomVj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/yNomVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A3DC4CEDD;
	Mon,  7 Apr 2025 13:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744032018;
	bh=filjrS06rqZ0ew/T3d0sXhHExTLXZr6chgbI6OChQmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a/yNomVjn7s86TOYejdygiH1sC/wzPEjFMGUQTb/FZ1Kp1Zl0AskZHojDh37MF9rp
	 bVsVNviFb0fNioBtNNKl5Qq8c/9wspSr2td0bwJyaguUsxdPW8ZTbkSYFWHsNnULib
	 01PqflKsNQuGb9+g2G9hcOCuB0TGRF6VvkQUFTm/lIwh0C4bC7bHqAOJ3wGtx1wf7q
	 rOYYVwDiq0EggDefaSeE+ksRKj8pXAEa7P/EpyGfDGwPHJ5wP2rh557lUjvSKWXXwr
	 iGVB64MxsWkbcKf2kU90a2BQ/ypR1cygnM95c4lcfUjQr/mciUjN+twBapFbDRWUqA
	 NuJP3LfCJg5Pg==
Message-ID: <74bb9d27-fd6f-4332-9965-e967c3a31c63@kernel.org>
Date: Mon, 7 Apr 2025 15:20:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo
 PHY
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-2-bf0bcc41c9ba@whut.edu.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-2-bf0bcc41c9ba@whut.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/04/2025 14:38, Ze Huang wrote:
> Introduce support for SpacemiT K1 PCIe/USB3 combo PHY controller.
> 
> PCIe portA and USB3 controller share this phy, only one of them can work
> at any given application scenario.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../bindings/phy/spacemit,k1-combphy.yaml          | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..450157b65410b27129603ea1f3523776a1b0a75e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/spacemit,k1-combphy.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/spacemit,k1-combphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Spacemit K1 PCIe/USB3 PHY
> +
> +maintainers:
> +  - Ze Huang <huangze@whut.edu.cn>
> +
> +description:
> +  Combo PHY on SpacemiT K1 SoC.PCIe port A and USB3 controller share this
> +  phy, only one of PCIe port A and USB3 port can work at any given application
> +  scenario.
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-combphy
> +
> +  reg:
> +    maxItems: 2

List and describe the items instead

> +
> +  reg-names:
> +    items:
> +      - const: phy_ctrl

drop phy_

> +      - const: phy_sel

ditto

> +
> +  resets:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1

What is the cell argument?

Also no supplies?

> 


Best regards,
Krzysztof
