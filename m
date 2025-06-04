Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062.outbound.protection.outlook.com [40.107.96.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70278292096
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047779; cv=fail; b=nVuUiJPkqX1f6KbpjSGyI9r5/ZdkgUtOt8bTHZtgEMcsiVcHeMXvn6PYiY/0NAC4KKeDk7oS0MEmAtcR+EeLvoC7KVqUYzA8cpifGaMdpM/Ovfr8JQTB74CKuhBLMXzGjqKVKdmcztAY3eGte1FUlWrJrVphliM4wm5RIYw5c5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047779; c=relaxed/simple;
	bh=SJ+J9fWrrUhY0OA+TLkB+MGCVw2DF37/6kljT6710h8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r7KqUe7OxSVnBk8MY5/vCZM4BrfpK3EUW8fsC0pp6inq6d5avO0bOlytaHHcZKKO6l8zCueBemnHcCzrA+ii10VOSWut5vHF6EIImIkckTRL3PztTjHK9IgQ+Hh//aZptki5nJ+6uTcLjT1Py3YJpTjWXMrzrXMj19AFTA+LrHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EKkmRZBj; arc=fail smtp.client-ip=40.107.96.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EKkmRZBj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aX44ohmEnv97mNDbrTndQI1Eqk6iUTAC88r1i3oHn6r62zZJtbUD0VJD4iZyIShe31CxTpDbQn6T5Em4iGMDJWQ2DX3AczFfEWdVzNCB/k2yBSl4WeCt/q8MalfyENS3NUYX6KgsrJmm9PaZgEN8BnR37ovigJzlRz9iBXCiVfTKuLLnwJHpztOL9lJy/JSAz4QMBNV/Cv5AQ+jTFI44qCwLx0XpwIBuuv0/BhGcvJ8PnlxMDHXwaapMm4N5VuSZF8Hb/ze0ZcQbReG/qp183pi3UMwSg5r5Ns6rgQtv82cAjqitBqpm3J5NJju0QPKMm4Kr5/sGC53H4JUyFIQDtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crzL18A/NKnDwPKQ5CwVYhV8XAia61ZUqlNuNiggeOY=;
 b=Q5CZ4+CpsN/jt69hQcQL94EwPF8ZJyEEed2m3HA5uJ7pMelv+f0+ATBLOvWkzzp5nDfheRVFkPCNZl852PpT3Wmo3x9744nbNW2ftGL94/PhH0mypNX/MCU44XYkC8xV+qQMv/h6XIghetaAOWIcCgbe77Ixpe7BDi69MhfppWVYOWdkVdUMQYsWt1YECt/lTk5zBiRrcc8tG2E84PcoNauORyAiYHTtZl93McdUC+CzWRSUrIrJu1h6gjlmc/YlQmrQK7XE9l2FQpKlOIyFnwcju/163v7MVQd59221fW8VneT+kFu06sIhYNSJjHAszI9MvTRM/eyzpjDDBvd2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crzL18A/NKnDwPKQ5CwVYhV8XAia61ZUqlNuNiggeOY=;
 b=EKkmRZBjUDN84gTTawgfQ+C3hVOvAGBJO9ZTjmw4FFApGtb4kod5B+e16/bMdLToGHp8e/4V3fwg+mEjJV6ZyD4VpPzIlkG9+1RMKToWjuldS7d3+kaxQpAIYUuFL1fagz9SdyFfTzlMqLbcWt2EU3RZa4V41ErncfKF/CiWW+DZiHecqURLXplkZXde+wVkjRski1e3sDuoO71pB+Ohv4nBdNVREWJfk1i2egEaWRLVEYIps43A/bHCWUHEWVMntEMOB3d326Y8VjZAndDmnUQVnn8+nfl8C53m5cMGg+CAvioYvmNFjg5J0Xb00a4FQshIOStKp/S+PFdaDaIqog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 14:36:15 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 14:36:15 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] sched_ext: idle: Remove unnecessary ifdef in scx_bpf_cpu_node()
Date: Wed,  4 Jun 2025 16:33:11 +0200
Message-ID: <20250604143547.708202-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604143547.708202-1-arighi@nvidia.com>
References: <20250604143547.708202-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0034.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::15) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: db21fd96-ddee-41cf-56c4-08dda3752942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2Y56EYI13OlnDOCO2ISWZiuBgh417W5R6juZJBqdFTzPHG6717bjoVad7q2B?=
 =?us-ascii?Q?d9h1Zrvxq9t11kxrQockuercFlTdUQqq9415JtajQyo7/WVD73r5aa6XODWF?=
 =?us-ascii?Q?cE4a89gMKDG5GE0R4eJHNXNAm+0K7lpLpuvtrDFeSXfYMyiZkewM3cVaLw03?=
 =?us-ascii?Q?xoEOnsNwxylF3tAUGfA+yuwzoe7IsDQB8wJFON83/JW9qYyuIllphXEFevfR?=
 =?us-ascii?Q?/giHGQhGeQrnYbRqXhYkGKaoDQBi6cusCkGOuEHlUiiwXbMIShCiiR/WCb2X?=
 =?us-ascii?Q?j0pM8695AXNycekuTayB2/if0cmPe+T+3i6XwrKVVFqjTRbPFcnG3jzWZ7aH?=
 =?us-ascii?Q?8zK0fpI8qb+sXCjb4VouipzvqQvtQuRJ4wTu93aORaleMdPsJYf14qxe24/0?=
 =?us-ascii?Q?KkL3Uwoo/9vxeIvq9Yqahsch//k29SnIJUm1e/TJHCYeTyVBI0vxaXe0/7xQ?=
 =?us-ascii?Q?iYpSaPyo4zZPLDsJrhwVYbAg4NhOOD3tjhMXREMbUmZy4Wh+u5OCHajOzL3J?=
 =?us-ascii?Q?KwospRxvQ6jGoVpzFZBGNTam+pY7XXzFPvmW6rjxRlQoPZK2lZUW2J9OX6bq?=
 =?us-ascii?Q?d20MBRWflNFLNV6K8DldFfv09TCfHikyAlSMaUYy4HMgONNEucHzdHq+B530?=
 =?us-ascii?Q?xGDdZyslGOsZqSiAJjuXJZbFdL5FKa9wWdfXA4yVDu4ib7wHah8wLr7bn7rO?=
 =?us-ascii?Q?jUmzA2UcDQJLjgpAyMMoRmqnqye+U87+DZe+Qg/cRPxr/9Jtdb7bR4uT3SY3?=
 =?us-ascii?Q?Eicp4+t6nqoMtT+1YHOtGapq3Jk2CPm5oEcTmgXEHndojUbzKAvPT/1jdEp6?=
 =?us-ascii?Q?pCtMjBFDZ/NX9ue6uYpIfrqQ0Y39fjL8RKujyAZqHjqxHvYfB8WVaR7dIwV+?=
 =?us-ascii?Q?6V27EnLKkhC5B7gASPOwzrTjt78vRKpe0nUfsBRdnPNsQD0zDvauAL1r9hv3?=
 =?us-ascii?Q?/U+JosbaAG2+gnRi66+Sxsjk0ikDvxhKJ7RoSAPX3k5CPfIr1jQZvutV1Ihs?=
 =?us-ascii?Q?v587vzZn+O8gcmQyzDVuEYOXNzAJz0aItol/30hCvNE0A0WbFClW7gqRu0qC?=
 =?us-ascii?Q?i987hCOe77IaDmlkBF/9xW7vL5ZFaKDj7AJevB5oCeOo58WzyL38oUiGopnI?=
 =?us-ascii?Q?SGHggwVzjXeoIqtIdrcoUVi2TJlW14uwIPoZYQn/ZCUyyVmb7s+Zr0qpY2yN?=
 =?us-ascii?Q?irZq3nEUkDZH04v/gRKXtfYR6EG1xxiMGbrCcJRx5piXCDgQJX8pS2fZd4oq?=
 =?us-ascii?Q?MTzrtINwJvfOYpZOynrrbRnS4/NjkBCZy1k3Um0K18vRWPsvsx+0q9TsHclV?=
 =?us-ascii?Q?F+V/jYLa6F7i6xDhctGJiecfurjHs/WLwyFvW5yOjapa6tkErDUD1sR3zf3z?=
 =?us-ascii?Q?QW2wtsPqD/ENIPY1rYkS3/YVtx5pCaY98RKpXeP9l9/y6UukFQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eeSoy/rMBxQ936074w4Mq/uGsebx/HvEiPGzkjXKGlwHNtJD1ryHW52Cc6wH?=
 =?us-ascii?Q?J8BQ1LQE96Dmv+Z+pjAUEcl3I5boEk5INyrmZf7MolI3u9vx6Kr3ZJuDQM4a?=
 =?us-ascii?Q?5OHbu2dktJtItzZW4end9nCqKRQ1JsJf7xlK9XkJhuyRGcMZ6Eq8F00/NHdH?=
 =?us-ascii?Q?Mj5YZq3wMaSCGjv57g+51JwOK0QK42zZYQRo/KSAonWDPNEHa5ZniSDjuSnq?=
 =?us-ascii?Q?hZn1SV6MwFwTmNKoTD778DmaXHAxSycdBIkX1YBMRIJ6kY2SfMnroga0VdVO?=
 =?us-ascii?Q?1l2FwnhVa4QMaS70+oPkWrsWdKl6IGrgvv1nGAknFzjKnn/qmNbyfpv0z2VM?=
 =?us-ascii?Q?F/F6jcTBxHlJd9j2aJ3jCLmqXfe07KIIgN3aZQkWF7NrQ0XaTMRG/iUz2k2e?=
 =?us-ascii?Q?mlvcfHB7X/dqRlVDN6FSWjEkfa4Nf4YiqUDoMElfFOBVl+BfYaDfRhATqEOa?=
 =?us-ascii?Q?eLCs87QOMOYgjZ17S695vo0MnE3IHFhiu/H6NAnIYRjMHAqjbisUQgi4ss4k?=
 =?us-ascii?Q?WVU7S8ksl8TOPhDANNcdGL1qWgJCsR3tskWTDao4MzYae0iJAQ1o4dVx5130?=
 =?us-ascii?Q?3c1LcjBhIe+uPT2VWL7WVGGoeyubGZabNvp8kIx8PKLpRY77fL1cmhGqZvW8?=
 =?us-ascii?Q?RkqRf5uZH20IOg9q8TgZLo6GKr8jDUoz/2FPhkLiWzivakGbdZUXbu93IoVW?=
 =?us-ascii?Q?ZJr63WIvBqe69EVdj58n8M5sZ3+s1IDLXW9ptLV16CdpClrZXrXe2yU6ZdVm?=
 =?us-ascii?Q?q9AC5ySDcH7c7Mfif1/qwVPssYzpKliv7oTEvZmCssl2A/CH/vBfIlFUbjWc?=
 =?us-ascii?Q?yCUATnVN9LToo4t4UOK2ISh2UYR6NfvyCd7zTYt9xuoA4E35yP8+qjA34FtI?=
 =?us-ascii?Q?O/tDofcUO90BzkEunNTMUsexVFHxDcxSCfwnVDC7u52ffZNg34diJ/jjpaos?=
 =?us-ascii?Q?t0X2b3m9WP0ivCl1WMP3MiZV0E44ELL6k/HcNaJYF3eOon4eQ/BtHg2P+JFC?=
 =?us-ascii?Q?HknUirE9b0IoiB5vckivuswK3+D7B58cG4TngJF5T+2mT0cHCvJ1Fj1BMNZm?=
 =?us-ascii?Q?Ip/Q11X/m4FaNRmLsNQ/bo2j4TYFjZzK8yNcFaYSZkLr4pYKbaAO89ujj0jn?=
 =?us-ascii?Q?dPDWOHe3/pmxWNARASvpt89mWn67sd9IDOuv8Z4jMqncKU0p2/FuRgTepw6V?=
 =?us-ascii?Q?PxSvd7e9kyYAtBhs50TAuZB/B9zzsj8noPafpMjbr6tOIwTWPNDQf0K6dA7q?=
 =?us-ascii?Q?we6lbtJ1bc16IqwO14iFTfD/Qu9GsFRXtscosFylayrMuFbb3OkrhNTD3CZ1?=
 =?us-ascii?Q?AaBwko5vASAxelKpbgNfDu0/nuXVQnm9kbAESW/646mZeBTiOaNd5qSbVKd7?=
 =?us-ascii?Q?J3Q9vCO7liH5PSxBsD+MH9/NzqLTbSjKdtNG5vxLUv/OQ0wPdwv4SEO1v7TI?=
 =?us-ascii?Q?UoQkrOJb1lx0dAj2JLf8QRksCCJH7D4uZDggJQWGdhaiYkN/4Q/tZeRr1GwE?=
 =?us-ascii?Q?kbSYzlSgPQZ7xsqAUBswmM/fFroaxV0UYk/S/y30S1y94Mb9kAQ+qXUcOlsw?=
 =?us-ascii?Q?PyWgkXU4MuLin3EkKEu+SGUeiJmkBMK2YhdVK3sW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db21fd96-ddee-41cf-56c4-08dda3752942
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:36:15.6447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdmsGUFpb0HyUr3Jlvq8j+kbiPSop8J9KNzDgXI/cqVmUFBpMuCbcnRp3ZABpTL2ukAul1oXgYHHGKaeywysdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270

There's no need to make scx_bpf_cpu_node() dependent on CONFIG_NUMA,
since cpu_to_node() can be used also in systems with CONFIG_NUMA
disabled.

This also allows to always validate the @cpu argument regardless of the
CONFIG_NUMA settings.

Fixes: 01059219b0cfd ("sched_ext: idle: Introduce node-aware idle cpu kfunc helpers")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext_idle.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 6d29d3cbc6707..1598681b681e7 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -929,14 +929,10 @@ s32 select_cpu_from_kfunc(struct task_struct *p, s32 prev_cpu, u64 wake_flags,
  */
 __bpf_kfunc int scx_bpf_cpu_node(s32 cpu)
 {
-#ifdef CONFIG_NUMA
 	if (!kf_cpu_valid(cpu, NULL))
 		return NUMA_NO_NODE;
 
 	return cpu_to_node(cpu);
-#else
-	return 0;
-#endif
 }
 
 /**
-- 
2.49.0

