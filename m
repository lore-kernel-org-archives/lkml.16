Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF922949F7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919580; cv=none; b=I4sWdPKoQPZZxC5DIqHGmgXgjh5HOXs20Fn/UKCJdNhEimviHW2spjaMt2dw7XQ2+MDBHFTyGW551aUKqnHOxHA1pThUDmrjszmR6eRxW4eZHNaoXKg68Y4T2mZe8jeKsUD2BK7qydWq/qJv5MebWjP2gcVygf0vIsoYgd2XxCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919580; c=relaxed/simple;
	bh=wff8gluj3VBQRHUO2dAZPoDwcc7HlG1ihchdsWbgGBQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dzGstWOLBKbSiVyB35Xdj45biDKKBX13+U3UKm/cwcU5XqR2jwb7ZLdfrYtPKTL3i2m1hRzcU84DiYvgjwToJfMgZE6UmRPK8TANI8ChQ4i6oB/otiC3JMBFxGi/PgSA1Z5yWHpsQEGF/a/sDQCDL1TH/Ri2pUXtNPns2GddX+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1u9hQw-0004du-Pm; Tue, 29 Apr 2025 11:39:22 +0200
Message-ID: <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>
Subject: Re: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC
 DTSI
From: Lucas Stach <l.stach@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Francesco Dolcini <francesco@dolcini.it>, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Tue, 29 Apr 2025 11:39:20 +0200
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi Krzysztof,

Am Freitag, dem 25.04.2025 um 21:48 +0200 schrieb Krzysztof Kozlowski:
> Not tested on hardware.
>=20
> Ethernet interface, like other exposed interfaces, aliases depend on
> actual board configuration, e.g. its labeling, thus aliases should be
> defined per each board or each SoM.
>=20
> Some boards (e.g. Gateworks) follow this convention but many do not.
>=20
> This is continuation of my comments from:
> https://lore.kernel.org/r/16a98816-f43c-4f4d-940e-9da30cb1f73f@kernel.org
>=20
The i.MX boards have traditionally listed aliases for many hardware
peripherals with the same numbering that's used in the SoC reference
manual. Boards always have the option to override those aliases if they
have a good reason to do so, e.g. labeling on the physical device.

Other users besides Linux rely on fixed numbering provided by the
aliases. Both barebox and U-Boot number their ethernet interfaces
according to the alias.

While you seem to add back aliases for in-tree boards, this breaks the
majority of boards that include the kernel DTSI from an out-of-tree
board. I can understand that we can't always accommodate these users,
but I simply don't see the strong benefit of this patch to justify
creating churn and possible regressions with those OOT users.

Having those aliases in the DTSI has been common practice on the i.MX
platform since 2012, long before there was any strong consensus on how
those aliases should be used. Breaking existing users for the sake of
aligning the i.MX platform with more idiomatic DT usage does not seem
to be a worthwhile trade-off to me.

Regards,
Lucas

> Best regards,
> Krzysztof
>=20
> ---
> Krzysztof Kozlowski (6):
>       arm64: dts: imx8qxp: Move Ethernet aliases out of SoC DTSI
>       arm64: dts: imx8dxl: Move Ethernet aliases out of SoC DTSI
>       arm64: dts: imx8mm: Move Ethernet aliases out of SoC DTSI
>       arm64: dts: imx8mn: Move Ethernet aliases out of SoC DTSI
>       arm64: dts: imx8mq: Move Ethernet aliases out of SoC DTSI
>       arm64: dts: imx8qm: Add Ethernet aliases
>=20
>  arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi           | 2 ++
>  arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi     | 1 +
>  arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi     | 1 +
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts                 | 1 +
>  arch/arm64/boot/dts/freescale/imx8dxl.dtsi                    | 2 --
>  arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi          | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts   | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-emcon.dtsi               | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts      | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi                 | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dts  | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dts | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-innocomm-wb15-evk.dts    | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts     | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts           | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts             | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts          | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-phg.dts                  | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi         | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi             | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi             | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw700x.dtsi       | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts        | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dts        | 1 +
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi       | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi          | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi          | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi       | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm-verdin-yavia.dtsi        | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi                     | 1 -
>  arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi          | 1 +
>  arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi   | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi                 | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi             | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dts        | 1 +
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi                     | 1 -
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts                  | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dts   | 1 +
>  arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts       | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts          | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts             | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts             | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts              | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mq-sr-som.dtsi              | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mq-thor96.dts               | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi           | 1 +
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi                     | 1 -
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts                  | 5 +++++
>  arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dts               | 1 +
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts                 | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi                    | 2 --
>  arch/arm64/boot/dts/freescale/imx8x-colibri-aster.dtsi        | 6 ++++++
>  arch/arm64/boot/dts/freescale/imx8x-colibri-eval-v3.dtsi      | 1 +
>  arch/arm64/boot/dts/freescale/imx8x-colibri-iris.dtsi         | 1 +
>  arch/arm64/boot/dts/freescale/mba8mx.dtsi                     | 4 ++++
>  arch/arm64/boot/dts/freescale/mba8xx.dtsi                     | 2 ++
>  56 files changed, 143 insertions(+), 7 deletions(-)
> ---
> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
> change-id: 20250425-dts-imx-aliases-ethernet-37d8552939de
>=20
> Best regards,

