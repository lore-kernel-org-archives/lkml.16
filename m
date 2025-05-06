Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2099.outbound.protection.outlook.com [40.107.249.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0E27CB16;
	Tue,  6 May 2025 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532549; cv=fail; b=fWWoncS+XSUNB9qlCXh0yCgyc9g6UZDrBEcXgrRXcjKWEf0NG4FUinsFNs0siSL8QqkvaKzCCe+bg2DFKSzzrtRE8EeLUQ6SbMk3XoRmhEmD/Z48PO6c66C3+0WbPYJ9ajC+yyw5hiV87i4wCOkjXFfQSYUFI07fKHUukN7+UTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532549; c=relaxed/simple;
	bh=+MDwd1mlgzG3wn3rqFDzsaYYo/87TZRMMPG2Zfk4+AI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k2Q7E7rSU4Sw7KUcyq0q9kPYEcl3PE6UZv3itGlJGXhTRBBeTxEsqtkTFPCXWJwXPl89p4aPNZWcrIa94wSsSPOtRjqB7R7hqCfv97ftsLns/A+2Ca1StBlc1Eiik236mm8bVCVLB62q8eib3a60+0XncYEDWCMgxbIPrj5zgho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=FwFESkHf; arc=fail smtp.client-ip=40.107.249.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="FwFESkHf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwOUAY+0kPZxxdeoCyiIdd1pMYLVVx2uJJgagBSUl//ZtdWgGLNXask91VLgxXRoOrsXPwmFrrNyRof8fuf7YcrGv2iDhDxSs7h6ChuLddZ3g9R+8J7044ZdMR/9QVCypGGRqux0IETNeclplJAtcf9eJwdtYRfca3K0JH/sBH8KF/CDvqMXaz3+pn5XcdeiSjL7arEDdDn9NvnjZ2bmbH/YNoYMgUoNbAgl8al5MxmI598StRlhga4KYAD7vx92qJVfH/CnrsgKG/bdXA1lzGE1s5mVGpkveiH+d2EnWcCiLTcZ4D5lizH+kFi0Msj6tQtoJDQXpL4WyvMoWYVnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7kxWXiLME5LQFx/53UCWbea9tazAY8d+qD/P087/0M=;
 b=y70Wc7ZwYiZv+uGZ2seqeUQ4mQL/kU8+kFqSN6Kss3uQLSH6y/a0UywAtR5Tyi+wJU4iNeCTNi4aFtEnxlMyCIWDwVqf97xiSKG7F/5XbmvSZLMaSnfpY8/qRX1TliJhiqIzitVGiyDdNX0iP/JinbRG0slSDuOlosLDJ4g+h1GZ9Qp+6xcXk8DH/hrmIX+A+RVqfyHxMky3L6St0CAtvz30LDd3b3Gd+hVF81v1/YZFk0H7xZcUZR5mjoayIHjarDr62N+7Rr23/kYiMSd1tSCOwtkacPQmddd8x04KC8QF1ffVuG+J5MIMFy2wQZ3zB1x52SnnhFGL+O0w3YekNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7kxWXiLME5LQFx/53UCWbea9tazAY8d+qD/P087/0M=;
 b=FwFESkHfnbyexjESAEW2dCdZIx42M5c52fyC3rZU8Qk9upzu01jWqBCfd434+CIPxQrh2r4CV/Kezyq5HqhzGJydyxPtcVsdqgqYizm05AglZzdmAP5CLpurvu7zFfgLAitO99tYBX+a8ym/h/ZTO8xgqEY2WGO5tM9XKksu9XlqF8hnWXvmWaNwFK1i22HorSxprxWKdy9eS7Hl4/Te+6jy2BnEKv/yDsRthedAgve1KrKjzRKe1tRj4+HGlfarFPQilE5NptfuH7IO9OH4SPS0SQHQjkxgxX3BLaAIpcUmkKglxO0Q2WCQmgAoqDKsEi2LuIA9fbhNT210SXlvMA==
Received: from AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15)
 by VI0P195MB2507.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:24c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 11:55:44 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:208:3e:cafe::c4) by AM0PR02CA0002.outlook.office365.com
 (2603:10a6:208:3e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Tue,
 6 May 2025 11:55:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 11:55:42 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:28 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 13:55:25 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 4/4] arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x DSP
Date: Tue, 6 May 2025 04:55:02 -0700
Message-ID: <20250506115502.3515599-5-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506115502.3515599-1-d.schultz@phytec.de>
References: <20250506115502.3515599-1-d.schultz@phytec.de>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|VI0P195MB2507:EE_
X-MS-Office365-Filtering-Correlation-Id: 9019b1f3-ab95-4203-60ed-08dd8c94edca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gCo5OqFdR1QzBwNXC3IpN1RgpeBnHcC4wr5Mt+qDkHxc5jVZS8kvDTjG8Dla?=
 =?us-ascii?Q?7wviYB75geEzYS1cR+LxmDmMjQumzU6IPt+O+O7/DfEfDmNDZeVFR96EQWZ1?=
 =?us-ascii?Q?RmXP3TgVwEZCMoU9CNrKfL1KsKKzcj3QNoqJWrQPFGPoabzyfO146l7P0+m9?=
 =?us-ascii?Q?5f9H9CalcGlIB2vRsjrudumhDCtkwQwKK9xTyu9M2HNArP3Ob3CCUZOP4zzP?=
 =?us-ascii?Q?YUwyZDbqLEY1J3pZb1Eozw7qCn8LnnZ1Hy6HIdKY4p+cOWlES5JepYBbZ1W/?=
 =?us-ascii?Q?f+K2b85F/XVhKibxeeTmmhChTsAzDKp1wEa0S9JEZ/DajQV6zRQ9SDvUNkXz?=
 =?us-ascii?Q?uvne+PAdYOVE1Euq3Ioc5g3QtyKhSNFMGuB6EgoWJMb+yrfZ9iXxZlyz1O/4?=
 =?us-ascii?Q?kkKlRQyJpKhzg4gK2QQx6lTh00BEYA6J3y4Smu996of7OlStwDt1OGsILBEP?=
 =?us-ascii?Q?Ia5d4/Kjgv1vKieAz4n3Ev0eFpIfqM8svIcwDefgtP8CKJsV1dCvKPgfmaTi?=
 =?us-ascii?Q?QGxCNL2oJMtnAordkgJx/bnwQP8BLf7pBCJxUYoNSqXutYij8OtkgwsYmtsd?=
 =?us-ascii?Q?C4+i+mpkU6cs8qxKzxEJ0koZ9cWwbhyJYQCbL93YhQIeagKHvtbkI2yGexu7?=
 =?us-ascii?Q?/YdjZQJGun9OdY1+sXjhbs9w2PR2z08Mj7T2+H0yycsmHPMoE3KuKkFigJsc?=
 =?us-ascii?Q?LH5wgTeygwrSajgJ/5dwqQw5om7x2qM3uUALFweHruUL25GxHI/3szHMhJAd?=
 =?us-ascii?Q?5E3GDaKN8AaV6MpI65DjOfvxfy1xw7Oq37KrZkRxLoISE3XOYc7Rcom49iXD?=
 =?us-ascii?Q?uETLviwm0VH0rT05DHcb2Jaf4Om+P+U3C0xauO2bcNkFz6r9sTqhp6rjK8zC?=
 =?us-ascii?Q?h4fOPQ1NUjE9YOCVt8xEs+1gOPA62cSilJrbvbVtCofdmbuwceT9AzpWH8wr?=
 =?us-ascii?Q?aa99k1on/wBcTpvg+p53hlzRRzHh53MSl9esUqz1wcg6SVxcN666nczhP8m6?=
 =?us-ascii?Q?BgZ0ynr3rEj34Bi8iY3M/hW6DRMgC4ZSGjkwZyKKP3ZUhZO3k88OE/ZJm9J2?=
 =?us-ascii?Q?F80lUYLxFCmfcYw8nECczHZviBIXDfg3JiqeMz7+QzW1vUXcq2paco5x/rzX?=
 =?us-ascii?Q?BNT6xBs1WCc5Tql4/SrGTUKLpnEbZhFJQk/Y325Yl5VY1528BP6ZZQlneOQZ?=
 =?us-ascii?Q?BrCMeiVofZ60DEIcumTWhOSdm0LcGUXJyelNETtt2mUea/0VzzRfzFvjg8iH?=
 =?us-ascii?Q?Eq6MT1uZZFkOuKzogl0qysl2OK4uPEs6xrsRLaPEOyH1s5mMYT2pQsg2sPrF?=
 =?us-ascii?Q?jYtxsf9imRXc1s+8zwlijN/O5+0x3wqziEbJErW5tVkK/BXg4FFCybLGdfzw?=
 =?us-ascii?Q?5tOBKHqIOazG5utI3imxoOapUbI2EJFYuRYcSG4BwhBETUVhsGjt8aLJjKEa?=
 =?us-ascii?Q?nqImsqxYm9Nl1PAOfWyN+oEyVMEDu8T6sFR1xPW4yMH82KIeLdkGfqUo8tUr?=
 =?us-ascii?Q?1nQPDrbEC2WJ18O8ksWSibP7PnCEdD1iiEru?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:55:42.8535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9019b1f3-ab95-4203-60ed-08dd8c94edca
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB2507

C7x DSP uses main_timer2, so mark it as reserved in linux DT.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 343118af448b..b6c46c410b78 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -371,6 +371,11 @@ &main_rti4 {
 	status = "reserved";
 };
 
+/* main_timer2 is used by C7x DSP */
+&main_timer2 {
+	status = "reserved";
+};
+
 &mcu_r5fss0 {
 	status = "okay";
 };
-- 
2.25.1

