Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023124.outbound.protection.outlook.com [52.101.127.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A8627467C;
	Tue,  6 May 2025 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522480; cv=fail; b=RGQBx2YIAM/bdxVRed9eBme6vYA3YJDs1xbPMQvvNg7krxRtOvtIRjV/siVo73WdL60EZP6Yg8F86A1cZsBJ0zEsvM6C9b5ZDFGurgiXvzMTLA0xXPw1qgKoACDlMJX+VHuUF0k0J2eM4s+Vu693iGw7pZrZvp/CjAJDkM2qG2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522480; c=relaxed/simple;
	bh=ookEEVVPxGGz0GzooZW2aGyy3lAFuIRmAd5/0JUZw9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQGb1NDCcqyXXwluHvbaiWm/O5tMYXmdncPysJGFyqkzRLPLC7JnLJDr9Wl7P+opopYxB3naBkPwzHWopdKEJOmSkVYEnUjAzM/iy52Us6WEcVZp5AMo7kSFVqRGDQGopgkivsarWwzOB6Rozr3CLbD6QMB7vxVVUH/m85AG+yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1eCfH6A0dEW+GclxlyOttM0BgwgavW5CdvcR2I6Ek1rnRr7uNYqN6iptkNFLWD6n/r5V9RrQYnA1tBv5Co9+IpIBW0mef/Ih3mD7z0sJ7UCBOttpW3B2LEevyaFjAgUHBTH03qAucrKCzY1JYWry+BXLM6Ev8NeWB+bf7Xu++rVRJ8jntOzZ1RYC2mlIecsX+EZK8FJrHvZlxUzR+aUARWH0mD9cZ22p31vWOX7Yon/DKV5mDr5RGksQLxCeAv7dd/X81edtIRSI3MM0ghzT6g66bGnuE8hz0wVuFxV/Mr/RbVDJuD/Nr53c9R4Adxc97y4CZucWFiLxfAgN5oUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVpSZdDFsCHY8ZMtKH5F1+nDRJuSrIJos7FNpfoAwZg=;
 b=f8Ykj/rso3HlMNq0d0XWXIvrvJ6/0/Mt5IjmCRUkkl9R1gAm7jT8OV8SaMh0D/GZKyKRU2FnvO9o8hopHKs6eRI+fTWQMOs6Fs+8+3T5LWrLg4kQ6un6wxLpkt1PcRD6MRfahS/p/Z9RK8mImVZPoP45PPUk5QvRPFTOZ+6RiNwD0I497XML1PpABiciEeqYctSJS9QwblFfmD76uf4V/Raiuq4RJhZfT0KwNeKanicviFrLsa2XtHs/135wXJt7ZjbEnPfSHeO3A09VxhTPfB1Ino9LkDwk95mSwh7cY4F58NHlZ8btz/i7cW9otLUpx3lX/io/lceHMb2/6VrMrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0042.apcprd02.prod.outlook.com (2603:1096:300:59::30)
 by TYZPR06MB5842.apcprd06.prod.outlook.com (2603:1096:400:28f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Tue, 6 May
 2025 09:07:54 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:300:59:cafe::43) by PS2PR02CA0042.outlook.office365.com
 (2603:1096:300:59::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Tue,
 6 May 2025 09:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 09:07:53 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3ACC34160CA1;
	Tue,  6 May 2025 17:07:52 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	sudeep.holla@arm.com,
	eballetb@redhat.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v7 1/9] dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
Date: Tue,  6 May 2025 17:07:44 +0800
Message-Id: <20250506090752.3695666-2-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506090752.3695666-1-peter.chen@cixtech.com>
References: <20250506090752.3695666-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|TYZPR06MB5842:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6570d857-0ee9-4bc0-8419-08dd8c7d7bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z+K6jWZif+r4tCpZe46watRiz4llOMTfoux+yOfFSWndXP2feZRzU12EjKne?=
 =?us-ascii?Q?tLQ4bAhLhkPayFrPSsj3A+0SrVQo8rV1FNHiJU01ZshdLiysREDVK+InWBw5?=
 =?us-ascii?Q?9MM5sDNBBtfC6n5XoTSesDTW38HH6q4+uib6PBXo/56n02H1+ldXi4wUqT0x?=
 =?us-ascii?Q?tCRGYev353RPfS7EC21XWPSZUaqZrLiqN8SAhqpz84dOEAKVWI28Zpgll0L5?=
 =?us-ascii?Q?5LVDXvfmxKFQ/WyDOEMi+CpxRHK9U3WdHLoinDkfi6jf5pUSSGW9tek3lqUm?=
 =?us-ascii?Q?Q+KThm4qPhCVu9Ax8Pp9p80p+EGZn7KADwpqZJmoPqIz3d+UV7mOFkvbCMoB?=
 =?us-ascii?Q?h821DXNNV5qTprNH1aOQL6fzlmszW8XxdOKmDqN4pHG2T25WGc7z+eXyLruF?=
 =?us-ascii?Q?wngWEAb0qGoBYP/g5ifyCzG3RG78J3L/XdDsWUSknX1cHCjhDRElNn5zZiuB?=
 =?us-ascii?Q?G5RLnYCacUNh+nmSx8oU2OZ0Oi0hEuPSuJ+mMz1GJfe9jCzKXXQsfjkhG4xd?=
 =?us-ascii?Q?sJsby0R5kZUrI8WTokPbeGFar1HeQY84H9unj2kVMe4NvBM72XLbHdScEsBp?=
 =?us-ascii?Q?skKeP5OnyC2i/tsuJYmPVAMp0lJ4rnNBAfSLyzYxHIagxNiWJEQmYlfg8rbU?=
 =?us-ascii?Q?SfqI7NQRpP552lnMDeIpt73Be3gkdYtrIo04tVdUzRqh+j8eDpy0kmjtFEOF?=
 =?us-ascii?Q?pssvuN445aCi3JcS6T/Ex8S6nDNV//QLXLtpuK63EomCT3nADPGuTpZXhhrY?=
 =?us-ascii?Q?OBd9wXHS8RL+zppM/+Tfje2pswgivPgVCXD4d8IEZ77e/mIfZHCB/5Ad7YOg?=
 =?us-ascii?Q?CuVXxdIZfXEGrUCHr1YOcmBKqVLGJBIAi0WLHyLb6lIrSa4bfV6EpcLPPosm?=
 =?us-ascii?Q?jS7p3Mi/XYhAFvJ8m4n51Qv+n/UelHJRQkC+nMMXUtREqWGCWelF9pvXdnIS?=
 =?us-ascii?Q?iz00lDC/OokhKpyZRpwFI0dDda8bduYYLh5RbcLi6Am3ON/VxtybetVflwat?=
 =?us-ascii?Q?zFOnGZRKk/BNJ1RFpVHbkgcrQ3XVZo1qqUVp6dfs0q62fk8b9DFjD2cUuZu5?=
 =?us-ascii?Q?LajhbN5fNyvVlk4dzuYjDOplAZVv4LEW5R1NsN3gUnoAcUDNGr74OgPnn57t?=
 =?us-ascii?Q?QhpMWyF1+ZiMoNKr1WLb0K9Sc6fE04Yq9g4geQotblVXLnmfuRO6XAJvasFZ?=
 =?us-ascii?Q?uUEWCB3PASBJyCAIuzaYOutxljh3+kFk94c6ySq94mDdEHlNrL6rZ7FCe0EI?=
 =?us-ascii?Q?tb67cgRz62SwE2KDcgj3zmkyaV4t6fRFuo2JYXiJhFCKGodZxOWCIqhzQeOL?=
 =?us-ascii?Q?cU48URqrzeY7F1G/KD9bIiSqpEDYWeRKdLQXdjhZem0EDFYb70hN6qLX4bRb?=
 =?us-ascii?Q?Pm6CUWGFvS4X3a2qc1qYvIIuOb7veUH/hYyRucUtTCEhcbNl1ewEesAKbdv9?=
 =?us-ascii?Q?moGeJz7GUNNWXqcfciFIROj/wXEimYmiXCyFOaqznwuCKEzFSAGKiw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:07:53.0377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6570d857-0ee9-4bc0-8419-08dd8c7d7bcf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5842

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

