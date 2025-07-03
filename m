Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E310A2D9499
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585781; cv=fail; b=DSjryPGM4FKqzhTVx1oFnaZH33XBZOXtD394LvevIucri+FATkr0XaR0tPUTpzFcHSJz9GotF2ub0caYmgfZrPjWbOXYuWVRi5fbs5WQu72FTQrFqsswC12smIlEn62QPUJ5dxURDjLBbLGzyyEbTqLsB1LrvtmqHNTrevX9ePw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585781; c=relaxed/simple;
	bh=DxJTGxOdWZn5vc0PtKGPn3L1todh6tYcSJVUKXvsAvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jiry6Wj/ngxMOOcUgMqHDrpqEeeHjnWT3mBQ5pUDqKkbgSlYh4euU8J5eJRF/gE/yTwfse89a6bPM2rKZUTu73ZqrHLIqNHJDtyI7YvVwLG4+t1IlaMDQxz31E8e3sb7EXYFIL9si0OrfkWhnFLQQfXLN16hLIpmv2+tmoIcZY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U9GxX4iI; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U9GxX4iI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJ44Yp5VAjgn0YtP3CuvHDmH2xqi12T/8QtSnlohZwRVF/zewxNDLlrWUuUkCir//NMWRaZpTAGzQ18dldI9zxs66SKdHvbIfMoMGVyn8U88voS7PCUa2lSaTi9l7fKdbXTmams2mtdenCc0IjS9Sy3lzlHk6yNHEeXteQ+tHSv8h1deuZ6Ss1QWkrqNe3Vy9/BqYCdAnQKYsHBxR7jILCWhWam6t89C/TRovk1yIZmRxNBgkjDeIj7pf+Ch2+jz59tW3SBKms3d+zRlNtRJxtGoAeLUfHgpFNgyB3NBhY1iTwZfpKRdVY0nYbeInHoR69tOwDqKm4mHuNmSsJKWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwK4H0VuKrbs+OKwoAOwACO8rZ4a87AESC6oG8OS87o=;
 b=AIn7HFftFjvT5glPaK9vwmt0/U8u5duQZW4FSrIb3sJ3H3tvqFYTLPB9dqp58si70W4p1rpxyV/Utrboht5+59Q2BzDTpLuavRwpJV+T0KLRqEfObmMP9WBYdXAEptlQXJm0BgMhj8JSla+Ij/+ZF1xJq1u+zpQhC8V1S/2/XurJ0meor0bItTFIcnHRNCjrw7N3+ECWXkU3cx2Yypll0i3lUP1gGx7eDPBspf96fh15KVw8UYLRQ3lVRhWIgrDYsdR84kH5Z/9guuUkYy9Zn6bZLncdW411wGEeP3186+Eb1+DBd3macguQGYPRI1yP8Ii+0/uieoPgSn9YOGZJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwK4H0VuKrbs+OKwoAOwACO8rZ4a87AESC6oG8OS87o=;
 b=U9GxX4iIdorp2EMpFa6LuTGidD90I8izDMDDx00nrM3FJWQ1aY6ikWlvXbCH6qzSpYUuAqTNaIDQ6vAd1yPky13Sjyt7aCRH+dXhk4JoBMfsTwOJlNUSYe0hZw2TFnr45MDjPNcJ12gbpXs8mac2JPm861VyXsxoFi/J2h0BbrL1iC6JPwlgHzrDQFtDKB9XTJepArcwSRW85ci5CBIBEsCpc94eqqaXIyFWlWkbWU/IkcmICswhpnDMYnCummSPggz93FQe5dDqXZ3U7muN1/DGlaZpYvYDmYY8aP4FM5PXN85F6ahfHel6NFX2fXkl/4DnodNwdcykivMlJUADnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:36:17 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:36:16 +0000
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
Subject: [v1 resend 09/12] lib/test_hmm: add test case for split pages
Date: Fri,  4 Jul 2025 09:35:08 +1000
Message-ID: <20250703233511.2028395-10-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 3777b5ef-c6d3-4f41-6cc1-08ddba8a67c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alFIa3JKUkpvUXVXdVFUN2ZoWWtwTkprNzRoTzRXMjcxWDdkSm02cU5BQnd5?=
 =?utf-8?B?THBWVUVxOXlvVlRqRy9QUGt2VzY0MkJNcjcwNE52dVVjN0M0UW9WVWRJZi96?=
 =?utf-8?B?TzNtcnJabjF2RVQzMi9GTUxwbzJkamg0bDVXWC9vUnZ3aTlJV0dGNlZzZkVq?=
 =?utf-8?B?VDNtTklPRXlxUmtWeXdselZTeFB4UUZUQ2JIZWk3ZU1tNTIxZTZncm9jOCts?=
 =?utf-8?B?Mi9ISkxpNFd0R2pWQWFBbFhYY3c2WnoyRjd5bFhuTHN0aDgyMldVYmFtZ21N?=
 =?utf-8?B?aUFsV1BJVU5id29TcGc5VjlleW9Xb3N6V29RUGZJTWgxMFk0cW1rbFJQcWd1?=
 =?utf-8?B?NVZqQnRqbFl5YTA5dDNiRVdiK2VVNEJMTmltRTI5emEzZkoyMzNLajFOS2xm?=
 =?utf-8?B?cjdOYmNnY1MxVnVXczl6bGhMSnBzVkJiVkNJS0ZRV3lMRTFGazdzUmRZOEpW?=
 =?utf-8?B?VGFicHI1SWpTTS9lYmlWa3hwaGZXR3NwaGJvdC9Ta211c0krZmpOMmhqT2JM?=
 =?utf-8?B?c3U1L2hkUlBML0lQNFJROHB5UmNlUE9LMWYvTlRaUmQvazBzdjBlY0tMOHhN?=
 =?utf-8?B?SHoyeVVEYjVBRThNNThtNjJnWVFMMW9mZC9qZ0tIY2RmUDZKdVZPT3hpb1Rv?=
 =?utf-8?B?NU0rTVlYZ1JncStyWkpoMFZqODhVbFJWYzNnOWFsYnNBbUNuWEJXT3krS1hv?=
 =?utf-8?B?SlB3MnlBdkdndXFPL2ZBU1BBdzQxNVI1Y3d1N1o4VCt3UGhKK2FDN3h3MTF5?=
 =?utf-8?B?Z2o2ei9GU1JSMlEwZ2lVNFdldG40djRlQXA5amxPR3F1ZVFnWmo4U0JRYWVZ?=
 =?utf-8?B?c3p0NkhVT2kySWUxUUFoTGxuNkN4dG5nRFZrUDRINTZqU0V6eUJ1UW44R3d3?=
 =?utf-8?B?L3o0SmhzNHh5ZTdjcXV4YkhCMHNEaDZCR3hJMVY4UDJmNFp2bHNvVExSZ05v?=
 =?utf-8?B?VEUxdFVJZnN4REVleDE4RkMydGUwc0pJY1cwR3ZXTDdHUnFacC9mbk1wMXhj?=
 =?utf-8?B?eUE2djQ4citiSHR2eUpsd3ZMaCtIZUdjamNCdGxpY2NEZDNuaHVFclFWYzRE?=
 =?utf-8?B?aE10U0hUbEg5SHdGYmFURWY2RjJuNVdzZm5JUGpRL084NjdrWmtVQWNGTXVo?=
 =?utf-8?B?cmhXLzlMZEl6dHR4UTczcmlzc1NoUFFmU3A0cCt5TG16KzczYXFPRTFqUGkw?=
 =?utf-8?B?R1ROUWo2bjd4Skd3Z015ZGpuSEpFRDkwYVo3T1JYWGNlYzlkL2xjTGhGU0xv?=
 =?utf-8?B?Z0t4cGFsaUlJQVVBTGc2cWxjRjFRQWp1VkdjWVNzMDQwbkU4UHV6dFUzSXlN?=
 =?utf-8?B?aUdaUHpUQzlhYXU1aGpwY3VramdTeWR4ckpLU2V6K3EwNkU1cG80aXB3enVJ?=
 =?utf-8?B?dGk1U25ybTlyZTBiem8vQy9RM1JNRkhmd240Y3p3RjVRaWE3UGxNbVZPRTZK?=
 =?utf-8?B?RXZZMHNPRGljZlo0VDIxYndOaWlJT0p4RnkvQ29aOTBINXVqcHM0ZWxTOFlh?=
 =?utf-8?B?c3hqNUR5ZEdwbzZ5OG5Tc0kxcWQzaW15M2lUQnRVb2ZTWE1wN1c0QUVJNEtL?=
 =?utf-8?B?NUVuQlNDTm1Rcy9IWjR5aytDalZjdkQ4MWZYeWJaT1Yxdkp4Ymo1NG1lS0hp?=
 =?utf-8?B?Ync5MGpXcy8ySU5kVnNFbXNuVXBTTzA1UkszWkd3TXdlSzRHdE9WUHVuVnhL?=
 =?utf-8?B?eC8vNUxmT2JLL3lRa1IyRDc0bXU3L21CQWFsV0ZwVmVEMC9MaHJic2IwejNu?=
 =?utf-8?B?TjF2a0t3QXVGQUdraFBieXVUQm15M21sNkFBWWh4dVM2THV2WFVwRytReFBn?=
 =?utf-8?B?Ylg4cFNpaHFmNnBXVGdCZk9XTy9QN2RsMXF1bUoxbGMzK0lVS2JrWkZoT1cv?=
 =?utf-8?B?czRIODhrQTlpYzdLQ2NZNXk2UFJzdzVkazJsaEdiTUNYT2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTNBOXdybER0WUFaK2hWVWxNN0dVTER0V3ZTbDlQenpEdVRqdW5LbkxscTM1?=
 =?utf-8?B?dWkxZG5Ec2F1dDRSWC9tanpkSVFCSHA4WFkrc1VDZVlYVWlqMHlkdVg2SytI?=
 =?utf-8?B?aW9SdmxEQy9PWDBvaUZHRVlienFTL0xEbVpEbmp0SzZ2aGJRUkx5MlhqVTFD?=
 =?utf-8?B?M05EVWZjKzRicEcrYVNCL1poNHg4VUYvRjVjcDBidEJOM2JXdHZyVnloU2ZG?=
 =?utf-8?B?MEFESTRsM3RjYUxKZWI5bnBvQi9RN24ySElqTDR5LzgxNDNmY1JyV3pENGR6?=
 =?utf-8?B?UmJnY01aMFJILytJdGV0SEpQRkNIdkt1WXFHeHRLejJ0enYwZkhSdW1Pd2Vn?=
 =?utf-8?B?QUVtUStoZlRadjdSeCtsQ1I4VG4rSnNqdmxBYStZUlhJSy9rZWJCWWpCZytm?=
 =?utf-8?B?aGtjLy9GQUgzZUozQ3JyTXVsNkYvUXNpTStIWnBDcFNKczJuZ25qSXdjS0s2?=
 =?utf-8?B?clNJZC9jVEJTZGpFbldJMmdJM1hUS3ZoZm9oYmFSY3dZSkt3eVNWbk9xdW1Z?=
 =?utf-8?B?dDhwT3Y2MXl5MmNIWjEySWlzbGtSYmI1YUJlLzNXSjQ3Z3Rza0JDNGRIU1kz?=
 =?utf-8?B?WXlrUDNPTTFYTVdKV2xERVR3QVZlbksxdDZSRjc2b1JVd3h5eEk4OFd4V1kr?=
 =?utf-8?B?aVc0WEY3MXVYMDJOR2owYzVqTk5SbURCR1NpREFTaDFpQUVZSEFsN3RvZDl5?=
 =?utf-8?B?cnBLZjVIKzRqLytFVFlJblJDcEVyOERoZnpWYWJOMzYxYVFMdW5DMGtsTmdD?=
 =?utf-8?B?bUlzcmlqYjlFZkFlZDZsNFlsNzc0cnlIYW9Laks5bmdIT1pack1wTE1vWERn?=
 =?utf-8?B?RTdrWDZKZHZjWG5SNGtlblQ3U3JNUkhYa2ZnQlVpYlRXZEZXREJmRnJWeVpq?=
 =?utf-8?B?ZUtJc1ZwNnVhKzdJVUdNR0liWG1rU2RqelNwOXp5RlZxOWdQeDl6N000OC93?=
 =?utf-8?B?WVRLNHF6Y0lOeHdmalNjWk5jMmkrSkpKOXFxNHhlUjRYUnNXdUZvKzBUcXdi?=
 =?utf-8?B?LzlESGdaQjAyVTRLbFE2UEs0Ky9ZVEErWC84WVZXMk52cmhZV1BvQ0RnbnJ2?=
 =?utf-8?B?NllCQzhRaUF3ZFVXMVJnVm9qV2F4QkMvQW93YnY5KzFKaS94T2VKRTFCeTFV?=
 =?utf-8?B?d2E4cy9scVc3NmcyNC9YTnFWQUU3ZExTT2RqTWFFUmFMY3J6YVVWTk9IWWxH?=
 =?utf-8?B?MW01Uk02UHFEMDgxMGtMNVJyTkExWmZmd1l4dlo2dWgyMGNiakJoTWFhNkty?=
 =?utf-8?B?ZDBpUTFNbGRrZ3NpbVJMMm1FU0Myd0xDVjhEb1Jta24zTkhDZ1RBN0J6QjRv?=
 =?utf-8?B?S090QzZLck55ZUg2M1NsWlFvdWtSL2xBMHNFTldWbCtRVi9VNlN4SlVmMW5a?=
 =?utf-8?B?eFl0ZnFDM3IyQ1R6WnBoeGppaEYreU1tN1ROV3dEVEpiTDc2cG42S2NhaGYx?=
 =?utf-8?B?WmYxRkpjR1NpRGQwdC8xTjBESTFFaGhIZkIzSXM2VHNVRFJSM2xiZEpJcy9L?=
 =?utf-8?B?VXJMUmlncWkzMkFvYndWUWdNWW9JdWRGZzdYaTFvRUcvNmZVcmhuemFZUURP?=
 =?utf-8?B?UXJycjV6SEJ0MXgwQjFvOE94N2FSVTRjQmtycXRmYzUrRGhNVjd5Y0JOVHRL?=
 =?utf-8?B?S3ZUL0ZCdVl1Q25WMStsMXdlQ09nZlV2Z2ZSOVVmK2pnYVkrNXFBTmdPYklG?=
 =?utf-8?B?V0grSkppcUljRFk1SkcvRGRaMnl5aVRoTkxoZE53d1gweXQyN25sRkw1TzRQ?=
 =?utf-8?B?YUowSEgveDNiakhBYXc4OHJjbklzaGRsQks2dWhIaTJJVklNcUpwWTJRRG82?=
 =?utf-8?B?dk5od044WlV6YThocXRCUHU3dXJ5OUVBZVRpOUU3QzlZaDFHbTFMRVFWSm9Z?=
 =?utf-8?B?NVEvZ3dpWkhxRVBQTWhyU1JpSG9YcEtGQXB0YWhqUXZnOEdnTjM4VHRMR1VJ?=
 =?utf-8?B?cmhsZVVSSnRPRDdYdFlQZGFpZXNORHg2TUEvSndIKzl3cW10a2pIVFptd0lM?=
 =?utf-8?B?SWgwdVBscGhOMnZzYVZrekVzRWNTelRiZjIvMG9MeGlPdjRhV0s5TEEvV0Iv?=
 =?utf-8?B?SUFkWUliaXdzNitxY3ZMd3Y3Qm5QYzRweWVzTm1IdkNVbFJTMnVHcDNTK2Vx?=
 =?utf-8?Q?LzjBLwK4FLgrkiY6JMCDupwSX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3777b5ef-c6d3-4f41-6cc1-08ddba8a67c5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:36:16.7375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNSVqVFUnxOnLxSY0AIetoRsAytDCGslqCBr/fAdSbq7X8vuAdLvQ2f1pAzCMiHHnTZJyB43C7jdLKupfUdYCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459

Add a new flag HMM_DMIRROR_FLAG_FAIL_ALLOC to emulate
failure of allocating a large page. This tests the code paths
involving split migration.

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
 lib/test_hmm.c      | 61 ++++++++++++++++++++++++++++++---------------
 lib/test_hmm_uapi.h |  3 +++
 2 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index e20021fb7c69..c322be89d54c 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -92,6 +92,7 @@ struct dmirror {
 	struct xarray			pt;
 	struct mmu_interval_notifier	notifier;
 	struct mutex			mutex;
+	__u64			flags;
 };
 
 /*
@@ -699,7 +700,12 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		     page_to_pfn(spage)))
 			goto next;
 
-		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			dpage = NULL;
+		} else
+			dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+
 		if (!dpage) {
 			struct folio *folio;
 			unsigned long i;
@@ -954,44 +960,55 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			goto next;
 		spage = BACKING_PAGE(spage);
 		order = folio_order(page_folio(spage));
-
 		if (order)
+			*dst = MIGRATE_PFN_COMPOUND;
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			*dst &= ~MIGRATE_PFN_COMPOUND;
+			dpage = NULL;
+		} else if (order) {
 			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
 						order, args->vma, addr), 0);
-		else
-			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-
-		/* Try with smaller pages if large allocation fails */
-		if (!dpage && order) {
+		} else {
 			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-			if (!dpage)
-				return VM_FAULT_OOM;
-			order = 0;
 		}
 
+		if (!dpage && !order)
+			return VM_FAULT_OOM;
+
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 				page_to_pfn(spage), page_to_pfn(dpage));
-		lock_page(dpage);
-		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
-		copy_highpage(dpage, spage);
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if (*src & MIGRATE_PFN_WRITE)
-			*dst |= MIGRATE_PFN_WRITE;
-		if (order)
-			*dst |= MIGRATE_PFN_COMPOUND;
+
+		if (dpage) {
+			lock_page(dpage);
+			*dst |= migrate_pfn(page_to_pfn(dpage));
+		}
 
 		for (i = 0; i < (1 << order); i++) {
 			struct page *src_page;
 			struct page *dst_page;
 
+			/* Try with smaller pages if large allocation fails */
+			if (!dpage && order) {
+				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+				lock_page(dpage);
+				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst_page = pfn_to_page(page_to_pfn(dpage));
+				dpage = NULL; /* For the next iteration */
+			} else {
+				dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+			}
+
 			src_page = pfn_to_page(page_to_pfn(spage) + i);
-			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
 
 			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			addr += PAGE_SIZE;
 			copy_highpage(dst_page, src_page);
 		}
 next:
-		addr += PAGE_SIZE << order;
 		src += 1 << order;
 		dst += 1 << order;
 	}
@@ -1509,6 +1526,10 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		dmirror_device_remove_chunks(dmirror->mdevice);
 		ret = 0;
 		break;
+	case HMM_DMIRROR_FLAGS:
+		dmirror->flags = cmd.npages;
+		ret = 0;
+		break;
 
 	default:
 		return -EINVAL;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 8c818a2cf4f6..f94c6d457338 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -37,6 +37,9 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_FLAGS		_IOWR('H', 0x08, struct hmm_dmirror_cmd)
+
+#define HMM_DMIRROR_FLAG_FAIL_ALLOC	(1ULL << 0)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
-- 
2.49.0

