Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2059.outbound.protection.outlook.com [40.107.104.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B1B21D5A7;
	Wed,  7 May 2025 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632299; cv=fail; b=gf42z/MDZ0kQZURrmJ98MvZkRATETZcaZdr9Jb16ZmGlHtZLwn2C1v3HhUhhvvodqM2zOB9zZeY5/DA+t1fz5NyBVUj92OnQ3+A+Bo3XNUW7momyiy8Tr/Ww9fu6BU//oJ/oiTP80Vx1ePo8z0eIl8q4HndHhOBPxsSrKuSAvlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632299; c=relaxed/simple;
	bh=SU7FRxK7VZ5H6ETKMzrjEPpY6gb6rBPgh6Zhp6oyQNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SSEROSwlgMH+jLpjHCzS7pxjsVN+0qLrzWlzxlY1RVwZAGI3aZVl+/AlV1G8f3vx1uF7esLQH7pjunq07xqgK8ziu23K1Wzf78L8IB74/wp/3e1rvM0hh9aPI3+WvM1HLxVbiAzvH6p6zHuXnefowL1DVYTqQWRwes79nS5IOGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b5FvwBrW; arc=fail smtp.client-ip=40.107.104.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b5FvwBrW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUj74QXMUTBxtq/8aWT4Jtb15G4oQKuYq+wfvZz3bHvFqreTtUSbth2unPVvsgR+AV0+FfE07dJgGEgxCYe2SIfN2CsWWp2kBCaGEJNz4ggk0EQSkYS++IbtLQZBG9MJqtgT2U8SZdUpyAszwSngGoase7+/AmJR1RzIemVFVuUm6Hq2v4Lz3zFHTdOMhzLWsW+BJPcK1+1Pzy2+3EdePgvd+Kro4xBKoTIkhFpBU+c8kAo3OkMOsgRAurJwuUlKE9ds0GmYOkGrhdIQZ6a90fsHqYiRDjKaVkiLZ4rimWak7n9XgaGR2tUjNv3iGzCnQrgTQagibbacixBdiNxfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5leiuQ7nPztm9kMB7i8cdVJZtzyS4rGHkIMKSb+qdJ8=;
 b=r753jsZSHqPckXpvWt+FxG0IXt/2rDWKRZk278F51mX1eDbdyDOldMUybSkcZLEMjzQI/vazz2CC0PKeFM1fCu1WWTZrz6rk41TyZOY9xkEZfhc1OSrxCL0uTeAq7jBB4BQ16+B+DE/ERgT3bFgIbMOxQh9v7rNPUQdzMBGUj+MurO0Te4BsuTYwoa1e5XwPu4QVHuQCwubw57SdoWZtQF7ivSFR+i9IhxhvkmXGevvtiDbUzFVai7Ua6BzPz6U1TaUWVYDNSBAQXdJM97eZn9qQ/f1b0VeNWmevJPI2hNoMQ5nd1o3r24BYABW26sxCa5rcLhg/37RH7HKw5RuwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5leiuQ7nPztm9kMB7i8cdVJZtzyS4rGHkIMKSb+qdJ8=;
 b=b5FvwBrWj+d1l3T5TsMGIqa/8c87cwTAiTgNefnIkVLNWE6NRFGijf8ZGsCtuLoseRFlaZtZoFWyGcc0sauLNC8cvhqQSXiUbfxptEKY9Gz/z3XreWjZyuiSm2X5HBApygfWPKUPwMWCj9AhEnuN/U1EcZJZ9FQNpUP9p+7WfgvvtiBULG+Lbs5tQVCxasPw8QFgd3Xxnw3GEK3cXNCVMubFyuMRNTHGAiyCnAyhbMV0OiffVQXgIOrbZS4nE306TfyGp46h41ZzwlBXYpHvY79SQpj0icRhGdYtvxdLr48GcyRuriJhgPheKnYVnyaYcbQTYIkS5H+B09oIbJ5WNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7790.eurprd04.prod.outlook.com (2603:10a6:102:cc::8)
 by AS8PR04MB8419.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 15:38:14 +0000
Received: from PA4PR04MB7790.eurprd04.prod.outlook.com
 ([fe80::6861:40f7:98b3:c2bc]) by PA4PR04MB7790.eurprd04.prod.outlook.com
 ([fe80::6861:40f7:98b3:c2bc%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 15:38:14 +0000
Date: Wed, 7 May 2025 18:38:11 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/6] arm64: dts: ls1028a-qds: make the QIXIS CPLD use the
 simple-mfd-i2c.c driver
Message-ID: <20250507153811.ukkficut2f3jm2hg@skbuf>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-6-ioana.ciornei@nxp.com>
 <20250502-savvy-eccentric-hog-b4fed5@kuoka>
 <smfuskvhdhrfrgbpjflgymoadms6vfiwgjmipsmkrxldtor6we@tyvafv626bwr>
 <8ec115f7-1a35-4506-a20a-b4de27f10960@kernel.org>
 <z7knkmi7kjhwlqwokikozos7whwaj5vmseh7kjrdl2la3kmj5e@wwzlsxpq573v>
 <7d6b529e-ab26-4efe-8b91-1facbd041ba3@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d6b529e-ab26-4efe-8b91-1facbd041ba3@kernel.org>
X-ClientProxiedBy: VI1PR0502CA0035.eurprd05.prod.outlook.com
 (2603:10a6:803:1::48) To PA4PR04MB7790.eurprd04.prod.outlook.com
 (2603:10a6:102:cc::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7790:EE_|AS8PR04MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0df9c0-659e-436d-9a92-08dd8d7d2ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SAvSyvmUgnZ86FcgLGtDLfvp9EOerG3fSvcUorBtVsEG9habmaUWOTmiLqBN?=
 =?us-ascii?Q?V4wHDgamWPyPIA/14mtAFPZXemnpQVIsiz2CFH7ihQmQVpp2IzKCSbyzgPwO?=
 =?us-ascii?Q?1IHg9Fc0uPCKfbVcrTXKE+Q5iNrTRDRE61asXYb8uQEfq6/3rvpQJHNCD9y8?=
 =?us-ascii?Q?8fjumIZq4/T7edihh23FY2MgBvOSz7WVng4vVqyhq1gS5L2CvOoYPwB89n/u?=
 =?us-ascii?Q?oPhyRNORq37a81bFsTk0R1LXXSMY8iDlkcBq8TAAMiaI4k9ixUiDnBASedte?=
 =?us-ascii?Q?URoBjk5xrPXWCpdYIwVctWGW+ZFMpm3rUJYpi7v+K7eYjg8nbrG1bEtZABBT?=
 =?us-ascii?Q?6Pk8Fx0Lv3yPYSeFh3GrS5tEpQXsVuztZWR2NgHAplFMnuCTMtkA+U28FLug?=
 =?us-ascii?Q?VFsJTTN4FKMDQfi4/oQJ+vAcOimczWvo+UBLybHv74w23CNGhvgCH6Cice+k?=
 =?us-ascii?Q?aXij4cutUzH67uByETJf0LuPbUZevyWgHVMBE2nlGszvFayxTmmO2maGbUtl?=
 =?us-ascii?Q?DKaooK9KMhOt5/ZWv9CCLiBigDz0sWxusRcJ0kJDNrG4Q+nUup38kesSQsGH?=
 =?us-ascii?Q?TUC1iGL29rWJeybu0imoZkP8TEqulOZw5FFuiMtR7qSvdZ1b63QphmA9A7jB?=
 =?us-ascii?Q?G1d5fCqdWNkSC/3B+jHIEV2SPwSNNUQeoHR+n8gfI0Y7tz8VqNOiBFwpNOBk?=
 =?us-ascii?Q?SFzH+F3Qo5ILUfNBx+LIGh1IB1XizrHBYyxIBjoPJE5lokDsj6/Gw9UZSArL?=
 =?us-ascii?Q?4rgM9wU+7g8pzYwCj8EssLNIZ260c3GNZnYiGT4DoCc0pwtdN6VivWKMq19A?=
 =?us-ascii?Q?E3c0ShcyqnSprMnlnR7EljxM6vc1+hHUaT7LTtG1RndX45zI/LEWzJaofpxj?=
 =?us-ascii?Q?gLkqcL5peQOxyzjguzOfZ2Or+7JlECYpd8gy4yV6lHC4J/lqEqEcCkK7E3CV?=
 =?us-ascii?Q?GNM9jqe+9+2/9f2m6kXMb2J4veRbmH43ebBIr+FgyMErmXl3Xpi4r6plzuTo?=
 =?us-ascii?Q?yb+RCfiklhvopItAJtJcXRaqKzfn2+c2ih1Qix19HVO2rcOEog841EIdAC3I?=
 =?us-ascii?Q?1eTwcQ70+ag8TEhypShqcn/lFoO1b5MYPnpjGR+wmjrTTuUu7NGn/yGHEwre?=
 =?us-ascii?Q?y13P842R9UvyZDIhZcpj8W/QKvh374+GrRqNfqr0Rp7IBjDzL0Mn10DWBXb1?=
 =?us-ascii?Q?jHrSdmHeQR5qj3zJnLXRV2DZON7FhCSCRb87bGqCzs/3MfcWSvqARODHvkcp?=
 =?us-ascii?Q?XWKDfq1WVgyeiNoxA6T3avQdpwx++oAVUHzC6VMoj90YRPBd+0uwjPTbenj4?=
 =?us-ascii?Q?M35wWGNRP5iZPGmLTRBEmjOb/Fwkj/852XzArQffETe7yP2ZLHJ6KrGvo4Cp?=
 =?us-ascii?Q?hTGISlctJTdJqBvVapJnFKNe+UF8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dZFzTfw+85Kev7p3+5oWdzmWSaDqWpuDI8bxV6mXN7MZ5LXKmjNP8ESAozuQ?=
 =?us-ascii?Q?lkFNKQ47nrCPCbAlChjqWI6WA/4WaRU1QsrePkabfkdAe21Q1uN2TDyjzQIq?=
 =?us-ascii?Q?h8n45v2zZr3FI8XfmVpQnD+VrjU2ijzOUz/dFwJoxMScrXCqMwHPbSbHeLl2?=
 =?us-ascii?Q?oWpOIif8WD3ouE1+KNlcqm6P1XDRUxppBgCAEfvgchVgTxit2vdYFSpK6HYK?=
 =?us-ascii?Q?KA1rDahF9TLTGBgM4xGvUz24hHkU43f8U41mAVMxAgGGQVzgSin+5i3i9L/L?=
 =?us-ascii?Q?dQpKrP4/GvTDXVPv+SXxyXG1vDfmO1yx2b8A1gKG6bYEWMXfFcU5J/pmC6Xd?=
 =?us-ascii?Q?8h9VTKR3tCUnEDRTttKT5CxnqFtuOzFRpTqTef+S1J7m3MIAt9p0pI4ETnKy?=
 =?us-ascii?Q?9WtFO+Gq645eN6uXR1IzeNMmaOv6M6GooNy+zwpAjeBm4NHin6LiEfQHFr9w?=
 =?us-ascii?Q?uXESD+0EZGAdV81Gz7WbfTWkSTP6YfRqf6TvpGYvZYyS161VDoQwFInqhQXv?=
 =?us-ascii?Q?rDU+3sU+svPYeIpDiDphyMnFRgveN/C12TQvPlCflj+nq19ifwnoRiQbkFnA?=
 =?us-ascii?Q?o7to8sPA1Z0Weq61feQhSI75jxbKtEA5LVO5+yyFJj/6VGN0gyrrIVFmYwNW?=
 =?us-ascii?Q?MEvQhRnMkU3BCZs6HOBnHxvt/46ScyvQ9lwP3ztObGVnzyWnqBtKcbhG7aPM?=
 =?us-ascii?Q?YTG2v+z8nyDRDSd1wiMknS7m52wnRRaBIdnb2jjksnTHS4Z8gH7dgaWlYHM4?=
 =?us-ascii?Q?j6LJnBXgFDKfF32PK86EmY9GNUA9MiNRlXjUfLxRik8GFwKQgOl9jb19DwsN?=
 =?us-ascii?Q?nZb6wq35YDrJ8hPnFXMZbhppPlBdUm9SDrCRJQ367CGPg7uQt81z6C6IUKls?=
 =?us-ascii?Q?zABzWXEFeQuq65mbuEl1blCCW4FKnUixo/0APeyGteg0KPSfr3wtn/14iMwu?=
 =?us-ascii?Q?WEJkHtm37/9NXrqjACNnrCjVUg1jJoWvOWrwCvre3Hlx3FdXHw1OL90by95z?=
 =?us-ascii?Q?F201Eu96aZog0j+hP88D2Tk02eU5VreYbn/DqIzyhYh41XOeAunO5F/gJ+2O?=
 =?us-ascii?Q?9qlZuZl9ZwBPZlmcpcVByDJF7cGEZw2v+8KV0TxJ+APXCCmdW/9F+cQunmcE?=
 =?us-ascii?Q?rP5BdezcEWWt1uHy7dbpcsV0kkJlTvRdt0BpvWErpm81dcFX8Hqu/I0VIs2u?=
 =?us-ascii?Q?ttbp8qkSlzEeGNFvXDn8epTUVSBUWL3SOxqPmU8CiEmObe1r3r2EXvUN+k+G?=
 =?us-ascii?Q?enfHYsV3NK4nT0XN7sMY7vwXyypvhGjeCMGQvqLL0AB41NUM614w7B31Rft0?=
 =?us-ascii?Q?M2a+ZB8Dk+Z7MKUv/LIhQJaEEthVvW5eCw+c19LkiH0dZMAoyMT01pBBu8M3?=
 =?us-ascii?Q?1SiEtAcz4SZvyb4ngpZMYHBHFPTI9xohy9NrdR/cHDt86lCGtaI2gNUvUknt?=
 =?us-ascii?Q?xKknB53sTUUx49cLYKFaKxrZUrOVVBfnzurmlPkM7smk+HS3nfbSsvY6xGjP?=
 =?us-ascii?Q?ccgdA9BSmNCOmIYSJQxDyhhsLQmdpjReVjgkLpnZq0/yemTdnYjelDlM1HE+?=
 =?us-ascii?Q?38WRnt53Jfy86gkGjUlrpH6CxaBuiMOYB6TNcjDIahUoqc50vtGslAIBmK6R?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0df9c0-659e-436d-9a92-08dd8d7d2ded
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 15:38:13.9676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuQcZOGGdGKZJRx2T6Wy6Ogk97OeByqwtT4+Vku1SpL1yM3AgcWcfhmfSCiqj1YxX58531hALCRJNUjbgkqjtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8419

Hi Krzysztof,

On Wed, May 07, 2025 at 03:56:20PM +0200, Krzysztof Kozlowski wrote:
> On 07/05/2025 14:28, Ioana Ciornei wrote:
> > On Wed, May 07, 2025 at 06:54:38AM +0200, Krzysztof Kozlowski wrote:
> >> On 06/05/2025 16:21, Ioana Ciornei wrote:
> >>> On Fri, May 02, 2025 at 09:04:03AM +0200, Krzysztof Kozlowski wrote:
> >>>> On Wed, Apr 30, 2025 at 06:36:33PM GMT, Ioana Ciornei wrote:
> >>>>> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> >>>>>
> >>>>> The MDIO mux on the LS1028A-QDS never worked in mainline. The device
> >>>>> tree was submitted as-is, and there is a downstream driver for the QIXIS
> >>>>> FPGA:
> >>>>>
> >>>>> https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c
> >>>>>
> >>>>> That driver is very similar to the already existing drivers/mfd/simple-mfd-i2c.c,
> >>>>> and the hardware works with the simple-mfd-i2c driver, so there isn't
> >>>>> any reason to upstream the other one.
> >>>>>
> >>>>> Adapt the compatible string and child node format of the FPGA node, so
> >>>>> that the simple-mfd-i2c driver accepts it.
> >>>>
> >>>> Why do you break the users based on some driver differences? Fix the
> >>>> drivers, not the DTS.
> >>>>
> >>>>>
> >>>>> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> >>>>> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 9 +++++----
> >>>>>  1 file changed, 5 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> >>>>> index 0bb2f28a0441..58b54d521d75 100644
> >>>>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> >>>>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> >>>>> @@ -338,17 +338,18 @@ sgtl5000: audio-codec@a {
> >>>>>  	};
> >>>>>  
> >>>>>  	fpga@66 {
> >>>>> -		compatible = "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c",
> >>>>> -			     "simple-mfd";
> >>>>> +		compatible = "fsl,ls1028a-qds-qixis-i2c";
> >>>>
> >>>> This breaks all the existing users. NAK.
> >>>
> >>> Using a mainline kernel, this DT node was never used or probed by a
> >>> driver since that driver was never submitted. I am not breaking any user
> >>> of the mainline kernel.
> >> 1. Users of DTS is plural, so what about all other projects and out of
> >> tree users?
> 
> You still can have users in all possible projects. Dropping simple-mfd,
> even though it is Linux thingy, is affecting users, potentially breaking
> them. Exactly what we talked on last plumbers - don't do such changes.
> 
> I recall even warning from Rob for people adding simple-mfd: be careful
> adding it, because dropping it creates compatibility issue.
> 
> This is not a fresh platform, where you do not care about users. It is
> published to all users since ~2019.
> 
> 
> >> 2. Did you remove simple-mfd from kernel or what? How can you claim
> >> there is no driver for simple-mfd?
> > 
> > No, I did not remove simple-mfd from the kernel.
> > 
> 
> 
> ...
> 
> > If, as you say, this works just by having the simple-mfd, I should have
> > been able to see the enetc_port1 functional and the RGMII PHY be
> > accesible on the MDIO bus which is behind the reg-mux. But this is not
> > happening.
> > 
> > Instead, I get this:
> > 
> > 	[   17.635216] platform mdio-mux: deferred probe pending: mdio-mux-multiplexer: Failed to get mux
> > 
> > 	root@localhost:~# ip link set dev eno1 up
> > 	[ 1155.190391] net eno1: could not attach to PHY
> > 	root@localhost:~# uname -a
> > 	Linux localhost 6.15.0-rc5-next-20250507 #112 SMP PREEMPT Wed May  7 15:21:14 EEST 2025 aarch64 aarch64 aarch64 GNU/Linux
> > 
> > From what I understand, even though the fpga@66 has the simple-mfd
> > compatible, no entity initializes an I2C regmap (since this is an I2C
> > device) for it so that it can be used by any child device.
> > 
> This sounds reasonable, thanks for providing context. Most of this (so a
> summary) should be in the commit msg as the rationale for changing the
> ABI, so please grow a bit the commit msg part:
> "The MDIO mux on the LS1028A-QDS never worked in mainline because ...".
> 
> With all this I still do not get why do you need to affect the
> compatibles. What is wrong with the actual compatibles?
> 
> Best regards,
> Krzysztof

I really care about not breaking compatibility with device trees too,
and that's why I occasionally report issues such as
https://lore.kernel.org/all/20250412001703.qbbfhtb6koofvner@skbuf/,
but in this case the compatibility breakage is not something to worry
about.

The QDS (QorIQ Development System) boards are not made to deploy any
production software on them, they are more fully-featured variants of
our RDB (Reference Design Boards) which sit in labs and are used
exclusively by engineers to test/prototype SoC features in order to
develop for other (production) platforms. Most if not all engineers use
TFTP to load the kernel and device tree at the same time. I think it's
going to be a case of a tree falling in a forest with no one to hear it.

In terms of other projects using the Linux device tree bindings - in
this case that would be U-Boot, which unfortunately has yet another
schema for the QIXIS CPLD:
https://github.com/u-boot/u-boot/blob/master/arch/arm/dts/fsl-ls1028a-qds.dtsi#L134
So not really a concern right now, but we will take it as an action item
to resync U-Boot with the upstream device trees for the LS1028A-QDS too,
like was done for the LS1028A-RDB.

In this case, why would changing the compatible string be preferable to
using the node as is? It would be nice for the QIXIS CPLD to have child
nodes with "reg". The current format lacks that, so we thought it would
be a cleaner break if we just introduced a new compatible string, to
make it easier to distinguish:
- "fsl,ls1028aqds-fpga", "fsl,fpga-qixis-i2c", "simple-mfd" doesn't
  expect children with "reg"
- "fsl,ls1028a-qds-qixis-i2c" does.
