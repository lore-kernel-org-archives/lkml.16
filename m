Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB99E2185AA;
	Thu, 27 Mar 2025 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086779; cv=fail; b=eYYRP3bOmy1sYGfxkY7f5FkNRuR/W/Wt2dk1WT4Y3PXcDU/upz4z9vyx3vN7LnT8DhF8FhTXQqcn1wGYOIWmYWgvw0ce3RYR22oy5HbpuMaGcnEF5UHM7bmb9InJfmC6rzbxNlWCbxfOnHA2BcxZFlJTT2H/nDkp/2hY3t7LXCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086779; c=relaxed/simple;
	bh=7yVkEM9lwwlT4yl+4MgskL9fAGD/UsrPKm6GzppqtfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=icUahpwU/Jkpnn3ZXzCMfDePc2lPG094L/wQaKbOzC6mAdCV2k/fitDKGragcFDaSMidx8J9cVuSFuXmpOjVM4vE+NCNaDwjG7QE51MNtn0zRY4pncKvVEET8i6I3990e/5gAcsMvOeqriUYYkAJhxoyy5Z8OLIIVWSxMIWve60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d5wlkbze reason="signature verification failed"; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d5wlkbze"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiN4Yn0ee997b5U8Hh9DKZWddr9R+MGASGRC83ef0j7sLYZZhU/iTohLoMpt2FQTSjLDiPvhOVhdi7T/c465oV0xwWq+CQBQJRTkG7Xc1mfzs6deN2+SWQ31BjGw90m5Ex80ybGkMb0rNA3xV2WTunUJPNjbHUFHHV77BCpq+xyzhmy3lLguX12p1YinUyTXTTj7q+3h9Rq1ipOU1IeYm5yh8u0kFzy9AHC4R21fd/e3p0OH+hgEnIGk0LmG1fEqk8X8FiUC5qB/t5Ca3S76oE4/qfDdY7YiVUzrKL8Dl6m9tifVmrjxzQvqBGowyHOohs6WfaWQXO3bRxTgW8lbrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jap46ox66OTTKgNJPdTsRUR+FGpKz9jNeK4z7EJXdC8=;
 b=G1IiW3wH+qRWQAHWZvoRjNLUFkwv670+SPFG4XkkljWdAmUC5CkJg0YxNNTMk8vm5Y+dyyC1/cF3lXbbWWC8W+6jO6pMCbYND0lR3alz9LrEZIuClLmvC50RRGoDd8evueonEBmY+JA+wpYnRs5QXip1q86uZB3FTlnY5VsG1wwrZf8dEojcOZnIQEkF8JLsM0V9AAAWww6+uDugtNACOaFa/hQ2v3dAUUTGp5TeOuqiNZhiQbpKlrHBMJdaksZyreBLQG9Vq96sDou6xyOSN8iR7m0pOF6fQTv8bnoP0EMs2dMWgT2nxYMlbvx0z8DX6MVUDyDUNsQpLynV5/TqNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jap46ox66OTTKgNJPdTsRUR+FGpKz9jNeK4z7EJXdC8=;
 b=d5wlkbze0ZfTauCT5hHFcBlmx0kHSYuv4D2Qdp4+a+0BIb2eWuCiLJ6ZMYHDKn+EfuuRpGA23zn6YXcYb2z7t/R18jbDsNpMvJ55o7Ln9HjzkSBnrAE4X8M+Fo35kTXREQx4yY21/V+whfB6mSy5YcbV+49mEJ7SFkFTWaylHtKDPopG9X8dZ908McyUaC9QselsJYZghXugzhh4cotU/J1lK7ul5xbRa4MOHTIleWs08MOhfe6vMUuq6RNO3L2i28Nk5lqbnd1bMIZTX8bhbQc3Z3LlajrbA6BDTnnDlL7//poIreWMtg/z/xDxcVn6YGj76XL2ItJaUQZnNsr2Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9812.eurprd04.prod.outlook.com (2603:10a6:800:1d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:46:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 14:46:12 +0000
Date: Thu, 27 Mar 2025 10:45:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add initial support for
 i.MX 95 Verdin Evaluation Kit (EVK)
Message-ID: <Z+VkpZ9boYYhL1zP@lizhi-Precision-Tower-5810>
References: <20250326223841.193234-1-marex@denx.de>
 <20250326223841.193234-2-marex@denx.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250326223841.193234-2-marex@denx.de>
X-ClientProxiedBy: PH0PR07CA0047.namprd07.prod.outlook.com
 (2603:10b6:510:e::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9812:EE_
X-MS-Office365-Filtering-Correlation-Id: 715ce62a-8590-49c2-f980-08dd6d3e1db5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?iso-8859-1?Q?azNl9i4TsSHyGqI5ZI/h9R/ZwTPn7Y32G2fLo8nwNiTXg7Pw/xwBno32x9?=
 =?iso-8859-1?Q?pka3iFeOnvSJrLT0jZQZvHevkeaieAXqgabbEESY85+mFmFyUfNeDHtxUV?=
 =?iso-8859-1?Q?ATYNIeHnsJnAuRsy0sE0AjNlbTtxGgnnISaCLoDxpSgOBeNLX/MCGRELs6?=
 =?iso-8859-1?Q?cihcvGihTOHQSi9nWAGYtWGNn+t6u21DZtElHRcfYF0C60jI37XCs0yGmO?=
 =?iso-8859-1?Q?keN96Ln5d47Ibx+Hv+LtAppqBQbH9Q0HWHUwGhxf5wHKetfwkhNonyuUzi?=
 =?iso-8859-1?Q?gNc+Vn/u/KN/sBih+sjiE6d2/AVrGOZyA4VwgiDhRAefog5Bb+cWMiKMcU?=
 =?iso-8859-1?Q?VNL4XIbwy1iqJMQzHEOXAw/dy/Dz5O47SQvrAyPG7kHw/+D5bTusxqIOpE?=
 =?iso-8859-1?Q?heD/NHiD0YSREI0SATljrNA9Z7z2RTmiHbBwD+WLmkHgYx0nT7BHTU67nE?=
 =?iso-8859-1?Q?QhpMzj3GwUmctj1x1t+4+KMGv5W7e8tjNkbwUH273MGLegVCsmhdHharYT?=
 =?iso-8859-1?Q?MJrPJ8tXSUB4GLTcVNvjSBsVDGPh0isGBGyXHs6o5J0+QSIs2+M+eAX6JZ?=
 =?iso-8859-1?Q?DkiS4TDUxaGKzEaSXt7JFHFUgRmO7JeROjq+GhZD2hcbyu5VRY4sMXGZTB?=
 =?iso-8859-1?Q?WP6XaaFxuiXmEXhtswTwRPGxfZTr5Zb/Gbrskva2mgOqw1MPfRduG9q6a4?=
 =?iso-8859-1?Q?XP7ci1pknNdm3Ofob40ljKDBE+3hlB963pbe9/gXS0VFAJcsoRGys5rmbS?=
 =?iso-8859-1?Q?GxaxErJilKWM1ZO03MQuHKd+sgJlFNOjNIUPo9/4KFmrISB2pOd+y0rvUh?=
 =?iso-8859-1?Q?remR6CiEu/kqjpg+iRsBgqATLfgotKawcAHxix1M4CWtMB1KoeRLIxb75a?=
 =?iso-8859-1?Q?tGYLoXLBiqq7jqGw3m0rGQTmWqKi2MGENJTKZkgkFTMeUt62L2aMcNdJR0?=
 =?iso-8859-1?Q?ZcIxDpFoOenhNSganjbfMtIfAqARpH6d/t4k9dO756RWQdK8sjw20QPEua?=
 =?iso-8859-1?Q?buOLxov9bTfcoPnuqinhg4ZN9HiRz5N6lfuGMxmKD+9HPlmP2oUHxTl8tO?=
 =?iso-8859-1?Q?R3Ns9PCJMDwwT+XeKSgJn3oghZWLU/ERaveehWs6QEUAZvFw0j8idwNlgE?=
 =?iso-8859-1?Q?pAw1ZbG49PtPlA9u928pXcsxqa8iwfP2ucasma6mJc+npSFhWjHqvT29PJ?=
 =?iso-8859-1?Q?dimPM+a2QnsEkK0SzZwmHqlEWAbqNGFBzW0JdLHVmDPUxcatcRMMW+ppRd?=
 =?iso-8859-1?Q?RjzkCOn0dVXgy3hyZCY/t1amvM4hK3lp9SISOa28r/Do6Mw+u3Y8JFwnPS?=
 =?iso-8859-1?Q?i54tTSkr2nL0pPTyGgYwUAM92RYoNr5zGyni5ds6ZjYGAM/1LSbYmcY4KB?=
 =?iso-8859-1?Q?GkfhQgJzFrm3iSwvaRbFY2yZ/44NuVi75ATEvj97OlEVuy7itdKDkPPrbT?=
 =?iso-8859-1?Q?ZitifxKkUuVUhi8k?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?dUWPG0739cWBo6eqCE2DQrrzvJ6qn48NLpSOywFRVcnIqHBvgioilPUE+F?=
 =?iso-8859-1?Q?MfagRKmEdN6oTZJQ/yCVkBPXo3AI1tCiWhOdvQWpwyauAtsVtoP55az60B?=
 =?iso-8859-1?Q?A1tgLdHq5IDhZC3qIG3K/20unLfXYX5maW351PTomAMqcWNxPSn18n4Wvw?=
 =?iso-8859-1?Q?kk+SLoAb/7rnheWmhJlMyCBqsZp1aSV5qOMicIu4VDhXL4ga8DlqShEFbT?=
 =?iso-8859-1?Q?+ms3dG22kdnBBYGxd1boG81MLBgSBEs7daMXV8jdRRyQtHFrZBku/pn/Qf?=
 =?iso-8859-1?Q?ZIBibER9mDSIqzv7rNhKJ1YzLTB4hJcPSPCjrKFLKkIpC3KeJ4tBopXf5w?=
 =?iso-8859-1?Q?e0nOuCA9lCSGv4e24X9EivDSxDbA0CLfc8FUU9nmUYR9mahfG1VPfS2Gi4?=
 =?iso-8859-1?Q?khYD2peWo8QHw0CEWkT+8l0PeizS8NhU8ihmLSq3c3RHpI3jaw/29qyudL?=
 =?iso-8859-1?Q?uASm0WPgcD/zCRORoxjT6JA6i5oyQB/zkcinKD8IxryACsQa5XjmHnRdgV?=
 =?iso-8859-1?Q?TUYSzwe30mtV06BmuwM5DNQhKkHFMFkEDl6VWOkq9m6Cka2/nkkYyHMZsL?=
 =?iso-8859-1?Q?WtqS99gLvR8kl8jpfIlvd0Ms+DNWuZOFhoQbpn0WOLkIwde8JasjcPYgyS?=
 =?iso-8859-1?Q?Oqqp/4WudsICVE/X4JtiwgYW6ZVIXl6915sZlby2xm7giguWkp7/hJqeOY?=
 =?iso-8859-1?Q?5oe1ugzeeN9i/YbJVpJA7j9ZgQ1t/lCGtaz5uvRLGTE04T47m65q0KV/mT?=
 =?iso-8859-1?Q?ctS85rNQx2dd4rkVru98p1Zd/5RhzxK356+0N6p+3PDXpbeLbYEWbiptXr?=
 =?iso-8859-1?Q?nwX0EA7vV5Ky7DxZw5Vz/IpFVy9BIZelHoDunWROOOagp4AbM22+3WHy7l?=
 =?iso-8859-1?Q?n5yljtQIx3Cj2ctaK9n85BvzhrHxP9kQpfELI3NZWnxIwmpW8PPuiobgIv?=
 =?iso-8859-1?Q?t6J3E4gvkpk8NUrIOlTBpKTL/YK36IJNI+9IPLvuscSs4wGGf2nheMsQ0W?=
 =?iso-8859-1?Q?qRbhjKzU0cpSysUMHuh4QsrDw4zkfTipG9mzQ7hxqn+ycJ3hbeCmwdzpqu?=
 =?iso-8859-1?Q?5xUa22Hij3Ifr3reHqQF7+55SuuW74KRbOzsgpdC2Xm3OrDSEwFygOV4FE?=
 =?iso-8859-1?Q?FVj+hNxuY1c1i9urAxBysFrOLAVQugvGtIjjAnjLDvtpOP2lwQpEZOaqkS?=
 =?iso-8859-1?Q?4nTj0UA2hQoU6F0jT5wnZVFscOIMXW4jYUo9+Rdbd/2kQ3Iz6w4WUvMoyo?=
 =?iso-8859-1?Q?f/Ny9OPo8yxtBl1QmU8unw57DRC1lt9/cDYdhonBzTc9PE4NbXtC6sMIyG?=
 =?iso-8859-1?Q?nPQN8WhEtf5Wj/ZdnJ5z2ht2ycHS/fVMMw+GPmJSOzjwTTKHOlHUqU00mi?=
 =?iso-8859-1?Q?C6xbAA39NWKeTyFW8kVd6I4MoIWMvYfl0m31hDIkGKB2TvfwmVp/3544uN?=
 =?iso-8859-1?Q?39QQ1YlHdvdQj5y/9WDGLQQf0ZCmIkq5UyZ+poMBDN7n4JDzQy6MhrM/aG?=
 =?iso-8859-1?Q?9BLZIp0gQphmYJz76NxX5jrvys5MqP8z2VwqMZaSJlojb3at46Eohz02+Q?=
 =?iso-8859-1?Q?Cd4W/oSEIdcKccWveReU/EdoaVOAyTsBO+5LU2qfAxxKrZHcGTL6W2YYDe?=
 =?iso-8859-1?Q?JHZy3aUMCg3Uc4uo8jWVHA6W4Svgs3oLbX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 715ce62a-8590-49c2-f980-08dd6d3e1db5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:46:12.3106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bubu2a2+KvVllZwnR/j2+fbOSRPTDl/LX4MXd+HI3cxI14bqHqvEXA9mbQLGLzU1nLkptjXaU6mlGsPVxinLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9812

On Wed, Mar 26, 2025 at 11:38:16PM +0100, Marek Vasut wrote:
> Add initial support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK. Currently supported is lpuart1 as console,
> SDHC1/2/3 as storage, WM8904 Audio, USB3.0 and ENETC ethernet RGMII
> Gigabit port.
>
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
>
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95-evaluation-kit
>
> Reviewed-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> Tested-by: João Paulo Gonçalves <joao.goncalves@toradex.com> # i.MX95 Verdin EVK
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Cc: Joao Goncalves <joao.goncalves@toradex.com>
> Cc: Joao Goncalves <jpaulo.silvagoncalves@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Tim Harvey <tharvey@gateworks.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: - Drop pwm.h
>     - Write machine compatible string on single line
>     - Add RB/TB from João
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx95-19x19-verdin-evk.dts  | 695 ++++++++++++++++++
>  2 files changed, 696 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index b6d3fe26d6212..e76e3ef863e76 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -303,6 +303,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
>
>  imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
> new file mode 100644
> index 0000000000000..606dbea5e5f93
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
> @@ -0,0 +1,695 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2023 NXP
> + * Copyright 2025 Marek Vasut <marex@denx.de>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "imx95.dtsi"
> +
> +#define FALLING_EDGE			1
> +#define RISING_EDGE			2
> +
> +#define BRD_SM_CTRL_SD3_WAKE		0x8000	/* PCAL6408A-0 */
> +#define BRD_SM_CTRL_PCIE1_WAKE		0x8001	/* PCAL6408A-4 */
> +#define BRD_SM_CTRL_BT_WAKE		0x8002	/* PCAL6408A-5 */
> +#define BRD_SM_CTRL_PCIE2_WAKE		0x8003	/* PCAL6408A-6 */
> +#define BRD_SM_CTRL_BUTTON		0x8004	/* PCAL6408A-7 */
> +
> +/ {
> +	model = "i.MX 95 Verdin Evaluation Kit (EVK)";
> +	compatible = "toradex,verdin-imx95-19x19-evk", "fsl,imx95";
> +
> +	aliases {
> +		ethernet0 = &enetc_port0;
> +		ethernet1 = &enetc_port1;
> +		ethernet2 = &enetc_port2;
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +		gpio3 = &gpio4;
> +		gpio4 = &gpio5;
> +		i2c0 = &lpi2c1;
> +		i2c1 = &lpi2c2;
> +		i2c2 = &lpi2c3;
> +		i2c3 = &lpi2c4;
> +		i2c4 = &lpi2c5;
> +		i2c5 = &lpi2c6;
> +		i2c6 = &lpi2c7;
> +		i2c7 = &lpi2c8;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		serial0 = &lpuart1;
> +	};
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux_cma: linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0x80000000 0 0x7f000000>;
> +			size = <0 0x3c000000>;
> +			linux,cma-default;
> +			reusable;
> +		};
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "+V1.8_SW";
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "+V3.3_SW";
> +	};
> +
> +	reg_m2_pwr: regulator-m2-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "M.2-power";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 4 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	reg_pcie0: regulator-pcie {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE_WLAN_EN";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_m2_pwr>;
> +		gpio = <&i2c7_pcal6524 18 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VDD_SD2_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		off-on-delay-us = <12000>;
> +	};
> +
> +	usdhc3_pwrseq: usdhc3-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&i2c7_pcal6524 11 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	sound-wm8904 {
> +		compatible = "fsl,imx-audio-wm8904";
> +		model = "wm8904-audio";
> +		audio-cpu = <&sai3>;
> +		audio-codec = <&wm8904>;
> +		audio-routing =
> +			"Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",
> +			"AMIC", "MICBIAS",
> +			"IN2L", "AMIC";
> +	};
> +};
> +
> +&enetc_port0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc0>;
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&flexspi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexspi1>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_flexspi1_reset>;
> +		reset-gpios = <&gpio5 11 GPIO_ACTIVE_LOW>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <200000000>;
> +		spi-tx-bus-width = <8>;
> +		spi-rx-bus-width = <8>;
> +	};
> +};
> +
> +&lpi2c4 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c4>;
> +	status = "okay";
> +
> +	wm8904: codec@1a {
> +		#sound-dai-cells = <0>;
> +		compatible = "wlf,wm8904";
> +		reg = <0x1a>;
> +		clocks = <&scmi_clk IMX95_CLK_SAI3>;
> +		clock-names = "mclk";
> +		AVDD-supply = <&reg_1p8v>;
> +		CPVDD-supply = <&reg_1p8v>;
> +		DBVDD-supply = <&reg_1p8v>;
> +		DCVDD-supply = <&reg_1p8v>;
> +		MICVDD-supply = <&reg_1p8v>;
> +	};
> +};
> +
> +&lpi2c5 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c5>;
> +	status = "okay";
> +};
> +
> +&lpi2c6 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c6>;
> +	status = "okay";
> +};
> +
> +&lpi2c7 {
> +	clock-frequency = <1000000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c7>;
> +	status = "okay";
> +
> +	i2c7_pcal6524: i2c7-gpio@23 {
> +		compatible = "nxp,pcal6524";
> +		reg = <0x23>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_i2c7_pcal6524>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	/* Current measurement at SoM 5V power output */
> +	hwmon@41 {
> +		compatible = "ti,ina219";
> +		reg = <0x41>;
> +		shunt-resistor = <10000>;
> +	};
> +
> +	/* Current measurement at Board power input */
> +	hwmon@45 {
> +		compatible = "ti,ina219";
> +		reg = <0x45>;
> +		shunt-resistor = <10000>;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "st,24c02";
> +		reg = <0x50>;
> +	};
> +
> +	ptn5110: tcpc@52 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x52>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_typec>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
> +
> +		typec_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 20000, 3000)>;
> +			op-sink-microwatt = <15000000>;
> +			self-powered;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec_con_hs: endpoint {
> +						remote-endpoint = <&usb3_data_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					typec_con_ss: endpoint {
> +						remote-endpoint = <&usb3_data_ss>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&lpuart1 {
> +	/* console */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&mu7 {
> +	status = "okay";
> +};
> +
> +&netcmix_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&netc_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&netc_emdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_emdio>;
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@1 {
> +		reg = <1>;
> +		realtek,clkout-disable;
> +	};
> +};
> +
> +&pcie0 {
> +	pinctrl-0 = <&pinctrl_pcie0>;
> +	pinctrl-names = "default";
> +	reset-gpio = <&i2c7_pcal6524 17 GPIO_ACTIVE_LOW>;
> +	vpcie-supply = <&reg_pcie0>;
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	pinctrl-0 = <&pinctrl_pcie1>;
> +	pinctrl-names = "default";
> +	reset-gpio = <&i2c7_pcal6524 16 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&sai1 {
> +	#sound-dai-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai1>;
> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX95_CLK_SAI1>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>,
> +			       <3612672000>, <393216000>,
> +			       <361267200>, <12288000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +&sai3 {
> +	#sound-dai-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai3>;
> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX95_CLK_SAI3>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>,
> +			       <3612672000>, <393216000>,
> +			       <361267200>, <12288000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +&usb3 {
> +	status = "okay";
> +};
> +
> +&usb3_dwc3 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	role-switch-default-mode = "peripheral";
> +	snps,dis-u1-entry-quirk;
> +	snps,dis-u2-entry-quirk;
> +	status = "okay";
> +
> +	port {
> +		usb3_data_hs: endpoint {
> +			remote-endpoint = <&typec_con_hs>;
> +		};
> +	};
> +};
> +
> +&usb3_phy {
> +	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
> +	orientation-switch;
> +	status = "okay";
> +
> +	port {
> +		usb3_data_ss: endpoint {
> +			remote-endpoint = <&typec_con_ss>;
> +		};
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc1>;
> +	bus-width = <8>;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	mmc-pwrseq = <&usdhc3_pwrseq>;
> +	vmmc-supply = <&reg_pcie0>;
> +	bus-width = <4>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&scmi_misc {
> +	nxp,ctrl-ids = <BRD_SM_CTRL_SD3_WAKE	FALLING_EDGE
> +			BRD_SM_CTRL_PCIE1_WAKE	FALLING_EDGE
> +			BRD_SM_CTRL_BT_WAKE	FALLING_EDGE
> +			BRD_SM_CTRL_PCIE2_WAKE	FALLING_EDGE
> +			BRD_SM_CTRL_BUTTON	FALLING_EDGE>;
> +};
> +
> +&wdog3 {
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};

please keep order by names incase add 2 &wdogs later accidently.

You can try https://github.com/lznuaa/dt-format to order it.

Frank

> +
> +&scmi_iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO04__GPIO2_IO_BIT4			0x3fe>;
> +	};
> +
> +	pinctrl_emdio: emdiogrp {
> +		fsl,pins =
> +			<IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x57e>,
> +			<IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e>;
> +	};
> +
> +	pinctrl_enetc0: enetc0grp {
> +		fsl,pins =
> +			<IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3	0x57e>,
> +			<IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2	0x57e>,
> +			<IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1	0x57e>,
> +			<IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0	0x57e>,
> +			<IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e>,
> +			<IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e>,
> +			<IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e>,
> +			<IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e>,
> +			<IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0	0x57e>,
> +			<IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1	0x57e>,
> +			<IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2	0x57e>,
> +			<IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3	0x57e>;
> +	};
> +
> +	pinctrl_flexspi1: flexspi1grp {
> +		fsl,pins =
> +			<IMX95_PAD_XSPI1_SS0_B__FLEXSPI1_A_SS0_B		0x3fe>,
> +			<IMX95_PAD_XSPI1_SCLK__FLEXSPI1_A_SCLK			0x3fe>,
> +			<IMX95_PAD_XSPI1_DQS__FLEXSPI1_A_DQS			0x3fe>,
> +			<IMX95_PAD_XSPI1_DATA0__FLEXSPI1_A_DATA_BIT0		0x3fe>,
> +			<IMX95_PAD_XSPI1_DATA1__FLEXSPI1_A_DATA_BIT1		0x3fe>,
> +			<IMX95_PAD_XSPI1_DATA2__FLEXSPI1_A_DATA_BIT2		0x3fe>,
> +			<IMX95_PAD_XSPI1_DATA3__FLEXSPI1_A_DATA_BIT3		0x3fe>,
> +			<IMX95_PAD_XSPI1_DATA4__FLEXSPI1_A_DATA_BIT4		0x3fe>,
> +			<IMX95_PAD_XSPI1_DATA5__FLEXSPI1_A_DATA_BIT5		0x3fe>,
> +			<IMX95_PAD_XSPI1_DATA6__FLEXSPI1_A_DATA_BIT6		0x3fe>,
> +			<IMX95_PAD_XSPI1_DATA7__FLEXSPI1_A_DATA_BIT7		0x3fe>;
> +	};
> +
> +	pinctrl_flexspi1_reset: flexspi1-reset-grp {
> +		fsl,pins =
> +			<IMX95_PAD_XSPI1_SS1_B__GPIO5_IO_BIT11			0x3fe>;
> +	};
> +
> +	pinctrl_hp: hpgrp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO11__GPIO2_IO_BIT11			0x31e>;
> +	};
> +
> +	pinctrl_i2c4_pcal6408: i2c4pcal6498grp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO18__GPIO2_IO_BIT18			0x31e>;
> +	};
> +
> +	pinctrl_i2c7_pcal6524: i2c7pcal6524grp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO36__GPIO5_IO_BIT16			0x31e>;
> +	};
> +
> +	pinctrl_lpi2c4: lpi2c4grp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO30__LPI2C4_SDA			0x40000b9e>,
> +			<IMX95_PAD_GPIO_IO31__LPI2C4_SCL			0x40000b9e>;
> +	};
> +
> +	pinctrl_lpi2c5: lpi2c5grp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO22__LPI2C5_SDA			0x40000b9e>,
> +			<IMX95_PAD_GPIO_IO23__LPI2C5_SCL			0x40000b9e>;
> +	};
> +
> +	pinctrl_lpi2c6: lpi2c6grp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO02__LPI2C6_SDA			0x40000b9e>,
> +			<IMX95_PAD_GPIO_IO03__LPI2C6_SCL			0x40000b9e>;
> +	};
> +
> +	pinctrl_lpi2c7: lpi2c7grp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO08__LPI2C7_SDA			0x40000b9e>,
> +			<IMX95_PAD_GPIO_IO09__LPI2C7_SCL			0x40000b9e>;
> +	};
> +
> +	pinctrl_pcie0: pcie0grp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B	0x4000031e>;
> +	};
> +
> +	pinctrl_pcie1: pcie1grp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO35__HSIOMIX_TOP_PCIE2_CLKREQ_B	0x4000031e>;
> +	};
> +
> +	pinctrl_pcal6416: pcal6416grp {
> +		fsl,pins =
> +			<IMX95_PAD_CCM_CLKO3__GPIO4_IO_BIT28			0x31e>;
> +	};
> +
> +	pinctrl_pdm: pdmgrp {
> +		fsl,pins =
> +			<IMX95_PAD_PDM_CLK__AONMIX_TOP_PDM_CLK				0x31e>,
> +			<IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_PDM_BIT_STREAM_BIT0	0x31e>;
> +	};
> +
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins =
> +			<IMX95_PAD_SAI1_RXD0__AONMIX_TOP_SAI1_RX_DATA_BIT0	0x31e>,
> +			<IMX95_PAD_SAI1_TXC__AONMIX_TOP_SAI1_TX_BCLK		0x31e>,
> +			<IMX95_PAD_SAI1_TXFS__AONMIX_TOP_SAI1_TX_SYNC		0x31e>,
> +			<IMX95_PAD_SAI1_TXD0__AONMIX_TOP_SAI1_TX_DATA_BIT0	0x31e>;
> +	};
> +
> +	pinctrl_sai2: sai2grp {
> +		fsl,pins =
> +			<IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_SAI2_RX_BCLK		0x31e>,
> +			<IMX95_PAD_ENET2_MDC__NETCMIX_TOP_SAI2_RX_SYNC		0x31e>,
> +			<IMX95_PAD_ENET2_TD3__NETCMIX_TOP_SAI2_RX_DATA_BIT0	0x31e>,
> +			<IMX95_PAD_ENET2_TD2__NETCMIX_TOP_SAI2_RX_DATA_BIT1	0x31e>,
> +			<IMX95_PAD_ENET2_TXC__NETCMIX_TOP_SAI2_TX_BCLK		0x31e>,
> +			<IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_SAI2_TX_SYNC	0x31e>,
> +			<IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_SAI2_TX_DATA_BIT0	0x31e>,
> +			<IMX95_PAD_ENET2_RXC__NETCMIX_TOP_SAI2_TX_DATA_BIT1	0x31e>,
> +			<IMX95_PAD_ENET2_RD0__NETCMIX_TOP_SAI2_TX_DATA_BIT2	0x31e>,
> +			<IMX95_PAD_ENET2_RD1__NETCMIX_TOP_SAI2_TX_DATA_BIT3	0x31e>,
> +			<IMX95_PAD_ENET2_RD2__NETCMIX_TOP_SAI2_MCLK		0x31e>;
> +	};
> +
> +	pinctrl_sai3: sai3grp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO17__SAI3_MCLK			0x31e>,
> +			<IMX95_PAD_GPIO_IO16__SAI3_TX_BCLK		0x31e>,
> +			<IMX95_PAD_GPIO_IO26__SAI3_TX_SYNC		0x31e>,
> +			<IMX95_PAD_GPIO_IO20__SAI3_RX_DATA_BIT0		0x31e>,
> +			<IMX95_PAD_GPIO_IO21__SAI3_TX_DATA_BIT0		0x31e>;
> +	};
> +
> +	pinctrl_tpm6: tpm6grp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO19__TPM6_CH2			0x51e>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins =
> +			<IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX	0x31e>,
> +			<IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX	0x31e>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins =
> +			<IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e>,
> +			<IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e>,
> +			<IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x138e>,
> +			<IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x138e>,
> +			<IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x138e>,
> +			<IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x138e>,
> +			<IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x138e>,
> +			<IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x138e>,
> +			<IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x138e>,
> +			<IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x138e>,
> +			<IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x158e>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins =
> +			<IMX95_PAD_SD1_CLK__USDHC1_CLK			0x158e>,
> +			<IMX95_PAD_SD1_CMD__USDHC1_CMD			0x138e>,
> +			<IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x138e>,
> +			<IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x138e>,
> +			<IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x138e>,
> +			<IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x138e>,
> +			<IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x138e>,
> +			<IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x138e>,
> +			<IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x138e>,
> +			<IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x138e>,
> +			<IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x158e>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins =
> +			<IMX95_PAD_SD1_CLK__USDHC1_CLK			0x15fe>,
> +			<IMX95_PAD_SD1_CMD__USDHC1_CMD			0x13fe>,
> +			<IMX95_PAD_SD1_DATA0__USDHC1_DATA0		0x13fe>,
> +			<IMX95_PAD_SD1_DATA1__USDHC1_DATA1		0x13fe>,
> +			<IMX95_PAD_SD1_DATA2__USDHC1_DATA2		0x13fe>,
> +			<IMX95_PAD_SD1_DATA3__USDHC1_DATA3		0x13fe>,
> +			<IMX95_PAD_SD1_DATA4__USDHC1_DATA4		0x13fe>,
> +			<IMX95_PAD_SD1_DATA5__USDHC1_DATA5		0x13fe>,
> +			<IMX95_PAD_SD1_DATA6__USDHC1_DATA6		0x13fe>,
> +			<IMX95_PAD_SD1_DATA7__USDHC1_DATA7		0x13fe>,
> +			<IMX95_PAD_SD1_STROBE__USDHC1_STROBE		0x15fe>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins =
> +			<IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e>;
> +	};
> +
> +	pinctrl_typec: typecgrp {
> +		fsl,pins =
> +			<IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14		0x31e>;
> +	};

please keep order by node name typecgrp, usdhc2gpiogrp

Frank

> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins =
> +			<IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0		0x31e>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins =
> +			<IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e>,
> +			<IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e>,
> +			<IMX95_PAD_SD2_DATA0__USDHC2_DATA0		0x138e>,
> +			<IMX95_PAD_SD2_DATA1__USDHC2_DATA1		0x138e>,
> +			<IMX95_PAD_SD2_DATA2__USDHC2_DATA2		0x138e>,
> +			<IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x138e>,
> +			<IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins =
> +			<IMX95_PAD_SD2_CLK__USDHC2_CLK			0x158e>,
> +			<IMX95_PAD_SD2_CMD__USDHC2_CMD			0x138e>,
> +			<IMX95_PAD_SD2_DATA0__USDHC2_DATA0		0x138e>,
> +			<IMX95_PAD_SD2_DATA1__USDHC2_DATA1		0x138e>,
> +			<IMX95_PAD_SD2_DATA2__USDHC2_DATA2		0x138e>,
> +			<IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x138e>,
> +			<IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins =
> +			<IMX95_PAD_SD2_CLK__USDHC2_CLK			0x15fe>,
> +			<IMX95_PAD_SD2_CMD__USDHC2_CMD			0x13fe>,
> +			<IMX95_PAD_SD2_DATA0__USDHC2_DATA0		0x13fe>,
> +			<IMX95_PAD_SD2_DATA1__USDHC2_DATA1		0x13fe>,
> +			<IMX95_PAD_SD2_DATA2__USDHC2_DATA2		0x13fe>,
> +			<IMX95_PAD_SD2_DATA3__USDHC2_DATA3		0x13fe>,
> +			<IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins =
> +			<IMX95_PAD_SD3_CLK__USDHC3_CLK			0x158e>,
> +			<IMX95_PAD_SD3_CMD__USDHC3_CMD			0x138e>,
> +			<IMX95_PAD_SD3_DATA0__USDHC3_DATA0		0x138e>,
> +			<IMX95_PAD_SD3_DATA1__USDHC3_DATA1		0x138e>,
> +			<IMX95_PAD_SD3_DATA2__USDHC3_DATA2		0x138e>,
> +			<IMX95_PAD_SD3_DATA3__USDHC3_DATA3		0x138e>;
> +	};
> +};
> --
> 2.47.2
>
