Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E4B19DF52
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745766103; cv=fail; b=K+8RUQwVL1KjaXd1SelrnaorK2VzqlZDxc0WUFVYqrXdcuCziOTFYYcGFV2IhQT5SVuLF0f+JYK14V3aWXdPILK/VmhPL1tx9wOzlWxoyTAnixS8a3iQaY+rAWcuY/GEFlGMH6Duz5qa5bO11CrsNQUkpVfkKx6lrXUfZ9SDUwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745766103; c=relaxed/simple;
	bh=2aBAmVB+G93Ii9O8Usziv1xa6kRVKLw2y6H4h3Bup+o=;
	h=Message-ID:Date:From:To:Cc:Subject:Content-Type:MIME-Version; b=pCvLrzRoOE9kkPzWyBRJwtlgBemlTbd/6cSxgu6d3QARDFBpy1vdJ6S/sdP0UxHW7ajk08JBeWdiDrRR33ZSv44HTX91uBYdu3XziyUqat90xbHuX3uAId/gU55Cys/0bCskGZ1n9gFpjfoxKM8M9Ec3YdTrphLuaqF+ajN5Vig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2fcYsYbG; arc=fail smtp.client-ip=40.107.95.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2fcYsYbG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kX0rLwo0q9ZWTjbp3FRlHMfwZDF5zddS0aSslwz+LWWeFXYBemGtZPHFcLCY9KDmMaKp9EWGCsfqnempCuBDZ4durdfYUBGUjoS1fK7R+x12MQpxSgzw84z7HGRj8HmVekE+WJZvAxyb7ZIGnDvRIDhiN0hKOxGPWDRs251xCNl4yCHgv1lnsy6eIMeY0Y3BceVwGuxtN8RupzStMLWTXnQFvdBO73LlgKSrZQ6A3i9nYLZR+TeOVDC7WavmLtm3fudAPSQ8jXiDruz6vmJdPKWCD0F5oIRv24IDV2L4OxY+PuPKu4jps+cknyPnQcGHLbTl0BLgOgaJ5d/uM6Rccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uJ9/TvtIV6TeDDjvXjaPlCkTx3N7vH4gKUzcu+Ypro=;
 b=CHuq6K2qBfsUMTK0DVdYVWdtZMdtHTILJPopGEPnegtf9a70/kvlvRQjtcSiTk1ZLFkiR/G/HsJ/cT/oAo6lUiUetC4Psd4T4wh2aoym8HDBdVFdrDG82eO7kDOU0JIsW1Vkjy8t+OrJpLI1g8r9os2RT53fJTDVM1X4RvnlT5jxJZCHkW80xZ1qRrJhNg+lrBfbLIXTc6XFvpohJO4ex68rEU5+7v52ZRSWK250pAigNQKXYMMI5sOJIMptvanFnmbnGvYa5AjImezPVuGVyICci+6eVC28t9wHODGFf9nVLbgKk2pRk2l9mLxiYv02tz6n2zYXCb3zwLwnOK/Ibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uJ9/TvtIV6TeDDjvXjaPlCkTx3N7vH4gKUzcu+Ypro=;
 b=2fcYsYbGLaahr8XtfU9fRT7iTRkTb3NW8WZke2VpxR1Wg7saPsvJPXyjh/vyVcbcDwiUdCR1U/I43KBjJSzj0cXlFlJU6xHJuta9jGmAAJK0HkB1uMFGvnuw8qgxcciLYFxlgywa2naBl+7Q0knm/QMp8A5+cEs2bWeXvL+u77I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by MW6PR12MB8900.namprd12.prod.outlook.com (2603:10b6:303:244::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Sun, 27 Apr
 2025 15:01:38 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%5]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 15:01:38 +0000
Message-ID: <f12f5bd0-135b-91fd-9703-7df98500f9c5@amd.com>
Date: Sun, 27 Apr 2025 10:01:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mel Gorman <mgorman@techsingularity.net>,
 "Kalra, Ashish" <ashish.kalra@amd.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>
Subject: SNP guest crash in memblock with unaccepted memory
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:806:21::8) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|MW6PR12MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ffe78d-8319-49f2-6efa-08dd859c68d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmNCM090eEJQQmNIOERmT1U5VXlpR1JjQzJ1NVRyMGlxZkY1NGhiUE93NXdv?=
 =?utf-8?B?cU8weDAzTE8rUGx2QTNpc1M5WGlrRXdmdGhmWVpHU0VzWHBiSnJWWWplYU93?=
 =?utf-8?B?MVRXSWNiVlNpcUlzaHhCZ1FSRUpReHlMVVBVZFZHUWFTeXNlUnp6cThaZFJo?=
 =?utf-8?B?MlhJVDlVanJtUk1GdDY5OWF4SDdNMy9PY010ajlKRWkrd1Arb0JGdWRLMTYx?=
 =?utf-8?B?NThSVzVHQkg0c1NqMWVZd3FoQ3BOVGFxT0VPM3prREVJNmRuYmh2blJ2cG5w?=
 =?utf-8?B?YS9zVkt6UWlSMjlOcDRpbS8wZDFIVjlNLzNOdUxOL3lxcWtnYTlqSmNUYlVT?=
 =?utf-8?B?TU9TUVFMODJQSUxHVUFxOEJ3NWZkTU8zNWdIV2VVSEg5elVPVkVPMWJoRW9X?=
 =?utf-8?B?cXluUVRJNVdFRVFHcmxNY3JKRGhuZVZrOXJKYnptUFZNUml0QUdZUzV3SzVN?=
 =?utf-8?B?Y1FOMGJXdkhZWlNEc3p5YjZjbVZlbEZQV2swaG54QjVBWVF0SVFPSFo3NDAr?=
 =?utf-8?B?RjkzN0xLTlhKQ0JQbDhRVGRsM2ZKd21mZmNCMmJhMXVJQmdtbkhUZWFwRmNi?=
 =?utf-8?B?aXhNc3FuSUp1bkYvNnVRL25NNzcvNnlRcFRJaWpqdTMxVVV5RlBSUDhzU2F5?=
 =?utf-8?B?NzBaa1FBVUN3djcwRjM1b0Q1ZnViamRQTEpRK1Vpc083aHlBbU9PUGJhVHA3?=
 =?utf-8?B?VTdQUEdPNnAzeUxHK2RNdVoyaGFmblVCN0N2d0p6Njl6akFERE1ZVmJXL0dt?=
 =?utf-8?B?eUl6Wk5MZzBtVmUva3A1WE5rbG9DcWJMbUNRTzVnZ3NVWG5oQXlSdFRBYUF4?=
 =?utf-8?B?TlVjYjRWRGR2djNjR2FOVWs2aElIdDZSYTMzRXhWbVhNVTRMWmdwV09Sdkdx?=
 =?utf-8?B?RjZtQzl5bnBkVjZ4WGQrK1ZYUVVPdVllbmQ3S3FxTFFlYU5xcWpsUVIzYXp3?=
 =?utf-8?B?T0toL2k4eEw1UDVTWUwxZ3B6TWJwMjBBcit2WTBwVDN6V2pCYTVsbUxBczNZ?=
 =?utf-8?B?ZUFRVFh0OWRXeUU3WXNIaWtmWkR6TGpZR0dpaUN5UGJiZTdGeldjRXZ5Q3hG?=
 =?utf-8?B?Nm05RnhiUGI4bGhxVXN6aFN0Y3F3TG9QcTIxajJXMnFqbmlRMGRMMHljRUIw?=
 =?utf-8?B?bm5rVU1jdStjbnFaTHplVGxXWS9NaURyTWJIaWZkbG9NSmY3WUJuSko3UjQv?=
 =?utf-8?B?bU42YlpEb0hOOCtWbTJMNDZNRGN2MUtZUDV5eEwyMzBiMzZqNHFMYVJXbHp4?=
 =?utf-8?B?MlZJbmUyWGJFd080WFVoenlQdUtJeFluNXZWeDFRejQrdEdlOVl3Ky8zTE1s?=
 =?utf-8?B?bVRrODgwOWttTXNwZlc3MDIzOHhJV3pPVyt4b1F0ZzRyR09lQ3FxOGdIdU92?=
 =?utf-8?B?ci9UKytsMHlmVmVzTWdaT1NmR2gzQk5CTDB1TnRFTEpyd0I0NlRJKzJhZTJ4?=
 =?utf-8?B?WC9HcEwwTitPODhaMEtSY0VmeW1zZjRvb0NOaDhVQ1FuUnlFZEJ6NmdrOE1U?=
 =?utf-8?B?WWZBeTJLeHVtN3pxZEpGTm5INk1UWG0valNHRG9SWnFjQWZIV3VPY3QySm0z?=
 =?utf-8?B?b2wwNFl2VFprbUg3RXNlOVAwK1lkMWtHaUVEc2FHY0hzOTBIZzNEOHVYeFY4?=
 =?utf-8?B?bUovQ3BLL0hXR0duNk94aTJEaDIxb0ZKWGpaRTdrQ3ZOQVNvR2hSUXJaeWRu?=
 =?utf-8?B?dU9veUcvcVQ1L2ZYUTI0aHZvRUxsM2tOWG5CKytLT2EyWThGOWtBdHdnNVpp?=
 =?utf-8?B?ak1nVFdsMm1QQzNaQStVUXFXR3d6Y3NxUlVmME9tdjBHajVUQVJCbXB3NVdG?=
 =?utf-8?B?anA5b1RNNVp6cm9kS2RQK3V0SUtBZVR0cWJTSUV0a2RkK3Z2My9MTGo3UmZs?=
 =?utf-8?B?cWF6TmJLbVdUTWhoZmtZcVR2SkN0cEJZMUhINkd4LzE5dDFOb3JacC94OElp?=
 =?utf-8?Q?mIWHdAvXYrI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3pNUzgreU4weEdFYUM1NSt4dXhlTzk0eS9tWUl2Wi81dXA2ZTlLQVNzRVd1?=
 =?utf-8?B?anJWUkNXaWoxUENTcGI5L0pSa3RPZ2pJMHFNaktMWlZRbzNlbnBmbHR2NGpm?=
 =?utf-8?B?ZFZJV21vdU5IbmxTc0RvYldzR0h1REJQbUw4ZGFjczZQV0Q5NjEwL2hNbDhh?=
 =?utf-8?B?ekxwdkw0TFlTZ3hoaEhiZUFxZTl1WFNnYXpqTkJMUFhYTFVqRXpZQ2Jvajdm?=
 =?utf-8?B?WVBiTFYxRHZadnNiZDl0OGZZTzFDcHJ5L082cDlmWXpVN0lPci9ockduQWlJ?=
 =?utf-8?B?bGJTV3U4dmFHbG9XM1RaR2VuMHNCdVl0THkxNWtWVS9KcGVmM0puWnlpb2lL?=
 =?utf-8?B?Tzh3RSs4Uk9vTW4rcTkxWFZlRXlUd3dram5vdHVaVWZuNGpLYUJaQk5iNlVF?=
 =?utf-8?B?ZVZpazYvL2tBU0JDV2hLUDNCeEp6U1BNUkorRU9GeG5qRU01MmRXcmkyMlZZ?=
 =?utf-8?B?MFdDQ1hjR0dacjk4MVo4ZzYvbEpBNWpOVWF2TlN5QmxZVVdXQWRabzlzQXUx?=
 =?utf-8?B?NWlPZXdSMStpQnJlZ2FzV01JalRKZm1MUm9oZ0lkZEFVWjYyN3E0ODR3Um1h?=
 =?utf-8?B?ZGdXakdLZ2ZFSmdJRSsweWwvRldHaVNBZlByMUJpUFNpRTZ6VWtGWnpkREVS?=
 =?utf-8?B?dlZtaTkzTk9MdHZKczgyMjFpeDNCU2hBSUROWWlLRzhDN3J4VTFDRjF1dFhu?=
 =?utf-8?B?U3hWaUdiUExkdHd5NnpQWEJFa0JDQUlNS3NWMnlQOUQwaUc1Tmdza25md3lC?=
 =?utf-8?B?dmE1SjQzb1FqdXNEOXdpVkNYckZJSUFuVG1xdGZCSUc4WDZCTkYwQVNCWVZT?=
 =?utf-8?B?V2grQ1lHWGxUWTJzUVVQSXVueUp3YS9HL0FhamNqdG52OVB2WTBiMUo5MXpr?=
 =?utf-8?B?KzVvdUhSblNlMmk1ZWxndEtjczNuR2x4aFRwV2xOQlE5T0o3TW9aUnlSNnla?=
 =?utf-8?B?eVVnVzd5ZG1jdDNDZ1RiQytFMnNjNEdCaTZIaTlPQ3NCV3dRY2JqTUtPWVlm?=
 =?utf-8?B?dVNDY0Fybms5end6dnVXQTdXZDhCSTgrLzlDbmozUGxYOVc0KzAvKy9CV3RU?=
 =?utf-8?B?d2VCaFBIMVJhdmRuL3kyWnRLNGRZdHhuNmNnMzRvRWNUQlZyS0dKTmkvaVQr?=
 =?utf-8?B?dEIwV1hMaDMwSVgzTDFDMkdtSkhsR2hMamdFaStzTHE3b2FabWZwNTFtZ0RI?=
 =?utf-8?B?bTZHZUZMWjNoRTVvc2ZxcnZLdHV5WSs0L29JdndOUWVYOFFncEY1L2VRNTBZ?=
 =?utf-8?B?Uzg4bHk3NmZWMWxaVldqWlJ3cnBmcm1YNDRwdlNJOFVQUnBaT2VVaFdrKzMz?=
 =?utf-8?B?azMxQVI5SENmSTRyb0ZMbjhtWEFSMURPOEN4WkhxYndkekdFWFdUMFFLbGRC?=
 =?utf-8?B?dy9zMGcrbFgrNU5vTWtTMjJvM2JLb2x1VktmU3AwN1I0NVE0N09VSHBwRGk0?=
 =?utf-8?B?T2VRbzRJTjM3TnVzZjVmNnEvSE1NUmZKTGJyeERFQWt1ZW9DYmZESEVIaXpY?=
 =?utf-8?B?M3dhTWRHYTlzN2JwWmlObGZvS09EQ0RRWURCZkJXZDlNb3ZpM1U0aENZcWJ3?=
 =?utf-8?B?WS9vTjlXNXN4ZmxVYjVZdEFiRVAvSUNpRWRLZ1A3V0pzQk56VzdzYlk2MzZa?=
 =?utf-8?B?RGZ1amE0TWJLMHI0djFHU2ZVa0EyUzg1ZWh6c3dKQStUUVFZT0d3STJXb0tz?=
 =?utf-8?B?b1QyK0UzODVZenJ5VUl5d1ZvaWhHYTV6YVBIdUxRdWlCVU9VcldpcEtqaFFE?=
 =?utf-8?B?bFdFZGRKb3R3VFYzV2xpUy9DeW5FUlBxdy9wVjRzaUIrZGJaYUNsYTFEUjRo?=
 =?utf-8?B?TWROVXdkRUc4MWN5TVFCSXNHR2pYV0NIWXdTMDFhMFBlSkdZVjh3SEhHT2NE?=
 =?utf-8?B?cHhVQzJkSFNKdCtubnBEWkRhYTZPWnFqY3A5d3psN0Q0UWM1bEtMMWRIVk81?=
 =?utf-8?B?SHNIYUhabzd0K3QvWGo1K1hxalM5T04vT3JNb0Z1MTRUcGg0TWloR2duN1lO?=
 =?utf-8?B?WlpET3lVaHFnOWtXYnBZV2hoVU1CQzlOVnJ0cUVKcVl2MjNmUU1hcFRNTkVJ?=
 =?utf-8?B?VVRPTGxnU0t2V1RIeUYzV3ZyZ2h1U2UxczdGblpEWmtnY1VsdWMrOUhtZ3hp?=
 =?utf-8?Q?wcrHqeJ2z6TxjtPa6ckCNglJI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ffe78d-8319-49f2-6efa-08dd859c68d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 15:01:37.9025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GC54TcFVszr+upNTs9e0AN9tQYgIXyoE7y9Plu9xdtH/HsXC+dovJu5dek4s/KHKWTBspAD6e6hw5ktrBHq09w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8900

Hi Kirill,

Every now and then I experience an SNP guest boot failure for accessing
memory that hasn't been accepted. I managed to get a back trace:

  RIP: 0010:memcpy_orig+0x68/0x130
  Code: ...
  RSP: 0000:ffffffff9cc03ce8 EFLAGS: 00010006
  RAX: ff11001ff83e5000 RBX: 0000000000000000 RCX: fffffffffffff000
  RDX: 0000000000000bc0 RSI: ffffffff9dba8860 RDI: ff11001ff83e5c00
  RBP: 0000000000002000 R08: 0000000000000000 R09: 0000000000002000
  R10: 000000207fffe000 R11: 0000040000000000 R12: ffffffff9d06ef78
  R13: ff11001ff83e5000 R14: ffffffff9dba7c60 R15: 0000000000000c00
  memblock_double_array+0xff/0x310
  memblock_add_range+0x1fb/0x2f0
  memblock_reserve+0x4f/0xa0
  memblock_alloc_range_nid+0xac/0x130
  memblock_alloc_internal+0x53/0xc0
  memblock_alloc_try_nid+0x3d/0xa0
  swiotlb_init_remap+0x149/0x2f0
  mem_init+0xb/0xb0
  mm_core_init+0x8f/0x350
  start_kernel+0x17e/0x5d0
  x86_64_start_reservations+0x14/0x30
  x86_64_start_kernel+0x92/0xa0
  secondary_startup_64_no_verify+0x194/0x19b

I don't know a lot about memblock, but it appears that it needs to
allocate more memory for it's regions array and returns a range of memory
that hasn't been accepted. When the memcpy() runs, the SNP guest gets a
#VC 0x404 because of this.

Do you think it is as simple as calling accept_memory() on the memory
range returned from memblock_find_in_range() in memblock_double_array()?

Thanks,
Tom
