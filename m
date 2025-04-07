Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108F217F32;
	Mon,  7 Apr 2025 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013936; cv=fail; b=uSkDqqNI4kE/2uJ0EF6TAlAmCi1mzxlrxTfQdTEg8A9CQY2X7vmnwdhqzB/E7ZOT9586XaTrXzCNau0shZue2SQQmfNuei+US7pjgNWNsTYbD0GpEQYNeTLLfsvE4rAzIcjAKLGQMhefzfbmzVYReCKVEJhqTsJJipYwFTHBuSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013936; c=relaxed/simple;
	bh=XQOf3OqZL8GgaGxEhm558o838s2h9kUpm4GN7gkHs/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5u1P321s2mQ0FKD4mXFSrL1iXbcqGLHTacVInQmNtVoFfrY1qOzQPIvibck4KPT4m9CtvLBP1z1Wg4GHzmynqASdiShn1YmG6VFN/+REhy61Yzsw7ydnXMNuQ4Ky6sYajBnl2MsOMznqol3Ana5rqAHRcLGXthfkgMz7QASiNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EJMiaosX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HIshz0mx; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EJMiaosX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HIshz0mx"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53750V21027844;
	Mon, 7 Apr 2025 03:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=sABlvhDTd9E1nDQPPB
	x1g6HfOPpvMAf3Of/onvUf+d4=; b=EJMiaosXnfrcd7GR+Z34K2XZBiwRCjHw4N
	qCsj7yjhFl2Ek3KR6+vr/+nFeBZ/jMGfgbqqnK07c8m6xWz4qdZsyapgn6F101iT
	geB+77NGbGhwd9HnKCbrvHU/rXtPUIEuekRDCgv6TlBLW8QsoI+kxBkAoQhbEzgz
	L+E+hArjk9LBk5vQ418Q0Dk0jS10qMZg5jCqq/tICu81cP3+YUsnCP8HSjpbKkod
	KETWIsgWE1A4OeE+a1T1Aqt/PA1J7SPZIqkqUy/OP9aUUaBltu/SENyv9+25lBpB
	VUuCRME5Pq1uFl/XY0/zwm/8BsymC7LVYMuXJfeZoxLqlu2bPpfA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45uyv1ggun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 03:18:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XR4S77kUCrhgzQfwhVkuDvdbvNNWDOlqpMA/+IIeMdv3FDkB5GZ2FutpqZZjd7gtx7mDQMk/YlgHBce3wFTcf8cBKdmZbCoU1NzduMpZzijWaBMYKIuL8LiObA+fTWNIsi/AxN+AzweG4LXfFcoV+NtFq0pFjJohxaT9RSaO15AI2nITbvHH7UBISyhqHpYr+pZ4I1tM2hNycoYF0gbmkKWYbDCG4zBREu9SUhXWD3V4KkNlVuQoUjep44l5ETCwCVPgoYKHfE1zN5Wn8JelGkuUOq1SdeDTLgpgTB0iistl01Vfd+cLyUPgNhmrFwATldre/SRtTGEA2z0Q9PN8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sABlvhDTd9E1nDQPPBx1g6HfOPpvMAf3Of/onvUf+d4=;
 b=d9m9mytHdLs2YNIrSqa7x/uLv0BzE3XORsDqsnZWDTrnc6XOYfxC4bziejALCsMMSI2k/ly/EL3rjvVsrVSV2WvPSaiBnKIZozJhFFvyW8uWuVgoqYG0nW+qKl+MKYVU8Y7kPEoCiGl7u6xCj/1V1027kUG8VC3XlKMQPDI1RbbaMlGKjf5diYkOQugrBHw3KGNN9I9c60Ar9w9mqKMpdiqcQhI8uDpZqubVmZajObKsJXKpffoN6Z6JZxAdt9dhyXpa+Sn78wfXI243W5c1UceEO7TJvOI7gwx3UTNpqKfZjFinPnDpVz6uWteVqnpOrxrB4Nfhz0tQ/sG5TRfXFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sABlvhDTd9E1nDQPPBx1g6HfOPpvMAf3Of/onvUf+d4=;
 b=HIshz0mxdofBC8bvhE6kCt+ukYkwxgKFfemGC+HLAJk0US5+z1ShuDgy+EGIeAbeW5rNyIxcjPRh6cPgGFVf8BIYAlxH8ZvnEyT7q+FLyjEZvq4/vbPbxRDarzEZw2rC41f7neUDwu0UnNNS+duiQ611OhCQttMeEYGIsDa0Kvw=
Received: from SN7PR04CA0181.namprd04.prod.outlook.com (2603:10b6:806:126::6)
 by BL1PPF68C00CCC1.namprd19.prod.outlook.com (2603:10b6:20f:fc04::eb0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Mon, 7 Apr
 2025 08:18:17 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::94) by SN7PR04CA0181.outlook.office365.com
 (2603:10b6:806:126::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 08:18:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 7 Apr 2025 08:18:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0C3F7406544;
	Mon,  7 Apr 2025 08:18:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id DFC4F820244;
	Mon,  7 Apr 2025 08:18:13 +0000 (UTC)
Date: Mon, 7 Apr 2025 09:18:12 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        rf@opensource.cirrus.com, simont@opensource.cirrus.com,
        peterz@infradead.org, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: wm_adsp: Remove unnecessary NULL check before
 release_firmware()
Message-ID: <Z/OKRL+lFvav6rdp@opensource.cirrus.com>
References: <20250407063403.2772040-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407063403.2772040-1-nichen@iscas.ac.cn>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|BL1PPF68C00CCC1:EE_
X-MS-Office365-Filtering-Correlation-Id: 20997de6-91bf-4025-51fd-08dd75acbf02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jCF26GowfgOY9QnNOkF7Vj4HrZp4vABadSk22o0oLqY/i73KaIig06+xqJl+?=
 =?us-ascii?Q?VFkN523Z9bgiIh8aALysxbE21a85p4eXevykQxhgGOO2BS02pUICTIzaBp/j?=
 =?us-ascii?Q?JWz9QSFjK1RH8Zn4xh42VN9Dt2RxaUJycaLvKP4ejFaaNlWgycjuDeuDoXU4?=
 =?us-ascii?Q?jTifijZayw9CTG8kKQvrrjyfqCBqFPN7M9J4wBhVIuC9N5h75SLZYeEAz32D?=
 =?us-ascii?Q?1nzTgJ9Bf+S0O2bSTyMYUEnabvOMox5rpEFjzi4umbrsHJzd9ID7YcRWCFQY?=
 =?us-ascii?Q?2OhWulA0FaQhONZ/JLiU6UinYhmax76+CEUu1VjcfpEtmDE4QbyLGqOYgMHI?=
 =?us-ascii?Q?dgzC55fJE2HGS2idFRfJaRptM3hft5TF5KxRYPQlk1WxLNxBsee1F/mUNNov?=
 =?us-ascii?Q?BbUIimlOsaoM38Ie7m997r5UvlyUvj8K1aEzTRbLKYgsrdU8W8IBUfasrqmx?=
 =?us-ascii?Q?Ml2VE0mZ49Kg0uXYnV65Oo2Jz/vytqEE5lULEIrfU9DLtDOTikkcVPIONTiw?=
 =?us-ascii?Q?5qhMPYRbVyoYsS+FvQEmBipxVL2i8pe+5p6uaRXwCWiXo39VNdTo4BEaBlF6?=
 =?us-ascii?Q?bDTHVHr2OcLPFJ93pCQptRGM6Brae9Z5OY1WmD1vp+owp4yBQkjNZpSRnICU?=
 =?us-ascii?Q?GP9B5GYPka4La4b/QOUIyIK/xdNre3rnQjjLwCXH4GTWiJoqYCQkgO3Bzd1r?=
 =?us-ascii?Q?GqGHKyHE2SBjnIbPLM6+U+V3qT16dwio0fvvt0PNv+jY77BQE1p7euM+9+nB?=
 =?us-ascii?Q?WUStnxE/JjWbbUW6se4gxMDnw25NVEXGU9lfYgEIWaLfRQZQaS18xoTutE2G?=
 =?us-ascii?Q?+rU4y+gW64fXQ0ONtui6c2Im1L39QuulRsnilKuCQwGlCrc6YjUTz+uNyCpW?=
 =?us-ascii?Q?lNMXstkHcVQ2Y+eodtBGfDoLv5Qrs2w0xsGsZVMjuKkeOvQWiKMNQkCTUJs4?=
 =?us-ascii?Q?zJFfHp/CeAMTXzzovJ7eRH4f71AffzSHBrEYSnEp53Gx44vzRBcj90oSu1DE?=
 =?us-ascii?Q?/udSjRSK5hnotm3IkTbncMPEAjGkGGb1fWiCIhzGqPfwXqtCjf9hN2gEFRDL?=
 =?us-ascii?Q?b5blPHQArzPZ5fiUqdgnGUp9Y+d5vI0inukWTWU0EbYLdIq5reUYUYRnEXVn?=
 =?us-ascii?Q?0lr2isUP+AHPKwSg87bcUvtCj0y27ki2MXfbJWaQA3Vm2tlZI8cjI+LrCTUX?=
 =?us-ascii?Q?8k1/fYyYvkG3T6IaFA68YPnA5HFvU9IFKjVc4YnStgZ5QamFtwm7vj78J3Fz?=
 =?us-ascii?Q?KWO49QxmzSpNCGVM6czk/fVcnjXjEKu68VZSYpzWfLBLhTCnME7hmx/+Io6V?=
 =?us-ascii?Q?r70zdVImB4z0y8Sf4Q1uggexxDlNQYKJ9G0tUauDjo+2Qh06X3BZSVFSl4mK?=
 =?us-ascii?Q?5yDXgpza8nmBRtY44yKT8vIL4ZsfhCdWHXazXtcoQ009Xii93Tj6APMIWGZl?=
 =?us-ascii?Q?OdaL0ncd46YSRjhcMkga+IZU/z2mRY01vs+RLDfY20/69dQMEaeNhkPJTH3t?=
 =?us-ascii?Q?Yg/TcLnvj+NHXSI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 08:18:15.3090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20997de6-91bf-4025-51fd-08dd75acbf02
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF68C00CCC1
X-Authority-Analysis: v=2.4 cv=OfKYDgTY c=1 sm=1 tr=0 ts=67f38a4e cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=1VFnAo2mpl61hzywDPMA:9 a=CjuIK1q_8ugA:10 a=pFvAdi_5yfWfl9Xqn-nn:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: kqaXt9Fsb9j6rfHuaJVN2Oo34w22e3fZ
X-Proofpoint-GUID: kqaXt9Fsb9j6rfHuaJVN2Oo34w22e3fZ
X-Proofpoint-Spam-Reason: safe

On Mon, Apr 07, 2025 at 02:34:03PM +0800, Chen Ni wrote:
> release_firmware() checks for NULL pointers internally.
> Remove unneeded NULL check for fmw here.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
