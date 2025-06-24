Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BF123741;
	Tue, 24 Jun 2025 01:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750729894; cv=fail; b=oQLgmBv+RZVGx9eMNlfsFfZNZrkZ5YhYRZFaLhicoxLVMLQA9QK8cUqNK9c4bvilIN5D0fuYb1ILp7F0m4Pbl34RjqRAiiUnD7k9lxKJnxJqaHyJt2+thFKQD4V0r78nKPayXsAEC/50IAXWoDP4uk5NTEatMfi65fFuEIPlAOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750729894; c=relaxed/simple;
	bh=sBPdcQO0Mb9jiPG/6uBNjDkSABrS3YpKL+NvhRhWL9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KDMSphFg2oZrZE2HPkfMyQN4NeJkH0vOkQerwMatIkKeqc42zb88jBpZP/4ky4pD4yPKQcnp7IxBcrzRRz14FqPISm9cXV1ZPjNULEFP89mGrC2haw1247ph3bQwdQAXTkyF3RHW39W+7e5nNb/tFQz+HVHNdCqWBBMRXGIjK1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LndN7vcU; arc=fail smtp.client-ip=52.101.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LndN7vcU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukCGE+k+buwElj8gXKBrKJh3L7fOhWNJsA+JiW489B++2itRq00Qr+c9JNEXeEDg+hNaKoOeBNDX09sqhdBmh235Y9cwnIqNxQ1iFYW2HN3bHfKI2kadkcVAoly59mrit2xTAC+gi3InofXtZoK3RE4IGuNOxrfm5TwQzdQiGGfiLFhaq4ggV7Q24GapVdQ7Dbj8XUBiWPL3npV48PppFcdE+zE+Li6IC8FKm1abPbrwHwXSAd8+rj79l/RKTzpk78ql5pOYgb0Uex/AoD1s5nG84sw66y6nVuO9D3YKTX8zXn+cmse/XpvwNB+UoClRuTiaUcIsDf2VV7moAf0YhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIAZLzULSJjZCFqJp6oevgzmaWICfFl/34J8vAzlSqE=;
 b=ipiMEVvTKcXjoFt47YqOOfl1B7btkTDRlJU/lZFb1FdM+xWKeMieLlm4SIZNXrMAgcVgwmLItMpr4g1g4h6eb2rCwzZ4BVZo6l6scNNFfqWn2KmO/DsSev+/GT6s+czLApXow838RdqsdfW4+1+ntz7anqTvR9dRIe8CY+avLOVX8AEDxEcPl1COvUOpS7izZr4tPWU6m4NYHu8eC4toOmsWDI+wUpM4LWGfzG+GQrRkANZ4tsWMsKNzhemLpblISCz/WDdlPJy211LFA1AfMne7PfO++OSiWpOFouBQ+r6OOotPuq1ux8dx/beMKAnmfwqu5s9IE3SUwQkufSA+TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIAZLzULSJjZCFqJp6oevgzmaWICfFl/34J8vAzlSqE=;
 b=LndN7vcU0hlWFqX3rP65Zeop4PiM29g0hWHqm5GI8rVlLL4etPZhnqdLX7VLuQtNTFeFQ3i/vSsKYa4As1EFj3nbLsU8uLWVyqLQeRfgKXhGyZIhhy+rDPI9D0dQ5rVGZG6JIh572zCVE0RfYHKA3WsRRQi42GgssmhLMAhzSsFmRHxpbY0TIfULII+SfJmBYJZ9s0GqLoFSepJm28/EkJMRZHFx+3Ws7bRwTjQpFxnslJoI0wdUieD1GJVlCNqnC3O3oexSFqbwoIeFz1C92ajKqsNZQoJKXmY0x7oWLcb8EmwHWE7FKG8eF1KMt+TXZHwkgMWpxQ+3LLt5a3N73Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7450.eurprd04.prod.outlook.com (2603:10a6:102:8a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 01:51:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 01:51:27 +0000
Date: Tue, 24 Jun 2025 11:01:54 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 2/2] firmware: arm_scmi: Add MediaTek TinySYS SCMI
 Protocol support
Message-ID: <20250624030154.GB10415@nxa18884-linux>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
 <20250623120136.109311-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120136.109311-3-angelogioacchino.delregno@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: fa728b1d-5b06-4d3e-c399-08ddb2c1a1dc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nivwdaTPHFpALkhxTbzvk0JcUmrjqpSCsVCvL/t5G1PdMLn2xqB5a+Cz5QH+?=
 =?us-ascii?Q?4MvCD5yjtPGA4O+F4buKB+p1KYdg38p3ueP4VtOso2RvHoMj84DZsZ1gi2T2?=
 =?us-ascii?Q?eVw/DNhUqB11c2yz7OA8Iys8iPbn+uQHcH3FYkNOltVVs8UsalHGDz7ie1Un?=
 =?us-ascii?Q?qO0wy9+G9/S1eCOVNsWvY1ea/aCgGAnWxLe5fiNRAPFNs2MqIilzHQnFjb+n?=
 =?us-ascii?Q?NlCiIfKDEzEqSP1acVuEuwktjiFr4mq4dRq1fe1c5TIWQL0rmAoau6sLu7g1?=
 =?us-ascii?Q?WWOD1sEpJ4SRuVFNHN8L2PhSJiWymbVOpIrbWLmoyLb0Iz17X4Neu8wzGkhO?=
 =?us-ascii?Q?Zp82dUYyVEKpkc3JLCsb/rkl6gKfOhvKR2Pew+WjfMmUNGGpv62FVdRqKuqY?=
 =?us-ascii?Q?1tAlsVnr2+4nVbvp2xE7qeSGQl7pmeo2tqoIuS/4uaa1gzIYyFucv69hOFm+?=
 =?us-ascii?Q?O2rGt0ZVICkToimCyBxqPmlT/CikkbML6eq+e8PBsPKexN0SBOvXyFYAR4t2?=
 =?us-ascii?Q?h7UdgZSOQ+cM+Ogdo7T/pbHih66vCp0OY7Ky8ApLat4TPo2lG0cmxboyhJXc?=
 =?us-ascii?Q?wFomIc/iWyeHXeHWZKfFRQNuVDALBlijJ7Qgf4lqh6oXg1MLNHsRCwEvDHqZ?=
 =?us-ascii?Q?dCVnssfCGRHX9TMelExrngo5ff/49L4fyz95XQVc8Jk+5erxgfIfmThM0k51?=
 =?us-ascii?Q?UJdtOckvOsVrxUoOx7G7BddNLiSKU9aXcrQaPM1qM0rXhLfrNhI/Pp1cjGab?=
 =?us-ascii?Q?XYOmH3TRs6VtPRgPezmMtjUVe7Ht5ZkIBIx2VtAXjQYtfz+gfVhZaPb4Y3wb?=
 =?us-ascii?Q?15dW+3K4a4WSmm4lalvImHV77PHfxKD8KtbpbcqiyU0mpyY0osju2+us3r2e?=
 =?us-ascii?Q?sHskNDUhniSub4k6tms3G1Mu5pMw6CVZ8r6OfPn3uPe8jEya8GKe0hwJvVWp?=
 =?us-ascii?Q?kY7hwQUSTr+GtVXjR8W7JboiaYOTAKoItDLhx527LbKHjU8DONPGEmhEe8++?=
 =?us-ascii?Q?Gx33ftgvNahJvyAd7rCxBjxKDSQf0mvFIdASrUk9drX2qbmXc1KR3aXhdsMf?=
 =?us-ascii?Q?Lms4kPAz+neCbSwo/7v5SwgNaxdvlB8P/+xmDUxc7PI6lbnBO70J6jCx+Dwo?=
 =?us-ascii?Q?6G90spUggiDe2vOAfM4AiOCPdzdEvSLXOd5anUiYUxDKsYHCIUFt84AWaElg?=
 =?us-ascii?Q?duSMLPh2qlPO3jS5RNMdtOxTlbr0wwjSeCU5Z1n1qOggStbG0guELqyJGHJI?=
 =?us-ascii?Q?ddce4d12JqaJmSM1ZELSeswO38RuXYBxxNk/a/CQmwviD02bU15KnZAbhYBB?=
 =?us-ascii?Q?IJKb3HIw0sTXpuMU8CJQLeewJhrDQs3Z6yM85QdUX8Bd6OyIXkx/z+S5/MO8?=
 =?us-ascii?Q?GzbPIkIQE1kbszWJacXRxLEgDJZ78dn5LHL0kHX6ghtEMk1PeCAj7t3X813t?=
 =?us-ascii?Q?hwn89QL/Xzrbw0DpGpNO3js0kqQYhBR3uyILl3x5t0vV2LpywmLNHw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NDB84CicpdYjN8hxxm57eTQdTdsdg7MHMtYNNnvcTnf05LnUeQ54dHAxlomR?=
 =?us-ascii?Q?w7fP7mokO3F4NGqB/HWLT6nKifIG5HjnVA6WTK1PtoI7tqAHlbFeGav5V3jw?=
 =?us-ascii?Q?Ntwa9RRwDOBAqEWgjlybIkXcByyqFbS9rEDK8QJvO6+Zb3rwW7hv1Dm3zw/k?=
 =?us-ascii?Q?+G0MV6j0NAX8thf7RiTdKfuD6UfBfUp+zm/RihByxf4KK1oMeUg9ePZVGs58?=
 =?us-ascii?Q?HUO3ACMR8xSD27I81qGKymmMoI5oZJhMtiCSexvL5tZ+IiQ0av48TTKskigj?=
 =?us-ascii?Q?msl6NfPf5aZxy2iZFDsMGuC0aifZf3wrZtvO6oniEZbwgDTCwilWFfQYx4oR?=
 =?us-ascii?Q?M0kF/RE028Yihy9KBuXJWyuXtGWKaLg+BajXNSAxckhtTQFaOvCYJPl3XV8v?=
 =?us-ascii?Q?YMQrLx7a7SCRPr0pGQSmJlJScPXYXj5LwcxfLmuvwE2kYiQHkfmtCA1kKFS5?=
 =?us-ascii?Q?cqMfF9JEqNNmKHalrRGgsUS1KyNqz7bYxwFYw0ZLGzWzEz0xHSTt3RZQ2QNs?=
 =?us-ascii?Q?17LAkzDwfjDGBDcNyCYrsT90/y4Rio0JT+jYQCAOWQk7E8yYxtZiwIvkEd0t?=
 =?us-ascii?Q?kI3OED3Bt8jGOnVQqo55lsJxgW6taDDBqprf6HaCthFkB2zjmd9FUz/YtGcL?=
 =?us-ascii?Q?uU0FwBok1pCoyqerNqZR7vzKsTOG0EfH76Q3unEBnghZe16nK7ICw3zEWsGm?=
 =?us-ascii?Q?5sp+hg+eGjgE/6B2zApyQvkXEs8xXGnRV67D7WU3X7CUtj140IXB31yIQax8?=
 =?us-ascii?Q?vhSI1mgq66K0XHPu3JatNKKpff4dy9g/PWAiL4JZZvXkl0mwmMhzuiT/ydIB?=
 =?us-ascii?Q?9MrH/qpMoFs2WE1E3Ehcy6D9ZhzkftA6c1mUvMJfJoJUUkG7EjlSO32NliAW?=
 =?us-ascii?Q?wsC4r93OhpBzoT9Zm2h7Ex4F82EkBOsqMKb8HnKfyn8wAf+Fa3SJPIPAQ1SG?=
 =?us-ascii?Q?0ffgTgWxiesLGfPoO14rUmlYmLMW1uY/zjMdeBeBxKVIpv7at5VVvY1cLwNt?=
 =?us-ascii?Q?/ujZkq99hKthHD67tb7bnz4BIgkUFsncKd/d+aATa2cDeqLbyT++Ds/0W2lB?=
 =?us-ascii?Q?wWqd/da/yH2yKTiqLxRIXhzNlyDU/5X6PaQbTNYOus++dkth0WPfzvyKg7hK?=
 =?us-ascii?Q?Jkpyao2rWQ4KdpqSP15xBgaePzoF1lWfL/Z+kkX48WiNCp1mCxqVMYhWIrXT?=
 =?us-ascii?Q?4lyamFRDUOx1CS3Q+lPot4Fqw6dFuZZ7bwrZUj6AfbdmaoUV2TbgJPPU9A2W?=
 =?us-ascii?Q?MitYRrfAisEcqLkbhb5KpBMkIMI2LpqyNYqRv+EIETQySt9KNno9aOP12mZ9?=
 =?us-ascii?Q?JTW88D47eELk3lcm11O2X4nZpkRtuGPJQJeZEJITHiks4grAYcLnCOGk5vCM?=
 =?us-ascii?Q?LcV8lcEk1beS6G4fEzOlj/oDkTBCGoMtQiKRLUbMV4M7ttJJC113ARbiGTw3?=
 =?us-ascii?Q?1Anr2A403NjJYzJAUWPr12U3zMqxrnLB+1kc5WSPYSZTI1Es+2KW3Yg3g7xD?=
 =?us-ascii?Q?u4xYpdGmjgunLzFHuh6IlpB4GauxuBsMEJX8Uw9Pt1ptkDSxnhxWQWngsIgR?=
 =?us-ascii?Q?0naR1pIfLLado+WBfz2zzAneDJC8icCbjhJgNYLb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa728b1d-5b06-4d3e-c399-08ddb2c1a1dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 01:51:27.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9tj+y9ypGXHjyvXZTXmnRGNUCwsE+d5yJhuK2Jbm6MvRxlj3M5AesbEywo0YnqlnH9PVpNQ+M+Brknfn9FCyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7450

On Mon, Jun 23, 2025 at 02:01:36PM +0200, AngeloGioacchino Del Regno wrote:
>Add a driver for the SCMI protocol extensions for MediaTek TinySYS.
>This is used to communicate with various remote processors in some
>MediaTek SoCs, which mainly handle power management related tasks.
>
>Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>---
> drivers/firmware/arm_scmi/Kconfig             |   1 +
> drivers/firmware/arm_scmi/Makefile            |   1 +
> .../arm_scmi/vendors/mediatek/Kconfig         |  16 +
> .../arm_scmi/vendors/mediatek/Makefile        |   2 +
> .../arm_scmi/vendors/mediatek/mtk-tinysys.c   | 344 ++++++++++++++++++
> include/linux/scmi_mtk_protocol.h             |  62 ++++
> 6 files changed, 426 insertions(+)
> create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/Kconfig
> create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/Makefile
> create mode 100644 drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c
> create mode 100644 include/linux/scmi_mtk_protocol.h
>
>diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
>index e3fb36825978..baadf4f7fef6 100644
>--- a/drivers/firmware/arm_scmi/Kconfig
>+++ b/drivers/firmware/arm_scmi/Kconfig
>@@ -84,6 +84,7 @@ config ARM_SCMI_QUIRKS
> 
> source "drivers/firmware/arm_scmi/transports/Kconfig"
> source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
>+source "drivers/firmware/arm_scmi/vendors/mediatek/Kconfig"
> 
> endif #ARM_SCMI_PROTOCOL
> 
>diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
>index 780cd62b2f78..d1b4ec16b8bc 100644
>--- a/drivers/firmware/arm_scmi/Makefile
>+++ b/drivers/firmware/arm_scmi/Makefile
>@@ -13,6 +13,7 @@ scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
> 
> obj-$(CONFIG_ARM_SCMI_PROTOCOL) += transports/
> obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/imx/
>+obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/mediatek/
> 
> obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
> obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
>diff --git a/drivers/firmware/arm_scmi/vendors/mediatek/Kconfig b/drivers/firmware/arm_scmi/vendors/mediatek/Kconfig
>new file mode 100644
>index 000000000000..8facdcd3819f
>--- /dev/null
>+++ b/drivers/firmware/arm_scmi/vendors/mediatek/Kconfig
>@@ -0,0 +1,16 @@
>+# SPDX-License-Identifier: GPL-2.0-only
>+menu "ARM SCMI MediaTek Vendor Protocols"
>+
>+config MTK_SCMI_TINYSYS
>+	tristate "MediaTek SCMI TinySYS Extension"
>+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)

Should dependency to ARCH_MEDIATEK be added, as below
ARM_SCMI_PROTOCOL & ARCH_MEDIATEK ?

>+	default y if ARCH_MEDIATEK
>+	help
>+	  This enables communication with the MediaTek TinySYS MCU
>+	  to control the power status of various SoC sub-devices
>+	  other than passing other messages for initialization.
>+
>+	  To compile this driver as a module, choose M here: the
>+	  module will be called mtk-tinysys.
>+
>+endmenu
>diff --git a/drivers/firmware/arm_scmi/vendors/mediatek/Makefile b/drivers/firmware/arm_scmi/vendors/mediatek/Makefile
>new file mode 100644
>index 000000000000..dc1ff63c3b69
>--- /dev/null
>+++ b/drivers/firmware/arm_scmi/vendors/mediatek/Makefile
>@@ -0,0 +1,2 @@
>+# SPDX-License-Identifier: GPL-2.0-only
>+obj-$(CONFIG_MTK_SCMI_TINYSYS) += mtk-tinysys.o
>diff --git a/drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c b/drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c
>new file mode 100644
>index 000000000000..baeb36493952
>--- /dev/null
>+++ b/drivers/firmware/arm_scmi/vendors/mediatek/mtk-tinysys.c
>@@ -0,0 +1,344 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * System Control and Management Interface (SCMI) MediaTek TinySYS Protocol
>+ *
>+ * Copyright (c) 2021 MediaTek Inc.
>+ * Copyright (c) 2025 Collabora Ltd
>+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>+ */
>+
>+#define pr_fmt(fmt) "SCMI Notifications TinySYS - " fmt
>+
>+#include <linux/bits.h>
>+#include <linux/io.h>
>+#include <linux/module.h>
>+#include <linux/of.h>
>+#include <linux/platform_device.h>

This header is not needed, since no user here.
I just see i.MX also includes this header, but could be dropped.

>+#include <linux/scmi_protocol.h>
>+#include <linux/scmi_mtk_protocol.h>
>+
>+#include "../../protocols.h"
>+#include "../../notify.h"
>+
>+#define SCMI_MTK_CMD_SSPM_QUERY_ALIVE		0xdead
>+
>+enum scmi_mtk_tinysys_protocol_cmd {
>+	MTK_TINYSYS_COMMON_SET = 0x3,
>+	MTK_TINYSYS_COMMON_GET = 0x4,
>+	MTK_TINYSYS_POWER_STATE_NOTIFY = 0x5,
>+	MTK_TINYSYS_SLBC_CTRL = 0x6,
>+};
>+
>+struct scmi_mtk_tinysys_common_get_payld {
>+	__le32 rsvd;
>+	__le32 param[SCMI_MTK_MSG_COMMON_REPLY_BYTES];
>+};
>+
>+struct scmi_mtk_tinysys_common_set_payld {
>+	__le32 rsvd;
>+	__le32 ctrl_id;
>+	__le32 param[SCMI_MTK_MSG_COMMON_PARAM_BYTES];
>+};
>+
>+struct scmi_mtk_tinysys_slbc_payld {
>+	__le32 rsvd;
>+	__le32 cmd;
>+	__le32 arg[SCMI_MTK_MSG_SLBC_PARAM_BYTES];
>+};
>+
>+struct scmi_mtk_tinysys_pwrst_notify {
>+	__le32 rsvd;

Not sure why all upper structure has 'rsvd', meaning reserved?

>+	__le32 fid;
>+	__le32 enable;
>+};
>+
>+struct scmi_mtk_tinysys_notify_payld {
>+	__le32 fid;
>+	__le32 param[SCMI_MTK_MSG_NOTIF_ST_BYTES];
>+};
>+
>+struct scmi_mtk_tinysys_protocol_attributes {
>+	__le32 attributes;
>+};
>+
>+struct scmi_mtk_tinysys_info {
>+	int num_domains;
>+};
>+
>+static int scmi_mtk_tinysys_attributes_get(const struct scmi_protocol_handle *ph,
>+					   struct scmi_mtk_tinysys_info *tinfo)
>+{
>+	struct scmi_mtk_tinysys_protocol_attributes *attr;
>+	struct scmi_xfer *t;
>+	int ret;
>+
>+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0, sizeof(*attr), &t);
>+	if (ret)
>+		return ret;
>+
>+	attr = t->rx.buf;
>+
>+	ret = ph->xops->do_xfer(ph, t);
>+	if (!ret) {
>+		attr->attributes = get_unaligned_le32(t->rx.buf);
>+		tinfo->num_domains = attr->attributes;

Not sure the spec use whole 32bits for num_domains, if not, better
use le32_get_bits to the expect fields

>+	}
>+
>+	ph->xops->xfer_put(ph, t);
>+
>+	return ret;
>+}
>+
>+static int scmi_mtk_tinysys_get_num_sources(const struct scmi_protocol_handle *ph)
>+{
>+	struct scmi_mtk_tinysys_info *tinfo = ph->get_priv(ph);
>+
>+	if (!tinfo)
>+		return -EINVAL;
>+
>+	return tinfo->num_domains;
>+}
>+
>+static int scmi_mtk_tinysys_set_notify_enabled(const struct scmi_protocol_handle *ph,
>+					       u8 evt_id, u32 src_id, bool enable)
>+{
>+	struct scmi_mtk_tinysys_pwrst_notify *pwrst_notify;
>+	struct scmi_xfer *t;
>+	int ret;
>+
>+	/* There's only one possible event for now */
>+	if (evt_id != 0)

Use 'evt_id != SCMI_EVENT_MTK_TINYSYS_NOTIFIER' ?

>+		return -EINVAL;
>+
...
>+#endif
>-- 
>2.49.0
>

Regards,
Peng
