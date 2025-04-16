Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC93122541B;
	Wed, 16 Apr 2025 19:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744833394; cv=none; b=V/K/NpkXZGzlkJ0j1jNtKACa1bL8sprwsPKCGHCT9sbClHLlqZAc67OqA2RJgPDsG3mLyW/ejgqini2FyPT3Tk8nN1LVkROACdRugTRGilgyL1HLhEvTKOfJZVpmOfzIuHFFm0TbGLNCFLWZBVs9CjxfswDo8eSSdoRBi1daTBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744833394; c=relaxed/simple;
	bh=ECN0mSjvK7nfTsNYW4AN8TA3yaIpru+1H70FaVM3z9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CtxBFoluI5Mj05dSF7/SgjztrfPBEhSm2p9qqucuvFg+GQ2som22Gh4Fy50sJfp/xVCOjA2RP74ubkK2KPFSZCsb3MPh9fxrKZHHrMlGzkG0Lk9076lTHf4w2zvG/RxyckxZ6ilXvrwbvBsvrsNL/cOF68CnMWrONHZ4nQ2I02s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2B1KDYs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2B1KDYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A121C4CEE2;
	Wed, 16 Apr 2025 19:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744833393;
	bh=ECN0mSjvK7nfTsNYW4AN8TA3yaIpru+1H70FaVM3z9k=;
	h=Date:From:To:Cc:Subject:From;
	b=d2B1KDYs3A2Gp5tV8lUHtlei7281VncOXRu62V2LPyLV8noXMsg9g79lWFVVoF0QM
	 pOfSu0Q3g4zHlK/c3d0C3WlqzRzZBA469+wSciPKAjW3ctP9aGdNmsgOKrCcqcaUrQ
	 MESEaw1Y5D4W0kwSDUJC+ulvKqjSIL2mMPzaDBomGT52BYzm0vF5yCQvTjhX8dDPKT
	 0aVDLV3UPnb1nvrwnFnbqxJCKmll9O+DfF6jhEun3wnPZEfRqnvLtvc+3ZUwXLRv2R
	 y12btYJEbWmRR5GNHBC5m8pv+ebEEJJL/uAP4qeMDT5Ef0s+f+1Q8vXxaZF3KrhOEB
	 q0gvKpnNvkG3A==
Date: Wed, 16 Apr 2025 14:56:31 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree fixes for v6.15, part 1
Message-ID: <20250416195631.GA3799249-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull DT fixes for v6.15.

Rob


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-6.15-1

for you to fetch changes up to d5f49921707cc73376ad6cf8410218b438fcd233:

  dt-bindings: soc: fsl: fsl,ls1028a-reset: Fix maintainer entry (2025-04-11 12:50:34 -0500)

----------------------------------------------------------------
Devicetree fixes for v6.15, part 1:

- A couple of maintainers updates

- Remove obsolete Renesas TPU timer binding

- Add i.MX94 support to nxp,sysctr-timer and fsl,irqsteer

- Add support for 'data-lanes' property in fsl,imx8mq-nwl-dsi binding

----------------------------------------------------------------
Frank Li (3):
      dt-bindings: display: nwl-dsi: Allow 'data-lanes' property for port@1
      dt-bindings: interrupt-controller: fsl,irqsteer: Add i.MX94 support
      dt-bindings: timer: nxp,sysctr-timer: Add i.MX94 support

Geert Uytterhoeven (1):
      dt-bindings: soc: fsl: fsl,ls1028a-reset: Fix maintainer entry

Kuninori Morimoto (1):
      dt-bindings: timer: renesas,tpu: remove obsolete binding

Mubin Sayyed (1):
      dt-bindings: xilinx: Remove myself from maintainership

 .../devicetree/bindings/ata/ceva,ahci-1v84.yaml    |  1 -
 .../bindings/display/bridge/nwl-dsi.yaml           | 18 ++++++-
 .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    |  1 -
 .../interrupt-controller/fsl,irqsteer.yaml         |  1 +
 .../devicetree/bindings/pwm/renesas,tpu-pwm.yaml   |  9 ----
 .../bindings/reset/xlnx,zynqmp-reset.yaml          |  1 -
 .../bindings/soc/fsl/fsl,ls1028a-reset.yaml        |  2 +-
 .../bindings/timer/nxp,sysctr-timer.yaml           | 11 +++--
 .../devicetree/bindings/timer/renesas,tpu.yaml     | 56 ----------------------
 .../devicetree/bindings/usb/dwc3-xilinx.yaml       |  1 -
 .../devicetree/bindings/usb/microchip,usb5744.yaml |  1 -
 .../devicetree/bindings/usb/xlnx,usb2.yaml         |  1 -
 12 files changed, 27 insertions(+), 76 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/renesas,tpu.yaml
