Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5098927B500
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230777; cv=fail; b=ZGEl9aM+eI8vlWjlJK2TzI3zHqXNC80l8FTHOEnHpXr+Bwj8zDyh6kODUHr5xZYnK1JrdSfcVPvJdD7sZfghQEVM+PrdhnIXgCavqRZVotND8VJFJ2oOJRxHuh2kPfnKDNxd+vuW7vZTXRkJRWb/F+0+eLswELLxJC8tiGj6Fms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230777; c=relaxed/simple;
	bh=Dvq6r7+dcijStXaJUJY/OKmnEUXiYvzEcmAtcbRqBD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Kt4OlfFZc4j/l5eFHigkD76Mqxzmz59nCG29Rke2eR0IHsZ/Z/pAkCjQ9Zvc/Vl+283s2q5UmYFER3j+NRTPL0jycQbFrXcneCeFWHQId9WASZdjj+jtolcFNBv/DTmkuo36TWwG2X9g8KcuKyQxm/uCu1NfyHI8TEndRxW78v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nDhLbrUE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R+DfcVnA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nDhLbrUE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R+DfcVnA"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EDhxLN013575;
	Wed, 14 May 2025 13:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Qoa2yye3rWJA0Tec9z
	djxS9J51m2ZR52UgnzZytoumM=; b=nDhLbrUEScdV+j3SocORQVv6g1GYpIxqVH
	A6ydcmOGkJXb93HVpGmqpFY2xmHQb9JmoiDaxIl/s6FnuxnE2niqWd8oFVLeStR3
	LFaeCAD0xtyDNL3lqjX5Ry28tjijfVxxtQxrfPY3fRMyzeScqsxiA9T3+tcBAy8Y
	HfJ5sppWsc0TsF3D40fLHc1iFNtk9D5+nGy2Iv7e5MMhv1kz1ycGsgx0YOz+kx8p
	c7B8muTabmZJnIYIkZbikHlPC84xVw7xYZf0TKhX4qP18i6IuHCBNoMgYAN0awnZ
	AT4nQ1XsFqiRVcFWt5Sxjt35F4v2/4HBfWt5KwDf2imi8AGan/4w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbchsp6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 13:52:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54ECrRBD033461;
	Wed, 14 May 2025 13:52:38 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012011.outbound.protection.outlook.com [40.93.14.11])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbs98b38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 13:52:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nmgd0uVGzCnl25LsxTDJSOiBfPb1ha6XOzI79k1N/nrDnbQ9m3cbUri+br5QzL369A2EcOvgzxe8vifvvql8BCxRp16/zY76ga9WEGgLIZewbMsM/KxlTE7BOIPjqH9mj/Bm5jc8JAR7sdctEBWo53qrYpMRvCHwFZodYqVqVvJpS2s2cVY8X5P3hOVHIu5cVNJf4wi8UKm+LKNwR7UUkeH0fRK1KIPPdOP2jdMFjs6aWuYK5edirq0ZN29I3Lv0txAUz8REDZLb3uizVqM2qHt4CKyNj/7ktOJJ6tNwYDJ4JhM3G3OeBNYat3kjggONOBuWs4Jb2tu+l3ECRhMYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qoa2yye3rWJA0Tec9zdjxS9J51m2ZR52UgnzZytoumM=;
 b=ntTxE4sdatpLhQYI0SOzKLeXOynMy+ZUpCaulk9CT3rAMbVCYjua/UKNlnkSNSMK/pp/fK335V0ppr5znSxrJr8ho0j65IJkTmD4JuMhY9CDPRd8CT9TKF9Mw7iwEYXrehJP1sD4T4cGSnaDZIgOSxpkbxmW2U1TrLv9BGqf0ALWbyDe2gnW9CPnhuzAvxFG9BpVw1k2GqyOJoWAxb1W+VPmUHFz+qAE3RaiUrHiRrHIwWpEkNhA+gCIHBD7vEpzDBGbr8cJcS6m7UcMIQ3TeaXhqP3UyhwQnmATzu/UnGkSOQaRf5XV10Tzk8vI14b5QrPRF6CreBmM+jRkrZG58w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qoa2yye3rWJA0Tec9zdjxS9J51m2ZR52UgnzZytoumM=;
 b=R+DfcVnAj58JEQarePJYmIXmBo1i1X4Ryi+6p/COc64JoffJLrERLpX6bQUq6sxmBytlde5tcwmWC/NTJLLcjutXu6YouFS70v+V873h1tlCvviyUthVC1VJLfBky+0xX2oaWB+dy0fTh/6UixUiuicvBXUup6O/V5IAcgnaRMU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB7473.namprd10.prod.outlook.com (2603:10b6:8:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 13:52:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Wed, 14 May 2025
 13:52:35 +0000
Date: Wed, 14 May 2025 14:52:33 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ignacio.MorenoGonzalez@kuka.com,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        yang@os.amperecomputing.com, willy@infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
Message-ID: <3ed9ff7f-d360-4bca-9805-b70cf51cb023@lucifer.local>
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
X-ClientProxiedBy: LO6P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8ffaf4-7e9a-4e7f-d9bd-08dd92ee94d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b7ABG84aWp7X24PoEh4ScE1JRlHBcaJ39DgyzjifyYPQYG2BUBfAz9SpduYT?=
 =?us-ascii?Q?YmEKfzt7HmqNJJ+Ep1BWFAtvPvphApIzaoLIv1UIXNefcwTG6QYiWOQUwCW5?=
 =?us-ascii?Q?pX80H0Jyp7E0/3Ez8dGbdUwQ3AjSChMKRKd9yQdN4nktfIMqQIiJhsoQhgn0?=
 =?us-ascii?Q?UbNzgBiJDD4M6mNAM8vI6FUGeShCuchsQ/SFyVElYLuqRK38nf0KtJrpnPgg?=
 =?us-ascii?Q?2TW1zyKsnGmD+7SfRhP/P6/CesOJkdN8a/1GE05DL0tpQS40VK8acfshogTJ?=
 =?us-ascii?Q?o+EpGC2FQoXc3PPlmBCRM+cYKqXJNC5EKzhnL/NWh75v+gFY1QZRd/rd2K8x?=
 =?us-ascii?Q?Dq7ZJc68RKGW1Iab8qgm7jrpibwX84A5Iu0iqLOCk1ayOjy+odA+7OOM8iYE?=
 =?us-ascii?Q?6JCkVKDjAJrcH4/HWta8nXxLrGZy8ZU4mn7b9sNQa+0DMR6dNUq9KY0VHdHu?=
 =?us-ascii?Q?BGNPlCdElpUiUgfOUMyg8I6u0RsP6oZVxQz3t5SGpI/mtTkriwzG8QXoke9H?=
 =?us-ascii?Q?XuV38N+Rjk0d/wXi6z9/rTiZsgb4r200knfytcQH+BZq/4eVq+g/Lx+tS3z8?=
 =?us-ascii?Q?55Ncd56hOZs2xcdbvgmJOpx9QsMC2DGzLJTa+KIW+9LJw1Vsb5iuYswo2nBN?=
 =?us-ascii?Q?lhYy3h3VO6EyT1QbIFtHMmXnzzeBKCg1rsvvwGw02EwpDY8aDBhNJlF8eDHO?=
 =?us-ascii?Q?BP2afgA8hhlZcG9Tet/fUAEf06OavcB48MqxY7xoxffoEpTO90zxiLVEgHid?=
 =?us-ascii?Q?qSbNM20PoY/Ch00uDupHNZsiH4IlPq5pP28zw/zpygr8fjirBEmecD0cjnyg?=
 =?us-ascii?Q?BFKcS9TyFunMtn8eSV8c8WknJVgV7K4sj+6L2YlxlRusBfAU90y1fWj2xBaV?=
 =?us-ascii?Q?Yliseo5BmFLXZ/RYnZOXAOt9u+eXeTkdMV2L/KZc+hqRGGO6hsNaTIbnOPqq?=
 =?us-ascii?Q?c37M3j9ps7xZCh0u5XsBi4Vwzz5zOiQKCN4yl7NYOMzI2VZ4KI6YmTRLoF/S?=
 =?us-ascii?Q?EmvOmC9ZLUshBvjCfxCHToj+WVY2FG5G1NA9fFBSaV0j2fM6jBxQ7nGu3I0y?=
 =?us-ascii?Q?yIENSe3pv6TilmjL7F6FJO1PtJHD3KRTdNfmMRxh7Bew3l7NlEwO9Dt9pjwE?=
 =?us-ascii?Q?vpctU8fPKPXysmPAqGEYOzGqRQUPW8emcHfsLMwqyhGMFQ2Q4xPkS2zn1J8f?=
 =?us-ascii?Q?rxS9yzHTwuG4A2y4I9/XIerJzMEuVyw/OJoOedszqiCI3cOy3I1TBNlzbtO1?=
 =?us-ascii?Q?FZo6PrUqopE4jBLCcJyv4yU+ERizO3b4vucfuijTIvbuu3buEkw5SS/NnJQf?=
 =?us-ascii?Q?O5XWQ/cFAfBDJjRP3+oseklXZLQvsCdctuOoNyvTgWagZFPtsMKsYjcpczSi?=
 =?us-ascii?Q?2aYBPQhiKg39jrct/nf7xUuLkM0/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PjEBDdvv3HFTaIT9HbaIInD/2QdHk/hKM7zojUT56qPbxKToWwQqCMr+qUs1?=
 =?us-ascii?Q?RRhiwfl5hHG2eOufD7tS32MOJu/w2yaFkchwVb/Bi/SgrgWwoAf4WGha6X5B?=
 =?us-ascii?Q?/KpfzNhJq+dAy2gUgsxe7C6IaHRtgauP8CqgYZ9Q0Z3fSlzUyoSyTaMU9QCi?=
 =?us-ascii?Q?f8AaREqLXpqfEOFVAeZvO2FDcQHg81vWaIeqnW4Vw/tmx0R23o7hUDg/0i4k?=
 =?us-ascii?Q?ZYCkfxlDEby4afL3o+qXMIEcfT25TAF4qIozwqCQfX406veGTvyGLgNWlIqU?=
 =?us-ascii?Q?tmSV1avKgNcDpCHGzIIkPL9uAQDOeSjNvucy13mQxVvQhMzkvL/ScbihZ/8+?=
 =?us-ascii?Q?+F876Rb0H6ZNCQj7Ypjv2ooB88T7LdQ4beDJOHadhtBFt3XF00qKa/vzPx2I?=
 =?us-ascii?Q?6UutUYtMOn3MpSatRBK9lnQw5XVBoobrH4KkwDIWl95AmqBIoEz4BTEiiVMU?=
 =?us-ascii?Q?cAChEF/RXBw16UCrvnmA1N0wOD0nSb71VPdvfB3TN0g6zpUQk0fAMjy93qUj?=
 =?us-ascii?Q?xKgiac1XD1hpDUYZFWzpeE6WT/bPX26wyUUe3JAGj7huDMJPwPIUhgy5Dk0k?=
 =?us-ascii?Q?YU5Kzkm26YMyFXFowjL1cDTgvdOAQdn3LLxIUukr3E7KKCWWPwY09LXP+aKx?=
 =?us-ascii?Q?ErSAVFoK8cyQQV0Vr0UjteQxVn79JWDvisW+STIubKZMyy5/ZzNWwxK1LzA6?=
 =?us-ascii?Q?ap2ENWbQetttGzyysr2CERkcg4nO7t/QZSZWeRShgkJO4l6VVb4Jb1kahfoy?=
 =?us-ascii?Q?bmWYehkHC3vjgb86koPkBZrwKdzjy6b188b6NuWXYiOJgF2nPRmI1v2l0L4P?=
 =?us-ascii?Q?caFCagOahqkeqxxoKcNOlQWtj51MnXa2Y5qN+hN+xKJSF4VG9EpI6Rktprej?=
 =?us-ascii?Q?bFvvNXI/F7Mp0jkLq0dppxZ/AsH6ImSSYR6Po24ZM6E/nRnIbj/IZN/CpbuX?=
 =?us-ascii?Q?7ofpJE9NG4Sw7iC88BCafQu8+OLzYUuyyfTzIMaeMhkvmTIU1BCX8jP/Np5u?=
 =?us-ascii?Q?wOZ/PHExweoeSZwP7Kfcq/JLk1VvJmujiVpNNLkiIZJuDmD7DNNy/Rmp9TVO?=
 =?us-ascii?Q?NEdQsIMl2QyBgo1YHFHmWRvgv5hp2pnmNc2lE8p8Kqgr2zzCZmOpGB8uprAw?=
 =?us-ascii?Q?wEQBZ5etQF9SxnwUw8iVRBPIMveLvp9wchUOFAJwTniyncM+gHrPQ+lM8BsJ?=
 =?us-ascii?Q?lW9ySlHT7nMDnrHX9DJXNRU0q+oglteLulze3G/5tf0DOuxXzyULKVKvXJVa?=
 =?us-ascii?Q?O83R1RCl+8ZFvd5uu07vj7AvNVc3fWhz4cOKh0iVAz8h2EGgL4GonUkBnNDk?=
 =?us-ascii?Q?JMcpY8qHd685ErT76wG/naXcQSlSkxu01tR6jNPXDHiokdAt4Fy1PJq/5t7l?=
 =?us-ascii?Q?moHmkS79I/AGpd5ZjycpZO7+IX6JkKFzHQxoubUH5Kvz2fHrYbS8dQtjzrNF?=
 =?us-ascii?Q?GIgq5dgBPNgO8LIh6DOhvvilhlYzOOd+QEDuNsnDc9XvQPSe/A0RJbOumnVk?=
 =?us-ascii?Q?MGdP3v27vAG3aeFQvemPqbZ/9a6MWZOq0HfgHTgu8/B6Kr1YNO8H5yIdNR6X?=
 =?us-ascii?Q?/fHPpIeokgWsvwGZER1CCyvqlyUtiBD44vkXUYZGiTFhIz89to+NCuxCh23L?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GlPTnokCz8N4wKWTTCB2dsrm76plUiYCQrlSnq5+IjbD9ARZraw6jmCmQ4xvxU/Nw5OhJDVEZNhfHVltzZ5bRU/JbyQ2tggda5OAhcXaBvIe4rCjyDiNVFwePcJGCeZfZ8XyEnjokqV+ytSZO9w7NO7HjatNgKNco0V+SqAqsJmLE8sOIw2wpBsiWXU0ob28cbu8bS4YJ6QvOv/pnM/poUEjfKMcUeWHZ6YfBGN4xUiDCW3aZhNlptvDAZlDs6j5rXJeVSj5Z11i/5ke9Fv7Q2PLyfEzJWVtsY1KkdDF9UY0hzKMSU171uC/glRRwE6m+wSl/ekWrImLmcl5YtLfPB4v5hsjvzY2PR4ZQayW54oSXwQbk+958UtLJ4Xd+ASKJFnBnsexHdfgmnjNpDVMQgJZMytRjJnQKciKdj/JueuEcq0q3wpA+pErkuM1w3OpT1VPRZUiysxggRX92EmXcHEaVCTC44T1c6D3jF8ko5xEhZQt2SOukrdnOMv5rrPQ/eYvaBvpA6PfqpIPt7Xdik54AuAoYn2q6D/iYPTXK3WgJ05ZTx+n+oBomF9wcVrkbI3NpHMn5gS6RSNaj+hMncJdh1ovPF4W4pjj7jeDrU0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8ffaf4-7e9a-4e7f-d9bd-08dd92ee94d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:52:35.4405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +X2nz/OjssEj5BKBgDK+M2bNDXjUzqXwKDRPQd6fvyFmffpwFdOQ3wEuSZCsrAWgvg/qdag2lZ+ISS3G3AE8opqC5MfTtXzei09YLUR/Ffs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7473
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505140122
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEyMyBTYWx0ZWRfXznE58FHfi/IJ b06SdPDWwA2JFCElHo9QmA6ZXP3F4xsmvbydbab4f0PwI3Ak5vdVqCKuMZS9pB8uNZizvf5dUmp 8Z809m/t9LSzs6tnSlrTXk2Yno0MGkDBSfDElNFwZhllfDrhEiy8GAdGyhZbi76m5uYULJ7eamz
 vllXxIGKNpC6l3tS3tkSJUH/3hP4Zych08JsULCFssexiaDR/Y3Z/gbD5gwXWXmsXcWEmbILnOP faVH+e65noMIEE/5MRb9twG5MrAXppzWU4brQn3tiGaPlOzXMlfHo8L8o+dEse+2SWuYAV6BPqg rQuZJCPcO/3JavqQg/nz1B3wbhioswRNu6sWdeqOz1E0CY27Rp2+nnGm1Q0ng136u1tQY0AvQEE
 +PDtxtjW4I9/N+5kXJL1YOpuIOtra49idbputYJagcRYR9fNDz8np4MSes1X4OsG3dChl+ii
X-Authority-Analysis: v=2.4 cv=EtTSrTcA c=1 sm=1 tr=0 ts=6824a027 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=TAZUD9gdAAAA:8 a=JfrnYn6hAAAA:8 a=wRhBkI-2iXOkaT8_QbYA:9 a=CjuIK1q_8ugA:10 a=f1lSKsbWiCfrRWj5-Iac:22 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf
 awl=host:13185
X-Proofpoint-ORIG-GUID: yM2lCBeQdrZR5qACCBfJXkif8FKjT2Qx
X-Proofpoint-GUID: yM2lCBeQdrZR5qACCBfJXkif8FKjT2Qx

Andrew - we should probably drop this patch for now given the report at [0].

It seems s390 (to risk sounding hyperbolic - fairly ludicriously) declares
PROT_NONE in an enum somewhere that blows this up.

I have pinged s390 people on there, but I don't think this is going to make this
cycle given we will probably need to coordinate with them to fix up this enum
name (which seems the best solution to me!...)

[0]: https://lore.kernel.org/all/202505140943.IgHDa9s7-lkp@intel.com/

Thanks, Lorenzo

On Thu, May 08, 2025 at 12:20:27PM +0200, Ignacio Moreno Gonzalez via B4 Relay wrote:
> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>
> VM_NOHUGEPAGE is a no-op if CONFIG_TRANSPARENT_HUGEPAGE is disabled. So
> it makes no sense to return an error when calling madvise() with
> MADV_NOHUGEPAGE in that case.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> ---
> https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com
>
> Here it is presented as a separate thread to avoid mixing stable and
> non-stable patches.
>
> This change makes calling madvise(addr, size, MADV_NOHUGEPAGE) on !THP
> kernels to return 0 instead of -EINVAL.
> ---
>  include/linux/huge_mm.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index e893d546a49f464f7586db639fe216231f03651a..5fca742dc5ba784ffccea055b07247707d16cc67 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -509,6 +509,8 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>
>  #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>
> +#include <uapi/asm/mman.h>

Also this should be linux/mman.h I believe, sorry for not catching first time round...!

> +
>  static inline bool folio_test_pmd_mappable(struct folio *folio)
>  {
>  	return false;
> @@ -598,6 +600,9 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
>  static inline int hugepage_madvise(struct vm_area_struct *vma,
>  				   unsigned long *vm_flags, int advice)
>  {
> +	/* On a !THP kernel, MADV_NOHUGEPAGE is a no-op, but MADV_NOHUGEPAGE is not supported */
> +	if (advice == MADV_NOHUGEPAGE)
> +		return 0;
>  	return -EINVAL;
>  }
>
>
> ---
> base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
> change-id: 20250508-madvise-nohugepage-noop-without-thp-e0721b973d82
>
> Best regards,
> --
> Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>
>
