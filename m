Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E21717A2FB;
	Mon,  9 Jun 2025 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480692; cv=fail; b=eK1/0TFvdcGvuDq9xdUTJddIi1+QhTobqDOee0SjoRmnyh5TKBPZ2vRu5BAPb8kAd+nWpYfBpkQZo1M4aWm95Fm9tSJYQrXoXD3VnsoakajhvBc+QV1yWnn0U3QOj/pT1N+fw/Vll8dyDMi2WXpmlQgZmSnaEyHhefoJ3W8mioo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480692; c=relaxed/simple;
	bh=yYSfjBbIBHoChNGUJSYEQ26VqImibgDwGjIoEc7gY5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o0EdnCRx7f0z4uUNVnQdrvNW9sYKkCc0MeCSXW6GPFppS6Ug0jm3nSw7L7v0eTa8wUi74NAduxxdzJ6uFaVkFybGlHFLgPg5XhunIWx1ck02Z7lQ2bNo94SNtWpfg/kemkRwbGOJcV/dccpDGr7uayMMvf3jtnAt1mcncM0rBsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Eovd2kTm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OstaJRxd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Eovd2kTm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OstaJRxd"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593g1Ig005992;
	Mon, 9 Jun 2025 14:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GqVWcX71BxGYFQWKer
	8QsA+UEryj8/yHXciaZo+oz8Q=; b=Eovd2kTm7kjOfsOI+D3gYwSC1XQYAb8wFD
	/DT/FtMNitrzkcPSEJe5tOuIOhwlg8OoX5UzoE8IIMrcsBMcDou1wGcuh6/infmV
	wOdxWtRNnsqk5PfqmkS/MQXd2HbsQM2xSx7LYQccvCB2mjW9+ZF/NRpg6+AjjFuL
	8FGHCgF8H0ZrfGlDdoDRsRfltXJjlHXWw76QjIYgKTeGXB1XGkvVS9/p+zMgFwwn
	1ga9HQCUlaZHMDAMgc1zOfpjelmspjjoLhL1NPAbm2zhdHVcIjlXpkW9Kx36ShMO
	hYDIoJhjfrXCshldD9qAi4tSpHYaGe4dvGpSF4iTVM5pe4iwUa6Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad28vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 14:50:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559DqjnJ021382;
	Mon, 9 Jun 2025 14:50:40 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv88rb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 14:50:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9VyQRLD6hQBTC2gnBFgwnlzAszwwrBlcnVEcki+qPYbl3+2MBve+H0K86kSRfcnK//I7tnLsj3bgcDXMHVCHTHOtRsWWKSXyoBPXIu2rWqt8V+MknOyzXRCDGnLMDn6Nfs5Q1MQE8xCWJkE7KDX3d8Gnf7fxFOPooN1aXGf7G00SfUjyDXBQsdJqpGqXFZ9xiYBeY1ycWYYI3mOm1nzGYDQSL99jjps07O042O8c6xDs/BfPFVJi/eSv+iTKbBp7GkbM/djodKPCVoy5ZrADEJjgbI2qtQehRryBqY4yi5qxpFmLOKO7gxenVLYRRZEwuzcrbw3nhglU+zcDlSkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqVWcX71BxGYFQWKer8QsA+UEryj8/yHXciaZo+oz8Q=;
 b=sCCZEiTGh9m/vL5NWdl783GXdekehUWRPXKgDCjqCPxx6jgJ+4hHAvKI50+VFH2YGfDvV/zLBq1CxxvU1oUPfGxqmZMid9dXOYzZdYxmB8CuznE74wCdCPZeHDLzwG234+elTgnG88MODZZ7bwSs8F8KrQs4JPvfz97hzgKanw3/wsYy5D1mSJ8LDWDO6VMdKnTbvSaxFeCeVmxIEsAYSSrrOGUXwbbxzr5T5KR+agWpbahzCs0RcGNGG5mbnDmCXxt2snznd64XKLc7V8Q8u/6OmDTrMJIRQZvAoHaQbVJ1GwmVxJyjTU7ZPD1UvLwSgOYVuP0fB/F/xwLDiMV+xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqVWcX71BxGYFQWKer8QsA+UEryj8/yHXciaZo+oz8Q=;
 b=OstaJRxdLKqGQfOVoxbDmvW2dEsya3krevr1xi/oSi7AAq4AEO3KoXK4Yg8aycosATj8i5Ba3TofEuPTln82p0zAHY3frf9dAr3xdleY9MWDUP2/6xoB574X4DZZeD8sX9DYhQEnYixDIsHXgFiiugvYIjZT6XHoBlxwenpjqv8=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS7PR10MB7130.namprd10.prod.outlook.com (2603:10b6:8:e2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.20; Mon, 9 Jun 2025 14:50:35 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 14:50:35 +0000
Date: Mon, 9 Jun 2025 15:50:34 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Usama Arif <usamaarif642@gmail.com>, david@redhat.com,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        hughd@google.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com,
        Juan Yescas <jyescas@google.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Message-ID: <61da7d25-f115-4be3-a09f-7696efe7f0ec@lucifer.local>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
 <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
 <B2F966F0-8F5F-43AB-BA33-BD3E65504F4F@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B2F966F0-8F5F-43AB-BA33-BD3E65504F4F@nvidia.com>
X-ClientProxiedBy: LO4P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::16) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS7PR10MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: d521b96b-d3f2-405f-c6f2-08dda764fe0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zHZl085KjGXzvxrE/NzrTXDHJFpw0aKS7l9GN5q0knGhRfN0M4coQMRMFj8X?=
 =?us-ascii?Q?DCUQM5/RvF8gRQ8d8ASVV8Kchaz95e6hw+YHuMyO8B4usoN0uEaJW36DPfsb?=
 =?us-ascii?Q?mwayMvDr4S7znHnbizXp2GWAf1A6IygP9PCjCdXbJmZZyNNzQWJafz7TDoHU?=
 =?us-ascii?Q?noLGG+N0MqG/r3TImdHzr3Yih8GAqJap4LhQ876uc4BNWooM1LaCy7a0D+lS?=
 =?us-ascii?Q?FWgFoGXqNxQevMLNjyagHfKfkW9UkMMyYbTBBPxKBoJCJOadBjlxgtS9Tq3N?=
 =?us-ascii?Q?V9DGPPZCMnhCKmVeSY+hGnZmaZXEY2VRqwlUc431A69TLpnwXFRcugVvAaEc?=
 =?us-ascii?Q?uns/D/rIMAoNPKVM8KSNqPzgHD+evIVVbfxFhIm/QVY8LEjprJP3tJVTYDIZ?=
 =?us-ascii?Q?0b8zxPSAI1HIlZRg+sqJIBLcJZ+Jsfjss2ZOyYIrV3xxsrbbGDotcJjLv3gT?=
 =?us-ascii?Q?ccspczfmgMwBy7miynHBjYLlZBZpCdLCjabFyT9nOlkSTc4hvcodN+cXx2YG?=
 =?us-ascii?Q?vPB+rLZEMuJf6PX3ZqG1Flm2OmESuhdo5lNAr0kHxR8ql/KFzZ51w6f+Hs/Z?=
 =?us-ascii?Q?UpwW5dKSS8jHVRc043WG+fz+HTceAbFoKROHoO0SGutSBq64WFpFEEuucqx+?=
 =?us-ascii?Q?BtaYSLM3eXJU/HpeCbtjPE/pkuN1yYyzrf6AOYAMyBA4xOC1qDa9oMk/BAAQ?=
 =?us-ascii?Q?c3rMaKIThVf7AwVqEdaxX2BDq9I7jgHR7V1imrwUEmcYE/OBUH2JlQ1UQ4ex?=
 =?us-ascii?Q?/tj/5ST0jw8WKRBP627Hht2RfkJT5P6mnMMynqmqlDkGegtp0hQu7ctEajz2?=
 =?us-ascii?Q?iA3xkBuGmWfkVUyeP6uGw7eqoFpEerMwCuYfGzKEa3fIiGRVcN7ZGBVooeNB?=
 =?us-ascii?Q?E8KTm6rUOZXOv8GOoKKuoiVrlS+51yO3UFSC2wS1qBuj4NND6cVPV5A6f2gL?=
 =?us-ascii?Q?TN4p7xEvqPokqWTU45/vTgVgaAweRFR2eHL/qyg087/qVXKxusEI6fvdh1Dd?=
 =?us-ascii?Q?SuEqVFMlDasmXb/qR9BXOH/ybejUgPqcIJVxgFU0WotTIb/vgdr+D1JJmKMI?=
 =?us-ascii?Q?5ZXbZG/dA1Qa6G/33reJUVeCcxTih1VEhE8JxFF9iW0ajO1E5JjIOjeuME57?=
 =?us-ascii?Q?N0SCd8zhaytHN7M+ZnTKly1QbsFbW4QOc3q7ItAWpnS9Ac37T0cVXtwDQzmy?=
 =?us-ascii?Q?bHPPQH8MnvqfCxbp/1LUXVxE6N6VtEoqwBIrpouoCqIqiJY9pbEn/LH0C3LC?=
 =?us-ascii?Q?8wAAiS4iJLA9HXLS36poeM89VbhVF2GISwZwCkLoPIxDt4uzX1mWFp3K8gxb?=
 =?us-ascii?Q?tSO5k0TycBnJIwFR79mHJTCQcASseSx/mo6NmdNPW2lYttdFSlMMDQRkIeTX?=
 =?us-ascii?Q?Z50utDjNBDoaGOsAQUeseTzOgPrASsQ/vh4bc0won0q/fiHe9RIOP1qeU/qL?=
 =?us-ascii?Q?p38fe2t+m78=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o38keaDvm0ZvnivhlcbivgQNIeDWBPVunoJJ48vy405xothIIij8RIxVSWwQ?=
 =?us-ascii?Q?A/iezFL7rGmp5ndGblP55GoUWMZIokjPzXSTgxgZiaFIV9JRCXXohCoeeOUh?=
 =?us-ascii?Q?637nXdJ/WFUOUlfs2vbVHl8Wmke5WROtZGG2ljpZc4/0cwUUpbIoVrdMOVQw?=
 =?us-ascii?Q?jvfFSfbs4mhDTlBReNda/lAHazczRgX3ay2A/HcSSvkAaCJxcnaZMZN2+7Vw?=
 =?us-ascii?Q?WbwTM5iw65tSPA2kf3nJSiOYNo+4FK88HQOZ/4kXB32veyFhn7NRctNqvPik?=
 =?us-ascii?Q?v0TLiODL99Z3iVngNOp+PxDbsv0Vbqpa0fj1TrinKAbCLceKy1b7G8ILM0k1?=
 =?us-ascii?Q?8TLgd8h6lPV3+giEt6prFm45aDnDYRX5ie7i/s9ebQSLe09JRwn4rsLHbVbk?=
 =?us-ascii?Q?zNAzokohcluPODOGumwxv7Rxw0MdV6H1DKip5NBt7SHJkWaoVvKQKu8NP9jl?=
 =?us-ascii?Q?57hC4gZj6aosArPriO5cM9DDHxgid3OnvPqzfu1KFJQqtw2/WQ9K8TnroWaK?=
 =?us-ascii?Q?vCllrg8NucFXLG9F/oDZo+KmP1prsEc2D3bYu5j+USEXbQi8PVst/fRLE05J?=
 =?us-ascii?Q?uuyaZH0gg9RP6aat6lLVRqL8n+Vc+ZiA0SWlkNvt1xc4hF7DN5eTWD1sPFK6?=
 =?us-ascii?Q?HV3MVP0wfu+7u7IP8bou8NhHGszE/8uqZ27OHfapFEH5AWrQp1jfSrOJcCaO?=
 =?us-ascii?Q?twwixrv4DkQpoUO8mxxhtsoW9AnEfwF09hj+b6CzmgBIYpZX4FT7Kt7ft4V6?=
 =?us-ascii?Q?2waXOuwfrqi2N+XLXqn9ZIuQBYLlj3LBEMeeMZdUJaJJYoLpbxg1POy9fMSe?=
 =?us-ascii?Q?jqri5xvBlwldo7WBuJO7CDQfEo9NFv/KW/A+2IaVGzybzRPcLLRKvaNUaKal?=
 =?us-ascii?Q?V7S+JmfI5NpSjAnmnPK8lPlHQH6VNZ78rDRJ68NPaDzP/LrtYYjaD651TZLs?=
 =?us-ascii?Q?lnCnYo/JLz92e1yMzRAE7DtVQ8QwCOfHZrPMztjlUniSaMMZtMSp+MaleVMq?=
 =?us-ascii?Q?JZGz0b8j8xX+DhCpkXVHqRlG/w7/dzhoFavm4VYh9wk3zce8yWA+7QulZ0Vr?=
 =?us-ascii?Q?9gasILNE4UeEu50JYBzg5MEg8va7udwPt3zbZM4UXvQsc2FOibUQNZs6es28?=
 =?us-ascii?Q?indpFDeSDGfNEq9TqOaO0M7FQiwv9PMDqZkl9NqAPkTd6eAVP9plZ05Ky5k4?=
 =?us-ascii?Q?fAa5jcQhxCymz0tgFeEWlH/tq03YLV+Suy0KGVMN75QP4CwYpp6mtLbNhJQF?=
 =?us-ascii?Q?pO3yV4CQQR2r850PTO4AiMHvNL37vls3jpN67bNILasHjJMaPwenDvNSPHNW?=
 =?us-ascii?Q?+VTghmWOKexeRExRNOkAaufcfo5UEHim9h2TsTq8ljsRbDHIjFYRcM2xCf8Y?=
 =?us-ascii?Q?6zGq9pXDNmvSKXEoIomJdGYZAf57W96SCUjb4ovsTwAOTWYd8qWQQHLKXsPW?=
 =?us-ascii?Q?YvaQWv0NMGU4UhyMXS7Gutg8DeOZEdLrQmVGMXZD+ndYSqloXv/wwldjrGaB?=
 =?us-ascii?Q?ygxxTRoo4LHHTHh9N73EOjeVt6DweHV36ByVjYam2vmhM+DAsiNi9RGzuLnC?=
 =?us-ascii?Q?j/ZY08qs9clHK3DP0YbsMYtedvmrKt+z22vybCnODikz1XTPRfGv45sCYDJ7?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CRqhSoocEthnfa1Tl5dos0R8vcNKC+ZyvaufJQAk94Bxl73Vaea4Xsw/1PxftBEhOsOjkgTVUd6qopl7zBergnzlMRnqcts1Q99zGAMAAJTT7nBOF6BNO3+Jxgw38MeQt4JsnX7G2qEvHXMVcqHgcUgcfhc+6pmP2r2XiNnXqvKZ65saZOCSyfDoem7s1htWl6DOtZw0p+SpucRrRvc1H/i8+kucMjtqYI+LtF1mMwKCnaF+0BuusoRl3py1fWgU1yWHzMJe7QsQ/M5amQXJu//eFjflPH5kkxUfWR7dKwnmOvcKwYf+UrARSc6+k3xVkhzb6OA67DRtJecT5QYQCzmdcE89jF5fo4WGFcQTCe3YjpW2FQnZs11AYKWunJSKS1oelduZl2UAPC7v1nx9NAtZURyyDaqVgPjyMZgRMUrFmhLy+XH0TYgiMWYIYxlilwmMhc3LHvi8YVTjAkPGG+fjBQqsgf1KpqFSJ56dkGo9UIxs40bvwSjNf1S8uvgTrY/AL9ebqwkvz195R1xnf8PHJ9w0jIJAeURQzmAOEz4Vhrpy4G0QsUjmfv8ak7XIkMSCsl9dp1YAs8HSkl+1xLtMnEqUc+prlfLnGJuMIbU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d521b96b-d3f2-405f-c6f2-08dda764fe0f
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:50:35.8373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmA8+KWCGWC5JJDCclyfLI3JXEuFDV+SvvitzaPs2sK4Z5OWLA7j/NN+YqvcFaJu+3fRF48pNbrx7ELOn0HsRyDedcr4Y1kmGU94G7ZQFIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7130
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090109
X-Proofpoint-ORIG-GUID: KpY0ExODTv-JzS8mht2drtecE5z9gPRc
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=6846f4c2 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=mOCLVahwvzJ6cs4ljQMA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOSBTYWx0ZWRfXzMLP5tegnNSP 2R4wqLuy73J9OlbgdriZZ/eV3vCKmJYsTXqWXzft8XXzxCcrMdrqnGfoAYghXQF/klpfuKubeIG eldj7NpLEhWoaxEdRpSYDcXlrcmBb0mB1GWCFnzZR3436/8KE1IUXuv0Vxfcu64PyGutUs3UAh7
 j0dGxxPVNpMy9EgFl3o+p99sfSAeRdZEWQPmW9P9ydWlSKERIsozG6wz5IsJKQeo8o39YkPJqTh GgzVeVmjq0vGihe15GDylH6jVA3OgdORLERBm51EDzE3zsZ3mT2mdX8oqZmeNeLeJmayigAZref vAkCqhoO+t2ScqGNpcAAHyWmyE3+kki8zhnBFu/+bL8C592u3sqXmJtyphEBTXd3HXngnv0whXJ
 FYV/bP7svdicmQyv1iVgUEu1EoHiUluxSetpvbwc9M6RDh+pmAA6EoQW2pehmK8vW2uIHAks
X-Proofpoint-GUID: KpY0ExODTv-JzS8mht2drtecE5z9gPRc

On Mon, Jun 09, 2025 at 10:37:26AM -0400, Zi Yan wrote:
> On 9 Jun 2025, at 10:16, Lorenzo Stoakes wrote:
>
> > On Mon, Jun 09, 2025 at 03:11:27PM +0100, Usama Arif wrote:

[snip]

> >> So I guess the question is what should be the next step? The following has been discussed:
> >>
> >> - Changing pageblock_order at runtime: This seems unreasonable after Zi's explanation above
> >>   and might have unintended consequences if done at runtime, so a no go?
> >> - Decouple only watermark calculation and defrag granularity from pageblock order (also from Zi).
> >>   The decoupling can be done separately. Watermark calculation can be decoupled using the
> >>   approach taken in this RFC. Although max order used by pagecache needs to be addressed.
> >>
> >
> > I need to catch up with the thread (workload crazy atm), but why isn't it
> > feasible to simply statically adjust the pageblock size?
> >
> > The whole point of 'defragmentation' is to _heuristically_ make it less
> > likely there'll be fragmentation when requesting page blocks.
> >
> > And the watermark code is explicitly about providing reserves at a
> > _pageblock granularity_.
> >
> > Why would we want to 'defragment' to 512MB physically contiguous chunks
> > that we rarely use?
> >
> > Since it's all heuristic, it seems reasonable to me to cap it at a sensible
> > level no?
>
> What is a sensible level? 2MB is a good starting point. If we cap pageblock
> at 2MB, everyone should be happy at the moment. But if one user wants to
> allocate 4MB mTHP, they will most likely fail miserably, because pageblock
> is 2MB, kernel is OK to have a 2MB MIGRATE_MOVABLE pageblock next to a 2MB
> MGIRATE_UNMOVABLE one, making defragmenting 4MB an impossible job.
>
> Defragmentation has two components: 1) pageblock, which has migratetypes
> to prevent mixing movable and unmovable pages, as a single unmovable page
> blocks large free pages from being created; 2) memory compaction granularity,
> which is the actual work to move pages around and form a large free pages.
> Currently, kernel assumes pageblock size = defragmentation granularity,
> but in reality, as long as pageblock size >= defragmentation granularity,
> memory compaction would still work, but not the other way around. So we
> need to choose pageblock size carefully to not break memory compaction.

OK I get it - the issue is that compaction itself operations at a pageblock
granularity, and once you get so fragmented that compaction is critical to
defragmentation, you are stuck if the pageblock is not big enough.

Thing is, 512MB pageblock size for compaction seems insanely inefficient in
itself, and if we're complaining about issues with unavailable reserved
memory due to crazy PMD size, surely one will encounter the compaction
process simply failing to succeed/taking forever/causing issues with
reclaim/higher order folio allocation.

I mean, I don't really know the compaction code _at all_ (ran out of time
to cover in book ;), but is it all or-nothing? Does it grab a pageblock or
gives up?

Because it strikes me that a crazy pageblock size would cause really
serious system issues on that basis alone if that's the case.

And again this leads me back to thinking it should just be the page block
size _as a whole_ that should be adjusted.

Keep in mind a user can literally reduce the page block size already via
CONFIG_PAGE_BLOCK_MAX_ORDER.

To me it seems that we should cap it at the highest _reasonable_ mTHP size
you can get on a 64KB (i.e. maximum right? RIGHT? :P) base page size
system.

That way, people _can still get_ super huge PMD sized huge folios up to the
point of fragmentation.

If we do reduce things this way we should give a config option to allow
users who truly want collosal PMD sizes with associated
watermarks/compaction to be able to still have it.

CONFIG_PAGE_BLOCK_HARD_LIMIT_MB or something?

I also question this de-coupling in general (I may be missing somethig
however!) - the watermark code _very explicitly_ refers to providing
_pageblocks_ in order to ensure _defragmentation_ right?

We would need to absolutely justify why it's suddenly ok to not provide
page blocks here.

This is very very delicate code we have to be SO careful about.

This is why I am being cautious here :)

>
> Best Regards,
> Yan, Zi

Thanks!
