Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013041.outbound.protection.outlook.com [40.107.162.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732213AD3F;
	Thu,  5 Jun 2025 15:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749136630; cv=fail; b=gpNvwFRct6l+22HJrNW5ftPzyUJtL8hckbVgpvamZkRDzlScqAWTZdjBlG9jOWHAH7gNIhNITnDfiLcGiJoFKzL3zcHZnvuFkcuMVzQ3GIPmeCV3iBNHnlps3BN7Q0g5BcNZCLoE+8QhyKdScS7HxerCAHKd6Fh3PCFifd5WHCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749136630; c=relaxed/simple;
	bh=9QIKtBfX2KMmY91VeMq/eyJ6Pwlw1YzH/3xEZPr7G2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VSiOKvx1wyYYI9Bu38yapRwGxybBUOAJregZpnd6i4pT+b3PAQAWNdkYLFuAdTWD+yw/woNfXdlA5EPpzKrKJu70zcmpqQ0AIO+HkfN9E4oJcH9OUgraxI6FipLtGdLtfv0crOsmBJL1WmoiYRBkyT6wcqSeFu120yyKU0nhIjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BeTepXhz; arc=fail smtp.client-ip=40.107.162.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BeTepXhz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9xY7jIFVvayGtTiUpdUtE+38/ihAlOwHCu3SN2wos/qV4Lk4/mrnoLN8xL8yWhsDump/MTjt4fjIBkw5KfxEnZsx+QO9XSJ0xTO64NLyhjU76i4Gt7A7xdZQjzYOwVFcYSoW1XUEuNvQVdszxeVdRwwzi4MDmeS377l7HQ2AcqW97Tmyq8GNXS9/Bm55/DondGBQ3ByJuLFRyxMZLH2LEVBxhNcqexYGs1ugEk9laQDBDd8kcK2KRGNsjAH1easeRFPZ7fFyfmhnfER0V3Qr0gDw6EdLB1VFamiPQ8JnpK3iwdxh9uXgBHKG4YH9azRkoHm/goAeuAFksVPFebv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs+qiJw5XPO6lhcWw0sgDwy5SzTBBSYyjLTOc0PnGZI=;
 b=oj+nBaehaokS7sK20yaNgSIFEfYR6BSmjLPpRYLuKo21B6Y5WFWzXVjiYL4/5K64QnNaNZhataDsWvAGKuWg6gB4JEs5cxN/ZdTM1xpezhpuhlO7GHQ7mCJuR4aiaCSbUijzcAUj2BmZKCcD0oYmVLmB1aI/1LRifGcGabAspzuK1TAJI6fXX/LiTIsDsoNhZQSVgz3IhviTiokfLGm4ipuc4jajxgxRRGkezrttSCQXrVzUyqb3TQPpOtl43n1VJteEowd+IHNosxt9JEJ8CswUPn9aUH9Zdy3DphCzdxnfUKiAFm1eLUh+CfZ78jwypPY8o/2iobl2mr4lD/5pxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs+qiJw5XPO6lhcWw0sgDwy5SzTBBSYyjLTOc0PnGZI=;
 b=BeTepXhzHjbhbeTIDopmL9llUkXLFbO8UBjI4ggwZ6emgbjM6D8T5JF46xzNcdcekBMMVNJcdMTTxXhdZGf86nGtwNJrjeiFLnHw3VVQgUABV15EPi+A4bpNkGIACOlQJg0u7JU09YbX/RAH2H1dnH7mi+h9K0/jNjBb1O56jUcceNhZh7AQKb4XxrCugX6bpFY8z8hOFTY+VQ3UNiqXBAQ030bLNAvFC7p188+o++7DMoNMUkoksVdpL/J8DUr4mz7Cn7DnN+IFmcrBUp2rXlwbKj4FRDX5miTnsrhHVLSo2o6JMcbayucROcqRJIWMcy1aSBrWgPr7nhP9XB1Tmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU7PR04MB11209.eurprd04.prod.outlook.com (2603:10a6:10:5b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 15:17:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 15:17:04 +0000
Date: Thu, 5 Jun 2025 11:16:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: interrupt-controller: Add
 arm,armv7m-nvic and fix #interrupt-cells
Message-ID: <aEG06Xy7M8phwl8p@lizhi-Precision-Tower-5810>
References: <20250528163704.690840-1-Frank.Li@nxp.com>
 <20250605125444.GA2354143-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605125444.GA2354143-robh@kernel.org>
X-ClientProxiedBy: PH8P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU7PR04MB11209:EE_
X-MS-Office365-Filtering-Correlation-Id: 58de7015-161d-46a4-20da-08dda44406ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HEk/UkcbpYQsdDNpI/rd7JPQi9Eg7zDAI7YtAs9kTLY4/GdFPAnfFJwm3uJJ?=
 =?us-ascii?Q?U8muJw76JOVQlOMZeHOAMGyioCuK2/2YQR1ee95Iz5tHzJ9JR5XO4wYfiPnp?=
 =?us-ascii?Q?WmrSsEiYMNHc0qcfUCJSyqWEpkZkXlJIjwVPYHBBj5IdioTYZS6ZjbNClKxv?=
 =?us-ascii?Q?PsvX01yy4tKmvBNMYhv97BkedbudlNlfj7G7+8vYcbwZjJGL0saeIPEbykTv?=
 =?us-ascii?Q?ax+LCB6ssfWLghM+ybtReqWCa5v87V0KV3hhDgq3Sjk500cqUDtFKWN99r9A?=
 =?us-ascii?Q?jV1vfMCvcULSmu/k7mM6eVZ5l3UKUIdSI0NQX8QFP1s1iMjHAXabafZu/bA0?=
 =?us-ascii?Q?vgYQvkg244qDBm1He+VC9Q7vUHZnBIiXdz3g6szxY9/VVeoTerttjoOjDbn7?=
 =?us-ascii?Q?IQGYTnrLAff2tyqjPf4mKyBtpiwpH9+4d5g5wxlECNgKwXYbRTXmgN0adiBu?=
 =?us-ascii?Q?Rj+sGIeIYR78vd75D8P9X4sD8zj+aw/OJfUh9JE9g9AtBYJrrrXy1gzQTVdg?=
 =?us-ascii?Q?iE+8KDKjYO7KkRXgffg2l9mENgTT4dU7cVD40NqgTt7D3BWnMlMq2bqagPlM?=
 =?us-ascii?Q?GQBkG84WAEHYRCibZ+S/jGA7XqPdBvvqjQsb7NPx27IO4uxxj8geHaYgj5uX?=
 =?us-ascii?Q?CVDaqyPww0S3U1TlKvnBq0wT8GsCmAK5/Qi2/I4vW0nPnOFanssj75VI8RYO?=
 =?us-ascii?Q?BMW/vTJmQPw/boKZLM0RwQZgk7m0AsZ6ooYMuXSFMUhKW+6KFHUc+pRs5Jr5?=
 =?us-ascii?Q?VHx8BLHymeyk7/UGStsyvUcZY4JEfcqwALFO4Ej/m1YvD7dGTF7eYNHW7Jr2?=
 =?us-ascii?Q?juhDauExZbKE8AMKMnPO2cSU0lJynk2qDdLdD9COEVusnuMrQqRrDz21rJhe?=
 =?us-ascii?Q?/Z7GmXys9SlvF7cnYl7XwQty+VRRF/BAwcThUyxkez7+pZjZf8+0z7IzVZfn?=
 =?us-ascii?Q?8BTLJRBzc7s3cp/5tfS58bpdKPlG81kmHwC39JmpwD4Kbaq6DWY45fVEAgSM?=
 =?us-ascii?Q?+wTWsyxm4sakVNAs8/2KvRx276OW+ppOhW96oaIj3u1kKbth3XR60ljFF5Em?=
 =?us-ascii?Q?fMjuv1i+bAExpBDskLJguR2dYAQgzfhzx7DLyMN8GXTvwU/jhdzCjHfUHPFK?=
 =?us-ascii?Q?EEJdsUoMk1ElrVOC1oZxV3rif5Z/L9XZm0lQAMryqFBdvEscnl68YGobCj6o?=
 =?us-ascii?Q?6cVmJwyJu4rfoS4O1EgxY7TygfZCl2XCK3GatMqqO6GiE0gl2m7HsLRFwuyD?=
 =?us-ascii?Q?rXW9vhb+s7e0pHYK9xY54HriL7vX/nMRtZm/1+ehZT6/pfZJz5Jv/5Rwmhl7?=
 =?us-ascii?Q?WuEhKnnpgHcZK0ReGD9WIFYck3gzGxJIWh3UvFjX7jelcxIYJS8zbnn9vYQI?=
 =?us-ascii?Q?5evhHNw2W0k9zpFr+zAn6xUapa02UqI2mKzNHxeHLM1zM9bWQwHiYvSNq7ss?=
 =?us-ascii?Q?9tZBuZMYBws=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?okkYy1WeVlSIoJx0bdHxBi1/1NgVpGKbb5t8MFk9LkcFYDt77R6yQX+kB/3U?=
 =?us-ascii?Q?AmCCiLIf0YLSGJTb/kg+ww+aNZubcgBsf3fYo2oWdOElP7n5GvYWJSHiUsm2?=
 =?us-ascii?Q?zIPv9+cZ4cEu6IMCfcdFjtfgURCQX72xHP3cnBVc1PIpaVGvNHQVEIagMctK?=
 =?us-ascii?Q?+M4qWz1UJigrwfxJGATLqcDlmJXbZoaPLOHg2PJ837V9oMxZMnXzPDABCeMf?=
 =?us-ascii?Q?NbHjWIG1C2kyM4NMzS2bDyKyJr6Guk7HLgggYKKw5GZGyRlagVKe7JrpYqyy?=
 =?us-ascii?Q?ggbc3UdhQRXC6+H5nnWOD8L6O9lYRPGq5dCQQo8DJxUgYxmRIRXRvrGPcqkH?=
 =?us-ascii?Q?9v7seqiM7s4/yo5PuVUS7mL+IkyvwYlYSDfhLYT5vT8uzWrGwOc4dRQqcOoX?=
 =?us-ascii?Q?f8kYC9cSXsJoAZiCslTHi29ESj+ec75jyqbRjpLd3viOWSZzQzVZ1PGbM6cK?=
 =?us-ascii?Q?VJc/q7ttTYOoHVqI+Z8yBRabZkFYAEJnyGK7QkBUBU0z393XBgogPex2MWZB?=
 =?us-ascii?Q?qmq4le0ZWXKGycv93q5fT2WeQm7yfUcbrV93SYxKBJanou2daJcRZ2zw7M+s?=
 =?us-ascii?Q?K9Sesi60ng/o6euM1MoB2AsskDhIMlYthODyc3IltEmVURSIVOslm5eTX4DO?=
 =?us-ascii?Q?GEGa5ZRVWIzhmjwr+o2vCH/WTLyevyNeBhHK9XYJ9iDduQnC1s6InToYKePh?=
 =?us-ascii?Q?k5mLBGRuw8ZiiyqRD7jNu7qPXlK7zJGjDDaEwwf6PsLMiuzcU2HSDWfnHdhA?=
 =?us-ascii?Q?QLTFdUhcgY0j17cgIYRuckoYoJ2tG6KsWolFilzL69TjwUQQ/th7zAEwls/V?=
 =?us-ascii?Q?p4ZSbNxddIxBMil7dlOJl5eEL02xFKOW7RzhGEJy2MPyp/fYPWCJ45MH4D0M?=
 =?us-ascii?Q?dq40NS0jHBhbztoTfFxeuBvBfgMtgojkt97S9ZB8MXSd1lO3RGhHT23HMAwk?=
 =?us-ascii?Q?+7lOy+NVl3b7uClCLPuCUM/Fp3yZI7fIhAGPKJcW1NwkkeAj0ZRSoBsvU7Xn?=
 =?us-ascii?Q?zvWr5jOGkADL27n5RD2N2320yeg58xY4Ie/MFMKYwj5jY361bq0+ToA3nOrY?=
 =?us-ascii?Q?8mbeTjAiONCBKGAarg5XwfSo3tsJ/Y7tCPeqMEF8ykSdf2cpSTpvytK55HhM?=
 =?us-ascii?Q?c5YEIOf7Pr1DOWgHqPmtl4NBgFsYm0ga8XULU9uPhnicnG8Gk491U+3sVf/i?=
 =?us-ascii?Q?R1FTdIVbdZ8QZCEKUmcfsl0eZ9c6ijh4f0XZQWPCO6dAbhWefm7sqvsOqWZY?=
 =?us-ascii?Q?vvW42S7t59e41zKmFDE0muvcDJVisohpvW3EoVNt4Ets+3EHtFvbjBe/XtIE?=
 =?us-ascii?Q?+0R1Bol9QvxAa/8tPRRUthnu3xvkB+jcko3/8dEvc5PjNqUKLcIgBvT70Efp?=
 =?us-ascii?Q?URfGWqpIzTZFKazP8ogdUma2eYKiIgRLL9al6fzehIEJ71fNRUfRDM3Nx+T9?=
 =?us-ascii?Q?I3fM9UZirCXDZrfM5/35znq/3jqSm2EboXyrDloRGsOsFtXmUC5qJ6bIJA0N?=
 =?us-ascii?Q?zz5wFOLWvmPgNaBtweCO108VEWev02oONGY8v3Nxt7tIt15rAIaCTCaEnubu?=
 =?us-ascii?Q?4z2XSEQ8hhh1yq/104t4EIKjamsn0bAyy455UD0N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58de7015-161d-46a4-20da-08dda44406ff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 15:17:04.0286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4REw+wNsYRmnMUaGDiyg80yJ+CbMebNGT4Ckt4YLjWPYDFNXDIdrDB68EZQtQzWhqS1BwnkA44XP1OPWg3oJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11209

On Thu, Jun 05, 2025 at 07:54:44AM -0500, Rob Herring wrote:
> On Wed, May 28, 2025 at 12:37:04PM -0400, Frank Li wrote:
> > According to existed dts arch/arm/boot/dts/armv7-m.dtsi and driver
> > drivers/irqchip/irq-nvic.c, compatible string should be arm,armv7m-nvic,
> >
> > Remove unused compatible string arm,v6m-nvic, arm,v7m-nvic and arm,v8m-nvic.
> >
> > Fix below CHECK_DTB warning:
> >
> > arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /interrupt-controller@e000e100:
> >     failed to match any schema with compatible: ['arm,armv7m-nvic']
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change in v2:
> > - fix example interrupt-cells
> > - commit message add driver information
> > - remove unused compatible string
> > ---
> >  .../bindings/interrupt-controller/arm,nvic.yaml     | 13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
> > index d89eca956c5fa..c0be00b450291 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,nvic.yaml
> > @@ -17,9 +17,7 @@ description:
> >  properties:
> >    compatible:
> >      enum:
> > -      - arm,v6m-nvic
> > -      - arm,v7m-nvic
> > -      - arm,v8m-nvic
>
> These came from Zephyr and are in use:
>
> https://docs.zephyrproject.org/latest/build/dts/api/bindings/interrupt-controller/arm%2Cv7m-nvic.html

If that case, do you want to deprecated "arm,armv7m-nvic" or "arm,vNm-nvic"

look like second arm is duplicated. And not much user use arm,armv7m-nvic
in linux code.  vf610 is old chips.

Frank
>
> > +      - arm,armv7m-nvic
>
> Add '# deprecated' after it.
>
> >
> >    reg:
> >      maxItems: 1
> > @@ -30,10 +28,10 @@ properties:
> >    interrupt-controller: true
> >
> >    '#interrupt-cells':
> > -    const: 2
> > +    const: 1
>
> Have to support both.
>
> >      description: |
> >        Number of cells to encode an interrupt source:
> > -      first = interrupt number, second = priority.
> > +      first = interrupt number.
> >
> >    arm,num-irq-priority-bits:
> >      description: Number of priority bits implemented by the SoC
> > @@ -45,15 +43,14 @@ required:
> >    - reg
> >    - interrupt-controller
> >    - '#interrupt-cells'
> > -  - arm,num-irq-priority-bits
>
> Is there NVIC h/w without priority bits? If not, this should remain
> required.
>
> >
> >  additionalProperties: false
> >
> >  examples:
> >    - |
> >      interrupt-controller@e000e100 {
> > -        compatible = "arm,v7m-nvic";
> > -        #interrupt-cells = <2>;
> > +        compatible = "arm,armv7m-nvic";
> > +        #interrupt-cells = <1>;
> >          #address-cells = <0>;
> >          interrupt-controller;
> >          reg = <0xe000e100 0xc00>;
> > --
> > 2.34.1
> >
