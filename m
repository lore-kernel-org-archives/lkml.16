Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4512F7CFF;
	Wed,  2 Jul 2025 18:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751482187; cv=none; b=W9wV0qywgvWF04RKGyWNIhHi8H361GMIcb3Sbtq+/GMwy3OyTW9hzRrLfeK/rSzy9sWvdi/fssJvpflutT/oJQaLQrlRd+JCzn0pVSjPyLdHAyly44OxZkD5ZFAtpJSHNgD8KtmB514uZRxoQ8FbSedZMsS5en0lw2tlh4Vri7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751482187; c=relaxed/simple;
	bh=eVqhSQ0DmB/T9E0XYAMG+NJdcvrBlIx2yIHj4OFRWDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUQOmq5E1XIHwB+3yt9H8YtBSendohNKLk6ZcnWwojxxVO1S9IEHq6BnwnbJ/e/LOuqtBA+V7hdmJC8yC9AK/e5aqWF5ilF2Du8/yDvx5Y1SqF+XEBN44HR+bMSmPj1pbob4nDke56oB5fHSwtJHLOLh+DH37rpRn3cOyC0WsMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TN+2rpN0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TN+2rpN0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3037BC4CEE7;
	Wed,  2 Jul 2025 18:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751482186;
	bh=eVqhSQ0DmB/T9E0XYAMG+NJdcvrBlIx2yIHj4OFRWDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TN+2rpN0mLPurcic/oPC1vHeGgO2PG2w4B/OIDoOvbaFlPtAtklk4QqCDIB29WP1V
	 bvVlSmGSHd8EqCpPG9PSehJziTp1x4RZEyQyU+PDbq85/dTnRNfPrrPLkjQSomD5RQ
	 PAcg6Dhoti40XuTKFlUpaxRgKlhNGr3sjKh5wcyGORFYO24I/BJLw+TmX8iR+Itp+B
	 GAI/mqTOrd9QgZGfnrah1DV8kdN5Dfkyis5bk9+CWAJPc7KYFpyL13ZwRXbDavb5Ge
	 WnqRSML4ePClbqvfDyoSPmhHP6v77in3Aud0S9wVb05U0J9tGIhs3Q0hWhTUxtTju0
	 s7PNiyLdIXE/A==
Date: Wed, 2 Jul 2025 19:49:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ysJ2hjE/bG1NNoPf"
Content-Disposition: inline
In-Reply-To: <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
X-Cookie: You buttered your bread, now lie in it.


--ysJ2hjE/bG1NNoPf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:01:50PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>=20
> AIPS5 is actually AIPSTZ5 as it offers some security-related
> configurations. Since these configurations need to be applied before
> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
> be their parent instead of keeping AIPS5 and adding a child node for
> AIPSTZ5. Also, because of the security configurations, the address space
> of the bus has to be changed to that of the configuration registers.
>=20
> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
> missing 'power-domains' property. The domain needs to be powered on before
> attempting to configure the security-related registers.

I'm seeing failures to probe the audio devices on the i.MX8MP Verdin
system in -next which seem to bisect down to this commit,  I'm seeing
separate boot failures on the EVK so haven't been able to confirm the
status there.  There's no obvious logging, the dt selftest shows:

# not ok 141 /sound
# not ok 142 /sound-hdmi

Full log at:

  https://lava.sirena.org.uk/scheduler/job/1530197#L5119

Full bisect log:

# bad: [50c8770a42faf8b1c7abe93e7c114337f580a97d] Add linux-next specific f=
iles for 20250702
# good: [1b2f703000c0fdae4e348162553e8c1bb9835e00] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [244bc18e5f1875401a4af87d2eae3f9376d9d720] spi: stm32: delete stray=
 tabs in stm32h7_spi_data_idleness()
# good: [7e1c28fbf235791cb5046fafdac5bc16fe8e788d] spi: spi-pci1xxxx: enabl=
e concurrent DMA read/write across SPI transfers
# good: [b9ab3b61824190b1c6b2c59e7ba4de591f24eb92] ASoC: SDCA: Add some ini=
tial IRQ handlers
# good: [c4f2c05ab02952c9a56067aeb700ded95b183570] spi: stm32: fix pointer-=
to-pointer variables usage
# good: [427ceac823e58813b510e585011488f603f0d891] regulator: tps6286x-regu=
lator: Enable REGCACHE_MAPLE
# good: [29ddce17e909779633f856ad1c2f111fbf71c0df] ASoC: codecs: Add calibr=
ation function to aw88399 chip
# good: [ac4c064f67d3cdf9118b9b09c1e3b28b6c10a7ea] spi: dt-bindings: add nx=
p,lpc3220-spi.yaml
# good: [08bf1663c21a3e815eda28fa242d84c945ca3b94] dmaengine: Add devm_dma_=
request_chan()
# good: [2555691165a0285a4617230fed859f20dcc51608] spi: atmel-quadspi: Use =
`devm_dma_request_chan()`
# good: [ce57bc9771411d6d27f2ca7b40396cbd7d684ba9] regulator: core: Don't u=
se "proxy" headers
# good: [0f60ecffbfe35e12eb56c99640ba2360244b5bb3] ASoC: sdw_utils: generat=
e combined spk components string
# good: [9a944494c299fabf3cc781798eb7c02a0bece364] spi: dt-bindings: stm32:=
 deprecate `st,spi-midi-ns` property
# good: [3e36c822506d924894ff7de549b9377d3114c2d7] spi: spi-pci1xxxx: Add s=
upport for per-instance DMA interrupt vectors
# good: [68fbc70ece40139380380dce74059afa592846b3] ASoC: hisilicon: Standar=
dize ASoC menu
# good: [8f9cf02c8852837923f1cdacfcc92e138513325c] spi: microchip-core-qspi=
: Add regular transfers
# good: [17cc308b183308bf5ada36e164284fff7eb064ba] ASoC: wm8524: enable con=
straints when sysclk is configured.
# good: [59566923d955b69bfb1e1163f07dff437dde8c9c] ASoC: SOF: amd: add alte=
rnate machines for ACP7.0 and ACP7.1 platforms
# good: [024f39fff6d222cedde361f7fe34d9ba4e6afb92] regulator: mtk-dvfsrc: A=
dd support for MediaTek MT8196 DVFSRC
# good: [19cbc930c209d59a2c9828de4c7b767e9f14667e] regulator: pca9450: Supp=
ort PWM mode also for pca9451a
# good: [c4ca928a6db1593802cd945f075a7e21dd0430c1] ASoC: hdac_hdmi: Rate li=
mit logging on connection and disconnection
# good: [a48352921f0b15b1f7eff83f5b5613d6ae2350d3] ASoC: codecs: wcd939x: A=
dd defines for major/minor version decoding
# good: [3421d46440ebe0865bec71dbd2330b4e17a425ab] HID: core: Add bus defin=
e for SoundWire bus
# good: [a1d203d390e04798ccc1c3c06019cd4411885d6d] ASoC: SOF: ipc4-pcm: Ena=
ble delay reporting for ChainDMA streams
# good: [2756b7f08ff6ca7c68c8c7dd61c8dc6895c9de34] ASoC: SOF: ipc4-pcm: Har=
monize sof_ipc4_set_pipeline_state() dbg print
# good: [bb48117b79ebc39485f7306d09dc602981fe540f] ASoC: Intel: sof_sdw: Im=
plement add_dai_link to filter HDMI PCMs
# good: [ace9b3daf2b4778358573d3698e34cb1c0fa7e14] ASoC: SOF: ipc4/Intel: A=
dd support for library restore firmware functionality
# good: [5fc2c383125c2b4b6037e02ad8796b776b25e6d0] spi: falcon: mark falcon=
_sflash_xfer() as static
# good: [7f8924e8785b68c998bc1906e049bf5595865e60] ASoC: dt-bindings: cirru=
s,cs42xx8: add 'port' property
# good: [3e1c01d06e1f52f78fe00ef26a9cf80dbb0a3115] regulator: rpi-panel-v2:=
 Add shutdown hook
# good: [d9f38d9824bfb1b046d2e720349d2f45959ab184] ASoC: tegra: AHUB: Remov=
e unneeded semicolon
# good: [d03b53c9139352b744ed007bf562bd35517bacff] dt-bindings: gpio: gpio-=
xilinx: Mark clocks as required property
# good: [dce4bc30f42d313b4dc5832316196411b7f07ad0] spi: spi-fsl-dspi: Rever=
t unintended dependency change in config SPI_FSL_DSPI
# good: [7b2c2f1eb3914f5214a5b2ae966d7d7bb0057582] gpio: Use dev_fwnode() w=
here applicable across drivers
# good: [47972c1c3315672352f25c68f91dd88543541947] ASoC: Intel: Replace dep=
recated strcpy() with strscpy()
# good: [367864935785382bab95f5e5a691535d28f5a21b] gpio: raspberrypi-exp: u=
se new GPIO line value setter callbacks
# good: [5eb8a0d7733d4cd32a776acf1d1aa1c7c01c8a14] ASoC: hdmi-codec: use SN=
D_JACK_AVOUT as jack status
# good: [bb8d8ba4715cb8f997d63d90ba935f6073595df5] ASoC: mediatek: mt8183-a=
fe-pcm: use local `dev` pointer in driver callbacks
# good: [8a5a5cecb79058b608e5562d8998123a3adb313c] ASoC: tas2781: Move the =
"include linux/debugfs.h" into tas2781.h
# good: [a4eb71ff98c4792f441f108910bd829da7a04092] regulator: rpi-panel-v2:=
 Fix missing OF dependency
# good: [6cafcc53eb5fffd9b9bdfde700bb9bad21e98ed3] spi: spi-mt65xx: Add sup=
port for MT6991 Dimensity 9400 SPI IPM
# good: [7e10d7242ea8a5947878880b912ffa5806520705] ASoC: ops: dynamically a=
llocate struct snd_ctl_elem_value
# good: [d6fa0ca959db8efd4462d7beef4bdc5568640fd0] regulator: rpi-panel-v2:=
 Add missing GPIOLIB dependency
# good: [d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4] regulator: rpi-panel-v2:=
 Add regulator for 7" Raspberry Pi 720x1280
# good: [6ba68e5aa9d5d15c8877a655db279fcfc0b38b04] ASoC: renesas: msiof: Co=
nvert to <linux/spi/sh_msiof.h>
# good: [1f5cdb6ab45e1c06ae0953609acbb52f8946b3e8] ASoC: codecs: Add suppor=
t for Richtek RTQ9124
# good: [548d770c330cd1027549947a6ea899c56b5bc4e4] regulator: pca9450: Add =
support for mode operations
# good: [c459262159f39e6e6336797feb975799344b749b] spi: spi-pci1xxxx: Add s=
upport for 25MHz Clock frequency in C0
# good: [267be32b0a7b70cc777f8a46f0904c92c0521d89] ASoC: remove component->=
id
# good: [03b778d1994827ea5cc971dbdfbb457bbb7bfa5d] ASOC: rockchip: Use help=
er function devm_clk_get_enabled()
# good: [f6f914893d478b7ba08e5c375de1ced16deb5e92] ASoC: dt-bindings: tas57=
xx: add tas5753 compatibility
# good: [111a2c8ab462d77d1519b71b46f13ae1b46920b4] ASoC: imx-card: Use help=
er function for_each_child_of_node_scoped()
# good: [9a30e332c36c52e92e5316b4a012d45284dedeb5] spi: spi-fsl-dspi: Enabl=
e support for S32G platforms
# good: [c95e925daa434ee1a40a86aec6476ce588e4bd77] ASoC: Intel: avs: Add rt=
5640 machine board
# good: [e6e8897995a9e6028563ce36c27877e5478c8571] ASoC: qcom: sm8250: Add =
Fairphone 5 soundcard compatible
# good: [c8c4694ede7ed42d8d4db0e8927dea9839a3e248] regmap: kunit: Constify =
regmap_range_cfg array
# good: [ac209bde018fd320b79976657a44c23113181af6] ASoC: tas2781: Drop the =
unnecessary symbol imply
# good: [ece5d881004f041c2e1493436409dbcbea3ad5f8] ASoC: codecs: wcd939x: D=
rop unused 'struct wcd939x_priv' fields
# good: [b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68] ASoC: codecs: wcd939x: A=
dd VDD_PX supply
# good: [7e17e80c3a7eb2734795f66ba946f933412d597f] Merge branch 'for-6.14/s=
tack-order' into for-next
git bisect start '50c8770a42faf8b1c7abe93e7c114337f580a97d' '1b2f703000c0fd=
ae4e348162553e8c1bb9835e00' '244bc18e5f1875401a4af87d2eae3f9376d9d720' '7e1=
c28fbf235791cb5046fafdac5bc16fe8e788d' 'b9ab3b61824190b1c6b2c59e7ba4de591f2=
4eb92' 'c4f2c05ab02952c9a56067aeb700ded95b183570' '427ceac823e58813b510e585=
011488f603f0d891' '29ddce17e909779633f856ad1c2f111fbf71c0df' 'ac4c064f67d3c=
df9118b9b09c1e3b28b6c10a7ea' '08bf1663c21a3e815eda28fa242d84c945ca3b94' '25=
55691165a0285a4617230fed859f20dcc51608' 'ce57bc9771411d6d27f2ca7b40396cbd7d=
684ba9' '0f60ecffbfe35e12eb56c99640ba2360244b5bb3' '9a944494c299fabf3cc7817=
98eb7c02a0bece364' '3e36c822506d924894ff7de549b9377d3114c2d7' '68fbc70ece40=
139380380dce74059afa592846b3' '8f9cf02c8852837923f1cdacfcc92e138513325c' '1=
7cc308b183308bf5ada36e164284fff7eb064ba' '59566923d955b69bfb1e1163f07dff437=
dde8c9c' '024f39fff6d222cedde361f7fe34d9ba4e6afb92' '19cbc930c209d59a2c9828=
de4c7b767e9f14667e' 'c4ca928a6db1593802cd945f075a7e21dd0430c1' 'a48352921f0=
b15b1f7eff83f5b5613d6ae2350d3' '3421d46440ebe0865bec71dbd2330b4e17a425ab' '=
a1d203d390e04798ccc1c3c06019cd4411885d6d' '2756b7f08ff6ca7c68c8c7dd61c8dc68=
95c9de34' 'bb48117b79ebc39485f7306d09dc602981fe540f' 'ace9b3daf2b4778358573=
d3698e34cb1c0fa7e14' '5fc2c383125c2b4b6037e02ad8796b776b25e6d0' '7f8924e878=
5b68c998bc1906e049bf5595865e60' '3e1c01d06e1f52f78fe00ef26a9cf80dbb0a3115' =
'd9f38d9824bfb1b046d2e720349d2f45959ab184' 'd03b53c9139352b744ed007bf562bd3=
5517bacff' 'dce4bc30f42d313b4dc5832316196411b7f07ad0' '7b2c2f1eb3914f5214a5=
b2ae966d7d7bb0057582' '47972c1c3315672352f25c68f91dd88543541947' '367864935=
785382bab95f5e5a691535d28f5a21b' '5eb8a0d7733d4cd32a776acf1d1aa1c7c01c8a14'=
 'bb8d8ba4715cb8f997d63d90ba935f6073595df5' '8a5a5cecb79058b608e5562d899812=
3a3adb313c' 'a4eb71ff98c4792f441f108910bd829da7a04092' '6cafcc53eb5fffd9b9b=
dfde700bb9bad21e98ed3' '7e10d7242ea8a5947878880b912ffa5806520705' 'd6fa0ca9=
59db8efd4462d7beef4bdc5568640fd0' 'd49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4=
' '6ba68e5aa9d5d15c8877a655db279fcfc0b38b04' '1f5cdb6ab45e1c06ae0953609acbb=
52f8946b3e8' '548d770c330cd1027549947a6ea899c56b5bc4e4' 'c459262159f39e6e63=
36797feb975799344b749b' '267be32b0a7b70cc777f8a46f0904c92c0521d89' '03b778d=
1994827ea5cc971dbdfbb457bbb7bfa5d' 'f6f914893d478b7ba08e5c375de1ced16deb5e9=
2' '111a2c8ab462d77d1519b71b46f13ae1b46920b4' '9a30e332c36c52e92e5316b4a012=
d45284dedeb5' 'c95e925daa434ee1a40a86aec6476ce588e4bd77' 'e6e8897995a9e6028=
563ce36c27877e5478c8571' 'c8c4694ede7ed42d8d4db0e8927dea9839a3e248' 'ac209b=
de018fd320b79976657a44c23113181af6' 'ece5d881004f041c2e1493436409dbcbea3ad5=
f8' 'b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68' '7e17e80c3a7eb2734795f66ba94=
6f933412d597f'
# test job: [244bc18e5f1875401a4af87d2eae3f9376d9d720] https://lava.sirena.=
org.uk/scheduler/job/1528313
# test job: [7e1c28fbf235791cb5046fafdac5bc16fe8e788d] https://lava.sirena.=
org.uk/scheduler/job/1525613
# test job: [b9ab3b61824190b1c6b2c59e7ba4de591f24eb92] https://lava.sirena.=
org.uk/scheduler/job/1526381
# test job: [c4f2c05ab02952c9a56067aeb700ded95b183570] https://lava.sirena.=
org.uk/scheduler/job/1526217
# test job: [427ceac823e58813b510e585011488f603f0d891] https://lava.sirena.=
org.uk/scheduler/job/1525665
# test job: [29ddce17e909779633f856ad1c2f111fbf71c0df] https://lava.sirena.=
org.uk/scheduler/job/1523969
# test job: [ac4c064f67d3cdf9118b9b09c1e3b28b6c10a7ea] https://lava.sirena.=
org.uk/scheduler/job/1515918
# test job: [08bf1663c21a3e815eda28fa242d84c945ca3b94] https://lava.sirena.=
org.uk/scheduler/job/1517670
# test job: [2555691165a0285a4617230fed859f20dcc51608] https://lava.sirena.=
org.uk/scheduler/job/1515770
# test job: [ce57bc9771411d6d27f2ca7b40396cbd7d684ba9] https://lava.sirena.=
org.uk/scheduler/job/1515828
# test job: [0f60ecffbfe35e12eb56c99640ba2360244b5bb3] https://lava.sirena.=
org.uk/scheduler/job/1511601
# test job: [9a944494c299fabf3cc781798eb7c02a0bece364] https://lava.sirena.=
org.uk/scheduler/job/1507935
# test job: [3e36c822506d924894ff7de549b9377d3114c2d7] https://lava.sirena.=
org.uk/scheduler/job/1506321
# test job: [68fbc70ece40139380380dce74059afa592846b3] https://lava.sirena.=
org.uk/scheduler/job/1504170
# test job: [8f9cf02c8852837923f1cdacfcc92e138513325c] https://lava.sirena.=
org.uk/scheduler/job/1502886
# test job: [17cc308b183308bf5ada36e164284fff7eb064ba] https://lava.sirena.=
org.uk/scheduler/job/1501534
# test job: [59566923d955b69bfb1e1163f07dff437dde8c9c] https://lava.sirena.=
org.uk/scheduler/job/1499635
# test job: [024f39fff6d222cedde361f7fe34d9ba4e6afb92] https://lava.sirena.=
org.uk/scheduler/job/1499710
# test job: [19cbc930c209d59a2c9828de4c7b767e9f14667e] https://lava.sirena.=
org.uk/scheduler/job/1497296
# test job: [c4ca928a6db1593802cd945f075a7e21dd0430c1] https://lava.sirena.=
org.uk/scheduler/job/1496248
# test job: [a48352921f0b15b1f7eff83f5b5613d6ae2350d3] https://lava.sirena.=
org.uk/scheduler/job/1497384
# test job: [3421d46440ebe0865bec71dbd2330b4e17a425ab] https://lava.sirena.=
org.uk/scheduler/job/1493073
# test job: [a1d203d390e04798ccc1c3c06019cd4411885d6d] https://lava.sirena.=
org.uk/scheduler/job/1491514
# test job: [2756b7f08ff6ca7c68c8c7dd61c8dc6895c9de34] https://lava.sirena.=
org.uk/scheduler/job/1489211
# test job: [bb48117b79ebc39485f7306d09dc602981fe540f] https://lava.sirena.=
org.uk/scheduler/job/1489341
# test job: [ace9b3daf2b4778358573d3698e34cb1c0fa7e14] https://lava.sirena.=
org.uk/scheduler/job/1489277
# test job: [5fc2c383125c2b4b6037e02ad8796b776b25e6d0] https://lava.sirena.=
org.uk/scheduler/job/1486889
# test job: [7f8924e8785b68c998bc1906e049bf5595865e60] https://lava.sirena.=
org.uk/scheduler/job/1486900
# test job: [3e1c01d06e1f52f78fe00ef26a9cf80dbb0a3115] https://lava.sirena.=
org.uk/scheduler/job/1481707
# test job: [d9f38d9824bfb1b046d2e720349d2f45959ab184] https://lava.sirena.=
org.uk/scheduler/job/1481625
# test job: [d03b53c9139352b744ed007bf562bd35517bacff] https://lava.sirena.=
org.uk/scheduler/job/1487618
# test job: [dce4bc30f42d313b4dc5832316196411b7f07ad0] https://lava.sirena.=
org.uk/scheduler/job/1479479
# test job: [7b2c2f1eb3914f5214a5b2ae966d7d7bb0057582] https://lava.sirena.=
org.uk/scheduler/job/1487181
# test job: [47972c1c3315672352f25c68f91dd88543541947] https://lava.sirena.=
org.uk/scheduler/job/1479563
# test job: [367864935785382bab95f5e5a691535d28f5a21b] https://lava.sirena.=
org.uk/scheduler/job/1487335
# test job: [5eb8a0d7733d4cd32a776acf1d1aa1c7c01c8a14] https://lava.sirena.=
org.uk/scheduler/job/1474455
# test job: [bb8d8ba4715cb8f997d63d90ba935f6073595df5] https://lava.sirena.=
org.uk/scheduler/job/1472036
# test job: [8a5a5cecb79058b608e5562d8998123a3adb313c] https://lava.sirena.=
org.uk/scheduler/job/1471845
# test job: [a4eb71ff98c4792f441f108910bd829da7a04092] https://lava.sirena.=
org.uk/scheduler/job/1469016
# test job: [6cafcc53eb5fffd9b9bdfde700bb9bad21e98ed3] https://lava.sirena.=
org.uk/scheduler/job/1468917
# test job: [7e10d7242ea8a5947878880b912ffa5806520705] https://lava.sirena.=
org.uk/scheduler/job/1466037
# test job: [d6fa0ca959db8efd4462d7beef4bdc5568640fd0] https://lava.sirena.=
org.uk/scheduler/job/1464678
# test job: [d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4] https://lava.sirena.=
org.uk/scheduler/job/1463041
# test job: [6ba68e5aa9d5d15c8877a655db279fcfc0b38b04] https://lava.sirena.=
org.uk/scheduler/job/1463332
# test job: [1f5cdb6ab45e1c06ae0953609acbb52f8946b3e8] https://lava.sirena.=
org.uk/scheduler/job/1462965
# test job: [548d770c330cd1027549947a6ea899c56b5bc4e4] https://lava.sirena.=
org.uk/scheduler/job/1460084
# test job: [c459262159f39e6e6336797feb975799344b749b] https://lava.sirena.=
org.uk/scheduler/job/1460986
# test job: [267be32b0a7b70cc777f8a46f0904c92c0521d89] https://lava.sirena.=
org.uk/scheduler/job/1460406
# test job: [03b778d1994827ea5cc971dbdfbb457bbb7bfa5d] https://lava.sirena.=
org.uk/scheduler/job/1461854
# test job: [f6f914893d478b7ba08e5c375de1ced16deb5e92] https://lava.sirena.=
org.uk/scheduler/job/1461456
# test job: [111a2c8ab462d77d1519b71b46f13ae1b46920b4] https://lava.sirena.=
org.uk/scheduler/job/1460852
# test job: [9a30e332c36c52e92e5316b4a012d45284dedeb5] https://lava.sirena.=
org.uk/scheduler/job/1460564
# test job: [c95e925daa434ee1a40a86aec6476ce588e4bd77] https://lava.sirena.=
org.uk/scheduler/job/1460123
# test job: [e6e8897995a9e6028563ce36c27877e5478c8571] https://lava.sirena.=
org.uk/scheduler/job/1461762
# test job: [c8c4694ede7ed42d8d4db0e8927dea9839a3e248] https://lava.sirena.=
org.uk/scheduler/job/1461307
# test job: [ac209bde018fd320b79976657a44c23113181af6] https://lava.sirena.=
org.uk/scheduler/job/1461943
# test job: [ece5d881004f041c2e1493436409dbcbea3ad5f8] https://lava.sirena.=
org.uk/scheduler/job/1461681
# test job: [b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68] https://lava.sirena.=
org.uk/scheduler/job/1461059
# test job: [7e17e80c3a7eb2734795f66ba946f933412d597f] https://lava.sirena.=
org.uk/scheduler/job/1128660
# test job: [50c8770a42faf8b1c7abe93e7c114337f580a97d] https://lava.sirena.=
org.uk/scheduler/job/1530173
# bad: [50c8770a42faf8b1c7abe93e7c114337f580a97d] Add linux-next specific f=
iles for 20250702
git bisect bad 50c8770a42faf8b1c7abe93e7c114337f580a97d
# test job: [108a6ad0bec80613356c69b210bb5ad8b08576e2] https://lava.sirena.=
org.uk/scheduler/job/1530443
# bad: [108a6ad0bec80613356c69b210bb5ad8b08576e2] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
git bisect bad 108a6ad0bec80613356c69b210bb5ad8b08576e2
# test job: [b31f8592766c1a408198963b77bfabb2434764ab] https://lava.sirena.=
org.uk/scheduler/job/1530739
# bad: [b31f8592766c1a408198963b77bfabb2434764ab] Merge branch 'fs-next' of=
 linux-next
git bisect bad b31f8592766c1a408198963b77bfabb2434764ab
# test job: [bb8977f5b28d88e74c23e4af218618c657fd4df4] https://lava.sirena.=
org.uk/scheduler/job/1530814
# bad: [bb8977f5b28d88e74c23e4af218618c657fd4df4] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git
git bisect bad bb8977f5b28d88e74c23e4af218618c657fd4df4
# test job: [d3a07f21b8a377f4eaf8da88b128d222a1b817c7] https://lava.sirena.=
org.uk/scheduler/job/1530844
# good: [d3a07f21b8a377f4eaf8da88b128d222a1b817c7] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
git bisect good d3a07f21b8a377f4eaf8da88b128d222a1b817c7
# test job: [c26527f37efce3a5187699582bee0bb85799ece4] https://lava.sirena.=
org.uk/scheduler/job/1530888
# bad: [c26527f37efce3a5187699582bee0bb85799ece4] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git
git bisect bad c26527f37efce3a5187699582bee0bb85799ece4
# test job: [26f285671a0fd77933d5a18faefbc7dacd6e5e28] https://lava.sirena.=
org.uk/scheduler/job/1530936
# bad: [26f285671a0fd77933d5a18faefbc7dacd6e5e28] Merge branch 'imx/defconf=
ig' into for-next
git bisect bad 26f285671a0fd77933d5a18faefbc7dacd6e5e28
# test job: [b6fb05efd90e0f0bfc3e3d2557b6aa1c65fcbfa6] https://lava.sirena.=
org.uk/scheduler/job/1531005
# good: [b6fb05efd90e0f0bfc3e3d2557b6aa1c65fcbfa6] arm64: dts: imx93-11x11-=
evk: reduce the driving strength of net RXC/TXC
git bisect good b6fb05efd90e0f0bfc3e3d2557b6aa1c65fcbfa6
# test job: [a1a5a0ab552393b033eb1e757676fb90b0a4f80b] https://lava.sirena.=
org.uk/scheduler/job/1531030
# good: [a1a5a0ab552393b033eb1e757676fb90b0a4f80b] Merge branch 'imx/bindin=
gs' into for-next
git bisect good a1a5a0ab552393b033eb1e757676fb90b0a4f80b
# test job: [b63ae4182b6afa89ad0f7cff9c932328d887b936] https://lava.sirena.=
org.uk/scheduler/job/1531088
# good: [b63ae4182b6afa89ad0f7cff9c932328d887b936] ARM: dts: imx28: add pwm=
7 muxing options
git bisect good b63ae4182b6afa89ad0f7cff9c932328d887b936
# test job: [14d0e2aaf99df35a346aa0645c9e12fb2b7c99b9] https://lava.sirena.=
org.uk/scheduler/job/1531180
# bad: [14d0e2aaf99df35a346aa0645c9e12fb2b7c99b9] Merge branch 'imx/dt64' i=
nto for-next
git bisect bad 14d0e2aaf99df35a346aa0645c9e12fb2b7c99b9
# test job: [47773c360293b787a1fe5da5250724abbb4a9e64] https://lava.sirena.=
org.uk/scheduler/job/1531335
# bad: [47773c360293b787a1fe5da5250724abbb4a9e64] arm64: dts: imx8mp: add a=
ipstz-related definitions
git bisect bad 47773c360293b787a1fe5da5250724abbb4a9e64
# test job: [da472d13b1dcf5ffd0e0d151fa83c7059af67d63] https://lava.sirena.=
org.uk/scheduler/job/1531424
# bad: [da472d13b1dcf5ffd0e0d151fa83c7059af67d63] arm64: dts: imx8mp: conve=
rt 'aips5' to 'aipstz5'
git bisect bad da472d13b1dcf5ffd0e0d151fa83c7059af67d63
# test job: [fc0d2840a00d75931777e6dba55fcce40f34a24a] https://lava.sirena.=
org.uk/scheduler/job/1531508
# good: [fc0d2840a00d75931777e6dba55fcce40f34a24a] arm64: dts: imx93-11x11-=
evk: remove the duplicated pinctrl_lpi2c3 node
git bisect good fc0d2840a00d75931777e6dba55fcce40f34a24a
# first bad commit: [da472d13b1dcf5ffd0e0d151fa83c7059af67d63] arm64: dts: =
imx8mp: convert 'aips5' to 'aipstz5'

--ysJ2hjE/bG1NNoPf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhlf0MACgkQJNaLcl1U
h9Al3gf/aWXAjyNnKhVepr6F2nEVgIzYj4wbQDZYKIvs24S7LAKwlkxbKi5ijHtV
C2fkqpROV0oFMFIG6Bfj9iE9eeBiQPjyIfSjkCHz6ngIEHMy6srxe0rytiisZN/N
0FuI1dXmVTixLfcw1QguIQy3ULSy18GHAOtfUF85Tl3LEu7CU7xKbh8/nE2cjQQz
9/prVruROHEw5tgRVV4wt2X+quBoEgFibHpW2YvYyIhRI4phLCXGROEsltq1LrUa
tpYdL+eTauHnD2l5t3bicKuiDMkgq7LB4nk6wUY7V0MyywjNmdiZpzPrrZH+fLc6
KT3S79uoDyvyQUnsW+03C7JNUTW79w==
=Eh1m
-----END PGP SIGNATURE-----

--ysJ2hjE/bG1NNoPf--
