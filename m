Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FDB79F2
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751675178; cv=fail; b=nPxL9AFcrXsLjxe55vPXi+xiAKl4Vc2wyKeN6L9OLQ+Ua5eWKl8MRZrRJuyXDEn5duAuEsPEAFATmkLeEe3mTN0lRwHvOBYfG3gNbDZuGfUUuoA2ZEYBP3d9v1OtbZ6LPNYC88joqdT1nGI71/fTIaNyD/J8NOWtHbdNozin9ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751675178; c=relaxed/simple;
	bh=lRq0DmpgbnnYw9JeQ+pBzg6F5yircqQzF25qLrx/MpE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MgPU42+SiT4D1pXXibl4ixW3zmD+3D5lMEgcusq4Y+uw4tk+FuVKEMIPeF/P6OLXb0Oc0iRbO1U2jcwKRNYmDIfQO2DmaQ6r8ac0FA4CvLMwAn5wS9kwsNTdV7MOma8NWT3UhXFYxBUJd/rNdSv68b48QZ5aXofc0S+nyxhjras=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qq4UsxBH; arc=fail smtp.client-ip=40.107.236.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qq4UsxBH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAYVwxXSQP/KmIWohZL5sIvYumOvVZOt7TXYRwAv1YF0jaOPSFRODdoVmolhJpA75uTBvLTzo6QhGrAN9nLI6Q9bV8Ce+i5GSwQE4esZLakopFRB5IGAhQCVGCTtrrs0P7DVKFCDG+VK5mECJP+4tdNSwEJHL4EHnvM8LeRAW0jO2e/7CRlo+Wii71Nw8I4bdI5SsuBm8JDuJNrL3xNw2gKXCis7kcy3Ipiuc368NOjAfz9Uc+F0gX2G1oA/m8AiYRpJiYv1ifPrHj8SO3buuL+Q9d4yGILqTcVGF3PXFJfVUAQDIAmtqsU719sqQSC4gZYZp5vw9/7fLJ3AlMUOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egNJx9S9jNpbPckW/O/Q47X53sAEZM2Q27QwjSeX6Bk=;
 b=o1jYKAZ22rFnSOdE18v1Lov5JPq0alBldEPTYLqKexTm9c1AwzZC3oVf2RVyxVitmLjQwbWi8K5uZ2DKnHnZZUdCd+JXbDKFF564sFvar45wa0IqROSGQI9HmQIV+xTwj0NhJd5LOw9n1wynDGYOD1YOl3Z9s/onhA/9kxnN6pFz9lGFkYkoWPxGUgfzU3iJPz9Al0s2r7zEkszuARkRr2KzcO600oH8SLCytFHcWQnHMmfxuEPyhW1xXiaTa+Yy6UvpcK5VhTU5urPkNnSpTHxnj8/cU1H15Lpn1QPl6etijF7sF/CJJJW8GsJKBMu3WCIYT8FFXzEhzsHpT7VDNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egNJx9S9jNpbPckW/O/Q47X53sAEZM2Q27QwjSeX6Bk=;
 b=Qq4UsxBHbJShdpfEiWDp1Ri1vBXs40uQsKqcH3UYR+XO5QmBc0w/h63HIr+3gd+F2CP++q7vcsY0A8hlTv17FDmkUf4CK8gTzD4PBPxXSFZp+qd6ZT4PpM4Op0DU0fFFMVTK9xnaVWV/TC6HHOIDZKGjE69LcPhdQXIeId5O6XPRNLIPuO/k1OCQ1lHFR86ggI7dq49FEHPf+5X8iZxuAxglU3PE4vkzUF+oTBT0H+JWpkn7CYKhyVySdtKXPS0zmQot/evmf0XOPOlQDVnOgAC7SVKJTvnfsfbZyrlX6wXXRm71F7MI7Ocn7RBbl0CS7o1v8R1VisV2PjyTnD3QjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB8348.namprd12.prod.outlook.com (2603:10b6:8:e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Sat, 5 Jul
 2025 00:26:12 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8901.021; Sat, 5 Jul 2025
 00:26:12 +0000
Message-ID: <b25b3610-5755-4b7e-9a9f-d7f1dc3e4bdc@nvidia.com>
Date: Sat, 5 Jul 2025 10:26:05 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 08/12] mm/thp: add split during migration support
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
 <20250703233511.2028395-9-balbirs@nvidia.com>
 <e1889eb8-d2d9-4d97-b9ae-e50158442945@redhat.com>
 <715fc271-1af3-4061-b217-e3d6e32849c6@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <715fc271-1af3-4061-b217-e3d6e32849c6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:a03:255::15) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: e598c423-761e-468a-99df-08ddbb5a8b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnZvRFpiMER6Vk9mY3o4WGdmRGpOL3NhQWhOZzhmQ3UzMXNjdHVEVzhKdTVz?=
 =?utf-8?B?KzhQNWJyb1hXaUJzNzBueTc1T3R5MVg1RW81TEZuYVlyelZVUVRuSjFINXBN?=
 =?utf-8?B?QkhMWms5ZzFSVVA2amk2VmlMQzlOZ0dYTGdpdTdUWU5WOE8xMkZXS2t0QlNM?=
 =?utf-8?B?R0kxZXpyNVQ3Wmp1YUV4SXNkZThYdzk1NXVocUsvMHZxTCtkazRFby9jTUY0?=
 =?utf-8?B?MmM2YmhkQklQNHBrSnFyMzlKQW9PU2UyV3p4UitwTWhMbllNbDhlekZoZW03?=
 =?utf-8?B?SCtkQnpxeCtzU1NPOWd2QTFPZ0xqQ1kvZEJmb2x1U3p6YitIUFBSQTdLclZl?=
 =?utf-8?B?N0NWVmhUNHRsQ2o0MHVkNXVvWklUSU9wUGMrcjF2NzI4akFmRE5rK1BpOVZJ?=
 =?utf-8?B?ZUE1cU1QWmpCQ24wWXQzeTM4cGRBNHpvYnpMMm9BYXJnbUY4YU9LWm1VWU1L?=
 =?utf-8?B?K2dqNEk3ZDZXZUJmbFZ4WHpHWWJhK2JscGZHNklzRGVDbzMybnRGbHBWVUtW?=
 =?utf-8?B?Um5KWFVYaW1XRnBybmdvN0xhYjRCcXRtcTVnQkFPTDJPbnJsYTFEOTdoUWI3?=
 =?utf-8?B?VUt1LzJSUlRBZTFSZlNpdER1dDNSUFRGeHA2amQzeG5NdklnaVpTR3ZRTFdj?=
 =?utf-8?B?YzNkV29yTy9jY1pZSlVHa0hjdW5kNUgweWRrdEZLemlJb2pURjRGUXMrbFJE?=
 =?utf-8?B?ekR1em1IaytOZVR6L0FuSU1UcnNpSndFaC85WnFlaEhjZmZYUGRNUEZUWm84?=
 =?utf-8?B?bmNBcEdvaU9UVkF2K0tZbnBWSk0rbUFVWlRtRG4yOGJVYkFEZUM0RmZ4RlpZ?=
 =?utf-8?B?M0d5ZFBidGdBcFR2UlR1TmlPSXVrZGp4YkVPRDV5VitIb2FmOFBRemNxTkhB?=
 =?utf-8?B?Tmx4M0tab0trQjc0US9hcDE5NFVKMHIrSnhWUy94em44YUhVMGhrc0RsWUk3?=
 =?utf-8?B?Y3ZIK3g4TmU2VmNoRmhrSWx4aE5zd0ZRNlkzY2ViM1V4bTFSSlJ3RFlyWm1D?=
 =?utf-8?B?eTJuZTA3VzhqaEN0MDdkTkk0cGFmcjZHb1pRYnMvQlFpRnVlbVBQdnI3YS9z?=
 =?utf-8?B?UzF3SVJEMGIvbnJEb2czMDRwSm5BWmUyWDVscTBZQm5FamxUWW1NdVAzMjlH?=
 =?utf-8?B?bEtBSVBjZDJEYS9oWmVvbmhMYzIyQjJwVGJWT25OK3dhQ0VxRzBJdTUzUEV4?=
 =?utf-8?B?RnlTQUNITkpwdCtXN1VzeVY4Nk5QNm9WSktEeEVhbGZOWnkxTWFkKzlZZUlU?=
 =?utf-8?B?a3lHL1BnUFRZcnBCM3JJbWUzTjFrckI2eVU2NHFDZU80OVRac3ZERWY3Tk1q?=
 =?utf-8?B?TWd5UStnUHlLUkFvMlhtU2RlMXpnb0dMZmdkcnhiV21QWUxQTnhkMXhmTHY3?=
 =?utf-8?B?RTh4WFRGM2p5dEdtYVFJWkI3eHliWW5LOHRsYjlhYWFhTXRUNXRZblZkWXBC?=
 =?utf-8?B?VnNHWUZUMXVLN2FveVZMZER1YlRURWRmR201WUN4TkFpaHJYVWUzM2hSRnV0?=
 =?utf-8?B?S2h2Mnp6czVSdFR4Z2EzVnBZTDk5SElQN21OK1FXOW1iN09qRTF4MUViL2J0?=
 =?utf-8?B?RExRVXc4T1V2WEY3Z3YzZU1lZmtvQytxWVhJQU54aXBXNjRRNTJFTVdLRXdq?=
 =?utf-8?B?NTJWQ2l2aUU3YUpJL1dIUGdPdjBoN0lNSFlMTUl5RjVxbWlGUGFHdmNzcnFl?=
 =?utf-8?B?dllzUTZSaDJZK244dXJaV2VzMDZnUDhRMXBxNzA0aUNOcVkxNjFXL2ppeUVx?=
 =?utf-8?B?OUdPWDNobmk4MnBlRi9zS2RCK0ZqcTZMNkc1SXFmU0Q5YVlSalhERGxyMUNS?=
 =?utf-8?B?QUI0UHFaN3g2eGZSQm9NZUhoTTNVSlZpenF0MWZnSnp1ckhvWjNFenVXV01m?=
 =?utf-8?B?cS84Y3FsTk5iYndRdzJyNzRWVzRTYXhoWW00SXlrWjkvN21ibU5zWDMwUzl3?=
 =?utf-8?Q?0LsVJxIrnrQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWtSYVpXSlpsVDliREwyUm82NWsrTmFrVXlPak8zeU9BWmY2d1R6c2NkN1o5?=
 =?utf-8?B?NlFnVkxockRkYUhOdERINnRJSDBiT0M0bEVEemJrOTJlSEVRWnIwaXpFd1ZF?=
 =?utf-8?B?OEhmeitlWDUwZTNUS1Q3MmpZcUFUUnpqdGtWTTlpNG4wYkhmeEhCenRCSUty?=
 =?utf-8?B?eENUWW9mK1hmQWR5MG5CTEh4UFQ3eW1tZHNJOW1qME5tMVZJeUpDak5aWHVk?=
 =?utf-8?B?ZUdYbWk0eEswRnFFb3VNN3hjRVlJWWJvZ2JHMzdxYTd0UGd6bDF5S0FBQkpM?=
 =?utf-8?B?bWxBT2lobzJrMzFLN21mb3dvREQ2SEc2L3hVZ25tK0dKWUhCYUR4QWdqYXVh?=
 =?utf-8?B?cndDTnEraGtXdDRaSVk3ZnJJUWZUWkxJMXI2UFcwUVRUSHRHZUoyOTZkcEhK?=
 =?utf-8?B?VUhJSnV4MkNaQ2gxbEQ5d2xvUVFhQkN0UGtXN3p3VXlXVWMvUkpkaHlvUVJK?=
 =?utf-8?B?ZU5PRlpDMloyME1Dc2Z1RkJOdGVXRisrajZrQUtqZnhYU2J4ekFXM0lUTEIv?=
 =?utf-8?B?Vi9lQkJFVzlFOVArYjBKNEhXTHR2RSt2TWEyeGgwUkJLZE5tYVRZV01aTERj?=
 =?utf-8?B?emZyMytnUDE3cnZkZmNvVW5yeGlNR081SngzZWQzQUkrZy9FdlRqZWtXanBn?=
 =?utf-8?B?eWpUay9iZGVsNGFMamsxY21OKzVnUjB2UkRhTWxCNnYvZTJlQWN1UURVWi9I?=
 =?utf-8?B?QTlGSGh0Ly9HU3c2bkF3K1YzWTVMaXpTUGJXanJKK3hVZGdVOW1nNXpXa01Q?=
 =?utf-8?B?QkFzWjVTV0E3cW9Pb3UzckJtZlVSNWJKL3BaNThuWlpHYXdrOXlIQVFtNGtl?=
 =?utf-8?B?V0hrdjF0YXFEemF1RzJ5alVsT1UwaW81WVlGeWw2ODdoSkVTanlOTzJacVRX?=
 =?utf-8?B?b2FmcktYWVJ4RXBrZUV3MUxTT1JvVWJIWWwwR01UWVRVUVQ2U3F4cDA3Y2FI?=
 =?utf-8?B?aDFDVVR5V0ltOEtqV0tSZTNXeUJENzRDYjBSaXYyNW1nS054TGRRY3g3cGxp?=
 =?utf-8?B?b2k0U09XM0I5WHR2TjFYWlB2QkxkY2k2RUVFMFFWRllhbWtaQVBhM3dKS1Vh?=
 =?utf-8?B?b3dJc0pYYkl0RGRPSkxwek9yeVJRSSt4djVIb3N6eVJ6ZnhvNmczcUdOTlI4?=
 =?utf-8?B?N0V1QW53b2RMTGQ2NEgyZmo2bDBIRWQvYjNxTG92ekRSeEtoanEvRVZzZXdm?=
 =?utf-8?B?T0I3RlEwL0U4a0hjeWNBcTRQenBDdGFIeThPQkFaMWRjZ1dWaEgvTnZHejBk?=
 =?utf-8?B?WUVvQ2lRdm0xZnczS0NvcmM4N3NJMGhjZDl3c0N0WEFHQ1lxbjJ2ZHVJTm5H?=
 =?utf-8?B?UU9Eb0Uwb3JwS1poRjkzZXFMUzBtYW44eXM3YllwZ0RTSUJDRWl0NmN1MUF2?=
 =?utf-8?B?NTE0RVV2MHJ1b1FDTi92WTR3V2RTVEJnNzZIaENMWEFIOWVScTBmdFFNRzB5?=
 =?utf-8?B?TEd5cGhIcmx3VzZKUlNkNHVyRDVQN0hwcHhvOEJ2WmtBVWQ0Q0cwaFBQQ0x0?=
 =?utf-8?B?UVpLRkJSYnZRV2hmd0RteFlLZ00zZHF0SDNaa0IwYXZXeVpIeUNEQkpYV1RG?=
 =?utf-8?B?TjZLTU9CUUVRTEJrVU13NTVMMDlIb1VETng4VVFraHNFMFRoY0xCZndKaDlq?=
 =?utf-8?B?NGQ2YU5OTVArb1BNY0lLSHE5N2VVWldKNmZnMEZLaWpCV3orZHJsZ1ZWcDhh?=
 =?utf-8?B?a2wxU3dDd1BRNTBvWHV0cmI4b2s4RmtLTkUxUGhhMmo0S3NYWHo3Wi9Xd3NE?=
 =?utf-8?B?ZmdkOXFhNDNIY3pNUGlIZ3cyRDg1ek5SK3Rkdi9JTFFGaUd6R1Z0N3hETWRT?=
 =?utf-8?B?ZjlBKyt5SU01ZXJIUndsMEkvdVgrVDc3NE1uN2xLOXhXditMTlduUzI5Z2pD?=
 =?utf-8?B?b0lXbU8zbmFyOC9CNXJGTGJSOUt5S1RUVnQxemdabnhKc0l1Uzg5Y1g2YXEx?=
 =?utf-8?B?S2FvRTQrejIyOGk5QkxqazVBWDB1b3N2UVRIVFNIRjBzc2xjU0FIV2wwZXVx?=
 =?utf-8?B?YlBFQjJPRDViTWphVFNTTXUrNS9NVVRDbUJMSElQUGhTKzd6YWVSRmh5M0pL?=
 =?utf-8?B?d1RxbWJKZEtabDJZRk5wTWFoNkpuaSt1ak1jV3hWWHZUVHVCK0pXdy9ZV01h?=
 =?utf-8?Q?jlXNxbsAAeTFR18AFM81LxkAF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e598c423-761e-468a-99df-08ddbb5a8b7e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 00:26:12.0538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mKGXJ7e+vrosNnnsLNPkb8S25MMZ+t3RX+uvtQpnJPwvgDvNV0KWtQ8s2G5w47lpJ47Z9ciHav0duL2v6l4ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8348

On 7/4/25 16:43, Mika Penttilä wrote:
> 
> On 7/4/25 08:17, Mika Penttilä wrote:
>> On 7/4/25 02:35, Balbir Singh wrote:
>>> Support splitting pages during THP zone device migration as needed.
>>> The common case that arises is that after setup, during migrate
>>> the destination might not be able to allocate MIGRATE_PFN_COMPOUND
>>> pages.
>>>
>>> Add a new routine migrate_vma_split_pages() to support the splitting
>>> of already isolated pages. The pages being migrated are already unmapped
>>> and marked for migration during setup (via unmap). folio_split() and
>>> __split_unmapped_folio() take additional isolated arguments, to avoid
>>> unmapping and remaping these pages and unlocking/putting the folio.
>>>
>>> Cc: Karol Herbst <kherbst@redhat.com>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: "Jérôme Glisse" <jglisse@redhat.com>
>>> Cc: Shuah Khan <shuah@kernel.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Barry Song <baohua@kernel.org>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Matthew Wilcox <willy@infradead.org>
>>> Cc: Peter Xu <peterx@redhat.com>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
>>> Cc: Jane Chu <jane.chu@oracle.com>
>>> Cc: Alistair Popple <apopple@nvidia.com>
>>> Cc: Donet Tom <donettom@linux.ibm.com>
>>>
>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>> ---
>>>  include/linux/huge_mm.h | 11 ++++++--
>>>  mm/huge_memory.c        | 54 ++++++++++++++++++++-----------------
>>>  mm/migrate_device.c     | 59 ++++++++++++++++++++++++++++++++---------
>>>  3 files changed, 85 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>> index 65a1bdf29bb9..5f55a754e57c 100644
>>> --- a/include/linux/huge_mm.h
>>> +++ b/include/linux/huge_mm.h
>>> @@ -343,8 +343,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
>>>  		vm_flags_t vm_flags);
>>>  
>>>  bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
>>> -int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>> -		unsigned int new_order);
>>> +int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>> +		unsigned int new_order, bool isolated);
>>>  int min_order_for_split(struct folio *folio);
>>>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>>>  bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>> @@ -353,6 +353,13 @@ bool non_uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>  		bool warns);
>>>  int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
>>>  		struct list_head *list);
>>> +
>>> +static inline int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>> +		unsigned int new_order)
>>> +{
>>> +	return __split_huge_page_to_list_to_order(page, list, new_order, false);
>>> +}
>>> +
>>>  /*
>>>   * try_folio_split - try to split a @folio at @page using non uniform split.
>>>   * @folio: folio to be split
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index d55e36ae0c39..e00ddfed22fa 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -3424,15 +3424,6 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>>>  		new_folio->mapping = folio->mapping;
>>>  		new_folio->index = folio->index + i;
>>>  
>>> -		/*
>>> -		 * page->private should not be set in tail pages. Fix up and warn once
>>> -		 * if private is unexpectedly set.
>>> -		 */
>>> -		if (unlikely(new_folio->private)) {
>>> -			VM_WARN_ON_ONCE_PAGE(true, new_head);
>>> -			new_folio->private = NULL;
>>> -		}
>>> -
>>>  		if (folio_test_swapcache(folio))
>>>  			new_folio->swap.val = folio->swap.val + i;
>>>  
>>> @@ -3519,7 +3510,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>>>  		struct page *split_at, struct page *lock_at,
>>>  		struct list_head *list, pgoff_t end,
>>>  		struct xa_state *xas, struct address_space *mapping,
>>> -		bool uniform_split)
>>> +		bool uniform_split, bool isolated)
>>>  {
>>>  	struct lruvec *lruvec;
>>>  	struct address_space *swap_cache = NULL;
>>> @@ -3643,8 +3634,9 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>>>  				percpu_ref_get_many(&release->pgmap->ref,
>>>  							(1 << new_order) - 1);
>>>  
>>> -			lru_add_split_folio(origin_folio, release, lruvec,
>>> -					list);
>>> +			if (!isolated)
>>> +				lru_add_split_folio(origin_folio, release,
>>> +							lruvec, list);
>>>  
>>>  			/* Some pages can be beyond EOF: drop them from cache */
>>>  			if (release->index >= end) {
>>> @@ -3697,6 +3689,12 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>>>  	if (nr_dropped)
>>>  		shmem_uncharge(mapping->host, nr_dropped);
>>>  
>>> +	/*
>>> +	 * Don't remap and unlock isolated folios
>>> +	 */
>>> +	if (isolated)
>>> +		return ret;
>>> +
>>>  	remap_page(origin_folio, 1 << order,
>>>  			folio_test_anon(origin_folio) ?
>>>  				RMP_USE_SHARED_ZEROPAGE : 0);
>>> @@ -3790,6 +3788,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>   * @lock_at: a page within @folio to be left locked to caller
>>>   * @list: after-split folios will be put on it if non NULL
>>>   * @uniform_split: perform uniform split or not (non-uniform split)
>>> + * @isolated: The pages are already unmapped
>>>   *
>>>   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
>>>   * It is in charge of checking whether the split is supported or not and
>>> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>   */
>>>  static int __folio_split(struct folio *folio, unsigned int new_order,
>>>  		struct page *split_at, struct page *lock_at,
>>> -		struct list_head *list, bool uniform_split)
>>> +		struct list_head *list, bool uniform_split, bool isolated)
>>>  {
>>>  	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>  		 * is taken to serialise against parallel split or collapse
>>>  		 * operations.
>>>  		 */
>>> -		anon_vma = folio_get_anon_vma(folio);
>>> -		if (!anon_vma) {
>>> -			ret = -EBUSY;
>>> -			goto out;
>>> +		if (!isolated) {
>>> +			anon_vma = folio_get_anon_vma(folio);
>>> +			if (!anon_vma) {
>>> +				ret = -EBUSY;
>>> +				goto out;
>>> +			}
>>> +			anon_vma_lock_write(anon_vma);
>>>  		}
>>>  		end = -1;
>>>  		mapping = NULL;
>>> -		anon_vma_lock_write(anon_vma);
>>>  	} else {
>>>  		unsigned int min_order;
>>>  		gfp_t gfp;
>>> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>  		goto out_unlock;
>>>  	}
>>>  
>>> -	unmap_folio(folio);
>>> +	if (!isolated)
>>> +		unmap_folio(folio);
>>>  
>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>  	local_irq_disable();
>>> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>  
>>>  		ret = __split_unmapped_folio(folio, new_order,
>>>  				split_at, lock_at, list, end, &xas, mapping,
>>> -				uniform_split);
>>> +				uniform_split, isolated);
>>>  	} else {
>>>  		spin_unlock(&ds_queue->split_queue_lock);
>>>  fail:
>>>  		if (mapping)
>>>  			xas_unlock(&xas);
>>>  		local_irq_enable();
>>> -		remap_page(folio, folio_nr_pages(folio), 0);
>>> +		if (!isolated)
>>> +			remap_page(folio, folio_nr_pages(folio), 0);
>>>  		ret = -EAGAIN;
>>>  	}
>>>  
>>> @@ -4046,12 +4049,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>   * Returns -EINVAL when trying to split to an order that is incompatible
>>>   * with the folio. Splitting to order 0 is compatible with all folios.
>>>   */
>>> -int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>> -				     unsigned int new_order)
>>> +int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>> +				     unsigned int new_order, bool isolated)
>>>  {
>>>  	struct folio *folio = page_folio(page);
>>>  
>>> -	return __folio_split(folio, new_order, &folio->page, page, list, true);
>>> +	return __folio_split(folio, new_order, &folio->page, page, list, true,
>>> +				isolated);
>>>  }
>>>  
>>>  /*
>>> @@ -4080,7 +4084,7 @@ int folio_split(struct folio *folio, unsigned int new_order,
>>>  		struct page *split_at, struct list_head *list)
>>>  {
>>>  	return __folio_split(folio, new_order, split_at, &folio->page, list,
>>> -			false);
>>> +			false, false);
>>>  }
>>>  
>>>  int min_order_for_split(struct folio *folio)
>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> index 41d0bd787969..acd2f03b178d 100644
>>> --- a/mm/migrate_device.c
>>> +++ b/mm/migrate_device.c
>>> @@ -813,6 +813,24 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
>>>  		src[i] &= ~MIGRATE_PFN_MIGRATE;
>>>  	return 0;
>>>  }
>>> +
>>> +static void migrate_vma_split_pages(struct migrate_vma *migrate,
>>> +					unsigned long idx, unsigned long addr,
>>> +					struct folio *folio)
>>> +{
>>> +	unsigned long i;
>>> +	unsigned long pfn;
>>> +	unsigned long flags;
>>> +
>>> +	folio_get(folio);
>>> +	split_huge_pmd_address(migrate->vma, addr, true);
>>> +	__split_huge_page_to_list_to_order(folio_page(folio, 0), NULL, 0, true);
>> We already have reference to folio, why is folio_get() needed ?
>>
>> Splitting the page splits pmd for anon folios, why is there split_huge_pmd_address() ?
> 
> Oh I see 
> +	if (!isolated)
> +		unmap_folio(folio);
> 
> which explains the explicit split_huge_pmd_address(migrate->vma, addr, true);
> 
> Still, why the folio_get(folio);?
>  
> 

That is for split_huge_pmd_address, when called with freeze=true, it drops the
ref count on the page

	if (freeze)
		put_page(page);

Balbir

