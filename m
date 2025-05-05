Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FD625D90D;
	Mon,  5 May 2025 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456252; cv=none; b=AnEfKVsjW9sEwNHR24baRbUpdON6OJaH9m5YBI4B+LzDz4669jxfPtxL4yeDskRy3VE2FbexKbdT74/t2v4rvk7qr/pr8i3tSjWTtAkwllgVXbohSy3nFHQNd4SeppxBskr8tMyxP+d59i4BFGT1dV++71QDuOcoGbkxbi7WdIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456252; c=relaxed/simple;
	bh=vkzC9zv68KsWIrMeAfc6iXVzA8iO3cgRRySvwrwTtVI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=s/seTd2YUOxJchkMk4IRukIv3k9ixGjLsQHqEEN3ZkOmZwWEYagt1AaVSqrQ8rULnz3hnRUkHGWRmzzOLqdB9zOb/xbRwMcg09fnk4wMauk6sYo0pLk8Pc+nwgn3Be+Y9bNv5pRd/MzPGfZPen2hvSrmklfQTRMMHBw7kATrq6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJBFrTr8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJBFrTr8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F22C4CEF0;
	Mon,  5 May 2025 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456251;
	bh=vkzC9zv68KsWIrMeAfc6iXVzA8iO3cgRRySvwrwTtVI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AJBFrTr8gRuydAYqiTXhh0btD+lTuqY2jzFE3q1LbzL+Kff56DrNpOwwjBJXJZebl
	 OFsbjEIhFh0Rwqumqr+6lKj3l8ggzeY7mC8pziOk+hLvibCM6ya40ueCcpjQYBbT+B
	 sFbdPeXh945g/Ema75fQGhpi6S1xN1mFFik1PK+9R4sHnF8jzZznStJqYH72yRfbMZ
	 mvrBXfl1BNVl/HG8sePzywo8sFBtR0xNqwY5T9X2+9YlSrMpqYQTng5O6DnKrJz7uu
	 2LBpJsaJnsUuwdAvJBfqRzx+TGV/zZrHrf9XUgGNQGZvlDIAaRou/QcyAKHZV3dvvZ
	 2PhUqqpgJfn9A==
Date: Mon, 05 May 2025 09:44:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, wenst@chromium.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
To: Sirius Wang <sirius.wang@mediatek.com>
In-Reply-To: <20250505121627.3944728-1-sirius.wang@mediatek.com>
References: <20250505121627.3944728-1-sirius.wang@mediatek.com>
Message-Id: <174645594319.1246809.14814085003624998764.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add mt8189 dts evaluation board and Mafefile


On Mon, 05 May 2025 20:15:44 +0800, Sirius Wang wrote:
> MT8189 is a SoC based on 64bit ARMv8 architecture. It contains 6 CA55
> and 2 CA78 cores. MT8189 share many HW IP with MT8188 series.
> 
> We add basic chip support for MediaTek MT8189 on evaluation board.
> 
> In this series, we also add dt-bindings document definition for MT8189.
> 
> Sirius Wang (2):
>   WIP: dt-bindings: arm: Add compatible for MediaTek MT8189
>   WIP: arm64: dts: mt8189: Add mt8189 dts evaluation board and Mafefile
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   4 +
>  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>  arch/arm64/boot/dts/mediatek/mt8189-evb.dts   |  20 +
>  arch/arm64/boot/dts/mediatek/mt8189.dtsi      | 441 ++++++++++++++++++
>  4 files changed, 466 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8189.dtsi
> 
> --
> 2.45.2
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250505 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250505121627.3944728-1-sirius.wang@mediatek.com:

arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: / (mediatek,mt8189-evb): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824, 0, 3221225472]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: idle-states: 'clusteroff-b', 'clusteroff-l', 'clusteroff-m', 'cpuoff-b', 'cpuoff-l', 'cpuoff-m', 'mcusysoff-b', 'mcusysoff-l', 'mcusysoff-m', 's2idle', 'system-vcore' do not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: idle-states: entry-method:0: 'psci' was expected
	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
arch/arm64/boot/dts/mediatek/mt8189-evb.dtb: serial@11001000 (mediatek,mt6577-uart): Unevaluated properties are not allowed ('uart-line' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/mediatek,uart.yaml#





