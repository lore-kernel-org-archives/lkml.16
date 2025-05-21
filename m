Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2070.outbound.protection.outlook.com [40.107.101.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D950B222595
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842383; cv=fail; b=fbw4myvTK/7v/40rT/LKSZMW7yEIGf6/dABQpE429IicTzZBta3MQJSSNAsN2W6VVetA2GTVx9trVGTQpDWLpSJK7pT/qsYI3crxhYjT1A78YNjj8xvRFx9ZrbJSO3nwzL67Alr9JMA7FhX6+2YDuVlGS2tbjIFZnLBBZ7NOsXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842383; c=relaxed/simple;
	bh=vjmDnSkdlZt/DhCTho+/Avo1f7AVJwHzyIdzmT9zBKs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hwus9p515CSPOkzEmKkTg5n25c3S/HyywR14q2vOR6BXZcQEzokHC0WfrvFaK03rDt1VTqCFd9I6UkzNR100pxtlg3ndQNSK2qVweYZ2nS/EF8HLr3uk6uOYjbPE5usq2bIkjsVpZ39BJB6smP8r4Hee7RRSYz0TBlGtNianXtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hBRMPQMn; arc=fail smtp.client-ip=40.107.101.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hBRMPQMn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6r6IFfn7FrqlsH3hiw92nU8NFsZ5aLcGjz0njg/m50AaBy4E0AbE7WheAhuBPhrOPeJyVxSyCOXoVYXjkq/d0M0HkZxrETzXLlF4i6jfhlDTxdL2pxPt9+TX+Jzi/q76nHOPoFdYbDnbO96AuITiRpSrc0qnGvJ5yjAmB6iOBQEtKSzMXhVskgNOuWK2P1S1h2sNadTYTdXlGuyYYJE7bY69h1Xv4hlbR5v4BbgR82B8DD40hFTxF2zxyB2xmnzkxGOd/0SpYdELMiUN1hvXsvTpzLwjDQv6S2NZKSyo+HZenT78MVCVDevAwFjX84NJy56WM3Ule8MUGRkqBsvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YExrLBNmjk0Jky++4o/V4jEROgJRqTpVnrXzJ5VrY0A=;
 b=xJegTT9XyijssmQ7dNppzfRNQVBjmWq52fBmeNiSv28A8SQuCswH5xUWwPuudNSyRTvmVzA+m+jCtwLmhA4vL7Otdm6PuM/kxDA1ClWwSaDKjWRTclBweDUrYUU4TyUBNGMvd5whvWdhpiJruv5p+MdhNRT/D/vGw9vrzS3KzlznAhmydDzlhPaaYIz+iflczRNqn9fOZQvVhf56KiURoU2EaVtMxGmVx2UW+2/1Ig69ro1ih1VikT13ySLIKt8uwwrW5gDvOxrvUZlT/238x3+Msq+OX0idFrblvQlXylVW4G7SFcSddotWtYp1FZAvd5uU36M5V7qSNcz3m4NjbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YExrLBNmjk0Jky++4o/V4jEROgJRqTpVnrXzJ5VrY0A=;
 b=hBRMPQMnr+jqkeSJAlED/tntt//5ApdIvnhpOd8v1GBh5bL8qUsCmmXkHdU/nPQJGLAlLJWjDcvqLn2bktpeMS0NP1vl3iUOBCt0Y2TgWSlDfoPsISw3uPcShv4ybBAiawvIhWQl7fX9Od69AbTjbVeySKIPb72eZOMl6OP0ysY=
Received: from SJ0PR03CA0335.namprd03.prod.outlook.com (2603:10b6:a03:39c::10)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 15:46:11 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::9f) by SJ0PR03CA0335.outlook.office365.com
 (2603:10b6:a03:39c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 15:46:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 15:46:10 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 10:46:07 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 01/10] drm/debugfs: Output client_id in in drm_clients_info
Date: Wed, 21 May 2025 17:45:03 +0200
Message-ID: <20250521154531.10541-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521154531.10541-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250521154531.10541-1-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a302347-a292-41e8-4132-08dd987e9bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzRhdjBTSTZEbmRLVGFCWEliK0lVLzhtUDh3bjJzY2p2LzM2eWdEWm5URk9m?=
 =?utf-8?B?STNmYU9YNUo0cW5UWW1JSjNwakhxU01aQWhTbVhDN1daT3B3WmwrVGpReTU1?=
 =?utf-8?B?MzhZQm0xN0NmaEk1N0xLM3o1eXJCWXk0QVpUek5MbzJEUE1xSXRScjZ6WVIv?=
 =?utf-8?B?ekNLZ2orY0dkeEo0YllYSkQrcTVBQTNraWdNdERPMWdEZXJQZHJzVkVIV21G?=
 =?utf-8?B?WHRsNE9tVjJPMG5UNUhHNnZjbm11RFFjVmhxYU9MMzBtRUt3d2NJMThaOUJS?=
 =?utf-8?B?M3YvZTBVd0I5RUZOZk9UVEkxU29kM3N5VTl6K0p4bkpRMGJnS05rNzU5Z093?=
 =?utf-8?B?K3o2MnVRc2psbjNFaVRSa3VubGN6Yml1N2JpcFpTNGJrUklOR25Ld2xEKzhN?=
 =?utf-8?B?alMzeWpJcWpRNzNqYmwwL2xhTWNyQ1RMK3ArSSsvOS9FY0s4elA1NFRvM2Nk?=
 =?utf-8?B?cXBFcS9MaTZ6a2ZLV2kxcUdpOTVMS1ovLzlGd0ZiSlhoZmsvWGNwTnp0cnpN?=
 =?utf-8?B?aEJONytmN3E1NGlzOUV6Z2hSc1ZTVlAwWUVNQ3NvbU5lR3M3dlpOYU4wZ1hG?=
 =?utf-8?B?LzhrNXNybmNDaGJVTmNUTm11YmZYL213Uk5XekVRYTROWlVtNDF1S3piZ2FC?=
 =?utf-8?B?K3NqZXBKR3F6NW5GaWhPLzZyUEhiUzJodDJvUGNBSjlzOVRmQlhoUmlJYzU3?=
 =?utf-8?B?ODVUcUpQT2UvRlBoSnlEQmEwT2hyYmZUYU1hL3E1Y2ZjSUhLVHlkMmxrZk0y?=
 =?utf-8?B?L2tLVWNPVDE3a0N5SUxXZnI0VDFpM0Rzb0N6ZjdNd2FqSllIU0I4TThFbUdx?=
 =?utf-8?B?TGNudnJzVWE3bE4xRkhJdWpiS2hTVFFtMjYwL1RmSW1DWnFzTnFxZEZOaDVv?=
 =?utf-8?B?Q2hJN3BRcVBTSFVnK1dBaE9FV2I3RWJBdURrdzY2bGpyc2YrbVRvbS8rNEc3?=
 =?utf-8?B?ZTRUdDE1TEtKNGo5R1F1a0h5SXhORnpCY2NHTjFCbU9LQUFjTittOWFpdVlI?=
 =?utf-8?B?ajFYNFJpaThNbTlDSGw3VUg1ckRaRW54aWNFaU5VRHptUEJHcnpQbjVXMCsw?=
 =?utf-8?B?ZlpSZTBkRkQ1NEtNUUVUMkJYeGdRR0ZZWkNxRVhUakFrSklidENJWTJQSFJl?=
 =?utf-8?B?U3U3bGJ0c1VjYldEWHFqNWxOanhxYW5vdEtYNVZldDcvU3V3N1NydTBOMTU0?=
 =?utf-8?B?SXRvd2drVnR1T29sQXl2L1A3cGttYUNobHQrbWNyUnRWeE91eFRRSTlNaVIr?=
 =?utf-8?B?b0lOQk1yM0V3eEJyMmN3S1FUbFJ1K1prSUVKNHk3OUgvM3JYbVgzS3JJTXNU?=
 =?utf-8?B?WGVGWWNFdjRUYXpUeXR4dEhIVU5HT2FkZ3RQa2tMYWZKNTRPUFFtWktGZUI3?=
 =?utf-8?B?dVpJYkx2aEVJL0EzemNURUpUTURaVlliUTJaaGRVbHJSR09sTTEvVEVZb0s1?=
 =?utf-8?B?Y25ueWJHVWo4L2xPS1lVdTEvWnF5Umx1aUVKdzBXVnVmZ0xCQm13ekt5aHg5?=
 =?utf-8?B?MHV0T0J2OWFzSVBYaVMzK2FURVVlWXQwUjF0UWtrV1BBRUtrYjNpczJrNXVW?=
 =?utf-8?B?Q2FJYmYvY3U1RlBPRmNIRFBkejZ5VHNPbTMrRVZtWGxGVzNuRFcwbkxrVHNS?=
 =?utf-8?B?ajRMZTFJLys1SjMzTnBaVGdIUEFVeTFORXNxeUJMaTlTUHlDMTFEdDVNS2dz?=
 =?utf-8?B?M2tqa0Zmc1JJWVlXUGRPTUpMb0RuVjFWNGYzNXhoQ1JxYUFpTktrOFdFNzEz?=
 =?utf-8?B?K3ZocnpxMUE4ekNvckxFUGl5NVRjeGVQelJzWWs2MEJzUmtIZlFtZ1RqR1Av?=
 =?utf-8?B?ZHF4VitaV0hTdkJieHlWOWg3VUhIRUt3RE5kUmJqYkYzYnduZENIYjQxbE5y?=
 =?utf-8?B?dk5aaU1tYVRGL0NEaHF0bEt6NHdRNmcwTFBySk0zdHR0NytiYUNNNmRLVTJQ?=
 =?utf-8?B?cHRkZEx2NTRrbkZLQU5mZVZjM0tySWVlOHdwT2M0akp0Z25JT3pzTXZMVW5F?=
 =?utf-8?B?SEZ2bmZGVmwvRnkvajNTWmJDbTFPQVBKbDl0YmMvR3R4cGtDYnRtK1BCeFph?=
 =?utf-8?Q?Glvq0T?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 15:46:10.4419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a302347-a292-41e8-4132-08dd987e9bf6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415

client_id is a unique id used by fdinfo. Having it listed in 'clients'
output means a userspace application can correlate the fields, eg:
given a fdinfo id get the fdinfo name.

Geiven that client_id is a uint64_t, we use a %20llu printf format to
keep the output aligned (20 = digit count of the biggest uint64_t).

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 3dfd8b34dceb..abceb28b23fc 100644
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
2.43.0

