Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2103.outbound.protection.outlook.com [40.107.215.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB3927A924;
	Tue, 15 Apr 2025 07:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702056; cv=fail; b=VT8c/TBNWXILD6kZL1ZU+jiSb/qnfmB75u4QvJVvgfmLUP1jj8PuZAu5j6fLA2qCWJWg4m8JyHOUFLbDCaa1Vh9KscRGpFO7UiGKjpZ4A1soHFLmPwmLL0xVCQUpfvxWy9pdUY8oWZmUu7gZN3NqdEC/HGso0ee+YFF+V0a6f40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702056; c=relaxed/simple;
	bh=xCnKUHrjSNt23UvK606hc3K592QTvZry6MF27OoTsCU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HLWSXvxhfuFyzL6T6J0BNsMYu7whbk2BcgA3GAwGnnRHHmAvnky5vZF0Q6TBSlljml28+tLAmP7OhdinwGiqs2sbhweeWgufoMvIV38rdoDI8nFmocOD7hdAim0QqkoRfAznXALUYK3Rzy3zSWPHoT/ubmTNQKsQpqHdEBPJ93w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.215.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uk7k+c3KsO927ymqHJ3I0xjTQXAD5/AEA27IlZMG7WfrNGbtdKqatB34FO3OczwqUyvZ1HKzTrz5BIS3tbJ3W8FBwdD2YMBYzgri06Fo5upe+D6E+IuvdbygZEW3q6RV/eSPZ7Z1hxx6LgNJA0/YbWVQJUQsQVL5w1CDu/lF8zeEmrtFuEgkbE3c+oEIi9jcA4SF/9PHEnp1o2ckqj1jca4FFv7HtpOfgjgCyUh8poeUdLyOMwkhVTYRewpOMNHDuOqb6fqLuz5g4PGx5nOKQBdVSsiOUiu7SwDyFmqCqga604E3nby9ZJbP9Bae/JfyyHSrRw6LLvBsA8PIL8nu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrrlBKeOi+KDfQQXyjr5Yzguwm4KMkMUiC1P6pGVHDw=;
 b=OleF1xC2TjIIJfOHWCgdARW9bqvy1dn/VBTGUv1Macj6IloKZMB2fDcfoAzsisFKjLK3AoKlIZ2eKC04/MeIAa8rHAvBcBGtmMbJYOeRnzq28OrpbTe2xfq1kIFllriNlfNAIgvw/tL4HlmoKChW4IYqUH3i7JnfXuhUGNTDZLDBkSg08XPHr55CZx+NTubJbpLI9NP1X6iaolrUspLWS8rWY0hkTsTqd1wFbvv+t1Wdku9F0Yl2gCb85sG5WIb/crVQ33WAHkQDQUmHf+qByl7ITN98UUDJ20P0dCwitDXQJMrH4rNpyJ4lFuyaCfGZS9SQQ4dAsrKCgE72jgT54Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY1PR01CA0185.jpnprd01.prod.outlook.com (2603:1096:403::15) by
 KU2PPFBB5DAAE7B.apcprd06.prod.outlook.com (2603:1096:d18::4ab) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.36; Tue, 15 Apr 2025 07:27:26 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:403:0:cafe::c9) by TY1PR01CA0185.outlook.office365.com
 (2603:1096:403::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Tue,
 15 Apr 2025 07:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 07:27:25 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9F0C44160CA6;
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
	Fugang Duan <fugang.duan@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH v6 03/10] arm64: Kconfig: add ARCH_CIX for cix silicons
Date: Tue, 15 Apr 2025 15:27:17 +0800
Message-Id: <20250415072724.3565533-4-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|KU2PPFBB5DAAE7B:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 887253f9-8d01-4577-dc45-08dd7beef86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZwRFQsmNqFZ2gZ2ak4jQCF5/CnvopRoNB/z91uVaJeXEdbaXd9NjJXb0ZJ9T?=
 =?us-ascii?Q?zmKkNaYkyj9YWhDV5bSfTl5EwV0TimwagByJkZYobWnNIvpwMBKeNG1kYcu/?=
 =?us-ascii?Q?vcWut7ZoqRFzPlxfnbrxg2tSK27h8J7vDmzknYNAiSqeNFI1Br1JqL84w+zk?=
 =?us-ascii?Q?l5REgb3ikaBvP1vWMW90tBSj/LPXM1o1L+FMqPODTRb9JIFQy5ilMV0fX9h7?=
 =?us-ascii?Q?vMt4SoMVSc66wYHM2Eb6mcG2DO1640LlwW9ZonrgGTafsPSEJz9IcBJL/SEi?=
 =?us-ascii?Q?LzplogHko5TFnuxjM32VuWw/WrEWitpvBiUwOWObbIXoSjeJOd/8mVS+EWDW?=
 =?us-ascii?Q?sFd7QvWDNFCEfXzdQL/klV0El2b2FcgjB1x1mjt/Yu47Lg1+uxIIZEUOljET?=
 =?us-ascii?Q?3VfgVUqPv+v7x/SDjlrlkzHjWt2zrkj+k+FuohBb0VCtf7cRPaOKLAcK1EmX?=
 =?us-ascii?Q?QT48fibMUoyufWvXdBjhCwrzgzgBpCJqnhaAZSKYh0fCHIi1ZD+sT98L1z1G?=
 =?us-ascii?Q?i6rN2tdzAwlAjAvefxA+sU13sC+gjfxTF4Klnk70uRH0ActaiFHEq+b5AELM?=
 =?us-ascii?Q?Tr7/yKvnEhTCTxIqcFEcuKz7Dnx6gep/oM+Vru0cNzHSty3EHUf8StCBI43S?=
 =?us-ascii?Q?LJiqq6dghMrStNBREZ5mHuTbrZdyLuiN1FG24MLT6/HhSODWu9CKGAssYC03?=
 =?us-ascii?Q?KCN+d7gqUlhO0ZmQ18vpH9b9l9y4+8Uz44oNNxU1XgIxQNO7vyeMi202vVsA?=
 =?us-ascii?Q?nKpAx6VETvTqJXKBdTPDNhjcv0O9+tLNg0cfgvzi5/nsVitsvpxgD62EDj7L?=
 =?us-ascii?Q?bn+L2mmLPKSNJ5wGCdO5UEloYJUQyBAiXgy+eWhXYEs8oYn7ZbV46od4GiE7?=
 =?us-ascii?Q?JnleXoHpVJ5/yDJnFI+fC7LfAyIuz6Zi3iniJhiHZyG8YopsQwsTtLefZTUz?=
 =?us-ascii?Q?ozUQvS2TQw3bkwrg+qbtMc8evyq6vbA83vjFZpTjP1OpV5M/oQciNFWtXT/7?=
 =?us-ascii?Q?MlFROmk78F6YSBc9kWcMEkoVyz981n1NxMiATUeGcjEkx6FtZw6cMVMHQJwe?=
 =?us-ascii?Q?+kv9cJUObgSFI7dlyROYS8K5NqfOCsnw98QgXHtAlx5t16jGuyy/GlJfmB46?=
 =?us-ascii?Q?ncIh9gjpeNQlUgbeLAfsbUTEQwXtycORK/+P6o47D1DVcmV1DJpjtobqmZ4R?=
 =?us-ascii?Q?W5WoeMhJqLFn+RmEhdHrgU/PqRozKDYAmEF7IPa9KEZDz2rJ/yQ91sQsBcBr?=
 =?us-ascii?Q?H960N+Ac9RpYZ4/rSiQ9EeUd/IZWjr3Q8kMWscNn3IpxOiOmjEbyH4N8vOIv?=
 =?us-ascii?Q?XETemK848nlyxnQrRBqh1zpH0VbFPSVc+SV7OoSNW7jIgPJ4sX1yMbjMFy6d?=
 =?us-ascii?Q?WvVZE3ROJ0vPbV5BpLGHKGYYVXaRqCkYJoI4ZXFUUFLTA4YPyojmKIZlum9l?=
 =?us-ascii?Q?eCwkqcIwmNaq7RUaOmruGOmFrpc+i9RkTuu84gxelH8xfUsQO8xEyQi3uMWG?=
 =?us-ascii?Q?85CTe+42strt103n7CGK5z+WJh6VD4YKiF/4?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:27:25.4828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 887253f9-8d01-4577-dc45-08dd7beef86d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFBB5DAAE7B

From: Fugang Duan <fugang.duan@cixtech.com>

Add ARCH_CIX for CIX SoC series support.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..3db7acf04122 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -106,6 +106,12 @@ config ARCH_BLAIZE
 	help
 	  This enables support for the Blaize SoC family
 
+config ARCH_CIX
+	bool "Cixtech SoC family"
+	help
+	  This enables support for the Cixtech SoC family,
+	  like P1(sky1).
+
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
-- 
2.25.1

