Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56E14F70;
	Fri, 20 Jun 2025 00:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750379392; cv=fail; b=qbUPaAlbcrfhTaHW6aWGNORUuCS134ho89wxLb8XEOx0GQcyxqvkpXHsR4imka3PqGwI+W5IGolR/9/nCqINHptW+qxA9UOWKn5pqoEHF8XDO+E6yawirTcnyNgA6UVdVZn71ynqlL7pqTjGKaGmhr0GJ0qLQgz35h2GMnNW6oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750379392; c=relaxed/simple;
	bh=8pTfQW0fpKQTDog/QY/fIQiZ4zMgEEPcCRLbS6ZiKxs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dNh2Q0KJHs4H6jmgXBbOijzfdS3xx+Lk7hOTqqjXPyfTtwKFBCmDysKVnCG3qKr2F/znb1FVPdRCcZQMTFIFHaciwj7AvAlPfeBzg6QDV0ZlNDGRaxfem9aqxsrqkZ4LUdoJYhQM1/VrOhzOXgwc9xFI0FAoNYm57WFtlAa8L1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O12fDPlH; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O12fDPlH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkqhwUp9/6mu/D5tiaLM11PqmD56R8vEHHfsNtzFHStIWIQv9LHzzDTK0Rvv4P1Ol7AKGhLjKuVSwiwsN7JLh4B5ojfj+lTXEdtPRhGEmSLpYzNu50QKKE2V4B5pX5KS4r/vHH+1WIrGYWnOAQiGDbdmbXmUZw+ZYTVu+zFFVHb7GwLypzppAOFDaxe3N2DI11eUlJ73okM20wBrtI4/vODjJP6Fh3AqCPIRQhvZWjXxQZuGU4QpHZ6C3gmP68hZ+vS1covQTeRRex/GQnulGnfzRLKjWOUFnHQN1ZMctpkITPuIdo6Nkpau9nQuW0YyH93d/b0I0CVcqPRk+cNSdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AX3Njd0bmxHhuuRwT96kB2YU0GMVoUt3OQUsAGbzmxw=;
 b=QxQza5hQIJtBEwaPPT0MM9y+WnSlSZM/9v1N0yPRrGG8UBo6xVQnY83IACNfGvEloX7knWhqND5odaBE5c/B7MwdHH50ldaOvVBy6jlL8WuNEzSpTkEAsmWzlQoDmSHwWsahexYnGanfCfzEtYxONyxVjjC9TviV8M50RaTotbW9523lgz2+Q7O/C6R30ZIcO7SPgz8eZnmB0v+oqKpBy5j553dhG88YWpFNkPFiPVJwZIWxxHz6cb9uHU6XR+trLCvQ95UhXJGwDLzxeSqUyWzLw6HdTHvj1iyANxTSC3l22kNvAqEOOlDRGwt1GX1xqC1zbjJ4GXv+CBJFgQRscw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AX3Njd0bmxHhuuRwT96kB2YU0GMVoUt3OQUsAGbzmxw=;
 b=O12fDPlH+mjJph18Wb4YZ5H2HTJiG3otm2zorhumj2viuSjoywW5OPjG4ZEYSX7FdWbE9bxUqD+qk/3qtW0bLfXr9pDCSPiLUieZulT1ZCH2itGkuQ8bT1Q9V8Dy78zx9fV2N8SqMkGIJjBjapTnjBwZ3bU6rtstCNYx3d2pJnVUrpA0rT/ZdmxNNj9lOYnMT0XvOsT9mXwn1g76SvUA9m/kmZLAHj+si+SPuhzE45Ii9bl5oJUfEMAn9lHeEiWnMKsgttttf/LHPIob2qE5zBVMfA6pf+gbAYB4meDRtDnyppKf7kBufSu6IgKWx2R7m8jDy0jOf1YTH2AXh/nIdA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB11008.eurprd04.prod.outlook.com (2603:10a6:10:58d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 20 Jun
 2025 00:29:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.021; Fri, 20 Jun 2025
 00:29:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>, "abelvesa@kernel.org"
	<abelvesa@kernel.org>, Frank Li <frank.li@nxp.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] clk: imx: Fix an out-of-bounds access in
 dispmix_csr_clk_dev_data
Thread-Topic: [PATCH v3] clk: imx: Fix an out-of-bounds access in
 dispmix_csr_clk_dev_data
Thread-Index: AQHb4OJ0ACuYPyW7N064IwnXy2ztjLQLMvcQ
Date: Fri, 20 Jun 2025 00:29:46 +0000
Message-ID:
 <PAXPR04MB845926715E9311F30E5BFDEE887CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250619062108.2016511-1-xiaolei.wang@windriver.com>
In-Reply-To: <20250619062108.2016511-1-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU4PR04MB11008:EE_
x-ms-office365-filtering-correlation-id: 6caa6150-1205-49cf-6921-08ddaf918f3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YkGigzs+dEPn5Oqc7utPKbsOXokFwtcCtNJj++Pr7n0puNcEvVpcSoT22OaM?=
 =?us-ascii?Q?PRN6jUces3fkKikaQf+r6coiGmytvXWB2JgxcN84fqCjgqsW7FE5UGFzaKha?=
 =?us-ascii?Q?OXix6dIvzdvdQQMpZGh+oTLSXq8roDJQda8QJowS+Y6sNiqqeTipSvUJtfSQ?=
 =?us-ascii?Q?C4QMba/0zcAVregA4RqQiBaeqwyPQ8zisCjZTz2nJ9wwUQq2gl7B+WajCEyM?=
 =?us-ascii?Q?KXEGrAnBQY5GBEk0FMZUMHWOdiIiBKblPZT7J9NWuSuRRU2cgNoNSKaR+ksy?=
 =?us-ascii?Q?rCTa9lit1sQUAWkeTWIY2haBZxfLvy0OcELVv79Gl03r/A5LOf2kTLL3tdEc?=
 =?us-ascii?Q?hcIHII5DPdHz627w/lqorSuUW8mQ2wBwIza24+TbNiAjiA8JqGObVZVqb5fW?=
 =?us-ascii?Q?SFfcHQ0QwdJTCz0S3pWLzfV5/eIHN+JBzQg9RpdHQTFhEJj2suBdb7D4zEgX?=
 =?us-ascii?Q?cFCLHUVaKfA9CN005PGKxvhk5Ymd2CfOVdQ31hyETQlLaVhid/Cw4IwKIaSE?=
 =?us-ascii?Q?fZVIGImy7A36ItJBIwVk6hRV6Rh/voaZ7y++k/WxAsZi5ru3vkzHoVQmRzWf?=
 =?us-ascii?Q?VImA25q4SBIILF43JJQniYnMJeCReTv4NpRL73F2gmfbRBf1TYMMkRezB1ei?=
 =?us-ascii?Q?5v2GsMMKsKy4syxPRZYtaJI/yuK1oXibcaad5/gZqYYvmeSWJQjkbiaWp7Td?=
 =?us-ascii?Q?ZA9VKePThiHu8LbTvPIUZJkV52KluRbBxqIWqV/TRyN6nPOvM4UDOMRCXFLs?=
 =?us-ascii?Q?JAyYWAUE2qJYzX2qATFagY/pQPCKJ0mvwMBTOEEWgM+2PbdONM2RYLkI0Fex?=
 =?us-ascii?Q?SG6O/RiNRocN7VqESO9sE/g9h1hTSQUxLcj4/pzgXzFAz7dFHGnrSFW5Vivj?=
 =?us-ascii?Q?BNEq7OTu1mBRxf2LkpsjdU2td/lCUfcjcVcCnK+KVHFNYXxwcyHR7fbSV7BL?=
 =?us-ascii?Q?W/fHnKFv+szeU5m7PsLNk41sRsNS+Y1mejFkZj5isuuBfBzNsR3KywNgahx7?=
 =?us-ascii?Q?mGRpBPkfFEp1/f6wNcdKl65Slghq8AaLFHYDO2d+hi7fl8VwA8SXIzEluynU?=
 =?us-ascii?Q?HUPAjxtueQfB+saBMGbUGDBbTrDLDtIOddv9vYAwP+GKvUBvC+9HPSH8DPup?=
 =?us-ascii?Q?6IoXpdneS75iBoyzQlIoKQDhbbmeOB0do5aUkTbXTQApRhV7xqMbiqlEV0VR?=
 =?us-ascii?Q?XrpSvPt5Sj4V+XFbZQQYmLJLjdSROCe+69NFNKit0jsk/nomzKSL5ifLJ/D/?=
 =?us-ascii?Q?xoE9J/TfcsikphdeJ7v9Xa6LocXb0f53QFNIZrrOT2gl5X8vc2XCZgFQlLUS?=
 =?us-ascii?Q?fngI8oBt32D715dNPWUAH4CK6hf/KLOJNgG7J3vYOIdse1CXJ2+A2Gws3m5g?=
 =?us-ascii?Q?Q697SEvuJSI3Kr7AB3RbxxDW6KVI16P3ZaMWOsqUf+rpCA/l3C3JR+LoGfKu?=
 =?us-ascii?Q?lBc4hjLheF7usTJoQZddoTQ27rI4fMA9nQJKhZ5kL9hY4EjmA+JUct0AsNrW?=
 =?us-ascii?Q?wMgIyznXE++B34k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mSV5aeNU9o1dTi1Az8ceMsherEC3Cl27MDYQOy+QXwUPfkP2o4t7BKOEZC2H?=
 =?us-ascii?Q?tlB/hlg7JFy4PRCoEWSZYkPzVUtp/U2gxDcrinCa68GzIStr4Cm0W5ZFi6GB?=
 =?us-ascii?Q?H7iQrZOEIyif0Ey6+M7KvtwowdeVBxCNaL+oO3ALlgxQOSbC2C97nURdhizp?=
 =?us-ascii?Q?gJtmiTA0sJovUFs82xXQFsd59D4fbtJOpUjQsYT8DkRugtmklBMUQeIKCuQU?=
 =?us-ascii?Q?x3sdWi788vgmj9QduO+0KLW0BTSDJ6pGeH3GRhqvjK55zJcbysZaCY8+BODP?=
 =?us-ascii?Q?eb3GzrMMAvitSiIq7iGMMxHUQgqYiPikR/cpv0QN+3mSg3QC5VYUUSLzIqD2?=
 =?us-ascii?Q?PsB/cpP2fzNwenPI65Ei2T8wPTEUHUKwCAq0RG74mvOZdqUD2uMWSGka/oDH?=
 =?us-ascii?Q?sPH8zwUhKUsiayMFPMlIWs7mYBiafQimwCwf6HheHXBCwC5GYdx4as9TjkwX?=
 =?us-ascii?Q?79X0Fu4ISi8AhTZyJofOanD67QEiXLyMDtOJ5AqGczTNv6xOYkMn+1eS9dJ+?=
 =?us-ascii?Q?U0xfrSdMh4C/DYOYCSbRu2QXym35PRDhh6Fmr+UpCHI+yuaQtv9RONgij1xt?=
 =?us-ascii?Q?2vQ28WUhJxTRMd81qRRQKuK+iP8YE6Hr3AO7jeGfnbhlwpijtj/FLMC5Xajq?=
 =?us-ascii?Q?Uxki260QB6MubrAMvpq4emDQq+tMd77W5vh+lmVvevn0pzb9lUHK8LDGoQTC?=
 =?us-ascii?Q?jA0HHugKBpsbLbrYVyH5hqnVXq89Cl4/svElR6728OS87NuZ2K6pzZkj5kf5?=
 =?us-ascii?Q?b8i+z6g4G/3znXWpDzfwA9K55k16/dizfoACXkMwqwu7R0ErgOFB/6ge6YOV?=
 =?us-ascii?Q?jouFZza1KhMEXZTv6YIngaCtk0qDARrNrBGMDUSzxOTaFTQFGD3lc1T8KrCz?=
 =?us-ascii?Q?6bO5VjHEOCtUki56mUPJ8oKlKq8ZpoZeBS1DigeGZLMxTfVPbQBxqPHc1af6?=
 =?us-ascii?Q?wREUmi8xRNobfDfzoK5WWNvy37YRBmy+0xL3VKZEGmyRHupWdUFpMegkF9ob?=
 =?us-ascii?Q?LHWI+MQRSYnW9hsFgyPZu6Dnj3uMxeXp7Lx9o4bjs9QWGq2NWbv5eJjFHicb?=
 =?us-ascii?Q?V/oECCaWeh0pKOQk1WRUhuTdIUWBF8vueiGRQ8wNYVMIJUBIIn4WMICShfSE?=
 =?us-ascii?Q?bo6GI2k7zjEHP4dcYjJ5ZPIARYK0/FWVoDxBrANCQdqIjSAJCreXIpSKRllo?=
 =?us-ascii?Q?CQK/m0eTF6lk9zfDf7YaOZEqL63I0QwIKigQNvLi+sYQqWMjbPCThP7nEbS5?=
 =?us-ascii?Q?PgNyE6ME0idSCxVqBDU1D3pJy49a5ewKqs0X7uBzgEzesJPvWnFIUKpU2ugL?=
 =?us-ascii?Q?mMlI0U6Mep9E+JWNLOTjI41/OO2rbsvZnC+Wlk8igLGbVjMpSfM0IgUviIMY?=
 =?us-ascii?Q?aK5OLDoLnzzSliOcKYz5Eoi216tTazN1qcdFIn0khBphrhUxhWzDjNaXfBYk?=
 =?us-ascii?Q?3jpuGakA25Uj76tEZSzJo3n5bhC1bxfY1zaDsCUI3aykj9PuAwOMlKafKrxe?=
 =?us-ascii?Q?XltyH6zIM3l1T0pEhQfwbrK7xTfL3sh8vdLqbVGOSYEotXw6S086yVvgIluu?=
 =?us-ascii?Q?HyavFUAom/bF0Ug8P/I=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6caa6150-1205-49cf-6921-08ddaf918f3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 00:29:46.4714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /nRV4J80Ca8Li+QPqrt+Vk5oGaxfdUrI67uaZlkmIDRlaYnqWs9ClVU4IvNbHgiBwm0X6IHSqvmI5/FYTieTpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11008

> Subject: [PATCH v3] clk: imx: Fix an out-of-bounds access in
> dispmix_csr_clk_dev_data
>=20
> When num_parents is 4, __clk_register() occurs an out-of-bounds when
> accessing parent_names member. Use ARRAY_SIZE() instead of
> hardcode number here.
>=20
>  BUG: KASAN: global-out-of-bounds in __clk_register+0x1844/0x20d8
> Read of size 8 at addr ffff800086988e78 by task kworker/u24:3/59
>   Hardware name: NXP i.MX95 19X19 board (DT)
>   Workqueue: events_unbound deferred_probe_work_func
>   Call trace:
>     dump_backtrace+0x94/0xec
>     show_stack+0x18/0x24
>     dump_stack_lvl+0x8c/0xcc
>     print_report+0x398/0x5fc
>     kasan_report+0xd4/0x114
>     __asan_report_load8_noabort+0x20/0x2c
>     __clk_register+0x1844/0x20d8
>     clk_hw_register+0x44/0x110
>     __clk_hw_register_mux+0x284/0x3a8
>     imx95_bc_probe+0x4f4/0xa70
>=20
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
