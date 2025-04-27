Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B61248893;
	Sun, 27 Apr 2025 08:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745742114; cv=fail; b=AEi+XNYK05H1b1DSNFKG+CimLP8GLj7kIugkZizlRJC9wzpUyf2Alm7jZwk/et4rwvIS06zPvI9x1+2BWVUpQDx+pSu6ZeJJCJ6MmEOhNTqkpfPCuc5wpPjT8uSxfVYO9weKqbO6fXZbK8JvybZ2p4TGtUtUuMZAjnqlUZFlrx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745742114; c=relaxed/simple;
	bh=/Nw8d8SsWuSrwPYYg+6Fw5dSKkq8o6qqPgSojfMvyd4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JZZcq/TrKjtlg294QpOcx9lV1mZOfuix12HUa7s0UJv58Z9ikd/vFiXS4fefMC6RmYfIVZrAwb3DMBxY2SxiZxAFqUH/OHhpOw2NXLs8NkOmwkXfYlRfEVR28aScLjfIefZyVCHdIpWyG1tA3yqZTq4bUdHngMy58tw5qD/iZLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZvGdwJpc; arc=fail smtp.client-ip=52.101.65.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZvGdwJpc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtmrP7ySDInHgCCS+V8TrBRCADR97Ai1qWnZjlrYQXPZGozT0LSKltp3hQFNxkdOC+yzQvBI370UuOfKmEGS1V7HfnovYBE3QesuztYMOxBkpT9RYHBdjM5h5rnXrseGbKSDWboP5bqw6/yjP4ivrPTTzoSXLAX0oO5RlNNG83CCSsqVOUiC0d4qbXkN4fe9M21k6vxOJClNChzlVmGljaikL857yHCd6rpEkpHDozdyQaoLfzkz8kL93y+dh1+Y9xin8UIZc2h4+lCBVRghqbgk1CgU8rQx7ZGYrEFQb5T1rhl+dvlXlMioozuOPuJXajLfGfUD2rbDvNgWGFTWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0smh6B3siCmi0o2Nw56siu+ufUUmUezuf9bzA0ym9I=;
 b=gt2Z8W9HHAW7R4uZFQ6antRqfDFpLP7esrTh2H39DQ5vGMU1cWfASdgXrEDgl2RR40Q010C/2cqz2LJ39X9wlocyPRbWpp5yhVV0BEbZOdy+UbVPdKFi67VhjiFueABGBsQj5z7spNvH7j3wzfztY7YAyDifr0x0dzCHz8hW74b0uPnYldfX1+GbbKaZbbSlhageVNEYSXMLSX7N4mH/ofDID1KugoWHVeYENOS1P7Aun9hYIZDqCVrrRk9pbQLpONiU1Wb5aWmprlOjoGlEUc2zLwkAszEN2prP9aIgGSBw78TTd1MVCBJjsnmGeDE0Ro6FF24okiOAW2AVhdWLSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0smh6B3siCmi0o2Nw56siu+ufUUmUezuf9bzA0ym9I=;
 b=ZvGdwJpc30qE/gZ8zLoG/TNPN2XsHPUYa9IeyIFJ8HM8GRBFNMQFGQuzpi8ziEF6tqEwhQP/jP438J9zv6XxNwl0eVPqa/vS6EMa2IprcvNcho2E8CJWKcF6S8SDdqzFxSRQtj0Icp9Saz83N01mGjsxx+BFqQ1ugjBQ4NheeijM+PecSUjYTepwsOKlhzWBexouhisyN6XXtbzKzTgwwatpY/jD48SiLybpSN2uzbhoK0wU76WWJW9GFlZHDO7g3DU6U+plmW/tLVJaSnG+0e7cmSMuWkVb+We8FwGRx2R13kYIniqO/WHX8kBorpCgMxbOqH21i6DHYt9jtNghZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PAXPR04MB8474.eurprd04.prod.outlook.com
 (2603:10a6:102:1dd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sun, 27 Apr
 2025 08:21:49 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 08:21:49 +0000
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
Subject: [PATCH V4 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
Date: Sun, 27 Apr 2025 16:32:28 +0800
Message-Id: <20250427083230.3325700-2-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250427083230.3325700-1-carlos.song@nxp.com>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PAXPR04MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 12af2994-1c80-4f1f-bc91-08dd85648e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uh7+bYMkNyEkxJElh9ePdl0Rn+1zRVv61s1MjK1DCT4PtQWMC/cxBXqzTT8p?=
 =?us-ascii?Q?A0AKzzxXRGlcHIZOn6xc7CGPkNhFQ3lc9WxiFxo9qflTKNDT/1ie3GpOMwL4?=
 =?us-ascii?Q?KA5rLoUUGix3l+4ZPKiRUdXte8woyUn5A2MU4KyEJpUYOC+6Vb98XF7sY+Ub?=
 =?us-ascii?Q?m6ksnq1FDm67ygXDFKZcBz+CgHGvKkOUhTtteBkXskg+GhdcDSQnqOq5DEM0?=
 =?us-ascii?Q?mGbS/jbgCDmzYUiwd6DbQXdEWEER30853L66qkX4SjT5UGSP/Y1JEmaTn1gs?=
 =?us-ascii?Q?oO7QIqvCngBceHizRReFcNEEZjglPuYs3zpK7ajV4rLuXqx5uEU0Me2EtPjg?=
 =?us-ascii?Q?Pedrp3E4Kc/b8tDDxcJ9bgd3zCFTBkKA0w4gt65ixsvJ5+63+pFRn0u4Ff3R?=
 =?us-ascii?Q?XhFWweaiGMEPDJsp21TjTqWmLj7Ex580w/D+Xtne0ctJBeTpF7mTkAsP9txh?=
 =?us-ascii?Q?F0qB56ar+H/o8WW8h3P4IOfUBj/WutmwmnXt+jpAleeehdvGG/6ycjoaLx6l?=
 =?us-ascii?Q?2lFKn9mhNczPWb9U7mQNy1GsztP5UKlIHDNqnzCA4l0yUe7INS9FqENm46mk?=
 =?us-ascii?Q?mnl6VlfvCRB08F9goGfG8of3IPvvYBdx0mVxd96X1fbQ6dujbqFCcSMp9wf3?=
 =?us-ascii?Q?sbXoX4VIsFes4HO+WJAp9hrnrSZbh1gP3eRO6ij3+1hYbSWGuhEBJ67EDh9l?=
 =?us-ascii?Q?CYIYJ/SoNhIpiv5t5a+b64SChyHgQp35wf9PaXEr/yu9emxH9Kpbn3TqHK2+?=
 =?us-ascii?Q?gsOeYKAptrI3A/UDvrWyYHMWjd3ygPwpB2hVfAFnKCleSMFAfTfMPRzFAgV6?=
 =?us-ascii?Q?3uKPf6t8bzErmOetTCkLv4V8KG4C/kagZfithfYw9uSr2J9cf7sYxbi1XBzm?=
 =?us-ascii?Q?rTS5PNQKIztFY4lZs4Ub6MWocJ6xGPXdzwRB4d/iQ9R9otNI/KPhbt0DwA30?=
 =?us-ascii?Q?qklKVg88pH1Em1EXf1d6s1p5emso4vjxIWSheINlVF94ZFQuqumqy5Aq8/m5?=
 =?us-ascii?Q?A864IrzHVjyOX9N65CrCKM9R0EnvRQoCmiE/Vmhbr1osJVajJvswtofddcAv?=
 =?us-ascii?Q?i/NaJc9gWJ8bIDUmyblvYJ7xmuPhq1/8yXPBA5maa9pUKaCmg/DyDfGmzngN?=
 =?us-ascii?Q?BsHmeZwx5QJMSucHZPB4ZH6pY9J0YUIOymSxEOlLPDYYDwtEk4GkMgeakZ8f?=
 =?us-ascii?Q?T4ni5/LoKxgHq2Vc3+QpyCxj2lgG+Cv0pdbN9JuHSvdtPSZkI15DrGAHv6ee?=
 =?us-ascii?Q?FHsXBQT0ND7gjU/ARxLmh094lsTJbgyY5eDYrDKp8A0sScxz2CaTp+ttb9l8?=
 =?us-ascii?Q?DXXdbkBDenni8rFP8AM+20KnKcMuOvHdTdE+ZCCdfMhBLrnCuMhvDn7Ya2d9?=
 =?us-ascii?Q?TKVUcqxYd2luu6DVUT2Er5b1J8hw9P0r3Y7Kw8YlKbOQdzB/3biygmkt5gNv?=
 =?us-ascii?Q?mfNXMdBxSi9NXKnz57mgYe3EFaN4910dJysVDTkEkEnFUiOdkqWGqwlB6Zcj?=
 =?us-ascii?Q?bK3VnIH8JJhwa8M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cd3fzUigrLUJb6drwG+7rLqSIlGZIl4jmglPvIeshN1VnHwquesv9W9QneMS?=
 =?us-ascii?Q?hfioQuzArhna9iGf2NN5OVv+riAB9+WueIguMr6hNYAz2HR330LuJzh4Q55F?=
 =?us-ascii?Q?mVmQMrZjvEnxpqDtN4lzFzTfD2ZTfCyuSLZzpeeq0EKA4UvA2T/2iv0zwwSO?=
 =?us-ascii?Q?/7+NwVG4iVkIh/Qoykp0O3jv0dijK2ZId4wUAJ23A8oywYvXawAwf9Zy57wE?=
 =?us-ascii?Q?5kXfFrWwH+YKrdLwlMvo/wFy16nnE+lQrgwLhMG5khSAJDZpCYcdRU+j9uoh?=
 =?us-ascii?Q?qIvw1Z1X7FLWKiL1jrIzL380C8JnCWnw7v8thLnwgwF7rtr2zEIjG84w5Wzb?=
 =?us-ascii?Q?NhDXTTHVa6gTFsUI873wkDxJR1xn8YzaEw7laS4NE5GHjcY136jjMQdQTXqM?=
 =?us-ascii?Q?Q3aGB9r07WrIl1wkeMrZaZNS/q2oy0inozzx6UZZyyNw1ZLoBoYMiq1qikuM?=
 =?us-ascii?Q?exqHiFr7A1prBsF50WERYTbSKzGUamLRvQ/9bgUb+enwGiDJyhncTSrD3R/s?=
 =?us-ascii?Q?f3FIWfVLN/UZvUCanSJDdzsHiwEx3Sbt/ifmBzy7XNVFlE9+JXZpLSukJf0V?=
 =?us-ascii?Q?r4GhV+8nMB0E05LMHQVLZBNg6nyBGa1rgQti2hVO6T0fXHJebGtSUjuJvcHB?=
 =?us-ascii?Q?p/98NpSLS0z9W7nd3yOndTi5i3ROPxpN7oLcIiYCQylXWUhdVWnxvKk1g1JO?=
 =?us-ascii?Q?t04ecx//pxx+3v0ojzbeU1hj/AKRI7XrD059e/AjesUM2bOjWBtBE1hIpX19?=
 =?us-ascii?Q?570cW0JVlhM0nj6dgbrlJ+QA4gS0n4tvSS12TXbAOOadA5NpjvDJpJkzceuF?=
 =?us-ascii?Q?+3RxdF59gDbgO51MbzJEe7LSTqFmvagB4GoF60cfltkH8ZFuMl1QrZGviMgR?=
 =?us-ascii?Q?9bTCwTWGqRCnasTp78qVfTd47gtIg4i+j5UaBKQtJwHx9L7GWNf2uP7kswy7?=
 =?us-ascii?Q?pOkWylGNMrhBaKd7ywFTtepDBtPyb2JfhnHCqHo9LgRiR2zEZwftzesVbMJk?=
 =?us-ascii?Q?IImP8rMvgcSHl3962r5lRgiLfaBX+dpnc+kNsxktCzNWat+7OWoWy/RU7bEm?=
 =?us-ascii?Q?zE03hHqy9n0GyZfbI8IezAy9fNFik4tpYiMmODKV4CwSHKFjn9R0cFupPa2R?=
 =?us-ascii?Q?W3OE9V2KEQuNjRFgbjlJ4tgMHjvJP+/qx2WEHiE35zcogd9cOHWqBrjAabHb?=
 =?us-ascii?Q?WKg0hvXazbEoQsK2zIHpTfmUA8r+HJaprN0M+EmJ+8Okx/qPtep1boJX460n?=
 =?us-ascii?Q?w+9pgFWpXvPPqMgANW0l6QKPCoCUqqjuXu00rhKiqtC645KMBiP6J6VlKPIv?=
 =?us-ascii?Q?DomEPrw4h3Tz7bQQvaXesyi1Pvm+U4T63uHHOJTKzan3Gkd+x1qlwQ6Brepu?=
 =?us-ascii?Q?64qwsmMwWMSgK16MDa/lMdKwKulCA6oBCmsQt5zlYibsMtMxffgcYYMeuj7W?=
 =?us-ascii?Q?9gLuxl8xowuRIpcclpFfYixsJiOrQsOB3QuS7amoaXAzX7YYN88m5eepAu8K?=
 =?us-ascii?Q?qNwsJGFPLSmWDZ7im1wKpdqkP3LmNa5t6pQSyqC6Soa8DfYy5DVCSiELFao3?=
 =?us-ascii?Q?Bfrrtv1V2nL6C1v8z46WWlseAZKx7Vt3F3QPFmMl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12af2994-1c80-4f1f-bc91-08dd85648e9e
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 08:21:49.4982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QNJJsWpWHaX9Lskjh+aZaskEDJFNLosdI4UNLkHtQQFlbKAuhnNqY3tsGxXObBByCeQASKueoReE0VWB6Safg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8474

From: Carlos Song <carlos.song@nxp.com>

Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".

Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
three clocks. So add restrictions for clock and clock-names properties
for different Socs.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Change for V4:
- Drop comment in yaml and add nuvoton compatible. 
Change for V3:
- No change
Change for V2:
- Fix bot found errors running 'make dt_binding_check'
---
 .../bindings/i3c/silvaco,i3c-master.yaml      | 45 ++++++++++++++++---
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
index 4fbdcdac0aee..853092f7522d 100644
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
+  - if:
+      properties:
+        compatible:
+          enum:
+            - nuvoton,npcm845-i3c
+            - silvaco,i3c-master-v1
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
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

