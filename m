Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053563234
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749206681; cv=fail; b=rYH79AV2za8BPX1qAfrS8m11TumsRHh08CioqSXhtDepE2Jt2FfH/gxwFbYgFbFTJYS2yDaYbKi5tdJrhXootrqccAyfCu5DvsNHQ2amv5jpdo7Fj8/TmpS5w6xO2pLELzXRcRaL6CZnTpWroxHAD6h1wWvNvrsSTCgqyMyN9wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749206681; c=relaxed/simple;
	bh=2gGkTn9eerW7Mb3q5/oepd/fQDHg4LIcbinn0GgMTW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bh4t/HWjq8p7TskyY0A8xjRyij8ypC/v2SYbZjNzJQV3+idBR9R0LH1p5np93OLUIK4Swn9EVZImnxTSZeiQa2Jm9VaZgtVzTRm44I7V9e1VC0TjouLWVyoVGr9VwE01Und0eLLHQchN7ISR4oOxj68tdwbozcM5e+sox0tfycI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jo2tSibp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LAdf4wV6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jo2tSibp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LAdf4wV6"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565NEff032745;
	Fri, 6 Jun 2025 10:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+79iV2X/90oQWOVa1w4+HhAblMbL1NKPbHEsls0SsfE=; b=
	jo2tSibpyqvwVBTLKoPYnjUz7jvEdt4rOFoHTX+xuUUeWYc8pBrbvpM8t5v1zM1y
	1dEZwe90KypzQvYomoK3LnjzACuVbzQJKIEzfU9znaMeeMdvMIV6QOmj0ZuocoGZ
	X5qo0ev91xS+Amb8JNwQdTTbj0GmAHrGR+Xc7BIs37dbIxD2ppjusGwYl7XXdEbz
	UgKhlHTbJvjOuKYqMHAGtYJ1vQhJ9ET4dvvjPRvc70TzRH/Yd2dGIYi2Fz2d8XnZ
	HpiEwNXLzfSjxx41q5IgbhFIgLo+AMRNUg9cj3FSusAbqNbLaRQbHaKwFq8C/Cec
	G2dEXaZgHXDDU07fUFhT3A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8cysna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 10:44:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5569kH35033797;
	Fri, 6 Jun 2025 10:44:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7d51fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 10:44:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ogg/RKPfo0a8ewBEYFN3FT/kbGXX62vnxFSVKg9hPnFuOQ85mU+dXz682DnHn2HQnPK0jTg0dogJhKYGBCNDntp1JBGncl5xQh8l5ezWSqyEMw+rtplmPiL8OX77WqTUpTlCtxQWdn2o8NgIlA4AjM59tFmYXpUzlDdrr6OVYPi9wKKp8kTdQMhI32SFCK2jlf4CL8AZojXsatElQuDC3gZ9Z3vK6ukvGUlSDC9lRugYlUSm3K4CNW8y6Iu6E5UQzUE/4SJuIhysZEuD6IUGyy0HovziEATi5i3WfveQzqaEUKSJMbMsyVOZf1rZsttjqVHxzGsqmsT8+r01kkiAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+79iV2X/90oQWOVa1w4+HhAblMbL1NKPbHEsls0SsfE=;
 b=R6GAGemuUjS7URd0qd5KIR///nuG167el+1IVR3WQVnFDk8+OIJ3pjoYamvliKe++f3N7TmELG5R5onmaHi/mLOZVL0Q44KUzFFLj3rezTUaVRgZKCnpZD3qdG98mny17PzQcqY78EDDNRTGbvxXoL8+gWIq7wc72XCu5rRNvxgFhZcGDZlufc9ZmnuvNVV/gN0VtmOl8XYnY6rHUrSSVFXIlc5Bg/OcSqMMlS7RKA+vTkHCx9IckqmR/6HqNfMYmo/SWfTG6GWFF6neDyPmh39IRKINYxIvvmfPd2lV+MvIAuBF03NWck7ZSwjezYnRwzInqC6/z/bCjkWtBVMC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+79iV2X/90oQWOVa1w4+HhAblMbL1NKPbHEsls0SsfE=;
 b=LAdf4wV6Swlnodb9QYCiwl548MOymFZpiidi6b7d8aO9sQJ7fm/SYuUUurRACWQ7UdwbQ+VYvzurKtW6TDOIaFiP19M3Jd1302G4OoKgzz9tXUFT0h+ohnXKIBeaYWO1B13xWnHFGjvCxk0TRO/qo9cStSz1GaKbSh9gI5qyh3M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY5PR10MB6165.namprd10.prod.outlook.com (2603:10b6:930:33::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Fri, 6 Jun
 2025 10:44:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 10:44:12 +0000
Date: Fri, 6 Jun 2025 11:44:10 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Jann Horn <jannh@google.com>, Barry Song <21cnbao@gmail.com>,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <d68ba9d4-5850-4b70-bbf3-00d79f19fd3f@lucifer.local>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com>
 <c6dbfb68-413a-4a98-8d21-8c3f4b324618@lucifer.local>
 <3cb53060-9769-43f4-996d-355189df107d@bytedance.com>
 <c813c03a-5d95-43a6-9415-0ceb845eb62c@lucifer.local>
 <7cb990bf-57d4-4fc9-b44c-f30175c0fb7a@bytedance.com>
 <bfb56be6-d55e-4dcc-93a3-4c7e6faf790f@lucifer.local>
 <f0069b65-9ca8-44e5-8c98-1d377798c31e@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0069b65-9ca8-44e5-8c98-1d377798c31e@bytedance.com>
X-ClientProxiedBy: LO4P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY5PR10MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 52293322-a206-44cd-e274-08dda4e7135d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUZ4SkFtTE5tNHlEbnBVeFpRMFkxMi9TNnJqanorMTI4Z0Rwd1VCZVdLNjAr?=
 =?utf-8?B?SGpzSmUzT2QxM01TK0RZSThrYnZBQXRZaUxDNFQxS1JRYkt2NWdNZWx0cDBr?=
 =?utf-8?B?QnVOUHU5S2NqR3VZZzNxVFRMTlh2VWJEUmFiUHJQb3oxZ1F2RG5yUjFoTFFo?=
 =?utf-8?B?QWNCWUxjS0xFLy9uZHZLRGcrRmFsTk5LV3R4Z2hWZWxKS2pMVVpPNWxrQzMw?=
 =?utf-8?B?TThVK2ZBUmpSbnM5cDZvbTNHdU0xTEJGeGFDWHNyd1pXRGp5WEJXWERFZVlk?=
 =?utf-8?B?Z2xmQzVVTmR0UW5HRVl4WnJEQzk4WWQzeDZvZjhCM3diQ042U1FtSDd0dGEw?=
 =?utf-8?B?VGhVQVJBOWcwSE9oWm4vRWltbzE4S0phVHlab01Jc0dXdGp0aHJRa1NrclVW?=
 =?utf-8?B?NFNUb0lYMzZZMG9oZDUwb1pKVE9pTVR0NUM3RVB0RFlObHZNc3hlVXNOYUVL?=
 =?utf-8?B?dHVxeFJZVEt3cjU3dHE3TGtEbzBkWXRsczRjakdEUXNhUXZrb0dSTTNDdmpa?=
 =?utf-8?B?RjVWMVdIaW1WMXc4QzBCYUxUVnhnL2N2ajJydUVpYWxjZVpYcVRvTlNDTEZw?=
 =?utf-8?B?R1BqNjJONHZLaldHdElyZ1kxVjRDTk5TOVVoSVJURlpGOE5RdXVuRWRjQU5s?=
 =?utf-8?B?bDZGWW1zdXdGNHJ3VkE5TlJINkcrSXhuK1hBUFYxbldVelR0K1lnNmxac2ZE?=
 =?utf-8?B?VTlZaFNZem1MQi9yMXQxTVdGSjZibHN6Q0tWYTllTkRMbG4zSi8zVDlGSW9q?=
 =?utf-8?B?Wnk2eW1FcTQ0UHNUY20rTyt2bFVGWjBuRkNPUEJLSG11c29iS2hhUXptV2dh?=
 =?utf-8?B?d3pFVEptdFBienZqQ3d5bVZOcUxIdEJoYmhreStNNWFXSDlZZmp0c0xKck9L?=
 =?utf-8?B?ZWl3VDZhM0Nvek95NURMazI4bDVOZkZPRVRkMXlVeFNMQld1T0YxRzlxZDJj?=
 =?utf-8?B?SmdISFo4U2xHVlQ4M1FHZmpOb0V2YVRIUVo5aFhibjNITk9XK0N4WTM5RDJy?=
 =?utf-8?B?ajhic1duVTkzSU52aDhXMnE0ZllpVFhmQ2o3MTBEeVExRWpZVzJHZHF2TmJj?=
 =?utf-8?B?aGRITmVCU0ZiUDhUcEh6S1l6YVpZYTZjZnY4bDg2NldLOUxob2dNcGUxdmk5?=
 =?utf-8?B?Rk9qOU53cEhpQmwrZS9qQ3Z0QVdmUk9LdXIrcFM3bmcvZk9LUkRWVkRWVENF?=
 =?utf-8?B?R09nakt1SzhHQmlHWGZYN0tEL0dvdVY3VDlhZnlINlFkRFR3bG5rSm0vWS9q?=
 =?utf-8?B?cEJERmdTeHc4dEFOQjdYUjViYWRycTY3ODJ6cjhzRUVyN2xwSEtBWGdDbWd5?=
 =?utf-8?B?N1l6NDRnUkRPditpMDFib3BMZklVTFpnQnRqaDBwUUhLWHV1OHpxU1J4eHpy?=
 =?utf-8?B?czcxQVJ3Mmx5eFB5QmdJYUJPTEYwNU1oNWN6TlpQZWVleXZWSGNTQTN1Yk5T?=
 =?utf-8?B?akU1TWNpYk1hVktnUGQ5dDhCTkRBZWFRNFA5ZkdDdjVpNUpRRTJ5QktLUGsv?=
 =?utf-8?B?THBlWjF3TUNQeDJUeWxrSzBXTlVaRFJuVXpJVmVReXdHc2RhOHBuMmQ3SENP?=
 =?utf-8?B?NzViK0tlUlZ3b3NwYTkvNFBGM1h4a1hEM1lpNWZFb2d1YjN3b09lU3kyNEE5?=
 =?utf-8?B?LzFjaHFZQ2ZDRUNubVhubVpwdHpDYmpRZ21PcGhsbGswZzBWTWkrNUsyTkIy?=
 =?utf-8?B?MGtxVzdmWlBHTitpOGZQckd4TnNFbnRCZ0x2SkhOWGpnSHVMTGxINUFqZzI2?=
 =?utf-8?B?cXdveVhLMnBDcVJPZFVqa3U0dHl1ZllBdUpkallsclo4OW5SOG9iaVRzNzcz?=
 =?utf-8?B?WTdlQjVlOTlhZXpMRzA4bzhaZmVsampCMHNhQ0JPc3JhbjBTNGpoOHF6ZUJt?=
 =?utf-8?B?am5CVmR6amZGL3ZlL2tzTGo1S2V3NllEeVhRZmJXNjYwK3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDY2eWJTWVBucVgyWXl0aUplSXd2ejh5eHJnZUtZeUlzUjZoTlpsUmk3cDFY?=
 =?utf-8?B?RlNzMTJzK0xyb005cjlJUGlOSmJ6bUkwenFveStUMjZPYkFYR3BkSHp0MU5j?=
 =?utf-8?B?SHBtaW53eVlvY01EN2Vlb2ZGaWRRZk9jMWpyV2xRTE92OS9KMlV6dnQ5Vkd3?=
 =?utf-8?B?QTczYmpReHNDODkwK01ENUw0VW16T0IwTWVsVmhhZHB4WjNIckJ4ZnVDWTVw?=
 =?utf-8?B?UFF6WVhJbXJLM1E4RzlPOVUrZTVYS29HenZUQ2ZNMFBldnFaV1VWNERUUkVV?=
 =?utf-8?B?UGVLaXNBbmxtMVViZWRmYUwyRU5QNm81OHFWc2Z5a2ZuN0h5SVhROVI3endY?=
 =?utf-8?B?ZUp5allKRHZiYkdvY05CdG0vTlRDOVlSNTd6NFFMd3F4cXlCVERKeEpGNzMy?=
 =?utf-8?B?RTdnTEJ4dWJ2UnV6Vlp4R3ppcTRTWFlTSHZGTzFWek0yeXphU3ljSTA2OXp5?=
 =?utf-8?B?cFdLTnV1S0dOdHd2U0twRU5WTmFZeG9SSEdoRHVCT2d5ODVJSVFFa3F2SnV6?=
 =?utf-8?B?QUtSbDc5KzNUdjB6WGZMcTlZWGR3TkYxd08zUWd3TnhJdm9UQmZPMkY5b3Zs?=
 =?utf-8?B?VEVUZUFYdUdmd3VibC9yNDBVUGZUSnZIbWVsWkRGTHo0OXlCdFhZT3ZEbDhY?=
 =?utf-8?B?bTQ0QTdSZlMwTnI3ZjY5K01ZUERPL21mcldZeTVNZURyeXJiV0cxbU9HZjFy?=
 =?utf-8?B?bXV3YmVjRFU2THZ5YnpYekd4NVAycFM3eEg4THJlSGlEdlVyZUYwbkVWcDVh?=
 =?utf-8?B?VE1CaFl0SFZoY1M1RVlJK2VSYW5zclFPNmpPUjhRMTdIQ1ZKM3lIUjN6c3hF?=
 =?utf-8?B?ODNOODNaNnAvU2t3d283TVNVQjg0ZlJORE9rYkhDS3RKaVdvTzREMGV2M1ZX?=
 =?utf-8?B?MkNrTWY1TzBFbmpnMjRTMlRFd2RHbzZpMi9PZUhmdnRoNHlzbXB6OGdPYkhW?=
 =?utf-8?B?Tlp5ajRxNnNlR3YyRTVEcnZsQjRwRW9zc0xjK0hITGpVMm9vSDNGckRJTExM?=
 =?utf-8?B?VmszcHhHZFJsMHV1bGtFRzM4V2RqelRLZVoycU9qMkF3NzQxZFRjbm5DQnNN?=
 =?utf-8?B?VEFqZms2YVVkbFpuYlo1amVZWTlxTnlja0wxNzNYT3ZZSG5BWUFtYXlNK1pW?=
 =?utf-8?B?TlRZK0JmZENMVzNVdzNIMXo1MDZlaEVrUGxvZk5TNU9YUDNMaTdNQm13Tllj?=
 =?utf-8?B?QzF6dFF0NGxPa0ZVRit5Y255c1VscmxKeDZOWXRMQ0JFUzhoUDRaeXVRcFNy?=
 =?utf-8?B?TUhXRzlEa1I1Q3hBVnNSd05uZlRmQ1ZtRGxvT0ptZ2swZ013VEVFV2VnSW9a?=
 =?utf-8?B?UDBQdFBJcURoV2lGcW1UcmpFdU4rYjBTMzNzdDNUMTBjOVZDMEdYTHE1NXl2?=
 =?utf-8?B?eFpHS2F0SjlwR0dvdnZpTE1CWGpubEJHNlExMGZFcThEbzhvZHh0ZGRmbTc0?=
 =?utf-8?B?RWhvNXJ4Qm42Z29qc05wTU15dncwcWx1YXYrSVRDdzY5Nk5MWHIzVkFnOGQz?=
 =?utf-8?B?amJ4Kzkrd3R5a1JXM1E4WmcwZ0FmNERnMXBVSkxrWGxLZ1FPbkliTjlwZWE4?=
 =?utf-8?B?c3lSdjdyeEVUTW82UFFyc045UlV6L29Vc1ZzeVhtbkpYdUsvWk05WXNxckRV?=
 =?utf-8?B?eUpQN0pSRVNQOEw0bzM0V0R0UEsrcWlUZDAvWGFTNG52WCtJV0Fram0xck1I?=
 =?utf-8?B?OERXSHlHWDQ5LzRRNWhzMUgwRmpza2xJV3UwTDhtOG0xYUFDdzNlWG9FRFY0?=
 =?utf-8?B?NXZQRGhTU2VhY1VyczJjbnE2RlJDT2Rjb3AxSU5SajdLVTRiUlV2akthSkhR?=
 =?utf-8?B?alY5a3hJOVlyM2tGRlp3dE9KTG52OGp6TEQ3UHcxMlpReTFRdmhIZkJmQlYw?=
 =?utf-8?B?VXoxNFZIWTdJQlMrcnZvVXhVQTNUQzJhdXNuZW9vSlYzVTJEUy9GbUltcUZn?=
 =?utf-8?B?dytJMjNvbDBBeXg1Y1h0QnVCUnBrVE1mU0cwNHp1akttMlA2aWExU3gvay9z?=
 =?utf-8?B?dFVWYUpIa1FpM0dTUkw2SlNwd1V5RzlVM2lzOTZseVhrMnFWYkhpQXBqT1RR?=
 =?utf-8?B?NHlGVWJBeUU1Y2VaNjh4YUJHYnVYWXZDRHpvZmJvbUV4TjlaYXJ5OU4xc0N6?=
 =?utf-8?B?NUhuL2tuMDU1MGU5cEZ1cTlsbmFmNlcwMWtKMVlDMjVuQkx3UmFNa2Q3VkZw?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	18hDQbViQdV4vrLlbHN4woAwG7CMnJKallFbtEprVh1T9UqR+8WuXpXYRf3CdhPHTtM3MvdBwAJNCWmBKzWzAYHHy4mCBZskb8md7OpOScVJvbRgZzJb92E3R2NQUkRZOXQ5N6gzfNSWyTc//LnZ9zWPVXNMM8vHaT0+UmDqrKuItq46gnlLNz8oak+32RidRmf2nXr8mnSJ8Z9QciW5ZPyXzjY8OP4uQVeyiRRghPbLkhZD95iryQU2SgDL39pSihynM8Nd6uHzb9UfkFL4i4pEv6aNBR/GQbNu920T1BdbJoyz6qzLjbQ15vOTeiUhsryurEdF6athvni6RmwrvX7Mt6fvwuYTd+PCLz3M7rjavNolPWpZgzWSdqB5iT1fp+AYdzEIhNkO/ZHpWHBodD26obD7hPsIjLCuJQazCa2P2UDyqTwWQajyfeHo+3OakdwVM5re3RddE9UrscpaRA1a4BBMeIUHYZ1kzcr4Dh1G7Wp1VxpbdQDoG9lgwIjK6At/EdM+WuYF3NtLcNxI8CDeT7rsekCFjMJEORLb35M6DcuokFZEI21ZajhVAdcX7Qg/TVssuIBjw9eOdDmdUhJyqJAailzKIPiay1xrPUA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52293322-a206-44cd-e274-08dda4e7135d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:44:12.7599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOqw85zJDM3VcIFJKxn7OQ4pSYVthXpWNOwixYNpuZ4zXpZ/L+G5i5X7am5PfYjxo/C9VqqFH7anOZhLb0vgLzJuRBUuKzhLkzxVQ3OORac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6165
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060096
X-Proofpoint-GUID: DLZK0k18Oe1VbyBwilS09hzKTLFJjr0e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5NyBTYWx0ZWRfX9NiavR2AS3ai 5rvpnyGY/74B8v1tZ9BWv+7jiAVMIPD+H79DajXy+Kn0pwdC5OSJqXJng13mwOXzQimaZ7Uu6Y7 K+rLuT6RFHxZfiKvIcj9xtEogCaEWQ9FCXBbURU8Os4tBK7QEdg95baFiDrQRyS04g3X45LEmaU
 zoXqEjPAjoYdTNQAkfaOM7cAureFCXK51ZR4neQ5SsZ6kJEKb/bXC++vvGUGo85mn4XT8tE8kas Z8stvMuXcXJUGWxChjOKb3DT0AhZjT2CgQtq6F7w4ZTuE00JItfPNP54yEjQfWeoRH0rFjHItZb ewE2tjiUYEsDksoF7LfD++AM48pdd3NfV63sPv0nbzI2+tyzSYTJXSSRnjszrgF0arGM/wV7fBT
 /0IakwWq5GJxkkP8KUlSHDSlhHxR1V7QlN7UaE5LW8XS4oNMDFobdRo3MfgWB6cpXuWYCsI7
X-Authority-Analysis: v=2.4 cv=KaTSsRYD c=1 sm=1 tr=0 ts=6842c680 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=1u_FStEZLfeRFz8b3xYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: DLZK0k18Oe1VbyBwilS09hzKTLFJjr0e

Qi - thanks very much for your insightful response, will stash this
somewhere to revisit.

On Fri, Jun 06, 2025 at 11:55:56AM +0800, Qi Zheng wrote:
> Hi Lorenzo,
>
> On 6/5/25 10:04 PM, Lorenzo Stoakes wrote:
> > On Thu, Jun 05, 2025 at 11:23:18AM +0800, Qi Zheng wrote:
> > >
> > >
> > > On 6/5/25 1:50 AM, Lorenzo Stoakes wrote:
> > > > On Wed, Jun 04, 2025 at 02:02:12PM +0800, Qi Zheng wrote:
> > > > > Hi Lorenzo,
> > > > >
> > > > > On 6/3/25 5:54 PM, Lorenzo Stoakes wrote:
> > > > > > On Tue, Jun 03, 2025 at 03:24:28PM +0800, Qi Zheng wrote:
> > > > > > > Hi Jann,
> > > > > > >
> > > > > > > On 5/30/25 10:06 PM, Jann Horn wrote:
> > > > > > > > On Fri, May 30, 2025 at 12:44 PM Barry Song <21cnbao@gmail.com> wrote:
> > > > > > > > > Certain madvise operations, especially MADV_DONTNEED, occur far more
> > > > > > > > > frequently than other madvise options, particularly in native and Java
> > > > > > > > > heaps for dynamic memory management.
> > > > > > > > >
> > > > > > > > > Currently, the mmap_lock is always held during these operations, even when
> > > > > > > > > unnecessary. This causes lock contention and can lead to severe priority
> > > > > > > > > inversion, where low-priority threads—such as Android's HeapTaskDaemon—
> > > > > > > > > hold the lock and block higher-priority threads.
> > > > > > > > >
> > > > > > > > > This patch enables the use of per-VMA locks when the advised range lies
> > > > > > > > > entirely within a single VMA, avoiding the need for full VMA traversal. In
> > > > > > > > > practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
> > > > > > > > >
> > > > > > > > > Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
> > > > > > > > > benefits from this per-VMA lock optimization. After extended runtime,
> > > > > > > > > 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> > > > > > > > > only 1,231 fell back to mmap_lock.
> > > > > > > > >
> > > > > > > > > To simplify handling, the implementation falls back to the standard
> > > > > > > > > mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> > > > > > > > > userfaultfd_remove().
> > > > > > > >
> > > > > > > > One important quirk of this is that it can, from what I can see, cause
> > > > > > > > freeing of page tables (through pt_reclaim) without holding the mmap
> > > > > > > > lock at all:
> > > > > > > >
> > > > > > > > do_madvise [behavior=MADV_DONTNEED]
> > > > > > > >       madvise_lock
> > > > > > > >         lock_vma_under_rcu
> > > > > > > >       madvise_do_behavior
> > > > > > > >         madvise_single_locked_vma
> > > > > > > >           madvise_vma_behavior
> > > > > > > >             madvise_dontneed_free
> > > > > > > >               madvise_dontneed_single_vma
> > > > > > > >                 zap_page_range_single_batched [.reclaim_pt = true]
> > > > > > > >                   unmap_single_vma
> > > > > > > >                     unmap_page_range
> > > > > > > >                       zap_p4d_range
> > > > > > > >                         zap_pud_range
> > > > > > > >                           zap_pmd_range
> > > > > > > >                             zap_pte_range
> > > > > > > >                               try_get_and_clear_pmd
> > > > > > > >                               free_pte
> > > > > > > >
> > > > > > > > This clashes with the assumption in walk_page_range_novma() that
> > > > > > > > holding the mmap lock in write mode is sufficient to prevent
> > > > > > > > concurrent page table freeing, so it can probably lead to page table
> > > > > > > > UAF through the ptdump interface (see ptdump_walk_pgd()).
> > > > > > >
> > > > > > > Maybe not? The PTE page is freed via RCU in zap_pte_range(), so in the
> > > > > > > following case:
> > > > > > >
> > > > > > > cpu 0				cpu 1
> > > > > > >
> > > > > > > ptdump_walk_pgd
> > > > > > > --> walk_pte_range
> > > > > > >        --> pte_offset_map (hold RCU read lock)
> > > > > > > 				zap_pte_range
> > > > > > > 				--> free_pte (via RCU)
> > > > > > >            walk_pte_range_inner
> > > > > > >            --> ptdump_pte_entry (the PTE page is not freed at this time)
> > > > > > >
> > > > > > > IIUC, there is no UAF issue here?
> > > > > > >
> > > > > > > If I missed anything please let me know.
> > > >
> > > > Seems to me that we don't need the VMA locks then unless I'm missing
> > > > something? :) Jann?
> > > >
> > > > Would this RCU-lock-acquired-by-pte_offset_map also save us from the
> > > > munmap() downgraded read lock scenario also? Or is the problem there
> > > > intermediate page table teardown I guess?
> > > >
> > >
> > > Right. Currently, page table pages other than PTE pages are not
> > > protected by RCU, so mmap write lock still needed in the munmap path
> > > to wait for all readers of the page table pages to exit the critical
> > > section.
> > >
> > > In other words, once we have achieved that all page table pages are
> > > protected by RCU, we can completely remove the page table pages from
> > > the protection of mmap locks.
> >
> > Interesting - so on reclaim/migrate we are just clearing PTE entries with
> > the rmap lock right? Would this lead to a future where we could also tear
> > down page tables there?
> >
> > Another point to remember is that when we are clearing down higher level
> > page tables in the general case, the logic assumes nothing else can touch
> > anything... we hold both rmap lock AND mmap/vma locks at this point.
> >
> > But I guess if we're RCU-safe, we're same even from rmap right?
>
> Yeah, and we have already done something similar. For more details,
> please refer to retract_page_tables(). It only holds i_mmap_rwsem read
> lock and then calls pte_free_defer() to free the PTE page through RCU.

Yeah, but that i_mmap_rwsem is important :) as it protects against other
rmap users.

Interesting that we only do this for shmem case not anon...

>
> For migrate case, the pte entry will store a migrate entry, right? And a
> new physical page will be installed soon through a page fault, so I
> don't think it is necessary to free the corresponding PTE page.

Yeah.

>
> For reclaim case, there is a problem that only PTE entries that mapped
> to a physical page are operated each time. If we want to free the entire
> PTE page, we need to check the adjacent PTE entries. Maybe MGLRU can
> help with this. I remember that MGLRU has an optimization that will check
> the adjacent PTE entries.

Yeah indeed, we'd need to take the 'very simple' reclaim code and have it
do _even more_ in this case :P

>
> >
> > >
> > > Here are some of my previous thoughts:
> > >
> > > ```
> > > Another plan
> > > ============
> > >
> > > Currently, page table modification are protected by page table locks
> > > (page_table_lock or split pmd/pte lock), but the life cycle of page
> > > table pages are protected by mmap_lock (and vma lock). For more details,
> > > please refer to the latest added Documentation/mm/process_addrs.rst file.
> > >
> > > Currently we try to free the PTE pages through RCU when
> > > CONFIG_PT_RECLAIM is turned on. In this case, we will no longer
> > > need to hold mmap_lock for the read/write op on the PTE pages.
> > >
> > > So maybe we can remove the page table from the protection of the mmap
> > > lock (which is too big), like this:
> > >
> > > 1. free all levels of page table pages by RCU, not just PTE pages, but
> > >     also pmd, pud, etc.
> > > 2. similar to pte_offset_map/pte_unmap, add
> > >     [pmd|pud]_offset_map/[pmd|pud]_unmap, and make them all contain
> > >     rcu_read_lock/rcu_read_unlcok, and make them accept failure.
> > >
> > > In this way, we no longer need the mmap lock. For readers, such as page
> > > table wallers, we are already in the critical section of RCU. For
> > > writers, we only need to hold the page table lock.
> > >
> > > But there is a difficulty here, that is, the RCU critical section is not
> > > allowed to sleep, but it is possible to sleep in the callback function
> > > of .pmd_entry, such as mmu_notifier_invalidate_range_start().
> > >
> > > Use SRCU instead? Or use RCU + refcount method? Not sure. But I think
> > > it's an interesting thing to try.
> >
> > Thanks for the information, RCU freeing of page tables is something of a
>
> RCU-freeing is relatively simple, tlb_remove_table() can be easily
> changed to free all levels of page table pages through RCU. The more
> difficult is to protect the page table pages above PTE level through RCU
> lock.
>
> > long-term TODO discussed back and forth :) might take a look myself if
> > somebody else hasn't grabbed when I have a second...
>
> This is awesome, I'm stuck with some other stuff at the moment, I'll
> also take a look at it later when I have time.

Yeah, I guess good to ping on-list if/when one of us/somebody else takes a
look to synchronise :)

>
> >
> > Is it _only_ the mmu notifier sleeping in this scenario? Or are there other
> > examples?
>
> I'm not sure, need some investigation.
>
> >
> > We could in theory always add another callback .pmd_entry_sleep or
> > something for this one case and document the requirement...
>
> Maybe, but the SRCU critical section cannot prevent the PTE page from
> being freed via RCU. :(

Idea is we'd fall back to non-RCU in this case and take locks... but then
ugh we'd race everything RCU and no it's all or nothing isn't it?

Overall - I will stash this response somewhere and come back to it if
somebody else doesn't in the meantime :)

>
> Thanks!
>
> >
> > > ```
> > >
> > > Thanks!
> > >
> > >
> >
> > Cheers, Lorenzo
>
