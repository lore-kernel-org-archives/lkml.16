Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022089.outbound.protection.outlook.com [40.107.75.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18926FD80;
	Fri,  9 May 2025 07:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774763; cv=fail; b=FfoXpNSlW/ychihsYlrUKcMP3LjK85wqx2+U89HaQk6om9Y5kogDaWcm3Ji/M95NnTIF5Rt2C0hdIOVkkAI+alIKE/tthZFqTAuFMfIt+RzaqHsSBgW8Q78JYiWqn0gAz+zoA5AA+fpMY5wDN9DawLrrQuYZylDEfTmhG5rN0lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774763; c=relaxed/simple;
	bh=8ze0n7fx3kaFhUbDfJ5A6RmabwElvcaM9msB6sBG5Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Wslqpfbd1dPj2ZiQgJY3IlAUJIrSE0+4ZfAKtHClXYGUjhEFZEhxcLRqYUBa61bG6bB8cRhiyxS/q0OzDsyrAylqwJjAT7n1ulIRUUv019r7/PGe59FR6ckTHYgJQeIeH8Ko2EkKwMzPLkExoo/Q9kq5DJ6FWi+JkhCq5/G+4Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=technexion.com; spf=pass smtp.mailfrom=technexion.com; dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b=H54SZG9e; arc=fail smtp.client-ip=40.107.75.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=technexion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=technexion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b="H54SZG9e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ved1WHOJykHwlN2Zo89vBf0oD9rWg69e+LP/LIMRejaL8nOlvk/AORr/lLDaSnMoEso1lN3r/wM7Z1XUQl+jvZugcZaWtwVJ0RQ7A84tLBpvk1dffz+Q9hBPSxjfFZfkRCP6HqLLpGoPug0neZUrnfCW7WjyeOPF2Z+v+KvrAY7qvJjQi/5H3uf0ociv0uVaKGbI+eglgjCA9vvgSOegB/fa/oEPFEXcYhV2mW9hjsvNKn2bvicNFv6rkCviha802bPq7pYKoX0RQQXryeshXtp/pRvc0OsujpJFlFZvJrSafYTB1bh+jjbsiUyb54/reipYAXC7w24CFsyjaAv6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiJTcMMwinBMQTDfCJDBJCoZDrHG7/QN18P26txZKZY=;
 b=eQxHamXk3AFq0C7syjkr/RcGqrbC8IG4Kxb5RPC8oiD9aVB9X/t0lJnbBFJzvXfObr6hlV56jniC9RUAVU7nAPaMla96xDZUTWMQml7HFcR9HMsNMhkLG/Vy0irsVd0A9WjlsqSzm6x0nqahVKkfHtHc99movuFP/dYIs60M8ShbSD3aoQfRp5cw5GwIKaA+HKQ5fbkDIJmN31ht/6uSGyNMq2OTMr8o1VUsR1jMRHKVFkcSu4YUrjwht4U8yUXTkgFdhcZ91GBNvj6y63fk/oRse6EB+RcAIkcaAf9IFvx+1GA8stTpfV5/fMggCAayG3s13q6a4f9PHy4mnKBwWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=technexion.com; dmarc=pass action=none
 header.from=technexion.com; dkim=pass header.d=technexion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technexion.onmicrosoft.com; s=selector2-technexion-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiJTcMMwinBMQTDfCJDBJCoZDrHG7/QN18P26txZKZY=;
 b=H54SZG9eXI6UrkSDY1nfakWzkVguIypYdB5f5XY3upWeY/TdATpQhimwd5adk2wWBec4rGwSsixokmLNAWW1rEgQG98k+KJeb2KwBO6qbIdjdamzDsx1gH91atJkBftUfQxJ70C2X4Wy26AzUURmltZJebjbxHRJg+TwhsC+Fsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=technexion.com;
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
 by TYSPR03MB8719.apcprd03.prod.outlook.com (2603:1096:405:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 07:12:38 +0000
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404]) by KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404%4]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 07:12:38 +0000
From: Richard Hu <richard.hu@technexion.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peng.fan@nxp.com,
	marex@denx.de,
	joao.goncalves@toradex.com,
	tharvey@gateworks.com,
	mwalle@kernel.org,
	frieder.schrempf@kontron.de,
	festevam@denx.de,
	hs@denx.de,
	andreas@kemnade.info,
	francesco.dolcini@toradex.com,
	Max.Merchel@ew.tq-group.com,
	alexander.stein@ew.tq-group.com,
	ray.chang@technexion.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Hu <richard.hu@technexion.com>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board
Date: Fri,  9 May 2025 15:12:22 +0800
Message-ID: <20250509071222.12083-1-richard.hu@technexion.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0012.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::16) To KL1PR03MB7454.apcprd03.prod.outlook.com
 (2603:1096:820:ed::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7454:EE_|TYSPR03MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf85a58-5dcb-47d4-d57e-08dd8ec8e13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h/HsE6RjUuRykuitRCeDQ42DMg3o43O2rk+2skdersTLoi10IUHz0kXnnBrB?=
 =?us-ascii?Q?VsFzUxMpKWyFPu3LzhMDXmw2C/CV9P2eYjBc4E2NzqROdet3VNTvLtkwswPr?=
 =?us-ascii?Q?WECfPGaWaXIyD+fno4xkCdkL202OxwQiWEJXMypG0Mw5t0aM0zHw8+g7WiFF?=
 =?us-ascii?Q?zznBx3P6JgCvz2mK6fyDI1PmBtmYjsJKQsriAd3bMtUijzSPTV4DNPyHbHzF?=
 =?us-ascii?Q?kMe6ktHoCnEgKcg8mUJkfgAR5P2qbJdc5xPFv3YYhhFAH0UMyMi3QEqqyymg?=
 =?us-ascii?Q?pall33tlPPEtE7jYNhUVrKaYlEHoAPBGeubFFIydKK2khC68GdCe+T2TPGBx?=
 =?us-ascii?Q?ZA+SZJ4vWzLP4ATfyLIgbM2zGAG4pDuKs80+Rj22dbi8D1Qf7R0zbHQBw2PZ?=
 =?us-ascii?Q?bSlsXkrJT+sqwigmMqB7dOEIJclXEhzJbjb+Eg1qAUYkwwLM7kkjbboqUA8x?=
 =?us-ascii?Q?DtcvnneT7IwQVv9V6YPkgf3K5dpBml6fNtHg3OZui4z7ey7a7nIyT3YWS1Oh?=
 =?us-ascii?Q?REmvOL9nr+mjYSnKOY4L+2wi7ngji3YVXWMq7N1MYTaARxn1CFPyLUBX4riL?=
 =?us-ascii?Q?1RrON4bkyAWU1MvQVsodBdVx2N/cfJE4IWQBbu2laoR/pfrIBvh0RyW/R4q0?=
 =?us-ascii?Q?lroT2kDLS8Mjq20MIJQ4PIkeXdTQfanmlEiQnj+NKuUU7XG1noDhVK7W1cdT?=
 =?us-ascii?Q?q9gYziDt7TstJXqa957hRyP8HpYtSDI5zoI2fHZYqinonxek3zrZckfdT4BG?=
 =?us-ascii?Q?32J0hOVEMEDqtkqhcPZ/szRbpty4iZfzLtKWrn19FoMs9OjLmGlKmRNNt/Ne?=
 =?us-ascii?Q?URpB3z5Wqw9hsjHMgBHU0LA+eEpNL7W58/XMjEhJimCQGEbr/Da0GdOoFr6E?=
 =?us-ascii?Q?ULuG234egyWbv3TjZT8oHD1dl/83NPcCm8R4/gLQeT8QBWmWu2Hcd2bYxGX5?=
 =?us-ascii?Q?tmmJJ/YJJAdte3dYGYFfyFSDK2GnfTZjX+Fi0IUvfJxnnIe0D0ubb64PYYRh?=
 =?us-ascii?Q?GOf8MtT9mgLNGHfuapXXMVYgZEXf/4t68bZTJIU0fMnjfikgrb3f6g/WfpTl?=
 =?us-ascii?Q?WF2iEV0GR7TBsvx0jkfZBqRvbwMFrGedVqytw3aTt+y8Qy3beIvGjjTZogDJ?=
 =?us-ascii?Q?Y1Wm7/9ge8KBNuNvYyBg1KzNekOWK4qqe2+Tw6s6iH8ZhtcKi20rMWbSbfW6?=
 =?us-ascii?Q?3oC+a3Hc6Q88aot361nsrOWlAuwXRNZxnBBDOeuvmMrDlq56rx3telu45UBx?=
 =?us-ascii?Q?oQa/DddUj+hN9PucpwNouSPBxOqD5+NH/sX9wc2P4pU3TnqwvSV/GcwYMuxL?=
 =?us-ascii?Q?hwFhG+Mm6BQoL8jV+Re1ySWdtBxOHh3iS76bksLSQ18UG7UhQiLzeiHJieGc?=
 =?us-ascii?Q?L7pDAHXIBekrzUpOec2qydCO3nHp0s1jmAQVj1qcFIZDTpItgO669jiTMEy6?=
 =?us-ascii?Q?sBhpNB9gC/GfWHnH602DmzK4Qig1Ml/JMPhXDys8SmdcJpcUc/jOvA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7454.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7vpo+SnD/JMPX1Dzqd+16gfjIcT1+WPB0TPt2UlYqEVSHFHBhPyXGyb/IV/U?=
 =?us-ascii?Q?u/CNblJdsTdsY4csGwiEV4wzuuHwIBv32pmCBlzBGFFP4eg4wiLHaNv2d86d?=
 =?us-ascii?Q?MgKEMKGxVz5SlmSb6b9WfEslj25Yeyzjf9h1XT3Cw7fXnOfhBB/tHtnI8/IP?=
 =?us-ascii?Q?SXyjYs+JEyFaNXotSwvtTtNDCgUaJx+SzV1a0O66tjITjYIK5o7SvOiGSaYQ?=
 =?us-ascii?Q?DmAKcbCUSearLEbN2TI//ICC8VAL6KXP1fiAbFinCuN8Qa49CUztqrOQzyG2?=
 =?us-ascii?Q?tipWKUetFFgB5Y1yySTTG3RDiOixJw13HX1fYaKlUWYw329VRDYUOfsgJf0w?=
 =?us-ascii?Q?F9I3PI69Aki/hDCNrbS/6Bwv/G67e+nQAWmQmluhsERub0Y/H2CnTAqYhTK5?=
 =?us-ascii?Q?u+Qwf5ICpdaMBurDTH7PxhkJivo37DSQXZirv3RbfHoH8bBo/PlvIr3xe7K9?=
 =?us-ascii?Q?pwiF6N0Nz8KZ1DpqxbOh8xJlRAMcWSa7Owq7QZ9vyyZwaEHk+kfJfhsZIF99?=
 =?us-ascii?Q?p7FyvrgpKbMlAkNhbqJ+cao2ZjWyv9yr/AzGE7SurskWWcTwhq5/soqI/wR7?=
 =?us-ascii?Q?uZuOWt0SWYBjwTkVMqqe20uN5PqTLpGsamLJGuuE2sum9wx75oIsljfbR7kx?=
 =?us-ascii?Q?YoiX27/uJVMO6xo8wLC8mrHgW57D7J9IECcNfRXAlG0tU43gDfWKG43+RAGY?=
 =?us-ascii?Q?9hsiIJlG1En1/HvDq5lM/4XIddG2Ke2Ie1hAxq679EDv8ZcI3aIqQIz7Qgz0?=
 =?us-ascii?Q?T263fNHxGMO8AR+AVVJBEM8e4iBQiWa/Ja2ptyv3KzCFaG8jpWmW74u1SJCo?=
 =?us-ascii?Q?gKX6Yz3Wi6CesXeIhZLkOU4YP1Ro0NpB8h1udcbkJ9/lnnmiC36wHX2s184X?=
 =?us-ascii?Q?FATwgwxWSh115ZuZQmIdNeqUhPyApBv+BXkV8pAmZquynpqmCzATM9OjOTh/?=
 =?us-ascii?Q?T75Fkgllhj8Nzi6BpMkmWzRtqZFPebwSLczYTHuVPek4dm86YWWHy4P9FE85?=
 =?us-ascii?Q?OlTjfEsapNHlXnj7b4Q1ZF6zi2qzHi8u6gFijEA64blhlY0FVVEblutVPdq9?=
 =?us-ascii?Q?gnDOridH6hDEh254wGqQRhtKiIXuNwAgwbocsc11Usn3V0KrE/MFPMidb0YK?=
 =?us-ascii?Q?cv/c/EnZLvSc94I2iKjp+u0kcnt1160TZ3AUrgV7jMlX48AtFQxlXxYGO94I?=
 =?us-ascii?Q?Tp26NYHExS8YBQfdWvIIB3ypEXeEGlB12qnW3gdevOrj+SLo7cEwpMqUuDaM?=
 =?us-ascii?Q?9RSHLESelUcjKzdHhoWVBzhkje005nKJBks33Uu5Y43sj3TUkd882qnSony1?=
 =?us-ascii?Q?TaEvNVs5QK/vacZCE7uCV+rvNMxlISTUBK+QfG1EnRxrPbY91DfjLnkR2vPq?=
 =?us-ascii?Q?miJw+uh67NbuAwR2zf8+q7chudvf2UAO9nvF1uHkcRCIKez34+SFVuFC6uca?=
 =?us-ascii?Q?GecAZSGwm54Nt0qm1jszukFEJ9fbDWRg2KteSfJ/86u4BXq8p9O3t4ZDu+18?=
 =?us-ascii?Q?X9jfqR7Sjmdv9psY0WJ/vCZGdIR1kzh3o47EqXT+FN4sLtwaVrncR7CRWiP6?=
 =?us-ascii?Q?m9mhD4hpCBl4+5LHfobKawQAbTb1zA+puk87/xDErTYe1S/7MxP2R8cRWXIU?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: technexion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf85a58-5dcb-47d4-d57e-08dd8ec8e13d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7454.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:12:38.2905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5ee19679-b9a6-4497-8ed2-1eda849e753b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mae1/mvx7sVMIwYuLlSeAbuVpP4qi04HQPsLTpaHTnNYBr3MKNTgXAMtFYIozW06FaGDmtk7YMAgx6H8fIVWVuL1tN7gYxqY32fzNUHitbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8719

From: Ray Chang <ray.chang@technexion.com>

Add support for the TechNexion EDM-G-IMX8M-PLUS SOM and the WB-EDM-G carrier board.

Signed-off-by: Ray Chang <ray.chang@technexion.com>
Signed-off-by: Richard Hu <richard.hu@technexion.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a2..ca0bc46a6f8b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1176,6 +1176,13 @@ properties:
           - const: polyhex,imx8mp-debix-som-a       # Polyhex Debix SOM A
           - const: fsl,imx8mp
 
+      - description: TechNexion EDM-G-IMX8M-PLUS SoM based boards
+        items:
+          - enum:
+              - technexion,edm-g-imx8mp-wb          # TechNexion EDM-G-IMX8MP SOM on WB-EDM-G
+          - const: technexion,edm-g-imx8mp          # TechNexion EDM-G-IMX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Toradex Boards with Verdin iMX8M Plus Modules
         items:
           - enum:
-- 
2.43.0

