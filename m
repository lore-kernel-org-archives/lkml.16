Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2134.outbound.protection.outlook.com [40.107.103.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0711F8755;
	Wed,  7 May 2025 05:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746594561; cv=fail; b=PSiMURT1hoAw0L0mxrkugP81k3UIR04SI0NMGSthacpRiTskAqSaNNXKH/WWjwIfpkSUlIsDwi43PkPcchB2PU3TXr3dTElGo6afxlZOh++kS6UBYIYeHK/5HSRtq2qsFuA2Vhcyb4fw5jJLMi/LNo7hlPuhJSAFWCAGOjT1184=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746594561; c=relaxed/simple;
	bh=PpdLQDa2rJNzGzV36apev1EIaJ+YOBtQgTV9cEBgLm8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tUTw3XtIOYEMAPKqCx8EyHscpNBkjmDsXgVLckVA4X2Hn/XHfTsasGzx9RuYytr/xzGmfIMV5RbidX9t1/BvwMynp+Xvf/vG1zcw5vuFlU2prfQuALnoXVhBH+Vnl2OyH1nPM8ksTp0T+yt0MM2MGIqFCP1bM9avO9NOKhq9se0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=onkcy2C4; arc=fail smtp.client-ip=40.107.103.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="onkcy2C4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXjesv0MvE09DSTILVkZcMwEBmIYJkgHlWqIjsWWDVLe/+u3Xec2Yjvqb+rAXfLdvJ+Ai1gQL0sxn4fD6R9LgUIslJ3AFW2oYtXhOqOo4MW3U5mSKKaWsmwdrym2VkvZLnm7XPJZo9v7FYgI51Khpris3zzvZMW1yYFaeRngrytNvIhbO1hi2ud97fTco7FfzPI/8qU5NUQdvOBHQ9phwKRbqksv0QOEfvmInWQIOINySOlpjVazPpkLH2G8AHNpNxb0/WyxFkb4Vys1z4fidJWn/uk8YmPU0btBJv0oSpsvA5B2ziOjNUD0l7+ZYeoWSZak16MtZXlhE7xUNsPfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHtRmPdkzFbViIdOiyA2SUuk1b7tN0nFAxUis/Jn6ug=;
 b=SfZnUKGVw0Xk/PbK4nGgb6pJnSsm1hipzAp1m1YVobYobQGckVQ0gphwKDi1998rly9Q+wRDPGXbg567zYUJ5nu8pHMuEjPJVihfwMC7vsIdn3SVfgLDdyrKxsJYo7cAQn+uWzGWlygSIoBhsd7QBVz1XzZ1zePRHoa9lGWGO03jtH+20JOLQdFRCzXC+xCyh79lmxGf5LPPHDfZ276ZARBryBqvbggfLP4DA1HlXjCLUFr+ts+B7eB2hdzfSNcZH7mYAlJ2x9riNBxXYShYmB+z7J09zBUpNg9rdgjk3Ft4PmB8Yo2z/gsAMaNO5QCtEFfJyjmWxGF35wnnKP/HYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHtRmPdkzFbViIdOiyA2SUuk1b7tN0nFAxUis/Jn6ug=;
 b=onkcy2C488RJ6zKHPemvBIiX7+XyxdrAze9TppLqORJV19gdHteN9xVmCvRJrXacuasWDkCxLdWi5Lzp5/l81/OPeN7jDGDHkYZJyJaKMtIQQN7CFYyo4f6onViX3IOwoX5eZ/jwlbLSvP1nuQM7NUJWg7zymxG/ItxehxB2F32A4FHTWOO3WWQcGGYVxp/IYR7YPtLHZJ4vM5LPc6wnql80ETuuLb30KXVYn/QMeuXVD3p3NeJ9ADaPR4/zbNSuZoMu+W2boQ3/mwzHO3qCV/5x+61+9tO0Rj2UjRVpwsp0N+TMn3Dg1SLtgk1bm+D9Rnl2ygN5twOkcwAYMF7Olw==
Received: from DU7PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::7) by PA2P195MB2533.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:406::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 05:09:15 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::ad) by DU7PR01CA0007.outlook.office365.com
 (2603:10a6:10:50f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 05:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 05:09:14 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 07:09:13 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 07:09:10 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <robertcnelson@gmail.com>,
	<francesco.dolcini@toradex.com>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>
Subject: [PATCH 4/4] arm64: dts: ti: k3-am62a7-*: Specify Temperature Grade
Date: Tue, 6 May 2025 22:08:47 -0700
Message-ID: <20250507050847.912756-4-d.schultz@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|PA2P195MB2533:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a9a4df-92e8-44f0-16d6-08dd8d254fb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RKo7PxdBREHElMFuPqJpYQj9/2SZa08WQSZQhInqBhQBW9Y6OgRB2SYMOlzk?=
 =?us-ascii?Q?RRl7rYpGYArfOvAvyue8Ni4nft239lzH/LUJkmuSO3Pc0bhW2pFGZ6FA6Ptk?=
 =?us-ascii?Q?Np3JvSyhWTiaF4tyPyQcdiiTaFv1YDiY77WgU3DMiFltrhd9YjHPenjgEZsr?=
 =?us-ascii?Q?KCgWtW4gcnUQMus+bRspPf/VhMHeC0LEeuMcVqIJWht1rbC66g0hz7ivfRIg?=
 =?us-ascii?Q?y08iPJnCs4heRoC+/0iNsZErRzAVCSVcacDHtA3fPpLy5k9xUNvTKMmdKkZK?=
 =?us-ascii?Q?BQzBMclWFxCM3USA2+/NKUSeP05mxvJkbX7W6rl/Q9vKcfqJ/sKYyjTnUhEZ?=
 =?us-ascii?Q?RxB5kWBMmArmLLsZdZz7SS39IiQKvCz8Fw1SADC61QR6Ma7W7cXS6FzehKOA?=
 =?us-ascii?Q?O4kDDlvqcGF2bt9DW62njYbu/tyLg7JXvtkbHcl8Yt2Jgb/wrJfe8OMORXJm?=
 =?us-ascii?Q?iIs1N4IU8WCwmk9am6MVKuES1R70f1YRVE47Xp1yNiG0IrFIHNQWdxiTdl3L?=
 =?us-ascii?Q?l5uD0q+w9TrgY7mTQ5y5sVAEfX3VmW3MA8JMloq22Z1nUPwCZsbsqVXmkffX?=
 =?us-ascii?Q?RKjbjq8WVFUv6UaWc0xUJcmrrNAlop9E9H1iztqN9r112gPkMsE4aM+Vqg0H?=
 =?us-ascii?Q?N01k+dSlRecfkRwPfijWE9iNDmzrlciyHaYrcWy2Z/LYNNgajG3x5/4C/Nmo?=
 =?us-ascii?Q?e34u0ZTyAu6jFtMZ/XhJC15huF73rF731NBIEgb/mtkJfHh6aFUZyD09Fy5i?=
 =?us-ascii?Q?68gnbGRC8Y5qK3w+81y2G6oMGk4ssLtwTl2POaDlrB4r5nTUicNiCMEfnuTM?=
 =?us-ascii?Q?x54u35bpbHg7fcPOBHmmLNWrpOjPtOaLrXWaFg/ayW2DSAM1NaRnGR793IBl?=
 =?us-ascii?Q?Dzuiq2+lLQ7d2ODAfsuSMT5tHcrs3omaKXKi4b7kNBz+yWEd9PLJ1VTcDKPf?=
 =?us-ascii?Q?V79HIRTl8J5orEqcpvrvAf123VOY/CMTB2F8Cf8tugQaNw8cMfmOFxiscCnk?=
 =?us-ascii?Q?2khIeJh3CUJW8YcdR3IViVEYqqL/hN4E7swLcIy05NAU27L1Cr0iwfgq7J8i?=
 =?us-ascii?Q?dqq8ra+2HDU/5Azq65DIKiKyINOh1boggXi490EDo0Y7uI5VozZKPV2qIF03?=
 =?us-ascii?Q?u2lS3RVVjPGqbQBjUGlcxx0dm4qzCH3JKrK5cVjS1pMhApipTcxJkpSuhE7A?=
 =?us-ascii?Q?5uVxN0hT7TgWOVIAi6wkFGQ1sO1H7ZpZX1W6T5GwXA/7QZmq4LI4KbV9qCR4?=
 =?us-ascii?Q?FTFMf/MIWyWXGmnYwX4OsvyOEG3xqhuCKdEOC49LFvTTiT0cTqapb0yWIuQn?=
 =?us-ascii?Q?0R0pCuW3bpFEOWuf8W2X5k0FAMyaEzCcfKJDVi1OLX0BaELPSWb1oSnRST+N?=
 =?us-ascii?Q?pjMLMfb27rmOGntqqcfFX6R3/66/ua1XG8mCHpq033K2bFdJ1jDhdp+0v1JH?=
 =?us-ascii?Q?Qsh88X3QOF1ccM1BIoWJc1eeYO41R8oklYwg9K+33askSZhZQC7xi5/3tS2K?=
 =?us-ascii?Q?jdGoKTfxvS+rcncHVcRoiSH6n796KBeq6I7eowW+PJcyOn/XYGFXB4zrnw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 05:09:14.6597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a9a4df-92e8-44f0-16d6-08dd8d254fb9
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P195MB2533

Specify the temperature grade in the base device tree to ensure
correct trip points are applied for each board.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dts | 1 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts                | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dts
index 77e5fef618ba..7d2e4694ed8e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dts
@@ -10,6 +10,7 @@
 #include "k3-am62a7.dtsi"
 #include "k3-am62a-phycore-som.dtsi"
 #include "k3-am62x-phyboard-lyra.dtsi"
+#include "k3-am62a-thermal-industrial.dtsi"
 
 / {
 	compatible = "phytec,am62a7-phyboard-lyra-rdk",
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 1c9d95696c83..125e812fbb86 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/net/ti-dp83867.h>
 #include "k3-am62a7.dtsi"
+#include "k3-am62a-thermal-automative.dtsi"
 
 / {
 	compatible = "ti,am62a7-sk", "ti,am62a7";
-- 
2.25.1

