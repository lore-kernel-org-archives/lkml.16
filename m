Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF932114
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749115846; cv=fail; b=IxVOKh5S6xsnzYYTip5Ar6292ve032OW58P0SEj47sc4RDVzNQE8NXvX0uvb3g7Pp4RUi9L57jMqdY8XFtMi4nj8qg335HzE+7wvOdTL63uQjFsNpglrMyFjhM0exsqB4w1llLi60Icxv5KsSeSjGI+ZVclhf/WYDyeydDro22k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749115846; c=relaxed/simple;
	bh=GkrfyhpnUBdyQ7yc8/lQ4Fng9Pq/ngMDcE2bywmg8a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dyUYS8tj0JKjqskyj0e9tzIHLje3vS4lFD5wod4J0cg5E+eTLl+mH8o69T1pasikYYkPBdEokowvYzHlP8kR5upREr39rAa02fIQ9thIliLzFpkF9iVqkSNp++bR3DbmzWajPTm4OrhoyxMt3J38GDPNTUpUX7mxqvSAJ/IM/Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bnM+QyWg; arc=fail smtp.client-ip=40.107.96.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bnM+QyWg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4okA3rmB/2VvIQMmdIS5blx8mfbuR5c1igoBVTXK6Px1pOT84RlGsq7a6PVqCQ6E4X12E/AeMfkqdGKvH1NvoKguHT7racPonUhyUamoGsb9lpAOMWpHvwmAFY3/Irn/eFZTTojbIm5OjFfDbaRr5dOf1L4bpbfLQai3QCtv58bIxOeT5A/XcaRcQolBn5zn5f/7zUeVSSAtYYCmMKcH8RPzFWqVyUkWqL++JqwYWvINN9zEsJusc2MU9jxYGunUG3dC+ff+5gVgtKTd7pXmvQ1NcEUqvffcMbHJwJTnwP3Ejn+7qHZTxKUBNC0Rq2a7F26JNDzRWnCg44GYLqTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ/Wh7t4mWTrwsKwRE4LF33IXVKcAGe7LaKiVCoQv9M=;
 b=yXJJHPypQ8gMTwKRECigx+EEMLIXEKsvCTWGI1o68Qu1u/egHKT5vy+QEWvxe5gWNaRFrZHxzPPY7Smnu5GvUCyI0TCq5Phn4cbzqdRHGrdy3G0t0lp1B68ZcmQ58iTxLVFw4wS8lEbl9YeK8e1LGIU7JFosfOtO2uc+7HmmuLjWAjjPNVJrQiEaeSA8VHopMImmllTQbc8d24KNXOC4O3Y+qRmQ8wi/Q+jFMTeMgjpsUJ+q6yTSJ4VMMvTdiaDdNzwlVajZ2NGiySPE0P7yep5N7lPDPZv7eDXB62pXICP4oMUfqz8PzxttIipmjUWXBObpOlR1ytfENk6JsVJNSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ/Wh7t4mWTrwsKwRE4LF33IXVKcAGe7LaKiVCoQv9M=;
 b=bnM+QyWgEQU/Rl0TQVbk4pquNs+9Q1FtBlQfzJa+0RsNveq6cWGBIaT+i2sia9b25Z+Z5N+LU8D9zEDVKLaAW3FA/0egseAroEziazCHfLbbGd8SbCt+e+tT7sNmqYYS+7qh51tHOYqZNailXENSiv8bdF+/ShT7dBHInux7kYZ56mTJCVPcEznfSHCbfOP3Bk0crt8sLi0HSA/FimqrlnIXnE5xBKdPI0AQmqqB/8PJFSK+0dUG1fop+zJ1ZwHkcckRLnJuz8tex2QpAvP2jGgOGTx5zAoUf6wmN3pr62p+N4+0kIwaZ54eesjc945CyAo3pjMpDweomvJcVqy3ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY5PR12MB6057.namprd12.prod.outlook.com (2603:10b6:930:2e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Thu, 5 Jun
 2025 09:30:42 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 09:30:40 +0000
Date: Thu, 5 Jun 2025 11:30:26 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] sched_ext: Make scx_locked_rq() inline
Message-ID: <aEFjsrkVAIskYJq3@gpd4>
References: <20250604143547.708202-1-arighi@nvidia.com>
 <20250604143547.708202-5-arighi@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604143547.708202-5-arighi@nvidia.com>
X-ClientProxiedBy: ZR0P278CA0149.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::11) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY5PR12MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 967be69f-3a36-42e9-9703-08dda413a308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6xlQw1NxWeT/AO7PB0O6fjGn0kRR6NQbBA8wwLsNdxa8NiwUrO+u/a6kVau7?=
 =?us-ascii?Q?JnViOMsJgb//KRfcPyjA0IwSF5jpfcTyJ437PtNA/rYqj7UIRQEA1K0a2fT+?=
 =?us-ascii?Q?2n+j2IuFw138FVXmgSfF3v1hWqiffKPQBDoRiFngmwYTp8N6hXrTWvQRN81f?=
 =?us-ascii?Q?XkzU1zvQKrPAYBlnI7oDM7VdltuyAwYFACwuskXFcLEv2L+lEk3dvbrSNb2p?=
 =?us-ascii?Q?FJ3/jh4qWoeuW9flJXI+Y2xOa4Adn/POgPKkgEYeDrVteRbKzW9Yj/V3iSZt?=
 =?us-ascii?Q?P8f+ztpZCCiFJfPwngBmfGNvJXIDE9MQeHaFFl0BXDJI5LNdSjLlrdGLsLv/?=
 =?us-ascii?Q?TeckL7CDD0LV4xbDPVbSIfx4DYPZBE4YNJAjzrD9CN6It+YzIiOgJfS2/1jY?=
 =?us-ascii?Q?sCpkD7CiCYtkzFgEaTs2b8JycuqhZ6n5ICqQ3a7YsF8EMUQfRgTPWxKxhb0p?=
 =?us-ascii?Q?9DAkrs7uMCaRxG8uDQHLwYgPnbr94BywVTavWhuBwMDu30OzUCiAEji6vHh1?=
 =?us-ascii?Q?VbbVDxDAipxgHBo/fuqCigoKPGpq9qyQNmtSh5795leqToD6Y8VD78QF6V+X?=
 =?us-ascii?Q?+GcxNnYtNFFy/PiR7LFpnBEz/xL08OtKJW0I0GGwwPrmdeZQeo9icJWaEhUA?=
 =?us-ascii?Q?SykBB/XlW6pDREm8gUx/L7TC57uLLrIgfBbgNnok0VxZqrKJDZokByq7Kk2p?=
 =?us-ascii?Q?ZeU5V2H/g7NYINZDKe0Roc2cvO6JD/r33FJOqblL9WnITBPitBRlm39UC1jY?=
 =?us-ascii?Q?Nhh0UKVXDLM3/fqLVgT1xa37jYHCZR+3YhBNHTPsaj1sRDS6KauWGmG61kVY?=
 =?us-ascii?Q?YljjFk1+pJlOJKnfhR6YSs2gww2RgUsZVh8drkSlsNNXb/rNwBrif6TQi2OU?=
 =?us-ascii?Q?/EEOJS37Bt8dbymEBP/dSyfOQODw0GovpJNnaJPSp+71NZmpaF0debV3fRp/?=
 =?us-ascii?Q?zksf7O4Ro0oPll1wfcu8dBt8sNfZB2WCS3o9MUaFK9dTxuH+kWXFuxdpNWNT?=
 =?us-ascii?Q?d+0WJ8EA/+ALIsh2/0DvQuN9AuWOpuZUshpNuOvf+cM9/BJXSzfWmKxFjb0i?=
 =?us-ascii?Q?3sMjNVsr/fS0BtDIL/dCRXqoxM+tzv5B2rui3J9fQuaxesxmLrOfPjwP9V/x?=
 =?us-ascii?Q?w2WJcaMCOeNRadEVg1WBEQ8v3xd+OMByP89NlJhvY9/RJa9n+Aa/xAd14rAr?=
 =?us-ascii?Q?RHRO0gvkPQfKLfEndbksl2UBKs+ORf401P7A9OxX/MuOLz1LSVvijwLOP62P?=
 =?us-ascii?Q?zL9QBkXkBsNHkN9dwHe0y5VtK0lT3Y+0hzfiX16jJhIC5Amp98Vi8HJViNdy?=
 =?us-ascii?Q?siH4XJQ5q9TkKEnDxKi2+zqa+FqdBW9Ecg2CJ0NL9N176AdAAq10xcrDDqtM?=
 =?us-ascii?Q?UH7LwADgVFzK8qNUyPKzt2luzdTLQy+PD9HwldYOPJAcgF1amFWII6IvDaV2?=
 =?us-ascii?Q?YqKE+CIaqSM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qP8BH7P0VAPWym1EnSgOOQNvb9yMeT+6n0jkLlvgAjoVWK6vJN7IWc+EBPxu?=
 =?us-ascii?Q?ztK8hSTv1Ve+DSkpT1fvXFrt1yMXpmgxOusPSEIJDvjFF0afsVoJ5Efcc8JZ?=
 =?us-ascii?Q?kr2rwePwS1ThEYEoVBfTbFyLsx3+BdHy1d082HAHA5Jd5RYBeYalBnOsKnbZ?=
 =?us-ascii?Q?a3gv3S6Lc3XS+jqt5yOHZEJv67PfdI1HJCvdOn7KQpelgxoHh2hGGN6HkHcS?=
 =?us-ascii?Q?5qcr+iJYmUzVEq50BzEN0IeNkhIas5QanJO4chs3HNHt01APv+1oUwzABopF?=
 =?us-ascii?Q?FmTG5istxvUQKD3rW4HKb2i8DuetSykrJSn6FiIYaURC7JSfZEb2xniNOzG2?=
 =?us-ascii?Q?y+8+12OtFS6W9Qw3QpghV4gBpaNRyMbyurMbuU+Yz/XP2Hk/cxn80m5xUDQV?=
 =?us-ascii?Q?cstXni+Y0cizVYBhwWacw4R1dN/GsyJhYAcwe6GbhQZ7DXbpt7X0pIdZuheT?=
 =?us-ascii?Q?fr1WYo7nQb4J4YFjumFULlAAdHdkHLFgQCLvd4mAA5X+me+A4D67s48S4bbx?=
 =?us-ascii?Q?xhZNYGHTL8ECU4VnHdsH54HZ3NYOZfmugLanIskkhXiBPuDedbfw8FAtszMD?=
 =?us-ascii?Q?xKOKEWWX8GtJVC/mGTiqDs2m06wDHlqYVoE5NSceDiS3tLBPs06MbLPc4MLc?=
 =?us-ascii?Q?eMGE2fMO1n3omB9TfTsmZnySE3oFD7DLxMJQlVJ9Do1f+QX+S1VRvL4T20F+?=
 =?us-ascii?Q?j6lP2jB0eWaLIy3BBiW1AWTOgQaV23Y8sdjJ/E4WMx2WGes3Hu+arWAkTxoQ?=
 =?us-ascii?Q?Fmd3oQ2itc4AghY938YojgIf6Ct3H9buCLc4w552+WJZQdTNTQ/u146GX3Z4?=
 =?us-ascii?Q?4AxvHec5wNWezZU2IVpUz2DCv05v1AeM8SL9InGc4Ej0w+5r8NictUKRtgtV?=
 =?us-ascii?Q?xrTEtt5XNFar4o3Kf3YQF2WU3/ZYm15m+BXIFIZZ284AM6Odd94V7tP4qGUF?=
 =?us-ascii?Q?TrcvmE05fcFooeae2Ssv9tHT2bei+tJtw66f7jVzgsMd4n/E6GKo45kJgUOp?=
 =?us-ascii?Q?xBPEq3XLTetFUG6PEsWKnyTzg3GBKIkrUiWzHU6N3v8w0rhllFBV3rXT/RRA?=
 =?us-ascii?Q?Lj8zvq8rchJqaRPbwWQMtR7FutEInT0t5TyQpdeSBwkT0FMHKVWZXGEF0Hwy?=
 =?us-ascii?Q?GxUKL+yIamU+gEohl9RPH5IyUQqpoMboD9+UfvD6FmfayY1YqK8Cy7HPBjaZ?=
 =?us-ascii?Q?XAN0wtYJRXktQ75wqwNHcLuyOJD5vVIuBgspgjOJNH3jg74siIraaOMOiZXy?=
 =?us-ascii?Q?F9XQFfdwDdKh4J7Bj1U9mT6mOUjYuIxTBBES2PV1hsRWplBrwkxKxprM2i7W?=
 =?us-ascii?Q?/HDhKQPNdzJqLGdeozmV8yEr24EXK4FU1hhyju2hHfgJBrYm1WJ+r2zsyBcU?=
 =?us-ascii?Q?Bs80gpYdsZaYlE3iCWICLZK3t2Q2aui0e59qgf55q8XGROkz15iw6pHGMkeC?=
 =?us-ascii?Q?Sxw4K4e5YMiJsed5Z+tKxV0xDgzf47uubWTG1NaZplDx9jeq3X//Q++/ZK4q?=
 =?us-ascii?Q?i4uSOOqD09qvrgXfZqop0ya6uOhuUalVIJ8qYPTMlxzHgXF8Zcytu2eNMaut?=
 =?us-ascii?Q?OArMGf4UzESAZZdJEW61eBlg4bFqXR8GQ2bWec2Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967be69f-3a36-42e9-9703-08dda413a308
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 09:30:40.5222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7cgjgZTLmqAnmjJsrk2tRlUGjGM62Y52K4kFJEupzkX1dU9xfMEvl9TPoVAHojep9KHHxqMpOhxnuJlLKld1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6057

scx_locked_rq() is used both from ext.c and ext_idle.c, move it to ext.h
as a static inline function.

No functional changes.

v2: Rename locked_rq to scx_locked_rq_state, expose it and make
    scx_locked_rq() inline, as suggested by Tejun.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 13 ++-----------
 kernel/sched/ext.h | 11 +++++++++++
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 3e483138dff60..3623ba98d7d83 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -1247,7 +1247,7 @@ static void scx_kf_disallow(u32 mask)
  * This allows kfuncs to safely operate on rq from any scx ops callback,
  * knowing which rq is already locked.
  */
-static DEFINE_PER_CPU(struct rq *, locked_rq);
+DEFINE_PER_CPU(struct rq *, scx_locked_rq_state);
 
 static inline void update_locked_rq(struct rq *rq)
 {
@@ -1258,16 +1258,7 @@ static inline void update_locked_rq(struct rq *rq)
 	 */
 	if (rq)
 		lockdep_assert_rq_held(rq);
-	__this_cpu_write(locked_rq, rq);
-}
-
-/*
- * Return the rq currently locked from an scx callback, or NULL if no rq is
- * locked.
- */
-static inline struct rq *scx_locked_rq(void)
-{
-	return __this_cpu_read(locked_rq);
+	__this_cpu_write(scx_locked_rq_state, rq);
 }
 
 #define SCX_CALL_OP(sch, mask, op, rq, args...)					\
diff --git a/kernel/sched/ext.h b/kernel/sched/ext.h
index d30f2d1bc00d5..6d6d00e9de20f 100644
--- a/kernel/sched/ext.h
+++ b/kernel/sched/ext.h
@@ -20,6 +20,17 @@ static inline bool scx_rq_bypassing(struct rq *rq)
 
 DECLARE_STATIC_KEY_FALSE(scx_ops_allow_queued_wakeup);
 
+DECLARE_PER_CPU(struct rq *, scx_locked_rq_state);
+
+/*
+ * Return the rq currently locked from an scx callback, or NULL if no rq is
+ * locked.
+ */
+static inline struct rq *scx_locked_rq(void)
+{
+	return __this_cpu_read(scx_locked_rq_state);
+}
+
 void scx_tick(struct rq *rq);
 void init_scx_entity(struct sched_ext_entity *scx);
 void scx_pre_fork(struct task_struct *p);
-- 
2.49.0

