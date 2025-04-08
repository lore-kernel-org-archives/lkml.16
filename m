Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA7122ACEE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128449; cv=fail; b=qEziwQ96DYWtRUNMA9PqSe4Vf1t2HAAYo1PJ3q3X24IXNYOa7vL5CrDvQzieuApbifc+vtgwOTrDos3JMW6xOIctcr8HJvmzx5jij9SCw7aBaXzsM4u04v/a3UkmyEeYuETVe1tRC+yndyGbCjYHmJXB3g9T19ssuEkYb5S3fWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128449; c=relaxed/simple;
	bh=OY0mzDmLUvL5Gy61Lnv7zg9f6VgEACtmefDJX02wxwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z6Rn8M2ry3K3KQBBDkQu6xLBmJ9y5GRzkMEOlJT6f8EvS0KXZuvE2wRMKWJVtSHE//VlPnvVRenlkmaaAKuSUtu0ac9gXUIuwwDVdwyFLEjtxoXayazwCqjl8RbII9W4MlcExjK6TyD8zhdMC9jqdA4+ZeqQgH218P6eLmETo5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Im8b7ldU; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Im8b7ldU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWSOnMII5RNO5+V/vx4ocrj1rodo+VvZjFOyi+ObGeYNHZT6gkNZN6dCMXbCwr6q1eWL5NzaAzs/AALlayKaFjm6ljJc3hjp7k0vm/lAI/7Fp17gLx3Jr9l/PRd3krZsGOszPfyvdQmwnZoh1qWbGjgt2Akal8/yjdvnM97Ootn+3a0ZyLAvF7SFT+AlFZnTt65uj5ME8nIxoVQ/gynQE8xJJMru5a15Petwl+w5o7fH/TAFGtycBT6I14INN9Xe4iTZ892pSwGgIQtajUTBmTkbUywGE12nR70zzusYpw7i9Z+lQmObdQp1mp+5f3jHtS0iXzOzXtQPehItfE9yCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITPebLoSqTZhSe4GsOSOT8m+w4+VCR5+33/DJMNuhSI=;
 b=S43uC7pMV8BkfA68cSo1STWmqaKwUjhKu68YIsqZYTqUiT2bfJf5wf7kWwGSoNVMdABJQ43xVQFCH2vRwF0lY+hRWSI5dI9CVPh5whgt6zGQ97iMJTr6VXme7O/JyTPxJug6k1d3AhVfykplhELOpEkjQp0wW8gyWnnzLeOJwKRoTGj5sG4C7PV13kA6XSD1nkoFpuKzg8iVBsTBQw6sYWuB+r0zKj72Z2QNfGfQGRkKdck2WHqaVuhglPYJHBgYRXhOuDIuvCzjk6z5xFHfro2JAevDXNNsrO4cUlsis7x+cw3QpFhe5klTrcKaNTdcOUQGw850EwBesfz/LrvIrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITPebLoSqTZhSe4GsOSOT8m+w4+VCR5+33/DJMNuhSI=;
 b=Im8b7ldUqsaWiF+rbji0sunBIMN1LETH9edcj8Ejk602GUL498iP2oc66Ow8lZ/leLzk5E+iD3piCCBuDKwx0h8ezsmmePAnAb2QQf6+0On0YSEr3GeLNHNertP5ktIqm5O5KYsWG9Slzq6MreZtWavAw8zTO5LBfeQw09oMPuGN3LgwR/VAZLkmwfxond4gmz37i1ohFrMctLQdV9+zuwjuRJy+dNc5wT8KagDPhPLovsw8VnIbtR1b91zQLjWPCC7EEIo2n2Qj3KsAf3XdzzLGMc0Hpd6yPafUa/go9yPtGI+WKoEdW7UY3X1s9BqaqJqkkDY975xKddqWvMujwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10563.eurprd04.prod.outlook.com (2603:10a6:150:221::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 16:07:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 16:07:23 +0000
Date: Tue, 8 Apr 2025 12:07:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] MAINTAINERS: Add i.MX team to all arm NXP platforms
Message-ID: <Z/VJtdhMxvnZuVmb@lizhi-Precision-Tower-5810>
References: <20250408093926.554091-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408093926.554091-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH0PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:510:5::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10563:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc83e07-5ac2-4533-ec06-08dd76b7728c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PDqH3AGOTj5ZBTtl8vKEAwWjKRH7QBnkAGrYKax73fWrqaUDDiaoo361C6my?=
 =?us-ascii?Q?qvCh+f3olg1jqW2HZNos4ahZrPG8KepaSH7JozGmhnXv/qAGdlxDwYqcn7US?=
 =?us-ascii?Q?cnNXfAM1zHDYlkyjYCegqDaotX25MfXGjkuhBH0StoyRKcaMIbwC1YeD60gG?=
 =?us-ascii?Q?Q3KA9fe7h+wooLD3VLKiJiVUFxL9RZnjioMOc7ZprMjvw1Accg9I6P7CajND?=
 =?us-ascii?Q?dZ4HPu6dQ22mgLu+6MxWxGu5BGgC78SgaSp6HDuMVLud2XQqB4TqPo6NJzkz?=
 =?us-ascii?Q?pkU5m3kxBFRGYSURg6cBRIz8KOm2mVSdmlrZTvLVIOVkeSL3QgLEPWl/Ku5U?=
 =?us-ascii?Q?rAzVBHB1JKLKSrUkmPJbsFcM8C+Tl/QE77Nf4kam4SXGVL/Ku3UqR4rsI8d/?=
 =?us-ascii?Q?GGHDqZYchwqqgK76g+fsnGtLqUAD1EMIJHULfygQvKk5Dxi39iTU6KmL0mDE?=
 =?us-ascii?Q?OmyPvWAneRTo08+Pccg7E8bEhcQh98vI4MfbeCdv+qvOgiSDyOnOYMThc7zj?=
 =?us-ascii?Q?kL2zT+JjyXJMDQRZCMC1NGmusJviTSyiwcV3QtCBH0cQWI9+NJzRDgx2l+VJ?=
 =?us-ascii?Q?EpoeMoIDNcBobvB3HGdcMiquxbd43bhAYaoWbV1THXoC5xYomkZDK5e9nx2O?=
 =?us-ascii?Q?z7He6FXmEfIsob7RH2WOuxqmOM2OABcRxl56r+16+jWp2a00+w20UeoIEHgK?=
 =?us-ascii?Q?YpdOsN9dka+yOyDITDfAv97Uky/vN6iG4RykuqsiIE+f22BN77ucCVeiuqHj?=
 =?us-ascii?Q?1xu2rWEcCon+6Ryv+o41a9xIdSa1PnogvaTNbOzFc4JMwGNfLtpbW6nYmRMK?=
 =?us-ascii?Q?fGpEtq8aWJBoSS0SB8pMZawxdvkdeKaAflezMxtVnj9Pf6eflgqFiW7CC78V?=
 =?us-ascii?Q?hYEyMsnyk7QMP6MGUntHRnBJrz6lnMMGDupDGGDZP9HylO7xz9ZF3R6wrVx7?=
 =?us-ascii?Q?DhJqrdJ4SZLw6Vm0Zy9sQb+Z4WjF9JPfeHIjzhkQ7n23R5pk776UsO299Gs6?=
 =?us-ascii?Q?c+Dbi+G1j/iaPnOWbn0AuT8a0a8V5sRuI8YShZ7ie3Y8snfxjwzLc1cUIhr2?=
 =?us-ascii?Q?qoDgZmwxjRTnuB6MuG/z3SngzBiYKQByG1Xq8J3eijoW35X2LL5GpYfuBMI6?=
 =?us-ascii?Q?iUYLT1sDmZy8BgWEKnCHvt+BQc2zTMZPzdMvbR6JtR/7QJch/zdle8Mv/lUf?=
 =?us-ascii?Q?vaKDgqcRTA/+V0wWJqWrLSuOnfhbS08DQ71F2w3l88qTStdJKcoLWYsIzQ0U?=
 =?us-ascii?Q?eNYIYQfsdRC7dhtGPQBQAb57fRX9zcVOGSCXsRfM4lCRHYgefJOiD/PnWA4z?=
 =?us-ascii?Q?prOg5LbcZ8I8GZANtl8HsK2W0iPOsC0T4WIxL1nCYmcLAEJC79FHL1OHb/w0?=
 =?us-ascii?Q?Ih9CSh5T+dzq7FU03yTCG8EbVKoZnoFEXg2MkdOcIbZ1itPskA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JEO6WUZry+9W/P1hdT+B81q5+EZL9PI2Yf+ejn2/vDDzjz4lDVd4ZNCVEI1Y?=
 =?us-ascii?Q?lUBpQ58V9aTVyiEbktMVFGD4P9VDC4ht9tBM1mcZT1CdsJfC+TzhPT5HCzS3?=
 =?us-ascii?Q?AJh7kVhkQMbKHJQLrp9JnH5yS4zShiAsyPsjs1422Z0/yRCUrGYofcVngHKd?=
 =?us-ascii?Q?nb8HtL6Tp8/fkObKrkDXIALLxDP8c7YCGPK1ZjjxneAw3+XSyXpK+nz0URed?=
 =?us-ascii?Q?BWUK8gi41m7D3H4PVhHkJHI5Z1MJqlUWLjp3MtRV9yL3Zp9NvbuMJ9SGfcY6?=
 =?us-ascii?Q?cNmlrhkijAj1T+RWIx2T7yz39z1YuKkSnK2YhWD8rrg8bIPIVrx5hTrVn30w?=
 =?us-ascii?Q?rqO6NNBZ4aZYUhL5z986UItN7JC4Nd8RLShI9WDuHsYCmkn7EBgpOrc6BOyw?=
 =?us-ascii?Q?+OF1gpIr0EN4/ncvi3QXtFjrVDRoVbSSW6us/rfc3z2W/Sm7kM55yRAELYy3?=
 =?us-ascii?Q?VoEaXxOtPn47QSiTBPfaA0iH+zRmbI68ASU9h1gfCdg5aYURlJP4P7W0i5yg?=
 =?us-ascii?Q?GA138qcONReBjSgrZirI7FpQfZrk1h6G9yaRkigg14FmsP3vZZwCNbLwTTNj?=
 =?us-ascii?Q?2jr2SCmL4zfLpYl4NIla2abujxqmc/asZX1f5WG+UO39P4T4WUPl6QFQYB7m?=
 =?us-ascii?Q?knBwmx/R583A8rRbjygPuMXsf7KDfyrxAAyEWDeCVLHKkoIcgxHrsZIOsutk?=
 =?us-ascii?Q?FyltPisIqoHDPWY1zDwaaBbJd9leB9q4XL6/9jtGsTw64mDSVGl2VypHet3V?=
 =?us-ascii?Q?tXdlkV6+Td/sOx5uTsLTA6il7ltJHjWPqEMgNZtnEKv8FyI0p8Jsfw/1Cw91?=
 =?us-ascii?Q?zhAWt4NbrCPkhb3eLxnGWDKQs7o4Q6cvVeF0UcQP8S2Ee0pwiYHDsSPhOwmm?=
 =?us-ascii?Q?Nq7s4+/4Nd6Q9aZYk0Roo9K/LR+AUVMRK99L540ei2mfyDzbIsDYRb0mcT0y?=
 =?us-ascii?Q?gVSWckfT5eCV/5kI8qWF5MXj5f93pMbGx1UyA+3AUQ/rRYalat998RSzzf2z?=
 =?us-ascii?Q?S7mt6W82AXOS7evwzg2pYHmgtI4wqlRmH6/h2h1l1PX6D4oIqfN6mN+9qkUH?=
 =?us-ascii?Q?ZtsTQUSARHjkLes6PyaAvnTsUwGnh9KtD7mUIUWTOQCiJ+cor3UecsrmXSo1?=
 =?us-ascii?Q?cBgZF4TJTH2u9pUnt/U5KgIJ/ojbjqvLLG1q0TDJq5ioFJDzK+pt4y7VILCg?=
 =?us-ascii?Q?f42sFmF7eQprnbSwLcd39S2aZcDrsQJ1FmwXQSU6s4esPJMsslP+vLiOPBlw?=
 =?us-ascii?Q?fXD7wn7+uK9GUiH0sz27+h2zVdvtsG/03YmpN2bFQb+xQD5/Ze7NSlU81fPr?=
 =?us-ascii?Q?ol2cMXD6mQYND7aRwQOyy9jdkI3vbc8G+3dDlAYDO68Xt2bIbLd3jSBPBSdm?=
 =?us-ascii?Q?IIb3lfh1uQi1d2DEWmNBmeYZTMWiJA+ytolMYqctnRfqFVwLfdg5/x2jgIZ0?=
 =?us-ascii?Q?k6dyb8h1LDYk6m/V9VSwUwPRcu5/CaSgjKX1x6XBygpTtoJQ9KvLWJTH9Vxn?=
 =?us-ascii?Q?iLYF2Ew7iBV7KiE8wYj8iK2TqkVekUjOI7dV+LScpYufuXYtMHR3P56rR5OP?=
 =?us-ascii?Q?Y/CYvdzkW+kh3Wu1fiTaJA2QYK3ash/gQ213Rvu4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc83e07-5ac2-4533-ec06-08dd76b7728c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:07:23.1142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vXZBEAcqIM3WB8LYaP/JaUP5D3l+f6cCwLMhpJRP8a5NEacX7dwoiPeyRpkSuKPBxpaMhuBiExIEs7cOw311w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10563

On Tue, Apr 08, 2025 at 11:39:26AM +0200, Alexander Stein wrote:
> i.MX team maintains layerscape as well, so add the whole
> arch/arm/boot/dts/nxp directory as requested in [1].
>
> [1] https://lore.kernel.org/all/Z+Vs+pHZs2fMP%2Fp3@lizhi-Precision-Tower-5810/
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8627b2024cee4..b1fac2a3bc948 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2519,8 +2519,7 @@ L:	imx@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> -F:	arch/arm/boot/dts/nxp/imx/
> -F:	arch/arm/boot/dts/nxp/mxs/
> +F:	arch/arm/boot/dts/nxp/
>  F:	arch/arm64/boot/dts/freescale/
>  X:	arch/arm64/boot/dts/freescale/fsl-*
>  X:	arch/arm64/boot/dts/freescale/qoriq-*
> --
> 2.43.0
>
