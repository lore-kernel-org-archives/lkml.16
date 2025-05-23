Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2041.outbound.protection.outlook.com [40.107.247.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0621754B;
	Fri, 23 May 2025 19:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027947; cv=fail; b=Y57qbJE1Uxs3qgWP38S4OVRG7JbepwFdg02x3Q88ydz/kIXFzTpQ+/s7Pet9vlt6kbRb9FdXkj4/LaRaC/UbZZQfmiEXbBvrvQR4ag/vge18VjMtuulPrnerAIMAkRBxQ75Ichq1COQxP1ISSALoFz8LxQHYZ6fawKJCDY3efNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027947; c=relaxed/simple;
	bh=DYv61axEavCEUyJFbRSeCpH4vJA90pBAm0jsUHXMhbk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=r4ajXbaP3Ro5Jj5TDT6ZC5vnrm21Y7v7LmjDD0RqNnShIRH1H24aIvGQIgCtHBEn+Z2LNRz//VPFzsmSTl0m3B/cjEBeMz1eMHxqglu2keL/eUw1v1dmwQjhUSJZ9PQh7RiPmCwMbS+C/nRUe7cKotxEmkaG5sQ/fXBNNUUcQH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kdK0BRfz; arc=fail smtp.client-ip=40.107.247.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kdK0BRfz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuVZsFKo6GXQCoaklvSlv7bp8Dazf9elIi5jliN1sw9jC98pzuknAgWN6s2vydXwvs4698ZocBY7dbhBouID8s+Mvr0Mhbik3qtOjP+68JdShML7FXfcusV+qOqyX/2ek1fdKIwcr3j57akq3WCH+4tbhxE3jsfDnfIXeZJxTgK85BZhDs8x5EmJTZKQvtRVP8VLya7pAMUUh/N/VZh2RDD/D6c7fyc1LPDktX0Z8wJhquFua37JQENGpT3ttq+2KNXZxmqMy9lcMd55BBVH+67YVqwZUZbpSkkLF6YXic2gVr5JMBXlmYkh9JGW9BPTPDf4JCP6lp6jkY/UiXnO9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OO8AtDV90CnS4KliZLdvGsKR7fcoSK8Z/4lgbzA0JoQ=;
 b=afQfBnHTf/xY18yPPWxRKteUCenilZoDU7bb1Jnc1SGVFgrhGj58OoHPpePUnel7WBz9yky1zyRkOTDK5aLGasORNZJ7zBwvlWT/RSrKLSUQ90RJPguY1WHBEDILJTQ4MEo0fFz3v0DmiYvMM3TFu7//WKHmdniUGEW0gZFl0/xZuPQMEGJYuALXjh2hy828q8CeoxeJE8oWjP2UU/1IX8YfWOcKd0gskYpkL4ObvSDBE/W0+S5eYGUf2CH8i71K1UkIgCQwGm3SOSI4wkpGsstqJCazX9IgkmDMkbcShYqMSMiHcu1qZ+5xA33H3ByEVOGnxqOE+YZD8UeEzKxptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OO8AtDV90CnS4KliZLdvGsKR7fcoSK8Z/4lgbzA0JoQ=;
 b=kdK0BRfzRzhxwNU+E/z3NaDVMv2DRSmdOtfLiToN/uI7Z/607LWIa8Shm49N/4nJ7lpYdiSSsjICf0/zqMKivA15dk+mXaXykW5+Ohlbtyn/QUJvmTqDdPZimfQK5CYsEqLO/tSDQLGrTu+BSg+JWjVPzTwIV+qqupz5cfaSZHu0iyVEbr8Od6771b0sQi2+KZSEePYHqNTZh2Cs3jBUX0dYt9fT7Qr1M1Bqkg+IUTQzjpeqctCRldVWJbtSFAjar4HKDyiio9HqM2QjlAJDBOKVfEmpmhrrFTskl4CSCrpvY2H00AiZ+ZhcSSXkvw1CjMUrUHbia3l8EEQBSB2VsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7325.eurprd04.prod.outlook.com (2603:10a6:800:1af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 19:19:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 19:19:01 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: mfd: convert mxs-lradc.txt to yaml format
Date: Fri, 23 May 2025 15:18:43 -0400
Message-Id: <20250523191844.563177-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0014.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 3166fb8a-7437-46e8-b959-08dd9a2eac79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WiuxUEWG7pFbHWFg8bdfyKPt+lknXliCgFi7bE1eo96k3Dnw5uT16ObjrD5G?=
 =?us-ascii?Q?1w+jKPauSWl0ku8xrDHjowUX1BB1jXQXJlDpvMqbZZcF026RTzv+87T20pag?=
 =?us-ascii?Q?eoDJ11HCuOG8h4qEdurr2RRzgU2qqV+v1mGNNA4Yp3C9Ffz5mPhvqIu/Bkao?=
 =?us-ascii?Q?Jk43/yhlr2QNZRY/gRv5cGMm5ChS/wXTMgZVS1AWCDPoqh9er5X9JPfXcCPC?=
 =?us-ascii?Q?IaZxm4k6Uev47O6EzS19P2bNy3BxPRCGEqXo95xagitc6NF0g1mTJGJTjUoK?=
 =?us-ascii?Q?cc5bnyyboBed1NpHzBYBNaTSiyc3Ad38gxD7eW+66DxXsgMVbQ3vVlKWI5rU?=
 =?us-ascii?Q?WYZyeu1hf03pAVaK622KbzAq9Xhlr8tUNBk4Rqm6PJmrI9Rtmgge8TMXwqXe?=
 =?us-ascii?Q?4dgWALcxmL56SAjpx/W98IZxiGXXteYeGIjAQb+9YW9gQcp1JtDhC+EJi3XU?=
 =?us-ascii?Q?B/K9f0euzq51zDSC35rfuH76mzvzfH7v1nR/+h8xqaIYwbv4x7vBVeC7K8wW?=
 =?us-ascii?Q?3YBCniwZqZuXAWWLTJg+dNWEY1NFrbt8JhlS8Ug6R2o29MsPD624W52V9Sn1?=
 =?us-ascii?Q?00tvNnVjAYzSGH+NI98w1VeoWwq2sRETUeTqZWuhX+vllZjjsmQ/fcvfmurC?=
 =?us-ascii?Q?ojmzCjklPG1URn4RMNMKDAVOOhgyok7yDLl5/INieQ+ExAh6pQJn86RAspMB?=
 =?us-ascii?Q?3QzotTqcIpo4nu3zYvW0CIYx8MsJ/pq4qyTFuTEzXkUymjHdg7WHmHPaP+aN?=
 =?us-ascii?Q?FQ4h5yXfeBKgG9Cv7ObXBWp8xtUq64r8Dn9MyHv8UZyO7jCNM8lsGf00U7Vn?=
 =?us-ascii?Q?FiO12Ozu2O2TUJ5DuC/qPn9xrtIfhj3YbtXssFULNwYOnHyFFUgamyGKPfNL?=
 =?us-ascii?Q?C+sJgRH9g+8Jml6e1F7u+s9m/R8+2KAZcGZERP0/eYhoufgqJbPjeUKNB6MT?=
 =?us-ascii?Q?jcN3Mom62hBhDaKTZsDwJrZly1U1NlUXE8ikxft93WPrlPY4fzgt4EJMsZWN?=
 =?us-ascii?Q?8NWCIXMT4jxq6wcX9WyEIdEsxmeQFfmec/NRxwwlMI76rNZOXUc7Vj2RwfEZ?=
 =?us-ascii?Q?0vQF/MgjKgo/QvDSQxKWi4vLkiOd4GlkaYkIXFd/KsKy0cnPG1dXsGjU21Pp?=
 =?us-ascii?Q?8chzZfhB9i9rt1uAb8PSAtcWGG8P9OjjRc//X+Clvt7Ld9FyZStzILwyt4/c?=
 =?us-ascii?Q?fFuVzsh4dRi+RlHCwfVOMkcSRWuvWqKpdNG9w/qqcFyvCvKpQ152KcNl7ZWA?=
 =?us-ascii?Q?paQ8RAlMpUsLAWhItsn7DkbKwLthD30vM2J2tOK6Hsz9FHzI74g0xR+jEFeJ?=
 =?us-ascii?Q?Z9EKSVZjr7F1iQnhKWezFeZN2ipBRxEwhXL2DwCMng6poZMozq3NActT1tEi?=
 =?us-ascii?Q?8KRivtxFkynutWzaKqAN5ER+EBqRRZ3eR4cZ3UuQX35nv/lZuWNYfiXe2nt+?=
 =?us-ascii?Q?wC+vKwmsgo65pz+H7cldB76E+TQodC4w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BeVDkrHyG7amDZ9fRJza88XrvTCSdzudvwLfoeTr/hV66+FvnBnOxyHA5e36?=
 =?us-ascii?Q?Q7KMPEzvr2sF9uolfUXIDCACrHRg2EPTz5iDvlgf/4q2iKbINl7y0W6y7do+?=
 =?us-ascii?Q?rxqUVarc+2X9+vFklEK7tUd8p6UQfTTQlCEazpPcPOd6cWdUTBeE+WfW1D/F?=
 =?us-ascii?Q?N6wtRFJj7+mNR3l1lmYbnbPuIZp9Rnp6GJ+idB+q7k+SMjajiI+VvVaZQk6y?=
 =?us-ascii?Q?ok4FsQgNdCufUYau6+WzIx2lidy7j5uvPn+Jqadf49ge5+Hd1VtyvvPbYORK?=
 =?us-ascii?Q?prCVBvbgd6nCP9eu8YWovGgTb/RbpXTCMc8CPPyHA7/DFABmXO9GI921HKhC?=
 =?us-ascii?Q?iObsm4Y8BMrf/+J8ftraAwMqx6qWnmWI1IykGGjmwtF4qSRqWCP3vuv7RDcq?=
 =?us-ascii?Q?xRjipU9kDH7vqHlSSRB2D417oVrU31H4fDOSLiH4LIVFHOaKyf4Af/txOUdT?=
 =?us-ascii?Q?Fh8Tm4qQbNItbldDDvZill0/kuPAB1OxtgvGTCapKnm80aWk8fdkFMVRnxLn?=
 =?us-ascii?Q?/yLXd4tZW55aJC80T3mA5bfq0lgG8HH8MJQLhDEeDlTKtvMrriTcUWJujgeO?=
 =?us-ascii?Q?Vq6XFj/r1yfRj9lvA60wNMxnjvk0IPm99UBFzKeWVyUPOK5TpQ4R9IgqRtii?=
 =?us-ascii?Q?opfvHlHjayK83orr0w7aFy8AT5BAreXKmTOjdhHtxa2Gwhck1x4bx6xbnGM2?=
 =?us-ascii?Q?6QSefabaZNyLweLVYOO22yt1pFPludmi/4ZOihf9oTEjApCfnKkL8/cj0wr4?=
 =?us-ascii?Q?SblfJAURxqergbbV1daaJBOuemkICh/zux4UJ6kAcUFFDCFm/Ygu5R9XpsKP?=
 =?us-ascii?Q?86lJxCLB2vtRtnTh+XMLuk1FCJ/sSAehj+oBJEskIWtQLga/bphoG7wqt+Zx?=
 =?us-ascii?Q?K0FnSB0/vzNamhsPujNRayxM0DkhRJHi82LjRt3EmdigI2bi743VBMKyUZ8E?=
 =?us-ascii?Q?UlOLi0AvDmODrCLaJRAoZ4m6GU9X66TYb8tlejxtHN3je8rZ69NWj6j7xXVu?=
 =?us-ascii?Q?NGRY/r3UjZ2bRUu0Rw4iHIrvqH1/Qc4WGxefLUze2KUOgsGp/sGdEIorPbZf?=
 =?us-ascii?Q?zlHm+OuyxfUOt0x1dx/Bo1cUUhSMq/wV9/jCH/v2BdJnVUSQVPedywuxo7kT?=
 =?us-ascii?Q?WFwC4+A71U+qHwvO+qOJ1hAIoNUwhEhafMpDhbZ8S2iQW3zCBR/xtFlrFEQm?=
 =?us-ascii?Q?4SJMF7591z9JlO9JmI3zeTaiP/tIwevdfRsl1SqAQR05L7/f+LJ8gK7OR4wY?=
 =?us-ascii?Q?0M3vEGup00QgwOPLeqJptmHi2QWW+beM1ndJ+51YhM0qpH5sKl7+pbZ3U5St?=
 =?us-ascii?Q?5WsEDx45H13N48ICSqOHPCL6yRj8mah1LPnQDkfIH39RXJmLu2Ey4KQudAxG?=
 =?us-ascii?Q?NeXPiVxEzqfrAVMWsVegRPn2Fi8Y1afiZDZZgXrV3R1zsUabmRUFZQYdQhbN?=
 =?us-ascii?Q?NaOaaP+U8tJefyabGGcZmQMHBp5BtXtVqxyNlpZdinTPr9+Isl/OdvIShIXD?=
 =?us-ascii?Q?5oI4ekZ7/LqWi/6sUNlyCA6B6cPNzosPcnGomDxaVyyVOh8zGNvszhDzpMho?=
 =?us-ascii?Q?pA4nxmWK+Buxz5f/Q0s=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3166fb8a-7437-46e8-b959-08dd9a2eac79
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:19:01.1963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VcuzLJBB8e445uvTZjNeBxIb5YigvVAugxab2za+pvXiOqy8MCLA4AD5Qxq6wWXg6tbnCQmXMe01TvnniZodw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7325

Convert mxs-lradc.txt to yaml format.

Additional changes:
- Only keep one example.
- Change node name to adc.
- Add clocks and #io-channel-cells.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/mfd/fsl,imx28-lradc.yaml         | 85 +++++++++++++++++++
 .../devicetree/bindings/mfd/mxs-lradc.txt     | 45 ----------
 2 files changed, 85 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx28-lradc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt

diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx28-lradc.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx28-lradc.yaml
new file mode 100644
index 0000000000000..665e780ff966d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/fsl,imx28-lradc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/fsl,imx28-lradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS LRADC
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx23-lradc
+      - fsl,imx28-lradc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 13
+
+  '#io-channel-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  fsl,lradc-touchscreen-wires:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [4, 5]
+    description:
+      Number of wires used to connect the touchscreen
+      to LRADC. Valid value is either 4 or 5. If this
+      property is not present, then the touchscreen is
+      disabled. 5 wires is valid for i.MX28 SoC only.
+
+  fsl,ave-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 4
+    minimum: 1
+    maximum: 32
+    description:
+      number of samples per direction to calculate an average value.
+
+  fsl,ave-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 2
+    maximum: 2048
+    description:
+      delay between consecutive samples.
+      It is used if 'fsl,ave-ctrl' > 1, counts at
+      2 kHz and its default is 2 (= 1 ms)
+
+
+  fsl,settling:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 2047
+    description:
+      delay between plate switch to next sample.
+      It counts at 2 kHz and its default is 10 (= 5 ms)
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@80050000 {
+        compatible = "fsl,imx23-lradc";
+        reg = <0x80050000 0x2000>;
+        interrupts = <36 37 38 39 40 41 42 43 44>;
+        fsl,lradc-touchscreen-wires = <4>;
+        fsl,ave-ctrl = <4>;
+        fsl,ave-delay = <2>;
+        fsl,settling = <10>;
+    };
+
diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt b/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
deleted file mode 100644
index 755cbef0647df..0000000000000
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-* Freescale MXS LRADC device driver
-
-Required properties:
-- compatible: Should be "fsl,imx23-lradc" for i.MX23 SoC and "fsl,imx28-lradc"
-              for i.MX28 SoC
-- reg: Address and length of the register set for the device
-- interrupts: Should contain the LRADC interrupts
-
-Optional properties:
-- fsl,lradc-touchscreen-wires: Number of wires used to connect the touchscreen
-                               to LRADC. Valid value is either 4 or 5. If this
-                               property is not present, then the touchscreen is
-                               disabled. 5 wires is valid for i.MX28 SoC only.
-- fsl,ave-ctrl: number of samples per direction to calculate an average value.
-                Allowed value is 1 ... 32, default is 4
-- fsl,ave-delay: delay between consecutive samples. Allowed value is
-                 2 ... 2048. It is used if 'fsl,ave-ctrl' > 1, counts at
-                 2 kHz and its default is 2 (= 1 ms)
-- fsl,settling: delay between plate switch to next sample. Allowed value is
-                1 ... 2047. It counts at 2 kHz and its default is
-                10 (= 5 ms)
-
-Example for i.MX23 SoC:
-
-	lradc@80050000 {
-		compatible = "fsl,imx23-lradc";
-		reg = <0x80050000 0x2000>;
-		interrupts = <36 37 38 39 40 41 42 43 44>;
-		fsl,lradc-touchscreen-wires = <4>;
-		fsl,ave-ctrl = <4>;
-		fsl,ave-delay = <2>;
-		fsl,settling = <10>;
-	};
-
-Example for i.MX28 SoC:
-
-	lradc@80050000 {
-		compatible = "fsl,imx28-lradc";
-		reg = <0x80050000 0x2000>;
-		interrupts = <10 14 15 16 17 18 19 20 21 22 23 24 25>;
-		fsl,lradc-touchscreen-wires = <5>;
-		fsl,ave-ctrl = <4>;
-		fsl,ave-delay = <2>;
-		fsl,settling = <10>;
-	};
-- 
2.34.1

