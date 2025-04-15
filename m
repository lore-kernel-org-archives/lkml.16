Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6028130E58
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724194; cv=fail; b=PRlmX/BG6whLGqTEWl2XRZObmk2Uq+hfo0xK4rQUREXchl3XdfWNSYoeN7GhlHUNZhlJ7n4aQWAap+7xj6+SkJ3uE5idwxs4gZPKHe4LGG+2y2o/2TkVrlyhymrHa1Q3ClVlqdVX6KMYb2Suo9gfIvekO8CxPH0zU0p6UWJ4mN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724194; c=relaxed/simple;
	bh=ORfx6Amn+O8DmQHbCs0I5XLBVPm9Cvjmp8keVEes63M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WoimVMjn3rzyk2rIcU5ln2OKSzGMi+76rgiY62Ij1/5LYC5AG+OYpCLuqHkMaWpfXIeBgSsWDGcEhrWKF/uEY7IqMvDDd1VsYYxJCSCKTSD5g517OYzwjH+Je5hxSJW6i59Qdw6boyZ/AB8VSG32ZzD1Wpi1gzEPkAFbkexW5uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kwsdeOWN; arc=fail smtp.client-ip=40.107.94.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kwsdeOWN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzT3FD3Lh9HnqpRr2yhnFhpJXadZjt1Dxi9z9A2CXtnZvVy6JjMY9QuY6ei5Xf6hngtkKn9mZJbZiGtwEb9xP7O0svnwlu3CZZ02/56UQieiLTWHi3DZTVs8t49h/ms9D9DSFL1SpHxiuzmiu5c0U+qv3dD4p88E0dBvX8rseAnpdmwDiXtNCaW1JSVf+Ijp96YEIQYoL/PPTyxUfivDRRo3pkLx4+YvwIfRxnbm1EFNgf3l4TcxMPihur3PglJ71b5ziiuXebQvfQdnnDjz67M0L5T7T854hM8DqWr45Xqi2tIKDcd+lx0w/kwF0L4aQHOZ5bwh5cdJtGxDIlyMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVkYE6aOh1nEA6ekX8gKSiAs8soYAFJ4xWYApdV3INs=;
 b=tCLIf2TdKXva24pZn3lUkVuc/w0bMvi6QjhCgB+jFbiPW3XGG5bNte21KxxdWIdZsQqOrF2sQGW9Q0C+5XDL81ZNbRQGWCq6xoIMp2iXA+t9rVVbmYP63xNiESOuJJKzF2/cnJuYIWjsZX5EBKh5QqXPN8oIKleqRsMhfxEqQh5AztpiHHdNv061i73yUg0cWd6j8JDxr3UrtHF0ZRQJI+lneAXk1z8TS736654+ALaagXziiqWZ+WWX4+TIy3eoqmrvFtcOz3fmSb+mWFL1EtjNNABGht5I7njHd1k9IjUx8R+QCJ5Sm2B60jewZZBP22aVkXjEk8qtuQJN9mgaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVkYE6aOh1nEA6ekX8gKSiAs8soYAFJ4xWYApdV3INs=;
 b=kwsdeOWNpZjzAamj5GMONOWJGmpqhLpVc4Ier1RZa2MzHsV8I0O8l/JBCtYLEQ9ezLyWdxdLdY/d8cHqMBNg673PMUmq0jnFfGl0FfIdORLUodTgk3UhdhD0gY/68oDZmAove7FUoQRcxYZtpWlxLSDt7NBaJ9sTUpTqr0KRNkn8qkpfRJyM+ufHJZNd0qPBLwBML6gbmdViN6LuLBjzRbPyN2Cm+peBQYxFQjtce1Eb4mmC+0vPmziM9bC8LerU1JyLye93L3do8mC4ptanYkvzU3/pWyqsG5/5uYjSLIMH1TduRNfdYAtomYsxDCGjqZUXzrqK2BHWIWgkMkgFaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB5868.namprd12.prod.outlook.com (2603:10b6:8:67::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 13:36:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 13:36:28 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 0/2] My new rcutorture patches for 6.15
Date: Tue, 15 Apr 2025 09:36:19 -0400
Message-ID: <20250415133622.1563137-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:208:32e::24) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d81fe2b-1a30-4247-cae2-08dd7c22869c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Gg0LOY0iVFzlbbJEigAdsaae2k0KxG369Qh9lPx+EAleFw+wdTn1YNvYA4J?=
 =?us-ascii?Q?YLdJ3j7/YpdMBh1LCpYCma2QECbR4mTwtDKt7dlr3hXNMmgtsLaeJ8wh0u5V?=
 =?us-ascii?Q?184HOjX8MSZKvtU81n2PipzuQyRqKGLsXRBEkQcWubyt8HlMqKKCLHlxPD36?=
 =?us-ascii?Q?PSucZEmfEz8qJevK3IGIjX3Cgwd33+9JHu/AOL+9Y/BccCJvq8PKPEJSgtTK?=
 =?us-ascii?Q?66iDVqfBcdEEtJDcpaUAYf12y7BR4B7iM48r/lVtf/LWFTeHy3VSmqA0MDuj?=
 =?us-ascii?Q?gEUY+y3upgbOFxmhpBx6iNCZIHoq0V1AHahxf0YXmUR+CdzwNtwhLV8k76zJ?=
 =?us-ascii?Q?Q6E2R21ZwYkPItDIjoaYtTPc6blDFTWCh2I4T9wcPrZaH5SYRQOPNST7K6yT?=
 =?us-ascii?Q?xrZroGFXZf1R2QQIfCtwmkiAj2mpz8xBAezA4e5aOCDx+KlFyqQ1CBCqbzgt?=
 =?us-ascii?Q?Gzxx69uhIOWkllVNHYYzF4aCyUYpxIvzLV5gxNzjjMGQhcCv2KIP68iyuc2w?=
 =?us-ascii?Q?+E8AW3qQsq1PiMPJJ3/LgisAUs+mzKAkiA56r6vNuH1THYEknFgIFx5pJDiw?=
 =?us-ascii?Q?jePH3lsZzXv9El1QOOHD6YKGe58ky7bHkrjsldfXfOAG9YfbX/ZGP1+mUbmx?=
 =?us-ascii?Q?9o7x/YLMCColjpiLnmU/Gwu3QNQZ+0H5ApvI7WLrRdsBWEhDWrVjCgz/BiCZ?=
 =?us-ascii?Q?9kE2q/Yh7gc6/depZwBLq4LupEKwTH+0yTHPb9AwO+mqoz3LHJy5cqCa2uYO?=
 =?us-ascii?Q?PJbaISFrmNEzH6bZMpZWdntv6hlTZqff5WZdn8L59Hh1EaIDG9fyC8rbxqGl?=
 =?us-ascii?Q?ELVikMF0T3OZLUFl//vL3ErwF4irDy9Zpeqmg/ARRhNeZlxNyswM/VQ4CcUV?=
 =?us-ascii?Q?KQJH8c1jz3sRtM6A1WRPuKnok5jZtPILQfK0vEbJvjfVl/ERWTx9nQhXPvof?=
 =?us-ascii?Q?0g33/2JKfkyLuvpAMQ0s6jbBTM6k6eI8xqaB2HySHavMVqpZX4po+kt/wQsD?=
 =?us-ascii?Q?W5HPkInaidITrxFMT4ddfjmCnDKziYyFwE3wfAFK9PG4JmSFJ1GF3+n4S+Gh?=
 =?us-ascii?Q?LGA+n8pkwLfyjkVA45W9EXRUaBieeSRIAV7m8V7OnlAP8tHyeHrpOhb8fcqD?=
 =?us-ascii?Q?Oycgs9NS2AiM2XbW6JQBkvupem7ErElVfsz3L5bWFv8Xg9ORhNww/3o/AwP4?=
 =?us-ascii?Q?bPqxTaGfSkN2N7WGM4n8P3UnzrOUOn+4Fw8uR5SyRUFdQNxZncBTFeGaVufD?=
 =?us-ascii?Q?PQMWsY42zrHjzOuVqcYWLXgZAAPymb0FWnB1/5bzDLOb1W0t6oJWj3qC9BAQ?=
 =?us-ascii?Q?WWSSJzNu8bnprc+qAAHSdddtJq8NER7TuYr0ZoOAi6X40vANx4PAFAox4476?=
 =?us-ascii?Q?9UmOxqjdcHLz5+n8WTmxxFqkDYUl6IiXuL0m+jIj9Qu1+w/HoGHTBeHPsXSF?=
 =?us-ascii?Q?0dNWQRg9uvY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1EHfQW9frhfWCdkbXRUtL9XwtMDFNsiDvxmpFiUa6F5U8o4n3s22Ef3O92kE?=
 =?us-ascii?Q?7MKcSQtZ9fp6F37erzATeyWUn98yENmrsqVKrH2vwszF8NSYn9Ec/7xP9MKf?=
 =?us-ascii?Q?caKPCi2cWcPaA5PGLOxfA4aoDhZpLz9SZhN2zijd2wqDr4KfShAa+Akn8Qgb?=
 =?us-ascii?Q?xxOzICsSC0067r+dSOmNO5C7bq1tRpb0l9VTBewE78vIDDMSWz0Obmlk7OFS?=
 =?us-ascii?Q?x8DmFTIgZdkxrH2zMaMWw/hF/odCCsVKsh6WaTqffR3vt10pMEUSq8+p15C8?=
 =?us-ascii?Q?JvBCuZc6BXvPrXl7BBBFEHb2QYhVwutoV1uHcGM4epTwKFN6+96ubmaeNezE?=
 =?us-ascii?Q?VecxqvRYSEK+iSSYNDIodD8e3ddU9jZJmN5O/GcctVY54wjdLkhosUR15XgV?=
 =?us-ascii?Q?4E3ZM6AqBUSP9jmoLWLyPFAJANaCPWQbD1f3v/7L74Q+SvbtgZS232n+ofkP?=
 =?us-ascii?Q?oTxCyxYgJgVdpvF5f9jnDnG6Bfz9UIMdxjBFJ4v1KkjVjwHZhvJmABLRvrLf?=
 =?us-ascii?Q?cFUd1KQ9ZbSzWf0xsN+dcQGkJ/bPXfprr4qNDOxjmZ4nPfIUnX4rZaWLJzO1?=
 =?us-ascii?Q?FAPLPPAKtbfHAXfvllzKc+Rn3x6zt4NukY1rJlw9xtXkeTDTKIbQVtbD/14k?=
 =?us-ascii?Q?Kfo4EZ8HoSwg6oidjNEUob7cCnlu7Ewz/Tbu606o5iI/ps//UCS8lKvbwz7j?=
 =?us-ascii?Q?plcRriAJG+uHklFYZeNrKFe/F+oYKa1AXcRF/YmTA+lgTBpKvF8FJ1ACfmCZ?=
 =?us-ascii?Q?TmB5wflKw0LNdGJRs+jfixz8h30tX/xq/rVIZimp1EqbDOeNuZGNEycJ9Yz3?=
 =?us-ascii?Q?2Svpo3XpEUyA4PJxyLElrXa7fJ7JmlSRj38WAVCdo1K0ff1uzLjhywvReSj/?=
 =?us-ascii?Q?/SJFuCfGVhCTkeT7R89xPslXHguD8RnX+DoEM8qcaRaQEhiCk3a9DM5afALE?=
 =?us-ascii?Q?fL8gC0XZdCEUok8jQgLsIHzuZV40ZcpLdrj0XTXhaKnuxA4K3trdZGpwzLWp?=
 =?us-ascii?Q?cLkciL5EfymFSczOhZ4ZHo23VVEsPCc3aD1O9zTCxGoMgtkc50hfH+pnCbjc?=
 =?us-ascii?Q?kLltzDzCUNTwiXnp/o8AH7b70jHt47P5u8WilR6LkFW93Af62R+VVFqbalo2?=
 =?us-ascii?Q?3e2c2XMow8ZGZKrCTAE/zbqRlltxbo4f+ogdVDF2d09nRop7uO3v1EX1NxSJ?=
 =?us-ascii?Q?AkTHuWi4gDgfOiS21hc4qkdv5fn9pH22ErNcJKa32wSKWeQIjEstheacY/d8?=
 =?us-ascii?Q?MfrzLuVbA/IDVAPAcsFDdoAoqDp1o8YdYgwcyweDhtrZTHF0UEPbSglYvZ9K?=
 =?us-ascii?Q?1A6hF9uE+QG1qn6ya8/ul9sXm4M4uCV2MqM7qgtqETKkXrv9G48bBsDFXhoL?=
 =?us-ascii?Q?inQLYSvUGA2+3qEoq5Y2W7SVZZDC8Tnn+ji1niNmD8H4w2IoQ769Pu4u08Si?=
 =?us-ascii?Q?vlsi0KMwdvt5kLvkNrXMf1IpCmj/8hhEIO7wIO1BAzmC935AiWmTqO706aOj?=
 =?us-ascii?Q?34e9MGMvLuFPxD6mE6FBujSfX3TTwSyO/o/ao+r5P9z7x63jtDDnFp3NXCJ6?=
 =?us-ascii?Q?XxryZq5lHyizkgKKcXDCnr0nd5ToHk8k+HLheou/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d81fe2b-1a30-4247-cae2-08dd7c22869c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:36:28.6934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ghib1N9xsQPj1LbtgTDmgLhYcelPErTm6uco3lkdkCWh5fDpd6h9IIqCqkQc46iez8XXxVbhTzl1aAD/TDXSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5868

The gpwrap one is is v4 where I just fixed the hrtimer_init() since v2.

The ARM64 image check is now in my for-next branch, it is required to do large
scale tests with SRCU.

(These are only the new commits, the existing ones in my for-next branch for
rcutorture will be sent separately once we figure out which one of them is
causing SRCU issues).

Joel Fernandes (2):
  rcutorture: Perform more frequent testing of ->gpwrap
  rcutorture: Fix issue with re-using old images on ARM64

 kernel/rcu/rcu.h                              |  4 ++
 kernel/rcu/rcutorture.c                       | 68 ++++++++++++++++++-
 kernel/rcu/tree.c                             | 34 +++++++++-
 kernel/rcu/tree.h                             |  1 +
 .../rcutorture/bin/kvm-test-1-run.sh          |  2 +-
 6 files changed, 107 insertions(+), 6 deletions(-)

-- 
2.43.0

