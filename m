Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21F254848
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791882; cv=fail; b=eQ4hrbNF3woKti/1MrJ96tJvW3oZxh8WOGyQqHaL/2NZAMPJGIHD8Dw5MG/BeTWnnrFJNn4qTKEyA5CL5+2C8AVPF2wLp2P62/wOEW0eTnstx7Bskrv42yPBAMFIGe/7T4O5rSlMkZD7GF0SW2M7fsxf9ZXJsgGDB1ajr/85RDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791882; c=relaxed/simple;
	bh=4nKnFvhy2MNwYJ4ihJgSUPWd/w2E2QiwfAt4wzKuEeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h3GyQ6gWk/Qv/2wDAKgDaj1uOpy7lN1PeG7Ei/vDNEcF2yfZkyIU8vf2PLB5IySLNFgL67mT7Mkqwxodc8R7J6kVcD38oc0wbPqTeKpOR8uyBtbgPzCjh/vBTxX/GKH+pzLTTnL1Hh1RrcTtgZWGEcw5FMGZELgAFe3nX13zC9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kHoxWWXJ; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kHoxWWXJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqWUwa9e0zCCJRh9cDVwdXJOFrgcSYfbFXth5hS2sZf0dUp0i2pMY+r73Di0mKO1jZ7WX1m2VwkuBTcH3Ynas3A4D/ttqrPVt2siP1ov/kSQgr6R6YiCxVjCYbdC+XIGFlok9GEQfN6tLpati5FVM/cEaJkG7EDr0ak58zWUxgeRkS/aRwNXJPzgS/AV79tx49NtB9kYQOZ2YHvHObqlBjMQk/rgwkGDKcmCHircTiPQyj0HdyaE+QgmcGcVU9vTv5D2Pkjq9yqJ9SFb9ekvAqy3QxSiJPLUBkIa7K2E/4aeOQDmug/T0F18x9Q9jHwPGh4NPe2gno+OCjmCxsoung==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duIcJFjbttVVq52TnSj6a3mGlSBt2B9iAj++KSgOA44=;
 b=rA5TShXGVPMQ934BmSM11/EN1+7Wk9TWopVZ4JBHoVspri5ryE+92v5X1mrijwFIYpN0ZY5cxQ3B1Xad3T4ZiR1sTzZ7sMGvqdfXc+Nr36HT7dRBY7jYiR+OpRE5PS1o72TwkjwOmUOh2VYnnAE85oTYs9jlfgm5btDDZPxAj1skvOEOJNeS1ApkeaENz1ntHOrPEu/sk/zALqY/CFpsn3amPaeCmYRlvZ0F//BnZfYlqgc+L/ZpvF7bHBkRMlNDLB0rRHMidwhTJ61rXpLu28U3Z5UqhmDUtQc6Nd9fgwGoe7qJZV5INv8a/7swNRJrSKZTGVvrFNg7LD7vsgD9ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duIcJFjbttVVq52TnSj6a3mGlSBt2B9iAj++KSgOA44=;
 b=kHoxWWXJxpwO492E8AUNcM1lHJA4llUgyPFH/hFMh9JYLHtWx6ssVd8yG27iJDojw7Vn3P/tySA0vbI4cnd0IQoJxoEWzjaHCduNt9PidQ1ItWSfdihofpqMLH2QjVhrzOIwQstsVR9TceYWuw918fpeiKWaCJcHsgT38h398ilkeyZwUIlaYRYRw6MbDjBCw42ehb1OYxNlLNKlqkTQcnaBUrkDyZWJu2zfdA4zEj0Suva1nnLm2x1lpbyGoUwCjp4xnzb8+EmxDRxQGSsZW04ELs6IsA+UfherLlDsP+GeucOBRn0UdbORvcF1Kq4SAZ6x4L9LEeLlGlPCNJeCOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 05:17:59 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 05:17:59 +0000
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
Subject: [PATCH v3 03/10] sched/deadline: Clear the defer params
Date: Fri, 13 Jun 2025 01:17:23 -0400
Message-ID: <20250613051734.4023260-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613051734.4023260-1-joelagnelf@nvidia.com>
References: <20250613051734.4023260-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0029.namprd15.prod.outlook.com
 (2603:10b6:207:17::42) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 22abdcf7-29e0-47e9-8d06-08ddaa39a9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9r5BwO0N3dhbyzfsfz7aKM+EyOdZh8ci/OgZxji1Odo/Q7Msg8mqKr6+6F82?=
 =?us-ascii?Q?IjbHCYI+LBKO+S0apNo2zFmGCKcu2vNuw5a1gKHmJsuTxbHl4aY+iEfk3URq?=
 =?us-ascii?Q?Ytl6DkCl4jTLShggkGg3Z5C9yBBft/HNu6Ei7fruJDoBgL3Hn9Xi6GWl0ebF?=
 =?us-ascii?Q?UdhLhXMI+csfzyDon1w838Ljlv14hNOuCGE0xvmoMmUDXxrBLHXDEPZ+VLHS?=
 =?us-ascii?Q?hp32NMgtv6NzVA7DnFl8CNPCY27J8vcqBsYoH9q6rCVR7/jzEv3Hrv+HyXOO?=
 =?us-ascii?Q?VZkI3YVMrf7qj3ceytaijcpQfLNCpWZbw41ibfsKZs3GgsxELU+uRYB2Oks+?=
 =?us-ascii?Q?42BonrC1Rz9/Xnp5IGTZYUzMjhzZNYvfTZ2mBenJV3U1oFi1q7gDTVMUp6pB?=
 =?us-ascii?Q?kbTruSAfDS5kkayhT3InjdbPCjk2vqZ2m02MyfyU6fLylmrKDfKt1zcHOH5h?=
 =?us-ascii?Q?Myyt6bvPi+XURfaOcS7XrfFSbUBBCnP5JfinVuJFIdTiLNCso0vicLfG/NTH?=
 =?us-ascii?Q?AaKeX0j0sRoeRCTL5LUN5xDusb7LzWFPk4ilZIAcWbXBU9KlKnwJh2TXbCCP?=
 =?us-ascii?Q?Eq70AN0F1lUXhm/UsYKhLsaBWC6g622qNn71uLOSrqOiP0xtAGONtMc4qXu0?=
 =?us-ascii?Q?swAb8vntqptsQWkIPmNjbys27gens5zPkx3KF8wc55VqeFwA+gcUzkB+6WbM?=
 =?us-ascii?Q?kx4C7m9R9WIvm5IvMGKRs86/4FR1osOdE3Ehm7IBiXYGU7Twmy//BfKRuK5B?=
 =?us-ascii?Q?Xe+RQZ1Ry/vQWosiqm1/bJqAwvjT2t/yI+X5wQ7dgYiBMo7pmoWBkJpx8td3?=
 =?us-ascii?Q?yyzEEsyokTXPtp18ZA+P43zRtAq/Bks9jnR5meXpF6RoF6Smb7nJcDREFi9y?=
 =?us-ascii?Q?YYv12AGv5CKWtl/K4xIr7p0srwAYS/f5sopHMmJuHnUvlgx8CpM5dBNAT1qR?=
 =?us-ascii?Q?FWtt2Q18RgTI/uii4XWwlkiJSIq05f0+doBxYPSEh6AQPepdd9QgPiUxmQSS?=
 =?us-ascii?Q?K3ySkPVu1Nie2xqvbu/hvA+8eOiDetdJ7bw3ePHAApwEol/9zIiSUGr8/Oxm?=
 =?us-ascii?Q?O/aX05KtKlLgITXNW32+eyzkxbJ+3jRSUuR65N4wjMlaj+Jl8lR8SwY2fJIC?=
 =?us-ascii?Q?3NSbPaXRTbqtkaTxoEME/LWLZ3Bi1MelwlGoQ03vXUWVl2S+ryXL8WXFzj13?=
 =?us-ascii?Q?VrCr33V+IGRaWrLqZm4nuqRDVvrMTMyLfiBUWICW2Y809tjOWn+k4FDGsQrR?=
 =?us-ascii?Q?u2gTZi6AbZSPI8AZMZNyDLYHe5eOw9SEMoYdl8MvSPy5aKDkTC6IA2Pn1Qj7?=
 =?us-ascii?Q?5lBABRWYkqsapttrmVALEAk+PMEpnH31RAXXkRdStVtpt1cETtodCjSMFqFu?=
 =?us-ascii?Q?T8FnAScqnExWiNGbRfYq8oJ1cRIYZWsM/7323Od0ZCxHt23tctwD9Jw6GyPY?=
 =?us-ascii?Q?zhQZZwccoWz0F8WI9wAOip834lNAllRP80F2sX1TIN53QoYnQt2/9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2TI63kylupcciwhyaqj3T27ZpZgd1x1eGTirPdGWMaJCVnvxvrNA6DCWHngR?=
 =?us-ascii?Q?Bqww2RBOtvlDqCdfzFLxjM9NyvU7NIqsRB/0Via6AvW0R5sj/4hs7JZjFPID?=
 =?us-ascii?Q?Cew//7P1OVqgZwUw6eXhCfvKHF9DXyzL+2w3g2pH7x1hP0gQ/WO8m34iclxK?=
 =?us-ascii?Q?1KHTWJirOTcE4vTzjrZQNA6I3Lqtu6NlIma5ssjkSzADHITMhfZdL432AJOe?=
 =?us-ascii?Q?nadVPeImFAewuinfNVwQMB2ka/7V4gkVMeCvVzVbn7Mjl6kaW2vAPetv65iY?=
 =?us-ascii?Q?CAc3n0X+1fX6FBYZWKpdJMOfB8PwJ2bWKfSZocxyrQSbFCIxNXaND119Pp7R?=
 =?us-ascii?Q?P1LLzAM1qn4UA7/bUyb3uoL5aRGhLE2EFDpudLBckoozfE9MvzzP4hyswOLB?=
 =?us-ascii?Q?b3QMcmggO+t2JZO3YY+FIqhgAmP+jgqO/enzFtWX1zrE4T0w6hqu2Yw8XmMn?=
 =?us-ascii?Q?YeFpUy+/dHNTUPDIkIt0cmEe3is7KAh+fp8jKsX6fEDcg+Ulrmk6Jh6e/fza?=
 =?us-ascii?Q?6TSg2jR6kZof4FTir/2giiQNpLd8cBBdP7s5Wsn6sZyUWD61CYvwr5shcyyi?=
 =?us-ascii?Q?VJVTczVMuV51BNoYMTQZoGPmRHTAZ7zcL5JWI7n+dGs41QaWlLPfEoHsuOxx?=
 =?us-ascii?Q?faEz/DaAimzjILB0jRBW4kZcAjaV3qwaTYa5a9ZzTK1br6wdecytd2IzXPbi?=
 =?us-ascii?Q?j5jwDPCqisxXtqOQoCWAxk7PppAe4khEP6eflVANlEeYRX2S5XhVlaA4xUqS?=
 =?us-ascii?Q?koHcd/chvy1bpb8Nj+e2ia2EnO7UqhOzgUYLRsVwGlgz7QJTVU583P5pFH2s?=
 =?us-ascii?Q?lzUKdS7A8QsHJyZeKVRQ3tGYuCpMaZHQN16qAsxPy+mEKNXPwoveeI8/mQMq?=
 =?us-ascii?Q?EPrr9gi8V/WolmNwjlZXQ6ibhV5uhiQ4mmRejQZs33ywaZ6EwB80TeK4c5kD?=
 =?us-ascii?Q?1KxHl2YyNGCyomAEP5NB/mVcJdMlrkTr/n0QP05/e0iG/qzrn4URRW1B50kR?=
 =?us-ascii?Q?6T28SVjiP8nN0cCNEd/uhFFJxE3XNCIacyQODn2Bqsds8jIfGoZQAnhZ20Ag?=
 =?us-ascii?Q?Q62gCvtNFscEKEJPg7+gopVCtpNzuI5rAbcbmsrxNRJXX9z/bd/UfXnXOB/j?=
 =?us-ascii?Q?FxP4wOpvLfTMjzEuP9FJcFWFiEhQq9F197SqDUvUzdbcMar/w2uvQPacUbDF?=
 =?us-ascii?Q?3cEY7MzPWm29Cta3nFFEGZrg5ASGH1Sk4zQVRdqFO8h0J3xugWFAT/I4g2An?=
 =?us-ascii?Q?QAJ6U0hOA4RJIfd/Z3IJLrsmBXWU9ph0d1YWHdBloZue7l4xyKQBvLOFoN/L?=
 =?us-ascii?Q?Ml2zcH7LGU42yJgrjSU/MhuJ80dz5B0V3Lf1fFll4f9eDLF27p0KFcSFu7aO?=
 =?us-ascii?Q?yXweFGzr/O3RaMJb/7VCW4phGZdaw8IAknstqC6YGwCmQjJE+HLj+/uvviR8?=
 =?us-ascii?Q?kQjUaTbJ54mpspXRjMGWwjNPTlhVZT1iUT20PjIUbyR7d3AglIDALh/CjDMb?=
 =?us-ascii?Q?DrsMcWj3TVjzgZhkGOzgtFSGCI/csaDNcXqFZptHvXPoYHgSIEg05CALLEob?=
 =?us-ascii?Q?ODQPLmMVLoEWexdZHlS++knhgDXfpiffQlkPr0VQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22abdcf7-29e0-47e9-8d06-08ddaa39a9b0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:17:59.4181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K10Mx+qQHLAR8YsU3oAurO7E4F5k6E9YDdYQybfbQkeeaItzV7B2Kl7yVnncDXhavjb7IB/cgkRaBqQE+5OxUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571

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
2.34.1

