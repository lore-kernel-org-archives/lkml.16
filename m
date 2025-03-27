Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F05E79E1;
	Thu, 27 Mar 2025 15:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087914; cv=fail; b=RTy7YYK7LFmiZGcZI+9CJh02aj7sXbNzBYkI9SMc0oBpxD+tyvf0QE3oTNv4Nj908GY4i/e4U7LEGc+3tWifa71iuTAsTq9+g24dJv9ThV71m2zgdLrsyCg3Ne3bnPxlG+h3VfKvcLie1ryYUwC6SN0TUgo+AN+/oyQcwLpeYE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087914; c=relaxed/simple;
	bh=tzHD4bipZ46l/b0+PGCnR7ABoub9J+OK12/WvHIF/30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H7uzZoTY8Ebg6pNU44d1RJVjomcxRsb65weZLXFZpHxdYzueNJ4NY448AoEEKsLbI/SwF2cp0xiwKbHSVMpr8vYle8PKJIyFXULdUMC8j0/ueAsK1DIhsmKK9IrX1+ZfQ+6ud2wKvT21zWSMm3mGMbWx+cezoQ3g1/xDVTSJhqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nELZcQrM; arc=fail smtp.client-ip=40.107.20.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nELZcQrM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMteb4Kp+jKXkSEIXBottkRwE7RvgT5ztuIHlTxeZI/0b3ELgZ/k120f/Fvk0DhF5C643eYGeM9WfQrPC1D/2CeeaDXGxhuMHfoyWcNe+1z47RfwgehucVzwW9/RT4FiH55tFh4zJWYCPDVX08PzxjWebj01FABk8gaJV/MjV1C6yopuFwzJY9LxelMdIeV8kgdJDWyiIrsH1eRwCYq9E727s9bpPbLeOHl4I2NNtxsiiwPJd4SdLrXaR8Ck44rjFNh3nDmFy+5IU8QAvUogKuq0fvAoRk0ZC+LKR7sjTEKeEoH2f1EtHSo5LPbMbMZgk8pvBVCHGfC8XRsGbrTaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rsvgf4TpRIvFQEmsPc2sAagfqcY4gUozyeQXA7bpBIg=;
 b=NtIs/HiN4B/ye2F0k/tJgCQXZU6E/e+yiQdj2UtsawDDMJutaEtMnCU/BpTn2C+dLTNdsMzM4jPvk71bgtTcWjTmk+922mpIRB6BZXN7YrIEH7HzLgEDbTAYg3xVl1VaMKoSQLbpmDyX+zL6yrHRs5cAxTbnL/qzXNwjfwBsXwu3KDBEOZRUsmS4lN5hr36OEfdQCQ4da10IG6PMgM+7VXdYBk9gCi8pwLBHLj5ZYxQ28mW0gyEuiSPr3NAOEapN1WK8zu+NgU0+qGSJWeQp1M8w3XolAKhPHrqsLuBEKw2w6i9tBg6LC8bHIYbxaVdPJFhlljS0Sgz6ZqkAgO8E/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rsvgf4TpRIvFQEmsPc2sAagfqcY4gUozyeQXA7bpBIg=;
 b=nELZcQrMebp4ICqoA0fsfip2II0cGU2xjjHM+UHu75rvF90OCcjxWlUUcD8WeXA7lvSMXmGSyc3Hjy7eJoSzjHtUl6y4ZbzwaIfmgRIV5B2fQ/eDeyF5nYbeDg9ijHvKiesnnhO5+IAAU2Gyz15HKwF43EgoMkwG6b84DiB995y2EOLyHYlj6049hFvs+HRj0a6MuFs9Sz/xkur/QJHQE/BMLjRPLGIdKJHZqSp3IyYXWk2cXL9Vezua360aKCt+BtFo+HVsOFb69azICkt2peo8bahOoHZ4UxHazvNCSrE1nDqpQW4ERiHReXwNErIbaRjLnIYbQoTNapWCH3jhEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7589.eurprd04.prod.outlook.com (2603:10a6:20b:291::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:05:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 15:05:10 +0000
Date: Thu, 27 Mar 2025 11:05:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] ARM: dts: ls1021a-tqmals1021a: change sound card
 model name
Message-ID: <Z+VpIHi3r/+Zabec@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <20250327144118.504260-8-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327144118.504260-8-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH8PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: de0274f6-dbbf-4ada-4400-08dd6d40c484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ruf07UDsK/+8iZqR4k4llO6ydriax5i86TPuVaFD7kr8XaKz+nuwOrIhD+4j?=
 =?us-ascii?Q?33o99/9bFtBZz4AScfHxrlq1Lez2RgiPmauloi1NoCRelgl+0lqSm7rcJdDF?=
 =?us-ascii?Q?COzsBhH4Zw8JpuAVH5mcgtO2kh7jm6NMHJMV2L7f8woSTGzWV09G65uKItN+?=
 =?us-ascii?Q?W8uevfI+XjbxkUvYQiv+WxxPY/hYQpVfrwItlGTqLU81xziE0eyl/31+4SV/?=
 =?us-ascii?Q?gzeZ+VChyfEarKnCLRGJ8qbSTLmV/g7XK4aAdqjf5xUthDZFbdmrbdrEvLF2?=
 =?us-ascii?Q?c06mKaxHP6LrxcI+zk5+Z0Y2cMqdAUT2cP7lvNHFAsysZJNbxyecsiJstMAC?=
 =?us-ascii?Q?xjJP4srHqMG0PJOSVey0vGB4zJ2sQzWrP7JYfTFQSUxldpGOvKm9yINh3IzK?=
 =?us-ascii?Q?gmu8gIEIM9gljEHXbzFTXjY1EQUOHzUwAU1Ww65/B5aiMu5/7WmTvV++AR9S?=
 =?us-ascii?Q?5/8vBB5ZqODaB6cNqm17/XpBNrPYb2AHpa9drxWobmBduHnJDAUOc+Ow8fSA?=
 =?us-ascii?Q?Zi0i1t8yhcv0mmUIA5pAibTgeRqiNiUVYMkA1tFI1J0Dj6WcMmzN6WasnqES?=
 =?us-ascii?Q?eV7zSp+BhogW07Sh1WuiZzVmY4i5sMRJdv5xiyxFIhUJzNpkCgqYliV/mJqu?=
 =?us-ascii?Q?tUjHHzkhrQCOONLu3vX7RoCO/wonG4qxhs/nDVHOz3RdNW3byGWckLXAKC6+?=
 =?us-ascii?Q?AjlAwbWywR+xwG6gM40lQYPPbedvheST8ZVNCcuNajMgvn/9LfLeVMedZdnN?=
 =?us-ascii?Q?/Bc1r//VTcgGEyTEKq3/8tI9CqAisKu+XR99TNmPh31dl2E1WeGzH4QGiXnM?=
 =?us-ascii?Q?lTZZK1RULrsJGFvYVpTi4wTy02GbQWIrbTq39O8TIc6khNdRdzpH+4HPQGEj?=
 =?us-ascii?Q?bxATV66P76SrwzYkIIxfqizazheMAKP4YRPhMyX/Q3h3MESXwPKox1oJ5LLC?=
 =?us-ascii?Q?oFB+gsLh1UHt3wjq6L7lsi+Q0B/5d773PXQH2Uz8EnkCde0NaZFxybHtBLpR?=
 =?us-ascii?Q?bMq4melBH9udLRLDU73gxW3EV8p5tDbN3nEMJLn2CwVQtMQ8Kh6gsBnO2sPb?=
 =?us-ascii?Q?pRWXvM5KMvIFeTreGRl3+TnAkapouPmgkBJmupwTbh+aKmPLCfTuWubiUiA+?=
 =?us-ascii?Q?AcCrPWs9bdAS2FQCAi6lj5eW7rmN132xLIodPOneY+BvliWWdcS97qpZGPmh?=
 =?us-ascii?Q?t0ZHWTlIxjyJrEpvYu6Ux08bg4Z3eWAzga5dMGHxl2loVE2ZL6ThDLrOQ5Wp?=
 =?us-ascii?Q?8nT2PzMwB2D1RZHK+5obD4j1+rxjKQRHwGSSGyATUd2VQrEDnucJSfm8uANE?=
 =?us-ascii?Q?nlOlPyaEf7+uDW1oLFSl0yikM0i1i45aPYCcZ7Q1jRlu61+sMjLXW76JoSKi?=
 =?us-ascii?Q?amxPk1m8Fc2LWDeFdjGNXPnKbDFpewMV+QOOCG3Ti8ywBZeQuYtojXD2wyrT?=
 =?us-ascii?Q?jOE5LmSW1AgOo1dRyYxJ4UDx7vZYdXpB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O+lxUITm3vgQ+tHgKvCqwh4Z/IXT+mkShQ7qouFuRsOezPWPvLlEAFJVqQKM?=
 =?us-ascii?Q?SJltT/dIIhdzEOqIaVHaoFl3UzPTXFhMITNSenkK7UA8EaWSa3AwIYq3qBCi?=
 =?us-ascii?Q?zyK1gEL9BgAmVyiyW50tmvaM4QVRX2LAVSryyA/r6Wy55wL1nHtoowlgYL+Y?=
 =?us-ascii?Q?qoMkt4v0Nw90crUaaHEjufEVF27wXG9QoltRCBYrmFmi2ch5DT+GxtvwKhqK?=
 =?us-ascii?Q?IHY6AJHeg20Xu+eoIDSBUCwciAsbLYD7KT0vGwyGuFItCeEjeIyy9r27u2ih?=
 =?us-ascii?Q?Fy6iwFFem0axiJVuQ19kOf4xrRZPYWVkOvFR0BG7zpUuxsffDltgrQTEMGEV?=
 =?us-ascii?Q?UHKlsCgBDOhUNUo3m9P3KO4m+aIIIm8axyvteMZWit+ylKV5aT6rfVCaRDYK?=
 =?us-ascii?Q?9e3riEEh69mYSGPjkOprzzUH+zQhUAfW1CmxxKBPxQq2F8FV+OENIsbWsBTk?=
 =?us-ascii?Q?oUYiyOtOIIg8AYf4gJayeoknrkznDwJfIXjUVJKekVdeEQjhsCdr5vZGF+YK?=
 =?us-ascii?Q?hmFEmxE2U9BP3r84cjWQCrhZzqrFGb+stGQ24znRljG6gKJSlGBLgJDzcsyw?=
 =?us-ascii?Q?mUQ2Und1dYV3RABMlF54HuBDy6R4h8HR+qTV3Wp8CNLK9dXorjQreyRM6Dc9?=
 =?us-ascii?Q?Txj/3gECS5CZH2gt1GrnIdu7PV/Lyg0CE/bGiOnpfHAWCjs3Yecpqq7X8B5/?=
 =?us-ascii?Q?YtLgY8P0cgHoXaCuQrdNkeXWJGg3njbv4BAEcTiSXZQs5t3FahaK9X/AGyRN?=
 =?us-ascii?Q?WwznpTev3sB2P35gGRX8xuH7Ux1SfGXvVi+k5dN8+KdiTxGkFQi+k3yLDdPq?=
 =?us-ascii?Q?YDsIJDGhfcDc2ntZtzpIX/1U9H90Wfgmfqaz5ElArHQ4ZL1zHja0+XO4kaHx?=
 =?us-ascii?Q?Dkgi42z6i4CjLzIY7B7XyWvsM+rzp7WZSkoKF40SRVEFwQP+P7v9JCP/fUun?=
 =?us-ascii?Q?MBxRfkRK6rxo5YTqO091+S/PHtB7CK5igpvOxktNNT2+bgtdsPT11TISoNcy?=
 =?us-ascii?Q?zIpE7S5hIqfH7ptdkiQckyQTGgltUHdrjdxQ+GXAu9AKXEwT44FoHPHpKrnj?=
 =?us-ascii?Q?GWKmz0UGwuHxBUXbAOakyYsRT2D4AO3gxfe8gSKjvahK/RFwUDHxFH2DXr4h?=
 =?us-ascii?Q?vAjUgmM1plF7jSMn3Mv8c8DHRewLD+1poi2yx5B/m/cMpc3oOLsKbLBXKgpz?=
 =?us-ascii?Q?yMfk7HVwwD1UOW/yPJjjAjfwaRU9L5qzZHfbecHrWH4XpPjRZSi7/pmFM6YW?=
 =?us-ascii?Q?1HgmjYLxOT9HAEMPZ2ipEXQwt3gfaCIkt31raAONrNY0jj4yib3RExel/VcZ?=
 =?us-ascii?Q?DyROPEaibGcxQ7KgrAdS9yepTx2LffiS28RsJE0RnHromQjSEZ8T/6dmmPEb?=
 =?us-ascii?Q?O770X4w790/D+8NE3QREHhO5GORQEPDgJWfMRcDAVTAATxUSRfXREmiQgLhc?=
 =?us-ascii?Q?G+BfnYvMgMOeY2KF6H04eUfo/xWZlsNEsa881+RvE/j3e0eHm/cNoGfA/jAP?=
 =?us-ascii?Q?+TJfdoQPp/F6E9NTU09sTOHcwOqsdSKs40MDDId/8r8Y/EmaNareT5C1Q4uv?=
 =?us-ascii?Q?ck6RD/+fxv47F7BEgSG4kZ9FmylPGjiwpf0kwQ7t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0274f6-dbbf-4ada-4400-08dd6d40c484
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 15:05:10.0649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1rkzxysaaZByFfG2U+nL9C76uXomugoK4hFnu7HrU1zYaTSYpMkboQgTdY0S2iL2nM22RcQ58jKLBUd70GUjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7589

On Thu, Mar 27, 2025 at 03:41:13PM +0100, Alexander Stein wrote:
> The card name for ALSA is generated from the model name string and
> is limited to 16 characters. Use a shorter name to prevent cutting the
> name.
> MBLS1021A uses the same audio codec as most i.MX based starter kits
> by TQ-Systems. Adjust the sound card model to i.MX based platforms,
> as done by commit e6303798b6ac4 ("arm64: dts: imx8mp-tqma8mpql-mba8mpxl:
> change sound card model name"). This allows sharing a default asound.conf
> in BSP over all the kits.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> index 80dae0c09542d..5606585dd5607 100644
> --- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
> @@ -157,7 +157,7 @@ port {
>
>  	sound {
>  		compatible = "fsl,imx-audio-tlv320aic32x4";
> -		model = "ls1021a-mbls1021a-tlv320aic32";
> +		model = "tqm-tlv320aic32";
>  		ssi-controller = <&sai1>;
>  		audio-codec = <&tlv320aic32x4>;
>  	};
> --
> 2.43.0
>
