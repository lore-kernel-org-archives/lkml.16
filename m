Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F279EEAA
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233880; cv=fail; b=AKjLDeWHLEY/4RNdflO6SeT7f6j7Z8WOOpw4+/ogb23Iw6+V5xqGi91GtYzwP6chtldyXZshX5G5x6EraPacUKL4IwWtSZ5HUG4E/w9mYKWeItIo5HFqIgrW26Yh/r6WqLpktCF0tmpKy06bb/WMI7resQb23QgHWlg0X2Bi5qY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233880; c=relaxed/simple;
	bh=8BPivORXUu2hNhiNuaKbc0I+z3Jf8aGqWC650NO99t8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rwoZp6jxyA8tHZgqGkPfpVXb/d52P6L3M20bNVYSTHk5Hkw8Gz5xbeu2WE2Saqlt2Fx/WhX+omVdc9GYecu/sszXnWl+9PF6v8jPkWRoaFQzhLjQPu/mEiYKt+A7nAFeSFXYaU38odZl9kdctoCmhkS51GkZl6a4WzzgQEu1sCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dLgWzlI4; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dLgWzlI4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZNx9ngIEWXNOGYfWZBJQR/r915IsU7x2vtFpYjp1CkwmZdieNmhRB0F9a4kK+P6GbeVznwmmRfvqQ2tzTh4863gkBfl2ohRZzZCLG1iV5sTDYSJe28cSPMrZgrtDgK0oREZgygCOzx8x+HAY5drZd6J/nPDZNovDyUahysDMBHixDmEHWVvyM4+wu9pJBKLS0AQjSBNAIlrziQ5jBuueVmx4wka/v/yIr4uMHvufsyeaMr0bz8N2oP7+8j5oApa2/sLYhD43JEbkCpG5zfwlyfHr0efLbtv64zaqaEnuy7+3U0TyvuKWut9Qs101kPBjJQtvpDvw/Gpbd5JFebqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BPivORXUu2hNhiNuaKbc0I+z3Jf8aGqWC650NO99t8=;
 b=sTlb1zivsXoFTNKre+cF00ZX/ALclBlnihERx9CK35n08+yYiaWHvUS4Ugv8MQLF6DjwJNCpvss/BwEijoRfdf5tdgsJa8q9P/9qE+cISz5UU8t1Ilon3CAHQdgTFzotOUphD8V3rdWK4dVCx65EEOVxgLNh9dbqSE1XVS1AzLkCaRwaLomjSIjyGGNs0klLwxujsdIYGEUM4h7HC/Z6RYIxpXPiSyKtVjB4ncp7fbBooC413Z6lJ9b3ZInKXe+AsIbGn/QiTRLrkSLQdTiKI09Z/jd7KIcKI8tseuikHbLHmS/yPrrN30qoKQ3d9RUV49rQLS+K37BnIhu2vnoBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BPivORXUu2hNhiNuaKbc0I+z3Jf8aGqWC650NO99t8=;
 b=dLgWzlI4Eisp8wctrCyN441YJ5J0UiTUQq6PbOspMzJPULwFLr+c6LnerEoRshh5xMnLQ6GgfqZUBfnnViVjFyAsVp/9c30Up/LlKqYfNKzdqSe9U/KtcpzigvzYH7IMYUrAvDYvN/xpzDHazDwav2j9IBLBeoC/1Yo17FKKCoM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS0PR01MB6145.jpnprd01.prod.outlook.com (2603:1096:604:b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.30; Sat, 29 Mar
 2025 07:37:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8534.043; Sat, 29 Mar 2025
 07:37:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>, Mark Brown
	<broonie@kernel.org>
CC: kernel test robot <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to
 `rdev_get_drvdata'
Thread-Topic: drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to
 `rdev_get_drvdata'
Thread-Index: AQHboCqIh2PpJ3xvmE+hCIj3H/jjabOJpxvwgAAN0QCAAABNYIAAAqQAgAACDqA=
Date: Sat, 29 Mar 2025 07:37:55 +0000
Message-ID:
 <TY3PR01MB11346540D1D1A2FD128A5EBDF86A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <202503290554.zASQT70Q-lkp@intel.com>
 <TY3PR01MB11346FEE53574DBF768BA9B8686A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z-eeiMFsQQNMt2nn@shikoro>
 <TY3PR01MB11346D7FE2EC7FA3631C48A0C86A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z-ehAHFRK_WaGVJp@shikoro>
In-Reply-To: <Z-ehAHFRK_WaGVJp@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS0PR01MB6145:EE_
x-ms-office365-filtering-correlation-id: 991c0f42-59a7-45b3-a8a2-08dd6e949ebd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EwfTBrupXEYKbvHWnkFYg47ItN08LjjP+2VAnVV5v1UfcE/X0VYvLIXFPRa2?=
 =?us-ascii?Q?6VZ3usZsE+LUyZx9TG3prr1xz7YFo0I7q6YcGmAYuE7AerP7uS5yM7EkMQOm?=
 =?us-ascii?Q?r5vAZJrsnkv8j+avm5k75/NVgZtsHcXve6+tSv4sJFkR9q0nj59ApGzhHde6?=
 =?us-ascii?Q?bEX+YAPnB/0Ljix9PD1GFO08GgS9tcEHQqjQz6luyLG3qzSoW2rYwErID/Ta?=
 =?us-ascii?Q?C6xsAEVeidWBazMkldFkJvypq0DkFwSp9NITUraAH3eHkmEnwHSStwNDucLR?=
 =?us-ascii?Q?vPmspp0UE23w6N5wLoTNWmP/gvA25E38gD2rk0JKFYg6skmFF5DQVJNlaT3K?=
 =?us-ascii?Q?5h2HSIRaIMxu4SmgoZaIW4uI11jMcTZZPwVUNMIT/1MPaujifZOg6L0gAPzv?=
 =?us-ascii?Q?37Dx19QWkyJFfkPMsStwlBcicHJEW51jtRf7zXy1iHEzvhs9UBGCURF8Ch1F?=
 =?us-ascii?Q?+pTT2CUc3lLT5TnskLJuSkQ+OhhN9OkDszw1UDh9A5BGiNPlb327udy32ISA?=
 =?us-ascii?Q?W30X0FwPcWtrLXhntSQb4+Vj2ABTO9uuwQnuLhG6UgbA5SxammpDqSjk+V58?=
 =?us-ascii?Q?PzyPHt8HvVsWQ60LiydU9fxMqvCWepDqkZ+zZDaj8WRUsdvThqnVhRKbUqls?=
 =?us-ascii?Q?0SmgyvtAT6VfcXZJHDO4aBuzLyGWkJsMWF5zZlcxlCI8e0HpIXQSjwdvVO2G?=
 =?us-ascii?Q?UVcV0mQ4EyR/6bUSXvszjKvuZDQ4H7hdLC3DtuLRvhd1x22AtVmBa64gGtfC?=
 =?us-ascii?Q?jLZOHNaCmXLsaQTIVBKHTfvRZstV/TA8B+D0BgkCikLeSY0Ss/c0YsF0miby?=
 =?us-ascii?Q?LHWXAL0KXhG4jJeb+zFxIvsE4VvGwr9sY8BSWX4IA5nsVpwEE/7ted5aeOuM?=
 =?us-ascii?Q?yZ0SNkEq0re0nRqBdYa8c2G7avZEujHTFAs9mTWRW3J/g2tdXreJKQn19Eb5?=
 =?us-ascii?Q?VL136hCntPnaO9YRXWa6zrnRzqJ6aRhntmIsRY8eSsQs4dY3dpKDamTGXdrY?=
 =?us-ascii?Q?V7auQxeCf2a6eom0I7wQxrxYfhY9QpC2HNuPP6wH72POgD15Ai5RkMOWwUnD?=
 =?us-ascii?Q?qpyWhoMEfgGKmSBuNmAXrmMLzGwOnzp2oftiCFUUg6Nt4JCqLdDF2xKtxLIH?=
 =?us-ascii?Q?tE9Mi9gW0y+Hs70fdt3P82JRzu+sdF+Egfp6i1Ehm19uznUmAuF2gAHiniaR?=
 =?us-ascii?Q?gNp+4JHetZTLtHPwez/+xVn15TuU8/kCqiH1tJnTmy4g4mgPJg165ruTJQdt?=
 =?us-ascii?Q?gen0y4ANKemfeO3XbsqnDRuAijtDbXBaTlXahDP7N9J/YIXPajnRRneCRUhT?=
 =?us-ascii?Q?r9EShE886Dj3Y5UflgI0AoZzZ3koBLvVkqUz50fTvCaGgYz0ZUZoiuPhmtAj?=
 =?us-ascii?Q?W8HG+RzMt0RKndyeUH1QydTzCSIoxhgSXDNBp7Oi1fxVwAAiMzgruQ+Dxi6c?=
 =?us-ascii?Q?TaEY4r5ErPR1AoQ20TSRcD+edm0BoEvR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OSnZY7RqXCmtmWoU5Aof3csDJm0TrH9+g2Nq8SwcBpZLUJrDuC1hz1F6JwWh?=
 =?us-ascii?Q?WuWJWRdO19TVGYSUed6Bbik/9ewEr08FWBB+kk1ES3OW2Yuwpn/y99YLX2kw?=
 =?us-ascii?Q?w4qf+5FKvtno/VXK7DA8H2leoETK14bT6EgyPTb8UQfv9L6NtfX4IzqPykT5?=
 =?us-ascii?Q?AayGf9mGPjV628yuxMWoSPpQvMEI2hImPxOJxn62njO9ivHx1NmY2fK/bWR/?=
 =?us-ascii?Q?pXDE9kTEzql5aJBGgRzPaHDWGHrLqqvU6yyRP+zuGvOMHe6BZh5YgqClAMWI?=
 =?us-ascii?Q?rDhR6eg/sMOrUsYXDN2JBcuIqK02m+kP/i7nldnEYYAcJUaiLRg2UA+VTvmR?=
 =?us-ascii?Q?IRg5ZWQJwjoCXW2byfHaJQaux2oAoJi9iHmGgH+k00QsWPzpQ+jfyFf6V/Ki?=
 =?us-ascii?Q?wFHUY1KbANy4VY9Au2S1n6muMgP7XH+rpqO4HBtILBPTJndIZpngXmd0aUW2?=
 =?us-ascii?Q?Y3VAd8hbz4RDkS/gFDDre51wQeZ4xC15rPglRtngv+Ghs4taENYNVFi9/Yns?=
 =?us-ascii?Q?w5onm/lYFAHnbU7IaBosoRgHb3m0i1INPSrGFIp8saENU2D4ltdAIXfw0Z7w?=
 =?us-ascii?Q?vDkgp+5VODXGbXx32SeHZpHELXvGwmt+L4xoIcXad5YUzH2y6SwSe6Q8FnUr?=
 =?us-ascii?Q?6kv1Wl4DmiVzZh5AzUhEWuC1YgluYSiD8BP77lbRYpXd5M6tBJM3FQ0u2df4?=
 =?us-ascii?Q?+glpHhIEefna5dlzsXgnn9emnUHVIVi+LBSXfBfZZBTyh8tXoEq3LkXurKPJ?=
 =?us-ascii?Q?c3CUPXIT8MxbWcE/ciLolvgkJp2PbT9qNY0CbeGcBda/VzOWyHgYdjIYLTbQ?=
 =?us-ascii?Q?hc1E6eh5WGE5NZ9GiNUuKfCDQk/I6Bhk81ID5XNzSvVYm2ktKU/0uO/7Qm2S?=
 =?us-ascii?Q?aS3evXatXC0TIANt5LcoL+8/uJsg4rC/8RxDP/a/rzN3DkkD9rL4pbLHT5tM?=
 =?us-ascii?Q?8VhGyQaBVQsrDqnHust6+UOAvuTaW9IMrYLy9ifiJZMBT1cA7YRDuY8KFvmv?=
 =?us-ascii?Q?NUJDzRtFwIQV8CERWLgFP0t0kdfrc6kpy9gynyqoNUd/94Lqz34dhW15L9GK?=
 =?us-ascii?Q?av9rYy8ryv92F2xwcuaJ9mT3QakX7pCH/RZ2UPURU1sdzyXSmGt/60IBnvtG?=
 =?us-ascii?Q?t+f5ZRQA7RsQv+UmEOiBvyigwKGqosvvg8hFqhmzSa7gR1twtSy6W4WKMQ3R?=
 =?us-ascii?Q?5b5O1NgAmO32qQ55tL83g6QV3wenx8AjGfm5oR3qV0Bnp5XnWQzWzYcH69Ko?=
 =?us-ascii?Q?/fp8a0mwXWB3wH6UPowQXatM8/d5MSWYUlp3tDQoyIJaYmNI706LERohhddl?=
 =?us-ascii?Q?MQOMpHkBWT4h6+22C8258wVXJJjGfQkm4Fnn/dHoQhBf3KwNTZWtRenVH+v9?=
 =?us-ascii?Q?B5dMme+k8b0uCiJJLVc6X+8PQYOkqZ+jdoDr0ZnRKsGMiE1G6WOubF5fu5rH?=
 =?us-ascii?Q?6auwaq3Q77L//hEe/R2mI1fEDN0dekWddFR3ttiv6BwZlMAlFeTsn7nm7VTe?=
 =?us-ascii?Q?g2PhFA0NWb8vLrM8hoCmHObVZnARk+FAGZr1MRNOk7+EmST9ht/zyqKcBArw?=
 =?us-ascii?Q?J5A9bQIIThb5/nNThTtSn1B7e0iVeIqqO1Ez8CzLPnsZaRlEVTPs7N19baVk?=
 =?us-ascii?Q?yA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991c0f42-59a7-45b3-a8a2-08dd6e949ebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2025 07:37:55.3591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Fz50GpIGXEQzX/lfaVhKFf+5LuGz3FIuirud3+Gqik+VroNdmVLq6n5PEdO6HSpFvCnCq216VBlfF2UkO2gLPyRt9/pff1RDJ+HxctYWvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6145

Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa-dev@sang-engineering.com>
> Sent: 29 March 2025 07:28
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: kernel test robot <lkp@intel.com>; oe-kbuild-all@lists.linux.dev; lin=
ux-kernel@vger.kernel.org;
> Ulf Hansson <ulf.hansson@linaro.org>
> Subject: Re: drivers/mmc/host/renesas_sdhi_core.c:951: undefined referenc=
e to `rdev_get_drvdata'
>=20
>=20
> > The changes were done in SDHI core (renesas_sdhi_core.c).
> >
> > Like this, if a random config in that architecture has
> > CONFIG_REGULATOR undefined will lead to the same error.
>=20
> True :( Not happy, but I don't want to over-complicate things. Most syste=
ms will have regulators
> enabled anyhow...

CLK address this issue by adding inline function for such systems where COM=
MON_CLK is undefined
Not sure about Regulator should do same for sytems that have Regulator unde=
fined?

Cheers,
Biju

