Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2111.outbound.protection.outlook.com [40.107.102.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D911A23B1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751877454; cv=fail; b=s6LnCnS+ZUJwg3eLoiAGva8D133J/U6LMtNsOOuehsB8HnBkU0QopunMWdMlsRMAuwVdXW42Nm+Zgpl6xkfPT3ykk0BKKee3GeA8U7pALukabTSWLfaz1UE/vvBFEPDB852DM6a3CJY32fCWLFB7zEuCTfVaO9+zot/c0SekJvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751877454; c=relaxed/simple;
	bh=+VT0TnIClfj61i3wQgLSUpaJYN6D1KFhoBFT10a8pJA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pfOvUb91sVL8Vw4TxJMLaCBCmuwU0TERx6c00B4nf6dIrvhrprJRc8ZCwhm1inoEBRBvgEprcYgyXuHrah8BTawgSb7FcKsDQO2seloXEeB2XDyGvpevZ5cVkExk295zrQY9kNq6Rnts9XYB4bSKrkeXQbm8ES8B2aM6XZ3DkeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=SY8E4J3g; arc=fail smtp.client-ip=40.107.102.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="SY8E4J3g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdSGpa2w3mq5L1ZME6299GcLZ56nteVu6fzYpV9CSem9ZcLBTn+A9lkNH1rQCCL6Flg/H1ZCPvDgdyhNhEm9kRb3sgN1a4DI6eADIDmSEob2+RpwFF6SoWiXmvyGj0ECDsQz+39ZuWU7PhtY5T1z+7a2uLeMvSiCNOXS6tSxiWWJvuo7MTn5ik+iJ8l+mc/MsCSckPZvnenqLPcOKflzfe0FPq8k4JupeCJ8mP6cZ02/vBhlHIjJWJDfUqArh0WQjzkCixSZSP594gi0hZ87Hz5LSdbRBWEcZdz8WuQVe8L4IyYgIfzAVDe3f+eis9nBKezT8sD4YCF0EfivZCQgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLjkMqdgyqyafDFX/F+scO9rPMXi3HhojoGQpd+l2fY=;
 b=WQcE7MRPXaAFCGk+duj8XnenYVfJZpszLoMwQjD7UGGyxsoa7MwLQH97mZ/ONl0zG54vf2IL+XQ+0h+35SMpps1O7y5vfgVpeq15heMeu2guKFVatOhgm9UnEfZL4itrPLsmO537KMSloHzMUM+Zj+n2FABYSNPPmL37EXoLxnFuAzvihZcsuzBcljY5Ks04ojj+KmZ1xHQKnouixOFriyDEmuFAGpXcL5KsBPuWrAd9u0wLZTEUYQQgBf43gQF+7FIbH4K/A9ETNsSQB+PlZSlrDEEyvcqfasmvaM1ZfIC4NtdJbMZW0PfMm9ezpUomAoFyWW+b9+acUCNrZNWhrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLjkMqdgyqyafDFX/F+scO9rPMXi3HhojoGQpd+l2fY=;
 b=SY8E4J3gD+QB8kPh1e7CX7Bg54P6xRZ7KwrmmejXRLaxG45wwmGUxW4SqYmWhJJZSFyDbGLNPo6RIY937zXHcsDIdIxJB8hF+sAevrODTDQiZ/81kktckX9f8avreYA0xx91h6pHZO2J9dNlYoscwSU42IZSnZEEYjQPMu11Q1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 BY3PR01MB6547.prod.exchangelabs.com (2603:10b6:a03:36d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.27; Mon, 7 Jul 2025 08:37:29 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%6]) with mapi id 15.20.8857.026; Mon, 7 Jul 2025
 08:37:29 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: patches@amperecomputing.com,
	cl@linux.com,
	Shubhang@os.amperecomputing.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH] sched/fair: do not scan twice in detach_tasks()
Date: Mon,  7 Jul 2025 16:36:36 +0800
Message-Id: <20250707083636.38380-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|BY3PR01MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b06803-c2c0-4468-5437-08ddbd31821f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R2Ok4ZbRQ845M7VXTllTU6xmd4qo5Smj4NRHJrpH7yswKxQG4IglC+/rSToD?=
 =?us-ascii?Q?7d+wqMzFnap44xDtkvVzwbe1RKWya05u/W5+rm8bVQzZdVzJu3WYhaH+roZC?=
 =?us-ascii?Q?dCU9dG+Lm6+OwFlqlKvM/fCD3vbuSXUqmXrFoaiC5/epk4Os2gDUCgspHeVE?=
 =?us-ascii?Q?HbRUd4Mx63yRf4inBvN+TK9EtWzw6JkyAvrTEqWBznVlsymflrD/z28Qn1A+?=
 =?us-ascii?Q?5it2hd9bDcGQYoJ+GXdT2HL9qCaUtRXTByJj1gLQIH594xbjleDg4Svjrhjx?=
 =?us-ascii?Q?VTL8+et11ySZY08WZnuJXL38h3TA45aC8La8xW7laHtHrPl0m9oSbMWMBuTI?=
 =?us-ascii?Q?BVacTbO/Rc4wCH8sjLS8kb8cshlwcEJdA7il+CrV+HiarLrcS27EMK7XPebp?=
 =?us-ascii?Q?jt5tBC7wO7NQJlUw5KwgI1LZ8yCYaNPTAG4JILSHl6lUk+9VwEKVRj7+44PF?=
 =?us-ascii?Q?OkPmBamO/jSco/WKjefyfyoRNHb2Agh0IMwkzS4gKFJz3xHyZ3ygn+4yG0NF?=
 =?us-ascii?Q?36lMuifd6DRAcxiYBY/qKKw6QJzTuXk9jZUTmERhSHFkdMJ+Q98Yy/5d4/u+?=
 =?us-ascii?Q?TIgfHSvrHtB0pUqo1VmbSV6cGZAyi+z+SyVLznHkCtW8/L0E/n0MbE9lNGl6?=
 =?us-ascii?Q?saJsl0+3/JuQAbym7DBSpW/bPyy/Tiq5VQjoFVgpkEXRh/bBe59TNm99M1KQ?=
 =?us-ascii?Q?l9aVyE5VeVmT3zzM3mkYngMYOfKynMPS1VsOboFVkMvqrBuLNBpWl7PAerMl?=
 =?us-ascii?Q?/M6NILzckL6nuLiZO8aWcAg672mBBLRB2GZL/TQoG2BLctsnQMPUqlNH1K/e?=
 =?us-ascii?Q?uBOHaEua+ZC9ebBrFled70HzzlsLRGEH9HZ7nzr8cD8hk4yDnJrPJlXs6Qxl?=
 =?us-ascii?Q?qaKy3PNMHzHd3TVMNfOuy3JbCzqYid0drTIB6hUt1NVdoxKOqtTQLXTHuJHR?=
 =?us-ascii?Q?9nNvhO2myOfC92v+OfVmVy0PyhysIjLwFsm9ptB1ki0T3fQjDEvd1jMXSDQo?=
 =?us-ascii?Q?kdQd2J1vAfokQelFzPgHKB3NDsJHCrzwl3bf1/W1ReaLhG+6L029WR8FNyBt?=
 =?us-ascii?Q?RzvWQDZq6c7HEbNPCoa+HYGpXmaMg6d43IERyQD1hDORRbf06BvWIjTv1Nxb?=
 =?us-ascii?Q?YjuXFB6bfQ/hbQoS2ZAe9g+719m2U7hPjy/7MfIE/I/42UeF4w5A7RmM/6Mq?=
 =?us-ascii?Q?Lm500mvV708H/05n2awUHPSkXOIRT+ZYCN7kQ8s7TPfmdZuKizpDLOhD1nyX?=
 =?us-ascii?Q?Qe06HnfuhbbFKoUY2hYncL6O6z0yHSVVAcDCSFEuA8GcfWSU7cBgsd2EX1yd?=
 =?us-ascii?Q?getFVnAYt1GfhG6pVCPNQQq3VRNol2c9woq3px48t2iRkEuw1qvPNxKhoMnA?=
 =?us-ascii?Q?jJFW06Ph4Yf+gLQimhxu+E0B+CbX8QDcMpTNUQe6hitNMcks8+oUBou+eC57?=
 =?us-ascii?Q?ZchVIln7zoiRjP4YkqvJ3nDvamWkgAcJRZ4sG6XhTZHZ13tSYNkEeA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t5f/0rJHLBcXUMTtShysc5kRolXN0J2BY5acOMph72H/+T2wxgj+IB/VCDvz?=
 =?us-ascii?Q?OmgeTsOXE2/SyzqLxuvwv3r8WrlkO+EnSxP33lTT6arkkdJNC2/2N+Dm+4KC?=
 =?us-ascii?Q?yFZz6HeGWZLppsI5WV2GKZOqu8BqyAoIH9wnLab8aoZ3b4UtivLvQHv+ar7P?=
 =?us-ascii?Q?u90v4rz5hf6/LJ9ffhCRtjCu42ItAHxwl/2syQkQ1hu7FZc5E1WRNKkgaGML?=
 =?us-ascii?Q?w2UWHFF+myHwE8c2MkSXtt6MEIqrA/IUuB2FrUXrKOQqRRQQVQPHf9npUJys?=
 =?us-ascii?Q?+5Ht3kLEnvxTj4q7IBUo90jIo+ZTQIJq7EyJ8Ua0FanwkrkYJopAm2P1yLlC?=
 =?us-ascii?Q?/LRNA7fvXGIDYsYeAFxZkz18gJ8LXoD/PlDIOOagbsnPiD2yEbCESwMgl7ek?=
 =?us-ascii?Q?mnPTFquQAfJawopu9NIlKiA1lDJzlCuYBzUTshBDYlpC0MvtwCqp91ZlZi/b?=
 =?us-ascii?Q?03KjuLNamQu18siBZrC1OzpNriMgV28YihilldF+1RPU1f5dO+qWSlCDy/tO?=
 =?us-ascii?Q?39owfG3DDDq99EJt8C0L+seZjVLFAOihIDW1Nab5sRvG/zuHOkDAzmKpC+E5?=
 =?us-ascii?Q?1tNx9Wx0xSkzOK9yMPdhjEruecBs8iRKmCOxGknoBxFZmg0I1/LLjlR9X4ci?=
 =?us-ascii?Q?0ad13FCNiFZfyuKZqVyrmJZv/ULGnUjFzrxjNjHItk2EMpdr92B1svDDxiCN?=
 =?us-ascii?Q?KCsUUOQgcysIFdid+DAiQwPpjXDWTgO3YLzwwIoFOBmZ156t5HCMslkjPd24?=
 =?us-ascii?Q?1pI5NFws96zKbECLUlojnFND17N+qIHcAQ2RaLXuF9BNqfc3xZ7MaaUOY7EP?=
 =?us-ascii?Q?G2ffX6PRbj+ltrxNyqJkgLyFl2sBx9x6oDxec6RUfKCoYwlZquxZwVWcQuOv?=
 =?us-ascii?Q?6sOuoHtg2SGiJR/hHkV000gIwbCRITjYBbP5+qEKyXyEKpKxhDZK3z6bPyJG?=
 =?us-ascii?Q?Uog4lHT5jtC3cKcGiVp6kpRCAcq8YClENqB1eq8yCyBI4CBEIeveONcAJ/45?=
 =?us-ascii?Q?FGYj0lOXHA30ZqjGsqwKi0E+9VXOERM3ohAaLjZhY6VjwN7ju8r2dNGZpPOT?=
 =?us-ascii?Q?o0/OPnO2zMpcMVpCZv2wf6DMpIpBUJEfr1WcVcxOgMWyPVY8ChjY1pd7eIWn?=
 =?us-ascii?Q?iRCu/Ep8jGgt1An2Ng0b7RGKjNRzQBW+2HTbq8tPr5zDDDYTepWG+qaa8rpm?=
 =?us-ascii?Q?zpbqWrsIUU94JvR4rB94tajWeInhFnYT0vIENhUPN4TcaQ4XQfD7BLxxaSs0?=
 =?us-ascii?Q?ELpSnRppZ5ZerIn9uLgV2i5zc5B0+rxmtBd0LvQDj5leZo2BfU90xzp1jdJ3?=
 =?us-ascii?Q?CZpWF3kSqiSGNmKqEjGuVQ8XF7PWolQCotDuC/0dYcrbQ8yZrfweWIQOQWGQ?=
 =?us-ascii?Q?Vrx1OZCL03jgGaGU7CJFbXjHdm9ueh0XDxExMpHiF3U2R3SnJl+zpsT1fzB8?=
 =?us-ascii?Q?9kNwtJBi/kTk9TT0k7tP374ds6Rg3oqnCRpnE0FOq/+9dSTUZHakr1IS4Ev+?=
 =?us-ascii?Q?C1ZOYLiYo02bjanfMJpRAVTLP7ca2ObGeoBrxsGU4TiMvw6RJ4DJ5PLOXdt3?=
 =?us-ascii?Q?pfAOpSueKeucUXNJWBe05VQevwwvlg1h0mCJN4NpXRd5ZC5zTYyNHNYC8fm9?=
 =?us-ascii?Q?6kYZ9v/nCpVRWRmnKaDob0I=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b06803-c2c0-4468-5437-08ddbd31821f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 08:37:29.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVvihYaF+IkUZX0gF3NYFNfl+8/hGmA4ANvTdsCld6UgS5ZweQM63Aq4fXd8RC2JZXOrLsycdIS3eXK4VyVoncMLOnMSJfa0Z0NMt1q/6b0PpBsY5Jqle+rG3/W29dKn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6547

When detach_tasks() scans the src_cpu's task list, the task list
may shrink during the scanning. For example, the task list
may have four tasks at the beginning, it may becomes to two
during the scanning in detach_tasks():
    Task list at beginning : "ABCD"
    Task list in scanning  : "CD"

    (ABCD stands for differnt tasks.)

In this scenario, the env->loop_max is still four, so
detach_tasks() may scan twice for some tasks:
    the scanning order maybe : "DCDC"

The patch introduces "first_back" to record the first task which
is put back to the task list. If we get a task which is equal to
first_back, we break the loop, and avoid to scan twice for it.

Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
 kernel/sched/fair.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7e2963efe800..0e9c8ae68cc2 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9443,6 +9443,7 @@ static int detach_tasks(struct lb_env *env)
 {
 	struct list_head *tasks = &env->src_rq->cfs_tasks;
 	unsigned long util, load;
+	struct task_struct *first_back = NULL;
 	struct task_struct *p;
 	int detached = 0;
 
@@ -9481,6 +9482,8 @@ static int detach_tasks(struct lb_env *env)
 		}
 
 		p = list_last_entry(tasks, struct task_struct, se.group_node);
+		if (p == first_back)
+			break;
 
 		if (!can_migrate_task(p, env))
 			goto next;
@@ -9562,6 +9565,8 @@ static int detach_tasks(struct lb_env *env)
 			schedstat_inc(p->stats.nr_failed_migrations_hot);
 
 		list_move(&p->se.group_node, tasks);
+		if (!first_back)
+			first_back = p;
 	}
 
 	/*
-- 
2.40.1

