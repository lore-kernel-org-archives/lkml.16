Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E072B9A8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 19:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745177549; cv=fail; b=nu6BBcS8dfwQsBF6O1DUgLvV+RKH1Qga6b4G12/Y2dYEY5jtlF3wzKS93ngy9SBe65YOfrI16ZT72LSXIuliIM9Amae3pVVa0SN4lJGbah1WRMVpgP4LRJrN+sQy07SiRnEC829Yr090+3yL9utvYGLqGS8UbBg77CUp3ZB8ouw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745177549; c=relaxed/simple;
	bh=Jr3TO6CHSiDolkD7NEjeNTP+/LDqDrx/oEKM3K8KaBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T+yEqqszeEWCHeV23Vy3Ax/He34cxgI1wd1qOBG3FPvDSpl9VgoNNZw3GlgWynqmqEWxSiXsHVH8Q8ApbwB4DoayfHwgblnHNjIk0uTeT90jGTkFeA1rajjg31zbF7ZXMPL7PS7JxhcsVnU3eZLTTA30Orm5TFvHWcTjDULiwSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eNHIbPfl; arc=fail smtp.client-ip=40.107.237.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eNHIbPfl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZC+QzULd0nU9mpXw3satW5m3XBy4dmw+ca44MoBe+DZJ8xTTiN/U0D20DMw4XkpLOa/PxbGlNXm+CWx76TKJFEv9lvrW39aR5qYnLuTzbXQ2W8cqnO38ysoAmwu8KIkzn3kQROh7T0wmgZsfsZ3ftB950c0+3jJg6Ww3zNYY2LFWKTcLeIQT69WpvaHKMbOhg+7nEJODODVWZHaC6qj+YQHWYRkSCxKFO1e7LywL0xNZYUEGb/m6ZcP6syCepTmAuDav902SHUY6VvK1IN1tB38kBF90QApjeFdARuAU40FoXpLigBuWoYNKS6W0WFaNEYKcKRAagjyv4ME5vwWn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0zZW3eB+quI3T2tiUffqAWrVSKS4Rw7ukuOaRjrh8s=;
 b=I8WQ17JJVPfbvVpUyJ7uIWeF9KDnQHNPPLJTBDWfHJNSjir7KQ1Mv5/KwdTtu84EBUrxpYAmFs80TNxhJQyikplAhpgt5wblIs0qquAHWZUwrk+UAHQFOuVoSXrBCR2ZPYPD312eCb9AxTf3npr9fVgU/tgU1ukJqYz/Q6Zur49AUort8IRGjjsiOgBzPetvUWgDw36GCvR08xTSvHNeq/4do1AHsapurRU4RhS/pijJPkjSpZ04eLh2NpL/01Pgks9me5Tgok7o5t9Z8bQUp9yIFhbPexf+QpgoG3D6W20mam0gojHBop0zaR6cpUSk7VrL10mfzStJJixZSEi0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0zZW3eB+quI3T2tiUffqAWrVSKS4Rw7ukuOaRjrh8s=;
 b=eNHIbPfl7V5ir7faGvStlmRQeoJ1rtTxMuGYUP4bYqeTFW4KKpoXiaBBqTio7e3Kt2j7aQYI05nMjHdl+6Jyxk/aCmLX1sUppLb7tNM0GLq8DxL/SxT4U9OjE8E0O9oxPrN44nLpILcjJbg8MDhi3nWIPfIeikgX8o//vVU3rdWYjvaNcK+KvYNH9bywZ2RKkCbcWxQqbreiNV3lKj4ugfZ6uuf4j97qYksSPKA8Ga+puuhXLKTKiEvpBIs2qt/4ABKLjv1P/mHsT+Uu/0ml+P3+MesvrgJGNntHjp5xohmJ7GA8t2LytJahggj4Wc6HKaxeep72/h5YaRQFaYoquA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Sun, 20 Apr
 2025 19:32:23 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.033; Sun, 20 Apr 2025
 19:32:23 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
Date: Sun, 20 Apr 2025 21:30:22 +0200
Message-ID: <20250420193106.42533-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420193106.42533-1-arighi@nvidia.com>
References: <20250420193106.42533-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0171.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::9) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 579d1524-fd7e-4b88-df29-08dd80421360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tKBeXYNigw0sKLFV2Vr9t92usMCq9oAI/hgZmu1ukUIYERzZpTi0ujhyoAX9?=
 =?us-ascii?Q?bBzr274CajRyxJ4t0kTa7foxIgOXLaDjL6Ilu9Xx9M7BH79dpN21fZ/SP3dg?=
 =?us-ascii?Q?N7O2Eu67DeIHQ0lZ/QU0ypyD4X3szMcz40E+4WKi8D/iQMOv8nmXGqFXI6JU?=
 =?us-ascii?Q?BhANI+1qE62JPB6eLujjxuttaF9WE7y6ucu7gN7Wkf1U9KzYJgr1f/9Q8+bL?=
 =?us-ascii?Q?XOq922pWkeS//MI6IkXnheI75SoSLC8hp30LnRDUDwjxKsv1zJizixKmLFSH?=
 =?us-ascii?Q?kk31xhO5agFJFqhVRhV9dNmNZWS/K1MQ2WRdIPqV5ufeeDmqf3KdEhSeCT2X?=
 =?us-ascii?Q?EGiS4z4l3K12nyjaO0IPXF8EZ/2zIPWQIWUsTTn7xAM4TIkRS1o0I1EQG7Uw?=
 =?us-ascii?Q?rzZmAUgGptEHaphKkqbEJNXXmlO6U/D5Ub5UcLPad8IzK9J8K9xjbNCga7sa?=
 =?us-ascii?Q?432nkuMs/sFC687nDXIkyBWvLLTZ1YWEKQQ59in19qkqvHforBdGGmEzbeuA?=
 =?us-ascii?Q?Ph5J8gmecZkAsYp/6BSP8up8ozZ2Qs/sy9PraqMrY2P/KI2FISkdc5YBzfAZ?=
 =?us-ascii?Q?bNiRHwyXWxK5DbztfE6B+Tl2N/dKKof84KlAyYUiYCPzdTYOPy2YwRLgkP7Z?=
 =?us-ascii?Q?Y9lf+JngMv7hV6aIXPKKKl0SvWDiiUKmn/uC1Hr4c5WtIc7jqxmn2RJ7wqfA?=
 =?us-ascii?Q?g5OJqt21LktZ7h2aIkEGuMtwCdCNMTX/8lurq3H9dlQb/uudRBWyYw3OGXFE?=
 =?us-ascii?Q?ZQiEX/eQ9pjDAdWvPssbRmUTDZS4zf+VE0bT/CCX5+7CQo1wuONbsImXNDqX?=
 =?us-ascii?Q?TRnxrCYYg2tOS6aEzJpuOx5gBgMsj4HEyDoi4Uo8eJ6PhN9X9LQmM41UbMHN?=
 =?us-ascii?Q?+/7g/v5GT+fbsBXJN0kJ+9rSk4OIXiUcBpKevMBGlPo2OKULis164an8uFm3?=
 =?us-ascii?Q?6qD+R6zFwTiDItAP9u37J5eGGHCvpuyhMlDYjLafxUhAZ40KBGU+4R/p7k/z?=
 =?us-ascii?Q?MDflkFUTX6E6cFAI9SyRce8yQFSg788eCkWucDjXvcCEbh+x+SDS0WblT7Ky?=
 =?us-ascii?Q?z1XLMZwenH255kcT48SQmnFYnUEYmB9HxS1NOdIHBXy2YMxJBjXWDUTn/4gy?=
 =?us-ascii?Q?+ZnLjruZeZWVDDlfAdQDK5b0NQs50Jgfrrx+xhYkkMnY9Jdtaw/RqJHbh442?=
 =?us-ascii?Q?a+9C3iDnN4keFWMFfxJfpsRUWhZdrwY3+QUvFgAMix3T9arZ0DQ6Sn1nfrFq?=
 =?us-ascii?Q?AAQIAP+ABkvfN8NeqgbMVD+DQX6bvURpKbfAOVLTJrYikijYE4OKSCFjJqo1?=
 =?us-ascii?Q?PmpMCakJdm85ZXXOrGvO5v/irlICqQJ2nfPBdX1pn3/r6784WHTxhbNtFUDp?=
 =?us-ascii?Q?/YfFAzDobvh6ovwMI4GnhWH4XzXWXezay9OZDCeE9afDHrRkqg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qmDT4KkD2e4r8V7Ossmvi6gZr/q+f3IP4FBt98ST8YLXN6RPclwj9XBzrVmw?=
 =?us-ascii?Q?ml3szdsAw6+YIO9p8SNhOSwoLX7xFO633CAKLao8hYQo3Vh2EYDK9gNC6lL9?=
 =?us-ascii?Q?rssga0kx8hofYqHoHmA0sMXYPgRKGL1eAHdpd7/qS7uMB7iFbNYNORZCRcFt?=
 =?us-ascii?Q?mG2Hw456t2DaGFBhf927dAXjwxsNtg5xcOAHaviIRRwA/VFq7wEw142s3vdI?=
 =?us-ascii?Q?g36ZnDDNhg2sq3gKFLQb0jwEloDzEIc+Vygol6EdNS9zzAkSONkkXqrAyo7P?=
 =?us-ascii?Q?zWt0DLJSayFlnIpxaDeUeQRkJSYsFlQh8EH0HC3EP/OtTZ4bhpRKH3EOHrr0?=
 =?us-ascii?Q?BZFVvzY7RingGCtIrWzYHX6eyDd2kX6eGJ34ezMLVEX0ha3cLPrid0r7pip1?=
 =?us-ascii?Q?W8bo8Ap4nnd0eJx3X2AlLRqCTXVscQIl6Ie21mGMwT7zeaTFFumeq/TRRO2O?=
 =?us-ascii?Q?goRZqqefVxp7xIEJB4tMqknaw0GA7abJ7ev3Ex6FiWJhUEwnOREp/5/wkiGi?=
 =?us-ascii?Q?3XnRBaYEwS0+Xx9LBi9XUTbXWOtiGdPGvLQd9w2F2cAAocLdYL0m6xXEpRYX?=
 =?us-ascii?Q?ZB/LlcPXgTzGtP1B+DBRtJ5fICxlyD5/BXugvoVPlx/OWvFwOFOK+EAqOPOR?=
 =?us-ascii?Q?PioF4JNMImrHgpQuDsF1MrSwrhdGuCHlip9Dt9FfFd/rKM6tIWWNga5UkGy6?=
 =?us-ascii?Q?Ffw0RN0MKTExkInpxhpwAAygMS51J5dCNwHsnlZFHLL//wn1OyjjmnTwrybB?=
 =?us-ascii?Q?qlY/ue2GHuU3eN4VcDyBRAk5IPbbutC9+75hqhf38GURE2LmdjugalI4EL0v?=
 =?us-ascii?Q?xZAWff+k22ISXZnqdC2So2MnR7WS+9ibtHv+qRc4FN8RUtyTAbtsEOoise0w?=
 =?us-ascii?Q?uBQQYwGtHbW44fKh9Il09rFCo2r4cFDgtuoDK99cgzzoumfQxh+OxM2GT+eA?=
 =?us-ascii?Q?y+bRdfvj7JEmDXMCnrKowouKzzY/klPeMHG5bW2BltQWI5MMBsM4C25v6PpF?=
 =?us-ascii?Q?lOJQ8BQqn7otkDKi1PAbZypQpmv4xSpEuPbNAGBGeJ0JeQ9qIQ7HoWb+PVJc?=
 =?us-ascii?Q?lYBKKc/6x4T9+MxNUozOnuQC1pB12psHC6w45j4Ef9Q8hLcAq9c52vLQB7pn?=
 =?us-ascii?Q?BRv4At5h53skLWl4vudKwJ4rYd8BEYN2lCjG7leRlyTpn9uz32VwUSphSaHV?=
 =?us-ascii?Q?LiXKfyhrfPTHql+VWSe0x6wKpgHVl1ReS0GtocK2znptRKaSr5veHHjRsCQk?=
 =?us-ascii?Q?82ZIKKWPMNTgZYkQx6Ecd8Fb7NDadWz/BgGl68SoTVsZnkO2AqrgUM/0P89q?=
 =?us-ascii?Q?vPj7+m7TyDc+zbkp9mG0c+NA55+TOODde87C8z7eCEUJlVTZYt/QEaK4yMTi?=
 =?us-ascii?Q?sMnPAnGiJOXWRmD8d0ErDClLIaWqu9i745pGQ0stqUogbd/AYZwAJOutgXGO?=
 =?us-ascii?Q?/r+BMccm/nWnDXgQdBwiX88Hd+mL7/flATJR9H4SU+83Q9d7sI53VynCBDjr?=
 =?us-ascii?Q?Uddt+oxq9K+qYcY3sGmx+AXnYc/5uSYvcNiYf0OG9fdtdm0oa4HwkattPfMt?=
 =?us-ascii?Q?dfRDpoqNU76sD8q8VyV8q9SppSQT+//2QZdRxCnT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579d1524-fd7e-4b88-df29-08dd80421360
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 19:32:23.8689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eiDFmf4UKPyTws/U/YhuwDxCND/WScMqh+m7IIthqGsPR3xkADNOhSz//v0OXDUFkyL1XpKVur+HsUBOQcVCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926

scx_bpf_cpuperf_set() can be used to set a performance target level on
any CPU. However, it doesn't correctly acquire the corresponding rq
lock, which may lead to unsafe behavior and trigger the following
warning, due to the lockdep_assert_rq_held() check:

[   51.713737] WARNING: CPU: 3 PID: 3899 at kernel/sched/sched.h:1512 scx_bpf_cpuperf_set+0x1a0/0x1e0
...
[   51.713836] Call trace:
[   51.713837]  scx_bpf_cpuperf_set+0x1a0/0x1e0 (P)
[   51.713839]  bpf_prog_62d35beb9301601f_bpfland_init+0x168/0x440
[   51.713841]  bpf__sched_ext_ops_init+0x54/0x8c
[   51.713843]  scx_ops_enable.constprop.0+0x2c0/0x10f0
[   51.713845]  bpf_scx_reg+0x18/0x30
[   51.713847]  bpf_struct_ops_link_create+0x154/0x1b0
[   51.713849]  __sys_bpf+0x1934/0x22a0

Fix by properly acquiring the rq lock when possible or raising an error
if we try to operate on a CPU that is not the one currently locked.

Fixes: d86adb4fc0655 ("sched_ext: Add cpuperf support")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 51dad94f1952d..6b6681b14488e 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -7088,13 +7088,32 @@ __bpf_kfunc void scx_bpf_cpuperf_set(s32 cpu, u32 perf)
 	}
 
 	if (ops_cpu_valid(cpu, NULL)) {
-		struct rq *rq = cpu_rq(cpu);
+		struct rq *rq = cpu_rq(cpu), *locked_rq = scx_locked_rq();
+		struct rq_flags rf;
+
+		/*
+		 * When called with an rq lock held, restrict the operation
+		 * to the corresponding CPU to prevent ABBA deadlocks.
+		 */
+		if (locked_rq && rq != locked_rq) {
+			scx_error("Invalid target CPU %d", cpu);
+			return;
+		}
+
+		/*
+		 * If no rq lock is held, allow to operate on any CPU by
+		 * acquiring the corresponding rq lock.
+		 */
+		if (!locked_rq) {
+			rq_lock_irqsave(rq, &rf);
+			update_rq_clock(rq);
+		}
 
 		rq->scx.cpuperf_target = perf;
+		cpufreq_update_util(rq, 0);
 
-		rcu_read_lock_sched_notrace();
-		cpufreq_update_util(cpu_rq(cpu), 0);
-		rcu_read_unlock_sched_notrace();
+		if (!locked_rq)
+			rq_unlock_irqrestore(rq, &rf);
 	}
 }
 
-- 
2.49.0

