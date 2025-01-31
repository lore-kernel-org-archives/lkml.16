Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F61AAC4;
	Fri, 31 Jan 2025 16:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738339601; cv=fail; b=GlB5flS0qc96kQu5Lp5DfHdtKe96niy625OB72iONxBFyihG23fbnMOZJFErckhuV5GhRj/XaFFwqDU2X8VvjeFUrx2vrdo79GEbmTFxL4ULTsjIK6r0k9LsmXUDvWSRAYz4LquxF79uOP9z4XT5Y3Bv0OR0hLho+b1Wkh+QLTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738339601; c=relaxed/simple;
	bh=5eVv5c1GR+RyGXOG50xLd5tZKGWv9/0OkJA/YJeQXGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QXNkdF2cTFJN5Z9XcrdIjaiIWVMk2ekop6wE08IRKcJ9+YNjEBP96Uc8NeUliFqV0TSIkuiIY/Js/jkd4dVok7ypmBpHUzE39IsgmngC1i5e2VzdYpwzKfwNlD31YarkZlWuePoM+9nbKuUqBKc42QruDtUDeIbXPla1CFPTr94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Idm1RD9g reason="signature verification failed"; arc=fail smtp.client-ip=40.107.22.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Idm1RD9g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLRLPH5V0mympMKBOfzaO1p3qj6MAFLwiXVMtyS9P8Qy1tgaQszgUhfEjbX1MP7fnnhpeQPEBkDbQBHZSPXUCgpbiPuei0XcmSGjhCe+/wYC52qQ0IcKFBngGIZWSWpXz5pIhslodagptaMqf7SKpswrqvTNRFPZnGRfahReC622pGA1emArirG+NhmstpbkKG6ilyjEi1id4yLXefxEwMLTBvsqrYIN+oHu3VNrDb84AgP1AAfth3EL3ddd4oSj6X1O9JPWANW24AmJkmvIjqMnwtFQFtslzG2qu7c7Smv9x7pwH83RnSHc7pB/PYVv1fijQVZOtpuNjHw4qm9e7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7werP66Cm30Nvm+QtIs8+tIDPRibc1bLo8Ej3gztt8o=;
 b=Zz1zAkkguTBwfNEuA8XrFd2y0SJ/t9KUE7JZJ6nKMG69+4VMKbIE8Fgrq21Q2bBhYEhIhV4TeljsLqmqGV/KSNeRg2tVSZiqq0ib+VUhuyeyGR9vIcXZUUylK6s+Ryt9SuJT2441YK4zREkmGYL4bK62OncBBnv/qw2MCaPaQbbxgazvj4iCgvJemMvFVCajOkKxoYEwMqEWc9zwrj/dMgtpe5AEw6LRkVOLBiCgc3QYQuDZNiuPAXEnIz/ypQU6IPbEKxzcaomtZWF0sv5MPaGUowT0863dt4vuLGVvJFLVOTQjhGOGqs1Ltjf3SL6NpKxArH77A6JYO4p6dQh6hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7werP66Cm30Nvm+QtIs8+tIDPRibc1bLo8Ej3gztt8o=;
 b=Idm1RD9gGQOtJxmdlWLOeyyaTbJynI7KbhmZNqciXkSPfwyepcAYJViUtVPCjPErh3ClATDj5x2f8Z7nFo4TbbRQVSjDLVj22UNCdSVYr4081H9x5QLNJlmYNrcIZCE4ygTx/ttxLaIrQL50XX0BeDFjdk2w5BvapfZK+6DOXYD60TmsIlXrYujwndZOCfQ3TYY4/s3wHyz+bXCqS5eQWm8pGvMbvOlgDDJViMK1uJcUYHE2ME3TwZEqpXvfNE9dCgVNZRwXIEwDB5rDidLjhqZ30nM3R/V81B2JE9GMPw3cwgxxLoNoqO9WwlV0FiZWz2+9cWunBBPX8Wev7nrbcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:06:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 16:06:32 +0000
Date: Fri, 31 Jan 2025 11:06:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] nvmem: imx-ocotp: Support accessing controller for
 i.MX8M Nano
Message-ID: <Z5z0/382k8MkcZpP@lizhi-Precision-Tower-5810>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
 <20250130130101.1040824-4-alexander.stein@ew.tq-group.com>
 <Z5ur+NF9UlXJSWtL@lizhi-Precision-Tower-5810>
 <4961006.GXAFRqVoOG@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4961006.GXAFRqVoOG@steina-w>
X-ClientProxiedBy: BYAPR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:a03:54::43) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 4078d3d4-bff0-495d-0f5f-08dd42113ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ITawefC7V1uFffe3IGnF0iILWJ0kTiHOZ3a/B02RnM2n8blBpLFmQ21RJC?=
 =?iso-8859-1?Q?gbCAD+CXIn0hV4r7oZ7bDdRKBZD2h0G9azXI143SL/VwUpjSrunnLFTbUl?=
 =?iso-8859-1?Q?a5nMu+4l0vCGQ7uvu10i+cp6LdFaJaM3KqAtSwdCWxhu1cIoTOSd7BmzHp?=
 =?iso-8859-1?Q?0zZaMOHq8Ex0mnzWz5u7dYKMG4eG0mrB4wgCPU3uhFKqqIOoMIbdz3NTPL?=
 =?iso-8859-1?Q?aqu1y0OEXUHI4UD4A8VrQxjR4XPNi3e696sHNIQlYYxbDrdTF64EP6vVNW?=
 =?iso-8859-1?Q?v5QXPoKz7RKJbXpD3qHaHw98Kq+w8TesT1euCM3GO2qNTfZ8jdsf/LDxme?=
 =?iso-8859-1?Q?Ci1If92QkSb9yZARSmf/YhDq9LgW8+Gj7S8hQ1uoRGwdH8L1QBv2EV7QA/?=
 =?iso-8859-1?Q?aqSDrQRdb9rtrYvBCXbqS6+/Uc3qbXnoKwfDVnWdOmSaEH5g/1xea3Rzjk?=
 =?iso-8859-1?Q?vJlXSVNa7LTU46fbdpeq/TQJTF++8/keIa+Hw0W8XavAgUSc5d/Zs3v75w?=
 =?iso-8859-1?Q?agKAXz8DuaulxWUkmLhkFm4MYZcfVaGYY/ngcwv9ITJ7iMQGdTMAPMiJzV?=
 =?iso-8859-1?Q?qkwtopau0pqRzeT4vKG8DAFlF2MRv0Z5KcbbFxX+on1HFEU2NwwpSiHo9M?=
 =?iso-8859-1?Q?m04IP80x5wuTfxWbBVoUdB80IiB4HWBVC6C5Aihacaqc7voY8eWXOx7D19?=
 =?iso-8859-1?Q?zDrp5vmqXeSzB+frcNwz1Yvwh1bDJ8xgt6m1ya3hSRZiOAJeZ6nwihw+i7?=
 =?iso-8859-1?Q?dmr+SyesTVqjPHKJcwF4Ac1c3XKXP6a6KbMii4HPNg20VPVL3AGJVzyweK?=
 =?iso-8859-1?Q?v3cYyBb/E7xekm9e8nIrBwKxwCnC3CaUswStFdrlXeZKm1h43kR75gFq/C?=
 =?iso-8859-1?Q?mzR6vQ8LnB9Lih5G7KwTGQYbDoxEnNWTrlYJehB5uOeyAQHTRxPW3tbAPn?=
 =?iso-8859-1?Q?wk8Z/HByGTwxeHShlhgWrQ45WvYhCaEDlTZ+XInNMMFJehBNkPunyzDbQC?=
 =?iso-8859-1?Q?/qq/Vq+yQmfE4kWBfBgI+JzmG7ttTdAa+9FpFqUSA2MjLLBhD7H8jC+1Bp?=
 =?iso-8859-1?Q?9U+VRGHA3uZw+0BiHn4i0tfEYEQZTJ4wFIFYAzkIlcpV1nzJAnQ91qF8fa?=
 =?iso-8859-1?Q?xhJ5RmesEWKvu6fNmatJoPYik57d3QZMjeqM3GgSKJYjbEcPM5BDSYqIHQ?=
 =?iso-8859-1?Q?02gbFUThHOvp1THSVoZ8lWVlPp3dbw4jzyRXBJ5mWHRWVhe+CEL7SYdH2+?=
 =?iso-8859-1?Q?0+w5bq86JS8q2qHTohf64+szdGxV680TudwjSwETsQoevxeJcWWX/5E9TH?=
 =?iso-8859-1?Q?unBR5HobDg6O7EzxWwYg/QErDOR3i0kGIdw7RfLRgiqmw306BHTVfU6j2s?=
 =?iso-8859-1?Q?feF/3czLh4IIjGxFUdL10PWWAmG9lk/B3Ksgl8kwY1hbCO9u6m8E9fooDN?=
 =?iso-8859-1?Q?eu5v5oIHuYTwfTfZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?296VZmDImAn4q0x3DejZQ4zAiBH4brriWfoYK16fg/bBnLii7Lqh2eV1a2?=
 =?iso-8859-1?Q?pIRO3zpRBwbCr7qi3+7/GmXYySiLDBs/NGwE0CgPHU9X98H8LKy6FoYdWQ?=
 =?iso-8859-1?Q?x6vwLlc+Nm38FKD0M0OXtBXA3H7alRFcqMP81V16+j2abEajpZraIRgV4R?=
 =?iso-8859-1?Q?X1pliEz22gWnKEKYP+Kus0U9yHAYInsN2a72q1/F5n6hHZfyzWIWEN8i6P?=
 =?iso-8859-1?Q?29F0jGtQdl7V4rSjSya6d6EZZRB/WSVjYv7efMhE+Rimww5pivoXsdc3QA?=
 =?iso-8859-1?Q?JKTTU6iO0jmn4qacUo5MHlOXIKwwGsoIEHeDJtvB2EQIXr371FdPEx6i49?=
 =?iso-8859-1?Q?FZYyRgKEWtgcpwFwfOOIkCINWyUNVG7gnzCf9lyXPQjMh4Ol4k0D58sg3k?=
 =?iso-8859-1?Q?OWJwIN65HP144t6X8lljVdFMPGYNztmFp9rZo3wsysJlBeBQGhORnPvV0W?=
 =?iso-8859-1?Q?EV6Typv/19bzyBh/WYKTXkLR/l2vEm8Cz9FEFZAAL1iwbz/U1jbbSyYzkf?=
 =?iso-8859-1?Q?cJCXU2mFOhh0ugDI3oGr5rWMblTkwUTDo+ZO5QV5sOSSln7JSUaplB/uM+?=
 =?iso-8859-1?Q?/RCuAOe8ShpIWZ0GU98XqRyc9KkbdS8/2I+kif+6wCih23iP6FqoF2DFHf?=
 =?iso-8859-1?Q?xW053UfvJ4/fAK8vl9mqG6ydOnsXJZIKzAbWpSX19N1V8txgpb2L3dN3N1?=
 =?iso-8859-1?Q?J3RfS+x79gtv/DbPEYodJ8pDWJ4doiR6WDjeFzKaH0Z4BCTOU/dL9E94dg?=
 =?iso-8859-1?Q?tAgSuH7NK3OjgChZCBvIBgl48eSfbpaLbqwXGbtHzr/LiD3+aQTCU7CQZy?=
 =?iso-8859-1?Q?31LJ9Gm7htJOhN6VST+bfAzJFDgwIqaw/0n+PgfIvW8ywXvQJhEMej0l1H?=
 =?iso-8859-1?Q?eAx36QsSdjYattn8lu8fj5Ch0jh7S+AGMo+fKyC+Hg/5Mg/J45bf8D1D5r?=
 =?iso-8859-1?Q?CRTR3v1bYKCVtks8wv404bSjz2i8aT+5Vu4lo2sIwOBmX3C2O7XmZNc/To?=
 =?iso-8859-1?Q?MrZtLBxhWi9JMPPetQnwSMwd6vxzBTjByKsIW6Ox+ilECEosat68PN7vlj?=
 =?iso-8859-1?Q?CDwonvKfkGgxzFYyVm2uQoKQBV+Sa0aRgSuToT7vSckRcu2po5qbPe+SM8?=
 =?iso-8859-1?Q?0V7+u8vLvI4tfAhqqm0IfPjY3yktR5n6K4lbnpn9m1dDUB6sKFG2gDq3Ul?=
 =?iso-8859-1?Q?ChsceX0j6u6NdFOszQce/efsgXd+S9uWd14o2E4eimlrOZJePqLvCiGhJZ?=
 =?iso-8859-1?Q?PmlQC7wy50+NIHSWWtOs3RMwFDr3mqSVMaoXBLoD/NbSEwibekXg3cCLSg?=
 =?iso-8859-1?Q?2y9mPLoaQdZM9sP4yYU1VGBdzunVxuyNLG0CeA0vJ48fs4epNWQyTBKjxG?=
 =?iso-8859-1?Q?lg9gPiAcImq6XIUbYIrsBfc+g3VDn5QUMvL/SFWGBgRXiJ9YuR18lJxsgu?=
 =?iso-8859-1?Q?EQKqQQDRE4pa/c8GsjH2pFSwU/J5YYsqrdziWGih8W23DvYmx/2D52C6l/?=
 =?iso-8859-1?Q?lFsdpAffbnI6Ff+fY9XROHiTMyfhB4uLROYs155t/Kv151Z8eRMOogp7Ix?=
 =?iso-8859-1?Q?2hIIO/M/j6K1N3MLKfyCd27kaeitNBlV5DIEKXJ3bIiHdP2pk3a5Lno8wV?=
 =?iso-8859-1?Q?kow5L0oD8NQZI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4078d3d4-bff0-495d-0f5f-08dd42113ae9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:06:32.7798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8k6tLaKFTxxRIEkS5Euofnp2qWrO5csNmWh/n5FKA1DFAZHgVdsWHT9fjlPzF0BsEb8WbH3a1+g747BQxCjlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7280

On Fri, Jan 31, 2025 at 02:54:06PM +0100, Alexander Stein wrote:
> Hi,
>
> Am Donnerstag, 30. Januar 2025, 17:42:32 CET schrieb Frank Li:
> > On Thu, Jan 30, 2025 at 02:01:00PM +0100, Alexander Stein wrote:
> > > i.MX8M OCOTP supports a specific peripheral or function being fused
> > > which means disabled, so
> > >  - Introduce disable_fuse for a list of possible fused peripherals.
> > >  - Iterate all nodes to check accessing permission. If not
> > >    allowed to be accessed, detach the node
> > >
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >  drivers/nvmem/Kconfig     |   3 ++
> > >  drivers/nvmem/imx-ocotp.c | 105 +++++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 107 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > > index 8671b7c974b93..ba5c928cab520 100644
> > > --- a/drivers/nvmem/Kconfig
> > > +++ b/drivers/nvmem/Kconfig
> > > @@ -84,6 +84,9 @@ config NVMEM_IMX_OCOTP
> > >  	  This driver can also be built as a module. If so, the module
> > >  	  will be called nvmem-imx-ocotp.
> > >
> > > +	  If built as modules, any other driver relying on this working
> > > +	  as access controller also needs to be a module as well.
> > > +
> > >  config NVMEM_IMX_OCOTP_ELE
> > >  	tristate "i.MX On-Chip OTP Controller support"
> > >  	depends on ARCH_MXC || COMPILE_TEST
> > > diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
> > > index c5086a16450ac..e3ea026a37d0d 100644
> > > --- a/drivers/nvmem/imx-ocotp.c
> > > +++ b/drivers/nvmem/imx-ocotp.c
> > > @@ -23,6 +23,7 @@
> > >  #include <linux/of.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/slab.h>
> > > +#include <dt-bindings/nvmem/fsl,imx8mn-ocotp.h>
> > >
> > >  #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
> > >  					       * OTP Bank0 Word0
> > > @@ -91,11 +92,20 @@ struct ocotp_ctrl_reg {
> > >  	u32 bm_rel_shadows;
> > >  };
> > >
> > > +#define OCOTP_MAX_NUM_GATE_WORDS 4
> > > +
> > > +struct disable_fuse {
> > > +	u32 fuse_addr;
> > > +	u32 mask;
> > > +};
> > > +
> > >  struct ocotp_params {
> > >  	unsigned int nregs;
> > >  	unsigned int bank_address_words;
> > >  	void (*set_timing)(struct ocotp_priv *priv);
> > >  	struct ocotp_ctrl_reg ctrl;
> > > +	u32 num_disables;
> > > +	struct disable_fuse *disables;
> > >  };
> > >
> > >  static int imx_ocotp_wait_for_busy(struct ocotp_priv *priv, u32 flags)
> > > @@ -552,11 +562,25 @@ static const struct ocotp_params imx8mm_params = {
> > >  	.ctrl = IMX_OCOTP_BM_CTRL_DEFAULT,
> > >  };
> > >
> > > +struct disable_fuse imx8mn_disable_fuse[] = {
> > > +		[IMX8MN_OCOTP_M7_DISABLE]	= { .fuse_addr = 20, .mask = BIT(8) },
> > > +		[IMX8MN_OCOTP_M7_MPU_DISABLE]	= { .fuse_addr = 20, .mask = BIT(9) },
> > > +		[IMX8MN_OCOTP_M7_FPU_DISABLE]	= { .fuse_addr = 20, .mask = BIT(10) },
> > > +		[IMX8MN_OCOTP_USB_OTG1_DISABLE]	= { .fuse_addr = 20, .mask = BIT(11) },
> > > +		[IMX8MN_OCOTP_GPU3D_DISABLE]	= { .fuse_addr = 20, .mask = BIT(24) },
> > > +		[IMX8MN_OCOTP_MIPI_DSI_DISABLE]	= { .fuse_addr = 20, .mask = BIT(28) },
> > > +		[IMX8MN_OCOTP_ENET_DISABLE]	= { .fuse_addr = 20, .mask = BIT(29) },
> > > +		[IMX8MN_OCOTP_MIPI_CSI_DISABLE]	= { .fuse_addr = 20, .mask = BIT(30) },
> > > +		[IMX8MN_OCOTP_ASRC_DISABLE]	= { .fuse_addr = 20, .mask = BIT(31) },
> > > +};
> >
> > Can we direct define IMX8MN_OCOTP_M7_DISABLE as BIT(8), so avoid this
> > map data?
>
> This would be possible for imx8mn, but not for imx8mp which uses
> multiples fuses for disables. This is an excerpt from imx8mp WIP
> > struct disable_fuse imx8mp_disable_fuse[] = {
> > 	[IMX8MP_OCOTP_CAN_DISABLE]		= { .fuse_addr = 16, .mask = BIT(28) },
> > 	[IMX8MP_OCOTP_CAN_FD_DISABLE]		= { .fuse_addr = 16, .mask = BIT(29) },
> > 	[IMX8MP_OCOTP_VPU_VC8000E_DISABLE]	= { .fuse_addr = 16, .mask = BIT(30) },
> > 	[IMX8MP_OCOTP_IMG_ISP1_DISABLE]		= { .fuse_addr = 20, .mask = BIT(0) },
> > 	[IMX8MP_OCOTP_IMG_ISP2_DISABLE]		= { .fuse_addr = 20, .mask = BIT(1) },
> > 	[IMX8MP_OCOTP_IMG_DEWARP_DISABLE]	= { .fuse_addr = 20, .mask = BIT(2) },
> > };
>
> Notice the fuse_addr of 16 and 20.

Yes, I am not sure if it good idea to encode fuse_addr to IMX8MP_OCOTP_CAN_DISABLE

like

#define IMX8MP_OCOTP_CAN_DISABLE  16 << 16 | BIT(28)

So dt-bindings/nvmem/fsl,imx8mn-ocotp.h can be moved to dts directory.

Frank

>
> > > +
> > >  static const struct ocotp_params imx8mn_params = {
> > >  	.nregs = 256,
> > >  	.bank_address_words = 0,
> > >  	.set_timing = imx_ocotp_set_imx6_timing,
> > >  	.ctrl = IMX_OCOTP_BM_CTRL_DEFAULT,
> > > +	.num_disables = ARRAY_SIZE(imx8mn_disable_fuse),
> > > +	.disables = imx8mn_disable_fuse,
> > >  };
> > >
> > >  static const struct ocotp_params imx8mp_params = {
> > > @@ -589,6 +613,81 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
> > >  	cell->read_post_process = imx_ocotp_cell_pp;
> > >  }
> > >
> > > +static int imx_ocotp_check_access(struct ocotp_priv *priv, u32 id)
> > > +{
> > > +	u32 addr, mask, ret, val;
> > > +
> > > +	if (id >= priv->params->num_disables) {
> > > +		dev_err(priv->dev, "Index %d too large\n", id);
> > > +		return -EACCES;
> > > +	}
> > > +
> > > +	addr = priv->params->disables[id].fuse_addr;
> > > +	mask = priv->params->disables[id].mask;
> > > +
> > > +	ret = imx_ocotp_read(priv, addr, &val, sizeof(val));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	dev_dbg(priv->dev, "id:%d addr:%#x mask:0x%08x\n", id, addr, mask);
> > > +	/* true means disabled */
> > > +	if (val & mask)
> > > +		return -EACCES;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int imx_ocotp_grant_access(struct ocotp_priv *priv, struct device_node *parent)
> > > +{
> > > +	struct device *dev = priv->dev;
> > > +
> > > +	for_each_available_child_of_node_scoped(parent, child) {
> > > +		struct of_phandle_args args;
> > > +		u32 id, idx = 0;
> > > +
> > > +		while (!of_parse_phandle_with_args(child, "access-controllers",
> > > +						   "#access-controller-cells",
> > > +						   idx++, &args)) {
> > > +			of_node_put(args.np);
> > > +			if (args.np != dev->of_node)
> > > +				continue;
> > > +
> > > +			/* Only support one cell */
> > > +			if (args.args_count != 1) {
> > > +				dev_err(dev, "wrong args count\n");
> > > +				continue;
> > > +			}
> > > +
> > > +			id = args.args[0];
> > > +
> > > +			dev_dbg(dev, "Checking node: %pOF disable ID: %d\n", child, id);
> > > +
> > > +			if (imx_ocotp_check_access(priv, id)) {
> > > +				of_detach_node(child);
> > > +				dev_info(dev, "%pOF: disabled by fuse, device driver will not be probed\n",
> > > +					 child);
> > > +			}
> > > +		}
> > > +
> > > +		imx_ocotp_grant_access(priv, child);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> >
> > Can we have one method to share above code logic to avoid copy-paste to
> > every ocotp driver? Anyway, we can improve that later.
>
> I need to check with STM32 implementation. The imx-ocotp-ele might use the
> same function as here.
>
> Best regards,
> Alexander
>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> >
> > > +
> > > +static int imx_ocotp_access_control(struct ocotp_priv *priv)
> > > +{
> > > +	struct device_node *root __free(device_node) = of_find_node_by_path("/");
> > > +
> > > +	if (!priv->params->disables)
> > > +		return 0;
> > > +
> > > +	if (WARN_ON(!root))
> > > +		return -EINVAL;
> > > +
> > > +	return imx_ocotp_grant_access(priv, root);
> > > +}
> > > +
> > >  static int imx_ocotp_probe(struct platform_device *pdev)
> > >  {
> > >  	struct device *dev = &pdev->dev;
> > > @@ -622,9 +721,13 @@ static int imx_ocotp_probe(struct platform_device *pdev)
> > >  	imx_ocotp_clr_err_if_set(priv);
> > >  	clk_disable_unprepare(priv->clk);
> > >
> > > +	platform_set_drvdata(pdev, priv);
> > > +
> > >  	nvmem = devm_nvmem_register(dev, &imx_ocotp_nvmem_config);
> > > +	if (IS_ERR(nvmem))
> > > +		return PTR_ERR(nvmem);
> > >
> > > -	return PTR_ERR_OR_ZERO(nvmem);
> > > +	return imx_ocotp_access_control(priv);
> > >  }
> > >
> > >  static struct platform_driver imx_ocotp_driver = {
> > > --
> > > 2.34.1
> > >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
