Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A72B34CF5;
	Fri,  4 Jul 2025 11:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629249; cv=fail; b=ERIZRpKCrUa/3tiItzg0DNvB/5qVAR7gTm2EDGgbs5O286uNmKYdBg9Oo3acUJ2cgHjNYBiQMUVKs99xMK5cOm2QWdIGJmPOd2XqHyCyp/335F6R8QUpJlzWmcOH4dafyPt93JiKWY7xljnqcs5fWOn0Sv/WgI1iFJtvaSEH+JI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629249; c=relaxed/simple;
	bh=LaEeP2ZRJaNnI/6JQPH8bDy4293yRTuyC2f/Yf23cx4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NZoqtEuoSb15+MXksaqFSSRPaG7jQWZbVvlVCAALDDpFY+Aj76G2gB22H22p00tmVlaYxVXkQC5K9wfq+eKlZpr4aElpJ2XtJ1P1hOxc9MvCFlOPcVbnZlio0g+5rSXbfrWFjrUfUe/x7E5l4TKjGhInR4s2/DVf+w/yZJfkpN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o8J3GLTM; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o8J3GLTM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbhjRYVxElTQIZyeI400Ck18h1df6uT0FUcyPHVxPGw9LlxhXlND8Oe13Kv0OPR9sBgPczEeqKo/VNLRfgz2HoksvWspNKhY2T5WebWa5SMcWLVpknpWTe9XEQLGhq5qBlkjD+AyN2y2EUgFQKPgrnukcBaJxVT1zD5nZbIABvXGtZmT0ZEFMHI+hx2YvyHHtADFZz2fNgIx0UrnEtcY3oBOXbsZPTb8VO96GVRsKWmVhfL9dLg/K8u7EHsJey33kuBLaI+msjVIa/HHSlkfLN7oyqoBzUFH5DNnZ3tpFB1eeJCI+mn0QcUJDN13kpSJQqdxhJdJM+lR7YuZ+ZuNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HoSlKL/zwvmvT+7oPAPvSnAmnHlVwSHWhBdejUOYVU=;
 b=edpW7zxFDfoKhsgkJd6MFHK7Jyd7eqIK9tl6DIavB86GenJ2SU2vqOasz2IbX9rRLOZyDTsBhZayONob/p6z2/ifhawAISKv8mdO9H783u5vYFXGIK24BDXgOiAiSbUV+eUOdTf/6vYLffEMwmIrhf4FSuR0/zjDA5BWVcCWDuxw5TaUnM3a103xpHxrSmW0yXpANX47l52AYB9DrLlKfHlvrUTBKdc19wBG7kqRKrXkuXDkGL6bZ+4fungfuXc1AtKTh7AgLeDSesgkgSmGqo6V83YfX6+4n2oenx5bU6O4FwbR4UeQdXQkut7DsITgbaM7Iwu6WpUgL6tMcIosmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HoSlKL/zwvmvT+7oPAPvSnAmnHlVwSHWhBdejUOYVU=;
 b=o8J3GLTMknHVRgTutTlooJRGNj4fW4eNQdX3oW1VqLw0Ui28d788JNssHbWDeED8zhn5VejZb4C81ccA8EnbGrpUoRoN6py2NOK1Fzzlzmmy80qi6mOUJBuJ1g7YVdbLcnO4P7PlGl4pbTYsCuAa3G3Y/yqVHkV+dO2f/dN2m0k=
Received: from SJ0PR03CA0181.namprd03.prod.outlook.com (2603:10b6:a03:2ef::6)
 by CY1PR12MB9699.namprd12.prod.outlook.com (2603:10b6:930:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 11:40:45 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::fb) by SJ0PR03CA0181.outlook.office365.com
 (2603:10b6:a03:2ef::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 11:40:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 11:40:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 06:40:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 06:40:43 -0500
Received: from xhdctallapa40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 4 Jul 2025 06:40:41 -0500
From: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
To: <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
	<m.grzeschik@pengutronix.de>, <Chris.Wulff@biamp.com>, <tiwai@suse.de>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<punnaiah.choudary.kalluri@amd.com>, Srikanth Chary Chennoju
	<srikanth.chary-chennoju@amd.com>
Subject: [PATCH 0/3] Add support for Superspeed plus EndPoint for Bulk and Isochronous transfers
Date: Fri, 4 Jul 2025 17:10:10 +0530
Message-ID: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: srikanth.chary-chennoju@amd.com does
 not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|CY1PR12MB9699:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bff077f-5b40-49fe-091c-08ddbaef9ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l+eQQ5QcRJlF9VslUBalvB9sTj49P9PXDrd6bgRAjnAMxwooXZNtirBGlEGi?=
 =?us-ascii?Q?F9L6OfbcF9nqtDAKsQqu2lNNsd5/RLnqzRnwHdFx0qPaBceEBfQqY8HjDgi/?=
 =?us-ascii?Q?OLU1sO709lLLQa/S1bXf3qo95+e2TwUJnrHbWxFyJu3eI/3L5XMgTsjdQmoB?=
 =?us-ascii?Q?VhK8fpZl7c2nb1B2210mLxCXC522adDgVehaMMCr7EVLxNEd4+sqtupv5oFE?=
 =?us-ascii?Q?OlC3l6Jg5YoznVH2eom8WZ3xOChkEs1WBdEzEq8VBBcl7m1Cn38ni2E2wk3g?=
 =?us-ascii?Q?ZDccvlvWNejHpk36DYAQO3pn2bg62vjoRHq6V/iBQZp5a9XL4eWPybBv4RAS?=
 =?us-ascii?Q?kt5DCZaD9r4kA85z0wIEXqpJJz6g7YpDDtQbKf5ute4CM55aVTOOfDvrbxk9?=
 =?us-ascii?Q?laY7mbQYUyzVF30cRMNTyj0q0HFzd4BbAHR7pobr3Qlq4ldfS+vHCjFv4vZB?=
 =?us-ascii?Q?f26Z5mTH/hjf9psna/i5OF4Y0O1DSuEJXAwwqMrK0mqKnrz7rYEIWblzFLwa?=
 =?us-ascii?Q?/wW7sfuYnxv165nZyfcAmYSw6j389ZelVAqpIy4GHHu8kKqmtJJP8CxWTSBG?=
 =?us-ascii?Q?VP42zldhMtnZq+ZG021GhJL6B3YL0IGgo5UDz+sA9jGylOK3fAzhEBVi6C2t?=
 =?us-ascii?Q?s2QdwFz0igH7wv0U7sSd6FMhUxIl/5fuyxbo1j70pxwTe4ODMuYHiUWAAliM?=
 =?us-ascii?Q?NIzlQZRhRxgORG2nplozCO45hG4K+zgFyMTfv1Z0/otwAQXm5LlgOxC20ime?=
 =?us-ascii?Q?A/wuOXP2mWY0xNqVvrdk6cKDWaHoTx46RE1aV/kcnc72XTRr6TBqHzz+0BMr?=
 =?us-ascii?Q?WOeX2lOUtTNzotZR1UAuPLsvuu/EzSUZb82GIADIoFsQRNMA62Trs5QE0nNn?=
 =?us-ascii?Q?QeoiyrXdqj3v5qx/A+D4y3kbxnetdmPV29ZinoEnHR237UWpfKzoqknFcB7N?=
 =?us-ascii?Q?kJDV7hEYbsVEVuugb0KQKt+Jv2V5PQEwChYnmZeZbGURoWJMAxZFW45BxOOc?=
 =?us-ascii?Q?2NmEcHLhI+dLSFK9DI0N7rwsaXbObdLWuLmHHrINtat+B0N6iXu2A1pY60dm?=
 =?us-ascii?Q?McKArPXNCy6bZfMpL49+8vZvjjf5vf4uIuDnVdUO/D2KDVfaMHp0vjjDYQlD?=
 =?us-ascii?Q?57rfxshQYu3OAIBUZDzJlu0wg+aeoYPoOENTKzWd1axfdSqLirFTZbOoks45?=
 =?us-ascii?Q?pHsjzclbtzUn9OOu4fNLLfD9HFMLmG7l8aeA59sqrQi4IzS+WtF9OK2+nI9/?=
 =?us-ascii?Q?tneGbQ2jpO6RbcVNRo0Wn/WDiDJAabPDp+pJw1i7L93Kr08u2TG738OQv9gg?=
 =?us-ascii?Q?PnWh1l3RCQIGrSmDuzn4S7jW8T5KYcnLuTF1eawqVQ61keZj/o6+KBkfXwHX?=
 =?us-ascii?Q?8ABaArf6JU3eMYtDUxCakaSn4j0EU1xoypWiyAKHirVkZpL5vH/UMiT79ep0?=
 =?us-ascii?Q?a+hpi/y1eG03KRUhuZVHACdGIOE/BbEFt1MQuCpUmVBVPI7N+kMESZy12pRd?=
 =?us-ascii?Q?TeVXfCV30PJjmbZR8qNAWb3CJszVngDH4+/i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 11:40:44.5767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bff077f-5b40-49fe-091c-08ddbaef9ccd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9699

These patches include changes for 
1. Supporting SSP devices
2. Provide support for maxburst 
3. Support for SSP endpoint companion for Isochronous transfers

Srikanth Chary Chennoju (3):
  usb:gadget:zero: support for super speed plus
  usb: gadget: f_sourcesink support for maxburst for bulk transfers
  usb: gadget: f_sourcesink: Addition of SSP endpoint companion for
    Isochronous transfers

 drivers/usb/gadget/function/f_sourcesink.c | 37 ++++++++++++++++++++--
 drivers/usb/gadget/function/g_zero.h       |  2 ++
 drivers/usb/gadget/legacy/zero.c           |  2 +-
 3 files changed, 38 insertions(+), 3 deletions(-)

-- 
2.25.1

