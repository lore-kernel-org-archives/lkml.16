Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2043.outbound.protection.outlook.com [40.107.103.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E435225A24;
	Fri,  9 May 2025 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802989; cv=fail; b=mW6Wvq/9iRRO/0whJA768uTLX079Fo+g7XqS+DlLci0dtDVCYlVGkNwdQ+XMKZWHFopvb7AimAW12wTEGPo7YrFD1+tYLW69N9VwKkVWLaIfVd76IeeSuP9PkuQpymHjX1KTmY8itisRQo60RDsmJK02k2NUzLJOA4tn9B79XM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802989; c=relaxed/simple;
	bh=H6uaLSpgzYmn0ptSIR+MSOV28dGzDFT4xXr6wzB0OUg=;
	h=From:To:CC:Subject:In-Reply-To:Message-ID:Date:MIME-Version:
	 Content-Type; b=WEAuOIII+H498ucVFhokD4PTsYU1PpN38hPAqhUoZ2s6tpVOiTgioj3NaIqRdy0CDLwo9HuWgIi0FN/L8wkAffbjxnkhbcmD66MmWHoVzl3Z90Zn3DfwGf7x92Uwdju9ls86bZZ9gv/X1Au2lAszt2wpIYScDwMD0Q6j3d0hENU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=HD8AOkb3; arc=fail smtp.client-ip=40.107.103.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="HD8AOkb3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFMYQpz7nMFIp9jnn4df7uFP2RnfK95QN3qh9Zde3Z0Ayi2VppvS4qiTO3G5nbHjRANyfISc/fdLobPC9jf5jhXLbbFjxtW3Tpj/X5tvPaBpTKIDTleS/DhddAEBJDD+CFBY/fywbpxfHn1aPcWl1sG9XQWtk/qWX2KnFD2Cs7y7ON1bxDjKRWbnf8RUf9uWUwQ0Z3H31q+mrsTeEkL4FfckJXK/lIlr3YA3q8I6TujfqGnhEqIMiORN3HbaOoAXFU3/wJP5M1cyGdi0h1/VY8/JTJkxq4ibgLx2D3vmBYvZVDG/ZcIgeTMO+t74wC+YnBbT70q7u5jpDmcYAX209A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tttphWuIhqioKpwSr98inPZMXLsHl/3wBng9IqsvNQ=;
 b=O5ZkaAUgjWykQK8Ko/0C6d3fjDIstDiQnbRnBWrSAMGKwSQFiE9u5zTCD4SRV2KsOp+lhh0SPt6DHy4ZD50fCvr/+/+lNw3JSuvLpLbF0K5v13PTPAfPabrMRQdzfr5bS76cZx7EVWGKxQ9PuZVmGlXakXkCjC6n/C1K9gJguw8CUH0RJFekXC/FKE0SwqEVj4Yl1fU/4tPwi/UCs4fwk/xWyq0YF/M43yGEa2rxFDoMVmX8wl5ZN0ZpDTWNkpqCSjCbsbccfeLbP6gpTsMVQse8QRJxEhCLP+uHKQBoUanXhjAX3seYwpDH3E1gs4PAsvze+DwXzGO3ftL6pjNQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tttphWuIhqioKpwSr98inPZMXLsHl/3wBng9IqsvNQ=;
 b=HD8AOkb3Zr5Ozcfee4KIqy3R8FdqMEOBPC4HwZN9+ftVMSkWP4OJhet2g0IoV220JsrxRLJ80tEagIpvb1rpRMnsdMQ9l5c0hSA9eh+ViQaFjwJbUn9eLdO+D5sU4+OQzvBRYChOasNA9yQbT1ZEWjmdGjW7yWbSbrmyDmZGMl0=
Received: from DU7P195CA0028.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::28)
 by GV2PR02MB9422.eurprd02.prod.outlook.com (2603:10a6:150:e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.12; Fri, 9 May
 2025 15:03:04 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::c3) by DU7P195CA0028.outlook.office365.com
 (2603:10a6:10:54d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Fri,
 9 May 2025 15:03:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 15:03:04 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 9 May
 2025 17:03:02 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <kernel@axis.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Nicera
In-Reply-To: <cover.1746802541.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <dea070f1b9acf755a28537a62d91bb224bf5d3b6.1746802541.git.waqar.hameed@axis.com>
Date: Fri, 9 May 2025 17:03:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F1:EE_|GV2PR02MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 3587dd79-ca24-411c-6d8c-08dd8f0a9967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?523H+9g4sZg7dkOiuRQK/oYLasEZQJJVPsIZlZTshIVJ2G91MfgBY+GujpwP?=
 =?us-ascii?Q?04Y0rDpVhJ/UzsdDVBZQ+wNtHc+R33f2xvj51VWcurxAYXdQtDzn5Zjy0BSZ?=
 =?us-ascii?Q?b//gM6AeY+pH52fDO6SFOjpg+bzrpGz6kAZmE6E6ig5EnwFnUaEW2LjrEkaf?=
 =?us-ascii?Q?3zsYHiVSYcKbLC4YDGUDRxmyOZo12uRATxC3Yp7eFwFAHEeBgnM43qsGneW/?=
 =?us-ascii?Q?0tIujM/pr8IQuPjGtd+ATSOuBscTeSafMbF9Y9lhGNWIZpW1/v9gciz/E25y?=
 =?us-ascii?Q?s4SH5pKVc1eo5bY5SJTBH20sSgZECz5yeZ17VXKYKuQlRDROpwzz5fIjlhV7?=
 =?us-ascii?Q?aaohmb0ugVD0tQcNvaLe8Pf/36mjufrwOK3OD3mbRzjNsLdt2ArN+K7k/xY1?=
 =?us-ascii?Q?H0qAeKNZ6IxLksFv8vEjOItOMcNNNQIiJN7oRigzrs+d1caGzi9Jv4wxT6jg?=
 =?us-ascii?Q?L0gfqzUk+ZwX9I95Py+ShvjagtAh60xf7PkeoO6921qVvVu7c4b6Q5tavf1m?=
 =?us-ascii?Q?0r2DjLV558QqOUbrMacrEq9cDcUW1JR3OXIPyAT/JNYPd2uJ+FqCI4I0sO7K?=
 =?us-ascii?Q?oERu9fyUaOuRtykytvJhX3wwy9wi728250wgq8Rz4N1WovrsSie3ab9V+IPp?=
 =?us-ascii?Q?RxEKqYowRshBhQLqAMZ9pYtJopI7nM7tonlex/ata4hRV9YQWreIni/Grbm7?=
 =?us-ascii?Q?8i27/L26bVTnsZ1Nl6EJkA+H4LYYlZUAI5rVMf77iUUoGm+OsHqQ+tfTP7ef?=
 =?us-ascii?Q?ZPe0fNPvL1ils4JNLDjGKtNNbs0Txp21y6m0hFa+Yj1Qpl25GofGRAUlXxxK?=
 =?us-ascii?Q?C5RhlAdCZ3z9zdq35yk8TYNhjM5TL+/zYWIYNKY/LvmRPCCXwJcwvAS3GgcK?=
 =?us-ascii?Q?GfHsB9D+53q2cHr+gCiiVgZvxnXy5AxEOy4XhHprnhspHVqd9QQq0XeClB91?=
 =?us-ascii?Q?QiKUiJG0saivOOQS2rNjk416agkl/DK7wH8PT/RvRZ4quX/2D2bP1SfDjeBr?=
 =?us-ascii?Q?+D1vVCn/p5tBDbON06onsSFZ1pG04c48MgMFkkzKSqmz+6sJyTY50zHO4kUP?=
 =?us-ascii?Q?ZQ4571Dfv2mNbDhV7tgzToxFxcq38EH3/CG7dh1mclrmV7EK3fq5GCEXjjy/?=
 =?us-ascii?Q?ehnDk24ra0EMP+62gXXALCj2psyBsq6xBhRt5K+aJcBlSsC7X0pK/018Xyuc?=
 =?us-ascii?Q?GaXNVG6s91DSDHriFNCUmDdru9m5BRqOEzWakEPqFPODZSoeyIbCgExh/klj?=
 =?us-ascii?Q?MGuF3n98+7lWrg/2KvEawcaqjIAfgMyldhupkUIt3MsZ2oLPUOVGTF6Kwk/Q?=
 =?us-ascii?Q?EL4ol+/BeJux4cuaSrjTKwIt/HAmPqEkHYVQ8H8X1IJj+xDqXTBAfLr1rKUk?=
 =?us-ascii?Q?HUDWpMXdkQAr3WMDmQO9zEai7gj0hAi6BC/Ijcw6uh4I78kAu9lsESQ9uXQi?=
 =?us-ascii?Q?9aGvMUpVY0K9mAY2pzw9xchCdnWTSu9kUlCFcXkRpHrGgrekGTFqyZ4qC1+9?=
 =?us-ascii?Q?Z6Y8YHuxvxI5s4BxAkBvucHhpShuX2yOzC7O?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:03:04.2097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3587dd79-ca24-411c-6d8c-08dd8f0a9967
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9422

Nicera (Nippon Ceramic Co.) is a manufacturer of a wide range of
sensors. For example infrared, ultrasonic, gas sensors and much more.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..e01bb70405a2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1061,6 +1061,8 @@ patternProperties:
     description: Next Thing Co.
   "^ni,.*":
     description: National Instruments
+  "^nicera,.*":
+    description: Nippon Ceramic Co., Ltd.
   "^nintendo,.*":
     description: Nintendo
   "^nlt,.*":
-- 
2.39.5

