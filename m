Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74B82BF012;
	Mon, 16 Jun 2025 14:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085460; cv=fail; b=iOZDHmB33BNBv26Jjd7om82e4XENsCoQbYFi6j26po3sTwM120b+wiuMMq9ujNoHHk5EnQEDFOcQ3JsHCwgK82q8cYwUdYV0tAuZM+8ec/AhcLGOlQ9TFHlAGVmb5AtDsxIv3BCkecVmyGwPuVEJXMnkzBgZvcvnWbDw6oH6z/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085460; c=relaxed/simple;
	bh=WD6A4t8LV7e5iZF4R3ixg3TCMlO/UE4dWgDDNRZXM8o=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GCjDNcWTSwdKOI5qTcMl+sa8zatuuJN0vVBtRZKUdJp72wlxFlleQLE2SYXH167h6g8eDEGGgLrUmFAmqZyIkn8RPtsrPXToSW9qFkucDPH0HSOfeR7GoMJjAv9gAUVUdx7kB9Dd4h3MQ/yoVsu091lcYHwR+MUfeWhqu42Z71E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=DUOdjxwY; arc=fail smtp.client-ip=40.107.93.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="DUOdjxwY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNRX+9RoiOGkI3EpXJupfo1dgYch008qpKylpxQR+7S+zartPZO6d9SObxwP6M5VXgi6A1eSPewRc9Ql73gAEgpvkDB242RHvaQBwqPLgj3uN7FRS6UBWj6V18YUl3ZgkwF4Ejf24XS3e+9nl9uY7jhD6t/8X47jLu0f3TcL6MSyEGpLCNNDSlZ5gfMJpMEFV5vXHxGr++qB2dWkju5Z8JnnUpWFTWSSxYAspTOnfJUUBQXTr8bxGqJ52hw5kE/bCGQgn4TNkoHu1B+JHH2cFyyIV88Zx3556C1zxfdBB+2NH6M3FdcMHVldfotdlwDSStc5+FC6r3mdJ0CLy2D8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n01H8mkMOM04ONlNL/b8wLKfdjEbx4xdq8Br6yjRel4=;
 b=OpCmV6ZkTVHcQAFT8fa5Tz0wf9nF2bbZ7vYZiKTq3FPO+BhxVPOK62MENq0h9u5v0IYRrmgpw1t2VEqkHsEtlU2hyGlaRJpEtVCWSt9805cdQumSP/KBLw7U3okTS7j8U0OJmaR65yonzk0uPlLbaHj5aseMqUFu6mkUN2rjRb92VPdXAyvjwZFcXXPrO9T8MW1Wysuh9WWOIdWQGxB7ofchD8QQFNW/XyXSlidJVcHM874UA6QazId0yI/A/7X7GohcS313A50wawiRWe9pJgXQfvzdCi9YCNYDsSRhq62eS0Mk3pGC1aIGaeLHBCZP/FQUJ6uk7BMjW/kzagJnhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n01H8mkMOM04ONlNL/b8wLKfdjEbx4xdq8Br6yjRel4=;
 b=DUOdjxwYmNNCIVrZcsdc5OL6ks1enRt2fR58t/ShLunMqkNnm/rIONTTVJ9AS/r7TvNkcrLp6UDbU/KWgyu7FVO/RLTUBE5iCgf4t7E5z52v3mrgiY8hO8GRre0RIZm3wXsCcBFa1/z35ldLdZ6oNqZlxjNuhFdZVmEOfkp4JjPBgzF2dE3w5g5grG5n8lMMvtWfkmQbu235zjtj+6zu/IfvfXNbhPAewdDD2yKq3B2R+geY8RkM1OAxi1At8iZKmBiT4+dYBv8L1/uYXz/VQsiP/bxRp7hq7kvntelgMXM7UXgfXkYCenv7CemjB5Hini/d9VoYOA4RBdTHWsad9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ0PR03MB7128.namprd03.prod.outlook.com (2603:10b6:a03:4e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 14:50:56 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%7]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 14:50:55 +0000
From: adrianhoyin.ng@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [RESEND PATCH 0/2] Add SMMU-V3-PMCG and L2/L3 cache nodes in Agilex5 DTSI
Date: Mon, 16 Jun 2025 22:50:04 +0800
Message-ID: <20250616145006.1081013-1-adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ0PR03MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5853b5-b91a-4335-3a48-08ddace532be
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IpCNc7EjMKwZhSGE9uVjZJCQJpB0k0ZPIEcJbrWhy8X2SD9glxbW4WPsmaL/?=
 =?us-ascii?Q?lQniks6U58VjHl7txxuOn59whjE/A9p0E/mOarP+UM28QGy6Z5FfkjHzkDGf?=
 =?us-ascii?Q?PbQtY65UCrGag+nETBcfD9xX54QgfkZnRyxZ/QfWIkbFdvgXxZ6PC+JvZMO8?=
 =?us-ascii?Q?XQkMBCjf3KclGmVRouCgg7lN0QIPGctUC/snqHeMl/EHo3m1yuSDVF3xw0JG?=
 =?us-ascii?Q?edmlPpQXzwE1Ufnz/M1riwx/fUK+ivoJeQe0NcVgn0KfGQwR4ckpS1/q296Y?=
 =?us-ascii?Q?mBXQ4sAFEVD94g3s4RzX57jqjc5AVD9Xf7vpz4Y8zuj8x3+t4StbpAlwAl5V?=
 =?us-ascii?Q?UtKnjYdc/pgidGuB6H+/c8demReJsJuj4NfywH3ehzVdGlGBEPeMjYlS6dw3?=
 =?us-ascii?Q?ufBd0hLpvyq6ZLdY0uzzWcGgakBTqDnZa23iNrtQ+ydnSCuXUd0hpcvFecP6?=
 =?us-ascii?Q?r5U4ytrnyZkwBWV8O/im5FmaQTq9CmH4fsXUF17UlzJ2AnN5V8/nhvcqgE+B?=
 =?us-ascii?Q?ag1mL4ouDuhZ5CgY52FT9dYv3LfUWTkv3Rw0E5V0GvGN1lkEsZoxCp+0omN8?=
 =?us-ascii?Q?+zz9XAM0KOoWo4trfG95nwShSJbzCbZYZzudE6VDktNyK04SxK2M+ImJO4k/?=
 =?us-ascii?Q?VGD9A+XDf8IDVeTD36M2b+b73zwpMsmEo7stYQ9f0QJ5VFTZpS7UHlFh+9ip?=
 =?us-ascii?Q?6Ihc28mWMb6SKCxzrJ8oCQAqawHoAgiUgeYFeDJPT91DZWWnRy4SosEiplin?=
 =?us-ascii?Q?Zh6mlyRdjXZT7B5OIJNcfBJMsSfdT1BAFLnhwaihIKi2KRdmEAb3nOhBvrGS?=
 =?us-ascii?Q?axa0CyiO/FIz1Bn4+pbLhuW+p+lJi+tw32atWSs7NK9sS5PXoQGSnAhiMgco?=
 =?us-ascii?Q?9rHGqoCtm9m6r6Kz2wOoBJw3okluf7AF0t6PehKpWBddPvZVD1jpj/NJfqxU?=
 =?us-ascii?Q?uYWf58TqDqTzbaHsOGIxPtF71zMILwCVlENxL5KY6LfWvG5+I9XUEfyW9KK8?=
 =?us-ascii?Q?/e0UdAi86N4vOhJ9yoB6631DIwpWy6tbmdi394xT4/nx7/I1GvXRWnMf3jEI?=
 =?us-ascii?Q?4ZrdHoyPckM0UkgsAu4UAqDkaeUX2SW0ExnmfvFpnHZuH7oGos49T1A+0ynZ?=
 =?us-ascii?Q?iYd65pi6rlMgBDu9Yvjb1eb0VIAKazkqp+3DAnOdP6/tDWwICcHiVdoUH4jr?=
 =?us-ascii?Q?qP4+Oh5+eG32hm7se7MFD/Y8wP+r6qKWTgBSnF0YSOtYQkPc6rVFfYHKGt4o?=
 =?us-ascii?Q?uvVukJnuiW6BHDbrPU07zqm8l/34z50cSW3SmpEWiDDpdVMny42S3TXo/NWt?=
 =?us-ascii?Q?NfvlKah0EmW2yF7T6dSOJz60jN90wB5jd33v/Gy9mOpX/a2ockgdFXuy37Uh?=
 =?us-ascii?Q?MXuEZAUuYMtFymIzgLhTkm9Z3O2HjzRJ4RHOpM9j5sCo98QbnrKDQxEHwyXv?=
 =?us-ascii?Q?8bi1jerSQLs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yr/pq6HtgF2c0YVF5d8b+H3xs208mGhhCfHad/d/1JR6WM+I92r/JIRNbrLj?=
 =?us-ascii?Q?Bw8JRuuOLAy6V2c5J2vXl4CojX0KB1VkLhprzeeCT2ZXS/a1uQFeNlUkFN4p?=
 =?us-ascii?Q?70nFiyvG6zt+eTV93HTemIazJgUm8DMsN3rbFR/DDrN24y7dPSxXMZPnCmK+?=
 =?us-ascii?Q?C7J/LZu05NslJH2yfYrkW6681EOn/7zPgVvGKmHJQi/rk+DTOwLH21jCPDqu?=
 =?us-ascii?Q?pT6zOpM/7qT8OjFL19odGS34nPv6jQDrbsu81H30pi1umfhs4PmPcogMOQrS?=
 =?us-ascii?Q?+lREyZ6IgyaWF3/XIzutNgC9cYR4Q4TR6rdsvZRwyBYD0/eWMPfqmSH9Y043?=
 =?us-ascii?Q?Zz5AjMCI9/gMvRVtqHhG3BBQakbkGMNqZHpsUs1dfvBEqzEGNLQNLykrVBpG?=
 =?us-ascii?Q?wyNMI35gBQgCyodI1PmcvcWvvo3Ky595JAcPy1VK8m+GvmtAB/Wfiz8P6Vyn?=
 =?us-ascii?Q?6qiNGp9JJ/2p93lxwIjF1P5KVhmz96FqB73XBBgLgcUcQBB3INCTYWh+p1ih?=
 =?us-ascii?Q?JFg1m3tDXVhmurJZYydYUVghdZ9BZyyZXAZOXzp6W1q1SA5mcUQiqVATWXUq?=
 =?us-ascii?Q?A3bpsWgCIDyGKyG+ZZAplh9P5OkXC/U/dDACGIqGxy3BsbDA4YtvNvNJcryl?=
 =?us-ascii?Q?h0DzLMw8NwlzEICOmXgJigce7WR1D6bqsaAvIyPYMK6kJN7CQ8dWCMaL273d?=
 =?us-ascii?Q?nOmsdK2K0AIxSUTWAxKByl9LHr910I8Pz5CBknhi1OC51WmS/ZYUz5ROT1nf?=
 =?us-ascii?Q?bKpXclk5dbRtx/mLvqplkw2IBYcslhZNaVZqiZZaFgskGHaqiJUjRo5Qb2SV?=
 =?us-ascii?Q?DZXiOZJx9UMVa/BzZK24xUX6upjWPBBpVzNzRYnn3YxFumdtyWul9H+SqGDw?=
 =?us-ascii?Q?g9YX0Q51cy6LJ7t70jY7zm49dJ1/eXkI8/+2N+YwXTLlqDO7CyH1/C0u8vPf?=
 =?us-ascii?Q?Bn5HkZqtm59eOoUVTeTvW87Gh1goyd12P++bFy5XUwM9syBanMys8Be7gmQp?=
 =?us-ascii?Q?IIV0TRwx7qqj2OuQ8P4o+z7u9NNwQyiDXbAqgdPErzrhkLnurB//EZgg0ky4?=
 =?us-ascii?Q?9uFwksCaveesoRIGcZLTOv3VMLXRR615/MykE5IrXr+AosmJMGruCE/jMFz1?=
 =?us-ascii?Q?SWA17m6ZDFzgxYlCpah2XU3D1ndNT0Nvz1PoUPFSnT9/fnaWKuNzmfNGOOSQ?=
 =?us-ascii?Q?i/M4KGGDz6aGNg0ukHUO1JKiyd6yallhFAHHcIYF9rekd7X+XDbzI0tA/vOV?=
 =?us-ascii?Q?TzrH3QW2pSTwFQVULqdwtj2S+hvdVpxWbxf3WjWamu8YPH8Q4+J2jbSsw0bG?=
 =?us-ascii?Q?VM21E7rFv746oFb7BgDN2VujXM7AviGCIP8VEuJvxgWHarv0nCRufsht8ghN?=
 =?us-ascii?Q?nZxy2P2S/r2JSHXnRLBhcpBkoZCsIs41R8pfGQQOaeaqhzNqYNpZN6GZ+qUM?=
 =?us-ascii?Q?TA/kq8dP3l2Crpr0s1WpZXHIJppadK1PguOywrs+UPpO/NwO8by1Bh/yG4tc?=
 =?us-ascii?Q?9zARNqMKRiKm8t3XC8oJonSlgOOKLMYlSaYBy2PUwN9xCidUfptaJZbYPLaq?=
 =?us-ascii?Q?sJLWcAW/IpZ6mJU5a/zr4Ybj/NTk36GTtRNzHuUnHB8yQqlSGmy8cK9ZRxkJ?=
 =?us-ascii?Q?Qg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5853b5-b91a-4335-3a48-08ddace532be
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:50:55.8472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 656tz527lExovWoTVCblKKbkRx/KSQf/UCGBXil92RxqOrwg6nTGeoDfaBmIL7ZyOZqD3UQ9gehmAwXaGsTcNMw3uiUEJ7DznqTS342Nb9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7128

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

This patchset include the following changes:
-Add SMMU-V3-PMCG node for Agilex5
-Add L2 and L3 cache node for Agilex5

Adrian Ng Ho Yin (2):
  arm64: dts: socfpga: agilex5: Add SMMU-V3-PMCG nodes
  arm64: dts: socfpga: agilex5: Add L2 and L3 cache

 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

-- 
2.49.GIT

