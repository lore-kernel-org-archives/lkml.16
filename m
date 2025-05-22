Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2071.outbound.protection.outlook.com [40.107.249.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E786225A2D;
	Thu, 22 May 2025 20:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747945710; cv=fail; b=Oylhee+9LM+04EugqNsaRVgTXTdFkuWmlajWDFJgmRdtnBXZrPHOH6War8L6W4jOI/7pPyLC0BlTbwHcIw7Fgy86fxNkfdVT8E/g1PEsyZj5oHx0K1Xibb7Dt8FZYHeeHLudG07nBItQEPO11yxTnB7YfPhRqQ2yETcWCRs/s3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747945710; c=relaxed/simple;
	bh=edTkanM4D+7bK5f/7gPsJGM0mW46wZ+RNqz9quZDp+4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rRFXZYNdZ6JvJ1MKkL63EeQplzGQ7BXfG1MQDjzEVK5DNl57R2744ktoIsi714hXWnq6hE/hVZIyX+dHfzRjlVxyuQV8bdmOGv3V4FMYk5UvCcZifBrFjBOI3DZWDK3m2sz4SBVQR0Op4F0N8GqqAOjOn8QCMC436fQbtjix4vY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PzX9zS5w; arc=fail smtp.client-ip=40.107.249.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PzX9zS5w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4GUtjJimX3BuEkiZbkvublOuRgfVdFDtKs6apEkTII+Byxplvs+e6G832iArf+0sw4+7qrr6d56K0FE7YymyVs7doqnSGGTJkgTR0AQMK6Fiv7qsL1PSG5I28nzOoDhNKrauCcmhJHl7O2/xW6YqTDKRsTvk7kRs7mdXl6db9U8ek/J0DnBgB8XVXnZ/M2aWajvJuEFzm0L+6vjz5eau93JNqSMD5jdK9ZR8y/L1MNV0oWNAl8gXsR5xAZmzCXFmFSeOMbPHqZg420BVczqLFxuwi2hOALQlwwcpkxvRqrGF0pioaP2m1CpNB2toGSztpgREMKhRULxIQdmkSgTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WS+iip5bENnjp/UL9O/hhUHn9dHJSRuoyIFIhhDqw0=;
 b=FPdHs65T92i1924wprpP8aRURWemzij25zOctEgDpehmak4tKOMKHgehgHpocowhaexjP8Pr4JN//lLP2dDF6aRqBfom0oiiyLGPDaWku2+Pa0uUPbWzg0pkJLGrzFzwuFUPkQk2YC/2MKkbCEPwjGD0/rckH5d9dtl4f+XlV5IgIlW8ysqJjQNaT+GpVRLGixzoFBRjJxreXnTXYSzdhUZTy4XBNtu5gqBkEB4Ic5PyvyZiSeairIJVjnDKCWDl9vser365mFXPFJKFeGpY94DjA3TZ1EuEJptJ/UE8CTFrQUTCg0JNohXqkKKKNs4iW1weDHltYv3Ly6ZI8zIqYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WS+iip5bENnjp/UL9O/hhUHn9dHJSRuoyIFIhhDqw0=;
 b=PzX9zS5wNSIF3eX5uRfxgebGZrjBvsKrN2lBvIfcutAzlOX4EPby6vhpEXYiNqzukpiI+Q0vdH1d/WUHfs1G9RZ2TDXUVaZ9p4PcdI1E03GsQxm/liJ3xUmQcrKdZCkCCxEZcIfsWEwLR6PWaPmPMAwoweGYOV1hSeMvkVBlB9FlB4MacRxk2HH6mIPLp5Y8DUv4mc/EmEKPy3c0oCufIbgwQJPzGCjBC3qy5Kms4ceZ9s8P9KnQCWDCuFkmzDVdjM9reYh6eTU/INW9c+02Lskr/BN/Ib/AzkVd6+wruA+CWs426uGi8aA4hBpK9i1CwEuXUw6Y4byL+qvaAXX4aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9190.eurprd04.prod.outlook.com (2603:10a6:20b:44d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 20:28:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 20:28:25 +0000
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
Subject: [PATCH 1/1] dt-bindings: timer: fsl,ftm-timer: use items for reg
Date: Thu, 22 May 2025 16:28:09 -0400
Message-Id: <20250522202810.500498-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e223ae5-ca2a-4914-1517-08dd996f33f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JfLKt6DMWoI7Gf/dmqLbyyYw5u+Ygx3nuMxd0tHGWOXvfB3bQSgBOpVYw1BS?=
 =?us-ascii?Q?8PwTHsMiFalGSkIG94QNigyluCLVWCGpAsxmnqFxXfS73VIVaipf9o2GHvjm?=
 =?us-ascii?Q?4amFyUIXA1INU1NwXIa1Tqm/hI8Uan52O3yPy8HfukIa0vpW42IBszppvQCP?=
 =?us-ascii?Q?dLqc4TgQxHsjns6TRLRmd1cDVYYkccunwkXifQCds+GTfJjP1UbznGnMRzoK?=
 =?us-ascii?Q?OppimyZGHLhoWfaWPyfpXkHko7aEV8mjleKJnMvhX88sT7zF8F1/BVcSe9UU?=
 =?us-ascii?Q?e9C28EOoaP7+J9PkI/zioFR37kDnXd3ejXSgjxFtLc3fCzeTl94tVpz8hrif?=
 =?us-ascii?Q?P1ieLXGaU8jpHMXRu/M1JGRgE9rBXwNEJaHF0ZRFOa8ocFE6eeDTNcs8wDWz?=
 =?us-ascii?Q?KoKQYnvKWEzPaUv8soH4c5YiMlGqcQZU9vyhC4lyyVcKBFnVwmnspPU8+bLn?=
 =?us-ascii?Q?De5tPDLfjFKsNSHBfgmJXUWfctMYr259Lj1Mpa7doO5kU21rrYodKzM5EzMj?=
 =?us-ascii?Q?6ewZpFQoKF4gJ0uFfH7EVZJUo8Rmj+kT2j8jeYD5a9vZAKb4OKW58pDpzppc?=
 =?us-ascii?Q?5ytFh4efv9x5HoIbLfQdG+Gwr6ooyoH+xxW9/DtZB91wHLWkFDA/6BtN0+hx?=
 =?us-ascii?Q?HQRMNqfjStvINNa/BxjWLx7d6L9jwutGsp7wViwkmyeRSfd+TOucuqP/HEJ4?=
 =?us-ascii?Q?m2Cipt+E/o+WGsatwCZkvsMmlDkAcWsb6hwhYDCA1Q9RB32GkeOWJ6Xay8Fd?=
 =?us-ascii?Q?KiV9rN5Yw6QrQlsya8Co+EuDtsXiYlHFfrADJp5hlmfx+d6USNWWIaCs+kNq?=
 =?us-ascii?Q?I98ioF+zKttQkThMXbqNSVxAa86D/vyNJey8y/tTAXyj0mM01U5cFN7SS5XX?=
 =?us-ascii?Q?BQeC3ireovk78R/jJqhlNB1M95OqPYu5zcMmn7p57aD8ZoJGVlSEp7b5wA+A?=
 =?us-ascii?Q?XLfJqi1AeXw2BhVtQLah2l9mtkABY14qx2lS14rB+GDHFjXmLxjhTo4ztmTi?=
 =?us-ascii?Q?xHIBeWL1GBGW2lFtPpSSjuFfqsPobfwgSJKXHNZd28E3GIhDQNr/g+zIxY+n?=
 =?us-ascii?Q?dzHhFQIvjKaeqsvynrkywet4Smd/Eoy3MgAlLdbIJ2G7buT6d5OxATNpyvpP?=
 =?us-ascii?Q?WyeSg+uA96sSjtdD6JNXW8rG6jqDvwwp7yhNjTCSLPROCQfZHOlt412zpy4H?=
 =?us-ascii?Q?yxBb6F5591CXbR5q0gERsD29+GDnKe3wuUnn6P3ILly/85ODhhewNq7eLJKL?=
 =?us-ascii?Q?o1dEXt29HYv92nqyYRg2NKsZQNDwDOAWV9K/M/4DjU9uGtiphDwFRjQQOGmo?=
 =?us-ascii?Q?4j98XbX2BaYJRYp4k+clARO0zSJPdbxMyOMHwfEYcJzjddmdspzidHb3Cud2?=
 =?us-ascii?Q?JC8anbFQ3DOgy+emhe2ssxeSdERVbMoIDLI8FhUI2YiJkoZSwTAOcOhustKb?=
 =?us-ascii?Q?X6BYBpHnmdQbeU3RWZ/O5gBa1QERdljAmlDl0liMc6GS3id/tbu1/g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e/0XP5NQNto6K6tHqpuut3bW8VA7BrsG9CYHKgrgFz3rFeLptm8nKbihANdh?=
 =?us-ascii?Q?CbuV6pkS89g7TRpIl5Liiaf5ZzJf3QjaVp5jG0erqodY172ThO7wRtlTGNYl?=
 =?us-ascii?Q?A3t1PSYE2tQ7yoIUnl0lueGFSyCUzxu9Remazea3tCoSDy6ZVYEYzJSLj4hH?=
 =?us-ascii?Q?IwWlZufglyMqNtmCL8HxcusGRwJPMdiX8MZiHCL8Q6rh//JR/v0RcsaKplpT?=
 =?us-ascii?Q?SUmfCJI+g7lofOjDshh5i8wwuphybH8jA4nneg7drLxTnB5g7bA2V9guYTDG?=
 =?us-ascii?Q?tfADt+BkLPB2JptusZbO9WIaTjvjZpNEmieRF/RfofO9u7lPkx+RKvGpIHSi?=
 =?us-ascii?Q?PAIc0NhWOXrexx6PaM8xB05GTwUP0hPF4Vc5Yl4IaJbN0Glk09cCDqyUbGRN?=
 =?us-ascii?Q?A89l42IoqmovE3Z4nRaIzQn/48LX35TkaHqfTtDJxEFabyW8z9pcpQ4z1hhZ?=
 =?us-ascii?Q?1RV2W+rNEWdTLjYeHWHA6QfujgjHJ9SZYsYlkqEnt/UlPxo2HlTDxv720a9s?=
 =?us-ascii?Q?aUIiWLDSniNUqozHjeTQV7hbiI2KKiFFlp7uUJqCNHf/S3hGT9G1KdBEOnyb?=
 =?us-ascii?Q?Ozppw82JJyUZtESU5K20kF9MAag8vxNAAg7ZZ2JeiLhQ8RI/L4VXhuyG6Nb1?=
 =?us-ascii?Q?7mEWIcsF22tRsZMIMMzaIM/6kc7EltZMTMm6jFcmX/72H1udjQRjQsAmzShl?=
 =?us-ascii?Q?id6s0wu3qixQ/exC8hUQmgwGM9mrV8AVyy2ufrhtX0j7L6JhJcsQYuHBVi3q?=
 =?us-ascii?Q?b+ctVZzJ0kItnck0ssBNhTBTLRLkW6BKJyIqwC2C6uLfzhf4/JvYIfuNGkr8?=
 =?us-ascii?Q?9k0SzhhbGV3bY/ZCx01IoPVDDTxVRM1VuGlZmjLFyvDW0dCaunl2qvz7OfmZ?=
 =?us-ascii?Q?4ugyJdQHzQNDUY6ji15Mvq474+ig+0DOUNoi7dMLzs+3XHcx+UF7UNB3wp3t?=
 =?us-ascii?Q?Tb5u0+Iu5ItSfTDVP6qGe3jKZJyAi5gEOnex4fVuVb9apsIqQslJBWeNRao0?=
 =?us-ascii?Q?Oev8COx0I6lrO7DkSFJqJdTWUwt1ptYs/gP2e62FI67g6iJhN0Rwhwk56E1E?=
 =?us-ascii?Q?4WJsKFtXKxOSZUjVuoK41neIxMU6JV4P8cwpr7TqvAC+elWYTq4HQZyRC2Y7?=
 =?us-ascii?Q?dDuTOE+vpcK+Vxg8L8tBIP/52ZnBnp+X56WTpwc5lxGdTXqgj6fLkWbbac+w?=
 =?us-ascii?Q?0yVt79M60S4So6F2+Nj7Auft1m9WFTxHKvCgNRvwbsnmFktH/Riz9zifrZGI?=
 =?us-ascii?Q?qWTT6KpjH/rD7J/Aeb6iP3ZwBk964/EspkKhbxAIf32pSRoWOgTts0qNdWeh?=
 =?us-ascii?Q?HcJOa3RyXDrOWddvRK30NqMMzBEbzzcc/fmzl/RkWH6f8fk7sCg9kM9G5aJx?=
 =?us-ascii?Q?Mxn7bPe3/gYFZGjtsfLgGw5TcRdXUD7lqolZ3gEORf5hrBye1TJBuoHM1LRn?=
 =?us-ascii?Q?oZKhBAPeCt4oBnY4E7f0F1Og6CWvQ2Y5skzBry4CeCbwgR2mjN4DZHiuGoRn?=
 =?us-ascii?Q?8nCNSrkyNo/dsYDHYL4dYADTEhzPrkhmvIb+6Fv3r5noFhMPohv3bsoQ+KHg?=
 =?us-ascii?Q?RLb1Za8LjirS808HOEKQr2o5k521IQvSGoqbHykF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e223ae5-ca2a-4914-1517-08dd996f33f8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 20:28:25.1205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADo9ygxCpdMFNXGpPTCija9lb88K213wXb4G0waqMXjpCF2Dj76Akd+DAZs+qMiHOQ/XaY+jEMN6SfCF47624g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9190

The original txt binding doc is:
  reg : Specifies base physical address and size of the register sets for
        the clock event device and clock source device.

And existed dts provide two reg MMIO spaces. So change to use items to
descript reg property.

Update examples.

Fixes: 8fc30d8f8e86 ("dt-bindings: timer: fsl,ftm-timer: Convert to dtschema"
Signed-off-by: Frank Li <Frank.Li@nxp.com>
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

