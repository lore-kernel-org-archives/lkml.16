Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FBD238C32;
	Tue, 22 Apr 2025 06:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305058; cv=fail; b=C4ZvrQinghN5sJbLZCyTlbWlCPBkjevL016tUXaxWXNcWG4AEO8msPOyb2Hy93UUytN6h9Cse+SlM0stZ0FM1xOXXRMLxQPNfsIBiDHwk/jI9G0Wav4IGKv+Q+D1xoyZNII7ho7d0FiXMdiArIuHO/qjOErsveQUb13rLFs/K7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305058; c=relaxed/simple;
	bh=N17v5m9MJezgBllvRJBgFS6PeXF6edpxbHLye8hWuho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JMn9ik6MXbA14/eRocy8Ipp1ht+D4/KlybI6E7sbsTS1ORuG0BFSZzDtu/V9jeuFIOnS3u8qqJAysjthEi+Vp4HgP92uaENTPqWKBT+aD2VSckD6PHyAF8LKvSR/ECAgyRKPHa2iOqVP+6zn+NLg2qcihaw4E2iXf+iEbNE9uU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lP/2maTF; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lP/2maTF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7k0BcVR0oLtxH+yaEsbeWc/Fe0zdt98bOauBsScByIq3+5uEYdw/jckE5VgJarQh3fZiRwVRq2sPtd8O4czQJE224dG7m1GsMdDslkA0vyDCCHnGqSW2swhxMDJCEArkRz4Y0lZ0XHx705X5cIci2O174fZFByb3QPOi6tekOySDh0t7Q/kE1ne1TeLW49Hx5+tJvNxA+mcP5mxBR8LTiWeCQG8XGclCTCwAUStbM+5DC3fQp/rTD5OavMNWrUBXdwqU+Fke1/L9N1h4Ew6lbrkJxkF5VLIy7t9xwR4BA3isV8skeJTSTbQWVB3L7Eml8nBsm2k1HCM0ahn4Jgk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAbhu+d7Tf3oJVTiXL1HYDkJn/yIXqYrZ3ZaPMdigKM=;
 b=ZP9wuUnyh0DHGtpgY02YzssBACfFROTYnDxFi9AwCL92qDmNeMXB0CZMG0SeOoaFbsVZZuowrYQm/O8WS2Sjx2gNYxEjwLdP5dWlzlCwEtHh1R8vz7S6NY9mesgaw8DJu+9Vhx+z1A52Kg35C5j61PU5EmzHbDFSy+UvSOWBBx/RVQgUO0GRXZdGs4DSF5PYjEMxTb8adXQs9NW+GW1pegaOrcgyg0rxh7BOD+rt8Nk6cCa2uy5a6C2hXaN4uh5amA+7qic7DoSyf7sIO86raHcglmHQcMl4+1+z4KN1dDK6TB8VFBS9cJOqKuPP4/9s7UQNeZQw+iI3LaWU/qnXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAbhu+d7Tf3oJVTiXL1HYDkJn/yIXqYrZ3ZaPMdigKM=;
 b=lP/2maTFYaDKRge3fsZ8U06GaLCG1AYeLu7lYnjQkTwLeyfbXwFNbRAyGH/DHGFTHmRI1VxCPRa9jdv3PrtthgiPQqH+BwWMi9dTQzeVE2olOp/DR1pCK65UBMXg6nhbpsFD5mhWrPhW9Kwox25PtUCnhXLcX2eU/Skwx7CS/tI2XBuvU8LmQtcE462YUhc24UehigL5ZgQ1NJeL8UbjhDqsFF7uPhJacYlwwt/pwbrjjcuQftFhgZJSxHNxXzoS0q8TeUZAGQFfPzJJeqRkwGzQ/Eit46dowLgJLK0tq8LG4/hngwU5DvHpujC+uHtRwbrEJ08XQw7nSso2y4tsSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DB9PR04MB9937.eurprd04.prod.outlook.com
 (2603:10a6:10:4ec::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 06:57:33 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 06:57:33 +0000
From: carlos.song@nxp.com
To: miquel.raynal@bootlin.com,
	Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor.culhane@silvaco.com
Cc: linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V3 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
Date: Tue, 22 Apr 2025 15:08:51 +0800
Message-Id: <20250422070853.2758573-2-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422070853.2758573-1-carlos.song@nxp.com>
References: <20250422070853.2758573-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::13) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|DB9PR04MB9937:EE_
X-MS-Office365-Filtering-Correlation-Id: dde6a5e1-eeef-432e-5512-08dd816af4da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?314SvElE0kUJE4X4Ox9ncw1Hf1Zg3vslMy4SYsNUXeBUbEus8/SNjMgs7TWv?=
 =?us-ascii?Q?st9+ExSxz0McgC6DJbP8MBLecWX/gfM88b3cyVgIGZdu20iLk74D0nNE3ay6?=
 =?us-ascii?Q?0A1SipY3cWgB/CkSAHYGShYFszNsx5VcxIZsb4+WKt4q7LxFaBdxIR2a2XcH?=
 =?us-ascii?Q?zj5+lWM9mfRrR2aT7T7F+K7bpo+Fkfrx6j5wJHe4iwM5OcVJs7QXRb0L8TSF?=
 =?us-ascii?Q?aSuE7ENEM0OV9pD/7B/VgjsgjQh99uPY/fbJ0QTCQlKHdhhsDrnPUM/usu47?=
 =?us-ascii?Q?ZpZwl+tml9GljeSn41ytr7FCZuM39t1e+I09Z8F8AqLQjWAlGpHBdeeZG1xO?=
 =?us-ascii?Q?erGwYRswmYJo2Z9pek5kLd5/NmLsttlDRP50+BpFTv782Mx9Yckni9yT1E7Z?=
 =?us-ascii?Q?r5SDMbtcH1KiPJVfpXIVqGYw/nkuQh589NppkFAKILL6OHClzRnVBuizZKWo?=
 =?us-ascii?Q?x0oIDGz7tD9B2Ls+EHou+hVcnDSb2534RoofPCOR4qvRp23lU7CLY5aBp9Vh?=
 =?us-ascii?Q?c6iY/DvYeOu3EY9Vc2moaWPi+0Z+et3S6QfSHyr+s/o+w07gJGFqNdOIbclf?=
 =?us-ascii?Q?dimTlTrEqpS60bjsy+koiii+z8GFqSMs+JHsTjfypjQIJjvwAsIHsyNhGpqm?=
 =?us-ascii?Q?0d3n3r7Of+ZD7QhMLf9VsIxlMWDawiHO/c0bHj6J52CuOOsRF1CSRuvyJodO?=
 =?us-ascii?Q?jVQu+kKaP8Y4FOpz+VcCZDTfQSYFf7z51a7nElSewrZheW4JuWGZ/RkvOpF5?=
 =?us-ascii?Q?lHbK35rz6B+adKb1iuE9J/UAypq4DJLvf84CnQXgfVdIfTduobLp1x9cBwE7?=
 =?us-ascii?Q?/y6qzSXMhcf+WxWIPCcxTcLMFJHjxzHxzI3hihetm8FtxVmRT24PXwlQIX+w?=
 =?us-ascii?Q?JW9ydBge4XJ0HkiucGjERo3hQMpOSiB3dStJgRpdpdv3iZnsjhcGJJdOrRdZ?=
 =?us-ascii?Q?JLx0uKEj+CTntmBeuxVrMTGrL2o7wyKJ23kpQGEAs6kARp8eSgVstjGWfnOK?=
 =?us-ascii?Q?oygWN5cDBaYywjEW5/xiIfnFeXDzH11NzATV8eK/LOhey7HKbwvpBwVWm4Ax?=
 =?us-ascii?Q?88bCXP9u/gtWyl9ORyEC/3InxDKezD3pJedzqa0hpel2JdjSE1jP3oV8cQ7l?=
 =?us-ascii?Q?SKKv/VPtZK/uvqPKEqVI7TkV/7bcMPf+Z09wMuWpro8ogChQaFR3lJeLs9iM?=
 =?us-ascii?Q?BXlDcNWIIrSaVQWZx3x7rugNcsDj4Rb2owEzwiZTpiv/LcjPnbpTDrwQf0De?=
 =?us-ascii?Q?Rj6evA7DISIWKpueifn4eweYfNJ2HJ0tC9zU4qDI4QNIDNsewOag/HijcVtu?=
 =?us-ascii?Q?MWGVuihOj3hV4+kDn12qZ33TM3beX5TcLFL1boDVUZDw1VA/I1lSEBaB6wRs?=
 =?us-ascii?Q?9vBG3Io8HMjFUb0MNesgwEpCHDc8pwXxtCZhIHQTPK4pMOy8ZZXG7lIxmsHb?=
 =?us-ascii?Q?EdXAEwEa15Kfkd26+vYCnTgC1MBJWRIREhYKMUNxhJHKz5T6YEPbfl4D/hJN?=
 =?us-ascii?Q?lHeJqUBrgP8EqnY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WZYPYSIIlxFzVgoryqxiOK9GppbI7nH3dmDiogUTAF2RaJAvUHFCuHh+t1Q1?=
 =?us-ascii?Q?+zH9wDX3yW8nm6duNbUBa5fmXAlMc5WjDNwTq8r6tNp/XPGtf1SuVS2HHyqI?=
 =?us-ascii?Q?uMvHwdVnt6QDidpRMdwCLZosfpI7hR7XsIlbomiB6UmnosHKzPgEwp5VlxPu?=
 =?us-ascii?Q?bjhlIeqaZfsXDvHNFXk88DN6XyD+2ps5tfkD/fu0fDYoo9Z1HjCHvIAYEYJz?=
 =?us-ascii?Q?o0oV8qM56T1O5dSh8MnrT0d82mdwmfBD2IdSlgwsWou1IgdcuwGg5bd3zm7X?=
 =?us-ascii?Q?5p39kJniZuOz0MtxEf1cgIVRmvelZaEVlbbLm/tKDwpsc2X3nS0j30Fr+Sla?=
 =?us-ascii?Q?zY1WvHdlLLpiHeFZ8hu79YEd9qBYWAlnSnebTR8uuQUV1K9VIt4RA/tS4ej9?=
 =?us-ascii?Q?pareOYQ9jHFIqXIbb18bgpf3xWx3zEHtHnHsA2REeWxJ2oKDr3EBG81hUK6B?=
 =?us-ascii?Q?lgMlluEVujg5FOnnMkKPfAtD76SnqxNc4cYin1iQ+bl5HaiIGuaosERzwwVI?=
 =?us-ascii?Q?ODfh/cizpaV6dGs5+wWkYq25V6035cmZfiBVpNNczmSe0KANwUkei/zbPf/E?=
 =?us-ascii?Q?cklCFF/5XGebKDGa/PfvUHSZ7sHHhsj7jk7mHjF8x1ptB2JgNz18+0OplJJn?=
 =?us-ascii?Q?um3vTQY45JsMr/ZA0XcVC2aEs17WU/PVb6itd76YHmHw6BbYatXv7KPxQHGh?=
 =?us-ascii?Q?/cN2M0XfV122md2AuF6WYFnVTQE7fK/4aJ7oj5UjK0kBGQ71+AlXIHBL1yni?=
 =?us-ascii?Q?hwWFHyhOzVljMg9bZAYo44ZJZhJdsH+BQbeXctw0bVwSEnU20QClwOBI6FUi?=
 =?us-ascii?Q?ZGP8CX0/LAJh8GynbKQ3+8QYqGSNqqDiQgRSNWOefqdHG3d1kNVNqbVRt9hN?=
 =?us-ascii?Q?15srztgiJTBpqCmIQ3vMtP7OOrjD1LAq2OSUOe/Y9xOov8+8NwEbYLWt4zPh?=
 =?us-ascii?Q?GO1y4bxGmTLp55SpU22H+lUtEtvW82zFVha/xiqjSPWy0Lz9Og2rI8llE49I?=
 =?us-ascii?Q?qvtLsGDTZQjmwIT6Ko1VvgGJscXj6ryWxR+jyGlPVhLxoCkyLwpuyWXnb4rh?=
 =?us-ascii?Q?c+dI8CJ6ow7fq3qM10524TB57h/gbdNed1Q/F0iwUiVLL0OGeZ7/oAUvE3x9?=
 =?us-ascii?Q?D4ZVZpYdGfIvQzdD099J2tpzgZD4UdhRLbAWtVMTGoHgkeKXnRBQujwjFJfK?=
 =?us-ascii?Q?8XIG9S9r4+0vZJGoEfl2l49QTkZMMj7X1IPYN96eVij1cByHwXUqqb0juid9?=
 =?us-ascii?Q?XSwuyHpmSdHwzEJZZF3HL4Y6VsjNg69Xcf6BRzZ/rp9RTFuw8lmoVIJFWHTa?=
 =?us-ascii?Q?hTuw9n8JZ7/GBMdOxUGsrOgJwvWJnBdqEstspqsRMQ+vWtmXtYIAk6a6O0Re?=
 =?us-ascii?Q?ISIYlSZq5OrTv03Pg2k1G9oodOdAvvwl0/caM5Don7arm/WI4Mmyx2rkUrIr?=
 =?us-ascii?Q?vAwGnrcfcJpaqU3fqtBP95iYSOpPiw42qz8j62jQHk1NCCQYnpZgjkVOkyEZ?=
 =?us-ascii?Q?5hL4AMEp28REtl4o7+oQZcCeCG4TezP1LNUrqaiDOBLC8UY12ywl1Venfi6P?=
 =?us-ascii?Q?GkOz9fv2bCjfm2xYDniROPx98jS7/FUuMZTqSyDG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde6a5e1-eeef-432e-5512-08dd816af4da
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 06:57:33.5716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGmlUcZQD2RMy1ch7HT/N7u6/HYQ+7Mv2Twl2ZfnYqS+jZgTIIIz08ILwG5VsXVou4k0UCiVhCU6grKamewbcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9937

From: Carlos Song <carlos.song@nxp.com>

Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".

Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
three clocks. So add restrictions for clock and clock-names properties
for different Socs.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Change for V3:
- No change
Change for V2:
- Fix bot found errors running 'make dt_binding_check'
---
 .../bindings/i3c/silvaco,i3c-master.yaml      | 45 ++++++++++++++++---
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index 4fbdcdac0aee..fd64741abc0c 100644
--- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
@@ -9,14 +9,17 @@ title: Silvaco I3C master
 maintainers:
   - Conor Culhane <conor.culhane@silvaco.com>
 
-allOf:
-  - $ref: i3c.yaml#
-
 properties:
   compatible:
-    enum:
-      - nuvoton,npcm845-i3c
-      - silvaco,i3c-master-v1
+    oneOf:
+      - enum:
+          - nuvoton,npcm845-i3c
+          - silvaco,i3c-master-v1
+      - items:
+          - enum:
+              - nxp,imx94-i3c
+              - nxp,imx95-i3c
+          - const: silvaco,i3c-master-v1
 
   reg:
     maxItems: 1
@@ -25,12 +28,14 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: system clock
       - description: bus clock
       - description: other (slower) events clock
 
   clock-names:
+    minItems: 2
     items:
       - const: pclk
       - const: fast_clk
@@ -46,6 +51,34 @@ required:
   - clock-names
   - clocks
 
+allOf:
+  - $ref: i3c.yaml#
+  # Legacy Socs need three clocks
+  - if:
+      properties:
+        compatible:
+          const: silvaco,i3c-master-v1
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+  # imx94 and imx95 Soc need two clocks
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,imx94-i3c
+              - nxp,imx95-i3c
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

