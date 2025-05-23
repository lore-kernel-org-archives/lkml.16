Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2048.outbound.protection.outlook.com [40.107.22.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDCF19CC36;
	Fri, 23 May 2025 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027988; cv=fail; b=LWCCOnQSvRHPFcsWxtL8vPwIT3dtFD9GrEUGL6SfFmJw03hu/MWUvhs5N6Z34/lF2wAOtzxZvmYMfvG3+dAFVoQtA0xhiVelr1nq687fHD6yLi7ClyBbASPN+kZ20RQwdly78HC/gsWFDlYbQcbzsn/J7SX2Pz3VDxZgbXQwTh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027988; c=relaxed/simple;
	bh=vUDQXPdtf1cdjQMm2eMBI0qpGnDtJehUxg+IavgYUrY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mH7Cgy8Cb73gRnWtDXMdOHLWTx0daHehvq7dqb78MBXMwr3Sd4cnuDugQz0j0/yKjPqKL3cQl8i9+WH8lT0C0d3FHYyfYh2IzEsYjId5AlTdYRHLdQg5X1i02MiNePafiVrBTdDPpstUZrp7VPdrShy0iK37lQxhG1oU40NJ36c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gW+nacLh; arc=fail smtp.client-ip=40.107.22.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gW+nacLh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mq3gRy882sP6wQSGOfflGqSNawy7UduCPk7I/wbZdJI20CksK3pFmZk2ZbDJbCoGQUiegze+OLeTh7ceGu4d1is9+k7jP2tthE04OWyHd0jE9mG890VjeoBXPFN1eO4L2XHKCe0ZuXLUEXk0k1yyimbnlABcgw4U0G8OCOmMZlYDzaQy1GTavNMf8oU0gKiyUXuz0zHhqo+1F35pbGL3x8I8GbBweCZgRhAlO/z6638xO3xgPAW8yEYCYDKRlg3i3+CLzsMxHeF5c+xa25F1oeiCxmBxBLvIdKWhoPx+6OSeTI/+YTZI2lSgOAFrDErXExjU9Hd65bNPLVQt4OzPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AF6/0SYy49/1XQt3Ppp2fRmEqcxLdC1TwjphEtn9IA8=;
 b=y0irCRcloOasYvr/aPCaBT5PoqoXww4aYvZG1JHhcUlxBkcWueFiEysjDGYws01o8wHLQfsZ8aOYS22/WiPlwOIsWdAw2Icyn7ZOTjJTt6OxAXvAoDoQ9HzPkSJ89NimDJo7xXE0BbZjjtryPsGYNT6+4shnMdJ0MXoZIolW3UXi0O7VEk2quq9mTQPG1OT6CsuG2wg79IvulO9f/Z7Vfjj1uYQiKBca1KAxEzIRrx/JLvCvwuxu51ZaLHf2KTWv6QiHLB82sEeiA8PBfJGJVNnMKpyzDnBh6npodGTQTfCRLQRMpyiqTsAq7xYPmKaLrxlSka+QqTno8XIGnqT/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AF6/0SYy49/1XQt3Ppp2fRmEqcxLdC1TwjphEtn9IA8=;
 b=gW+nacLh4FvQ8EaTp918ojfHjTDWBI6r3U6sXtdPfeQi4hWmd7jf35FDYU/OgtLZiL7ZL5PSfq0GMz4FGkHy8nUwN3ZAPEldtbnsoZX5fVV6xZkE4niQBJWPNJgQTVlQUNCuUQiAHwmUMZ8+jYLWD9cPA4dScJGFbh1y9W9chZ9NwjheWBHrifYBtFcVnr9U7+TB18psEET+0ogWVMF5Tx78/NHn+kAMDmrkAZHoJCYOhA/W7XOiFsKe1rFzjYp+0OmqY6sovz/RKccF2lN0zSwNe1nJ1uFYfSpDRDlqmlow6hbZHwcd9l/1f5pWaLzcNUW5iWqZ0Snu4StxEEJSoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7325.eurprd04.prod.outlook.com (2603:10a6:800:1af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 19:19:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 19:19:40 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:CLOCKSOURCE, CLOCKEVENT DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: timer: Add fsl,timrot.yaml
Date: Fri, 23 May 2025 15:19:28 -0400
Message-Id: <20250523191928.563368-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: c64f22f3-0590-4a41-1cc1-08dd9a2ec401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wmMLzJ+dh4qBIBuIwfTyYYAnEkNxFk+rL8XWeSpKh2ypI7hHloLm023eHoh1?=
 =?us-ascii?Q?kmJZP8/qZKGwhXWWCbocaPJ8YHeKHmjXIOmx3YD8yDIKZ0Ju94ZuX+ZJEwny?=
 =?us-ascii?Q?c0CFvEeHSLMYhCxjQoDldQv9Bj5/953zFYGItbGiWB0QAWKajAXzuEHYio98?=
 =?us-ascii?Q?a4pRp4ZQ1qBqbJ4iNLiI7Kxwj+0Sn25pwGlOmnNYwzOEF1JzVfkDAo+lr2UX?=
 =?us-ascii?Q?KH7ocHfa94nar7HUqgEjHuMXsKp6WtNC2LFLwNghiCnZZ5mblGIjVRmMfbQq?=
 =?us-ascii?Q?AXL4M8gcMZ9tyKCNFsSrShFg9SyBOcQaCdDhjhAykdxUe0F7rm5tor4mQ52M?=
 =?us-ascii?Q?HBh4ek4waJqJhNwEnCMrLRuLwVFScRxiibT8yb3mzw9GKeYL4MpXue+2ngfJ?=
 =?us-ascii?Q?j9NKSl0YbpWstITOIXZmK7+laOFpinweMnQfBTTNnLlPN2OYPUEgah0AvsNA?=
 =?us-ascii?Q?M9T3fVrFu6zm0/Qq0JbKJpL2gIz5DU/+pP3cKxlyZ12qjI6dJn6idhBvaAHY?=
 =?us-ascii?Q?/EbUF5sug/OdZBDqgMU6Fo2tk/nNPePdaoeJJ0Xl55uNipOh5Ia45M/nVQKn?=
 =?us-ascii?Q?GKPjowlkuRYUFktLFAdBk7VAFim1GNgqgINCGLDmhm5HcPPUQX9rtnkM/k2F?=
 =?us-ascii?Q?imbjqHf6eT6mR5CjqkEicWn66QUJDukmq0dpSAuheBjuGf5tkwfLpbcDjzXV?=
 =?us-ascii?Q?JLJMjWpCLF05YSzAe5jdgW0KNWVBhKUaGSN9FE72xSLEuZSPeqynBnhoh7xJ?=
 =?us-ascii?Q?qYbEmrT6a80CGksFq7efv7JDMKSfVrbR4CKACVZuo0K9hb5jG9U0KU/cPPHg?=
 =?us-ascii?Q?hR5K0MXwIBr9+5wceUgU0nRnunSVQaJBf6yFMJtLlr71geJsI+nryQLglKe8?=
 =?us-ascii?Q?PyPvl/0AA7X5tBpWa6YH8s5dyG8q17RPbdgrc0w8FmvZL64VAnd0uPdzgvFC?=
 =?us-ascii?Q?udcM584hgu8BH1nVS91IjeCjOktcfUjzyLzcrFoYcvRKq0mgE5NVeKBW+1ZW?=
 =?us-ascii?Q?jOoF8eGtb6A5ECMKUgLGlvMxKPCddICvrzRVsODFKiIlgnng/bobvbAq2+Fo?=
 =?us-ascii?Q?aiCWb2Oa3dZibe/a4nDR4NXYPQW2oH4VHA62hePCLmB4MUtRY2D8zxYjl3n9?=
 =?us-ascii?Q?4WhYRikRlRNqhGXgCKt5IkAA67JYjSBWrogSVznk+D0glhd9J1V/f1d8qjmU?=
 =?us-ascii?Q?8CsQbaaCS+p3DMNObqd6jn51bND7DVNJvSdCRmrxtBFAHZ/XWTeq1OHX3TTg?=
 =?us-ascii?Q?VILZ6UrHzk7HLKSWqWWnUsqYYSeRnJ8rJHfJbFmniij7jC8L800vtQeMj0mY?=
 =?us-ascii?Q?kL22pG6hJjTyrZEKO8jsz3QLhc4vInJ6wG4ymfN/wy5Ox+Cb5ZpP+PkUvZbH?=
 =?us-ascii?Q?0YS8V6+RFdHZS+LXlJ10Uc5d21Es5268EvHod7nuqrXuavuFMWvZANuBmylu?=
 =?us-ascii?Q?hh0CjnHprs+jDw9L1IyFBiXk1LjEC4Fi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iewlu7xUGr/lfxKB1y1suubn9l7JZYGYdfiESnCkadlZAbIxC8ZHb/vdsrMP?=
 =?us-ascii?Q?DRk3lh8NifxUIXHFhceXfToE1PaaEsYfTjWnUn2E0mHBy7X4SNErwGn34kmz?=
 =?us-ascii?Q?HwEQQTuQg28Xyt+fNHV8KSkGUuOLCYZqAUeY1u+ud6lTKw8laPnkhLW4pyeg?=
 =?us-ascii?Q?yjeaYcTOKHIybcfc3FYCF+j++y1yC/+Bu6Fa2Om0UiBrg0WIxygbHmPJIeLo?=
 =?us-ascii?Q?PZGuR3A88AUEZVGO6EwMSv0mfTRQER10V+dwW6lO6ZXZURnEXgQcgZIQ0wgk?=
 =?us-ascii?Q?J5+WxOoett8jJ3Sl1bAcDW700H037KC+JKpOdMC8CEeKuE+pxj5GjlI+f85h?=
 =?us-ascii?Q?MBPau6oGWBvXtoZWn0cCsZZ2+Cod/0Ihtb9VH+PcBEqJkoxSQgyNVpn6zNBZ?=
 =?us-ascii?Q?Vh67mRSaD+Vvb+V/wKl6coZ+kfExee38spKADXpOBsm9RF+2IqC9iHk87P51?=
 =?us-ascii?Q?HbruHzu2Yxx7rne0nMLwYGS2MxAA17bMTa8bWzFM/vNlKUmiRStoLDM8GujK?=
 =?us-ascii?Q?C9Ck5owrafe3Pn6Y8M95xyFghBqhE+lhZ51Ez0LuHQ6FEpSaIhLUmLA6bhBU?=
 =?us-ascii?Q?3tdUb8sOWPaM2O5Cu3sgYJj8jwGnhqgBDtyB/yvGiDX/27fX6gaguOisCzv+?=
 =?us-ascii?Q?6PJbUVKqSfplQD7dRHagrMfCush3VYC8dm8TzYKbUwQ2v4f/ZPiKZJiOhSHZ?=
 =?us-ascii?Q?RmUX1F88a5M+GYfY2nhGR4BXJJUW5+FahsHHG6Qnuv64oqYOals6TsV//Ral?=
 =?us-ascii?Q?JIZApzKMquGyfrtNTWtVhaQJFVwMoz5/A2sFp7LBdHNPYzdbS4F6+cjF8Og8?=
 =?us-ascii?Q?Wc43Nv+Xyr7Lt9FaELMutnJUDoQ8EbSgijWLmQ++sO2Y+iQYON2Js19QkwR6?=
 =?us-ascii?Q?SVkoeRpgr05w5z+n74UIkQPnqxBGUtzbwKFXBCCX+sSpvyPwQi2nRBdkphOJ?=
 =?us-ascii?Q?lj+EYmgMyY75qplwld5FWbEeTUzVV842oy96nRo6dA9Hkm6hrB2R49EZB4h5?=
 =?us-ascii?Q?YTDgN7RtL1fcKeJJahey61K1My4XF0d6X2x7iUJc6RSUkdQvh7bL1TXZXept?=
 =?us-ascii?Q?L5COWFMC8HEZqSWATEqlLU7jdo14lzTZZs0OCVNV16SDICe1+9jVpxMhcxKV?=
 =?us-ascii?Q?mwl5/UhUkI0xShZOgkthyygUN4gIwJxNu4sPPShS62ITlEWPqeCELOdj8I6Q?=
 =?us-ascii?Q?dV3uv4CGp69/bhQcOi6WKlu9eNNypgHUojA7b/bgdKdUNnki5CQh1Ik3lpgK?=
 =?us-ascii?Q?0swudJO5o7Fa9EDaJfYzdvDafnKN0h1zsKU9eFfBeTgcUZKDz1NNlVM7TDap?=
 =?us-ascii?Q?eVuCP4n0FeE+DGNtGQsrpyoqIHOoEPPWcNI3P6qdir+IVL1qwg/E0blbsgCT?=
 =?us-ascii?Q?NkYB+nvAJgyUkviDtT1B0PiAg5LwDeJiAN0O5yiqGm58jIE+MYwaCHxpSiFR?=
 =?us-ascii?Q?sZc0vObFUmrUjM7pfd6WhM5UiyTFFgTVCxtL0LR2b7+SOOi+0qC1KIPyuVkk?=
 =?us-ascii?Q?3rHr1jbKQIY56codIK15MjMIss8jrBgxpEZYjw9YR4gUnWfgN9PXC+QIwi/Q?=
 =?us-ascii?Q?QdVgZaxui9RA+6sSZ0E=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64f22f3-0590-4a41-1cc1-08dd9a2ec401
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:19:40.6361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzJHhAwEW9qLfH8vnr81JmFmipqnMVdg9WCdZ+OCe+5lVHiKTIXb89WoLpTxKL5oSa3JzlguyXL7KavEeu17Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7325

Add fsl,timrot.yaml for i.MX23/i.MX28 timer.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/timer/fsl,timrot.yaml | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,timrot.yaml

diff --git a/Documentation/devicetree/bindings/timer/fsl,timrot.yaml b/Documentation/devicetree/bindings/timer/fsl,timrot.yaml
new file mode 100644
index 0000000000000..3c9aacc356a57
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/fsl,timrot.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/fsl,timrot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS Timer
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx23-timrot
+          - fsl,imx28-timrot
+      - const: fsl,timrot
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 4
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer: timer@80068000 {
+        compatible = "fsl,imx28-timrot", "fsl,timrot";
+        reg = <0x80068000 0x2000>;
+        interrupts = <48>, <49>, <50>, <51>;
+        clocks = <&clks 26>;
+    };
+
-- 
2.34.1

