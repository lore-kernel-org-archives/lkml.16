Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE4428FAB4;
	Thu, 22 May 2025 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926565; cv=none; b=MJSW8tZZzYQb+WscIkGWHs5jruiYnHC2bEs2HS6aA+K0SDTuDA3mECmHQRcoab1LReIgmjJjekfTbV4mirR/45sHKrl2P9H+y+vafLJZZYC8g5tZBE9oXq/+HPscbl9TfwaQqEEKC7aZPjf57VpIiQfmdIVvqpKf3Fm0ajsHrBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926565; c=relaxed/simple;
	bh=yNERZMO73/n2x4Cr3aXbKcm/Td96SsAQzwu9Obt3Sp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGz2bGyw/9UbtyRLpgUMwlQMG+O38kF/FjcdoRRXEDstduQyYm5Y5FgizoefiAPBxwP4Uwyaon3mgaqfFibWffDdQNeBZJljucFYxzBRTtT0Vo8JmktqxSuYxpXUlbmFV4kasdS9DUK943pR8I0vFOcKlErluVzLxi1r8oEfW4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBnXcwo7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBnXcwo7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863F4C4CEED;
	Thu, 22 May 2025 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747926565;
	bh=yNERZMO73/n2x4Cr3aXbKcm/Td96SsAQzwu9Obt3Sp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bBnXcwo7argfurXkbp+SwxvVZQ6Z8lywmJAQcVsrNxMK6Apjxx8kzqCLD5sgeGp5F
	 7Sk0gOe+3jq7g4ok3U85JsO1gpBbbvI8IwgctaZFiRMRymPl2ZaGTPTTzs+WLQZNZk
	 meq7yvZqpLmBg1pLkVSSeHWM0aaRfo/otVLjQOlCi4lNc3BVldWIoNgKiOcdDos6Xw
	 2vdmpzGzx1wUUjThqd2Tz2EHezDSlwoPxy1eMIB7Rv3G4ju2ghJGHyRn0l3YR+qFmY
	 ZORUa0wJUcokqVut0Gze1/CJi/GMWBMZ+Xw7FCJu96C/Z3s0ma7Wtx2FmzaWafhFyv
	 T9AIuIzlv1U3w==
Message-ID: <d21e1775-d5d4-4f58-865e-0cb33d14f371@kernel.org>
Date: Thu, 22 May 2025 17:09:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: regulator: mediatek: Add MT8196 vmm
 controller
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-jh.lin@mediatek.com, singo.chang@mediatek.com,
 paul-pl.chen@mediatek.com
References: <20250522150426.3418225-1-nancy.lin@mediatek.com>
 <20250522150426.3418225-2-nancy.lin@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250522150426.3418225-2-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2025 17:03, Nancy.Lin wrote:
> From: Nancy Lin <nancy.lin@mediatek.com>
> 
> Add a device tree binding document for the MediaTek MT8196 VMM (Vcore
> for MultiMedia) regulator controller. The VMM controller acts as the
> main power supplier for multimedia power domains, such as those used
> by display, video encode and decode subsystems. It provides virtual
> regulators that serve as the power sources for various multimedia IPs,

Virtual regulators do not sound real, so feels like you want some sort
of power domains?

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> and coordinates with the hardware common clock framework (hwccf) and
> the Video Companion Processor (VCP) to manage the power domains of
> these components. The regulator is controlled by the VCP firmware,
> and the operating system signals its requirement through a voting
> hardware block (hwccf).
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> ---
>  .../mediatek,mt8196-vmm-regulator.yaml        | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml
> new file mode 100644
> index 000000000000..a50e35c2e238
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt8196-vmm-regulator.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/regulator/mediatek,mt8196-vmm-regulator.yaml#"
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 VMM (Vcore for MultiMedia) Regulator Controller
> +
> +maintainers:
> +  - Nancy Lin <nancy.lin@mediatek.com>
> +
> +description: |
> +  The MediaTek MT8196 VMM (Vcore for Multi Media) controller acts as the
> +  main power supplier for multimedia power domains, such as those used by
> +  display, video encode and decode subsystems. The VMM hardware block
> +  provides virtual regulators that serve as the power sources (suppliers)
> +  for various multimedia IPs. It coordinates with the MediaTek hardware
> +  common clock framework (HWCCF) and the Video Companion Processor (VCP)
> +  to manage the power domains of these multimedia components.
> +
> +  Each child node under the VMM node represents a virtual regulator
> +  (e.g., vdisp, vdec-vcore) and must specify a 'regulator-name'.
> +
> +properties:
> +  compatible:
> +    const: "mediatek,mt8196-vmm"

Not tested...

> +
> +  mediatek,hw-ccf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the hardware common clock framework syscon controller.

No, you cannot express clocks with syscon.

> +
> +  mediatek,vcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the Video Co-Processor (VCP) node.

For what purpose?

> +
> +patternProperties:
> +  "^(vdisp|vdec-vcore)$":

Redundant nodes, useless. Drop these completely.


> +    type: object
> +    description: |
> +      Virtual regulator for a specific multimedia domain.
> +      The node name should match the supported regulator (e.g., vdisp, vdec-vcore).
> +    properties:
> +      regulator-name:

No, you cannot start redefining properties. This binding is nowhere
close to hardware description. Looks like some copy-paste downstream
driver, so binding to fulfill driver needs.

Please rework to match hardware. I suggest reaching internally to get
some help how upstream drivers and bindings look like *prior* sending
downstream code.

Best regards,
Krzysztof
