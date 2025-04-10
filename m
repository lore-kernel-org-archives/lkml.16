Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022143.outbound.protection.outlook.com [52.101.43.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB372EEB1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744322430; cv=fail; b=FE2g1Q8WN2ebcjXwWKXta8pvWuZ9n5XIbY+6dBXpOjAlqbNccvlKM8n01Jd1AdackL7B9KLUZXBZdIT0GpBqgwfUBZVGSqvtledjJ9/qjSv3k4fk2IX8U2xwXJOy0vDwrfKwL2iuv6oiBKdXMYkqiIkEYKXTq9Q3caoT3r6ePXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744322430; c=relaxed/simple;
	bh=puif388fJAscHBsbA3M3zptXBRV/1ke8uOPvfOFNjh0=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M2em3POGMjwhniQAQqmFVZgod+rkerh8pChTvNo2C0qbJiwLkrNGkW+Tg8+3uK9WrPeSPVAYuDlgvtH/Vq5mlDD78jpzD4Gx8D8IDXkgxjDP+hiJ0WSa2PoBs6UQHR2TZWzTy3jBt+oljaFKKVz662WSkcAwwzFzihdBqQcW130=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=tJJpFQdk; arc=fail smtp.client-ip=52.101.43.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="tJJpFQdk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6OWmTUo8FJZ/87J2fHP31PzzmzZoRtJheGAro46e46GEYCeoaOAOefQ5Xeu0ZP+HpYb9wmj47YW9THet4JGlr2FE23fw5FdtHpCkdY2kIYUdhlUhezxGZo3jJNZ3h4oABSHk+TZ68qYQMUZcTYgjvHb9Fb9kmag35Y6pxqxQkC1PrCft3M2sVcsyEyt4lESzOZkWG3M9xnhkI6YREgL2C+654T8Fn15SOJa/X3BonLzw/+OOKPYTgSHXz5InJmii0Dk1nMRH4j0OrTkt+eJvyF3nFiX8CV2dkrtRBBTp42Kvg1hNC8X0eptVfmp+A2W77W21AGOwmu7BUvcKojuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TS/XNGd/2O8+4MWvNFV9LET3dH7u+rpp610GqfswB4U=;
 b=aBsfM5jXxvmgLln8cvjalW3GOJMJn1NXgKC2QBjG/KlSzA0JjtJfbPxXTX1xqcjcFduSrQURrtZi2wjZrQwFLyp7Tlia+v+XGWsPLF8dfLbikB7zuV7MQHXILP6LBglY1P8GGJoXJCdVl8aSY5n1Zkq3c3mh4OiBYvnbT1VOyWyUvpbhaTaUbfGrLfD5Cih0I9kJZmUQ6WbbWm39wsefnybebO9RhqUujcubHY0Ka/DWerC+mDZXjvFM+k+n6Rrpx6z8F96iSq273pL9y12XRFst5JjaO5hzWE/LAiUzMirnKh2y9tsTeKtrV2Ez6B5gCSmrv+CRPTKCZe3YhzdJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TS/XNGd/2O8+4MWvNFV9LET3dH7u+rpp610GqfswB4U=;
 b=tJJpFQdklskqdLNjLWkeEk2RIR4YQR+3uA/ZkMc92iNcuVFaeLl/1gt+TWpRO9OVr2BfwHaVZtKPjUB7kPFRvjp3UjLesBC6P/Zw/+lEjwX4dmKtTRB/ZOaCQI9n4MLREJOcCe3LH7GHA1t+5HBVoE0anBt5IVSAhCi2DmqAEvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SA1PR01MB7264.prod.exchangelabs.com (2603:10b6:806:1f3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.23; Thu, 10 Apr 2025 22:00:25 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 22:00:24 +0000
Message-ID: <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
Date: Thu, 10 Apr 2025 15:00:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
From: Yang Shi <yang@os.amperecomputing.com>
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <3750d3f8-17c6-4bb8-8107-215d442e4ec3@os.amperecomputing.com>
 <2fb974bb-1470-4a5f-90d5-97456140c98f@arm.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
Content-Language: en-US
In-Reply-To: <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::24) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SA1PR01MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: 72444150-3d9f-4e25-39ef-08dd787b186f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amx5ZTVzMFprdkRwZDVWU1NqUHR3SFk4b1NhN2JWZGl2QzJyL1RwNmlGUEQ5?=
 =?utf-8?B?QWdzWEVRVW5nRy9Gcmh4Vk1tK3ZHdXFYdUNGV0hyMjg4SVFlRXdxd2tRYXlK?=
 =?utf-8?B?TVB1RDVxakYwNVZZRGhLNGxiWW00OVN1TDZzWWt6anFFN3cxZ0ErVThDUGFp?=
 =?utf-8?B?SUwrME5XbzB1ZGVNTzh3UDlVRytoZ3FYNjVGck5xZFE5MU5pZzROYlBvTHJz?=
 =?utf-8?B?TzZWUGpBb2JRWFlBVGVSc05rVWpqOUtNclNSSHlTdHhIcmNOTFR3QU56aW10?=
 =?utf-8?B?eGRsUEU3RHVEOXlJWUZHYnF2eHhZZDl1N3hEbWlUWnZNeVpObllKdGM3ZENl?=
 =?utf-8?B?NTV0TG8rK2FOM29BYmROL094eWZHOUtteDRRa0YwU3BrMzBiMHFuKzdXTHRK?=
 =?utf-8?B?bDVvQkFPejFoVkY2VTN4QWpSa29JZ2Fpd1ZLa3FlK28yZDVxd2xHb0Z3OTZE?=
 =?utf-8?B?dUxMT3lOQWxJVVFpNk9zc0VQUS9XV2c1T0hYcUlacU9Pbk82WjhpMnk2Q0tv?=
 =?utf-8?B?d2FvSDdHVnd6MjF4L2o5a2U0STdEcU9lamw3b2w2bjV1a29PeDJkL0crTU42?=
 =?utf-8?B?T3BaY1FKSURzd0YxRm1Ca1QveG0rclVFT2hwQ2RZQ2pmWHNJZ1BESUs5Tk1i?=
 =?utf-8?B?bUF3MG9VaGFMR0M2L1c3Ui9XWmk5SUJhSmF4dkphWXVmWmNJUHVhcC9MeG1x?=
 =?utf-8?B?bGxmNGVuWUFOaDNKb3RNMSt4RFh1Vk93MUJhNEFyWGd0RitwRllJcnlublhH?=
 =?utf-8?B?SDczcVpKaUJuUnRjZk9LbkJQU29lQlRHTTJoZHlJMjg2OGtFbk9xOWZ4Mzli?=
 =?utf-8?B?NG0yaFhqcXBzdjNENFNWWTZrcGMzU3hMZzl0YVBGZ1FNWWhSdFJ5ckdwTEw0?=
 =?utf-8?B?MGZDcVJOUThBOUpYby9sTW1qaWZmNVk3dk82R2ZVZkNkeURwdTVpSVJ0Tjll?=
 =?utf-8?B?aUNsMVN4NmxrU1FXMGpSRVorZEdKWTNiV0c5eEQ0bWNMazhmSFBpOU5rbVJJ?=
 =?utf-8?B?N2Y5NHp0ZTBGOXJkc3l1Z3B3Skc1ek5HcUlJYmM1aHptRXJiSmFOT1c3NStO?=
 =?utf-8?B?WHpsSnZtRzhySW9SWGo4OXFVRVF6ZFlRckd6dkxJMVRCNityWnFHZXpybG9n?=
 =?utf-8?B?QjR5YnlVWGQ0YStFUzhZTUROUXMyd3NQQVlUNmJFb2VTTXFJYjcvR25KMEhz?=
 =?utf-8?B?bkZQdjRmWVczTFhkQ1FvMHFVYWJOL0dJWGdaRFBwWTJsOFYwTGJoQ0MveGlQ?=
 =?utf-8?B?dnN1S0IvMGNIQ0JteURKSnlvSmVmY2V0a3pPb2V5SHZwRHdNYTNhZk12K3BG?=
 =?utf-8?B?S3VHZHdNTGJTRHJFL0daL3JjY3VWd3h6MHBWWXlkUVAvYjB0RjV5dXk2QW01?=
 =?utf-8?B?enIxRUtVWk95TnpoNzZIUFZyb1UvcFIxNU4zQWFwVE94aWNOVkd6YVd5MkpD?=
 =?utf-8?B?ZXh6UDIxTWxFRWROMmVWc3Q4QnNzaHJub1JYK3p4UDlaaFFxd3lyRW44RGFO?=
 =?utf-8?B?Y1JKcjBFWEh6Uk1EeHJvSmxqMFUxVm41amwydHpqSGhCQ3NreElubnREQ010?=
 =?utf-8?B?MGplZEtRUFJSWWRZc2E2ZXBvWlJqVjFZanFZRkNWMFhoa1dPSWM4NkZWSlFD?=
 =?utf-8?B?d3o4emg2MmNmc2RsdmZidURQa0JqS3lhUHd5VkwzYmJKcU9abzRvVUhHU0dH?=
 =?utf-8?B?SklqcTNpT0d2MTBXdk9CRTRZUTRxa1pJcGlaRmgzVDVhT2lweGZ5WVhxZDln?=
 =?utf-8?B?c25idmdXcVA0em1tR28rTFc3ellTczE4Uys2OW9CQXdLYk5CWERpTjZTZ0xY?=
 =?utf-8?B?NHBnZ3VQT1N4MExnT1FVZEp6UWd3MVkrbG00RUdqUlk2NjZVcVI5UVlHQXM1?=
 =?utf-8?B?cDg2TVdlOGdJWjEzSjJyMTBjUzMrdFZBQjJmWm9RaXF4MDNiTU5nbElIOTh5?=
 =?utf-8?Q?PFsounXMmuw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWRPT244dm9mV3hrdnR5VzJrZC9ZYlUrT21nYTZJa1oxQWZZL3hLSStyZDYz?=
 =?utf-8?B?MjFCcFpBTnBPSXRYS2Z1SnR4Z0FReTRDSy92KzJpSkVqWU8zWFpRTzAwUnVD?=
 =?utf-8?B?RS83Q1kzeGxsVlc0T1RmTEhqUmJZUUM0RThqRy9oOVlML1A2QzdmeDdaeDZP?=
 =?utf-8?B?eERoTytGbXJzQUYrZ2NLK0l5dFNPVmx5NXllalVSR0ZyaUdGMVNONnJCOVF5?=
 =?utf-8?B?MmtBcHV6bjBuWXpwUlM5eGpielloSEc3UVpYUGJSbkt2eWs4NWFhUWtwbkZF?=
 =?utf-8?B?THh5eGtmYmVmQVJyOXJKNHZ2elkzbXdiVytZbkVhamRMSWdCOXNyU1RmNE1X?=
 =?utf-8?B?a0hlWlFiOHl3TW1mSFVPRUs3RmVOZFdRUTBCNlV1a0lRS0p6NHUrRU9RamRx?=
 =?utf-8?B?QXQvY1ordDBEemd3WUpDTUFQQ3ArU1NTWng4RjRmMGYvRHBIcXk3cXpDNC9t?=
 =?utf-8?B?R09aQkMyQWRTM3J6NXVkUnJSYUluNUFFdEk3M2NUNW0vNjRUMjZUMVlrbFFN?=
 =?utf-8?B?eEhkK25OM0RwamVlTTIwN2g3czN0bHMwYUw5aW40YktqYzRhNzgrVWlsQ0ZP?=
 =?utf-8?B?Mmc4VFRkc0c5bjNUNHlpRTVTamsrQ1g2WGxLQUkxM2lhVkd4K21NbGc1YndO?=
 =?utf-8?B?L0NEVEVZVGpZSmlrdFpMOTFFYitFaFRxbkFia3Avc0RkMndlR3pnVmJTdHlz?=
 =?utf-8?B?L0hjcVBtVnhreGt6S2doak1FRG9zSHpxYWRPZmlBKytWL1N0ckEwRkhoOXNy?=
 =?utf-8?B?eHBMN0lqU3Z3RXNNY2x4SGVoL0NvRjZOcjY0YlVVcUZKNWJtdW1rd3JXcEtz?=
 =?utf-8?B?OEdjMVVSMnJmNGRPRjZiUjR2NnhqRFVhZHNrQmdHRGttS0xxZDhmLzZMMlhR?=
 =?utf-8?B?bFNkR2c1dFV1a3hIcEtkcnZ0MGhoZHNmRlhpbzlHeGMrQ0JZQm5yUmdnNmFJ?=
 =?utf-8?B?SVhwdHBsR2pDdU8wK2dzWmcwc1hydE5IdjYvcWZMejZRcmFiK0hKeGdWeDN0?=
 =?utf-8?B?bTRwN1EvTVlxbjhwYndvNWlDZjExSlF3YzVmeEZvU2RDbFFtMFE1cmR4Y3Nq?=
 =?utf-8?B?QytJSnQwN1dpSnpLcXpJU3IzRVJKbkZKbzdxK0t3VlBrcDY1NGMrRDdqVmFE?=
 =?utf-8?B?WVlwTTRMVnVNQ3FvNUk5d2NIeGV3aGtSVWNrSHJNd2RHS2kvRENTYnpqMXlV?=
 =?utf-8?B?Wnd3YUgyODY4KzdiZlVqUElhMEZNOCtST01oUEJ5RWlETjBIY1ZjUWpuZkRU?=
 =?utf-8?B?YXFJUmt0eFFEZzRHWktBMm5YQlUycUhjV2FaYURLUHE5b0k5RnJFTjFvNFZi?=
 =?utf-8?B?VVRVNDFzcllnTU50bHk5eWEzb0Q0czdaSUE5TTZMZlhDY2RtZnRPKysyN1hI?=
 =?utf-8?B?UTFuSURLR0k4ZHZFbG9GekNBb3MyOS9aZkU3cnljUnI5R0hweXJnU1NPZGlO?=
 =?utf-8?B?SGNYSytXcjV0TWxabW5iVk5ZaTVwMG9oNzk0V1NYdnVPMU9uT0k3T0RzeDBy?=
 =?utf-8?B?elB0bGhKN1FRWkEyWVJlMXVMMDBlOE5Ec3FwbHJnbDdrOWdFM0Z1NERZeVd1?=
 =?utf-8?B?SjVrZFozTTBodGN3bTk1ZlBsdWZGMUZJZ0JYRndIS1U5OThDQityZU43SFJB?=
 =?utf-8?B?NDBnYzhMSzl6OXRzVnhqSXlNRlpCZXk0OWJZajBrSm9zVE9LUGhTbDBzVVVk?=
 =?utf-8?B?U25OUWZJSVFTRHlPamYwZ2FheHI3Q3JRZjU4WmFSYmpBN01ZUy9BYW1LYnVi?=
 =?utf-8?B?cGdTaG9sMDBORWhINjRhaDJlR2xrY1AwL05icmdaRkVkZjdIL3I0dlUycktR?=
 =?utf-8?B?SzNIR1E0UnZjQ0szTkMvdE5ZTXgxakxoRWlNdHNFa0dXbmFNYmRWTExMQXFN?=
 =?utf-8?B?YnpWcGhKWmJUcWh6MFBtOGhtTDQ1Y2FnY2xyS1dtTFRaRXREYzNYa3hNRjJE?=
 =?utf-8?B?SG42akd6R3E1TXJCUUNOcWtSV3M5WTA4bU9GQzh5RjlWOWsybHU3OWxFWHph?=
 =?utf-8?B?SDJhc2k2Wno5b1R1ZnZSZ1JIcEpXOWRielhhWlk5bmxmN1J4dWZVaE1WWGNw?=
 =?utf-8?B?YTAxNWkycHkyKzY0dU1reXh4SUE1S3dNdVdEVjk5QlhPR0hHOTZTdjhGRXNH?=
 =?utf-8?B?UlA1Y2xWbVpqekMxdG5Qd2lUcG4zMUFFTkVubnBUbW5BWFdycGlxVW9MTXNG?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72444150-3d9f-4e25-39ef-08dd787b186f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 22:00:24.8200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wV//03gEWee6NbCfaBob/P4fAkljlmiCPIAK/VYl7fGOht/tfWXhwL9VhCjoiHO01ovToAFugokp0k1yX0HDqKDMwW0KQO5+Py0clBTbGTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7264

Hi Ryan,

I know you may have a lot of things to follow up after LSF/MM. Just 
gently ping, hopefully we can resume the review soon.

Thanks,
Yang


On 3/13/25 10:40 AM, Yang Shi wrote:
>
>
> On 3/13/25 10:36 AM, Ryan Roberts wrote:
>> On 13/03/2025 17:28, Yang Shi wrote:
>>> Hi Ryan,
>>>
>>> I saw Miko posted a new spin of his patches. There are some slight 
>>> changes that
>>> have impact to my patches (basically check the new boot parameter). 
>>> Do you
>>> prefer I rebase my patches on top of his new spin right now then 
>>> restart review
>>> from the new spin or review the current patches then solve the new 
>>> review
>>> comments and rebase to Miko's new spin together?
>> Hi Yang,
>>
>> Sorry I haven't got to reviewing this version yet, it's in my queue!
>>
>> I'm happy to review against v3 as it is. I'm familiar with Miko's 
>> series and am
>> not too bothered about the integration with that; I think it's pretty 
>> straight
>> forward. I'm more interested in how you are handling the splitting, 
>> which I
>> think is the bulk of the effort.
>
> Yeah, sure, thank you.
>
>>
>> I'm hoping to get to this next week before heading out to LSF/MM the 
>> following
>> week (might I see you there?)
>
> Unfortunately I can't make it this year. Have a fun!
>
> Thanks,
> Yang
>
>>
>> Thanks,
>> Ryan
>>
>>
>>> Thanks,
>>> Yang
>>>
>>>
>>> On 3/4/25 2:19 PM, Yang Shi wrote:
>>>> Changelog
>>>> =========
>>>> v3:
>>>>     * Rebased to v6.14-rc4.
>>>>     * Based on Miko's BBML2 cpufeature patch 
>>>> (https://lore.kernel.org/linux-
>>>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>>>       Also included in this series in order to have the complete 
>>>> patchset.
>>>>     * Enhanced __create_pgd_mapping() to handle split as well per 
>>>> Ryan.
>>>>     * Supported CONT mappings per Ryan.
>>>>     * Supported asymmetric system by splitting kernel linear 
>>>> mapping if such
>>>>       system is detected per Ryan. I don't have such system to 
>>>> test, so the
>>>>       testing is done by hacking kernel to call linear mapping 
>>>> repainting
>>>>       unconditionally. The linear mapping doesn't have any block 
>>>> and cont
>>>>       mappings after booting.
>>>>
>>>> RFC v2:
>>>>     * Used allowlist to advertise BBM lv2 on the CPUs which can 
>>>> handle TLB
>>>>       conflict gracefully per Will Deacon
>>>>     * Rebased onto v6.13-rc5
>>>>     * 
>>>> https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-
>>>> yang@os.amperecomputing.com/
>>>>
>>>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-
>>>> yang@os.amperecomputing.com/
>>>>
>>>> Description
>>>> ===========
>>>> When rodata=full kernel linear mapping is mapped by PTE due to arm's
>>>> break-before-make rule.
>>>>
>>>> A number of performance issues arise when the kernel linear map is 
>>>> using
>>>> PTE entries due to arm's break-before-make rule:
>>>>     - performance degradation
>>>>     - more TLB pressure
>>>>     - memory waste for kernel page table
>>>>
>>>> These issues can be avoided by specifying rodata=on the kernel command
>>>> line but this disables the alias checks on page table permissions and
>>>> therefore compromises security somewhat.
>>>>
>>>> With FEAT_BBM level 2 support it is no longer necessary to 
>>>> invalidate the
>>>> page table entry when changing page sizes.  This allows the kernel to
>>>> split large mappings after boot is complete.
>>>>
>>>> This patch adds support for splitting large mappings when FEAT_BBM 
>>>> level 2
>>>> is available and rodata=full is used. This functionality will be used
>>>> when modifying page permissions for individual page frames.
>>>>
>>>> Without FEAT_BBM level 2 we will keep the kernel linear map using PTEs
>>>> only.
>>>>
>>>> If the system is asymmetric, the kernel linear mapping may be 
>>>> repainted once
>>>> the BBML2 capability is finalized on all CPUs.  See patch #6 for 
>>>> more details.
>>>>
>>>> We saw significant performance increases in some benchmarks with
>>>> rodata=full without compromising the security features of the kernel.
>>>>
>>>> Testing
>>>> =======
>>>> The test was done on AmpereOne machine (192 cores, 1P) with 256GB 
>>>> memory and
>>>> 4K page size + 48 bit VA.
>>>>
>>>> Function test (4K/16K/64K page size)
>>>>     - Kernel boot.  Kernel needs change kernel linear mapping 
>>>> permission at
>>>>       boot stage, if the patch didn't work, kernel typically didn't 
>>>> boot.
>>>>     - Module stress from stress-ng. Kernel module load change 
>>>> permission for
>>>>       linear mapping.
>>>>     - A test kernel module which allocates 80% of total memory via 
>>>> vmalloc(),
>>>>       then change the vmalloc area permission to RO, this also 
>>>> change linear
>>>>       mapping permission to RO, then change it back before vfree(). 
>>>> Then launch
>>>>       a VM which consumes almost all physical memory.
>>>>     - VM with the patchset applied in guest kernel too.
>>>>     - Kernel build in VM with guest kernel which has this series 
>>>> applied.
>>>>     - rodata=on. Make sure other rodata mode is not broken.
>>>>     - Boot on the machine which doesn't support BBML2.
>>>>
>>>> Performance
>>>> ===========
>>>> Memory consumption
>>>> Before:
>>>> MemTotal:       258988984 kB
>>>> MemFree:        254821700 kB
>>>>
>>>> After:
>>>> MemTotal:       259505132 kB
>>>> MemFree:        255410264 kB
>>>>
>>>> Around 500MB more memory are free to use.  The larger the machine, the
>>>> more memory saved.
>>>>
>>>> Performance benchmarking
>>>> * Memcached
>>>> We saw performance degradation when running Memcached benchmark with
>>>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB 
>>>> pressure.
>>>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>>>> latency is reduced by around 9.6%.
>>>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>>>> MPKI is reduced by 28.5%.
>>>>
>>>> The benchmark data is now on par with rodata=on too.
>>>>
>>>> * Disk encryption (dm-crypt) benchmark
>>>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) 
>>>> with disk
>>>> encryption (by dm-crypt).
>>>> fio --directory=/data --random_generator=lfsr --norandommap 
>>>> --randrepeat 1 \
>>>>       --status-interval=999 --rw=write --bs=4k --loops=1 
>>>> --ioengine=sync \
>>>>       --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting 
>>>> --thread \
>>>>       --name=iops-test-job --eta-newline=1 --size 100G
>>>>
>>>> The IOPS is increased by 90% - 150% (the variance is high, but the 
>>>> worst
>>>> number of good case is around 90% more than the best number of bad 
>>>> case).
>>>> The bandwidth is increased and the avg clat is reduced proportionally.
>>>>
>>>> * Sequential file read
>>>> Read 100G file sequentially on XFS (xfs_io read with page cache 
>>>> populated).
>>>> The bandwidth is increased by 150%.
>>>>
>>>>
>>>> Mikołaj Lenczewski (1):
>>>>         arm64: Add BBM Level 2 cpu feature
>>>>
>>>> Yang Shi (5):
>>>>         arm64: cpufeature: add AmpereOne to BBML2 allow list
>>>>         arm64: mm: make __create_pgd_mapping() and helpers non-void
>>>>         arm64: mm: support large block mapping when rodata=full
>>>>         arm64: mm: support split CONT mappings
>>>>         arm64: mm: split linear mapping if BBML2 is not supported 
>>>> on secondary
>>>> CPUs
>>>>
>>>>    arch/arm64/Kconfig                  |  11 +++++
>>>>    arch/arm64/include/asm/cpucaps.h    |   2 +
>>>>    arch/arm64/include/asm/cpufeature.h |  15 ++++++
>>>>    arch/arm64/include/asm/mmu.h        |   4 ++
>>>>    arch/arm64/include/asm/pgtable.h    |  12 ++++-
>>>>    arch/arm64/kernel/cpufeature.c      |  95 
>>>> +++++++++++++++++++++++++++++++++++++
>>>>    arch/arm64/mm/mmu.c                 | 397 
>>>> ++++++++++++++++++++++++++++++++++
>>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
>>>>
>>>> ++++++++++++++++++++++-------------------
>>>>    arch/arm64/mm/pageattr.c            |  37 ++++++++++++---
>>>>    arch/arm64/tools/cpucaps            |   1 +
>>>>    9 files changed, 518 insertions(+), 56 deletions(-)
>>>>
>>>>
>

