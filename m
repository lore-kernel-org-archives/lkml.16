Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525421FC3;
	Fri,  9 May 2025 01:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746755571; cv=none; b=jNAeFurC8EaKTq1eorzA6VmTH8i87RYd1+Fhg/KpD6ynWO4CBxmhgh4nbUo273FMi/6VMMHK8Cw4BmD4EVneA7GCc6Cd6GzP51YSjNy7VVX5EZnxCKWYBEjQGnjAEcD0KEm/hdF809pSFLOLi/JrwU/pJc+L+3IHG8qsILCxJQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746755571; c=relaxed/simple;
	bh=qZID/NCrhCrIsR7QFGi0uJLX9zgPVScBMJDweqLVU3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5tTzWOgjbFxwj1slO/D+GcLvfcDOGGJwVC9+Vphjs6sUw0VNB63DqQje5p1z1esHGUyXEppCtXWmZXdlxj5aJLBeTm7pO/wIcBXgG3V0TVI3e19I+Bvrmaf6ggXpGL64jR9Ek5D9cRg/g+0uylp913gh3jp8UkgXAi8oEKRJns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiXEwClX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiXEwClX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D705C4CEE7;
	Fri,  9 May 2025 01:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746755570;
	bh=qZID/NCrhCrIsR7QFGi0uJLX9zgPVScBMJDweqLVU3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uiXEwClXw5NcpmNEsPRcgJq2k3yMtkT8jcAShUGbK6a5vHaT0OBwFwg1646Dt32sp
	 neRH0QFYnWp7jbLStRcgrEA+YiLEiKH3rTkDSyIYwvBSwgHJX/cV24A4h99vGFsCH1
	 jhZQOuVXqi/cIDPmVn5E3ju8tgKRpV+7pKETVpbTgHnTuc2XRREmKFtf/43PWAfxEg
	 RhF8JSkqHVVP85kqz5JB5Xp9KVczDsP8xllmHcopJqBpAorBnrsA+PhMsLHIXJkiwG
	 n7EnF8lzOgLoCNJp3TmdP16kqD5Ky9QxCd6XrEZzwjCCHe9cjJP6hP2DlK762HBm4q
	 4kuWjw1F79aiw==
Date: Fri, 9 May 2025 10:52:47 +0900
From: Mark Brown <broonie@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v12 11/19] clk: imx: add support for i.MX8MM anatop clock
 driver
Message-ID: <aB1f74ufYoNmXfEn@finisterre.sirena.org.uk>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <20250424062154.2999219-12-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="naJDn4sdZ1Rw6U/W"
Content-Disposition: inline
In-Reply-To: <20250424062154.2999219-12-dario.binacchi@amarulasolutions.com>
X-Cookie: Eat right, stay fit, and die anyway.


--naJDn4sdZ1Rw6U/W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 08:21:41AM +0200, Dario Binacchi wrote:
> Support NXP i.MX8M anatop PLL module which generates PLLs to CCM root.
> By doing so, we also simplify the CCM driver code. The changes are
> backward compatible.

This patch, which has been in -next for the past few days as
3cbc38cf42ca42d2, breaks boot on i.MX8MP platforms (I have the EVK and
Verdin).  We die with:

[    1.439320] i.MX clk 1: register failed with -2
[    1.441014] i.MX clk 2: register failed with -2
[    1.445610] imx8mm-anatop 30360000.clock-controller: NXP i.MX8MM anatop =
clock driver probed
[    1.455068] Unable to handle kernel paging request at virtual address ff=
fffffffffffffe

=2E..

[    1.634650] Call trace:
[    1.637102]  __clk_get_hw+0x4/0x18 (P)
[    1.640862]  imx8mp_clocks_probe+0xdc/0x2f50
[    1.645152]  platform_probe+0x68/0xc4
[    1.648827]  really_probe+0xbc/0x298
[    1.652413]  __driver_probe_device+0x78/0x12c

Full log at:

   https://lava.sirena.org.uk/scheduler/job/1371067

bisect data (not the actual bisetion as it'd run previously but I didn't
get a chance to check the results, has all the commits and their test
results though):

# bad: [f48887a98b78880b7711aca311fbbbcaad6c4e3b] Add linux-next specific f=
iles for 20250508
# good: [4ea0e68600c61f7d18b218d9af98c5c3bd23e856] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [d75d38dc460452cc8bbca483dee65839e11c71fe] ASoC: tas2781: Add a deb=
ugfs node for acoustic tuning
# good: [5bf5bdfd007e07f2ec5b3e07aa02616f4eebef67] ASoC: codec: cs42l52: Co=
nvert to GPIO descriptors
# good: [7b400c9ab879a86aa4b9bf5d9fdd3df558eed9b5] ASoC: SOF: add disable_f=
unction_topology module parameter
# good: [9f7cd1bcb6363368abc954ff4e727b579813c697] spi: nxp-fspi: use devm =
instead of remove for driver detach
# good: [ad6d689e776478113aeef7bfb0e4222b1ff2a986] ASoC: amd: sof_amd_sdw: =
add logic to get cpu_pin_id for ACP7.0/ACP7.1 platforms
# good: [406fbc4d0fb34c16718551bb8f4c776710f63b55] ASoC: cs35l56: Read Sili=
con ID from DIE_STS registers for CS35L63
# good: [a71b261c19a455f7f8e560b4ddfac44d3150ae39] ASoC: SOF: imx8m: Use re=
set controller API to control the DSP
# good: [6c965d39af98a8b79668898b3a2af40d11179ff4] ASoC: Intel: sof_sdw: Av=
oid NULL check fail when re-probing
# good: [222a87f6b94f6f177e896d6fcdc7881480344e34] spi: cadence-quadspi: As=
sume device could match via platform
# good: [14a3fd030c033453d436233f4c422b4903786ed3] ASoC: intel: atom: Retur=
n -ENOMEM if pcim_iomap() fails
# good: [17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8] clk: imx: add hw API imx=
_anatop_get_clk_hw
# good: [e68074c63fded9468c513f65734ffb4c80dc2a6d] ASoC: SOF: amd: add buil=
d support for soundwire
# good: [233d740e3a819829ccd6d21319015a94349d64eb] spi: loopback-test: Simp=
lify strange loopback value check
# good: [63e5784d640a5c61a828d33bee24fea4244e479c] Merge branch 'ti-k3-dts-=
next' into ti-next
# good: [2dbe74c63cb73829be0aab0d0e7e68b87071b5fa] spi: dt-bindings: spi-qp=
ic-snand: Add IPQ5018 compatible
# good: [f1471bc435afa31c8c0c58551922830dc8f4b06b] regulator: tps65219: Add=
 TI TPS65214 Regulator Support
# good: [2056d7a7df5d9a08144671afccb6970ccd595b89] ASoC: fsl_rpmsg: Allocat=
e a smaller buffer size for capture stream
# good: [fed0805ffd76161ed8c056ea30b36550eda8e106] ASoC: mediatek: mt8195: =
use snd_soc_dlc_is_dummy()
# good: [178c169a30b011971cbbf9c79032b5898b1b07de] ASoC: codec: twl4030: Co=
nvert to GPIO descriptors
# good: [d20df86b056b95845f6ed52da1010059202a0c23] ASoC: Intel: avs: Fix kc=
alloc() sizes
# good: [e6702c44c2adb28b62f81de498e9b1e4562ce660] spi: axi-spi-engine: omi=
t SYNC from offload instructions
# good: [94602d84163c127ec2374fba0fcb6587a07785ce] ASoC: wm_adsp: Don't use=
 no_free_ptr() when passing to PTR_ERR()
# good: [d30e845b0ae63400738709ca624a4a7bb69c4ba2] regcache: Use sort()'s d=
efault swap() implementation
# good: [64c05a1d66193b3a40ad1f29c3d8ba5483e4e0dc] spi: spi-qpic-snand: rem=
ove unused 'wlen' member of 'struct qpic_spi_nand'
# good: [c61caec22820f24bb155929f5cee8c1ccfe92f77] ASoC: renesas: add MSIOF=
 sound support
# good: [0787a08ae785366b9473905fc8bf23f165a08b8d] ASoC: starfive: Use max(=
) to simplify code in jh7110_tdm_syncdiv()
# good: [18197e98353d931fc7bb2bb9ec671d3aa407831d] spi: meson-spicc: add DM=
A support
# good: [f198b6b256aabe6d136401505e974ef2eb2df4af] ASoC: codec: tpa6130a2: =
Convert to GPIO descriptors
# good: [cce73cf7cc56a04cf0dd1e1f93b4002c00751ebe] MAINTAINERS: ASoC: Simpl=
ify references to Cirrus Logic include files
# good: [e358e012a69a3d553803cbe62d9f6eeea57726fc] ASoC: codecs: wcd938x: d=
rop unnecessary mux flag assignment
# good: [cf0668184d1d2f9ad3f98dd5bbe0ed4d9d090eaa] spi: sh-msiof: ignore dr=
iver probing if it was MSIOF Sound
# good: [c283fcdc4e2b89678c171691fd26f576139fc256] spi: tegra210-quad: Upda=
te dummy sequence configuration
# good: [b50a1e1f3c4630f729629a787d891d7b4348007f] spi: intel: Improve reso=
urce mapping
# good: [5410aa3aa7f7dfcbdfcf94034595765d7e69ead3] regulator: pf9453: conve=
rt to use maple tree register cache
# good: [6d7ee6de75010ed5d70f1c496070c4a7cd1968b5] ASoC: adau7118: Allow ds=
p_a mode
# good: [e8ac7336dd62f0443a675ed80b17f0f0e6846e20] regulator: max20086: Cha=
nge enable gpio to optional
# good: [0c9f82446123635cfbb8ceeca074f2dce6a0ccae] ASoC: dt-bindings: fsl,m=
qs: Document audio graph port
# good: [cc78d1eaabad3caf3c425c83037cd8ba1c9f2bc6] ASoC: rockchip: add Seri=
al Audio Interface (SAI) driver
# good: [9ef24511d29f0300fc7e9d4a5ea38d78e9eef73e] ASoC: wm8998: Add Kconfi=
g prompt
# good: [296e8d289bdd7eb0d832683ebd3e847fbb4c1b12] spi: offload: remove unn=
ecessary check on trigger->ops
# good: [4cc9cf2f437ccf6915100c2f38f63cfb1abad6f9] spi: dt-bindings: Fix de=
scription mentioning a removed property
# good: [e30b7a75666b3f444abfabed6a144642fa9994d8] spi: dw: Use spi_bpw_to_=
bytes() helper
# good: [5b974f53424d16165b606e2e2f9208d450a5723c] ASoC: dt-bindings: mt819=
5: add missing audio routing and link-name
# good: [d981e7b3f25fbabca9cdd02aa2a8f16d6f235fc2] spi: pci1xxxx: Use non-h=
ybrid PCI devres API
# good: [4308487b29f98785ef50dd82fdfca382134b33e7] firmware: cs_dsp: Add so=
me sanity-checking to test harness
# good: [7ed50dc550b0a3bad82f675aaefd8cd00362672d] ASoC: cs48l32: Fix spell=
ing mistake "exceeeds" -> "exceeds"
# good: [51f04358d8c887c5d117440335c7f94285a403f2] ASoC: cs-amp-lib-test: U=
se flex_array_size()
# good: [e2bcbf99d045f6ae3826e39d1ed25978de17cbfe] ASoC: cs48l32: Add drive=
r for Cirrus Logic CS48L32 audio DSP
# good: [fcdf212fd9b36c299d90229e9546c077db2215ce] ASoC: cs-amp-lib: Annota=
te struct cirrus_amp_efi_data with __counted_by()
# good: [2b4ce994afca0690ab79b7860045e6883e8706db] ASoC: simple-card-utils:=
 fixup dlc->xxx handling for error case
# good: [46e7ea05bf5d9fe4d05e173c824ae173c956cb5f] ASoC: cs-amp-lib: Replac=
e offsetof() with struct_size()
# good: [4f8ef33dd44a3d1136d3934609b8a43e62aaaa0d] ASoC: soc_sdw_utils: ski=
p the endpoint that doesn't present
# good: [7762fdab23100514e5cb612331c96bd65126ada5] regulator: adp5055: Remo=
ve unneeded semicolon
# good: [38c2585c7439cc678ae105dd826f10321db29552] ASoC: codecs: Add suppor=
t for Richtek rt9123p
# good: [8d2e914482311f7746fe7b0e520bd42794d6aed8] ALSA: hda: cirrus_scodec=
_test: use new GPIO line value setter callbacks
# good: [436a3cc8afbf34bb68166c2c5c19ca5113c0c756] ASoC: ac97: Add DT suppo=
rt
# good: [186dfc85f9a824e3f8383322747ca75e988486e9] ASoC: tas2764: expose di=
e temp to hwmon
# good: [279b418f477fd6c1c21b1cf212837622c774f15f] spi: fsl-qspi: Optimize =
fsl_qspi struct
# good: [e78e7856d233010e6afef62f15567a8e7777c8bc] ASoC: test-component: ad=
d set_tdm_slot stub implementation
# good: [7a978d8fcf57b283cb8c88dd4c9431502bd36ea8] spi: amd: add CONFIG_PCI=
 dependency
# good: [28cce24d6596a3d8a34689031f2a8a5ac918cde5] regulator: adp5055: remo=
ve duplicate device table
# good: [b5d057a86e2086af0b1e6d0ca8b306be1c73a627] ASoC: wm_adsp: Use vmemd=
up_user() instead of open-coding
# good: [3f7b48efb79d91883d98dd7e33dc2a0abfa9f923] spi: fsl-qspi: Simplify =
probe error handling using managed API
# good: [aaf6223ea2a1ff9316a81bf851fd5a0e82635b60] regulator: don't compare=
 raw GPIO descriptor pointers
# good: [e686365c0411275474527c2055ac133f2eb47526] spi: spi_amd: Fix an IS_=
ERR() vs NULL check in probe
# good: [147b2a96f24e0cfcc476378f9356b30662045c7e] regulator: adp5055: Add =
driver for adp5055
# good: [265daffe788aa1cc5925d0afcde4fe6e99c66638] gpio: provide gpiod_is_e=
qual()
# good: [5e21900ef64244fadeddc9015e8b8307d116764a] spi: xcomm: use new GPIO=
 line value setter callbacks
# good: [936df52c29b0d422665c5e84b0cffae61611411b] regulator: rpi-panel-att=
iny: use new GPIO line value setter callbacks
# good: [4c035fab9f42071c4024495afb2cec1409280eed] ASoC: tas2781-i2c: Remov=
e unnecessary NULL check before release_firmware()
# good: [8d18e67abbdf380cd1cfd2c313aac625092d7777] ASoC: Intel: avs: Suppor=
t 16 TDMs in dynamic assignment
# good: [93fa44f84704dfedc4fe06b89bebc8cfaa5f525b] ASoC: Intel: avs: boards=
: Change ssm4567 card name
# good: [ce2eadc6f99263dd200e52f692dc7a22698c99f3] regulator: s5m8767: Conv=
ert to GPIO descriptors
# good: [b3d9e96c96b0076a11aa1001d55b3dc189b8cd1c] regulator: pf9453: Impro=
ve documentation for pf9453_regulator_set_ramp_delay_regmap
# good: [387ddbc7d474967589de15043b47a441f95a50f2] ALSA: hda: Select avs-dr=
iver by default on FCL
# good: [4e310626eb4df52a31a142c1360fead0fcbd3793] gpiolib: of: Add polarit=
y quirk for s5m8767
# good: [b644c2776652671256edcd7a8e71161e212b59ac] spi: spi_amd: Add PCI-ba=
sed driver for AMD HID2 SPI controller
# good: [69e3433fa5e24edc94e94b4f34e3dbb754bdedbf] spi: spi-stm32-ospi: Mak=
e "resets" a required property
# good: [ea61f39b38bdbb7c77ba2c70e130acdb808c8d68] ASoC: sta32x: Remove unn=
ecessary NULL check before clk_disable_unprepare()
# good: [eec611d26f84800852a9badbeafa76db3cdc9118] ASoC: codecs: wcd938x: a=
dd mux control support for hp audio mux
# good: [d5099bc1b56417733f4cccf10c61ee74dadd5562] ASoC: codec: wcd9335: Co=
nvert to GPIO descriptors
# good: [1d9119794c10023ebd7c901aa9aa2c74eb833177] ASoC: fsl_sai: separate =
set_tdm_slot() for tx and rx
git bisect start 'f48887a98b78880b7711aca311fbbbcaad6c4e3b' '4ea0e68600c61f=
7d18b218d9af98c5c3bd23e856' 'd75d38dc460452cc8bbca483dee65839e11c71fe' '5bf=
5bdfd007e07f2ec5b3e07aa02616f4eebef67' '7b400c9ab879a86aa4b9bf5d9fdd3df558e=
ed9b5' '9f7cd1bcb6363368abc954ff4e727b579813c697' 'ad6d689e776478113aeef7bf=
b0e4222b1ff2a986' '406fbc4d0fb34c16718551bb8f4c776710f63b55' 'a71b261c19a45=
5f7f8e560b4ddfac44d3150ae39' '6c965d39af98a8b79668898b3a2af40d11179ff4' '22=
2a87f6b94f6f177e896d6fcdc7881480344e34' '14a3fd030c033453d436233f4c422b4903=
786ed3' '17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8' 'e68074c63fded9468c513f6=
5734ffb4c80dc2a6d' '233d740e3a819829ccd6d21319015a94349d64eb' '63e5784d640a=
5c61a828d33bee24fea4244e479c' '2dbe74c63cb73829be0aab0d0e7e68b87071b5fa' 'f=
1471bc435afa31c8c0c58551922830dc8f4b06b' '2056d7a7df5d9a08144671afccb6970cc=
d595b89' 'fed0805ffd76161ed8c056ea30b36550eda8e106' '178c169a30b011971cbbf9=
c79032b5898b1b07de' 'd20df86b056b95845f6ed52da1010059202a0c23' 'e6702c44c2a=
db28b62f81de498e9b1e4562ce660' '94602d84163c127ec2374fba0fcb6587a07785ce' '=
d30e845b0ae63400738709ca624a4a7bb69c4ba2' '64c05a1d66193b3a40ad1f29c3d8ba54=
83e4e0dc' 'c61caec22820f24bb155929f5cee8c1ccfe92f77' '0787a08ae785366b94739=
05fc8bf23f165a08b8d' '18197e98353d931fc7bb2bb9ec671d3aa407831d' 'f198b6b256=
aabe6d136401505e974ef2eb2df4af' 'cce73cf7cc56a04cf0dd1e1f93b4002c00751ebe' =
'e358e012a69a3d553803cbe62d9f6eeea57726fc' 'cf0668184d1d2f9ad3f98dd5bbe0ed4=
d9d090eaa' 'c283fcdc4e2b89678c171691fd26f576139fc256' 'b50a1e1f3c4630f72962=
9a787d891d7b4348007f' '5410aa3aa7f7dfcbdfcf94034595765d7e69ead3' '6d7ee6de7=
5010ed5d70f1c496070c4a7cd1968b5' 'e8ac7336dd62f0443a675ed80b17f0f0e6846e20'=
 '0c9f82446123635cfbb8ceeca074f2dce6a0ccae' 'cc78d1eaabad3caf3c425c83037cd8=
ba1c9f2bc6' '9ef24511d29f0300fc7e9d4a5ea38d78e9eef73e' '296e8d289bdd7eb0d83=
2683ebd3e847fbb4c1b12' '4cc9cf2f437ccf6915100c2f38f63cfb1abad6f9' 'e30b7a75=
666b3f444abfabed6a144642fa9994d8' '5b974f53424d16165b606e2e2f9208d450a5723c=
' 'd981e7b3f25fbabca9cdd02aa2a8f16d6f235fc2' '4308487b29f98785ef50dd82fdfca=
382134b33e7' '7ed50dc550b0a3bad82f675aaefd8cd00362672d' '51f04358d8c887c5d1=
17440335c7f94285a403f2' 'e2bcbf99d045f6ae3826e39d1ed25978de17cbfe' 'fcdf212=
fd9b36c299d90229e9546c077db2215ce' '2b4ce994afca0690ab79b7860045e6883e8706d=
b' '46e7ea05bf5d9fe4d05e173c824ae173c956cb5f' '4f8ef33dd44a3d1136d3934609b8=
a43e62aaaa0d' '7762fdab23100514e5cb612331c96bd65126ada5' '38c2585c7439cc678=
ae105dd826f10321db29552' '8d2e914482311f7746fe7b0e520bd42794d6aed8' '436a3c=
c8afbf34bb68166c2c5c19ca5113c0c756' '186dfc85f9a824e3f8383322747ca75e988486=
e9' '279b418f477fd6c1c21b1cf212837622c774f15f' 'e78e7856d233010e6afef62f155=
67a8e7777c8bc' '7a978d8fcf57b283cb8c88dd4c9431502bd36ea8' '28cce24d6596a3d8=
a34689031f2a8a5ac918cde5' 'b5d057a86e2086af0b1e6d0ca8b306be1c73a627' '3f7b4=
8efb79d91883d98dd7e33dc2a0abfa9f923' 'aaf6223ea2a1ff9316a81bf851fd5a0e82635=
b60' 'e686365c0411275474527c2055ac133f2eb47526' '147b2a96f24e0cfcc476378f93=
56b30662045c7e' '265daffe788aa1cc5925d0afcde4fe6e99c66638' '5e21900ef64244f=
adeddc9015e8b8307d116764a' '936df52c29b0d422665c5e84b0cffae61611411b' '4c03=
5fab9f42071c4024495afb2cec1409280eed' '8d18e67abbdf380cd1cfd2c313aac625092d=
7777' '93fa44f84704dfedc4fe06b89bebc8cfaa5f525b' 'ce2eadc6f99263dd200e52f69=
2dc7a22698c99f3' 'b3d9e96c96b0076a11aa1001d55b3dc189b8cd1c' '387ddbc7d47496=
7589de15043b47a441f95a50f2' '4e310626eb4df52a31a142c1360fead0fcbd3793' 'b64=
4c2776652671256edcd7a8e71161e212b59ac' '69e3433fa5e24edc94e94b4f34e3dbb754b=
dedbf' 'ea61f39b38bdbb7c77ba2c70e130acdb808c8d68' 'eec611d26f84800852a9badb=
eafa76db3cdc9118' 'd5099bc1b56417733f4cccf10c61ee74dadd5562' '1d9119794c100=
23ebd7c901aa9aa2c74eb833177'
# test job: [d75d38dc460452cc8bbca483dee65839e11c71fe] https://lava.sirena.=
org.uk/scheduler/job/1365900
# test job: [5bf5bdfd007e07f2ec5b3e07aa02616f4eebef67] https://lava.sirena.=
org.uk/scheduler/job/1362764
# test job: [7b400c9ab879a86aa4b9bf5d9fdd3df558eed9b5] https://lava.sirena.=
org.uk/scheduler/job/1362945
# test job: [9f7cd1bcb6363368abc954ff4e727b579813c697] https://lava.sirena.=
org.uk/scheduler/job/1362536
# test job: [ad6d689e776478113aeef7bfb0e4222b1ff2a986] https://lava.sirena.=
org.uk/scheduler/job/1363414
# test job: [406fbc4d0fb34c16718551bb8f4c776710f63b55] https://lava.sirena.=
org.uk/scheduler/job/1359624
# test job: [a71b261c19a455f7f8e560b4ddfac44d3150ae39] https://lava.sirena.=
org.uk/scheduler/job/1359531
# test job: [6c965d39af98a8b79668898b3a2af40d11179ff4] https://lava.sirena.=
org.uk/scheduler/job/1358498
# test job: [222a87f6b94f6f177e896d6fcdc7881480344e34] https://lava.sirena.=
org.uk/scheduler/job/1357704
# test job: [14a3fd030c033453d436233f4c422b4903786ed3] https://lava.sirena.=
org.uk/scheduler/job/1356472
# test job: [17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8] https://lava.sirena.=
org.uk/scheduler/job/1364266
# test job: [e68074c63fded9468c513f65734ffb4c80dc2a6d] https://lava.sirena.=
org.uk/scheduler/job/1351535
# test job: [233d740e3a819829ccd6d21319015a94349d64eb] https://lava.sirena.=
org.uk/scheduler/job/1351736
# test job: [63e5784d640a5c61a828d33bee24fea4244e479c] https://lava.sirena.=
org.uk/scheduler/job/1363498
# test job: [2dbe74c63cb73829be0aab0d0e7e68b87071b5fa] https://lava.sirena.=
org.uk/scheduler/job/1347311
# test job: [f1471bc435afa31c8c0c58551922830dc8f4b06b] https://lava.sirena.=
org.uk/scheduler/job/1347249
# test job: [2056d7a7df5d9a08144671afccb6970ccd595b89] https://lava.sirena.=
org.uk/scheduler/job/1347094
# test job: [fed0805ffd76161ed8c056ea30b36550eda8e106] https://lava.sirena.=
org.uk/scheduler/job/1347380
# test job: [178c169a30b011971cbbf9c79032b5898b1b07de] https://lava.sirena.=
org.uk/scheduler/job/1343363
# test job: [d20df86b056b95845f6ed52da1010059202a0c23] https://lava.sirena.=
org.uk/scheduler/job/1343570
# test job: [e6702c44c2adb28b62f81de498e9b1e4562ce660] https://lava.sirena.=
org.uk/scheduler/job/1339740
# test job: [94602d84163c127ec2374fba0fcb6587a07785ce] https://lava.sirena.=
org.uk/scheduler/job/1339879
# test job: [d30e845b0ae63400738709ca624a4a7bb69c4ba2] https://lava.sirena.=
org.uk/scheduler/job/1339607
# test job: [64c05a1d66193b3a40ad1f29c3d8ba5483e4e0dc] https://lava.sirena.=
org.uk/scheduler/job/1328048
# test job: [c61caec22820f24bb155929f5cee8c1ccfe92f77] https://lava.sirena.=
org.uk/scheduler/job/1329660
# test job: [0787a08ae785366b9473905fc8bf23f165a08b8d] https://lava.sirena.=
org.uk/scheduler/job/1327109
# test job: [18197e98353d931fc7bb2bb9ec671d3aa407831d] https://lava.sirena.=
org.uk/scheduler/job/1326906
# test job: [f198b6b256aabe6d136401505e974ef2eb2df4af] https://lava.sirena.=
org.uk/scheduler/job/1323377
# test job: [cce73cf7cc56a04cf0dd1e1f93b4002c00751ebe] https://lava.sirena.=
org.uk/scheduler/job/1323545
# test job: [e358e012a69a3d553803cbe62d9f6eeea57726fc] https://lava.sirena.=
org.uk/scheduler/job/1322956
# test job: [cf0668184d1d2f9ad3f98dd5bbe0ed4d9d090eaa] https://lava.sirena.=
org.uk/scheduler/job/1323325
# test job: [c283fcdc4e2b89678c171691fd26f576139fc256] https://lava.sirena.=
org.uk/scheduler/job/1323757
# test job: [b50a1e1f3c4630f729629a787d891d7b4348007f] https://lava.sirena.=
org.uk/scheduler/job/1323222
# test job: [5410aa3aa7f7dfcbdfcf94034595765d7e69ead3] https://lava.sirena.=
org.uk/scheduler/job/1323393
# test job: [6d7ee6de75010ed5d70f1c496070c4a7cd1968b5] https://lava.sirena.=
org.uk/scheduler/job/1315774
# test job: [e8ac7336dd62f0443a675ed80b17f0f0e6846e20] https://lava.sirena.=
org.uk/scheduler/job/1314126
# test job: [0c9f82446123635cfbb8ceeca074f2dce6a0ccae] https://lava.sirena.=
org.uk/scheduler/job/1314081
# test job: [cc78d1eaabad3caf3c425c83037cd8ba1c9f2bc6] https://lava.sirena.=
org.uk/scheduler/job/1314240
# test job: [9ef24511d29f0300fc7e9d4a5ea38d78e9eef73e] https://lava.sirena.=
org.uk/scheduler/job/1312532
# test job: [296e8d289bdd7eb0d832683ebd3e847fbb4c1b12] https://lava.sirena.=
org.uk/scheduler/job/1312439
# test job: [4cc9cf2f437ccf6915100c2f38f63cfb1abad6f9] https://lava.sirena.=
org.uk/scheduler/job/1305280
# test job: [e30b7a75666b3f444abfabed6a144642fa9994d8] https://lava.sirena.=
org.uk/scheduler/job/1303190
# test job: [5b974f53424d16165b606e2e2f9208d450a5723c] https://lava.sirena.=
org.uk/scheduler/job/1302208
# test job: [d981e7b3f25fbabca9cdd02aa2a8f16d6f235fc2] https://lava.sirena.=
org.uk/scheduler/job/1302522
# test job: [4308487b29f98785ef50dd82fdfca382134b33e7] https://lava.sirena.=
org.uk/scheduler/job/1300513
# test job: [7ed50dc550b0a3bad82f675aaefd8cd00362672d] https://lava.sirena.=
org.uk/scheduler/job/1298919
# test job: [51f04358d8c887c5d117440335c7f94285a403f2] https://lava.sirena.=
org.uk/scheduler/job/1295719
# test job: [e2bcbf99d045f6ae3826e39d1ed25978de17cbfe] https://lava.sirena.=
org.uk/scheduler/job/1295274
# test job: [fcdf212fd9b36c299d90229e9546c077db2215ce] https://lava.sirena.=
org.uk/scheduler/job/1294990
# test job: [2b4ce994afca0690ab79b7860045e6883e8706db] https://lava.sirena.=
org.uk/scheduler/job/1291891
# test job: [46e7ea05bf5d9fe4d05e173c824ae173c956cb5f] https://lava.sirena.=
org.uk/scheduler/job/1292754
# test job: [4f8ef33dd44a3d1136d3934609b8a43e62aaaa0d] https://lava.sirena.=
org.uk/scheduler/job/1291553
# test job: [7762fdab23100514e5cb612331c96bd65126ada5] https://lava.sirena.=
org.uk/scheduler/job/1291202
# test job: [38c2585c7439cc678ae105dd826f10321db29552] https://lava.sirena.=
org.uk/scheduler/job/1288605
# test job: [8d2e914482311f7746fe7b0e520bd42794d6aed8] https://lava.sirena.=
org.uk/scheduler/job/1289528
# test job: [436a3cc8afbf34bb68166c2c5c19ca5113c0c756] https://lava.sirena.=
org.uk/scheduler/job/1289106
# test job: [186dfc85f9a824e3f8383322747ca75e988486e9] https://lava.sirena.=
org.uk/scheduler/job/1289043
# test job: [279b418f477fd6c1c21b1cf212837622c774f15f] https://lava.sirena.=
org.uk/scheduler/job/1288843
# test job: [e78e7856d233010e6afef62f15567a8e7777c8bc] https://lava.sirena.=
org.uk/scheduler/job/1285079
# test job: [7a978d8fcf57b283cb8c88dd4c9431502bd36ea8] https://lava.sirena.=
org.uk/scheduler/job/1280819
# test job: [28cce24d6596a3d8a34689031f2a8a5ac918cde5] https://lava.sirena.=
org.uk/scheduler/job/1280765
# test job: [b5d057a86e2086af0b1e6d0ca8b306be1c73a627] https://lava.sirena.=
org.uk/scheduler/job/1280149
# test job: [3f7b48efb79d91883d98dd7e33dc2a0abfa9f923] https://lava.sirena.=
org.uk/scheduler/job/1280239
# test job: [aaf6223ea2a1ff9316a81bf851fd5a0e82635b60] https://lava.sirena.=
org.uk/scheduler/job/1276161
# test job: [e686365c0411275474527c2055ac133f2eb47526] https://lava.sirena.=
org.uk/scheduler/job/1276125
# test job: [147b2a96f24e0cfcc476378f9356b30662045c7e] https://lava.sirena.=
org.uk/scheduler/job/1276191
# test job: [265daffe788aa1cc5925d0afcde4fe6e99c66638] https://lava.sirena.=
org.uk/scheduler/job/1276066
# test job: [5e21900ef64244fadeddc9015e8b8307d116764a] https://lava.sirena.=
org.uk/scheduler/job/1270805
# test job: [936df52c29b0d422665c5e84b0cffae61611411b] https://lava.sirena.=
org.uk/scheduler/job/1270769
# test job: [4c035fab9f42071c4024495afb2cec1409280eed] https://lava.sirena.=
org.uk/scheduler/job/1269332
# test job: [8d18e67abbdf380cd1cfd2c313aac625092d7777] https://lava.sirena.=
org.uk/scheduler/job/1267373
# test job: [93fa44f84704dfedc4fe06b89bebc8cfaa5f525b] https://lava.sirena.=
org.uk/scheduler/job/1267470
# test job: [ce2eadc6f99263dd200e52f692dc7a22698c99f3] https://lava.sirena.=
org.uk/scheduler/job/1266916
# test job: [b3d9e96c96b0076a11aa1001d55b3dc189b8cd1c] https://lava.sirena.=
org.uk/scheduler/job/1266978
# test job: [387ddbc7d474967589de15043b47a441f95a50f2] https://lava.sirena.=
org.uk/scheduler/job/1267136
# test job: [4e310626eb4df52a31a142c1360fead0fcbd3793] https://lava.sirena.=
org.uk/scheduler/job/1268838
# test job: [b644c2776652671256edcd7a8e71161e212b59ac] https://lava.sirena.=
org.uk/scheduler/job/1264609
# test job: [69e3433fa5e24edc94e94b4f34e3dbb754bdedbf] https://lava.sirena.=
org.uk/scheduler/job/1264874
# test job: [ea61f39b38bdbb7c77ba2c70e130acdb808c8d68] https://lava.sirena.=
org.uk/scheduler/job/1265272
# test job: [eec611d26f84800852a9badbeafa76db3cdc9118] https://lava.sirena.=
org.uk/scheduler/job/1265133
# test job: [d5099bc1b56417733f4cccf10c61ee74dadd5562] https://lava.sirena.=
org.uk/scheduler/job/1265077
# test job: [1d9119794c10023ebd7c901aa9aa2c74eb833177] https://lava.sirena.=
org.uk/scheduler/job/1265333
# test job: [f48887a98b78880b7711aca311fbbbcaad6c4e3b] https://lava.sirena.=
org.uk/scheduler/job/1371067
# bad: [f48887a98b78880b7711aca311fbbbcaad6c4e3b] Add linux-next specific f=
iles for 20250508
git bisect bad f48887a98b78880b7711aca311fbbbcaad6c4e3b
# test job: [80badb1d7264e83b512475898e7459f464a009c9] https://lava.sirena.=
org.uk/scheduler/job/1364772
# bad: [80badb1d7264e83b512475898e7459f464a009c9] clk: imx: add support for=
 i.MX8MN anatop clock driver
git bisect bad 80badb1d7264e83b512475898e7459f464a009c9
# test job: [3cbc38cf42ca42d2dc9a93c949e0381ff919df71] https://lava.sirena.=
org.uk/scheduler/job/1365096
# bad: [3cbc38cf42ca42d2dc9a93c949e0381ff919df71] clk: imx: add support for=
 i.MX8MM anatop clock driver
git bisect bad 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
# first bad commit: [3cbc38cf42ca42d2dc9a93c949e0381ff919df71] clk: imx: ad=
d support for i.MX8MM anatop clock driver
# test job: [4c82bbe8b5437c7f16b2891ce33210c0f1410597] https://lava.sirena.=
org.uk/scheduler/job/1364509
# bad: [4c82bbe8b5437c7f16b2891ce33210c0f1410597] clk: imx: add support for=
 i.MX8MP anatop clock driver
git bisect bad 4c82bbe8b5437c7f16b2891ce33210c0f1410597
# test job: [80badb1d7264e83b512475898e7459f464a009c9] https://lava.sirena.=
org.uk/scheduler/job/1364772
# bad: [80badb1d7264e83b512475898e7459f464a009c9] clk: imx: add support for=
 i.MX8MN anatop clock driver
git bisect bad 80badb1d7264e83b512475898e7459f464a009c9
# test job: [3cbc38cf42ca42d2dc9a93c949e0381ff919df71] https://lava.sirena.=
org.uk/scheduler/job/1365096
# bad: [3cbc38cf42ca42d2dc9a93c949e0381ff919df71] clk: imx: add support for=
 i.MX8MM anatop clock driver
git bisect bad 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
# first bad commit: [3cbc38cf42ca42d2dc9a93c949e0381ff919df71] clk: imx: ad=
d support for i.MX8MM anatop clock driver

--naJDn4sdZ1Rw6U/W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgdX+0ACgkQJNaLcl1U
h9B86gf9Gg9iiwq/jyApJKXJIxQ1NJaOXHFTOz0297EXS8lmtiHNv1j3JLZ71Zsr
RJ/bKCNnZFvk9uu6M2VIf1gm0tSZAJWtrj/5kGSFmOV+B9TmMJdwJGKoM9S6xacf
vmMuxi7PH1AhfQ/+g9rTNfJ/J7pK6KC1PMh0dYuOAF5OzaafKkopI9NwoNDOOh4/
T3UAOzgq7bWx1zr6lieopgJdya4a8gO/kIxm3HutDATeHNxtRAV2zWkzehGP231I
rgplLTZ7etJ5DozRKEynYpyCt7yK5SnBlU5AVpW87vO4OuVZP68thpU8MoWJ3ZsT
52tmGgq/eXwBvaVo/o7mIDxEbd51Zg==
=Mdo8
-----END PGP SIGNATURE-----

--naJDn4sdZ1Rw6U/W--
