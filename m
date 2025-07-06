Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFB511CA9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 01:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751765096; cv=fail; b=YV54BCgGI9804pfRzD/eBX8VdSRC3tngooMNwa7d5oVwgAVZsrp91bU10Fv3HV4QQazyDBpq/0nI7joAFP8/kqnjEA3sS5WkVJ5ESK6qkmVUJ1EciwnHNjlLXKYUpJyocDb1fpR6bj2j6h1hleH1Ym18pjEYxSekU0EjhfA0YBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751765096; c=relaxed/simple;
	bh=c7bIGKcLiBcHo9ZO0bV0tEriZ2nGYq9NfeVDnb7YxWo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oWw5TOoEtOUN33ujjChRt8nRUkUSQ2IPSNXJ4nhv0K8x+xWkUVORVy6xB2uSJRJCKEUc3ARcBqEkgWpzr2TbkUtWSAckLw7PLv0RunRL7VU8uJgY4dFN7m/vkRfr67L2/VgBlYsQ41nR+pctsu5knrqEw1gMU3UW28j49dcp7JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=POXau4qm; arc=fail smtp.client-ip=40.107.223.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="POXau4qm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnBUGH15PKN+Hi3kLrrS7aVA/VRZf/Zw2hgKpIPheF1YNuNiMcyAnHnfM9z3yI1KT1m/ZyDbdhLOjhm0d9HluYsXxZD9hn72rKS/DIx3ifjyStYn4qA+cRbdo6W57U6Ot4LVmU8MBQxqlxkMnnKpvM1bbxPo+wb8SoMvGnjBlip4HrpOI81SzQfWKBoqMglMeBntJRgzqhWc32bi8PQwpMaY2vve3mTA3pSvcGBR3mR2VPbRT/VEJa+ZMbYg8G7A8VcFgoHSZpbweJP2XtAMEn3SYRV1emv/DzqaNFeb5JNSxf09h8OSaBtPpZYGrSnkVsXAvTJpgOPQb3gEs92F/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s91K4Uf7lf6v9QxmWNn8c/hZum+XE4pdJH7YtxEkztw=;
 b=eF6GhDlhfhm/vOn9hoGE1zcpj+ZmKuwHXtttw81GKdq953LRv/i5w9knN7SHMGS/YYeobV5Wde961YcfNYyv8JMsaADvkmezII9EBrsSTE2dbsw2DjmgnBKnqcSyjDm71Wf2cx4yQNY+Uls7wP7F49Qd0vpWYgENBhEW4Yta0EoUgN0X49c8WdxviVb0COs1lmX1i4YkN6O5ZP7F80lGOrgb1M3sgOh405ZoXyAlbIlJ2Xy9GnZJBH5bM7xrY5y476gilJgP7Z5sL1IK3jdMTRoHJyJRt7U/i9+ccIS0jCx6uBg+Rnjc85I2d0I0z89w/rCT1gtHoC0WpkYCJTZC+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s91K4Uf7lf6v9QxmWNn8c/hZum+XE4pdJH7YtxEkztw=;
 b=POXau4qmXSLmfGAKsBI5xy5id0OaXKFV3aL5mFK6ntHXFhKCJLcl+X8B8m8C6ed2vUghGXhZFaIMAnIEamcPj+Fs3ptwW2W9HfAHdIepqTvLlIuLs3QRDlnMJXMw2YQffn8DqXGKn5GvX8OZFqKnlq65SFcoTQlx0T6WXX8zf1hy0xcP7QLhZdbbJQWcvGb/qKOMp0dTWI9kSxT28oPMdvqSJAKP6LfEfY4e1buic4wykDaAAyXY0r/m22vwZPJXVkq3dRdk0tJAFLMcnous1iwOI6LEWoyTVt43sXfs/+sJOea5/e1vsRZLwk7vGWm9T8XpjSJ85yvkxs7E6mxmpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB8226.namprd12.prod.outlook.com (2603:10b6:208:403::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Sun, 6 Jul
 2025 01:24:51 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 01:24:51 +0000
Message-ID: <b94efd84-cdd0-4c3e-966c-edf890616478@nvidia.com>
Date: Sun, 6 Jul 2025 11:24:45 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 07/12] mm/memremap: add folio_split support
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-8-balbirs@nvidia.com>
 <173510d4-61b5-42c0-97a4-0cce8081b40b@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <173510d4-61b5-42c0-97a4-0cce8081b40b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a333fa0-605e-4127-f007-08ddbc2be7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnZXL3k5TUpiclRWZ0NHUlR1ZXhJVk9NZ3c3Y0ZKa1VYMk53cjhYTm1PMEpM?=
 =?utf-8?B?eGVYa2VDa2paMUlJejdiNDN5VVNXZ0I4UTVlWkJMeTJMTjZqSHY2UnJ0QnNt?=
 =?utf-8?B?Ty91N0VoZjFrTGRZcko3V0Fxc0MreWc2YzhQT1dkcGdXdUxIMk5BVHRNdmht?=
 =?utf-8?B?d2tWS0FtYWtvZ2ZoVWxCclNEem1QYkNFakk4SC9zckZQWDg4MlNjZHZyVWxH?=
 =?utf-8?B?TThnSnY3QzdOYkNyczgyMVJvcHY3RU5OQVdqRkRZamhhWEVBYWNDbXVvNVVS?=
 =?utf-8?B?UnRRYzI2QUUyT3lmNU1LU05sK1RsN2RuamlGbFhodjE3N3FsUkxoOU1HSUVB?=
 =?utf-8?B?emkycWNXQWxsTWhKQ2NTR1JaMGxGcVAyaGtHVkJaWS9tTklpN3BuSUszOUpO?=
 =?utf-8?B?OWxHZW5FejJQb2czcGF1ek9xNnhMakRnMFlOUlJHK0ZYdy9IUFpqMFRrS1Fj?=
 =?utf-8?B?aDAxS1poSlZVRkduYmZ5alJVSlZOZ01nZ0JLb0RWSFNRbmpVQW5ZLy80NC9h?=
 =?utf-8?B?cVlPb1Y2eDJWQkt5UVlSSjVoc1hGQnBvWUdDRkwwVkgzOFRKQVc3V29ZaHE0?=
 =?utf-8?B?QURUK3Y2bldFM3UzNE15V1paT0xmYTB5OEc1SC9sbGl5cDhGRk14YVc1RlVD?=
 =?utf-8?B?WUtkd2MzS1RacnBxQjd3Z0l0ZGhaTnJTYUFkNnlYMEdjMlpOMTJlWkdEcndv?=
 =?utf-8?B?dHc5L2taV2FmbkZ0SnFGejNnc2lpekxya2dMajdRUUZKL0tTdXNta3lQVWZ1?=
 =?utf-8?B?TzRaQ1BBSURuTjl2MENyMThNU2tiL082aXF1Z1hXUnV1L3h1QmM3RjNFS0tq?=
 =?utf-8?B?RFZYcEF1MEZhVUs1SHZxU3gwZ2ozOW5vejBHVEVCK3BZUTRPaFBVWm8wbXFh?=
 =?utf-8?B?MU1YbnNOb2laMFNka0Z5Q2QxK2NTOEMrQWhoMkZsNnF2eHo3dDZQbE1wN1F5?=
 =?utf-8?B?dFRZN09Fb29YU1QremhvbG8xMEIvcm5qRUJZSTEvT2RibEh2bVYrbkc3M1Fy?=
 =?utf-8?B?ZG1QWnNFY0c3ZmZqWmw0aVM2UlJDaUJnNFUxZlF2elo5WW1sZUQ1bytQMUZo?=
 =?utf-8?B?cnI2azhmV3NwcDZHOS8vSG9SbUNwWXVOTFMxNHgrK0l6VU9SV21uQy9leTdB?=
 =?utf-8?B?SjRnZENJVmw0ZUFCSkRXWHEvbU13U08vZVlyRlV5TzFaL0x6UzBjbWtZMlg3?=
 =?utf-8?B?QkdQQ25qbEErb25qb2luS1g4d3Y1S2NqWUFHRHR4cFpaaGhqWk1CcHcydnpt?=
 =?utf-8?B?VGZyTFlMNjZRMVNVb1FzeENKdFpQdndyNlhhVytkcGtsMm9uRDRYb2Q2bDB6?=
 =?utf-8?B?VmI2RjI0dktGMHQ5aWQ1L0Y4OE50R1JraDBFL3JabTV2Uk5OTVdGYmhvUUdD?=
 =?utf-8?B?OTcvaVJtY3JQRUk1UVdoT1NkNUxLU3hKanlubHpvUFFsUVdQR1ZFbzRWRVZZ?=
 =?utf-8?B?dFc0K2gvL2s1U2l0SUtlZC9HWlRNYk9Nb3JZYkxHUVM0L2J4YkpPbjZRY1VF?=
 =?utf-8?B?QUZreGtZYk9tTGNjTGJJNGdoMnFtUU5CN21EeDUwS1lzVEZiZFpxQTB2TUdE?=
 =?utf-8?B?R3VlTXBLZXpva28xdGo4dkhzU2JCRGZLcXg5Vi9YOUlwUXFtZ1laaVVJdC9W?=
 =?utf-8?B?VjNIb0FYRERPOUhjdDFmdXgzTGh2Ly9hYnI4UjhSelBxdEZkRzlMbkhrcXk4?=
 =?utf-8?B?TjdTV3RyVTc5M2QyMWprb2dXVXZrRlN0cmlURG1GOWRCSUYrbW1jWkU4NVRw?=
 =?utf-8?B?STZaOHlHK0xwd1dFYWZzcEtDc3VjdStaRTRzL0tDaFBhbDVmZlQ2VFkzNFB3?=
 =?utf-8?B?L0ozcFYvWlhMeHkwbFRkTzlSRG81eW9tT1pjcWZsRVlQUHVBTmRkb1ZPWGdV?=
 =?utf-8?B?QjhPb2NpTzZKQUcra1YwV1hiSXptSHRCK1MxelNlbHVhdmtMOER0b1hjNi9l?=
 =?utf-8?Q?oqOf0XlD0F0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b211amR0RDVPdXgrNnVEZnFCWTRiYjNrZElQVVI1aUQ0Vk1MVDZpaVdUZktk?=
 =?utf-8?B?RHJPOUZsMTVSbk1TeVg3WDlMMmdVc1IvK0trVFBmQjZuREpGVkJuR1lCOG40?=
 =?utf-8?B?dHlQcnQvRUNrSWRSQ0xxQzZxZXdiQnZXU2VVZHpkSGxOVDVxd1FJS2t1VUpj?=
 =?utf-8?B?NlBIVm1zTlhtOE9uNWFzMGxzd1A4aDRvMnFoaE55QWJkL2x5aDBacDRWd0xi?=
 =?utf-8?B?emd2VTFrTFNqc1VNdTVqT0wwVzV4dnAyd1N0R3FmZUJTUGxRdGYrYUxEU29h?=
 =?utf-8?B?Yk1xOTdRaFRpemdFc1YzMHdHaHhkeVJYaUVaYzRxM1FPVUhrdUtyZHNqQlI3?=
 =?utf-8?B?Mk1sU3NzSGtEeVlYOVNMczkxNjQzMUtHcmplRnF6SEltWE5WVjV1L0xLVHdx?=
 =?utf-8?B?NU1PaThLbk93OS9tVGE3R1VxeWl5N0ZnMU1YR01UOWtmV3BGZ1dybnl5QmdL?=
 =?utf-8?B?WDRJVXRKNU9SelB4azRyQmsxNEs3WWp0bDBrYitHTVdWc3FKZXJ1OXJMVW83?=
 =?utf-8?B?aitoTytFaW4xdW1PeEg0QjNrU0pBZ3BEeXlxelduZmRnN3ljaUxkVGM1VjZv?=
 =?utf-8?B?eW9pTkVrTFJ0RzJmZ0hYVmQyenJUKzAxSE9VMENzaEEvc0RrSXZKRFlTWitN?=
 =?utf-8?B?a0doaXZnL014Y1RsUzU4Y3BJclE2ZEpXS3lxS2xOcE5VVC94N1p1R1JyTDRq?=
 =?utf-8?B?c1VsdG1seTZEWStKSjNLUWhSOVA4ZkJNR1NNdHo0QWF5MytRZEEyeHVGSjMx?=
 =?utf-8?B?YVUwcWJXdklNT1hZajc4VFRZb2hvMHRDMTNiazhSdjFMSXNPNytwUHZQK1NW?=
 =?utf-8?B?MmVxbWhkSnFLbE13SHVQQUQvRm03Wlp4b1cwTmk0S1FHaFI4Rk1MREZEZE41?=
 =?utf-8?B?SDdFUDYyL1pvbWhyVlhCS1BzRk85bEhERlVHWHhINTZqeWRPTDdSaUVEclB0?=
 =?utf-8?B?ZFRSbHBxa2ZiWmlaQ1NuZ3EycE11NzFEU3dJdkE1aWNKbVNBQ3p6c0NYdjNV?=
 =?utf-8?B?aHRXU3lqKzdscHF2bXRTS1ZVNDdzeTJ1Z3V2amlTQVUrZWJWZmtvUDNoUUE2?=
 =?utf-8?B?TW5ra2orV0FqL0FQNVYxdTRUWU9rWVpGZ3Q5Q0h2bWxuZVBUZi9tcnRyaUhQ?=
 =?utf-8?B?RVphMzVCc2lzQXQwSDl0aHVpa3ZwOSswNnRXTmMzbGw0aThhTU56TWc2bTFq?=
 =?utf-8?B?NVpmbWE0U1BJUEFETk1PM1htWHhGM3l3Z2xIK1pKUHp0OTNyelVQTVV3TXpa?=
 =?utf-8?B?Qms4Unh0SnFRTFJnUmE4RG5xTlZXZUFhK2l3VlFOUWpEbzcrUUtzbmZzMHB5?=
 =?utf-8?B?akFGTzNoSENkRmtUMEJRcnRLZDRRbktsZDdNTGk3MFBtOTByOFphZWVFOVh1?=
 =?utf-8?B?WURFUlNNWFY1MmI0YllzL0J1U08wNVVOM2FKd1ZYbTkrTWFFOVh3ZklrQ2lE?=
 =?utf-8?B?MHZEMnZzU1VjQjlIVU1janhCb2p2RTJxYSt0VU1UR0hXb3puT3VpVVRqOHpF?=
 =?utf-8?B?VjFjUXo1WDdnSG96VjJLS2QzOEllcjNvYjlOSXYyVVRlcHVHS2FwQnFtcW5x?=
 =?utf-8?B?NGx0QkYxU3o1QlZSVVI5dk9POGJpWm0rQWVwZ2lsRWFWVWN5bTBlL1IvM2hR?=
 =?utf-8?B?RjY2KzhYYXJjODE0dW5mQkNmN1l6bHl6cnB6QWYvbXhkQlgzck1FN3VPWVhh?=
 =?utf-8?B?R0JkcHl6MmJDNS9CUkRGbHQzRnRnT01sMGt6Nmt0emU5ZkF6eU1HdkFDYTht?=
 =?utf-8?B?bkYxb1docCtnZDFIbnNvVER6T1FmdHovQ3FjNFpSbVljMDZ4WTF5eWIwZVNM?=
 =?utf-8?B?Q3dIUXlXQitRQ2cxNzZiTmF0cG5ZQWxnQ1dNWDNJdkJuL25DcEFMU2xMYmxi?=
 =?utf-8?B?VUhYeG5Hc28yUHJrdDdDZjFIWk81N2xwSEhnaGJLZFBLcEhRUDRCVnV5WVRN?=
 =?utf-8?B?WWluTGdtUEplSmFBYzV5YkVzWER1NVJZNURJQit2RkoyN0FvbDhkcFlPN2Fo?=
 =?utf-8?B?MkVEODdhWjhESzB4NEJqUm1BSzZVNHVJN1g5cXY3eDlzU2hUeGxRNzhpOTJ3?=
 =?utf-8?B?N2hQQThXR1VHdTI0NHRicEg2Q2UvODFGdmY5VzVVdFI1M3hzQzhReWNJa2w4?=
 =?utf-8?Q?REXFZs3A/pkd1y0SFIxvj6JMu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a333fa0-605e-4127-f007-08ddbc2be7ab
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 01:24:51.4665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYAG6KJxHl9wCsx67HfAHAFThMQELTnmL3PBmILGOcU+naHu0qoTUdKafclmPavn2fF+NxkCzniHoj3AfkKsog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8226

On 7/4/25 21:14, Mika Penttilä wrote:
> 
> On 7/4/25 02:35, Balbir Singh wrote:
>>  
>> +			if (folio_is_device_private(origin_folio) &&
>> +					origin_folio->pgmap->ops->folio_split)
>> +				origin_folio->pgmap->ops->folio_split(
>> +					origin_folio, release);
> 
> Should folio split fail if pgmap->ops->folio_split() is not defined? If not then at least the >pgmap pointer copy should be in the common code.
> 

We could change the code can check ->folio_split callback is not NULL when MIGRATE_VMA_SELECT_COMPOUND is used and cause migrate_vma to fail

Providing a default implementation might surprise drivers about the split

Balbir Singh

