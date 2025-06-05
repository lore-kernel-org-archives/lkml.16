Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012052.outbound.protection.outlook.com [52.101.71.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45F812B17C;
	Thu,  5 Jun 2025 01:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087811; cv=fail; b=GVUbUKyt7efNQ6UN5dhTLQZ3RQzzE8Cp5TV//UUZdiWfyV5+fQXuub2sG/IgnMW3KfgQkr2psokSQv1gW+8BAZmBEaISnAdtGro5eWH1yLXbcvuZ5Jf9DL4zL7zHAAobrYndom6fQRU+BS2Q6mQkx1/ipK1Oc9jL5RCVJMYUtIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087811; c=relaxed/simple;
	bh=j8p0KreLPdt4ZnbTuwj2IR9wKp0CSP/jN8Zf1wIjsGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jkRtOBdb31i1h0p4fOa/I/MZgFCdgpw9vU2Ra23CuKiR2rzjrhK7xMv4mN2LV2Xg/xnf1wPrYeFH5Q17AsVm6avMPZBzUH3yTT/e85+6H8rcm4eFkiAp7FnBXm2fXx419bbmIwPp43KpDFsv6bqgp6//nCvWgv3bRDYla41sEKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SxUfd/aM; arc=fail smtp.client-ip=52.101.71.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SxUfd/aM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xI/eZk9FTqV9csrcbmaoAuE5bRruz17zDG1YS/9RLxlQqDRSuOzCxpjOr+KKVJuT7xBvlIsYzd86qlmpeHFOKLl3ugA4QQ7zl/GQKlZ7eZOEYmc//B7+Kb/rBe2xvaFWH8rdS86N/pgR5nzc1G/lx95DlR9Mt+qM/nflOP/cNVm3h2id2ugPmjtk0/nPKeBu4ZQ2HldJ5Mnp5uO+DXs3oRq4D2lqxCTpSeIWRAenzklHz8sbYUO25BfBCaNPwdzRlPEofRm8JfqwnEju94Vinm+9ZlZUlFw53Fh+xmsVkwbGoBPiOg6s9wfcdSEyrxJZbzYVpHxflfbvMIeDMjqQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8p0KreLPdt4ZnbTuwj2IR9wKp0CSP/jN8Zf1wIjsGU=;
 b=yCxUStwau5GSvNmF85EWBNtXRBFwfYA69+rGbvYbl43jUvPtcYmEIaemidznvJmd/v6MoYDHZJKo8Qgzi+6FluNORWP2PS/HHy82XUGLV/F4IZzRwvluQCD+YnqE6bd5I/ZRcGVeaxJN+Yf2DtHDuqg054jY6q0FlakF/LMlA0crloBaep/tjXDNoyDVQUjIRpn1OT53uQquUk6m1iwgBiIdH5Lyl+W/hKoxwEOHE9b0t5Y37fIOKgoUjZ34AoIHGw9b0npRFvQK4IF0na772aJAw1fixnFMCGiC18LMlYVScFos+9nTvdjzSfutGMzddA7Zl1/WJaIP5ui89+BBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8p0KreLPdt4ZnbTuwj2IR9wKp0CSP/jN8Zf1wIjsGU=;
 b=SxUfd/aMaJxU+bwPfLHX1mOt6UuOEmuoNGhYsi8XLf19Wi+lf2c7zYk39Lle17R7+3/3qwEG/1tNPBeuECydhbdVwaStQe93JeC4sr+qi4WVJBdc780BTlwuZOLH4Ez3WRUfpFHhvL45F70HwPokARyZ/4qjERMnKOsDmjx5ym1SHfWpdj8SjnINqhssF2srPFkuhTRCOHTFudE5k5adzvvshdTOHGJDv8VBMDR6DRBfBhYwtDOptb2S8E7H5pbbtmCtjhB29Bysd/vtBKBc2ahUZeN1U6Q7nunVSwuxW9cEMyVPctBStii0raRW+P6tEvgKsiJpk+aiKNYGsCv1mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10304.eurprd04.prod.outlook.com (2603:10a6:150:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 01:43:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 01:43:25 +0000
Date: Thu, 5 Jun 2025 10:53:25 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: freescale: imx93-phyboard-nash: Move ADC
 vref to SoM
Message-ID: <20250605025325.GF29462@nxa18884-linux>
References: <20250602125207.2265222-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602125207.2265222-1-primoz.fiser@norik.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10304:EE_
X-MS-Office365-Filtering-Correlation-Id: 8feee640-5f08-448f-ce50-08dda3d25d15
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p6l2Q9UFAm7uLX228od0MA9lXyRxfsakSwWS7xwVZijuD6YrOTgFmlaDg8Ip?=
 =?us-ascii?Q?GGU5shrOgRDBnTc26hK+qnVJh/K0QertsfWO9uxlEtpPoY0YeVmEe+Sid4B/?=
 =?us-ascii?Q?R+Okabe7mr6cNhpKdBm8O2G3IXvBda+/dZD1Q9wQZ/vWpx+z1SncyhKEWVqG?=
 =?us-ascii?Q?2erG1l2j4B+dGbv+kYLoraU5EKHX/Ex8l11WzAlSU/4aDyAItHomIXNqLjmo?=
 =?us-ascii?Q?7jMyKW3CUS/DKm/GcNxx6mg0qvQV0k6VxQ39zVcLuHjlrE3uKTSXyQtAc1BA?=
 =?us-ascii?Q?UbWdiR+COuKY1UnRrNM9J0WwGtMMjpd0GOZtQjead6XHlDKnR3++WDZEiIAf?=
 =?us-ascii?Q?aSqTXhvbMthjSF5bnwQlcWAhkh8UQckWVio3l755cntZi6cK1BFaUYxp5MzO?=
 =?us-ascii?Q?fSiMFYchfSHngd8EYs8WUzTXobllw6smVCGtRgsfF4jZzcb/sVj7C+NRrH9e?=
 =?us-ascii?Q?r3vy4Fg5wP1b5DGflIcIcxviCeAPO9EYILWfOUM4xIVvNdoirwqR1HEuThDy?=
 =?us-ascii?Q?N7cHU+3bVit557MeW6oCeO7Z0MW9kNmp7+W0NkEqEjWuttBVCnWqc9MI+gMg?=
 =?us-ascii?Q?f5ZYQirA93EApnNm+wBdjtN9mM3Wxkfhw2cY7hEhSVjWeFNc1prp+3szQ0hw?=
 =?us-ascii?Q?2sEOwOAz1+Gb6ZzOqziZR3rNv0L291eht0rbztEdTnYV9k2jgXDrbXWckBaV?=
 =?us-ascii?Q?ZfNrZT/3C96hcKpqdSwVuNkXl6hbmqC0L2N/B+NVp2Zf8JjUHTPSrSu9ixBb?=
 =?us-ascii?Q?bT38BNQ2ROyt9VqHQcM8EhHhKVevWG1XPQFlzmDauht7DtbSpKlKwsOqfpeV?=
 =?us-ascii?Q?agPT44wN/+lyaxDxcqQGqAasulyf5G6NaVV9K+fbuPWbkiKEXmuKjebu2GnB?=
 =?us-ascii?Q?fvKhQ6rOwe7LC3KU16eRz3Dvcag1j8FkBBk2YJNxlwb3Duwpr5EOPxpBsQ7p?=
 =?us-ascii?Q?RDAwqfpzOjP4Q1h9YI40bfzauObcJjPSvdphXFusY+s1XICRs1uQ4gNhtaJA?=
 =?us-ascii?Q?shysczJSyXwYrXXHqAlko/BDCZ8jsEo5O2rp7k7W9yyCvdcCnRFIgy/odw2M?=
 =?us-ascii?Q?Lro3ALblEewRQPzd7GelzaCh7be7tCiQmeYHbF0ys3vol5Q3zgkhXjevil7a?=
 =?us-ascii?Q?4MmFCyGjBnWI+CJLs/t0fVAewkItr3Bt9SPWdMbaHjgWQCEwuR3kiwDre9BF?=
 =?us-ascii?Q?3IcvTvCXV181ffXkRO0Z6yUMQV0Av3feRPj5PiPNuE3wTVTwMID0a5Fw3OLI?=
 =?us-ascii?Q?SASCp/38GMeDqMEYgiIk57NYOQCeD8rYu1eD2QHZ4GGdg5Vrw8mmh9cMd5eT?=
 =?us-ascii?Q?Eh7NUbDFA5RC2yYJ94eyZwm201+R7RLIrXz06kFIS+PZT4oLt0032uFV7+Od?=
 =?us-ascii?Q?Suq7WG77q6EQL0a0a5XDFzKXo+XKVIMqhpn8Q62mnPcIcak3n++tiYo8rcHa?=
 =?us-ascii?Q?BPgo0o/Lc2OfDcotUdFP/Dq+DDlRNoDJDLBsbQpp9VCPQuKGccPLhg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qRi45P0TD8ZkgXMg7rXvSt9i97fkGdu/SWslw72IHBriVoFyZ31brpu3e49q?=
 =?us-ascii?Q?HiplUjOONQyFMuNbha8zgPJBjAQMckMjIaYmc4bP0VL3K9MCt1D3Lqdz92bc?=
 =?us-ascii?Q?CALYCFhL0WfwtEQIeCr+OrAyFMdKkGfTjTyEUTytzW67U7nZ9torbHGG5NT3?=
 =?us-ascii?Q?XCuazDUx7sqOVEsF8pM4F4nGXzlfVKX9hjPDlYY1njNa6qEMda0Dv+8l78Uk?=
 =?us-ascii?Q?zb7QoMoVRvcJrQaMLTxvWsoCLkgtlvua7+/Kq81HaDlnGPIS4ZRwTvidlVfU?=
 =?us-ascii?Q?rC9LgUG4vD9/lSKPxWASQDoznVddpJfhUsL/AxZf/yTebtQZZoEtqGMTLTpA?=
 =?us-ascii?Q?C3dD8ZONN/4w117axKVSXCi5gv0XvyZ0mWKYK572pz1hnR/cyJqszRTmaIyC?=
 =?us-ascii?Q?L2vaUJp6xj4UiPJFVhd3okwexNBcVGgH1tXNBuebDDPSI48eDfhesGpfflp1?=
 =?us-ascii?Q?M4DCKMjBWtvP+80nDq5Ik0VEn46XnZFIRE2vfYzPP38POhFHU74lw0wrv1zu?=
 =?us-ascii?Q?7tPL6HTMPzb0mSd/fOo9o+U4IxjKsTfgE4xq2Sc1kJ2/WvSvbNCAxEXcFziU?=
 =?us-ascii?Q?8yoSTrJLTTGbkSdwSEQDowHaSLbHt3mK2vFddgkC3HShwVvRxhkwpBEmVD4R?=
 =?us-ascii?Q?kYqhQKescXec2E+XgqxWaPaDoaJBS4K7TL6rD+DLVSB99dcIMiy3ZXfX1Js+?=
 =?us-ascii?Q?05HELdiNRdyKXSfGBvNd613v6xB1dFf1BYW+/v8jTlzSpYtXY91HQApmCwI9?=
 =?us-ascii?Q?JaHaXSNxNS5Vqs0oeAKF04jafKd4m/R+xx2HW/kP/gILZMQSkNXb+6l4fkbm?=
 =?us-ascii?Q?caKtcn3bj+w6vQJQr/mGSdLb59yF0RuD+gjvAWifCWhZ0eRaRdiH8qvgIW82?=
 =?us-ascii?Q?syCOkCdOReNccBhtkLS27HjAiyNBzXZlFkC2mGEkIXpkILQuS62rDu4yYCy7?=
 =?us-ascii?Q?s1uKFRODvzkC3SgV06mk3yFlYn8m9D4XUZDqf2y/tA4rZBwa3DuglHjYDxqe?=
 =?us-ascii?Q?os+gTewLQT+0FMzNRkWD8xddcMIQRAKj7wECLgSkGq81LzS18Ia1zjggXfhs?=
 =?us-ascii?Q?k3PIDo1vMELBYDc4zwXGD8e45podm14UHzii3z5wqUf7sDADW70pKZyHqekv?=
 =?us-ascii?Q?dP/WdbWJeh+PKulucLGPIlzkh+PuixeEnz/z7KguvTeao/QOSTVDiOXFsQZa?=
 =?us-ascii?Q?fe8KzMwg5B2N6BJnKszmfG/ykTDbI7/qYoj1S+hWYzFPI9lBSCII2ywq3IDr?=
 =?us-ascii?Q?vCHbFZUo6mrP3DsY57+YXYGeFwMsFLK3hTSHIif0YTauyfhTGzbaiBZENTjx?=
 =?us-ascii?Q?0aZXpQLzaVSsbt0z4Ctu6zAQOKUGBE5WV6iPs8keQ2bSpqu3lX7+AJzAqRfl?=
 =?us-ascii?Q?L37ZNG8eRZWg4ifk41hv7X25McPB/IXInPOvIZ5imx34ezf1W/34/ElsR82D?=
 =?us-ascii?Q?tpFIK8iu1Ig5YZSASs4AVk3fOfGawQzZBcWoWRaH4AndC+yvKEdhw2DVbxyl?=
 =?us-ascii?Q?GK/+YdjoX5z1KDmYX7nnKvCw37lk1f4K686W+kOjcjKXcYvCaDyWl3qrUpnx?=
 =?us-ascii?Q?aYPaX3Yj3il0F5lO0a7o8uWr1qZTC7LYZio6Rxuk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8feee640-5f08-448f-ce50-08dda3d25d15
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 01:43:25.7874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbNW0fxNhVEPHuS7OvUK/EqQXVEI0Z/RiCzfzLR1gKELR3THEUUDMrbu4222P2eDPBeMRyR8TtiuJhe5WwEWqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10304

On Mon, Jun 02, 2025 at 02:52:07PM +0200, Primoz Fiser wrote:
>Move configuration for ADC voltage reference from board DTS to a SoM
>include file. The SoC ADC reference voltage is connected to a "VDDA_1V8"
>voltage node and supplied by the PMIC's BUCK5 regulator. The reference
>voltage is thus defined by the SoM and cannot be changed by the carrier
>board design and as such belongs into the SoM include file.
>
>Moreover, with this in place, customers designing own carrier boards can
>simply include imx93-phycore-som.dtsi and enable adc1 in their own DTS
>without the need to define dummy ADC vref regulator themselves anymore.
>
>Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
