Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F33207;
	Thu,  6 Feb 2025 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851781; cv=fail; b=CXsK8/b75wDVo45UGquWzHykEd6LuWg6JLbNxmVlWg7dguzGZwCPFwLXXsKY3gmjNaE7zRpL9HxtlA3J3k83+3ArfyQhzECjB/adVVOFqm3ecFj4qJGF1z9kgSrS3TIroy6AnGQKtPxbfHxur8aorVlolUkldVBwFhoESaxaeEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851781; c=relaxed/simple;
	bh=roFIL6wpFBpBqKDTYR5yZI+53Iz+rNX8beMhR6+GoTo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gqoEYCXQxZfF2IpulyRPwOkNu2n7fmvWmpXgQpcQVQomtOm76OXuzOejfoH3l45fMhA7kGsdpRFMaVAVWg+zh2LImVoD5os0FiLM5v9sWDxCbZ6JjLYmam98sStB7LFb9UMvVLzUmB7rd5Z+Kt/BfkwvObYPpE0ppSWyGxEaEmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QQHGYtWi; arc=fail smtp.client-ip=40.107.220.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QQHGYtWi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADYq2EqWFU0KI15FaMiOoXZgT37Oa4NOvVWH7LFE+1Ga+XchEJaV8hno66P6O6AqKROexI3C51FpC+i0GY4Xa1U1RkyCFfmwPUBp6tUm2WhOQL/P3GM4RnjMb/m8ZQff/v16UgStQOfdPMA9eGqRirol30DoWoHidBcnSMNLJu8pXVG10mktvt5iv9EVdNIrxf8OIYdNp5syhMrVw3NxAOgwAcF72YgoGMOcweqG0sMwxsFtvMvDMW4ENF6H/zYXDoKyXYwlgiSpdsWxbip4Dal3gmyMLH0zd0+wU/xC4PSN893Zo4mf+iE6HqcS4WwmcX/h4PkxeoQruRsfsIR40Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oQR9uwzRE8UYqQSasdvdaaDx+uR/Vft+81ABp/ifYk=;
 b=MtG4f8a82VB1+kUyPzhI4vd6qX2WgCx7joESZfvE/9tLxAAoQBv95R9CnrgX7vwVE+1xyi2cKNN4AXVQLPyVmzdpOyHinc8laTTsJ7MLH+H1RKpFgLcD3T0Nez+rlAY87TFXKfZnf5k2XgmnaCUUd/zpzaNtvPZ1xjmMm8gJ63+IZIYuVua94ll+ni8cXb9iLETZdXZZML+nCR5BSWtvccuQ3zMJn+o7eSDiQkk3kizTxaxpfnOJSfUUh6VJ4oHQAErhKlKlspzyTUT/dvSVhGhBUTPWbatE8j3xuUQbbFKZ+LCWa9KAAQ90vRoFpVGTkXi8LXomsoCjZtBciW+Yew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oQR9uwzRE8UYqQSasdvdaaDx+uR/Vft+81ABp/ifYk=;
 b=QQHGYtWi5n+ReohLQam9hlj6TLhOrSzHBJPrMg3JKUj4zajZ5+3rXFVDuJAU3nE3KJCeKK9hIZ1YMV3zaQJvU8Ha5if87PiLomrUiX9kSEB2gi74hwupop7TM3Sxut9+mkmAWd0+KSbe3Au/o20nhWnbb0ya4VwMF49/QyZYEoU=
Received: from BN0PR07CA0019.namprd07.prod.outlook.com (2603:10b6:408:141::9)
 by DS7PR12MB6024.namprd12.prod.outlook.com (2603:10b6:8:84::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 14:22:56 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:141:cafe::5d) by BN0PR07CA0019.outlook.office365.com
 (2603:10b6:408:141::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.22 via Frontend Transport; Thu,
 6 Feb 2025 14:22:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 14:22:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 08:22:56 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 08:22:55 -0600
Received: from xsjwillw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 08:22:55 -0600
From: Ronak Jain <ronak.jain@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <nava.kishore.manne@amd.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ronak Jain <ronak.jain@amd.com>
Subject: [PATCH 0/3] Update firmware dt-bindings
Date: Thu, 6 Feb 2025 06:22:41 -0800
Message-ID: <20250206142244.2553237-1-ronak.jain@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ronak.jain@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|DS7PR12MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d2f12c-8011-49fc-2c07-08dd46b9c056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sImeof4N8gx4rn04771ahg0HPOv0wv23NXuZmhrE6nsWAVU1jGavbIynjU7I?=
 =?us-ascii?Q?n8fr7OPWFvAcNbhwQ62O8UCWh3U6GYKu+RUZzMLhY82+wmKGH78BC0f/1GP0?=
 =?us-ascii?Q?UZSeRH93rGjtD5wEvX+iiiC7qErOmH6EgEePvnf0OUYeUmpiLb1u2ssB+E6N?=
 =?us-ascii?Q?iJ04Cty43tKfLCTvSpd/p82W2MJZrBc1asxJKQR8nIaJcd5b0Dzs/ZxQC4RR?=
 =?us-ascii?Q?Fky17JYSNCLKhhr1IaC1moRGjFpeQfqnQ5Zj2+rTcKk0K72obTW5ftY/JYa4?=
 =?us-ascii?Q?4PmUdKB747z+SpCZBmG3nZfh4I3Z4ACK5ihZsx8i56w1Bd26WHjsf1nQ+8rC?=
 =?us-ascii?Q?llGY5OqcPJrgTGUV7nRh2nOnRnd1m1G03nbhApI+Yp+CBDexivoVG3FQaeck?=
 =?us-ascii?Q?hgZkh/5vaSt7F/maWA1qtW/n6lykvoyfMMtF+oZJDr8CkiEe7XuSCqysVkg3?=
 =?us-ascii?Q?ZJywecwCzAhGTJ3mJtI9bJJq09saiFSPvjbTfG1t+PFC4Cw/j/JU3fDxaAaR?=
 =?us-ascii?Q?CGmKQZIhaMFY0qJUXw2A8oStubhKyzv1hAA9p6/9pUEv06+x6N/3ltFRGjNc?=
 =?us-ascii?Q?04zcCG/AU4dGRWtV/arOpAek8VXFHG8Jhycn/wx9bnkF0lzX11dtyoZwn4b/?=
 =?us-ascii?Q?GCER4kJx4T1T12wLNj3b7oJg2nPwUC0uKc0PSDMRvtGhYMU6Gpv1lVsa78cx?=
 =?us-ascii?Q?xn6Z/C8RAoS9jA8L9vZNqmLKDmBbiMvjSvK/DKpwx3Po1UU4s82zpd13luEt?=
 =?us-ascii?Q?v8lkRKnjK4VGWPh0JCTKOHGL1VXVT9o7Rbkoy9OM3u9IIw4KDoMkNv6lHVuU?=
 =?us-ascii?Q?aBAC2nCxnh+c3Mkgc8d0jJiRdDOh9Z4WyOhYikCc3jTgHSyZGIorUmI4aH8k?=
 =?us-ascii?Q?g5tblxCa1SZRiCyVApmCEmvtnIr/KkfYfabtFGx+WIWe5gndHECPszB9n6qS?=
 =?us-ascii?Q?e8kp1izvPQVic4MAFQHjoJ7BXp8C9xi1RuaXXo1iTQM4s3acuNXhxJJMolyO?=
 =?us-ascii?Q?srEPIlZFg0ooPjBqyVuqTH1Q4f1cFeotpSBLIWWdqa2arHwSNuA00syiQ39W?=
 =?us-ascii?Q?PewrJLGuk4ybwWmvzn8y9YqqBn6EMWr8QdNVDBvw8WhgttUFCpxld64VzwfZ?=
 =?us-ascii?Q?w6glWohxwcmQ8Z6FeWep0nHAnPsqzyNYHVq6hnmoVGihsXN2Zu5k86FnppZc?=
 =?us-ascii?Q?VU/3fx3Incz880YI7plaUQ3BauJwey+8bJyvnGRCx543+/oWOzQfh+wn2X8H?=
 =?us-ascii?Q?Wv9E1bd2cUhHhNX3osmaevhz4W4x2Sx3ca2EMStjPd7yCfkZQ4IQ3h8R9J6r?=
 =?us-ascii?Q?+n6gpQJVJck7ZO0HK9s3iendhbad6ZQVoppxeB39eviwn+9NyE3aheSSW2fk?=
 =?us-ascii?Q?/zhsMnMTw+rdLkSO7toui/Z9kvqwNVWevQmJ0zqtPy2FMt3sY8XvI51MLJP2?=
 =?us-ascii?Q?VUs5QqmrRN4nDNOCv9219Y0UCgVWmG3RrOLQINICj5l3LHKRvAcZjDnplO8P?=
 =?us-ascii?Q?wcHNqNiLIWLmklc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:22:56.5464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d2f12c-8011-49fc-2c07-08dd46b9c056
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6024

The patch fixes/enhances below problems,
    1. Add missing compatible property under the example section for
    zynqmp_firmware node.
    2. Add conditional pinctrl schema
    3. Move FPGA schema references under the allOf schema to align
    with the expected structure.

Ronak Jain (3):
  dt-bindings: firmware: xilinx: Add xlnx,zynqmp-firmware compatible
  dt-bindings: firmware: xilinx: Add conditional pinctrl schema
  dt-bindings: firmware: xilinx: Move FPGA schema references under allOf

 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

-- 
2.34.1

