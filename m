Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010020.outbound.protection.outlook.com [52.101.84.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB4F1E412A;
	Mon,  9 Jun 2025 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459101; cv=fail; b=LGEiriQW0iq7tHJIpd8EMVzr/t3ia0B/e4FIYfpHJKtr+dzdJcSIABKJeobf5fpyKghRxNricZkm2NNAHbgzOvXLqPaBJnap3oriJxmp4OFcKRhcxNAQH6MCq0dVuig9pc+6kGueuVnfuExp0MW4S46Q9lyE+lXhiFmymKzjCqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459101; c=relaxed/simple;
	bh=rrpAB6MtsSfyvV3s6vvZ92fchyaCIL0lZ9QPC/qZcMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gx6jNbCJlhnUQM0ByJtOyQS51RdTm7a+6jYXXMEqi9IFPR7uZ7V3NzUwhGS+ZnklkcR1nC9qF8jzst2Xyjkb4xcAj4nrAReExQCZ3IEpMHZET8VZEIsP7O5IUvavgMfv91+a1sZ7e/4FIkUBISwd0akeBm1vQQLu/hvLeEfGyAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CNYNwFVz; arc=fail smtp.client-ip=52.101.84.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CNYNwFVz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xnMHwyOY3syqP7o3IJuTlOKRSvY0tDzWM5eO0aMHY63fTIo+od5WamvwurlqgCmwF0GH4AcrUyGuBHrmwDBW3OTmsWXulNysr7d735LOU/09iMpHlfAG3Sj0jF1CR8DR2tXbV3y+2I+uhQciTQRBzv9t0iTa643Z9w1W82P3fN0iBDB3tB8sIgYPeYy7fAxSI3/isgpj5BxTfHGZjHjKInMahaq3MXiZ6wQgjzjyTUR9udlHsDA2Aedny+z0saWLjpJ4/6CbG1dqS0jZ97yTovJL8uz6ug8tMxhUDNYfilNkyZHfADYPf+zQ4xnFKZ2ptebgSiBpdQlIzE2MQ1R5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrpAB6MtsSfyvV3s6vvZ92fchyaCIL0lZ9QPC/qZcMU=;
 b=wPTabr9Z453j1xFWzntlYYYmcszH92xnciRbf/jhSRE4nDqqma4pedn1NLTvWiRkKuC+p+FzDvUFhcTzLfFT6+natJuPOs2zx6Mttae68PzN6A3K4d6hRIFMoBPOOpxy+iYQ9NLxTKr0n1XinAu3gSbotX9XbhRiqfZlVGoqy1GvOu+GlRKqOKKs1y27uTgSk7KW2Nve+Hgw6lKqvz1khxwMwNP3fhFu+D/NjWo5zpiGqr18/htx2ywzFzLXaTS5M3lgrIuHgVIeYRYsROtzL2wbo4Sob/XHVc7S5G1iI/epJ8sWPCJpznUqjm0JhoJ1l720ogPhk8GvJcZMABDQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrpAB6MtsSfyvV3s6vvZ92fchyaCIL0lZ9QPC/qZcMU=;
 b=CNYNwFVzZEZQpvMdHd0z/6e6icInyIIOERf82IQC7m0z5N9Ccdcq32UWdCdna78rMHkOHmwX8eQ+rbDKubgCYwdP/Pmq7QoXC+ACw7L/Xw06j6peSHSq0q/swikwHLnWnwwxywo3ZZEBzreEx0mnV303e1yRWWn/l0qtrlRYwOusTWNVo6lmx5EIswygJhafnlSrNZZqy84UIBJA7f/dGMHLzLjQxlwYKAZJ4b+tZseLGO1j9kSCRLtQh+wgRKF5JJKiVrQSD386RnW3Fb177YpTMHE06XUr8Fw0N9nWHZYWulXlRQIr9ZussyxJhnjo4rTnJ/dKoDjM15EyPFoEWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10677.eurprd04.prod.outlook.com (2603:10a6:150:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 08:51:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:51:36 +0000
Date: Mon, 9 Jun 2025 18:01:43 +0800
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
Subject: Re: [PATCH v2 4/4] arm64: dts: imx95-19x19-evk: add GPIO reset for
 ethphy0
Message-ID: <20250609100143.GI13113@nxa18884-linux>
References: <20250606190045.1438740-1-Frank.Li@nxp.com>
 <20250606190045.1438740-4-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606190045.1438740-4-Frank.Li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10677:EE_
X-MS-Office365-Filtering-Correlation-Id: 968a8d44-98c8-4f4f-46f9-08dda732d78b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FThcTXhl6LurDP6avHSxm6uAdx0JrvREOWpwLN230NiS513FQKj+aeJWCYKr?=
 =?us-ascii?Q?uWwt0PJKmvZ4NxGvQwTLwxkc3JoAxUfcNcCX8Q4qrLFuAMd+89X7L7z6Y4bJ?=
 =?us-ascii?Q?03jyhz9H5LTNntD8YZeQCWTkPTfp4jbcJ3jA4B5RnvGduTjakKpssGmiF51f?=
 =?us-ascii?Q?yHAlD7CXoQZ7+Q7ghux/q1EAML2Xm5jb8lruJkOrH/foOYifd2+qHq2/xmj6?=
 =?us-ascii?Q?5smkqLeihR4X5M+5VcCugE+YcSCJx7Fu0NaUSUfkCnUtg/yfyCsz+EyYSTbl?=
 =?us-ascii?Q?iD4n2Nk6pmMTet1pdJNa6AX1K1Jm2aUjo/N+dB8hj3MyqCkbnrqaFxpoU3vT?=
 =?us-ascii?Q?ATW9xwrs49P5fdnvDlSL/Rj50+RIkqc80SZyOF/Y6OwpzxfIJJFNudq8yXGD?=
 =?us-ascii?Q?5FBUBxb9Fm4ci60JkGCNcLvHB5JN4fbXRPIZiR+b0tFcbnO5cuEXJ/UW1T1Z?=
 =?us-ascii?Q?wSzBbwjeYobO5ElMso8E5F9jaZQ9aBtIaJXh7g2tYkSny9mQNj+OXR40iokU?=
 =?us-ascii?Q?5OnZOCd5F8Opl0iZ8uuauMqbQcjeQ8CIKz54t3IWWpQiAesdaAmMqAIO4Xwn?=
 =?us-ascii?Q?xw5lph1oD9nqfHvNc9+3lwHM18+/LzYG4oLPmHwbPWxIA6PiODLn4qAM150W?=
 =?us-ascii?Q?bThewe+Xckqwu2Msdh8lkBgBRfeDrNmasr9geiqFuGEu35fgAxZZaKwjF79T?=
 =?us-ascii?Q?MEkgsS+tfbp2/Im7Fahw4BO09kodArcXJKfhbdo0tgCTCToinW0xdRB1zCvE?=
 =?us-ascii?Q?seElDatX5Ftltx8hF8Gz0rXRyc2JoHkPG6bPDN0bbhd5FJo2TECcB5N8HU4j?=
 =?us-ascii?Q?gufjK1nxPcRSejXg1HGgDjbLy8Sv4IlA0REfXYTPCnNgp6W8jbLSwivLmzI7?=
 =?us-ascii?Q?K7ZCFuR/ahKVI+hE4MGoysn+OEuxCxfzDmo1Yo18iWPdziheXkOfk6V7j+QS?=
 =?us-ascii?Q?L5vTiQc+GtbHYRZhFAj/xMp31IlvRiTFCTvUFEO0GEBftnOItHgqzuDxukcz?=
 =?us-ascii?Q?3SqimdMAkPd6pElxqxIMpDnkC5Eb3o95x6zfXRJtuvOc9PmaSefpj/U4D2aP?=
 =?us-ascii?Q?aQjxyP1LLOMxN3kGLmFPnKZxndoakJO3yyzQxOavfYUf0H/ZzV5+n5oM9DuT?=
 =?us-ascii?Q?OusKqWjOGdK0BXkBhx1zEzcKdwJkfpPmHChW4F9Gy4HGDny7XhcvA1nzRj5y?=
 =?us-ascii?Q?z3C6oxZ/Tyg+xS6qf1a8JDHbzVBLmD1dSOH645XSWl/HpE6mMtYUcxek2abd?=
 =?us-ascii?Q?ZLB+9gu7w7wVXmJM2+xzlDnH315nO/OpOR59MkIEgNKSiLJQiAwFFW9NLNg1?=
 =?us-ascii?Q?c6OUMspo5c0b5jSYNAwpxcpa7qletWae+ZuQWgJwIk31X90clVGSvdgboZjI?=
 =?us-ascii?Q?+V0GGpYqUOLLiLUiUoXywPjEXuQhmJAAJA8W3ATqwQ6P9YaFQxg6Pup2QICa?=
 =?us-ascii?Q?fClkOnQgH9G0FtzycKpP+UILRkeNcwxk22uuVmz23jRlW6D0cV7PkQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YsO7vNerv2dGq3U8GE3NR5OiZqJSCERmptQ4HHOojGmouz/mymfAvCKxonSG?=
 =?us-ascii?Q?bk2gc6y9x0zO3soPsJoPvLa/ezCpwIvh7exsfaJL3DQDt4xbgfAVjMzDTvIo?=
 =?us-ascii?Q?YoZPMjkXz3+grMrA6GpElCJNeKQg/m6JFS09WbHyM0E6kCgBKO5GYrvskS98?=
 =?us-ascii?Q?KPlhR6q15ecE9Wfn+VqpqUxP84CaILfaRhnRm46Nu8wRSQ85LwwuF47h3ORe?=
 =?us-ascii?Q?QS1Ed8a+inYqm2gQDIbRB6sd1h0MNRhjarpj2GofdKBorK+i90N/XLDiHTIc?=
 =?us-ascii?Q?vkBgc7pSrbRR3nta5wBdLlha9xIFKMJp9GOZTEtsi1JDR5oTYMYuUKb/Uvse?=
 =?us-ascii?Q?xmOLzRJXBX/tiUWC1khhHD/flLoRwnDMtlMMfBDCyYKmPa3uC2QPpzTFl+Az?=
 =?us-ascii?Q?Hveckf7klrgdJ671IJ1EBkbT14KQzGjJ/4eGtr4IvHH5CusN/PtKzVWdPCFm?=
 =?us-ascii?Q?fyElCpJ+qLReJE7JT7AjOF4YbiDW+Npiiy6ZYSUMRlr0Q0pWzDP/vtKOiEu+?=
 =?us-ascii?Q?adRidBl+6C2C2QPUtHg9Bw4rNMqaZVdeXV7HrwaDEkjjBDKgdUqmpjnNdlSn?=
 =?us-ascii?Q?EJeozrtowucGCrEtCpOakdG3YJ/+JX9npjc/nio42jzGJ7B+Xy9C3sPXXiTy?=
 =?us-ascii?Q?KARLLz4ILX5+JbVyNNnfyv5OYLN4/2maoopXoY6pAPUxb+5QoH9PR06ZKJCd?=
 =?us-ascii?Q?q6nbaxOYRTOATAvaDArJXfOTHVsfMltMrY9gfnG8g2yZu9OKYNGxWjOqi0j6?=
 =?us-ascii?Q?WMxknobZMI/OJIPRxpdNB9KQRAn84aT6f6FziRpNMSR9LV9efZ1iAMm7SWy3?=
 =?us-ascii?Q?g6b+nItH0NrPqKkE8e9bUugfwDi+ezPX6Btd8Hj0wlLecQz/3HOTIQ+NyG6c?=
 =?us-ascii?Q?Pei3khJW3HQdGBIjSVOcTJAJOmQq29j9rQnRto+lxmSMgJTHiHIz8ktwrQe9?=
 =?us-ascii?Q?vjmBIOk57wRQnka9SHH5IXkqvb2Yiwro46kDF6VZud3GBUVbQ1NP1fF7iWfs?=
 =?us-ascii?Q?PyhbOvRch8nu6T4MPN9T+4ciFvaT9iuH3XWN9myp9DCiMHnUO/Ng/kTJwHUc?=
 =?us-ascii?Q?FIWswNdg1fx43+bisR7QilQlwR51fqB+gja+/eHpPKt1leIzACbZvtVmqtg+?=
 =?us-ascii?Q?84IikU1WjxQwLmye8MoFZMGJiWBdDu9iPI7RXnFfAlADvLUvNec8wkz3QM0e?=
 =?us-ascii?Q?TYMHDYlKTZMVLc09FdXLw/aR/YvCLWNedEvt3/v8HaRxv4F/dRka0qxOSiZg?=
 =?us-ascii?Q?bYDChgVSQQV3Bg1vwNaVnaI+hN+/Y1mHDwt9hsfZmCzIGurvO0zC65obzPFM?=
 =?us-ascii?Q?LCbxqHmRwfpHAwdn3/9UXUPYw0qfIsTvb+jEnTqFO4zrKmQjorhTY/M+S3Dt?=
 =?us-ascii?Q?/upRBIv0hida7/ODqjLvqdWlPURPPZ+kdGbagsi5geC+Ug/QS5ngZ16nVicc?=
 =?us-ascii?Q?nWBQ+DsY7UN8I/kppm4Z+Rm1LP+utGk4zuyRuC1xFNV934wdMJzNocHlMW/q?=
 =?us-ascii?Q?Srn0ZRSTeZpSjrTEMkfCOmNV1OSk9I+ZtuU3s4Q7laXzzEFmgiZ/LQTtxDvY?=
 =?us-ascii?Q?dR2lrZUuDdcxfXDRgxe1A01kBXNYw6qcWNEfKY7f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968a8d44-98c8-4f4f-46f9-08dda732d78b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:51:36.4187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lTvN0Sd9gOF41zfgEnK/utghKGiK5gjJBsN+xCo24HZ5Ruf5xHnUC6UrSYa4z3Ji/d+uuFiI48tUiNqATU80Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10677

On Fri, Jun 06, 2025 at 03:00:44PM -0400, Frank Li wrote:
>From: Wei Fang <wei.fang@nxp.com>
>
>Add GPIO reset for ethphy0.
>
>Signed-off-by: Wei Fang <wei.fang@nxp.com>
>Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
