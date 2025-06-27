Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495102750E7;
	Fri, 27 Jun 2025 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038950; cv=fail; b=pdVGoV1zwV25+lmWSR9Bwq5ntiVN70bqy9YRhRCE/1rsf6dLX5airmpEFdOzngnbvplEcLq2W8IFk1yAAuN2VTYmyPmtAfKouGwKQTpgHgYueYj3UIGjh7djK4GadgDoUBjaCnul9KsKm6m7ya5J4108GrJOjoh6WmE852LJaxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038950; c=relaxed/simple;
	bh=iHbQdShv9nRbt9BPWOcDJGxTQR3ZDvn1BalqPY/ozRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQwGUHMfLyicFbN8ad62DqxpcBFZMvjC4EQU0orqIQLL44hKlBjzA5xIAiZfonSXJX9JOFRTmRbRgbX5L7k15n36EDH3BipUsPmG404LVUppkTyr7z4BSQd6j+aHQbbCDYiPlA+Oil7kXH3I2oCw7d28SswJm8hiw5swUZFr7EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ECoHHQIk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=X2ZsNwRA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ECoHHQIk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="X2ZsNwRA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55REYnGO010099;
	Fri, 27 Jun 2025 10:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=fxTIpghkvOkAgV1FD1
	bfC1kVcwqQEtx6wiJt8ymY9bE=; b=ECoHHQIkfURh8vsizUOCkl8LO7DmSlw4Kp
	q0zHi0Z5PyJ1DgLYYRyjjET2XewMcJUGYJ/K3ZYxT9NTuZhHgmMoX7un26M0967W
	/EeqyKCk39G3Jd2xfq7PsYWD7yPyg0L2/3y3/5XffpkIRayqCXt8zsRVpFbmF7vJ
	iYV07xApXFN56HFQxxLwZPJ3hcs0+9MtDNheE5XmVuWAFM1sJzzXAFotqBpPZhR4
	VzcrOwaiJtvdFA4ECbIL/yHQqtaNyCdXYxDekjCvdCRPdtEdH8/Dv5kX4GWspYjC
	UubMQjnREP65Ifo5KNv7fA6T4UtVOlCMclOWmRWUP7BWdOBnaoQw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2094.outbound.protection.outlook.com [40.107.243.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5u003as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:42:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0BXu6Yk5U2/coZhBef37PvimMDDliPldS5RWCr97QIWLGAo7qbCMIh99TcjozuNrJ5OoqT6CsCPhqNDjkG+YGOognJl1eBcEodMSOPmjEOVzkPALJLXSfVK9G5XwCC1viXJHMfoqAntPnIyG5khC6Fvyq1W4jtXL3zxm8ot4TYUKYFw4fByBV4o6W+ihNL9RiIYrXyIZwSDT/Ips03cDTqFieuf9VP5TcbixuY2Ufb8PhSs9dEI4i0WMJhU0YySgcrWs5ppVYIlDSOoxABlBsNHHSUMB+EzXN47dGORMZIjIYS46FEY86fPJvWAYXmgeAMjZTX0yEBlcLKCBprCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxTIpghkvOkAgV1FD1bfC1kVcwqQEtx6wiJt8ymY9bE=;
 b=A8QExgR/+YIq+4JmAQiwPON5GT/Yx1RGc+iDr0EzqmXwNu0hVF5JcXFgKMsVOTB/R2OINst98sujlBQRNYIfsfSFdTG2Chotj2dGAQVdT8ZSQcViLQAKLDPNtzmIcUVSUOCcinUNocX7IFv+WHqQKhRbx6dStgZbef2PUC1tqxEVA/C2+M/Tk8XMo7C/lG6tHjiJvrOsmdw52/+GQheMhvex/7GI//lv8Ynx6uFQku+hhsMrvaQTBGCQIS71SjHvPnZZKdHaAzHn+Otom+w53YjLWcQLeeeaOk03CeECH8vVmMF0ONXRuTFmk8s89E748s5U6nP/Ej6ocbsZ8nqw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxTIpghkvOkAgV1FD1bfC1kVcwqQEtx6wiJt8ymY9bE=;
 b=X2ZsNwRAv691vSXwiJkqAotBIzODsIjW3p8Bka4XxjQe95DqQyT635O6tA4EhzRBk5/bRJzfjnx7c8aWXC4Gm1bv2H0UHLkdkFTlsmZVxn3Caob5F+D7sOfWwd8BBsZ7cTSj51AE+UTROLMnSXhzQeK6/HlTGK6NLY3NjWKckaE=
Received: from SJ0PR03CA0081.namprd03.prod.outlook.com (2603:10b6:a03:331::26)
 by PH0PR19MB7551.namprd19.prod.outlook.com (2603:10b6:510:28e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 15:42:08 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::a9) by SJ0PR03CA0081.outlook.office365.com
 (2603:10b6:a03:331::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.20 via Frontend Transport; Fri,
 27 Jun 2025 15:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Fri, 27 Jun 2025 15:42:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F2034406541;
	Fri, 27 Jun 2025 15:42:05 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D238C82024A;
	Fri, 27 Jun 2025 15:42:05 +0000 (UTC)
Date: Fri, 27 Jun 2025 16:42:04 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v1 1/1] mfd: madera: Don't use "proxy" headers
Message-ID: <aF67zAU9HldZgaN8@opensource.cirrus.com>
References: <20250626154544.324724-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626154544.324724-1-andriy.shevchenko@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|PH0PR19MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6e2bf5-6349-4757-8a4f-08ddb5912c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GGm9O63Yh6dU6RYiXfKbB5Fo/kMeV6AjTBsrHyMsL0Nh4KWOULhFwzJWmrKg?=
 =?us-ascii?Q?zbFiAH6QCBrtxL5fO9MYS82KPSd9JBbkNOF3bt2Gq/Dda386HcaCxegfSWTV?=
 =?us-ascii?Q?ug0v2k40zYzJz0XhxUf5AAAHbYa8Z5pOn1dFUsXYikG0Ps7Uw/DfRjgDvhCc?=
 =?us-ascii?Q?QQ6+9i4Jv2MXH5jcFohGgNyC2Zil8wZKMwA03XVYnPOqfWVNnv+29Vm9CS7d?=
 =?us-ascii?Q?wPPR8/1sOqzzo2A0MCvYRJXcniWjA2EOY3ZTRLOquJNl2h0Wtt0V8bsklUwe?=
 =?us-ascii?Q?MlDoYt9cVESqdO5EpSB5vcxsnw3udTqpakgUjVCYatWGKefOMigU2bjsj7CZ?=
 =?us-ascii?Q?Imst72HnH62NBvBdmxxFstD/jRqZJBsB7HqBoTs/ge/wF6vFQ1IjzAOO7Ff4?=
 =?us-ascii?Q?L+TcMCjDwSdJ4SmcLYYOFu2Kg6qR9rqhKC3kwyBQ143MJErF9qg8rDpF+I3y?=
 =?us-ascii?Q?Yw4XkJiBHyDz5QGIO+waiIPEN+1PrcP7Tn3mkgsK1TgPohtRambdNK5apzy7?=
 =?us-ascii?Q?N0CLRRWpPQYkqY86nC5WP5fN//6nCrxLfPWI5/hcejc5faPFhdgkV2C7Q0Ll?=
 =?us-ascii?Q?kMcnOMFE8K9t+ZF9XatX7rytYCJG/FLv0HTrmNhnGru+FYJwUxvbyDHwmaQl?=
 =?us-ascii?Q?ievHFeu/PWvb9L2ZWai4qviBI6rLC40sbLdsJOmbXp8hw6GG2835oIgtz59A?=
 =?us-ascii?Q?KpsEBOjzZjRrWowzAOx3lDUpC+Qsi4oIbUfv6VwU8lcPImmYdXqz4KDve8Xx?=
 =?us-ascii?Q?hSDX79ycyWCUJtsz+AbcDbqlxZdCzdDZdriY8BanobG5xL0gqjARoyK/MZG2?=
 =?us-ascii?Q?gdLBa1WXhE8GZDGyhyagjFmrppLe3bg3z2OjivCjDsfH6cVR2L5DAz8Y0iNL?=
 =?us-ascii?Q?A0bhoaxMLFqUX6+1B/5/cZXyx2xo0VTs2WtX0aZ9B1OstyGwGrKJvR28SN4q?=
 =?us-ascii?Q?CDQZSz2UfT4ltd4zmnbMk4aS/nWhCGyU856Pl0HUT6USYWo2m0idpVcv2nve?=
 =?us-ascii?Q?qjkTZgXb1b4Qei00u7jWkGlZTfpob+UHAgCDWPpHBhQhnECWeV2W47bx72ZG?=
 =?us-ascii?Q?cqI3dk+LdTcsPwABs6oSxIAZ6SX99ZNFIc81FDfZRj6jmuqIKGY/8M9Ojz6G?=
 =?us-ascii?Q?YauR9K651Zub/j8J+BHJY8v3HPC5gXBYhVdeI/VtN0npBkxL3lKENBrh83jj?=
 =?us-ascii?Q?1L2XFgCjJHBNNq+tDp1x6b/JlxV7aZT5Em+6sOo5AIXCfEJnuOdRPCA/tYTE?=
 =?us-ascii?Q?YhgKuZg7S4qQv61qOarHqyJrIw9wspGTvgJEg8lWQJ0ZlE08hdW5AZtNMAP/?=
 =?us-ascii?Q?tKEOG7/SWIgml61AZQKkSAX5eW/5IhnrrwZmidf7KJGDGMVbK9P29YWC0vG8?=
 =?us-ascii?Q?3r9VacsUqPaXC6490dhQZOnd06UcbEcaM93EmGXDWeU5KCFE03wGRDZAQ8xx?=
 =?us-ascii?Q?ERbiXQQPXAzbyicqkzLX48sArlsGhFJcI84N8JM+B2mTq1Dwlc6+kMxjdVGO?=
 =?us-ascii?Q?HhYk2u0dK98BdT97cUhP6IFCMAbI6MZo+9fb?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 15:42:07.3189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6e2bf5-6349-4757-8a4f-08ddb5912c6a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB7551
X-Proofpoint-GUID: yI2K6YI4VFLvSbojv6KLo3fAVYJJWIqV
X-Proofpoint-ORIG-GUID: yI2K6YI4VFLvSbojv6KLo3fAVYJJWIqV
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685ebbd3 cx=c_pps a=FCOXCyludURfuBFcoab/Yw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=Z00PVQUDKefpqbR5-xMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNyBTYWx0ZWRfX/PF2MfRe4dcj Ecnlh9F6FkD3tkkRSyw7uoDbWFKiHPJk5Atx2quz6ZI9jX/IPeZOMQgmQPsNUzKDj31uMHW9hnn gM03p/ktJ4tYClUh2qIOcJjuMjR/Jh8WbzcXjgnOPdOoVDjCm7HOLh1Nu3UatKkOkvBVaKvcvOY
 UzFjX45e3Q3YlXR4yvxeiV+qVqvNTJto9JQzqVf5w7XIUsW7tqRBvVsY9/oQzsdIjiDgrkaZ6cC XIA7dDugl5W9tM66sWwj3duPphVnrZhFtcPS40fH9TwMv5qoY3786R/BfDuPphiLoPYUd802Niu s79CR6fF6aWu4QeH3QAW+c/e9vMCiAR5WbKbtsPsKpYjlI/FRW3h/ygV0iavotPkMUh6+CnKXH/
 hc5rgOh+PkDyJA8tBSJpR+XowSk8ARRNEPhEEEuKh5C5Qom8glCudmVUBguF58pqw2jXzIF7
X-Proofpoint-Spam-Reason: safe

On Thu, Jun 26, 2025 at 06:45:44PM +0300, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
