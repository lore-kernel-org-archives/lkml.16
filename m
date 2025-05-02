Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482A8243964;
	Fri,  2 May 2025 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183858; cv=pass; b=nP12n6mT9d1oIYtbfgbII4Tq8Mc9tqVGYGBySYzWGA55UCVCurJJKkrEW6OgJbnzwk7aNBff0jiLybwJwb+P8fUqs3Nl5VZAH8S+A01acoTGwyXBR1aBH6KAiux8a+jrNqRN3SLLVz1deeiTx9fQ5ovRhvcenLnygEpW4jsMEas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183858; c=relaxed/simple;
	bh=Zmtcot/QVRE5ELx+WBpsBAaP5yyL3OntftNJoA5r0Xo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KSGbNz7QGKjr5vl4moBPjslv6PWNXGxmnaiJy14HHs6IOJyR/zIHtLP1kn/WxsFaxfIFrNTaV2xk10Gjv0ykPdP/2BWzmqJlKbLA2ViOms6vmmieshFTj0Y8l/pJ5ZKFh9CMD6mUb9dxlpGBZqQjEUe/bqYrB7GPFZ0Vn+gqllE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=fuUWkhG6; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="fuUWkhG6"
ARC-Seal: i=1; a=rsa-sha256; t=1746183806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hqZQsz3qHpAQw9kbQ/VDExRHIS0uQ0GKxpszv/6YpryNiRVV8zyVa9XvhPXkzBGLekDZtUYFQYigjuJzUi5sN5bGZrfq339f7TtP7WMSq5e1+tBmF9Shjp4PBWwK2VoEOfVWfhrafBLtaqmwmcOKvnp1AaozL48dOoiCHk6oycs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183806; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x/rmusHHaLusTdd7+fM9t0D0DHwPL9qRbBIoqcANwzk=; 
	b=hzm2jG3cDEcDv+X9Nb5v/P0FPC1GGoOxgCQMcvd/JXrkXKAQxd6pJu5QpltsydqjheCFktODgUGCUCw7JjB6DPwP094dTp0JnROg8wXeVe8/NSqZKQXCyUP9KeSl6JkDuvGADZdiSeMUvuCJcl3buT7E8wdlL5BzLA5+4A1wtxI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183806;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=x/rmusHHaLusTdd7+fM9t0D0DHwPL9qRbBIoqcANwzk=;
	b=fuUWkhG6X8l9y8cc5kTVpYO/kvNQw6lMmLjCDz7t/ko5W3+brjovf1Y2i5Bw41M7
	A+X3gmlw0odIdQKmbmGh8JqNJBPrUhTgopXWK2tEId54nkLUVAsW2OgLvIeh8ytquoV
	j7ZDE8TAVdy9Oai8NNPr3ZX4snmsEUaeoLabI8uI=
Received: by mx.zohomail.com with SMTPS id 1746183803976136.65023538001685;
	Fri, 2 May 2025 04:03:23 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v3 00/10] Add RK3576 SAI Audio Controller Support
Date: Fri, 02 May 2025 13:03:06 +0200
Message-Id: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGqmFGgC/23O0Q6CIBTG8VdxXEc7AiJ21Xu0LpCOyVIpMFdzv
 nuEF63W5cf2+x9mEtBbDGSXzcTjZIN1Qxx8kxHT6uGM1J7iJgxYARwK6i+8KCUN2lJTKgTBQVU
 KSQRXj419pNjhuG6Pt3tsjusjqXVAalzf23GXDfgYaeoWwMgbtDaMzj/TZ6Y8iX93p5wClQKla
 ZTkWOm9cV2na+f1NsZTamIfLnL44ixyI4UExYWskf/yZVleJbSQaBgBAAA=
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

Patch 5 and 6 are boring devicetree changes to add the nodes, including
an hdmi_sound node in the SoC tree which can be enabled by individual
boards that enable HDMI.

Patch 7 and 8 enable analog audio and HDMI audio respectively on the
ArmSoM Sige5 board. Patch 8 goes into some schematic-derived knowledge
about where the audio signal can actually be tapped into in order to
test analog audio.

Patch 9 enables the driver in the arm64 defconfig, as the RK3576 is
supported in mainline, so its drivers should be enabled in the
defconfig.

Patch 10 does the same for the codec driver.

To test analog audio on the Sige5, I both soldered to the output 2
testpads, as well as fashioned a cable to plug into the headphone
header. I do have the necessary materials to to make more such cables,
so if you have a Sige5 and want to test this but don't happen to sit on
a pile of 03SUR-32S cables, then you may contact me off-list to request
I send you such a cable from Switzerland, and I'll see what I can do.

HDMI audio is now enabled in this series.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v3:
- Fix auxiliary GRF patch on RK3388 and RV1126, which were
  unintentionally broken previously because I didn't build 32-bit ARM
  platforms. Thanks to Heiko for noticing!
- Drop "ASoC: dt-bindings: add schema for rockchip SAI controllers" as
  it was applied already
- Drop "ASoC: rockchip: add Serial Audio Interface (SAI) driver" as it
  was applied already
- Add codec driver defconfig patch
- Link to v2: https://lore.kernel.org/r/20250410-rk3576-sai-v2-0-c64608346be3@collabora.com

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
Nicolas Frattaroli (10):
      dt-bindings: clock: rk3576: add IOC gated clocks
      clk: rockchip: introduce auxiliary GRFs
      clk: rockchip: introduce GRF gates
      clk: rockchip: add GATE_GRFs for SAI MCLKOUT to rk3576
      arm64: dts: rockchip: Add RK3576 SAI nodes
      arm64: dts: rockchip: Add RK3576 HDMI audio
      arm64: dts: rockchip: Add analog audio on RK3576 Sige5
      arm64: dts: rockchip: Enable HDMI audio on Sige5
      arm64: defconfig: Enable Rockchip SAI
      arm64: defconfig: enable ES8328 and ES8328_I2C

 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  64 ++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 217 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   3 +
 drivers/clk/rockchip/Makefile                      |   1 +
 drivers/clk/rockchip/clk-rk3288.c                  |   2 +-
 drivers/clk/rockchip/clk-rk3328.c                  |   6 +-
 drivers/clk/rockchip/clk-rk3568.c                  |   2 +-
 drivers/clk/rockchip/clk-rk3576.c                  |  59 +++++-
 drivers/clk/rockchip/clk-rv1126.c                  |   2 +-
 drivers/clk/rockchip/clk.c                         |  24 ++-
 drivers/clk/rockchip/clk.h                         |  49 ++++-
 drivers/clk/rockchip/gate-grf.c                    | 105 ++++++++++
 include/dt-bindings/clock/rockchip,rk3576-cru.h    |  10 +
 13 files changed, 526 insertions(+), 18 deletions(-)
---
base-commit: 1c51b1ba38c07e4f999802eb708bf798dd5f5d1b
change-id: 20250305-rk3576-sai-c78e0430898e

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

