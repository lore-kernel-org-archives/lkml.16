Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7C4275B09;
	Tue,  1 Jul 2025 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377637; cv=fail; b=exktPjk1nSKTSdfkSPujlHt7rAISOotBDdZtf3MrBvuNLmH8TMQKzhYomzjs+x1x/5Q89xEeh6oSaNWlXPPVcdQYHvI04KUo80Di3xYmBxM+ykwTsdmn8FxEidWSs6GMa7hNA5FJiJcWAOAzGPyj2nOsqE2X8j+FQNoCHaje9GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377637; c=relaxed/simple;
	bh=JR6JALF3oe1g6eKh5rQdoUmyelR5Kxv3lh2y1I6u9I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eH3qqiIg4Ef1Nvoxn0k7IrZXzn28UDybALxblSGJnx/wUNvMbjtWA354znqvW9K75OHQw17JNtKmrIhsJ/4PlCJ1amibOCFtNxT7umMyEZGlP5a3hX3UZI/cNxhQ+DJV+lSNA50TeOKMbmVLCPXitYZsZ1ASMtDjFIGUgAhTW9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rbuFfDQD reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rbuFfDQD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6SCidNtayM+Zqvs8hUlTWn+vIotnnh9A4Yp3623nTSzdTwvLgmFmivpOUdbNPSd4cV9QNZ64BWXJjDXyS93h0LDyE6w3qLuHT7zRIlmjv+EZ25Z5JVj8hT6NpgMAProLAPVSLq9O5L0A45vI7HTgsU5ZUSn0ggxz31BftGGabQoI22uGle1MTgBBErIEPeXka7VcZu3LlLOJmgBU4OLPlBDsIIENyFwO+zujgzXrykMzvlxhptxdD0GJPUlbPL24fxG1N0o2iy4A8EANBnkNWb9jPX0Hq9D0QVX2j9SHuB2EEbph5tyzadsulGrn1HcIs4dXMqWTA304ibdrvYzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUtI8zDveKvhZSupfi00DhGKnrtbsjl7nLEFDX6PDVI=;
 b=apMQ6Eb4wxpdPK4D22F2ezlu3lz3abjmZx4Ik4Ssoo9syjo55l7HmpC8HhET+kPoBHRSjswwhJ+9yeed5RYrueChQpsYDNT9gr7GuntxSI71UNNKDHckFgRM2e+OcTEC3d0kuFLnze4mCkxwFGeJTa3gN2BBrzyr2gjyVhDlG1jkK3sFIrwEPMQwhz8zCPWwPkPPLgdoA/9Uzb0kzN5k0j1S6r0MrpkZwT3u4klsDltUSF1/6mpLOky1l3JIhUDgcntgKcWgpfrR0wMz4JoQqQxExUMPTzlGYgfjm8u94onbrkrFVz5HOO0muyIlB35XsqcSKmYm1z7RSLOnt0s49A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUtI8zDveKvhZSupfi00DhGKnrtbsjl7nLEFDX6PDVI=;
 b=rbuFfDQDIAR/HUZIrbVZ+FREp5SW15gvKcrR3w+hoohY8zDICLOYbz7xUlhiwoUJl7N9OCSndc/cfWOKB0mC10U93N+qV59+kmMJ1mP/eyZyNsq7ZmRuYn0TQjyU/IP0ceYgT9QjwMJvb6dcDEmk/iuX6hSqc5NKkq9lPdP/430ub5EqceTsfoF8KOp5Jc4noF9r5PF7n6YwQaXREpCASi6hc1b7OEGdb4AT858TMkCWdq4z9SRg1K26hwnXVaQ7BvOXe8q6PeOHN5UEUKgeHsHjChfZahQRI+wCkVbmIgbHI/vdIQjJYJEMR6bMC9Qz76UmRUwBJyyFyPM2l1/AyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10904.eurprd04.prod.outlook.com (2603:10a6:800:269::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Tue, 1 Jul
 2025 13:47:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 13:47:10 +0000
Date: Tue, 1 Jul 2025 22:57:43 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 4/5] clk: imx95-blk-ctl: Add clock for i.MX94
 LVDS/Display CSR
Message-ID: <20250701145743.GC20538@nxa18884-linux>
References: <20250701-imx95-blk-ctl-7-1-v1-0-00db23bd8876@nxp.com>
 <20250701-imx95-blk-ctl-7-1-v1-4-00db23bd8876@nxp.com>
 <4665053.LvFx2qVVIh@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4665053.LvFx2qVVIh@steina-w>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10904:EE_
X-MS-Office365-Filtering-Correlation-Id: 43aa96e5-7120-416b-18eb-08ddb8a5c714
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ahhNwem3+XOfcYiWJXFVOq+0gbqFA3Dkxj0YlKfPjzd9Hn7EucA+HXy4uw?=
 =?iso-8859-1?Q?JhiNOUp0SZWrt4Dn9UrZ3NTXwxtNbDw0ElLOJd8u61Va3U1RcDwSmejEta?=
 =?iso-8859-1?Q?jrAczVWCUU1/+9+Mc0ou7m1G/q6w/glnCtQtBdWWL2a4o6KCuYHF+ZEb5l?=
 =?iso-8859-1?Q?86keEgldQygFM5iqdvs7boDovHwYEhHuUxiIIge7z9DPMO81IBumonKu7J?=
 =?iso-8859-1?Q?HODQMdRqW+2ef6V/QD8lJyY3iz8mXbV3S6dXmXZmNPk/7kF0ivXFt4FQlo?=
 =?iso-8859-1?Q?MkAllGoHibd00oS4s3FUR7T26mSRXhANKgvM/+bqiyTmIR/GmNgY6Bb6zO?=
 =?iso-8859-1?Q?AOLiN3vah9Nxw3vSMd3VXS0EDdkMwiPYnzBrQwgTDFn2yY/omK1WeGfzFh?=
 =?iso-8859-1?Q?jgh8hKPQQOE0s+EAWGASTadQesezY6wEXS/oA5lfg6EP2DM+jwUpp8IUO3?=
 =?iso-8859-1?Q?WRzB9dvGGmxucHk3rdZQsMtEkciHj1Jz7vS6b8JZnr4q8/6Nz3hW/RjMPP?=
 =?iso-8859-1?Q?7vjVXcdXyMpFdEC/nilCZfSzxTEg6g4qit0Koypaw1PnwK3QxU/VLmP5DZ?=
 =?iso-8859-1?Q?DVjXAWuXcawIQmP0g2upMCGdcvlX6mtDoR2Oj+QkGIoMtTiPpaMoR65Prm?=
 =?iso-8859-1?Q?OE6zKcIqgur94b1cKzqaVIA4DyYxUCGDgC07zzrfOFjROjdkirNoGR+NLq?=
 =?iso-8859-1?Q?ukuR8vlPrFuC0m/10SI5q8XBWmSmYMdDJfX5Nm9nHXMqI8Fgr2GDphfIN7?=
 =?iso-8859-1?Q?zR/jVjA8r6kYNCaMq0/nF9gs5Cp2Rwq1iL86rCWQjnhqUlUQhx1IE3Cfhf?=
 =?iso-8859-1?Q?WGH6jBjd7dQsPdgV36AAh0U87nxbL7XoWGW+U44CaRGZtja/F+fsRaXJmv?=
 =?iso-8859-1?Q?xFcKlEd20O0PWFHby2TOYI+6MtfVEIaxaDRYJRjSysreXPCw0OlGNlP54Q?=
 =?iso-8859-1?Q?GoNqn6P2WGgNLLChF2wiRUSmHrnBQ9oxdiXPP1bqEu9OBM8FPomyRLoMMc?=
 =?iso-8859-1?Q?SfQpvTNHV992JN6od5FuAZTfzm7YlgK2f7wPII5WmH8Wf4RDpbAdofWlyx?=
 =?iso-8859-1?Q?qscU0jSS2RGvz9pdk8A0VhNudJyctcsPnRoDDzjgj2UFioIs17frITKqd/?=
 =?iso-8859-1?Q?RTvaoJX29DIZYdrqbq+zvIEO/zRMaFour2T7YJbtGaTT+EIk4ILxHzhTjp?=
 =?iso-8859-1?Q?wEiXXRDql7LhEAtVjMp7PE6S207d9I9rU+oG5cS65ubtGfIsax1QVpZpAE?=
 =?iso-8859-1?Q?J2l95+1eBDcoiMQNejKUvYf7ebuDp778eTZOvuGwKCxnMiB3BWgx3uW1px?=
 =?iso-8859-1?Q?Cny3QcvkcyRDsBiteR5EYRcJjVJV1TgcWWHP3Wni1VaokS9GM+wo/+zkh+?=
 =?iso-8859-1?Q?vrq5IUQZDVa2SIH8bDOYocrJmZyfwMq4XIVa8PqlfRf00Ho7Ib0I6fMkfB?=
 =?iso-8859-1?Q?MFo4QdEEq/2vDa4oE2JZ5eR4nTVopSfAhar8ZmgoIutzY50YnulJaSyV8a?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ay574Hz02hj8Sc3446lDSljNFqpRjNVdKgD95HtTGwVLD/RzTolJX57FoS?=
 =?iso-8859-1?Q?PXahQhkF9wLklShHVYeIu8N+PSayey8Uh5dEoEmDpZXLoDVK+XyWldjXc0?=
 =?iso-8859-1?Q?FSwQSoJ+dUcXPToDBV/xBdnY96fxE7Tx4LjBFSKnSfKovgy1kLzVhQyp/f?=
 =?iso-8859-1?Q?qzPL4Cy1Wk6Fh5JjFMBwrz5Z5p5aJZQ4AE1MkRJMqITCJuhvjpGLQKEk96?=
 =?iso-8859-1?Q?nNUChlxlr2bUZ/XLJCxTgFHyQTLQXOlkbOD/SfxQm2fsLDuASZE5PU7zsX?=
 =?iso-8859-1?Q?+dilGgbX+OqetFAGDMa+L4yuhyuiBbHkQXUS5idS9hIHw6GLZEZm7km1gM?=
 =?iso-8859-1?Q?vI2s3Kzg8FtpYRKS/jqmhGErlXs3fkzY7L7ZpwFgquOv01yLpXL/1M8uzG?=
 =?iso-8859-1?Q?KQCTYEzRaRQbOC7thHSVzE5ER6vcPIsq+A3ar2dRurRQ7Wa9DJ7jN9FsKB?=
 =?iso-8859-1?Q?7t6EBo7r75OKY4PPGayyNFINafSUgQxHWzbW02tUu6i3Ob9Bny0tSgOEgw?=
 =?iso-8859-1?Q?ndgUUqZiwCHFLLd3QgDVuwwI1bzAa3iowwBOXC/VdDd6MGEagblEdbuao8?=
 =?iso-8859-1?Q?X+TGZb7BPkizvnbOlntx2RT80MZcIyje7OYyJFVVhmqiGXUb8LuqhAPu/X?=
 =?iso-8859-1?Q?JoRpUyYBOCN6efVeitK5ItFoSM7iG0Tk7Feq9KulU/g+DM3tpLDJVe2wNh?=
 =?iso-8859-1?Q?Gy6+eem8XYjtQkmLJRTgTULmhRez4WZ97uqIWMZPBsgkmBFrxfREf7LPz3?=
 =?iso-8859-1?Q?y1I0FksTG84YGpq/kFt5MGADMFYssRYlPrKmSX7dNQ977hLUn7mIyo4xqr?=
 =?iso-8859-1?Q?cYfiTCaxmtt7lFTfLjiVQAFFrw8pUeyx0KYEX/HTZZl580uY1XmI7pJGPi?=
 =?iso-8859-1?Q?sLfB+ikprst73SgExajmZPuhLSDyFjKK2KPgaKGzumI/V2EvfWeIjwO2Nt?=
 =?iso-8859-1?Q?uqkteOrXO74STvpnNia9OyHTB1uT7iIGnKjrQf3K9oBoPZD/J+h7Moomir?=
 =?iso-8859-1?Q?/9wzEhM6NfhptpsIqwMVMzbqFU04ZcaNiGkYJCaCiNna3WAmLl8FRswB3d?=
 =?iso-8859-1?Q?bXbyjgtQTuDj1gdtiy/+2ZCC0TrLwBBwpbNQmbzbO2zsa67w64426X5JpH?=
 =?iso-8859-1?Q?B/ZvJivHf79X3xHlkmdEwsG8w0JLdg/kZectCasodjnPRepil0oO9Mnj2e?=
 =?iso-8859-1?Q?BSxYpMyxf9eWKZcit+MGQl52E4fiPCJQ235RuPo1/nWLEd3NFg+vRkzMqh?=
 =?iso-8859-1?Q?JxjEUAHhhW0p9JpvSit2loiCdEj7xGVqMmblEyK93yHfc5Ga8t+22RLzlE?=
 =?iso-8859-1?Q?lDIDG78OaBCWgmjJfItYOYBAuDRvSA4MPd0rYLY7UNTu4IhhhZhHiTvb0x?=
 =?iso-8859-1?Q?VGO65Jz3snA/I93vibS0fkW3MlKMoRPUIB1HtVRQqBtwuI85gOap0PhYrP?=
 =?iso-8859-1?Q?5Mz+hRKKNv+qwUzAMf4cjFKfKbJxoOZ4d8hE8JNf9faLarB0iSPIfirT03?=
 =?iso-8859-1?Q?wbG2lSgZhrRRfMCtZop9qjjFPANQRGWFddSOYn7JWK8q7qShSsV991p6zf?=
 =?iso-8859-1?Q?3sKJ3ozu8a47lYkbxMgK2cZeGm16PK8/Wm6sXT06EGPfy8rBExdwUKyJIl?=
 =?iso-8859-1?Q?Opm6U/KgZnY1+94DwpSyvFezLWV3Rf5YtM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43aa96e5-7120-416b-18eb-08ddb8a5c714
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 13:47:10.7147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ho8HT23vLPP7KthB1E7WKTy054/J5Ok/WDpoAvlA7IUiiuTBac//C9VbMrtB0ZsWkcklSzqZD/QTr1tLR8GDKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10904

On Tue, Jul 01, 2025 at 11:29:34AM +0200, Alexander Stein wrote:
>Hi,
>
>thanks for the patch.
>
>Am Dienstag, 1. Juli 2025, 09:04:40 CEST schrieb Peng Fan:
>> i.MX94 BLK CTL LVDS CSR's LVDS_PHY_CLOCK_CONTRL register controls the clock
>> gating logic of LVDS units. Display CSR's DISPLAY_ENGINES_CLOCK_CONTROL
>> register controls the selection of the clock feeding the display engine.
>> 
>> Add clock gate support for the two CSRs.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/clk/imx/clk-imx95-blk-ctl.c | 50 ++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 49 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
>> index 828ee0a81ff62c6e4f61eef350b9073f19f5351f..5fe582b0d4a9a197f2c1a49dc18f15ca83ccb4a4 100644
>> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
>> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
>> @@ -1,8 +1,9 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  /*
>> - * Copyright 2024 NXP
>> + * Copyright 2024-2025 NXP
>>   */
>>  
>> +#include <dt-bindings/clock/nxp,imx94-clock.h>
>>  #include <dt-bindings/clock/nxp,imx95-clock.h>
>>  #include <linux/clk.h>
>>  #include <linux/clk-provider.h>
>> @@ -300,6 +301,51 @@ static const struct imx95_blk_ctl_dev_data hsio_blk_ctl_dev_data = {
>>  	.clk_reg_offset = 0,
>>  };
>>  
>> +static const struct imx95_blk_ctl_clk_dev_data imx94_lvds_clk_dev_data[] = {
>> +	[IMX94_CLK_DISPMIX_LVDS_CLK_GATE] = {
>> +		.name = "lvds_clk_gate",
>> +		.parent_names = (const char *[]){ "ldbpll", },
>> +		.num_parents = 1,
>> +		.reg = 0,
>> +		.bit_idx = 1,
>> +		.bit_width = 1,
>> +		.type = CLK_GATE,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.flags2 = CLK_GATE_SET_TO_DISABLE,
>> +	},
>> +};
>> +
>> +static const struct imx95_blk_ctl_dev_data imx94_lvds_csr_dev_data = {
>> +	.num_clks = ARRAY_SIZE(imx94_lvds_clk_dev_data),
>> +	.clk_dev_data = imx94_lvds_clk_dev_data,
>> +	.clk_reg_offset = 0,
>> +	.rpm_enabled = true,
>> +};
>> +
>> +static const char * const imx94_disp_engine_parents[] = {
>> +	"disppix", "ldb_pll_div7"
>> +};
>> +
>> +static const struct imx95_blk_ctl_clk_dev_data imx94_dispmix_csr_clk_dev_data[] = {
>> +	[IMX94_CLK_DISPMIX_CLK_SEL] = {
>> +		.name = "disp_clk_sel",
>> +		.parent_names = imx94_disp_engine_parents,
>> +		.num_parents = ARRAY_SIZE(imx94_disp_engine_parents),
>> +		.reg = 0,
>> +		.bit_idx = 1,
>> +		.bit_width = 1,
>> +		.type = CLK_MUX,
>> +		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
>> +	},
>> +};
>> +
>> +static const struct imx95_blk_ctl_dev_data imx94_dispmix_csr_dev_data = {
>> +	.num_clks = ARRAY_SIZE(imx94_dispmix_csr_clk_dev_data),
>> +	.clk_dev_data = imx94_dispmix_csr_clk_dev_data,
>> +	.clk_reg_offset = 0,
>> +	.rpm_enabled = true,
>> +};
>> +
>>  static int imx95_bc_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -474,6 +520,8 @@ static const struct of_device_id imx95_bc_of_match[] = {
>>  	{ .compatible = "nxp,imx95-hsio-blk-ctl", .data = &hsio_blk_ctl_dev_data },
>>  	{ .compatible = "nxp,imx95-vpu-csr", .data = &vpublk_dev_data },
>>  	{ .compatible = "nxp,imx95-netcmix-blk-ctrl", .data = &netcmix_dev_data},
>> +	{ .compatible = "nxp,imx94-lvds-csr", .data = &imx94_lvds_csr_dev_data },
>> +	{ .compatible = "nxp,imx94-display-csr", .data = &imx94_dispmix_csr_dev_data },
>
>Similar to patch 1, sort them properly.

ok, I will move imx94 to top. While at here, I will also sort
the imx95 following alphabet order.

Thanks,
Peng

>
>Best regards,
>Alexander
>
>>  	{ /* Sentinel */ },
>>  };
>>  MODULE_DEVICE_TABLE(of, imx95_bc_of_match);
>> 
>> 
>
>
>-- 
>TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
>Amtsgericht München, HRB 105018
>Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
>http://www.tq-group.com/
>
>
