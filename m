Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6101E7C12
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336658; cv=fail; b=SYdEHqTwx9/FRDDeDYtSpvY2O97xioqFXL2cvjb4dzmFTkZzleJgFfMFdD/HSkiznLQLmBQ5FmQ0QMI7Gw+pDBXVeUrj+jzO8C6jjZmogRYJP/ucwoYIVfamPp1gIsmHohflKTudIZUowVsuGwqOJ/A9RXVuQe1Q1ISgjK086Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336658; c=relaxed/simple;
	bh=BGSyO/f4Yxcb+khX7n+si75Yp0pp8wboLsSwCzqL1W0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jQtOzATKAaQKcp0H6ry9LZ8hoB0btcE5DAmFxHXdh6HeXMiVV7ZgI8Za7hayoEApMamb1vBs7KMkoO+Mheu4bfi9IB6sAT9jW6MaQHwri2VhtIQimJCzEynjb34B+2ExSTmqDTF4JQ7VcDbpwhRYYVAsNItk5+XOlBuuLAJ+HO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RyT2Liy7; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RyT2Liy7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXenIfdjOkVly0wK65zBJ/4aQAO+3VPFWVgw7ZylFYhtJ4840d8fCCCV7N1pOD/aCZUaVordzgYZvdiECA7y+C9pKnAafbLnA1kHD76l3fdCtI7LcDmr5BcS51qWOQPEiEcHzKCYmCqsD/wZ+1ID5vf5Jpq+1yFN7vC/Io8VT4uoQ+d0+luCbUIN1oNPztGiuGOx8Dq7tM3+kYKp87SDxS8dIzRSxqHMm37TvPoPGcFk+5q9kn5n0cwQNo+W0MR+4M3+qPRbSb/tiY774wOLB69vo+0h9kSwW44ixZ9KioDGLFnK1eNqUduR4meIB2yJ9q5k87QI0GNXjN1N3X7VsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoVfjxmONJ25qoLipFflb6ZEamc/bQJd5XfN9WJBDCY=;
 b=dTmoMf6zPrFppVRhHuurqYUzUZK1/WplDGgl9raWSV0XhpEHPlCPdXfr0A5pG/0RvBwFa0awIQyNszDrf1T8MMJAWcZmqNtQmv5NBUcWm2vMnO0pDdRqy0wFUL6s8FuVuvrEaAdXzVmZ6Ql0l5Cs/3JfQANbopSW8PB/23I3G3Tt911T0b3+38JjKsweJ+oFihy30fL6/rP5sRjK7PBEZFMXmnuxZarLYZRxtY3WDb3v7LwMGrIA8NCbm/8bMbQ69S8Z8/hkJ5g9Xde1EMAyVmjgLLk5Tq/T9zxBksV9/3ZKDlhOwf/g/3FGJHvf2X17KJfGQ6p2KVfGIMlYtcKBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoVfjxmONJ25qoLipFflb6ZEamc/bQJd5XfN9WJBDCY=;
 b=RyT2Liy7It+G7mshFdymoT3MDtsohj810uNiu4ue7Bf/luOP3WGC9J3xcCmQvNUlvhqDmOYtKbTQDEsztzR8YB/+et+7tiAzS9WXWneq+Z2RA1QjVBc/DeAHeoCCOAucIC4OOt/sgpFWA1ldNhmBQ95vLs6vZqq0v/up2Fcb99vlVuVm0zAKWNY+dUV41OGUl8bnf9elsXyDBGpyLRYSJKdB9/xaOWdSBRpep3FJ8/E9+ZCQYM4AncZsgPtYloamp+3p/2GBR0nV503kx3HulVnSDd/IB7IAWpvQjuLiCL6mwF0PR8V3D8gVb9ZFWn+jkJZ0BgHND9ugOk8Kpg8Exg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9615.namprd12.prod.outlook.com (2603:10b6:8:275::18)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 19:17:33 +0000
Received: from DS2PR12MB9615.namprd12.prod.outlook.com
 ([fe80::ae0:e4b5:9c68:2ea4]) by DS2PR12MB9615.namprd12.prod.outlook.com
 ([fe80::ae0:e4b5:9c68:2ea4%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 19:17:33 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCHSET v2 sched_ext/for-6.16] sched_ext: Extend usability of scx_bpf_select_cpu_and()
Date: Thu, 15 May 2025 21:11:41 +0200
Message-ID: <20250515191716.327518-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::11) To DS2PR12MB9615.namprd12.prod.outlook.com
 (2603:10b6:8:275::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9615:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d326c7-8e6b-4da5-ad37-08dd93e524a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l8SihsEBSvPfbdmy7GUEaIaF/QS56+AfBLlIyjZs4grxGmRLfJrzG2xr/eM3?=
 =?us-ascii?Q?qDB6zYT46/ryjtJgUFJSCe1UtF4CBv/Kj3xhYPrA0LOY3tYxNcw2hS7RvJ2s?=
 =?us-ascii?Q?VJ0AUnAgXAVzMyVK9cAFG3x3Z2TsP0k0hWyx55lRDU0DDPXmx/bEVsIafKUl?=
 =?us-ascii?Q?M+5W1TknH1LqxLSzKNF2TJz9eWR6B6Pf9636atlJmv8tUVl4mDfE5CXNUoWg?=
 =?us-ascii?Q?OasmDQXNj/cF64Ji3n721pD9RmT0ykfLY5V1mKoBnqtXYbAej93/SaiIcRXI?=
 =?us-ascii?Q?rk89fUFffByJwrUOZNAsqGLPqkWzbwkR7RLn13lCkm24BNuxkqdMgQ6cXjPY?=
 =?us-ascii?Q?3EMGGjDW4KktmssFvU6xiH747LUg8uEt5+wntvNxJMDjP+8b62EYWq908gKp?=
 =?us-ascii?Q?iJVFUdicNn1LNByZgs9aJZc66kwnvXeshScFhBiMeIADpMnK221XF8tBn95N?=
 =?us-ascii?Q?1HwPDyfAEneBZocGFmCX9MwuQHMq/uIBCbsWzyKxqVZrim5g8hAwyPbUNW5m?=
 =?us-ascii?Q?Vym5+IHHA7C3qysV5+LbnugK4KqpIc2L3Eq03G1Bi1piq49cFvwcGyWG1+Fb?=
 =?us-ascii?Q?bjCA//vRK7aKbIlQpOpogJLYklwg2Wkm2jmVPTkGqTqJJSLbE+9PxbR55Sp2?=
 =?us-ascii?Q?4Nm3NuNthoIjs/h9QYKS4bM6fUWtlOOhmJJHpDf/9EgHOEC/mHhYhujXWj4t?=
 =?us-ascii?Q?TcF3fjbcyIFPL8q7Iy4dFR//NIcApUX5aahj/QLfpj1ieILxpVUWMOjcUGwx?=
 =?us-ascii?Q?5D1JzRUCiuqHs8CQ6XPjrwmahzJMTpRnmr4wNfhpfh5Jd0vM7uECBlB+OMvs?=
 =?us-ascii?Q?2390j6FuzCkUGSuFRbZvuqaoKvO9LMx/A6qc7iJ0rAniJVcUf7omClvKc3dH?=
 =?us-ascii?Q?jcnrKryi3C84jR+eiWt0QHvvb/tJV2QINn4AeKXkXj/STuW69zCBsTy1InK6?=
 =?us-ascii?Q?R1y6Va6hXZcL4EPs9d79wFTP5MqQBbuvGOuTLhJtMeiJx6UuO6CH/UYG7r3L?=
 =?us-ascii?Q?b93xAtj1DupDKmVFs9f9GUXIboLLQ3Qq2BQJTLXtLZrzPA7VaQU61BUjOP7a?=
 =?us-ascii?Q?p9nKJCP9o+huIwZwFItIrBsrz2A8rFGOzKALg0p4VyIAwHl+dsGTz4BVTGUq?=
 =?us-ascii?Q?9hGwAnHbUPrAWUO4uOwTvswVQd9fSuxA1RB2SpYHr7Mu59smHSXuS2oUwU54?=
 =?us-ascii?Q?P5flmzWouZWbhKmayFYUogZLdVDKQouLG4WkCofhfitJq5N9fz7PlperUTKG?=
 =?us-ascii?Q?H0XGF9m8a7zxhYezLbMVVyaGWwJgV4lJvM6w128+ziSW+1HPNoAYHaeSRZ8O?=
 =?us-ascii?Q?xv5DM8Vq2wIxsAUt/XOrvgldJ3DUkErZ5wjKcwvp1+1j9XhlcMJJotvVG9R8?=
 =?us-ascii?Q?GKDtPkNRRCSicgSe/F0rAubDxaiN+OX7UnsBXBe5s4arNf/5+DuNDwFOzkI8?=
 =?us-ascii?Q?DlQyllMSUFM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9615.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s08+a6tOjkhJh9HEEXBbri6Da2VwdwRavcnVSixgZblV5muPiYK2OXmOSzHi?=
 =?us-ascii?Q?fRzManx2Br5iBY8JPDvX2eOQEKGwTgy9u+8a66b0LgAyPou/bcS8Lj6I3C/U?=
 =?us-ascii?Q?WSH26wy5wIf6CfDUNn6HGZHg/ez+R2bsSFGIk+/CF20of0dssoZG5AQs+C4a?=
 =?us-ascii?Q?sjEnqP4s/WzxygWfy1Oc74z6HEYAhBY2mK9iXSrZGiZ7gFA8HhpOwFCtt3Ae?=
 =?us-ascii?Q?KSPo64AiH2+xQER/yn+f4ha5+Bz6cwB9SuI+BR7/P3EZqVaxJpMvUwbGPl/2?=
 =?us-ascii?Q?9hQqPmSHlP8Ydc8pDXm358ajbpLsYpb38Dkjm/wF8ShEQ9MWXkO6f48spWyF?=
 =?us-ascii?Q?BCUbezuQgeSPP4TIRwOWyOcxwCoNMQI4krHq1tObGKPR2FaN1jQsw9x/1Ggj?=
 =?us-ascii?Q?V7wLD0L9H0IHc2VRhWwddeUPIrKp3W0Nag/OzTYo/QMl5k6CZseOz0RQTojj?=
 =?us-ascii?Q?/oGvdqSovc32Q1mOUN4sxLZphQ4lXzA3UFm9ag9fWq7Z2zp4nG8idrwEv9cy?=
 =?us-ascii?Q?02fJQAX+yvpimWla7aUKFaRNBoykfJjpa5ulyMCA6lvGDA5DTpdfwRcf2nK/?=
 =?us-ascii?Q?2wuWOjgS2ayKOxloGE+n3NShMGXSb0N0Gr7AzF9l8q/WEB27+rBH/m/KiPc6?=
 =?us-ascii?Q?NYV9+qzHQYD3Y13WBhh7to2+674pC8Ku/ugypDd/b0zVHIlxAeADb6I1Y0UE?=
 =?us-ascii?Q?lOqzeNVmmMhTPMIkYe9rg6ZrwHpU9ZdpFzplzhKHYt/h0gZhRFDp9l4OUp01?=
 =?us-ascii?Q?W1jbvADizXdvBqgG3cRgfH2tmCy23A/+XWJ8Cnc9YuTuw4cZFB+QcSTpzhay?=
 =?us-ascii?Q?VESNy6MsjAqx3r73WF5byGB3Cr95siPgogoTK66uk+CSUHkRm6iiSTTKIByo?=
 =?us-ascii?Q?N7S3D/58qIHK06LbyTOWibE6af9l9I2L89pRS47AssoHuAoF3xgjRZw/BGMZ?=
 =?us-ascii?Q?qCJ5TrLRjJ7OwdtuOItsASLguGFfND5JHygIvP2zbGLiiGNkoZFbomDrxzyp?=
 =?us-ascii?Q?E9XQzdzq+vuMbE3QDAh6up3u4p5LdVxSarmHPkEB7Pl9GvZbUq5aP0m/EIct?=
 =?us-ascii?Q?JB95jbKGfrP7Lhi+7X9IZefYR7hgIQpwlMzoXebRgXq+aOQIOw/OFP/xkUIg?=
 =?us-ascii?Q?DPGk/KAe3Gmp9fnpnZJkLWMQ4tu3Wbf6K8wHehHYzQHt0AAaVJLvvMjEDsXa?=
 =?us-ascii?Q?gyrBNAJHTutW6G7NK+Hzz6+QScXk/8KCI3qhz6J23XN7HK+rie4p/fbfI2Lq?=
 =?us-ascii?Q?AYWcRZB34KAsshLVzmpGFpHG8oGnf16nG9ySGOB2D9PnomkW/wDEKBwF4msy?=
 =?us-ascii?Q?8Vk7aQYCGFlmCq/xbzs8iHWIN6KZlIipgq51N3GQ80/3Ujxk2Dz1tyd7qmzh?=
 =?us-ascii?Q?CApbKh+WT+hq5kw7H3IjowN9R5v9E1u0JyORMpTDYILxDqje20IZ79Z/UJGA?=
 =?us-ascii?Q?uOY6BBBhRWHaWn0Cr6QTu4YyBPz2stFZqWFq5yQV+GxARltw0N6juaXPHPOx?=
 =?us-ascii?Q?zbKdNQsQcnhFcDhxfmaKLQzMqjAg/h+pES9BK3CHqRh//hZwkigQ9Gxs8cSi?=
 =?us-ascii?Q?hfSFWHJ2sHkWhmEzDuiN8SfO8+aHCXyKuMMSk/D7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d326c7-8e6b-4da5-ad37-08dd93e524a8
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 19:17:32.9816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPy19m/4TjkCCQHFwEodv3m7DllQovonkP7gmk53qexs+Uux7FW+hIC/TFTc2wrZ80GVaijpoUCm5L0MeAQuIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192

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

To address this, allow scx_bpf_select_cpu_and() to be called not only from
ops.select_cpu() and ops.enqueue(), but also from unlocked contexts (e.g.,
when triggered from user space via a BPF test_run call).

This allows scx schedulers to consistently leverage the built-in idle CPU
selection logic, helping reduce code duplication and fragmentation.

This patchset is also available in the following git branch:

 git://git.kernel.org/pub/scm/linux/kernel/git/arighi/linux.git scx-select-cpu-and

Changes in v2:
 - Enable scx_bpf_select_cpu_and() to be called from ops.enqueue()
   ops.select_cpu() and unlocked context
 - Add locking validation to ensure safe access to p->cpus_ptr and
   p->nr_cpus_allowed
 - Extend selftest to cover scx_bpf_select_cpu_and() when invoked from user
   space
 - Link to v1: https://lore.kernel.org/all/20250512151743.42988-1-arighi@nvidia.com/

Andrea Righi (4):
      sched_ext: Make scx_kf_allowed_if_unlocked() available outside ext.c
      sched_ext: idle: Validate locking correctness in scx_bpf_select_cpu_and()
      sched_ext: idle: Allow scx_bpf_select_cpu_and() from unlocked context
      selftests/sched_ext: Add test for scx_bpf_select_cpu_and() via test_run

 kernel/sched/ext.c                                 |  5 ---
 kernel/sched/ext.h                                 |  5 +++
 kernel/sched/ext_idle.c                            | 45 +++++++++++++++++-----
 .../testing/selftests/sched_ext/allowed_cpus.bpf.c | 23 +++++++++++
 tools/testing/selftests/sched_ext/allowed_cpus.c   | 27 +++++++++++++
 5 files changed, 91 insertions(+), 14 deletions(-)
