Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013050.outbound.protection.outlook.com [40.107.162.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CD33C26;
	Mon, 23 Jun 2025 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750710629; cv=fail; b=a8OZFs//XhVvGGjsDQHtWgBU6XeH82oMB22HJELjLIDj9QWUzGwNOCeoAlANriu6aLIC0leQvJJ8g7sQTUuDo/1CyxaJKMwYrawARTfCbC96e9gBPshesnQ8sXlfbj5/8ohQAPL3htAMRO6mK12FrDQcYVNZkVD0otCeS11SpWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750710629; c=relaxed/simple;
	bh=tOi+QEC/MdpQCFED/4ZtuBqa9MXSRTvKaZ63oNdu7ik=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RAFiWD5z9EzPjQXwQCG/XTt3gJ68LCeTkIDTma4YT1tCtgH2ck07W5Z892f2Nr8WlNbYYQjERLz9pUD5H5Hp8NBE8QMpyex/PF9iwkSTidhQRW986kLvWeTWxUxJb9TT2K8aH+MbNmqImBAbZoc1TQFJPGPsoC/ozQE1NcHefEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mhgvXClz; arc=fail smtp.client-ip=40.107.162.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mhgvXClz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EN3dEnASby4mk+7PmoypQsA4E/5b9EUtfapHy6lDHsFZsbGYIB1egT4VYPFHa5Oaxiz9CDzFSUiMkh/MATD2p147KhgH3EGt0MXT+g5MmnDrNMEcVIc3Qr5+4aTrggmXhdBaCtCoQCrBOXtkBKP0MZB5QTuyxKY2oHL7UQcZhiW4TZmjciM7oSFz0mjljrL2beWGHGWSM7J1L7Eo9wGC4B0xQ7RsNvjpMDNU+2VK9FWLcfeZ/TCo92UMQF/HNz2U10uq2RKrtmVkIM9EiRnlpdNxIDz05h3SYteAzTIJ4S8ZfCx5KKoXo02xNgiIFDdmoKlXOICVzJteK95ii6bSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnYgWtXKMflq5vzb/M7bvhhaCC3ccowezPBHg8rwtXA=;
 b=UX+iMyM5NH5egRUaKUFLBM3WKn2g04YcCI2iVR6zbeRRyx6xiCeYLSaszZKF4eD5M+te7VrrtVFpC5h7ALa2ed5qxYcME9RuQJzCuqoTjUJSjrplfkmHym1Djf3Q2jZV7LUyotRwnpyK5reKXLtON8+M2Vb3S6CCMVlAxlxDbVrl6Q+KmRE1nKx8Kb2d76kHO9wVK3W05ZLW5GHQI/OLHzgsmoxheEsCCkSoo1iTOqn3hyw3ub+kkUR+a60vmCrXS8RPWUN4V6MxsGN2bau3MKrlv+6kIPjeVYHkoyVy/rVbGaR0mMlO5rGhFr4Wf7LxfmBoLRZoiebI+OITd1uw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnYgWtXKMflq5vzb/M7bvhhaCC3ccowezPBHg8rwtXA=;
 b=mhgvXClzJ0eurb/1A9+tG6eECqUMaY5WyuwduSjP29D890CQIoAVJ6RvYUmZ6P9JJBrkADjyRTmFwpik5HW4qv8grTC2u10sZnmlSjfZ1H3X6gZsSlxnCW9JWK/8OOrqhq+FPTl3Fzv3/pn0r7bScCfX2qnbaQv/67i2IO/bYs/aa4slLVMmTZ9kVkbb5lgFb/2gmX7YT5E4J3G4w8iQrDoj51JhgCXFBNcDgqILEj17mNFC6b3pgVBN3hDW0swCxEscy3xx5KP8W+B5JjvYDD5ZVEmWKqdOO9krX1gDbp+iTpiJLbK3L4WitDHqwIqmfNZzuVYKRTJFeHupt1brnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 20:30:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 20:30:24 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: usb: convert lpc32xx-udc.txt to yaml format
Date: Mon, 23 Jun 2025 16:30:10 -0400
Message-Id: <20250623203011.2473290-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: f9bedbab-78bf-4bdd-09a1-08ddb294c84b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eH76Gr2uwNd5FCIvMRnLRvLcS6/VQrSqvFmI6h4gKdBDf+mtZ4A2omB6LcxB?=
 =?us-ascii?Q?xPFDN1uZtcdUSrVw5j/6r5HEo1e3w+9AaOva4KW4yDikJAiYdgCDNctoPqus?=
 =?us-ascii?Q?uA5U0iQO0WtDxMRmhu3nbMp0z9ceFf1plEAZ3ZLXppF5cxZ2B98pFYlDfNNO?=
 =?us-ascii?Q?TAbpwGD08jYqBkTpqmziGxcaT+wTuR6wQiBPeNBQNUPV9UNIt6h9wqE0ocoh?=
 =?us-ascii?Q?6uFRa7EJvp7yuMNElTgBJbMw3qKVxfi3+z6jVVDwAD6XfxEy0q4Dl+zQz/2z?=
 =?us-ascii?Q?b/sae+EMk7pQJitfODJM7672hiS9+GV4JVADBZdDcy4J+djpY3QmFd7+hjhe?=
 =?us-ascii?Q?RegtHwUbkzMuGxva+VTfC6/qvp5xPtaaBVMkK2LsEHxVAaqY/pqxQZo5MF62?=
 =?us-ascii?Q?6snyTE/SsCQ4kd2QMZKH9JJhMGNsaPl7pQLyyL+Ms+bg2SwnZZjWQbKsfwnn?=
 =?us-ascii?Q?btohS/J02MBOM6MqXYqPX3sDqq6qK6CVMK/o5IcMQGpqWJW1y4qXpGJt+AqN?=
 =?us-ascii?Q?W/XTMr8/e0JzNjt5OqN86+B9gauYsVHEVtzz7wb6oXYA/xuuXWXtevrXB30Z?=
 =?us-ascii?Q?AK//zcQHENgEz+y0u1vasqwvtdb6j63gR2QWAgauUNG4svmQ1sFDX2rUaiwh?=
 =?us-ascii?Q?+svTykhNWf/ZH2XsqewuGY6yqkSYhmHgfN00mmXRBNI7c64wtYbmy2tsuKx+?=
 =?us-ascii?Q?F54hxqbW+7DKEwHG61IAfI3x1BgpjtEwMai1Dl0Qms9AXDGNXeVwL3T+LZd9?=
 =?us-ascii?Q?D8DPk7wZevrLThOghwIH7gW4iBltPQoVHRwC6mnq5XM3ODB/GS06gccMv6pf?=
 =?us-ascii?Q?Rq4GBy4MtP6wdb8yjJmZxROAZ+w3EXtWrRgEydKfzQcvDBQ9K1SLuqoavg1T?=
 =?us-ascii?Q?lpGgmJemUZLbKM1BKd1hHpDvXnH+aCRb1KXbjw4Od2jdRnLYQukynG+WqWHb?=
 =?us-ascii?Q?4ZmdB2PNqYVPNe452wGUD4jQOYo2hxVuXHbdG2cGIY2KAIS89zLZDspTKoI0?=
 =?us-ascii?Q?ehzbOlZrxp5ZMiwXeFoXfici4ZQk0f5upTB8qj3nTHQQQogWl7SfK+UDJTRI?=
 =?us-ascii?Q?rilZlMfKrDawU7PZ4R0Ms7DJehfwFeNb8F0giRK0K/HPRuumULHjD9NjlcwK?=
 =?us-ascii?Q?12NYmLbf017atjYDf577cv3g4RGIoJI15x85tbYDtLd3REOFIxfHJXPQZmhf?=
 =?us-ascii?Q?L4bWQf4Jc8K3rEo9rOVvUlU/5bwLxL7LIRBXEkitAvnhlHI47AgNFUabIvqw?=
 =?us-ascii?Q?8cdxkySD6CRxzyBfbgAC5AG+reS8c3wE6BXtAjVv9cHOogJXEQvx1lziehi/?=
 =?us-ascii?Q?CPXhsZhn81u6Uvw3Vm88C0DtTG1BSc0U3ORwbnniL2eEz7x0Xi9intUBFLcV?=
 =?us-ascii?Q?lNlKutcToOPQ2fY2UgTI5dKqYFwCLC4Uk/wIPQBMykUA5me+xiv9oHGM/yK2?=
 =?us-ascii?Q?B1ZiqvYWjaqn5ow1FJuvh3DEL0C1/SHN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JOaM/3Sm+wAd6RbilF3XQcF4cn4n7DGd/9c5Asp45wRh+e5KfBWLvqAFN7Ih?=
 =?us-ascii?Q?XuHlvzcO7GxtS/MxHM2z2Y2ze4iOzZXiXdfcK12tSkz2Fujk/TBjUIpHzPEX?=
 =?us-ascii?Q?KlCat4BG1fAx9vZ5KXOM4P4JRcdd73sO7TqLdAW3VyYNdQ8UYIUUkoGSiijv?=
 =?us-ascii?Q?F0e4W8OCtF2UJERSgjS5E31R+AfKPUqk19Z6Jvbafy4vBd58AiYC/rUGgprr?=
 =?us-ascii?Q?jc4CSX55V7V6+aha0IHQsQOKLMsdrxt59P2ONMJaQ9iYPsCwXSDM5kdJOVOn?=
 =?us-ascii?Q?xxCw5EQgUjL9+32fPdri1tM8fdGcsoKnkoKoFcypJQsAAwMaCuyYtOsvC34f?=
 =?us-ascii?Q?07aCAzu0kKwN9PTMZqAajH9vCkzbo2iPxUUDQQwcN9TS0TLTRrTFmvVKh8mV?=
 =?us-ascii?Q?zC5zLpvdOZaOrbt+8Zp4cGIveqaSDIzYMy8VeH4ekLIW1Im4K7v+t7fi2BgS?=
 =?us-ascii?Q?RnKO5gvuklr5tDwg1ngPQyyqMpLnVqBf3lNWxte2l7OS7U3ptEwtuBju+U/8?=
 =?us-ascii?Q?BIW1jpQt2FLx1nanXgwiSE51yv67X5UoI0awjGvNQCZyMA3iuLVo6GDGuoyh?=
 =?us-ascii?Q?b+9Tdi8Nf8t5xJB+2ua38LvtFLr/nfkO/LjBBio3uH+o+718StsIBXfCuigj?=
 =?us-ascii?Q?5wRISM67e329eVwCfIk20YtEx953yokCgrIoyvxdrDTbcMEUG4OSOpQ88Jwb?=
 =?us-ascii?Q?rJu5rAD5WAYKO1gEuj0LHAxZW5NfNGstCfPCc8PgodivDceO/RNJ/I3dqqqX?=
 =?us-ascii?Q?0doOs2GGj4rUASzOTZllIwHZm0bQpriGulyvTHbywoYryVwFrLExht+vdTeb?=
 =?us-ascii?Q?LwG0at4Kmk5mRvV9WiOSrwBsfmH+Q2znAj4c1Y0PDQqiUrb0+ZF5FnMzet63?=
 =?us-ascii?Q?kisSLNCk3V7XgSGWZN54G8Bmi6YpqRGzxuVl0VNjDEwF9v/6NnKFxDB5r0zH?=
 =?us-ascii?Q?zg0F4vlx4a0VBJ6MJYlPNAXfL+WGgaUhYdyUjNDrYFewGpxjBn+T1m+Bu8vl?=
 =?us-ascii?Q?07e841ozG14xzauHvVlaF46XW0TE38Yck0FysMliczXy8Pw/X8kUMinbhm5G?=
 =?us-ascii?Q?2SnD1MhtV3ayd0AKBWTZ6G+4OtMzh/HhcU5TfBKVT/KbwWEQzamk4wS+qA25?=
 =?us-ascii?Q?70z3yb5JdcfvjKvLvVMCtzEd+j1MTx6ZMupkVAINYC1DTrmAtZukz0QJChYB?=
 =?us-ascii?Q?oPfqDpCP0jUoDJtFSmTvsKTjPplUKr1K69LuVwYuXGQsM4JV6dytXUgSZyTk?=
 =?us-ascii?Q?R+MW7yJx+K+NE+psusv0mgb3NK8QaukL+3FuZI5PoJHZeXE+mughfBKJFFQR?=
 =?us-ascii?Q?LGfasCy4HstUrIbUALFfJ5XZtzvh3cOWlpRTvmVP5KTaZE4u/3+HgKZ7ayTV?=
 =?us-ascii?Q?otpSbG956nhEig0eZMz/dNF2iZK5PeYIsDMNaDDPlpinloq7RTTp4kyHRMDn?=
 =?us-ascii?Q?XqBjBt0wlt50gNwJxAxZK9tL6PfTd/1csB5ASYTrzoMI8X1VToihLHMWfGUu?=
 =?us-ascii?Q?TvqZ+SQ20HSKKhccF4+yxy9ZPpzK9xF+AbNX1s/pvKFDB/4dJnXUH4pvIGCY?=
 =?us-ascii?Q?UKZNBERDw+H15p/w8PPZyJg8xIejo8tBfHmmmEej?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bedbab-78bf-4bdd-09a1-08ddb294c84b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 20:30:24.3820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOeiJgrF084/hsDB13SNQUCAMDMSPV9jmsIoAdqcpe8eSdvhCALXE6zTEr/eaUNvbjySUi0WIgs6zI8BsuAx3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7065

Convert lpc32xx-udc.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/usb/lpc32xx-udc.txt   | 28 -----------
 .../bindings/usb/nxp,lpc3220-udc.yaml         | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/lpc32xx-udc.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nxp,lpc3220-udc.yaml

diff --git a/Documentation/devicetree/bindings/usb/lpc32xx-udc.txt b/Documentation/devicetree/bindings/usb/lpc32xx-udc.txt
deleted file mode 100644
index 29f12a533f666..0000000000000
--- a/Documentation/devicetree/bindings/usb/lpc32xx-udc.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* NXP LPC32xx SoC USB Device Controller (UDC)
-
-Required properties:
-- compatible: Must be "nxp,lpc3220-udc"
-- reg: Physical base address of the controller and length of memory mapped
-  region.
-- interrupts: The USB interrupts:
-              * USB Device Low Priority Interrupt
-              * USB Device High Priority Interrupt
-              * USB Device DMA Interrupt
-              * External USB Transceiver Interrupt (OTG ATX)
-- transceiver: phandle of the associated ISP1301 device - this is necessary for
-               the UDC controller for connecting to the USB physical layer
-
-Example:
-
-	isp1301: usb-transceiver@2c {
-		compatible = "nxp,isp1301";
-		reg = <0x2c>;
-	};
-
-	usbd@31020000 {
-		compatible = "nxp,lpc3220-udc";
-		reg = <0x31020000 0x300>;
-		interrupt-parent = <&mic>;
-		interrupts = <0x3d 0>, <0x3e 0>, <0x3c 0>, <0x3a 0>;
-		transceiver = <&isp1301>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/nxp,lpc3220-udc.yaml b/Documentation/devicetree/bindings/usb/nxp,lpc3220-udc.yaml
new file mode 100644
index 0000000000000..be0457a068616
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nxp,lpc3220-udc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nxp,lpc3220-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx SoC USB Device Controller (UDC)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc3220-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: USB Device Low Priority Interrupt
+      - description: USB Device High Priority Interrupt
+      - description: USB Device DMA Interrupt
+      - description: External USB Transceiver Interrupt (OTG ATX)
+
+  clocks:
+    maxItems: 1
+
+  transceiver:
+    description:
+      phandle of the associated ISP1301 device - this is necessary for
+      the UDC controller for connecting to the USB physical layer
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - transceiver
+
+additionalProperties: false
+
+examples:
+  - |
+    usbd@31020000 {
+        compatible = "nxp,lpc3220-udc";
+        reg = <0x31020000 0x300>;
+        interrupt-parent = <&mic>;
+        interrupts = <0x3d 0>, <0x3e 0>, <0x3c 0>, <0x3a 0>;
+        transceiver = <&isp1301>;
+    };
-- 
2.34.1

