Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6432E541B;
	Fri,  4 Jul 2025 09:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620394; cv=fail; b=i2h/tZh36satMLHoVzKGmXx6ruQxPj5Y9z4xWEP3Z7Op2jIUBwWMCp3bfvky12uAmeZ3MMqA413id3sBRgTi8N0p7ke/Z8/KHb4sXwcS3dfceOEdi8lYPN3Bp4qtYAM2Qac4Yq9kwqEhxse+tOXa7Gz9HTpoWqGExHi4vPY83zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620394; c=relaxed/simple;
	bh=5fQ8xPVnD3UMmBzye0NaEoEfdkWPOwOuewxFE4x3ons=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nt2u9ac2jcPmb67H1pTT/cODXe9Th3bNKI5xpwwSI2j+4J0g7Sn6volOswFY2uUzdAJNFGbqbtfxaHIVERfmQnffLXdMTMvpql+t1uovqMDfPmU8Ez1XSzhvEM4fi0PEngUxOu2aI5toOr73L4UlSbKruTgVPSqZnsSw3SPgBcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AWWhkeRS; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AWWhkeRS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJyKWYcROSI1EjyvDvOK7XckQCXa9nxBQRQyzw/DsH762S+k2qUwDKMJgor6iRl2ZXgph/HEkipnuSBR6dRNz16fyOIvlI460P+BMEQW8A/jXczloCGIZW503Ws2F8v5gjfOCJMrlR8XzHV/L4HM1cj4bTr7rPmsPwIFntuIWZSwkuZay2c2HbXW8K/SyrGq6u0DcOC8keaatwy/ipEgbrw7UipRNpN3+L6Qt4M7e9NkGqazeLcirQiVXAU5aHR8RGkKzq9lVYIep72tB/yIXVjJ0SAeMXx9xpAg0UPeY1TO1rv7FWaDDbZDmt4MmXHpopVZd+f8prYkolHcdwqYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlycHNBjV5o79i3jvpwvefSwwnMhp4SLJqtO8XV8AjM=;
 b=oymuOFob1sVtvQcHrPkZX3FAdX1dNCb47KpHjzadkWaMhMbIMFvXqkf3Ke+m7ZVoXMe5w4tQ+0xOY5ACDHBdUx9vFREckD/WIzR5caxtkFny7JWRIDKr8//y892dJltTVcGWm8StqnJTHR2WTSuo3WY/4MdVxxMF03yCupizCqlgGFc94PsHPyfcjtFw89flxBkZAg3age4rkvzELGD6NMi3rsrFWnNt+I9KVjxv10NoFPUE4OgMNi/O2eVpOWKngDWUQIHUOf/iXP3n51hXSClsGgpg+KnALma7f7Rzhoo5QEELiugLhpLzvOX7WOSf2kxVeivBbW17WrT6aVv4cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlycHNBjV5o79i3jvpwvefSwwnMhp4SLJqtO8XV8AjM=;
 b=AWWhkeRSe2j6EUFBut7eddE8OV5bsM163hGdFuDoqpghIT/rf6S5ZQouhHkQ1fnLvb5nLst6GPMa0WthchBMCJrUXAJLm2SInaCR5KEHMwRq63WoueAHMGOV6XAmBVxVN7/k3F9lEHlIWBkV5aE2Xsasa0rBqC68ivrWnP/jZyOmkhtGmHpe5XVi6VuG91i0TiwOepnpgm4CXMuwqJaqKbqnFRqfW3BCnEhkNq2i8y1E6jy4Guwo2f8M5bzWwRBFi9V9JYCd2iZfZS2nYv44Gk3EyMS01zglH7B7BzCOPQ62nwk9Fj//EnmbFa66i/Vut+E+nmCHIUJMRkKLQk2MAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DBBPR04MB7658.eurprd04.prod.outlook.com (2603:10a6:10:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:13:09 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:13:09 +0000
Date: Fri, 4 Jul 2025 18:23:53 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] firmware: arm_scmi: imx: Support getting syslog of
 MISC protocol
Message-ID: <20250704102353.GE4525@nxa18884-linux>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-5-2b99481fe825@nxp.com>
 <20250702-classic-sloth-of-snow-34ed1b@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-classic-sloth-of-snow-34ed1b@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::11) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DBBPR04MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f96d16-bb9a-497c-d852-08ddbadafea0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rovvWMmjNEknDGcAU+P2HAJgSRLayvHM8sa9AkxhDEmxYPB1/OvInADruxTR?=
 =?us-ascii?Q?Ced+O7Ky+ijxrk1xnbLkZFPGnl0pTQYFywEP+Ujd5jQM7nyVeaZim1OaTuCt?=
 =?us-ascii?Q?jHAke9J76l8TERCetw3HvL/EqIBlI/7Ok6gJz63Ey2geb38n0iADFAIgsWoi?=
 =?us-ascii?Q?wOY9f3v3+JlN9VoixXyAdzvXlFxBinl6FIzmYkBP04PsAckKr4IB9g+BGXow?=
 =?us-ascii?Q?vBVaeRcPbMmNGw3HLI1btJulkcL+dXnuo4M2OYRF8u4L9QhyXoXh+H7Ahl8U?=
 =?us-ascii?Q?JhEPxn+PCCvHmp9vNCI7Pb6CPv9FeubUMs81P44xkgbCO8zBzU1HY2Ac8pwF?=
 =?us-ascii?Q?8mulJpIeXNNDBNTv8GUkPYv+XKyJFyxWFqS5gWiFefzBxx98/FXpC+CQ9B2a?=
 =?us-ascii?Q?yKRIMFsJS+gJkRsxzNe/slwcwTMxKKW5btzbAdZj4YPXkNQm60mQTPAaa8+b?=
 =?us-ascii?Q?k/RLDXU+ViutjbK+ZzEMDA9pzl0PWRfMEX1DcdbS60RU6fmeWTddNKJsE8gV?=
 =?us-ascii?Q?/Rf/eAYOxxgwiew5fiX4J6Qvq9TsliqF8J1DxTXBU14WZ6UbkEl5gSXM8t2E?=
 =?us-ascii?Q?0EEmGdc8HA3OTBt1n0TrPSgZjFQdJrDUtseQD/mGsOeAyyUSebT4Md8q9BST?=
 =?us-ascii?Q?Fc7+jRnTKuUusvndXM1w9HstbWPYfpKOnKfT0XikY8PrkPnjKtIzFq2fFsIv?=
 =?us-ascii?Q?dt6lk/3CyWoseLmltGsFwfI/tUuyk8a/le5o5Dfyqlo0Hbya+EoQJzCjs1Rz?=
 =?us-ascii?Q?j6ML7J4LT/x1gQDH2tZc2MA/YgXa/kTRoCN1Aj2dQVXfsWS9vQ3M69dxrULH?=
 =?us-ascii?Q?HSnM5Nv6TjZa7KV8dYcMMeFRZXDvcuiO9wiPrdoPR/fFqPF+d9BUZBO3EZlM?=
 =?us-ascii?Q?TQbMxuWqIgwuF5HzeZIUUeDDbRboqVE+coA0D5z4ok2cXhq7S1R+UPWH+6L4?=
 =?us-ascii?Q?wXnoCRXaDz/HtKWfFkc7zr2f0QN83onV8yUzrFhcXQfcxV182JzJPR4XuK9M?=
 =?us-ascii?Q?snXKfZ/MCY6616nhQYJEqH6QGuYzA4I8Q2VOhmutQfORRkLQP9Sg19DnQUUu?=
 =?us-ascii?Q?6/tQfzb8Jm+rcYPlQJlnjkpnATvDSxZ0BVAVtT9P2hTitNRgmsJymWF3M2ub?=
 =?us-ascii?Q?NfEBDs3i8dZW4YlnfXR1FymIeYjbgFF3DQNlVQygwtbH4mecsQexnL/aioLI?=
 =?us-ascii?Q?iqcLEFQAz8rHWMtQdE1KYsXZQdti1SNCHtFvNRikTx/kSiSc1+KJ45b4biEl?=
 =?us-ascii?Q?qDitWOwW+wVY6qAWjogItx0OplgzqHooIBIMVVFmL3Z8S/PfzSm6meSzZaYK?=
 =?us-ascii?Q?svBUWMem5YH1VPP8UH0+BhvW0g4vKHE2B3dCHjWzsGPUN9IUcU6M8KfR8Rwk?=
 =?us-ascii?Q?Q71VQIjBCB3AQ9CHj/tVrpkfjdCO4ECqm1feMknFXF7PUyzyQkCxVXvA8wUt?=
 =?us-ascii?Q?t/2AMYzY72P9U5judVJtdQjRTxy3HkVhGVh3LNHcovi38DkuImfR9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+oSZmwxquL+chRGw9X2nDVIPpR4h+LlfzfDZif6T/0bV0CyOrRBbXgro7eU5?=
 =?us-ascii?Q?XTiSB/XQNA0dVSaWo77E4CrDQr3sNXYm1xHVSRyPqr16gXaFnOVLYyYxpGI2?=
 =?us-ascii?Q?2K1tIycZEMs+DgYEojndqw4z0oIHY6IJH+3iz+8CjxH6/gH9dmcvqVZyvTdM?=
 =?us-ascii?Q?W25FBOM21VJ3zNOemwvJyXt2eQ64hmJ/l9pR6LSFIU8fCGmHNgFGT/S/Rsx4?=
 =?us-ascii?Q?OWj67gNvtxFf3gRIPyeK+1w0qR6AWwbBY+tH8Cfp6rnT/egLho6I3cUb9jab?=
 =?us-ascii?Q?w/ivKtt4PBzMLjbnz6c4zrFHhlZoHXLMpXULbGHteb5iCc9xwznwUBQq95de?=
 =?us-ascii?Q?rKNPT0NUNVc2MssIQiT238YQiOOwYHWzbEL8nP3fS6hQRyz2GZgk+y2cLiN+?=
 =?us-ascii?Q?Y3zTbEj3MRkrwkaOcX4ajwdhJNnBJuyT1R1kFwT5IzThdRBp2zpm1Yby4lZS?=
 =?us-ascii?Q?xZDmneijzR1oku33ctqxonGC4p4gRG1LMr+qT38/lOSsB5+f7F8BjpD8nvRx?=
 =?us-ascii?Q?MR18DxMgkOhgVbvqDnygYf/+SZl9qYGi5PI3bb0r6Bc7F7sS1vamxrzeB3ur?=
 =?us-ascii?Q?kWQEhOgmIpxUT5C1NSkiqaH6A01QvlRFSlxkhwHRsCqkpAuO8FxBv/yBITdn?=
 =?us-ascii?Q?EdoQMaRSqbivug+11Ij+cu6bv1cISIgriT63NvUBIjeiOSHyVkyodXCcSsKV?=
 =?us-ascii?Q?QSLCYeBc9YUghor+Ys0ZQwrKymtTtcXHjtFsa55gtySQVfxSm/9Cn/hsVWtb?=
 =?us-ascii?Q?6oMC+T8EGN2B8j9qQgPOHSHHUYThhpSzo7WNGSKFlnhmnnm5/QJ2iDICN7sY?=
 =?us-ascii?Q?b4wzfm7tppkfGzUmQpYfvVSOitnqCNX9314baJmGEBRtmGAaOVs5gzoORh3f?=
 =?us-ascii?Q?oPJxV0SiMjaLpCk0aOG0IJ7prNSS9c+m1wVTJBKgcXVrKn+kF9rPF6KN/uoF?=
 =?us-ascii?Q?gHDks3JHSCqLaCp3cKVsZ7YHgYNZu4BakoQnNmQPpLaUubs+6bfz4bvcOkpM?=
 =?us-ascii?Q?he2k2DiNV1XUalJZX5m3jpX42F7m48UJHkysusL9HMG3LW0Cq2XPjJ823lSJ?=
 =?us-ascii?Q?7PLvCixV2z8r08M+FqSxlnsQcANhYOS0I+WvsOgdIheaEwVjJLk6MXjm+vby?=
 =?us-ascii?Q?yUbQmm7zPZv9/0YFquqZL7NRMk14KezBnZf2sh3Cjc2JnomwSj1d1df3HsIm?=
 =?us-ascii?Q?DJp4K6l+Z5i7BSz5eFcCBvGqcXXROqPQDKKAyqWE6jHvKDwOv/8+CPq47GPi?=
 =?us-ascii?Q?o1tsQ3RpZOzOeVaZfsQ2DsfqVqEwZENus7hSjq/DWqWFwg5YkuJsmd5SVAeV?=
 =?us-ascii?Q?jxkyY5Bb/N9Gqg/lkWfPL5uUtdRTzkTUS/aNUbjoWXMQfOmwCWjBjg8ZuNZA?=
 =?us-ascii?Q?rEuWB588bGLPLLOK+9gAA3hj8mjcyUfr3eNPdPkpt2zW43O/38ixHOkp+RgO?=
 =?us-ascii?Q?yFPLzY5EZVGfxMiED0FLsegHfyuw+QTa7mzZdQIZPPK4GlpuauWGl7BqRX8Y?=
 =?us-ascii?Q?qbrgvd6ux/8GHaRs5kpxPSO/28DxM2br6drIfbUE2zzY989zU2ctAjgpybGu?=
 =?us-ascii?Q?1gg+mAyLlyAl6Wq33K+UKuo3TcWT4z1ORwDZlKBs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f96d16-bb9a-497c-d852-08ddbadafea0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:13:09.5764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwgjqE9sDXaiyKSJuGh+iXEQOUqb9bFR+beMiAXMuY7olXcz/kf1CuI2B1KeYdhX8O/8zfb9cQAQy47SPHtN6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7658

On Wed, Jul 02, 2025 at 04:22:30PM +0100, Sudeep Holla wrote:
>On Fri, Jun 27, 2025 at 02:03:48PM +0800, Peng Fan wrote:
>> MISC protocol supports getting system log regarding system sleep latency
>> ,wakeup interrupt and etc.
>
>We now have SCMI telemetry protocol to provide such information in a
>standard protocol. You must consider using that or switching to that
>in near future. I am OK with this but would like to warn use of custom
>interface for things like this is not scalable for long term.

I have shared latest 4.0 alpha release information to our firmware
owner. In future, we may use telemetry, but not up to me.

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep
