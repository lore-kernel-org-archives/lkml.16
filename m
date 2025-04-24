Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD015695;
	Thu, 24 Apr 2025 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745505836; cv=fail; b=rsrEahmgAN6QfTd/oa7nO1sh35nG4uGxlp/SfdMfXv4yIDOgt1aiwBoc6a03moMm1Enj7rHV/FgyoGg0VNw6Zp6kUXegAu+RFhxFqxqOMhdHdR4y3qwCPEZdYASmgnu88HpxvUjbN2l+YThRz1VnKVE7tOaTooLhwbry2KPKQRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745505836; c=relaxed/simple;
	bh=50qyd7CzUDZN8Q2eOMyEiSbOEE/U0jl5BLDGPPswLHM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Hflb9FcmYWqM/3Hu56alW41HmbYQzh5x5u8BusRwBoGKhTG4uuwdYU7DtiqF3yeeJ3M80sAVWla40n+gtYthQkzf4rXOBuhZmiC+66ezR4Jq1OY0DtlWRUQmAT01cVC3nAbJJjkzRsOHfFlc6Xng+NAgbVnVQYKuMfZMUoLLPpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=vMghe87A; arc=fail smtp.client-ip=40.107.101.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="vMghe87A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8LxUP/Po+KNvKVEGwqEXPL8Tbu5LnGO3AdTudPi8fqW4HBFVL9YgKNJQekAT69vAbMBrZ3F7TAc5QKst7Fz34UAq/Cx5IKjINpPN2iP5nwjZmjUDd8wFZnKBUDlIfh8HavIlNJm7snXaWA+GISH3fRKU4cWuq+O/YuvcUAAwVzNu8r9jHqfJv5hYp5DzV+1g7SvtFqEiBkulj2rV2xH5TG9OEkBVyTv5yHWMAlz6kih1L+20StPhtB/s/0J+OB0aurR8aov5jCUwI6ButDhgFGiukEyfzkbg0GuOrA9cj3rh2M7HgjFArGZ2EM64+hra9HwD2q+Yg6RIF2io4X+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqfSYcFG5J3e9lbRqEYfrv+wqOY+ZjF8JM5VGhMy2VU=;
 b=YdR3rUg9Az7qhkInWpejYitafNB40UYErH6ua2jHju+gXxv3uXVb0a97xRwZ67xmE6bW60QiZ4ZmYWYI9nDQMctuM0bkHWkFlDydbB7Jm/b+mfo0WrQ4N6I2/FWFlfG8ECFuAFHLNvj0t5hSfyYEv+BLbu1e3qcABuoL1DUqzAPflwLTg9eCo2RbgHqRhTV53XO9axw3hBGhZL1Arqyv73idUkpY348xe8Gz7ih6AdQSKbjKaZEsbQ3OIRk8UniiiAiF90xAmvK8KqsbypiO0WpGTWYXKzgXO9qlAGm4KaenPEapM4bIqTMZZPKVnPt0r25UpamGyCO8or8riDDF6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqfSYcFG5J3e9lbRqEYfrv+wqOY+ZjF8JM5VGhMy2VU=;
 b=vMghe87ArfL5I+1wXbGtBCGW5X/Yt1x3OSWKaKVEoZqAbmRDb+5PmrYvaB2lMB5suB5b+fgp+CiZr29DY1eTYqKWQlGMU+HbscaGzLmtvvaxRe2nRWnjnN42AOye9B86BbWNMKISq49n06+UVN3CoUc0uHsUaslvVQQmyP/Bpl2KHfuHZtY7IBKzsypN6I1hZY4PDsNTPqo5Ejnj+8tlT+EvV/jHHT39SzCMexqKMyj9yJ73vw2Rjh9U/DiHqQz1d/IhwR0Egum7wUi5ljzsDSXELAOc46qWBgaU8OfA9aksSuqmEOsRNDYBPlDrNyhlE6Ukj+Y46pqEA/ASpRKHqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by BL1PR03MB6056.namprd03.prod.outlook.com (2603:10b6:208:316::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 14:43:49 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%5]) with mapi id 15.20.8678.023; Thu, 24 Apr 2025
 14:43:49 +0000
From: Matthew Gerlach <matthew.gerlach@altera.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [PATCH v3] dt-bindings: clock: socfpga: convert to yaml
Date: Thu, 24 Apr 2025 07:43:41 -0700
Message-Id: <20250424144341.45828-1-matthew.gerlach@altera.com>
X-Mailer: git-send-email 2.35.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|BL1PR03MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: c1bfae70-e3c4-4a0e-4536-08dd833e6c8f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uUfQ0PoFjtxV1TSQNnyBCHY28SDslggRM1hudatT8xVUFS/nAmIoBcaBkA6r?=
 =?us-ascii?Q?fGb7ZVjsAuVCyPIlqeOneybMNwB2NH5CKxZJhuVLhyV7c5ICiYEjFiWnE1BQ?=
 =?us-ascii?Q?A7yhWHizI/QzvPeGOd9WrtxP22wNTzzthPzBdRqS6d4wgHtCR8BRjT78OCLE?=
 =?us-ascii?Q?giY8iIex/Lu3ODs5H9yy1jIalfwizfDUOPf6//fardiqNNwr9BRDRHcBlxQy?=
 =?us-ascii?Q?j53fvql12Txm6gXnrBTyPsiya4QV25BA6AVT2m88/bDan23BrAWNkYkI3fSW?=
 =?us-ascii?Q?6FyVyshzkqloyT7Z4TS0zTpLKPcZzyNVoK4UHl0khR+T0RXG1hgwkAqOQqKM?=
 =?us-ascii?Q?0dy8qYvZHqNQcJzodZwAPxfndgptlSVqWAEZyAXmchagepNdW4B3Tde7Q36+?=
 =?us-ascii?Q?AqJnjPVW78oh+Is9/S2PP6yHoyVDXRNO9YJPJY9ZqQHmal9EClg5rzbn/I6f?=
 =?us-ascii?Q?qi5rTmNh9sWibLBE25DCHjm+ZKKnPXKSadVOnkjbBmtQfYp2YBIfSuYddHcr?=
 =?us-ascii?Q?9JwY81iYXxghISe1wfU7bSwv8YfQy8W+WIy5OYn9lpLkpti2RZlbOkvqcuB5?=
 =?us-ascii?Q?Aae3QXCvconwSbMZADNLKEP2zrJCEB2R5nIEQjwTjSP+5rL8mgjWhyNRjrSg?=
 =?us-ascii?Q?AwJ7eQT81YlY87V+cubTaG/8hAgKNYUtmHCAJ3Y2pE17U6x8wyL89EAyRlHy?=
 =?us-ascii?Q?0ongbFmARj5BZ2EH0TmQFCxz+ppqxV2Q2p1PKdI7phRoQZbXUAqH2PxyGujj?=
 =?us-ascii?Q?022wZyRLPMr7T6VoTP8VDTNDKPXroF+zqvHTpYxkeVUAYTFyK70SuU9KCLA9?=
 =?us-ascii?Q?hMah0pWS/BmBWI7sXiue/nDJh9gPUFkSWpC4TLA/iW3826IfnNKUHCSt+c4m?=
 =?us-ascii?Q?vzDswN0k7lCQKVagl2JtxujZTE6Rf4IQdEy7zhZjEB8Ri2ItYYmtk640ToVM?=
 =?us-ascii?Q?V1+/bCGgo0uULLmUNnbzIWt7h5CeWiH6Qx7aMfydwf3SqA+ABViX79rjIi95?=
 =?us-ascii?Q?SCx61dDfpZn6e0KS0jUZZyJXbxehPYcIx5ig2fmZdM1FndQddyzgbuvZG7Go?=
 =?us-ascii?Q?py2AJdDbdjk0tt5JxI32k/XfQpoISBVe79FmTAoXeDXKmrU02G3B3MQHWQZ9?=
 =?us-ascii?Q?msljjpy7RZB7wX91QiVEj5D4a4bUWjERzNl7lLoBAvpz9lciE74Kxr4wyYj1?=
 =?us-ascii?Q?JxRYb6VIRiHsrDS5EXcQBg2c2JKS4YZe18vX6gu/4YSIUMY5n7oETCVemR9D?=
 =?us-ascii?Q?uuu1GVzm1YzIglFj/Ea6I36Rn7nsoFsOZJzaCqkBPPi/FEqrFZzR0qk6qMHQ?=
 =?us-ascii?Q?dLOnMUIyiP/pEQI1QYlmsiVJFtLG1Kv/RKcI+eGXd/ulHh6jF9qzJZRqSA4p?=
 =?us-ascii?Q?JhGh/XPJJkLMXtrbbmUv1wrRbPdHqsxP8q/GzqDsViKJ19dUup8HCxrNVw0H?=
 =?us-ascii?Q?Qv0ZirCfllc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3461.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gvP1yOKbs5O8Bxr+bxVzZRu/6mVT5pXs9/8w9AAQu1dKGAmOYoA+DdXB8h9i?=
 =?us-ascii?Q?0VoIIicRi/e2NwiaEmX7OZrmZC5RWImXJdm8LGmk6JCEkfDG4pxoWWn34m1/?=
 =?us-ascii?Q?0n7B9XHR7ftFBYeMGXnxH+tYz0zxycaVNrZSS8LWSuH5Ja8gkLx5FmLTDm0X?=
 =?us-ascii?Q?p33rNTbOHYUpxsVaJmtKWX1xJyzVcm7lyNjx2g9DHUiRR7ZS1s1YZCTYMvpu?=
 =?us-ascii?Q?HizIT0XNEIwLuyk9hCGswF1FcE6IOKtZwAOHGyyWnZVuD2lbFzIG3YmF/b8Q?=
 =?us-ascii?Q?lK2gSClcSylzGV37Y8Q2hkGbXcKTuWvEX8tGtaMvBtiLQy+k3ZS+IDxynIQe?=
 =?us-ascii?Q?fJ+a8Fffp979VY4ZWgcw1RwW17/15EjvrlqzueLZl8NoYrV2dfiWiKhZLOcS?=
 =?us-ascii?Q?My+IwV4lV3kZOIV/4cnFdTZ6FWsHinMTFLYnu5a3WLhjU8WPZ5E2LhGuwpTJ?=
 =?us-ascii?Q?tfy0Al/h22jrwh5g+bTq9PvohCtbP+MvEd5DMeE7ttvQ3Civ4RfIHZou0GiT?=
 =?us-ascii?Q?I7xt1tKxOQMgaJw2IT0fzreRe2D7Zyq7b7id7dvgkrLO56SR+UF1l+lB7hWj?=
 =?us-ascii?Q?9yY/4+rS+1o0FWsgE5ntBC8VWivz7na5UANwacrDNb2xroK+gNHjsNv0cLlK?=
 =?us-ascii?Q?MFse3KpIFnV/W+T6Pisd5IVjKz2GKuqwhSE7eY2kvVeIFN55NeWm6p/QWT7P?=
 =?us-ascii?Q?r59ullCY7/091tbVOlzAwiJy5fYY++T1qgtqDW0Tq/B2+woFgDfPGyLBpxO+?=
 =?us-ascii?Q?3fj97ekQCbg5pAK6k+Rwkgm5Lof4bshGudEeJ1UCEJFwcsevv1nQku7B+ltA?=
 =?us-ascii?Q?UoJRwcKbevDop0LH/RQQbi9098m6LidsCez1lhFkPK/trnrgo555J7A1Dc1A?=
 =?us-ascii?Q?lv03aIt2ktBkzQs/31wCtlUyhvi6BJF17fes2JDa/RHygjPMeK6LVKpDaxpl?=
 =?us-ascii?Q?MxUbqnAF3VNPNYoqKjdxzB2/vOPGo0oC4vgpAWpLywcmeQOyVq/cCE11gIyk?=
 =?us-ascii?Q?0zYSdokanI8dFJVVhnNsn7Pt6muOFeOehwL9w5S1hELcFXKK0igSVfLx9oHh?=
 =?us-ascii?Q?BA3T1YedJGcDQkebpyb8P1VbvJqV8CttXl8C9d4oRxgDRTn+X9ptPCRj3KtT?=
 =?us-ascii?Q?9rB2YUwRaNVoQ+bAo29jSFPoQkR4FlHEikJ4kWMxT5Pm6pO+rnOLXtoxYoDo?=
 =?us-ascii?Q?Xr6uCs0fEni6Yx663osbiM3LaoCMldretoTHajAYok35lKqn5JyVs2Cafvb6?=
 =?us-ascii?Q?oBvij+0NK3NFyKc3ha3zuB1Tgj0dULhX8EnksEmT6sxfXQ5+46Prwp/VVOnb?=
 =?us-ascii?Q?58QaoyD4k8zmb4ojkd4qwiNnHA2iKEcMoOm4NnGrqMmEORuYyto4eXiZYWsV?=
 =?us-ascii?Q?cZZlpAoJVwmDVVkL80/GCP3w1B6F/9uhoSALc5Vy+OUJvwpCo/J+j8Lt5KpS?=
 =?us-ascii?Q?rKc0KYwPvOlNsBFPMOaVJTO9WHQjf7TEolaVhQ+3puKTBeuIRf0qDzSyPIbG?=
 =?us-ascii?Q?Xax896S/RB1XgBZIxOQAB37TSK9IjjpikhGj+bF1lG0+HquVZNBq9Cl/IrTi?=
 =?us-ascii?Q?G0bvI3DodRzK6lLP8Tb4j2SsLIcqtPINQGjivKS2p6yI4gq2+8P7ykyFG1KN?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bfae70-e3c4-4a0e-4536-08dd833e6c8f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 14:43:49.2364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r61DwBGe2iufkS3bPC+rKC3o2lUu6XyoaYONXAE8GDo+5wL5JTCfPuxWqfVURc7rbj3H4M4oYAv6IYBIl6KQq+gp7nbPq3qNudNiXx+w/6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6056

Convert the clock device tree bindings to yaml for the Altera SoCFPGA
Cyclone5, Arria5, and Arria10 chip families. Since the clock nodes are
subnodes to Altera SOCFPGA Clock Manager, the yaml was added to
socfpga-clk-manager.yaml.

Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
v3:
 - Add a properties level to $defs to improve reuse.

v2:
 - Fix node name regexs.
 - Remove redundant type for clocks.
 - Put repeated properties under '$defs'.
 - Move reg property after compatible.
---
 .../arm/altera/socfpga-clk-manager.yaml       | 102 +++++++++++++++++-
 .../bindings/clock/altr_socfpga.txt           |  30 ------
 2 files changed, 101 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/altr_socfpga.txt

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
index 572381306681..a758f4bb2bb3 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
@@ -9,20 +9,120 @@ title: Altera SOCFPGA Clock Manager
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
+      "^[a-z0-9,_]+(clk|pll|clk_gate|clk_divided)(@[a-f0-9]+)?$":
+        type: object
+        $ref: '#/$defs/clock-props'
+        unevaluatedProperties: false
+
+        properties:
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
+            description: one or more phandles to input clock
+            minItems: 1
+            maxItems: 5
+
+          "#address-cells":
+            const: 1
+
+          "#size-cells":
+            const: 0
+
+        patternProperties:
+          "^[a-z0-9,_]+(clk|pll)(@[a-f0-9]+)?$":
+            type: object
+            $ref: '#/$defs/clock-props'
+            unevaluatedProperties: false
+
+            properties:
+              compatible:
+                enum:
+                  - altr,socfpga-perip-clk
+                  - altr,socfpga-gate-clk
+                  - altr,socfpga-a10-perip-clk
+                  - altr,socfpga-a10-gate-clk
+
+              clocks:
+                description: one or more phandles to input clock
+                minItems: 1
+                maxItems: 4
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
 
+$defs:
+  clock-props:
+    properties:
+      reg:
+        maxItems: 1
+
+      "#clock-cells":
+        const: 0
+
+      clk-gate:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - description: gating register offset
+          - description: bit index
+
+      div-reg:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        items:
+          - description: divider register offset
+          - description: bit shift
+          - description: bit width
+
+      fixed-divider:
+        $ref: /schemas/types.yaml#/definitions/uint32
+
 examples:
   - |
     clkmgr@ffd04000 {
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

