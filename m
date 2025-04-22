Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29507293B7E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310580; cv=fail; b=mfzk0dnKO0YPRXXIj8+wxt4ond3AzJw1uanos3eDSm1L9KL4pxJk5/OlGVcfwMpWqMgcEw65c9ut/F/lY1XwMfhRnMSrvtROEdQFg8R3FRnk7SAQ7I8Y6Wa/3O56a5oUjn++tm2jxfW/vtL0QF7JNQVWEmcETO6g8zSE8euBIfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310580; c=relaxed/simple;
	bh=Yoou5HypLtkAq43JdoD1Nsx1BkZnCmWwSF+l3L2MgoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bKF2zOjyvBgO1RkGNRBuklbZF4EvZUDobZVqAvWkoajIwf0aHm3fvFmpWNy9UKlVUzDm749ICH5nn++5lBfNhgP44PK0mgK1/cqqZ3U4A5K3+5kOECHNHrYCNkcYfu5pCYcD93zPhPPm99g37R/qcmy2gsf8cwu2aIubAzwivI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fHPVDkEn; arc=fail smtp.client-ip=40.107.223.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fHPVDkEn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQdni7zYrg4KZ7SaPTSQwvhpa9LwQXBp0IQnq4dR/U+h+1L1hwGSNh9kg1JL59oDPwSgTf9YYvooMhaAVfINBF7VChAWYkwiHS+C3W4boXAKZAXQjT6qO/d36a1QNabjatVMo581am+tJ6Lmq8qN2VaIdyn8IsnwzJS0FU6uIyESqphtSEfXafvBdxgs11mpR1xsqbJ6F9zO3MjYJ6KOciv/3ZNidxqLIfy8640co73hXQwQA022b6i4Wu6c6Sx42ex2Iix42VnplS+QMn4VPCpnW21x1s1pvtc9QCC3DpkUaN5T+5vj+k0a8spFxBiHm8GPeZHo2suDMhVxhqMbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yhzWkjxrGIPHQe9AvPcP8G8++9y7sNCCc4A0cAjIEw=;
 b=eUBw8SrxJVUHDoXD2VAQZFum3Lsrdspc25/lDePDPxx/IGt2fqPwSyxOd6JYERnHRqlLmvh3vDb1OH6GDk2tWOy2TiZcRXIpISFaFYHB2G7+lefjcYZ6CiyRSZ4MCfYnms2uWvum2UfJNFoN9PpCq5pmmycD8NuFg933cH7i0Kj8W+gNhbKBqQ0Y7MY8ptQmMPlEJFM+6JUSczyZ13aVXjpRAvmpfQJycDkSo+IHyxKcgxTE3jUojr9KeejyGScI8GI2xkmZ5XLIwqU3e4jvUo+rprSdOiEukoWrFeg1UKz4ebDOVWjDgjYvrN3mZ5znRHFB2jnN5w5lLeaTaub7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yhzWkjxrGIPHQe9AvPcP8G8++9y7sNCCc4A0cAjIEw=;
 b=fHPVDkEnS+nacB9lHhB3ytdivWaZjRWrbZViH6DZwV3juQctUGwKXhJMIg8Y8ST1ZUEKaaP5lnLomXdgoa+nzOKx6DFDzdG3xdAQj77kUlNWPdBEK7L5tWPov1W8ICydERlZr0/y6vfU/Yac6XzpjjgvqT0kh7QdOCgwp9qNWk+zE5cDtput193cWFdnBaVSw+z/fUCkyA/hWD7QFiC/FJRxOOwPnXntIlyGrrVMDLsupppJZShn+6Ce9hKBT6WcDrSEYkj7XsHXle8b9Xere0QuZuV3jJ8LhRvHgglL5+io65Go0k+cvoHXWU5oGOJb6rjj/UHBL4/vjCagJI4jVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 08:29:31 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 08:29:31 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] sched_ext: Track currently locked rq
Date: Tue, 22 Apr 2025 10:26:32 +0200
Message-ID: <20250422082907.110167-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082907.110167-1-arighi@nvidia.com>
References: <20250422082907.110167-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0030.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::20) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 43cd1425-b59d-4af2-cd45-08dd8177ce0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/PRga5C/CcSUKc7H/Z48TtGAuNsWC1zC1sygi9sa0lmG0g8TAaLVgGzBjRp3?=
 =?us-ascii?Q?/qAe8jugTObeQ323rwJEERxKUn7WsACRbbBKD/XwmGiYp4MWG+pYn8aUZ8XU?=
 =?us-ascii?Q?rGUFzMTTj3t0gldgV1dPKTl2xMmq84GmHgF/60lUvEV1BA8/6OU14SKQYBz6?=
 =?us-ascii?Q?YZPjIU3ZqGYyzRyHaXrTH3lxpwLvR33Oyp81jwRQ/6ZXDFgBcy5rM/2tefbr?=
 =?us-ascii?Q?27XzCJt8CA7UDg556W6EyN6tsaoMU0Tahj89PzxYTsRL8V8cEW1Y4b6ZZ+JI?=
 =?us-ascii?Q?FkAS245us/YB6RYYgmuuJgOCemVlfmuGsHxvcH52LPWhzJ0rMx/L0cFQXsJx?=
 =?us-ascii?Q?nHVgFjPozZaSowavheI0cJ+eTrBSCVpesS7L0SEir3esVKhi+qgbsQAoFXKd?=
 =?us-ascii?Q?eySnJqg/3zCIZ6D3YtpNCn40wNVwq/ee9c8hLvgjkeM47NwV2RqdNEOJz7az?=
 =?us-ascii?Q?BsJC4szgqa/ux3NASbXMJ3Ifv4FL8fExIe2DLil/bwhj227+yYhpXaGMNH9b?=
 =?us-ascii?Q?SP6CSme3vSSKEgXRjlVklCZeqza6MIzv4/UmbzkrErI6Hs8Onn+NatFokBPr?=
 =?us-ascii?Q?NGlHLmParXuMMeeEg0xydV1fxrKvrGmhtWZEgxkk4OCL/OfFN4tRg1NWOdrQ?=
 =?us-ascii?Q?jgr/ugzdTFpiUKfyItyF+fNVN2RNLzonQxBMJ6Rr+lPqn95MIEETk/dCudjh?=
 =?us-ascii?Q?xGnfeH+IbyeO8Rgf5FVMGZfayKZZJFv2wbiLyP2QVijF0SQX7XJrIzYIzuOo?=
 =?us-ascii?Q?zAXhI2fSjTkDxG289hvl8Tda/giIszvucgv/YyNSYlsmTlnp7m78U/c3hlV4?=
 =?us-ascii?Q?adJLCM+PjMsKn5lqiUrxHaBBvlFJpL3bcSqWZbYneezrW04RBbOegYanj9+0?=
 =?us-ascii?Q?dyzkW0UtRD2IiHYx2GnzxmtrvZL26PVtZePU0sdfA0gs+FmCy5uqGlJtCLKL?=
 =?us-ascii?Q?un+AYWEE6FNg0jCbjos9jTMRd+opbI8roLjo9fXRBFu6iuySnN86bW4Has8S?=
 =?us-ascii?Q?X6S5NekABVI8BBCeNF7fcjc78/rfBMhKRtUI8T/U03Y3ox7zopvNzbATeT76?=
 =?us-ascii?Q?GraRiZB87AaveegZUwz9I+m4M+bqtVhNID7OvEok7NtYbnJOJavj72LmWhv3?=
 =?us-ascii?Q?qsRTd+Y07pKFfHzn71EHB8v51nExa0TN5vtddbaESSKRFm4bYfTQs1u/hDzx?=
 =?us-ascii?Q?k7Xpbr32soeH/2WW9gWbbCeWFPQNI5WdIDbEKDWkVV7vJhMQc9dTY0oipjNv?=
 =?us-ascii?Q?MQFxy9GmkHyL93reIyt9DVW9xFcoHV9r5T6AJfZLabqhXGxQhJhD6EkfL0e5?=
 =?us-ascii?Q?VhPvuYIBMs2J1i1KMdyZET2PW6G4mt9kkCG/RXg911Z3olrcgsgWVmYFtHtW?=
 =?us-ascii?Q?jqj86cU7elgkCUEOUFADdVQ7uGEuE1SQPYYbfCWlNtYj5Zp15Nk57NYrnxgG?=
 =?us-ascii?Q?LXvcLqA5CfM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+QHXHKiMB/rDCy+BfYcYTx1PWyysxd9oZ4YphuwDtWa29fQ8vGkgZZOKEmkd?=
 =?us-ascii?Q?CUqXXFwyBa97OY3PoCZNXqPaVDKmNUyvEkw3gy1XIXg/0taQnph27m8CmKAF?=
 =?us-ascii?Q?OdAiWDrjymmRdDmDfLNx+7Lr8vZs+4EZMgBasRwAbatyPjovSgawID04DNET?=
 =?us-ascii?Q?L8I+Kj1zZBMZ4mOfihgokLF+ihtDNyTJijRzcie5lBLROnzv5EliqdQEUooN?=
 =?us-ascii?Q?Wln1ID/lmK3KAUEwNDENdCofj43X0+n+aNeMMukAz4eGypt0NrgCA2fHKWzi?=
 =?us-ascii?Q?4lyYRBYc4AG+R6P+pZ1yUsvEZbQyTqgzWOB/KEdoOQK21Y4RZiXga/js0zo/?=
 =?us-ascii?Q?zz/HuyzYPYR3q69GH3h7a/iP0D6LZr47BTq8+6D8WBMVTaLjkfCn3p1m6I6x?=
 =?us-ascii?Q?+gwIeXtRHGsIoaTb0JQDa/DOLhSARGtacARxF9Vl1ZniQqiSPSGCu93eCLDy?=
 =?us-ascii?Q?vmT07ylWHJF/8oIMdrA3A6jKnBvXXRGXGEMaHleWYSjkD3mKkLExsJCOr5GW?=
 =?us-ascii?Q?Ltu+NxGUBlGqudvWUzWaDlC6ukQaZ8bnd5yAbtJ1NNXIo4ae2u5XOElnWAxB?=
 =?us-ascii?Q?CUj/TbC71m/cKFYZSMBp0G+BMPJmo89mCt7RvZ9v6Yxi0X45v4u46eATfWNo?=
 =?us-ascii?Q?GcUgP8nex6YgiXNOQ/cdb+sfzOE5zH1AX4BHhpf9m4sCPzIc2f8IfqShpV44?=
 =?us-ascii?Q?hT5G532Z6tr28RIVBsLQaqfFRsl9bP4wV8QtaG+GQAy3h5hs3f3gHyZrDgLc?=
 =?us-ascii?Q?rwagvm8x4vftwZjfGA669uqt1T1SpolKUMvCpPn0pgAnC9Vc3MQ+G6BtURUY?=
 =?us-ascii?Q?hXZJr6rkuTnUoPUJ8MCG5582VLp+/+6uKPQq8QpLXJXBXu4C9SUIsMg8Qf37?=
 =?us-ascii?Q?5B5hUhNgy/RXScPG9tr3lWfcBSGxWodQQhMNCE+D+k4E/1QXQtcOSLVuz4B3?=
 =?us-ascii?Q?blompQihvKaxPt3lQDCOZZbOyhkngzt/fmcY6aEfws3c84Fr4DT8icrdtv9x?=
 =?us-ascii?Q?VuNf8aPZUgPF1P1s5UJO1lPKZsvdNsol4e8wKbS2rotKth2kx3VtTU94TCyM?=
 =?us-ascii?Q?xvkBeB7rz+Byj0fk7Os1smrHlN3vABgBlXL839TSxY2JPml+D5cqKcTeznFx?=
 =?us-ascii?Q?solxBEq4cdnMxw6s9TxxCnOnh81PFIavegDQJs0b5pGSsY1hKtsCxKnXdt9/?=
 =?us-ascii?Q?lPtFvvNIvnJlu0C4L8d6eppzt/oYj5LIdJsE5Z7w+T8rpdwfKovwGc9fRmO8?=
 =?us-ascii?Q?OrtFzUZUr7S6CYmRzqXcag5puGXrUH/HMPrLuyT9981t2snuRiWgIWXSht6R?=
 =?us-ascii?Q?TRt+EOEz2MokehzRa0nhMZbjO1/4nW4mpGhDw/wK9wy4wI9eAorcAvyuJEMF?=
 =?us-ascii?Q?Y07dsmL8+HkH72cVTrzHNV/kJCgy7mj4Vq/M1na+5LAIEJ9OhJTXdpLB+yzq?=
 =?us-ascii?Q?8OWeeaZs2ePVH4B92A6saQLjy6jrEbD+2yZYEpxPPczn2Fu8n/l24FkzhoB3?=
 =?us-ascii?Q?dBTsfV2Bqwf+3+tP3xPP+aZ9iJaS+bibp9JNmA4NirZxxzcqDiqrNhvmnKYT?=
 =?us-ascii?Q?KpAbx9vwtUNDkGwK/qBII5dedyWeo3iS1GrLplpk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cd1425-b59d-4af2-cd45-08dd8177ce0e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:29:31.6967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6vWIWNYuTdOkOb6eEryWZjpg3srByBFm0u6Z9ZF9l7rkmevHWVpsq319HSi8JvZUW3ZyYxQvSx2fMLE8N7Xqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603

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
 kernel/sched/ext.c      | 152 +++++++++++++++++++++++++---------------
 kernel/sched/ext_idle.c |   2 +-
 2 files changed, 95 insertions(+), 59 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index bb0873411d798..3365b447cbdb8 100644
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
+#define SCX_CALL_OP(mask, op, rq, args...)					\
 do {										\
+	update_locked_rq(rq);							\
 	if (mask) {								\
 		scx_kf_allow(mask);						\
 		scx_ops.op(args);						\
@@ -1125,11 +1155,14 @@ do {										\
 	} else {								\
 		scx_ops.op(args);						\
 	}									\
+	update_locked_rq(NULL);							\
 } while (0)
 
-#define SCX_CALL_OP_RET(mask, op, args...)					\
+#define SCX_CALL_OP_RET(mask, op, rq, args...)					\
 ({										\
 	__typeof__(scx_ops.op(args)) __ret;					\
+										\
+	update_locked_rq(rq);							\
 	if (mask) {								\
 		scx_kf_allow(mask);						\
 		__ret = scx_ops.op(args);					\
@@ -1137,6 +1170,7 @@ do {										\
 	} else {								\
 		__ret = scx_ops.op(args);					\
 	}									\
+	update_locked_rq(NULL);							\
 	__ret;									\
 })
 
@@ -1151,31 +1185,31 @@ do {										\
  * scx_kf_allowed_on_arg_tasks() to test whether the invocation is allowed on
  * the specific task.
  */
-#define SCX_CALL_OP_TASK(mask, op, task, args...)				\
+#define SCX_CALL_OP_TASK(mask, op, rq, task, args...)				\
 do {										\
 	BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
 	current->scx.kf_tasks[0] = task;					\
-	SCX_CALL_OP(mask, op, task, ##args);					\
+	SCX_CALL_OP(mask, op, rq, task, ##args);				\
 	current->scx.kf_tasks[0] = NULL;					\
 } while (0)
 
-#define SCX_CALL_OP_TASK_RET(mask, op, task, args...)				\
+#define SCX_CALL_OP_TASK_RET(mask, op, rq, task, args...)			\
 ({										\
 	__typeof__(scx_ops.op(task, ##args)) __ret;				\
 	BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
 	current->scx.kf_tasks[0] = task;					\
-	__ret = SCX_CALL_OP_RET(mask, op, task, ##args);			\
+	__ret = SCX_CALL_OP_RET(mask, op, rq, task, ##args);			\
 	current->scx.kf_tasks[0] = NULL;					\
 	__ret;									\
 })
 
-#define SCX_CALL_OP_2TASKS_RET(mask, op, task0, task1, args...)			\
+#define SCX_CALL_OP_2TASKS_RET(mask, op, rq, task0, task1, args...)		\
 ({										\
 	__typeof__(scx_ops.op(task0, task1, ##args)) __ret;			\
 	BUILD_BUG_ON((mask) & ~__SCX_KF_TERMINAL);				\
 	current->scx.kf_tasks[0] = task0;					\
 	current->scx.kf_tasks[1] = task1;					\
-	__ret = SCX_CALL_OP_RET(mask, op, task0, task1, ##args);		\
+	__ret = SCX_CALL_OP_RET(mask, op, rq, task0, task1, ##args);		\
 	current->scx.kf_tasks[0] = NULL;					\
 	current->scx.kf_tasks[1] = NULL;					\
 	__ret;									\
@@ -2174,7 +2208,7 @@ static void do_enqueue_task(struct rq *rq, struct task_struct *p, u64 enq_flags,
 	WARN_ON_ONCE(*ddsp_taskp);
 	*ddsp_taskp = p;
 
-	SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, enqueue, p, enq_flags);
+	SCX_CALL_OP_TASK(SCX_KF_ENQUEUE, enqueue, rq, p, enq_flags);
 
 	*ddsp_taskp = NULL;
 	if (p->scx.ddsp_dsq_id != SCX_DSQ_INVALID)
@@ -2269,7 +2303,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 	add_nr_running(rq, 1);
 
 	if (SCX_HAS_OP(runnable) && !task_on_rq_migrating(p))
-		SCX_CALL_OP_TASK(SCX_KF_REST, runnable, p, enq_flags);
+		SCX_CALL_OP_TASK(SCX_KF_REST, runnable, rq, p, enq_flags);
 
 	if (enq_flags & SCX_ENQ_WAKEUP)
 		touch_core_sched(rq, p);
@@ -2283,7 +2317,7 @@ static void enqueue_task_scx(struct rq *rq, struct task_struct *p, int enq_flags
 		__scx_add_event(SCX_EV_SELECT_CPU_FALLBACK, 1);
 }
 
-static void ops_dequeue(struct task_struct *p, u64 deq_flags)
+static void ops_dequeue(struct rq *rq, struct task_struct *p, u64 deq_flags)
 {
 	unsigned long opss;
 
@@ -2304,7 +2338,7 @@ static void ops_dequeue(struct task_struct *p, u64 deq_flags)
 		BUG();
 	case SCX_OPSS_QUEUED:
 		if (SCX_HAS_OP(dequeue))
-			SCX_CALL_OP_TASK(SCX_KF_REST, dequeue, p, deq_flags);
+			SCX_CALL_OP_TASK(SCX_KF_REST, dequeue, rq, p, deq_flags);
 
 		if (atomic_long_try_cmpxchg(&p->scx.ops_state, &opss,
 					    SCX_OPSS_NONE))
@@ -2337,7 +2371,7 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags
 		return true;
 	}
 
-	ops_dequeue(p, deq_flags);
+	ops_dequeue(rq, p, deq_flags);
 
 	/*
 	 * A currently running task which is going off @rq first gets dequeued
@@ -2353,11 +2387,11 @@ static bool dequeue_task_scx(struct rq *rq, struct task_struct *p, int deq_flags
 	 */
 	if (SCX_HAS_OP(stopping) && task_current(rq, p)) {
 		update_curr_scx(rq);
-		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, p, false);
+		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, rq, p, false);
 	}
 
 	if (SCX_HAS_OP(quiescent) && !task_on_rq_migrating(p))
-		SCX_CALL_OP_TASK(SCX_KF_REST, quiescent, p, deq_flags);
+		SCX_CALL_OP_TASK(SCX_KF_REST, quiescent, rq, p, deq_flags);
 
 	if (deq_flags & SCX_DEQ_SLEEP)
 		p->scx.flags |= SCX_TASK_DEQD_FOR_SLEEP;
@@ -2377,7 +2411,7 @@ static void yield_task_scx(struct rq *rq)
 	struct task_struct *p = rq->curr;
 
 	if (SCX_HAS_OP(yield))
-		SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, p, NULL);
+		SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, rq, p, NULL);
 	else
 		p->scx.slice = 0;
 }
@@ -2387,7 +2421,7 @@ static bool yield_to_task_scx(struct rq *rq, struct task_struct *to)
 	struct task_struct *from = rq->curr;
 
 	if (SCX_HAS_OP(yield))
-		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, from, to);
+		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, rq, from, to);
 	else
 		return false;
 }
@@ -2945,7 +2979,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 		 * emitted in switch_class().
 		 */
 		if (SCX_HAS_OP(cpu_acquire))
-			SCX_CALL_OP(SCX_KF_REST, cpu_acquire, cpu_of(rq), NULL);
+			SCX_CALL_OP(SCX_KF_REST, cpu_acquire, rq, cpu_of(rq), NULL);
 		rq->scx.cpu_released = false;
 	}
 
@@ -2990,7 +3024,7 @@ static int balance_one(struct rq *rq, struct task_struct *prev)
 	do {
 		dspc->nr_tasks = 0;
 
-		SCX_CALL_OP(SCX_KF_DISPATCH, dispatch, cpu_of(rq),
+		SCX_CALL_OP(SCX_KF_DISPATCH, dispatch, rq, cpu_of(rq),
 			    prev_on_scx ? prev : NULL);
 
 		flush_dispatch_buf(rq);
@@ -3104,7 +3138,7 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
 		 * Core-sched might decide to execute @p before it is
 		 * dispatched. Call ops_dequeue() to notify the BPF scheduler.
 		 */
-		ops_dequeue(p, SCX_DEQ_CORE_SCHED_EXEC);
+		ops_dequeue(rq, p, SCX_DEQ_CORE_SCHED_EXEC);
 		dispatch_dequeue(rq, p);
 	}
 
@@ -3112,7 +3146,7 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, bool first)
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
 	if (SCX_HAS_OP(running) && (p->scx.flags & SCX_TASK_QUEUED))
-		SCX_CALL_OP_TASK(SCX_KF_REST, running, p);
+		SCX_CALL_OP_TASK(SCX_KF_REST, running, rq, p);
 
 	clr_task_runnable(p, true);
 
@@ -3193,8 +3227,7 @@ static void switch_class(struct rq *rq, struct task_struct *next)
 				.task = next,
 			};
 
-			SCX_CALL_OP(SCX_KF_CPU_RELEASE,
-				    cpu_release, cpu_of(rq), &args);
+			SCX_CALL_OP(SCX_KF_CPU_RELEASE, cpu_release, rq, cpu_of(rq), &args);
 		}
 		rq->scx.cpu_released = true;
 	}
@@ -3207,7 +3240,7 @@ static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
 
 	/* see dequeue_task_scx() on why we skip when !QUEUED */
 	if (SCX_HAS_OP(stopping) && (p->scx.flags & SCX_TASK_QUEUED))
-		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, p, true);
+		SCX_CALL_OP_TASK(SCX_KF_REST, stopping, rq, p, true);
 
 	if (p->scx.flags & SCX_TASK_QUEUED) {
 		set_task_runnable(rq, p);
@@ -3345,7 +3378,7 @@ bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 	 * verifier.
 	 */
 	if (SCX_HAS_OP(core_sched_before) && !scx_rq_bypassing(task_rq(a)))
-		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, core_sched_before,
+		return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, core_sched_before, NULL,
 					      (struct task_struct *)a,
 					      (struct task_struct *)b);
 	else
@@ -3382,7 +3415,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
 		*ddsp_taskp = p;
 
 		cpu = SCX_CALL_OP_TASK_RET(SCX_KF_ENQUEUE | SCX_KF_SELECT_CPU,
-					   select_cpu, p, prev_cpu, wake_flags);
+					   select_cpu, NULL, p, prev_cpu, wake_flags);
 		p->scx.selected_cpu = cpu;
 		*ddsp_taskp = NULL;
 		if (ops_cpu_valid(cpu, "from ops.select_cpu()"))
@@ -3426,8 +3459,8 @@ static void set_cpus_allowed_scx(struct task_struct *p,
 	 * designation pointless. Cast it away when calling the operation.
 	 */
 	if (SCX_HAS_OP(set_cpumask))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, p,
-				 (struct cpumask *)p->cpus_ptr);
+		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, NULL,
+				 p, (struct cpumask *)p->cpus_ptr);
 }
 
 static void handle_hotplug(struct rq *rq, bool online)
@@ -3440,9 +3473,9 @@ static void handle_hotplug(struct rq *rq, bool online)
 		scx_idle_update_selcpu_topology(&scx_ops);
 
 	if (online && SCX_HAS_OP(cpu_online))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, cpu);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, rq, cpu);
 	else if (!online && SCX_HAS_OP(cpu_offline))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, cpu);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, rq, cpu);
 	else
 		scx_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
 			 "cpu %d going %s, exiting scheduler", cpu,
@@ -3545,7 +3578,7 @@ static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
 		curr->scx.slice = 0;
 		touch_core_sched(rq, curr);
 	} else if (SCX_HAS_OP(tick)) {
-		SCX_CALL_OP_TASK(SCX_KF_REST, tick, curr);
+		SCX_CALL_OP_TASK(SCX_KF_REST, tick, rq, curr);
 	}
 
 	if (!curr->scx.slice)
@@ -3622,7 +3655,7 @@ static int scx_init_task(struct task_struct *p, struct task_group *tg, bool fork
 			.fork = fork,
 		};
 
-		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init_task, p, &args);
+		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init_task, NULL, p, &args);
 		if (unlikely(ret)) {
 			ret = ops_sanitize_err("init_task", ret);
 			return ret;
@@ -3663,9 +3696,10 @@ static int scx_init_task(struct task_struct *p, struct task_group *tg, bool fork
 
 static void scx_enable_task(struct task_struct *p)
 {
+	struct rq *rq = task_rq(p);
 	u32 weight;
 
-	lockdep_assert_rq_held(task_rq(p));
+	lockdep_assert_rq_held(rq);
 
 	/*
 	 * Set the weight before calling ops.enable() so that the scheduler
@@ -3679,20 +3713,22 @@ static void scx_enable_task(struct task_struct *p)
 	p->scx.weight = sched_weight_to_cgroup(weight);
 
 	if (SCX_HAS_OP(enable))
-		SCX_CALL_OP_TASK(SCX_KF_REST, enable, p);
+		SCX_CALL_OP_TASK(SCX_KF_REST, enable, rq, p);
 	scx_set_task_state(p, SCX_TASK_ENABLED);
 
 	if (SCX_HAS_OP(set_weight))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, p, p->scx.weight);
+		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, rq, p, p->scx.weight);
 }
 
 static void scx_disable_task(struct task_struct *p)
 {
-	lockdep_assert_rq_held(task_rq(p));
+	struct rq *rq = task_rq(p);
+
+	lockdep_assert_rq_held(rq);
 	WARN_ON_ONCE(scx_get_task_state(p) != SCX_TASK_ENABLED);
 
 	if (SCX_HAS_OP(disable))
-		SCX_CALL_OP_TASK(SCX_KF_REST, disable, p);
+		SCX_CALL_OP_TASK(SCX_KF_REST, disable, rq, p);
 	scx_set_task_state(p, SCX_TASK_READY);
 }
 
@@ -3721,7 +3757,7 @@ static void scx_exit_task(struct task_struct *p)
 	}
 
 	if (SCX_HAS_OP(exit_task))
-		SCX_CALL_OP_TASK(SCX_KF_REST, exit_task, p, &args);
+		SCX_CALL_OP_TASK(SCX_KF_REST, exit_task, task_rq(p), p, &args);
 	scx_set_task_state(p, SCX_TASK_NONE);
 }
 
@@ -3830,7 +3866,7 @@ static void reweight_task_scx(struct rq *rq, struct task_struct *p,
 
 	p->scx.weight = sched_weight_to_cgroup(scale_load_down(lw->weight));
 	if (SCX_HAS_OP(set_weight))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, p, p->scx.weight);
+		SCX_CALL_OP_TASK(SCX_KF_REST, set_weight, rq, p, p->scx.weight);
 }
 
 static void prio_changed_scx(struct rq *rq, struct task_struct *p, int oldprio)
@@ -3846,8 +3882,8 @@ static void switching_to_scx(struct rq *rq, struct task_struct *p)
 	 * different scheduler class. Keep the BPF scheduler up-to-date.
 	 */
 	if (SCX_HAS_OP(set_cpumask))
-		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, p,
-				 (struct cpumask *)p->cpus_ptr);
+		SCX_CALL_OP_TASK(SCX_KF_REST, set_cpumask, rq,
+				 p, (struct cpumask *)p->cpus_ptr);
 }
 
 static void switched_from_scx(struct rq *rq, struct task_struct *p)
@@ -3908,7 +3944,7 @@ int scx_tg_online(struct task_group *tg)
 			struct scx_cgroup_init_args args =
 				{ .weight = tg->scx_weight };
 
-			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init,
+			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init, NULL,
 					      tg->css.cgroup, &args);
 			if (ret)
 				ret = ops_sanitize_err("cgroup_init", ret);
@@ -3930,7 +3966,7 @@ void scx_tg_offline(struct task_group *tg)
 	percpu_down_read(&scx_cgroup_rwsem);
 
 	if (SCX_HAS_OP(cgroup_exit) && (tg->scx_flags & SCX_TG_INITED))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, tg->css.cgroup);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, NULL, tg->css.cgroup);
 	tg->scx_flags &= ~(SCX_TG_ONLINE | SCX_TG_INITED);
 
 	percpu_up_read(&scx_cgroup_rwsem);
@@ -3963,7 +3999,7 @@ int scx_cgroup_can_attach(struct cgroup_taskset *tset)
 			continue;
 
 		if (SCX_HAS_OP(cgroup_prep_move)) {
-			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_prep_move,
+			ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_prep_move, NULL,
 					      p, from, css->cgroup);
 			if (ret)
 				goto err;
@@ -3977,8 +4013,8 @@ int scx_cgroup_can_attach(struct cgroup_taskset *tset)
 err:
 	cgroup_taskset_for_each(p, css, tset) {
 		if (SCX_HAS_OP(cgroup_cancel_move) && p->scx.cgrp_moving_from)
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, p,
-				    p->scx.cgrp_moving_from, css->cgroup);
+			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
+				    p, p->scx.cgrp_moving_from, css->cgroup);
 		p->scx.cgrp_moving_from = NULL;
 	}
 
@@ -3996,8 +4032,8 @@ void scx_cgroup_move_task(struct task_struct *p)
 	 * cgrp_moving_from set.
 	 */
 	if (SCX_HAS_OP(cgroup_move) && !WARN_ON_ONCE(!p->scx.cgrp_moving_from))
-		SCX_CALL_OP_TASK(SCX_KF_UNLOCKED, cgroup_move, p,
-			p->scx.cgrp_moving_from, tg_cgrp(task_group(p)));
+		SCX_CALL_OP_TASK(SCX_KF_UNLOCKED, cgroup_move, NULL,
+				 p, p->scx.cgrp_moving_from, tg_cgrp(task_group(p)));
 	p->scx.cgrp_moving_from = NULL;
 }
 
@@ -4016,8 +4052,8 @@ void scx_cgroup_cancel_attach(struct cgroup_taskset *tset)
 
 	cgroup_taskset_for_each(p, css, tset) {
 		if (SCX_HAS_OP(cgroup_cancel_move) && p->scx.cgrp_moving_from)
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, p,
-				    p->scx.cgrp_moving_from, css->cgroup);
+			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_cancel_move, NULL,
+				    p, p->scx.cgrp_moving_from, css->cgroup);
 		p->scx.cgrp_moving_from = NULL;
 	}
 out_unlock:
@@ -4030,7 +4066,7 @@ void scx_group_set_weight(struct task_group *tg, unsigned long weight)
 
 	if (scx_cgroup_enabled && tg->scx_weight != weight) {
 		if (SCX_HAS_OP(cgroup_set_weight))
-			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_set_weight,
+			SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_set_weight, NULL,
 				    tg_cgrp(tg), weight);
 		tg->scx_weight = weight;
 	}
@@ -4219,7 +4255,7 @@ static void scx_cgroup_exit(void)
 			continue;
 		rcu_read_unlock();
 
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, css->cgroup);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, cgroup_exit, NULL, css->cgroup);
 
 		rcu_read_lock();
 		css_put(css);
@@ -4256,7 +4292,7 @@ static int scx_cgroup_init(void)
 			continue;
 		rcu_read_unlock();
 
-		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init,
+		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, cgroup_init, NULL,
 				      css->cgroup, &args);
 		if (ret) {
 			css_put(css);
@@ -4749,7 +4785,7 @@ static void scx_disable_workfn(struct kthread_work *work)
 	}
 
 	if (scx_ops.exit)
-		SCX_CALL_OP(SCX_KF_UNLOCKED, exit, ei);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, exit, NULL, ei);
 
 	cancel_delayed_work_sync(&scx_watchdog_work);
 
@@ -4955,7 +4991,7 @@ static void scx_dump_task(struct seq_buf *s, struct scx_dump_ctx *dctx,
 
 	if (SCX_HAS_OP(dump_task)) {
 		ops_dump_init(s, "    ");
-		SCX_CALL_OP(SCX_KF_REST, dump_task, dctx, p);
+		SCX_CALL_OP(SCX_KF_REST, dump_task, NULL, dctx, p);
 		ops_dump_exit();
 	}
 
@@ -5002,7 +5038,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 
 	if (SCX_HAS_OP(dump)) {
 		ops_dump_init(&s, "");
-		SCX_CALL_OP(SCX_KF_UNLOCKED, dump, &dctx);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, dump, NULL, &dctx);
 		ops_dump_exit();
 	}
 
@@ -5059,7 +5095,7 @@ static void scx_dump_state(struct scx_exit_info *ei, size_t dump_len)
 		used = seq_buf_used(&ns);
 		if (SCX_HAS_OP(dump_cpu)) {
 			ops_dump_init(&ns, "  ");
-			SCX_CALL_OP(SCX_KF_REST, dump_cpu, &dctx, cpu, idle);
+			SCX_CALL_OP(SCX_KF_REST, dump_cpu, NULL, &dctx, cpu, idle);
 			ops_dump_exit();
 		}
 
@@ -5315,7 +5351,7 @@ static int scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
 	scx_idle_enable(ops);
 
 	if (scx_ops.init) {
-		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init);
+		ret = SCX_CALL_OP_RET(SCX_KF_UNLOCKED, init, NULL);
 		if (ret) {
 			ret = ops_sanitize_err("init", ret);
 			cpus_read_unlock();
diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 023ae6df5e8ca..35aa309c95846 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -745,7 +745,7 @@ void __scx_update_idle(struct rq *rq, bool idle, bool do_notify)
 	 * managed by put_prev_task_idle()/set_next_task_idle().
 	 */
 	if (SCX_HAS_OP(update_idle) && do_notify && !scx_rq_bypassing(rq))
-		SCX_CALL_OP(SCX_KF_REST, update_idle, cpu_of(rq), idle);
+		SCX_CALL_OP(SCX_KF_REST, update_idle, rq, cpu_of(rq), idle);
 
 	/*
 	 * Update the idle masks:
-- 
2.49.0

