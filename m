Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E1A284B5A;
	Thu, 10 Apr 2025 19:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314061; cv=pass; b=VzYzrwt2N6UbVknt/l02ybKcMMZOhLKX2QMPXhIX1kMQrW3vMNqysya8E7yEGjm0f3FyDte/BNSlVyWTHvu29dwG9Y9LMsviv2PBYK0mJQv8cl47fa05d64DO0Ph7l1ukt5q00qLGlFKl8BmoJfl+kqhyPjicgo1n3iVFP2nDe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314061; c=relaxed/simple;
	bh=y4P7imlbrpHtpxI5trtYQUw/P+MU6B3OrvlrGAbNz50=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bWL+CJ5YGsbOuqcy4DNygkmSC16bl+AlPgWz7Gak5Vck+8JfKyCVygA7HsHVRspYPO4ahCL4YKgy6RHLLBtYz5E86SP/7kN9x6n/3EP7bh2mu1Or1xph1TttuTQBxNUPyuXUJYoh/6LxF2aZKhaK15ETFuBXhcdUrZ6OXOMg3tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=QZGm0s77; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="QZGm0s77"
ARC-Seal: i=1; a=rsa-sha256; t=1744314015; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E/zJsuv/Mg/o+bTFyht2QdaGihzIx9z27ZDE9O6TBuWwAAqsAJeQwc7KFwHyIajOQUsXgaEl2+8IEOW7C2P/kLJ4Ux8Hf3pVpAYAmVLkDjrhIt1eX9d1Dc3tmuOdjP09CIYbdnrPqIFEi61IQ9T1WbpCzbIGlvkn4tLmj43Zj5w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314015; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M6wXfHmCzoXbVXy1UzkezbNDwiWIIAIgN101YJoRkDY=; 
	b=EllrRR1ni8MHAyMbAlHgrxe/Iku7PIQ7IYWxZGYn+qaYgE5COAJgoTXL5cu7jf0BLZzXQy8PeaY+7VlTMolHSGMrmfUadizRIl9YJRLIPYralIJZdIOCYfZ9ZhLKTSsYaREO7cw/a95KbummjToOARy7SxSqNdJzjoI5LnC08X8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314014;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=M6wXfHmCzoXbVXy1UzkezbNDwiWIIAIgN101YJoRkDY=;
	b=QZGm0s778EsF8u8iA03xJTPfBVHhAhDlTwEhdq3Pva4f+A1HMA9j5jOzifmEpwoj
	2iIRXHNXQkCo9iMHHRlyv8/76/Yyndh948geI5UCpkvpYTFPBIjkrFSBBx6dl/uHhPI
	+235KB1Us7RRBFoXXcCy7hkkYhoIDbgtDxMQcslo=
Received: by mx.zohomail.com with SMTPS id 17443140120120.8196558835159067;
	Thu, 10 Apr 2025 12:40:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v2 00/11] Add RK3576 SAI Audio Controller Support
Date: Thu, 10 Apr 2025 21:39:52 +0200
Message-Id: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIge+GcC/22OQQ6CMBBFr0JmbUmhUAor72FYlDrIRKDaYqMh3
 N0KW5dv8uf9v4JHR+ihSVZwGMiTnSPkpwTMoOcbMrpGhpznJRe8ZO4uykoyr4mZSiEvBFe1Qog
 PD4c9vXfZpT3Y4fMVnctxhE57ZMZOEy1NEmSaRZ/J4BceyC/WffYhIdvT/zpDxjiTBUrTKymw1
 mdjx1F31uk0iqHdtu0LbVV9KdUAAAA=
X-Change-ID: 20250305-rk3576-sai-c78e0430898e
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

This series adds support for Rockchip's Serial Audio Interface (SAI)
controller, found on SoCs such as the RK3576. The SAI is a flexible
controller IP that allows both transmitting and receiving digital audio
in the I2S, TDM and PCM formats. Instances of this controller are used
both for externally exposed audio interfaces, as well as for audio on
video interfaces such as HDMI.

Patch 1, 2, 3 and 4 do some preparatory work in the clock bindings and
clock controller. The RK3576 has the SAI0 through SAI4 output mclks as
well as the FSPI0 and FSPI1 clocks gated behind some GRF register
writes. The RK3588 had this for its I2S audio clocks as well, but got
away with not caring about it in mainline because the clocks were
ungated by default.  This is no longer the case with RK3576: the SAI
mclks need to be ungated before they can be used. Note the absence of
the FSPI clks: they're ungated by default, so we're in no hurry to deal
with them in this series.

To sum those up: we need to introduce a new clock branch type, and also
rework the rockchip clock code to deal with multiple separate GRF
regmaps.

NB: checkpatch.pl seems to trip over patch 2 in some way that seems like
a combination of the diff being too clever and at the same time too
stupid.

Patch 5 adds the devicetree schema for the SAI. Right now, we only have
a RK3576 compatible, but as I understand it, the RK3528 uses this audio
controller as well.

Patch 6 is the main course and adds the driver. It's based on the
downstream vendor driver, but substantial changes have been made in the
hopes to make it suitable for upstream inclusion.

Patch 7 and 8 are boring devicetree changes to add the nodes, including
an hdmi_sound node in the SoC tree which can be enabled by individual
boards that enable HDMI.

Patch 9 and 10 enable analog audio and HDMI audio respectively on the
ArmSoM Sige5 board. Patch 9 goes into some schematic-derived knowledge
about where the audio signal can actually be tapped into in order to
test analog audio.

Patch 11 enables the driver in the arm64 defconfig, as the RK3576 is
supported in mainline, so its drivers should be enabled in the
defconfig.

To test analog audio on the Sige5, I both soldered to the output 2
testpads, as well as fashioned a cable to plug into the headphone
header. I do have the necessary materials to to make more such cables,
so if you have a Sige5 and want to test this but don't happen to sit on
a pile of 03SUR-32S cables, then you may contact me off-list to request
I send you such a cable from Switzerland, and I'll see what I can do.

HDMI audio is now enabled in this series.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v2:
- split rockchip clk changes into 3 separate patches, all of which
  build on their own
- driver: expand Kconfig symbol help text to make checkpatch shut up
- driver: remove runtime PM debug messages, as they were redundant
- driver: move of_defice_id table and MODULE_DEVICE_TABLE to be above
  the platform_driver struct and below the probe function, as is done in
  many other drivers
- driver: drop of_match_ptr
- driver: drop MODULE_ALIAS
- driver: remove the confusing hclk disable comment in the probe
  function
- driver: remove quirks handling, which only existed for
  rockchip,always-on purposes. Downstream does not appear to need this
  quirk for any sai implementations. It can always be added back later
  when the problem, if there is any, is better understood.
- driver: fix hw_params when the number of requested channels is lower
  than twice the number of lanes in non-TDM mode. Without this, playing
  back stereo audio on an 8-channel SAI would fail to set the hw_params
- driver: when in I2S TDM mode, set the XFER delay to 1 aka half a cycle
  This makes the output waveform line up with both what RK3568 I2S-TDM
  and the TI TAS6424 codec describe as correct TDM'd I2S in their
  datasheets, namely that on the first rising SCLK pulse after LRCK is
  high, there's audio data ready.
- driver: treat set_tdm_slot with 0 slots as disabling TDM. This lines
  up with what the function documentation for ASoC core's
  snd_soc_dai_set_tdm_slot says it'll do if it's called with 0 slots,
  but in practice that function seems broken because it'll just pass
  the signed number of slots to the unsigned parameter of the mask
  generation function, which treats 0 slots as an error, making the
  caller snd_soc_dai_set_tdm_slot function bail out before ever
  giving any driver set_tdm_slot callback the 0 slot number. If that
  ever gets fixed (I hacked around it to test it), then our driver will
  be able to turn off TDM mode at runtime.
- ASoC bindings: rename bindings file from rockchip,sai.yaml to
  rockchip,rk3576-sai.yaml
- ASoC bindings: remove extraneous blank line
- ASoC bindings: change resets property to use an items listing
- ASoC bindings: fix rockchip,sai-(t|r)x-route property constraints
- ASoC bindings: remove rockchip,always-on
- RK3576 dts: add tx/rx-route to all internal SAI nodes. This is needed
  because they all can do either 8CH TX, 8CH TXRX or 8CH RX, and an
  absent route property is understood to be just 2CH if the direction is
  present.
- RK3576 dts: add hdmi_sound node
- Sige5 dts: enable hdmi_sound
- Now based on v6.15-rc1
- Link to v1: https://lore.kernel.org/r/20250305-rk3576-sai-v1-0-64e6cf863e9a@collabora.com

---
Nicolas Frattaroli (11):
      dt-bindings: clock: rk3576: add IOC gated clocks
      clk: rockchip: introduce auxiliary GRFs
      clk: rockchip: introduce GRF gates
      clk: rockchip: add GATE_GRFs for SAI MCLKOUT to rk3576
      ASoC: dt-bindings: add schema for rockchip SAI controllers
      ASoC: rockchip: add Serial Audio Interface (SAI) driver
      arm64: dts: rockchip: Add RK3576 SAI nodes
      arm64: dts: rockchip: Add RK3576 HDMI audio
      arm64: dts: rockchip: Add analog audio on RK3576 Sige5
      arm64: dts: rockchip: Enable HDMI audio on Sige5
      arm64: defconfig: Enable Rockchip SAI

 .../bindings/sound/rockchip,rk3576-sai.yaml        |  144 ++
 MAINTAINERS                                        |    7 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |   64 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  217 +++
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-rk3328.c                  |    6 +-
 drivers/clk/rockchip/clk-rk3568.c                  |    2 +-
 drivers/clk/rockchip/clk-rk3576.c                  |   59 +-
 drivers/clk/rockchip/clk.c                         |   24 +-
 drivers/clk/rockchip/clk.h                         |   49 +-
 drivers/clk/rockchip/gate-grf.c                    |  105 ++
 include/dt-bindings/clock/rockchip,rk3576-cru.h    |   10 +
 sound/soc/rockchip/Kconfig                         |   10 +
 sound/soc/rockchip/Makefile                        |    2 +
 sound/soc/rockchip/rockchip_sai.c                  | 1555 ++++++++++++++++++++
 sound/soc/rockchip/rockchip_sai.h                  |  251 ++++
 17 files changed, 2491 insertions(+), 16 deletions(-)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250305-rk3576-sai-c78e0430898e

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

