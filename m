Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F202DFA37
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585777; cv=fail; b=XxzuFMJjGcMdVCpUFEJNagIitUKDgTzDYftxYnkQjHWLZPnK0DPE3MkOyHtTkn4YgNkkeoyjooYGZYobwvGY2GA9W0cnouQNU4TqOeRbYaB6fQ8FCcaGcGqzU5bUV5hTd7xZqaMJadew/zdjvwEjQ1K52X1zgWYUSgB//dCHxkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585777; c=relaxed/simple;
	bh=O6ZtoIXxjtQvV+hOS2neUW0d9mDHEcStz6/MtwmUHoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z7NJ09uZHd/ceEvsEUYYfb3a2rjHJd2WzoMNhtxsR9Iq8MX4cisB0zsdjECrwPs+EgtAT1kic8EQudkIyfVDA/dbyhoI5ZheTd993L21ukQW+Tqsdn9OWIitFjpIbebEXFZIHy7Q6Ayf06KjCClaoo+RCo5xYVRz7fzpZHxc8SY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EheTqO8b; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EheTqO8b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Si/F+LjXY+Yy2eau8kpVmMhHNV2E4l5Sxoip2CFgB6JhGgXi679obnral1qXZCkXuGfAG9ADt0SAkvTbi7NfSjb+9ab27YAcFMtXYnzO1z41bxgacFF4o/PTHPfacOYLGdm3NylLtlLg8Om8992LG6zlwODEZbUuowptpyFnjKY3uX9L7ANUGA2pu7ozYFsD82XJg38BPaqOm51BhFcp7u/0d9BG6yOu2haj2WHCD4AGoQI3hsn3quPLdf7T+TINL3EA+M/vxeWPvCduhDdlNudVucoSr+BIjAr6vUuWLAHxTT+Dt8zMAE7yhNopdIZlBYUVupXYGK9JB/AaYITezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7a70XP0t0ei/VO5nYH7eK2ZyAnvGFuQ4t6h9ehtVjLg=;
 b=IQjiQnih0zAAjhwevYPKKfDgRMkfbv2IfCpvd3qcdKQ3GkuFlh9BczZEoLvfNqfdKx8eXQ4vLbkkQ6XGzx6eq09MXI1wCDiUUGdwzYOj8jKUDZhkXlAXTi2WYsWndTy4dl5s10sGsqD10/s2cEZVS/OpbU/+Rur9kptUlfArW5ppvm0KJsmjuYeqz6p9TYd1jUc60WRtelybv9LLVUak0TYs82zcakXhlL5VTYgCd0kSzJYxubRuK2u4zqYMX4vn6DmyPD1EZbM0mP5SzxPCDWP3HqQdt964GuDflrfJOBRhC0sM4a4Q9CbV7yL/sY99A7A/Nq9BlJXJD9mKBneXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7a70XP0t0ei/VO5nYH7eK2ZyAnvGFuQ4t6h9ehtVjLg=;
 b=EheTqO8bOotMSAS+vIrZLPvKyxvyn4mMWf0hANTf+75tgW/tIwmkDT3IRja7z9u+cD37gxCDpAlmnVoSIhNuQGyC8hPj/QO/h2B218Z/OSbG5cg/ofHV+sYs3EsPqaopXthtld+IqhgnBIq2QqM2E4Z4Bx/StK90utmSIyP9az5toIsVnrgJEqe0AIDye9CqcSfl2SdLbAgXNbx5cu0DEdj4Q4aJAsUWg4hNkAnOkSmLODTOGPyLCn/J68VcwmuswVx9Rztw0P3Oo5obTdA8G+ZGDkQc8gA2NlTdYZWCWj5fm2UmtRETmmupEn3niCBdPRMngATwSXT3bSkMF5Li/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:36:06 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:36:06 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Xu <peterx@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jane Chu <jane.chu@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [v1 resend 06/12] lib/test_hmm: test cases and support for zone device private THP
Date: Fri,  4 Jul 2025 09:35:05 +1000
Message-ID: <20250703233511.2028395-7-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR01CA0022.prod.exchangelabs.com (2603:10b6:805:b6::35)
 To PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd81e0f-09cf-485d-22c9-08ddba8a6177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1Q5R0VNQkdLM3R5b0tWaUhnY2YyZWhyRTV0bWpZc01xVlc4bE1HemZIQjZl?=
 =?utf-8?B?K1c0SFl3ZTJud3NoQ0pzTVRtK21qUU1iWEo5NnIxKzNkbVlURm5nOFk4QkVO?=
 =?utf-8?B?UFVmK2swUkdzL3BuYmZFSi91bEdCaXJpVzZZaVpwVWEzc0drYUd5WmVBeEFh?=
 =?utf-8?B?OEc0aDZYaHFxRU4vUWVPd3ZoOTZYaTVhK1E0RGRmaHlnZElidkJvdlNUalRx?=
 =?utf-8?B?SnN3U3JHUTJKNUFYTUhrbm8rNStkbWhRSlFoekovRDlLditWUHBBb1o1VW5t?=
 =?utf-8?B?YVNDWlV0eDgrRURHQnFyc21BVTltV0lBM1lQL21DUHJucjViNEExQXFvUGw4?=
 =?utf-8?B?WXNDSXRoQ2FkdldJTVArNHljRDVidndWMEt1Sy9TVWZnQjJUMEhoV2hvV1Aw?=
 =?utf-8?B?Umw5Q0FWNkdBTTVpM293eVNjMit0RDVKbUxaR1U2R3BKUUFUOENVOXdhY2Rv?=
 =?utf-8?B?MlMrRkhhUXhZeDdub1lTYTd0UGZsbDFrOHRvRUpoTEw5TWQxN2pKaEFuMDZW?=
 =?utf-8?B?QzFlNlh1VTZ2SVJ5ekM2TGp5S1J5WktvV3RzZjFjMGM4SFNsWWx1Y2VDYUtG?=
 =?utf-8?B?NUc1RjUxQnpEU0JKQ2d2L1VRa2tuZ1FFYXpZVG14SHZ1VFA1TVU4T0dpRzEy?=
 =?utf-8?B?b1VMaTBpbXdzRmpPWWdFcnBIZ0VVQjY1UGdpVXc4U3BVUWhKZC9qcjlZS2dU?=
 =?utf-8?B?Z0tsZFZra0FhY3ZkRmhXZ2RGQkZuSS83VW9HNkZZY0ZnY1QreGRkckFtLzNj?=
 =?utf-8?B?eVlxRytXUktQbkVmQjBJODdndXBaRHBBdkVEVTNpMU84eEJVSzIrT1pGRXZX?=
 =?utf-8?B?Y0FXY0VBNlBJakx2cU5PM3lQZ0txam51YkZ0L1BjVUNrODZWSDdqY2x6eGE2?=
 =?utf-8?B?NUdPSUJnYkljbVllMEN6blByc3ViRnZlM3J0OHNMU3liNk5SRHo1dGExSEdm?=
 =?utf-8?B?MUsxSkpJbU1GMkRJY2ljTGtkWlp6MkRoYnVHbk5lNEZoY1NxL0lrRjNyN1dD?=
 =?utf-8?B?MXNyWGRQU2xYcWRqejVsWi94Z2FMcVVJZFV0UUFOdDFSb0ZjTWhCMnpXdFl1?=
 =?utf-8?B?UHFIUHFvTnF6eGpPbWkyMUw0b1QzTTRXSGxrWDBzVHA1NTZSZGFQQVh0b1c3?=
 =?utf-8?B?a1loZnBXZTRaL2NoZWlkOWI5aEZEd3ZWRWxYV1A2L0lwdEVvMU1Hb0F0QTNw?=
 =?utf-8?B?ejY5VjdvVzc0emVQSkdlWUNhWHpBSjVxK3lVdjU4K3pJbGllNG9KSDNCcXlm?=
 =?utf-8?B?cUN3L1BGTUdibS96K05HYTdUSXFZQzE4VFROU0hYSFFrVkp1c2RRZjdwbTFr?=
 =?utf-8?B?aFRxZzROdXJWMHlDUTJIb2R0Si96SHRpbGRNaFlJdlNvdjlocnNBVDBKYzly?=
 =?utf-8?B?djhCVDNhYzVKWjBCYzhRczYwc3RCZ0drdU5uYjU1aUE4S3k5NkxvUktJT1VN?=
 =?utf-8?B?Ymd5ZXNkTE15OVR0cnZNMWN0YWFQcUcrVk5KOXE0c1QxRExWV2ZZdTRYQ2Zm?=
 =?utf-8?B?VGtxbEoydnFLbDdiT2R3Tm93T2txSnEwRXdmbFdxMFV0RXBVQ0RUbk5tbXBk?=
 =?utf-8?B?aWVvR2ZMNjV6RGRibHNVUUpuSkZBakxEeWxQTTZUeWtHN0J4WEd2N2VUL0tC?=
 =?utf-8?B?cUN4aEFGemRCK3o1YWI2QTJmZk9FdXNwWHdrY1hnSm4rUEMyd3ZaYjhMVnNQ?=
 =?utf-8?B?UFF1dGZHL1V1bWxzVmM2eDZOODErWEdFRXJXUW5Yc0lHaWNQUktkU3ViL3lK?=
 =?utf-8?B?R2RNQzJzejE3L2grZFprT0tteHhoZnlOd1dLekMzQ3kxdU43NHEwOE03OVVl?=
 =?utf-8?B?dW9SUzdZd1kzdVBaUklQVlVabG02ZkZsN21LcDZ3cjVSQlBtdmNSVHRtNzF2?=
 =?utf-8?B?bHhybll3M0VWU29aUk1STW5aT3VvVzJwcEg2UzJCS3I3RXk2OStFUENpR1lj?=
 =?utf-8?Q?4XqnfDzesw8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmkxYnEvb045U2tLc3VqWnNaN2NYVjVQRFNwelM5ZjdQWmxVVXRVRTZiL2dz?=
 =?utf-8?B?azlEbGdWUEIyTUVyRGQ2dTFoUmRCU1FaSjQ4R2NvMWhlZ21PUEx5SVI1dXJN?=
 =?utf-8?B?a3dGVUhpVURta0dmSmM1eElFeDlVaFRBS1Z0MXc3L2ExbHd2cG5CK2pwbWlN?=
 =?utf-8?B?SnE2QkQzQ3dvalNtdmhZSnFBY2FLcER4dHBkNVVzYWZGaCtZM1AybmRMcFBC?=
 =?utf-8?B?ekNmdENMdVJ0VFBuVXl5TlNDOWkxc2tiQTR6alJPSERFQ3RuREZNdG5aTWp2?=
 =?utf-8?B?UUF3WmVJZkhjZzBJemx5QUttQ0RPcXRRM2I0VHNNRit1aHRhVEk1czVRbk5s?=
 =?utf-8?B?c0ZtcTNHMXlQNit3RVE5cVQzV1RxUDFqdGdDdDZJczNUZjl5L2ZaRVlGVE5q?=
 =?utf-8?B?S0ZrQXN6NUZqN3d5LzhPVHRRQzJTVDN1dmFNWS8zVndLZ3kxOTRhaW9tVkh5?=
 =?utf-8?B?MTR2a1paUUxKdi9XSGl5RlBNZHFVQTI1YjRicy9QRnYvSFBjSlFQY2tnVWli?=
 =?utf-8?B?bGEyM2pQK3dmT3NxNGtmK3p0OVJWSDhrVzhZL3AzK0IxV0I4VHQzbkVRcm95?=
 =?utf-8?B?TXRrMS9sMDJTSjQ4NGxzbDNmM04yVDJlbWN1dUk0OS9ZV1NvNGZLY1VRYmVT?=
 =?utf-8?B?b2pTZWZ4N1c1SlFmZGVSZktISzVlczZVN1AyRUU5K1BSVGozZEJ2QXhBUWpN?=
 =?utf-8?B?bS82UlhuVi8xdjYwZ2Q3SVlBQUtaZGJ2SUsxU2N2cHp0RnhLck9xeE1RYVNx?=
 =?utf-8?B?VzZXempTVlcreGpMUjJ4SkRaZTZIcjNiOG5PVjQ5MFBYaVhlV3Qvd0c3czEw?=
 =?utf-8?B?SGV3K2tYeUZSNGRhRXlnVDhWdXZlUUtXNVVZZ1hjVVY1eDFzWXVHZ0xFZDVL?=
 =?utf-8?B?bERKMmFGQUZ6SXlLc3F0QTBScDUrVVpwU3NlVjY0cjczdi85dE82ak4ybnZq?=
 =?utf-8?B?SFlVUHoxT2kyRnZ1aTdGWjlOTk41aDROb2NWczMxMFo0WVVzdko0WTVHNVNn?=
 =?utf-8?B?eU9vdDR5N1BMcjNieW9nQjlPQmRPTEtPWnMwU0x1UU9KNjdqajl6Q3E1NElH?=
 =?utf-8?B?Q2tPNmVBSDFESTZiR28rWXJML1dQcHlVZmdTeHlkczZRZXR6bVcyVWp5N0o1?=
 =?utf-8?B?VGpjZUdPMWVhVVBpMjUzbGd4MkhhM1l3ek9yc2xMSXZrL3R4ZHY5aVhha25M?=
 =?utf-8?B?aDROb1hMMlVHVEVFUUN5d0tqODY3Ump0N0ZoL3RWRmw1L0UxelFzU0Z2a0tz?=
 =?utf-8?B?MGtSNUZ0VHI4V21FaW5GNldKUk5SclVTWlcvc21zSWM1Y3pzNUtHc2xkQm94?=
 =?utf-8?B?UzgzZldXT1ZNVDlSOGZqa2UyVkxXVnMySFdtS3dIM2RSUFlMb3JOYlZ2bkRB?=
 =?utf-8?B?aTFnSTBFQU1SVndaMm9UTzk3Y0Nma2E2M0xWbDkxZEZXQUdNSE5BOXM2ZlNj?=
 =?utf-8?B?NWJRMzFQcGpZN21EMUNhUkY1WlNwd2V3amFYV0svT0JhZTZTYlg2MjhEcHBO?=
 =?utf-8?B?bVhDbjJhTjFKNDRPZHdjdWRuaDNDbnUwMFc2ZUxDbEJJZ0MvMjI3VWU2VlhG?=
 =?utf-8?B?VlpJSVpjVGxPMGlpWitiWmJEaUhOSzVCTE5JY3N6VzVvTEVoUmdFUUlCdHha?=
 =?utf-8?B?M0c1OXJreW95QlRHUE1McVNtTnN6TmF5Nm1FNE9LeERsQTlMaHIzQVc1bzZX?=
 =?utf-8?B?Z2hNTHlIdEhBaWZWc1ZqYmM3ODF2VUlKQWUvblBpeDFyZXc4YWVsUEpkT0Zx?=
 =?utf-8?B?RmhGaTZ4NmtSR3luenRpT09vczY0L2Y4RDI2d0NsVDBiZUhVY2JVdElweG5o?=
 =?utf-8?B?MlFUM1d0cmo4bTNHZWdkc0tTOUU2cU9KckNnL2lnZTVpL05LMVFkaVlVMkxh?=
 =?utf-8?B?T2t0dTR1TTdvQnlrdUEvYmRJMFBJdEtHTFBqdlNNT0xQVjl4QzhKdGxiTjNt?=
 =?utf-8?B?dUVNbUl3VmdMWmJKTDU3bGhENHZXYmVUL2JMRDVrVzY4Q3hBNFBELzFSYnIy?=
 =?utf-8?B?RlZ1enhRNEd4TGVWT1JvNSs3Sjh6Q0ltN0ZtdExMOHg2SHowVm1BZjcrOEtU?=
 =?utf-8?B?WDc3c2N1TGFyQkhkNS9oN2xsZFJSK2o0RUNkK3ZJSDZpdUgyYVdWN0QwaGJa?=
 =?utf-8?Q?fjzFy0FzEdeo8ZLB6ZPeOLNvT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd81e0f-09cf-485d-22c9-08ddba8a6177
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:36:06.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUpmIGNCkmMNaKKWzg4uTnJwbRuLCSQ22R/VqDaAZdBw56z1W8QAjTSh90HuHUcY8KUV0TtzJ8tCGrd9kf4bVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459

Enhance the hmm test driver (lib/test_hmm) with support for
THP pages.

A new pool of free_folios() has now been added to the dmirror
device, which can be allocated when a request for a THP zone
device private page is made.

Add compound page awareness to the allocation function during
normal migration and fault based migration. These routines also
copy folio_nr_pages() when moving data between system memory
and device memory.

args.src and args.dst used to hold migration entries are now
dynamically allocated (as they need to hold HPAGE_PMD_NR entries
or more).

Split and migrate support will be added in future patches in this
series.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Jane Chu <jane.chu@oracle.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Donet Tom <donettom@linux.ibm.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 lib/test_hmm.c | 355 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 282 insertions(+), 73 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 761725bc713c..95b4276a17fd 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -119,6 +119,7 @@ struct dmirror_device {
 	unsigned long		calloc;
 	unsigned long		cfree;
 	struct page		*free_pages;
+	struct folio		*free_folios;
 	spinlock_t		lock;		/* protects the above */
 };
 
@@ -492,7 +493,7 @@ static int dmirror_write(struct dmirror *dmirror, struct hmm_dmirror_cmd *cmd)
 }
 
 static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
-				   struct page **ppage)
+				  struct page **ppage, bool is_large)
 {
 	struct dmirror_chunk *devmem;
 	struct resource *res = NULL;
@@ -572,20 +573,45 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		pfn_first, pfn_last);
 
 	spin_lock(&mdevice->lock);
-	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
+	for (pfn = pfn_first; pfn < pfn_last; ) {
 		struct page *page = pfn_to_page(pfn);
 
+		if (is_large && IS_ALIGNED(pfn, HPAGE_PMD_NR)
+			&& (pfn + HPAGE_PMD_NR <= pfn_last)) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+			pfn += HPAGE_PMD_NR;
+			continue;
+		}
+
 		page->zone_device_data = mdevice->free_pages;
 		mdevice->free_pages = page;
+		pfn++;
 	}
+
+	ret = 0;
 	if (ppage) {
-		*ppage = mdevice->free_pages;
-		mdevice->free_pages = (*ppage)->zone_device_data;
-		mdevice->calloc++;
+		if (is_large) {
+			if (!mdevice->free_folios) {
+				ret = -ENOMEM;
+				goto err_unlock;
+			}
+			*ppage = folio_page(mdevice->free_folios, 0);
+			mdevice->free_folios = (*ppage)->zone_device_data;
+			mdevice->calloc += HPAGE_PMD_NR;
+		} else if (mdevice->free_pages) {
+			*ppage = mdevice->free_pages;
+			mdevice->free_pages = (*ppage)->zone_device_data;
+			mdevice->calloc++;
+		} else {
+			ret = -ENOMEM;
+			goto err_unlock;
+		}
 	}
+err_unlock:
 	spin_unlock(&mdevice->lock);
 
-	return 0;
+	return ret;
 
 err_release:
 	mutex_unlock(&mdevice->devmem_lock);
@@ -598,10 +624,13 @@ static int dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	return ret;
 }
 
-static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
+static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
+					      bool is_large)
 {
 	struct page *dpage = NULL;
 	struct page *rpage = NULL;
+	unsigned int order = is_large ? HPAGE_PMD_ORDER : 0;
+	struct dmirror_device *mdevice = dmirror->mdevice;
 
 	/*
 	 * For ZONE_DEVICE private type, this is a fake device so we allocate
@@ -610,49 +639,55 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	 * data and ignore rpage.
 	 */
 	if (dmirror_is_private_zone(mdevice)) {
-		rpage = alloc_page(GFP_HIGHUSER);
+		rpage = folio_page(folio_alloc(GFP_HIGHUSER, order), 0);
 		if (!rpage)
 			return NULL;
 	}
 	spin_lock(&mdevice->lock);
 
-	if (mdevice->free_pages) {
+	if (is_large && mdevice->free_folios) {
+		dpage = folio_page(mdevice->free_folios, 0);
+		mdevice->free_folios = dpage->zone_device_data;
+		mdevice->calloc += 1 << order;
+		spin_unlock(&mdevice->lock);
+	} else if (!is_large && mdevice->free_pages) {
 		dpage = mdevice->free_pages;
 		mdevice->free_pages = dpage->zone_device_data;
 		mdevice->calloc++;
 		spin_unlock(&mdevice->lock);
 	} else {
 		spin_unlock(&mdevice->lock);
-		if (dmirror_allocate_chunk(mdevice, &dpage))
+		if (dmirror_allocate_chunk(mdevice, &dpage, is_large))
 			goto error;
 	}
 
-	zone_device_page_init(dpage);
+	init_zone_device_folio(page_folio(dpage), order);
 	dpage->zone_device_data = rpage;
 	return dpage;
 
 error:
 	if (rpage)
-		__free_page(rpage);
+		__free_pages(rpage, order);
 	return NULL;
 }
 
 static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 					   struct dmirror *dmirror)
 {
-	struct dmirror_device *mdevice = dmirror->mdevice;
 	const unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
 	unsigned long addr;
 
-	for (addr = args->start; addr < args->end; addr += PAGE_SIZE,
-						   src++, dst++) {
+	for (addr = args->start; addr < args->end; ) {
 		struct page *spage;
 		struct page *dpage;
 		struct page *rpage;
+		bool is_large = *src & MIGRATE_PFN_COMPOUND;
+		int write = (*src & MIGRATE_PFN_WRITE) ? MIGRATE_PFN_WRITE : 0;
+		unsigned long nr = 1;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+			goto next;
 
 		/*
 		 * Note that spage might be NULL which is OK since it is an
@@ -662,17 +697,45 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		if (WARN(spage && is_zone_device_page(spage),
 		     "page already in device spage pfn: 0x%lx\n",
 		     page_to_pfn(spage)))
+			goto next;
+
+		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (!dpage) {
+			struct folio *folio;
+			unsigned long i;
+			unsigned long spfn = *src >> MIGRATE_PFN_SHIFT;
+			struct page *src_page;
+
+			if (!is_large)
+				goto next;
+
+			if (!spage && is_large) {
+				nr = HPAGE_PMD_NR;
+			} else {
+				folio = page_folio(spage);
+				nr = folio_nr_pages(folio);
+			}
+
+			for (i = 0; i < nr && addr < args->end; i++) {
+				dpage = dmirror_devmem_alloc_page(dmirror, false);
+				rpage = BACKING_PAGE(dpage);
+				rpage->zone_device_data = dmirror;
+
+				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+				src_page = pfn_to_page(spfn + i);
+
+				if (spage)
+					copy_highpage(rpage, src_page);
+				else
+					clear_highpage(rpage);
+				src++;
+				dst++;
+				addr += PAGE_SIZE;
+			}
 			continue;
-
-		dpage = dmirror_devmem_alloc_page(mdevice);
-		if (!dpage)
-			continue;
+		}
 
 		rpage = BACKING_PAGE(dpage);
-		if (spage)
-			copy_highpage(rpage, spage);
-		else
-			clear_highpage(rpage);
 
 		/*
 		 * Normally, a device would use the page->zone_device_data to
@@ -684,10 +747,42 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 			 page_to_pfn(spage), page_to_pfn(dpage));
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if ((*src & MIGRATE_PFN_WRITE) ||
-		    (!spage && args->vma->vm_flags & VM_WRITE))
-			*dst |= MIGRATE_PFN_WRITE;
+
+		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
+
+		if (is_large) {
+			int i;
+			struct folio *folio = page_folio(dpage);
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+			if (folio_test_large(folio)) {
+				for (i = 0; i < folio_nr_pages(folio); i++) {
+					struct page *dst_page =
+						pfn_to_page(page_to_pfn(rpage) + i);
+					struct page *src_page =
+						pfn_to_page(page_to_pfn(spage) + i);
+
+					if (spage)
+						copy_highpage(dst_page, src_page);
+					else
+						clear_highpage(dst_page);
+					src++;
+					dst++;
+					addr += PAGE_SIZE;
+				}
+				continue;
+			}
+		}
+
+		if (spage)
+			copy_highpage(rpage, spage);
+		else
+			clear_highpage(rpage);
+
+next:
+		src++;
+		dst++;
+		addr += PAGE_SIZE;
 	}
 }
 
@@ -734,14 +829,17 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 	const unsigned long *src = args->src;
 	const unsigned long *dst = args->dst;
 	unsigned long pfn;
+	const unsigned long start_pfn = start >> PAGE_SHIFT;
+	const unsigned long end_pfn = end >> PAGE_SHIFT;
 
 	/* Map the migrated pages into the device's page tables. */
 	mutex_lock(&dmirror->mutex);
 
-	for (pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++,
-								src++, dst++) {
+	for (pfn = start_pfn; pfn < end_pfn; pfn++, src++, dst++) {
 		struct page *dpage;
 		void *entry;
+		int nr, i;
+		struct page *rpage;
 
 		if (!(*src & MIGRATE_PFN_MIGRATE))
 			continue;
@@ -750,13 +848,25 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		if (!dpage)
 			continue;
 
-		entry = BACKING_PAGE(dpage);
-		if (*dst & MIGRATE_PFN_WRITE)
-			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
-		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
-		if (xa_is_err(entry)) {
-			mutex_unlock(&dmirror->mutex);
-			return xa_err(entry);
+		if (*dst & MIGRATE_PFN_COMPOUND)
+			nr = folio_nr_pages(page_folio(dpage));
+		else
+			nr = 1;
+
+		WARN_ON_ONCE(end_pfn < start_pfn + nr);
+
+		rpage = BACKING_PAGE(dpage);
+		VM_BUG_ON(folio_nr_pages(page_folio(rpage)) != nr);
+
+		for (i = 0; i < nr; i++) {
+			entry = folio_page(page_folio(rpage), i);
+			if (*dst & MIGRATE_PFN_WRITE)
+				entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
+			entry = xa_store(&dmirror->pt, pfn + i, entry, GFP_ATOMIC);
+			if (xa_is_err(entry)) {
+				mutex_unlock(&dmirror->mutex);
+				return xa_err(entry);
+			}
 		}
 	}
 
@@ -829,31 +939,61 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 	unsigned long start = args->start;
 	unsigned long end = args->end;
 	unsigned long addr;
+	unsigned int order = 0;
+	int i;
 
-	for (addr = start; addr < end; addr += PAGE_SIZE,
-				       src++, dst++) {
+	for (addr = start; addr < end; ) {
 		struct page *dpage, *spage;
 
 		spage = migrate_pfn_to_page(*src);
 		if (!spage || !(*src & MIGRATE_PFN_MIGRATE))
-			continue;
+			goto next;
 
 		if (WARN_ON(!is_device_private_page(spage) &&
 			    !is_device_coherent_page(spage)))
-			continue;
+			goto next;
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-		if (!dpage)
-			continue;
-		pr_debug("migrating from dev to sys pfn src: 0x%lx pfn dst: 0x%lx\n",
-			 page_to_pfn(spage), page_to_pfn(dpage));
+		order = folio_order(page_folio(spage));
+
+		if (order)
+			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
+						order, args->vma, addr), 0);
+		else
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+
+		/* Try with smaller pages if large allocation fails */
+		if (!dpage && order) {
+			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+			if (!dpage)
+				return VM_FAULT_OOM;
+			order = 0;
+		}
 
+		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
+				page_to_pfn(spage), page_to_pfn(dpage));
 		lock_page(dpage);
 		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
 		*dst = migrate_pfn(page_to_pfn(dpage));
 		if (*src & MIGRATE_PFN_WRITE)
 			*dst |= MIGRATE_PFN_WRITE;
+		if (order)
+			*dst |= MIGRATE_PFN_COMPOUND;
+
+		for (i = 0; i < (1 << order); i++) {
+			struct page *src_page;
+			struct page *dst_page;
+
+			src_page = pfn_to_page(page_to_pfn(spage) + i);
+			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+
+			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			copy_highpage(dst_page, src_page);
+		}
+next:
+		addr += PAGE_SIZE << order;
+		src += 1 << order;
+		dst += 1 << order;
 	}
 	return 0;
 }
@@ -879,11 +1019,14 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
+
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
 	start = cmd->addr;
 	end = start + size;
@@ -902,7 +1045,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -912,7 +1055,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = dmirror_select_device(dmirror);
+		args.flags = dmirror_select_device(dmirror) | MIGRATE_VMA_SELECT_COMPOUND;
 
 		ret = migrate_vma_setup(&args);
 		if (ret)
@@ -928,6 +1071,8 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+	kvfree(src_pfns);
+	kvfree(dst_pfns);
 
 	return ret;
 }
@@ -939,12 +1084,12 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	unsigned long size = cmd->npages << PAGE_SHIFT;
 	struct mm_struct *mm = dmirror->notifier.mm;
 	struct vm_area_struct *vma;
-	unsigned long src_pfns[32] = { 0 };
-	unsigned long dst_pfns[32] = { 0 };
 	struct dmirror_bounce bounce;
 	struct migrate_vma args = { 0 };
 	unsigned long next;
 	int ret;
+	unsigned long *src_pfns;
+	unsigned long *dst_pfns;
 
 	start = cmd->addr;
 	end = start + size;
@@ -955,6 +1100,18 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	if (!mmget_not_zero(mm))
 		return -EINVAL;
 
+	ret = -ENOMEM;
+	src_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*src_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!src_pfns)
+		goto free_mem;
+
+	dst_pfns = kvcalloc(PTRS_PER_PTE, sizeof(*dst_pfns),
+			  GFP_KERNEL | __GFP_NOFAIL);
+	if (!dst_pfns)
+		goto free_mem;
+
+	ret = 0;
 	mmap_read_lock(mm);
 	for (addr = start; addr < end; addr = next) {
 		vma = vma_lookup(mm, addr);
@@ -962,7 +1119,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 			ret = -EINVAL;
 			goto out;
 		}
-		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
+		next = min(end, addr + (PTRS_PER_PTE << PAGE_SHIFT));
 		if (next > vma->vm_end)
 			next = vma->vm_end;
 
@@ -972,7 +1129,8 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.pgmap_owner = dmirror->mdevice;
-		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
+		args.flags = MIGRATE_VMA_SELECT_SYSTEM |
+				MIGRATE_VMA_SELECT_COMPOUND;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -992,7 +1150,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	 */
 	ret = dmirror_bounce_init(&bounce, start, size);
 	if (ret)
-		return ret;
+		goto free_mem;
 	mutex_lock(&dmirror->mutex);
 	ret = dmirror_do_read(dmirror, start, end, &bounce);
 	mutex_unlock(&dmirror->mutex);
@@ -1003,11 +1161,14 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
 	}
 	cmd->cpages = bounce.cpages;
 	dmirror_bounce_fini(&bounce);
-	return ret;
+	goto free_mem;
 
 out:
 	mmap_read_unlock(mm);
 	mmput(mm);
+free_mem:
+	kfree(src_pfns);
+	kfree(dst_pfns);
 	return ret;
 }
 
@@ -1200,6 +1361,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	unsigned long i;
 	unsigned long *src_pfns;
 	unsigned long *dst_pfns;
+	unsigned int order = 0;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
@@ -1215,13 +1377,25 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 		if (WARN_ON(!is_device_private_page(spage) &&
 			    !is_device_coherent_page(spage)))
 			continue;
+
+		order = folio_order(page_folio(spage));
 		spage = BACKING_PAGE(spage);
-		dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+		if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+			dpage = folio_page(folio_alloc(GFP_HIGHUSER_MOVABLE,
+					      order), 0);
+		} else {
+			dpage = alloc_page(GFP_HIGHUSER_MOVABLE | __GFP_NOFAIL);
+			order = 0;
+		}
+
+		/* TODO Support splitting here */
 		lock_page(dpage);
-		copy_highpage(dpage, spage);
 		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
 		if (src_pfns[i] & MIGRATE_PFN_WRITE)
 			dst_pfns[i] |= MIGRATE_PFN_WRITE;
+		if (order)
+			dst_pfns[i] |= MIGRATE_PFN_COMPOUND;
+		folio_copy(page_folio(dpage), page_folio(spage));
 	}
 	migrate_device_pages(src_pfns, dst_pfns, npages);
 	migrate_device_finalize(src_pfns, dst_pfns, npages);
@@ -1234,7 +1408,12 @@ static void dmirror_remove_free_pages(struct dmirror_chunk *devmem)
 {
 	struct dmirror_device *mdevice = devmem->mdevice;
 	struct page *page;
+	struct folio *folio;
 
+
+	for (folio = mdevice->free_folios; folio; folio = folio_zone_device_data(folio))
+		if (dmirror_page_to_chunk(folio_page(folio, 0)) == devmem)
+			mdevice->free_folios = folio_zone_device_data(folio);
 	for (page = mdevice->free_pages; page; page = page->zone_device_data)
 		if (dmirror_page_to_chunk(page) == devmem)
 			mdevice->free_pages = page->zone_device_data;
@@ -1265,6 +1444,7 @@ static void dmirror_device_remove_chunks(struct dmirror_device *mdevice)
 		mdevice->devmem_count = 0;
 		mdevice->devmem_capacity = 0;
 		mdevice->free_pages = NULL;
+		mdevice->free_folios = NULL;
 		kfree(mdevice->devmem_chunks);
 		mdevice->devmem_chunks = NULL;
 	}
@@ -1378,18 +1558,30 @@ static void dmirror_devmem_free(struct page *page)
 {
 	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
+	struct folio *folio = page_folio(rpage);
+	unsigned int order = folio_order(folio);
 
-	if (rpage != page)
-		__free_page(rpage);
+	if (rpage != page) {
+		if (order)
+			__free_pages(rpage, order);
+		else
+			__free_page(rpage);
+		rpage = NULL;
+	}
 
 	mdevice = dmirror_page_to_device(page);
 	spin_lock(&mdevice->lock);
 
 	/* Return page to our allocator if not freeing the chunk */
 	if (!dmirror_page_to_chunk(page)->remove) {
-		mdevice->cfree++;
-		page->zone_device_data = mdevice->free_pages;
-		mdevice->free_pages = page;
+		mdevice->cfree += 1 << order;
+		if (order) {
+			page->zone_device_data = mdevice->free_folios;
+			mdevice->free_folios = page_folio(page);
+		} else {
+			page->zone_device_data = mdevice->free_pages;
+			mdevice->free_pages = page;
+		}
 	}
 	spin_unlock(&mdevice->lock);
 }
@@ -1397,11 +1589,10 @@ static void dmirror_devmem_free(struct page *page)
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args = { 0 };
-	unsigned long src_pfns = 0;
-	unsigned long dst_pfns = 0;
 	struct page *rpage;
 	struct dmirror *dmirror;
-	vm_fault_t ret;
+	vm_fault_t ret = 0;
+	unsigned int order, nr;
 
 	/*
 	 * Normally, a device would use the page->zone_device_data to point to
@@ -1412,21 +1603,36 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	dmirror = rpage->zone_device_data;
 
 	/* FIXME demonstrate how we can adjust migrate range */
+	order = folio_order(page_folio(vmf->page));
+	nr = 1 << order;
+
+	/*
+	 * Consider a per-cpu cache of src and dst pfns, but with
+	 * large number of cpus that might not scale well.
+	 */
+	args.start = ALIGN_DOWN(vmf->address, (1 << (PAGE_SHIFT + order)));
 	args.vma = vmf->vma;
-	args.start = vmf->address;
-	args.end = args.start + PAGE_SIZE;
-	args.src = &src_pfns;
-	args.dst = &dst_pfns;
+	args.end = args.start + (PAGE_SIZE << order);
+	args.src = kcalloc(nr, sizeof(*args.src), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(*args.dst), GFP_KERNEL);
 	args.pgmap_owner = dmirror->mdevice;
 	args.flags = dmirror_select_device(dmirror);
 	args.fault_page = vmf->page;
 
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
+
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
 
 	ret = dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
 	if (ret)
-		return ret;
+		goto err;
 	migrate_vma_pages(&args);
 	/*
 	 * No device finalize step is needed since
@@ -1434,7 +1640,10 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	 * invalidated the device page table.
 	 */
 	migrate_vma_finalize(&args);
-	return 0;
+err:
+	kfree(args.src);
+	kfree(args.dst);
+	return ret;
 }
 
 static const struct dev_pagemap_ops dmirror_devmem_ops = {
@@ -1465,7 +1674,7 @@ static int dmirror_device_init(struct dmirror_device *mdevice, int id)
 		return ret;
 
 	/* Build a list of free ZONE_DEVICE struct pages */
-	return dmirror_allocate_chunk(mdevice, NULL);
+	return dmirror_allocate_chunk(mdevice, NULL, false);
 }
 
 static void dmirror_device_remove(struct dmirror_device *mdevice)
-- 
2.49.0

