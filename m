Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2097.outbound.protection.outlook.com [40.107.103.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36AB2566D5;
	Fri,  2 May 2025 14:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195998; cv=fail; b=DSq6VCoVRD+z1tQVggHjJ4zdIlXbTeSfiNK3g74JkcKZ8EfKS3s4b7rbYf1OYZ3pejCpWdu8is0iikSL1aRwT0E4VVh7li5TMsjc8dewDV1drDTugS5NREja3u0J7V2tH8ooz1Oi4yNZJsFQU6ZKoxdDRqcgsZzalezN36NzWKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195998; c=relaxed/simple;
	bh=xbwG7A0CXOvwV9Q76GCPrD0JxCEPUQSiIz1NBC8JlGo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4/YHAENRAHghgIofX7OVH1L+9zeWsuKUo75dMC4sAfdI+b526FfFPcGW+teimuJHzxH/5kxN6YSzLn03uXzQ3PSjL1sMVowrMk4F+hfPFzxOkwIx2reM2eU+YhLFonIMLltLC+ftMu+WJ+tQFs0V/p0/MYUGW6TONWMwZg42dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=tg5rkCYo; arc=fail smtp.client-ip=40.107.103.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="tg5rkCYo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQBcF7lI7E3/fwsCNdLJ6UrBnJKY81mXfbXtXinp4mdcwnXdbykQHf/rwh88ZsO60P1wTX+bgyLq5UKrn4WHYCOEFBAUf2vemC4N3Q5Zp3EWfNhGcvWdBjNqAw+A+DDbCdJcFRoylR8I541S/kyWnsdeRJEmyEW9MEkgjLgJPeXVS3YFGObE2LOmbeI/imKGQxmEQqlPPFv7TkJv8rTfJBZ+8Hg3gT/uNkyytf69BpyqsJK8Aw+WqUY5+WuZKao3lTrK5BsNLCIPx2PgCMFR4iP+B5serftIwxSeXSl9RNwAyWi8btsNF19ytUsyKQQozW4yxdWa6/JCXMROzhpbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSo1FAVwgVeXi/ZxuZBYnfNMEzPQOLloqPgXNBGRqes=;
 b=Y4ugMKf1GycU0rCRvKsYdal52fWK71N49mz/Ekyzm30wo8uCaiMakbOfa+3b3hbfxSk2yiqm0/WlPSI1eLfNYF0Kqj1ZLEcSE/N8qCvIsA5pgn6SgPeYkG2y5qrX7CDcRVx0Rg2kZYQI86ehPjgX3gGz91zy7RRfT7dFtqHvvrCA0oRedaj2P/fzW/YdwVIxKtaCR1/AQjkBAwGSjx58/KpySDr5vRm5+C9vgBn0CCS8RT2z9KJhDzzSiWFZn0UsNJ8Fn5MOAPg8MeW8Z7EPewjtpKqKJDHGKLrDgz2RO2UlwibNP3bh3Ah4NMRroAArZt8JnuXtS6zGfukRPpmHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSo1FAVwgVeXi/ZxuZBYnfNMEzPQOLloqPgXNBGRqes=;
 b=tg5rkCYo3zV9dhf0MYLSJbilxupWdvUoxn2zxIPsTrJu8ufb5/WVGX0ucX60BPC0ZpciTSqlEZFSDlKYVuQ6ZbpyTE55LixqvND3lObGcuDjq54ARQTTf9Ku/cs0ElS/6Mx3nD3AHRkNUaJnD1J+qhDfVhIyq8Z8+vvaIMf+bMyDHhyxc1mBXdfdTV3nnNCw4q855i68lcedWTGKVNa0/7gwU/HrGGMyH0HfcVKumO0OiKnpT+rY4JGhe9knioI0lOcij6AdU2+OloGnrN/Wjp2T2mntA00x0Jg0b5e5VA6nQw8THoHgmQotQgRviDUFp41hLXCY1Wu9DobFcVikKQ==
Received: from DUZP191CA0050.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::23)
 by VI1P195MB0639.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:153::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 14:26:29 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::35) by DUZP191CA0050.outlook.office365.com
 (2603:10a6:10:4fa::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.24 via Frontend Transport; Fri,
 2 May 2025 14:26:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 14:26:29 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 2 May
 2025 16:26:28 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 2 May
 2025 16:26:25 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 3/3] arm64: dts: ti: k3-am62x-phyboard-lyra-gpio-fan: Update cooling maps
Date: Fri, 2 May 2025 07:26:06 -0700
Message-ID: <20250502142606.2840508-3-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250502142606.2840508-1-d.schultz@phytec.de>
References: <20250502142606.2840508-1-d.schultz@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|VI1P195MB0639:EE_
X-MS-Office365-Filtering-Correlation-Id: 589a9318-5cd9-4ac3-1c8b-08dd8985547a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WkfpX4iLxgqPCyshAh/JNzk8bUZS1t1L84uu372eaPL1nVqGFbju3gEnyHKJ?=
 =?us-ascii?Q?N+Sj5RVa6AvIOpDSbT3i4CqW9fOuV1CECCHLwRYLyb8hAZRY9lWRHBWzA95j?=
 =?us-ascii?Q?QQ4OsxEMzwV3LhgX+FXt5tBOVa7Qd5qvtwARiy3mMT6iCI7jBUvhPYewuBlO?=
 =?us-ascii?Q?rvi4bHm4+PlyA9/1/tLDJQqHo1n4ClX4/YEFM5COPvOtsSsbUFhrEs7uE7A9?=
 =?us-ascii?Q?Ez2icy9nJTteEL9SkMPKzQxixJge9wBuCy9+m3B90lV2YQXQKs293/O2qSOv?=
 =?us-ascii?Q?YSroavdQAEevRJ84HTY6d7TvOhSKCTPs/3tpNdGWEnm83TLe6n2yagdThqY2?=
 =?us-ascii?Q?xKvFFgxARAwPwRmKbtKyHgYcrKc0yiJ4Wh16llqCxCw8IawEohwh0LyuR40r?=
 =?us-ascii?Q?YCr0S6cfcwXDi98jP0+nfkuerbcsnTPRk9v1QP5BbVD4nXJ3IRSbdBZwFj4V?=
 =?us-ascii?Q?qhSwj919u+5nmvqwuzpSsIlnNfOS3/M4AMzZRfex1+Isaf/G9y5PXb7dYdBr?=
 =?us-ascii?Q?CUHwfmUlNa5EPxVQTdx9NQDd8QIaM+fEPy8BZ9SUIWK3mZwYDlhbCuk0jT7s?=
 =?us-ascii?Q?Qk1oJnfw2O77JUcTB9mHXde8c9RuHBAKH4egzHdR5vPh5kGBPNfm1HzMZn16?=
 =?us-ascii?Q?jb+mr1WzbhmOjiF7l8H/GDO8CaNDTD1PugPjWS67TEuKNwDIYW5iqx6VI4xX?=
 =?us-ascii?Q?Y7LnI0qqGhywJ1OtpiHDMTQ8U96Xk2U/Qps8qtYjKR1aXDp5gaZH1Abc1wqn?=
 =?us-ascii?Q?5bDADI0M0nMHSs7qorgobddmbM0/Pdo2b/CnfFxFPmcF+BPmEqjiPnVWdYqP?=
 =?us-ascii?Q?NjQ157G8MDAJZYXi2Km5VLK+RUB+o9G0K4mHw34NhmL4rpkm12Kr563xorxU?=
 =?us-ascii?Q?arZVNU9zbjRUNVahi77RwwxWj0GNybPjiugdRYYkp015lUFI/uI+eTsASTBN?=
 =?us-ascii?Q?T/zw0sdWQ/6TGby3CJXjpaCXT5aa2xg5euphQuk0HlYkrIwBO2DX2fjzBa0D?=
 =?us-ascii?Q?NCdLDUDlq2AioN4QFWJ6Fa6fpV/UN1w7XlPDHyNmvhZap8LkNVSUEFwiR7qv?=
 =?us-ascii?Q?t06hJVeuuYhER2SVXaO4kTKKbFWdbls43T79VaB1IXTL+cnCdAli3PfKjFSy?=
 =?us-ascii?Q?URWFqwx+QQMg11sj//mlwe4RNT3T3OzrCHzPacaUXSg/3jZJtslH1FiCZaXu?=
 =?us-ascii?Q?eS7EFrdgY8yfl3BDBZ3y+USW3t2YdiBIfXu1kxPV8wf9u8zWHLFnqzGG/oQZ?=
 =?us-ascii?Q?AZYLUI4C7qbva0/2T5gDG9WgIeHKQjaeLiv/v9C9iERYDnjTRnBeo0zmz2P9?=
 =?us-ascii?Q?eLu8cL6QRu1rQhMOXMmLe4NcC/1qdywX25opuvKKltLCvoAVq7AFeDjRGDZB?=
 =?us-ascii?Q?2Uflc6Y7H6JsrOU/PMLzL1TS7+X0VKRjEqnBQDJiKNS1O6HlioMeTpxgtu9d?=
 =?us-ascii?Q?l5Z7ULtJFZ4XKA72Xad6R13Fd9h9OvkWZ7in6hBfSWG4Z5A/ibqLGPpKC7Fa?=
 =?us-ascii?Q?3m2mYMDkTNdLRF9QlQLIX6DrhBe1QSM1nxQ4?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 14:26:29.6724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 589a9318-5cd9-4ac3-1c8b-08dd8985547a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0639

Rename 'main0_thermal_trip0' to a more descriptive name that
includes 'fan', as the current name is too generic for a fan control
trip point.

Move the fan to a new cooling map to avoid overwriting the passive
trip point used for CPU frequency throttling when this overlay is
enabled. Also, add the fan to the existing cooling map.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 .../dts/ti/k3-am62x-phyboard-lyra-gpio-fan.dtso    | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra-gpio-fan.dtso b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra-gpio-fan.dtso
index f0b2fd4165a7..1fd0aaff3193 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra-gpio-fan.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra-gpio-fan.dtso
@@ -33,7 +33,7 @@ AM62X_IOPAD(0x0a4, PIN_OUTPUT, 7) /* (M22) GPMC0_DIR.GPIO0_40 */
 &thermal_zones {
 	main0_thermal: main0-thermal {
 		trips {
-			main0_thermal_trip0: main0-thermal-trip {
+			main0_fan: main0-fan {
 				temperature = <65000>;  /* millicelsius */
 				hysteresis = <2000>;    /* millicelsius */
 				type = "active";
@@ -42,7 +42,17 @@ main0_thermal_trip0: main0-thermal-trip {
 
 		cooling-maps {
 			map0 {
-				trip = <&main0_thermal_trip0>;
+				trip = <&main0_alert>;
+				cooling-device =
+					<&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+					<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+
+			map1 {
+				trip = <&main0_fan>;
 				cooling-device = <&fan THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 			};
 		};
-- 
2.25.1

