Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7C3270EA4;
	Tue,  1 Jul 2025 16:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751387002; cv=fail; b=geweGyrFbf3DOyu+7DnCM31I6VDRlg9PCjnorgQ08nEyYr+JKavFJi7yfJb9jBHlXo7pTHEwG50mf71ZdZKnf7jPru/4hSsFNj36hTt0aoTVBi97OZySe4lLcx3kopHeKue+TdDeGG93IzlZc11ajY7MYRIZvP+CNi2U5gABxH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751387002; c=relaxed/simple;
	bh=tV3MdMMtMsEy8WL2uXPyzjClNaZgTOejaitlyGiXj18=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ql3/W5c/7ifcnDiYLlUnGF9GUarc2ZmXeq+BPsLrZoVMTLfpurqd1xWmZCDEU5EcVk723R2kBxiGuyn/IlzD78/qEx6F8IffP6l7TWYWgpiFl+kMiX/mjycXfeM8FmLHLpPJedMJXBGstVzUSMYI9N5HCd4dIsOGqevm29rfGzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vzHYWI8Z; arc=fail smtp.client-ip=40.107.237.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vzHYWI8Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcKPRpw3JtVxc4Wfq8OpBwr7hHjU7EHZ1NQuCyc/Pw8MfopxeNl/btQPYf/4e+8CpXyBOIT6m/B6kACWbnOBpx9rYWPyJ1hoYIhI43HKx+gAgh1aQoOa0PtaYs+wmSolxYHi81jG9NriW/b4wkTYUcos9Jzsl1p62ak82gBfc2PLqlzcSObd1dOxt8dwbA1cHP3ItWruDOMwok3nkKcSg98ZeXjUbaH/2ZEDk/zUR7P/nU+PDndchl4gFitteTiU0YL9a9hFWR3YZWpd5YbNzQjSnH+HhFiGDufnmeqCNDe+DBWhKTkwYsgPLoj89WEOOeRLoCkJughJQbFu3STOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrSPAnvG1aIKaDuCvTwgJ7V6X8mgnxegJ0O6umgrTpg=;
 b=nn9CAbkPZ21HxTDIG21jedM7Igro8OZlwxGp8m+c9S+aCoCX4V98LtFug9kIyAnu4/83NVY8xWIrJ6M6BOcVHYQRwbPe9bH9vId2q16IMiAvO+cSuT9rWb+2zzDMHaTvTj+odOA6UMEticDHhEQkFINqLtkgR4EN7hvP1zYOacHcrQ6NlEw1+3B87uf+qQeTn2C5PXI9gpFHBr1r4cTJlp55hXZjwrRzMd65otwFsF+TIz5ltKPPhJdtLdCyxn7Tqhw9OcIL/Y+8cS59j9t0Bg9m10rf0bvW+Z9WYabdnFOMyzQ5CEJQqR+DbY7nPWPcs5/4kJsibjFwweyDx53ORQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrSPAnvG1aIKaDuCvTwgJ7V6X8mgnxegJ0O6umgrTpg=;
 b=vzHYWI8Zn399Cu0ZGQQmyVjxPgA71W76jHQlkxRjG4eFeqQ79gViAWpP7p7y7YGam6HHDEYRkJtZySvflABGKj5VJBsQwR3/PLStorhWvHnFk9oYFejwWdVDlRmkWXTkTsYsigaBH3J0JmOp7AyDdbudZBJNHN9d1jmHRVgifnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN0PR12MB6294.namprd12.prod.outlook.com (2603:10b6:208:3c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 16:23:16 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 16:23:16 +0000
Message-ID: <2cb7cba2-616d-407d-a9e6-82d738a4c029@amd.com>
Date: Tue, 1 Jul 2025 11:23:12 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 26/32] fs/resctrl: Introduce mbm_assign_on_mkdir to
 enable assignments on mkdir
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <a44e9063c26c2c33701816d09f488cec522f2530.1749848715.git.babu.moger@amd.com>
 <dd4a1021-b996-438e-941c-69dfcea5f22a@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <dd4a1021-b996-438e-941c-69dfcea5f22a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0160.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::15) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN0PR12MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e92b47d-06a9-45ec-9500-08ddb8bb957a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUdvbWRPRC9aR0xUakxtVm1WZmtQVFJvRFRXNE1FT2dVd21ocVBVMElJZUlY?=
 =?utf-8?B?dUJUYmJURjBWRkZUV1hxdGFvL3pTbTBBSXhXMjA4SmpWclBPUUlaVDRMeml4?=
 =?utf-8?B?L1N2MkJ5TVhpQUw0Zk5HblRCQlBMU0hUM0R1TWN3SDlSSVNacjNSem11elU3?=
 =?utf-8?B?Q094dURWVWpLcUJIcEwwYW5MSkI4M3Z3ZXdSZUlkclFkK25mL2YzNjNXaEZq?=
 =?utf-8?B?YlZMMHdVZ0NXaDhkcSsxS0FVSTNvamFJNzA2ZXdqUHN5MzZWWFdKRWkyMzBD?=
 =?utf-8?B?WmtFRnNzbXI4cWtTODBaNDZvblRXM1ZsZEN0YmFvMExLNXVjajdBRzBVVnpu?=
 =?utf-8?B?K3lLTVlPN2VIWXRSZVZZZjlzRURmL1FvUm9jOEpHWlEvSUN3cnZ5U0lkSmlX?=
 =?utf-8?B?a3JNdGRPZEdqK3U3UGFOamVNYVpjWVd3VUUxcFcrb1k4dFZCeThIZG1HQU96?=
 =?utf-8?B?WUdMUVV1bDlFRE1iQ21oRC9TYzdRQnh2K2RTK1AvYnRIRGJHS0xoT2hjWEdR?=
 =?utf-8?B?aWJKUEFUS3lFUWhJakR3aEVtY2t1UVhjdUJuRWdGeFFWYmk2K0N2YW15OEl6?=
 =?utf-8?B?YjhZNUJEUWEveUlYTTdoWWc1ZlcyczVxUEhSeUZrUG5NbS9JelJWK2NzR0Vj?=
 =?utf-8?B?SGJjbGpDTHJEVHZLdHllZzhLN0lsSEp0WElZdHpvWDNmbTNuYWdOaFhFV2JX?=
 =?utf-8?B?bXpEejlxOVlPRFZGYjZ4M2FNQWpGYXVUdFRiQ0JJZXVlOXNMdDF6UTQ0eS9h?=
 =?utf-8?B?eGN3dTkzbjVDbkNaUE1VeGhpRVVUK3hwQnc5UWRKbUlVMmkvenZIVmdJelVy?=
 =?utf-8?B?ektkcGZWT2Q5SDlWZmdkSThsaGdnUE8rdTJCZG1vUm9NdDgvNFN3czBieER4?=
 =?utf-8?B?a2JLYmNINXZZRFl1eGhQaURram42UkRmSE9DbXF2TVRmbjBHeU55SXREZnZK?=
 =?utf-8?B?OEc0VG5NaDgrdnJVMlIzV2xnaWVlSFFpRkNWYkphNytpclRNVmZHa3N3QkhC?=
 =?utf-8?B?T1RYS0xrL2tLUkF1WE5wVzd0blBEMFppUllXUVFIbUlNOVcwVzlPMmUyaTZx?=
 =?utf-8?B?TXFtOEVlL1h1d2JDSWRrWkF1bTN3VmZjTTU5aVpFZk1DcUo5MWdtQVJDZ21r?=
 =?utf-8?B?UFNrQ2RxbHFRekxWNHhCcmJjRVd1TnkxcHJOZFpiWHRIVmJMR0crZjBnMyt3?=
 =?utf-8?B?LzQvdWZ5RHAyTmZTTTlYL05BN2ZhSjgxb2VnUEVSMWptWEVVa1hhTEVQbS9z?=
 =?utf-8?B?UjBQZGRSbUpMVzdSQjdKNDJTeEhBWVVEdkdNSXQ2V0ZEa3Fpdmh6cmllenVl?=
 =?utf-8?B?STV0cnNFdGhPemRLemRPMzdjY1AyMFZWa05PUC9RR0E0UHBSd1o2Y2dnMXh3?=
 =?utf-8?B?QjVzQ0MrTlZUSVlaYjQ3U3I2bnZVRnltNmxINFg1eWVzdCtWbHNWZGRmWXU2?=
 =?utf-8?B?SjJFWkFUTGJqT2krZWk1VGxNS1NnbVlIUm96a2JlaHN4ODA2MlJEczlwZStP?=
 =?utf-8?B?cFhrRHlzNjVxelpxVitTYkpsbzIxbzd5Vy9hV3Fvc01DZU95THZ2R29NOU9Z?=
 =?utf-8?B?SURWMWwyRk9KTEhwcXozanhvMmdXWHVhWlc0TUlOWDVScHhhTDZ6cXFKV0Zh?=
 =?utf-8?B?ODRsSnNzNFpRKzNHbEhwQnNjYjlmNUVTbVRkMEpELzVHMGFsQlRRbWhlYm93?=
 =?utf-8?B?V3BnNXNpSWZmbmpnQWgxNmc4dDVMNWlFMlpBR2ozcWlGemJMVFJKZ1FOaW1D?=
 =?utf-8?B?TXhYVWNoYWczUml6Z2RvL2w1YzdmYW5nc0o1akZ5YW5CUEdqcGJYR045TVo2?=
 =?utf-8?B?RWRZcGNiTmdJUFY0bmVWRzcxK29QcVh5TVFsblhNVlRSdkpvRWpEK1JQMVdu?=
 =?utf-8?B?bkN5NlJ0YXhoRFI4eEVDMS8vaUFzMWt0aU9kSmxUWnBlbXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTBiUG13S1orV00zN2JRcWxuVDROTnByQmZKSXZ6dldza3JibGZZc1oyZGp1?=
 =?utf-8?B?REoxelp5dUJibUFydHV6ZHJHSWRkUFY2MDJZYWJQODAxbW8zMEl5diswZXVj?=
 =?utf-8?B?anJhM3EvcXYxY2l5R0FISC9xSUMyb1lrN1VkY1FIR2VpRXNQOExVbnJ0NDNh?=
 =?utf-8?B?U1NoUkw3alM5WFdEOEJVZG5GOU5zUTdDTU9WNzhKRS8rOVBON1lRYTArd3pS?=
 =?utf-8?B?ZjNBWG1lRUFjSlN5QUtSdXBQWjQwYzRpbHBZK01EZ25NdThVdFQwVUxQWFVn?=
 =?utf-8?B?OHdQSlVybkZxS29HUDlMQ0E5K0Y2UmF3WFlKT2xMNEN1Qis3UUtIaGRSNUtS?=
 =?utf-8?B?TTY1VEZ6eWN3QUs3U2t1RGlYTzFoWjBuRHBqeVFZT2dtcFo4bjlmVHJ0eXJH?=
 =?utf-8?B?VlpIZFNhQUlwdTlZdFlTenJDTUdRbUtjZGVGZmFmRi9EKzRsY1NpN2R3UEFE?=
 =?utf-8?B?OUhJS1ZzOGR5UE9rYW1tK1R2b3U1RGR5NXQwZGc5aEtPNDZOWWtySkxnUVZu?=
 =?utf-8?B?VjBvUW1WNzR2TThFQzBPUE9zcTlPeUtUajBQZm5sSE96K09lWFNpUzNmNG9Y?=
 =?utf-8?B?NkttT1pmSmRLRy9Db1FtcktPUUlDUStPLzU0dkozVHBvKzJYN3ZyMGdZeEVE?=
 =?utf-8?B?bk1FUmRFd3VNL0dVelZrdkNXMW5pY3Z6MDdEZ1lZVUhJbVBCUDg2UlJFMzQ2?=
 =?utf-8?B?YmM2SDZyTEV5VE5vVElYNjBFWkFYTVJwb0NBYzE5UisyR3YvdGVzQUF2ekxX?=
 =?utf-8?B?RFNSaVphaXdnNnl4eXRrOFRENVNaODRISkhtQnBZcmZ4VGdlNU5aYnNEWll5?=
 =?utf-8?B?UlYvcUp1RnNRTW5XSEthNTBKUm1QZ1hiM0NGRjN2b3YzcEhXeEVPSnRjcUxa?=
 =?utf-8?B?VHI1Y000cDRrZVJsVXBGZzRZb1F1emtYMWpXTWM3NkluUGNkaUVuSXVyQURk?=
 =?utf-8?B?NEY3aUUzTy85UTZjYzBvU0o3b2lKUWpZUFpEaTlHa000RVZRdTE4NCtaRXRq?=
 =?utf-8?B?U3J2Ni9nWkkwbFZUNEFYaVdrMFlLamRsNE10MUZRM2ZEdEluWW9HdTM3QkZO?=
 =?utf-8?B?S0RvRmczcGdsMVl4a1FUN203K3hJdzMzeTF0TFJSeHRVTzVqM3BES2dPVVJG?=
 =?utf-8?B?Z1ZtZS8yV3o1bWI4KzR3WUk2eDNrbkNOSTdUUW52STlybVhhdUhiNi95U08z?=
 =?utf-8?B?dGliY1I4NnVMYTc2UnVhWUJLRjI0VFMzVCsyeDRiU1M1NkRqVnlKSmJrRkxR?=
 =?utf-8?B?eFdMNWUvSWF1bm82MHBTN3lvdTJYMkZPVCtkK3NIOS91aHBFZkxBVDRlcHZF?=
 =?utf-8?B?cnh4eDE2UjRjR3VZZ2VhNjJmV0swZERzWFR3K05aanhTanVSRE1rdXlkbVA5?=
 =?utf-8?B?S1pTZnNNOVV1d080dlJTM093eG9DMXlKTnl4SmxvSlR4SmdNQWF2SCt1bkxo?=
 =?utf-8?B?MXJvcGh0bzhud1hJdkVmTVk0UGJpSDdZc1RVd0tYeVB1ZFEvR1ZNUHRQSDhV?=
 =?utf-8?B?Z2U3THlIdk5FS3RJWlBQZFhoSGpaaWFZLzlUaUxEd1VsQit0OFYyanQwOHVv?=
 =?utf-8?B?djJiNWpEcjRYRkRjT2Jkd2dRV1lqTTg5R3hWTElOQTVGZlIzNHhWaVdqekpQ?=
 =?utf-8?B?SytocVVqUmdiQ3MwdHVGWEVFTWxjR2J5NzNkY2J4NnRPRVhnV0dnaU1CODlk?=
 =?utf-8?B?cGE2MTZHV2NvMzc5Y2FsMVpKd3NpL2cvUDFEWlpyclVwNEFxVHVsL1pJS29l?=
 =?utf-8?B?UGdobXVDWFBKMkR6Y2JEcFdqcDN2QXhiM2p0L3JMZVZqUkpabG1UNlRFcGZ6?=
 =?utf-8?B?TTNDVUo4YXdtcGNVczNHRWJtL1h1OGVwclNSeC9DQ3kxMDZiTDlraTNUZXBy?=
 =?utf-8?B?ajA2Vm54UEFNbXJRRXFHTUFrdFhJTEdCUWFQaFlTaTdKWVBYdnYyWDVUM20r?=
 =?utf-8?B?S21mb2Z6eTJXd1Flemx3eXpnMkdTaVo1eTJ4akVOMzRvbmpNNytwY2lOWk5U?=
 =?utf-8?B?cS80bEhJNmNuNVI4cGdIUm1aeUhqamNJWThBZUxDcDFDdEZwUVNiNWR0TStX?=
 =?utf-8?B?bzhZU1FHaUhTWG1IcGwwaE5aYUVJYmJyN2xzMEtjbkZOZUkwRmpqcU9YVE4x?=
 =?utf-8?Q?jpKs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e92b47d-06a9-45ec-9500-08ddb8bb957a
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:23:16.5062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syQf7lbUtWJwGiG3TNzV/wdmx4cUObToCK8drPHoIMqSXl5dcv81qzp5D1M2awdW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6294

Hi Reinette,

On 6/25/25 18:24, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> +static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
>> +						 char *buf, size_t nbytes, loff_t off)
>> +{
>> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
>> +	bool value;
>> +	int ret;
>> +
>> +	ret = kstrtobool(buf, &value);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mutex_lock(&rdtgroup_mutex);
>> +	rdt_last_cmd_clear();
>> +
>> +	r->mon.mbm_assign_on_mkdir = value;
>> +
>> +	mutex_unlock(&rdtgroup_mutex);
>> +
>> +	return ret ?: nbytes;
> 
> The static checker I tried complained here that ret can only be zero here.
> 

It should be

  return 0;

-- 
Thanks
Babu Moger
