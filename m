Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2069.outbound.protection.outlook.com [40.107.104.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19701D7E31;
	Thu, 10 Apr 2025 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297355; cv=fail; b=nBONX3XhpJeSJLilOWz17U65s2b6S3OJUQmeajLH+Gx68np0H7CBfmni+fsjYWlzIUQL9+hZfTwPxiRJydjwFhYc9yc2VZrYUyBexsLLaMuSly93BfjEHNoPUeqXmya9JwOfit+3u7glU8BXq2xDuTdCjRsk5KisOTdt1GFGIkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297355; c=relaxed/simple;
	bh=V1En2wue44K0+2wpodOWFQZtJRJzQh8EV0DlFIopFkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FC1BswMKqrRGag4QmT3sBkJDl3WJfL+J2fr65fAHd9qiKB/GlO/hlxY1/9yHSM/O04zHTb8Grbfg5qAABzdI+OED/URscn9d2QLADxtollyN0EH4Xp4Tjfpj9hW844eoHimzMUaQ+fDJ5V541I2Uws5ffOTdFy+Bxxmkabr28rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g0pypsQX; arc=fail smtp.client-ip=40.107.104.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g0pypsQX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7Ni7VQLbqV8Z04NEIu51wyyrqsjwJdQXconOS/PziSvRP7h3oSDrU+QKDk3UAWqyUDnmqkVIq/frD7XZSD7UZBsGqa7Wekb5Xb6uianW6Uv+5wqrtMY0XAeNMd9ew4OKMOB327U/8u9zRFpPs/rqhUkA9hbw71jC8Z3iiMPYmV5/X0DiljbCJYIv0v73Mt5zPzQBjOzOI3bmOhZEltDcekmsKw0+XSHmGlRjTw/7WYYsTDGgnZc4f6S7f1lPyJReNHwaz69jBvFUHjp0QXfHkpbe61c7USHnSOqOkUQEQ8E7UQhtihpo6ThEDGbDK2LXKljgUeYIQnY56hScZXXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1acRmQN4SgmcEnmaGp6f8GcFCZL5kUq+Y9IaE5qZMCI=;
 b=NocXDYVjAWGOgxbSNuBaviea9TPl29NB0nFhE8YTK9/pfsRH9ygRCNsX/ZWYaGhpsbz/HmfCN8i7jEIk+uQUzo/DQDnGdjNQo0BPapebhSAj7dPk2T79v8q4eyfjp9g02gM5/sI1lUhM7n/9sLN83yJ91lA2a/vZtpV5PTqU3wYz4DhFxYGZM8wYaoi+Y5LWBOuSXuY1adQ6YA2MavrRKWzF9AVCmUkkth45NqtD8KIPiC70TPiKTdaydXZ1MntjUghb98VAUHyoUc1BhQWYtB+I+GncCS4KohFlP93ZUhcWj0WgMVpLsDDqjq2bqKUi5ZznGWxAA85PIIlw8m+/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1acRmQN4SgmcEnmaGp6f8GcFCZL5kUq+Y9IaE5qZMCI=;
 b=g0pypsQXb1DQyOA66ylvJRB5xmqp0rwzjTwcN+CVTq+OyNYpY6upQ9NV3o4cVoJLiZLYOCIQ0M/2HT2w6LalxomqcMDI2iyQ3Zz1xGOt+Zt4POkkR4tj42LrdEBACXL0Yhy0ZusP23FO5//99ms6BCZgL6K90OdcoEOFUOsNTpm/nO8teWSqNtkDbmiiVIdc+OSUiDIjFn0bazyOq6dLq62w9IZj+XqkZYfYxtwp17zIVlpZHIQzZEpKlXnkwfne1zSATsK6rhlawhAFsmHmGvIgHNEGQNoiF75E6yqY0nXqKRpr4VwRwheuT0/70QfQ4jxOtugGxJLdmx+PhA+AZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 15:02:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:02:28 +0000
Date: Thu, 10 Apr 2025 11:02:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 06/13] arm64: dts: freescale: imx93-phyboard-segin: Drop
 eMMC no-1-8-v flag
Message-ID: <Z/fdfwPrPMCwgaaD@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-7-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-7-primoz.fiser@norik.com>
X-ClientProxiedBy: AM0PR08CA0006.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: d75d5bef-4a7a-4470-69cf-08dd7840b5ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?00MtSS+hjNOvDvXSI9B+NwbmtisqkygYFoKUAviRY//Q1+nNASHclQYyfH96?=
 =?us-ascii?Q?mKj9F2EY7oQsVxHhqp1mjyVIAycUcQKXy/OuGVWzNDz85jNGlUjc6jDSgt2k?=
 =?us-ascii?Q?58WdUL/Ze8Teq5KKbp73iqZopgsGV6+y60yrzz8hfzwjlDq9nM6IVlNkKb3b?=
 =?us-ascii?Q?4LjYdjNSlPjvcNYS53pWd+UP4sZ/i/UePxUfXBEWWyfEwO5I2F8iIxnCcCaq?=
 =?us-ascii?Q?8Rw2C1U9spoyZRtXisf0/l+T1ShEP56DN8mE3cKOS90PI5bmm2uMrRidAq04?=
 =?us-ascii?Q?M0bj9XMx6ueCyqO92j+5o45FJikra8AYE6ruozvOOOPRuxXZW1iIdwvvXJui?=
 =?us-ascii?Q?SmmB/QGfNNa9cwGmKkU9Q2vPZuLRLrSrAFmJIsC0tsw8Pdt31+k3smyY/pW4?=
 =?us-ascii?Q?Jc8BD49Qhjz8ZV7ZYduqmmslJPlumEM2CvWRf+PMJpxkJJAYxFNIxTbPfJRa?=
 =?us-ascii?Q?k6WTanTpg14brnVSJfX8mXW68eXieeCQZ5+2/yEdv2rLNk4hran8CJdXSC6z?=
 =?us-ascii?Q?qxxqflAWGfh+iUTNojUlztSRAEgo6yddZOvGGpc5wHxrt1t8AojtFRhB+GDt?=
 =?us-ascii?Q?ZJlpdnlt5kb9le4YRGEYZh3ZjmdsNdk3qbhvZd0yuRgemWp1SyWKg1vK5UO/?=
 =?us-ascii?Q?CjjQ0GQfMJGl/J5kydm6VcGuDsMolGiYupra6SPqa6b5ApiFETN4kHBVT6EU?=
 =?us-ascii?Q?emFnB+sj6RiyxEGd7SW2L2a65kYiFrqD/IF/cK+CI3bHqRFxOy6q9q0AlMHu?=
 =?us-ascii?Q?xGENJCYAm6ciwjXqbNuYQhEY8n1fCUFA2YnzuzC86DDNZjhxv/L98jC/v7xa?=
 =?us-ascii?Q?7DVQsKE5UhpetpcUiZ1UJL4BMDhD8LdCXc57zd1/ZjOgeDnhNghB1y2vpiOp?=
 =?us-ascii?Q?IYlaXSS2pRtftsU0ly6o5VpZabqKG97HaHdr5l7UhcPg7ph7PLhCMlBGSVDd?=
 =?us-ascii?Q?ZuUGc2LHNiEpw12ZWkigaRWR9UowIZtdE/E+2LJt6eWvDsMPvHiXp3jbBXq1?=
 =?us-ascii?Q?slUFaj46SrQsEOq7bp8KwruMsc95K8mz5AIrZlKuoubr10dCZoZaqkNSJkSY?=
 =?us-ascii?Q?HMTtkfrrLQs2KFW9ucIUSntYyahbBYw1xJ11MLkQamk4wsQy7rqxCGS/qPRk?=
 =?us-ascii?Q?+TuM7OT3XDHBE+7jbmbyNrJbXaXZfbmQoEkomRf8giz9k3RRFSfGPwjeQaZf?=
 =?us-ascii?Q?bR48ljIC+vjsNCQR9oRgwMphAgTW5329HQQpHyqMy5IxsyqPMNHIDGMWCd92?=
 =?us-ascii?Q?fbMaWKwNWrSwp939/YikGJWTmEw2VBbvk/cyLnZZWFfTQp9YZsfpfgI8Jvfw?=
 =?us-ascii?Q?9+IxTLynq7gdlhrDlANa6E9wSVb3Qt1wl9qCD6MVig+vuuml9Zup82sTuha0?=
 =?us-ascii?Q?qC34d357VsheQBv+HsPfFQS8sC7f8xCsuSZomiy1beHbLsCvPb30lDSq13NX?=
 =?us-ascii?Q?1ri3bHCNAtDZflIy6qvs3x9Uz28xcSJN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Q0eVI9jzTZOs2UqdT3/0EhAG1fS7fffS/Jym7oO5GtCWa5NB1j/GLnB1G7B?=
 =?us-ascii?Q?mWn43RNQfqjuUqB3J8+jYx9novQFyGxd82Sc4OzNT0xhUVcPfdjQ6zlm5aJH?=
 =?us-ascii?Q?d4SjCiogXEkby5NlVgAAWdpJCRov8e9/qaFsFQjeAqf0DCmAJ40W2xcLP36/?=
 =?us-ascii?Q?uKmvU9HX2fFXDZF/nDre2fQ9gjka2X3yFeeo+dTlDlUw0JVK1qAcEAM2UE/Y?=
 =?us-ascii?Q?nHGp6+A5ng9aaY30knquN5ApodEBSM8R4+NNV42Dexe1aCaMdFQ6s4nD68J0?=
 =?us-ascii?Q?IwvKI848qMw2SNAPLL8/92qyhHO/1aaM3wXmYABtUBnGRp1QTPA5tJWyGcwo?=
 =?us-ascii?Q?fo2hPaLDmrfe9qg5W+F586TvDlJKrW/0jkD/4pxIADyibJKBk4/5y4sBYHiP?=
 =?us-ascii?Q?c2q5rOklLLyVRqwqbz0ORHHx8FYghzWThUjHCL1M8IbDcGsmdQu5DY9Y47Fo?=
 =?us-ascii?Q?dgqOxOPwYvp7hNq90xztmznFs/H9PR9JFQRvxI1vl71hk6mQVu2ye6KHBhtT?=
 =?us-ascii?Q?w0hED3tQQoRy4E9JZRzsziey/ipMd8GL341p+0QtWf4jBGLvw+MRje//Bq/9?=
 =?us-ascii?Q?PZtUGoqCThoZcbTyQfgYOibGtDww/uBPIYummkF+pnZ6N0+mgH5u73laBOJk?=
 =?us-ascii?Q?2dqR5sGb34ON4w6TvzIIc7qhmuf6C1/1v+Qi7V2NYzX4ysl7jP0nkLKgEk7T?=
 =?us-ascii?Q?VqYwzJyEx3n0xioFmvQGRPMyx5SpWIngSIG5xbl/DlNi1B/hEvPiUeKF7MLT?=
 =?us-ascii?Q?P22dox4/gFAgZNZHq+wpUWJ9Yml+6Avp1OufFmUBDfCqH2Vmw68sQ6ekQnsl?=
 =?us-ascii?Q?OBQdKTeC3zJTHZxdUkGbSzIhHuLstBrCOajELtUl0hnAra+7NV5BfT3MujzP?=
 =?us-ascii?Q?XgCUsTzgDfUYa5B4j9jrzLjraF1Cb5xb3lhw/mQ7T3vDfj03b1z6J8h5a8dE?=
 =?us-ascii?Q?mUIub49jlAtNJS235f+nYEnvMlWAbvT3XsK4P+vXkQPt7ajIXGw/cTSZzxTZ?=
 =?us-ascii?Q?r4h+KgHk2e4mO+h2FvRP9pdPg5PffqnBS5+/r56sh9Yw1zUUMQ6dP5XhVatz?=
 =?us-ascii?Q?bfRXLd5ljgL/4HeoYlBItoZRRFkqaDqiuaHqHQq+UluWu0QJspXPTPIsaeDZ?=
 =?us-ascii?Q?IFLyVogymJ97hYg9tmGJ0RXYcaSg+ryMbpBqpmBcB8E6Ka/pI3h1SBRG0o8U?=
 =?us-ascii?Q?3zAFKLOpU58AeRY7yl5FomKvYVVam7lmS8D/BDUn8rrOoKsx1Tn3aMlFoPa5?=
 =?us-ascii?Q?kHvWFG9ndEkr+jTmViQYcpGMI0b3cnD9wvETV6W75DC0orBsztqhmdehQYPx?=
 =?us-ascii?Q?rwbWqwcmwOpy4VZ2qXocrv8hvFEr7dfaaUtYaJZQUEIWxfq4yFCwmnzP0anI?=
 =?us-ascii?Q?0VEePknC/qnPEX+JpXypFV5irYOM18Cc0mux8ELIJMy7LFv0xO5VM1KC1opy?=
 =?us-ascii?Q?EhdTutw9AGWw9nVrnarOgN/7IyHlyRR8znP47R2Y6G6MuKKIX5ptKD37ytUN?=
 =?us-ascii?Q?ljddnu+LDAr9vmxrPPjmeMYH+k6/c5SogwkkUlkSsjUvCFtwJJ6079KjFB0L?=
 =?us-ascii?Q?0GbpG1oAtMJys/BHi1MLy1A71/UuLH6qhTE2c36Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d75d5bef-4a7a-4470-69cf-08dd7840b5ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:02:28.0217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQSEp0fvFSnPn2Fl6jZN2oLWQEwMTIXSBU57rnHyQSxbA6NUPLi3q50fmDXgLdVXcFLqbfogrRup8IpUV6Ad2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

On Thu, Apr 10, 2025 at 11:02:44AM +0200, Primoz Fiser wrote:
> Drop redundant 'no-1-8-v' flag from usdhc1 (eMMC) node. Flag is now set
> by default in the SOM include file (imx93-phycore-som.dtsi).
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 85fb188b057f..902b523fc92c 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -40,11 +40,6 @@ &lpuart1 {
>  	status = "okay";
>  };
>
> -/* eMMC */
> -&usdhc1 {
> -	no-1-8-v;
> -};
> -
>  /* SD-Card */
>  &usdhc2 {
>  	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> --
> 2.34.1
>
