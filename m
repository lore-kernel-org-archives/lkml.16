Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617FC28640E;
	Tue, 13 May 2025 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143593; cv=fail; b=W0q4VLUJXwrdiW/8ckVqExvlWpFvT68gGPxnFDRQ4Pnqp9cU0cfrKSN+bo0LPPH3dkkX2NTM7BnRJWHqmZ9QinKaFthT6XiO9Q37LIcBvzu0MRM4d3ekSpj3Zk7qjiYXNItoEiSLJcQ8iw56Eu4QNEU8leJRt3JfQHmRGznnp64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143593; c=relaxed/simple;
	bh=kcp++3wU/C4Cc9jfTZ6JUjawtSUdhHMINB2WBiE/WJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W90LNjMtQj9U4W050ZY3yMos2NzOZ3QYBJGe6ThqYg/FcUHKrwTtiGrAymW8nWIJKQdSAiD7FcpoMx20ZHPrZ0quNfiyXZCtjy9MAVP6B3AKJZY2X0S1i32iztyT+WOiRLU8pSr4HbMHkJdzIiW3NYQ42+THDUGwBH2vhVV03Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VeTrfz0o; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JfrX2sZ0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VeTrfz0o";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JfrX2sZ0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D5AHmw019831;
	Tue, 13 May 2025 08:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=zH9zbFOQRkvS8UY4
	Hq6txlwPLfpr87qzJ7fkM4+4zmQ=; b=VeTrfz0osdXp8S0FnnxLkusQUBbDx+WT
	jyai9CUkMAxq+XWSHj0KjQJQSADCavCs3B1gFUvlBav2bQkI90rLAHaJsHy/TUT4
	Hk7KKMJWJGkp9buzAy0pWh/QoOgk0QAFLQ0c92cgaDLwBopOrI5V7WuTamacsNxZ
	NLS3HjaMsFH5jiqAMuzUXJ3nIzRFIfWVLJBbc5iuDJg6PvYAPaC3nP2RU/yVj6bP
	v3Zeg78qORoj0QRsTRwoH/WeADNVsNI/munI4KuJjpwNrV6pWQeZOZAtcUhunzU5
	ZrW28HdFycXmvm9JK1dGZizXPT041SIm/2cNqwBEB0SkYiJzc0uHYA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46j37gc2d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 08:39:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uw9B6Pv+ffRp+19zt/OkZ1baFW3LWj/RqcM5Qb8SMp6bQAx3OuYCgouPv62NJLBGJnMNL+8JtQZz1IsKSeA6TQwiz8RIurEFlNmEFd2YTcNRVqVGeJ5RgTsJ1QWmVAiZfzhPF1CM/5/eHMXptTope3PMk6EIF3p7tBKVS06wvEaR/mh3/I3JVkovivrY/nBy/Y/coB4vmXR6emLTTCUAvupJ3NhGI/ZzSexXmi3qw2eQ5YjM1kj9Vixig9dZBVetHaLTDptvLu6smEWEvsV/JDKZLVXPF5MizFYggvciMYdGJFYuBWx/nrUO+YMmPkPJ75fDqq291rHy2VSfuOAyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zH9zbFOQRkvS8UY4Hq6txlwPLfpr87qzJ7fkM4+4zmQ=;
 b=FBjk542q6kVSWeTVyoGaH23UDVtcEw6EtGhrxVXGR5lqyU9xs8ijxzsNtoqAB1GXMseuoucQ0DTD0SttluTZ4rbj3G2DwhLZTDXn1ADS3fNX2VQa/U9nM18kH35dEdV27JfB6bgBTW4jdQ5VfzTnpevmLrhiwFsdYE8TPth8FJhja2VGCgaYipWqsWIeMdXj1sp7BZyU/8wJpVjhy6Q8s1bxNO/no5Dv0O2DTP27DnMJmXETQCFomKx7kfes1a/iFvxOCtVIv5YLh1eyqDeUG67eq3Xy18Y0yvS/8HLJbW/RijDR7g+fd5YJse70KgdQkqVZV6CGir3sixLlzZR8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH9zbFOQRkvS8UY4Hq6txlwPLfpr87qzJ7fkM4+4zmQ=;
 b=JfrX2sZ0d2Vzee4NA8WBj5VI3cuOQRQ/R7GZWCSEq/fIuYDGQnab2Zedtdi57xVGrICmXDBLwrHePKloioR111SVMypdyDzmcG8FlqHN4RqdiSIkAnexj/QN2xV7VkT8uDag4YaYJ4NssKwai4lmuXhNIRv3x/63VZNd3yVQeVM=
Received: from DM6PR03CA0097.namprd03.prod.outlook.com (2603:10b6:5:333::30)
 by DM4PR19MB5761.namprd19.prod.outlook.com (2603:10b6:8:60::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 13:39:32 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:333:cafe::f5) by DM6PR03CA0097.outlook.office365.com
 (2603:10b6:5:333::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Tue,
 13 May 2025 13:39:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 13 May 2025 13:39:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9D42E406545;
	Tue, 13 May 2025 13:39:29 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 62CF5820244;
	Tue, 13 May 2025 13:39:29 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 0/2] cs35l56: Log tuning unique identifiers during firmware load
Date: Tue, 13 May 2025 13:39:22 +0000
Message-ID: <cover.1747142267.git.simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|DM4PR19MB5761:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 663dc824-b534-4723-c850-08dd92239713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JfNouMDnIWiyGaIjCENqO5DwWk36tamxE6OBaerehD6sXP59127dSjkHKL8p?=
 =?us-ascii?Q?dUcMC7Uz0csFJneny9rjKJx+selGNBBpQQVJRg+uwaOoeNqvrxv5cBLnS4pD?=
 =?us-ascii?Q?SLFuEzAOz75fthY+vV5TUwMJH66k6iSwVLc+VTDUWiVaqJqQ3gOoE/C/k+rl?=
 =?us-ascii?Q?3DcYqQVY0ve1oucBTYRo84AWfSq2cMpi7YArwyiK8f/6JwvYRSpXaVbE07SU?=
 =?us-ascii?Q?X3VtD1kbSBbRxdLe9AKadqhCpWx/5pc9NYjoIGBOEhuRnYci99IDfV9kIncR?=
 =?us-ascii?Q?wl/4rgS3WMRF6DcAizukOuZgRIgMimKgDWe/OtzycwCUZa5YE/68fVusLml9?=
 =?us-ascii?Q?iDepNhbGyEZz8YDaXmJenfyTlmWnX0AqKCnUQ7LGwi8XV2bWv3E+rr5l1VnV?=
 =?us-ascii?Q?OZ+3qJU0uzI7oTVYxEIEIMYqkxhsowwE6ms4J5ju4KJkK73i7ovKFzbSxEk+?=
 =?us-ascii?Q?hrEGWRnlaTMFkAWtV4R4dQkILhYhNYCRRXv/U2QlZ90E73DIKA0lZD6naLcE?=
 =?us-ascii?Q?RscMk/Eewd3HPZDHpfpCazzz1Z1dS0wYAb7sLDG91TFh3kwFxdDtsd4c1wiZ?=
 =?us-ascii?Q?OoA3uDZwt1vM/1C5Mah2QEU6jXE2xY+SsuDkFCgZHn1ZNfUTf4dRIDUJhksj?=
 =?us-ascii?Q?U474SR6g5r5ISeT/1Lopf0tN7gf6sSlFYJBBOG13V3U9oFi9p8RHUGqNQt5j?=
 =?us-ascii?Q?c5ORo4+CnzPT8NqzjaWSpwMN6tt10JthtXjV75rowDpSMt2HPX8rz87TVs2f?=
 =?us-ascii?Q?mO+07+cKwv/k2Igf5IZOFCj1XraDW88E5d8N21KK/wuQpKvFa7buzChlKRv1?=
 =?us-ascii?Q?TTLmBxplWwNDQQojhFCqXt9wfDhPk0+UEH8dMZjaAB2AwgxH0r7ppC1bhhYA?=
 =?us-ascii?Q?Amr6P+x+g0VLUJBFRb5by4BW+kib+JxUPos6dQ/0deQEhwN52dn64bCf4qUg?=
 =?us-ascii?Q?EVcMmY9RUXxi4kpNdj015wKXlV5TSvcYvC58K7ltLZn93+LrhPD8eL3ufHPh?=
 =?us-ascii?Q?8sg1ycE4cQN5nK2nyDVR/oGDpGPzPainu2+zP1Xh2lDc7B2Bmr68bGBqGv3C?=
 =?us-ascii?Q?HfrAq+IkaOB+nfRMQ5oaJEAgsPgTTXjb9VyFwmRmVS7O4wBWRTtF440F92kd?=
 =?us-ascii?Q?ZkEafHi3esNzCS6N8a5OZ8WaZyxDTEdDKap+JX+9Kmv2i+VQF6Jxpqw0mMjQ?=
 =?us-ascii?Q?oDC9w3iJDmZLVNMwQrlbnoHbhWBVFQb8Fjy+yASDxP57hjhBRMy9lkjf1Svq?=
 =?us-ascii?Q?L0B1+w5pCmncbZWduqXcZtMejih3bvudop6Fj3x0cSADLmGQKVgC3Z4mEFmp?=
 =?us-ascii?Q?8SUAZLcsKyiL7FeaRhXBxTXickZb/awR7LxUqGtT5nsnhDWBnMWXRoRvAozX?=
 =?us-ascii?Q?tYVWqDLnR0kekqaRjmwkKp4j9X6HYyf1RkCAytmKwwhvKHD2RrD+RSF05TtR?=
 =?us-ascii?Q?jhq+SDHy93JlvR6XBAowXcilx7xbLByouZOy2iVj6p/BPCrJ/zjrKHY7hkde?=
 =?us-ascii?Q?PvRN1+AW0E4JMORwX72SDo3lZc7l5hL8VZ0W?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 13:39:30.9864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 663dc824-b534-4723-c850-08dd92239713
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5761
X-Proofpoint-GUID: LIr-436Ij0QjYjxCiHxQE2_ZUY__gnu9
X-Authority-Analysis: v=2.4 cv=BOazrEQG c=1 sm=1 tr=0 ts=68234b97 cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=_6WEyvvEMfr25UmcOQsA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: LIr-436Ij0QjYjxCiHxQE2_ZUY__gnu9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEzMCBTYWx0ZWRfX6EMNc2EjsyTN pWz0DiMnsC2MVLiMFIG1W2oQh5fIcFASTWW9X/ssClmcivNChOJwYA19LubWHkBrOL8+Kt5lYus KYm6xZkQ4rWAo2LfT41sazHTSeDbreaeQ5PBb7aLGl96AIQY+3ayiurw7HLImkbWkVai1uKWArU
 C0QJTlkyEWmrQqSJuvh9woEihO4mP99W0gMs7I+aN9ihBBjp9lzyOqf8op1SbBlPJJ/kpnVkPe0 pnVBJH8MZz6zH7HCahCyYcSATKXMfxYo4x5iXEnjJlkbbKewIF8JCUUFOUijwE8TG+KR7XShc2/ lBSTR78xiEOr+UGN4gCDcFb5ME6AfeFGt0JLpcsiwnTYeO+klJ0veWRRu/TY/IVssWeZjSFONnL
 U/LGUg8FuetQTeWpQUQ3dOmB4tm+j2LI3eBWz7R2GSNgB3uk+XREEK1DzZ2/JXQiQGW2r64U
X-Proofpoint-Spam-Reason: safe

These two patches introduce a log message when provisioning the cs35l56
family of devices that uniquely identifies the firmware tuning.

Simon Trimmer (2):
  ASoC: cs35l56: Log tuning unique identifiers during firmware load
  ALSA: hda: cs35l56: Log tuning unique identifiers during firmware load

 include/sound/cs35l56.h           |  1 +
 sound/pci/hda/cs35l56_hda.c       |  2 ++
 sound/soc/codecs/cs35l56-shared.c | 28 ++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c        |  1 +
 4 files changed, 32 insertions(+)

-- 
2.43.0

