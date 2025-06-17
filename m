Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9472F0C64
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190792; cv=fail; b=iW95fMIXS4TrzP1jmzFogSSnkHQG1J7OHPHYQwQUu7pimCMTZMVjJ6C8DoocqoksU6WqEKNQTkikhz1xn6cleNYR6Bcx7PXrFAWbKQXQ8ZRihahJCbdJrOoUrwIhEtG0eBr4Q6Jlt8AaN2Ix1Yhx+yM4SCsSUvjFkd5zvBTGlms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190792; c=relaxed/simple;
	bh=JjcHblc1uvhG3hbCZX0sKor1MWvez9jccNjDt6syP70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sg9YVajHlKbhZ+EoZhMR+LRMPT3Mqv1vpiUY1y1BjkoTHcUGdKV90rIpYTv2+DkRXbLOyKONVESE/mJ2MEBhf723HG5AXZRL1qUAVRKALCX/KRv2PofZZnmBt95aaEdIortwy3WXi32BPepa/q1iidKo+DwQX2uuaI/NdLOhkzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p+67j64s; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p+67j64s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1/uEHyJDOBWXBq0jGhtd2nl8+FJkulaFgoczmbWhPHAaXNdbPBOfReHfqHhh8r7uczrVItXhamqizT9rmzXf74IvWActAY60NCsHlUMSeie0LUixpjZcyT++M0EVNgJQnHJ1LJxiEU+cKIQ1Vn3It3qpy/+FGFivtqd8v/5a43LNL9f44wyzAu+HPJX+gtlwZ52pSAyOvtL5dHMSAankJu5ZYgXnXjRsqOJagYOfDZhvStsSgeYs1helracZKaJc+ZdRhVxESuM6RuR6Pt/wJ5n0p05t4wQZrYUa4EX+2Zud+dBHUdyCyujM59H+Y10HIzYtUFuK1/GPiQLuuR7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUy2zZXVnKA9P0WHcAG8tUWuwHyot3D/4UOAM/6F7uM=;
 b=Ex9RG6FGjsC9XieICkNwiUApYwt+lurkqEk0PgYuIcvhpMxuSv5chIfhywKrkI9z+eYQz2Zfgh+NuKJdsyFPoyr2+WBGLCDApWaMg1MvUSnasy4ydI6T7oAesIzaDBGuyWIKlr5zPjy2acbGKL3FdkpnVtd0mecrZ/FN3Anse2dnCi/Gv4LoEwpZa4Dk0iK6VcK0vcGpR88+kSTlJsFgFwsTy9qInZhHdfbvol0cKErLkacaXvxCr08M6nxyZD+STx4go5ibe8VFH6I2GqjbuROOdBIyMDgjPoqqHQ/eEHZ+TaJz81d2VDbnjlAhO/OJkyi2WcXR/kT46O55Yrn6Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUy2zZXVnKA9P0WHcAG8tUWuwHyot3D/4UOAM/6F7uM=;
 b=p+67j64sHosmN1CwtoCB3WMO67xXJ/UsTikNSSg/a5JNchoCvAw+n/nYKnFn+QfXq1hv8pN9NC5cjWk9BUGhZy6XtzlHpH+6Mv48hl7+fmp5ZqwZ3+asEs+ifouKIOvDvc4PF5kE1Hn5F0Ifg+Rrzy6z4a80GLf1t7QGzE2Mbel2mWrMA0ZKxBFX9YQIrkonjydnn5phzQU20/YDP1CPB/QLAGEdDZ/D4Hq+a5dZnNSy3inEWg3FAHnNmPnMyWySgciPI1YC2iOgwTs0AsOEC8XDc7lQhFV54LRi0lvvFGoznciUQV31W3MrqcFm9QEArVaEkKUVkul6k9YNGp1dZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 17 Jun
 2025 20:06:24 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:24 +0000
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
Subject: [PATCH v4 10/15] sched/deadline: Add support to remove DLserver's bandwidth contribution
Date: Tue, 17 Jun 2025 16:05:13 -0400
Message-ID: <20250617200523.1261231-11-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0060.namprd20.prod.outlook.com
 (2603:10b6:208:235::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 33dbe4c7-d372-411f-e45f-08ddadda6f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JRNsjfmPhtoO/hfBC0tqNPXwJ8V58CUCmTX3Rx02xbtR8gK3bj27E2E0nNh3?=
 =?us-ascii?Q?/49OJjX+Clel4i2bBI94Wwmh80g4lYc8QcMgPCzv1iQMPtIvHzOu0894kk4b?=
 =?us-ascii?Q?7g+cMOBsEujOkGTKK049KWFelbla4RgfD68cU5BB/eyQ7GDdl1FnI+idRyzD?=
 =?us-ascii?Q?LnBRbOuWH0rem2BxfTtZ85w0jJPhmN8Q/X48K0LFdQD0MZrpRxSh3XwleErn?=
 =?us-ascii?Q?GvkuA72ckCq9s4yEMRu58zaaykKcb3z9wmPkR//gKxirsZ2dKS/LxOKn47dC?=
 =?us-ascii?Q?YNtCJT5aIB0sEaMQr0qjdlwmnk+Z8y54vypMQhC1eCctF8ysFffGi0BiVODv?=
 =?us-ascii?Q?eNaF4tW9P9Cup5JicLssFd1+8l6pM/wiHenTaGiXf0K+mnSpyYZkimyi2GG3?=
 =?us-ascii?Q?4Si5wHvH7W1BsEvSM/kx3XzBBtcIYXOujVdAuOpny8QDfgp8fkj7fiqvQ9YB?=
 =?us-ascii?Q?Ie/Md0pMiPIU9l87zNalVzZhJqNE6f8z1EMHL7fkAj6wtr74GsoqVKc7msBv?=
 =?us-ascii?Q?MZmuKybv10xFYUEvmN3x2miyBX5VlrXZ/Rpx3msfGS9MlN0k8xClYrZcKqa4?=
 =?us-ascii?Q?0m7ve5D2cYe98P1X+g6B2ZlAsS07n5iDRvW3jL2D43vu21RzTId4I3R1He2I?=
 =?us-ascii?Q?Gc6rQo7jKGGmeSHgAfLY66Wy83V2vb8HQ05ffld07hROiM744JpIwscqF6jS?=
 =?us-ascii?Q?AnOkQpa8LGszegnC6SsZj4odHX17ljacdNFhPhIk5Nu7yeCxnDO8u/cgAJ0j?=
 =?us-ascii?Q?IlwbVnE3WaFU8VoWXn7Xn4PZZV/T+UiRFUPi0wEY1BDc20TQ04cCZBBJ2QaF?=
 =?us-ascii?Q?yzXrTQuJ97Z/mdxIBiIkFcth8Xe8h4SZ9mlz1mkLOtGrsZEMkUMSka81eM/f?=
 =?us-ascii?Q?RTTc1Ke7vQi5Et0UsVNGbxmuqogR0FEwTlV0HhgZXDDIIKhUFvg8BeNsbrPL?=
 =?us-ascii?Q?or4iL5xSq4XAUvIMimRlOPq4ojtDtF7BvR2XaOGk4mukw/1TlUjDanHQgUbL?=
 =?us-ascii?Q?JWOeDSl1G/nDmps7MpHVEx3SEJw0R9ONvy8Llui2wL/+UBvZKr9qFCuaxxA7?=
 =?us-ascii?Q?QYbJFH3FjDQa/zp1d/PPPhK7hiRknQh34fdRrWINoL3oUTErZYEgH8hwMOOZ?=
 =?us-ascii?Q?L5sOOdkurQ1qpqTaLqfqqHolhb6o2CnkCFWJ1KNT3dqBRD5hPGC6XhmdWfud?=
 =?us-ascii?Q?OL6mtlm8zvfqsc9yzOH0UiU75AiFKm1K7S99DvuhIu9NK53u2IxZtyWBoWRO?=
 =?us-ascii?Q?WJJvMfTXAYi21bUIJaFFBe3nq0SPrCY+TguQeXGAm75sSWwh5ryh+d5LA2sg?=
 =?us-ascii?Q?yEAwmC6qrVbTJ6+ziL3D4r2Ewp2VAgFg4GzOTFytgexlkyS5hc1VXTje0yI3?=
 =?us-ascii?Q?GCmgaYZ05Leb64OhMCfXOGkZFSy2EGPfn1ksze2JTraXEsSlBTyR6VL2xsNQ?=
 =?us-ascii?Q?Xr5oPOm4+4JdK0zAeXOHxJGN45UuqIRjjxr6SzvnhdZUxuQQRNxuLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8OFR0CzeeQ0FNDdDHUCa8dNgY6H/uAKGAwtOVP+BsR6nNUBB73gl/QXPAk/7?=
 =?us-ascii?Q?hKXxzA9RdhK5HJATxZ5H2kLzNjgGtOxBet2b0GHChtARVnzZ+DA+BvXLMJe0?=
 =?us-ascii?Q?oUufrX2mPFw/0BHza6IAPGf8LLg+rng9lzSC2eXhiu7mdKSYIlYEk+rg1oRr?=
 =?us-ascii?Q?lNSXXFFG5bSE6iizXpBr6aIqxIzOBW2HsxONfnhrwtdbKRAtv4aRLtkDn3DA?=
 =?us-ascii?Q?l9o/XIDVkhPUO0xwNKsgYu3dBebukGaVvOiPG3KfQxIN+xnRslDa8g7uY/Co?=
 =?us-ascii?Q?Dt6LNbEMCQMw/+0eE6PsZgSv9213lcn0zTt5zpjWKmMMmQc0gNqUeu+Go9G6?=
 =?us-ascii?Q?GL2pfix4aQw7889y1ubB0rK9W9URAAfq9t4vI1KVFVgxw2pFsxv+24qctyRX?=
 =?us-ascii?Q?Pduvk+fK/BIYxB3GIKtD1LAehNuDuJiw/hXAjcY+33BsKldWaVb0wqpAQvow?=
 =?us-ascii?Q?Crbm3nlVRgsp1hldEO0ttYMH82MsW6Ge+DfQ8PCJTYQuH3A48vZxk+mkhKlQ?=
 =?us-ascii?Q?HhfJeqDJfA2Z27Mu0FnXa41861jXcLug+qlEs14zLaYqxxzqA1wU4vAMHzrc?=
 =?us-ascii?Q?PgdvWsRTVqDik/iZwkF+rJDH1r8ieWbbVjsgvoCuxAxLt4F+7uPCqpJJGNF4?=
 =?us-ascii?Q?W6KwWEWiOhqycpldDNzVYrq9FyXImjfoZw/TRQutay8hx5TvZDY8XGm0jRBc?=
 =?us-ascii?Q?S3WURo6L8kLPv6fVGisu6A/vhAFyEjWLZAAiiyS9KmVou6K+05ST1NgugCzx?=
 =?us-ascii?Q?HOnmeZ4NZdAAMrP8WMfI9TL6yGTNY9w4ozI6GigYe+R0Wz3mJ6FLUL3spyNc?=
 =?us-ascii?Q?RjZQRLdxXhTmtC5DX331H6OLiGkRoiKAJd3y8/1R7SeicrzrRk/GyH02Bt6l?=
 =?us-ascii?Q?xnMCDNz0i4JZnHF5l5Gz1ckCINdkwg9GxaCbEhbb3lsI4G94ixIbBZ3ixAEm?=
 =?us-ascii?Q?xUiJcQdsHq/y8qexEmpQwMpaaxkafhmIlBKL5raOR3VeGVO+Hy0eC/SqkEx1?=
 =?us-ascii?Q?0o2411POVcxkxU6ubAsTLXsMWWr/mLqlM/0OAMhKYM3onmAI0xoliO0Y4Jop?=
 =?us-ascii?Q?jyPhxhjKMXuIgkuK4AR5n1ycrFXK8vxDmUIbdwQE0H+W+OrnwWayUMTPNfig?=
 =?us-ascii?Q?U6EdeSZFfXZj3UlVkJN07fJ5qHCH5T1t2CWrvOWZqmUDGMtkKpU8GPBR5rCb?=
 =?us-ascii?Q?TovwrI4KyrMSXKHgA2ewey5ubGKdahYf02Hl8ck+cvaVEDgWoHEq/bmu6lE2?=
 =?us-ascii?Q?EGM0XaZUEOBOw5sMOoJYi1Nw7hv6YDrhzep2JipBn5+ZWcK/mX/0HEm0GxWg?=
 =?us-ascii?Q?9ftTwHKYUy5urGnwDTg7V89WCqTS8zpFlTs4pBv6IFXQcTX4lB08G2MUnyBk?=
 =?us-ascii?Q?qJPogc6PLldA1yRNE2hDO9fHXbCasFrVFZxhLEsb3YMVmk1j4iM2X0qSLJiT?=
 =?us-ascii?Q?0Dkv3oP0pTjPtxJEl7/fVlZ9KdjN1OYaXfbk/LyALldaBarmzJR+/qbTbsAq?=
 =?us-ascii?Q?6902rPAdMmIRcv5bR1Y/1IRLH2Q2dzHeIK3vWl+SS404mEHpDC9WWFdrqSEL?=
 =?us-ascii?Q?ydri7OBkgBsr/zmj7nqKSLNwA+gSm+wzfCCV3JLB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33dbe4c7-d372-411f-e45f-08ddadda6f7a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:24.2880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQxcD5filDqce5M1r9hvnxH+WKurB5C0Q49Lc7CKsUuyNRWMOYFhDXn6QQEe7s+MDETRw3thBGux6btUICS0Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

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

