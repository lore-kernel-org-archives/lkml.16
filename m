Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6101DF270
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344789; cv=fail; b=We1OJHbjlQsUyA/7SzfPUjVAU5/nGxFHdkCffoef4hkVjCWDUL+ZL+OqAi0F1b4Ja/5G0b0tS82I35zPbdmBnEXq77wGTF+1lxRHRz2BnkQXpWmkPWO5oPW22NpRfVnzqyboYOQIUKHaw/RXXpGVKcL+Kbm1kzs975+xYcKdBgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344789; c=relaxed/simple;
	bh=FkzmUvnjY5lT1LgQd/YOUIOUggx5XNXHboS4qkBBqYI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hlkzoYQz/dnyD5HwdEkQpCj/3EQdhshd3XTkyvk+HX/7oJO0f3PQ3sLGE9ecFa1iYXAzjxu90bKMqjTTELoSaKVh2GUYPnS0QFw4IUs07/DQhRMfbbVbMpkjUtIlVlfXBVt7tLpRI6GvpsRbGw2jGSON6p/EPaVDn2ILDN/bQA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0TPcavIs; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0TPcavIs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snsEAsNiio9KaFqiArN+7fvQPlTriLJKfTgYCO/aCFEZGF/agO2hAzs+DN3Eg75jo6ZXZPKJjcec8OXc5FqYij2yUAfT6FwqxMWc1GQv6MSxUzl8p4MzGpwm5ezV4b/AFUxSO4NrbT9liRPq/DOs2sPJ9JHJB9b8P1g4VDF8df7/+wj5BGrraaGuu5e4M18YoI4um3LXKcOnDo7ujB31IUqg18b3E/uQNirCtICyKiTTK5aC5L7+TsapFAWgYcc9F10CDYiCdw98pGmqeJMeRlr/APKYTpFx4PRa5EGVL8ux3RK7RNL4PSTPeDLYQWAXD+NwIk9FdhKWwAsnkZuDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX7lQ5lcs4E0QUNdZ6piUr4dJglNa//iGU4k1MXBZvs=;
 b=IOHgP4deXOoLHA4nDdh0JPZgCej+j2FCHGratvuR7ow2CHwUcPU2QpbgQljY0Irb7Qig9p9IFsU9m1ycg8ZT3LkaTQSFgceNxUL9hGAzmxlwbhjLgcx7O3mI2U5wXKaZfJbUGsR7Qci8dut+4ddcsPGVIouGQfSqxvy5lj8BLni1Nzkjzy0b86z1CTqPuWQ2874C94HVwVtPbaNUVwiAP9WiuA9/9a/U4CF2dY59GHWgjcPh+c+DHMuvzcVDvnHcB208Y2YlBNMvhfQYUfN+RGd1+/H99fp+hMU8Y89AmlbjazoQNzBuHG2ejdGylgYRHXiFe+RIiU6+VwB0z9NHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX7lQ5lcs4E0QUNdZ6piUr4dJglNa//iGU4k1MXBZvs=;
 b=0TPcavIsXK/nIv90EHviov+779uT0vVOI+MQiur/7UMbgkwi1NoKS/kqTVJodzkcRMQ5xmC5DA6Hp4+fI/7eOI5TK7Lh36yiuu4QMC+9nC4A6xS7IT7aq4ySRnJkqRGdUQoDTlJofobv2J7lTA5NkRiNMAADQGMgH0cWB/HyB6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by MN0PR12MB6080.namprd12.prod.outlook.com (2603:10b6:208:3c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 11:19:45 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 11:19:44 +0000
Message-ID: <8501f4a8-8480-477e-8ab1-1d7796b978f1@amd.com>
Date: Tue, 27 May 2025 16:49:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] sched/fair: Take care of group/affinity/sched_class
 change for throttled task
To: Aaron Lu <ziqianlu@bytedance.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <vschneid@redhat.com>, Ben Segall
 <bsegall@google.com>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>,
 linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-5-ziqianlu@bytedance.com>
 <20250522120336.GI39944@noisy.programming.kicks-ass.net>
 <20250522124840.GC672414@bytedance>
 <20250523145942.GL39944@noisy.programming.kicks-ass.net>
 <20250526113352.GA2993700@bytedance> <20250527065836.GA3373486@bytedance>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250527065836.GA3373486@bytedance>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::8) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|MN0PR12MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e30659-a775-4388-787c-08dd9d1061b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OU9oc2tDSjFuZ08zMENtcFMrUXlNYjluMitsZ012TVhFTU1kQkZQaWN6bXZU?=
 =?utf-8?B?L0ZhK0trZTJuUVZKbnZXL1c0Vk9zV0hIU0JmVFArcGVGS1UybXQ5VllIYXZt?=
 =?utf-8?B?VnJsUDhyRDgxMldZa0JidVovWWkvb0lta01xYVlSUFBzdkdpY2ZsanBUOEM5?=
 =?utf-8?B?VVBNN1I0bnVWQ2s5RDVycEZsNXRzeVNveEV3dUUyczJhNXdTZC9hSXpPRUxN?=
 =?utf-8?B?SW9QK2lCWHZ2ejdGRHlnRWVXdWpoWVdTUG9Tdm15bEk5WWNMTGk5U1N5U2pQ?=
 =?utf-8?B?OEEwMWl3UWJuR2ZtRFlFTzc1TkNXZ2EwVUdwZXNsaThGTFFZNGhYMWIwWjlX?=
 =?utf-8?B?a0ZIY3IyeEt1UEtFK2R6UDd2ZzFsUjhkQ3FoOVMwRnFsOU9rY01vL1h4S3pn?=
 =?utf-8?B?VFFBa2orWnVOWFpyelQwK3g0cE0xb1pmNnFqVFpkSnBvc3YrZmdCWCtTbm01?=
 =?utf-8?B?aWlHRnpUalIrYXNjYTFlLzRYcnE0dHpUYlYxUkFvcHUvSEM0NFNKVEFVK3hE?=
 =?utf-8?B?cEVyWWFuS2JvRVRvek5lSWNPOWdvZFVCSHJBVVhQanpyWE44UVpSc1JTZEZy?=
 =?utf-8?B?Q1pKRXFVWHJMcHJDcXJwTFdxQ2NSV2hTbjl4MEtqWGlmSCtEajR3eE9yNWRO?=
 =?utf-8?B?MEpnOHFZQm9KV2kvNmdnMWUxVnEvRzUzNC9WK2pKcFlkVHpwTTdzTzkxc2E0?=
 =?utf-8?B?RlFDMG5OSnZ4Y0xFSkFEU2E1amVvOTFNaTZTbnpxTU5KUFQzeTFoTUlVUFFT?=
 =?utf-8?B?dm9NcUNmTklrRW9tQ25lT1VIeStUSnUwdG5yTkwvM3FXN2Z3bm5FaTJ1NjlN?=
 =?utf-8?B?a0J3NWVjbUtGc0liY3EyN2F0REVFL2NvQTJjYkRoRmMxQ1hyZDhtMVAwaFNR?=
 =?utf-8?B?RGNlS2tLT0RNN0lHcWIwNEVuUUV1dUtXNmFseXhUWXRBbGgvMjRJRFRqdkVK?=
 =?utf-8?B?NlczUDJYSi8rRitVZ1I1VUxFT01xYUFtb0FlQVdrN1BScFIyUjBDazRGSDhZ?=
 =?utf-8?B?TEl6T3lOVmJRazZPYXFBSzBaalJqZC9lZHkxSExIL1NyMGtJbk1WV0dmbGx5?=
 =?utf-8?B?RUgwcndpTVFCTmg1ZGhHeEtlNmJmQUI5WUJtVndKakhBMHhXNU5tQWlybHNC?=
 =?utf-8?B?U1ZXWUNLQ0hZNzI2SVFtRWpTRi9iUUQza3M4SzZyTzNrQ0h4TnM0SStMZVZx?=
 =?utf-8?B?TE9WQjd2ZlJJQ210KzhOOFhiS0dhYmwwUC94V0xLZER3cCtMeS9yQ3J5N1o5?=
 =?utf-8?B?SEorTjczRmxQRzI3cGhkc1ZMMHhTeFl1YUhib1ZBRHpQbUlERDFXOG51RVpk?=
 =?utf-8?B?akNJTXhiU2pxT1hzb3NmOWVPQ2pkRmJtQjN0b2pMYlRKSXF4aE9vUHZOOGVG?=
 =?utf-8?B?a2VBOHdqb0lENEwrc1pmdWU0Q29tUWwxYVk2Q09XSE94NWkxMkZ6bGF1WU1z?=
 =?utf-8?B?VEtWUHdTR2NYcXlJdmNneXVVUVdOQW9Dd29iRCtGMUhVbC80Wjg2OTh3MTRK?=
 =?utf-8?B?dUE5RmozUTdveDMxdUUrN0NhMlphSHlJWGlvcnRiSVhGRGM4dFNlUnQrV09H?=
 =?utf-8?B?ZTVQY2pHYXczWXoyQUsvVHFWV0pRZXF4R2pOZlVKNys0OWlsTjhOTUZlRW1l?=
 =?utf-8?B?emlkYnExZ0l0b0FESkNxYnlSWDB2elpaT0Z6a1RrMkNFWVdtZkRzWFZVK3Bo?=
 =?utf-8?B?cytpRVV5dlBSUThkaEkwbkQ3K0lBcDR0WTZESDhrZWg0S1JxMUFuUmNpb3Ew?=
 =?utf-8?B?QXFPZkZ4dEd2c2g2VDFDOUJQSHhuNXU3UWZRMnZnMk5PZ2F2a2lOeHRpdUwz?=
 =?utf-8?B?ZnJ1aTRsWG5vYlUyU3hnR0tJTS9kVWFVblpKU1hSSVVlZjFTUElRUXE0WHh4?=
 =?utf-8?B?TVlQUThEcGFBY2g2d092cyt5MndGckxLTXJoc05WUm0vOE52emdpbWZSeHlU?=
 =?utf-8?Q?9u1lgYL8U/s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjRwL1Y3RG9nVVEzTXZVVHJjWGMyN0RIaHJLaFhTSDdiRnBORzBydGY1dW5F?=
 =?utf-8?B?UmhsalFzRDRPTTg1ZnNTZnhPZDFMRGk5V2ZIT2FQblFJM2Y2OXppY3ozZ21D?=
 =?utf-8?B?cWtQekhkaEI1RjJ1RHo4dWZrelVFdEtRSFl5d2pPNU9tSTZ5TmRqbWUwWlYv?=
 =?utf-8?B?M216Q0ZkVFhGOFZweS9yRG1rYVlXdW1lN3BqdVBPYU1IRXM4YU9vTzhYdFlM?=
 =?utf-8?B?ZURlckROSlRmVUppNE9NczFpc2NVV0FwU245L25XcWVUR1dTSkhyQlM2TDlU?=
 =?utf-8?B?WEpVWTJoY0t5QWpXNS94TWw3dldJNkUwS1NRNDlRbHhnQmNoVUNMRUVIbGMv?=
 =?utf-8?B?QTRWNG1rbTJFWnVwdmtRc3B4S3RyQ0p6OFVyRnFJMzJtZ3doU0wxVnBISzhw?=
 =?utf-8?B?T21jK21Nc0xrSWh4MEZ0Y21jOTQvU3BwVEtLYkhzdzJnWERLSXh0WXNhM2xV?=
 =?utf-8?B?V1Q5Wm9GRFYxLzNVZ2RWYStkT042M3dERUNTMmxzV1JGOTZ5aWZoQXFkZlNV?=
 =?utf-8?B?OFNQNHgzNFpxVkJhYit3ZGhWdW5hR2FIcC9RcFZPZTB1bWxpN0dHZC83T2cv?=
 =?utf-8?B?RkVKQTNBZGdDemcwLzJVc1dXU0w3aWdBSlF3U3V2YzFwZUhpTmFiUUlQZE9m?=
 =?utf-8?B?VDd1SS80Rlpnc1l0R2F0TUJ0bjVVZVFnd3dwMnoxK09QcjY1QnVVcVl1OURB?=
 =?utf-8?B?RUp5cXVEZEluakxrcTA2SW5mTkdDV0p6RG5qTmVYakU5NUlRNmJ4dzJxOEpm?=
 =?utf-8?B?OExCYlVtcFRLUmZRWWlyalZ0VlFzbnZndWVVcTNNTHc0U0hrUDFNcXFqdWxH?=
 =?utf-8?B?M3hRaHdPT2JtNHc5K2tPdFVpdTh1QnlBUzhZM1BKUGZ3WUJIU2J3UWZKcjNK?=
 =?utf-8?B?RGVCREw2b3hpUDlLb3czdjZQaHlxaFhubG9HVyt5cXI3OEdaYU5Vd2NMU1Za?=
 =?utf-8?B?cXJlRzNNbHkvQllxSU1zZVZqcUJ3d0F3Nk1qM2ZTWitWZzJnNVErc25wQnBy?=
 =?utf-8?B?eEdwM01VTEtWOFZLOXdxMXBJd0ZmWkhXcE10K3h0Zm9MTGlsWTZueWREcWpX?=
 =?utf-8?B?MVcvbGtCM1RqSWQycjJueEdibmJaRGpGNnRRelJJcEdJRmhiUmprM29uTDVK?=
 =?utf-8?B?UjhsYW5lT3NjbU16NUs0M1E5aThmTXZtaVV3cllZNUJuakdHdys2WUhjcEJ1?=
 =?utf-8?B?djJVb2pteDBSdDV1eVBUS1pnaXY4a0dGaFcvaWlveTlkK0lnckVTUXVpVEdw?=
 =?utf-8?B?ays0RXhDZnFqL3FubWJHbkZYcC81dUFsZ0dTOHNiS3J1N0NTYXkweTRla203?=
 =?utf-8?B?SHJaN1RETlFoSmR4UXdoWXVIV3grVjF0elh5VUFRblBZVkpBcXl4djk1bWhh?=
 =?utf-8?B?d29TeFo3VnVHcEZCTEI5aVFnQ05GamZsRG5wdXIyS1ArTHRrbDZkRFBaYkts?=
 =?utf-8?B?SmxTcTNrOWl2eGNSVGd4bjlMblhSajBGaU5MdzBadFFsV2wyYjA4cWx6V3Zq?=
 =?utf-8?B?Q2U5cW0wVUpacDRYWUVyZlV4NEdwVzZhanRMQ0hHWVhIZldQMFd4Q3pPVWdS?=
 =?utf-8?B?bUgrQVJvV3o4WmpLMVhyU0xNT3lPR0lGRGlReGEyNkhZeks1OHZ3OTRVYS9u?=
 =?utf-8?B?c2JHSVFtOXVEaFphczNvWE1TSTRYaU9sL05ubTJkUWlqVGRocDc4RXNzOFFU?=
 =?utf-8?B?THlIN09BTUFvd0R0Q2dGRUk1Y2owOGVCTGdtd2UwQjBBK3hlZWpoY1YxN0Jy?=
 =?utf-8?B?VDl4UW9EUGpBMDFZRytucHp2alBpS25lMVJHcnNDMjkzVm9KUEo0eXoxUFE5?=
 =?utf-8?B?a3N1TFViSlg5RVVHbG1IaTNJUm1LL0NCRExnSVVleGNhSzRLTHN5NXgrUFdx?=
 =?utf-8?B?V2NIdnhQRVV4czlobkovZ09yT2hmdis4TmxEUTJpQTNyUFBGQ0lHMURONDJK?=
 =?utf-8?B?cnBZVFFRb2QzVEl4YW1EUHhQdnprMXN4RlF5WVNFZXd1eHFmaTV3Tmsrc3pZ?=
 =?utf-8?B?M2Z6RVVkUk1VMVZXdVU1WEprTU5tK0RIZUJVdXVPS2Z6ellMcWwzQzg0Zm9i?=
 =?utf-8?B?MjJXTHhaQjlVTURyT28yamRpQ0JZVjJ6a0NrcXRzY3lOZU40K29GM2JSQ2pk?=
 =?utf-8?Q?/khhsa7IHSH3fhuBjvro8BDij?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e30659-a775-4388-787c-08dd9d1061b5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 11:19:44.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJTXzBrT5GvPTe6CYDw//y64x5NR8blmXAAX1PBeOo8T7CNohO+XNrdMnvpe461VsoBnrPIVp4P7s4z9K0jVHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6080

Hello Aaron,

On 5/27/2025 12:28 PM, Aaron Lu wrote:
> On Mon, May 26, 2025 at 07:36:50PM +0800, Aaron Lu wrote:
>> On Fri, May 23, 2025 at 04:59:42PM +0200, Peter Zijlstra wrote:
>>> On Thu, May 22, 2025 at 08:49:43PM +0800, Aaron Lu wrote:
>>>> On Thu, May 22, 2025 at 02:03:36PM +0200, Peter Zijlstra wrote:
>>>
>>>>> This is asymmetric -- dequeue removes it from that throttle list, but
>>>>> the corresponding enqueue will not add it back, what gives?
>>>>>
>>>>> Because now we have:
>>>>>
>>>>>   p->on_rq=1
>>>>>   p->throttle_node on list
>>>>>
>>>>> move_queued_task()
>>>>>    deactivate_task()
>>>>>      dequeue_task_fair()
>>>>>        list_del_init(throttle_node)
>>>>>      p->on_rq = 2
>>>>>
>>>>>    activate_task()
>>>>>      enqueue_task_fair()
>>>>>        // nothing special, makes the thing runnable
>>>>>      p->on_rq = 1;
>>>>>
>>>>> and we exit with a task that is on-rq and not throttled ?!?
>>>>>
>>>>> Why is this? Are we relying on pick_task_fair() to dequeue it again and
>>>>> fix up our inconsistencies? If so, that had better have a comment on.
>>>>
>>>> Correct.
>>>
>>> But would it not be better to have enqueue bail when we're trying to
>>> enqueue an already throttled task into a throttled cfs_rq?
>>>
>>> It seems a waste to do the actual enqueue, pick, dequeue when we
>>> could've just avoided all that.
>>>
>>
>> The original idea is to keep code simple but surely this can be
>> optimized. I'm working on it and will paste diff here once I get it
>> work.
>>
> 
> I tried below diff on top of this series:
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 055f3782eeaee..1c5d7c4ff6652 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -882,6 +882,7 @@ struct task_struct {
>   #ifdef CONFIG_CFS_BANDWIDTH
>   	struct callback_head		sched_throttle_work;
>   	struct list_head		throttle_node;
> +	bool				throttled;
>   #endif
>   #endif
>   
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 89afa472299b7..c585a12f2c753 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -5798,7 +5798,7 @@ static inline int throttled_hierarchy(struct cfs_rq *cfs_rq)
>   
>   static inline bool task_is_throttled(struct task_struct *p)
>   {
> -	return !list_empty(&p->throttle_node);
> +	return p->throttled;
>   }
>   
>   static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags);
> @@ -5842,6 +5842,7 @@ static void throttle_cfs_rq_work(struct callback_head *work)
>   		 * mistakenly regard this task as an already throttled one.
>   		 */
>   		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
> +		p->throttled = true;
>   		resched_curr(rq);
>   	}

Since we now have an official per-task throttle indicator, what are your
thoughts on reusing "p->se.group_node" for throttled_limbo_list?

Something like this lightly tested diff based on your suggestion:

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 11eb0612e22d..f9fdcf812e81 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -578,6 +578,9 @@ struct sched_entity {
  	unsigned char			sched_delayed;
  	unsigned char			rel_deadline;
  	unsigned char			custom_slice;
+#ifdef CONFIG_CFS_BANDWIDTH
+	unsigned char			sched_throttled;
+#endif
  					/* hole */
  
  	u64				exec_start;
@@ -881,7 +884,6 @@ struct task_struct {
  	struct task_group		*sched_task_group;
  #ifdef CONFIG_CFS_BANDWIDTH
  	struct callback_head		sched_throttle_work;
-	struct list_head		throttle_node;
  #endif
  #endif
  
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 25e794ea0283..b1cb05baf8d4 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5798,7 +5798,7 @@ static inline int throttled_hierarchy(struct cfs_rq *cfs_rq)
  
  static inline bool task_is_throttled(struct task_struct *p)
  {
-	return !list_empty(&p->throttle_node);
+	return !!p->se.sched_throttled;
  }
  
  static bool dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags);
@@ -5835,13 +5835,14 @@ static void throttle_cfs_rq_work(struct callback_head *work)
  			return;
  		rq = scope.rq;
  		update_rq_clock(rq);
-		WARN_ON_ONCE(!list_empty(&p->throttle_node));
+		WARN_ON_ONCE(p->se.sched_throttled);
  		dequeue_task_fair(rq, p, DEQUEUE_SLEEP | DEQUEUE_THROTTLE);
  		/*
-		 * Must not add it to limbo list before dequeue or dequeue will
+		 * Must not mark throttled before dequeue or dequeue will
  		 * mistakenly regard this task as an already throttled one.
  		 */
-		list_add(&p->throttle_node, &cfs_rq->throttled_limbo_list);
+		p->se.sched_throttled = 1;
+		list_add(&p->se.group_node, &cfs_rq->throttled_limbo_list);
  		resched_curr(rq);
  	}
  
@@ -5853,7 +5854,6 @@ void init_cfs_throttle_work(struct task_struct *p)
  	init_task_work(&p->sched_throttle_work, throttle_cfs_rq_work);
  	/* Protect against double add, see throttle_cfs_rq() and throttle_cfs_rq_work() */
  	p->sched_throttle_work.next = &p->sched_throttle_work;
-	INIT_LIST_HEAD(&p->throttle_node);
  }
  
  static void dequeue_throttled_task(struct task_struct *p, int flags)
@@ -5864,10 +5864,26 @@ static void dequeue_throttled_task(struct task_struct *p, int flags)
  	 * task affinity change, task group change, task sched class
  	 * change etc.
  	 */
-	WARN_ON_ONCE(p->se.on_rq);
+	WARN_ON_ONCE(!p->se.sched_throttled);
  	WARN_ON_ONCE(flags & DEQUEUE_SLEEP);
  
-	list_del_init(&p->throttle_node);
+	list_del_init(&p->se.group_node);
+}
+
+/* return true to skip actual enqueue */
+static bool enqueue_throttled_task(struct task_struct *p)
+{
+	struct cfs_rq *cfs_rq = cfs_rq_of(&p->se);
+
+	if (throttled_hierarchy(cfs_rq)) {
+		/* throttled task move across task groups/rqs. */
+		list_add(&p->se.group_node, &cfs_rq->throttled_limbo_list);
+		return true;
+	}
+
+	/* unthrottle */
+	p->se.sched_throttled = 0;
+	return false;
  }
  
  static void enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags);
@@ -5896,8 +5912,11 @@ static int tg_unthrottle_up(struct task_group *tg, void *data)
  	}
  
  	/* Re-enqueue the tasks that have been throttled at this level. */
-	list_for_each_entry_safe(p, tmp, &cfs_rq->throttled_limbo_list, throttle_node) {
-		list_del_init(&p->throttle_node);
+	list_for_each_entry_safe(p, tmp, &cfs_rq->throttled_limbo_list, se.group_node) {
+		WARN_ON_ONCE(!p->se.sched_throttled);
+
+		p->se.sched_throttled = 0;
+		list_del_init(&p->se.group_node);
  		enqueue_task_fair(rq_of(cfs_rq), p, ENQUEUE_WAKEUP);
  	}
  
@@ -6714,6 +6733,7 @@ static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq) {}
  static void task_throttle_setup_work(struct task_struct *p) {}
  static bool task_is_throttled(struct task_struct *p) { return false; }
  static void dequeue_throttled_task(struct task_struct *p, int flags) {}
+static bool enqueue_throttled_task(struct task_struct *p) { return false; }
  static void record_throttle_clock(struct cfs_rq *cfs_rq) {}
  
  static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
@@ -6907,6 +6927,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  	int rq_h_nr_queued = rq->cfs.h_nr_queued;
  	u64 slice = 0;
  
+	if (unlikely(task_is_throttled(p) && enqueue_throttled_task(p)))
+		return;
+
  	/*
  	 * The code below (indirectly) updates schedutil which looks at
  	 * the cfs_rq utilization to select a frequency.
@@ -13244,7 +13267,7 @@ static void __set_next_task_fair(struct rq *rq, struct task_struct *p, bool firs
  	struct sched_entity *se = &p->se;
  
  #ifdef CONFIG_SMP
-	if (task_on_rq_queued(p)) {
+	if (task_on_rq_queued(p) && !task_is_throttled(p)) {
  		/*
  		 * Move the next running task to the front of the list, so our
  		 * cfs_tasks list becomes MRU one.


-- 
Thanks and Regards,
Prateek

