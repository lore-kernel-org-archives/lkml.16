Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA73225776
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 17:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744565105; cv=fail; b=n/nx2/6IY+YXhNu7h7BTYSWNNo5fOV83GM2JxEJo1AD5yHHNTTJlhy0tVu2mZdqYKABmBgAt0te/IcwMcjfu2xNBmUTdlAvy85kdI0PXpuFELHmX8WMXnmndxpYuKaJDajyDbnzMBRQqB5qXbJEVMIJuO85v38uRm2mTHtOuSzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744565105; c=relaxed/simple;
	bh=xPUJFw6Dcac6UBHYRCxafLf9cqBVvDuFkz0cdEeSvB8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N0/ZJKUUvLBGNV1eosQQpY85KcXqoSjhNM3BWQVCA1YAScWsP7Zp2ZhjKKPR4Sb9uAIkwpYqyusOfNxwthaYAvr6QbgYnWRwRhhmRKVrexTGuAPADI6EThNV1V46mZTPNK6tZ4XwBbdS5wqtis9VKmOXbmp5OOnXYirM1iG3sOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PP4g02t/; arc=fail smtp.client-ip=40.107.237.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PP4g02t/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWC4FFpMEYgzeoFaC0D7NKNh4FePi5BhcCeTwUtpH/dXPfKOjOwmLOX5YRwtdBFVppwWJAAKY4iX1Io+5KsZOkVf395E4/6Uc/Bggl9MjVQtpKXGpi1j1i7OReIHOGmGb54yctNsTbdnPlj7pjjiwdTwLPqdbaJ+/DUZq4sBEGoh5xSXjEB9kT8jIPeg0R0cb4CtdMs3ZWGr5nUpFsPOB406/dfWDVAzNfRRLjq0KI1N7SO0qgNo3eD5duQ3IxUVWyy0s11jBrcs0MWBguijMv743p9W6M4g5+gS+FCC8KpC0Mr0lgB4TL8/kqMGrxzIwYVfY4OuxpXHOwRBV49DUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iF56jiip/23j8b3CD3FezVNCccrvBnOXxTV2T9XYPbU=;
 b=e3GA/U5Kfj5Rvagt9Ix6iX9bxQH3EAg17yWXVWdo8QQ/Zlpvl5SVFsFdtzVRw6RF9G0H5GAFrIMaOzVOS7WUhibaAdinTMv4BD6/LQ/rLbfppXylZ2EcggPbf3YwS/dIqChyK6icNsAwn2lGL860KJT7bnreTvMgWZ4TEP7eCRWGXZ6NwCDECXKZV38X/aS7kzgNVH6CuW6eU7o9wDF62f9KfwR/0pT6g7+Km3Bl3lVLRoo2LPnnxtoyqV9NHBFbdV/busOWbyq2s26bU52zFNFu3vR9Ag9WuarUljycO1wZ8yQmCQ6ysFs1WWapg/3RamAjkf1Ho2ZE56HDh3Psxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF56jiip/23j8b3CD3FezVNCccrvBnOXxTV2T9XYPbU=;
 b=PP4g02t/ncyEEwyjw49BDYfThjCz3kJ1hdTA76jAFDnV/XKYDxvhWdpjiG5yv/2+niktybBFxgkM7krbwLRAV4YTICM3B/PiUq7qXLshYPv02Qgpfeulcxbi+equIGRx9waxjHjHVkWUVZqeeA6oHs4Hl1u/nIWqX+Qg3mPDj8I=
Received: from BN9PR03CA0297.namprd03.prod.outlook.com (2603:10b6:408:f5::32)
 by SA1PR12MB6945.namprd12.prod.outlook.com (2603:10b6:806:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Sun, 13 Apr
 2025 17:24:59 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::b2) by BN9PR03CA0297.outlook.office365.com
 (2603:10b6:408:f5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.31 via Frontend Transport; Sun,
 13 Apr 2025 17:24:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Sun, 13 Apr 2025 17:24:59 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 13 Apr
 2025 12:24:56 -0500
From: Shivank Garg <shivankg@amd.com>
To: <shaggy@kernel.org>
CC: <shivankg@amd.com>, <willy@infradead.org>,
	<jfs-discussion@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
Subject: [PATCH] jfs: implement migrate_folio for jfs_metapage_aops
Date: Sun, 13 Apr 2025 17:23:57 +0000
Message-ID: <20250413172356.561544-1-shivankg@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SA1PR12MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f32a26-45db-4699-d26c-08dd7ab01dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dMqkSpvGMhIvMsyoGC/fsm3PX6kNmIMEax9sEs/vhpC0wz/TrQVTLIsIhj0B?=
 =?us-ascii?Q?xDiC68bNu4SLOAo9WG9hvxymYRSyVc4Kx2wuRWr+EePv2+8Z2Npa69OCZuIy?=
 =?us-ascii?Q?lqp0DTC/sHmErjOD8CqmRXvr70/lAAaEJTMCOGr74EhXBBViKX3SG5SafHxJ?=
 =?us-ascii?Q?8trM5A4s1UZsDvS6lqYb3BNEAOxn7DBGrwf/ffrE6dQMOU1OzvFWqdVYUqCg?=
 =?us-ascii?Q?mltI872AHmZgAm2LZAwo0WQWxBPVYukpibPX1iswUkrlF3/j849dcBSMXmAP?=
 =?us-ascii?Q?QQPfati512U6/0bL98AQ0mrA2yU/JNdPEaE8r3cbDRnSVCpMyDNW4zu7Ta5Z?=
 =?us-ascii?Q?InYxigazoh+jQqxiFYKnkXhH3pk3edDfZ1ROfn/mXj+ORDiYYdLMgSuwl5Cj?=
 =?us-ascii?Q?3nLnk0++BPW9zqNWbbzKvsfvYK5pwf7QZoAjXHIULt4kd+BLARWHRIOBpRA+?=
 =?us-ascii?Q?MDfdO5vcTjpgkYcY+koqidWfRsjNfQ7duI1ju+JFkUYoraQe61PJRFb8x0++?=
 =?us-ascii?Q?6YUUBWsbDM2O9bNfPxJKgJeDi10o8vkJRZq9Eh3pQeJ9uSk1BDV9GvQG/Da4?=
 =?us-ascii?Q?iTAFu5WETy+9u1TKmESRSnqGSZF691VEX9LHgpAFYZn3QsniE2ukfld7tjyU?=
 =?us-ascii?Q?D+lCCjv86b20Pk6bvtwg392RM28AxxwFPN7RXMjKLtx0xu98VEKncvnK+zPh?=
 =?us-ascii?Q?BDmiByt7NUJ93MKBdp9ehyssIPU/Fn694kldvPWDEl8Z/TahKBIZEY2jbvYg?=
 =?us-ascii?Q?lwq3m1xxtdHJUTw4AEwY7xa5NjF5AwRO7509aBMVMRSc+mEVQhBUzsi1YIh2?=
 =?us-ascii?Q?Yq0auXbcRc+qRXyV9hY2O8Q/tFe+I3x7KVuYxRGL0KfMqTyO7aBFQsLoJqmg?=
 =?us-ascii?Q?XIS6Kq0+jflW10n+aQf5PGk1uCiaHD7Hzu3N6NIZGuqm4nov9BF5wtz1v/iD?=
 =?us-ascii?Q?w5CnnJUBV5r1YDm6nhSGzQAMCFTM620H7cuDqYh96nPPzEMM4acbc09xo2LE?=
 =?us-ascii?Q?MN30H/aUIbMnDTu5KIcX2vo9qADrUitSBnxHQiETfQOEfP92qhqAfCeTTDuw?=
 =?us-ascii?Q?i7tV517SHUZgzK7+Sx78FQgBjPL4Ff8CoZ1/BnCbbEdHjX0DrCuBrac1JkYq?=
 =?us-ascii?Q?xjPMwC7O0OyPqDF6pKjGv+m/5m27QgGVopO2wXuQ0j7aazgNMLg8nEKeX9tM?=
 =?us-ascii?Q?WLfDij/to5FsHoiVEYECAV0K0EGoNLOpdGmoA+BTkihRksM0OeeNbCIK4/rK?=
 =?us-ascii?Q?op3+IqN7WhCC1OO/kmxO8L9DHQvcGWIz0A8EQgWuQ4MeKYzAu33LVHK2H6XP?=
 =?us-ascii?Q?voFu2pkovx2eNW8Re5aN426uS0jfQrOtFQot8lHCKz5lBXnJBSE5m35OCqND?=
 =?us-ascii?Q?9edvGwLru7mEWWivQA7TxBu50qu40OFd8IhVvFCb5HCRGi6B3ko3N7C5B+XK?=
 =?us-ascii?Q?nlq/LjyPvvfzcI262NUbpo+JtNVIfSfjG9mRuubFuLxQLw5AqgxE+44wzzg6?=
 =?us-ascii?Q?R17ck5JaDFTKcrxQ9Gczntpy0Z32/EWEx9lJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2025 17:24:59.1950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f32a26-45db-4699-d26c-08dd7ab01dfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6945

Add the missing migrate_folio operation to jfs_metapage_aops to fix
warnings during memory compaction. These warnings were introduced by
commit 7ee3647243e5 ("migrate: Remove call to ->writepage") which
added explicit warnings when filesystems don't implement migrate_folio.

System reports following warnings:
  jfs_metapage_aops does not implement migrate_folio
  WARNING: CPU: 0 PID: 6870 at mm/migrate.c:955 fallback_migrate_folio mm/migrate.c:953 [inline]
  WARNING: CPU: 0 PID: 6870 at mm/migrate.c:955 move_to_new_folio+0x70e/0x840 mm/migrate.c:1007

Implement the migrate_folio handler by delegating to the
filemap_migrate_folio() function.

Reported-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67faff52.050a0220.379d84.001b.GAE@google.com
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 fs/jfs/jfs_metapage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index df575a873ec6..868ab7d16ab3 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -570,6 +570,7 @@ const struct address_space_operations jfs_metapage_aops = {
 	.release_folio	= metapage_release_folio,
 	.invalidate_folio = metapage_invalidate_folio,
 	.dirty_folio	= filemap_dirty_folio,
+	.migrate_folio	= filemap_migrate_folio,
 };
 
 struct metapage *__get_metapage(struct inode *inode, unsigned long lblock,
-- 
2.34.1

