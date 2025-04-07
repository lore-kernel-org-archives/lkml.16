Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D1722B8C3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023815; cv=fail; b=t/5eFhIwRdKaKYkBU3EkWg5sQErnXp2EqiGRo2WR5hCYm4eInoQ9EGgXNa6tJbQ1v4vIpT2urEzISQUCAmHBhRibhUWCN6ktBpCY0QE1HuD1f0N9lwXX7Wie+jAs5cvtccBJzJSzChd+FLU1JKZYpFBncLznaxVEn0/zrqWhuS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023815; c=relaxed/simple;
	bh=QWIppXXuHhYC0LOijT734AhNV/UMkKA6f4lPt4D4Ptw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fi/qPCsVZ7gevKirEbJJ3poTvaOwiQllFprF1dm63exC9j5NpeD9GDqwcX8d02Q2mKERCdQ+9LOxI7kGWoELm6ArG/SHnXJUTalXEdSGe+X/MtSnmaDcsoRdqYmnvmZGwmhX4hAgXh2fu82qSGR7zpia+Ek2ZIEWx9YGwGqeWlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M9YUZNO0; arc=fail smtp.client-ip=40.107.101.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M9YUZNO0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMXDJKs1xUxnAcYIH8jZwz3Mn4OeUD4FuSc52kS6emXy4w/eCC7Euw1L9OwmOLCtMIT+a5BO0q+TUYfDLBktiEE+e3cHRTwxyVTZ7qg4isgB2HjGL6FoYhJU8Y1I4R7bhq8dWUodq3YpxL3fV/VbfNDwZhfToT04Zlm0Qs7tQ20STBtLxJnaIuV7XgX1/6kJ0Eoqg8P+KwTo7qfcuQEizOlAiOemJ5qQqbiiVDcjSHrA2Pjsn3tBZjEuHcVNYVwtVJZxFqcPzN2XbgTHE1UFjQLuHPElXqsVgoENLt4anoqAsZV+6w5r1MLEFNhAHcKFBriPKS/rq3pJmkAygleCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9id0xPgofjByflHh0AZrLg2rBHmqEES3j34YZ2qHerU=;
 b=VBnaWyKCZwqax3M2rKdGOVU9xRbp2oXd7N8hdkwroVlN7wnBBckzxtMTRk2AO5JnBEDbmH0a9K+afcTrn+a3lLIlkKX0xtZ16xjxl4nxebQH6BhUSynfqNVqX/WdUoQCbx/6Uu6xXZ7x3RZgN65sOShareuQ52MVxRPyqx//AbqELo5Y4g/COw9SpG+XJqW8Ls+t1LkJ0CrC4joKAEg/d+89jIXx6JO0s9bTzrcoM1OSFYcKgR7Gjw1RQboxGbNNQ8sG/KJ9kji8fvp+SKmrZsH313H0KTlGyTNJ6/dFGFCyj31v49kY1GZwaGgyysw0Ep3YstjAOrQqxJ6alSQbNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9id0xPgofjByflHh0AZrLg2rBHmqEES3j34YZ2qHerU=;
 b=M9YUZNO0RfM9uD0UpJHjN9puJa1qaRoUaH3mwLjf/Sia1M9w2id6KCR3+8uFv/8HS4FFhw3g7nrOutXSUWoIHSQIfBCuL6XMk7zRHBk4mRNaVdXUKIx0iWMZKXEYhXeFIZPdNjXO3lnRU2s0YrP//COJqyriAN1sWYVrN47xnoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6966.namprd12.prod.outlook.com (2603:10b6:a03:449::14)
 by SA3PR12MB8047.namprd12.prod.outlook.com (2603:10b6:806:31b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 11:03:32 +0000
Received: from SJ0PR12MB6966.namprd12.prod.outlook.com
 ([fe80::6688:276b:7e47:17d5]) by SJ0PR12MB6966.namprd12.prod.outlook.com
 ([fe80::6688:276b:7e47:17d5%5]) with mapi id 15.20.8583.045; Mon, 7 Apr 2025
 11:03:31 +0000
Message-ID: <432f63d5-cf96-4041-97b0-4f218876b9f4@amd.com>
Date: Mon, 7 Apr 2025 16:33:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: pcp: scale batch to reduce number of high order pcp
 flushes on deallocation
To: "Huang, Ying" <ying.huang@linux.alibaba.com>,
 Nikhil Dhama <nikhil.dhama@amd.com>
Cc: akpm@linux-foundation.org, bharata@amd.com, huang.ying.caritas@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 mgorman@techsingularity.net, raghavendra.kodsarathimmappa@amd.com,
 oe-lkp@lists.linux.dev, lkp@intel.com
References: <875xjmuiup.fsf@DESKTOP-5N7EMDA>
 <20250407063259.49271-1-nikhil.dhama@amd.com>
 <87r024o1zt.fsf@DESKTOP-5N7EMDA>
Content-Language: en-US
From: Nikhil Dhama <nikdhama@amd.com>
In-Reply-To: <87r024o1zt.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::21) To SJ0PR12MB6966.namprd12.prod.outlook.com
 (2603:10b6:a03:449::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6966:EE_|SA3PR12MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 630854ad-fe68-4959-1582-08dd75c3d561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODlnTmFPM1AyK1ZnamlrbE1ONzlYTWEwc0orWUR2UzlUZ0MwQnJhUm04QXQ2?=
 =?utf-8?B?TGFTZ0tyOWt3d2djdzhsVVBTZU1xejN1WUpLdEo0SzUwQmNHV2ZtUlg0aktM?=
 =?utf-8?B?eDRWVUFsbE5mQ2lRVlZUSEduZmtHc0h0TElwOHcxWCtIa2YyVkxKRmN1N0Vh?=
 =?utf-8?B?VlpuTE10MWd5bk5GV1J2UjRlVVZaQUZLR05jWnU5TTdiN1BzNGlXUWptenho?=
 =?utf-8?B?OXpFS2lBTDVZUVFrbVFWTUpYNEZINUphSzh1NkRXRCswV2xES0VVbTYxT3lu?=
 =?utf-8?B?dWJMamtLTzhxR2ZqNEtyY1Zjem9CNWtkRnhXSnFxRzBrQTJneFp6YUQvUWhV?=
 =?utf-8?B?TkEyUEp3VERERmE0VzlIdjVGdW9lcjhFK2k0Y2ptWlhEMFc1MEdXYjVoYTdF?=
 =?utf-8?B?bjBrc2dvdzRpNEVWY0JIY0JxbWVBbmhENEVvU2svRVFrYjllUS9UbzFrR2Fl?=
 =?utf-8?B?Zy9LRnh5d2JkWHQ4T0tucUtwQWZJRktNNXlJdmt3aTVOOFNZdkZ5TDVIdmhk?=
 =?utf-8?B?UzhackZJMkxOUDlwci82S0RkdE1TQUdJSU5ENWVheUkrenpIVFlCNlBSYmwz?=
 =?utf-8?B?LzB0VFNNY1VPZ0tHdC80dXd4MXZERTNCV2orQTAvQWtBRVpXTTkyRnZpZzRp?=
 =?utf-8?B?VHJnNTZrd29wMTNhZnA5YVlwK016enNzS1VsU2hMQ3Q4TmVHWllicHl5NkFj?=
 =?utf-8?B?R2xDaUZ4d2tFSTlKUmZBUEhjcWF3bmxucm1DaVFCb1VhSlhXMjkrQXN6YU5j?=
 =?utf-8?B?NUQ0OFdsdTVQd3dCK3I2b092ZlJBc21xOWhObDNxVlNNZFN1ZDRIN21QWlR3?=
 =?utf-8?B?T3hFL3Zha1ljcnQyNmRzcE9HMTBmVkJIZ2o4Rllpem1TUjF4WG4rb2xsNWo5?=
 =?utf-8?B?N3lFalhtTkN2dTJ2bVdlc2JvbWRTUmdBRGZ5VFV4aS9hcjA5dlFUcGdTdGxy?=
 =?utf-8?B?TzZncFVHdWpnUDR2Q1gwTCtFMXpkNVA1aUkwMHkxQ0VLSTEwUEVKZHhpZ0tw?=
 =?utf-8?B?eEUxQWtVNDdXT3VFNzhCaUJpeGJ1eUE0aTV0a3ZPbGplWXZ0cXRmNGNGS0Ju?=
 =?utf-8?B?aVoxd280blYvRjkvM3ZOTXVYMStzcm1qNVQwMWk1RWxZSmJsWkpQZjN6WGlE?=
 =?utf-8?B?Si9PRGRFZFIxUGI5Z3Z6Z2hJQTIzNUdOU3ZzZ2dQeDlLNVVtdnVsWHJxOTg1?=
 =?utf-8?B?Zm5qOGt5QTduMkhvS1Vkek1DdlZoWDFBM2NhTzhDWE85Q2NoQ1J2QytGZEZI?=
 =?utf-8?B?UzBrbVFOQlBpVzhqQkNham50TDc3Kzl6aUFHMzJwSzl6cklqbTB2WUZidVkr?=
 =?utf-8?B?YkRJRHNSaUJjcFByVk1xcGp6d0trZmNUdTJjclZpSDhaOEk2SUpCZ2RxZTlU?=
 =?utf-8?B?SVIzbVArUGtuaGtQbkhUQ3ZRbmpHYUlPMjJnWkZvWnVSd1VXY0M2QndDVFZN?=
 =?utf-8?B?UHZSMjhZaVora1NzVHFtOUtTSm0zSmtvbGMvSnJ1KzFITWN1aGFybU5iY2lz?=
 =?utf-8?B?QThQWkFWM0EyREc2di9KbTViVWpJSVB6UEhiQXc5ZUFMejQ0dW1xWktGUWZv?=
 =?utf-8?B?b3dBbklGZEpKQUFPeHh6dzAzbE9WR2tCazFjdldLOUNWZWJ0SitFTmxNTDZv?=
 =?utf-8?B?RVpaeCtjUkx0Lyt3NnliSDlaWGdHZzA5czlqYXlzbyt0Wjg2ZCtvbU9lbW9C?=
 =?utf-8?B?bGxzVGRuSE00WkhSTVdOcTMyRTltZ3lSSzl1aUEzR0dNVWJrY0lyMGxOVVVV?=
 =?utf-8?B?VXIzMUIxTDRPc1lDTWhIUXp6U0QyT0ZHckMrNVZuTk9OV2lWZGtiQ0Z3WGIr?=
 =?utf-8?B?UTR4dFU5VzhWbHFRb0VIalJ1OHFUNUZTNXFmWXlrMW1hQ0w0V2J5YmkzeUR1?=
 =?utf-8?Q?P1JiSFwhb9zTh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHRpeU9rNUdZYWx3bExvdEM4V1FjeWJzZ1RTR2llRlhZZlpCdWRLTkR5SUpq?=
 =?utf-8?B?azZwZUo1K0xTR0F4WDVta2VudE9keDlzbnY2T3k3SjRFbzRYb1A2alVxTkVF?=
 =?utf-8?B?dnAwTzBoZWFyS2lHYUNYNjFoNFZhQUlDSXFBUlFEeFJzUTRTckJrWDZONkZ6?=
 =?utf-8?B?eE1sM0RFQlBsc3hEL0ZJZU5TUmZmcGV1MjFhN2pSUnFrd1AvUWpsNlRSbjJs?=
 =?utf-8?B?UUJmNEJhTXRWd1hqRTNERkw1NlYvK09mRHhDL05DYmdZdnBuWFV3d3cyUjR4?=
 =?utf-8?B?WDExek1UME5qdzlxMGMvT1N5Mi80QmRscDRlV0IvaWtRVHlSaHYrWVNMYmFo?=
 =?utf-8?B?N0lSZVJ5VjdYQVJXN1V2citwQTZzY09TMW9BNy91V3FVdlRsY2txL2xCN2RE?=
 =?utf-8?B?OU5OQ0ZVMWE2aFM3TW5vTlhPTjQzVDFsWlRzMkN3d0VxZ3lJcGM4N0VrV3FM?=
 =?utf-8?B?REY0OUtuNDFwY28xR0lBQXpnSFd6WmJtM3RIMnRKcWh0bml3TVg3TlJYNzZh?=
 =?utf-8?B?djAwUTFsK1d6MEdDbzM4aDExNWlzZHdoUnlwZW11SnYzUnB4TVBIT3NVSCth?=
 =?utf-8?B?cC96YTV0cCtvWlY2T3V0OU02eWVqS2ZpZDNnaExOQWs5b3UvUlJoUWU0NDk3?=
 =?utf-8?B?RWM5cFlteCsvWjhJWTRDL2hDMUdsWjJvdDJhTnV1SzN1aTFmems1NjM3WFl2?=
 =?utf-8?B?Q3JRY204bi9zYmdsTGYwQTVnY2s4OVRqeU92Z1Via3RQZ3MxUWV1UzJnSEN4?=
 =?utf-8?B?b2ZtcUtqM3RlQmJMa1ozQzUya3FjbEI1Smltelk4VzVQd2dtMVVEcWtLV0xZ?=
 =?utf-8?B?eEhpbk02dnEya2hCTnpWbUZVUWJUV092YVVscGxBRXJJb25LSVRHZzlKYXFy?=
 =?utf-8?B?TkowVUJDSE01RkdVTHFoQ3hrU0J3NGZkSTlaRzYzK2NRcnN5VXR1NnNCYnFW?=
 =?utf-8?B?YmRzd0hyaTN3TUFIZFVEdDNTWGszVHdDUzU0QWhCa0oyVXY4SlVmS3pTc1Q2?=
 =?utf-8?B?eU1nQXpFZVZGQmxPTnJ2MGJVdm9UN1ZhOVU1YlBqRDdYQkM5ZTBZTGhjVTRu?=
 =?utf-8?B?VFpMbmFXS0hpKzVTRkQ1ZUFFYXdxakJHcXNpTUdlRm1oSkU5eW03MzEvMlRv?=
 =?utf-8?B?MFRma05mZzB6NktUb0FHUk5TbUgwbVdOS1Vjb0U5SUtVbnQ5L2FmaDk1b2Zr?=
 =?utf-8?B?cGZxTzBEa3Uva05JZmtCaExEdXp5V2RyREE0VlhreCs5azhHM1VDZGEvb09t?=
 =?utf-8?B?YXU2aWs0WjBXUFd2YXc4T1o3RDYraDljQmZHYTU0U3h6MmpLejNUTEFxS2Jq?=
 =?utf-8?B?ZE40YUtGb1QvUVgwdDZidlMwVEtTM1BLZ3hWSTJ6YXdEUTNWNFdhalVlcm1N?=
 =?utf-8?B?WDhVT2w5dmpzK3B4aEsvalhrcHI2bHp2SVlvdXBtOHE2VnVDNzQxNTlHZ0Vn?=
 =?utf-8?B?MzNZYkUzbU03UHk4QmtoQW8xcGNGcldnQm0vV0VtazVHK3BtRzF4a3NZVjlR?=
 =?utf-8?B?R255YytQYVlOMEJ5RXdibURpVzlSMjR0dWpVc2F6cmNGUlA3eHJOUkRWQldv?=
 =?utf-8?B?SXhRQyszZFZQMGZhMTgzU3pad2I4eVRPZWI3ZVBWQUlmSENoZGRIb0MyOXJM?=
 =?utf-8?B?bTRKdlRnOUduamdQdzkwelp1Zyt4aUg0bG5Lb1NQR3VCY2JqSWt2Q0tVaUEr?=
 =?utf-8?B?RENqMUdZQVJpalllcWhCT1krVm8vcGl1OFhsaUlPM1FrbU9IbkpidzJ4NFJL?=
 =?utf-8?B?aURIMm5RcHVIcWViTktBUWYyWFh5WDQ1VTBndUlBUDUzMHBSbWErUHRRa3Zw?=
 =?utf-8?B?b3QxNDRUUDZ5cEhpaTNWR1p3V05ZNlg1SG5uVVA3SGtsU01hb0NxRTFIQURl?=
 =?utf-8?B?UmZNL1Z3UTVZdHlCcWtwSFhMOTlXMCs5T1lsR3NCbTFXeldqM21xTi9GVmhw?=
 =?utf-8?B?ZXdOZlF2WUFBdjRPdXNqaVFjWDB1RzljUTE5Nk5NWDVFS0xyT04yU21KQ3VV?=
 =?utf-8?B?SkVweG1mRFFxSURWK1daZGZvWmZSVm9TRW5zU0dvYUYrUWpNTzJRcWZjNWR1?=
 =?utf-8?B?VWc2djhVakhpZndDWmhoRlBKRE1VSklWWnpscGRYWTdYc3dMeXlnUFNCb01O?=
 =?utf-8?Q?FhGtBihpoz0eKovLB92ynvEVR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 630854ad-fe68-4959-1582-08dd75c3d561
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 11:03:31.8889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vz1uqjL6rgu/OZj77ZXBL9HbnTzFwbirmaG5I9geq07vxv8BBG6mwNfJF80DouUSE+V6sAtmzG1/+jQmx3T48A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8047



On 4/7/2025 1:08 PM, Huang, Ying wrote:
> Nikhil Dhama <nikhil.dhama@amd.com> writes:
>
>> On 4/3/2025 7:06 AM, Huang, Ying wrote:
>>
>>> Nikhil Dhama <nikhil.dhama@amd.com> writes:
>>>
>>>> On 3/30/2025 12:22 PM, Huang, Ying wrote:
>>>>
>>>>> Hi, Nikhil,
>>>>>
>>>>> Nikhil Dhama <nikhil.dhama@amd.com> writes:
>>>>>
>>>>>> In old pcp design, pcp->free_factor gets incremented in nr_pcp_free()
>>>>>> which is invoked by free_pcppages_bulk(). So, it used to increase
>>>>>> free_factor by 1 only when we try to reduce the size of pcp list or
>>>>>> flush for high order.
>>>>>> and free_high used to trigger only for order > 0 and order <
>>>>>> costly_order and free_factor > 0.
>>>>>>
>>>>>> and free_factor used to scale down by a factor of 2 on every successful
>>>>>> allocation.
>>>>>>
>>>>>> for iperf3 I noticed that with older design in kernel v6.6, pcp list was
>>>>>> drained mostly when pcp->count > high (more often when count goes above
>>>>>> 530). and most of the time free_factor was 0, triggering very few
>>>>>> high order flushes.
>>>>>>
>>>>>> Whereas in the current design, free_factor is changed to free_count to keep
>>>>>> track of the number of pages freed contiguously,
>>>>>> and with this design for iperf3, pcp list is getting flushed more
>>>>>> frequently because free_high heuristics is triggered more often now.
>>>>>>
>>>>>> In current design, free_count is incremented on every deallocation,
>>>>>> irrespective of whether pcp list was reduced or not. And logic to
>>>>>> trigger free_high is if free_count goes above batch (which is 63) and
>>>>>> there are two contiguous page free without any allocation.
>>>>>> (and with cache slice optimisation).
>>>>>>
>>>>>> With this design, I observed that high order pcp list is drained as soon
>>>>>> as both count and free_count goes about 63.
>>>>>>
>>>>>> and due to this more aggressive high order flushing, applications
>>>>>> doing contiguous high order allocation will require to go to global list
>>>>>> more frequently.
>>>>>>
>>>>>> On a 2-node AMD machine with 384 vCPUs on each node,
>>>>>> connected via Mellonox connectX-7, I am seeing a ~30% performance
>>>>>> reduction if we scale number of iperf3 client/server pairs from 32 to 64.
>>>>>>
>>>>>> So, though this new design reduced the time to detect high order flushes,
>>>>>> but for application which are allocating high order pages more
>>>>>> frequently it may be flushing the high order list pre-maturely.
>>>>>> This motivates towards tuning on how late or early we should flush
>>>>>> high order lists.
>>>>>>
>>>>>> for free_high heuristics. I tried to scale batch and tune it,
>>>>>> which will delay the free_high flushes.
>>>>>>
>>>>>>
>>>>>>                        score   # free_high
>>>>>> -----------           -----   -----------
>>>>>> v6.6 (base)           100             4
>>>>>> v6.12 (batch*1)        69           170
>>>>>> batch*2                69           150
>>>>>> batch*4                74           101
>>>>>> batch*5               100            53
>>>>>> batch*6               100            36
>>>>>> batch*8               100             3
>>>>>>
>>>>>> scaling batch for free_high heuristics with a factor of 5 or above restores
>>>>>> the performance, as it is reducing the number of high order flushes.
>>>>>>
>>>>>> On 2-node AMD server with 384 vCPUs each,score for other benchmarks with
>>>>>> patch v2 along with iperf3 are as follows:
>>>>> Em..., IIUC, this may disable the free_high optimizations.  free_high
>>>>> optimization is introduced by Mel Gorman in commit f26b3fa04611
>>>>> ("mm/page_alloc: limit number of high-order pages on PCP during bulk
>>>>> free").  So, this may trigger regression for the workloads in the
>>>>> commit.  Can you try it too?
>>>>>
>>>> Hi, I ran netperf-tcp as in commit f26b3fa04611 ("mm/page_alloc: limit
>>>> number of high-order pages on PCP during bulk free"),
>>>>
>>>> On a 2-node AMD server with 384 vCPUs, results I observed are as follows:
>>>>
>>>>                                    6.12                     6.12
>>>>                                 vanilla   freehigh-heuristicsopt
>>>> Hmean     64         732.14 (   0.00%)        736.90 (   0.65%)
>>>> Hmean     128       1417.46 (   0.00%)       1421.54 (   0.29%)
>>>> Hmean     256       2679.67 (   0.00%)       2689.68 (   0.37%)
>>>> Hmean     1024      8328.52 (   0.00%)       8413.94 (   1.03%)
>>>> Hmean     2048     12716.98 (   0.00%)      12838.94 (   0.96%)
>>>> Hmean     3312     15787.79 (   0.00%)      15822.40 (   0.22%)
>>>> Hmean     4096     17311.91 (   0.00%)      17328.74 (   0.10%)
>>>> Hmean     8192     20310.73 (   0.00%)      20447.12 (   0.67%)
>>>>
>>>> It is not regressing for netperf-tcp.
>>> Thanks a lot for your data!
>>>
>>> Think about this again.  Compared with the pcp->free_factor solution,
>>> the pcp->free_count solution will trigger free_high heuristics more
>>> early, this causes performance regression in your workloads.  So, it's
>>> reasonable to raise the bar to trigger free_high.  And, it's also
>>> reasonable to use a stricter threshold, as you have done in this patch.
>>> However, "5 * batch" appears too magic and adapt to one type of machine.
>>>
>>> Let's step back to do some analysis.  In the original pcp->free_factor
>>> solution, free_high is triggered for contiguous freeing with size
>>> ranging from "batch" to "pcp->high + batch".  So, the average value is
>>> about "batch + pcp->high / 2".  While in the pcp->free_count solution,
>>> free_high will be triggered for contiguous freeing with size "batch".
>>> So, to restore the original behavior, it seems that we can use the
>>> threshold "batch + pcp->high_min / 2".  Do you think that this is
>>> reasonable?  If so, can you give it a try?
>> Hi,
>>
>> I have tried your suggestion as setting threshold to "batch + pcp->high_min / 2",
>> scores for different benchmarks on the same machine
>> (2-Node AMD server with 384 vCPUs each) are as follows:
>>
>>                        iperf3    lmbench3            netperf         kbuild
>>                                 (AF_UNIX)      (SCTP_STREAM_MANY)
>>                       -------   ---------      -----------------     ------
>> v6.6  vanilla (base)    100          100                  100          100
>> v6.12 vanilla            69          113                 98.5         98.8
>> v6.12 avg_threshold     100        110.3                100.2         99.3
>>
>> and for netperf-tcp, it is as follows:
>>
>>                                    6.12                     6.12
>>                                 vanilla   avg_free_high_threshold
>> Hmean     64         732.14 (   0.00%)        730.45 (  -0.23%)
>> Hmean     128       1417.46 (   0.00%)       1419.44 (   0.14%)
>> Hmean     256       2679.67 (   0.00%)       2676.45 (  -0.12%)
>> Hmean     1024      8328.52 (   0.00%)       8339.34 (   0.13%)
>> Hmean     2048     12716.98 (   0.00%)      12743.68 (   0.21%)
>> Hmean     3312     15787.79 (   0.00%)      15887.25 (   0.63%)
>> Hmean     4096     17311.91 (   0.00%)      17332.68 (   0.12%)
>> Hmean     8192     20310.73 (   0.00%)      20465.09 (   0.76%)
> Thanks a lot for test and results!
>
> It looks good to me.  Can you submit a formal patch?

Thank you Huang Ying,  Yes,  I have submitted a formal patch with this.
Patch v3: 
https://lore.kernel.org/linux-mm/20250407105219.55351-1-nikhil.dhama@amd.com/
---
Thanks,
Nikhil Dhama
