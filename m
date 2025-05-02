Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7DF1EFFB9
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746213032; cv=fail; b=fqpq32nFrrqiH2FOq6aGwbpf/lbtpkp1GrAkADEGXGIqK1HPp5GEgv8+cqB4Crko6I2nns7ugoG34J7gBT3cD1hRAfN9i98dv0+SKLtZojv4Ii8RXjuwbjOa65Pe7dTKEETWebPplBtEStxdUcubG15nehdaVynG83ijKfgurl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746213032; c=relaxed/simple;
	bh=cUyStS+GWFBx83qA1QhsIAPRBMRdfXPW2hdVBbRqe44=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T6R8wVlZjkGop4lsRgbH7PaG0y+7bHWQKzkRKXVvlpVjLPxDiLFULEUlYE46whkyK5oX6JwP23Gg5xR9LEKhXNFJExHMRYAKfbn6fOULmQtmaNmuFK5AB7jzC2ZxdSseSJ+CYuYNQHh+FuxoO6uxOuo9kIfkEH6agWgvrqFP4xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OSWnC0gc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nyQ5S4cF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OSWnC0gc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nyQ5S4cF"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542IttPZ012818;
	Fri, 2 May 2025 19:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KgYtLOteyEflwEDo54VNLHx2SrJiVQSPK3WClD6UIdE=; b=
	OSWnC0gcHE+EgDlzjAnr3d7Nrs3fKK7C3FX+rJwr2fri2YRmVyYx6Idzbvkb9YXj
	QBoUTlXlyVMeRx5iXacIxy1bI52audncUU/OTRWp7QDQgnS68WvzAlbl57Eq5gJ/
	U/8TWPexoRd7ZC1GBpBNv+qApy9sT8WQBOUk41TC9kas712Kv5c30v6RMYqV3TLL
	xczfLWEHlWlebRwY117xviLn7pDTnnjQmL06Qk9YdJsMYWwjcDwDOhrxxbCz/AS9
	2+Lw0SOT1bdLgwMIFHv3t6zFeYwvecmYnSIVvT9UAbyDehNIBA8NUlql4O1JzvwE
	q/oZBb0biM1l5TVz3m6rtA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ucnxy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 19:10:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 542HF7la033448;
	Fri, 2 May 2025 19:10:07 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010019.outbound.protection.outlook.com [40.93.12.19])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxe46b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 19:10:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FifReyNkrGTptW96/seC2igfKPdE1Ia2M8YPEhC+pS6QqH94E/XcVlfCsdEJ0csqxPl2fZ5hmqgtoTJWDkKZ7PgtS5NRt2nl/vyVdZSXMJ7/vtVBmgmx++BHYQ3HtzIrhQaIh/dXYedOggjWW0eiqKb2rRY7k2JtFcDfraHWc+nFik2ebonzTfUlgbkff7a2TZMAey6grOunQkTAfST5NxH4TEw+787bYAigxVONsFaYMHoSHA69Nhp9zm8TVOA/8itVC9vYzGqGmL6K/7CUAv+VJC7qAD7M1jFEJnp24ksvAHlamk7s4IupzNm1Cb7Uj4wJ0XMmH0noYzk0mxtR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgYtLOteyEflwEDo54VNLHx2SrJiVQSPK3WClD6UIdE=;
 b=qJqexbc7zQ4T+oQQ2b8eHhCIVOO+QtvW4o/PVIXRrHY18ZIlRYZZqSfLhzEWabwYJzLFHwg8Pez+ltsto9nd0PtWhMWk0VOQPZEi8bxMAolHkN8EMgH0WYW7MLQKYELXoFsoGMPboiuiMMzNgsIs0dN2wiIwA4H1+89oUHuIdMBl5qczurvGHe/8vbdF4g4lvV5VjtNcBcsFO3s4PBPlXaXjbditbwaP2FJwQBkOlUKkQVjc6P+r+zdJhDImMOCyEtOjekN+EVo5Ay+d+CWPbrUjPFvynRdfkn3SYnSVUM6U2z2sY/6ct/Yp7lAKg9qur45Jl4dmJ73bS33ymm3Dvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgYtLOteyEflwEDo54VNLHx2SrJiVQSPK3WClD6UIdE=;
 b=nyQ5S4cFc3YeeELUsLaY6VyLDwZ1fHOHN96z+DpcqxY3PExDAYHhV+q9QuNp3qJYnpCnKyOoVBAvQTE4SbWACQ2uBu5aUCr1y5OsA17LcyfirrOcmFdezZEPSed95Y+fJIFBSvasw6ZmGYd4cBHmtXWgkoKpGn6ydsPT+1JI1HU=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by IA3PR10MB8019.namprd10.prod.outlook.com (2603:10b6:208:513::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 19:10:05 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 19:10:05 +0000
Message-ID: <348e5677-f7ed-4386-a5cf-38024dc23c8e@oracle.com>
Date: Sat, 3 May 2025 00:39:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] mm,memory_hotplug: Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rakie Kim
 <rakie.kim@sk.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250502083624.49849-1-osalvador@suse.de>
 <20250502083624.49849-3-osalvador@suse.de>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250502083624.49849-3-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::28) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|IA3PR10MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: f6dc4f63-acbd-4084-1fff-08dd89acf21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEJHZHRmMWVTMmlYVlBNOVM1Szl1KzJ6emZEMVJjZ2doQU9iejFveTJBVm9k?=
 =?utf-8?B?L2NvTzl1VkN6MkthYks1Q3NwTnRQTWVmclIzSnQ1M25IeE9Id1B5RUVzTExX?=
 =?utf-8?B?MDA3RTRJMzJ0M0VNNkNnYjdzMzNGeWY2em1xUThKNzI2QUZ1dnlrdjQvNjVp?=
 =?utf-8?B?ZWQ0TVJKa292ZXhwYkNra2Q2SUgrNit2WVgxTVpQTFpSVmQ5bkl3Wm5MbEJT?=
 =?utf-8?B?ZTd6bWdPZHEvdXpsZFN3dzUvQisybHc2a2RJa3JwR2YvZ2JsUjBQZ21LZDI5?=
 =?utf-8?B?cWEvNVMzTXVQNXlqWENETjliWUFRcElNdEVMeGdMK2MwRnFPb29ncjdqQVlY?=
 =?utf-8?B?N2hLREdJTW1qdTZxV0s4dUVUek1CNFFWaEFzVENCOXIzZjV3Yk1LVzg1Q2M3?=
 =?utf-8?B?K2w1MjVkWTNEN0NSTDR5YW5wZmVZQndaa1d5RWxpOWYyMTJDekI0d2hwa2VO?=
 =?utf-8?B?UWMwUVFUOXV6QU5mTmh2TmdBYmlwQjAvU0FyMU9COENtMGlQTDlUK3lsaTh1?=
 =?utf-8?B?eFU1R1NuQnlUeEducTJYSk5MRU1CK0VBUnVQeFZBUERaTm9la0FXZC9jdk1l?=
 =?utf-8?B?akNMbG8xYndIYlNYeTNOelFlMmlhVVN0dE5za0E4TFJUOWd0a1dQK25iUXFU?=
 =?utf-8?B?NzJMM3RWL3RPaXBQd2UvMzZiVHNWSGlPWXFQZTVOQ1o2UFRPZGxUWEhXQ3V2?=
 =?utf-8?B?WGxIbXNRMXlwVkh6cTNYQytsUjdndzc5TFhnWEJQUmhENFYzamhrM3B5ek9Q?=
 =?utf-8?B?cFZZRDhveVZ2SjQrY281OWJBaHd4aWRudVdtWlFVNkdmblF3a0JyeUFybnUv?=
 =?utf-8?B?YnJITjNNZXloZjg3MldhQ1hpSmp6RlliaDl5ZDdQRzcvV3lhNVBVZjNuaHNv?=
 =?utf-8?B?SEE1Y3g0VzluTDdURG13WGw1eStoWHJ5OU03RHQ3OUNPUTM0Qm10NXZlQXRH?=
 =?utf-8?B?MWw4Q1RaNFBaNXlwOU1nZTRBSGVxZEtPYnd2bWJFaUlXU2NKRndHR1YyREVD?=
 =?utf-8?B?dFZubFR4bzlka0pLR08vNUttWWR3L2dlUGpUSGZnbll5VSsySDZ6WC9qRzFw?=
 =?utf-8?B?WG9oZ2taSUllZXlnQ0pWamhnRVA1MUtZQlVLb2hYTE5tM0x3bnRzMWNpQTV3?=
 =?utf-8?B?eklSM2tNL0tUbk1rOWZySVJWc2NpeTNoT1lkOUxrc08wK2lEUjk2NFV0ZTM0?=
 =?utf-8?B?dTl0cVl6MERoZGR5bTFZLzdldE96WXpac1lLUi9Lek5MQW1RM09yY00yY3FT?=
 =?utf-8?B?WGtlSUZyelJRTGpkcTkvMWN6akMySythdXhoTm5ablNiNm9qTVRmN3FQQXZ2?=
 =?utf-8?B?SCtGbmtpVlU0ZnJHRDdjeEl6VGY1NUZLN1A5UTkyNXV0L1RwUzRoUEVUL3Nt?=
 =?utf-8?B?U1hTNGJqTUtQMXlXQzNyNmkrL0orZkpaN1RNTFUwR1dvRzlNaUNkaFZhd3py?=
 =?utf-8?B?S2VZQk9KVVAvQ0ltcjNUVTdDRE5OaFFZNDJNT2t1cjJOK2gwS1BSd2FJQyt1?=
 =?utf-8?B?TFRFYmlyd3A0T3d2QkR1anM0T0Zwem9KYzlRdDU5bm5jUGdrMGtQOGJ5L0tB?=
 =?utf-8?B?ZHJWMTdZQ1hGMGx3RjRZWkY5TmFTRWFyRllxWDhWSVRudlR5NEJLOFlRdHF6?=
 =?utf-8?B?KzF2VnZ2cDVzOTl5QlFCS2IrNTkyeGhsdGY1MFN1SWRwWFlhdUEwbHpxTFFU?=
 =?utf-8?B?eldQa0lYbmFzZkVMZklXRXM3RmhXaGswdGZBRXJzbEZlYkk5UVlSaUJkRytV?=
 =?utf-8?B?WjlxdTlSWmF3N3FVb011YTEwcXZoZE9kbE5vOFZKaVlrejFoaWFlbVpRc1NQ?=
 =?utf-8?B?clhaNW5DWTJYZDRNRjRSQWZBRVJSOVFEUlhQN3had2xEM2diMncrNitJdnRp?=
 =?utf-8?B?cGFuSi9qYkNhUnRBWk4xT0hGbmhTYmdiL1VlUHExSnJXVUQxMUhzbHYxeHBs?=
 =?utf-8?Q?NbxXev+VtUA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlhEOHJVcTZxUDhNdWlnODRrV2kwRjYycGRVNFhhOHRmUDhvOVZ1dVFiL1ov?=
 =?utf-8?B?S2tNR1c4cVZkVDJRdFpHQUhSRkxkTjdHeFg0dDlEa0hMcW5vVm5sVGpVOEtV?=
 =?utf-8?B?Y1kyc3MrVlA3KzdEMTFwQkY3YnBmcG04SjZKbXR0S2pQUEtYQ25jU2JFVG5u?=
 =?utf-8?B?YnFWdWJLRWxzTE1VdjF0ZFNRL2ttejVWOVBYdEpLOVRmRXZXcVpkSkxzWFpv?=
 =?utf-8?B?elRaT01OL2Z6UkptSjRzSXRkUW81Ym8zSjZEVWlPY2E4a1dGQU8yNUNiRUJn?=
 =?utf-8?B?dXF6dGhjc2hYcHpKR29XMVRlSDllREhuV3ZTOENBUUYvTDhBTm5yaTNGSFJw?=
 =?utf-8?B?MEgzY2ZySm5CNHRIc1NDaTJlblpoYUI3WllTR2JJdUVub1JPQ0pFb3l2VGpM?=
 =?utf-8?B?NnhjWGU3S2J3bXBoNDJrYUVWa0RlOXdOVklZWTdMcmVVNjdlV2l6QlBWN1FV?=
 =?utf-8?B?eGVwVGlIWEJpTit3cDI5RkNnZ0lUZUgyNFIraVBvVHhPNzljZ21yaWFYUUhk?=
 =?utf-8?B?aWl5NjEzc2U4emZQRC9tbzJaekpVOFp3SkhHbjRqVEg0TGNuYU5sbHlLb1lE?=
 =?utf-8?B?OEM0L0FiUVV4TTgwbGxMdWhrTE9nbHdNSkhSbWNmT005eGllcUE2SWFiNENY?=
 =?utf-8?B?bmRkK2d0Yk9UWHR1bHhPWHlIM3BEeFRwbnhGQ2RlTm03VlhBN2Voc2F3cGpX?=
 =?utf-8?B?S3ZwMVI5ZlI0L2VSTjIrQk5YanNhN1F0aGI5MzJoNDVRV1FnZ0JTT2w4aVFY?=
 =?utf-8?B?ZnZyOGpIbjY2SUUrZGlPczdhN01JeFNJR0oxWFhmYlY2TnZHc1ErOVljOGhj?=
 =?utf-8?B?N3VqMmJ2cmYzTXd0czMwbjFXcDlZQ1ltcDRNOWwzczJrNitmVGpXazVHdVRF?=
 =?utf-8?B?WVZ0Qk1xRy9pSmdkSDhTOTR4cmgvMEhFaXd5ekU3dkJuc3A3R2g4YSt1QTR5?=
 =?utf-8?B?amJHMFZUTC9lN2IyWHhlVjdSbnZqT0NGbnpWdHhRUVVtazlBUDJXWjNLbzlp?=
 =?utf-8?B?ME9sL2dxcVkySUhzMVBySzRFS2lHYTZGcXdQMURWbk1rQnI3bGRhOHJELzU2?=
 =?utf-8?B?RTVlTnIra052WHJ5cTJ0dlVCM3BsdTUwczNJVkErVjhMTDVkc2lTdWdvcUla?=
 =?utf-8?B?WnduS2doaXAwVXV0Q0NlVkg1WTdSNDRVYkxacC8zVFdZT3I4VEpua3QzNHFm?=
 =?utf-8?B?ZVNuZ1hocWYya3FmNlZ4Tld2WC9tZ2I2Y1VKK2lMeXBaSHgwRkJEaDQwVERU?=
 =?utf-8?B?eXdhYWNjQW1GM3VvTGduNXc1U1R5RVBUMHhjOFJiSUNkWjJjU2IzVGxPdUpH?=
 =?utf-8?B?SXhnN0lYVlJvd0ZnTjJUd09EcUtUMWNqeHpqSFJxVVM4VThQc2o0Z3hlTTVR?=
 =?utf-8?B?enZMUDFzTkNUZnpQdGZHNENwT1RyUzZBSk9QMkd4dDdlQ0YyVTQxb2NDazJH?=
 =?utf-8?B?QXN0Um5FdVptUU9uN1Zxd3JhNlZhUU5mZ3RCdXhRQlpZSFV2R3N6U2dwRlhu?=
 =?utf-8?B?VGEvdVptSS8wTUF6MWQvamZQVUh0U1NSTUlpU2c0NzI4VDZ3dDMrL2xsMSs3?=
 =?utf-8?B?dTVzaGYwSmZXUk85VEtCRHZrUnlkN0xDOHBPS1pHTUpDQTNHRWRJYm1pQlNy?=
 =?utf-8?B?YnB2M3RjYzlDWE1ORXJVb3Mzc2JjS1Nkd3Z4eTByVHpNbURJTTkxY3hRWHQ3?=
 =?utf-8?B?ZXJDN3NKSi9GSzNLTVdvZVpnZ1Q2c1M2eWJLVHdISnZXNlNTdG1GR1piMEI1?=
 =?utf-8?B?VWw0NHhYUEI1Z29KVUJhNXd0MkQyankrYjNxMUhuTkUxK3BuTHZBUlNCMkJh?=
 =?utf-8?B?WFJKU0p2ekMwNExjV0UrMzVZNGhBb3ROWkNUSHRZL2hJL1dEMndITlZXZ1k0?=
 =?utf-8?B?aHQrRTFzbHdhZDJocFd1NkYyc0d4d1ZqbENFSHdqemlHdzkzMlpSakZLbHRk?=
 =?utf-8?B?eGpTMmR1RUZVQXMwSmt3L0ZmN1NkRXQ3dVNRTmdKSS94MFpEVFA1bzYvazA1?=
 =?utf-8?B?bHlZNEZVZUVSUHJiL25lOWUrTHV0dVdSV3pWaVQ4SmhPMFRBUm81TkxTUkFH?=
 =?utf-8?B?QnFuM2tWNVl4K3ZyejNIYWNvZ1d5cHo0UmYxaGUxbnRPNmdyOEZqWU5zN25M?=
 =?utf-8?Q?+JLSr+RpfWg60SE4jzWJZ8wxd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V195/GIx/7L8xzMxN0sY1bcWxUAftybn6VIsW81FRiIdg/MAMlqfCmUO1xfHQigJiEDVmbGgAS54W3EEDflX3mJ1q1N1GCylATPYIsTGstRltD/uU56fRZOZlNcHQYWzxv3grc/76XqVqbrEPZhK5SReOCPMvSaBx7XnoQ/FcZfKKBsjenW8n9lUXFzE0g/vBXOLYfgRE3qOCDEh9jIKEYxMeKbllLqmLF4qOj9YIQ5/uwK/N+52fH40l+UTXRLBZLEu0OmbljprTN1xYoxJsmKmkHix6O991wWirxDoukdB5u1BTpi8x6QByPDvwa1QtsWJFDvFihYh+IVwuIfFy60dA1925ViPec+O1Dx/Ob5oMslRDdtJwORVnW9ZWsfpV041lhOCTL1BWH1WuK/tcZD0eHbVoblgDmGyBOPztONjo46hrnHXBdBJX5S3hhPdSmvRq8ggXNg/V4anTAopsGQ5EEEor/30200Iy38Jl1waC5wVWfT6opBEQ4unXpbI4VTTcqIH8NhCU7yBvMqRawogOHVBj7v1Xw2qlCBsr83P2pnnOWz+ftKe+BioO8q/XJhShD3HwsNBFTbf5LkWuo/W2zM5uvi7ijFFlysMofE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6dc4f63-acbd-4084-1fff-08dd89acf21d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 19:10:04.8994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEK3t95FbWW5mfszEyDdTPT+SOjmP0xkglj7TNEaGxLUTIlndA8g3E3E1yC1T4WK3KsftMCRez2Dr1cnGsHRGM42d6Vys17Yi/0nRYYShrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8019
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505020154
X-Authority-Analysis: v=2.4 cv=ZsHtK87G c=1 sm=1 tr=0 ts=68151890 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=xYfjPSEg4nEWgKGIg3gA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GzjWM0sbGSIKp8CYs8KBCgofeWf1cAeX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE1NCBTYWx0ZWRfX5BtWV630rIkK 8U2lceY1Wvobypfgt75ePL5TRdhojZUxljbTLT/ST8ZMkKy8hb1OdYckzyaCvBLvqvGHjLMhrpS r4SJr//+593vrUHQfkCTjzBMzvh3NDx5Id7DftN3/MfJlP//wK1SFG1Rj1cmsMftnSUwMIZp+QS
 HITdBrO5qJK1YNc5PHmjj7EmpivJAZRg2Z80248pyhn4U5I8vW+x5T41mkN0XsJ7Ubcae1FZ6x/ lUIaMa+UeqlLWTv8B9BzMlLdetzSx8efemekzNw1FLXUR/5vDOMgXe8gobgObm4tmHCvTEaD1rl SF1DXSFZicT5hss5gjKkDZPEhZCHCL6G7mjm/Bo+K0h74yD/ZLo1op4aOTggAnTQXmUwbXtpicB
 FkclELX9spojUeuS9glzoDgYIU4xjN7jd97hxDXNJ8otkKXhOuXqFbx/k6Qi5RupMCv1KJ5+
X-Proofpoint-GUID: GzjWM0sbGSIKp8CYs8KBCgofeWf1cAeX



> -	node_states_set_node(nid, &arg);
> +	node_states_set_node(nid, &node_arg);
>   	if (need_zonelists_rebuild)
>   		build_all_zonelists(NULL);
>   
> @@ -1245,16 +1252,26 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>   	kswapd_run(nid);
>   	kcompactd_run(nid);
>   
> +	if (node_arg.status_change_nid >= 0)
> +		/*
> +		 * Node went from memoryless to have memory. Notifiy interested

typo Notifiy -> Notify
"to have memory" /s "to having memory"

> +		 * consumers
> +		 */
> +		node_notify(NODE_BECAME_MEM_AWARE, &node_arg);
> +
>   	writeback_set_ratelimit();
>   
> -	memory_notify(MEM_ONLINE, &arg);
> +	memory_notify(MEM_ONLINE, &mem_arg);
>   	return 0;
>   
>   failed_addition:
>   	pr_debug("online_pages [mem %#010llx-%#010llx] failed\n",
>   		 (unsigned long long) pfn << PAGE_SHIFT,
>   		 (((unsigned long long) pfn + nr_pages) << PAGE_SHIFT) - 1);
> -	memory_notify(MEM_CANCEL_ONLINE, &arg);
> +	if (cancel_mem_notifier_on_err)
> +		memory_notify(MEM_CANCEL_ONLINE, &mem_arg);
> +	if (cancel_node_notifier_on_err)
> +		node_notify(NODE_CANCEL_MEM_AWARE, &node_arg);
>   	remove_pfn_range_from_zone(zone, pfn, nr_pages);
>   	return ret;
>   }
> @@ -1888,48 +1905,29 @@ early_param("movable_node", cmdline_parse_movable_node);
>   
>   /* check which state of node_states will be changed when offline memory */
>   static void node_states_check_changes_offline(unsigned long nr_pages,
> -		struct zone *zone, struct memory_notify *arg)
> +		struct zone *zone, struct node_notify *arg)
>   {
>   	struct pglist_data *pgdat = zone->zone_pgdat;
>   	unsigned long present_pages = 0;
>   	enum zone_type zt;
>   
>   	arg->status_change_nid = NUMA_NO_NODE;
> -	arg->status_change_nid_normal = NUMA_NO_NODE;
>   
>   	/*
> -	 * Check whether node_states[N_NORMAL_MEMORY] will be changed.
> -	 * If the memory to be offline is within the range
> -	 * [0..ZONE_NORMAL], and it is the last present memory there,
> -	 * the zones in that range will become empty after the offlining,
> -	 * thus we can determine that we need to clear the node from
> -	 * node_states[N_NORMAL_MEMORY].
> +	 * Here we count the possible pages within the range [0..ZONE_MOVABLE].
> +	 * If after having accounted all the pages, we see that the nr_pages to
> +	 * be offlined is over or equal to the accounted pages, we know that the
> +	 * node will become empty, ans so, we can clear it for N_MEMORY.

typo ans -> and
"over or equal to the accounted" -> "greater than or equal to the accounted"

>   	 */
> -	for (zt = 0; zt <= ZONE_NORMAL; zt++)
> +	for (zt = 0; zt <= ZONE_MOVABLE; zt++)
>   		present_pages += pgdat->node_zones[zt].present_pages;
> -	if (zone_idx(zone) <= ZONE_NORMAL && nr_pages >= present_pages)
> -		arg->status_change_nid_normal = zone_to_nid(zone);
> -
> -	/*
> -	 * We have accounted the pages from [0..ZONE_NORMAL); ZONE_HIGHMEM
> -	 * does not apply as we don't support 32bit.
> -	 * Here we count the possible pages from ZONE_MOVABLE.
> -	 * If after having accounted all the pages, we see that the nr_pages
> -	 * to be offlined is over or equal to the accounted pages,
> -	 * we know that the node will become empty, and so, we can clear
> -	 * it for N_MEMORY as well.
> -	 */
> -	present_pages += pgdat->node_zones[ZONE_MOVABLE].present_pages;
>   
>   	if (nr_pages >= present_pages)
>   		arg->status_change_nid = zone_to_nid(zone);
>   }
>   
> -static void node_states_clear_node(int node, struct memory_notify *arg)
> +static void node_states_clear_node(int node, struct node_notify *arg)
>   {
> -	if (arg->status_change_nid_normal >= 0)
> -		node_clear_state(node, N_NORMAL_MEMORY);
> -
>   	if (arg->status_change_nid >= 0)
>   		node_clear_state(node, N_MEMORY);
>   }
> @@ -1953,7 +1951,9 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>   	unsigned long pfn, managed_pages, system_ram_pages = 0;
>   	const int node = zone_to_nid(zone);
>   	unsigned long flags;
> -	struct memory_notify arg;
> +	struct memory_notify mem_arg;
> +	struct node_notify node_arg;
> +	bool cancel_mem_notifier_on_err = false, cancel_node_notifier_on_err = false;
>   	char *reason;
>   	int ret;
>   
> @@ -2012,11 +2012,21 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>   		goto failed_removal_pcplists_disabled;
>   	}
>   
> -	arg.start_pfn = start_pfn;
> -	arg.nr_pages = nr_pages;
> -	node_states_check_changes_offline(nr_pages, zone, &arg);
> +	mem_arg.start_pfn = start_pfn;
> +	mem_arg.nr_pages = nr_pages;
> +	node_states_check_changes_offline(nr_pages, zone, &node_arg);
> +
> +	if (node_arg.status_change_nid >= 0) {
> +		cancel_node_notifier_on_err = true;
> +		ret = node_notify(NODE_BECOMING_MEMORYLESS, &node_arg);
> +		ret = notifier_to_errno(ret);
> +		if (ret)
> +			goto failed_removal_isolated;
> +	}
>   
> -	ret = memory_notify(MEM_GOING_OFFLINE, &arg);
> +	cancel_mem_notifier_on_err = true;
> +	mem_arg.status_change_nid = node_arg.status_change_nid;
> +	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
>   	ret = notifier_to_errno(ret);
>   	if (ret) {
>   		reason = "notifier failure";
> @@ -2096,27 +2106,32 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>   	 * Make sure to mark the node as memory-less before rebuilding the zone
>   	 * list. Otherwise this node would still appear in the fallback lists.
>   	 */
> -	node_states_clear_node(node, &arg);
> +	node_states_clear_node(node, &node_arg);
>   	if (!populated_zone(zone)) {
>   		zone_pcp_reset(zone);
>   		build_all_zonelists(NULL);
>   	}
>   
> -	if (arg.status_change_nid >= 0) {
> +	if (node_arg.status_change_nid >= 0) {
>   		kcompactd_stop(node);
>   		kswapd_stop(node);
> +		/* Node went memoryless. Notifiy interested consumers */

typo Notifiy -> Notify

> +		node_notify(NODE_BECAME_MEMORYLESS, &node_arg);
>   	}
>   
>   	writeback_set_ratelimit();
>   
> -	memory_notify(MEM_OFFLINE, &arg);
> +	memory_notify(MEM_OFFLINE, &mem_arg);
>   	remove_pfn_range_from_zone(zone, start_pfn, nr_pages);
>   	return 0;
>   
>   failed_removal_isolated:
>   	/* pushback to free area */
>   	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
> -	memory_notify(MEM_CANCEL_OFFLINE, &arg);
> +	if (cancel_mem_notifier_on_err)
> +		memory_notify(MEM_CANCEL_OFFLINE, &mem_arg);
> +	if (cancel_node_notifier_on_err)
> +		node_notify(NODE_CANCEL_MEMORYLESS, &node_arg);
>   failed_removal_pcplists_disabled:
>   	lru_cache_enable();
>   	zone_pcp_enable(zone);
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index f43951668c41..b3ad63fb3a2b 100644

Thanks,
Alok
