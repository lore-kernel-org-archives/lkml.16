Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DD32557C;
	Mon,  7 Apr 2025 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033872; cv=none; b=fvTomc7Agv2277Kw71gVZJqC0mHJrX0GcREyYq4ce7WiHmKdoNqqpcxOK8FAFtG4G3Im9hZNY0Tav9DRmHUEtxJkS9jDExIhWvYHlwUjtED1mGObzr6XhSra08wYy2q34qLiCKdUbDYRmahEhgNT6zdjI/WlVwSjt10C4ePQHCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033872; c=relaxed/simple;
	bh=/4UbHHj3ELGJgxeyuvL3Ow2/535NK31HYifR4a3PlBs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=n2weSyWOFJ/0+KrXn0RUL4DeWKeVAcG1qdKwiJM03fGjN/qz2637d+r+reDWjufQ7d2HbO8bDedGezjisOEjbiSsz1z5luE7CCpmS6XDj4coEetyds062uYksyTt7MEGl0CIBaYdE8Yh3DIkiLAGiHFk6VPH6F7jlqN54hWy/rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHOGmumx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHOGmumx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E29C4CEDD;
	Mon,  7 Apr 2025 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033872;
	bh=/4UbHHj3ELGJgxeyuvL3Ow2/535NK31HYifR4a3PlBs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FHOGmumxpjPbtEi02dw/UrPdWcSj6OgVNu6Z8djsSYXGGSTMmRhcgg5/PykumAhsv
	 APr0UaT7wm3hFEbsV1rDGljw+MBpEUbbrbEWzeS9Yna+/e/uZyh53/K2YsaaygIFYR
	 2vE5s10Pyfnd+64WVGjRoz1X/CDgBdwa6w5Z8es7NCv1mkOeLJF51nNQkHqjlnwYb1
	 p5on6oAEc+pP3a04MEjATgKT7y6GrmmLJ48YopCT25JZFz5qoGSUhX/+EB8waTwp7x
	 JuqjPRCX7JL4Kq9Docq7y/FtN3nm96Q/s37qiegOdSnj50bF1yqu+sqkrE+MQXkI0y
	 eiPqC1t9YA/Ow==
Date: Mon, 07 Apr 2025 08:51:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
To: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <20250407-b4-k1-usb3-v3-2-v1-3-bf0bcc41c9ba@whut.edu.cn>
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-3-bf0bcc41c9ba@whut.edu.cn>
Message-Id: <174403387085.2155711.16403180293126338183.robh@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: usb: add SpacemiT K1 DWC3 glue


On Mon, 07 Apr 2025 20:38:48 +0800, Ze Huang wrote:
> Add support for SpacemiT DWC3 glue driver, which manages interrupt,
> reset and clock resource.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.example.dtb: usb@c0a00000 (spacemit,k1-dwc3): '#address-cells', '#size-cells' do not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.example.dtb: usb@c0a00000 (spacemit,k1-dwc3): usb@0:reg: [[0, 0], [0, 65536]] is too long
	from schema $id: http://devicetree.org/schemas/usb/spacemit,k1-dwc3.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.example.dtb: usb@0 (snps,dwc3): reg: [[0, 0], [0, 65536]] is too long
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250407-b4-k1-usb3-v3-2-v1-3-bf0bcc41c9ba@whut.edu.cn

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

