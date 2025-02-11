Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EDE1F4604;
	Tue, 11 Feb 2025 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271527; cv=fail; b=Wuq+aQJjC7agAHgoIu8zQ6ajyZiqxEOMFlmb5eQHQWG4PoI9NNGiwZvxNb71e4YZOAIaX5Gj3D3I7IpqFKZCtSjSul/1KsyoFF41m4YTyUTpDm+H+Vaemk68ZxkIk1yr00J1GJitqzcqH7asHiTXlH5k2MoQTIgqZJUCxqSV3Pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271527; c=relaxed/simple;
	bh=imB/2RF/i5jkZ4PSwdMWcCZYK6LgqZeHVoaF02GQIG0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rUE4SoAs1/JwJzaTSR+EI2QJk1u7q6g5SPgo5Dn6VTt+mDpsYNKMfLyPz1E51Xe8AiEMNUxi2Ve9ZCXbLnsZgLVxzCi8oIvycfSDNAb2++6EyBFjU6nKIzbR2J9E8+Di0jr+hPxRQQksGj0KSysFm5R+stPLKVkkgCdJNv17IlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=NIo5MRE9; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="NIo5MRE9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GERcfhzVZjH/lNuAGe0huDkyZu1Z7x5PACmMb8dDDhjdHB0jyLK2ntZg4tU1adsdcbSzBQ6m9oeEq8meXeON2e0MDiNIsVEv/Z661kaH1Vk3LDPde41djUvmEqjJi8ThhnLnUvtZ8ylQ5w3+5Jx//Np3nq91GngUc78H/aGOFFcKbUvLoxk75qMcbBzq8n0Gt/L8t9DwZP38SBQZwYtghSBDykSA0iQnv54CYmjLFnQMzv8UBCbvEK4vufvGfbyd0OT5ewdylCw6Q4xkIAd8fjq+b03oPXW3Z8thGb+fiFz7EajPiBgXqTLQiMNrnYbCNqnEGjs0zLdJl0wS85cAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSSMsJTkIi9qUPh/fW2npOt3X9u7ziLBAQV/FEDIiQU=;
 b=ixzTWYhmY5XNI0v3oqLQzzQIMWbuNSOrOHW3rtsI5ZvwIAIlsmgJ8Vcx7mH3leC8stfvsu/iEyukflcYVR+xxjKJrKYFCnPgtzKVgc8+zcNL6c3koCvddRmYj+cZpbr2UeDJlSJliVnUiRVA0ymkmYov6FRAjGAaPk6FORW7HYvCXZKmKTUwz/Vd8HWYCZn85H3HlDlGVbiTNqBzY9P9fFNnic5qvEMio65I5b/XgpNJ+hipv6uQxHAEKD/WydaLHd6sBX2uGaGwsNgdsMXMfx3JwKlXlnb47NCRFBYFdiDEAHZyHyccFBlBzsIbKjvVHuG0OH4vkA0KbiQwEVAksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSSMsJTkIi9qUPh/fW2npOt3X9u7ziLBAQV/FEDIiQU=;
 b=NIo5MRE9N18OILT2rqEDROtTiBCAQDSRZKklZDb4XKFVrqmr3gjsb5CHtFrDnOoGLZ5NfbetpBFeadGySecDrh4i1KNdnt4+TZ38tr/lMi/GuoMPV3yqrOk6Zdx/nhPmx1CjvWC1LwJe1Wu4vYwezQOuExvm1RtKrh8xoDYFHYs=
Received: from DU2PR04CA0240.eurprd04.prod.outlook.com (2603:10a6:10:2b1::35)
 by DB9PR06MB7593.eurprd06.prod.outlook.com (2603:10a6:10:254::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 11 Feb
 2025 10:58:42 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::48) by DU2PR04CA0240.outlook.office365.com
 (2603:10a6:10:2b1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 10:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 10:58:41 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 11 Feb 2025 11:58:41 +0100
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m.felsch@pengutronix.de,
	bsp-development.geo@leica-geosystems.com,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [PATCH next 1/3] dt-bindings: usb: microchip,usb2514: add support for vdda
Date: Tue, 11 Feb 2025 11:58:37 +0100
Message-Id: <20250211105839.3328105-1-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 11 Feb 2025 10:58:41.0596 (UTC) FILETIME=[E95EF7C0:01DB7C73]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B91:EE_|DB9PR06MB7593:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ee4e2b0b-b6f2-4cea-e50f-08dd4a8b0c15
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2DRdtgyC6N0btk2RIxmyUgF2e88IO3TQmDUWfH7JJ5acSgru5IcEjHr+V6O4?=
 =?us-ascii?Q?uOSv8xiX8DoTrP1RJHxbl7dXnuHVg4QNl3h5hoFAz24SeZGiOfUwUKOjRUmW?=
 =?us-ascii?Q?HJzG4uAW4d8LTw8weDyUph0FAUOCO5rvbEkIGuLDe+uVJrveTnQdjkyps1qn?=
 =?us-ascii?Q?tyI+Y7RXKt4ml2jg5bYTsrQaqJFsK36v8ET2D8iKl4N4UpC8aBWZdljF3WBV?=
 =?us-ascii?Q?NK51rYmRT9kUqzuEAereBwMXIOCH7YTMQ3q+UbkQPOFrN69gRFV/nkAIc8OK?=
 =?us-ascii?Q?5Ble8aYyxiFZk33Bc+7KjW2T04W2GC4/WpziCPv77YvwRAlTrv4vh9jjAZAM?=
 =?us-ascii?Q?YB7ccAYP+erKWgBqoxSsJYtvq0fJQoqF1WIhJEJu8hy8ukiJ7DDULr3/SYZT?=
 =?us-ascii?Q?t3EjuLU39rhj2IT0o9twaJMKwspbS0NDTxO/yUoRf75gzQy0AXpin1MFGktk?=
 =?us-ascii?Q?bAzlXE7VXjNpA1uSWIxhE9/971rOYXac1aia3DBfUDTBmSSFvQ5vLXkPUxkG?=
 =?us-ascii?Q?2FsOKaPXJEy9Q8iruwyKINfWtaTDk+C/7epi6y8seBzgjdVimFe/4F5Yg3Ya?=
 =?us-ascii?Q?7mY/MTtMI7iQLWzL93ocTuBQo7FvTb5XnUP77J1JE+oOUA3RR+9J7+C8gTgh?=
 =?us-ascii?Q?V/gziTsf5QkHPTH05UHkk0VPeP7pBY/V27nw5iZoxvt10SM4Mj99KJBhxIxh?=
 =?us-ascii?Q?ZSTmVFN3+H3VJVp+Nm36J1dZSM/xOMgTPUQnCteNrrW/WBKNR8fna5TpZVZ7?=
 =?us-ascii?Q?ofX1a762MMvLVE/21KCBNZ5K5Gm1Jx6gClHCpsuk/TWEaaGj7CVy87HXosMK?=
 =?us-ascii?Q?uqcscd7cc3jVvsAjnnRtYLQZlhGxFkiWIdS6piDpJDBSqoSbK4HVfrYqdxKG?=
 =?us-ascii?Q?y5RNwVX8U0MPN38IMOauZHyHedgKSFBOjESNaH9bbjiS0h4DCE8mF7IkM88f?=
 =?us-ascii?Q?xnF7toAji6wCSC1EI3Sh019z1EwKZXOtHA9myL/rsZDlH3qyUUlPo2q5yQfR?=
 =?us-ascii?Q?XYoOTzOZfunBuQEtNLet04RkvLdAd7YMEmtfgkdiRkaN8ss1/CCP1dSHV1RI?=
 =?us-ascii?Q?pOARnxjQ3OPWLw8GiL+HRgiIeMg8z7BYHgJwLebdYXdTaCBzKOZXz0O8r5c7?=
 =?us-ascii?Q?/T0XOdItMg8UOWv0+yOqvaFuU3KfhNZueUNzbkUhmKRofTG0+8KKls3vrSgD?=
 =?us-ascii?Q?3rsLIcZzCFbD3r1iKo7dKUNI71bAXxsXlYqq11m8EQDoahZ/8bbHF8RrGxiv?=
 =?us-ascii?Q?0CVC3u/r2beL+82aD/kxTSBNGrDURf3ANdgnifkolYyEYi00LsRzqOq2pEOC?=
 =?us-ascii?Q?xMUtji7PqFoNTs/0zZRwhhpFcDafNpt2g4iKyzSnWSq+eQ/qKGN7laTnkKFN?=
 =?us-ascii?Q?U4S/kCCEusLtuxPYxEYykBLVHHoTSsT+4wnSumc6GQ8qu+iv0rnF0PSqpGm2?=
 =?us-ascii?Q?2tIFkc5hjzJWC2ZcEDMOWIxA/fbyy4KQqPg/k3Sg9JvDvttOJOiNKPm1QRG8?=
 =?us-ascii?Q?shFZpEzZt3G5mZA=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 10:58:41.8743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4e2b0b-b6f2-4cea-e50f-08dd4a8b0c15
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7593

Microchip hub USB2514 has one 3V3 digital power supply and one 3V3
analog power supply. Add support for analog power supply vdda.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 .../bindings/usb/microchip,usb2514.yaml           | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
index b14e6f37b298..743f7a22f13d 100644
--- a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
@@ -28,6 +28,9 @@ properties:
   vdd-supply:
     description: 3.3V power supply.
 
+  vdda-supply:
+    description: 3.3V analog power supply.
+
   clocks:
     description: External 24MHz clock connected to the CLKIN pin.
     maxItems: 1
@@ -36,6 +39,18 @@ required:
   - compatible
   - reg
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: usb424,2514
+then:
+  properties:
+    vdda-supply: true
+else:
+  properties:
+    vdda-supply: false
+
 patternProperties:
   "^.*@[0-9a-f]{1,2}$":
     description: The hard wired USB devices

base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.34.1

