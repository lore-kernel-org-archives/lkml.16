Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011034.outbound.protection.outlook.com [40.107.130.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4882F4314;
	Wed, 18 Jun 2025 16:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265502; cv=fail; b=CopCgbzpKufBbGPBGeRdadCpkmrVtTM2v6A80hK6uXqanX+FOgY5HNUnjEhV5IdDD8WjYmYtpUVGyGf7JMMkEf7/SXTmOyzgNyuBMNwIsmjtWyocm5Rkbbm8Z5WCrv9pKUiUlEqV8J6/Kj7KxGxfF5sq+ZOaCHGRlEBJTI1xVH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265502; c=relaxed/simple;
	bh=hRFF1VMg52Oipq/s8LP1CtfmAjK3sbrSt++LIzyMHoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FA1+AyZMld30JRbLLBC1yGykW4EZG6PE8v26OUTEr7Ap317WAB8tKQjp5J24bRbN2fYEIYItbnUdEusR3Nj03cD3sZ5kF1c9P/VmVEckk3NpzQdTFi19NyNLFmLW07m5ZaLm9apbA4vb9yTeNistW0RaDPk4S3DCzThcWwaLX78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hg24pkaJ; arc=fail smtp.client-ip=40.107.130.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hg24pkaJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFxnj7pB+cE8XXSfnL3Qj/R/gzkqjS9BAaO7c/MLwIXePaSwBt+6CNFhHOpK4p/IWKlmURy9hGIVIaiQLdDBYpP2Eq5VDhSWSNf+rMk1k3kPmVHJBfzfP4e12ehp5P/ak4pvav+MjGjxMGxun+OenjNAZAWGVHgC2eIa24wFrLBTvV4nGfVBZ6/XnlUmRc5p5phjwJPuyv8p4FEP7CeQiSfoD/pRxk7ZgZ1Spx0pINmoGgLYkuqs0QMW/TlVUrK85KnzaqgzFnmGaQbhYYqsToijhBy89Ke649CB6VthqgRDkHwNZKG6/2A5HKIpDJDBeaeyjYk5bGRGXP8esF1qEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpVql0OhYUmbJQjxeJu1rkz+1o6c6n+BgTHqk2b3Tpk=;
 b=jfMyYJ/AJFX2Y3R0jMW1LaU5vWss32jwDEHlgon2RnglEsLVJwM61NMCDZvG5/N779DOxdBxSLEkLTYaDEqOzBcOjWQxRgsvLDc4KbBOL9QOkY51uQ3XYKTKolNBP9cKYpxnIdgPhCOM0FqbJQsDbihQgFUiid4NgyXHGeXUnbP+fpw9Tegw5PofvIvuO77uaeTlNUT6nLzir0zBYDUsQo2701mq85aBZCdDWk7X8+c0J4w1I7Qb8o3Z3xvMJUEtVxkMw+NcIHvIgIVfufhIvX8L4lzoALgJnxx/i1eQU6wK66+rYriWl4Q0qrVRR3nuhlcimvRLoc2/oj5K0/0B8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpVql0OhYUmbJQjxeJu1rkz+1o6c6n+BgTHqk2b3Tpk=;
 b=Hg24pkaJ1Re668lCq/2rTNgVMo1B72/a2tDc/SSGRwNuSiSXkMOILs9CxjRUyEKKaxByifrGsvNDJ8VYhzfeNEGsjLTga6fMJg/oDVO1HHPK+NTDbYkA1EuBbeySpQjKhEfMPydJ2PIuid/aulYeDVuRC+9ttFvjheW78IDqmerWRtf+/+d1ugU8COnjHn1+ly/Po+bdjJCeSZvWBH5yLGsVriPLo9WuczPOLPgLZI2VJ54M5qeeCR8sa93HXn1ZF5U9WX4WpUsCeVXEL4CqicitgkTBad84XSwMNN8vgKTdWe0wmu2yX9meDB4Vhib80FKGiWqLTlqptw7VTVJ94w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10134.eurprd04.prod.outlook.com (2603:10a6:150:1b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 16:51:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 16:51:36 +0000
Date: Wed, 18 Jun 2025 12:51:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, lee@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] dt-bindings: mfd: fsl,imx8qxp-csr: Remove binding
 documentation
Message-ID: <aFLukN0TW3AxkNn9@lizhi-Precision-Tower-5810>
References: <20250618091314.2754169-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618091314.2754169-1-victor.liu@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10134:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c694fcf-fc85-4022-5cbe-08ddae88636c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iMVVWJt98kk2ra4DrFJFA4S4zX8Nhwsd0Xo/f96Z+SWwSiKOOVyDTC/Pow3z?=
 =?us-ascii?Q?LmlGhWZoL1E0x+v5F58rv48rh4ye/8V1tFg1xyQeKXoy47fe99mB/hdvxdFl?=
 =?us-ascii?Q?ofCUWCS2ZysviY4QGfkeIRIGT+R6sWF+RtAVRAoThH9T1aPUmDZJkB1bhWzD?=
 =?us-ascii?Q?qpmJ8sipqQoYU6SoeRRynkIXBPxqaLrXdPuXXDTr8zd9LEIFeJeGgWdKFPX1?=
 =?us-ascii?Q?3NK40eCH0DKvpCnSizaGA0DvrY1WA9fhFLeZfaYykAKbW7dGWazH34g+5ZU2?=
 =?us-ascii?Q?d74dj7V525Wj1R7f8bSZdOcDuNgXyNkD/dqi8C9UE3tg7pytZAI6s0O2Ghdf?=
 =?us-ascii?Q?Q3SEV2Vf0kHLfr725MU7d/sj84gMv93TzHwXzmT/0rRvpqZTT5DTUnAd44sv?=
 =?us-ascii?Q?vzORgult/02Sj/flrNW/wqS2yKs6iLZ3htH2qhzrc3yNiv0Tg+T9X+K3V26M?=
 =?us-ascii?Q?LGBd/rfeQtjwzVb7SjobUWaBTfwOjblihawdzPglwUtBB91tc3EIHXvEwLdu?=
 =?us-ascii?Q?INaQdsNLpY3Tyk8mCxXX0VAFPaIojfuEztPGyz6V8Czdxmx9vXB8nLNxLOps?=
 =?us-ascii?Q?NrvbBfr38xzARpUZfMowW085iJXQ0s27CoWJHkba9dV+m37QdbzZtRYwc6J+?=
 =?us-ascii?Q?1wudrZX7iHtleguyMCsbzEAUIWO+Dvk6SRGKiJlIKo1N7YRs+wOlmpxkD+3B?=
 =?us-ascii?Q?Xbiw3VLQWTF06+OAc65chC5q6WmILHnywkF6JQTiUuT/RrV5mMuz+MPFdhmV?=
 =?us-ascii?Q?cF+9VaMOq6Xmlnt/W6HKzVVbbUnPH6Y9aK7b1qNZq7YMgVyD23cwgaqOhwQB?=
 =?us-ascii?Q?rEyj1YprgU0jq2nWLhLIc91OvBBggPJNohVmF0kQMnRAqze8uAfhERUuHCi4?=
 =?us-ascii?Q?UcnJBCjz/TSJyWoMe1vtd9qkjGY32D2vcTMFZnfjC5bKDuY86JxUxfLgzRbi?=
 =?us-ascii?Q?K8WHxsMXOJogsGtk9fjJ0O6+2Ho9zOZ8bgrChyfZjQOEFCqejOcTwcqMjmxL?=
 =?us-ascii?Q?yqOqua57Whr0h4LvFtW2p2uvgb6hjhgiJk4Dj78KtMVYmJhfc7sH20NwH7cl?=
 =?us-ascii?Q?QvjEtBfrkvgSEAMUfDpTLwuMcSEQCdtHw32TC+OEtZr2Im1kxLbgnFdE6yki?=
 =?us-ascii?Q?xxkS12q0dshI6ZyYndMJ3Dn/EYmtL0jSmGf2GGX89mawUhrS+M82O1tfOYm5?=
 =?us-ascii?Q?Q3XVCxayzJLF33lrK9dbrTYIEbqbCc9Gp1ig0QvfwPkTOsH9gKeXp+nRziHn?=
 =?us-ascii?Q?HAGr7j/PVsjs6eWxQDHF4hmWPl00dj0NIMmU56obsO76zJKQbAdnyH3s/YgQ?=
 =?us-ascii?Q?uhblZIih9OrTvSnGWThEfkOTlpAOKzfqE99yLEdQjiBPobLUi4pNJFqB0VmO?=
 =?us-ascii?Q?rEnEsdlvlhtobqVLDq6Kea5PB3xZ6w3F04JG57ugs2ptbQOkzoR8VH/HAKSD?=
 =?us-ascii?Q?n15PayKUMGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3bvGRX4KzEPpj3skWdW5l6aJ3HQrnQAaW/bChR2zNhLlHQM0mztId3WP0wjf?=
 =?us-ascii?Q?Y8S6IPCwMvDGmGFPogl5ltfgGt0qkF5uUP1oOLIRhMafmgyOnb8kuCOCxC2l?=
 =?us-ascii?Q?JCb8gqUZgrMZ46kf/jX6HKegdvsTtWvtafAFYX7j/uAIjWANrzq3r/q4X5m4?=
 =?us-ascii?Q?2Dnalp9PwirKbtyN55cPN7FXo1OHRtebb0DY/VK6gCzBkbst0zXqAwtNov3m?=
 =?us-ascii?Q?dWw+YqcfAwcU8a7n9xYczIcEh0AL2K7l40i1uGExTmjOuf2jGUGH93kYwgnn?=
 =?us-ascii?Q?Y68iHZ5sUUHnSpnO4CsM95NMTOs5p96ANZxxJVvw/hXo2fnQ6EtorOzA967t?=
 =?us-ascii?Q?I+0r3xRWQACA+kRJMunjutWkda6IRYH4WjnrcieeNqgTEWOBfZCdWkcC8DYw?=
 =?us-ascii?Q?mqgGGawcPZVc54I0d3eysjlJye4A5vAvROBfjVi8VENJFpcb99SM+gy50Yyi?=
 =?us-ascii?Q?N4YMMi3r8pO+KzQ75qMst+UHnYxFMMo3jiPZstB6loQbynO4KuRMIRvuJMtM?=
 =?us-ascii?Q?IFDezg4tKc7R9vetsjfQUgMXvOCVLYSR6jjdbc8fBhMlYpVu9mo4zuT653NV?=
 =?us-ascii?Q?hUOCqBeVhQ6QuF6n80R4bDDHFwP6rN5KOiph+y7Jdm+GanIDJOI2HeeqliLv?=
 =?us-ascii?Q?YC8skpUvH3Kx0s80mnTllNaDiaajuJ49OZxQLcOetuVDamZOvvnp2yW8y3ji?=
 =?us-ascii?Q?qZ8tbUqV+y5TWEd+PnQemtH/e4dRHnxY4LAj8JGhZfOwLFGaOJbT9LkWPeRL?=
 =?us-ascii?Q?VJ/yLzlqDdMaOhDnxL+FC/yEw3wI9+6OpHUHfKjuxtnhbpdVqtdfYhUZlxIz?=
 =?us-ascii?Q?ozl2yOvJpAlcVBzBjLYPr3E22G2lUJpHCm/Qc0WMEqTl/KURugTDEmIaDIiG?=
 =?us-ascii?Q?3AUf0XtFsT00ddHjLaDol2WSYWFgIZNz8TXoL9GXj2Ne8udL56K0kOPVmv7y?=
 =?us-ascii?Q?jv5weZ1LYr1aNIrYZsTgsCdaSxDw7Tm0aKy6PMheWrip6XjSU1/2BKYFuxq3?=
 =?us-ascii?Q?OIJLW5cIu3TfZCrMmQp0X/H6vp1msO22v/RpTT2OBgRI7ucXjkqe/Q+pPQyE?=
 =?us-ascii?Q?e822eR0EughrDNlBSqg/ohOsFXkr3s1fUujCGh8EjF7T6DWybrSQb15Rb7fZ?=
 =?us-ascii?Q?SRPzdC7Rpi3oLQEI/N2kU0YEpbk5NsL+z3S7PFiWbrVCmlU5SieKFj+Gah/j?=
 =?us-ascii?Q?6Nu0nZHi0MTD9XwTEnlbGcc1bnq9Pdz4YGrMiAAAEsuEI2Uj1uW/7l9uI45w?=
 =?us-ascii?Q?9lu5u0mC0dwJaQn7WbFCKfFlms9gVrfPM2rAZ/44+5LHuEXkXw0LjQmIkJqk?=
 =?us-ascii?Q?1UgHs8Uikp3Uj9664/tz5ysZTOLO4JUQdxd4MmGvjHOrfxBF0b2kDuwQy4kC?=
 =?us-ascii?Q?tPEaafbil/t97YUnHxS/UOadGrXto8nhCqGygVDg1pYRs6egEO2Plv+M2hyL?=
 =?us-ascii?Q?F1UiDszBMIZU9qYu3qoLXf+lt8OG4kP+RBx8nogKeRinwuZYJNAeGi8O5mze?=
 =?us-ascii?Q?kFbvmFzVzV5fTczq5k2TV0n/5xsklUpAu/5Gdyd0A6tFlTvn7FsQrbXW1Z6W?=
 =?us-ascii?Q?MP1hzrixJyxs/izuZzQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c694fcf-fc85-4022-5cbe-08ddae88636c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 16:51:36.5114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRCPkNMPBiMZ8WxVsyg3CqtryiABrmCVJY7yD8+dO4D9g6zBtmJIviypwSuGGoFvybJfiLJBKtVE/tCEAkMnoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10134

On Wed, Jun 18, 2025 at 05:13:14PM +0800, Liu Ying wrote:
> commit b0a5cde57cf1 ("dt-bindings: mfd: Explain lack of child dependency
> in simple-mfd") pointed out that it's a mistake for a child device f
> a simple MFD device to depend on the simple MFD device's clock resources.
> fsl,imx8qxp-csr.yaml happens to make that mistake.  To fix that, remove
> fsl,imx8qxp-csr.yaml and use "simple-pm-bus" and "syscon" as compatible
> strings in the examples of fsl,imx8qxp-pixel-link-msi-bus.yaml.

Does anyone use fsl,imx8qxp-mipi-lvds-csr/fsl,imx8qm-lvds-csr? I suppose
yes. It'd better said no one use these in dts and safe to remove.

Frank
>
> Fixes: 9b2c55b5403f ("dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers module binding")
> Fixes: c08645ea215c ("dt-bindings: bus: Add Freescale i.MX8qxp pixel link MSI bus binding")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  .../bus/fsl,imx8qxp-pixel-link-msi-bus.yaml   |   7 +-
>  .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 ------------------
>  2 files changed, 5 insertions(+), 194 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
>
> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
> index 7e1ffc551046..4adbb7afa889 100644
> --- a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
> @@ -103,11 +103,14 @@ examples:
>          clock-names = "msi", "ahb";
>          power-domains = <&pd IMX_SC_R_DC_0>;
>
> -        syscon@56221000 {
> -            compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
> +        bus@56221000 {
> +            compatible = "simple-pm-bus", "syscon";
>              reg = <0x56221000 0x1000>;
>              clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
>              clock-names = "ipg";
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges;
>
>              pxl2dpi {
>                  compatible = "fsl,imx8qxp-pxl2dpi";
> diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> deleted file mode 100644
> index 20067002cc4a..000000000000
> --- a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> +++ /dev/null
> @@ -1,192 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/mfd/fsl,imx8qxp-csr.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Freescale i.MX8qm/qxp Control and Status Registers Module
> -
> -maintainers:
> -  - Liu Ying <victor.liu@nxp.com>
> -
> -description: |
> -  As a system controller, the Freescale i.MX8qm/qxp Control and Status
> -  Registers(CSR) module represents a set of miscellaneous registers of a
> -  specific subsystem.  It may provide control and/or status report interfaces
> -  to a mix of standalone hardware devices within that subsystem.  One typical
> -  use-case is for some other nodes to acquire a reference to the syscon node
> -  by phandle, and the other typical use-case is that the operating system
> -  should consider all subnodes of the CSR module as separate child devices.
> -
> -properties:
> -  $nodename:
> -    pattern: "^syscon@[0-9a-f]+$"
> -
> -  compatible:
> -    items:
> -      - enum:
> -          - fsl,imx8qxp-mipi-lvds-csr
> -          - fsl,imx8qm-lvds-csr
> -      - const: syscon
> -      - const: simple-mfd
> -
> -  reg:
> -    maxItems: 1
> -
> -  clocks:
> -    maxItems: 1
> -
> -  clock-names:
> -    const: ipg
> -
> -patternProperties:
> -  "^(ldb|phy|pxl2dpi)$":
> -    type: object
> -    description: The possible child devices of the CSR module.
> -
> -required:
> -  - compatible
> -  - reg
> -  - clocks
> -  - clock-names
> -
> -allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            const: fsl,imx8qxp-mipi-lvds-csr
> -    then:
> -      required:
> -        - pxl2dpi
> -        - ldb
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            const: fsl,imx8qm-lvds-csr
> -    then:
> -      required:
> -        - phy
> -        - ldb
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -    #include <dt-bindings/clock/imx8-lpcg.h>
> -    #include <dt-bindings/firmware/imx/rsrc.h>
> -    mipi_lvds_0_csr: syscon@56221000 {
> -        compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
> -        reg = <0x56221000 0x1000>;
> -        clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
> -        clock-names = "ipg";
> -
> -        mipi_lvds_0_pxl2dpi: pxl2dpi {
> -            compatible = "fsl,imx8qxp-pxl2dpi";
> -            fsl,sc-resource = <IMX_SC_R_MIPI_0>;
> -            power-domains = <&pd IMX_SC_R_MIPI_0>;
> -
> -            ports {
> -                #address-cells = <1>;
> -                #size-cells = <0>;
> -
> -                port@0 {
> -                    #address-cells = <1>;
> -                    #size-cells = <0>;
> -                    reg = <0>;
> -
> -                    mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
> -                        reg = <0>;
> -                        remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
> -                    };
> -
> -                    mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
> -                        reg = <1>;
> -                        remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
> -                    };
> -                };
> -
> -                port@1 {
> -                    #address-cells = <1>;
> -                    #size-cells = <0>;
> -                    reg = <1>;
> -
> -                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
> -                        reg = <0>;
> -                        remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
> -                    };
> -
> -                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
> -                        reg = <1>;
> -                        remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
> -                    };
> -                };
> -            };
> -        };
> -
> -        mipi_lvds_0_ldb: ldb {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -            compatible = "fsl,imx8qxp-ldb";
> -            clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> -                     <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> -            clock-names = "pixel", "bypass";
> -            power-domains = <&pd IMX_SC_R_LVDS_0>;
> -
> -            channel@0 {
> -                #address-cells = <1>;
> -                #size-cells = <0>;
> -                reg = <0>;
> -                phys = <&mipi_lvds_0_phy>;
> -                phy-names = "lvds_phy";
> -
> -                port@0 {
> -                    reg = <0>;
> -
> -                    mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
> -                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
> -                    };
> -                };
> -
> -                port@1 {
> -                    reg = <1>;
> -
> -                    /* ... */
> -                };
> -            };
> -
> -            channel@1 {
> -                #address-cells = <1>;
> -                #size-cells = <0>;
> -                reg = <1>;
> -                phys = <&mipi_lvds_0_phy>;
> -                phy-names = "lvds_phy";
> -
> -                port@0 {
> -                    reg = <0>;
> -
> -                    mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
> -                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
> -                    };
> -                };
> -
> -                port@1 {
> -                    reg = <1>;
> -
> -                    /* ... */
> -                };
> -            };
> -        };
> -    };
> -
> -    mipi_lvds_0_phy: phy@56228300 {
> -        compatible = "fsl,imx8qxp-mipi-dphy";
> -        reg = <0x56228300 0x100>;
> -        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
> -        clock-names = "phy_ref";
> -        #phy-cells = <0>;
> -        fsl,syscon = <&mipi_lvds_0_csr>;
> -        power-domains = <&pd IMX_SC_R_MIPI_0>;
> -    };
> --
> 2.34.1
>
