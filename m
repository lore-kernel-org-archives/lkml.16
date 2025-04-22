Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29718221FA7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303706; cv=fail; b=mER/34XkYuBgUOz+Vz5SFajBFHqsV++0WXpg3N4D+l7BCYLvP5mFej1LceQ4jXQxiSlXzQnpku8ryviaJic8iMWut6XekfH8ehFzIcI0rpaPgJhC+7zhKqL/6Cm2XnG/pd5BZdfKwOV3qPXJbLjMsfglebHWlPDMGmRr+XBoe54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303706; c=relaxed/simple;
	bh=WS/ZsjPA+l85d6uC4BVxmw8J9ACSQ8CFY7aUDFMVi9g=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=OSiTtH0bXkNYov1Od7nAoQBcKIGuX5kgf7zm1UocN+usN93JWrDpkSLPKkALWgElp17a3i1p+myTMMOoqOk0bUq+e4duCQV1D0kZkXnI/TEFgGN32253yCLxE1qQ3D+PR4JowehCqy6yDO5cjUZcskl0ox76yv2oY0HugkyRUz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=i5D9VtZJ; arc=fail smtp.client-ip=40.107.102.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="i5D9VtZJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEYprOTGBig8qdpzO5aPGqLGXTloovo44He1vZy2euaHl4f9HWUK2kuKLGBTBKE+M/YfmiVEvPiS72EDQjDXNqcsUrg80PjXWtVAH47/qgU5WMPkVQ3pHuKhqhAZ774PikdqQBW+W+LvgUcCvv/VnuJltUPhsI7nkOndVuY9xu4X/V43Dreh+qLPp47Fpi+4dgMGRX+yQOfENwLnEbbVmTMqyFXcLp/ykmCx5lUiwP3FL7abH9lWa3wbeM0GdC1XSBaM5C0QOW84/3AZjRMcMnP73JRFIdZNe6ow/m5sMXX2d8bZSoIYEIGf3YXvOHA7n2wQgzUSIQv4r5+4mo8jVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9qK0qcxHhgFBi4lK+7KtAnHdydmsyp3HoU+Z5LkUp4=;
 b=f3NrPIQYM2H1FZmIi3VZvJG1jTlwxr+Exp0X3Jr0YmtF3G7x7Pgr6nWwu7STeTX1tFRHS+wBsVSoHuC8Qn5FWPVHHYFVkfWPU+9mwBQHMHCd9qqcOklAb6F/JWw4TX5ZrEpihKytD7L0YBj6PNlcM+SV8SJtiCDermkgWbO6XQPNMh5WIS7jU7BoWon7aAdDSjr6Gg+3lu/sS+1FFq+xb4A1aj1VYzA+KcKzVlRvuzrQg8v4f8NeDFAWyo++Xx/ArgVQLpAw6/RX7Gx8pctLbbJIWX7JzdR7R45oLn1C5Obfq/R5I4yXB78NSiPpmdHmrOgXyBnxRyP0A4j+XVasuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9qK0qcxHhgFBi4lK+7KtAnHdydmsyp3HoU+Z5LkUp4=;
 b=i5D9VtZJOETumjVH65haqJETejB3zAO9JLMnii4sxVmDBm5Sj1G9Z3puMMaRmHQIJ/O9Mlgyzmdg8QN+WPeaWIxADn6kfAzj4tOkjYnvSwj7ns4pGh6YiLp1B9znVTNn96J7go+8E+yWNqzlzAjsQ+WfyVRXzwe75SoCD6UNtR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by IA1PR12MB7640.namprd12.prod.outlook.com (2603:10b6:208:424::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Tue, 22 Apr
 2025 06:35:01 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 06:35:01 +0000
Message-ID: <bae920c0-a0ff-4d85-a37a-6b8518c0ac41@amd.com>
Date: Tue, 22 Apr 2025 12:04:53 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
Subject: AMD GPU driver load hitting BUG_ON in sync_global_pgds_l5()
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, luto@kernel.org,
 peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, nikunj@amd.com,
 Balbir Singh <balbirs@nvidia.com>, kees@kernel.org, alexander.deucher@amd.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0056.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::14) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|IA1PR12MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: e1ad8723-d832-4963-ec2f-08dd8167cefb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzBhTUdnMC84MkRTbHpmdnJvQ3E5NlcxcndjOU4rZmZ3T2tzZ0xYVXQ3bFVr?=
 =?utf-8?B?c1AyZDFuVEhFT01TbUNJbzZhZ1h5dVh5UXU3dzRHd3FrdnYrTmpyNG5ZL3lH?=
 =?utf-8?B?VG9XQnIxNjhpZUhXSU9kV042aGx5MDA2T0pqNDZpSWFOTys2eWwzdCtPZVQ3?=
 =?utf-8?B?ZG5FT1FuYnNva1QzOG1sa09RZHZXNDlBM2F4THV3VkJCKzNraGlkTVZHRXpl?=
 =?utf-8?B?NC9RNThkM1RUMXEycXMrWFJlNjRIaURmMVhZY1V4RS92bGRpYnpubzNCbk9U?=
 =?utf-8?B?V2pVMlorWGN5Yndod0NMcHN1c21GK0NxOWJlTVlIZDBwdzVIV1RnVW81VGEr?=
 =?utf-8?B?cUxIZHd1T2ZHam5GMXN1bXVIbE44TnZpZW5XQzRjbVdNRmd4ZVl3S25DQmgr?=
 =?utf-8?B?encrc25XKzdXS1kzN21PQWlUbDV1YlowUWVYYnR1MFRsK0hGZjNuWnhkZlRr?=
 =?utf-8?B?SjBSNFc0WStVN0tPZWpsRXR0MU56VkFtVVVGempUTFlaUFdzSHJZRi9BZVhn?=
 =?utf-8?B?MTlINkdXU0xsRFJ6SkhwT2Y5NGcxNW94RHRlMDlnb2hZUmw0VVRsanJYRGZY?=
 =?utf-8?B?WFc4VHNKU0xER2luYWtFNGl1UzhlTUNDNVdGbytBdXFTTnN6NHJjNVBVdjkr?=
 =?utf-8?B?c3gvaTluV0lKdHp1M0RRT2RhWFg1NVdDL1p2Tnc1UEhFQTBDVmxQb2hZZXdM?=
 =?utf-8?B?VzUxRTZlVEdWb1Q2dUdLOWtIbTY0bnR6cHpxUDgyOXFRWTYzc2JsZXB2dDR0?=
 =?utf-8?B?QkExcU9Xb1lSUVlOdVpaeVZDblFZSm9vckJTRU5oaUtEN0RIWUdyVFROZlBV?=
 =?utf-8?B?S29GbVQrSDVIRmNtTUd1WXQwWnQrYnBYVHNXcFpEM1p2SmpSWWZkazhsWU5z?=
 =?utf-8?B?dEJJSVFWaFlSMVJPVTk4Q1V1ejZWYnBuK3lVc1o2NDBib2dOaVNpTEI4Skll?=
 =?utf-8?B?enBQOTU4akhTSjh1a3IySmNNeGs1REpEWGtsTVBNMnJHbm80VUgxZVUxdDZF?=
 =?utf-8?B?Q3RKU3RicnE2bGlqMDBhcUczZWI4bU1NaitucDY3WkFWYVVJTHhINmxDNlFU?=
 =?utf-8?B?N0dvelNZU1pGcmhGY202dEV6ZUUxbCt2L096VEpQek1LTFpGclhSdlRDbmdl?=
 =?utf-8?B?V3E2YlliaVFtcGJ4Q0xCdWFjZmdZZmkyL1BKbW0vbExIWnZxeWxEQ1NKNURM?=
 =?utf-8?B?OTkySmlVZUNQby9Wck5kYjZrMjdLUUdVZU5hckF5TUNhSXEzR3RHcWppdnBs?=
 =?utf-8?B?WkpYTGNsb3RlSTUxTHI4YS82VndsVFVNa3lEWmltdmxNVS84TG9rclN3MUc3?=
 =?utf-8?B?YWplMWlieHBYM2lUM2FvR2M1K1hMVzBqbitmZGlQVjdZajdsZnRDaTdNTmtD?=
 =?utf-8?B?QkkyTHNZQWNXZHVwWWZUKzB1VlRUYitpc1l2Rm9sbHRxbER5NWpGM3I5Rnls?=
 =?utf-8?B?SGpVR3YvVnhVUloyNjJnUC83K2NLcjhEWWVMYmc4NXhRaHo3OUtDZzQydGds?=
 =?utf-8?B?N2hBNVFaVmk0d05rVmRIMDZPYURVYlNVRHpoZ3ExRDlKOXE4cndybkJqODY0?=
 =?utf-8?B?TVk0WWtrVGdRQURJaUZLM3RJdnJWcTduWEUyK1BPb2tJUjV4U2xvbjU4LytD?=
 =?utf-8?B?SU8xYjMzc2dHc0FxRGpmY3dQY2dybmliODVBOGdzREJPSzROZjJ6WW4wNTZJ?=
 =?utf-8?B?NFBXQTM2S1BUdTNoeXl6eTNzTTNveEVudzZneDRlREhETU1RMGUvVHpqanVB?=
 =?utf-8?B?dFdiaG5jaTQ3ZGNCTXM2QzlaMWszWGw3V2pPUS9FeUVDdC82OTR2QTNsTkxh?=
 =?utf-8?B?VDU0UGN1SjdWNEo4OFduVHdZNENJL2xmcVBIL3J3RVpmUzdhOHlqTkQ0VEl0?=
 =?utf-8?B?TGZrUFNGVUhQM3MyUzFUTXVvSnJBNFg3RTZRN041QVdEalR4cFBMbUE4NTRC?=
 =?utf-8?Q?HkvV2jXt/XA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWtIa29oY1lwMkFnQ3lwaDM2RkJMNzJaamt3cGk5TzhXa2Q1cW9WdmsvR1VL?=
 =?utf-8?B?QlVUV2lnUWFiRTBRVFJpOVJQUDFDd3A3N1VmUno1N2ZwaFBXczhpODNiajZH?=
 =?utf-8?B?R1hiZkt6ek8zVlhqbHl6ZTlyUVh4ck9IeWl2d0FOaG15WXpCbGxLTEdZcERu?=
 =?utf-8?B?YUlzMU9heVlQMStHaW5jdW5vWC9rU2htRitQREFuRGZBQnFnQnVheGlYUjc4?=
 =?utf-8?B?S0xUZytZVTBpa1VjYkE0VDNaTjRWTS9kYno2UnNkV3QxRllWM2lQZXhQbDg4?=
 =?utf-8?B?Tk1scWxRNDcvVnhFZ2lxdDRLeXRZb2hNWldmTk1scGtON0FTbjNSakk3TmZD?=
 =?utf-8?B?amxndzBLU25zNEd6VTI4NXVZR1ozOHhzSTFwS1ZicGdDN1huZVJNYSttMzF1?=
 =?utf-8?B?MlhPTVNJblRoU3NCOHNjeHU4UVZtanFPcXpSdlI3OUgraFRBQ0k0Z1VqeWtL?=
 =?utf-8?B?a3Uwb0FXdzVWMi90S0tsc0tUcmppSUVGNEhpaHE4RE92cHV6R3ppN3JQMWIx?=
 =?utf-8?B?bHBoQnF3ajhybkc5bXJwS0ZrbCtzTkZVREZXODJ5dGxTeUVjWTE3M214amU3?=
 =?utf-8?B?WWw0SUZmRTF2M0N4aFVlektNNlRPQ3I5U25tcGdOYXhjQzY3dDZEK3BucDYz?=
 =?utf-8?B?aDF1S3Bya3BlN1VxYnh0RVE3NUhPZkU3M3BiUnFFN3RMVitlWTZjdTB3TENm?=
 =?utf-8?B?ZEw0dFhGVTY4N01kRXBJZThIVzA3aWM4MkNFQ1JzMlhTUUthbjdzY0pnU0la?=
 =?utf-8?B?RHBSeE9nQzZvMWxhdHFoVnBzeUMwR0Ftb0NSWFBZT3h3ZU14YldFbW4rdGFV?=
 =?utf-8?B?bHk4MnhweGFXY3JXZkdRQUVZeHVTRzVqZEtiYUdRVy9qVGpSS3dpNFBvUzdK?=
 =?utf-8?B?aUYwY3N2QXgzN0N5ZjR2SXprUFRpeDBGVFBYNG5MOGEvR2phUW9rRFJOVzdM?=
 =?utf-8?B?c0s2blRzU3VFOEZUYTlNVStrTFBGMUh0Ykp0cmIzYy90VHRWbFVoa0cxT1ZX?=
 =?utf-8?B?MWtwdEpHZnFkSE1XY3gvM0VKbHFhOEZ6dmVOZG5KMzJKZ2VpbFd3R2MzeXFS?=
 =?utf-8?B?MXhoLzJQS0Q0Nm5nU1JuUzdjYi9Nd3ZSdXFMc3dJdlY0YkV4dDNwNjRCeEt5?=
 =?utf-8?B?SG00S2xoZ04wMWZpbmRFU1p4eEZIekYvVVpOUHJYaTd5cmdZQUxRb0laSjRq?=
 =?utf-8?B?RlBQZDNIVndIRGREdmdReGxacDRPZXNLeTJZL243NU9QN3hkZldpRGdMZTlW?=
 =?utf-8?B?ZTZOdUlWNzMyckE0OVUvZ3lzMWY5cWxHcklNUXJMcVBuUkQwdnpoZ08yTW9V?=
 =?utf-8?B?SEs5dWpXUERRYVg2d3RGRitsbjV3blkrbzhwc3BJckdibWtsaTdVbWJWWk16?=
 =?utf-8?B?a0lpNFJmN2RnL3F0MDBnVE44aWNMWmtHbVcwUjZYRlhBdDgvWkNxendxQ05O?=
 =?utf-8?B?dzk5N0RNajhVUytxazZCeW5uZkJyazVudUU2Y1B0ZVRMc2xialhhdmpGZEx2?=
 =?utf-8?B?NThOZHpHM2xQSTQxMFh2SjFDalVZdG9OUjlmRk9SaFpNbXlMY29vY1plRjVh?=
 =?utf-8?B?NlN1USt5SVErc2RqVzIxMXVXSVRFRmFDc3VpUU8yUXlVamVXTzl1RzQ5RCtS?=
 =?utf-8?B?M1ZhWGhHaUo4ekR5QlVIWlpwWEdTN0hPQnRHVlFPOWFEa2l1K1A3dkFwdDBv?=
 =?utf-8?B?N3BDV2pXTEhoMmsyb1cwajZmVzhzQUtsbFA2bklXU3g5dHhiQ3VKVXdaTG5J?=
 =?utf-8?B?ZjhIbXFUcnpELzZuTGZYbG9HZnJlRWlwTkE3VkJmWk5ZdmFwSWdBVVFqUHdD?=
 =?utf-8?B?MmFoWExmbzdGbm9XTGVHVTRWQ1pGWmlDdnZKMzRqSzdXei92dVZVV2VRcm11?=
 =?utf-8?B?SUJnalZpUHJ6QUozb1ZsOVpNWHdHT0FkTjhMTFlTb2Z2V0RBVEZvV2pBWTV1?=
 =?utf-8?B?Tkw0ZDE5d0NJUnphbklMTGhNVnpZVUhzQ3FES21tTmJtQ2Y3a0M4R1Q0YTgy?=
 =?utf-8?B?U25VQkdFTTVqbjdJbE9NQlE2T1MyeVRDbVJ5d01YeXd5amdYSUF6VW5pS2ZY?=
 =?utf-8?B?a2xkYWozYTBMaTBBc3BEU2FqMUVmMnQyNlQzV2RpdGhoN3ptU0F0K0pvTVNr?=
 =?utf-8?Q?GiKNgBp06bWX4dq7PDY/nZdqz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ad8723-d832-4963-ec2f-08dd8167cefb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 06:35:01.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWTBH6MkZWo9QOJ6w059WCHG1lvsPRUaAKaFp1hnjo9UZRAGITo9Arkozet8Cq8vroLMd8E6QYs6ZsU6hpIAKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7640

Hi,

Nikunj and I have been debugging an issue seen during AMD GPU driver 
loading where we see the below failure:

-----------------------------------------
kernel BUG at arch/x86/mm/init_64.c:173!
invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
CPU: 4 PID: 1222 Comm: modprobe Tainted: G            E      6.8.12+ #3
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 
rel-1.16.3-0-ga6ed6b70-prebuilt.qemu.org 04/01/2014
RIP: 0010:sync_global_pgds+0x343/0x560
Code: fb 66 9e 01 49 89 c0 48 89 f8 0f 1f 00 48 23 05 4b 92 9f 01 48 25 
00 f0 ff ff 48 03 05 de 66 9e 01 4c 39 c0 0f 84 c8 fd ff ff <0f> 0b 49 
8b 75 00 4c 89 ff e8 af 62 ff ff 90 e9 d3 fd ff ff 48 8b
RSP: 0018:ff52bf8d40a7f4e8 EFLAGS: 00010206
RAX: ff29cef78ad1a000 RBX: fffff1458477e080 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000010ad1a067
RBP: ff52bf8d40a7f530 R08: ff29cef78a0d0000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ff29cef79bd8322c
R13: ffffffffafc3c000 R14: 0000314480400000 R15: ff29cef79df82000
FS:  00007e1c04bf8000(0000) GS:ff29cfe72ea00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007e7e161f2a50 CR3: 0000000112c9a004 CR4: 0000000000771ef0
PKRU: 55555554
Call Trace:
  <TASK>
  ? show_regs+0x72/0x90
  ? die+0x38/0xb0
  ? do_trap+0xe3/0x100
  ? do_error_trap+0x75/0xb0
  ? sync_global_pgds+0x343/0x560
  ? exc_invalid_op+0x53/0x80
  ? sync_global_pgds+0x343/0x560
  ? asm_exc_invalid_op+0x1b/0x20
  ? sync_global_pgds+0x343/0x560
  ? sync_global_pgds+0x2d4/0x560
  vmemmap_populate+0x73/0xd0
  __populate_section_memmap+0x1fc/0x440
  sparse_add_section+0x155/0x390
  __add_pages+0xd1/0x190
  add_pages+0x17/0x70
  memremap_pages+0x471/0x6d0
  devm_memremap_pages+0x23/0x70
  kgd2kfd_init_zone_device+0x14a/0x270 [amdgpu]
  amdgpu_device_init+0x3042/0x3150 [amdgpu]
  ? do_pci_enable_device+0xcc/0x110
  amdgpu_driver_load_kms+0x1a/0x1c0 [amdgpu]
  amdgpu_pci_probe+0x1ba/0x610 [amdgpu]
  ? _raw_spin_unlock_irqrestore+0x11/0x60
  local_pci_probe+0x4b/0xb0
  pci_device_probe+0xc8/0x290
  really_probe+0x1d5/0x440
  __driver_probe_device+0x8a/0x190
  driver_probe_device+0x23/0xd0
  __driver_attach+0x10f/0x220
  ? __pfx___driver_attach+0x10/0x10
  bus_for_each_dev+0x7d/0xe0
  driver_attach+0x1e/0x30
  bus_add_driver+0x14e/0x290
  driver_register+0x64/0x140
  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
  __pci_register_driver+0x61/0x70
  amdgpu_init+0x69/0xff0 [amdgpu]
  do_one_initcall+0x49/0x330
  ? kmalloc_trace+0x136/0x380
  do_init_module+0x99/0x2b0
  load_module+0x241e/0x24e0
  init_module_from_file+0x9a/0x100
  ? init_module_from_file+0x9a/0x100
  idempotent_init_module+0x184/0x240
  __x64_sys_finit_module+0x64/0xd0
  x64_sys_call+0x1c4c/0x2660
  do_syscall_64+0x80/0x170
  ? ksys_mmap_pgoff+0x123/0x270
  ? do_syscall_64+0x8c/0x170
  ? syscall_exit_to_user_mode+0x83/0x260
  ? do_syscall_64+0x8c/0x170
  ? do_syscall_64+0x8c/0x170
  ? exc_page_fault+0x95/0x1b0
  entry_SYSCALL_64_after_hwframe+0x78/0x80
RIP: 0033:0x7e1c0431e88d
Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 89 f8 48 89 
f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 
f0 ff ff 73 01 c3 48 8b 0d 73 b5 0f 00 f7 d8 64 89 01 48
RSP: 002b:00007fffa97770b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 00006198887830f0 RCX: 00007e1c0431e88d
RDX: 0000000000000000 RSI: 0000619887b43cd2 RDI: 000000000000000e
RBP: 0000000000040000 R08: 0000000000000000 R09: 0000000000000002
R10: 000000000000000e R11: 0000000000000246 R12: 0000619887b43cd2
R13: 0000619888783220 R14: 0000619888782600 R15: 000061988878d190
  </TASK>
-----------------------------------------

A KVM guest (with 5 level page table enabled) is started with 8 GPUs 
(AMD GPU driver gets loaded) and CoralGemm workload (matrix 
multiplication stress) is run inside the guest. The guest is turned off 
after the workload run completes.

This test(start guest, run workload, turn off guest) is repeated for 
hundreds of time and approximately once in 500 such runs or so, AMD GPU 
driver fails to load as it hits the above mentioned problem.

As part of GPU driver load, the GPU memory gets hotplugged. When struct 
page mappings are getting created for the newly coming-in pages in 
vmemmap, the newly created PGD is synced with the per-process page 
tables. However the kernel finds that a different mapping for that PGD 
already exists for one of the processes and hence throws up the above error.

The debug print from __add_pages() shows the pfn that is getting added 
and the number of pages like this:
__add_pages pfn fffc010000 nr_pages 67043328 nid 0

Later in sync_global_pgds_l5(), the start and end addresses are coming 
out like this:
start = 0x314480400000 end = 0x3144805fffff

These are essentially the addresses of struct page and such addresses 
for page pointers are unexpected. The start address was obtained from 
page_to_pfn() which for the sparsemem case is defined like this:

#define __pfn_to_page(pfn)      (vmemmap + (pfn))

When the problem is hit, vmemmap was found to have a value of 
0xfffff14580000000. For the pfn value of 0xfffc010000,

start = 0xfffff14580000000(vmemmap) + 0xfffc010000(pfn) * 0x40(size of 
struct page) overflows (wraps around) and results in the start address 
of 0x314480400000.

This points to the problem of vmemmap_base selection by KASLR in 
kernel_randomize_memory(). Once in a while, due to randomization, 
vmemmap_base gets such a high value that when accommodating the 
hot-plugged pages, the address overflows resulting in invalid address 
that gets into problem later when syncing of PGDs.

The test ran for 1000 iterations when KASLR was disabled without hitting 
the issue.

At the outset, it appears that the selection of vmemmap_base doesn't 
seem to consider if there is going to be enough room of accommodating 
future hot plugged pages.

Also as per x86_64/mm.rst, for 5 level page table case, the range for 
vmemmap is ffd4000000000000 - ffd5ffffffffffff. Is it correct for 
vmemmap_base to start from a value which is outside the prescribed range 
as seen in this case?

Any pointers on how to correctly address this issue?

Regards,
Bharata.

