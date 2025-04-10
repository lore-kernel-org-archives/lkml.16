Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CC41CA84
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277273; cv=fail; b=mod/DQlvige2Ay8y+6amuOv2Hs/LVGSrvuhriRrwrYOX6hlaJHWLC18xbWKMa52PxJbD6gFdkVDARXVFYzvkh73JU0BnkZGPu+W8E2RRKce2aIcI4dOgCgVNKYXq29PH54Oi8lCx9FHdtb8SGAZ7uMxjY/4Vw8yg/fJ+NRNUaRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277273; c=relaxed/simple;
	bh=rsDLqUuJBqUegYwCbs+vwt3uTIOje9bGtvfMvFlraw4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=btCPEV0iPrN5rYrYOWVSaSu2UaJaCDj4ZIRneuSByA18SHmHns8BX9Ma3WbH5fDvtGSQ2rbt1Kid+IGkxGG9LopfoHRFexpZWnLy44jiX3JfRcAtLeEd2EeheycultYrjSMSHaDbmP6+qjkoExeD3MWy/hibjghyyWgBt72pVwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EqMg2XHZ; arc=fail smtp.client-ip=40.107.237.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EqMg2XHZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyztMy3DoiwwfTocwb0ewayZckJB2TIVpUzZbEXYif5w/jToHWwUDeKNOLPUurK58zMCnCVu5OZaBfHZqNpOi1EUS8X118A9aaT4SfOHKCd/Jf4ldi04QQn+JJxpluziMT1Fu2LS8+kh/ZaQAD0gLWNEwfm6ZgnICJrvBdmjl7RxDHGe5XkdZuu61QFevSVzFbQ0YWtDwQ65cyUfKvb4V7oizorh0LqicHXZ6vk7J0NnFU7dlorTQeFypy1TWQDt2/mO1Hz/md9D8YwHBTOPQiq+QDPLEqLtpD4/dVozMvPCSFMa4D5ghQSckIAfnVINGGBWWb756plC3np3De+mVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsDLqUuJBqUegYwCbs+vwt3uTIOje9bGtvfMvFlraw4=;
 b=N5G70Fazbzp2lqcThy2gP3/gnuiV6DPU4mHDhKv/4lyv1H5DxN+GZqr6i8x6jX9tgWJJaCt0smj9t3SAjksdZLb0V4NmxyfPs4ydyLE78IYrywa9/7T7s3c1WQo1nrsFIyA7TJXirkNkqgoucSvwtnTxOOoEJe51l5i8xwwfv7Ym+9f6i/Eg/pxbORJspMLbJpDWDgNLA05E0AEAIQHFSwWM/w0EUbkrPse/41ZY1SPFFNAxyuunSQGMMx4AJDRR5F35DGApZdGLaBENTjPz26IY66yCoLwzLih3+NRaihU1ZxP+ibkubZyH5bd6/m2H6o8dzLOM15GgznuJBegkHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsDLqUuJBqUegYwCbs+vwt3uTIOje9bGtvfMvFlraw4=;
 b=EqMg2XHZPSToCB641fch1W3lSvqot+7f+ggKJ3zoKp9bFr55f3oEhWO6o/HSQhCbuEH68MDjhZu57ad3/tAYIhHNzHYXV3T3AaWLEihO14aa3TvSCUmMIWuSHuFkQPByToZZsDOjEaGKU+5EOYZBhidVnmSfg32F6ndDoHORhG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6406.namprd12.prod.outlook.com (2603:10b6:930:3d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 09:27:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 09:27:48 +0000
Message-ID: <95ed4d91-85b6-4514-9d94-8324f4fcceb4@amd.com>
Date: Thu, 10 Apr 2025 11:27:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations()
 error: uninitialized symbol 'ret'.
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Melissa Wen <mwen@igalia.com>
References: <f5dd7fb6-6a99-407f-846f-0de2d0abe177@stanley.mountain>
 <b402252a-91de-4983-abc1-65f78e7e6ae7@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b402252a-91de-4983-abc1-65f78e7e6ae7@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 5302fb25-b855-46cb-e2ae-08dd7811f4e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTczU3M0SGxON2ZsblJSWjhmR1VJSEh5QndRWWsxSkRQWWZCUEpGdStlVllE?=
 =?utf-8?B?Z3htMHI3T01tRXYwZHg1K2h3Qy9ENHEydndWendCRm1JRWI5VTJoVHFGOFhC?=
 =?utf-8?B?UkJ3d0Z4QVhFZFdIN3hEYzdPOUladys3N3lDUGVyekNORk9BdmpGY29aWXo2?=
 =?utf-8?B?VXVRWElqd25XUkRwYTBCZmc1RW5wWUE2clNtN1RjRUJDekdLLzZvWHBzMFQ1?=
 =?utf-8?B?R3VJaStTTHRyNlZ4SDBacFV6RDJQNjNHTGVaem9RVGJ5ZXhLQ3drSjF0dFh4?=
 =?utf-8?B?SGRCSU1uUEVIN2dxdVhPamhkWVVQQzNQZjcxRzVna0xmMVNuc29OUFYzUmcv?=
 =?utf-8?B?RWNsUCt1bDA0dFkzb0s1Ky9LbDc3YnJUazhnRXI3L1lmQTBwOVFsNGcyVXhV?=
 =?utf-8?B?VFlsQTBhOURCdGt3anpheE03TGo1N1ZCUU5RUXdtbDBVbGUvZEMzcTNyUStS?=
 =?utf-8?B?bG1mL1JucmZSak1XWkpsWDh6L0ZtYWNEK2VKWlJEZGY5VDVWbk9vRm93am1w?=
 =?utf-8?B?UTJrTU9QQjFsa0sydGJuZW9nY052di9yazU3T3E5U1ZUYTRiWHRqV3dJZ3FH?=
 =?utf-8?B?aFdrQlJjQmFmQjJkcFM5V0ZsbGVURG9kSFovVzR0VXR2VDk0UmFveEVuM1c2?=
 =?utf-8?B?WnpjclM1MDNVaktlQ2g0bTRyTlBzblFYeEZjYk1iOEhLQUJtQTcxT2l1aUwz?=
 =?utf-8?B?OTBCaU9nRzBZdHhiSGtpazdhTExNalZrdzRkUk5TZ1lNdmtIakkvMXJzcVFS?=
 =?utf-8?B?dTN0VFpHajNkb3d5ZFBtTVBVSzZnSk5TQ1JjV0l6cW1YMjJINml1cjAwd0Iw?=
 =?utf-8?B?cndKdFo4bnZKZk1rMTVzMWlhOVFhZlB6VmZFbnFaMEFISjZrYWFwNERabVN5?=
 =?utf-8?B?bzRHdHhuQmpiQ3dma1YzclByUjlXUGZwNFpqdXdHdVZsdDdMeER2YktJYUxq?=
 =?utf-8?B?OE5hajdaVUdRbHlzVktqSm5QTjdCdnVBME9Hb1dqUVZKbUh6L1B0clBIWStR?=
 =?utf-8?B?TVlSdHdiNy84ek55ck41RE1EeXBmWHgxVmVtLzZJMGNlcEl6bXgvWGVMcWFB?=
 =?utf-8?B?VjFoOFIyRmhvZGFFUWl6enVvdFNGV0k2Vk93cU9ldnlSTWdTRE1ZZlFBMkg0?=
 =?utf-8?B?NGVMb05KT2M2RFJKMWpZeXU0dnJaNXVRVVliaDRaYTRMSHVQQ3ZZUllkU2NU?=
 =?utf-8?B?R1Q2bklPR25ZeWNYSTFwK2FyZGJjTWk5dVRYRWkzSHppUWRPM09LOWhjZ1ly?=
 =?utf-8?B?elRSRXhYbnY2WW1QZFFMTWoyeDl3bjdILzY1TnFaSHU3N0NhaytaSzJOQk0w?=
 =?utf-8?B?SWxrcUtiMkticHB0SjBVZUdNcHhpN1dXTjUwUVFTeHVQTTNSZmNEZHFLN1Zn?=
 =?utf-8?B?R0hDVzQxeTEzM3FtL2FkMit0TkwyZkxENFFkaVVUQUxZeEV5Umd1VDlCRnZP?=
 =?utf-8?B?UHFwTDlnYTh4bGwyWDE3NkRuMWdCd1I5Qkh0cWhEVDRleHJqbW1yZ2lFUzUx?=
 =?utf-8?B?b2dTaTBaNUFCNWxRQ2FmYkZjVUl1Zm14Uk1mWWQxNEdveUlQY3Qrci96Qk5Y?=
 =?utf-8?B?T2NTS05ON0ttSEFjVGVBeVkrWUJjTHRyTUJGTnJDdytVdm1IY0crYlNMQlE5?=
 =?utf-8?B?U2lUVEt0aytaRm9STitFRGJ4dVpvWVZid3JoeVMxaHZpOWg3QlZRRnVKeURw?=
 =?utf-8?B?MXhyWXFxblJQWkpGMU9PZVU3NExSQ1pCSnBkSjRPcG9qZTA5dHZJeWpZWDZW?=
 =?utf-8?B?UFkzQjdCZzQxNmpBN2J5aHAxVVBSS0d4U3hkRk5UbW1VQW1qUnQwMUtSdVA4?=
 =?utf-8?B?Ry9WSy9EUXBnRXRMNGNDUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0RnbzgzM0JjMnZvcW9PQVVlc1MzTVZJTldPU2ZYZ0g3R2lMTHhXb213Uysw?=
 =?utf-8?B?eCtoWjJjeG1pYWpiZzc5c2daR254ZEd0Y3g1d0JXU2hSMkZSM3pFNjlyakly?=
 =?utf-8?B?MWpwSDZXS3RqSzlPU2EzR0Q0WGQwQjdtbk94Qy9xc3FkekVzWVZxbmRLTE5w?=
 =?utf-8?B?Y1FmMHZ1a3NreTFROUdsT29pbXI4d2JSRWZwVEtMRDdwUHNERnRqcjNINjBV?=
 =?utf-8?B?blhiZUtJWEZ1Wk9tQ3VpTzJLL2tnTkQvK0xFc3VVcmQ4TkpQS3k5V0FDZDdm?=
 =?utf-8?B?R01pdFR5TW9ZeUI1QWw1YWk5SEhSYURtZ3hrSVhtL20xbjlFLzkrT05md1dE?=
 =?utf-8?B?UGQwOFJ6WndMUjJpZUZTNW0wRzdtYzhiV25kVkhHM0puRWlQYWQ5RGxpNkQy?=
 =?utf-8?B?MXp3UzJhT1F5cTRhczV2RnhQK2tzZndBV1V4cFdtdzYyYjVzUWJJMDFlc2tq?=
 =?utf-8?B?ejZPc1pObnlPdkVub05heElyZ2NRd05meTRka1FlMEJmM1lUM3hxMExEem5C?=
 =?utf-8?B?b0xzSzhyMGwrZElZMlE3Y0FkT1kxQ1lsTU9UMGdIMGxPN2tjMHNHVU1BOHRZ?=
 =?utf-8?B?L0czQlUwUWhsanBLVGtVdFMyRElYQ1Nsdnc4TVFWOTJZRiszNGRFeFd1SzZY?=
 =?utf-8?B?dE9wYjFGTzNpWldsSlZETWlyQVZmRkZvdkhialJFKzhGRmRIL1JNM1daWExH?=
 =?utf-8?B?Q2VYZ2FWUlE5cm9iTHlHbXZOYTJjTzRseGpHeWRJVXYrMUVVNlphclZPYnVB?=
 =?utf-8?B?QmV2SExxUlB1TUlvb3ZZaGpPUlJrd0tDbFpueFdrcWdQRnd5N3dOUnUxaEZl?=
 =?utf-8?B?Ny93amFtNFFFQkppVG44bVQrd3YzVmtVRFdCMjZodnlQV1pRZGhJQXYwSUZI?=
 =?utf-8?B?U0hXS2hyanNtUmwyemlzdWprWHQweEkwWGtVTWd1Tk9HRlFEbXZKWVBZNVlL?=
 =?utf-8?B?d1FxVFFTSERtaXhYclI1bUtUYVZnNWpPU1BXTDk4MlRzSzFmUnpDbjZ1NTNx?=
 =?utf-8?B?QkFTeGU1NFA2cW9oak85bDNvbXFUd25jYVY5cVhPaW44YXFNc2ZDeDVETkQw?=
 =?utf-8?B?OGJLcUVBSHhESHZzTW5rQUZFck96blNLcit4ME5WM3dxRWFlamNtdkgrMDZo?=
 =?utf-8?B?WEZKanhWK0hBZ1IreWtYeno4MDViNVBORlZLNUp6SGhhdE9INFR5Z1Y2ZndT?=
 =?utf-8?B?SUJQd1BZTzNMQS95RTczSTZBa1lISnh3OVMrSlM5Tm55VVladUdmWGdMbUpE?=
 =?utf-8?B?cWRiU0RBYi9pT3d1NTU0R0VSTjlrSVZlRHA2UDVyYm9SQWx4R2dGV2REWnpF?=
 =?utf-8?B?aUY2YU5wZ0lMNHhFQm9GTkgwM3dwYWFzTTRKRUJvQ1hNemlQeWlCdEVWMXlT?=
 =?utf-8?B?aG4zOWU5RC9FTU9qOG14dkM2Wi93WTBlakFyTUd0VEE2bTJ2TVFIZHlBbTA4?=
 =?utf-8?B?UThoSkVpc1pZTThKaTZndE9yOWV0OVFJR2dTbHNLcWtzZ2xlejVKeWc5Zkxi?=
 =?utf-8?B?V0cyUVlqN24wTWc0UFlqS2VWQm5OZm9TTUEzRUZWWUxJR3lJUjlFV25rK1Uv?=
 =?utf-8?B?QUIxb3lzN3Z0MWdOQlVOM3BHS2RTalltOVZET2REaXgxVlFtTFE4a3VlSGtL?=
 =?utf-8?B?TFFPLzZmMGw1dC9QWGU4WUIzVXBEeFR1MW9ET3dwZ1NvcXJCdnhJMHhValdG?=
 =?utf-8?B?dE9ibUE4RFZ2bjI2cXVIbG1KcXhDLy9nMVh1cTAyTGNIZTFpLzdDVm1Uajhz?=
 =?utf-8?B?dk93RnFROEgzdlc0QlZ1N2t1bHpqb1BNeVNLNFAzN0dpb29aOHEvbWEyQmlD?=
 =?utf-8?B?c1lVMDJJNytRZ0dxSmZuZEZxUEp2SnRlTmN4K2d2OUFiS3RTTEdBQUFSMnB5?=
 =?utf-8?B?bnFXRFJZK1lzUStFV2N3emFHN1VPd3VnSGdNZmcxbzBUenVsclNUZlg3NzR4?=
 =?utf-8?B?WXN6aGx5b01MZlpuQXRxRHZ3SXdNUE1ISjZYdHdNZzFwVHpBWEhaWGlsRnNQ?=
 =?utf-8?B?c2xyK2I3Z0E1MDYvaU5zV1IrMnhSbW1yT1J4aStSaGZEZERQUFY1d1lmVUE2?=
 =?utf-8?B?c3RJUEp1MHRmWWZFWVFEMVJ3SGhVZkpxWGZ3Q0FFWk9VRE9TbERKbTBkQzlu?=
 =?utf-8?Q?JoCXZYVso+GLThI0Rap64jULc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5302fb25-b855-46cb-e2ae-08dd7811f4e6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 09:27:48.1324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VO5/Inhv5nwm9z8gVjY5OSBMyl/p36ld80r3+nvDRN/uHlwpLMT1IoS3UCe3Iy52
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6406

Hi Maira,

Am 09.04.25 um 21:49 schrieb Maíra Canal:
> + König
>
> Hi Dan,
>
> On 02/04/25 05:43, Dan Carpenter wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
>> commit: 04630796c437a9285643097825cbd3cd06603f47 drm/vc4: Use DRM Execution Contexts
>> date:   2 months ago
>> config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021500.3AM1hKKS-lkp@intel.com/config)
>> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> | Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/
>>
>> smatch warnings:
>> drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.
>>
>> vim +/ret +604 drivers/gpu/drm/vc4/vc4_gem.c
>>
>> cdec4d3613230f Eric Anholt 2017-04-12  589  static int
>> 04630796c437a9 Maíra Canal 2024-12-20  590  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
>> 04630796c437a9 Maíra Canal 2024-12-20  591               struct drm_exec *exec_ctx)
>> cdec4d3613230f Eric Anholt 2017-04-12  592  {
>> 04630796c437a9 Maíra Canal 2024-12-20  593      int ret;
>> cdec4d3613230f Eric Anholt 2017-04-12  594
>> cdec4d3613230f Eric Anholt 2017-04-12  595      /* Reserve space for our shared (read-only) fence references,
>> cdec4d3613230f Eric Anholt 2017-04-12  596       * before we commit the CL to the hardware.
>> cdec4d3613230f Eric Anholt 2017-04-12  597       */
>> 04630796c437a9 Maíra Canal 2024-12-20  598      drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
>> 04630796c437a9 Maíra Canal 2024-12-20  599      drm_exec_until_all_locked(exec_ctx) {
>> 04630796c437a9 Maíra Canal 2024-12-20  600          ret = drm_exec_prepare_array(exec_ctx, exec->bo,
>> 04630796c437a9 Maíra Canal 2024-12-20  601                           exec->bo_count, 1);
>>
>> This is a false positive in Smatch.  I can silence the warning on my
>> end easily enough to say that we always enter the drm_exec_until_all_locked()
>> loop.  But the question is why do we only test the last "ret" instead of
>> testing all of them?
>
> AFAIU `drm_exec_until_all_locked` will loop until all GEM objects are
> locked and no more contention exists. As we have a single operation
> inside the loop, we don't need to check "ret" for every iteration.
>
> I believe Christian will possibly give you a more precise answer as he
> designed the API.

Yeah that explanation is absolutely correct.

The drm_exec_until_all_locked() helper loops until all contention is resolved and all buffer locked.

You could avoid the snatch warning if you move the error handling into the loop, e.g. something like this here:

drm_exec_until_all_locked(exec_ctx) {
    ret = drm_exec_prepare_array(exec_ctx, exec->bo, exec->bo_count, 1);
    drm_exec_continue_on_contention(exec_ctx);
    if (ret) {
        drm_exec_fini(exec_ctx);
        return ret;
    }
}

Regards,
Christian.

>
> Best Regards,
> - Maíra
>
>>
>> 04630796c437a9 Maíra Canal 2024-12-20  602      }
>> cdec4d3613230f Eric Anholt 2017-04-12  603
>> cdec4d3613230f Eric Anholt 2017-04-12 @604      if (ret) {
>> 04630796c437a9 Maíra Canal 2024-12-20  605          drm_exec_fini(exec_ctx);
>> cdec4d3613230f Eric Anholt 2017-04-12  606          return ret;
>> 7edabee06a5622 Eric Anholt 2016-09-27  607      }
>> d5b1a78a772f1e Eric Anholt 2015-11-30  608
>> cdec4d3613230f Eric Anholt 2017-04-12  609      return 0;
>> cdec4d3613230f Eric Anholt 2017-04-12  610  }
>>
>

