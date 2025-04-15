Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2112.outbound.protection.outlook.com [40.107.255.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF210F2;
	Tue, 15 Apr 2025 07:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702053; cv=fail; b=EJljA27hFXFSbjIU3XSYAHCgb2On50AoRWjHxqQ7rgzoqvEzwmTMHPC5Nk9tqZy48ZPnN34qM4G/PmxRYQ8XRTxcnuOmcnpAtD3lKbrEugH80fYagQr3zKLalFUgOQswqjooWMBKWMvYHLhVUFE4SzpXSxayxSEcRSj2y+6l6/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702053; c=relaxed/simple;
	bh=ookEEVVPxGGz0GzooZW2aGyy3lAFuIRmAd5/0JUZw9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cTIdskuR76RKPERZ5rZPlDJ38SOfC+XpMhl2NaFbX/521xkO2SWhT13EQmyPihXkPnr0cWpOfd+Oj+oTpw80ljMskrExglTFGnOzKD39YuuVvqX1ZMjySmPRrEqM/dCDuSKTE6qfvGHsHnMUUc5lv/qoRuSF3J7GfI04K/veVfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.255.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flLNF6L89AZQo38YV6k24tV8PnXkwAgseaAipjmL5XBUZr1POb0NlVuxYaYO6KAxO6DNuRW/EQGryhGgb4p0QcB32IxSK34QSqFyDNchYAzRcJGjh+Iz9RDIIBJ9uLPcE20t6qfbRU36XG97zxcAo2EAEU5EAfbVGcquKNzjH4sVd0p/QcHM+PSOYJQYqIHE4qYpjS9jxAO3HsN71QGd+c4sJe6zFNNsaC3kERKYPo/NLdTa7yT0FnVnF6sNbk1OZFAYgaDomjXyG16TKGccapBI9juplMQBz6oZIaDXZIIWiCaj79R+9PNESYBQHzUaJW07R2v87vibPWPFDlDgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVpSZdDFsCHY8ZMtKH5F1+nDRJuSrIJos7FNpfoAwZg=;
 b=TPf5N/fYr4sga2uEDGPKvon4PpJ/V16nZIUIJjGn67t4reCl/I0HBmIN6m7OGUVS3g9Mp/EavToaQvELLyMVqYBxFuMlvJgaryfIQd+xdmpx/5ZvkhNbiuIzh5xL6YcRe9YTZd+sbKsBHtCGYM8WA1G56nzGxIciDtwuecJ0haJI6lK5uhW+r2FGX+kgMCn2T/rbJRiUft9wpqpUv6bE2Z36104P5FPrEYJ3vXQ12MfzeGcN3VUQBBheXc2wr3677uh2gIbK3VSZ8PgR3KEEQaNiqeunlzwIpzAeVL2EUXhRRsTN1PT7l7WL0uGyfICiNGfeQnWa1J1FkMDU5WVW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from KL1PR0401CA0033.apcprd04.prod.outlook.com (2603:1096:820:e::20)
 by KL1PR06MB6553.apcprd06.prod.outlook.com (2603:1096:820:f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Tue, 15 Apr
 2025 07:27:26 +0000
Received: from HK3PEPF0000021B.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::57) by KL1PR0401CA0033.outlook.office365.com
 (2603:1096:820:e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.32 via Frontend Transport; Tue,
 15 Apr 2025 07:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021B.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 07:27:25 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7B19D4160CA2;
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
Subject: [PATCH v6 01/10] dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
Date: Tue, 15 Apr 2025 15:27:15 +0800
Message-Id: <20250415072724.3565533-2-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021B:EE_|KL1PR06MB6553:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 10bff7a5-763d-477a-9af6-08dd7beef866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pd5iCuc2XpOtLgVDgEEK/NWg3zNvYGpOIh8gUesI6fcMgSGQB0Swb+hYhMZb?=
 =?us-ascii?Q?Qez/41sJXUH/LL/scu603WZnSJIwqYq4Q39dDKpYs8ZS+hvrVjBkZDRmTOUa?=
 =?us-ascii?Q?EN/TdDSa9zXPTsulcVNCmqA/D+UNkQtm7NNE+7X8CPADZRscd9ONRia4hTCU?=
 =?us-ascii?Q?H2BnloFWf1yPeoxmpTfLT69ZdG76SiVWVHaVVhQjr/FH334Vu24q9UFtaW21?=
 =?us-ascii?Q?RgE8jskft8dn50SPSroDyy9Hf2dzRLOvKWWWD7dF2HPSgYbSpP2+rcNCflRn?=
 =?us-ascii?Q?CFPDWBZVs/bDbMLGR9dc53fYrOxjOaJe0GQgvvtQSbdH5pCU2jTI1S1mfeNt?=
 =?us-ascii?Q?OQ2GhT8E6yydr5yq416I4HzkfIbfvmJM6SEG4oDVLDf+QO3KIjjMUFMUSot9?=
 =?us-ascii?Q?O/mRlkJaBYIRzYUO4qh00nw5GkaLds3y+5obsWnDlLRkEMLfOq66l9Qe1IoD?=
 =?us-ascii?Q?OTj7ea2bqKveukb1M5tddi7bpf3WE9OYZiuA0PruTgr1mm2gFmLbhWNXeDK7?=
 =?us-ascii?Q?zhB7ua9z8xIsDKPRSOlEYhl4DHnpVHkHomQM8OZXcVwjJEOweeDL3eYRH1Ps?=
 =?us-ascii?Q?fUWOLfoziqnHdAyvIyhIp3osA5vWfPTQ0+sXbkrUyn5YJs3ZWaEaHodCVzLw?=
 =?us-ascii?Q?H6Nx7tnxxTBMk2oqiAFsPPWvbEFa3963lXffmMSXalnzvchHWozxp5qiKZRc?=
 =?us-ascii?Q?qlAm8S+V/eQul1ZWJVrOS/MGWoGDSvqUOiweu+XbrmML2i5z8fDQO8RjylH8?=
 =?us-ascii?Q?BaShmAsRV7VrSNjXOmyjJ3sdMq77GE2OjXCJnBiPkUIf3PfE8jA/DmNQ6fFf?=
 =?us-ascii?Q?bCG3x9l3hGajYi/51vPn17VZ7gJZtFBoRaI8tk6pmAnj1jToAq4FiIQf3iTW?=
 =?us-ascii?Q?0y6SjIakQghBKW+m6ERMI3bconEy24ZXf83Ow32wigt7+uLFwuG/0KJmcOsv?=
 =?us-ascii?Q?RIhwHKIjUENrwrvRoI4VYuFnUq5eEAu5hKcmpmPfEZZHWcbBNFqJqxlRFf6I?=
 =?us-ascii?Q?d9gFRWHttajQmOmCsiB+TBxrJQ21iDlIwm0lRmLxB3Y4H1phZwv5ztagS5DP?=
 =?us-ascii?Q?MOUVOKewed8E6dUSPYbfN87pFNtORg2Fc5BkCBPkMeVmu/pel/9E+xXvFFV6?=
 =?us-ascii?Q?YG3ex5hJ2T7diFxk4pGDClPXdQjvdh1wVGkAHGWwyVYF7ntmLs5Gw1uUo0pM?=
 =?us-ascii?Q?nf5uHL9D2YBCHPzwIN2C2QMqaQ9p+6bvOwRIXYHebgljVkTFUs12nLQEACGD?=
 =?us-ascii?Q?JMxO8crcja1HTxjt88Lb87H/EBZYtd/HMkAZgCET1BJVNq/tLIE5Pz0kEw09?=
 =?us-ascii?Q?BvFRsllYeFgxZyWMBqe0iAdwUW8c/OM21qTVSNxNDR1CcT4+wLezaK7vFMA0?=
 =?us-ascii?Q?202BdTmil3asJcZK5SFQT1KL8QWUmU8dHe3SGJRCfkBLZZXo0ZVarzPJpMW6?=
 =?us-ascii?Q?DBPuJH4i9fjzGThe+b1aHtH1z3jNh5P9+LSwe2fvqUMj83SYTYlqBQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:27:25.4041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bff7a5-763d-477a-9af6-08dd7beef866
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021B.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6553

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

