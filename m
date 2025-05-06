Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C926B1FF5E3
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553279; cv=fail; b=iM8nLM30yxq8I6IhkdkQ+O0G7kwnXIi7Cg7HVTd8z8YanB5/f+7DxGL/YJVFFVLK3P+VEmoDIE4cgVP6fbU12F+V00qMzTYBVJNsg2Kzr6e5RgF2UyjzJJStwsDfwnOyA1lzZhgpqih0H05kpDK/akumBZ3Dazyz/3SYaL7bctg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553279; c=relaxed/simple;
	bh=c2WVkZuC3H/knhHIwYIp4iHB5Ipzj4Dmy199py7eUNQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IeHfYFly9N55mwOZ3QMgCcM3R/0PBmkL2vXZTiz7kUIK4wx5qDlMvbOTaht9B3LLiwTvC6ktJR9I1LwSUS/IfIpKWyF91gWGro1S0ilaRPwUrSvzJuhkvg/snhCxniE1uGMhLLncOmdKyOy3N8PuHRUfMrmblVySX7Pz/jT3OlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RfJEdIcp; arc=fail smtp.client-ip=40.107.244.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RfJEdIcp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSg54H7JtR3s/nuhNLMLzBxuhVazX3n8FjndrmZH6GTKngLYnxggyVHKG5zYWF1C0zMxSWqOxySqzT9xOhIuJ0gh9jed6fgLYOLhy9Gvi8zm7DlXIVM/8uH66GCjLJly2d3u+Na68Wha6gC8EXCYMgUIL4twlSlxlGJ9asRG+H/OoK8NHsvIXE0PONKBcOS2tIvsjTjNU7aW0mvjwK/XazdyFufXmNTQSphz3yeKHfpCBfIURDVSm1HIq4gvbiTE9XFNg5tK9sjYCo5reczfl18XFyHXZWi3QLqCWJuJh6XrwxsTPic+GGCZcY5gV0Nz+Wgzxs3REumSlEH1rCc5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAFqUkG9/r6fWr6qcZAOCSyl1ap57fLs4HnFJaAaixc=;
 b=L8fAsl5t5fjMCv1P17S/9cvfDciQiavRCflB/OuNaUfo/q26bcV6173nDxcpwTFDJp65WVy3oDL+hk2XRnbhZwdIHmvUH5ey9FzkdcoeEtey1pCSubXGJtZp9We9npghJ+Emkf+wIFblVwT/ZYeil3p0Qip20eyeEL6JzZ3MnXBOKFs0JKpb3DEXXokHxLQYGJ+IMuqdvqb2b7iAKM3EMB87ln+QfkCZJCbCGIcQl4ttiw7Hdcg+mIYv856z9ZEX+/pybUuqgSjvYo0evhUI9Vp3LaIRoTAR2/PetGIZH/J9dLZAhgFKQwfJEBItbFBwKNsbq/C44Wxdvf1/wF7aAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAFqUkG9/r6fWr6qcZAOCSyl1ap57fLs4HnFJaAaixc=;
 b=RfJEdIcpYN8Df+g7ZS8c9Z5SgLtIor/MLMBeDkvZiDiVcpVU31e86c2EblvjtgdB9+d+4D6+QiHvDW3oAAvPVg36larO0NIOgBS5xYZrbNuN5kGwOIMGNThYyUN5YCB+Ufx/uHhVdA7TmeEfw3neX3L4md5wNpwQWjmfD0mRUdUWrdVTpfxf4GseQImyArJaE95mAVjffjeAOW1mQ7DthQ+qfCnmOd8vzerVHANqAmx7V4CxvWpJYZp2RFRznTVPCtYUN+ZkBWnFjPSDRF0JGY78VXGIl2XvP9A7MMMavI9NEeJDUpemDdkVL0txC7D6pG0r5ngVt4ylWy/JhUYtPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by BL1PR12MB5802.namprd12.prod.outlook.com (2603:10b6:208:392::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 17:41:08 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 17:41:08 +0000
Message-ID: <adda523d-83a5-4a59-8132-57be56b3d6d6@nvidia.com>
Date: Tue, 6 May 2025 10:41:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::16) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|BL1PR12MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: 63dc9c17-f1d2-4dda-4140-08dd8cc52f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnNHL3pTOFozWGsvTFJTNk9XbmxDK3NyRDQwdXAycytWWnpCZGsxcnZGaU9l?=
 =?utf-8?B?SGR1dm1RUzVtRGMydDUwTldldUUySUVEUlVjbG9HZWswbklpWENtQ2tnYlU3?=
 =?utf-8?B?VWJUa0JJL1RYSW9mSStnZ1hRMk1Md0VaRUl1TjVhZW0yelFwOGZQK2M4YlYx?=
 =?utf-8?B?YlZ5a21pK25pSW02OEVLVUNaU3k0a0tMUHFRcjVGRW5OR2ZZQjdWUks0UnFw?=
 =?utf-8?B?a29jckp6WXluTVdlS1ZzcmdFYVN3bzBSbm9COStCVzdtNkRJa1hXLzE2SjF2?=
 =?utf-8?B?OUxQYzdnbC9KeExtMVNTQUZkY1dORm5jTDZ2NmNjUXhEVmRtT2FKQVo0Tkdm?=
 =?utf-8?B?aHFscENyelBhZ3h2TTdvV3dieUdSSUlkMFFKSFF6UEpkcTdSYnYrb1EvaCsr?=
 =?utf-8?B?UWtJY25DL2RwRVdFRHk1bFdoUkZja1ZBcm5kRlZaZFZ0b01sOE1wdDN1VFJa?=
 =?utf-8?B?N2Fha0V3UlBUNlNrNjRtV2pQZVFnRXZXNS9GMkhkYnVMZWNTZjNHbktwNkFq?=
 =?utf-8?B?N3QydWErOUtJdU9IdURycEZKYnMyTWVZQmlBS0tNODNhM3lEVVhXUTZCYVVJ?=
 =?utf-8?B?Wlc2K1h2dUxvdTdoL25BTTk3SkJxNi96cUFEUEw5TldPN2t6WVRhVHJTT0hE?=
 =?utf-8?B?dk9MYldxRXFsMDlrT1Bza25OU0FCMXI1dytDUllXTFQ5QTBtQWxVV21pLy9i?=
 =?utf-8?B?ckMvTHBlamRkK3pUcXV5ckxBSkdwNXhNWDRPQkMra1hzeTB2M0Vrems0Qjh0?=
 =?utf-8?B?eFNUc0JVNk1wTkRnazMwRE8wZ3djMlVCK2dMMWV4RlBzdGlUNldGa1ZpbXlm?=
 =?utf-8?B?Y3J2L25PL01mdTFIN3VTd2RBOENMWUhVSzM5aEllQjNuWVI5SFk1VGUzcWVR?=
 =?utf-8?B?eXBGR0hCSFdQaXhhM0tDMEJsVXlKS0t5cU9JUTI4RmVoZERLV3V1enRoL0lZ?=
 =?utf-8?B?dGVIbFhmYjlVWnBSNExJcjliMFV2b0NLcytiUHhlb0FGNWFreEhDU3kxTmlS?=
 =?utf-8?B?WUo0Tjhlak5SdHNPTmJmNHYrWDJvQ3RQOXJEUldvZ1NtUlQyNlNSVVRvUHpU?=
 =?utf-8?B?YXMvL1ZsOUxCT0g4T0x6dlhGMjgyNkk4UWdDSmhpYkphKy9iVXVxaFQwZE05?=
 =?utf-8?B?U3k1WmNoaGlTQzJzYkMxODlxVCtodnFUTFdNTnEvMTJTSjZVaG92VlFDVnZi?=
 =?utf-8?B?YUh5S0tLakkrM0JEQ1Y4L3RkVHhaN1VTZlBQbFZwd1RQQmR6dCs2Y093VlV4?=
 =?utf-8?B?Z2FmWENGWGI5SDZwMGFtc0lmWlRqM0V5NnJYSzB1dWt1Sks3SjlmeDZ2SFNX?=
 =?utf-8?B?cnBZeC9ibmp6SmVEOUZueWtXZ0RBcS9TSm0zcHVaWW9oYzBmbFA3cFIvN3Q5?=
 =?utf-8?B?Z0NDWXo0dkdaMnFCakswSjJxRGp3Zkw5RWZpSmMzVjJBZjVIYmcyNXllTE9I?=
 =?utf-8?B?NDdKVWsxRi9TUC9HVVlsNFBwbjdWWTdRQ1Q1UndrYVBlUWZmSHFsQTBGMHJJ?=
 =?utf-8?B?NEp4NzlGVUk3ZHJoSnJ6OVZyejgrRVhtdW0rdS8wZ2tRUGxRb0pwbXBsL1ov?=
 =?utf-8?B?WXZobDd2R1V5K1VUNXhGR1Qxa1ZoMW1aV0tjRUV5T1FLV0N3U0ZrRDhUeUJE?=
 =?utf-8?B?SFg4ajF4L3lENDVrNVZkMHp4aitwTTRjN1VoVzhUTW9uQ3FSUjA2TmRwYWNs?=
 =?utf-8?B?dEhXcG1rSVBkQldHc2Z0dFhLekVZQWVNaTcxenQrOFBPdXhZSlRNcFFlUFly?=
 =?utf-8?B?MFBPRjc1VzNzNjE1QzdJcTAyMjV4Q2lCd3ltU3RaZVJ5bnU3WWdHWE1DcmM3?=
 =?utf-8?B?cTdjY0Y5VndUR3MxQTFSVDNKOVo2SHNHaHUzdjRaWE85Z0dPc01ocERqMzdm?=
 =?utf-8?B?aVRKRCtFV1E2Qk5PMlJpVTV3cEJEalE0TzFIRzlFdURFWlNJdFFMMU9mV0k1?=
 =?utf-8?Q?FToqKIhmHeA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2NhM2oycmxLY1V4MVkzR05nOWIvWXBoQzJ4M2NqSElvSkdMMi9kc1Z3SUhP?=
 =?utf-8?B?MnRGeWNjWGxjZkdwbEtsdWNVbTBwNHhqYjhTWmJacTlkZksxQU0vU3VidWNL?=
 =?utf-8?B?TWI0YmNORGdFeC9WQjBxL243TlYxTVN2ZEE4enk1anpRSXNVTjFmaVdrbHJu?=
 =?utf-8?B?ZFM0TXZsREcvaXdGQ0k1R1h5ZnpTemZVREdReGZhclJlSzJTR2xDNlU2aHJL?=
 =?utf-8?B?UU9EeFAxNTVyWUpSUTRrck9ZNm1EZXpOYk9VWWFmMEhhaVl1MU9JcEFIeklG?=
 =?utf-8?B?VmVha0N4bXBjT0wwME9EdmI4VXRBMlN4NE9ORnVsRS9LaHZLSEI2LzBFWUZn?=
 =?utf-8?B?SVY3eFJab2prYlhyR0hEL1liY0VHbW9mbDRyai8yZmR6ZXhvTEZVckZuSWpn?=
 =?utf-8?B?NTR5RDIxVTg1NitzTG51eERLQ1RFYzJDRU05cDFicnQwekc4TmZ0bE80bElI?=
 =?utf-8?B?MXNGQ2FkTWUzWVZhaXgwTEJLd1Nxa2xmREp3MDF6YndKMFlnaVJxQ2FGREt5?=
 =?utf-8?B?cEZ2YVIySG1rNGVXUG8wVmVwY25EYTVhVFg4MTM3QzRPOGErSjZWUGVxQWpB?=
 =?utf-8?B?a3ZLSElScUVEVWtKOENkclJiSEp2dGkybExjSFJ0VEttNzU1NWNTKzhranUv?=
 =?utf-8?B?UTFxZUFvUnBTR2ZraGFGOFNWUUVWU2oyQXNwQ2xaZ2FNbW53bnNUY0tBU1Jy?=
 =?utf-8?B?MGhHZDV2ZTJSWFdLS3pPYTlmdHRHK0RoaVp5Vk5nOFo2N2JZME9xdU1hTnlF?=
 =?utf-8?B?SThzMzk3UExtaldVeW1nd1FlaXNwdFk4RDlodkJ6VXZDTDVNOVVLejVTTGh1?=
 =?utf-8?B?Y0pycm1WTEttUDZKNDBYU1JzL0FMdTdZZStqZHpJbDFIQnRpQUVGZHdVWDhi?=
 =?utf-8?B?Njl1ZUo5YWliLzJXOEMyOVlJQ1duL3dXRi9SQWJ4bXhrSTJDWFVzT1JaY3I1?=
 =?utf-8?B?ZFBsam4xMW0xZFkrSVgydFU4dThDTGxXMzI2cXFHZUY2bUxpTU5jdlE3Rjdy?=
 =?utf-8?B?T081aDVMbFV1d29BZXVmVjhtbTJUTFRLRnJ6TFV4Um1GdmM3YmpEYnhFMjZ2?=
 =?utf-8?B?NHQ4WjBKeUhJMlloT3VISG9LQ3F0RmdwelVkMFlzT3c2MGNyRHZ1dmV1dDlN?=
 =?utf-8?B?NDFaaU82dU1uTlVKdzFNamRuaEZwYTdYSzF3Lzk5K1REb0tIWDMwcnVIUklK?=
 =?utf-8?B?cHVjWG5XTSs3MVRKRzhJSVJxSWtneWlHY2FJdTc2MDRDWFNYUExjMmlKdzlo?=
 =?utf-8?B?VmlBTjlDa1lySThmelRMVDVlbm53a1JoRndJaEFzWjVJR0hHWUlFMXNENDhh?=
 =?utf-8?B?bkI5U0Z2N0U5a2x0UU85M2JiR0NlZGk3bFBTcXdOYVV0T1FQZnc4UU8xd2tn?=
 =?utf-8?B?UG4yMkZoMUsreDBicWhWZnUrZ2NobnU3eUViVjFGa2ZqcW9ZSU9KMGpicjB1?=
 =?utf-8?B?MExja1p5dVVIUExQU0ZJdk4yb2htcjVvZGl2ZEpKM0hpK2pWZEN4TmpHSE92?=
 =?utf-8?B?R0NCb3E2ZTF4eWxiU1l2SWMrdnpFRllkOUxKbFRqdWxpRC9GOUh0WVJ0MWhT?=
 =?utf-8?B?Uk80Zkx4cy9JODRYZmJqeitXTFlobnpJZ3pUTWg3aFlpQng2eWZYWjVmK1po?=
 =?utf-8?B?R3VVRG82TWRVRHcwRERVb0ZXbDg1R0FrZTk4WjZ1ajZxdzdRS3pIdmJndXJ1?=
 =?utf-8?B?MW03K2xYUytpQ1BhMENQY3ZQTm9oUlNBcE0xSUZqS28xN2dqa2V6WGhkSm1o?=
 =?utf-8?B?QnFYTVVHZ2lzR2EraGFndUxoeTNqMVpISkNhMkloM2FCUERWczhPbG1XMHl2?=
 =?utf-8?B?dTM0TTdrenZsT1hZb283Tmgya2NKeVlWRm40MUtWUzk2QkNKOEpNNnZ3cjNq?=
 =?utf-8?B?bVA1U2VoUFFTT1JLVVJaeFhCVDBVbWdVVGs3NVU5UVlSMUlWUW1IUDduMytq?=
 =?utf-8?B?ZjRHSGdXdm11cUhSV00yUGNvSWV6T2twRi9nQWZ3Q3hISksyV3B3MW95Uld1?=
 =?utf-8?B?dEQrUGJKcmxlSGptV2I5WUpUbG5tS1VKbjFwakNndWdrU2gxQVltN1lyd29N?=
 =?utf-8?B?alBQNnBjNURHUkdRc0tPRXM2dFBOYTNaaHE0Y1hxSDJ2S2dFYkp2Z0VONytx?=
 =?utf-8?Q?oSRHSOeIjf7KptJmVxKKyXFuQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dc9c17-f1d2-4dda-4140-08dd8cc52f22
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 17:41:08.5606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atmp5geAfd6kOqE/z5SQvsh7G+nE2R74Nub+RWh3VZg4a6SNlLGDrSt+2HQmxRcczDcEH1E60kLGQDnFCeC/2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5802

On 5/6/25 10:36 AM, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for GUP (Get User
> Pages) support and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard

> diff --git a/MAINTAINERS b/MAINTAINERS
> index d274e6802ba5..9c769f7d135b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15540,6 +15540,18 @@ S:	Maintained
>   F:	include/linux/execmem.h
>   F:	mm/execmem.c
>   
> +MEMORY MANAGEMENT - GUP (GET USER PAGES)
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Jason Gunthorpe <jgg@nvidia.com>
> +R:	John Hubbard <jhubbard@nvidia.com>
> +R:	Peter Xu <peterx@redhat.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	mm/gup.c
> +
>   MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>   M:	Andrew Morton <akpm@linux-foundation.org>
>   M:	Mike Rapoport <rppt@kernel.org>



