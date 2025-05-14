Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1161E833E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747265846; cv=fail; b=SMAvPiXs2HclPtrgrc9I0ibsp53q/Dj3OzTiYB7z99pPqh9KshA8fSloKL9IllKOKxnH8J0juK/Y3fsxaoRXkSXFARIGBC4nDBT3fD2v472v4lOSnQEJwy4yd9LvGTheHcSun0V14qrzFcLsVJjVvc3f8a4nwfksVFP5a5uC198=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747265846; c=relaxed/simple;
	bh=k3bqwPWV4OMYuHzQBSb5mTQoRMtdtuwsWbeh0k54Ij4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cVPmAke9eBaCLlMgGosWNIHwJeN2UYi5DVZ49drXi21gWOTcgS29Iy5ciij7jc+4pGvOiwlKXPu71wi/SXeWF78ppBNeITfENhJrUPkQzGR0H5N6DwXNwTDmgjtJNO16i8ukbl3CrQTw8/6UPRLEJv1fyH7hBDvMelAUkG8FAbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MTlZU7Rp; arc=fail smtp.client-ip=40.107.243.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MTlZU7Rp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqBCu8SS2K7SyJx9pgmGucFic1OIRPuuvxtpPCrjj/UJ4MSOwFeXDuFeJskqQ6QG9eG5sQP9lGPE4Zbuj/e/1KVuef6V/xvLBWlrt0LzwqA7EPl/tCKc0C2ry9lEJOBVc9RU6KiK065HRFoBL8ahMrUa2EtLcGiuDS0vf0csb8pFq9Sxk/HJYT9IFeLnbuoFz3mCIhiTl5JR2tYTSNLZ25Cpz9BpHsv4rUjo0z6ezz2KeibDqKbWc8Rf7D16He0VU2N+6B7S6Z0ppPxnXeXNjbFWqxw82/CbQsvFF/ZjtMQ4r8OmpP5YMAGImx/MPtGBNtJ5Bfq70DUBPf5YcOrGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3bqwPWV4OMYuHzQBSb5mTQoRMtdtuwsWbeh0k54Ij4=;
 b=ATwTtTgfNyLUy4P79NLLuMrVB3CnTn921gnw5l8qcRUawDEOVLzaC9v+bGVtvztsCKrRK4Ie4yyPjNVU5q2ZQrEo1TtE1ikR0rnPmCmXIaVV74iZB5wBAjCUp91lzcxXc6hRAJrpWlvDD7F6Vc2+P3yOexUsi1iuBwQZIpJmm4j9BVLwUeIjHGpQdmdLSBfWGTqpwixDhm7kGKZ6y/P8hEgs/aE1op0oZMu0gZKMUsPlFUk2hVFnnN/K+pzepHxpgc77TC+MDYycq+c8c4rhHuk+02pjhlafWn4qIHvyHDsTYnSDM8c5IvvUEkcnaHWR8ovIFWQumeWnGVN266oMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3bqwPWV4OMYuHzQBSb5mTQoRMtdtuwsWbeh0k54Ij4=;
 b=MTlZU7RpWiDimcwDYn43O7vBfQVUtXk8A2B2uPX6aVBhxyPoMWr456vdzuyu/773vRKhmObukVYOjDQ61u0XyDmJ4CH0G9g8MHfIOIdsiQXHldCP/QaTeL2tMf2esfH+9ObcUSdv+UPZt5KYsL0EVSa5gZ6QJd+j+FwmSVAwvubhFXQwdQTosdeESdnwB8QJRHohdODFnRQW8KXgKvardmI7C3ReRE7KnbFfLD6XZ5gooBvRB8J1rkIZ/HktIfGM+DSJQDqNmbYrOvMRSTcWiHYIi12CJj1BzmyKr3nuKp5MyPnAzcUl49Yp+qU4aYEcuf/2tjgDizk0r2QavpDbPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 PH7PR12MB7332.namprd12.prod.outlook.com (2603:10b6:510:20f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.30; Wed, 14 May 2025 23:37:19 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 23:37:18 +0000
Message-ID: <a078be51-7121-4571-a5f1-41594ebfa909@nvidia.com>
Date: Wed, 14 May 2025 16:37:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/30] x86/resctrl: Check all domains are offline in
 resctrl_exit()
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-8-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-8-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:a03:255::13) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|PH7PR12MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f2aab7-c8a9-412a-1d09-08dd934043fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STh0QTQ2ZVdYVWszdFhRY0FERy9KeEhnbFR6RHdLdnhmSVAwTlFHNm5UVktB?=
 =?utf-8?B?a2VXTmRwSjdGQWZmcWcyUkFIYm9jTEdUc2l5Qy8vVzdDekx5THFQOVlwdHhz?=
 =?utf-8?B?d0xFeGFMMDk2Wi9jSVlZeDVac1FvYVBuNHF2VTg0cDgxajg0dzB3RGRVWVZa?=
 =?utf-8?B?djNnb29qdWNzWHc4ZFhmRlQ1TG04a0Z2T04yMFk0T3lnWXViak1nbGtUL21I?=
 =?utf-8?B?S05wODFYL3B2OXN3Y1N5eWZpbmtDOFdva1F2RU55T1FMQ3E0Mys0Ty9WNElr?=
 =?utf-8?B?czI2a0FOQnk1NDRXWjNmNk5BL3N5VllYNWdnN1hYOWdYY0hIYUxsTFMzd25J?=
 =?utf-8?B?YTVMay9TUEFvWVpHbTgxd21BeEswNGQ1NlpLQzJ1QnFLQms1OEw2QlJRa0do?=
 =?utf-8?B?SFg2NG5jeGJqQzljTUx1d2g5d2lDME1JRkk1SUM2cEhWUWpUMzNQTlhqNnI4?=
 =?utf-8?B?eW1US1hLRm0rMzR5bG8xNTJ5bzNjVVgvN1p5YmJ6M1RKWm1IM0VYWDhnSVVx?=
 =?utf-8?B?Y0FtVnZHYmlNaEp6T3JlejRIMnZVK09Ga3pyUWtWU3ZMWW5ZWnI2YW1Mam02?=
 =?utf-8?B?clNmQVlnTHJNRDQ1cURZeTdrK2szUG1YRUpQOVBNaDVhQzhVZWFaWmNsTHZz?=
 =?utf-8?B?QVRkMSt6KzEraEpQVnRkTUdPZkNyUktNRzJZSlBoV05XTXhodzlRNjduazhz?=
 =?utf-8?B?R1UrbVQwMHZoKzhLWllCQXFOOTV4NnBNRndzUk9QWFJyRXZpLys5Unl0TWxw?=
 =?utf-8?B?OXIwWk1sdVJ2SU5BUjhLb0tncWZya2xKQU9GdkpIV0hEZkRxdWN5MFNPVzAr?=
 =?utf-8?B?bVJaYzgyaTJRNDAvTGcwOTRnbWl2aTRnR0Z3UVRFL1MxZXg1aDRLa3MvMjVS?=
 =?utf-8?B?RDdNZk95M01iRkRSNUpPYW9WMmFnaUdiUW9ZQUtjZi9WTXBPaWMzbWh2QWtO?=
 =?utf-8?B?YnQzNWVDRk9EYjkwRWVvcC9EUGRnTGZPS3pQT29ySTRTcUlKd0o4OWhHN0FI?=
 =?utf-8?B?blVLSXZMdVFQbk9hcEM3blFSMlZMQ0U0YkMxVHMzU0MzNEFtYUw5aUVTNW1O?=
 =?utf-8?B?VkpJUGdTcUhMd1UrWEF1dFdOaGVZaU1DdHZLM2lnYVBoNVk5ZUw1WE9UZDc2?=
 =?utf-8?B?QWROYlBpNU9yQ3N1cWs2SEtZVzQyclhQRTg3NCtORS8wa2tyallTbElXZUYz?=
 =?utf-8?B?SWpSbTBCMnpJazdrWW54NjJnY3hRMGdpT3JoOWVUYVpkK3o1Y1Y0ajJnQnor?=
 =?utf-8?B?VGl6Qk1vQ24vSFluZVNXV01zWVZnRzZRaVovaXNBcWEwelJSU1R6eFZUU3d6?=
 =?utf-8?B?NGFYaXlaZGZPbjhDUC9Tcy9Xd1F6NEhFZHdVcWVRN3U4citnbVhrajN2aFVS?=
 =?utf-8?B?dDA0cXJXZnlsN2VCUDRGQmJmU1BOYjZVczcyR2VveW9JNVJncExEdytQQ3dt?=
 =?utf-8?B?d25hZ3hBQVVPZDBmQlZoOFg5VDJVZXhsWE9IMVpZTnM0dDNETDV4N2JmUkRH?=
 =?utf-8?B?b0JCbUY2MjBTcUtXVUlrQXZCLzdmd1ZOU0E2d0pKV2I1R2YyYklJVkhFMElv?=
 =?utf-8?B?NGVUZ2pleXVyTldHT0RTeWxuWU1DMUVCSlUxbGVKOGFGV1l5dzk3Q00reFVD?=
 =?utf-8?B?d2Q4ZUhId0FQS0YrelNaUlNiakdQV3BCV3dncEwvamE2QWdhRkZ6TEJMVU4y?=
 =?utf-8?B?YlI0VWdZUmdkTzFnMjV0ay9iT1ZBUExQQldySXRkbWYwYW9FYmo0Z2RtWEw0?=
 =?utf-8?B?b2JkR2I4T1Z4eElpZWFmWDZ4UVdiQTFMbUN2NS84azJSTWJaa3ptU2NOcndo?=
 =?utf-8?B?R2ZDS3ZCenQ0RlRjV0ZORTNsUU9PMlVKQjI5MFN2emFNc0EwMWo4K1ptdWtn?=
 =?utf-8?B?QytUM0MwZkZXdDY2VmlTdE5CNThjd0lqcURCUXc1REQ4K3dyUDZielFVS1Zt?=
 =?utf-8?Q?X2osUExcQb4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWFWWkVZa0phUGpJa0RkcWZZeFp5VTc4VUtEZ2JrRU8rdFhra1dQS3Z5cnZ1?=
 =?utf-8?B?UEVJSE4xV3NJUUJXNHpQaG1lNEd5L0NrdE4vcXRQU2ozcThmNTNQcGcxUHJR?=
 =?utf-8?B?eEFML1dqTnhtUUVkbkhsSUVndVVoNWR6RzkrVXF5K0dyMVI2cW1QQ2dZYUdU?=
 =?utf-8?B?RDRMSjhtZVI4YkhzanAyVVdwSzhTc2VBYy9lVzdCOTVzektveVZFNklCTWNC?=
 =?utf-8?B?cnlIeGVZNnRZS2M0eTV3bElYWEgxSmdPZUlZSmVwTUEydnYzbWx1RTlHUXJs?=
 =?utf-8?B?dEpEa3V0QXhKM0xYT3NlUmd6Z2RQaUhIVS9nTm01VG1FamlHVENJTzcvdElP?=
 =?utf-8?B?NEdqK0YxYThXYWtjN0EwN2FBa291TWYxNitScFlDaXZUR1hFeW5JNWNNdGRT?=
 =?utf-8?B?ZGVpTEphQzR1aW1LVGR6UWxtNXp2K291dU9sdzUxakhSdkptQUsySDBqb1NK?=
 =?utf-8?B?RmJnZUh6blo4VmJXL3NpbGtJbWJWOHFqUUovUmthQ2k0TUZNdWNPTEpMN1dN?=
 =?utf-8?B?dDhRaXVPOTVwZFh1YThkYk12cFVmenl4cEZOb2wwT1lPTlVyOUpQUXhPWW1X?=
 =?utf-8?B?L2IxZGlZdlovNDh3R3ptMWVNNXRhZE1ES3A4c3cvSlpWc3ZRazREQVNud0FD?=
 =?utf-8?B?K2RqLzZHWmVuUStWenBKZzY5QU0zaTd3K1dLWm1qVEZJa1JVd1lOVGkybHZP?=
 =?utf-8?B?Mi9YeG1NS0tIV1o0blVoVGxaa1daTk5iWXJ5ejBpQUNweGVLTzZSSXZHN0dl?=
 =?utf-8?B?SmpvK3V0dTFWbUlMbVhUVHJISmpnd1BHV2xsbFluNjFvSXlWcVl2VURCNkVB?=
 =?utf-8?B?L2RCRHNsQ1k4UXBMUVJrdUZlVEpqb2xranhJYTFPVGt3T3lxOGtpRDQ3U2tK?=
 =?utf-8?B?ekdhcks4SGxhYzd0VHhmTGFCaUhHSGZPZFFOeTBaTFpaMjNXYXFvdXdQbkpG?=
 =?utf-8?B?R01iZmh4M2NuYS9qRTRVUXhPaWE2S1ZlUEVqWDFnTEpVb2xJMjZvQmFYWEtr?=
 =?utf-8?B?bzVFbHcyaG01cWtDaVdkYVhkcS9mZ1o1cDRyWmk3VjVDN25NcnR1d1RWc1VW?=
 =?utf-8?B?MEw4enhBQm5tdy9XSDlESHJWS2FZTDUrUFZpcHRib1dJd1FNdGRzUTZzYmxQ?=
 =?utf-8?B?cjhIUjlWcWdSRFdaQWtIUHp5dFpOVEJHaWplRVMwRE9iSG9qZkZnWlUrTzY3?=
 =?utf-8?B?MTZTRFhnZjhFcjFncGhwOWlvVldPVk5uUlhoSnlIMEYvcDRpMjdoQm9ncEht?=
 =?utf-8?B?NmdCZS95RWt3bk9leHpLamhxbisxU0w3dncyOUtaUnN6VXNPbE13WFhudnhP?=
 =?utf-8?B?VmUyVFZIWmNsSEtMb0RocGVPdmNKeWY0RVBhbmNFSm1nUjFvVEN3ZzRqR2N3?=
 =?utf-8?B?TzAvWGxZUWxUZlBXQWFHMjBkb0JzWUgyL2w4Ty9iQWtqR2JibktYSGZwZ0Ru?=
 =?utf-8?B?dzdleWdKcEkvbmZ3Wm50NGFFVUN0SE1PdzI2dFpaVHhLZVFWL1lqcUltSC9N?=
 =?utf-8?B?TGtwT29VUWVCVWFrM2ZOVUt1Yko1S2tSbUpaeTE5L0wvM08yREhLYmhNUG5Y?=
 =?utf-8?B?S2RHWGhSQy9pT2RUemJTc2s4STlZN0ZoSDNYTklCbVhDRDJPWTFjKzNHM1ZK?=
 =?utf-8?B?bG1vcG5BeWtadEwvb0dyQnlPV2o4L0pQS0xGMVRmY2hySHdDTWM5eEwwdEc1?=
 =?utf-8?B?cno5a2VkR2JTNVJoQ3hMNi8yb3F0R0ZYNG52d3pQMzN2c080cThHMzZxWmRp?=
 =?utf-8?B?dEtuL2JVcU1ya0htckFtUDBvdXJiNEU3bmE4bEhhRlYvK1hWTVpUVzZLSzIw?=
 =?utf-8?B?alQ3eHhOTDBKeTVRUzVLVlpwTDVwTkd0WkF3cEF5c3JSNFBRbDMzR1V0dWln?=
 =?utf-8?B?RTRiMGl4bHJML1ovN2ZyQzQ4TCtkWEdhbjVMU0UwOTlYNzNMOUkzSkdSU2hP?=
 =?utf-8?B?SE9ZejJ1T2JicWEzd2RSMjEzT3kyZ0lubDJzM1BmTk9sdUlsblY3a0puU1Jl?=
 =?utf-8?B?R2RXaTgwbit2MGpFbGcxM3JOR2x6K1Z4cGtvdDFsRy9GVmZlV1d3VEk0alFE?=
 =?utf-8?B?czVsb0lmU1F5Q21HWXVOUW5kc1VrOXlTdUZvWEQ2ekJsRkw2NVpHczdFeWFo?=
 =?utf-8?Q?g95Z3OwREuUMZdCo1DD9gusby?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f2aab7-c8a9-412a-1d09-08dd934043fd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 23:37:18.7280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5V5iKIRHoyqUdSpPMforpge/f1JsDfqqBjUF6KRH55DAccQNvzoLvmzqnxAokW2KxqGg2o4H2YiEUVhnYQyCUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7332


On 5/13/25 10:15, James Morse wrote:
> resctrl_exit() removes things like the resctrl mount point directory
> and unregisters the filesystem prior to freeing data structures that
> were allocated during resctrl_init().
>
> This assumes that there are no online domains when resctrl_exit() is
> called. If any domain were online, the limbo or overflow handler could
> be scheduled to run.
>
> Add a check for any online control or monitor domains, and document that
> the architecture code is required to offline all monitor and control
> domains before calling resctrl_exit().
>
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Babu Moger <babu.moger@amd.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

