Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33722EAB6D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750451575; cv=fail; b=HhbOFoJF/u2Haac6IsMu/qUduv4Vh6i2fmhdp+ot88jHDYu/IGf/gQLO3EA1PCkp4BHqmGuHDghDspT0zY8muqMvygmR1Jh6mpmoXhXRzbhjfXkQxrCOFE0ZbOr7jPtpeN/RyjGJGdDEMaws6yqZdRT+dtf+W6g1V+oygTCM+Qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750451575; c=relaxed/simple;
	bh=6/rtpKLyGymEZ2lqo4c1fRObJD6kYZfTwjVbH6SYFcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sSgicy5DH3EWa4mQIIl3PZgjIQYpy5Tseu4ZweFdJywnI59FBTpRRkZyEPdotGw+kTGymXGSiA5bdCuKc912fip/45YJnymW5n4eJAQ541V7IY8QnrrttJ8XQa6V5R8aHx3aX3L7yuO84JU5i4PoGoP5XZHlD01lUWKw+SLk/F4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pRTK1Nfj; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pRTK1Nfj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeaYDp7uxGfrinM5ZUQQg5y5P2+NPgiGGBIFdsvtLEUUEawTr9nu33PAyKQ121e6DnkBtwOxgJPqKHP9QcyC9oN4ZLZ94K01uGD26MlZ3zCTPzmdjhaLKmSzBC75h9TT3jvt15tvPpAyj/RwViDl1j/iqLE2GiP6BnO1ThgPDpEwt+2J7qYOBMF510SYdB1eRqO9MeCt0pSxZKRRejEo3qhIkihMGUkLj3fCaCESLkCqbiEehSsR4KzasMln/8wwqN8jxDz2A6u9rJuhjHAPhd/+yQgMfpuDhXHyF0TqR42ETa4FQmznm8cl39439zDVbWjUEYohSNvypI8bneilaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6M0yYH7PDv1AMXQOFfLzzBs3drxZsZV6AE1RbGKBaY=;
 b=PWb/bu0fsYq1ePo7fwH2/8dN7hf5WHSrw4nWpJCI3OA/djqkX6fUfZlJgT+WpnDWTcTdsOlFHTnWgiWY5xg8piV7Vju23d9xaHs048wlYMVCcUybAfzI/RLI6My/zYXBk3CJyzhbzmc0YjId25ywD2aL7Hp56tJnq4oF892PfDCD7oxMagTvcGrXEyh0uPaVZ90nOHLrFvF77B1SY1RaRaUUjzKJgYtG1VnWLy84ZAEj3tle1LMvTvGypE5JbrYYYd41m0+0fnIM5BMYTP+QRyT9x/GMEU68N3PSy4oVV9Cc0uVsFyLS+whikkcdeaxSa6fDIeuAH+mqV/U7n0CEFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6M0yYH7PDv1AMXQOFfLzzBs3drxZsZV6AE1RbGKBaY=;
 b=pRTK1NfjdLW+8US8VkTX5dgw0zmnjitlLPc+deeNHKLse648UJSXMvMuFAH0eCS9KJAHRXrW9jf1rFGAVJcyCyQyR97lC7Lve2XRxG5h7D+crTWO3T7jRISXZTTcIC3/26outcGtMK/G+Zm9Zuztsu9YzCoAqPYABa+yEdqpCQNTpYhwVcNbBh2RZ8NOSMWdaVwkjXpLQa5Z3mexGWOiwl7kJZFgKCbs/cB1i0qSUaHaC0ubDk/B86E6gT5uuLMCs2eQ9PuS8LbJGjv7He255mPr8DAlv+OzqIxnASDdXFcg4XCQ2tL/5YfvIjh7rb6zPYhM3GKpvDWzrogN0Yso5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 20:32:48 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 20:32:48 +0000
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
Subject: [PATCH v5 03/14] sched/deadline: Clear the defer params
Date: Fri, 20 Jun 2025 16:32:18 -0400
Message-ID: <20250620203234.3349930-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620203234.3349930-1-joelagnelf@nvidia.com>
References: <20250620203234.3349930-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:408:fd::27) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: edb8a86a-7e18-4e5a-3218-08ddb0399eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iZRPE/hFq/+AJzSV8DI4vSFxdP318R6F1xSadhJVoPs7o3m2Vfua0s06UpS2?=
 =?us-ascii?Q?FWIBY6Xnf750uQc0RHxfODtoZsqfnkxQhCAQ1U7GgIUDp1rKe5EDKXR0ZfTH?=
 =?us-ascii?Q?mBuLhcPPa9GWtpYZ2NFVr/EzRCLl/5ytRnMRSjTs9MYk/NaDy5806glOdrou?=
 =?us-ascii?Q?sH7a3VeAoOwvVh1ldL6HAr7/zBcjLhgiplEnu3rPL1ht/NlcBvnXIeUpcso6?=
 =?us-ascii?Q?B2t/cwXE5jGvudNuERSBL5b9t9iTtCsU487EeF5HNH/lHVZYz69zmEJKexSv?=
 =?us-ascii?Q?QpUedQxkOfXgPnX0L9yfioQ+hpmZ3GFSRNlKOaQ0dqByzZkILrHMiunjfNx6?=
 =?us-ascii?Q?GV8f3kgV+kHbWoM5UfjC8o0XC3JER9TDTRcutZKPGzsfO9WkLj3AZOG+m1Sf?=
 =?us-ascii?Q?9PHqXfm4lbgmftsQdcCyWxXP9DslOkCxuGbA1OBxjBr/8sB1rQl02uzxpIuX?=
 =?us-ascii?Q?izz0Qeg6DTdeoexYMjQW5LGU9EHH/guC+RHYZoBewZYr8jyYNKN1TBsMuRic?=
 =?us-ascii?Q?I0/IUZNSWTEiNBI/HTs45jrtSyUM0VLvbTxndmExvYInSm+orJ1j+6FYNl2x?=
 =?us-ascii?Q?s/o0QMhzmWbXstXUaPyQ2BOS2bq0S+SO+fY+NIF8+QWzfTDlBgVeULnasIb9?=
 =?us-ascii?Q?bUrvwfaZIU9a2RDjCflAqslVY1eB7nZSdox2F7Sv2SOClfJwum0RclPe0gBu?=
 =?us-ascii?Q?i8VTdPo+tSJcfbEMupCUcvZeyoVZ4Q9qgmY1xrkd/olFa6jBcfOY9pbVW3vb?=
 =?us-ascii?Q?DrWkVk+YkRSGWhMTCP3R/vMBvcqj3xynp9Dhv+TI8kQaGI4iGbUeGiwLBH+B?=
 =?us-ascii?Q?dsmcAyPt+LWVhaH8vVTo8g70/Qfrc4qD5YmGiDg+w7BZp35myk+h2DOtgixL?=
 =?us-ascii?Q?VEnCyR827ayIR1ZynVVF2wRxkHgfR7tYuBzl8eeqJiA54bNp2nXpGTWYkz8x?=
 =?us-ascii?Q?FeXstfGTyGBj6h1HIrMZWS/W0msA+7KWOYPpuuAHuppYspJbS3nqMbXiQPFI?=
 =?us-ascii?Q?fnHZGFBTLoKzY8BEyp75UeFCjcOQ9bN5CPCBYSQoZU6Xsb/MxESL6Vsze7aA?=
 =?us-ascii?Q?pHLDxAJ14xu+fVmxgqtQYvTcp+SbN9wC7lS2WdOXXb0azYzMse09G8eD9lGO?=
 =?us-ascii?Q?28JfspjBjxu7Ts6kSJRnuypjpEGdoF5FUZyw1/eQsypygZgTnsqfVF67mC3X?=
 =?us-ascii?Q?SNo5M7s7vPEsGoMr40f7NFKKtitypy31j2inTFJshoRieRzA+qyW0Co/anon?=
 =?us-ascii?Q?+55/fDzS09e8UmamCPwPRu+AjAR7Vxg3eduOrtjqwZyOHb0XPgkjTcFh2SHP?=
 =?us-ascii?Q?YfE2OChyljwLT2en98HlFTvRLymWEc/5mMPD60UqLQu41mVSoh9B7Yi7DtLv?=
 =?us-ascii?Q?tOfPgkMSUKFL9MghXkWZJ6DvjYKC6Sie6X0b97im6YOHEQJnNTc7YoO4uQ96?=
 =?us-ascii?Q?8n69STze0xxC3a7oGczYjTTBXX5ryBwMmtRhM9bJxcvlO48Uuw9Bmg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UeLz0DJuKlJxWFwcwX0Rp+I6JUYaJDk0OVCorAXm+ZmoYsBcH2Qz6doSPhX9?=
 =?us-ascii?Q?0nUKn6z0O0lqcq/JBU7hzJkF1k5lwz3VDkVP1yqQQ1BSnNmRHtX7DOKGxr2N?=
 =?us-ascii?Q?Zcryi5+gLEsTIndrDtbyqF1dP9wUhH8DYg27CiUMEl532aIJ5DJj5TlVTmkg?=
 =?us-ascii?Q?LQ5Gwd14yNfejBbMtzj05g6ZEqEYeMT8JzBV6VU5/tUlYgJSjnlbtIXRb0Cn?=
 =?us-ascii?Q?KYYfhajirDeBgaKCPuBvbj0ITz2x6eu/gwlhf7Lio1rIqwvsEwhfrf742bEB?=
 =?us-ascii?Q?/GJE9hJOXSkcRUb8KX8ZYfyVv/jZDWiA7gphRlNzvI4RDj76R4jXT1junop6?=
 =?us-ascii?Q?aFNRNjHTAidrrofhKpg5D7ag/OzVfWDQPH86KPLd2AfQmJNa6jPtX75ALalo?=
 =?us-ascii?Q?iQkFghv1KVFQIlZHFy4MFqcMQ0a8DojXxFETjla0qtGk05PMvUOpfxE8gQGM?=
 =?us-ascii?Q?T4peQzkrIYcHFMjJafAjgg2Iin2gDUnzNYVRF6oFq7qhIFCgqMHtIQjaI9iO?=
 =?us-ascii?Q?Fa4K+uYIyBdbGFrq4elluKac0MbxnudLxaKHC+DUBwUFGuiq7fGQXshI68VT?=
 =?us-ascii?Q?k2ffbjX3x9TYjFZSGBZTAF3knu4PZxxntxjc8YBvbk4xX5UAc0SX4yZJOOwO?=
 =?us-ascii?Q?3dkoa4ouBh9DWu3olghGnU0+1E7Mt5goCGjpJEicE4BseK5+2mqe5s1D3QWO?=
 =?us-ascii?Q?0nhTkoklxklW1mzthWoY1oFSI+cItvp/OR1vq09oYFbzilzKjlxAqJxRhYE7?=
 =?us-ascii?Q?pVQmDsR/cLgaRiqp6hZT+4b8nMsYC+nDAPZmssdHX1mdx6y1kUeQ37alo0XB?=
 =?us-ascii?Q?4q/WU5Gbt5sKzYp7B5SIk8ajQl/FvwX8vm3r51kpsO2AUa5OVwbaZXgrt8vb?=
 =?us-ascii?Q?4XajUoc8g+5v7R85Kns2J/1qpUYhIXJZklnwmcAunXIWHHvl7igRGszhk8Mp?=
 =?us-ascii?Q?USylC2wD9G2dsYa3me0C6h5srnmsub/gZ2uBjah1yLLb1pEcbCsL/5+VA1jG?=
 =?us-ascii?Q?AgNfT0wvI/du4B540HxEHRoZLqfR843NpY4k+13HSxjZ2H0GnnaDvwv0G0h/?=
 =?us-ascii?Q?3M2h2Pnud9Aamq8H/hvwjKXblfMfQ4fVYB76cGSkM/kzdfDO2j6G8MtfF70t?=
 =?us-ascii?Q?Hw270v5McGs6oWIRxpMzpG0n6mgiLkQs0OdAVq66jxOPG85mHvVHNmcoRwUm?=
 =?us-ascii?Q?lLWuYGKzucMQByWLufRbrXB1rh8maa3h8htQGaAWbHng7PaYcfFXyQMU/EmQ?=
 =?us-ascii?Q?zB1TrGf8gaJYCGlHWDB09elllSO9D6/knIsoRewQm7JFqYAjyU/OHjsPaY1j?=
 =?us-ascii?Q?4uymcKTkFksaTd7hCHgCyTOf0eNRWOzt0VDul+23oa7abZpEeL0TJSppYzAf?=
 =?us-ascii?Q?LiEAjKr2X0p+5DcV6zC/PJ0u+Efq2bym0XIMPWMG41iP5kZ4BrOlZ6Ym1BS8?=
 =?us-ascii?Q?Fq03Rq98SxWTsTxsYJYjCQk7f75Cv6/CJ+CJtH5om0WcpYz2mGHHHrjcgVgl?=
 =?us-ascii?Q?lt0JwCHcaSxLxmLXQ6LfgtceW6cm14qeqHvOqngaoCl78cGiCLtwkdxSv/Fk?=
 =?us-ascii?Q?6PM2s9VjqVllNg3OE7mSLvxMVFsRTQUVyw/CaSlm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb8a86a-7e18-4e5a-3218-08ddb0399eec
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:32:48.3094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eD+NT9xsO0a152PoLXEpwRPjSjehEy7n/mCuTCdP4nX7lXdNL1lZtZOfYmSkZKNthAmo2rtUaXJjE/1oYS7TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273

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

