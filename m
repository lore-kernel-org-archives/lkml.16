Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7B41E3DF2;
	Mon,  9 Jun 2025 08:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749457430; cv=none; b=s8enJdTpew8IgXWHX02hd9mHNJrg0p48reiNl86PDBkeIV2AeHHaMxTbPlNk89BLWd0+QOllZlU3zKHN6ZifmNd07IGpT6kiDDMlYpSSN3zR7pk8VauPV5f1s/yagxzERfOdafDk5r5uqLPro723+qQB00JeMPatkGxH5tzXE0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749457430; c=relaxed/simple;
	bh=aldj5xYyjzQWxK3ondhGvy0kNJNEb5k7X1O4cKIaPgY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hwe5EDFKAWPN9AgEVx2+BNgG7OE9281TYHjcS9u9w7yqwLIG5+FH7tKhc1MMb/WPXfYyItkH1MeC34H27LoQu+S9rSsnjOwfeUcoiMWrRx8sWUm27l8WV48WHCkjFbWrMRvF6Mb5cQtO10RFkiTiDKruSuumKCVRcbLdAuJoBq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LAwvyavX; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LAwvyavX"
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 42400582021;
	Mon,  9 Jun 2025 08:02:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C57764333B;
	Mon,  9 Jun 2025 08:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749456113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWMslWGSvoXsYcCfEH9wUjkx8wd0acfIMyXXSa7t8/4=;
	b=LAwvyavXcxrHqdfx592VzTiRYZDjiiyHOItXX+9IsLrxlfW16mH7AVND/ggJfFdVKDFlOq
	bUrvazCd7FNsk229JN28YMyUqU37OSzPFoj0I5D1tEkkQhu2tS9j0D8mnEi5PUqTufcJ9n
	3sPYSsaFjm/lYW/Dk7DC6+8pECqM9ojyI/O4WJOoTrhJZQ1lzGrmnV6Su2ZNL6SEaKaLJf
	q3Kl0tt4/jmisbzbrkdgeftjk9z7sS9LC4d10luDgabF44arG/dqXPhFYn2T6XzpDVOwhF
	Y/HWoZI1P15beL58qYOo5Uo2tpQ9rXKkWYdAzemAFISi52473WMEVCO66+ST1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,  Kishon Vijay Abraham I
 <kishon@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-phy@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: Convert marvell,comphy-cp110 to DT
 schema
In-Reply-To: <20250607212605.743176-1-robh@kernel.org> (Rob Herring's message
	of "Sat, 7 Jun 2025 16:26:03 -0500")
References: <20250607212605.743176-1-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 09 Jun 2025 10:01:50 +0200
Message-ID: <87ikl51gy9.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeltdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkihhshhhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhphhihsehlihhsthhsrdhinhhfr
 hgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Rob,

Thanks for the conversion.

On 07/06/2025 at 16:26:03 -05, "Rob Herring (Arm)" <robh@kernel.org> wrote:

> Convert the Marvell CP110 combo PHY binding to DT schema format. It's a
> straight forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

[...]

> +properties:
> +  compatible:
> +    enum:
> +      - marvell,comphy-cp110
> +      - marvell,comphy-a3700
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Generic COMPHY registers

Would you mind to add "(Armada 7k/8k)" here? This information was in the
description and got lost. Armada 7k/8k had (IIRC) a number of
Application Processors and Co-Processors, it might not be
straightforward to guess what "cp110" means to people not familiar with
Marvell naming otherwise?

> +      - description: Lane 1 (PCIe/GbE) registers (Armada 3700)
> +      - description: Lane 0 (USB3/GbE) registers (Armada 3700)
> +      - description: Lane 2 (SATA/USB3) registers (Armada 3700)
> +
> +  reg-names:
> +    minItems: 1

minItems should probably be 4 as it is only required (and mandatory) for
the marvell,comphy-a3700 compatible? I do not think we intended to ask
for a reg-names property when there was just one entry (see
armada-cp11x.dtsi).

> +    items:
> +      - const: comphy
> +      - const: lane1_pcie_gbe
> +      - const: lane0_usb3_gbe
> +      - const: lane2_sata_usb3
> +
> +  '#address-cells':
> +    const: 1

Should be required?

> +
> +  '#size-cells':
> +    const: 0

Should be required as well?

> +
> +  clocks:
> +    maxItems: 3
> +    description: Reference clocks for CP110; MG clock, MG Core clock, AX=
I clock
> +
> +  clock-names:
> +    items:
> +      - const: mg_clk
> +      - const: mg_core_clk
> +      - const: axi_clk
> +
> +  marvell,system-controller:
> +    description: Phandle to the Marvell system controller (CP110 only)
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +patternProperties:
> +  '^phy@[0-2]$':

Technically, these nodes are also mandatory, I don't remember if we can
mark them as such in the "required" section though.

> +    description: A COMPHY lane child node
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        description: COMPHY lane number
> +
> +      '#phy-cells':
> +        const: 1
> +
> +    required:
> +      - reg
> +      - '#phy-cells'
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

Thanks,
Miqu=C3=A8l
