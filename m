Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D111519B4;
	Wed, 16 Apr 2025 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809410; cv=fail; b=bvzeQ+nDW7DT9jUaZsMFTC28gm/vjTQIFmy/vpfuV7Uly6nG0GWTkSAyf28Zy4+tB9mUOyNVFQyaiochwTeAVjBBliHeucTBuEFxTnS9wREdEXgtdjNB5FWsCI9Iq8+qKfgduaCVnrXbSa8GAbyNz6aHyjn+IJJFdrxrzhNmiXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809410; c=relaxed/simple;
	bh=XNOpNvbIhnjy34dBk9oQLwhpLuHPqDSX/Rv2GONAfb8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XjOEU2D86eQ5FS5vRE5EyC4iO21MRFJ9idW0WxpSHt+P3aPKdkjY8pYsQUhx8X6HCM3o0QCZ/VqEUFS5A3DectLybgo9Hz2bNQzQjAq7ReRaKLVdd6KB6aHB1Ve3yDsf3KSpoEaCyBROCpVig9kJv9vK7OCArk0wM976r/q4bg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FwPxg1r5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fnd5T8V0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FwPxg1r5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fnd5T8V0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GAUueM001378;
	Wed, 16 Apr 2025 08:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ZSF/lK7lojZ0u2Ws
	NRUjptgnRGmmPrOcPwsE/0Sg0Xo=; b=FwPxg1r5ob6OuEqHcSYZh+se3JGs6gHG
	4wcRHuigYuLqOeF0QgmJjDehqIA4xDVOmfqYW3cCzNW2JX0aC6tfcaOMnHUNGSTP
	8aJC8SuMRJfkOX7XsCtHLz5vILE6INm689rmrwwdG7YeGNsLzkXM727MOx0aDmKZ
	mhb7oDONUlCCacJoN7kawF/ftMkOHu4aeDXxmx5688rIbGKcqC766XPKKzdLLa/U
	nkp5MxiV8NCT3iM/KZrlkBUAFBasBgbXhVACEza1CqrJF3u6o7MmGYce3bbFW6A+
	7xmxl5/w0EHb9Q92qcjKwQ+QHT1LxofWUJDEuyHcTho1VRuO82ilGg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45ymkgw6hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 08:16:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNSCcTMwVNxRaX5KR88dUS8Wj764YFoGCGzEV7XLrD4euzx9M82GUOQKwN82QgMppEYOZO4ECxvdn1p8tx8EjzccJ1aSB9Dvs7S8uKXL0UrOkepSAYWfWFz79nhJIKfJ/pJiPWkUYZcyr8SnUQpPCahoe1mN3S4LiVReKcifFOcJgOwTjor4Q/ZKVfvJSfIvU14caZ99e73icBDV7ouI3OMwQosbjCC90tUvqaMRK4NsE+H06EBjtoAGXh4Cw0z+yLOzZ7V6749YpuU1BpNKi1wkkHidD3IEW9YSnwDEXPhK/vgrcgVMgCZ8OtVvqqlrhaLSJINxK6KLbo+yUSIB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSF/lK7lojZ0u2WsNRUjptgnRGmmPrOcPwsE/0Sg0Xo=;
 b=FSkS9ebsSxe2haQWDQevVmbYSQ4B6e0Sl9mH6mgGkwIf1bGrk5e87ZOO/aJe77syGN/T4968VeblPpDjKNTQTwAjYxMlMoMIUgprnQQWqGxRYueNDZWKQCfWpFDeArjpqpSPhEfPs0ChroE9hJ8TPQrZK5clJSF1Hwd0ZKzVB0s/jED+GmZGIuaRTUNFj8rTfcetBuc7tniQLR1HeeDnNmhVgtUizrhonvMh37VavsnrhbRpA5OzNtC7xmxSnYwh1kxKqOtYAM1mFsN2WMlFqy4Upsi2Mzbz6Ozn8tDM86BOMy/pzM5Ovud9Z2WVwAnOVYutOXIDMZ9Jjm9oCpka9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSF/lK7lojZ0u2WsNRUjptgnRGmmPrOcPwsE/0Sg0Xo=;
 b=fnd5T8V0cjvRQweSX/ktPSrn4Emywf8jLmt5BXcH74cLiDgwDZ6+n8WnGp+tIULUuEWG3c5AByUxz01hpt45dQDmoiXP+bhDxNPqxgddqch2ODNPkHoIRHj4AAkBXZOT7tZLKQZABb+D04yZJGj0bhN9jAAQmUQbdKR+ztZPkDw=
Received: from BN9PR03CA0607.namprd03.prod.outlook.com (2603:10b6:408:106::12)
 by SA1PR19MB8114.namprd19.prod.outlook.com (2603:10b6:806:373::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 13:16:36 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::85) by BN9PR03CA0607.outlook.office365.com
 (2603:10b6:408:106::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 16 Apr 2025 13:16:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 16 Apr 2025 13:16:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4AC82406541;
	Wed, 16 Apr 2025 13:16:33 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 357A2822563;
	Wed, 16 Apr 2025 13:16:33 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Remove unused struct list_head from cs_dsp_coeff_ctl
Date: Wed, 16 Apr 2025 14:16:33 +0100
Message-Id: <20250416131633.840837-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|SA1PR19MB8114:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 12d88bb9-b02f-46f4-b4d8-08dd7ce8e952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ggM7nzrGy9KObx+hvNdghCOPC5kJTWO6K3792SRgOmR96G4E4e8KEFFx6e6M?=
 =?us-ascii?Q?Z19jIBwh8lemEGNY0U0CV/jhpZ8luR9buzaI3zBg2WoR5p/SiCf7guvZmd0Z?=
 =?us-ascii?Q?14TJ3/vObg395w8dmll7P/OpU3wR5SN8xhj+9G+CaV9tZRLPw0rBoFqHbwK4?=
 =?us-ascii?Q?B/dxvyN0jMesKiKbtARiNLGA3CmGVWM/WpJ/UvlfmoEZXjnjIyyvV4Cyc/yl?=
 =?us-ascii?Q?f5GnkKg5NxVYg8Li1pxOizvN4SRAUJNXRPRAROH0/s38g7W5rjItMMSAppAs?=
 =?us-ascii?Q?LB1RrQdNj43TiMmMvbKT22z6x7jD1iPwWd71ekHEAXqTXT0SuYF/nV+6OTvr?=
 =?us-ascii?Q?q7Wyk3oGeBPB9Pp0k7j7zG1y3EhoyI0cSUDTGB3RbkiZTndauWhShKWOfqas?=
 =?us-ascii?Q?G+xN0TGIElpyoVCjErsRK9BZQfUHLsYjvV4GXW+NeCFrrGkD4xkwG85Ndmqt?=
 =?us-ascii?Q?yhn/5Qil2RNjm7qHwVctd/amvDRtqH34QuEU9U+08LwKlkyPdCbJBEAgG5Zv?=
 =?us-ascii?Q?zp5MUoRjvKWjO72nPr7moNGGRBf8KW3r7U7ZsGLrLMazjQuO6wDdpOHvEtQA?=
 =?us-ascii?Q?EaZL62AyDpT/AUT1e5F4/adnYByIJqtsIuo3KiCEz7CQwuMbTcS9RH+S4cPY?=
 =?us-ascii?Q?Nk9Dt4U8tUd7ZkasQBblaWDMmZ85bHqd0XMrXKz+ZPa33u/cZWnYynr7lODW?=
 =?us-ascii?Q?9pX48giqYrfOH72BTaTcFRQsGC4pdqkD5JXuwGFzrmcXOF2Y2L+fNoj85M48?=
 =?us-ascii?Q?9689hbpK0krZmyPBFWzzBMn6seg38UroEvgMsmJzMnC/ALRpAYWD0h9IVTmk?=
 =?us-ascii?Q?kd9vpBGnrGuRIDml98OMA2/6+ueCf55zzuoUfTvO2FkeEy8k7xucx6M+h4FM?=
 =?us-ascii?Q?bbBpdqRLkDiw182o71HxQLR5+xEzKEklRn1XwGmbfXZmVkA93HlGVlGd/A2F?=
 =?us-ascii?Q?YRp5Di+Fza8+ZXe5g2+uKkpRfrTkOuaFvBPDEiEP3SComUKGBB5xuYX6xDm8?=
 =?us-ascii?Q?Y9U//DcYuen/fhXH9SfzO2a6EW+qqr9l0P9bM8pdSrfCYkTphLxEyxZLTblD?=
 =?us-ascii?Q?80kjEQuopMg6MIEd5pw5NAZdOa0SBA7GiSO5fHByhylZSGvuUujuEyefFMwY?=
 =?us-ascii?Q?JffC4+0BOZozv9RSCI6iH4nModSE8cB2M3OmJRECv50mjFhVhW3zo9E6tjO/?=
 =?us-ascii?Q?SXdpauZbMfTzW1vQJ5sePSjot+IgQjezINCKGurRU6HZxR8fL5QbvRfcOHAu?=
 =?us-ascii?Q?IXD1vcN5T2CC4EwNAXnNV6hz/E1x9j/017ij8JPxK6HRzTBAXd/1juNKWQmq?=
 =?us-ascii?Q?R1DqjyRqRIsWB9Z/4Iz5H8EaNAMlirDKxHaWN1Qg2AVeM+YpJ4Z09kuUUuDN?=
 =?us-ascii?Q?ypAZPsjngqbMOq6g+Btf0sWDlN2dEwKU6X+tDy5HV+uJCj856jbQ2n4x3PNf?=
 =?us-ascii?Q?7HfNtgQJVoBM+23L7+7J4Rgt5HvuKSsFLuhB8BJJLA/DuY0jc9imwUzRzKF4?=
 =?us-ascii?Q?L8XE9Qtz5sctwdf/QHbYaB4Nd1tAnfg5WhXe?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 13:16:34.3215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d88bb9-b02f-46f4-b4d8-08dd7ce8e952
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8114
X-Authority-Analysis: v=2.4 cv=UMDdHDfy c=1 sm=1 tr=0 ts=67ffadbc cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=m3vUYHqNXDkfss99RkQA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: S03nQh4nIfcEReVLUYFznB7S4UAxmSoH
X-Proofpoint-GUID: S03nQh4nIfcEReVLUYFznB7S4UAxmSoH
X-Proofpoint-Spam-Reason: safe

Remove two unused pointers from struct cs_dsp_coeff_ctl by taking the
struct list_head out of struct cs_dsp_alg_region. On a x86_64 build
this saves 16 bytes per control.

Each cs_dsp_coeff_ctl instance needs to keep information about the
algorithm region it refers to. This is done by embedding an instance
of struct cs_dsp_alg_region. But cs_dsp_alg_region was also used to
store entries in a list of algorithm regions, and so had a struct
list_head object for that purpose. This list_head object is not used
with the embedded object in struct cs_dsp_alg_region so was just
wasted bytes.

A new struct cs_dsp_alg_region_list_item has been defined for creating
the list of algorithm regions. It contains a struct cs_dsp_alg_region
and a struct list_head.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 45 ++++++++++++++------------
 include/linux/firmware/cirrus/cs_dsp.h |  2 --
 2 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 560724ce21aa..f51047d8ea64 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -311,6 +311,11 @@ static const struct cs_dsp_ops cs_dsp_adsp2_ops[];
 static const struct cs_dsp_ops cs_dsp_halo_ops;
 static const struct cs_dsp_ops cs_dsp_halo_ao_ops;
 
+struct cs_dsp_alg_region_list_item {
+	struct list_head list;
+	struct cs_dsp_alg_region alg_region;
+};
+
 struct cs_dsp_buf {
 	struct list_head list;
 	void *buf;
@@ -1752,13 +1757,13 @@ static void *cs_dsp_read_algs(struct cs_dsp *dsp, size_t n_algs,
 struct cs_dsp_alg_region *cs_dsp_find_alg_region(struct cs_dsp *dsp,
 						 int type, unsigned int id)
 {
-	struct cs_dsp_alg_region *alg_region;
+	struct cs_dsp_alg_region_list_item *item;
 
 	lockdep_assert_held(&dsp->pwr_lock);
 
-	list_for_each_entry(alg_region, &dsp->alg_regions, list) {
-		if (id == alg_region->alg && type == alg_region->type)
-			return alg_region;
+	list_for_each_entry(item, &dsp->alg_regions, list) {
+		if (id == item->alg_region.alg && type == item->alg_region.type)
+			return &item->alg_region;
 	}
 
 	return NULL;
@@ -1769,35 +1774,35 @@ static struct cs_dsp_alg_region *cs_dsp_create_region(struct cs_dsp *dsp,
 						      int type, __be32 id,
 						      __be32 ver, __be32 base)
 {
-	struct cs_dsp_alg_region *alg_region;
+	struct cs_dsp_alg_region_list_item *item;
 
-	alg_region = kzalloc(sizeof(*alg_region), GFP_KERNEL);
-	if (!alg_region)
+	item = kzalloc(sizeof(*item), GFP_KERNEL);
+	if (!item)
 		return ERR_PTR(-ENOMEM);
 
-	alg_region->type = type;
-	alg_region->alg = be32_to_cpu(id);
-	alg_region->ver = be32_to_cpu(ver);
-	alg_region->base = be32_to_cpu(base);
+	item->alg_region.type = type;
+	item->alg_region.alg = be32_to_cpu(id);
+	item->alg_region.ver = be32_to_cpu(ver);
+	item->alg_region.base = be32_to_cpu(base);
 
-	list_add_tail(&alg_region->list, &dsp->alg_regions);
+	list_add_tail(&item->list, &dsp->alg_regions);
 
 	if (dsp->wmfw_ver > 0)
-		cs_dsp_ctl_fixup_base(dsp, alg_region);
+		cs_dsp_ctl_fixup_base(dsp, &item->alg_region);
 
-	return alg_region;
+	return &item->alg_region;
 }
 
 static void cs_dsp_free_alg_regions(struct cs_dsp *dsp)
 {
-	struct cs_dsp_alg_region *alg_region;
+	struct cs_dsp_alg_region_list_item *item;
 
 	while (!list_empty(&dsp->alg_regions)) {
-		alg_region = list_first_entry(&dsp->alg_regions,
-					      struct cs_dsp_alg_region,
-					      list);
-		list_del(&alg_region->list);
-		kfree(alg_region);
+		item = list_first_entry(&dsp->alg_regions,
+					struct cs_dsp_alg_region_list_item,
+					list);
+		list_del(&item->list);
+		kfree(item);
 	}
 }
 
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 7cae703b3137..a66eb7624730 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -64,14 +64,12 @@ struct cs_dsp_region {
 
 /**
  * struct cs_dsp_alg_region - Describes a logical algorithm region in DSP address space
- * @list:	List node for internal use
  * @alg:	Algorithm id
  * @ver:	Expected algorithm version
  * @type:	Memory region type
  * @base:	Address of region
  */
 struct cs_dsp_alg_region {
-	struct list_head list;
 	unsigned int alg;
 	unsigned int ver;
 	int type;
-- 
2.39.5

