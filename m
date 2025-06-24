Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F9298984;
	Tue, 24 Jun 2025 18:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750789086; cv=fail; b=ufC+mk4QxzBLA3rmlMehrcKmvSwnmkybI5F5aWp9H5Hg7dLEunwfR7+ONjJn8U1wBhRE6JbTdvQji+l1Elrj8wUAB+NJKwbxazwmfSOReRNL3BPU33iwJImj4xtMmnxE7v/ZA+AVXi55B1pZXAETJG4upy7cSkipdA55bLkyq5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750789086; c=relaxed/simple;
	bh=c6Mxgsw2Aw9HKomN6okmlg3Srf5v9FmdpZo7p/Kcx5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uNDFS6NL7X0ySODVxhf6a77qgkzOaTa/sNDNnv+FXQ/x1jwa3O70e1aPu5xVXT8mC5jdB2JjY4SznlgOG8TaqdXMSL+AP0W3O96GaPHciEYVPRnz9DM2+/+UzmDvVWcYdbhA+X7FZ+Wzv8aPvvcx16/wlIsugHYWF542ub/ju6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YZm2AQ1s; arc=fail smtp.client-ip=52.101.84.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YZm2AQ1s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVkMz8sTwfB0tuNU+4qKRBk1Tz00E0/Jxv9oP84JYSrCvJYXSyRVvTHCZOfzZpKrd7ILHnA4Y4D54S/bfpMswpU+k/NFZtEGIamysI0W3C8R4OZJg01Sxjk7/O2iWDzckvDB/9Vkexa9p62rcJyzzXqJwvd8LLGlmhA4MkEJlkh4Sa8NQGn6FdIKbI8CUaQ1A2KVbi6K86JqlYEtkLMZqeSpHGO+pOyjk2NylDD52D5k17fShV1weGnmvqzpQsW1Iq92nk8bsfmN47k9G09as8QfcECnW/6XKGGj+Rk0Ts+7DanAnt7E2egKtTs6rrju5RcFUQyDAz4BDye+ZSSNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC6+SaWftrasBGRQzbVVy8v+Pif1K8RlHhGdyGpXJS4=;
 b=HqBn24z821Qzj9LyoY/3BTjHobIbbkpHfebhtz82/6ghDQNTYuYH1DNSYNsEz3IfcTjIBke+2Hu9FQ52hFgCHpYQHuoSZYhfQfBp2Ux7QA+c2kzbJc6svcoeeqj3sXL1WkOGRWnzzlCKpIMnMHybK5dZVJzxoK/MpEKhX4m/tbOhFIATJjcgyitPmUPCGP+ARWqwgz2Q5W5j53oXeBR2KYdGgZxbSiDgNpC9MthCGrwBCCbS7VUZySxikpcDYuoxGYzcE5vfKEwC/a+NpVqBwl3S0BbUc2ng+ByVBoSK2DsxeddYjnvDZxoCF0xHgdiU4HIXAPd0m84PIsIBGRjYYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uC6+SaWftrasBGRQzbVVy8v+Pif1K8RlHhGdyGpXJS4=;
 b=YZm2AQ1snTC1VyX8RbG856Bq/izyji8NAiP2s5WF10xXy8pkg01ujixLlZLQpDsEPNdBElpWIoAhuKW+UpeO1IRD6XD7EISJJuqjxmqXacUlJCipjtmEmWStiKEuYeSvDHTaG3RDk63pV+l7nQ1/BICY5b7CsLssaRj881RVzkAuYak+sZtG9Uj7jXyCV7zMDFJL+jUWurD5zLpA4dH0sHuVyr/ojX/IgoaSodTQiNRZ56CgdY0mz8wXZACzDC/Fqz4MR3/irw531NVrChKC/AQy6UI7gQfoifCNOAt5JCatY3I8B0QcRIwRqyD3uFGAsrQW+mFPQYOUsIBFaCfT/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7514.eurprd04.prod.outlook.com (2603:10a6:10:1f7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 18:18:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 18:18:02 +0000
Date: Tue, 24 Jun 2025 14:17:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: freescale: imx93-phycore-som: Fix watchdog
 reset
Message-ID: <aFrr1SWLbedBXot7@lizhi-Precision-Tower-5810>
References: <20250624061323.601550-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624061323.601550-1-primoz.fiser@norik.com>
X-ClientProxiedBy: AM9P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9a2127-e859-419d-9eef-08ddb34b74a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JmzGWwenA5YMQN+uG4WycVxDNQbw0HvZ+4YKoaBb0wzOrMjPakZcApOTqUn6?=
 =?us-ascii?Q?5N9eISpnAjm5BwILUoGGq39/kGopoVz3oJivUQfFIon/XdHrK5BJzpfvSyDt?=
 =?us-ascii?Q?ooT23H7tEF7YQ2rqBr6UTeSYamRHhptSvsFi4UDAFXkQHwygLjkaGy3RoKji?=
 =?us-ascii?Q?nIKKZ102kb31tB4eAr4U/TGSgatSTvr4N+sXcLmTkcvDCZoJCYDXA7KuQHct?=
 =?us-ascii?Q?tpxcwQcCan4Kw1CMT7W0IIwxVu2aZwq7d3qnmFqr9N22qYtDMnbZQc+ELMOa?=
 =?us-ascii?Q?pBK1wqzwp7Dx8QQ1B3kZENz4k3OZDvxfaHshKHBbhMq4Se2mYwwPfFFGHK6l?=
 =?us-ascii?Q?FxesZGvX9j+FpVA8EkYKRtyA1li8KZ4iK3MgvEPF82txS2auqgiA1hqnMI6D?=
 =?us-ascii?Q?hrG6yKw5tQD9t+ZQdVEHE7zvyEGCsH5IKs0XhwieXUxp+erY2nt0S/mu/oWb?=
 =?us-ascii?Q?Z6Fzr0D2ggq2e3bezSe0GO5tfC2PRrKCtYwCIYIhs+K+nGf5qP0Cku2ebMeb?=
 =?us-ascii?Q?H8yRA3lxrh8iri3CfruZ75c7hyCH47+UDcOFDXdjqqsaHyNBjrytTl0m0AzB?=
 =?us-ascii?Q?TWSN3Ebkk///kRGgvPQ7RsJjVJNspFJVm/zg2U7ogMqAnMcr7aZY9Jjlcqpe?=
 =?us-ascii?Q?24RYr7lxzJWnN4gNlNdVfFgpWMesVs5J6rIK4GaYdKjxUcWDtHs5W1PF8nrR?=
 =?us-ascii?Q?neDGeICmQc587AntzVhP6C9Hct71uEscgR1cUMLkdgmzKU6aL88PqUSDcris?=
 =?us-ascii?Q?kRKVnA5LHGyAySvKMmPmVEjdtq/nZ/PiQIW/gXz+oO1l9tzqjr2AA9tduiR9?=
 =?us-ascii?Q?FsgHjCbpwvQUJ4Zv3XzDZpFTuxiIR5kuu06C2kAASK8+0Lk9rquIBjf+wzcW?=
 =?us-ascii?Q?zVVv7J/6aMjbB8iR1+GBm0FzaFy27Uu6lph/0VIlN1IVIPH7u+B8+LyZxD/L?=
 =?us-ascii?Q?iui5vRo/sm7K9/yqfLbflUOg/tvt6KJXDNB+xo7rn+se/CK9e2y6RHr995GB?=
 =?us-ascii?Q?zuG2lzUw3ROBPw3FN0GqJwhKUEPO2GWAwEVKLz3jbLVh3o8NyLzgiwanclZI?=
 =?us-ascii?Q?tU4UXccDzVhhAvMALj3DukipU/5owMLwlNFyTZ54VuPOLtryK4KHrcB4RO2J?=
 =?us-ascii?Q?MkoFU0LmvHDMDNYGFV3ovK1D4e3yuO5CXdXUTJD33RAmI2u9dTyZA40A9gcw?=
 =?us-ascii?Q?tiZhtiS6NHnATUQoKBhl+Ti/hT/42bEHHqwB6jLSUZ8YoyEniEy/aKxySBjh?=
 =?us-ascii?Q?hQOj8ARZkEU4NaH1jBkptLyoWJpD5EC5wl+alCA+QJzrE/X0MOM+PwiwbJVY?=
 =?us-ascii?Q?ffaLkU36zuKBbCsOPX51A0w/raINNbUQKsJsNrGmlPZX7aNH+W4gU9fyRfGj?=
 =?us-ascii?Q?r9ecWNTnk8YRstK5Y3oTULIVSD/MRUQrdDyk8TPyBWqWzI92JfIlrDm+jE3W?=
 =?us-ascii?Q?VSNURVdsvZWJPcnPZIerxDZ/bHYU6DI4d5xN/ync3ZkCsxMMDMGZww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RQZmzzZ6jma4ZwaNXd3fJGih3BdxPKGlO2JQCULl0pyQwDylqOw2Sg3hhKc3?=
 =?us-ascii?Q?B806j+qfAx/b4dgFx5BM6zTMy28ciszRbSvR615DLcKm7V6o8g0WZzDnLkjO?=
 =?us-ascii?Q?IQMiPI3cKjx5eG5rauxwun+pGkGm25Wk8XugPmJCGhEmIW2y9alZ8EzZdmTS?=
 =?us-ascii?Q?ejfhvDE+yXIxibfE68huXkg1aB777XjyZO7jhVF4m73KBrz5BjYWLh6EWDY7?=
 =?us-ascii?Q?Q9xSAfAzgpDF5JDtZa2injLIcCPNFDITVTJFHe+B3X36jmX/LOOvRVE+/SJB?=
 =?us-ascii?Q?RC0/9hWSU6NysskTbf3Aqb+a4pOXCFDzp2RqcyShxqDPUgIEmIeJTaO49ZuE?=
 =?us-ascii?Q?giOHWAvRO/hR49DSaJ03ucAex/Xo/PtCxPKLbhPdJHyGc/wHBOqaVteyn8NW?=
 =?us-ascii?Q?aSVarOXrZGqEmZSmjY7MLyzz7cAivn6GP1yka49DjBI8YqiBq6LpgOUijEfK?=
 =?us-ascii?Q?TSYTqhRAcJzL1h3muLxALmI9xq/DsXh3GW5kF44H3lsO6eJ5DabIW79vfZkL?=
 =?us-ascii?Q?W/bNtUS3N6obLeTfHPqJWoK+VGPfzdsZ0XWE4uOtsVqAdovKDSuf1xcqUdz7?=
 =?us-ascii?Q?RrufW1goCrcZVj0byOfDwAq6oJVLYLlsBQhZJ8mVtxB8XSItMua0WjgY6SYA?=
 =?us-ascii?Q?2XLxk26WdWUQySx99+Grw5ZRcmqNggfAGOeaIztDyePnykWeRmOZ5KLiBhOg?=
 =?us-ascii?Q?DgG7N/nhFsSRAseXLC33zqOHsbxo7scZVGpfq2F2aGVXNUIWJCMxZ7jfMCMJ?=
 =?us-ascii?Q?K3K3nVA7mouHMPcewh7j8NXYSHJaya3oTJqPfRMT88syOsZ9w5tYjtDu0iQZ?=
 =?us-ascii?Q?nYDAJSR0cJSXlHbvPnAX979Y4IRsxU/W2D/hHifHR2ZJl5dSdUaMgmaoA99I?=
 =?us-ascii?Q?7WCvbmyzhVtZ7j6NG14gTeMPuTh32MElx8Hvt/AlPzrNAl0LTut2ASLEsMag?=
 =?us-ascii?Q?r7Q3mDlBFohhROpTUXrVKoZqDM05N+r9f1mKroRpdXugnTiBZmMbMNfDSHGk?=
 =?us-ascii?Q?GupFFpfkGKWo1+rmZ7YoNfHht7Vyv/gN5qb/7pJ8GeyE4wKW7DTEIw/4Av9N?=
 =?us-ascii?Q?OUpY8jZo66rvmIrvpcf/Y4q7sZt59/rXxv+MRW2xHyXvrPF+lYYU6Gj7hoRz?=
 =?us-ascii?Q?kBSdTR8VqV6sSAWIFM78efakM+GHbKPIj/3ZPa4M7S0Si6K0Kp341dvt/P4O?=
 =?us-ascii?Q?3FWk6rUrPXaypQsRIzvMjsoB6LVXk7aZv/s2cvTyfjL5wL7+sYlkE6iQLrKX?=
 =?us-ascii?Q?XScSv3hs/XJUrOil8ZWQSV8pNpMZ249xSlap5EQL4SkR9mDXaKGS0NzGA2Y0?=
 =?us-ascii?Q?97nStlUAp0M0kdMbpRKr7A2llY90Ysvett2uprNu9surbGltjX/jU94gaDXQ?=
 =?us-ascii?Q?qHRgQPRzJlOFIsVw+5DgRzh1FQTDrP+VLQ4OamApg9zmLbyqydRfnoK9PSRB?=
 =?us-ascii?Q?dtrtJ6t9wqgN2UcC1dAf2WOtA/u1UpBtR+XItbus6P1OD6lVEO7xgQ6Y4TFr?=
 =?us-ascii?Q?MR6EwwhmEAtrooKWR4U4lalFEv/NAvQOH7JJZ8hGdArER4+3Pm7A0HVw6T37?=
 =?us-ascii?Q?mVI+a9AUmljfZGT3vRRqngN5Pe0k2usbM6OAcob9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9a2127-e859-419d-9eef-08ddb34b74a6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:18:01.9775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: digDbFsN5V+ehMezI9hdQSt4FljN/97P0O2vK0xehB3NKDq7b6rEG9uN+Kha8DK6CemiMWU2CxXzM/0uCPnhFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7514

On Tue, Jun 24, 2025 at 08:13:23AM +0200, Primoz Fiser wrote:

subject: It is not fix. suggested

"add watchdog ext-reset-output pin"

> On phyCORE-i.MX93 SoM, the SoC WDOG_ANY output line is connected to the
> external pca9451a PMIC WDOG_B input. Apply pinctrl and set the property
> "fsl,ext-reset-output" for watchdog to trigger board reset via PMIC on
> timeout/reset.
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 5ee52774e7bf..729c26f9ac94 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -191,6 +191,9 @@ &usdhc1 {
>
>  /* Watchdog */
>  &wdog3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_wdog>;
> +	fsl,ext-reset-output;
>  	status = "okay";
>  };
>
> @@ -279,4 +282,10 @@ MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013be
>  			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x179e
>  		>;
>  	};
> +
> +	pinctrl_wdog: wdoggrp {
> +		fsl,pins = <
> +			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
> +		>;
> +	};
>  };
> --
> 2.34.1
>
