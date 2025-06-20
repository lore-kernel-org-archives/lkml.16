Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011049.outbound.protection.outlook.com [52.101.70.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6BE6BFCE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750445186; cv=fail; b=hHegoEmyE5/LMmOC7fIa5AwcITfrAWfOdfH7EvuvlOq0uAthRY2+0gJXQeGeIiz3zzyZHJCj2tOju4NNjCPs1zkCQFbfnazso0LGBOqtB8KLJlSFRBk6xyhErb0D5c93CQabFYTr4fNMpVYQkRpXMm0gIUkr1L/f7oSYdqvkrv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750445186; c=relaxed/simple;
	bh=02nsWAqDUufDeP4M679fcofoxDzhVpYN4iMrJKTMHeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lr/qWprYcQwgjNue7obELG/MTRUYwUCBqFhLViUn9vJGY2dir624MeIsMwD3koswwfUn+inalpDeeJ1Dl5SzzNCX1UmY6oMMrnZvPlzvS4CkToBF/y+/oeSneOlIx3CfVDoN/Gygm17OTI1i9TdP8+WjpeopicqbayMgns5wsmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nY7Z6Iyv; arc=fail smtp.client-ip=52.101.70.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nY7Z6Iyv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvXoglgB2vcmMspISf1m/RBBPsgqyazU5BVDMu8vXiNZAUbByroYnc0cHfA5GVUwbA+LoTIQlMExYC+VLpYIF4eFxHTn9bSQGmyhnSOZHDAQiqNKXnvxS5b6WjZEOh+1O817exrBFTiCL9u8yMB04MDZetVT93BM79X1+pdkIrJDBP/3yqbSb+Q2CNFPrs0slJ62Zze/VB0o/CZMxTaNliWQQUuXwgLNeurjctciD+e2Zj2ce2/jhFQ+C8g4UInT/+epYYDE01rRDcp/MaXBDmdxHe237wjqX5wkQH0b8f1x78Vsktz50gHPVYa3G/qwSqzWqje5XVIiEegT8SNrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0WyHtIemzauSI6GsVdBnmfz39FkM8Ow3jJfpZeEvDc=;
 b=ke7bm8FfSsQBWCU5+gMvcv0pACt/0xpA7o42mY8p364zEU8PJLud9jcxUerEM6eW7JAL/D0agoEPdJs7z+WhOjcIAMASEa1TrNc2v1fYLtsp5dQ5cZZDabHAASiwJf/rzYTXZnq/iPJdGXO2+4XABZI2RUd1QU5lVUW6Yxu/KihUimYVfCAL11Gb0Nors0TXUEXkBR6wyJvGbtudXwit3DQOcS6yPd4Q4XZeAsnIMfv5FIpSzZajIDRkOID5Tan1/9/FEC7ZRgOO391kurPbPtOqF0Ftt/HKYOSVyOyBVinVEhfPIOwMlV58AS3wnC+6cJ1NYjC5ZO5DveVfbNizDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0WyHtIemzauSI6GsVdBnmfz39FkM8Ow3jJfpZeEvDc=;
 b=nY7Z6IyvpaMniL8KzEOr1Zl+N1EUfWCN9cfl2uQwEtMHMqdauyRO0L82mNM9pxCOWWrrc3R32tann8xJiB1GZtSYvswlPzAwPhc9qQdlOfujnUlkuwboS8C2O69N/aYUu/pqogaWMt0PY95Kn3+8/8arpUTUz4TSRQXZ+lV1Mmbm+9Hn53E4ITzLWiwveQTK/iNDAO50GlwMmMejRo86mE9jnKgyyLpgizmOgd8gevsz/bUZP7TNHbzjG7VYkTOQzaghJl8sdDe3+EUQcsWgFRCzR14w+CbGKJ0LW1C9eB2FvWrenQRiycDyQAmkJhytonccGYzdtU5igBMa99kj+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7524.eurprd04.prod.outlook.com (2603:10a6:20b:286::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 18:46:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 18:46:21 +0000
Date: Fri, 20 Jun 2025 14:46:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i3c: master: cdns: Use i3c_master_writesl and
 i3c_master_readsl
Message-ID: <aFWscxcJgXCVjE1B@lizhi-Precision-Tower-5810>
References: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
 <20250620-i3c-writesl-readsl-v1-2-e0aa1c014dff@analog.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-i3c-writesl-readsl-v1-2-e0aa1c014dff@analog.com>
X-ClientProxiedBy: PH7PR10CA0004.namprd10.prod.outlook.com
 (2603:10b6:510:23d::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: dee08bca-6ef1-48b9-4fee-08ddb02abf61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y8OspTJygJ/jq/5mwHABeZaPVr6AdjS0AoB5iqeM/ULoe1aW/7qrObXlWm1I?=
 =?us-ascii?Q?rhKzp1hHqD1I8SIocZZMpS5GVHoS0AcYXO9ns4UgM+nvMLOFDTtvOC17Mmpz?=
 =?us-ascii?Q?SdcqCF+iL6TV+22QaahI6FlIxkPdHG91I0DfuxOs9C1TOxOIaSe17v1NggBl?=
 =?us-ascii?Q?gnn4EQvN7dG564rcu92T+3Q4rhtRQz0fEzCVDH1DgZ/PGs/f6nnJiabWkwSw?=
 =?us-ascii?Q?I8inXO2cYI/r0/ynpZVYgiCm/crVGFzB1KUfrFExR8vMr2bsv9PBJEbQyMG0?=
 =?us-ascii?Q?g9MNCUjwvIQkGeTcE05nbLHCeBt1ENW8ERiwSMvEOTLcOO2zZi7/Jfm9LH/C?=
 =?us-ascii?Q?jbcLdoehZ0NPP/rKnPGVElqBjHRPjCm3kNAnfxd9UPpeIsyGQvjkAKsodv5Z?=
 =?us-ascii?Q?QzP+RSGcbnQQWvEBAhk0R8Xahcra2z6nsLJAU7zzi9JnjOT7oCnR2rrtbn1y?=
 =?us-ascii?Q?34TcXyNX8ZjEDpzWA7tCzO3r+dqtGMiLv6AWjrBoz2IErhmdTVf5uB53MAcn?=
 =?us-ascii?Q?mXbLhFiUVkgDy7gChdf265yqMvTuDmiU4M2y5DtgtleheZucRGaObfSjxFJC?=
 =?us-ascii?Q?1GnmXQgSR33e0iXcm0AixMCpSRX16WSmV2KaZkUquRz86n1EovpyBehpFBF7?=
 =?us-ascii?Q?cuuksSwv3BRkA3q1XXlU+W8bxl/u/5wetu7YTx4rE/kkh0rFGVogQw6EcwTq?=
 =?us-ascii?Q?SATmV9VHbVu4slTJHKF9rAC7tXl1bqJCZtMmoXlwUkoOfh1ZVZ/grFKM+zXY?=
 =?us-ascii?Q?08KcDbYY56z2kVNqPoU22ue0wagi0u6YNgVZ0R45XbZsJDKTtDG7kSCqTS11?=
 =?us-ascii?Q?tWFDMCu6uvhTrUJJYhJB4C/wqX5Y7B6GLoPkVgT7vJgk0k/ZTmqLlbvZldj8?=
 =?us-ascii?Q?19ZxAqO5agX/rm0ydx1rgxoA8FZAIYRXYz2GYML/O4C14JTcOnmQRaEuAK44?=
 =?us-ascii?Q?O9bRbAFFvgQS1DQ0aJUCvL1sAHLFkERihkRUMWtPCzl4v0CtFUr5kfdhFv8r?=
 =?us-ascii?Q?hEfHHS3DsfsZ37RdjS92esuaB2/GN3y1e475aBWziULI825OZUbDdElchlBZ?=
 =?us-ascii?Q?hOTRx2DobnTeNJTf5TUxjrUYWx3HIkinTZ2aC+1Lco9xATt1DbOl7xF1zLJt?=
 =?us-ascii?Q?xhLQBPGcxyYnJO0KdhpuviyoB7QhS8emD/sNp5GsnSnXlQZieBeUREIvTsbH?=
 =?us-ascii?Q?C+CvVzs1PLo8cqJDelQC2JkqeiX51Rg+i0ZNkuqsof0s/84EoVpcf9aDQVDV?=
 =?us-ascii?Q?D/uV4qJWm4c6YG6Q9PHkp4qr7fNuU9VoGPlR5ACtxW2pbLeMzTDoJST6pIjk?=
 =?us-ascii?Q?LmvNvh27m8+J/BcbStBctfagU0VknBM4BBdNS0N39+TiMID1sOLXIeG4690N?=
 =?us-ascii?Q?9vyit6Bl8VRr2AyjYfD1ltfrj7GLpIaeDotCv/p+ukvvEjLQHmvJiQiOG9f/?=
 =?us-ascii?Q?duhHdtTFQQYuwpVf4obHHZUaemywBliQr9hOINIYGmN4D/Dm3T3WMg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?umgMxiR29e6FqtUMmKm1DNH1uvCUEV1AQGs1E7m3XS0KLXsXfJ1x0ED0oPJh?=
 =?us-ascii?Q?ny0w41nW51zlaRMNZa2+Zmz5xRAcRKwYy/koqPvPWJUXwbxRhmoztuexUqQB?=
 =?us-ascii?Q?v7/HuGHo8bBrJdWnE8xpWaW4x0y2QkFZUAkv49EDycqyGrYbcdQXxiDHmUmM?=
 =?us-ascii?Q?4XBQ483L7zQoIdV0L0GaAV1mN16yTFgOG4KnNVbqlgayhxLCsGj+FMR21aGO?=
 =?us-ascii?Q?hF38OAU8pV68+6MOlU16uSyKKa0itvrd05jfwd47IrT2MwbNhSGnOzdpweLo?=
 =?us-ascii?Q?CheRQv6ABcTLkNSgpTpQP7nVtx1i3S7Hgig3JEpS7mMXJjS72wVWf5mh7G2I?=
 =?us-ascii?Q?d8uqUJJDlSBllTvLTVyixGi5Ay8siBDFXYW7hzmPlyaK/8wesv4btTlbSuS3?=
 =?us-ascii?Q?S5Q1nHgYF+Q4IbY20BF20caoZmmRTU5rZ7ewWGAuIZMj3R++zUOHYcZxSpWl?=
 =?us-ascii?Q?QD5cfCkvtk+TdxvkXOrI0C4CJTrOrF37zyAeSX7BsSBHsIlFqInIdZxMm9Ft?=
 =?us-ascii?Q?ce8cMvxeVO3ADlNtsxbiceHq+YNXnHjXorRkU0sJUk5do9a2zYt/kpMILaWz?=
 =?us-ascii?Q?s2+jlyQgg1TpKjPwRs0jcFQTyl2ezEw9T4i1aAY7YJ+5CcPUp1tg4yZnO0W7?=
 =?us-ascii?Q?P2fMCeDgiGNTNsW+/BGqAb3UnYZGBkaE5WIfKHHJ+jI6mTgOLeN4M70n33zY?=
 =?us-ascii?Q?T7gkZPXAKwjFJLWanAYAwovvmQ6xM1/EKo2Mmz2GoIRrTctC9RSNa5DgoeKB?=
 =?us-ascii?Q?XMvXoFnlESVIEEHwK/6D1QghIgNrUdK97cCseFyQs7vlc5IN0xP+6Cux+axZ?=
 =?us-ascii?Q?TI3jysZXiULnmHYhxzvvcS8FJ2Z6cSL6LUg4mqHLXO6usK90qc9+FbSOSfEP?=
 =?us-ascii?Q?QK7Vf7GJm2ixEtHzqrFAeZHEuJ9Eq1+ZKG+hG+8sJCj2t81mpM0J6bw1nYe/?=
 =?us-ascii?Q?QviH5IcEheug4oJutbRX8musOutmFV3L6i3QtHakUChBagO1bngNs2zS1GhS?=
 =?us-ascii?Q?l7kaw+sMbS48oZ1GqyfJWKGlHhc2AhC+5an7KGwclBCDgKgaTUgXkGB7lbbw?=
 =?us-ascii?Q?q2+TTuq9ts59ETnrS+Wiy1vQNipO0gU1gj6V01t5TT3r+2/MC3TJ+ue4ogOM?=
 =?us-ascii?Q?H60QgnM2aduVGKy7D0gYa61SXD5zrJ5c0L5nhqzliG/aX+0V1PMyJW63edd8?=
 =?us-ascii?Q?H0NT8X6sOPTqFgCkt3BHlFxXQTS7bgFcbvn8cFPeiVnStoEgZn0nnsaK7AYM?=
 =?us-ascii?Q?SBt5liSCN6ucuGMFrrgkob3x2A3K6iu9qaJHA5qPINKq6bxtPIyetAGS5R7y?=
 =?us-ascii?Q?UxphUqC7ugVgsiSXEgvLu0WGOZMjN2YXZzrRbJiCiQpQ8DZIXREMmXxqYGCW?=
 =?us-ascii?Q?BI0aWhwUujxSNnD9eRJlH57V37lqjZD5zntIdPoT3MwpoDl7zYa7KXyJnOhJ?=
 =?us-ascii?Q?OVlBc9tokjsdaqagko0OcS4dINll6KmbLi3X6cgyNm6GbUfxS0WbeJXaeqbQ?=
 =?us-ascii?Q?o5XRTWsoqcXKMN4Q7jz5HICZjB1KMEMyUc0ktr9FEc78wKTtxzWD7GnF+zOj?=
 =?us-ascii?Q?eBenmqE8NYGGv8r11hvsQIG3OqlRHoPZ9Ak0gg2M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee08bca-6ef1-48b9-4fee-08ddb02abf61
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:46:21.1177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qO1L5Az0lu2pGTsav5ELdi+8lhQw4xYimcGFXntG2Bp74J8PnjsDcZQT1pL7/kzU/D8s8AtzGW7s7mxwT1mMoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7524

On Fri, Jun 20, 2025 at 06:55:00PM +0200, Jorge Marques wrote:
> Use the inline write/read methods common to controllers that have a
> bus width of 32-bits.

Subject function need add "()".

i3c: master: cdns: Use i3c_master_writesl() and i3c_master_readsl()

Use common inline i3c_master_writesl()/i3c_master_readsl() methods to
simplify code since the FIFO of controller is a 32bit width.

Frank
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  drivers/i3c/master/i3c-master-cdns.c | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index fd3752cea654954ed1e37337754e45fddbbbf68e..6775751144ae86c1795abf45ceede17e1961bb74 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -427,25 +427,13 @@ to_cdns_i3c_master(struct i3c_master_controller *master)
>  static void cdns_i3c_master_wr_to_tx_fifo(struct cdns_i3c_master *master,
>  					  const u8 *bytes, int nbytes)
>  {
> -	writesl(master->regs + TX_FIFO, bytes, nbytes / 4);
> -	if (nbytes & 3) {
> -		u32 tmp = 0;
> -
> -		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> -		writesl(master->regs + TX_FIFO, &tmp, 1);
> -	}
> +	i3c_master_writesl(master->regs + TX_FIFO, bytes, nbytes);
>  }
>
>  static void cdns_i3c_master_rd_from_rx_fifo(struct cdns_i3c_master *master,
>  					    u8 *bytes, int nbytes)
>  {
> -	readsl(master->regs + RX_FIFO, bytes, nbytes / 4);
> -	if (nbytes & 3) {
> -		u32 tmp;
> -
> -		readsl(master->regs + RX_FIFO, &tmp, 1);
> -		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> -	}
> +	i3c_master_readsl(master->regs + RX_FIFO, bytes, nbytes);
>  }
>
>  static bool cdns_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
> @@ -1330,12 +1318,7 @@ static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
>  	buf = slot->data;
>
>  	nbytes = IBIR_XFER_BYTES(ibir);
> -	readsl(master->regs + IBI_DATA_FIFO, buf, nbytes / 4);
> -	if (nbytes % 3) {
> -		u32 tmp = __raw_readl(master->regs + IBI_DATA_FIFO);
> -
> -		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
> -	}
> +	i3c_master_readsl(master->regs + IBI_DATA_FIFO, buf, nbytes);
>
>  	slot->len = min_t(unsigned int, IBIR_XFER_BYTES(ibir),
>  			  dev->ibi->max_payload_len);
>
> --
> 2.49.0
>
>
