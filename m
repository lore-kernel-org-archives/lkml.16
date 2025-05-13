Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022092.outbound.protection.outlook.com [52.101.126.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896741A0B0E;
	Tue, 13 May 2025 02:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101819; cv=fail; b=uL2HunvQO/3eKhYWbIlfCjP/mVgIs5mK5pS3DG0JuLzPsnKMVLuTTwbGHbpW1OUylALAetImMKSZgu1VKnbZSVSFZqUkR2cpg3G/M8obSTAYbBNkbpwfNT6Ua6+q62K32x/7lRLQ6E+YZOQMR/iAIzoIpzhLMAdrO57giiVEICI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101819; c=relaxed/simple;
	bh=hp71N8OtYPO5LqZ5JA778WTF61qeUdiPrrpaQsLlULM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a7FtA+I8o6xPsyWYDKirJMgsPjEIa/1xhRI6XRpC24jOz5huxm04w+PFQiBlKYcoTkUvrKCDZJ1lhlL4OUdeJggnx+JQmZ0DogkHGQ9chG2MvAJGXpvTMpubVIrH3Fk0iOK37hzqKpRvg/Syn+cm9RlluGY2QGUwnXDZd9wRlaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrgJEYEXtUTeoS3pr8+XofrxAn8B2CLOAHJ4reYw3Xzb9SzUKho3wpcCkXE5hebeMmH8mODqiuIxaBRM7sLgHI30LqMUMgcQAkPHojlo8yQarK83R73ztNvTRhYPxyxuH1EiaNQQng76EykyGoW+ROj+lIZKAtkYFML2hYo3kGzGwKECSyI+kKf8s1oOCwgPUIbsN9ZMOaMvNkLpdUtjtH90en0AfEqLbDtmH5QiujvMG3jhIfP9QAn5EM86pPVt5wGB2YUpzJuWNEzqhmEJptA05fDYqt77abUPO+c13f/gob07WcxpSiOhzo3cCVPnHkuZDl+bx3bIO6gNgfacbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7Vb2M6Vv3ns7R73+FVNtzWqUp40oER87sH6/Rueq9o=;
 b=Dw6sZT+QideDTMiMbhYrtj06BjVTQq6toI44Spf3JJZBVV+d8jGba9Z84q5PYUIcuOroSRY7ZuEv/66Qyifdc1j27I6dKr1/V5M/K3FHCMDSXGz+m3A5VVgNL6YfKRBZwAhd+dMuPws9u4UZiSlhawMaFecopIZRFzBn8w2LDQMkwgFDzp0SHWtBwZkT42gSK8661h7SLeSzE+H1z86fLmRceccg7gfn5Ag4Nl2ZF80o+7agf1IxsB8v5ryuTOlDTIe9T4CzH45dsuxGxEWWHmfBMpsoCq06D0lmfWY0tcqEVTkTdAk1NHZuQ4vU+2WQClfcPrnJ9iyN/9oBT007yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGBP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::26) by
 SEYPR06MB6522.apcprd06.prod.outlook.com (2603:1096:101:169::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 02:03:32 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:b0:cafe::df) by SGBP274CA0014.outlook.office365.com
 (2603:1096:4:b0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 02:03:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 02:03:29 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 93ED74160518;
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 6/9] arm64: defconfig: Enable CIX SoC
Date: Tue, 13 May 2025 10:03:24 +0800
Message-Id: <20250513020327.414017-7-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SEYPR06MB6522:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4a11ce25-84ef-47cb-32e1-08dd91c25ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q8EvEYpcXKY5lBYMl+CjFAeBZi1HTgjYbw6r0Xjnn/VfPiKlcbc+bCwFJuNN?=
 =?us-ascii?Q?EWzY5eBpNGpOLOiGNPGzJYnl9eS+hN0WLIIz66WD2fXdXrsktJtRERkM75sS?=
 =?us-ascii?Q?V2H/QiL/xfqAlOzp4H7wwdgPTilqSyfIJGpoZCQ62Mhv5ZKbqx8qx48NKdDq?=
 =?us-ascii?Q?80gizxn/vJaBaxhdHL1xVo5j7p57Im8KzuAeJT0Vo7EZuwnxfVhwoAZLEk/i?=
 =?us-ascii?Q?Us1+70h0bz5yc3OLgsS60TjptfEmAz/G23FEFmcSiSKolmCwbNrpwB82lIrP?=
 =?us-ascii?Q?Ttdj1CH/NnduDpS9Lp4Mflsvu4ngELG3EzX0UL2LaGz+dRgeVHTlzzYeyUiK?=
 =?us-ascii?Q?Ait3SBwdJ3DhIQcsWdmW3TDuTjJBg8FOZrSgGYSKg5v2g4w/HsXXqE9ZsNnj?=
 =?us-ascii?Q?Ibype6H+nKdIRkhd5kWCfNFrgb70TMJ2l+vKWwEfCn+pxZX2fB6TOAQgprwt?=
 =?us-ascii?Q?RtTF/2Yh2a6LX176wwQRP3+qRNVB6kn0d7RQi3jvuA/dlQCCUDMMlf+74Yrr?=
 =?us-ascii?Q?o1QjOtbg7GhbO8ruW5R8A8SkdK74J8KYYc97aTEN9bExhNWuISMy3mi6ovs6?=
 =?us-ascii?Q?Kq5DfgpKW9zmRcnrWQ90GJY5qGp4aMIZhLRRlSfMuihI3760jU/XaC6uOAPu?=
 =?us-ascii?Q?NT4xQsb+SeRAPvnMpsNhoLwFCv/P8MW8EhUeFUVSdDlHyPAvAZdelsmRhnCR?=
 =?us-ascii?Q?j4n1Cn6szKNDACyQxW1XSfJLXPypbHnpJcJvb37rMLpoPvCjvQMYy2LRCZxP?=
 =?us-ascii?Q?5EE0NmY93PNRYshO6Ek8IpOTyYJOfGjGK9Q70lxPeIwCuTpSvaLw3JcQKdeY?=
 =?us-ascii?Q?eAZihnKrYB40y5HWIu4mSnaGFlp920kRv1tjFHW/StRJl+NObbGFSovn00+1?=
 =?us-ascii?Q?AiK0vlQSxy6wDcJZvw0QUeEPU6EH6aiHIs1W4cFqLYv9Np3eSBT22K+pI2jK?=
 =?us-ascii?Q?b0MWU2pxxIDoWg+rZTBgHJGTExqSUXd2NlW3FPi7VWQGiJ5cXyUmNtb5Up96?=
 =?us-ascii?Q?GReyEkpnbOt4+5ORfF+OcuqH4ShfWIp9GGZ/It+iPi0E5JORVzxVm9B6+lm/?=
 =?us-ascii?Q?20/TfD3WedtechhZyHkNDOnCISkV0FJQCV8Y1cAFjliMDaKOx/+mfxhuFJ2d?=
 =?us-ascii?Q?rXV1H1k4vZSVcS0NGJeiRsCJTaleLYj6PqIbQyqXXJnBnFudAXVpEZXKdBmp?=
 =?us-ascii?Q?7htq+sZjAxCkBeAEbM8RlFyEqD1evGHRo7sJcKfb+HCxgMnJCKo8APDmX0ZS?=
 =?us-ascii?Q?p0yqMPrXwaMhZwtB5uQQmsRjsGU/AbS/mFeeYQghy1jsrFPHhHVAWItP/Gnb?=
 =?us-ascii?Q?HU/GzQcbNLWOwSrS4qWpzzzGRTRvId2nMlGZ3sHPukynbeKobDEC7ZGmM5FS?=
 =?us-ascii?Q?xmjv6BE2998R8Qs13zMctI/UZ84GxVDOD337eaaIb3Pl/ucAGsSofdcRpDOu?=
 =?us-ascii?Q?+ME3aB8eYdl/oSk98geWX8TQCOXZSuF1w2Vn2jJHq3rVKb7XS7wIC9ZcNWCk?=
 =?us-ascii?Q?Ws5LJebMzQjmil/b/0D5q+qQJ4mqRB90ktZ3?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:03:29.8565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a11ce25-84ef-47cb-32e1-08dd91c25ba1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6522

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

