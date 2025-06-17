Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A242D12EF;
	Tue, 17 Jun 2025 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750173554; cv=fail; b=uIfiN+tMShNyBNmsFzSysnpCHjYR+UAcPwitQX/HD5h47xLKkWkPUH5/m3Uf+G6BLVr24v1DEFoOhLWoUbusWMawkhpevUV01M/hbKGukyt+ZoVqbDZ3pbkKEG73MCWQIA+K3E5F5esHGHRnvk47MRpx9rMjS3gwv/vsf2JUm7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750173554; c=relaxed/simple;
	bh=a3+2rRbP3ETEjuZ70HXHsEvEP8XFSTkzg1tkXufszjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkCd1hLYAHKEL1qlkROHYMas/GCrWUHDA/FJnBBF69Hwq5+Tvvpz0W3O+EzVqhQDFROlGXStN3saz0ASBH/eYNTivyh6ugYF+2vQ5j8PVoq0cYMS5J3YmnIQKX3BprV/3Cw8pg9tevbOnF9o5O0a7aPjRKxI2QJh0iWzV6bo5f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=eB8AzUV3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gf9/rvaQ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="eB8AzUV3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gf9/rvaQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7hUar000484;
	Tue, 17 Jun 2025 10:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=jCgpSNOJrcWFQ3IjV/
	XT4GTLSqCR/N8bjKfykEE2sT8=; b=eB8AzUV3bpGQyQbjDWEuhtRkt3lRN9OMRd
	MY5Ax9xpAk1QPdrvkgbHbbdjUaRB2NAm5uBWpUtmM5Mfh9furHFtULaj+ZNVsNIo
	Q1/CX+/dLiGkav5SwSO0Mm7pPNRA+BoYmLNdHljvCcBX7cgWFO1eQ4Gr4uBVbrQm
	lc+gQ5BGzhX8Vpkter7ZRf1sGezkdpLgluww0rjLlQlvlk9XvYO5rk0zWSWA7Z0Q
	3obvnGrHwov5tjd3AyKDOLLJfMLR8/1Q5YmvdcvBxCA6lnGssViRIq1fSTZlfJHF
	fyKfI6Wy0nT5PTxQvT97SzC43b/R+/O7SHYgILMzzkUv5ZBUTe5A==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2090.outbound.protection.outlook.com [40.107.220.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47ap6asukn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 10:18:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyUHAA/XaQA+Ui40+DFFxGFZWKqrgB7wppehCy/aVZep8PwjZGJ/wi3vov0FsKOnYkjs+p8ACIlAhsdlqCw/8jl+2LDMiR2ZPE3EGuBmfCUJW7Dno2q3dKemVqhWhdf8nm7IFFqaqt2d0H7ffnP6QuS06T6UehjGp35rDlX10sBS5Wk6fJ6SmYqCu5gH+PyQWwLvwoiSdyp69GUztqkG7RrS8O2vt9P8JdMoATVISufmurA9XkRJ9pAZzKnThGcLdGrWPDa/O9k6Foxc+aY/LVsES4hF3gXu+Wb9ZambuczJbcmcQnF54wy7A2Hz/uEBiXU5grQzPW+QLuYxRKPzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCgpSNOJrcWFQ3IjV/XT4GTLSqCR/N8bjKfykEE2sT8=;
 b=UzmYzRkwUWGz40DNnDqNKzNrZ4dLztfttuWszxlDiFixruMbephnPv3LInGUAL5y0fq0uj2tfz0VLZTWLRk5Bb8gFcBB5uVxox4Io+O/lZbNqxcR5EfwIN8Y0yJ3ICtLP9UExwVW3rugNJu7DAlf5MRmG+o4qF/69JWqigREgr7vyK9AJT7at38Lq/Upx1x4ma9Q0xO2RI3P3TF9s3tIWb39ElkDoIZ/pZ7kpmEPQupgwTYoTIJADFJAw6YZKfRQnwINNVCd0rU7aMf9TCC1sY4eIyjn7a4Ovw23VxCBzJRdag9TCNCH6D2F8ge0RCkrbcinsJDiSJkJP9NK8RH3jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCgpSNOJrcWFQ3IjV/XT4GTLSqCR/N8bjKfykEE2sT8=;
 b=gf9/rvaQXYOluwsK5B7UTf6HhC/cgGYwGmzF3ziXgDL6dYGIkmW56dtzRaWMJy1ZgNMOCMNRAkxQ+scHZWBo+DZkPTu49xOL3DPqK2zOPc16FMHiIAB8Z2m3ZGqzhQXg2TJs9skVXuMSrDVfaQJjYlvw2xLMFxnC+Zmdp0f+mXQ=
Received: from CH5PR04CA0001.namprd04.prod.outlook.com (2603:10b6:610:1f4::6)
 by DM4PR19MB5715.namprd19.prod.outlook.com (2603:10b6:8:5e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.17; Tue, 17 Jun
 2025 15:18:50 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::68) by CH5PR04CA0001.outlook.office365.com
 (2603:10b6:610:1f4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.26 via Frontend Transport; Tue,
 17 Jun 2025 15:18:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 15:18:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 13EBF406540;
	Tue, 17 Jun 2025 15:18:49 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ED70E820249;
	Tue, 17 Jun 2025 15:18:48 +0000 (UTC)
Date: Tue, 17 Jun 2025 16:18:47 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: cirrus,cs42xx8: add 'port' property
Message-ID: <aFGHV0pM4cZn6ES5@opensource.cirrus.com>
References: <20250617144619.1130857-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617144619.1130857-1-laurentiumihalcea111@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|DM4PR19MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb7258b-536f-4da4-5575-08ddadb2435b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?37olfSkmKZstwN1yj9+n0uhbaBMXl1EMkI69ThdC3ti8ozGypAdroboxgLl2?=
 =?us-ascii?Q?q+1WaLFdDnC/g2Kn/gAY2o5c67MO2XyhnZRRe2FEWzg/zjpP77z9g7rutURH?=
 =?us-ascii?Q?WdJu0+Rdr8o3SGNn9QKvTjsfkMjpZQbuItbIvzU78vLPOiwMXWbHPVJirKVj?=
 =?us-ascii?Q?cr0puo3yytMYuvKbhsCtaVrIOzwoiVFswuCYGyA1sESOEok1vwnJ0S/XY9VD?=
 =?us-ascii?Q?DHXB0Dzwy15ttXCXwW5J4jB20jB19V/LtMCABMJ1ZW5bhtZlcr1Og7qgfut8?=
 =?us-ascii?Q?gEuxJjlxnOMj53acFX/zZipf8bO/d5vpZ/TImCaeqfuGbwXIEoynRN8vAbk+?=
 =?us-ascii?Q?fhNqBC/6HOs/AhCobjMA/sJmQNH0TctIshZzGWSF17FliRGQTcXFY1hI6aHR?=
 =?us-ascii?Q?1JGAxzFtQA4gwBzqz+rBWET9aHyqNBfW9MjUNQgpc6BOO5KUC+jEGUQuhqln?=
 =?us-ascii?Q?JOe2cDrWQmJBb2KFggnV4kQJRIUJFsUjJVWxYDD+3GT/UhBSEIdoAlxoSWX6?=
 =?us-ascii?Q?LfmETSCMWCFTJJe/kZYHoT9TQotmiatFkcAB3w9oEWQuNUnFjXIXLlWwHoB/?=
 =?us-ascii?Q?th5S+nrldGysk6RZHyWY5UfynjqLLc0Tn1/RSn2tNPKO6Osp882WMcmq6JKw?=
 =?us-ascii?Q?f8nosumBBlwKEVzSxrDrGIqIy0kruNmw1la3OFBmNg8IewXVBHlAODDI1z/C?=
 =?us-ascii?Q?0j+vNx1Fr7MhuvS5d++SMOIbzm6MVsHa+ZBLzpS2W0SRApZiEOXMVKNqZXCh?=
 =?us-ascii?Q?ko4YH4v13O1gMqmcJHqcJfv6vQKKqAy/DNS7bQUaE4I8BF/c7US/0azhmi84?=
 =?us-ascii?Q?JDZ7NZx42cFm86QkPWdKWezEINAIME+U/gmxHLxj5B95Jcmz9X/z9UTkqz3S?=
 =?us-ascii?Q?03fHUKrk3PxcsrlJ0dFEDw+i8einrbX/TCoAJStRtol+X6XB375DPu5iKG71?=
 =?us-ascii?Q?/Rq2ZmmTtpjue11eEoRGpDfjGUoPgTLgh0ypCbJn97BjFK6mL0l4Gt7e2BrV?=
 =?us-ascii?Q?jcRCPLuY0lGAilr1fV7DVS/+A8ZhHYSlSHdrco/AjPz5Vdn3II7Is1AYpL0R?=
 =?us-ascii?Q?A9m6TtQOQKNjIJkHUb1l1xgbOrrEpJVEAshdHp3U44R9mHK9SVSUMRJP2vq/?=
 =?us-ascii?Q?UsMDdi2+EhGpUzBRtRFPjaWEy6hFNdlesVRNHMWbVAXD3p4GH9ow5mkUhvFV?=
 =?us-ascii?Q?dk52x5ysJJ2nR0PKQ5FKjBdq4L53F74dTWPBSU/NRevQ2sfp/K3NcqerV2QM?=
 =?us-ascii?Q?tCzJzL9q24X08ySUgQNtMoHSwM5B6O9dM9uU2pAOex4uU51tlzycF3d2tBlK?=
 =?us-ascii?Q?T5pCDEJeKKsdleTfGNaOmwccLtPKqraEt0Lr0B+KY4xLlpfyp9zkPRoUrkZf?=
 =?us-ascii?Q?zpMKuzVxxhORSS0E3DJy0ed/FdAgGlsFFa8a2PqDtAewvaTrPAbS+IqJN6Ps?=
 =?us-ascii?Q?1qbgjLyvyL38MIiI9yC5oSCJ6l/+bGd6xBYaHTSlZOkKafdUzvYl2bIasuX8?=
 =?us-ascii?Q?BPDDlyUOIu9xMFwG5RB+blzkHsoab4d2wYTO?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 15:18:49.9947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb7258b-536f-4da4-5575-08ddadb2435b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5715
X-Proofpoint-GUID: uDL2c4rfI9yu79PhQrwLPDbcjbFazksq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDExOSBTYWx0ZWRfX86UIcIGU2j53 WKWn5dYdB6E8+HluEN2a0sWtk5cqnSJm4jSIZlC5Z6LEh48DXuoVWA4oV+8s8s3sF4JxFlFrDnV 7YHh4Q+KaUQWdswbPYCZi5aiXI9zbY/hznD7Hp1t+5K+5iAl1YyvjUHIFlTlowwtC9o/fg9dO3p
 3VlI886CwfI9oTQwUQg/B8HLUqoGBRjL+loQRxDBqW8DaK+fQqw0AsI1nuNesnZbbO17dUnp2tz tn32mE9Um27kYzOBG7FVothI9oopC9n9iNBIVfEJJaLSWKke13MU4QiUwO0282DtIfo6Ki0J18K 6fPHnERN8rOKPIxN9zYt/sZcdPWeYeJzn9Miu+JXDFiJGbJ/sU21lnUDkbY5IkDQSlucwqFeR8g
 C7UVqTwFZXAG3gKanhoqn193VW3Y2yhWoGHtMJkkQieaXBnwzeRQdBH8F711TyUH6alsNpvI
X-Authority-Analysis: v=2.4 cv=F/pXdrhN c=1 sm=1 tr=0 ts=6851875e cx=c_pps a=eP3E3ZTkTsKlbTiO5LW6cA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=8AirrxEcAAAA:8 a=w1d2syhTAAAA:8 a=uYbFPFivnZe1h63EPIkA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: uDL2c4rfI9yu79PhQrwLPDbcjbFazksq
X-Proofpoint-Spam-Reason: safe

On Tue, Jun 17, 2025 at 10:46:19AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The cs42xx8 codecs may be used with audio graph card and thus may require
> an additional property: 'port'. Add it.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---

Looks fine to me:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
