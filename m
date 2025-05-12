Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1510A2957D7;
	Mon, 12 May 2025 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054178; cv=none; b=A/qF7oYjFGxF0g2t0m/ESIFovvzSlKGKcSWrwqbfePz9sSkWjYG7S0PnNQ3uJIZYhER6GET7BBfd8mK+R3CYZ5Gla15piAHeKJ9aM87HlW5pSxqyfdLzXojglWVV7QlLkJryY71ieTqpvHefgMWzcDh+fyUcyB9L3E9CuWtRv+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054178; c=relaxed/simple;
	bh=o1Ftsk8pL/ELU+aKC2nlKGbc/m58+uTJvARxDuGr90E=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fRfFzEnzW8VW51rTc3cu6v3S366s4QxV0fiEo+bT5fk7JoHvZ/xfWRVg4sOpVdOBuftInufYm8ZhcdNf5+rsEvdTro64fmdwiqtWLP9oezKUrCsmCu9282zA2PsXffCN5jWWinitwXPK6oTm55xTBxwjOrgsiyLtfSZlhFrJnsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXzdVXtk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXzdVXtk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6A7C4CEE7;
	Mon, 12 May 2025 12:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747054177;
	bh=o1Ftsk8pL/ELU+aKC2nlKGbc/m58+uTJvARxDuGr90E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZXzdVXtkuahx+QyOaEDWjKB19k7AJi6y1gN2ybZbouHUNSCBIuKFHxvM+DFXhK2Vq
	 sKAotgMioy80FVwnBE3ckSV/fBaa9jHJgZUab/XoVdtQs584I6Y56EMhWI5BX7Stsa
	 RrOnzApRaPZ3c3DoLde7Yj/0XgTqWzPSBg7ylOMe8NYbkLMBXu87xRNd2NjkoFO6Vs
	 TT4NQzFqjidBQLCvhNP42wJ6bmpVFXRMS/q8XUPR4HNT/NgPCN6OgBJXugZQIRn2eh
	 7wumfI/F0VONMJNhhjGXHAXj2VMGvHaXv1ck8uquPMFEzou9riy5MGoIVBUq/iHuKd
	 7GUrOI4Q8m0KA==
Date: Mon, 12 May 2025 07:49:36 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, R <rqou@berkeley.edu>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-kernel@vger.kernel.org
To: Sven Peter <sven@svenpeter.dev>
In-Reply-To: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
Message-Id: <174705404483.2941395.9971423828224597027.robh@kernel.org>
Subject: Re: [PATCH 0/7] Support exposing bits of any byte as NVMEM cells


On Sat, 10 May 2025 07:44:40 +0000, Sven Peter wrote:
> Hi,
> 
> I'm preparing USB3 support for Apple Silicon Macs for upstreaming right
> now and this series is the first dependency. The Type-C PHY requires
> configuration values encoded in fuses for which we already have a
> driver.
> Unfortunately, the fuses on these machines are only accessibly as 32bit
> words but the Type-C PHY configuration values are individual bits which
> are sometimes spread across multiple fuses.
> Right now this is not supported by the nvmem core which only allows a
> subset of bits within the first byte to be exposed as a nvmem cell. This
> small series adds support for exposing arbitrary bits as nvmem cells.
> 
> The second part of the series then adds the nvmem cells required for the
> Type-C PHY to our device trees. While it's technically independent I've
> included those changes in this series for context.
> 
> Best,
> 
> Sven
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> Janne Grunau (2):
>       Revert "nvmem: core: Print error on wrong bits DT property"
>       arm64: dts: apple: t8112: Add eFuses node
> 
> R (1):
>       arm64: dts: apple: t600x: Add eFuses node
> 
> Sven Peter (4):
>       nvmem: core: allow bit offset > 8
>       nvmem: core: round up to word_size
>       dt-bindings: nvmem: apple: Add T8112 compatible
>       arm64: dts: apple: t8103: Add eFuses node
> 
>  .../devicetree/bindings/nvmem/apple,efuses.yaml    |   1 +
>  arch/arm64/boot/dts/apple/t600x-dieX.dtsi          | 187 +++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi               | 102 +++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  97 +++++++++++
>  drivers/nvmem/core.c                               |  24 +--
>  5 files changed, 401 insertions(+), 10 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250508-nvmem-dt-de1a1842e883
> 
> Best regards,
> --
> Sven Peter <sven@svenpeter.dev>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 0af2f6be1b4281385b618cb86ad946eded089ac8

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/apple/' for 20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev:

arch/arm64/boot/dts/apple/t8103-j313.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t8112-j493.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t8112-j413.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t6000-j314s.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t6002-j375d.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t8103-j293.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t6002-j375d.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t8103-j457.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t8103-j456.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t8112-j473.dtb: efuse@23d2c8000 (apple,t8112-efuses): Unevaluated properties are not allowed ('efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t6001-j314c.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t6001-j375c.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t6001-j316c.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t8103-j274.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
arch/arm64/boot/dts/apple/t6000-j316s.dtb: efuse@2922bc000 (apple,t6000-efuses): Unevaluated properties are not allowed ('efuse@a10,22', 'efuse@a10,25', 'efuse@a10,27', 'efuse@a10,30', 'efuse@a14,11', 'efuse@a14,17', 'efuse@a14,19', 'efuse@a18,10', 'efuse@a18,15', 'efuse@a18,21', 'efuse@a18,27', 'efuse@a18,29', 'efuse@a18,8', 'efuse@a1c,10', 'efuse@a1c,13', 'efuse@a1c,15', 'efuse@a1c,18', 'efuse@a1c,20', 'efuse@a1c,25', 'efuse@a1c,31', 'efuse@a20,20', 'efuse@a20,23', 'efuse@a20,25', 'efuse@a20,28', 'efuse@a20,30', 'efuse@a24,15', 'efuse@a24,17', 'efuse@a24,9' were unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#





