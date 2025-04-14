Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11021077.outbound.protection.outlook.com [40.107.192.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D92723D2A8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.192.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744644511; cv=fail; b=qkuGHBbQjONZEW902kMyMjFvRS9ZunRK1pgDDSjYi2+WOS05hvcnvcHShx5bsznGNjGPpPTd7hLM3FbEOTtpoIAwwGvObV64j0rEjxVy3cisRLiaUkQKgIEg08+AXVu25eXrvBNAZzp4NscTq0j/SWyn1rX19AGykIHeID/6WlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744644511; c=relaxed/simple;
	bh=vQKLTu6lh7LGKC4btJOtQpZewbzfAn5tH10ejFAY/QA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Caqg3LkuZTb0j3gXgSP3OqenvvRM6+O1K7D6sudY0GddRvH9SPNTiaxqM3h0v8rx9vxL3HnkIUvpeheUrNkyNPKVtwEsNCoU9j8PETOrldiL7IV3k1dy4nEM70WGBsf1KrFmzb+BQpazfSD3FibKsJSG5bsOddmiAh+rV9tjyeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=hEBei+mI; arc=fail smtp.client-ip=40.107.192.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="hEBei+mI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UspBeDhYmBO1hEpcd3rruzQy9zy1bPymA4yjid+YcfKWT8cFk1hJ2lSud1OxmeZlIWgAQc+LoejAkjZaEAHi+MYQpDoloueiy86b33tR9Zjz99ZnXTrIeOrayHY8yyPKiQevoInn0v2ri6RQ2wLHShFU/LRI39+v649PyCZPvB560UXQekxLYFqg7I7N2pvEec9pNeCzEI/yOss3Gqy+5udhEV/aIh7dz2AMBqO8XF+6h4SZ4PiD4IshGa8jXPopqkZd8LjWgLlf3M0lkrwxF6ezopGsehssoAsWFmu8ALniU8gVFc8OHEfhsWTro10JFYsc9SkwpPg5zQld8pcm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQxC2BAwznBK7PpfJLRiR/JnQcoB5tledEF9eSmr3aM=;
 b=cRhDPGPMr6//pY51chqUQYKHxbsjariTwQv0FMOM3Ha+UREy89Xp2wtVt2Y1XBwqbzpVFfmIkeMBsl/X7ezcY56mN1VR0L0Tf3MgRxnzjzCD3D1358XpOX3iFxFP8/yneEgg8vsD/AEqj86GY0IelXuQnC8vF/t6mSQQ4JIZ7CLi9isT0h4sx/MZ1fMi9+tgaxh6gSkFTa2njkdwU0ZW9A+6l55ipHfPlXvDHQx0zOoU0wJ6NIi1lLGYKfXY3M2w98yq2aSONJS3MyduVcaZEILgTa993FSOOPfNvAjwah3caT2Osi0+vC+x3AqKDutkREi7GApYMOlVtNf0tS5HNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQxC2BAwznBK7PpfJLRiR/JnQcoB5tledEF9eSmr3aM=;
 b=hEBei+mI2EJWBzms7n+un5kVZ8epdn8lfK7lws8fGHZ03tO9mW6HVZse+aUPUufBIsswi8jHVpJPGpo+sCpHNAtGkFmTkDBaDsR0Wrdrz177imozOKVLje7gqRzQr4IAr9TdQpCfP5whzPFrKFDUtiq5nAx4Kv4GNpPK4H9oVzVqROkkiXWgpvkJGe+JGwpc+rU9aurvABYnOl1PeQAYrwCSVogr6F8CUFxXQQC/6CWboTYAsHqDC7HaCXbNUlP/mAVgSdXd0DpcBH272sGIVaxckno1ZfIS29I40Rw5ff4IH/lye0lnxK2B494y/QJ8y+rDabAfbIu0ByyWd5iXSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQBPR0101MB9757.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:80::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 15:28:19 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%7]) with mapi id 15.20.8632.035; Mon, 14 Apr 2025
 15:28:18 +0000
Message-ID: <e53ac875-da6a-42ce-8714-d74f77775279@efficios.com>
Date: Mon, 14 Apr 2025 11:28:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/3] sched: Move task_mm_cid_work to mm work_struct
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.org>
References: <20250414123630.177385-5-gmonaco@redhat.com>
 <20250414123630.177385-7-gmonaco@redhat.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20250414123630.177385-7-gmonaco@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::21) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQBPR0101MB9757:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e4c04e-3e39-4188-129f-08dd7b68fb8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azRIcjhCMXBFdEUwYmpLWlM2SVdPWFZ5MHpWSE0rL0dQc2I1ZXQwb081dWcx?=
 =?utf-8?B?VkRNU3p1cUJtQlFXTWlBalVETjVPdEhMUmVtdFlZb1hDUTdSVXl6cUxCeHpX?=
 =?utf-8?B?T1E5YWJ5MVBrMUtFMUR3MERMMEFJSy9WdTczc21HMm5NSDZQUFFCKzJOU09t?=
 =?utf-8?B?clZYU24wQ1Rtd1duOUpvTUZ3SnhjbXAvOXgvZ2VIVmtrbjdJekFZR3VmYzc0?=
 =?utf-8?B?VEM3YWs5aFpKUHRQcDg1bm1LQ1NIMXRxMXNsM0pja2QwZlc4K2NnQWtlL1VX?=
 =?utf-8?B?YUhwdkhLbjYrUmVCNUt6ZzVldytVVmw4UHhUV2o1L0VBUklhSUdPQ1ZTcUVr?=
 =?utf-8?B?YzlWZThPR0tPZkVoMVEyOC8yZHJDZmFZZnFTTDdaZjRpVWpkaEkySXAzdFIw?=
 =?utf-8?B?a2p5RnM0bnpyT2lLNGhOZCtoMHdDenZhMCtsK1RqWFVOaFBXWVBDcEpzdWVJ?=
 =?utf-8?B?TGtQYWc1c2RsQU1wMjY1VHhMREFTWnNGbUIxVkFTaVA1dzBCS0xTUkdPRSs2?=
 =?utf-8?B?ejlJUFdKV0FaWWJNYzBoaXlzb3NNd0lUSUo4SHFhazVQK2J3Z2NZUDBibnF3?=
 =?utf-8?B?bUowdWJHelllZ0luVjZveG5mQjlqaVdoa0x1VGZGOU44aW5LU0N2SGd3OXVC?=
 =?utf-8?B?THhvNVhKRE9kbWV1RjgxRVY5cjRpbVd4OVdDMjJlOUY3ZTdUQnAzbnAxeVYy?=
 =?utf-8?B?OGxiK3F5OFRUcFFhbWVUeU0zOGNCc20xSkt4UlhjS2lzNFoydjdJSTNnNHc1?=
 =?utf-8?B?c0h0NDROM05OU2YwOWhKZWZhQ2dEeWhGQzNSUEJreldNMEwvdCt4eml2anB4?=
 =?utf-8?B?VUdHQk53bVMzWWVkNWxRZllJRFNObFU3aFFGdDd0YW5pd2phK2N5OVlWOXRI?=
 =?utf-8?B?MkY2eHBmK2hRdG1PS3dpV2F2TkZucmxvVk8zWjJzd1czYXd0MGVVeUY1NElJ?=
 =?utf-8?B?WjFIaytodVM1b1UwS3JQYTBOK1Q3Rnd5WTc4Z2prM2RCYkR1SS9BWTFaQU5v?=
 =?utf-8?B?WWdET2dhSDZHaGE0L3VFcHE1ejVBZngyQlI4WWNMOTNsTllEQklLSGlWT2kr?=
 =?utf-8?B?T0JRbktsdDFIdlAySXZ5Wjl3WHl2Wm8xZ25YalBvT29ZOFh6cTJqV1FpK1hO?=
 =?utf-8?B?bTdPZHlCdnAzaVh2dGFoOHZ0VnBoRDNQOEx3c3FIZTRyOTA5dFBLaFNaa1h0?=
 =?utf-8?B?VVo0bDBUOEpxajB2VngydXprZUNlbWRYL3VuSkErNXk5cEFvYmxuWjVlbkJJ?=
 =?utf-8?B?dzY3ZmRJU2Eyb0YwNGVrM1dTUkM3VDR3Uk9tR3k5ZEpOODVZRCtwWkVkZHl2?=
 =?utf-8?B?OFQ1LzZDMmlLNWlyZEtNaG5CdmFQNG1PKzByYUZrWVFZS1BkcXgzeXg2NSs4?=
 =?utf-8?B?c3Vsc1JEYnRCcTVFWFJhUi9pbU45cWI5NExVcDZYQkJwYUxISDlvc3I4MWxI?=
 =?utf-8?B?UFd4RVhLR3ZUT05qRU9UV1dMc0JHOHRsN3ZsRFhudGZaMGlkNUZvQ01FcWZ3?=
 =?utf-8?B?d1pqOTBvSTlEd3pMZ3RlbXluUXdld0Y4Y2pxaTFoMHF6M2kvSDRBeS9GZWwx?=
 =?utf-8?B?Mldqbm4xRTlPYUxGS25TclY5c2dYY2d1ZlZCTVV1Z2pCazE3QUo3aE5DWUhH?=
 =?utf-8?B?dm9KamdIYkdJVVcvck52Zlh0b3BOdjVaWHpqcktFR04zK0xPSzVsQWRjOHF0?=
 =?utf-8?B?S3N5SUIrRWJHTzZqRSs0aWNNZ200d3I4V21NN2ZiOG5IL3J4Ylc5VEpudVB4?=
 =?utf-8?B?NXM4bVJQVExnSFVodmQrUGFLeVB4RUxrYWNSRTFOb053aTN2enpmaFdSSUNR?=
 =?utf-8?Q?XAz8cPx3oRLC6h690w88fHe0wxoFjmNeJmQ/Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlUvb2x1N09YWGRIL1FsZ3FtcG9tbGNRWktIdnRoS25GWGI4Vjl6T1MreWdp?=
 =?utf-8?B?L1BtejdOTUVwNHl5cHdoaXVEOVpXNCtleFBjM3hmNWdkZW1ZSkt0akt0N0Vp?=
 =?utf-8?B?bFJyN1V2K3N5TXlqajZtOE4vV3dtRVI5SFA4RzJtUWFHcEtoKy9MbGtiaUtv?=
 =?utf-8?B?aXRQOUh1S3Fhdklkcmg2eFM0Mm51eXBpdEdjOTFkQTdhVy8yTzlWc05FV0k4?=
 =?utf-8?B?dkNmSTlWMkJmNk1ZOStlNGpyRkNXb094Nk9lYVlyQ0dOTis0cmRHdEkvT2pz?=
 =?utf-8?B?VmExRkd6SXBncW1mTUxFcFFDNTI5ekFla1BaQ1Bqb1YzNkdYWmVjRER0UDho?=
 =?utf-8?B?eDNBcGdQTEhtVkNlcG1Icmw2MWlWdHdOLzRNa0dBVHNrRk9UL1cxMms3V3ZM?=
 =?utf-8?B?WmkwU2UvVUhid1M5L3I2M1N5U1k2bkNSbWxrd3hwb1Qzek5aVjRjSHc4d1lM?=
 =?utf-8?B?eDkvdEgxdVU0R2dsWWlUNGVqOFZlYW1pa2diMFgyTUcyaEhURGVQckNIWUhH?=
 =?utf-8?B?dlN0MVE0NzFJT2dmS1I5UHNTNThlalpaSGFXSVB6QlpjZmo4MmtPSm90MGUy?=
 =?utf-8?B?OGYwVFgvN2g2ZHZCQkw2QzJoZVUxcjh2am82a1U5VlN0RkYwM01kS3pYWDBY?=
 =?utf-8?B?N0xVK1Vlak5Xb0ZLTVVUMWxBenUyNXlzVFVtelBnMU9rbVpEc2Ywamwydlhs?=
 =?utf-8?B?UHE1dzBtQXlQRnlHcUZRa240aWFDdVhUWWpoRmNRUXZSYXJmNENwMlBoS1pB?=
 =?utf-8?B?RXR0RHlteTdpVi9QNUFCdURQd0pBNTRBM0Y1U1pTM09JNW5vZE5FdHNkT09X?=
 =?utf-8?B?ZVdIME9mK3FJNmJSSU9JK3NJS0VaYS9IeVNxNDdHeXN3NEFtUktZUndsYzVv?=
 =?utf-8?B?RThLZkFDMlE5OUNLSjFDQXNxZkJNVTdRdzg1Mk93M3pKYUJXUkozS1FlWXFq?=
 =?utf-8?B?VEUybFVwc0w1dWtEOE5vT3dTRlpmWTRvMFREQ2k2ZmR1REc3MU52YklBQW5i?=
 =?utf-8?B?YlRENG9Pa1EzeVdtUWxOMDF0QVMyLzg4aHR5NW5WcDFFWUdJUG16dHNxSUNP?=
 =?utf-8?B?TitsWkVVYWpUSE01TXFxRmxjb3h6dk5Mc1J2d3Y5eUdvcThORmI5djhweG5O?=
 =?utf-8?B?TUI5dzJzb1c2dkhFQ2c5Wllwb1VoTXdWdUNzdTJpMm91S2pCbEFSZDB2b2ds?=
 =?utf-8?B?OGwrczg4MjQ5cW5jNlhSWUkvTithQjRNQ0p1RUJvTEwxc01CUkdyd2I3dERZ?=
 =?utf-8?B?cVZMS0N5QURkU1cwVC9ySSt5M2ZJSlhWcTBldjVyVlhOalJMQTU4VUhjSUNY?=
 =?utf-8?B?TlJCTEU0R3RjTGo4VmRMWUlHTkpFTlBRWXVqWTNETFRKSG4xTW9vUFRrREUx?=
 =?utf-8?B?bkcraGRhSlRlVTlTNUdUS2djaTM5c1ozZFdSY3ZIbDVwVDNBUitRTHBTVXdv?=
 =?utf-8?B?SDE4TklJUXN6WTNSWkoyaHlSSnY4c0NkcWpmU2Q4TmR2VCtjMmJZYktzbVo0?=
 =?utf-8?B?Tkp3eGF4eVZHbFNzMFhrOEsxSlltRFNtb1l5NFlDRzJOZlJCRkRYb05mUVk1?=
 =?utf-8?B?c1lscFpGa211Ujl6MlNuc2FRYWhKbERsbU91TVNPcWpURVUva3l5d2x6b1dn?=
 =?utf-8?B?Q0ZCZmJQc0FZZ0dzTUFXTllMNUJhOFl2TTlSb3R5Z1c2bVpUZFhFNGh0TDVp?=
 =?utf-8?B?QVVxNVhSVDhMWW1YUjdSODhleWdTekFhQ2ttRDBoUnpFaVVzOFRCWGF5UHlH?=
 =?utf-8?B?cHQwaGU2NHpITUpCNStsSEdiRzRFM0x6OUVqNFpXRlMvcGcvTFN4NTNiUXJ1?=
 =?utf-8?B?U1RhOWNGSmxWWHNCSnoyMTdIM204eDNQeGFreEVibUM1Zm13Nm81dGpzNWpS?=
 =?utf-8?B?c0lQbDNUUjlhY1Q4UGxvWGh0WGRzNE9TVStZQWlkbVdSTW5mUHk5TEd2QmpT?=
 =?utf-8?B?MURML0FNbGVzT3UzSlRTclNlSVRhbkY1T25qYkZFenV0RFhjTmpDdmFMOWFj?=
 =?utf-8?B?NDY4MHMxaDNHZWtFVjdmeTFIMHp5clhKUk9zWG1ic013alBUbVp2ZFg2NmZ6?=
 =?utf-8?B?TitoL2s1eGovdVQzSFZQckRVMmNTems3cVFZeXVQMGh6STFmcDFBdHM2YnFk?=
 =?utf-8?B?VldXSlA5QUxzWkRrenJoaWpKOHM5MFVqQ2h2cnlETm5mcUdGQkRuVHhnWUg0?=
 =?utf-8?Q?v4zdUhPmp+Ms9AU6Giea2Go=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e4c04e-3e39-4188-129f-08dd7b68fb8d
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:28:18.5889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kL45kSYSkuIAISP7iZp6LsXE00tU9EIebHKqaAopcIv1/KGmfpbHEs8Vbwlz4EIbu8Buqs8J0hcIZMLUmRvpV2aY1IeFvwrdT1dOvIiqDa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9757

On 2025-04-14 08:36, Gabriele Monaco wrote:
> Currently, the task_mm_cid_work function is called in a task work
> triggered by a scheduler tick to frequently compact the mm_cids of each
> process. This can delay the execution of the corresponding thread for
> the entire duration of the function, negatively affecting the response
> in case of real time tasks. In practice, we observe task_mm_cid_work
> increasing the latency of 30-35us on a 128 cores system, this order of
> magnitude is meaningful under PREEMPT_RT.
> 
> Run the task_mm_cid_work in a new work_struct connected to the
> mm_struct rather than in the task context before returning to
> userspace.
> 
> This work_struct is initialised with the mm and disabled before freeing
> it. The queuing of the work happens while returning to userspace in
> __rseq_handle_notify_resume, maintaining the checks to avoid running
> more frequently than MM_CID_SCAN_DELAY.
> To make sure this happens predictably also on long running tasks, we
> trigger a call to __rseq_handle_notify_resume also from the scheduler
> tick if the runtime exceeded a 100ms threshold.
> 
> The main advantage of this change is that the function can be offloaded
> to a different CPU and even preempted by RT tasks.
> 
> Moreover, this new behaviour is more predictable with periodic tasks
> with short runtime, which may rarely run during a scheduler tick.
> Now, the work is always scheduled when the task returns to userspace.
> 
> The work is disabled during mmdrop, since the function cannot sleep in
> all kernel configurations, we cannot wait for possibly running work
> items to terminate. We make sure the mm is valid in case the task is
> terminating by reserving it with mmgrab/mmdrop, returning prematurely if
> we are really the last user while the work gets to run.
> This situation is unlikely since we don't schedule the work for exiting
> tasks, but we cannot rule it out.

The implementation looks good to me. Peter, how does it look from your end ?

Thanks,

Mathieu

> 
> Fixes: 223baf9d17f2 ("sched: Fix performance regression introduced by mm_cid")
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>   include/linux/mm_types.h | 26 ++++++++++++++
>   include/linux/sched.h    |  8 ++++-
>   kernel/rseq.c            |  2 ++
>   kernel/sched/core.c      | 75 ++++++++++++++++++++++++++--------------
>   kernel/sched/sched.h     |  6 ++--
>   5 files changed, 89 insertions(+), 28 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 56d07edd01f91..e4ae9295508cf 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -982,6 +982,10 @@ struct mm_struct {
>   		 * mm nr_cpus_allowed updates.
>   		 */
>   		raw_spinlock_t cpus_allowed_lock;
> +		/*
> +		 * @cid_work: Work item to run the mm_cid scan.
> +		 */
> +		struct work_struct cid_work;
>   #endif
>   #ifdef CONFIG_MMU
>   		atomic_long_t pgtables_bytes;	/* size of all page tables */
> @@ -1282,6 +1286,8 @@ enum mm_cid_state {
>   	MM_CID_LAZY_PUT = (1U << 31),
>   };
>   
> +extern void task_mm_cid_work(struct work_struct *work);
> +
>   static inline bool mm_cid_is_unset(int cid)
>   {
>   	return cid == MM_CID_UNSET;
> @@ -1354,12 +1360,14 @@ static inline int mm_alloc_cid_noprof(struct mm_struct *mm, struct task_struct *
>   	if (!mm->pcpu_cid)
>   		return -ENOMEM;
>   	mm_init_cid(mm, p);
> +	INIT_WORK(&mm->cid_work, task_mm_cid_work);
>   	return 0;
>   }
>   #define mm_alloc_cid(...)	alloc_hooks(mm_alloc_cid_noprof(__VA_ARGS__))
>   
>   static inline void mm_destroy_cid(struct mm_struct *mm)
>   {
> +	disable_work(&mm->cid_work);
>   	free_percpu(mm->pcpu_cid);
>   	mm->pcpu_cid = NULL;
>   }
> @@ -1381,6 +1389,16 @@ static inline void mm_set_cpus_allowed(struct mm_struct *mm, const struct cpumas
>   	WRITE_ONCE(mm->nr_cpus_allowed, cpumask_weight(mm_allowed));
>   	raw_spin_unlock(&mm->cpus_allowed_lock);
>   }
> +
> +static inline bool mm_cid_needs_scan(struct mm_struct *mm)
> +{
> +	return mm && !time_before(jiffies, READ_ONCE(mm->mm_cid_next_scan));
> +}
> +
> +static inline bool mm_cid_scan_pending(struct mm_struct *mm)
> +{
> +	return mm && work_pending(&mm->cid_work);
> +}
>   #else /* CONFIG_SCHED_MM_CID */
>   static inline void mm_init_cid(struct mm_struct *mm, struct task_struct *p) { }
>   static inline int mm_alloc_cid(struct mm_struct *mm, struct task_struct *p) { return 0; }
> @@ -1391,6 +1409,14 @@ static inline unsigned int mm_cid_size(void)
>   	return 0;
>   }
>   static inline void mm_set_cpus_allowed(struct mm_struct *mm, const struct cpumask *cpumask) { }
> +static inline bool mm_cid_needs_scan(struct mm_struct *mm)
> +{
> +	return false;
> +}
> +static inline bool mm_cid_scan_pending(struct mm_struct *mm)
> +{
> +	return false;
> +}
>   #endif /* CONFIG_SCHED_MM_CID */
>   
>   struct mmu_gather;
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index f96ac19828934..3ffdb96ef6b0a 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1424,7 +1424,7 @@ struct task_struct {
>   	int				last_mm_cid;	/* Most recent cid in mm */
>   	int				migrate_from_cpu;
>   	int				mm_cid_active;	/* Whether cid bitmap is active */
> -	struct callback_head		cid_work;
> +	unsigned long			last_cid_reset;	/* Time of last reset in jiffies */
>   #endif
>   
>   	struct tlbflush_unmap_batch	tlb_ubc;
> @@ -2281,4 +2281,10 @@ static __always_inline void alloc_tag_restore(struct alloc_tag *tag, struct allo
>   #define alloc_tag_restore(_tag, _old)		do {} while (0)
>   #endif
>   
> +#ifdef CONFIG_SCHED_MM_CID
> +extern void task_queue_mm_cid(struct task_struct *curr);
> +#else
> +static inline void task_queue_mm_cid(struct task_struct *curr) { }
> +#endif
> +
>   #endif
> diff --git a/kernel/rseq.c b/kernel/rseq.c
> index b7a1ec327e811..383db2ccad4d0 100644
> --- a/kernel/rseq.c
> +++ b/kernel/rseq.c
> @@ -441,6 +441,8 @@ void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
>   	}
>   	if (unlikely(rseq_update_cpu_node_id(t)))
>   		goto error;
> +	if (mm_cid_needs_scan(t->mm))
> +		task_queue_mm_cid(t);
>   	return;
>   
>   error:
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c81cf642dba05..02b18649e6a09 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -10566,22 +10566,16 @@ static void sched_mm_cid_remote_clear_weight(struct mm_struct *mm, int cpu,
>   	sched_mm_cid_remote_clear(mm, pcpu_cid, cpu);
>   }
>   
> -static void task_mm_cid_work(struct callback_head *work)
> +void task_mm_cid_work(struct work_struct *work)
>   {
>   	unsigned long now = jiffies, old_scan, next_scan;
> -	struct task_struct *t = current;
>   	struct cpumask *cidmask;
> -	struct mm_struct *mm;
> +	struct mm_struct *mm = container_of(work, struct mm_struct, cid_work);
>   	int weight, cpu;
>   
> -	WARN_ON_ONCE(t != container_of(work, struct task_struct, cid_work));
> -
> -	work->next = work;	/* Prevent double-add */
> -	if (t->flags & PF_EXITING)
> -		return;
> -	mm = t->mm;
> -	if (!mm)
> -		return;
> +	/* We are the last user, process already terminated. */
> +	if (atomic_read(&mm->mm_count) == 1)
> +		goto out_drop;
>   	old_scan = READ_ONCE(mm->mm_cid_next_scan);
>   	next_scan = now + msecs_to_jiffies(MM_CID_SCAN_DELAY);
>   	if (!old_scan) {
> @@ -10594,9 +10588,9 @@ static void task_mm_cid_work(struct callback_head *work)
>   			old_scan = next_scan;
>   	}
>   	if (time_before(now, old_scan))
> -		return;
> +		goto out_drop;
>   	if (!try_cmpxchg(&mm->mm_cid_next_scan, &old_scan, next_scan))
> -		return;
> +		goto out_drop;
>   	cidmask = mm_cidmask(mm);
>   	/* Clear cids that were not recently used. */
>   	for_each_possible_cpu(cpu)
> @@ -10608,6 +10602,8 @@ static void task_mm_cid_work(struct callback_head *work)
>   	 */
>   	for_each_possible_cpu(cpu)
>   		sched_mm_cid_remote_clear_weight(mm, cpu, weight);
> +out_drop:
> +	mmdrop(mm);
>   }
>   
>   void init_sched_mm_cid(struct task_struct *t)
> @@ -10620,23 +10616,52 @@ void init_sched_mm_cid(struct task_struct *t)
>   		if (mm_users == 1)
>   			mm->mm_cid_next_scan = jiffies + msecs_to_jiffies(MM_CID_SCAN_DELAY);
>   	}
> -	t->cid_work.next = &t->cid_work;	/* Protect against double add */
> -	init_task_work(&t->cid_work, task_mm_cid_work);
>   }
>   
> -void task_tick_mm_cid(struct rq *rq, struct task_struct *curr)
> +void task_tick_mm_cid(struct rq *rq, struct task_struct *t)
>   {
> -	struct callback_head *work = &curr->cid_work;
> -	unsigned long now = jiffies;
> +	u64 rtime = t->se.sum_exec_runtime - t->se.prev_sum_exec_runtime;
>   
> -	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) ||
> -	    work->next != work)
> -		return;
> -	if (time_before(now, READ_ONCE(curr->mm->mm_cid_next_scan)))
> -		return;
> +	/*
> +	 * If a task is running unpreempted for a long time, it won't get its
> +	 * mm_cid compacted and won't update its mm_cid value after a
> +	 * compaction occurs.
> +	 * For such a task, this function does two things:
> +	 * A) trigger the mm_cid recompaction,
> +	 * B) trigger an update of the task's rseq->mm_cid field at some point
> +	 * after recompaction, so it can get a mm_cid value closer to 0.
> +	 * A change in the mm_cid triggers an rseq_preempt.
> +	 *
> +	 * A occurs only once after the scan time elapsed, until the next scan
> +	 * expires as well.
> +	 * B occurs once after the compaction work completes, that is when scan
> +	 * is no longer needed (it occurred for this mm) but the last rseq
> +	 * preempt was done before the last mm_cid scan.
> +	 */
> +	if (t->mm && rtime > RSEQ_UNPREEMPTED_THRESHOLD) {
> +		if (mm_cid_needs_scan(t->mm) && !mm_cid_scan_pending(t->mm))
> +			rseq_set_notify_resume(t);
> +		else if (time_after(jiffies, t->last_cid_reset +
> +				      msecs_to_jiffies(MM_CID_SCAN_DELAY))) {
> +			int old_cid = t->mm_cid;
> +
> +			if (!t->mm_cid_active)
> +				return;
> +			mm_cid_snapshot_time(rq, t->mm);
> +			mm_cid_put_lazy(t);
> +			t->last_mm_cid = t->mm_cid = mm_cid_get(rq, t, t->mm);
> +			if (old_cid != t->mm_cid)
> +				rseq_preempt(t);
> +		}
> +	}
> +}
>   
> -	/* No page allocation under rq lock */
> -	task_work_add(curr, work, TWA_RESUME);
> +/* Call only when curr is a user thread. */
> +void task_queue_mm_cid(struct task_struct *curr)
> +{
> +	/* Ensure the mm exists when we run. */
> +	mmgrab(curr->mm);
> +	queue_work(system_unbound_wq, &curr->mm->cid_work);
>   }
>   
>   void sched_mm_cid_exit_signals(struct task_struct *t)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 47972f34ea701..c0f8fd4c575c3 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3582,13 +3582,14 @@ extern const char *preempt_modes[];
>   
>   #define SCHED_MM_CID_PERIOD_NS	(100ULL * 1000000)	/* 100ms */
>   #define MM_CID_SCAN_DELAY	100			/* 100ms */
> +#define RSEQ_UNPREEMPTED_THRESHOLD	SCHED_MM_CID_PERIOD_NS
>   
>   extern raw_spinlock_t cid_lock;
>   extern int use_cid_lock;
>   
>   extern void sched_mm_cid_migrate_from(struct task_struct *t);
>   extern void sched_mm_cid_migrate_to(struct rq *dst_rq, struct task_struct *t);
> -extern void task_tick_mm_cid(struct rq *rq, struct task_struct *curr);
> +extern void task_tick_mm_cid(struct rq *rq, struct task_struct *t);
>   extern void init_sched_mm_cid(struct task_struct *t);
>   
>   static inline void __mm_cid_put(struct mm_struct *mm, int cid)
> @@ -3798,6 +3799,7 @@ static inline int mm_cid_get(struct rq *rq, struct task_struct *t,
>   	cid = __mm_cid_get(rq, t, mm);
>   	__this_cpu_write(pcpu_cid->cid, cid);
>   	__this_cpu_write(pcpu_cid->recent_cid, cid);
> +	t->last_cid_reset = jiffies;
>   
>   	return cid;
>   }
> @@ -3857,7 +3859,7 @@ static inline void switch_mm_cid(struct rq *rq,
>   static inline void switch_mm_cid(struct rq *rq, struct task_struct *prev, struct task_struct *next) { }
>   static inline void sched_mm_cid_migrate_from(struct task_struct *t) { }
>   static inline void sched_mm_cid_migrate_to(struct rq *dst_rq, struct task_struct *t) { }
> -static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *curr) { }
> +static inline void task_tick_mm_cid(struct rq *rq, struct task_struct *t) { }
>   static inline void init_sched_mm_cid(struct task_struct *t) { }
>   #endif /* !CONFIG_SCHED_MM_CID */
>   


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
