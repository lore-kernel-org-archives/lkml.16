Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023085.outbound.protection.outlook.com [52.101.127.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4663139D;
	Tue, 13 May 2025 02:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101817; cv=fail; b=S+aOGg1gVW/oilAqb9v0lplLiSrcVJlKaAjgrwnbn10E6xw50wkXP+be/rqDFIpluTYkcqHQBDdmCSDeidnljfQrdgIG7wZULR/W9dGEF/dGOHpYpGJdAtp2rG9joJFvsoNbcNauMeba6mmGw5kKZywXnAWUyq4tjl9Mh5wTGz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101817; c=relaxed/simple;
	bh=ookEEVVPxGGz0GzooZW2aGyy3lAFuIRmAd5/0JUZw9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rh10NBJl/4GXK02L9wyhO591i2a0yRWrw4eCp+lG6yvSn47fNVfZdchr2YxdtXdWWnmcDRW2YCji2XVBDe2b2Ko5slQ9ZF3jck+6OpiHKG4dbliSDOIeTQFjsrpFw0R15j6c8vckT+IagfZ11JaZ4HbvDuTjnHVQIwGxKOpbJNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeb1BcP4bvXzi9EcneO0SSqpoh7MPTUdH7tIJjrtFrXsOzvJLZJigaEzjima/3y156YLe48IdTM3AiFVf09xppC3VfJmowGv/F6nqS5geRUkBu/aIkYs3EZT1UIBLXmB8XmdJr1vqjQoSpyF2XVqIfy4EqnP7tafJgmUBGsblSJ/TUyKbWZViYKgMUVAsXEI7JgcnXt97oY8BY9eLllJJCPQeX596zz5NQ6Hgg9AcxNznMSsaYmpK3u0S1uALd56+OOZbvJEbPzbmqg5ieJ/5UOaZxtOtl6EB8Dmq2zJhRIUo+HePefntcpqq+TYPNx01KM/1ASH4mTIGpC+WKwgRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVpSZdDFsCHY8ZMtKH5F1+nDRJuSrIJos7FNpfoAwZg=;
 b=GSle4UwcyLrmfLoxoNQLd6kCNet4CF7JczwwJ0zB5YYIWHyAanu1B70fpw7sfloZ8NqzyHnSyN3ZIq7ofiMCSeqLUMY2tMBRZLPfghedz/8Mtx9vZcliRSBP67UFnNYfWsDY7cn5xkM99c1GfQVe8NgiReZV8Al0bg0Z5x1O7NN7f8zDxaOfdU8HGYH6R5HLATuesAqih9JntaUDznag/2xSBgguLDPt6xJitN0mesALweTEOwfjPK0IWteniEncMvFdGY+1nr7dzVR/ckPFAgf34qroamQH6TsZNAykWFRzRhQ92LVNultjqdU8jof3KFC8BRnMiHunQc0/b6c5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0032.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:29d::10)
 by PUZPR06MB6068.apcprd06.prod.outlook.com (2603:1096:301:112::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 02:03:28 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:400:29d:cafe::a3) by TYCP286CA0032.outlook.office365.com
 (2603:1096:400:29d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 02:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 02:03:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 392CE41604E5;
	Tue, 13 May 2025 10:03:27 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v8 1/9] dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
Date: Tue, 13 May 2025 10:03:19 +0800
Message-Id: <20250513020327.414017-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513020327.414017-1-peter.chen@cixtech.com>
References: <20250513020327.414017-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|PUZPR06MB6068:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4a0ad82f-72ef-4cf4-9a6b-08dd91c25a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A0RPJorlD5fX+JdwNRrqdUB9htyOwiWSWN4LquSgKdsoViKSWdluH76B+be/?=
 =?us-ascii?Q?QeQt6ohuJ08CMZUu/MVQSzB62ZsdD5Xl717nCJctkYhA5fuXk9L7pigQ5HjD?=
 =?us-ascii?Q?7HkKH42hO8wdKNp9hC5TuIpXI3pOcEOhn4R2qmrIFhxZh42wNd4cZiVXfI7T?=
 =?us-ascii?Q?BVGJS7ykDoseTnj3dP+Ld7wG/W4sGhsD5BB/WkBh+QM4HJACJ+pkmqnH+lpO?=
 =?us-ascii?Q?1VZqDsYhB3HGR2xZ1L8DknWwKVarA41W1/fKzFI5MwTA1owj2KGPjwCHVKlJ?=
 =?us-ascii?Q?laagdPWLMnjjNNi451ri+Pcbs2X7ZAxlmythyEMQoHXIqBmfnAkg6+A41XSi?=
 =?us-ascii?Q?4I4SMZUytdjM20psc1FrIcBeL5bTHPuJ99v2js2bBT1iDddEPwo9UIUJqp3/?=
 =?us-ascii?Q?G9+2URyZFko3ppy3KCal5Pr8vbOs2o7m0FqVU95MKbFlAoyNLUPB7RZoEC9o?=
 =?us-ascii?Q?LEq+937YTJ8752+yppIrQeKD0XFlBsetnRf7SrKNbMAtSkBGUz1ISkGYKsHy?=
 =?us-ascii?Q?BRRNlFuCF/0t7LSRj/Fj1k2Ao0hhedT2M2Txh6B8qarmb6WgjfOvVsYB3Gr8?=
 =?us-ascii?Q?Gr+01ZSHRcV794gCcykXCaJbrEJwMY3SJ5NGbw2Hv671vxohjcyqddWIk3G1?=
 =?us-ascii?Q?VNO+OVNjDsTDuNuu3v6bF3WQ5Ox6IQgJTefyhdLE3X5bTrMnwa3Toi0Vj2dz?=
 =?us-ascii?Q?RbnstcbD5CD7fwt4GCPG1fEx+lqwhlK95b/G8jsFvemgBUQzcLPtE2oyujYh?=
 =?us-ascii?Q?nSI80/g0oQZsWsQ34jF11qZSHFzap8Gja3CqcqTfSNwsLJzBK/TUUAbbejJH?=
 =?us-ascii?Q?2MCUPMuFQQzwS5tdyYI/dVd+VRs+936LMVrb5sbzrZmaYS8Uw1QjT0xT0n+Z?=
 =?us-ascii?Q?mwEHoFl3VC62ChdlAHMlpTHVo/CivQnwW40vy8SqX39qoBdy9+ZIPYtNkfxL?=
 =?us-ascii?Q?+ID98quMpE0FXKQKi/UBBCFzk5WiqtmTDH1K8EQtVSDxOwiNlfegSqoxyFRo?=
 =?us-ascii?Q?etGHWdBWRsPZnnGAwhyDAXVnthvjnH42MmBucxoceE6dLRMyWmI1bcyotd/8?=
 =?us-ascii?Q?ojyvLv+/lHR6wuSpYD5dq/u8/L9QUYosNHEGl4lOpD/JFIZmYTpe70EIBpAz?=
 =?us-ascii?Q?vETBuv6KIWwGPnsUCl2v8tY+zEzRJQTmpD2bmhGcumDe7U1UtkQNQKYhOihZ?=
 =?us-ascii?Q?Eq1yWJIFSaJwutRk5iEM2+F/pTAGg1gsGSJCtIT86OI5JBJKY2O/zgvJqxzW?=
 =?us-ascii?Q?awC1cMTZZccpxheP1RQkuclOHZ5fRz2oBvW0RaofR++3rwybgHg2KAinzna+?=
 =?us-ascii?Q?pFGfQShbUiVOnK1ZMcwF0dvyUdr6MbbOj0e7vjTZ88A7wP+47cQx9o0Ujj6b?=
 =?us-ascii?Q?oj7H77gJdFEs6d64kVvmXv/wwaymLhiyCcesDpN6swif3PPwbkLitVn7uQMy?=
 =?us-ascii?Q?PDmSl7YapQKwxfAFfbmMahbwukJdInh5FjFCgSTQARvBo3vilQ0sZg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:03:28.0143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0ad82f-72ef-4cf4-9a6b-08dd91c25a5c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6068

CIX Technology Group Co., Ltd. is a high performance Arm SoC design
company. Link: https://www.cixtech.com/.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..661c8c0d76b6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -304,6 +304,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^cix,.*":
+    description: CIX Technology Group Co., Ltd.
   "^clockwork,.*":
     description: Clockwork Tech LLC
   "^cloos,.*":
-- 
2.25.1

