Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2047.outbound.protection.outlook.com [40.107.96.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D476723236D;
	Wed,  2 Apr 2025 05:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573566; cv=fail; b=GdU2jbcmorZZViN/gL3GkEtmrUJzh91K/TrSjc3474VGorf5PDBtPJs9B0duaKwes/z8Tq8ilkI7pJU2QdtyTlkxY+qKpOxQdtVo3WUCym5+1X5zhrFfrLMWuur0f0XJZUeuLRqe6jnoDQvZ2tZTQRvLbqZRgCYLO6DcRDwbEh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573566; c=relaxed/simple;
	bh=5GtngUwv/pFLVs/5jP4e1YTBT+QZloysFbMq2j+bxzk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=urqL1ZlvLJ05VBJsV6d1vxwYvR1NbDIO1aGk0eOwvWDQH1x7R+uJQ2OJCg1cKYqmsgRewqlzqrxCaMJviF3ucF6WF9DPjEYPZZeTW60oi5DT/Y0HKE/tU/bm7Fod/s7Bzf1SBTgSwIrVitxfdcKIYzCmCKi49cYZ9CZhmE7yOEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2xbOQL5F; arc=fail smtp.client-ip=40.107.96.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2xbOQL5F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipqpVNFc20AnHdV4RXvuirH4t6fKIPqXN5ga4/gPXs9QgZsXyl1ILcpGfJNB+Y4NdI05b1SxBpy7y+VzQZCRcW8YBqa4JF7Q2lPRWt///xRERr11kp8qHSIWaxa40WAsDQ2fZY36ans9pNMxlvKZwXRXuU+ifAD4SfTnDpu01oYS59igkjRdYHq12/gXd9tV7uIHj//bUG7eXG0GnwoFuWJKcFzs5phq0Nc46PiRyAJfmYhMkflKxEKc/AU87N7TBi++b0oynTZLcN4iKtoVViqOJ05OVr/w56lOjebi345eCpQhNuHGucfuMw7xORlgpA6rMk3ehaxhWKcq4BPJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1pRsfusff5dmd7COF46Efmf3bQtvGWyrIdbo/pp59w=;
 b=Wj6bIeMMUGN/Sbgfy4fIgwLvW1DVv5CQJBi7h/23SKZA1t2mNd3w4d8/nPS2vnX/M3w6eLumrZXGS9PPyCXKFlmhzp/004eIGwbPjRf/ZAVvcjzxcE6ozD6Vkj1gjz24so33x1vvgpTTCabmcDpPtCjlIjUBm64yoGR1poAW6xtr+yWExTsMS2MUZglsvPAcNyyBOGysu5ikQ5F+0UyuBW9iCimmetuAnBL8+qb9pG+RL7+i0HMbVzheBtSV8nxJnMVo0BFOPd6etRSvZwYS4wSk/WBBCzQA1TbhUKBkGSoR5bvOon01YcdwWqjFS18UY6ibHoqvprFp20KDZ7815w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1pRsfusff5dmd7COF46Efmf3bQtvGWyrIdbo/pp59w=;
 b=2xbOQL5FSHDM/D4O4kOCytwEK7Sy7isiG1mXpv5HMPOZILmeIC8n1aangfw/nTRmnw9C/X/Qa+wnX+w/17W98d3XT1GiDZAb46JJVXbFriEGbmUJmemUIjNkH+neEeo4dXgY12BcCPzq5TjyXFAbwGscYXH85HEZRXL5UNo4rkE=
Received: from BY5PR13CA0002.namprd13.prod.outlook.com (2603:10b6:a03:180::15)
 by CY8PR12MB8216.namprd12.prod.outlook.com (2603:10b6:930:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 05:59:21 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::a9) by BY5PR13CA0002.outlook.office365.com
 (2603:10b6:a03:180::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22 via Frontend Transport; Wed,
 2 Apr 2025 05:59:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 05:59:21 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 00:59:17 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v7 05/10] misc: amd-sbi: Optimize the wait condition for mailbox command completion
Date: Wed, 2 Apr 2025 05:58:35 +0000
Message-ID: <20250402055840.1346384-6-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250402055840.1346384-1-akshay.gupta@amd.com>
References: <20250402055840.1346384-1-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|CY8PR12MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fac6c06-9d9c-4c15-e12d-08dd71ab8366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ekxC3GeV5BzhNiTAOjEjQqQTXwpPgKthWIDoIUu+OEz+0RZtszZRyRHdOgn?=
 =?us-ascii?Q?IxVT43BIJeuUszvPj8JUG7LzIRGi7FptE9AD30rtY6Ew1dC6OFXZuEDnLWDs?=
 =?us-ascii?Q?C3fieSQq2FT/KPSh1jiWTOMrfZrIFcNFBspdbS34MPaUsmXGGtsXRokfjFkt?=
 =?us-ascii?Q?0KzBjmMgcoPkzncxAlhx5vHsUwwnZHltoQdOakjDIyS9Avwel0ZBBfQpQK8/?=
 =?us-ascii?Q?h21QoTuWCmppxeOFKMSooOdLA8hR0XyZve22RBY/CuMjjL1fZx1U7GIUvsAm?=
 =?us-ascii?Q?RH1zkPMOCz/GtSktRsTifCpt8N8GEpXYNeTC5pJ+pSU1RZzuLC1wrfWRyMd1?=
 =?us-ascii?Q?VVMe//omYoOxArba2Y+b8hqpWjejThx2GaF7FEYPOMf8EGrAt4NEbSLjEj//?=
 =?us-ascii?Q?rk/v4f8GyzVlo4VS8sBayzZhXgEiTrTcDqFwOXh5I8X+A2EYSn7GCcPOrBhn?=
 =?us-ascii?Q?gJ7qcsWhhxp5O6lJZfy4Di+tO7MIlS42vfxZlR5TcwJsT1ePACge0IcSHi5r?=
 =?us-ascii?Q?m0q2MN0FaxmNW7GkL43lW1eW2QIZHElD5lty+AKKOV39k976gFslYaI2ngij?=
 =?us-ascii?Q?xZa3RFMAFhBLvQt2/X26BcMTkeAB4MWAR57C4RWHJB6h5hzfzZsJY0Bdsfer?=
 =?us-ascii?Q?eV1RjSScCGiFIjMtzIlAVmmZMpfUS5ZRxWHEYebqkb1sj7hB4cnE5zrUkSOu?=
 =?us-ascii?Q?rKu7EkHrTm1OLD9gJuVEGagH6FAdNsO8STkmG87lFE6ocbPohpXPsH/MadWm?=
 =?us-ascii?Q?yQI2WHyF51xBo6Ea8EO0jXwiuoPVw/KsQOF+MYb+sQ3VQDydFtVpeJ+AwNe+?=
 =?us-ascii?Q?Pes8bOIKW5bj+3RzefOuIJnns2tXSMTBEwpgOqbvRkKZIx7Ki+YaOOnQstNO?=
 =?us-ascii?Q?qCOi8AJlKg1je2AmRpxsCqR9lclheYl68NPDcUIV3jeepMvAiXdpiZyWmlaA?=
 =?us-ascii?Q?jmFBQrGctW1bpOBAJRurgLUj3kB21FLrWq+C/qYSCIkc8VzcHQMH9dC4SRbn?=
 =?us-ascii?Q?hIwUMGHKiCfL3sMIQBYd1jQfxnAv07PobR0PNP8EdzmaFmhwnC+5+6OgMfsz?=
 =?us-ascii?Q?C0LakXE2FRxki+elHgycpRH3orC1Ln98yikrgf/v2/tvAYEn0/mTLAd9BN05?=
 =?us-ascii?Q?Qy/OvsJbpCVps+JipPO6T6FB3CrWctbuFhyYETnCt2jxomIh3eBoACEbIZFu?=
 =?us-ascii?Q?RdmCnZQv1Mv70hJ9fNRWdXZMPWlH1CkK69g2Ywqgiw59RL8KiEwYmUV0HFnc?=
 =?us-ascii?Q?lyvCVgY9VBq8XeugTDEh6Uh945rJWGMgrUqyiGz/ChY7wAF1a12EjBYvcBQk?=
 =?us-ascii?Q?75P2B4r2KAhE9VSpPocOHYvzRGGcCyfjtz90C+xvwEBNpGBCwP81bRe/7qJT?=
 =?us-ascii?Q?3+EBGg/6DCjk/w5Wb6XMBx4gtsuaOpkoVXeTk+Mgu0jOApU+o0RpyoE7VU34?=
 =?us-ascii?Q?+YmrB5Or+MenrDi1ShP+PNdscpu7qI2PoqIiQw/VHBOsunzxY+V8/axbCT7W?=
 =?us-ascii?Q?/ZqkqvcyrQ6qQwU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:59:21.2819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fac6c06-9d9c-4c15-e12d-08dd71ab8366
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8216

- optimize the wait condition to indicate command completion
  by replacing the do while loop with regmap subsystem API
  regmap_read_poll_timeout()

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v4:
- Previously patch 3

Changes since v3:
- New patch as per suggestion from Arnd

 drivers/misc/amd-sbi/rmi-core.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 663ab9176d95..1d5e2556ab88 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -23,7 +23,7 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 		     struct sbrmi_mailbox_msg *msg)
 {
 	unsigned int bytes;
-	int i, ret, retry = 10;
+	int i, ret;
 	int sw_status;
 	u8 byte;
 
@@ -64,21 +64,10 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * an ALERT (if enabled) to initiator (BMC) to indicate completion
 	 * of the requested command
 	 */
-	do {
-		ret = regmap_read(data->regmap, SBRMI_STATUS, &sw_status);
-		if (sw_status < 0) {
-			ret = sw_status;
-			goto exit_unlock;
-		}
-		if (sw_status & SW_ALERT_MASK)
-			break;
-		usleep_range(50, 100);
-	} while (retry--);
-
-	if (retry < 0) {
-		ret = -EIO;
+	ret = regmap_read_poll_timeout(data->regmap, SBRMI_STATUS, sw_status,
+				       sw_status & SW_ALERT_MASK, 500, 2000000);
+	if (ret)
 		goto exit_unlock;
-	}
 
 	/*
 	 * For a read operation, the initiator (BMC) reads the firmware
-- 
2.25.1

