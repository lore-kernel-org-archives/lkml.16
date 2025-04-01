Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7281B1E5B6F;
	Tue,  1 Apr 2025 21:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743543063; cv=fail; b=Xqy9V5nhYBkOTEB3wZ7q6CB6O0ak6CN0fB+YEl2rJK1zV1kHGlNnHUl/7bDmJRb3rMiLQRNAIdK8g5d3CzdojAjSmzLzqFyTiK7acBL4wi90cvxt0YrHRBd+66pgh8tRnWRNxd8/Du9j1Ns5VAO/cCY9uy/mE3yj/1mrO34cbFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743543063; c=relaxed/simple;
	bh=Ljjmib/13k76cH2HZd9RLvIkUmPBbLt8dpnslRLCarM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tu4IPHkj2qqYOZMjHIpKSd+EBrluSghpWsdRwjgsCQJHRFCI48SY7ryj/jlreGfb+EJpKRMX3oE6qwTi7M/k7PjHdWGoGTPyCHs8vzq7FK0BiBbCeLUA7udGCnQe+FEfVXdSKp4BdM4TUjeL62O8vlXF8D2snqatwY8Wgx1yMnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c9ved138; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c9ved138"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rs5GkDlpSoTz565PB1/O6qa1k2Rj8epB39UafnKCasV2jVGuHG45UQfK5GmniN/zP6BYPkvPGe9aOj1LOpxI7NLgriT3jwY2s+B88wQ/EsTJiw3Njtzu5OKgW2k60Z13UfbcyVUn2ZOGD0E4nVtG6aBew/w+jW67YOFJGpdkHBNaIkYDL08TS5UOQWkB2e+IDnQdNFJZef+u74wq1OoK7XValn7RwwxLIxsb4DU7LwOMjS07WdI+vtgdFmJHfiizuzmXTW87dlMCXXaTbJ1SUgSwAHc86a57tU2WrloPJsQ5hTuKaMG1ADmFjFvR84RIsRFJBPYQZOUT7ZAFT9bcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USx1mhB1Wud8cpF03GE7gyrWTXAoVas9THO+2lrNg3w=;
 b=fCwHQReepDHN1XgwlLwUIimv63iVj2S6KsNekILy9pGXxGcKIHhXrCfwkkq9o8h/Va7h1CXYrk+fYKp+sLSmmMgfVhQVBW7qA4Jq/14SZWmzFaFn+xp0VdsOVOoPz4bbEexu43adjc1Y9yjp4K4lbTSUQ8mizAnurOm9/6L4sUs1gquVG7xliz2wQ7uxsFAkJWOjVP7QSbqUSggzTQ1NnI9E/oKC+8KELc8BxjMSKGfI/lJOwSei8IH25x1490T1emcGygSJz9LCouI+0jW1DTt++2ul0QRrAeOF8vEk/GLA1v6del3LhdoubSYBSoQqkwZyoxGq57A0RRDVugAnmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USx1mhB1Wud8cpF03GE7gyrWTXAoVas9THO+2lrNg3w=;
 b=c9ved138P47leTbCeVHhFH1Tz1RqpkLbYSvaFF/EjGY6bO7+B86I/ova/6iM0y7vnrwb9SfFXhv4IWTOeHnSPEjRm3Al0j3Qp3oqKoCNcLmsUobdNBli0qON/h/hHhKA5TOp+5n6CW8cSMx8MyCPKPSZIqTY+1pmUBQr03JEfpcz3aY4jk2j7lH1MNBakOfZKWNgi5++cOf1eqePwbWGVgWo6lSOOe0YOAK7/xyHwvHhDNOwmVkNTiq/uloCbhkceDrUKmc72MfpxQYBBqN8BRxBFcsHxjbfvnNQPAqtWX091fdhg4Q0Qe9CVxkT3LoMT6IWwLQ7QTG5/45ak+yrng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10204.eurprd04.prod.outlook.com (2603:10a6:150:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 21:30:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 21:30:58 +0000
Date: Tue, 1 Apr 2025 17:30:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Message-ID: <Z+xbCXDzZd1ENMDz@lizhi-Precision-Tower-5810>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
 <20250401154404.45932-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401154404.45932-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10204:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f1fec4-0948-4dae-ff20-08dd71647e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N85QFZ7pz2y2LUwWftv7V+nvDksu7QgSzD35cmD2zDKqWQBKZzcF2xWOzdLN?=
 =?us-ascii?Q?7Q7zZPu4cD+rmBxCyJ4R95AJo6dUGPIloYdxp3smXJqZS/nAt9oE+H4Bq3kp?=
 =?us-ascii?Q?MBBeq+PG6Z+htzqVuxs0Qr8wF+1gUgIYn58npD5GlGJ50O74DRWpYMfftORd?=
 =?us-ascii?Q?aj0p/pGU7M4SwWIbBKgFK66DL9OtGZb5V30hWqPkV5MG6+aZVwPtqvSfeSGq?=
 =?us-ascii?Q?WHPWcyO55tLdIpjNi5J2dplJj4DxLN7uCddnX57wdrLzaAZygcn9GrGP63vh?=
 =?us-ascii?Q?5optotIlT0FnzRH2cPRC2Lu9VioTXbBR3tNGQsLIqEiXFxZ4cOf6ulN7+WrT?=
 =?us-ascii?Q?8/u8TTf15292yHL7DOsziDwhJMEwLER+vdK9eH8RXw3zMxq0Gu2AuJxExeBV?=
 =?us-ascii?Q?CGE6GBwDP2rrN0hEzM+0h3H1TPBPTJY2/0rGTRnVcjyeWBXnT6/am9Q3fiQY?=
 =?us-ascii?Q?N5UuS4wHITWF2SdZDf3+Qo6UsMVU0QWobmZGZBW1akUADx326t0RrElsWlXN?=
 =?us-ascii?Q?Dqzjz183Ai3vqaEcqPvo00P2SQNbeGUKx0SY6LSz7FzOjyqTN+SQylU+Jn/p?=
 =?us-ascii?Q?Q/3T1aklZMfY6glZliLHR/DxmVJ7gx2NXwSdsxxVPtporgpmA8eyGcZPYnE7?=
 =?us-ascii?Q?w+yR5rcLiGyu9C3azhEdiZqZ0pt/FVRVriWBJMD+G/6ogMMJoOYOzFcXE3jX?=
 =?us-ascii?Q?GtQjEs2etzGR4ujz4OqgkB/p7UR2xgRHlHpPei/57EptHHF0496eGUqdky9N?=
 =?us-ascii?Q?aBwYgmDf1+wNuzeRQzumTCt6G8lRyDShfygUtQFCUaipTlvmIcRIAHYp1vnc?=
 =?us-ascii?Q?4y5Xbr7uSAps57VjeDpR+00HEGPhybySs+Mp9iLFLfYqVyk7Ft8t3l5cPmcO?=
 =?us-ascii?Q?EdgVx9iXeZqEDCHvACvvbaOVl2L6iRqqR0fHW/8klptnQ9iqDz6CnYOxYzQY?=
 =?us-ascii?Q?iHra6VybWK+IzDUNbqcU8mVfWJtpJGqZow8i1XOheEOCGtKOo2Ul+5nNsFmu?=
 =?us-ascii?Q?Bxk6mQEVRLb7j+DuNDrtnWcAZmUhsa2al2X7pjXdR1CZ9wgkQmILLMT9VWQF?=
 =?us-ascii?Q?3jDYLQ8xT0m09d4NsRiFnTW8nK+fYNXHyiqfofNCokOyja9lcFXRQDzF8ANo?=
 =?us-ascii?Q?EfCv7wL3Rt0rHSYIQrJ9jUQxpTNjgTq39dZHh+0bya3BlMYW2ZkHb1s6k17h?=
 =?us-ascii?Q?j7z/YOxW7H6NgGzn++kqEkFBynV/t0EWZyTGlNxGVNjaENr0bx88I+e4GuH+?=
 =?us-ascii?Q?SRUqLRsQ9QKdQcE3cZlnQY3bP70xM+s/nuJRw33+X/rpkVwIG1UBLLNJNrex?=
 =?us-ascii?Q?735EbBuk1SdueJ5oErmsk/iIsdXRh1S+I470AVPWAjuWgsyVWzRB7yfwZ1IG?=
 =?us-ascii?Q?0h2eO3BEMrqgNNmnFsbA32KVbKoyo7O0gTX284abH36zax6/aPhoqnZniqRY?=
 =?us-ascii?Q?lVE5HdrISbk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u1tX4+DI4or/cdo0yGR8rTVF/kghlJdBpm/kkiZEFRMbdkIvRGVSAw7pKu5T?=
 =?us-ascii?Q?FfHWIhAb/QgtaBZGwJnJWG4tmsJPLUo+hVdbJPxBi7XoL7EzSudTweq+A8hv?=
 =?us-ascii?Q?yXxUs/mEpG/LiWmnMNLIuXC35uszHgy3eLNJi20M0wAegeY06W4XbFKSqRH/?=
 =?us-ascii?Q?z1gdHedzJ16vmQjs7GTmPfFBUibs8uj4T54Hw9hUoantnGHjHRofZpk3tXGH?=
 =?us-ascii?Q?IIiTSpC3ua7vMYxLQPZhTw3xUL1vBWbJRxzG1jduds5ih0SvyNNJ0e7XMHs7?=
 =?us-ascii?Q?ln/kdSxD5yFG1uYDSTEqubG5EUM8F+YUY98RnNssP8j5/r1KOp/LitI69Cd+?=
 =?us-ascii?Q?sxqQDs9tjDOOJfjVkL3GHBdteEXupJMtAh/7WvmDnOxYsZH6jN6m9PMfaogZ?=
 =?us-ascii?Q?BHknMQ5mOo4+XR6JSu34DJXmgNjpJrxswkYQEjSnIKN+GiYKhVWZxhlkz38U?=
 =?us-ascii?Q?j7+n8uzM9LJJOMLCxgFw5ZYEoAeEQCdLaALpkKx17e1IMle+8lnA8TI1lOad?=
 =?us-ascii?Q?wl/y2lEhp+U3PkIQ+WYhBBNrtPtICwkOrMsHJZxac8mqB/FpyZp0kCIPNUCn?=
 =?us-ascii?Q?s9uPbAL6iPCnmBEub96CltSKajPnCX1gF64WK9xHV3I0c3g5xGPvkDNFULuX?=
 =?us-ascii?Q?EZBbHChtWT3EowqoWZ+bYFeaM1xZY2fDoie/a93GVHPFDPKaXEqREdY0S/bn?=
 =?us-ascii?Q?bwEGTTdYPMgWnXD5ZyUy4JExD0L8TAQUEiM9qBmBcS0guksQPdrID2jiZ+SM?=
 =?us-ascii?Q?cWgydH+PCjd6yaGjoEFFybh8eDMzmfdiveMCO0VzZrNu8T2WnG+yum1WFtnt?=
 =?us-ascii?Q?ldmSm6sUD9D0FtwQYJ/DvtTJd0prXJz2yW8yfMTHjDgjlObjFmcw5/WYd/W3?=
 =?us-ascii?Q?X7/Ttsy8g5Lm2EqwYxT/UpFvEvlQ8lrZOIZWjwF12DuXxKm+JOc9wQ3LLNyQ?=
 =?us-ascii?Q?VmzUBZnMMUCndwrqmpAHsESgQP8rPJq8pwaAlMcQSwR4R6swkgVy05ZLOrRj?=
 =?us-ascii?Q?DKiFdkdRxag34rUHhPPct+r4bGG8Fd0QfNrw5+kz57vAmjfHJR5RkVsJSbTE?=
 =?us-ascii?Q?pN50ajPmtLEXpYP/wIsf39D1/9q2je7z121dEEe5UiJN+RLUjJjYofdVDTys?=
 =?us-ascii?Q?UOk/2MrF6qjWKcB65nERIgF7rGRA0EyDrwV7kucnWMswYcc+CBDBDwLBDVTJ?=
 =?us-ascii?Q?f0+qww/n1t6ulTxkdyII4Cd7DDA/msqWb7swPfxAfornryHDJ8cA+VZq5oth?=
 =?us-ascii?Q?EoebDZCHRvpf0ZyXbWQbm6y2iEm/of0TeBVDrUPVWDOgl+A9UMvTXdrjd/Kh?=
 =?us-ascii?Q?hHdwBzvaQh2m/GurP6/ILTGKbwHY5HDfz4G6bFdRFzelUe/tBFIcXKLDkXkf?=
 =?us-ascii?Q?IBp5bJ5cD4QIXompi0KTMTBxwPhxJvmDtUnCWOgwyqmcPvnn/4R5n1zDTvMf?=
 =?us-ascii?Q?NKH0qsNAMjBg8GQUPOyUyGMSprylT303RXg6szNdL2Mb2UBqtMORiWhdH9CX?=
 =?us-ascii?Q?6lQzQkJt5GinzxNKNHLwxF9+v6W60g6U6BV1lZl0zDOb1ZbFVslfSxOy5uxJ?=
 =?us-ascii?Q?PWfvMJiyjZVm/UX/3/B/Gx+3iW/58VLe01UY8T68?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f1fec4-0948-4dae-ff20-08dd71647e18
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 21:30:58.3926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KqF8bWW33v1rB3tKgngzXxB2hAB0K31TVaaAogntAhXcuuoLdxTwDeX89/3TzQqXg/uvSeV8jiiIerCVTDBbeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10204

On Tue, Apr 01, 2025 at 11:43:59AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Subject suggest

"dt-bindings: bus: add i.MX AIPSTZ bridge support" because dt-binding
already indicate it is document.

>
> Add documentation for IMX AIPSTZ bridge.
>
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
>  include/dt-bindings/bus/imx-aipstz.h          |  25 +++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>  create mode 100644 include/dt-bindings/bus/imx-aipstz.h
>
> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> new file mode 100644
> index 000000000000..13b7fb39d6ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Secure AHB to IP Slave bus (AIPSTZ) bridge
> +
> +description:
> +  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters issuing
> +  transactions to IP Slave peripherals. Additionally, this module offers access
> +  control configurations meant to restrict which peripherals a master can
> +  access.
> +
> +maintainers:
> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-aipstz
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  "#access-controller-cells":
> +    const: 3
> +    description:
> +      The first cell consists of the consumer type (master or peripheral).
> +      The second cell consists of the consumer ID.
> +      The third cell consists of the configuration value.

	items:
	  - description:  the consumer type (master or peripheral).
	  - description:  the consumer ID
	  - description:  the configuration value.

> +
> +  ranges: true
> +
> +# borrowed from simple-bus.yaml, no additional requirements for children
> +patternProperties:
> +  "@(0|[1-9a-f][0-9a-f]*)$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      reg:
> +        items:
> +          minItems: 2
> +          maxItems: 4
> +        minItems: 1
> +        maxItems: 1024
> +      ranges:
> +        oneOf:
> +          - items:
> +              minItems: 3
> +              maxItems: 7
> +            minItems: 1
> +            maxItems: 1024
> +          - $ref: /schemas/types.yaml#/definitions/flag
> +    anyOf:
> +      - required:
> +          - reg
> +      - required:
> +          - ranges
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - "#address-cells"
> +  - "#size-cells"
> +  - "#access-controller-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bus@30df0000 {
> +        compatible = "fsl,imx8mp-aipstz";
> +        reg = <0x30df0000 0x10000>;
> +        power-domains = <&pgc_audio>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        #access-controller-cells = <3>;
> +        ranges = <0x30c00000 0x30c00000 0x400000>;

generally, ranges just after reg

> +
> +        dma-controller@30e00000 {
> +            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
> +            reg = <0x30e00000 0x10000>;
> +            #dma-cells = <3>;
> +            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
> +                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
> +            clock-names = "ipg", "ahb";
> +            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;

Does it need access-controllers here?

Frank
> +            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> +        };
> +    };
> diff --git a/include/dt-bindings/bus/imx-aipstz.h b/include/dt-bindings/bus/imx-aipstz.h
> new file mode 100644
> index 000000000000..b81b4654e00f
> --- /dev/null
> +++ b/include/dt-bindings/bus/imx-aipstz.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef _DT_BINDINGS_BUS_IMX_AIPSTZ_H
> +#define _DT_BINDINGS_BUS_IMX_AIPSTZ_H
> +
> +/* consumer type - master or peripheral */
> +#define IMX_AIPSTZ_MASTER 0x0
> +#define IMX_AIPSTZ_PERIPH 0x1
> +
> +/* master configuration options */
> +#define IMX_AIPSTZ_MPL 0x1
> +#define IMX_AIPSTZ_MTW 0x2
> +#define IMX_AIPSTZ_MTR 0x4
> +#define IMX_AIPSTZ_MBW 0x8
> +
> +/* peripheral configuration options */
> +#define IMX_AIPSTZ_TP 0x1
> +#define IMX_AIPSTZ_WP 0x2
> +#define IMX_AIPSTZ_SP 0x4
> +#define IMX_AIPSTZ_BW 0x8
> +
> +#endif /* _DT_BINDINGS_BUS_IMX_AIPSTZ_H */
> --
> 2.34.1
>
