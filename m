Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405871E1E13
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063088; cv=fail; b=oqQMGZWziGwDpGTIgHypRLHbOR+9VKThGy+L4y/cAnu7Iy/4xxikP9EL8i0D7sxvL63HoH/jZk2J9Gg6IE9sS0mMlowiexFgckUvSwiN3jHhMqgTh6wH7f3fGoq0Hw2n7szyO4Jgh2hbvtgLyqYh+ZNdPHhCiS6AvmQhfmdhRAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063088; c=relaxed/simple;
	bh=CVw66ZCbHxwEzXZDunKRUZpx1oPf+9609xTgqzcavlI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pWAksU/s37xrwYALXdMuT8Ndsnl/10nzaWCMSih/L7BHPmSQAbLofhyXyLl7WpJdKAUhg1JY/ees3NddE/r7s+Z1nGSx7JD/HtPWWr7x8jK2GL5A55X9wkomQkU5UbKiX5OcWYCtlkg7ryfhvrwVCoeJF5bg1+Bm1hy+/kBtcuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rwWgSNx0; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rwWgSNx0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIf4xRKjWeRUx/VGGxi8C6lY39WZqrOKWVn9dsvE8wpNVoxTuIPwwhoRxEhoUp220DM9/GSHB6rgMBq+FoPgJJcNyFC+qvM+Rpn9Bh/cZLLHL82SfukdbSuQM/+cTIewUb7HY1ggQ8MVkQN55Dd+EByUHJ4jelfAUXY1gm2iHRZEerp0i0zkE4oB3VSYK2Wrcs6B+UXByNAvn5+FJV04pDJXPPivSrWYln+B1V7+06j8UoUzWj9vLvP0KKhULJfXgaRAKo2qyQi1J33S7NWbKBghkl/8l5zsCFghhjMLFt3+JQSb5E85a7DuxAC8RPLCUZEV4YkRjp4WIjSCHIhATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddzvfG8aLod7gwu3Xn35NNiTnYfQQbbRYWmiwPScr1k=;
 b=Sebmvytun7EMZipK5Vw+7fWtztQ840Kq5dgxwIJC3B0vNOeRjK7G0/oAbtZyBz4n+UTQJ01CBWKOgh5j78/c9BfAAI3RQmmPQ36E1i0PQO2qCCmR28/eOBfUS9xOHFDf3fz/t7SOqEFfSY2ZZTI7aX4d5ZV63XPUwjPggWqNVv4zM91eyTvKSPR7fEUBPtxQqGuRqBogqftwdZPZ9cjXcdpfwI1CQOAPa9x/KMtLESllEBt3uu0IheRn6ei/ZDdu9poSNIWLLAuGr6OKi3zzHNJkc0TO3al58G7afJJjSfdCUf7HJyVRx0MoFw6dqhyK59bseatFrPxABA0SQbMd5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddzvfG8aLod7gwu3Xn35NNiTnYfQQbbRYWmiwPScr1k=;
 b=rwWgSNx0ap7ugsT8ctYUuplthDFgwysw2Gya6eSK8f+GVzmuP+y6EGDYYv9LinDWBRsZNUtH3Bu07ET/AKUEV6zR4sLG+EzEggFhNTPyRcsNuV4WD24Lm3qKa731OsWki/T9oYz1ai1xfr351wVdPI6O5eo/VcnD4n53rHwFpHnxXW6esZ6z3HGcCmDgVj4ZcemZbdqljDf/mnzbKGAcUmh2GsQ/qy8iW5xcPpPM+5r46SyjCQ2pBqenR1uevq9PUWqYY6O/6UXbG008iKyfDnw5t8DLGgr1eP/0pzzqh6Izi7wee5+DcRbKZ4nlgAlB92o2zU3TxQN3za0o47ILbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9619.namprd12.prod.outlook.com (2603:10b6:408:2a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 15:18:04 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 15:17:58 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH sched_ext/for-6.16 0/2] sched_ext: Extend usability of scx_bpf_select_cpu_and()
Date: Mon, 12 May 2025 17:14:54 +0200
Message-ID: <20250512151743.42988-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0140.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::19) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9619:EE_
X-MS-Office365-Filtering-Correlation-Id: 533090fc-1b81-4bb8-8823-08dd91682dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cliojDVRr1ykK4T5Dolt9Pt5nRiBFFyJHiaB7KKSpA/60PeJ+SjH+LA65Wcz?=
 =?us-ascii?Q?zJshmm0vcUQFCbVLMGauGMeXaCR2tFiJ9f24XONPMlXjvEgW1VAo818hJGjZ?=
 =?us-ascii?Q?brF8Wv4L5Qm/Z/y34AHz+YLl50ECVfwMLInWKFBqdinv9HME00XRU84Kd7wo?=
 =?us-ascii?Q?o5J+c+iVgPPOkfvVsP2Rcwutlp6rbFRN75EaKwGsZGq+fdivKyakPN8g8PY3?=
 =?us-ascii?Q?n9+MtKkI6F2nxvYygIzvxQuEGcmdbyZh7YOjKK1ITYbo0tbluP29RacLY3Om?=
 =?us-ascii?Q?FTkxqJiTyr9eMznRh3WfyEfzW6Es9aYSBsLHRAIs2SsnhuGbKeJG8o1MseGA?=
 =?us-ascii?Q?JJ2YboFOad5OHblBxHlNIUnDcYdmXCs2EMpn9ELR7OFpudIPBboftyBUhrF0?=
 =?us-ascii?Q?kpnebEV5ZWnf41YppcNQOpcgQxbwozrXAGktDtlags8bjsalTi0LoW/PX3uG?=
 =?us-ascii?Q?MNraQj0/uMehmi4fF43cqVWBwkGaBtJetJk+wxI0FzBLASsP/pPciLpf/8Rf?=
 =?us-ascii?Q?W9+0XDCsfjEnoN7+R9na6WFT0QbB7EHbfHob9YlsD+mUlUa3G+lzXmupTGJj?=
 =?us-ascii?Q?bZhQfvikqUT+TBRjddYy6iMJwcQw2ItEqds7NUtJWfgMi0PZ7YTcYLFNxowT?=
 =?us-ascii?Q?z9rKghDi9w5DXse11Hl3EBylkk+beyDd/xJxPSRifA5bqDNOV8o8HrN3MiUs?=
 =?us-ascii?Q?Ug1d5jOKLQpTOwTrS8HnOpnqBx4bisKBo2M72u+mmLWvaGGNEWPfW6rB/lwj?=
 =?us-ascii?Q?myfOXFT/LLC+n3OoHUJD7768gjzE6r9mfqYBQ/kMQrOi4/3kO5ywxdJeJpm9?=
 =?us-ascii?Q?wLQuSICRLw1Y8AGg+ENmD31iibLAzFv0g2U1VJshfePygEZ3+s9/p7wJu6fC?=
 =?us-ascii?Q?vyQt7Q9SLnpC8tfA3zNUfEv6FI6CxBk0S4O5LeUNzfY3SN7boCmOpvKTrWYa?=
 =?us-ascii?Q?oGKDDn/byrJ6RLWWv0Ft75sULmyb6tfGle9m0d+JACj9jdB5jMLIzsgP+mat?=
 =?us-ascii?Q?ZvkaBIlHYLERqB+svJgBCguCSNgtMuIJJag0gBdnH7makNR2v0hfwxE7lANR?=
 =?us-ascii?Q?a73/4nPVC1ENdoAvCH3XelxxEJ9PniXrlYtjOEQQo2PPLs7zTdfLptK+h90f?=
 =?us-ascii?Q?4gnxwNkBcCr+EAVnzS4aC+khLCeGp8sGMM4E73gLDwKnO/Bmyvwo43rvZi1t?=
 =?us-ascii?Q?799VoUVTvYf/xaBaR15ef8PClzYTGAGC1iHuCe4QhNv/551hOKqIlFtHHzWo?=
 =?us-ascii?Q?rLWDiimP8JR4OHqDQBA2Vv9cBTyvf7kC1YhDx0C535m6EDzAjLvojyCZ9z2u?=
 =?us-ascii?Q?IEIOMeQo04du129REAMaBdoQ6/0oMjMBo8wMT0cIuHO90M6TuoL06IhPgCne?=
 =?us-ascii?Q?i2iCFKfs/nxsus0vwhEhLSNCkyhKbkRqdwoHlq+xHsBNM2NjawZxIXqhHi/G?=
 =?us-ascii?Q?G5/V4VNo/uA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?edFf4T64nNAoic9wwnf4bo6DaSgYUqTPCCLVHw4jJDlx9NsPRrL8DXc6CAH7?=
 =?us-ascii?Q?sPQIrXHO3NmT+Ajw/R0+fUZbv/rJLc9rxq+fRbwDPPVsYYZZDrKAf1X/yHFH?=
 =?us-ascii?Q?VJlatuMF0SrJUo6rBMD9GU5UW/cE0RXSs3NTdf9qZC3ur+5ShkOujGl5X2C9?=
 =?us-ascii?Q?e6BJlpkvVkDzoXjIKIyVkw5RARZc9Z6mZgsiW0bq/IUtM5RcZQggFcJkaFB8?=
 =?us-ascii?Q?r4eIQ30qRnO8k0F+HIWmzXIirPPct1jw2lXu7OsipKDQn1gG/QORbq6vZJU8?=
 =?us-ascii?Q?D7/gtkq9MHI6fHE/+hDenBbOPM5dC3tqQSJX3ra1OEKKG3RawJXE/V/0zp/a?=
 =?us-ascii?Q?IMJaugfpQ/dFAoSFtMvp1tQDPP7UVvElRHGIJaoJVACyC7/pcxIETyAjka1F?=
 =?us-ascii?Q?YWm6uJYV1itOS9WikIWA+YkQP/qlKAgyFo5gWV8bTBUTl4Ze2vceyvDvVRay?=
 =?us-ascii?Q?9veDm6tMjB3bQ7d8GZHNhyiurfUCqRnyiqJ9Bi81uJDmBBro7sfnRt44olye?=
 =?us-ascii?Q?rXrqgdCr7lR6lEqMtJIKuaSn3aFfkyvgA9VEzJPYcJf6GdezcAVrqZpuc4sr?=
 =?us-ascii?Q?rGXQsnITuzZ3H3+nMG1GM9yszU5CFcYqpGc0HQcQMIDAoESTb1p+QTEVLabv?=
 =?us-ascii?Q?Z6NH6UwvYQIWQ3p0GxOHkw2wM0cxbnYBf4+3g+Ue8XLtl++3KDwQrLh/onxr?=
 =?us-ascii?Q?P+U6Z20V+4kKO7D8HiQPOzCJ8KBKoMTZI7T8zXNPtq0CzHl0slbxnZX+AxwM?=
 =?us-ascii?Q?JOOura8xdEPVcaHQ9zUbvRrmIpAX/4Rw2GnOH2WXRKqvSF0bXXY2+MsrDCOM?=
 =?us-ascii?Q?GIdc6IlaWlZ2LBVf15MWE9gg2zKqmNU+95q0kOQ3lzTBNLHlpb7G0NRDJGGC?=
 =?us-ascii?Q?0R/n3NQ4FH8U4jdBQSkZXfwRo4cvRCWosFI4jKSS3ZN1a8LsYWAvmpoQ3t0P?=
 =?us-ascii?Q?eyLQiwnTkzVl+NKS72v7YBpkTaJZiugAmafbTeYYhUKRVtwpb5sbOO9IPYOZ?=
 =?us-ascii?Q?mgm9M4ZmUbyDIbA8DlhE+aDQQ6yYvMe9xTNKdMd68ZAy6PhhoGOyFh/VbXaE?=
 =?us-ascii?Q?ggMtBbJ27u+V8WAnhjc1xTLYpmr4xhhzydoJlqiLtcvLHSM5YdisgFJomsF0?=
 =?us-ascii?Q?Ia70wa1ELvNUWDlOj0sHYM2JBpTxyFUgkA7kAq8MdxRadlw4ZGmctq2NNU7e?=
 =?us-ascii?Q?hXs3mCmMZb8fW9Dz3TmpSIzqJFAINTO8zyYB8E7W5caBjlyIh8tGCyE3IGzj?=
 =?us-ascii?Q?Sf280fz3urv0pCYjgH5UKeAnSJsLo8YGk3kPNd0Ob/M9zkMMgWo9KLYQMDi2?=
 =?us-ascii?Q?J/JKemuYg20wFWe5+92stCOi1xp4raQOQAafDVy15AuzdZMK2qhspX8mekyR?=
 =?us-ascii?Q?IQ1T1kyeVmU8mwj7OVa9pgYUh4ggIQDYvrHGir9/XyhXY6+2eI/WCmJx4uBi?=
 =?us-ascii?Q?hpqeVeLKtwlauF0H9kB3nzioXhmvdxekDw7dxKtTYunRGD8EmWSJPXZhHkcf?=
 =?us-ascii?Q?E76OxvT0jAa9zp/BFxcKVM0b3emKibkt0sMd++3+ax4zh5YIjwzd4GrQu5/3?=
 =?us-ascii?Q?2rplgFLP5NuYwpfeGJwDLHvScUrCSCnpOUZeOaQ+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533090fc-1b81-4bb8-8823-08dd91682dcb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 15:17:58.8304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1jYKOXmZqLXGuZXPcEUCH3VAJZLS8fiLKP7KA9q3jUyDBYGd6avMIlxmYtm38POLtMIMw8l6fGohQ3Lcigz4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9619

Many scx schedulers implement their own idle CPU selection policy, which
may be invoked from different contexts, not just from ops.select_cpu().

For example, some schedulers may need to trigger a proactive CPU wakeup
from ops.enqueue() after enqueuing a task, while others may expose this
functionality to user space, relying on a BPF test_run call to pick an idle
CPU.

To maintain a consistent selection policy, these schedulers often implement
their own idle CPU selection logic, since the built-in one is only usable
from ops.select_cpu(), leading to unnecessary code duplication and
fragmentation.

To address this, allow scx_bpf_select_cpu_and() to be used from any
context. This gives scx schedulers the option to use the built-in idle CPU
selection policy in a consistent way, potentially reducing code duplication
and fragmentation.

Andrea Righi (2):
      sched_ext: Make scx_kf_allowed_if_unlocked() available outside ext.c
      sched_ext/idle: Make scx_bpf_select_cpu_and() usable from any context

 kernel/sched/ext.c      |  5 -----
 kernel/sched/ext.h      |  5 +++++
 kernel/sched/ext_idle.c | 23 +++++++++++++++++------
 3 files changed, 22 insertions(+), 11 deletions(-)
