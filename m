Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0A6230BDA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021671; cv=none; b=qCO/O7vc2vNQvIZWrAajipK1Ie47EOkPliTSw952dnkjbstmNT+xnxvtxeTe2FbsFPnZOzca81nIPuEKdEfIT+Fpg25B1cM5+Kq2VcXl2CH9cLjAqEGZAizpuyZFu+eZnGU3CsGhpCqFbk4B2AFyYS3X0SBwhfgsd01FkjIBqHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021671; c=relaxed/simple;
	bh=iCle5ZrD73E0NeAXcHmA0BFFK48D3A+4NTubxkbzqfc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IT2NS0am+EJo3QzGqHv4dFf4dO4IZT+xP8MpqjLToJalqLYi4/SPKhZ1LHvVePvPj2PIw+ISsFSqlmuuWc9B97iMQJadwnOqpxvgWhC486pmB/kjE7PE7vs5RPzYm4BE/0PAyXO9N3sCXhCYXqpSUBrD997WRUNKP3B2aPfVgow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u1jhM-0002oA-VC; Mon, 07 Apr 2025 12:27:24 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u1jhM-003k9X-1D;
	Mon, 07 Apr 2025 12:27:24 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u1jhM-0008eX-0y;
	Mon, 07 Apr 2025 12:27:24 +0200
Message-ID: <4400a2a695099e4d806d12ddda41c2533bf844c8.camel@pengutronix.de>
Subject: Re: [PATCH v1 0/2] TH1520 SoC: Add Reset Controller Support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, m.szyprowski@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 07 Apr 2025 12:27:24 +0200
In-Reply-To: <4205b786-fb65-468c-a3d8-bce807dd829a@samsung.com>
References: 
	<CGME20250303152520eucas1p250f2e6d8eaf1172d8813b04ceb88679c@eucas1p2.samsung.com>
	 <20250303152511.494405-1-m.wilczynski@samsung.com>
	 <4205b786-fb65-468c-a3d8-bce807dd829a@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Mi, 2025-03-05 at 09:23 +0100, Michal Wilczynski wrote:
>=20
> On 3/3/25 16:25, Michal Wilczynski wrote:
> > This patch series adds reset controller support for the T-Head TH1520 S=
oC,
> > which is used in boards like the LicheePi 4A. While part of a broader e=
ffort to
> > enable the Imagination BXM-4-64 GPU upstream, these patches focus on pr=
oviding
> > a dedicated reset controller driver and the corresponding Device Tree
> > nodes/bindings.
> >=20
> > Bigger series cover letter:
> > https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsu=
ng.com/
>=20
>=20
> This series should be versioned as v6, to maintain continuity with the
> bigger patchset it is a subseries of. Please find below a changelog for
> the reset sub-series:
>=20
> v6:
>  - split the reset part into sub-series, add the Reviewed-by from
>    Philipp

FTR,=C2=A0I'll apply this as v6. I've checked differences to v5 semi-
manually - the changes are not listed in the changelog, but they are
what I suggested:

----------8<----------
$ b4 am -T 20250219140239.1378758-1-m.wilczynski@samsung.com
$ b4 am -T 20250303152511.494405-1-m.wilczynski@samsung.com
$ b4 diff -m v5_20250219_m_wilczynski_enable_drm_imagination_bxm_4_64_suppo=
rt_for_licheepi_4a.mbx \
             20250303_m_wilczynski_th1520_soc_add_reset_controller_support.=
mbx

 1:  0394b6a226519 <  -:  ------------- dt-bindings: clock: thead: Add TH15=
20 VO clock controller
 2:  bd073ef5d8100 <  -:  ------------- clk: thead: Add clock support for V=
O subsystem in T-Head TH1520 SoC
 3:  bbfd6b84574eb <  -:  ------------- dt-bindings: firmware: thead,th1520=
: Add support for firmware node
 4:  9fa4a7c315420 <  -:  ------------- firmware: thead: Add AON firmware p=
rotocol driver
 5:  5775fe10945af <  -:  ------------- dt-bindings: power: Add TH1520 SoC =
power domains
 6:  501c3260c8060 <  -:  ------------- pmdomain: thead: Add power-domain d=
river for TH1520
 7:  67191981e2bd2 <  -:  ------------- riscv: Enable PM_GENERIC_DOMAINS fo=
r T-Head SoCs
 8:  e866e1039b1f1 <  -:  ------------- clk: thead: Add support for custom =
ops in CCU_GATE_CLK_OPS macro
 9:  73b7c8a74dfc6 <  -:  ------------- dt-bindings: clock: thead: Add GPU =
clkgen reset property
10:  116940381d1a3 <  -:  ------------- clk: thead: Add GPU clock gate cont=
rol with CLKGEN reset support
11:  6ed636028a35c =3D  1:  cc4aca290ed6a dt-bindings: reset: Add T-HEAD TH=
1520 SoC Reset Controller
12:  49eee8a9fa0b1 !  2:  34edd507ac54b reset: thead: Add TH1520 reset cont=
roller driver
    @@ Commit message
         implements support for GPU reset control, with infrastructure in p=
lace
         to extend support for NPU and Watchdog Timer resets in future upda=
tes.
    =20
    +    Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
         Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
    =20
      ## MAINTAINERS ##
    @@ drivers/reset/reset-th1520.c (new)
     +	struct th1520_reset_priv *priv =3D to_th1520_reset(rcdev);
     +	const struct th1520_reset_map *reset;
     +
    -+	if (id >=3D ARRAY_SIZE(th1520_resets))
    -+		return -EINVAL;
    -+
     +	reset =3D &th1520_resets[id];
     +
     +	return regmap_update_bits(priv->map, reset->reg, reset->bit, 0);
    @@ drivers/reset/reset-th1520.c (new)
     +	struct th1520_reset_priv *priv =3D to_th1520_reset(rcdev);
     +	const struct th1520_reset_map *reset;
     +
    -+	if (id >=3D ARRAY_SIZE(th1520_resets))
    -+		return -EINVAL;
    -+
     +	reset =3D &th1520_resets[id];
     +
     +	return regmap_update_bits(priv->map, reset->reg, reset->bit,
    @@ drivers/reset/reset-th1520.c (new)
     +		return ret;
     +
     +	priv->rcdev.owner =3D THIS_MODULE;
    -+	priv->rcdev.nr_resets =3D 2;
    ++	priv->rcdev.nr_resets =3D ARRAY_SIZE(th1520_resets);
     +	priv->rcdev.ops =3D &th1520_reset_ops;
     +	priv->rcdev.of_node =3D dev->of_node;
     +
13:  5b3a5c4e99c6e <  -:  ------------- drm/imagination: Add reset controll=
er support for GPU initialization
14:  8175d1ae71f27 <  -:  ------------- dt-bindings: gpu: Add 'resets' prop=
erty for GPU initialization
15:  37258df02d9f5 <  -:  ------------- dt-bindings: gpu: Add support for T=
-HEAD TH1520 GPU
16:  0da2bcc589f4e <  -:  ------------- drm/imagination: Add support for IM=
G BXM-4-64 GPU
17:  4a130662031ab <  -:  ------------- drm/imagination: Enable PowerVR dri=
ver for RISC-V
18:  96435f063bc3f <  -:  ------------- riscv: dts: thead: Add device tree =
VO clock controller
19:  d8734c51119f5 <  -:  ------------- riscv: dts: thead: Introduce power =
domain nodes with aon firmware
20:  bbd2819cbd342 <  -:  ------------- riscv: dts: thead: Introduce reset =
controller node
21:  b22cf01230932 <  -:  ------------- riscv: dts: thead: Add GPU node to =
TH1520 device tree
---------->8----------

regards
Philipp
