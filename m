Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDCF2AEE0;
	Mon,  7 Apr 2025 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038837; cv=fail; b=Hjr1Hlv7d4uE2iVm7mApAQTxmrebC327D5XiSfpsIHh8UWyjdbCcw2RloZLZzks+sWPb/W9JDHpLsFsf2V1Q89av1xCA65Xn3cExgYEVB8yCW3bA4zGlnu/xG7LlddSuHPeA9F5nLScfiznxl0oUzYIV9xt9W+DjP3S2LFa0eq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038837; c=relaxed/simple;
	bh=GSgK/PHKOO29mHUcnHyHAMObmawMRIZ1YEwIfmHhPko=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tzdafRj9YT+CR2a/dkssKdawYjdR0Zy0zPmGZ5FLNYR3m/QBkxBMH/MAgMuQ8fsf7tFsIwEYWkp5TdP7PRNKpD3gXrWEj+3sPBsaA7FReUez5WCMGkY8waN77RqjwmTArGxHQX5Y/ycDxCkndYy7fPaCepBeZcivjZ1EZAjxAzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AmC6vCUT; arc=fail smtp.client-ip=40.107.21.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AmC6vCUT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h45nkL7erM1JORF1B03eh7id1F/cKwZ5qE9IgxXYYzzXa0RXOGMQL/0w7DwKg5Y9l8t2fhVBhfHJy05CMG4ipbFDPR0GlqtbegeE0h46DBL+Jzag+lpLotGYFU9KIt/HT0E2IdN5emptIOcQq+Gn8ooHXX7fzKX6+GyL9SREFrKhcYOtslQH00+pfKi/bVGPZkX8oTggYsBGZ2EgL5/qX4l44hZ2GDjVT2P3hvUmI/7Hh2bMywbj+7u4Ko+OuDgB/XPpjilPgXB2QqfBi7tyTv/EoVvAzhZ9+9bSBgcNGFy4IpcbTiH/yHm5EkSn38j80mnlU+CPsQR9citX2NeVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NKUpv3lWeCZBgkhhM/2wqHsIOEXawW5z+QNsItcxdA=;
 b=DJq7OJ2iuLXdRGgWqj4rWDPN/Kh7Nh8birT9asGDgjVjkhrgjePHmvjf4jMD/tsdaTTLBp+yeWRLfuZwLaOX5tFw8djoT21u4dqYi3afoOweGGgGpD49MgFw3+WsS4XfyJuomg70kepz62FehpyPTWjirruJSWaiQS4FhitZGEpuyEoaiuL4pKbAIdgBKFBvNbCk+YiI8UPsrmqtjXG6MSa+gTwez9rj04F4u96NfL/tEe8/QzkwP0MdUtQAed0PxmY2Mj/egtSiFF4bo8/BkhtyRiV6CDC7UNRHD/spdgZ/ZBwuuutcdEz2ymjQuzXalO4oabzt5n7sXofS6d5l/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NKUpv3lWeCZBgkhhM/2wqHsIOEXawW5z+QNsItcxdA=;
 b=AmC6vCUTzIG/lgzhtXc8I6T2nCQZYDVwVO5ZjK4acrGRGr07XzkEvHmRzH/wF9p0eUHoCwzOSCOG0LUi74LSrBKThJlvAe+LWs0UTARwtPtHOqg0JlwPkSj4U+dI32q41sjVL65y/fzzvTL6lQPFjKG6gE4+8j0Wh2wyTvcTPolG+HI31QiY0JsXqhNWMAENmPUh7SZTFGYYK0UbZHdrNV5Bi50CQT1ofoBl/fWS7P8ZLSR8IeS+fSnVL9lTvTRYaDiAf6b6/CrH1bOZb07z5Ou96tEowS/qMEvhegUBzCbn8YnMVOtQI/n9zyx4IQRXnbRCRXIssTYl8eF9OSnU6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA3PR04MB11251.eurprd04.prod.outlook.com (2603:10a6:102:4b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 15:13:51 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8606.027; Mon, 7 Apr 2025
 15:13:51 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bai Ping <ping.bai@nxp.com>,
	linux-kernel@vger.kernel.org (open list:CLOCKSOURCE, CLOCKEVENT DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH RESEND v1 1/1] dt-bindings: timer: nxp,sysctr-timer: Add i.MX94 support
Date: Mon,  7 Apr 2025 11:13:39 -0400
Message-Id: <20250407151340.2779124-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:510:5::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA3PR04MB11251:EE_
X-MS-Office365-Filtering-Correlation-Id: b482b65c-d5be-49c1-1c6e-08dd75e6cdd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X4zGIZcYGzJtX3BX3imL7qbjYBFTC5EKIolLi3V7FPBe28fFfXpPNGeUEoZS?=
 =?us-ascii?Q?sx0PzZt7R40evhsWOpAXYc/hKo5GqBMR9AW6uT5j1Bk016mtc7cDWDggoORg?=
 =?us-ascii?Q?O/KxA94pnP6JD8qkI5JRkwAbTzlittQaJVyKfA/GpCRPVtkCST+Zp8XNzQr+?=
 =?us-ascii?Q?HM561USSgXOeCcQBcogFgQzfinGw57nzfsH7+YKqgM9BQY0xQdQjkJuQ6GIi?=
 =?us-ascii?Q?/UYTGpzP+gHjzoLmoOSo6PLysoAY+5bCedhqBg8u8nd+PpGCEyfa9+G830WN?=
 =?us-ascii?Q?UMj+OAOXSq7L/hDqTHwfQqhQVao04fMOMbFWLDRzOPCnSu0RQCiptjffcMGV?=
 =?us-ascii?Q?3KOqmt77pFd3AgXlxfuTtjajsox5AM/8hwLGbX5o7QtUznrkU180bZOZ4kk3?=
 =?us-ascii?Q?Ra+6X8wnFoKsk1RCQuopxBM7lJSJoGMGSGMq6SGP6W0nuSHhvQwG8hzE8zqV?=
 =?us-ascii?Q?g4eu/rZv5P/8j3E+XfOtMu2yhhDieZnM8GeDOupg7a3f2dYbZXYYPKUtjGP3?=
 =?us-ascii?Q?nf5f77YyvxyQpirROt2Q3GCmBvqKFMY9FZzgPYHAIEgT7kAuWzKdtVby9kEP?=
 =?us-ascii?Q?BgvQcyP4yQNBjBd12tOxauYoYRSTzK2/j65u+FTEdJ9lgd7udZW0TGfgLDPR?=
 =?us-ascii?Q?RAReRk1mE7Di4SNbVHeIe86mlPt4y2jrII2MYnoLlzBkgTGrwef2Y4xv/Fe6?=
 =?us-ascii?Q?bLMqF0DFJvXp+IIu6qw5Amzz19LSNn40ZiKIKVwPuH3P9BtjcQU77X8C/Xxx?=
 =?us-ascii?Q?ixRbv1hsipJGIeyAFp4gnnZ9NoD/EtgjBlzD7zaS14znOx6NeeDoXoaEhP82?=
 =?us-ascii?Q?xTCCyZKiyPjBwvlNONVdHZH1TEluHRHFjixk9+vB/JNrszuK+k2y903jz3/j?=
 =?us-ascii?Q?7S8uNhZRYjGA1D6o1yBe/bLj7jHSR2T3dFHIRbbabl2p6jphH3WmKTYDkk/u?=
 =?us-ascii?Q?XIp5u3GcK3eiQd5GewlZ1XX8f+PrW3OGbEktGH4p+gZ1vtTauPPNQFXs2pfX?=
 =?us-ascii?Q?BvKIQiYvilqNI/AhaIB7tzcrZ6aAcQDm9SwwtHkBxYed5hmHbz11GgRg9KWU?=
 =?us-ascii?Q?m3w6tlOiBHAai7/ZfFagr9o2YLzXS3eTY3588cAmEuCWfzCVdc/QLTq7dFL3?=
 =?us-ascii?Q?CqQ7hysNRuMLST2NFmQVo86xrTNXCwJKz5ykeUu88D8yt+PJThMje+fQh+Zg?=
 =?us-ascii?Q?9q7HoX3tTKu8YUqLIg6Hdw/r8B2wpfrnf1/wH9hQPLl8fwBsF+MINjnHkLBE?=
 =?us-ascii?Q?22gMv13pjs/Z8aCJWCLaY3o1tmq5T9SEFcMpYE/GgYBADTinWfvcu7FOsHYc?=
 =?us-ascii?Q?D7AtTBlTAOYPP+W4wtgJo63DyRZXMyWhaD4bxm0xF7u3lz6sKwUGz+7ESlzZ?=
 =?us-ascii?Q?kPePKIWcO8Je/9mF2C9AVk0i6mlhGmhV5JRO3HN3UXr+M7lHzZF/CK5W5uAr?=
 =?us-ascii?Q?C4zDrFwVAGlXGCiRjaWGvH2GyaOEOHBm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4Iqr/HM7XsFsPEOx8YniPNmzZ+VJpVFVy0y0Gj1nZdBO7aLSsrnaGTUNO64K?=
 =?us-ascii?Q?gsGsCpKVt6/VeX+9+YVPbMEZp6uEQWj/PIsbGP+9RdOJjwJzQ3cPYNBT0ght?=
 =?us-ascii?Q?dXeI4sZAgdMctqQ4vQsq8bc5w8fuj/DRADxZsItWbG5YqmEER8ML9GCw50a6?=
 =?us-ascii?Q?CTROaF13mX/PoZeZo9xPK4a08GrnNxY2/1zn9FZp0yHuU55+i11Bz1VL/T13?=
 =?us-ascii?Q?qaYeGbzeZcS3X8dRcwEp4w7j0KNwqb4MX2OuHPaXh/QYvtvofmlXSIOQiD4d?=
 =?us-ascii?Q?k98UB5gcpvEIQ/ENM/3ZKl74o2y9lwXCC3AQSeZfP+1nrNvB76gzNz2oXPkX?=
 =?us-ascii?Q?wNbHCYfjapiTaxzFPF/XIaw8xLCwucWmpkDprlZHOvdBAtk0Lw0PyNVWjeDE?=
 =?us-ascii?Q?I/PKw9PYVtWqXzQAwclOlOmrCbBmnfdbannyHP3PabPcTJS6+fRDgJ8vXSKs?=
 =?us-ascii?Q?qErdY+uqyfdP1a+CVaflddCuc2x4Cs/aP/veRtPHDaEazCJc/zqOmAUM2VEd?=
 =?us-ascii?Q?Bwrs1JPwLb8D/HWh6HQp+bNqmX24rvUtHkOEEjogUCJbCdCmrHdvnXppgnuW?=
 =?us-ascii?Q?JINKtLpB2CcXZYi36rtY0JDPVO+gC88VxtLnqxsW5abX5Zy0xDyCpNnsVM7s?=
 =?us-ascii?Q?4EeuZ19mrwYo+pBa4ntptroYwqDOJOhC68lSofbb/7oeMmWCtEm0aWgGN9P6?=
 =?us-ascii?Q?Dfgnl3ajIB11ejiKAt0feMKBv8DE6lOCwxe6FJkumilEun5MUomAHsWTupSG?=
 =?us-ascii?Q?BryJzSNex2W0nMJX3awgSYooUOdYKsRL2LwtE7AUaPVA6g0xWSdM7vxwXkdK?=
 =?us-ascii?Q?46fs0n3dDA7HL6sH1mlNFSEYW/kPk8JrAvZxtGgMNmpjhMSi4VTK3P6sDur9?=
 =?us-ascii?Q?xVkUUmBA7vp3SuLzhG/B4CReg1Sa0Vv6dyZ/apZkDKTn/Xfiqzc3E3D3iFnf?=
 =?us-ascii?Q?2ZN+QNDgUjIBTNGfG5P/h3/ePlbPOv6SiZe/svybjEprqz+hXe7kkeN86WCC?=
 =?us-ascii?Q?Aa0DZ+5OlIVETzZ4JqaWanPDiZpGsLLH5+OkScSBB4sZbVAp+4Z47U03tWwM?=
 =?us-ascii?Q?d1E8tW6FAwBTBlT5LO21IZ5gImm5Z/Zl59vIMiOB7HZhOwh50vYwK3P8Sehl?=
 =?us-ascii?Q?tvt15owewvzl36urfX1zFDsc5iXf6hw3nMiw84mU/BhE0zNzzhExvv855q8Y?=
 =?us-ascii?Q?hI77j1G+0apwBh4gMWSPPh3CKJd60QXJDl7cfnt3nMJhTPs/OcOj5WryR21U?=
 =?us-ascii?Q?61aEfbHeONDhWVL328TjcOBsIebkso+zeKUUqyAwqH2ujuTPwTIqEyqLoOH8?=
 =?us-ascii?Q?8VssUqUpcDISfPYwvcFeCwELeU10SD/LsWP7yP1+FyR6quMgz9mJ+/rxMPKD?=
 =?us-ascii?Q?o0xp7MDFcpNmS0Eoxnmx4ZqFE3pVLHfvBmRIsqLWZ8p80Q1WZNYoJYBp8O7F?=
 =?us-ascii?Q?HymoM95CzFZr5NaYS53Cu2BBi7hEzZcZ0PY+bXab3cthfy6xh5EDw5rT4GOU?=
 =?us-ascii?Q?XVxUFb/ZFhcDgOpSQjzr1gJgN/8x+d5o2MrYte03Z2Dcj5D9CE8Brz0ivEsx?=
 =?us-ascii?Q?n3N9zMn64VcBFTFxra2D6ybkm5tKCJrWJKqJLYe3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b482b65c-d5be-49c1-1c6e-08dd75e6cdd0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:13:51.6010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BflWgJ4AlbADQcqJZ+LZm1VpVGKeE+o3c34BBiMmdAOsNy5PuXrOpsfftRO5SE4dGvGyaP4wgn6l2fqyYo167g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11251

Add compatible string "nxp,imx94-sysctr-timer" for the i.MX94 chip, which
is backward compatible with i.MX95. Set it to fall back to
"nxp,imx95-sysctr-timer".

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
RESET collect Conor Dooley's ack
---
 .../devicetree/bindings/timer/nxp,sysctr-timer.yaml   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.yaml
index 891cca0095281..6b80b060672e5 100644
--- a/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.yaml
@@ -18,9 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - nxp,imx95-sysctr-timer
-      - nxp,sysctr-timer
+    oneOf:
+      - enum:
+          - nxp,imx95-sysctr-timer
+          - nxp,sysctr-timer
+      - items:
+          - enum:
+              - nxp,imx94-sysctr-timer
+          - const: nxp,imx95-sysctr-timer
 
   reg:
     maxItems: 1
-- 
2.34.1

