Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F8239E98
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 18:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222937; cv=none; b=ZrXmjdKxC7Hacq6IbZG3gPsJwrgw+1JWbpYp2Z9TaxkjiuV6jJ2+4JFPVD8hcjiGor4MMdKKfPPOcyg/953xQ43kOYtVrx0atRRq2ddftJnsGfjejLpVUw3SmbA8PQsoaMOG8t5KiOT1cH2IJ0BSNYlR65cnWgouTCuptDHZvLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222937; c=relaxed/simple;
	bh=MtCK7LECAxZfvfQtiIAubfaBDM8bDwZrIPnRiWvEPmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GGYCUwoTnw3P4JlNtST4u/xRFDRD9PWBJRJAW/Q7Cm6MQ9AJccytnr5F1h9XpnXy2Ph5mAPkVK+NWJN9iFk0NSfs7vz2COB8+88bHnyw4gXzOSOcKmO4nSqcn2nMt1F92kyZMQacZ39idEAJ61wUM9j0WlCCdpQiQPwfhJe8yYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMaaXNHz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMaaXNHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751222935; x=1782758935;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MtCK7LECAxZfvfQtiIAubfaBDM8bDwZrIPnRiWvEPmk=;
  b=NMaaXNHz5i8xkZ52bh9imZLcFrumii8+ebO+/eTBp3a4dbY2nIUuB6SV
   Uwa62rDibhM4/JQkfN/flKT583GPzMQVMPkw9d0soHFoaoy5xmc4/Gcqz
   e5LMHN8+ylgnlVGxkE+gvSLNurMqeO7yCzQOSY35WIyeGpfqz9bIgnVS+
   qBXVOqPrM/XNYpNH5VokEUsGAoIynjGRFMIyIb231vEbRi8rsFKqKbD6w
   FvE4stc2KgbGS6TizwlBq6+d4Myp8ANok8bDaCeJL30++or+ZjOtRWRTD
   ppu+WF6Yl8XyHr+i+e6eh6xGKS2Agl0ElGTgQiKJOrdBsK4Avo7p4fatR
   A==;
X-CSE-ConnectionGUID: 3/Dh9vrfT0yrSOjedwivXw==
X-CSE-MsgGUID: j3/mWif8RlGbi4d57A+fTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64900327"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="64900327"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 11:48:54 -0700
X-CSE-ConnectionGUID: zpQe3IUaSum4YXL8tEppYg==
X-CSE-MsgGUID: +TvCEsipTOal2fZDteSI7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="158765150"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jun 2025 11:48:52 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVx58-0000xX-1y;
	Sun, 29 Jun 2025 18:48:50 +0000
Date: Sun, 29 Jun 2025 20:48:39 +0200
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic
 (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202506292020.c1mT9vIF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dfba48a70cb68888efb494c9642502efe73614ed
commit: cfe035d8662cfbd6edff9bd89c4b516bbb34c350 arm64: dts: mt6359: Rename=
 RTC node to match binding expectations
date:   6 weeks ago
config: arm64-randconfig-2052-20250625 (https://download.01.org/0day-ci/arc=
hive/20250629/202506292020.c1mT9vIF-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f81=
9f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.6.1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250629/202506292020.c1mT9vIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506292020.c1mT9vIF-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic (mediate=
k,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: syscon@112100=
00 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud=
_dac_predis_clk', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', 'a=
ud_apll24m_clk', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_clk=
', 'aud_tml_clk', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'aud=
_adc_hires_tml', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_dac=
_predis_clk', 'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk', =
'aud_infra_26m_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d4_=
d4', 'top_mux_aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 'top=
_mux_aud_eng1', 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_i2=
s0_m_sel', 'top_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s4_=
m_sel', 'top_i2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m_s=
el', 'top_i2s9_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_di=
v2', 'top_apll12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apll12_d=
iv5', 'top_apll12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_apll12_=
div9', 'top_mux_audio_h', 'top_clk26m_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clocks: [[59, 0], [59, 7], [59, 8], [59, 6], [59=
, 21], [59, 1], [59, 2], [59, 4], [59, 3], [59, 5], [59, 9], [59, 10], [59,=
 18], [59, 19], [59, 20], [59, 22], [59, 23], [59, 24], [59, 25], [59, 26],=
 [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22=
, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, =
60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], =
[22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147],=
 [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is t=
oo long
--
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic (mediatek,mt6359): '#s=
ound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: syscon@11210000 (mediatek,m=
t8192-audsys): 'mt8192-afe-pcm' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud_dac_predis_cl=
k', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', 'aud_apll24m_clk=
', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_clk', 'aud_tml_cl=
k', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'aud_adc_hires_tml=
', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_dac_predis_clk', =
'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk', 'aud_infra_26m=
_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d4_d4', 'top_mux_=
aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 'top_mux_aud_eng1'=
, 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_i2s0_m_sel', 'to=
p_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s4_m_sel', 'top_i=
2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m_sel', 'top_i2s9=
_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_div2', 'top_apll=
12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apll12_div5', 'top_apl=
l12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_apll12_div9', 'top_mu=
x_audio_h', 'top_clk26m_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clocks: [[45, 0], [45, 7], [45, 8], [45, 6], [45, 21], [45, 1]=
, [45, 2], [45, 4], [45, 3], [45, 5], [45, 9], [45, 10], [45, 18], [45, 19]=
, [45, 20], [45, 22], [45, 23], [45, 24], [45, 25], [45, 26], [23, 47], [23=
, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 10=
5], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61],=
 [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22,=
 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [2=
2, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (=
graph_child_address): /soc/syscon@1c01a000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (real=
tek,rt5682i): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (real=
tek,rt5682i): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: edp-tx@1c50000=
0 (mediatek,mt8195-edp-tx): Unevaluated properties are not allowed ('aux-bu=
s' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (=
graph_child_address): /soc/syscon@1c01a000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a (real=
tek,rt5682i): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a (real=
tek,rt5682i): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: edp-tx@1c50000=
0 (mediatek,mt8195-edp-tx): Unevaluated properties are not allowed ('aux-bu=
s' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic (mediatek,mt6359): '#=
sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000 (medi=
atek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, =
797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts:1119.7-1127.4: Wa=
rning (graph_child_address): /soc/syscon@1c01a000/port: graph node has sing=
le child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,m=
t6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@1031=
5000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4=
, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/dsi@1c00800=
0/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid=
078', 'himax,hx8279']
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/dsi@1c00800=
0/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid=
078', 'himax,hx8279']
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1245.7-1253.4: War=
ning (graph_child_address): /soc/syscon@1c01d000/port: graph node has singl=
e child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt=
6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg-names: ['cfg'] is too short

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
