Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E492222CC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628266; cv=fail; b=VZLBTPhuan4Ib6FyoPihY+/SPRzJLKcjWwe4FDxAbA15ehXGx7GxSvhemipIO/Xsz5yvokMUqipqJPuKDHiF6vynhCRjhN1aMI/nMSRv2SLLXkZYlJ+gAkV3DZzyc/8KZ4nnenqaklQCM25DMm3zd+IAQDkI15FqmRbbHsV93cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628266; c=relaxed/simple;
	bh=otXdF0vb0jL/0uIWOihyUMBM3agVowPTBsE8v9WowzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cAnKQMHsPKc9wuyfliLkJdLEZu+Y4Sqp2A1YS2xEC9Ck5Mg10DY3lBodv7m+9S/ZJXajUGEujYPNwFSU4O/sTUG13io6L/VRk78VDmY3uQ4WAGsfw4QjIbzvqqZUVI5HiN2pA2JNK30OHUwJGKAJnekYo3r65U8Z/xtOYxEhMMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dssVpGAs; arc=fail smtp.client-ip=40.107.243.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dssVpGAs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9vgeZNzYPATjeK3KPSMxE+TDRYj5vf4JBGk/OtQXWKcuYiudfPu1ynm9Swt27C94yU1X4VfJu2DdW/2+LAqG1hnFrLTXLgy8uyzIQ++ZUXuvpWFN8o66XgYGIK9bUtzIHsbvnCT2Q52Q4cRcbyisdymOTDkQMLPMLf5a7dyBjjNAj/fAP0eDh9RCHo8ZOTIgOGlK6AHtZA4kStpwLiraOmAbCeH1xm9kJ0Ft1kovHSwZKbqVFP97N9eYSassXNzoUVPMYGFtuA4Z4iWVeaIc/v7fIYWxMLoLfUk2eKgo/cyvTtNRaQWFmAdYUu8w2/hKgegA0O/1C0Ksy7vR5+H/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UKXtznKOaFZ4pSRjK1pE58gDQeuNSepEvfBBVj6Dzc=;
 b=FsN5/wzbJnauUPrOyKrL+Qx422h/LV+BpPp2aCsVRbZz6fMNwD3PHOpp1FdItrYTELLKE3mulb7pEXA2baenEn90MZLR+Zv+on5RF0/Ijl+1i8qI/lfhN8tGo6teeUn32s+2Kp0n6szvWgXLg2/Q1nSQhn6sDHygUpPIs51S+kX61Se09dajwC9GJVqf/otEG2kYUll0JZZds/OoiSROahCkZxN2/5bgbnrRs8RORIF1eXnn0clSxjGgOQS4bkwiu0ya58JuOutUlvN2H8c2LABBm6JbMqf47oRu46/wI+0BT7MrCZcRa0MXcXWJ/U/rSrBvZCvJ2CrF2n51XOfmEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UKXtznKOaFZ4pSRjK1pE58gDQeuNSepEvfBBVj6Dzc=;
 b=dssVpGAspOwAJqpUlB9MbWZeedrjoM8QHzjKKKCvaINiZ+ewOQQyFEFG6A96dK3//HAEJ50OOXlX6HWiCNDRod2Qu2XdaZSYL7ifLwFGiJligQ76QKodfljnDInm0RVFjWPweMQGp/12slx6C23Tk9HZ2vPF0+RtytQxZ1XfhkJ1WBQ/c6XIH1OFFboOgudzBbZxkeHoJ3VKrn86PxGtySZ72ySpEbn3ZLEQxFrHcOd3njaRZzerhN4PD9U7j/93V/nPH+tXpk3B+JE63u/Q+YYWVSJHvC/SImcPeSnh8EG5BzxCsex0+KU1uNkzCyHSVF5MHZMXnQ0caZY4Rbw6Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH8PR12MB6867.namprd12.prod.outlook.com (2603:10b6:510:1ca::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Fri, 4 Jul 2025 11:24:20 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 11:24:20 +0000
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
Subject: Re: [v1 resend 08/12] mm/thp: add split during migration support
Date: Fri, 04 Jul 2025 07:24:17 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <D129A3F2-D79C-482E-BC70-A26C781B149E@nvidia.com>
In-Reply-To: <20250703233511.2028395-9-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-9-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0367.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::12) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH8PR12MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 60138a87-c51f-4cc6-f4fe-08ddbaed51fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2tUUmZ2ZDhhOWZRTGpFZTBBTDA0bHhaL3lvVkc2SDR2WTVhTGcvSDNvSVhn?=
 =?utf-8?B?YU9WdVl4RUoxOUE3V2FtelZsMmkvSGVuUWlqTldLYmloa2g2ZUxCNFllSTMy?=
 =?utf-8?B?NXY1TkNIdnVOeTc0cXhNZ3pzdm81aG1xVWxUZHl6eHY2a1M1QkJQUm9ES1I2?=
 =?utf-8?B?Q0xSTWJUdkgvVDRkU0xOMEtIM1d3U3lJOGJLNWdURnBkUVp3QWYrSS9BYVBK?=
 =?utf-8?B?bUdYWmk5TE4vNVZmVHJ2SGtMVTVOV3dhWWd4RE5HVzVuMmVRNkU3SEt2Qzlm?=
 =?utf-8?B?VFh1UmRrYWM0SVphdTZHVmUvL1RkSlpXTkNqUjBiZTl4b0ovQk1obXppamhw?=
 =?utf-8?B?MFBKNmpUYS80bzM2Y2xyTHpqdWN3dzZKZkJoMjhCdjBPdnVYVWRycW5kTE5O?=
 =?utf-8?B?T1pyNWxEdWxjZmhZeGRGcnErKys4SmVWOGNvM0w5dUs1c1RmMTBHTW95V0lS?=
 =?utf-8?B?WFVVK0N2dVZmalZ5ampDdzlCbTRxQ1EwREhMRFFLb05rM1RoQ2Z6eWdweXB2?=
 =?utf-8?B?TFlKME03V1pBTHROS1VxM040QmNvRVc2U3VFK0ZuRkdqWEZYZmxKUkZvaXRV?=
 =?utf-8?B?bHZDTVdIdERZYm0yMklaeTVKYlNnZUhDTDc3cTgwYTR6UXBTSUt2cmlSUkJ6?=
 =?utf-8?B?NUVXKys3WndXSUFxb3dKMjBLMzJSd2tWTjlHTU14TXdXdTV1VUVHOFcyUUE0?=
 =?utf-8?B?WWtTSm0zdEEvK1FYVkVNbDdNOWRmQ3RFZXFIamwrQ0xpMXpiYlhVUVZIdEhT?=
 =?utf-8?B?N1lWS1BMWE9CSXBCNzQvcEIvRHBUTUY0dUNPcVBMcnZDRUpobDdJU0tsczI4?=
 =?utf-8?B?L0FMejhlTlNUQi9DbzNlc1NrV2NoSGdEWThydWd1OURIK0dwajB6VGFZZ1JL?=
 =?utf-8?B?MnhWSFNoY1g2WHpsWkZqSVhZSlF4cWtnQmc1RGtySEtNbHIwdG9YT015TW5s?=
 =?utf-8?B?dE9ydUw1a3hzNjJWWDJWV0dKdmZxOFJaMW83WEo5aGRRVlB6c0YxOGFST0kz?=
 =?utf-8?B?QU1pRFdZNEd2d1lpdXQ1WWFKc2FKa05nbGlsQ0lFUXRxaTVwV3lTVk9ER2hW?=
 =?utf-8?B?aUxsVEFTNXYzRHorN1d4eWNhQm43Z2NXSkxOY1Z2QjZ0TVM3TmNZV0NPM0pX?=
 =?utf-8?B?VjBLK1E2S3BGdmRIaFJEUU1RWWlJNVVtaXlBUzhMTlZPUGFVNzd6N0ZGQjA2?=
 =?utf-8?B?WjNBNWRkbFMzdVhGa21VeEF1OXVLYmhzelZESGNkVitYRjN1Q2Yzem80Qkl0?=
 =?utf-8?B?Nk5lZTlFK0tqNmNESlhMRUFNdlI3Z3VxRDVDN001RzlXajZldUZlT3lOaGVn?=
 =?utf-8?B?MzdIYmlHZ3VVN0MycHhJNks1NzBnQ2RiUXZhY3lqOGpkdEw4MC94aGl1Z3pZ?=
 =?utf-8?B?S09XakZZUm9EbWZBTG1rbnEvTGVTWElqQXVvejYvOHl3eFdkUFk5L2F1TXFM?=
 =?utf-8?B?aU5FQ29QQ1JESFpGTlAzSXhmeXpRWTBKZWN1ZlE3OGxpbnBhajN0Sk1wMFQv?=
 =?utf-8?B?YmMzREtrTi9uVzBzMjYrRnpjRXJyTmpielRVWnZLT3Z3dFpXQnhJZVJUNDVY?=
 =?utf-8?B?OWlIcTVKaS8zK1kxQWhzMHpSQ3FodXVDY1ovV1JWTUdnRXVlamVFTWQ2K0ts?=
 =?utf-8?B?U1ovdFZSYmlnK285dTFvUnpXYUt0UjdMRE04UjRjY1p1Z3l5SWR4emRTSWdn?=
 =?utf-8?B?V2VRcFJUTC9GOVdYU1k1TTNGMHh3Nm1sUEJzRTl0ci91UmwzV3dzc1VCRmRL?=
 =?utf-8?B?OXFQSDZxTGQ5YlhIbmJSODFaUWdkN2F2QXlXL2Vyekd3UG9KMW9zU2lqUkdl?=
 =?utf-8?B?dEg2R0VCbWxjdDBPSkttbTVwdW9ENjN0dS9xT0F4aXJlbldsQlJFQXA0T2Rt?=
 =?utf-8?B?bUprNHRwTDNwTklUZjhETGM3VTJldVh4R0dSREwrV1JzRnpqeVhJRmVza25z?=
 =?utf-8?Q?9pQIZwMMCyg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHVHbmtTNHBmT1ZXdzVzMlBOejVwaHlrc3VrNVozRHdHNzJjcFhtWG9vV25G?=
 =?utf-8?B?em0wb2FlTXVOVVFvUTg2clJWNDU1NG5NK1BndmhYaXNKOTlDbHFRU050WGdi?=
 =?utf-8?B?eW5vdzZhMGUxcVdiNDdneU1zZTB3a2NyVndOZnBubXZmbVlUa2RMVmpQL1JW?=
 =?utf-8?B?RDZlNFc4eFFneDZMOFVsMC8zVTR4T2JUWVJybU9ERWh1QlFXZ01nRzlOVVVh?=
 =?utf-8?B?dkozSzBVamlEWDlnUVpDSU1TSERkTDlDRUk0Yk4yWkhiTmFuT1krdzkybzlu?=
 =?utf-8?B?NmY0MUtjTWRiT3FLNWFQci9CWCtaNGRiK0YvcXBCQWk2dXpmS0JuQTFzWjJt?=
 =?utf-8?B?V1FSMkQxQ0tvMi85eFo1OW9idkl5bGVxdTVhMUcyV1lQTXhhZnVjcnJDK3NU?=
 =?utf-8?B?TkdOSVJZUjEyU0xJbTN1TzR5c3VRN3VWTnJ4akh5SmI5RmMrUjNyem1SeXE2?=
 =?utf-8?B?VlIwV2dBYUZPWUYwMDhxdmVGVFlxYVBpNGRKbmZOcCsvYXFCUU5uWWVIb1hi?=
 =?utf-8?B?Y3VzVTVrUmNaeitNd0lhdER3T08zUTJNUUNIbHJBaDRRdCtFN1F5UHpTK2J0?=
 =?utf-8?B?dmlOWUN3VGk5ekcwcTBQRlZOMFM1MTl0cFhOTWJQQVBRek9SOEVqWVNnUUtp?=
 =?utf-8?B?TkhZanJlVkVla3p6R3Y3TW1CUGxJWm12NmJDNG9NTFhmUWxNa0ZQS1NDMWtX?=
 =?utf-8?B?QTdsL3RUcWxzZmhLeEVFWVpoQVd3ZndXNitkRHhqZkZMRnJHK2J1R1VmbHFQ?=
 =?utf-8?B?bm9vbWthTGJGT1RsYi9yQm55dDIycjVkSzJiOUxRMUxxVm1KZ1Y2NHYvSWpy?=
 =?utf-8?B?YitEOXl4UWJpRVcwSm5PVGtrTWNlTmNGa3k2OGlncUhmcCtkK2FhcGFHMXQz?=
 =?utf-8?B?WDhnYW0zQ0Z4Y0Yvb0xSMW9qbFZpeU9SOC9BaWpla2RMMkNueFR4czJ4dEtq?=
 =?utf-8?B?bUF2SWJrKzNjT0xOU2hRRVNlQkNNT25RRmhLTjZyREsrVDFjUDc0MFFvTnJK?=
 =?utf-8?B?d3lYcEwvbTdiOXRPc1RSVHgwSEw5TGp2S0xpSWxnMGJaZzE0U0xCUElwU2Fq?=
 =?utf-8?B?TXNKdW52T3p1RUFmemdhbnNqaS84QktXTkZKaE5raGZudUxpZ1hHQUdnWFpM?=
 =?utf-8?B?MXRvY2tLYnZBamZlODJpL2o5K1VNQzB2RnpGYVoyU3VWa3plQkpJUWlKRWt4?=
 =?utf-8?B?UmFXVnZtUlhlNGFkOEpxa2dHUWtBMlg0NmVEdFhtb0pxMitRWDhQK1ZyZ3hG?=
 =?utf-8?B?UnBnNlpKZ1IzMEtoU1liZDI5bEhVYnpJZ2ZNZHFGRCtQWEJaVDI2TUNLQ1du?=
 =?utf-8?B?SnVsaDRvTHo3Sm9XV2J5TUJUS0xNNTkvOGZDZUU5QS9QYytBbWRwRTNNWEh6?=
 =?utf-8?B?NkVFczVSdmxhN0hXT2xidG5SUjRPaHdKVm10dnptUkZJSVVoaFUyQk9uYWlq?=
 =?utf-8?B?MUJrRWNzYm1WZkYyNFVzaFczZVJmYjlBR1JKRkY1cTZYb1lEc3J1czBQRGlF?=
 =?utf-8?B?a2tpQ2xCVEpRVmJhNzR2MGs5bDB3Y2NoZ2pvaU0rMUdqRDhhaXhoeGhxMndr?=
 =?utf-8?B?eFpPS0FOanAvUTFlTHpPZ1p2Z3J6M1RJcC90L0RTNDVmR2lPKzVOcG9UNkE3?=
 =?utf-8?B?VllBK1RoOWFGQTVnbGM2ek0wWVpLdkw1VkVOR1owUWcxUllmNS9yRnExU2J2?=
 =?utf-8?B?cVZsd0xaaTNWUE9xZnNmNFo1ZEZCTTBLVU0xTGp1eHdHVnJFUDBCT2RsbVEx?=
 =?utf-8?B?OStIK0NzSmdhb1lra1BMY2UwN2tXU0tyeThuMG9ZQkUvaG5aYzN3d0UrbXRo?=
 =?utf-8?B?aWRwZWwvOUJBN29QMUhXblJ0K1ZGRW9Nakxpc1BXWjdFMENTdlNJd2xkVEJw?=
 =?utf-8?B?UXN5YW00Rm5BUUllNVdPTlBRVTc0MkZ0cmM0czdkMlA2R29lMWltYjZyRFIv?=
 =?utf-8?B?SzIwcktjRmJiMm1mY0Y2S2YwV1dJZFhjVzB2N1VPRWNBZWY5eTR6SS9hUysw?=
 =?utf-8?B?WlFPMUVHSU1aWmxVbHlrLzFGakpSa2ZxVjhvR0wzQzZ3RkRMUlF5em1ZZHhY?=
 =?utf-8?B?MVJOT0lkK1UrZ1ZncFRuMzJuVzBFaHBqS1lFWDAvUlJkQ1poUmV6blhtakM3?=
 =?utf-8?Q?9/5IOsLGNCKHM+YJ1mUKVIlZg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60138a87-c51f-4cc6-f4fe-08ddbaed51fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 11:24:20.3289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGy62l7QCzPJDr8ppBZON7b9p00ymn1mkcXH8H6P5iYHcmwijeMzE2ITRhGxSP7R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6867

On 3 Jul 2025, at 19:35, Balbir Singh wrote:

> Support splitting pages during THP zone device migration as needed.
> The common case that arises is that after setup, during migrate
> the destination might not be able to allocate MIGRATE_PFN_COMPOUND
> pages.
>
> Add a new routine migrate_vma_split_pages() to support the splitting
> of already isolated pages. The pages being migrated are already unmapped
> and marked for migration during setup (via unmap). folio_split() and
> __split_unmapped_folio() take additional isolated arguments, to avoid
> unmapping and remaping these pages and unlocking/putting the folio.
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
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/huge_mm.h | 11 ++++++--
>  mm/huge_memory.c        | 54 ++++++++++++++++++++-----------------
>  mm/migrate_device.c     | 59 ++++++++++++++++++++++++++++++++---------
>  3 files changed, 85 insertions(+), 39 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 65a1bdf29bb9..5f55a754e57c 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -343,8 +343,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct fi=
le *filp, unsigned long add
>  		vm_flags_t vm_flags);
>
>  bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_p=
ins);
> -int split_huge_page_to_list_to_order(struct page *page, struct list_head=
 *list,
> -		unsigned int new_order);
> +int __split_huge_page_to_list_to_order(struct page *page, struct list_he=
ad *list,
> +		unsigned int new_order, bool isolated);
>  int min_order_for_split(struct folio *folio);
>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>  bool uniform_split_supported(struct folio *folio, unsigned int new_order=
,
> @@ -353,6 +353,13 @@ bool non_uniform_split_supported(struct folio *folio=
, unsigned int new_order,
>  		bool warns);
>  int folio_split(struct folio *folio, unsigned int new_order, struct page=
 *page,
>  		struct list_head *list);
> +
> +static inline int split_huge_page_to_list_to_order(struct page *page, st=
ruct list_head *list,
> +		unsigned int new_order)
> +{
> +	return __split_huge_page_to_list_to_order(page, list, new_order, false)=
;
> +}
> +
>  /*
>   * try_folio_split - try to split a @folio at @page using non uniform sp=
lit.
>   * @folio: folio to be split
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index d55e36ae0c39..e00ddfed22fa 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3424,15 +3424,6 @@ static void __split_folio_to_order(struct folio *f=
olio, int old_order,
>  		new_folio->mapping =3D folio->mapping;
>  		new_folio->index =3D folio->index + i;
>
> -		/*
> -		 * page->private should not be set in tail pages. Fix up and warn once
> -		 * if private is unexpectedly set.
> -		 */
> -		if (unlikely(new_folio->private)) {
> -			VM_WARN_ON_ONCE_PAGE(true, new_head);
> -			new_folio->private =3D NULL;
> -		}
> -
>  		if (folio_test_swapcache(folio))
>  			new_folio->swap.val =3D folio->swap.val + i;
>
> @@ -3519,7 +3510,7 @@ static int __split_unmapped_folio(struct folio *fol=
io, int new_order,
>  		struct page *split_at, struct page *lock_at,
>  		struct list_head *list, pgoff_t end,
>  		struct xa_state *xas, struct address_space *mapping,
> -		bool uniform_split)
> +		bool uniform_split, bool isolated)
>  {
>  	struct lruvec *lruvec;
>  	struct address_space *swap_cache =3D NULL;
> @@ -3643,8 +3634,9 @@ static int __split_unmapped_folio(struct folio *fol=
io, int new_order,
>  				percpu_ref_get_many(&release->pgmap->ref,
>  							(1 << new_order) - 1);
>
> -			lru_add_split_folio(origin_folio, release, lruvec,
> -					list);
> +			if (!isolated)
> +				lru_add_split_folio(origin_folio, release,
> +							lruvec, list);
>
>  			/* Some pages can be beyond EOF: drop them from cache */
>  			if (release->index >=3D end) {
> @@ -3697,6 +3689,12 @@ static int __split_unmapped_folio(struct folio *fo=
lio, int new_order,
>  	if (nr_dropped)
>  		shmem_uncharge(mapping->host, nr_dropped);
>
> +	/*
> +	 * Don't remap and unlock isolated folios
> +	 */
> +	if (isolated)
> +		return ret;
> +
>  	remap_page(origin_folio, 1 << order,
>  			folio_test_anon(origin_folio) ?
>  				RMP_USE_SHARED_ZEROPAGE : 0);
> @@ -3790,6 +3788,7 @@ bool uniform_split_supported(struct folio *folio, u=
nsigned int new_order,
>   * @lock_at: a page within @folio to be left locked to caller
>   * @list: after-split folios will be put on it if non NULL
>   * @uniform_split: perform uniform split or not (non-uniform split)
> + * @isolated: The pages are already unmapped

s/pages/folio

Why name it isolated if the folio is unmapped? Isolated folios often mean
they are removed from LRU lists. isolated here causes confusion.

>   *
>   * It calls __split_unmapped_folio() to perform uniform and non-uniform =
split.
>   * It is in charge of checking whether the split is supported or not and
> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *folio, u=
nsigned int new_order,
>   */
>  static int __folio_split(struct folio *folio, unsigned int new_order,
>  		struct page *split_at, struct page *lock_at,
> -		struct list_head *list, bool uniform_split)
> +		struct list_head *list, bool uniform_split, bool isolated)
>  {
>  	struct deferred_split *ds_queue =3D get_deferred_split_queue(folio);
>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
>  		 * is taken to serialise against parallel split or collapse
>  		 * operations.
>  		 */
> -		anon_vma =3D folio_get_anon_vma(folio);
> -		if (!anon_vma) {
> -			ret =3D -EBUSY;
> -			goto out;
> +		if (!isolated) {
> +			anon_vma =3D folio_get_anon_vma(folio);
> +			if (!anon_vma) {
> +				ret =3D -EBUSY;
> +				goto out;
> +			}
> +			anon_vma_lock_write(anon_vma);
>  		}
>  		end =3D -1;
>  		mapping =3D NULL;
> -		anon_vma_lock_write(anon_vma);
>  	} else {
>  		unsigned int min_order;
>  		gfp_t gfp;
> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *folio, unsig=
ned int new_order,
>  		goto out_unlock;
>  	}
>
> -	unmap_folio(folio);
> +	if (!isolated)
> +		unmap_folio(folio);
>
>  	/* block interrupt reentry in xa_lock and spinlock */
>  	local_irq_disable();
> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
>
>  		ret =3D __split_unmapped_folio(folio, new_order,
>  				split_at, lock_at, list, end, &xas, mapping,
> -				uniform_split);
> +				uniform_split, isolated);
>  	} else {
>  		spin_unlock(&ds_queue->split_queue_lock);
>  fail:
>  		if (mapping)
>  			xas_unlock(&xas);
>  		local_irq_enable();
> -		remap_page(folio, folio_nr_pages(folio), 0);
> +		if (!isolated)
> +			remap_page(folio, folio_nr_pages(folio), 0);
>  		ret =3D -EAGAIN;
>  	}

These "isolated" special handlings does not look good, I wonder if there
is a way of letting split code handle device private folios more gracefully=
.
It also causes confusions, since why does "isolated/unmapped" folios
not need to unmap_page(), remap_page(), or unlock?


>
> @@ -4046,12 +4049,13 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
>   * Returns -EINVAL when trying to split to an order that is incompatible
>   * with the folio. Splitting to order 0 is compatible with all folios.
>   */
> -int split_huge_page_to_list_to_order(struct page *page, struct list_head=
 *list,
> -				     unsigned int new_order)
> +int __split_huge_page_to_list_to_order(struct page *page, struct list_he=
ad *list,
> +				     unsigned int new_order, bool isolated)
>  {
>  	struct folio *folio =3D page_folio(page);
>
> -	return __folio_split(folio, new_order, &folio->page, page, list, true);
> +	return __folio_split(folio, new_order, &folio->page, page, list, true,
> +				isolated);
>  }
>
>  /*
> @@ -4080,7 +4084,7 @@ int folio_split(struct folio *folio, unsigned int n=
ew_order,
>  		struct page *split_at, struct list_head *list)
>  {
>  	return __folio_split(folio, new_order, split_at, &folio->page, list,
> -			false);
> +			false, false);
>  }
>
>  int min_order_for_split(struct folio *folio)
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 41d0bd787969..acd2f03b178d 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -813,6 +813,24 @@ static int migrate_vma_insert_huge_pmd_page(struct m=
igrate_vma *migrate,
>  		src[i] &=3D ~MIGRATE_PFN_MIGRATE;
>  	return 0;
>  }
> +
> +static void migrate_vma_split_pages(struct migrate_vma *migrate,
> +					unsigned long idx, unsigned long addr,
> +					struct folio *folio)
> +{
> +	unsigned long i;
> +	unsigned long pfn;
> +	unsigned long flags;
> +
> +	folio_get(folio);
> +	split_huge_pmd_address(migrate->vma, addr, true);
> +	__split_huge_page_to_list_to_order(folio_page(folio, 0), NULL, 0, true)=
;

If you need to split PMD entries here, why not let unmap_page() and remap_p=
age()
in split code does that?

--
Best Regards,
Yan, Zi
