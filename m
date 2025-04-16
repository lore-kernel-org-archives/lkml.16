Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B241C54B2;
	Wed, 16 Apr 2025 14:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814366; cv=fail; b=ZdSA7LebMpRURd/iC0Z8uJxtQseQf0EW0SOPKndqggO5WkQ6tDg8ZNhCQy4w3Xl4lt7dS+OIGAIeN8X0tyS944dvc9OfsTDrtTHXvZ3xeWgvqi2Wo3nWCS4K6J85ww+V64F8kkRWVj4hJEOecXyd+/wQ4X5LuBFMlq3h4TyZP+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814366; c=relaxed/simple;
	bh=hj9ClJEgUcx7MorFkOwpD3JdO42xXySjz7eujI5vpWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M2zHz9AjaJfXR6nDI6JO530RWTKkykVzktzgh0+216M1NtNK/ZcDqDvZ8XvtX7aVSeU/6Mfk7R7ZhGBUI8UhsI5Un9JkYr+msilb2OvpPpTv7X+kajTsv5hgkogZYpzjAxsC/JGjJJjbL1RksWTga5xHEz5MdbhabKiJO4UaMG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ksxRGSZw; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ksxRGSZw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Irosy8XAthsa5w4QfixbnXKdAjWj5YZvtEFdQ2JTRIqzw5ptGYVKpdrWGwupGVMMxD7pfga7b7gFlsNZ6Lf8SA76pcQwvxmuy71k1gyaSiD7jOZSHMMnHZxPc8hx4n0Yqfbfu7+XRFbycgwk24yrg0AGtQoaExwW36T0bUHbPYWVzxkqP+kFbYhe8bsAT8z2hxkL+a8SQPYWvmSNzhuNaXOkERyZAql+4DGkxzJSczWdTg83h1dzTFG8tbWpnUlijo9YdYZ/bxxQq5tbHcXkqAIdapVDwpkDRkIVvoY2AwdvUpmjge2trKBTXTxwZ5FM7584XHEcOhsSxbl2UK3S4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9Y99HzKB7Ez96TeqlvkiWbbtmL64rwsI40h5F2zz/4=;
 b=BNCrzzjpW6Knm/tHmVeyLdFOlaSK5JBLmxN03oefps1qLnx9UKgklJthkPLQ5Tz+qUQvlRD34eH9Vi5q9dphs9/z2z/tq/nKIeoQYn4MOP/ysk3wFNjl9mJ0G6/L3QCiccp9LTasKMQ0zWik537XGa8BgX0NwvBlqY/fwz+lP8kBwOaOJE1w1FiWP8f478BJqPzoA/kIZknTtHyhTMVcOQSsdH2yNp1p2M9+mIKIa/1nvllfdjYjqf5lsZJKp5Nf0pfB0uDLBemqh8OMygpgo14Ifkwlqb0uWpBFQ34ju0Pr605qYg5e4I3yzGF9qWVP2YJ2PkO93Sa2Q+JX8+kQxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9Y99HzKB7Ez96TeqlvkiWbbtmL64rwsI40h5F2zz/4=;
 b=ksxRGSZw6rjNtxV49Mr5cTP8uRhh+dyP7CWkvMAti4XXtDiRBs9fQaf1pbIDXQrR1iFR8l5kgLQuVNwApWVWLL+gQg8FXwmTxToVYEZiO3H0YW4sZeRo4FcjCJgunu/0DxCBJN8u1vWkccPXh4fC6Dtqa3ka6VX7MInIlhF4Z8hJGtP3RZF2UIwrxNYbYWx40ephcY0mT2evtP74xS1JYnt4vMCG1D+ozWgc+aPmjkfQVDB4DDqn8CkkpOzgrHgu48f1nGNJWOfKcG6hpOH8DT6dplzfoEa9/uY/96cRrrRkwLOIXV/GswusxJURh2fU6KOP/nnX6+UNtblx5kqiog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 14:39:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 14:39:21 +0000
Date: Wed, 16 Apr 2025 10:39:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 6/8] arm64: dts: freescale: Add the GOcontroll
 Moduline Display baseboard
Message-ID: <Z//BEiuaxmWVrYiZ@lizhi-Precision-Tower-5810>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
 <20250415-initial_display-v5-6-f309f8d71499@gocontroll.com>
 <Z/6sWD949qKeahtc@lizhi-Precision-Tower-5810>
 <78d30ba1-a4fd-41a8-967a-97252cc2ac7a@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78d30ba1-a4fd-41a8-967a-97252cc2ac7a@gocontroll.com>
X-ClientProxiedBy: PH7P220CA0144.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: dbdd0939-e9f7-45ba-f126-08dd7cf4799c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qYoCBnxaSWvRWL4qckG2qcwMGh1tF3OTWVN80R9b8o/ZYr4MlMvx/JqUYfwF?=
 =?us-ascii?Q?fJ8oeVO1OjE+OrglcKU5PtlBFS9z9HbREkhwSzvBDQxHL5P+FeXAkCzVIGIR?=
 =?us-ascii?Q?9f4SYs4jwI4p01maVQNL3YUdMYRrBh6FcztiQGINmyq8sQ/4YcsIihEErn6w?=
 =?us-ascii?Q?k49AznUn8MfckmcV7+zXLBWUPm5ltcIycJf0RsubsdksTuLKfTAecCOXjuBz?=
 =?us-ascii?Q?Cp7wOh/jUJpV0tb/PI/KAAlywiB7I2g+EPk9VQXZa6j1oRh2RV2WbW2E6iGl?=
 =?us-ascii?Q?KlqGMQ0PELMZhfH3NcH3xBbWhUVD3mD9RKCAVJU52PpAt/YOBYxFQygH7jzr?=
 =?us-ascii?Q?4gX6dfkwomIFsDO9g3qOKKpwBr5MyRtc2z84mkDyTVN/pHzlHx0yGozfl6f0?=
 =?us-ascii?Q?5Q+IE7ng0l3tjD+ulYITVtSn8wEY/5bCY375EpkYk6S6YClG3PI2NH60Wgd2?=
 =?us-ascii?Q?Nci4I3Q2bL/zNT15EZy5Pw2IGTc9/8CRNzHy0PQz/j+c2VySwCWTKbWKKIYM?=
 =?us-ascii?Q?e7AIua8D0QBbZG1prCZ6CbVdLgvmOoJRtaQ2AghWtMcqMyTK1ZnfGWrUU/2G?=
 =?us-ascii?Q?3CGyIN8VFJh+iAtsUOAbHd45tqhvM0K0cp4wYD+b+HWeOo9GzNm5LruClZPZ?=
 =?us-ascii?Q?jTQeiuYaouBDtk06N4s7bAxDQGnmw8boyRlF7B+M8zi7n+E1LKJP9/8I122r?=
 =?us-ascii?Q?cY+IJlekVVcmtrA2YA7EDph2rr4hBe9HJwViAE1/7+nxPbp0KjWH6hQJraOm?=
 =?us-ascii?Q?+UumjQ1y0jjpwa3cn8scWII6gxNynxQvoWzmwYIyP3UlNydLOW/3IxdeY4Je?=
 =?us-ascii?Q?BOn3mkHwsnpfwFV4tr4m/9pjTWPKASfYqYadr2dH/xnfBpwYL+8elBcIhG+P?=
 =?us-ascii?Q?GpsvCjwtkklWFEpW87fgJtNaAHVK5GUpzgGJu5D+EUr9D3qsaPeebqXsuLbA?=
 =?us-ascii?Q?xNjhAWl6GeZWJxtv2N0km8+VxupGC/YwfkQGvxCVzHVTJEC/MiVme7No9AsY?=
 =?us-ascii?Q?7m5fRpvSEoJE/HAYwKGej6WJWqXiLarUxEsg5Ge5NgZnKttP5ecwLGfvUV+z?=
 =?us-ascii?Q?fR0dOGnn12hCrhfKPTKsLtyqOzQR2xLxGmxEWNyZVjWYgUawrKv8+7HsB7Xf?=
 =?us-ascii?Q?5jiunSbaeqjQrLzmtZkC8jtNMOCUh6inOg4GOTDhP90Ghm8zpOn7K7i67biA?=
 =?us-ascii?Q?KAYYk1kqcKBX5sLRDV/CqvXyAH8ay0I+kVdoitBP79HqveQT8ispMJtBOH8z?=
 =?us-ascii?Q?7o/09ilcOd738KQDxpbOfIoAijrHC7ZkHBVIpUuAX2DMpikxSgQV88TSgJtr?=
 =?us-ascii?Q?k3t0YiyMv+DuhE/JWFZr2nIFMO3UMl0ITRMyGL0RZt9IJ5zhD2N2iUrwQwoC?=
 =?us-ascii?Q?E6POQbQzLxogtKJEe5cqGvx4eMTbdSsHb42faLRlycQa/u1aQMNqHMZu/VNM?=
 =?us-ascii?Q?9hpHwJcoP3Lx+dqgtDqLqMwqbTTa+MfKpdLO9EqYtdDLulXl9eBO7Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a7fxCZe0oFbOpuifTRVFivEkYlc4ALHePgV8+rI9Rrpsc90HPS5+T7DnVO3m?=
 =?us-ascii?Q?AOb1UbAEjmm4+qHS1trwWHtaQ7mm7vb9eF02F6fHIr+dWgaARaHD2y3rtHdi?=
 =?us-ascii?Q?xGGTNaQcwrO0QpGC2fUVCWkLUJpPyj0F2ix48Z89Q0KvgBcSWF6vrXJYx9hH?=
 =?us-ascii?Q?WOLnjZq+LSFsgmAMIbj0iHLgPb3aRKun7Z06o6wVRhme3yFW38MqUCgBCMKL?=
 =?us-ascii?Q?5Ja2d+DmYJAWOMveM1IHZ8BR6a1VlHTB6jY20BvNpGxHjrdqUfBU5T0o6KiL?=
 =?us-ascii?Q?ei/xJNnrjIcmNJna2vheOl0oOk/nAZRvqq3xYSRDlOvwrZAWPcmiDAJXxnwt?=
 =?us-ascii?Q?J2xF5UDjw9NIUTuJoVDED3Bvc1hpA5BRqxpzT1nhwAmkmiRcFM2/9Zstdgpo?=
 =?us-ascii?Q?dt1XtiKkzhvQLUd6vVy5VwNlkQmsP5R2zxOcZAvn2wFFtwwLOhHTQDZzNfpV?=
 =?us-ascii?Q?eWMl42yLmxUuheY4keIIqXG6yPVxmTUT8tqMXzXN9mOFAgBHx+Gc5xvhyN2l?=
 =?us-ascii?Q?8YfdK+Xtxwfh5m76/CErX0JUEPOSfP4M/1I6xvZHcCDsKZLe/im/a6zGU3ay?=
 =?us-ascii?Q?Vw7NbHfVZegcJ2RwCv8j8SIR7Fvp0wpTzdFKzWVpBQgBtq1dqW6v8jBDQj5s?=
 =?us-ascii?Q?ePY9Upac+VjsqdLTOTSAkSTs88iekGOEjs4OjO3hkc0ygJYZIx3mhIUZyzRk?=
 =?us-ascii?Q?1DOTR2ZIloS4SZ/mbWAOrdCiaJvf+aktcQihvKyuO/dSBvybWcBz4qnL/J0k?=
 =?us-ascii?Q?mpCp6TzfsNDDHaBBNB1kpEtZRULmxicz5oMuH4SIxXV+HoROMhI7fYD5RtgW?=
 =?us-ascii?Q?wipYbN5stjsZ2LhPKHuRE2QU/ZE8CtdPNf1euCDOxGBXDmnvfiTCLDiqtzqf?=
 =?us-ascii?Q?hDf+xZiQX4IVfLvKjEbslXogAZQ+xSairPwBUOCr9RW5XQjazLXBwz7ZvFZn?=
 =?us-ascii?Q?BGbtNV9ubf2DrIu7Fx0mTGhpR47sWptOlvs9Y9Bun5CuFt1Q0gTRVc/fbt8D?=
 =?us-ascii?Q?a1b/mj/ryi6wwgg/DZvedi/ZCPL38ED9CI4Kpb23en9Y4fPPyMa+bXWzrJG1?=
 =?us-ascii?Q?PLTorNc0+N/6DMxK+Oay/m59T7O90tZXf/1lshxnZz4xd0SwqHw/N4RRkT2k?=
 =?us-ascii?Q?OF1ZYJKFlRxY/7wVr962FAdmaxVOaljwVkhtx4Btq/HC2YQHVkeTaOAtkIys?=
 =?us-ascii?Q?1sxcEWTO7/HQTu3jpmYGRQ+21vhEL9Nz1BReVVUOOOXPde7+k5paAxHx1ZcK?=
 =?us-ascii?Q?qF70r7XFy0OXkInhS5RTrUM984v/sPNi6TeHYguQ0Ye4MfpIgq4vO3SCFVxY?=
 =?us-ascii?Q?NuxDlVrd3BQepZ4lkIy7XSDW6T3EeLmJiVcBclVmR3ruREYGXUmNMvsyBd+K?=
 =?us-ascii?Q?n21ciyxiqW4yyg2W65o+r+K8guEj9cqjOYFrrQLZYTTEVlsZ0SeJmS1PWloo?=
 =?us-ascii?Q?AOFmtpFn8Vo1V0zQ++psJA8r6hBRPN0spEmoX/4kml+koUQCqyt8DupkvNvf?=
 =?us-ascii?Q?SIuTWIP7yuQtGhYoqJTsJ+XRrVIDJ4ShNm0TvsAxsk+rNA1yLI+a07a4+nda?=
 =?us-ascii?Q?Eknrm3sndprYjnmy4NnimR21Sjqph72ZD+mjsFF6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdd0939-e9f7-45ba-f126-08dd7cf4799c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:39:21.2552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGuw5OS6t0T96M6nT8MLzbbZ+8ih6Cc+0j4CZyTAIyEzXG/t512d/mtM/UeONgIMTlt2F2EGYA70pIjskh7RLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

On Wed, Apr 16, 2025 at 09:06:39AM +0000, Maud Spierings | GOcontroll wrote:
> On 4/15/25 20:58, Frank Li wrote:
> > On Tue, Apr 15, 2025 at 08:54:29AM +0200, Maud Spierings via B4 Relay wrote:
> >> From: Maud Spierings <maudspierings@gocontroll.com>
> >>
> >> The Moduline Display platform is a part of the wider GOcontroll Moduline
> >> ecosystem. These are embedded controllers that focus on modularity with
> >> their swappable IO modules.
> >>
> >> The base Moduline Display board includes a board-to-board connector with
> >> various busses to enable adding new display types required by the
> >> application. It includes 2 Moduline IO module slots, a simple mono
> >> codec/amplifier, a four channel adc, 2 CAN busses, an RTC and optional
> >> wifi/bluetooth.
> >>
> >> busses to the display adapter include:
> >> - 4 lane LVDS
> >> - 4 lane MIPI-DSI
> >> - 4 lane MIPI-CSI
> >> - HDMI 2.0a
> >> - USB 2.0
> >> - I2S
> >> - I2C
> >> - SPI
> >>
> >> Also a couple of GPIO and PWM pins for controlling various ICs on the
> >> display adapter board.
> >>
> >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> >> ---
> [...]
> >> +
> >> +&ecspi1 {
> >> +	cs-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>,
> >> +			   <&gpio1 11 GPIO_ACTIVE_LOW>,
> >> +			   <&gpio1 10 GPIO_ACTIVE_LOW>;
> >
> > indention mess!
> I'm not really sure how to resolve this correctly, currently the next
> lines have three tabs and three spaces, which lines up which tab = 4
> spaces but that is not the case for everyone.
>
> I just saw two other ways this was done:
> 4 tabs (doesn't line up at all)
> 2 tabs and 3 spaces (doesn't line up for tab = 4 spaces but does for tab
> = 8 spaces

Linux code tab already 8. It should 2 tab + 3 space. but it is 3 tab + 3
space in patch.

Frank
>
> Another way I thought is 1 tab and 11 spaces which lines up for all
> cases, but excessive amount of spaces.
>
> > Frank
> --
> Met vriendelijke groeten/with kind regards,
> Maud Spierings
