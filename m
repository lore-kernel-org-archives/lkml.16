Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023085.outbound.protection.outlook.com [40.107.44.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B0927780E;
	Tue,  6 May 2025 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522483; cv=fail; b=koOa9YFtqzEhsL4GqNl3TBORm13EJ3HwA0v8uTINSNKXqMkAuJNhdynVXfyLCfxkZyztrN4RwG3MI6IgfvNSWVJQ+ReBXqmb/LhkByxJwkQpUemPlDhVHSxFt1KNJMrF0yNO6kySQ+HbKvArWsGVjhN84VibePl9VEWScznwMfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522483; c=relaxed/simple;
	bh=DNYizCvaZ6i7fVwuojFYWz1orJJTT7xhbzT0ypr22yE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FaHllvFO9CUh8cPBmn490L6iv5/VeSiVFlXDFmZOPh7VTeaWlK8i+j8nQdDuw47f+m9yI1f0vJVgKagWgp45cRzZ1xiQBP+CmIpPzEE/7VEys2MqrkcWMHqYhpAaCQz0XnfhTrbuznM1/VBJJQlHPcFr7fqFeM4r5cWhzV5VaPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG+eoFgNKMmJdPqOb4Rph+5ZmIyzt2qMyciGALPhLc5ZIoU9CsOc3nsRQnzqcAu1dDoGpoRM05ppAmOK8nFD/5+HITurJLDjpqZg9ReJvPTi3yXBYdF51qouZUVR7iju8oSBWfXf2CZJln1ql1QzA/juPjj3P63y6yalM1PFf3ZS1aRPZS8PAGNdMbNZ/11waYjeXXdyqvZbp6cSc0XA9EJpeYbKqdIGK4dq+1j3DPbZs5SygSzNPW13jU79+zDr8V9AqOQp2uChlEp8FppyjkJ+ouoL1ZHw+JMOV2tZrTA6+ZKHSVPJL7TsgsOWlAQD45kW70hX760Sbc+PZhVofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1oCys3d8NKlQhxZmLaAz+O3aeymKPZkXfTaGXcfL3I=;
 b=Kpn1O6LYrXbwboXCMERqHZYWW/ljhdx9DaB0Qe7NkJUUnQ3nw0EsqWDu8HH4U8m7kZqZnVZw1VDPRm++kr06TfnUv6DAMswQgvNBHV5wxPFdUFIG96HU1MCm77zPdiTMhKOe/yAnoGz78eDmeo6/dc6i92SzSddF5O3SugPN7PkpyqNMsJ60iPCgq7d96HL0UG+kxcyMuDOFvFs9iIOB97bctPKZ2KIJFWi6QIlCAZEhgHyQee9ZqbpN+jFtPzWMVG1efNDWWqsVKUdYkGMiZ1BcT54s1AUld/LcmxhUC5XrPU3y3Gy1OOUJVl1oTyltL7Ijm0x7uZ3zk7/Gd/922w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0116.apcprd02.prod.outlook.com (2603:1096:4:92::32) by
 TYUPR06MB5979.apcprd06.prod.outlook.com (2603:1096:400:356::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 09:07:55 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:92:cafe::e8) by SG2PR02CA0116.outlook.office365.com
 (2603:1096:4:92::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Tue,
 6 May 2025 09:07:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 09:07:54 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8BBFC4160CA8;
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
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v7 6/9] arm64: defconfig: Enable CIX SoC
Date: Tue,  6 May 2025 17:07:49 +0800
Message-Id: <20250506090752.3695666-7-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|TYUPR06MB5979:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1c7b1920-0ed1-48dc-bde1-08dd8c7d7cc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+X7Dq1CAUtMNy/lZxFlkzdLTLPemV/kXq4ZoND0cRk9Y0pqSoD2aaDkI18uu?=
 =?us-ascii?Q?GUTulvZB6ALXAQGTXXpTjaLEO4GJ0U4ovWygQR1BSylQjBtuVfBqNX8TT1mD?=
 =?us-ascii?Q?dL9fr+xgPAd5aOzXTmOIKu6v+enlpIak+8Btm8A15flJP6URnkswh0tqipcN?=
 =?us-ascii?Q?IGyDe9/sX5P8aDOs4aDVTULg9EUAp8Gki1+gcNG0snD8t5/2M1aUlq6bXUt6?=
 =?us-ascii?Q?/FCMQZY1Xeb/1XdTssZ/IsdQ0GOdHZ/Df6WEOmDfnpDN3sShC8cTdKO98pDC?=
 =?us-ascii?Q?Mv7KrAJ2CUCrll3NJhchCJgrT0N/PZvXx9dozYvtAwzJlSkx0ADXNB/FfTbk?=
 =?us-ascii?Q?Fl44/LuxzqCY4xC4YvnqwGrW0f57WA33kWdDHFyNDhz0sA15L6JNQnHHQP0A?=
 =?us-ascii?Q?v9R+mVFZdcmRNSBewxGgrnVoxy0kMr+Mxw9p0zVX40GqS5j859SJeyutoM9T?=
 =?us-ascii?Q?m/vn4sRXquRyQ/g9pQ/ZXCUdW4gpM5CSNWaxFyOEk+7bWDvwZI5LalkQDGdq?=
 =?us-ascii?Q?iHwIVWGVJB5szGFrFNCPYFy20kYOKo5euOEtqmT2gfLyQCgUQVEsNIgTF45H?=
 =?us-ascii?Q?gNxwnVlq+FcWQtLa5t4oq4ajrKWp4sNDmQeqEmPEZ3SM61ChBf9fDuraQFsg?=
 =?us-ascii?Q?/SBUc19N8bMg1Cm45kbmwmfxWrDYCFduM/nzkpuFaV4HFzMBUu4JdsPGsY2C?=
 =?us-ascii?Q?oaU6NWs8zV9SPZvN2e0NzCsVWtTTfGgWJy05epEUk3MiK/a5tJT3YpQmaseJ?=
 =?us-ascii?Q?G69SmShpVUhJG4GFs3PiBDQAJJQgAgyW5mckQv2qcmh6EzN/WnvNjIjiQb5x?=
 =?us-ascii?Q?y8ZJu77pJzsn+/BwrbrEC8U1GuIuq1QhAOPaDA5RgN6xbyA9UYBwWptfnYFr?=
 =?us-ascii?Q?6g8At1UuslXkY/JdHODH65CEPp6rjmAkNCtGG+VcKRKUAWZbRbfZxYV0ZL8H?=
 =?us-ascii?Q?Eaifr0t+Q2DoMvYqgEUw/MBBRY167P5XS16drxr5H1PqtOm0khOsmSEg4LrV?=
 =?us-ascii?Q?9lCyqApdvWqWIxxKWPkPpJtlv87d/zcB87V9h05590vAoCXG/VB5dSYE3qDa?=
 =?us-ascii?Q?2eokFR+1WjIHtRqe/JtAh326ZniPOODWkNgigkVftlJq/5AmHRN/t+Tl5nOk?=
 =?us-ascii?Q?KLJHSYoDIGVmbFmHUtmM6EJax0TCDBBkF/+7SK2qLeGl//qemKRPEc/0ZXUH?=
 =?us-ascii?Q?2tDdPbxTghh3WftZ95SOQw1TM7QwjrHuV6qSpUir+r49fA9V5cEkhgBX+Oqm?=
 =?us-ascii?Q?SBEBKfgrazefEc9PFasK/Xjf0MdVkdSjLbQ2nCLI8/Gv072xv4KHCQu3GedZ?=
 =?us-ascii?Q?uXCmNayNMoO/R+a3X++hBo54QlWWn0IbbrMwfoYpOW31r9bM7Eq0JU1QOVBd?=
 =?us-ascii?Q?2hTeAeNL4vBd5hi+kWNhdXfXiNJmE3BMkWu6w7eE2s5rXQp52mq8ckzZfwPo?=
 =?us-ascii?Q?2vSDkRQtRk5OsQDT9mCLHYqhYValz4qXYz42ntnllVnmSbkLNWts66HN62yg?=
 =?us-ascii?Q?usQKRdxJBkIDAw003/aFqw/jk+C5qIzjQj0W?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 09:07:54.6943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7b1920-0ed1-48dc-bde1-08dd8c7d7cc7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB5979

- Enable CIX SoC support at ARM64 defconfig
- Enable CIX mailbox
At CIX SoC platforms, the clock handling uses Arm SCMI protocol,
the physical clock access is at sub processor, so it needs to enable
mailbox by default.

Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v7:
- Add both CIX SoC and mailbox configuration at one patch

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..4e9805c5bcc3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -45,6 +45,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
@@ -1423,6 +1424,7 @@ CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_MTK_ADSP_MBOX=m
 CONFIG_QCOM_IPCC=y
+CONFIG_CIX_MBOX=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_ARM_SMMU=y
-- 
2.25.1

