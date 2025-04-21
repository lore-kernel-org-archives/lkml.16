Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B51262815;
	Mon, 21 Apr 2025 11:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233432; cv=fail; b=CkxSuogjT+JZq3dHHpM91YkW/0FSB2ej4ASmDVn/P3/3AsOcpSwuCkctjCvAzAM1OK6Kq/eJGA9duFugtF0KcPUcNM7GQKEhib4P+G4U2uOBbzGk9ci5HQWmAvQJv1wd/qAOEwvo4yBZA+yoXdH9wyaGnrPFq0hlVekJTR2OTEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233432; c=relaxed/simple;
	bh=A8vNnbM0gonFKEljQ8yVsrO8u+2eV6OaLaVNJYkyWBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TA9fEDfcU4KwoAqMv8lxVuTseUzcjeQ60DmPLNIwJf/Qi8roOBtUh98bDMEj+IC2evgHOWR9ljXePczDhumaCdqYGe/Xg7tsKoudNLHNA3DcdEiARO6wAHGqkWq8wtRaZGZ1dlaEBGAi2OK8fXHXn7Pd5t4CuMnE6VnglYGtN5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cbE2VeNT; arc=fail smtp.client-ip=40.107.162.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cbE2VeNT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8tw39QjkzqOdKe7TVr94At3BW/9KnO06dN9JkFYZwa3JUFo/MJV6eCao4RgKajZUS8GUlGCW8QxfzP/hVFl34OpeQEHnIzUcJQavM8XrYPWPpcDqWoMzHqQhUW+K35hJqHBFuQLyowaw9PISsf103QHhVIcXeZ5a82U/ciUHu2dTi4MsgJFTVQ7DSCG1pWtSNQJ41dlvG2Ybjp99D2er8rKMifmnR66ZlZRyA12jLHb7jERzAuG4kzxVhakCbM998jn4gjaFrTRiMEJbnRH50+tX0mFVzVxN/Xof1f2ssKhdWQWsY2JGl753WckpQvp4HLTX527VEt/kSMgCYZCmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZX30cQLmYvHan0zKZK/DMfYwWRx7oupUjMJTbQunr0=;
 b=WrDNTlrrzigwyKSXM8ZPQpCgro9oKhbmOCvgdJVynMT1Yw8eN5sNxSquaTbhtvMx0pQjtTO7OTYMLcWX7r0MNrgVmTVIMct/9vLVqDal4yCSKPJkoNMNFPy02sdjVqDo+oXBsXf/WuGTgItzC6sKD9Sc+TNgShT49NCMBjBhqXwfeORDcvkF5REoTKghwDHLMwftelSbCYBCKSzdpIfAbiHMjPwSNZd+gVFhuRzHG8bYMkKBU1PqByfXt+SjMQbY5/tHRnxKS5BeT41jf45yq1E80QeikeueeERW7WnhLxACOp46gMadfWYu57/LHDNWYzy1c69hcw5incN8pTr/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZX30cQLmYvHan0zKZK/DMfYwWRx7oupUjMJTbQunr0=;
 b=cbE2VeNTIH9qRfXBPMNbfVLlkQ1tXMbg3DLRIAx9BNk8gFt832cI4tT7g8lEuO6/jSAxRL8MTyOrnTLHRGUAXx3fpZpNiTWPKycBHv4upNzndGkPRFXiqr+MRXx/lje9h9A2pzVwK0koCUjS2w7B9kJGUQnmzAjJ/xe5/KgVu+iq6RwfdbFkcyZ3kH2IXm2ZTZSpmnz87E8ki52CUPsl5uc6uawrJTYgmUQy6w/IX+BdQ0kkavAh5H2ybShviFANGuQ6+Af9QqJ/sVO6Q4D69Ws+jUdiiIG7D+PqMCCYHVULGi2+zFX6h/u3FPRhJYQheq/qr8foGeX3RsemmMcosQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB7854.eurprd04.prod.outlook.com
 (2603:10a6:102:c2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 11:03:47 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 11:03:47 +0000
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
Subject: [PATCH V2 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
Date: Mon, 21 Apr 2025 19:15:11 +0800
Message-Id: <20250421111513.2651797-2-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421111513.2651797-1-carlos.song@nxp.com>
References: <20250421111513.2651797-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB7854:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6b25fb-c101-4e92-db7f-08dd80c430b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gA7zhLSUcvPvPqOERYUjAxe8ByTO/wMTEYyS7byUYtvW+pv9Y8X0wWMMhKOO?=
 =?us-ascii?Q?bVzaOVFC/FEKlsAxC8c187MzbyenecHexcGcUZM+EmoomK5DcKNeKOjtZ0OS?=
 =?us-ascii?Q?gZK2618kX9ZupDXq+EmBudroVxLG2aGW2olojSpphgXLkC9DywDKo9ZSQhvt?=
 =?us-ascii?Q?caA+7b+fkl6Zl1rXou3ezc1tosLg+qU2+v+9b3+0HFIzaa1M4vbZty2ukHGq?=
 =?us-ascii?Q?mPLoWcYwsIeQDjM1V6A07nGnkWCT9qbte11BdnZkrHywHa0DbOdWmYMBIWQd?=
 =?us-ascii?Q?bGfShZdR4xs3RmXxRxES5xwVsQXT8dn8bxTTEcr3529nta2b9mqmREcrw1Q7?=
 =?us-ascii?Q?UlCpc69WAK6R+yQwp63Y/E8vagRkymAIqC7JTV2d3/5zorExyFGwKWOYLns/?=
 =?us-ascii?Q?/nNfXPkK+P0TC+zzOo9rm8i0dC/wSTbPqbdxH184kej+fC9+J6yyH/TdRk3y?=
 =?us-ascii?Q?hItP7MTj7l7ELQDmnwMMLtFijcOdlJCh4C9Gxdym4B/OgOyrXPeZ2rrEPmT3?=
 =?us-ascii?Q?XcMizJuDCwRyTj6Uy7Mqll2mNUGYLnkHcZAjPA9CK7GCz4kIEhQ2pVJ/5doY?=
 =?us-ascii?Q?8UIwCjmuIiNsZN0pt7Pt88yy//4snUxjIKRPkjUkbxeQDcculzv3m9zC3KZH?=
 =?us-ascii?Q?U6oGEuyMd7Me4EKEzS0TY8/ThwZBibYgcmdsaUSpWuhOITUEN++I04SSnIQy?=
 =?us-ascii?Q?gb3R6CzV3juXUEey0QP02eWXh+jPy+aEC4WFNSPOkwycK9LukkB1upTNmqy9?=
 =?us-ascii?Q?Iw9EZfF0GCPkG3mO6X6d0NlIZ3nPvmg2Chm5H7EIh6ilijXxQhFPQRul84u1?=
 =?us-ascii?Q?S6ERCil9cmQDmWRkXfLEpiesWoc78VQLIXZ0n9cRhuVm9i+Bp8XQEQEJfI8X?=
 =?us-ascii?Q?q7+j7I8/GTvzYyJckCy4eQmbnyBTsy/wAG3Vk857wZEXeoPwq2cPjZiOoTGx?=
 =?us-ascii?Q?Od/0pT0DMqv5/gpKFu2vWeEAehD4ApkC53y29rWYLD0yDQEG5G6pZh1c4zfK?=
 =?us-ascii?Q?YOEJscCeDS73m2HRXCRvPpAoffx6M9R2bQtXoeFb2ak4W3XJINFvIHFCkEbA?=
 =?us-ascii?Q?N0A5vaTv4nPgKXcYefi7vWveo8vvY864mPyy7Fzg6OFK0QCT0K5eQIVnNHt9?=
 =?us-ascii?Q?+E+UesPiTaaV46Y8P+wbP5r1VjR7D9y3AwFz16AerCr9aVw1SpDJjOoBcnvC?=
 =?us-ascii?Q?16xGYcB2JeaB022/+u5D+RE+/Ft1vpDzBVecKUeH3m+YM9OVBdToZqMwk5xW?=
 =?us-ascii?Q?gxtCTo49fYY6nHCKwEUxt6lJvf4IPBJQfLms73EKMlTERMo03nIWlzPqZH0R?=
 =?us-ascii?Q?4kRrkhO83L8CwEaI9hzt5Xrtd5+GyRrsgurKqNXRZIwqhjv16A7OL21xCzJ6?=
 =?us-ascii?Q?vGEOfPfYDmmUttEzJSZvKApLIHDW/tsNVxsCTnwaZHxqnHvSltDt+IUHYtzo?=
 =?us-ascii?Q?QDeOYghK+5vidyiia5/RMMMsf8S81Gjxby3z+Zr5U4+poXRk6ppl9d6uD9k2?=
 =?us-ascii?Q?RJU7N9Jj9R2QvRo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RjBYZYvApvrJW6kSvoXdVe7MTz+yrtaiMl/++alrcZgOa48491WjSmaH+rHF?=
 =?us-ascii?Q?+vxqArJuY18EhpNt9PL7e2GTSJYfbRKFT99aqRi5I/pJ660ZYMbGQMLX/zJ3?=
 =?us-ascii?Q?+iSn0PuAqUuwWMy5YaNL06EsG/YCCtZG2/Y01dTKEuX/cqftnMo0fpk6vQhY?=
 =?us-ascii?Q?jATMECp/+TFuEZ7ITJufMwd50HB1653bIGseg/EgRHmV4S3pyVB5+cgfDCU4?=
 =?us-ascii?Q?Psg2AD/QybLdOv6PRQbpNu0bhdraCDSZBgYgzUullYKK1pnUfvuGgAyjCToP?=
 =?us-ascii?Q?Gr6YFDCw0vD/zvqgCJS0aSxMH/UK3wIURpeGZ3Y+8fWl/JvrE5UpLZTyEE9c?=
 =?us-ascii?Q?O6dBxGacXXQRkaukES/PwO1T0fB3m6zZKUAyPgasOCfIZWjP/Eg6f7/U1dM+?=
 =?us-ascii?Q?Gi1CNYCbvJxJZ4pY4gwTKkGZwObxRUT2/4Ud+RZ9ipbQ+tFvKE/rQRHyJ6N/?=
 =?us-ascii?Q?03s6IE/a3syNGR8fLTtHkl6EmzXTCqOe1uyryI3D9o42fjZtfqJ/+LqrozPE?=
 =?us-ascii?Q?NQKFGNjXJ1ho4W/2ppYUWq4dQbYcttPnLHKEjyBAdS5cMgSk2L7xUFUSWV5O?=
 =?us-ascii?Q?ILMxEjqZCv4MTnwW800odA4Ebsbz5G4XiPaHiJJYrsGqLt0S1xWVCdyPAdNi?=
 =?us-ascii?Q?h/EZonEx1y+QH8R+nTocPJ0kV0m83cOPIIPEN+1bF+m4yUmEDxInVQnBKe8e?=
 =?us-ascii?Q?3GSHmGZNYJ9Xb8ssfTTiyaXJqxouayKkbPD/X91LwHL4PTVskFaX6Fkzu1YH?=
 =?us-ascii?Q?ze/lk2cFZqWi3tkmZoPQIC031aDtjfe1kwsv8VCxokvuP6cPPY0G4cJaDOOB?=
 =?us-ascii?Q?klQKjvD7ptK3VRJDisIwR2WOnHkeJDygEcSDUVwHVkLXl57xM4LT++Jj8yes?=
 =?us-ascii?Q?W4eE9KrhuQxz71YgtiOITUQLmOTwN1v4agszk5+d1S8IL/u4eYyhUv8HMFBT?=
 =?us-ascii?Q?YchK/9zC8s9yg2VE25ahPM0XxxgkImZbxSey7JBwRKwnzrTQ4FMHBtuB14Xp?=
 =?us-ascii?Q?/OFYO2zrellDgpdoe8dsw9XhJuBPXg5nsIr2r+U58/tc12COvKrK11EHNxHC?=
 =?us-ascii?Q?FIFlAafoeLsO7AZ7At/CFIn/DYagybpPVzc7+mfKt9Bf/5WQm136lIBQBwur?=
 =?us-ascii?Q?rik9yyXbFNuj5OxOtY8QZKiuWrUEcgMjoZwdsuNtkdGOSDcKnpvP2FRLhiLn?=
 =?us-ascii?Q?5Rv7e1BEtKsfROtrW1snVOgh90RMtJNtOKCYc8n8h5riPAzTHK7wASCxoPyF?=
 =?us-ascii?Q?6kB6UzRiFyV47dTBHXAJ6g6glKUaqfVZy5IhfdeVaQ9vSQJSVsJ/MEjDZM5l?=
 =?us-ascii?Q?akCYZinng/xDr61/kLVDob0ew8oio5sGeDKtkqnfu0mxXCzlM37lRzi3Mw5D?=
 =?us-ascii?Q?89imWKDES52C7n3FVp28tlyoH214OoL1WRV3jHjHIk4sdM/cdvVLU+pSXEzz?=
 =?us-ascii?Q?THM1kj9Kz0eDhUx17hGzp16odeITWWqj++vzvWENSXly5pvX3OPoV8LF/dUr?=
 =?us-ascii?Q?JVCfmdNk9fAtOsK2AOycjESisA5Ob+dDlCyoM0eDxYvGa9T8cUVdapiR3p5m?=
 =?us-ascii?Q?Qo3JG300uLgc5qZXGiBKS0bBkgApCs4bA7Q9gqFB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6b25fb-c101-4e92-db7f-08dd80c430b8
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 11:03:47.8144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfZD3yPELbL2rY6KvLv7wqWZUoMfJp9PBAYnIqTmEjbHcOBXWwrf1wnuyRVZKZKjymfDUpVXTdeo1CWG/vs8LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7854

From: Carlos Song <carlos.song@nxp.com>

Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".

Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
three clocks. So add restrictions for clock and clock-names properties
for different Socs.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
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

