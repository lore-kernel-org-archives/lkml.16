Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E94DF58;
	Sun,  2 Feb 2025 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738488994; cv=fail; b=edeIsxPa9uPxIVUokluD/TzZ8iygyc46w2qUBnnmgVKIQsl94Hp1kO/ZND3hDuatpt1AHbWWF6dmVrq5wGgHhZpnOAJm7+ZGJJ9HV3OTTHUbUf0Hzf408vxXgAfRxSd0Ha24BLxmiyQE0JCPSUXsSoXsORle/QcjnU5jnAkybBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738488994; c=relaxed/simple;
	bh=tFlRpwxPOeIi0/wbrRH1v3QPxXDuOElQCDpiq+ZiMw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ActHgv0wHPtrC1cjADPpHB8iLUFziyGw/7UXQ5LkYG/Sp5QhYWyLdou4b0uoCx+HZnXcYkDy06NI9YO7uClWBMwAU+eEgLlGGgR1vkdIY9U1xAdKKkJ/2wcTAoE/pBXkiiiLLZ5C6eDPYPC5CeKNM2WcucogMtdwUPMjthyPXZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BWwDcUKH; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BWwDcUKH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZnCwCUEx1jbnEqbT0otuT32lDoAlSPkk1S0Hi7Mh19xlPHKWS00EalXrnkUtOm1Pp6BWSqpxBR/WhM5KSotG4J6sfTHO0gr9ZzfGYsVuAJBT4CfXuUQAN9rn8utF4ZRLbRiYFTXQb0M9EyH0nESY6yTwp3rH1oDWfoSWQuwPycsaeEC/KnX4gCLNJYj/f32xHG3bT7r8CnzDqAzrDF8oiWBjYyPZV8F1a4HkypTO1tIa319aAkisOantFyEraDE/C2qKEqQmF++HzCV6UQRjTeMc1EncVJNf5M40HmO3gv9hZ7tHyCYj1SBWyZJnl46Gbdo7LY/KNumx2NBez6luQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59Z4VQhhWWvQtK//1NQht+DWR74g29H/WXsR6YfvKqk=;
 b=jvyCByd848iNoD0mc1GVjWEUF8zr4cBaYU4a23hiNzsBdeekAgADlYkNfv3gWpIiu+9xKUX+CSHVacOHYE8OYfCQ/s59xVZZwrRK/B5sacr5/xuIHQWjxeU1aviIInq16oM5wnkSrp/61eypUn0MSGBhrPVo2usGHeSik7DabxfcoHFgvQ6+Fc65XBoufLCeQKzqy9OhxNRQaW8umBla+2SCxwXnpHR4MRq3CocBoY6vqX73PWLDlrmSHhjum55vpUUhnmVpZzKS9AXBPVPbOi+8eWR+giLdqlfgaPm7EbF4SSR6cF4sAbldxj32i2teRR9WZVNH3leTdSuISocYdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59Z4VQhhWWvQtK//1NQht+DWR74g29H/WXsR6YfvKqk=;
 b=BWwDcUKH+qvLJ8bNcvwGOPsr93I3f7q33fheJXh7a1D1YND/57VRtvvhKGjWCsE0hWJYBN59SUKjOr42J0dE9FftJ4vRov+y/wuNTB1Pki7euk7nA5EzxT4slXBTJY8FQNB5gRl4uNhmA1BWUAwKS7+4yP0zjotdfSNBhn2kcr/ZsC3LodTyb06Gm8nkPqSy/gGlqNag7gd5plinD4+VfUJvfdIiTsmFp2QxfIFdslHIfAsTvDp039EdCgkDIMhsiYXFCN+n9uQjPsS+UzajSy8h/Phpb+n5ftGcWzqVJFG0k/9MofNlmI3302v66Co0YwBYNiO8ZzMRl6aO6DU7+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9914.eurprd04.prod.outlook.com (2603:10a6:10:4c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Sun, 2 Feb
 2025 09:36:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8398.021; Sun, 2 Feb 2025
 09:36:26 +0000
Date: Sun, 2 Feb 2025 18:42:56 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Message-ID: <20250202104256.GA13402@localhost.localdomain>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
 <ff801714249c492abc3781da55675a38.sboyd@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff801714249c492abc3781da55675a38.sboyd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9914:EE_
X-MS-Office365-Filtering-Correlation-Id: a11edafa-f407-4ebf-7db1-08dd436d109f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9DMCOSM204i/z2eSsE2d43KpZSQIFawMWLiblcN+SSLGnBS8aux9I4tf+8DS?=
 =?us-ascii?Q?FBtHdQoGCVdqyF+GbqpK5zvKuNX6EZFYjL2XU4/kE64AB36LdNCtPVeGcxwb?=
 =?us-ascii?Q?evs+bkrYLCnJKIlrkNPoEB2EFeWB4WP6qZrVY/9xH6evF536WM9JwuTJxSo8?=
 =?us-ascii?Q?yXiwJ6eJwjivwirmnIenpouzA0aG7jc2wu433wEAw/mOpcxEKyYj5R0vvlTG?=
 =?us-ascii?Q?4Da/HdnTKVvaRvS71h7d6VLm2zVWDqCGE9jgruWnzXR/zn33Sit6VNXHmsRB?=
 =?us-ascii?Q?Zi3lt8RiDLN2cXluEfPftdm5NJSho2r56LQnXa7SozgLlyK7wNVOUq6EJQvt?=
 =?us-ascii?Q?QX4NBxFFgqLTrHWlY3a+xWnvKP1v20aRFDPReNSO9bJ3m9DqSf6mtmUE4FEB?=
 =?us-ascii?Q?m6fYFw95byszmjzXr5CHJr78Pk7Q7s+edZxPoCP1kM2MHYMTz1DqxnE29K6M?=
 =?us-ascii?Q?Voh+7/Vb7L6HCHAe9ckZ3JbDTg+Lo7CbIU9fQpb5KJPOKAd81UolYMuPupg5?=
 =?us-ascii?Q?u9uUQyDkHK2xL8wKOIAI0AlG5yV/C1Af7K5IgkUFi1+BgbGLh9yd8oePnteC?=
 =?us-ascii?Q?wGvcdTaotabJDIilGf9N4KeSXnoRd/CMz0o4DanlGACc/UNlNvZSRBKfnnLQ?=
 =?us-ascii?Q?nLBgm/4twFQK/QeFaC+PsJUyJv0OX+ppwjCFEICJu+Tfx7W02H+E7mHn/bsd?=
 =?us-ascii?Q?YeQTtDb+pZSdQEEUtr7j0MnTm86Cp12GUx4bh/R+vqX+boKPYzd1+asY3b2d?=
 =?us-ascii?Q?3O8G2fIBw+Eqf21VLlm9i2jinH9i4d9JnGE143OQZpncSZrQ5Zy4lwjwI0f8?=
 =?us-ascii?Q?YvoCg2eSvHgFv5Bh8xo6dKcBMZkbQF0+J6GeElhIJfDTfCV6V4aeixvDZuhd?=
 =?us-ascii?Q?mZeFdITQxZEFcJMk+HuEBZypkFg4a417PfYZJmiGP4mDIBgs/lSET5J/lXZ/?=
 =?us-ascii?Q?4ldV4Nhk7dLjfcfc7867xmIFp1O4c9w5ZAwhIe8WRwR5S0/SxtTzMe7BtTk2?=
 =?us-ascii?Q?vMaSCisMSMfC/XKgV4DCBJyTlirnpaqej8aHxRsZaXIJLhYXB9QqudDDaPQF?=
 =?us-ascii?Q?zHYMuslnZzupc+/mVwSUc8owT1iu4+RL91ugPIlPTcPOjCHzzKqiReVuikKh?=
 =?us-ascii?Q?MYaPV6eUQymyD25oyCwWTid/xt2JzvPOQx9vD5lXBug/8OIMO4vI5RU8M73K?=
 =?us-ascii?Q?6eYhKfNl/yuVbPRELalnm/8XL5QhM1KMwK2F2ckhj++dlVKuNO8AzO5hsHZe?=
 =?us-ascii?Q?bwd9oERiHEII46V2NqeNIpkxLOzcx2XlIPm+x6DgMozqhqMax/jhJosv49An?=
 =?us-ascii?Q?SWsWvgL7dK+UgN50wyuloJgSU3bil7lX3kLkrdOL7c9JlNoVZatd+PAuJ+Cd?=
 =?us-ascii?Q?WDtu9gdkCxOl3EUmcsXd9PSVeQw0hmvdDy2tnSA1SxJnGEHc23iJaCsx4aJA?=
 =?us-ascii?Q?9HwktjWhSZz0oz/I5026gfS8XQzAPrVG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AYc++LKvxh5pZnn2/bdd6kDcHzOaAPeZ5vBy+FSfoagbY9Ry9mGFXSLQOX0Z?=
 =?us-ascii?Q?ZqNIUo2jJquC+rzcV9EDzfMuIKMWrzGJZa70TJyro/6vIwcx10uPONbhpp63?=
 =?us-ascii?Q?D4KjdALr+8IxSLIh7YcpblbnfdfEni6fAoQ2P+K5Tb/QJI2+qwRTkTJ+WrBt?=
 =?us-ascii?Q?tMrdtM+B1sNTHuLTLdFPivt+1x5FyXyEnGYF/xSEXh7zyUWc6+a1+yOn0W0W?=
 =?us-ascii?Q?7Qk25FND+NA5PnYjJ8AZpe9eTGgQmZ7RdBnZbuTwji49YY/7vmjVAFgG+sM5?=
 =?us-ascii?Q?OUSnRj1NhO4GoDVahKkrn8QosM9y/SKKZjQsMGWfv6j8tek+9L7wsLFJFoeJ?=
 =?us-ascii?Q?2A2F+MlBL0J+2ZbDV6vs7/6PD0pwzHM2A/PxrfgxUOLsnjs8xsZa1BYFLAhT?=
 =?us-ascii?Q?hnKniQRs3ZPc+KLXHJo9oPt8R9e1q/zxPGnooZx+S6yuKXfFvExUtwfUkbge?=
 =?us-ascii?Q?Nj5Dw5g0YbpDf4wiqxUGptCLtUzobPb3cl2qepTrOXLhUoCrj6XfWXRf7ENM?=
 =?us-ascii?Q?ct/ZggVT0GxAmYqJmqWxgB5spqn/RfeSpH2eWxco1ocHcBGmi9vfY0sGav02?=
 =?us-ascii?Q?pIuOjc+QtJRUNpq+TNHafvg3SyKVaal7AY59aoDQOEYzoQemYykcsg8zKi+W?=
 =?us-ascii?Q?Dnz/cB15SCemrwAZLvTiYwQZqrmiSBdFVrbhH47OVfrqRAxEwonfRkG9q9HE?=
 =?us-ascii?Q?anI0v4O1hhLSGwWtulOq7C6R44VnMLvi+GIO9ypI31Va0eT/nRnAJTNumUpe?=
 =?us-ascii?Q?uhR+cysaxde8FSGaZYW5yhdFve3LEo7Wz/WWDAuphjKK3R5B4OXJjha6YLAu?=
 =?us-ascii?Q?ayiLtfwe5vbAxdxJB+JJB+GF5ZdSVDnfpOgTDXkjrYi9TaX2X4rGmfxkHqmO?=
 =?us-ascii?Q?HV6DhVAz9Jw+vBydUGRmrT4Z+u5aY6wguFae6y4hpWGyTmQFOcVOUvXhu9dX?=
 =?us-ascii?Q?rKeYohjeSMUzRJc2acxOHlLqlHEgHObyYG105+Ncdlofv4maVjDWcFq0WNKr?=
 =?us-ascii?Q?NTPJVFIUa+dvp+XrvCx5aAGNqvLyncSlHMsWNlrXq7BnJeatllR9jPX4hPhJ?=
 =?us-ascii?Q?87S6eUXNcZGEzbcbbFQi4jkJhOgDdnoqBnhtenwgWqKKkpA3JNm7EBvIlvYx?=
 =?us-ascii?Q?LJKgGU1m9lXwnXNzwOGj2xmqLYLpMYpCWDe8/ZSntSEgv353YWnWhYPqOyY0?=
 =?us-ascii?Q?ifQPBKFVyaQJKpQm4xyi0mAQm4n0kWC7fAOp1T9gp7Ot/kdBg4Tej3swr73m?=
 =?us-ascii?Q?1/3iXuJV9o+tGk2t51QM2EnTP+ymeq2kEZj4dTfezoliDc0xZHVOa94hFyMR?=
 =?us-ascii?Q?olHW9fbEgTrHXHAJjlD7iXzOkkGEwiqB3+OizxmTsStCvkklGr+HDeYCbucE?=
 =?us-ascii?Q?62T/rPdlTs9tnOf6B6RL+ZgTdM24uarjjePto3ECWg8L9RA6QX6qYnCMFAwB?=
 =?us-ascii?Q?eTisQBNSwnYJdMU5zO85l0c45jA45+piNhVu90pnKGmQnXPbvrErKAkp/fSi?=
 =?us-ascii?Q?w8U6jONNnJACYiOKL4PhGhSh9uNyaZmza+p50IOCKMsKVMdjPm7T+dAg3524?=
 =?us-ascii?Q?Y7IPhTOCaTzQwKaoL4B6VjCAPWrvj7ALFr9XNk0n?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11edafa-f407-4ebf-7db1-08dd436d109f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2025 09:36:26.8517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47zdKRfdZqqsZp33/hPDQFNDjIWwCCabCPUIwVlUFhM7L0ewswiWrHYq1B9KQKYOCEvjKjG3I0UpwUHkdMKqdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9914

On Tue, Jan 28, 2025 at 12:25:28PM -0800, Stephen Boyd wrote:
>Quoting Peng Fan (OSS) (2025-01-24 06:25:17)
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c2751eeb38dc4577b1f 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>>  }
>>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>>  
>> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
>> +                           unsigned int spreadpercent, unsigned int method,
>> +                           bool enable)
>> +{
>> +       struct clk_spread_spectrum clk_ss;
>> +       struct clk_core *core;
>> +       int ret = 0;
>
>The assignment looks unnecessary.

To avoid uninitialized variable warning.

>
>> +
>> +       if (!clk || !clk->core)
>
>How do you not have clk->core?
>
>> +               return 0;
>> +
>> +       clk_ss.modfreq = modfreq;
>> +       clk_ss.spreadpercent = spreadpercent;
>> +       clk_ss.method = method;
>> +       clk_ss.enable = enable;
>> +
>> +       clk_prepare_lock();
>> +
>> +       core = clk->core;
>
>Why do we need to get the core under the lock?

Drop in v2.

>
>> +
>> +       if (core->prepare_count) {
>
>Why does prepare count matter?

I was thinking to configure Spread Spectrum(SS) before
prepare/enable a clock. But it should be fine to not
check prepare count.

>
>> +               ret = -EBUSY;
>> +               goto fail;
>
>We just left without releasing the lock.

True. Dan also reported this. Fix in V2.

>
>> +       }
>> +
>> +       ret = clk_pm_runtime_get(core);
>> +       if (ret)
>> +               goto fail;
>
>We just left without releasing the lock.
>
>> +
>> +       if (core->ops->set_spread_spectrum)
>> +               ret = core->ops->set_spread_spectrum(core->hw, &clk_ss);
>> +
>> +       clk_pm_runtime_put(core);
>> +       clk_prepare_unlock();
>> +fail:
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(clk_set_spread_spectrum);
>> +
>> diff --git a/include/linux/clk.h b/include/linux/clk.h
>> index b607482ca77e987b9344c38f25ebb5c8d35c1d39..49a7f7eb8b03233e11cd3b92768896c4e45c4e7c 100644
>> --- a/include/linux/clk.h
>> +++ b/include/linux/clk.h
>> @@ -858,6 +858,21 @@ int clk_set_rate(struct clk *clk, unsigned long rate);
>>   */
>>  int clk_set_rate_exclusive(struct clk *clk, unsigned long rate);
>>  
>> +/**
>> + * clk_set_spread_spectrum - set the spread spectrum for a clock
>> + * @clk: clock source
>> + * @modfreq: modulation freq
>> + * @spreadpercent: modulation percentage
>> + * @method: down spread, up spread, center spread or else
>
>Did we get cut off?

Sorry I not get this point.

>
>> + * @enable: enable or disable
>
>Isn't 'disable' equal to spread_percent of zero?

yeah. Drop the last parameter.

>
>> + *
>> + * Configure the spread spectrum parameters for a clock.
>> + *
>> + * Returns success (0) or negative errno.
>> + */
>> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
>
>Does this need to be a consumer API at all? Usually SSC is figured out
>when making a board and you have to pass some certification testing
>because some harmonics are interfering. Is the DT property sufficient
>for now and then we can do it when the driver probes in the framework?

I suppose 'DT property' you are refering the stm32 and i.MX8M SSC patchsets.
I am proposing a generic interface for drivers to enable SSC.
Otherwise we need to introduce vendor properties for each vendor.
And looking at clk-scmi.c, we need a generic way to enable SSC, I think SCMI
maintainers not agree to add vendor properties for it.

>
>> +                           unsigned int spreadpercent, unsigned int method,
>
>I'd assume 'method' would be some sort of enum?

sure. Fix in V2.

Thanks,
Peng

>
>> +                           bool enable);
>>  /**
>>   * clk_has_parent - check if a clock is a possible parent for another
>>   * @clk: clock source
