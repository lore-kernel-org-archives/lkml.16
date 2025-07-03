Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EE82D46C3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585769; cv=fail; b=B/YLImXelIy2pQSYs+E2Hnq6tQQtq3kEIK8K+IGoPCtza+0h8rI7fbm2jwngJjapITGhRkB49oT1b1Kzvo9k8qFc2o9bZo5aOGGNQgCRM8aEAv+BKKS5UBFU20r5fwWN8dK899AHKmbPt8y3gfvwmvP42w0ore9iPK17uM2+bA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585769; c=relaxed/simple;
	bh=zxKFmHAVihPo4jmJWK3ywFBFjzZCYN3MYsUxoovxqh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V8Q8Z1a0y0zVm3UoETYRaozAV/I6rdjky0ENkkwoX1PsZQdD1es0bwCnXfFN/e78qpTUgK+mmzUyyh19HAB8dbHtPW+XuW9oCXcxgMDRmEMgwmatHDkQujJ3vY3o2MFgarEyEsRqbsPjSIfy++Ridtjr7fPJHwyBUu78qsrU2ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WuuzOMs8; arc=fail smtp.client-ip=40.107.243.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WuuzOMs8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzTdzPLddK1YsyO8rskRNs5EGftr8ZDskWXD1bpJxlFnh/vlxhrQRXHWDIpB9G7m8/eIO7SwwNrJCrEROlGQmM5dzWoVKtaE85fjdKoCBhh1Eoc8z3jpqYQoosiv4M7ZNNWGRiER/AouhznqCeGGwj5kRDasHXnmsRzhAf1KZtLQ3e2AAK5kAHLKtOC/Cy914gJDFYnh5mwzNUT/qhqa/ryI/6za9OYK6Ye4Vm5dNGPKwKyxwdSUSkqj26vaDaobyycPkSTSlb8motWu4tBELAZNY47tNvOsuEU+eVPOArZJxI5Rdn0TUTTCb9NyX3w8WIaYz0unjHJAwN/dX2B0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WWYvyIEWMzf+qtSCOP0Uk2KApUQV9R6MN6/T5lDjzs=;
 b=X1bZhaaBG7IR0RYd/N1hhL7CqZbLXakW4mZznhaso5NRbSxmM8gApzsdbq6Lyqv0dg+NG7njKATHefyJ6XmehnABCt3AkbqHe0Gy5XNp783P38SD3vb1y22Bx8JVrSDOpu9WfIfGicB2hGoBHID7eg/0ruDs7WqvpL8UuGYJNNS/6Xv9u0gO/PmcTXp21bdxlq58wrx7A4DQk+j7YcdZIt64XvnSZpfguy42a5ZKUH0bbhxF4vWZEHamyaNpLVqZzhM7sYl2DJbYN6tQLNHGpz1JzQppx7932pHCoJxMZORCOizqedLnVlE9OHqLWty9ao9SMUgBNf9nLsm5/NdxGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WWYvyIEWMzf+qtSCOP0Uk2KApUQV9R6MN6/T5lDjzs=;
 b=WuuzOMs8RvJFXZUjZoq4D/vkK74/4RKUXxsv1A+a4kefcjm/i6Jj4aFQ/s6nqd0NEeATJTjcV9/tCOwmA9ovOzflbGDgcc9Ot9kp+YQHysY6vtApKXcEB/Eor4Ke4+m+EzQ0FT5BrdmAaAULEMLNc0JMs0IVFAzV5gp3ERQ3YYsDY4qwx4XmYbcW3RZ7gY/a1nrD2/TO00gI0kb2xpZpnQR4DJi+9K2sDHM7008QI3c8jomDF+VmSwugEe/gEeENhgWG/w04f6AsmDaiE9aPYaHdzAp8m0BmPjdayiLXosOxNcaiOJ1muk70SnqYL3JMuGhqBxr/5AmJJEFu0r2O0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:36:02 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:36:02 +0000
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
Subject: [v1 resend 05/12] mm/memory/fault: add support for zone device THP fault handling
Date: Fri,  4 Jul 2025 09:35:04 +1000
Message-ID: <20250703233511.2028395-6-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:806:24::22) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ea12df-8de2-4365-0388-08ddba8a5f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUFCVGdPZTFuckUycDlSRFJyQUcyREFMdTF4My9lamxWbWM4YTNaUVByQmF1?=
 =?utf-8?B?cnFlQnI1TUhib0FVdlRoQlduTTZZY3ZnMCs0bDRwRkZ4eWdrZ28wSmhQNVRZ?=
 =?utf-8?B?VmhGSjJTZUxjMXVjekM0VFArYTltSlpwOG9NdDVsbU4vTC9YWmN5SVFhblZt?=
 =?utf-8?B?Q3IyVXU5bVBQWGpERmpQSFBIYWFzdDZuTFdSdjdJRGROZjZDVlBpblV4dHp1?=
 =?utf-8?B?TWxKOS9TdzVDaldxYWVWVUJwMlZDSndzUW1hT1JYeEdadjBMbzRRM1hCYVQ1?=
 =?utf-8?B?aDhTbE9GbXRSRC9IS3FyZXhpYU9kd21rT0RIT3hSWDRkK1k0TVh4eTNZemJL?=
 =?utf-8?B?aUdla0tRRVZ0UVdtaU9nZFhWNk94UEd3d3lLb25OYkpRR3Vud0pKSmdYU1NL?=
 =?utf-8?B?QldKOFh1aVZZL0gzWGZGeEZwbzNtK3pIcEdHTnRjc3JZQXh4MnloenNuOUpa?=
 =?utf-8?B?cWlldzNXOEZvMFRsWEhoeWlTTDZXMkp6VUo1S1FEUzJUb21ianFzMjVUTXNr?=
 =?utf-8?B?T0tLT2NaMEpUUWl3Z0w2b2hvc2xYWVgxc09Bd2hmYWRtRFRYQnVLS0NqWTNM?=
 =?utf-8?B?N1V0b1hVUmdEZ250SHFZMEJUL056U3BxZ3B3ZGN4OEprSldoQVlJQmtLUTVQ?=
 =?utf-8?B?cFFGM05EMXhWak02TlVoS0M5d3ovdldZd200Y0NiWjJBWEk5NUxXRStRRjRD?=
 =?utf-8?B?ZWZDNWRCelg2Z2l1OGxYRHFSNDRnRUJ3SWk0TlhRYWNpMElwOFQ3TFFHRE01?=
 =?utf-8?B?MzhDcllkTFd3eDh0Z1UybTFlaGdiWmEyQ1dkZ0dQalRqT1BZSzkvN2pYQllQ?=
 =?utf-8?B?TENIQVBMellYM1J1ZEZIQ25PeFFMNnJ6MnZUWjVxSHMvY1RoOTk0N21QSnNV?=
 =?utf-8?B?eEtYTjFOZ0t0SzJtbjhKZSszd3ZYODlJMTc5V3haVXkveXREL0VIQU9jeitB?=
 =?utf-8?B?M2RtSldDQ3JiNUFOaXp5TzNLVm5JVEtIZGtBOFMyeU5SSjVXK2tuSVRGMXRD?=
 =?utf-8?B?SEpZVGhBYkFXMzVNdVQrTWRCQi9qZVQrRGY0RkZ2SzdOYlBxTzc0cGtuL2pU?=
 =?utf-8?B?N0hVT1NMS3pNL0dhNlA2RzhpWnRMN2E0Y0svQmo3M0wwa1JxNUgvTlFUdTFE?=
 =?utf-8?B?anA5MWU4MktJbWhsQldkUi9LdUxMWDZDTGJmc050Mytldy9WMm5Nc0E1SE9S?=
 =?utf-8?B?VTc4VS9uT0s3VDZVM3pmallSZDU3V2tiTU1lSUtIdkYzTldQK2dvbjFYWi90?=
 =?utf-8?B?RjRTdmJoR0M5SHBqdU0rWmNCRS9Ec0hoY3cxR01Pa1Q4Vk5kSDcrRnk1T0JS?=
 =?utf-8?B?VGFuSVVFd1ZtK0hxVnB6WDJTODdqMktlZFdVZFkzcjRTeUE2WVFseXQwN0lz?=
 =?utf-8?B?QSsyMzJuU1V3bGxXaUFuL1lIcHluaWdPZ0lJOGRmNEt2VXRxbDQ5eGxWZ1dj?=
 =?utf-8?B?amlZS2xoaEhlaGZXNWNITm85QlpMTVV5SnZtWW1SbmI3c01BSkpZWlh1RGVT?=
 =?utf-8?B?b2o5YjFHYXA5VjhmZjZSd1FkdU5CTHY1dFhtZDhlRlJaTlREdTRaOTFwZDl0?=
 =?utf-8?B?UkQxM3lrcVVUd0dLU3hSNTFya2ZlMVVIeENxQjRqdFNsNkpjb0piNVZLUE5Y?=
 =?utf-8?B?RGpPeXVlNlZkYm4wVHRxa2p4OEpPTWtwMW1QMnRPaTBJdm9jK2VsZFRwU21Q?=
 =?utf-8?B?UklZN28vS1VDSklEeXNqOUQ2MTEzTnoyeWNtak1RV01RSVJTK3Y4ajkyZHVT?=
 =?utf-8?B?b1ZWWllWc1loVlRGWkgrcjR2dTU5ajQyVnE1ZGRPR2JEMi9VVjJkMlRxdStJ?=
 =?utf-8?B?T0JCS25WTHpLL3J3M1F3dUtYdnpNU2VlZ3lnVHZwZTA2dE9Oa0ZmZnV1a1Fu?=
 =?utf-8?B?enVEYy9aOWdQVmFGRVY0dzEvSGJVWU1LelkrclVka3lMcmhEUks1MjlzOFRV?=
 =?utf-8?Q?aQ7dgg3Qn84=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnlkQ0t0UlN2R2Q3aWQzVGxmb1JaMVBXVSttczd1bzVxR3NrVXFJUGFhTS81?=
 =?utf-8?B?U1VDc2VEd2VWb281NHZlaEhGa2ZxdjlLZmFzWWNqcnFySVY4WTRqSXdOL21L?=
 =?utf-8?B?a1BQR3lkelNxNVhHZE1HOVRFa0NvOWZTejVMc1EwV3J2c2s2bEZwdHVNa3FS?=
 =?utf-8?B?dHAzdy82WTZRQ1hpTWdKbUFtZFFRVzZOWEx1NmJvNGVvTC95QWVxT0ExMDkx?=
 =?utf-8?B?NE5Lc2lycng4WHNCeHMrdStOMGtIQTlLdXJHTjVDNkU2YnFvZUhJZXl5NmVT?=
 =?utf-8?B?dFUraFdiOUtKWDMzMGgzbWE2TWlLa2FEMkN2c1JLcTRzcDdpKzE2NWFFQ3Na?=
 =?utf-8?B?bE0wdE0vOUtWeGNKcjhzOFYvc1h3MmNhZ0R2NlBUb3p2UFdXcHlYdHl1bEEw?=
 =?utf-8?B?eE9zQkZEajhRSVhXVnRhUTA2V091a20wR29xRHU2dTZGNkNTY2duZGt3M096?=
 =?utf-8?B?dU5JRWNXZzJNQ2xYcTBXWkI5WUEwR0ltV09WTElDYmVDZGpJUzc3dWVhaUR4?=
 =?utf-8?B?ZVRSNXErUUowdHFqYzdmeDNWWmVQZHUvM1kzVUxKWjZkOUt5NzRSb0lOMllO?=
 =?utf-8?B?VTVUN1UzaVlFVmRyYitxNDJ6U3ZkR2p0dEZTTUJCeHhoZUZ3L1pGcktqMDhO?=
 =?utf-8?B?U1RTWlBCeDIzbG5WdHVxa0hUOFBJNTI4WUwweE14SXhzZ3E5blpEa2hGdUVU?=
 =?utf-8?B?SDgvTVI0eGVUelVXVFJia0tIZnR1WS9jSkIwaFVhb1N0UEZFc21aQ1I0UllO?=
 =?utf-8?B?NUMxd2M0MXJUcDRDWjJLVno0cnhUWDdxczdBenA3M0lSSkl5TnFOSjdzd0sw?=
 =?utf-8?B?U20wOUV6VkxrU3VrYjhqZWZGektoWlVyK0NyS25MTUJ5eFZUdmVuVG5Odlk2?=
 =?utf-8?B?cUtvaDFMYTYxUkVMY1N5Zjk1SkZHUFN5TGRZMTY2dUlHcTB3NlJaRmYwS010?=
 =?utf-8?B?aUx5MkpWN256WGRuL1BDOWt6L2hjYTRkZUtCRW9wYkh1NWI4Q1dRN3VzcXJx?=
 =?utf-8?B?QWlZbGp5V3J5S1RCdkZMdm5HZWJ5UnZYUElxQlc0amlGS3Q2U2k4MkZXdnRi?=
 =?utf-8?B?VFd1Y3Z2a0hjSk9FTnNTQVRZN1ZhTktUeityMTRWUEx4bU9rK3lxMlI2dE9S?=
 =?utf-8?B?S0hWa2RtNnY1dStpMkdIZ1FTT1RaQTlLQWZJMTA1dGtBc1VRY1dkSlNSVCtn?=
 =?utf-8?B?QW1YajhpWUpyZ3F1REtucWc0cVladVZvYVlPQ2VvYTlHYVhXSjFUUDQxM2Vl?=
 =?utf-8?B?ZW0xSDB1UUxHT3UzTlM4OHlEbFlGbGkxeWlObE5YNjdhSXYvYnZ3WU5tVjZ6?=
 =?utf-8?B?ZFNRK2R0YzBmTlhzL3YxYmNvN1NWZFB2Tm5UdEpyaTNjNzJTcTRPeEd1VWRs?=
 =?utf-8?B?ZDBZbG56RC9zYmxxM08xNUtEL1RRbnpIV2g0cWdOL1VCVlJjTW1WOE1seFhl?=
 =?utf-8?B?a0g1Z212YXk0cnB4YnQwTzQ2bTJacDJvZm04dS9CUkNMVXZLcGh1RGdNOFZw?=
 =?utf-8?B?Tlp3bmEwY09Rak43bGpIY3NIL3F5QmRINkI1UXRzeVcwb1l3Z2hLZ011UXI2?=
 =?utf-8?B?VmlzLzgzZ0xIY1BDMDM5SHJZc3ZCTm1za0dYSXoyVzdRRWdyb0RXSlpjYldT?=
 =?utf-8?B?SE1QVWtlc1dnV0N1WllpRnZyZm12OEhJVkZpd2I1endOb2lvNHB0K2N4azdF?=
 =?utf-8?B?TkcvUzRkb0JObWhBS2RmTlFuTlc2Uzk4Q2FyOGRVbGxSMXNBMDhTcGQ4bWZl?=
 =?utf-8?B?QWpwc2JhbERTVldIZzdNcHZ5eFkvTDVQU2tBYjhib1NYUi8ydUVrVDFoRklW?=
 =?utf-8?B?Q0lBT2o4TjdDbytkQlJteE1RQkZzcUUyamRMZXVubmFzeUt3bVpmWXl1WWRI?=
 =?utf-8?B?Z3NVL09iNDgzVmRKdFFFbjBZUHU3eE5pY1ExLzlFYnB5VWJNNlpxUzJrNWFk?=
 =?utf-8?B?UDlKZzFPeW5kVEpnTS8xbXY5OXNCdmdSYVNoazIza0p5bElDMndUcXluaE1X?=
 =?utf-8?B?L3ZERUU2T2hiODNseGVpRGZpeHJXbnRHTzVua3k2WC8rOCsrNkNlM0RTK3NY?=
 =?utf-8?B?ZEZlaXlFVjA3QkNkVU9MVTB5WjFlbVBLM090bGdaZzZDQXhrdnlXQnpQc1dX?=
 =?utf-8?Q?vkmOJ9kHmPBDIbsGkmKSEHi6U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ea12df-8de2-4365-0388-08ddba8a5f60
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:36:02.6369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYRzgaEFu4dKUl/RAbcATSSDV5mqAnzgl1+ssWF73EB/raWCjVfF4e7308MMksBPCkdg5/P7jeusEG8orAp4kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459

When the CPU touches a zone device THP entry, the data needs to
be migrated back to the CPU, call migrate_to_ram() on these pages
via do_huge_pmd_device_private() fault handling helper.

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
 include/linux/huge_mm.h |  7 +++++++
 mm/huge_memory.c        | 40 ++++++++++++++++++++++++++++++++++++++++
 mm/memory.c             |  6 ++++--
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 4d5bb67dc4ec..65a1bdf29bb9 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -474,6 +474,8 @@ static inline bool folio_test_pmd_mappable(struct folio *folio)
 
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
 
+vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf);
+
 extern struct folio *huge_zero_folio;
 extern unsigned long huge_zero_pfn;
 
@@ -627,6 +629,11 @@ static inline vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 	return 0;
 }
 
+static inline vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
+{
+	return 0;
+}
+
 static inline bool is_huge_zero_folio(const struct folio *folio)
 {
 	return false;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e6e390d0308f..f29add796931 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1267,6 +1267,46 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 
 }
 
+vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
+	vm_fault_t ret = 0;
+	spinlock_t *ptl;
+	swp_entry_t swp_entry;
+	struct page *page;
+
+	if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
+		return VM_FAULT_FALLBACK;
+
+	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
+		vma_end_read(vma);
+		return VM_FAULT_RETRY;
+	}
+
+	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
+	if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd))) {
+		spin_unlock(ptl);
+		return 0;
+	}
+
+	swp_entry = pmd_to_swp_entry(vmf->orig_pmd);
+	page = pfn_swap_entry_to_page(swp_entry);
+	vmf->page = page;
+	vmf->pte = NULL;
+	if (trylock_page(vmf->page)) {
+		get_page(page);
+		spin_unlock(ptl);
+		ret = page_pgmap(page)->ops->migrate_to_ram(vmf);
+		unlock_page(vmf->page);
+		put_page(page);
+	} else {
+		spin_unlock(ptl);
+	}
+
+	return ret;
+}
+
 /*
  * always: directly stall for all thp allocations
  * defer: wake kswapd and fail if not immediately available
diff --git a/mm/memory.c b/mm/memory.c
index 0f9b32a20e5b..c26c421b8325 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6165,8 +6165,10 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		vmf.orig_pmd = pmdp_get_lockless(vmf.pmd);
 
 		if (unlikely(is_swap_pmd(vmf.orig_pmd))) {
-			VM_BUG_ON(thp_migration_supported() &&
-					  !is_pmd_migration_entry(vmf.orig_pmd));
+			if (is_device_private_entry(
+					pmd_to_swp_entry(vmf.orig_pmd)))
+				return do_huge_pmd_device_private(&vmf);
+
 			if (is_pmd_migration_entry(vmf.orig_pmd))
 				pmd_migration_entry_wait(mm, vmf.pmd);
 			return 0;
-- 
2.49.0

