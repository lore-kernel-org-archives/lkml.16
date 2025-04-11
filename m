Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5744219E7D0;
	Fri, 11 Apr 2025 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378306; cv=fail; b=JYat7ewODJlRqIoKh4ltGA2rV7nkbcRfX3MyRAaquyi7UvVV9ba/H4DcxYmkv182ky2CKtmLDYYKD4LbOPm/oglZDyju2i3h/FnPH2VTlYbn0NdPaedoy7EcIOASzt7f/rAdgTUMWBNhTxvdF98DI6eJoIwgzn7kbujsxrDulcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378306; c=relaxed/simple;
	bh=WzS633rBRxycfyQAsclAz1BXAqfXHgeN/652/3TXsl8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=psqewdgY405VK6Z8Fx4dBjnt6LTyR31qBZvPIEx9hFBK1Z96CrNs/Al8kyLO6DHxSDBlJuiffJZrK7QLFnACo94t/mCZ5ENVdJVVwMeCOeoZn/GW7YUxYL8AGu7FOz1oXSpNi5KGFEzUeMSqY2btLlO6TPgzhbB6AGF+ewSn8Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KqdjsMwi; arc=fail smtp.client-ip=40.107.96.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KqdjsMwi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFhS5cvJf7Cg7qCWa5w6+JikXnl1J+p6H4lnMEL9GLBC0dIYswTtHeGJKklbsVGKaLGCfe5zRIGRdqHD90uKFlxCxZ2jwsG1G+O42ooO4+oXm1E7smuxZWAZbpzO+8u94zeD6DeBW+j+hJ9uKx3JnaWw1ISoqzDE0yVtfP0ucFr3AZYdF9oHozNrzNSfl0fjgxAlh+7HCZrkC+Vpej2bD5tl3GcHo4U34mC47JzYKDQ8xjx4qq8NpBMcFuKe1qy0jI64BIjEbOf6SBggWyaoCAFwIBIyaVHVJx5L6656EKNi2pXpf/i/FUmpsMENc1A6zNDNpV0cg0v1hX1LjPHJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTH9euHmhYEGyGQx5VgHMCBsIQZ4GY0Z19O7WQnJqPY=;
 b=LZaJsVROh8HWd7FLv3csF/Cv26NwK+QZFU8KQn9aSl3Mqnlj0ec5FKllIKO5aS3M3XNyoJWnA2JBsHSQLZ6dJt+JuMCpnBQkRQrrXC9WXfx0735kO2yX750kpnU+we7TabbnUmB4UFRNtsyUBSSvUD7yOKGYIFlazJNsPM340hwN8LkMFxDpsfJDKG63HUK3yhq6pdlVzndwavKAP2rbnJ9gm1tHAfwXZWkcU3sZJoO0CrnHt42g8Wjuqx//QtQDkvbCHNUi1eOFOSuH4l4snBogBsIDTH20cmrQK05oBpjlgtH3JiLbDr6ruv3Rom0srYgAfJAIKKwF/UAsGpLuYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTH9euHmhYEGyGQx5VgHMCBsIQZ4GY0Z19O7WQnJqPY=;
 b=KqdjsMwiR6gHdTd1eoKzx/0mOKCtYpnfbiRPEchmfGkYr7YQZQ67upLI+23z+6raakzKSxyI9MkbFjwElMGGxAXybYmaEK3W64zDRiDoImeqTjw3bKzc4+/W+rR2dHfBB7osFHBUqaQhxPed1bwI84tw+WoFD4o07ChApL1U/cM=
Received: from MW4P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::10)
 by IA1PR12MB7686.namprd12.prod.outlook.com (2603:10b6:208:422::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 13:31:40 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:303:115:cafe::c3) by MW4P220CA0005.outlook.office365.com
 (2603:10b6:303:115::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 13:31:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 13:31:39 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 08:31:36 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v8 00/10] misc: Move AMD side band interface(SBI) functionality
Date: Fri, 11 Apr 2025 13:31:12 +0000
Message-ID: <20250411133122.1806991-1-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|IA1PR12MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b8288b-eb0b-4209-e64b-08dd78fd3102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R59sD0pJxuOD+3io6ye8gpO+CckJETOHWk38xP0uPQgjjRcqbMFmDnIBgh34?=
 =?us-ascii?Q?OmUgpZd9V5RbNmSpn9JU7IpkLZPht6UUaeZd0dGv65imhxWqpZ8hADEMtteH?=
 =?us-ascii?Q?2NvGWvnmmb7QieNa0tPa+lgj9OVEoLsip6otlsrBYd+ZmOiyz89r4PPwptDG?=
 =?us-ascii?Q?MhbKMvcDyY0+jD3LSOLiZ3l9/7WErPMrX3mh2adPd269ja9dGKXKIOGDcy9y?=
 =?us-ascii?Q?5z403icW8Tx54DbsZDjOBQjMqcKsnIeVsrN2G+qHmnOoJm5mb2+SnvQxF9tU?=
 =?us-ascii?Q?0NULSt8Ccr2yis5gmio9M7FMGrMuIKGGvZmoHPaHYDpwLK23Csgm8LojgJQF?=
 =?us-ascii?Q?+3NtVHOD7J7tFIjhR2mHNNR6dEoOkQ/SoS5KFah+I6oTRaC/IzQsMAGv5h16?=
 =?us-ascii?Q?4aYCdrOO+vOP3a2y2m/Sm95rRJCzP0Zuf+ZdrqqF+rs9mR+8cGYk6oMWY9Vb?=
 =?us-ascii?Q?Ad79f5zPMA3Y0/I/YhHN/YwNFTC7+YCPP3us6mFGNV+khCN9g0hVD/5UkxC/?=
 =?us-ascii?Q?YxDD07qkP+bJTaa7Sx29wto9cycA8kt6SgCrXrBP5p/nx635Ij+WkswM4lch?=
 =?us-ascii?Q?R3Yw8wWjre6pU9bjESKtJ3qYA3NxWSowzbvLO6DPNMjL2cgUn12exZ1S2i+/?=
 =?us-ascii?Q?lUyB5YzaYslQ1ccFn5ZZq5hh+6I46Hgav6YXcqJZ03j2NAoYjOxkyBdtnAf/?=
 =?us-ascii?Q?LGWZ0nTlUrpEyq5pRORsOoUb21GW6+wljjd9qW8YF8mUrmST756nCD++QHyc?=
 =?us-ascii?Q?XKE/R3D4n3DUxr6SwBWQfD2+Qnf75ei2PxglbptvIyU4d6RmrXnkxh5LvV2h?=
 =?us-ascii?Q?G5EITpa6Qw9ac15ebWICZBS/gBEyRFSWts0pjN0PuIRNmo9NDi9birJcB/10?=
 =?us-ascii?Q?RUF6D0ws8jHQBNiMXK/5DtrLo82K5NOG2SI5pCFseVPzVyXHdfDKS5dEgWXJ?=
 =?us-ascii?Q?sLfdaGuEjCXDTs35YHsiC25e+hIQDiZACQCo+YY2iMbFGZ0RfbmJ9Ke3gmxg?=
 =?us-ascii?Q?rBVnHfxMCQlHcH+QyoPRZKowAbnEsBa+mVyeQUGQH1XFlbNBGd4/vjrHzRWy?=
 =?us-ascii?Q?fvUnRKZq9UugqG2Y+RgBwuROJt3xZSvjROs48wB0vMUrrkmaz7amA+JjSHbK?=
 =?us-ascii?Q?HHXFXcejrOGAuY1akx50aqkB7an5vNErD0yrNVRpAMXWEd5IJ9zfykSxZJ89?=
 =?us-ascii?Q?P6ToNYHg2Okt+8lA9/mwZv+IrUp0KQ3e6YlDTlz7U0DVGVaVLXG5oXG3b+rB?=
 =?us-ascii?Q?Sig47T2SZf/zj1rwJhMvXguOopR0GFCGWD4dl1uUiY2s0MIYS1wcvSaDqHla?=
 =?us-ascii?Q?4mRlHdlQ2i5aI4tS5SYkqLQt7aqMuVQtLiP7Q0K6rsm8GVghbgOO4oCPcFVD?=
 =?us-ascii?Q?zBQqhRfFem1j/1mclXhWsqcSXT6K1xzxjhvtSw+abrtKMcuX5iIQuUnCVgV+?=
 =?us-ascii?Q?gnnLYCqVfsEnPEx60mPf4JedULLpGO4U4mBvkIGNkrQe3OZqxGAg8fFWNIIY?=
 =?us-ascii?Q?T+OU0DHrlaXh3Q7E5dh3vWwpsf/S/CYC+ObBgBdP4QPB0g+YykgrJuFZGg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:31:39.9248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b8288b-eb0b-4209-e64b-08dd78fd3102
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7686

At present, sbrmi driver under hwmon subsystem, is probed as an i2c driver,
fetches data using APML specified protocol and reports through hwmon power sensor.

AMD provides additional information using custom protocols, which cannot be
enumerated as hwmon sensors. Hence, move the existing functionality from hwmon/
to misc/ and add support for following custom protocols
  - read Processor feature capabilities and configuration information
    through side band.
  - read Machine Check Architecture(MCA) registers over sideband.
    The information is accessed for range of MCA registers by passing
    register address and thread ID to the protocol.

NOTE: AMD defines Advanced Platform Management Link (APML) interface which provides
system management functionality access to the baseboard management
controller (BMC).

This patchset is an attempt to keep all APML core functionality in one place,
provide hwmon and IOCTL interface to user space
1. [Patch 1] Move the i2c client probe, hwmon sensors and sbrmi core functionality
   from drivers/hwmon to drivers/misc/
2. [Patch 2] Move sbrmi core functionality to new core file to export core functionality
3. [Patch 3] Move hwmon device sensor as separate entity
4. [Patch 4] Convert i2c to regmap which provides multiple benefits
   over direct smbus APIs.
    a. i2c/i3c support and
    b. 1 byte/2 byte RMI register size addressing
5. [Patch 5] Optimize wait condition with regmap API regmap_read_poll_timeout as per
   suggestion from Arnd
6. [Patch 6] Register a misc device which provides
    a. An ioctl interface through node /dev/sbrmiX
    b. Register sets is common across APML protocols. IOCTL is providing
       synchronization among protocols as transactions may create
       race condition.
7. [Subsequent patches 7, 8 and 9] add support for AMD custom protocols through additional IOCTLs
    a. CPUID
    b. MCAMSR
    c. Register xfer
8. [Patch 10] AMD side band description document

Open-sourced and widely used [1]_ will continue to provide user-space programmable API.

.. [1] https://github.com/amd/esmi_oob_library


*** BLURB HERE ***

Akshay Gupta (10):
  hwmon/misc: amd-sbi: Move core sbrmi from hwmon to misc
  misc: amd-sbi: Move protocol functionality to core file
  misc: amd-sbi: Move hwmon device sensor as separate entity
  misc: amd-sbi: Use regmap subsystem
  misc: amd-sbi: Optimize the wait condition for mailbox command
    completion
  misc: amd-sbi: Add support for AMD_SBI IOCTL
  misc: amd-sbi: Add support for CPUID protocol
  misc: amd-sbi: Add support for read MCA register protocol
  misc: amd-sbi: Add support for register xfer
  misc: amd-sbi: Add document for AMD SB IOCTL description

 Documentation/misc-devices/amd-sbi.rst        |  99 ++++
 Documentation/misc-devices/index.rst          |   1 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 drivers/hwmon/Kconfig                         |  10 -
 drivers/hwmon/sbrmi.c                         | 357 -------------
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/amd-sbi/Kconfig                  |  18 +
 drivers/misc/amd-sbi/Makefile                 |   4 +
 drivers/misc/amd-sbi/rmi-core.c               | 474 ++++++++++++++++++
 drivers/misc/amd-sbi/rmi-core.h               |  74 +++
 drivers/misc/amd-sbi/rmi-hwmon.c              | 120 +++++
 drivers/misc/amd-sbi/rmi-i2c.c                | 133 +++++
 include/uapi/misc/amd-apml.h                  | 152 ++++++
 14 files changed, 1079 insertions(+), 367 deletions(-)
 create mode 100644 Documentation/misc-devices/amd-sbi.rst
 delete mode 100644 drivers/hwmon/sbrmi.c
 create mode 100644 drivers/misc/amd-sbi/Kconfig
 create mode 100644 drivers/misc/amd-sbi/Makefile
 create mode 100644 drivers/misc/amd-sbi/rmi-core.c
 create mode 100644 drivers/misc/amd-sbi/rmi-core.h
 create mode 100644 drivers/misc/amd-sbi/rmi-hwmon.c
 create mode 100644 drivers/misc/amd-sbi/rmi-i2c.c
 create mode 100644 include/uapi/misc/amd-apml.h

-- 
2.25.1

