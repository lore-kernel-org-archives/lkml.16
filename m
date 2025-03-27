Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2070.outbound.protection.outlook.com [40.107.241.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90531537C6;
	Thu, 27 Mar 2025 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091434; cv=fail; b=HwhzXKR3ubylz2iGdJqu8YdaLiPWtQl3JvHd0wKK1ahOqt0D9+tkiltLru2aG4ChR0X0kwKqmmnt4gfux1eMpRgil0Qn5pTZaPVpK8d6Vac+GtUeCApHF2mzCWiigBG1lJ5sDQQaBxV3h7o7erfggTFmvnT5Ix0SGPhCxLdCzPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091434; c=relaxed/simple;
	bh=iq0laFA8TdSenxUrHLWRWDfklkc0Kmj7DVG4y1opho0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ztf0jUvviibY1XsJ4YTPHkcCFisUNaf7TxQlis5SL4sMyiTb3OjInMCoQh3xIgkMj4rtQbXvQOn8YY4+dEdEPS8/BcI8wb4ucRsr+13KSULtcu9DDKARWrEgjYdvwdTxp9geQl2YJeKw5wOV6a84gbsI8usF1+uVVWLCo1xKB1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aqG82LzK; arc=fail smtp.client-ip=40.107.241.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aqG82LzK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGz2gSBevs3BbvvU3+sGiSL5S6mJUSEKZbaa4k6fWVViJ3F/dv23kb1RfET+iIuCkvVMM3KZjoGsCoF0a4YIv8602Yw0ezxJ1K5mXLDDmQH+e4RlaYhDulryiJ9GhPW+lx4vOQ3+IvlFaexhPe37CfU2frIaw+cEtoOPxFQJjZSEAytiTgpB36eZYvnQPO885DCkvk5NMGSOwQoXun6HI0PSQ0pfVO9+gxRCrgcGWv3QnCLByJTGqtD3qpRMw+I+SRt4ymBdvqo94mdtpFhlJfcxr6q44/2rwsA8EOZnuLQY2+RiH/Pob0Z/HwOb6wSSwp3CcpLStWf43LKManfKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94RHpLvmTIYkl/vrReJA06XVW4I0/8WZT5uktO/C2rk=;
 b=ycEm0WcngG11JYHkX94A+iqm2Mk1G0mRgVNgXEsyYqYdMe7D/8vX5Ci6ouOxHM5uTh7GqUuFrcSezUXc/vNxAgjmYrD1Aqdj1bB2Cd4KM5jSZOwtUnmzITqHFNTgzRXce9ntmvBxXIZkkOcqlL1b/kMuPZy7KYshNfIqRKlLPHfWiPuUOl0OBPOY6Og+bBV25eqAuLiAJxrxlpyhNgOXTLHcJp+r0pYDAHe5aNSL4tc83//NuIQ9nyJnLTj2N7Jm9lTgg+levRjpLucpRmG8NAF6MjZWKEu/33ioIl8kCjhcucMGHf/eKSK35qEdtK5/9hJUOZlBlP28lMvqBacw2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94RHpLvmTIYkl/vrReJA06XVW4I0/8WZT5uktO/C2rk=;
 b=aqG82LzKtXZbgwtFYg+Ee9gCsOHtc3Tg0iMsvMc9BklHKN8MRaQzQ9UmMxmLe2dw77f7GZcF+tm0bvBw2HR2qGK+lDca0VzuTAN4nrHR8MeFZow+MXfCGGDiP+aRF29S/DGi/nrCWsf1VpbX2WQz4P3ryqhL9rv/fKa2k4W9YjLW1ZTxn1RNtwpvOcCaEjc3wVOZ6263MI2Fei9McUkV1AFhaKTLlu2YlndgW0YMOvFO2WWWYpwcwSXqjL76h3k97cujiTwa3TIs00V/MOC94sLS2bxgptmKexbaPZVvtViPt8O4kVqFcTdx5c3w7qRT6SfWcUjKETXTycYn3cm+LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9241.eurprd04.prod.outlook.com (2603:10a6:20b:4e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:03:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 16:03:49 +0000
Date: Thu, 27 Mar 2025 12:03:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM moduley
Message-ID: <Z+V24Ke0PD1xnNV4@lizhi-Precision-Tower-5810>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
 <20250327-initial_display-v3-3-4e89ea1676ab@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-initial_display-v3-3-4e89ea1676ab@gocontroll.com>
X-ClientProxiedBy: PR1P264CA0179.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:344::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9241:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5c52aa-6f9a-416e-4a57-08dd6d48f667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NI+fhm63gS7GAUvD5pcDH5S5UYof59Hf9mare1nFv49QU1Dyhim5lFpm8LbV?=
 =?us-ascii?Q?1DxOZ0Wii4ijxReXFOQEBu5qGSxN7TCQaoEqCnYjrqGtDAULjCbJgYhDBA62?=
 =?us-ascii?Q?wfbdzEaLyAJ5CahKBbDZyf/i/g6o1Da7BY6T+9sUH6fbOY3X/i8sQIxcMF29?=
 =?us-ascii?Q?B0Fmg086kcCuC4eOlkQ4d9TIMe8RaaYOsPfiHRC6qUydkdxp4reoIJbyyQYo?=
 =?us-ascii?Q?/zLPsrL85qOOAFzQNW/4NBIvB+R/5zkbPx8nJV1XKKT4AvmdBxAJ5ekgG7Tn?=
 =?us-ascii?Q?nsER3nSDYerjluDeP2zPKWk9d4wtSOpBncXD20ivbFZGFcdw29BWEnBq8j9t?=
 =?us-ascii?Q?UEZzxnVB52LaWY/Ro1ijbb/6JeLSvH0l1hjX5H2oudhqmzKAlAej6TtPg0fA?=
 =?us-ascii?Q?urQ31iw+ZTlxYa/Q98B4WPHurtdSWuVQ1zmDn7v4ct3ehx7+BtNE/EXmtKow?=
 =?us-ascii?Q?AzAIrPMJwKUw4O/u97TnACL0Xtdp8NrBrostUpivL6wgZHRxsKJ7xXmVmThX?=
 =?us-ascii?Q?ZppJwfTWi8LUCh151LgDSwGAJ8GWpdcqBnirDuvt216a+2W/M4487Bz18dCI?=
 =?us-ascii?Q?NP6WZuoyTcSglUNk0SQnyTDC+tcJBmDHqWT20UOHkopr3T+/KqoLEHY2OeOY?=
 =?us-ascii?Q?6+u/7LjrawKmsOtq6L5sKn/4uXuxXqoJFohI3ZojEC0tnYd8rpQr706F//By?=
 =?us-ascii?Q?a8rkL6MRgWfiEHd4FK+cJGGntSQ8K8W2n7odeFWa49EMhG/2SSpRaap7P/UE?=
 =?us-ascii?Q?dkT1R+t32zmh6ORC9U/Aubcb3yI1GUB8JYyGODQRFX+RaooFZAkQ5RtWt51U?=
 =?us-ascii?Q?lIEqmSUPzKi3XIg4BtzA61WKXOb4LiqtZNZz8v8rfgJC33u6Q9THMUztBYZ2?=
 =?us-ascii?Q?elvTl/HODGZyOpO30B3QnZEHnW1q7r+xSCbnBRM+LVih3hJSpXhgTaTNkkTU?=
 =?us-ascii?Q?Tb8aukmOzrhpWej9rKjteej0EHyCwLGdT/BN0puZClB1Ce8noA0O2gLW43hK?=
 =?us-ascii?Q?c3RpQt1R6Nd8kHdVAjPTACy8y17tNsnPeZQBPcbC/0jLL9BN3JnuPG+l2nwS?=
 =?us-ascii?Q?2nVaxoL8RrhqcWDAa6CmsGG2lIQqoqGyPQZ/b77RoJVphN0Z9sKV6QI5P+FF?=
 =?us-ascii?Q?3djAEdhApsZw/ZnMCLwUBKgNMutj/iBxJCjd0/saVKqb1CJiNx5GRafb7mD0?=
 =?us-ascii?Q?Z6tW8VXCvQrF6tR2xKc9FI4lhJWYYoLVUf+POWb/uwiAgQ3Qvcjtrx50JlUk?=
 =?us-ascii?Q?K4UaBYcRQmAtbYd+M9I9BgC1p/52HJYZ38GxSjGyP8AQz0J+GQPo/GYXWNxU?=
 =?us-ascii?Q?h6OF09/klUsbslcKJwzk0dVEDj4UDCO5elHlcs7ul7sZRcYKM7zRIDR/S4PM?=
 =?us-ascii?Q?nb9cgzi2BNmyqBxF8PHyY3wE8hIi7g/YdD1QQyPlk7EAcIXE/rSblFKV4Tfm?=
 =?us-ascii?Q?PZYRCNnMkbOkY+0jY6Nj42apgpt6lCw2rS6EqRZo5YZihmzlb1/MTQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2LaSXYSixvgIWA5HaA5ppqD/cKlnXCBWKqu+vJELw+IGuxJt2PVb+g0+E26/?=
 =?us-ascii?Q?k1cq9gHkPyTTrh7PU9inGODMeYqPsATpijezj8Q4v3S/bhB0T8ZmptkLynjc?=
 =?us-ascii?Q?ECcT59HK2ckyPzFgeU3ZcJZINewmbzpz4+DJW05OpChlSwJJJQOv44HA3Zku?=
 =?us-ascii?Q?8R2DB8UyddgcplB5wF8GMpHMf+iDXNS2zdeQfJM/Tyr4DJVpVrW3OC3eL2iB?=
 =?us-ascii?Q?xb0uj4pYkF+2jBnZFU51jThj+MByiNf6JvxLBG2SVdMn5vKYhh2RaHu3MPXB?=
 =?us-ascii?Q?PSBmqsH+HFh5jQUz1L3nriXK2JRCndBcM3pK3Y9dKmAdAEvizQNeJThRS8Zh?=
 =?us-ascii?Q?pBHlswM+JlY7Bj5Ek+6fJV1sLRgFP/UQzgCVxjim6wiAZVpkilU1ihZL801+?=
 =?us-ascii?Q?ojBXnLFTbjdsipVQtheOJB3Bv//gn5Z1Ed4djwfoD5nwjNd1FL17RtYRMP5m?=
 =?us-ascii?Q?VpmrCHKHbqAecK6sZjpID6/W1kTmV4pd0gTFUv3DPwAGkmrHIeo1sL0Lb7j/?=
 =?us-ascii?Q?go3B/54VDR/zfi19u5tbj3leuhFzncXL72CR3HBdQi4QVpnSb/cmOGxHl0zD?=
 =?us-ascii?Q?M2eTntnq7AfDCPWvOFAZYp99BcHz7lDCVaZ+Ulr9MpXP1f4AEOmIWuiGdzhI?=
 =?us-ascii?Q?JP1tWmkIok1xwxYC+j28qAf/2ABseRavBdbvEbJxc6+e4O+pXfyxeHWRPilk?=
 =?us-ascii?Q?1HKtfHXmUHo5gZwxXBuuGTfcxaEBqFViD/B/EKRvxqACM/3B5O0pHGrf37pM?=
 =?us-ascii?Q?fJbbiHRKUNqWSRgoibQjEJEY/dcJg4/m9YSTQBbl9iO5I5VxnSlliT8yBCL5?=
 =?us-ascii?Q?PX+RmhgT817+VMbzKx0ml963tP5+BKuJwPAJBSB54sNZGr6324K6MZwLH9e+?=
 =?us-ascii?Q?s3LvPT+4nXMG2NbUjt2XIz9xMbZeDrnFEXhz55Z7ZAGtWYnM1g9ISyzpeV9K?=
 =?us-ascii?Q?pneWxk3pRZnys7RZKS5y5srdgMcILTUX4kDMjXp3G76/UuPBx5+5KxBK9ISH?=
 =?us-ascii?Q?tSZKwYJi8bWedHU3OYTFmD+YLRR2g9tXBb0N5iHaXaTywclR3YtGT3GpjXew?=
 =?us-ascii?Q?aZvIMbX1lRenzMrSYkE8m7e74fXyba/nwd6/huCtpXqXgLSv6qHQ/Nu6xGnD?=
 =?us-ascii?Q?V91kc6YAnGicblHtz3pSxHFW62c1ce03Qt+TZs5mBuvS8X6trjBUpXpAmQIq?=
 =?us-ascii?Q?0oO4OE1eyBkJrxu45+ylYzu4JQYfQmtW+7PvNKOLHOcfnO8Dx5M64UGdO5N8?=
 =?us-ascii?Q?TMnQop8KTvgvGW8P2SfEFNNnSVrAEwSKaUwmbu9DU8t2N7bQrMBpC0OuIJIZ?=
 =?us-ascii?Q?KEZMGcYMmvF1ZjIFyzAlgPI8cr2x7QslsrBFDT1lVQHNxLulwZexQpJsSqqF?=
 =?us-ascii?Q?Xwf2oEmhpNK68YKj3pNnIt5zlTpjHVKhP6JZuSo5vgGR61RsHtPN6Qz2E8SC?=
 =?us-ascii?Q?KsOsTFW9N6+mLJKzAsUTTXFjvEfyKzfZo6kKP8/ssrInmAd14xg7MTc7d3y2?=
 =?us-ascii?Q?0LE05ZBehYTMcPwO6NqmAyP7J8WvCO5VKn4ULntmiWmq/Kh5nt4AOJO8RTA8?=
 =?us-ascii?Q?RZJhwDhQhSmgubG4aWExOUUJIt2DNRfCrjYqTOmR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5c52aa-6f9a-416e-4a57-08dd6d48f667
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:03:49.8244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRt8ex7qYqaBwFgawmPOkcZ7e6sxhQY1fade+ZRUFCEj+jrxnqga64615pQPppNBU1Bk6er5Fdj0KoRnJtWMMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9241

On Thu, Mar 27, 2025 at 04:52:38PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
> module bindings.
>
> This support is not officially done by Ka-Ro electronics, if they at
> some point will supporting mainline, this should be changed to them.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 322ee00547f6e494a96d2495092f72148da22bd0..f8ad2c1023016d7f72cccff880e3753d71d635b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12752,6 +12752,12 @@ S:	Maintained
>  F:	Documentation/hwmon/k8temp.rst
>  F:	drivers/hwmon/k8temp.c
>
> +KA-RO TX8P COM MODULE
> +M:	Maud Spierings <maudspierings@gocontroll.com>
> +L:	devicetree@vger.kernel.org

Need
+L: imx@lists.linux.dev

> +S:	Maintained
> +F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> +
>  KASAN
>  M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
>  R:	Alexander Potapenko <glider@google.com>
>
> --
> 2.49.0
>
>
