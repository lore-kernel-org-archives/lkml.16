Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2063.outbound.protection.outlook.com [40.107.95.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121A5610C;
	Mon, 28 Apr 2025 06:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745821857; cv=fail; b=JEHlHCanTF5iS/NoXXljhpglAJlVwcg91BZIaVg0b9KRmaqAQIHYfXjflinqq044ICAeJXCETMC0vu8l8K12+pxI+EUNT19TJ0SqXFOodrcP+k+k5R0B5mfgS7DZkwOaNLeDJkIoyIF6DsJP8wHJx+H4tjkZYCIY+PHXlSE/xvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745821857; c=relaxed/simple;
	bh=IIWfx0chUTmMdrjB5rAR5J7iGaA5yO7CzxZqYBPRxBs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hGV2mjSGP4oaFxkiEsA2E8q1j+h2x5WR7rgMQMgGKAIiQCl0OQj13xKhuOh9VipNZdtdqrTfoPXkyf5735xn79JdKC1ADQEsrzDrl+U1nsxsH0TkGStfiiiP338k8wwr5gsmLksBD9OzISod4SsEvwXccPytcC+gzJmIN7qUtVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CeHz4tcL; arc=fail smtp.client-ip=40.107.95.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CeHz4tcL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZcT/AINd5PqHzPWjeFcM3x1lslXRI+1iUtZjaEBr3H5U/OCDDzG+Ho3wWtMxNbhjo6AgzktpRY3DXkP+BnhjbWL8dBAWDq1KAxPZmZ/htp83HQ1pAqKanTJmczMwfDZmIFpdbMzdtevum+vRXh5BU2a/bEKywvWS0sQpTCN4NLM4CqreNPqkh683ewkmxkqM8+MdL8Z9fuk6rGjmwC9qaZBA1N+Se58sWiUylzFFMk88LTRAhtRMwCG2HKIgyc1BM1PX2Yps0go0viIypz9yUFA6TrbcEy98nDawgdA0AU/Edl0w2gjGzY3BElKNFX44xMR5jqYoWEFgdPFDzg+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoZGAtqG9GG2ZtPj4QwdZLs0e4UNK40cvlXpFBS8bcA=;
 b=h3Ab4qtcK3etfnechgeyw9krreqgVjfPMC9DTPqa1luiwCsCssjxqXUWCPuadx0kSEs6qJ+AmT1hD3gUUcCLW3kpBl7Viv9TAEPueO5T8KroAlTULz/kZ0V1t/HmDnlpfdr0HaTgQp1TnMfr7sxLjLnXQSPvSl/MN2HvQCLgJBSS1wL1pd9/W4hHwTQWUWcpzSYUv+kTBZS+phm43oErHKxuuwha2ShjjcDwHwzdb8YHIEfh/Ifi6bdRt+Q7IfzRQW1wkdMhafXTnOiAbjRSl4ExKJ09FC+cdiok4izgWPNR5t1lmKSo/0BvGN4wyE761XFByGOaznn7sClCRkqYDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoZGAtqG9GG2ZtPj4QwdZLs0e4UNK40cvlXpFBS8bcA=;
 b=CeHz4tcLgOAn1AyAZhJmsjXL/cUP5aHN3rvzutS+xjhfQZ5lOEGTQ/iwv471Kxb3p07Ox14QCSBQr2lh2qug9V/2KckrwirK8SV21fuqaJWUVXAb43+Z3a/uLC41Ea3P8ufn7MHF0J8V/dSbyxp37O/YsL8rHtKmKgm81v9s0Ck=
Received: from SN7PR04CA0088.namprd04.prod.outlook.com (2603:10b6:806:121::33)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 06:30:51 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:121:cafe::1c) by SN7PR04CA0088.outlook.office365.com
 (2603:10b6:806:121::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 06:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 06:30:51 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 01:30:47 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v9 00/10] misc: Move AMD side band interface(SBI) functionality
Date: Mon, 28 Apr 2025 06:30:24 +0000
Message-ID: <20250428063034.2145566-1-akshay.gupta@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 814248f1-9184-46ea-2c3b-08dd861e3887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E4cLtS/t1AYw7M8LgoEJ48GUSLXlNCS1jVbCs0eBKIAhqgKVyTzuDTskqjuG?=
 =?us-ascii?Q?kRgkq/yUSRoBd80EXfcp7MIdQHzQJn/76ODf24QXiO+xiprM9/lk3iVsk8yu?=
 =?us-ascii?Q?ZACS0hz7t7DGU3vqjHifF0vwMSCgcAPmFhGuBVXcD4GZDohFUosi2StvfEJO?=
 =?us-ascii?Q?zTvU0xy1WRiqnc1Gt0wr8S5QEDZ7t/UgT2heOJiPuSF/9uUuWqiqcqMHiY+C?=
 =?us-ascii?Q?weeBXp5XD6hm0yZL+jaDb8Ixc4eNjHzYpfz1x/exTAo9x7BF+dtR3wsKsTZM?=
 =?us-ascii?Q?0Ogqd6dNbHqmGMU19GOuRe6QwLPKvs2SwGZROvKD0COwkbaeZtp9x0MsY2a1?=
 =?us-ascii?Q?KRs2LaTCk0gIAmoNxUvK7YkbwpM4zHXsnXGzAaTcpowvGEz0hrYDRmf8DNau?=
 =?us-ascii?Q?zg4I9wJ/r+03wFP9LXnIOd32n2ZTwCcwgf29lwmbEuk5APb7E1ZIvjssFgbV?=
 =?us-ascii?Q?Y8wkWfXTxAsM946Vmqfl6KtriSqrrcxQboG4dCvd7UwbJ5apDXreEGV59Rll?=
 =?us-ascii?Q?uNFdal0fDL/R7za/Y4PPnE4xEU0Y5+760Lx/dsw+doKrAF0MWwANDob6nChU?=
 =?us-ascii?Q?pIFKnI29Siby8e7Ji8sq+2r7kyFMSTJmjKz/FED5U75hfqUEgo0jX9l1Jja8?=
 =?us-ascii?Q?BvlEi38TODP9yx2k/GZN9h9anHjams4NKCkHStJtkLal43YiSYvFtJNeibRE?=
 =?us-ascii?Q?NyKSjH7I86WqULBunbEyyOrGnJEHEf8B72phMhwTHI3sfj5+EEN1eAKg2xJA?=
 =?us-ascii?Q?/nSmwm9VqM3iPNH/487Rx80VoLmEk78XWruoS8k1v9Rrpnk0b1OH5YPvXEvk?=
 =?us-ascii?Q?viOneD99qO3mwskbOyOHOKt9eYWoCY97kjCi4VZEJGZoyM2zVVMxcLv8rzYB?=
 =?us-ascii?Q?vggFIjsTmH3DWMae1ISvZFgWF11sQv5Vula+0fVKQzXFaxm2QMRCmK64rxXU?=
 =?us-ascii?Q?nxmT/o+b3fjjEsMl2ri8h1MiEwhZbhD7x9Bsi6i1OR1K+1dVpEdXT8dtB6VJ?=
 =?us-ascii?Q?7crEiQFvhRLZhexY44SbnLDBZOhhiwyzrepZAxhWDQ/XnLNxjB40V6kfNdUL?=
 =?us-ascii?Q?MIgS9SVSt8/9w0XOIYUR5euVVIxY8lDRmy0HYumtU/hYw1c9Ao+z4T4haJbG?=
 =?us-ascii?Q?sTP1i1Ou34RRC3XUaZm+i0mCB9ptB41O1k6JB/DnAJxlgpklk9b3DsfCuRsi?=
 =?us-ascii?Q?Upt0/Wxxmw/MwloNOqLU69dyhqVZvkJ3AR27P8fW89Rdik+Y/cZCx2TDKWu6?=
 =?us-ascii?Q?2wFKgoI+nBM4tNqgDXgpJALPP8PRl88oqLapbQBicfoN4SZBj+cmSMdn44bV?=
 =?us-ascii?Q?F0QaTg4oCFwF//J8YFnPZIT6DJI/phOcQvf578Xibkg5WBZPSOgDhTj1GRYq?=
 =?us-ascii?Q?+jID5jGiAdx+fRSPYRyNCcx5L2Er2P1E3eBzwvWEM91aGQQpEL0YaSrZpLOH?=
 =?us-ascii?Q?Eo9aw9FVGHQVN5vDAIoZSJMp84aAnfKyxWy3g6I9iKDbGKmpto7MFB3Xeki5?=
 =?us-ascii?Q?cjahyZcy49LeobSV0QQNEwy+hMYDRCClGZg+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 06:30:51.1419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 814248f1-9184-46ea-2c3b-08dd861e3887
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095

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

