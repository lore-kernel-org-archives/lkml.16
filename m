Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9072111
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 19:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745177545; cv=fail; b=H4YEtF+5NNG6KlA0dPhEWTA/i8am81q+7miIWSsLHEClxpoCnW8D2L1b42wPnPGWMvtGLpGqwMkKfNy0bMlGNqlYw9O2XNMbGRlF7rWaOo0y8iI1WEpCtDl4iRje566HGLgwFZCiqoECwP60mKcMqzenxbWm7vXrq1fzx0I56AA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745177545; c=relaxed/simple;
	bh=sjPTeOHmDXIfE7i954S8nv9Ez5UvlGBxmaMg2PezhZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uhWoADNfk5fwMCKn0ASJcvjK1EnoQWhr0QY2paQTGvdfSjP0hLlV6XyRZtu8rQfWHD7VU7IUge2aRVbSh08LF7tL5yVe0xXOJJO0ITk6rr1WrsuazraZGuMsJPADy0fiAcSz3Z+GyI3mnZx4W2FiAePnLTSiDbpe8LER5U0KwVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nx9PaeRy; arc=fail smtp.client-ip=40.107.237.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nx9PaeRy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmbZZ4sVl2hHQxF8mIFzQ1cQHdhzuLJ/eSUzwuQnmi2gfFcqKkbd1zQQ3haKiAXCtDRH56bslH0DLBarravc7ZX2IgRanREMo0aS33CdWSw27onR4PGmY24FD73pwg4GI8Vv02qOmfJV0wW619cnzBpHIpnNm5oMWD+Sg6xi4YLqU/m/SXAL/CE6CQPYlA2PuGPR1vsn2cAwCMWdsDWVGVu1LWQjVaATl0Ed32QyC0GqNcdZfVPwMMb093ESB14XGSofKe9O4jPDGrT9PkaNZVUFOPHEJQa2Yr85tfxv9uFyQdxKaR95mdqj2t4DyZMXVEk6zZrFKk6VIJCWzvycEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhzsKkruFO8N7jzHbLz+vnWlCX/+RK9lInzXcqeIB2s=;
 b=pd/qvDQQNqX5x/lTZT4e9IbB8n78xUX8I9Ss4EHvednUdejRJp6+txmnku3BgNs1cWYGwuLnOY2CHwsima1MqGCL4HanerFwqFDYEAnmYj6VuMY+ZIgsnHBhLIoCZqwUs08XV88yqFLby7BiK7QORFgKTrPgFEiCtYh0wZqDJVPt3q1RhpDQm71wdS+BzCK8Ig1mx/SR9itvd6s/9I+VGywmfSSH9XNV68vFuppimKaozViv06ezXLOAmQoRzLQ8yz14uX2ykriBhHXJBvyN/xQBT2XPBzOu04ikWupqwtXR+ABqti4qASlNBmLr8SnqInr6KTaeP3quURXHNxJ4Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhzsKkruFO8N7jzHbLz+vnWlCX/+RK9lInzXcqeIB2s=;
 b=Nx9PaeRyZiz/BcTCvOgZSDjdHAu84CX8HVfKsLrnAv2H0jxCUQGRsNjU8wBCX0BVoXXNqUlpOOdtAXr05KvQARB2EZEvJ70/mTq53VTIJfX3Z+FM5u7C3JqKk/Nt4MXXkPPaNCBzOUfY0/qL4nVlRUoDnA3LIFfyqs1UpxA3Xit9ex1D2+f/Hk82I4JL59YiditnvzWoU8481RD53zKRdjlC7X0XTF8jVfsLuZv1+wdeOgoRYMMPaQdA8L6+zZbv14Yf7/T86CDnVfZrkRJ4DkaJ8O1haoHzoasCpZrBG7Wb/jFOnIs9MMENPrzwqf12dPBYYPdwZd9ne0BLIY35Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Sun, 20 Apr
 2025 19:32:15 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.033; Sun, 20 Apr 2025
 19:32:15 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] sched_ext: Track currently locked rq
Date: Sun, 20 Apr 2025 21:30:21 +0200
Message-ID: <20250420193106.42533-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420193106.42533-1-arighi@nvidia.com>
References: <20250420193106.42533-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0193.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::23) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 55284484-b546-4758-2be5-08dd80420e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dyZTlsV+2Sc4E2YBA0xm+DMWw+PHYW04YmK8x/DUNQ1Dv+VQM6UFznMVxQm+?=
 =?us-ascii?Q?Fd/Y93tUVWRMyk7pf0KlEDjthEpZrZrsWI3PkXdepMup8WAr2wzzqLAYsSG9?=
 =?us-ascii?Q?Y0G9/TaXNowx942Exl4+Zl/4XiAW7Jwyn+WyE+MFQWH9a7Ce7rh7Pm4IzV1F?=
 =?us-ascii?Q?gng7WsT6iVDALoVu5vllXz6HdKWhoX7ydmz5lhS+ONcSinlfqzbfoDNKPl7F?=
 =?us-ascii?Q?9iaaT8fLhncXIRYAy+8zBqcirjuUk3z4pvFGzwgQkjmFr4vBsVZPEPZvQC3o?=
 =?us-ascii?Q?KYtDLjEdQpcS/IWdD9quh+OAPFF5GKhaqewU3CxlImoc6o4WL4nMZkhI9vFA?=
 =?us-ascii?Q?E6Dc6IJAuWHs8ps82sePXxu3JwfSbg50aJRNL/NvgYBUQB/IaGIiBQX663Q3?=
 =?us-ascii?Q?C5ZHUs2CLT/LPGRzkYVtZ+e0FXYFfbzpFLEFkYtBWJB46ByeHY+VOz4+YzGI?=
 =?us-ascii?Q?CqNAtC9bWc4EQzrLOOptrxOPTTHNrJYNM276tWD4tqmGylxzXV76rWpB+hll?=
 =?us-ascii?Q?6SCS57CSUwbPlH51DE6JGN7uO2LbT57fzvMssqzwZZJG0vrQdHDGZzMvLIi1?=
 =?us-ascii?Q?LPxLzP0Xxpddnya34y8yFVNftRJhc/Z/t6BkJDJLXLTIXoy8Fjrg9jAnRmnw?=
 =?us-ascii?Q?3FX6lEMyNPxWFJ+ISq3ZG23/Awg345YAvXeafF7S023N151wMkfBWDvBzuMq?=
 =?us-ascii?Q?76pcuJ/NGcHrZgSCKvnLc2VM/MmZrpd2Nf6SBsyQ1CAP4dCrw7K9MWhOnGHT?=
 =?us-ascii?Q?V3fP9pQ6LO9+3v2U5O2eh9Anuqk0NQUSbOGtW9MSJfBXaa2I9B76y8tnQaqT?=
 =?us-ascii?Q?BY/zgeKR2UPYNhUJ0gParAJVv26A8x9m4YnEnjBkXxpJLHOIpYDm+RsafO49?=
 =?us-ascii?Q?JN78J0FqYtu+I5xFnhYfXZOdTmaMhykM0AJ+PFWV8HQZjgQE26bldYIr/MBQ?=
 =?us-ascii?Q?8Bwf1/ADnOdsPb1DGsjuSibVGSGHd8q2NWqDNB8bNOpNw2QbstvDKJSys9JL?=
 =?us-ascii?Q?6hz0AjeO3uLVjBIhvlL+i45V/doSjBYNi+hItcfOvcOo2AG/j02NORMrq6e4?=
 =?us-ascii?Q?/ZGtWszNRvEJ3bx8CK7FrJdZJAkXZXE/HFMoUSn56yzCyah6U0JtxsmWhKlc?=
 =?us-ascii?Q?COEylxWVtD0UkmTh6+F+mj8yVu6//WP+pOL/JFVsmsLUh6Ovqg98RYQ7Fw5g?=
 =?us-ascii?Q?ALJormuJ4zEIEAEvIMGD7GzMxKr46PBn9jwT/0jztAbsRF16Ru0YBJClUN2r?=
 =?us-ascii?Q?Z15OyE/Ocj3E/bkKWEfCkWdBWc7Xj7PK9CGklKiFg06ws1ZHrva7stEPNlrq?=
 =?us-ascii?Q?YxEvRYSPk7WmU+BpP/wq9Ne/If/j+UtT75kzARb8ILvCUfWJQj3f0oulY7BC?=
 =?us-ascii?Q?5kAug5GZc+p703YTtm7VAasNG3cTJ6C4N425b99xevhrhAtwqwq29o3rDExH?=
 =?us-ascii?Q?4ogWTxoyaqU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9BI4pbDloh5TpeWvrbAc4iW7eWGGrtKkSnHNFlcXPwpn/ctgDTo2JFYC3PI9?=
 =?us-ascii?Q?yMTYmsILcVtOo9UVvvYMnPwUF7udwW53ZbtcBqnULyxLqWTd7AAB+e7Tj8Mk?=
 =?us-ascii?Q?UjxM7yLfopTpiVCYM9o82So3uc6yHQWiB9V9t0UlgfVpOM3xwIWTbW/kmXiS?=
 =?us-ascii?Q?ynkrcZP/yHmLCrb6IHCcwC9jhTqItOs3GqjbFMwfpzHeOEQorC791NQamwx3?=
 =?us-ascii?Q?Z1SAbC5Z6w0bjp+6RnaT8uomzFFA5qSRLRZjPfXfjhSWjjeAv8pUiGHxWrhJ?=
 =?us-ascii?Q?wMR5L8k1zKvO3s4AAjtCC7MDzn9z/HaE3IqLRN8jC3kpNnZl+NpVSNppM1WZ?=
 =?us-ascii?Q?XGUSqL3O+d/VM3HBLPo5AQxjOFKt8M6Kj0nf6BigA3rdux2fSnAD2dPRKEiF?=
 =?us-ascii?Q?VZS/IQkKFUM9cPro0HCuMK2QecSyrxhQr91X6GcJuKHHII2KHRL/ApZjWcWu?=
 =?us-ascii?Q?iGJrawsHcUeSGdvbpbdUyiP/djRRdz4mQXfMXtjwY7KOS9qG/eltEo6TaDvb?=
 =?us-ascii?Q?db4TdPqQHo6c50/FQrL7M9KKSdEUo6jmmQ8lYRY/1gkviTAjnnBFg652Panz?=
 =?us-ascii?Q?tsXRhMfYzPcJMbkeUJMt2xEydAkRxexfUH7gv1rZ+xEXWDDjBaq+Qk/nri0o?=
 =?us-ascii?Q?+sm+FpKzKQXS/T1zPuEhdYy8NWxIoXJdc/4IIi0yOCvBa/jmy5kOAT+HGiyC?=
 =?us-ascii?Q?g1xbQ0WF7ZygZYMuhZ5ZnH+AHMOBl3KZftRaDvewIMiBbqvDsnp+CG+4JHkK?=
 =?us-ascii?Q?cdvZQMRnKqCERRIaXZdLctfKXmCIsWchjxrUyHHyaUxMeTobnVda8ZMvE0D1?=
 =?us-ascii?Q?lIB6yfP2Krp3wcxhxw9JME5Fv+Oi3JvbB8/EbpTo96r7qNjXa3JH6fTgDP5f?=
 =?us-ascii?Q?uYw9OBLKxsmanSslaHaj0r+u/IaALbyFfWBXdEL/9Dj4m3fnoRcKYAu7+Ocd?=
 =?us-ascii?Q?Pvqh5rX8RPl7FnD2a+0PP/H1l5qXxrOJwqS+HcdXOt5tsnF1l9mJPR8lDbN6?=
 =?us-ascii?Q?/wcQVf49OXKAUKop9TH/MyQ1V/kfbwmjJ/PnZZ42t4SdfD6XBtDyse9Gg/M6?=
 =?us-ascii?Q?OXGc/4fhGXjnjd0ajnt3RqFjk5aDv+K/CMH+Fodsrp08x5MIFE5mfuVX1URy?=
 =?us-ascii?Q?195s8MDxlZKbCNYbXcFFWwTxZx4cpZgBWoNrL9qEVczrdCdTC1AIlTQZLLRq?=
 =?us-ascii?Q?Nx2DVLSBLDPRZTLzSRuO6M6sDU+pDX8ViLg2q1/WKURj4uHCus0o8Fg5NfUq?=
 =?us-ascii?Q?bMUH6weKepRl4TJgefVE3/0huNCVeGoR3jBWsJafhjBeGuXTdz9IM/LF3jwj?=
 =?us-ascii?Q?cHA9ea3/Raz2EXo7VBCb45Bne+/vwTTJtiWacDJZ5DhDDTl9yYOVJrsYaM1u?=
 =?us-ascii?Q?6yh7XGXzcnth5NkWvn7AsshWFWlNAqQwROn3Prb7RwibNXTQq2/Y6oq6tmDf?=
 =?us-ascii?Q?pQ6+JblUEKicjTjQFBYHsPKKdoAHg3fFr9ViDNAdef/konqOXEyCNDKXpalE?=
 =?us-ascii?Q?wVmai5wly617kqv5Koxo8I60T/lkC+3GidcQo3oiUXxa4Lb+p2sdk/nhZa3a?=
 =?us-ascii?Q?0x66kP2F5exmeS5P0OLNqGNcj8RQrOM9WKfjs0l/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55284484-b546-4758-2be5-08dd80420e40
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 19:32:15.3800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +heVIsph3mhDMthadY2aVP4g+LFCFCV7B0evB99+WJ802IDPJOCPF1WG44YJ6F5D/kTLrgDSTm47g2aTQ2YNeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926

Some kfuncs provided by sched_ext may need to operate on a struct rq,
but they can be invoked from various contexts, specifically, different
scx callbacks.

While some of these callbacks are invoked with a particular rq already
locked, others are not. This makes it impossible for a kfunc to reliably
determine whether it's safe to access a given rq, triggering potential
bugs or unsafe behaviors, see for example [1].

To address this, track the currently locked rq whenever a sched_ext
callback is invoked via SCX_CALL_OP*().

This allows kfuncs that need to operate on an arbitrary rq to retrieve
the currently locked one and apply the appropriate action as needed.

[1] https://lore.kernel.org/lkml/20250325140021.73570-1-arighi@nvidia.com/

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c      | 136 +++++++++++++++++++++++++---------------
 kernel/sched/ext_idle.c |   2 +-
 2 files changed, 87 insertions(+), 51 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index bb0873411d798..51dad94f1952d 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1116,8 +1116,38 @@ static void scx_kf_disallow(u32 mask)
 	current->scx.kf_mask &= ~mask;
 }
 
-#define SCX_CALL_OP(mask, op, args...)						\
+/*
+ * Track the rq currently locked.
+ *
+ * This allows kfuncs to safely operate on rq from any scx ops callback,
+ * knowing which rq is already locked.
+ */
+static DEFINE_PER_CPU(struct rq *, locked_rq);
+
+static inline void update_locked_rq(struct rq *rq)
+{
+	/*
+	 * Check whether @rq is actually locked. This can help expose bugs
+	 * or incorrect assumptions about the context in which a kfunc or
+	 * callback is executed.
+	 */
+	if (rq)
+		lockdep_assert_rq_held(rq);
+	__this_cpu_write(locked_rq, rq);
+}
+
+/*
+ * Return the rq currently locked from an scx callback, or NULL if no rq is
+ * locked.
+ */
+static inline struct rq *scx_locked_rq(void)
+{
+	return __this_cpu_read(locked_rq);
+}
+
+#define SCX_CALL_OP(mask, rq, op, args...)					\
 do {										\
+	update_locked_rq(rq);							\
 	if (mask) {								\
 		scx_kf_allow(mask);						\
 		scx_ops.op(args);						\
@@ -1125,11 +1155,15 @@ do {										\
 	} else {								\
 		scx_ops.op(args);						\
 	}									\
+	if (rq)									\
+		update_locked_rq(NULL);						\
 } while (0)
 
-#define SCX_CALL_OP_RET(mask, op, args...)					\
+#define SCX_CALL_OP_RET(mask, rq, op, args...)					\
 ({										\
 	__typeof__(scx_ops.op(args)) __ret;					\
+										\
+	update_locked_rq(rq);							\
 	if (mask) {								\
 		scx_kf_allow(mask);						\
 		__ret = scx_ops.op(args);					\
@@ -1137,6 +1171,8 @@ do {										\
 	} else {								\
 		__ret = scx_ops.op(args);					\
 	}									\
+	if (rq)									\
+		update_locked_rq(NULL);						\
 	__ret;									\
 })
 
@@ -1151,31 +1187,31 @@ do {										\
  * scx_kf_allowed_on_arg_tasks() to test whether the invocation is allowed on
  * the specific task.
  */
-#define SCX_CALL_OP_TASK(mask, op, task, args...)				\
+#define SCX_CALL_OP_TASK(mask, rq, op, task, args...)				\
 do {										\
 	BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
 	current->scx.kf_tasks[0] = task;					\
-	SCX_CALL_OP(mask, op, task, ##args);					\
+	SCX_CALL_OP(mask, rq, op, task, ##args);				\
 	current->scx.kf_tasks[0] = NULL;					\
 } while (0)
 
-#define SCX_CALL_OP_TASK_RET(mask, op, task, args...)				\
+#define SCX_CALL_OP_TASK_RET(mask, rq, op, task, args...)			\
 ({										\
 	__typeof__(scx_ops.op(task, ##args)) __ret;				\
 	BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
 	current->scx.kf_tasks[0] = task;					\
-	__ret = SCX_CALL_OP_RET(mask, op, task, ##args);			\
+	__ret = SCX_CALL_OP_RET(mask, rq, op, task, ##args);			\
 	current->scx.kf_tasks[0] = NULL;					\
 	__ret;									\
 })
 
-#define SCX_CALL_OP_2TASKS_RET(mask, op, task0, task1, args...)			\
+#define SCX_CALL_OP_2TASKS_RET(mask, rq, op, task0, task1, args...)		\
 ({										\
 	__typeof__(scx_ops.op(task0, task1, ##args)) __ret;			\
 	BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
 	current->scx.kf_tasks[0] = task0;					\
 	current->scx.kf_tasks[1] = task1;					\
-	__ret = SCX_CALL_OP_RET(mask, op, task0, task1, ##args);		\
+	__ret = SCX_CALL_OP_RET(mask, rq, op, task0, task1, ##args);		\
 	current->scx.kf_tasks[0] = NULL;					\
 	current->scx.kf_tasks[1] = NULL;					\
 	__ret;									\
@@ -2174,7 +2210,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 	WARN_ON_ONCE(*ddsp_taskp);
 	*ddsp_taskp = p;
 
-	SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, enqueue, p, enq_flags);
+	SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, rq, enqueue, p, enq_flags);
 
 	*ddsp_taskp = NULL;
 	if (p->scx.ddsp_dsq_id != SCX_DSQ_INVALID)
@@ -2269,7 +2305,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 	add_nr_running(rq, 1);
 
 	if (SCX_HAS_OP(runnable) && !task_on_rq_migrating(p))
-		SCX_CALL_OP_TASK(SCX_KF_REST, runnable, p, enq_flags);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, runnable, p, enq_flags);
 
 	if (enq_flags & SCX_ENQ_WAKEUP)
 		touch_core_sched(rq, p);
@@ -2283,7 +2319,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 		__scx_add_event(SCX_EV_SELECT_CPU_FALLBACK, 1);
 }
 
-static void ops_dequeue(struct task_struct *p, u64 deq_flags)
+static void ops_dequeue(struct rq *rq, struct task_struct *p, u64 deq_flags)
 {
 	unsigned long opss;
 
@@ -2304,7 +2340,7 @@ static void ops_dequeue(struct task_struct *p, u64 deq_flags)
 		BUG();
 	case SCX_OPSS_QUEUED:
 		if (SCX_HAS_OP(dequeue))
-			SCX_CALL_OP_TASK(SCX_KF_REST, dequeue, p, deq_flags);
+			SCX_CALL_OP_TASK(SCX_KF_REST, rq, dequeue, p, deq_flags);
 
 		if (atomic_long_try_cmpxchg(&p->scx.ops_state, &opss,
 					    SCX_OPSS_NONE))
@@ -2337,7 +2373,7 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags
 		return true;
 	}
 
-	ops_dequeue(p, deq_flags);
+	ops_dequeue(rq, p, deq_flags);
 
 	/*
 	 * A currently running task which is going off @rq first gets dequeued
@@ -2353,11 +2389,11 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags
 	 */
 	if (SCX_HAS_OP(stopping) && task_current(rq, p)) {
 		update_curr_scx(rq);
-		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, p, false);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, stopping, p, false);
 	}
 
 	if (SCX_HAS_OP(quiescent) && !task_on_rq_migrating(p))
-		SCX_CALL_OP_TASK(SCX_KF_REST, quiescent, p, deq_flags);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, quiescent, p, deq_flags);
 
 	if (deq_flags & SCX_DEQ_SLEEP)
 		p->scx.flags |= SCX_TASK_DEQD_FOR_SLEEP;
@@ -2377,7 +2413,7 @@ static void yield_task_scx(struct rq *rq)
 	struct task_struct *p = rq->curr;
 
 	if (SCX_HAS_OP(yield))
-		SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, p, NULL);
+		SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, rq, yield, p, NULL);
 	else
 		p->scx.slice = 0;
 }
@@ -2387,7 +2423,7 @@ static bool yield_to_task_scx(struct rq *rq, struct task_struct *to)
 	struct task_struct *from = rq->curr;
 
 	if (SCX_HAS_OP(yield))
-		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, from, to);
+		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, rq, yield, from, to);
 	else
 		return false;
 }
@@ -2945,7 +2981,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 		 * emitted in switch_class().
 		 */
 		if (SCX_HAS_OP(cpu_acquire))
-			SCX_CALL_OP(SCX_KF_REST, cpu_acquire, cpu_of(rq), NULL);
+			SCX_CALL_OP(SCX_KF_REST, rq, cpu_acquire, cpu_of(rq), NULL);
 		rq->scx.cpu_released = false;
 	}
 
@@ -2990,7 +3026,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	do {
 		dspc->nr_tasks = 0;
 
-		SCX_CALL_OP(SCX_KF_DISPATCH, dispatch, cpu_of(rq),
+		SCX_CALL_OP(SCX_KF_DISPATCH, rq, dispatch, cpu_of(rq),
 			    prev_on_scx ? prev : NULL);
 
 		flush_dispatch_buf(rq);
@@ -3104,7 +3140,7 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
 		 * Core-sched might decide to execute @p before it is
 		 * dispatched. Call ops_dequeue() to notify the BPF scheduler.
 		 */
-		ops_dequeue(p, SCX_DEQ_CORE_SCHED_EXEC);
+		ops_dequeue(rq, p, SCX_DEQ_CORE_SCHED_EXEC);
 		dispatch_dequeue(rq, p);
 	}
 
@@ -3112,7 +3148,7 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
 	if (SCX_HAS_OP(running) && (p->scx.flags & SCX_TASK_QUEUED))
-		SCX_CALL_OP_TASK(SCX_KF_REST, running, p);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, running, p);
 
 	clr_task_runnable(p, true);
 
@@ -3194,7 +3230,7 @@ static void switch_class(struct rq *rq, struct task_struct *next)
 			};
 
 			SCX_CALL_OP(SCX_KF_CPU_RELEASE,
-				    cpu_release, cpu_of(rq), &args);
+				    rq, cpu_release, cpu_of(rq), &args);
 		}
 		rq->scx.cpu_released = true;
 	}
@@ -3207,7 +3243,7 @@ static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
 	if (SCX_HAS_OP(stopping) && (p->scx.flags & SCX_TASK_QUEUED))
-		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, p, true);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, stopping, p, true);
 
 	if (p->scx.flags & SCX_TASK_QUEUED) {
 		set_task_runnable(rq, p);
@@ -3345,7 +3381,7 @@ bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 	 * verifier.
 	 */
 	if (SCX_HAS_OP(core_sched_before) && !scx_rq_bypassing(task_rq(a)))
-		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, core_sched_before,
+		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, NULL, core_sched_before,
 					      (struct task_struct *)a,
 					      (struct task_struct *)b);
 	else
@@ -3381,7 +3417,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 		WARN_ON_ONCE(*ddsp_taskp);
 		*ddsp_taskp = p;
 
-		cpu = SCX_CALL_OP_TASK_RET(SCX_KF_ENQUEUE | SCX_KF_SELECT_CPU,
+		cpu = SCX_CALL_OP_TASK_RET(SCX_KF_ENQUEUE | SCX_KF_SELECT_CPU, NULL,
 					   select_cpu, p, prev_cpu, wake_flags);
 		p->scx.selected_cpu = cpu;
 		*ddsp_taskp = NULL;
@@ -3426,7 +3462,7 @@ static void set_cpus_allowed_scx(struct task_struct *p,
 	 * designation pointless. Cast it away when calling the operation.
 	 */
 	if (SCX_HAS_OP(set_cpumask))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, p,
+		SCX_CALL_OP_TASK(SCX_KF_REST, NULL, set_cpumask, p,
 				 (struct cpumask *)p->cpus_ptr);
 }
 
@@ -3440,9 +3476,9 @@ static void handle_hotplug(struct rq *rq, bool online)
 		scx_idle_update_selcpu_topology(&scx_ops);
 
 	if (online && SCX_HAS_OP(cpu_online))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, cpu);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, rq, cpu_online, cpu);
 	else if (!online && SCX_HAS_OP(cpu_offline))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, cpu);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, rq, cpu_offline, cpu);
 	else
 		scx_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
 			 "cpu %d going %s, exiting scheduler", cpu,
@@ -3545,7 +3581,7 @@ static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
 		curr->scx.slice = 0;
 		touch_core_sched(rq, curr);
 	} else if (SCX_HAS_OP(tick)) {
-		SCX_CALL_OP_TASK(SCX_KF_REST, tick, curr);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, tick, curr);
 	}
 
 	if (!curr->scx.slice)
@@ -3622,7 +3658,7 @@ static int scx_init_task(struct task_struct *p, struct task_group *tg, bool fork
 			.fork = fork,
 		};
 
-		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init_task, p, &args);
+		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, NULL, init_task, p, &args);
 		if (unlikely(ret)) {
 			ret = ops_sanitize_err("init_task", ret);
 			return ret;
@@ -3679,11 +3715,11 @@ static void scx_enable_task(struct task_struct *p)
 	p->scx.weight = sched_weight_to_cgroup(weight);
 
 	if (SCX_HAS_OP(enable))
-		SCX_CALL_OP_TASK(SCX_KF_REST, enable, p);
+		SCX_CALL_OP_TASK(SCX_KF_REST, task_rq(p), enable, p);
 	scx_set_task_state(p, SCX_TASK_ENABLED);
 
 	if (SCX_HAS_OP(set_weight))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, p, p->scx.weight);
+		SCX_CALL_OP_TASK(SCX_KF_REST, task_rq(p), set_weight, p, p->scx.weight);
 }
 
 static void scx_disable_task(struct task_struct *p)
@@ -3692,7 +3728,7 @@ static void scx_disable_task(struct task_struct *p)
 	WARN_ON_ONCE(scx_get_task_state(p) != SCX_TASK_ENABLED);
 
 	if (SCX_HAS_OP(disable))
-		SCX_CALL_OP_TASK(SCX_KF_REST, disable, p);
+		SCX_CALL_OP_TASK(SCX_KF_REST, task_rq(p), disable, p);
 	scx_set_task_state(p, SCX_TASK_READY);
 }
 
@@ -3721,7 +3757,7 @@ static void scx_exit_task(struct task_struct *p)
 	}
 
 	if (SCX_HAS_OP(exit_task))
-		SCX_CALL_OP_TASK(SCX_KF_REST, exit_task, p, &args);
+		SCX_CALL_OP_TASK(SCX_KF_REST, task_rq(p), exit_task, p, &args);
 	scx_set_task_state(p, SCX_TASK_NONE);
 }
 
@@ -3830,7 +3866,7 @@ static void reweight_task_scx(struct rq *rq, struct task_struct *p,
 
 	p->scx.weight = sched_weight_to_cgroup(scale_load_down(lw->weight));
 	if (SCX_HAS_OP(set_weight))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, p, p->scx.weight);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, set_weight, p, p->scx.weight);
 }
 
 static void prio_changed_scx(struct rq *rq, struct task_struct *p, int oldprio)
@@ -3846,7 +3882,7 @@ static void switching_to_scx(struct rq *rq, struct task_struct *p)
 	 * different scheduler class. Keep the BPF scheduler up-to-date.
 	 */
 	if (SCX_HAS_OP(set_cpumask))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, p,
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, set_cpumask, p,
 				 (struct cpumask *)p->cpus_ptr);
 }
 
@@ -3908,7 +3944,7 @@ int scx_tg_online(struct task_group *tg)
 			struct scx_cgroup_init_args args =
 				{ .weight = tg->scx_weight };
 
-			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init,
+			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, NULL, cgroup_init,
 					      tg->css.cgroup, &args);
 			if (ret)
 				ret = ops_sanitize_err("cgroup_init", ret);
@@ -3930,7 +3966,7 @@ void scx_tg_offline(struct task_group *tg)
 	percpu_down_read(&scx_cgroup_rwsem);
 
 	if (SCX_HAS_OP(cgroup_exit) && (tg->scx_flags & SCX_TG_INITED))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, tg->css.cgroup);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, cgroup_exit, tg->css.cgroup);
 	tg->scx_flags &= ~(SCX_TG_ONLINE | SCX_TG_INITED);
 
 	percpu_up_read(&scx_cgroup_rwsem);
@@ -3963,7 +3999,7 @@ int scx_cgroup_can_attach(struct cgroup_taskset *tset)
 			continue;
 
 		if (SCX_HAS_OP(cgroup_prep_move)) {
-			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_prep_move,
+			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, NULL, cgroup_prep_move,
 					      p, from, css->cgroup);
 			if (ret)
 				goto err;
@@ -3977,7 +4013,7 @@ int scx_cgroup_can_attach(struct cgroup_taskset *tset)
 err:
 	cgroup_taskset_for_each(p, css, tset) {
 		if (SCX_HAS_OP(cgroup_cancel_move) && p->scx.cgrp_moving_from)
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, p,
+			SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, cgroup_cancel_move, p,
 				    p->scx.cgrp_moving_from, css->cgroup);
 		p->scx.cgrp_moving_from = NULL;
 	}
@@ -3996,7 +4032,7 @@ void scx_cgroup_move_task(struct task_struct *p)
 	 * cgrp_moving_from set.
 	 */
 	if (SCX_HAS_OP(cgroup_move) && !WARN_ON_ONCE(!p->scx.cgrp_moving_from))
-		SCX_CALL_OP_TASK(SCX_KF_UNLOCKED, cgroup_move, p,
+		SCX_CALL_OP_TASK(SCX_KF_UNLOCKED, NULL, cgroup_move, p,
 			p->scx.cgrp_moving_from, tg_cgrp(task_group(p)));
 	p->scx.cgrp_moving_from = NULL;
 }
@@ -4016,7 +4052,7 @@ void scx_cgroup_cancel_attach(struct cgroup_taskset *tset)
 
 	cgroup_taskset_for_each(p, css, tset) {
 		if (SCX_HAS_OP(cgroup_cancel_move) && p->scx.cgrp_moving_from)
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, p,
+			SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, cgroup_cancel_move, p,
 				    p->scx.cgrp_moving_from, css->cgroup);
 		p->scx.cgrp_moving_from = NULL;
 	}
@@ -4030,7 +4066,7 @@ void scx_group_set_weight(struct task_group *tg, unsigned long weight)
 
 	if (scx_cgroup_enabled && tg->scx_weight != weight) {
 		if (SCX_HAS_OP(cgroup_set_weight))
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_set_weight,
+			SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, cgroup_set_weight,
 				    tg_cgrp(tg), weight);
 		tg->scx_weight = weight;
 	}
@@ -4219,7 +4255,7 @@ static void scx_cgroup_exit(void)
 			continue;
 		rcu_read_unlock();
 
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, css->cgroup);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, cgroup_exit, css->cgroup);
 
 		rcu_read_lock();
 		css_put(css);
@@ -4256,7 +4292,7 @@ static int scx_cgroup_init(void)
 			continue;
 		rcu_read_unlock();
 
-		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init,
+		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, NULL, cgroup_init,
 				      css->cgroup, &args);
 		if (ret) {
 			css_put(css);
@@ -4749,7 +4785,7 @@ static void scx_disable_workfn(struct kthread_work *work)
 	}
 
 	if (scx_ops.exit)
-		SCX_CALL_OP(SCX_KF_UNLOCKED, exit, ei);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, exit, ei);
 
 	cancel_delayed_work_sync(&scx_watchdog_work);
 
@@ -4955,7 +4991,7 @@ static void scx_dump_task(struct seq_buf *s, struct scx_dump_ctx *dctx,
 
 	if (SCX_HAS_OP(dump_task)) {
 		ops_dump_init(s, "    ");
-		SCX_CALL_OP(SCX_KF_REST, dump_task, dctx, p);
+		SCX_CALL_OP(SCX_KF_REST, NULL, dump_task, dctx, p);
 		ops_dump_exit();
 	}
 
@@ -5002,7 +5038,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 
 	if (SCX_HAS_OP(dump)) {
 		ops_dump_init(&s, "");
-		SCX_CALL_OP(SCX_KF_UNLOCKED, dump, &dctx);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, dump, &dctx);
 		ops_dump_exit();
 	}
 
@@ -5059,7 +5095,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 		used = seq_buf_used(&ns);
 		if (SCX_HAS_OP(dump_cpu)) {
 			ops_dump_init(&ns, "  ");
-			SCX_CALL_OP(SCX_KF_REST, dump_cpu, &dctx, cpu, idle);
+			SCX_CALL_OP(SCX_KF_REST, NULL, dump_cpu, &dctx, cpu, idle);
 			ops_dump_exit();
 		}
 
@@ -5315,7 +5351,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	scx_idle_enable(ops);
 
 	if (scx_ops.init) {
-		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init);
+		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, NULL, init);
 		if (ret) {
 			ret = ops_sanitize_err("init", ret);
 			cpus_read_unlock();
diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 023ae6df5e8ca..9213989e72b4e 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -745,7 +745,7 @@ void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
 	 * managed by put_prev_task_idle()/set_next_task_idle().
 	 */
 	if (SCX_HAS_OP(update_idle) && do_notify && !scx_rq_bypassing(rq))
-		SCX_CALL_OP(SCX_KF_REST, update_idle, cpu_of(rq), idle);
+		SCX_CALL_OP(SCX_KF_REST, rq, update_idle, cpu_of(rq), idle);
 
 	/*
 	 * Update the idle masks:
-- 
2.49.0

