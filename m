Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203901B4153;
	Thu, 17 Apr 2025 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906016; cv=fail; b=iwablITVCt8Z6OHOAbX5YxttdH6aMOchlMQhlAaQECCrKAiFPUJBwwLJE0Xbp7iH8YRXi54gsVeSbJ2OGMH5FvL4OiYaE9ZcSqK4C/jMka7rUYXaU/OZKXYv5JZcNpZmVHUL9kEdmuBhuzcNwPD092ivmo7K9FBNTQ0NOdERoCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906016; c=relaxed/simple;
	bh=du/ikh69xC8+p8VReD2QDbRxq10t+ixPEkmSCwy8lbI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SD5BeRfvHNtHj6WxPYpfqJnP5n+sXwjxp+ZxhLq6eX2UUSRhmiSf1nRFQ6vdky9m1jC0KxpKY9YAj4ATWTu0/g5v63cWMpCYVbFLu9wOMvcli9z48XI1h4B0zDylnyqwGwFUwazfC1C1XntWqQSRrCXrMjnh0llgM0STqQEspJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=dT0SYqG8; arc=fail smtp.client-ip=52.101.61.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="dT0SYqG8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQHTi1q2xUgeRzSGgWWsxXAir2zxBYWlHKvcg+mHoTDN+cW147A4UAZAZ605AFcgwE+Qr4HatwM1TaXNR856lCWe0pg0zIbc4TSoZxKbjpIvA6B2Olqogju6D+b04FVKN8BlHvLaYIadRQkaR9+1zgHpKl8MgVWwXvZuOOV0VER5C95Mcwe7/Tnk1ZkaR8yad6PzVPOvPfiI3Cz4REp2FWGm5MiverIEbtChW1Su+Uwaqe6JLheVNonrblqXcJfkUDAwdTFaG90W3439FHOYM4Zo5kI70ojcmEmrp+gEueQ0vm0OOmuDjHeT1dt2uoSvf5LPOE6U1moQI81MSSz6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u77LJ+fPfoFTroimzQnphtB1zX5QkR8ihFcUVg5lzY=;
 b=rWhpvRLk5UfvTx015D7fmd6p3YTEtIAOdZhl2GW85G1cz5qVd7w4BIsLqPHt4jeGULsFHV1J+UF3BLNqTs7AMkkDkaVsxi/tsl0exz2TQHzVSXhEJblNnSma3R/lCO02xkbB3AQXxkbarJ/UIJTa3mIi36B/TPTa4pGzxLW1sieeZuQjUyulbAnreboRUJW3kzZWAJd2Z0pDLCf5J4ZCpNA0wPW2ZyM3ZGgCoMLM6Oym0JaCun4Y+jz8vCG2JIMcX4sU7i0lcLJjmWaatw7wS1diNXQB7CvTMwoT3xZxMdJsQFu2PcnUbnVSbpQoSnqMDOdPslW2/1apsDAzZRO5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7u77LJ+fPfoFTroimzQnphtB1zX5QkR8ihFcUVg5lzY=;
 b=dT0SYqG8hKAORhs1xmLDJxlgphdlXjkp0dfuAx42XMTpCOn1nS80CPJDzxLfSJuutRhbCSf5gkFX6PyFWRN5InzdOWiY5+S8FQ5NGAwfnY3iFaaYqDYs9uhoiNdw7tJnlAI4GKPtUtNLBecATTjylcfBnCb4oBycLmSbsJYmb7Jrt32K3rZBRDf2eKYUEUKUqQ8HqwF8Qy5KBlyfYjOOu6G5N/vBRnIjNM/1WaKgIkz68uYupa5BL0AzPu5zIrOiHYhGNFg55oPIcx4tKNotPZk9QPFk6FG00chmbWlEDYH3Ut4cd7/F4M8AHvdaX/gV9Wzl6ex9q3CltTBD+ToapA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by DM4PR03MB6191.namprd03.prod.outlook.com (2603:10b6:5:39b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Thu, 17 Apr
 2025 16:06:51 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%2]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 16:06:51 +0000
From: Matthew Gerlach <matthew.gerlach@altera.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [PATCH] dt-bindings: clock: socfpga: convert to yaml
Date: Thu, 17 Apr 2025 09:06:16 -0700
Message-Id: <20250417160616.47558-1-matthew.gerlach@altera.com>
X-Mailer: git-send-email 2.35.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:a03:333::14) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|DM4PR03MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: a4768a61-3073-4a96-f747-08dd7dc9dd40
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D7kmBFn/cQf80tUtZLQ7GYJQ/XxxValh4ysQvRW6ALbl07Nrzwm6G1pdXXZP?=
 =?us-ascii?Q?ByKHPJd3OfR1U4fTyY5rdV+BIRhIJjqVefKVBZdJCTnHjMp87xar7kh5Qg+J?=
 =?us-ascii?Q?EU9t6luiKYQEcxYHOLZAMCQh0bK8R3BZELnrsL/9cBcmC6Awu3DwG1kxrsU0?=
 =?us-ascii?Q?knFL6Gmp+Aehex9ziZ17fvHUNg0XU2jEDsUnljcglnq3mnM3sYMjTJ2isvN7?=
 =?us-ascii?Q?DX0WedCMUHtmGtSOLNjEnlieizc3Uydo2ifhlRStziF5Xr7WDtP8vJjY/1Q7?=
 =?us-ascii?Q?YUap8dcVMMvK2kimLAwISNmrxpi+6LzCGDGOMbepYAcmYeNktAXHWf8Q1kCw?=
 =?us-ascii?Q?qa8Swr7SCIJbFrdLzJrQ5O0AcuD8L2buSiYqxbPUr9HGXhSG/dOGoIKFK/8b?=
 =?us-ascii?Q?B0JCidysNFcje+/j51ypY8mYCx9/E95kUlcSu0jqLJ0KMDpC5QzaxlcmPYLd?=
 =?us-ascii?Q?TJC7CJq0yMOHMnMtmZMar3RnMUlVszXSFLmF7hB73PNAQbEg6rlf318ohj+x?=
 =?us-ascii?Q?XOUMIyzSlnNMr9+1J7m5qDKZACj4D+ySm9OjKk0kVwYj0bXfr69Ji6q/KAY5?=
 =?us-ascii?Q?J1pOQV9X/0B6RWOG2+t7S8IL/3fXk9OUmmsofQrghHxG6YUYRSn0D4eMZ2pt?=
 =?us-ascii?Q?5oihqwHmd6aCSelC/Hn8eSklfeA2BS6of7RevOjrXXIs6yW9lsmhfFcruDI8?=
 =?us-ascii?Q?BmdNhcIYP/Tf1mLpDICdUReVFhnKFRTM2H+XWtKKWGooYDGGEafaN2fk2GCW?=
 =?us-ascii?Q?ZxThVQ+Hzv29g9LcAegfvgio2KeSm39vAY+etR8aJcgXiDM1A58acb52EBog?=
 =?us-ascii?Q?+gDR6kPVHHgLCdWzw08zRJEyTDN+1PZdUxXGgma5MgER1ixrJv5MQ8p59cbh?=
 =?us-ascii?Q?n7/kO8EBPfUnRKVp02oO4v8MWQkUbK70jF5b8y3kcpXBffgsMlJXd7EA3hLf?=
 =?us-ascii?Q?Kgpo5Log9Ylo0r2EZPsFQxE5Qz5UaeBP8G+QtHxz5g1a6LBIFPAdANix+eI6?=
 =?us-ascii?Q?WML//ajhdE3C4Zh9lZlMZDJZowlM7SmqeUKVi5g5vVDANnw36NpKskMCiG6A?=
 =?us-ascii?Q?nKvaH2hmbJf056XykKnOWiAwtgRRkKNgUhPP7Ls7Ru4xexh3Gr1+hr+K7a42?=
 =?us-ascii?Q?A2PLMkfg7q7xNGxz405GKuPjjOpdPvq2xYWJOn07YDRuu+23s60bPbfoOPMy?=
 =?us-ascii?Q?7DHg5hO/BOgiFLGVCs507zuP3EY63DW4hvWii0t67yuLcrS3J8L/tELQuiuw?=
 =?us-ascii?Q?zzX7ZuR6jOOe5X77Ta2cp9X88XnZiuhOZmk0QjdmMWX+YEp3kTzjUS0L+hPl?=
 =?us-ascii?Q?5yMSohsguUsvlroipld1IAEscOabV3Ejql855+SGQyf4QqkZIanPcbpTqpZz?=
 =?us-ascii?Q?giOZZvRLyFDBbMvNWQ4VopRYEB2xJkMRA+uV40UncoStODA9ve1VxCJC8BJd?=
 =?us-ascii?Q?ffynXEULeYw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3461.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G2PQSRYkJVGcSrY8M/Np5hWptLa6xClfMGyclj2GS1q6ieCB1Xoy1HGj+/Jo?=
 =?us-ascii?Q?mtQ8PvCq50/WsGkPWxNA9O47SAVhLO8QL+lNjNuGNWCTWhosKnS+mnFJGtZ5?=
 =?us-ascii?Q?io72/8Vq1YKX1R5poTm2RYsUgqp+OHW6FfNLsotQQFNdRokABhYjT+o4DuKP?=
 =?us-ascii?Q?aQ8SrXkNv3I7FnDNyP152WRw9jZiDCgaLxraHsWqIHwQKlJLU904rKPlYMW8?=
 =?us-ascii?Q?RzNBBIh91k4Bu1oMhuzfcgvVtn6pPMR2uCFoSsa+o6/MjhbJu/vaCIGXQ6Ll?=
 =?us-ascii?Q?YPe9ydNnw4NJ6JFIj+jIRY2KBELHqhT7xEGUkJtDLk39cH/XBZ8LvtfIJrAw?=
 =?us-ascii?Q?YE0jQfzXGTSc6tAW80qLrIquwAeGwbMVmzBbXy8EKztGtPNANgNvV0gaglq5?=
 =?us-ascii?Q?I2ExZkNncZsiSuez/Pb+q9UPjNJ33SMAYcweEoXKwXNOjdJbJuEX9E59uoW2?=
 =?us-ascii?Q?dZZZ+dMMu0Sn84QDrxYe90yK35FA+UeIWZo0XiKGU5lUX3TlngX69PccNYrh?=
 =?us-ascii?Q?cZ72zaQdIhUV61Bn19kYh7kkd+BhK78xLSp4lKfvjwzKOnEWjKBJJu7jQjEL?=
 =?us-ascii?Q?93gmbT6zuzdLq58DjVjV7DxcBz3F82fwSAG11oMfuMEEWe5GQZX8s83HVUWn?=
 =?us-ascii?Q?Hm8mQMyMINv9qFyIcCumhjUEQWCJpluLJEdgvBptLqqknUoh0JvE9pNEFAAo?=
 =?us-ascii?Q?RQo1Zi4w40e4JE3nvLDzvNwfUzdNOdA1iXPg5PAL/q/N5HidW3KAiJtQ2u84?=
 =?us-ascii?Q?rUzgTlpN+AaCX/IKdCfcU/+sgiBSr9qMoo2R60wHcs/vpUXu+cwE5Ouwax0C?=
 =?us-ascii?Q?HOxygy6Ys6aYLVokJoJBMp20Nn8cdQ1PPWDZd0YDn2uMYE1qKBSLh5ODk/l3?=
 =?us-ascii?Q?LePGLs6ZSdfLcdSbd/8VOEc3di85yaVnQcZLQ7BHzKlE344BVaDhOFDfm3re?=
 =?us-ascii?Q?zXne/UgK/QQsWmgmnho27EiRBrz+BQh5ys5OVZ6fdA0xKAaLN67gHEuh6dIt?=
 =?us-ascii?Q?WZSnZs34GBIIBh+L1bRIbry3dyn2T7wy7Di2PInRbr+p/SFOPt9pLTf/n/PB?=
 =?us-ascii?Q?hAIod7RD9jAQprrbEBZBuAwABwcvIW++Sj4yUPINKpj2koobqhNmv2pNv901?=
 =?us-ascii?Q?TENnZX5PamK+O7nLuXtHo5tPdPcDL1BDNl94TYy2M7RmWj4xkzDNZZcTtR7B?=
 =?us-ascii?Q?9rgiq6H9pKmPVDZeKf6B8hVQONtxO2jT++5eF2uF+W3UJyqlnh473vlN79ms?=
 =?us-ascii?Q?bNMxmQcZJTgZ2FbnmBejFeHLhgGUO2lJE3ItbTe5YQzGOjFgNXE+eBLMY1wK?=
 =?us-ascii?Q?Z+8DjclnO7Dh9d5U/COl6yWjQCx0I4KFyyQYGhGxqxnyN/XGoO6uc5noV25u?=
 =?us-ascii?Q?9ZLNkSs0g431dZzKdYeZtfPHXDeSq+6hLPv1lLdFZyDrEAJP0YH0Dh3kbJfa?=
 =?us-ascii?Q?UnBHWr0+R42+r7gzugPXFzzEeCedDKtAo7R/I8VXWUMkj1atljf/bZjAOqCO?=
 =?us-ascii?Q?fVf6VoGP9qF4XK/q6aD1bYs9qU0uvI8idjAMPFdT2i/hscNn/qbix9er+l+G?=
 =?us-ascii?Q?b05Cf2JlizohyfD9/VvOeeMtwwEyCv2WZ/2CyzDf0XYXRREZRBaaJuCgFZJW?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4768a61-3073-4a96-f747-08dd7dc9dd40
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 16:06:51.4064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAwMH/Asd3hmM0rpTYhTUEdmjoE8EiPC1nRUT12b90Bc4wJOg2OyPd7rv3rQZGsrxtvZQRhHdCnNSSRUhkW5dBP+wNtn5qxggNDJ2pm+ssY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6191

Convert the clock device tree bindings to yaml for the Altera SoCFPGA
Cyclone5, Arria5, and Arria10 chip families. Since the clock nodes are
subnodes to Altera SOCFPGA Clock Manager, the yaml was added to
socfpga-clk-manager.yaml.

Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 .../arm/altera/socfpga-clk-manager.yaml       | 118 +++++++++++++++++-
 .../bindings/clock/altr_socfpga.txt           |  30 -----
 2 files changed, 117 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/altr_socfpga.txt

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
index 572381306681..4cda13259530 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
@@ -9,17 +9,133 @@ title: Altera SOCFPGA Clock Manager
 maintainers:
   - Dinh Nguyen <dinguyen@kernel.org>
 
-description: test
+description:
+  This binding describes the Altera SOCFGPA Clock Manager and its associated
+  tree of clocks, pll's, and clock gates for the Cyclone5, Arria5 and Arria10
+  chip families.
 
 properties:
   compatible:
     items:
       - const: altr,clk-mgr
+
   reg:
     maxItems: 1
 
+  clocks:
+    type: object
+    additionalProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^osc[0-9]$":
+        type: object
+
+      "^[a-z0-9,_]+[clk,pll,clk_gate,clk_divided](@[a-f0-9]+)?$":
+        type: object
+        additionalProperties: false
+
+        properties:
+
+          compatible:
+            enum:
+              - altr,socfpga-pll-clock
+              - altr,socfpga-perip-clk
+              - altr,socfpga-gate-clk
+              - altr,socfpga-a10-pll-clock
+              - altr,socfpga-a10-perip-clk
+              - altr,socfpga-a10-gate-clk
+              - fixed-clock
+
+          clocks:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+            description: one or more phandles to input clock
+
+          "#address-cells":
+            const: 1
+
+          "#clock-cells":
+            const: 0
+
+          "#size-cells":
+            const: 0
+
+          clk-gate:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            items:
+              - description: gating register offset
+              - description: bit index
+
+          div-reg:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            items:
+              - description: divider register offset
+              - description: bit shift
+              - description: bit width
+
+          fixed-divider:
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          reg:
+            maxItems: 1
+
+        patternProperties:
+          "^[a-z0-9,_]+[clk,pll](@[a-f0-9]+)?$":
+            type: object
+            additionalProperties: false
+
+            properties:
+              compatible:
+                enum:
+                  - altr,socfpga-perip-clk
+                  - altr,socfpga-gate-clk
+                  - altr,socfpga-a10-perip-clk
+                  - altr,socfpga-a10-gate-clk
+
+              "#clock-cells":
+                const: 0
+
+              clocks:
+                $ref: /schemas/types.yaml#/definitions/phandle-array
+                description: one or more phandles to input clock
+
+              clk-gate:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                items:
+                  - description: gating register offset
+                  - description: bit index
+
+              div-reg:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                items:
+                  - description: divider register offset
+                  - description: bit shift
+                  - description: bit width
+
+              fixed-divider:
+                $ref: /schemas/types.yaml#/definitions/uint32
+
+              reg:
+                maxItems: 1
+
+            required:
+              - compatible
+              - clocks
+              - "#clock-cells"
+
+        required:
+          - compatible
+          - "#clock-cells"
+
 required:
   - compatible
+  - reg
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/altr_socfpga.txt b/Documentation/devicetree/bindings/clock/altr_socfpga.txt
deleted file mode 100644
index f72e80e0dade..000000000000
--- a/Documentation/devicetree/bindings/clock/altr_socfpga.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Device Tree Clock bindings for Altera's SoCFPGA platform
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be one of the following:
-	"altr,socfpga-pll-clock" - for a PLL clock
-	"altr,socfpga-perip-clock" - The peripheral clock divided from the
-		PLL clock.
-	"altr,socfpga-gate-clk" - Clocks that directly feed peripherals and
-		can get gated.
-
-- reg : shall be the control register offset from CLOCK_MANAGER's base for the clock.
-- clocks : shall be the input parent clock phandle for the clock. This is
-	either an oscillator or a pll output.
-- #clock-cells : from common clock binding, shall be set to 0.
-
-Optional properties:
-- fixed-divider : If clocks have a fixed divider value, use this property.
-- clk-gate : For "socfpga-gate-clk", clk-gate contains the gating register
-        and the bit index.
-- div-reg : For "socfpga-gate-clk" and "socfpga-periph-clock", div-reg contains
-	the divider register, bit shift, and width.
-- clk-phase : For the sdmmc_clk, contains the value of the clock phase that controls
-	the SDMMC CIU clock. The first value is the clk_sample(smpsel), and the second
-	value is the cclk_in_drv(drvsel). The clk-phase is used to enable the correct
-	hold/delay times that is needed for the SD/MMC CIU clock. The values of both
-	can be 0-315 degrees, in 45 degree increments.
-- 
2.35.3

