Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFA829C351
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585746; cv=fail; b=duY11FM7Q6Fw9Bk/whx9+eI7yBkWplV0wzLZbKMXgOqdUM0z2YGlxHyTd+iOWycNwPovkNfCZPUG4w1Nrgs3tZyjMY9ZneDh9qir7VWeYhFHtttBJOo4UGoJfNmQaNzBvjpwH1sJ95Z+PUQ++1JaTYkRBhEfKo76gnDj5majbds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585746; c=relaxed/simple;
	bh=lJjG7CAWyb7SxdIC8GxMwQwNVbcE53Jqg0gEI2SLcwo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GuBjMewMmF7h+nzdcTLwAlKyW4v0HNtRclfh+Bb8ARJhiscxChMahKwRhFpB1piZR9tp4Q8PEWikskwmYy6ha3mcDLen7zI2tV+YWU46R3HQK9ZbCyPzbxVixJx4II+wYZvKociv5fUFN2+WbNynDWS6Y4BLMg+0JajKfk/iJeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=leAQsgMS; arc=fail smtp.client-ip=40.107.244.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="leAQsgMS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWOIy61+jGnw7RPSoTrng1C/ZqbgaONS89XOAk31dwlzD00sbrrajgOhuTjYhwinS8vDxzbc1IPxSwLB/KxDrpil9MsEf/+u1/YJj30lNe9Jcrleer69uP/HGVxEf3ybtxJndWSvHSOs+J6PJPy69fHBe8nTtNzRfdK00pN5yIT0OyShp6nuDL+DYaRSLCU24xt0lbK1nFpioiwh4PZkLzhVDYP0BQ8mKlQueW6m9pf5w6rdyYquMjUVjPpHHDHQE9Kq7w/Lnl/qvW5lCvdgVHgV2+jTSs2SaRdLvAkWcKNZDefcj971H2fTk9PbzwIcgfGU733QrKh+zdPsaPRbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgZj37LALqowqhiwKm6Mb89FkFnK2QIYvZkGdPfHwfY=;
 b=lEUCo6yEYShJQwD/v0o6b1iEmas4mceiDgxchySXRNJtuJMf1+G3cqdX+k06YSyrQacrdeYnu4jTi7jjNEM9Cn4opMmPqXKnjLNvpwamXt72tvtM8yWrYJW3o8AONg9JYQBC2kKnZ4dlcvcEbVVvpTt8B3Hc2/x+yhjAiXPG9JRwssaKXyPHEQkSPOKyc1WKtXIBBphY/mUk3juLCN0TNMI07WEiL5EC8gksFSSJAulIel2Fm37r7gYIbP1ThMVDDMLHnhZ2FSmgwL+bGr4zWjvooXqppFybzWfeLdkJSr+ZmalaDoCI0ePQLIbv43jL525sykGmnKXygnudB3VWkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgZj37LALqowqhiwKm6Mb89FkFnK2QIYvZkGdPfHwfY=;
 b=leAQsgMS2pQx0BleQ4T/hkBZzM2hkO26+n8Ft1rceFLWswzvvt7N8HHo2JcRoW6w66sa1q2kMFEoUVDgFpQvyxLbE5E/aNsez9WmZUosKyeTkssyspMayZ0QViSEJeV/rdd/xRzvxaAU5+WsbiOwn8J+9UgN0pCcxL+oZ+xdzYiGa6mmFc9OwS6RHqhBB5LazwX5s0slTNRX3Yq9vJK4F2scVdmqoAcOx372gLgnMKIdzCliLOR5WtvHnOeKV5M6E1p4Bhvqm+MSaaLs/KLR3AlfvGhC8sYegqed1ge5BczDXLab/1YqaUT4YbVUEW7eqw3YeztNK157HiTG4ecDFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:35:42 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:35:41 +0000
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
Subject: [v1 resend 00/12] THP support for zone device page migration
Date: Fri,  4 Jul 2025 09:34:59 +1000
Message-ID: <20250703233511.2028395-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MEWP282CA0158.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1d7::7) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: f0bd3dac-9a22-4cab-72d5-08ddba8a5307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWQ1Nkw3U1ZzVlZBNDdBMytGeUc1bk1uWG1ncE5XL0RRSjRmLzByNnZXSnN2?=
 =?utf-8?B?U1FQWU44VWUzRUlSbFJPOS9NT2ZMQWhod3dMNFdDVThidDVzZnNoNzVHaktF?=
 =?utf-8?B?cDNHUWVBNi9GVmpQaVhKRG9hcnV2RnRPRjVmeHl6NmFib3FvdHB0WEY2cEx3?=
 =?utf-8?B?aGxmNHpIZEpvZExsS2ZwVXcreE1ZcjAxWFNJK0E4cEV0QXZzclNEMkxFZEtL?=
 =?utf-8?B?WXJOOFJJSjUyK1M4alEvSEEvNzQ5UFdVQk41VUg1ci9tc2c2ZVFZTlJHUWpR?=
 =?utf-8?B?Q3R3enBVendnaTl5KzU5RjFGQy9ISy9SbVpQeUQ2eTBka3NQRWkxZ2FNaHJx?=
 =?utf-8?B?Vk95dGg2WVZiaVpJNGZ1R2hkUytRc0dJZ3B2VjQzU2k1V0poOVdqdStmblli?=
 =?utf-8?B?b2ppM21kMGlXbWxScmo4Nzc4SjU5NHdvZnZMbGF2dkVINnMya3BnUWpRZEJX?=
 =?utf-8?B?dVJ6QVo3cnFxTFVEK0ZCbThTMnhuQWhyUTRpRHBrKzBIbXZNZFBkMnRDR29K?=
 =?utf-8?B?SkkweFNqV1diSVpWZW1CZlZqdDV2U1poS2lhRE4zTWRNUWlmYjc3OTJDNkF1?=
 =?utf-8?B?bVNZNFgvODlHMm0rSDJ1VHA0L1ZsQWpudFVNNy8ySzBHY0MrZ2tvTzNpbU5k?=
 =?utf-8?B?SExyVjBHd1Jhd1NRMG1XQWhZOVI5elRQVTkxRDlRK2VuVmNKOTdmdW85RU9P?=
 =?utf-8?B?UFdlTjNDbEJoYWxsSVJuMDJjZ2NsR2FiYlJQQ1I5WDRlZTM2dXZKWHIxTTBP?=
 =?utf-8?B?MksvQmJudFdxNFpya2poRnFpQ0cxQjVRSTFWckNDazRVM1hUUkI3UWJXT2Zq?=
 =?utf-8?B?a3JYelpTc3F2WWVZYWZMTXZQeStRdUtRdkIrcUlBOEwvVmphbkpseVRMQUdx?=
 =?utf-8?B?VjdpSDh3L3l5OWZYK2lqNFZuNjdBdWVQSUp3enhqeFljMXZUR1cyeHlPenF3?=
 =?utf-8?B?UktiY3M4SzBwYmtmT24rQWFYaFVUVWx0QjBnM3E2aGsxQnY5dFRyazg5Rnc3?=
 =?utf-8?B?Q3NwZk5iNTY3blBWbDBhWDZObVIrZTk3VHEzM2xjVXh4L3lzVnhOdHNLOWRw?=
 =?utf-8?B?NHMrUFVrb3VWS1FwamhDU3J0dWIrVXQ2ZjgzTEtZQk9YTTMxS1o5bEZGdVp4?=
 =?utf-8?B?N2s0b0VocGUxVUtUQ3YxZGdWWDlXc0FuK0Z5cUVGLzQyTDU3b0JYS1JlMUZ1?=
 =?utf-8?B?S3Q1d3FoSHd3NWdsNHNPZGZ3WU9pcXoxdzFRZ1dzcXdqWk9pMDgyamM3NVh5?=
 =?utf-8?B?Wm9CcjZlS00xVVU5clhtZmhHZ1JLVk1RTy9tMHF0eFBlREEycjk2bnBmN2lu?=
 =?utf-8?B?bEgzUjBoVlkrdkZnc3lXZWFsa3N1ZFo4VUs5ZlJnR2xYWWhiOGI1aEN6dGtP?=
 =?utf-8?B?WFE1TkZ2ei8zVnZJeGxzcUdZVUpjUXZPT1FBOVdhQUhsVzBjZGRBSHl4V0FP?=
 =?utf-8?B?RFR0SjhYQkxhcUdPV05tdkxodk9NUURwdjIzdktnN0RQUFZoWGgwWkRCd2lV?=
 =?utf-8?B?R21XcGYrbDIwVkhwTENrWkN0akc0YjZzS21IeUR1ajk2c0hIZmxjRWo1UzJG?=
 =?utf-8?B?VWtjMktaSkd2RGhXNnVSRFhhRGhMSWNMVENFYk8xekFGOVRsVzY5bkdrWjAr?=
 =?utf-8?B?Mm1hbFM1aFNrczROOTBYSThVbDdxUjAwcUloMlErWGVBODMxSXh4MGpCcXVN?=
 =?utf-8?B?QlVzNjY4MDZhYlI4enJkdG9ZOU5iVm5DM1B2dVl0NHBMS1NMbjIvWUNLb25W?=
 =?utf-8?B?dVRNOGFtS2ZHOWUzbnFkKy8yTUlhYVNpb2s2QTByemIrUVY5MFRxdGk4UVpV?=
 =?utf-8?B?czdiWDFvd2V0MVVkUmpIOGpaSG5naFF2aE8wRXFCcTlKcTZQWW9qWHovOWh3?=
 =?utf-8?B?RVpONW9QQ21CWVo4Sy9LMUFYNzh4TStKZWFBMUo0UUg5MkMvTjVHM3d0MDNN?=
 =?utf-8?Q?QFPrVIelrEc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3NjeTdXak9XYUd1SkFrVXVXTXdBclBuTWkyTTQ3Yml1K1BpZXFEd1ZBY1Rs?=
 =?utf-8?B?dTZ5TUJLRDhMMURNWlpNZzFqeVdkY3lOWng4eFBJYWxCeE96RFdPMHlibVNj?=
 =?utf-8?B?OTdORHhkRDhyV05DYXpHbTJnTklQYXllamJpendmNnc3TFFYSFpQQThYV0I4?=
 =?utf-8?B?bUUrQlNyZjBPT2VlMXJNTXA3UmJZdzBUUGlhUEFpR3ppQTkvMmJNL29GWUM4?=
 =?utf-8?B?Tkg4UEFiMTdJQnRTRXNwc2RLOENMTXVKbDViY0dEYTBtL1NRZWMrbUJBWlVG?=
 =?utf-8?B?TEkrTXFyeWtaUWJ0ZXdza2xqZ3h3MjhvTnZLSGZ1TmVUUnFlZk00bjVWT1hP?=
 =?utf-8?B?VlZBejNJYnVvS1pIRjdDRkdCWkY1cDdnVGZnU0w5VlVmZG0xZ3V2bjdFTXJM?=
 =?utf-8?B?c1dsRS9RK2VLV0h3TnQwRk1KMHQ1TzEzWFJ3RldibDEyaWxScTg3UzI1am9x?=
 =?utf-8?B?OVB5WVI2VGErMVFnQUtVMGxrQlZvYnkyWHFDQjk0djczOTFZd3dkczUxYmVz?=
 =?utf-8?B?YXpIWTJZdGg0U0NESmMycS9jNFBrNXdTYnMySkdRcWF2ZmFTdlpBanluTWFE?=
 =?utf-8?B?Y2hiZng1V2lzdGplSHFiNWFIbkNxaFR0QkN0ZVZRN1VVSHd0czJVdWNUY3Qx?=
 =?utf-8?B?bjVzV0tiYVRqekpHWWEwKyt0UkYxMkw0NllaT0l2MUdCS1NHTHNtSStZZzhh?=
 =?utf-8?B?M3BoMHplNFVqR2JnZE5VSzhjbk5CTFhySGRaL0lMSW83UnJxdUJEUFZjY2x0?=
 =?utf-8?B?VUJsMkVTMUlWa1dHaXR5N1RRWC9YVnpQRk1XQ2JMTTRyWVJxbWxBeWMwcHRo?=
 =?utf-8?B?amt2UnlKakNUSzY4cVVQbXBSTGpEUkVhcGpPRmNzZy9LeXowdnA5c2lqbFBZ?=
 =?utf-8?B?eEdzN1o2RFhTalpFS1dlTEJGNXF0OEdoTW81eDVVRGRLdnJYSGVJRjk0QUpU?=
 =?utf-8?B?YkVVaVpRNk9Kd1prRlEyTElZcWNFL21VT1diK3ZLYWlyaXU5OEJUdHdMZUMw?=
 =?utf-8?B?WVRlNHdYNi9VVUJOZWUvU0ZTQTYyelp4VmdhSXBHRDY5VVM2dkFhQ0o4ODBz?=
 =?utf-8?B?aGFhaEkyd0xWbzNEaG1sMGx4WnVJSys2VXRhbmZuYk5ETURXeDNOVUFYZkVB?=
 =?utf-8?B?cjF5a3V3V296c1FFOUVoZlhsM1Q1R3JCWmRIc2U1YXdQeGpqY2tSRHRja0dm?=
 =?utf-8?B?eGxNMEdrWExhSXlBc042SGl5Q0tFaWsxTHc4Y1h5d0dJT0RtbWdxbWVSb0E2?=
 =?utf-8?B?NmtOaWxta0c5dm9TK0VQb2JIYVdLVVlHUDlmNVVpeG14RStxZmFRMjFsRXdZ?=
 =?utf-8?B?ank3VERmajVHV2FEL0l6TTNOU2d1VW1jU2NhckZhNnpsKzA4UkQ3ZjcwcFVa?=
 =?utf-8?B?bEpHdHh2SEJFMjJ0aTAvb1FwZXpoZnBNWmRxUW5ENmpHV1UrQ1lRMkZHZlNL?=
 =?utf-8?B?NjgzUnpoL1dIaG5Sd0QwWTJlUVRwZmlhQnlzbkNGWXd0T21NMXhZTERVTnMw?=
 =?utf-8?B?MVZVZmIySmMva2xvbzJmZ2FCTUtBY2dhS1RQZlBOYlJzcnBWTmFpc1hTdUww?=
 =?utf-8?B?dzhmU2dRc05NbjhKcEIxYWpIdUJUVlQ5M3dQUUFyczlCMDBEZlFFbVcxOCti?=
 =?utf-8?B?N0hNTE5oYzQrbHp0V0hGZHRCb2NuY2lDYjlhRUlNb01GQ29pUnc3MjBndnA0?=
 =?utf-8?B?eG1iZjBldVY4b25nQ1VtanU3M3BhcWpmejFCcXNQUEtwZzJPOGJ1YWYreVdh?=
 =?utf-8?B?NGdhVkVja0pDeEJxaENBLzJFUnFXWm1LVkpuMFFPZXQ4QURVRGdjN0xxaU5m?=
 =?utf-8?B?TEQyU0VHWU9CS1FiOGFDaDZ3S3JsdmRTTXZiMFkzZlJJQWdFMzJBMS9FSDFo?=
 =?utf-8?B?aGJJZmRkR09Rc0s1ZHJVZUQzM0g5OTRNdFU3aHByc0JaTWlnbGF3V0hYVnJo?=
 =?utf-8?B?eW93eG8ydm9BelRRNFJ0U0pPQXAwTzFQZUVJT1lnTk5WUkd4SzA4Y2liVm5C?=
 =?utf-8?B?R2RPYkZ4WmV6NVZ1VmpPS2pqVnY4d05qdDVidEU5S3NveDJBZUhZMk1WUkRw?=
 =?utf-8?B?SUthbjNyM2ptRW54NjRvSVpuNXQ2aXFiRnNSanZHRFN2TG56RG0xZUxqeWlB?=
 =?utf-8?Q?ODFfDCSMl2S6Llky8Q0hUAYad?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bd3dac-9a22-4cab-72d5-08ddba8a5307
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:35:41.9086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJ88qxoX8s67sCJkvggpOLMkgtpuNhlj/YDVtMOfDBHl5JrvLxwNVAM4hruJrc3dtI8sjgJF/yh5K0gKAsdLgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459

This patch series adds support for THP migration of zone device pages.
To do so, the patches implement support for folio zone device pages
by adding support for setting up larger order pages.

These patches build on the earlier posts by Ralph Campbell [1]

Two new flags are added in vma_migration to select and mark compound pages.
migrate_vma_setup(), migrate_vma_pages() and migrate_vma_finalize()
support migration of these pages when MIGRATE_VMA_SELECT_COMPOUND
is passed in as arguments.

The series also adds zone device awareness to (m)THP pages along
with fault handling of large zone device private pages. page vma walk
and the rmap code is also zone device aware. Support has also been
added for folios that might need to be split in the middle
of migration (when the src and dst do not agree on
MIGRATE_PFN_COMPOUND), that occurs when src side of the migration can
migrate large pages, but the destination has not been able to allocate
large pages. The code supported and used folio_split() when migrating
THP pages, this is used when MIGRATE_VMA_SELECT_COMPOUND is not passed
as an argument to migrate_vma_setup().

The test infrastructure lib/test_hmm.c has been enhanced to support THP
migration. A new ioctl to emulate failure of large page allocations has
been added to test the folio split code path. hmm-tests.c has new test
cases for huge page migration and to test the folio split path. A new
throughput test has been added as well.

The nouveau dmem code has been enhanced to use the new THP migration
capability.

Feedback from the RFC [2]:

It was advised that prep_compound_page() not be exposed just for the purposes
of testing (test driver lib/test_hmm.c). Work arounds of copy and split the
folios did not work due to lock order dependency in the callback for
split folio.

mTHP support:

The patches hard code, HPAGE_PMD_NR in a few places, but the code has
been kept generic to support various order sizes. With additional
refactoring of the code support of different order sizes should be
possible.

The future plan is to post enhancements to support mTHP with a rough
design as follows:

1. Add the notion of allowable thp orders to the HMM based test driver
2. For non PMD based THP paths in migrate_device.c, check to see if
   a suitable order is found and supported by the driver
3. Iterate across orders to check the highest supported order for migration
4. Migrate and finalize

The mTHP patches can be built on top of this series, the key design elements
that need to be worked out are infrastructure and driver support for multiple
ordered pages and their migration.

References:
[1] https://lore.kernel.org/linux-mm/20201106005147.20113-1-rcampbell@nvidia.com/
[2] https://lore.kernel.org/linux-mm/20250306044239.3874247-3-balbirs@nvidia.com/T/

These patches are built on top of mm-unstable

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

Changelog v1:
- Changes from RFC [2], include support for handling fault_folio and using
  trylock in the fault path
- A new test case has been added to measure the throughput improvement
- General refactoring of code to keep up with the changes in mm
- New split folio callback when the entire split is complete/done. The
  callback is used to know when the head order needs to be reset.

Testing:
- Testing was done with ZONE_DEVICE private pages on an x86 VM
- Throughput showed upto 5x improvement with THP migration, system to device
  migration is slower due to the mirroring of data (see buffer->mirror)


Balbir Singh (12):
  mm/zone_device: support large zone device private folios
  mm/migrate_device: flags for selecting device private THP pages
  mm/thp: zone_device awareness in THP handling code
  mm/migrate_device: THP migration of zone device pages
  mm/memory/fault: add support for zone device THP fault handling
  lib/test_hmm: test cases and support for zone device private THP
  mm/memremap: add folio_split support
  mm/thp: add split during migration support
  lib/test_hmm: add test case for split pages
  selftests/mm/hmm-tests: new tests for zone device THP migration
  gpu/drm/nouveau: add THP migration support
  selftests/mm/hmm-tests: new throughput tests including THP

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 246 +++++++---
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 include/linux/huge_mm.h                |  18 +-
 include/linux/memremap.h               |  29 +-
 include/linux/migrate.h                |   2 +
 include/linux/mm.h                     |   1 +
 lib/test_hmm.c                         | 428 +++++++++++++----
 lib/test_hmm_uapi.h                    |   3 +
 mm/huge_memory.c                       | 261 ++++++++---
 mm/memory.c                            |   6 +-
 mm/memremap.c                          |  50 +-
 mm/migrate.c                           |   2 +
 mm/migrate_device.c                    | 488 +++++++++++++++++---
 mm/page_alloc.c                        |   1 +
 mm/page_vma_mapped.c                   |  10 +
 mm/pgtable-generic.c                   |   6 +
 mm/rmap.c                              |  19 +-
 tools/testing/selftests/mm/hmm-tests.c | 607 ++++++++++++++++++++++++-
 19 files changed, 1874 insertions(+), 312 deletions(-)

-- 
2.49.0

