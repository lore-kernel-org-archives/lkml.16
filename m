Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC49290DA0;
	Wed,  4 Jun 2025 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045495; cv=none; b=dPN9WsM/muLCCjdWmELHHmBJsMZN7OQYACmo9BHWBxOGKiod5L6/uIr1EHhJkk1JCFDiR7pkcvehiAp78/VfXJBwxmmPJAFEaSdnwHSu1rMft7kU8f5EwOBXpQ+Vw2w7ssF7Phof0ldviVucBYBN4JVe/T9lSBTxJbSJLZEJLGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045495; c=relaxed/simple;
	bh=Bqg4UfN3rwgsslMdb/hy9V7kMIKcpgx0adtAHnyJeUs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cYkFOOmJlh1q2YpDvQDA3i3Y8hdc1jUCD5I4wdoZ/+o8nGkKS0Bfm3zZy0X9GR0nm15dJY20l5FTKnZz7IqkNSwj4ubuV5p7vSqQQVA+0piy9VewXPDdzRumHFVshgacOIRIIQwJxDmdFPWCatJ64s6vFjt+igwB+fJjsUcNe60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tg77kAut; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tg77kAut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53EAC4CEE7;
	Wed,  4 Jun 2025 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749045495;
	bh=Bqg4UfN3rwgsslMdb/hy9V7kMIKcpgx0adtAHnyJeUs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tg77kAutQJ/i6IUyrsf2GE8fEIsvU219l2sdKoIoRAC6JETM9rVTYIV68AW2dBrcW
	 nqnVR35PKl1LR08tz56gg+2vlOb6jQKagLUbN5oSLccDBz3rTM+0xMq0LzCAZ4zdKN
	 /ntFtovHrpxFd6VhG+x+/cNPsCtvMFhMvx1/lKQBCSZOLBR7xO+z7Jpu6YQLT4ZndJ
	 baaqSOUPtLwPRjFRf6KRqAYqT9BWWsIS7z/4JowUzsxjc5K9YD0NAO3jRyTSZYxofX
	 JGh/7z4z/eOyspMzW3sHy5LLClo5pho5ySsFsUaJ6JtJEDBIcFyV/HwLX5tu+Z9fnC
	 cs78vQ2MfZicg==
Date: Wed, 04 Jun 2025 08:58:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, kristo@kernel.org, 
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, r-donadkar@ti.com, 
 linux-kernel@vger.kernel.org, vigneshr@ti.com, nm@ti.com, 
 devicetree@vger.kernel.org
To: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20250604104656.38752-1-j-choudhary@ti.com>
References: <20250604104656.38752-1-j-choudhary@ti.com>
Message-Id: <174904540135.3869675.422953390616565367.robh@kernel.org>
Subject: Re: [PATCH 0/3] Enable audio support for J721S2-EVM


On Wed, 04 Jun 2025 16:16:53 +0530, Jayesh Choudhary wrote:
> These 3 patches add the support to enable audio on J721S2-EVM.
> 
> This required the i2c-mux support[0] which is now in linux tree.
> 
> Now, this series ***depends upon only one dts change[1]*** to ensure there
> are no dtbs_check warnings (no functional issues):
> "ti,j721e-system-controller.yaml" refers to "ti,am654-ehrpwm-tbclk.yaml"
> for clock-controller nodes, but for audio we need "ti,am62-audio-refclk".
> When scm_conf is "simple-bus", there are no such warnings.
> 
> Test log: https://gist.github.com/Jayesh2000/840c19ef8f9b7f0f75dedd015ccbf98a
> 
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0fc829dbde9bf1f349631c677a85e08782037ecf
> [1]: https://lore.kernel.org/all/20250603095609.33569-4-j-choudhary@ti.com/
> 
> 
> Jayesh Choudhary (3):
>   arm64: dts: ti: k3-j721s2-main: Add McASP nodes
>   arm64: dts: ti: k3-j721s2-main: Add audio_refclk node
>   arm64: dts: ti: k3-j721s2-common-proc-board: Enable analog audio
>     support
> 
>  .../dts/ti/k3-j721s2-common-proc-board.dts    | 131 ++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  99 +++++++++++++
>  2 files changed, 230 insertions(+)
> 
> --
> 2.34.1
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
 Base: tags/next-20250604 (best guess, 1/2 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250604104656.38752-1-j-choudhary@ti.com:

arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:#clock-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:compatible:0: 'ti,am62-audio-refclk' is not one of ['ti,am654-ehrpwm-tbclk', 'ti,am64-epwm-tbclk', 'ti,am62-epwm-tbclk']
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:#clock-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:compatible:0: 'ti,am62-audio-refclk' is not one of ['ti,am654-ehrpwm-tbclk', 'ti,am64-epwm-tbclk', 'ti,am62-epwm-tbclk']
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4: 'assigned-clock-parents', 'assigned-clocks', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:#clock-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@104000 (ti,j721e-system-controller): clock-controller@42e4:compatible:0: 'ti,am62-audio-refclk' is not one of ['ti,am654-ehrpwm-tbclk', 'ti,am64-epwm-tbclk', 'ti,am62-epwm-tbclk']
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml#





