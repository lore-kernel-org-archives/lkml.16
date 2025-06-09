Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022096.outbound.protection.outlook.com [40.107.75.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D43280CFC;
	Mon,  9 Jun 2025 03:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749439004; cv=fail; b=llVUa9xENgkCKoOOpZD/JpnBpOY7K9kAR1v/yUVN2IV2YbAaCjVnJVWThbkijRHEKAyXHOrEPbzz6x4zJUjbARSEukWE3KFNwgXszm5/6LiV4XaybvafzmhhqEyOXgkY+NYKvtq4FYESD/DA3VbvFhFQORPmMJHSkt1slnSZUoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749439004; c=relaxed/simple;
	bh=edy+5ElxroJP4348TtrTlsmHY00vcCr/yTHX1Vo0B+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/I9zFLvYhBwVebUpzhyud9q1Nw76IKKKgveFKCBHGQ5pErxtqd5WVG2GRTDPL//MaiHrMlWtCMAmiNDBbzxH2US+XOOvrDgCJ59h4M9/gfO4z1eJ2WYkAsdaaBy+EB6d06Y0SzCuwCVwDDSzwfPn+RgZzLfZ5mDZVeYvKX4meQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OchHf4mxjObfPZooCgWJiGuvs8/4PZRhJjubG5w87RQFbO4oHM2vGs51wHj062rml3+6+hxCUtdoWqG0tzg6JE4svLm0d2kLdwAUp3tEk8g1oFcCGpbDc/sR/3Xjrmozw6wkElUiGNxHTeVWIvBXWN0ZeSKE6TwxLVdEEn26NHd71bh8FMzqp1XgZYLj7HlWovvciyoOO9FDlMuzj/HqLxbHHlFlhDv+OG1BdCsOBYLeKgT352Q1BT//QVIun05uxxLliODrJXvF5jaSATt1MQ+bp8dFefgP1eGALBzdtCQFiSN7/RhMnDHx6ifUSjuGuSRg/ZO6oa+KeuO3+YOS0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXzEBs56JYF3kuyf685C5oYk8b4lm1+jJLdzMsHhq2c=;
 b=QqywaCGH+I8XeUU1aMwjeYUEy6LfIYiTVWljx/fw7Gwk1pMraOAdVdMiEa62RBtdh9GW0FkVXN4cv7IyJ6eTsNDqNpDaihGyB3gEdARkYRoegZz+30JSHXkrF+oX746Y9y9MDEW6xIoHpMYt7X4CtQ6UBxfjRE7goHGC4May0POemchWYI7Qws+WsK+cSnU4G9oin8aAwRIm3uMOZKbcEE4L5NNoPcdyApmSKo5+FFYRaVLpxiYVQIHQwegilsyJzGMh/AGaHUlmfpnEyyy6m9357leN30ieVrq+omuDp7XaYU/fJozTcqWJYfaP+ZHrwJg9+kqS8uVLcjBChgMXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0049.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:384::13)
 by KL1PR0601MB5568.apcprd06.prod.outlook.com (2603:1096:820:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Mon, 9 Jun
 2025 03:16:30 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:400:384:cafe::7a) by TYCP301CA0049.outlook.office365.com
 (2603:1096:400:384::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 03:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 03:16:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CD9394160CA9;
	Mon,  9 Jun 2025 11:16:27 +0800 (CST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 6/9] arm64: defconfig: Enable CIX SoC
Date: Mon,  9 Jun 2025 11:16:24 +0800
Message-Id: <20250609031627.1605851-7-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250609031627.1605851-1-peter.chen@cixtech.com>
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|KL1PR0601MB5568:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cf4b50cd-1bf2-4e35-7937-08dda7040692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nOGokyO8PvUqzGFS/D1dopydAJheRHs+vga4RlxLYEyRcdiOotL97Ba7XiyB?=
 =?us-ascii?Q?7u+hpbRLqnbr8cyX+Cve51vIShI9TRNLb9QdQ6DOBwtH/DD6NPAjXN/Yf/z1?=
 =?us-ascii?Q?BNp5pzVhYG8AQe44B8ZNmJRJzP39kls+v+oM/c6KkA6tnqg6p4uFTLNRtL2R?=
 =?us-ascii?Q?4X6rhuPm+kXkRhhhx9us/b738YxQxqGQy9o6VaERRQaRvcWCvxl4MtvKJRVk?=
 =?us-ascii?Q?Epwn7+1FCCCWK20rYLrkcl5XBLTnCGFad9pk2DTseUXH9Bb5smMBNV8waj0k?=
 =?us-ascii?Q?At3LTD7GonTnRTS+ZWsqvXi288XvQ5u8FA9DLdqAI0KxloFQqqCYaMG/gTN5?=
 =?us-ascii?Q?7AzEF+vWWYDphAvmL7nch6E4z5UPK4Gc+mAX7GdPXxoLE1raeeVti4AePchX?=
 =?us-ascii?Q?jj74U+ngc9m5smVx4pwVfkDYoFppswflCS1T+xEuOZSHRjS0zNUVdU0OGZkI?=
 =?us-ascii?Q?Inuw5sttBVP3IGjBHOYkGbdNsniuEElDwyLn6dz0q1nQPhB+7py6iw4YVvLp?=
 =?us-ascii?Q?tJncHhOw9I8QzZI9eEID2wuF9XKdXr4NdpT6qtQ/k1zTF+GD2zOdan/ntMPg?=
 =?us-ascii?Q?OiCtNdoFEDEBqs3sj/pywSB+PpsEKS9depxFwqhHmbu8OJsY2RI5SmzmfgEl?=
 =?us-ascii?Q?ES12jTUnHjAKoDAOozOei/nzWTm1BspVQNlvLI/6+0Bkb0g1GuIzq15S5Ci6?=
 =?us-ascii?Q?uY4r7r7w/bjYrUQfAWThaTZaR5Oc3edk2hXNc4BwwZL+qoIfwPYXhP/n+SV8?=
 =?us-ascii?Q?T0/vhZklFxxYSdfSL5nKNtAvEJqDbFdCkXlUdl/UP3f2+XIoMQQ4VFiQQWWu?=
 =?us-ascii?Q?yDhHs4WEau/n3wDW8cKmSc141ZatWgrZ/6hY0BSE4AQiEVJPGP25tXA/uvHF?=
 =?us-ascii?Q?/djxPdpc7PaynIkMf81VTWRrIbECH1EYYvnWOr4UkfPc6QOA90+9mBlYHR4B?=
 =?us-ascii?Q?YIpxsBIuMX7Es3eKp4aonPa2aXm279YpGaDteS0JhdT0CMGlZ1GysrM1dlDp?=
 =?us-ascii?Q?XM5oo9pkRlMU+d1t0IICQ2Xoc12YO0JY55jagSY/4Kgz+nZHcVuCwfS64owT?=
 =?us-ascii?Q?wOL0CLDha5DprH6qWQI4CLZ+4e2e2b/CsFiOa0hJN/NIZqXMT50GWKw3VEgA?=
 =?us-ascii?Q?/kbK6knhGYn0fTJrrXSuqsInyWUY96ouQ313WlhMEXGVLi7EdPDh9FaRf1L9?=
 =?us-ascii?Q?DABi3AGAYFSlifHIwpKADc8oXhOzA69z/3qF4JJy3dGyD/f6WW4g5tqzFwcS?=
 =?us-ascii?Q?FP25D5Jvxl74+0qUQEAFhC7EMy0S92RvW24hv99pjyTTM84xThlF/83WoR9K?=
 =?us-ascii?Q?jsGWusjOf2NRqcjPuBf5lepLLHHi7OoycpDrWabuZzVkz6LuSvKh4/Vr44fg?=
 =?us-ascii?Q?U527mkZJdW0TE/XjvWMgOAtvUCAenraaTsuwD3VHmfb1WBDLCfbxD8qS2WWh?=
 =?us-ascii?Q?YFQh1PL+snmeGCpBDNjrjr1jw5toGwFnIkeLZ2oEirkkyut2ystRDCWs7tdE?=
 =?us-ascii?Q?Bxdns78BENFq0nUDiTpzlbf0TYUzDtHxwYTu?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 03:16:28.6440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4b50cd-1bf2-4e35-7937-08dda7040692
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5568

- Enable CIX SoC support at ARM64 defconfig
- Enable CIX mailbox
At CIX SoC platforms, the clock handling uses Arm SCMI protocol,
the physical clock access is at sub processor, so it needs to enable
mailbox by default.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v8:
- Add Krzysztof Kozlowski's Reviewed-by tag
Changes for v7:
- Add both CIX SoC and mailbox configuration at one patch

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..181c5f91b032 100644
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
@@ -1445,6 +1446,7 @@ CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_MTK_ADSP_MBOX=m
 CONFIG_QCOM_IPCC=y
+CONFIG_CIX_MBOX=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_ARM_SMMU=y
-- 
2.25.1

