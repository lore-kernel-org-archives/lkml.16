Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303402EE29C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750451588; cv=fail; b=Yuzd8YxJ60iHNJ38SWcv5ZVz9eGXGU3OLvajCD65YkesE59gBbVamHfZEjGV2QNkxFbfWakLZ4WOdNRs1w/BI0Cl12cC07BAaDlSof5iiFlYnTeBbVmECVQcSSoMLmEbYdnKHNvGfJlE0MHo1SjFG5r94dtSiaIPrlVdOTaKSzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750451588; c=relaxed/simple;
	bh=JjcHblc1uvhG3hbCZX0sKor1MWvez9jccNjDt6syP70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ux87sLqBqP2q7bn3DKkByyJT7v1yJbwOlDCwslsHkGHa2x6KimKtJuM815voLSeLXIYj+BlmVFIDCv7p9G2ci7MGlWnMLMwXxTwhax72h+VtVal7UCk/nDq0/guPT6R0mvL07UQOGjRzggPy4bIAMRBjCs4+h9vKmtpBFBLJyis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FBIOunmR; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FBIOunmR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BH+M0EK5X+AjT1d4hqmooKikf7xCkTKYpvIa1BB3AQPlyTn/0SM7KZWBZlEsZeBQgPqQgORIToaEEe/TeuCaxhCAUc06esf30BG9YvzOHuaAtzRMbnoh0CqccL/dklw3VIT6csDybenia1c4AqA+vqSbkA/r0WIVk+M6EuO74oMjZaYy/kIPqrGdHId1azWHDbYpYYXLYEUSlFDJxM3H+CQdV5F8uRCOwVfpAPT/9+E2CFwzPI8mvVKeLc0J898GXnBuUtFSb3fNiNGseZgyZQderFsGMG8a9tDp2vvdhT/OwziSawgc6rJVToGDKOuhpSrz0pWyN2QiS7r7ATA7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUy2zZXVnKA9P0WHcAG8tUWuwHyot3D/4UOAM/6F7uM=;
 b=MaQ9fPHvCZoj1wYFHBg3P08EtRXJ/lPxohSqmTV/FqBEu3hNLQGmXFNnu+6iwjV/pIfKVULI570UlYasG+LXihI95WPE1Z+eK0DCRNJS7zcVVRmzTXCVtTx2JlapJYS0kZNZZ+NPS8DntBzg83M/8cL/6UphZm5SVd5pzZXmK3ca90UGAask02aLP/2+JC/AkExqmhIh0+mNar3kiQw9IKF8Rhj5twSJSb2vF0M7ySA6QBp0SD+KTfRzgXT9dlhv62HJ6vPKY6gZIaFK9DcI+iexQ7fEh1OvvjRvCsIo0+CUzdxP7Yur+HVVhMayEAO153Wx8Sb4bZhPZ1F1QlLW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUy2zZXVnKA9P0WHcAG8tUWuwHyot3D/4UOAM/6F7uM=;
 b=FBIOunmRl4fuOv5fKREIdK7+I6eGZnL+ysX5+w65NmTDqaUjMsKXwxmyGOK9oG1+Sc+a31uBcNu7SyC1U0KaWDAeqJmL775hxAtBtqGm6JBqczaMjiEYjNnm7JiB+9OVvPgkkhqtiEJsxodss+0VFfRUBVd77hJGc1JGSw03RpjAQfyB9j0Smh9/0lpPC2hdEQQx3qefGSDusvqMDl3MCTznDgYrpf3bzndujySvgBrfGiiiZ7FkN3dolUzsIj63j41kBORE5StCyRi0W0qE4DfvApjyiqgCeZz73/EYtjX4W8i7ZZacSVnAjrvwH1T+YAPA27cq0WZvfWOwSm7SiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 20:33:02 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 20:33:02 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v5 10/14] sched/deadline: Add support to remove DLserver's bandwidth contribution
Date: Fri, 20 Jun 2025 16:32:25 -0400
Message-ID: <20250620203234.3349930-11-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620203234.3349930-1-joelagnelf@nvidia.com>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:208:32f::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ad232f-3e58-4fb8-7d9c-08ddb039a729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?huCAgzYXU+OMbwlnfiifYfZJ2gnq/ioXWft3JpvpQGf9oEN1fO6Jt2vNfe+L?=
 =?us-ascii?Q?qFUDpLlNUhaOnyk/RMkkO/c7Ho7IkysZBsP41VuuZtjf5s/5S4Mj8SN0ALx8?=
 =?us-ascii?Q?RPrsGHxai12zfPinmXLFeLU3Z+f359lnJPgGOeLOk08QHIEu0dWUxf+1KY0h?=
 =?us-ascii?Q?3m0SUlcRge853gKWk62hNFq2/mPW1UeR99zyj7yCGXkL7Mdwv/wYNQ51w34d?=
 =?us-ascii?Q?jyMAZDf+yF7PhB7lGA4iffSjokqQfCPuTQP158+lTu70iYlu/E600V8gTu5c?=
 =?us-ascii?Q?BhMhs2pA3sStvyNVhUjW4Nj46nI26xr+DmhYqpGgMQrBIncqHnIOMadtfBr1?=
 =?us-ascii?Q?NV6q+in8puMsfNBrg3xhlp04kCNlHOpvl9SBx6fNfghfM3TCStHbmKStqzO6?=
 =?us-ascii?Q?WLSqwseT/HE4O5dTwYTFn8Lpjb+NxsJWYDxqlYIcoAYDWu1bMmZnmUCJfDAY?=
 =?us-ascii?Q?MZHcu8sH5Sa4XuJs6MeVI6JCHh2n3i9y6zo+wrTJVCBz3SEo5rny4v1W13H9?=
 =?us-ascii?Q?TIgQ52eisQyB9Q9i2633qIzZybtiz9k6MEQ3/DgCC4dPybPC7fBbU93q9Hdz?=
 =?us-ascii?Q?O0zWwv6n28jF1+lneuw3ERaAK58ZCG6T7yNmxo6ynvT9oqtuC82KCBtURoGW?=
 =?us-ascii?Q?2mT+bQH+p7mgZi/JyVz0EMGSmEO2qYr2XZVZgZe9EwyVqjegWZ0JD1Po5Hzo?=
 =?us-ascii?Q?Qj0uMop59BOKWKsIY0ZudhE/6OwiGTZiXmCLtMUs/QMq0uK1t5WtH/4PADTU?=
 =?us-ascii?Q?fv/kug9jLFVa6bFN2UwMH4jHXNsddNDeQE6WK0TXLLAPUysnuQr3Jv1fmwVr?=
 =?us-ascii?Q?glrb6XulXeOadGa2E1hHxJcyMiVkaXn1V0VDelgPa/O5w4ZZCj2AvlxFnXnL?=
 =?us-ascii?Q?xu8pfblFM1susfrURvwvFTR43uBCDwbtkzAVuHbpZYeLOqljp3NNDgUcK5KX?=
 =?us-ascii?Q?yr77kzogxfyWOq0yLAVNTcdKrC8c5O1TTISUex/gow532qIUXmlDLfD5dZ9v?=
 =?us-ascii?Q?KbjFhKZJM1ICXvCFr98bgE5GPrap8sd0dae+lRZwy1DFWRU97+/XOcti09mL?=
 =?us-ascii?Q?sHa5HJBZj/y7Q0pVygORoJ4hl8lSAAg26deiF67nra+xlkuQhdAR9H1mHJwZ?=
 =?us-ascii?Q?mi7yEsgFd6ce+NSt+mZ2lLXTFIlZEBl5fFf3IO9OP/F7De5/ta+KqhcLOgaV?=
 =?us-ascii?Q?SQDn/g1yh9S8xrRmVa06YF+VUW8VDltfMtvRnHoDLfM6OngV39bC8cIp2MWW?=
 =?us-ascii?Q?S3XBlpDsgcrWGNsRUzAidmD7NF6FdEeI8WsjmIS3cmt1/wQFSuC+gLdl2aJz?=
 =?us-ascii?Q?W+aHfGAu+m2RterCy1az8+i7M4n5VRNAMnuC/UkPnSOCfw86K+Rq4dhoA0vn?=
 =?us-ascii?Q?cLETPmrfmO3mQmfYihh1KCV+t1Fxzk4K1XP5uiZvnSK+QS5mtCRJjqPu1+Oe?=
 =?us-ascii?Q?p7w4pSsI0kZumpQGlM6DF46fxkbjFOjFDjrz1bNo8OgILhlY/R6fjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Bcly4ZmzFNFw9d1wsMWgZPR3LeZbUrRUGruvs6I2Bx4455tyNLITDRbz0M4?=
 =?us-ascii?Q?4Y5AAuzoA9++qEPzwIVlPYGe2YLZipc+l5iCeIPGsnxAxvaKXssHkAZVfwgc?=
 =?us-ascii?Q?krVzQmp9KMv6i0iW9JP7rYr0rOH3qj/dfyZkXra662A713PdboAH/Aej0I0v?=
 =?us-ascii?Q?C9e4/5HfvKmsjfSgbQ6f0LjvfHNqNPeTWEayZ98Lun4tXKZrAWldZvvI7KgU?=
 =?us-ascii?Q?sTHlxX+APNLa164WuNZxUaReFbKh9fe2oT22oMS6hrT8jgq/5VtmNipDUsIP?=
 =?us-ascii?Q?THQa8mVBxYBTEDzJjUBQphRcDP56Kl7X6Mz8elMDqEo98PjqgCn0+i8NVKr7?=
 =?us-ascii?Q?Ze0UjdngyCijY5zIe+4IlN+QoWnx/LU5sQ5fOrfd1f6J3LSJLpfJMjDmbM+X?=
 =?us-ascii?Q?iudFsQaDk+gRY0smNZAxe7wKTVAEoLF5KirfTFCL2pqwwqiIoY2JZUjnKLeY?=
 =?us-ascii?Q?gLvXG0ADp7ewaputVFEgLtwpRqUyuEP+uVZgNzaGf0XggAgxIFbPjzcddB2V?=
 =?us-ascii?Q?kSmW2/QhsVp3BMD5Unu4l5AB29f9RqvpzFqusR06T8ywzTZTULiMQvM5u6Y4?=
 =?us-ascii?Q?5aZUkCE6xwo++HNPL44MoF9Tg/YScZGWtO+a8CQSsLnEh2UpxVcjPmbZVck6?=
 =?us-ascii?Q?RXVLivSmT9WGTdVs8PuF8NSKkaW9AuAWpSbZABkwWSIJZ5zdWQBohXaBt0km?=
 =?us-ascii?Q?uS447fzexpuICxWeAJsaBJcUR5dli4m+ZTtAXRRgnE0a8gToQZsvdRnfCFm5?=
 =?us-ascii?Q?0QiRiWKRw1VsjeHptz6Jk7b3RnRlkuzj+A9gYiVbbtI5W12wK9jSQKpqGv8k?=
 =?us-ascii?Q?xGgpHsmjOWSx6WsNeCVsTF2d2bk5IbBEYjYcUCKvI5/qGw5hidSK+Ymzt1Ry?=
 =?us-ascii?Q?UpgDXdT9Ol4F5mvF3+3XvC69h5HBXojtQJH7sbF1nqg4z2U4eR5NhJVQNQA8?=
 =?us-ascii?Q?qr9c8Z/pzNMlf6aNuFywcufAkeNcYeFjhxvF8AbyywksQ1Xm5C7SQzMhJrpV?=
 =?us-ascii?Q?9lCWaCuVHuGxLQ9J+T98TMmGDITsHWUVWQY30SklKNaS0euifYs25v8SPsLw?=
 =?us-ascii?Q?zcabDdf/DSUEVKrdoykrpH90tc9py4/CM6SOryZCtorMcdoR/fWogo6FRvMP?=
 =?us-ascii?Q?L1W1GzZaQ5yscF+2onA5oBTRr47mKL7jpxipkkxYzCK0R1CIZLlK1fRHwSzj?=
 =?us-ascii?Q?9AXEO6WnDPZwY+w3PsPHrinOz+T7g+jsCCpvZwau5RNBTKXZ9hstrqUr6jVt?=
 =?us-ascii?Q?7mB6KUNK26XLrwNO4FRPjuOuV5ztN4+5CGXHpltDB5f7GcjdsRAs1JOSqxdL?=
 =?us-ascii?Q?80sw0ISB8Sf2gns04q80qhbn/nd3jmtXuNgRr4Fxsmp56VVI72gCybp5jFAT?=
 =?us-ascii?Q?ITAXlCzgTX84ihjzk58wS0Nu/iUNnThAdpr5FddiZD6Qj3xe+zhR9+ocpGKh?=
 =?us-ascii?Q?bVTe2pBYCMeZdWMkk3JFDCCgTUtkjdKugnqyrmlYT8sHLTFvpDLxBF7AmRdh?=
 =?us-ascii?Q?f0hsOeZEHKZrE1qGDwTqmgHTdj2GyC4qDFFY7MgeuN4vfNhadIlaXEcEzLLo?=
 =?us-ascii?Q?0WeSXX2BMHOI4WLwkhanTUv5KnjDch7heXlBzdAQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ad232f-3e58-4fb8-7d9c-08ddb039a729
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:33:02.1576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pd+LJY/eeABM5khOYcwQL7mQzjP05LAxyR3Ma2Tu8DtbgJsUCxNT+Ye4gZM6GUfR5wqVn2RHuB+N1AYv8Q4keQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273

From: Andrea Righi <arighi@nvidia.com>

During switching from sched_ext to FAIR tasks and vice-versa, we need
support for removing the bandwidth contribution of either DL server. Add
support for the same.

Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/deadline.c | 31 +++++++++++++++++++++++++++++++
 kernel/sched/sched.h    |  1 +
 2 files changed, 32 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c61752c2e052..50d938856b3d 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1742,6 +1742,12 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 		dl_rq_change_utilization(rq, dl_se, new_bw);
 	}
 
+	/* Clear these so that the dl_server is reinitialized */
+	if (new_bw == 0) {
+		dl_se->dl_defer = 0;
+		dl_se->dl_server = 0;
+	}
+
 	dl_se->dl_runtime = runtime;
 	dl_se->dl_deadline = period;
 	dl_se->dl_period = period;
@@ -1755,6 +1761,31 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
 	return retval;
 }
 
+/**
+ * dl_server_remove_params - Remove bandwidth reservation for a DL server
+ * @dl_se: The DL server entity to remove bandwidth for
+ *
+ * This function removes the bandwidth reservation for a DL server entity,
+ * cleaning up all bandwidth accounting and server state.
+ *
+ * Returns: 0 on success, negative error code on failure
+ */
+int dl_server_remove_params(struct sched_dl_entity *dl_se)
+{
+	if (!dl_se->dl_server)
+		return 0; /* Already disabled */
+
+	/*
+	 * First dequeue if still queued. It should not be queued since
+	 * we call this only after the last dl_server_stop().
+	 */
+	if (WARN_ON_ONCE(on_dl_rq(dl_se)))
+		dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
+
+	/* Remove bandwidth reservation */
+	return dl_server_apply_params(dl_se, 0, dl_se->dl_period, false);
+}
+
 /*
  * Update the current task's runtime statistics (provided it is still
  * a -deadline task and has not been removed from the dl_rq).
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 576b69cee6b1..13dc32a6346a 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -393,6 +393,7 @@ extern void ext_server_init(struct rq *rq);
 extern void __dl_server_attach_root(struct sched_dl_entity *dl_se, struct rq *rq);
 extern int dl_server_apply_params(struct sched_dl_entity *dl_se,
 		    u64 runtime, u64 period, bool init);
+extern int dl_server_remove_params(struct sched_dl_entity *dl_se);
 
 static inline bool dl_server_active(struct sched_dl_entity *dl_se)
 {
-- 
2.43.0

