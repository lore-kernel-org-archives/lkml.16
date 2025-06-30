Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4358F1DFCB;
	Mon, 30 Jun 2025 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290048; cv=fail; b=FgXVTb60QY9FtQiQbMg3O+ZXKPsK5WKHSpNOq8UTJbN5W3UInWam4dZtOZqlENQ8ZeY7EaiDzBYLvpx6gNLjWx/CCtX9qqKuwvwlp4nHHCiFgYUhKH7EsAmn4jcboiNBRWxg01fMqj5QNF1cUGWdWQdjzxCJF6VDazlnXFUaTvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290048; c=relaxed/simple;
	bh=FZ6Dgjx633HXISu9T3LpPwuzm9MkW7reIm+gE+/GyjE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sIpVzHL//M6d7LBtXjEkrdWAet5OEn5ZhxmGg9gtSqLX0KjD+EKM1vAokj/CY6OYX2rLTUP09qf2UVmuY3uy2qk6RmJmrA3u96pD0JzOmiryGIjFSHyCtgEaLjLjOb2xY0enSCkpA2/QH6kxalTINhVGjZ0T117jhjiICvtBQIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R6m/wsnF; arc=fail smtp.client-ip=40.107.101.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R6m/wsnF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQwxDrDStOAFfVBgykjazA4SWz1+nrN31jcWPY2OhsYj+z63D792S8jFqTgEdaL1vs7CL+3gLNzrvOvKIF2NGo2qLwIqYnu3AkTVbbdwQuIQewCD8pTAB/EuOZEx+LSczCum7uSI7TZnuVEDKgnovspiONr9vTWxM+OyDvpQ2QrCAe/AP5cRCbEfsORLPHwtS60gdkEZUCK8g7ryxizhzoTk8cIMKx+9lxxe2ganLpoF4Njv9yVbgyH94UrbzWewapzKDZoXSb70aFLNilNs1uzwnYWmM37V8QnnE4uDQuycThNK5KW+2F7xGkT/xcOH66PxAxMMOuhzBqOCca89kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCTAbK90SYWKsZGhZk1DTBlsjdaZV/DVzfjqeIjhPHk=;
 b=SuV/xC7dct2+nQ4mvRcJGV0RCwsr5LtazE+hkoOUVszAee0Jz3326k71+XpQK9MJ0Iml7j2fIApO433BJYgmWh7QXfXBNKFx+l6xv6nezum8qdJ+p2wyiuo7rI6ZHEmp5vkPHMuOib6aJ1zHmWwdCln0ESTDO9w/RNIlZRrHSU9YQLM67iMCbJMLVvy7lXRZyYe1JTc7cZXcSMV3xgsefZs1K5GMdGKM6K63I5jllhzQ/znRz3rYEwzdgaTWSdm2Z86PMNhV3JcNX4+Bbk9y+TSRMsJpslJE7aBdUDWsNIjivz/bkdlpLSH+w/qR7UPGTAOcDgbHAa4Yz1h27Jj0tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCTAbK90SYWKsZGhZk1DTBlsjdaZV/DVzfjqeIjhPHk=;
 b=R6m/wsnFvW6QaO+5hbSXuhir5iVq3f4hq4Lpfju32ndAHzP3df95jEN+PItvEoQx9yCp3OycqBw+utgV4Mx5ru43OXIKzCGPxrYdLdj89zwRmRmk2i7eOJ1re08E2HxqdZQKW9gTPZrgztgfaGfQq/yWxm2aYj46EZEKUZ3m09QK14mPPGE8LLGFeAuu2vtfAoZCc+kDWQsNRbnSgxoPaf8euXGbeLRpd9BVbpFySMYPJZQqOZgl3WwwZQ20MS1Rbvqy/7gN0QW8hSYlrHF2kP0FwyRng1sOcut+3I2eNc3rLXZwy8oOkABK8JaEZ4OKfF1xxrl/MMnMXPAMk7LnhQ==
Received: from CH0PR03CA0046.namprd03.prod.outlook.com (2603:10b6:610:b3::21)
 by DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 13:27:22 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::73) by CH0PR03CA0046.outlook.office365.com
 (2603:10b6:610:b3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Mon,
 30 Jun 2025 13:27:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 13:27:21 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 30 Jun
 2025 06:27:07 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 30 Jun
 2025 06:27:06 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Mon, 30
 Jun 2025 06:27:05 -0700
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
	<vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] Fixes to mlxbf-pmc
Date: Mon, 30 Jun 2025 09:26:55 -0400
Message-ID: <cover.1751286845.git.shravankr@nvidia.com>
X-Mailer: git-send-email 2.30.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|DM6PR12MB4340:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ab98d0-7efc-40fb-efb8-08ddb7d9d81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jwD6q/RTu2wU2TTglmz2ngzfCeuRkZ5rBvQsjWk8XeM/wRBTVHG90AC8/g08?=
 =?us-ascii?Q?2VX+490PNxJclmws0EBI2+FyXoH05vdjqEFaOh7lRb3B04My2MaXkCcswFHh?=
 =?us-ascii?Q?Vs51UHlZcxZoHVB2lP3vUiPMfpSr1ndeYJMOCptzuguiN/untI+OnyauzPr+?=
 =?us-ascii?Q?00qfndyNcdM76w2zYOxDnoduGt1QR6zdhP+QZccvAf+JI9Hvw5QEvLlYbCb/?=
 =?us-ascii?Q?dsnVxaQ+0yRxdu/lGWjCKLDQvZ1ZZVat9zmASjaZnHI/ng+kAqfhSbki0AkG?=
 =?us-ascii?Q?hCsU+hBIY2SfmdH60BHcz42zl6rXKKCgCCgC/7Sv+TrJxLNJhcKP5PBvRMQ1?=
 =?us-ascii?Q?7yGEyn3L6i98wZQg38qUO0+wTE3KlSxnJ/YXuY0GL7k4N0LozMD2reww4er3?=
 =?us-ascii?Q?QU0zxxUqaVgC8+UMtTr13yZUx7rW+E3qwlQ3jfKy4AYSRCkKxosilYklG4Ko?=
 =?us-ascii?Q?suJ50ZDya0HcAOjDYeaLCVtzdYD3HthJqyZFo8cc3ty4J2z9ilVhdkESCzLj?=
 =?us-ascii?Q?aprfGhBa64F+Ok6c/jNrq/DlEXlWS+7wFW6uQskluAFRu4tFQj4p5twmdXYQ?=
 =?us-ascii?Q?4bzhNlvEEFDJ5capnH4psYKhJYrRYRLuUB63XHtv4aelwwqDFYkXL8vBMNIQ?=
 =?us-ascii?Q?v9NIgAd3pDEN78cyDuUvk30T+IgSeKWnkEFmqx2vZxGd/HMcjIKqnbtisBgV?=
 =?us-ascii?Q?2BhiM00oqp0b820mGDWy93Z+l1+udxoIs0BLLxzRG1ilfuavIc7K5VVK8u3d?=
 =?us-ascii?Q?YF9ijWvLYtzxmaNmTVE9W5EL8mkWuHwAsyIQr7McJFq9r8V0w9O2znMI+GsF?=
 =?us-ascii?Q?or5slIgBEV+mOz8xB2e7zebot1kUI0H30qPAZmoqoIB4l7HWANFS2cTqUmQW?=
 =?us-ascii?Q?Rh8BakU/Bt8DmB8YrTPg5PRLhreUE++348JxLk3p+BZBThgNlRhmCzF8YFqK?=
 =?us-ascii?Q?pjFZxKbJc76kBMeNFCinePlXK9kfWwb6CKPKykuiL4O4Xo7dvGR3f+o1DB+o?=
 =?us-ascii?Q?eVzHc4XC31vLv8xwTpzd28QdY8XdIwU2NsG1dEZFB1RGwGHbrbD8nWr86oAm?=
 =?us-ascii?Q?Cnf9E8MRcbI2FV5IuuEWpl/ntavaS4lB2qX+lnRWtpIIW6IpUBH3Rm4o7qCo?=
 =?us-ascii?Q?h3ek/mXOJP6dTFRD9OPMdX06NYmjEREfnwY0qG+5xc74aPDYz+QdK/HiS4Xh?=
 =?us-ascii?Q?wxgZ4/RiASQGWWj9CO8HfrWWOj5MU/jThw6y4KXCqy70iUGLc17A4w4UBRfV?=
 =?us-ascii?Q?gWauj9prrFyeW+xCND9yVk2jFjxSD7H8QLCsayiq+kt0h1lpsUOEj1vWdovv?=
 =?us-ascii?Q?mxzt5UfcajgKgHNBh+fDJE0BJSGnS+dFvDhUxH9rPfNN+xHzMW47JuA++uLQ?=
 =?us-ascii?Q?xbiwprMx80NgcIl0Fuf2GDaGOnTMEwi70FBbBb6NBW4/BTWefAxgYtRWb09e?=
 =?us-ascii?Q?FEVESqZQqqM7Amr5prnvGYGMnsUp8SJCwv7ZXrIX8v/GofgztCyRkflC8aiz?=
 =?us-ascii?Q?5yTGsjHej1/5CtbM8JMEjLr8XfmpqZjIK4br?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:27:21.6830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ab98d0-7efc-40fb-efb8-08ddb7d9d81f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4340

This submission contains 2 patches:

Patch 1 fixes an issue with matching an input event_name string with the
list of supported events in the event_list due to the trailing newline char.

Patch 2 adds checks to validate the input for event and enable fields, and
prevents the user from writing invalid values to these fields.

v1 -> v2
Split single patch into 2 patches addressing each fix separately

v2 -> v3
Patch 1: Remove the trailing newline character before comparing strings
Patch 2: Use kstrtobool() instead of kstrtouint() which would validate the input

Shravan Kumar Ramani (2):
  platform/mellanox: mlxbf-pmc: Remove newline char from event name
    input
  platform/mellanox: mlxbf-pmc: Validate event/enable input

 drivers/platform/mellanox/mlxbf-pmc.c | 28 ++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

-- 
2.43.2

