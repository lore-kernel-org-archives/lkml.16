Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9272C2D94BF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499007; cv=fail; b=IejLDPv2nVQSjcXGtD7VmxqPlbW9fi7Ud8MEvG/bulbhCEXVrif3Yl3MyY+UyLSpeX52jts3Oj/vSbqWpfSw5ztzJI1TNyYDQBPBflZzhllFCfr8z7OmQEE16UuZibSGaQSgROO0HeP67khHDyajDV6cmaF5/z6rbFw7/dXCoNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499007; c=relaxed/simple;
	bh=gfz8cPxLsCO8Q0+NdX6rUv2kTrqnL/2PeGfkThaiQj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oxry9FyP5pyQCmdKEDq4pUockCLnVKqZYvEjpnE3mZCsZkTd5IHooWSmfFv01gKgREzgk+JvqqBONmqPaZDO0di707yhcrkc80x++pWqy/sMNyxmhj2wBycZSrqac5+qInd71KKr4Qlp9+JC7fwpyAsRj14JklMzfKIu6f56Eq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eI6WGnYz; arc=fail smtp.client-ip=40.107.220.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eI6WGnYz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXboqnhv2l0NtEkAF0g5pmp2Bn3RQCl9ytD7rZ+XWL2OLqUw/yj8uAWShnJ/taPFR9ApavCiK9NTs7bcHnGp2NlgLTYq16DoqAJt7pf5OnCwZsRwWcPR8yH2VaQgUBXiW0IwpgT6jXua2alhwCzOWZYzjtwr0rQXoBKviPPPpYn/wXY0n01GAFG16PB4WRHTU1w8kNOiFFwphL1dvNz8J2brSJQjka8boLwd/p7ylED6RHq1VVOhwsoVZSZmgBKYtRNpHLaVlUxsz+1w5v0lYXmtElQtt980WtHh3rEsml/wFQrrJzoOQ2brwTTqLZKPXE/nACOJAZFsf3M+oqaKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItBKGZHIQ1wLL36XEvSij0W+oMka3MO4T/Suw8KCFTU=;
 b=Q+aJr/hJtYcHiVNsFcl5wIfZ/mUWOC3UZL4dfLQHchuCLYOiwCUubnS5cA1YF9PVYUIbJghbPcJ58JM4Gz/alRS7uJ8ZMFRJouNPP1UVHdVd9qzlKsMJKPDOWyiBpIwAYYoY4wkT0ao9/0G6sdMgmz6XV5Fe8NWzrbkkeGDIBEpS8mA2+Cb7giR4OB4M+qy5G2ndhzMIZDSEqyf3jop1BZI3Fb0+mugWWcKQP/AZCiMk8wMmcpwYrysnkzgJFOBMEpRpzd/JMQfNiJqmkdK+3Rxd+gklvr++AYmhf8/QF/hj1Nb1Jd6kAtNNQGXdxjZgvvoGYt+b3k4nJQYS9H5OVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItBKGZHIQ1wLL36XEvSij0W+oMka3MO4T/Suw8KCFTU=;
 b=eI6WGnYzmsggQ3iXrAmyJvbeQ/Xn6j1cJUV0EKyRwaQTacx4W60KO9aMdgROh9YWAbV/nVWaAze/0sbsAmi3KcF6r5oZ/GW1h+zrdLhllRenfALdX4io67I53mzPTCI1i0aYLIDD74TUINyiDhuaIjRupOlo6GT//XbZbeyPbvlfr+BL2Z5JDg56XYRLQmqOIypx7lWsoWpVurPY+MZwy/rAU0EMFYLgkKxwMBdDgpdjIk4Xz+7D6w+WeE+mvOOHzS54YZDt0UNpy72d7zBPItEtFuGNhTNgMmdg/842ADlzTT8847S8BLblv4TO7J8OlToWgNGzs+rgOFQ7apY3Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:30:02 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%7]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 23:30:02 +0000
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
Subject: [PATCH v6 04/14] sched/deadline: Prevent setting server as started if params couldn't be applied
Date: Wed,  2 Jul 2025 19:29:29 -0400
Message-ID: <20250702232944.3221001-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702232944.3221001-1-joelagnelf@nvidia.com>
References: <20250702232944.3221001-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe5be50-b631-4760-fde1-08ddb9c05e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OXywBdDdHMi1QbXoAFyYmtB1R0nOOv/wmoi3N4i6wwea7GMOII6/KJ7a/oDe?=
 =?us-ascii?Q?ZAmtry8pm9yI19svCJjncpTq1qRoay7jzuanOJJI/EwinhRZRZySz2BLo2zm?=
 =?us-ascii?Q?+12xvQpzI4Jp3fQ2HrlbKCWfNeRDV4SFo20q3YsuTY7behL83NQU18I0/109?=
 =?us-ascii?Q?v2vWm9f/YqFkyU51ky0zDSnuAE8d+CAED6jIUHmegd9I3SroyKhMbmg0tIfC?=
 =?us-ascii?Q?o/3GgiXJJwSvtyQnD0lRpt1aH3AtmpRUymO0+OUlcePuwECUtPNWW88NL9sm?=
 =?us-ascii?Q?KSAXS7atdwQ3d6VjBze0bcFZAWeWz22SeMeZSecvP60rqqYiM0oT6iABJAGO?=
 =?us-ascii?Q?gErpuY6t8NwM+xcadUQ5cBdO0YpApXn2yVuf0jSft2qrsAupsnUYxv6fAgnD?=
 =?us-ascii?Q?dNGeIZs92L7PRMcH7qeUH4BLV6MwIbUbR1aSRqXunzJgCuxYpNRJT5Lb3Dlr?=
 =?us-ascii?Q?QXUA54dGHNvTIafF/3lSeGug6QXoCg2Ia5eXzUpNYUFuknrsN8taYZg1mOSu?=
 =?us-ascii?Q?dExE94K+HBmbq7GiKLpjO7mkNjBPgoDTwLxkITtzt52Ro7LuuqB1sxkNBL7I?=
 =?us-ascii?Q?NYdDEiHAwQzpUBOS2SRwTVUesXap9V/LR6uLCaItu+PKl/BEPpCTtw7jJB/y?=
 =?us-ascii?Q?wwh6nWElXW9DSmveZduRY6umzNkprkjYr1xqQ+BeaXRRywhMzTWUgRFe+ghf?=
 =?us-ascii?Q?yymfwTMN2y64y2Hl7fRRYK+pGkkehyjRjiEH44kYMjEf6TbjG9cYBmGSkMi+?=
 =?us-ascii?Q?uFJGoyxXkrpxl25MJfcJOuwhWTyua/EPEXOi68DxpVjx5PBF2u4o+kgtHjgw?=
 =?us-ascii?Q?7b87Nn43Bw3w16MJq/lAfMnrexjDwySnla8X3LxzPaVAO1PgjxeO2HJx6NkM?=
 =?us-ascii?Q?eLl036gXEWZ3pP3QGU56vSTAZCdEg7+HW4MpVHop7ymawf4//l2AJVYzzhGS?=
 =?us-ascii?Q?i6Lg+l0iAt48fLud7C8c1ZqgIJIuXKPSDvArWGWJpTteOh0qWcV8hvQcKqoh?=
 =?us-ascii?Q?V+u4butwlAdDfRhvFMas5D5Ppf9tMIBMwhrcmdzE9VOPgTKm0O8F28WEcO9W?=
 =?us-ascii?Q?myelw/4PXOtEHHIKENIoTH62+qYu4ceWMMX84RIQn3EX/mo6ZAqtIIaGy3CK?=
 =?us-ascii?Q?q7j0nCyDrKdDOmi1boVWGPMwdKm4LFOoav8z7Nj2Bv0XYGXzBKq8CWODBuSG?=
 =?us-ascii?Q?DiVIt4WzrOxgFloy5lgPqcqqYYQHt37K7jbS9+3uXwN9/MOaVtaLRCYYZDcV?=
 =?us-ascii?Q?BaIJE8qCwoZRxn9IkkqSuBKtxw9pM4blkKbDkUsPBJIx8WwfvXty5lGO9tgq?=
 =?us-ascii?Q?K93kcRxZafWKh1GOJbi9XdaVUPlEpR1lUBIiIndAeVhsh7UW+3bO5NIKqJMY?=
 =?us-ascii?Q?AtVxEB8Ooqh4h4zMDbmnMmzk+jvpSIJc+dFRVp9u0Wh+tMuu4oCJhlalfaFf?=
 =?us-ascii?Q?zhKAhjgFbw4VFIsitx83EMmNtRvAYt3gMH4VgRXC96E4MwKG+e5X/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WQHcC2G/jd0Ac1ypZwhouBqyPGLKGQKhRPy1hsJhKSEDYVCekO/JWOz8fa+S?=
 =?us-ascii?Q?bcQQxgdhAcIFzvMHLqp0b5DRWVFA6jWGqpmoTbqbv791J/Jpmj4wgfG6l3C1?=
 =?us-ascii?Q?c7hjHphTLlqMHP1w2W84RdhOLOcfpsXRj2MK4lv0/AMFojhnAfRyY0GJuCcI?=
 =?us-ascii?Q?aU0CMFjFCpt8hneHWjJ2GWwipxfNhPmArqUpmtnyrgeCNhHFE79QftNia65a?=
 =?us-ascii?Q?Z2IXOBsB0wlyi8M4OOMRB3w1VAbEj5QxVd7a8y1Qj4JjLZXq738S5OztEzGC?=
 =?us-ascii?Q?izPDFj0c8v7UWAr1xjIOSZzQ2Ewc6TgMVb0cTuBwfjVfRdrc8uYdQBv0NXEK?=
 =?us-ascii?Q?bsJ/u1PGaC98XjUmddQPt8TPW2AUoPP34aWVBThXrVG5N07GFNXxA7cfQol6?=
 =?us-ascii?Q?SFgbadgO9rtJ278NXUnw1fjdSUZxcOxto3M1dI+BnxGGI4HZl93S4X0wicWn?=
 =?us-ascii?Q?qIyrNIQmPKkbb/gVeATUr0RxSgd+ix04QdtOY58wb+PFppPNCXl7otOK5v5V?=
 =?us-ascii?Q?wxxPRNFUfqLbXFIyjdq4oUfM9JU3ZxngnzFK3sdA8nUhUmxWuhaCMTad7Xk0?=
 =?us-ascii?Q?D6/2gyf8vWiDp2pEGKN5+MjT8lRIw/XoPL8kabM2w8Eu51fNZ7IWrVBjPGdM?=
 =?us-ascii?Q?8vtg6xxj3JofxtZU+z978g3XGspl3stXGNiR8Ie1N1ynte4Hqo37kuf7BrrK?=
 =?us-ascii?Q?itsMqbgb7Hpv/UZSQTit6GFlFTcdfqGwsFoKvOdx3cdGSf2sLaiWLrctOXbT?=
 =?us-ascii?Q?quHDbXwUeyhMgRsHRIiqHxyMQ6Dq+CFOkfoetxBjyfMBopF3ziY0/drQZ8Bt?=
 =?us-ascii?Q?4gyj4ekx1WWYEPuka/99VVG9ubSiSzYV8bJKOvq1FU5kE7zx2ehRBmOMyIHG?=
 =?us-ascii?Q?xHsNutlaRk+bUdBqVB1SySqM269R5ExRaNmPhCwnC6UbBit2oF3J6g2NbIW1?=
 =?us-ascii?Q?s7soW+emU7DdNJ/cs7RnPjnOlkPPBky3LRzY/4xfRAVdq7+Q2Q0sE09266cM?=
 =?us-ascii?Q?zHnffopHE3iaJeI2cIknSxQtuwqesIkcYnO86bieEd342/oINoJNUxEmSJ+l?=
 =?us-ascii?Q?AdyubvJ6hPBwkpXBR252eml2ev83MczUaTDymyVZsWpzPA7YXmVR1NHHSVld?=
 =?us-ascii?Q?cCZeCZ4yC3wcxD7NIde3jRT2JCQRVE3puq4NJyISJ5f0Sma09baJx9U5uggC?=
 =?us-ascii?Q?Q2U+0sZ1Ol0L3OHAruTfcRDQQvQdQ5r+TfougumAkK1xxSLpAYJW4nuwCRqO?=
 =?us-ascii?Q?0Mv2tSASlvY3VbmMRdxBvu62WiVuUoWAECcg+7Pvj+l9OAyj3lSTJGfn9z7n?=
 =?us-ascii?Q?bTORbrzjV55uHSL6W8NYy/NOFw0SoEvGhSQUqDnF19YMT2+CgRY7NydS85gz?=
 =?us-ascii?Q?cs3Q1u82kjGtXvZZPc0xhfSYE5GmdviGfK3Hd5IVwouUvD1Mb4VkyU2c7nQB?=
 =?us-ascii?Q?yRLaJjpvsyCpHue5pA617p1U7eynvQxpSnV22z1VXKXVhFFNIq1SbFapvc8x?=
 =?us-ascii?Q?0HlbUSWjRpahZ1xme6QrjXnD1sOgsoMEKMq0p6S6kyDP+9M3itFZb4y2+no8?=
 =?us-ascii?Q?3qRBWb13u1DSkvs4hi/zcxVjqTkCWbKOb/z2SSw+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe5be50-b631-4760-fde1-08ddb9c05e86
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:30:02.8430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtLCrxChTfk3KyqVZBZ8Llwkk/B2oJ5cClCzXC59yWiaQBF78bxJzpcIScJ1qHILoeUVb8YHln9pLZEbl3gHIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

The following call trace fails to set dl_server_apply_params() as
dl_bw_cpus() is 0 during CPU onlining.

[   11.878356] ------------[ cut here ]------------
[   11.882592]  <TASK>
[   11.882685]  enqueue_task_scx+0x190/0x280
[   11.882802]  ttwu_do_activate+0xaa/0x2a0
[   11.882925]  try_to_wake_up+0x371/0x600
[   11.883047]  cpuhp_bringup_ap+0xd6/0x170
[   11.883172]  cpuhp_invoke_callback+0x142/0x540
[   11.883327]  _cpu_up+0x15b/0x270
[   11.883450]  cpu_up+0x52/0xb0
[   11.883576]  cpu_subsys_online+0x32/0x120
[   11.883704]  online_store+0x98/0x130
[   11.883824]  kernfs_fop_write_iter+0xeb/0x170
[   11.883972]  vfs_write+0x2c7/0x430
[   11.884091]  ksys_write+0x70/0xe0
[   11.884209]  do_syscall_64+0xd6/0x250
[   11.884327]  ? clear_bhb_loop+0x40/0x90
[   11.884443]  entry_SYSCALL_64_after_hwframe+0x77/0x7f

It is too early to start the server. Simply defer the starting of the
server to the next enqueue if dl_server_apply_params() returns an error.
In any case, we should not pretend like the server started and it does
seem to mess up with the sched_ext CPU hotplug test.

With this, the sched_ext hotplug test reliably passes.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c6da2d51667b..7129b61d548b 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1656,8 +1656,8 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 		u64 runtime =  50 * NSEC_PER_MSEC;
 		u64 period = 1000 * NSEC_PER_MSEC;
 
-		dl_server_apply_params(dl_se, runtime, period, 1);
-
+		if (WARN_ON_ONCE(dl_server_apply_params(dl_se, runtime, period, 1)))
+			return;
 		dl_se->dl_server = 1;
 		dl_se->dl_defer = 1;
 		setup_new_dl_entity(dl_se);
@@ -1674,7 +1674,7 @@ void dl_server_start(struct sched_dl_entity *dl_se)
 
 void dl_server_stop(struct sched_dl_entity *dl_se)
 {
-	if (!dl_se->dl_runtime)
+	if (!dl_se->dl_runtime || !dl_se->dl_server_active)
 		return;
 
 	dequeue_dl_entity(dl_se, DEQUEUE_SLEEP);
-- 
2.34.1

