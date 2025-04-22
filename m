Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B99293B79
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310582; cv=fail; b=M228OS3I6Fu76jBgJa/WeEHZW7kkQtAA0Ky8haavPCr5yjlJVHrXX86bCJe3cMyWu/QmLEAWd5Jmst8HyPDyMXJCrpHAP22SaSKxiJFrUWGhCrvAGPyKALvQRwrCmFP0wI0x+c7Oterw26XJTxI1zQHj95EGRHVLJmqs4gIOitQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310582; c=relaxed/simple;
	bh=jisQBUsR07c2jaOX1W6Ud3G/rSH/eeZBXxhLKdzKGQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D30/osjKN3aVg3nySgQAFb3DtkxMKVsVuYa0qGENWY8qVVXPk/dNL/yRnPeXmaIY6OHceE1n/nnkCs8DadLSlPrz1Xyh5WP8wF1wrxiiBwzZfvLxpSpfLCR4hYdBxgkBntPWWHVk6yv5tXfTEFc+yXzPLTp8wISD1jqHSLq7z74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L/cVaDQ0; arc=fail smtp.client-ip=40.107.223.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L/cVaDQ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJMcayXSaMUFDCvo4yNV4kJJFQ8gg5IivuaX7CzGjgP8HVgnBFILp6bXO2OQmDwDSPGOEVMNyck1yf636JMFXrYLdC0tDDQBqRfbWXsT7hDfXA3MySnQAAQgYwM0G0K8cDrFk7GZD0oozLJqbzLK1KhSg7zfpwFRz1BaCACpefGz5n5vW1EatcYEqXWy4C5o7PTZHAVgspfM0Vel1ZC+Sg7jc/4yxDdsOaDa+wFc9AHZ8++De+d+zALEG3BGd31YMeONjkgTuaT05nL02pMJj2JHDGjtd5Sb+eu/DeQpJvZ9ahJllUWf4dTF76OnQE+b2yVyh4WSKKB5HiP6Pp/e6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDewoeyhtM0vh1bAUrwWUhNqF95n7XYvQFodDlu+LrY=;
 b=iDhxfq2vdXwT+46uV0V9i65LyzT7THENA2mjnmKN7szhRFktaK4gt5EqU1u08cLPXxrB78qcwz6RZdqEOWYwv1l9DwEQyd4SdoxY3hHGlJx9Ja5/AT/Qd5WNLbzYYwnm/EipQktadxki1mANjjUx6zwvNI+VnnivX2s3gl5twEcMRDWBEfl/JtxRgUbG1CkR8lfw47Bd7A1JNmxQ4kNxdMB9+tIkLIKEJ7SDS4nAaAqDO1vruyMCKuoBA2Q2Teo27NvPs0peLzw5A1TysnRAyADi/duMT5+Cf68s/LMtLH/C+qjPrngODFqtzqMyjyJZN34hxEAoFP5dODqNbTJ1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDewoeyhtM0vh1bAUrwWUhNqF95n7XYvQFodDlu+LrY=;
 b=L/cVaDQ0dJpOkx/p8GIP0czwTDcrcbRQOAfkbTMot9BScc7WiTC09QJEd21qw/I4+iVzsT7I5bI/PA7YKv3UTIoY0f6LIi7Pka/YlcFBpbqNed3t9bhBw5+f1u685KhPgecmMW22Ir8LDkDHjQpGw8GzrLRQO/eCs8uXxSzxdaEjVwAcyDiCrhSLO2o09CuvNsSLc4JgdGmVy6P3KXuR58eK7z7mEo8qhFGoJDE5Xde+6Hw+sCtjs+0vm6Wp+5X/1kmC8fnXRvW6sNH0t702nYOabE5pzb4YodVFKxypnxc6drrmFQdng5OCP+qCl5PRdT7BxwxZl2OAZ9TSbAmouQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 08:29:36 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 08:29:36 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
Date: Tue, 22 Apr 2025 10:26:33 +0200
Message-ID: <20250422082907.110167-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082907.110167-1-arighi@nvidia.com>
References: <20250422082907.110167-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:510:174::18) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 60419441-3035-4e24-0875-08dd8177d0e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lpV+TNBgtYUKsUHh7N1tNAqoR1RHljVpr6fglygaIlfY4nKrazFE2YALdvLw?=
 =?us-ascii?Q?Rn0CRDhYGwIHz9AbFfLce+N2MALA46kbaYslt8JLghg/1mMLDQB79K7gw4T0?=
 =?us-ascii?Q?c1RKOc5Y2gKImpSswMmjVh+PiRboLX4+TmJuOoPIpU6vkpVr5P/C6OXgeL0/?=
 =?us-ascii?Q?QfXy7WdXo+4xteoOSE063oj99mQ9DDjoAKdc9gC87Ka+htELq/silvi6C07+?=
 =?us-ascii?Q?Z44ts0wS76jDY+Dx9heUscW1hOibEXIq7pPtE5exrdRwg8wWD9Dk82plwiWN?=
 =?us-ascii?Q?5O7UuxR6WTonbvhSIRGxLQTG/zJQvhgFusVl0PKTxn8VcIYMBtMXRqw7ccew?=
 =?us-ascii?Q?jfAU3tLwfdomQj4uDP+kzTc4Lo5ZXw0PPXSpwkFT4ZeK/3t9lXJ9Npx1lpxJ?=
 =?us-ascii?Q?nuYwAutaZQQqbDeDwnj97FsCqRWQhhbos1b4o3nO/NDe6+hOig3NnOMn+8hN?=
 =?us-ascii?Q?yaLf+QNCVF0MqegXb4QjDaUda1Y91CmKNVkJkj7JX8eEUh92NkRnfr1xI9rJ?=
 =?us-ascii?Q?etRWev7Qx29nIqY51MFXT79lcUH2YcKEdsSg2cxVosJh4cdCQ8ou6kYO7TQJ?=
 =?us-ascii?Q?9xqrpg3feqNZ0UEA2WnROAvCxgP2CJkbzuaCuzGRCiIjyVz7v+3NIqw0JLkp?=
 =?us-ascii?Q?G+hkwLFS8u9p61w1dlvE0JTBOMMPmSyo0RAW4gsOV30RcBM+mM0JG1TW6h7e?=
 =?us-ascii?Q?ZJwqFbManCW0XlwSmgHwFRKsRRmicxxHYONMm4VXWgOWN1n/0bnEKJwOi22x?=
 =?us-ascii?Q?8lGJ+0ptlqH2e6UiZx4pvS+JcCDnqsrKWhyT00IR40MHcpJ5XwOmdXkBytaw?=
 =?us-ascii?Q?2g0ogZLS8qM+kFyEmaeCsLRRWJLKKBDfN0jdLwSQnMT3TTSURYk48dm6oPTc?=
 =?us-ascii?Q?JuwST8p8nnz+31DYVfrjzM7s7IxuBpGv1PPQtv8EBRoTqGU7z0KDrLi/xJno?=
 =?us-ascii?Q?ST4TNRU2LoQZ/WWEWCXECmrEYVHhYeDPyRroFLKybbjEaO6OKfn4QHqGQMs2?=
 =?us-ascii?Q?wyzqRUJyeLz0HeuODC5m5dntSjB86DpPuMjqOqubeE+5MLR2OMcCH0Fhqp9u?=
 =?us-ascii?Q?rGRYVEsn7NTDrDdVfSywMX1twjFldIoFzEPArnqJqsBtManvmrdHRprAen4C?=
 =?us-ascii?Q?TO86CPLwTOLNLoiF3EjC+zsQjSmBn8SVwrlKar7/SERK2lPzCqh1b/xPqjVs?=
 =?us-ascii?Q?hIAV6Gy1Sx5KsISXUN1y3WY/SGJTCvwvCN7D1K4zBxDfs83DHJ0Auf3ABpa9?=
 =?us-ascii?Q?O1ApKnbO4sdW6dCKi5b6KfkC6wcKj8j7jKf8yX+YwztVJ/KgNIlJZaU6LeD3?=
 =?us-ascii?Q?WHBcQNAQfV4OqpxWp5JuGU/gSYqo1D40rPWx6uHZlg3CjNBI5rsUGqlemor0?=
 =?us-ascii?Q?E+pUxzU/ZYZv1sf8yOcL/U6t0tPGh955cVHznfrKl2yURglxlQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QXUTrgVncC60Py67VqhZ/Z1u/PbCb2xb4yN5oo6Vkx1sygmsfhd5hbOjODEf?=
 =?us-ascii?Q?IGPwZYKuVQQc28HPkacQcM//32xvmUX+HTETVPiHlYk2GrJM+bFCurxkOEsK?=
 =?us-ascii?Q?eGJIV2eTSKgDlVggg8pFF1xtCqW90gIraMa1CoM9kBAlEHUojHqQsNBt7Shp?=
 =?us-ascii?Q?Zylj/il83DzXOENVCg+ypStK2Wj8rX0teBOPx6SfjVwL5Fs/oXV27GNfsmzi?=
 =?us-ascii?Q?JaLZEaoORTUIaP+YH5lBi/11tuejgIcfzXA0tdcHtE8BH5VPusDf0/SZxvQd?=
 =?us-ascii?Q?1XZo/OBZBDHbFYI1htvz0BHEWQ5RfSDjAC/h2VIjgBQb+AM5if4gzLt2/KZ/?=
 =?us-ascii?Q?yq1lLr3DOoMB4vSeXOAjWlQGVvCVPMLY773cc7ckqnsVUEzazGEjGSUtl4Ze?=
 =?us-ascii?Q?RtuuTabE0nAqGusXRoFm6Nuduh7x/7RTsP9qZsXbtChbPkYz7ooW2Sfu0BbN?=
 =?us-ascii?Q?F3xIZTG9YzR/MOBcmQJxGxfZLOIkiATmYI3xEqJwJzf7sbra3yLROr6BnmgB?=
 =?us-ascii?Q?yKK2ZpPJBVLQbWl4SIcPMQyv1DEHwh8apeX8RiAmR4fvHkmgKZEqofStXZXQ?=
 =?us-ascii?Q?wCjtEAvenidQ8yDwF1Yo+GQUMyK01hdBZXpln5k6Nwtoe3FFG0No3U5I+x0J?=
 =?us-ascii?Q?hpG1YbTXNCB18f46W40I2ZOu4maXIRMNcc+uArnb0SXcXGSZozckc2PrIgty?=
 =?us-ascii?Q?R44GZRYcdfULxAkxZM6hJWIYZ5cz/EIBkUEPttFgFqswL6bSaI1FXCHyr+ud?=
 =?us-ascii?Q?10xpMYD+0hvcbjxzpfnSrk7id6NElyI9uaGJ7KkbC72r8X97dlOIXxfjdwmT?=
 =?us-ascii?Q?0OIpROg4ojbDgkeStMEDms8O5/gWTGu1D73LwvHGy8c4nap0+U12gYGEuOw+?=
 =?us-ascii?Q?oSJi9eC2fr9/O0G6sAnFAgEIYjqtlzbeJyw73f2yuiKoou0ob9W3oJXw9hcs?=
 =?us-ascii?Q?+aFb0QBEQYhS5NBCLkBL1vHaTXrWPKc69fajyASwu73GjQGADT7iDRPYSWu1?=
 =?us-ascii?Q?u8omK7W36Q63a3XS9Zq4eCfjW3Ir+AP34wmNl8Ze3G9SqtFu18zVFFq5mY3x?=
 =?us-ascii?Q?zBGsOK8bBd/vaBk7a7aTm38cD+k2Pb7RmbhijF6XbLX+/ETpb6KaGrE5UmPl?=
 =?us-ascii?Q?TVF5N6KdoEnpZAScsbVNqWgMexg/u4VxHvV0TeiVSC9AP42fo4UPlfE7Nkwy?=
 =?us-ascii?Q?22/E8QtIEWaUqlvdxb9kQIhFGd5uTHRywijgHZQdlyiskwd9LtkIfIcP+kco?=
 =?us-ascii?Q?N3QAKDA+kpiikxO1bmoCLaMY4CHBQBuSkAnc6Uc/x/g2hJmQIsnIY/l4Wi5n?=
 =?us-ascii?Q?Kp5y9ScWMYECbjP7DoVRVo/WPKD4/XnBTHbS4dyGhNzv2gIj2Y5+vzqSt0Wv?=
 =?us-ascii?Q?2u5dy2utWimkD9ifwm9jWkDOIMmcg8cLoqt87n/rp/OiE5b1UXU1eCtzAmo/?=
 =?us-ascii?Q?cd1vndU0o9xMQhaf51lXtktzu9HN6ha61B1n2SLJXuble6dytMNFu7GOjpbg?=
 =?us-ascii?Q?/eKudsVrwHod12g2GMaqN5OFg7JS1V+lW4rlx0V3kaCGp9do7A32B9YFKrcJ?=
 =?us-ascii?Q?Rkv+VaFiM1ytOSu2eSXg1GfQn78ZxIQ5MC3GV14j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60419441-3035-4e24-0875-08dd8177d0e0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:29:36.2944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jer458fbIA24rMRK2BuhODC2+pHkBwrVRc3umjldMu8K+MeDc1tsD9G5mL9YcEWNYz2fMo7Ty7hirlONEnjaLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603

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
index 3365b447cbdb8..a175b622716ce 100644
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

