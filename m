Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FFD1DA62E;
	Mon, 31 Mar 2025 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743427964; cv=none; b=GkhrdibK7eQ9atDvkEZT+2a6iMYbBvRE5nqX0H/DfXa4JkuvE8Cvs+Fy33/GBM48bAu8/w6z25nfTFYcPmjScxUIjdP1oEiyk4l/nit0E/iUFXaG9qgTTKFD1ZyXvUQdml83YKf9XBglNFqGnre0gxqWb4G9CsZYvXuhAaLxz2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743427964; c=relaxed/simple;
	bh=/lgLZPuxiweVn5v5ms1kIG4weriLChhI1yLLxFdQFkQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mD131TDIhnMNeWTeyKWJ2CbKbDPjqj/YazDNLRnVxC3WRVrf3Gadhz6c0tUSQ8n7NG2LA5+KzsSq9sGKFGDfWwWe7YNZ+PqW3G/OiOk4ugfsfDg3jrcPgUNNNyyS9iHCOyTii693qtSHbi80qwRr34kXFfc97ktPzKwcfUHdOFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqXIbSe1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqXIbSe1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF23C4CEE3;
	Mon, 31 Mar 2025 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743427963;
	bh=/lgLZPuxiweVn5v5ms1kIG4weriLChhI1yLLxFdQFkQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qqXIbSe1IqWEFV4QJicIu9v3qtoS0zEtopDvEYE/eKPC7JuFYO1ofC82kpyPvBqQ6
	 By9qPtC/0psX/JW0yYtuAGXwmPIoyDDG0FwTelITStOmCeJ2LvZ76wwmpyBg5fO6Mq
	 OkBr7yBY+BuumMkYIEN11vTC9Ah6/awXL6Ylf7471sUR+lsPWdPk+K1LTIGL+98eUV
	 t1RyXjb0swRoCcvDa/bG8/1EmRsFjxThewpkOa5pYE4blS1tvCaJH6rL1wVsNJEsY+
	 k25FTkgCF2heMno2m/8B4pMrrrXRvWCNS9Up6CmuSEY91YbwJt7/wWAoC/ThKhROTq
	 krlygGt6bDXjQ==
Date: Mon, 31 Mar 2025 08:32:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250330143254.3159519-1-christianshewitt@gmail.com>
References: <20250330143254.3159519-1-christianshewitt@gmail.com>
Message-Id: <174342765349.2641741.12813558256280243493.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: amlogic: gxlx-s905l-p271: add saradc
 compatible


On Sun, 30 Mar 2025 14:32:54 +0000, Christian Hewitt wrote:
> Add the saradac node using the meson-gxlx-saradc compatible to ensure
> MPLL clocks are poked and audio output is enabled on the p271 (S905L)
> board.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> The meson-gxlx-saradc compatible is now merged via the IIO tree, see [0].
> 
> [0] https://patchwork.kernel.org/project/linux-amlogic/cover/20250330101922.1942169-1-martin.blumenstingl@googlemail.com/
> 
>  arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts | 4 ++++
>  1 file changed, 4 insertions(+)
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250328 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250330143254.3159519-1-christianshewitt@gmail.com:

arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: adc@8680: compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,meson-gxlx-saradc', 'amlogic,meson-saradc'] is too long
	'amlogic,meson-saradc' was expected
	'amlogic,meson-gxlx-saradc' is not one of ['amlogic,meson8-saradc', 'amlogic,meson8b-saradc', 'amlogic,meson8m2-saradc', 'amlogic,meson-gxbb-saradc', 'amlogic,meson-gxl-saradc', 'amlogic,meson-gxm-saradc', 'amlogic,meson-axg-saradc', 'amlogic,meson-g12a-saradc']
	from schema $id: http://devicetree.org/schemas/iio/adc/amlogic,meson-saradc.yaml#
arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: /soc/bus@c1100000/adc@8680: failed to match any schema with compatible: ['amlogic,meson-gxlx-saradc', 'amlogic,meson-saradc']





