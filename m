Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307F82C15B1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582443; cv=fail; b=tgBkO+hqRtNHyNkzp0WlnDzsomxuCP2ubON9wS3a05RAWCGO9S7CV428nab5htEUj4cVaO/zFuPhaReAksiPp5Opk0urBguOpxqMFaN4aDJQb/URp5xhMTADOr2GMN113H59H67dxQH481VK12FkkbTzYvX4EMpcY+EOWhD1gcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582443; c=relaxed/simple;
	bh=JPs5syimJemC80Qn9Q3zhPA7p5ma1H/SFQZ8UQ7lwUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gvh1IpojOK63bl9x2E0YGPKuLj54X5AhWwk0mVuesQtf8DrKd+jExKRtQTlcTf54SZJpCGcmfW+hw+T3QQN1OUkcfTYYy9INH2narYti8zEhmP9G8kaE47mSAAsMDCq5meJHqzouPmrMcxvmqqDr96JOE/lwZML4HYn025V0J70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gz6yWDHo; arc=fail smtp.client-ip=40.107.93.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gz6yWDHo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtGexoIx7aO4vWUbJlituikGmd7PlNzdn0lzvGFZgPz61U9+Fwf1B8ubjdc0TiDuq1pFlnZNSEEkkzwbhRSzYpYYz8RTLrndfa7F3zRNOO6u1yAYyBxfCkj0ptQlp8o5nXhWdZeSKqX+BSsRzlh/Z/4hlf3BV8EUECYTWGVEX7VwSmBPshnzOpTsboR+oPCYHbszOoYPBwZhqXP+18MjJCqzrxXReDpQBSDsULQCckPDWFlz8mT03ADCuADSy6qSVYICdAYPmaWn/chJiN/XaMNRs6Ud7i3tQx44kyr9lXkv5JsH4idesn3BwVYsD8wyQlFqvERV9dVoCm1R50jj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRpsHjamVBAyqPLGxMe7DJMN/Ezwr8byEXFNbGwLry0=;
 b=KARUuuMZzYW1YUAkL7PQB2cs6qLVNtvq4VgQuGsBTq1GtDMm96OICJo8rYnMZK7uQwmhZclsUeHheulTyAHdeL++57+TaFn8KTC6uBg+PafA7AMZ4HUGpPfribjl0NEkLIme9h4Hr97WtAJIxO54/bUk4Bcp2rqbuvQoqRAhPh9K2wssVF0MuTQ1HCcAfX2nGi00DCGpeDRlTW0vGfprd7y0/mKzHgQCkGfyZMowSXBM41FxIJW/vff/lQYDwUp5JEiW0xxflgrIxAN7W0nxXENHNfWyiBcU117l6pPm/VjeKAHx8VNqIAGrGbS0shEqfMonnQM6woGhpmn6YIYE5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRpsHjamVBAyqPLGxMe7DJMN/Ezwr8byEXFNbGwLry0=;
 b=gz6yWDHo14L/RuierEGME5GwlipFCjmXwTimp1po7RXSZOSAxTwHsIAcprBSUlFSMPznA9Tp3GvkiE4FmYHKVD2ajutovn/OFgVIdZ8TVqYXrF+SU17ZQZo/Uou10Wq0PPTzPRcdNjAFaOgw8uiZCEj7P+DVRezvIVd9ETnvmrBS8quqs0vYqGnGYDTrye0Ugnw71bhHWfHlXEImaxhx2rxo20QKMYrmTzdsOq2fZDS3zXu0Ah2m0k6fKKBHVTaFG1dMRIeiUxspqvbBikXL1eZtK5Co3MkhsC5qtQDpWb6xYnA3gEF723ytj+tF/vIwzGCYmqQlsiX4Djicghr35w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH1PPF189669351.namprd12.prod.outlook.com (2603:10b6:61f:fc00::608) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 3 Jul
 2025 22:40:36 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:40:36 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>
Subject: [v1 12/12] selftests/mm/hmm-tests: new throughput tests including THP
Date: Fri,  4 Jul 2025 08:27:59 +1000
Message-ID: <20250703222759.1943776-13-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:806:122::30) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH1PPF189669351:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7cdcee-1b15-40a7-66ef-08ddba82a0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t9UEDdziptDAp+a7iaoP8X+kgKP/mW/uReyWy3hbk/ASN3cMfMCR5a9PYKnZ?=
 =?us-ascii?Q?KatOSLp9GNrgkEOeYTUyuOkC8hTGQwhJ1tfRSLnC7yO6OCRkmNJ3ULeDIQdb?=
 =?us-ascii?Q?EnjUVkW2maaxX700nksrlSTDKpwp7/Hf03PIMb78s6ghemCUg3CWd6gRlSwF?=
 =?us-ascii?Q?sxs1iL5NIpdbdzfprl2DDhC5UCJKh+3LzTH5KKphYEBCBiCno7FwI/KVA3pN?=
 =?us-ascii?Q?anZrjaVuWLgwqgeFrJMhonqZhtpCx0cpKNaZqHNaG3kWgK7uWbeb2t9LiJRA?=
 =?us-ascii?Q?gwc57kpKAQCAjjBg4UCNSt+tP7bmx9OxjFZJ36rDkS0uD3fzj+DftUyjaZMY?=
 =?us-ascii?Q?i6+Oayu6k8JvHkjTzZheNuIsK5FP0jYzoDH+Ax9gIuRO8hLpd+YvXUcVBfvm?=
 =?us-ascii?Q?cIg7LyECx8ZeUYrUERMGFw8NBrrElsxRA46Yzo9Nbjd5oMG8fC6LRV6Ym6oE?=
 =?us-ascii?Q?h4B91vHlKfZ7BuKQG8dNd+A6+Yg/E1MwgFevRpMYrTSnmcV40EP81Qao4vmQ?=
 =?us-ascii?Q?CGyW15S9s8apRNXJv7iounCVavv0WQ3SPA3cHmhXAAy5ch/HfFOLnOXhX/mP?=
 =?us-ascii?Q?BaqbwmRgG/1sCdAzA11/dzmeT34Zl6q7gV4PRIsri8LGBJmuygAu+Of8EaDE?=
 =?us-ascii?Q?bi2ANiBWgOutAq+HXnoBDt8QK+xT51LyG5H1arDv2fZYigvlvkY1ryZgXzJD?=
 =?us-ascii?Q?DEbyKQj/6dySsYZ/Qwousbe4KfJE+WejW8kgXmPUG1Cqx5/YmeN/lzMTI7+v?=
 =?us-ascii?Q?8iRx9cApm+OP4fx9nd1Ori2uHMW1rLh3t/jXp7QtXAVsaQWx9kMmksY1L4yI?=
 =?us-ascii?Q?DLdo9/fgbpJ/eqywsUj+ifL4ZrLnL+UALKmQLCmN0mhRsJ5wMsewEK/cYZ5q?=
 =?us-ascii?Q?nX26DQbYeb4Gv1DuWU8/7/TbFY4T6tQn66W7jb5MttK6g0B3gn8WQYK7iKPA?=
 =?us-ascii?Q?b8NepCLcSngLc7v6ZcUg8ApiKjRNrtyvnFGnQ3EQwovA3rMQf/CHefM8zWUM?=
 =?us-ascii?Q?rVaR0NwbkeU+CUWeMyVZhsiushQbT899PI7TxYU9Zd0wJlj3QbQYQdUyTDu3?=
 =?us-ascii?Q?GXNhyWa0H1dcp9R+oJeig/V7c7uohi291Kvx5CFuOq3rYyAckjVIdzg+BdQX?=
 =?us-ascii?Q?WkFfOfysoN0lqJNlk6DCWxcWqisQ8Y1gFJZZnjFgN7Ku/VxMCzzxVnVnG7/B?=
 =?us-ascii?Q?4z3pwfgf54oxqflegTGpyceyd8AR4NDk1xzOu9q7p2KB2wJrrIx/o0Giw4no?=
 =?us-ascii?Q?GWdrh36rq5390KAuCyOteEVY83CY1tCSKGDC24oPMpl0+MhPpp3FrlTIcsjA?=
 =?us-ascii?Q?QWQqse3NNbP0bIRyNtYEQYy6AjjwVpxGUG82v4P0LhQNg9zt6vd0HH8DFDOf?=
 =?us-ascii?Q?DIgbhsZyjR0BGWFQbkBvLeekWqOGGBt6+d+e8wmB/RoJuMWR4NkYQ5r0n/9J?=
 =?us-ascii?Q?Qz7x7K8JHII=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XqUiG26hS/Rrh9cfO5heE0uW7QrM01AolO9T+rysWodSMbFCIWGuM4MzTju/?=
 =?us-ascii?Q?YOJw7t/bpWXb0+Dymscc7xEHjvHcA8Qd7Tgot5G4UswFm87FecSphO1COzX5?=
 =?us-ascii?Q?2mGUbE5n2vz8c8ac7XKYlif9rJDZdcq7+BjcVuG6JgHIfy16MO0a/jje4SGm?=
 =?us-ascii?Q?1qMoov8Bhn/Xh770RlL1sZXf5TVIatw5kAHCsO4aN/VHLNQOhnheq99aJD1B?=
 =?us-ascii?Q?2gfgwl/KBzO3LXL9ywFCLETpqTH5kYIUCiJwyZYsR26svcg5pSYbx3fK9BOz?=
 =?us-ascii?Q?U/GM9fcS6xnep5YrauqY7XO4zxGIV01aidHtAp0lVnoDVDwSHJEJ28Xt2tgg?=
 =?us-ascii?Q?ckCk7kSZUmfXq840rbKyqzBHqAl/7un5TVW5WhyiOz4gJYsNZYLFJi9GHmQu?=
 =?us-ascii?Q?RLYKmfLl4kNro9VN+gWM21gkki/MR84+eAI2Wj8ybydXyJTieyiTQ7qBzQiq?=
 =?us-ascii?Q?uso1YarVhKqQz5loAtV3bjD1WbfnJPuTT+wJm3VSSWKtKF7UICqqYuo1lEe8?=
 =?us-ascii?Q?BiWHomGRqlMmPMK3XPJxp0KYrXbyTGD14ticIwsM0iPhKTawKI5lQZr6KS6V?=
 =?us-ascii?Q?LSej+ETsj8vhodX/jKbH3YM0tC7y+G3AdY8pF88a8HcBcQg6Hk0jW5x7f3cW?=
 =?us-ascii?Q?AGAoSbKWi1JcJjsjik+gtgNOBLBwwK6YLIwPn6bM7DJwgE1H62S/J94N6zCK?=
 =?us-ascii?Q?/D5d+k7mtggXFDABRZLslkOtlIq8WUUEUE+/I2XAgJvIxSbGQ8V2EJChFWLX?=
 =?us-ascii?Q?uHF+o6MrcYv2itAbqc/CEcXrlekNhQXbl+dHdaQXlR7snntT+LUO15/pybcT?=
 =?us-ascii?Q?VcSLAKnmLXObFCoHEF3W13PxrlK/PPygSpzv25gONhwa4drrff8kj/kpjIhp?=
 =?us-ascii?Q?hjzmnZONYDpfKhkO0WFOVsu5rMsdo73BCv9edwmoa1BDLrRjxBuYlMuu/EDF?=
 =?us-ascii?Q?VTN4c04ZxmyLX8KvmeU4xFCviTU1RocqRYa9mmZvP3g4OOkEV5kIuEvcbvjm?=
 =?us-ascii?Q?G44bWZ+mFIm3AkWufrWRUSNjx4uVxCfYkQAHvlL7RxuEwypDBYJvheSnFelX?=
 =?us-ascii?Q?D0X3EbnIlJy9r9HPJoq0GjnzZy4LTDW9Rt6X0fC8OAWZ7bAXgGFjnh3U68BL?=
 =?us-ascii?Q?2Fb6maAf5b6wfLo9UH9/pmEZ5zI1C4xmwsIBFAxbuSzGOAeqUz/o3siocY2s?=
 =?us-ascii?Q?IVOHS//o+V/APOs+9L2WSv/u4x3eAjN3ImZx3DMEOdezIz21iJ+/9D8eDTpF?=
 =?us-ascii?Q?kkvPr8Jrz7YjEL1EymG1ZyLz3ntVdD+4Ixg7/35yyQmkmRN63InGCyFWVGi/?=
 =?us-ascii?Q?B6rf5g96inLcxZFFwxkXVgUXr0I9c5VvhIzbLqjR1HyF67+P00ckKLoucsGk?=
 =?us-ascii?Q?E5WmPGpW5wLfTY0vae6eaWqqBvPbdVFMJlrIZm4QhW9u1lhDTmt1KEqNqVy0?=
 =?us-ascii?Q?1L40HKKoJoJ9e9aZHso6x5/D0u1UZOpC4FLu0BLYpO9oJ20wKphRHKmjM7LR?=
 =?us-ascii?Q?L8BHS4wnqy3XfAAY6uDhlAQ3RbAkOqsshwQiLgAuxtW5R/nFIuADClHhrFS/?=
 =?us-ascii?Q?3mQ87J6Rga6szD8rhH9WdiJg0SXA0VrPH22r9IWo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7cdcee-1b15-40a7-66ef-08ddba82a0fc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:40:36.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byy5J8uhkXhYB6SxRMRu94lQLe2un1hkPl8/AVQz1vUczOhTlNJElLuVrrbgF8ZyRe+VEA8St31Bb5SoMkBrJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF189669351

Add new benchmark style support to test transfer bandwidth for
zone device memory operations.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 197 ++++++++++++++++++++++++-
 1 file changed, 196 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index da3322a1282c..1325de70f44f 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -25,6 +25,7 @@
 #include <sys/stat.h>
 #include <sys/mman.h>
 #include <sys/ioctl.h>
+#include <sys/time.h>
 
 
 /*
@@ -207,8 +208,10 @@ static void hmm_buffer_free(struct hmm_buffer *buffer)
 	if (buffer == NULL)
 		return;
 
-	if (buffer->ptr)
+	if (buffer->ptr) {
 		munmap(buffer->ptr, buffer->size);
+		buffer->ptr = NULL;
+	}
 	free(buffer->mirror);
 	free(buffer);
 }
@@ -2466,4 +2469,196 @@ TEST_F(hmm, migrate_anon_huge_zero_err)
 	buffer->ptr = old_ptr;
 	hmm_buffer_free(buffer);
 }
+
+struct benchmark_results {
+	double sys_to_dev_time;
+	double dev_to_sys_time;
+	double throughput_s2d;
+	double throughput_d2s;
+};
+
+static double get_time_ms(void)
+{
+	struct timeval tv;
+
+	gettimeofday(&tv, NULL);
+	return (tv.tv_sec * 1000.0) + (tv.tv_usec / 1000.0);
+}
+
+static inline struct hmm_buffer *hmm_buffer_alloc(unsigned long size)
+{
+	struct hmm_buffer *buffer;
+
+	buffer = malloc(sizeof(*buffer));
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	memset(buffer->mirror, 0xFF, size);
+	return buffer;
+}
+
+static void print_benchmark_results(const char *test_name, size_t buffer_size,
+				     struct benchmark_results *thp,
+				     struct benchmark_results *regular)
+{
+	double s2d_improvement = ((regular->sys_to_dev_time - thp->sys_to_dev_time) /
+				 regular->sys_to_dev_time) * 100.0;
+	double d2s_improvement = ((regular->dev_to_sys_time - thp->dev_to_sys_time) /
+				 regular->dev_to_sys_time) * 100.0;
+	double throughput_s2d_improvement = ((thp->throughput_s2d - regular->throughput_s2d) /
+					    regular->throughput_s2d) * 100.0;
+	double throughput_d2s_improvement = ((thp->throughput_d2s - regular->throughput_d2s) /
+					    regular->throughput_d2s) * 100.0;
+
+	printf("\n=== %s (%.1f MB) ===\n", test_name, buffer_size / (1024.0 * 1024.0));
+	printf("                     | With THP        | Without THP     | Improvement\n");
+	printf("---------------------------------------------------------------------\n");
+	printf("Sys->Dev Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->sys_to_dev_time, regular->sys_to_dev_time, s2d_improvement);
+	printf("Dev->Sys Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->dev_to_sys_time, regular->dev_to_sys_time, d2s_improvement);
+	printf("S->D Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_s2d, regular->throughput_s2d, throughput_s2d_improvement);
+	printf("D->S Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_d2s, regular->throughput_d2s, throughput_d2s_improvement);
+}
+
+/*
+ * Run a single migration benchmark
+ * fd: file descriptor for hmm device
+ * use_thp: whether to use THP
+ * buffer_size: size of buffer to allocate
+ * iterations: number of iterations
+ * results: where to store results
+ */
+static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_size,
+					   int iterations, struct benchmark_results *results)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages = buffer_size / sysconf(_SC_PAGESIZE);
+	double start, end;
+	double s2d_total = 0, d2s_total = 0;
+	int ret, i;
+	int *ptr;
+
+	buffer = hmm_buffer_alloc(buffer_size);
+
+	/* Map memory */
+	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
+			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+	if (!buffer->ptr)
+		return -1;
+
+	/* Apply THP hint if requested */
+	if (use_thp)
+		ret = madvise(buffer->ptr, buffer_size, MADV_HUGEPAGE);
+	else
+		ret = madvise(buffer->ptr, buffer_size, MADV_NOHUGEPAGE);
+
+	if (ret)
+		return ret;
+
+	/* Initialize memory to make sure pages are allocated */
+	ptr = (int *)buffer->ptr;
+	for (i = 0; i < buffer_size / sizeof(int); i++)
+		ptr[i] = i & 0xFF;
+
+	/* Warmup iteration */
+	ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	/* Benchmark iterations */
+	for (i = 0; i < iterations; i++) {
+		/* System to device migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		s2d_total += (end - start);
+
+		/* Device to system migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		d2s_total += (end - start);
+	}
+
+	/* Calculate average times and throughput */
+	results->sys_to_dev_time = s2d_total / iterations;
+	results->dev_to_sys_time = d2s_total / iterations;
+	results->throughput_s2d = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->sys_to_dev_time / 1000.0);
+	results->throughput_d2s = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->dev_to_sys_time / 1000.0);
+
+	/* Cleanup */
+	hmm_buffer_free(buffer);
+	return 0;
+}
+
+/*
+ * Benchmark THP migration with different buffer sizes
+ */
+TEST_F_TIMEOUT(hmm, benchmark_thp_migration, 120)
+{
+	struct benchmark_results thp_results, regular_results;
+	size_t thp_size = 2 * 1024 * 1024; /* 2MB - typical THP size */
+	int iterations = 5;
+
+	printf("\nHMM THP Migration Benchmark\n");
+	printf("---------------------------\n");
+	printf("System page size: %ld bytes\n", sysconf(_SC_PAGESIZE));
+
+	/* Test different buffer sizes */
+	size_t test_sizes[] = {
+		thp_size / 4,      /* 512KB - smaller than THP */
+		thp_size / 2,      /* 1MB - half THP */
+		thp_size,          /* 2MB - single THP */
+		thp_size * 2,      /* 4MB - two THPs */
+		thp_size * 4,      /* 8MB - four THPs */
+		thp_size * 8,       /* 16MB - eight THPs */
+		thp_size * 128,       /* 256MB - one twenty eight THPs */
+	};
+
+	static const char *const test_names[] = {
+		"Small Buffer (512KB)",
+		"Half THP Size (1MB)",
+		"Single THP Size (2MB)",
+		"Two THP Size (4MB)",
+		"Four THP Size (8MB)",
+		"Eight THP Size (16MB)",
+		"One twenty eight THP Size (256MB)"
+	};
+
+	int num_tests = ARRAY_SIZE(test_sizes);
+
+	/* Run all tests */
+	for (int i = 0; i < num_tests; i++) {
+		/* Test with THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 1, test_sizes[i],
+					iterations, &thp_results), 0);
+
+		/* Test without THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 0, test_sizes[i],
+					iterations, &regular_results), 0);
+
+		/* Print results */
+		print_benchmark_results(test_names[i], test_sizes[i],
+					&thp_results, &regular_results);
+	}
+}
 TEST_HARNESS_MAIN
-- 
2.49.0

