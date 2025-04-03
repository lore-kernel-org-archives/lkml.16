Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012029.outbound.protection.outlook.com [52.101.71.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1979C25D54C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743710990; cv=fail; b=K61vB6zGKYEb4aZAVW/J11DUrZSHTVqxAk8keQ4i0fHjTWj8pbM6g52k9EEM1d+ejYdElGbzheHCrnXcnHp/IkeQOhsxHEIt4Pf1l7DvCJflMh/t4NHG5ubydZLeiMaGMAuFwpHDZY+idhpJresAJvhu03VCmajUDDdDXuxGeO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743710990; c=relaxed/simple;
	bh=56xqh9x8v4SH6GZwxySL/2luTZkLPMWeKAt47MG3fPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CQUJPnfTZRzLe6I4yzEBOfcstVOqbB+uTY2WkU6YRSLJuHjW4krevP2AkZXPP4Ks9iuPWEgboosYMT6TrXXDXBaiL9RRKXEi5c5RjR0cjrltlvMaVH1B2lpqGoJcJ1saYAyFZvLJE4QTO3MNza3nXH6Dn6pqlB9xpd2JVvrrAw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hcr3gAcQ; arc=fail smtp.client-ip=52.101.71.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hcr3gAcQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5ACojtzGEYRG7ETJTVZj+u54uJdf60H0kTWH4wB0Z8MWGTiKAJxsibfocH6WmIeSzCV6UgQVz+2jPk5lU5YdWHBWsW0Xq2hYhFr8QCDHBSQ+MpLhcWUqM7z08WYBOxcVGdXJmV6arKBb5cj0R0YBrPeleTX8gBr3F4TLPOgJhjXvG4Um/9F7wHPUYXgNqDFGoOFsKgzQpxKZUSV8NwFuquTp5KArJnwzKFqTw9G0jtXSuXcdHjDWWj9e0hUUSmd4DDZd1GfKi3f4XQNxZX74p7m5oxBEP18Q1ULHB/sXb9+dz61t4eTubZo168Xj6WAGKJCfmOxkVwdS2+OmMoYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMV+Xz9n0b68b9HiZoE8C7lRQbJMV76GSvjicXEpVIw=;
 b=aGUxhuruyZStqgE20N7zsw2l1vOkX54nK3jaYXjI7O7/HAsGiyW8qJ8gMorN0L7eg9gT5ADx2uMpGz/M4jaDxjHyMUcsC+83D7EnRvs4xE7E6XkY+boUdE+qNQE/2lcw0aW7Opop/UqHMkBox9UNUbRYyDZXR7qGkgirJolu/nI9n3IMbgJx2kOlCQ0tNnysT0ElsOotzGVk4gV85qGfomoE2tn1juJWolFlxZQM8wgYkY8L50QydvnxLm2NHtBLHmrbFRzXb7aWw2p74VfGlNHNHiL6hBeW32cwQz8GSRuwsZTyqwAFYHSBm7s6G3kbsq9Xcvz+VWa23TmwHTpSJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMV+Xz9n0b68b9HiZoE8C7lRQbJMV76GSvjicXEpVIw=;
 b=Hcr3gAcQ4mNkugLeJKWqxSbaIEDVbItz1KBQqrchW1OkBqKRMllLfhR5QwlFWzpKi7LARKjctrJuhY+TIqvp8726UIs350E+krFyUOxxu91lsVi6gtHMATGPt2qjhv/Ydf9yxQwFW4DrrzNIp7x0rPMz/H0xqCbJRtJ25X8BXl2NL/CpgyxhT7XTyhi+yIvY/q48rM5j0x+//Q2EVGZSsf5yyLJOGkdfmhB3+Aeq3PIJSU3K2VuPBUKXhbbMx/Qj3W/rXKiVIyYTpiekJENSVcV9DAD3Yx8dI+zn9YhKfHxvarzq9UENVI5Qcezz0MJsgYPP4EwYHQBXtUA080EAfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9828.eurprd04.prod.outlook.com (2603:10a6:20b:678::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 20:09:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 20:09:43 +0000
Date: Thu, 3 Apr 2025 16:09:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	iinux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] PCI: imx6: Skip one dw_pcie_wait_for_link() in
 workaround link training
Message-ID: <Z+7q/okGW9uBlT/w@lizhi-Precision-Tower-5810>
References: <20250403053937.765849-1-hongxing.zhu@nxp.com>
 <20250403053937.765849-3-hongxing.zhu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403053937.765849-3-hongxing.zhu@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: 9318e76a-68d0-41ec-60d3-08dd72eb7920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z96QYwGYhd8JY8n3S+jz1p7aFuqPqUJ4BSKRZfHuWU9yUqgpGN/4E0+LPvYu?=
 =?us-ascii?Q?zXxZVfOq+KUNg+irGR1K56f1UFC4mS74AsgPeZSvHrFrb2B9QuaUCP6F/QMU?=
 =?us-ascii?Q?WGV7Zygj2fNDjCbQ/4mZxVSef1GU2/tqfre5sGIhGH3HpDWMQGDK5k2CRWQ2?=
 =?us-ascii?Q?ea8Zie0X/I8TaNCT6ujTnb31f1T4RRLROp68pMy65j2rFHeEmmhHS0w9rcFS?=
 =?us-ascii?Q?FBeiLtK8OPIONRICiPAUfEg9OssPMkBpVGnTnKDQRyTs8iAERsR4jSzhfnAE?=
 =?us-ascii?Q?p1dZcVSnjGNmlJlDRbJfF39UJ7pTAY9WGtGxPX9O+3MpHbs6RhlFIs3J+BOs?=
 =?us-ascii?Q?tcQVWCVPAWcJOOn5L7f4cmiYa+hL4xNyYc7VDp4PKYpUvxw1x4tYg71WdCe+?=
 =?us-ascii?Q?EGpviRFNJlK3CWxJaFuyLJlDe3srdLhljGGkvY5vHap7ezcJJZyQd4tVNQ0S?=
 =?us-ascii?Q?159VqWWa2k89vfuD3EXRo8ZdYzSqO73vBEOJBEepyt6MHoeLQGcxuW+CvCkc?=
 =?us-ascii?Q?1kqPECGCXgNe9wUIiLp0sn5CFcpuP7N8oYOFrBPX8DMcJyu5lNVeJjUjBPvl?=
 =?us-ascii?Q?msUGH0tYs7NFRfGatM/XOnj01EdI4mV/3GYI6ZhIaE14C6VdnhYgHGGX5HDy?=
 =?us-ascii?Q?yUW4F0wctqFUKfwux0qJJtSqKC45r8x9NP0z7LUP3AhywOxkSiRRHPleQMVx?=
 =?us-ascii?Q?q+ZuKvbikcvu4rzovvqOdH7IvnxewMexkqhCRTgZti68r9V5dcL2jKoWeWjp?=
 =?us-ascii?Q?Nwxs7baGB3EQPPX3WwWroehicxcsXdlMENLTqy9R46ceorJPrI+5zYMoPLRL?=
 =?us-ascii?Q?UFmPtDKUGuaW5gLCn2OOe+mgPIXsaK0kOjSWftYiKtN/zNPrl57N9TSJa5QU?=
 =?us-ascii?Q?IcxvI3enaobw/I1WHEM+lWq/UK8WdH3jPTHkqJ3pezjvPJO1O2Vlcq5bNCVQ?=
 =?us-ascii?Q?VBV6pZsUEU99T14MalvzOEGJyozrep3TNhbWYvRjp/wYlHon6OxHOpZnRk0B?=
 =?us-ascii?Q?UWWSkcgDwQnXWL1jHyO4EjHk20Z/cEk00zfPT25K+UIZut+QOOQTLd9IKCPK?=
 =?us-ascii?Q?5IlGuhc0ZsIJihQlAYZ0B22maXmmbvjMtF1S83ZVur8j0i6JP2rWqdjWErKP?=
 =?us-ascii?Q?ddlTMhjld3+O2F97no8hEaswgJN6J/8cPkZdrXgedmHeladUn+vsONTnbGTw?=
 =?us-ascii?Q?ZNW0rsDQUqbCKkegKIqm/d6OFFokUjNgvG8kf5323lJ2fse7qVa1kEOppO5x?=
 =?us-ascii?Q?mW1EioZEum/4Mn2tA7ESkaycU04GE0OmTyKRsEr5pCJf9pa9lp7hUpFzbdPZ?=
 =?us-ascii?Q?wSpnP/aydzlLV38DriR5dGXWgTT5Ke2CMBSKt1qZl/aBC5XSDPHbftqE0I6K?=
 =?us-ascii?Q?xq1Z4I0n+2PhgKyGS8J+2OBtm+2uF8QiA5jGL6qTNUdFZb37Cx+uU2kjl/XG?=
 =?us-ascii?Q?W28oqS9DUYe9UiVnvFy6A5G4kKgMLxEN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5bv7qYpU21rFSBDsTPFwMTQHoM82jO30FI/JJwwxrdfhhV1JtKhjcn9F/9rT?=
 =?us-ascii?Q?1xoey7mv0eWCEwk7w3kTp62IqfirsVM5hg3P1YtHe8d8nkv06HY2ps7mYnDk?=
 =?us-ascii?Q?PNOQ58psL0Vbnv/2D2YAVs6P4H1WsXmvjEsO7TsEcWl1gx08Htm4LG+k3fNt?=
 =?us-ascii?Q?QJ86RoKpQksyJsvpV9sxoqfd6dM6Ro6eVoK2IDRAmryuKfWKw/CaznFwmdDE?=
 =?us-ascii?Q?kFNg9icUkpcgQoPSbSe3hPwc5AW3Zvln1arX3G/uIfrs6T3gWnQmk/kW1Acx?=
 =?us-ascii?Q?53Mr8MQDON6v7aofDjQt6Y0vnmcuhn7O12HOJdEEuNIxarNP3K2r2G1aU++r?=
 =?us-ascii?Q?F8vVNjrhEAVxBwFMK9ih56ml95J4p/M9ZbFs7ZRsNtuAGfR0tOH0KGs5y2Dy?=
 =?us-ascii?Q?PXLC8at+HJ4rqMuhW/OmlNOiwstfFSITaVZProLEvZdu75bKKjgPfnOc77Zt?=
 =?us-ascii?Q?CnwDxlxwI8bv6rRZ0wLsEqfaRs/pnUGUzztK8b4PasVwEOoa6weezXflhcEc?=
 =?us-ascii?Q?CXbliJm4NHmOl4Eon5YDeRSudmm2vGVjsAraCXgTT1IBVRdLnISAtQBkhCfv?=
 =?us-ascii?Q?vYme5nzDtQDxnLT4NhpnY66za9W6lPdUqVKd7coaavDgiFwG7mgFwnpjtzPF?=
 =?us-ascii?Q?/LvLNRiyKvgcPiQTPr4WZFVBV3o00SkzCAwjb7rqaXHfghtISoJZbHZWN94C?=
 =?us-ascii?Q?YjNOv455wYzvCpdP7fBo4Ui3lWXwBBKxsx3Yhd5KKD5q4wyTCZ43dX6riwSY?=
 =?us-ascii?Q?2QEghR7QvuamzVFb7CLv3puwenuGdBBSnP/09Wm5ojQyFFDZnbCO0z9wAxOf?=
 =?us-ascii?Q?RPDmqU2aWXhuysqKAe/UD3Ek1eb1WYUi1hjEqj9okbQ8AgTqG8/zapbL/V6A?=
 =?us-ascii?Q?ioB1vFqNqf4LalPYVy4XuGMld755klVxOLycx8xP2g1RAtQEEQjzW3GgJoQK?=
 =?us-ascii?Q?tF2H69hJBkv92z31kxP0sVM2qRrKVFa4SMGwMzamYfbsPCPi5JUtrmJMsP8w?=
 =?us-ascii?Q?uIbh2NgBKi7MmAO9QxZsjFzfbafTJgyhSEyLRCjpcgmAXOe6ELwbQqR80B85?=
 =?us-ascii?Q?KDQAjGxio7p2VeESEYA/GOtV4g9eCisGE0VwIyP/qhpsUD+v2UVUtcCBEIsn?=
 =?us-ascii?Q?K/4m+rD6T6/YJ65kpZQzYg2kVaqiINv+Za9YpdFtL0bLmf5iwjfpIXpPFlyr?=
 =?us-ascii?Q?Qc5ckrU8j4H1/PK6ei06nSlJrL3n5otYNWZC1CRjJ+EwISYWp4KxyJ9zYZVj?=
 =?us-ascii?Q?juQobL06YPqraZBsuBZZGbH1fG/sjJ/+aqbxQIKvQNcZQD4HUVWgprzDwpN2?=
 =?us-ascii?Q?XFrwLQrTgZKORCUFxPK81S6E52fnc3LarbhR+uRqoUzNEIQ2H3GZKoLpK5iF?=
 =?us-ascii?Q?blJj8MDY8QhQFxMDayO2GaMEfZfuOGXAGNLC7kx/WrftjUhrrjBETRzv+P9p?=
 =?us-ascii?Q?L1nwqYXPOAJ/LPmvy0cw4iXvIxgsm1Uv7/i01fibiobbH52mlHdEPelst8uY?=
 =?us-ascii?Q?3hncXmN4zpvQtZfeyStLlu4jSLaXbcWOMsW4FXnfrmfoKPIvULcW2KVg/T8i?=
 =?us-ascii?Q?2z8FFXcrCZlSjIUNOoQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9318e76a-68d0-41ec-60d3-08dd72eb7920
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 20:09:43.2954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T96cmRhG5knS54U+xS7QvVyE5Qs1712faQdqHKpiaE9ql5TojY8HVCTCR6CA4Fb5HuRSx0IFvpkiF9s7Pd2cMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9828

On Thu, Apr 03, 2025 at 01:39:32PM +0800, Richard Zhu wrote:
> Skip one dw_pcie_wait_for_link() in workaround link training.

Remove one reduntant dw_pcie_wait_for_link() in link traning workaround
because common framework already do that.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 57aa777231ae..84d2f94e3da0 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -881,11 +881,11 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	/* Start LTSSM. */
>  	imx_pcie_ltssm_enable(dev);
>
> -	ret = dw_pcie_wait_for_link(pci);
> -	if (ret)
> -		goto err_reset_phy;
> -
>  	if (pci->max_link_speed > 1) {
> +		ret = dw_pcie_wait_for_link(pci);
> +		if (ret)
> +			goto err_reset_phy;
> +
>  		/* Allow faster modes after the link is up */
>  		dw_pcie_dbi_ro_wr_en(pci);
>  		tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> @@ -907,17 +907,10 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  			dev_err(dev, "Failed to bring link up!\n");
>  			goto err_reset_phy;
>  		}
> -
> -		/* Make sure link training is finished as well! */
> -		ret = dw_pcie_wait_for_link(pci);
> -		if (ret)
> -			goto err_reset_phy;
>  	} else {
>  		dev_info(dev, "Link: Only Gen1 is enabled\n");
>  	}
>
> -	tmp = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
> -	dev_info(dev, "Link up, Gen%i\n", tmp & PCI_EXP_LNKSTA_CLS);
>  	return 0;
>
>  err_reset_phy:
> --
> 2.37.1
>
