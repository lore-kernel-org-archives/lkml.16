Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7EB27FD7C;
	Mon, 16 Jun 2025 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750069885; cv=fail; b=ceRnofTNGAhHtpXvDVmUdHK2QM65i5HnT79A3L/iWGWJwBZbA19n6R4XObUqTdu7YTfZlc67isxMj3XLxCEhTlLHnMPt9BZtPPhN4PKdGM9fD/OfkBq5h9Ta+/4MCm3KG76ulHoJgQnuM06hc9KGuKlt1yKtVVhDUL9NJ4x90pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750069885; c=relaxed/simple;
	bh=nDGgEAhmcSwabhpcQM6V9977hTrROj7B3KMC39JQ8QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BCSl27bONdENGeBMw4BlZMGARna/rX1rYkcWQNVU/DVwwOBIzclZ8OUZHOdbBaHbm3cO/xHwbnH4Q9rCKJhxQVrqaiKGj3idc3saKVU52rX1QpaxELDFC/REYKnkli27TGnZw+J3/HKFbj+w8c7qhkXcb4MPGlKC0qXgVCw7V/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Sn/WkAVV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FWV+HDL2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Sn/WkAVV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FWV+HDL2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G752Cs015353;
	Mon, 16 Jun 2025 05:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=hR9NVl4LnE7FvTJa
	cpH15648Iu4a07Qm/HarD4ghjr0=; b=Sn/WkAVVxyrWIkFOkEWXsSo3swsClVcg
	Qj5ksS1EVKqiqkW4uBM+H2vSyAy2HjuKpReIXfjtiiJbQJao4JhuWUjYTQz9iRXU
	Pm9igyh402Ubf6Z5vot/16eUiTpFqx+o1cX0SJ1JxCJsPId14mDN/n2ClopALW4r
	xHKQV2GFLmiPqP4saHzuHk2xWorQ+xukLlTfmaJAVXb94C6BB3DhH+bbFc8ijejw
	qNI5Wd6o21by9lyv6jlCzQvXr2LLMbUHyt3WozP/GLeIa3UCTpLsF2832HhAmQzB
	FNAhpefZZ1bJJ+yRv3HOzrax/8R0plsojukDhImnhut2McmdyYeigQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2125.outbound.protection.outlook.com [40.107.93.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47aeja870p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 05:31:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoLJYrLlkm4o95KofUj/d1U8OrqqHh/Unm/L/hVs6hCx0koXL6lh3eyvAMSHqVEOZ+Tmg7bMLAEe37tawWbifr5PdCUT5UJO4aB+lIGH+9wd5tUloXddOQsGryVPKX0gkFXt7B+TJA3XsN1/K8woBAQPoJrnvZgphq/9OBzbPXl2PBqxxvhMPn7sQV7+poC8CSicx8uAo8R0PoXQRMlxH8LZ3KzpNSbrrQW1RjsiA6B+Uv6+aDguxqxVz2vG72n70+2wGD1aaEAlwFu3UmFLDMmHBGeWKqRtwFlqzQVW6p95ZxokwtZic1r/1ZtuNRzAlyeivIMQa6gff8P3ARFm5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR9NVl4LnE7FvTJacpH15648Iu4a07Qm/HarD4ghjr0=;
 b=JVo9vGzdxxmbCTpe+TBbvlemws/9SI71cOJDCAj9rkOS9bM2LWQ8Dyk0Cto1qRfQ/cad75MhMxDL8xWdLvLkbnYHN5sKwrXlzjro0uBqVAe6S86TK3RQ+WPsCpLFgBAuJSoQTlfQpguMkI6QNRMyBxiYsFMiKfbjylGQFGEsihUf61PjcUR/tcizZCy1L1S2JMGa0FW5wceuz/XOhEopx4c97i6Kw/e8m/QFPK8J8vAXBiSdmDY6Xgxk5zWGAzAd5FQ3b2OdhQYGkGXRDiadyzU5xBD8Gj85+uQvDia9VKjdAAuJLIUA05EP9MypHy2Tnx6pGDJWEQoRq+53l3aRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR9NVl4LnE7FvTJacpH15648Iu4a07Qm/HarD4ghjr0=;
 b=FWV+HDL2j24WVHfeRRLffOqVtOT4fNeeYtBjRGwrDoYZh6ZbeMeerEj//RKQ3ST/NcjD2+bRmzWmn9ao6IrVMK+gRZQj+p3XeMfcWJYVLrFVdtSoozrxrx2aVHVo37rqbApJ6zBIjh4ZUt6u1gmnE03A/SRuAf+SinOlaInJ73g=
Received: from BY5PR13CA0002.namprd13.prod.outlook.com (2603:10b6:a03:180::15)
 by DM6PR19MB4025.namprd19.prod.outlook.com (2603:10b6:5:24b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.17; Mon, 16 Jun
 2025 10:31:03 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::f9) by BY5PR13CA0002.outlook.office365.com
 (2603:10b6:a03:180::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Mon,
 16 Jun 2025 10:31:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 10:31:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D7D2C40654F;
	Mon, 16 Jun 2025 10:31:00 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0BE94820249;
	Mon, 16 Jun 2025 10:31:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH RESEND] firmware: cs_dsp: Remove unused struct list_head from cs_dsp_coeff_ctl
Date: Mon, 16 Jun 2025 11:30:52 +0100
Message-ID: <20250616103052.66537-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|DM6PR19MB4025:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 592f506a-724c-4344-3041-08ddacc0e484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J0QHnACaRCbkU+y+nA5nO1Y0zZTf4x/qF/nwi9IqBPrQknJUaoRzapShS4zW?=
 =?us-ascii?Q?SkW9+N5VhNaxvom+Qms+PQeQ5YXyvlSHVJg+fkBb78MX0ssTlzahsAn66TdQ?=
 =?us-ascii?Q?fojzK+v1LQSUPQPhvo/v7tHvKoG4ZA4r9+pBJQSOg+xXyG74IyP3pLg6hctV?=
 =?us-ascii?Q?C7yVrWG1klI9Nleyi1fLG7dMHiwMcF1XNuKWVFiyhC7RoaQa+Ot4gqgn8LiO?=
 =?us-ascii?Q?DFB22ASTmc+a3cPoFmqtw9ENwHwC333v01CtQWl0AykUFTInRLQGEtwqHzd5?=
 =?us-ascii?Q?FWNCDMaWxEu1TYiUsGv2hKOvQO3mjBephrR4mwpRJGlutbHT+IhcuPFhh+jm?=
 =?us-ascii?Q?Hw2YkD+F6WMULtYVVSPyma7YF0B+VE44965imdSewjVIDasKHuKPhchYdlRt?=
 =?us-ascii?Q?eSbd+mzCoKW74LvFN0bvhBUOeWU6BGwDaDSX5K6qJIX5diBRisWsEty0ZNHD?=
 =?us-ascii?Q?YRPedRVNeNgzSJT9GcvMIL8UbUyFwqCj9G2xgIqO9d7FdXLV/U7LzY3f15s3?=
 =?us-ascii?Q?pjfH8LAZJHSUAFCxKTOwLLZZH+yvsv8QJRFid7VX+pOBPMkc7AOMe2dy4IfC?=
 =?us-ascii?Q?DCN8vylCPzianeA9TIwPpVlEZNDkDMoC+nNi4k8tSZYDl7huUqd1X3TsBrLt?=
 =?us-ascii?Q?X/xU1r8ASS8Y4zryn1t3pv/z82MqamT3IUYR1RI6M8BP7L/aBSjTD8jtvfw2?=
 =?us-ascii?Q?GrHJ/XHNl7mg+Tdhd7cR844KnthPQI9AyVX+t144MK9OZ3753PX7mjTz36o3?=
 =?us-ascii?Q?a2PkcjcpAgFPW8PW1IW/XAewmRroEedDboMY5mfD3Z+Jc5vKIs/Up9+xD1dA?=
 =?us-ascii?Q?pN3tUUT+khY+fa89suIQk2QrXezoYmPzr20TBD9bbKmn/2VVIL3750mgBCAA?=
 =?us-ascii?Q?TqkNdpxFzPqrjCm2lrUO5Xy/joZncmCu8YtAAnDVuxowLaEcebLnVF+D8hnV?=
 =?us-ascii?Q?KyHDypwVkvY1FjEx3NzXwUXNIufjdC7y1bmsMrMSxYNYcAXTdO+c0b3Ija/b?=
 =?us-ascii?Q?G6lySDV/9iyFnOBrJ1txOWUN7YJ4klBfEApwJtB+mDlpBK0tNV0qcHM5F0MQ?=
 =?us-ascii?Q?gxeg4piFZmuuJNpv3MBwT5Bp41l148KEDFuxOYemNKaoiCU+e74FKQsymcBT?=
 =?us-ascii?Q?etET8OnGA5WiGuSEBu8A/gdjyLcSIDcBMHssSXGB4G/kIiM108+ws6o8lE6h?=
 =?us-ascii?Q?OMqESd3GddvWYmuLT1iQEVB3zaMLo6SmzXOO7QGjIDruQHMy2DvWachzw9ly?=
 =?us-ascii?Q?9PE8sEEyBGQ0SxPBy6mqjbeNERLW6CwoBkGOf32fm67yw10curgtcg/g7/TA?=
 =?us-ascii?Q?770SPdp7dtbmJxy9fzJBdHW6dofTm3AZC3yIwS9JPzbyHhmjn/C7EiQ2nwus?=
 =?us-ascii?Q?QM9yUpghv21WhLJeJODu0u+hOgWpOMePcZ5HV5Bz5xDhWhIq0HCMqNiZ382D?=
 =?us-ascii?Q?Z4ek3mFu+D3V3CocxMqmUnqipxpRd0WeNHTMAPKhhjvgrYDUVmBJF3i95L6R?=
 =?us-ascii?Q?XH5D69z84CXGCyNjrITp7nDjws0Sstk61HLw?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 10:31:02.1082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 592f506a-724c-4344-3041-08ddacc0e484
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4025
X-Proofpoint-ORIG-GUID: aWgghXMoG8of_lv1k-hY6ZQU0UPnfCix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA2NiBTYWx0ZWRfX5rtbS+5rHWGb wwKZbqLDRdhIUR54wpz6/QJOoWWpmA67klVhqWRxGOdVkWgtU4Eo4A++XxJXSPDiAyloHtlmvvG wrShDMWv0rCktecdsQW/WbNYxQa/+H44lwUeuylEUZHYMSimCcgTPE+PG/pj8oRUoklsjbiHAVy
 A+mgG5zpQH2x6syzdm3bdWS5F5pwqbkAlkxsiSoAsGtbhX9+GkSz5IRrp9Tj8PLl8eFJi+pllOo JNtU6T27XQiFylX+arixIA/ndJdS1hm7toMKuSQrBLl5aPvO45a2YPVtbcVFxPgVlRsh6KZFqlf BjKzLyaphDeH3AJ5H3w4uUgwgEmjh9ysZiK4AzVGpxTLs6Bxn3eWNqIO4vK40pTi+fVESQFYvK1
 2jafTQVRUN9jccy59PkjIIYLPmhQ5NBhdfSygfa9tiSZIy2Id6eUXlCfQwFQ4uhw/SKoCoA7
X-Proofpoint-GUID: aWgghXMoG8of_lv1k-hY6ZQU0UPnfCix
X-Authority-Analysis: v=2.4 cv=OvpPyz/t c=1 sm=1 tr=0 ts=684ff26b cx=c_pps a=3C69hXDWRDSes6eSmwOwlw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=m3vUYHqNXDkfss99RkQA:9
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
2.43.0

