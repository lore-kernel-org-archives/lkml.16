Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BDD71747
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122170; cv=none; b=oYx4xKp0JqdtJ2LiLVQ0dsD+JSTRh7C9DvJ55b8QMjEkNAVG9w1ftli+ql363/ERnyt9+gq4iB01y0iwIX4zIs+FimbhVGM0xZEQVn5Qgq4lgDyB/VlvEngzhlQumFx6BOgBSsYTC++ag3/ayaXXfL2kO1npKxkeuIV7WqBjwh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122170; c=relaxed/simple;
	bh=rpH5ZeQ0rBxzKpA51FVdOtkiGhjCwATd4T7ZU7lHWN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aOFaPn+JzZ1LBmml7jTQnbDbIcPSY62yzXsf5yubsq2ygnVMmKQZa2R+2fyw9zRyImU6k5lL+ejEIr0apFIib1qIPDwWId3hnXLun0jl7wAA7AxNooYrPdHf5bRwxIhfgMIkPcVwFaUYt92VjEbGFdcAgwqbk43kPcVsokLon68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=xP5UQKZZ; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="xP5UQKZZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751122164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aVTbO8G4R6viE+tfVPbSFz/SXJ7gylUYaOkU8vbwsEk=;
	b=xP5UQKZZemAkh6YtbAkth5i3YynFDu5E7A8J2+PK2F93SqlDTPyfojl0cC7h9BteKfxcNI
	rUOU4Zl/0G+r4Kp/cBUJG/OTe3tPfdHysQLm3pSTevY11SH9at1BRXuuoLoO/Tczd8aRdH
	Qz8IC0vpxFAOx5pQ1rIe/AvoBtZEDoSuDamy7OFljiio6LIoCPv14YvqVr0PX36KEm1Rv1
	892FuRm4/M59MHGtRPcnhknv5VSL6UxS0X+1vN+zQGCAajx36LRGHpZFRIbopffxWG59sr
	BBD7giiT9MiHYewtSwVOgFxjiq9t+xaooF5JPCxGvQvbfpZcKYTNangf0PTO3Q==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v2 00/10] Fix several DTB validation issues
Date: Sat, 28 Jun 2025 16:32:34 +0200
Message-ID: <20250628144915.839338-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This patch set fixes several DTB validation issues and consists of 2
parts:
1) dsi refactoring
2) various low-hanging fruit

ad 1) The display/rockchip/rockchip,dw-mipi-dsi.yaml binding had:
- #address-cells
- #size-cells

My guess is that those properties were added for panel(s) which could
be connected. While convenient, it's not a property of the DSI
controller (in the SoC). And caused DTB validation issues when a panel
was not connected to the board. So add the #address/#size-cells
properties to the board dts[i] file where there is a panel and then
remove the properties from the SoC dtsi file ... and then from the
binding file as well.

ad 2) There were a number of issues which were obvious to me how to fix,
so I fixed those as well. One of those was the addition of port(s) or
endpoints, but for that the context (ie parent nodes) got redefined ...
to the same values they had in the SoC dsi node. The SoC dsi node
already defined the structure where each port got a label/phandle. That
allows for a simplification of the port/endpoint by referencing that
label/phandle.

My changes were based on yesterday's v6.17-armsoc/dts64 branch:
7f9509791507 ("arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC")

Then applied the following patches:
86491c2b99e5 ("dt-bindings: pinctrl: rockchip: increase max amount of device functions")
6f446bbe412a ("dt-bindings: gpu: mali-utgard: Add Rockchip RK3528 compatible")
ab9be0b75af5 ("dt-bindings: display: himax-hx8394: Add Huiling hl055fhav028c")
8358102806c6 ("dt-bindings: power: rockchip: Add support for RK3528")
233eda069994 ("dt-bindings: rockchip: pmu: Add compatible for RK3528")

And then validated it with W=1 using dtschema-2025.6.1.
The validation log file sizes:
- base: 99.8 KiB
- dsi: 82.1 KiB
- low-hanging-fruit: 68.9 KiB

I then checked whether dmesg wouldn't indicate problem on these boards:
- Rock64 (rk3328)
- RockPro64 (rk3399)
- PineTab2 (rk3566)

And I didn't find any. I don't have any px30 or rk3399-gru-* based
boards, so I couldn't test with those.

Changelog:
- Move refactoring of port/endpoint definition to its own patch
  (Quentin)
- Move re-ordering of nodes to its own patch (Quentin)
Link to v1:
https://lore.kernel.org/linux-rockchip/20250627152645.740981-1-didi.debian@cknow.org/


I also identified some other items which could reduce the DTB
validation 'noise' substantially:

"failed to match any schema with compatible" errors:

- 'mps,mp8859': regulator/mp8859.txt
- 'realtek,rt5651': sound/rt5651.txt
- 'rockchip,rk3368-mailbox': mailbox/rockchip-mailbox.txt
- 'rockchip,rk3399-gru-sound': sound/rockchip,rk3399-gru-sound.txt
- 'ti,tsc2007': input/touchscreen/tsc2007.txt

Other issues where a (small?) fix may help a lot:

px30:
- /isp@ff4a0000/ports: graph node has single child node 'port@0',
    #address-cells/#size-cells are not necessary
- /syscon@ff140000/lvds/ports/port@0: graph node has single child node
    'endpoint@0', #address-cells/#size-cells are not necessary
- /dsi@ff450000/ports/port@0: graph node has single child node
    'endpoint@0', #address-cells/#size-cells are not necessary

rk3399:
- /usb@fe800000: node has a unit name, but no reg or ranges property
- /usb@fe900000: node has a unit name, but no reg or ranges property

Cheers,
  Diederik

Diederik de Haas (10):
  arm64: dts: rockchip: Move dsi address+size-cells from SoC to px30
    boards
  arm64: dts: rockchip: Move dsi address+size-cells from SoC to rk3399
    boards
  dt-bindings: display: rockchip,dw-mipi-dsi: Drop address/size cells
  arm64: dts: rockchip: Simplify VOP port definition on rk3328
  arm64: dts: rockchip: Simplify edp endpoints on several rk3399 boards
  arm64: dts: rockchip: Simplify mipi_out endpoint on rk3399 RP64 dtso
  arm64: dts: rockchip: Move mipi_out node on rk3399 haikou demo dtso
  arm64: dts: rockchip: Fix LCD panel port on rk3566-pinetab2
  arm64: dts: rockchip: Drop unneeded address+size-cells on px30
  arm64: dts: rockchip: Drop regulator-compatible property on rk3399

 .../rockchip/rockchip,dw-mipi-dsi.yaml        |  6 -----
 .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  2 ++
 .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  2 ++
 .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  2 ++
 .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  2 ++
 arch/arm64/boot/dts/rockchip/px30-evb.dts     |  2 ++
 .../rockchip/px30-pp1516-ltk050h3146w-a2.dts  |  2 ++
 .../dts/rockchip/px30-pp1516-ltk050h3148w.dts |  2 ++
 arch/arm64/boot/dts/rockchip/px30.dtsi        |  6 -----
 .../dts/rockchip/rk3326-anbernic-rg351m.dtsi  |  2 ++
 .../dts/rockchip/rk3326-gameforce-chi.dts     |  2 ++
 .../boot/dts/rockchip/rk3326-odroid-go.dtsi   |  2 ++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi      |  6 +----
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  4 ----
 .../dts/rockchip/rk3399-gru-chromebook.dtsi   | 15 ++++---------
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi |  4 +++-
 .../boot/dts/rockchip/rk3399-hugsun-x99.dts   |  2 --
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts | 15 ++++---------
 .../dts/rockchip/rk3399-pinephone-pro.dts     |  2 ++
 .../rk3399-puma-haikou-video-demo.dtso        | 12 +++++-----
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts |  2 --
 .../dts/rockchip/rk3399-rockpro64-screen.dtso | 22 ++++++-------------
 .../rockchip/rk3399-sapphire-excavator.dts    | 16 ++++----------
 .../boot/dts/rockchip/rk3566-pinetab2.dtsi    |  6 ++---
 24 files changed, 54 insertions(+), 84 deletions(-)

-- 
2.50.0

