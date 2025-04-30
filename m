Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2048.outbound.protection.outlook.com [40.107.105.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C2B1D6DBC;
	Wed, 30 Apr 2025 15:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027409; cv=fail; b=S6O8xeKJqrg5mFJRy+mh4pfOGm7T7+ue0LK1V7R6UOYAQ6pVra+PBYltJexuyJamM5sgMB0M+espoy4xABxiC9mK2hbP5preqfJdG7QRaKTz44+WNSyQY4c22OOkIwz31H2iIYWR993ivRpTJSXUQQ4PSwA1ieHn+I78eKwj3Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027409; c=relaxed/simple;
	bh=vH5x4miiEJNJvj3T3I5p3LPv6ZyL/qKpBlmZLH+WkPI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FiOqzcXBfJvHdh+rXCFja4kEUOQHhiNE+f6QbHXc6dlabL98hxMVsYvAjuFLleU9bvxCmnj8IBI2DjGRXye0+zs2nPf1p+46L8JlPNh9Z9MnRxKruAKV5/QwjgMHrJAQgnEUs4HRblg8nfuufCXUZ6LPLdwEqlWkUJuDXgAyeEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Sf3oAdBc; arc=fail smtp.client-ip=40.107.105.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Sf3oAdBc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7nI79b/g6xNqqVuSevFxcoZrOkRgZTBTGYXGpf/ZyhZUl2p5opFUeLsthkXOINrG6UeDROfcvJXgITGOWUE6t3ePJdxVlkHtliHBncSfAmzI61bASvolpD909Wy3bOFD9rd+azj7Y9ol9Hpoyp3zjB2QsREQwrYPA+J6NU9V6eQZK17l6Xm2MjhRFqHb0Y3PRCfETCsrgQgmZ5hxG7WRflPWnrSHIB4lW7/dHXZfrpHPwxikZKhRJ4AKIZOi82RxvJwrSGNxM+AS2zsTqzA2iaASreLe5QIBnP0NE/IOHNXCTeL7FSZisHoCVXkHjkAGzKJijx8mwp7y2WrbGm02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P02+ZFHdEYLHRpWz1G1qqW85At1grbfGJX47Y8N5qC4=;
 b=Zm7aicSvXLllmdclF2icKLclYitEoI9p31la64hq+rtYte7dsV3GPinSnDnt0ih33kNBVMd0n8CqWgZ+GKOLTf8472QgzkU7qbhErvjjPf6QLf8GtinBmOvwHozMDgDlXeYpvHLGh5a66cvnTtIn+fd6DipaN3tJddN7YxSbHx0cYz79qDtl9pRi3yVdfOQAxVEhM2KQw7zpktHe0nZdYMVXfEkkcZKU3AOxX0O12WJS8duLkGQ/qI7uq5YJk7OWqjX91/iGr/I9QbJQDArxh8v+622+wQRpuBuVGduD5b6anknxY8fljejzPinhIYDMbBPoOBT8sd8yfNihXG+Uiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P02+ZFHdEYLHRpWz1G1qqW85At1grbfGJX47Y8N5qC4=;
 b=Sf3oAdBcgXgME5RLrRRVWqwkTYeyR4H+j5iDtu2FKijryK/OpLvEdMT+2ue+RpjGuSEZoDWJdIBdDIiGshOqAHjbLYQVeBERBCQdKHBNkTGyF3TXtOVbgLtcknfwWeHQWfBaqkl0MbQ9VnPgpiM2oomE7aUoHcBM2zJxQpEkgqYH8cTN4mquGY/2pwp2KEqqlb2Em4bBo/IZNDye44FKTqucxnUcGFpRRfNwqYs7oZOnzmnCO4JyMuReptf28KoRmDAuQLGrAVH90XkH9s8EPM/FTY0pm0FclyhDbDn0iSU6TNdaOFkNpq5EnnvCN9LVyVUXqY21iNG4j9+zp6CvqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9665.eurprd04.prod.outlook.com (2603:10a6:102:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 15:36:44 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 15:36:44 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
Date: Wed, 30 Apr 2025 18:36:29 +0300
Message-Id: <20250430153634.2971736-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0036.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::7) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e19e5c8-2901-4beb-c53f-08dd87fccea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t/ihUmjAFJ0+QyRKMG0vwlE88i7fqP0mANGigizupjvpepwxIEL4mezqkr/Z?=
 =?us-ascii?Q?QSigVgDuYLKIrswTyP5CsHIcer+Pk/84HelzZcUtphxUcPYWFUs/4Q2LjHMo?=
 =?us-ascii?Q?sx5C3WLx13AZ6zBW0yX4FIbghtEyPhJIJZYSsiY/wcPcPfXjceqt2oC8ZdhG?=
 =?us-ascii?Q?oL/KFRwo2lWeTxxq4U7xQQLoVHqHEkALhtQXldkWyHGNnOBTiBQYxivFuu3O?=
 =?us-ascii?Q?agIzGA61AWbAzixGVnd3J/PZl6AsoEEcvXugMwAPQXF+NSs4vv17NI43+vnH?=
 =?us-ascii?Q?UPgpy5tRnB0WcJRrws6QzkBs672jTB/MMT/8ZMIOToYzUBeAVRJv0dEYmddz?=
 =?us-ascii?Q?eFxYOkPULifk9fY/JfJ36eflacNc9UFk0oDn7HXnmmCnszzUo+MaGlo8lTqh?=
 =?us-ascii?Q?8hjjCakh1e6UNttt01DG7IAlQfYsoB5/uCGi8U5YH2xEbMlodkceuDVsrWxs?=
 =?us-ascii?Q?7JTzCaNbvtSF9KXTmZPtuPpaEe6rnqzpJSg7k32GWeDNj7VwApDtqLLyvWgk?=
 =?us-ascii?Q?vDimpSp2ql1YczGlhyKOok/6VuEfvuR0iEbs61NEw/gIT3+QeHTHJlUHZpbW?=
 =?us-ascii?Q?ZLlTJV0UEgdUrLJEz7Ov6yPXBWKFha/W9p6rkMFXCyPIwt2gXv+esDHUaeYh?=
 =?us-ascii?Q?ntY+cLSI+dYfm32P4PWao4Y+dLGTMwZXpBtg1fItyVIL2dPHlGQ1/tCFT31C?=
 =?us-ascii?Q?ov56XTd7UpCO1LMGXSFkQ2EI2E9Pq0o3Y1oyIT18yeDsHBWwzpSHcQqAoKSV?=
 =?us-ascii?Q?vobcmRSpRXa2nINLq3w99MjBOBsCenY2BANR/75pP53H1vpaSo9lHjp4ziwz?=
 =?us-ascii?Q?jhhinzdrfCc2+L89RetIblmArxEjPtb53/4rL+SG7chb3dDrcOcwN/9h76Vn?=
 =?us-ascii?Q?IRKCV308VAGaB2oTQfHYHFwqVt4wfSjgt0qSUjnG9pHSj6i07BqEPXZgwM7n?=
 =?us-ascii?Q?VsoojaP2/TbUcgniXUz75xc2xVrbFsJUnCIDgwJ2dC8FKiMszqQ0aeRjM2ww?=
 =?us-ascii?Q?nDUCeaQ5/l3LYVOAWaOZtA9i7Cb77SGafaoWb29+lipDNErW96f2j39YMwIn?=
 =?us-ascii?Q?WdaGMroNgfqfZsaKIXzgs8IpRAT5aR/O2P6niyOy4zTbgoOFVpqXI629pnHx?=
 =?us-ascii?Q?UlscnZRONUcO9maA9MGfDuiIQdCkQCKxCWzbebDtCKScMB0mUtK6+VzpBZqP?=
 =?us-ascii?Q?k5ijdMwe61O2HI2nKUtIQGRzeao8ndWXWfOiKTdsttyoq57LP6neMCdXRs+K?=
 =?us-ascii?Q?2dw7bZhTURYcAQzcOOZpBjZg+qTJY1emw9i97FY7192BIR7bhJREKBM4wyO6?=
 =?us-ascii?Q?EuLfbFPty24JJ44yFync5qNdwVTv8uPchVHINSYR6BMaZhggmFVyeHpGTyxF?=
 =?us-ascii?Q?bgrGKKw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SQsvDK9IVj9oYuGbJGPp4we5OOs7VSYCTFfcwu8jQQBoDXixf1wQ2t2hZykw?=
 =?us-ascii?Q?ivRNaZ2YntLgq8AlZ3gEWgoPrjuaz1tWlT9II5dG2wYuPhcIFYxQ1eYlgKWN?=
 =?us-ascii?Q?pF5ENkCv+jRZiFTWMIJkTpcRS41ucf+BdAmM/pF92wFNkuO9XA9kfGdrsKIS?=
 =?us-ascii?Q?8nt2qheXiaj20dLbjht5G+S4W+aPNnC+9QMke/TTJUo9++VhuyjBqwEvSufN?=
 =?us-ascii?Q?cd3vsZY/stKUductlaTSKlXhp2OVumJBuLL8qj2AcdYkbXUwm3Hc62lWlyHd?=
 =?us-ascii?Q?bhftssOWI3UN1OZtwNQLEzYLkGTIjpwP0UAqH3Gv/CqGWtM3ubzJLNZM6eOa?=
 =?us-ascii?Q?HIiyO7WVY130QSbwj4hwebmNf56RfkrA/6g5/nzWxxIBFr325qxMN3ZOsq4X?=
 =?us-ascii?Q?kUMhwemnOE3nEifXewPZVP8ia6WYPkqBWwjCk1Kq5Yy/ccONOEOyWEgK4zZd?=
 =?us-ascii?Q?frLa8l7ORJCpkuaHjyxafE4ZACkrv3tN/JI8xaWzDFxemYMsyf4MCVynpcEd?=
 =?us-ascii?Q?gPm5JcEMmAuvlQTr/we8LOQLIfhjf97oMPcRUmvwWPw47Y4QAa/IolP5Jy5e?=
 =?us-ascii?Q?UBktxwxKXsJFrxpcJY5M4n1z7Vjyz0SJJRJ6VjMLQ+X8Ug+DN70TLSyP/Avg?=
 =?us-ascii?Q?nC7kSVA8KJ3V/878o2GtLNESWdkgYEZ4g4gz1nJk7c1d9+I0yc025gm0EtBK?=
 =?us-ascii?Q?tfTF+L2+f0eakp5sLRGsi+SQG+RwcSp8AqzuPnbC8bY/jh7ilSIYiLLdQCtj?=
 =?us-ascii?Q?xDWdTbCuVZlWPFJvbAVVWC/u+djOHvESoeKBhCJPn4D04UBashd/qnyfrpCC?=
 =?us-ascii?Q?HexeE/izI2ZKp1bQK6axTm55yc1OJ6FGpBeMdNgfcl5tHLCUHdXfaReXaHgb?=
 =?us-ascii?Q?2cHrJDxiMZOYP61Ioj+xtk94eOgW/3yi0Ev7h9+O3iI1UavmU11q8zaV0b/d?=
 =?us-ascii?Q?0536gN3GW2M8aSAUMgaOU7oukOwRPulMBg9brHsOur+QzyJNS7up/vT+dc6f?=
 =?us-ascii?Q?iUHDvsdFOxIh0D7YH1orDq/Vtol5r72LAOWKrQVfoQNhskkFhV835uHnO0yJ?=
 =?us-ascii?Q?KI7TmpGbq8bska7nuywQdy5f77CTUTw7RvjBHrsHe58K2vhva/GCegIXoWcY?=
 =?us-ascii?Q?T9YIum67w4cBnRJnKwWhCWbJImhDy+5Ix1ahi5/aQ7oF7Zkm+vC84as3Rovm?=
 =?us-ascii?Q?9Tpd+h5kv/GW61vlp9JT+ZzXXwL8e1sgcHKEx9C722hnsGucG2/0FSpYZ2SL?=
 =?us-ascii?Q?Cp1GL3Ibf9+a1rxdy3mMQQLcItcM67XNNAiaOekgrBHWRh+pv+gQmMXMjVMH?=
 =?us-ascii?Q?VhdPdbvMRxot3y1g1qoHN5HpdEbiDNj4Oek9HE7cI2apLc0/aBAwr6oGKs68?=
 =?us-ascii?Q?ElQNdx3OnEx7GRgPwluTioQXj4Q2Dug0DDGLOkscWv18n+Tyzdd3lQTQuMqP?=
 =?us-ascii?Q?XGsDDqyHlV8rISIcTPfmHAgX59a6orcoBfRH7rS9vAUNHBnr59i6NAgb9jvv?=
 =?us-ascii?Q?qFf+86MyI5yTPHODfojHmf1BxksDSJj5S1dhz+j55W2s+d7xditcAKYDXObo?=
 =?us-ascii?Q?TdPlxiOP6W0Gu4FSPpNuoyuEuqAMvY/HSATzkdH8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e19e5c8-2901-4beb-c53f-08dd87fccea2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:36:43.4439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gd6jOX+zB/qNPIyU71cLN1Zb0HFLnAXEl7tAtR0XdThaJFcxSt/gxu5L5cQQ328/Fx1FuPD+Tmp75NtRCVOBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9665

This adds device tree bindings for the board management controller -
QIXIS CPLD - found on some Layerscape based boards such as LX2160A-RDB,
LX2160AQDS, LS1028AQDS etc.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml

diff --git a/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
new file mode 100644
index 000000000000..562878050916
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP's QIXIS CPLD board management controller
+
+maintainers:
+  - Ioana Ciornei <ioana.ciornei@nxp.com>
+
+description: |
+  The board management controller found on some Layerscape boards contains
+  different IP blocks like GPIO controllers, interrupt controllers, reg-muxes
+  etc.
+
+properties:
+  compatible:
+    enum:
+      - fsl,lx2160a-qds-qixis-i2c
+      - fsl,lx2162a-qds-qixis-i2c
+      - fsl,ls1028a-qds-qixis-i2c
+
+  reg:
+    description:
+      I2C device address.
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        qixis@66 {
+            compatible = "fsl,lx2160a-qds-qixis-i2c";
+            reg = <0x66>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            mux: mux-controller {
+                compatible = "reg-mux";
+                #mux-control-cells = <1>;
+                mux-reg-masks = <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
+                                <0x54 0x07>; /* 1: reg 0x54, bit 2:0 */
+            };
+        };
+    };
-- 
2.25.1

