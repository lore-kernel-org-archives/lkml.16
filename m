Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F6F170826;
	Tue, 24 Jun 2025 20:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750796255; cv=fail; b=HVRg5vHcI9B3ift1bwQrj4NnD/LIlNQPgzeB2yutEeaqw0og/beu20NcKyNf15RdYTIOahvGiKO3B2beEJhu9HbJgdnabhBDuBTMMEM6iq450cgzIb7Nyh812DGhycRKONwjWGLfE96x0yUGNmskkKUZukXoIoM1C9KvWBXJHcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750796255; c=relaxed/simple;
	bh=bu0Q1pVFDgigun5Q1R+Ja6oBtEMBhz5nSYcRNz4Z24E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OqVJix5Dvfn5gF8azLK+KPZKLVJqyJi9/KXDyE/kQeDyt192Ww4FJFF8JvP3ZUd8yyxst/yPv0hdaYy6ouWns0xMYHjy8/sGVpwtUHWJTedQRw0g34uEKM93Yj6suMNAuBc42R+TJpiqEJoY+3FXrl49qyGJ0wGGsZrV7ICSNJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mlwbfz9S; arc=fail smtp.client-ip=40.107.236.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mlwbfz9S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnGAlSZFS+c6KPet1Kwbn37PCKa3Kzg7mAyAfObeBg2ea6BJ9lCtb4n0lUukFV1oOL5qBwpr/V4unq2dlLL+IOwo8ePQqDJ3C0YMbwgvtIOHsx82UcNfEM/fLJeOuh4HXuWfBv2CundEBuTSSQ12Z9wvwZ5jHi0QQP79gvWdOYbCnZnjJ0rdVAHoEOo3jX+inqBxo+O3lf+hwfI9+9kTPfjoKBjl3UFoZToAlOBn/ChmWFNcjZrW7TwzrvM1oHvnC7QGcFIVGVd50Gu4bWkJwCAvKWZNU33zcWbU2gdlzkjF8D2n+0WRDLlWuvY+YT/Md3NybDh4FQgxica+BYVGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BFcrk1UvVhZTwKMUpudlRbHN4sQp2V19RmW3156uZo=;
 b=ALR49cHZbVoCbn4M+jxsfvOOKOTn8ZUEjHDuzDwx7KjwoElQ7y/TN/b0jrwHJviN040bR+MBR2haYC7jVmUEFzhx6W5NV7dAmOZVvAhVXmryHUKu/h3+8Fd+nwhqkEsNTWYwogrskILts8jLCs0bneZ+8IEj5/5L/H3hqoCDJpJWV/roGHffikd/igImKE8csJA8b7BILfm6/ORrfABEWbziQUh7szav4w3vZlCtoR5gKWqwNvbPlj26Izq5iwgk9VBlS9Zv0TKgmtXe0QOi5boIXRqx80Q3YZcDACi14d1QbS1N4FYhf5A/tfy55lfoRKqvu2OJ79Z+mpMA+OlIlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BFcrk1UvVhZTwKMUpudlRbHN4sQp2V19RmW3156uZo=;
 b=mlwbfz9SG1bt00pmVjUPJc1YpevivXCRbeYUPlBpCbemVqD5uZORt9X9JtUKpUIQlqMY3Jchx4EaFMwwkUzp97IkKd8RC0fYKZW/NkQxxXj5xDFVS/otiYo6NT+5vwzpEAXDsRr9/9J/m0TtHU2X70m8x2hJUbFljwrnbTjKaOSzzJAOw3DacXufv32dOk9eFxQcLhGu8hHIsrq4RD2UCpFGp1elyCMmAUnXe4e2Nkluz+6QLYCKaTRVV+r8q4r5HElpq+BtE132xkZ76cbsWPvfVuZUfMUCzXWLU5DMiF4dMtJ5npPNcNb+BDkCD1aB2XMUyyiApzLLVMtg9fITgQ==
Received: from PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8)
 by SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 20:17:30 +0000
Received: from PH7PR12MB5902.namprd12.prod.outlook.com
 ([fe80::f62:33c5:301d:edf0]) by PH7PR12MB5902.namprd12.prod.outlook.com
 ([fe80::f62:33c5:301d:edf0%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 20:17:29 +0000
From: David Thompson <davthompson@nvidia.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>, "hansg@kernel.org"
	<hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, Michael Shych <michaelsh@nvidia.com>, Vadim
 Pasternak <vadimp@nvidia.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] platform/mellanox: Fix spelling and comment clarity
 in Mellanox drivers
Thread-Topic: [PATCH 1/2] platform/mellanox: Fix spelling and comment clarity
 in Mellanox drivers
Thread-Index: AQHb40d3Nfsh6ivHF0KKoBiZY6HQybQSw0yQ
Date: Tue, 24 Jun 2025 20:17:29 +0000
Message-ID:
 <PH7PR12MB5902F9E48E175025FAAC465EC778A@PH7PR12MB5902.namprd12.prod.outlook.com>
References: <20250622072921.4111552-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250622072921.4111552-1-alok.a.tiwari@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5902:EE_|SJ2PR12MB7917:EE_
x-ms-office365-filtering-correlation-id: c5ae0859-67e1-48eb-2a33-08ddb35c250b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?See7cBMfbyiQU++F74A9mnq35izulKIkrcwHJFKuSuhOqYM0RSQHZ7TIZiUH?=
 =?us-ascii?Q?l/Gn5Q1qL1ITffexAKoS8tnoApBOIyBGRGYl9hdUL9l28mbevkTC8IZ3vnUH?=
 =?us-ascii?Q?v7sj6xEFq6DCt6vQciLnoZpKyDqZjzhcDQBv7WgGzQb+CVqVhaxrrEE0H0Lh?=
 =?us-ascii?Q?VIVsRAgOxWBMnLEULsJgqk1GgW+BrJDbjqAn/B0Ur4dqfs3ekPdwsaBC68YS?=
 =?us-ascii?Q?IxCwh8fkep66LUOJB/CB3chNx/ziZJ60tdhI7nyBs6zRdESk+fDb7PiAxi6c?=
 =?us-ascii?Q?F05O0BbwR4Ls0f+vEszv4uqtB6bfkY2C3tROufIflLSYM+EOgVIaME1MZuO3?=
 =?us-ascii?Q?kTks3+seLSPHrDEYyONO9ohNxrowAP+EUd7d8dLoj7f2rIIB3JqJHJcO+EPL?=
 =?us-ascii?Q?sDO4VBYDcTnJLFQtw4AMlfuuNsLufoUHKqUweif7a1+vhzFQs/WwgeSs8jGY?=
 =?us-ascii?Q?HyepZXxKLE1T0GTKK52GSERUG8lAiXSSUfOFbpiV3nVv+jMmcI/T25xZAE8a?=
 =?us-ascii?Q?EMO/EyOawJFBVXQPq+49ev+S/94hMZeZsftJUF07/iVc4iYi+0aJeR9osvPk?=
 =?us-ascii?Q?Gg1AMACLc7HuvG45JTDOdUQiJi2Sv3MS8STJvHmiEWsp6lV4fGANBAIbVM8g?=
 =?us-ascii?Q?rIvHSdPfgrkOjURM2C3CwU4s8+7x0WEkbKhC2eDH+BsItj9+Upf0qwcQodt/?=
 =?us-ascii?Q?rD+7vGklnazGahumB8FLhwLzrZo+/pljJ3sKKvRB94VkNLr4ZPy+f9gtB7Ib?=
 =?us-ascii?Q?faHvQGOUssBGNf60nxKzfOffIRZLJuL5Pjbpkv/sI8LeTxkY+rF0qJ1J2FQ4?=
 =?us-ascii?Q?N/PsHuck11aYEW2DxAe0xxL4d31nBORrpA/xppZf7vYmi3OaNuWhJwcwpl3o?=
 =?us-ascii?Q?BQSJBMgAlDAdbpUNvbnII2c9Xqeu3GFSQpPqAiogQ4YpepOvW5bSipScauvA?=
 =?us-ascii?Q?9rIvqoKNF82TDR9u3jB6HOU8CByQgJyyk2vZ6y6+dHxfHJIfy7xmquy3rrW5?=
 =?us-ascii?Q?kdct8zw6+kCZYQqWn1TdvOJhO0wxx6b83Rzi0wMUDX89PF4yt1R9dSzq6e5q?=
 =?us-ascii?Q?GxH1T77ECVhsYYWNK1ojfBO5D1jewbVXJHSxbizpFY8sP3/rqKksWGqzF7+M?=
 =?us-ascii?Q?TdDFWighMK5IDxM8jcI3YV2k7qm4+vnHd5yToCSyZuusndCGOk/nsz0+jZFl?=
 =?us-ascii?Q?J+8lTUkERn0Nfzi6oKgCUVfeeuOSGMWLN8qV5pJM8AqmLT6ODy33u4gtUZIq?=
 =?us-ascii?Q?vkLzYR32vkHDCWxDR+LYyQSQC+nJaarvXbPTD3/jMKD2tEyoJYBErvt/b1rG?=
 =?us-ascii?Q?Xy8sHN7i9amsrCHj3RwRFj7gaUCPN9Na1sGJgf2ax63TPv/QCOQk14gBrhla?=
 =?us-ascii?Q?X2iv81bny9isWSn1NPkqLo8fKoztItvQpcqfzYwEQwR8/5ePe/RqjeABtk1E?=
 =?us-ascii?Q?CnSd9UJ4lHJHfIz5AFw6neJVcM+eLNrba9c8gRVtca1V5+/fDnFZW0nXeJE9?=
 =?us-ascii?Q?BUIPOze0i5C7J6o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6TsmKBULRuCXGdSDHtLHLp8NTeAwBD9yNq8G7YtrqaeMOFoe647KTeMRxWI1?=
 =?us-ascii?Q?Sko8WdY/q9zbxQ7CIJQH4v0W53TvlPcOOS8qrbJ7jo2Kc+Ql3WFr5LKZvxRY?=
 =?us-ascii?Q?mdj0sa7++33d3YTcaUGH8NnnILwt2Mwz6hsPz256RMe9BhSlh9SwOcEGGiVl?=
 =?us-ascii?Q?Wf34g9JE+x/mI8nEiNAeDSOh3CFJgs42g7y5Bmcml3nWcudmhwkp9BZScup3?=
 =?us-ascii?Q?k0XB9BL46ZkorI1NhngfeksbYkjI5TDQIoZNRQRty9Vtdt6mCIBRV8XyRHS0?=
 =?us-ascii?Q?AVCBAS3GEAVEq51SrpRBYrtjzi3edUViF7sgJZwCBpad96fdqI3KAvMxJzgg?=
 =?us-ascii?Q?FBtSIa3EmGJh8WlTIQ5vLJPOYtP9VLrzlYIfQgPDa0rUVbIVQHDupz65q1CL?=
 =?us-ascii?Q?MxjPq1jwDWQ9m4NStuvZzya9vBEuxXNKFOWJcy/Eok7iaJSJm/FfmK9edaCb?=
 =?us-ascii?Q?AWbMZm3L2nbwt0qJ/6n7Gr9Snjiv7ARacWpM7CEmylfeVR+x+hAQfbcV0nDq?=
 =?us-ascii?Q?VMglJfAAszr14hv6Uq8ca4e6MqUAyP+M5B7tkgROfpxwM+QjXc7YZDP6miba?=
 =?us-ascii?Q?stdqcNILhoscNzKjlW9OKpY8hCc+nT0mUcCsyagbbaZ6RtDxJKwZHpSREz/e?=
 =?us-ascii?Q?+1ak3/fHkDiTwyVNeIQW5fbEFevfqM23nnkEpgwZxxY3IuJefolO67O5ICS1?=
 =?us-ascii?Q?wlX1VPRemTkIkAHI8EvCIDfX2cCh/2zAuSRQwTevI8AUG/ffCaqtSa+o41Gv?=
 =?us-ascii?Q?YWvO0IJvQZTZBsfE2VvUY/iia5Xi0Zj/ff0mAO+BJaYCvNzAhEIj5KPLV4lH?=
 =?us-ascii?Q?uliEgvIk1oJvWNdXAdtx4pYMUE7MY9gIEPzsokNHwvUdtXB8vg0hW8zyxZQE?=
 =?us-ascii?Q?5WW69cAPlg3X7TB9cxnnnwfXAlUPOY5T5pYWFJUV2q2KLD7bgqZHjXb4sqzX?=
 =?us-ascii?Q?DeS9KsfgTMW1BwOuWA2xURO5P0Svr5bF7rRKUUL//Ji00RYPl5t9rn+zxgp8?=
 =?us-ascii?Q?xTceQBZF+yKJqdcrw4ReBLJoruJCtug7DCyBt2U54Wv9opW4PhsrjYIPH04c?=
 =?us-ascii?Q?5GWXvWp4Tz0dhrb1HNpLO/rSgQjUWYlKeX815/ChirXMMjta6tm6JKVZ+DnX?=
 =?us-ascii?Q?3oCHYPkPUkQGLYzW2Qe+QVMk7m2uYAB+MZPOK+H1LvFdotaIwcdLVUssIdvG?=
 =?us-ascii?Q?FAYWuCshdg6HHypecxd/HZDAZKbMOswrhGINEzK6ohZeLPCCLPD2MCeLoJzL?=
 =?us-ascii?Q?Xp9NzUDt3lI/9dGL0rK+NR2YkifVCzEdE2WRn1Hxw8XqRa9bXN6P3xMgq/7p?=
 =?us-ascii?Q?VqYuDm4N6CqjsxipNb9J+ml9JZ1UDElBzOPz1kqO2CqxQWJF5ywlmBd/Pk7L?=
 =?us-ascii?Q?adsxmNJkAxBvWJqh6KFXV6TNFAXmQr97NH6atdEVPffg92R0HCkobCEcaaYG?=
 =?us-ascii?Q?gW65RmeFOYpowdTEDEKQuOKjrXjrDlkspHx5x8ZzXNmDX0enBOM4hS8GvblD?=
 =?us-ascii?Q?5FHtta8GTgHW9YXbiHPiQDZNB1Ub3t3RgMjWdeugW7Mq7zhCySgkg13CVb2E?=
 =?us-ascii?Q?w33M74VT9NGJSF3frf1puFxMZig/QCmCBJb3pk7A?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ae0859-67e1-48eb-2a33-08ddb35c250b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 20:17:29.5986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yr2ZLOqgR3VTNoHp/6KyXmAOSg0xke1Q2WqdfLhLBVQ5Ft2rIU0nkJcT4KaBVk4sGVlbpRkQVL/eB1qkhyHf1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917

> -----Original Message-----
> From: Alok Tiwari <alok.a.tiwari@oracle.com>
> Sent: Sunday, June 22, 2025 3:29 AM
> To: hansg@kernel.org; ilpo.jarvinen@linux.intel.com; David Thompson
> <davthompson@nvidia.com>; Michael Shych <michaelsh@nvidia.com>; Vadim
> Pasternak <vadimp@nvidia.com>; platform-driver-x86@vger.kernel.org
> Cc: alok.a.tiwari@oracle.com; linux-kernel@vger.kernel.org
> Subject: [PATCH 1/2] platform/mellanox: Fix spelling and comment clarity =
in
> Mellanox drivers
>=20
> This commit corrects several minor typographical errors in comments and e=
rror
> messages across multiple Mellanox platform driver.
> Fixed spelling of "thresholds", "region", "platform", "default", and remo=
ved
> redundant spaces in comment strings and error logs.
>=20
> These changes are cosmetic and do not affect runtime behavior.
>=20
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c |  2 +-
>  drivers/platform/mellanox/mlxreg-dpu.c   |  2 +-
>  drivers/platform/mellanox/mlxreg-lc.c    | 10 +++++-----
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c
> b/drivers/platform/mellanox/mlxbf-tmfifo.c
> index aae99adb29eb0..6264379d96907 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -1287,7 +1287,7 @@ static void mlxbf_tmfifo_get_cfg_mac(u8 *mac)
>  		ether_addr_copy(mac, mlxbf_tmfifo_net_default_mac);  }
>=20
> -/* Set TmFifo thresolds which is used to trigger interrupts. */
> +/* Set TmFifo thresholds which is used to trigger interrupts. */
>  static void mlxbf_tmfifo_set_threshold(struct mlxbf_tmfifo *fifo)  {
>  	u64 ctl;
> diff --git a/drivers/platform/mellanox/mlxreg-dpu.c
> b/drivers/platform/mellanox/mlxreg-dpu.c
> index 52260106a9f16..39f89c47144a2 100644
> --- a/drivers/platform/mellanox/mlxreg-dpu.c
> +++ b/drivers/platform/mellanox/mlxreg-dpu.c
> @@ -483,7 +483,7 @@ static int mlxreg_dpu_config_init(struct mlxreg_dpu
> *mlxreg_dpu, void *regmap,
>  							  mlxreg_dpu->io_data,
>  							  sizeof(*mlxreg_dpu-
> >io_data));
>  		if (IS_ERR(mlxreg_dpu->io_regs)) {
> -			dev_err(dev, "Failed to create regio for client %s at bus
> %d at addr 0x%02x\n",
> +			dev_err(dev, "Failed to create region for client %s at bus
> %d at
> +addr 0x%02x\n",
>  				data->hpdev.brdinfo->type, data->hpdev.nr,
>  				data->hpdev.brdinfo->addr);
>  			return PTR_ERR(mlxreg_dpu->io_regs); diff --git
> a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxre=
g-
> lc.c
> index aee395bb48ae4..8eef3d990d1ae 100644
> --- a/drivers/platform/mellanox/mlxreg-lc.c
> +++ b/drivers/platform/mellanox/mlxreg-lc.c
> @@ -57,9 +57,9 @@ enum mlxreg_lc_state {
>   * @dev: platform device;
>   * @lock: line card lock;
>   * @par_regmap: parent device regmap handle;
> - * @data: pltaform core data;
> + * @data: platform core data;
>   * @io_data: register access platform data;
> - * @led_data: LED platform data ;
> + * @led_data: LED platform data;
>   * @mux_data: MUX platform data;
>   * @led: LED device;
>   * @io_regs: register access device;
> @@ -171,7 +171,7 @@ static int mlxreg_lc_chan[] =3D {
>  	0x4e, 0x4f
>  };
>=20
> -/* Defaul mux configuration. */
> +/* Default mux configuration. */
>  static struct mlxcpld_mux_plat_data mlxreg_lc_mux_data[] =3D {
>  	{
>  		.chan_ids =3D mlxreg_lc_chan,
> @@ -181,7 +181,7 @@ static struct mlxcpld_mux_plat_data
> mlxreg_lc_mux_data[] =3D {
>  	},
>  };
>=20
> -/* Defaul mux board info. */
> +/* Default mux board info. */
>  static struct i2c_board_info mlxreg_lc_mux_brdinfo =3D {
>  	I2C_BOARD_INFO("i2c-mux-mlxcpld", 0x32),  }; @@ -758,7 +758,7 @@
> mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
>  		platform_device_register_resndata(dev, "mlxreg-io", data-
> >hpdev.nr, NULL, 0,
>  						  mlxreg_lc->io_data,
> sizeof(*mlxreg_lc->io_data));
>  		if (IS_ERR(mlxreg_lc->io_regs)) {
> -			dev_err(dev, "Failed to create regio for client %s at bus
> %d at addr 0x%02x\n",
> +			dev_err(dev, "Failed to create region for client %s at bus
> %d at
> +addr 0x%02x\n",
>  				data->hpdev.brdinfo->type, data->hpdev.nr,
>  				data->hpdev.brdinfo->addr);
>  			err =3D PTR_ERR(mlxreg_lc->io_regs);
> --
> 2.46.0

Reviewed-by: David Thompson <davthompson@nvidia.com>
