Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA5A22DFA3;
	Tue,  8 Apr 2025 16:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744129403; cv=fail; b=sQ47TVXSPxZIduRu214asDf08G+11Svtt3Yuxk0uKJRVUGusWBsiVo5g989jIwhRBR4J9jcKRA+hEL1HMfVmWPc3jxOcAJF6hFG97kh3Jg3zQW4V3OZsW7qJA5at0BYJJWrc8Qj6OQod0Nr8jlGzehvJtt80x51NTEP/Zqtvm8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744129403; c=relaxed/simple;
	bh=f8Splco0CL3MBFcEfTyaXRsxXloLvyDGv4jOEVCWRRM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rJH88tWgVZHe5s8Gi3/YlZ5LSXSkrMZhvDfsDgSH6OqGxkRlYLBrT1wKFkr0Y8p9V2/sCjw+P6GPzrelonyBcWjeuGqvJyG9+v1ebNJUI8sH5vfXU2F7EJ64ZUDs3gGRrVSnX1uOKc2RctEcSt6Heph23hgeU2V9h/juMfwPNwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lih2apqZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=m7+Mwgq5; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lih2apqZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="m7+Mwgq5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5384tF4N031977;
	Tue, 8 Apr 2025 11:23:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=rOjAZExhRcTsk2TY
	5sVjycyQFhjzCIHthvzjBW0cGLs=; b=lih2apqZNJZnoZi6n+1JtKU7tofqNbyu
	lPrDyBC/qy9cAkC8ZH4ipdbpWfu6A1JKd4Nr1dTPL0Q/t+eJsuFLt/O1bMTSDAE6
	1eyoBG0v1YSLSk7Ejappc8tK3b6/UgnkOK5F7kc4EbiRVhfZOnpyZ/b1Jz6hN349
	RPinStcNGY0gOYYF0XlvlWveqGgYwEDauZDj+wsq5LhswOeeZjIKxeXwEWebFKwO
	AX/E/frMC9WDIoUrVwB1aK/Dh8WswQ7JuMrle0Pvekt8WpEH79Lk1bjo1MXdYbGl
	7a2n8VUcF4EVtcHP5VhmcYwYojnqfjhyVePrtutlcva9VPDkABiv4A==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45vemwjgkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 11:23:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZ8b603K/B5yqrA90kd67Y/IHXkHM1ZI2aCEdTrA1ViyRP+5Vy8TaSs2EvJgjLehKOgez27z+5LYumnQ3Vq54H7XbsGPNBwGeeKkROMDifZTEege0N7znDVfZW5i5+Q8ZstQuIhtzT4U6Hi1wzKxwb7QQr4XdS3ucgVTC+MKYzysFC/C9s2kXbxsUe4PmOUtaOE057VjyowO8bt0aN6K0HKt0RFm5SFl7V+QjYk8+OCop2qfjBf+hhs6T8ai2ksa4KzJ2PVuGg9hTQcT+2dFue6uEqgz4Tj5X4a/x0g3zHxFwhb//1wsznwAm38N3TBpC6PF0qf+Hki1u1KYg7Usmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOjAZExhRcTsk2TY5sVjycyQFhjzCIHthvzjBW0cGLs=;
 b=EHXBBOKFOoLYJ7YWrr0OvLZvC2Su9wghMRdXgnsRvwt3s/xc86fVH1+7uOj3hZwjkMXPOaGc2/nPuF7wEqeUkBvLJYzYZmKappobq206hHGSOyHAHJ+DD12aihLM/CETsyGtsAPP8I5/FPGR9QptZLU407/DeBz9at5uCqoT2EM+XEit1ThS+1H5YByW4y9kOPcQ6dwigLgs/m0zoHeo3huM4zj5CX/5pCfZJCQ/QvIGc2S/mJ3dtIFRgAHomW4TdIdqPU1liaVXVjxM4Egw0SPNvtqwzXZhWG5nVL6eq3k4JocmZTB6VxL++arUhjE3LT0NiTWtrUDSO0n2TtPzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=kernel.org smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOjAZExhRcTsk2TY5sVjycyQFhjzCIHthvzjBW0cGLs=;
 b=m7+Mwgq5pnI6vNX24gxhcowDyqYTSWF6kNiW1iwzxhTLHaMAUZP1MtCUiRYNsO+AsVSjwOAHc7blR6XUBkoNaUbADF5HyhXoma7LKoHS5wr7FEorV3I+9zdpqfYKXGjUVxoARdxaEDUjTrZCc3juVGtPkyy65tX/S3RMSm159s0=
Received: from MW4PR03CA0327.namprd03.prod.outlook.com (2603:10b6:303:dd::32)
 by SN7PR19MB6712.namprd19.prod.outlook.com (2603:10b6:806:264::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Tue, 8 Apr
 2025 16:23:14 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:dd:cafe::ba) by MW4PR03CA0327.outlook.office365.com
 (2603:10b6:303:dd::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.40 via Frontend Transport; Tue,
 8 Apr 2025 16:23:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 8 Apr 2025 16:23:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D9FED406544;
	Tue,  8 Apr 2025 16:23:10 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D56DE820259;
	Tue,  8 Apr 2025 16:23:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: Add codec driver for Cirrus Logic CS48L32 DSP
Date: Tue,  8 Apr 2025 17:23:08 +0100
Message-Id: <20250408162310.670041-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|SN7PR19MB6712:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0251744c-a270-48b9-b366-08dd76b9a8b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/S48iZeqnNJKB+AAIki7wQ7isOa0I8OBo1QxAqh9BN8z2gXJWlsfLCJUJq3P?=
 =?us-ascii?Q?8x8Vv4zW7yzRPU2clepwdUsC0Cti9ap8ES65pcJCw7WrHSbHANDbly8XLC8n?=
 =?us-ascii?Q?TAlZyhomvbkYfWogMMwZw+dVpoztYZThppmdKq2K5noHp2aNe8b6wJoSqbnE?=
 =?us-ascii?Q?JqWwcE6bMczhP6C+iEBmMBB4X6uDCMSm3Mw47mdrsiR0HGzTLa6VQg+84ebZ?=
 =?us-ascii?Q?aXIvFFLNV9t4STUHj/MVUk9dloeJYbKWxXCbPBobAMzIV7iXUWLzPLQPRXc0?=
 =?us-ascii?Q?83dWo2JCDRMvVnYvW30NPt57GnpGq7p3fndxtdcJ4H9R1Qs2Sin6UYcAodmt?=
 =?us-ascii?Q?8SO92/edJlULz7t1IQBwtiZPZJtTUe/SIudbjIOEYOpUwTVTWYpWECn5CNH6?=
 =?us-ascii?Q?ZtfwalhLe2LvTqyBEwI6emFjh8LT92wZWSzGeP7DavUi7QRxlIncjD2mOFlU?=
 =?us-ascii?Q?oWxt7jWdhSotfZIyYi4IQXtiV49x/IWxDEsah/y5AO/xtGsOnAW+IeowN5cM?=
 =?us-ascii?Q?ZbzW4FsnUzYam5D9j/lu0ElQvOaYHf/Jwobjqbzl4FAP2tLc1avX2zzw2EAn?=
 =?us-ascii?Q?7H+seLGAHB66oI9Zh4c8pIN5JfJTl7BwyxOD6c2RuiuiW+v+pfny73i/jqoD?=
 =?us-ascii?Q?gcTgH0g/w52D20QxJarxsQxe75ochQidqBE7ZaN8+TNdij4StoAfJaiZ8h94?=
 =?us-ascii?Q?zMExFfa4f2f3zWpAY/K9lMosnzJbSG6fKeYIZmTj6We8Mc9uhVbGEB5/6WeG?=
 =?us-ascii?Q?HtEqIhC2wpJIN6JLHo5UR2/cr3JJvrvV28GqoqrjzA1ehlYghehZr31K/Pfp?=
 =?us-ascii?Q?fbtj29vd4gdUtKQyLyFPujpjHu4sw3Cdd56JcVW9/ToRp/Guj5XmYT79Pjh8?=
 =?us-ascii?Q?9IGRNJNCOzNQcTgXNqVRN3tUF7V710m7kinIYWGw5nlCWANtjTiv6IN3z04l?=
 =?us-ascii?Q?dRgFMO5RibeQA3AXjHH0YkTy/lS+EHDUWCVx6jio8MtDDPc9uHUU0JXPU9p8?=
 =?us-ascii?Q?xmV5hMeHQwdRio5V6cOIGq+9t0rxZHLp2k3Z2nv/caOHTqXnTff6TzYCSmdG?=
 =?us-ascii?Q?+AMFXpdlg2SYtS56AoQv30j60VRTG0n7v6Rh6oMWiRqhuePxjzMXmQyPcYDt?=
 =?us-ascii?Q?+dtC7T4ZbvMnE+OSsyGGqIU6ySMoeSXaw7cY5x3S2XvhcBFbjkteaECk0lLu?=
 =?us-ascii?Q?rlMd5I0btYqyJLD1Vg5uTz4Tl8B7muzwhTzwoQlst/0mD048G3+dPd3kuKz+?=
 =?us-ascii?Q?lh7iMcc8BfvpzLg6X/36FpRsN9tYtxM24kpbd4+GawwRr4Iajn3TEZkxcGdv?=
 =?us-ascii?Q?42Ibsxzp0ld+p8ktmPdRlNDcjgP8tJARltEWiJnoShDNhTL5BgSGa4qF85mL?=
 =?us-ascii?Q?xhe47Zp5/Moz3scVbWCEHK5F8NMAHez8V2aClTrV/e742fK+PO1rBJWittHB?=
 =?us-ascii?Q?cxq00WKOMn9Tm/pIocN2DG0Oqn9dVUOsTpmJPLOQGzBHN7UM5HAPlTJZStya?=
 =?us-ascii?Q?6KnOIs27M62OW9M=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:23:12.4901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0251744c-a270-48b9-b366-08dd76b9a8b8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB6712
X-Proofpoint-GUID: mq1R-CDOftn1kHRyIbMho2PGu9tH070N
X-Proofpoint-ORIG-GUID: mq1R-CDOftn1kHRyIbMho2PGu9tH070N
X-Authority-Analysis: v=2.4 cv=bYprUPPB c=1 sm=1 tr=0 ts=67f54d75 cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=RWc_ulEos4gA:10
 a=RNQg0oC4RSkS1LvnLuEA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

The CS48L32 is a high-performance low-power audio DSP with analog and
PDM digital inputs and support for low-power always-on voice-trigger
functionality.

This series adds the devicetree bindings and the ASoC codec driver.

Richard Fitzgerald (2):
  ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
  ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP

 .../bindings/sound/cirrus,cs48l32.yaml        |  196 +
 MAINTAINERS                                   |    3 +
 include/dt-bindings/sound/cs48l32.h           |   20 +
 include/sound/cs48l32.h                       |   47 +
 include/sound/cs48l32_registers.h             |  530 +++
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/cs48l32-tables.c             |  540 +++
 sound/soc/codecs/cs48l32.c                    | 4073 +++++++++++++++++
 sound/soc/codecs/cs48l32.h                    |  403 ++
 10 files changed, 5824 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
 create mode 100644 include/dt-bindings/sound/cs48l32.h
 create mode 100644 include/sound/cs48l32.h
 create mode 100644 include/sound/cs48l32_registers.h
 create mode 100644 sound/soc/codecs/cs48l32-tables.c
 create mode 100644 sound/soc/codecs/cs48l32.c
 create mode 100644 sound/soc/codecs/cs48l32.h

-- 
2.39.5

