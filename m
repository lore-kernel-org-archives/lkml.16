Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A92F31E2
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190796; cv=fail; b=Z6wwl/Cs74BcBhuXPpE3k5XYr7NUYlN889+pjVXxXa16Lt4YZH+SE1wsGsy6E8zgCw/2bHk1PtNHYBSzYd9n1p+BDodNBjG2CIeCbSFFRt3cjIhyAOzydnMGC59T8jp7UZqO5nm/Ranoj7eLG/uZcld9h7vqJ+0FzRHwUKvFZSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190796; c=relaxed/simple;
	bh=HJ5vUaL+yf4owEd4iJDsZ6Xt0riA+eb3ACEon6zmVDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=djK2HBisTu2eXgQHNDH/3b0W8fBHfBJpq1g1fUgWtmxE64gcuXj8zBdmhw7/IikAT52YWf419BaogT7oaIUTPe+5KtqXLj4idhjP+sSk92xMvVXfz679X8UxBq9TpDIi2MVsRC04sn05S7O3hfOZJdIv7mKPEab2cGdu0vvnelg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WHn7K2v8; arc=fail smtp.client-ip=40.107.94.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WHn7K2v8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQNg8mWGSYhAPK80u1CSioh4rN7j4ldPV3g78gQq7s7Dqv/12+R5VqoHYWtbhkZ5uVOodaBtxVngKJeTVTyOPDQXxtBe7P19qqY6fvLEGxWCvgxWk6BT4ce/TIDsBCSvsJG2Mol49Rv8Q8woIDunllwiVrUQlsExxnHc1tYkmV46SdYsI+j2le+1ZFzqhHvvPdOqAMEfwfQKoHaYRoT9h0FBidkCbV4uGbkAFAuR/KeliXo62B0nFqlzhxKeXEnNK3FA74uChKZMJUN/UIpHVr2cFA+M2uLTqwQ3c7D/N11sskpVEHjRrjGDAXaCtpumCjJqMUh73gaf5JWvP59dNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tMT4Ss/qezo2Z3OwB0lAWRQQI62V/98jOyaAw2H3+Q=;
 b=M3sBaLGW5BFay2bGDtuqJbgq+ANsfKuON/t2CNE9IYwFi9PdwEQCGSLPeAaDi7XTbbWmvEdi6XQrT4vTxgh+tg+9xTcm/SULBZcHwRuzNEHmHfOnxM7g7SweDfS3XTWdvVAEfhW+bQBDM7VT3gAct+X7eWIKEvo47Rglg8amCF9N/GHM9UeGmL5FpPto96mXGCyROnfI92IXbkH5Nib7ZeoLwV8Xo0WPDcAHv39Yhdhc+72QVWzijqlh/UCh8O5IpPyfBzcCWgpAvfXipcwh2UxYfw19Hk/Yh5YmpssAO7DU7zn9tgjaY+Uzcxde089rcJEnx15LMvTXEM2NgbB17A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tMT4Ss/qezo2Z3OwB0lAWRQQI62V/98jOyaAw2H3+Q=;
 b=WHn7K2v8IzwOxmukCPHn0kFzVi9QiK1eCoEd2FHMgj2rrULzMWeHykKAvwqu7OcF1MxZ/kkwiBBpMutr2ayfKJNHqZ57SKewbbNcqmRODpoUoQ0N/oIH1CQLcDOkh4uku7CmQj4LywZ/My23rWgst2oDk+6W/Kj+QtUpZ3MpI7wqOPp5jKf47F9C3AKPOJ1+VPDDN2SuTlIfh6vyTXkJOluCO6dsEVlpteCghWhv1b8WX5bim6sDxhzNU7BPL2w36Yw+OEIU/WxVvlt8ByK7Kvi9VPnB/xYCqiCi+VKtdvui9ccSdINJ4B6FVQpVBEjXyBsSetGURn1Tr1K4WyDGyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB6714.namprd12.prod.outlook.com (2603:10b6:806:272::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 20:06:31 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:31 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 14/15] Remove the ext server BW before changing tasks to FAIR
Date: Tue, 17 Jun 2025 16:05:17 -0400
Message-ID: <20250617200523.1261231-15-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0090.namprd04.prod.outlook.com
 (2603:10b6:408:ea::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c0ab2c-8aef-4d2a-35e6-08ddadda73dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aUr3e/PICXMfO/BKpznH0y3P4AkD5fzaajxROlI9zeuUcezIzGhJYuO5PBhX?=
 =?us-ascii?Q?aHqszZyDO7uHahU6tIHN8xACGck98XbalSb+rwjRazn8PSMELG2Fz0VlYFix?=
 =?us-ascii?Q?XXo9ec7NNztsI5DUKFPzYnajeSdOWgUMrl203zRoGz+FaKZOv9T/Uqk47b43?=
 =?us-ascii?Q?xG9LrPrqofiKy0EEJ4+atpyZ5x9YH5bmH+l3sQxt/plEtitj130L+ntBJp1z?=
 =?us-ascii?Q?bW/GAm/X/4Eti+CvmgH+fESxAaV0sFUB+k5u0jwYd64CxCt2I0RhJASWLkUR?=
 =?us-ascii?Q?qvzuK0R+svZ16oX9/QR6P/l/JqiFyDu7ZpQAPd17TAWCUQv0ZLrIPyVcAdAD?=
 =?us-ascii?Q?x1iOKG/klMV6VRldehcmmARBhCH/9AV4CqYk7oht2kYtDfp3iFWyi596ArWR?=
 =?us-ascii?Q?itzkQUE3lgk0CXXtbDh4HqyEUgCoutOEpn6u1V/Lsh3pucHe5fBedSx+45Ip?=
 =?us-ascii?Q?2gTVzONyg8lrSWbY92YUh7f1RQcDPe1fvz3hokynh8ALNuBE7+Hulw4w6sNC?=
 =?us-ascii?Q?/+5H4Z6LUBaj88IVSGt26P39BOvSDDNfwEiIP17RpM24QMH4aiGHLqgSMHOr?=
 =?us-ascii?Q?FUnVMnboqnDFbadk20h2ecqxZRTCAwsT1UvZqsX7ejmlYMLMObaNq+3V+SG4?=
 =?us-ascii?Q?Dgq5/Ecga/AR5/fLv3j791IivqPY5IPw94yoEE+QB5dliqOFH+M8TvHd2aYD?=
 =?us-ascii?Q?eBEdEd98reEuIfj3+rQcJ7eFK/51AfHW9+ij8CTVg8RWKTcarFcGbrNVMj8Q?=
 =?us-ascii?Q?Nq6yngnrQqQsmpCe5LCPrd+1SQ9kWO9qznPTS6jLxFZhgjU9S5Nf5tXR4N9V?=
 =?us-ascii?Q?ZTfFuyLzsvhgEahIFkPvutfmQgJdnLeunnEiDdwLA0Lrd8biQpF1ianchr2u?=
 =?us-ascii?Q?nid05aaLCCdU6vx68/BCqVk2J4gUWCYM3Y3v6cZIc/GoqxOjrmKu33fxynpL?=
 =?us-ascii?Q?fGHkmoip062NewFG4yNVsk53u85a1y9WdN0Mw/wQYxdsDucgY67biK6N8uOl?=
 =?us-ascii?Q?8bJmnQgoukFRhEbOpyrnTe5YnqI+msWjpsQfgRW1fjJKMSOTsywRz0CIrqZg?=
 =?us-ascii?Q?tkSeP6p7gTVolNovSC5yCkGmjF3us7hkHn3RKtnlMKUVdl19vgTIR7Xmn5Wk?=
 =?us-ascii?Q?i1gCxAczbxJJJEkIvTKXcn4xHNMMtysTjZ8nFzv9FVTZt+q9Svb7sdJl0s/v?=
 =?us-ascii?Q?2XFiJ90U9cUZr6qO5vfHWIt+tH5knbF7/lHXLSh4UG42zX4JTXKsiv7eS8Hs?=
 =?us-ascii?Q?92J91GwGqMVM94oqkdMUs4bclMtBSoqpT3zj/wj5agMSuT+rXKVFcTl2WaSP?=
 =?us-ascii?Q?3gDr1dbQKx94S3LF/HHgk4ovFJ/NWYnZUnAGPP4Nmij5pOYk5/N0xqQuOPt9?=
 =?us-ascii?Q?nFttTE8zXFVYBlWfhV5El06tuijwqF0CycyEnsKW0RIhStjnroW/6PoppP18?=
 =?us-ascii?Q?yOrTTatplBPGQIgtMFTWqVpmqGCcP1xMbO6bD/cqqu2haZniSeZ/+Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1zphbLmbOPsXtuB3t76boyHD28HkHfcUy0SPHiMOd137bM6yjR4ttGETHYVS?=
 =?us-ascii?Q?fA2Omh5Lq9gPFqrUSJREebP96B6sU8zDAbSyEmlluIupVbGOG9qYfYm9iat1?=
 =?us-ascii?Q?M2RqYN+uI1VFEATlI9FootrCtPdFCZ2ac4mbwp4yEMQ+drn4e5PmE6Ku/U6z?=
 =?us-ascii?Q?aWPYau1MTtxvs6buIbCXYIhrBRusrZDl54jj65cIYVHFIEPdfQSd/KCbqlXi?=
 =?us-ascii?Q?oolbGXopVDl8CNNfyttbG4Vl+oaqGBpS4VmeZbhLcGtyr8KQDTKU2E7ZrqUW?=
 =?us-ascii?Q?ktFgZu1pVWeY7wuLZPrMmIqKqJW1jf5swXYkVKpYZrgMBQeoEfSKvVkaYgtD?=
 =?us-ascii?Q?eGi6tc1V976HEoytdHu5ltrE/QBTnL6rVBlYgBtoGy5TImdrfva+hndXW+cn?=
 =?us-ascii?Q?cCoLLgO0xLsaiCb5DDlOCOIRIoN6J74de+blDsljI4Qfl94NrRgfLvgYeULO?=
 =?us-ascii?Q?ekrP2I/B4+1Tgnj7K0DiB1nBVJBFNvrqBgBK3Ks4UHhZoO8GBPN9ifH5gwUh?=
 =?us-ascii?Q?Ii3v/cnNC0gv8OuisRU6JSW+Niz6CJM+fAbSuu9jxpTOYhACC+Aki0kEsQHi?=
 =?us-ascii?Q?lw3ykqBt6LEPDb9XqnWCoqq58n4NWoxb34LzxXsQU2n56iVsJaJd7J/HjEwu?=
 =?us-ascii?Q?axRAXDeopn7oFNOz0WEvHaUxGkDDLDpgPtyK36BvxF7LPHh0l/3lSv9KjwIx?=
 =?us-ascii?Q?i9A1jqjW5ltPKZOYUz3nBcG6F2l++CFN/5gEQ2h/4/+ZpqBPucBpIqyV0rmd?=
 =?us-ascii?Q?HmnlZaBaBECnzUwkLr8zKtAqP1uZJwp0/HdqHIY7riyv4fN920ss/uWyUqYl?=
 =?us-ascii?Q?rsRKXi4wQG136RGPoZUwWpKF6xw6k+K/5244Tj3udoN+0J1LwpIzqtVhnwpd?=
 =?us-ascii?Q?VRLXdIMRIP43IAlASXPyjuZi2cpR7WhH70Xyum0tiPBAk5zvU/Znn4s3eHoK?=
 =?us-ascii?Q?pKgiLrg1ISMuuaczXeDCg0qrA+7lOgxfyezmJztOj2qpMPaHleMqbKHjUZkL?=
 =?us-ascii?Q?0+VBT5Zymq3MpH96Z/IWP0ixdkRFw5HLm8is1KxJ+adR20ah5DbueOYOossf?=
 =?us-ascii?Q?Pof5cjBoItYeMf0OSS2AbRWhAuEmSevRuraHfraqbroxGxW1hJ/wZkn+Us/O?=
 =?us-ascii?Q?UemnO/Xg0qL7bB77HJRI2/dM4W9Yh0e58G7Kw+X53KMKuiqS9oxdjCRKcVTr?=
 =?us-ascii?Q?WkeVxTaf6TJ9bM0WjEP1SL48f1GoOTDw5gmAmb3i8AtjqXUio3UVEzbrAd4Z?=
 =?us-ascii?Q?P3PrrfY0X36eYVTl6tUl8KFrrQMyGE6rEpaqcBEBURycqR3iv3J/IY69lVyc?=
 =?us-ascii?Q?HSy3SHBWpjk4BHnCrui3474vltMXCiJ9B+NAU0e3BHbDyEOnhjLaR2ylIXvz?=
 =?us-ascii?Q?uUX+O9FBohFpfE4bUHHWO5oZVylMMih1LajOYXAY8XW4uz80HO63Of8agiUE?=
 =?us-ascii?Q?tddDrrs1l7jBbQb3xC327QRHOqRn4iVmuwDw1aGCoKhx/ya6GU+/rphUw3zG?=
 =?us-ascii?Q?sPUCg8nkwt+UhIgQE9T4uUV3H8dQMUanS1ggQGLLQXa7XU7OMP06APM37ULn?=
 =?us-ascii?Q?Xp55q9Kax5TBdxNQopZKXFonqMNXCX5xs3idkuK2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c0ab2c-8aef-4d2a-35e6-08ddadda73dc
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:31.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COnaZiri0lA18Hh4X3iUDVaj3NStYhZ2/XSGT9DTxlw37oCsZ1p3KF19P93gGf8sDga3cYE3IO/IDhXrEyJfDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6714

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/ext.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 84ccab8cb838..23e5711bc4fc 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4960,6 +4960,31 @@ static void scx_disable_workfn(struct kthread_work *work)
 
 	scx_init_task_enabled = false;
 
+	for_each_possible_cpu(cpu) {
+		struct rq *rq = cpu_rq(cpu);
+		struct rq_flags rf;
+
+		/*
+		 * Invalidate all the rq clocks to prevent getting outdated
+		 * rq clocks from a previous scx scheduler.
+		 */
+		scx_rq_clock_invalidate(rq);
+
+		/*
+		 * We are unloading the sched_ext scheduler, we do not need its
+		 * DL server bandwidth anymore, remove it for all CPUs. Whenever
+		 * the first SCX task is enqueued (when scx is re-loaded), its DL
+		 * server bandwidth will be re-initialized.
+		 */
+		rq_lock_irqsave(rq, &rf);
+		update_rq_clock(rq);
+		if (dl_server_active(&rq->ext_server))
+			dl_server_stop(&rq->ext_server);
+		dl_server_remove_params(&rq->ext_server);
+		rq_unlock_irqrestore(rq, &rf);
+	}
+
+
 	scx_task_iter_start(&sti);
 	while ((p = scx_task_iter_next_locked(&sti))) {
 		const struct sched_class *old_class = p->sched_class;
@@ -4985,26 +5010,12 @@ static void scx_disable_workfn(struct kthread_work *work)
 
 	for_each_possible_cpu(cpu) {
 		struct rq *rq = cpu_rq(cpu);
-		struct rq_flags rf;
 
 		/*
 		 * Invalidate all the rq clocks to prevent getting outdated
 		 * rq clocks from a previous scx scheduler.
 		 */
 		scx_rq_clock_invalidate(rq);
-
-		/*
-		 * We are unloading the sched_ext scheduler, we do not need its
-		 * DL server bandwidth anymore, remove it for all CPUs. Whenever
-		 * the first SCX task is enqueued (when scx is re-loaded), its DL
-		 * server bandwidth will be re-initialized.
-		 */
-		rq_lock_irqsave(rq, &rf);
-		update_rq_clock(rq);
-		if (dl_server_active(&rq->ext_server))
-			dl_server_stop(&rq->ext_server);
-		dl_server_remove_params(&rq->ext_server);
-		rq_unlock_irqrestore(rq, &rf);
 	}
 
 	/* no task is on scx, turn off all the switches and flush in-progress calls */
-- 
2.43.0

