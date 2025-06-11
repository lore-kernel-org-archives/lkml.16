Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCBE24679B;
	Wed, 11 Jun 2025 21:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677074; cv=fail; b=EtjFRvf/p90YzhUVm1Zt9fszkB4wXYW+2Uyx1wp5aFCkMLg7wJGsJBj3FA7UhHijpqXhHv6JdAzyWIB8hfgb1drJ3ursyatQFAGJPQuo3i6iXhTXHexNxOU1h6OiNEi/QYkp3e2EK/pOVfuL++wsua+mcCvsFMBQAiRpSFksW+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677074; c=relaxed/simple;
	bh=YXSnT5opWuywlQWVx8T5AXK8WUyHX8zsMdRpkHvGsCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t78BiIc5EhujVcRG/mTYi3rK1qmjBLetGrF/dE8B9hK5BRusjaMCMys26RMl+VL88NxAtOOQfnL4USD8Og3L85kkxSqsk7FwAJTTkCwONbeLv9rsh3Ia9pvU/M4jlsofZX6KIYOSF4WsZkFR5cDVVxsbEQhiZw+ApxnKtwH/Yoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lk0QP5zB; arc=fail smtp.client-ip=40.107.159.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lk0QP5zB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Feu203LTgdt6D8u4SYyoouf8xmq1JFcxo6W1tIkPyhG5b0FB1kC1pfWIZ74qR9WBIj/ZAw2QmslA6SXvEA6m21+qyqCwQrVuKUlEFnMTdvFDX6wY8dbbmNMywMt7qQdIcJJaS/6n82Wz9wfSybSDTrOdFSnfCE0/DifJVmN7gZorJtlpdpIJOJ21Rfd/U9Q4Y8+z+ce7h0fwNyNWnf9quRtF5Z9LzcxCUzgeHMiXHVuE5f82jsQjmfhD07P3+QlH7Xp5d0nmmeVLmJYVUVdFJbJjUa0ZPNf4PwC0Ifyjrj63sa5gLoWfsAzgmcIMO9SxsDELMCYMM2/UokvB8zh3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tqi09b/mzV3bGWJbUHqORvhEgQ/II1fjLgaEIOJ3kbk=;
 b=qwAtH3rc3wY8PIECOIiJjq3/QdjqAERaUbLXCLCRCWybC/Jm24UIvHCBLoHzZgEmE9agGnSnWU/27ky7saIF6DtsP94f+MXYSjfTJ0q0Oq5VuGy79Bicqoi95FQM0rhC5U4KW6o7c7JcRSqrHFfIGo24PtadcIIOf01Qg8+zRcGqExdB/YMDbh6Wa5ILgkmJDqvo+F5h7B+dPsn/Gj6QQHFpCigq6cTyxhkmBZSuzOCil/PojPSDmGyAypl/zwKPeMjMCq8vhxYdvbvCdSGDLNDidLRWquAimEixIO8geZzd1Y1mwxdYXv83t7yx9jgSshn4oABlafhvR7Q48dWIMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tqi09b/mzV3bGWJbUHqORvhEgQ/II1fjLgaEIOJ3kbk=;
 b=Lk0QP5zBvUC4L8pSWJ8zIy6GCEsIIOARqpLp7x0kCdcd7oNRKQ483l4Bpem5roPxAKyk0A6UBMGHeyCFEfsaFXK3+lMZwB23lviDFVpPrZPk4hnaVUsHWUB14g4svs4daqX3Mwjw2hlJGpV0GMJC3eqiKzwOlfiWqB+h62uiqsakOzffV80zmDH6hOp/eTg+z/mElO7CTjeLGre7npGGd6OHZLSLreqsQlScXqL6NfhOMtNSR4ykG5mO2PbvV1ZLQZMb6XtnIOjFw7bAK+jcKQRji20yWA1c2MgZKq9KmfE2PMmdkZismqJXujjHCh+uxjCSLDco3pQEyhWtdK1LBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7608.eurprd04.prod.outlook.com (2603:10a6:20b:293::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Wed, 11 Jun
 2025 21:24:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 21:24:29 +0000
Date: Wed, 11 Jun 2025 17:24:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: Re: [PATCH 4/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <aEn0BXlnXlNI3YTQ@lizhi-Precision-Tower-5810>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <c7c9319793b439cb35909621381ca2d4a78699dd.1748461536.git.dan.carpenter@linaro.org>
 <aDeCwUsYTh7z7uuo@lizhi-Precision-Tower-5810>
 <aEnWWPgXseRGdSz1@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEnWWPgXseRGdSz1@stanley.mountain>
X-ClientProxiedBy: PH7P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e42e3f-aa41-4862-6b16-08dda92e5956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SsVfZ2kDQUsbPSE3U6UcbITqO9wZO/HPXL3poahFaw3naiOyVf4Gg5hUFZwn?=
 =?us-ascii?Q?FB6ruW/2qA2X6r7cChr6NoDh8b4Uajqu4Rbnt8IhPU0DDLmOAQfYN5hVh5St?=
 =?us-ascii?Q?qD7HHw6o9JukwfiTqU3luT0CREH7ousdT7CoktWxl7EXnAVSrE8b+2r0qEVr?=
 =?us-ascii?Q?Hc34HlsNXSr4i8GRl2ZqAuay4Lx7mbKY0XAxraM0oi13AdSOyT5qwnDzAVV7?=
 =?us-ascii?Q?EYJHaRZfd4SoHDUmkpC7VoOAkAgXfSspqimp58eFMhZX2KhaizJPpLHGoHGH?=
 =?us-ascii?Q?wmW3uPnP64c0vU6/aqx5cU4Q1zk/0H6vAz2K1tesX+eHxGJUk+s9WetNB8Zb?=
 =?us-ascii?Q?wfeIsmiQ5rnBl47IN0RwSBczqn2N7F1ZwGq+bZ6WJn5zA9MqsSl9kAQi6vff?=
 =?us-ascii?Q?EmaNCWNgu4fGDJWnCrZADI35iUENOjsH66leQTB1j0AwMos7AaryWy+b1z3J?=
 =?us-ascii?Q?pcxaT2fC2mIj2MKTtxmVBDc0a0B8rmBcRHgCnJIwpy6OfBvRY3uphpQd9XAl?=
 =?us-ascii?Q?iUQHsGY5b0CnHzwnKYG+JCOa6mfsLOiVXg81z1AFkShgs31Pix00yP5h8RzT?=
 =?us-ascii?Q?JX/fUYrA9Ct1/phgLl/3/txmfNGeGF+V/SGUreE2Z+ZYnKJe9vtUt1auvRd6?=
 =?us-ascii?Q?ixLJFRJw9pjp/b580sUptx0DdLNjnZm6j7HGhyvDdrel1wusvPMmLemTfmBl?=
 =?us-ascii?Q?1nHWrZk8LQD17Y8NYdvVM/NbCrPWhDbHXNGVu6oRlSGL8w5M4lHdiG4N2pYV?=
 =?us-ascii?Q?Dl7qwLTTMzjNytviG2YEQGdSVIdFxLexck27MuhbQhqo0KAnYjpj0Pz6fi3Y?=
 =?us-ascii?Q?qGvZ80amenHuyB67Vak3aNgKNIZFUy4du9/11YbU0upgIkGYOQNcdPIBr8gg?=
 =?us-ascii?Q?sb5bTUSKiHJkTq/IjnF1x+MLSg+Vbm0r6ClyFyUuU+OxoKMC+nQeK/8uLSAl?=
 =?us-ascii?Q?H5m9xYIZz5tDEHCGK3c/QM03XHlMGDe8fQZDbyVu0HI8yVv1ChCMp4JeehiZ?=
 =?us-ascii?Q?hWQTbL77LgAhelxtfRyuOtjwUqr3LfW0GAz5gFUaC+ANA6xVqKAl8flK4to4?=
 =?us-ascii?Q?nJ5vSxcetRAVtPU1mKqoX3M5NsTpSwt8LDYmlPyCoZ6P/7rC8ASHdMe9+or4?=
 =?us-ascii?Q?klj2NsYppYg4FeHodRqHLCxkosGQ3ixR1R4Gzkoz0+4jThTEtJYiUSS06O7T?=
 =?us-ascii?Q?JBayFsyuZ7nZpeqmH4BxZL/0QnZiuXIFUbgichfHu8fmp14J0qRp6dXpx2Cl?=
 =?us-ascii?Q?JGSh3v5pgxSTC5P8qpjjuZRm13Rk1k37WlyCOgdM7Rr5eJDvLxJilXDsqf9X?=
 =?us-ascii?Q?SJ2WHgaks+PTQzE9anBA3KCau7oRcNDWhOIJWeSwnhIi0SFVeJ9ltKW+0IsH?=
 =?us-ascii?Q?/YbTptj65PKa4NNX9OVf9mk0HvyzZ+GNX3PXJEhyHkq+Ize/quyB0I5pAhS8?=
 =?us-ascii?Q?YNOUtMcHxUfWOekv2NOBCqlS+yXfJ5jUrJTyKhZ7wKLvHqGxcVorJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OK9ujX4RDkzxSYcu7mWhHsmRWkr9EZUQzLMcLA8tNb8QBqqQh9rz51s42Yn6?=
 =?us-ascii?Q?O/T77I9TntD+xM6aAzSg7XSMhxmBKCp0qLpevcOSwhnPB1lT30T8CY4AZovd?=
 =?us-ascii?Q?H7Zzs00Y7CgRH6WpseElolEex5xB0jGOvovl7ojdynguAx6kvMgZ7EFqVSTg?=
 =?us-ascii?Q?WvoRWajCfZOR2bK2t8uiHyCRbkzSEg55oV9dyO8EjSv0T8ZQK8tb9teWhpim?=
 =?us-ascii?Q?IR35VVFr+HNbZLLxna15lxZ8wRk6u+nvKtmuk1bYlQJEhWgaDe7EUsXzvS+F?=
 =?us-ascii?Q?8qhDv0NLzBqeYbOkKNy+XuToP6JxHFjPTGOqfA8OdtJxw5XYmyxvO+q2S/ve?=
 =?us-ascii?Q?x1q7llLmFtQ+7MJn+JL+tPe2wTp6QXBESEwDBGja+KKMAnSJcQkhQfH4Kdrs?=
 =?us-ascii?Q?qCKYwhwDmHs735tcWH6F9ePAEfxFFVEs4gZrznuZMdjsKWYzGTB8eN+ADrpG?=
 =?us-ascii?Q?fUIxZBYA+LMu001DRzy9slggYSWkHHi7ZSFzUDMnlSBH48UFqdEeFNTSrLQF?=
 =?us-ascii?Q?jrResA08E5/9Xe3Gr1tnbIgmmxtvYy6FZ1EV3qoakweG6KXowEYMDKUcovcQ?=
 =?us-ascii?Q?1Z/KQhXSuZkeGSA749cjsG4K4CXYOyYSS/e+pNwqQAnJyuWJI4Avd2bC/kKJ?=
 =?us-ascii?Q?bKEDjaxYG3ySIPabAy+l5n/aw6mYMTk0347PojIZZZnzs3OSvEKbwHl2xlh9?=
 =?us-ascii?Q?5mgUXG4ic1KvHHvl8jRgZlaFuMqxriF6CG4LJ3T3HEqC/yw9G3CCvIMkzHY3?=
 =?us-ascii?Q?oIxx84hbytcLkMY0RE12z+onSde0C8I8qDEGKNoW5FFXczBYYQE5gThSRsQs?=
 =?us-ascii?Q?6QMkCBg4ixrY7lJoITUcR/3H/7sfN+rEk22/tp2SulJLUka9A7DG5UBSCoWJ?=
 =?us-ascii?Q?Nu5+I8v4/EeY6FK7EiDRh6OQhOfjdBdzuwkKoXFiwGc5bI55OSLdor0eeph4?=
 =?us-ascii?Q?/+o9GYGsuICFcn4qS47Q68AwWTZ1fzbdcGewtQIJOV7j5QwEW/z1iQItQtro?=
 =?us-ascii?Q?iepNy6BE7Vy3K3LvL3tSh9TwE+K6mtON+addfj6I0iBcF8DAPn57AauOUyff?=
 =?us-ascii?Q?yb4WS1SU8agBlFw/pUbmRPv8vaGZU7JLLq2VIItuhMCFUn0saIYkU7//Zamm?=
 =?us-ascii?Q?boweBQ5O3hyoDj53w70klriK9Z3K9cwFctrWvXGeQhnt5eRL4Xb4nbdLed4B?=
 =?us-ascii?Q?ROc4p8arJkxm21s+VZYOkEvFEusGDcTChLaOaYNiwNzLgz2OtZ6kEqwm9CtK?=
 =?us-ascii?Q?uNkw3FwPt7fyopzp9BAQvz78rOuhsHvD1d96AHzOZ6bTRONQcCmm+KwlYwbY?=
 =?us-ascii?Q?B5ngzHi9d3y0yvak2Pk/tT0DVX5299Jj+xOGlbqco4grnH067EFtiJinUmqj?=
 =?us-ascii?Q?cDM+AW4+rUB9MQsOj8DAFwWODD68G4E8B+ex8WHvgPZ5oY6+xs2+9Tdk/u5X?=
 =?us-ascii?Q?86NLcqmm/kRa3gPpgR7LsL+/qfJrwGx7DM93sNSR09IvzKxpNkilJ3qmWICZ?=
 =?us-ascii?Q?ibUAMLAJvDCWwGWa4g3B9RfR4e7q0QviI2NtR8Avy/6XH9fQkEvAg0yHlWnx?=
 =?us-ascii?Q?KTP0kj0SXmwr58mKMoA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e42e3f-aa41-4862-6b16-08dda92e5956
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:24:29.0530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzhhjyjhYoltMeEH4gtFj8YcXT7G8qwoLKUKFmTDRJCFelR5nRQ7VaW8yeyFHCkx8aEI9tSeWLj8t5/B68caWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7608

On Wed, Jun 11, 2025 at 10:17:44PM +0300, Dan Carpenter wrote:
> On Wed, May 28, 2025 at 05:40:17PM -0400, Frank Li wrote:
> > On Wed, May 28, 2025 at 10:57:39PM +0300, Dan Carpenter wrote:
> > > From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > >
> > > Enable USB driver for the s32g3 USB device.
> > >
> > > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/usb/chipidea/ci_hdrc_imx.c |  1 +
> > >  drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
> > >  2 files changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > index ce207f8566d5..d062399ce15e 100644
> > > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > @@ -95,6 +95,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
> > >  	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
> > >  	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
> > >  	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
> > > +	{ .compatible = "nxp,s32g3-usb", .data = &s32g_usb_data},
> >
> > If it is same, suggest compatible string fallback to nxp,s32g2-usb
> >
> > compatible = "nxp,s32g3-usb", "nxp,s32g2-usb".
> >
>
> These are the same, yeah.  I'm not sure I understand.  Did you mean just
> add the "nxp,s32g2-usb" string to the driver, and put both the g2 and g3
> in the devicetree file?

Yes,

Frank
>
> regards,
> dan carpenter
>
