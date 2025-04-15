Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021097.outbound.protection.outlook.com [52.101.129.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DEE27A107;
	Tue, 15 Apr 2025 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702054; cv=fail; b=tlhKFl0IlegEO9GLmkDpaT1Miy68IhrALBkMzEk9HAOLEMVpDWUTCV+/9B6LQwm2G0yAe+pwQVLOFlDtICZwo2JVShQ4LeYiivm3JIsp5cAQZ7MxpIQ1jud32GAPbVI35LWrTHW3+tpPX84W30iSPDeQ4XIzb9sk7kdw0TqJ8cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702054; c=relaxed/simple;
	bh=5SeRziumrZIN9x8fFG2CCr7VJ8dr4Oo2W0PqGx3FMlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T64n08ow4nz7sECmdDUIozzuBC/SjQTAUl59J43VhH+vqPCnH2zfWHZFrRqATcqwi2toLNACjsRduu4ZparhJUBRjIoZDXGVuZGx1mDgUhi3LYiBYNA1dP5XNrS5yPgtyqOMPlxE1P3snly/EidU+Yn0nbHhw9605nV0ybljHZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.129.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlN30+brEefxwlhU2q/FHPhVO6+uf0KiQgdHbLQdAsI+/2tgRhq954in50WH7zcULfk6bkrqRTWX28oR+3faYKhrh/6p5JXbvODNmG2FNVcOkZ5HtCjUEckIdP5Ml6z4/364x3ityMkxiszIcDSh8pvtjZ7bcM4RTxQB42cm9ug2mp/pswJgSm8r5TCUXp6xPYPD4+c3Mzkl5+0eLmXzFxpCkj71hF90SPKNoYU6K5F+/6mfUbflddSzqeG52Vp/jVATyghXOKgFRScevg+CSGC1t+QQiX90X4A+e+eIQ/jx5PO03wvLb9w+RdoAZ740MMAWkuFUctLPtyCO7Zp84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAFRhggqLsjfl2VgiLXvhWbX97KknF9olCsfq5/XDGw=;
 b=MiZ1Vq9wAdXvzhno2YtREgFNRqwELJ11VMi/sBQGdHAEGFPRvtonDU8w0qfRbJfp6xVvZ3hyoHiBgDfgMEqKTCQYbS7X4315XRUE1ZdEIn875OW6dnqx0n6EQT3Ot5Rcjkixq0zVoQavEzqmYh0ApybPEpCzFmPLiTVK5eqf0HOYPBsgDPcVB4Htj2txk6MLfmDiPH4x1LhhkMmxFgiNPsuO7Gh7jaxAjlxsEucSOQvMc6Be/2PT1HLQN8vwweRW7BTq1ZheUa5pk+hMs58JZdxMvrWxSUxDutFEfRbzPA8ze6lsn0PZQ55JvC3r37A1XD1qaVVykHVZPRPiqJGAnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TP0P295CA0058.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::17) by
 TY0PR06MB5152.apcprd06.prod.outlook.com (2603:1096:400:1b3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.29; Tue, 15 Apr 2025 07:27:26 +0000
Received: from HK3PEPF0000021A.apcprd03.prod.outlook.com
 (2603:1096:910:3:cafe::51) by TP0P295CA0058.outlook.office365.com
 (2603:1096:910:3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Tue,
 15 Apr 2025 07:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021A.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 07:27:25 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DDF364160CAA;
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
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v6 07/10] arm64: defconfig: enable CIX mailbox
Date: Tue, 15 Apr 2025 15:27:21 +0800
Message-Id: <20250415072724.3565533-8-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021A:EE_|TY0PR06MB5152:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48b6bcc2-7ecd-4bb2-0c2e-08dd7beef8a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wKsKqqdYM8w9Nwo88/6Iqmu6rtOMr9au03OQsN7kSh50bOr+gkFgCn+YZLSC?=
 =?us-ascii?Q?P//+eUxihbgn3nzVsGgWD7EAZNfN4IT735GXvbMP609ZB/mdxS5/nbakbTzj?=
 =?us-ascii?Q?sus39p6W74rUhksd0X7Q5+jtzAPkISds+hkTZyE3cLwVnvw4z42EHb18H69y?=
 =?us-ascii?Q?rpv8ObZbRsxG2dBFeqwodrxxh1DA/TsqUT/RqZT/ZtwRwUas1RH6DmN6+yGY?=
 =?us-ascii?Q?V0MH50Az4tR/zy1uJLAIiNDHOACqGoVaecdhxPBCAIQ1bXI5tN/doGXNfMo4?=
 =?us-ascii?Q?/QhpbR6GMS+R2XA3XRC2RJuyKu4ws/qAgmFzs0FNNIwxVv1tfI9ZljipSEBd?=
 =?us-ascii?Q?estGeobrebTt0DhdnNXJzVEUgbeOk7z+wtrOZRFzhWeXh6WyO5RKyPnaPunP?=
 =?us-ascii?Q?0S9+1ypuZpd7vJ4ouOQ16yzYgvyw6PK2xfsz30uoyOhuLmDUkG4eak6DCNd/?=
 =?us-ascii?Q?izWaBWtD09gwlV9mbyoFw9gOGo5SqDnQxIE+FjP5B7cyrQhEDJSYObR+oxor?=
 =?us-ascii?Q?YPNkSm+29vJKP2bJwzlOEFY9z1vYNYT9HgaQ3IvU4u0VGCpm6z0cpf6JXWIQ?=
 =?us-ascii?Q?CRTkyew3MdpEEe8KJJaZhRTcwY3iVJkqQxwbLcR3hj+KqZb5KQI6cF4v0lS/?=
 =?us-ascii?Q?grf9FEKaIRAAPEwNx3ONYnBopX165/gnqfusMfT3FOsOKix0voW3YaLY2dPc?=
 =?us-ascii?Q?2Rcyw7S7Ac21MgtEa9g3WCIL0VrHC6lkyzsqlg4aPpK9u4Z00QhgIG1dzyte?=
 =?us-ascii?Q?SU4HEzOkx9sb3FnXPt6GDL3+wyHEDLFkm39KZUuC04SkBVyZN0GbiJbN6n3e?=
 =?us-ascii?Q?0zB2B8lCDvPuMAYsoSwlgX5SrKjHddgNAwhkHinUFMItoay0oO9rWLLcO14j?=
 =?us-ascii?Q?a2ON2F9AOzehysyiPX1l8bzbDxWQ466FzgauVI3ybLXBf2TQaAxFZpAWm/01?=
 =?us-ascii?Q?TGNcp1ZmUrk4RTqq5Ovz3SivzPS9Td3VIYxdawb0sZS2nIWftxP8YfG/Wn0U?=
 =?us-ascii?Q?kMikJrDgh8kCAYT9R95SKmZjC23CT6IFyeG3KcKriEAUNQFFA3/IWeYiIUpD?=
 =?us-ascii?Q?zlBW4bFq9xIRS7/eZ631A9GEw97nsmUg7XcXsX5S1s7S3l0tMCAKatZ1l5O0?=
 =?us-ascii?Q?YYMbu1pzb8DTXcLHIh8LIdFRStqu4855+2BGh8D+rKXhabKwIzS9XpSOKhiL?=
 =?us-ascii?Q?U+TpwbOuZK38gg0ygsdACN60pnH+gvgSb0oW5aJV/c58Hak71OdlGew+B4jb?=
 =?us-ascii?Q?F1V1RXDaEbrM6W5upixpCIB4RPQdYp5KZHCJrkc8GJNXFbbmp+JsnNHK363U?=
 =?us-ascii?Q?S2b5YWgJiDX+em61gMiktD160/MmsrEn3Dj18Xx7poft/DaEztapnq4XSSY8?=
 =?us-ascii?Q?f+gK3haoC6XX9hcumjjdedwdwUkJTfurCTZxo48llfjP0VIdpH38D/ZPI4TA?=
 =?us-ascii?Q?HFP9wVkGcK1efjNiPXO78gE0rqpTyjD7StqX9mrVxkLPLIP7axb4far4IBAZ?=
 =?us-ascii?Q?iu4vzrXnBx/rUhPgk2N3i0HoROisbOtq6654?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:27:25.8068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b6bcc2-7ecd-4bb2-0c2e-08dd7beef8a4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5152

At CIX SoC platforms, the clock handling uses Arm SCMI protocol,
the physical clock access is at sub processor, so it needs to enable
mailbox by default.

Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c8a8fdb0bedb..4e9805c5bcc3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1424,6 +1424,7 @@ CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_MTK_ADSP_MBOX=m
 CONFIG_QCOM_IPCC=y
+CONFIG_CIX_MBOX=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_ARM_SMMU=y
-- 
2.25.1

