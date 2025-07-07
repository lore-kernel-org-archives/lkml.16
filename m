Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4779273D89;
	Mon,  7 Jul 2025 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751872810; cv=fail; b=LnkiMN4SN6mtcEDJT9NM99eNLxTxodMN3+OlbbvJF1ks9Jn7iBkM6ltBxLkOw/nI3wglo8SxZRv2yEY4bBVX6FLrOXJUGbDxwU/1VCJJhhRNHA7hmEU2WWaFUPB2zjVrPMriTBGTYLvc9Tkyx8RFiHFRvxCjfGU15kaF9yTW1n4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751872810; c=relaxed/simple;
	bh=Mqz5z1aNi2GrxqLlVGWFmGF4H5K6VMAkzhkwk9phJWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cxKo+/zK4njar0T6VXZenZMuIAC3/pTU7DL/RR1U5CxhGs17qetdZSZDRG/HqKvFG1gopZ+Mt8T35UGdckzissQuL9aRLRWmYZa/0YVTKuLCoz+/eppZHUL0MCZvt1BppO6zi9S4jFGK5b7TEybYUGzG8iApBEwd7k+RUyI1gD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dDyxp8oS; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dDyxp8oS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=or/Yf36+SCDohi+e386wVYADJg/roqi0tAAaZaddfKSGpUdqJq/PD+ul7UJ0odXxXxz+5KoMSIVhJXz2rO6fJW7I/AVW3fBEmhlx07HkoTWzDf9PHaOC6izfQhw13EhstlB9a1yoealoirG1saPrSuYqHQnldz94jSHOLwOLF/TEX0uVTvhgoWj+GroyLyeIP7vypRTUflFIsXyUiq9Q7n8Q/VQJNNE0d9hbe4EC0+zKvPQ9BzD+hWhDnHAeWz9yZJwqmTbkmmxoKmpz1il62UI7ZPPeZuXMYPSN0d60VMir70wWQktGeaXg7FqYXmKV+l4GKHPJEYOIccO7SV2+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mqz5z1aNi2GrxqLlVGWFmGF4H5K6VMAkzhkwk9phJWI=;
 b=Gi0kdiALxRLJ7oykdVgppLnIwzhNAxQdOuzqg5JuXLf2TscF4COr4zKa0+BtAVNtsQJbLozXpcqOT2fkfq8rN+847gJL7qszxJTLNDP1LfQHNJ7FinHsxhRiBuu01V2CJwX5ZDsgcxx9MvEa5AktizQz7qvJEVS384T3W0YPyGxyaGgFpH1PylWWZQQYJklZAG/ZzsZkgIarn5rQp4+uexCugafwebTygpDPSwkna3jSgu/1UWPKiM3G80XIf/epyDNu23KnFH0+mLHG+vfJHF6RHIY1VkBz8bOd+6xyg+ZzEnTW9b6lt+HqAg+uad1QMfFhTSvEqaCMLCPgVJFY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mqz5z1aNi2GrxqLlVGWFmGF4H5K6VMAkzhkwk9phJWI=;
 b=dDyxp8oSwOcXcrCADCRKzo151tnPzkgri25PmqItiTz2EYToUiJFaHdIxI2iq4+daNOYLwQpx3BwkQBiMlivZJNLs7pc7ZxHmlZ4fLur/mNIFTS0yci0sj541ncu0xBKJ1lCBkcNUzhce0/ZADwFoqkl5IaAmIrnoMsIRkjzwZX9Lv9nnaMlfIzuuc5jp+IzSRTwKj4zBUsYzSFdI3q1ZVYdOF814MnU2S5uEdt1faGDMJTfQmDe1PDD6Bp7aKdJhl2f5cwOGT7BZ7HBXzhgE1ZUY7tWh3/3Wo+PJz3/vXf8tdbYYq9dvnwGVkzjnww+9luuoFysbZoq+NPWrlnyJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10209.eurprd04.prod.outlook.com (2603:10a6:800:244::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 07:20:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 07:20:03 +0000
Date: Mon, 7 Jul 2025 16:30:15 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/80] clk: imx: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <20250707083015.GC11488@nxa18884-linux>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075400.3217126-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075400.3217126-1-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MAXPR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10209:EE_
X-MS-Office365-Filtering-Correlation-Id: af44933a-b924-4972-43d4-08ddbd26b12e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/QN249/UwduAYTyzp0voHVtqGGfVx72/LeAWnFLESA1gZEAnRF2tyrcgwaiR?=
 =?us-ascii?Q?HYcPedKIrCvTDY2BHg0xMtCOfsdcE841+J3naQ263zgWIHdSXb03oiAZCCLs?=
 =?us-ascii?Q?2A1n86i4pBNUkqdgTiQXv3nHqwolg441WMtLfNnwHpmRd5hsUTBk4GpD0C6M?=
 =?us-ascii?Q?Y4wlbfWhyg3lLFcdX7+/5XT7/3bLwBif6k29QxB2KEpHAaPEFOPYojvsjXFB?=
 =?us-ascii?Q?qItMiK76KSuUCAExoQsNJbWIiHc7DP6wmmYYfAF5dKTBJ+JGFbXMbkB8FDwJ?=
 =?us-ascii?Q?bA8YDj70FKLAZ7vsGYFmbOi0MlNA7r5pR5nlOgeRHj+7RkPO5FoqS+m3Fu3S?=
 =?us-ascii?Q?TnAzRwg4dg/394lZSjct/SnlmIoo7T3AhZx3Rklqj3J/DkiCKPh83icE4fAP?=
 =?us-ascii?Q?Nvo+37Vzovzh09Erkn+Bg7am1DEZ6pFHL4u0THB/SWf7QrIucvzMLDW22rEf?=
 =?us-ascii?Q?zKW260dknMqFDRBOH3t4+PlqgGneRO+soStLs18i6T6vCDaAV6woN2K3ZNxp?=
 =?us-ascii?Q?1NKV4drmpQRZVMxg0cpxRldGZnsCZIK80h8+9R9qTW9j/OFHZhPEOtYnT5RG?=
 =?us-ascii?Q?7/2Sei3c5SlfnsU0b6JqZkBzdg0uf/6jNwXSXDfz+lM9j4A6J5iSyM3dPf/0?=
 =?us-ascii?Q?HJY5Oz+TJ1PRvlwdHT/YYVbB2+Ru4mu7fbSCeu9DoY73d2W9Tf22eQdkx0UG?=
 =?us-ascii?Q?yk4vvmojkthhw4AKzHyAtHOfL9gEEwk1Le7qbbJIQ147cVuClFe0fyRcb6Ut?=
 =?us-ascii?Q?+K+O8r2nvxSVqzNfE7PtL3PkduUUyC+MBV9LjAI7Qu/PncrNIb6thgrvRO/C?=
 =?us-ascii?Q?LBSfz+zjecvb11h0Zx6G8mxKhLXQCPnr52rKCZMudnTJd4lCAnRp55cZF/nK?=
 =?us-ascii?Q?IM+453mlmtnoj4ccHByakv7/csYifP77xOd6YWsc+jDl8iQ3fTmpp2+Pz0Jy?=
 =?us-ascii?Q?zFHngpf28YQBdAEV3+v4ku5rRK2n0GUqZrLugHpJ4xsatW18rliyUEw1qmuk?=
 =?us-ascii?Q?+Nq0t8jZRARuosXoSLZ4X3Efl1599IiTfzDbK4/KSOVzCPzl0Ga0gkQ04D0Q?=
 =?us-ascii?Q?Noq4mhUjEy2wgboGjog/fNHGqKbR5T/QwrXNkkO4pGHzF4PV3h9cXCws7ZSY?=
 =?us-ascii?Q?8cOe+O4Bzv71dmUH9UHWvnUyINmmRcn73oRX8qBngf/AO28369z4ImJ538Ip?=
 =?us-ascii?Q?/TO+LLbqeAPh7rqxxboZNaMweHzBUvB2jrwQ1+zyzprCzL95dBDYJDhWYCK4?=
 =?us-ascii?Q?bkkZi+ayQ4YPIltkaOafsozdS/Fsb1jShWlqXsouttuqwGewBaoW/0aYB/WA?=
 =?us-ascii?Q?sUKLTh6/RU0kDv1FKNe2EUPcYAvuz63IXbR4eQUrv2rkx+Lrmvqujppso0Ev?=
 =?us-ascii?Q?9hk0hxPo6Ljg1zFsCSjpWaKM0B/ZcPKhmr8EH7AXsZQw2EmbjyiB7RJUmxuY?=
 =?us-ascii?Q?6SyLjkfhGgaXPoheseqGSQxDSXdBqepNqoO3LfaJZjxmkOEqi+I3sw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lDetwlckVWGIA317itlSTTzuzhQeCfGVQRlkX7cqRRciEf9xQRN6ySBYU3+C?=
 =?us-ascii?Q?9ibSJj7v2OxywGQVclJsnQ1+z0FrEedKNoYd0yCSTcxaZ1v/8w4hUENnJQwv?=
 =?us-ascii?Q?GOxXVymg29BuJ9+U9w891N8AlJyF7J9CoSChHRcPXzmxPRgdr82UI/+CxcvU?=
 =?us-ascii?Q?MjM0zof+F4mouM3ijbhhKWrSPxnNk68CIoQcTccPCFY4nRv2wkxa5octi1cs?=
 =?us-ascii?Q?I/T5TQY4ygHuV1q2rxyh5/f1CmnDcnPJvKlt7wr126zEOwJi1Jj1CGJHyDB6?=
 =?us-ascii?Q?axaj1zCp5k0kF3eP5sWAqZssuYG+ECjx5MRK9mGZ3BvcUT6GRbQmEgZo/06Z?=
 =?us-ascii?Q?5H3ZIS8k8ERHxcFx8pm8EEgL13wXj6+r8JiaesjXuks85oQKsiEwdWP2+cG7?=
 =?us-ascii?Q?aoG3uw5thr3HLI8F61UtPdRdLEFv3h6lEZnTHeEk/SnHxO3QOqOxF9cTZU0O?=
 =?us-ascii?Q?XZLuin9dglM8h8GzWVq3Cs7J+BgmQAbZHe7FNZtMWgt6JU+kxFRLfoMjhmvJ?=
 =?us-ascii?Q?FEO7DCp8chd8XuMQ9E2qxIp8kVZKuEpK7NevReb2rO5/gBvcTe64CSR0NWkk?=
 =?us-ascii?Q?1E/i0+Ref0vWEWE8ObnD2740dhUikREmC26sE0O8olkfkiqsKXDZVJnTcnYd?=
 =?us-ascii?Q?GhFwbHGPp0Zig4r0399jB/8aprFwfWDSpY7874yWoJBIeF2p2wegeCCX7DXc?=
 =?us-ascii?Q?77QvWun45dgn7RIPeoTNYUJv2Tan3HAnaUV8dKQzvwFYAZtqWEZ6cl+xhHOm?=
 =?us-ascii?Q?igd7VqcgZSOTB8T/fnsL/bX3BdxZuSsoNbNlUoM01HEcnrEYQsVUblMeTYx1?=
 =?us-ascii?Q?5POvevlSJ3d8SRP+gsMWrT3RcaJCjpNQMkS/7ep1mAOsJgbkOtCPHOxED67I?=
 =?us-ascii?Q?omXPEG9gH9RjLRLlpFrGmI0xakKllespKGl06riEupCfpwTwIJhgNAFZ6lAp?=
 =?us-ascii?Q?xNWtitBB3sfo0P2Ux67h5DZo3rsw06g3qFqw+R1pE7RNlD6w9JJ5AkItxnaj?=
 =?us-ascii?Q?lSN6PDM4H3pcyriaIUyF09V3/XtFLIRqehnXDLGooPwRT6OA4mIMOLnAf2FS?=
 =?us-ascii?Q?i0hjEZT0MG+i5kzQ+bq04pRNkFshmQEHzNzx6yn0R2Wo7ofSYUujPBQqN6sY?=
 =?us-ascii?Q?KTGhWgzuqkhWMIt0YWrhs8kwFvIXHQHQKdUdwv085OIEy929U++/6F+EtT9q?=
 =?us-ascii?Q?Ogu8Fjyqm8qGSTYslLjy98ZBhd8mJiTHA5tpT6+Tu3HQaGkIrAPxQ+fdcUYD?=
 =?us-ascii?Q?hEofr5i+5Ytq3E7oFik8A0uyMvtlO+G1Y1oPg6H2Klv8HiDW1DWanfcXuLeU?=
 =?us-ascii?Q?Ia2Dmk6XkRsR5Ma7Bk/EycCAglM1/1QXogv/gDng5oaZYHplGhlphO6qQE8N?=
 =?us-ascii?Q?QTuwbndno5S9VkypmEA6u7FoiXfz4+x1N7NZEssY7dk9c3gtCBpiLHvXt+Ee?=
 =?us-ascii?Q?GgFwtWBwb8r/BXCGDDlHORg4aMbgg88XHvJd30c7LueQ0bsiw3LA5T5g2Y6a?=
 =?us-ascii?Q?o5KTHrj0X1K8gR2XPqpMlTEw9VOopny+rtqz6OBUDfYWIq3rfjLbHB1GonwK?=
 =?us-ascii?Q?VUAGBV31fSt4u2OU4x9H5nEzLCLn0Qd+YO3shDsm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af44933a-b924-4972-43d4-08ddbd26b12e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 07:20:03.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4hiKgXVjP9k1MOHbGdpxBT2CUnGGe5yMDkyvUmtNGExlW1C1/QmwBA9c0J9ZGPqijWSo6zq6U5cekgt4Gx1AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10209

On Fri, Jul 04, 2025 at 10:54:00AM +0300, Sakari Ailus wrote:
>pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
>pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
>to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
>pm_runtime_mark_last_busy().
>
>Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
