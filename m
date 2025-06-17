Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121F12EBB96
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190770; cv=fail; b=LeALcp4AzIrHPFruaDmekRjg5OO7bBlIXg4On+y+BeEikK7/uB5wSQCHSjqKCFAMY5A2f6fzBZeMvUN/6ayt+jmXwfwbMbT0kc6Pi5umAPwxQWcP6IpE1tfRB6iNeqwqf+3FTYR1DjaNFJhX3z7uU/jiVoW6Sm6MLGG2byqtXDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190770; c=relaxed/simple;
	bh=71Y2v1RwclRZXgycxLb/DtgjSEtzj+k7p11JV2DA/qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NjlPc86moPkmItsGictqcp8BXNqjif5nuo6ywYmuNg20XeoydPppQ5L6v+szt6uGzt2waoXjadhhDpqppCrXL8dY0ElEKVyj69aTJeHcMQ2M/6GS7+aFxW0aHDPlhnN//208jkNymC9bqMrNOdN+j227IW9Ip8Dp/5EzSIrp+H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JlxC5lfa; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JlxC5lfa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgNrxuPEQsMR2cuAFoHGHKHWH4I5ss8DTzCldgVj2oQw0JfHkho4Sde9fUL5wi5MvJps9og6ldbX/ejCKk/kM2FAjNzhPeMPsQ5Tgc2WN6zLwCCF4qwy5a5xZM/6jYB33N/CKWBFue1A5ZruvvEsKIFb+/AI5T8xuaBU8Zs3gHbP37rVoIjtV4/R3S0pqRuz30qLvu8NB6SvcEsdXiKBZ4oFp7KBL4q3NxZHdk/+L/DsH3CkZTsBUnmaiobnOIv7TxeDCEmq+dvwhmGXOSh5IW/Un1JKTlUQ1ygNn7RQB9mAP4HUdrC4Xi6e/nKDvQ+BctNqw5LlSHX57t9GLTFaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVYXXQ0mOalwdXZYENQE5dSrqd5z/3kvvDysFrqR09g=;
 b=oyLrV1dhdi/EisVHdVR42/Zq3LHj2ydWbjMPMjIodAU8KmenjfQI7X095FneNQrHVdxNFnvANlbyc+RoWLnIpVAwmrzz8vFdCk8cRr8m3fYjgTFxhTYi7KgzcUF3zekUgTKrDwbkftdVuzHIRN8Rx0jwuk1g30cxX/GgweKZzJqvXcwy7N6r7ATQfHXa5lJHxbOJHf1IEZ8D7eec8am9QmQWv6BpSKAhz9tR9ZABMAoEWrbB2PH95ryDglJAcxyamfoCvn0JVWCBSGcOQDYmebZRwvKh0iggrMjfDpevZ1k5zrA7TFlKVrMV+gdc3eOnHk4paNLLrVgQUTQT/K2hlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVYXXQ0mOalwdXZYENQE5dSrqd5z/3kvvDysFrqR09g=;
 b=JlxC5lfadPc7+9vVwLFBqdw+dVu55PyEEaRZ92TIDPsFw1Xmxcc6VD4QhBz9lfyajMYulbksWAQekESluxMIJ6KG6Dp25lJlQbzU0ZPhBJyjvSKvOaV9UZnDep5fQkbj2hS+GUGyLqU1dWVIbCeB6Bqg/8f4XlSbKHzYN/kbcPOkTKbjcDLGpKj8OEH2xVtZYJ64q+Hn3lT2YiLCOAVQXiDlkPKGR9qSX+DOD44HUzlRWa5f1n41BzVTD9NYFQ97tD2FRegOncs0c4ZBJ5dysTIGpwxVmFFfajVsw40JsorO/Imsz6zXnSo2n+ySQ8QSgTef2tmCvOHGMJi7JCzR4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL1PR12MB5731.namprd12.prod.outlook.com (2603:10b6:208:386::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 20:06:06 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:06 +0000
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
Subject: [PATCH v4 01/15] sched/debug: Fix updating of ppos on server write ops
Date: Tue, 17 Jun 2025 16:05:04 -0400
Message-ID: <20250617200523.1261231-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:208:fc::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL1PR12MB5731:EE_
X-MS-Office365-Filtering-Correlation-Id: bc614784-c2dc-4334-c993-08ddadda64a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gX6RiSVJ9DH0vd/tma+K9x2b4b8wAx4CU2eaaXQjCn9YsHtSWbTfVS5T0xfY?=
 =?us-ascii?Q?G7elSZcYNyRhsOa3pdqPaKITNeDOdOGc++wNtCbcd32yfyQl3drtkWd5KNP4?=
 =?us-ascii?Q?dVgSQjTimd+logCpqcoeZXeK7hsHBUhpw4bntuuVaWmpCNgp1BURM/hF2VgE?=
 =?us-ascii?Q?L7dbKR7QdO+6e6OgAWgK4Kz7HH7ldI4DcfhXXBOl0BSxfsMTQGTBs1/6HiMy?=
 =?us-ascii?Q?+aE6CQRGtJURadr2SmeBIwl5uWOdOC12eec0Ey2BaqUQpiPkF7MtYV5MljXY?=
 =?us-ascii?Q?xAGlQNPez95pPa9UikgM+lhfeo49Mbdf6cdR+XofFrctvc7HHZD5di46H993?=
 =?us-ascii?Q?Lg3p9YiyyfK2Z9b/joAfzHNkrF2nFlc6x/XBm7lH8u6Kwd4GSTbKb7QO8nXI?=
 =?us-ascii?Q?/+IUnSWrNNzO3UQSGXelSIJu9Ne9HOHe/9Kuspo4HvgDG9EhCsQx+85oyAFk?=
 =?us-ascii?Q?QG6VwGT4iidhxMk/v/7yHZ+Ijfqurcf7qbgMEeTx0wBh+69F5puRYtgmitai?=
 =?us-ascii?Q?6pFrvzO7tzJTsSxw/uZLpsHeretQ8OQaSDACArpf3fa+bDXpieONcNJnmf6R?=
 =?us-ascii?Q?Mx1ndZKBL/tXLHHPNQHRVUWlAPHuCeKr/PxU2LyfBFemi60rUaGYQBecyohY?=
 =?us-ascii?Q?/OI2XETjH8/12zlpDyZcSOZUrX78SVmd5zp4/T7g9Tlh+xsspMa+hFkW299u?=
 =?us-ascii?Q?gRrZNIHTo5k1cKMD1qxx6ubo3V14/FswP4Eab1F6cgIiwOzwJZLokMRKrSVZ?=
 =?us-ascii?Q?t/k/7kcbQiVU4hi3QMqildMJKTCUuxH4zyez65JM7qX90RZdduCAx7dWZMx3?=
 =?us-ascii?Q?/IJQ/Z8hilw5P5CZPUAvAjK6YH2Mg4OkfYWBvOidIkLIsIX6e+7y0Zi/Tvx+?=
 =?us-ascii?Q?H12l+m+8v9QtyGW7PudGU2C4/dvlmXPUMUdb05ruu2+lJwRGfppLZMa6w4WE?=
 =?us-ascii?Q?JxOZ/ZkhHHHlyESAcBkfHMXw8awAsZiXKSaS2Ffm2hs4n4pnj4pzyjPZ+z6j?=
 =?us-ascii?Q?W+tF77ON44U1Kq8ziiTDUXn+sFeRJ3WEH+z7sZ6wpw3ri97VbNZHGP4BbOqp?=
 =?us-ascii?Q?HA+PypjMauk0GGMNibpAXss3l3PYturAc2U/14xy9Yk0UJ5aMQHmgDxH+iKz?=
 =?us-ascii?Q?oxrFZ9v7xx6imB1PIwNmf0kjV6F8bRdsam8Xtg9fv45hOE1PmmfqlpVko5+p?=
 =?us-ascii?Q?FHMwPfxQwi7SMl0vYIW/vy5UYI/3OZ7nQP+Q0JVbimkqYeivGsqCfpKTl6Xe?=
 =?us-ascii?Q?IlZZVfCrmJoCzWbG2nzNrgN+SIBxN59ekH/Zz9RaZeeGp6kF+HCtAoiZESG6?=
 =?us-ascii?Q?hBd9h7PBnrz8aKGFiVtv5/qv1X4WMr8LUO+PHLIVUSi76oSaTF0bH0GGFwNK?=
 =?us-ascii?Q?vQg9a+x0QjKdkitDR0oyOKN4fLmJFpwG+aADeazeXZwPzZL1cczsu2YxMQmm?=
 =?us-ascii?Q?vib376jCkVNj+lfNN3Mfe9ty9eFTGWNg/+Rt2F517avfF8lxi96vFA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9UI49pQB0jAdi4/0pbjfXfPQAM6ZTxBOYA97X7vZ8vmTuaqrxjifMupzNYN5?=
 =?us-ascii?Q?Q+VMByOQIrBT9/JoWKHJJpsHo5WshHY+SyrPaW0+pGVFX3lbRCuxZAIu/dmJ?=
 =?us-ascii?Q?7Bnd/pV6mAjclKF+4pJd6mRcR8Zi7VyEB5T6p5Rsnm3zYwgGjcubI5vqEMg8?=
 =?us-ascii?Q?kahOpQ++ut/vc3HAo0zE9lfA1t0jf7rt4jmpX1KkLwBQnmIr5RslbXhsGeWU?=
 =?us-ascii?Q?8uAsNEBvQ1McCFqK+lQ57lChGPXGKEtzq/IUSqm7Vvxn8DJHn2QLGyEbvHVO?=
 =?us-ascii?Q?Lu6/VMKKi8weNw7dIWIr2cxkc/mVL6NUu/9NPLTwfOUvqA/u7A97lAsvTXv3?=
 =?us-ascii?Q?v9tWp5k1Yv1DvyXVsijngvOSssk9E5jrNwO4+UzdjnoqdtINfKKCCcHL8b6C?=
 =?us-ascii?Q?cw4xagsMZbBQFxZvzobO3rBgQy/TiTQFcaG1YcOBpD8AANNn8Xk1OC5DNrIz?=
 =?us-ascii?Q?5gw7wkvzRbZu8wkAPYmN96Q08XwxfmgKTse2cGjONJxyJHlE5LqTnbS9ayK+?=
 =?us-ascii?Q?IQ5n6Jl6PHTAUh+cdMR17D4jm81k2+nrFQy/Y3cFkqi0JaR32SeBcfMwBjSc?=
 =?us-ascii?Q?kSjkpTr4bASsBxugNfh1dz7rfbxxs/5odAC918yo+3VwH+N+Ik/tGRkEEtls?=
 =?us-ascii?Q?G8y2m+j6H/0kqV5f2Zsi215nx8ao7TIvTJAAE6jTXpAJR5CJAOsMDgCwYLAp?=
 =?us-ascii?Q?koajm6CEuoAb67f463AcbKDd8ghQM0fuxjNxDPSLf40M/2IRj1CPt/wRfF+I?=
 =?us-ascii?Q?QdJ8yP8QbE0xRJu8JNJAAT5oSc+In6tduFWaWsxE7RmnXDRo80zkf//dSTSO?=
 =?us-ascii?Q?wVu4x8wZSOQX5SNWHtmVie5GDjMoX61xpcRUag0EXW0DWno18xGje7DDWa6z?=
 =?us-ascii?Q?V4rbcgDNqNtJVuQvbrwtPm8WmqxiwCQsIauipj1FgFxgmEwLZhSyD/dbUyX/?=
 =?us-ascii?Q?8nYdmgxQ/EQdFiwKzDESyOd41YxOp2aqG5WAsXycR0Y3/KkKzAfnVelBRob6?=
 =?us-ascii?Q?2LRPa6F022OwwnNkOViqRBa1cIKRJbcph0lefx07D/jAZwFR4GKoQc9L8IIL?=
 =?us-ascii?Q?wm5l3q6/qv+Liy+63zLdk4CJeRWPqvK4X6dVW2dGXlwHx6owTqtRRNLo7+9w?=
 =?us-ascii?Q?jJYps2xxked/wlxOOyuIqXcsbQ4nfv4ag0w7Up3cu3m3EifzFiwbXodqHf4z?=
 =?us-ascii?Q?d3y4omjFG0JjMrCzVa3so0t0Xwg11EpbupTKoYB1ww1JQvR/fValcM7WCpg2?=
 =?us-ascii?Q?cZkWqqAnB5SezE5DFlJazymXRJae+0aEwEZNsb5uY0lLDG/jpRl5D6H6myVK?=
 =?us-ascii?Q?2UIBT5YqDskQTbG/kEmXUQos8PHGODGUjuUEHaLz8+boW+sKXUqyxBmblYww?=
 =?us-ascii?Q?D7/6OdAQMqeoE19ivugkU2a53fVMNWOvcDQ9ylKonIGkYuG0ULBZ8GYyezPR?=
 =?us-ascii?Q?Mr6+PRsvmiBgFTko28Iew8Q07DkIqttbipZw4qpSg2O2e2PnD79LVc+KK7Hu?=
 =?us-ascii?Q?ZCluM+r94dL4IqCcvwFyelfsmOT5XzsZ679bcD8jJ4Hzi40dBKKs5kLZoqAG?=
 =?us-ascii?Q?rw1I8WXzEYU5+syJilh9JuKMvjyIURjlHUy3mK3mWqfNXLEUKr817b0KIAMT?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc614784-c2dc-4334-c993-08ddadda64a8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:06.0874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvSfH3IvHATq9tear4CofDPLFh3KIKeDOjScOqo2CCIjoxX7+7Oai9k7qZwR/DUCGT8xNGp95lCBJLKrhSqX7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5731

Updating "ppos" on error conditions does not make much sense. The pattern
is to return the error code directly without modifying the position, or
modify the position on success and return the number of bytes written.

Since on success, the return value of apply is 0, there is no point in
modifying ppos either. Fix it by removing all this and just returning
error code or number of bytes written on success.

Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/debug.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9d71baf08075..9db3fcb4bc8b 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -350,8 +350,8 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 	long cpu = (long) ((struct seq_file *) filp->private_data)->private;
 	struct rq *rq = cpu_rq(cpu);
 	u64 runtime, period;
+	int retval = 0;
 	size_t err;
-	int retval;
 	u64 value;
 
 	err = kstrtoull_from_user(ubuf, cnt, 10, &value);
@@ -387,8 +387,6 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 		}
 
 		retval = dl_server_apply_params(&rq->fair_server, runtime, period, 0);
-		if (retval)
-			cnt = retval;
 
 		if (!runtime)
 			printk_deferred("Fair server disabled in CPU %d, system may crash due to starvation.\n",
@@ -396,6 +394,9 @@ static ssize_t sched_fair_server_write(struct file *filp, const char __user *ubu
 
 		if (rq->cfs.h_nr_queued)
 			dl_server_start(&rq->fair_server);
+
+		if (retval < 0)
+			return retval;
 	}
 
 	*ppos += cnt;
-- 
2.43.0

