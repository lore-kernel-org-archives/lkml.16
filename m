Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9115A79B;
	Mon, 14 Apr 2025 15:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646249; cv=fail; b=ZeMVmEN0JVHsn+/HCXEXBcRWvsDA8KJz/CmTsdlAWk1UUqbEWxaOyBqxQDS5MhXz/R5HAt9AtyJuoDFuPViAfRzjr4RlLs8kj11xGWd/fDbHd8iB2sqBXBzmD6PhVvsQM7dZbtNK+wyZUr/A/PPLxy2c3gvVGE69wBnVFYMU2QU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646249; c=relaxed/simple;
	bh=T/CUdrlGvNtsOBLQ7SWnWQ/Tz45ubK0SnWrV0mQ/Y54=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mhNS7JRWm0IOzhNRqlIo9l4XNgUPmnlbvUIYuOLZfKgoByQV5cUKsVCc6xIho7coNuoteeoeduYEwdyiZYtd0CCdrgwYnvdQrBNWb0NZS7j9Z1eT9OsO1vyXvYguW40RnYBrEr/Dytbucv4Oyt9QVODs1XmCqc2zSSO0+G57PHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mYTNREbm; arc=fail smtp.client-ip=40.107.93.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mYTNREbm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVPyIRHOCz1fIzdbAHJrx0DZbMtIr1rHHaRKGmyuXAimQor1tDBfS4GCkzF4wTO7AB1cTgyUN7jKa2/Rda/FnBcfJHLDT+IqXdfikbRrmyt0fTtqCslKv4GxRa1qLCsUYk4ITJD61NlQZUqT+5UA8T33RWRbruREaUOjWe1oVqGiTOONRLRXIp9WqseTU0Il5YGLjO2Dizysw1DIAHmuwVQuETzamDrrnQSq2lvfTV88UX7XHAcoQ1s7BGpk+BzuvaRbLbavckbzT0m52NGwYK7DYFcZeHwcLJfZIWQ3ZE82oHjRZayVniy7+J8CBH1ouwpQdKvsenbPcuOly4TJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqzgLNskw5/TQ0npLnGLN+HIExK9LV+a9VZr5+/tVuo=;
 b=WwBWmGVUg+T9f/t8z8DG7eNwWfhkvtlAijSLpJJHCni1+/QAbqzGG1SFb2g3yHudrtbt3NKYS59A6+PMGHwdCMbboj0pKDHAIAEM5TZaVZiNU5afArIHn2jk/WqHEsQN84OvftCNMDfuALPlx5KvwwKzZfZxps0+EvDq6uQdhHCNIALKztDtIEkyIZS+ezhCPfv17fy/ay25growscH263NcIsKDxmOnpQx2U4xkCkePo7Y1BNDLp6/l1r9pJHBk/q2FFkk0sw5OUCoGPLXS8NZKuQjDBbSeRRksnRl2QURfRBFKqbPpXz6TcPPY2vbG6+5RJK3zL851p/JZPu6M6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqzgLNskw5/TQ0npLnGLN+HIExK9LV+a9VZr5+/tVuo=;
 b=mYTNREbmZrKk9NaUYdFHdMIWr2BJLEPHp0P5jAvGVcnwy5TqnMFKhyNruSDvxe5S6v+iQgvs0FUKOcfyTBHW7PBZ7oAlvLFEn7KZn1ae1xelWYUmaFV9IF/HcCmA5NPDq/qXXqFST7S2eOzTgoUOOKO88BkCWFHPPAAx/NvkFcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH1PR12MB9647.namprd12.prod.outlook.com (2603:10b6:610:2b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Mon, 14 Apr
 2025 15:57:25 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 15:57:25 +0000
Message-ID: <a1211845-a50a-4a52-b8e6-d124ba983fb3@amd.com>
Date: Mon, 14 Apr 2025 10:57:20 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v12 02/26] x86/resctrl: Remove MSR reading of event
 configuration value
Reply-To: babu.moger@amd.com
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <4f1551b39f669be01ea3e5938f165d207e2f7c6a.1743725907.git.babu.moger@amd.com>
 <6be16f07-c066-4076-8ad8-3eefc45c48f7@intel.com>
Content-Language: en-US
In-Reply-To: <6be16f07-c066-4076-8ad8-3eefc45c48f7@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:806:f2::35) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH1PR12MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb14d88-f0c1-4644-0ab7-08dd7b6d0cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djZQTkplTTJkdVc5WkFkTi91MmZzbUVVcmNEYlRJZll6SUdRMVN2ajRYZytC?=
 =?utf-8?B?Y3p2S1dyb3IyZHdobWRuM0g1c2lCOVd1WXVHV1RyL2tvREVqaXJPdU41M0NO?=
 =?utf-8?B?R2piYmRtK2hBeXZVR293bXBaTXQ4WDJMaDRGcUlYNDNwWWJsYW9zaDRCbW1w?=
 =?utf-8?B?NG14ZC9scmZYSmZhNnArcXNvNGpYRDQ5eWdXR0dPVlRIajRsQzFvcW9FRklC?=
 =?utf-8?B?YWk4YnorY0lJSHhMS1p5WXhpYWRJLzNpckJMNndhS3FnV0s5RDRSaWliWHhV?=
 =?utf-8?B?RkU1Q0hTYlJtZGs4eWxEWWdwakxmNEQxMVcwWGJDWlM1eDZORTNaQXd2QnJh?=
 =?utf-8?B?b1hzV2dQWFFrR25pV2E0QVNhMG5iZXhwRzBxbndNTEtLVUNIN0JNaFAzaURw?=
 =?utf-8?B?TCtJbnJGK1ZHaDExdTdoTWNJN213anl1ZEtkczBWQlE3Q2dlbG5LYVNDWWF0?=
 =?utf-8?B?VHhYUndKSnU4cHJXR0MySnRmTnNHd3QvZEZyNmRjMTU1WktwSyt2U1V2aUFl?=
 =?utf-8?B?L09JSkc5Z3c4VjVJRDJMZVV0R250VGMzM1FteDAzRm5Qdm1CVTF5Q2pjMjBt?=
 =?utf-8?B?T1JVV1dvR2oxbFF6T1RUK09WbTdUdW9jRFNPNDRsNURrL0RwcWh3bExleFd1?=
 =?utf-8?B?NjBOWi9BaFVRK2lIbWtnTHhpa1l5NDBKdmdHSGVuZWsyemcxWEFjMEJ3ZUVX?=
 =?utf-8?B?TVZKdjhzOFlnYURnd0FJVUJOdnpGak5sWnFHcGlGTnFySEdDUzJxQ1RFcUVN?=
 =?utf-8?B?aEwzQmRVWEV0NHdxaEhJN2ppclVncG5BRnUya3lsdC9ndXZOQmhGZ01CejJX?=
 =?utf-8?B?Qi9YVDNTRXZjT1ZXMW1IVlFjbEs5bmJTYXI2Y0t3eFFBZTRzdi9HVWJXRlAr?=
 =?utf-8?B?WTUvMGxIYmNTUzErbDN3ZTh1L3JlVVlRWE5teXBjenNyMGpWL2ZmNURNb0Vo?=
 =?utf-8?B?VW9HMkJCK1o4R3kzQk5IV1VoN2ZaaDk5S3Znb1QyaDhRSXY1dWJUcVhTWlhT?=
 =?utf-8?B?QXZiZWh2emZKc1RsWERNSSthcWZ3TERyd29iWkJiTURnUXg3YTZmNEc5ZU1H?=
 =?utf-8?B?QWh2bnlvU2RBWk11NEZXblN1bjBJaXFSQXFqR21pMzZrUHQyNFhyS3I2TDh1?=
 =?utf-8?B?UkFMdGNaZnFOVlV4QjEyZnpNY3ZoNXhaYjhMSDRqa2FSOHp5SjRCemtYMkhq?=
 =?utf-8?B?VlhzLzR1d2hNSVE2UHg4U2hGYVhUbHMwNEVIZDJCLzE1UEl2U0NYdWxQdWdI?=
 =?utf-8?B?Wk51SlE3WTBwbnZyU05zd2krVCt6TVNuRk1aSzRsUjIySElmRTNiNHRINkFy?=
 =?utf-8?B?ZjRIWWhEWU9Ed2NVS2xZZlJxRGpORk9aZ2JlUDJPaXlKdGIrb1BtcnljRGxk?=
 =?utf-8?B?OGN5UlJDMU9MMnRGRGZsVlRGMmd2alFxYmdjUjMzbjdxY1gxVktUbUorNjNs?=
 =?utf-8?B?ZzZ0eC9pMldIbjdnLzVpYkUwOE9KMERFQ0hZWGNvbDVleDdvZjZKUUROclEw?=
 =?utf-8?B?dDIrSkgxRHNMSStsbktzUEFaTnM4S1ZOMmxUemNuNHZRa1JSbHRkcStjT1hY?=
 =?utf-8?B?QmhIb3Y2aG9PaTRQeFN4WGVSbmd2VS9YYXZVcFF5RmxDb2VSWENIT2g5Rklh?=
 =?utf-8?B?M3IrU2F2NHljRm1wY3V5T3dtZ3hLNVlSL2U2V0UxTEJEMG5JYVAyOFBUaUVq?=
 =?utf-8?B?ZElJZGpuMU1HdVBMZGY0dXNqaUMxR3l6OTFoc0xqaFV5SVhhSkZ1Q2lZNG5H?=
 =?utf-8?B?VC8xSUpJWHhhREM4eGF3UmxacFVjRVVHSEsxeS95MGR0OHdCWUhGRnM1T042?=
 =?utf-8?B?RFg2cFlSV3FPSHRKSnpqMXNSMFk2VDM4cWF5VFJ6Y3lkd2dIVFpSZ2VTZDZR?=
 =?utf-8?B?OE4xOFdDdUI2TW5DQVJnM0lRcEs4cHFtaUJrc2psYnZnUzVYclQwQUtVUENU?=
 =?utf-8?Q?ivBptKA8kpk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGQzeTBHUkZRQWcxQ1prOHlkVlByaVVzcmgreG9TdjlGRzMrZkhEek1nWVM4?=
 =?utf-8?B?aEs0YUZOcyt3R3NLU2tFMXNpNnN2eHpMWVBtRjE5UkY4Z3NORmcxWHdCdUQ4?=
 =?utf-8?B?UWVlSGhKRzdhOW9VYUd2Zm9DcHZYUTdCZ1ZUNDJCaVdpZW85UkJJdHZtWndz?=
 =?utf-8?B?NVdJZy9pa2p5Sk5PTHg4Q2tzYjZOVlY1Z0l6WUNoeHBrTFAxcGRNTnJWUVBZ?=
 =?utf-8?B?TUxPYkhSZjc3em51NW1XeHV5amJmQUFDUzJvL0dmMU9obXpqeWJGK2lMZWZG?=
 =?utf-8?B?Y00rcE9WK3E1dWdGQmJiQ1NPaW9md3JpWmF3UXVUUGFzN01Pd2hVTEtTZ213?=
 =?utf-8?B?YjhkekVFUEFmK1NSQ0wvT29jdmQzK29HNXk4d0VtUWpjMFhERHpnZnpiaG5H?=
 =?utf-8?B?YWQva1JUMWhGaWdwaXBOVXpUS3o2RkVMZklnaU1OQW5PUlk0Y2lrZUZEV0Uz?=
 =?utf-8?B?UTZJRWhBU3hpWWFVaW9naFZQUiswL0FXdENRNkk3cHZxYklqT1RwZlAxM2dD?=
 =?utf-8?B?U1dRdEw5MVNzOFZYWTA2VlJwZktqOUJuR3RMUHNCZjhYMzAwTTJuV3E4Vmkz?=
 =?utf-8?B?T0tXcGdLaDMydWhzVVdoRkNtOFpMZGxZdTJaVkhzNDNsUytWd0QrYVJkTHRo?=
 =?utf-8?B?Q2lmZmQzYUlxYUQ1NlJtZFdsa1dJUUR2THIwVHVIRUhIWmxZeXVXSlkxVS9D?=
 =?utf-8?B?azB1Mno3YTVCL0NINCtjNEcydUp0RzM0UU0yd3VPU0UrWXNyNkZxRHNER29V?=
 =?utf-8?B?OFhaelA0NmQrWVc3em5NZkMxMlV5L1JaZzdGNFhKNXg5S0JGZjNrRjhUY1dS?=
 =?utf-8?B?OFI1OVZWeTVWMUVDMVgzVlFZSHV3V0dBRXpoYzZVRytiblhvL3pxOFVpMjF2?=
 =?utf-8?B?T2V4STM0aitTdmZzbk04QzMrUkNzYWx4c2Zoeks1cXA4UzJYaURmY3FIZm12?=
 =?utf-8?B?TFJFZzFDOTFhUWZmZU1vc2NET3RvQ1BxNGlXR1BWQnN1TmJGdGpzMU9sbEFR?=
 =?utf-8?B?SDYyTm9nMWtOMlh3dUJtdHQ1SURPQVEwdDVDRGFsaDJtSG1IUEllNXhwd1cv?=
 =?utf-8?B?ZGVFV1NXeUlVQmEyU2RLR05SWHYvRlZUcFFlT0V0WXN0cjJSV2lyL3R3S1Ba?=
 =?utf-8?B?SFBxS01KcXFRbi9ROXhCNmVEWE11WG1rN1Vld09lRFU5WmV6MnpSbmIzZGF6?=
 =?utf-8?B?dWtSNFE4UHdFdnNydSs1MkNMRE5wOFZCQ1VVUWFacmZRVW1zd2ZzVTV0MCtK?=
 =?utf-8?B?RlBGMlJwWnN6ZGoyMXZHTFY3LzRDS1JYVjBmWHc2eWlpM3RkUVRXVnJ5WVI4?=
 =?utf-8?B?aElVUlh2bm9UeGY2TUJMQXdHb2JqWDJxdFJDZWdVaFBRa2tmSTBPRENEcG5G?=
 =?utf-8?B?blk3R1o3RTZueVlVaXpCeUJwaTVMbGlmNmhlSFhxbnpxQVJ6emZlc1FoTzdJ?=
 =?utf-8?B?T1E1a2NSa0p4SmpQdDFRQXNLRFBUR216N3F4N0ErU05zWERXL3R0WXpmdXBO?=
 =?utf-8?B?cGdiNFd4NERxY0hva2ZyRUh4ejdTZnRmcHRSSmdTdDdFcXUwZGszMk9rT3NB?=
 =?utf-8?B?cnc4ZWVYNmEwUTExUlVzUmI1aFZ6YURBUnJwYjU1TGZ4cFFONTh4UkJsOTNT?=
 =?utf-8?B?YzFGWldIaFRUWVpiZVNiMXR0bjhJdkg5cU1mZVRwU0tvc2FkcjU2WWh1elVn?=
 =?utf-8?B?aElnbkVrY2l4cDFydkFHeXRsSGVHcHl5VzVWZW1QRkc2ekk4MS9INUhvQ0th?=
 =?utf-8?B?QzBlV0RGakQvd3hadGNuNzBvRElEU21FVVR1R1pPbVpCZ2RxL0YxNDlWV3Jz?=
 =?utf-8?B?S29xaFlRbWFwU2t1WUVrUE0yMEIxaUZWQ056NEhQWnNNZ2hraVZ4eTJJMVJX?=
 =?utf-8?B?T1ZRNFRxekplaEhKdkJVNHhCU1l5WURHUWdsVjBpbFVKd1FSMjRFL3IrWGlx?=
 =?utf-8?B?RHBJNlgySlpjTEhndTM0c1R0azZuUk50WHVuMHFGaFpLRExHcHJFL1JpVVY2?=
 =?utf-8?B?SytoVkk4dmNOZ0MvemxDUC9yQjJsVDhLenpXdmFmUkFtRlNlQk00MXhQNlp6?=
 =?utf-8?B?YUhUbXJ3dHNheXhwZkR5TGV0Y0ozU3ZNUVkvQUllTDMrblhjb3NoMWtXQjd5?=
 =?utf-8?Q?hhp8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb14d88-f0c1-4644-0ab7-08dd7b6d0cf8
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:57:25.7774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hobQ4tg6PEQqOclccIZLOg8WtlAwpHG0LrRiN9J+yy9p7XvOwd48Limw0q7ub4tm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9647

Hi Reinette,

On 4/11/25 15:50, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> The event configuration is domain specific and initialized during domain
>> initialization. The values are stored in struct rdt_hw_mon_domain.
>>
>> It is not required to read the configuration register every time user asks
>> for it. Use the value stored in struct rdt_hw_mon_domain instead.
> 
> Storing and maintaining the event configuration creates confusion with
> the new event configurations introduced in the rest of this series. I
> think that it will be simpler to keep BMEC support as-is.

That is fine with me. I will remove first two patches from this series.
There are multiple things going on with resctrl. We can do these
optimizations later.
-- 
Thanks
Babu Moger
