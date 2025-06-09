Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780E02512DD;
	Mon,  9 Jun 2025 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462160; cv=fail; b=qAvsq8R+wFP1vLmDB6XQ7SR0Vo/PCDAu15dCYsvj+LbUi1HtVzySLaGTT15BqtjjcXPhqV95+fLjvZU1igOKDVxCD+1d5PLidS85oLXDigbfLuTGpdb8iD6z/3dkJ8MLg87QAkB73SX+UxZhvaFLjYKCEXhhnR1EGXDnRUv67Uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462160; c=relaxed/simple;
	bh=u6qZSEhH6F+sJtbBwDnq60Sroy+AMU/Bp/CorD4zEPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MJs6Y6t45sATBtJC2viuoslme1g1j2F+w38EZk8XFLegRfYdYh3ZIsI/F3KRpgxuT7zTHMhmWFipLiP3dUWvuGanretEXgMLo14zQUtXUn+2PegCJG9nZePqi64NK5NCXZlaxaI6HF8wPg8R3JS8+B3kmEPjUjwLTriIJHtXuBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ahK+9XRB; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ahK+9XRB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERq87vy2JhcNVafOsRy4SFG0gVuSXvUsLr5aswQBVnzyv4Q4uHUw5HGAku/P6YZNbqzrtyWhaq076FgxI5UrQnSI1CvurdjJzDXl/yQHfdooPlumgP80ycTkI1MmALdGEnvmZhLMevgMHtz0nyT3R4Y6v8CzfZfreRIXLO75/HyHW9VMxU4ON89ENXL/pEs6EDMNnwiC0mBdZxBSLf3ZdhLjAiK/Q07ki9wt6ZTYFIVe9sp1B9amsRThvG41wGrT2KqcjgDHHa2nSw6V4a98Fq+FkV3f+3aG2r3HDFr4/aM1QyXvdiBauhzfTJj3TftL6APCHzwglHYeOsspMNqfFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6qZSEhH6F+sJtbBwDnq60Sroy+AMU/Bp/CorD4zEPI=;
 b=RcLG2cnvlPtpNyqU8b2Ip7GcRCrWGaEe0l8AuclzwMclXJaeH4/VLXVDybV1h9JHgMuT2puSodSe9FQ98Z/IvuGSXcZGtug4AbPQxahJS9G569mUSHG4gjke1VW2/T/kQMlPpM20FlnGmBY7PzxVEukWGAnrvc8inZ7UbL2DsAE+7cdIleoq+9MdFr12KkOxDS8YaUWif0ls7UewAUFH+uCs5IHZ1JoEzr124OC1pnIMFwgb5rhHfOOAidjm81celMQbPQ3YU1xxuvl0J3yMLe0Z+DYYWloLnFQ9XOwye5r32JzJlqeN88eyxeMjB/ioalmU3QZ37FB/8jVMm0tbgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6qZSEhH6F+sJtbBwDnq60Sroy+AMU/Bp/CorD4zEPI=;
 b=ahK+9XRBvTqi4IuiiVFZowMQ7pqssY5OIEZ9DLe8VD+MCHFOE/iEcObuQx+nfxjNxb+TCFKfuP1mUxmFisWH3hU+aaFKkpgT0+PvdHYIxmW/do163xFWVelCsFc298vyQ5F/YbYVE2N7kh001+QQTZFYr/s45JgCE+hlkDUBvgp9o7jeA5vma2gjEM6eZUZF68+WoPR0dnPRKYTUdKW+b6c/iG1sWSlOYZspXqI8lyvNXGYmlpbBRZK/sW2kxdfFsNz4fJsycQ1kuKlmo21h4P80e2JiShf/uJffKBB6FzFyqQOrdS4/2yf49zx0dXF+T3RUBJ6dd+fEIhfvcHwImA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB11360.eurprd04.prod.outlook.com (2603:10a6:102:4f2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 09:42:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 09:42:35 +0000
Date: Mon, 9 Jun 2025 18:52:42 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx95: Correct the DMA interrupter number
 of pcie0_ep
Message-ID: <20250609105242.GS13113@nxa18884-linux>
References: <20250609091127.4188159-1-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609091127.4188159-1-hongxing.zhu@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB11360:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aaa0d8d-b40c-401f-f7de-08dda739f71b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2QqdjQ9Qt4jHd2Hw2LivHDfbYDm+27fwUdkXwi2mJopZQCMrgVoWF1+edxfl?=
 =?us-ascii?Q?VQwu2VbIizhvkYmHrsuBzGoyxF8BH5pBgQLKkd0FzBHWS9ESAbYaPp+2AqZB?=
 =?us-ascii?Q?iyksEwO4u3VjImkepdEh9tCk+OHrq8v48A7cT1kYVUe5AL8C45h815ZcLbYX?=
 =?us-ascii?Q?BirOLgusyvG+9jIHIGL8py/du8m/ipUyPjTNEux/ElxdGzXNsHKtaIKGJqoP?=
 =?us-ascii?Q?YiXGGM4+01qpAWpMIh91fvOwjpHNZc6IJ5eY1Vkmw2sADRUBBmohs1R6zWcS?=
 =?us-ascii?Q?vC9nmxz79aU98BrbEe35czmra4HP52g98EO44+7y+hYK7YypHY0MZoD3RrqT?=
 =?us-ascii?Q?OKTdYA8qpdzWzfrFxLRD6YTafyQcz56gmXJuQxbTqfKqvpt4XEQaMQqvxuLW?=
 =?us-ascii?Q?4EA18hC2dsi5K1kpreY4xgTI25f72VPbppen9qfZpBQP8c/7CH42XtjhhjR+?=
 =?us-ascii?Q?58Xh6oYAFSiI4ZnEAuEXhA5c+TmL5VuWGd7SdHuLIelpmbk4DJOH0RvcZZcC?=
 =?us-ascii?Q?qvYacWp4M8sk3V3GvWL2wbE8V1cTGiee3jtlZKF/M2qE+fIDUU/lr2bW8ICW?=
 =?us-ascii?Q?cAo/Iyl7Iq3CrW5VyWZMTZOIbl+O9XpEBO8Tr8gt/OjhUruzEzsYYBVLabrV?=
 =?us-ascii?Q?a8kUIJtJDAtiKTakfPGmUatcxfafkDsCu7AyAsai3AfQyflTg1JSS5BmYg7j?=
 =?us-ascii?Q?CeGI1SR8WtDnySJbpaV29bBm8aaBCa480x9f/LskG2G4k6G8lGIoPnVYSJjr?=
 =?us-ascii?Q?oD3G6TuCOTQ/dT5s3UOLEPtDAQ9XnhG4g1nCGpvThL/TyFlpqt+3QgfbRtQm?=
 =?us-ascii?Q?L3W0OmMrITZn/Qt+GoEFARJb7VuuDVKBHYx64pKhm6+SAGZPhMRKnajHU9QN?=
 =?us-ascii?Q?bOsaS53sLSlea9UodpAdQ5ZYe3+JBr1SKZSLmuWdjm1VjPokyhnwrtM4mbDZ?=
 =?us-ascii?Q?VKF5+YYoqQFzSlpF6UunRiXa3AM/zjHJO7fJzRHny/iuZC2gUytK5/De0lKc?=
 =?us-ascii?Q?Dh0nfGqt2rgCK/fKPFloafO0ce2rcOCJE7V5qTCGXuXfxw4Ah7I3/7w8c5+1?=
 =?us-ascii?Q?LwnIlM0ji7tlFAFJDzQ31HjasOUfZmbUZDHM/2jzUpY5yG7z8NEe09TTXc4w?=
 =?us-ascii?Q?hVG+MPfh9HLB6T745YUVSTkrIACzDFwJz/tPvOOpp4SsBTCR73u+xLV547Br?=
 =?us-ascii?Q?lVjNpH/mmxYlHiq2Ra6dbnPrzukrh3TzU5Lsadsr0FkfOvKhGbNClrReoeMG?=
 =?us-ascii?Q?GSdv6S9zRl24L6ZwJD46D3q/7Q3uxUqN4i7PpETYFvyGiWtWd43SZYzNc4cE?=
 =?us-ascii?Q?dJHiCqjOBeLujBmXmfRqohWkO0Rnlt30/WSNFXkhwh16ORAM3YZEPJdJXlTw?=
 =?us-ascii?Q?srf7pTky5YWq0gG+qyvh+aw5PvubYZxERbe1tAzUJ4mMs0yvLPHvOAFqitcn?=
 =?us-ascii?Q?oMvUKJT9NJN+gimMyE2PkhqqoF1RSZMKdpaE+zzEZn6cakj7dXj84g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8DuTpLMWIL7fkjaO1+tw/+P+qLMQF9nOUoB4X9yqL8Rf/rLqKSCn4VkQuDuI?=
 =?us-ascii?Q?NgH1kmiK7ejgNmd3zJPzNI7FwqqqhEqRoX0Ngug2O+H0D9ugpovLyQ58Epb9?=
 =?us-ascii?Q?OWXPoNMhxsICXJjuMiJW18symu1ZQCUCTlfanGb28RSctPTSLZMVrubk6EMW?=
 =?us-ascii?Q?hnY84xTNb0FPlFQPrylYl6oOQtpxg1t3XYxW3TVqENIc2+fhy+JT18MUr2cl?=
 =?us-ascii?Q?o7NKDDP38geukbh/O9Mc7tH0cKjqHVKJakaddoP28Zkl5V7cSF2hyOR8sO1m?=
 =?us-ascii?Q?vdcX4klNF4QDF7VJ2Xa1eUNPoPVqQjXVzBmOe7TCLphgsxL4/tA/1LJnAyCI?=
 =?us-ascii?Q?eXTm3W5Aktlh8pZRY6BB32GG7fRKNDNM7/41oDvxhYftgP/nVC83FKBw2oQC?=
 =?us-ascii?Q?Q1P2D0WqDJZAI6blQvVh+v1wUHnYuSNH0QAbKFRuJ16M+ZT1mtE30fXDnZHo?=
 =?us-ascii?Q?eExIP4K4o70jbHOUw7l+6ObUSjIxqNeadl5nmClxFNhPjDoJc5iQ2mk3LxCe?=
 =?us-ascii?Q?Qu+1xJxIkvaVycvI7V07Tr+IsokGQ0XTw95Lzf1O07MYZ4SvzGb9bKcDEdmX?=
 =?us-ascii?Q?5xvlRdFNd75KGfW8La6tJSZ7feo3ngbcujxTvqHYwz73+dHQIAuLuASGpht0?=
 =?us-ascii?Q?ohlDrJ/Fv5aT4bu8fBWgy+lyloqw3MD40YcQQux4mpqkqOnZJbyqzwMKDogg?=
 =?us-ascii?Q?NoVXIKDFyfY7p6qg5jX5zsyEx31JFrqbu01yTTMI5heb2FdCY1qpnj8BAtL4?=
 =?us-ascii?Q?hksEjJRCSgTFAQ4Hc3aAAVJDZSyUwySWEtKhPgNoLh4/6jgQNmdSD1JffQLP?=
 =?us-ascii?Q?SpFaO0NVI8LSM3ByIuCBs1VE2PHLR/dH35nlf6AJPCcXdJJR9XebqfoQ3ZXY?=
 =?us-ascii?Q?9mvdDTw8I7gECOkOXM8c8O2sHLbkF+kvdje5KYfvB1gXJOqRTOqYW/9tMUAx?=
 =?us-ascii?Q?XjDu2Px4K1NCU4MQrAqIEgGhZGPqOsmTk2b62I+ukCe6YSZWmfwtP/Axbb2F?=
 =?us-ascii?Q?oeJpnpUdGCwmoJWnLKZt91RXVYLApi9GGJWIIaFvkSOAMWS6RLA8tuxaTrPh?=
 =?us-ascii?Q?ccHCjV7UyeeSYwssNz64Vp17oMpgJCt3dTizgRY4qicO+tvmErczxjzNeHMa?=
 =?us-ascii?Q?thtcYUgtHti+LTuv+UmWK1u0yAwNokNGUTEVRqXM9MuIE/N4xv7AOpjMWX+o?=
 =?us-ascii?Q?sOWxb2GE8ppGThsUmUs8R0pKauypTax4/k39jNdX813qoHi3vf2hcAX9mtNT?=
 =?us-ascii?Q?RjE1Ov6R5Tb78MLK3eGoZy13x0/L7YfQ/ffJCGKb9K/UNrbs0qEhGHFAa/w6?=
 =?us-ascii?Q?MKr7CmBZ8tEpcHngFvXup05DbvxTXS5ovhCP1aUCUv6WMBEjuwzxqSjAi2o1?=
 =?us-ascii?Q?+d7osHNsirYApEv4Fp0z34RUW3WDweaCM3kgi+5x1zfcfYK93D20w297doqD?=
 =?us-ascii?Q?XxxDB2JutH16i6S4LuUjA7lXoGFEmNoRVbo0mxv9Aa1xFWOk5SbgWHWNrc0C?=
 =?us-ascii?Q?yGdPQSILFADGkLfGeYnn+5H0gUsZWQw0oZDSNx6p8PyL4ndWRu72EG+CQf+f?=
 =?us-ascii?Q?KdKDgmrHauPsTwekaz3cy5z8jjz3ODiEsUqonqKS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aaa0d8d-b40c-401f-f7de-08dda739f71b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:42:35.8696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xfgj85ternQHLOqQeCSp6xFWYNyPWvWZhlCdAA+gRzKyDxfAKH0mkWVS2DAsbttvpIWs7QnfNQgUL/SWkuO+Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11360

On Mon, Jun 09, 2025 at 05:11:27PM +0800, Richard Zhu wrote:
>Correct the DMA interrupter number of pcie0_ep from 317 to 311.
>
>Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
>Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

