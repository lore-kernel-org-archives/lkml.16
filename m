Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2121.outbound.protection.outlook.com [40.107.249.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BC222B5B1;
	Tue,  6 May 2025 11:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531725; cv=fail; b=cvaFb9KMvr1UqxLlaXizXp51Mv6gzNrLEtKbuqVfylFO400QbQOZTNvP6yhOQ19MjJ5ThWZ+XDZiZlTZgb0rw+yUGpv7Ku2KnP3lTtyRjn9UdWP+LRZuT7Vl4sOaEF9adItgyw/Z24MWnotSEmNHCvxWBzuHRRtFEjkYMblssx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531725; c=relaxed/simple;
	bh=xbwG7A0CXOvwV9Q76GCPrD0JxCEPUQSiIz1NBC8JlGo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BgNNlbmzdlA0hbm6lsCk6RVM7m9gxo73F7jW5qbJecS4CBb+hibo8CKhHqrY0YTcNQ/DAx/aqnSt0qRsqP5KILnVHerV7Kj5xpUVPJu5ar4mmJpxT10bNhTL1mexFWyoMlb7PzNb410/6HWgjpn1m/lu0BcXkPpTm3ojmCO56PQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=NN59mwBW; arc=fail smtp.client-ip=40.107.249.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="NN59mwBW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kt3SMRJWRtMfPetReRc62xXw3PeXVDUq8EzaU8QQqgUfGd2wr4ddJfvN6l+Vxfq8X7WK7cGGlpO3Ay4b5gxhzeCmSwIzvCyjZI7PJ1lcZa4c18zX+VIrZjTDhEQK61ftyB6DTiclH5JLOulmUkH2IsgUa68FEuvJbKJ3JWmDSGm6nlRrPNyGTP31u5EFVPKiW6f+bsK253ejP8Ha4Z33ER1wmqYFkTN7HTEHSb3eenktSSwYb2VXgyEmlkx+B+8nS6p+Kb6DYAcdIvw58Wns30f9dwFbbbMBXWdJmCDv9JD0N7e+QAXT8I+McKYnJUPzBhpGFgF4mqvc+tf3CHSkhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSo1FAVwgVeXi/ZxuZBYnfNMEzPQOLloqPgXNBGRqes=;
 b=vK7AlqIzvv1Mn/Kd/qEx6DhJLAaFJ/0etN+R8emOPECg97OkBMqAcFkCyCBllKFPCFMRn74Gh2NqKGaVZad0VWf7mNQ2aLVKIVtiX58ZJcdIjn10fn7Q9ce2sLE7govswdM4i0TBuAEtupdulWxjcjdf13jkgG7ljFcsswsl8X1cBhYqnDb3JL0uLPT3dkHADmx3rPdZUKkoB7GnOkGVjjzjjGSSxAJrPfCLM59ot+QxCScy7sQqYul7sel9UaiU38fBFPFEJdDpecMaz3mK8Y/kymAPKrmfgHwTYF4jsyoGY297zDnYdRO618PQm7hNTNieN0g+DCPohGadG5m5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSo1FAVwgVeXi/ZxuZBYnfNMEzPQOLloqPgXNBGRqes=;
 b=NN59mwBWRXH14S4DME4mpU3LpY1yIz3+pSgN0k6yWttoqiNqQxHDkC85YVx1M8qybxPfCvgdHdydUbD26FfyCHtektjFGcLVJ621GM6UnoJok8+dY5m2ySo2DFM/u7TS01DYNGSCuZtoBtc7ti59zpLPrCF1L53KMQ3OMWuaz/A/gofMl3gwclnoE1vm5zjph5yKgMnwBYIz4pu0Sn2i2Pna3Qka0oQmy9OegLk/MFsjnPMUo0gyWLzLINmFs+Y7SDANzBcqKWZDbdhVcs5zAEd/URXCjQvoku4AmljJsmUz0zEUeh2MQ4ST9vykNUcKR+EZSI4r/zH6eBjWm1CTVA==
Received: from DUZPR01CA0348.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::7) by PR3P195MB0878.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:a3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 11:41:58 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::c7) by DUZPR01CA0348.outlook.office365.com
 (2603:10a6:10:4b8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 11:41:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 11:41:57 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:41:57 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:41:54 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-am62x-phyboard-lyra-gpio-fan: Update cooling maps
Date: Tue, 6 May 2025 04:41:34 -0700
Message-ID: <20250506114134.3514899-2-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506114134.3514899-1-d.schultz@phytec.de>
References: <20250506114134.3514899-1-d.schultz@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|PR3P195MB0878:EE_
X-MS-Office365-Filtering-Correlation-Id: f576bb60-fb0e-4cd6-bdf9-08dd8c930219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c8pQ6R2SwVEo2EItQknsjSijZ+jhLjQ3Cu+LHgWzrAtbcFPaBOfg2aDOwFF1?=
 =?us-ascii?Q?HgnM5WXUbMz7rWQHaKUg5CclYyA7qSrawqwd2cbBC5LeDHgx0qdh9a2UYP1T?=
 =?us-ascii?Q?7L5g7Dc0fncgiW3mqgPMO0Y6H61wgecn1nd+IY9cTmKM7l1GepvK7VMOznI9?=
 =?us-ascii?Q?2k5ETG8pCyyO1V1W9SFz/t8RQaoODVJs9sCl1ixDBZCv3Ffjn6Cp82eB6QDt?=
 =?us-ascii?Q?AOc4kQEZA/H7etu0cBfQYFt/wtP4hIaTXRfVhetX5eD6Y7nRE9a31qhaIrij?=
 =?us-ascii?Q?wYjlQAp1Z+IrtJnx45IGv1ZMNl2UVADXLxXkp9emuvlmFV4q4lL44Azo1fnw?=
 =?us-ascii?Q?5u8g5xw6k1+YyG6zEdOFfM287cjEaGXU/qXSLC0C6ZRAa+8Fq5Wy5fGJgguv?=
 =?us-ascii?Q?dIjB94mlfAXK9VruvpIkOQrpEWB2BIsugwDffJTwr7y9DEqJ1uiO7pdZpQ9x?=
 =?us-ascii?Q?CGI1AwYEPVRWvVwz/HnBHyfH+Z++5FujAXIZ47ZxkQlZ5O2ks6J2VZW63Z8I?=
 =?us-ascii?Q?gMMv+PKeKbp84qpuFIjXKrzeUnhxed614KGREdPGACPA0V6pKppnHFBWv3Kw?=
 =?us-ascii?Q?ZUeyDkgxxZMr2GY+Xv6/ucnZGYU+DKH49aCjvY/h8gJ0dmie08OL/UhhoOTt?=
 =?us-ascii?Q?EMbTBw38kqt/We/3Imi/JosD0Qh/wXRTdfRsQdx03LmT3l4q/QZ0nUAs7J+b?=
 =?us-ascii?Q?XmFfa4N4StkSDrlvf4lXk/0tDBSGj5/TTNqgGZDDxkdtwI2OneurKzlKf5ry?=
 =?us-ascii?Q?eVcHfa7Gzeq4xVZq0buNNGtLo1psIRYNGrBF/wQZ9jf3P0QkDN+UyUCe2Gxf?=
 =?us-ascii?Q?GvxRrBWqU30WozSb2LByV7f+FlKb4xS+7tNf5TppXDJ7EGxL7q/RlW+w3Pia?=
 =?us-ascii?Q?af1NIVuaUhcdtm4Rb17jPWxP/lkytwYzovqHUwUs6WNMin4FicdT8AtN7MiC?=
 =?us-ascii?Q?vzmqRQ2OumWnd73p2lgRKLFx2l9na8TOQFZua/fKXyQXCE0TmNZX71XUpMn8?=
 =?us-ascii?Q?E8fydsJNd3h9o/XtdgKjjn5swL7esaSBmsarCFtU3xeSAHRBatXhc8RO+vqI?=
 =?us-ascii?Q?el0PJfHmvDbaajK2e0anpkTr+Pbe6Je1b9kcQvbO46GRMj9aPQgRQLQoS2cQ?=
 =?us-ascii?Q?uOsdHKuJQaAI1qpEdmrAgJRnrxgGHSOp0tbp8uvC4J096Rea6P03fN2Xdinl?=
 =?us-ascii?Q?3hgzW9JOhgIzNlSeMEQL7m35oBpWjsVQdSyMRRZcCykFqDaq3O3T4umKtVdt?=
 =?us-ascii?Q?ps+T8LMhJrCl1Lcldr/cZwsPP9y6f7CC+DXKuyW+d4L+YPOSyu+kW5xK8EvH?=
 =?us-ascii?Q?WoVIKRroWtmQylRe8qzwNGVLK0ik2a/G7+1hJH+y0GmUnE+wuvy163OgLTmw?=
 =?us-ascii?Q?mzwmii4528sNV/qNKijdUpm0NTxYgvecnnxR4qLaKJqmdlsw5ZR7KDuinxuz?=
 =?us-ascii?Q?tatGmEriplmZ9cMIow+oU+gllXoVnzVxq7hX5vnCLcI9FGPHAMrFQA1lKChY?=
 =?us-ascii?Q?06Z4EdcIPtYf6Gup1e/io5+FgQqguy5IAPot?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:41:57.9094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f576bb60-fb0e-4cd6-bdf9-08dd8c930219
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0878

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

