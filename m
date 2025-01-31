Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343DD1BBBFE
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738321449; cv=fail; b=l0fhiUkC96sBLPXmcAbEBiVaBE4XD8AV13LfjMGBeNhLvVeIJw3HRL4CFUVcP91eUriFUXRiFtJ3j3+Er2KAPS78uZ0Bdl+m2qOeS8Yt+BlpV9NbrUByevSyF0rNuXxXUSUeiyLUebEjcqmd/pJNGE+OEehzkmsy0ldmxRxM7T8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738321449; c=relaxed/simple;
	bh=PHzXq4bD1dbWS4br+t3zKdk+nWgFc/+B8cBBl9hsnNA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sy10OGHhxqfKipzYnEKO8319rLXvbJRcIsMAihJ2ZOBwd5lw9Tz4GjCaY7+DZDKCtpqqv3ovxqvelyDFSTCK6eMmDW4KvSH/EIp+/NP0J4v03lj2hN4TDgXWvdUKHMzUkVez8bd7JSJAC1qqfixhMNP7vA5Hy8BGkvatlkjgL6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tTJdRr5A; arc=fail smtp.client-ip=40.107.244.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tTJdRr5A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmq8MxhV60LIyZ1a0/SPWfO2y+AnmCXQpM5A6LEVj1g9VXHyaDypWIFI1F3ySkY5AogTitHGiUDs07xmi3glcwzdfizWAI0hkmPxXxtbHeBsRP5TeermjZq+0gAbZK2Cg8UkSDL6gisP8NiuqXpTq5XzpuEloepSJSL1ZvrOpNPB4HXXwfV8Jt22e3cXyXFXbdFCnV8yg2ew3Ci+OFirYkqvayBlyqcSUHb9LA1au7DO2UHPRFq6p6Lm7uUobUapwVpt5TuTNU3xnPlTn00S2F4gadd3K0FXdHf1k9U4VU/DFEwLw3g2aOFYpfVhqbLPD9Gx98+TbBqIRIwFMaeEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsEhqp6tIv9yIf41m2j46e1J9ABlGKzXj7zRykOd4tQ=;
 b=IwBIuyEVRdpQfjkmwOQLlvk5TlLBofbqORb40ykK4kgjVZhTH7YVq/DSQdbvxnHG50YX9jmheRlvb1xxCaCGtCEg8/cWiHyYwFd9UBs0qgOVb/G4cFq6l86WDrexWTeZEkHLCkOzfAFPEdl3xdY84X3DOL2qmd0vPk4DqW6+U4zB5bq+doOEoSLfSn/d1SKL1ze/+Q0U2DQIeDsvqugJ5Fg5r3MChyUHB4RhJMtc/mIfVbnVS1OtQmwfxPyCN3CcMxSIjNrADuApLHZ6OhQCLgT+liZFdO3TT/H2j2pjgsWxw0o5vqh/SxUIHpcn9EaErb9mHxJIbkTveQhr+K01nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsEhqp6tIv9yIf41m2j46e1J9ABlGKzXj7zRykOd4tQ=;
 b=tTJdRr5AS9f6LoxqFobcLmjWSK0i+PIurH1dXwpx236xsGmAo05Ak0AC00aWXATvcCxmt4AMzOlxL1pLDA6IlxxJyQeQI6iPeWhckK28Nb72WUDg5aZEnMQa9e+Kv28vV3/u19LjKFTUOOo/tCbbJ1lBYE+lJj4b+oNLzvEgidw=
Received: from BYAPR05CA0034.namprd05.prod.outlook.com (2603:10b6:a03:c0::47)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 11:04:05 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::26) by BYAPR05CA0034.outlook.office365.com
 (2603:10b6:a03:c0::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Fri,
 31 Jan 2025 11:04:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 31 Jan 2025 11:04:03 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 31 Jan
 2025 05:04:00 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 1/7] drm/debugfs: output client_id in in drm_clients_info
Date: Fri, 31 Jan 2025 12:02:59 +0100
Message-ID: <20250131110328.706695-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250131110328.706695-1-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: db42df61-f9f0-4a22-ff5a-08dd41e6f962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?frQZOsqmFfEXrU/grdDQckwmL5RYdinp7bFjp00jSdzyb497Vcz8Wu1A9/LL?=
 =?us-ascii?Q?XNhtQKJd9uwbuX27VwpukuNZrp0aoaiGlNyWV8nXdw6OvtvDrl/mVlO4SYgr?=
 =?us-ascii?Q?O17dedgWyU4vpc68kZ1nDU879NqtR8PSHe6bOr6evgRKQxIpSyXxXNTNv2pj?=
 =?us-ascii?Q?pS5TEvdCpct/yKnQ/6WyF9xaP/XrOox3kWEuo9PFRSdKnyZ7CH4U/WGRaWcj?=
 =?us-ascii?Q?S6ZJIzUKzOUxwV+Lp1JJrCDU36z5A5lO0hFhNcxNs0GzYLC0DtgcL9rh+JMR?=
 =?us-ascii?Q?vkQ/pbhkFA1c4/jNHe+9lVdyBP4xuDEjBWxu2SunC8nxI1IrI/w0W+/ElBG4?=
 =?us-ascii?Q?RfhQaDbSWixFoxNAj5bYQpQaP2LOHTZ5hv7JEediWdU8zwHZN3JoLsG/CGbt?=
 =?us-ascii?Q?EUaUJeMZtq5HhxWfEHmnURxc31OyYNoPWYpWZmk0SA8FaNTCJChhi/ujG5Th?=
 =?us-ascii?Q?Hl2TJHCxa3WwpUryPSr8d5+SnQy6oJo2Zv8AATlY9e1md5msmH1Ymn63XsOg?=
 =?us-ascii?Q?gPK+Wd28dSNCKziob44b/KHcUvh6+bpPJchR2g03GDhGiVF5Ksz1oxZt+7BI?=
 =?us-ascii?Q?SuVLnyIqcTc0tsUIcMdP7PeGhQ74Vsf97h+xUaEJNqAAWIDnkUhvEQ2eS4dI?=
 =?us-ascii?Q?j/MfgW8HgSMhJmn0xnRQSynE552FOw9uGNnpw5HgC0xxZ5pprZkEF86L9Y/O?=
 =?us-ascii?Q?3Ha722mDqVs+Ww5FikWhM1+zxcGMcPM8yVQMLvFCbHuJnPow1/XN3LmUtZ94?=
 =?us-ascii?Q?IT0ldfuOc0PMBi+hpCYJGpoAGGK7qU0OGfKwBLIzffZDt+/pJ1poXKBvSsOh?=
 =?us-ascii?Q?fF4AdXyzct4DZ9TYbPgfuSe7bZvxXUxsFSqq9SUP6VQccDKXdPAikCNadlBq?=
 =?us-ascii?Q?C0H7fAiLUHaJClUgpLBiUiTM7UI9qsNa7bYSv35mAnK5HdRlOwxYTH5m99WU?=
 =?us-ascii?Q?PLZWOwWApJvtMmgh7Q4NnGHDaBtVKlgdvgnkwqZA65tFbPfLGS3n5dcQMwX/?=
 =?us-ascii?Q?1ZOJRvfcm3ImmTGcADqXydoTd1bwhN4GaJ1Y8kc81i64O2XkolTUTuwn2KFH?=
 =?us-ascii?Q?lCoceIVGq8BIRiOMWT7zQtYSjuE7sfFPve3bIb3cW5rFW85kBNlBsArMr/5S?=
 =?us-ascii?Q?fvXc62ca/LqJj6fVzd/nscBSVlmdRsdNhWi9FoSOQsTqi85mHMoXOex6XoxQ?=
 =?us-ascii?Q?nr6Q6g8g1YxrP99U8HE2/Mh+/eSIj0n9jQNcThq8e1YpGNy81x2RI+96S6cG?=
 =?us-ascii?Q?RILxxBiziFNQdOTp65C5jcbOARQFfqksCnwY0JLJul4aNRLOebgZeYQnNdyl?=
 =?us-ascii?Q?YExXjkK55gUZa5PX1VcB/SA5M89zCvP0FIuiSKON4v27UsS/EB13j7SRezh6?=
 =?us-ascii?Q?Vxrcv7S3CA1JbZyMCYKhMnQT0HJTx9h3s6UuOyI7w8uykDGbhHYbfca+c7Rc?=
 =?us-ascii?Q?JiEUyJeGHmiVqTE/MrPMmzg5Cch70NbsWGo0S3hA6F0Bmd3l1wfo20PNtggq?=
 =?us-ascii?Q?EsOvqRrbyACSit4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 11:04:03.7057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db42df61-f9f0-4a22-ff5a-08dd41e6f962
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169

client_id is a unique id used by fdinfo. Having it listed in 'clients'
output means a userspace application can correlate the fields, eg:
given a fdinfo id get the fdinfo name.

Geiven that client_id is a uint64_t, we use a %20llu printf format to
keep the output aligned (20 = digit count of the biggest uint64_t).

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 536409a35df4..061601211bc2 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -77,14 +77,15 @@ static int drm_clients_info(struct seq_file *m, void *data)
 	kuid_t uid;
 
 	seq_printf(m,
-		   "%20s %5s %3s master a %5s %10s %*s\n",
+		   "%20s %5s %3s master a %5s %10s %*s %20s\n",
 		   "command",
 		   "tgid",
 		   "dev",
 		   "uid",
 		   "magic",
 		   DRM_CLIENT_NAME_MAX_LEN,
-		   "name");
+		   "name",
+		   "id");
 
 	/* dev->filelist is sorted youngest first, but we want to present
 	 * oldest first (i.e. kernel, servers, clients), so walk backwardss.
@@ -100,7 +101,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 		pid = rcu_dereference(priv->pid);
 		task = pid_task(pid, PIDTYPE_TGID);
 		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
-		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s\n",
+		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s %20llu\n",
 			   task ? task->comm : "<unknown>",
 			   pid_vnr(pid),
 			   priv->minor->index,
@@ -109,7 +110,8 @@ static int drm_clients_info(struct seq_file *m, void *data)
 			   from_kuid_munged(seq_user_ns(m), uid),
 			   priv->magic,
 			   DRM_CLIENT_NAME_MAX_LEN,
-			   priv->client_name ? priv->client_name : "<unset>");
+			   priv->client_name ? priv->client_name : "<unset>",
+			   priv->client_id);
 		rcu_read_unlock();
 		mutex_unlock(&priv->client_name_lock);
 	}
-- 
2.47.1

