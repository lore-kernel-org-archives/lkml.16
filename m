Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012058.outbound.protection.outlook.com [52.101.71.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A49D221DAD;
	Mon,  7 Apr 2025 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053976; cv=fail; b=EVC3OuBKoeIFkW9lAnxlRhtGY61dA/VQGCUk+Ce89yJgcpSzmiEJP0o0MY05K8rlXM0A+lWjz+12hPO0vso1JUmiS7TaCVmQKNxJgSVAAsf31Cd1E9d2K7RvO4Zg1zTFHtJQNBuNgSRssYW9pJG6f7NiedwvsbXQK3NA++ZBUNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053976; c=relaxed/simple;
	bh=YOnxstjDSB3sTO9QgtBFVJyXuChEvZCldGV+iL5OB1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oggcYPWK5GY0WDFqLRyRmwbtkFJX2lNZS+HfRFVNE4//YOq/AJY8oEHt5Wxy3SXD4ssnubGyAKemp6AGbAjNs70N0B3FRVy4TD121V3b/jUbriL+iVVT3xwlyhZ3O/7eDg7xX4J2YpWfK2pZ2yd4AN0wT05gehWavYbrV8p8Ebg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SVOOSTYp; arc=fail smtp.client-ip=52.101.71.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SVOOSTYp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ2/KI2ej7vQO0xdT8InsiWXQHC/PvcYxXSs7QqeQXsebwlMbKRW8R8r6srvDPhvCAV+qAdHIdxY5WjL+c78P7oeYxtq39nO31fQsAVShrpZbsBEwobetnlYulJSWdp6Qp6rEX8PN/mBNSuYhFqPwi65DVbPuQn0lmd+hqNWQJT4IjssastA5lg9Gt7LkQz6Fq0nCKgJvZd9p3km/zthl/iN/l0xp/0zUTEFSJolksmyszW5Uh04q9oKsiv6XOmW7cQtf/4P5bSU28ezpWCi37LagoJxEOFUS7RPJKHiA05+fWRkdav91tW1cPB47dzznRs62pEEQMBwM7NAHkiuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+15783izdVFfz88UoD9str19Rgm/173fz5dz63xpAfA=;
 b=U2getCwcARzs/N/cQ4nIs15sdFuCQb92L8dm5iZp+aimNKVJQM22SGl0qh8NzAdLF+YZb8AEUzO0DUsbZTbOiwnixHYTCPuWGmY8KQR4ne89YCK+51bI58Bnr2UBtZmXl8G9CF+xHSeFwEU5Na9MM+oKlZ17sLZBq6qhWK3AWi4cZbZOfIIKr8IVGgx2/U/mhaIVs0Q2MQqHF+ZFCM1TbGQg+Gp2lZDsAOqZPkotgXpKUp7cKHgkeRTq5K7W+GF6DypUjJUbuXI9sNFC6Umkb6BLSiQ9mBSDoTm0pFBObBbZUmFak7iP/1AsqgYlIK0J3G1Kz8CyPKrfe8IXxBYfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+15783izdVFfz88UoD9str19Rgm/173fz5dz63xpAfA=;
 b=SVOOSTYp9bjHVM2ocwElImxyqhHP774oBqFisi7tyFkjldIz9IIMB5IobomMrWx454euem5dgoVDBZJrE8cmpGfXs917yH/n3LZOsKGqUxaLbuJddC8ZIjVlsymCvOFzdwScz0m7llTiT5h7tejURdgKyrfE/6u8zEbbOyclg9so2QVincb8ZB+Mzfvvnk2fCjwnvLkJpPPKSYa5p+ZyicWNzZJ0CKJsEWd3sozTVhT8vgpjbr/uj3/syW3x9TyRtR1pDCOK0VgWmOSSSGuGS3l1x54ksf4sUboHuRj1SAaR+y4GRUx7niWtplIVFgfRV8DO04pT3Ygy5tMchNTZjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7747.eurprd04.prod.outlook.com (2603:10a6:20b:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 19:26:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 19:26:10 +0000
Date: Mon, 7 Apr 2025 15:26:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v15 6/7] firmware: imx: device context dedicated to priv
Message-ID: <Z/Qmyn8BcSJNdYtW@lizhi-Precision-Tower-5810>
References: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
 <20250407-imx-se-if-v15-6-e3382cecda01@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx-se-if-v15-6-e3382cecda01@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 6497e93a-d26e-40ec-692e-08dd760a0d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EzaJs0CFlBms6bQ1N/4aFqZIKaqFKxuJ0dT1ZqGgPcp6bFCBveCVomGxO/UA?=
 =?us-ascii?Q?9l4vGiLSluya+8Kdk79gX3t2mQKZF0Vf8DLdnXCIDhnhnNQhapZv3vkewPsJ?=
 =?us-ascii?Q?AD5hfvN+x15D82deZ4EQrrtD8n+XPg7nnXPLCGvHN502+cOfCGtllihekJer?=
 =?us-ascii?Q?Zg3snx9u0/+OqnPKGoAMiTyxqylLxBeHuh7ifEMTYqVts/hJqwYq8w1R+UjS?=
 =?us-ascii?Q?To2MibW8MNWfRGIheyFTJZ7VYVEWG9EKVZAFrWMW/CKoQ10gCLGQhRGpnddr?=
 =?us-ascii?Q?4SZgSM29pnXRFcENxTtEtfUCNC1gfe630o9UH64a3a3HcN1uk3hartU7R6ei?=
 =?us-ascii?Q?nAeo7jO8nq603YiZmkfYYpy8/96LrtfDmFQ/GIqG+Y9cxzYCNc0uzNm/uIL0?=
 =?us-ascii?Q?ZMd19LC1f85PwQLeVUPOcXJ0iC2IHlo0x/1RE6UphfuMlUpVWJALdmrbHxT8?=
 =?us-ascii?Q?LNYMWfV0ckhQdh+F53dNWpmhuSL/nCskwR2h3Fi8/+ozlAREzdAIMwl1LTrp?=
 =?us-ascii?Q?P1un9G36EnNqBPbn1y3jB5eqA3vPt7Dr7L2M+BoUuQzirtLjQ6rhnhQZ8Mue?=
 =?us-ascii?Q?B1dcEpn90PgmCa1LNjeUUWl3Jozlz6gLPC4Gf9cPwkupo27pQtuvoHizngsc?=
 =?us-ascii?Q?NUmkaojAvqxYqtbyDHeMHcwzOar6DFWRwNp6U29H6C2gRqUAneHqC0ziCk0D?=
 =?us-ascii?Q?wkKGVtLwR0QpvBr3C9eM9Fe+nqfu/5IhzMXtmdixENDCoPk6D2rYLmSKOsXa?=
 =?us-ascii?Q?YZ0iyNmV/6eZl0piPMv8NV1yhIWpXWcK4uAmcqog+4SwLe63olUGlEFc5dTI?=
 =?us-ascii?Q?7vFs6SedioP06acRFozbE6V3umgcCFCpa9N8y2tm0P7JXLTAzrl/CluHTqu/?=
 =?us-ascii?Q?iuXBCqwdIQEhkQI1wDz+lCAtQIVpOtzhi231Vo6bXxiHGzT38ogT1lWCpD1j?=
 =?us-ascii?Q?b8UHyI4rTEz+FpyJuAj6N7EcJKWD62QhFzefaZGGVdt15JDVau6PKfIGAdFm?=
 =?us-ascii?Q?reH/i5TZuYhEvkJ0cYQu7h/pzeVTOPgyJScgoyE1ZxGPjcZ0oP01FmLHrzar?=
 =?us-ascii?Q?OkhGxodtY3OwP01RyC0PaWNFY10Gpo9qoQvL5g8B5fz48alblE+5S6jeWFZG?=
 =?us-ascii?Q?+TkrtWAOiJgtZUY9zHMUCvyR0K7pbj0Hr3KaKG9TzweseL/Q7qtkhcjDcvAf?=
 =?us-ascii?Q?VgdCBop9J7ChCpD4/kFlETUJ3d6XPiQ0cJrd/QNkStZgHZfk9FhI9bSrcZP/?=
 =?us-ascii?Q?nCH4baeVbZTSghap2DV/wfGC5xur5u+0WlJdiOX05kPWleBqNhW7fGn+7ua1?=
 =?us-ascii?Q?0erOn2aOLeVrEdDHVKyw4+g9wJ3i62hmfo8qwmFrTh147uTSO9QB2X2SYULs?=
 =?us-ascii?Q?1HBG3nNxWOFJz6OKuxzEu8TRvKIUf6/aGjh+mr2WX1q3B0UGH1MapmyBWnS9?=
 =?us-ascii?Q?jPUVOZp3CA48GWci9svT2WvbK0Zs5cDw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G8QeDKEG0lcdNmEren1tQHrtNVK03NFbUc0ErMAxlK10uhDkl7gC4T73Nk+Y?=
 =?us-ascii?Q?UF/+BKsKgEM4UMbm5D+DFs5fQd7t6AMl1O1mCLoVA7jJs3UcxLKVDCQG+SHp?=
 =?us-ascii?Q?/oTVukJ1egmp7yh1gCFbuyzStItUfXwWmXCadYvz8E+zJQ0oIlbFSsCCU8yU?=
 =?us-ascii?Q?DLl1Z0jJccGhxqQPGYVVdsBxdyWQmbYFO4aHvzALrWBOsbRDnBcGxTQUDcWw?=
 =?us-ascii?Q?Bj7jolEvOiLyZG4RVCzC191jdeucQSsJc8fuOTdcMyTDvT/hd8zuhZJgEr1w?=
 =?us-ascii?Q?n16n2hiTOYLDrgsal7tekKy6KI/TrJKZe7NW26wLJkVIOtXKRbCKy48jM4h6?=
 =?us-ascii?Q?MuPXwtMcruusE3ru/c/O0KKzYgqGN0qU2NWmhZn1yMDvb24GQS7Uxgw64pG0?=
 =?us-ascii?Q?3TlzyfnwccsgqI6hxHaui0DIYhIOy9tBsgNqy3d/R3mOEn8SasO42cRBt9dz?=
 =?us-ascii?Q?JeT8XVYjTPpf/r9PcYUz+f55d6Oq6ZnoaQG2TafPvRPTwszsys/LxTNSCgBY?=
 =?us-ascii?Q?e1t+w8VRfpBNAaeEIwRcUJw2FU/cHrH1L56BS99efOs150P4xiILblEhcIk1?=
 =?us-ascii?Q?uvusmzC4dBpqQvdGcLqKhyADLujRIUjt1tZAJg7BF3rlQ/uSdPMcTnrvD8Qs?=
 =?us-ascii?Q?YH350lHm3nEg1Bi9qvH/Pl0lm2WuCQarOp8kY97aV1b9NRWQwOfJx+45CbkO?=
 =?us-ascii?Q?cvogR+MSg1f0fGyGdFgDgX1j8jSfaUoo12TNsbvL7R6qHjJrx38DG3rvb0Ld?=
 =?us-ascii?Q?08tmTaKGOFcNwsMZtBRLwGh8uxwRWzxwI9Itz2Gr9aCyiyaItN4RyEY9To6z?=
 =?us-ascii?Q?Zz/VEiATo9y0I2++gzCc5wxFsD8A/YvpIxB036FlkqCRYVABEXmm9pERXauH?=
 =?us-ascii?Q?GhE3e6cLiks6ACKiqYqb2+4d/mpMnQDfj25/XaQdLt25+wHWex7+Fd15tnCD?=
 =?us-ascii?Q?6Df1jnk0oDFwRE/KQIGTZXEdUZyPUNGWsNZD6jhwYeLzKEoLMuGgPJm4gM8y?=
 =?us-ascii?Q?l/9Gmxy/0nyWSnmcufPfSgc55iWg1ekGTpaji9UtMMYx6jog0CaQsFql/HUV?=
 =?us-ascii?Q?hVDmfCNVG3cziZWeBPMvV+u2nSO2O7o5Q8JSDAmoMzlKMNgB78TGJIf/abGP?=
 =?us-ascii?Q?WxsLKDGTZZtkiQYpWlm+y8v3fdm7H3mK4wZS/WEUmmKsrOJM++GZsWodaX3b?=
 =?us-ascii?Q?8yUKs6jn8V2fYKtnlUM6yOh45TvNaEgOYn6opD35a/+MduvYDwn1oV9+tZBs?=
 =?us-ascii?Q?OaWl48hB13oUl+KNdo+lWp24kOC95Q2TvCYbqPXwenQ77P0OIGVCWtV9njR9?=
 =?us-ascii?Q?dbAE0swFJQvR8gJtn1q1erehsKzr4xQLKFFKytqDYpJO8coYxSrNT31vH/id?=
 =?us-ascii?Q?+A04TTUNcyhIWu+th0btaagmjdvgN7HPSyNw/cnt+Jtw/XAP3Z3pt++ADsKa?=
 =?us-ascii?Q?YUKcAz2rrOrksNdsl3ZgXBLOD4iGeMLHVRRVE595lP74f1kmENErofyJcAQT?=
 =?us-ascii?Q?Hld1RyPVwoXQomuzdMaqb/R5mMj28+bySodvA7X9D1nIIr54OnymJhJaioW9?=
 =?us-ascii?Q?YdJdRpn+8FubmMtRtElnuMlc/i0hz90buocUhx+b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6497e93a-d26e-40ec-692e-08dd760a0d73
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:26:10.5518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sb/pGSNj1Chq8qW9CWp+djp8QrAo5K92LVPkp94cqlP5d7MCQEHzQUjlxNqDURTujieE9a5R8T6fNjpHBEWNQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7747

On Mon, Apr 07, 2025 at 09:50:22PM +0530, Pankaj Gupta wrote:
> Add priv_dev_ctx to prepare enabling misc-device context
> based send-receive path, to communicate with FW.

Nit: please wrap at 75 char.

>
> No functionality change.
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> ---
> Changes from v14 to v15:
> - removed the se_intance_id structure member variable.
> - Added dev_ctx to the structure se_clbk_handle, too.
> - Collected Frank's R-b tag.
>
> Note: copied the change logs for v13 to v14, to cover letter.
> ---
>  drivers/firmware/imx/ele_base_msg.c | 10 ++++-----
>  drivers/firmware/imx/ele_common.c   | 43 +++++++++++++++++++++++--------------
>  drivers/firmware/imx/ele_common.h   |  6 +++---
>  drivers/firmware/imx/se_ctrl.c      | 29 +++++++++++++++++++++++++
>  drivers/firmware/imx/se_ctrl.h      |  9 ++++++++
>  5 files changed, 73 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
> index c843a5508a9e..9227d083abbb 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -62,7 +62,7 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
>  	tx_msg->data[0] = upper_32_bits(get_info_addr);
>  	tx_msg->data[1] = lower_32_bits(get_info_addr);
>  	tx_msg->data[2] = sizeof(*s_info);
> -	ret = ele_msg_send_rcv(priv,
> +	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
>  			       tx_msg,
>  			       ELE_GET_INFO_REQ_MSG_SZ,
>  			       rx_msg,
> @@ -122,7 +122,7 @@ int ele_ping(struct se_if_priv *priv)
>  		return ret;
>  	}
>
> -	ret = ele_msg_send_rcv(priv,
> +	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
>  			       tx_msg,
>  			       ELE_PING_REQ_SZ,
>  			       rx_msg,
> @@ -174,7 +174,7 @@ int ele_service_swap(struct se_if_priv *priv,
>  	if (!tx_msg->data[4])
>  		return -EINVAL;
>
> -	ret = ele_msg_send_rcv(priv,
> +	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
>  			       tx_msg,
>  			       ELE_SERVICE_SWAP_REQ_MSG_SZ,
>  			       rx_msg,
> @@ -227,7 +227,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t addr)
>  	tx_msg->data[0] = lower_32_bits(addr);
>  	tx_msg->data[2] = addr;
>
> -	ret = ele_msg_send_rcv(priv,
> +	ret = ele_msg_send_rcv(priv->priv_dev_ctx,
>  			       tx_msg,
>  			       ELE_FW_AUTH_REQ_SZ,
>  			       rx_msg,
> @@ -275,7 +275,7 @@ int ele_debug_dump(struct se_if_priv *priv)
>  	do {
>  		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
>
> -		ret = ele_msg_send_rcv(priv,
> +		ret = ele_msg_send_rcv(priv->priv_dev_ctx,
>  				       tx_msg,
>  				       ELE_DEBUG_DUMP_REQ_SZ,
>  				       rx_msg,
> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> index 7573603cdbec..baf83f03c1a0 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -42,7 +42,7 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
>  	return chksum;
>  }
>
> -int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
> +int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
>  {
>  	unsigned long timeout;
>  	int ret;
> @@ -52,8 +52,8 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
>
>  		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
>  		if (ret == -ERESTARTSYS) {
> -			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
> -				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
> +			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
> +				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
>  				continue;
>  			}
>  			ret = -EINTR;
> @@ -66,7 +66,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
>  	return ret;
>  }
>
> -int ele_msg_send(struct se_if_priv *priv,
> +int ele_msg_send(struct se_if_device_ctx *dev_ctx,
>  		 void *tx_msg,
>  		 int tx_msg_sz)
>  {
> @@ -78,16 +78,19 @@ int ele_msg_send(struct se_if_priv *priv,
>  	 * carried in the message.
>  	 */
>  	if (header->size << 2 != tx_msg_sz) {
> -		dev_err(priv->dev,
> -			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
> +		dev_err(dev_ctx->priv->dev,
> +			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
> +			dev_ctx->devname,
>  			*(u32 *)header,
>  			header->size << 2, tx_msg_sz);
>  		return -EINVAL;
>  	}
>
> -	err = mbox_send_message(priv->tx_chan, tx_msg);
> +	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
>  	if (err < 0) {
> -		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
> +		dev_err(dev_ctx->priv->dev,
> +			"%s: Error: mbox_send_message failure.",
> +			dev_ctx->devname);
>  		return err;
>  	}
>
> @@ -95,31 +98,35 @@ int ele_msg_send(struct se_if_priv *priv,
>  }
>
>  /* API used for send/receive blocking call. */
> -int ele_msg_send_rcv(struct se_if_priv *priv,
> +int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx,
>  		     void *tx_msg,
>  		     int tx_msg_sz,
>  		     void *rx_msg,
>  		     int exp_rx_msg_sz)
>  {
> +	struct se_if_priv *priv = dev_ctx->priv;
>  	int err;
>
>  	guard(mutex)(&priv->se_if_cmd_lock);
>
> +	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
>  	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
>  	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
>
> -	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
> +	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
>  	if (err < 0)
>  		return err;
>
> -	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
> +	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
>
>  	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
>  		err = -EINTR;
>  		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
>  		dev_err(priv->dev,
> -			"Err[0x%x]:Interrupted by signal.\n", err);
> +			"%s: Err[0x%x]:Interrupted by signal.\n",
> +			dev_ctx->devname, err);
>  	}
> +	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
>
>  	return err;
>  }
> @@ -166,7 +173,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  	if (header->tag == priv->if_defs->cmd_tag) {
>  		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
>  		dev_dbg(dev,
> -			"Selecting cmd receiver for mesg header:0x%x.",
> +			"Selecting cmd receiver:%s for mesg header:0x%x.",
> +			se_clbk_hdl->dev_ctx->devname,
>  			*(u32 *)header);
>
>  		/*
> @@ -176,7 +184,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  		 */
>  		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
>  			dev_err(dev,
> -				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
> +				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
> +				se_clbk_hdl->dev_ctx->devname,
>  				*(u32 *)header,
>  				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
>
> @@ -187,13 +196,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  	} else if (header->tag == priv->if_defs->rsp_tag) {
>  		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
>  		dev_dbg(dev,
> -			"Selecting resp waiter for mesg header:0x%x.",
> +			"Selecting resp waiter:%s for mesg header:0x%x.",
> +			se_clbk_hdl->dev_ctx->devname,
>  			*(u32 *)header);
>
>  		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
>  		    check_hdr_exception_for_sz(priv, header)) {
>  			dev_err(dev,
> -				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
> +				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
> +				se_clbk_hdl->dev_ctx->devname,
>  				*(u32 *)header,
>  				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
>
> diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
> index cba2c7854455..62c75e149d95 100644
> --- a/drivers/firmware/imx/ele_common.h
> +++ b/drivers/firmware/imx/ele_common.h
> @@ -13,12 +13,12 @@
>  #define IMX_ELE_FW_DIR                 "imx/ele/"
>
>  u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
> -int ele_msg_rcv(struct se_if_priv *priv,
> +int ele_msg_rcv(struct se_if_device_ctx *dev_ctx,
>  		struct se_clbk_handle *se_clbk_hdl);
> -int ele_msg_send(struct se_if_priv *priv,
> +int ele_msg_send(struct se_if_device_ctx *dev_ctx,
>  		 void *tx_msg,
>  		 int tx_msg_sz);
> -int ele_msg_send_rcv(struct se_if_priv *priv,
> +int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx,
>  		     void *tx_msg,
>  		     int tx_msg_sz,
>  		     void *rx_msg,
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> index 2d885c03a450..a326e07ae547 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -204,6 +204,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
>  	return 0;
>  }
>
> +static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
> +				    struct se_if_device_ctx **new_dev_ctx)
> +{
> +	struct se_if_device_ctx *dev_ctx;
> +	int ret = 0;
> +
> +	dev_ctx = devm_kzalloc(priv->dev, sizeof(*dev_ctx), GFP_KERNEL);
> +
> +	if (!dev_ctx)
> +		return -ENOMEM;
> +
> +	dev_ctx->devname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s0_ch%d",
> +					  get_se_if_name(priv->if_defs->se_if_type),
> +					  ch_id);
> +	if (!dev_ctx->devname)
> +		return -ENOMEM;
> +
> +	dev_ctx->priv = priv;
> +	*new_dev_ctx = dev_ctx;
> +
> +	return ret;
> +}
> +
>  /* interface for managed res to free a mailbox channel */
>  static void if_mbox_free_channel(void *mbox_chan)
>  {
> @@ -333,6 +356,12 @@ static int se_if_probe(struct platform_device *pdev)
>  					    "Failed to init reserved memory region.");
>  	}
>
> +	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed[0x%x] to create device contexts.",
> +				     ret);
> +
>  	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
>  		ret = get_se_soc_info(priv, se_info);
>  		if (ret)
> diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
> index b15c4022a46c..b5e7705e2f26 100644
> --- a/drivers/firmware/imx/se_ctrl.h
> +++ b/drivers/firmware/imx/se_ctrl.h
> @@ -19,6 +19,7 @@
>  #define MESSAGING_VERSION_7		0x7
>
>  struct se_clbk_handle {
> +	struct se_if_device_ctx *dev_ctx;
>  	struct completion done;
>  	bool signal_rcvd;
>  	u32 rx_msg_sz;
> @@ -36,6 +37,12 @@ struct se_imem_buf {
>  	u32 state;
>  };
>
> +/* Private struct for each char device instance. */
> +struct se_if_device_ctx {
> +	struct se_if_priv *priv;
> +	const char *devname;
> +};
> +
>  /* Header of the messages exchange with the EdgeLock Enclave */
>  struct se_msg_hdr {
>  	u8 ver;
> @@ -80,6 +87,8 @@ struct se_if_priv {
>
>  	struct gen_pool *mem_pool;
>  	const struct se_if_defines *if_defs;
> +
> +	struct se_if_device_ctx *priv_dev_ctx;
>  };
>
>  char *get_se_if_name(u8 se_if_id);
>
> --
> 2.43.0
>
