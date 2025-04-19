Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1940A47
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745066159; cv=fail; b=CQHzYhBpeOFki7zn6RyEeUZSkac05Y/nT3zYVZFUGuzUacANz40ryXvEHtu1eeH6RJxEvDZL1ZRIWWUpBACQAPghtcJANeZdT2iYYxcRTTGFLPqYRUwt1tYc24K0sAJZxPQVAtUxt2Cc/MDtTmGxGa7aanejeyX1WqIjj8k8Ffo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745066159; c=relaxed/simple;
	bh=OdFkKaJtAqhwJlNL/01Bj2xXtS/EOj21ZrY8QXjDpjY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uWWCimCS0Ug3omcQ4MGfLWIfa3FW/gh7MXrWzpiuJKnOzGxSogvZ+D3yGCiZ8EZb1g7Klc+kvbe+hKqw5Es6ZQXhJWKV4JWKmGi0JGnSahHb18rsQEnIwEQ1/4iWRFeYrEk3pYOiu4QJolT1NRSVtSEh22e6i6MsbnNEm8QFRKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TjGh75h2; arc=fail smtp.client-ip=40.107.100.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TjGh75h2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJx5R0fbd9gPKUGYTqNuAlqhPlYcqMjQn25wn6WIg5fMsTJ8XBXKQM18Awb9aGFJ3ygVw89Rp/g0R96h+dt+OjOnXNFRsDHxipbTJ8pHrPFcetkEw/z8km17nDKnU20+y8lSz3pXvv67/ncnXeNPp2LVMGhQ+xiWx+1pD0+cDQ1DxMCjo9grFmPpU+JAKBH448/SybssrNOpJg+wnm+ChRsYaT7TQbBii2Uo2JThPu56BL4NZX0y4zQkWS2l/FOW+E0wx4E/iIerqYOWZgRaZbONDuR5KHixSd0T2OEkYgWesP8BaH21Aw8GsCaFwxsTSc3PPkMcKBiVAOZ2ZeTwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpl88B5jdDTXo/0CBeLTWu4oqRKTMCSMPzuMDfaUWaM=;
 b=KAqDKYHsKNm9Xr75SUc1n/rmmX35s1jNSQqqN36fG4kQdosqC7yc+CP7faigsDL5yg4ozI+KcXB/IaplJQRA8IeKLK79EEqVWvOIZ38cdekJB/gpUgjuemTrtUYGkewYFOdaYcxzQLB3+9xBgbJHlkpFrCNojcAOdudSDdVTSCXiTlk4+hSk/8+yTs0FRBi8OINtvVh6U5swGusiImkGe72Sk9gz07n16M7eJV2VcVzBMwZqEtXQTO2wSu9W+Trk2L/sEC6a1NffExlyhh68EXxllfAzeiOsaNtsltze7cqiYz57HKPk5mFGflJ82C26xZ4DHZUiEUew/2qvou6MAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpl88B5jdDTXo/0CBeLTWu4oqRKTMCSMPzuMDfaUWaM=;
 b=TjGh75h2aT/f8RGTqCK0ZA3SgfX0DTotcqoHVjDHQeJ53myXNmsNDeiHINSWqv7vvB0+995AfNORBU7O6juqB8EnNJkMez0locZfmeLlHXpwFdlvDqdSukyxYP1OFM/DejtmEcQN6Hd1mCiNuKYeyK8ISG83W+lrid5TXoQycfQViwAcLpejfHneAD4Rh8zAdQ1lVd+3EVZ+vyjk0RDwqGjDdjUmQbWasIF7k8But0NilBJ84wlPrGSC7Du65iHlfGErMKaAEpvwrZ7mQDX79ZH1N8OWUIR6GYu2wCKgb7SZoGuxe1PP/9ufZm5HIY5mNNl/2qXMG5qL+SMPS1shTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DS7PR12MB8083.namprd12.prod.outlook.com (2603:10b6:8:e4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Sat, 19 Apr
 2025 12:35:55 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.022; Sat, 19 Apr 2025
 12:35:54 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] sched_ext: Introduce rq lock tracking
Date: Sat, 19 Apr 2025 14:24:29 +0200
Message-ID: <20250419123536.154469-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0100.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::15) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DS7PR12MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: f358204a-f95b-4d55-a7c4-08dd7f3eba38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kzEeW8Z0MdpW+/Oq/MUG+osOo7a47GL8xLHbqxgVBbZ6Dn8vH3mN0OBEJhE4?=
 =?us-ascii?Q?jvb9EsdBcXAdCHbWGMQIP3J8ST2+Lj27mCPGUaHLZfFvQ5D6t6yJrOwWTcpx?=
 =?us-ascii?Q?5b/+eEYluG12FFMDHEtIT9XUIvC1DRolCcBX5Em8HDc0+trhu+qn5APKEKDH?=
 =?us-ascii?Q?Kx8Cxh70lypeBRTdKIgKsQUgGVsn6nMjP/qRIYwsGSjNCPwEMi7hn7slFV8U?=
 =?us-ascii?Q?qVdAcV5INbetzxunmtFAZlUl3IJ8OMNbrKCvlvWYUMulg2QGb34wjtCbjlyY?=
 =?us-ascii?Q?Z10h7hYpFtYOhQFAJ8VEFiRLkyYuIC5c9SJPZP/Eiu5IRvbfzui1k/QepBvj?=
 =?us-ascii?Q?5InTlLFaSGMqPBfIaS4z2pdl6vCRWcZKXSrVuUFkdXgQvo5kCiTn95q7OIJc?=
 =?us-ascii?Q?PkZwFofvVC28m0qJ3YYsbH8fyErXGjjtRtrIHkK8P5pIG6f7HJxVaWsuh/Au?=
 =?us-ascii?Q?4os8sGhFgceBSnxB8BbJ7InP4wRxuO49spa3jH15Lc3abMhnX2t6y+cSS/DC?=
 =?us-ascii?Q?vGOxKGxJPsRoCGr4xKMfXM5m+8IMZYcl0J03iPGpRbDVzULZ3N7crWsL51l6?=
 =?us-ascii?Q?C/cWIRGu7PHHx8Ajn3wVVBNZMHWPqVsHvyiB/4cFVLidrjP7fVQD7R5GXtuD?=
 =?us-ascii?Q?N+tzQ8QQWfkNxP6TovpbVS7KRJJ5LOh0fyYtcouOIl0SORF9N+S68tM5KmPS?=
 =?us-ascii?Q?g4217+SPCGgg122BnVycNZ94KD52K3vr1TfKQpKU+uFCZyDlxesWGtMKvYOr?=
 =?us-ascii?Q?MM3Kv4iNOBmCaZ3dmvDT70ynKJ5d1U0WYskq6JMxyC2HkAxpuMdFV/3BLLqC?=
 =?us-ascii?Q?fWOoHmvD+HZbpBihbn9/KugDuK74Mwd8NrYsYf1rIjVkh1xT900Fx4cbnYAz?=
 =?us-ascii?Q?P9ZhLAdkEd0ORMrdrOEujzR2e11sMdAz4dY+P6oO5IfhEv92dFgx1japkVXG?=
 =?us-ascii?Q?M37LjUZMFWkRPW8z7Wsh013seqSoI4M39OQN+upp9h4b2o25WH7F0fBRkAFq?=
 =?us-ascii?Q?ITriB4WjguX7X+9Pmx+40sd0ly7z74AbL8RoRVkHkTrXPCDFpxgVmfZufxQs?=
 =?us-ascii?Q?1M/WEbJn6nVBCSuxu+GvWDCYxmgmsPQwgVZztMViB5FN7Th77DFcOhaIMz5Y?=
 =?us-ascii?Q?bsGypbH+NQlvylTwrT/h4jyl+1z3bqAKu8CVIOhpyFBKOET2529QR7nnCyUt?=
 =?us-ascii?Q?Nu2Ed5G/6XWX5HcPnKQX+/xDLNjF8Wg2oUbTM0KsUivQgg8au5lo2ra5KUFK?=
 =?us-ascii?Q?jb8NP+pQpZX474AgmwOQc0MMqXmWBRzH0uOI/H2qU76O4pMVyTsbrx4dtSsM?=
 =?us-ascii?Q?/SVI7IVgLY+Y0bT+SukURuWRfkfA7D7JhTPyEqsskT1w+WTItEvn5hSRu4Qt?=
 =?us-ascii?Q?vWeji80MFs87pTmqxMZ7txFF5ToM69JVEiJzD9xwaN+3BQgc7A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q92THsShXO2MDkLlM1YzSTn2MnEa/XI82Zu3jcLZH1cFZvB2r+RI8Xbn2RTP?=
 =?us-ascii?Q?P7TdzSE+MMJwiASu8jPEgYZIwUwndSfR1nQd8WhRz6z9u8Qb+qn10bsiYpjL?=
 =?us-ascii?Q?jZCN7xtUDG/+HeS00hmI3+hugJt9aArY9+RwTjHl3rDBDpMJd98KYyvuCKvP?=
 =?us-ascii?Q?RrDNPpsQ2/cdVW1gA5K0STvFZHYXiVVCbdxKIfxcoyAJ9fQqSoWOfUrkrhhh?=
 =?us-ascii?Q?nNPy2Zfl5poM6otrvAXQrAsq5AjXgqUo9R1kwirc6hMPYbAtiSMOoKhRCr+P?=
 =?us-ascii?Q?tvrPZYDN5GFndxzfJFJThoWeCWaOY9IKHLDNBkNyfO7v04OQ+ldvDxb4AP23?=
 =?us-ascii?Q?AaEc38EHcHv077gYayHrHMXyDbPIW3U/3+Ci8PDrzU9y5tmsNIgNlubjX8+W?=
 =?us-ascii?Q?azLF9K8wS4qUp83BavDTCkw+KhKR/qtAtoiCWiHQgFrBdOqPk0Tkf+7evR+U?=
 =?us-ascii?Q?2dVSRTjbkc0k6hvBTUrjkxwZzPTPbkh8K3VsMio9f8K0fNHB8j9i6SUWCUsM?=
 =?us-ascii?Q?bGNviDGf7eGsJUm1hy7ndvFRL+rcfT8YF9xxfqeYe4OucerqEDudaaQtP1NQ?=
 =?us-ascii?Q?C6/rLfBw5qwZcvUTEx89HqtQheSkTPhieyabgDDGfnodlQDthdAxIw7f7TGw?=
 =?us-ascii?Q?d7iCCAljgnsOUjhHcOG9+j2shFQ/AOsPJiBwsUP/b+/JI6NNzw7VlGWYY4hR?=
 =?us-ascii?Q?SzZIg8lwcLBh/478/8ZqAvpM7GZSMim76DMy4r+JGKBQ4KblKxGmIOceyJ9Y?=
 =?us-ascii?Q?ULEIy27+/3On69L30qoWx1dducTj5p9+QibKBp4ApIc1fvsMbXiDa2BllDs4?=
 =?us-ascii?Q?EHj+S5+axAaBafVTcosFJh9UzZu/Z2GBrFG63uLd/lq4HUXBPA4OoCaqnYil?=
 =?us-ascii?Q?3T/lEtOBWhrgnLCSjkxX6vUoiAo0RFfdjHaA7jy2A7h4lStbs6UDM5tALgH1?=
 =?us-ascii?Q?LzkGu/R4HRKMUlji06t9LvYMXkTsn5JUsgFIWpIgJPBk3qV8MF0xi3T4bSAY?=
 =?us-ascii?Q?SoNaxU57HR+mgGBtNXVzQrsfmFHypBEzoZMb7IeFZKfR3D/Ap7h1oupCGHPZ?=
 =?us-ascii?Q?3BBKgpHQpv1Cc4GofDj23lhwJU1WUVcAVqCRJBHd1bsT3MqbKu2QSSKm9GUU?=
 =?us-ascii?Q?pOhd28EHIY4jsYvfKHjXpRWVXojq3EExcO1sPqGqhqJbsqzFSk1Cdn/QK6Fv?=
 =?us-ascii?Q?G3pWSGsPTe+UVZ+VnPuTwr8YsjsSJqx5Ib+py5pHV72k5uPItfL4iSCC8I2F?=
 =?us-ascii?Q?7QOADC/mj4Qx0NcSEtYw5cUoweXJqwdLwKr0ieViSsY6KQBGIuQ+X7C/H/Px?=
 =?us-ascii?Q?5yyhbqfmI73sv6Oq/BytNLH5gz+D7j0DkF0VC4o9zepHeaO6zPAE89T4SUPW?=
 =?us-ascii?Q?P82C4FDEhxqoBpOT2/glwT281F5vmC4QI0M7EOSJ4rrpowe71vKusydm7k85?=
 =?us-ascii?Q?AvjlkrkqXi8HbgbJvyPFcHs6UprUj2jIQ3faync8sANc3onCVxzpWnJdWlaa?=
 =?us-ascii?Q?QbiDaYEEJ93jLJ8vqAcQ4dcPqioPH+B/mO3HlbE2mNwAK5YQgAEG1o4ge9cg?=
 =?us-ascii?Q?K/jcUNHr2QB4xe3JtYIzrMDA8kjW1WMBxxaTTZ6n?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f358204a-f95b-4d55-a7c4-08dd7f3eba38
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2025 12:35:54.8185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +woU87EQ1WGRYxGd6s/RE89/JtRupDWud38rfnIIPUsIqPzTrnbPqnN16roP/KhYxsInFO5DzYA30GzNJKt2eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8083

Add rq lock tracking to sched_ext ops callbacks to enable scx_bpf_*()
kfuncs to detect whether a specific rq is currently locked and safely
operate with it.

If no rq is locked, the target rq lock can be acquired. If a different rq
is already locked, the operation can either fail (triggering an ops error),
deferred using IRQ work, or managed accordingly to avoid deadlocks.

This patchset is also available in the following git branch:

 git://git.kernel.org/pub/scm/linux/kernel/git/arighi/linux.git scx-rq-lock-tracking

diffstat follows:

Andrea Righi (2):
      sched_ext: Track currently locked rq
      sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()

 include/linux/sched/ext.h |   1 +
 kernel/sched/ext.c        | 153 ++++++++++++++++++++++++++++++----------------
 kernel/sched/ext_idle.c   |   2 +-
 3 files changed, 101 insertions(+), 55 deletions(-)
