Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010005.outbound.protection.outlook.com [52.101.84.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706ED1F7569;
	Sat, 14 Jun 2025 21:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749938215; cv=fail; b=qrXXpsQiVkKb9mOY1XIZFwd3TrjsOrq7zonDHVlPS1vp9x21e4LI8jyxSU0iZb8gzANzjY/8K6oUKLFgvss5A8psc0wa1kZm3osdKeitU9etHDphGWOKnAevZ0dyg/3iP79OSyxI5QuthsciKLBd6kaSKuHTnI8bOFPanv7Ixho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749938215; c=relaxed/simple;
	bh=8Cvqt+DlgCs6UfMI57DwJDOmtXwSFov8YMFlws4Jcf8=;
	h=From:To:CC:Subject:In-Reply-To:Message-ID:Date:MIME-Version:
	 Content-Type; b=gozT10yjZ5oqD6za0mmREhZuHCl96x83I+gxYN40QH0Xr3owualxp3b6qGMKkzjsvyxGQXlbaPwq9I35CRxhIhN2CngKBiWz5na0/Y4v/vmXltQi4+OEC+ZPgtdUR+pdIqrGCfAnx3F4B6Ljs+XUM3iKbMYTFFi9WzhYks2Xs7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=A92hFNIe; arc=fail smtp.client-ip=52.101.84.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="A92hFNIe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mfpj5f/Ec3qW2KCY2CBhJ+mXdLCFsS3d62IkVtNHg9H+PO5RQn0UJBTzAl1Wgv9pgbXjvUzRfWcUtIwZmAflqrLAqWWKoEfbD/WF6TESvFBUUu8udIl105CczlwOm+cVXvHOAslJIAPD+e5QxKJaR6X9nObNlCVKuv7wWUW/2aDQs5Cqs9EGKyaEm/YMasZpDBlaA5aFaXuRER+8YwmIl7IIdB/4zz/M9HtMXCXAG3xwOsQhwouTx4rp5xJBieSvAWJxZhVp3eV9dPvMy7OB4ti43FUBYZVxcyjq9y+CNih9L50FB+/iLwJ24H1sZDCcvnPhFWJ4rnWB1w2nXjI2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVwEoEC0fY+Em7C9JXGqVPn3fxBq3rC+HEuONmSmGOQ=;
 b=tORL7kKCI/OWhT+BzeFmTFq3AryGqKZz+gIpkN1HzkX/5DYd7/12CR6rEO2mHtoEmzBilufEfc0nTwqB6sbOxw3eFYUPOQHp4bgOKlozwa0qysvpzQfbXFaZK/1rXL0SwZ4BXOSBKtSaIogf8ab5NaXSJfENU8fWfPPKiHS6SwMsEQ2NbgHOsF6GCIAsLcUx0e6YXcn65T622tviTb/eWbUVw/wsoTSuM4VVL3pQNdyRyHljz73TM4m8DE1BR1ngU68o39plRkXsvrEClAvcKQwDUp3ZxOKzDUIX+EQsCpPS36pCNcVabcrRj9JZ1bwH/ELJMfzKkVAHaE/Y6bs6Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVwEoEC0fY+Em7C9JXGqVPn3fxBq3rC+HEuONmSmGOQ=;
 b=A92hFNIesCGge42I87CV6QPb9FcSp0Wxrw4Ku4LzcTFTwnnGGwjyKc7VPWaQlzOCU9qdFFk85ruDx+8NmH/YPrU9vpYdXBL28EWll2psqL0nGQSYa52N1W6lAnJSQEkkJy9bW7/1YDeV56/KyCmHpowQQ51wKcgC5hWXgNgz5VE=
Received: from AS9PR06CA0504.eurprd06.prod.outlook.com (2603:10a6:20b:49b::30)
 by DB4PR02MB8630.eurprd02.prod.outlook.com (2603:10a6:10:385::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Sat, 14 Jun
 2025 21:56:49 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::fe) by AS9PR06CA0504.outlook.office365.com
 (2603:10a6:20b:49b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Sat,
 14 Jun 2025 21:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Sat, 14 Jun 2025 21:56:49 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sat, 14 Jun
 2025 23:56:48 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <kernel@axis.com>, Rob Herring <robh@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Nicera
In-Reply-To: <cover.1749937579.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <6d6705440a3c28ed4c6746dd570c7a7d8b6d3641.1749937579.git.waqar.hameed@axis.com>
Date: Sat, 14 Jun 2025 23:56:48 +0200
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|DB4PR02MB8630:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e37790-1f17-4cfb-13e3-08ddab8e5d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZfbZ/u4vSXVBpqUIcXnCgKaE+vznP1ZnkyGZezw7BA6EFtJA9oUc+x7EbsNu?=
 =?us-ascii?Q?yZOqBBPgjWEEvzOFRk1p71V1wZ9zSoMAZZP2ZEEaRu+aTtGXMYcyFpUpGN5S?=
 =?us-ascii?Q?OyepjzVslN3Ovo5Smw6ckmCX+0iJFB0FwRa0kkjuTyIzffFD3DdMhIAoAKtE?=
 =?us-ascii?Q?q7O76y7Q+UaZJqSVYOtnGRd1oQ0hNQ5UyyL/3GuhDmq7/R12SUJmFjGGrVZb?=
 =?us-ascii?Q?DjBKRhgpHG62Ze/iDewaec6vaymQUJ7eS2VOIyjxHec1QYQeh0BhOCCXwFa4?=
 =?us-ascii?Q?B7OvC/BSQ/eyXdlCYEeIHR14txEMCh2YTbGdDoMuODuscrytS+qH6fHQ01fv?=
 =?us-ascii?Q?aVunpkFUH0lGbnrUsBH9zX/gwEjwQZwpxDNzgdsR8YT5mHu4POFMEFL8NxC1?=
 =?us-ascii?Q?nRvlMDBoXs6ql4nI7k2xz/cdljD0mc5jNcSfjBT8PRtghC2J2V4+ztpDp9z1?=
 =?us-ascii?Q?53KL551dNtkPryFo0O/xWGsLHRvT3EpciqAyJj4jPk8IhIjBBViFxj6pgWvT?=
 =?us-ascii?Q?jBZpjdGirf4Xa6puGicOBWE2a+C9H3W1CQPg867GCrafNnyqxFGtV3ckr8T+?=
 =?us-ascii?Q?9Ytbtc7Dpggw++iY+3fFO895JjkCcffYdlZX0ocHeYfrXV52JWKa3bNMx6H1?=
 =?us-ascii?Q?d3pRx5VlUg82GkSUwrXnB6voIzTYz3UsekIAZhdMterPzMh5A90+eGpgVAMv?=
 =?us-ascii?Q?WqtjuqeLc15l5AwfwNbkV59ZsJI29e8HeTh6EC8FoT7gXekECvisYLqibBID?=
 =?us-ascii?Q?Vl4Jf3Qj60z3n0ZYgShV5hAj2haAbZJi4Aaaq7rccT1CNc/qgY2kESzjVI0K?=
 =?us-ascii?Q?0APW7jXXGUwq6knJwR/H7Ou4PncCa3Yfj6CW2bdmmSe6pdXFD2DS7sg0qP5h?=
 =?us-ascii?Q?mHFRXYlU5WjycteoFTy0XlRJBOK5RwR72ji0C/KTakFe9pCsrkaaouCgIC9A?=
 =?us-ascii?Q?fJPrhUCKWGp34h7sYgBJw/JXXUlptliaUTvb3vr77IhvouEl+QhVXVcsqMXV?=
 =?us-ascii?Q?oLUiQ4OKq3vTsrGyPePcB2HEFXIok+hHzdOu/zN4OrtWyXA2mICm77fGg02R?=
 =?us-ascii?Q?fC47+aaf2sJ8sBraKrivGIYUyOKelatAhUH7YQkNw/bDuEUb32knNcRhqH7P?=
 =?us-ascii?Q?x+prgNYWQ1od+Qs1+Mta0+hieSWgD0LSa6fS2GhKVHmnt/s476l9c2qhe36R?=
 =?us-ascii?Q?3F3L+FAin09nz8x/E5vTQYEHXv/oPVvFBY+BdKea9+Ri9wfstrJV+/yeeHQo?=
 =?us-ascii?Q?zze33cYp12X7Nk30G0rYdU+jAZphCdfKpHli8H1GMnfKAp9Y0PaZPnFwBPHd?=
 =?us-ascii?Q?dfa+xwb5jKKpiBVzPkqzf/VMotBMwVznLwWIVAD1BDvPiUkMB9IsBFYGjadI?=
 =?us-ascii?Q?u76+71PO9w99mBEeOaq4VZCWatiyQrUDOhWn3YIWy7BppK3D1xRBTs6zjwUx?=
 =?us-ascii?Q?qZbKp2yF0yWb8kfoxgnoOdfgnT39+j8aBNFgRrJSkf2Un8O5qQS57pY48rFZ?=
 =?us-ascii?Q?yhnAufnguqEz3k4PEnykIcdL9YGRrtUwFNET?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 21:56:49.7493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e37790-1f17-4cfb-13e3-08ddab8e5d72
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB8630

Nicera (Nippon Ceramic Co.) is a manufacturer of a wide range of
sensors. For example infrared, ultrasonic, gas sensors and much more.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c01adbaacbbb..b41cf7ba1b04 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1067,6 +1067,8 @@ patternProperties:
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

