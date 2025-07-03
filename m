Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1095823A9BD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751583670; cv=fail; b=ICKAzN7T+XI7VdWT+K6AiN4TMXxUTFmId/UG9RrVvbOUIbHczWtCmdMtcBgorqoPsDOtXz3nv6BFS1GsfTA5Ub7AnFIgsC4+UCS3Besy8KgEQEbJyhefDQx2ezK0WHa0iD7dyTZAeAO9xliEBBdrMlf0hE+3Ht3VKFm7qz+aycM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751583670; c=relaxed/simple;
	bh=lxlVpgzquOoN9BH8nZ4w/2gLjEeMu2C0qp6X5eCoSDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WHqb2NUrRtWIrgahqjZORgmRDBOV1Clc9hPWwCqj1NpXFwhIhtfZQ4W7dTQGHbs0yyELscK4eURLlQcfDE6dJqh2URu8hF+OYflagKk+HpLv3YvVd9v7JgGN5Dh0BHDpXNNqp1MMa6aWOi9j7EFeDY8Q7aHcPw829CdqVJhCQ+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F2QOQ4KS; arc=fail smtp.client-ip=40.107.95.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F2QOQ4KS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmLtyNFhwG3qIRraUplOxPcBRR41lLfxjgAsdodcVstIqU+42tzib1oFdsq+1CFM9Dq5oWJHCHLHE5x/lkP8B92jTlvpjF6gGuhd2R6cwOCq/fNpYqeAW10FEBoDTpkocG+w3G6pMXrWwMpB25okISROjIMS6t9kjlMnZ9F8CoBPMyClffW/7fBXWEDuBA0qlX3jgq5WpB4REcqwnMCcXQPGOkpZo4EoMz5e4grCOCmaYz0pHD26ilPa6e8yXSa1KMeBOm9htCGxXecWAGQ2YxJD8UNQXU4NqefhxeSYx+gpi13m2VT53MUPjc+mhlB7vGIyN2Cjfx5+8M1v1Ba/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKq3cfDog7hbBm3INqAD23otXOakGWcuYb+surIma4A=;
 b=LfBjtyWa8UEgdRjQ194FvpNMl1MiyXRLeLZe9UbMebkXeTOlpf2lUWli+IWQF690s4A348DR6XJL2uSwvoNzaAatp1zvlMQrLaT5/BWzh84h/L0DkWDapwKpN51+YW7s3PxEqZPH3TZfOeYY04fcDLztsHhYW3GsxpbWvEregS599uyOQEOOK5K60cTZyCA5p6MCa0wDH6P2Sk1ZzIqESs435yD2U/ndYXGvePuBvUQ0gSNrBlsHWNl189Zxo88urj3peg6Ft4AT8awEO1BMIR0fwWyul+DHSDywnWZwCmaF0mPabEUHGyoH3JfinQa7n51bjH73Ob1Q2rWMMNoywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKq3cfDog7hbBm3INqAD23otXOakGWcuYb+surIma4A=;
 b=F2QOQ4KSM0K4+m1JdNcB4poU+9TuXBGWr+8n7Eo/nbTyUaZbe/hQdovWiOn+zIUwO9y4DkluiA6rZ1Xo07jIcIczyyVscefwrKiMtTY7B6Ghy9mWAmg6rorUBaUVLwFECst/WibOHJ9zJCnWoB72UocL4RtXIDMVd2BLRFSuGsLY3eSJqJGfieFcLHVVtBMGt4dirkj1XhHvG3zRtG2Ro/VNnuYipfW+YrBHELD/j5tVZey8UmvI9FPpddjSn2v2NHiEuV9npIqZBYmK6abTySYWna8zK/nCPYPMopfBEwLm/FNi6plreF8NCCgdSGhPDjZAgnksoPAVHY3VN+CT9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ1PR12MB6338.namprd12.prod.outlook.com (2603:10b6:a03:455::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 23:01:02 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 23:01:02 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
Subject: Re: [v1 00/12] THP support for zone device page migration
Date: Thu, 03 Jul 2025 19:00:59 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <23F4206A-4D96-4357-8C81-C50A32420E9B@nvidia.com>
In-Reply-To: <20250703222759.1943776-1-balbirs@nvidia.com>
References: <20250703222759.1943776-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0386.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::31) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ1PR12MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 59706cf9-a8c8-46bd-a476-08ddba857b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wm9jampHc2IwQ3E2RGNqTTk0YUl4MXRRUUlucFpEQy9KMVN4WWs0V2xMN0Fa?=
 =?utf-8?B?KytOYWx6N2cwMXNVaThRMlFjRmhISFlIclZ1OENPcEdjNGYrcjdHZjBsc3pT?=
 =?utf-8?B?UHY0Ykp0NDhOOE1TV2FMb3N5V1d5eEN0b1BSVHR2UFJsMHJreFl4RVZuZjZo?=
 =?utf-8?B?YXhkeHpxWkFoczE0c0gxNDhPOU5OOGZvbnFSTDRBVExnOWJyTUZIT1lHbCt1?=
 =?utf-8?B?NUdSRXhjdHZnSzM0djNmbldnajVSTUZoZVRXNE5aNjVmWW9VdTlFY0JtNmsz?=
 =?utf-8?B?Z0c4UmQ4MVBNdVVmdlZKZFRRelErRHc4bElKcE55cmVYZUE1aHVRM29mQnJ3?=
 =?utf-8?B?YXlwWWlBMG5hS1dSYktDUFFKaFFnREEvdkNkT0NULzAzZS91Z3lFV2h6eUdY?=
 =?utf-8?B?Q1U5Q3I5enJpU2thRThWdjVHbUhWajNaT0VXUnQ1UUxiblVJSTNPN2xha1NC?=
 =?utf-8?B?MUQ4dHc0eXRRRVJ5WElnZFB1L25tdUo4aTNHMG56ZkVXMjg5QWJvejNvaXR4?=
 =?utf-8?B?N05zR3Y3dkEzZ0YyVmpqMFNRVzI5b0hsOU1mQVJGZTQ4ajU3cHZqa3BDbUVt?=
 =?utf-8?B?WlZkZ2FCZFVHOFNSYVJ5SkRiU1Z4OXdXMFBnUW01OGNEWnNxSW9pOGtkcFND?=
 =?utf-8?B?MW1DeDFkQ3JRMmNXWVR1YkhNOE0xUkFKWUpkS2ZZSHpEVzQrQzQ1RGx5aEhF?=
 =?utf-8?B?Z3BKc3J6Skt4L2czaThwbkNiTGUvczZocEFSWXJyV0lkODhjS2cxR3prMTBI?=
 =?utf-8?B?TktzQitROVRHWWx6RXZzT0Z3QTBmWHlTRE9iVG92bHNyRzBtWi9pZmJ5WHRp?=
 =?utf-8?B?djZ4S0ZZRU1uQWpWTFh5Y3J2WDFOY1ludzF4TWl1S2NaUk01MVVhbUhlWmlE?=
 =?utf-8?B?dDE1OElJaHNoa3hBZlluZW5tY2tjQWVrbCt0OTE4bGdoNHl0ZURiclJLek5K?=
 =?utf-8?B?WmF4QzB0dnZ0dkI1RHVCd2oyV1BBVXZYMDlHcy9UUiszVGxJbEFPZTk0SFV2?=
 =?utf-8?B?Ukovd3MrWUJYQkV6WHhxc1BBS1pvVGlxUnVOdEh4UFJtclNQMzhEeU1FZUJa?=
 =?utf-8?B?Ymx2QndlMllIbjB2VnVlZ2JuUG5jMFVjbndUUkZTcDI2Q3p2TFQxN2F6VTc4?=
 =?utf-8?B?S1Zoa21RU2ZYMHIyVHY2U2FZYjI5UGhDL2g5a25qdE9PaVA3anVWVzlrcFNu?=
 =?utf-8?B?MFdUNWtvbzhYY2hERUpJMk5vWHRrWXN6R2hDU0JNQXNXd3A5SDF4cE00QmNO?=
 =?utf-8?B?Sm9zam1tVkg5b1V4ZUZDVS91N2dHbXl4U096SVZjaHdHaWNnRGNscFRIVlox?=
 =?utf-8?B?N0VERldkRVVBeStYMFZmK3Z2N3JnT1MrNHpvZDJoeGYvdGNLbk1WSEViZlds?=
 =?utf-8?B?QWpWL3czdEVyREt0RDhIZktQY0xRSHkzYzFTVloyZUQ4VDFvTU1sNU04QTJN?=
 =?utf-8?B?QnN6YityUU84aFA5MzBxaU0yekxkNnJvM1dQVVUxUmJ4OU9LeWcvTWt6M3M4?=
 =?utf-8?B?bjNVZ0ZHUFh1L25Ma21BQWpOcW01TzNJeWlxSXBzQnZVajdjSmlKT0lESlpK?=
 =?utf-8?B?MGlEc3J3UVQrZm5RMS9FNzU5TUNRYklWSThNekhDd041TnY3V2U1bWJyQSta?=
 =?utf-8?B?a054U1VtbTBSK01aRnJTS2lya2lhR0RianR3R0hrU3kvdDhNeUlMMURGcm14?=
 =?utf-8?B?QUxiYmMyS1I3cm9OaVQxOHJEVlFZeC9EdWlUTy9YdkhQWHVLS3RDcVZUOFUy?=
 =?utf-8?B?c0NNNHZLK3orQkcyRzFra21mRW1GWDJ5YVdqSzdXMk9XOWN5KzE1WkFtZXVC?=
 =?utf-8?B?RzQzZzVvVGJ6OVZpTXhwUlhSSTNoRDBvL2M0Tmh4ZFo0N0k3Qkg4OGJpNWI0?=
 =?utf-8?B?bURtNGtmTUFid1dnOTFDNGpkV09WcjllQ2NaWGcxYnlDN2NZNllib2xNS2Jr?=
 =?utf-8?Q?Zir5lOt/knk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDFubzBCOE9RVjVXdVVRL0ZVTW1wUnRva3FQbVg3bkFrNGwzR28vQkxGZmZ0?=
 =?utf-8?B?VkRyaVkzQUJtTGJaZ1NHQXM1eXdVZStwZm4reEhsZXhZVHlPK1RlMzlCQWxT?=
 =?utf-8?B?N29yRFQxUHJqNVd1RllIa3k5M3cyNFZONkpHSWplSllsRG8xVFYvbU8ycmh3?=
 =?utf-8?B?a1A1NG5oN2Ira3BBbnJzMm13UExYN0FKNUNsek9YeW91aHFmUUxmNmtidndV?=
 =?utf-8?B?ZWYwUE9PRWk1WXhhY3l4Yy9CbWtQTTRiUzJMOVE5OWRnNW1TYTZTNkpYVVhT?=
 =?utf-8?B?elJHVmlaZHg4dHdsc3ZxR2xpTHRma05SR0kzS0JmbFVLcERSang2cU5xNVBn?=
 =?utf-8?B?V3NoM3JEY0JLeUlSTGtNOHVyV1BGTWhXd1hFbUxXcTRLU1EwMDJ4TXM1QkYv?=
 =?utf-8?B?UzhSWndOczNmZld5RFR2em95aEd5Z2IrUDJtTUVhNkx5Z2trd1JiSkw3OGta?=
 =?utf-8?B?RmtYOWg3c3NJNFR5UWs3VWswSCttcXUyeEdjdUZydHVMcVNkd1pnYXNZaGpN?=
 =?utf-8?B?RlI3RkhnQ3QwMjFnUFdMRW96NGJMbW1FaCtQc3c3UHk3Yjk0VDluKzA1ZGhi?=
 =?utf-8?B?SHgwZ01HS01CWUE1N21qZlNUOUY4MFJQN2sxK1NzVWpkeStqMzA4UURFMkxs?=
 =?utf-8?B?Q0wzRHR6YTRSS25tenh6K2VNcUxVN2ZwemZ1azhUbk9MdUI1YkRGSEFUYnRD?=
 =?utf-8?B?QWQ3RTVhUjZ5V3d0am1BRXNwSVdxcmIycTZmTFFablhOK3NWZnl6Q0cveXRW?=
 =?utf-8?B?UTdtajdxQTBRd1hscEJ2VUFmcTN4Nk01dzVxTjhUSWF6OTJJZEhDemo4aWxt?=
 =?utf-8?B?TEp5QVFqTGF2MktxWHE2aWY3YVd4d2pYaXUrYWR0UGdKMENOaU51SXlGTzhZ?=
 =?utf-8?B?RFB2TFpocnl4TmtHZk5JMEhnWTFScnN2cE1NenVVVG1KcWFKRW9UQWJpb3RI?=
 =?utf-8?B?MXBpWjc4Q24rNjRiZis4V2haZUp3blMwSkhuajBCYS8ydWlHdVBtUDhPajg1?=
 =?utf-8?B?OWRyTml4RHRjSjQxNnZ2c29tVTNiZkpxRmhiSGVlZk9XSHRqZHA1RmF5eHFD?=
 =?utf-8?B?UG5nL0Z6OXhXQVpTUUdpZWdOVFNZYU1SL3dQU2FBdFI2YUoxdloxN2NNVSts?=
 =?utf-8?B?SGswUUR6ZGtsdHZIcnJ4YmlSb0Y0QXRtenJyVjBRU2pMcnNxRitsNFVTVFVj?=
 =?utf-8?B?NGRzWWpadEJpRTM5MkR3d21XellpbUhVaFdSVnorQmxGcGhEZXNlU251a0Yz?=
 =?utf-8?B?ZzYxR0ZuaHlUamxuaEF1ZTR3aXBaMkdpd3haOFJ6VzNuZTNLUUJ0TlV2c3BN?=
 =?utf-8?B?cXhqTm5QMmFCdEpza1ZMVmxPcktMNVRDNzRPaEFObUl2cWZYL09RMDdBSUp0?=
 =?utf-8?B?aFlzNk1uTnJmdzQyK1ZLb1NSTHJneTBKYXRmNFpkNXN6U3ZnU3FaQlJTd3Bn?=
 =?utf-8?B?UFdTckNIVHh0allJNFZlK0JOQ3FqQmU5ZjlOZ2Z6RktjYzZaUUEzMThXRkJz?=
 =?utf-8?B?andYSG83SlI3aTB1QUVjVkxmVHBCUmo0K3hUOVdTOTBKRjNRWUxZc2pOa3Rj?=
 =?utf-8?B?YUJ5QnIvVG5pNDhLZWQ3d1JyRUpkdTdCdlZwS3hUeVRCcE9wdUh3ZHc0T2Z1?=
 =?utf-8?B?K3htMmZjN2VRR2ZycWgrSnUxMjZtbDhMMDZBVktSNU1mRlI0UzEyUzlaUDRB?=
 =?utf-8?B?dFBlb2FyRkh4VUxCS1A5WTIzQnNmMVdXdE9EZTJpY25IREdLK0JxTjFZMmF0?=
 =?utf-8?B?Y0tyaisrOHlENGVTeWt4eUdnYWE0Vy9LTVMrSHVJSTMrUlhRVWd3SDc1WnB6?=
 =?utf-8?B?aG04dEppUUpwc1R3RFpMTkJHRUY4YVNkeUZ3dUpZcDJ1ei9nZUM2djdsbyto?=
 =?utf-8?B?Vll2Q1BCVHI1TUlEWTN1YUUxeU5OK2pjUlkrT1ZZOFNTOUxML0R0YUNUK0hh?=
 =?utf-8?B?bGRBbFh5T29pWDRvbkszSkdvZHlFbUkyUGhUWnNNUjUybndXQitEaVBtM1dm?=
 =?utf-8?B?OWtWMWR3cTFwNXpkL2FLNDJpK05hSXh2ZmNoN2RjOS8rTmpsV0xhZTlXNzk1?=
 =?utf-8?B?dEtSbE93L2tmR3RBZFl6S3ZCUEFPWVBTWkRYSVZTLzUwUnhXR0VxVFYrU3Vm?=
 =?utf-8?Q?tou+wgV2xuC9HMAXwajt4GKTa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59706cf9-a8c8-46bd-a476-08ddba857b92
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:01:02.4409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4cEZLasRuBTOESEfmL8fEm73heUAndunw4jMdW1gndVsCB1v6KLnKvJKeC/sMNc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6338

On 3 Jul 2025, at 18:27, Balbir Singh wrote:

> This patch series adds support for THP migration of zone device pages.
> To do so, the patches implement support for folio zone device pages
> by adding support for setting up larger order pages.
>
> These patches build on the earlier posts by Ralph Campbell [1]
>
> Two new flags are added in vma_migration to select and mark compound page=
s.
> migrate_vma_setup(), migrate_vma_pages() and migrate_vma_finalize()
> support migration of these pages when MIGRATE_VMA_SELECT_COMPOUND
> is passed in as arguments.
>
> The series also adds zone device awareness to (m)THP pages along
> with fault handling of large zone device private pages. page vma walk
> and the rmap code is also zone device aware. Support has also been
> added for folios that might need to be split in the middle
> of migration (when the src and dst do not agree on
> MIGRATE_PFN_COMPOUND), that occurs when src side of the migration can
> migrate large pages, but the destination has not been able to allocate
> large pages. The code supported and used folio_split() when migrating
> THP pages, this is used when MIGRATE_VMA_SELECT_COMPOUND is not passed
> as an argument to migrate_vma_setup().
>
> The test infrastructure lib/test_hmm.c has been enhanced to support THP
> migration. A new ioctl to emulate failure of large page allocations has
> been added to test the folio split code path. hmm-tests.c has new test
> cases for huge page migration and to test the folio split path. A new
> throughput test has been added as well.
>
> The nouveau dmem code has been enhanced to use the new THP migration
> capability.
>
> Feedback from the RFC [2]:
>
> It was advised that prep_compound_page() not be exposed just for the purp=
oses
> of testing (test driver lib/test_hmm.c). Work arounds of copy and split t=
he
> folios did not work due to lock order dependency in the callback for
> split folio.
>
> mTHP support:
>
> The patches hard code, HPAGE_PMD_NR in a few places, but the code has
> been kept generic to support various order sizes. With additional
> refactoring of the code support of different order sizes should be
> possible.
>
> The future plan is to post enhancements to support mTHP with a rough
> design as follows:
>
> 1. Add the notion of allowable thp orders to the HMM based test driver
> 2. For non PMD based THP paths in migrate_device.c, check to see if
>    a suitable order is found and supported by the driver
> 3. Iterate across orders to check the highest supported order for migrati=
on
> 4. Migrate and finalize
>
> The mTHP patches can be built on top of this series, the key design eleme=
nts
> that need to be worked out are infrastructure and driver support for mult=
iple
> ordered pages and their migration.
>
> References:
> [1] https://lore.kernel.org/linux-mm/20201106005147.20113-1-rcampbell@nvi=
dia.com/
> [2] https://lore.kernel.org/linux-mm/20250306044239.3874247-3-balbirs@nvi=
dia.com/T/
>
> These patches are built on top of mm-unstable
>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: "J=C3=A9r=C3=B4me Glisse" <jglisse@redhat.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Jane Chu <jane.chu@oracle.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Donet Tom <donettom@linux.ibm.com>
>
> Changelog v1:
> - Changes from RFC [2], include support for handling fault_folio and usin=
g
>   trylock in the fault path
> - A new test case has been added to measure the throughput improvement
> - General refactoring of code to keep up with the changes in mm
> - New split folio callback when the entire split is complete/done. The
>   callback is used to know when the head order needs to be reset.
>
> Testing:
> - Testing was done with ZONE_DEVICE private pages on an x86 VM
> - Throughput showed upto 5x improvement with THP migration, system to dev=
ice
>   migration is slower due to the mirroring of data (see buffer->mirror)
>
> Balbir Singh (12):
>   mm/zone_device: support large zone device private folios
>   mm/migrate_device: flags for selecting device private THP pages
>   mm/thp: zone_device awareness in THP handling code
>   mm/migrate_device: THP migration of zone device pages
>   mm/memory/fault: Add support for zone device THP fault handling
>   lib/test_hmm: test cases and support for zone device private THP
>   mm/memremap: Add folio_split support
>   mm/thp: add split during migration support
>   lib/test_hmm: add test case for split pages
>   selftests/mm/hmm-tests: new tests for zone device THP migration
>   gpu/drm/nouveau: Add THP migration support
>   selftests/mm/hmm-tests: New throughput tests including THP
>
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 246 +++++---
>  drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
>  include/linux/huge_mm.h                |  18 +-
>  include/linux/memremap.h               |  29 +-
>  include/linux/migrate.h                |   2 +
>  include/linux/mm.h                     |   1 +
>  lib/test_hmm.c                         | 428 ++++++++++---
>  lib/test_hmm_uapi.h                    |   3 +
>  mm/huge_memory.c                       | 261 ++++++--
>  mm/memory.c                            |   6 +-
>  mm/memremap.c                          |  50 +-
>  mm/migrate.c                           |   2 +
>  mm/migrate_device.c                    | 488 ++++++++++++---
>  mm/page_alloc.c                        |   1 +
>  mm/page_vma_mapped.c                   |  10 +
>  mm/pgtable-generic.c                   |   6 +
>  mm/rmap.c                              |  19 +-
>  tools/testing/selftests/mm/hmm-tests.c | 805 ++++++++++++++++++++++++-
>  19 files changed, 2072 insertions(+), 312 deletions(-)
>

I only got the cover letter. Did you forget to send the actual patches?

Thanks.

Best Regards,
Yan, Zi
