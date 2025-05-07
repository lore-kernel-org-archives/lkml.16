Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2127.outbound.protection.outlook.com [40.107.20.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EC21DF97F;
	Wed,  7 May 2025 05:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746594555; cv=fail; b=nJ1atf23O7TGmjsVPDW+mghkr36XsonRcP/soqe023f9Enbb3bpsEQPOYS0UsVL46bI4gIYp2SuVHXJ8/txd3oDzc+nuRTfzqKV2Zy3rUyAk/tAJj/OXH/ZSNlJaPgOofWg9twRyVcT8XbJL3i0/r+fJub3znnPfiWZn9kYWels=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746594555; c=relaxed/simple;
	bh=OvojNYRj8Z7P4WrhkL5rkUXJ/mhcBeRUbaygxI/Roxk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FBssxjfNnDRkzzLwLxjzn6IqwAldfI+Gl+zKniwCcg8sGGjQ180XM+thtUred/zma2KnNRMW6iGR6zGPTYQAqZXwMNvPK9s5YsxKHMlQd0V0rZJ6Jh+TF3bv6+zTqtrDH4p2JSdZ5mWsz9zFm/DMXWEI4l5+WX7wsHZjdpORCtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=PHV+bq04; arc=fail smtp.client-ip=40.107.20.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="PHV+bq04"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gikFkx4xKQLhHqhV60jPh2XCnDnRGowMC459QTK0YR/20oKk4t5WXNobla5NIzNnUuz6LPRJINACnNYZ0mg4nUClc6ehbJYJHGQ0la5WSJIFDxwv9tXda5y6xUs6ZhaDMQmhoNiSQKBAL8aygKKgAYA4plPQPssnW1qEpGqo6VftQvmzqwll8DzMwnE/n+h3Bpv8bE+ILYLXBfH2T5H80Z7UWJ4FJUTHEBsJ4jJmlFMuNA6w5cHfvR0LgAbq7E/mITxgVTM2ycC72f2N3TR8VEzVKFfpt8SkOhdif1BVsafKi2PQpFWKSi6Or8Zyp4vL3MFmFKegaHQzMIfZ96hgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2aolKtkB4tLZ8ADBQLKLaLXwumihfzpkaKm9Ah+rgk=;
 b=vzJIHzUUHhESX6BpEiHgXOUeukkdWpQcBRzgu+0QHYxGgjaBuxH/4vwl5JNWVqqPSzM7lA4voWB9GjxJpvr8orhfqLLJfdbMcRXzJo1UIfmjgxy/MyehHwfcPRsV8oeCLNsp/w4/QSQXhywr/7XdEYI8+GHDC2OFkiICwlzOzr6On6cXwP+978N+/Qh7HVVQ5HsrJC/JjJxwRUXQM7hdM3rT1xPlpHzxvRZFfNexRdgChkLZ1tiHTT7yuxshUqZ9gGY+iTsFb9o0AyMbO7Ba05Op+AX+xsxkUZpNWdqfpsXVaBALL7Q7A/bsdrBSirWSV+WOYtzXAREBAjCSmQTbhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2aolKtkB4tLZ8ADBQLKLaLXwumihfzpkaKm9Ah+rgk=;
 b=PHV+bq04CnakctRplovHDYD8WKxPqHsQfEUeM7UTqGC9MMGn62e4sw4xrQF7J18zd/laE2olP9B+WeR1VR1n8L1KTzER84p+0V+IkVIXXWdE1jBUwBnH1fo7HLKVlW/61SJ2St+ZNwVkpTZ46pHZg/Wd+XQL04iL2kIXvjOnur1nOI9dOUERjVokXFuWE3QLXhMwJugQN2igeHiIZKq6BKMT1YgZSM99/8dIytoegGov5+PIay2Ajhj09NZIpZU3kCasVETR84fGASOAaJFSXpxSVWm/jHujM55cxMbWmj8ZjKtldDqls8Fx/nkrSDLRAyPMDCkfhHMiC0YWegXIfA==
Received: from DB9PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:10:1db::16)
 by AM8P195MB1027.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 05:09:07 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::a0) by DB9PR06CA0011.outlook.office365.com
 (2603:10a6:10:1db::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 05:09:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 05:09:07 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 07:09:06 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 07:09:03 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <robertcnelson@gmail.com>,
	<francesco.dolcini@toradex.com>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>
Subject: [PATCH 2/4] arm64: dts: ti: k3-am625-*: Specify Temperature Grade
Date: Tue, 6 May 2025 22:08:45 -0700
Message-ID: <20250507050847.912756-2-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250507050847.912756-1-d.schultz@phytec.de>
References: <20250507050847.912756-1-d.schultz@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FB:EE_|AM8P195MB1027:EE_
X-MS-Office365-Filtering-Correlation-Id: fb32ab04-7421-47e9-3df5-08dd8d254b50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bSMF4qLI8UyULDuQEHooTXO3UWP6jZga3bp4bWUPCgd+GK6V9sO6ttH7z3wd?=
 =?us-ascii?Q?0AjrKhtswlHdnkm6+nWh81IavFosbdkbN4labpsthynN56seT8XmvjI4TL06?=
 =?us-ascii?Q?ZXny11mJBqf+tQbTcTG6OpRGJFSA6mIHFg6ayd5zM4OgQbo/Mm/XgXhTwVp3?=
 =?us-ascii?Q?4h/uoOYMzOJ7Iih2wh6wE+nK94YyVxszm1qUiY5YbimgaDSFey1CDVFExm61?=
 =?us-ascii?Q?VvcV6HoqdKyGA4bvVUnjCt3pLqj1RHkXKDLKSNC6lKr5HtsbV7nYjH8nz1wi?=
 =?us-ascii?Q?F/kx90v8X2rUJXFj0vdn1K4QwvAsENQd1fEecJ2uMI6xire+OAfjcXjy68eV?=
 =?us-ascii?Q?6MJeppDJfuTr6G7c51/jANHKsL1HHdzSRGXCZ2DbrNCaDj/JnwdSzzof0CJ3?=
 =?us-ascii?Q?GNuKlK+cVYebpgwqsyEXjSEHyKQ6ZcQgoPEedPyswCpQ72TBa0G3OuJqFsCl?=
 =?us-ascii?Q?oHtBwvfHZgR9jC2FHpi2BJ42MmH7zYF1G0TsSa6R3N2SHdhEhTctSBA+maHn?=
 =?us-ascii?Q?TPuPCKLFVUoHB36ou/9SnbT8FYL0vTATh80LFruqU3c8W2EZyutKauo5zvns?=
 =?us-ascii?Q?Mv9ZfF7ANKULVM5jvdLNrP3KjmGix6/YkS3NOtlw2iMam4gWKVRtGLCsbADj?=
 =?us-ascii?Q?FX2B3zGSmNNhwQ3REKrBfa/TWJXaoX+RaThrnT1jO8ZiWn28KOIL5BVpZbAl?=
 =?us-ascii?Q?m7E/n58dw4R6mUDTdhptdtPK+3n6EQZNN3cLCQ0n+IWsT5FI2aO0On1h6KNh?=
 =?us-ascii?Q?WqWXykPuzS4Q6t8lJYqBtxnJowGGfUsGUMfalpLqHaPo7ZTed43igGroAjFO?=
 =?us-ascii?Q?uLqsvaZUFAeAfZPY1eYIEDUsOjp3N6gnz+PI9iA7NbivLytO9KVvUY0kS1rk?=
 =?us-ascii?Q?Pao9TCEK0Cnk2FDd7a2Qnu+OgvOnek7QIhwhlAXbYT1Uwy+vCpJcn4pkdQTX?=
 =?us-ascii?Q?WVzm6Fk/R27QU+38FlB9hwyd8kMBj9aCTvUeRVTqIvKPqhvabU0zgQLiVy/q?=
 =?us-ascii?Q?8XzvAL6KLD4bhW7Z2j/2HRO7L+E/AcZXE3smGXBqfwwA92xOH2DIFnT3uVRU?=
 =?us-ascii?Q?43+RMIpeuGzygU3TSnmfCgWo78UTsqbIi2n7acYIutAtlfN0Jreqn5s/L66G?=
 =?us-ascii?Q?7udqvdwNIrgOwj1rnNWImq6hYalg3hoRH9Ov2Llaqth5LL0lMyHb10sR/kx7?=
 =?us-ascii?Q?y1ypiCM04yf2R7bkU3XdUFYzGO5FYizVF74/mGYO2t/GlecBNBMnIhIlNpHl?=
 =?us-ascii?Q?LbipwvlMX1/ZrrNuR8yR2ZYI38Olo8chToaXZezVcZEltzcjW2ovynFFbNWZ?=
 =?us-ascii?Q?XUW5DDZNFnlb1e9GBzbtaJHinFn6DZtUNfA5O1O5wRMue0QuNsVcgDV5FmC0?=
 =?us-ascii?Q?MQogYKirAOS56Z8vAZrcuhN8ASaIs4XLqxNLcK6rUrSTHDs4RTB/MSeM5kJI?=
 =?us-ascii?Q?pkdG3zjYND2DneB/BFoju3A2FQbEUjilvHCLTZ3A45ama1r/lQH/icPvgXc7?=
 =?us-ascii?Q?ULVTr8PuDyDtrVkxGuEm5CAaE5b+BqWka2KCjhjo7tQ4kLhpaFWH0eajXg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 05:09:07.2619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb32ab04-7421-47e9-3df5-08dd8d254b50
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB1027

Specify the temperature grade in the base device tree to ensure
correct trip points are applied for each board.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts                  | 1 +
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts            | 1 +
 arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dts     | 1 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dts | 1 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dts    | 1 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dts    | 1 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dts | 1 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dts    | 1 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dts       | 1 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dts       | 1 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dts    | 1 +
 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dts     | 1 +
 13 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 8e9fc00a6b3c..cbbdb2f2c265 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "k3-am62x-sk-common.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	compatible = "ti,am62-lp-sk", "ti,am625";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index a5469f2712f0..380bd98d3d01 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include "k3-am625.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	compatible = "beagle,am625-beagleplay", "ti,am625";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dts
index 4fa5efdffcd7..f75e3b45e9c5 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dts
@@ -10,6 +10,7 @@
 #include "k3-am625.dtsi"
 #include "k3-am62-phycore-som.dtsi"
 #include "k3-am62x-phyboard-lyra.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	compatible = "phytec,am625-phyboard-lyra-rdk",
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dts
index d38bfef29d71..0a70705c6536 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dahlia.dts
@@ -12,6 +12,7 @@
 #include "k3-am62-verdin.dtsi"
 #include "k3-am62-verdin-nonwifi.dtsi"
 #include "k3-am62-verdin-dahlia.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	model = "Toradex Verdin AM62 on Dahlia Board";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dts
index 31d2a3066d43..a2e5b0886820 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dts
@@ -12,6 +12,7 @@
 #include "k3-am62-verdin.dtsi"
 #include "k3-am62-verdin-nonwifi.dtsi"
 #include "k3-am62-verdin-dev.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	model = "Toradex Verdin AM62 on Verdin Development Board";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dts
index 48798bf3da4f..4f711c8cceba 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-ivy.dts
@@ -12,6 +12,7 @@
 #include "k3-am62-verdin.dtsi"
 #include "k3-am62-verdin-nonwifi.dtsi"
 #include "k3-am62-verdin-ivy.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	model = "Toradex Verdin AM62 on Ivy Board";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dts
index 9cae12106e0e..7dc6765e46dc 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-mallow.dts
@@ -12,6 +12,7 @@
 #include "k3-am62-verdin.dtsi"
 #include "k3-am62-verdin-nonwifi.dtsi"
 #include "k3-am62-verdin-mallow.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	model = "Toradex Verdin AM62 on Mallow Board";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dts
index e80332e1f030..9951bb4bb355 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-yavia.dts
@@ -12,6 +12,7 @@
 #include "k3-am62-verdin.dtsi"
 #include "k3-am62-verdin-nonwifi.dtsi"
 #include "k3-am62-verdin-yavia.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	model = "Toradex Verdin AM62 on Yavia Board";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dts
index 3850a706edb7..5662b9885fb0 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dahlia.dts
@@ -12,6 +12,7 @@
 #include "k3-am62-verdin.dtsi"
 #include "k3-am62-verdin-wifi.dtsi"
 #include "k3-am62-verdin-dahlia.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	model = "Toradex Verdin AM62 WB on Dahlia Board";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dts
index 4b657d6d3e0d..ea92fa3904a9 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dts
@@ -12,6 +12,7 @@
 #include "k3-am62-verdin.dtsi"
 #include "k3-am62-verdin-wifi.dtsi"
 #include "k3-am62-verdin-dev.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	model = "Toradex Verdin AM62 WB on Verdin Development Board";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dts
index d96d8a0ebd86..d847760fc8cd 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-ivy.dts
@@ -12,6 +12,7 @@
 #include "k3-am62-verdin.dtsi"
 #include "k3-am62-verdin-wifi.dtsi"
 #include "k3-am62-verdin-ivy.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	model = "Toradex Verdin AM62 WB on Ivy Board";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dts
index 81d834b22649..0f6fb374614f 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-mallow.dts
@@ -12,6 +12,7 @@
 #include "k3-am62-verdin.dtsi"
 #include "k3-am62-verdin-wifi.dtsi"
 #include "k3-am62-verdin-mallow.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	model = "Toradex Verdin AM62 WB on Mallow Board";
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dts
index 8a2506068ac4..e9a78c03d41c 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-yavia.dts
@@ -12,6 +12,7 @@
 #include "k3-am62-verdin.dtsi"
 #include "k3-am62-verdin-wifi.dtsi"
 #include "k3-am62-verdin-yavia.dtsi"
+#include "k3-am62-thermal-industrial.dtsi"
 
 / {
 	model = "Toradex Verdin AM62 WB on Yavia Board";
-- 
2.25.1

