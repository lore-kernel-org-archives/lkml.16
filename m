Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012067.outbound.protection.outlook.com [52.101.71.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8413EFE3;
	Mon,  7 Jul 2025 06:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871292; cv=fail; b=VPl7iPhG/wOBvfPCxXc9RmxidOQukX5DZa093NkspdLu4KWpGOEhdqTiSrwX1l59HwIRiDQ1j+IKTpRCOeNraIHSlsxlSPJrXHJKIU9SARB9VVD7AXZ/tHAKQGGS3X60GMI/+YMoRxt/5wvpwYUab72PAYygo1Xz5wwtcClnoYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871292; c=relaxed/simple;
	bh=Czl0Gc97ipOONtEmfyeUbACM7LAXpd4UYRcCalFbqI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=czEK2aycVYwoO/XafK53veLphcQmmi/iR9MOXf5bKzucVK0frsvxCyygoAixN+bp4pTKDmIDt9fwWyCLe8TXsHpKwhhfkhii8XC9vDEFC5yFIeTMjQqRPoBACnH0aYLQRO4Mvp8p9BBzZPqAZfVTYp4BEpw7JsyPAH0bDPWYns8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B4pHHDw4; arc=fail smtp.client-ip=52.101.71.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B4pHHDw4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z95WDTTxnxxeuBNApX9zWKSg3Db+9MDdT/S3N/3rHXYjPNZ9K48UMbcWBWqiq0lreORk4vWw96tEfLi+4FhOqWzn1F9Ahb6K8GFwrBXl0GX0IbJiha4tpU9X0GCsq7VsLLyumw/owmL7UHNFaQgs/iOsEgDdKY6KNaA5jCh/WYNG7mx+x4bBrb1tC7L3SrfYbeQYxfGDk1kL9adEv9L7hvphZZW2pCsnu1fp1GjzyhjKQ+N26DJfjE3WldYh6AZUMHkjlWdlUdfi+dv1rzbb9AhhWPEBzG8wJINtR6sVpHnN8hHt6vyEICOKs4ykPXXGcFkfhc0MVFIb+mWRL7qidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L02b4//r2swTureqPWYxR+8SbRjQYCQDJ/3brwPKUzE=;
 b=D06oUQqLNUGMBRiV5hmkQRzP7au6kV6aG/Sa0l8dT9ffGsDb0Hu3BuYZSl2xfaoJUym517ryKXKAun9PNzSNR1K3DQLr8R8eFF0+EDmqLFHFHPNtxFy56FdvXJkwNgg17OyNWkSCTGCk5G9tw6NY0Agjc1Kor80EbgeGKyYeZy1BKRkGX2fjxtoqt1YY4gg/tru0A/OLHiPQ66mm1+xlbJubo8r3x+JKd/lM1V4hWdQWg/D6M8jdYuDn/Z7AiLyNexB3AgWH9FD4mEvhlVzlBeGxAIryCYG0MjVcZEE1zJFeMR0nXi5sRW86P1u2UqFfMF9sCldO83Yv2qpKujHJ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L02b4//r2swTureqPWYxR+8SbRjQYCQDJ/3brwPKUzE=;
 b=B4pHHDw4z9YymTklDSlAPn+ruR9aYbEcl9P1KlEHp2xQnPRdaoIaZMrwOT9uOqgGaBIaA7kdrfOybM4ONoyy3pMLYQeRtjA04ilHsziRBnFhQkk+PuckO0i1EDj0gNbXhpRRGHstOAx2Et8AkNmKWTYe3IYWpSA/nje9uWBZFsDeu02OUlhTJFjpb8d3+WK0RJ2O67JHY1suGL2df99tZ3Ay2gDthAWq2izf7ac1NOOVsmP7iAgeVcuneu7ogAacDPCD8G+7292yTk17BW+ZcWxShKTaPRHhLgnPyQ7rhgaRjlhVrDfV986+8yf8WuZeu8OMos8z5FB0C8FgJVK6fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 06:54:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 06:54:47 +0000
Date: Mon, 7 Jul 2025 16:04:57 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 0/4] Initial PHYTEC i.MX93 overlays
Message-ID: <20250707080457.GB11488@nxa18884-linux>
References: <20250707061101.1194618-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707061101.1194618-1-primoz.fiser@norik.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 9090fc80-90e6-4d12-98ad-08ddbd23292b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Z/cTz5f4En81g9K6duNA3cOEOgjLZMESD2NkcsvWaQ3d4a7j1TMULnwfWep?=
 =?us-ascii?Q?P6WI+v23st7lKOcBUFvp/1zVlW8ANFvkd8mM2vij4f02QDasvpsk3+1Ph9/B?=
 =?us-ascii?Q?o2+d77ueRzPE5bRK9CSYziNjBDYphD21Nre30ML6X91qrlXekxVeU1kHe4+P?=
 =?us-ascii?Q?OjObtz7t9y6YnhO3XO3sbFenoCYUOG0xrHGzcHafqIco/ZY1+JYa4Aley1Gm?=
 =?us-ascii?Q?lT6lr/Ho05Q6sWCarOvRZBKWHZQF/CPssCbVFNv6JaUrYxuU7GBDEFzwlV66?=
 =?us-ascii?Q?PPIboGQNlm6ZY9un1N8DFI6QHpPBVy6+kt9poePl6hoIZKSJuaxYGFZUDuNk?=
 =?us-ascii?Q?lIUL+MsqTOuJQnQ66A06+PZNVPNrHydVAllUqhzldrAi+9IdDA3S9u68s3ic?=
 =?us-ascii?Q?l/Oz+sclQjczNTvYy7/RhnETULHXALBSmSP1SHmg9chzilZw3q2oUd3aPFLW?=
 =?us-ascii?Q?fJJQPWnWfFxPuRwjd44X7tItu27LNrFXCvVme7aAta/b9pQEOHG+Pm49EdRe?=
 =?us-ascii?Q?a025/TDpZzu1zrCjqtVXrz+4ofq9JtTsjr7S++Xhjng0P364R/QRirqjXYQv?=
 =?us-ascii?Q?DD3IqMGHHtINwBZJCnLuvm7w265TR8eR9PwPdJ1ccx1WA/DwQWNwUbEgNB3w?=
 =?us-ascii?Q?bwCr4t/ciY5by5wkdBCTHLqRuRTbM/ZLvr2m+ls7eVuq7SbHaY+7IK5CZcjx?=
 =?us-ascii?Q?W4mWIDIOeJ/D6JTva4tKgakTb2M/gCEjhiBDxrUDCxfAzevhpuCCW1uKS5d7?=
 =?us-ascii?Q?PthWvnRI9d4p/eJUC+v7agB/6xXF8Ud7c1+gdI5E/pL3lrCDgkbcEiVTFhg9?=
 =?us-ascii?Q?27IVXIBlOj8W7OHnGEfknL81AlaYMiud/KJUJJsMZMzdYJg9Xiy6B5AKlUZT?=
 =?us-ascii?Q?6tN8sUKmYBc9llVD6fDli6iWB60x0A4L8qmmamNpO40Y0v7IpiV4+vk7yep6?=
 =?us-ascii?Q?fqP3PtCzNSwN1re5yNKmELpEXoYdALPaRjDYxK5PSJiaM9WjGH3dI9G4CCWO?=
 =?us-ascii?Q?b9RudybJdH3BJs/y9U2OryghSI86nD3KTjEpBKmV6sdwZnfHOGUTd3oA5ZP7?=
 =?us-ascii?Q?qTLwB/k7ELmfynOUV59qeJQPrXJdYulpfCAfEt+N3eq1ot/RL5pA/ZNPtzWF?=
 =?us-ascii?Q?ls71fmyHmvpFr6QhvW+gTdpHcZN7l7cQ/JioW+CE5Of8mII/iRm5GJ6sJBKV?=
 =?us-ascii?Q?iZJDUqGTFb1zwZJ2CClEdEZruuhLk94eA5qzd2dZ0XhQWmgBf8J2uyHDlGvS?=
 =?us-ascii?Q?h3EIfNMCqw9sn08lzAY6HZxUso9OBa69ayox8BcKpM7Ir/xVuxTqrfV5Aw3c?=
 =?us-ascii?Q?MuoQHk/433ZI2VM5fQNg75M/uQFrl2wv7L1zgmxF113PKduKD5cIRhE6/CIV?=
 =?us-ascii?Q?rrvwHaUQ9HxaMVShmA7B7iNelWmRlCCTMazKoyGeHIx/qB9bTVshG31e3n+l?=
 =?us-ascii?Q?IEio0ieV3MB82NdqZDHUzFdIMjsH/KJOmdJxk6qhHtmvM05aUXHgeQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p4V6s8lkSGMqJF4FUuGU8TRvvhIeJG7gc2OzO1VXZz0bUyRm2vEevVbmXpP1?=
 =?us-ascii?Q?zGpyzr8rjQ6UrDbUTynkNcFx8OchCDhRVFucEtilHvTszub8q6vRzVKrMZew?=
 =?us-ascii?Q?K/c3a55l2mM1K292nAiVDu3YRH51I0k2Adq30clTcvvqceu4VyWkiwrLKY8V?=
 =?us-ascii?Q?1sXcpvaL59ZAYXMrKlRuQBFepYNmqFXzJPE52HQQALJwyn/pTXoUIapqCGiN?=
 =?us-ascii?Q?epmNUaUNZxDTZifZMfbVR0+vu+N5x0Y6U8fWjtdkO1hYZH5afN6+4YTFm8qR?=
 =?us-ascii?Q?GALD7kXw0J9D8ooBWsfE8sr9Md7DOufVc00wbmWJn91dPNEBPa5pHuZggGI7?=
 =?us-ascii?Q?f2q0EvRNDuAypUlzh3M15GhPsDTF8W5K+wOr99fOlGXhVERroUqQ7AHv4+Oe?=
 =?us-ascii?Q?zVYIvN0vuvc0iVNt9a1LfdCmUp6BIw06sQNc+WeIgpnumuX1BgbTuJCDy02M?=
 =?us-ascii?Q?IOqJqyrIRt+dQLtXdBRm3HdpX9wxA/KhvMlC4QrdMXFORZMmWgDR+Hh/VjiY?=
 =?us-ascii?Q?nNpo3qVdMYO49Orke5H8VIA5DA1bvx6I/xsShDT/UV5JgIZPHdMdWpjLQbJC?=
 =?us-ascii?Q?QUzOkCTwO0Aq+oU/LV9Zb6Xd5VgDe/0CevFJM+s/GhAEuQySKTA8eObuwjCg?=
 =?us-ascii?Q?vww1+7djbJFAmGtExQ2CqC87IxOHTsMCU6+S6UJ755Z/L+sngAt0l/vyJ5dV?=
 =?us-ascii?Q?yX2hqZfTh2OWcZAxR+OB2e5pkr1AVo+i9IsBRXgwXDnpvKS+i5bZHTsbkSa2?=
 =?us-ascii?Q?gBCKbly9FWosXNPj1Vn49qaUkaws3ewNTlWWJlFYWlBxZGLIm/e/Ob3ike8g?=
 =?us-ascii?Q?nMxSzC6c+sfLneqg7c5k+NQ1qkj9IVRHF5MOPjfnHuwYuuaaIp57lTYBSCHh?=
 =?us-ascii?Q?yWLQhw9ujk9PYHduFkvknbkhNYEhlDZsLorp3AYk+/dgkk+Fnynf644pFptf?=
 =?us-ascii?Q?AvXhOMsxpKGlHdMTIrjIx+IljZhoRP78Lqos/6vu2mgPxwiuiFb1O47Q4fsb?=
 =?us-ascii?Q?/gwI/Q+O2FKsenKDHlziJxWpPlgfzd3m2yLjikqsmRdGqAjc645ysuyCFm+s?=
 =?us-ascii?Q?lL6heWl7I9O4GlLKYxTS9qgA0cLivZTRBZDYpfnVOW8LQx2D/DNrOgpm4sZ5?=
 =?us-ascii?Q?fN1C8eR/18LgZy48IZ8RPLnWhuQFtTVdN1K+ggvLKoaMUzcFCWSzYtLXtVOH?=
 =?us-ascii?Q?XHgq9ZuBnQ5zPQNdEc9mYSjIqH+/OBtB3LAGV87vByxrM4szw7ogDThEu3GQ?=
 =?us-ascii?Q?B7zLA+2jVKo+ByrBxEAiknVX356xFAt5CudvPOGBtg5HlQ1nUMZ7jZFgJQQO?=
 =?us-ascii?Q?cW0lEHUM1woEGYOhAKr1M33nrFg/oTh1TWYuVbsmht6ItJwgdAfgDCPvXo8p?=
 =?us-ascii?Q?r8Rx5j9dpHfJcjxUzqacH7tQVJMXLT8lwMcdkLNgSR0I66nfZTYraFqDEm6X?=
 =?us-ascii?Q?SffC41aMyCnfsbYeMgsviZ58hWHBB7vNKCS8JLDd4MEDQSJI/0DI1ZG8rwct?=
 =?us-ascii?Q?h1ZAW15PwYtnmXaSbNaL/JWy6r5rXt908Imlp/NGwOyLaJCB7XqdbCa8acg2?=
 =?us-ascii?Q?byHon2X22lrPrz0MrXanfkdRO3C/hakt3WyidDWa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9090fc80-90e6-4d12-98ad-08ddbd23292b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 06:54:47.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PDDRARsnXjBCl2zAb1tNOdknWPIQTZ278azKCSHx2fwMXIlrBocryoQzTeTxCDAgGQLataL/4m38TPpodpjSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735

On Mon, Jul 07, 2025 at 08:10:57AM +0200, Primoz Fiser wrote:
>Add initial overlays for the PHYTEC phyCORE-i.MX93 SoM based boards,
>that is the phyBOARD-Segin-i.MX93 and phyBOARD-Nash-i.MX93.
>
>Overlay #1:
> - imx93-phycore-rpmsg.dtbo
> - add support for M33 core RPMsg on phyCORE-i.MX93 based boards
> - applicable to both phyBOARD-Nash and phyBOARD-Segin boards
>
>Overlay #2:
> - imx93-phyboard-segin-peb-eval-01.dtbo
> - add support for PHYTEC PEB-EVAL-01 evaluation adapter
> - applicable to phyBOARD-Segin board
>
>Overlay #3:
> - imx93-phyboard-segin-peb-wlbt-05.dtbo
> - add support for PHYTEC PEB-WLBT-05 WLAN/BT adapter
> - applicable to phyBOARD-Segin board
>
>Overlay #4: 
> - imx93-phyboard-nash-peb-wlbt-07.dtbo
> - add support for PHYTEC PEB-WLBT-07 WLAN/BT adapter
> - applicable to phyBOARD-Nash board
>
>
>Changes in v2:
>- reorder reserved memory nodes by address
>
>Link to v1: https://lore.kernel.org/all/20250619063954.1730231-1-primoz.fiser@norik.com/
>
>Primoz Fiser (4):
>  arm64: dts: imx93-phycore-som: Add RPMsg overlay
>  arm64: dts: imx93-phyboard-segin: Add PEB-EVAL-01 overlay
>  arm64: dts: imx93-phyboard-segin: Add PEB-WLBT-05 overlay
>  arm64: dts: imx93-phyboard-nash: Add PEB-WLBT-07 overlay


I think it would be better to update License to
SPDX-License-Identifier: (GPL-2.0+ OR MIT)

But up to you, I am not sure whether dtso(GPL-2.0) could
work with dts(GPL-2.0 or MIT).


For the patchset
Reviewed-by: Peng Fan <peng.fan@nxp.com>

Regards,
Peng
