Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010065.outbound.protection.outlook.com [52.101.69.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5F21E412A;
	Mon,  9 Jun 2025 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459039; cv=fail; b=VZNXWqwYDEnQoU9aQk4TUFEvUhTR2eEiU3NbswKz99eu+BR6gtd/OGoUFpAa4e3pfWXsms0w5724iLV5gruEWM6dXUZ41dEHyFMDOmVrEDjETu5HmW7Fs6r8aq+iyoyMMhcEDldaQ2tgw4Uy53Oc7o8KHoRuh71M/oNQf5IvgEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459039; c=relaxed/simple;
	bh=V/wCmWLdVTzvEj35n6jSPrfofBKFb8Q1S7pjLjTwmDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G40DZRVnRDViwvx326scehAZHN4n+0DnXLLYJI0O7KrbzWFVrg8kr6gZdy5f8pL6YBV4WoOym3wR2SYjf6G8vEdVzcILT9DOxoww0b9m11f5TAM93XriZyXK/ebkvZokm9NYNS/BrIZnEuz78sAqxLKwpqhztjYsdSyPekefLCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DlkUEzXq; arc=fail smtp.client-ip=52.101.69.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DlkUEzXq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiUgBgjBfniPNgC3lEHkAecC7EKbsxsnMi+enmZZ9y6kz1y1RsCl1FpZReVu3keQHtevgRFEa8JrV6ZFwCqPb5/uOQNm+SCkifpGzBj5OmYzCSVTirG7/4u1XbVLRfSfBK1r2jiF0WWZGPDR49E6aMgfVA88dACynjBobKMySAXpHW6nEYASKTJBlJpqgYab0b5TKADHtFoSK5crJ8ICD5/AGblkvg+GhNtwCcevkXS6c8IMZQNRO0r3RzWqvlAIiECLNkM2OY5HUudXI0EGLYtrKojP7pkSKJkpxTvgFS49lQkowBYUbAKr6mqLBpq0WgvFt6Qg2N6ciEw49QH/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/wCmWLdVTzvEj35n6jSPrfofBKFb8Q1S7pjLjTwmDc=;
 b=FiGswLw0q+pPxsr3FssVzqcHvVDfWkdQ2ky7sf0EYQyY2+8pojWLfUwiloZKqhHIr+pEVf0BIM0OOImJfZZP4bsTP0GXKZo/zEz0wGKIbI+Hq82pfBURkSps9Q3kEvFsb2vXz5ulLEOLdaEZ+ACTLs2JhMP+WG6qAwbq2bcULPbaNMyR1o+0WjelfgGEJZAutIHvSvk2LMnGdCP4abJnjsRNduYsRbbc9Q+wxe+G0naFTF7/6agIVOF57KbIvL3gRF4HzLSjCDKbhVqN1I2DRFBVnQqPEeutC3LDOPHTUkqIpB4x+2D5iagS/Uz6bazm1mqvnJ+Kb3vTAWizlCOXjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/wCmWLdVTzvEj35n6jSPrfofBKFb8Q1S7pjLjTwmDc=;
 b=DlkUEzXqcMseJAtcAxWVZBK40VjuTnTP4dOBaLRNBnfeNbFTDoTEXweew6jn8Tiy2oWwopCWlQFyifdJHS3Wu+8Hhci7UPmFQdZ10hsx797Vm4cMgwBcJqmXe69l4+XS+DiKXts/4LCPW3ZxRkxBVLMAxNXT2qvIRXQ7cKTq+NFCossHHEU0a+nZgiKpy0VHqqtnixsidjm8JVZMjWaB6zl1T0NKvl3xPwkDGY1PW+nZW+Sj4cQGrGWKJUAXSGZ/DaFI2533vq778RSrJwkHmUDnm6eTueFoxbV2WOcd9lFG92QRdqEgP4s4HVPOajFPrVSVW9i+BjQrXRI8XQEdtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9155.eurprd04.prod.outlook.com (2603:10a6:102:22e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 9 Jun
 2025 08:50:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:50:31 +0000
Date: Mon, 9 Jun 2025 18:00:37 +0800
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
Subject: Re: [PATCH v2 1/4] arm64: dts: imx95-19x19-evk: add adc0
 flexcan[1,2] i2c[2,3] uart5 spi3 and tpm3
Message-ID: <20250609100037.GF13113@nxa18884-linux>
References: <20250606190045.1438740-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606190045.1438740-1-Frank.Li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR06CA0220.apcprd06.prod.outlook.com
 (2603:1096:4:68::28) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 582c59a1-bc42-4bbe-7e3d-08dda732b0c5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BzlY0Xfb93SdDiTpRLAO2rGGAG+iw7Tk7F6q6ZBVu4YFq3mzKh2DUMVlZtYc?=
 =?us-ascii?Q?XPLNzNA8S/j3mU7Ic6hIZEhbuT40MrUOYQX++5/fuxlUe9hxCKyrvZF98qVE?=
 =?us-ascii?Q?XHOBUH1qIjhDUUe34GxY29txYTjqjzvadDeT62YDdZz6EFIVkkG4PZ0arXWE?=
 =?us-ascii?Q?ayCFJWbTiNRfTKrdwVV+JF2aVYe8kbM9NJ1VgT+btRHjRB+CY5Q00wIDd31L?=
 =?us-ascii?Q?ljoBbTSfTYs5wb2lK4K7rInmsVhLz8ZfiN2Vc/XM5u32vpDp31ihUZK534vG?=
 =?us-ascii?Q?T/rNzFwo7Z07dNVSI7j1PPt0ulby9btjxKM319hELe6JhUt514AG9RDXkkqE?=
 =?us-ascii?Q?+jCDbFH/3BGVNqCmfnapO3J+VPmmyd9TlhQKPZzKpZoCpFjuxXiFoqRNaCM9?=
 =?us-ascii?Q?/xG8I89+iIR5UvAHKodiw88DdNxXkjTFEJhtt3PReH26wZ9AX8n6bv1EcDbn?=
 =?us-ascii?Q?ItmQTFeSZxAhPDV7KkJo9vZ4hIixHtU3G9p4iHHpPOO7YSSRAlOEroKD32OO?=
 =?us-ascii?Q?pf7MhSF1KJudrYuahnTRj2tVd2Icb6fV5l3CWAOsnoNG2fD8DF43CliKzD4v?=
 =?us-ascii?Q?v381cvdb6fLV1NWkeS9xxNMcLg2zTl3Q0/44OzhEF2FCWohQ8CdcHhAIrqwB?=
 =?us-ascii?Q?yH2COomYFf9oJ1WeN7JUV9KA1QauUaiRHtKYOneTl3k3nvc36YkxlKrOtmLC?=
 =?us-ascii?Q?2IPSE4JGgxtL9wbBj0GO2Ce/cxevBBayWQ29PCBHa02VBV8eSlSYaykVVhEk?=
 =?us-ascii?Q?Ha55p8b3vdpGJgJcZCdFwV1PLAGCKSn1TFFiktFUeTjrJ5xXo4vMMjN6tolJ?=
 =?us-ascii?Q?jVP+5pVW6+BELUQf6s/6MsVK9k4VpNgqaNnpsMc9b66x0kAm12OsjZRqCkcV?=
 =?us-ascii?Q?/4iR7PGev9VRo9Z4ihjcYPv+NcIXtjUXqo2DY6Ip1Yjcj1GjfZSqpxJCqci6?=
 =?us-ascii?Q?Dc4HC0fLeXQzUOh73qLdaL9WAZx5esUyxpWvPXH+7xYVdcaRPWH3Iekik3YS?=
 =?us-ascii?Q?zwH8eJCpWYOPUBACdYKbnJfqi4ZvVBRe7oNfg3i0yKwCI7jLkkOjioM5x0oA?=
 =?us-ascii?Q?/ev6ms4mKAfeLwjKJeCICj3Dp75dOuUEFAxrhVAguAYJ41E3am1mZ/jx0+wc?=
 =?us-ascii?Q?vhQMirDfvXIxWqBsW269CuKdHqOtuWZ5axjR2a/ZVYXB+Di2gVxnCCrPKw8o?=
 =?us-ascii?Q?/oUmwItAUFO3Cxnj4TEB2KGev+p9tVqaRIqX6tyTUv44q45k4tLrzhl5UG1e?=
 =?us-ascii?Q?1E0AcvjHGYIrK2MF6sNwxqoX/zuPQ4u1eKovzKC18ulbbjjZCk6KDgeEtub/?=
 =?us-ascii?Q?90X/Ba93paaImJYx4Fjo1N5XgWyYIOUH0PM58pASdHuH9RoBb4PbS9pzS8ty?=
 =?us-ascii?Q?rBCwflU6lnvzG8LOEZXeA90rNHbQkTU+PSusrrUFVJ8dAocD0VrivlAK9P6s?=
 =?us-ascii?Q?QtXt5K2QFIL7CNsgGPbnHRjt5VUEbXro4fkhwMecCUmrLJkyXdP9/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7MqtFCCFdSkEsW5lQTNcvsGFRzvdVMQbFJt2donukKkfDIAmdcT6X2mWokir?=
 =?us-ascii?Q?pfAlxRABwdjt5/mRdEHM6VTpvylBUtM5S6F/TpKE9mqfN3TesU9jrET76VK/?=
 =?us-ascii?Q?I0UVBw1IBzBTah/DeDIyTn/VWpYQIWqZyGq3vzWHTsjgVyaSAQVT9co5nyzc?=
 =?us-ascii?Q?YFDbWhAii4NXVuGAgZLN8CrT74B5Esz8SzNeAovyiGS7Tnh9frD05UlJ3BUk?=
 =?us-ascii?Q?8Nphb5wTschHEpka66CiS152CgXgzFI2r1Ij/jc6okBk/4uVklhg4yRYsC3J?=
 =?us-ascii?Q?BH1n1o1Q+AZKvlGEAgPcUbkFu/6TgV4IjBOuEs4u11Z1BQl4cEH7SFbm+jsi?=
 =?us-ascii?Q?NcdPlHj2kWQVICdRKSs2T6a85Ah89M/CPMztYLSulg0aFfgP8KN2rT+aFTD9?=
 =?us-ascii?Q?Vr40LTncCaylkBLbvtHaI3LESeZsqMgWQJN7VlH3X9EA/P+g1VVrfZOXAQlE?=
 =?us-ascii?Q?hSIxP3OA4tjXTDWuBEZr//hPnK0cDH0PMg3OBgMHN15Bva9b1YTylNNDV5aX?=
 =?us-ascii?Q?yUKZCTK/Hj49zo4ahcjSNqf4D7Oa7rCoHd5YokHKmqT/g3bYdTToSr2ofFlc?=
 =?us-ascii?Q?0tdLE/jy61H2+IfVLVH6hRhquuYbvBoYYB7mFcAXIIffPYvIayJ8hk2dpYj4?=
 =?us-ascii?Q?V375OKvJRqdsUHKsd+O8R697+YIjH6+RSnHkDmNoZsTxxt0zAbPnhd/Ptr0S?=
 =?us-ascii?Q?grGTKOdMCwh3d06MWwycPq7mDA1GW+7vqsXkL0eqnj1KxQGm/Iovmd2iIjwa?=
 =?us-ascii?Q?RryjVNLUvVP6onr8XTXfVP8iLQF5fNUvgjf7k3B37o8UpON5ZMg9UO11WmYj?=
 =?us-ascii?Q?0o+RIukIloKyNtQBNjWEEqV4/OQFj9VXooI7zz3A9bl3MD/qY3baQy1p2j4k?=
 =?us-ascii?Q?YL+HzNmSC41kyXyMtze5gQJGH4uMK0rSz1YqKKFAxcPJ2/aFH2FP1Q2UyEfl?=
 =?us-ascii?Q?b9UQKyGg5aQwRySYLqN91wGBy/mszvuZ/2RXUJbFsXkTn1k8+hbN/GU2OM4s?=
 =?us-ascii?Q?IlFKjrLtFbmIeC1jLCmmHLriXPbBikTFLPQa/VdHyjevJ5fWDpQ+gOLUoVQP?=
 =?us-ascii?Q?3T5HKSMpBANGrdkHF4x083Wq03+PvK1OqkowYElOeze1KMkNkyGmd0hgIUMV?=
 =?us-ascii?Q?MUEhUvS9Q+138/wFwkmF5p/6H+YbhTil7WxMXI+gga/D/PIyFxhII9DJKsGS?=
 =?us-ascii?Q?8EkXkK+h5TCaiioiDrKqzu+Ff0z7vIv0XyX+TdyZrFTke1ZPupSwh2UvSlSf?=
 =?us-ascii?Q?BRhBt6nBHSo0GHHEiqNqOmZbeLya6SKMIQu4KNsgoGIZF3OWMG8A4ZHs5Epm?=
 =?us-ascii?Q?e6UrpuzV9fGsZy3IV7jygj/ZETlNKgWSRCdA0lX8eo49E2mxYQeWh5qCuZl0?=
 =?us-ascii?Q?DY6EqBVIGCibJycX9kVnxKA8pKqqAaQv/R81MUl3kAto6McgnLpgg4SpatZs?=
 =?us-ascii?Q?Xq7RNR6AuWQAtEgCls+3yAIaCd2gDSK/tNVZ8HnCqNPD1K82jiVKM4NFcbeH?=
 =?us-ascii?Q?pk0YlHJEMxlaNm4ywxoCz9EHb/EzJoidM/9hecUH6TWOos0L32LkmkVFUouI?=
 =?us-ascii?Q?cj5CX3GpSm1Jr4AMdpUCrSAoWh7IKtxZTQLMXhap?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582c59a1-bc42-4bbe-7e3d-08dda732b0c5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:50:31.3851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NK3dbvLBcpULYXh6uP1PEM+JMoV/g7XbUb+zB0XyeZCzZWxdQMo0eUn45lELJSJ4BOJVFcQ6xBAKocgORp3h+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9155

On Fri, Jun 06, 2025 at 03:00:41PM -0400, Frank Li wrote:
>Add adc0 flexcan[1,2] i2c[2,3] uart5 spi3 tpm3 netc_timer and related phys
>regulators pinmux and related child nodes.
>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
