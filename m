Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2138.outbound.protection.outlook.com [40.107.249.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76E01DF25C;
	Wed,  7 May 2025 07:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601233; cv=fail; b=fXs1Rq6wIbPPIT6p4tvPhTWhuf4yoNLM8QxrOXaLtzzz2WTPmO2BRyhq3Conz/0I4mi4lSbITRxVqgboJObkbyqa51FIBcFRQhcQJTP0W1gWOFe9a0gYr724WscpMcJufO3bH8cEZWJYNUfzrPtOzqSP4gFzCHQOrTyzgK42cIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601233; c=relaxed/simple;
	bh=M49ANYljnlfNnC9fSoaOu+uAofqEfvstAjhkMgp4Fi0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UMUoCbGVkZsxtOW/P038+wxkK3DAKDst1b9tXx7LO8VRcbQ9YLpQ3oclBHFNmEQ3tjOqNySUPF/TuDvOlxfP1A79z1LpxDwUUPk89D37x6CHVMAyXamEjgksL9oMXqVTuW8tFlg8ruGWvKg1LfVT/cnuo0Z0hrv0alTgf6hx5qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=u3J7uLll; arc=fail smtp.client-ip=40.107.249.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="u3J7uLll"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsAF1stljUMXV+SVuoLNT1NKMNByi4SIb7t0E0Bjy8AKUq3UGColW283Klq6SMVEi0U7VeRib7aq21MOGmpACqVPIu5pNsLZ/GxEjMa/jqZqXUF+BSvHUtAGG5zC65YWtrgDWf7lwcfk8qdXsDrVW0xkmPndn+tEKLqsngIioMYiu6uGejj7tzkqb6rV1uU4y/UbsGQEzAobqvp2vBe/EbmALTwf6GlQjhD0lpQLsMyL+eGmtojzJ2GHNpViK8FWMjinKcPcc7tkeIiN7/w/sBe8yGFbrLkyQJKjH7N4Yf23XWubfKtha9knOFAafLxw+uLo5hd2VaJ+KbnjX8QMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68X3+FCi2J+6OEaeRdEK7CsW2FRCz5EFHm+EU2wmFls=;
 b=eLx/to4VAIRx91jVWQ85rGgkbp2QVEfSeXn/AuLTQbU76SkYLYBWWAkHitAn6OE2P1tXjZDD4V1wVHe7K/ay1wYg54POZ+azG8k4+v/h2lRy/yFEd8KehvxD6X0bez327LEiCo9W5bwv/+k9BfeADvAY8CiMvvVH+WqmS2lYps0W4SMen+yBmb0RAF399pASsOvj9N/78UD/dCaK2WAvCIulNBbl/mbhwGzoehnCqu5fZ/rHV7LcPzjNKEIT6hRhd1jx+rihDwvQnkBCchV41cmoY+p4xV1vmEZMj7fjTs/b5IpYXtp17bIGXKq6CH/tzn86jSOpcttcTVdB/3AiaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68X3+FCi2J+6OEaeRdEK7CsW2FRCz5EFHm+EU2wmFls=;
 b=u3J7uLllbl5QaL4sulZzNHscyqYVkjD2oGvDFG6CrVkOVoiBfZDpSADr7BdjiYJiR0rX6E2j/w2kMJwLwJ+Mz/wPGKU4xhH2+siYkxov7gx0TqNYU3I/sTP6eo+pj0uzfi05B2KdmMa2gsGADTzR6pvM4mzAglOlblAPuTbhhVDJNq+3K7qk9ebH8ahDxdaQHy+Jukp0Q7aPeOI1kwBGhxKPwRD3yKkG4+rWpzbU8RbQep5m6g8nkG4vFEN//1rmcIQz5QV3dvNzXkQ+tgXyZ5NmxRXRGTGGG518yxFKdYUtCNhSL7A56zpBOCzuHXsKdheDjuL576mQs3dmfEBB3w==
Received: from DU6P191CA0064.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::24)
 by AS2P195MB2171.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 07:00:27 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::a9) by DU6P191CA0064.outlook.office365.com
 (2603:10a6:10:53e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 07:00:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 07:00:27 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 09:00:26 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 7 May
 2025 09:00:23 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>, Andrew Davis <afd@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v3 1/4] arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
Date: Wed, 7 May 2025 00:00:05 -0700
Message-ID: <20250507070008.1231611-2-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250507070008.1231611-1-d.schultz@phytec.de>
References: <20250507070008.1231611-1-d.schultz@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FE:EE_|AS2P195MB2171:EE_
X-MS-Office365-Filtering-Correlation-Id: d944031f-b46c-4151-e52a-08dd8d34d8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nv8lmvlFVnJmNlrLRuLMqz6b4VOl0mPh8oYjRZpbXKoL+GVdPYAYG/FmbWYk?=
 =?us-ascii?Q?sCCUWEDUg9PlV23IQZbwJBqKO8yGRHbhchnfQRBJJNbFrv7hl17Xat6W5wSf?=
 =?us-ascii?Q?CNmSkjOGH1waU/hMYuNio4VlbLQ75BbplQFeqg928i/LbxNwrVrWld/7iAgG?=
 =?us-ascii?Q?sJsGU05lu4X+W17rK83TFZzIrP2403jiIGKYaqZL71+ZeKloYUDikZkCMs//?=
 =?us-ascii?Q?sirZoorwcrktCAly9iEOJxh43E6zOBujINewuTMV5PUEsbfYz0ZMHBb55frW?=
 =?us-ascii?Q?/VINchZNPbpzjSc+5WzOwolVJKsn3+BY6DSOHojI+YQ2c/bR4+A/aUVgnO60?=
 =?us-ascii?Q?P+BriiypkO7aWcx5Qf5mxGYpBqEfP8Yx6dRrkowPQmHRqoWedRu2XoCrRH+2?=
 =?us-ascii?Q?IefUyRFnqSwYVoV27M60ZQ+rQyapnkG3AOvkLJav1zEUIF/KtPgsqg4lcwFW?=
 =?us-ascii?Q?V377K6zJo3jh3Uk6xiNu63N/9fucmKjbAPabg9vceVm+vWYT4X1+HSnQzkOV?=
 =?us-ascii?Q?qTMf/+nwk7SUWBDIJMF+Oe60+hKd37JaDtcEIBO7UnYDXh+y8up2SCd/R5GW?=
 =?us-ascii?Q?cY1OYeW5xt7sMzQcbtTq3WHn6+zDgPGwejcIwCFnM6yppxqwiPQAfCstOHfH?=
 =?us-ascii?Q?XSkCluo2oVm9SF6PXUDV/wmu94LPeSBj7d2fJR8i+pYSsYbEuxFI48Qvr661?=
 =?us-ascii?Q?zspp42Gu782oukMepRULldOGJIzwu8Huyx1NCurJBF1j/zBC6uEZRkj35EEB?=
 =?us-ascii?Q?jQXDJG3HLtG4jVGl3RsyfbW5BRt9lQI1ZQrOG6svbombUelWjTPLqd9JSUzJ?=
 =?us-ascii?Q?K5jbdryFNtwmBH31e6RCa8K+N61ml3C8FqqyMdNh0GoHsHe4S/7D4Ym36o1x?=
 =?us-ascii?Q?P2bfCIWd5lKToSyA9CiNBrFjRU7lnk+toIDhhjfxwvNXfOSOe16/V/q56LF+?=
 =?us-ascii?Q?RS0Sp3vCvB+AIycORTd3x4dkz3Bg3xlFBK56rVCKPsvA9hZPFv9L+1XOfJlS?=
 =?us-ascii?Q?rQSHo6qcDpcjDAUDOrEAvsJfr9a9bgv72zLbZnbLaB4vX9NExGCTDaUKfsVk?=
 =?us-ascii?Q?fvxS1/0C6tIC7TvyjXUz2Sse84CsMpuegaBdS1LthHZME5asywoweohliEHI?=
 =?us-ascii?Q?KpZR+363qYVWAdyOt0jLv1kr4MWLsFqxzuq4pY9iEHQoEZRKHaRslYaZvtN4?=
 =?us-ascii?Q?RH6QpYUMPxJWwTDG62KKgw+ebkjjshlbhsgG+OrP5QZ3awp02Ssc1FpfaRyX?=
 =?us-ascii?Q?AZ1lSc954VPZMK4gLRQs7eMD6Ypmozv0wFIdiIvLsIroI8LURfz7abPDDIaN?=
 =?us-ascii?Q?wiKJapHz7eJA4c9t0OIwo4k73eUkm33NqLq782tSUpG08hVxtxNmm12FZP+i?=
 =?us-ascii?Q?NkOZDBo3z5GIu+ZxtvxXIcWYh3f1LHu9OfZtdB1dz8qcXmZj/DKtDfJzFkmW?=
 =?us-ascii?Q?PF7fl5p7kzn3Z0Q/l4ye1AuoEvCi8mzmnGZPVCxHhNoQOr2Ho0q+/CpawLWr?=
 =?us-ascii?Q?0RYJ4RzlqgKT99w1tTjv5Y8dklpn59/Ve4Ty?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 07:00:27.1200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d944031f-b46c-4151-e52a-08dd8d34d8d1
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2171

For every remote processor, set up dedicated memory regions and
associate the required mailbox channels. Allocate two memory areas
per remote core: one 1MB region for vring shared buffers, and
another for external memory used by the remote processor for its
resource table and trace buffer.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
Reviewed-by: Wadim Egorov <w.egorov@phytec.de>
Reviewed-by: Andrew Davis <afd@ti.com>
Reviewed-by: Judith Mendez <jm@ti.com>
---
 .../boot/dts/ti/k3-am62-phycore-som.dtsi      | 35 +++++++++++++++----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index 55ed418c023b..3075979935d5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -64,6 +64,18 @@ mcu_m4fss_memory_region: m4f-memory@9cc00000 {
 			no-map;
 		};
 
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9da00000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: r5f-memory@9db00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9db00000 0x00 0xc00000>;
+			no-map;
+		};
+
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
@@ -75,12 +87,6 @@ secure_ddr: optee@9e800000 {
 			alignment = <0x1000>;
 			no-map;
 		};
-
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9db00000 0x00 0x00c00000>;
-			no-map;
-		};
 	};
 
 	vcc_5v0_som: regulator-vcc-5v0-som {
@@ -240,10 +246,17 @@ cpsw3g_phy1: ethernet-phy@1 {
 };
 
 &mailbox0_cluster0 {
+	status = "okay";
+
 	mbox_m4_0: mbox-m4-0 {
 		ti,mbox-rx = <0 0 0>;
 		ti,mbox-tx = <1 0 0>;
 	};
+
+	mbox_r5_0: mbox-r5-0 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
 };
 
 &main_pktdma {
@@ -386,3 +399,13 @@ &sdhci0 {
 	bootph-all;
 	status = "okay";
 };
+
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+};
-- 
2.25.1

