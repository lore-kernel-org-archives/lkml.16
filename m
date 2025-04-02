Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2047.outbound.protection.outlook.com [40.107.102.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FD6524C;
	Wed,  2 Apr 2025 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573545; cv=fail; b=BMjOUquO/xR77bCLQ0D8Y/DR+Ihxou5NDbHjNwfg4NbjKrJ0ujmjTKlKyiAARVgi+bsoB+XWsmUkYATiKxNfbWEBNpUDcwZ301wUerB3Pvbp7b1Tutr2yYxdgeJDPn+vzeOWO/G6uyL9+mmG5XYd39bpQc4sKFqtVBp/soomTlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573545; c=relaxed/simple;
	bh=jmVjbqJ762qgZGlpY5cbcHnE5Hloa+ZnFbvE14rbQPY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AL9+aBcyyouJsf1Gq5LkHnTZ2dObbmGWtXgLqx29phXVgkG1rAnJzDE/B7rj6AGgz+DyhW9h/EnxccWeJXusMj9JrLejYHeLDML6YqdTudkN80GVIf7/4G/mPKnUfshs0gmodV6rlvpvUywP/fW4r9cOm6pGqrYsLz4jFO4ZAq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wruGNJzE; arc=fail smtp.client-ip=40.107.102.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wruGNJzE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKCM4IgpR5qFSQC5xMhExkWN83IGLcvH2UPvrjJGHMYzCiLaFP+WgvR7FN+WBR3p2+y62v+5MVxYyKQcuznbQke2g9/lEOUTV45ONkqJcGgsqXYJQ5uEQul7gHAKxmPmCDUc3OkNs4gZiJAulEtPXUUefl0yeQho4sPR3GlKLFskpUAlM7mpPj81QzatFLsXl1FxJC8D8Qtvx4cH74splFLIOf7D/FMNBmNZbAHQFHDuEbX1qLLqp1Smj5wA+kUVC8JerALmNu31yOj8ufNLgtrvJ21WmZM6GVanYH+x8jI09gF3MxT++Ym4Jw3wb20Yz7QLSc9E+T7Jnvlyj2VbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkAmGCa8e60lAP+H5qezOE0yWDQTGezDcywCdXrCTYw=;
 b=A1mM2uYo4wwTRNto0GaCF7+Fz9nCK6itARwVEpB5lQdnyX7MkwbBSF4AftqiXF6FoUsMMRtgUBKCxNzAV4V0HJJXW4mFP1+kiYLdhMh3IpMUJ0Yof/wUQC+dBPOBRwOaFEQkrHH3I+gBFUWnjPhYI/SU2G3L08bW8BVVfXmaSv8hqVpBzVZeNb+di15dufjKsJb0OQR8E7lVF9V38O7VWEuzLwcG+uihrseiWpwDjEiVSY3LdidQkiMV9OV+D+tljlneEFwiBdQXwZBiM5lNJiw+QxOvqiHPaSbzUFgfNixr5fKX12+85Nc8U6hzMyPo0E6E30MEI9U2XgNDLWKLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkAmGCa8e60lAP+H5qezOE0yWDQTGezDcywCdXrCTYw=;
 b=wruGNJzE5kadSUrWwkXX7zQWyxEOr1tKYRWNcIFqDNgT0BO+O0i4YiVfDLbPxHGceK7/50XvJ5TnF60aweCbXQDWwOZtFYBozR1MX/xIRDxNbobKiqdXfvrYR0CkXQNlmEqOGiMjZR2xDcoBzynl5E0ChFhVCzJJ1Q3TK/NDwHs=
Received: from SJ0PR03CA0381.namprd03.prod.outlook.com (2603:10b6:a03:3a1::26)
 by SA3PR12MB8761.namprd12.prod.outlook.com (2603:10b6:806:312::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 05:58:59 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::bd) by SJ0PR03CA0381.outlook.office365.com
 (2603:10b6:a03:3a1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Wed,
 2 Apr 2025 05:58:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 05:58:58 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 00:58:54 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v7 00/10] misc: Move AMD side band interface(SBI) functionality
Date: Wed, 2 Apr 2025 05:58:30 +0000
Message-ID: <20250402055840.1346384-1-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|SA3PR12MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: 0836bb7b-bc3e-446d-a053-08dd71ab75d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DL7XpiEuaLFOOgymbpXewD92y1OMQRZfJGJTIz7EFpmBHnqknxCmr2K2epEY?=
 =?us-ascii?Q?6KE0sPmuK+aLx6Jsq8qSgh2wEE7d1Th739jxtJevNS/nfdxouHzAib3wlpeZ?=
 =?us-ascii?Q?sMgKcXLZpXqtz+NxhjN0YFaQBfgctGkfVaUwgMTUdHrerkEiajLC8HH8gXyr?=
 =?us-ascii?Q?7KzuqCPQY3hkj/oMUa+QJOp6WpK4cZbcXb6y/JN6BqEy8Vf+0M7vEBS8dJ/g?=
 =?us-ascii?Q?E+f8CxfspWOYhUc7eGwwY5mw3QIxWmDAu6erPMYlf0/jsr+IsU/d+2OuoTnr?=
 =?us-ascii?Q?Zau6mJ/9gHWCOa8IcVZOGg5cMPMjni0xOch+W7h7tJq9/YuE1/7PGOVfE/sF?=
 =?us-ascii?Q?MuBpYmzw2wUjZaDSaiw5dx/rQjtaohuF2mQ0k3zb4lVz88qlu/0QaQHLxf8d?=
 =?us-ascii?Q?57FeZHGwbZZ8znrbuGynEKZE81DgNF+sJJIxXIfABq6x/ziwGi2J3/06c7s+?=
 =?us-ascii?Q?pUS+eGAh6Kcs7elOct5Gq0DmL9PVwAKgVSodIZCuYwvSoNS92LUqDa43azEg?=
 =?us-ascii?Q?fVu1IeS03xe5VvXLA0W10lM4Ogae1hn9pCMxMNsFY5+oQ7HwT9imSSa4Ft2n?=
 =?us-ascii?Q?Fv0BYtkjaIuOXXg9VncCOtU5mq+Ro+sC2rm0tvataN4vDaGfVyEXZf6Weqpg?=
 =?us-ascii?Q?jwoEvGyieqHrw6hFYtUXfrzsnhMhb8/ZHwBUPE6QprkWTWK9DtBt8M75JaUk?=
 =?us-ascii?Q?nnCsPn3ZnHJEg9GnvjRRrxkq5bF69yOLFZUFmXusX4o0UK6x7pAB/D0aeBxi?=
 =?us-ascii?Q?I8gdc2PKMUIB2pu6oZ94qvHcExos94qllkCP9egcAm65rcdho0tVBSSk7uaj?=
 =?us-ascii?Q?IUMHKdzgkKElHjFcQCIcoYLupKKn5gs7rSmtfDAr7yA9rkXOIrt5YDC2OYbd?=
 =?us-ascii?Q?JBb4XKMNUAA2+o0NC2uwE9x0d2uzh1Kab9Q0p7zPltZwbPXioL66Lv0d1yk6?=
 =?us-ascii?Q?qdmXhyEGmUa5Kj4pp7EM0XJAjbAGNeS2nuWsRPR9DoUk3B9bskEOYNvXcoA3?=
 =?us-ascii?Q?OfOslNNU/ui8iN9uU9WVGPU5m/4sRO0XDNH7sa0cO9XJ2UQMAPuazvSVy+44?=
 =?us-ascii?Q?X+KqPzAHoBBkR3hLyCDUdGeVyKmybk0PfXi9JbjFGvnHXO5BuyAuLoA0c9Pn?=
 =?us-ascii?Q?9NFpFeH/3+andcuQRDG0AqK3+/1Z389JyxxJFiOBuTJZd3FYK83rr8X5BF/h?=
 =?us-ascii?Q?npwmY7MWI5tPWCgT5V8J6oPdQyCt/JBjCSn4nUeVO9rnEd0YlWD2DmQg+2ww?=
 =?us-ascii?Q?jcW8w+RkyMwYc6+k1/JvXBFCKmHMxBNsq2ZH0sWr6dxPM1dN6X8cUd0AcK7v?=
 =?us-ascii?Q?MLvUata+PokIY8THc2Zys+bWz0tyPlavisor2INCVEknNIx+OU0/miSMgh2V?=
 =?us-ascii?Q?S0PUTfmYVou3FUgcrYA2RgV8EvMNnamX06cp906kHlmLIUt3xlZjMVFvblIH?=
 =?us-ascii?Q?INfOCaxjMmrZbMZcoCOaEznOJg6TvbMq1yjoAELiiARISnf8vBIVz4vqgceC?=
 =?us-ascii?Q?OtR+qfbPCMg/K1o=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:58:58.5549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0836bb7b-bc3e-446d-a053-08dd71ab75d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8761

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
6. [Patch 6, 7] Register a misc device which provides
    a. An ioctl interface through node /dev/sbrmiX
    b. Register sets is common across APML protocols. IOCTL is providing
       synchronization among protocols as transactions may create
       race condition.
7. [Subsequent patches 8, 9 and 10] add support for AMD custom protocols
    a. CPUID
    b. MCAMSR
    c. Register xfer
8. [Patch 11] AMD side band description document

Open-sourced and widely used [1]_ will continue to provide user-space programmable API.

.. [1] https://github.com/amd/esmi_oob_library

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

 Documentation/misc-devices/amd-sbi.rst        |  87 ++++
 Documentation/misc-devices/index.rst          |   1 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 drivers/hwmon/Kconfig                         |  10 -
 drivers/hwmon/sbrmi.c                         | 357 --------------
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/amd-sbi/Kconfig                  |   9 +
 drivers/misc/amd-sbi/Makefile                 |   3 +
 drivers/misc/amd-sbi/rmi-core.c               | 446 ++++++++++++++++++
 drivers/misc/amd-sbi/rmi-core.h               |  67 +++
 drivers/misc/amd-sbi/rmi-hwmon.c              | 125 +++++
 drivers/misc/amd-sbi/rmi-i2c.c                | 134 ++++++
 include/uapi/misc/amd-apml.h                  |  97 ++++
 14 files changed, 973 insertions(+), 367 deletions(-)
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

