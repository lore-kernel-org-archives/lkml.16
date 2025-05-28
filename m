Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E592882DE;
	Wed, 28 May 2025 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446791; cv=fail; b=Q38A5spPQF99XYu2gY9RQPaig3Lg+wxrkNiQ6HJUd2X9dpMc1yaqelrDPQ/tjU36DO1b/t2LDqoEkrPYlmNZCmL9PWzzjCigpdRsFsoudDJf9NYAPW639oHLSpMPIu2DLW5Vw4Mi860VJ1xUf30be5O/DH+k3xTfASVdIkhGZRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446791; c=relaxed/simple;
	bh=g2ONdwvJn3BIOG5QdUhhgNeL10Bz0NlRj4Ql3CrCYnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RUUCAPDAQQ1TZckWduaWC2IOaZq+ye5indax7VEsXRDKbRumN0pM86qIOh6CChiKJ89O38fSyBEybA8VOxY6l7hLgVq8sVM4An1Z7DM1AIIu2Nv8BgEG6XrWUhPl1V3/k1wnlnd2TIRBFjb0LPfyX3B4+QPxCvrocA06jHRqlOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a9sdb4Pj; arc=fail smtp.client-ip=52.101.72.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a9sdb4Pj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CySBSCbT8cc0ISz00S0y8tJeV7AZgAhgpcrfof58IxYYVZUaJXu/K771kR8DGZQHi1NS2v8v4p+d5lhy3dOBV/DdUtAg/bplA9G1Y1Wy7prLQTYRed0JCC9deyo8e96j4x3En18yWRy0yFK1zACglH+nW+nFFG7p/hOm8b5OUYATfCSlNlzPDni12hzN0ELPvSiTDQna/KhS1QrXhwZ2YZX+vizbJqU90rXE+Y+RH1wYdjC8QRSWoqX9fUR6v2q7VD26Ss+f6EzjECAvUW/ogRRKvrMabwCClp3YDQVbedaR3Ff+TD2XMtPOwJShRCx9lq7g65pJQZRhn9C9asFEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5fEc0wUd9alxSvk2K5jd+XmvexASerDAPKGcAnZczE=;
 b=cp2sOXGqoWooMBDXan7gcQ1kTx945FuNTQLRq5nsr5a5rBPbI55/lcBJ0og9sev24+5w9chEjHKUOHwXJL1Ga/l20GbKJ6sqA4w/rKXFSpazAj4CczbeiRq0cNwC3WjM1fV9p64ohrI/a/vmxcmkn+zFeLmMIz3G01IELwbmIPmRQrV/LGKiSsXO0qhkshNdVYE2ZSaqUDGvwUcPQgaE2GIQ9HWcQmStIbi5TLEy99Tjy3E5VLKv4y0tYASzOHrpNNwIFIDy7YzfM99A/Fx/8CJhCdH8DnYvhpbfQw5ejIi0kSxguNS2YJzuNqFtAEXcj/qNA425MQsmSvQV6Rql+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5fEc0wUd9alxSvk2K5jd+XmvexASerDAPKGcAnZczE=;
 b=a9sdb4Pjl51N4lNZ8/0kSuEED305OzFynvt1wt73KJxVmhunIh//1WXka5ix+pit+GHNQXY+ea11p/IodkyIog3IphB131yrsMNjdfCLnR87hIfPzW+8Hz7sadFN96fMaEcBD1NbJw24N6rUyV3MTkxRojZx/igfn8+iZFIKmRUs5i8/GClJ7cAvUajhWPgGR9EAWYw/a9ei2wNZMX9Vw9Xk+2Cn9TjndIGcR6UGMQ8QXZ4GwIhVZGl7KE1MdeVsOytjG4jejRgtmsHrPdqrJsGPeokeucWXQlI1tNmeJ0roSi6vwI+EcEQ84chheECsP0iHgbNPXIPBcaEDTU5BcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9923.eurprd04.prod.outlook.com (2603:10a6:20b:67f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 15:39:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:39:44 +0000
Date: Wed, 28 May 2025 11:39:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/FREESCALE VYBRID ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 4/6] ARM: dts: vf: rename io-expander@20 to pinctrl@20
Message-ID: <aDcuOFhYxWs9VXl6@lizhi-Precision-Tower-5810>
References: <20250523161726.548682-1-Frank.Li@nxp.com>
 <20250523161726.548682-4-Frank.Li@nxp.com>
 <PAXPR04MB8459B664F892D4A8726C70B88864A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459B664F892D4A8726C70B88864A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9923:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc8c9d7-f449-407d-9f20-08dd9dfdded6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R8BtAMZjlxilaSC5KYS8JIVEUU+233GbkuIvsURh6eYvypcCf4yCtvPtp2yG?=
 =?us-ascii?Q?kBLl9cpPdeGxRqaUusvel/3F4gtEyD++H21ozzpjntaDCYyXkHYPFLEN5euo?=
 =?us-ascii?Q?e74er5OP58R58pqEp59ZiTYQY+COl+TfuEJAYikwIdVsyNUyCv46CBYLbuxB?=
 =?us-ascii?Q?XBAkmTOZEkAFsivcEXNqpeAotHt2auTlQu3PnmhVa1Wdmy3FOAtTybxYbf4F?=
 =?us-ascii?Q?O+owsj8e7B/z7bA5akkVxWRPdwxrBhdl3N43tGc/vyVLogkGez4hAzh/hLbD?=
 =?us-ascii?Q?W7S8UqBNE0okFGqmRlfzrYQ4DLvxZ055cg3beL9Hh+GCjbFvlcgAet2B3Am9?=
 =?us-ascii?Q?OvdvRvIjDv3WrWnZJ8dhlnsBQ2thW+QKzrBF0OYNFmO0jzKqSKe/RNRM5IdA?=
 =?us-ascii?Q?cTtHSzIWzT2WstFGOwILAlLmFgwTEPwIVS1Py1e/rjMJRMMYDPOg9BxvAUnd?=
 =?us-ascii?Q?CrpJhbkuZ0i2x33ZVgy+qce3XnhRwhjtsYHdC5L5OsqnXvOrQc0G1QBjTIBa?=
 =?us-ascii?Q?SbquGienzSmuJnO5urOHjxPFHxkVPFs3jdGIJ0SeZkVQlOz/3p35xItNYeHX?=
 =?us-ascii?Q?Ok3luOTeVDd/NFcLE41c699oAWhZyxXllEcnqzK932D3+Sog4UYyMM3G25j6?=
 =?us-ascii?Q?9VDb+yOqPG7xThbbVfZpRpn3mB2N11eTwVweaCKdzNlNAikrTh4AWy4LjnJH?=
 =?us-ascii?Q?XPOOGAuleHlCzLCGtFSDCifImUaSRMgzzWX11aaagHfIlLpCjG47WNR/lY9Y?=
 =?us-ascii?Q?NFP4YOe7WLIxP4Rw9zJMQ75+vQPao7vWp9mJGbq0V8w9sKVmJSrxPks2zXki?=
 =?us-ascii?Q?5NzEmJxx20kJjqBl+YO8CNnr27IfLf3KTKlNyO2wXb9Jq0Wjh2OXZH5X8Mv2?=
 =?us-ascii?Q?XYgO9M82ECq8PvCTqDSApspLmVX0/3ORbrHNGFst7AN0GbFmdU/8orMNCKvE?=
 =?us-ascii?Q?3WrJJKzZmvCGl2NumPYRQGy/HYFlxQs5kPBa1VWdE6+tIuCXyxzk94zgFcEc?=
 =?us-ascii?Q?nuYUFMXPmi2qsW0L2TeQ31Ew4v9GI9csvSk/csLuoBXaBwpp5O5psVM8CCVc?=
 =?us-ascii?Q?rE0uzHyzLxN55FuIxI3cAeH3Kd/HgQhDC7WgWdJJZAH42thnFdV1CMKcbu7y?=
 =?us-ascii?Q?TUXDFVd81IkyeIGaXcj8G9utFoeAhfad/CDK+vQpL6Qm7mTeR7aJGPklrRVT?=
 =?us-ascii?Q?UOKTmhlz/YcEPP6doJCJvBvYZ2gTABBJMutBsGUb/x4ehuzVJvLjKT6D8A1q?=
 =?us-ascii?Q?AqqShpjTCzkNhqq3HJ0AbgLB3fUISchT8dea9mU9VtDDbRwhQgec10FyjXfM?=
 =?us-ascii?Q?cittvRqawYAX+YmhIUoJ7NG5C7LUCUAE/FnHBTEloBi92GoDUHdm9kOChGvO?=
 =?us-ascii?Q?G5qs8KWQDa99o2p5OjYJ86hFBw41rPUj9mtNVQY476jR03em38mAEZXEb4jk?=
 =?us-ascii?Q?BenGD2Q6EF3iy1GKt6/aUfJPNKdPY+O8ft+B4TU6yY54WI55FLTHHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0MarVGvrK6JQPbFgdy8tA2xiwZINjoaVyFHSt39fyDlstcdQiH9DPxjEsNUV?=
 =?us-ascii?Q?VUdBiJCtIq+4U/pGEKtT0B+uuRLw3iQDmSOTfB7gzjcoB1gIy0aTpdGWT8qm?=
 =?us-ascii?Q?tgHThqoPwzYaNZQQ4JOHsq80NtpifUKNEjCsmqHMY5lEMMYaPWykihdw9G1J?=
 =?us-ascii?Q?lF98iE4L+3ILODFOujsI59TTPS6uZHjC2wz6xYl0EmWjYjARDyZqgFdDO5tm?=
 =?us-ascii?Q?46qmOKJtm2dGpO61bGVYVzWqgttq+tLQ0vMTJeNf56fJaYypp5Glm8lQ67Gp?=
 =?us-ascii?Q?GRcSa6UNcxzGQ20dW1akx89b2DasaX8M7SM3AUYLbvwFOFiIOTNm0Y6ydDJe?=
 =?us-ascii?Q?5nV40Wem9oE7VZndWMR22rahoNjshWP7Bc56j5AjGPu/t6F5Nfq4WCOuxUDd?=
 =?us-ascii?Q?SD0sY20g7oGyCuSKLzMcLWBgA17DBKB/uJLdE3lIZeDSdecvk1AKn3Fs4ojp?=
 =?us-ascii?Q?kf1KT6SexDwnk+kT5pmoUl/fhaq+HMbZGU0HcXumLTuZhQkHnynm1OVBK0iI?=
 =?us-ascii?Q?aPTLHetl5W6S/n/LOanM+gG8k2tT0XSLjPugXrPzwyhmwWNW8rgENIcDFSYX?=
 =?us-ascii?Q?gaA2ui14vJxgLqg3M3K7bEAoYKBWwstWAcwjppbKZ3dcUtBGQ/Ndt0sfl4CX?=
 =?us-ascii?Q?6W/7f3EwDvnZFXpluHxW11TosX2Ohm+YYtMBLoniv6KBQ65X5zMX2KKTU1rl?=
 =?us-ascii?Q?j+7d2UQngAQLimMDDLn9X0qZgmTmcyoKTlergQK+c0+koCkk06O6U9Gt8FJt?=
 =?us-ascii?Q?Jqbg+xlmeQoJWsSD/0CPMSYAxrKa+ACrNxBZ7tWH8VT8I4oaLEam/MSJ6xA5?=
 =?us-ascii?Q?CU0QrIdzaRqGpDfh/fWnzo+voqEGfMpDaQVPWwUrQD/4Yaneb9YgfMS7ju34?=
 =?us-ascii?Q?PaztYlVszPfdKm40KF37hw6vm21mM19j9i/fyX++um+B9M9gEduys9RJgmnF?=
 =?us-ascii?Q?+jc2wEUcJmpv9f6QbnDNP8VM2ICQ9GWBYInJ9aG1TWnM3hpDzjdeqLz66Kd6?=
 =?us-ascii?Q?7MLq8sxRz4C2AreioTCjT/8g7IC76OQ6MSPnjPZ5/aKvGDfCSVBep3ZCnxj7?=
 =?us-ascii?Q?wfVL2/0Abmq7+KkNbOCIuVF/q4bGG/2weLme0mSenUSnQdM2naiUvUJGAhsv?=
 =?us-ascii?Q?EjApv2IULGFWXGwHDUq1heBv+bIGoSGG62gL4CmlOlYWMsXqwM2z0idrJigU?=
 =?us-ascii?Q?YMyE7Z8mPt5Dvdr0gxilHW4syLUVRSjmcxxgUuGsWAKxqXIPYrV35V/L1XdR?=
 =?us-ascii?Q?GzKdlYjmJOSUep/CVo0D5ENeJLPi1R6w19AfzgBM8kddc45ksS2Kr1NNUZHO?=
 =?us-ascii?Q?g/JGsz3GxAx6+f9sYF5veRR6CeKr1zYVLO+0sxlCEpfCnMgJwLxl6gYHRvf6?=
 =?us-ascii?Q?YhVE35JMVgGAEvftqlHiTmKa/sDqlYFMURLxxayIIRZZTEWyQEBbZO4py1VZ?=
 =?us-ascii?Q?2x2Z59NhWNzZlF8ghJNaPDICrbi86WhtHYLXXSfsJ+6uKy6r5Y/PEZo5UglW?=
 =?us-ascii?Q?qDHI78au1Jgx7L/drgh9WMNe9zy3O9LGYYEDTUTJzOEYWhO3X1GiISiU/vRc?=
 =?us-ascii?Q?JLybCFJmM04VMb86LDs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc8c9d7-f449-407d-9f20-08dd9dfdded6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:39:44.9212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhQppMdbX2I7xXSwGina1rCSqP1uJRCc8cnKUVhXOnXCnGRBIRbEBY7aqBkA36ffWTh6B1OfaDTbtcbf94tysw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9923

On Tue, May 27, 2025 at 05:24:23AM +0000, Peng Fan wrote:
> > Subject: [PATCH 4/6] ARM: dts: vf: rename io-expander@20 to
> > pinctrl@20
> >
> > Rename io-expander@20 to pinctrl@20 to fix below CHECK_DTB
> > warning:
> >
> > arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dtb: sx1503@20
> > (semtech,sx1503q):
> >     $nodename:0: 'sx1503@20' does not match '^(pinctrl|pinmux)(@[0-
> > 9a-f]+)?$
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts | 2 +-
> > arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts  | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
> > b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
> > index 7a209c9c57a4d..79ea7cf57a4dc 100644
> > --- a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
> > +++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
> > @@ -311,7 +311,7 @@ gpio5: io-expander@18 {
> >  	 *    I/O14 - OPT1_TX_DIS
> >  	 *    I/O15 - OPT2_TX_DIS
> >  	 */
> > -	gpio6: sx1503@20 {
> > +	gpio6: pinctrl@20 {
>
> Use gpio-controller?

binding doc require pinctrl

Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml

Frank
>
> >  		compatible = "semtech,sx1503q";
> >
> >  		pinctrl-names = "default";
> > diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
> > b/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
> > index b3d338312df4f..8020a644dd9d1 100644
> > --- a/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
> > +++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts
> > @@ -583,7 +583,7 @@ &i2c2 {
> >  	pinctrl-0 = <&pinctrl_i2c2>;
> >  	status = "okay";
> >
> > -	gpio9: io-expander@20 {
> > +	gpio9: pinctrl@20 {
>
> Ditto.
>
> Regards
> Peng.
>
> >  		compatible = "semtech,sx1503q";
> >  		pinctrl-names = "default";
> >  		pinctrl-0 = <&pinctrl_sx1503_20>;
> > --
> > 2.34.1
> >
>
