Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDFB38385;
	Mon,  9 Jun 2025 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459684; cv=fail; b=Kye5cKpBlqgc+P8MaU2o2Ys9xntHnX8XcH6EXVvSCm4fGPwmq1SLKWcVg064fPauMuLIRDxpiM5ADcDg9vNd+3X5vqxkwb/SE7op1ivMueOdtr+7ej9kGhfv7/QJDFkPB0/WLB8ciZDTZ3SBDrF5oGI/07u9fVvVQA98LzoUu00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459684; c=relaxed/simple;
	bh=rUa83/VZEgxLhEpqNqfN0H0tBC6QWMq15QAbkeIb6b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NKTD3w4HvRonL/fhgL6wtETJd/VzBO89x0xNMfgL8jg60389NhWZR5JV33FXiQasP3ngVrxmIyFUp80j+JfJrQD0luzaxnGdjm8IPolPttx2XCJzBrsdY/q5MdkcQGm1UqBQiEoqHL0XKIKlkPUry4iE6+4bcp3N9pZOBWyQ54g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nNkGdpPD; arc=fail smtp.client-ip=52.101.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nNkGdpPD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxkC8Npk5B8O4QF/wdVeM7VgitA/+mh5gPf8ojcStuJBvZYiwxmPAi1Juvfq9X+/1YybQitHH7gBgqGBwG5dIMsN/idiVZ2YLg+eWq+c8s78PAanU9Df1e/FjrZ7uh6oK5Y3SDeSTN27QSDtOdwbG+4U0YUhqzsJjLwuNmRliJUs9skod9SCpqC/IOljZAW2JsovOcgVSSN+5zRau4kdcWJ4Nd9W0rtODbXJM4oJRM7mX1/uWF4WgK+MsiN7iDKrCD3J9WcboRzBkRtUB6w6cRJohm/4cZOfh+UgZ12A1TXExLSdRvPseTgEPA5OD++dEh5VD8rWU4IiU17DNVx2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUa83/VZEgxLhEpqNqfN0H0tBC6QWMq15QAbkeIb6b4=;
 b=cEP39+R1MWquJbUBFWXy96Jzktm7phRTqDKQbpw7J+ivn/b51N8ifJHApi3R0g1Tgg23VpKpLrAJxbJ0TPTvU/50+kHC9/PrL11cYNWr5mFkSsvS1rnAPAGF4wPo8YAg0atuflAa09Chh4BWBI9RN3feJoDHYTXxSqHOZg1kM0lWt4XR2AZhV3AOQdFGMRYhu23QC3eZBpd/WXL7szMChEauxIKOqxQ/a+MQBjVLUz8rfrOJil/ASEP/AXOETy6qpdlQ43CiQGuWWXt9NBtVOOLTZomMEI+SLfvwgkQgbQw4C8hQzdsMkWSUgTXLfjxFvwjCWC5Q4XEL59vV9sKTtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUa83/VZEgxLhEpqNqfN0H0tBC6QWMq15QAbkeIb6b4=;
 b=nNkGdpPDClUOKM2SCqi0NqWAOeteRcle0mCzZVIh1KpuWG+7/GqYGTLKj4e1SjXdT8ljG5kUwlOVg1aD5JkPpQyi2U8SqXXZBxy3UrlsmA95wLYbMu6wg89LpdqZwVyNCaJamVyVTR7j7iv6IezSeSKnkVovdApOmMLQfP6JMKqoi/YtlxhAnw8MQiBCu2jMGMu6x/cSo3sZfEehyPFfKus4krKbPmgYWuIPl6BBowkyVk+qH5Ot0mXBoUkEjlUEHB0Lh9QBxkwrcTU00JfkaypgWbOFSWo7GrcCG9yk3QvzfiIOSwJxRQuAJ/f8wPCokvM5VqewbrHU8No4xU2PXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7640.eurprd04.prod.outlook.com (2603:10a6:20b:297::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 09:01:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 09:01:20 +0000
Date: Mon, 9 Jun 2025 18:11:26 +0800
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
Subject: Re: [PATCH 3/6] arm64: dts: imx93: add usdhc3 and lpuart5
Message-ID: <20250609101126.GL13113@nxa18884-linux>
References: <20250605205853.1334131-1-Frank.Li@nxp.com>
 <20250605205853.1334131-3-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605205853.1334131-3-Frank.Li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: ce0d3971-abc7-4bf3-455a-08dda73433a4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eqAV52CAL+D1NGgXXgtc71Vtrpaek6i7v40aCFxvgZiwkQababTDcF5cJgq8?=
 =?us-ascii?Q?BXajpdl/HQeJ1zaQeEXI/oJpiKolX9BM85jNfttV2drBifV/o5QqBAXG26a7?=
 =?us-ascii?Q?qpByIho7Y6euWPn0HcSk39dKZccej1qU4Ygv3tKiyHvaaNvTvoJPqaGHkxpu?=
 =?us-ascii?Q?QOjbm7baWjXue/IB9euUMc+MYqEZ1zp7dzd3rHbz9wCwIAOzNGYFu5Hbu59k?=
 =?us-ascii?Q?6EpNKsGZOeTCJPxuUCaAOt80pjL18Ro3mHmqyrrdtgh8w4g0T/tytnF5POeX?=
 =?us-ascii?Q?XrKOFFaQcpF4xyhZb7SVvclQkDHrxud2ef0beWqdu2Wh6yjAKx2bi+sGO4qC?=
 =?us-ascii?Q?POjacfv5+wOU7fOJLdXz4u0BI+IKc1OHnis2Dk2ObpkCn0yraBm9aQRZ0UCX?=
 =?us-ascii?Q?xc8uguoiZf1g9hc1V7V3iEx8skVaeX7R1IeladyJ4rzzDPifjo6V3+1fbz4V?=
 =?us-ascii?Q?PKEGdNXYRK3yd0God/F38LtYvsR0sGbXAh3HDX83QssyQjdN2LGqNCkdS3I+?=
 =?us-ascii?Q?oNTOKiEm2oC0MOwTtTxBjnj76jrRQP+90PNo4Vo2NNpjmW33BrWUmibrfOV9?=
 =?us-ascii?Q?OUBEp7TdeZEwwlhT3mpgG2IWmBzgzZk9Guqpua3s/bnsv2goaWi2HHGhJ1nM?=
 =?us-ascii?Q?B4weYViZ95B22sw3dNpqqOXS3hNAG1IV9t9G1LWY9Qzqe21F+xJhENYd4lF5?=
 =?us-ascii?Q?j7Gs5KvN8c+XTN+U1vJXvzk2klhylkfBGP/SYp96vtlbcZ5PwunLwlikaa5E?=
 =?us-ascii?Q?itg8cEPbfcMUKGGVG2ZuJRwz8ZAiw9DEHwIBaO8byCNNmo8xTTx3Odpn/ogt?=
 =?us-ascii?Q?Saiyn3Fa6qMauwF/Ds7Xlc5iUOsm0N03FOViVsLIUqZnCiNwFA9O8v4mStmK?=
 =?us-ascii?Q?z5L5dgdKBgLW14qEtfkRLJrSu6CxMMSV6dnP9LAcazZ4OB3dMN/RBFlkROxz?=
 =?us-ascii?Q?TGxdpmXUhjZY7Fbioz0tQb6+rvd6Tv7+36dcSroxy83taVKH/WEn/1QtufFy?=
 =?us-ascii?Q?hxqeoqIzJLu6z1aJnW00FCuPpSq9M26UivsTOxl5dH6/AInFZCnj5aTAef4h?=
 =?us-ascii?Q?wjc5RD2NoVLEaoICBa/FK2CVI+T1v9AVnF4WclnnLyumc9N1L1+48T8IkOJn?=
 =?us-ascii?Q?WUBwmGZwyiyh6YGgev0UfFLdbK0HO7xMGmob/USF/3mGNkS+0vh9rHBMbHfM?=
 =?us-ascii?Q?L4WrmuS58xVQaXjwsI5vgl1nSVcERK2WHGzP5JQSV4Fv6RD6DayEvRqqEQiK?=
 =?us-ascii?Q?6IzIi0vvGUN54LhMz8Qs51wJHmTE5kOpCicHtx2fGXbu5zY6Em5qdb7kK2/q?=
 =?us-ascii?Q?mEQd/sFmVcJ4pyZ9t+gh3cigYFGp3uihLo7zBRwKasvP3Bjq7DNHomSjwWtc?=
 =?us-ascii?Q?IfVdPHic+sM9rs+SNjfTkY7VwQ3cHW6EFEefQPr+lFNriBsNthdsgQoA67Hk?=
 =?us-ascii?Q?q8By5io+ZfaRAZYDpxIFatCeYt29rAxl07SkjTA+/pgyYqbwXtDWAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+UHykfa3rY/AP/sYh57KFbR2E4r/xipn6ISH4d6PoPE9NpkGzUgNpp+xnbio?=
 =?us-ascii?Q?tOklzx183l5Fdrkm0bPO4TK0onX0kT+dWw7hty+vgxzMacgDeH/30NUQNrAv?=
 =?us-ascii?Q?fmDRGKQUTNhh20sJkB8TH4wpb8wyNpZiHRATjG9GHZEJHhf1evSe7y5lkaOp?=
 =?us-ascii?Q?GQ3d959CG+4N7oGF/RzQml5Zy/39qKzO5mBa2NoLxoiN0mxibGr0zJ9oRwpZ?=
 =?us-ascii?Q?mcSwCOv+bccfi72qdUJvEKFOHyZe5OlyNg8HmHtoAZwtm4HYP5KYCeNvUTq3?=
 =?us-ascii?Q?bogaQgQu1Yvn4rSz27gRAokBlJt0Y9vxhz1mwQ9LATyqDRpo25oalZJmBJZY?=
 =?us-ascii?Q?zptlRHBC41dmPZcAanqLxb0BsEo3LELp/17OOSfwzaNwKHnXhbsqG/jBMYYq?=
 =?us-ascii?Q?ZjZc1UrkEim9GLHyKQ3IHyScd9xKvTepKXIgVxwpvrkpY96VjpVdNBpCuOck?=
 =?us-ascii?Q?5Dl3Azw7+PI3CbR1V98lBHrHp03A0DKzUOQvXIhC+JbDl+zOfmduDEQeu5Is?=
 =?us-ascii?Q?tS8R/BuKnYwhXQjtaALMTCvqqqKI+Cwu7cOcwBMowqDs6BCH20+04BhLdVt5?=
 =?us-ascii?Q?NAccLNTWF+YW2odCNv4PoIbsNiJn/p8JlKBF0+hefAC6EiYk+6eGp9fabyxD?=
 =?us-ascii?Q?LeO+/UWIPOkVjxFluUgGAcqz3eHorm2jYdvzdIgYmLR2PkJBQzlvllaIVcOn?=
 =?us-ascii?Q?w8CG2HclX4ZjoeFnixSwHech7rBVeXJOg8LfnsmwCVwjIKXLpDYH5vLAjzGQ?=
 =?us-ascii?Q?JaV3N8ow7Ni5zyIF29KCLNdVCrvg9P6SQTgXQAbvkOOKRt2aJjEOq6a5C0W8?=
 =?us-ascii?Q?uJ/rj3qWhkUSBYagQz+SZgzj5JBsr+uOQRTfMGiHKWQnq8iC6wBhRI2Lwkbn?=
 =?us-ascii?Q?RmexufuhIg8u7yZ/jERgsJz+nQwtKgEggLYYJzooxJlWzT5Bd6wI2++1oiwI?=
 =?us-ascii?Q?158gANydcTUxo9AsnoW5haqbkl57lm9c5cvBgy1OjQ6EaBkWsWttIui5UVcu?=
 =?us-ascii?Q?U/my2D8H30NDs0mhRax4gNTWtG+tjO5l9egobxxkerNiQzm0RW9HfM69OvOs?=
 =?us-ascii?Q?Haluw8n+vEU94mn2FnfWUOtwIKfcQP6QATG8pjA6RM9iAAil2cKZ0Tp5HrZJ?=
 =?us-ascii?Q?d2MW6HDgB0mxcfGsaBFevPMgnRJLhdNbriwF4nUAH+ZL8z7K44rZnPMhs8o5?=
 =?us-ascii?Q?GIOtZ5V5HDGpwvhbkQ1ZbeUxWH/LycmVhds+eJk7O8rmvgS5N4MZXtixrG1Z?=
 =?us-ascii?Q?NIESyb2UnSwcCJt3/EFzjOfccIBOP83jTK7GhGpqAKXBKIQxWRL1AbPIIh2/?=
 =?us-ascii?Q?5XigL/0zIhGQTdRhLKKyx2TEsJHQdqeM/TQFomG7v/JIKUcLnrW+cH7fSsM5?=
 =?us-ascii?Q?A2FL22N5YAVfkMvxbb01L4eVeNAzxlWU0WdfGeCAI1fju2YOaVT88sA8uJSF?=
 =?us-ascii?Q?TY68w+a1yPnzsAHd2FrMu9BJS+714k31GDoDxQ9bJsZoeVwrGYjX47gLf3xM?=
 =?us-ascii?Q?qdXhLD9dP8g1dFrS6cZy32zBMiCLG/McpM6GipZXU0r/gm8nIjOI9JjiGlWV?=
 =?us-ascii?Q?Zrgfi0N6NgehCuNSzP3OIJ1T2C4k3rFb9aqXtHwp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0d3971-abc7-4bf3-455a-08dda73433a4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:01:20.4250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJBnwI/nAZ2oPewY6sLmf6iN1rCWt/ta0ovcivw/qKLD1HAt8QsMTH74GXjLDkHOedYm7aI2ZFJXPrhI32RPKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7640

Nit: subject: imx93->imx93-qsb/evk

On Thu, Jun 05, 2025 at 04:58:50PM -0400, Frank Li wrote:
>Add usdhc3 and lpuart5 for imx93-9x9-qsb, imx93-11x11-evk and
>imx93-14x14-evk, which connect to onboard wifi/bt module.
>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
