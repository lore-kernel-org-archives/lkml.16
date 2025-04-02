Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2048.outbound.protection.outlook.com [40.107.247.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91341442F4;
	Wed,  2 Apr 2025 19:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621444; cv=fail; b=bw9/aZV7ZfPmpza8rnl1L+vunXuY4NvqUlpkjLEYOuqpPgRgn5tO8mL/G4birPPauuty2RUoS1QvZ0lsTsqbJMJVqJ5RBVzaLn/o8NO4E5yG8+emXHvjM18I2j5vxsCyhbro8uu10PsjOZPKF15NRLpXFSbDd6edmxPpOjdYppI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621444; c=relaxed/simple;
	bh=dU9Y6/oShUl2o/DHUIx/eRiFuGxoXwkhOAMkXZNgEVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BFFssuE9NzlulUBg+y5eV/9WPY7ZAsUMMcz6CshS7c4esmt9sAzuH0OwGoJWEonzN5hQlhEtWCKO5DLJBSFv4+nL1nsIJuaLn5EW1S8LXdGX78epOqC6nx7qvFplw5qjYIyHYMEhH5wr9JrCnVhZQhe8hLjdAa1ange9fLlgdPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kCJAg9nV; arc=fail smtp.client-ip=40.107.247.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kCJAg9nV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcRtTwuhETWsCSOLVwWX4qazYSWoo6BWAtAhMqiPwDmqSvheXIohkC5iUIKx2UwJGLVPNYKR9P1LnDAKriAsS/ZrhVVqhGo/bhLol9soH9KCbuejvfwurRQQc20P7UZzGELAGQGVVXnyJtYfyfZF8ZkVy6XMivW1V7do1R7YhN5A8OL5O/y58Dwx4S2Bkkm16LuInq2U5fyAYbo5v4yLQ9Fh/AETCXAiM4FTHLd1Sio3q2qB/FsfQfMpPgrrVSbIkwFzesjIgFt2FS03sooiVUQSQ67Q+m/3CNahlPqWeAVVBA6w7auuQ3aevPxOnTgws8u9pyOiD3MgvPGo+C1fcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQZDuQ8ovDPrzdi0Sx2Z9qfifqHWJuFNSJ2cRgOFhpo=;
 b=vsNPlv0OMMlCyIehYdwS1a2nwV757h9iPA2q4saRMIDeb2X1yDBxsmuAjVg+KTHxlQ1EkRAbscGCRaIlOk2pDdYHOUBTRFPYEDLQGoGwuxekQSqdzf8i5//BZcGGicjp/60NDpluviuFXBKAWXwLUryJr4btAnyLY9j64Xo/Itk5wtQ5mzEKvpZx4BnahD2vlr5jZE1Bcl+ALBgC5GGLzMWZ1ksO8/uwNXUGsk+pnGQQrbXZUlB+VhdA6zgQ+UBzVeoRkPO3HFkJTGFHQeZa+Im7+0SDlrJ/HcGAaeoqAUcssSuqWVGCGe+paE3jwTeLDaqbckyjCrFudDVN+EOFIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQZDuQ8ovDPrzdi0Sx2Z9qfifqHWJuFNSJ2cRgOFhpo=;
 b=kCJAg9nVr5ac71fUgjZq1J/AqQKFVpC8Wx7y7GJrm8H5NDPVhWMw8WFTg5jUGiyorlVai1BliDtVA0LCncajAURkDGScpT5xAetNtWIYZTyjwlHYc06KBZO2FjrnlS3I88C45J51fy78Qppnh3pB91tAZKQ9ug2GBhtw1LwfBjjQOwXJzDxbagZJv8DwbiuC7Nh4dn+bj1E8evEphGjRIrQOGsrYDweMe6DZym9UAenCW/92Hthn78eVIEm01GU8yM2Wu9reDczr9fltJg4dQlpByK1/lBd3T6BBTZwI2MHfUQWT/xKQbp6z77njsBshqDaCc7uPBMncESPSvkYEpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10345.eurprd04.prod.outlook.com (2603:10a6:102:425::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 19:17:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 19:17:18 +0000
Date: Wed, 2 Apr 2025 15:17:08 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/9] MAINTAINERS: add maintainer for the GOcontroll
 Moduline controllersy
Message-ID: <Z+2NNFyd3NmfeMSr@lizhi-Precision-Tower-5810>
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-4-9f898838a864@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-initial_display-v4-4-9f898838a864@gocontroll.com>
X-ClientProxiedBy: PH7PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:510:324::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10345:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2949fb-d603-434a-a8d1-08dd721afc24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9F0pqLbjmER256oBn5f1NvfYHdSPN4MJwS7iPgIMUSkAPIeuam8i7RZD/bdq?=
 =?us-ascii?Q?on/QVgCSwu8S17UOqIjkgEjXtuHb+Rwp+asAs/HWoxboOM8KgtWbxIot+tyv?=
 =?us-ascii?Q?SnGMJVAI2Nuk7ar90D92Q+tP45Q56SPr3oGm+c/hX2xLmFiyDW03WkiamHtw?=
 =?us-ascii?Q?JKRnxyHoIGVBbkxCXt7h+FIZRROsgVQiibLM1CdVunL2kvEg/dr9YIquKyKL?=
 =?us-ascii?Q?pu4yE8FujsxoBBz8Kci8FysJzVALt/FJdJWNq3t4hRTz400P6z3dRLcJCqQA?=
 =?us-ascii?Q?X+OFBPQ9bzhg2SBIJJT/wJoBXlVIX19qtNMVcVLmMY29X7wcAdTyydRIEcD+?=
 =?us-ascii?Q?UReougKGPwqoZjhXgayUb3atQXIaiMxjIWXooCw2JP9fx0upAeu+RYDsFgDw?=
 =?us-ascii?Q?hU8CtGwf7xjylw+PPIf6bD9L4dVkO3iIovhvoLwc9NHGyq1IMnnOHabdWhxL?=
 =?us-ascii?Q?LEHXIxwGmfQgzxH5zzk/Lw1WjXbAWA6vT4gQN2rhcSmPz9MU/3zOoV65ild8?=
 =?us-ascii?Q?IP9i3tZga1T+x58UWoRg0aLk1MkIMR0siRKePzdheigQvwIHvLX+H28VnLA3?=
 =?us-ascii?Q?LzWxu+cMUwqtkOdZ3tamn2VGNEsuhOyfeBI+Krv7Eb6EbJb944OUw60ZQ6Xu?=
 =?us-ascii?Q?pNdXHmuajkCghe1HxhXMVbM6TuUG8k173F7CH39o5BzmWdlvBAlRE1vJQGND?=
 =?us-ascii?Q?fbFBAII9WpSfQzKV0ffjfJxYRo5HhgD4WWdiVfiQGUjcMMVaK4v6S1JvpS4d?=
 =?us-ascii?Q?4MzdJoYCk0u0LIf1MO6hVjrjuWviPfNUQoEyy4fy40OlLnfHHokeCOg4H0RX?=
 =?us-ascii?Q?YycQehp2U+f5UY5H/1FFqKhz0BxoDKI42bQeVTR0OTjXAN9PG8BsWHhCu9NY?=
 =?us-ascii?Q?wWhGM1d1fAKR6Njhj8vBH5aoNt9Nzl+Pq6MUvFqZKTA0EZDMhAn0SaJGUdba?=
 =?us-ascii?Q?gHwBhWYu8vimqLyxGkBVcNZf2ZAyQzi3HK/EJr7OQpOCtiqTEd7AKPoeRSDM?=
 =?us-ascii?Q?OXrZLeDCh9yavTOUVJahYUVd1mI7tAKjWwNvOCYfRmWQZXuwM9AQpdeP9GlX?=
 =?us-ascii?Q?/Fd5e8iQ07K4psfy8aYt8va7Zt7JJB5GOR4JAnzaPmaW8gl8BWR6j9m9KCGY?=
 =?us-ascii?Q?T8rfoUHqN7hBcf4d6GhHEWyWHgrfgHE0S60KbBp4TvLXXoGKcIAD6waftQqU?=
 =?us-ascii?Q?OBGtoCHB6kYtVjAMQ621kRgLM29LKAVgQPE+oTxyZJxCFrI4NLJD6xxI+DHT?=
 =?us-ascii?Q?oAISgU0AIjpTcqBvWVo1GcIiWuM/t7QE3pmpS/FPq7wlKMowwAte5/glD/Uw?=
 =?us-ascii?Q?Zx8HpSbDq6/JHLFgjQCdn4YF76RcfCFrKgLwTnkB5dVRugLjq4tqlklj+UEJ?=
 =?us-ascii?Q?fmHYvCxZpM4KNkv/BUfekty5TFiW00yFci/DZ4g+xuWEYY2XJidQYinO9uOX?=
 =?us-ascii?Q?bpva6V/UqzjWjHIHHseOUL1cp7TvKh1A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nm+lJdIoDFVOIhoAa+ygOms93Jedps7ir+vF/yXtMSy56XrlGKaT54egUNoI?=
 =?us-ascii?Q?qKzQyBPy9UsyErrbCZQoPqoFXR8+sDfJGrgwE6HvuMMcGnmOczaCEM4EgK5P?=
 =?us-ascii?Q?Bp/i3NRVGYe0BrZhzMoLP67R71ESp8EJYYgU+kKTk3B6aWzn8C5tnRENn7jc?=
 =?us-ascii?Q?Fq4Xry3rqYc9XDpdzs2CKLB8t5SCB7Wig+q6gX7Dg9qhR/1akvKJIUcao3wh?=
 =?us-ascii?Q?5vRPKTcojT4+n+BwuNtpr/ZyjyxuaBt2eZh8Jhf70zClcnZ6jejEgZgzu1VV?=
 =?us-ascii?Q?AQ4Py0V7zY5BmASw3Az513ohx4WhllNWliXi1d/udsPiXr0uRvyzMICTR9FZ?=
 =?us-ascii?Q?ZBwIiJJvv4dvhOg+Yl6XmOHbgUlK0tmE4GVIXH1N0FiRhpnRjGXaOtLvt1rf?=
 =?us-ascii?Q?EAFa5BBl9ZdiqdXLz8/SWs6tfjlH+iParxyoCxibZNFVKURzNU1nK4ypDpjl?=
 =?us-ascii?Q?INmTcYdnwn1BDsDe70nvjjkhadc1N86p8ghXZXIIck3y+JQUey69wWgk7SUp?=
 =?us-ascii?Q?B7HWtCfH3ifIjMXRSpqiUQ7wCleXFvUcLXMPLGlzLf//ahcMD7nd1ZyBCiHq?=
 =?us-ascii?Q?WUuWhHolYuBDQ5un6rxhAOYuTuz8eEVfc4NlPa5WVZjfHzZyytbc9Gn0CIfm?=
 =?us-ascii?Q?th67rzqYQYBUzDnkS+RLKhMrsSgsSvL/Y46+4YeZOCMmC/YjRRmsRFZ55U2d?=
 =?us-ascii?Q?eLb8nuTo4Dg7kMQruxE3J0s7fPUtBywwJ1lAfttWXZYGKDJqspUpVUuJ9son?=
 =?us-ascii?Q?ms5T9JVAG9duNthWBQGOf/Mv7FTo8DfNlMUyca0Notfc0jSYO9oLltdY0gS5?=
 =?us-ascii?Q?Fzf/66KKa2Vzgx4I0Vb+P6vHi47BKfGudiRlC8dqDt3T92SUx119ZrGxt34F?=
 =?us-ascii?Q?NqlAaVLr0SFRHYjhtI2SlB5R0yO72X+QLQKMVBUakJescgkXR2/IXK9Q4399?=
 =?us-ascii?Q?OkgV/rPeesXzeChgQzKA3tFCiJt9fLtYn6YwlKKc8w6AwAS72ZzBSRZv1MU7?=
 =?us-ascii?Q?GuGKH0V0GUPV+9KafbRKFhdOVdQj84X14yQWeCCiK6us/vwk3OQxWgWDPlo2?=
 =?us-ascii?Q?O1Fo/Sg04HfQ16snkrjk4cJhOKAARN+1Aq5nSaZ5djsl0MXrIEbwS0sMnJRU?=
 =?us-ascii?Q?VIRiR4InXcU3+zWDs5ZSB+K9w3HEij6DSZ50BeHeKf02r0xCotazBEcAe5i7?=
 =?us-ascii?Q?03iokH6xm5GpGqEaehbuUZ5Hi9MGSu6tsrLojax01fGzx3HpiBk5JBf397nM?=
 =?us-ascii?Q?1PYdqSqukOa5fo70BNtB8ACQUPQxUJiCN8oGMg/OnXoAomGtUHoNhtMJvoDk?=
 =?us-ascii?Q?4N4OVvJyzJk3I2TYLlX/IG87QtrfZacRgIHQ5q8Cy26C4nQM0aENgvA5TMVJ?=
 =?us-ascii?Q?Tp3EkEmGuNS0PJpIV4Ep8z//3Pgz0duWe63a3fFFYFargnincgPhdiilCrLr?=
 =?us-ascii?Q?raFMeJ9eNiL7M1nxMI2Fc8yfB+iNWYu473X0pDhCZs3YOBJ5whoI0rjywcA/?=
 =?us-ascii?Q?zJkHKOdMC7xCWRFVogK5QiCO8AntlSJQg/oF/uCnNI9EAWUY792ER6SlE54K?=
 =?us-ascii?Q?QMAMviQI0sSF5R6h4rc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2949fb-d603-434a-a8d1-08dd721afc24
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 19:17:18.3157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ujhsBU/etdzwFVZEi7bD0ypOR1tjXpMS8e6447glwJObUlsE98Yl2vUZ06HDBQ4IzIVw4Hg2lxIdVAZpHzIFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10345

On Wed, Apr 02, 2025 at 09:07:07AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Add a maintainer for the GOcontroll Moduline series of controllers.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b3864a9852f9fca2be48987d383c0671e668336..7d4fbfdaaac1776fc7c4a569f7ab667f0a485eab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10043,6 +10043,12 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	drivers/media/usb/go7007/
>
> +GOCONTROLL MODULINE CONTROLLERS
> +M:	Maud Spierings <maudspierings@gocontroll.com>
> +L:	devicetree@vger.kernel.org
> +S:	Maintained

this one sill need
 L: imx@lists.linux.dev

Frank

> +F:	arch/arm64/boot/dts/freescale/*moduline*.dts*
> +
>  GOCONTROLL MODULINE MODULE SLOT
>  M:	Maud Spierings <maudspierings@gocontroll.com>
>  S:	Maintained
>
> --
> 2.49.0
>
>
