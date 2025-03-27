Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F42A18AE2;
	Thu, 27 Mar 2025 19:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104506; cv=none; b=VofcvdXPjid6GZGu4r63DWtQH+V+wkaxe9stZcua33WNG95V2Cj9v+mK5cFfdynbnkvkhBG/xf2AcK0kyBVCiJxyN6jgO67s+7GsL2D9wQEiHzmxLafn+Ydeqdg0el3S/S2bR77aG7QARht9/P+GvmxJNCpbQS9QPbzztubtAHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104506; c=relaxed/simple;
	bh=IBqTsvUGoCy/YkiVeaOE/fHgyV2HsXFMDrAO0iAIKUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fr/kB4XDKGjQB/vBwRzI21bgt1GZ2r5MgcQ2GR/VdsAy65fzkSa+nPHrQkJOqdDDsJ9xOO0dQDZ/G+nJVX6WLa/Cd1lUd38i77iunFhpY2QwvYOgodvBTLAuiu3DKCUs2KbRbyQ1ihhr5MeUnWn3SWuRL24w5PErmzF6uzoy0zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8QTw/c+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8QTw/c+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658D3C4CEE5;
	Thu, 27 Mar 2025 19:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743104505;
	bh=IBqTsvUGoCy/YkiVeaOE/fHgyV2HsXFMDrAO0iAIKUA=;
	h=Date:From:To:Cc:Subject:From;
	b=j8QTw/c+z3keIZR0gMkHhAtq3UEIE8KJauA8POOCjtq3dmNjjJfppIpD98QfCx106
	 wi8m/PKXhKzKV9fP0Hdw3vkd/xxxgi//gT6Ke+gSbi/baB5vduoZcGD2GzwXpbUhQh
	 6xFXwVGzQ1G0Jh/TcJ3HaA9C/ea/3hHaFPZDQvOBP06PR1FdnJEUIt+xds/ggkrQs7
	 PwO0TwvWaKhnd6xOKGewooELhIBxJzWwMBy34ciXa2eIVRTzRAbuXoN01YkJ4gVb6K
	 3tlGNnUYFwRjIt2fJMbrlnmWyPAktDSbdOO2pEQyHUNY8Ipf9s7XHazlB8/1/njqUm
	 H5tUyG1w1DoKQ==
Date: Thu, 27 Mar 2025 14:41:44 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree updates for v6.15
Message-ID: <20250327194144.GA884505-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

Please pull DT updates for 6.15. There's a trivial merge conflict with 
your tree in of_private.h (actually from fixes from me for 6.14 which I 
never merged into this cycle's branch).

Rob


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-6.15

for you to fetch changes up to 314655d41e650b3d72c60aa80a449e0ab22e2ffd:

  scripts/make_fit: Print DT name before libfdt errors (2025-03-27 14:03:32 -0500)

----------------------------------------------------------------
Devicetree for v6.15:

DT core:
- Fix ref counting errors in interrupt parsing code

- Allow "nonposted-mmio" property per device and on non-Apple h/w

- Use typed accessors in platform driver code

- Fix mismatch between DT MAX_PHANDLE_ARGS and NR_FWNODE_REFERENCE_ARGS
  and increase the maximum number args

- Rework of_resolve_phandles() to use __free() cleanup and fix ref count
  error

- Use of_prop_cmp() in a few more places

- Improve make_fit.py script error handling

DT bindings:
- Update DT property ordering rules for properties within groups (i.e.
  common suffix)

- Update DT submitting-patches doc to cover sending .dts patches and
  SoC maintainer rules on being warning free against linux-next

- Add ti,tps53681, ti,tps53681, Maxim max15301, max15303, and
  max20751 to trivial devices

- Add Renesas RZ/V2H(P) and Allwinner H616 support to Arm Mali Bifrost
  GPU. Add Samsung exynos7870 support to Arm Mail Midgard.

- Rework qcom,ebi2 and samsung,exynos4210-sram memory controller
  bindings to split child node properties. Fix the LAN9115 binding to
  use the child node schema so all properties are documented.

- Convert nxp,lpc3220-mic and Altera ECC manager bindings to schema

- Fix some issues with LVDS display panels causing validation warnings

- Drop some obsolete parts of Xilinx bindings

----------------------------------------------------------------
Ahmad Fatoum (1):
      dt-bindings: display/lvds-codec: add ti,sn65lvds822

Andre Przywara (1):
      dt-bindings: gpu: mali-bifrost: Add Allwinner H616 compatible

Dragan Simic (1):
      docs: dt-bindings: Specify ordering for properties within groups

J. Neuschäfer (1):
      scripts/make_fit: Print DT name before libfdt errors

Kaustabh Chakraborty (1):
      dt-bindings: gpu: arm,mali-midgard: add exynos7870-mali compatible

Konrad Dybcio (2):
      of: address: Expand nonposted-mmio to non-Apple Silicon platforms
      of: address: Allow to specify nonposted-mmio per-device

Krzysztof Kozlowski (5):
      docs: dt: submitting-patches: Document sending DTS patches
      docs: process: maintainer-soc-clean-dts: linux-next is decisive
      dt-bindings: memory-controllers: samsung,exynos4210-srom: Enforce child props
      dt-bindings: memory-controllers: qcom,ebi2: Enforce child props
      dt-bindings: pps: gpio: Correct indentation and style in DTS example

Lad Prabhakar (1):
      dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2H(P) SoC

Leonardo Felipe Takao Hirata (1):
      dt-bindings: interrupt-controller: Convert nxp,lpc3220-mic.txt to yaml format

Matthew Gerlach (1):
      dt-bindings: edac: altera: socfpga: Convert to YAML

Michal Simek (5):
      dt-bindings: xilinx: Remove uartlite from xilinx.txt
      dt-bindings: xilinx: Remove description for SystemACE
      dt-bindings: xilinx: Remove desciption for 16550 uart
      dt-bindings: trivial-devices: Add ti,tps546b24
      dt-bindings: trivial-devices: Add ti,tps53681

Rob Herring (Arm) (13):
      dt-bindings: memory-controllers: Move qcom,ebi2 from bindings/bus/
      dt-bindings: memory-controllers: qcom,ebi2: Split out child node properties
      dt-bindings: memory-controllers: samsung,exynos4210-srom: Split out child node properties
      dt-bindings: net: smsc,lan9115: Ensure all properties are defined
      dt-bindings: imx: fsl,aips-bus: Ensure all properties are defined
      of: resolver: Simplify of_resolve_phandles() using __free()
      dt-bindings: display: mitsubishi,aa104xd12: Allow jeida-18 for data-mapping
      dt-bindings: display: mitsubishi,aa104xd12: Adjust allowed and required properties
      dt-bindings: fsi: ibm,p9-scom: Add "ibm,fsi2pib" compatible
      dt-bindings: trivial-devices: Add Maxim max15301, max15303, and max20751
      of/platform: Use typed accessors rather than of_get_property()
      of: Move of_prop_val_eq() next to the single user
      media: dt-bindings: mediatek,vcodec-encoder: Drop assigned-clock properties

Zijun Hu (15):
      of: unittest: Add a case to test if API of_irq_parse_one() leaks refcount
      of/irq: Fix device node refcount leakage in API of_irq_parse_one()
      of: unittest: Add a case to test if API of_irq_parse_raw() leaks refcount
      of/irq: Fix device node refcount leakage in API of_irq_parse_raw()
      of/irq: Fix device node refcount leakages in of_irq_count()
      of/irq: Fix device node refcount leakage in API irq_of_parse_and_map()
      of/irq: Fix device node refcount leakages in of_irq_init()
      of/irq: Add comments about refcount for API of_irq_find_parent()
      of: resolver: Fix device node refcount leakage in of_resolve_phandles()
      of: Compare property names by of_prop_cmp() in of_alias_scan()
      of: Introduce and apply private is_pseudo_property()
      of: Correct property name comparison in __of_add_property()
      of/platform: Do not use of_get_property() to test property presence
      of: property: Increase NR_FWNODE_REFERENCE_ARGS
      of: Align macro MAX_PHANDLE_ARGS with NR_FWNODE_REFERENCE_ARGS

 .../bindings/display/bridge/lvds-codec.yaml        |   1 +
 .../display/panel/mitsubishi,aa104xd12.yaml        |   6 +-
 .../devicetree/bindings/dts-coding-style.rst       |   8 +-
 .../bindings/edac/altr,socfpga-ecc-manager.yaml    | 323 +++++++++++++++++
 .../devicetree/bindings/edac/socfpga-eccmgr.txt    | 383 ---------------------
 .../devicetree/bindings/fsi/ibm,p9-scom.yaml       |   1 +
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |   3 +
 .../devicetree/bindings/gpu/arm,mali-midgard.yaml  |   5 +-
 .../interrupt-controller/nxp,lpc3220-mic.txt       |  58 ----
 .../interrupt-controller/nxp,lpc3220-mic.yaml      |  68 ++++
 .../bindings/media/mediatek,vcodec-encoder.yaml    |   6 -
 .../bindings/memory-controllers/exynos-srom.yaml   |  36 +-
 .../memory-controllers/mc-peripheral-props.yaml    |   2 +
 .../qcom,ebi2-peripheral-props.yaml                |  91 +++++
 .../{bus => memory-controllers}/qcom,ebi2.yaml     |  87 +----
 .../samsung,exynos4210-srom-peripheral-props.yaml  |  35 ++
 .../devicetree/bindings/net/smsc,lan9115.yaml      |   6 +-
 .../devicetree/bindings/pps/pps-gpio.yaml          |  22 +-
 .../devicetree/bindings/soc/imx/fsl,aips-bus.yaml  |   5 +-
 .../devicetree/bindings/submitting-patches.rst     |  19 +-
 .../devicetree/bindings/trivial-devices.yaml       |   9 +
 Documentation/devicetree/bindings/xilinx.txt       |  26 --
 Documentation/process/maintainer-soc-clean-dts.rst |   5 +-
 MAINTAINERS                                        |   5 +
 drivers/of/address.c                               |  13 +-
 drivers/of/base.c                                  |   6 +-
 drivers/of/irq.c                                   |  84 +++--
 drivers/of/of_private.h                            |   7 +
 drivers/of/overlay.c                               |  10 +-
 drivers/of/platform.c                              |   8 +-
 drivers/of/resolver.c                              |  41 +--
 drivers/of/unittest-data/tests-interrupts.dtsi     |  13 +
 drivers/of/unittest.c                              |  67 ++++
 include/linux/fwnode.h                             |   2 +-
 include/linux/of.h                                 |   8 +-
 scripts/make_fit.py                                |   6 +-
 36 files changed, 766 insertions(+), 709 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
 delete mode 100644 Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc3220-mic.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/qcom,ebi2-peripheral-props.yaml
 rename Documentation/devicetree/bindings/{bus => memory-controllers}/qcom,ebi2.yaml (63%)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/samsung,exynos4210-srom-peripheral-props.yaml
