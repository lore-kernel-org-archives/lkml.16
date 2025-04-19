Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062.outbound.protection.outlook.com [40.107.96.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D85EA47
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 12:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745066168; cv=fail; b=EeSlH/5LpEMFbrB2EhpBQqiye8MwKV32IpteIHnRW0qnB/YLeOZzfZ04iv+CmDmHvq84nzprnsO8K2r/NmNmvs6Y5yDImR13TPA5vRPyP8dVQXdFu2UVw8S0cyX2Png+k2v1oDn+IBpIGbtaFR7PZ+XgneJ+PmtW44PqNsCBV0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745066168; c=relaxed/simple;
	bh=be/08uDN/9Pu7UuRE9wXR+zhF/27U6YRne2L2eRG8zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JvBGuUYFRtQ4Gk9jA2itxhLGx16NspxUl3+kCoS3WlgBdi+4PDZjsZP00DYoBg3/AlPIysr0dcAFT1Xa1IxgZZVUp2RSXUIEw7BANYQNMNkaE7PZA24IKnSuFgmEEsDgVGZb5mFlFncYnPLmaf1co98MuN6keLs7GS7aH+Q8EqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OqF0Vf+9; arc=fail smtp.client-ip=40.107.96.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OqF0Vf+9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0Pp4lEynVzgylgwBgC70YwUqcVP2es5p9LdB5hiHbzyutBg5q+sF9Auurk7A7AiPFx6PZxDK0B5bjbW7ZbxjU+ujc7Z0FimF8fnjWM6YZrdaK4Mbq/IwppB7Ga/QH5YFGnU6HQHCaixYmM+ms6PZPnhJS7e4x1mazBvstu8k1YTsgsQI9e5ctwNtn4ivqdIVtSIMxz51sCiUG5tsJAGzWuFyOkaTvl0bHvG76cDmRaZE/DVqBL9BYtq6Gk16eM/ambk6Pe+3uRTDhF5kZNRqWAnpBT7ArbNAcb6wCMcAsN/yQ6oBVHEsswvrvYxPrzzp3ty/+mqhxNx22Etw13AcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fey06P5y6QfOsrXZhwojfm+gVOMpfTrACGBFiP//Sm0=;
 b=UjqPRou1wd26hQQFW0fcL1vUNi9o38b7r32JDCY/AHC1kFsGZhepjrNSY7af+tQq5+MfMcLKL3tmCUiAgO2ZjLBD2B4Yd0N1cxVW9d3PCeBX3bX8pwX7Ums2BMsOUyNNRpQETwV9DCVQ4uKBt+RWSCwJTFaRoXDdEAbBBNs1rhR5Ge11a2IwNFff724TU0NmRTcfs9KrCdpdwlqD7WqW2V3G+rNYY7b7LlCHtigYvoKORfD4QxsX7+j3PE0kRKaLslu0uoEIllqYINNu7XMazl3dJA3OUyC3c3mxMc0Jnc4V1pS6bBCFoKqzia+WJNAxeztk0pxF64ZH9dXXDki0IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fey06P5y6QfOsrXZhwojfm+gVOMpfTrACGBFiP//Sm0=;
 b=OqF0Vf+9L7Z00QUwC12dn/XdDwNrvjUq9JtNr8kXOnYdGtsLjKhKRTWfXrRIBE2aDqfC45V6KwPVSnUErtM1kGeTbgXz3dBlAlBMzZ1Wf+JgRLfEj1JNTAzRXQL8NCupFP2bDHSd8wji4Ihu83RV/Mbj00Z2ypx85DXCkuILMM2+5Kjd3GRfraUhra6H8qjpwcfNr/oIep5Uxdb2E5EDBgop0Q9mT/Pe+yP6eW3or0tdlBVTWPdphIM8GPg/BXoaFduozKaTcOualmowtfSWz7BndW5P9PDki5qyAjUu9YGRioSVIp4f2btuhkYBwE33fhx4P7BHAnvGWnKoThz3fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DS7PR12MB8083.namprd12.prod.outlook.com (2603:10b6:8:e4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Sat, 19 Apr
 2025 12:36:00 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.022; Sat, 19 Apr 2025
 12:36:00 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] sched_ext: Track currently locked rq
Date: Sat, 19 Apr 2025 14:24:30 +0200
Message-ID: <20250419123536.154469-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250419123536.154469-1-arighi@nvidia.com>
References: <20250419123536.154469-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0031.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::7) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DS7PR12MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cd6a92e-d96f-43c2-5c96-08dd7f3ebdec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7wOPkWEV6LSHh9j0SacPqYm8rCeLnZbLx4Jqpxda6lCxoVK4e0OeXIiUUy6u?=
 =?us-ascii?Q?tCDUTuUWLwAlgvHKmV2jWZMRwyyYQ33pzQ8LbqWhHMiI0OnBrzb/1VLB+lDm?=
 =?us-ascii?Q?Y+o13pt9rQppUbWETlWHTr3R3dx5VLE4VwTe1msV+KSmY5Phq1fV/LBnf31C?=
 =?us-ascii?Q?eEqcoacP/aAq/Vztwh5mUTuND2JCLNChfjQZKf1ceK6oyuN0Mr3+JCT0eKPZ?=
 =?us-ascii?Q?jsrW407QMB4MtfIXs2kZkanvGuz680ShFdqtt2tnN+SNY485lNALlwG8tIqY?=
 =?us-ascii?Q?jDAkYmzklnJ9Z7gsODmgISzq9Nu+3O2sFVeGwR/LdhNKCbawNI81H7YCrgua?=
 =?us-ascii?Q?1+0KD/kwVv1u05KJV1bij5E+/8JKKqrWEvOIgwTpYjrcyQR8JY47inz4icJ/?=
 =?us-ascii?Q?Siejbk5XGMuNbVfGVZHenR4K+PabezZjEwZli7zRZj/8aQOAtp4NtTkExG4p?=
 =?us-ascii?Q?TMH3JFoTD4FIYrILuhJY5bBMF0DSjkfoLr6KaU1PNj04k3a1T5iVQ3pxGpbv?=
 =?us-ascii?Q?cZ+EFLAuk5JbNRIc2U+ie50ABjqDc/MRxV3y/3SvzdfBfkCjJtOIdcPM0yS+?=
 =?us-ascii?Q?vEzxXUDzuOtecXchQWOeEJnHTqOS+91vJtOpzNgTlKc/REwYFtDEIPCG0LFf?=
 =?us-ascii?Q?4/4oEganBxhDyFL16qw6r1OWa/ab92ySSgM7JWe+mFA3rDAOCeq480NYCSWB?=
 =?us-ascii?Q?+6Ozt99HI6tDsMpjVhrE9NkjXsUILtLLrjGwKsjIT6dhTGQiMcCJnIxhrqSS?=
 =?us-ascii?Q?x/2hjGleWHHFKRW2YG2Xevf149vYZkLM4eQxblDx5N0qxCsVUr6FDFoom/gL?=
 =?us-ascii?Q?M7hvjoDC6fNOrNe2wABFWIHTHRWE9utqYK51sh3EyAwyLIf7UAwwnZtThn3h?=
 =?us-ascii?Q?DnYVrP7MlEsH+cKZow052wazrJ79dD9kH400ALPmkNiJ0A2Bobsagr+kYxMD?=
 =?us-ascii?Q?5vvgIovrqiKXbGKGNuJm2X7sOZVUXay09lV2b2Ed++mdiXdfNnYmFu3zTTIR?=
 =?us-ascii?Q?H4KmSSoB1gRjKko540vwfv7sVRjp+kb0ON2N7R/VjW1oEcDUNVplpH81349S?=
 =?us-ascii?Q?NBmLKgQw5sJBukomRc9ebxLonLKm6TpM2J6UeHPuuJW4ID0+jxrS1M6sCvIE?=
 =?us-ascii?Q?X9JKAnpQ33DzU6t72RAp0UTYtgRtX5TF+C5uLzVlA3gOdzgP6acm8COEoRoQ?=
 =?us-ascii?Q?A0ZlWuGf10ntihTVv4T6O10I/su0h0KDks0m34VrndeT2e+tdlMPoFv28r9u?=
 =?us-ascii?Q?YXNH4eHVCgQTnosHJhrlujj6S7Bf8HEFnOog2Wb5WSfg4Opj33frn0vI15FX?=
 =?us-ascii?Q?zLGYxLBkSfCOwHahoPczFF2FETNtVKWnNSyJKBvEzhEoc1eKCr/3ia+P2dup?=
 =?us-ascii?Q?LBNtFyI00ZOvcJqIYWPatqQDWFrXYMfnIwfT+8QUlSUzCb8yut6B0GemWWHH?=
 =?us-ascii?Q?aktg+RvXSQI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J+H14fxFlWOfQDY0s6zh+BGvOzgvYvKeML1ueAJWSQpBjemJiGMh2+G0UBNp?=
 =?us-ascii?Q?vZu2bkVYG8ylcpoeRiGtC9SqUpcH6s4bYs16TCE7bjCXHRHkCjvoiOoijjEx?=
 =?us-ascii?Q?DO7fQdb2eMVkdjZTYNNTQOCjkJubLhKYdGLf9siJWP80z3rPu1RKGHVRPFvV?=
 =?us-ascii?Q?IoQ/LLfhXHX1SqTySirTFq/WOJKmp97oHzrRKoeZ1f0XMZOR1P2EWPaF6lt7?=
 =?us-ascii?Q?079w9wLP8/IMDiDwXIN4HrbguZOY7v4J5JI2/4Mry8Pclm3/MF2X08LUYDzN?=
 =?us-ascii?Q?cJrOFjarWnfOm61QzNCg35eCquvb9Hn8C09TIHN88CmPP8tAAADI8K8U6PM5?=
 =?us-ascii?Q?cHrXw8g1bzd40JyzvARajEkJKKX70PrdU9cb9N95eiBRbMuDvQkM/YvZJwHO?=
 =?us-ascii?Q?0PzIGAv7iH9colexSO4CvEfQGmxV86HEvYIELeIEBw36JfuqU0fUHZGoGkqy?=
 =?us-ascii?Q?e9Mdhw5lMBDY+ZPfI2k0d/3Jw7w4ePreJ8nfk16ZBQ5uGSg6CNvovjIIlFfZ?=
 =?us-ascii?Q?yxE+oNF/otc36eZW57PuWnvxk3C9m6PNQB0zewUA+n6dBtnOQ9dCOtJbVPST?=
 =?us-ascii?Q?Q0+dCpW7h9NoiQK9y4dycuxUWjYyFc6q7nDQIK22ofbzKDbuilMIBv6QxYTl?=
 =?us-ascii?Q?+3A+GBC+mNqXu1hiiVI+OUu7Gc9Ton8dOAf6bdw4rFsV5GSqB96iLZfc4z4p?=
 =?us-ascii?Q?tW0GhcFnPH7SgX851poCo7dhhLqz02WqU8AdUVI7ziBpkTHLj9QqFqVBy1Zo?=
 =?us-ascii?Q?j06OLG2RMySqYGC9+E77MZNd0bY2aqzjnY14UclK1h434g+6ytvwwP1mwzjx?=
 =?us-ascii?Q?nLryk04k6HS/a/XEpXgrvX/oRZ7hm4a9j73fi7rc7rfG32UvgMunBARfMNrs?=
 =?us-ascii?Q?0u36XPgp2UlwgppDIiG27HBonGjLDrmQVY6FEC7t8APsA8EClxl0RTECs5Z4?=
 =?us-ascii?Q?4DhjJN2yT0zDHNE7UQzYCnCJgJARMJvtJs53Q7DROOVtwIpgWcWQ/vmrH+Ng?=
 =?us-ascii?Q?45/oBBAIfKmRtPJMhyUEOG9omW6RDfCI1suUcywVQMmNKuoorPszVez1mDuB?=
 =?us-ascii?Q?yXRoOEym3KtpG1eXsw8Rb4ukQ5u5ixTlrzeAW7QJtL28oGecEMGO3dAxJTeR?=
 =?us-ascii?Q?PeFOSK5w1anCVGJMDN3vHwidZTDvFcN8TUNvggdRQ7esyU7zOO+ZfM/9h1EO?=
 =?us-ascii?Q?6FVR06Mds0AyISEg1biPMpZjy1LwW5+x8xgfRjbzhk0inw5WxIxEG/MTLr3j?=
 =?us-ascii?Q?DMnEaB0UZFIuNNOSrv9aKxfRzJHrQGY+BOJlhWWckLB3WJQa5QcCw+DSNq6F?=
 =?us-ascii?Q?KaSKWm8lbOjgqlE8+qupe2G0vcgMUEBTLJgRV7fM9d0HcVki96xmv9Butf3/?=
 =?us-ascii?Q?XrYLboDRXfpzJv8QdvhiWBTVf4PYdilxcSA5VwH9KnZS2KhhiJOR08CG4c5j?=
 =?us-ascii?Q?X5U52clXdig+uLTHlFEhsbnTzqqfOJ4PlD6ffIMLEbHsQQxLBAT4qD2jeelD?=
 =?us-ascii?Q?IpAQ/mxBm2h+B52dFB0y+VmTsORXKnz7DzCof63zrqyBi2IJ4CBG7PVsNQ0s?=
 =?us-ascii?Q?gT3XxhDfBYvEviKy5gkI/d0Fv0bpl8o6jemi+JK2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd6a92e-d96f-43c2-5c96-08dd7f3ebdec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2025 12:36:00.8649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dts/CdFUXrCO+U9QuGxomUYLXgX5bZZsBp/yjmgW5SBwo0PGxTAFj/23PlGSRoIRhFprHhzT1iAUPKA2XC3Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8083

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
 include/linux/sched/ext.h |   1 +
 kernel/sched/ext.c        | 126 +++++++++++++++++++++++---------------
 kernel/sched/ext_idle.c   |   2 +-
 3 files changed, 78 insertions(+), 51 deletions(-)

diff --git a/include/linux/sched/ext.h b/include/linux/sched/ext.h
index f7545430a5482..9de57f2a284fd 100644
--- a/include/linux/sched/ext.h
+++ b/include/linux/sched/ext.h
@@ -149,6 +149,7 @@ struct sched_ext_entity {
 	s32			selected_cpu;
 	u32			kf_mask;	/* see scx_kf_mask above */
 	struct task_struct	*kf_tasks[2];	/* see SCX_CALL_OP_TASK() */
+	struct rq		*locked_rq;	/* currently locked rq */
 	atomic_long_t		ops_state;
 
 	struct list_head	runnable_node;	/* rq->scx.runnable_list */
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index bb0873411d798..a14a5c3bc38ac 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1116,8 +1116,32 @@ static void scx_kf_disallow(u32 mask)
 	current->scx.kf_mask &= ~mask;
 }
 
-#define SCX_CALL_OP(mask, op, args...)						\
+static inline void update_locked_rq(struct rq *rq)
+{
+	/*
+	 * Check whether @rq is actually locked. This can help expose bugs
+	 * or incorrect assumptions about the context in which a kfunc or
+	 * callback is executed.
+	 */
+	if (rq)
+		lockdep_assert_rq_held(rq);
+	current->scx.locked_rq = rq;
+	barrier();
+}
+
+/*
+ * Return the rq currently locked from an scx callback, or NULL if no rq is
+ * locked.
+ */
+static inline struct rq *scx_locked_rq(void)
+{
+	barrier();
+	return current->scx.locked_rq;
+}
+
+#define SCX_CALL_OP(mask, rq, op, args...)					\
 do {										\
+	update_locked_rq(rq);							\
 	if (mask) {								\
 		scx_kf_allow(mask);						\
 		scx_ops.op(args);						\
@@ -1127,9 +1151,11 @@ do {										\
 	}									\
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
@@ -1151,31 +1177,31 @@ do {										\
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
@@ -2174,7 +2200,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 	WARN_ON_ONCE(*ddsp_taskp);
 	*ddsp_taskp = p;
 
-	SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, enqueue, p, enq_flags);
+	SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, rq, enqueue, p, enq_flags);
 
 	*ddsp_taskp = NULL;
 	if (p->scx.ddsp_dsq_id != SCX_DSQ_INVALID)
@@ -2269,7 +2295,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 	add_nr_running(rq, 1);
 
 	if (SCX_HAS_OP(runnable) && !task_on_rq_migrating(p))
-		SCX_CALL_OP_TASK(SCX_KF_REST, runnable, p, enq_flags);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, runnable, p, enq_flags);
 
 	if (enq_flags & SCX_ENQ_WAKEUP)
 		touch_core_sched(rq, p);
@@ -2283,7 +2309,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 		__scx_add_event(SCX_EV_SELECT_CPU_FALLBACK, 1);
 }
 
-static void ops_dequeue(struct task_struct *p, u64 deq_flags)
+static void ops_dequeue(struct rq *rq, struct task_struct *p, u64 deq_flags)
 {
 	unsigned long opss;
 
@@ -2304,7 +2330,7 @@ static void ops_dequeue(struct task_struct *p, u64 deq_flags)
 		BUG();
 	case SCX_OPSS_QUEUED:
 		if (SCX_HAS_OP(dequeue))
-			SCX_CALL_OP_TASK(SCX_KF_REST, dequeue, p, deq_flags);
+			SCX_CALL_OP_TASK(SCX_KF_REST, rq, dequeue, p, deq_flags);
 
 		if (atomic_long_try_cmpxchg(&p->scx.ops_state, &opss,
 					    SCX_OPSS_NONE))
@@ -2337,7 +2363,7 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags
 		return true;
 	}
 
-	ops_dequeue(p, deq_flags);
+	ops_dequeue(rq, p, deq_flags);
 
 	/*
 	 * A currently running task which is going off @rq first gets dequeued
@@ -2353,11 +2379,11 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags
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
@@ -2377,7 +2403,7 @@ static void yield_task_scx(struct rq *rq)
 	struct task_struct *p = rq->curr;
 
 	if (SCX_HAS_OP(yield))
-		SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, p, NULL);
+		SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, rq, yield, p, NULL);
 	else
 		p->scx.slice = 0;
 }
@@ -2387,7 +2413,7 @@ static bool yield_to_task_scx(struct rq *rq, struct task_struct *to)
 	struct task_struct *from = rq->curr;
 
 	if (SCX_HAS_OP(yield))
-		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, from, to);
+		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, rq, yield, from, to);
 	else
 		return false;
 }
@@ -2945,7 +2971,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 		 * emitted in switch_class().
 		 */
 		if (SCX_HAS_OP(cpu_acquire))
-			SCX_CALL_OP(SCX_KF_REST, cpu_acquire, cpu_of(rq), NULL);
+			SCX_CALL_OP(SCX_KF_REST, rq, cpu_acquire, cpu_of(rq), NULL);
 		rq->scx.cpu_released = false;
 	}
 
@@ -2990,7 +3016,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	do {
 		dspc->nr_tasks = 0;
 
-		SCX_CALL_OP(SCX_KF_DISPATCH, dispatch, cpu_of(rq),
+		SCX_CALL_OP(SCX_KF_DISPATCH, rq, dispatch, cpu_of(rq),
 			    prev_on_scx ? prev : NULL);
 
 		flush_dispatch_buf(rq);
@@ -3104,7 +3130,7 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
 		 * Core-sched might decide to execute @p before it is
 		 * dispatched. Call ops_dequeue() to notify the BPF scheduler.
 		 */
-		ops_dequeue(p, SCX_DEQ_CORE_SCHED_EXEC);
+		ops_dequeue(rq, p, SCX_DEQ_CORE_SCHED_EXEC);
 		dispatch_dequeue(rq, p);
 	}
 
@@ -3112,7 +3138,7 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
 	if (SCX_HAS_OP(running) && (p->scx.flags & SCX_TASK_QUEUED))
-		SCX_CALL_OP_TASK(SCX_KF_REST, running, p);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, running, p);
 
 	clr_task_runnable(p, true);
 
@@ -3194,7 +3220,7 @@ static void switch_class(struct rq *rq, struct task_struct *next)
 			};
 
 			SCX_CALL_OP(SCX_KF_CPU_RELEASE,
-				    cpu_release, cpu_of(rq), &args);
+				    rq, cpu_release, cpu_of(rq), &args);
 		}
 		rq->scx.cpu_released = true;
 	}
@@ -3207,7 +3233,7 @@ static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
 	if (SCX_HAS_OP(stopping) && (p->scx.flags & SCX_TASK_QUEUED))
-		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, p, true);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, stopping, p, true);
 
 	if (p->scx.flags & SCX_TASK_QUEUED) {
 		set_task_runnable(rq, p);
@@ -3345,7 +3371,7 @@ bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 	 * verifier.
 	 */
 	if (SCX_HAS_OP(core_sched_before) && !scx_rq_bypassing(task_rq(a)))
-		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, core_sched_before,
+		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, NULL, core_sched_before,
 					      (struct task_struct *)a,
 					      (struct task_struct *)b);
 	else
@@ -3381,7 +3407,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 		WARN_ON_ONCE(*ddsp_taskp);
 		*ddsp_taskp = p;
 
-		cpu = SCX_CALL_OP_TASK_RET(SCX_KF_ENQUEUE | SCX_KF_SELECT_CPU,
+		cpu = SCX_CALL_OP_TASK_RET(SCX_KF_ENQUEUE | SCX_KF_SELECT_CPU, NULL,
 					   select_cpu, p, prev_cpu, wake_flags);
 		p->scx.selected_cpu = cpu;
 		*ddsp_taskp = NULL;
@@ -3426,7 +3452,7 @@ static void set_cpus_allowed_scx(struct task_struct *p,
 	 * designation pointless. Cast it away when calling the operation.
 	 */
 	if (SCX_HAS_OP(set_cpumask))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, p,
+		SCX_CALL_OP_TASK(SCX_KF_REST, NULL, set_cpumask, p,
 				 (struct cpumask *)p->cpus_ptr);
 }
 
@@ -3440,9 +3466,9 @@ static void handle_hotplug(struct rq *rq, bool online)
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
@@ -3545,7 +3571,7 @@ static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
 		curr->scx.slice = 0;
 		touch_core_sched(rq, curr);
 	} else if (SCX_HAS_OP(tick)) {
-		SCX_CALL_OP_TASK(SCX_KF_REST, tick, curr);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, tick, curr);
 	}
 
 	if (!curr->scx.slice)
@@ -3622,7 +3648,7 @@ static int scx_init_task(struct task_struct *p, struct task_group *tg, bool fork
 			.fork = fork,
 		};
 
-		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init_task, p, &args);
+		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, NULL, init_task, p, &args);
 		if (unlikely(ret)) {
 			ret = ops_sanitize_err("init_task", ret);
 			return ret;
@@ -3679,11 +3705,11 @@ static void scx_enable_task(struct task_struct *p)
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
@@ -3692,7 +3718,7 @@ static void scx_disable_task(struct task_struct *p)
 	WARN_ON_ONCE(scx_get_task_state(p) != SCX_TASK_ENABLED);
 
 	if (SCX_HAS_OP(disable))
-		SCX_CALL_OP_TASK(SCX_KF_REST, disable, p);
+		SCX_CALL_OP_TASK(SCX_KF_REST, task_rq(p), disable, p);
 	scx_set_task_state(p, SCX_TASK_READY);
 }
 
@@ -3721,7 +3747,7 @@ static void scx_exit_task(struct task_struct *p)
 	}
 
 	if (SCX_HAS_OP(exit_task))
-		SCX_CALL_OP_TASK(SCX_KF_REST, exit_task, p, &args);
+		SCX_CALL_OP_TASK(SCX_KF_REST, task_rq(p), exit_task, p, &args);
 	scx_set_task_state(p, SCX_TASK_NONE);
 }
 
@@ -3830,7 +3856,7 @@ static void reweight_task_scx(struct rq *rq, struct task_struct *p,
 
 	p->scx.weight = sched_weight_to_cgroup(scale_load_down(lw->weight));
 	if (SCX_HAS_OP(set_weight))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, p, p->scx.weight);
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, set_weight, p, p->scx.weight);
 }
 
 static void prio_changed_scx(struct rq *rq, struct task_struct *p, int oldprio)
@@ -3846,7 +3872,7 @@ static void switching_to_scx(struct rq *rq, struct task_struct *p)
 	 * different scheduler class. Keep the BPF scheduler up-to-date.
 	 */
 	if (SCX_HAS_OP(set_cpumask))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, p,
+		SCX_CALL_OP_TASK(SCX_KF_REST, rq, set_cpumask, p,
 				 (struct cpumask *)p->cpus_ptr);
 }
 
@@ -3908,7 +3934,7 @@ int scx_tg_online(struct task_group *tg)
 			struct scx_cgroup_init_args args =
 				{ .weight = tg->scx_weight };
 
-			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init,
+			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, NULL, cgroup_init,
 					      tg->css.cgroup, &args);
 			if (ret)
 				ret = ops_sanitize_err("cgroup_init", ret);
@@ -3930,7 +3956,7 @@ void scx_tg_offline(struct task_group *tg)
 	percpu_down_read(&scx_cgroup_rwsem);
 
 	if (SCX_HAS_OP(cgroup_exit) && (tg->scx_flags & SCX_TG_INITED))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, tg->css.cgroup);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, cgroup_exit, tg->css.cgroup);
 	tg->scx_flags &= ~(SCX_TG_ONLINE | SCX_TG_INITED);
 
 	percpu_up_read(&scx_cgroup_rwsem);
@@ -3963,7 +3989,7 @@ int scx_cgroup_can_attach(struct cgroup_taskset *tset)
 			continue;
 
 		if (SCX_HAS_OP(cgroup_prep_move)) {
-			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_prep_move,
+			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, NULL, cgroup_prep_move,
 					      p, from, css->cgroup);
 			if (ret)
 				goto err;
@@ -3977,7 +4003,7 @@ int scx_cgroup_can_attach(struct cgroup_taskset *tset)
 err:
 	cgroup_taskset_for_each(p, css, tset) {
 		if (SCX_HAS_OP(cgroup_cancel_move) && p->scx.cgrp_moving_from)
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, p,
+			SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, cgroup_cancel_move, p,
 				    p->scx.cgrp_moving_from, css->cgroup);
 		p->scx.cgrp_moving_from = NULL;
 	}
@@ -3996,7 +4022,7 @@ void scx_cgroup_move_task(struct task_struct *p)
 	 * cgrp_moving_from set.
 	 */
 	if (SCX_HAS_OP(cgroup_move) && !WARN_ON_ONCE(!p->scx.cgrp_moving_from))
-		SCX_CALL_OP_TASK(SCX_KF_UNLOCKED, cgroup_move, p,
+		SCX_CALL_OP_TASK(SCX_KF_UNLOCKED, NULL, cgroup_move, p,
 			p->scx.cgrp_moving_from, tg_cgrp(task_group(p)));
 	p->scx.cgrp_moving_from = NULL;
 }
@@ -4016,7 +4042,7 @@ void scx_cgroup_cancel_attach(struct cgroup_taskset *tset)
 
 	cgroup_taskset_for_each(p, css, tset) {
 		if (SCX_HAS_OP(cgroup_cancel_move) && p->scx.cgrp_moving_from)
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, p,
+			SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, cgroup_cancel_move, p,
 				    p->scx.cgrp_moving_from, css->cgroup);
 		p->scx.cgrp_moving_from = NULL;
 	}
@@ -4030,7 +4056,7 @@ void scx_group_set_weight(struct task_group *tg, unsigned long weight)
 
 	if (scx_cgroup_enabled && tg->scx_weight != weight) {
 		if (SCX_HAS_OP(cgroup_set_weight))
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_set_weight,
+			SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, cgroup_set_weight,
 				    tg_cgrp(tg), weight);
 		tg->scx_weight = weight;
 	}
@@ -4219,7 +4245,7 @@ static void scx_cgroup_exit(void)
 			continue;
 		rcu_read_unlock();
 
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, css->cgroup);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, cgroup_exit, css->cgroup);
 
 		rcu_read_lock();
 		css_put(css);
@@ -4256,7 +4282,7 @@ static int scx_cgroup_init(void)
 			continue;
 		rcu_read_unlock();
 
-		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init,
+		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, NULL, cgroup_init,
 				      css->cgroup, &args);
 		if (ret) {
 			css_put(css);
@@ -4749,7 +4775,7 @@ static void scx_disable_workfn(struct kthread_work *work)
 	}
 
 	if (scx_ops.exit)
-		SCX_CALL_OP(SCX_KF_UNLOCKED, exit, ei);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, exit, ei);
 
 	cancel_delayed_work_sync(&scx_watchdog_work);
 
@@ -4955,7 +4981,7 @@ static void scx_dump_task(struct seq_buf *s, struct scx_dump_ctx *dctx,
 
 	if (SCX_HAS_OP(dump_task)) {
 		ops_dump_init(s, "    ");
-		SCX_CALL_OP(SCX_KF_REST, dump_task, dctx, p);
+		SCX_CALL_OP(SCX_KF_REST, NULL, dump_task, dctx, p);
 		ops_dump_exit();
 	}
 
@@ -5002,7 +5028,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 
 	if (SCX_HAS_OP(dump)) {
 		ops_dump_init(&s, "");
-		SCX_CALL_OP(SCX_KF_UNLOCKED, dump, &dctx);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, NULL, dump, &dctx);
 		ops_dump_exit();
 	}
 
@@ -5059,7 +5085,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 		used = seq_buf_used(&ns);
 		if (SCX_HAS_OP(dump_cpu)) {
 			ops_dump_init(&ns, "  ");
-			SCX_CALL_OP(SCX_KF_REST, dump_cpu, &dctx, cpu, idle);
+			SCX_CALL_OP(SCX_KF_REST, NULL, dump_cpu, &dctx, cpu, idle);
 			ops_dump_exit();
 		}
 
@@ -5315,7 +5341,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
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

