Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1711D8DFE;
	Fri,  7 Feb 2025 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926358; cv=fail; b=V2fR3huyrl8s1mylI0MPFKdNW3WsuYSGImCUVNQ+LuGzZXrBZV50BxpyTXNt2Fj9kdthT/UvTreTJbm6FejeR1KwA0ByvRlBnwMeGx6hygxgX9TAYLWohbAcVE48XhP86wTIpvn4pYHZerlyScGxu8eu3FkSaI0J8c9gyCzh6oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926358; c=relaxed/simple;
	bh=dTSDHHc50J50ES4GV7GEVDwtufJM7xhUS5TpdFpy4Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EscZdpU6v2C067andW/W/4ck+P2+mbvx2gERf4L+WmLtu4Nnl3IKn3d7AdHleDzDzq6moBoTm7LqWm9X5xaPZAmQYS97atafLaDQnFmLgC6CSh0kIsUYgZ6GR5OlHQaPmCOEQmD/775MSPif2OR3QgM0IQgs0HdjkztK/W8fdlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bG3zShBL; arc=fail smtp.client-ip=40.107.20.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bG3zShBL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmGifN3SD/p55JK5Khfler5r4AsIQEqotufphCptBRAHkW9u2tsZPW/qKcxMnOV4krTZQP+NGm6WlW+fLQrHQ5RjAtqciyx+evgmLq/zD6BU6v7AwRS3SOPFPE8jIcmSCBqLQ5361yaM4drEROvOl3T6nVbB45zopwYMwsvedOuHgHgSYfUvYdnphRb7ZvRXBezNKr9taMvwCsAd6uVUgMnzEJ6SSClR5cE/Ns23lWLPFW/gYPY1DZeTD9RhGQeuyyIYctZ+/8xKbWrFNmxl8oNB6KXjhSywtxQ4MvSaTKIkRg4GK9TCG2c52RSViHp1jl+NCNQ3TOn4kINa21BGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oN7CLY2IRs6RHhWb2vk1b1Kw+kW3FgypPlkSvMQUQhY=;
 b=dVFz4ad3ax6oh6xAM7tLhISdW8BujEAFKCW5tHcJb/CjWa9Tlfls5zofL5yo436YYcmltJoAG6gcJ+m8M7EjRWTkSAjHd/6Fxmm7xLHCeHF5KCxn647xv5EoxLF1rvsu7Re8hkwJMFlrcrPKG1TlPVQP5yiAE/+A5BA0DlknlC+RZ8HC4atgeku8c6UU2WstA7cx6h2pR/bU+KzX0HCIYEGUe3RJgQLDHGL8MgXt7p9p7cR3Y0wzeelfq/HuEnjNzEKdKXw600YBU7S16QKXGd+BxvJi+Yls6362yDXgb0haDptdx/SAgJIR2B0I3URVLHxbb8iWcdbzJcf4XfIjVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oN7CLY2IRs6RHhWb2vk1b1Kw+kW3FgypPlkSvMQUQhY=;
 b=bG3zShBL2cEd65shDbkA3VTwONmVqBJV5KRuHrxeE0eDlgk6Ns4N2D/ee6M6zMaX8EGJkNR3Dk/HYILEKBZtkKD8dcUkcYmC+fM0IHy/Je7zaDX7PJgmn8Y8GoLecI8tBUVjKrmHreht8V/PQ9SJEOrW7y7j/B6yX1TnFTx+FfovEdfu8HIjh11KLWOXU/1gZZp0gh93UmVztZFm5IjmAap18mTulQnfhid1ob3OZ54WdkPsIfaxskBdPYwOGMliqs4i/p5xIOwfmnpvkD2Od4A8eHt26XlpvndHpaPBPbHayT6FWy6slPb2XeDS5X9BgOPn9VywFLYLVqaD6ly2TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8445.eurprd04.prod.outlook.com (2603:10a6:10:2cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 11:05:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 11:05:53 +0000
Date: Fri, 7 Feb 2025 20:12:37 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v8 2/2] nvmem: imx-ocotp-ele: Support accessing
 controller for i.MX9
Message-ID: <20250207121237.GE14860@localhost.localdomain>
References: <20250204-imx-ocotp-v8-0-01be4a4bb045@nxp.com>
 <20250204-imx-ocotp-v8-2-01be4a4bb045@nxp.com>
 <Z6OWOfTKIi0EBdZy@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6OWOfTKIi0EBdZy@lizhi-Precision-Tower-5810>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0196.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: c9093198-2fb5-46d4-0e58-08dd4767638a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0sP713uH147kPHTlaxv41Xi7viH4AIuAMd0qiMUuFmMefJNaYKOx6I5pBx89?=
 =?us-ascii?Q?ynEQPBKp2aC4jm1XLODZ3NW4Tl9cuL3045Lp5MclYkfmBVMz5POktZYrhjtR?=
 =?us-ascii?Q?ac2gaiN32rovV9IkVq2tdMShAT/AmElEI3h7jbneiWLy/N8aF2S+2RY4UnEo?=
 =?us-ascii?Q?hRQSfl3+/M43PeabB/a17FuAj59sSAHVU+IovWFAXvS+0Is6MIcLOKVp3K+K?=
 =?us-ascii?Q?HhPitzOC9FckPUEuNmEt/xB41iw/qZSepiEMzwAF3foi826ocolY5QDVTIon?=
 =?us-ascii?Q?w8XDxya6veHqW8m1cCFCUfHQ5TmKejRLnupaW92RL9Z0wI/8y/Dra7syS2CX?=
 =?us-ascii?Q?cRP75inxnF0naxldgHEu5n63q4yTAamrm25DaOXPjhhduaxyJJfbEHwE+Z6I?=
 =?us-ascii?Q?Q0Zb1BBl3mh1e6+hZ1Q6mG8Jmo36+Y3LGHbGmJ8qTkUpx/j/3Dy+ODWHwSvO?=
 =?us-ascii?Q?RuTYEMBlxLakrq0+s9icc3qlB4x4ePyljryY1Vr3c0cq8TiVhIqVgxOyXXcg?=
 =?us-ascii?Q?lPwrU31j3wXxDGdIMvK3JjpYqTzO+QfDiKwxUEOhx5mpBOtm5ZQv4og+l6/U?=
 =?us-ascii?Q?L7w34UoKsdXEgnJcBRBX9zX6sf4WmCoD+wWM1BQmVHvbY/hWa+XNSJqk0cvB?=
 =?us-ascii?Q?rJO510PCZj7xvWnJkCvh3h+COrrEoU7qmQz/6Uq3+APNcilYiee2li1sPxrg?=
 =?us-ascii?Q?nDHRqckDFjYD1haKdRJECnA3j9ltawGGG/h7EGCAGPqskmdsoGoklnqqtHMP?=
 =?us-ascii?Q?VIXiGCkeRHyZixn3tFeRwIOYPvbGJS89kAuSbOlzGmhCjU/XJXXk5F0ZUu8q?=
 =?us-ascii?Q?1U0xr071ZF5qhX6j6NfWQdHgzStLSScFaroTU1MTXlaGHkucpv0gWSmlknSc?=
 =?us-ascii?Q?2PA/cd21BU2D2ZO4oipSJ9zr4AH2NfPhjxrqUDEg8jPEvf+9eaQYoLsgHxJZ?=
 =?us-ascii?Q?/aiUWwMdrSMyjKi0iQ+xzundOlp4KBqefXifwi1CphWpN6LVCxAewQrtWTs8?=
 =?us-ascii?Q?p2DqskkA7VQZUC/tnVhCOFcnqox2HzxqHKMbemnUlrxxpinbs7EpFtI8B+Zm?=
 =?us-ascii?Q?YvPJ+PWmGwqV+v33sJtU5Ap0VXhXFkZuE5Pq4SreVhrC8gX06UGbC1o1ovaz?=
 =?us-ascii?Q?kza0OLhsCKg2P33SHK4W4Kid3O34P6yInuLJl2IaB3EHRx4zx5H4xCEf5wUt?=
 =?us-ascii?Q?Qwpjn09gbNFNzULo+/uSQ1vKM7DdvaVjz7zi8tPColIxv48cp0ksiblXteJS?=
 =?us-ascii?Q?JlHwmKQr+8tQVQEkDgXNdqMSRwFj5HjZtRsmEdcKj2KmzI+zF9UwTGVCLsyK?=
 =?us-ascii?Q?NaXqpRYBUL+Z8wZoBvqfCMxnsOQxWlH9qoin83kkFIfLQm+hbsW+gs5GV1y/?=
 =?us-ascii?Q?swOD9fSBYOVIkC6tvVd5vrPLikEi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XsBIjc+awuOxhQJpxRqgZam33K588ySr7ICUB5cCvIqOMhHAIR8v7cdODRbL?=
 =?us-ascii?Q?X0w2Unh1hSb9pviPeDYMvLaogPe8WiJHK89fieniKbVe2+lbo899rioTjHgc?=
 =?us-ascii?Q?nD/f1FZD8MvAUMlU5Fg7d3xVNfXX8U4JN/GLzwLl++uXlSHOj450UhkSu+FN?=
 =?us-ascii?Q?0um/+LmRF3w+xALz08vCiqE0Om/7GEJ2SyQfsoR+VbT8kOwaih1nFNxThIrt?=
 =?us-ascii?Q?oADv1pP+/rF2yBd6oyuUL4TwYWLyOzDls3vDH7fSPGHVgfYNlpGy6rKSonJL?=
 =?us-ascii?Q?BtiYxVLGJuqFRvqQokuKW+tl3j990DGLoQmubNkfQtGFiEXSeMHu6OxbKYXU?=
 =?us-ascii?Q?FwwnCDEGixE+wSFEb1hH8QZM7AbdVDLGISXeHDidbwpHxwjyQmFPBt2rzC0p?=
 =?us-ascii?Q?sXU3sIqziPhZ/oxjjO8Tnpy/P/Aiiti6j9R+SQasZsfn6zcW/9ks+h5m33K0?=
 =?us-ascii?Q?9KHWc6btIrWyYt9fp8oRyIEwwKECk6q9Oh1bSYlSIaMveS6INg8eMl0hHsJ6?=
 =?us-ascii?Q?6zRwYyKtuPAa9PmZnbNwL2Fn2jwLCF2OF78mNO7nMtIXxtkgYrNmcTEQeSFC?=
 =?us-ascii?Q?UxJYOYfg9idJPoOJqrN6ZcG34Ox0OIGbZ/13ge1YYZqwfIpZ4EEaxKNw5BL9?=
 =?us-ascii?Q?8R23N3S4f38vhalbEa5j+KR4mzRGu958zdezLxww90lEdHPaLwNArhOTZYbz?=
 =?us-ascii?Q?ppLdAuvf4wk3Pje9WfUGrS+9Lx/0jdul6nJL97w7o5yp9x7RTxsl8sUvkNi8?=
 =?us-ascii?Q?5WeFEmypgqEtbJ0okHPLzgHMK8/3W3U914Hk/WF8KqYiUAboPBWvXIKdzS/O?=
 =?us-ascii?Q?Cg6wBEKZDi4ZuRwowHtg4R/Znu3tlEEz5o418LXLWFf86uhemheuiW7ljanO?=
 =?us-ascii?Q?B6vC3fA/c3BRHdxpYaQra/VUscmfiEuy9B15gI/aGljZoih7GSXeCl02Ytuu?=
 =?us-ascii?Q?RZ1gVZChp6HLdGMp6QuB7lvk2TOSUuvrLk6h2S9j8RMPy1Z79qNqgVAR27+H?=
 =?us-ascii?Q?fPAts4umGwW7y2M/TaiCbHp2htvchX1vlzLg1LLn1RxZ/fuVWkdkNZbPWJYC?=
 =?us-ascii?Q?ZdFiiibMZm4HvHRU5dBg+RRudo3CM59hCkas6BXmo/VK8Q8mAznHDXEO+FCN?=
 =?us-ascii?Q?J5GUSL4SkiBRXLQHR3n4ajOHYrcRFNmwzZBFDbZuo87YkrDHD6a1He1OheBa?=
 =?us-ascii?Q?wzFx22hcqf390idzH8/IIAwG/uFcoCeN0BAB70vkM0QfUkar7VcgQWtKmpPg?=
 =?us-ascii?Q?l4n9bMQkaYdufV+X8ps5mC1MkDtKq8xgz+gjeDWsyuXo2JznVtjh5jX7rOTB?=
 =?us-ascii?Q?BSUb90AR2653RK8WT2cQ3+KrOtQ/2OZt9DyFC9DjvzuA+t1qx6eHyh6JGycR?=
 =?us-ascii?Q?4MW5DiX2GllHJMNlS7+1AaAHlHQJp+hdFLs2Rn53rI2sxpL9vvEw6SA/PV8H?=
 =?us-ascii?Q?ir3FJcjasG/JSX9KIoQ32wFNZ8JnrwLltVqiwCWo/JXx10IAZjET91Xf2cp+?=
 =?us-ascii?Q?0UiAaghMu2eKxOIi22amQid/HRIbNjX0srWelHSx6exIDsFMYIN6cJteRipT?=
 =?us-ascii?Q?7lJLpvGt62U5bMFMQ6akYqNaD5WKEZWXyWodJp0O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9093198-2fb5-46d4-0e58-08dd4767638a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:05:53.6065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IePgGNMpeTRIqtdGrc9UzHYUIVjh1SsYaxykmkYTNEEmg4Qgab9/iopAUUm+KGaI/0nh8bzYHyfCs6VRWF/qPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8445

On Wed, Feb 05, 2025 at 11:47:53AM -0500, Frank Li wrote:
>On Tue, Feb 04, 2025 at 08:41:14PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> i.MX9 OCOTP supports a specific peripheral or function being fused
>> which means disabled, so
>>  - Introduce ocotp_access_gates to be container of efuse gate info
>>  - Iterate all nodes to check accessing permission. If not
>>    allowed to be accessed, detach the node
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>
[...]
>In another thread
>https://lore.kernel.org/imx/173828013202.1872493.8212881147597194221.robh@kernel.org/T/#mce7b8226138d0523b602b69de679f3857fd86706
>
>Suggest #define IMX95_OCOTP_CANFD1_GATE 17 0x100000
>
>#access-controller-cells = <2>
>
>So we can remove these static data in driver. If want validate input data,
>we just define low..high region and a validate mask to check it.

Ah. fine. It would be better if this idea could be earlier.

I gave a look on the thread you mentioned, seems duplicated check
code.

I am thinking now to drop my patchset and provide a common framework saying
nvmem-access-controller.

Thanks,
Peng.

>
>Frank
>
>> +
>> +static const struct ocotp_access_gates imx95_access_gates_info = {
>> +	.num_words = 3,
>> +	.words = {17, 18, 19},
>> +	.num_gates = ARRAY_SIZE(imx95_access_gate),
>> +	.gates = imx95_access_gate,
>> +};
>> +
>>  static const struct ocotp_devtype_data imx95_ocotp_data = {
>> +	.access_gates = &imx95_access_gates_info,
>>  	.reg_off = 0x8000,
>>  	.reg_read = imx_ocotp_reg_read,
>>  	.size = 2048,
>>
>> --
>> 2.37.1
>>
