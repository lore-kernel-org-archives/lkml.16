Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F1D28FFEF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047772; cv=fail; b=RP6pIgp7H7mCtFNBoBil50z9r+pDOYfMORrM+D8pOGLRfsjxf8ZmVVUjXiKRCSIzS/x6s9GqOWiOayY7yDX2Rsg36HtGCsOEpOCIgeeVmBZ1KGNrbMNKxI6d/abQ8HZdAXEi8/YY0xAIr/qHrfnGMDGd4rFFmz+X52TbFlxRFKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047772; c=relaxed/simple;
	bh=m6ESjw2pLIjvKhkS5VpsOJhSDscWa1TKgG+lm+fZL3c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YuFc15Dqh6RuSOhSsXxEKgJ3hBInlyFEQ/HCun6wkPOphw4j/xvPzz9jsEFtSNNn0lb2hm71Vv8R2hferVYnB0NUy2AJftJE2BKr5/BIq90XJvdjP525wzkUfGelftDMdE2+L1rgznjVkWc8W2QCqtt1RPE5MUvN+DJR6CKdR64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uUc7QGkL; arc=fail smtp.client-ip=40.107.93.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uUc7QGkL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yViOWNolCP3iEgoPO+gcqwTOkfF94hmF1G2c9AJJrGbauLHSXY9UpJedp2QcKaPt3OGLHKBZlRtoQkCSMPeisXzmcD1ynXwycSFQB4vJ15PdOZLo0aKJZq0VaqFGjcbNAdzpEWumarh5w3vU4/V6BZW5mdDGYsPrytcFF99lN8+mVQphinnvU/o6ZfJKHwwqWINGE/B5HvsiAHLqGPCyJ+qIUuBimTP8Pfpw8DJQBBFvfjkXSQuHbVJCnlq8MEgLI1jPVTIu/oyK/oGD5x+xMsrkLcdLymYJw8Ufb+cU52VqxlOf9T9sS2H0euGkol+jFCbd4sjBAJuKzPxXORlehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9s/yTnKDzuWbMIfg88a4Zlq4bAAm0ikOQlU+8uKRMrs=;
 b=i94jKQT+s8dbfWB1rRFuF+kAaSpR1iZ8FIgKR1Xl7avcco8EX65vqFGRHabYyrLXmhmofqd+B1T/Gur3q4AjgqKG71bSJVL9hjTwybEu0xVzNMAa/C5Gsez3TiCscQbzjL4GYUY2wnkXbxXkoV4Od82mZpJzjRul8jToZDPlbsFULOJRNgmtpgiWcl9xc5ID+gg/mQ0EQEh9yGJWRnPATr0yv+iJLTntTRhR53xRs2UAo/QNa5PGCJUptwjfu4P1fEmrPWVJsaCRu28thnhCmIy6WS9Uin1/ZOkSPUc4oCXAcUt6wHU28LkpZhwu4MVXgb/9PoBAHK0UhMozCNhiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9s/yTnKDzuWbMIfg88a4Zlq4bAAm0ikOQlU+8uKRMrs=;
 b=uUc7QGkLHjYRlK3qpYhFYiL6O+M2x540qz8K4j/rUH9vsIMvVCcsjSEY/8EimQW7Leu9tYX1Ui7QbYIMatYzkUCfX2vpuWSGQnNFECqg5b8Dt4X65xkXrxOylqP5PZ5PDCUfUE/5UvDMIirxO1ULUJsMxISUE1bFYipYFptooWHBXu9LjQ4uOeIZKbrGzgZ3t3FTkG4cIqj8vvnhogth+rd5NWANkv6BkIe5xkg/4uorLsdbM+dOCl79usDddLy9qd7ds+X4tBo7hdmAfhdSzkTI4Cq03M9PVw0rSBInFAOqkJMMs63gHP+atQ1zklm8c8Htk4WIxdMwqFW1yQ/Rfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 14:36:07 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 14:36:07 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] sched_ext: Improve code modularization
Date: Wed,  4 Jun 2025 16:33:10 +0200
Message-ID: <20250604143547.708202-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0084.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: 476ef614-f648-4c55-7884-08dda3752441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Nz1IhO04XbC5Iv3cDgiukbyM5eXQPXoPyEV4vbzTowMRSbPWTT257YIRQIQ?=
 =?us-ascii?Q?AVw4rrdFePBcLALCw5ek7QIv/9OxPKehw9uJ0k4ND4nsjrzNIVncYOO/1HlE?=
 =?us-ascii?Q?QFw/Fm8qQn1kirJ2nDVr4obzDo4QaD4VtLqAd6snVfwCxCImrscjPxgyNeS4?=
 =?us-ascii?Q?q/b0afgk59CD5HwGYUQMdodXWk9zzoQAUGeMG/vh2F/S/CH6n+AWzk4+BzJ/?=
 =?us-ascii?Q?u5KGxvdh4LZGYH9TXc0QNtkr8BQ/bzyMSvvO+79kpMje0Cj7YjJ0tyvkkVtP?=
 =?us-ascii?Q?+ca+g4K7u5KDQFrylj8Ml0/SznZp3Ie4EPgF4rqy8I3yGxn1+ouWKi6tGrr7?=
 =?us-ascii?Q?h8U+3pfbwvKTa7z7D4aGUoPrKpVi4qCABtyFbks0XJWk3ii5BnG2Y+vsz0dD?=
 =?us-ascii?Q?FEaO55Qgk+4OSF6ACESZbDyP2X7KvpEFan/JXOSFiO+VqWYbzzi0HTQpIw49?=
 =?us-ascii?Q?bmLw64/Arfp2Xw7u+0K5V+Vw2P4yWL2L5vIAdqw+54auO3u+9qwYGCTkku4z?=
 =?us-ascii?Q?kG106u6S0RFmbSmkEJtomWcFxRxGEA8O60xByudMz2lzflkEERtP+gdQo10F?=
 =?us-ascii?Q?WF0B/hlmbwtLc2sFN7WxkkGlt8EwsR6EqAQnb+lgcv1Y3UZj7vC8oCkjaC6S?=
 =?us-ascii?Q?YTBvRQYJ9TX/i4XlzpTzTz7LOKA5CyCOzYNJ5Of6DbAtWJ8n62fo0ISCoc5u?=
 =?us-ascii?Q?eN7n4ASBYIjIy86VYI709ExsubGn6z1egrbHFANEB7Fe1WQf4VMVRSTqNydO?=
 =?us-ascii?Q?XfOE9LXg2YL9oqtkKNoJg5/RLMvzM0mr3QPJLWeWbU8axBUQsJbrb1+5qg8+?=
 =?us-ascii?Q?eojNh2EweR8ASby02ZClQ7mMKcPPI5RpcqvhOlPcnqsb0UxRgSDwglh0DMmM?=
 =?us-ascii?Q?5drpYYZccM+j/7Iv4FZfkcpZNuxFCsj8IcqI00CCEW6Dcv1kAwqZJmRidgPV?=
 =?us-ascii?Q?YsGLCmrKwDUnA6UE0l1hq3LoILRyb9upc7asHV/MwEax5HfZm5IgAn54Hejb?=
 =?us-ascii?Q?smFEuoorkC28Uyjejt4s5WHoHoxZYh6U49taNQxD3OFw97KHDkC45058+nuK?=
 =?us-ascii?Q?I+XvhnLgEytmOTtXUdvBBFVfoFf3kea5GDGDs+hyvksoFgYSIzD5TZoDXdDQ?=
 =?us-ascii?Q?vf+QaLbrO/r7Iqj4enjiYYVv3atAt33cgK7n6YHkm1KxiJkKhQs/W0OxdSUH?=
 =?us-ascii?Q?7KG334YvD1A62bkNMF+pjoCey/9cukxzEy9JMTZv9qrm7oaNzn6mC9/qYr1I?=
 =?us-ascii?Q?d/Rb5MQT11eh0jMD8PCm87l3wepJwe95B49s2xEKZ9HFt84JvIokX/W3dZWJ?=
 =?us-ascii?Q?yFVGuKAq5u0ZVsYE1Ek/JQTtWML0uS8mI+gi/c9X7b4X9enUDNE0LcxMrlZ7?=
 =?us-ascii?Q?ej1WNxl2Xa/uaehSIzxgeloCPD5JQw9Q/7uF3d48IuelY5qfG0Tm9Jwx1a/7?=
 =?us-ascii?Q?AFkIti2CAAk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dgLMVMYhAM2908K+140/LCy+/8eErW3TLKJyvvO16eX+YnLYL9+9rFprdlrF?=
 =?us-ascii?Q?MtS/AWGHcxpFPaW358B+XSbtjoK2YBcv+NGCzveugLwQl+3cF6X4GbniUUMz?=
 =?us-ascii?Q?NesAQxxeVs3YJgBGwzgSjdk0Y+SciAMGRz1tJYSeO70lZXWqGtuKmthFQsX+?=
 =?us-ascii?Q?DDDctYqI4gdb1Hy9yOFbzB6e8IKTsv+76SP8azO8Bu7GvjQoYi2wVnURqxxB?=
 =?us-ascii?Q?/mpICH4Zn+cZ3grN77IUroBnQva9X2x/oaVsBJNBaHXWPykGCaZUTDIwB18L?=
 =?us-ascii?Q?PGR2IEnqy98lFdAP4i6J+DeAKm0dFVcugI/vxgaExE+jNeEkZbeVM9WLB58N?=
 =?us-ascii?Q?x7Kpm6IhFiquhKliYRmr3Tox/rIXZC4y2d9LsgSjknmphcXK+zi55QvBoBBw?=
 =?us-ascii?Q?OVE6FPvCKNIVaw22cdaOKqoYQxVPRXsaVs0v47T+Qydhqvf12oleqT2feeKf?=
 =?us-ascii?Q?O+x+L8pt2wSZR06tXKBca8odNgmMD7wswEsaSVxHCdEF7Me81cT/yY0b5PzQ?=
 =?us-ascii?Q?d9E6Pbb+u1lzGmD6WUQ4rFt6ldy/lZYpVFU595CQvinZOiLTnH5FHll7Is6p?=
 =?us-ascii?Q?0eEj/cGzwJUvTgaEV9GUSGANTnyCIRk3j4ts17BPHl0HC6M5YUo9y72uk1T3?=
 =?us-ascii?Q?C9R1yW3OrXL+GELZvNUjsyPUTTAZZs5ACtlMv4/HhBHoOeZ26Bvk40YVBpnq?=
 =?us-ascii?Q?mtsnYWNtUSyuD/Zhhr8qqYq4evOrHOd3UK+NiQcbrtw4rUDoxUzKINdx3fri?=
 =?us-ascii?Q?gfikUHOOPLzmQq3bVAF/2m/jIoNuWf16CuaO9VGyOT01b02WCNZd7uGuylh8?=
 =?us-ascii?Q?K+x6NTacM8slCEnkvk+z1kJ6xD3Ir7ucPA1ib6Cp9CnqozvSXmbYl30ykbCm?=
 =?us-ascii?Q?k2HHvJZUlZqIQ0NTCcptT6z7CMEn2b3AhbVtUseTguSPODRA2z+mfBIaDYEn?=
 =?us-ascii?Q?SQPnzNtnTJJhqbovT3kIb7WbmJtiypKte1uYScLSD8WmJunIyOUT7IptxlVS?=
 =?us-ascii?Q?RYc/5leS4B4MLI0qBya+xRQY9qb0kDzNQAdzMvr4MJ+79fBJriQAovYWyNgf?=
 =?us-ascii?Q?rcOv3qMyJs1shn4cUrBXBhA9O8PxFz2IsyKfDFQhpU9LKB4mXUsS+IVDVrwu?=
 =?us-ascii?Q?88emY5isydcs3kSzxqaCFqGFUAdFaGR30ryw7J5lCJR8RhpJCdnGHC3B3U3M?=
 =?us-ascii?Q?Gm9fNzulYy/Lb6Qsa0uhv7RV7hRfeqBk/5srzuB+TSlhBH0bJblZ7zkoiGlb?=
 =?us-ascii?Q?MfMpRBl4kP7MBIGT4ZoEX6bQ2lOUq6ieUsYCgihSFBTow2dPNl38lMhve9aC?=
 =?us-ascii?Q?DYJTR0APJ9TWPPgPFlZpk3dsq019EJExWwSC226PBOqkZ2iMQdLJr6b4kNhg?=
 =?us-ascii?Q?ZPtROV7i004JRYhJvoIGQue7QlMgYVy1mS2KbwuN33mNBh2GSpZLqGfIlRS9?=
 =?us-ascii?Q?YG4e5CFOJTM8QBtPnmZyCdW8elWUNnwnAyFrxyR29blcsP9AWGjOmaWjgkZk?=
 =?us-ascii?Q?L6YL3K99ciQH1NbwWd5FIbiaTFozioDW3okxPxf6SmY4KSC29VMiX2eeJoBu?=
 =?us-ascii?Q?4I2CixK5Holyjw5fw3BjCt58EWigQDOg1ZpKsoGt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476ef614-f648-4c55-7884-08dda3752441
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:36:07.3279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgzGgC7NGsmJxHPU3iXJ4/tWUh4VAujUAi85YiizlDOX1zbj6OCSzJsjRSQ7VvxJcFQBungOuIvRE5p+WnRBxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270

Despite the unusual structure of the scheduler code, where the source code
of all scheduler classes is included in a single .c file, we should still
structure the code as if each .c file were a standalone build unit. This
means marking internal functions as static, declaring shared symbols via
proper function prototypes in a header file, etc.

This patch series is a first step toward such cleanup for the sched_ext
code. There is more work to do, but these changes are intentionally small
to minimize potential disruption to the ongoing development, laying some
groundwork for a cleaner and more maintainable code.

Andrea Righi (4):
      sched_ext: idle: Remove unnecessary ifdef in scx_bpf_cpu_node()
      sched_ext: idle: Make local functions static in ext_idle.c
      sched_ext: Make scx_rq_bypassing() inline
      sched_ext: Make scx_locked_rq() shared

 kernel/sched/ext.c      |  7 +------
 kernel/sched/ext.h      |  7 +++++++
 kernel/sched/ext_idle.c | 28 +++++++++++++++++-----------
 kernel/sched/ext_idle.h |  7 -------
 4 files changed, 25 insertions(+), 24 deletions(-)
