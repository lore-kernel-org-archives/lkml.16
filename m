Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAC31F130A;
	Tue, 22 Apr 2025 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318588; cv=fail; b=k5UZeY4xxP5skNKG5GfdhJSt10MibPakk2pn0wfRocRopYYOjILbqtRcYWAza41vhkrqs1swkoPiKFZAZgaP78PRnU8Gv4247wyMCqoLM6ZR5ILZNqP8PTYxsdTcOT5WaRCDLRsZDwoTKiai4FxJH8z9rbKMq0VgoHzckHae0zI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318588; c=relaxed/simple;
	bh=rJ4zgICpzKKWpIqtWanNJzBP6+wGQiXrARS/9xmV2wA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=P2xz2qR1eGBvKwrkidWZ2/K4f58WKJTpLS2pSRiAQ69mtqkZi1OaPTBNqRGO9c/JYoK3OGV4j5EhYXiWGSyaFLNP6/jYe1b09/f40uzDo+rRXAodzhJKnJQrnhQXwb7Vs1YyaMo9nM+VwIBu/CYFPLVsG+JyxZdbAdD1R+S9YbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q+JHyj68; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=L2llO98Z; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q+JHyj68";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="L2llO98Z"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M5remn022474;
	Tue, 22 Apr 2025 05:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=rlFwq3hEJVjgdQfz
	9WBpFAV/68FTj970KC6tPGhdP88=; b=q+JHyj68yIqXosz5D2TRrUre8Go5GBWK
	scGK4LO1lQlECTm4FHDe0MrVFfw97QpTkgcg1HfC85emcmBjbFqMc1tH19yNSzNt
	hvbiW5v0KDsV7/WKc6xUe/y4v4zLsJKAV4to3Cae3LuI98SfP0SAkh8Vt/XeLr2M
	wyaUyuv5fP6FjwB9cFaWB8LdFQfaddzU4K86RsxNgWgNaG9zhtdoVs3V9FQH5fN0
	ERaHewCtSWud01m8ex0lMFlsTjmISgC2fNdwXFNXWNOLjYQ6WjW31mCmr8y/kI5L
	wgaaqQY9gJauPptjp6RliI/VMBvxBN/cmA+5ceZMyDaGhvZWx6KfyQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46488hk9y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 05:42:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQPMOhDtgCqVlzbZKE+RjMqrI9BenCJG63/bs+k4Ub38lbl1Bb9KYCsMrN2/9ptiwremEq8XvJYwQHctI+OxLc5uwLDdkMM1rsROFYReAwCSrH5BRGIoa6ubBaecMi787+mFGrQInvD2913PqMa/rfALxtemRDir0eNv6OmYfLmpgjDJW/ae3O7KurDqxNGabvhcY3hmOk9Vp0PJGuJ2LcGLUdbcYUWFO34MLTdxwumM4utM1ItguFl8MS7jR6KC907KKfsuMJ92CkFUyh+INFkQLpwDluN1CEH6mFiR1qEyLRJuvmaI0/i/LvbTAZmDibSerkDQ3VBi60LO85zSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlFwq3hEJVjgdQfz9WBpFAV/68FTj970KC6tPGhdP88=;
 b=OooQIQxZdSzJ+1JpDmj2rQaxDhQqG8n8d046wZd/ZTwMAY9x7ZIPiwnT/WJP5Neh9Ut2aRft0XwhV7ZTiNN5o0pDqwlO/VnnpGctWWAtXsLPq5AnwK/cHkjgDAxCgBhM9aQvFjZkHrPv/8j0QHWkRF4Af1jgvxQTc1V+zQWtKxTMy4MBda537gVFFfMUWJbFzgaOW964PmEsYV+AjYunUMlWnSFLvXYYR/kBnVIkI9UdcG4AW57uc49lrczH8oBekI/gF7OhCV41boEhOeTnhOItia2RTO5b5LSVweOeH2wyd8LGZQOwSxSdrzio24/85domEOiekJVaQ2wUrHBV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlFwq3hEJVjgdQfz9WBpFAV/68FTj970KC6tPGhdP88=;
 b=L2llO98Zpl0mHFAv3fwlNPaoxJ4YAEuuBIQzkOzvebxsDZ3xQj1nSOKl8Wyq1SJFzcC+rTe20fhSgnnP9+wOxLB0mAgUJRq6CN/NjtY9dfeWOI8D8v8RRTtPoLYtYemmzCsUPAqpakWvbkawFzHMQ7HS+jHHMqfmYIyPEsn8zBw=
Received: from BN9PR03CA0196.namprd03.prod.outlook.com (2603:10b6:408:f9::21)
 by PH3PPF25E0F4278.namprd19.prod.outlook.com (2603:10b6:518:1::c0d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.43; Tue, 22 Apr
 2025 10:42:47 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::6d) by BN9PR03CA0196.outlook.office365.com
 (2603:10b6:408:f9::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 10:42:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 22 Apr 2025 10:42:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3C273406541;
	Tue, 22 Apr 2025 10:42:45 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1C266820244;
	Tue, 22 Apr 2025 10:42:45 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        sanyog.r.kale@intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/2] Fix minor issue in SoundWire slave IRQ mapping
Date: Tue, 22 Apr 2025 11:42:43 +0100
Message-Id: <20250422104245.958678-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|PH3PPF25E0F4278:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d60cb3a9-1bed-4e1f-8602-08dd818a6b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7mW+nZ4DRuemgrr5zy5uaWFfjwb8PVsOUuUjzZaMi49gOB7KxZe18y3ZRivP?=
 =?us-ascii?Q?vRNuc357ngmBIho3PzJgoWS16pG5qMqSn1oVq3qclG+SGRxonBMb/nO+j3mI?=
 =?us-ascii?Q?GcoX+IR7od4lgmZpjasm6/Sz8uhFLRFeJUpT1v9XjeymrWYnAV++WNXYg75h?=
 =?us-ascii?Q?HY7jrYz5KtQkPzQiN2TxudFdzdaZPszLGByqSR77s65CHRT5I9XXje46t6VX?=
 =?us-ascii?Q?3P/a+9g6kFaQJ8Q8V8AGy4GtJEAFMKN0SGXvSWGJ/TEelbgUXZ3IE7P6aUW2?=
 =?us-ascii?Q?gEJz55zXFGoDRhzIYkbTn5lGAEL9ZEApzNEyf9TMAXlBpNhm60B9JdVH7lUN?=
 =?us-ascii?Q?prMzMZ+/JTondkLq8Rf0ot1hNgN0TZ9BXBlPQrSGi4AkTOT5/7eZx/HFi/h0?=
 =?us-ascii?Q?u3u/ivgdBLU7W1R80UapcHMU0OHu6HuDovU/QGqrgcpdRs4i2M1SZRELaK7p?=
 =?us-ascii?Q?Rpc7/Ata6b3EAxeS0BFxLn6DhUMA/N0M0v2ZVuGLGbOz3YvpyxsKyQrRqPOZ?=
 =?us-ascii?Q?CCy2+dP2TiB4ysJO3BYJlzMaRndBwIaBSVbMe+jOFB4wXj3F0Ag01SWGwauC?=
 =?us-ascii?Q?NTyc2IjVsif9wvjKoxUOkXgUABxpALfSbLQnVvhoJbIv6nBZSbD8Iuh3D8by?=
 =?us-ascii?Q?yiVCafb1uaVNWaje9F270hh0jk81d2mWSWaMM2ri3I7wmJKk5hXKcT4qV5+r?=
 =?us-ascii?Q?xpNQF2KR4AmdHgtOgGe5uvGx11pDKqxVFtibi6bKSMLkMW8TmqIy6i8/1aTz?=
 =?us-ascii?Q?LzCB9pg7ZO9eFLIL4ugHKx0Fp8m93658IhaL26y6D3Ryy8wyXEsw0Jfq1+54?=
 =?us-ascii?Q?SR0CjbqZ+EBpw7FMW1Z1qF1NUZQj725ILps0zFrqplkUBQt+8Sozqtn/ytOZ?=
 =?us-ascii?Q?7lGQlWQgshaEoLcrbsEyT0mWcMFLct3HlNoWhXTKNHLGxFk0jIL0sFSLOBkV?=
 =?us-ascii?Q?1zKSOr1L5uMlwjkMBMUjdAH6az9LwBWrl9NhCaQ60Jj8u6oN/Xgj5XwYrYBS?=
 =?us-ascii?Q?Ob8rD3H0li+SGFSCwKY5ose4Y6T7ul0AsQRyoQGP8UUMMBuuX+hfBNhuZTsI?=
 =?us-ascii?Q?8Y7tSag56Ir5lc45DD/Dq1pfgEHiuYrr9HAJyyGz8HUt5H4ma94YsnAt8fpl?=
 =?us-ascii?Q?ct0HoDaoJEB2fXyvPE8agasoInLuBB6gIlaTf04OCKU5taY08fZ4wUzaY+Z3?=
 =?us-ascii?Q?9PJFV8yKbWtlj9zh3Vrvuo9ml8epTnMtv5S6abo1f8b+kaR0YnS9k8MyXHCg?=
 =?us-ascii?Q?2lZyE6nGOxZ3USIQ1TDHY26kRwNjntYcRohnrtVua7JMWpnwgA78hhbyvXeo?=
 =?us-ascii?Q?UI81x/mN8bc7zJPT+1u5Bb31x9GHu89ZJYlj6P3dT0nZ9oqveeHy68564Lws?=
 =?us-ascii?Q?S5NIK/dZgDWoWKhLMyLQSkJ25BnQaTtdpxoGD/vXBp1pDsaMqIxg/MSN2KdK?=
 =?us-ascii?Q?g0ZqT2Y/uxSTvxkVWxpjtLwHcZJbQ6VWAOco7YLNCq45HLm+E84yn+OZIUfw?=
 =?us-ascii?Q?qTdONNfyvUcqF4SGMZRfACPVtfYIbWJ2z56b?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 10:42:46.4263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d60cb3a9-1bed-4e1f-8602-08dd818a6b8e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF25E0F4278
X-Proofpoint-ORIG-GUID: cPVx2MEopOPsduRWF7o1OhwyVPL37rro
X-Proofpoint-GUID: cPVx2MEopOPsduRWF7o1OhwyVPL37rro
X-Authority-Analysis: v=2.4 cv=K4siHzWI c=1 sm=1 tr=0 ts=680772ac cx=c_pps a=gHjWyi4SN+6fNgZLRl0D7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=WIDGtKa8ct3_2nHDovsA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Currently there would be problems if multiple devices on the same bus
attempted to use SoundWire IRQ handling rather than the IRQ callback
mechanism. So far only cs42l43 uses this system so this hasn't caused
any problems.

Thanks,
Charles

Charles Keepax (2):
  soundwire: bus: Simplify sdw_assign_device_num()
  soundwire: bus: Add internal slave ID and use for IRQs

 drivers/soundwire/bus.c       | 37 ++++++++++++++---------------------
 drivers/soundwire/bus_type.c  | 13 ++++++++++++
 drivers/soundwire/irq.c       |  4 ++--
 include/linux/soundwire/sdw.h |  5 +++++
 4 files changed, 35 insertions(+), 24 deletions(-)

-- 
2.39.5

