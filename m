Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D725E1FECB9;
	Thu,  6 Feb 2025 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851783; cv=fail; b=K2CMYafkxB9W52flkLsMqvao5U0VItlIQTEz8AOtKHeiZNwBiwyrAZacQrYT6tAMIdRu31bxpRAux/PvxzzqHx1qiHILzN2yg04lyyrut+hUv3wwRei/fh6ThHgDtVjp13iufnASN49eznmEY1nBBhsWGu32n29gzEL/ixjzues=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851783; c=relaxed/simple;
	bh=phiDEmefYQudo4sjkRd08cDzJxv8ONflrGTqR857Dqo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iONX2Y7c9bQ3I5RYABhLnspRLR0xwHIFOO8axpX8WwgrkCXdkVM+foPHs3IszvZ+1LHYukNiaT70YlOZOSc/AMvNriP7h/Ef/EJ+6ign8V6WAVrU+6WN/6HDRRgCkvzlIoe2AdM5IgUNYXYbcwx59P9XvD2FYByAfmtw3z8cUpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QyiKUmgK; arc=fail smtp.client-ip=40.107.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QyiKUmgK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWC15wKHVnCmACg3VrAhvwsTfbDqB70LAubb6l4qoqMJSPubj5YGDprGH3e/272VbGVHwrvw/nuCB7lvFhsd2kv/bwTKiJ6GJfBwnTk17wQUTZT/AGR9JatMGE9lD5nCcInhD7OLdvbeIUuxEi1Km42z+sjPYkflNiIWkHeYYnpvxSeGZwPppslcU45U9qis7mYA/JGfTPq/LjZJ8rPbsfS2xAAUIImzU0X0cuEIpPdql1LOTZRgWi0a/NAGW57q3xSmUEpQbvoTFJsM3AJvRLCHrOsrLDskL5PI3887de2jJhFbDt+Snj5VXYct2tkIeYL3M3cFmTeER0kJCI7NUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoB297i7Z1w2yek2V4/2sNbvmXC7t5mfKrStn1iDh98=;
 b=s3fctC+kinkK99kbgzNJs01P2zrwDFHRHTeJm4w0oybRZhaYZPmHawsyM4Sbdz+YOlAg/TJXh94TRd9QL9usHpTBM+LE059gvc6N9LsI1HgL2LbMSkX3KiCLKRpz6ZzwGFG037wNa8dChs4Fxi8jlFu8f+wBdG2Rslr4aWgkuCUjEc7yivuLLgggjgE6vhjJgRQ+mX7cpVannwtSOtMILCyWlwyR9GCSdAWSPebOkpImyXi4cVjON7meBUUsHxuWtlxu/NVMvp3c1l9vuJRlCneWzJYpYDdzJDwyvOvW1bT0fOds2GFRVAe+tZoYr5klXDAsYXprTU9dIgC9FdTdxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoB297i7Z1w2yek2V4/2sNbvmXC7t5mfKrStn1iDh98=;
 b=QyiKUmgKbdVh2gdPLCpstf0m+KPVyacpSb34z7QLSQuZHKc9uhiLrAfBf34gV+Gvmdb8oBmhzNtXXKw5AEilhr8Bv6A6RgEGQctaBSVi3/jfW8cn1ku5IJKrSZ67Xxqgf1U+VlQM2NUyGHIlzMwKSDX13AvcPiCA3c8IYNRNALA=
Received: from BN0PR07CA0004.namprd07.prod.outlook.com (2603:10b6:408:141::22)
 by PH7PR12MB6468.namprd12.prod.outlook.com (2603:10b6:510:1f4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 14:22:57 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::e6) by BN0PR07CA0004.outlook.office365.com
 (2603:10b6:408:141::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Thu,
 6 Feb 2025 14:22:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 14:22:57 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 08:22:56 -0600
Received: from xsjwillw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 08:22:56 -0600
From: Ronak Jain <ronak.jain@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <nava.kishore.manne@amd.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ronak Jain <ronak.jain@amd.com>
Subject: [PATCH 1/3] dt-bindings: firmware: xilinx: Add xlnx,zynqmp-firmware compatible
Date: Thu, 6 Feb 2025 06:22:42 -0800
Message-ID: <20250206142244.2553237-2-ronak.jain@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250206142244.2553237-1-ronak.jain@amd.com>
References: <20250206142244.2553237-1-ronak.jain@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ronak.jain@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|PH7PR12MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: e420f685-c771-4ccf-27aa-08dd46b9c0b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bmMw/MiathuzBoW2pvA94aCzHe82RWWTaPilibhzttsOFTSmVxvWhAJ8qZpx?=
 =?us-ascii?Q?aMsPwvQ5UVxsaAUHC7qd+86c+HbbNBOF2wDnYPIEJLiUDcXUTjdqELWldTsQ?=
 =?us-ascii?Q?XjsBAUKhy060ydcFpfhayfA4hx/cSNr/LVfDPqjw6nWnWqJyYGQKZ2G7gUNl?=
 =?us-ascii?Q?xsGgqHW38uTsALbh0HIjhVobe4rKlrY7bFXgr9P19aFR5fsV+O5YqCHmwoRV?=
 =?us-ascii?Q?MA7efLEEE11eYA1m3LIggYPVu7/LlPJK9iqnGqKvboqeSy4iVpduqblC0xks?=
 =?us-ascii?Q?oKjvJc4oL2jqQ5plwE7F5BF4uwW8VyaM/595Z2g4vitpYz9iqcZMhfyBYoDW?=
 =?us-ascii?Q?e1ffj67aIDkPR1wmJK2n8xjrWgDDUEBMFB5PoHLRVetbuCqeI6DSyrFjGGHz?=
 =?us-ascii?Q?T6Rhaay8Dz2MCxtztIa9rscgOKDjp9vGu9GAFD8/6WCH9DpbGdAe/l0AkoIS?=
 =?us-ascii?Q?H7HFLxFOSOmXR5nMJxLUtsQEftsr0HASYZKUeKzQEbDhoAPJ1g+JGYEF2Pw5?=
 =?us-ascii?Q?IV7iibplIH0iNLifU6Tw9XiSTypQL0yFPfPQnYeXQT5a8ucDE74ohppPqsWv?=
 =?us-ascii?Q?VrnFD9Qe6ZzQjvqG4/9vQVywfQK1RKs4ZbsPAAgu5jzVAlThtMbr+tjDBAMD?=
 =?us-ascii?Q?7K4Af0yoln5f+8xcNVt5z8+y4Fi/m7Ju8YIKyGE8FDe/2UvBCqxCAsasZW2i?=
 =?us-ascii?Q?iqug+JZEIwnXWFRsDiCKRZcHr1FFlyrpeoYPzywFmW0fAqKGGlqxc1ZJIbGG?=
 =?us-ascii?Q?iC/cgHQfmZKr8NX/VrK10yGCwN+xfM1fXSAUV2PpZc6PbuOb7k589P2ckJif?=
 =?us-ascii?Q?wbpLTJG/L3PsqGNRHD7qu7atpgzXOxkrAGP98LBhBtuZtAVxXk1pESm6xT7X?=
 =?us-ascii?Q?5qrQQ5hahfgtZs5ScTPa889pJq4m17xFbTb7Ega37go+EaQeGH49DZkJuqUa?=
 =?us-ascii?Q?b3YbwSJiIoM/ZSgzX5U6u60J1+j5FRf4atHkN1QUIyIAkgWXu/pCfsSMt3Dq?=
 =?us-ascii?Q?x9eub7zCvVLrgNKeP3WP6U8bTPVbROr1SwYbYQ1QwdmrZ6szHsMDcA7mmk5q?=
 =?us-ascii?Q?Mzz/sj6AiGtKR2OIWsTcMZ47JpAoh7yK/xoSqMCv/PlJGfCt5JqGWFu7eYi3?=
 =?us-ascii?Q?ckWNp9b24TahUXPJ9wRCahZKJaADT8Yx367pbKVgMGFlcxIQogWX0Gc8Jjsb?=
 =?us-ascii?Q?NM6o2Gt2Vts+Z6Vyj4q6U3l1vMW8sQ2+yjbuP7moz7XVuTcKqv4YoAmlEacI?=
 =?us-ascii?Q?dtUvxCCyP1agSm11pIfsYXM1Fm3mZBiNShrt9niAN2nA7zct08g2KlvTBVIh?=
 =?us-ascii?Q?E8cvW4PDKbjmYjqxvEiiP0bF0GQqHndSvImus7ZrUqO5M9fmV2OOaBBaBi4g?=
 =?us-ascii?Q?oFyd/DelMX2mjJF55my6nTbc6bionubOJRytHHxFcsyXAnbSkMEgglxMl+0l?=
 =?us-ascii?Q?r+q1xI+mvIAujuAabUadhdcX+T/l29vCmO/g4qaHAD6COFVoHaLhtlFjsKYS?=
 =?us-ascii?Q?kRRAhXiWFh/fVGE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:22:57.1557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e420f685-c771-4ccf-27aa-08dd46b9c0b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6468

The absence of a compatible property caused dt_binding_check to skip
the zynqmp_firmware node.

To address this, add "xlnx,zynqmp-firmware" to the compatible property
in the example section for the zynqmp_firmware node.

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
---
 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index 9b6066c7ffe4..2b72fb9d3c22 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -116,6 +116,7 @@ examples:
     #include <dt-bindings/power/xlnx-zynqmp-power.h>
     firmware {
       zynqmp_firmware: zynqmp-firmware {
+        compatible = "xlnx,zynqmp-firmware";
         #power-domain-cells = <1>;
         soc-nvmem {
           compatible = "xlnx,zynqmp-nvmem-fw";
-- 
2.34.1

