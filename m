Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEB61F5434
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748938933; cv=fail; b=Yn/0WAoJxvOFjgIvRlvXGPAWlKeyRyFWamCMljOyTRw1hJBeXfAuS5VaM3SKRV91Ugcu+nAmH+S423Up/RzlBnnEGGtCzVgsnaWIIHNrXxnW8rqnWIrrpGpEMUnsllMELboy3fbXVBWcdeIUzIR2Z7p+tyPo8Bov2RnIUm/j6Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748938933; c=relaxed/simple;
	bh=lPl6xanG9Bs6enY99uPzqbm1heUD1HDKfE43Xep4Meo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pPd4TM47ZSVI9c2H5tzKeejcNzTtAWdvLi/4M75M+QPLTKIiLkyueW8j+8t2g/KO0SiK69rdTMFyuu+kXujZl5Kn8e2MlIN+ZukSf6kQHKXuXG49gZjk6MsTotSIH4+0e06ZlReIV9453bdEMqWHPJlB0Tl6Taqy5ZtGVa9CXd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OWl2861Y; arc=fail smtp.client-ip=40.107.94.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OWl2861Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjkj5XUgIBt9SgYNfLWBm0YWlt5bZsGubmMoftUG0kBDuTcZZ9Ga9+5KOnwK0JcL3A2QMnC/+dJiNkDpFapoL8fJWHUt0GnJ6UzIREEDGbh+CMN0xk7sazsQjy+uVn3h8siZoqCn90Wj5Itv14WFCGsAIkAruN8JxYB9zEK4QnCEe1gpBJdj/vgeFw20QNZTbZdjY6DUl1bX63lI6WRn7Hs0rfEcvWEYMfCl6nbTKslfOWRRG3sKbGfvZ+dXdF9JD0gQi52O27Q8G+BgUJcJPpQbO7asiNFkXUWfmw2Y6AwZMrCjEKOrilNmoyuDG3MikpjZzefRIQX1SEg9K30sug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HPEHqX0L7UYdfL+xGznPEaAxuKFATGCTEiA0tSj46I=;
 b=Ew+5b8fJA/pQtXNpibBoloBtDUycYXScOAKcC01oGKsnNi1QmsM/E2vjH6DLKKAfw9zgnHVIqyih5yf3PS5+Jc6fbVLKQloRIYfqdXz0jSUsPwz0+Si2cNNpqAg4cH5n6Pbo3TNoN1lHkZt8dihDmQszyNtZa8Y1O8GpeuGLQLoT4kZkhoyA9nJdHOwvCezSPyl1LoEkWnhsg3MLAqUcDbZ/jXgU3IFQUPny8LY49lN1oEvMJqzjfXdLnj8xgjq/0OtpfCaqkzGU4W0wv25Ts3ex2UAxXJStvqsjtUYQQfzl0K6g4G5obU+hqCL3MPy2E1vHwvX57elkPoTjt76xNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HPEHqX0L7UYdfL+xGznPEaAxuKFATGCTEiA0tSj46I=;
 b=OWl2861Y7D5qZDJ7v24U5SeYU4tq4Vxnsfezz5s7BMVIMCde+PRe4+HDpFBmwPip/QZeaF5vucLKqgz8c3xljYScSxIEPtai+aC8H+U3+8RIMuxA94bv8l/PGMu4PL5cbbMQZZcz9MiNaN/a6kCP9XpX3OITBDgNsN8zkSKHPqK2i/yEkbPxkJiSFCCbxH2NGtdYkgOOAUKa7kl6AkQ7duAcRtBITAZG5cnpLxB4cfJGrxaXBfqKLtvXfv6wY5dp1MVseMmqMBWKfl6FEcf5LSyXDeR+Cza3hDJlBzuzr8pzY0HDDBLoxF6NQhMR3jXyauNazHDTKoHmtqAfeHctQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV3PR12MB9330.namprd12.prod.outlook.com (2603:10b6:408:217::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 08:22:09 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 08:22:09 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched_ext: idle: Skip cross-node search with !CONFIG_NUMA
Date: Tue,  3 Jun 2025 10:22:01 +0200
Message-ID: <20250603082201.173642-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::8) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV3PR12MB9330:EE_
X-MS-Office365-Filtering-Correlation-Id: 2624a3bf-6b50-4c1c-64f9-08dda277bbb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tGxCUOPKRQPuyvCBQsSOL2f0E9T7C1ZzbRQTSqAlHXyONu0aHN+q5h8aPIlj?=
 =?us-ascii?Q?dRoFXarnFlelBQ8yY/YNe9fTIVoVU2jc0vtf0osZmcCTtv0QOxfAdx0S8A4N?=
 =?us-ascii?Q?pRWHVovQDSyAuO5niAwJ9WuC4JDvzB4v5kcO8fNU2Rxmun3HMB9gn8T/b/WC?=
 =?us-ascii?Q?3HgQS14FMyH3KWpihr90/WK9JqPEJpoQpaCUW5s35GxMcE4JYOfX3QcxlGzU?=
 =?us-ascii?Q?IFpSnu/MZiRSHrfm+bxtPbWzk/6ktAnUgfNm1B+GW+o87URVFdNg5pb31O7A?=
 =?us-ascii?Q?w1A2VXO3uJEgkfQXQzwx2b9T9qb/IJjWKI1amm2m1RCesWPsta4e84udA6bA?=
 =?us-ascii?Q?P6ZOHKQtMsVmu3WI9R69IVvZk1p1QkNxLObBWd/IrA31B5UBAbU8tN/qL9VU?=
 =?us-ascii?Q?LWpc10ZZVB28+ul67PIhkUNd1QyjT+FA0MsOwqDMx10R6fHhtTkaIMgYRHua?=
 =?us-ascii?Q?Y/p5GCkddnbKxKoQZa8K3COgV/C66Ooxrsm7zjWLnPm4TFB2+8uaAGa5xbUe?=
 =?us-ascii?Q?WfAX8dzdL5yCzrCAW4sDzCMPo4b7WBkqfOTaHb9M5KgFf4if9Ht+pzRjBahV?=
 =?us-ascii?Q?oPa5zVzuD5rAjZ/oD06IKIfxW1ECuOqY0PJ/aU9UxQz3s91xfN2VK6yKLl7U?=
 =?us-ascii?Q?8Kp3v9MP/C4dPynMsCNYAgobdn+kUE9pAuPdVMfxGfjOBv5yj3zh75k8gbLB?=
 =?us-ascii?Q?bzanmwd3zVbpg8PWegLOJtre5bYYJfJcJmJwlnbcIu++J3fhKTzkVgXmi7bA?=
 =?us-ascii?Q?abev2w/t1oYcmVJbeH0Dj4iulqcAFAoszdqlmf1N80/4XHGQ2p6vkD4+8Cf4?=
 =?us-ascii?Q?VclXwTQG5PswDmzyp1DDtQxmqGXtvhcYpf06+d+rwWpBktgblnDPdYSzM/mZ?=
 =?us-ascii?Q?iblyHfOoxsFZKoNmlE4fiw4RRTeIULU/PpmxMS2Y/Si/vQ6xi7MXumq6LCrq?=
 =?us-ascii?Q?LzTrMZspnKxGYifR+CdGXl82hYoPAS5IQ/wKfZoNcKKBgfjT7fYrNpfnLlTF?=
 =?us-ascii?Q?t1NiF3XFPSaXJGpFRUTc61a398O5VgOktY5zOlTRDVhjttEYDIWRRk52Loxi?=
 =?us-ascii?Q?cGBVVIHXYAK98Zl/6js9UkcqaofA3tlL88+OFb5Wcz9OEE0Db2StgpnhiCdn?=
 =?us-ascii?Q?ATen3fTQEsvb4MzeHaLwL3q1q2M9aaov+gHQ76uIO6+fLlSuDhqUkFokl6CP?=
 =?us-ascii?Q?k4KM+IPBoVyLSdUgmI+5bGqV5TEEvTRY9CMs0uJN0ENsIdZ0pgliPLA97s0m?=
 =?us-ascii?Q?NTbS1V2NMXpvqrC0ACpv8MCso9gvjlfDre6Edmuf9rQ6+8Obw9qg/tcbHVvo?=
 =?us-ascii?Q?GO9jKeEavFzLW7O71MxVEpmW8iHhXLFhrrB7fQ1CgdaVBDJvsELAQI4fMH6I?=
 =?us-ascii?Q?MXfX6tTA9uKNWWV/7kD9WqZWM69gONmq8nGpjQquosGHw/bJFlPogVTHbp8T?=
 =?us-ascii?Q?PhKEnMhyJSE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fXoTWByCxGMydGeWHL1t4/blnpkdwdChDQbZVu0/5PIKcz+GiLGVS6PxFIx9?=
 =?us-ascii?Q?0ygiC8Gg4StSmpm+eSQKrv4NC99UZpzFFEKXG15+3Bq8dhn0NBM0Mv0X7ovK?=
 =?us-ascii?Q?wjgS+LPHu/GF8Pfrh/zjEriqBG2cFUpcV+9+Y1dddcOmPdYgCr240tTfCe0U?=
 =?us-ascii?Q?ABlV+aqYwNuJf9qTr9h7cTy672y5itNuW1a+2o8ZrwBp5q0pDyso92h6PsTe?=
 =?us-ascii?Q?p/2M1V+DPaMQYe4yxUnpaaWA/2vBYa135eUGVt7brDmV6E/+RBRsScuB37up?=
 =?us-ascii?Q?+lm/aaLLMnlTE0SCisuOS5t1Nb+xGLqoLScKjUlrcfZOG2EuWG7o92vTbr7h?=
 =?us-ascii?Q?cEn6Kz4kNYLB/FjV5MzyOG74SeBz1o+owqTd7gvtNCzQW/H+g41LRTmVvlG9?=
 =?us-ascii?Q?yfgevHGHo9PieZWaOtHczmgoAgAMDuVnX2Q/QYdRfO0L8wCoxT/UmV2j75VE?=
 =?us-ascii?Q?I2L9qzLgZc5vVoL4O0k7PT2k1sv1wiixqCYuX064nZdAkKTjDwbOnbQ1zdg5?=
 =?us-ascii?Q?YCGEvmFQcuHZG6HKSuXuR8yU/WwSaZcY8z6NPrJ+/G0sqmke1gzySFLxU5V1?=
 =?us-ascii?Q?DkzmFunCzWyxBAlTyR/duUCfurREmIjk/Ld6kAILaVtmXfyPSat9VVNrUGuP?=
 =?us-ascii?Q?gmrHTSwNScWLXrB9EQOLIjqlCRiAwehWQK9t2yXL/n7+ZTd7mXAO/zrQmfEp?=
 =?us-ascii?Q?90s5CpYn7aZ3VLqOSNkTtqdQM7+uDXBPCRdYIt/ld6GjYJR8d+WT7PT+7fMQ?=
 =?us-ascii?Q?5rGaGTwsQQ/KgXBMDW97IjuQMc4LhUpx/NdgTajMvtfnfkuVHFVklzOKstxk?=
 =?us-ascii?Q?maxmOjCAc08OxmeCfBkEH02M5xrkn3zyI0ONuNcW1tG7P4Ws4nxkEA+OeW54?=
 =?us-ascii?Q?78l2b9fPxFxvHg6wjtz+cnkYsIhu/qGc1KMEEJypq2l/KLZ/QUuk6raE9vhv?=
 =?us-ascii?Q?hLzue5zkxHN42WdcPfqj4k9NQboY7LJgRGB/+oNlJLRAaokDq+ip/Hy4LFo0?=
 =?us-ascii?Q?+xnjpnArmTdILDDJPRZ6q1cNNeRydKDRm39/uoy5YYlkmgEOgZHQpTab+q+g?=
 =?us-ascii?Q?GDQrpvVf8Y9SziW5tp28VdU/TYMBkw64FP+AeMUWy1aZO5uq2H4uFHPRBM2T?=
 =?us-ascii?Q?nuUzFRpp1bzk7rCwR1h66Oz0PlSN3m9yu+UGMU7oAx7ywIvLZFsksvpGOBoc?=
 =?us-ascii?Q?rM+3lVRz+U0bWYsL9YvjTZ6r87ygdhHNJkj+3K8ZNpc3BHqIb2cRjaA6fpJ1?=
 =?us-ascii?Q?y/jORrRUom4yhugRWyEZmOKWbdw2uDPf2zVZyU6vG2/YQA9jal+VXH1Hbd7L?=
 =?us-ascii?Q?yvHcchni68F/xs1CRy2Zzl7zB7FBnPMfPfWSBmdKsMAJQR3sSkYb2+DQc4oc?=
 =?us-ascii?Q?dbkk2/DPBZcuCm5yzzQODMjNudAWxQbCoOBYsCAETNGB6HOQQ2iz+Eo+Inkn?=
 =?us-ascii?Q?vb0OwfXvGJOdRiQGt4wgLAwlQvTvSOiUUbko4a0WcCP0Fn+NDnIkyWoxSN8s?=
 =?us-ascii?Q?/cnOIe1Asi20GRoFnyZfv0dYHelZHYLsN9CF0gDlkM/U1bVhfviPwOAjnGfK?=
 =?us-ascii?Q?Gm1vpw7qi4HOhPNFiVvIhVJyuherBtsHhg697HGT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2624a3bf-6b50-4c1c-64f9-08dda277bbb5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 08:22:09.2024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yyq0Ydk3O4qipvyqemWJPZwdd1auPhMbmc5njoCJBittp5p6T4ZLU0jQ4wcgZMv6KosoIPNdzEJTkcfAIZTzGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9330

In the idle CPU selection logic, attempting cross-node searches adds
unnecessary complexity when CONFIG_NUMA is disabled.

Since there's no meaningful concept of nodes in this case, simplify the
logic by restricting the idle CPU search to the current node only.

Fixes: 48849271e6611 ("sched_ext: idle: Per-node idle cpumasks")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext_idle.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
index 66da03cc0b338..8660d9ae40169 100644
--- a/kernel/sched/ext_idle.c
+++ b/kernel/sched/ext_idle.c
@@ -138,6 +138,7 @@ static s32 pick_idle_cpu_in_node(const struct cpumask *cpus_allowed, int node, u
 		goto retry;
 }
 
+#ifdef CONFIG_NUMA
 /*
  * Tracks nodes that have not yet been visited when searching for an idle
  * CPU across all available nodes.
@@ -186,6 +187,13 @@ static s32 pick_idle_cpu_from_online_nodes(const struct cpumask *cpus_allowed, i
 
 	return cpu;
 }
+#else
+static inline s32
+pick_idle_cpu_from_online_nodes(const struct cpumask *cpus_allowed, int node, u64 flags)
+{
+	return -EBUSY;
+}
+#endif
 
 /*
  * Find an idle CPU in the system, starting from @node.
-- 
2.49.0

