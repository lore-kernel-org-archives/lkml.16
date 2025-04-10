Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E252F189F5C;
	Thu, 10 Apr 2025 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744301251; cv=fail; b=tw6guZBi3/i91mJ8/cdjAyLdUYNuUAIEZegGyBd84R/EvqYVOm57AWBdMONWyvgxXAnek+6sRdfBS1VEmq1vGVB7cKV91EQO4GG2Tanfk7dJCITtgE5T48NBQ9SDubSXT7wZbjTM0gJbeEb+DymzmhpvL1HlDeytmPACdFHYJCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744301251; c=relaxed/simple;
	bh=lN62KS+5XnlrCqWAZy54LhE+9RzZMP4GW9HpzMI5Rkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mJ3KZnQoUeq91Wt0nSNJBpeTYhonl/OPMJWx6aCdwwb9iF3fnsukt7bk4YhvM1uFRKJdLlUz8uCftUoTdyLssYwevZGN/T6GnM+O2nxkzBCWq9dEyOts6XKqmWX9/WvHCpnerVBaee7iZhbDlI1gOQVuWdL5U0Abp9xxFnGyYkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F6KjeHVq; arc=fail smtp.client-ip=40.107.22.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F6KjeHVq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsRyg0M6iKVUy5zsqe4C2c9NjJbV1s+upirVnz84gsYKH/lYHUh6VjZ35rFrO2lbx+RitNYI537HPa7fWesYMeKxQAQndiMWpXrcPbAn6uDIilOvg9HQUsHmugE7B7egBq1FtoL6/5Wr5LvEHwA7ZqLM0qinW9t6/r6zSsUFOWCRRl1EomgjPRE2l39QZuOi12+VPj2NJT72AHOp1AcEpjGc9c/NnrlYLv/CiqNHq5y2NVdsUwdRAtAqb2Ve+ToHCZKz740+Rp/NQIbEGX/MqmyGA03hFw2iS6lMP2QeqcrOK1pdULPefep2zeaA0izUtD2z1EjVrB9CCmsYgR1a7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqId5nzfmhffmtmm8tBobcXZ5ESa+eTDXrX9l7/+SaA=;
 b=kXqrd9vxjDmhu6Blpxg/XHFSEW2grp66r9r1hmFfXaOlB/UUorTMCgiRHqKuH+obghe2etMLxCk5Q33z4UwFV4iV9c7sqEABBqT69BqAKraumvnkU1rONE6d+WzStl4eBB1A7nfuDYBk+Kn6UHEbO9er8lBH8gp6hRz2o06Wzfn4wJ4OiH8udy4tWkWNcXxCH/5kIza44FUqMEmFQqTU4XmPhSJIB8b0Ux4ybkQ27N+HLDIbf+7nEnDNZsfgwOyZMo22MFfBewQOTaGVn9HohH7ouILORWyHdo7KsW6jBRQ88K7chNzkMeismSAClPouRvp5tFw/dU2Cn2wnK1AN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqId5nzfmhffmtmm8tBobcXZ5ESa+eTDXrX9l7/+SaA=;
 b=F6KjeHVqiejPESTIqlVcGxX8I+ae2SqDnX1IjU4UR2xhMdToOBM9vnNH/WAgU8ZIwslIUlJmY42qqQkzJSYqD6k/dayefEkDKWQS8H1hoZwJI+rQNaNnZyzHeE8IQF3PpiXCNHXoEMjN1JvWOJiT0+uvPiDNQg7ofTL8JnH8QFgFrbNie6UT+ANafY59iqyvksKL8ZpV9T75zpMpvNKp7FkuhjC/lrqc6wf3yTTeGgbEGDkZfbPhemugyO1NGxt/9aJ9M0CAMvYVPMuMJ3chNFMYmKhDJEQ/Xa+zXqFfZLwhpHO7KCHjZsJAcuTlWGFt4qzBTSABs3NUg8PFsO0TmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9006.eurprd04.prod.outlook.com (2603:10a6:102:20e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 16:07:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 16:07:26 +0000
Date: Thu, 10 Apr 2025 12:07:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] arm64: dts: imx8mm-beacon: Fix HDMI sound output
Message-ID: <Z/fst7AzAJ3q0iDi@lizhi-Precision-Tower-5810>
References: <20250410005912.118732-1-aford173@gmail.com>
 <20250410005912.118732-4-aford173@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410005912.118732-4-aford173@gmail.com>
X-ClientProxiedBy: PH7PR17CA0017.namprd17.prod.outlook.com
 (2603:10b6:510:324::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9006:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a3ee3f-7437-41be-27e6-08dd7849c946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dUlSzBxCRmH8Fzi+6Js/vkfFBTFfRaAtxU1q7/dbCmqOSG2v7K0+LfPOSnro?=
 =?us-ascii?Q?BEs8DO7TwFj33hhUK/Gj2G2dJOe8isdYNMbBYw1sI6Uqnp/0iFMwsf/89zoC?=
 =?us-ascii?Q?0ak+9Wpks1pgxWHcXYBsM+sotrGCpbEMaaZl9uMatwuXWQ/Rgxg0bsDmltTZ?=
 =?us-ascii?Q?qHocvKYPWPnwDnbyVCNqGcBBBpkuRosmE025+RXwtkVxoZ7iNy7nJ3spzjmy?=
 =?us-ascii?Q?4ls6zmTh6Nd9SXX6P4wizQM+qizzpKYmMUgWa4SZoVSaTrJJLtkedbNOVLMS?=
 =?us-ascii?Q?TiK3u58lBJcXLp+lqmAIDZzqupAd1CiYSEkNE7SpL3fo5yqojqDj6hFPcxLC?=
 =?us-ascii?Q?ZsWfNBX71bGrdwCJcr3FNOb6enomdogkAalrAPTE0+jW+KQMrnkIQ7C+/i7e?=
 =?us-ascii?Q?aSwwqpVfoZkorJBWDhnzPct957+kc0XyAeIWZtMSoiZoJ+xetnwT+c3sXYD4?=
 =?us-ascii?Q?fij08ftPUOpIoT6Z719nWHBvX86yLDKoRWCrRDNUZbS8FREOT1gP9rmIbr5h?=
 =?us-ascii?Q?hKD4n4fX9SUdNu0ai/4vt1X3SLwJOYr6wc89q1EpwVrfFviq66sH3oNMz7II?=
 =?us-ascii?Q?IrJjvYBw3t/gQ4jf5DWgBYGz7WLr8L0sezXNaT1jx/G7wjAuwSFWDPeKbpVK?=
 =?us-ascii?Q?923QQT0znxQtT1+QUX0G/pje/1EViEyImzcVqGnmxDF7K9vse6EUL1vaCGkF?=
 =?us-ascii?Q?tBgqkktr6ENZf0wTtq9lxydlObFEWjzaKq+LrVu5vYaHzFzPHBRY8M8+VzFB?=
 =?us-ascii?Q?VqxIK+o/9FFNElaDPXRb+JtUBDSXIucoY/DT/VVpx3nasuAS22DizpJUI7Gc?=
 =?us-ascii?Q?ZU2i4YUYYvIKICrcXRNsy5KxxVCSBvNruGN/xGBfPmAbZNokTY3UuYvp4deu?=
 =?us-ascii?Q?0ng1D2D/j1QSXMFJftQut+gtd66a6HeEhfQJOzyuURdCsY7QksqtFoZWUGq3?=
 =?us-ascii?Q?zAiL+pzyTqhG4m1YTmQov6n1nRxLyG8Qe38r4c0XgtbBQYlE78KBQldIZfLO?=
 =?us-ascii?Q?B4L9k8ElAvFqR1FfiAFnujAVkBUeOXVbyW+c91cwvRy8pI4nwq02bby0K0CO?=
 =?us-ascii?Q?nNe6I01GKDJwb2N4pe3RMqHT15Q7Mn1a+akzVrXxfG67GklqOn5Aq6W+8drg?=
 =?us-ascii?Q?KtbwG/pZ1bMV1Oe19ysKYAamx6wO0t15hYJHuhyS/W4xl8sVlgtMrpKSjgd/?=
 =?us-ascii?Q?LiZaeWLkpzzvijvf98fS0N5cay8Zk8gxhrcqTk66gjj1ejTFPmTh9KhE47ZH?=
 =?us-ascii?Q?O6+ERBMjqceW05p7mrB7dDEzMEQmlx65/nivhQaX3KKNSoUQ+/GigwOBfNP4?=
 =?us-ascii?Q?x4RIXCfIiB3MuRMW+Qdcp2StU7CZI5cCSYntBA0MxVWwYZs15ci9oxByuKoW?=
 =?us-ascii?Q?izQyb/PqNfJ+to4FF+6Y9+5Fy5SC1c5kFXvg0slAdsXJhSqIgnbrM/h1vToL?=
 =?us-ascii?Q?n+B5+1pcKjud/NvWSXttF5X8VNm4QTGs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CZawudBxVF2qCJnw88LVNUKx0ovZT5+DM5pc34qLdT1sJ+pxFX1YzzlsxSQj?=
 =?us-ascii?Q?qg3Xmr9/H/GAkw9EJdDX2BrXBAHBDKLyP55IEstsCD918ikCLOAtxW61oDRY?=
 =?us-ascii?Q?HiPthcC4flpohiIWRBjIK5FTmQ/6IPGy7n9tmn6P0OyrOOlGIu9gLNxyoY6n?=
 =?us-ascii?Q?59W/hSIWHy5BBlVJCcQN/VBcgoPYwPN/kOsrFVPXzd6tR8C01DesHCwan39j?=
 =?us-ascii?Q?2MHwCyVV1wpWKFyQwWX8KaxUcRvE+FLkwE7g8Lh+jLyx05Lv2zrTZd5A2huX?=
 =?us-ascii?Q?1iFTjyd8yDyu69QV1/oq5Jhg/UGL5j6o6GJHQgI5rgyV7crrG6fkEC8s8Nfm?=
 =?us-ascii?Q?kHXMpUoxIgocchJs5JO8SDSvPqw+emyq/N4euJH7xctkmwTjLD3npRbYuUaK?=
 =?us-ascii?Q?8G9g6/e1TMcHwbqMluszcFSrzrpoj1206xBDSSAmpjGMZg1Wg3ovNHQ5hrag?=
 =?us-ascii?Q?OQmyJdel9COSo5F3xhSpsRT5RYQ0nM9jkhDhKov8dUWvkGwZvs9QPZ0G9rkR?=
 =?us-ascii?Q?gpFluWHIVMmxP17sMLrnB9sURGsR+4vMfLqoyVrk3q3PO+uqt8BfEYQxRARQ?=
 =?us-ascii?Q?ITPYMAsLd9Ok8j01kyD01UEkPZNFrQLk5pgVGds1gADug3nA6fAj4mlgsfC5?=
 =?us-ascii?Q?yDl4uYNryW+5fkPU55f7QQ5fedCJPlaoGGFBP4jHpUja7iBAazOIwho+KXPw?=
 =?us-ascii?Q?nYhcOHkgyC/ZOMvCwm4TNp0gmvIoPp6mmKaU7Rz6d7pl3nrCz3D0xXQx8sXm?=
 =?us-ascii?Q?RIgfMMMWCSNE4lz4BhmXbQNPW2rpAx6Cd2OSI2LXejvq4NbOKlsOZQQUWWg/?=
 =?us-ascii?Q?l2q4I9XukV/blVqhugaRJfIMVNOOgwE/5MgFOHGIkW5EuG6eeJ+XPttMgHmJ?=
 =?us-ascii?Q?ioLp3h/e5TNmzkEsUD3r4DqDaCZwye3cmVo0xuaOXlayq9PYLyX6iCaissV1?=
 =?us-ascii?Q?/33yFNwMLZujsg4lfYmqOuSsEL6YgKewLf1Gu9Ve85oO9c0hOcs/SZUN3mZt?=
 =?us-ascii?Q?ivozQQwWa3Ai6CwV6TQcZp61H7JaQW0oYONIlQmky1vJlvdjAOAe8rYmUw0S?=
 =?us-ascii?Q?Xw80zMuh+i2UiKUSe/LepaVgwQIPwt9wvHZcJTExqiEzIx129lkJYJJ52WTW?=
 =?us-ascii?Q?EsK2mIXma/KLsyxyOXO1McV5gNgoZHlLwx4Bv/jjgT66uEQr1ZlvOum+TsrZ?=
 =?us-ascii?Q?SDf/e8TJ/Izl1wbFTGwoPDjn51nWB2LzygokdFSEpWx3ZqlUBvwtXrhCLtOW?=
 =?us-ascii?Q?ObR0jYpc+XZP3YVbX/QgUiFzw1gp7dtmtsVd1Bk+9snm9I7v8Zdd/9SZxLZb?=
 =?us-ascii?Q?6Pkwk8Tzta1wXMx7tda589oSJC5AY6BcjSk+ttaC7JpgQHLypEibk0kGfGVm?=
 =?us-ascii?Q?h18e6vgIz8zM4Nyci2HqvlpCMB0Y8FNOcRZ6qPvd0Z7CQ60fGRa1lynzs5AX?=
 =?us-ascii?Q?kdtgXunsdjvEpkUHHUoBSJeD7G1N+4YjRKtRq2eQ0rJSUacO/9AKsqpFmnvN?=
 =?us-ascii?Q?I3julATNYaVUZ+/glWnOqSYSfmQUrwW1dkA0IiLfQKHwpOr26LH36lcbrfFw?=
 =?us-ascii?Q?sXxBIbxTxhF/En1g1vIMNCXBZOUX37yzap2ke7kC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a3ee3f-7437-41be-27e6-08dd7849c946
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:07:26.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7PPRQYMqirWoMmPWdmBhA4b3Bobvjt5zP7DcFX4BHxoW4/VPVX91SX9V9XJxIWlSGLUOS44y4lxk0fqVYIeTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9006

On Wed, Apr 09, 2025 at 07:58:58PM -0500, Adam Ford wrote:
> The HDMI bridge chip's sound card enumerates, but it does not generate
> sound. This is because the sai5 node is missing the flag telling it
> to set the mclk as output.
>
Suggest commit message:

arm64: dts: imx8mm-beacon: Set SAI5 MCLK direction to output for HDMI audio

The HDMI bridge chip fails to generate an audio source due to the SAI5
master clock (MCLK) direction not being set to output. This prevents proper
clocking of the HDMI audio interface.

Add the `fsl,sai-mclk-direction-output` property to the SAI5 node to ensure
the MCLK is driven by the SoC, resolving the HDMI sound issue.

Frank

> Fixes: 8ad7d14d99f3 ("arm64: dts: imx8mm-beacon: Add HDMI video with sound")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
> index 97ff1ddd6318..734a75198f06 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
> @@ -124,6 +124,7 @@ &sai5 {
>  	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
>  	assigned-clock-rates = <24576000>;
>  	#sound-dai-cells = <0>;
> +	fsl,sai-mclk-direction-output;
>  	status = "okay";
>  };
>
> --
> 2.48.1
>
