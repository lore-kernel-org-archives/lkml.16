Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69D62EE611;
	Wed, 18 Jun 2025 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750258587; cv=fail; b=SNuuGtXd9u3oBV9hgPzJqrMGQe5xGo0oY7vivqkmGy+mg8MECuVMiWkdU5wXxHr5qtGsUvTOi6mIzDfP8nrsf2MSy1d3OaPFtOQwYqwJ4DLd2ccfVuAuGwzFw8U1gA7gQl5+kva5uyv3/sw62fbp5ycOyrC1wDzuhNFwHyAhHNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750258587; c=relaxed/simple;
	bh=A6vu8l+FD0+ahfHOVY3ijwtN6EP5CZSMEaRf0v+ynhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Uia4htnuRzcI1FBrw5xQTAK39mKjOtKGRG81gPJICuwxNcvZUbIYI1fVyD14e+SdwdbkdcylkOvd+uGAxY0nXiQGdTSoWlUJbuWedn4OJqkN/vfgr1sf+I3caY1Z7coCk7jmTnmE0fFc3HJpj/gdZPNdAAcXVvfdjt7vqd2hky0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ddA9mcHo; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MYI7PJLj; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ddA9mcHo";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MYI7PJLj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IECsxn011624;
	Wed, 18 Jun 2025 09:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=3Ga3EUus+iRYsf77
	KzR1y8bLKsAmscNXy6WrLTaxuKU=; b=ddA9mcHoWI20h/FMTfMJn9b5RyvLQRGV
	rWOFyRRVAq4ue2yFi9IACe35zCiKKNk/SWLlaWRhxeX6tgaxS+jZbLjnY5bTihox
	w7N5xOcetmqIhQIvyQMRknuC4E70iMnxKooLFNsLjSgjY26NXyKza5PhN9KiHgsy
	e9itQ/BJyg0RAQ8PjT9c3et4zPGJ/O2SZ53qkTgtnuH8M56zlw4Xft8ZdWXDCR1u
	bDuYp1x7G/+CbcibPyStuRlB95oP53aVvP4YGeOe7RU3nKKkoKt4gBebgxOIL/Aj
	/if8/lSOMQiPjDIxYLLUqqWbMIq2GJyNJMgioBEZN/N6xyarCF5xWQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2111.outbound.protection.outlook.com [40.107.92.111])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4795ghdxqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 09:56:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edMpe2rTzbqW+7IqX+ANwYZ5c6VdZcF9MG6zoU0jhJUml8bq2rZ1GnQkewDz+U8UumQq6tcP46YkvBhGaIsyFZaujwpudOjlIyPqYm5u660ZSBN/RWTVCbRTWkOHhX4EX9tGIxEbTBcxWzoollVJSPq/qTbzBXU99y5FbasT1dV80354nHrMfpFdpPVU4npayMVk+7WNkbDC13H8bFmFm/CChXRBd7xal8k/nMQRHv2TXq6LqsOr2I3FcEALgyNZz1BmRB0RqigplxK7qrvIqLtSS7mfd4clmjfZO5ycDBpLKWdr3jYCCnUu5m7LePDqC3qVeWU29od+04xq4orD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ga3EUus+iRYsf77KzR1y8bLKsAmscNXy6WrLTaxuKU=;
 b=oPDgM0Apg0jJfYX+ULrOCRWoy6Q+r/cY0Mb3UdL7CHl+UtxneYFh8mtTn0BeyySyRrta4qdgvtLrMRvqlnYtB3LW4p6IU2cWV1IOSy0aVzasA7HikLIcF7eHgv5lvyfninY4qRwastjX9pHHhhmDaXWdj6ieEHUytL/vOtN0HpaDtWITjETesSVUpePdY6nZetzZiWvrxj0ZKrbdy9EORWtzbvat3GKrrSZ1Nsj2gmLsuKFfTyoLTZxDJfyq7rP/NrSm8Zm8h8ISW2ie+qpXGIgjd5P3TzFKRdk2onZgZQnLfB5jX+nz0KNbEwIN0/ZPSBpqUT26XqYdZfBpk5B8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ga3EUus+iRYsf77KzR1y8bLKsAmscNXy6WrLTaxuKU=;
 b=MYI7PJLjBrmvn3vl7HKGMzsN1MmsBsCEtyG8yeNDhsHut+t60bnfQvkxucjgUBBQ8EpKtvBxu9BT8JJ+Uemahn5PELwPAFPSVb5fuHiuIrnq8E59SSdTCeo3l4roHL396uYRe9d9EBvfDkYUp1k96i/bu5xd4qn1dx/WI40TCNQ=
Received: from SJ0PR05CA0089.namprd05.prod.outlook.com (2603:10b6:a03:332::34)
 by BLAPR19MB4625.namprd19.prod.outlook.com (2603:10b6:208:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.17; Wed, 18 Jun
 2025 14:56:04 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::46) by SJ0PR05CA0089.outlook.office365.com
 (2603:10b6:a03:332::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Wed,
 18 Jun 2025 14:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Wed, 18 Jun 2025 14:56:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C3692406540;
	Wed, 18 Jun 2025 14:56:01 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A79F6820249;
	Wed, 18 Jun 2025 14:56:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: doc: cs35l56: Add CS35L63 to the list of supported devices
Date: Wed, 18 Jun 2025 15:55:47 +0100
Message-ID: <20250618145547.152814-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|BLAPR19MB4625:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: afeda155-847f-4b50-e86a-08ddae783f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MEbvYpnQWQ5EmWMq5M850aqskXiZidOx/V9RtbR1zGwLnrPpjlHsHhARE+Rp?=
 =?us-ascii?Q?rE5uK7ruFB8swbHiqkZSLi+FLMlJV0JB3bCifyX54oP+ms/KCb8KPlUYE0b7?=
 =?us-ascii?Q?THNt4Fb6lF9JIhEytUH4+v7HajOFmsF5plO9+38vvmMTINqws9ON8vvPMYaU?=
 =?us-ascii?Q?pbwSjL088zjPANqkXMsB5bGwJ4SMJlLZSTeZdNdfYT1mF6zTZvB7y/l7O0Fb?=
 =?us-ascii?Q?4BYFEj81HcDaA7xeHQm7YsRhO9Gicv/7OzFvHGFp3nCisuVubXq6P5vtfkp4?=
 =?us-ascii?Q?8psVmfGP2f+AQoTXfFtrc9v7wv02J1fv+AMhWmjhpGPUGSi3JDd8IzwnV/Xk?=
 =?us-ascii?Q?1L3Q498GZnA3I49ZGni1ZTNuvuHp0DjScD+j/exzZHjuc9To89peVC3MmKgP?=
 =?us-ascii?Q?sVT9pOZzyun35DjjEquKIggQjen61N3zokJ0/zlGCsEna0Dy/IAGzNjHkkm6?=
 =?us-ascii?Q?QCd8xb451NGLbGNsNJwoNQFJ4HFSbU5vVLZjvBiYT59+/llubolh/qlLO0X7?=
 =?us-ascii?Q?6+s+XQl2teZkfsO0nuIZT2KJ+/I3UOx+lVCAxMjm6qbyWliql43CMTU8fqJg?=
 =?us-ascii?Q?qnJO+RPZmDypeKOE0h7C8lacpbFMBpilEwnnHh76dEGWWI8QGeo6gV6btShl?=
 =?us-ascii?Q?W32rj0tmXdfg8dHrtK5UuSdcbUOo1CNhEqTBDTEQie/7PSE/92b7UxTEbZu0?=
 =?us-ascii?Q?5tI62n6glPaZmV5IKVRqoBs5c3ZmdYH0rE+40wbauyYx2HPfcIEpBVeN/PMM?=
 =?us-ascii?Q?bXfsgAFnfV1NSVkPFHp8s00y8z8ea9iB8H+5du6uyV7o9DLtmgzCNQahByNn?=
 =?us-ascii?Q?V9ygFZCsD9HUSlFyj/qPVu+PRGwWpIEIXfBDkuq3Ga3s8mGPn/uGHvsBLXWn?=
 =?us-ascii?Q?CEKMNg7T4kv1/P8p+mC1cWl45eFXCu4A6ItuBLLIVJyofPab1yNB3k51B7WC?=
 =?us-ascii?Q?dwxnnj0FDWdZU3K1IugeyLHHdsEvLyqXO0NxnRoW9ONIjeKeeEDwSAygJIt4?=
 =?us-ascii?Q?If/uuz4sc3o5+Uq9Ydw/bJuWRZz/J+MGTr8LkFFs+K1eVXEXbg4WkLFXuGSB?=
 =?us-ascii?Q?iJuvf5WaFFOS6rowzIZm/NZcN7caXcUe/fw5wceUls3hHxFf7xifopcT2gkm?=
 =?us-ascii?Q?EGnrnTCeFMbLOCL0GodtTyAzEZKXH0RIaFvh/O+vPQRr7oRtazFRJ9HFE6B/?=
 =?us-ascii?Q?wTf1kArWLe2a54dADrm9iY5CUPfqHLpR1E7i7q/J5lHxMuPqXGNqSh5NVAPO?=
 =?us-ascii?Q?R38CMHc3WbuErV+5s80wMYKgzfIFrnc8K36+ce5/+Hz4Xmxu3+oirIs8nBX1?=
 =?us-ascii?Q?wyDMV4KKFMHjVBTBGF995FzmQ5DQxoIBrTc2ttOR5qG9mywkVjgD551t4byp?=
 =?us-ascii?Q?TEnzn7tES5HtdhwW65plwRpFQQlxVBUCVi45dJ2MBhvg0RHHzqbX6mTeEHgw?=
 =?us-ascii?Q?b/H2gUoPpOnLjNc1ByrTXukFxtt7nd+kwYf5WFzBJkP0MKwtv0a+z8M9BBXr?=
 =?us-ascii?Q?bV0GLcS/oZPzJftSpF/kVNDp3sJemc9A4QSm?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:56:03.3385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afeda155-847f-4b50-e86a-08ddae783f33
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4625
X-Proofpoint-ORIG-GUID: RYxQvvCU9AoaCKnlrhBJLbXzjvDbu-05
X-Authority-Analysis: v=2.4 cv=GrpC+l1C c=1 sm=1 tr=0 ts=6852d388 cx=c_pps a=mNDmJ1XC7hJeB1Yk8AIX0A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=ktgszqqLJyUA9TfOJH4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEyNSBTYWx0ZWRfX4wrCXQMHp8Y3 Dn2O6G84n0mJCHp0CFcKO4rgYKAaN/4BiAJDrwt1nvFD7e+cgrqt085ja1JdRDkkuAHRLhuIsaW AIrHxcKmdInbWusQEQm6bm4UJhU0NN9zi1cKiEdyaMgOQlhRJUpwueerut9zEr3BHwpJBSoS9ao
 JqlV9D5yfsJ3xRJupso6ZKSZJgwU0W//uoI7x3Apw4xuRotFPKMGZU4ZLhfNcjnK663zj39TedT eQS1XUaXJ6scs9ut7wW1AZNDNoMoGKuxoz25EUz5YM9SpvwLB0BIa0jqIfVEf83GlV/KOWksOBP x2hHbDJzYA85tAmVoTieAGHrXdQ/Go3U6RVTVhJrvgZdkwYWRsApc2ZSUzVVncvdjhfM96HULQj
 huQfTa3e+CVV0wOYlv5+JRZSVWs5pm4wprJQ9oMb58CypEFMrddCIP0jig7PBWV6fLQRDt9C
X-Proofpoint-GUID: RYxQvvCU9AoaCKnlrhBJLbXzjvDbu-05
X-Proofpoint-Spam-Reason: safe

Add CS35L63 to the list of parts supported by the cs35l56 driver and
mention the CS35L63 where the text refers to the supported part numbers.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 Documentation/sound/codecs/cs35l56.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/sound/codecs/cs35l56.rst b/Documentation/sound/codecs/cs35l56.rst
index 7db9f93d9be5..57d1964453e1 100644
--- a/Documentation/sound/codecs/cs35l56.rst
+++ b/Documentation/sound/codecs/cs35l56.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0-only
 
-=====================================================================
-Audio drivers for Cirrus Logic CS35L54/56/57 Boosted Smart Amplifiers
-=====================================================================
+========================================================================
+Audio drivers for Cirrus Logic CS35L54/56/57/63 Boosted Smart Amplifiers
+========================================================================
 :Copyright: 2025 Cirrus Logic, Inc. and
                  Cirrus Logic International Semiconductor Ltd.
 
@@ -13,11 +13,11 @@ Summary
 
 The high-level summary of this document is:
 
-**If you have a laptop that uses CS35L54/56/57 amplifiers but audio is not
+**If you have a laptop that uses CS35L54/56/57/63 amplifiers but audio is not
 working, DO NOT ATTEMPT TO USE FIRMWARE AND SETTINGS FROM ANOTHER LAPTOP,
 EVEN IF THAT LAPTOP SEEMS SIMILAR.**
 
-The CS35L54/56/57 amplifiers must be correctly configured for the power
+The CS35L54/56/57/63 amplifiers must be correctly configured for the power
 supply voltage, speaker impedance, maximum speaker voltage/current, and
 other external hardware connections.
 
@@ -34,6 +34,7 @@ The cs35l56 drivers support:
 * CS35L54
 * CS35L56
 * CS35L57
+* CS35L63
 
 There are two drivers in the kernel
 
-- 
2.43.0

