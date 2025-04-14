Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC430288CB6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653644; cv=fail; b=YhOxfH5BRDk7Q/ZgFK0eJiUdTxyUw9Hsmx1A1vCMpPqaROdEtOvZabu8IW3CQeIIMp8sMfJWzdaSekJ1ZytZ78xW/mFwvZ5fo2N/68WWzzKpuqg9P7Rb9Igze8uPg3wmXtiZm4v0DpyUzQv5x6lnlbDTmxK80eAR6iVqSRJyjIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653644; c=relaxed/simple;
	bh=3I41Bmnex/TthoDe83NCP01XenUW07Sb46VyXq4oPCM=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=Sbs4vx29yN3Dw4oDYH49MJ0fu9qLHFkxBkqJ3Htkn1VaV6paR/RY6mB7BJJW++wDV552kbFSbWpcAvHNO069TPMPUy03FxCR3jV3kXSuoCSNYYzcq8WYbkmCTL1hIxG4m6Zv4yg26nBxoxqqnBYsF3r0h4Ps1KKFQxHwaDoxPqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E6QFmq010531
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:00:41 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3j6v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMfJgVFQy9RnvLbEhS9uPOQr8ktHCsdyOVFk0TW0Y5rA5hJdiFggQVD8YoF+bQDi6bD/2SDEw+lQZNk0lSJudpUf+N0r1mP5rrxItSlEAmuzqteV+P0zkdWC6HK4/9LN3CX5vu8OdH4Vu+D8Hi+HSH2o4s9WWfMShryMRPDKsBsyQKniSnVq1JQpn/vcS9gfPSVuKrdKae3O22w2puw0t7R1S7PAw6PkZFGWfsC/ysEOybVKY/O+wwSy0hS2cIj/hV7xR/aniP2o8MEMbnlgS6STgtKFcc+T0cD9tyHDizveSzbqeIKEboLVe847OM9PBs7xcNM64eBnmaqRiaE/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GR3DRTz2RA+M7TI6ysvLuMQcRo8ym+/jdYvOYDgv7i8=;
 b=Yl8lgQOguO5COYbSYxDPgXBgqYkUMAi9KEzS2eGBKKtqLinS/9RWFcDUVFkfxMW7e72quL0QuwRQJkCp87xLNyqJeUbmYhhamhuDX41jEoxxs/jegXEdxbAGkWrZeR3qgfZm7usWPtgzTLPs1npRAlhpRIPIAnfy9nS8fxGuU2I9+kWQvv/bk2vhDP0h3Wzzg8HzcFj8BmkFR3d1Q8M+3P1IANpkD6fBJH2CWbsucjhaQQh2uM4N3iJOZSj2f/eQKZicqA4c9eW1YmOCVKc+yEWbI6kO46GwHN+KosuJtVcQWT9PftVvgsaxm+fFud9h+z1Bvui2qu2/6SkFhygVUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB8806.namprd11.prod.outlook.com (2603:10b6:8:253::19)
 by CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:6e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 18:00:38 +0000
Received: from DS7PR11MB8806.namprd11.prod.outlook.com
 ([fe80::fd19:2442:ba3c:50c8]) by DS7PR11MB8806.namprd11.prod.outlook.com
 ([fe80::fd19:2442:ba3c:50c8%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 18:00:38 +0000
Message-ID: <d9c750c7-6a30-437b-90a5-e6e786f803fc@windriver.com>
Date: Mon, 14 Apr 2025 12:00:36 -0600
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: LKML <linux-kernel@vger.kernel.org>
From: Chris Friesen <chris.friesen@windriver.com>
Subject: [scheduler] questions around scheduler, task states, etc.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0058.namprd20.prod.outlook.com
 (2603:10b6:208:235::27) To DS7PR11MB8806.namprd11.prod.outlook.com
 (2603:10b6:8:253::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8806:EE_|CO1PR11MB5185:EE_
X-MS-Office365-Filtering-Correlation-Id: 5140f288-b9d7-467f-165c-08dd7b7e4352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UG9XZHNJd2hBZCtGWGhCMkd2RTQyZGVSblVsbC9lM2hCS2c3aXZDc3V2V1VC?=
 =?utf-8?B?a0c0MWM5NTZvdVpLKzlYcVZwc25zYk5SZDhTRVIxQ0NnV0d2NHRwZ09FNkVk?=
 =?utf-8?B?ZnJDdTZ1NmR5ck5nVWQwSUVPQks3UzBWVmR4VFE1SUNLVjlMZmhaeVBlS2V2?=
 =?utf-8?B?TnZ1R0NScWpFYStiazQvMCs2Mm5jSFVhMTE4akVCSWFQc2RNcW9KeVZkbW5n?=
 =?utf-8?B?L1c1dWVFRVRaaHdoMTBLLzVBK1JWWGl2dFFLMTJWUno0NFFQSi9kZEltNUha?=
 =?utf-8?B?QnRiUUtWdFBUNnBpNlRJb3dhdlpIZWtrUGNTWkN6b2kwRFg3c05iWFdrUVFW?=
 =?utf-8?B?eEhDYzlsUTNZcFBTbUdXdmI1ZWxrQmxPZEQwaGpJTnhYNlpCdWFFeDRBU2Zi?=
 =?utf-8?B?Rmg2RytiSWtDTWxDcWxXdWp0aTZBcWVhTWozYy8xcVo5NnBoMk9ZbnZCL3gr?=
 =?utf-8?B?ZE1OT2txekYweTdGY0UvYis5QkkvMUVvK2lDODhOYk5GYTBkdkcrZHRUTmVl?=
 =?utf-8?B?RkdvS2xKY0tZUi84Q094K2Qwbi85SGhBbitEZWhlTnIzK3l4M3ozbW45TnU5?=
 =?utf-8?B?Z3VlWFhwMXY4SXpZMkVNQ2NQV1hmWkE0VW1XVUsxMk0vMFZSNmtpK0c5MEVE?=
 =?utf-8?B?WllLaDBGWWpsNVVqSE9UM0RKYzQzS3g3ajVrREtlZUxFMWF3eUZ6RWNQaFhh?=
 =?utf-8?B?RHZPckN3dUtjSVdZRUE4bHIxVjRvd3BRRHNhMFFEQmhFV3FHeDRhMHZad2Zu?=
 =?utf-8?B?OEJ2Z2xteTZ0Z01nSU9EQVgwM1IreUxNL2NKZVZMb2xSRDVobzRVYWhrS0lL?=
 =?utf-8?B?ejdkUFdGYkx6d3I2UkMvdjFxcVFpY3E3eHVzVTdQRHhKd2pCdXhMSEhVUXJY?=
 =?utf-8?B?ZTVRZ1dGa1Y3VCtNTHNRdlJoZXkxbXFJSitwb2NuYWFIczBERUo4RkwyVWhM?=
 =?utf-8?B?bFd2Wk5FTnVWcnMvcWNLaWgwemMvdnBFcUdCeTI3cUtsMm80WHRGanhMRGhP?=
 =?utf-8?B?elJIbmM5QU0yUkZyVnVWdSt2K05lQUR3aGJseWtqaE9SV0NTRE5RVVl4bHVw?=
 =?utf-8?B?WVp5Qlp6MTg1VjRNYklRY1RlQ1pyZkxvWngydXlwaU1NYklZbEV5bVB6WVNT?=
 =?utf-8?B?LzduRW0xbjlPNGpnQWRvV0w4cm8rRk5Pa1ROQ29hR09DcjdVd2dwcllJVnlU?=
 =?utf-8?B?VzFVWUZCTUtoSUVMTXo5bXBqK1F3ZnlsL1FqcmNBYjZlUUlRMHc3UW0ycGta?=
 =?utf-8?B?SUtwYjY5K0VXVHFidGs4NlIrODlvSGJ3WEExcEZLUGVuS1U5VlVOUWtoOW5s?=
 =?utf-8?B?bVBoV0QvY08wL3ZlNHVmZUE0c0RQWThsZExYOEtwTFNIV2FMYUZSTEp2dzhZ?=
 =?utf-8?B?dDBGazZ3aEFTS2UzbHFyUElSajg5bExIV0VQaGh6cFg4U0JJR2FFMzJDUG5s?=
 =?utf-8?B?WXJocjBUVDdkVzZUNHpqbjhCTDUyS1BBQWhONjRHMXVOUkVvUytDUUNwMHk2?=
 =?utf-8?B?eWVlYXBlZ3htOHNUdUlNcUFIM3RITmVES1pYTXZ1T1JBemZYUERzM25IS0ND?=
 =?utf-8?B?dDJ0cE5JeXliOXlBRVFtMkRrSnJqTTV4NmlCR3pSMVEvbndEdVpFS0s2Vi9M?=
 =?utf-8?B?NzJDR1RrajRZdGlUVGhGS1RsNVZpZlZwUzNQSHZxdUp1Y0wyS0l3WDV5bkFz?=
 =?utf-8?B?WTZ3elUvL3pUQXpBbFdyTk5abFhJTW5vcEJMUzhOM3A5K011TEJmK2oxNXhy?=
 =?utf-8?B?ZGJCUmRNYUQ3V3dRUXVSR0I0cC96Y0xtelZVQkJLQUN3Ykx0TnRFQUJBb1Fi?=
 =?utf-8?B?REh4L3Axa0taM0lEK2xqb0tLM1hJalYzYTlNZVZwUFVBQnZPTnNGc1ZSVGts?=
 =?utf-8?B?emYzdWFrdDNQakNiZ01XZ3hKaXJLN3VNZ3ZHTmhDdUFMMVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB8806.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2tEVWZ1eHNEMEdveXBaWlJVdXIwMnRjSnEvR0FoS25nZnBKUkRQMDI2NkxH?=
 =?utf-8?B?SFA3dTR3MWZsUEJnSmh3L1cxVUIrN0VVMzFDbndWalhhQlVBTkxkYkgveDYy?=
 =?utf-8?B?Q1gxSU5jSXBndmdvNkF5QmRqU1pIaGc0c2c3YloxTzgvQTdSQmV2TGhvd0VR?=
 =?utf-8?B?aXF4amMvcFI5Q044VXVZVE42NWVBVVNnV0U0UG4xdWVsbzZCZU4wMEl5WDdh?=
 =?utf-8?B?UUNwWXZMcHpOVEVYTnRud1pKVEZJT1NjekswV1VpZEZscElQa1A1TTVNZUtU?=
 =?utf-8?B?YjgyeUF2VGZ6VGZscWkzL1QweXlWNG1ZSU9xMmo3ZmZ1bDN6NGIzZ2dDY0ww?=
 =?utf-8?B?NCtlMjgySjNycGxFVkF2djAxWDd4dnJPNlpBNFlNbmxYcmY4KzMrWnlGMEhQ?=
 =?utf-8?B?dCtiVEtVaW1sN2k5b2VOZ1lQeUdDWDlkRkxyQkppV1RHQWcvRmNXZUdFTnVO?=
 =?utf-8?B?Z1IrbnJDbDRMcmVJMjBzOGdoR3VNc0RGMGNHZDY5cWQ3eldLTmh0RkNsTVdT?=
 =?utf-8?B?UFA3V2RQRG9oblB5QUZKbnBFaVRwbjFkeDd0TVJPT0gxWEdyZ3dBV1pGM3o2?=
 =?utf-8?B?REVyQ2dtVngzSGhNeGZkN2RWM3U3ejZjQlo5Y3hEVGY3N1VtZmh6Y1BZSkQ1?=
 =?utf-8?B?NTM2TUI3b3lEVnpZVFI1WVpiMDBBZjNwNXhSZWV3cjBpdlZhNVA4cXVNa1VE?=
 =?utf-8?B?aHRrTklYSy96MDdId3VNVTZHYUt5S3JBK0tNMmNJcUZNR2RjN2RzUXNnWWUx?=
 =?utf-8?B?ZUtCUG05cmRqZW4za1h1cUlDalkwMkxQeUZxb3QxK3Y5VFNkY2JtdUZHRnF3?=
 =?utf-8?B?dVdFaXRLOHVRZ2tJWVBHdzNFTFg0eE5OYmlTM2c0YVZjcHlrOXlwZ3VjclVF?=
 =?utf-8?B?RkVmZEdVNVd1NFZ6cG4vejlhendJdkplazBWaUpBUmxMcnM2MGJ4QnV5bDI0?=
 =?utf-8?B?WUpHb1RLdkJwZGZYZUNSVjBvaTJmYTV4Smp5UWgzNFZ6TEZlb1RHN0NqMnph?=
 =?utf-8?B?MzQyQnN4eVJlb2VuaXBRdUlseFpvOGdrMSs0QlBuclpkY2ZHaVRyekdLV2RG?=
 =?utf-8?B?ZmxJbG8wdlZwcFNpVzdCNUtZTVRvc0hmQmU3TDJ5bEM1VlNVbkNuVjdDTVo4?=
 =?utf-8?B?cEZ0SmR3NXl5VEZXOEN5VG5QQ0ZHQWVDbWdtdEMwd3U1dFBBcy9VSE42K28y?=
 =?utf-8?B?MVl2c3FJdU9ZYXlWTEJKaTBjZHMrWlJoUXUrQzZsMmdkNXZHaExyM3lrSDUr?=
 =?utf-8?B?bWZudWpxZFl3cUtidUtVSXQ4Y1R4WURaMW0xdzMwR0JNT2RZU25QcWZmMGp3?=
 =?utf-8?B?WUtKam1nNTJ4VXFiZGR1ZXJsQzZpL3B6MkErRG5LTjc5WFlKc0dkb2tWZWJV?=
 =?utf-8?B?eEh1RUUvdnZZMzVnZW5LMWNVRkNMcEN0RmhUQ3NIck1PTVo4YUdtL3FURVJw?=
 =?utf-8?B?NWdzMUEzYTRZYXZpaVlaVW9CMTVLQnJkdm5jcitEc3Q1eXR2NDFaWWpvbE5Z?=
 =?utf-8?B?Z21NYWVtQ1RDUjJsTzYrRWYzL1JSaUVYRGhjU1FWbDFOcTgrNHdDMldCaFpi?=
 =?utf-8?B?NVplZVhJQjFpZ2gyMlVOcDNxV3FxZk1Qc0xHS3EvYWt0YjlYUUFTT0xhM2Vq?=
 =?utf-8?B?VTIydUpXSnhNck5jY2RKNTc4WVdvY0VUeDFNVzJldUZ6NWxvem5VMTNLWDBt?=
 =?utf-8?B?czVHSElGVlpoVW1tZSt5ZnNod2RqbGNXdlZqckdvcUpGSjAvVm91a0xadjR4?=
 =?utf-8?B?RDQrblBkZjRmYTFWOHVkY1ZiN1RVZEIrekhJc3RyeWpqUTNnSlJHekdPNGQw?=
 =?utf-8?B?a1dPSUY1dm9OdjF3OW9JZDY5ajYwd0QvcWd2NE9zcXd0M2xyZ05SMTkwdVgy?=
 =?utf-8?B?bk04OS8vWkhPL3piMUtGZE9QY0ovYkpEU2tXa2VTdU1yeFdwaVpoVDZxU3hj?=
 =?utf-8?B?ejQ1Q3VNdXF4c2lLUGU4aWg3NC9sY3J0b1J6MThNQWZzTzR5TjVpdGdEejV5?=
 =?utf-8?B?d3NaWlZMczkzSGE0V0IvcnFXbVo5OW5mYW9KVjVPOTBLSnhBZ1Ria2VxZS8y?=
 =?utf-8?B?SFdRWmIxRzRoTXJsWFFJZG16dDJqMlZsWjlRUndhZWRFVy9wdWF2ZU5Jam13?=
 =?utf-8?B?OXpvak42WDhSdjRpeEVqcnRPc1BwWXByWHJpcU1nS1VINlpOVjViek1KZWQv?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5140f288-b9d7-467f-165c-08dd7b7e4352
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:00:38.3921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMAgJYjC+qHLAqkVz3gobZ7xc0qdjHeS0u0dXxmZ4UYmYpMCsV/igMOEHm5DIDRyvuDMdpT+14jxyNhC2D5hFsRIM7a9batUwgoo97/AJ2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5185
X-Proofpoint-ORIG-GUID: Y6nnW7NN2DcVjkcfrLCMAJTW4MuWB1LN
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=67fd4d49 cx=c_pps a=r2a4NctkKoQReJT0uaIV7w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=ZhycmZACGotjpkMVGyUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: Y6nnW7NN2DcVjkcfrLCMAJTW4MuWB1LN
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=848 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140130

In do_wait(), we basically do:

add_wait_queue()
set_current_state(TASK_INTERRUPTIBLE)
__do_wait()
schedule()
__set_current_state(TASK_RUNNING)
remove_wait_queue()

Would it be valid to move the set_current_state(TASK_INTERRUPTIBLE) call 
to *after* the call to __do_wait()?   Or would that break something?

The reason I ask is that I'm working on a system (6.6 kernel with RT 
patches) that uses stalld, and it only evaluates tasks in the 
TASK_RUNNING state.  There seems to be a code path in __do_wait() where 
the code can be preempted by a high-priority CPU hog while partially 
holding tasklist_lock, and this leads to bad things because stalld 
doesn't consider the preempted task as actually being runnable due to 
the task state being TASK_INTERRUPTIBLE.

If we could defer setting the state to TASK_INTERRUPTIBLE until right 
before we call schedule(), I think that would avoid the issue.

I'm not currently subscribed to the list, so please CC me on replies.

Thanks,
Chris Friesen
