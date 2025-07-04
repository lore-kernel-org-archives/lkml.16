Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5422877F8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618944; cv=fail; b=QS38gxm9as8Xww57BME0xZubFviwi2thAouA6iSa5MoXlhAfcui7SFdFnq9jXXMrneYyw8gOUo26/wOsoi+0NY4w9ecpPLmzmA4QL8TqUhZg4n0ZD2UP175dgrjMD0YTovMGici1SYkLEruei95XHCcLneDU6qosYKOcJjZ/Bss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618944; c=relaxed/simple;
	bh=w24/AXJLNA/4O/RlSVlfnk2YUfmEIXS5ofhbqX9JzwU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TqtzpIT4S23npvWjzVobO5hO3NgxLRgR6f2ia37xLJw82GNg+Aw7IYA0sW8yWkkcOymjdzEwJSlNiQcMsdW0PgQsf+FfB8xYWVqLvCp5eaV3LXuyusUiLEoFvTUDD6DuGP36G2a10jcGxmhn/wTsWXr6gLJiNUwISCxm75/rXNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0RrLf91b; arc=fail smtp.client-ip=40.107.244.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0RrLf91b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVvSjaSJvS0kd+8H4LNE8DxHwAEPLSup/BG1afL1TTpN/qnI3YCxyIsmF/P7KhWWub933MIrTlcF0yQbq03GWtp/Cf7iqSk7s+6IeaUAORJiP/CqK9hcqL15X0q02sH4jPN8Q/xITZvR79inOBfwoxd5XVa4wkq8AI3WGKQpjOXMuNG7/7PvHOv7rmk0scucS69T+j7v+m8+ehzKfRGfLpV7fw1meYPt/4WCjQErrV3GK/CbGTGnrVOJyBgMJ/BUZ3Dak0diR6rPYD+kkGMWdHgUJj1ZgEYFxXizCpgD9kgtrUBQt/ADL+chlNFhEwPD6Wv2Z7ZInBHi5OQAubZpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdB5+YypOvMZsI2ToMIupQNFg9PoiR0fjn/LnGrHRZo=;
 b=ui8t9Cuv/LggB1Z0J22kMIFOA+jJElzQoeLVea+C5/tU7bShTj+m8i5PF5OrVyp3bFHMBrJvRBkM06ddVAu2NolwM4VcfMY4a0ZvFVElqlet86SRLoNqKQFxVEVGvo1qgiiD1r7x5iIui+VaKpGZ3/pB6Lr2JEDwzJJKXbeUK2pEA2qT9uGIRGknRNp+pvtOtRS07FnYaFOPHH/XIAv0yEtNJJ4g2s1JCHhpF0r6Nx3GELOYcTzWykZc2bD/MUWLo6eYycoe6s5CUMQ0ZsJa4x6wL0sdXTwLyhRMKKRKiHAxpA3b7ktD8vXkfjIRrGcVy9Q45bTZlk7dQd49AW+BaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdB5+YypOvMZsI2ToMIupQNFg9PoiR0fjn/LnGrHRZo=;
 b=0RrLf91buqmqa5hCMoqR19UWJWZybS+KaNwfNnuFW7PCTf9dUrmD+GnqOj3UX1dQ4D1SHrA+0TERIBUQMEIhcWvMi+ifqRaNL1wG1LjKPG99UitI9EjxFExibgu9EYD55nZJmVNfMb+g4WJg5t29rO6CvygOXz9fiPDOzQMOpqo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 08:48:58 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 08:48:58 +0000
Message-ID: <b4461e54-ab3c-4596-8da2-ffbd4c7d87b6@amd.com>
Date: Fri, 4 Jul 2025 14:18:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Defer throttle when task exits to user
To: Aaron Lu <ziqianlu@bytedance.com>, Benjamin Segall <bsegall@google.com>,
 Chengming Zhou <chengming.zhou@linux.dev>
Cc: Valentin Schneider <vschneid@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>,
 linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
 <xm26qzyyb6cn.fsf@google.com> <dc54a6ab-2529-4def-ae7d-6a217e3bc1bc@amd.com>
 <20250704075430.GA1641@bytedance>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250704075430.GA1641@bytedance>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::7) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|MN2PR12MB4126:EE_
X-MS-Office365-Filtering-Correlation-Id: 32bd4803-f865-4858-2a6c-08ddbad79d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFJRRHBTU1dQRktaQmN4MVJBM0M5cWNrT1ZqcEF6TTFFSnVWQ1lYcFBieTZj?=
 =?utf-8?B?NmthUXdiMjcwZ1k0Q0lsNFcvd1hKSnIzUUVKWHQyanJDSTdGQ0ZJVGIrSU9L?=
 =?utf-8?B?TXZ6V280d3lSM2JyaTlSdVBEZkNLZ0dEUm5BYVlUdklOVXE2ckt4ZkZaYkY1?=
 =?utf-8?B?STl4ZkcvcFJIaG1tQmJ0TCtFR2xVVTRmcFlYa2R4Q0hDdW1BeVRqMXpNTmMx?=
 =?utf-8?B?VGl0NlhOUEkvYjJBVTBKcmx5L2U4OUJuTzhzNldYOHBWM25Cb01UV3hsbGVP?=
 =?utf-8?B?azZCSEZJTjFndlE4eFhNWEpLME1zRTZTYmVMQVhuRXEvVnJVWGxwZERNQmJR?=
 =?utf-8?B?RzV0VEx1bEh0WXpjVi9UNFp0SGh6dEY2OFBzQzlua2tXOEdxR3VzeXF2Szdm?=
 =?utf-8?B?T01tdklycWpEazFkK2xkVWcrR01QS1RSYTZGSk1TNkJVOWxtRnJyTmpCdU9T?=
 =?utf-8?B?RnRCQlJpdVFQQkhoSWZ1a3ltQ25zNndqRGd2V2FIOGlmYVZVMUt3cWJOQUda?=
 =?utf-8?B?MVpTQzhtWWwvWTFzTXRmSTZwUGRYSmR3WHdmc3JuMEZhTHBIbmk1MnU0WVRu?=
 =?utf-8?B?QTY2ZFN3TXl4WkxkMDZaVURTN0pJNXFYQ005Wk1hbkhwemJpeXVxbDJPenIw?=
 =?utf-8?B?eXd6ckJRM2k2aFZscE5wV2tEZmF3RlRoUnBjMnVxK3o0ZXM4R0dOZWRKSjVI?=
 =?utf-8?B?eFRDcVJoWXlkcDE0UVRMY3pEdkd6WTFpTU1DNjB5Lzg3UWhEV0VqRHIvenFp?=
 =?utf-8?B?bzBZRktZZ0ZXajBsWHJYUnNRWnV4SWY3YXg4UDJIOXU1RjcxTGd2RWlyVW5y?=
 =?utf-8?B?Q0lydmZtMytQTlVhTjBlZ2htVmJrZ2RNU2owcmxkU29YT2taQVBrM1B5ZnRV?=
 =?utf-8?B?N2hQWFBLdktPOUhDT01yUkRub3ZmcStEM0MzYjlJVG9sTUd2UURhUkgzdEdY?=
 =?utf-8?B?MXBycXJWWWRDWlM3SWxZT1V3Q1o0WjBHUklLeC80N2M4UDVXd29ZdFNwZzhw?=
 =?utf-8?B?V1VvRHo0YTUzZVZTcFpNakVZd1hSdFFrdEdWQ1RWTXRTTEo5MWtGNmIvUVQr?=
 =?utf-8?B?V3JhZG8zUWVQeDZ6TTBrZnVZK0RLMTBjenhKSnpMMXJKMkhxSDlmdXVTMVE5?=
 =?utf-8?B?N2U4Wk02L2h0aFBrN3RwVVlXdE5VeUJFWGY2aVhyNENydi9iWUFEdFhvdmt4?=
 =?utf-8?B?WUpQbnJtNjQ0eEdaQm16YmFtdHdCanJEREpDZWNWMXh5T3Npeno4ODQyaE9U?=
 =?utf-8?B?UzJpZlBEbkdCbDVORDV1Ym84b0ZlcFFWM0g5L0QwV1A3Z1IvbXFYZ09rTHpL?=
 =?utf-8?B?QklXY2NOa0hiTHRvUnk2ZVJ0WGpOenZsc0RPOHh3bEFjYnYzYU9EWUcrM2Nx?=
 =?utf-8?B?UUlsZVZqZCtuWjM3RW9wMXJaNDhVM1MzL05KVnZBbnVsaGs1Ynl0c20vekZC?=
 =?utf-8?B?TzJJYm5FR04vZGlwZytyaDF4NDQ4N3BUNTVqZFhEZzhseW03a3BnZStReVBH?=
 =?utf-8?B?L2RqeHZIeUtac2FzTThwYXRkQVM4NlZvVVMwZmE5VHdPZDhTSkJUa08zNHhZ?=
 =?utf-8?B?UXV5eTRNS2JBNnBFM1FoSWNSNnZFUFBBK1NoK1BvMXprc3dVUHFodDdBMVZW?=
 =?utf-8?B?SkJPcVlERXhEbURQZ0lPNnFhbFpkQmVyUTdKTUx2elduTi9RRjNtUi9CYnZv?=
 =?utf-8?B?dlpJRnYyK1N6cERxQW10NnFIRnVvWjFaN3BLRHEyRUJpeGJTb051ckQzNER6?=
 =?utf-8?B?Q2ZLNG4wNkViZldPTEZJMDFjU1VsTmd2cDVlWXVpdExKTWJTcnhJTEpXcDNu?=
 =?utf-8?B?TUY0ZmtZcjJncnd4VjRWSTQ0U3lQaFluOGlPV29lYzV0TEpERHd4Y08rc0dr?=
 =?utf-8?B?RHpUTmhNYURpQWl6L2hOYnVsR1poSGVDa1NZTWltZW01M0hsdFIyRFVHQW5M?=
 =?utf-8?Q?GxNDlcZ19aA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGhPQmNqN2I2eFcrY2FDeWRYaVBiNHU2dzM5MzJTR0c5a1grb2NReVQwUWk1?=
 =?utf-8?B?emFYKzZ0cDFtU0FJZ0dPVW52eis0b2VtUHY2aHVELzJVSkpQTGx4RDI3Z0d3?=
 =?utf-8?B?UVU0YlBSQ1RiNHF4L2dxRW5oUEdJN3RYU2ZOTStwQm95OC8rN1BSNHkyem1L?=
 =?utf-8?B?ZUNrOG9qaEUwcHpaSkJGV3B0ODdXZzQyaVR5UEN2UVgrR2RXc3luYmZjWWxw?=
 =?utf-8?B?b2JxdndiSE9wOFFLdy9PZUxqbXJPbFpsR2t2aXZ6TDJCRVk1Q2o5ekRiRzFF?=
 =?utf-8?B?QS8xTUVubFBJL2NpOGUrelRFU1NVM1VkSDJad0lpUVdLY2crVXdGM3ZUODFt?=
 =?utf-8?B?VmIwWjJZZmRkSkU3eWxucnlGcXFBMW95bDJUQ0hDNk1Xbk9PNzdQRjAvSXFn?=
 =?utf-8?B?SFI3VDNvM0FTQ0cvV3NTNGwwQUpUSTJXZUU2Zmo5OUcwQ1RQeHJWSTI4NFYx?=
 =?utf-8?B?d2lGK1NEMVBOanpGb1F6QlErNWFXWWkyMG4yOTBoUnlEM1NGcDBvR1ZtR2Zl?=
 =?utf-8?B?WkJ0Ykc1RnJKTVNjTzVsWTY3dUJlUGlUK0lISWVadkFPWXlZK2ZVTkk3NkYz?=
 =?utf-8?B?T1VkVFpEUmlUVnZkL0NxUjgxaFh1alBqWktaYkRDN1RhQ2pHanJ2SXcxWXlv?=
 =?utf-8?B?OGFXZE1MV2IxRFM1anhQVzlkR0dsOU9UU3RISUdxeTJhTXFKYVBKVXRtTXla?=
 =?utf-8?B?cittOEdLUmpKdXhMdWxkOTQ5bGN0N2psTHJHOVZOZ2J3OThoSGFEVHpBT2Qv?=
 =?utf-8?B?UXBpd08xeE9DZTRlcExLcFFUWm5jcTJOL1BWNEZuaXZHNHZtVUtsaUhzbEZQ?=
 =?utf-8?B?QXZrRkIrR2tZYUVUaDdZMEM0TEFLdWF2MTlFZzZXdzFVYklUc1BTNWhMbWlE?=
 =?utf-8?B?aDVIODRib1FpcUYyWmI0T2Y3NDFKUXNOTURqTXZINHh3N0xMMkVaNGsrS2tk?=
 =?utf-8?B?UkFPUEpEZXlyQnBweVdzSDU0SCtYY0hwek1PZ0JuSk9tTHJoTE9sS0tEejVn?=
 =?utf-8?B?dzZ2bExUbnNONTE4VkxMdGNTeUF1clMzQ1kvTmVqRUV6SVNIcWhkTHJxS0Rq?=
 =?utf-8?B?Rkw2Ymk2V0JKb2ZlME5MZkt4WStRWnJzNHB0Q2V6T3c5elF2RWtkWlU0R1hY?=
 =?utf-8?B?bEM3ck5zYTd4K1JOZHUwNU4rY2Z0K3BUTUlrMXFFUUY5YUwxWTJuZXF6QXdH?=
 =?utf-8?B?enJwcWZreXhBcFJCSDUzY3g4aFdOc0tFMlR1aUtWUEJHVUx5OG9pdThhYi9x?=
 =?utf-8?B?ekRkaTRXSnpUcnZSWUdwWUhlLzFzb1VMMWExYUR3c09ZTFNadzJmTmhPR2tB?=
 =?utf-8?B?eTcwNXV3d2xzeTFENWVKSlYrQm5FMGFmSDFKc2RWeGNHMmNLZXdaVFlHNmhD?=
 =?utf-8?B?TG5GUVQyRllhQytLNXJab0h6eDhVRWNBcU1JTVhuUXlGUC9QZlVJMC9LWVIx?=
 =?utf-8?B?anlNeEhUem1wSDRaQ3pnSWMwTzFTayt0RlExeUFMd2Rob0NnRnNSV2ttSWVt?=
 =?utf-8?B?ZndRWWZEdnEyWWVQaGZXYjBhLzhPRFkyK0hPQ3V2cWNEQVZFRjN1eEd5c0Mv?=
 =?utf-8?B?UnpFRXBqVVFVVHpBWW5wTy9PZ28xT1l0eHN3T1dsaWhGWGxpNTZQTVNBeE1V?=
 =?utf-8?B?YWJTOEFrNUYzNTh6am8rY2FnVUZJdGt3eEx3djd6SG5IeVRJTHhUU3Z4UllT?=
 =?utf-8?B?MG9DL29rUEpZV1BsVzAxVE1uZWF6Z0xNcUF0ZTJDQWs1Uy9WSXBJMnhibW8y?=
 =?utf-8?B?MXM1bElvaUZrUDNMTGszYnRLMmJGMW5jYlREN3lkMjNZTXBXdEZ3N0M0Q2Fs?=
 =?utf-8?B?L3ZES1V4L25kejRaUGo1RTljTFM3elBseFJpT283V2Y1cmVYUWk4ZDk3c2Jx?=
 =?utf-8?B?QUJJcFJFcWt2Zm9ZanhPbDRrV0tGQkR5bUxqR3FnZDMyVGR2bCt3eUdQbVJ1?=
 =?utf-8?B?MWxWQzQ5Zm5GM2RFK1NLbjJDendraGNwRUJRV0RSL29GMFVRRzRvUkhDR1Jq?=
 =?utf-8?B?anB3b2VQVjArS0lTN1l6OWJuWU4vVUYwRmtzMEpZQ1BzSVhHOHlIU0lkT21C?=
 =?utf-8?B?VVNPMEFtWHdrd0c2SmpJR0h1WDJIZlJKVytEUFVLcS9uaWZQeDFYVUMxRjF1?=
 =?utf-8?Q?BHN5y0WMWNWFogmIG3zpLjP5B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bd4803-f865-4858-2a6c-08ddbad79d5f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 08:48:58.1901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKCZwETJGLvg8gRHiPlI8GQ0lyRJpiuNbpXRvYzY46UEP0XMxv0dKRTIpnskFegNclB6NIg44r/txMJ/Y1g/2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126

Hello Aaron,

On 7/4/2025 1:24 PM, Aaron Lu wrote:
> On Fri, Jul 04, 2025 at 10:04:13AM +0530, K Prateek Nayak wrote:
>> Hello Ben,
>>
>> On 7/3/2025 3:30 AM, Benjamin Segall wrote:
>>> Aaron Lu <ziqianlu@bytedance.com> writes:
>>>
>>>> For pelt clock, I chose to keep the current behavior to freeze it on
>>>> cfs_rq's throttle time. The assumption is that tasks running in kernel
>>>> mode should not last too long, freezing the cfs_rq's pelt clock can keep
>>>> its load and its corresponding sched_entity's weight. Hopefully, this can
>>>> result in a stable situation for the remaining running tasks to quickly
>>>> finish their jobs in kernel mode.
>>>
>>> I suppose the way that this would go wrong would be CPU 1 using up all
>>> of the quota, and then a task waking up on CPU 2 and trying to run in
>>> the kernel for a while. I suspect pelt time needs to also keep running
>>> until all the tasks are asleep (and that's what we have been running at
>>> google with the version based on separate accounting, so we haven't
>>> accidentally done a large scale test of letting it pause).
>>
>> Thinking out loud ...
>>
>> One thing this can possibly do is create a lot of:
>>
>>    throttled -> partially unthrottled -> throttled
>>
>> transitions when tasks wakeup on throttled hierarchy, run for a while,
>> and then go back to sleep. If the PELT clocks aren't frozen, this
>> either means:
>>
>> 1. Do a full walk_tg_tree_from() placing all the leaf cfs_rq that have
>>     any load associated back onto the list and allow PELT to progress only
>>     to then remove them again once tasks go back to sleep. A great many of
>>     these transitions are possible theoretically which is not ideal.
>>
> 
> I'm going this route, becasue it is kind of already the case now :)
> 
> I mean throttled cfs_rqs are already added back to the leaf cfs_rq
> list during enqueue time, to make the assert_list_leaf_cfs_rq(rq); at
> the bottom of enqueue_task_fair() happy when a task is enqueued to a
> throttled cfs_rq.
> 
> I'm sorry if this is not obvious in this series, I guess I put too many
> things in patch3.
> 
> Below is the diff I cooked on top of this series to keep pelt clock
> running as long as there is task running in a throttled cfs_rq, does it
> look sane?
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d869c8b51c5a6..410b850df2a12 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5290,8 +5290,15 @@ enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>   	se->on_rq = 1;
>   
>   	if (cfs_rq->nr_queued == 1) {
> +		struct rq *rq = rq_of(cfs_rq);
> +
>   		check_enqueue_throttle(cfs_rq);
>   		list_add_leaf_cfs_rq(cfs_rq);
> +		if (cfs_rq->pelt_clock_throttled) {
> +			cfs_rq->throttled_clock_pelt_time += rq_clock_pelt(rq) -
> +				cfs_rq->throttled_clock_pelt;
> +			cfs_rq->pelt_clock_throttled = 0;
> +		}

At this point we've already done a update_load_avg() above in
enqueue_entity() without unfreezing the PELT clock. Does it make
sense to do it at the beginning?

Overall idea seems sane to me. I was thinking if anything can go
wrong by only unfreezing the PELT for one part of the hierarchy but
I suppose the other cfs_rq can be considered individually throttled
and it should turn out fine.

>   	}
>   }
>   
> @@ -5437,8 +5444,13 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>   
>   	if (cfs_rq->nr_queued == 0) {
>   		update_idle_cfs_rq_clock_pelt(cfs_rq);
> -		if (throttled_hierarchy(cfs_rq))
> +		if (throttled_hierarchy(cfs_rq)) {
> +			struct rq *rq = rq_of(cfs_rq);
> +
> +			cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
> +			cfs_rq->pelt_clock_throttled = 1;
>   			list_del_leaf_cfs_rq(cfs_rq);
> +		}
>   	}
>   
>   	return true;
> @@ -5873,8 +5885,11 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
>   	if (--cfs_rq->throttle_count)
>   		return 0;
>   
> -	cfs_rq->throttled_clock_pelt_time += rq_clock_pelt(rq) -
> -		cfs_rq->throttled_clock_pelt;
> +	if (cfs_rq->pelt_clock_throttled) {
> +		cfs_rq->throttled_clock_pelt_time += rq_clock_pelt(rq) -
> +			cfs_rq->throttled_clock_pelt;
> +		cfs_rq->pelt_clock_throttled = 0;
> +	}
>   
>   	if (cfs_rq->throttled_clock_self) {
>   		u64 delta = rq_clock(rq) - cfs_rq->throttled_clock_self;
> @@ -5939,11 +5954,13 @@ static int tg_throttle_down(struct task_group *tg, void *data)
>   	if (cfs_rq->throttle_count++)
>   		return 0;
>   
> -	/* group is entering throttled state, stop time */
> -	cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
>   
> -	if (!cfs_rq->nr_queued)
> +	if (!cfs_rq->nr_queued) {
> +		/* group is entering throttled state, stop time */
> +		cfs_rq->throttled_clock_pelt = rq_clock_pelt(rq);
> +		cfs_rq->pelt_clock_throttled = 1;
>   		list_del_leaf_cfs_rq(cfs_rq);
> +	}
>   
>   	WARN_ON_ONCE(cfs_rq->throttled_clock_self);
>   	WARN_ON_ONCE(!list_empty(&cfs_rq->throttled_limbo_list));
> diff --git a/kernel/sched/pelt.h b/kernel/sched/pelt.h
> index 62c3fa543c0f2..f921302dc40fb 100644
> --- a/kernel/sched/pelt.h
> +++ b/kernel/sched/pelt.h
> @@ -162,7 +162,7 @@ static inline void update_idle_cfs_rq_clock_pelt(struct cfs_rq *cfs_rq)
>   {
>   	u64 throttled;
>   
> -	if (unlikely(cfs_rq->throttle_count))
> +	if (unlikely(cfs_rq->pelt_clock_throttled))
>   		throttled = U64_MAX;
>   	else
>   		throttled = cfs_rq->throttled_clock_pelt_time;
> @@ -173,7 +173,7 @@ static inline void update_idle_cfs_rq_clock_pelt(struct cfs_rq *cfs_rq)
>   /* rq->task_clock normalized against any time this cfs_rq has spent throttled */
>   static inline u64 cfs_rq_clock_pelt(struct cfs_rq *cfs_rq)
>   {
> -	if (unlikely(cfs_rq->throttle_count))
> +	if (unlikely(cfs_rq->pelt_clock_throttled))
>   		return cfs_rq->throttled_clock_pelt - cfs_rq->throttled_clock_pelt_time;
>   
>   	return rq_clock_pelt(rq_of(cfs_rq)) - cfs_rq->throttled_clock_pelt_time;
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index f2a07537d3c12..877e40ccd8cc1 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -724,7 +724,8 @@ struct cfs_rq {
>   	u64			throttled_clock_pelt_time;
>   	u64			throttled_clock_self;
>   	u64			throttled_clock_self_time;
> -	int			throttled;
> +	int			throttled:1;
> +	int			pelt_clock_throttled:1;
>   	int			throttle_count;
>   	struct list_head	throttled_list;
>   	struct list_head	throttled_csd_list;
> 
> 
> Thanks,
> Aaron
> 
>> 2. Propagate the delta time where PELT was not frozen during unthrottle
>>     and if it isn't 0, do an update_load_avg() to sync PELT. This will
>>     increase the overhead of the tg_tree callback which isn't ideal
>>     either. It can also complicate the enqueue path since the PELT of
>>     the the cfs_rq hierarchy being enqueued may need correction before
>>     the task can be enqueued.
>>
>> I know Josh hates both approaches since tg_tree_walks are already very
>> expensive in your use cases and it has to be done in a non-preemptible
>> context holding the rq_lock but which do you think is the lesser of two
>> evils? Or is there a better solution that I have completely missed?
>>
>>>
>>> Otherwise it does look ok, so long as we're ok with increasing distribute
>>> time again.
>>
>> -- 
>> Thanks and Regards,
>> Prateek
>>

-- 
Thanks and Regards,
Prateek

