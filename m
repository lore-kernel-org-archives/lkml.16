Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877AA22A4E3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887306; cv=fail; b=qqad8dAyurpn2/CLZ2E9+SvNd4CxSbH+c34eTPu5DB9Azd1L2vJEIe+MPy6T8UCpn/QjFX+9U5Tb5eFFu4bJ7/hnbYePUY5+sCLxBccH6aoZv2sUxP38lvREYHY1BwvA9myHbsR+9AEqQfoIjAN35fqv/2HgtjK36yHB/xXARhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887306; c=relaxed/simple;
	bh=3LA1pAh3v/VCEim9S4RQBB5H2RXOVIFNw5SKUYGEokk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p6blU6fzek8r3CvqlM1PRkGM0j3R8SJkoOX2TKSuzoViOXTd2OQawiASlcyBiVP5ik/m5LtsO1Uv6a35dF2VPB9AMmDVm74ZyPvqDJmwbQYEzEzYrJYCAFRYJKklk8JinxaEjec5Cx5BZo7UWR8FHPrPaU/KZgT/9W3NRM5wbhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nTFSZdL8; arc=fail smtp.client-ip=40.107.100.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nTFSZdL8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unDuO5oVuyePXgzcyvdEgFg9abXFxQO54adIJFEnHzzVRpRWZli0va7qTr86jeZ/JU0ZJK72P8HoLYnR1lODP6LtUJ1TEURLY0z8VbHp1xpFvq61q8dqFgET+MdrJGPxw7bIEUaLgFmWn3+LPtpe68NIO4T234FVgeKJO5a+KO7AfHueIQQHc3o7mHVI2X/eEYSw57dIhX8MMymCyV2oWv6cNhfxZk05V7KQDQfi2rTq5wM2TJyywBxq1HnaY+RlqiCeSVkq+qcNuRm8o+23UgAjU+5sS9RSBWA9kU3tD0vMDIgvIvcQ2niEvqz/L1wUHkGgaYlZKIdfrTRFQdlOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqBkoyUkqKBlVdy3eUzDRLTUg0ZpvL9D2CO8mlK8EQw=;
 b=tMgy8fuJQ/tR6Uw7scEQEpEB8tyI8m/pVLb04lNqObzoG8jkQJvjll7sL5qidF/j0l8n1ZLj8sfR51XSY3Jfg6s1S8o9cquVukh7fpUaxaSJj5C+p2RgPWvrex8Lh0V0fdg8APZPe6aDExM2IbZwHN6km4DHgGw1lNhE4YETm6XNphUlL5klc2I4iqxpuLl/t5ZSibDe8pczH08YWGRTDi3pi+tPxOTkqORQwEVsDtGpkAjVYbn4GcVZOCLXZnPkHpyWDfFse/8s56BgA3WVs0cWVvFyx3DDQygtus6urBXk1Zc2frT/BTSTxEpLWKmHA/wvygEogrT2MnPHUHcyfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqBkoyUkqKBlVdy3eUzDRLTUg0ZpvL9D2CO8mlK8EQw=;
 b=nTFSZdL8kEP4VKpPB5yVXL3vjaqomt+QOK0TH/Yj1m00Sl2PuBcO/OVX+TIjZKk3252BQrX7J8r6nfQofFOsL/+w4vt7zskx4gRILFx0IuFaVMfgrrQR9V9zopkGfxW+slEN6gz4gHo7e+5DGbktrFqfhcYf4p9LdbVWvGUkfbNzP2JARrEGlFuTU/dlkKQjFeY9tOceNx+p1hZoNOJ+XlFI2m8lS6mwahw9Xkx/g8L+rV+Oa0d/CzGN4k5e0j4rZHlDwbYOmWKMCaK1Yp/EP/5zKGwm+WUJ4wdUDLy5SJdWt8g7wIVyt2J+4fdkjzCir1Vyfhg+TKhQc1S4ma9kPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 2 Jun
 2025 18:01:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 18:01:39 +0000
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
Subject: [PATCH v2 07/10] sched/deadline: Clear the defer params
Date: Mon,  2 Jun 2025 14:01:03 -0400
Message-ID: <20250602180110.816225-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602180110.816225-1-joelagnelf@nvidia.com>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW5PR12MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e9ab67-28eb-4512-807e-08dda1ff85de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VdozJW1Ih53N7bGX1QvO9/3w9DCKVZtZuZYJq3GB7SVGPjsx6Js6IzkU0s6Z?=
 =?us-ascii?Q?O9OSFsIyRCqhnxV8vSQSsy8W2Wa8itrOqJjars8pj9WcCylQbYkQDtq0BC3Q?=
 =?us-ascii?Q?M3s7SjbDQ0efOuKOWaXVYsj2Gfk5OhFV2rY9ZvT2Y7QMWM7uxFM66ChhjTip?=
 =?us-ascii?Q?4wvVOh9g0ateP3Zmdpkr5BgSvs1Inz7fX2w9OHTRx9HUkxnq1R6YP1oHl9GH?=
 =?us-ascii?Q?JsH7WIkyV7DxpMebjHaUa4nwriZtpbt9RNNZH3S0lx6pK0KZEghcApNh91Pq?=
 =?us-ascii?Q?oDTbAXKJt4CRnDXpT/3WJMWecjkBnmHh7EPlsB7hOBWsuv6aeFmEpce8ZnCo?=
 =?us-ascii?Q?05bm8FU2ijbadn7OdUisqMotLk35dxRWX5UmSrOOIrtICbHNm3AReplx93wo?=
 =?us-ascii?Q?1m/Ixh0psJzTJvZgmc86stTaLGZ9e8rGGVhtnUbuimxd/8FbH6RmRcBuTbO7?=
 =?us-ascii?Q?mRn4wotvayYh8MHvGo7wNUmF1U8t9JkegFEdnl3fPQt++uEtZYrRfxbFTMfP?=
 =?us-ascii?Q?2sU8FLDvgjnjv90YFV3TLCw2E1Rx0zi+0cTzSrK2BpwVjQQrf9eq9tV1RtNv?=
 =?us-ascii?Q?MA3+AIwiuA0m506sRFM3y5bFG9SMLILIlc8imc7KIbMjx2jqCIx/N8qifmQy?=
 =?us-ascii?Q?F61u4FKJ318QzocMFKl8zS8DrmPhpokuP0KhZTAA0LTrFWxh5CfkDJQ+hWzu?=
 =?us-ascii?Q?j8uomQP14pSVadhuNsC2lxzvC5FXron6t+L93ZY2HK5tmfsmAcmookzA5VGF?=
 =?us-ascii?Q?FRZIb2+sdw3/V9MZ0UgGBIzr6xWzxAYon3PwMBLGvRZKT/QWFc6kmWHSC8Yf?=
 =?us-ascii?Q?WRBololw1NstpZoGufBxJdb79Ti32jus71t+CIfxfA8q6LVjVa0/X1U0fZMA?=
 =?us-ascii?Q?4lPP/W/qdypyy30t3kGJka84YzHRS++GmcQSepACErpWK4GP8ntCDZnTCQeY?=
 =?us-ascii?Q?SQ8ZezsQPuUIarEI/zNHgChK20AIiCL8NK7jRbDQ2w2L723gL0njDfLlA2Wa?=
 =?us-ascii?Q?n+iz97w1/WMkJoVxd4kGIkFjY6vlkO5kkBl7VtVFFQk6eiorhSu9GLfGvQaH?=
 =?us-ascii?Q?dyRzNLe5eoS82MR2mF2+GMVsMWlSghY9L+TteD5bEWr7NT2gsOB9qffzKEVa?=
 =?us-ascii?Q?4+2L5ddJgVLbUoMyCU/V+PQOKbSAluKNw6kfYb2vYN36luhCtU4DAQEndyft?=
 =?us-ascii?Q?9TYlbsoliU+WKLwvLOSbvalIEZDRSIEpSiSMIGyVVo1132UnZklhtvxRPlWB?=
 =?us-ascii?Q?KCosjzhcnnn+CcJfOegATJ2kZo7JXm4qN/cjLG0zxRaW063MhPGqPfGk0ntg?=
 =?us-ascii?Q?D+79MaVS5lkcvQ9El9rKzlyMN3oQWTsr8rd9rqs5W3ovjYtCFEAca9bHYwA+?=
 =?us-ascii?Q?ARey5i+k2jwY1qwY9l4VRBx2H2Eacq7MLQGRu5q7FRJBxy9Wok7oHH61BboY?=
 =?us-ascii?Q?6rKGAbFr4zxpA8QSOmDclmptl2VGTZ+XAx1xF6HX3TaHaew9+k0CXg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/INhB42Nm7Opncfsj4PPCH+RFvrpmBC6afsBqaA8JAlZIcHXaBtt3kLkpTmv?=
 =?us-ascii?Q?7V/kvqAQjcNlseCidr+aUrHL/ObDYBBvQHe5cL0sjeMIrYvwUrghu9SfIadM?=
 =?us-ascii?Q?6rNDXD1qkOYPUwN83/SbnlyhRLL372m/aMhuqDvPqgRbjNavjYswxpxDqjhb?=
 =?us-ascii?Q?RRf2rjXHWfV9/z/xzla4gOr3WrbTNSdr49Qv+ikNGxe0eBvql4ZsvcVzXty7?=
 =?us-ascii?Q?8mX8WDXetffxaS32g87SPo37MlZj+RBfR7KR3v068Ie9lyGmtOHt5BK/hVld?=
 =?us-ascii?Q?Oc51/U94TYR8eSozaKFSF0mkzFw5iuJDdMFna2ndJxpvmN2y7RFFVgU6x5ND?=
 =?us-ascii?Q?w9kG7N4qeuLmGGZyNzl756uBuBO98+8yMEiUw0A7ATreia9JUPLLOv0j97DX?=
 =?us-ascii?Q?NjsD9ofzDxGxrRZ0c50AF/ajO6Lw5mxdjxLDB/OcT/xj9cDQbAfgl/hkTivR?=
 =?us-ascii?Q?xImtGT3ot2jcYhHLetWWzSnfhQay42Y5vo6jQi6YTFesQhluwYqmrA+okdd+?=
 =?us-ascii?Q?hut7lRR12aYSkuY6SHSin2odxValwCMxE/6u4j+rW1Sgun4lEsRFG30poMxE?=
 =?us-ascii?Q?yanc7pDGe5u5om2KzK9nJFs4aljE0tMbFWW8Gqd6Sz1pV3jSWku6sf/oti4H?=
 =?us-ascii?Q?FZdUK+Vj7nwTBFw7oXOTGB4bIJ32e922lx9oHURd/7s4+DYgFqVES4k9z3/c?=
 =?us-ascii?Q?72t5m66KGw2vjeHdzHQfxB9nqecj7PvSQcL15HCqLHckGc5tREEL76+NTz54?=
 =?us-ascii?Q?ip3WjMkkmcdoskxHdLsjj9Aa7/DwbNCTVIRdIeqyoRb6sbqh66ups3SwUlLV?=
 =?us-ascii?Q?OFdDimSw7+MKkKU0G9VqQtaXjdWCEnb/PSTECqr66cJ2BZIhYOuUD+U825hn?=
 =?us-ascii?Q?yrCQbn4fCv4e/DMzjJOwNO08lrgNziAHq3LLbmd3Jbg71EG7QEGCwweMD2OM?=
 =?us-ascii?Q?qEWYlDT1vOMpNuEFd5NpOwPD69Z1HrHKxY92g+ss06EJV+TcrmL9p5vmK2tf?=
 =?us-ascii?Q?F19GihqCqJCd5myfTfSZ2zZJu2EyN53te8wvAZ7Ib5TH82hsh8i0nLeVI/C2?=
 =?us-ascii?Q?YFtwJzbKWzqUdarxpJVho9owoYX95N+6NqlI8bGECB/8MsmcOj+KpVgRdss5?=
 =?us-ascii?Q?0TFFW4pHD77MhbsZsdv9bGNN+PWXu/Q8nU3PQkDxG0t/9EbiBSI7Rcjc5YfS?=
 =?us-ascii?Q?vPsnrGBWNRVp1LXB3vSE4GOToxsgnW0KKBAq9kACPI5quB4qpO3F8qvFk62l?=
 =?us-ascii?Q?+d1Klkk2JQXIt86F2iFzPUseLb4mICve//4LnoL3uCgREyGafnRcuks+/Te3?=
 =?us-ascii?Q?5u9taHxvumcyglHbiWjMiplvvWVLbmu4nbR0AXWEIUlpxU/tsIoVHridZzBS?=
 =?us-ascii?Q?AshEBLSGKrQaIFziyqdGU0Kyx5Qx5vqUncp1p06ZPhRZpKnCi4hSnXId4HO6?=
 =?us-ascii?Q?ATipS+i0kb2cN5/utyiNan/mJdzeo+qUVaMAlHK00dmC89vQezM4M6rvOxgt?=
 =?us-ascii?Q?4E5du/gsc64XR1aKN1PDCUdK16JccMrmKXqpxXkacRGs39z5un3oQzS8rKgi?=
 =?us-ascii?Q?yjZ5pc4Em8q8ErJNCDNGSEqwAiHNKztziAuJ8dFd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e9ab67-28eb-4512-807e-08dda1ff85de
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:01:39.2786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPRW7wFttKLoCOD9O2t0T/vEgP4JcNWU3MrRJeCt1gj2vhUvtw4jG4KbvHBpw4jcmn4tdD7i6ZRiVrkcVO43qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5683

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
index b703cbf627c1..4ed61266f3ea 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -3432,6 +3432,9 @@ static void __dl_clear_params(struct sched_dl_entity *dl_se)
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

