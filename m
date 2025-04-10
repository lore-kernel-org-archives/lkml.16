Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ECE143748;
	Thu, 10 Apr 2025 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297299; cv=fail; b=B9uO61jvOZQp1KdZxYu8FQHuqgUlk+8ILJq+of0jfK2mouXqFaAP5rtxAXIUZ3pK26h/Y73pwB7RWSYphXmOw5wGzF09o/+cnUTlW7bEPWUZlTsJfCC7dgiQnk3gTrKjPrYq/5difzc/OCFNRdEXRs+EzS+pwRZGEUW5HCuRm7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297299; c=relaxed/simple;
	bh=ZoLMejnqY752ZD5sHpV2QnzmyH05xjzxZMhcpNX4x/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HdfaYVu5+YosvBcbbIJqm3zRKnaaIo4LEkstmIoDbkjevSE6oxly5bxSQRtI7fLgZ4HYWPDJrT/1zZYWNxvnl1DSkVOisWiMDzTpLdpV3vUSptNGtq+DKS4ICTqwe9WnKSpNAqCpH8wuLHI8cHgny6WpDjSal4olpuCxWO46pqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d79/0ow6; arc=fail smtp.client-ip=40.107.22.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d79/0ow6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsWhzJcZL8718slaenlT65tCzizjPTpdp5Wuuki4YPgctf4gcyjrnQID6dq/70/bLuWGteWun6wsmN7J7j2LXnj7ashnHBOxIGxC6t1eY4rXG38aJXJ+krPqBcEshpz/vRM+jmzcePNrHezLTX47SjYHK22EJNlVcfDhgcpMPucuUL5c7idLOhPoCzzjtUe7JpEtBavGwrmYD8AEdHzVeSizJfnZfcTtcWtxnHYEUx70aPW4vpYjNmB3SC+45Nh8LrgyE4/GQWuuT286Mp3MAmXYApANywZ+yalIHl7Yp/Pnbaoy/m3s5OXiyayLg3zE/ZUTbbM7X6lctD9DPB08eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogQcgNRZc9CR7oyp5ovUyNGnq1699UJQZ5BJNfWH96M=;
 b=urVyXJrp/MX+fw+PBZVIuImR+P3wHn55xxnhAIoTAi5OREWqyAbGuFU7smIaNlFkX2btx4aaY3mNLf5J6eFHmMdDv/FkL0mqwnmqYT2Ga0LkyOnF2VdYyr2IVAAYEDGW++b+tX3vhike7MN9Zxn95wQxW7GH2wuyzyHNo6q7CMaQMAQpJ0iRCx6eRbBA+IkOo/c9cmXFLfJhYOSbr/YYp01Q0CXowEUV7V+CeUgvOYGTsLK8BK3YCKJ9CDsOi0Vx/Gw3gdG0jzbVuhS4JF0KyHyaJptKRIiCv1yZwKP62tX2gjnQEWAoHXbYCJdmT+c3hD99RdW1Hns2XPzsQ+8EBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogQcgNRZc9CR7oyp5ovUyNGnq1699UJQZ5BJNfWH96M=;
 b=d79/0ow6CbwYKauWvzw20vwdgKVV8nC4fOUH9nIuJUZhZtbz3zblUEj21DCQm+lOSeVJq2bmuhy/V4Kxr8M7XDG8F+ZKSFT9f+Xasprz4Bb1QIMFw9l6eFXOfeQK/fPLKGwzKcbpnFE3VIDsx6m6Dm80jCf17+wzvNDWY8DAsEeDFfHVXroV3ivRyzIBQDKW+AoG6zVOj9Fg23gW8XkghXhNOtEXyw/dPJ+wV7YrP2QB/z6DVAZRz9A7fiv/wSxYr6obXle7BL8GbT/mwNFlRIYalfVWK7UwZx507x5iE21x+woL/FCzAUmycJED4uc5jUqJCxtko2YE7f15Mbyh/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9408.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 15:01:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 15:01:34 +0000
Date: Thu, 10 Apr 2025 11:01:27 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 05/13] arm64: dts: freescale: imx93-phycore-som: Add eMMC
 no-1-8-v by default
Message-ID: <Z/fdR2C0IRUfUv4U@lizhi-Precision-Tower-5810>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-6-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090251.1103979-6-primoz.fiser@norik.com>
X-ClientProxiedBy: PH8PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: c123f1d3-6de5-4dbb-7caa-08dd784095fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JdmjQPujZuziU8aYu3SN7f10u5tch8ZRm++3WXl+WlIWIysr9lq0pzTCT8AP?=
 =?us-ascii?Q?CRAOhUqF6+PFG5MPY1LN6DSy3shmYZ7LnnF5GfnGIQwXQj8bVVqWHGTSlZzB?=
 =?us-ascii?Q?0IwrnCGoh2iZSX5Ar/tE8Nfy3gz0VQf1GhgT5/t6x8bTI18X/tGTP5Mj8iQh?=
 =?us-ascii?Q?mk15olOtRciGnjNNgFOh9tBf4fJzMaxgwC6Atxgw/FBqZLC0Kbj061E3ABEG?=
 =?us-ascii?Q?98uW5YYwXCSp/L3i5Ji9epmHeq0Ujs9YOdwKLcrNfzKzJ4AcD9VpllrZxi/5?=
 =?us-ascii?Q?X8W8M8YAkWcp34JQCZdkqY1aFyiWYtaRpuAzvUfRPw6wL1UISeAyKQM6iYnz?=
 =?us-ascii?Q?amwrFuvuYX7F8Uu156XeIwWoC1UvMA9y7TIOMoo7+8m4xBxcvi1396lKxDRf?=
 =?us-ascii?Q?J166i3sjYGONSzuS7mxX40uRmRgTgJrrjtRr5lqalJ05xr+mnZtMNEANgdqP?=
 =?us-ascii?Q?KTCBC2GRSmK+0U4O8VuwOOiBk6IF+Xc01yiNFp7A7o/VA24vrb8qE8qD+0WL?=
 =?us-ascii?Q?0r8FN6mVBAKYtMXsg0fUaTD1suWeFE7fZOt5JBHAgmCSXa3c2mzUzUY7q6wv?=
 =?us-ascii?Q?KatnVl5oP5/WtTCdtirK/60Y2hzgxteq8E4S57rZ8AXJkkNyD18JLsRf4oqI?=
 =?us-ascii?Q?/kCdOtX6V69IQ8pswLgMvxJJyOQfdrvZDduzIrSi9rnyflZbzvRVC4gFMiyq?=
 =?us-ascii?Q?vz5Gc8vDnBUkkQKODtQ9l1D6JbqP41pQ7b+ENG1O4eNruXtUtG45J+P+C7Lr?=
 =?us-ascii?Q?1c/d33mL1ETvG9hxPdGp4SWCiJ88zO8YmQ3AxZV80cKuWn9XOh9k5VP0pTbb?=
 =?us-ascii?Q?KgkRQw3DiGRi1hE+uGsv3QAqXEL3EyUaavZPgVvNZVTwpYw9iT0DAP8iPBWV?=
 =?us-ascii?Q?HCpA3YQc2wijuINuhsdFAIBbeKW9OasDvR0HPMwc0XNin52xQT4WbgvErGjL?=
 =?us-ascii?Q?NZVSXhJXnBuVmcSfqYhYmwftqIzkVIMIaDId9nU7ZFjX5pMGxY/EGhkNQlrJ?=
 =?us-ascii?Q?lXhKF1pJsnMR3Q0hZi4HE+1hZ4a6dD3F46VQlQ5B+JP3MFqjzGFu1Wpz2eI5?=
 =?us-ascii?Q?Y5+P5Dx0OQbDWQ+HMXA405o88sHNjgfNsuuP9rjYU0L3BeesYeamvr3vt/+r?=
 =?us-ascii?Q?tftIGpmbcnEInr/U3rPQYnAQnBdkTMQPIiM691qyOXHsuuPYv0+9hgCHY5tv?=
 =?us-ascii?Q?1NqOSjWPc8DulcISQgN/Cb5w0eUpZ2J6EVLofDO16i7vWO2CgwwkzjWHhogE?=
 =?us-ascii?Q?ZtI48E9AfAZO2k/s+Qcxn6+0q9dJzmQpRXphTNOMev7xjzImV1dp52VQTbD5?=
 =?us-ascii?Q?yCsrSJv7OpzcizJBW0YGFZvU5w7kWck8q/UgwWFD9nCApt3hRgMmQ3iobJot?=
 =?us-ascii?Q?zfu6wp7/yr29MtM0Z6//CCf58zZb26fWHxjvOJnLD4WGn71rweNzjPALE7mX?=
 =?us-ascii?Q?j4mlTdfzwpTF/YkZCygjZqtos9U5IGQG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LVXbmmlyjgUdvQ9eKUM5Epl7thaw3FXGitVGYNrlLdbItlmIYqZoo5MWhds7?=
 =?us-ascii?Q?t26PZMTSFTD/vQzkFJDqL/sbbBpXvlv7XFEl4qLHfgJdmilnnv/8n7v+hpee?=
 =?us-ascii?Q?2kIu2if51hN8ihZ+jjt1g7bGS131CaXQVNZS3Gn8YywFPgVs/e97SWfSWRcx?=
 =?us-ascii?Q?ewLBE7FpWG0R67WZ/87AAJZgldd2V5kziExHoX+vgytxpyj+EKZ+qHono8Np?=
 =?us-ascii?Q?RFxuEzZXGZTRzhCn9lrTvGHKtt46iUytB672SHgf51Q4vARE3f8L0wlvpIvr?=
 =?us-ascii?Q?ktpdrou/oQu8t+HoCdLkeOFMlBkJgXh9vOmJpVeM/L2yfD7zY+YkNVIktTf6?=
 =?us-ascii?Q?6wykE0g43f57eAidOyXWpg/QPbb4n88g1/Adl0QyRggAC6G4i95fxeR66owz?=
 =?us-ascii?Q?zA434oFO0GZJ4ZiDB1h7vfoWUjMAQ8Ihw28cTqovm8fTJVVDIHJBqqShSfej?=
 =?us-ascii?Q?MYsFTqUWcRjVKp5eKH5zR2kO4I8btC/h7uMN7NcdJUT4iqS+RsQ9dgFr3UgE?=
 =?us-ascii?Q?P+aBoEHfFO9f6YdhwRyytJ3MijcMT5zYDxqQz4xaTqpRphNWnuenxbFPgJOY?=
 =?us-ascii?Q?Pzba1ZE4l/8mtyOwpNz/FsGLuuwIMIefK509iDrg+jf3Tr30a10+C6gGfzZ/?=
 =?us-ascii?Q?QdFF0Us47MpFO+I96Q2Zhckbxc6gP8uXqm9GcSvOWzxH2UGK8sZY9ICgkfGs?=
 =?us-ascii?Q?Uvosk+XJnldkt/yXqkxhmJ//+xHIrV1/ueT0Vnd3BqOyRaC2aQvdh9FnDQAU?=
 =?us-ascii?Q?APhdWVcVqHqkaIsCfkfzXyW5A94WhxmOqnlWpq38ywsO21nZWO7XKnmC+HzW?=
 =?us-ascii?Q?QV8RvBMPoNiZph7Vg6unlYGs3BdbCm/ppEZKGo++lFDFzEkt7SPxlQj3XgR0?=
 =?us-ascii?Q?thed94GjsbDWJ9xauq0nuU8Whbh2jYMV7L9Z/TULMdLQiznzfxWCSOe8fxrS?=
 =?us-ascii?Q?XFd1zI6dDIfiAVFz+AY1YSVFLZfQEpaxjJHHj9dtXI3koS1+/2uh2bjAWeZ0?=
 =?us-ascii?Q?fwdnCBXTZ/js0UH2XjVqxy7JT+pvs+33jbAO3itb2lnDNcAHniAumi8Inyw+?=
 =?us-ascii?Q?to1aj4JSOigd49nbN0czQf5qDEvBfuLJn4XEsC1FS/XDuDMVXkvTQGh2i9oe?=
 =?us-ascii?Q?zvZealrp5/lwm3SVBE2h9xms/OyKTancV0y++CuggtI9rbQvwX8aQC5UMVz/?=
 =?us-ascii?Q?b4snFYuSa2KAef/+0VmqBKhOuIDKNundegHV/tdiVQpl75xIfhRKtok/Nge3?=
 =?us-ascii?Q?rbPEFSeyVvSp6D/bNrFzxbgNRU/+hpQLTMqqUNYVIVdlFQNzxLj7Zwm9w/s3?=
 =?us-ascii?Q?LheLRqb40k6BJGVcbW7OHQzsyh8VsApzyEn4CK0oa8rUHJGhfe963VmEcKl6?=
 =?us-ascii?Q?rQa8hyHdgWY7f8W/OgNAV+L/AP5THNzPh8ln0pJzo2w8eKNOyjZJEU/UFLVY?=
 =?us-ascii?Q?DYn+G1c4jvOSt7Io1+Xn81joZv7u6QwKBY5Rqf+Jy3xUu43wdSGLLlG1x6sZ?=
 =?us-ascii?Q?j5bLDLhGIR9f950EGvmrGsTq6Kh01ATTZshAXlpaC5rDvxXiCZoAKsw3/xQg?=
 =?us-ascii?Q?VNVVPjMIYxvV/vMHb48aGyHsO7PFTeeADbM57D3G?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c123f1d3-6de5-4dbb-7caa-08dd784095fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:01:34.7846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhmtiyQ/FD40tfKXF4ibG238o16AkKnssoWV1DkhimWHfQv805YW3V2wp900t/PrUnU1pT57RefowJUZFJrFaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9408

On Thu, Apr 10, 2025 at 11:02:43AM +0200, Primoz Fiser wrote:
> Add property 'no-1-8-v' by default to usdhc1 (eMMC) node. Bootloader
> will take care of deleting the property in case SOM supports HS400 mode
> (1.8V IO voltage feature flag has to be set in the EEPROM).

what means of EEPROM here?

Generally eMMC worked fixed voltage, why need 'no-1-8-v' here, even no
HS400 support.

Frank
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 3d84eed33074..d6589d26c875 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -172,6 +172,7 @@ &usdhc1 {
>  	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
>  	bus-width = <8>;
>  	non-removable;
> +	no-1-8-v;
>  	status = "okay";
>  };
>
> --
> 2.34.1
>
