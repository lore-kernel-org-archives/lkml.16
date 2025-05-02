Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2094.outbound.protection.outlook.com [40.107.249.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E4A2566DE;
	Fri,  2 May 2025 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195996; cv=fail; b=ObXDn0lv6fctvCpqoxF0ueLpGzB4uap9oAm3Vp3w5Eluor0hfGtDl4dMQ5wBCBykqhLs819Qcei9vifa8feMMCFAS6dKm/aiRbdzBwI0KsnKIQCPWtV7KKMQXwmqRI97aR+W2dLHFr67oAXZd/38GqtVtxk4ZD3sjjJ+OLxCo4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195996; c=relaxed/simple;
	bh=bietNdYSystXTWKQwbeuSvdvHHIe1mit2XrXsm+/IMk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=epLPu7kbjCFZ/ir1tfad9lttuNOBoGEWpYv010d+z551sIU9WPBEs/mr71HH03qtrjZycJez5Jn3FtDvcXYqPjzA+wbDSp/VrPhcuHx+h/AYj+zjpEoguy2h+eyAdtsMPo25lFrivkI7ylH8CLJhBqbyG5vqwzeeDTcncK6Ydj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=LT805zBg; arc=fail smtp.client-ip=40.107.249.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="LT805zBg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfkN2S7WwUxyFzzJXsCyWo4mhrjc4+y8QJQk0vPe9rEs79iLBc+SH6EwFGvXzQ30+wol8km1PWSVZNbJmJqZLNF+8ijyu/x2Y8sx2rmYK9iv2vwfMzO31+ay7k3H7WM4S1cdT/eBaKMLpcyKkaBo1u5XK72z8S4Ojwpv+AOvDgSrNg78SszjH23IlXCGj867rNhuBq4Ql9YzSrS9Acx1qWnkp5ztdj4fID4HW/YEtojt0ftc8Fxvh0Y/+waCP763dLISzmlY3U9M1Y/KY4pSs6+DZq8ixlJawJlZnxJahaFWXhtrKwNpTCPv8RyKwJhwwK1WrAyodnEq3T68T36gTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTk7+Lxx0DFutSWzA4hI01BWCTfF4mu7j2qu2i4uALU=;
 b=Ui99LksasLBDzeo5qWpuVG14XmLC5YhfU9Kz8Zvf4VFW8n7Uye0KGqaS3js1IKh1RPsq+WgG05dgAFy1xkYOywnZ5bJB097sq0rS9d8KMnCIKaKD6RbE0Ltv36gRNY7n3tDzuSQC7sU8P+picrwPgIDiElg9haMsr2V6EycWQ1lmsuB0UD3xGrwLgrF9iFcb42L9PbNOmsuQwfgnbd5sBhiinDitMfe2gD3paiCI6Spgyh28sEg1nczC2qNJpGbhYM/nNs3EFoYHGuYIOLmDPDDeBSW9Z6CYRpISAYdVtFF+6ubFIcMzP4zL1EXsWXquMA3IapBKpZHWvXuIcpbz9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTk7+Lxx0DFutSWzA4hI01BWCTfF4mu7j2qu2i4uALU=;
 b=LT805zBgDbc9rH366WhEyrdJ2Wk94tvRoT9beQ/wK+par2743rFupZWnT2bA4Jj0acgzbu7K+j8Gv+hweqFqC6PPJi6gCCiQMTwL65f/gLiza7RElGnKFZix/neenmaUvaiQsZwG1s4t7LZGs9LOR44+dYMnK0bMO+MSWn99PpO2njpQUETqPZNZVnOOnup9iTjlKPKUJChxQnxOsNOvNq9Sa/R7yfy11XoO9DIlD2i7LJdKYzn6/4bYTaijLCyXLXWOgPaq7bKlNfTebv0w5QzBN7eRidaJB9Ij7Whd6S+7a2IAnbby/KtfnktYc4J/shHTEGG7wYj2D8vDuaTuBw==
Received: from DUZP191CA0055.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::19)
 by AS8P195MB1368.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 14:26:27 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::b8) by DUZP191CA0055.outlook.office365.com
 (2603:10a6:10:4fa::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Fri,
 2 May 2025 14:26:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 14:26:26 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 2 May
 2025 16:26:25 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 2 May
 2025 16:26:23 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 2/3] arm64: dts: ti: k3-am62a: Set Critical Temp. to 105C
Date: Fri, 2 May 2025 07:26:05 -0700
Message-ID: <20250502142606.2840508-2-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250502142606.2840508-1-d.schultz@phytec.de>
References: <20250502142606.2840508-1-d.schultz@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|AS8P195MB1368:EE_
X-MS-Office365-Filtering-Correlation-Id: c02ed374-dd81-4ed7-9c3e-08dd89855261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXp1WThnTUo2ZVpmN0s0SjZKd0JLMVoxK0FCcWw4NVJEazFwK2ZtVmJsMklG?=
 =?utf-8?B?K3hYMUVYSy9YeWQ4bzR3MlBXcGN4ZlhmKzE1ZnNaODdUMlJWTkRlR3B5akZE?=
 =?utf-8?B?N3Zmem42d2ZTM1ByZHlBdjJvaDRlWDZaeGhDREF0NGlsZzB4WUdBaWZSMUtN?=
 =?utf-8?B?SFpuZ1Bad1U5ODMrUmpxTllLMFJBdU0wM1FXanVWUjhzaU5VZW00Z2ZDMVJW?=
 =?utf-8?B?Q2NuYi9GYkV4TzVCQ3A1dUlndVlyYTB4ckduUms4R0lGRlphcXpZQmlwUUww?=
 =?utf-8?B?TjVHNHhxZHBoajA5YlYvZ1o4Zzd3UEJ4L0NvdXcvN2hiRE1yaDBLM3pKa2wz?=
 =?utf-8?B?dVMvTWVVRFlqZzNrY3M5akRYeG9odXV1clVWNzFkRUdsVUZ6OEwrRHBHMWQy?=
 =?utf-8?B?WjBOZEszSC9sUmhseUwyTlVQWFM4Q3lRUkwvY3QyTGtPbDBKYkZOdHRKY2xB?=
 =?utf-8?B?TW1yNm5Fdjc0eW1vSTJnVWxObUNRRDZUaElkMzNGb05VajJ4NjJxYVBENlVC?=
 =?utf-8?B?S0RuV1Y2Y1R5RkZTVEhNVHkvcVFzZ2JyNzlWNnplWUdmSzU4Z1dnTlBWL2d4?=
 =?utf-8?B?eGVPMnZvZldyRUNyeVltd0tHc3ZmYlQvNDZaTUwzcitvcm1jcnFQQTVjRE9v?=
 =?utf-8?B?ZWhxcEdkaUxJcTlkYjV1enZJc2lXcEZUQmdMTkNMK1ZRNjlrVkdQTkVxeEp2?=
 =?utf-8?B?WmNoYXhOUW5HWTVRcGU1eGExWDNLM2tQU2xPWTBYN1FybDQwTjRoaWRSK01E?=
 =?utf-8?B?clRoYmFyd3p0R0MzMnI0Qzg3dXVBS1JBdWFhWXlwb2JtNFY5SWdFcmY5QlpH?=
 =?utf-8?B?ZTRDRzJNeVRpMEFuMUlrbXNFYjFLZ3FyNzNkZzhSeEtkRVVmYng3dXJaUk1y?=
 =?utf-8?B?NHlzMU1sck4vYXdtZHBpSlNxV3dTZ3VxeGs2UFhQditNbXVlY0JIVmtVSWRm?=
 =?utf-8?B?Ykt5WEVLcS83VVdtUmo0cFNzWEluU1VtdTRjM2lyanRZQnZadGRpWVJVQk5N?=
 =?utf-8?B?bkQ0UmRHVXpkSFFhTmV6b2VTU2phdGVMZEZUSU41VEczM2VDVGZVcFlDSGRr?=
 =?utf-8?B?RkN0WERRMSsxU0ltM1JRSkpJZi9qRWlWRzhaRkJJSm9BZFNKa0h1VEhrUllw?=
 =?utf-8?B?OERtQjlTV1lpYlI4N1J0N01wcEZCZjdwbFdNbld0a0ZBbUlSdjBtZHhxVS9r?=
 =?utf-8?B?UmJDUTIzMVhZMFBhZ3l1RzFhbldrSUlaVlRvMVdYcWxaN1I4R0taN3hScEVT?=
 =?utf-8?B?VXBaVzd3WThpQ0IvQndPcUsyU0xGN3VzVHFFU1EybnIyeVIvVExSUVhUZ0Rr?=
 =?utf-8?B?bnQvRC9BR01FQWhQUDdvL0V6eHFtOVI1NWkvcDFmckdzVXlXWlRQbUQwVzJE?=
 =?utf-8?B?NXlzL2JBY09vNktiZmVDTnE5Q0dRRW1zOTBQUG1Ra1pPWjNweFYvUmNyYVFY?=
 =?utf-8?B?YTZsaVBEWXZwZzhVbnV6VHR3MG1UMHNxU0ZvU2VkU2RYekdBSW4zWVZ4dEZK?=
 =?utf-8?B?M0FyNG42NG96LzRtSW1qNE5CRjQvYzkxQm1ENkhMWVhEWUk5S2hDcW9WTW9a?=
 =?utf-8?B?TWg5d2U4N09MMi9ZUXExb3VZS2E0R3RjRVlhYkljQ2lYS0VoSU1NcnphbTB4?=
 =?utf-8?B?ZkY4cnlLbEdnY2Q3dDRBRFg4QXVVK1RvZkNjdXIzS1dBNENSUlhvL0VBWXRI?=
 =?utf-8?B?YXZhN1pNSzBZQy84U1F1eDA4cDdNSmh4V0ZsOWV2ckNRRFZrWjlKclN0bFpj?=
 =?utf-8?B?c280cmg4bThYZVlZU3ZXZHMzSW5KWTEzcnNxWWFLVzBUWWNPS0ZwTGNDU013?=
 =?utf-8?B?MW9iSkhhanM0S2thTDc2YnkybENqRHdQdjVnb1pCMWZYVzJqVmhtcm1hK3lH?=
 =?utf-8?B?QkhzV2E5QlFPNENHSk5SdjZpTng5MlQyYkFVaG14SWJlZ3hycUw2WXV4bVRI?=
 =?utf-8?B?VlZ0VThTZDV6NWVyRS9SSlVNYWxZWGZNQ2JuUE9jMFl3NThaVngwWjJIMmpm?=
 =?utf-8?B?NEpjZE5WNFI1MFZtczdBcHpMbUNOYUxXWllPQ0ZWb0VtdkFSRnFYcDNRbFUw?=
 =?utf-8?Q?Q5gCdL?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 14:26:26.1566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02ed374-dd81-4ed7-9c3e-08dd89855261
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1368

The AM62Ax SoC supports two temperature ranges:
* A: -40 to 105C - Extended Industrial
* I: -40 to 125C - Automotive

By default, use the lower limit (105 °C) so that any AM62A running
in Extended Industrial mode will shut down safely before overheating.

If the bootloader detects an Automotive-grade device, it should
override this and raise the critical trip point to 125 °C.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
index 39ff9118b6c4..40dcb9bab965 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi
@@ -19,7 +19,7 @@ main0_alert: main0-alert {
 			};
 
 			main0_crit: main0-crit {
-				temperature = <125000>;	/* milliCelsius */
+				temperature = <105000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
@@ -50,7 +50,7 @@ main1_alert: main1-alert {
 			};
 
 			main1_crit: main1-crit {
-				temperature = <125000>;	/* milliCelsius */
+				temperature = <105000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
@@ -81,7 +81,7 @@ main2_alert: main2-alert {
 			};
 
 			main2_crit: main2-crit {
-				temperature = <125000>;	/* milliCelsius */
+				temperature = <105000>;	/* milliCelsius */
 				hysteresis = <2000>;	/* milliCelsius */
 				type = "critical";
 			};
-- 
2.25.1

