Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011003.outbound.protection.outlook.com [52.101.70.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA5022ACD1;
	Wed,  5 Feb 2025 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749070; cv=fail; b=rNZ/hI2fxdepoE+Tz93FC5jzIaQKaxdzjdyh+EhAknd8fS6N5jY1+J37Tyciqd+hTjVZVPZYkKuK2RwLX+/Cj6aY9U7LbFrpZonNuc/ewU4L7mX0BUd1bywm8YV1eOTLNlINPG3X4n16XcruvfhSwGoK5DnXObTPOm4z8A5ukhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749070; c=relaxed/simple;
	bh=3Ha5WUrHqYvgERvRmJ2K+sNZLE5D5WTGEpbSyGXSSXY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SKRXesMyPBl2qoZZcr0j0ONtgOJ5/h7LtEqazuVxwNEARqHjtR9fYjOiEZRj9tMtNeHBM8I+xlRjoFTyIkTm2/9x7us2kZiIj4NQdRUHXC5j6hrdXglRljWHknthJo9ZpYvtkUFIRhOs+wT8cQW64IfvNohJ3/NljfGaqR5uq+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ixnZ8c8n; arc=fail smtp.client-ip=52.101.70.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ixnZ8c8n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mz9MdULP84EmHwaMJnTFfAdHXzJikGl0iO8GJJ2RVy7dwoKOrIhcWpdPeZ84uJDnfChz9Y45b3xm6oVwKIJJYeYP/NdfUp9ZPz1ooagQq1U5ztmK2Ckw05BBd7U3Jjzv9jclLhPZ5SICingpsf9QfD5gmwZtlG1IdbVlU0CE3VRAG8bpwXv+H2aXaijWMYpQFprgdX0hJ4p9gnZub/Ngxc7PYJ8a6lIrEgdrbsf460VdxXMOTr3C3Kblzbkj1oUZ9uQmWnQnPiT5XN8OBow4/8dJJ9u6bSbRsEX1ETbMOOkP3eMzhrK88FseB4SqhiKHtrvnmoEw8HLOvtwmjxGV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuO9we0+22ZHGv9exjceCoS+0fKOhyayQhSWy+90s9s=;
 b=h6G7vH4dfTzekbZJVDW1d0afSTM51J4/1cuB/8m1ass9avFyvYxgJAPfMQFXJIn28RBTnvoPUcBfMQxJC4Mqr4g/sfxqZR7C9HwOYvI5bT8CyRY8bAPLIVNl6X264MR1mOMdUSKOtqPizWIPrphVgPH1qvms4NGGhCEOZwAOeR70rRximpssBXa142iAD98sW7rAkwEgkD6/umVZZiWZm1U2C8kp0c2/Z2xoLeuZWfG1DK9M3J4D6XUZQyLqN23aBGuS32eR1x07EMdj+spRF59ibRk+dX7ZoFJ/Rf56TIv+fBvbfS+MvZgWLGh659ih7xlznivUaKlCLVA7eToo5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuO9we0+22ZHGv9exjceCoS+0fKOhyayQhSWy+90s9s=;
 b=ixnZ8c8nJU+u5STbOYJpaScoi6eeRyUgkbnUiH2f8iVvR6LPQP/dmHJ3jIlYv6JlXkIKwvgpqodRt2+hsxi//0rcm0zwaBDM5oanBdvcmL136FKJBwtNVnhHB90GRRfG/Xpet8qK74pWEjU67xYNx+2teeauzxoKGo+MzJRDTKy2YWzBRhHq6LAWUCPf5pRKdCIWjTFnnihd2nFBDhuzP0p2jz73MttH6m5vdB5zaXMnV9QV9mdSf6VPZtDfHAcAS8t/5PhnHVokWYSGP3kbk2hc+0uTiAXr8W84BDtD/sCHhh/HZpe0StXa3HEIZWOTuF42uirQSek9PkZTdup5tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7783.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 09:50:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 09:50:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 17:49:52 +0800
Subject: [PATCH v2 2/4] clk: conf: Support assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-clk-ssc-v2-2-fa73083caa92@nxp.com>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
In-Reply-To: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738749007; l=2974;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=uyR6TUrIVOws23hW9VEyZgxU8YuEl7WFQo0HvLWbyc4=;
 b=ebQ0jEbKo5D7iWUb3MyG5+W2cVbDnOEijoMz0TP1SKmacytUoZBo0QxxEmQ4waH5ib3/g5OGY
 oIfx8lApQDLAw744xT0eusE3G7R2FQMwBJvg1+z3cyuDAr6/9skcDR6
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 46efdc5a-3bbc-460a-8941-08dd45ca975c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGgrWWFLWHpNeGlORXF3NXhXSE5pbk9hb0NkSEUySkFvczNycTZPbC93ejVh?=
 =?utf-8?B?UTlBZVNUdU5jRDR3RkNuVm1ZcStiN0JLamZZV2xBMk41bE1KYXB6dnQzbzVw?=
 =?utf-8?B?N0NRNytSS1dqbkowL0xKbWtoMHFGajRUNE8wZkFyVXlHYTFXQlpYMzVCK2ZB?=
 =?utf-8?B?UXZXSlE4MlFyYzJYWitYSVFmMXQ1R1BHRmoxZ1BVM2c5K0tJb3FwZGkyTlF4?=
 =?utf-8?B?L3N2aWh5cDB5SG9NTTlLK1VLVTNiK3FoNGRVclAyM1RWaStiWHRvU1ExcW5i?=
 =?utf-8?B?RGxLZWpiTmRBbkE1a2hYRkMzOVFxYkNRa2xrTU1xM0toSm0zUzJxWFMyMkNT?=
 =?utf-8?B?blhiREFHWHIrenMvelNkeEloMzRraW5OV2lVcm9JejhoVUFCbWpvNE8rbWhH?=
 =?utf-8?B?NE4yQ25id2c0NTVmQ1pQZnp2bUE1S3NSbWdYSHZrdUkzQWpmWmttRGtXajFr?=
 =?utf-8?B?ME1oeEVhN201NENzTXpCZS9MUmdSdzRIaFBVOGdBY1pzMHpxTVVrSE51NTNy?=
 =?utf-8?B?UnJXaHVSUWNsak1XdWtQN2FISWpLNUlLengzZ1VnSWxFZGNVbkRBZDh2bUZQ?=
 =?utf-8?B?T0drNm43Vi91K0FBcDExOTNDTW82TERndUdhMFJHMWxVUm1PRGhZNTdxZW1w?=
 =?utf-8?B?Lzd0ZFZvK01JYU9VN1Q0TGN0YURhSGpXSDd6ZjVvVDFwWE9BSENRNmtUbzB4?=
 =?utf-8?B?cmRqZmQ1QlJMN3REYlJFQTFYS2M3eWZMM1ZnUDVPN29jSWRFaVdNL0tBU01p?=
 =?utf-8?B?N2J2cUo4UFdOUGxuMGZuVmRCaklBcWl6eVU1bkc0ZGtiWnZOeFE1bk8zS3NJ?=
 =?utf-8?B?WHYybndPdHdtWUJFSlVjVmJwM3dubXFibkR2Q0xYc0k4WUJwZFJIYjNWb295?=
 =?utf-8?B?WktRNE1ZMlQyM0pNSzdyc0RUZ2U3c2E2dEN3ZjhobXFKdVdIeWgvczkzT2VL?=
 =?utf-8?B?bUVJT2xLTlFURTNBdFpEdTVWTXRZTkNMOURJMWIyL3V1ZkJxZ01oR000R2cz?=
 =?utf-8?B?c3Z2NUpYMks3ZGtLN0toM2JrSktFNXB6SGRPZ2JLVXFKbVg4bXpmaTRMM0U2?=
 =?utf-8?B?V0QwY0w4aHd3RmdPNk8wMlh0MVEzTStFM2w2YnVKcGJHVWR6enpEWXhuMEUx?=
 =?utf-8?B?SmZyY1MwMUl2Q3dRVjBpemZQUVNrZElwZEFtdEFyYmlZc1VVL2YrUU0xaHZJ?=
 =?utf-8?B?K0RIdUhvdmdpSXd6clF5MlFsa1YxazdrWUVGRXdhMG9MWWFuckJiSlNvOEY0?=
 =?utf-8?B?cXgyU1dQQ1ZmcnlaU0xMenlLMjBZbW9lNHFpdk5RVEZwcTVMUzE1U0tqSis3?=
 =?utf-8?B?bE1qUjVFTGoyM3pTdXNDaGFwL0dBdDc4MVY2bDFxaXNTOVN1VWYrUGQvcmNL?=
 =?utf-8?B?VmlRRFVQSlNrNzUzOGJXK1V3S3dxYXFIMFROUmxNREdXcWl5MDh0UGNmaHA2?=
 =?utf-8?B?VFpDdmdNYlFjaW5WdGdiWlJkS1JWS2MyaE9wY01tb1g0dEQxbUxrcmVuSG9X?=
 =?utf-8?B?bnIxT0w0ZlZXOTNqejNNRHE1cWFoMHdMckNsK0tKL2tVa3VQS2k5YUdFQ20y?=
 =?utf-8?B?SG5zSk1udENZb0JNQjdZSURVVUNnSlkreFFBYmdqc1lDSXF5bE4zbXRaTjJv?=
 =?utf-8?B?VHpmTFZKZStWSjZ4ditvMnRwNzB4b2s3Q1d4RzlVN2E4L3k1bVkwcFZjWk9n?=
 =?utf-8?B?NmwvcTh3aTNVck9mTGFYR1VUMFZXVjhkT041anFEM3EzRHJHYUhPSm8vYkQy?=
 =?utf-8?B?Y2VFSUlNU3Y1K0d4RTBRYW9QRGcvYS9ERGZnYyt1endKbDluM3VBa1RvRUJ3?=
 =?utf-8?B?QTB5R2Z2TmJpNWhGcExNVXF1VEVIUTF2OUtBQXpHTlFEQStwOEhZbXhJUVRR?=
 =?utf-8?B?RTE5a3lJNlVrMGZCSStrdXBMamtKR0dySTJNYjJIZ1RGamowRmtCTjdaVmJq?=
 =?utf-8?Q?Lzyh3MAQ6N4YgH893wbnfXX4vcpg//fb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlpsNUt4SGN4MWlqVkExRi81bzl1Z0tOQjllNWpNUC84ZGpqK2EwYXZWMll6?=
 =?utf-8?B?MHVxc1hjRVJndzNkdWlSSkhTRXVrM01sTUlrc3JNVUNmc285bDd5Z01aZ3Mx?=
 =?utf-8?B?cU9BWVZtV3kxSC82WU9MYVp4RDUvdG5LZ3lWQlF0NEpxdW41b2QwcnpvR0Fm?=
 =?utf-8?B?Y2VJM1FsN0dmN3p4UXdKRWlUY1ZVREljRzJCeXZ4dXZOOENMMmVxZ2pqQWF5?=
 =?utf-8?B?LzVqRlRiVCtXTmlyQytpaEczSGw2RWJoVDFid2pRTEhkYmdtNzdhcUhicVVU?=
 =?utf-8?B?R2Y4WUwrQzJ2ZExITHhLcFRiQ3lZUm9MaktOQkxiaXlSNjZYSDNUU3Zhbjd4?=
 =?utf-8?B?L0U0SUNNcnpWcGtWMTVOdkNTa0o5RFdBbGg5TVFMQWVuSHZSc1dtMlRDa0tZ?=
 =?utf-8?B?UkxxTkZnZm42bitWVVRocm9OdjBNQUNBdGJ6bjlBWFdheG8za0UxemRYTUFz?=
 =?utf-8?B?a2R0SEZDR2hzdmFIN2NCWUM0ZVFRcmkzcFBNdW8yc3I0ZDNxWm02L294QndZ?=
 =?utf-8?B?bUhJckdvT2ZzWmYvNEFHeS9kNmhZMTZxVVZ3Z25iQmVuczdtR3l1dEVUaFgx?=
 =?utf-8?B?aTNmYm5PZkhnNXh1cHlhRk8yM1ZwZk8yLzNuSXFLQk5Ub3RPaWJxOG5YRXAv?=
 =?utf-8?B?K3VVRTVPY1pYTmd2NkRIL093T1p2ODRzWE5ad0hxa1d4ditLSDdqd1hRRVdT?=
 =?utf-8?B?cjAwOVZDZ3p4RTR2UVUrUi81SUpoR3pmTDdaKzdndyt5L0FiYnVYL1ZxeFZR?=
 =?utf-8?B?U2kxb3o0L2hoRlVjVDhxUWYrM29CTldwOGdlejN5b1RJcnFiM0NyMXZpNnJ6?=
 =?utf-8?B?ZStEMEFTdTE3YittdW9HclNlMWdDSUVBb2F2WkFxdWhNdmdFTVJOUnZlb2lx?=
 =?utf-8?B?R0pEV0Z0VlVDVzNmTFg4aXVBWTY2TzFHRTdsTjNyWXpFK09TZis0bkV5cGZY?=
 =?utf-8?B?VENhQStoN1FDMld4YUt1NkxFeE9lY3NBTWc2Q25haVBwUVRXUW5HN0FxMGxv?=
 =?utf-8?B?V1M2aGp2V2Zaa1JZN3NMWG9Mb3gxVXJYOUlncFBIVUdlVFY5UUlhTzNJeWtL?=
 =?utf-8?B?ZldJVXNxQm1ZbFlRbVhtc21WVURVa1haN3owb1BiSTVjQXd0bzJ5VXo1bS9X?=
 =?utf-8?B?Mk8rbEtNSVdyRHlWUllEUWNEUEgySERrdEhTSzMrNFZZMTM1MC9RRjQxM05a?=
 =?utf-8?B?bFpFbUY5L0E2elZTVnpkTjRLczl3N0RwbFpHNWxVMGJ5Wm1OMkQrMjgyN3BK?=
 =?utf-8?B?NjNwdUlLZDM0V2JOTGlCdS9Rb0x3RldCbnRIRlhVdEEzdVFRYUhJeVlJUlpP?=
 =?utf-8?B?UVU2dWV4dVNvaXdvdkJJaDR5RVVSMVd2YnI5djZmeUUrUXphTXAwMkMyNE1q?=
 =?utf-8?B?bnlaMzBYaTFNVExuU2s1SzYvTWxqREV2NVpuQVVmZE8xS1o5a3Z4UkxFeTBH?=
 =?utf-8?B?UlZLWHNnWTZ2SVhXYUdkYWlHUUNLU0FEaURWVWo3TWVwTDZRd0FPZFFETnNj?=
 =?utf-8?B?QzRESGZ0ZkhzRTV0TnRBNTUydjd3dVFiYWJBTGlVUWJHTGliTm5CNWFLdHVM?=
 =?utf-8?B?VEZBYWJsMXJIK3JPdmVXMy8wSnRaak0xdmd1bzZqZmo2L3ptaWhubTZvM2Vp?=
 =?utf-8?B?UVBFdVorbTJhdnV6N0xoQldyYU5yZnFqWTFRdUZQT0dBdzZ6NDZ5ZFNUSUZl?=
 =?utf-8?B?M1o2SlVOTU5mL25RSXRmb0FIZGd0TTNYZ2VRakRQUmtzb2t4clhFNzlVRmpE?=
 =?utf-8?B?Z0l0Nko5WnkzWElSYzRldE1EQzV5NU9rUHpCcUlMcXI4dmtoWjJURGgvV0ZW?=
 =?utf-8?B?Wlh1VHlBWGd5TFlVdSt5R2QvNWJGMGltY1czTGZodFN2QUY4M2g3VnYvUERj?=
 =?utf-8?B?NUxvNTRJMFhmcTQwQXpQUUhNTTQ3bkVwcHYzMUVPc1RMYStTUUZKRXhRTW1N?=
 =?utf-8?B?STBmU3BQdE1FdXk4YWtLNE5NSFpjMkk2ekMvenpES1Z5c2FRdHlIaTJweWJK?=
 =?utf-8?B?YnRtbXhkZ3pSZSs0Wm5WVWtHZVRQY1o0MFk5bWxkRi9OY3hsSUZqL09EN0ZK?=
 =?utf-8?B?bE9GK3k4TUJuM21DUUJuMG9EeU5XSFJYYUYvdjBDNWd4a0w3bkpxVUE5cTQw?=
 =?utf-8?Q?BfY23n9c7shnaOxx2a575K0hp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46efdc5a-3bbc-460a-8941-08dd45ca975c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 09:50:58.3038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io+7gP/2CbHbE0mQuj9IAFvkuFaxq7r5rc2ij40yrAo7/tgzTFDcKovVext+nPZtZhFJYPMNsFJIOi3cMOs/fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7783

From: Peng Fan <peng.fan@nxp.com>

Parse the Spread Spectrum Configuration(SSC) from device tree and configure
them before using the clock.

Each SSC is three u32 elements which means '<modfreq spreaddepth
modmethod>', so assigned-clock-sscs is an array of multiple three u32
elements.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-conf.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 303a0bb26e54a95655ce094a35b989c97ebc6fd8..9046a7710236839a30a72dc15c5fcebdbed5e9c6 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -155,6 +155,72 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 	return 0;
 }
 
+static int __set_clk_spread_spectrum(struct device_node *node, bool clk_supplier)
+{
+	u32 *sscs __free(kfree) = NULL;
+	u32 elem_size = sizeof(u32) * 3;
+	struct of_phandle_args clkspec;
+	int rc, count, index;
+	struct clk *clk;
+
+	/* modfreq, spreadPercent, modmethod */
+	count = of_property_count_elems_of_size(node, "assigned-clock-sscs", elem_size);
+	if (count > 0) {
+		sscs = kcalloc(count, elem_size, GFP_KERNEL);
+		if (!sscs)
+			return -ENOMEM;
+		rc = of_property_read_u32_array(node,
+						"assigned-clock-sscs",
+						sscs, count * 3);
+	} else {
+		return 0;
+	}
+
+	if (rc)
+		return rc;
+
+	for (index = 0; index < count; index++) {
+		u32 modfreq = sscs[index * 3], spreaddepth = sscs[index * 3 + 1];
+		u32 method = sscs[index * 3 + 2];
+		struct clk_hw *hw;
+
+		if (modfreq || spreaddepth || method) {
+			rc = of_parse_phandle_with_args(node, "assigned-clocks",
+					"#clock-cells",	index, &clkspec);
+			if (rc < 0) {
+				/* skip empty (null) phandles */
+				if (rc == -ENOENT)
+					continue;
+				else
+					return rc;
+			}
+
+			if (clkspec.np == node && !clk_supplier) {
+				of_node_put(clkspec.np);
+				return 0;
+			}
+
+			clk = of_clk_get_from_provider(&clkspec);
+			of_node_put(clkspec.np);
+			if (IS_ERR(clk)) {
+				if (PTR_ERR(clk) != -EPROBE_DEFER)
+					pr_warn("clk: couldn't get clock %d for %pOF\n",
+						index, node);
+				return PTR_ERR(clk);
+			}
+
+			hw = __clk_get_hw(clk);
+			rc = clk_hw_set_spread_spectrum(hw, modfreq, spreaddepth, method, true);
+			if (rc < 0)
+				pr_err("clk: couldn't set %s clk spread spectrum %u %u %u: %d\n",
+				       __clk_get_name(clk), modfreq, spreaddepth, method, rc);
+			clk_put(clk);
+		}
+	}
+
+	return 0;
+}
+
 /**
  * of_clk_set_defaults() - parse and set assigned clocks configuration
  * @node: device node to apply clock settings for
@@ -174,6 +240,10 @@ int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
 	if (!node)
 		return 0;
 
+	rc = __set_clk_spread_spectrum(node, clk_supplier);
+	if (rc < 0)
+		return rc;
+
 	rc = __set_clk_parents(node, clk_supplier);
 	if (rc < 0)
 		return rc;

-- 
2.37.1

