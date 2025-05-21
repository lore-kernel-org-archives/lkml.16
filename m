Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2629235067
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812974; cv=fail; b=UP/kGRb4+XbCnWm3+VSDexdla1w7L8+jzojwJIi3qv9pUvetnSkhuf4u0JK8VtlQnSeW5SPJ5lWI1XZSqOc3BwcHHCQeFIK1uXDMJfcT4kVLxI0NxKzF/B9y2s9BQZVQ/7iKQL+1a/qkp7JuZMc7iZhC9WlFlls0yK/9/liT7ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812974; c=relaxed/simple;
	bh=a13Ne3PLTR8CbuYRew/xlU+m2YY92IExg7H/ETq+E0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WKBnyzvPhEpSIvfhsdjdbT/+5dwfP5W1OdY7ZPsonwF7Y4FszPMOVZEzH8PyriUs9bBbb+PbNG05X5o4d7nNeRo52A61ypjYT2Vc2etcjxN+6ConKHeiVtbaURvVDeUHRtKxTKNhUtHTsJ5CqesHfwRgIOxctUaekblVDRkKZxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fqN50H4N; arc=fail smtp.client-ip=40.107.92.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fqN50H4N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaIPERzQ0Ybqd6FUlqnejLdxXc2SMcBT3iKgN9ev4iCtndplSrSNC3xkH06kOc+uEGkGLQIb85oAbUh7RFY6sQV09h347cXuaUhe4mGDf+EVh2cPnf+MCY/YgJVh7HpvwHgoGzaiAM52XtcFdKUz6TVYfq0jwpC1Nh9tKrYsp6SXqqVb/wcvb5fbhHCUeZsZgm5vAtuvgx6hQ2bUgX4V7XgEhKlFgeugEVlXcaxDpsKkD5RB2pTyJ0GSxEJ1fYWGsyq+lzdKKXM5HZLrZzoB7br9wlta+HNEYTDeYzR6k7wRhiSDcFE6qXRCQ7tKZGo90vS+CVuPVS+ARcTd36UrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcbyulJa1ZlhS/G15dDmXIMGOPxPy+eDa1pRZP7pf20=;
 b=pL9zE6ep3mC+RF0kYaj6UbI/Nk6iT6v8PzlXHLEAIunDVdY4soXcimO4JGkTqgP7KVP+h13WJfho1zQDL8p5l7HH1wLjL4+Hs2jwTEf4qLlYY9HzRFVQ0LHROHMNdHqJB4n0O5YWKAtk+HqwrJ2zHjYhsr+w4Dcy1b7kHzvmUUR3+4oVbTnbMPVdr8gF55FbVbFYYQMCgckVvSwiJV6l+8wMPnbdkAMiGgkOI/Ba/6uE4ySH2XPk3YrqrfvPEJ5iyAha5ujJJ8yVzK7ljVk824iJeSheFSRL7KyUlM12LNTVLDW1KHXGlmUzLeUOVjcdY49qrOs5ND5WWDinpQnhcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcbyulJa1ZlhS/G15dDmXIMGOPxPy+eDa1pRZP7pf20=;
 b=fqN50H4NpnEXFFiUMbJRo13Vp10YX3rmzqdKDE+o2lnpT5wCloKrB8bOiN9VMNZ4wWKEfGWKoYJWIfR0/zwD6OFS0rP76e2Mx0JsuYONFpME9ew7pZeBOfTSoEr2t6SJg6/PKenC249Orxe2fijbFcyDEhJEYnHm5aWXupo1UYkNGQx6cXh0ozNOxCgr6J2Ow31NgfM7X/2QOtTq6NQmp7seNW967h5YncYR3vs25At5aG1P5AMGadxk9G7AVKUZbPysakvYJrFBy7P2hXfhd/CaE5JBobVfaa8JD0QWnc3I/q6rx7uRt9TfVxdmVd9Z56zHP2mFSJNKl0YufcVbvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB8919.namprd12.prod.outlook.com (2603:10b6:806:38e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 07:36:09 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%7]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 07:36:09 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCHSET sched_ext/for-6.16] sched_ext: Unify idle CPU selection kfuncs
Date: Wed, 21 May 2025 09:34:05 +0200
Message-ID: <20250521073548.140307-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::12) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB8919:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d1080a-4441-4d8e-e563-08dd983a277e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ROgV9LN5XSOd5WmpjD4d75VabmJkiKtpK4PJKpkSuZ42QreK5ENrkOvm2nYo?=
 =?us-ascii?Q?Wijeq7S53YE0hm3R/vtE17Oh3P1TzfqaS1ftmkE3dSUh1vSKij9dSEQBnLXY?=
 =?us-ascii?Q?iO21kxqIv9/F7Ufh5tEehQHRxEHHrghA7G3WxPKmhhhrFj3SbdW5vx5sky3s?=
 =?us-ascii?Q?PBcW2y9Jg6Hg5A7SLnDVbh9rqYOQ2qTkYHVNA4mRvVO+pUiZ6crZ9iN5Rp/4?=
 =?us-ascii?Q?+7ZvzvjyVKtQps3zGZEqHm4YMPBneFtDEVsvL8QvPHyAHl91hYsUTZvqO6rT?=
 =?us-ascii?Q?pDpI2oGtJ5u1Bwd7IzciQKbW6OAt95VNDFJsiTSorB4tlv/6HOTp1pl8DMh4?=
 =?us-ascii?Q?ourtP86ZHiM/wOPwKFvXA8pEkG0n0TQM6t7GKf/pQo6O2kVZ1SwtDeuc1HjA?=
 =?us-ascii?Q?Rj4jVhV+eOCkmpufow083Ski4fjHW34AXYy7AMZEuuHBLiSGvusab+mDUEuO?=
 =?us-ascii?Q?TL2xL+GIsFx0pAIbQ4iLhWkSBmlj97878rPesEaflt6jSn7z9TyozXY0Qkgf?=
 =?us-ascii?Q?SMcEkPMqK9plZTPPRZBphgQI91nYmWEVmJRcr+PA1F3sQQk+UgE2RTYO6rYn?=
 =?us-ascii?Q?Ge7PqBimWCTUUQlY1c6rEFp58/eWC3soZxGR6S08iZgUuD7AWDVq2Ohex/Te?=
 =?us-ascii?Q?EgByqlEGo7LmEos9qSgQTWg57hd9CmLZrp/xz953VfnhY7eXmrxCvH2WtZXe?=
 =?us-ascii?Q?jJPfY9Z6fOety48PtgESXfvsUOsc9ueS5jVuh7mZlIrYXVmIXK9k/wZ5V1R2?=
 =?us-ascii?Q?pj7yT8IpucCv17RVNavvT6j1ws1qvUifJ7rO+rZbeQr9xnjDtQGr5V7BVyAZ?=
 =?us-ascii?Q?HtMxfPjuJmAOC9VQ02KnE381tj8W4EV1QtaTQA1fjTO7Sj4YP3FruJYC7i/L?=
 =?us-ascii?Q?qautYRa74HNiUuUE77VI9Jc/izg38A9TV0AMF2nJq75l0co265OsF0tdX2qi?=
 =?us-ascii?Q?UfEqm0bHQn8zCF5rsgkiPnJK+KWrAWQm+U2I1fAiERbbAF7x/pbErXXXbFix?=
 =?us-ascii?Q?bkCoypJBiWlR5eFqWq6EyndGwca/b00P/y6/B+taCE4gMVhYHRCk5N+2Rfsj?=
 =?us-ascii?Q?+Z1iPpf5Mz9B/XAYJKFDim6n/hPKJEiMjlAwfA4uvS3ak1U2B1HcWPcXDK3H?=
 =?us-ascii?Q?x7CU0aJZ0ZTsmFbfIQH/b+1k75QvHaIUl55jh/ak0XrffWZqIAiR+Vpci0gv?=
 =?us-ascii?Q?MX6MM5bs+IswuLl/X/0tEKdzKzBdnqFjwGRWH8kfcluls/fK6HSl+NLk1gL4?=
 =?us-ascii?Q?khWy+lK8NWLCs8qLM9uIZcgDeGiS7YqDrLUMuxFiUiqfA9+HarUyJB2o3v4P?=
 =?us-ascii?Q?+qUnXvEfnMElGufxpPa6B20rRwp4X2GpQNRWd9ZaW7wJQ1E4K2YQovCQxrx8?=
 =?us-ascii?Q?ZZKr3qyAXxRCjHynzoJBPpAezKNZpxXqMqGgvQxi+OpruGDLFmtkOPkvIRCP?=
 =?us-ascii?Q?gz4O4SUBiCY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sx8d1Aw7/J9TWwpM4YbWPJt71N+NzDmcslQVQmNOlKvXl9Zax5OhfEp3J0iF?=
 =?us-ascii?Q?MbscQQHHzGwiukn3Y8W8EKwkQZKA1MQM5eYtgc+/R/aKVRiFxYAXzYLdlhHr?=
 =?us-ascii?Q?OstZKtwndXMNBwqgzgwULKV74JaMcI3KtPE2crG7d6MRDBrxr6DAEVOOJWD7?=
 =?us-ascii?Q?1UZnitv3QXD6IhtxLCWQVCI3r7Xme2PPIez/XZGSpWgVRaSi7maMXp5Hl2Lq?=
 =?us-ascii?Q?gxdty4ClhVJ47gGLnMRZZqBq6sinFXMQDkwLuHxTqX4IQgq2OAPwYYY++tz/?=
 =?us-ascii?Q?Y6D7CR5pKzhvUraRIxObGRXeG6dbRmtaoQZB1GSiJ/C7qr3N01hbqJTSaWGs?=
 =?us-ascii?Q?lkDMbs+BqtBTnFjIcbN9jzdSSzIFxZAx44RFAVuZC7p+Oq4zYEg8gUPKs8db?=
 =?us-ascii?Q?lIYpz4OAjRu49rYRKoYg7hdLmobPR1k0hEKBWZ+cKnXog5W+V9xuSVCOOMH7?=
 =?us-ascii?Q?GyfnnFe09ZDex+3n0IqO6C0Oz851cidIIeaN10/2lhx445KuLoSsHS3gzoEr?=
 =?us-ascii?Q?09mf7OKVM7oCEOk5eQDAk6QrNIyy/xWGCW4EkLr2uZ/NjEO2SmZWLdzek4m4?=
 =?us-ascii?Q?RTVkYQJb593zf48GvgoCbG1f70xH63wYqIDhR2WFafceu08rkO1oBEwEKA49?=
 =?us-ascii?Q?GUl44tAnm3zJo9jheqa55HN4FGjYqsgL7uJ/kmeRMbAASgn19agdDF2vRdHa?=
 =?us-ascii?Q?7mfkHjZQNSsGRLWGoT93x6O/tW25WgsQBb/eVYQ9XrX/TbVbnqJVlrruawR4?=
 =?us-ascii?Q?sd9YorJ/TRB/srbWNl2+f7TnUO+sHtlaETgtg1UrAIvawk+HWYLAX3lqyBE8?=
 =?us-ascii?Q?iCAEGP4yGzW6VZNc+qmlqv/Vjz1kDrvUSsD9iemfBEAupIm9/13KbAa0bTGU?=
 =?us-ascii?Q?fHtt6FrcwjIEywWj4wW8pSuZtgbLWNP+VZos46K0BZE/sE4Dw8hcCn/BJYfV?=
 =?us-ascii?Q?ifH1zD8caVWeot2gWxXEyuCuAbZD2lqXxBP+j5ctbtSj+QoIrdYbCrGIUvJT?=
 =?us-ascii?Q?Y78AhFyotNdHt+Ps5TJbjOTtKn2eAzjlwjCGC0G7s4VxxcM5FG+7t5Cux8pd?=
 =?us-ascii?Q?v78cwroOY0p66BBAT66IyIJl268ttQjUS2vAzwNTF3LHHjw25QhvjfvK/6wP?=
 =?us-ascii?Q?P+pEq5HNMQ4SMUl8Kd2ejA5zE8PCUlUZDMk25DtZ/p8Ish1Zl2HLnvHHgH4n?=
 =?us-ascii?Q?0ZvYHDA5NgbJEaE7rHqJi1IEhfBuxEz14wcjo2eczDJU8sH5cTGHFIZgEIEL?=
 =?us-ascii?Q?Inu0xmNmMKQIk2TrpiC8jO2qdTXNh+fODj+viRHjkxw+fQ/1LWHwzbz3CI28?=
 =?us-ascii?Q?dyaxjBNT39SOGDh9VDTQ5WiGqinj2zJ0G/UAIFLjv2E21TT1gTYmLLqheriW?=
 =?us-ascii?Q?67hhtQ/2p/jLsbzAGoVrWiD1OLNYFWq0TxY7k6hShJADWscfqt/zdk3SBBYU?=
 =?us-ascii?Q?Hp0uE12bxMZbSfrLHE0/m2cSwhwqbUjGwaKfsSOaEWKwOMjdKLu7TKZgoJiL?=
 =?us-ascii?Q?Lm9qYK9Q5jq+rS6i85GR0nO1a8Xd6ZbmcKsBXKNQ45UTn1+36m+KUnifsE50?=
 =?us-ascii?Q?woJV5kqDOeVkwbnT3QAFsKFcBEEnhzVLvRQV1s9A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d1080a-4441-4d8e-e563-08dd983a277e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 07:36:09.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hn4mDMcXPnBxv/fh/Nww/m8eOIZsdtgVOJXcTlyfjgySUPra6hprRJ+H8+DWdm7FG+rNTABKwez6MuR2CkPpbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8919

As discussed in [1], consolidate scx_bpf_select_cpu_dfl() and
scx_bpf_select_cpu_and(), allowing them to be called from the same contexts
and update the corresponding kselftest to reflect this change.

[1] https://lore.kernel.org/all/aCl1nq0hUJ7IdtC5@gpd3/

Andrea Righi (2):
      sched_ext: idle: Consolidate default idle CPU selection kfuncs
      selftests/sched_ext: Update test enq_select_cpu_fails

 kernel/sched/ext_idle.c                            | 156 ++++++++++-----------
 tools/testing/selftests/sched_ext/Makefile         |   2 +-
 .../selftests/sched_ext/enq_select_cpu.bpf.c       |  74 ++++++++++
 tools/testing/selftests/sched_ext/enq_select_cpu.c |  88 ++++++++++++
 .../selftests/sched_ext/enq_select_cpu_fails.bpf.c |  43 ------
 .../selftests/sched_ext/enq_select_cpu_fails.c     |  61 --------
 6 files changed, 234 insertions(+), 190 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu.c
 delete mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu_fails.bpf.c
 delete mode 100644 tools/testing/selftests/sched_ext/enq_select_cpu_fails.c
