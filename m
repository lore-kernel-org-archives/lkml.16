Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90329257429;
	Fri, 20 Jun 2025 08:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409003; cv=fail; b=YqbOYc6iuy/nBSOdpOFTz7fGprmECrZgEf6B2O1gB1whaCxnZ06hvwL37OqFpULLwnEYDkrPmavYx4JXn46QTm5DVn91gC+jedXHfpCjUjsWS60KfIGCAeIMw6Z3LF4zPMTCeuv4A4iDLy+IFpcNLExtu+HyCddFxvY6x2Oy1Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409003; c=relaxed/simple;
	bh=4zJouF7doLadNo1Yv7IUs4gt8AINy7VoqASzssL2AFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dp+ODSeAYgMa1HK7nKh1EPkg5yVbmc8wR+nWpI0WEWKaf/iP8xjhs6+g79rIfO4dIVqckH1rydkN3aTPCD+3t7hgV2RtG8lQ7aunCzGFinu7XiXf1Rd5+UczJZ2yS9XFdxByTBxR2AsSTfx8KIotJqkfRha1x+saFdeEk7+JjcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=W7EpnaYk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Jdhsvzrm; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="W7EpnaYk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Jdhsvzrm"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K6d9bb021683;
	Fri, 20 Jun 2025 03:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=aqBTFhHgoGoKzxw1+L
	VgC9jJW0kuMkTemcMK44mBenU=; b=W7EpnaYkEQekTiN/jbeKgG5rPRe91g0fDY
	BOkb0OfZ953TlWWMEUJ0v2gZwicxvY1ggT/FiRPDFfkdC6q/Mzn+7fxkn2bU9sb5
	YHoG72cxEy4szhKIw9VmEaHtj9vqapisqI2xNAnfCibGCwAOYWPIKP+JzEd7D8XB
	UwPw2WAoSgQSonMbkR8MIzaW8GgfVNfaMVPCOIUjpn+yvm7ZJbqhD+USxGMGVexW
	/1HA68jAOQ521TQmmtXZqE0LZ5eMDdjukT0CzcL2w5cTKVvkhO78V8CLXl0/B5fL
	h1rP25ed+K9LtzvH70zmoKz/8hFrxqct+Ta6z31J9Lm+nHflbu8Q==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2107.outbound.protection.outlook.com [40.107.237.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47bsfnuvj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 03:43:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkyO5ZWyG5X51IXPfsGTUnR4Hfrkvff2nUmSZofyBJwy7jiG/AsYATdz1rdH94Im3fzMuSZGHyhzFBXj+zvnmMyPCOZHYQxjmrOrukuFhk+Fh/UDapQZV5JrGPLMp2F0ceAZGiCXdICj9hheQrVR0T/LQxfz9lYdu1WfrNhUPaJJqSpC/56yUam1ZKbptCEcF2mgIdvu5pBnWKhqpYdU9AqLCGxV5t6NRzaXGrgPFWPrjiTkLeuiqizQvrOSo6MgkS+uJRjcvZEnNpVRH7bRfng57Zlh/t2cSuQ8KND/9ywe0MqS+D8RHaYbaY4JnIWDJcYq3d5D00SsM4gxxXTTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqBTFhHgoGoKzxw1+LVgC9jJW0kuMkTemcMK44mBenU=;
 b=tE/ubG0pGUPGy91s7CVRSpWCu2NxHL8C1SzReQoRIQAzXxaCLi4uZql4/DUStuYaI1DzNtGJl2+qgdVJY4XN4DWLjAh+FSlCjDC/Hh5wM/geII1gdQdu/MzRrcxcKRWFmQxpU2u6C61R+x0uP2W8vLJBUJvSkyPywGUdt9p+gdld+AXeY4MbZW0gJJies6j2shSUCptxLD9FhLHi7eJUAojsWxhHJ9osd8U1zDMcmdEN4GjqxMDU92Mbi9CNHuAwGupoKBGHYN5q2KL/95r+JqWt7XaqpMamdAmXA4ZpdrvgKeQfCcEcwJfs6qXPN6MJGOUhphs9yBkho3vQRW/prQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=temperror action=none
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqBTFhHgoGoKzxw1+LVgC9jJW0kuMkTemcMK44mBenU=;
 b=Jdhsvzrm1jyZIHkacu27JsgGp6AXHcdQZMmH0Aeil1YNCr5v4wU0UoD0Jz4XQYqmjBKZ75wHCSPOzjPe8CqLYSUe4J2bcaN1Ik9obTA2XMwrSiEQMSzp5Qj7OMrUXPMY2TQ/PpMuPKo8Gcwkt0K04Ift7l1CpsQz+6udW7sAmCQ=
Received: from BN0PR04CA0167.namprd04.prod.outlook.com (2603:10b6:408:eb::22)
 by DM6PR19MB4342.namprd19.prod.outlook.com (2603:10b6:5:2ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.16; Fri, 20 Jun
 2025 08:43:01 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::4f) by BN0PR04CA0167.outlook.office365.com
 (2603:10b6:408:eb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 08:43:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Fri, 20 Jun 2025 08:43:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2F45E406540;
	Fri, 20 Jun 2025 08:42:59 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 159A782024A;
	Fri, 20 Jun 2025 08:42:59 +0000 (UTC)
Date: Fri, 20 Jun 2025 09:42:58 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH v3] ASoC: wm8524: enable constraints when sysclk is
 configured.
Message-ID: <aFUfEgY9hfhB3lKO@opensource.cirrus.com>
References: <20250620021403.624303-1-shengjiu.wang@nxp.com>
 <aFUbGFNAISmamfv8@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFUbGFNAISmamfv8@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|DM6PR19MB4342:EE_
X-MS-Office365-Filtering-Correlation-Id: 243a7017-f5cd-4428-f078-08ddafd67699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6UbSg6GNBgheoApBCzLPHB8suVmmrLSY8Q2TP3O3B9gnTJPy1xbjAJRXxMvo?=
 =?us-ascii?Q?juAHKKpy32qV8zG4CjDAjksHoh/X+5/KKbUAPum98oYj2BLfe3UJHJQnfkjd?=
 =?us-ascii?Q?Gtn1ozOlNJRQhYysnGD3PUKdTda+G7w+XQrmZGG492aGdczRMGkYfICbP8VN?=
 =?us-ascii?Q?dGsshexVC7kye/eXcylxnsRIHC7sKPkKfnYz3h6ZCjYdqCkTEIuXkGURR3w7?=
 =?us-ascii?Q?Kyr7b6BA0W7cg5JUdMYGezF4c8cZLLfgRuy5JQ2rWZfrrpLS6Pl9iAGyYvtk?=
 =?us-ascii?Q?O5U/3AqPMFADzZpOCvGqiat7abT9KZMtkdxPTJj4wBB2gdOKSCnQGN423x0D?=
 =?us-ascii?Q?AAovrqNl0F4uni7ytsLCky8kcvHQWSjAMIy2tZC35YADJGBItKgiZv4u9/0n?=
 =?us-ascii?Q?yR4+Dxr+KAQNRlqnCXdboRhUikqc0DLR+Is2Vnwqn+q0rJFJv23Q67GKdoBg?=
 =?us-ascii?Q?Xf1D9+UzqFYMSPBQVJJbwRt9S9C6tj8sBuEDpGQ0Uv9aXtEAtm+6NVMqcRoC?=
 =?us-ascii?Q?4qnM4DbSzsDskEawW5I/vqOV2eHPMHzmVN8qS4OrYTCEJbamfcPEs6Sey73L?=
 =?us-ascii?Q?/k4E/B7hRNte+HHzJ+nddFtdQNKg1T6Kv0s30hFYCkuW1goc1F2Oj605TzfL?=
 =?us-ascii?Q?7pVgDuf1d3YWBJKXB64k8GhDWtvCJZ6HOUa4XczIoFBUgvC1ZbjgI4qV92qy?=
 =?us-ascii?Q?m0zAz0hQfS7vSXe+DYyrOELrebaeAGJ2MHRPq2La8YIXklWQkYH+9Uzp6duM?=
 =?us-ascii?Q?lFm5eiZzqoIB1SPpX5woKATDe+tCSzJKahrm4D5uhxJttkKNZcnvqRKU2UxN?=
 =?us-ascii?Q?sUOOfisizy1dnehxLjv/pYDwk7pcMPr/RXDW+m3lCJ2CujO/fmuvLJ8WuZVh?=
 =?us-ascii?Q?ZU5B70ZGyOFBbY11WKCxHFGdjePsNpWZzdy/pNzmBh78wteznSQuIECDYfAi?=
 =?us-ascii?Q?J2OMijbQEQIsb0e+6NFTtT49dI5Chg3POfP//g3O+HSArhkIgY3YycYDv73Y?=
 =?us-ascii?Q?geQTzQYrYQeIi97I4800krN2fgYEcXerW4hKJvKZJ3ZTm8q3IMFQ0sblbG1o?=
 =?us-ascii?Q?R+nllovIX/ULO48hPqeWTYOuSB5eWDWx8f4w9ElJI6DgqDWKP7zCcHrREBAJ?=
 =?us-ascii?Q?SlWNMGP7VNaJOCWGMdfnpBbSzDGxmmoqNhGvzOv9FlhColtkToIdBtqD+enz?=
 =?us-ascii?Q?fgd706ds88drM4sXVnFrTIeiMuDTUEOFEOC4VhwqE3Vy4F1fFYCoOzR177Gq?=
 =?us-ascii?Q?4IJnS7KAeSMo0Rvj3rh37R2ThO7m/xYrj/0xWzkRTLZbNu8LBV1sfmOf+re1?=
 =?us-ascii?Q?+kVnw17hukPOp81gU01I1sice1OUQFwjVgB9kfUSbQ9QgDIdP1VolIKy1VLy?=
 =?us-ascii?Q?AP8jcfLlkzmO72vBBge7xx9AN9exWhpE4o5lfcUk3d3b7WMlpzUCfgqZNBs+?=
 =?us-ascii?Q?/7/4UPmqljFbXJ7XRDek18n7l2nleOlO29D8MQ0SCcGlYgLp0fXRTXtkQlcp?=
 =?us-ascii?Q?sOEqVKUd1sTwIk6zgPxBX9CGkEjhc96LBwaA?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 08:43:00.2058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 243a7017-f5cd-4428-f078-08ddafd67699
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4342
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA2MyBTYWx0ZWRfX9Sw4XoQKgpvG 2Zbdw6qgddIhc7BkL9twIlHQRzZ3nCCq1q+yJOcgXIaoZIvVYYaLdtxozV6A/ZEPhw/+XJ9O7jl YH1/WmpR/aP3gRHngV/7nYH1BpJtmn1Eg6AV9qoL8t0jPeo5rwoGbh+Ikr6ye0tTLWRE9x0RRmq
 xEeUR+dOjciPdErDUGdG6AD56Iu7+8+P5zRBfqxkIgPtVXl6yZLts/6J1lAgMJ9v7Nq6Fzlv/xn SRWbdiBkie0tUdO1wQ4zmtEQB7WXCFs2QII5nvJz+k5f0CcvJUkTYiiavOLu+EZmP6PrllyXtdk qc00CdBhZ6s+07C/A1Antr0wABSBTw2DLLfCJ3/Ssd9XPWMtGdvmEBVsp3VwRFqADjmIyj9opVa
 fQcIgvuEv0miE9qwGO6oH31MfSOyERiVB9yiq6TZM8jlIweVu6RTsQ9/lVJg3W/2WMQWw4lS
X-Authority-Analysis: v=2.4 cv=Z4HsHGRA c=1 sm=1 tr=0 ts=68551f1b cx=c_pps a=uh+8t3r8MFU2BVWJWTlZiQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=8AirrxEcAAAA:8 a=01JrPeEPyiSvk4Q7cBEA:9 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: ShFC6OK9UMQTwM8N5UmmjE9AfX4q0kde
X-Proofpoint-ORIG-GUID: ShFC6OK9UMQTwM8N5UmmjE9AfX4q0kde
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 20, 2025 at 09:26:00AM +0100, Charles Keepax wrote:
> On Fri, Jun 20, 2025 at 10:14:03AM +0800, Shengjiu Wang wrote:
> > In some cases, the sysclk won't be configured on init, and sysclk can be
> > changed in hw_params() according to different sample rate, for example,
> > for 44kHz sample rate, the sysclk is 11.2896MHz, for 48kHz sample rate,
> > the sysclk is 12.288MHz.
> > 
> > In order to support the above case, only enable constraints when sysclk
> > is configured, and check the rate in hw_params.
> > 
> > So overall there are three cases that need to be considered:
> > - call set_sysclk() on init, then constraints will be initialized.
> > - don't call set_sysclk() on init, but call it after startup(), then
> >   constraints will be configured, the constraints can be cleared with
> >   call set_sysclk() again in shutdown().
> > - don't call set_sysclk() in the whole flow, then there are no any
> >   constraints. The clocks depend on cpu dai.
> > 
> > Enlarge the WM8524_NUM_RATES to 12, as the supported rate range is 8kHz
> > to 192kHz.
> > 
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > +static int wm8524_hw_params(struct snd_pcm_substream *substream,
> > +			    struct snd_pcm_hw_params *params,
> > +			    struct snd_soc_dai *dai)
> > +{
> > +	struct snd_soc_component *component = dai->component;
> > +	struct wm8524_priv *wm8524 = snd_soc_component_get_drvdata(component);
> > +	int i;
> > +
> > +	/* If sysclk is not configured, no need to check the rate */
> > +	if (!wm8524->sysclk)
> > +		return 0;
> 
> This is kinda the opposite of what I was hoping we could do. The
> idea was to make sure we returned an error if we can't support
> the given rate. So if we don't have the constraint, we check the
> value in hw_params. This looks like it checks in hw_params only
> in the case the constraint existed, but in that case there is no
> need to check because we had the constraint.
> 

Although perhaps I am mistaken here, I guess is the clock has
been set by the machine driver then we would pass this check.
Would it perhaps make more sense to return an error rather than
zero here?

Thanks,
Charles
