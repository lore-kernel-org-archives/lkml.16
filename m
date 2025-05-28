Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A57220F4D;
	Wed, 28 May 2025 21:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748467383; cv=fail; b=kPoFUMmFrWp86Zw7oOSpGBr+8BZ4xkJwiuXSSMxYDvFVesUwuhpjX/i0SvEL6LWch54DftkZoruwRfWYwmhmXksYdtJjpKT8NnOUB6aHLbJtBljVTVvnFmG1/P08ouOeqwb624q5X0DRdMld+Rc/o/t5gB5rUikvBpRF0Hiqov4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748467383; c=relaxed/simple;
	bh=AlAaLUzku6848wxLGbz1beQtOzcodf9G1jDC3qZCD9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UD2KDefz2HGPKJzyPybM2KAQSPXCmYgKHhYILang1jF3pB1p2nBBKN6KEn9Zpd411pyviTE1VeVc7xkp6/w6wxbILIRehynB42xMUNnuDa32spg2G+50o/bgAy0bBDp49Iq+pnmiXDXbwt2FoUoM1B8FEAv+5f3cRoh6MuHsq4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RPP2pJ7T; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RPP2pJ7T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naPgdYa9POc4kOYUjFWWVFT2lj2Cx15Quf1iMSQ7h7d6edicI0B5MbsxhnVP2nKGGbfG6bH9jsxclFkMpooY2Cnn79TPYvXXgBjklwu11YjtWfWGKjCLrDD9AF5mkME9o7EXp0Ep+tU+L05pL5CiWdtu8M2m9uoead7gnjucnrJH9G17rADz5eGPulMfEMOypaOWHxMA1soSmW4Ff4RnqkrCxXV7oki1yuuJfXoRNzdQs2Of+cqsB3a/66I9P2SkavKANrr31zEsqAbvcQjWWsiA61D8oEvRyfN1sGpy7Qyo3JHp1qqvBh7Xfz+EhSy9vlH4zDdqe72nbs2IS1oFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJN16DcLMnv3sJg0yypPM5iECI9+ARkx8VVRnEOYsX4=;
 b=Fi278x8T9BQBsANfYTY+kRDpJ3Gy9Af/nnXIsmO/oKj/mWO5W3lWNk8smfxcRsa/Wm1t7bxm2TdhHqVSuKGgJwWdXeBaqRGEjr9OHbyxbiSnrJe3hC0m30g5ZlzOWxXqZKsvuHYrzC5GEJGgZp49qjF74MekXxlkROwkWrQqIxURdFtXCWbUkCBqYsmiHzLhLWRD3RbXYRgTWx6dg1hfBtgam5dyOBhje2OgIxiJi6bot8B7zuIWxjP4dAzW62524uXlSsY2pJxMqIZySmJvf0R64eB+Ful+DVlYLt+ZVdi5fvG4fIday6dWUtlXAR2SDefbv4FdPTB2UJQpMzQAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJN16DcLMnv3sJg0yypPM5iECI9+ARkx8VVRnEOYsX4=;
 b=RPP2pJ7TVBb3XrKyKqD8wLG+4nXy00lUUWM8xqK9usYaGoBxme+uhyIgU36cWN1L59rispKvH9P9ThciPw5eHylgNjjzOTqLvzX9/dHi9eU6edPnKDEq6Cn2QuiVAhDzAAHKFAvM2grmFLBMMeyVRwj3fNSzGfRx6w5F+1TCKC949IpgKyhD6M3S0gP6hoMwKJavY8I1HmEzAH77WSM6o0F5t3gHZSMzn3K3mFDygV1oFcV/g7mfoLlaDIu10jCBn1cy2cGxZD5DvAPmJKlgIwqLTtgMRwoc/n1181AQVnNVGYg1sYKLBYK3ybGoOyQJVS0O5XxQOkUbQnYapo3NLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAWPR04MB10030.eurprd04.prod.outlook.com (2603:10a6:102:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 21:22:58 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 21:22:58 +0000
Date: Wed, 28 May 2025 17:22:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: Add compatible strings for
 s32g2/s32g3
Message-ID: <aDd+nOo2KV2QmgXr@lizhi-Precision-Tower-5810>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <2a4317353557e4fac2a7bfa4261a75886eebe41b.1748453565.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a4317353557e4fac2a7bfa4261a75886eebe41b.1748453565.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: BY1P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAWPR04MB10030:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b393016-6c6e-4226-214c-08dd9e2dd19b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XyHgSXvAtj5s3j+9zgkOyzgLmst7pbdRMpFk6rDbpFSLMnGZAVZzwmRZ6tF2?=
 =?us-ascii?Q?vjSRZOFD+9wt/RwXWgWiirLVXu7is83WE6rTg0WEvzqXZ6dFTI230ZTD3bN3?=
 =?us-ascii?Q?+4J4wn0YY9Jrlu/Zl2nhhtwzlwaLjMgT+uBBTeaXzkG3rejlrawrhenOyvh8?=
 =?us-ascii?Q?L5nqID+fIVKYYbj0+mZ1bGwrgoZeE/VNTUmRAKbm+8UCFdEtpwK7FEkVvttK?=
 =?us-ascii?Q?FN2X3Wb3+wPmSNEDRoXDpBz9M/3oD0fdwTY1Vz4pFQBYQUqfnxmTwmY4gCGN?=
 =?us-ascii?Q?aMy1gsFIB2zxCAXJXDKhmvitazqoKx6dEkRiVnrzOPj6IGIBKdsgyN033YIg?=
 =?us-ascii?Q?STK+9qjZv8CqlqIGUpOdcLKtnAql4MiiZNDmo3giljvb9hjxDM6vTu1R7+M6?=
 =?us-ascii?Q?fyXOVHql/+5jh7JflIu20JyGGiMgrCInjn4g/anMLRQRX0SLqLdJmJvv1CiA?=
 =?us-ascii?Q?hbtN0GdMlVbmuzgr6dxxuEe5MaimAf1y3/gW53Utyzkj5EImy+qdW6WwAFSk?=
 =?us-ascii?Q?xiVkYMy6lHXrLMaSWkpKDZ8aYNt5rPzBJr7y/yaJnvASP4n4PZ2jTrraA6wB?=
 =?us-ascii?Q?tzVwVKUaUyS8VTnxsQDTTFGn+0c+4bD/A/cTI+3mPDyePfSCDC+Ed80KezUj?=
 =?us-ascii?Q?M3HYhLqa41esJijRufdXIzTgGujI7ZUurN1+0SE4BXTYlAFxLLPWzxnI8wgq?=
 =?us-ascii?Q?eyggIa/aBL0l7AEv1HmCfGxuLXMWH8Y6BpWnLCEf24je2NNsdBUlpDRZcyN6?=
 =?us-ascii?Q?ZTQeAUOlE/7/DJZhF80A6HQR8k5ZJVCVJoG4dLw51gK/Xkt8OSV9rQKKq41z?=
 =?us-ascii?Q?1yK2z9pbLsXVdS2P/qulz6YKzo6UfoNnOqQ4zpnG3CaASs/xpfZZVOwXIFux?=
 =?us-ascii?Q?NPh8A5lIkcMUb6vAoUyHuTKevZ1zmki5vlUfg24/GJGDFVr1hrwdlzDHY0CZ?=
 =?us-ascii?Q?3P5TjjYX5g/1iWLOrtNYOcHvixwzPcBdvKoPOJCTlHLmM3cKTFUOeTd81FPt?=
 =?us-ascii?Q?ICMB6DHSVovq2m5JMoFRYhrjG6SDATj1dCald90eForWHSlbkHdQ++37Ilt1?=
 =?us-ascii?Q?vpes6hOeQ5uQdmw5v0ovr5ONMuGKRlFYTkILt1vwFaupeOErPuKECYibw6u+?=
 =?us-ascii?Q?BZXKtsHUdXVJ9xHR/cxG9Kd05SMLTXAYFSKhXMdplW2D7865Aqpz5KJ8qyi6?=
 =?us-ascii?Q?cqgAs8sw+vX/SMCi6vInvEAbuc0lBNVwbn0yAnh/+tL1Ycn4Woq5UtCEsoNI?=
 =?us-ascii?Q?LZXiGt/sT1Nwy/41s0caInWYnZUH/bMtukmqSgbwEqPZsB+GZ8725MYgqf8S?=
 =?us-ascii?Q?RaD4rBSQoWQe+DTgvilcQ54yHVyqcW/iam9CfZAo4KJkjUTYucFYkPMLK4K5?=
 =?us-ascii?Q?FfT4ums8YOUb7oZBJAOaxQUM7qA7gykVW2Ubh8SAgQNJ5AsJKGQQTLdibbRi?=
 =?us-ascii?Q?CiupWa0G1q/oGx2F1nRmFwys+2qlYemgYRIp7paa7P0n3YxrArZHH8MW/xVf?=
 =?us-ascii?Q?B4Y0wnoZrdzoSMA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?woG3FhmEww1XBvQ6pHqcSlYHpHBVXb3JuqMAc96s1aiqcYZgbiqDqAx+Ya21?=
 =?us-ascii?Q?Nn5Yc9xmgM1eyqFUZpffHv2FyNgWJ9W4zpbmPYOwpAA7uIRpPCIYAWRlctFu?=
 =?us-ascii?Q?XF2wb8ZQrJJBF1RMhBS2L315ZUcZJQ+kajBth97df07/CFl4AKhKoSYOnhyH?=
 =?us-ascii?Q?1rn+CTkD87CDSewLoNnFvzV6aSeT68DkIVzE13TSMZZa9xzi9vqGgfeEuwVy?=
 =?us-ascii?Q?vtTaZa2L4K4GEyzJE5Mdd9yimR3I49q9ZhtNpxEF+DC1ZRHsFIT//J3hwkRQ?=
 =?us-ascii?Q?r3CkoKKcE/Q416dzLCnNA+Kmoa6pHHE1o+CaLrzC8AFMdSLRXuVMIyoBTeVK?=
 =?us-ascii?Q?ONFxQRoiSFjC8C4tQDeujuUlSDz1vaMm7vuC/eYd4lGVypWF/PWxc9g2pgJL?=
 =?us-ascii?Q?s8yIn9IzXoOZg+PRFf6TNjYVhgyn43cTlJaRPoqpZmvlvKdj6Mn9tTw4Eb6M?=
 =?us-ascii?Q?LAmNitGaAEXzLhEZ8w7MQ7ZDC7YFIp2Pq+B25sWHiKsGqZ/jhsJmSGdrC919?=
 =?us-ascii?Q?GNuwjbKbx5OpZ/E495r6ajt18W6cXYqFw2I5NGiiyTG3nxZkcCSiNki3OooW?=
 =?us-ascii?Q?SctdNgsCMxjeD464rQMK0RF7hlT9yBGz96bgiWIyjZsKB7WrOaQag03zMelj?=
 =?us-ascii?Q?k0jFZa1PR/GuddkNdGEJ23JJt3c6VEz6XR0vSQ2aD836v4fzDoWiJ/r9p8yA?=
 =?us-ascii?Q?9sBLqDEOslB+uzEe+s99UjcrNfpi2x9KQLbF7Or/H3roDnKQwiuWlVpIDgPS?=
 =?us-ascii?Q?47dVHKkiz1RClqtt7WNKviSmuoDmjLj6bq99LhB3c+k95hW2T91vtsYoY3De?=
 =?us-ascii?Q?Ca4L4xoA/9YOT1Z6Ww/6TA3Nym9Oj1FVUf0DtaJGQ0OlxplUD4BwT3CggG24?=
 =?us-ascii?Q?bGXkIcaCq20qYFCGtUH16D7IvtsxWJ+sEhnZ5DxpHPz6Od97s9p/qo4XR74w?=
 =?us-ascii?Q?rbvYbETTT0Q4QvK0HURSCJ3oQ4SyytKmSoYMxsipjKhhHGtdSbjsxObW/36h?=
 =?us-ascii?Q?d3PDgTRObqfaHHYgRBFl51uVoSLIL4XJx7eun6bHuo1BiGSoabUvP/HdRL9J?=
 =?us-ascii?Q?V5Zj5VERlaUVc+3vnuw8KK5Me1leQ7caK6TX2oPci3XAF5zoXlsDCcrbbBc+?=
 =?us-ascii?Q?xN7/919SYtpQF8/A82JQj29n+mQliXpWCYBr0CmEx+rNfmFCvqrmxIEWcbZ5?=
 =?us-ascii?Q?/Qp0EE7tugnHJlkYH1zmcB8sW3cUGxClhZ48jH4//BFfp1nBJEK/teQm8YnC?=
 =?us-ascii?Q?CqbfflrAzgSm4b2d11mslK/7fJ7lms/jtUkZL1dSo+doHmHCmE0jK0pSPRIL?=
 =?us-ascii?Q?vBr/jEG+bKnrShpNeZV5yXcs+7zR0fWUKJQjXt8uJ0C5oT1cGFMzz0/3JXMj?=
 =?us-ascii?Q?wQq/iC/2BaSVuZWhG+teUfpei6CcBLAj8bBbVHmnuW5KHnW/lXEMVGh/iUFF?=
 =?us-ascii?Q?hoKuZd9WCDWEh/btb8cdcXlCK6qDv2jw8mWfJpZ1N49PgxAZBjEci6EwliR2?=
 =?us-ascii?Q?dqzRF6zu16IttvVJAq9adpct/0Idoy8AsdvSqdCv1Iv/p3VIdGQfzLMDLL4E?=
 =?us-ascii?Q?KbbJNEXRtqgC4cdGxmsdmByEKPvwIQTuL9O7ldz8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b393016-6c6e-4226-214c-08dd9e2dd19b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 21:22:58.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWGMYBV8G8X8PiYGAru4VKg8GORPpGkI/lkkUFrWivRrcBTxG7PNcpy9AJHrfZqujX+cNR6yqYjKWuNOQ8fmcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10030

On Wed, May 28, 2025 at 10:57:10PM +0300, Dan Carpenter wrote:
> From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>
> Add the compatible strings for the NXP s32g2 and s32g3.
>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 2 ++
>  Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml  | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index cc5787a8cfa3..400d885fea96 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -24,6 +24,8 @@ properties:
>            - nvidia,tegra114-udc
>            - nvidia,tegra124-udc
>            - qcom,ci-hdrc
> +          - nxp,s32g2-usb
> +          - nxp,s32g3-usb

keep alphabet order! Can you use b4 to send patch, look like cc list missed
imx@lists.linux.dev

Frank

>        - items:
>            - enum:
>                - nvidia,tegra114-ehci
> diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> index 019435540df0..ca677d1a8274 100644
> --- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> +++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> @@ -21,6 +21,8 @@ properties:
>            - fsl,imx53-usbmisc
>            - fsl,imx6q-usbmisc
>            - fsl,vf610-usbmisc
> +          - nxp,s32g2-usbmisc
> +          - nxp,s32g3-usbmisc
>        - items:
>            - enum:
>                - fsl,imx6ul-usbmisc
> --
> 2.47.2
>
