Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E751291161;
	Tue, 17 Jun 2025 09:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150896; cv=fail; b=OEi0o9lr+YxqKfnXvS7q/l02/ZRt0HIfA9hQ8DW3mE8s7MFIv6BGV4Fch0hdwna8A+6yXENavXEHkUj+3rURAuwHQFvicecwwBQy6E3774gU1fn1uSVoTdmZnlP3/lHfFBumv3GUNdD1m6QrUU3yya/Njs0jiVuq6MQTdMJaTQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150896; c=relaxed/simple;
	bh=AWTiZCB6AHnl+Cxw0tCWY01OKOT5RZC4jyKRrooWTn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSdJfXwJRYYBHNCxkgEw4dbYX+2tDx/QW0OZNjLleUxg/t32QmeysQts/yg+FY8A0d9+3dnBL2DlazBnTNmSHhDNQxYsAe5JsYP00jUyRs1Qeondm2vYHMlK7zE23CXdWMIf0hP4x7lbPG+o7YgSMb5Vr8d0qFq/XVUDqhaGAcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RoR0/T1r; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TuHY+m2G; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RoR0/T1r";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TuHY+m2G"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7hUEx000484;
	Tue, 17 Jun 2025 04:01:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=NQmtsJSDRfwa27dpxE
	QU4Mk8iuYA7F5ZN8vzMVqF6VY=; b=RoR0/T1ryJ2iNT+6N71qKzqKgUgIcOHoJ6
	GC/GYwTZUoBeiwYD75ow2vJ5H4fJj/rt5YSaaQOO5lfI4JfgS65EPWcHgDLPhjDk
	Rke5zS5CwUZ9UEz/B0QXNtfIrce4Y7Kv0t3nNzwNP94VFMxf6LPcufSafswLcd3F
	mLh+FrD1mClKPh05Yu801GC7Jk6UeKB/hV/5e5KSEMXNVcVX9YjB6Q/kPmSnURjr
	GuLREwxK2I0pezwG+RAQA3c5bcjcMAU/dHIklbLNu8XJz6gJOvhp8YiRfpBe4v1b
	MPsj8fu/52xf5S5whM9L3uQEG8hm/kbrFzKombBBdT4eNKD8fGNw==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2099.outbound.protection.outlook.com [40.107.100.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47ap6as60s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 04:01:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCcWCCTy65nVj8NEj4OzQFUOto4FFsIe0uCXo+s+XSISbfkC8pZt+J8aG9q60PRjLOQHXWKxDGby95f1byqR8dlT1XLgpuxAT4lzAxSGPNTv+TYJ927FVGUifQa7K4PT5b5HnOPDIVNpfP5kU53nPJwnCIGfs505GUPw5eUiH7So0gLN+miwn8XtUxPz8g9Yf5hy2tJj/KXIXzdB5rDg8qUna5tv+Bf3sS8KHfO+by3QFQJcu0RNeOuvvjTbc/p+RScqB7alrhYXQo7cxbUu63RvSm8vHbPqe3FaROcM+8IlX8RjkH0vTe3MUzcwmYk3I9bQHtR1kKva3cUJPnQiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQmtsJSDRfwa27dpxEQU4Mk8iuYA7F5ZN8vzMVqF6VY=;
 b=OLX+XSt8aokyNwZtRVF5AyEL764IH/g87tpVdcnK0+hrqAEHMXpKZxFPLZGHQRFf4gKAmze4WuAZPmYpGymRRQZtlI0HVHoZ71jeX57YTu9kiBH1FGMvhHTKUhSfKyKDEo0mtNykpEOoZNy2JvXVQA2ZoOG7jDlvVOje/5rXNmxWEpr73P1BXLeFcpn5lw9qGwTpJePF5mBqhwZ4hN3dF5s9Tw9MXwL+45Zbtj/OeAusw7WE9OwfyqCKzH0WA2Q3DPF88jgq7mPzgShKPpSoaVWo4m8tT0P41aa0MaefrzJyLshqel5+eEb/KguUbq1DABl+BiRTl+tQWWqNWcfisw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQmtsJSDRfwa27dpxEQU4Mk8iuYA7F5ZN8vzMVqF6VY=;
 b=TuHY+m2G0vh2MSORbto/1QvZTBItpuiKfefMQ/yNxzFRAkYjPkxKX4OwgxF18rqwA+8rRnIKtxDPvqRQedug8TbjQCOZGE2hsYzxpV/t9joZ9MnrT6BMnvp4aB/1WW9SmFp3rbj5NWSx9F3K1CVy2JThaYQK5GCH7ntDrIJhg2U=
Received: from BYAPR11CA0069.namprd11.prod.outlook.com (2603:10b6:a03:80::46)
 by BY5PR19MB4098.namprd19.prod.outlook.com (2603:10b6:a03:22f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.16; Tue, 17 Jun
 2025 09:01:13 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::a2) by BYAPR11CA0069.outlook.office365.com
 (2603:10b6:a03:80::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 09:01:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 09:01:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 33AA8406540;
	Tue, 17 Jun 2025 09:01:10 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 10DF282024A;
	Tue, 17 Jun 2025 09:01:10 +0000 (UTC)
Date: Tue, 17 Jun 2025 10:01:09 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: david.rhodes@cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com,
        broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH] ASoC: cs42xx8: Move reset operation to runtime resume
Message-ID: <aFEu1dsFNSSN8vKo@opensource.cirrus.com>
References: <20250617074334.3229001-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617074334.3229001-1-shengjiu.wang@nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|BY5PR19MB4098:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0820da-3456-471f-47ef-08ddad7d8222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f+/+WY80yc/qYGIjvmD2MnknXYK2e3XXlUKSSKJd1BARFQnybNJdsYjt3qfM?=
 =?us-ascii?Q?/KK+n9bY57U9D1VwVbEnYyGPdTnB8lN0ga2qrw5zSO1IbAv5PFpIB2RA5Iiz?=
 =?us-ascii?Q?GAXYvnuKiCHg0lM/SoMF6voasGs0QJjHsGigNG7eXRf8nkS4YB+B62BQibpQ?=
 =?us-ascii?Q?IjB/DxZ4YlU8n1ww9hsV3IPDaUrj7tkETeEU6q5Oqacsj7YyC0PBLSs6G1ZA?=
 =?us-ascii?Q?MTGPIKG/MbxxXswlPOV5wO0icEwH+mze27NYGhjz39NcrPmem6pZUU8cp0Mp?=
 =?us-ascii?Q?eAfvMWVLhy/ThvPxb4eN7feRuXy0uxLEynOQF1sKRLHzBwFdu1mPWpkf00JJ?=
 =?us-ascii?Q?wIA96yTP2mHjtoQAnV6YkiwzMAOqnq7/zf686xD6+E/AJ2ffP8dRt1tkiFTG?=
 =?us-ascii?Q?d4Qa1UZ+yRROzteHdRQd/HhwCOelEHjRmK5gm09M/L1HUXfS/Y4GmhEAC5TR?=
 =?us-ascii?Q?JIFWxX8Y96LfxdWY7d6YHLEyQayIDSA7friB8Iz9DF89qsE6E3ZXEW6h7Mk3?=
 =?us-ascii?Q?3GlZ0pyLNJPVveGQ5iDelj1GUtkSCkFJNGL3t72SVH+A0ojkqKNwWzZhI5dn?=
 =?us-ascii?Q?yGOymqowtT0OmqXPgJj4jZddcQdwRScocLay5Lzb6+/yyao6tdixwu6yJmLd?=
 =?us-ascii?Q?147nYHuhIbjTQyOfL2Gg7QZg54F/CzXHF+LW5ArBjMvzh+d+gkq2wU+XLU3N?=
 =?us-ascii?Q?fCW81ABVXLblzlkRzMB+dMvXHLYtNYMh0iNQLsUp/PjWLoQQPkoeZX4k91wC?=
 =?us-ascii?Q?LNvAxvUtJwM4a8uGXJX+XX7rcmZ0JkY7wRvNMf+7wwWq6Aw2vPhqyB9sxzp5?=
 =?us-ascii?Q?q2iFa87mFVAD3niQ70F7mAeSdBjHndNowtCRwgJS041SirAVceScTNdS9Ug9?=
 =?us-ascii?Q?ewciaV9jrczmKNgS2jU79FpO+OmIlNxppypsr5id6YkpU4WIZX1nNBOIjkwy?=
 =?us-ascii?Q?aeci9l+7nCZ+oLXmr1DTuHtTzAfm2KwTU29cq93Hl5Kq5bd5uwLMx4+xqKca?=
 =?us-ascii?Q?KFncJN7OHJe3zm3RlHG8LgYMZxHxtWgdPhaV9uUJtvV0l5qGJ5Maw01M+F+L?=
 =?us-ascii?Q?aEnqhEQp11snxEWQ4v/ZROgWWPEM8a/7vI599Oj4qsnwfaqmVlRtDy1vX7L5?=
 =?us-ascii?Q?G0SYwaiiEO3DXLDpQC+MF0mCKGPhTtvhRREPdwUx3vZ0ctrKvkPx4MSB4Oxw?=
 =?us-ascii?Q?gjfBcBawkTfrb9Ph9w7pIC7hquGUrgSWDhRemYY+aMD4Kv6VjWEfpJ/v43nv?=
 =?us-ascii?Q?QXke2erQ2UG9oHeFrUT3UVcBuJ4xk+9rQYRGXzXSEpd4h82hj6Wk2cqOx+QT?=
 =?us-ascii?Q?YwmsOKdeNcwP0Cqp1yqCd0/BKxnJhgY664UDsSTH3E0KF+P7zf3u04geHRxe?=
 =?us-ascii?Q?7t0DaJDJouyc3IVG8eyWbFEPA2u5i0rHsZZMJtGAPRrJ7szdH1BKuYxBGy6l?=
 =?us-ascii?Q?SXV7gBbog+BOGKJ2dmVchXnc4XfJdSRvWBigukv3ZI0zqeYbf1ISgm+n6lkF?=
 =?us-ascii?Q?oV7eicHLRo1QgV+R9PUVZVzpI8nvQvlVaQTu?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:01:11.8930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0820da-3456-471f-47ef-08ddad7d8222
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4098
X-Proofpoint-GUID: jTL3t3TKdsJjB15WpbpyqRTtoi9pX8HF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MiBTYWx0ZWRfXwnRq6m9Q5rmT Ap/EYTCkNIyXGuqXVFYOORoTFy1h86FvM6P14NV6RTU/o+gSEhO3yD24U/PnFHYmlKfwbAjkFHd 73X+sOxZQuhTLd+fprxVoqIXGsl57YjjWUHeVmidFddhbczjwC9GrViDGAcGiYVgWlVYdvQszGG
 BV2WZndGpGf6WQo7zbE6qBFh8xCo3PYE29M6FmseGNDFkA1HKAmzun1CxiQr5GWH8qRNb8LhjU6 elWd8oWRaie8R6/lxtqbMKnRYtPYnyTthD9i57NnS9ZxWgPY/nJZwAefB+qvYI2SunDvVoPtyEL pOE4vXHhlvqH+ypbb7YdwzxaV5n3wiDm/SLsHvH5KTYgrCSCYlYIoQFR6xFASxRGJ7YR+c/Tgnp
 K1resMEdjpySMypZtt1ZWDoavNrA4p36+lTbTFCoSoyJm7y5MIfSpa300Y2IY/7AFiN+Whjl
X-Authority-Analysis: v=2.4 cv=F/pXdrhN c=1 sm=1 tr=0 ts=68512ede cx=c_pps a=KYZMEQ2JsNAfp/uYrnaCmw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=8AirrxEcAAAA:8 a=njChIk8uM067EdgdCQYA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: jTL3t3TKdsJjB15WpbpyqRTtoi9pX8HF
X-Proofpoint-Spam-Reason: safe

On Tue, Jun 17, 2025 at 03:43:34PM +0800, Shengjiu Wang wrote:
> When codec is in idle state, the runtime suspend is executed, if codec
> has been reset and user wants to use i2ctransfer command to get the
> codec registers, i2c access will fail.
> 
> Move reset operation to the runtime resume stage to avoid such issues.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/codecs/cs42xx8.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
> index 6a925f3f7137..be215cd2a714 100644
> --- a/sound/soc/codecs/cs42xx8.c
> +++ b/sound/soc/codecs/cs42xx8.c
> @@ -617,6 +617,7 @@ static int cs42xx8_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>  
> +	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 1);
>  	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 0);
>  
>  	ret = regulator_bulk_enable(ARRAY_SIZE(cs42xx8->supplies),
> @@ -658,8 +659,6 @@ static int cs42xx8_runtime_suspend(struct device *dev)
>  	regulator_bulk_disable(ARRAY_SIZE(cs42xx8->supplies),
>  			       cs42xx8->supplies);
>  
> -	gpiod_set_value_cansleep(cs42xx8->gpiod_reset, 1);
> -

This makes no sense the line before this is disabling all the
supplies. This code is parking the chip in a turned off state
and it is better for it to be in reset for that. If you want to
access the chip directly from user-space during runtime suspend
you need to runtime resume it first, I believe that can be done
through sysfs.

Thanks,
Charles
