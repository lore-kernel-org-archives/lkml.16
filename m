Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEFE211C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746213356; cv=fail; b=I7H4eFv+BRe5dtYznry5vFiyCueFonHLS2OhT2ZOvMw1UfW/kz+Hu7fKivKVEOpf9mcdD8OFFjansic0FXeJxjfaMusPUHpEUmAxtZMnAIPKH14vFmIcr0GR3f9aZeHDPhI0dvAsKL9i4yvpaD/fnBcaWqO5SgVDycs5mNd1w8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746213356; c=relaxed/simple;
	bh=2X6UCEk/b5lrMX7SdSqtv/Z9JHRPSValDHPpot7Jsfg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZP8aXpyCy4L4u65uq+pu9B5+fqnGAz7Ye8P6LjbxHbuWVsN7LYj60CR0p8qIqe3WDyRL0vSFbXG1dXYE/fpqRHCNNn5frrjw6WO6hjXI8t1usjA2CNCOdw755EabcVnR3IvzcOLucLi5/Lq6lJsmLT+M+vM5Auq6LbcPhyIb5r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LfXotNHK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LVU7Cau1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LfXotNHK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LVU7Cau1"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542IuAaZ025253;
	Fri, 2 May 2025 19:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2X6UCEk/b5lrMX7SdSqtv/Z9JHRPSValDHPpot7Jsfg=; b=
	LfXotNHKB3PZwcEnNn00uas0c4HTpedItotSDfD/izyTdSxuwgDGwuzrrjzqrQsx
	7Mr3oNkI0bfZv4zC0IbPXKacjSoOXlCzBeOq2eBKlnwzLUEqpc5tHLe1oxEsXh9f
	4YsrWdnUHTHfgaBrQ5N/ZjR1musiq6iEB5SdTT7Mp/evgDiJCgPGzT0w8Tv4EKOv
	bygUvAvIVWPglAklblEqSgabRy0g72ExkuxwkPTDzCnZ02KdrzZpRsQyZojfcpy0
	8NhqZRx2uMOe984AS77cmdq3+AU4xQfJ5MfwI+QU2RWluOP3uQGX0AzeFq4KOL/0
	xN/+mcrYUmYpZ9LEkvFRxw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6usnumr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 19:15:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 542IA1T0001267;
	Fri, 2 May 2025 19:15:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxe436x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 19:15:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGjwKfsqx7GpyjpJW7mDFlJ8T/tz7C8FQ+BVjEUTgG3JyaODoESZtchZEQYOd7VjFVv9939qvKFpchCXuQ8unh+zP4bR7jLMk/0a5e0V+bC53xTV5NHQCfcD9TVwfp+nQViI6U4bg4vnNPvLozhNYXQgvQ2XSUTutDV1SPYcgYewKIAazGyS01xeXfgvHi9oQgkPt2qfKd9tJtXCej2J6WnPbG5iP53HWQhHkrIq7WXQUQVm7CNjRP940V0wlvGHsabnPPVLMuGOoDl78Ul430mxochqBkUBsTAgdDwMZxJRpijoVk6L4mXJ+HvPmjZ+k0vJZkN0WEnZWV/GbE5oBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2X6UCEk/b5lrMX7SdSqtv/Z9JHRPSValDHPpot7Jsfg=;
 b=Q9UYd6fVFRzUKsHpr6KjLefpOpAMWjAEtpnqO3+/73i5bR/EI3cuWNX9rM+Ypvx0LhKgam6izXepG9U5DRut69F6aTe8A+VIhdlBCz18l+xCq57msAJ2AUgDW04NLFfYc4vlaIkqAiDFh/m8NsJF1f9oEQwgVlaIZS3JtNpaiSF8ruB9AX4lQgruXZDnEEXqHsCLGDbdj+5QQecpjtUH4hv4ByeLt3wxSAha3v5tiR+J1RNAaSt+1qmZUjaJN0QAviVKKrS8a//78n7If4kddp5Z4EBMjTUjz+YSrYBH1OmRS4lQOV9425ZXcQRTBN/FTSXs+qekUyFZ3pkSkbOK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2X6UCEk/b5lrMX7SdSqtv/Z9JHRPSValDHPpot7Jsfg=;
 b=LVU7Cau1/XVQJLQwr6EFK8S54aoosBr4ZAcjbhI4EBZJzVyW49jL587grz3zqFFmKP2PEBm8GWggKSaNf1Hyow7XmfVJ/Sx9zpghacOUpWK75rZ05CCGxXwfuXnubOqCGrmHRyCo/33fnNgg+RmY5G+KbZSim7FuVs74eHithFU=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SA1PR10MB6471.namprd10.prod.outlook.com (2603:10b6:806:2b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 2 May
 2025 19:15:31 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 19:15:30 +0000
Message-ID: <4d39b2f8-0631-4cd2-a287-4a065d02f82a@oracle.com>
Date: Sat, 3 May 2025 00:45:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] mm,memory_hotplug: Rename status_change_nid
 parameter in memory_notify
To: Oscar Salvador <osalvador@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rakie Kim
 <rakie.kim@sk.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250502083624.49849-1-osalvador@suse.de>
 <20250502083624.49849-4-osalvador@suse.de>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250502083624.49849-4-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::29) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SA1PR10MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5b6512-ecb1-4bcb-deb2-08dd89adb428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1ErMjVOcTRaeXBFK0M4UngycW13ZjZ4WTRNRnVIRllUWGN5L3NvNGpVUHlG?=
 =?utf-8?B?ZWRtRWZkdU16WkdGZVR5NXFQbStQUGVUeEl2akpzNTJtbWFtMGpld2xXSjJQ?=
 =?utf-8?B?TVZKRlJ6MXpBQ2hpVFFPSmVjZEJwTmVmZFJNcTYrR3pqMWJGSzJlL2RVRGYr?=
 =?utf-8?B?bDB6WTdaU3cxMk4rZVdVSVk0R1RTdUJIM1JVUTNmcmZKblcwL2IwWnZMUzVE?=
 =?utf-8?B?K1hnVUR0VjZGTjNLM1gvS3Z0STA1N091VFA0RGV5R1pYQzNhOStqNnhjYzNX?=
 =?utf-8?B?SktxN05odU12eWJyVDFKTVU5OXY5eGVoTndYcHJEeDEwZTNLbGRkWDEvemJk?=
 =?utf-8?B?d3JqWWtVelZYNHF4MVVvYldURGhJYmlrVklFcFBEQVQ3VFdDQWdkT0RweXRs?=
 =?utf-8?B?T0tLSnZ6QXZMVWsxMkhjOG02bUxkMmVPWkxzNDZIUW4rRzg0Z2pvYUhqemdO?=
 =?utf-8?B?MGpRbU5tUXZHQ0d1UUVVSXA0Z00vS2ROQ3RyMjYvMHV1a0NNUVNjU1NzdXVS?=
 =?utf-8?B?R3FjZkYwdFdpOG51UWFDcEo4Wk8ycUROaUVIenUwSUZ5bzhaV2VKeEFWVHhq?=
 =?utf-8?B?ZSt3M0dPS0NPZXlYZDAyU0NuK3NKK2V1eHUvbmhDWkt5emEvKzk1Qnc2TWQw?=
 =?utf-8?B?aVVjQ3U0TDFIQWR0OG1Zc0ZnUVVsVnF4NEs2bG9UdUl6c3BtMWlGc0tuSHNm?=
 =?utf-8?B?ZU9yUnEzL3dmSFl6K2QrSXMxTWdhQXkvbWo1b3MwVm4vbEwxblNyZGlqY2hh?=
 =?utf-8?B?OXZneXlZYjhid2ZaYnhTRzlUQVdaQnNDamIyVFBGY1QrOUZhcjd0ejZIRXE0?=
 =?utf-8?B?Z3I3Q25jSjVVaDd1WTRyRnB5akt4TjVKb05EMk1CeUpWY0lQbEZ6V0Vqc1hm?=
 =?utf-8?B?Y0p3dy9GQ21uT0ZDU2traTlHUFNNRlB0LzhnYWtxakIxeGprOUt6Z2UwakFz?=
 =?utf-8?B?RFpzTGZTTk9SYnJ1dWo1OHJiQ1dqTjZvVUZTWDNkYVRYclZXLzFpZWxKY1pC?=
 =?utf-8?B?WmtjZi9zWGtuODBRV1paMlRqOUNHZ2lZamc3QXU0NEJYaVc4Z2V2YWJnU2s5?=
 =?utf-8?B?QmtZN3YrcUV3T0VyUjRYelhtdmcwc3hyWUlZQlJiSFhHdEdESWlXTHVNdzFs?=
 =?utf-8?B?WVcrKzZWRmlMTXErYVpLbWczaGV2WXlieTl4RlMwazJRbDlmcEg5RVhNTFpC?=
 =?utf-8?B?OWFVeWkwYmc5cmhYZWhlMTdzY09YZEo5UmtIMlBGZkU3bGhOYWdHUGptKzRJ?=
 =?utf-8?B?RWptRWgzTXRBdnRqWkN4M1RWRnIzaVVaRGZXNWFHRytUSFhrM250QWtXVnpI?=
 =?utf-8?B?SjhwanpacUlQNHRPZEtDbzBhdjErOWdhWm1SMzN0WmkxM1hLRnA4azBURlY3?=
 =?utf-8?B?VUZxNXQ3bkd5NGpUTThwc2dGelczQ1BmdVBOcTVyVXhOL1FvUE1PSUMyU3hS?=
 =?utf-8?B?d2tFbDl4K2RTZGpYZ3ltWCtGbW1UdFBHWE1SSHlpcjgvT3pIcDFldGVoeVds?=
 =?utf-8?B?V1daVTA4enZGK0NtRTYvWm1xQnQwSXhiRzdPc0FhSm1CaGZxNFZNYTdSTzNK?=
 =?utf-8?B?THpROU5HVjlGR3kxWlVRdTFJekNYUlBQdEsrbnlxc1NiV0c1YUt1M0p2UEU5?=
 =?utf-8?B?bGdralFvSVdBS3VFZGlENUJaU25JcytOUkFNQnNBTDhubHFHRzJUcEwrcXgx?=
 =?utf-8?B?NnRUZHhsZ3RpSjhHZXVaRUxqUTBUQk5nN2FSdkRnempsR2dmOTVjOFBncS9T?=
 =?utf-8?B?aldrUllIcnYvNUV2b3lMN0Nla1QxRUFiOXNtNG9uc0sxajRMRzloQi9nZTRK?=
 =?utf-8?B?cFFhRld6c0xyUUVoOXZoaDg4YlEyTU4xSDcyOFBCbFN3VkgxT1pXRUs0c2VU?=
 =?utf-8?B?RHNRWTF2alNXZ0dBWFFXQWJSZVI2bGI5dXNUeGhwVXk4MlhITkgvczE5K1E5?=
 =?utf-8?Q?PEb19rkkoBg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THl4RngxdVJ3bG5Ec3c5YXIzaGdJZ1BvUzJ1VXZHU2VtUkRmTnhkTExMa1RM?=
 =?utf-8?B?YUE3bXhnQnNmRGNQZ1kvdFFDWENSdW1BR0hZS1d4YWltK2Z1Y3N4YldXeXpl?=
 =?utf-8?B?dVJSNW9PTG1MaXBjUmtRdkpEK2FMdXoxWWZPaEpqaGJsNlRXTHVDdUVQZUww?=
 =?utf-8?B?dDBIcS8wNTM5ejJYZFFkSXZ3cDROc0hXa3VZYmlTekY2YWVKNjFIaGh2aWZa?=
 =?utf-8?B?WFc1dGdmUFdwQ0x3U1hDMTUxWUhXME5VNEtGV1FVTGxEc3RVOERSZnVvTG5S?=
 =?utf-8?B?UFdIK1RqdTRRSll4aHBNMG9xSXhwWjJ1WVZvdnZuUDc1RzlXcUxnNHdNMnhP?=
 =?utf-8?B?dGtsN2lRNWNUNEVQRk05QzlUQjUrTjNJTitDdVJRdjVMbEg2V2ZzVGxFYzdk?=
 =?utf-8?B?VGpjZlRLSEliQjlhamNjRTIzWURUYlRacGFOUHRVR3ZvS1FaWjdWc1lQVGJs?=
 =?utf-8?B?U21BUGlLa2c4TGc5eUhOR3J6K0x4R0FmdURDYnZxcHQySVQ5cUtPekwxTGtz?=
 =?utf-8?B?L3FrNmVlaCtBRVR4a3hXY3N1cHQ1ZU1BN0JVa3ZicG1kZTFPdG5oMWhKT1c5?=
 =?utf-8?B?ZG5nZDdjbnNJS2c4VXI3RnlQb0phbUczZVhuQ21JbVZUaDMxdW9OV1dJQ0Ft?=
 =?utf-8?B?N25EcFJORVhmTjJjYkNKV3pUTzVDS0hHR2pkT0drWTBla0VJU2FwN0Z5RU5S?=
 =?utf-8?B?cEtuOXBMdm5OcnVMTUZiSEVsU0p0bDdJN1EyY0xQWk9tRWg5MW5kZVJza21p?=
 =?utf-8?B?TmtCcVJqUUVhTjBJeitvemZXWnRiaE1tVGFQL2NDaTZuaXl2c2tEcjBiT2RC?=
 =?utf-8?B?cVU5VzAybklVVlo4NXIwN3NJMlNrKzB1NXlsTjNWY0xpSWREQm8rZiszK01T?=
 =?utf-8?B?TTZBLzRyaVZJUjVab3VPYlJlRW5YWVMveHBsK1pua25tMlI2UE9xbVp5MUNa?=
 =?utf-8?B?ZnhaWi9ZNVhFREVqS0wwY29CdERZN1gxZ3dVZzFaS2NRNGVkejN5WFk2d0Vq?=
 =?utf-8?B?RFhtZ3J2eklBMytlZUtnSm1jZldzeC9Wa0NiQWJ1UTljbjhENW9CdU9WSndp?=
 =?utf-8?B?OS9OcXk3aTEwUExmRU5ob3BZY2dqaGIzT2Z4QUJDaGVhT3pmbHJPazlkUUZr?=
 =?utf-8?B?QXR3S1BTOExJVGNDTzlGSjZkNmxmQVhHQ1FGayt4NE5VQU92R2N1SWRJMlBF?=
 =?utf-8?B?OU5ZYXJRQVRHK05TTUtRQXR3dmNLRHdUUzNhVDNoUUpNNHQwZ3NRU2lzOTc2?=
 =?utf-8?B?QVVhc1RXR3NqNVdFbE9kck1iMkJRVHlSQ2wwWGJ4Q3QwR3owTmorR3hhQ2tW?=
 =?utf-8?B?dS85ZktmbXJUbng2NU90MlBpcTlIZGh1WHJYcjBrS2RMZlRJdmoyZWROa3FE?=
 =?utf-8?B?OENHdXZzZWMwbjlBNVFMdWdFaEMxc2E4OWpMaE53LzdYV25nTnJzQzAzN0hj?=
 =?utf-8?B?NlY5MHZnc0pnZUVoWERjWlV3bGM0THdBNzBmNXl2N1FoYVhGNHBGeGpESGE4?=
 =?utf-8?B?VmZOR01KSWxGZmNjc21GWCtvM2I1WVp1eUZhekU0UVlpenpyUmNlNDBtSExU?=
 =?utf-8?B?SlJLSExRVldQM2NRNlJ2TFhYVHJ6SlBmUERxMlZGTnlMS2lPTUxicE5mNU1I?=
 =?utf-8?B?ak11UitoUEFwdDFkTDB5T05oTjcrLzBkMFpCbk5KRnQ5aUtnVnN6OHNCODE4?=
 =?utf-8?B?UjVlZ0ZFUDNrZGszMWhPRXlqZVRNL3QwcHUySkpFdVlxeTdGV1daNDJCK212?=
 =?utf-8?B?QllKTTNCSUNYRUpaZXhJNUJ3RHBxSUdVVnNXeC9kekNKNnpleEJrRnVTR2lq?=
 =?utf-8?B?UkpUcGNWSVV1ZThRTU5jOFovcjlzbTRRbVNSRFFtMkgwNFBTT0l6VDFjcm41?=
 =?utf-8?B?RllVVWNrNXA5SE1nbjRYZjZCQ3ZHUEFhZ0JtZGxUQ011Y1dLVklqRzZsU2hC?=
 =?utf-8?B?Qk0yOHlqbDdVTzFQMWlFa0YzNUNQdk9WR1RoMXUzRnVTWFNzaS9Ha1dGNHJv?=
 =?utf-8?B?VDVDOWlsTTgrbWdUOUVPbVJaNENzb3NSb3llT0N6TlB3K0srQlloZ0ttVUhZ?=
 =?utf-8?B?ZzB2R2FvZWFtUU1sNXhsTEo1NDdUaHcyOFJCNjZ6UEpiY3dQVENDUE5uR3Ix?=
 =?utf-8?Q?PZOstPbAf4INxccY3XFQEJQPm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TiKu/mWhCGY6oDHMfJ9QjEp4Y4bbjzDwfMrsTuUzYwAsJvvllVNUFJg6yucZctcrtqUKCsBBd8W0xIiqkjnv9RE9d0ZUBF/EqWPbxFPtVQxL5vfAc444kVUwIaWbpgh2L0F+rwyaNOS0IrsaOOmWYjH+TKPx6MIfIJuEiSjD1eLazimOJaTZoaBtPJaA+34MNL/UOQ8DOqinKhojVXUmPnRE0kS6YG3104bIHf5eeqz6O5pcKE285HOqH7nCePCVxh3ZXZnUXaFjQAK4vMQYDdP8Rmr4olRHlZEIefhF9D6IbQQUSgpwKQitqWFsO0NpbT2D2e/375PXKUZf3voDF+jOUtAWNlWBmCaNNeB6cPkY2OXT8G1ZCF110chhZ1b6YaP7ycxYnMJ+EMcJVIT1UDDY/4HN6GSC9dlfx2cdn9K86raal532L7J+V2BX0ZzsuQZFwy+blXWkj4OEx/tlnCcwfvx5Zzs6CdRBTF0CJB7DI/ES819gCy3DptcnPAx/m3otLnzBshyT7W3qcJeXXxSTpQn3/l87sDViOWBKYxxJ9/pZNV2IbKau9aSdRoDUqAvJ9mYdFQIGQYxEFiOgl/MRaHqVpNdnXO9+AbFJGy4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5b6512-ecb1-4bcb-deb2-08dd89adb428
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 19:15:30.5594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbUrvyd2R7rG3fpIbLfAV3lCRWiwhF8k7QDg5JjEeHvM6cp8qMTxJmC9slE5E/gPki7LCXTdyp14VsRxA3znTTXrFa4C5rLTkanEn33HnCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6471
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 mlxlogscore=987 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505020155
X-Proofpoint-ORIG-GUID: Xkr9e7PdjFwWRtbVAYdmK0KoyEiHgOS-
X-Proofpoint-GUID: Xkr9e7PdjFwWRtbVAYdmK0KoyEiHgOS-
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=681519d7 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=sWKEhP36mHoA:10 a=mmkPMau8QRhxDkv9-m0A:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13129
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE1NCBTYWx0ZWRfX9FS0fq4JvvZy 4lDDyc5Q45TL0RsLZGbKTE1MOgSkXsyK9oPkFSa2SZ+2XLSjQeECd7dpAZREFyUuxFzFpyCD7h5 mv+NxbQw/eb6GerDk8gCI9QMTnv17pzbpLkNN3fmKMcw7W9BlfoDyHNqMRpS4raxlBfh5Y43yyK
 29rGK1oDYjo7wnz7VSgZY2UaErm0zqeVSjZIvnUOirPlIJqisgxKAeyrn4HLZGKJW5OCBhLbo/j rsQl85ANE++LfAe+HDLCbnxT3lSn4lEF+RqZ7HvFPgKaWFMznuCwSWRfawh4OdS2C2a058ByhfS R/Wc0+ouMttphgSvoF67SGAkD+uPcdK8CWxnd+bZ9nNIByAudVx/NE9NouYDLvc5G3RC95ZaOUM
 OVGjAG92dtqCIEbLtsN4NlaTwSuGo8WYnQXWNGGSaYTioxn7D2JqBlW1xktn8W5VN4a4UJIe



On 02-05-2025 14:06, Oscar Salvador wrote:
> The 'status_change_nid' field was used to track changes in the memory
> state of a numa node, but that funcionality has been decoupled from

typo funcionality -> functionality

> memory_notify and moved to node_notify.
> Current consumers of memory_notify are only interested in which node the
> memory we are adding belongs to, so rename current 'status_change_nid'
> to 'nid'.

Thanks,
Alok
