Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C153B2E11C6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585787; cv=fail; b=AReqWUND5nLGYA66jD2P4nzJCHgM0cU45VdlN+hVCnRI+c5pRbcUblZMu3eC+ejuSMW5n04VRV4YkOm+f06sClrWJQSbpO/+/Qan0GqDYptqzabWG2Hd8Hn6oQAQtVX37PZvKY1IW6JnkfOGuoiuk3h9UaAmKLkUT1fKip0zCPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585787; c=relaxed/simple;
	bh=yH9/Oic/ZWEJk4MjcUyoGuSqiqrc3hVxqIId0kre4Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g3se5ua8Ydeb2UnP64jEQf/U1ce6S8d6glHg7YoekJjatZi19ud5CYz0RDvqO+c57o+jtaqn2F5yXc/YZEper94ClWdL8fqMRwvPl2Tc4WdLpyYSbqi6Bo3iEhe0/PrO2kzFFQNCIZo2P89iXFFNOST7k99MuTlqHZ9jFFKT6zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dDQ0HpAa; arc=fail smtp.client-ip=40.107.93.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dDQ0HpAa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tfgcXXNFJWItRB03bwNyRkHzfnG1R3wdxOfGByWTNJRN/FPYdjwU5menQF29oVNZouOtey99ymkJUrhw5noN21lzi+3Sj0e9/zcwwbc+DfyaooMGcWmTGAl51xrlJwpLhehsIOpqvY7bD4M66onkG1eF1z5JDsmW4WIIXYY1lUJm29Xbtv7cstGK/Dgd9jvqIGiIHeFiLRxC0LKxvsE3n8p+I9dhZLmku3K3MvJTNBnmFLkQC2Cq1mTglwikjA3y7S7sLi5LKAKjl5SegtlocJq3qRR6Iqaf8drAqq5xLUXnwSVZvaCsxamjI6hDh39Hu1JBr2dAKuBRBiQlX6vrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXS7Ad5xgqZiEjNHFxEFyKj9+wYt0wBlzoZNJOTlBbE=;
 b=CK0rA+hSIYWszML+gAGKLAAC8Xl/F+yBnAn2Dl7sIMWr2trELVEF+KaTBJH3wHPXn8JDqyylTeer3FbFPPxxQi6ytEGgEYgAf8qffSnuDSmkDFekAz8+dZpFanc+qosjIOM/M5ZnXuyWqptbatX3NGJXnAuS0HFFXIJvJoWHUQ1mgYlSSa6ZgTBwBymJp15el0T7gVVTH6SXz7Np0pLv1EXjJ/KPe6S5vlRz5S+m0+yLYPHf5pnLq9LxF2UO1o0nQA7MB8bcfPEcUJIQysAOQtC1UOcrkrR4uxE6hTGFjY94oQzb3e9yu43fO4waGrggp4Kx0/bvxH2G2WQCr6BBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXS7Ad5xgqZiEjNHFxEFyKj9+wYt0wBlzoZNJOTlBbE=;
 b=dDQ0HpAabB7JRPzaDJWpNcNGFAXfXhrvmV0yKFrhTC/4YsLMZjJT2nST8MCAfjft1rdXHB9FyAN3Iil7WwLd0mGQB4KApbBRWnp3ndv2w3Z10EifNSCTdD9lrJ4S1/9pnxIVWWOC/Lpc3gaO/6NVbvv+JrBUS2Knj8DMhBq0+W+UWSVvZfcAYxiaqZSs33WZ7vIHtP+QqjazdyJ4KUxAlJr0lcv0tJEC2WtewR7rbUTQrZOlV5443oZHCekKzaMV0zFn59ZV0LCK1kfhwR5crw/dO0htcB2/N0EUPg9UiGXKIGL6VH9T4/5Es8k4X8jJ0lbqsJkPvFWP8NRwYcyRdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 23:36:21 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:36:20 +0000
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
Subject: [v1 resend 10/12] selftests/mm/hmm-tests: new tests for zone device THP migration
Date: Fri,  4 Jul 2025 09:35:09 +1000
Message-ID: <20250703233511.2028395-11-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR18CA0022.namprd18.prod.outlook.com
 (2603:10b6:806:f3::21) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN2PR12MB4142:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0a9b0f-dc60-432b-822b-08ddba8a69eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akRnNS92aVlsY0dhbEl0RSt5QkFqaVNiMFhrOTVrMXhJa1N6UkF1Y212amdQ?=
 =?utf-8?B?Y08rUWtuOW1oVGQ4Z3NnV0ZSQlZBc0lTZGltVWt4bzlQWEJMTTdxb1Y0ZHA5?=
 =?utf-8?B?M0JidUt3Q25IL1pBSkh6bmd3U25sRTNXOXhUb2Mvd0NzSkdPb2g5dW1CNkJG?=
 =?utf-8?B?UzI2aGF6Z0tSNFJPVkF0N1NucXBxblEzNHJaNWRieGdVM0RoK0FSTmhwbXJo?=
 =?utf-8?B?SGxwZ0lYTy92NFp4S2lsYUc1SXo4K2lRQ0xqb2FDaFVFYnNsRStZRU5QUXRR?=
 =?utf-8?B?Vng0bXhabnU1WGtzT0FCMi9WUEg2UEt0akpEVUd5M2J1WjVjVWhOaEUrUU1D?=
 =?utf-8?B?YmcySUxPcDZvTzEzVFh0R2d5NEQxTm9UV0tjeU1XRVdrcy9CcS9NRXFER0c4?=
 =?utf-8?B?S1lld1JoN1FVZGdoOEVub0J2b2kzQ3htWk8yQjJyenl4NVBHUTloVm9vQUVi?=
 =?utf-8?B?TGhtaTB2VnF5Wnl5akl0L1FlM3FHcURwNXc3UHMrMlBYUGp4M1ZYaWFHaGVF?=
 =?utf-8?B?QTcwMUF0eGRoUHNrQWo2bkZnbE05Z3N2UWIyUU9lY3RBdEdDa1BvUTBEb0NQ?=
 =?utf-8?B?N0ZOdTg0YmVYOGl2b01vZVBmMjFNOGo2T09XUi9sMGE1UE95ZGhXUVU4Nlh5?=
 =?utf-8?B?V2FyTnk0VFIxcDJKNDIxaXhVbUU2V3RTUGJyUGtTemhkdHRtNDM2c1FYRjkx?=
 =?utf-8?B?dW9GNFlSalFNd2FkbmlSVWRpWlZVcnRjQUJlYjRyUWUyN3NUbmc5SDAwV0w1?=
 =?utf-8?B?RElPZnZ1czV6L2VCc1d1c0xkSklGOHY2NXZmUmw5RjBIdGVFcUd5ZGp5N2hK?=
 =?utf-8?B?TEdya1lvV3pONU00L3RxL1grWUExSXpFaWRkQjJFM2tKbk9PMWxZUFEzcVdU?=
 =?utf-8?B?ZGkxb1pwSy8vSDZUTXFRdjJHdUxubGpPSWk5NCs1eVRxQ1hxTGRsQk9hMWh1?=
 =?utf-8?B?aGZmbnc1aklqaHNiNTR0UWd3djQrL296MmZnTndyTDhFTWJSWm9lWWRwMVJJ?=
 =?utf-8?B?NlFtV2lhTUFRRmI3N1J3enRrcjd6Z0hxZERhU2lNcjl2ZkxOS2JuL2lCQmsz?=
 =?utf-8?B?c1BCZ05vMFFGdUZtUWpodE1aS3BRcTVVVnZ4Vk5tRDlpZGhsd1RVRmJZNzBx?=
 =?utf-8?B?SXJzZk5ZOW4yWU5aU2FDNS9wRVRpTnhRd1cxOUVHT3pmMU1BTVJzUDZjRDVk?=
 =?utf-8?B?T0I2ZXdzbHhib0dCcVRibVU0UVA0OGw5d09Oc1YyTi9LS0RuQkpnZTVWWE1k?=
 =?utf-8?B?SStWTHVSZDExanRkeEpOQmRPdmpNNWtwVWtGMDZhWkN0T2NNUUtYdERwKzdQ?=
 =?utf-8?B?SE1nNDZoZjhkMWpEWWYxck1qWi9tSi9VeVlxZ2pqOVkyQnFHRUZTT1JSSENY?=
 =?utf-8?B?eGRuVCtVbExjL3J3UW9kRTBNYnprVm52UFNMZnVXOVZRQU8rWVlIY2ttdGxI?=
 =?utf-8?B?dnNzOWlUMXdmTWRxUURCQmh4K21IdEdsWDVQRi9sWWVNU1RmRUdNanJRQW1i?=
 =?utf-8?B?cW5EWjNMamh2WEhjSDgrOUFDRVNBUzVFS0UxSVNMMUQ0Umk0dHpXbTRnMnFB?=
 =?utf-8?B?L2JhcG1Zazc3bXBubUxLQno0ek04c3dORVB0VUhFM0NoUERwRU0yU1UzRkZq?=
 =?utf-8?B?NWN0SS9mWm1LNnczR3ZMQzEzR1JUaTdPVlpmVWw4b2dpR2kwVStNZVBFQlF2?=
 =?utf-8?B?V2R0ZmR4T25rSFZmVC9BQ2J0OVhOaVJ6K08xRFpjT05FdGRmUE02a0FNOTli?=
 =?utf-8?B?STVtaml4eEk5QXdQSlpoWW9LYTZOZk9ZdjQ0N1dKVWcwU3RkeEY0WFlzWEhP?=
 =?utf-8?B?am5DdWxReWEyR2RQTDZUYksvN3UraENIOWJJSmVremN5bEtxUU5JR0hHeURu?=
 =?utf-8?B?cjlkdnN0elVtb2JQNGU4MUtRY3JwOElkUmw4czVTU0doQ0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGxOR0ZTa0V6RVZydC91bi8vc1pJL1BwYk5rYWNIWkRFVFB6ZjlOVTJnMEx2?=
 =?utf-8?B?dHRLR0N6M3RqY0t2UUpiTXFtdEF3U2ttcEhwZXhQbmo4MFNXOWRIWis0eUdV?=
 =?utf-8?B?WE9oc0tCS0FhQkRtMHEyMHRjZlZpbTdXVHBXQjhBa3NrTjBMM2IweHdWT0Uz?=
 =?utf-8?B?aWpPMnZJTHJLbXRXRG0veENSU2lyTkJKdEFvZU9nYlFWWXg2R04zbDN3dHNw?=
 =?utf-8?B?QmdET2ZJdzdqTGE2VlphZUdHZzN4ZEx4Sk90eVdlL1YrR1dxdk44akd0Z1Vk?=
 =?utf-8?B?Vi8xZmZqd2J2aTZ3aERHTGNhWEcyUTNLQVc4WkE5UWkvZ2lkTGFtd09VM2xN?=
 =?utf-8?B?OEJpYjFmZ285S2puZ3BlUUhTZnFCakJKLzNCR2JiUUEyWjdzNDdVZ0YvS0pr?=
 =?utf-8?B?TkFZd1RCSUd6alEvS0FraVhtYnlPWEdMVXRmM2oycWp5VytURno1UW1ERVph?=
 =?utf-8?B?MmpaN0NXNnBsMnRyWDVraldqZU5oR1FsYy9nZUV4aVo4QldTU0JOZ3kreDZX?=
 =?utf-8?B?VG9sSWZCWDdYWHRKcWRIMkNxNFBBQ3htdE1LTDdzZ3NLdUtHdlBzc2ZLVG01?=
 =?utf-8?B?ZGQ5bDhuQTAwZ3BsdTNBcStkYmoraGJ3Tit5S0Z5eG9WeVZUUUxpOVJjaVNB?=
 =?utf-8?B?YmVmbnp2T0Z3UHpZY1M1NHFzQU9MMVBBc3J2bE1pK2trbThXbmVuNVl6dVB2?=
 =?utf-8?B?dWw2Mnd5TkE3VFJFWGttWVExbFNXOHkxbDRZaGx2QjlNaWp4UFpqQmFncnFX?=
 =?utf-8?B?TDk0RlA3TnhGYmJoMXorOXNEREZ5NHdRdFRjcmhET1k1dDlGbStDK1lNRllJ?=
 =?utf-8?B?a1VTSUhIV3hCcE5XL0N3QWdIdGxGNFAwWjZRZUN4U1hQeTdGZXJHUU1yek9n?=
 =?utf-8?B?V3pxRm5XTGdRTWxzYVJBOURzMUt6QnJLcmpKblJOR0VlNmkvTjlGam9MclJ6?=
 =?utf-8?B?dzdqZDUvMmZpMlhleHpaaHlSVVlnMEMwNlZZVlNaeHJpd0V6eEpzNjBBVUdk?=
 =?utf-8?B?TlVtRExBZ000ZmFNZ3dQZ3kycTRhV1Y1SUtRVUx0SGtvV0RnUVpoUXJhTGc4?=
 =?utf-8?B?MDhIZjBhTFRCZHlhZW9HZCtwcW9JazdqZSs2RUtiRUVjK3htZ2E4ZzlhTzBk?=
 =?utf-8?B?Y1daNWQzMGZObmhJVzhWOEdwQjE5NFZ4NWw0bG9LS1Z2TktMWGo0c3VtRHpt?=
 =?utf-8?B?akRVeFM4STV5SWJNRWpEeC90Qi9tVmNsd2UybGtpMFZGY0VTYTJERnhJbWdl?=
 =?utf-8?B?Q0x1WTNGR1ltMFNtN3BaY21OdEFvb3B3TEdtRDNqYkE1SFNMN29FcElZZUxD?=
 =?utf-8?B?TmxkNm9GQXQzMmNaL2R5RCtDUzBub0cxc0ZtZDZJM0xhR3kvMGdzeWhHQ1Va?=
 =?utf-8?B?NXdpMnpFZjJWQ2RNMXEvbGpDem9jVXVqOGRWVGhLRGp2UFZiTzZ1L2x0c0Rp?=
 =?utf-8?B?SStqeUMyTmpObjFidW9za1oxNk9nSi9sSVZkTklxdHV6enZsRDBVSDVrR1dx?=
 =?utf-8?B?dzBSN0pZdnRYb3dTYk5nZi94Q2p6OCt6UENBS0IvOGNORno4RjNWTnV0Y29S?=
 =?utf-8?B?bExwVlIvRmdoc1hCQVI5eW53QzlIQXBUbnJ6TnpzMlN3Sm50cTBPa1czd094?=
 =?utf-8?B?YiszRThqMmtSd3NJK3h2SGZ1VG9YRjA2WTFVYU41bUl2SXJWMVdUeW5US3c4?=
 =?utf-8?B?dTFWMnQ2MHpZS2xGWThvdVQyV0l4K0NKU05JN3czRFRZcGtCZ0NOVFhsdkU0?=
 =?utf-8?B?WkM3L1FGSnJDZjlWaEExK3psTlZUQjI3d0taSUw5dDFnMTcxbXFJc25LeUdD?=
 =?utf-8?B?VWNwemtuNE82Mnc0SHRKbXJ0SGJuclN6bFZlbGZyb3JlS0FtQmlZN21GbEZ1?=
 =?utf-8?B?WFBTZUMraE44RzAwUy94UWU0YkRubGsrMnZtVkNGa2hvVmdIaStwYlB2TWY1?=
 =?utf-8?B?VWtwaG14NVVpYUN6V3U5RTU0ZUxiN00xcElqeDM5OGZYbmZXVG03OTZpVmJZ?=
 =?utf-8?B?T0kwOFVVYnozVEFUcTRwZDgyK1ozUEJFcklMY01GQ0J5eWNBbk9rTjFodHVK?=
 =?utf-8?B?aDlVcE53QlQzd1JsSlhWckxSU2Z2S1U0Qkg1aXRFN1JPRDFhUGRSWi9heWF6?=
 =?utf-8?Q?pXbIKh4NpdXUQkBqlFwaEp4hI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0a9b0f-dc60-432b-822b-08ddba8a69eb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:36:20.3607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNXJzzx0w2LuFReVhsr/HEHYHkqzIRRQualKGsD3Jhsmc7P9Dlfa4QjbpzjxBpPbLYg3yTdDKwZI/K+OUkdNCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142

Add new tests for migrating anon THP pages, including anon_huge,
anon_huge_zero and error cases involving forced splitting of pages
during migration.

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
 tools/testing/selftests/mm/hmm-tests.c | 410 +++++++++++++++++++++++++
 1 file changed, 410 insertions(+)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index 141bf63cbe05..da3322a1282c 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -2056,4 +2056,414 @@ TEST_F(hmm, hmm_cow_in_device)
 
 	hmm_buffer_free(buffer);
 }
+
+/*
+ * Migrate private anonymous huge empty page.
+ */
+TEST_F(hmm, migrate_anon_huge_empty)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page.
+ */
+TEST_F(hmm, migrate_anon_huge_zero)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+	int val;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize a read-only zero huge page. */
+	val = *(int *)buffer->ptr;
+	ASSERT_EQ(val, 0);
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], 0);
+		/* If it asserts once, it probably will 500,000 times */
+		if (ptr[i] != 0)
+			break;
+	}
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and free.
+ */
+TEST_F(hmm, migrate_anon_huge_free)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Try freeing it. */
+	ret = madvise(map, size, MADV_FREE);
+	ASSERT_EQ(ret, 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page and fault back to sysmem.
+ */
+TEST_F(hmm, migrate_anon_huge_fault)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, size);
+
+	buffer->ptr = mmap(NULL, 2 * size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)buffer->ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	old_ptr = buffer->ptr;
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Fault pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i) {
+		ASSERT_EQ(ptr[i], i);
+		if (ptr[i] != i)
+			break;
+	}
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate THP to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/*
+	 * Force an allocation error when faulting back a THP resident in the
+	 * device.
+	 */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+
+	ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 2048);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
+
+/*
+ * Migrate private anonymous huge zero page with allocation errors.
+ */
+TEST_F(hmm, migrate_anon_huge_zero_err)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	void *old_ptr;
+	void *map;
+	int *ptr;
+	int ret;
+
+	size = TWOMEG;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = 2 * size;
+	buffer->mirror = malloc(2 * size);
+	ASSERT_NE(buffer->mirror, NULL);
+	memset(buffer->mirror, 0xFF, 2 * size);
+
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+
+	npages = size >> self->page_shift;
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	/* Try faulting back a single (PAGE_SIZE) page. */
+	ptr = buffer->ptr;
+	ASSERT_EQ(ptr[2048], 0);
+
+	/* unmap and remap the region to reset things. */
+	ret = munmap(old_ptr, 2 * size);
+	ASSERT_EQ(ret, 0);
+	old_ptr = mmap(NULL, 2 * size, PROT_READ,
+			MAP_PRIVATE | MAP_ANONYMOUS, buffer->fd, 0);
+	ASSERT_NE(old_ptr, MAP_FAILED);
+	map = (void *)ALIGN((uintptr_t)old_ptr, size);
+	ret = madvise(map, size, MADV_HUGEPAGE);
+	ASSERT_EQ(ret, 0);
+	buffer->ptr = map;
+
+	/* Initialize buffer in system memory (zero THP page). */
+	ret = ptr[0];
+	ASSERT_EQ(ret, 0);
+
+	/* Migrate memory to device but force a THP allocation error. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_FLAGS, buffer,
+			      HMM_DMIRROR_FLAG_FAIL_ALLOC);
+	ASSERT_EQ(ret, 0);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Fault the device memory back and check it. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], 0);
+
+	buffer->ptr = old_ptr;
+	hmm_buffer_free(buffer);
+}
 TEST_HARNESS_MAIN
-- 
2.49.0

