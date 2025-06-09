Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012060.outbound.protection.outlook.com [52.101.71.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5354AEAC7;
	Mon,  9 Jun 2025 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459591; cv=fail; b=aB529HLL5nR+3oIWL2zPV6/l+P7btttsKW4tNSmNLp9Ti28x0B3zOFmFF6DmT7UXyiA00k+xYBsHsSesV3ycPhlE29CIsNUhEDwlRmDMVxEa4+gycNkrOei5viB7OaleBYB4cpjqVoXJGqIfBBR82viXykLY3hpfOUUdGbdDlVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459591; c=relaxed/simple;
	bh=V1bbU3qGyI98A7gJKKmEGDaNGPTt3uDnEyh9s/hAmAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z5cujBaIzAvXOEb1rX1hOeDqgsMdZaUS36NzV7VLreZiJyYFpwz4tAgLabmuKaAvH6sDW3dijEBcCf9ZhQZcE/9OFqNN3wpwTB1Ajg91FBOfLA1/bpg7MGCIzHR8VhgklXojv/IuOoGyFAQ6Ommvf91K3DW4BecPMe6vCpzBSDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VzoX4hay; arc=fail smtp.client-ip=52.101.71.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VzoX4hay"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIwz377wcsdNMHm4b+Saif19kCo43/YqX82mSALr1cgtK5Tm+naDbCT2R1Vw+8E0fbFvJUYKF1LYwzKU2XZZiPdWAwBl+uhUSZOLQaxLWC4ZlbUGdp3F/HXb9RSQF9vPONfAvKSBh1HuEFRAXj0hCU0QA/X/embopOEF/VHxfODopvWvoi0sV39bOpcQYdCnKrZ7J1IloOX5ZKZUeP9xALVqy7RfM4fz1A3nLFcNUuMvJg5TkofbW5fEyaYMHbXEZS86QVUguMzcv926LUSx4BL4sk74n4HKF0W/suw2Ae4l8x2uRBfOii7GnpSmVfLgLBpk3kOvbUYWFLhboocjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1bbU3qGyI98A7gJKKmEGDaNGPTt3uDnEyh9s/hAmAU=;
 b=yl79gYjD9R2r9ODT7hYNu8veL2+h3wcO/aW+uTjMxfluWjdoHWH3Ek7CC2KaTi1qL1P4kVVJJ0t5AX7YjnHT2pQgJxNlAfA1tDonQsfV7lzOp3CJn4xnO0askTZZ1lod2dxa7loUN2ORY3cAB961PHZ68Kc28uVhiS5E+58iK3YqSDCgs0xBmBeG7/p4KM8ULCxUZkL78bidMpX9AJXTJqpgadu6Oqc9X8XyVUBLQnckADTlOCaIXla+wmY/TlsDk7L1ZOUC6KwvEXkJ8i09drANAwmCudLtWP8y8H9+zYem8DNU4WDT1L6KZFsXmwmZwmMSfgvZKLKyFUa9T5ryDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1bbU3qGyI98A7gJKKmEGDaNGPTt3uDnEyh9s/hAmAU=;
 b=VzoX4haysaMT6tj2I99dbSSbYSsB2rRkwsMgthZD0TNOPeD8YEgHRuo11bPsTjGgp/LNAK8OCFuHxro17L8F+SEboJxfS1znRsHl/drfQQ9r0V8l1nUSIsMYvzt808IFngMiI55OrANW6hPq4mFU0CDQTLvAZn2uLTr0NFTsQ6zGfBvctknbJr5QagFO/WXerQ4UKJ0M7lDhFeNDBaxGCvw0VnhZ8UkDZjnEcl749iiUC2yh3gcI6t/f6dTTjnelC4rQTuQmIzseD6m854StOBmsvHQkoeZxjpV2IHe0FjDSseq2yh5cR0ymCFaCn0snHrD6CT951aco+LIH+xKqLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8628.eurprd04.prod.outlook.com (2603:10a6:20b:42b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 08:59:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:59:46 +0000
Date: Mon, 9 Jun 2025 18:09:53 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] arm64: dts: imx93-9x9-qsb: add IMU sensor support
Message-ID: <20250609100953.GJ13113@nxa18884-linux>
References: <20250605205853.1334131-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605205853.1334131-1-Frank.Li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0126.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::30) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8628:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f96f0cc-4000-4851-d4c6-08dda733fb76
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aB2dolf57OCjLTb1pHwHqGMTONU884K5W97R8QOEoDaYtDyzf3DKdBOPgha5?=
 =?us-ascii?Q?4fOCBGi3iXCIeRTfwje4BKF1YTODggfLroHvrmGsZv36BbVrgYwtE8OlDpQ1?=
 =?us-ascii?Q?P7ZN5mmZKl2GBLlIPTedX+40z+Psnr/DEFo+mfJAm0QV0igOe4AsGncBd3p5?=
 =?us-ascii?Q?bAPUvKzczCeHEHp1NrdmbhpSl/7Z/gFnRMJENaxA85L69BV3n8GAZemIvhJq?=
 =?us-ascii?Q?+0jhrj2nMUG9gy0SdRq3V7QBqbU+m0NFj6R8wwHanY15ONew37GccOovoSiu?=
 =?us-ascii?Q?dx4dDL+7Fh3KVPBgE7yxnnDnTaw7sBPBCdSkXyZgiHSn+u/+Y7/RQBLI0lIs?=
 =?us-ascii?Q?/22bqxBMsMNf4PKxrneLnzYRWxa8OzqB/zvcFP8vpuQwiQJ6B0f6gefyKG50?=
 =?us-ascii?Q?fG3bn0DCHltUbB00hQiZGw5cB4YQhuvIZGBtQwCzdxUdaHht5QbxykK6ttqS?=
 =?us-ascii?Q?P+nb1Ol80L3SSIPIYc3BUl949qSSa2/uv7XNVtRNiEGV4Gr/dMOQ0GuL76gw?=
 =?us-ascii?Q?mHUd4T9rFJ0kHwrc/Dso+hxoiikrzVqE0sJOpYAfe3RxBMn9Y71v9m8WOQdJ?=
 =?us-ascii?Q?j5ZQuC7KJwdXoKH1sqWxs0KuiZqsSNrKFmhNGgu4NfWx2rNCuQMPHvH6byQw?=
 =?us-ascii?Q?IMl0yeARtDxDu40wT+bNT/AxM/1ksmRSDA7VXl4MnnxFaWVe0RsDt7juMaZY?=
 =?us-ascii?Q?wQ4pEPP0CNECuS+T5vAtsi3nIdNbJdw5HeP2LuanN8/a1E3irJ4/iSZFfnX4?=
 =?us-ascii?Q?fjPm5P+5Pel2U0QfeRyeDhgJMnfn++y9OxKNzBnLgizTAUreXnmt5RDrqxNU?=
 =?us-ascii?Q?E2mnfJTh3cFfWofpXm+aCQp6RNME66JnbU+jV0v67u773rlI98hMkXaBWshs?=
 =?us-ascii?Q?3RO5wIkRGcGnflWBsJxrN5UiCmDAwnOJsu72OUuvckpHbo49d4SRsrNmKn+R?=
 =?us-ascii?Q?88t7UJOhc1nzAQegc3TXiACyr+Xuo1ecxlHcXFHsLHLFsP+OUwuPZlWvK0Aa?=
 =?us-ascii?Q?7ucQjYMmiqgi3ZZrNyrtWo5SRO9iC511nlHrbA0hRAVSUZZ56o654GmITpZG?=
 =?us-ascii?Q?ris9t9Aam+aSPa29PemkNEPnlN6MLh5J2NoRPF8dayiO0IivIZLWfg+wj05i?=
 =?us-ascii?Q?KszrwCxjIyNXYTIC282CVmAlRTnDARJ+gRwU3NTb+Y6dE/27Q+0PMvsZyLDJ?=
 =?us-ascii?Q?gsGCYauikw6XnW3Dts+J9ySjb6+MynIM7dRzzVWkdO0ypKH9pVMbGJSb+mFL?=
 =?us-ascii?Q?1K6Vf4M1LXT+GTcw3cAoEbBHDz38gvlkAURHcXTko2B5XaYWiw3/lxLmK5+u?=
 =?us-ascii?Q?Gd/cT4wxuHJTIq3Keq+Vkc2tkX7hxtF63+XiYQsv5C/bBhywDH8FFe3lEHQl?=
 =?us-ascii?Q?Kda08DjxFtGiw3TtPsKPzX9V8T+qQhjRGDY/5tyB3U35o1Hj7m6v+8CY/ecl?=
 =?us-ascii?Q?NtDXlKcBsUoscVYhV9wsZYDE+s8Vf73cbWUH/k9q7fiyan21nv17Og=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BzMmAUy27H7fhIrqBOxLxNLV8SPS2AqjnWKwA2Bw7y0ky0vimoCAG7Bw5z2j?=
 =?us-ascii?Q?jJWYOAAOd8rmRcQD5dzjWqYaFNDrSuvorVLoBUu3xGsvtG4OsoNqH6UFG084?=
 =?us-ascii?Q?c8q8PPR1gbPIRK0yHKWeP1tDp1hto74xwPu8gZFCteDnEiKHpp9w+NqkyyrH?=
 =?us-ascii?Q?Pp+5W5IIj+zRqPDtnKuqik9VfVGnaIALd8qeT2GXuXUqrvmEEFnzxVEENFno?=
 =?us-ascii?Q?4xP+oXjAx687tdNYkmPv3nPYHGjnGoR3wedIDkx0TnO2djk+IZztrCBXISPX?=
 =?us-ascii?Q?RO6WQ/zBL6riiuFxH6vlIORFGpn0+1Jb2510Ex5HLyON3YJ8Ucovts//lZSz?=
 =?us-ascii?Q?ClLGu73T9/lKpqDI1B1UjOgR9cKYrCFYN0/aZwP58R8coPiqfeOo25e5dU0U?=
 =?us-ascii?Q?8rRFiNoAVzgGFfdnagla5LnO2Vvp9G1yIXYyOkn6XKjs4sArsDfAnj0TQ9/o?=
 =?us-ascii?Q?YzWmgpw1J+I+kIE75JE2hp1Rx/m9d4shgBtFE5oGP+T2Mqa5QFprY0Sl5QRc?=
 =?us-ascii?Q?RqCKB+XOycYz9j8PW1ch8ac42hX3Bt30mDh9U5pal8WYEpziYJAcxWE6amV5?=
 =?us-ascii?Q?3A9bfunpGAnU/qKIaOQ+v1kW0qouaZgf2RO+LEUiaoG6QfoqjLKLva9VKm8y?=
 =?us-ascii?Q?cb7FOtc+WOyab0Qio80Bg6WZP0QyBERM1/LE8iIdu4FTxY7HGUeJRB3T0CF3?=
 =?us-ascii?Q?SAwf8icBb5lMIzZc63Jxnm/fF+igATRnfNfBjU/BZ0c7FXyCuNYMFwPSqCrT?=
 =?us-ascii?Q?lPovKFlP+l+NnWpKKn0TO7KuJt9TrOTeT7orwNwnS3JYiJ2rzOfpYBWD9goO?=
 =?us-ascii?Q?tEKjbnrRy2T4KSVxVV0CDNoBCQ35VdCeCEMIxgwc1gDklSCy8YHRLArK1fLs?=
 =?us-ascii?Q?XgglujLUPH5PkbXvLhMBYb7wdSJ1OEjfMSZHk9EintkB+Y70WpjG0Z2T8psQ?=
 =?us-ascii?Q?8qZGjwk1Vf3Y9uWubIwmRWbFwroeDXjp9olohqELnLe6+KpuQxgR9+nv4Jw9?=
 =?us-ascii?Q?FUhLjrVeEmluRUDhx7NPNrWKT48RxwWtFr3IwcM6Oe27R/PpFOF58yRQR/VR?=
 =?us-ascii?Q?2yXK87WJciEV0SvmrUU6CZmMq1oqB5R2+pJUTuzuXA5IMMxaau4a0wcgndy3?=
 =?us-ascii?Q?pRBud+WN3s9/EfsbnyabD+neuvrbLUhY4nRGY+0NJK96oIUJtuiihr6dxYle?=
 =?us-ascii?Q?WwNWkhqCt/eGUlGVhgyZV2CVamiRaLNn96lhMLchfqWIDyjODy1RhZ3J2Qew?=
 =?us-ascii?Q?pNXVFSLT+rKB9sWLXekA/pyzT8WIJK1HN9iLIW4DcytsDdT04q9dDur9YfXA?=
 =?us-ascii?Q?5DT32bmdIG33hMJ3X2zO4td3VZpZ8hHJyoyQQQc3R4tTAgDBLh4GoOFG8a2R?=
 =?us-ascii?Q?NYk5tBtKqL+KdwxUyUAjqQeh8ye5LFhicVsoxq4y+gy6PcaICtPqNgRTrYdu?=
 =?us-ascii?Q?0jIR06HcuRQP5P/8nWTFE2YrybaXx0nfZREWCzqp7cZfYBY670ZZRQmuU+jF?=
 =?us-ascii?Q?Dw8Q/nK2/HMmshQZoxPPRtqA7C9pboqceJirJqitvkZYp8KD3kz3cUlrKuc1?=
 =?us-ascii?Q?MjpuGbz7YRyYvZPdV7EM1HjrqoyiX2MAgVjbThom?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f96f0cc-4000-4851-d4c6-08dda733fb76
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:59:46.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USq2MoaW4arj5Oz3jI+zfFtvAUltlw6MacNVOP9cuUUxQ0RxxIfw3v/8janzNfhe5i212A9Oltj5Unlgo3qd7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8628

On Thu, Jun 05, 2025 at 04:58:48PM -0400, Frank Li wrote:
>From: Haibo Chen <haibo.chen@nxp.com>
>
>The i.MX93 9x9 qsb has a ST LSM6DSO connected to I2C, which a is 6-axis
>IMU (inertial measurement unit = accelerometer & gyroscope). So add the
>missing parts to the DTS file.
>
>Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

It would be better to add a cover-letter for a patchset.
