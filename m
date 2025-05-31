Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017516FBF
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748682145; cv=none; b=imc3tavjWz5yO/wZk8gUh/rLD1hlhZ/TLLcCj2PJQNHOqDx4CKBk2ozgaW/yCrHGzHock+Lp8I3zx13cmEzQQCAnRFvqKPragMUgjxOHHskyUslhTARNwZHXZ3XVlQEiZzd1wwtK08I1WogIL+DbJar5WJSL+//+bTvlHNYIio0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748682145; c=relaxed/simple;
	bh=CK2KcBQ7ajUircDsdXBE474KKn+OdAD+xLNZ/+d5oa4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GU5MKq3TfiBfnY6bYDxRAohyH/E6ocwipdwUurfjwpQJ3ZeRyrmdjzVnLofLjVgX4ZmCGTUl8A/NLwyQmHuZ3ktoq88ixL2TorddfOSOhbymXxH3mdFre1XqIQ1balDLNj1spSjG2+uO+Esza7ig5/JfIxEFeuUIEA3GvddX1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=X0FCzvrb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W8FsJV/Z; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="X0FCzvrb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W8FsJV/Z"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 1D829138031A;
	Sat, 31 May 2025 05:02:20 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 05:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748682140;
	 x=1748768540; bh=vPtcrMjaeIbFh4XZbRWa6u6U37WSb5JfkpC0WOWmjrY=; b=
	X0FCzvrbKwgfzWVRwCbwJ03XglzqEO/ccxs+JfXMx24NYpy2DvaQY2BTpJp2w+xG
	N+oN7kMWhbwX6+wdKGJx8j8ZzwNxnwgsXrnhRm1VqPJB7/nuBtZZwwjSxHklh0vE
	bBFl9RKK+qk3BdEphEnzs1TZ1Xz6byGseyFVS4gPZ4OEphiro9+UEE9vs6jOjVY6
	0JjlZxMP/if2QDOo9dQi8a1Bn+n0YPw1kj0rRY6mjRm5SVAAIDzOie/hbfPAQhhq
	j7eb4hxbJjjgsVzxsLFYQGeP7W75axabIFAqOUSiWjloRpQeiV2U49bOvXAFAGb5
	vBye4f80NIS8HZsSHn81jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748682140; x=
	1748768540; bh=vPtcrMjaeIbFh4XZbRWa6u6U37WSb5JfkpC0WOWmjrY=; b=W
	8FsJV/Z2GqHRF3gKhQTP8jDHXBzkiHcSrF3eNiUvDj9ATzRZEs4yFTBB/6dp7bl2
	+5pd5Q7Jjtx1fMaEzRuknPmqW+SbsYmAkwefm0aqoUN7oAuDa1EZzvyFBUqJZiKt
	b3Ur5ADrzYYTgAhBq9+2hJe92MJrTSXbrFPkpbfgc9nqOxmH91dkKHmKJg+nY0nV
	nHNSSTDg2htmSRQylS20YMq6MxCkBLT3XuljpEj3q51klXWVImN1knXYtPIYJPHW
	6wTj8CERJUZqfBVORTChMB2Q+j/w0tQg2UxquCDCm+ygVPKowGhvD758cpKA8EhI
	4spl6PN0JeVOvocdLgFmA==
X-ME-Sender: <xms:m8U6aDNXHeWQ5zh32xFnFpVU-ctUd6ofGZhNeTj5JmURjCalV4w1IA>
    <xme:m8U6aN8O0M6K_jDo2bINOU2iwE3xzEVt5s_ijLyZf_nunJQy_eIq_BPljFzhGqcMS
    N8msiFmny-iDY-fOkc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudegleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeejfefhleeigfev
    udekleekkeeujeeutdeigefgveektdejieffudegtdejueelueenucffohhmrghinhepkh
    gvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpphgvnhhguhhtrhhonhhigidruggv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlihhsthhsrdhlihhnuhigrd
    guvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:m8U6aCQH5wrgKoxEQaueTK1sagrrEIrg6OoIENvgA54AkUdJAqjDBA>
    <xmx:m8U6aHvO20Yhis2rqIiP0kqceGnk8Ullpbg-wejjq8yZ4bkwRm2dUA>
    <xmx:m8U6aLcwweYFd1Qs1A1V3LBkYdZYLtjRrJjA_vtTGE2-ww7MNGQoAQ>
    <xmx:m8U6aD3EoO2WzLWkjOyVeIl36XWB5z5X_juIY4mQJGSAHjwS1Nus1Q>
    <xmx:nMU6aMUKiT9vy9iJL3-EwZP70KcxlbM2SDfJtbRUIhxEbzCD_nzZ8-I5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B581D700060; Sat, 31 May 2025 05:02:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 31 May 2025 11:01:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <f44d3ad7-b518-4679-8f7b-949680b26ef7@app.fastmail.com>
In-Reply-To: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
Subject: [GIT PULL 1/5] soc: drivers for 6.16
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 798dc3f19c9e3855c18c3afb610bc5d27195e=
f44:

  memory: renesas-rpc-if: Add missing static keyword (2025-05-08 10:59:0=
7 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
rivers-6.16

for you to fetch changes up to 5963edd98a2159f2114b08e402a7341c1e7dd293:

  Merge tag 'soc_fsl-6.16-1' of https://github.com/chleroy/linux into so=
c/drivers (2025-05-22 13:22:07 +0200)

----------------------------------------------------------------
soc: drivers for 6.16

Updates are across the usual driver subsystems with SoC specific drivers:

 - added soc specicific drivers for sophgo cv1800 and sg2044, qualcomm
   sm8750, and amlogic c3 and s4 chips.

 - cache controller updates for sifive chips, plus binding changes for
   other cache descriptions.

 - memory controller drivers for mediatek mt6893, stm32 and cleanups for=
 a
   few more drivers

 - reset controller drivers for T-Head TH1502, Sophgo sg2044 and
   Renesas RZ/V2H(P)

 - SCMI firmware updates to better deal with buggy firmware, plus better
   support for Qualcomm X1E and NXP i.MX specific interfaces

 - a new platform driver for the crypto firmware on Cznic Turris Omnia/M=
OX

 - cleanups for the TEE firmware subsystem and amdtee driver

 - minor updates and fixes for freescale/nxp, qualcomm, google, aspeed,
   wondermedia, ti, nxp, renesas, hisilicon, mediatek, broadcom and sams=
ung
   SoCs

----------------------------------------------------------------
Aleksandrs Vinarskis (1):
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14

Alexander Stein (1):
      soc: ti: wkup_m3_ipc: Use dev_err_probe

Alexander Sverdlin (2):
      Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect de=
vices first"
      soc: sophgo: cv1800: rtcsys: New driver (handling RTC only)

Alexey Charkov (2):
      dt-bindings: hwinfo: Add VIA/WonderMedia SoC identification
      soc: Add VIA/WonderMedia SoC identification driver

Andr=C3=A9 Draszik (6):
      firmware: exynos-acpm: use ktime APIs for timeout detection
      firmware: exynos-acpm: allow use during system shutdown
      dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
      firmware: exynos-acpm: fix reading longer results
      firmware: exynos-acpm: silence EPROBE_DEFER error on boot
      firmware: exynos-acpm: introduce devm_acpm_get_by_node()

AngeloGioacchino Del Regno (5):
      dt-bindings: soc: mediatek: dvfsrc: Add support for MT6893
      soc: mediatek: mtk-dvfsrc: Rename and move bw constraints data
      soc: mediatek: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
      dt-bindings: memory: mtk-smi: Add support for MT6893
      memory: mtk-smi: Add support for Dimensity 1200 MT6893 SMI

Arnd Bergmann (29):
      platform: cznic: fix function parameter names
      firmware: turris-mox-rwtm: fix building without CONFIG_KEYS
      platform: cznic: use ffs() instead of __bf_shf()
      soc: mediatek: mtk-dvfsrc: remove an unused variable
      Merge tag 'renesas-drivers-for-v6.16-tag1' of https://git.kernel.o=
rg/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'samsung-drivers-6.16' of https://git.kernel.org/pub/scm=
/linux/kernel/git/krzk/linux into soc/drivers
      Merge tag 'arm-soc/for-6.16/drivers' of https://github.com/Broadco=
m/stblinux into soc/drivers
      Merge tag 'mtk-soc-for-v6.16' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/mediatek/linux into soc/drivers
      Merge tag 'scmi-updates-6.16' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/sudeep.holla/linux into soc/drivers
      Merge tag 'memory-controller-drv-renesas-6.16' of https://git.kern=
el.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'memory-controller-drv-6.16' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'hisi-drivers-for-6.16' of https://github.com/hisilicon/=
linux-hisi into soc/drivers
      Merge tag 'amd-tee-for-v6.16' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'renesas-drivers-for-v6.16-tag2' of https://git.kernel.o=
rg/pub/scm/linux/kernel/git/geert/renesas-devel into soc/drivers
      Merge tag 'tee-for-v6.16' of https://git.kernel.org/pub/scm/linux/=
kernel/git/jenswi/linux-tee into soc/drivers
      Merge tag 'omap-for-v6.16/drivers-signed' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/khilman/linux-omap into soc/drivers
      Merge branch 'cznic/platform' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/soc/soc into soc/drivers
      Merge tag 'imx-drivers-6.16' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/shawnguo/linux into soc/drivers
      Merge tag 'reset-for-v6.16' of git://git.pengutronix.de/pza/linux =
into soc/drivers
      Merge tag 'ti-driver-soc-for-v6.16' of https://git.kernel.org/pub/=
scm/linux/kernel/git/ti/linux into soc/drivers
      Merge tag 'amlogic-driver-for-v6.16' of https://git.kernel.org/pub=
/scm/linux/kernel/git/amlogic/linux into soc/drivers
      Merge tag 'soc-drivers-6.16' of https://git.kernel.org/pub/scm/lin=
ux/kernel/git/krzk/linux-dt into soc/drivers
      Merge tag 'qcom-drivers-for-6.16' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'riscv-sophgo-soc-for-v6.16' of https://github.com/sophg=
o/linux into soc/drivers
      Merge tag 'samsung-drivers-6.16-2' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/krzk/linux into soc/drivers
      Merge tag 'memory-controller-drv-6.16-2' of https://git.kernel.org=
/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl into soc/drivers
      Merge tag 'riscv-cache-for-v6.16' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/conor/linux into soc/drivers
      Merge tag 'qcom-drivers-for-6.16-2' of https://git.kernel.org/pub/=
scm/linux/kernel/git/qcom/linux into soc/drivers
      Merge tag 'soc_fsl-6.16-1' of https://github.com/chleroy/linux int=
o soc/drivers

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (1):
      soc: qcom: smp2p: Fix fallback to qcom,ipc parse

Bartosz Golaszewski (2):
      memory: omap-gpmc: use the dedicated define for GPIO direction
      memory: omap-gpmc: remove GPIO set() and direction_output() callba=
cks

Ben Zong-You Xie (1):
      dt-bindings: cache: add QiLai compatible to ax45mp

Chen Ni (3):
      soc: ti: knav_qmss_queue: Remove unnecessary NULL check before fre=
e_percpu()
      tee: optee: smc: remove unnecessary NULL check before release_firm=
ware()
      soc: fsl: qe: Consolidate chained IRQ handler install/remove

Chuan Liu (6):
      soc: amlogic: clk-measure: Optimize the memory size of clk-measure
      soc: amlogic: clk-measure: Define MSR_CLK's register offset separa=
tely
      dt-bindings: soc: amlogic: C3 supports clk-measure
      dt-bindings: soc: amlogic: S4 supports clk-measure
      soc: amlogic: clk-measure: Add support for C3
      soc: amlogic: clk-measure: Add support for S4

Colin Ian King (1):
      memory: stm32: Fix spelling mistake "resset" -> "reset"

Conor Dooley (1):
      dt-bindings: cache: add specific RZ/Five compatible to ax45mp

Cristian Marussi (3):
      firmware: arm_scmi: Add polling support to raw mode
      firmware: arm_scmi: Add common framework to handle firmware quirks
      firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet

Dan Carpenter (2):
      memory: stm32_omm: Fix error handling in stm32_omm_configure()
      memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()

Danila Tikhonov (1):
      firmware: qcom: tzmem: disable sm7150 platform

Dmitry Baryshkov (2):
      dt-bindings: soc: qcom,rpm: add missing clock-controller node
      dt-bindings: soc: qcom: qcom,rpm: add missing clock/-names propert=
ies

George Moussalem (1):
      dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018

Henry Martin (1):
      soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()

Inochi Amaoto (2):
      dt-bindings: reset: sophgo: Add SG2044 bindings.
      soc: sophgo: sg2044: Add support for SG2044 TOP syscon device

Ioana Ciornei (3):
      bus: fsl-mc: fix double-free on mc_dev
      bus: fsl-mc: do not add a device-link for the UAPI used DPMCP devi=
ce
      bus: fsl-mc: add the dprc_get_mem() command to the whitelist

Jann Horn (1):
      tee: Prevent size calculation wraparound on 32-bit kernels

Jens Reidel (1):
      soc: qcom: pd-mapper: Add support for SM7150

Jingbao Qiu (1):
      dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series

Joel Stanley (1):
      ARM: aspeed: Don't select SRAM

Johan Hovold (3):
      firmware: arm_scmi: quirk: Force perf level get fastchannel
      soc: qcom: pmic_glink: enable UCSI on sc8280xp
      soc: qcom: pmic_glink_altmode: fix spurious DP hotplug events

Juerg Haefliger (1):
      firmware: qcom: scm: Allow QSEECOM for HP EliteBook Ultra G1q

Kees Cook (1):
      soc: fsl: qbman: Remove const from portal->cgrs allocation type

Kendall Willis (1):
      firmware: ti_sci: Convert CPU latency constraint from us to ms

Konrad Dybcio (1):
      dt-bindings: soc: qcom,rpmh-rsc: Limit power-domains requirement

Krzysztof Kozlowski (6):
      memory: Simplify 'default' choice in Kconfig
      memory: tegra: Do not enable by default during compile testing
      firmware: exynos-acpm: Correct kerneldoc and use typical np argume=
nt name
      ARM: vt8500: MAINTAINERS: Include vt8500 soc driver in maintainers=
 entry
      bus: firewall: Fix missing static inline annotations for stubs
      soc: fsl: Do not enable DPAA2_CONSOLE by default during compile te=
sting

Lad Prabhakar (5):
      soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
      soc: renesas: rz-sysc: Add SoC identification for RZ/V2N SoC
      dt-bindings: reset: Document RZ/V2H(P) USB2PHY reset
      reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)
      MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Port Reset dr=
iver

Laurentiu Tudor (2):
      bus: fsl-mc: drop useless cleanup
      bus: fsl-mc: increase MC_CMD_COMPLETION_TIMEOUT_MS value

Marek Beh=C3=BAn (5):
      platform: cznic: turris-omnia-mcu: Refactor requesting MCU interru=
pt
      platform: cznic: Add keyctl helpers for Turris platform
      platform: cznic: turris-omnia-mcu: Add support for digital message=
 signing with HW private key
      firmware: turris-mox-rwtm: Drop ECDSA signatures via debugfs
      firmware: turris-mox-rwtm: Add support for ECDSA signatures with H=
W private key

Mario Limonciello (2):
      amdtee: Use pr_fmt for messages
      amdtee: Sort header includes

Melody Olvera (3):
      dt-bindings: cache: qcom,llcc: Document SM8750 LLCC block
      soc: qcom: llcc-qcom: Add support for LLCC V6
      soc: qcom: llcc-qcom: Add support for SM8750

Michal Wilczynski (2):
      dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller
      reset: thead: Add TH1520 reset controller driver

Mukesh Ojha (2):
      dt-bindings: arm: qcom,ids: add SoC ID for SM8750
      soc: qcom: socinfo: add SM8750 SoC ID

Ovidiu Panait (1):
      bus: brcmstb_gisb: use dev_groups to register attribute groups

Patrice Chotard (5):
      reset: Add devm_reset_control_array_get_exclusive_released()
      dt-bindings: memory-controllers: Add STM32 Octo Memory Manager con=
troller
      memory: Add STM32 Octo Memory Manager driver
      MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
      memory: stm32_omm: Fix error handling in stm32_omm_disable_child()

Peng Fan (10):
      firmware: arm_scmi: imx: Add LMM and CPU documentation
      dt-bindings: firmware: Add i.MX95 SCMI LMM and CPU protocol
      firmware: arm_scmi: imx: Add i.MX95 LMM protocol
      firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
      firmware: imx: Add i.MX95 SCMI LMM driver
      firmware: imx: Add i.MX95 SCMI CPU driver
      MAINTAINERS: add entry for i.MX SCMI extensions
      soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare
      soc: imx8m: Introduce soc_uid hook
      soc: imx8m: Dump higher 64bits UID

Peter Griffin (4):
      dt-bindings: soc: google: Add gs101-pmu-intr-gen binding documenta=
tion
      dt-bindings: soc: samsung: exynos-pmu: gs101: add google,pmu-intr-=
gen phandle
      MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml binding file
      soc: samsung: exynos-pmu: enable CPU hotplug support for gs101

Pinkesh Vaghela (1):
      cache: sifive_ccache: Add ESWIN EIC7700 support

Pritesh Patel (1):
      dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC compatib=
ility

Rob Herring (Arm) (2):
      dt-bindings: cache: Convert marvell,{feroceon,kirkwood}-cache to D=
T schema
      dt-bindings: cache: Convert marvell,tauros2-cache to DT schema

Robin Murphy (1):
      bus: fsl_mc: Fix driver_managed_dma check

Salah Triki (1):
      memory: bt1-l2-ctl: replace scnprintf() with sysfs_emit()

Sibi Sankar (1):
      firmware: arm_scmi: Ensure that the message-id supports fastchannel

Su Hui (1):
      soc: aspeed: lpc: Fix impossible judgment condition

Sudeep Holla (6):
      firmware: arm_scmi: Ensure scmi_devices are always matched by name=
 as well
      firmware: arm_scmi: Refactor device matching logic to eliminate du=
plication
      firmware: arm_scmi: Refactor error logging from SCMI device creati=
on to single helper
      firmware: arm_scmi: Assign correct parent to arm-scmi platform dev=
ice
      firmware: arm_scmi: Exclude transport devices from bus matching
      soc: hisilicon: kunpeng_hccs: Simplify PCC shared memory region ha=
ndling

Tang Dongxing (1):
      soc: ti: k3-ringacc: Use device_match_of_node()

Thorsten Blum (1):
      bus: fsl-mc: Use strscpy() instead of strscpy_pad()

Tom Rix (1):
      soc: fsl: qe: remove unused qe_ic_from_irq function

Tudor Ambarus (1):
      firmware: exynos-acpm: populate devices from device tree data

Unnathi Chalicheemala (2):
      soc: qcom: smem: Update max processor count
      docs: firmware: qcom_scm: Fix kernel-doc warning

Uwe Kleine-K=C3=B6nig (1):
      MAINTAINERS: Generalize ARM/RISC-V/RENESAS ARCHITECTURE

Vignesh Raghavendra (1):
      soc: ti: k3-socinfo: Add JTAG ID for AM62LX

Wan Junjie (1):
      bus: fsl-mc: fix GET/SET_TAILDROP command ids

Zelong Dong (1):
      dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Control=
ler

 Documentation/ABI/testing/debugfs-scmi-raw         |  91 +++
 Documentation/ABI/testing/debugfs-turris-mox-rwtm  |  14 -
 .../ABI/testing/sysfs-firmware-turris-mox-rwtm     |   9 -
 .../bindings/cache/andestech,ax45mp-cache.yaml     |  20 +-
 .../bindings/cache/marvell,feroceon-cache.txt      |  16 -
 .../bindings/cache/marvell,kirkwood-cache.yaml     |  45 ++
 .../bindings/cache/marvell,tauros2-cache.txt       |  17 -
 .../bindings/cache/marvell,tauros2-cache.yaml      |  39 +
 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 .../devicetree/bindings/cache/sifive,ccache0.yaml  |  44 +-
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  35 +
 .../bindings/firmware/nxp,imx95-scmi.yaml          |  23 +
 .../bindings/hwinfo/via,vt8500-scc-id.yaml         |  37 +
 .../memory-controllers/mediatek,smi-common.yaml    |   1 +
 .../memory-controllers/mediatek,smi-larb.yaml      |   1 +
 .../memory-controllers/st,stm32mp25-omm.yaml       | 226 ++++++
 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |   1 +
 .../bindings/reset/amlogic,meson-reset.yaml        |  22 +-
 .../reset/renesas,rzv2h-usb2phy-reset.yaml         |  56 ++
 .../bindings/reset/sophgo,sg2042-reset.yaml        |   7 +-
 .../bindings/reset/thead,th1520-reset.yaml         |  44 ++
 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
 .../soc/google/google,gs101-pmu-intr-gen.yaml      |  35 +
 .../soc/mediatek/mediatek,mt8183-dvfsrc.yaml       |   1 +
 .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     |  15 +
 .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           |  24 +-
 .../bindings/soc/samsung/exynos-pmu.yaml           |  15 +
 .../bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml    |  86 +++
 MAINTAINERS                                        |  33 +-
 arch/arm/mach-aspeed/Kconfig                       |   1 -
 drivers/bus/brcmstb_gisb.c                         |  10 +-
 drivers/bus/fsl-mc/dprc-driver.c                   |   2 -
 drivers/bus/fsl-mc/dprc.c                          |   4 +-
 drivers/bus/fsl-mc/fsl-mc-allocator.c              |  21 -
 drivers/bus/fsl-mc/fsl-mc-bus.c                    |  12 +-
 drivers/bus/fsl-mc/fsl-mc-private.h                |   2 -
 drivers/bus/fsl-mc/fsl-mc-uapi.c                   |  11 +-
 drivers/bus/fsl-mc/mc-io.c                         |  19 +-
 drivers/bus/fsl-mc/mc-sys.c                        |   2 +-
 drivers/bus/ti-sysc.c                              |  49 --
 drivers/cache/sifive_ccache.c                      |   2 +
 drivers/firmware/Kconfig                           |  17 +
 drivers/firmware/arm_scmi/Kconfig                  |  13 +
 drivers/firmware/arm_scmi/Makefile                 |   1 +
 drivers/firmware/arm_scmi/bus.c                    |  79 +-
 drivers/firmware/arm_scmi/clock.c                  |  33 +-
 drivers/firmware/arm_scmi/common.h                 |   1 +
 drivers/firmware/arm_scmi/driver.c                 | 119 +--
 drivers/firmware/arm_scmi/protocols.h              |   2 +
 drivers/firmware/arm_scmi/quirks.c                 | 322 ++++++++
 drivers/firmware/arm_scmi/quirks.h                 |  52 ++
 drivers/firmware/arm_scmi/raw_mode.c               |  72 +-
 drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  24 +
 drivers/firmware/arm_scmi/vendors/imx/Makefile     |   2 +
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c | 276 +++++++
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c | 263 +++++++
 drivers/firmware/arm_scmi/vendors/imx/imx95.rst    | 828 ++++++++++++++=
+++++++
 drivers/firmware/imx/Kconfig                       |  22 +
 drivers/firmware/imx/Makefile                      |   2 +
 drivers/firmware/imx/sm-cpu.c                      |  85 +++
 drivers/firmware/imx/sm-lmm.c                      |  91 +++
 drivers/firmware/qcom/qcom_scm.c                   |   3 +
 drivers/firmware/qcom/qcom_scm.h                   |   3 +
 drivers/firmware/qcom/qcom_tzmem.c                 |   1 +
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  16 +-
 drivers/firmware/samsung/exynos-acpm.c             |  58 +-
 drivers/firmware/ti_sci.c                          |  14 +-
 drivers/firmware/turris-mox-rwtm.c                 | 260 +++----
 drivers/memory/Kconfig                             |  23 +-
 drivers/memory/Makefile                            |   1 +
 drivers/memory/bt1-l2-ctl.c                        |   2 +-
 drivers/memory/mtk-smi.c                           |  52 ++
 drivers/memory/omap-gpmc.c                         |  15 +-
 drivers/memory/stm32_omm.c                         | 479 ++++++++++++
 drivers/memory/tegra/Kconfig                       |   8 +-
 drivers/platform/cznic/Kconfig                     |  17 +
 drivers/platform/cznic/Makefile                    |   3 +
 drivers/platform/cznic/turris-omnia-mcu-base.c     |   4 +
 drivers/platform/cznic/turris-omnia-mcu-gpio.c     |  21 +-
 drivers/platform/cznic/turris-omnia-mcu-keyctl.c   | 162 ++++
 drivers/platform/cznic/turris-omnia-mcu-trng.c     |  17 +-
 drivers/platform/cznic/turris-omnia-mcu.h          |  33 +-
 drivers/platform/cznic/turris-signing-key.c        | 193 +++++
 drivers/reset/Kconfig                              |  17 +
 drivers/reset/Makefile                             |   2 +
 drivers/reset/reset-rzv2h-usb2phy.c                | 236 ++++++
 drivers/reset/reset-th1520.c                       | 135 ++++
 drivers/soc/Kconfig                                |   2 +
 drivers/soc/Makefile                               |   2 +
 drivers/soc/amlogic/meson-clk-measure.c            | 461 +++++++++++-
 drivers/soc/aspeed/aspeed-lpc-snoop.c              |  17 +-
 drivers/soc/fsl/Kconfig                            |   2 +-
 drivers/soc/fsl/qbman/qman.c                       |   2 +-
 drivers/soc/fsl/qe/qe_ic.c                         |  15 +-
 drivers/soc/hisilicon/kunpeng_hccs.c               |  42 +-
 drivers/soc/hisilicon/kunpeng_hccs.h               |   2 -
 drivers/soc/imx/soc-imx8m.c                        | 177 +++--
 drivers/soc/mediatek/mtk-dvfsrc.c                  |  53 +-
 drivers/soc/qcom/llcc-qcom.c                       | 497 ++++++++++++-
 drivers/soc/qcom/pmic_glink.c                      |   4 -
 drivers/soc/qcom/pmic_glink_altmode.c              |  30 +-
 drivers/soc/qcom/qcom_pd_mapper.c                  |  11 +
 drivers/soc/qcom/smem.c                            |   2 +-
 drivers/soc/qcom/smp2p.c                           |   2 +-
 drivers/soc/qcom/socinfo.c                         |   1 +
 drivers/soc/renesas/Kconfig                        |  11 +
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/r9a09g056-sys.c                |  75 ++
 drivers/soc/renesas/rz-sysc.c                      |   3 +
 drivers/soc/renesas/rz-sysc.h                      |   1 +
 drivers/soc/samsung/exynos-pmu.c                   |  78 +-
 drivers/soc/samsung/exynos-pmu.h                   |   1 +
 drivers/soc/sophgo/Kconfig                         |  34 +
 drivers/soc/sophgo/Makefile                        |   4 +
 drivers/soc/sophgo/cv1800-rtcsys.c                 |  63 ++
 drivers/soc/sophgo/sg2044-topsys.c                 |  45 ++
 drivers/soc/ti/k3-ringacc.c                        |   2 +-
 drivers/soc/ti/k3-socinfo.c                        |   2 +
 drivers/soc/ti/knav_qmss_queue.c                   |   3 +-
 drivers/soc/ti/wkup_m3_ipc.c                       |   8 +-
 drivers/soc/vt8500/Kconfig                         |  19 +
 drivers/soc/vt8500/Makefile                        |   2 +
 drivers/soc/vt8500/wmt-socinfo.c                   | 125 ++++
 drivers/tee/amdtee/core.c                          |  16 +-
 drivers/tee/optee/smc_abi.c                        |   3 +-
 drivers/tee/tee_core.c                             |  11 +-
 include/dt-bindings/arm/qcom,ids.h                 |   1 +
 include/dt-bindings/reset/thead,th1520-reset.h     |  16 +
 include/linux/bus/stm32_firewall_device.h          |  15 +-
 include/linux/firmware/imx/sm.h                    |  19 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   6 +-
 include/linux/reset.h                              |   6 +
 include/linux/scmi_imx_protocol.h                  |  42 ++
 include/linux/soc/qcom/llcc-qcom.h                 |   8 +
 include/linux/soc/samsung/exynos-regs-pmu.h        |  11 +
 include/linux/turris-signing-key.h                 |  35 +
 136 files changed, 6457 insertions(+), 706 deletions(-)
