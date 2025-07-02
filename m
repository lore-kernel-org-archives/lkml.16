Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE222F7CEC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499019; cv=fail; b=YRUIE4A2ofHHNYtBzL6zBntrK8ChiHqqfC0ku/vi8dyuTx4455rQ5/AZM3+xlIH2FA2a8HDWTs/B1QpfScLXJco+dSQi32Mk10ncXImuhHqZzEPK+TdgIJhpgs2CqyCVVDY9L+kJcaXhEdVrKXl/HcZ3CMuFY4XEYUqmo6sYIwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499019; c=relaxed/simple;
	bh=WiuIRPcdeirIBevGHy0btqvwKzTHefu/isgl5TdGmtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uVXDRI4fVcQHujFf9PVqBZHGsje3MbWi30dQihq4cHnlhsPgjXpSwrWSls0M/oC0qgCXFNSapBocHn0UeGUyUsyR2OFyXJyyEtbDJiuewrq9uGAhlL7kCqOxk8KO0rI0+S7V7tcOfkVBf+txrNWU4u1FgsPE5xd1nI1KQ81tXcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gOHC85En; arc=fail smtp.client-ip=40.107.223.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gOHC85En"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=goXmWMUeuQusEELphVQ/NKlGZDcqs969TQs36gUGUX+hBaLY56kP1kIXnExMl+yDUf43NdSn1BNwKrZAaxbEgRYH+eCsKT9YCJXEbxXO8PKoLhjW8GZMb8G9PQ8Ys0JK9j2sPSIakeP5wEe1o1ZDDyy0QB7ME0LsM2VsZkQk3bNI54WCSJ9L281CPotYChU9Z21h5shXm+tYYSNpHUXso0GVwlTwsLDf9H3RsqZ+OSjnyxfbvcBsPXDagPzprJxDp17LioXqcpZ8J/GPkxzZwSMI1CB8Ywk9KYYO4G0sXPUXJz90wtB29QdD/ia33gy0C+EK7EJWYQ4bgitBkRJwzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78bJuQ7K2JzPi9stiPG2bzC7Nv2eLNcLJTMYgHJ8KSA=;
 b=ytEN6hZbT0X/gSkiYpHUt7CA/4hO5AdA+HcZ8zOa8nnTgaaOOUJhTR+NQz13SS5z/n+4e7NtXrYJd7j9F7n6yOOvci0DqNPbnVlZ0ziLvCJ6l0QIq4hiTWNkNUBWxTrV7IS5+u525qWoDE351zQyerkTFz2ygrS2w1bLjiaDpsuhm2gNix99UJ9pavprpE1R6dRbIAvNXa7OjwflCoRoK64JJnnkJNuNO+Fe3qOsiVN6P3samK09Dt7Xr1yoBEWIZOnu2x/CzLRqYQgk49cCBEagWLbjqyE8ohOfxwEfR71jED1wFoGqIWDjYDioeOu+RXuvKcpfTnUbcZfBB6OI1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78bJuQ7K2JzPi9stiPG2bzC7Nv2eLNcLJTMYgHJ8KSA=;
 b=gOHC85EnQmXqjgjbIGiLS3Q9cNTEsaEVy7WlTnCRl+j1XT5a+By7P1cQc+c3rLHXD2HqaRkgv2FlbA7RYR4ehR58SQn+NCeGVlpSRa+sZBTVK/yOQjrXoTD6rXDo2zteZgNObjfnt+7mxvJftszIsbtgiW/TDQvMWEJdHmb+7t3NvMGEgDOUL96xpvjNwN3KCnoiC4yLE8MNZJt4o5PHNUnyjuSzjQxLHiykPo9pN0NF2SNNxu/4ber5QjvVITyqkexcLC3UYpC02JGNp7PUAICCQIPTecTBwtzO9i1b5VwJoLIz5BmHzF8Ls9a+NRYuacnsxR6aIlCFQoq+anSUpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:30:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 23:30:13 +0000
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
Subject: [PATCH v6 09/14] sched/debug: Add support to change sched_ext server params
Date: Wed,  2 Jul 2025 19:29:34 -0400
Message-ID: <20250702232944.3221001-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702232944.3221001-1-joelagnelf@nvidia.com>
References: <20250702232944.3221001-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00016419.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:8) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: effbc4e2-630e-4d15-aa3a-08ddb9c06514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TeHxkuyDtNZ/F3ofi12bLo5baoUrSdGSdbSj/xgvyEw7oM/JUPzTQ23BfCH6?=
 =?us-ascii?Q?Znv0kBUPNP3cRc+/oFDnzq+du4lN8cQuyQ+//gizb40i6I70AfOWuLlgE3cc?=
 =?us-ascii?Q?yQ5MVbHK9NRQ0TWtNhQHyX8cVAnGrAJBaw/ev9YreSlrTzDxZmamoDzmBJ9u?=
 =?us-ascii?Q?g+c9eC6IpM8jlCedvBWA/JJjwgESrb9O07hpKnbPi3X9XqcjApF7B0P/1Pow?=
 =?us-ascii?Q?EOHYao1hoza8nz7NyybFIvOAlr+gBhKL7fSWrwesCryUYQiSlyq+TKge11Z3?=
 =?us-ascii?Q?AC5xdgEn3Ckok4M0SmGqD5n1qsUeXrDCKYFhfRtNgtg+3XWa7Yz1taj8gdIM?=
 =?us-ascii?Q?RnxfsGZ0QGAf5CC7igb5VerawQ8plCTVSyhAPQrRXlxSrDMSNuagjQTQuVgl?=
 =?us-ascii?Q?6ruWgFgJeQZUPe8engbF0Tboi/tcpGu04ro50//oPHcalZttgQTzM1pE1/7s?=
 =?us-ascii?Q?tYEJUKJ5oTbxauFonkj61lJn4b+sejkNriQ0oG8EDCGS7pk70IpHa7MOO78i?=
 =?us-ascii?Q?w/Eg/W2GR4J5deFYaGw6jAGfyzeKL3yR+3IDQeTdeQgr7h5bO60gkxHKwvZX?=
 =?us-ascii?Q?HqEx7fGr7MuUH5iSQHctIPGyTDdfHtSdjMbUfwtkHsGDfo0QB79g3J17jwBt?=
 =?us-ascii?Q?VKFnYyDZXMmjgVZ7NsgwuRoNQ8mAvhWPrlX3p1OYuIOPbdA0UsvyEcwu5E3H?=
 =?us-ascii?Q?+qjnUirG2cUZcqWL95f3G4QjmFP1F79FJyBO28mr9qqSyB1giFNS0Ca9aABN?=
 =?us-ascii?Q?3774PVHRMggujJdZLfp0Bh+S6ewSkI8ZA0Yuye6DBbrQguiw3A/CsAC5x5FO?=
 =?us-ascii?Q?0K2YoLNMRriq1aTbPNDExVbvkg9GuXML+bw2K7VrkS7m91qSt5ZU72nMJjrR?=
 =?us-ascii?Q?PxPlo1N50s37pYI8mCR9Ap6X9Ft5xECQCvEQud6M6WAcfE5kiEQymh6Tnbrq?=
 =?us-ascii?Q?xtK7xuGqD31Ga2Qe4YlDEp6TRRnQrZRc68XeyZ0U5Ig2XReykAxH2P5UOZYu?=
 =?us-ascii?Q?WsYg+SHLmhhdGakPtamVofrdU67NsDe8e1XvEWKj44DzPlbFFbl0RnsrCMXw?=
 =?us-ascii?Q?8onrY5lLKbOPKmYuX35Ev3Z6AFkwcLh9OgFGa0y/zXsD47k/UTq+UZEK8OTD?=
 =?us-ascii?Q?Olzv5tm/FFbPLCLmfxDOQUhnHZGDG3NNxR8VjnBO+labIZeu4JUrlGAEL503?=
 =?us-ascii?Q?FuQHlFrjgWwUqSOgDsdvVeZgxMqEeFnAB1Rliqv9fq0sDez+/WRHBYrlQLoh?=
 =?us-ascii?Q?yTcm4W2N0QeNVohKu80xRxdtOAHLazfoW5Zj6v3K2sWSAxAhqzDfkD0jf/4n?=
 =?us-ascii?Q?ipjTyffeGysjaqFzIMVAmuNzQJ4t3x6fTWX6ES1Y/pUKlZClYibhMUNassLU?=
 =?us-ascii?Q?TpfRKhbjC8uTa6BBbIYyea5gNq1iAXJOIlicUbJ/iZvETS1fmqaZbRhpJY8y?=
 =?us-ascii?Q?vxLSLkceENI176KmZ78jHI6s7ZwIuQBnTfPpUO0hKrwMmB61gMaL8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p8Lm9xrYEao9RJCAUidpON2gwag2+8/FUU/SvHiD8ZYpJHoxXlWh96DVJOo9?=
 =?us-ascii?Q?c8cmeksvJutZmu6TfLjVjheEM9AwthmpTGzzGoNdv02bcmQvpwrqjlocgw6q?=
 =?us-ascii?Q?t/YktGCzZl9GfYaz0jXhZVH42hzMMsd6+yiBShZbvrazwhqvfkmOJYFhOArI?=
 =?us-ascii?Q?htmv2mBix67Uc9U24P3SvjIzi2HDPvnd7n/VPVSU2pdyc3tKVDNcJ5ZqTKAl?=
 =?us-ascii?Q?1KHCGJDStmMHPunooE36CCwzCM1mQn72r9qwynvoXK3zMCZNJPmGeyBG2eNs?=
 =?us-ascii?Q?nrpXXTsOrVHkc2oBIczyBZx1B7/8qChbUGWk973gAiEsWBLftmkmK7XoIydp?=
 =?us-ascii?Q?pns/xEeVcSHaAOrFlnvrDh6jGxItiO0YH2nJ9dBnYQSoitoUid8uHFl+NtQ/?=
 =?us-ascii?Q?ALrpsS1G1+/SzvoldYSyJDFIN55cq9h0e63Y+GkvuOQNzw3Gda9G/X86pUaa?=
 =?us-ascii?Q?ghN3HO7SnIyVD5WtcJrGgBsfwH+c9xIhHjkJh4o+527fVtxl/VsmUZMN2njw?=
 =?us-ascii?Q?6cRGuXl7VRRc7QlMxe4EoaI5Xj4RSL1PbFN+SdxvU2O5iaJMsiDqe73+9bNO?=
 =?us-ascii?Q?vmDSL3icq6AvOfS1N8RIUpWEF52qA4fSKVIqM++R2XzmtgO451kgYIPlDLFH?=
 =?us-ascii?Q?4CqdL/h7cutDmV/h9ixOSUYPJ26Zh5PVKqUxJdX9TsXXvW0JiAjKf4E1Jhxk?=
 =?us-ascii?Q?qJ7wF+d3EINEmQCp3SPKcdl78s8rIqZP+4/vM8rRQtH2BGhgCIQfxI+wwM8Y?=
 =?us-ascii?Q?kaKAxwreKOBr0U293c9HiANNwDwQ0/BzYjpLXcXf+WhgYwvTme6aaca1DkqW?=
 =?us-ascii?Q?+mSeKHSCVwJkGo7T5BFLClEI+mUjg7vq1vVFm7GoWel4JdEfgvJV9G/2kXCc?=
 =?us-ascii?Q?gjERWrtGKpu/ffJaQfxfYYGKNKOoieZpsx2Qeb6B6fXaZRymTwUJqod9Wl54?=
 =?us-ascii?Q?DqC1pr4RhaNiUK53jJveM1UHc8aFPRHpAh/B2TV/iJZHT0bD9h8K1gB5j1hD?=
 =?us-ascii?Q?rCbsb1VFewfUDbi2qtftPbjwdcS2FvYuoyLZm/FoEmO8f0aa4NSoJhi5pPJT?=
 =?us-ascii?Q?7LPq02gV9mXCsF60bbjMmW/XxcENuxKnGjiMY7DvWA8iJ2Pfx26hCV5I+yfT?=
 =?us-ascii?Q?uJWmopLPM+V4SjCFuCiz3YTZRfMvQtwHp1LZjJmxDtg9c9wQsO+z5RE9Sjm1?=
 =?us-ascii?Q?4JuCyCcwyd5pUxOyyd8UNhDgxnguBntKMatbL1wqM+d+tYIdMCzvePFPEqQP?=
 =?us-ascii?Q?3vB44GUPVAwfJ6gAKyZwPLzlMoit8uZYR8lDhuNg6ZFVTwuhmO41gpsYGxHZ?=
 =?us-ascii?Q?UBdHJOqitaMZBkGIxbw3/4g54m3PaKVASEznkjWgQxFVHpHdhWlgBLiucXJq?=
 =?us-ascii?Q?x90Yv3AnzJBjGIiRBdYE7OeS3OovXgPdvvMbX6A3kFWE8F0DkFjgzvIolnBg?=
 =?us-ascii?Q?skna0Tr4HYoSPic0RUmPcRo9q2GAr1Vm1MrcCQgVbm0O+e9sOC1IV41BoqJv?=
 =?us-ascii?Q?IA+WL31yLvOAICjLN3P6NNAaExP5FhmnWsx1tXXA+EtpW6mk6vAwKCOwLLn8?=
 =?us-ascii?Q?eZACHzJdL4leJ1ny1qNkJdxOYDjQEmOcTCpprv42?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: effbc4e2-630e-4d15-aa3a-08ddb9c06514
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:30:13.8800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1oNxzShMqtDQTN09LV3SlVEzXQTQjyQ7t8KcF892pKqBtO9/UEfWQbztakYCC/uM39Q7suTtXVe9q8QSOFUnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

When a sched_ext server is loaded, tasks in CFS are converted to run in
sched_ext class. Add support to modify the ext server parameters similar
to how the fair server parameters are modified.

Re-use common code between ext and fair servers as needed.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 153 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 129 insertions(+), 24 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index dcb6b2b2ff59..c3e0c02da07b 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -341,14 +341,16 @@ enum dl_param {
 	DL_PERIOD,
 };
 
-static unsigned long fair_server_period_max = (1UL << 22) * NSEC_PER_USEC; /* ~4 seconds */
-static unsigned long fair_server_period_min = (100) * NSEC_PER_USEC;     /* 100 us */
+static unsigned long dl_server_period_max = (1UL << 22) * NSEC_PER_USEC; /* ~4 seconds */
+static unsigned long dl_server_period_min = (100) * NSEC_PER_USEC;     /* 100 us */
 
-static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubuf,
-				       size_t cnt, loff_t *ppos, enum dl_param param)
+static ssize_t sched_server_write_common(struct file *filp, const char __user *ubuf,
+					 size_t cnt, loff_t *ppos, enum dl_param param,
+					 void *server)
 {
 	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
 	struct rq *rq = cpu_rq(cpu);
+	struct sched_dl_entity *dl_se = (struct sched_dl_entity *)server;
 	u64 runtime, period;
 	int retval = 0;
 	size_t err;
@@ -361,8 +363,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 	scoped_guard (rq_lock_irqsave, rq) {
 		bool is_active;
 		
-		runtime  = rq->fair_server.dl_runtime;
-		period = rq->fair_server.dl_period;
+		runtime  = dl_se->dl_runtime;
+		period = dl_se->dl_period;
 
 		switch (param) {
 		case DL_RUNTIME:
@@ -378,25 +380,25 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 		}
 
 		if (runtime > period ||
-		    period > fair_server_period_max ||
-		    period < fair_server_period_min) {
+		    period > dl_server_period_max ||
+		    period < dl_server_period_min) {
 			return  -EINVAL;
 		}
 
-		is_active = dl_server_active(&rq->fair_server);
+		is_active = dl_server_active(dl_se);
 		if (is_active) {
 			update_rq_clock(rq);
-			dl_server_stop(&rq->fair_server);
+			dl_server_stop(dl_se);
 		}
 
-		retval = dl_server_apply_params(&rq->fair_server, runtime, period, 0);
+		retval = dl_server_apply_params(dl_se, runtime, period, 0);
 
 		if (!runtime)
-			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
-					cpu_of(rq));
+			printk_deferred("%s server disabled on CPU %d, system may crash due to starvation.\n",
+					server == &rq->fair_server ? "Fair" : "Ext", cpu_of(rq));
 
 		if (is_active)
-			dl_server_start(&rq->fair_server);
+			dl_server_start(dl_se);
 
 		if (retval < 0)
 			return retval;
@@ -406,36 +408,46 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 	return cnt;
 }
 
-static size_t sched_fair_server_show(struct seq_file *m, void *v, enum dl_param param)
+
+
+static size_t sched_server_show_common(struct seq_file *m, void *v, enum dl_param param,
+				       void *server)
 {
-	unsigned long cpu = (unsigned long) m->private;
-	struct rq *rq = cpu_rq(cpu);
+	struct sched_dl_entity *dl_se = (struct sched_dl_entity *)server;
 	u64 value;
 
 	switch (param) {
 	case DL_RUNTIME:
-		value = rq->fair_server.dl_runtime;
+		value = dl_se->dl_runtime;
 		break;
 	case DL_PERIOD:
-		value = rq->fair_server.dl_period;
+		value = dl_se->dl_period;
 		break;
 	}
 
 	seq_printf(m, "%llu\n", value);
 	return 0;
-
 }
 
+
+
 static ssize_t
 sched_fair_server_runtime_write(struct file *filp, const char __user *ubuf,
 				size_t cnt, loff_t *ppos)
 {
-	return sched_fair_server_write(filp, ubuf, cnt, ppos, DL_RUNTIME);
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_RUNTIME,
+					&rq->fair_server);
 }
 
 static int sched_fair_server_runtime_show(struct seq_file *m, void *v)
 {
-	return sched_fair_server_show(m, v, DL_RUNTIME);
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_RUNTIME, &rq->fair_server);
 }
 
 static int sched_fair_server_runtime_open(struct inode *inode, struct file *filp)
@@ -451,16 +463,55 @@ static const struct file_operations fair_server_runtime_fops = {
 	.release	= single_release,
 };
 
+static ssize_t
+sched_ext_server_runtime_write(struct file *filp, const char __user *ubuf,
+			       size_t cnt, loff_t *ppos)
+{
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_RUNTIME,
+					&rq->ext_server);
+}
+
+static int sched_ext_server_runtime_show(struct seq_file *m, void *v)
+{
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_RUNTIME, &rq->ext_server);
+}
+
+static int sched_ext_server_runtime_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, sched_ext_server_runtime_show, inode->i_private);
+}
+
+static const struct file_operations ext_server_runtime_fops = {
+	.open		= sched_ext_server_runtime_open,
+	.write		= sched_ext_server_runtime_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 static ssize_t
 sched_fair_server_period_write(struct file *filp, const char __user *ubuf,
 			       size_t cnt, loff_t *ppos)
 {
-	return sched_fair_server_write(filp, ubuf, cnt, ppos, DL_PERIOD);
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_PERIOD,
+					&rq->fair_server);
 }
 
 static int sched_fair_server_period_show(struct seq_file *m, void *v)
 {
-	return sched_fair_server_show(m, v, DL_PERIOD);
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_PERIOD, &rq->fair_server);
 }
 
 static int sched_fair_server_period_open(struct inode *inode, struct file *filp)
@@ -476,6 +527,38 @@ static const struct file_operations fair_server_period_fops = {
 	.release	= single_release,
 };
 
+static ssize_t
+sched_ext_server_period_write(struct file *filp, const char __user *ubuf,
+			      size_t cnt, loff_t *ppos)
+{
+	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_write_common(filp, ubuf, cnt, ppos, DL_PERIOD,
+					&rq->ext_server);
+}
+
+static int sched_ext_server_period_show(struct seq_file *m, void *v)
+{
+	unsigned long cpu = (unsigned long) m->private;
+	struct rq *rq = cpu_rq(cpu);
+
+	return sched_server_show_common(m, v, DL_PERIOD, &rq->ext_server);
+}
+
+static int sched_ext_server_period_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, sched_ext_server_period_show, inode->i_private);
+}
+
+static const struct file_operations ext_server_period_fops = {
+	.open		= sched_ext_server_period_open,
+	.write		= sched_ext_server_period_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 static struct dentry *debugfs_sched;
 
 static void debugfs_fair_server_init(void)
@@ -499,6 +582,27 @@ static void debugfs_fair_server_init(void)
 	}
 }
 
+static void debugfs_ext_server_init(void)
+{
+	struct dentry *d_ext;
+	unsigned long cpu;
+
+	d_ext = debugfs_create_dir("ext_server", debugfs_sched);
+	if (!d_ext)
+		return;
+
+	for_each_possible_cpu(cpu) {
+		struct dentry *d_cpu;
+		char buf[32];
+
+		snprintf(buf, sizeof(buf), "cpu%lu", cpu);
+		d_cpu = debugfs_create_dir(buf, d_ext);
+
+		debugfs_create_file("runtime", 0644, d_cpu, (void *) cpu, &ext_server_runtime_fops);
+		debugfs_create_file("period", 0644, d_cpu, (void *) cpu, &ext_server_period_fops);
+	}
+}
+
 static __init int sched_init_debug(void)
 {
 	struct dentry __maybe_unused *numa;
@@ -539,6 +643,7 @@ static __init int sched_init_debug(void)
 	debugfs_create_file("debug", 0444, debugfs_sched, NULL, &sched_debug_fops);
 
 	debugfs_fair_server_init();
+	debugfs_ext_server_init();
 
 	return 0;
 }
-- 
2.34.1

