Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA671FF1C4;
	Fri, 13 Jun 2025 21:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749850689; cv=fail; b=nexJGYFZRhgyPP0X7LpkR2vQ+1InIO9P5/jHGE/AjlsNPKTbpKH4CldN9zIU698AdO/bCikshXg1LHiXwH92l6f4J7L1wwjRJ5gf99s0YijLJbbXEg0//lo1PX9uLg601ecZV1SPlRyPrpJFaXuBOzahxt34ze6KIoBZoDDSpXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749850689; c=relaxed/simple;
	bh=ESZM2ilTwZb7FH6i5+m2QYpG5Hnkalie9Aw//DstId0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Pi8J/RgkRifNjgTobYS89TpwqtaoVZVseEQxpWbeDaLfa3cFxOcbThT+6PDMsg2VZ6mRLnnnpU+JPs6iu/AFteXJ7tguy1E8vFsUnwNAiAMCq528btD+fJuqdBy9FUxwsALokPtoIab2cs1VvqkEcWaNmIyU0IVrfaepEjwqLxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O7+4WU3x reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O7+4WU3x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJLkWnIgUO4+VNutAeWTs/0fCI8ojySnqLMOCP+Rl9qWfyMN9OcjOKhmfVJGjTnrK+/TtNDC1Tp6j+Sm7Nk0AOZLtMTgLYuuvoQxHbXKDk2fuSuTyMZ0yM6V6ttOscGdmvOi4W2mvAzy6HZdci/QCEcD+LflhaOc+P2HynQLm9wP3R9VpIlJzFtuGbWLoeiMHF1ouxNKBA8x022z8sfg/Lg/S5nyrcSM45vAZudYTJC4JmirSaHvLp6rAT5fL9VZaIALNpxIxoaKY3QBrgrs4w9Ck6rX6FbyvuLJHTRPlIn34MPO0DD1b0hSpHxsf59LbHKEm7njQiTRLxNV5LmbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFJAvsV0zNOqPyCCAPdhwbyV3irLpG1oqJK7Y2ShdnM=;
 b=szsF3u4kCLKnPP9Dd87jdbRWy+sSeV+x9tBmekciGWhiTFr1hFndDOPgQOXly29HObwItwaxkmhWitfO09qw7l/oZd7cVbCsSR4qx5KKwD+nSwW562NbsZjMz3tYaZTGurASTEBqOmPNCo6WAN8q00cA8Pfo/XVMdzw6xwxkXP2g6xRjtL3h68nrKApdiDZlUmaLU5aphs269AcNWunzD5isvCVA0qLe9AL+01GvAr0tiVZ8r1Svf+dcE9KxRxD5jST9CZ2zckEu/+aMWUrfpjRWAaMKZzsgACNp9yJcuHW0zZSpV6HeHA3LbV+DweOcp4++iH4CpEHmxOFEcIbsqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFJAvsV0zNOqPyCCAPdhwbyV3irLpG1oqJK7Y2ShdnM=;
 b=O7+4WU3xZceF8nqKmfr601lWn4y+iijV7AXp7DAJnZ4vrD+J6J5qkVW6PvVK41jxK7F0ho8RBhbJDi1HF39R+jqgOP/3xMJ6MRdTRjAJmd4EubUb0pxzBv8O0JAr1UanZB08v90JNTjzRk71bb7L1lh78+ePQQd6dgVb71QrPH6SY3Wd7S8zHiyea1L75xEJY9lAWIS5BEDxY4AFZCTaK7lxmcVcxvZeu29tvp554Nb8gYpv/TASyOEu5rcyrgp1yMnA3D8lzZgEwj0k5+lX8yxWUxkq83gMzWqzll5dVAgmEEMcxsjTVcoBfMLfHAcyo2C4Swb9lwH/6RLazYOMBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 21:38:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 21:38:04 +0000
Date: Fri, 13 Jun 2025 17:37:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx8mp-toradex-smarc: add fan
 cooling levels
Message-ID: <aEyaNEFl3gD6snOP@lizhi-Precision-Tower-5810>
References: <20250613-tdx-smarc-imx8mp-fan-cooling-level-v1-1-59aae8fee2db@toradex.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613-tdx-smarc-imx8mp-fan-cooling-level-v1-1-59aae8fee2db@toradex.com>
X-ClientProxiedBy: PH7P220CA0102.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c98fae-90a3-4352-ec5f-08ddaac293f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?+7Ijaa5Kn6K9leLQRV8lRnbhGeoqiKo51NLG2T54EtvPsMwa2Y9UN+qmLI?=
 =?iso-8859-1?Q?6ktAvDBcEHSEhye9aZpn0PGLOK9gISdgPonMwQrdiSiEkB5UaZPHCd7Kk7?=
 =?iso-8859-1?Q?Cu4WWoofclB85qRe0oEKZH+x6u1kIVUttVsHbjpCn5tEGkEOn5W/grqCzn?=
 =?iso-8859-1?Q?q4j27Lz8W4UDDKLG/9TSMrIU92vK83bVzVouU3C/ediSnRihHSagrR8zle?=
 =?iso-8859-1?Q?YOWSqmnIrtVFzqIss7m6kt5dUXPpEDuqJlUiEFfh+6nHmv8j0xf/v/Jnsn?=
 =?iso-8859-1?Q?E7HiE3NdMjZfYdmBrlIerLE99aDIMO31TA8di9SeevJWhcNVV9rultbDkZ?=
 =?iso-8859-1?Q?GclPaxEURbgtq1gfXddBhUd0mVUpqM6VExeHyPYkRRM26mhDP1MBOZuzSe?=
 =?iso-8859-1?Q?V7r/XY072SB1cqQC59DdzCSjc8MEOpoKJNIPJrvQxs5ObSi4plC07lA2eV?=
 =?iso-8859-1?Q?SFVS2nfEWYrQbvm9RrUWzJFtzKKz0c1jEHAK/NHU2KRfq41L04QxFD3LXN?=
 =?iso-8859-1?Q?RCa1XVqmbXeqIh9ZnP5HUHsmkiy3wPnQbLKgLjFi2xbl6KydpyIECCRuaw?=
 =?iso-8859-1?Q?eq2eU3EG36rPIdpKMkkUtag6Fhc0O2NssXYPGiMu4I5PqzsACpQXAqBD/4?=
 =?iso-8859-1?Q?dhqYYR/8oqhNGx9S8djbuxi80k3D5VcgYNbTMmdCStzIYTOGx14YVkjPMA?=
 =?iso-8859-1?Q?rLY6aRXZZdhy3xLu2qJ9FizQ+qgy5JnCgQi1mcjTZ8DXNNw+WwnSQ7niSp?=
 =?iso-8859-1?Q?zyeBQWc95tLs+wG40qll0TsUzfiwK9geC8JxbWwPlhy/DRJ+i5tUnAIwwV?=
 =?iso-8859-1?Q?4CIYR5ak3VHFpXVdmLWVrPRuzxQmGru5dzgsrmk2ZE8QVts0l6aR3XUYIa?=
 =?iso-8859-1?Q?lt+SOeZ8xVph12SBlDsyDgy3wo+ntwtgpeBHVoIDIW5xSt4Fc8+RMA3wIy?=
 =?iso-8859-1?Q?PelE8jcaonv2VaaCmMILHtt7wsve2hKuWWlAl7LGc1IYoRiG63WPKIEEqC?=
 =?iso-8859-1?Q?xVI7wTmWarjRieLAId/HUu1s65kj2/s3iSlCFXYddXqKRP1FaJZtyirHxQ?=
 =?iso-8859-1?Q?aE6vycSbWYV0+BpurBPJrWSTi3UMfVzdkJFIcD9Bvvh3nMM1TxOfZP2tZN?=
 =?iso-8859-1?Q?RM7A8VLlf18KIb3YJLcpUqx51qK1g1WH9ac1s5n4qa7HlyrsoH3+XehC86?=
 =?iso-8859-1?Q?kX1v49aP/rqv2I87eqBjf+8xSXzf6XynXPEzvYFZngYJy7plSi4z64/rlS?=
 =?iso-8859-1?Q?dO04hHJX4Ahp43qqv7yAIqKJGry7S8YrzCZujJWRBuKmtKmmpRddtxBCfs?=
 =?iso-8859-1?Q?IywbUrdcUlaAz/eEs0cFn2+MM0kIr6tgkmyJRMo/icHVtW/1mHYQvQlVUn?=
 =?iso-8859-1?Q?87veQSSFPzR8I5j1s8uusWj5N55z3eWn4Zbah8sT04SLM9xJ7refrAGWE8?=
 =?iso-8859-1?Q?HOp+6nujRlcr3vigbnAQlYkQnXSP3gwlt9+FY232PIwkX39XeqdKDexKaU?=
 =?iso-8859-1?Q?088vNiVYj1veasBcJvwa0Fi5dn5S6a+0eA4NYcFFMyEQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?wOQQgwXsGMqtOrj+yGyZvBin/vtCXkgLmB3ZuriNS3RSnLu22pp4aZlGS0?=
 =?iso-8859-1?Q?Gj8cuVoA0F1KKQYLYWCz3zvRHjw34D6qzV78vM1Sih45HEi66d9mn0DdvR?=
 =?iso-8859-1?Q?MWNAPkP/l/N1i+eyNLnAnhaw6myINLE8rdPtvi+7EID0nxn+tqoYsqIBq0?=
 =?iso-8859-1?Q?UNQk94j8lmsy0FuXnUAwZj8M1Vop3om1RCLnFYK1SKJ5qWiH6UDLXBh0SX?=
 =?iso-8859-1?Q?Z5w0Aa9+W/uf79yD5etIW2gniWY6nYVqncN/IcpzF7DHcnw5jo9nRIWFbM?=
 =?iso-8859-1?Q?dypoK8MdYgh6GRvELysc/xgKTef50y+5od7qWNHpixy9NWhruscqd9BTIj?=
 =?iso-8859-1?Q?w1GuIAsmx+DTVVttjh6lLt08k/v8xeTdN6ezvFw01J5jcSKARoAjgsJQJt?=
 =?iso-8859-1?Q?BB5exsyuNSw3AmnLce2K5zaV1rmpxpjblTWy4eqHQS/iIXQDkkWI3IYh7f?=
 =?iso-8859-1?Q?jfGjQLXXnHUXaYPhLXyoP+M2+inSI+pwGuhyWhYy6jCO6RQg1aQqqPpYq4?=
 =?iso-8859-1?Q?DGSnGMlCocGOFKxoy6xV8bRGbiA6XzQHzgoNQ4BZ1f4bhGgXcK0IARIrT5?=
 =?iso-8859-1?Q?mMOleYwyMI+/qQIiJeSOq5O7obvkfgaMquXnWfP+b58th5xromc30QK/lX?=
 =?iso-8859-1?Q?apxB7s6Y/D7iFgn8+fWX2iL9AViCi9+roAUj5Hs3VUh/RGy0lh/oeJxpqX?=
 =?iso-8859-1?Q?P6YcUd7BC/DtwFoXXoE4RCtfZFWTzzmDagAj3PvsukBJEJq7KMjL/crAR3?=
 =?iso-8859-1?Q?PWERgJ6LhJ1YXzSJ7bK9gpzn7EalL4DZa4sgbwqsSyszEmWzce0mdL47oH?=
 =?iso-8859-1?Q?nfsHJkpomvoURsqoMLhGOZtH6ERiQdZE4WzXXQVzb/iWl1ZA1K8y5C8fYw?=
 =?iso-8859-1?Q?m4fgrUM9pVIRukdmCXu7SzdMufyg92k0KatOi5Jdef30mSUWOddeiSXZLQ?=
 =?iso-8859-1?Q?WYz2ywfd+vhn8W49LjHjvIeCsuotNWWFh2kaxnwdy3XFs9XlhqVELdDSva?=
 =?iso-8859-1?Q?U/ESXFX+8cylVi3pDZru3jwLNkshRP7WvHRavlS5oBAYg3tT6APdW+UcKS?=
 =?iso-8859-1?Q?QUvcfvl4rzM8gBhUQlx0XSLoMctaAU+CkrX1o/c6gqJCbqgiG49VDfVOHC?=
 =?iso-8859-1?Q?cOHFC37b3tw4EWetyK0tTI2K/nuOd9gatpd0zXCTIa4xGJVc5wGEN95pS/?=
 =?iso-8859-1?Q?yYi9uMPO0fiOaJC3YE21cOBOU/riJqlfTRz3mSbTlrLtDLJ9OhnjpqTxOA?=
 =?iso-8859-1?Q?5mdXvFlMiUFFxBp0RLxLJqWdgQrMCekYMDIqHIxjUa9C13x3KzuQ2LnAM0?=
 =?iso-8859-1?Q?GyTukKFqrxkh+yYBiJjZGPXD0K69X2wDkv1AXQNvcZ7sDmeE+q3tpanBql?=
 =?iso-8859-1?Q?CgabpoMMq9YPuN2mCHadWJzem4mJvzUzfM42YiVqIt0xGqh4+MNIWCLqQl?=
 =?iso-8859-1?Q?IqxqvxtuX1iKO91OQeCiKnAPwgBHafzhQ2OkWOnF+ztm5UINwFhAIw3LCQ?=
 =?iso-8859-1?Q?O4/c0OSQZxTbOoqQa4Yz08J5NyRv6z4b2qlnyb09HCkmTECh1Jat0Cj+OV?=
 =?iso-8859-1?Q?F3anFYsI2w1rPWKQf9hlZMbAn+FCtzbz6eaxB7ZrJ5IRxLI8Gunqk17S9W?=
 =?iso-8859-1?Q?U23gk1gfapZYi1dsRX7eldeXOCCvUdDqkg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c98fae-90a3-4352-ec5f-08ddaac293f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:38:04.0491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89V6CwBVbTSg4txwHsBpn+1rhsvbE8H0DFI0b8GsEh8S5Cs8frBUiCD/eGTy66toPjEbNCudB18UEShHiOjC2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8582

On Fri, Jun 13, 2025 at 01:35:04PM -0300, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
>
> The fan controller on this board cannot work in automatic mode, and
> requires software control, the reason is that it has no temperature
> sensor connected.

why not use built-in temperature sensor

tmu: tmu@30260000 {
                                compatible = "fsl,imx8mp-tmu";
                                reg = <0x30260000 0x10000>;
                                clocks = <&clk IMX8MP_CLK_TSENSOR_ROOT>;
                                nvmem-cells = <&tmu_calib>;
                                nvmem-cell-names = "calib";
                                #thermal-sensor-cells = <1>;
                        };

Frank

>
> Given that this board is a development kit and does not have any
> specific fan, add a default single cooling level that would enable the
> fan to spin with a 100% duty cycle, enabling a safe default.
>
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
> index 55b8c5c14fb4f3e7407243760ac01b0aca0dacf5..5f233304cea747d3f04a748265f96696668c9d6b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
> @@ -213,6 +213,7 @@ fan_controller: fan@18 {
>  		#pwm-cells = <2>;
>
>  		fan {
> +			cooling-levels = <255>;
>  			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
>  		};
>  	};
>
> ---
> base-commit: 1a2ad59da68dd294f994efbf68c5d671f6b42fad
> change-id: 20250613-tdx-smarc-imx8mp-fan-cooling-level-b67265ae2c49
>
> Best regards,
> --
> João Paulo Gonçalves <joao.goncalves@toradex.com>
>
