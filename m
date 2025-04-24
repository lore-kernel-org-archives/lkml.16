Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20DB222595
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487549; cv=fail; b=WT0r11OgYK4iOY+6uyrxxFxujyI1HpCLrzItxEIqHMlsNJtf7xk9WZckSFs5u2QfXxrbfatJPX+ztAwJgqu/gg7uylaPPbPTlUFr+e680lLbtt9w4pjQhFCWTYUqUeoz6ubXfwlpgiXlHi4ZPWdav38GQFFtvM/9/HgpRc8bfUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487549; c=relaxed/simple;
	bh=GMrENBCfpdZC1mmRC4oGe7/yT+YLZwnf7kDsXrwXhss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FT6j6q7L0nDICYmXnA5OffDehjZQTeq98NCC2ZcBuo/SxeAb8KcZZ3ZqAwaTN4Kd3xR7UjIZQU28wnRIukp0wOTUpSPwq3UXZXyZMOyXYLcMM8Ng8I59UaJtCX9WzO9AdBTIQb+7I6sfTUSRWfuglLbqxwPg2C4vbtvCROC2oU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=j56LzgIk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mwkx6ZpU; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="j56LzgIk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mwkx6ZpU"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O8XiIt023334;
	Thu, 24 Apr 2025 04:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=RnlDnwHtdTRk0Yzv
	57FP7OulXln3ztGKn7YW3+mM8Wg=; b=j56LzgIkZ4nPCKln1Jq61yQfw12+777n
	IDg2T9iHvpGTL/qqNIw/OpQW3mSupQa2SlyoS01jaBJ9AuVD6J6b6XTmtncSLhtE
	dj4JH/Hsxl6NzovdjaS5lQ4mlZvLlBBfGli3p6pHrY+etH5t6JN5oe9e/UJgb/uC
	802S7J0QHWCIdkzwGWeXWQ+7xcFLNMRn9SOMg2BfgCwqNkOTGBQc5NU+ip4D2lxn
	QOnP1IO1CpNmXpBu5PB6f7LgkUzuj5qgJw+iPobwp2YYTZTxs1ArbM9iHJoCBV2Z
	FajWXxXJCfceAEZVREJOOxVjv7sHJlTKca0r5XpNtpeqrNUJth44Mw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 466jjx28wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 04:38:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdmtCfdABej60ivOgEetm5PsC+b5yfk1RJfXWAA612XI6Ty2TOnyvGOK8O4cgB1Bnqnvh9WSYH51RLR1EfFEku1fvaH+yl5R3Txd8+S6nrXFTMYf5peTz5D3K4uo9zM0Qnk0mnCGbGNvyWyZ3Wpakj0jp0iHRvVT7K+1e6K+YX6PNccBMQJKPS2pFQn8HWbcdva8vjTYdCXluH76Q6Kgb7T+TyZlzZDMBX02XQVsrpe91QunlSBmNab838BsZMfUuBMxsbaMM0WFY15uQqtDwa2G4vLnTmdJbidenhZHDpxolk7u7pXwaXWiN+fNfrGriq/NjpcIwrrg1/LxJ+DGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnlDnwHtdTRk0Yzv57FP7OulXln3ztGKn7YW3+mM8Wg=;
 b=odUJ4B+HyRfFz7FWdDrN9wWEQOUTmthbJcgpWVLWCSGTeNlFPYFFGGsjMG7lOPMjcDhYfzRd/kMmQ7cUrujmKLa57X+EhwdIzw3oIqkgzzJvR0t6Nq5G78dfqVBt2HnFsQ0F99TmIRYaSTfuqoF6AWpN2kwREtRnYeHtMuF0ubUKeHui5VvseBWAGMYI51zIs5vc8wMKuVMPNyB1luqPAs8GMlSSK1X57XGzFJHWgoWfwobRCymMvFO3casVN6FrrSlEwpHrO/HWNPbSmA18xMPIE6IJhhQyeIhQoJMCgc4MvtRzGJqNyNZi3SLzQYkojuHQBWdcORzxcpesojOkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnlDnwHtdTRk0Yzv57FP7OulXln3ztGKn7YW3+mM8Wg=;
 b=mwkx6ZpU0jtlGhNmQjGwFhmLBFa2+KM0Rylz0BwvmO69bFq8CHP72Dl1juf7xuLFk9qXWBTaxL10HDZAN3QEwVpoGeIjk10j4lsqPa3Shxijh+2Ugc1Zi+dAYAc7mI1IFU7GT8Sx163jzuz739jbG0NsSNL8/uJePRJn4jbR0t0=
Received: from SA0PR13CA0022.namprd13.prod.outlook.com (2603:10b6:806:130::27)
 by SA6PR19MB8783.namprd19.prod.outlook.com (2603:10b6:806:43d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 09:38:45 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::81) by SA0PR13CA0022.outlook.office365.com
 (2603:10b6:806:130::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.13 via Frontend Transport; Thu,
 24 Apr 2025 09:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 24 Apr 2025 09:38:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 80F3F406543;
	Thu, 24 Apr 2025 09:38:42 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9C69C820244;
	Thu, 24 Apr 2025 09:38:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] driver core: Introduce dev_err_ret() and dev_warn_ret()
Date: Thu, 24 Apr 2025 10:38:39 +0100
Message-ID: <20250424093839.27451-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|SA6PR19MB8783:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ac9dc0db-2943-4401-f3ba-08dd8313ce29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4k9pACOBO4T9XwMM91YEuZm8BkKZV7+fcB6biSFJ75/Ezl0jgbdVYqvxzuZb?=
 =?us-ascii?Q?CshRtLT1WNVmpqBmyMo6OkGMbcpg9YZ0qgbR9m40zBzXT8d7V2JQjT/A1D5v?=
 =?us-ascii?Q?XR0SkrtfsWFkcSKAb7tVMfHYaKASTs6CgAZguIfJ98pK068Ej7YLaZgcivnC?=
 =?us-ascii?Q?MvMj3WnVpD9oOKhCybGOEkSGFBRlxnuOXQns0aDrXd5d3XD7rqH/LtNtuTNq?=
 =?us-ascii?Q?UJzuK0AjKx1ZzGmLlLAkxMuLXHS5CSqTQTo0n9xWYbPEMJqbxK7sdN4oleFc?=
 =?us-ascii?Q?P46e0xi2674egE5vHey8hXZ6tMkmwSif0LPznfJG/rQ4BUKC4G8xXCRPf5FZ?=
 =?us-ascii?Q?nJrMAlPjLJjzKXR9DBaRES7onjQBCT4XSnyPnFOo6LcoM/sY12pVJxHt7RBu?=
 =?us-ascii?Q?I4icu4TCkrUp2w1FTe8hrVtUEEcx7WPKXIuj7Svtm6CMVjmqMqG7CIn4RDQQ?=
 =?us-ascii?Q?cNsQF+B7ykh8e75TpRRS4YjUYz76LYOmc4tlcR79H3DONJX/Ut3NP06lmu/7?=
 =?us-ascii?Q?eq52Jp85wPES+FuMhXveWKMvkAfBn5o7pgjFscCBn11ViapSwgqE+i3SfKAC?=
 =?us-ascii?Q?LUWDO9WjLaHu+Yyjdv0AJ98fXiOZW4nVReq4wEwxr5OgXL/00vej9CQ/LOJT?=
 =?us-ascii?Q?5MXWjlBiWq/W/EL649TdVPFAR8+SEkSm35FanE5BuMrrQSyjcWR6hvQ6BvVx?=
 =?us-ascii?Q?28+B+6hBbs/U5/ORUY5c5lcltmb8Mxn6EuDuqVf+ssVUw7XWMT6UEOLeEsyR?=
 =?us-ascii?Q?hdGhTMKgoExXql7bkvar3Mn3OTfhJPKxoyMqCel9pZ8b9XyebVDSxp0dgv7K?=
 =?us-ascii?Q?G+6wcH+Ox+OofC1ju9yLfR39CuH8UtRw7AX44L5BAp+EuAvqQ2IYYLeDC23f?=
 =?us-ascii?Q?z6QkIGfg3auxNTH4AhHwgA35WeLO4kyGrDohU2MpeHbcedWC86mzHIiXZPUB?=
 =?us-ascii?Q?+lDiE1wzTjPO1lPM/6883o4Bqd9vB1ns5pgq/WtbYppaejeQgXz0NNVxWHrT?=
 =?us-ascii?Q?53+ZYTdoqgbiBDjTR+ZAJLlcEEF5iIfbvtkIjsTHf/IrGV8d8pdzXtAGglmh?=
 =?us-ascii?Q?z6gSj66FXNm7Ju+TMSns+CaH7TXUoXib/lCx3uKhes+Oy3rvF1d8SqNDRVgZ?=
 =?us-ascii?Q?W07t0GYHdU1lGwDth0shSLOKFOhwEIKocgbHa91A3RbkvL901muxynN0/1GA?=
 =?us-ascii?Q?w7m4T3/Ry/9nFg8jEssV4hkqjCmcYvcNiwpCGCzBRZS76uQrODQVtc7o0kkc?=
 =?us-ascii?Q?3g3qCGdyA5vv5QekPC3os5yTzMzKimhJQD+fuC4/G4ik2st/kC4sq8UGdwEZ?=
 =?us-ascii?Q?i8SKn/MZZy5zAwIRaN7rVzIhtEWWsUtxeN2o9LZ6cLa3Bq08iqX7IQyOvpm7?=
 =?us-ascii?Q?Gpi7MhARmVOD66KIBbLU3S3uzt+1S4yhnNUHNBAU9UoVYs82I+WJHLnrrXTD?=
 =?us-ascii?Q?lapkOu1H393ciKqVxUEuanWe1JexL0MaGR3xnumz31NsL/IQyuYzpFIVA5tF?=
 =?us-ascii?Q?atHErNbOEYrq0deEU3B7A1FRpFb0ogQeZh+a?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 09:38:44.0208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9dc0db-2943-4401-f3ba-08dd8313ce29
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8783
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXzXqO4a6SH3lA P7/G8HJOsn/B1jKaqp4yNXk2ylRxUuvyOIeb8EEIpcEKmZ4OJMyBSpCAYQuPBA9E6yaQ/6086z2 das39qr/y7eWVOzaHjaS8RB5SY/pFGWsKQcrA9pG8yJYTJ7BBzH8pzL/VkYGMoImTQ/NF1Y5Vss
 OrZ3KGGwQXl7xfWfSq54QNGcUNo+D6Zw8lwEWYkHNa0BIKD8AGD5Cm8p1LXApVACRIJktipC9IV ZbhG638NPqweH6jwz204hM83wqy0LUXAfMrnpFGIKuLs7TQIxa+23mx2FB+b2ESOnYLj1rqYKFi bpyLNBJiKE5W7KiErrVJ8CeOd3OUPR/2w9s6g71asIIAC5ptksmgzNlUdtGi5bJg8FaqjSnh4L4
 ZyFcIGQEMFk1vsrq8Vqt6on7xJJdGT2RMyod7kIBIUtar7sfRENsAp8MV6fDmk9TRJ4wOXnT
X-Proofpoint-ORIG-GUID: YYr0QhV7wdBwnvqnW0CmgHELgHfpPYgG
X-Proofpoint-GUID: YYr0QhV7wdBwnvqnW0CmgHELgHfpPYgG
X-Authority-Analysis: v=2.4 cv=ItMecK/g c=1 sm=1 tr=0 ts=680a06a9 cx=c_pps a=NZTPE88KBhpz0z3fOSYQ1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=HBzz9YQbcwpDeC7nSUMA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Add two helper functions dev_err_ret() and dev_warn_ret(). These are
like dev_err_probe() and dev_warn_probe() but there is no special
handling of EPROBE_DEFER.

Although dev_{err,warn}_probe() could be used outside of probe(), it
has the disadvantage that if the error code is unexpectedly EPROBE_DEFER
it would suppress it and also update the deferred probe reason. If code
receives a EPROBE_DEFER in a situation where it cannot handle it, that
really should be logged. There is also the potential for confusion when
seeing a dev_{err,warn}_probe() inside a function that is not actually
part of probe.

They have the same advantage of a standard error message format, and
returning the error value so that code like:

  if (err) {
          dev_err(dev, ..., err);
          return err;
  }

can be replaced with

  if (err)
          return dev_err_ret(dev, err, ...);

The simple cases of dev_err_ret() and dev_warn_ret() could have been
implemented as a trivial inline function to call dev_{err|warn}() and
then return the passed error value. But it is useful to keep the same
message format as dev_{err|warn}_probe() and re-using that code avoids
scattering duplicate format strings around. Also it should slightly
reduce the size of the error path code in the kernel because the compiler
does not have to preserve the error code value for the final return.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/base/core.c        | 112 +++++++++++++++++++++++++++++++++----
 include/linux/dev_printk.h |   3 +
 2 files changed, 105 insertions(+), 10 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index d2f9d3a59d6b..a8bd8d02e0eb 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4961,8 +4961,12 @@ define_dev_printk_level(_dev_info, KERN_INFO);
 
 #endif
 
-static void __dev_probe_failed(const struct device *dev, int err, bool fatal,
-			       const char *fmt, va_list vargsp)
+#define DEV_LOG_ERRVAL_F_PROBE	0x1
+#define DEV_LOG_ERRVAL_F_FATAL	0x2
+
+static void __dev_log_msg_with_errval(const struct device *dev, int err,
+				      unsigned int flags, const char *fmt,
+				      va_list vargsp)
 {
 	struct va_format vaf;
 	va_list vargs;
@@ -4983,18 +4987,20 @@ static void __dev_probe_failed(const struct device *dev, int err, bool fatal,
 	vaf.va = &vargs;
 
 	switch (err) {
-	case -EPROBE_DEFER:
-		device_set_deferred_probe_reason(dev, &vaf);
-		dev_dbg(dev, "error %pe: %pV", ERR_PTR(err), &vaf);
-		break;
-
 	case -ENOMEM:
 		/* Don't print anything on -ENOMEM, there's already enough output */
 		break;
 
+	case -EPROBE_DEFER:
+		if (flags & DEV_LOG_ERRVAL_F_PROBE) {
+			device_set_deferred_probe_reason(dev, &vaf);
+			dev_dbg(dev, "error %pe: %pV", ERR_PTR(err), &vaf);
+			break;
+		}
+		fallthrough;
 	default:
 		/* Log fatal final failures as errors, otherwise produce warnings */
-		if (fatal)
+		if (flags & DEV_LOG_ERRVAL_F_FATAL)
 			dev_err(dev, "error %pe: %pV", ERR_PTR(err), &vaf);
 		else
 			dev_warn(dev, "error %pe: %pV", ERR_PTR(err), &vaf);
@@ -5044,7 +5050,9 @@ int dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
 	va_start(vargs, fmt);
 
 	/* Use dev_err() for logging when err doesn't equal -EPROBE_DEFER */
-	__dev_probe_failed(dev, err, true, fmt, vargs);
+	__dev_log_msg_with_errval(dev, err,
+				  DEV_LOG_ERRVAL_F_PROBE | DEV_LOG_ERRVAL_F_FATAL,
+				  fmt, vargs);
 
 	va_end(vargs);
 
@@ -5092,7 +5100,7 @@ int dev_warn_probe(const struct device *dev, int err, const char *fmt, ...)
 	va_start(vargs, fmt);
 
 	/* Use dev_warn() for logging when err doesn't equal -EPROBE_DEFER */
-	__dev_probe_failed(dev, err, false, fmt, vargs);
+	__dev_log_msg_with_errval(dev, err, DEV_LOG_ERRVAL_F_PROBE, fmt, vargs);
 
 	va_end(vargs);
 
@@ -5100,6 +5108,90 @@ int dev_warn_probe(const struct device *dev, int err, const char *fmt, ...)
 }
 EXPORT_SYMBOL_GPL(dev_warn_probe);
 
+/**
+ * dev_err_ret - log error message with error value and return error value
+ * @dev: the pointer to the struct device
+ * @err: error value to log
+ * @fmt: printf-style format string
+ * @...: arguments as specified in the format string
+ *
+ * This helper implements common pattern for error checking:
+ * print error message with error code and propagate error upwards.
+ * It replaces the following code sequence::
+ *
+ *	if (err) {
+ *		dev_err(dev, ..., err);
+ *		return err;
+ *	}
+ *
+ * with::
+ *
+ *	if (err)
+ *		return dev_err_ret(dev, err, ...);
+ *
+ * The benefit compared to a normal dev_err() is the standardized format
+ * of the error code, which is emitted symbolically (i.e. you get "EAGAIN"
+ * instead of "-35"), and having the error code returned allows more
+ * compact error paths.
+ *
+ * Returns @err.
+ */
+int dev_err_ret(const struct device *dev, int err, const char *fmt, ...)
+{
+	va_list vargs;
+
+	va_start(vargs, fmt);
+
+	__dev_log_msg_with_errval(dev, err, DEV_LOG_ERRVAL_F_FATAL, fmt, vargs);
+
+	va_end(vargs);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(dev_err_ret);
+
+/**
+ * dev_warn_ret - log warning message with error value and return error value
+ * @dev: the pointer to the struct device
+ * @err: error value to log
+ * @fmt: printf-style format string
+ * @...: arguments as specified in the format string
+ *
+ * This helper implements common pattern for error checking:
+ * print warning message with error code and propagate error upwards.
+ * It replaces the following code sequence::
+ *
+ *	if (err) {
+ *		dev_warn(dev, ..., err);
+ *		return err;
+ *	}
+ *
+ * with::
+ *
+ *	if (err)
+ *		return dev_warn_ret(dev, err, ...);
+ *
+ * The benefit compared to a normal dev_warn() is the standardized format
+ * of the error code, which is emitted symbolically (i.e. you get "EAGAIN"
+ * instead of "-35"), and having the error code returned allows more
+ * compact error paths.
+ *
+ * Returns @err.
+ */
+int dev_warn_ret(const struct device *dev, int err, const char *fmt, ...)
+{
+	va_list vargs;
+
+	va_start(vargs, fmt);
+
+	__dev_log_msg_with_errval(dev, err, 0, fmt, vargs);
+
+	va_end(vargs);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(dev_warn_ret);
+
 static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
 {
 	return fwnode && !IS_ERR(fwnode->secondary);
diff --git a/include/linux/dev_printk.h b/include/linux/dev_printk.h
index eb2094e43050..336b2f948e3a 100644
--- a/include/linux/dev_printk.h
+++ b/include/linux/dev_printk.h
@@ -286,4 +286,7 @@ __printf(3, 4) int dev_warn_probe(const struct device *dev, int err, const char
 #define dev_err_cast_probe(dev, ___err_ptr, fmt, ...) \
 	ERR_PTR(dev_err_probe(dev, PTR_ERR(___err_ptr), fmt, ##__VA_ARGS__))
 
+__printf(3, 4) int dev_err_ret(const struct device *dev, int err, const char *fmt, ...);
+__printf(3, 4) int dev_warn_ret(const struct device *dev, int err, const char *fmt, ...);
+
 #endif /* _DEVICE_PRINTK_H_ */
-- 
2.43.0

