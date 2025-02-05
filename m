Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2074.outbound.protection.outlook.com [40.107.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D4E1FC0ED
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774311; cv=fail; b=Aob5lAjh46/TwC2RXTPOnHVXqKP0eQyQGzmW/RE8jVFhQNfKGmHSsbTPRDPNSNVFFUocGWkG5qfM/UxIGd+Xgqp404WOhhq4IZs3m/uqP4jxYWr6eZZ1aN6L7L6wxNK5HwggpxkxekqMhdrkk1LijMYUzYaZPSUFcBG8YJeQgGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774311; c=relaxed/simple;
	bh=ronm9c5k6iA32+kV2kaAF1hjJYMqghSYV31sD/yRrjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dXtXNdBEIEKm5+GRf4Wy1gfX6kphOCSqQMlrbe1kWFL97qWV0VQWUvQY1GWuzo9fhOyr4tnt62GPKWTKtJOyNT1igCDlb9221Ay0Mb/huUryz35SZ5J+DXBTIavZiQvlkKx+sVAZDMWnstEWRc4Gz7FV12Qdbm6NTo6kXQhKGOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bG7x9tMJ; arc=fail smtp.client-ip=40.107.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bG7x9tMJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=le7j0wXt4odF2R9oDUPTMKY9MTJN1cPegrfpbwHxcEkShNqGWL8lesDrqYvCRlVlHOmg1yi5mVYK/eDwmEj9TX9ozps/FhKznih6ee05aqV6fJk+DAoH6JHuW3OF9V8KML3qvN/noXY4k3/z7dQYvmKPMYgFF+SSRp0RgGfTxHcwhU4SsUmb6ahK8octO6ys76jLH9fRY8drYckECLn48I+iH/YKxlbeT92THQ+BSb5udvyabNLBnsJIL9SGABfVMiOxVRv8GG5cTpm5OyWT6LW2oDuQYy3GYLzBuhsd4hStCrzbCNhXBnnh7ozHua+ESTaw7MYlKuct/FJdW1yFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8NpnaLPPrfHkomUYynIG2mKoM1QqXoMy8eyWwEOjEY=;
 b=Qc8mMgKTDS17yRX4UYMN588EoRiItHlM00RU7RrJFFRJfj843GkzZRlctfHiHYu1nOxj8j0ZVPydyp1znZKNdhu9dC2GJ6Ic9ai5w0VUvlpD4pI16QAP+Wp8F+kpA4JMQJ16dmLTe8+aIuLNMsTCQEjHu8xGTw+ziKfi7rjNo+tnXh7Ied/m8eMNPLCTi9GH406r0RE332pYAR8IOJoDKZxSducMLQ5xkY4y9CbxYb/aNzO9u/I/F6v4EvWD0kr1imU8FQ5OH8mEvaImDekTV9UZpvCrJIaulHsf1PEe+xY3+9YiAWRI/Qw+XeNKKLtxpkxyKXJKBsv4zYQU4m2iYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8NpnaLPPrfHkomUYynIG2mKoM1QqXoMy8eyWwEOjEY=;
 b=bG7x9tMJwgU6f6Hw4lhZ9NiIri8JPZl+tY4ul0u1PdyncidPM3EjTT7RWshJrdIaog3HPy79KhRzLI0htB16pPdc29ZDbn+LJhE3m9dtiqrLYj0nmkXud/i7dmkGdlGbfV2mOBMAQChGLndrpVer4DIfYRy3/jeuHf1qxjMY/tsCqDALxmF25P+YZztrqAYdZF+KDqu3WO8dC+WYQPn2T6tSpCGGGfbK12grY1+A0YOP19TRwkKKDQgun17mOg/PFTsZd8G9mfZ6TJwuT3ZMoKD6rw4SJjTWUDfJcDmWWZwnM2UNQslPgg7qiB083xN1BMAIWHS3+BRDCr2aVwkm7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8509.eurprd04.prod.outlook.com (2603:10a6:102:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Wed, 5 Feb
 2025 16:51:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 16:51:45 +0000
Date: Wed, 5 Feb 2025 11:51:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: alexandre.belloni@bootlin.com, pgaj@cadence.com,
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	aniketmaurya@google.com, Shyam-sundar.S-k@amd.com,
	jarkko.nikula@linux.intel.com, wsa+renesas@sang-engineering.com,
	xiaopei01@kylinos.cn, Guruvendra.Punugupati@amd.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 2/2] i3c: mipi-i3c-hci: Use I2C DMA-safe api
Message-ID: <Z6OXGS7xrUdbrXZG@lizhi-Precision-Tower-5810>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
 <20250204091702.4014466-2-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204091702.4014466-2-billy_tsai@aspeedtech.com>
X-ClientProxiedBy: BYAPR08CA0059.namprd08.prod.outlook.com
 (2603:10b6:a03:117::36) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: be9adc21-28d0-4cb8-bb25-08dd46055fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZUCAq64h4HeX3i5rLm37xNB1R+dLuoTMcqVRcIiFxRKSkzND51fmQ6sVJnbV?=
 =?us-ascii?Q?+gyWTlyyKBZDEzXnSYqChNDziGZz21LyRprmmpy0Ra+Dd0qNhS87VHttPpMw?=
 =?us-ascii?Q?mEzzOLniDWDr2aAJlBO5Jac4mlHr9h6wD1BE2iXld6lQ/xr14vagXbSgRJCI?=
 =?us-ascii?Q?CDVwucVv+KS1XXpGjMnps+cPKkxAY3HhluMe+8pBKJmMUmo/b+sHyyLq9plz?=
 =?us-ascii?Q?shGt4V8SpmJM0ZtPE1O8Zu55VkaXPya6mkhlOfl7CHAEO3IrxEj/2e2Rh+Hx?=
 =?us-ascii?Q?PRyxBPHmmYtbRMsGFppievHoKe3f80XW7HLSuYkpfcQSSPhNfwH+BNCAt5H+?=
 =?us-ascii?Q?by4S1nooVy9xFoPdYUwCXAIASa1KUghdTiom4d40WDcQ1qdyrc9aECW5Unwc?=
 =?us-ascii?Q?8sNtFOKqTFcYnI12tBIivJOfpFklrWcTsMA+SX2Uw75fw2mu+CpH1zJT1H2G?=
 =?us-ascii?Q?/8Rat9bXtBD5sysWb4/tabR15iSIalaLH1nLLgKFIRz9iKEZBgrDottYtOE1?=
 =?us-ascii?Q?OmQLVVnaa0h/Vs7jiL2YHRmYFJ038+IG96Oz02IRv8490rCVTq6aM1FbSAl3?=
 =?us-ascii?Q?Vl8wirkx0mc8PCPg5y4wkD3bQN5FhKDJSQNh9LPM/jZBqkIXOv47xxSSa/Uc?=
 =?us-ascii?Q?igiUt0RlnORvaoNGpu8AxyLCp1N2+XnxDg8jrrIoW1jOCJUZ8SSJzemefXIV?=
 =?us-ascii?Q?vIT/P9HdI0lF6AJzG6I9PFNzwrUl89EBPlaP7PYnzbvf7XSULhLD5CblyEbf?=
 =?us-ascii?Q?6K6Aco1CXTHCcARZxNoRnV/s6wMsZNZiZbXiepcFiUZqo/RbhDxRUCZE8mkL?=
 =?us-ascii?Q?IjYwuFZDrlqdUS3u9rH/PfPzcOGcGfpW8Udg2oRAIR2Vh5H2CAyfF4iKA2lV?=
 =?us-ascii?Q?xfJd1H7GfCliXzoOFbBzDEHiOmnSEDW3nqRFlZ/yW+ppYscG0Z2egnw6/p3k?=
 =?us-ascii?Q?F1rrYD/pkZRRr2Rp2lefhb27rJcUlS+r3BFr7xiiexIt5v25E64rwWpBfFc0?=
 =?us-ascii?Q?hCIf6HGS601TBdth90L1MqnkCkaPom4c4I41xTGCyGGIR3o0WTiU8SsE7qSI?=
 =?us-ascii?Q?7p2vEwYxMVNW2ht+IMgIrtOazx3esNL1Mtfl7S4nS34gteMVi0d7TgxqLFAl?=
 =?us-ascii?Q?lI8PyX9ixlkkZifplbVCTNby08rgpt2623J7mE/+APnyqnBfKsJQ0VdIyqOt?=
 =?us-ascii?Q?Z6Xbz2FhMh30ozah0FEU/cEIfXMxjnw7IAUrr/+vU7qgmP9cRtyS8BTZ9YmD?=
 =?us-ascii?Q?b5FKJst6cRe4h6fqCtfOSXy00zctH0vEjPQ78fm6OR/IhpCpu78W+LmyZumM?=
 =?us-ascii?Q?MQxovtgOZx+geHlj1JChIOSDsRjt20IO3MOERZfwjUP3EIsfo4G/w6UhASzF?=
 =?us-ascii?Q?3LIj9UmLDPa2NByzW6035/GF2+aoWYOqkgx5YAqmmBZNqv1oSQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ucdhmBDzauub7OZ/3ldz2+bVaY4MtULKOeWVDG9Kl7M+W4eBn5L7oK+TBD3?=
 =?us-ascii?Q?5fRCs2jy2b//wdcCs54Lxs2RiSieX/HyobSifWFSQ4r2yy0BsdfA1tMa7aEp?=
 =?us-ascii?Q?o+lltUlyKYLq+SEyCWnSDLlg4A6++54/ExXSJUYLSlOXzyDUWAWoFog+iBtj?=
 =?us-ascii?Q?l64Hi7qENPEroFKfS/NaJAy1wVruYVDt7jHnlVbOniYsyGzcFNnX9wcDXrUG?=
 =?us-ascii?Q?WGeI4SLzxtctUdt2KdQjW7GQLi6+OXJldeBiRCdHryoJdw/bai+La4IQ+P5X?=
 =?us-ascii?Q?PvsCUscJ3KX8i9tpTU6/C0KBKQxQGI7dlxsFplITCjFN4fQLO/M9loDl0qtd?=
 =?us-ascii?Q?TLoJ+E1SIXGe7vrjeMp16hhO3wCNMZ6KAAtrny+pJwB29iCAie5Da1jaFN+n?=
 =?us-ascii?Q?DZ/Wa+GWhLBd2IYpN/XvJ5BzewINLNfcYT6EP9WUwR+q01UYE/diijBxQfWw?=
 =?us-ascii?Q?OjmSANZAPqz40VY95BI0iKzXYMbsuq0hSJKt2LYZl9K9Wocx4cqyWItXLss3?=
 =?us-ascii?Q?d8JlalJiDThwSfc+lxVfv8aL8wc/Mr+zJ6wMetfTvzxUB4MvTRfwJeAXcKwe?=
 =?us-ascii?Q?qq1b1XWyKQ/tbu0lOMRgdlGyFQRo6oQLhn2V3VP4NIn1JsyR/+/NReE1x/5f?=
 =?us-ascii?Q?z+eVipz+S8I8kklEribgpZ1yTJdxaz14MSqpKSxHsQiEDjuftaO4qesKOnLb?=
 =?us-ascii?Q?O2exOqUQKoK+Ly5I++0GIpp8T1uh9RbMaST22Sb5tW2lZqQdkUa4Prjc1e8h?=
 =?us-ascii?Q?OA+tkLail2kCrz2Cje0LXKjDzB5tDB0NCrE4L5Km3qyRwQeQ8bTBSUYp6GW8?=
 =?us-ascii?Q?84LgFsdmnFYZAq6fVNRf1fsT8lTXCjlXqcc+mi1AM3kdOnH/g7zzPS0GF68x?=
 =?us-ascii?Q?5ADMK6joE1mTGScEh8gBu6+XyezSsc8JOlpBDPwKDICvbzLC34WG6MVx3cC9?=
 =?us-ascii?Q?BJgfdK6P+j4eDwlHbzJhlT+sP9eizp1ou7KTr+2ROPiy+cOVKBjArFZ+xyP8?=
 =?us-ascii?Q?gxzBCKmmrxfIJ2KXmzsHQ/1pDp78e70zZHjOxGHcVv7F4unxuL8lC03eQWqs?=
 =?us-ascii?Q?oPu1/csx3UTlBJsF324Rp0076+wVVqOPmEw8ZHL+XY2afSgl5FP33rUUsSQG?=
 =?us-ascii?Q?9mfKKXiZNuU9ittYkOQFumzVM6VedeolUJ7AcfX+YwmHvYpd5ZCsMQ6XipN+?=
 =?us-ascii?Q?/gd56X4Z/IDuE7A624dhislZ46fZPIpQtETUDTGkYzW2Sv6aeDbauuGIrCeW?=
 =?us-ascii?Q?ubSIoZLZ0ofqiHoDt/XpQGj/zVM9j/3VVUMMT9Tk4f1wxbdzq6/NQ8SbywNb?=
 =?us-ascii?Q?NalGpWl7E+2brpmX7Jh073gZD9S/z7jdfvdnDN931pIYksowJa5KMj9T5bPS?=
 =?us-ascii?Q?+gZ4wlrYxRBwQAgIcaKmqlyDPnOOPfnCoy8m7qITtynTX3wCWoInd7liLJtm?=
 =?us-ascii?Q?o/qkq7zCnpjovvcgtDhI04hdN6+rtlgvfuFL6E4JI375bzm2G1OPltIDY+CL?=
 =?us-ascii?Q?TWMB3Pxe0zjDuFu84DNq0wOvYIwxxVCFIkK7Qz841NKF3FgCQeZvBgocfPvO?=
 =?us-ascii?Q?Scw+dM4FxiAtB5j69Sc2dWCiRgBSDTLQRxu+YqNB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9adc21-28d0-4cb8-bb25-08dd46055fdd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 16:51:45.5300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGdd2w7KidBhExYIF+eu14fp4CE0+yf0hfj4xs29yAG26TqFcrlQ0Lg50v9fRRWzOIyiWQhqWXB2wbi3OXFIqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8509

On Tue, Feb 04, 2025 at 05:17:02PM +0800, Billy Tsai wrote:
> Use the i2c_get/put_dma_safe_msg_buf for I2C transfers instead of using
> the I3C-specific API.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index a408feac3e9e..4f3738beb0f2 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -382,14 +382,11 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>  		return -ENOMEM;
>
>  	for (i = 0; i < nxfers; i++) {
> -		xfer[i].data = i2c_xfers[i].buf;
> +		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);

1 should true?

Frank
>  		xfer[i].data_len = i2c_xfers[i].len;
>  		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
>  		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
>  		xfer[i].cmd_desc[0] |= CMD_0_ROC;
> -		ret = i3c_hci_alloc_safe_xfer_buf(hci, &xfer[i]);
> -		if (ret)
> -			goto out;
>  	}
>  	last = i - 1;
>  	xfer[last].cmd_desc[0] |= CMD_0_TOC;
> @@ -412,7 +409,8 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>
>  out:
>  	for (i = 0; i < nxfers; i++)
> -		i3c_hci_free_safe_xfer_buf(hci, &xfer[i]);
> +		i2c_put_dma_safe_msg_buf(xfer[i].data, &i2c_xfers[i],
> +					 ret ? false : true);
>
>  	hci_free_xfer(xfer, nxfers);
>  	return ret;
> --
> 2.25.1
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
