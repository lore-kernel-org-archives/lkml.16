Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DB822F147;
	Fri,  9 May 2025 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804609; cv=fail; b=KEWAEwMbY1wBRW/j+LAy43DPJRE/hsQKqi9FuAnZmecZTMrTF2FW16TmEpr2TjENI8g1rMGeuMm+/RZHEAyd2zWOTTMxtlM9sJ2Ii2lTw0aN6NE1cHaR5zvsYQ3MRGtIcohf4vae50AJgw5wTO/biUtUoBeWGqrN865m9V5Kr64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804609; c=relaxed/simple;
	bh=G3rz/4qZVX4QBdQLy0oyg2wTsXWyaDeszyuqXadZ/g8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d7BcQWz2XSYnJwGQu5KPCFtFTjkRW+A4A7VNTHu4vZrtRtCdc5wQOzmKWzSsBTkrpeJlHbyJFpcxUcjRVvNXw/QNibuQRpMFaW/wTrhK/XrJFUqBBHXv8So4JGrxfy7IOiIx6Jy7tiFTJ71cUUFsEBrb/Pn4QglmlXfo711dcj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DNzSeYta; arc=fail smtp.client-ip=40.107.22.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DNzSeYta"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbRfG51Ffg8R2lTwDOhIsZ5rzeO05Z/A7LwaTLwoJz1A5ZZQ8dQsyBcaZv45vSi2KBpTJI5TVD9/GYn/3nhPkrUjoEQ72k8+uRDMAw8SXqFIirr3jd6C6wR/jb41g0zAuziJmXdBRCPQI4wv7sOsMt3L9F/22xpk6gXjkhGljm4wam/mqinGqOHqaeQkwbsbakRkutkVZOS9a3cCcZjiLGeLvx2611dfHN4e4yp8fDCEdVp5M3cVo2WM+HmdHleVOuasHsjPOS3VemocvWGt8NsVuBo3wNzP98PSauPafq+hiliHfMTHUlnRPy7O3oGgHpIsLyG86oQNpljQmzSaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7kc/zKTuzMFbUyzlmG7TrRaDNLYUA5o4pzudAB3uII=;
 b=soJiOtIntlcqKJtNz50du5Hb2PJ9rD1w+Wi6l7jvkgbt7Wn5rQDfZl5uskWNxIT92Fwa6q8xqy+lI2I+4VdHWQsxy0ffxf0w4jpx3+skQFYFooIrMSEdtJWhJycSmRBtwJeFzSHzFDPptpcYU5Im5SYjz63ayCDC9scwNFr1Jv42Q1tRL/D1w2XOvjuTK3+G/pRJUNsXuGU8ZRD5BFX4Tt8VtiCoEw80ikPchgN4KYZGmbmtkY70F7B2Ty5dNIkMOPpgA9LmMARq+CdwuA6dEksHgw5YbUxoakjbnTXKrgklOAi+tKhRtpfKfPS92refO8L3LQO5vCN9LnDPv2hW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7kc/zKTuzMFbUyzlmG7TrRaDNLYUA5o4pzudAB3uII=;
 b=DNzSeYtaKSta+R3IC39BbeM4lkbULe0mqif3Z9EkF8XYRCkUDse1TGEuDpuc0Z0IYkDfT5L0E/zDQPEFqq2oZWRddSSHEVetEgN++wGmIusyJHFNZX2DBCCo6b8BEqNqTLyiA2vhwBSvYVc0of7z0+cGuzDaxzMIlUcogzzxooa4BKFdZ9drMOHwaVU7z+boOe63H3ctXlH1Vhk8j3c3TucTKRtRvU11GYxWnZx5SJzFqXBElPREweGQ8ES7puZEFTYJpi5FPfwNb+LL/61Xnrshdi0ATGSN+CcZxm1h33OKBgx1+iOSos/JXVa9jOPMZT4ltNI6m0j+rzOegzm2Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9974.eurprd04.prod.outlook.com (2603:10a6:150:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 15:30:02 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 15:30:02 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.oltean@nxp.com,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v2 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
Date: Fri,  9 May 2025 18:29:35 +0300
Message-Id: <20250509152940.2004660-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
References: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0030.eurprd03.prod.outlook.com
 (2603:10a6:208:14::43) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9974:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3def61-17f6-41cf-0ce2-08dd8f0e5da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bjnel5S8yJGbyYHzoX2LrSuhIcEXJdlhZ+gPpyCuONkDK/pDE2PrWbfHBOi3?=
 =?us-ascii?Q?a3dbhEDUcha4sZBhxJYtgD+1vcwAiRNpJjM/Vz4fHv+uu9MF5qNK4XV/9QXE?=
 =?us-ascii?Q?MDeP5Azt1e/xjs8kXpxbseGiAfm5opepRs5cA3J1vPmnB+XwoGaXfUAq8du/?=
 =?us-ascii?Q?4/lRuI7EV70Ax6SRwVbmjvKEtuj2z92KYXKMxJCggxSgTAhXsmzcMmIMRfKO?=
 =?us-ascii?Q?IhPrbvZDLK4kg75TUszZUqfWex/w5UAF/b0UYwsrNiCyL8WOv3cFkJZqY+7E?=
 =?us-ascii?Q?FOpe8+uVCgSv1qPXIGstd5UVcyOTNVYJdMUcGbBcWPbkpXUqOACC/kJgE0Fh?=
 =?us-ascii?Q?Atw2Yu5B7MKVJuWCuKTI7gH9rE59JVn58bn3MiL/LEh6fcoQayg4n+mgXRZS?=
 =?us-ascii?Q?kFq002K+x9ShoYzQPMgzODro8TF8ZXp+N+cAN3OJ8Nr+fuiroCMN8b9yIICr?=
 =?us-ascii?Q?M6J0UMVvUfeKrymnrtGKcNs9bg3UymTqbSuCq1ieznZiwUkDvESXdMDsPkx4?=
 =?us-ascii?Q?EbkntIWLudoicskm+JVgWTjuM1odcPG8CAr0gPs3fz3j33lC4hcPQRw6CJnE?=
 =?us-ascii?Q?5oWNWx6gF3qSIGvddEXDPKDghY/PEwoEL1/GSZw7T2B5ltAJwyT9jSz7Wm/u?=
 =?us-ascii?Q?M64kg94SHr3ZuJ/UfNXR7k6t/NQkk8mkQWsgFTFjFTuCmQkvwlByraC5Wi1/?=
 =?us-ascii?Q?EnKDo8dO6Unq8XU+APGavDK4U2NxXOsmPrqSjumMI901aWkU98SpSOIN427T?=
 =?us-ascii?Q?9I2E8tNZpr6pyuKVowgBiXfAj3ndQBuvT2z7zsXCALKgUSv9Tw4MUOmOwdMu?=
 =?us-ascii?Q?FFTtAbW4p3qiqspaR1GBz95vSYHMXXp5XfXdmlIfua2IuPXi1TNe2qMw6hRh?=
 =?us-ascii?Q?/bLCVKJqFO16VLnUjRGefomMBU00Uylds73RtfgqO07gs8fcxjenPBCacxtZ?=
 =?us-ascii?Q?vfbSiPZELQViKQQRR+HKV5yCxCt5Le8yMIndFundkNAlJfhEjocnA0L9mjhH?=
 =?us-ascii?Q?oSd/MOu/IiJ2uUstWPOK9LI+KOoydPOkVzf7nQQ9OUX5M8iORGEsyYLeADCU?=
 =?us-ascii?Q?PVGAXpHlTOxaOUtA9avhlUVuXtuJMXgnUJTQb8CTGLcjqy3KU+r8mFxMsGvu?=
 =?us-ascii?Q?TtERtzuGUEDtrPa4BZrMelxoC3LIavc3PsPoTfcFUSY7kY3y06mJ/I4eNils?=
 =?us-ascii?Q?dTzfzlcbBfOJt7M08f00y4jZ98GbIRVrzLvr2M9AAwoJ636ADYaypy05LUYx?=
 =?us-ascii?Q?ER9JIu7vPXVkeik+DJACifDjF9wvhG1po/8p7Pliob/Z6n9b9SxR4aBLf1Yd?=
 =?us-ascii?Q?XAlYi8SlFbBtVy2k8+1O0Q3tT0CPtSzlYt2RUvGJ24TdMG5QBDkAeNsV0kG+?=
 =?us-ascii?Q?wUAfnCE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D4OBI0pWdt4tI+Ade8jZz0c78W/9a+ux9ULLFyaFvs2ZBd4tMIH88gvV1YMQ?=
 =?us-ascii?Q?M1EyzNVsXvPtI4dB+/UreowH+zUEXmvTN3gR3JHPFzaH1DYP+jq02UJ3csFQ?=
 =?us-ascii?Q?+twgqwEah052pZVLZVUNAkuTQtvbE6AnbYFDkglUJOO+XkDxmJ47+JXoqMaU?=
 =?us-ascii?Q?/K+ib594FPFVK/kcWHOSSRJhNT9Fnw4bHI8HgbMrf6Svj2ZOrzsbKQOwLnQL?=
 =?us-ascii?Q?ezLizfcoeYkuYalIM6xeXUUdYCchj9CoznCgfsLGAJZZ/IkfnzpRX90KakYg?=
 =?us-ascii?Q?hAXREBrX0Y5VR1oOQu8ldzl9ocw8qmSyxzLbZkXutgoMd2peVy0mf41xJgAT?=
 =?us-ascii?Q?FOwdTinp235MO+xCr8PCYbhNeg8scmyNdip2MVcMCF2zearNresULULAeINr?=
 =?us-ascii?Q?74OQkm/GNFvoPsr6iTpaM8Y1ZLJM4euUhzMIiZeQxmK6eNZ9DUhuYIRV4IP8?=
 =?us-ascii?Q?DDJQk0QnSURkB3AFW8DBYeCS4vYpixhz9m35CC7pPI1lTHIEz52Zzu1JuNpW?=
 =?us-ascii?Q?VtUStfUdjKJkgxDVdGcTZ8FstW4HzXHpQ64qRELyiUuf/qLeJk8T+J7fD7Yt?=
 =?us-ascii?Q?/0QwDKXVvhij8BMRj2yLWOk2PnCOagBaOh8lhCJtV0U5tyP+W5jZ4fdi93oR?=
 =?us-ascii?Q?zk5GjUNtsvFP6WVDRR7QUjGJrWDSbC79zWbCRX7MFGexR+BP5iwC7/CyOy4s?=
 =?us-ascii?Q?bHe2Dkiq6zfslZL6jMLxIIh6biPT9bbwUAQKBBRB64VdcyBmokMbRVuT//lB?=
 =?us-ascii?Q?0UJtXzRVTlE8/aNbDFhBAZZqB1PNYiru6Bvk1rdK+MS8NLuvkBz7M3GWFoYY?=
 =?us-ascii?Q?8KP8bUXRDFdrPYEli3GFXLTdAO7ZeyEPpnYgZPhffPprqivafGiYsrADaCcK?=
 =?us-ascii?Q?zX/vgOwBIbdFAAnAGEpjSkVCUt/mpYF9CF91+GQQEoSwyWYeULTdMlrvcs/T?=
 =?us-ascii?Q?nED0mUoqd9FfhSU54P8WuHYiai+pF9rL1oNbSbsqbPvfXqXY222RqPJMHDPb?=
 =?us-ascii?Q?k3cdCHiZV9IQHQzMyGjzdNE6ovQvw4bkw521nRj42sEm/c4SN4Jpcbk3iW5S?=
 =?us-ascii?Q?yzfjeDA6omSXyUdyjvHrMKZPdOdR5wYB9XNYazrnEc4U4ssEsu8bhgI7XCd2?=
 =?us-ascii?Q?x87MR6srTi2eVPgbxCNB/K0/UGlE1JN7vQQCFiG2PO6B8YJGK/4qq/NX+p+I?=
 =?us-ascii?Q?5JrKduCIl6bc+FH9+LQWeRDkWM/9uHG5PyhjWkF6e6jXcWyqHIHOw2jE6l7a?=
 =?us-ascii?Q?g3l2WsddOrHerQptrwZTXmitoQrVwDPChzADcvOzGS1sa1wZ1KkJA2N+El3M?=
 =?us-ascii?Q?dT63Zb9CpNnEPO1HNNgtclwQ/JUuzGYz/eOfqSxUQfzKdaRc05d34pRMbhqQ?=
 =?us-ascii?Q?OjlcEQVM1hXmOqlQNPnrrtbCpts3wQmMUH3aQfjAagbuVCVl9tXxM1PlOsSu?=
 =?us-ascii?Q?0bCXiOWIYCcfwKJcbFbIok+t50Nw1uvTUrOF9E48k0JiKjkuvOCpVGE+hAIi?=
 =?us-ascii?Q?2pEXT9Kh0CGexWZWLkdFrb2Xmor6MswY9JsaCZ7eRglXH/e2KZTAQb86B6G9?=
 =?us-ascii?Q?UYaxC81PDjURU7amWc/tXPSMYXwc8tpdXi/sbZ9S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3def61-17f6-41cf-0ce2-08dd8f0e5da4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:30:02.1060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fk08Ty+w0yA4XHtAQDfX8nnc64csjJlmL7caCIVSrP/qkppxoEaVXdEcVjy5PpCC121nqq6MflTwj+1kqR8TUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9974

This adds device tree bindings for the board management controller -
QIXIS CPLD - found on some Layerscape based boards such as LX2162A-QDS,
LX2160AQDS, LS1028AQDS etc.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- renamed the compatible strings so that it does not mention the i2c
  part, which is redundant
- remove the description from the reg property
- reordered the properties when mentioned in the required section
- updated the example so that it actually reflects the expected DT


 .../mfd/fsl,ls1028a-qds-qixis-cpld.yaml       | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,ls1028a-qds-qixis-cpld.yaml

diff --git a/Documentation/devicetree/bindings/mfd/fsl,ls1028a-qds-qixis-cpld.yaml b/Documentation/devicetree/bindings/mfd/fsl,ls1028a-qds-qixis-cpld.yaml
new file mode 100644
index 000000000000..cf4cd91d9580
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/fsl,ls1028a-qds-qixis-cpld.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/fsl,ls1028a-qds-qixis-cpld.yaml#
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
+  etc. The QIXIS CPLD on these boards presents itself as an I2C device.
+
+properties:
+  compatible:
+    enum:
+      - fsl,ls1028a-qds-qixis-cpld
+      - fsl,lx2160a-qds-qixis-cpld
+      - fsl,lx2162a-qds-qixis-cpld
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  '^mux-controller(@[a-f0-9]+)?$':
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpld@66 {
+            compatible = "fsl,lx2160a-qds-qixis-cpld";
+            reg = <0x66>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            mux: mux-controller@54 {
+                compatible = "reg-mux";
+                reg = <0x54>;
+                #mux-control-cells = <1>;
+                mux-reg-masks = <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
+                                <0x54 0x07>; /* 1: reg 0x54, bit 2:0 */
+            };
+        };
+    };
-- 
2.25.1

