Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0571459F6;
	Fri,  9 May 2025 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800960; cv=none; b=joOFfIA5lI5jmdERilwGpY+aqvb8YELQBLzQ4oOSL3iItffONfrVwDiqJjcXJETBuHvXy+eh32fCIp6keTZhMrG3licaArMkaInUqPRU0KAewPiMOeSnsQ0JbcsOwxYTb8DfGwGFZebM07S27RBl4a3nGjTf+I0z31q2PUZjgs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800960; c=relaxed/simple;
	bh=vqwCitQU0qcjAXSSnWLiPYmnOSIwRgObcl4rT68zi6w=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=I7GsyK77SFI/Js1qV1+MlRP9S87sBTYNW0jfR6t/L96unKV3X8QG2u5NN/84YtcJsJvVHELF3rnq2kPVxsx++JcHCKQZF1k18A+aIGINNwfy2CN0QoePsZLdqKwqDuHjqIlhteYZtqbMWd3LqUYh4XTeLrcl/94eqfTyu/o9jOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzrltJWK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzrltJWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AB4C4CEEB;
	Fri,  9 May 2025 14:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800958;
	bh=vqwCitQU0qcjAXSSnWLiPYmnOSIwRgObcl4rT68zi6w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tzrltJWKngC0rTLq3srilrEYsrPx35EQNF0m6P6xUq2rPW3JHoeTUC9uu0lAcdz2G
	 fOTDnd1tCRbGCcGxc3VZoLNSSoXpVAWqgDGy4M6JQ1KOmUc4BD7ObP1f+yKk+dV43Q
	 +U0pvQWMwOvHgePPo2qjw64mE++1JzFCIGDOEqLJUd1nEy/57c/ezvJRYDK1hVzMYs
	 LXoutL3f4qFsPi+ba6wR/nQSW/FZOtL6U51RcBbXGIJE9TajCI9n2ZgNK/lTyQibFA
	 m+AL0JaFptYb3FOYQHaD7OZ+2Y584R3B/ABHdFP0tWeCNqQR/zjezSsSmaqdNaSLvl
	 vwz5gEg91DHhA==
Date: Fri, 09 May 2025 09:29:16 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: shawnguo@kernel.org,
 sascha.hauer@pengutronix.de, ray.chang@technexion.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
 krzk@kernel.org, festevam@gmail.com
To: Richard Hu <richard.hu@technexion.com>
In-Reply-To: <20250509071242.12098-1-richard.hu@technexion.com>
References: <20250509071242.12098-1-richard.hu@technexion.com>
Message-Id: <174679985421.3369341.5476210457995563851.robh@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp: Add TechNexion
 EDM-G-IMX8M-PLUS SoM on WB-EDM-G carrier board


On Fri, 09 May 2025 15:12:42 +0800, Richard Hu wrote:
> Add support for the TechNexion EDM-G-IMX8M-PLUS SoM on the WB-EDM-G carrier board.
> Key interfaces include:
> - Gigabit Ethernet
> - USB 3.0
> - I2S, UART, SPI, I2C, PWM, GPIO
> 
> Signed-off-by: Richard Hu <richard.hu@technexion.com>
> Signed-off-by: Ray Chang <ray.chang@technexion.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../boot/dts/freescale/imx8mp-edm-g-wb.dts    | 404 +++++++++
>  .../boot/dts/freescale/imx8mp-edm-g.dtsi      | 791 ++++++++++++++++++
>  3 files changed, 1196 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
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
 Base: tags/v6.15-rc1-2-g0005617c5e2f (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250509071242.12098-1-richard.hu@technexion.com:

arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dtb: / (technexion,edm-g-imx8mp-wb): compatible: 'oneOf' conditional failed, one must be fixed:
	['technexion,edm-g-imx8mp-wb', 'technexion,edm-g-imx8mp', 'fsl,imx8mp'] is too long
	['technexion,edm-g-imx8mp-wb', 'technexion,edm-g-imx8mp', 'fsl,imx8mp'] is too short
arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dtb: / (technexion,edm-g-imx8mp-wb): compatible: 'oneOf' conditional failed, one must be fixed:
		'technexion,edm-g-imx8mp-wb' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
		'technexion,edm-g-imx8mp-wb' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
		'tq,imx8dxp-tqma8xdp' was expected
		'tq,imx8qxp-tqma8xqp' was expected
		'fsl,imx8dxp' was expected
		'fsl,imx8qxp' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
	'technexion,edm-g-imx8mp-wb' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
	'technexion,edm-g-imx8mp-wb' is not one of ['eukrea,mbimxsd25-baseboard']
	'technexion,edm-g-imx8mp-wb' is not one of ['eukrea,mbimxsd25-baseboard-cmo-qvga', 'eukrea,mbimxsd25-baseboard-dvi-svga', 'eukrea,mbimxsd25-baseboard-dvi-vga']
	'technexion,edm-g-imx8mp-wb' is not one of ['armadeus,imx27-apf27', 'fsl,imx27-pdk']
	'armadeus,imx27-apf27dev' was expected
	'eukrea,mbimxsd27-baseboard' was expected
	'phytec,imx27-pca100-rdk' was expected
	'phytec,imx27-pcm970' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['armadeus,imx28-apf28', 'bluegiga,apx4devkit', 'crystalfontz,cfa10036', 'eukrea,mbmx28lc', 'fsl,imx28-evk', 'i2se,duckbill', 'i2se,duckbill-2', 'karo,tx28', 'lwn,imx28-btt3', 'lwn,imx28-xea', 'msr,m28cu3', 'schulercontrol,imx28-sps1', 'technologic,imx28-ts4600']
	'aries,m28' was expected
	'aries,m28evk' was expected
	'armadeus,imx28-apf28dev' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['crystalfontz,cfa10037', 'crystalfontz,cfa10049', 'crystalfontz,cfa10057', 'crystalfontz,cfa10058']
	'technexion,edm-g-imx8mp-wb' is not one of ['crystalfontz,cfa10055', 'crystalfontz,cfa10056']
	'technexion,edm-g-imx8mp-wb' is not one of ['i2se,duckbill-2-485', 'i2se,duckbill-2-enocean', 'i2se,duckbill-2-spi']
	'eukrea,mbmx283lc' was expected
	'eukrea,mbmx287lc' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['buglabs,imx31-bug', 'logicpd,imx31-lite']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imx35-pdk']
	'eukrea,mbimxsd35-baseboard' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imx50-evk', 'kobo,aura']
	'technexion,edm-g-imx8mp-wb' is not one of ['armadeus,imx51-apf51', 'fsl,imx51-babbage', 'technologic,imx51-ts4800', 'zii,imx51-scu3-esb', 'zii,imx51-scu2-mezz', 'zii,imx51-rdu1']
	'armadeus,imx51-apf51dev' was expected
	'digi,connectcore-ccxmx51-jsk' was expected
	'eukrea,mbimxsd51' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['bhf,cx9020', 'fsl,imx53-ard', 'fsl,imx53-evk', 'fsl,imx53-qsb', 'fsl,imx53-qsrb', 'fsl,imx53-smd', 'ge,imx53-cpuvo', 'inversepath,imx53-usbarmory', 'karo,tx53', 'kiebackpeter,imx53-ddc', 'kiebackpeter,imx53-hsc', 'menlo,m53menlo', 'starterkit,sk-imx53', 'voipac,imx53-dmm-668']
	'aries,imx53-m53evk' was expected
	'tq,mba53' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['auvidea,h100', 'bosch,imx6q-acc', 'boundary,imx6q-nitrogen6_max', 'boundary,imx6q-nitrogen6_som2', 'boundary,imx6q-nitrogen6x', 'compulab,cm-fx6', 'dmo,imx6q-edmqmx6', 'ds,imx6q-sbc', 'embest,imx6q-marsboard', 'emtrion,emcon-mx6', 'emtrion,emcon-mx6-avari', 'engicam,imx6-icore', 'engicam,imx6-icore-rqs', 'fsl,imx6q-arm2', 'fsl,imx6q-sabreauto', 'fsl,imx6q-sabrelite', 'fsl,imx6q-sabresd', 'karo,imx6q-tx6q', 'kiebackpeter,imx6q-tpc', 'kontron,imx6q-samx6i', 'kosagi,imx6q-novena', 'kvg,vicut1q', 'logicpd,imx6q-logicpd', 'lwn,display5', 'lwn,mccmon6', 'nutsboard,imx6q-pistachio', 'microsys,sbc6x', 'poslab,imx6q-savageboard', 'prt,prti6q', 'prt,prtwd2', 'rex,imx6q-rex-pro', 'skov,imx6q-skov-revc-lt2', 'skov,imx6q-skov-revc-lt6', 'skov,imx6q-skov-reve-mi1010ait-1cp1', 'solidrun,cubox-i/q', 'solidrun,hummingboard/q', 'solidrun,hummingboard2/q', 'solidrun,solidsense/q', 'tbs,imx6q-tbs2910', 'technexion,imx6q-pico-dwarf', 'technexion,imx6q-pico-hobbit', 'technexion,imx6q-pico-nymph', 'technexion,imx6q-pico-pi', 'technologic,imx6q-ts4900', 'technologic,imx6q-ts7970', 'udoo,imx6q-udoo', 'uniwest,imx6q-evi', 'variscite,dt6customboard', 'wand,imx6q-wandboard', 'ysoft,imx6q-yapp4-crux', 'ysoft,imx6q-yapp4-pegasus', 'zealz,imx6q-gk802', 'zii,imx6q-zii-rdu2']
	'technexion,edm-g-imx8mp-wb' is not one of ['advantech,imx6q-dms-ba16', 'ge,imx6q-b450v3', 'ge,imx6q-b650v3', 'ge,imx6q-b850v3']
	'armadeus,imx6q-apf6dev' was expected
	'compulab,utilite-pro' was expected
	'dfi,fs700-m60-6qd' was expected
	'dh,imx6q-dhcom-pdk2' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['gw,imx6q-gw51xx', 'gw,imx6q-gw52xx', 'gw,imx6q-gw53xx', 'gw,imx6q-gw5400-a', 'gw,imx6q-gw54xx', 'gw,imx6q-gw551x', 'gw,imx6q-gw552x', 'gw,imx6q-gw553x', 'gw,imx6q-gw560x', 'gw,imx6q-gw5903', 'gw,imx6q-gw5904', 'gw,imx6q-gw5907', 'gw,imx6q-gw5910', 'gw,imx6q-gw5912', 'gw,imx6q-gw5913']
	'kontron,imx6q-samx6i-ads2' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['phytec,imx6q-pbac06-emmc', 'phytec,imx6q-pbac06-nand']
	'technexion,edm-g-imx8mp-wb' is not one of ['comvetia,imx6q-lxr', 'phytec,imx6q-pbab01']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,apalis_imx6q-ixora', 'toradex,apalis_imx6q-ixora-v1.1', 'toradex,apalis_imx6q-ixora-v1.2', 'toradex,apalis_imx6q-eval', 'toradex,apalis_imx6q-eval-v1.2']
	'variscite,mx6customboard' was expected
	'tq,imx6q-mba6x-a' was expected
	'tq,imx6q-mba6x-b' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['boundary,imx6qp-nitrogen6_max', 'boundary,imx6qp-nitrogen6_som2', 'fsl,imx6qp-sabreauto', 'fsl,imx6qp-sabresd', 'karo,imx6qp-tx6qp', 'kvg,vicutp', 'prt,prtwd3', 'wand,imx6qp-wandboard', 'ysoft,imx6qp-yapp4-crux-plus', 'ysoft,imx6qp-yapp4-pegasus-plus', 'zii,imx6qp-zii-rdu2']
	'phytec,imx6qp-pbac06-nand' was expected
	'tq,imx6qp-mba6x-b' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['abb,aristainetos-imx6dl-4', 'abb,aristainetos-imx6dl-7', 'abb,aristainetos2-imx6dl-4', 'abb,aristainetos2-imx6dl-7', 'alt,alti6p', 'boundary,imx6dl-nit6xlite', 'boundary,imx6dl-nitrogen6x', 'bticino,imx6dl-mamoj', 'eckelmann,imx6dl-ci4x10', 'emtrion,emcon-mx6', 'emtrion,emcon-mx6-avari', 'engicam,imx6-icore', 'engicam,imx6-icore-rqs', 'fsl,imx6dl-sabreauto', 'fsl,imx6dl-sabrelite', 'fsl,imx6dl-sabresd', 'karo,imx6dl-tx6dl', 'kontron,imx6dl-samx6i', 'kvg,victgo', 'kvg,vicut1', 'ply,plybas', 'ply,plym2m', 'poslab,imx6dl-savageboard', 'prt,prtmvt', 'prt,prtrvt', 'prt,prtvt7', 'rex,imx6dl-rex-basic', 'riot,imx6s-riotboard', 'sielaff,imx6dl-board', 'skov,imx6dl-skov-revc-lt2', 'skov,imx6dl-skov-revc-lt6', 'solidrun,cubox-i/dl', 'solidrun,hummingboard/dl', 'solidrun,hummingboard2/dl', 'solidrun,solidsense/dl', 'technexion,imx6dl-pico-dwarf', 'technexion,imx6dl-pico-hobbit', 'technexion,imx6dl-pico-nymph', 'technexion,imx6dl-pico-pi', 'technologic,imx6dl-ts4900', 'technologic,imx6dl-ts7970', 'udoo,imx6dl-udoo', 'vdl,lanmcu', 'wand,imx6dl-wandboard', 'ysoft,imx6dl-yapp4-draco', 'ysoft,imx6dl-yapp4-hydra', 'ysoft,imx6dl-yapp4-lynx', 'ysoft,imx6dl-yapp4-orion', 'ysoft,imx6dl-yapp4-phoenix', 'ysoft,imx6dl-yapp4-ursa']
	'armadeus,imx6dl-apf6dev' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['ge,imx6dl-b105v2', 'ge,imx6dl-b105pv2', 'ge,imx6dl-b125v2', 'ge,imx6dl-b125pv2', 'ge,imx6dl-b155v2']
	'dfi,fs700-m60-6dl' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['dh,imx6dl-dhcom-pdk2', 'dh,imx6dl-dhcom-picoitx']
	'technexion,edm-g-imx8mp-wb' is not one of ['gw,imx6dl-gw51xx', 'gw,imx6dl-gw52xx', 'gw,imx6dl-gw53xx', 'gw,imx6dl-gw54xx', 'gw,imx6dl-gw551x', 'gw,imx6dl-gw552x', 'gw,imx6dl-gw553x', 'gw,imx6dl-gw560x', 'gw,imx6dl-gw5903', 'gw,imx6dl-gw5904', 'gw,imx6dl-gw5907', 'gw,imx6dl-gw5910', 'gw,imx6dl-gw5912', 'gw,imx6dl-gw5913']
	'kontron,imx6dl-samx6i-ads2' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['phytec,imx6dl-pbac06-emmc', 'phytec,imx6dl-pbac06-nand']
	'phytec,imx6dl-pbab01' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,colibri_imx6dl-aster', 'toradex,colibri_imx6dl-eval-v3', 'toradex,colibri_imx6dl-iris', 'toradex,colibri_imx6dl-iris-v2']
	'dh,imx6s-dhcom-drc02' was expected
	'tq,imx6dl-mba6x-a' was expected
	'tq,imx6dl-mba6x-b' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imx6sl-evk', 'kobo,aura2', 'kobo,tolino-shine2hd', 'kobo,tolino-shine3', 'kobo,tolino-vision', 'kobo,tolino-vision5', 'revotics,imx6sl-warp']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imx6sll-evk', 'kobo,clarahd', 'kobo,librah2o']
	'technexion,edm-g-imx8mp-wb' is not one of ['kobo,clara2e-a', 'kobo,clara2e-b']
	'technexion,edm-g-imx8mp-wb' is not one of ['boundary,imx6sx-nitrogen6sx', 'fsl,imx6sx-sabreauto', 'fsl,imx6sx-sdb', 'fsl,imx6sx-sdb-reva', 'samtec,imx6sx-vining-2000', 'udoo,neobasic', 'udoo,neoextended', 'udoo,neofull']
	'technexion,edm-g-imx8mp-wb' is not one of ['engicam,imx6ul-geam', 'engicam,imx6ul-isiot', 'fsl,imx6ul-14x14-evk', 'karo,imx6ul-tx6ul', 'kontron,sl-imx6ul', 'prt,prti6g', 'technexion,imx6ul-pico-dwarf', 'technexion,imx6ul-pico-hobbit', 'technexion,imx6ul-pico-pi']
	'armadeus,imx6ul-opos6uldev' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['digi,ccimx6ulsbcexpress', 'digi,ccimx6ulsbcpro']
	'grinn,imx6ul-liteboard' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['phytec,imx6ul-pbacd10-emmc', 'phytec,imx6ul-pbacd10-nand']
	'variscite,mx6ulconcerto' was expected
	'kontron,bl-imx6ul' was expected
	'kontron,bl-imx6ul-43' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,imx6ul-tqma6ul1-mba6ulx']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,imx6ul-tqma6ul2-mba6ulx']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,imx6ul-tqma6ul2l-mba6ulx', 'tq,imx6ul-tqma6ul2l-mba6ulxl']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imx6ull-14x14-evk', 'joz,jozacp', 'kontron,sl-imx6ull', 'myir,imx6ull-mys-6ulx-eval', 'uni-t,uti260b']
	'armadeus,imx6ull-opos6uldev' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['chargebyte,imx6ull-tarragon-master', 'chargebyte,imx6ull-tarragon-micro', 'chargebyte,imx6ull-tarragon-slave', 'chargebyte,imx6ull-tarragon-slavext']
	'technexion,edm-g-imx8mp-wb' is not one of ['dh,imx6ull-dhcom-drc02', 'dh,imx6ull-dhcom-pdk2', 'dh,imx6ull-dhcom-picoitx']
	'marantec,imx6ull-dhcor-maveo-box' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['phytec,imx6ull-pbacd10-emmc', 'phytec,imx6ull-pbacd10-nand']
	'technexion,edm-g-imx8mp-wb' is not one of ['phytec,imx6ull-phygate-tauri-emmc', 'phytec,imx6ull-phygate-tauri-nand']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,colibri-imx6ull-aster', 'toradex,colibri-imx6ull-eval', 'toradex,colibri-imx6ull-iris', 'toradex,colibri-imx6ull-iris-v2']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,colibri-imx6ull-emmc-aster', 'toradex,colibri-imx6ull-emmc-eval', 'toradex,colibri-imx6ull-emmc-iris', 'toradex,colibri-imx6ull-emmc-iris-v2']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,colibri-imx6ull-wifi-eval', 'toradex,colibri-imx6ull-wifi-aster', 'toradex,colibri-imx6ull-wifi-iris', 'toradex,colibri-imx6ull-wifi-iris-v2']
	'kontron,bl-imx6ull' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,imx6ull-tqma6ull2-mba6ulx']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,imx6ull-tqma6ull2l-mba6ulx', 'tq,imx6ull-tqma6ull2l-mba6ulxl']
	'technexion,edm-g-imx8mp-wb' is not one of ['seeed,imx6ull-seeed-npi-emmc', 'seeed,imx6ull-seeed-npi-nand']
	'technexion,edm-g-imx8mp-wb' is not one of ['bsh,imx6ulz-bsh-smm-m2', 'fsl,imx6ulz-14x14-evk']
	'technexion,edm-g-imx8mp-wb' is not one of ['element14,imx7s-warp', 'toradex,colibri-imx7s']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,colibri-imx7s-aster', 'toradex,colibri-imx7s-eval-v3', 'toradex,colibri-imx7s-iris', 'toradex,colibri-imx7s-iris-v2']
	'tq,imx7s-mba7' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['boundary,imx7d-nitrogen7', 'compulab,cl-som-imx7', 'fsl,imx7d-sdb', 'fsl,imx7d-sdb-reva', 'kam,imx7d-flex-concentrator', 'kam,imx7d-flex-concentrator-mfg', 'novtech,imx7d-meerkat96', 'remarkable,imx7d-remarkable2', 'storopack,imx7d-smegw01', 'technexion,imx7d-pico-dwarf', 'technexion,imx7d-pico-hobbit', 'technexion,imx7d-pico-nymph', 'technexion,imx7d-pico-pi', 'zii,imx7d-rmu2', 'zii,imx7d-rpu2']
	'tq,imx7d-mba7' was expected
	'compulab,sbc-imx7' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,colibri-imx7d-aster', 'toradex,colibri-imx7d-eval-v3', 'toradex,colibri-imx7d-iris', 'toradex,colibri-imx7d-iris-v2']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,colibri-imx7d-emmc-aster', 'toradex,colibri-imx7d-emmc-eval-v3', 'toradex,colibri-imx7d-emmc-iris', 'toradex,colibri-imx7d-emmc-iris-v2']
	'technexion,edm-g-imx8mp-wb' is not one of ['ea,imx7ulp-com', 'fsl,imx7ulp-evk']
	'technexion,edm-g-imx8mp-wb' is not one of ['beacon,imx8mm-beacon-kit', 'boundary,imx8mm-nitrogen8mm', 'dmo,imx8mm-data-modul-edm-sbc', 'emtrion,emcon-mx8mm-avari', 'fsl,imx8mm-ddr4-evk', 'fsl,imx8mm-evk', 'fsl,imx8mm-evkb', 'gateworks,imx8mm-gw75xx-0x', 'gateworks,imx8mm-gw7904', 'gw,imx8mm-gw71xx-0x', 'gw,imx8mm-gw72xx-0x', 'gw,imx8mm-gw73xx-0x', 'gw,imx8mm-gw7901', 'gw,imx8mm-gw7902', 'gw,imx8mm-gw7903', 'innocomm,wb15-evk', 'kontron,imx8mm-sl', 'kontron,imx8mm-osm-s', 'prt,prt8mm']
	'technexion,edm-g-imx8mp-wb' is not one of ['compulab,imx8mm-iot-gateway']
	'ees,imx8mm-emtop-baseboard' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['engicam,icore-mx8mm-ctouch2', 'engicam,icore-mx8mm-edimm2.2']
	'kontron,imx8mm-bl' was expected
	'kontron,imx8mm-bl-osm-s' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['menlo,mx8menlo', 'toradex,verdin-imx8mm-nonwifi-dahlia', 'toradex,verdin-imx8mm-nonwifi-dev', 'toradex,verdin-imx8mm-nonwifi-ivy', 'toradex,verdin-imx8mm-nonwifi-mallow', 'toradex,verdin-imx8mm-nonwifi-yavia']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,verdin-imx8mm-wifi-dahlia', 'toradex,verdin-imx8mm-wifi-dev', 'toradex,verdin-imx8mm-wifi-ivy', 'toradex,verdin-imx8mm-wifi-mallow', 'toradex,verdin-imx8mm-wifi-yavia']
	'technexion,edm-g-imx8mp-wb' is not one of ['phytec,imx8mm-phyboard-polis-rdk', 'phytec,imx8mm-phygate-tauri-l']
	'variscite,var-som-mx8mm-symphony' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['cloos,imx8mm-phg', 'tq,imx8mm-tqma8mqml-mba8mx']
	'technexion,edm-g-imx8mp-wb' is not one of ['beacon,imx8mn-beacon-kit', 'bsh,imx8mn-bsh-smm-s2', 'bsh,imx8mn-bsh-smm-s2pro', 'fsl,imx8mn-ddr3l-evk', 'fsl,imx8mn-ddr4-evk', 'fsl,imx8mn-evk', 'gw,imx8mn-gw7902']
	'technexion,edm-g-imx8mp-wb' is not one of ['dimonoff,gateway-evk', 'rve,gateway', 'variscite,var-som-mx8mn-symphony']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,imx8mn-tqma8mqnl-mba8mx']
	'technexion,edm-g-imx8mp-wb' is not one of ['beacon,imx8mp-beacon-kit', 'dmo,imx8mp-data-modul-edm-sbc', 'emcraft,imx8mp-navqp', 'fsl,imx8mp-evk', 'fsl,imx8mp-evk-revb4', 'gateworks,imx8mp-gw71xx-2x', 'gateworks,imx8mp-gw72xx-2x', 'gateworks,imx8mp-gw73xx-2x', 'gateworks,imx8mp-gw74xx', 'gateworks,imx8mp-gw75xx-2x', 'gateworks,imx8mp-gw82xx-2x', 'skov,imx8mp-skov-basic', 'skov,imx8mp-skov-revb-hdmi', 'skov,imx8mp-skov-revb-lt6', 'skov,imx8mp-skov-revb-mi1010ait-1cp1', 'skov,imx8mp-skov-revc-bd500', 'skov,imx8mp-skov-revc-tian-g07017', 'ysoft,imx8mp-iota2-lumpy']
	'technexion,edm-g-imx8mp-wb' is not one of ['abb,imx8mp-aristanetos3-adpismarc', 'abb,imx8mp-aristanetos3-helios', 'abb,imx8mp-aristanetos3-proton2s']
	'avnet,sm2s-imx8mp-14N0600E-ep1' was expected
	'boundary,imx8mp-nitrogen-smarc-universal-board' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['dh,imx8mp-dhcom-drc02', 'dh,imx8mp-dhcom-pdk2', 'dh,imx8mp-dhcom-pdk3', 'dh,imx8mp-dhcom-picoitx']
	'technexion,edm-g-imx8mp-wb' is not one of ['engicam,icore-mx8mp-edimm2.2']
	'kontron,imx8mp-bl-osm-s' was expected
	'kontron,imx8mp-smarc-eval-carrier' was expected
	'phytec,imx8mp-phyboard-pollux-rdk' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['polyhex,imx8mp-debix-model-a']
	'technexion,edm-g-imx8mp-wb' is not one of ['polyhex,imx8mp-debix-som-a-bmb-08']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,verdin-imx8mp-nonwifi-dahlia', 'toradex,verdin-imx8mp-nonwifi-dev', 'toradex,verdin-imx8mp-nonwifi-ivy', 'toradex,verdin-imx8mp-nonwifi-mallow', 'toradex,verdin-imx8mp-nonwifi-yavia']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,verdin-imx8mp-wifi-dahlia', 'toradex,verdin-imx8mp-wifi-dev', 'toradex,verdin-imx8mp-wifi-ivy', 'toradex,verdin-imx8mp-wifi-mallow', 'toradex,verdin-imx8mp-wifi-yavia']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,imx8mp-tqma8mpql-mba8mpxl', 'tq,imx8mp-tqma8mpql-mba8mp-ras314']
	'variscite,var-som-mx8mp-symphony' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['boundary,imx8mq-nitrogen8m', 'boundary,imx8mq-nitrogen8m-som', 'einfochips,imx8mq-thor96', 'fsl,imx8mq-evk', 'google,imx8mq-phanbell', 'kontron,pitx-imx8m', 'purism,librem5-devkit', 'solidrun,hummingboard-pulse', 'technexion,pico-pi-imx8m']
	'mntre,reform2' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['purism,librem5r2', 'purism,librem5r3', 'purism,librem5r4']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,imx8mq-tqma8mq-mba8mx']
	'technexion,edm-g-imx8mp-wb' is not one of ['zii,imx8mq-ultra-rmb3', 'zii,imx8mq-ultra-zest']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imx8qm-mek', 'fsl,imx8qm-mek-revd']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,apalis-imx8-eval', 'toradex,apalis-imx8-eval-v1.2', 'toradex,apalis-imx8-ixora-v1.1']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,apalis-imx8-v1.1-eval', 'toradex,apalis-imx8-v1.1-eval-v1.2', 'toradex,apalis-imx8-v1.1-ixora-v1.1', 'toradex,apalis-imx8-v1.1-ixora-v1.2']
	'technexion,edm-g-imx8mp-wb' is not one of ['einfochips,imx8qxp-ai_ml', 'fsl,imx8qxp-mek', 'fsl,imx8qxp-mek-wcpu']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imx8dxl-evk']
	'technexion,edm-g-imx8mp-wb' is not one of ['toradex,colibri-imx8x-aster', 'toradex,colibri-imx8x-eval-v3', 'toradex,colibri-imx8x-iris', 'toradex,colibri-imx8x-iris-v2']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imx8ulp-evk']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imx93-9x9-qsb', 'fsl,imx93-11x11-evk', 'fsl,imx93-14x14-evk']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imx95-15x15-evk', 'fsl,imx95-19x19-evk']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imxrt1050-evk']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,imxrt1170-evk']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,imx93-tqma9352-mba93xxca', 'tq,imx93-tqma9352-mba93xxla']
	'phytec,imx93-phyboard-segin' was expected
	'variscite,var-som-mx93-symphony' was expected
	'kontron,imx93-bl-osm-s' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,vf500', 'fsl,vf510', 'fsl,vf600', 'fsl,vf610', 'fsl,vf610m4']
	'toradex,vf500-colibri_vf50-on-eval' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,vf610-twr', 'lwn,bk4', 'phytec,vf610-cosmic']
	'toradex,vf610-colibri_vf61-on-eval' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['zii,vf610cfu1', 'zii,vf610dev-c', 'zii,vf610dev-b', 'zii,vf610scu4-aib', 'zii,vf610dtu', 'zii,vf610spu3', 'zii,vf610spb4']
	'technexion,edm-g-imx8mp-wb' is not one of ['ebs-systart,oxalis', 'fsl,ls1012a-rdb', 'fsl,ls1012a-frdm', 'fsl,ls1012a-frwy', 'fsl,ls1012a-qds']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,ls1021a-iot', 'fsl,ls1021a-moxa-uc-8410a', 'fsl,ls1021a-qds', 'fsl,ls1021a-tsn', 'fsl,ls1021a-twr']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,ls1021a-tqmls1021a-mbls102xa']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,ls1028a-qds', 'fsl,ls1028a-rdb']
	'kontron,kbox-a-230-ls' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['kontron,sl28-var1-ads2', 'kontron,sl28-var2-ads2', 'kontron,sl28-var3-ads2', 'kontron,sl28-var4-ads2']
	'technexion,edm-g-imx8mp-wb' is not one of ['kontron,sl28-var1', 'kontron,sl28-var2', 'kontron,sl28-var3', 'kontron,sl28-var4']
	'kontron,sl28' was expected
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,ls1043a-rdb', 'fsl,ls1043a-qds']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,ls1043a-tqmls1043a-mbls10xxa']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,ls1046a-frwy', 'fsl,ls1046a-qds', 'fsl,ls1046a-rdb']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,ls1046a-tqmls1046a-mbls10xxa']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,ls1088a-qds', 'fsl,ls1088a-rdb']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,ls1088a-tqmls1088a-mbls10xxa']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,ls2080a-simu', 'fsl,ls2080a-qds', 'fsl,ls2080a-rdb']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,ls2081a-rdb']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,ls2088a-qds', 'fsl,ls2088a-rdb']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,lx2160a-bluebox3', 'fsl,lx2160a-bluebox3-rev-a', 'fsl,lx2160a-qds', 'fsl,lx2160a-rdb', 'fsl,lx2162a-qds']
	'technexion,edm-g-imx8mp-wb' is not one of ['solidrun,clearfog-cx', 'solidrun,honeycomb']
	'technexion,edm-g-imx8mp-wb' is not one of ['solidrun,lx2162a-clearfog']
	'technexion,edm-g-imx8mp-wb' is not one of ['tq,lx2160a-tqmlx2160a-mblx2160a']
	'technexion,edm-g-imx8mp-wb' is not one of ['nxp,s32g274a-evb', 'nxp,s32g274a-rdb2']
	'technexion,edm-g-imx8mp-wb' is not one of ['nxp,s32g399a-rdb3']
	'technexion,edm-g-imx8mp-wb' is not one of ['fsl,s32v234-evb']
	'technexion,edm-g-imx8mp-wb' is not one of ['traverse,ten64']
	'fsl,imx1' was expected
	'fsl,imx23' was expected
	'fsl,imx25' was expected
	'eukrea,cpuimx25' was expected
	'eukrea,mbimxsd25-baseboard' was expected
	'fsl,imx27' was expected
	'armadeus,imx27-apf27' was expected
	'eukrea,cpuimx27' was expected
	'phytec,imx27-pca100' was expected
	'phytec,imx27-pcm038' was expected
	'fsl,imx28' was expected
	'denx,m28' was expected
	'denx,m28evk' was expected
	'armadeus,imx28-apf28' was expected
	'crystalfontz,cfa10036' was expected
	'crystalfontz,cfa10037' was expected
	'i2se,duckbill-2' was expected
	'eukrea,mbmx28lc' was expected
	'fsl,imx31' was expected
	'fsl,imx35' was expected
	'eukrea,cpuimx35' was expected
	'fsl,imx50' was expected
	'fsl,imx51' was expected
	'armadeus,imx51-apf51' was expected
	'digi,connectcore-ccxmx51-som' was expected
	'eukrea,cpuimx51' was expected
	'fsl,imx53' was expected
	'denx,imx53-m53evk' was expected
	'tq,tqma53' was expected
	'fsl,imx6q' was expected
	'advantech,imx6q-ba16' was expected
	'armadeus,imx6q-apf6' was expected
	'compulab,cm-fx6' was expected
	'dfi,fs700e-m60' was expected
	'dh,imx6q-dhcom-som' was expected
	'gw,ventana' was expected
	'kontron,imx6q-samx6i' was expected
	'phytec,imx6q-pbac06' was expected
	'phytec,imx6q-pfla02' was expected
	'toradex,apalis_imx6q' was expected
	'variscite,var-som-imx6q' was expected
	'tq,mba6a' was expected
	'tq,mba6b' was expected
	'fsl,imx6qp' was expected
	'phytec,imx6qp-pbac06' was expected
	'fsl,imx6dl' was expected
	'armadeus,imx6dl-apf6' was expected
	'congatec,qmx6' was expected
	'dh,imx6dl-dhcom-som' was expected
	'kontron,imx6dl-samx6i' was expected
	'phytec,imx6dl-pbac06' was expected
	'phytec,imx6dl-pfla02' was expected
	'toradex,colibri_imx6dl' was expected
	'dh,imx6s-dhcom-som' was expected
	'fsl,imx6sl' was expected
	'fsl,imx6sll' was expected
	'kobo,clara2e' was expected
	'fsl,imx6sx' was expected
	'fsl,imx6ul' was expected
	'armadeus,imx6ul-opos6ul' was expected
	'digi,ccimx6ulsom' was expected
	'grinn,imx6ul-litesom' was expected
	'phytec,imx6ul-pbacd10' was expected
	'variscite,var-som-imx6ul' was expected
	'kontron,sl-imx6ul' was expected
	'tq,imx6ul-tqma6ul1' was expected
	'tq,imx6ul-tqma6ul2' was expected
	'tq,imx6ul-tqma6ul2l' was expected
	'fsl,imx6ull' was expected
	'armadeus,imx6ull-opos6ul' was expected
	'dh,imx6ull-dhcom-som' was expected
	'dh,imx6ull-dhcor-som' was expected
	'phytec,imx6ull-pbacd10' was expected
	'phytec,imx6ull-phygate-tauri' was expected
	'toradex,colibri-imx6ull' was expected
	'toradex,colibri-imx6ull-emmc' was expected
	'toradex,colibri-imx6ull-wifi' was expected
	'kontron,sl-imx6ull' was expected
	'tq,imx6ull-tqma6ull2' was expected
	'tq,imx6ull-tqma6ull2l' was expected
	'seeed,imx6ull-seeed-npi' was expected
	'fsl,imx7s' was expected
	'toradex,colibri-imx7s' was expected
	'tq,imx7s-tqma7' was expected
	'fsl,imx7d' was expected
	'tq,imx7d-tqma7' was expected
	'compulab,cl-som-imx7' was expected
	'toradex,colibri-imx7d' was expected
	'toradex,colibri-imx7d-emmc' was expected
	'fsl,imx7ulp' was expected
	'fsl,imx8mm' was expected
	'compulab,imx8mm-ucm-som' was expected
	'ees,imx8mm-emtop-som' was expected
	'engicam,icore-mx8mm' was expected
	'kontron,imx8mm-sl' was expected
	'kontron,imx8mm-osm-s' was expected
	'toradex,verdin-imx8mm-nonwifi' was expected
	'toradex,verdin-imx8mm-wifi' was expected
	'phytec,imx8mm-phycore-som' was expected
	'variscite,var-som-mx8mm' was expected
	'tq,imx8mm-tqma8mqml' was expected
	'fsl,imx8mn' was expected
	'variscite,var-som-mx8mn' was expected
	'tq,imx8mn-tqma8mqnl' was expected
	'fsl,imx8mp' was expected
	'abb,imx8mp-aristanetos3-som' was expected
	'avnet,sm2s-imx8mp-14N0600E' was expected
	'boundary,imx8mp-nitrogen-smarc-som' was expected
	'dh,imx8mp-dhcom-som' was expected
	'engicam,icore-mx8mp' was expected
	'kontron,imx8mp-osm-s' was expected
	'kontron,imx8mp-smarc' was expected
	'phytec,imx8mp-phycore-som' was expected
	'polyhex,imx8mp-debix' was expected
	'polyhex,imx8mp-debix-som-a' was expected
	'toradex,verdin-imx8mp-nonwifi' was expected
	'toradex,verdin-imx8mp-wifi' was expected
	'tq,imx8mp-tqma8mpql' was expected
	'variscite,var-som-mx8mp' was expected
	'fsl,imx8mq' was expected
	'boundary,imx8mq-nitrogen8m-som' was expected
	'purism,librem5' was expected
	'tq,imx8mq-tqma8mq' was expected
	'zii,imx8mq-ultra' was expected
	'fsl,imx8qm' was expected
	'toradex,apalis-imx8' was expected
	'toradex,apalis-imx8-v1.1' was expected
	'fsl,imx8dxl' was expected
	'toradex,colibri-imx8x' was expected
	'fsl,imx8ulp' was expected
	'fsl,imx93' was expected
	'fsl,imx95' was expected
	'fsl,imxrt1050' was expected
	'fsl,imxrt1170' was expected
	'tq,imx93-tqma9352' was expected
	'phytec,imx93-phycore-som' was expected
	'variscite,var-som-mx93' was expected
	'kontron,imx93-osm-s' was expected
	'toradex,vf500-colibri_vf50' was expected
	'fsl,vf610' was expected
	'toradex,vf610-colibri_vf61' was expected
	'zii,vf610dev' was expected
	'fsl,ls1012a' was expected
	'fsl,ls1021a' was expected
	'tq,ls1021a-tqmls1021a' was expected
	'fsl,ls1028a' was expected
	'kontron,sl28-var4' was expected
	'technexion,edm-g-imx8mp' is not one of ['kontron,sl28-var1', 'kontron,sl28-var2', 'kontron,sl28-var3', 'kontron,sl28-var4']
	'fsl,ls1043a' was expected
	'tq,ls1043a-tqmls1043a' was expected
	'fsl,ls1046a' was expected
	'tq,ls1046a-tqmls1046a' was expected
	'fsl,ls1088a' was expected
	'tq,ls1088a-tqmls1088a' was expected
	'fsl,ls2080a' was expected
	'fsl,ls2081a' was expected
	'fsl,ls2088a' was expected
	'fsl,lx2160a' was expected
	'solidrun,lx2160a-cex7' was expected
	'solidrun,lx2162a-som' was expected
	'tq,lx2160a-tqmlx2160a' was expected
	'nxp,s32g2' was expected
	'nxp,s32g3' was expected
	'fsl,s32v234' was expected
	'phytec,imx6qdl-pcm058' was expected
	'tq,imx6q-tqma6q-a' was expected
	'tq,imx6q-tqma6q-b' was expected
	'tq,imx6qp-tqma6qp-b' was expected
	'tq,imx6dl-tqma6dl-a' was expected
	'tq,imx6dl-tqma6dl-b' was expected
	'phytec,imx6ul-pcl063' was expected
	'phytec,imx6ull-pcl063' was expected
	'fsl,imx6ulz' was expected
	'toradex,verdin-imx8mm' was expected
	'avnet,sm2s-imx8mp' was expected
	'toradex,verdin-imx8mp' was expected
	'fsl,imx8mp' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
	'fsl,vf500' was expected
	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dtb: /: failed to match any schema with compatible: ['technexion,edm-g-imx8mp-wb', 'technexion,edm-g-imx8mp', 'fsl,imx8mp']
arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dtb: /: failed to match any schema with compatible: ['technexion,edm-g-imx8mp-wb', 'technexion,edm-g-imx8mp', 'fsl,imx8mp']
arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dtb: i2c-gpio-brd-conf (i2c-gpio): $nodename:0: 'i2c-gpio-brd-conf' does not match '^i2c(@.+|-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dtb: i2c-gpio-brd-conf (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#

