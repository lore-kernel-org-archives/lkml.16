Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2065.outbound.protection.outlook.com [40.107.105.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F6925D901;
	Mon, 14 Apr 2025 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624670; cv=fail; b=XoETiQSo/zYwJKNKQ5BVGNRhhxHJk/KPU1sasfNbMCDTIdKrdpanod8hR1ZRB3HoQNz4JIdoVscrY//iNwDzgziwBSQKAK4+g0UX1Y9Ah7iQ96RaaYNIh/5s9swvDX3Wusy0p2h/VXzjV3qc5nxv3ZqnPvDkBnWPtnochLROdf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624670; c=relaxed/simple;
	bh=6091epKMoOqHQ6/gRbp8zHJXYl9LxGeavV7q73HdSqI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fl7NwYZzngysLxqdWEegv2S9Bru95AJHQJHgA3Pl2/ibR4GKIQxoR9ms17dnrQg+UiirIRM0XNLvs/+nZpOEHdiIBFoUK1AT0S8y1Dm0mQIeaeBeLzBlRb62uJfuKq9Nsbfh/5I7eVvdn3rwMuvprizNGj0y/H9SVTQTFRP9UMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zpi7vun3; arc=fail smtp.client-ip=40.107.105.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zpi7vun3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLFoaIfg/xt0cHuqP6MzbQZlhPzDOqrQHjogre7KMN6Xg/4Wt1upibmAvrofLdUdFIglsolZ8RV9vHEgXMv7Wg0q7iGzSEay6LHcXsLqNMBHHpOwV9phkPUvVxIOSqYbUAqrAYUovNn4cFR3NpxdrcJbpHaD0cM8NV9KyJqq81O8wYTBEiQWL4HmbnNaNvX+3RXQ37iTa7eFgme825oqfj1Vs/7gsd7joSEX5DZNtNAtgKS3AAkgor+/0QMjficx0xWpm4LZT7y8VhqA87BhZoqXVqXhAwDJrQdufvpV4htqf0vtiiyGvON2t0c7ARW938FZLJSh66LymjVE7l+4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/w6g0WIIWyF3hmk7nvh1oW66RrI9ukGxbjsk8lSaDc=;
 b=CXcjNpJRNUn8uf281OVQ2bxHWocNnk3iYAuBapSMLpr7/UiGIZg2DQx5JUtbWqorlZtDUNsxWp0AR2QfripHd83VLRZZSufq6+3vdy/afMZmK03+iSJZcXJ8HbjWisVjp5sfnVBrGKpFl+2k6QiZIqNpJlxsyfKRUqkd6GJoqnEFh6QtdzpuNFUiHJBABgVXn4S0T08Hc0EUNykMfn89rWZ63M9+M2pL6QW+v7xMoB8BIcYd/s9pwRqjL6MIPq+mdi+gGpR7sK64rdG22jn8P9wcMK7/szg9Fuu8uXMRRffZlqtbJT0AJyT/Bi4bIOJxlDyFwQzhwR8Vnfw0fLqh2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/w6g0WIIWyF3hmk7nvh1oW66RrI9ukGxbjsk8lSaDc=;
 b=Zpi7vun3UGu7jLvXDjOBd7e5OWsFDxaBD1i0tezk/mBXZhN+ybwPtjRx+0qH8vMHwysQxDdTs5ZUjl8alsphQut1izRvo/UmF/jCiNyiXzdtNFw6/AnXttuiMUGCXX/hkH9303EIMvpGQTGW87gFeEUhmfFGshQOPGcnD6aT0ZMPZ1UxyDj7myvy6X+yQMn/MRMGPIhrBHflO4LuFrLvRMMnjalJICDmNmknuhjxsAy1XS5ABo8nAXY3e3E5f1RUEpg7TrBZpMUDoWqv91rBw1ryR70Ksi1yAtPDY6HoraBAnniOgdZs6dWvyU+0EbstSY4P/wniiOZQadE46/xeAQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU6PR04MB11085.eurprd04.prod.outlook.com (2603:10a6:10:5c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 09:57:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 09:57:43 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Thread-Topic: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Thread-Index: AQHbqGLe3kxhTr5dw0mXAVP8MdrZO7Oi8B4AgAAF/qA=
Date: Mon, 14 Apr 2025 09:57:43 +0000
Message-ID:
 <PAXPR04MB8459195AAF65D38AFA1D4F9688B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>
 <20250414-wonderful-cute-bandicoot-accb6b@sudeepholla>
In-Reply-To: <20250414-wonderful-cute-bandicoot-accb6b@sudeepholla>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU6PR04MB11085:EE_
x-ms-office365-filtering-correlation-id: e723288f-3210-4793-e201-08dd7b3acd4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gM4CfkXwZ9UL2Rkgnw5+4lB9Y6idZPnQW5KC+ayrdCUjo1duAqWB0aA3ChSj?=
 =?us-ascii?Q?J5JaAHDs0F5Ro6oqXx2RVcvo2J1CpQJZS88yzwgKcoEdS8vz3wueVvWn8UoZ?=
 =?us-ascii?Q?bizNP+s8hXSBrXcsGvddrI8I7Ffv3KWSQnp4wP9umwCuz7IrqjzJkOq4LuEe?=
 =?us-ascii?Q?i8yZRdn/fdMTCi8uFKNP+sb4m6uzr3XWBdOsq6wLPghsd7f2+C6mMiuRSibI?=
 =?us-ascii?Q?M1ShxGrUH02OFo+dvrvZSvY/ybxiWQSo23bMbEOZDKBtI9/u/4M58c99ox7y?=
 =?us-ascii?Q?UjKGmw0OXw//21aCORADgjgtaCWfQMXiGQP4CTLUMEVIG+ZJTLsdSn5BTENE?=
 =?us-ascii?Q?hPoM4K0A1XPQVkzY/oykTOC7XurbL2WE5Z1wqilgU+JEmn9UxB1Zn6OYR99V?=
 =?us-ascii?Q?6yTTa91fnLl8O2IXigGprjsvdiMy/Ab4fyeGyPAL6DcfHO78z58VgxHNGyHn?=
 =?us-ascii?Q?A3FlTVBmComofIw0GSnKs5MkVu1D4MlaV/I6C2pjL+nrlkS4ayg1ZbIUmzwu?=
 =?us-ascii?Q?jNuHq5t3WMEPXAehH1RbE+S2gdaTrbGExFOtbzadG3VkjtISVatnDIV4kSAI?=
 =?us-ascii?Q?G+tPAok4sp3yCRRvocMn+Wr60PhsCnrTm0OfmxeA5wDZqKd+v20oK2x6hCsM?=
 =?us-ascii?Q?BOGrtryO6YLQ8sGj/CK7zVyeOGo6KC9QVK7S8SudKQgRUE+cTUE+yxdwFZni?=
 =?us-ascii?Q?R2x1WJodHipauFLbVPCty3/YsuhcbRRQHZ6q+YM9Ore6zqX/Zsgp+gQZmEWp?=
 =?us-ascii?Q?bG81ir2tCWCndL/GG0LlPj11XibwaiChXuuEpOyWBWWjYG+2e3YbsxuxcVER?=
 =?us-ascii?Q?nl12CCZzqaJN18rgs8gAV7ARq7MDhPro2RzxXTwgqZa359+EI7HkjdaI83C6?=
 =?us-ascii?Q?hD4jNlr0XQr+uJU8iPPhWd5fesSvxeptAG4n4RQxvVDg0Hjh7hdhpSj2TfA6?=
 =?us-ascii?Q?Yj/iV7KYJwaAn4qL7t/Wx3TApWAYZTSPUcKjh3E/L9vJ04QHev++sFvtoYmi?=
 =?us-ascii?Q?z7Gtp6gbhR+GUfBLJggOq1TjOsshgdtWtd7D4vKNxC7FZaBhYHJBY+uInqOw?=
 =?us-ascii?Q?T0xDmgI16zVR310+16QTJDIotsTqndfMPOT5JBbS1EPxTrKYZ3Tft3IBfCJ1?=
 =?us-ascii?Q?0fb4QSwcvaaGrbjjgcSMSVuBaYF2MoekyToq/hbQyCc2ZJnDYPmuAoVpznxZ?=
 =?us-ascii?Q?VcawaY4qXF+2gRxvayi05qz6n/HAZGzC9aHVZZe3Wgmrc/Gia0tJ9UkQwZ0K?=
 =?us-ascii?Q?MYqs6hDq/Ngb2T4uP+WuJQ4S5bxq1uPiUzqYhaS6TMuT71rMydLx8ylZux7I?=
 =?us-ascii?Q?JIXEHM4At1hTrZZ3wTVCBib0f61glIXsbniTXShyWu5fLXxe4c4A/8OdsTHs?=
 =?us-ascii?Q?16UzyyZ4smZ4Q3lNKg8GyLac6+uIEUIEc5E/sv8KQiTFt4i2W+SwSJ4YOIYj?=
 =?us-ascii?Q?THIfhmZ59UBsSzCGUCr/JuDym6Ah5JqaTQ60h2DVdcfz/oVQ+JFSfQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?L+zUfbbiXyL8rvWYOEJVabeuTRjIq2EhpWeoD9S1PEI/IRvJqAhr/SQ+nmTd?=
 =?us-ascii?Q?SICJELQkh4Ej4wAf8YVpar9L12DLTNcmvTnfnCuc6CyP66Vd+iP2SHeSNpwx?=
 =?us-ascii?Q?LizhIrSnEHulPULgOe3mjGwSGyWWUX5n9RmaGJVXfoJ5CCo2upo3T5Syp9gU?=
 =?us-ascii?Q?N4lILwhhU9VlikoKdLWGECrVzmMYkLQRilsSOCloOdYOGhGWZxqooiXv0bVe?=
 =?us-ascii?Q?DrkPiFF8+dCQH2JFuDyfOKMD8+hDAqKHLAVg8mDGAWIvCvPwSK2teI8yld+l?=
 =?us-ascii?Q?+To0eg7LX8YzJtbNA6bH2XmsP7hSjD7dSvJsc47pWUKwVVIwF6RrjynbGe9N?=
 =?us-ascii?Q?XwMOesCxl/Wjib7axX4jbU6mVcKF1D52nWr7x946JQzl0nNo7P07e6sE38bU?=
 =?us-ascii?Q?vAxhFeUYGk+piABNKUoJx2OC7Y0apGvP/eEApYfVI3Jlc/Ee+D669OuXDOGr?=
 =?us-ascii?Q?4kbILCUMvF5HDTloXe5ZuJ+W9Ktxo+bvBEQLEPigPP4NMPYfMySwK8EgvY+0?=
 =?us-ascii?Q?VjuBkHFHdWwMZoQ3P90Eie7CINfC9OCXxrAa11h7QdjXS3Xl/k01G0W9d04Y?=
 =?us-ascii?Q?11tx5ekIhJ4ZlZYgojBWN7vmQcJbFGJWFZOAIUxe/IU4rzCRxhrAgDBp1Rgt?=
 =?us-ascii?Q?vgvLxEgkyxVdN6thX0apYni6/Mg1PSsIlnuxCK9GH1zCPvBfQ71VgXsjj3B5?=
 =?us-ascii?Q?jJ5eCvXw8N8YCRYFIcHoZqk7sPf47ACplhvHG+Z0q6ZROJL3+LjsIVkIqsXv?=
 =?us-ascii?Q?Q9GYRm89qgk7+hGdbSrmuBURgHlJ9xyLvbk1KYkWVqrQRUtnIAWyO3RgXW2Y?=
 =?us-ascii?Q?/kz0n4G4Tso/mMtu5xlu8q3BzRnFiDy2keuDzgIwj5WM1RK9Sh+N6hZwGdmO?=
 =?us-ascii?Q?O4Bz6Tax2NSYi5afQMVN1wdIInjaJQ8HkaLb1CKxsOpU4ZJN91ae4EaSFIKu?=
 =?us-ascii?Q?JBdC41ljmgbuVMUV45de2AMcyMKLNcG4h49eyyNrx75FXo8HDW0LOU+pCIZo?=
 =?us-ascii?Q?m1KcOdBO6NVXtCADBVY61kGslnau38r5sTuQAMivaMYaOL55wVoUwWgH6SBt?=
 =?us-ascii?Q?hD0oIgaaz1fNnCSAxmTWB99qixI6t4KqMZxGh3s9rWqWgfRRhqDmeHq13qGX?=
 =?us-ascii?Q?QtpeyqsgJ89SbDuHepEVthqau8a9L5PgYomJaWCC3pLo9R2j8LdQwwB7BX4W?=
 =?us-ascii?Q?EjWUflDgp+k2tCj7zi6qqtR9j5boyiRSpxEa76PSI8zp0O0VOG07+oU6mqNt?=
 =?us-ascii?Q?TkC3Il8Xryg+2asF2F6ZP3Zz61yN11w4YPw1920xzH7fnI7JdbfSXBhEwyIO?=
 =?us-ascii?Q?JlN/ovPP/mAPTdftjRdeKvv/O/rKstYXYkRUwoSwM89UpDt9Ca+wJUuDg08n?=
 =?us-ascii?Q?/ekeHRIx+TvPa+zDw2n3jmuf1Ei4sOhwvEyIgCDvkRZmx2bqbr7Lm6eMktcs?=
 =?us-ascii?Q?pXShNIyt7QnHjrN6YU0fx++ezLWCiza9exjuYTenxplBZ74E0rAzTy0c0lpa?=
 =?us-ascii?Q?lA6xfXFTx7lsBk2IHZyJF80sTd9NaUBKjI5yp3IJYWjk9pauGniXjVM6Htfh?=
 =?us-ascii?Q?pY/09T2Ntoigqix1uX4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e723288f-3210-4793-e201-08dd7b3acd4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 09:57:43.8792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9Ela1xmAbFoX79c8vUJCIJhdQuArTTWvnqtvDzsrPQ5EDUQRxNydY/8nGr4+JNS9VFvCv6+D8KA/pX56DfUGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11085

Hi Sudeep,

> Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM
> driver
>=20
> On Tue, Apr 08, 2025 at 04:44:29PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The i.MX95 System manager exports SCMI LMM protocol for linux to
> > manage Logical Machines. The driver is to use the LMM Protocol
> > interface to boot, shutdown a LM.
> >
> > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/firmware/arm_scmi/vendors/imx/Kconfig |  3 +-
> >  drivers/firmware/imx/Kconfig                  | 11 ++++
> >  drivers/firmware/imx/Makefile                 |  1 +
> >  drivers/firmware/imx/sm-lmm.c                 | 91
> +++++++++++++++++++++++++++
> >  include/linux/firmware/imx/sm.h               | 14 +++++
> >  5 files changed, 119 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > index
> >
> b5f13d0e40155e485f4d1696e9550645d888ef44..4c24e17425f83081
> 0f8ba376ece9
> > db93c8cded6d 100644
> > --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> > @@ -26,7 +26,8 @@ config IMX_SCMI_CPU_EXT  config
> IMX_SCMI_LMM_EXT
> >  	tristate "i.MX SCMI LMM EXTENSION"
> >  	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> > -	default y if ARCH_MXC
> > +	depends on IMX_SCMI_LMM_DRV
> > +	default y if ARCH_MXC && ARM64
>=20
> I can't understand the ARM64 dependency on this and next patch.

ARCH_MXC both supports ARM32 and ARM64.

To i.MX ARM32 platform, there is no plan to enable SCMI, so only
set y for ARCH_MXC ARM64 platforms.

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep
