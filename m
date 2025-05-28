Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013047.outbound.protection.outlook.com [40.107.162.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E352882DE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446886; cv=fail; b=WOH6jLHg6ohj9t4YvyK7+9ePU1hTGGmtrlgh+4Ix0oi3/j0ag788fYbzovzhV1lao4tptjyqTGetTG73zg3ILazxWz+m3koSRLlpFFEEwNEpQAm34cybolIssjSfcLtorrPkDIj79VKp7mkga6yk0DA/RwFP6ylBc9OQQ136l74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446886; c=relaxed/simple;
	bh=MBj4Pf4+Q9lowubj5SXmbezTPKOCLCWvYgnvJgZYyCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PZ5M8Y/8ivMNsJmn1JPZnhIsxPjOcNr3loeXtsknfVldUQXkJjVMgbaF0G2YPgKn2OglbRUTZ4Nv98lgtVzmsMVT7uKSELwFybqSW6BZh6HJhHC5Qw4lPA+RVYM4UQPGqfSsISDTLnNuXi/YIWOdd85ipoNzk9APzfLWB+fsiHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PrdyLP51; arc=fail smtp.client-ip=40.107.162.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PrdyLP51"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oioT3+Cwtar26zFZo5DOcEGImqHEOt9We92R2GhKdDXcTqPrjBherw07eOAG2yXP3xKF1492S2j4kaQ9110W6OW67Zt7vuNH2aFqjxE7SfXc+7Bx2Pq38ic6axpYlR0wphNBvdBMmASe8i8EanD902Osf/Y/jOiWBZJm1d8ciTU9zW14g1+4t5oOV4BRsa9CrS832gp5/WFsV6Czm4tFUNcGXq/a4+mRpJOV62YLVCWvrA0IUQJPe3lB6PwShI7az+ADDAMA7HoNNpljcQwWKed15KGYiKstiGt1Dwvt1onxdSFlkjiyKMu4lDR1J74eis0feVFFq1Of1HjiIl/62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouTfvaQ0tUDL8ERzY5Cz16eJeqTm+7O2B/OHQpVohWM=;
 b=ER1iVgdQLevf7kPpJhG2nGgngMvXT0yNZUm/81+03+/FnscNfiZmouzIT9qazniywLJ/JRWmpFbkc/y7XmuW9qLVRm81ztxCgIz+gS+L+ctl5nFI0Qq7dF83u43zmzr7W/anJRYGTQRFSV+z+OMHewR6nXZGSefL6/uXNFGrYDXfxNfWIbWl1fTJhwUW7TFiMVe8UrK4NRahNUC/wAIlXp0Ula5bTyXUovVIpT5QOZ3L270KXVz+AjIl3lVwc+BoiJTwdxMufDt4r/7T0feaYR+LaWfiFfjW5AbmlpmqaLlrFRtL7NZo9Hg1hbMf6bCtWXwct1IocnShW/S2Zf1Iig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouTfvaQ0tUDL8ERzY5Cz16eJeqTm+7O2B/OHQpVohWM=;
 b=PrdyLP51iiTVt8/LTC9ydyR5SDIF9LnTnEkoDW0orw8jlGy+jDr07x2xSIkRJ6Pj80+MNIHZF1jzCXlZaPOGDMedDyec6DFHmiiVcDlLQdTa8/2g4Aj7C3VL+6aeb4iH5ZZJArgJzgU/7sx0BzgIuyNdQ+ATS0EjQfI4EYxBNWXB832w0gtoI+in0xlqKzSayhiPf8fZQzfCZsIeR9ks3wTlohE32OH8ImgKrDCXgs+BkB7F+sEX6bWmiGiFZggZLJPgMxW6XLbz6TJFVp71Q8L65Km5AOmSBmxrioDc31eIB/pGHoyfiEJT26NzdneuwcyrGNxAg0gShN2DHw/uTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7604.eurprd04.prod.outlook.com (2603:10a6:20b:287::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 15:41:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:41:21 +0000
Date: Wed, 28 May 2025 11:41:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: s32g: add RTC node
Message-ID: <aDcumpWLhNh98WVR@lizhi-Precision-Tower-5810>
References: <20250526162954.2467894-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526162954.2467894-1-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: e4554ac1-f04f-410b-7af1-08dd9dfe185f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z+9oOMZubATMpUVtmMhV4eptCG7zzx7J0b78Puu1jdtqiJy9RISNKoFy15HE?=
 =?us-ascii?Q?doLREU/TCDMjTVmOzfZpg0XrvKn6SrQt2RWe46xh+cZV6u9iyWLh2zDHA4iH?=
 =?us-ascii?Q?C+xiMZm4BnAJqqUCPBi2w//3gu7NhsbdxUZggzk3WA4Ohll0RHc1bptmOFAY?=
 =?us-ascii?Q?00XdFZAkfqTEVhnL45+HyMOCD9jXWZlr2JVTYv3EG2z3J8Yz2djQ8Ap8b30Q?=
 =?us-ascii?Q?kJqcOypQDQzvY0CSU6ZkvNEwVC+6PpRHQ3Itco+isKQ55l6e4IbzGY9kFZax?=
 =?us-ascii?Q?K35SYFbZJXnYmhmy21tjzcxzo8fA/5yvVLBN1TdGuFqwardsDTLyFHNNaqLu?=
 =?us-ascii?Q?Zuy3wyU8sicmdKgnFFquO6n5WT3UL5hF1yryT3370Lu1fpz+uIQjsgNUk9Kx?=
 =?us-ascii?Q?OQC0ANSX/Xh5rC1MCEAeD4hQcaJ2hR0p8mYXOTbtvmRF8FyqWfoVxXajgN+B?=
 =?us-ascii?Q?PgWPcctPnTrBPyohZX70J/w4K8G5+6phLExim6EUYBWmucenv1h11Thb6OGv?=
 =?us-ascii?Q?e6h7xrB4ck7SEMt24aHrak2iev3pdA3JYYpT7IOzzZxKMe56jz0ie7Dw+zyN?=
 =?us-ascii?Q?LOtVvPWYgV2kDoVZIRe7ao6u7ca/iAiN597GmFvE23gTt2ll1vjimvXL3/ha?=
 =?us-ascii?Q?Ydz2bkXRu06BejLEEme1fUyZML5N+aN/57NMJ8YVMbEJi55HR1j82tKPbPvz?=
 =?us-ascii?Q?JDGc1CuPVqcedLi0CfE3wN+bkBPyYjCoRzhgvOMYeXRkpNQXqOsmD3Tb3WOE?=
 =?us-ascii?Q?Vh1gz53sGIMqqxjAw9S2aupNVq31dMhIMiuaeTg7h6MifqsSxr99qdlvjyDZ?=
 =?us-ascii?Q?AQYtuujjoLOuB58Q22haPIODjMEeCoEOKbY05g5aJdTaCMzIlc1hZm4vjGlZ?=
 =?us-ascii?Q?pIObrCSXrcVeVfADvc230hUAzDuIfp2AkJmqXU+wsUno/qc8ZufUEubbXYHH?=
 =?us-ascii?Q?9khdeCKLNbqYd+YvLDFmCG334ui6VEVrqJOVGPvXriLeEQTxHmVhQDafZ3jQ?=
 =?us-ascii?Q?tK7I0Jc4Jjz4uyfVcclfVHmnmRS7VGo5CVSZX11oqgRyrjG8PKgP1ykX7ae/?=
 =?us-ascii?Q?rtkubGlyGH6NHQ5ByFZ04gUIeIn8ZtHwnPhH9xS5MOQgzYJSYF7zWRf6GugZ?=
 =?us-ascii?Q?5ERxm6P1L3j9RXhABxx8+Z/hcOdoqmJHvs5jaCeM3Xk814g/xMMKI0lCTWO/?=
 =?us-ascii?Q?iMAUUit4tEt3Bk2Kmj5XK96m7tLBkR2tu3LAW60iB2FH23RbxxCL1t7OVfNE?=
 =?us-ascii?Q?o1V5siODImZf3X2oBmir0ZlLTE7g0coDxzDq+QF6GdgShauX6DYKcfzvFRRw?=
 =?us-ascii?Q?dGqQuUlVONAhzUJp2m0Uo5SOn0R2JWHKM/X2PEc2X2xnneboo4sGOZbpikz0?=
 =?us-ascii?Q?T3xMkZ8xXrTHZ42JVVsjgmNOSct5dDKL1ZI1LUTojPHQU/1KqW5krjY6GY96?=
 =?us-ascii?Q?7GyFpvCsG5wRpKklX8Grx6HSX1BPt5rdQR6sdxpp+gKAP2ZjbqjFnQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8+IImz2InF1+svTyMCLGYQS60UcXS88Ad4gdGPIpazW2d0nVL7CW48m5hf6/?=
 =?us-ascii?Q?0kDEff5/9EJ6ADex/WW87L5FDCPSZPp9v7+pakD3S3CPfiDiD+/oYlhpiYsC?=
 =?us-ascii?Q?1LIoaTbUp7JI1vEwf5HERkErlaD5cMSy7QU0vLfl/2rriO6XalUKnGVArvfO?=
 =?us-ascii?Q?/jszeMCiMTDnlK0Ju7Ya6tN/2futqoQ4Uvi6k7B/gabRw+BjQ1TYwACX91di?=
 =?us-ascii?Q?PAw+/UCnY+WcS5LPGY0pRKV1VXSTjywiovZAOsvC7ZiXuoo9e+yWZXuCC702?=
 =?us-ascii?Q?vuSIaIoG+gYYkcXaq720fSvAsegRS/rFbZPB5Wtb0sXiTAKSIqWYc0nj1WAx?=
 =?us-ascii?Q?Ba4bGfoWmDwWgElwtfzYNY8PPHx/spbHjrveZ4PslNWZXiKK5EMI6IsZ3+IN?=
 =?us-ascii?Q?Mml9kr29HB4Va7LpFnyvIK+/HjOBSus1m+aR97Fe0xeL+NFSJj30aDTg6jTd?=
 =?us-ascii?Q?ETcbyTdymNoqOnqQDwabyynxnGqGxGpatm1fn0e4OLKzoTqpEXkB1U2yu3m/?=
 =?us-ascii?Q?JSNrUNp7sGvZ+9P77Vl3QCWeT/1ow+zsioUD4h0NrfoLAoScSFxeDI77KA1g?=
 =?us-ascii?Q?zucwIAKAetAlSZ5dBvhYV6SUi4m/pPVsE3uZ5l6LD3bcdXgR/JSTeJaJ305n?=
 =?us-ascii?Q?wF5FQ1YbPFjg9dSoPx4AyR12ig5qzAfIoewyrMAZknlR7Z8UzP9U/EHwC5lw?=
 =?us-ascii?Q?gIWMm0m0amzDCys3o6rKBie4liZ0gEEI/+CUKWJ6RWF+GqUVY7BnbP4Iy03C?=
 =?us-ascii?Q?ZOHig0P5osZSui6hr8C/mra/qigOwRNaJRcykcKeMlcMUHAcUuX9R0eS2UlH?=
 =?us-ascii?Q?xLUOJsoV0P7OY9xuwlzl769hp3HnF65k/zRcipIbjek4dcTzqZaBbA+c8ymT?=
 =?us-ascii?Q?yHbICPZ8LS3Ubu1rQQSyh4Y4wRRHM50M7wlVNu3+17L5i78fYmQzDG3KYtz2?=
 =?us-ascii?Q?+EtZXmlUBFjrqcrY4juHYht5ftGx/tO8s4t2LFhvNamk8P7h0+IZ1zEjaBA4?=
 =?us-ascii?Q?Is8zWvIsLqcSpA5t57HdNLptfTAyAkYDhRpjAVwBBYd8N62ypEZVZhQeAUlN?=
 =?us-ascii?Q?Jj5p0OLzf89g1d5APrKl4riHjcXFAhERcN9i8Y6SkS+Zq8p37c0aORligYe4?=
 =?us-ascii?Q?T8pRpMre26twHKLVT1D8XgQF8GjHMuvijKuiq0qNQC27xJRJspFWW9EcqIfn?=
 =?us-ascii?Q?GdKfOi2UOZPOnSKtKxwAM0AzZIHbQVH6eNIDiuDQw9wv4Dt4+0AdV5qZPLKR?=
 =?us-ascii?Q?ZmdubbQ4yOM0rod8RhsOCJw5AFL2pGWbSKPgy4xy5PPxbXdOF7wtkfICj9C1?=
 =?us-ascii?Q?Z5hrrZ8y62UvsBFsk0TFq/E2vjSBvbAvl05vC07JXSWko5fv5F+WrKcVUduP?=
 =?us-ascii?Q?HqByLUW/vd0uG10tusY2LZdfIvRjYu4u/BAXiFhACNWRXvQOcW6Og88z83TR?=
 =?us-ascii?Q?w/rCMV8/4I3NenqGM8ae2S9+IXohFuqSBiGMMys1+yJbNdHXyAl2dXVwInMQ?=
 =?us-ascii?Q?mmyFfnPozvlV8xYWC7VUa4F8OHGDg3gE+lc+BPAtR02AxC+XRFI/41CzArID?=
 =?us-ascii?Q?/2LqQXbjbTXjI1xWMCg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4554ac1-f04f-410b-7af1-08dd9dfe185f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:41:21.4933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYk3CKmW87rQHH5y7jpxT/0uhCxCiuJmAsLyuunJ7GurqFbalunDK0fKPpELxo6z5OPE9CUs5WAEz+xecEW7xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7604

On Mon, May 26, 2025 at 07:29:53PM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> The RTC module on S32G2/S32G3 based SoCs is used as a wakeup source from
> system suspend.
>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 8 ++++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 9 +++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index fa054bfe7d5c..39d12422e3f3 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -114,6 +114,14 @@ soc@0 {
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0x80000000>;
>
> +		rtc0: rtc@40060000 {
> +			compatible = "nxp,s32g2-rtc";
> +			reg = <0x40060000 0x1000>;
> +			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 54>, <&clks 55>;
> +			clock-names = "ipg", "source0";
> +		};
> +
>  		pinctrl: pinctrl@4009c240 {
>  			compatible = "nxp,s32g2-siul2-pinctrl";
>  				/* MSCR0-MSCR101 registers on siul2_0 */
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index b4226a9143c8..e71b80e048dc 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -171,6 +171,15 @@ soc@0 {
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0x80000000>;
>
> +		rtc0: rtc@40060000 {
> +			compatible = "nxp,s32g3-rtc",
> +				     "nxp,s32g2-rtc";
> +			reg = <0x40060000 0x1000>;
> +			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 54>, <&clks 55>;
> +			clock-names = "ipg", "source0";
> +		};
> +
>  		pinctrl: pinctrl@4009c240 {
>  			compatible = "nxp,s32g2-siul2-pinctrl";
>  				/* MSCR0-MSCR101 registers on siul2_0 */
> --
> 2.45.2
>
