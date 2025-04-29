Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F57920F066;
	Tue, 29 Apr 2025 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923857; cv=fail; b=FemmYFKtDX2aW5j9kQqjthFOZwZLZr4Ib8EzH20Miv/i4L8eYpEeXqsgptzXOHt3sHz7S3iXdCrdy6YVCMxtZfc0bHAaksk/OFAPFXpNTuMHfivBycyJlxgmoovfftn+zkwkzYorI7ouCGl1kmNEMf037xQxfUJw3bUETj8tKLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923857; c=relaxed/simple;
	bh=cCXuAQzyrYz4rF+QC9TBsnxbVmMJQnLqP2wUd2uLC7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I1HDAWM7BIZwrwT5yWvAkoKKKwtIxA8nvZcWbhnbPfei24SAPFfZZfAkghpo2ys0EtMezwzUTPgEVj57EGj2tAhxnb1Vnl3zqE1ip6a49gRT5KmNRKBngPdq951AQbk0Zrqj3GaMzQy7kASNnEChiBuIASk07h+I3PlywSEtnI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I7kvtF3N; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I7kvtF3N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bk0474HkfbbUBkGneJhVCi9xYVAVTnWRVcRUnXtam0Rg7Pb7eTnrb7AqctahD9ziur/qNJKgX2C2hfmSs2qWPAlTP+KZEksEjv4e5QuJmc6vrVrbD/EOtHZz6KY7B0LweKWYro5PD8msenNvTLIX+fR6Y9xADr8w/x/gzOz560Bm7yXLIPH7532Gkc0g9BRBLtn5v3Cful6NyDTPb8Y6xfMKpYCsheD5RiraHa0iiOxE6/0YxrIurSflffoANfdXy/sFcMYhmVvC6mHh6YvkEbmCnHhESLt3uGo5oQNyaz1HBYD98BapXVkx/CxUzLzVs2Ecp3c5NRLvKw02kLi1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DF3W+qkapMQ1iwBQega5osTas6/XFQnb3X/mzgFNg94=;
 b=jpBz6tR12y1rUP7Z58YEY7CciTwHDfAPf7N2i89RW7PtCW1XwRcfLfnr2sMIOhpIJCPXM2PbZDxeg4nSNoxjV+9k4vHpi9MATSmBdlwzi2dAkBD46J/iSjD2t56DmtKMKBrIXkX1B1HzXtXkbZ1geLDwRsufkEaGQ/2tdiIBvm/kBsXnJLUnqwcbztDwEAc3BHF/ssBwOpDsocAfqcI4Z1nt+B4dcLCozdBuLk3Kpo8cOEO8iafnLRZyTtouP/Z18q+qwgxlbL6D9dc/64iWPY8dkkkv9cQxtZAdzOxFq9Dc9HeXeFGsdRnFp88+e/UBMeIC/wdTIZfcqfBgd0sx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DF3W+qkapMQ1iwBQega5osTas6/XFQnb3X/mzgFNg94=;
 b=I7kvtF3NvUHsqZ07cnDOE7uH+RErABC4fHVtgLOJ+HXJvUq4LK6NYrvPotoUL5FqvBOb9Az13Cg6jyIkxF5F5hXvKIPxFNwFlIjEKtyw+FU/codO+9twjIT+jwr6SVC6SBGz7ulCdkJCte1RxS9yqqlB9E1XeUucsbSOCnO5Gzh6G2tzu34kGo+QkrU2VFyzKgeBk3nJv3hvyq17yoLGItpIhQ0f/XQNsLyqy7rhRfj9vegIZanv5xr/qftZwiHs1SldYJMB+AqGqljPnUFKZzXscGcAY1fingv7vP476ERp4azOvBMjZvVIXZaW3rKgqgCsd1ujvVj2ocx2bwMEow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7751.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 10:50:52 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 10:50:52 +0000
Date: Tue, 29 Apr 2025 19:59:52 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC
 DTSI
Message-ID: <20250429115952.GB28789@nxa18884-linux>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2P153CA0050.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::19)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b9ed5f-9b69-4f14-2924-08dd870bb5ba
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OGXyHYy8uu4A/WWzIsTK0+BYGQNjFHJCTE5yh7oQbWkigXVkyNV2VOjui6fx?=
 =?us-ascii?Q?gj1S3KH8rTpw/WvOTu01GZkOWhbGeH4Rbtz1xD4o/GOhOfgWA0NTJJlOnzm9?=
 =?us-ascii?Q?pMZWSdoY17cWz+/y5QgKEvEOlwN2jynclTmWfxuItQlDyoAtO8ICXShlm4vw?=
 =?us-ascii?Q?agOEnWJGdlMiYd7KhfS5E0HNLDOjp76xgF5dLfW85XCkm/iQquTx7KRegaze?=
 =?us-ascii?Q?RrRVOhMmwtLuGvdKqU+IDSzHk63FMZaZA6M8XFCcGxpgZJXAbo0SwvfmPIXN?=
 =?us-ascii?Q?MmlYHwbRvldGoOD0u9QD842LavxIfA30RnOntA/nKloyai3kMEQW1/Qg+0eR?=
 =?us-ascii?Q?cC743NPvSiE53kqxF4A2+0DhN/oVBBf483Xs38MwK9tH6ZbGsQWF4WOuBJEo?=
 =?us-ascii?Q?BiiOgjvwCzfxaGfZ3zDdFip9HLvib/8+weJsoyIXvj13B0ynJuIE02XHml1o?=
 =?us-ascii?Q?mKXhfil24dVT2UnPL5kXSJvHth3jI+NkVs21BCtwuFhXWGm8xc2LYydtI7ow?=
 =?us-ascii?Q?lA+coEqiK1GmA+eduemUe6el+4ShnYP9MoS1+mMufLozCu6F2aZGBRQ2QEmc?=
 =?us-ascii?Q?QIOWUscsNCd8EImxsv20zfPsu+VuxktPwVo0Hl5gzROF/Uqsvzpvn+VdFZRf?=
 =?us-ascii?Q?A8B2rCNBBfnlQP4qBnCxtxyrjLKVwz8utUAnH39nEPSZN7GYTfr2EiRrAM7U?=
 =?us-ascii?Q?TDWNmNa/+9Fot47NYRu1mjzeAnmSqEdPXTYsRNpql9BARS4DbxEjreFW6xh9?=
 =?us-ascii?Q?YWV73oOJbRahWk1+WHLkAeLWvM/x9spdBUu5Gd91tkqNBCfaMxNVuu4frp+G?=
 =?us-ascii?Q?34S0JLEvJl2bcQOMPH3InoTbFEmQmazvCMqpWuUnmLmFimmj6H9wdl1litQZ?=
 =?us-ascii?Q?srQWBY5r7RVq/NrIdXV6P0MyUp4BhbLjpagWRhKWw0d+OkO+CODnPNf6Als6?=
 =?us-ascii?Q?HOsIJ0Ag1RsMMw+8sjNubLU99naTGGe8+rNLMpZ+JzE7nYFG/CqFjq/K64WI?=
 =?us-ascii?Q?exjWE8i3f83mCO+bWZ2e4ipaDcTBx4MSMs0idizbyQP4rh/77FBlc+KVXEVn?=
 =?us-ascii?Q?//FnW7jRQ4QfKgY6/zJGqU6b7kW1LzhVVVcGHFdSEPHB2kJKiZQ1ZvrmWBeB?=
 =?us-ascii?Q?Vb+GFMZcS5zmTDCdnEvMZJH4k0lKnnZ05uBU4hk1Fuy1pQeFB1b/h7r5fzpY?=
 =?us-ascii?Q?zgmJkJI/s54Gpk7+pOgqjNL3FXNy5phYBOxF7vWzhXp1T5TXSrdBCXWfWnqf?=
 =?us-ascii?Q?PId5vkbuIxzl23ggsqZ3/o2ap1W2gpxqdQxfiyS+SIwpiTQgGg5JOVIMbUgv?=
 =?us-ascii?Q?BE52f2QfUkcvy7NsJjjwsNnhiY3ZTqWbo9sjXm/fvFLIcSaCbD0QqIxEwGPe?=
 =?us-ascii?Q?R9NwqI4jNEYECFszpvUX6KBPSmSGjSNsu8tmZV3hpilA/aTnufXScd6yIzfo?=
 =?us-ascii?Q?TVtj1/khQNDcuLCbznn1/NmJV9L9B6z+zpIQOKow4hky19UbqB/K890r5wOb?=
 =?us-ascii?Q?hRhWzq3PUqVBVQ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OiKgBgPvAIT8D8Njb2jqJWJayy9kXpjvh3n//CJN8+O1ohJG8KvxXhUbJEBY?=
 =?us-ascii?Q?RLoa1dGBDLWi+soebF9Q/GPCL3Xkkv5eRNDIQEOE12s6pjYF+v6fapg03+yF?=
 =?us-ascii?Q?qeZYszRj1cKiZ6Z8/BHsZrqiw+JM88YoSW26Zn2cFvT9Kr+FUni/P/3EOVqB?=
 =?us-ascii?Q?BHxwPPb/K/omzhj2bPmWr3lk5MOAexnp7degYfNUTC8cc8EYmyTx3OSslhri?=
 =?us-ascii?Q?gBPweiayHFPcMR0PggAI2uwGrZo4BH3HjpxeZGNswQdeayvDXx15CeyPW6jw?=
 =?us-ascii?Q?VquiFs/BUMcgJnUhs3eUuzxYyYg7iTHGD3w99mTantAJGp0hh/gsYH5Rm5ce?=
 =?us-ascii?Q?c/vQex1H+R1XjagmVIBT7yHagPUq2x8sWYB86pItcBrFficMiI6/Ypdi/1kN?=
 =?us-ascii?Q?VFFkj+Rs55fQDkLyDhjzBqxL4YuXDAI9njRAZCbLFr2M5jE0M8Q3Zdz0nSh5?=
 =?us-ascii?Q?e4CTEXRUV54C4f0KbW09qExKlgjXDKEv2w2k5syIFJAWx82orKlBBk+/Mv47?=
 =?us-ascii?Q?lfZfflO/p/c5nDb32v3ksYTiLIGVbH00eMsR6s6joUo9YceQzveGrFqXC3WV?=
 =?us-ascii?Q?mhICcUCQVxK+y9NH9ewJ9vck11hsrQHLQK/zwYX0kh178xFeAJNoI7dmsaiU?=
 =?us-ascii?Q?83wRmexB1qGGhJ63YgA4GOmpp8yIEaKK8HU8s76+Oan2nFkLKtIXJlSP8+Ne?=
 =?us-ascii?Q?NJzJWzkPxy8XlIZKVZtpDYXYmslnEygyyCQp1lmHqrVILMoeo1gtUKqZxAjD?=
 =?us-ascii?Q?gIiiCN9tc67/h9R0otLBMDHokxiQW8NpQWjzLk/xgC3o9CtENX/mIOAwcfMm?=
 =?us-ascii?Q?cibSY4gbthRWURUndCEkleK60jn2ENNwj3MJX/RHxyG7Ci9n6MwkX6SSEDt1?=
 =?us-ascii?Q?JlB6EQNuuehPUIS1aA3Iq82TB0HMyxmrAnyuRq1lkhDt+8XN6SNX73jO1kRu?=
 =?us-ascii?Q?2+WklIrsdOITKe6RKcctNOswujU6US5MF7co0QRriS6jUqDvIT4wCQTal95E?=
 =?us-ascii?Q?DuRUF4jwWob0MNFkATWe33tVVijsr5Qa7iYjis0QVHzCMWmvZ0e05u8idF7n?=
 =?us-ascii?Q?/Ngdj2TyXB9IaHvbpPmLGgW4DL0MriHNqwYkyPJKBWR1oQFwRb5eMIJlozQx?=
 =?us-ascii?Q?wiJBKi+BPmtQQkppcnAIulEYwjPfzd144AxJfrM3wpPngB4ZdnQ8pCaimFvl?=
 =?us-ascii?Q?unVacwJxLaiQofD6YhmuI49sNdta0GlYzvKq1eCRSY6gQocKc7L5YefV6va6?=
 =?us-ascii?Q?LEYsg8IVKenfNsjb6v0bDt8N/J4VkC4Gp56VB87GX3c56vn/ZyhuC6iWGaEI?=
 =?us-ascii?Q?S6iMYZCtbVaRaeo8vY3Mn1S5qYyGMKiIniRjTK9BSZ7CvgwOV42RJE6xksyV?=
 =?us-ascii?Q?0OalVMgq9Nha+0zp48aXEuratRh3c39ymlgJLuVFTWVR6iKgpnN9trWY5fPe?=
 =?us-ascii?Q?FcCfTJJVhdnHLBPlyq66DF52z37vbXczAwpgrYuILlFg43gtuB6Y1rXR+PYv?=
 =?us-ascii?Q?pDxwZqEJzsJ/d3hhQiQJaveFWo10K9WfTJVkPxjyyI7DgOlloG4now/0xedr?=
 =?us-ascii?Q?nwW5jW+XiyZSAy7HNnvj4f/dhqgyZ4rU2XahJXZn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b9ed5f-9b69-4f14-2924-08dd870bb5ba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 10:50:52.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LnR2lQICg9aIjBoOkZabLSej50s/Xz9jBPXWk7GEqmvNA5DwywO6PT4HbFM6jB2B7uter2l9tAPexvKUGzZZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7751

On Fri, Apr 25, 2025 at 09:48:23PM +0200, Krzysztof Kozlowski wrote:
>Not tested on hardware.
>
>Ethernet interface, like other exposed interfaces, aliases depend on
>actual board configuration, e.g. its labeling, thus aliases should be
>defined per each board or each SoM.
>
>Some boards (e.g. Gateworks) follow this convention but many do not.
>
>This is continuation of my comments from:
>https://lore.kernel.org/r/16a98816-f43c-4f4d-940e-9da30cb1f73f@kernel.org
>
>Best regards,
>Krzysztof
>
>---
>Krzysztof Kozlowski (6):
>      arm64: dts: imx8qxp: Move Ethernet aliases out of SoC DTSI
>      arm64: dts: imx8dxl: Move Ethernet aliases out of SoC DTSI
>      arm64: dts: imx8mm: Move Ethernet aliases out of SoC DTSI
>      arm64: dts: imx8mn: Move Ethernet aliases out of SoC DTSI
>      arm64: dts: imx8mq: Move Ethernet aliases out of SoC DTSI
>      arm64: dts: imx8qm: Add Ethernet aliases
>

For the patchset:

Reviewed-by: Peng Fan <peng.fan@nxp.com>
