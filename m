Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E390E1C5D77
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743542640; cv=fail; b=YqHj5iRp2ugmeGkZtTaucMIWGcfxx4c/CUkfzHJeXdeQIkoKB/MgwBJykw/cboPDXXbR49YsHGS9V90Q51HZMClibxxqbKsIgCrTBvUmAHxzzO7fIXyXktvt5s1IsJ/4nOfqsblxiicUrGTzvSFxQ+Z/R4sWiAsMJHqp3JR1SoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743542640; c=relaxed/simple;
	bh=+cCV16o+wBPuDI/sqll76uzgHypRC+xtdkT1jvUFE9g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HBrElIJTUxpewyySm6Q2zBWqza0qRL/O6SK0u/WM0P8AwGoD82mRb+OiXQrzzvi6bmwJc9hk617u05341SpqHp1wnxqsP3B4FheD2Wam67p1Mz2o5davq0ozwtRg3CgNjuLy1lSkLgxEFiqNQOc55dUzdlqkrPbHHBzTbSfB88g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VkUoliH9; arc=fail smtp.client-ip=40.107.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VkUoliH9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CInb1xyRX7AWTBS1sWoZAjo3TYOGu9vP3ofjbHC+4RqxNdmCyeDy2hWoM6z7il8BihD5eD7q12YVthED/p8xB/T1ZRkYm0+X9TW8jV93PAeAGvvQQ4qBTmg2PBlfl/3BlGDo9boskwjjVRwsB6y4DaHM8h8hzcmvsUHmAO9ImwOZXZ6JcTiJH8CD9Rp/1OvVDG7HajBa3IuOoMGYxsb/zjTORYrR56YUiYhvMQJ04W7yhC4ALPLwX6wASgpfEO6Ex7qlWjbK9XlX6ptDyBFzxUmXbLXAIFqVmX1KZGfPyNuZUm0jDl+rKPom8phCAF30OU5gsns4E6KUshtIDPZWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFvEmqQ8Ovyeyo5TRH0ER7K21LdRe/75avcU1oJHbgw=;
 b=N8Ir+qvLukFX88QvL3obwBRply7f3nuLl7dIYkDFdme7BZV41JiLPgF7FLU0DTA7PSur5HiRb/2i6WYdtzO7I3UpnL79lO/jFjQ8sOSs2FoEPOzWbP7v70eCiAx0oCLlnyR7SYYg6Wv1o8g+ggglgmDABlpPyPzU3JPEMwOpzojjkn0DhAXjeqFKQ6wpI7ZeoEsXt+Tec0PZb1crNtmFsKLy/1qiOALgyVtm5lTX22CMxvwBdO3HmUB/+h3HFKNWXztUZop11aRX0Fr66DLBPJgwMgk55PSsAeF0tFHVUf9mjM8yypORkvgK0lKj5MiTMtywNbdpNGVnAa+az279aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFvEmqQ8Ovyeyo5TRH0ER7K21LdRe/75avcU1oJHbgw=;
 b=VkUoliH9rOgq4YsMPyfPMR91oXe4bddkNe0gxp8raQhOHLSVjRpeUEHOc+goGcHimwapymMC4hiA7cO/7Xt62udhgqYltqg5mRIwNxawLxXnOAtjhQXaotpa6OxVpFvia1NikazUFX2Ql3AwD16B14w/gctjwZoIgGwSf6hk/FE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS2PR12MB9640.namprd12.prod.outlook.com (2603:10b6:8:27d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 21:23:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 21:23:53 +0000
Message-ID: <5e483c9c-2d74-49a3-af63-e3b5ae4e3656@amd.com>
Date: Tue, 1 Apr 2025 16:23:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove "#define unlikely(cond) (cond)"
To: "H.J. Lu" <hjl.tools@gmail.com>, linux-kernel@vger.kernel.org
Cc: sergio.collado@gmail.com
References: <20250401211424.3244463-1-hjl.tools@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250401211424.3244463-1-hjl.tools@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS2PR12MB9640:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a062000-d3de-4adc-6e1e-08dd71638088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ams4VGhCVlpnOG9aSFptVTZJaEpPTEo4VURiOUp3VDZpdDJIWFVoSkdpRXMr?=
 =?utf-8?B?MTl6OXpkOUN2blJma2M3dGR0V3JGTE9ZMEFCa1E3Z1dYTDZld1FnVmhGeEJR?=
 =?utf-8?B?OUFtSVpwV0Jjc0N3VGhDVDZYbjFkRG5BdTh1dHY2czRKaFVsSHRKOXpYaTN1?=
 =?utf-8?B?N01xTjVuak9LZG1wbXAreTdCY240enpZTHNnRmE5ZDUyUWs5RHlWZUo0U0ZB?=
 =?utf-8?B?OFAxY2xOWUdCWk1OT1ZSZTBITS9pTFE0NWtNbVVnUnZqN2pPeWNRaEVrQWFx?=
 =?utf-8?B?dTRqVldkVDFISEpQRXZrcTFhZFlodDkzZlJWbTBUQUx6MjlBdWRjUEg3OFlB?=
 =?utf-8?B?QWRlck9nM1NKd0dtUGlHRE9jbWpxWXliUXJxMWN2YXBZTnhaUXBnTnZmbEJr?=
 =?utf-8?B?QXJyTFpZa25GZ3ZpcDhWU1BDQ1RwT3BBL1N0SlVLL01aM2RmVDhXV0Noc0dK?=
 =?utf-8?B?WXhoU3VhTXhJRjZWYzRnV3NJblNpWlB1aDViRzNjcjZoVlp6aTFNNDRpdjB4?=
 =?utf-8?B?S2tTRXZDdU9vbjZySkxOZm1jVWdtZWVMNGRBVllXS0xyOGQwNi9uM2tEb2Nr?=
 =?utf-8?B?NnN5Z09Mc0hsWUt3UDd4SVpwWTM2WXZvK0ZyYmJ4S3lMYVVwbks4bnhGYXVF?=
 =?utf-8?B?c1lxa0gvQVJMWUJsME1yUWhOWE5HY3RYZEJXRFM4SUZHU2FpZ0Zublk2TUlB?=
 =?utf-8?B?NUc2bGhUeGM5SlllK1dnWFBIdWVpcFNSOEppS3k4SWcvbnUrc1pVUTRXcUhB?=
 =?utf-8?B?QVFoTWp3MVZGZzVLM0kvZy9aOHVnR25WTWdzTTg5cDRCbm5EQlI4cVZVRXJw?=
 =?utf-8?B?MzF4TktjR2tZL3ZWYmdMbndseHNKZlhNNUFsRW05bFpoRmRKbjRXc1ltUFlv?=
 =?utf-8?B?SlhpbFA0VG9GcmdBUlBwZjM4Z3dBYUtndVBOUDJOQk1PYnI3UHVQR245dnda?=
 =?utf-8?B?Ym4rQlZRTTZ1QmRhS1hwZ3g1T29WZEFRY2xDUWFJT2htd1hGUi9aeVo5Mi9T?=
 =?utf-8?B?SUhPam91VEJBcUo2ZmliVzJuZDdkK3k0VVFrZ2NuVmVZYmg2YlRqRWpBbVJF?=
 =?utf-8?B?Q2FZc0k4YXBWZVZCZ2FvVGs0UklyNHpiVEJOQm01VlhnWVZsTytxWXBUU1Fn?=
 =?utf-8?B?bnlpcVk3OUY4aUk2OU14VVpzOWQ0elBMc1JPM2tZdkNTZzlJaXNGZXg2dWJV?=
 =?utf-8?B?ZmpmaEZ3NUtDVDM4SVo1dmdlb0dKOHQvRFZ6QXpVcEg1blRxMU9sTmNKa1hS?=
 =?utf-8?B?allRd1dVU01UdW9VaW5ZSVpSZHhTamlrTDlsYVZYQ2ZEVVozOEZvR0dRaU5I?=
 =?utf-8?B?OFpkY1hmN3NkYWdhU1ZMTy9hTVE3VVNGSGdjSFVORnM0dVlJZDVsU0g2RjRT?=
 =?utf-8?B?d1RxSzFPbGVDOVVJUURIY05GTnprU2JsMlVHYmZFV3c0TkhYR3p4Z2orY2Ja?=
 =?utf-8?B?R29CRGZkbWRVT0VIeE00UzhnSzltTHFUYXBGNmhYdDE4cXhDaUlxREphS0lk?=
 =?utf-8?B?U1FQZnV5aU1kQnJDNyt4akJaS2FzY1VtOWhubnQwd1Rralh3KzNQcUtrb2Q0?=
 =?utf-8?B?a1FVRVMwaXp2OGVIVkFScklhM2NjeklGVVZrQkRrS3dHcEtlaEtlWmpOMy93?=
 =?utf-8?B?WnJOd2o4QWRERkY1Z2dSOEtqSWFwZlNONHBiVndvY0IzZnhDOWV0WlpqRnFX?=
 =?utf-8?B?YWVKUmthc2lWc0pMVXFERnUxN0RzOTJYR3lkcHk3U3gybUxNZXpTNWZkN3da?=
 =?utf-8?B?aVgxSnhSMk9BbHQzNmUwUmhnVXNocVhkN1hPaHJRY2FKalZpaHd3bWhuTFZh?=
 =?utf-8?B?a1JTQlcvNkh0T2srMWJ5dnBicStDZ0pHQ2VYeEM4QmFrY0J3VFIzTjVQR04x?=
 =?utf-8?Q?e5QHkO9qlVUBy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1JFRnJkb0pTS2ZGY3BvV0hsU2h6RWVBYldIcUljNzVOY3V0SjF2TXVGbWR6?=
 =?utf-8?B?dWFRQVhROHh4SHJkUGJRV0pCTzZsbUVBZWJ6WXg0QUVHaklQZVI5T2tPRGJQ?=
 =?utf-8?B?VlZoK3pvRFRCdmxXbFJtczNlOU03dmFpV0JTMC9mdWVmUFJWd2xSSUd3dkQy?=
 =?utf-8?B?OG5Td2l1Nzd4WTlsMm5XbEliUnQ0T21UYjdIQUlGNEVNMk8yTEhPMTd3cmFI?=
 =?utf-8?B?TnJDeE9SbjlURFNiUlBjcFpBSlNZcmZQajhoakRhKzVMSHhoN3E5NWphcSsx?=
 =?utf-8?B?RWIvcHluTHdZWWVCN20wOUNqbG5wT3RrL0l1UVRQMHBWUnM1SEdNZjYvVXJ1?=
 =?utf-8?B?bHV2ak1VdWVGcVVmaHFqMjB6TzdlTnljQktmbk1yYmVsVVk0QUsyblpiMlpp?=
 =?utf-8?B?KzRKUGZmNVhsek45cDlucXorWkwyS0dyVFZiM1NHQlZZTG5MRzNlM1h6YUhH?=
 =?utf-8?B?L3oybFo3QnR0NEtiR2lKZC85eVBnNTMrYStVNlp1aU9aUjAyZFhOY3NFMU1M?=
 =?utf-8?B?amhQbjJsYWNET2hDTUtHcnRMN1pOR2owYnNrcmVqRmtlaUNBNUh4RlRMaTNy?=
 =?utf-8?B?cGF3c0l4Q1hiUFhBZUg5YWhockNLSWRqZERHVm1PU21hUVFycHE5R0IxUmQ1?=
 =?utf-8?B?OFV4MmlhUnNLSTNHempHNER3QTlQODEzS21OaTZ4eW5PclgvRVZPRVRLK3lr?=
 =?utf-8?B?aFhXSGJmdW1NMVgwOVVkZTgxQ0ZoM1NvNnovaDQ0NjdMSGpRSHMvbDRWbFNk?=
 =?utf-8?B?bkZaVzNCRDE4Y3JmTFJoZjZEeC9oakZQdnkwY3J0WDhNNzNmZ1FWaHUrZmlt?=
 =?utf-8?B?OURNTkE2NmhZenhPMldSNjRtd0tmUDQ2R1NlZGJBWGw4M21yVkJORVE4RWtx?=
 =?utf-8?B?VUZLY1NDR01IbmcrZnpBcVZXc3NOazJrWUoxL3VkNFlXVlNaZGgySndNN0lE?=
 =?utf-8?B?Q2UyYXJmN2JDcW9hSitPc1NKRWFwdUduZGcyV3QyREZucGl4b2duUEZCMk5N?=
 =?utf-8?B?dmNjd1Vkb2lPK1U4cHNrQW5Cd25OTkFYUWFKTTV3algwTFFqTFpJVUp5WEYy?=
 =?utf-8?B?NlBKcmJlRWRSUHgrQ2pLY0t3ajZUSWMwOEszaWRwbkRZYXFzcEpzc3Y1VnYz?=
 =?utf-8?B?VGpKSEhVOWY3dEhiUlgxdzE2WTdsUDZnTFBaRnNQM3pZbmtLZ1NOVi9yZGJS?=
 =?utf-8?B?b3JaVU4xZi8zdG1DM1ZqZ1FDbWVhSEFLUUpORzBDV2ZVOWNLb2krcnhhblZN?=
 =?utf-8?B?eC9RWWYvV0lxWDUxOWNqU0R0bWdzTU9SZUpIMXVDaGNmemFHejI0SUhDdjJK?=
 =?utf-8?B?bHA4NkpEbE1kdzBTY3diUnJxQ21jQmNRVWdXc1pFeVh1VzdSbi9SWUtEUFhn?=
 =?utf-8?B?OThrZmNNS2RtYlJXNEhhVFllcy83ZzhvSFdUNUdNL01sNW5qMHNMeHFPKzJm?=
 =?utf-8?B?M2R2cStVRStKck9QbGNjWEY5RHIrRlQ5R1RCL1dGVlordU5IK2JQZFg5bkpk?=
 =?utf-8?B?N2RDOFdEVmtHaHQ3OEg5Q2YzalJOTFUvRVdRYlRENHdWL3dZNExPWGhZWXhU?=
 =?utf-8?B?clp0a0hxbjV4aVVlR3dqT0lpTUJGeHdGUC8zemhjTllwUTRIQ0NEVW80cUhS?=
 =?utf-8?B?Mjlqa09VdWRNWDNSeVd5c3FuVUtvcnFjcUVuSERqcUlUTjVmT3dBUWJ1ejBG?=
 =?utf-8?B?WDg5aUdlL2tuMU1neGp3SkJoRFBnRi9sRnpMWlNhRFRZbmJRRjJpL3JLZVds?=
 =?utf-8?B?U1g1N1F1SUJuRnAzczhENlU0a05mYVQ5QzhMTzJpcFg5bytVaGQ1eWd0NGVy?=
 =?utf-8?B?NDVKQWVlZUFiNmNNNmxGME5KVjNnVEVIK3R1SWhsNjQ4OFp0d211TGRKbjFS?=
 =?utf-8?B?dVM0QUc2bkRJNkFrVjkreElCbmY3S3JWcmM5UFI5eWpaeUtTS3NSeGF5Zm5K?=
 =?utf-8?B?bHRtQzlUMkVkTGVmaE5PaW41OVRRcnF4RCtaL0ZNKzVHQ1BTbG9VNXZvMkZw?=
 =?utf-8?B?YXppcFV3K0w0UmN6LzZBb0g1UW5oTmh1TlVCYTN3ZGxrc1hLcnVJUVZwSFlQ?=
 =?utf-8?B?bHRNL0EwR21JRVc1eE5NUmpGVG1ZYmh2aVJQTU9RdW5KNzdMVEpaeEJyNlho?=
 =?utf-8?Q?7irMbjCbiU338fbwP7HuepWKf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a062000-d3de-4adc-6e1e-08dd71638088
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 21:23:53.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPydVVL7C5xFqPxcQ0DGyghtTi/4maIH3urRnW3GHcsipJYCMFSRRDwzcBgS500VkkJ1D3wNqTB3N+xEKLhOIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9640

On 4/1/2025 4:14 PM, H.J. Lu wrote:
> commit c104c16073b7fdb3e4eae18f66f4009f6b073d6f
> Author: Sergio González Collado <sergio.collado@gmail.com>
> Date:   Sun Mar 2 23:15:18 2025 +0100
> 
>      Kunit to check the longest symbol length
> 
> included <linux/kallsyms.h> which triggered
> 
> arch/x86/tools/insn_decoder_test.c:15:9: warning: "unlikely" redefined
>     15 | #define unlikely(cond) (cond)
>        |         ^~~~~~~~
> In file included from ./tools/include/linux/build_bug.h:5,
>                   from ./tools/include/linux/kernel.h:8,
>                   from ./tools/include/linux/kallsyms.h:5,
>                   from arch/x86/tools/insn_decoder_test.c:13:
> ./tools/include/linux/compiler.h:128:10: note: this is the location of the previous definition
>    128 | # define unlikely(x)            __builtin_expect(!!(x), 0)
> 
> Remove "#define unlikely(cond) (cond)" to silence the compiler warning.
> 
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> ---
>   arch/x86/tools/insn_decoder_test.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/x86/tools/insn_decoder_test.c b/arch/x86/tools/insn_decoder_test.c
> index 6c2986d2ad11..08cd913cbd4e 100644
> --- a/arch/x86/tools/insn_decoder_test.c
> +++ b/arch/x86/tools/insn_decoder_test.c
> @@ -12,8 +12,6 @@
>   #include <stdarg.h>
>   #include <linux/kallsyms.h>
>   
> -#define unlikely(cond) (cond)
> -
>   #include <asm/insn.h>
>   #include <inat.c>
>   #include <insn.c>

Sorry I didn't notice when I suggested to submit, but this same patch 
was submitted a week ago.

https://lkml.org/lkml/2025/3/18/1606


