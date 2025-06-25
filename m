Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDDD29DB99
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849676; cv=fail; b=tyndlmKBZC41jdotp1ye/I9pw8XwJAMx89jxY3BuBXsi+dAlK86aeOJ1O8gqHfv4cQWFmR+m0RiCa9S3NLo+CJS+lwZ/WP09e7q8h4nZEuE0wI8rk6DPtyQyCO/JmqgJczj7orrewJEWUYo9sgO6klsIsKNF/WigRygaPKIcfZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849676; c=relaxed/simple;
	bh=yJWYHQWF1i3FqC8zCsl/fl9hcngWsvkrPxkMumdSrqE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aC5WvoTx6iElTde/bTY0bxHUmgAbFcvy9UctmH/BySZTzKHl05V4lYsJT6WvSLpmgq6/kUgMqy18VYLgfRHaIDXnpuUXW3X4nJTN5IyieXiWaAKFHKX+mCC0mcjhMtNBR6G1ScOeOyOQtRoC0q3Ud6aLeSte+XFxuOVbVsPI71g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qFIKRfit; arc=fail smtp.client-ip=40.107.92.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qFIKRfit"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLxSSLMTUTOiT9c+PKa2ANR4u6+QaK/+n7q9hMh1ZUMkt5AcewSdzajWnT33YbUbwSTTAfTiI58LLsYtsQvm03Jdn3N4e5tyPFH9rVkjs3xTT7fK4H0FllLww4ZGD++NZ3xuqN7FzuTasOO/modr970Uv0hXwF1ANud5l6vKvUUB1t0tHlsK+PFvAy+czem7YSPvu5Eqi/ZAfWojzW8njp/FfDVQvMBRdcXHqAKJivLZzAI1ZHUNy7YTt4urWB//Ts1xA14Y6oINcoXCd9oHTOnVTen2Vk7Ntnh/sOSekqQNQrHi/OIYnb3Q7Lf6F9pQgT+XSd729yHmTAkV29mrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi5t34rPl/w/g+Aw/fcg4OEEaJ2o05Cx2lA01Z0St7M=;
 b=H9rwoJEnc56U5okEply579zcm8W/7726hd01ycZN1L6YGG/4odljeRcTWqgP/qQm5ZQAEv8XWXkTvkfGF0Vk5gSDWtNubUZJ+6OwUsziZdTZrrHNI1ikWkU6YKpmYox0PGjf8R2A/uiuOgm3S5QT/YjtN2tgUzugDym+/2MbBFKBPou0HbyRuFpJ+o7LR5f+eesNBeyQEQJCWPlFAYx665R0Ava9MTHJdrbI3JK/ZwmDAQlLWqCXddKZFJTH/7Ss9O0aqqpl/d19tc7+thoskMalvtknlkHM1Jf0t+uVXDHh68az3sqQtFPj0SI93D9oFy7xBv7LoUQ8Iwx4V9UZ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mi5t34rPl/w/g+Aw/fcg4OEEaJ2o05Cx2lA01Z0St7M=;
 b=qFIKRfitpeOXPsz0pq0OMLUcpwegYkU7VZgB9Cv3EUvH5zvN42vI7zJdby9ieikaftCAy/SRQr2UYylG+75VWh8TGjq0VrYEV26hcYISIBbObnDv4rSA3GebSnbxRwN9l6Fx/ZQjsjU5HuWusGxiA7kfLlIa0Lk5dvvpounhgCs=
Received: from BL1PR13CA0300.namprd13.prod.outlook.com (2603:10b6:208:2bc::35)
 by CH3PR12MB9252.namprd12.prod.outlook.com (2603:10b6:610:1ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 25 Jun
 2025 11:07:48 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::7c) by BL1PR13CA0300.outlook.office365.com
 (2603:10b6:208:2bc::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.7 via Frontend Transport; Wed,
 25 Jun 2025 11:07:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 11:07:48 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 06:07:45 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <arnd@arndb.de>, <shyam-sundar.s-k@amd.com>,
	<gautham.shenoy@amd.com>, <mario.limonciello@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <anand.umarji@amd.com>, Akshay Gupta
	<akshay.gupta@amd.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 2/2] misc: amd-sbi: Address copy_to/from_user() warning reported in smatch
Date: Wed, 25 Jun 2025 11:07:07 +0000
Message-ID: <20250625110707.315489-2-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250625110707.315489-1-akshay.gupta@amd.com>
References: <20250625110707.315489-1-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|CH3PR12MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: 438c1088-0c5c-4366-f3c9-08ddb3d88559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uACC7pb7Q0Hw8urUk+hLEjRF2zKXoqSMmHiMYHYIxaS8kc4mM8j2dxYg+thr?=
 =?us-ascii?Q?7qkzee9lL6dg5UO5CJYIx+3VLy8FbP6bxNtktRdPf7+Xofv3doiQryiDNIUV?=
 =?us-ascii?Q?288TLwdJfzqwfL/DQ4ot8iF8dtUqN7gJVpr1RvZrbs18/9+ValYHp9w16wua?=
 =?us-ascii?Q?OFXzhIZ2LjNPewFXqidsQkUJ8e1VQgdwkrWyvATfAvf9Q2oQWDJDb/RYaTRo?=
 =?us-ascii?Q?/6urdPpWA+uH9G6hnq3fxqV7uEkvw5lRZT8tQFngC6vWYckQGetvFWrT7JO4?=
 =?us-ascii?Q?wsCJUgMq6ZyE/3qOS8VkplAx8IkJ5mUepjY7Z+Dime72qK0bDSdvO6KLm5Q2?=
 =?us-ascii?Q?cfcGZDJZdRM6VcWc1l0AF18h8RgQJwHyuZ5Zd1BqSpv8tBIwaCOOnnQOWw5V?=
 =?us-ascii?Q?R8Wc2MIwfXwqmOEwKYlZ/ciQZAmOcGh/cz5pupsc4ocGkBhSwwZAD1fQ9lL0?=
 =?us-ascii?Q?eA6V674WFgkJyQo5d1znAJiqiPGw7sqI/meUaNCsPRWjOU2fi51V07+0n4S3?=
 =?us-ascii?Q?JGXC//19GyVWwaLz3YmOTcPMvoPcGKruha/MyiGt7KBQNlfh13zK5straH31?=
 =?us-ascii?Q?Y3sLJwCLHOVHZX2xT8pBIFhrpXWkro9eBmMYLwVK+b6TJ9nPw2vYOpFJXsZh?=
 =?us-ascii?Q?Zb9SVFKU2eor4ETZPbACtDScZBhncNPTOLIdCcu9JZaXVNxTRWGGF+RcBfmU?=
 =?us-ascii?Q?ZyMBKpPBHtE1YGVV2LEmcBm6vW7sy0K3/roBq0PWKJ0IfiWbcr2IPziATF+v?=
 =?us-ascii?Q?QH8hMCsmMzQgftF6Eelr67WPuAba9WywmLl59jjAv50Nrh1sKuSvG00NWEDS?=
 =?us-ascii?Q?hM2x3vIN1WtcMouEAT2p7RVbh+bHOsYTRHxhnttiKd4ZOgyx2tPJEnfC6At8?=
 =?us-ascii?Q?NsVDj5nO6igLKMJfmL8zpw4YvrGRgI62wzJDSWk5Lxld6cJFLZTCnauCNbAU?=
 =?us-ascii?Q?JemWBkoPLctNjIebOViC8/eMhT6bii9FzVGOOarFlHY8lGZt+EMGwFfKmUS8?=
 =?us-ascii?Q?43kxjhuDwc/4ZX/Tc3fjOESJpq7yZrxiEuK4YxDIt7dXhCZU0TAyUc39q1FJ?=
 =?us-ascii?Q?HaqVTyXJdZjNSWx6QPg7M5K97IQ74eVrvbwcJwhyIJNd4L6VeaDsyNpsv+qt?=
 =?us-ascii?Q?+ba6notFfUaCdLo2Mj1X3z11xJo/PL+KV0/q2iD91aLv7/re2XYhn24RHCOC?=
 =?us-ascii?Q?EE64AljvFWPFqIibkLcwpMn7k9PRCo43ABJT7pDRj3nmZm/vtSa1Q5vqjgJK?=
 =?us-ascii?Q?eMZ6xQqO+BM2r3tTY2ZK+/cLaAjD+3HYM3LypljI6djsO2zbTfDpWJdNFM89?=
 =?us-ascii?Q?1PZXSkBA8omr8/hbo5dZyaDiYkpyBVHHwpNZToS+7j6RrKfNW7cOut4EQZ4G?=
 =?us-ascii?Q?eexPpnexjbGi0X7hhQKrqP4wk2d2n8DTdLFD+BFnpY1WRdbJXiE5yddaQ5bc?=
 =?us-ascii?Q?7fuo9V+PR+a1KQMIvDUcVRGoiRA4eoQWSyUvQw3Q7rSGSq2Fu0AXK0UHClST?=
 =?us-ascii?Q?sOYTEbqVcmjvzNJCJYTSgV40XgIRMMp12nI8bVO1SSf092ox42su31lKUg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 11:07:48.7608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 438c1088-0c5c-4366-f3c9-08ddb3d88559
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9252

Smatch warnings are reported for below commit,

Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
from Apr 28, 2025 (linux-next), leads to the following Smatch static
checker warning:

drivers/misc/amd-sbi/rmi-core.c:376 apml_rmi_reg_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:394 apml_mailbox_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:411 apml_cpuid_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/misc/amd-sbi/rmi-core.c:428 apml_mcamsr_xfer() warn: maybe return -EFAULT instead of the bytes remaining?

copy_to/from_user() returns number of bytes, not copied.
In case data not copied, return "-EFAULT".

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes from v1:
 - Split patch as per Greg's suggestion
 drivers/misc/amd-sbi/rmi-core.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 3570f3b269a9..9048517c088c 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -372,7 +372,8 @@ static int apml_rmi_reg_xfer(struct sbrmi_data *data,
 	mutex_unlock(&data->lock);
 
 	if (msg.rflag && !ret)
-		return copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg));
+		if (copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg)))
+			return -EFAULT;
 	return ret;
 }
 
@@ -390,7 +391,9 @@ static int apml_mailbox_xfer(struct sbrmi_data *data, struct apml_mbox_msg __use
 	if (ret && ret != -EPROTOTYPE)
 		return ret;
 
-	return copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg));
+	if (copy_to_user(arg, &msg, sizeof(struct apml_mbox_msg)))
+		return -EFAULT;
+	return ret;
 }
 
 static int apml_cpuid_xfer(struct sbrmi_data *data, struct apml_cpuid_msg __user *arg)
@@ -407,7 +410,9 @@ static int apml_cpuid_xfer(struct sbrmi_data *data, struct apml_cpuid_msg __user
 	if (ret && ret != -EPROTOTYPE)
 		return ret;
 
-	return copy_to_user(arg, &msg, sizeof(struct apml_cpuid_msg));
+	if (copy_to_user(arg, &msg, sizeof(struct apml_cpuid_msg)))
+		return -EFAULT;
+	return ret;
 }
 
 static int apml_mcamsr_xfer(struct sbrmi_data *data, struct apml_mcamsr_msg __user *arg)
@@ -424,7 +429,9 @@ static int apml_mcamsr_xfer(struct sbrmi_data *data, struct apml_mcamsr_msg __us
 	if (ret && ret != -EPROTOTYPE)
 		return ret;
 
-	return copy_to_user(arg, &msg, sizeof(struct apml_mcamsr_msg));
+	if (copy_to_user(arg, &msg, sizeof(struct apml_mcamsr_msg)))
+		return -EFAULT;
+	return ret;
 }
 
 static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
-- 
2.25.1

