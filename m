Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D9236437
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348468; cv=fail; b=dCjMMgjQZztYAx4q2hvAGPIARuQoAdB0Aj0U3VZdURIdwZzbTCZYY8o6HRVzkzY2zr5tj4EPTsKmJNcUzqCFoIz+sDpbZSRJ4/WjYwutVa4x4cydLXmpXE9tLcOuWFIu7jnxiNtg3NW0JfoXplgEUB8j+8Xoh9BqvKvo4Nzwcp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348468; c=relaxed/simple;
	bh=OnoxouYxixEjot56u3L41Nrxane+AGlmkMYKZocYniU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=omzl5fk7bXSReHmEqWdnfunfZweeJZXBWMRrqdILQQywchzUmrLLZblIfGLh0W/YNblwKsSFdeqbRE2GINd15J4CFNnwqTncj/ehjprR6X+NQY+FEDPvOs9ge3mhJh06q15zAW7NOnkz2pbIAb0k+bLSGYCNqgx1MDesDkbOb0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NBZmSyNk; arc=fail smtp.client-ip=40.107.94.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NBZmSyNk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHL65nsKwXjNOiPlhv2N71qmkBcnqiKEPtSg9DGJWspnJCjZZmGPFDjkhU5OM7ksyrEzSgStvZ95MPtaig2JVyhYbSfhAD8ZOiqcwjAmYgrWCdeTfQQ+4DafHwi/mp5SbSDFwcz/recc9Wl4dbYfbuwcdEomXmfj18buRuJIyVgSDBjPWVDe1QdOrp1IQN9j0V+sYy4FGD46pt2qkCO+B3WvlcWlaSD3OxY8TPgBPgIB1pSAFJBclXBOeGNnOosYA/G1FK6FKm93l/qSihe1Shx9S9zIM7MIEYWjwL7nt/ZlYEYOu+KiGbtOs8m0iVQ3oYAjHyq9pvW9cpvmStO9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujRcOYWsxzmN/MPj7Rt5EJR/Of488e067Ik+aRDVdmY=;
 b=zNoLXvTU1y+hHNa3U5UO2lAwXWvjK5ytaKrBQRZDei+63Zz59D+1eil8qBX+VPOW38mzTu/7AvG/A/n6BQF5bHtn78b5JLBY/ousqxMYI/dVuLSeXQEYDu5runpFHEF/GFiZGH7l1+pfieujMEqMPdwPms8KmLCu8bqFCW4RTO22rse1b0bg5AfI/C+ertSMfxV6f1rMnZA9nW7yZ4Fh5VjP/KLknrYTJStiO58ZEXyE5mYgwhnEaY/IZY6TvaI0xuhsX32Wasz5TmTt6tqXJ3GeBeQt5fvQZbVu0+cjjNGVvsh4kjBoUiBlyJL0/YDiGYF4Kl8SBziiMxeRtVXvQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujRcOYWsxzmN/MPj7Rt5EJR/Of488e067Ik+aRDVdmY=;
 b=NBZmSyNktPRuc8R2pw6F6+bhyfDHOPhcv13Mad/jlZTl4vEr9Ar7OtVGLNigw9eRqDN+pBGYtMMBW/MZ4ReDjCAJrT9R6R0eTMB+K+O3y0nbx9gbYO3c97Jns1QgPK+Njy+prs5CmfFfKijylYRJSBNZ8kU5C5K4+mdaMHt5yaU=
Received: from PH7P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::18)
 by MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 1 Jul
 2025 05:40:59 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:326:cafe::22) by PH7P220CA0011.outlook.office365.com
 (2603:10b6:510:326::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Tue,
 1 Jul 2025 05:40:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Tue, 1 Jul 2025 05:40:58 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 00:40:55 -0500
From: Akshay Gupta <akshay.gupta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <arnd@arndb.de>, <shyam-sundar.s-k@amd.com>,
	<gautham.shenoy@amd.com>, <mario.limonciello@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <anand.umarji@amd.com>, Akshay Gupta
	<akshay.gupta@amd.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v3 1/2] misc: amd-sbi: Address potential integer overflow issue reported in smatch
Date: Tue, 1 Jul 2025 05:40:40 +0000
Message-ID: <20250701054041.373358-1-akshay.gupta@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|MW4PR12MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: ad4dbac7-d73f-432b-b3d8-08ddb861db51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fv0gaUI0hI0MsCAFQdjgOHE45JkewZzFYc7YoN8sYLGastDCrBtyFzzXu1uM?=
 =?us-ascii?Q?TO2nwtdo6k9BYP6nnpQPP5xA8+SR0UAwmUhzKLBGbTkvix4JlrfKQ3gZv5bI?=
 =?us-ascii?Q?oWxD1XozkeQGn+gqS+W40dAJdHbSLPeyvc7ao9wUDvDJAuvQKE63ZQTdpiJ8?=
 =?us-ascii?Q?7N8m3XJUwNg120OMvHrhuYBUOPZ6ZRuz8ijOo/rdMs3QKcaR8E3Zm6kYFpcR?=
 =?us-ascii?Q?oT+ef0RZv4317O7PQLsebo8qEDge/haQG0QaVt6WKD0LgCSZOE5NohgBGmiC?=
 =?us-ascii?Q?tsRS/IcVDiaN6lhi8ePdnp1mEuYvLcUrXDCXVIywCPPleLxQ4DX9/XMyRzAg?=
 =?us-ascii?Q?R9DhXbQGbnvjAsj3txEuq61TFeCw8+cFKSSkqMkDrghpwsvAKZXbgJbDdXgt?=
 =?us-ascii?Q?0JR6Sn30nGGYuNiANtQqjmYg32U9Wm4vAp+IWYQ+pKtSn20Ro1WYTxiQ5A73?=
 =?us-ascii?Q?kW4JZofRrDUlvJpuQexg6+ZW5iItM5VSd0FYzrlvj3AFP3yqD2h6TWTzX1mv?=
 =?us-ascii?Q?XNHbN8/QbK0QpT9R5fdby4iPWZcA5lOu++Qwvhdi6Ia7hDv1jtgOinzwl1hU?=
 =?us-ascii?Q?nXzG8sckNliHek+Y1qfG1A8Odmbge/8cTEdi3itM2k2ijR6tRQcvIROmhwlW?=
 =?us-ascii?Q?xgr4bwiPzWnk7wag7bxxa3WVpDg/ilrJVTrv71jn7KSlRjbx7cgIGSxKUjwf?=
 =?us-ascii?Q?SWA/3YALNUk+wd0I2lm1AXQevMX+nDW4zyC3TTg6Fg3mCqSpizieue1nW6tC?=
 =?us-ascii?Q?Db3MYPZsQDlOG1g6BK+Drfab5erPmZ0Oh7RFjHX6OcqZ09h/ti+Sd1877Y8i?=
 =?us-ascii?Q?62wqkKYJr+ocjwYhz1XdlJnDgr+xJEGNeQ4Ctl/6SWPTY6flQHDVSgmlVR/b?=
 =?us-ascii?Q?wyW8BhPyfahvcWHXlvnOOH1QnHhi5SzCfBeYT1b0FloOGPMtQbdnCQgf/xWY?=
 =?us-ascii?Q?6G2ncxVD9zb0/poTreiGAYW+0UVoTaVXYxSY01fu5dyQqi2lVnoT/8s+uOxx?=
 =?us-ascii?Q?oQReKooF9tESupCXn9egrlFGEqpwOfAg0wK8yxq1T1IojK6wgYxJmD8f+hmI?=
 =?us-ascii?Q?4YRNMjv/eKV4BCTEyutrejjK12boa+8S7CG4BFeJAEBNOozC366QNZ2Kq3YM?=
 =?us-ascii?Q?dZ6ILG3zdWJHdTiljIYj3D0zm1YrBnaVsu/9WsM7tPv2t07yh5Q99mQ+gFm1?=
 =?us-ascii?Q?wEnrARU8Jpx2H5SRtM2vXYtVSizm/HRxIhU3IuNBl7I+OnMVvDQT5GRiTt/U?=
 =?us-ascii?Q?z9amDxxxT69nqaYwdX/k1dOYQH4qP9MLTIFkQAycd6uvoH1JuoDsng0/tyae?=
 =?us-ascii?Q?bFYRlUVr3mKmGhQyArknTa6QkGlky7Yrsfy1Ct7T94FhYQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 05:40:58.6037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4dbac7-d73f-432b-b3d8-08ddb861db51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7165

Smatch warnings are reported for below commit,

Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
from Apr 28, 2025 (linux-next), leads to the following Smatch static
checker warning:

drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
drivers/misc/amd-sbi/rmi-core.c:132 rmi_cpuid_read() warn: potential integer overflow from user 'msg->cpu_in_out << 32'
drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: bitwise OR is zero '0xffffffff00000000 & 0xffff'
drivers/misc/amd-sbi/rmi-core.c:213 rmi_mca_msr_read() warn: potential integer overflow from user 'msg->mcamsr_in_out << 32'

CPUID thread data from input is available at byte 4 & 5, this
patch fixes to copy the user data correctly in the argument.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
---
Changes from v1:
 - Split patch as per Greg's suggestion

 drivers/misc/amd-sbi/rmi-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
index b653a21a909e..3570f3b269a9 100644
--- a/drivers/misc/amd-sbi/rmi-core.c
+++ b/drivers/misc/amd-sbi/rmi-core.c
@@ -42,7 +42,6 @@
 #define RD_MCA_CMD	0x86
 
 /* CPUID MCAMSR mask & index */
-#define CPUID_MCA_THRD_MASK	GENMASK(15, 0)
 #define CPUID_MCA_THRD_INDEX	32
 #define CPUID_MCA_FUNC_MASK	GENMASK(31, 0)
 #define CPUID_EXT_FUNC_INDEX	56
@@ -129,7 +128,7 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
 		goto exit_unlock;
 	}
 
-	thread = msg->cpu_in_out << CPUID_MCA_THRD_INDEX & CPUID_MCA_THRD_MASK;
+	thread = msg->cpu_in_out >> CPUID_MCA_THRD_INDEX;
 
 	/* Thread > 127, Thread128 CS register, 1'b1 needs to be set to 1 */
 	if (thread > 127) {
@@ -210,7 +209,7 @@ static int rmi_mca_msr_read(struct sbrmi_data *data,
 		goto exit_unlock;
 	}
 
-	thread = msg->mcamsr_in_out << CPUID_MCA_THRD_INDEX & CPUID_MCA_THRD_MASK;
+	thread = msg->mcamsr_in_out >> CPUID_MCA_THRD_INDEX;
 
 	/* Thread > 127, Thread128 CS register, 1'b1 needs to be set to 1 */
 	if (thread > 127) {
-- 
2.25.1

