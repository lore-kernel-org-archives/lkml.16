Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE9E1A3029;
	Wed, 23 Apr 2025 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415462; cv=none; b=CgVcgQiP//+ASIYMQTLGLsnWN9rPLmqTMZrNA406+kmuQ2vpr+GBtrcP5mGdZV4/YTfPWUocxUPoWtNc9g1F4TjNBSn82VtXaQRQt4NhMH+C7DaLItQ5HuAxBy2I87z/bgJxWJi3A7Ouh0ZDpVyn47H4nW8KIrt/1+D1h8oBltM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415462; c=relaxed/simple;
	bh=eywy900SjYxtAyo4CfVaSLEC3OTfBf1b1QhPnJKjZ1o=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SEf/dxyJU3IUyjg4RroqF5oYWyGKFRmFfWOSeivpT0k2Qh0Q+Mmc8ZKch9E2OJkCP536JGZ0xMr94+Vz8sQywZ0QZKjqCOrKbt6AgAvJbV7/oooP1t9qaWC9SzwwS9UeC55VpgdPTgZIYSzv5pUye0Zqh1jLCYeY3cwLdn3LLcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kazjBkX5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kazjBkX5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C09C4CEED;
	Wed, 23 Apr 2025 13:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745415462;
	bh=eywy900SjYxtAyo4CfVaSLEC3OTfBf1b1QhPnJKjZ1o=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kazjBkX5KBgtLtmEUmbE7O7EHp1X297RTN17di/ekpdAykhJwaTz1UOOnYJbsFNRg
	 hhp3gkOaRrpDXcKLm+ssabVvI4Yv/AJgfuDF5F+ChBJNE3u/mHXHETaJ+zTCihPsRm
	 kwVadg7W/hURrq2qs2kpxYj+Drm7qjnKo33ibuWk3bWoPRmhxMihGMFn6X110RLjlE
	 STlAHD0aY87O8mFi0+PN8qjHh4C+OUIuCUg2uUyDb4iL5qu4NiTVOuLM2aPa2X11+i
	 LMvPG/r8uyyKv2I6AWSo+/eQl4mnLAX6E2xNwD4NetncjvtU37u2RtpEQ3Wixgmv/J
	 4QFhqkhkKtgiQ==
Date: Wed, 23 Apr 2025 08:37:40 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>, linux-amarula@amarulasolutions.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
Message-Id: <174541475668.315199.12653523227980789003.robh@kernel.org>
Subject: Re: [PATCH v11 00/18] Support spread spectrum clocking for i.MX8M
 PLLs


On Wed, 23 Apr 2025 08:02:17 +0200, Dario Binacchi wrote:
> This version keeps the version v9 patches that can be merged and
> removes the patches that will need to be modified in case Peng's
> PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> The idea is to speed up the merging of the patches in the series
> that have already been reviewed and are not dependent on the
> introduction of the assigned-clocks-sscs property, and postpone
> the patches for spread spectrum to a future series once it becomes
> clear what needs to be done.
> 
> Specifically, the patches:
> 
> 01/18 dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
> 02/18 clk: imx8mm: rename video_pll1 to video_pll
> 03/18 dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
> 04/18 clk: imx8mp: rename video_pll1 to video_pll
> 
> are a replica for i.MX8MM and i.MX8MP of the patch for i.MX8MM
> bedcf9d1dcf88 ("clk: imx: rename video_pll1 to video_pll"), which was
> merged some time ago. The patches are split into four because, during
> the review, Krzysztof asked me to separate the driver modifications
> from the dt-bindings changes.
> 
> All the other patches in the series, from 5 to 18, are necessary for
> the implementation of the anatop driver for i.MX8M{M,N,P}. The review of
> this series has taken a long time, partly due to misunderstandings
> arising from incorrect design choices.
> 
> As Peng stated in [1]:
> "In current design, CCM is taken as producer of CLK_IMX8M_VIDEO_PLL, not consumer."
> 
> These patches fix this issue by ensuring that the PLLs are now produced by
> Anatop and consumed by CCM, aligning with the hardware logic.
> 
> Finally, a clarification: I decided to keep the same title for the series
> despite having removed all the patches for spread spectrum support in order
> to maintain a clear connection with the previous versions.
> 
> [1] https://patchwork.kernel.org/project/linux-clk/patch/20241106090549.3684963-2-dario.binacchi@amarulasolutions.com/
> 
> Changes in v11:
> - Fix conflict while rebasing on master for patches:
>   13/18 clk: imx: add support for i.MX8MP anatop clock driver
>   14/18 clk: imx8mp: rename ccm_base to base
>   15/18 dt-bindings: clock: imx8m-clock: add PLLs
> - Add 'Reviewed-by' tag of Peng Fan for patches:
>   11/18 clk: imx: add support for i.MX8MM anatop clock driver
>   13/18 clk: imx: add support for i.MX8MP anatop clock driver
>   14/18 clk: imx8mp: rename ccm_base to base
> 
> Changes in v10:
> - Drop the v9 patches:
>   16/23 dt-bindings: clock: imx8m-clock: support spread spectrum clocking
>   17/23 clk: imx: pll14xx: support spread spectrum clock generation
>   17/23 clk: imx8mn: support spread spectrum clock generation
>   21/23 clk: imx8mp: support spread spectrum clock generation
>   23/23 clk: imx8mm: support spread spectrum clock generation
> 
> Changes in v9:
> - Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
> - Fix building warning raised by the kernel test robot for patch
>   v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
> - Add patches for imx8m{m,p} platforms:
>   - 23/23 clk: imx8mm: support spread spectrum clock generation
>   - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
>   - 21/23 clk: imx8mp: support spread spectrum clock generation
>   - 20/23 clk: imx8mp: rename ccm_base to base
>   - 19/23 clk: imx: add support for i.MX8MP anatop clock driver
> 
> Changes in v8:
> - Drop the patches added in version 7:
>   - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
>   - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
>   - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
>   - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
>   - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM
> 
> Changes in v7:
> - Add and manage fsl,anatop property as phandle to the anatop node with
>   the new patches:
>   - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
>   - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
>   - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
>   - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
>   - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM
> 
> Changes in v6:
> - Merge patches:
>   10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
>   11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
>   12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
>   to
>   05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
>   now renamed
>   05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
> - Split the patch
>   15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
>   into
>   12/18 dt-bindings: clock: imx8m-clock: add PLLs
>   16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking
> 
> Changes in v5:
> - Fix compilation errors.
> - Separate driver code from dt-bindings
> 
> Changes in v4:
> - Add dt-bindings for anatop
> - Add anatop driver
> - Drop fsl,ssc-clocks from spread spectrum dt-bindings
> 
> Changes in v3:
> - Patches 1/8 has been added in version 3. The dt-bindings have
>   been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
>   anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
>   syscon, so it represents a memory area accessible by ccm
>   (imx8m-clock.yaml) to setup the PLLs.
> - Patches {3,5}/8 have been added in version 3.
> - Patches {4,6,8}/8 use ccm device node instead of the anatop one.
> 
> Changes in v2:
> - Add "allOf:" and place it after "required:" block, like in the
>   example schema.
> - Move the properties definition to the top-level.
> - Drop unit types as requested by the "make dt_binding_check" command.
> 
> Dario Binacchi (18):
>   dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
>   clk: imx8mm: rename video_pll1 to video_pll
>   dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
>   clk: imx8mp: rename video_pll1 to video_pll
>   dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
>   arm64: dts: imx8mm: add anatop clocks
>   arm64: dts: imx8mn: add anatop clocks
>   arm64: dts: imx8mp: add anatop clocks
>   arm64: dts: imx8mq: add anatop clocks
>   clk: imx: add hw API imx_anatop_get_clk_hw
>   clk: imx: add support for i.MX8MM anatop clock driver
>   clk: imx: add support for i.MX8MN anatop clock driver
>   clk: imx: add support for i.MX8MP anatop clock driver
>   clk: imx8mp: rename ccm_base to base
>   dt-bindings: clock: imx8m-clock: add PLLs
>   arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
>   arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
>   arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
> 
>  .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +-
>  .../bindings/clock/imx8m-clock.yaml           |  27 +-
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 +-
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  11 +-
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 +-
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +
>  drivers/clk/imx/Makefile                      |   6 +-
>  drivers/clk/imx/clk-imx8mm-anatop.c           | 287 ++++++++
>  drivers/clk/imx/clk-imx8mm.c                  | 262 ++++---
>  drivers/clk/imx/clk-imx8mn-anatop.c           | 283 ++++++++
>  drivers/clk/imx/clk-imx8mn.c                  | 183 +++--
>  drivers/clk/imx/clk-imx8mp-anatop.c           | 306 ++++++++
>  drivers/clk/imx/clk-imx8mp.c                  | 672 +++++++++---------
>  drivers/clk/imx/clk.c                         |  15 +
>  drivers/clk/imx/clk.h                         |   2 +
>  include/dt-bindings/clock/imx8mm-clock.h      |  76 +-
>  include/dt-bindings/clock/imx8mn-clock.h      |  64 ++
>  include/dt-bindings/clock/imx8mp-clock.h      |  80 ++-
>  18 files changed, 1740 insertions(+), 611 deletions(-)
>  create mode 100644 drivers/clk/imx/clk-imx8mm-anatop.c
>  create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c
>  create mode 100644 drivers/clk/imx/clk-imx8mp-anatop.c
> 
> --
> 2.43.0
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
 Base: tags/v6.15-rc1-1-g7ed7d1ed852d (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250423060241.95521-1-dario.binacchi@amarulasolutions.com:

arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [37], [38], [39], [40]] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[34], [35], [37], [38], [39], [40]] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[33], [34], [36], [37], [38], [39]] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[33], [34], [36], [37], [38], [39]] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[33], [34], [36], [37], [38], [39]] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clock-names: ['osc_32k', 'osc_24m', 'clk_ext1', 'clk_ext2', 'clk_ext3', 'clk_ext4'] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#
arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb: clock-controller@30380000 (fsl,imx8mp-ccm): clocks: [[33], [34], [36], [37], [38], [39]] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#





