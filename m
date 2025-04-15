Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021138.outbound.protection.outlook.com [52.101.129.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6192750FA;
	Tue, 15 Apr 2025 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702055; cv=fail; b=XrSR4e0qBRRO9wCKwvs+ln4hb3ZL6VIFz8TM3HKsOh9NXxxmd13GvrOvbC8GuZZbWcDO5R1OCNwR1+nVETtnvTIJykoK6jItv0EwyvKMnXfykaN0ODPzjdm2WgYEI4MPBa4H0CNF8Of7hupOUrXJBLtG0nJbFtJTeJmgXwC4o8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702055; c=relaxed/simple;
	bh=uCgAbJUrbrKPODT81r+SpemrNWM/CwCVXtvmwXHEUqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PkQ6TR0ZGEvfojjvmRzCF/qP3OI6JWIjxCXILmVlL/j7UlCXDSl+ieg96FDvNpWw9Rvajfg4RJ/goYdMVViXwbPU41CP1jidRYLzKJm1V7yeA2coGKIHSIzE/uhzUdm/xni/JTjL2sAR0iQ1F1RxjSwj1ItTvbrNKbyYFjhneCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.129.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlp/KEzulEJP4C/B38x2M/oC8pMQR8bjr/TSlwSAuMx9za948AVUAXVZ1CT476GI9GdZZxY1fjS9xZLrgIXU5S1CwgFNJ0+xvS6CN2KJKQbvBYYjhWsLrHTZfBTHDFH1KN54rW4X91r8ZHAt7/WJg2QWhoKKmiygTatT0hspmhSbYXOlJPCoIyjYqgFDbdme2+NMmCrMAMhHIxlWmycEULFnH3mW9qS2VmXdd2TU+lluHfWqnIefzNrkgkdhSHeJrH8anGqBVD1zrgmhDZ91OBBcHw0VVDgexqEifGdd/5gSsSFlH2bV/hrftnha2ijXrzTkxhAYAkxF79Jy/WQ//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGAsFNdxte8tu4ttXLyfmzNVAO7DuZdWWR6quZshwDU=;
 b=AlMPxzkKLByJA5nX+N/iT+2dSELji6xdrQWw9HM3foPZ03zDiHFxidoCJlMLLvNehYYrAHf7hDvWJfLviYlq+lZoEN5qN44s2NRMGe4hv6cetInlvCjGZn5ej2nVMSbod2qccMq8icAqRze8WH5kXNpbjFlwBLQz8oppIGg+yO66GJX9mbBC5TaTA6vW4x3ztmvykyjfMeiTtdf4EwRZ67kRtOnqhmh91b3iv8EPi8q910X+6vtyN64tkZYKMSLwEZKzSMYNj3tjQFmpHdQMUrJzM4xaYT/wLJmfcY3Hu1Msz/TS9k+M/aFdH1xonZ103B/OfTAfOtGsJi6KZBdZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0067.apcprd02.prod.outlook.com (2603:1096:300:5a::31)
 by TY0PR06MB5457.apcprd06.prod.outlook.com (2603:1096:400:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 07:27:27 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::e7) by PS2PR02CA0067.outlook.office365.com
 (2603:1096:300:5a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Tue,
 15 Apr 2025 07:27:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 07:27:26 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AFDC64160CA7;
	Tue, 15 Apr 2025 15:27:24 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org,
	robh@kernel.org,
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
	kajetan.puchalski@arm.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v6 04/10] arm64: defconfig: Enable CIX SoC
Date: Tue, 15 Apr 2025 15:27:18 +0800
Message-Id: <20250415072724.3565533-5-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415072724.3565533-1-peter.chen@cixtech.com>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|TY0PR06MB5457:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 28745828-32b6-42d5-4e34-08dd7beef92d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ns8dtp2MzGbRREqF1m476LVYLQ9v7CMHsYlZgYALMaCukF6dIgdrb1GNXEol?=
 =?us-ascii?Q?Jn3PxVIvtez3QVMaa/SuevKLQjYCOtcF+vPJzI7wyjTWQuhhmTDUPBkTsyzi?=
 =?us-ascii?Q?htJWswPSectJhCVVfWnCG0pTU2TSSAPWCs3mvWTLYBiNc+njz6JOIcf2aUKP?=
 =?us-ascii?Q?9CfR4gad3XmoV84cmLuP64+DIycTbnBgK8r+QY2HyjuWIWc7k8tKKDzkfXUU?=
 =?us-ascii?Q?UJL5h4pJbSeAXlmYB23V1BF3DCEP818H+An7A3/OtdP+Y4puRt7+bGMoAK4D?=
 =?us-ascii?Q?YQ8ElL/gtFZ9y35UUsGNZSdqIZT5/a4pw00bKmsWm8RQozu2T5nrXteGqy71?=
 =?us-ascii?Q?5jca1evQq3zqnFmJ0eUXJdgTG3ZmVqPj4+1YGm5qHUyrwwOJNfLIVdRiL1IU?=
 =?us-ascii?Q?2aQoID1WEGQYOO8W9HFw3PpmKJeIykQMPYUmBiCBhF1gEJ18qZKNklBFfTw1?=
 =?us-ascii?Q?oQuRyp9rwDmMXOEiWLr3zDOm5SD81xGpwBUQ6W43JMz/kZk32AsM79kzmLyY?=
 =?us-ascii?Q?9huePY0bk4KjuKorVBdsBb/n8BaiYTGweTOyMAVkXRrBYOAhVFTnxzaeb76t?=
 =?us-ascii?Q?7LAbNtZQMRcQ+CEZkSrnq0fKmg+BOZriwqr1qd7QspIdFAmLkQEV2fqHvwYj?=
 =?us-ascii?Q?SMmeddrKUTOhLuhhrye2ey0k8ZLrL3HaHYRUNtVJMf5kdv7+PauIpE1uNdSC?=
 =?us-ascii?Q?WTz6Fuzg7+D/i64Wpqd6cCJMOA199GAVp+hr/XuM6RIHPsKb/gDTL2Llj31g?=
 =?us-ascii?Q?O4Dwv+JeJ8WlV7i5SLN/wk1hxmdWCaMFirgcadDdaG/Aecj0lIOKWiW2sCMG?=
 =?us-ascii?Q?71kR/uiM0cA21Ld3SUvDD5FbSTj3Np23gEM5CRVU1PQ67joe7oWHlaMUJGuv?=
 =?us-ascii?Q?gS3Z1gV6ADB3C5n+pN1Om/9otKGkalF82JgPSmL0Edp8MVoKE+QsVFnJEMkD?=
 =?us-ascii?Q?QZdv1eObAEeGKGZDQok13yGIUtNgXDdmUjMLyWKWLP6LSr91QIzb0q8puTkD?=
 =?us-ascii?Q?Dd0sfU2FwZHWQ1IfLdIPqdpX3eMuarz96CkxyWvBlm/CTf37w9UOGh31GhM5?=
 =?us-ascii?Q?7a0oWLHhOQRPCa9tWuuCnvYoWd2HbiYPt0lf3PYTTm+ZkOqGKYGbjhC4Jzu9?=
 =?us-ascii?Q?0af5GffxVPuEU1LX//hnzC0KItnGt6acCCtdQvb4uQVRKZuVo7kUc8XhzEpS?=
 =?us-ascii?Q?L0pYuPFI9NWTgnX9Jf9tdTLWwlR2z5X2I0uuVT+KccBw4QxKESrX2YjBlP9H?=
 =?us-ascii?Q?bDVke7iLoo55Opk1BdfGxM6Zhu4EbpTzdqDN02bIBC/kM/AO6wXU3EgudLBP?=
 =?us-ascii?Q?Nn3GASqPlThd+xm7pCUC25+UnEk7A5YuvIRfBcTZNyPDO4rhA+Hgq8h7LNdG?=
 =?us-ascii?Q?H9q83Z4AEMh09pibtTEuGQoC/sp5zwAy+VWKSNvqUiJDc8fbytX2Ixlm7tg4?=
 =?us-ascii?Q?sLZ8a8cX//rRnVxA2c2puC+/cEluO7+CjxljoeHMIOGOj8BBpIrQCGzJ59BD?=
 =?us-ascii?Q?T4utLE9p0fIpMW+odlQbiwN04JYQFKt2Rt75?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:27:26.6751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28745828-32b6-42d5-4e34-08dd7beef92d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5457

Enable CIX SoC support at ARM64 defconfig

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..c8a8fdb0bedb 100644
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
-- 
2.25.1

