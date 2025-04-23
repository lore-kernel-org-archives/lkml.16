Received: from SJ2PR03CU002.outbound.protection.outlook.com (mail-westusazon11013002.outbound.protection.outlook.com [52.101.44.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4084288C8E;
	Wed, 23 Apr 2025 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.44.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420610; cv=fail; b=XSxCZ7TOllolrTC9yib8Aqzmu7DTYRc+WFiaXFeecSkIr+b7FXRuKHvCy+1aN7szRftazrOhu5RZfATVdhQjR82SJv5lvUc9J3h2hV7Kp7pdseAvG0wr/Z+XRhrKQZfREYHrDrgtL9ZCeBhgpDHc07y2RaCTQrXyH9zt+FQPJcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420610; c=relaxed/simple;
	bh=1cqbxX1TUVYQKVQZAdnmko3SJ0/KxWPdJkIfSefmhUs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iwcoDpcgNCYjIwYlVnZ+DX99N9UzgqzqI31SzgUa9AlT7/08qyQlyi0tlS52IKUySmhxEo6uVSzKCFFIF6FxVYM8MQ1pxrted8xXbX8U5ls0WFQEGmkrY9+9fz+Ks154pKN3jg973jqvGw0XLOiUqBQVI27vGrmVqx5cM8PWcig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=wDQhKn7m; arc=fail smtp.client-ip=52.101.44.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="wDQhKn7m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjM9b3U177d6tIonKUpW/MfhSA+PIzPiyYdzDlyQjS0FXcBK58iNk/6BCQ+EetVnHC3ko1HCZV/v2VjTo4W7zq7cEMsvd9JhoiZeB46IP5RuEaaQuLKQlGwj3yZq9jSq+dYf/iSz2krG2uXxWtqsoEHvIUJukEYrKoSb40TNECGs+ZyrsnckT5JEldXe9AZ2PYpd+irl9Q05B7d38EXaIU8G9dbY11ftfB2WM2GkiJPNZDIGErtN0sk3Y6RcZ3pdMudrtT6emgmMUcFRZk5uw2l5BK0/7bOzYiwLSu6vrtXvhU3nLElNc0AFySDw2ZktsTOttD0AGy3BjeuATTvLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfoN5NighFND4Djg0B9Y5ixwVO/fTLBLCMoDqBY4GQ4=;
 b=DVB9WlfO3nervPtJX42RZ3XSLEUYVylQTJNkQFNLXxjfZny5AAW/WEP9Z6XIe/nnoR30N0CidQc3cDdKc8CkX7gF4ek3cJzoFhfnfAmrq8e+rWVHR1qsLZzmoWRWfx/C6yBecK2UQ+/U6tQArpt4zKVQfXTUx7q9m9e6t6GkPs0NjoVlphT1EZl4tji00oYdFuv3FKf8abU1YNANtCta1i4TGRsEaRONPpWNmLbsXJSW1O92ljCBRtytFxkn2lf+rj/OxWyL2Sc0pz+UMR15n2XE2DLviDtCF3PWSNxutxgMuPk28UN5TiqP6+346chr0lz7wwdU0pC1NdapIpEozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfoN5NighFND4Djg0B9Y5ixwVO/fTLBLCMoDqBY4GQ4=;
 b=wDQhKn7mkLNLHgzAUKA8uUykE+Qsk5Xy4Ki6cce26xVzgrPnFDEAzaa0rRHx4SaGxjjndjdLPAG9vppI0jhi0zThGKUMdsIJ4JRftxSN97WRdMKAtM1mjRSA5dz1ePXQDSfeyhJy9F79K47NWzbtEaYHusQBOudvNTX4z8TJ+m5XP6ypUSwXy47A09PHVat/swFXYV2p4gy+5/IBgaNXe4rgot3INnF+DxLenf78OtbiZZOJA1N1ig7QUTrlUjFpDkekjL3WNipFX/JYUN+w4I3xmnLMdIm48J4nbYj5CQDm/7pJV/DXT2EN7ZRl0hfHvGpUWIJi5A316gPT+fvPVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SN6PR03MB3471.namprd03.prod.outlook.com (2603:10b6:805:45::21)
 by SJ0PR03MB6647.namprd03.prod.outlook.com (2603:10b6:a03:38b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 15:03:23 +0000
Received: from SN6PR03MB3471.namprd03.prod.outlook.com
 ([fe80::cc6d:d13:da28:d505]) by SN6PR03MB3471.namprd03.prod.outlook.com
 ([fe80::cc6d:d13:da28:d505%6]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 15:03:23 +0000
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
Subject: [PATCH v2] dt-bindings: clock: socfpga: convert to yaml
Date: Wed, 23 Apr 2025 08:03:18 -0700
Message-Id: <20250423150318.27101-1-matthew.gerlach@altera.com>
X-Mailer: git-send-email 2.35.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0105.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::46) To SN6PR03MB3471.namprd03.prod.outlook.com
 (2603:10b6:805:45::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR03MB3471:EE_|SJ0PR03MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 96dd5cd0-97b2-49ac-f338-08dd8277fdcb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iKusRCfNl1QlUvMIIp7VObQXy4fFAzFUcOs3oQfK8MxejhEUHk/3GpDuBaSJ?=
 =?us-ascii?Q?lw9EoUQxfOB6NeQgzqs3KOfwB3fDxZG1eIutN9m79RhFMEZdQLEutKu8xBMj?=
 =?us-ascii?Q?iUI+fARWMXkmmwZwsW6joVNy31l5cx6zJYXVqGqjB5yRYkQAR7cx3FdoHlfl?=
 =?us-ascii?Q?pKQQsPYNjb0kpypjuQzWp325foWqEbsgjkoPk5K48liHm2Ha4bQNbeA3qmbK?=
 =?us-ascii?Q?vX446U6SO4lUcgkthG1Jmfi1CFyDJYwkIu5N0f2oZulCj0jOvY3/cL+1rSlq?=
 =?us-ascii?Q?MfCU3f0BzKjtGz2ZjWzCLnjw44W+/Az9iOS5iOTjcyrC34bacLwtqdjqj6Xl?=
 =?us-ascii?Q?2k1qXBtF2YdxwrwQ0dlaV7FULGtZjOKBtZ/2I5j0hU0bLQMYSuOm6AsGrkXm?=
 =?us-ascii?Q?ISrX9Wb3E74B2QfLMOwbBCYYIMVtovGyPepHeRZGl+0Ghs2BTHgAEbTWr+CB?=
 =?us-ascii?Q?a3Unzq/QUKjB5YqLHzYIrhoBj47RmD4mk0B15ogHXjER4k5SxETXj0kLX1bq?=
 =?us-ascii?Q?5HEaq0Q6eC3lxuMUST3Eh14JyehfKY+bhTg6ec4Tva65xM1eXvTux1Fxue/R?=
 =?us-ascii?Q?GQs/rQg8IEEzfQ33YT75534S5etf35ZipU987xEZSgIMcU8qOF9l5gkZH0A9?=
 =?us-ascii?Q?EuIHELh6UfczF8f5/GUn447Bnk1YxSVW0Y/bqEN1S320NuEZpSGxZU+l4+Tq?=
 =?us-ascii?Q?2s8gjbtTJgsB4/PEpw6596mcZfIY5wXhJ8nrGRJvEo9DaU8oqD4x6ut9wFxg?=
 =?us-ascii?Q?tl32eNFbHR0tkKXnCU4Z0pLfwLMJw9M7GdhbqpiYxHLUa+Oa93lAXAN7liCG?=
 =?us-ascii?Q?8vmGUqX1und+aR2yVJ+XtRwnVdBsyMjkgtvyAmn6IXPTrIRvC7SWi1CD9yef?=
 =?us-ascii?Q?918YoziabSBCNaEt5ccPR4YK8NtPI8iVjj2mrTtvSEDLB8H4IUDOdQlQlQiq?=
 =?us-ascii?Q?Qsl6r7AhuIc2nH6FjKPPkc9j2d8gqGNiWPPNvWzEx5aWlPoWVrG0SxKerOSQ?=
 =?us-ascii?Q?9d7a+yv6tS+VcPuFlioiJfUp4GcHyMbKh8SPkZ8WZcVUzMYSzQSDq1REzqy+?=
 =?us-ascii?Q?eYAlG3yPiSWIRmHVk2i/5c17kemPRoba9TOWlAoHLrk6llRUEF2ryHX0hPJu?=
 =?us-ascii?Q?xB9pnp0f6YsGB1jzyaDUSTfTgHBO6US5K0qektPuOVqxgQ5T4iyoYZmSnpjF?=
 =?us-ascii?Q?GbC2lUs4XrEzPIBdZqyVCcKTvsKfUT73rzhWCZtCt8imt/9GPfy3EsRC3QvE?=
 =?us-ascii?Q?W3uXXauWtb/nQXCSbt8sKfiseZ5bKFsTgsgtZPqbweCHVnTVva76qW/jGrlT?=
 =?us-ascii?Q?DMJSCZKm15w0iNw6k/9rJ09G8QnFWl5cGnNKzy1df82NxFzCocHQWDm+yp4W?=
 =?us-ascii?Q?KkItlykB40BTGjKV9Qax/KlVicQKjVgQKm9qFMf57izJGj5g+OBPQ94aCV8y?=
 =?us-ascii?Q?KWAXPrBFDJY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3471.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HrVEMIdRRq9mFo+hZHBV/3bmbdD2Rtc/GQgekJTcXV00Sg/opZbA05YNsAKS?=
 =?us-ascii?Q?3kVCly7xqYl2kmzglDZCPUzetT4zibJg9jtApiersr5whxE8KdzrSsUV4cV4?=
 =?us-ascii?Q?wljwqtJLmSsuF2LvgVc9YR+/qp/tMop9BGkXdht6BLJxUG7wKDpTHeEwpbRJ?=
 =?us-ascii?Q?EXYXNsT/BamOeWKPM3gOv4nAfhBpl9SEOEyyVjqHzTrIf1c5vG5rm+D+34Cw?=
 =?us-ascii?Q?oau3P+hJvdRy4t5CsU3XPtR25xdGdtNoD4dWGgx+U/AyCaOUbTUahIVdf4wm?=
 =?us-ascii?Q?LOPrhNKsp+PknZMBeQV9ax26CpRDDMFBsMuAKPdnZ2no5zVJLxFFLIJRNL8D?=
 =?us-ascii?Q?KJ7DFyhJAUXYRt/Qmfy1U8WrtvlrNXnlYMgMDuZfBNrFDOP40exdDJeNoDek?=
 =?us-ascii?Q?B8fJH4gJ1JQEeTUaaTotBaSDOSSDAD8litM+dpct+gIaauEhZ+Qvk/3YcMnQ?=
 =?us-ascii?Q?v/UZWzea/yKqrMPkXM4oD1iH5hJ/v41B2PJC8BbaIkTCIzDRzLvxAu9xYxnd?=
 =?us-ascii?Q?/bNIXYJaoa09k2Y3sLbIzeRUmAyod6ek1dr8nI3yXgENFQ8LsD+Ri9uF3JEl?=
 =?us-ascii?Q?5L8m+LyU+9IXLI7MjalHeU+aZMXBIS3RZbnEu/p/ZYvz3ZFEgZMuouAw+me5?=
 =?us-ascii?Q?39WV6qMq8zs40hPiwFoz/wbYa5WP1bij8jSaDndYo8i/ADnfLqGLAwRDaZF1?=
 =?us-ascii?Q?vkSF8kCUOU2fLEsgCO6I954UrL5KY0QifBOJFxESn5LwfWwVe9sNx8zoLjGQ?=
 =?us-ascii?Q?HrcyGw9FMD745aJ2eidNaFc96JZdmhft4QkEjkF2ZU0FDBkTNWR3JTXkSRy0?=
 =?us-ascii?Q?WRhMEZXBoTOLSPptT9gim3lvues3T35EeFIkXBNW0auggjPOwwYz4J1OEWnx?=
 =?us-ascii?Q?QrF3i5QyzXpcaZZ3Us9xZ8xNngmbZyRJ1NfxEYu6bT0GDO2Xwq1JllqWHaYw?=
 =?us-ascii?Q?W0g/uwT09Q18Le5rZ4J9QJ1puiwYsNy84rKy6Fhke9aARdcHQUhZMdxRsSo4?=
 =?us-ascii?Q?3EQ/Upw2ak5tor92FGRRcL66MXTnZckDCsS1D0fTE6V1eX4yXAx6AcHCK8Yl?=
 =?us-ascii?Q?xoWXD576KZEFcPPOHED7bVVRXI79n3WGgCkabRc8Mn66lfM0QejptKybfsDu?=
 =?us-ascii?Q?0XIJ/xqMkf5aRaH5GKmBBK5cB3GeeoNtSZdlA4NH94+5a76bM2nNQG4XdiOP?=
 =?us-ascii?Q?ntlbNf0VKljztVisASATR7NvN0mB1wNxoJJjJ93ir/8l0O0j/vwpoGYV2PEV?=
 =?us-ascii?Q?Bu8NKRnXiMg/LbuFOt+K4IrvtOTyZnb6OLBU6l2OhzEGhovBIGHYdS+ZwFfZ?=
 =?us-ascii?Q?w3+LXKlnUcG0swQMpMUOp8K7OC76JQOjq5EHSLgWddG5f5sAuQRcJs74rVTm?=
 =?us-ascii?Q?KMWDbSWcpwKbQ1UzA5pUME8ZPPmzVTYW8AWbuqpzXt36E2eOc5s5gELZmnv6?=
 =?us-ascii?Q?wVwT5ySEtIyDbt10vOK+5IFDQYfw5uFXcU37TrGk8872HV4NjPIJJJrOp1Aa?=
 =?us-ascii?Q?OvtQPjR2YTjhZNzJJdL1ApAAIvwnsc16E45QkS2Fv8C+Tiz/apM2NrSzMvC8?=
 =?us-ascii?Q?w5Uq0By3XcBQrEwT+q/sEOIha1nab18BKSU6GlzCXePLIDKXjB8j3ZLhKwY8?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dd5cd0-97b2-49ac-f338-08dd8277fdcb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3471.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 15:03:22.9382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lt5xuTreh44ftoe0cjj+RF1Dz8IUmA4J64Pz2gjGDnp1QWiOu3XGod6camvBmS1MjH1RMCD8MSZmTdrHBv8QEzLqr0jBtQ/JEVwgccknsb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6647

Convert the clock device tree bindings to yaml for the Altera SoCFPGA
Cyclone5, Arria5, and Arria10 chip families. Since the clock nodes are
subnodes to Altera SOCFPGA Clock Manager, the yaml was added to
socfpga-clk-manager.yaml.

Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
v2:
 - Fix node name regexs.
 - Remove redundant type for clocks.
 - Put repeated properties under '$defs'.
 - Move reg property after compatible.
---
 .../arm/altera/socfpga-clk-manager.yaml       | 129 +++++++++++++++++-
 .../bindings/clock/altr_socfpga.txt           |  30 ----
 2 files changed, 128 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/altr_socfpga.txt

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
index 572381306681..6f09458f22a4 100644
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
@@ -9,20 +9,147 @@ title: Altera SOCFPGA Clock Manager
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
+          reg:
+            maxItems: 1
+
+          clocks:
+            description: one or more phandles to input clock
+            minItems: 1
+            maxItems: 5
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
+            $ref: '#/$defs/clk-gate'
+            unevaluatedProperties: false
+
+          div-reg:
+            $ref: '#/$defs/div-reg'
+            unevaluatedProperties: false
+
+          fixed-divider:
+            $ref: '#/$defs/fixed-divider'
+            unevaluatedProperties: false
+
+        patternProperties:
+          "^[a-z0-9,_]+(clk|pll)(@[a-f0-9]+)?$":
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
+              reg:
+                maxItems: 1
+
+              "#clock-cells":
+                const: 0
+
+              clocks:
+                description: one or more phandles to input clock
+                minItems: 1
+                maxItems: 4
+
+              clk-gate:
+                $ref: '#/$defs/clk-gate'
+                unevaluatedProperties: false
+
+              div-reg:
+                $ref: '#/$defs/div-reg'
+                unevaluatedProperties: false
+
+              fixed-divider:
+                $ref: '#/$defs/fixed-divider'
+                unevaluatedProperties: false
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
+  clk-gate:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: gating register offset
+      - description: bit index
+
+  div-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: divider register offset
+      - description: bit shift
+      - description: bit width
+
+  fixed-divider:
+    $ref: /schemas/types.yaml#/definitions/uint32
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

