Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE8B20326
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032673; cv=fail; b=G4/ezkg+0Wroe2zne8NHsKoCs4T4xKMA+kMpXdkd4IuEsHe0DGe5ccYdQwlmdLTf+SUzRmc0syFTl0YeigwbvVbX1RgV4QKZrTCX3VR1cYW6bKLZDSIf2ycCnr/IXIu3Q2epOOjUbk7//0h440nIRcwOxnp44tlzgdzS6200bik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032673; c=relaxed/simple;
	bh=tYuXxJlt0g3VeiB/tsN/60coo3e+hdbqSLyGpU1OHwY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k+U4wHYvSFol6G/jQgHhTt4eZNFzLWKQ7DPxhCV991U2rMyfH3xrl34K+jpFfwq1wx+68xU1xtrhUTbiDDnA2lTWhfBCXk1+yZOjt/qLvWkeQj0zyLqYDeIFphXT72666va9ocuOjWlPUIFzmkaKsn0nDcAROaPaBzI+0xbTST0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hoPRfay0; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hoPRfay0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iA93zcox+wH5NRmDCIxGqYvAoUd2XIP4eHtufoiHwaYJmtfxzyN9hPjz9rmABYWtlZ6wvCmK+9G9YtUR9HsVSB4mimOqSoHwOO7nb9nf9GiCR4SvW3+9NBzr/JGehXhhBdyNC29Fy9+YvmjVElSpIAUtlsOILvMW6tCYXbvz5cdLC7RHUX9bkC47IVwYPCYaIVpr8GYCp1vt+Qtm5spWJYYOgusMzJYLnvb1Dc2hd3PrSlK46Bz/gNQ7r61JjWZMh6H7eslxpbcMxRnHTKKWL1vm+rUCwc7+jQE2U+AKz9C/HfyJfQHEPtyW3AAVQKKm37DdnTbuM39FyQ+jqnpi+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plBhT1V5kXOrDOr+g5pJzMisGitInXR5SRNciuo5X+U=;
 b=eaP8DJAUjEXpWtDn38q90XQzvsUc+83ad/IgFzGKNvFCSTqqQ2eECImhoczEbXW5/S1TDRwXNJc4N07WuMuw2L8PQEbwoJncu67TRlhuxv5vtWL3FdCkvN00EI9GkOoQXUYDeCH+aIarIr10JSC/bRm00vNshhcPMBbhlhmFywW2WixT5/TvPNCHgIiEOSxAUlczyhLBAhj4wPjmZ8zO821LIW4cOzfnxjJL/ft7ZDGJ0QEFmTAWzWIRXuCCITusASILCyNJtxqB/ZcZ4yApVZKSkcV6holZqWi9RdmGfeY//8QPv2BIokfemo6wkK54E0M+wtUWt0SgkUasnUyrJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plBhT1V5kXOrDOr+g5pJzMisGitInXR5SRNciuo5X+U=;
 b=hoPRfay06OHmRaMtShQep7xEIv5b4uyjauvYj5fVups6s2EPFthJgl0w5HWKPpbbl8b7F4eymR/OqIJhER1LEMBy8QI3FQScrGzSD8zEIP7DotwBRXfecEivjdnIUmlqpkn6wv2NinpqaO7cJf0Y8bedglgilKVnDpncmZDgtK4=
Received: from BY5PR17CA0030.namprd17.prod.outlook.com (2603:10b6:a03:1b8::43)
 by DS7PR12MB5790.namprd12.prod.outlook.com (2603:10b6:8:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 06:51:06 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::21) by BY5PR17CA0030.outlook.office365.com
 (2603:10b6:a03:1b8::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Mon,
 12 May 2025 06:51:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 06:51:06 +0000
Received: from spgblr-titan-01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 01:51:01 -0500
From: Nikhil Dhama <nikhil.dhama@amd.com>
To: <akpm@linux-foundation.org>
CC: <bharata@amd.com>, <huang.ying.caritas@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <lkp@intel.com>,
	<mgorman@techsingularity.net>, <nikhil.dhama@amd.com>,
	<oe-lkp@lists.linux.dev>, <raghavendra.kt@amd.com>,
	<ying.huang@linux.alibaba.com>
Subject: Re: [PATCH v3] mm: pcp: increase pcp->free_count threshold to trigger free_high
Date: Mon, 12 May 2025 12:20:38 +0530
Message-ID: <20250512065038.22917-1-nikhil.dhama@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250510213019.0929c25f8c9861d7416df264@linux-foundation.org>
References: <20250510213019.0929c25f8c9861d7416df264@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|DS7PR12MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 3407b8e3-13e6-4b64-c20f-08dd91215e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jXrw2rIw2V+k+oJilwVL2T3b85+4U33gQh7IXzSIMvxFp06SM85CZdK4RMLt?=
 =?us-ascii?Q?fUU7jiDj8KtLkcWOCCxquxwbhMwt1kWfVmWjjkZaZzynekY+WYb7K9OTQr4J?=
 =?us-ascii?Q?ogixOlIFfiXeG2HHs3Wb9z3fAffSZk8vL9+cvJi2DOgxzcv/y4Kty7+BlKaB?=
 =?us-ascii?Q?piAo7XHhvvUZvIUQErxbimkEqq25KObsp4TLNtdcqShxmDhBZm2yK8Y0cmrg?=
 =?us-ascii?Q?7JF0bYqHucGuYaFx5pRvQ5UZHGEFTL0v6RNXWvJHD+92357ay03jioBodm1/?=
 =?us-ascii?Q?v2tFQIrm4fJjD23jYTi0rSLv+uguL/UzQXVtzQpRSszV4ingqyHtuNeJlYW3?=
 =?us-ascii?Q?rdAEf/aTe2jikQcXWOIVBHKp1FCG/3RW+lTtdQJnUTadvxeAcPjQbpbdH7gO?=
 =?us-ascii?Q?nRw9Vnffe0M4mvb5y1WJ0arMv+OoN3bupjRH6XcgPWPpCW1RHwa1Q/bPfyFc?=
 =?us-ascii?Q?TzZpTgVJrgpEYfjwMiEQ/2x5shnt/TaBTkGoGTE+0mSz+LWwXgnGh7AqH37j?=
 =?us-ascii?Q?1njV7xIMypfzYCE1gpEP19XkgHDhwTtf1i4hz47b4J9/2f62gUOqVd8OXbFM?=
 =?us-ascii?Q?cJ84y4chIP5p5IvbApbej5KY76C4iU3oTDuQhpGbVw9ZLCIihfrEjrl5ard5?=
 =?us-ascii?Q?WD5cLD2UBOmUgVTNbMNOlepFj5TI3RldXYPoHe5zHEpJJorxAf1fYp+1TBXQ?=
 =?us-ascii?Q?uSDBp6T5vPo0S/GIHIm/Wv6rTiZPM4looxWaNVEM3ZCV7nqUT5PjLPFdH8oJ?=
 =?us-ascii?Q?2Kx4sUFFKKb0EWMdazOtP/4Ed70HyMP0BXLR4ZxxQQPFqfbjB1Uyvsnlkc3N?=
 =?us-ascii?Q?X0NRGg8UUVI90OswXe3DOrTIa1oHqJIuEQ2uNSd7ndfoYd4qzIUl5hameUcV?=
 =?us-ascii?Q?kUPCW8yMZANDG9pJo+axuiE4R2Ig5Mm4uWv6gXIGj3RXNjS12TRx+mBMQ+UI?=
 =?us-ascii?Q?U+Tp9ismQ6T+WbN00sTdlQ4hlKDbf86ipNW1vAbImpN3Xxxh9+3xi5NTL67d?=
 =?us-ascii?Q?CUjm6aVSpf3duHVZQ6ozrC6aOP5TkY25Un7xgLVR+4agz2c1MfgwfIm6MVZB?=
 =?us-ascii?Q?Wl9phElOK55I2tRBPYCSIoAs4oeYaeeXav4SqUG6IWjsFnTSwcDhYuVhXtyQ?=
 =?us-ascii?Q?zx14d1Ndp4eLxuksydlbDSaPp2kiJvyU3+SI7+Kw7hAREYTAbe/VbU9rhC/R?=
 =?us-ascii?Q?lPN6lEX0lfrBdeEfvwcM1CsAECWaHCMDOTj8VHNsKKHXge3+VmIpVRCurvcx?=
 =?us-ascii?Q?56itnIz7Unl6CxfQGrWp6OE6JV+m7NIRol5ykVWszqAqQdUcyCY72C5AKieS?=
 =?us-ascii?Q?KQwaU7hzaGXq6RH7aiYSI49jw076BtCaUQz/ZdrPR4tAYvPYxUTyoVeMAgZl?=
 =?us-ascii?Q?Zxaq0pTDXTNEpswa1X/gPD/ht7eB/d6ePfLN+0ANDtLXLAsrsAFHth84f5yz?=
 =?us-ascii?Q?mw347YMTLD1iFMP6ceIXb6qILFKSns13N77YXNg0vMIQmkATcgkNKX9o8V6a?=
 =?us-ascii?Q?aIFp8vBB+Kmy6xfKpgvle1nRiBoV4GdylbeMhI7ZgI+K7J/XleODqdXYuw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 06:51:06.1299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3407b8e3-13e6-4b64-c20f-08dd91215e81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5790

Hi Andrew, 

On 5/11/2025 10:00 AM, Andrew Morton wrote:
> On Mon, 28 Apr 2025 10:30:47 +0530 Nikhil Dhama <nikhil.dhama@amd.com> wrote:
>
>>> Nikhil's attentions are presumably elsewhere.  Could someone (Ying or
>>> Raghavendra?) please send along altered changelog text which I can
>>> paste in there?
>>
>> Please find the updated changelog text as follows:
>
> As far as I can tell, this replacement text is identical to that of the
> orginal patch.
>

As per Ying's suggestion following changes were made to changelog:

In para 1, 

> free_factor by 1 only when we try to reduce the size of pcp list or
> flush for high order, and free_high used to trigger only
> for order > 0 and order < costly_order and pcp->free_factor > 0.

removed "or flush for high order", updating it as 

> free_factor by 1 only when we try to reduce the size of pcp list and
> free_high used to trigger only for order > 0 and order < costly_order
> and pcp->free_factor > 0. 


In para 8, added idea suggested by Ying [1] behind changing the threshold 
from "batch" to  "batch + pcp->high_min / 2". Changed it from, 

> So, in this patch, we increased the pcp->free_count threshold to 
> trigger free_high from "batch" to "batch + pcp->high_min / 2". 

to 

> So, in this patch, we increased the pcp->free_count threshold to
> trigger free_high from "batch" to "batch + pcp->high_min / 2" as
> suggested by Ying [1], In the original pcp->free_factor solution,
> free_high is triggered for contiguous freeing with size ranging from
> "batch" to "pcp->high + batch".  So, the average value is "batch +
> pcp->high / 2".  While in the pcp->free_count solution, free_high will
> be triggered for contiguous freeing with size "batch".  So, to restore
> the original behavior, we can use the threshold "batch + pcp->high_min
> / 2"
[...]
> Link: https://lore.kernel.org/all/875xjmuiup.fsf@DESKTOP-5N7EMDA/ [1]

You seem to already have updated copy in mm tree from the email where I
missed to add linux-mm.

Thanks,
Nikhil
