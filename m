Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2047.outbound.protection.outlook.com [40.107.212.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FF333F6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 01:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751766444; cv=fail; b=CYbLTgfhlZ5kP5etuco71RlmJBmH8/70l5p59sV+CV19YK8mhOGlAse7AuOqc9CCmzX+VfpEaUpfQq4YEMP3xcugJk+BkmyMfcIdKWa08w7uTHDWwFd801kErhjQZqYmcIclO1LJV8z9Wau9KKeNVs8a1m4k/ij4Fy0HvX7wf0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751766444; c=relaxed/simple;
	bh=WIgnpGJ1aDYbmd1qeU1NOUek8WbOzbdH4R7E/51lA8M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GrnMYcdd/vY5UVBqc9GIg2fOj4K7dEfi3SsqWoxumfCBATq1t4Ps10eIRTdRj2EWlhBu9aC24Xk3aBfnrefixcfWpt0N27ZE1VUKf2ziLKe8zNDIwxkn60iuPzk3fPEgTtidkHOCwZoPC/qorp6EiMjp6fZF1TgJvUXel327okg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mHK2Nd1j; arc=fail smtp.client-ip=40.107.212.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mHK2Nd1j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZwN19U8kIy8JKuqrHqjVp7ELllOcS2ZMyZQG+vmgxg4YxSPX/s54rUnjfTFDTd5Cxk6HADNtYaVpV9pSEHdZb3x/4k7MpKWLGQI+ZkcOZR8oZLBmit81kxG7yKjgD4lRCi+nN1zwYOKMroNoDn0yJ+DEWLfKixOnSBU8q2qDZt643jCGSDUw0RuSj2yJalayzdkGJHzaLJn1zCI94IF52JKm03HRTn5j+oLI2ngFGApsAj/dEBnGoYKZgG7bypayn08Rcn4Yr+VTfUrc+s0vC2n3pqMyX1nbzM3Fuz9XQTPWWWbKebL71PF8k881j0KC3VfZyNgQveGDlQUqrwvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8SV/SwU5a1k9b6wJzZZHw+5rPnmyghfuvMkdJ3Ty/0=;
 b=X717cy6FnH+g+d4qc+swDIaE9pIpO5HfBSZRIjcD//3ugjMi3w4rIxEVXAd2d9BPRpKwgWXsurbQyCQusrvQDQ1sgSbm4itgtsxCziGvGhNvZc21wRPpjj6r80Gg6Wp/23P7xL3qqi0jAHRmDrsb/ZzVlLOAAh3gd9GPYrXKGslVAb4ZdU9ouFdZDP+EhEWdPqbswraQfM6Ng10A7Nkb7JPNTDZQJOi4YefuwnHve/EhccQ+Q/ZxtqvKbNGvitmf07TU4AbW2BSzBJm3DhVswrYG5COWCjOIirFOUL04i/yolB86w8XXFJfJQlfZWT3NPlbZU616C9jwvqVDpUXMXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8SV/SwU5a1k9b6wJzZZHw+5rPnmyghfuvMkdJ3Ty/0=;
 b=mHK2Nd1j6NO7ksD8MlcRl09niGYiR69//iiiZnx+W7sajB8aMdarrKys7XGsKUKmdx5cqBDdl/WslkwmefSGXSZGFF3cEa356CecN2Rf6I5T22a84GesfhvFVeg+10JeEBv2Kxph3GYQ1zTxrmGmIalph7L0pDcnPU9/cPb3Ey7IeW4NBJl55ep9YpjcRZG/p0uDjzS6uh3CWQb+tKcKVKaFJakjwyozWo4hMbf+YprzXa08mXcYqTh8zNVLBY95U5QSO2GONPC2t4YhuzfzgL//iUvUrX5oRekZq/IAOqc1GMs0MjISrCQYQBa0IeUZA93+8OTbtmubLUaEWp0I2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Sun, 6 Jul
 2025 01:47:16 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 01:47:16 +0000
Message-ID: <eab52820-813f-4137-b664-c79ba8b453b7@nvidia.com>
Date: Sun, 6 Jul 2025 11:47:10 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 08/12] mm/thp: add split during migration support
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-9-balbirs@nvidia.com>
 <D129A3F2-D79C-482E-BC70-A26C781B149E@nvidia.com>
 <1a451d37-56c3-4d60-8e06-3abae72e6bbd@nvidia.com>
 <007E2728-5BFC-40F9-8B8F-25504863D217@nvidia.com>
 <aa4f94a3-f601-4379-b6ca-4389421ccca4@nvidia.com>
 <906590D4-04E2-40CB-A853-25FE6212700C@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <906590D4-04E2-40CB-A853-25FE6212700C@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: c09b9499-90de-4ff3-3a6b-08ddbc2f094d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjNLaE83aXJWMHcvL21IVjF2NEd1SzNYdjlyTHhUMUEza0ZZMlM1T0ZkK2Ru?=
 =?utf-8?B?Y09sdEJOZ0h2eUdhS0tUYXdZTUN0Uk4yaGkyRXNObDVKbkxnR0pKWUwzaFJ3?=
 =?utf-8?B?eDNoVnVuVktSeW15MVU3VDVyc3ora2ZMM29pSWJFbDd2ZXZHZUh1Ti9uTUFY?=
 =?utf-8?B?WURGdjNTSXBNWlowQytBQzNTWEszbE9USGpuT0YrWWIwdE1KRmZwbWx6S2Yw?=
 =?utf-8?B?cm9naTJSQ3FRV1d5MitqZ21lSXRjOWNlSXU4TmZPcVNnSElyc21lKzVmcDBG?=
 =?utf-8?B?WUNpUXp6aUJROU84aXJLQTNIYUkwa1p3TEhWdHEyR09YRk1hcGd5QVF0RzNM?=
 =?utf-8?B?a2I3clB4NXdyTEoxemh1Zmk4Y2xmc1hXbExhcEpVLzBqcUZEaTdHZS8rS0w5?=
 =?utf-8?B?NDc3RnlzMlV5UllrMnc4OEhCVCt0cDdhVHhoc1hhSXF1Z3FsQU5LcXZIL3lC?=
 =?utf-8?B?QmpaMmlyWnd3bCt3aHFhSmUxTEEvSGtuRTVTbzlIWkxFSFlMUGhQRGsrUE9T?=
 =?utf-8?B?ME1Fa2lsUkhYY09xZklRNitmRU9TYVlxTGgraDN0SktwOFk1MDJ5MnRPdFc5?=
 =?utf-8?B?MWJHdk9Idk10bElQWUxyWitNcFNTeGNLNjczMm5qbmZHSXp5R1FURE1objE0?=
 =?utf-8?B?UkxxajJKdDJGZDMxQ0dhT0FidmthYXpOLzdKaUViSTJSOGE1bGd0K0t2bmVK?=
 =?utf-8?B?ZkxxTHNiOGFxajlzcUpSUzhJcnQzWU5SaUFaR2FVNVJhK0Z1bEx6Vk9jbGwv?=
 =?utf-8?B?OWJDNWxENldXaGYvbkUwMG9BSTNzcFEwazR5UlBPbWk0YnBLK1FRa0tmSytG?=
 =?utf-8?B?ZUF4YUl6WEM1bkk5eExwclF4OWx2aEhkdDFFRDdOQzAyM1YraHdCS2tzUURC?=
 =?utf-8?B?WDBBWVhMdEpISloybVBFVlBjT0R6VjFkLzVxZE1oTDlrUVZsUFhhYU4vTmZX?=
 =?utf-8?B?bTY4UmhWMVp5QVFCVDQyRmNtMDNlZ24vRnFjTHNqVzdoYmExb0hlYS9BUUZk?=
 =?utf-8?B?N1hWOWVoOEd5SmxJSm5PK3Uxd3hjYjFWK1NlRWNnUzJ6KzF0QnA1T2pTb2hi?=
 =?utf-8?B?YTVUdHNuckduaTNUOVB0QXpUaHVtWjh2WlN5eUVrUGdVbjQ5TWNWbEIrTUU3?=
 =?utf-8?B?UU5vZjNSVHJIQkRHVXlBVzJnZUFzUWFDbkI5Z25Na3EvY254blU4M2p0cUMx?=
 =?utf-8?B?OE5LSk1DN21PaWRZelMvSTdVTUQyc1JDZU9Vc241VHpLMnp2TXF0aGp4ZDJF?=
 =?utf-8?B?TmhpVXhjaGMwTHBwSGQweWN5L0t3TWdPdTNldXVsNlFJcVphdlhxRklSYmpw?=
 =?utf-8?B?UWZSRzJBVWVCYnVJT2xqV1E2TEN5WHV2eUlONEZNdkxkbzdJSW1mTkVKMWVq?=
 =?utf-8?B?VWMxUktXU0pIcFY2Wi84eFI5R3BSK21HYVI4MXNIS1pubzdQeCtlY0lrSTQ1?=
 =?utf-8?B?blpKOHRQN2orODZVQlc5aFdwSjZqRnlpWENFRlFoZXlQeVlSUC9DS3pMT3JM?=
 =?utf-8?B?Y3BRNDB6VTFQdUtqc3RISS9SNk1lb2xYNWdoN2lyMCs1SlFjdjdRamdWdW1C?=
 =?utf-8?B?TjI4RVJkT1pnbktSZG9xcUY2N3A4WWZUa2dJNGFDNFdOd1JzeHp1OTlDWnQ4?=
 =?utf-8?B?VjZUei9kTTY0cDd5ZHcwQVNHVVRmcTduM2tXSW5zSGhPQUdtZEZURkxwQXZW?=
 =?utf-8?B?clQycmVEU0NyVzY1UjVWSU5BWll4ZlhvdzF6d2dIK2lSY2VLY3RvM2xQRFNv?=
 =?utf-8?B?anpJS3NCZHJtR3lmV1dTSmltQWdFbGw5L2FFZTZQMW51T2Z0RThnQjNQcVlX?=
 =?utf-8?B?UE8xdE1iVWdtbzNzZVNhZUk3SXNDWWd3eGZLK0RPWi9WTGZ4bkYzSXZmQ3p5?=
 =?utf-8?B?TGNsV2xqSi9DeU01RGxnTThZZUUySlhqQVVPSVEvVlVrSkhRenFNQ0t2Vzd4?=
 =?utf-8?Q?gK187/ivFoA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3ViMmI0TVFlMzQ0OFFnZmJ1S0xGZVhPV1F3ZnRwci9JUVVBL2FERGFLcVlZ?=
 =?utf-8?B?OEN3WW12TTRzUGl6aUlKWXZaYXU1THB0cFR0SlV2Z2lURVkwQ3VPOG1jbXdw?=
 =?utf-8?B?aTNyUXprczNxRE9LcktvTi9URDNwdWEza2VHTjQzaFc5ekFZZi85ZnZuNFJl?=
 =?utf-8?B?NEZjZG5UZjBsM0gvanU0YUM5SnpEbVZHVEJ4SmttOGhuM3pUWUwwQ0VpeEw5?=
 =?utf-8?B?NktPMko0cjRrK1JPZlQ1MU5rbnFveXVJQkNJM2lLektNTHF0bUh4VzJTZTZW?=
 =?utf-8?B?Zm5UZkE2MnNJZVhtdkF5VGlvSEQxaW9mbWpuNm9lK0Z4VUs4Zm5aU1VoMDIr?=
 =?utf-8?B?bllRVGVzcjIvc2tSWVJVaDBhUUF6M1hhOFI2ZUtkaUFEQWRqcnNlOVNLK0lv?=
 =?utf-8?B?YTZ4SnN5b0ZXUURlV0ppN1hrNC81cjBwYlBUQ0FYTEVuK2ozb2lsVFY3WXhW?=
 =?utf-8?B?enYwTDhGQU9TakNNQzI1aEg1Nnd6Qlp0NUUwZ3B1MlpPV0ExRG1MRnFkN2d6?=
 =?utf-8?B?SlFmTXJCd3dZYTBpN2pFUEE2MUs5YXhhRjV6TUJlTmJMYytKd2pSejhHdGpU?=
 =?utf-8?B?Z3k2NmFpU3Jlcmg5VGdMaXZDbTBvWWp2bzFyNXhOeTBiN09RZnBWMSsxcFZj?=
 =?utf-8?B?Rkd4NTBNVG9hbEc4RWIvczRmYlVwT2pLWS9wdmUxTVNnbDNsZ2N6UzBzb0Vv?=
 =?utf-8?B?ZXVaU1ltUU1JMmxGcHZIUE9vSXFSemIzMmtmTHk0c1FEYll1cTBzaXRDVTM1?=
 =?utf-8?B?ZmtIRWFQOEhiWkttNThaU3VDRUFZWmNHd25HOERNaDhBbHJxWHpSa21aVm1u?=
 =?utf-8?B?VWk1cFl1SjdPcG5JZ1hYYUdxbWlNendWV0RLamVTQjJzM2Q1ZS91RDRCTXN4?=
 =?utf-8?B?MjVoMDdpdlQ1dE1LSGdwdHRXSE9lTjFIK1RScTY1M0JYbHdYVmZ0RThSeGEx?=
 =?utf-8?B?eEZESGNudVFVV1VWQW1CUUp2bDM2UFRUQnpEbUtoZy8vMndZS29BdTFtdzM5?=
 =?utf-8?B?c0E5aSswRDlONmo5RC8vcmpxaFF1V3cwcTREcmVqd2hVdFFpZEl3Z0l3blJH?=
 =?utf-8?B?VkQxSkpZaE4wemxvdnV0Zms1MVZCUHNTV0JORjNqdkhTTVByRDJOVXREbVpD?=
 =?utf-8?B?OG1rRTVlSGM2SXlycVd4UFFVTzZEUXB4VmZNTTlRRGpGbFhoejV0TG00RmJ0?=
 =?utf-8?B?VERiMW5IWHRRK0dBWDRNZXRVMDhEUytCOUNqYVJ1ZXFQcytDdU5yNlFlWVFw?=
 =?utf-8?B?YnRteHFEWUY3M2U5WGY5V24zYkcyblZMcUs5U3lBZlpnK21RWWR3TjFoK0RR?=
 =?utf-8?B?VnVrdnNaVGZLRWFlQ3ZrVmg1SW9QUjN5RktBSmVpaTlsQ3NUSmNQRW1PalFC?=
 =?utf-8?B?TVlYV1NhZ1B3YlVPRnJMVmpvNnF1dHVoMUgyZ3dUaU5kMmJacTcvQ25kVks0?=
 =?utf-8?B?bG9EQnVBVDQyMDFWaGZVd2tqMEpQT1FkTk16U3FpNE4ya3dRUVVkc0dXSjdE?=
 =?utf-8?B?TE5TUU8zYzF5RmNoZWlrejNFRXdmVlJkamtubXZvL3YvQ3dJSnVXaW9sMkhC?=
 =?utf-8?B?aXc1K2ZwTGpNS3I5VllGYURJR3Zkd25RNVA3ZVB1d2NzeG4xeGpEalozS0kr?=
 =?utf-8?B?eWp6eTRLODRlQVlzWmxjSitJOFBYRkRyNWtPOHJJTjBFSXU5TTFpOFJXcDN2?=
 =?utf-8?B?Ym13QnRtYWpmeWhub2VEVGlxWVdLdFhKREEzZWhtVUI4UjlzUm52WUcwdStx?=
 =?utf-8?B?Q25jQU9zdlhqT0xGb0RMTWZaSkpuektTdnA1RVoza1lmUHZ5eG1KcUNmUjRR?=
 =?utf-8?B?YUFXSVlvZkRZVHRPRy9tY0Fod2YrR1lxVEQxMWp3RFNvTjE2cnp4V0FYTzE1?=
 =?utf-8?B?dkpLQUJDSE1sa3lWdC9FMy9PeHEwdDVkVzJ1TU8vRm5zODA5YXdpa3Y2RzBU?=
 =?utf-8?B?RW1TcS9FRjc0UzNVTmNwKzJ3dU1CREdubUhWQ1lzMEZnVS9Bc2lLZElDZGhS?=
 =?utf-8?B?emI5NjdwNnAzQnJvVGVobTlxRUdOQ0JNVmdraXZ5L3ltaXRMNEYvSDJubjQv?=
 =?utf-8?B?ZVQ2SDhmdkRDN0traXNKMktnbjlWaVUzSyt6MnQwRFNEUXhsNWk3VitRN1Bl?=
 =?utf-8?Q?f/bXtmCTrYDkrFMzjWDrOeda/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09b9499-90de-4ff3-3a6b-08ddbc2f094d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 01:47:16.4408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Emlj/0n92m6A/adCkCLgTYPSTtrpF+4owjZfmZg8+jc/hZkkkdBZBiETa3euSVYRv5Ueyg+eDpkyj8PjCgJWEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005

On 7/6/25 11:34, Zi Yan wrote:
> On 5 Jul 2025, at 21:15, Balbir Singh wrote:
> 
>> On 7/5/25 11:55, Zi Yan wrote:
>>> On 4 Jul 2025, at 20:58, Balbir Singh wrote:
>>>
>>>> On 7/4/25 21:24, Zi Yan wrote:
>>>>>
>>>>> s/pages/folio
>>>>>
>>>>
>>>> Thanks, will make the changes
>>>>
>>>>> Why name it isolated if the folio is unmapped? Isolated folios often mean
>>>>> they are removed from LRU lists. isolated here causes confusion.
>>>>>
>>>>
>>>> Ack, will change the name
>>>>
>>>>
>>>>>>   *
>>>>>>   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
>>>>>>   * It is in charge of checking whether the split is supported or not and
>>>>>> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>>>>   */
>>>>>>  static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>  		struct page *split_at, struct page *lock_at,
>>>>>> -		struct list_head *list, bool uniform_split)
>>>>>> +		struct list_head *list, bool uniform_split, bool isolated)
>>>>>>  {
>>>>>>  	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>>>>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>>>> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>  		 * is taken to serialise against parallel split or collapse
>>>>>>  		 * operations.
>>>>>>  		 */
>>>>>> -		anon_vma = folio_get_anon_vma(folio);
>>>>>> -		if (!anon_vma) {
>>>>>> -			ret = -EBUSY;
>>>>>> -			goto out;
>>>>>> +		if (!isolated) {
>>>>>> +			anon_vma = folio_get_anon_vma(folio);
>>>>>> +			if (!anon_vma) {
>>>>>> +				ret = -EBUSY;
>>>>>> +				goto out;
>>>>>> +			}
>>>>>> +			anon_vma_lock_write(anon_vma);
>>>>>>  		}
>>>>>>  		end = -1;
>>>>>>  		mapping = NULL;
>>>>>> -		anon_vma_lock_write(anon_vma);
>>>>>>  	} else {
>>>>>>  		unsigned int min_order;
>>>>>>  		gfp_t gfp;
>>>>>> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>  		goto out_unlock;
>>>>>>  	}
>>>>>>
>>>>>> -	unmap_folio(folio);
>>>>>> +	if (!isolated)
>>>>>> +		unmap_folio(folio);
>>>>>>
>>>>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>>>>  	local_irq_disable();
>>>>>> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>
>>>>>>  		ret = __split_unmapped_folio(folio, new_order,
>>>>>>  				split_at, lock_at, list, end, &xas, mapping,
>>>>>> -				uniform_split);
>>>>>> +				uniform_split, isolated);
>>>>>>  	} else {
>>>>>>  		spin_unlock(&ds_queue->split_queue_lock);
>>>>>>  fail:
>>>>>>  		if (mapping)
>>>>>>  			xas_unlock(&xas);
>>>>>>  		local_irq_enable();
>>>>>> -		remap_page(folio, folio_nr_pages(folio), 0);
>>>>>> +		if (!isolated)
>>>>>> +			remap_page(folio, folio_nr_pages(folio), 0);
>>>>>>  		ret = -EAGAIN;
>>>>>>  	}
>>>>>
>>>>> These "isolated" special handlings does not look good, I wonder if there
>>>>> is a way of letting split code handle device private folios more gracefully.
>>>>> It also causes confusions, since why does "isolated/unmapped" folios
>>>>> not need to unmap_page(), remap_page(), or unlock?
>>>>>
>>>>>
>>>>
>>>> There are two reasons for going down the current code path
>>>
>>> After thinking more, I think adding isolated/unmapped is not the right
>>> way, since unmapped folio is a very generic concept. If you add it,
>>> one can easily misuse the folio split code by first unmapping a folio
>>> and trying to split it with unmapped = true. I do not think that is
>>> supported and your patch does not prevent that from happening in the future.
>>>
>>
>> I don't understand the misuse case you mention, I assume you mean someone can
>> get the usage wrong? The responsibility is on the caller to do the right thing
>> if calling the API with unmapped
> 
> Before your patch, there is no use case of splitting unmapped folios.
> Your patch only adds support for device private page split, not any unmapped
> folio split. So using a generic isolated/unmapped parameter is not OK.
> 

There is a use for splitting unmapped folios (see below)

>>
>>> You should teach different parts of folio split code path to handle
>>> device private folios properly. Details are below.
>>>
>>>>
>>>> 1. if the isolated check is not present, folio_get_anon_vma will fail and cause
>>>>    the split routine to return with -EBUSY
>>>
>>> You do something below instead.
>>>
>>> if (!anon_vma && !folio_is_device_private(folio)) {
>>> 	ret = -EBUSY;
>>> 	goto out;
>>> } else if (anon_vma) {
>>> 	anon_vma_lock_write(anon_vma);
>>> }
>>>
>>
>> folio_get_anon() cannot be called for unmapped folios. In our case the page has
>> already been unmapped. Is there a reason why you mix anon_vma_lock_write with
>> the check for device private folios?
> 
> Oh, I did not notice that anon_vma = folio_get_anon_vma(folio) is also
> in if (!isolated) branch. In that case, just do
> 
> if (folio_is_device_private(folio) {
> ...
> } else if (is_anon) {
> ...
> } else {
> ...
> }
> 
>>
>>> People can know device private folio split needs a special handling.
>>>
>>> BTW, why a device private folio can also be anonymous? Does it mean
>>> if a page cache folio is migrated to device private, kernel also
>>> sees it as both device private and file-backed?
>>>
>>
>> FYI: device private folios only work with anonymous private pages, hence
>> the name device private.
> 
> OK.
> 
>>
>>>
>>>> 2. Going through unmap_page(), remap_page() causes a full page table walk, which
>>>>    the migrate_device API has already just done as a part of the migration. The
>>>>    entries under consideration are already migration entries in this case.
>>>>    This is wasteful and in some case unexpected.
>>>
>>> unmap_folio() already adds TTU_SPLIT_HUGE_PMD to try to split
>>> PMD mapping, which you did in migrate_vma_split_pages(). You probably
>>> can teach either try_to_migrate() or try_to_unmap() to just split
>>> device private PMD mapping. Or if that is not preferred,
>>> you can simply call split_huge_pmd_address() when unmap_folio()
>>> sees a device private folio.
>>>
>>> For remap_page(), you can simply return for device private folios
>>> like it is currently doing for non anonymous folios.
>>>
>>
>> Doing a full rmap walk does not make sense with unmap_folio() and
>> remap_folio(), because
>>
>> 1. We need to do a page table walk/rmap walk again
>> 2. We'll need special handling of migration <-> migration entries
>>    in the rmap handling (set/remove migration ptes)
>> 3. In this context, the code is already in the middle of migration,
>>    so trying to do that again does not make sense.
> 
> Why doing split in the middle of migration? Existing split code
> assumes to-be-split folios are mapped.
> 
> What prevents doing split before migration?
> 

The code does do a split prior to migration if THP selection fails

Please see https://lore.kernel.org/lkml/20250703233511.2028395-5-balbirs@nvidia.com/
and the fallback part which calls split_folio()

But the case under consideration is special since the device needs to allocate
corresponding pfn's as well. The changelog mentions it:

"The common case that arises is that after setup, during migrate
the destination might not be able to allocate MIGRATE_PFN_COMPOUND
pages."

I can expand on it, because migrate_vma() is a multi-phase operation

1. migrate_vma_setup()
2. migrate_vma_pages()
3. migrate_vma_finalize()

It can so happen that when we get the destination pfn's allocated the destination
might not be able to allocate a large page, so we do the split in migrate_vma_pages().

The pages have been unmapped and collected in migrate_vma_setup()

The next patch in the series 9/12 (https://lore.kernel.org/lkml/20250703233511.2028395-10-balbirs@nvidia.com/)
tests the split and emulates a failure on the device side to allocate large pages
and tests it in 10/12 (https://lore.kernel.org/lkml/20250703233511.2028395-11-balbirs@nvidia.com/)


>>
>>
>>>
>>> For lru_add_split_folio(), you can skip it if a device private
>>> folio is seen.
>>>
>>> Last, for unlock part, why do you need to keep all after-split folios
>>> locked? It should be possible to just keep the to-be-migrated folio
>>> locked and unlock the rest for a later retry. But I could miss something
>>> since I am not familiar with device private migration code.
>>>
>>
>> Not sure I follow this comment
> 
> Because the patch is doing split in the middle of migration and existing
> split code never supports. My comment is based on the assumption that
> the split is done when a folio is mapped.
> 

Understood, hopefully I've explained the reason for the split in the middle
of migration

Thanks for the detailed review
Balbir
