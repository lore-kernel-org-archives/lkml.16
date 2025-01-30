Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9711F0E36;
	Thu, 30 Jan 2025 21:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272067; cv=fail; b=GXiB0LHDGuLx5+bgCD9LZ3ec1XaooIX6RgI7QyE6JIsiMe6Bnk9anCoHJaNQfvGPpKsVWTSoRmqs+tDe3pfDE/oKSdxt9auzt2u9mRHXiPHTq1FlylqTBted5Pr53xmrZ/vAE66IYCc/a9mmUgrO0izN6ALpLVpF89G/ZezoRXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272067; c=relaxed/simple;
	bh=I501gwDGUNU+G58x42AkYuRXUxZyKunmuAbn6wgoCFg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Be1Ore4kCLoQGAolNHij8qJsENdFegEWT4mCp2Ne4GxHTI1yZ+z3q1GxRfWJD/3I74kUnHqEwjMmy/Sl1LXz/wsokC11LHB1/HmG3HAR49JYIs6WoIHF6frijQEirUGe1DmECeVrlZ/bMTXnloYvBUM7vzk4JJRTUtQJM7txFJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S6v0YKd2; arc=fail smtp.client-ip=40.107.243.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S6v0YKd2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFF4Hna6P4vo92dKd9a6iLQq4L01n8CuH1I5W+5dqdGyg53piwLijSbCZojk0dr1gKxP2ZAZwu7K3xIkcdDRC55vdB/AnfDDZ1aPZiScvFvXNmcoWtSt5BVU0XawAqYoahnif+PbGtHrTREeHXijEBwPyZRLf94KGcPUeDdelgv0B9E2eirz8fdjLl6Tf8HaCTf2x18QhnWcQwaJWy9dSbIvfSB+AORqCvMvaDeXmzCB90RdJ8iZlk/xOtcYJJaOA32DUwKSSCsbcfVraL7an96//4yIgTFZUej8lXANkOcmT81ZBAxN20JQuARM+lLEiniqgyKeTBrXgWhEMhff/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PITi6STojgCTAZrtDuMnFR380JR9Ws6wrHOuRyf3LM=;
 b=S7MZNdfYb7AAnYW1b57tHv7snLOLuE3h4k0GpAT9h3bRGCqi1MxOz7gz96p0sArxFSOfHy8wOjPol3egKoIzvwV1Qf5twyO1wV6tmGZiw1RXAL+oJOOubSi5d4nJU9b4fZ0XNYP/hxawBR6lut7yUJ7/UmLITZTAHQ9g2+DsACMDmwNY/NfLrW+4RwN7HjZrSFi0BXk+MRTcljY8PBa6du+5FhzeyZN18egOayjPzIDyIVlqoqIj2wTjo7kY22I2WGENDTeSMrIN6vDZZCqNI5JkGjRSheY9ST0R8Sxkjl1NQWJ/UCmMFiBC5I3gU2id/2ewDGUrnAZ3xzCowF5eIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PITi6STojgCTAZrtDuMnFR380JR9Ws6wrHOuRyf3LM=;
 b=S6v0YKd2S7pUoYFg7vuqtHsCRh5TNHGhwI3YQNbvDFyFRYIH4bSirF9lEsWNb1eHW+Gkd12y0Kt0pdaEXlYA0nMfGZJnU5ZYkTM4zqX7XEfa3vKBlnTscrNj+zLD48xwM4G5VLxWDPmgTEsXJz7oYjdBSB7juze3Lz/HLmHZRGo=
Received: from PH0PR07CA0088.namprd07.prod.outlook.com (2603:10b6:510:f::33)
 by CY8PR12MB8065.namprd12.prod.outlook.com (2603:10b6:930:73::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 21:21:02 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::43) by PH0PR07CA0088.outlook.office365.com
 (2603:10b6:510:f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 21:21:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 21:21:01 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 15:20:59 -0600
From: Babu Moger <babu.moger@amd.com>
To: <reinette.chatre@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <fenghua.yu@intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <jpoimboe@kernel.org>,
	<daniel.sneddon@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<seanjc@google.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<tan.shaopeng@fujitsu.com>, <james.morse@arm.com>, <tony.luck@intel.com>,
	<peternewman@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>, <corbet@lwn.net>
Subject: [PATCH v3 2/7] x86/resctrl: Add SDCIAE feature in the command line options
Date: Thu, 30 Jan 2025 15:20:32 -0600
Message-ID: <57339c18fbf7585be4d9034a9cc62306641c4752.1738272037.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1738272037.git.babu.moger@amd.com>
References: <cover.1738272037.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|CY8PR12MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d64d0e-d3b1-4519-b923-08dd4173ff45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sZB9w05VG88wZZUhGGenpshnMBMZCjw/hF2orCdMLOR+FVjXVquFHw9AbPZl?=
 =?us-ascii?Q?7iREjpHhpDgZxOJmov4V8BLAy9zutz7SfuECiUb/7a+rWeQbUxY9IP1a5agO?=
 =?us-ascii?Q?C3LnC6ndzVzofylmV/HKaE+183rG6J124uR4tb2hQwaSYUD8caKspdxbN0O5?=
 =?us-ascii?Q?KKQy0qr+EDko1J5OA0SrwnZaNYub0MEvn3cwwMDuWE4uPQPEnAJwAM1qozFC?=
 =?us-ascii?Q?SonKP+5KP79SZrQ4I1TpNhoa7jxLn+tirMfXKhfkGj/cDdbGogrZkN8BUnJq?=
 =?us-ascii?Q?W0cEYD5igeRqOLHK/4rWNVfTZKI8coRbDOKoohBStG4l/rkjqV3f0Rzzgymx?=
 =?us-ascii?Q?iHJaQKflS1SlGdyaoIzJRJVQ7GNs5N3KL8rzDSD8pkhMGKZYKHh8N/fHSg3W?=
 =?us-ascii?Q?nY/HenGKMZ2GCXpF0+6Wu7FaDNZm+wU+OT3ju+ZO5sVHa30mvvK8QBM4sPFO?=
 =?us-ascii?Q?teXdF0qANlYp+5YqlqbgPM8xL1orMxJE4C/A2RgbvFxv87ju8Xl/rxtSfN1n?=
 =?us-ascii?Q?uSBNuO0GGQarwbmIL8JGjNmDWN1TaalANPfONLtEyr6GoPHTSOfhKgA9FoEs?=
 =?us-ascii?Q?bqTg2nbLWJcl7mTNvAOdQIl+oJ8LV5L7kacGSDH+mJDdacj3/e8rt4722vky?=
 =?us-ascii?Q?ZMkyoanaTrJQoQZyGW1uw6jd6T6lMMHMwq4cqN5YAoENpdN2Amhlc85Kaeq4?=
 =?us-ascii?Q?O5G5dAUvkTXjpyL1nS3fNsUdg/va5YG7wPx77fyfA0Z0SyqHe+V0C+NlV8ws?=
 =?us-ascii?Q?H+62Ox/E/JPgTqeMZL6FJ+ICYY7pVTRcFxU8g/QsKieM/J/UIwRuG9GHdERK?=
 =?us-ascii?Q?kCcgELRrGkTwKp5kFpCfh+SZNsJKRKEmnHtL5LmjojOxhOBf3blN3FrArWNS?=
 =?us-ascii?Q?rJG1+aGxZo/kqaTsC+MIdMX8BByYSYFObxR9mLZtgLeDkk9dkyR9e+oHyFrg?=
 =?us-ascii?Q?g2vUzEZq732Pcw8hhTzD29U619jae4JWmZuGsHG5ZdFwd3+coax8sfKk0F4J?=
 =?us-ascii?Q?i9YVwNpnJ+RF5eo2AIhOZ0Y9Bd/5kflQeytFdYaMi9hbGyBMLZCUL/xvkw3d?=
 =?us-ascii?Q?9gExCk/vmTk7SB16GODh682k9yN5uY+o17PEapFaK+gliAWL3Sys1WWa/l75?=
 =?us-ascii?Q?HuRfz3Ziw3TmLSLH8vwuphrIGwvEnCvrP47SBcupanC65oQ0djZkgVlbe+EP?=
 =?us-ascii?Q?eOiv53SYc7NusWiEoTBdcQ7B+6/B+bFBsJRwpBjTju7Am6WptJWP853v3KAs?=
 =?us-ascii?Q?V7bimy5o3sgV6rv3hX/82yRlQ29qNOfiWOVUR/a1SWi6D5tAg17lQdZGgHdF?=
 =?us-ascii?Q?K8C5NrRhOYEC3YVFkzT1eHKT3A2zsYwOHH47kj1NX7lK649UJEHmwfLRpEm/?=
 =?us-ascii?Q?OcJwpWeKcfyA+T04jOnSATAsrzUB3KqCfFjAG4gHWlh9U+a3TMIvPeHgxs/v?=
 =?us-ascii?Q?0eAu8ZI5jW/Pl0QJONMypYlbnrOpcWrg904Jb+iwdK5L00Qe+WSDdoUCujSx?=
 =?us-ascii?Q?g4eluf+NCxAxw5c=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 21:21:01.5344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d64d0e-d3b1-4519-b923-08dd4173ff45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8065

Add the command line options to enable or disable the new resctrl feature
L3 Smart Data Cache Injection Allocation Enforcement (SDCIAE).

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: No changes.

v2: No changes.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d0f6c055dfcc..0077c4340d10 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5942,7 +5942,7 @@
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec.
+			mba, smba, bmec, sdciae.
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 3d1735ed8d1f..c2450cd52511 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -811,6 +811,7 @@ enum {
 	RDT_FLAG_MBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
+	RDT_FLAG_SDCIAE,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -836,6 +837,7 @@ static struct rdt_options rdt_options[]  __initdata = {
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
+	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.34.1

