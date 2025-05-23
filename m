Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2057.outbound.protection.outlook.com [40.107.249.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E582DCBE3;
	Fri, 23 May 2025 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748009698; cv=fail; b=MjYxXOdK1a9i+QEK0HMpWshhjWEvVtNzUC7+LqZjzT+Ac5l5kwdIs4Dpv8dgd5UQMnCmcsGrwyFbVPcdlcgQKpdi+Byr3HpCgoay+QcG2F9M8FJ4wsReXQN8RrKfvC4hEBY3sd+AtlSQ3WF83GiV3WnhRuHqi70xGU0ThB+q/Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748009698; c=relaxed/simple;
	bh=ikBvEURPYnZPL1/5BBMbeeY2Nmf5VV6f30VqGgQt4sc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=I0te4wjqQMO0iWfX4dt6Ab6uwTupFJZzyX0DY+EizftWBzrSu1CFHGaYPuqusl0IDEZJtDqI2hOYdkWjeekMwCeObXGSdzeqmA1kQH98QqIVJSHJqwqT+pLQZaxO4s31n7wTUV70oyFFbibfBKK68LTQXiSd2kX87raucVXDuRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FJfOUpfM; arc=fail smtp.client-ip=40.107.249.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FJfOUpfM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYmHvEJIeuTri3ZHDB/mC8lHKIdpU3xnGkb4SvP+Nu692aJtF/+YUcP/cGhBR9g8SYI4+q0DR7dIBcHKkJaeaIW5khiZETOtWf7jCluxz/HRvZDZmtmY9EdYBZdTYBGdmJo5dnQv5B0IogWXSZD12x1SgbVLOHuXGJn4jOFM2Y8WfLkNFLoFQu5kpVgODDN3FOfr97bwhxCaJCQAJ/AsRrqdPEEB9rsD8Gcpl12Xpt0Mn37bROj2EQGPAi4/NQAI4wEZKPSH/JOSjIgVUqlqw2Llb3s6fxWVRL+IECQ7zI317EFOhBiJWx3TlRc6eKwdFvwbaAbM+kjeuK3kCPF/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfAvEBU4kQCa18flSv4CfFKLBvR00StNQJ6Rh7tmnhk=;
 b=T5CZvVjf0rokHUEc1VT/eZeaj9mIeGLpKSzGhw6pZoJfDTot93RVlvb7yQ27FDsV5VBoqEnlDvMbo5emgWDlp8ZCFXe4AmUsLaag8Ji5+EriP7IzSjQxKdhk8cwNpL5nokEwfSv55tCga3IEL/dRZU45CSqB5v6ca3AHHG/mQQaxQ4KLH4dpIRuABi5rGZNv920aXvXcQeHGCebu+SF0b5v7xHiXwkyWdWBANQGh3KYky1GcRoBUZNbtgjOsfxfABlfxMeoQxa8n33mfeW0F7EuAz4g2mJyyjORbJpPRGpe/wC3Q/HVBeZR0EC8GRMu68AhsW6IY7/dZwyEoqWJPDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfAvEBU4kQCa18flSv4CfFKLBvR00StNQJ6Rh7tmnhk=;
 b=FJfOUpfM/YuxVf3b3OrZ80kaIqhC31UWVmag+GamHmq+/0gSe6USEX8PD70KkNTxK3AHXTIWbDWNvNKxkIJxBSi8QVLOrW96gp20VV0mBV4+lc41Cmw1fZ6OVUvit6GUTlyDg7L76lCfcVI9U77ND/URuWt2oH1cdsWUrclipSfAMzE2+dWjQ2zAr+imADhzIJ9SmwvYDhVjhvHvvJxR/QPfHhlolCFQHm6OkW0TH1neJruzjSMi85l7i2IV1gMjSeA7Y10Tf4lh28Md4JrA8YSEEVnJfk0m7gdwJhmtskaHcisAOFrN5WoLG+dTFHCIsjhUmADMaJtfnEYrJ3Nspg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10086.eurprd04.prod.outlook.com (2603:10a6:102:40d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 14:14:53 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 14:14:53 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-kernel@vger.kernel.org (open list:CLOCKSOURCE, CLOCKEVENT DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: timer: fsl,ftm-timer: use items for reg
Date: Fri, 23 May 2025 10:14:37 -0400
Message-Id: <20250523141437.533643-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10086:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8cf62b-f7a6-4825-1c63-08dd9a043019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1E+wqe08LXOZsmpDOjbR9UuoZZxScWL5AxazASim7Jspc1k3c0Ri9WdVHpie?=
 =?us-ascii?Q?iLSwRCb5ljbPLCQeYmwp7bnhMfIUg6Q8xi3ZOBnUZTzUZ3JfVXsX5Z4ANSTN?=
 =?us-ascii?Q?r4O3X5AEiI/iA/4xC0VucUafnYZW4U0gi+jMo4Z6qxa6aNAa40LgFv2Uh+5T?=
 =?us-ascii?Q?7JApHS6ahaabDOevtNKKuJ2nefPzzleXhpkD3QS3jICfXPb6tgDlEXcvBrQv?=
 =?us-ascii?Q?mpdF6JTf7K8D+x61qcmKryZQ3SASLb5Rfrlm/a9igO+ADsF1BKDlGHf4HQ9g?=
 =?us-ascii?Q?hoFNSEhoBWn/oICpxIAxOSYpBWZonQWL366R+JBjdU1vu1EQt70hw1RELY6n?=
 =?us-ascii?Q?X4K+gluoloBkKkQeaf6B5dAxARFMHc6BjXpmf64KqIkzE204h0qPFWGcbjVf?=
 =?us-ascii?Q?aOVhhru+pvGbZndkR21XBserFiD5iIGbD3iyE+mql8yhAhsyaQ1cIPWUM2i3?=
 =?us-ascii?Q?7gnBgGiA4kx4jtRLf+nKoI6ueBQTi/3le21PhEaIufvuqL9kkggyi95wYln8?=
 =?us-ascii?Q?A0ezGJrlJY6Y1SRKmWfdq2wSriy5vR+zMBVqATvMWMi98Bu+L1D9qfvamon1?=
 =?us-ascii?Q?tCJxRSSSqRW8aei0fJ3I5cnA6mvYoPwdufCM+V8N0LuTAbxAtX55oGtOP/va?=
 =?us-ascii?Q?8nU2hs4ZfVclZ5wz2MBT8nCg5qM5T81roaLEzZYyHaqzaWEW2f3vAzQ1mCdm?=
 =?us-ascii?Q?okrOFA6s+aqjgs3wXxXdjhf369qa43SNPokj81OUjl8PS4PQosw3cSFFw8WG?=
 =?us-ascii?Q?5BOnKvX+WNxenofk4SRhTjK+GVzETJcCtJ9UJ4Mr8oGVFZ8jE0jpQo/yI4Hu?=
 =?us-ascii?Q?4l+q/c9umCOAq/7TiYL6IJp6/kcf/MeLLd0295TMRWrLmG41/c70JZvqLdyX?=
 =?us-ascii?Q?3FIuXIdaZK/JKyDR6wKt9PYh4nJmeg4vsiLT94D1Wma/LxG6PPMxcCKMvLuY?=
 =?us-ascii?Q?CMbz3Oh67EFhOMoGMG/DJiYxO957Fs5LiElBWqO5eV3BXjylxXVxRy9aaBDc?=
 =?us-ascii?Q?pmLn1o0qx9FpDyXWuwSYBhHtOT5GBpddV1TwbfEF/B+HHuvqBaSSEirmnQoV?=
 =?us-ascii?Q?PRron/PFm1OjoLjoGsQr5czH8/yzkmLG1UGifc/ttQEE7sRKqY+rrRBsPk+A?=
 =?us-ascii?Q?3ASfbSRVxRARb7QM7pO51RhSs4ZG7Kis4yDtyZZotseQIohRtMfQbK9ayubk?=
 =?us-ascii?Q?3p5Olgi2u91m2D0JUhbdlce8WVLNau+JjF5BdhSSM9xeylu23o1qBusdlppA?=
 =?us-ascii?Q?hKNqgxEHqSRa8t6bvSANXIsKwDnZIL0P8W8jevxQCnKJPctktaUIlrldJXVX?=
 =?us-ascii?Q?cloJM+5Ak9trDnPS3eh18UDRuOW3hFYqMx4JJ/71vXFn1N60ASpg322jDqNz?=
 =?us-ascii?Q?V6hDqN0Hxh8HORRaJVtylP8SpdF+VN0QDp+C3nISwjhyJQIqNzBu0P+K3bhe?=
 =?us-ascii?Q?gc3rT8qIsGxO4/2POTKBbrGr1PzEHWkdFGbgxDyBTDtLBCVUD45S+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TJVT/IJhk4zzBfyeccBN4aK9Y/9DTMxtoOZu2EtDio3dRBAEZDkGJFVUvTv0?=
 =?us-ascii?Q?4T163CLLkJL+vFcNTOHwLjr8ZzQqbAZdZmkoRU4h5fNq2SN1pWzWx1DC2GtM?=
 =?us-ascii?Q?6hB8MCLDIIMvuEemkuu589A2H4/XjPC3bIKvvWD8z/LbPWqO2xVUEWM8BQ8j?=
 =?us-ascii?Q?qfTuVbMucTe3Ew4t2pi1odrJFbYtfMgOzM9qA+Ya+Wg46I8kyFsBcRMx38kD?=
 =?us-ascii?Q?0whm5xswx/VT0EPeQoJTZ1JyrUm8ABzaiF43eeDKImUK6AE9WQkAJU2TAuUt?=
 =?us-ascii?Q?AT190FMWW08Q9furq2xIP0J+TBsuns98pnjLdysFA2m3RisRZOqj9PVnHcXz?=
 =?us-ascii?Q?suhsUm7rh9KYtr/o3uvVGCRE91s4TuEPzSJmRnlAjfnIhTTUp3yBZbZPpP4E?=
 =?us-ascii?Q?NUZAMPX8f48WwLL4ObKWb6gYAd/UZTU3yRpf+7ePANDYhydguvLd9qWEYOMQ?=
 =?us-ascii?Q?GDbIMajP76WTEkDQ7RX4gasLDI9Il1NAnJlGXq/OqSl9ZqF7CayUBQh8+Ym+?=
 =?us-ascii?Q?XS3eG+GylLBr1cozHlHWHyrBDctS2cOOvbEYmlvIIBddLsvR2oFeWRagpO/N?=
 =?us-ascii?Q?9sv7Qj4zdiDbMJCICp5m1cpTdyVumcLc6M6sTOcJ7Y46Be72jXoiZcjsAbQU?=
 =?us-ascii?Q?AGnkZPpc9yX7vrLy0yFoy9Xl+qhX/pzhJj0yV39aO7G0455KcKdPQh5+F/wV?=
 =?us-ascii?Q?RUA8az56eN6Qmrb1kmr2wV8umnVMqaGD8QC+iCsRbyzJofSdd2nkPc6wYf+P?=
 =?us-ascii?Q?4oEk3GK6Yhix8BoVbuHcEiLXrYaMIk72Fmow0EueYkh+18JkLrwDkUna6vyd?=
 =?us-ascii?Q?SFKLh9EEBnMLkQBWV0gUlid9ulRZd+6+2KM1K+31UVor0G+9TT4BZLkgzLyM?=
 =?us-ascii?Q?4uDgBXKFHiazJ0hGs4MZwGGgMrdWHKJg36sKEFR935DdRRNR1tPZXP1M7Kqh?=
 =?us-ascii?Q?Ey39XqBlenrweHB6E6Qw0RxGW6uaaWbAHDuouKQJo2OS9xEZ+MjgEkIxBj90?=
 =?us-ascii?Q?j2tI+pci2gQU2nzi7F3lUlhydChedR9qQE3GwhECOWlVfhxQ/MfiZrOYeeBK?=
 =?us-ascii?Q?dsgryrXMsTdDRDlbXbb6jzcMxXUzYraOaC7MGtdRaE2a19VIJvG1+MZJHb7Z?=
 =?us-ascii?Q?66Ym8px4ADxDpt0G1sc76ewe10qXMlVS5HIzPBuRAoOOqB01t8Pc8U4cBG6B?=
 =?us-ascii?Q?MaaMO73THI0yLkBeRpt8W7xf5RZ5E+/JrH45Cafs1y+7N3pJ8Z/2m003PCT1?=
 =?us-ascii?Q?m+aShsRwHs9jIMU+7Dm1kle+keF4EVZ4AhnUkRdB8xCMz3lu/UkCiPpxIsi7?=
 =?us-ascii?Q?2BUhb0VprUdngMCkgcTGFZx+WTpYgvr4tkpleVk7+lWRxMdOMW1RRXrnyt0M?=
 =?us-ascii?Q?Px1MKGSONPlnkUR/5nq52E43RQHRDp68cy4iWj/LVe0w9GXEYF8sjCXE2PkL?=
 =?us-ascii?Q?quStGSwElC7+RuH+EX+G73+UduZ8Ol+y/ez7jj+iuWZcFnv7QLzVDspts82c?=
 =?us-ascii?Q?ojKm470p6SSibYlcnEQWDmB5ee4+e1Tbzh4/bNqdRN0jQa1wb8TJcs3EhTxQ?=
 =?us-ascii?Q?wwadr0B5olozAPCBBLO/tdliRctqo6egvUkU9j1p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8cf62b-f7a6-4825-1c63-08dd9a043019
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 14:14:53.5983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NN+nMgyr8k4ITXRm2PnZzNqd6+WzUegJ5tnlbEHhfyl+GId4vk3tKZx/5b1CG+P4W/gxEXNpKcecqn9YjUAc/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10086

The original txt binding doc is:
  reg : Specifies base physical address and size of the register sets for
        the clock event device and clock source device.

And existed dts provide two reg MMIO spaces. So change to use items to
descript reg property.

Update examples.

Fixes: 8fc30d8f8e86 ("dt-bindings: timer: fsl,ftm-timer: Convert to dtschema")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add kk review tag
- add missed )
---
 Documentation/devicetree/bindings/timer/fsl,ftm-timer.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/fsl,ftm-timer.yaml b/Documentation/devicetree/bindings/timer/fsl,ftm-timer.yaml
index 0e4a8ddc3de32..e3b61b62521e8 100644
--- a/Documentation/devicetree/bindings/timer/fsl,ftm-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/fsl,ftm-timer.yaml
@@ -14,7 +14,9 @@ properties:
     const: fsl,ftm-timer
 
   reg:
-    maxItems: 1
+    items:
+      - description: clock event device
+      - description: clock source device
 
   interrupts:
     maxItems: 1
@@ -50,7 +52,8 @@ examples:
 
     ftm@400b8000 {
         compatible = "fsl,ftm-timer";
-        reg = <0x400b8000 0x1000>;
+        reg = <0x400b8000 0x1000>,
+              <0x400b9000 0x1000>;
         interrupts = <0 44 IRQ_TYPE_LEVEL_HIGH>;
         clock-names = "ftm-evt", "ftm-src", "ftm-evt-counter-en", "ftm-src-counter-en";
         clocks = <&clks VF610_CLK_FTM2>, <&clks VF610_CLK_FTM3>,
-- 
2.34.1

