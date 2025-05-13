Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021102.outbound.protection.outlook.com [52.101.129.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DDC71747;
	Tue, 13 May 2025 02:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101816; cv=fail; b=nE3+NKw6U5wI/ZuBRFadBTvvw4BwPPk/rf4be5PIDkNWWZI/Tz0zk1J2/4M/NOdjKppLqjh+Gd9npb/ZmHZZd68ewqs99XSu50mbDDBZTnXHSCYVFZV5RYLbFThNZFUXLYn5/P/PrNs0ommDAGSf64WhSDtc3jCByznwQS2R6QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101816; c=relaxed/simple;
	bh=iQJ+6ma6PuNeCc0R6EXAkh6Mmqjho8iloH6nJAfmU/E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p/zdLVQKO2y1xZg+e6qwpz979W0wbEsMipAR/sc+nqiAZ82/H2RsFjoxDroqIjdtzMutPsVfoE1QMWMr0dj404fXGOCHfy5oRt9NrEYOZVxj0ibqDormRvDoibPVH26Oo0UNd9UT5XyBWC4knzcrnT2VQqRyi/AskQiqGrDzLxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.129.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yc789YtF3ta3AK6FHHlvQfJEvckGDs8ebMWCba2NG8vrI9XFHLahT5KFwjR+bA2fHyp70m2iX8mrUSBXDRtOloS9hXmZIitcpPx4ZYnCONgOztYFFCFJSgZNshLjXKQlB0iHz/OPRBFe3cIt2/cTL7JKB3rBxEzp68jwn1btXyGohioChORTNjhvrk0k+fImtffyb8gMF/SiqkBzwGpnQBbqvTOyRhcE8FLYkl25lmvZvhZbHB/ymfSAuVj7uclyzfRcl7U5Ktun2ECRQvsZQXjeTcot0TVAfSLnL4bxXyjB7ABJCD8nWHT774xFGmyFRzAP5+aflJ9mTn5l+8y/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=;
 b=NW0v224H6smRv7eehajXom5OTiEcZ+5R1ZzIwWYw3CjB22BPzm7EzFMfky0nmNMtFr6V/J9bn6YAmDVTsnJ++zxhLFGjNux0NwOmmStsIVqFIn3LjpPRJq+x6zVyXFCUry+9IGI6UFELxcrBW4Com/CleGsRwibVTTKQ3gsrEWxMjJNETn9bDP6qDr9l869EROM3vOwowuZ79ws8JwXaAqVtv+EMJKQptJcjfIxC6LbWuAgQsgOsdXTzMEufDQS6ZaRLgdeQe18Y2mVYUwVby4Tg+XEtPTqqpgsNPQ/0cviuhP1wd5ZN8chz5epoP7eZYaDshIt0vmJKbBr0T5OCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:263::9)
 by JH0PR06MB7210.apcprd06.prod.outlook.com (2603:1096:990:8d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Tue, 13 May
 2025 02:03:29 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:400:263:cafe::c) by TYCP286CA0018.outlook.office365.com
 (2603:1096:400:263::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 02:03:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 02:03:28 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4AD214160503;
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v8 2/9] dt-bindings: arm: add CIX P1 (SKY1) SoC
Date: Tue, 13 May 2025 10:03:20 +0800
Message-Id: <20250513020327.414017-3-peter.chen@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|JH0PR06MB7210:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6b036c8e-d5ec-4927-2339-08dd91c25a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QU7QRW2vev95r9Ef0hT/gY/L8O42JmatjOOPQAyU9hklh0BF6pwlQ1LuUtmq?=
 =?us-ascii?Q?tDOjvhspyai62bHSo5WqKs4vpXkYFZtz4YPmcYD5ajn0fMTDgmqOQ8rTUlGd?=
 =?us-ascii?Q?rz1goVTt49mdfZVZ1b+p9nAJ6xOh10u26CsA5ikc9NnmIJtD0WRXzVZdBdjb?=
 =?us-ascii?Q?iAfUpaK5Lqb8AOLSbJyHXGCMqA6ljRyq6MUql6gc4+0kO2lyd7KKGu1/WBri?=
 =?us-ascii?Q?D/zPfpEjNgD0yIOzeKCqjmcTLHUdKwCjb5xtQAIV9NZY3uEn2UAKpcrJ7CUr?=
 =?us-ascii?Q?Y56MTICl8FFBRCmWbc8NGi1iqH9+APBqKIqwsUSDIZ2Pbelqu+35gF3f4+XJ?=
 =?us-ascii?Q?9qPf6fmK33Bus34qNjHKFpe3sWvA5KxOEX6lyoClu2W02mcBbQNUpaq6Ro5B?=
 =?us-ascii?Q?l0+owOnaJDoq31WCCtFO0nv+ZP9hPPfHClnHlLaBc0LR541qQyCWMUpr1O78?=
 =?us-ascii?Q?CRIPHisIOREibRBQPVjPQ3jRK8PHq+tIKsNGZ7dqDgUiOczURscmdwRQnKDe?=
 =?us-ascii?Q?B+qOTRYTUsC7AalrIp+iOSyskb0h+jh46yD0oFmvzbyUQ7gb5BDWiVZHTwut?=
 =?us-ascii?Q?URURGz0BzRdEMvEev5K2P7untWRqscqW38U31eD3Log7dPa6pQZPCRV7eM1f?=
 =?us-ascii?Q?lATw8xBfiQeHMtu70INxqtG5VNAW1LbDc0NSQw/FJx/yPb6nrGFhdUgFnFPr?=
 =?us-ascii?Q?llCFf/CFptI6ROl4CS5uWu9bkV40/qRCccUvMJdjEKAhZZDRuNM5lYC63OAY?=
 =?us-ascii?Q?DpYLXVxYZntxsAzXhowEVeQg5Mi6W99TK4BqUHrCuTG1FjYJtiv6ptm10AlA?=
 =?us-ascii?Q?ZDiWkV+9/pIOds+KxLpBRVrG/V/64LRdhjEid0UD59pfTCTiY9vyihcQoIH5?=
 =?us-ascii?Q?fkrSYLHdY6nAGr2PKbv/XRHFe/rYDaua4TdaNnCjmfbf+zRfgWJ3u5kVGFs+?=
 =?us-ascii?Q?NoAfRQnK+gcyXniiUV43wAhlgRSruQM1ptwDTkevyYFj53mPUJtmhZ/Brc7w?=
 =?us-ascii?Q?wVHW4omG6kKJiPh1nJzJh7sLym65Byx8wbGcvu0wtjRNREQlL/afoAl/wKmd?=
 =?us-ascii?Q?W6vBwxFHPcZndxYckwMEZwHsG0hJV266pFnygwbxaO+McgIbcJbBvzy2OfG4?=
 =?us-ascii?Q?LjC68wYrs0od6UejLyWzVMtgwNzQd5MToy74dj2bKW6P1jcJA5wcc1sKfUUb?=
 =?us-ascii?Q?B5XM/EFQoBrhEGEssDU0T+vkrPub0o15RjzLP8ROsNJr1IlBSWNDuH4CpjxL?=
 =?us-ascii?Q?IE8yCTWUxEjMxVokK4HRLgq91tIxMzwuMx3a+MeFbbnadGo9X0cjiWujkveI?=
 =?us-ascii?Q?k4KtmYR4sdUSuZ5W29kZdE9KTQrDSjM9tIff5E72EJZBSkUVO6zB4gmc4YeH?=
 =?us-ascii?Q?2R/YsSFI9QpMhMVl/0O0WV0o9n/fgAZmoVKJuSDbYVZgZSjpmF26mzVfVrd4?=
 =?us-ascii?Q?WJKxHskHatEE0iOclXVOBDdDqzwXWx25kb6NdBUyRPWkog8HwEHwmg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 02:03:28.0468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b036c8e-d5ec-4927-2339-08dd91c25a62
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7210

Add device tree bindings for CIX P1 (Internal name sky1) Arm SoC,
it consists several SoC models like CP8180, CD8180, etc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 .../devicetree/bindings/arm/cix.yaml          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml

diff --git a/Documentation/devicetree/bindings/arm/cix.yaml b/Documentation/devicetree/bindings/arm/cix.yaml
new file mode 100644
index 000000000000..114dab4bc4d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cix.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/cix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX platforms
+
+maintainers:
+  - Peter Chen <peter.chen@cixtech.com>
+  - Fugang Duan <fugang.duan@cixtech.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Radxa Orion O6
+        items:
+          - const: radxa,orion-o6
+          - const: cix,sky1
+
+additionalProperties: true
+
+...
-- 
2.25.1

