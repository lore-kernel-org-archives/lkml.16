Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7D422094;
	Thu, 22 May 2025 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903682; cv=fail; b=Am4nV+hb7NHSI0Uz26JtrVaK4YDqmWOla7ZTZ6J+bOZuOozXgb0AcFrCiibpkjFfRLtEt3pvBLNvKThNa2ya4x8uhcjREH40ngeHNQhhbcUuwsd+3MRB7wh+6e101MWRpJN3EXT/wYHMucQDFg33e/pqBv7iManK/1lnENR1lFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903682; c=relaxed/simple;
	bh=6rZ9KnzLo+PeEslFiwg5vWJxuPzT/NULFONtxmn+aqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VBiOBZI9+jHZaF7rQ7gHAhr91zccREn69q5vah3vBDtcQttRS1ATihaGmUxSoQVN9r1of1QgvmJ8RStjtMMDKw1x6+WmWWKOUjDMhChgJLlhUD0/blbCbmVywyz15eBoGZ9mYe2lvD/DdI6szQLzd1aQ5qZ7OCcPK97McWcnGs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gr9vG99v; arc=fail smtp.client-ip=40.107.20.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gr9vG99v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SII3dlehRk8jLAasc6vmj9kiN97mD0AoengsokVI11yYlC+it0pDjAySyANui4d6t5gQI5iw+y/psT8rUOs366atkOcwqT6FnPcibUsg4cDu03Duno11qQKLyU4GkVIhGgVP8I7EmFuZKsZ4P1licNMwni99P5IDFf7LDedF9cxQaL65fJIWbVTu2deZNqr12yow16nYw2G0/2R5OXiktO5dDizXVZpoppiP8ZJEGAARRqPAPPOtxa9mpzm9FVAt4KllpIT7vAlfeNkOZv6ODXVMcpOCJiZrRmfALAw6ZVs7gVbv1rqqqIJzsX9v0us6C+UaFyn4iAco44KXmFkrKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvfC0UwWNWZmMXiqPnPLpQ0X2Kmuy44t6XZWYFhIPDw=;
 b=B7f94kEYCWxKUJYIa8zvuPMKD14TqTptvyVm9QMgy5Fuqi1AgOs1GzYTKTduGzpvsMF9uHzwxVXyPR8KmI8S7/eSQsmN9NVz7BLHQu7rYN2/xGhp2JGl+Mdpy6LdPHRoFovlMuLcqCms2lSpqQoK+c3eIcK7+ARpyz9DzIc67TBBXuOHcCZu/wYokAXkACmKtDlu5+TQwtTYkqm+4+KOUWym0RxfxF9BOshZS0YJ9J51tJeXIbUqL5ar/C+Uo9Wgz/MspkdNk8a3JCFufjIdGtFPi8kucXrhFRgMDakB28XwOgjVU+j2qXeCAY99yjL8ONosDUaTSzR7O4/hw4ygEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvfC0UwWNWZmMXiqPnPLpQ0X2Kmuy44t6XZWYFhIPDw=;
 b=gr9vG99vp4KjZIQLMcGRXd+C33B8a+9qAInkbXN/t00IG6HbolW7oEKrm6KYUSzw5GLJlkFhLoTqiM+1JOrkICwwtRjvvBbKyuxzWT91PyZCuBcQSXyuVT5EIg5Hd8RUKb908GAgWBImAOdqe2d5/fOAspm6iBXITc5HUMicSjgG05Y80jPIRPAFGmbi4ay3zc9gLHIeJliZ9AvlxrrKHEG57yWhyT2hnzReqA0aZyP8VhVrPpU8DqvPeCJBzIsCWZFrsxOQcOuOjGUkYNrJdqscxcDfhVojHWO1nuqG9lqgPmtLD70m01dDKjWUytrrZHqdrjTsdTKK2eo2XNKWyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7521.eurprd04.prod.outlook.com (2603:10a6:20b:2df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 08:47:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 08:47:57 +0000
Date: Thu, 22 May 2025 17:57:24 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] ARM: dts: imx6ulz-bsh-smm-m2: Enable uart2
Message-ID: <20250522095724.GA14761@nxa18884-linux>
References: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
 <20250514070545.1868850-2-dario.binacchi@amarulasolutions.com>
 <20250516040520.GC28759@nxa18884-linux>
 <CAOf5uwmM=+QoaJH8vsUKL-fDab_Fmhxd1d-622pRi-hK=EXk4g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOf5uwmM=+QoaJH8vsUKL-fDab_Fmhxd1d-622pRi-hK=EXk4g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:3:17::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c4de511-6923-47fb-d316-08dd990d5987
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2bg/5PYKYo8hycG7MpYZ7GnEC7PMwDFsd0zr69I3p2oolQsFTdV3kLquQDDU?=
 =?us-ascii?Q?HBjuV0JW9ki7NfOhSDX2TPg9CaMO6em9UsLa3dE/p71RTGwyfKk+IWhGyceG?=
 =?us-ascii?Q?X7nTcrz4mMCl++2KB9pnrS6pMx1Osr0eSxq6Q3vwXSnSBFoGSlY5guDsuhrY?=
 =?us-ascii?Q?hlZql5Ye0QV3kJ+Ou1qMhxoXTMKRQcoDABRKANHOkKLFrOWBWoWYTe66UVlH?=
 =?us-ascii?Q?hFGx6D6ic9V0fCEd6TgNc2k2btLkmMRv/qjurQJJeTebBdy+pzAha/TfGyGJ?=
 =?us-ascii?Q?GmmIb8sfiWEfCrIj+Lt4YKCdQrDbC9dn+L1mepqjUPDmnTJd/pDO6kpltzdA?=
 =?us-ascii?Q?a4hEpUVLv1AdheWW/uVnib50Z7bIzZmG6yGt6yNGWKBhg26FpfyGcpn/hYBE?=
 =?us-ascii?Q?BCyugFu744cbtHH11gtEr9nK7byDsDDUpu7x2V2ajWq3oX8RTnvhLptp8Ewz?=
 =?us-ascii?Q?NhX1XsUZOrA1P2Grgzj1lhjKwcfzCcGHnMWNDLq+m1jBHFLdLRW4/+wHr98F?=
 =?us-ascii?Q?sbo4f3PdUdRW3TtmElhDz5ge+nKNPxHu00VEvJ/15RUg2NPMSW/C7GdT7I9j?=
 =?us-ascii?Q?tLNnHAJRxH3igyHmm8uuweWN6NkX5cFktjb9j3ttLBCYwk6724t4Tdi4IC6G?=
 =?us-ascii?Q?qogYIhpTMXYaMS9hm/Aj2nBUGSN/PFdsf2FwEhj02+PrXoPvRPlDXEhGT3M/?=
 =?us-ascii?Q?ZTp6fH1HleuOZvWuO2MD8G2zT4pwKzs4j/I8PzQ+xdXZViR7RhV407Llb5yh?=
 =?us-ascii?Q?RQP1YjoSF3Txa1pUgTEDGniuulnDvoULo413p3ZhdqTqTWrqgtaVDIntNZZ+?=
 =?us-ascii?Q?6wcm6V20QXztRp+eWbPftisQoxASV0cSaJCS6JWOkKsTmb/LJWkB9GYhmmBB?=
 =?us-ascii?Q?BViTFJcMOaUZ0EPGFmRkDR/HNWnN39uU5jfLiGM5Lf5m77jqIFKAngdJrpe0?=
 =?us-ascii?Q?AEMsR0gsv4vON+AKhOJwqTRj8adM6ncYCKKady2rvsY5VLWHC0EohZ5TkLb8?=
 =?us-ascii?Q?jeJH0m1LTju3HdEmEG+zRXLSAV4/dADRS1jC6yKc7FsFQLKIGxV4QdfHjxPi?=
 =?us-ascii?Q?etuSYyJxTn/o3cn8FMyOIHdRBrT+IWqKReddlyvViqOmgdHTFBQJpQYxFpIk?=
 =?us-ascii?Q?eJ2/0RHsX+io60uxiZ8Q9ckHK7BOj3Logxk/N2lY1DRGgVfPbnWf0a1g2cdT?=
 =?us-ascii?Q?ybLB5hOE+BqYyuMdng4/23i7icqjLawjDE7mbfjiGh4xA4ei6/LbOClcktAr?=
 =?us-ascii?Q?Kl3is3IPmXf69asN9AoUXlJZq4/5rYUUn2k8ZbKgt3C7x7KuCPkGHEzQFxGG?=
 =?us-ascii?Q?Zo4c9pkuc2imnMzWbuxL3Yal1J58sBOE5D/BDygMXmp4NvnDh2DhJDSPcKcZ?=
 =?us-ascii?Q?mHoRVwhVqF2LrjmEmwVN7wgyuSXtaKUndlENkmfVgrrEbQkrKG7fY2enmLtH?=
 =?us-ascii?Q?D66tSyL/P+o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ev6v0YYAQOVwc9fpxWekmtfh/tbxv9g5QuOz6xJxsApjpQtp7mRaeSZEAWEd?=
 =?us-ascii?Q?HX8NDhwQd0p4xlOdw7RnjzFlE8CFEOR7xTXAWu3bc03cM+DElSrTXPcnMdqc?=
 =?us-ascii?Q?Rzt7qpm04ErOE6i1qElSv+s8ft18MXguWzfJCXuDPhth+NiSgwdT+5eWU+Yw?=
 =?us-ascii?Q?z7kKqCNSKdJD/RSSJqd5Ek1oqOXfnMxcA/+VHxrML42QnnjDbgIl0cEi2OXp?=
 =?us-ascii?Q?M9KnZlVTpUd7QcueooxlWoqdS9PS1jyjMasI81EHX08cbSpuiNpS1i9igny5?=
 =?us-ascii?Q?15e79++y3oCRINOCt1LCtGzvv+zdOFfB66Ky39mmHBDfbjcoUXqU4ZuI8Ve0?=
 =?us-ascii?Q?zTC6tFbIwBBqhRAetUN4UvRutbCulGSD4So1A69NPutaJBDOasyAyq8LxnC/?=
 =?us-ascii?Q?1j7Y04NfoOtsT9kalrekr00QTSnTeMquU27XhjsyM/WBq4kDzrRAoqcchVfk?=
 =?us-ascii?Q?793FoD6iHtgQI5tquqS9UUKdYcomp8UICnGuW9IycJrLY4CB/uRVa+VtCzkX?=
 =?us-ascii?Q?Nz9eoHZ6dpBNeU6u/hYIUV5MxdJ0FbgeS1WClILnQGll8UEJCU9PZ4IvvAOS?=
 =?us-ascii?Q?oPyGYPccGd2ILw7D67QgXfPW0tGLeYzNqrhh1fImNhk35KJjjpnSf57aldZN?=
 =?us-ascii?Q?UOnmnudNKnIh76dQY7elLSj9HBawOcQ2gvwZGBkPPAnnfQlnHsiHiiQ87NWR?=
 =?us-ascii?Q?dbNdQ2lPFO1mRvsmZSNpfMpku7qUcFIdemGtUkQF02bANgKth6n9wGIGjDui?=
 =?us-ascii?Q?MguFyj3Ken+TZOXDwvzzxb9GtFLRGGtIhmBnVqZ/O/0Pn0LbYG4tk+/Au/zx?=
 =?us-ascii?Q?L3WGO65zKiVXeEjlHeyQHKf7DxE3ftN4w+3S9IxG4XtyNUNBzD3WO3Uas7af?=
 =?us-ascii?Q?DPeypPYG00Flvkq/UGdrhoQvsLRndeodMtW+gKPCEJhHL6AISRoN+kIKFd3A?=
 =?us-ascii?Q?Y6xRYHL+kxEFQ+O+6tKKf+YMUkZoxWJetoX6nSuHfIybIVnwdiNgOSwB8EGY?=
 =?us-ascii?Q?Y+tbYJ6gECbePELUNbC6y/Ht9nH2GxRaXtUG6JVqyfu/bm7WidFBR5BYsUuh?=
 =?us-ascii?Q?Pah4eyDpXkatImbowY8+nEBjpMaMXJV54Xn7KfLjbxxJmpewtlBUvEyqt+FR?=
 =?us-ascii?Q?XvgfA/yVjToORJfgRSkyTiZ1jJ4UWJ4BiAElYTbfMdDZdJTDMzY1K8B3i3Z1?=
 =?us-ascii?Q?YeZPtUffUritZMSFkm8l10dzILNAmuWlMrYW+52kxlUGsxasmq1sE8drGLyZ?=
 =?us-ascii?Q?zEaPxnWcvVkZ5IYCMPRmprbkYNpEJwWFSW9WVpxzM16wZV0v6Iyh+TzmY1gk?=
 =?us-ascii?Q?PwLFN27AoY9v22VZtIadDRFp2jpBBWLqoj4Us8R6BkH3bTQut21aAHlJI1+Z?=
 =?us-ascii?Q?Aje0yjwMI6mqoVFxL4mbRZyc4SN9tBEpdRFVblWEyL8PSCW45CD/nvDeFzS8?=
 =?us-ascii?Q?WWTEgKhbsZdSPL6uUszUVUBMsZsO6/Tf1J0HClU3hPpLsPmr5U0PdS4rTUKB?=
 =?us-ascii?Q?gsFR3PSnvDAaSsLs6v+jri9Vhj/qxUeBJlr7DmG/TjAVNWsmir1m95U5bh6i?=
 =?us-ascii?Q?jUVH6LwK1ajKJ+e0C+373xjnNcdlxMEiAykcGp2L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4de511-6923-47fb-d316-08dd990d5987
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:47:57.4974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 255uQIq20f/lV6SixhfFWNgx6UWq040uVzgIlQVXeU5p+PexGfa62mv8DX6gzmJJeVFNjqGG67q7RfkyQh6t/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7521

On Fri, May 16, 2025 at 12:11:54PM +0200, Michael Nazzareno Trimarchi wrote:
>Hi
>
>
>On Fri, May 16, 2025 at 4:56???AM Peng Fan <peng.fan@oss.nxp.com> wrote:
>>
>> On Wed, May 14, 2025 at 09:05:34AM +0200, Dario Binacchi wrote:
>> >From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
>> >
>> >uart2 is used as wake up source.
>> >
>> >Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
>> >Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>> >---
>> >
>> > arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
>> > 1 file changed, 4 insertions(+)
>> >
>> >diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
>> >index 5c32d1e3675c..fff21f28c552 100644
>> >--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
>> >+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
>> >@@ -37,6 +37,10 @@ &snvs_poweroff {
>> >       status = "okay";
>> > };
>> >
>> >+&uart2 {
>> >+      status = "okay";
>> >+};
>>
>> No need pinctrl settings?
>>
>
>We found out that in imx6ulz, if we don't enable wakeup on uart2 (or
>other uarts that do not conflict on pinout) we are not able to wake up
>from uart4, which is the console.
>According to the TRM and the code everything look fine but the real
>result it's we stuck in suspend
>
>Here is how we are able to resume.
>
>uart2
>echo enabled > wakeup
>uart4
>echo enabled > wakeup

No idea. 

But at least put some info in commit log to describe why set uart2 as okay.

Thanks,
Peng

>
>Michael
>
>> Regards,
>> Peng
>>
>> >+
>> > &uart3 {
>> >       pinctrl-names = "default";
>> >       pinctrl-0 = <&pinctrl_uart3>;
>> >--
>> >2.43.0
>> >
>> >base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
>> >branch: bsh-202505-imx6ulz_smm_m2
>>
>>
>
>
>-- 
>Michael Nazzareno Trimarchi
>Co-Founder & Chief Executive Officer
>M. +39 347 913 2170
>michael@amarulasolutions.com
>__________________________________
>
>Amarula Solutions BV
>Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
>T. +31 (0)85 111 9172
>info@amarulasolutions.com
>www.amarulasolutions.com
