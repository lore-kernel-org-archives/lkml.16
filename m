Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920391373;
	Mon,  9 Jun 2025 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479642; cv=fail; b=QUlErRbFNwzlP2kNkrL9jXFukIZvlurQqINXmw5t/b4UFHUAUIMskbEdamP7yXIIZwmm+HuFeoXwpvs/FV8dEMt6wVz9fkR1a5peFZqp/gRihF6Y5RScUGyO9H39jbIapJltqrqZU++HoyV4m8W1x1FoMLhMkyZ1TYmqRWiqe1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479642; c=relaxed/simple;
	bh=U/3qbSykxlzQaLnjZzNM8+seljXT6+xbzBlXzJcOV4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VDJ9TnowrvGbB1yy4jNw/GGpEBOcKrBhtJiBz3NVpbc+p8aOf7cj6iIwds0XCskRz7q1YttdKo/BDBtp9SEChZdiSiHD9/u9Qz+LRXYjGGJspcoQlqu1es6QkruL82c90R6UsPUN72yV/wfHwo/sswnQgbVp+Wz0rkiWKH6RSm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fE/IMtHW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=G4qyrxce; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fE/IMtHW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="G4qyrxce"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BRjR4023174;
	Mon, 9 Jun 2025 09:33:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=F3i8dBB5i5xSdmbOrhXD4xYXSsrkeGXLDNeUrDZBp7M=; b=
	fE/IMtHWM0PvUZp222EepQde5vbGYZ3CAVTph0VmeFarlv2mdV3fmS5M+iJ4vw9h
	YuVs5hcfT7U9nBiSj9Cxf+fRdjKHbIPCuZsLTAQ9bQXF8tBbiMrsi5HMKAG+VYb0
	DJQv+T7Ej/RovF6MPiXR4GOg47/HiLR4GRAHPgeLlVo9TG/jjUL0aMHbxJPyeasj
	k8KUPkGvJ4AzQHfE9ZOcCpgTU7t/MbH5z/gflsorYr01Up7Ne7tg9JPO8jth3+gE
	XRdBu5+mBUWivE6kAv242gxM2UUFl9xoPvouGbIM5u96IUBEVJ6CJpZR4n69185u
	RapvC8ZHA3Jmzubv+SgZGQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11hn2245.outbound.protection.outlook.com [52.100.172.245])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47529v1jr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 09:33:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImBU8gWsovqgzQSbo61DTUS1mYlWqZFXYZ7dPfhxa8sfsf2sBGMxz56lj0Kcgq0+GgRC1TO0eOw2LRRqp+rM3jPu7LhL2OqimAYCv2SsoiP9aP89ZQDX4NoKkVFvt4dCO1wrAeXPvEEWkutAirllO8DTM/I+XvSVP9a0mOPCHFdI6tOV/NVid2eqaBsp/MCp7KygQjQGJb0ofa1doFcxbiobouK9kJnCFrEBNhKENnHQ7dy6cHcz6LZZJADsapzKziEOHzF3Acvy2kuA5q/aEOHEgWDmUFxkWcD+1GWTZZZVYOqg1SBGM6jMdkRCR5F7scHLgi8yxg/QDoWt56MM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3i8dBB5i5xSdmbOrhXD4xYXSsrkeGXLDNeUrDZBp7M=;
 b=Mt0XnFGOBLdnJbuxn5yTcyYucWqEnV1uhT0HzSRA/3sdUmqPKvtWhpydQycZnJxjyAzoKQ+lbe7f5d5dhUtZRgw0p7JnydeUtYwChED0Nmo7vHqOKVgmhvO1IZ1LYg4GzGjByHno8pVXP1KiMvy4V8BWMFDufsxGxuuYrArD3q2N2ZADWmDydbNLhzVIgMVfmtQlyLT2uYbtdRqt0VThzt8sb92LIhdCV3E5VIpwl4uhFo2JvrhYabsD5GOFZ+zejWVcRbsfiZEdkYS0WUpLyDo4t99V+BJwLxisb9qxQAfhF7RwKpeOZ51eryZgj+1d8exanxG0uB9xcmqzIOrRFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3i8dBB5i5xSdmbOrhXD4xYXSsrkeGXLDNeUrDZBp7M=;
 b=G4qyrxcek0eQIXZD87CQC4Jgmj6Yn7uveOuwnG5qNQbRFt+2//rtrsz8p13PS5MyNTs6My+ZTwoqhnE4BGTvA398mPO7+vzmguOOO46F9+OHzRnBtRkzcrQ213QyLH97//TBF1yjyfrS24yqgCFVFd2gBwRSy8J3hOYaOj1YcUo=
Received: from CH2PR18CA0045.namprd18.prod.outlook.com (2603:10b6:610:55::25)
 by SA3PR19MB7323.namprd19.prod.outlook.com (2603:10b6:806:307::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Mon, 9 Jun
 2025 14:33:49 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::3a) by CH2PR18CA0045.outlook.office365.com
 (2603:10b6:610:55::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Mon,
 9 Jun 2025 14:33:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 14:33:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 98F0D406542;
	Mon,  9 Jun 2025 14:33:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 778A0820258;
	Mon,  9 Jun 2025 14:33:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] MAINTAINERS: Remove Sanyog Kale as reviewer on SoundWire
Date: Mon,  9 Jun 2025 15:30:39 +0100
Message-Id: <20250609143041.495049-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609143041.495049-1-ckeepax@opensource.cirrus.com>
References: <20250609143041.495049-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|SA3PR19MB7323:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9007bded-4d84-4bc8-a9c6-08dda762a58e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|34020700016|376014|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gCBfzdsPKBVFggbWqzO+v9/zqLd6JDQJ4j6cGew1j8y9T3Yy73IAfA1z9E+a?=
 =?us-ascii?Q?FTbED6l7W++zOF4zxzkS2K/v+GDj+AydbZlVIDJ91IOSKmJAx5SGAYZ1vwaX?=
 =?us-ascii?Q?n0VbhfAjYli/0ainkNap1GgnP5OQ/uPyoPoWFqAMZokYj2F9N6rH/POxEEH7?=
 =?us-ascii?Q?CxcO1Xf/TDPtjRYPJTEldmDQf2aLjL9SoSY592zw0f4KaEMa7OpccHQglQc3?=
 =?us-ascii?Q?OgM5d2tfpDZ6AHUq4dAGo1K8HybdlyuiIkCBnnWtVNpZ5iQtriuHdhlJMg27?=
 =?us-ascii?Q?3K19lNqb8jX4Dl1TxyShv8OBxJehd8e8AvoDumdgihsFit2L0DV8ieIM6dpB?=
 =?us-ascii?Q?0KWDp5lYbfArj+Mh3Om7I2cIHKYq6z5CQ7Wf1w6aBoVW6qxe1qfD4Mzw0t59?=
 =?us-ascii?Q?Bu+FSus+JrfkD4/Z+pARRExppipl7/fo2WhL5RPU9g3Kr40s8Mc0XKBIQa1g?=
 =?us-ascii?Q?G9Ex/Ex6M+y4njH1Dwm2n+72il8BE2wyyJadTEnD784LLQmnMTaf9GEc1hKd?=
 =?us-ascii?Q?1L+1xstQgcdZcTCf2P5/MYpdGzUbe2n3yzjIUmCn6Ihmr2u1GxboAGZ0DgX7?=
 =?us-ascii?Q?eYnTgQQ5a6SDcNIdjghBJZWkfsqyp8z0Z1YIVgWCOL1N6A11UTviY5U6NDRR?=
 =?us-ascii?Q?+RYY0MwLoGEdd+84iLgSR1wKAesFt5ZSYLrgl7M30yD3vvsYMzWGnqEvW3CL?=
 =?us-ascii?Q?Q09fNDBQEd4GJxJrLAHe9GUm/J1spQV4k7TJEwTLlJsDAG2NeE7Rmxu5WCth?=
 =?us-ascii?Q?nm9VFFN0y66wQoIg3nfcJxjZx6Bo0m1lDhflUIeIT/0wNZbPEyTG0UX+FSJk?=
 =?us-ascii?Q?E20eaayXs1VjpQYMdZ+bszjG0ln+6rGMM4MnI5uyh6gzKxppG/Sp3Vtc/YHr?=
 =?us-ascii?Q?EMv/1zPIa0sAk3ulyTjGKqnY7zHcng8dSPLhNvpztQsYIU3nP8DHL6ghGzAJ?=
 =?us-ascii?Q?aXhacq8bC6WcH3ZtQo7PxbmJNatqZ0i/aDb4JgPeKZAQ7v9sknSTKhCoHow9?=
 =?us-ascii?Q?JoIdNwtC/zzn7EyfaMgEtNgUP4tne863xg98Lxl/JkI8lG7qRim01gYRTZsx?=
 =?us-ascii?Q?vPiZ1ebTQ8FibAI51JE2V1SZ1sUa5sLp4GqyLar3ea+o5I2TmT2BepnON6Q4?=
 =?us-ascii?Q?/fsrHXGWMNp/NIh3sL0/XYwp6w9W97OTECZnv8QJW1dvgbYpld95uXapwsKH?=
 =?us-ascii?Q?IMPeBcZKM3xyngHXMfcq3C5yAqOYEE6qLYa8Ye4LLpX1nZ6QQP/0aOevH/N5?=
 =?us-ascii?Q?x92xwBn/NWbDKamsVoUH+rBmLDx38K4Thh5L5O85hvKZri5t54LArz9KH+6b?=
 =?us-ascii?Q?eU0qCtdi6hRPCQXXUIDctWsjaaOVFrjUT1+sHpsXw9/zogWc8N7fkhruopI6?=
 =?us-ascii?Q?MGUr3emuNUUarru2/sY39vceS5i6bDUt4U+pmOIs07x9aR1D62XbbVlBXqXP?=
 =?us-ascii?Q?cr4npSqj0xPMrmU/Ru7okZTZJe4QnGSbaHj4znUQxAIKXHJZ5yWfSugwA9j7?=
 =?us-ascii?Q?1LucNg9QVl4mQsSJL7VWJk1bu6lGfp6Guuje?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(34020700016)(376014)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:33:47.9909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9007bded-4d84-4bc8-a9c6-08dda762a58e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7323
X-Authority-Analysis: v=2.4 cv=Jfq8rVKV c=1 sm=1 tr=0 ts=6846f0d1 cx=c_pps a=eOh0UBsq4qXvgX0MRtdEHQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=roNgSHOvEWAi8kLRm64A:9 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNiBTYWx0ZWRfXyzXRlDYE7XEx 50D+KIYIFWRg7fHESkzxdx/IE/Z66CrW1TwZYHWxrnyLUS80ZyKdpU4ccu3B4rxtz2coljSlsOi DPfAF3ko6wUo3PPYGwg+mBKXup+hWgBQ/BoikjZWNg+k5W2MiBgsxhcAuVAN8G/fVYStX9svQzC
 mWeLq/JC3m1NqP/EJiyzMabnU1F1ug0iJFhpZMtrr4qE1ZuLcaX7F9t7kciSqiu24TotpyaEMp7 /kZ+xAvp+Vty42xult3hydBuTW6CZTUrjAHJlFkpgpeulkl/Jp3dV4N1ISZ9xIDqeliZTAV8zFe r8gsuiqfpTfYgcifTwQcXPZFynaCUs8XFgsvaHcfyH9/0FABM3w5EdJ/ZRJYj9P31tXcB+pWIpE
 frnfSl30zo+Vy/B3SuUhNp9ZPG79iTpHHNTAS5n/yWeEH+dJaJSAVkEAS57tg/cuWbp5kvlk
X-Proofpoint-ORIG-GUID: aGexDh0siD6XvAY1V_h7iPlj8cT4lsbE
X-Proofpoint-GUID: aGexDh0siD6XvAY1V_h7iPlj8cT4lsbE
X-Proofpoint-Spam-Reason: safe

The given email address for Sanyog is no longer valid and bounces, so
remove as a reviewer for now and he can add back with a new email if
needed.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..93511f54492dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23279,7 +23279,6 @@ SOUNDWIRE SUBSYSTEM
 M:	Vinod Koul <vkoul@kernel.org>
 M:	Bard Liao <yung-chuan.liao@linux.intel.com>
 R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
-R:	Sanyog Kale <sanyog.r.kale@intel.com>
 L:	linux-sound@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git
-- 
2.39.5

