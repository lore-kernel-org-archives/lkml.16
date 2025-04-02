Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74235231A21;
	Wed,  2 Apr 2025 05:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743573578; cv=fail; b=VG5hqaYRX8dZlDrEGqSBBQRWhNvuy7MUnsSYNe5XKmkiRFxA4YsY2X5cpOgS2NS+e7xNyzGvK4c4SwcllVIRTGDKirYkHz1AIW+jRsffxu27NmmaleOeWFx/hLonlF3KgL9pj1Q9MvTxFj+HgQf6uqXPlC1M/R3nH/CNf6rsoaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743573578; c=relaxed/simple;
	bh=+8iF7vpotcjN4S1SxvmCO2oTng0yDuRAHOWsVzHycf0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YoTdKblF21DotEPyOmfzRYRmQKKtvsgKT6Zz/7G94qhIJyuPCS+eSyyRS6kwaselynpr5+Rt50F04O3utt2gzbgpUScvNUGeHq70uVCBJKG1Vz8hCc3Fw7EU+vFPQVo6msYlzWQOuWEsuAHcubiP5H3+5k4e/LZM8DJFFkiDqUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OT5EAVPu; arc=fail smtp.client-ip=40.107.93.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OT5EAVPu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFD7mIuRQVxFa/JLh7TUv8QVHD27Y2m0nDq1jCiXG5lE4OoPwVPW2r6ipV4YZfl8uj8YXfqQPH94BAOG8Uxupy4cX5sHPDVHx2P9bmeQRLD8XxLBDKWuoriJMKIUn8PuIa/BnZfuxmNtNKYuNwounB00LboaeXdcJ2yTOo+bY+au2hxkzkvGaK3oTUTliEtRFzwW5ydLqiWlA6UD2UduWrNEo+445BkAxEy5G7eaXi7jT5LnMU61s1UkFctLCUAvU3ZsZ1mQCESFg81Fk4A1/+RRnNZ43ekNPVOBdPx0VW4GhdJMFKN+qoFj8n8Xaa+kDq58Qdxl6PQDtJ4GkT86Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cYdM2hcWEH/Dr1Jt0Wng3Igkn1sZegHwbOqcNC+prQ=;
 b=G6n3pH4CVK0Nn25yvG5ZREG2UyrBk9IjVrssCFDA2ojhBjtfcRrD2oreWMmyGMy7IWMnNnMj4zT3ZNcQ+utnUQKjAblTkMdeN75D3jm3dCVwNgju+y2cuVzVNFLIie+MsFjEgUEJgFGW6UtJS4+X9k4FJavbMQ0xPghL06xp7vJgNKsB2KLC4tq8vGniKpCxdRYU8C3BvhPbL3Vsc2ZHri9G2r1xZ6mwzDsSCxBuhm8s+/4E9E5BwuaSSbkw5Ftt4KGomWuTrPVJ5KzUDonap+IK79Muo3BE0TWtfBPBvtl4EhCyVqjMlp7WjLlDK2lukprSysXM+0JIQyGTIXmxzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cYdM2hcWEH/Dr1Jt0Wng3Igkn1sZegHwbOqcNC+prQ=;
 b=OT5EAVPuWJIS7Qf1mbbFM5Wpn7fvxrkD6IfmKfaL8ZG8M12fz+I2WejxTKrPIgNWRQkDgfd3viD72QhZEpRWHybAn6/CarvASpgfQsqi7ORqiuOWE8sIi3MvwWrvUi6jivhyBborgHcobwDUDlp6TGHBBpnuO6MQDBCDyhr2CCU=
Received: from MW4PR03CA0121.namprd03.prod.outlook.com (2603:10b6:303:8c::6)
 by IA0PR12MB8974.namprd12.prod.outlook.com (2603:10b6:208:488::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 05:59:28 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:8c:cafe::bb) by MW4PR03CA0121.outlook.office365.com
 (2603:10b6:303:8c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.52 via Frontend Transport; Wed,
 2 Apr 2025 05:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 05:59:25 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 00:59:21 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux@roeck-us.net>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<shyam-sundar.s-k@amd.com>, <gautham.shenoy@amd.com>,
	<mario.limonciello@amd.com>, <naveenkrishna.chatradhi@amd.com>,
	<anand.umarji@amd.com>, Akshay Gupta <akshay.gupta@amd.com>
Subject: [PATCH v7 06/10] misc: amd-sbi: Add support for AMD_SBI IOCTL
Date: Wed, 2 Apr 2025 05:58:36 +0000
Message-ID: <20250402055840.1346384-7-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|IA0PR12MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4c118b-7091-4ef8-924e-08dd71ab85f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q8WRQgZFGGo0jUhEB1/iZ9AKb/bJvjcUu246OrSNYo/ChJ2MmXgLzxxijwoU?=
 =?us-ascii?Q?0jzlOyB9aqorygOgkpVY8yz4NmWDuqsVnQ568C9wND6VdKRrPEoJBZBIMt9s?=
 =?us-ascii?Q?j+N2wOnAexifLtTGIjaEOHFH07bRnqWCicPB+KCkMs1cVy/uaQ6PGpYXvb/a?=
 =?us-ascii?Q?GDjftvCBb0It54ZqkqI1Y4Sw9UHyjDHL8GKzImpMDGgf+cAUps0Pa/lRfKW/?=
 =?us-ascii?Q?FY4OkYp+scb4bmZdCDkWYsAUumYYHcvio+5KEfKJuT3FQitCCr5LThqOtJno?=
 =?us-ascii?Q?s8gzkoe1ST8WnXsaAl4gJy6BVk9hMm5yp2Q7xIAZ/kcLzha0s7rwOigjdi9D?=
 =?us-ascii?Q?nG7rKZnFk9m75TmGWCbEzT9ceueVxJ0CL+pbJyJ/pMe10aH8jG23W4YYAkHK?=
 =?us-ascii?Q?H/YgfFQmvgxBclG7NxSiKTzdiSi99SPr92INzyyBLF5beBVsLtWseURXTKID?=
 =?us-ascii?Q?8k8+2IIKayu+loO7T3ZbHBe7x2vO4mGfIao+sui4+ZaW3YghFrTvnwSsqpIw?=
 =?us-ascii?Q?NTPWKqeJT0EyD4DLbsrAcXZWQ7Bps9EEnEIR0sKguD0i+to6I2mZjm1HXxLX?=
 =?us-ascii?Q?dqqyqAjwLqU7X7l7qg1ixl/fQdzb2O2vFZ0ZiuYe8OqEDBk4jhfsyVVeI3mM?=
 =?us-ascii?Q?jPa7UBOLPyigMyzTQZEbJOOV4DCkoFjtaVPIZMy73+NhDE7WFIvzLK+6TWvy?=
 =?us-ascii?Q?6z7biL4pIOlMIe5Vz0uzPmdJNJW7x/m5ND3eldQKGTWTGl6ZJuKYppQkxZ8Z?=
 =?us-ascii?Q?rq0hz/jAABe6zvI+c1M72ja9w72xrre0tvd+gAPvcPF6wKLq7ADWx/eV/JDA?=
 =?us-ascii?Q?VoFnmCWE9aqK/0OnRaQhow4E/wOg1h0T8Zk7YSUhv16CusVvKzU6uGPq7q7c?=
 =?us-ascii?Q?Y4Q3qjIPaqq73pKkb5rGKEm7hZaSDD2+mDERE5OyWd3aIVhPMjXtiDNjadHI?=
 =?us-ascii?Q?k8Wh2/tvTv1mSWt0Jeg1I/xTaiFq/zup3TaIWCusLgmKgbbxAGJAZt9HU0Lf?=
 =?us-ascii?Q?BHryPUhJFaeWsT4hPyXlkG9+2EAZLuuhr0mvxpLSr2i4aNOT7PfDFUJRYNuT?=
 =?us-ascii?Q?NUeU7kg+KuQQt9vlevEY0G1ZkZ+n8ZTLVw+wzAQPq33FXgzbhuAZtJGhTtsA?=
 =?us-ascii?Q?nbPzZzexRe6El7q/VYoPTE4e7I9pC0vZLGa/VW+eZQuOSl5FHUdTJPu8Mojc?=
 =?us-ascii?Q?OGCF/KSWnWzPBGAMz8s+Lr1+P9IbQ/MZtq0fKHyc/yKmvbnXOHwJApCuvu9W?=
 =?us-ascii?Q?aVN2b0tTPTJ8cZMhM69jB5/ehP0vql6i9PYEHkHUlWMgcDfoDnq/0w2BTmlZ?=
 =?us-ascii?Q?0ERZ6P5i347qI/V4Ni+i9YJEyxVr/nbcVQQloQ/11a/1ivvMIeYGWmQ9BKU6?=
 =?us-ascii?Q?V/xaOsgXd8ao0x13qnNx2XfsCdmlr5EZOv8XZSuMsflErplPb7/IJ5hpBDsY?=
 =?us-ascii?Q?w0AsOxEp7KX7fhIy3N3X5CwttS2NdI3nXoBGf/DDlzme6f0Ks9U8NQMdCJKu?=
 =?us-ascii?Q?xVDv1kJpnGhhn2E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 05:59:25.5594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4c118b-7091-4ef8-924e-08dd71ab85f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8974

The present sbrmi module only support reporting power via hwmon.
However, AMD data center range of processors support various
system management functionality using custom protocols defined in
Advanced Platform Management Link (APML) specification.

Register a miscdevice, which creates a device /dev/sbrmiX with an IOCTL
interface for the user space to invoke the APML Mailbox protocol, which
is already defined in sbrmi_mailbox_xfer().

The APML protocols depend on a set of RMI registers. Having an IOCTL
as a single entry point will help in providing synchronization among
these protocols as multiple transactions on RMI register set may
create race condition.
Support for other protocols will be added in subsequent patches.

APML mailbox protocol returns additional error codes written by
SMU firmware in the out-bound register 0x37. These errors include,
invalid core, message not supported over platform and
others. This additional error codes can be used to provide more
details to user space.

Open-sourced and widely used https://github.com/amd/esmi_oob_library
will continue to provide user-space programmable API.

Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes since v6:
- Address Arnd comments
 - Squash patch 7 in this patch
 - Remove check on "cmd" size as it's implied
 - Update check on input structure, msg.cmd to max value of 0xFF

Changes since v5:
- Address review comment
 - Address Arnd comments
 - Add check for cmd in ioctl
 - Remove attribute packed from uapi header file structure apml_message{}
- Address kernel test robot warn:
 - warn: can 'data' even be NULL?

Changes since v4:
- Address review comment
 - Address Greg review comments
 - Not initialize ret
 - return on error
- Previously patch 4
- Fix documentation warning

Changes since v3:
- Previously patch 3
- Documentation and comments changes

Changes since v2:
- update the MACROS name as per feedback

Changes since v1:
- Previously patch 5
- Add IOCTL description in ioctl-number.rst
- Split patch as per suggestion.

 Documentation/misc-devices/index.rst          |  1 +
 .../userspace-api/ioctl/ioctl-number.rst      |  2 +
 drivers/misc/amd-sbi/rmi-core.c               | 98 +++++++++++++++++--
 drivers/misc/amd-sbi/rmi-core.h               | 15 ++-
 drivers/misc/amd-sbi/rmi-hwmon.c              | 15 +--
 drivers/misc/amd-sbi/rmi-i2c.c                | 26 ++++-
 include/uapi/misc/amd-apml.h                  | 69 +++++++++++++
 7 files changed, 198 insertions(+), 28 deletions(-)
 create mode 100644 include/uapi/misc/amd-apml.h

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 8c5b226d8313..081e79415e38 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -12,6 +12,7 @@ fit into other categories.
    :maxdepth: 2
 
    ad525x_dpot
+   amd-sbi
    apds990x
    bh1770glc
    c2port
diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 66dcfaae698b..555b483a7a3e 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -394,6 +394,8 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:mathieu.desnoyers@efficios.com>
 0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                    AMD HSMP EPYC system management interface driver
                                                                      <mailto:nchatrad@amd.com>
+0xF9  00-0F  uapi/misc/amd-apml.h		                     AMD side band system management interface driver
+                                                                     <mailto:naveenkrishna.chatradhi@amd.com>
 0xFD  all    linux/dm-ioctl.h
 0xFE  all    linux/isst_if.h
 ====  =====  ======================================================= ================================================================
diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index 1d5e2556ab88..aba8f7e721c4 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -7,7 +7,10 @@
  */
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/fs.h>
 #include <linux/i2c.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
 #include "rmi-core.h"
@@ -20,15 +23,17 @@
 #define TRIGGER_MAILBOX	0x01
 
 int rmi_mailbox_xfer(struct sbrmi_data *data,
-		     struct sbrmi_mailbox_msg *msg)
+		     struct apml_message *msg)
 {
-	unsigned int bytes;
+	unsigned int bytes, ec;
 	int i, ret;
 	int sw_status;
 	u8 byte;
 
 	mutex_lock(&data->lock);
 
+	msg->fw_ret_code = 0;
+
 	/* Indicate firmware a command is to be serviced */
 	ret = regmap_write(data->regmap, SBRMI_INBNDMSG7, START_CMD);
 	if (ret < 0)
@@ -44,8 +49,8 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	 * Command Data In[31:0] to SBRMI::InBndMsg_inst[4:1]
 	 * SBRMI_x3C(MSB):SBRMI_x39(LSB)
 	 */
-	for (i = 0; i < 4; i++) {
-		byte = (msg->data_in >> i * 8) & 0xff;
+	for (i = 0; i < AMD_SBI_MB_DATA_SIZE; i++) {
+		byte = msg->data_in.reg_in[i];
 		ret = regmap_write(data->regmap, SBRMI_INBNDMSG1 + i, byte);
 		if (ret < 0)
 			goto exit_unlock;
@@ -69,29 +74,104 @@ int rmi_mailbox_xfer(struct sbrmi_data *data,
 	if (ret)
 		goto exit_unlock;
 
+	ret = regmap_read(data->regmap, SBRMI_OUTBNDMSG7, &ec);
+	if (ret || ec)
+		goto exit_clear_alert;
 	/*
 	 * For a read operation, the initiator (BMC) reads the firmware
 	 * response Command Data Out[31:0] from SBRMI::OutBndMsg_inst[4:1]
 	 * {SBRMI_x34(MSB):SBRMI_x31(LSB)}.
 	 */
-	if (msg->read) {
-		for (i = 0; i < 4; i++) {
+	if (msg->data_in.reg_in[AMD_SBI_RD_FLAG_INDEX]) {
+		for (i = 0; i < AMD_SBI_MB_DATA_SIZE; i++) {
 			ret = regmap_read(data->regmap,
 					  SBRMI_OUTBNDMSG1 + i, &bytes);
 			if (ret < 0)
-				goto exit_unlock;
-			msg->data_out |= bytes << i * 8;
+				break;
+			msg->data_out.reg_out[i] = bytes;
 		}
 	}
 
+exit_clear_alert:
 	/*
 	 * BMC must write 1'b1 to SBRMI::Status[SwAlertSts] to clear the
 	 * ALERT to initiator
 	 */
 	ret = regmap_write(data->regmap, SBRMI_STATUS,
 			   sw_status | SW_ALERT_MASK);
-
+	if (ec) {
+		ret = -EPROTOTYPE;
+		msg->fw_ret_code = ec;
+	}
 exit_unlock:
 	mutex_unlock(&data->lock);
 	return ret;
 }
+
+static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct apml_message msg = { 0 };
+	struct sbrmi_data *data;
+	bool read = false;
+	int ret;
+
+	if (cmd != SBRMI_IOCTL_CMD)
+		return -ENOTTY;
+
+	data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
+
+	/* Copy the structure from user */
+	if (copy_from_user(&msg, (struct apml_message __user *)arg,
+			   sizeof(struct apml_message)))
+		return -EFAULT;
+
+	/* Is this a read/monitor/get request */
+	if (msg.data_in.reg_in[AMD_SBI_RD_FLAG_INDEX])
+		read = true;
+
+	switch (msg.cmd) {
+	/*
+	 * commands(msg.cmd) supported are platform specific and
+	 * is validated by SMUFW
+	 */
+	case 0 ... 0xFF:
+		/* Mailbox protocol */
+		ret = rmi_mailbox_xfer(data, &msg);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Copy results back to user only for get/monitor commands and firmware failures */
+	if ((read && !ret) || ret == -EPROTOTYPE) {
+		if (copy_to_user((struct apml_message __user *)arg, &msg,
+				 sizeof(struct apml_message)))
+			ret = -EFAULT;
+	}
+	return ret;
+}
+
+static const struct file_operations sbrmi_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= sbrmi_ioctl,
+	.compat_ioctl	= compat_ptr_ioctl,
+};
+
+int create_misc_rmi_device(struct sbrmi_data *data,
+			   struct device *dev)
+{
+	data->sbrmi_misc_dev.name	= devm_kasprintf(dev,
+							 GFP_KERNEL,
+							 "sbrmi-%x",
+							 data->dev_static_addr);
+	data->sbrmi_misc_dev.minor	= MISC_DYNAMIC_MINOR;
+	data->sbrmi_misc_dev.fops	= &sbrmi_fops;
+	data->sbrmi_misc_dev.parent	= dev;
+	data->sbrmi_misc_dev.nodename	= devm_kasprintf(dev,
+							 GFP_KERNEL,
+							 "sbrmi-%x",
+							 data->dev_static_addr);
+	data->sbrmi_misc_dev.mode	= 0600;
+
+	return misc_register(&data->sbrmi_misc_dev);
+}
diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
index bbb6bb1cefde..e3a11575d19e 100644
--- a/drivers/misc/amd-sbi/rmi-core.h
+++ b/drivers/misc/amd-sbi/rmi-core.h
@@ -6,10 +6,12 @@
 #ifndef _SBRMI_CORE_H_
 #define _SBRMI_CORE_H_
 
+#include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <uapi/misc/amd-apml.h>
 
 /* SB-RMI registers */
 enum sbrmi_reg {
@@ -48,18 +50,15 @@ enum sbrmi_msg_id {
 
 /* Each client has this additional data */
 struct sbrmi_data {
+	struct miscdevice sbrmi_misc_dev;
 	struct regmap *regmap;
+	/* Mutex locking */
 	struct mutex lock;
 	u32 pwr_limit_max;
+	u8 dev_static_addr;
 };
 
-struct sbrmi_mailbox_msg {
-	u8 cmd;
-	bool read;
-	u32 data_in;
-	u32 data_out;
-};
-
-int rmi_mailbox_xfer(struct sbrmi_data *data, struct sbrmi_mailbox_msg *msg);
+int rmi_mailbox_xfer(struct sbrmi_data *data, struct apml_message *msg);
 int create_hwmon_sensor_device(struct device *dev, struct sbrmi_data *data);
+int create_misc_rmi_device(struct sbrmi_data *data, struct device *dev);
 #endif /*_SBRMI_CORE_H_*/
diff --git a/drivers/misc/amd-sbi/rmi-hwmon.c b/drivers/misc/amd-sbi/rmi-hwmon.c
index 9a86fc4a0e7d..63d50bfa0c3d 100644
--- a/drivers/misc/amd-sbi/rmi-hwmon.c
+++ b/drivers/misc/amd-sbi/rmi-hwmon.c
@@ -6,6 +6,7 @@
  */
 #include <linux/err.h>
 #include <linux/hwmon.h>
+#include <uapi/misc/amd-apml.h>
 #include "rmi-core.h"
 
 /* Do not allow setting negative power limit */
@@ -15,7 +16,7 @@ static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 		      u32 attr, int channel, long *val)
 {
 	struct sbrmi_data *data = dev_get_drvdata(dev);
-	struct sbrmi_mailbox_msg msg = { 0 };
+	struct apml_message msg = { 0 };
 	int ret;
 
 	if (!data)
@@ -24,7 +25,7 @@ static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 	if (type != hwmon_power)
 		return -EINVAL;
 
-	msg.read = true;
+	msg.data_in.reg_in[AMD_SBI_RD_FLAG_INDEX] = 1;
 	switch (attr) {
 	case hwmon_power_input:
 		msg.cmd = SBRMI_READ_PKG_PWR_CONSUMPTION;
@@ -35,7 +36,7 @@ static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 		ret = rmi_mailbox_xfer(data, &msg);
 		break;
 	case hwmon_power_cap_max:
-		msg.data_out = data->pwr_limit_max;
+		msg.data_out.mb_out[AMD_SBI_RD_WR_DATA_INDEX] = data->pwr_limit_max;
 		ret = 0;
 		break;
 	default:
@@ -44,7 +45,7 @@ static int sbrmi_read(struct device *dev, enum hwmon_sensor_types type,
 	if (ret < 0)
 		return ret;
 	/* hwmon power attributes are in microWatt */
-	*val = (long)msg.data_out * 1000;
+	*val = (long)msg.data_out.mb_out[AMD_SBI_RD_WR_DATA_INDEX] * 1000;
 	return ret;
 }
 
@@ -52,7 +53,7 @@ static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel, long val)
 {
 	struct sbrmi_data *data = dev_get_drvdata(dev);
-	struct sbrmi_mailbox_msg msg = { 0 };
+	struct apml_message msg = { 0 };
 
 	if (!data)
 		return -ENODEV;
@@ -68,8 +69,8 @@ static int sbrmi_write(struct device *dev, enum hwmon_sensor_types type,
 	val = clamp_val(val, SBRMI_PWR_MIN, data->pwr_limit_max);
 
 	msg.cmd = SBRMI_WRITE_PKG_PWR_LIMIT;
-	msg.data_in = val;
-	msg.read = false;
+	msg.data_in.mb_in[AMD_SBI_RD_WR_DATA_INDEX] = val;
+	msg.data_in.reg_in[AMD_SBI_RD_FLAG_INDEX] = 0;
 
 	return rmi_mailbox_xfer(data, &msg);
 }
diff --git a/drivers/misc/amd-sbi/rmi-i2c.c b/drivers/misc/amd-sbi/rmi-i2c.c
index 7a9801273a4c..d9308b52eab9 100644
--- a/drivers/misc/amd-sbi/rmi-i2c.c
+++ b/drivers/misc/amd-sbi/rmi-i2c.c
@@ -38,15 +38,15 @@ static int sbrmi_enable_alert(struct sbrmi_data *data)
 
 static int sbrmi_get_max_pwr_limit(struct sbrmi_data *data)
 {
-	struct sbrmi_mailbox_msg msg = { 0 };
+	struct apml_message msg = { 0 };
 	int ret;
 
 	msg.cmd = SBRMI_READ_PKG_MAX_PWR_LIMIT;
-	msg.read = true;
+	msg.data_in.reg_in[AMD_SBI_RD_FLAG_INDEX] = 1;
 	ret = rmi_mailbox_xfer(data, &msg);
 	if (ret < 0)
 		return ret;
-	data->pwr_limit_max = msg.data_out;
+	data->pwr_limit_max = msg.data_out.mb_out[AMD_SBI_RD_WR_DATA_INDEX];
 
 	return ret;
 }
@@ -81,8 +81,25 @@ static int sbrmi_i2c_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	data->dev_static_addr = client->addr;
 	dev_set_drvdata(dev, data);
-	return create_hwmon_sensor_device(dev, data);
+
+	ret = create_hwmon_sensor_device(dev, data);
+	if (ret < 0)
+		return ret;
+	return create_misc_rmi_device(data, dev);
+}
+
+static void sbrmi_i2c_remove(struct i2c_client *client)
+{
+	struct sbrmi_data *data = dev_get_drvdata(&client->dev);
+
+	misc_deregister(&data->sbrmi_misc_dev);
+	/* Assign fops and parent of misc dev to NULL */
+	data->sbrmi_misc_dev.fops = NULL;
+	data->sbrmi_misc_dev.parent = NULL;
+	dev_info(&client->dev, "Removed sbrmi-i2c driver\n");
+	return;
 }
 
 static const struct i2c_device_id sbrmi_id[] = {
@@ -105,6 +122,7 @@ static struct i2c_driver sbrmi_driver = {
 		.of_match_table = of_match_ptr(sbrmi_of_match),
 	},
 	.probe = sbrmi_i2c_probe,
+	.remove = sbrmi_i2c_remove,
 	.id_table = sbrmi_id,
 };
 
diff --git a/include/uapi/misc/amd-apml.h b/include/uapi/misc/amd-apml.h
new file mode 100644
index 000000000000..d0c548e34150
--- /dev/null
+++ b/include/uapi/misc/amd-apml.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2021-2024 Advanced Micro Devices, Inc.
+ */
+#ifndef _AMD_APML_H_
+#define _AMD_APML_H_
+
+#include <linux/types.h>
+
+/* These are byte indexes into data_in and data_out arrays */
+#define AMD_SBI_RD_WR_DATA_INDEX	0
+#define AMD_SBI_REG_OFF_INDEX		0
+#define AMD_SBI_REG_VAL_INDEX		4
+#define AMD_SBI_RD_FLAG_INDEX		7
+
+#define AMD_SBI_MB_DATA_SIZE		4
+
+struct apml_message {
+	/*
+	 * [0]...[3] mailbox 32bit input
+	 * [7] read/write functionality
+	 */
+	union {
+		__u32 mb_in[2];
+		__u8 reg_in[8];
+	} data_in;
+	/*
+	 * 8 bit data for reg read,
+	 * 32 bit data in case of mailbox,
+	 */
+	union {
+		__u32 mb_out[2];
+		__u8 reg_out[8];
+	} data_out;
+	/* message ids:
+	 * Mailbox Messages:	0x0 ... 0x999
+	 */
+	__u32 cmd;
+	/*
+	 * Error code is returned in case of soft mailbox
+	 */
+	__u32 fw_ret_code;
+};
+
+/*
+ * AMD sideband interface base IOCTL
+ */
+#define SB_BASE_IOCTL_NR	0xF9
+
+/**
+ * DOC: SBRMI_IOCTL_CMD
+ *
+ * @Parameters
+ *
+ * @struct apml_message
+ *	Pointer to the &struct apml_message that will contain the protocol
+ *	information
+ *
+ * @Description
+ * IOCTL command for APML messages using generic _IOWR
+ * The IOCTL provides userspace access to AMD sideband protocols
+ * The APML RMI module checks whether the cmd is
+ * - Mailbox message read/write(0x0~0x999)
+ * - returning "-EFAULT" if none of the above
+ * "-EPROTOTYPE" error is returned to provide additional error details
+ */
+#define SBRMI_IOCTL_CMD		_IOWR(SB_BASE_IOCTL_NR, 0, struct apml_message)
+
+#endif /*_AMD_APML_H_*/
-- 
2.25.1

