Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9225C2264BF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190774; cv=fail; b=WQkP8wz/0iFIvWg/qXFp+KK//4F0awnxGC/Us8HTnKlmk9Wv0lV+M3Xb/lK6Yp9lUZdi3bC78Yzq5xXo5xEg+u3/rPUyIRpgxozCnW1z09b+iijecDhz0ZbDrlei8yL8MiCVRmgOYtfc0yM9SQkHDbcozGztcC855OdRT9F5+7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190774; c=relaxed/simple;
	bh=6/rtpKLyGymEZ2lqo4c1fRObJD6kYZfTwjVbH6SYFcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u9CBvL4wvUVBl9bml2bVX0GnMSHCsGRjdq0nVDjTyT/tThzwT6ZfDc8hyVg6j5lbEIo5P4GZlQEM8G0KnJoPX49lXsBqz8eOUOMlCPAloB5077ABZv5hNBdAwjOyie3hAeBK7/ig5qP/evGGCStYm4QC7x77iXjO3T+d84WvlYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZrJWmoPQ; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZrJWmoPQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUFrpnWHZOWJW12i9yDnRMgOPynFhzJeF8Mpt26D+yijejUpfwKYaufDSnW1pRRTZoYiINy1tp/2n2JgS0wwCUidYKd/HGd7tidFSJzc4FQeg1t3ya4xhTfcndwR76RQaAXvbhxODnibH3rlY6cniG6sf1i6K5h2fphVwW3Jaend0Ny/oLIdbxFHcfnSdBwVgQNL752OSYHcZY8G534zkicFc9gkgSpTJ3l3ecaRD1kogD8Uy5l0Y/uQbl4bXdKIrlEAZBZ7yi0Z5RRd897Itxh1El7mcnuF/7gqKbBV6vH+bOVLgr4k/Kpu6K9P5wnzwUCgheoDsHfeeCc2dDDvXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6M0yYH7PDv1AMXQOFfLzzBs3drxZsZV6AE1RbGKBaY=;
 b=yZYYE7uilHWGABQws5r0aSuagzVx+wyzlTrWw+mdOR4H/x4pIkAKyQFQ/X+ejBW1W2pl/GttKmWfx4DONjeD/7maeFLCQ5yeoU7TdyGF8XK7X56wkxGeEtAj+MkXXYKYj2nyoWLqusE75u1PfwLe20DBYK3/mabTXrPeuVz1k7IPfQoAU2IIBWNZewulMmiyM9SpZGS5CViWv5/fxh3CSonMngmIq0pfs/JJE4LD2HsYIej4q4dAQG/XO9TMZC1AEk3W1+wr/i49OtIdgPC2Adr6hRhLcaJayXw+hOyC9wj0JEGH/Xqf4aHUAAUQl7W0rGzIN+RGP68EAooS6tyrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6M0yYH7PDv1AMXQOFfLzzBs3drxZsZV6AE1RbGKBaY=;
 b=ZrJWmoPQC1gOOu3ukUI+jiIGwaiISJR3qHdUgiCgOdgcgHYWTmTSq5tteq0qd47ei3ZaL8s8ILgGgv0JvH1QGxTUDwfuJm5ucJuRf0Ditr4OBH+glyHCx/pLITaSm8mNLvgux/jp7WRbiNCOnBG61CWzu6kq84MJr/qhg0o1QRWrST5xwQs0V3XiAij0TbMU8jKjcSP0s1aRiUHevJuBSzD/Jw35fW/81jZRpfwVhKZLWJnRVE7kS2VDIh9Xgfjg6u4bIJ1qLjP3hBXl5itHblsZozulOSuLC+IKAGcu3CJbRLqUl1eLRcz/wx7yDbQ3CCWS8SJ/xUrhZQxEnicI2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL1PR12MB5731.namprd12.prod.outlook.com (2603:10b6:208:386::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 20:06:10 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:06:09 +0000
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
	Valentin Schneider <vschneid@redhat.com>,
	Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v4 03/15] sched/deadline: Clear the defer params
Date: Tue, 17 Jun 2025 16:05:06 -0400
Message-ID: <20250617200523.1261231-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617200523.1261231-1-joelagnelf@nvidia.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::14) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL1PR12MB5731:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b965f8-1153-46ea-3802-08ddadda66f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TNkE8ilTdwyr34Pjud4EUMmMEKfBtsSMeYGQPKn6Umosm82748wnj9B1z3wg?=
 =?us-ascii?Q?Pf5TAG+0dxiM6c5s05N9hhgMeM4qBR5Prfb0Iz18ri1N+pt55u2Ao/ceyet1?=
 =?us-ascii?Q?f/l2aS/17GaGf/EG1ymM1dFcAlf/2f/szZ3kGrRTBQlbDzGD+XXP8dj6jl9T?=
 =?us-ascii?Q?GaErXpcz6E9lnIDXnOI8ZBZ6aL0+Dr13S69B4WnulYkftZ0R11bt2iWX+D5m?=
 =?us-ascii?Q?mRdQKeCAmfw2oD2vYgZTU2bKSEccopQTbFDhejUekbHwS9Fsc3WGvhDsMN9O?=
 =?us-ascii?Q?sL2Cx3EJAewX9X7TI2rKnRXx7aDp3vVzJHXs2jPVF+m/MAhF6KS5NfhMhEKX?=
 =?us-ascii?Q?dfK+EZ/9Cl0Enq6WPmhopWf3fqt7Sr9EGxD6QqJhUixWDBGFahmI08JNm2Cr?=
 =?us-ascii?Q?jgtGpMBTQIlJ9Pc1v06R5y9qefZeAwshOeQb/9wXe5PO9bNqfB5BbhDbm4of?=
 =?us-ascii?Q?PvF8mq7MZjnqjj1kwYnj3sZzFJSLJVeTb97bqJkT0b4q6FEJ649tkTAhkXil?=
 =?us-ascii?Q?AH42OW5UC2pqMfedPqMvYoN5DPvhrq/vA7GMTGGdaIsh99S3xaMTexOsgy+f?=
 =?us-ascii?Q?1ZfkSXFd2hx+d9GiKlgEIECHwlhbnXwzTT3AvPfnzoIdGzq62BK3ghhF7o8V?=
 =?us-ascii?Q?NzWIJPi30dV+bbQkx9VS9jrk2yAXFIc6edkaupyuSOkisEOm6JbdGfohzPEl?=
 =?us-ascii?Q?lcnEJKC/soGZdYkKmF34NU5Qtt+UkEZZAwDn9wi53YlPFpWyDQjk4WTGTUuI?=
 =?us-ascii?Q?cJhtwnY2ALUPInZB/9SsURm95T8Ca3O4nPd3AccjNv2kktkhM0EdLPMVhmF5?=
 =?us-ascii?Q?CgKkYqw5Vhg+WO15hkgzEG1xJwvUUiVZhK9Dv1OEKAWADmDEdqIW2apeI+6Q?=
 =?us-ascii?Q?yOkh5DX1d5t8kCW8A6fcbYYbu9wL0qApD/MKDGnBTinTfg/oF7R2CAQ8CSrs?=
 =?us-ascii?Q?X8SOMnPVGA+IisKDT45JEmRw/SZbASaoxo9OYmtP9ylU9EM86TVxHsWTzMm0?=
 =?us-ascii?Q?T+ZPHJwLSFF16Yi0rRPxhdOpr30NsmP5P+Q7VvTfhrgqKv1s4TS4/0WSrjlj?=
 =?us-ascii?Q?U2kaeiB7TCjcEr8Rl/R/kjdGIRm+xkw+a+qLpE7VZDONfh2klQMX92CmOypw?=
 =?us-ascii?Q?Nz9yQRV9DsSdolQJmHUi+EL6gc8X81C0vjw/KkBOQP3C+9n2fbvAfmvhj60b?=
 =?us-ascii?Q?UrHOUfinfF2RMBwEBxU2g4Bqw00rhiQOnglzoEYBUHUI0F8wWh5zo9Zj+V5L?=
 =?us-ascii?Q?D/9WKMEem4dXPb75wuAf1ypO2L6/Vg0aVBm0+HKcRgX/31Nfe/l6jCwno0X1?=
 =?us-ascii?Q?PaBPOCy18iFl4ESabgoPMUqZCpgT9LZk4VewpGQ4b1NyuoKCrqZiKBN89UUV?=
 =?us-ascii?Q?IGSM7C+NaRSI4OuiF00IXR2WIhQYlX314KOAKHw8t08FeRNDel7v2ASXL94/?=
 =?us-ascii?Q?wsCKwYuswWcFL1KA4GowTmyZYyVsu3qiw69D1yNLU5JZptoH/rqaTg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JEyDm/NdYUUfJYmTlEtIQeAa1+dh3iXftSP9o+343Q4rZSF/IOTOt/cduXXm?=
 =?us-ascii?Q?/TLEd2qkbsTl8IiXU1bRp/p99HlJYzQuWgeTGLUO4ploTQLOp2dFL28ihfYp?=
 =?us-ascii?Q?X/XCgQR0Nk5n4B82AmAka60Nw01B0dVAGg4NboUykAXMtU8XwyGOvJATG7P1?=
 =?us-ascii?Q?ClU3TALNSOnqGN3ac0+xQnr1D/JS/F4XmUHKUQrFH/DGn3X+ZbNJWFPvQcGK?=
 =?us-ascii?Q?N1tP2fEIxd9ZX0034K9y5BRdTwBm16lnkANnIro9j6WxYA7q9k6Ry6w5fUWU?=
 =?us-ascii?Q?vla943cpgcNy/mTTENDNtJxlQY9MA61dGaRpRRAt5mQKcEsWugsBeV6QI1fn?=
 =?us-ascii?Q?wGcJUZIbls0Og1do3ATr37w6ShNUy6MOoXTuL4Ne4K9P8uC+xMiX+fR+SVqR?=
 =?us-ascii?Q?L6IyqCKjGEnympJtjMWgvXWLbIZFIZO4Z/sL9HHotVyMeaMqczJVCT2qv1Zh?=
 =?us-ascii?Q?GF+D3aRI3JkuOFU/+VDtdlz/f85B2qB2C2ZFvenu/7C0ERR4Lpy9viu5lYMT?=
 =?us-ascii?Q?gfev5dIAa7FAJ8OF0buhYd4RxvcuqcVB+wsbhH49oNLZ3Ij0FfTq8Z21/+2g?=
 =?us-ascii?Q?xsgOk7vovS90BZ8Z/tUTJ9dT7hwSqEAgH3YCosWK3KXpiYccg/EzB4aYnS/5?=
 =?us-ascii?Q?X9bq9t43Dhst+7i6/9CS64sjVz+UkPjjyhT8TG/JKkHhcHlnbIKsRWly6O57?=
 =?us-ascii?Q?T7ZD15uNn4D+EeituR5vHXfo2SeZemm3qseXPWs1NWLwU4V8pTTaxxBXjXlh?=
 =?us-ascii?Q?cZciRRMa8N+etB90OQa+BIzmXeyVWRQSuJJt0IVJirF6MH+eo3VW9Yw0ZKQk?=
 =?us-ascii?Q?Y4RHmIJxQbwPF50ovsf/ZLfoB2umismyhGMlUHY8dob3vbrs1Hwx77kjH+jL?=
 =?us-ascii?Q?MSqMQtFBxJPUwHgwDaAG6V/XxBS+OxeWmih2/S1ANvPc4ScxAWKmXGHMB7mz?=
 =?us-ascii?Q?d1aLxHMovttQf8pMtHmz7fAoJ2io0HLFrY5gcwff2FirR/61LG1wTy1G6MBX?=
 =?us-ascii?Q?xwvDYdTJl1VMAgbK9udfsfOinaObSfOJ+VArxSIWWcfU6j0XoZboSVZTh7NS?=
 =?us-ascii?Q?pVAry1mGtbPuZsV+c1djURAxW0MQCojHCQRNRIM3ox2xJNeZ4+0OwWa3zzk+?=
 =?us-ascii?Q?E8yQNSo593V3+chXIRH9ZWlqspkuESedgA9JxdQc10c+pSW2fuZ5YpuNNJr7?=
 =?us-ascii?Q?h9lpEQeNwLRN1odHTvh7khpdIQtdymq8IsIT37jUq2uq4v05YyjQt2clw/ud?=
 =?us-ascii?Q?8YAA9LaEiM6QrtGXgPjXfaanwggJrLayr6novzKz3aFwQljjvbqK9+iqsJt4?=
 =?us-ascii?Q?NYUh16LtbgmuG9+kRe5otjihSx8J5nsYevrTsieVBig8h2ME9o5HBZR05jWt?=
 =?us-ascii?Q?N4ZfEDzyesqPakQTGttdynInWWw4wYuNW7NQEWefE5Jth7dGXfh/X96aP3mE?=
 =?us-ascii?Q?x2vqc1/r1BSpyZbxApou2yAuyygZIrrb/FDOIN7PD6/bWNV4IFhW8BGRJMhn?=
 =?us-ascii?Q?O39bxt7FCXkM6raZMKxuWkYEEgH5Nb9fmhLUW9p3oVLQRWZqCT8TMRgtlwkj?=
 =?us-ascii?Q?LBk+5yo0ONHrOjcqvLlDkkD0kDdjhA8M5OlXfMmV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b965f8-1153-46ea-3802-08ddadda66f4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:06:09.9486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ld7/hDosZSoQlhMQ8qquQjhRj4/3JTnZA8OsiQ8AddakzsmpHZlbTlChjEFPDzsNCKyjilcJC+tRB+gsio2hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5731

The defer params were not cleared in __dl_clear_params. Clear them.

Without this is some of my test cases are flaking and the DL timer is
not starting correctly AFAICS.

Fixes: a110a81c52a9 ("sched/deadline: Deferrable dl server")
Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 kernel/sched/deadline.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index ad45a8fea245..ae15ec6294cf 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3431,6 +3431,9 @@ static void __dl_clear_params(struct sched_dl_entity *dl_se)
 	dl_se->dl_non_contending	= 0;
 	dl_se->dl_overrun		= 0;
 	dl_se->dl_server		= 0;
+	dl_se->dl_defer			= 0;
+	dl_se->dl_defer_running	= 0;
+	dl_se->dl_defer_armed	= 0;
 
 #ifdef CONFIG_RT_MUTEXES
 	dl_se->pi_se			= dl_se;
-- 
2.43.0

