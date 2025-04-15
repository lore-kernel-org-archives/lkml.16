Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B832066F7;
	Tue, 15 Apr 2025 15:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731257; cv=none; b=tb2A4WiT+KRkNDEGx+Yk/RZbhy7f+YTpNVTkgZXG4nsYx3Aav/gPvkNbZtyI6AQTwOfFYNMyDBQIv+4dDOnQjaqSlK6l1LUMEFXOdeM18CnpfKCnDYHBJtzs3DVj7n3PQmNdW62Oj5l+Am6MEUsnQsYm5OzYZQQtjqAA7HrS2tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731257; c=relaxed/simple;
	bh=cpqtdMgP4pXsa/EYlUpj/7STbyGdrcFn3fsprhqFbKM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qlO9V8S6lEb/JN2zSF0MQABYq8+WYqzLrP8HZe0nNA+bF/InDz07OaA4R1pSGklNmeT3cWg3BSL/NaxEMgF/dVIqRR7WS6vpXBx3CU8H2evw0uRBVim7S4ugnmTS2ZynvDf6XKEmExGrlqG41LfmypaSVg4ACNrvmJPZVGeqlFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Last2mY7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Last2mY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF4AC4CEEC;
	Tue, 15 Apr 2025 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731256;
	bh=cpqtdMgP4pXsa/EYlUpj/7STbyGdrcFn3fsprhqFbKM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Last2mY7nOCCfKDpbUTfU2HNd42ZOhle2TyyuZnwCrtU+hM0tI5VFPEBV2ArdtUPv
	 gs0qgGBN4T3I4C4mVt/955WwZiMuKIRBCzKX5E12koWMev3zu0CQ8fFIg8hlO0aVKk
	 E0dNnvIOUkHLx8aqPoH557bWQ3O1orD18SHFIwXATQxl3WrAyWIXAwZ5beLZVIGect
	 SLi7OunkCFMctAcHcNk1OE5eG7QU0Ni7OLUqbZw/wXXAsuaY32b7jnge8MWEQHWaea
	 88XpzhgqKHT5Iw1nLh00MNRF34DRXORMqJPHzRbkS8xvZcjRHAF2tuBFnCfKle4PMC
	 3687B/yfm2DdA==
Date: Tue, 15 Apr 2025 10:34:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?utf-8?q?=C5=81ukasz_Czechowski?= <lukasz.czechowski@thaumatec.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org
To: Quentin Schulz <foss+kernel@0leil.net>
In-Reply-To: <20250415-dt-binding-usb-device-compatibles-v1-1-90f3cff32aa0@cherry.de>
References: <20250415-dt-binding-usb-device-compatibles-v1-1-90f3cff32aa0@cherry.de>
Message-Id: <174473125440.400068.8321160690827825721.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: allow multiple
 compatibles


On Tue, 15 Apr 2025 16:34:27 +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The dt-core typically allows multiple compatibles[1] but usb-device
> currently forces a single compatible.
> 
> This is an issue when multiple devices with slightly different productID
> all behave the same. This would require the driver to keep updating its
> compatible matching table and the bindings to include this new productID
> instead of doing what is usually done: have two compatibles, the
> leftmost which matches exactly the HW device definition, and the
> rightmost one as a fallback which is assumed to be 100% compatible with
> the device at hand. If this assumption turns out to be wrong, it is easy
> to work around this without having to modify the device tree by handling
> the leftmost compatible in the driver.
> 
> [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/dt-core.yaml#L21-L25
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> This came up while working on fixing USB on an RK3399 Puma which has an
> onboard USB hub whose productID isn't in any driver compatible list
> but which can be supported by a driver with a slightly different
> productID matching another variant of the same IC, from the same
> datasheet.
> 
> See https://lore.kernel.org/linux-rockchip/20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com/
> ---
>  Documentation/devicetree/bindings/usb/usb-device.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/usb-device.yaml: properties:compatible:items: {'pattern': '^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$'} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250415-dt-binding-usb-device-compatibles-v1-1-90f3cff32aa0@cherry.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

