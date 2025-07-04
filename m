Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB7C20B80C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751609637; cv=fail; b=hrDmu8VvjR6cOSGPcDKzswcoMq53v3ge146+b2PbSyalBx0sIoGTkD+tK52OvkKKJlui2EaR9HGDGgRFq77oofBf780KQf9ipS3O5TB+zSwfHzf5bhsEjHq7z2/ACSnK033eLVvZqTUHr12Z/ThrJNWLRIZIHkkOWF/ue2BuZq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751609637; c=relaxed/simple;
	bh=TPXSOPh3rMuayuOoke6uqmc5Z/7YG+0/yi6zJmQoZmA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AhI2ekSbLlaFVdwbRpQtANQLlskH8LUBxvOwY57JJbDswfyOAqrJg/SLYdETxiOxuspirUlvBExz97q5fCAQLerzzBIojQQN3keWHSrMcNWFT2DllQkL72w++w1rx7JfaQqYTdIEzWB6BH2BVZylgwzvBP5G//gX55IbN2KVpao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LLE+Hkvt; arc=fail smtp.client-ip=40.107.93.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LLE+Hkvt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5lHIYaYcHt2OnOotZAHL1ouMvMOJjADJiNY5VacxM36syDS41DzVwe94DkF4BYdHnHNnD5hPY59sVudmkrxRY+Oz4HNYLeADyNPeGj1IqNzqsIOoIRo/1hOAmU2WzQhqr1Nw+KcIcV8RvCT+d5BFbQCRgG0eDhvV67ojdd/xgkuMSDlIwyxl18dsc6vkIkpt/rYaG1vaKN4XCvljRIuCeAIHQtEqj2haZOz8LmWGGQ+kUZ8lyvuTMBk0ms+K2pg2Tmqg9MfXf0cuKlhI1PwVeijG17ln1sTLsqCK5XS54B4fZo6AMPgVEyCCaLGSPPjl2cWMZfUZfL7d+vN3Y+Naw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHd+iruzhMMF2FhGoduvbn53uxH+5R83TZvDavMdt5E=;
 b=YAzRTdOfMHrU7gmwfHdJNzidnfB1mVKY55UyQYbOfLp5MFm4U+F0aar9dZZrZ5JF/UldRPZDG44yfVGiNmyhKG8VBVAtcsPY6p6XWINCFHNyfcc3CAR2ncsUnOrO7KbXwVkBoPi2y1U/86U9GWSMUkrFcT2iShjMIYtHScxGjvq27hR8hRAHnOWFycTGBbuL8Ka63wg3jYbHjafRCl1DR0+WO0adp9S/VL4e5TRy1R8wRAUu32bYEjls22uAYMzRXzNylTAhYqp5SVEctKSlkE9o/46VObMyxpKrNH/bF/KwTMNeqbrL/qYpQBWjDfXDkpAj1IDwB0hFf/a2EFa0Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHd+iruzhMMF2FhGoduvbn53uxH+5R83TZvDavMdt5E=;
 b=LLE+HkvtximrnyHkzcpaA5gpSzuId1f7/EftRG1u2Yv26jNLFlVJe4oq0TnMU0f8WGssDa2h2NnIy1HT6JuImo9aQslksLgAN/tIAUmvJdQAzE86RAs0wgF/3PLY4m7nbtJuoE8qenUyEq/L1gRzIahY5GzcqFHBVzr42ixL7WE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DS7PR12MB6263.namprd12.prod.outlook.com (2603:10b6:8:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 06:13:51 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 06:13:51 +0000
Message-ID: <0672c7df-543c-4f3e-829a-46969fad6b34@amd.com>
Date: Fri, 4 Jul 2025 11:43:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] sched: Add ttwu_queue support for delayed tasks
To: Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, clm@meta.com,
 linux-kernel@vger.kernel.org
References: <20250702114924.091581796@infradead.org>
 <20250702121159.652969404@infradead.org>
 <20250703160027.GC245663@pauld.westford.csb>
 <20250703164708.GZ1613200@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250703164708.GZ1613200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0103.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::9) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DS7PR12MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: 9582123a-1491-49d5-9848-08ddbac1f1d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXUxTTJMYy9FVlcvNkEvRnlXSDZUREFMQ29KckNFdHBLYm5zNWFGTzV6MTFm?=
 =?utf-8?B?bDFTRE9JSFBRdjZvSHE4L3BlTGhTZW93cEk3WWFOUktGTnY2TEUzNFQ4THR3?=
 =?utf-8?B?U0x3dU42S3YxbVdDa1A2YUV1Rk85Tm1NVzJaYTd4ZjU3UWk5K0pRcWUrcjFx?=
 =?utf-8?B?dG1sc2pQNXUvN0pXL2plRFhlSzBka0FEMU83dHRoeFdrTVNKQ0dxU2sydGNN?=
 =?utf-8?B?RGtwUnBtZWE0V29ZWjEwKzExOG9zM2VKUVYxSTNUcDBGYXQ5Z3pNWGdMS2Fy?=
 =?utf-8?B?d0JYdkE5RzhYQm05ZGdLQ1RhMjRRS1A4NmwrZUFjMnFTZUhUZEQ2c0laQnc5?=
 =?utf-8?B?aVVVdzV2RDF1ZzlsOG15aGV6L3BEa0RkSlhJZEgva29iSW1HdzQ5emRkMU56?=
 =?utf-8?B?UGtRZWh2dWVNU2tZeWwrdFM5UzBzenRrSXZ0c2lBNEpNRHVOSGpMRkZxcUFL?=
 =?utf-8?B?RWNKSzk0RFcrWGFWSFFScnFvWWlOM2l2dmxXOTg3TVRTWFNwTjIzTHBPdDJ0?=
 =?utf-8?B?RmNadlNhbzUvd0J5ZWw0ZThYUjlXbUVGaGI3VWc3TjFvUkVYTUJmWENUVCtZ?=
 =?utf-8?B?bjIvWEltNnVocjA0YXVMcStuRGVmOEZCYXNBakIybTN2Qzl5QlBTd056T1hR?=
 =?utf-8?B?ZDJiaVd6VnB6UUJKNHV5L2krZm4wK3hzMWhkS242Y1N0VEhXU0huVEJWY0U1?=
 =?utf-8?B?RmtmSXV6U2E5M2pXa1FxR3d4cXFZZGkwb0JHRkJMVkpLRXc3aUoxT2Z3VjBI?=
 =?utf-8?B?bk40SEZDVEJTQ0xwUmtaelZnZWI1QlFEYXcrYUxnTUVUV2g2NWRNV2J6MktI?=
 =?utf-8?B?SjJTT2x1NHkwTDZEUmxqTnF3NTBlc2xsRmd4dlVISzExaVZmb0NjQWRhMlBr?=
 =?utf-8?B?RHVtczk4NE1FV2hUNG1CeXM0WlRlc3NwenptUWtFWU5RS042c3dUc1c0NDRB?=
 =?utf-8?B?MnRDWVlPaUF2RjE2MHJwOHBYZUI2ajA2b3FhSlo5a1RramtNSDRHTjE4V3E0?=
 =?utf-8?B?UTMxbGNOa1NDcE05WXE5WWJlZW9pOUdHVTRhYXhVaEpIWGZiUDY0c0U5Z1BC?=
 =?utf-8?B?eHE2MlNUU1BHNFppVkdaQjM3SjJZV1UzUDZtQzI0UjJZVjdwekg0OHNycWVR?=
 =?utf-8?B?bkMwNDRVREZaZ0tXaitOV1lzV1llQVdlSFRHVUVPbXcwTlpKZWFRVHdwNk9Q?=
 =?utf-8?B?cG5EYWZWNEN1bldBOHhPeSsyZ1FucnhjT2w3ZmhCc1ZLeUk4RTBtVTloak1q?=
 =?utf-8?B?bFpMVzQyWG85eFpxZFhXeGptWTNJOUV2VWFpMHdKdFlwVGxINWd3d0p2STVi?=
 =?utf-8?B?Q2pGekpDaWFqb1lINFpTZ09pU2xKdlZIZkZnNVkrUlhTZUdndlgva2xTdlkw?=
 =?utf-8?B?OXRWeVBtWU40ZElwZTljaVBuMnM5bkoxNU0wK0lyZG5TNzdWc0FuZzNEK0NC?=
 =?utf-8?B?QUsxbHlkMGlzMWhRT052Zzh6OFJ6czk4YlBLYnZGR040TGhGOXEreFRRWVZv?=
 =?utf-8?B?N3ZRTmhUUU1PZCs2R3ZpOTZSYXFXV3BTdEVZY3RYYmxLT2RDM3ljelVPdG1v?=
 =?utf-8?B?eW9VbjluNzJSNGdHYnZMNlBMaWdUaTVaMmI5eFNvM3piTVpWT2lmVThxdWs3?=
 =?utf-8?B?eFRVeGx2R21ETEFiVXd0WU5XVTI3Y2FXTkJrWTFNQlVJUFlHUGpMSms1SGpt?=
 =?utf-8?B?S3ZlM2lhNGsvc0t4VzJ6M3kzRWliQXFLMWZ6Sk1EWEl2TUE0ajVrb05TNHZy?=
 =?utf-8?B?WStPRjJEbXdFQllyR0ZqbWZGR3NJRVNsbER2RHNZbzE5ajY1Tm9tQm5XL1N2?=
 =?utf-8?B?Z2VIMEc4cDM0Y3REZEhET09XaGlDUlkveDVoZHU1ME02ZmJidXptNjIrYXpn?=
 =?utf-8?B?bUh3Wk1ib2JubXVFMVREdlhILzNadld3SC9nOVkxZXQ3dTlFV3d2Zll6K3RD?=
 =?utf-8?Q?5PR1IlQ/y3k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TURMck9SSWNIZFlacmxJNWxXNmJIVGxuRlQ0YjZ6ZkhGZUU2YlNaN3RwT2N2?=
 =?utf-8?B?QWZsUGtQMHZhYWJFd3hDN2VxTlVlZk9UZzF5eEF0MEJqK2I3RlJQZi9aMStX?=
 =?utf-8?B?TUI1TzFOeGFMMmtybG03Wml6Q1Y2VjNVWXZQN1FvWnNtK2pOMkhrNnVoMDVu?=
 =?utf-8?B?MU5iQlFYUzZYS2NqUDVSeS82YVlzejNQeW5nNzU4R0NpYzZVOTh0bThHSjU4?=
 =?utf-8?B?TDR5ckxnRHJTSTlZTzgxTWFLZGFVWDFlMFFFdzJzdXlFWnRPOUpvZFNidmE1?=
 =?utf-8?B?cm5ldlh4MnNxSU9IL3ZDNHRWdE95ZEcvaWZTUkg4dXRUckpENmdMb0hyRXgx?=
 =?utf-8?B?RGV5YmJDS1QwdTBDUzJSeGllbytDRnFYaEY5Ym1ibWZ5RE1yL0lPemtlUlRO?=
 =?utf-8?B?QWhvUCt0aWxMblNVUzkrRGhoVnV4UHJwcmoyUUdqK3ZkZ0NvdkVidkxvbE9K?=
 =?utf-8?B?VFI3TGRiLzZsVlRLS3YzWnFhUFpLenFLZ2w0emRjMzJrdnYrTnFQbGt2bDQy?=
 =?utf-8?B?dUFJTWVPNWRoemhHQWJ2bHhNNnN2SmRWblQ1Szdkb2JYRi9Qakl5NG8xODJV?=
 =?utf-8?B?T2xSaE9ya3VBVnhvejFHV01VU2dsZDJmblJkTjhwWFcxQ3lnYW5EUmY5WWxz?=
 =?utf-8?B?Q1grVGJjcnZ6YzV5b0tzMnhnU2VhbXFUaGoybXRFZ25tSU91aEVwQVVibEk5?=
 =?utf-8?B?WnVSdDRHdmNZNUY1dmlzTzk2UllGclQ0YmFFckIrRU1wMnF5QmZPNlJGQ2dN?=
 =?utf-8?B?akNXaHh6TzBHYVRhejJtVHdJU0lBZVV5OWpWMFoxYTlNczJMMjFpUzNUbldB?=
 =?utf-8?B?ZXRHZ1A4dmtRcC85TmJwcmlnRmIyci8waXBsdWdZY1F1a2hMcjUxRk9BRkNl?=
 =?utf-8?B?WHJDSmF2b1UzMlpaaEZsMU5ZVWhFZnFvTHdUcG5meHg3Wk05L3dNSWQyRktZ?=
 =?utf-8?B?UFFCOFdWaUpYcXNzUFNBNHlwZ1VHQmJZY3d1UXk4WXlTRTBha2pCRUZGME1j?=
 =?utf-8?B?YnB6dEtyK200cC9sbW90dHlQNDErQ3EyMFcrSWxoN0hPenlmNWdhbnBMcFpS?=
 =?utf-8?B?b2JNYnZQR0RTejlONitFUHhPNUUzblBKU3h4dk1IemRlc2VtV2EvTHdiVGpH?=
 =?utf-8?B?WUxKNDlZSXpuWlROaldyNkI4bEFpNnN3dHhDMndnWllnS1dQZ2JETXJ0Sk1t?=
 =?utf-8?B?T1NuTmNxdlRINElFRzdMeUlOOXVEa1JXQXk0UjJxTEl4M1RNMndtOE1XNk9L?=
 =?utf-8?B?aXVJRkwycWxIYms5ZVNoQVdQd1BDdTVzWTlzaU12YnowVjFydXprUzVxWjJE?=
 =?utf-8?B?dnpIZ0lFQUQ3SC9oMVFhVlB0SHNMSlFjN1VYUGNhMkhId1YvQ25yUXlHRWY0?=
 =?utf-8?B?WEFzMFR4RXFyYyt1M0dBejU1MlJ5ZDVZa043eDM2RHRVUzNNNU5uclJDUERj?=
 =?utf-8?B?OTRCYW1meUZ0Wjd2cUVTbWhFWU1OQ281bWYwR0J1YkhlTll3UTVNY1hvZlJR?=
 =?utf-8?B?dTNzaE1PeCt4ZjAxQ1Y4Q1ZGVHVLVDc2WmkycmhZTnZBcjBQZTlnSzVSRjVn?=
 =?utf-8?B?Sit1T3BhczJOQXh5RzlYUjh4Y0JxUlN5R0YxZStzYno5U3A2c2VwV0dkV0ZS?=
 =?utf-8?B?N1NuRHQyL1FMQkp5RVFCYnR0cVBqTmNwS1FZcFA3NDNSTUxkZ1BoVVZ4Z3pS?=
 =?utf-8?B?ekp2NDF4NzdzM0NCWjE2aUZKcE5NR3pybUJ0N25JdTltcjkwY3dwS2Vaa1BB?=
 =?utf-8?B?SXlraUdqbnVIOGg0YklkUzErVkNCRC9hemFvTDh0Rms0alZ1aTltSkdXVU5k?=
 =?utf-8?B?T3R3amdjbVVuNzFFaHY0c1ZXdU5RZTd4RjcvWEtzRS9YaE9GbFpBdE1aTEFp?=
 =?utf-8?B?M0FzZlZrV3RJK3F3YUl4UVVmRXRBeDVycEJzM09mMitMVHk3T1NJcW0wNGly?=
 =?utf-8?B?TDNtRVlJeTJvYmY2WWVKMWRNK2ZCMG9OUTFRMmVJNS9KcldTeWZVTm9ybjJG?=
 =?utf-8?B?c29NM3FXeW9wQnRNaExrck02eWtTRGNvcnhpa3hvd2M0dmt5NHh2bnR0M2Zk?=
 =?utf-8?B?NlRpSXhSVGtPMVBGQ1NXUjlhbGlUNHFBanhqNG1SQkRzT1pRVnRydXlkRXlQ?=
 =?utf-8?Q?n1sPpU4rW9u43b9C5euXF7Izm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9582123a-1491-49d5-9848-08ddbac1f1d9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 06:13:50.8319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRaMGpAaSmSCUZ0sM5cuu7FK6iOIwZIlRo66YOW9hC2iZCygVCMEGUBqDjwNS1ARDCskxrji5rjVY4n7BNq0Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6263

Hello Peter,

On 7/3/2025 10:17 PM, Peter Zijlstra wrote:
> Also, I updated the git tree today, fixing a silly mistake. But I don't
> remember build failures here.

Running HammerDB + MySQL on baremetal results in a splats from
assert_clock_updated() ~10min into the run on peterz:sched/core at
commit 098ac7dd8a57 ("sched: Add ttwu_queue support for delayed
tasks") which I hope is the updated one.

I'm running with the following diff and haven't seen a splat yet
(slightly longer than 10min into HammerDB; still testing):

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9855121c2440..71ac0e7effeb 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3871,7 +3871,7 @@ static int ttwu_delayed(struct rq *rq, struct task_struct *p, int wake_flags,
  	if (unlikely(rq != p_rq)) {
  		__task_rq_unlock(p_rq, rf);
  		rq_lock(rq, rf);
-		update_rq_clock(p_rq);
+		update_rq_clock(rq);
  	}
  
  	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
---

P.S. The full set of splats are as follows:

     ------------[ cut here ]------------
     WARNING: CPU: 141 PID: 8164 at kernel/sched/sched.h:1643 update_curr_se+0x5c/0x60
     Modules linked in: ...
     CPU: 141 UID: 1000 PID: 8164 Comm: mysqld Tainted: G     U              6.16.0-rc1-peterz-queue-098ac7+ #869 PREEMPT(voluntary)
     Tainted: [U]=USER
     Hardware name: Dell Inc. PowerEdge R6525/024PW1, BIOS 2.7.3 03/30/2022
     RIP: 0010:update_curr_se+0x5c/0x60
     Code: be a8 00 00 00 00 48 8d 96 80 02 00 00 74 07 48 8d 96 00 01 00 00 48 8b 4a 60 48 39 c1 48 0f 4c c8 48 89 4a 60 e9 1f af d5 ff <0f> 0b eb ae 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f
     RSP: 0000:ffffd162151ffd30 EFLAGS: 00010097
     RAX: 0000000000000001 RBX: ffff8bb25c903500 RCX: ffffffff8afb3ca0
     RDX: 0000000000000009 RSI: ffff8bb25c903500 RDI: ffff8bf07e571b00
     RBP: ffff8bb25ea94400 R08: 0000014f849737b3 R09: 0000000000000009
     R10: 0000000000000001 R11: 0000000000000000 R12: ffff8bf07e571b00
     R13: ffff8bf07e571b00 R14: ffff8bb25c903500 R15: ffff8bb25ea94400
     FS:  00007fcd9e01f640(0000) GS:ffff8bf0f0858000(0000) knlGS:0000000000000000
     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
     CR2: 00007fcf3990c004 CR3: 0000000147f9900b CR4: 0000000000f70ef0
     PKRU: 55555554
     Call Trace:
      <TASK>
      update_curr+0x31/0x240
      enqueue_entity+0x2e/0x470
      enqueue_task_fair+0x122/0x850
      enqueue_task+0x88/0x1c0
      ttwu_do_activate+0x75/0x230
      sched_ttwu_pending+0x2b9/0x430
      __flush_smp_call_function_queue+0x140/0x420
      __sysvec_call_function_single+0x1c/0xb0
      sysvec_call_function_single+0x43/0xb0
      asm_sysvec_call_function_single+0x1a/0x20
     RIP: 0033:0x202a6de
     Code: 89 f1 4d 89 c4 4d 8d 44 24 01 41 0f b6 50 ff 49 8d 71 01 44 0f b6 5e ff 89 d0 44 29 d8 0f 85 01 02 00 00 48 89 ca 48 83 ea 01 <0f> 84 0c 02 00 00 4c 39 c7 75 c7 48 89 4d 80 4c 89 55 88 4c 89 4d
     RSP: 002b:00007fcd9e01a1f0 EFLAGS: 00000202
     RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000003
     RDX: 0000000000000002 RSI: 00007fc2684926c2 RDI: 00007fb96fe862b7
     RBP: 00007fcd9e01a270 R08: 00007fb96fe862b5 R09: 00007fc2684926c1
     R10: 0000000000000000 R11: 0000000000000000 R12: 00007fb96fe862b4
     R13: 0000000000000000 R14: 00000000ffffffff R15: 00007fcd9e01a310
      </TASK>
     ---[ end trace 0000000000000000 ]---

     ------------[ cut here ]------------
     WARNING: CPU: 141 PID: 8164 at kernel/sched/sched.h:1643 update_load_avg+0x6f7/0x780
     Modules linked in: ...
     CPU: 141 UID: 1000 PID: 8164 Comm: mysqld Tainted: G     U  W           6.16.0-rc1-peterz-queue-098ac7+ #869 PREEMPT(voluntary)
     Tainted: [U]=USER, [W]=WARN
     Hardware name: Dell Inc. PowerEdge R6525/024PW1, BIOS 2.7.3 03/30/2022
     RIP: 0010:update_load_avg+0x6f7/0x780
     Code: 42 f8 e9 c8 fa ff ff 39 c1 0f 42 c8 e9 4a fb ff ff 31 c0 45 31 c9 e9 cf fb ff ff 4c 8b a7 80 01 00 00 49 29 d4 e9 5a f9 ff ff <0f> 0b e9 42 f9 ff ff 69 d0 7e b6 00 00 e9 f4 fb ff ff 39 c2 0f 42
     RSP: 0000:ffffd162151ffd20 EFLAGS: 00010097
     RAX: ffff8bf07e571b00 RBX: ffff8bb25ea94400 RCX: 0000000000000041
     RDX: 0000000000000000 RSI: ffff8bb237533500 RDI: ffff8bb25ea94400
     RBP: ffff8bb237533500 R08: 000000000000132d R09: 0000000000000009
     R10: 0000000000000001 R11: 0000000000000000 R12: ffff8bf07e571b00
     R13: 0000000000000005 R14: ffff8bb25c903500 R15: ffff8bb25ea94400
     FS:  00007fcd9e01f640(0000) GS:ffff8bf0f0858000(0000) knlGS:0000000000000000
     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
     CR2: 00007fcf3990c004 CR3: 0000000147f9900b CR4: 0000000000f70ef0
     PKRU: 55555554
     Call Trace:
      <TASK>
      ? srso_alias_return_thunk+0x5/0xfbef5
      ? update_curr+0x1bd/0x240
      enqueue_entity+0x3e/0x470
      enqueue_task_fair+0x122/0x850
      enqueue_task+0x88/0x1c0
      ttwu_do_activate+0x75/0x230
      sched_ttwu_pending+0x2b9/0x430
      __flush_smp_call_function_queue+0x140/0x420
      __sysvec_call_function_single+0x1c/0xb0
      sysvec_call_function_single+0x43/0xb0
      asm_sysvec_call_function_single+0x1a/0x20
     RIP: 0033:0x202a6de
     Code: 89 f1 4d 89 c4 4d 8d 44 24 01 41 0f b6 50 ff 49 8d 71 01 44 0f b6 5e ff 89 d0 44 29 d8 0f 85 01 02 00 00 48 89 ca 48 83 ea 01 <0f> 84 0c 02 00 00 4c 39 c7 75 c7 48 89 4d 80 4c 89 55 88 4c 89 4d
     RSP: 002b:00007fcd9e01a1f0 EFLAGS: 00000202
     RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000003
     RDX: 0000000000000002 RSI: 00007fc2684926c2 RDI: 00007fb96fe862b7
     RBP: 00007fcd9e01a270 R08: 00007fb96fe862b5 R09: 00007fc2684926c1
     R10: 0000000000000000 R11: 0000000000000000 R12: 00007fb96fe862b4
     R13: 0000000000000000 R14: 00000000ffffffff R15: 00007fcd9e01a310
      </TASK>
     ---[ end trace 0000000000000000 ]---

     ------------[ cut here ]------------
     WARNING: CPU: 141 PID: 8164 at kernel/sched/sched.h:1643 enqueue_task+0x168/0x1c0
     Modules linked in: ...
     CPU: 141 UID: 1000 PID: 8164 Comm: mysqld Tainted: G     U  W           6.16.0-rc1-peterz-queue-098ac7+ #869 PREEMPT(voluntary)
     Tainted: [U]=USER, [W]=WARN
     Hardware name: Dell Inc. PowerEdge R6525/024PW1, BIOS 2.7.3 03/30/2022
     RIP: 0010:enqueue_task+0x168/0x1c0
     Code: ee 4c 89 e7 5d 41 5c 41 5d e9 24 d0 ff ff 41 f7 c5 00 02 00 00 0f 85 e4 fe ff ff e9 18 ff ff ff e8 3d f0 ff ff e9 b9 fe ff ff <0f> 0b eb ab 85 c0 74 10 80 fa 01 19 d2 83 e2 f6 83 c2 0e e9 7a ff
     RSP: 0000:ffffd162151ffe00 EFLAGS: 00010097
     RAX: 000000003cc00001 RBX: ffff8bf07e571b00 RCX: 0000000000000000
     RDX: 000000002721340a RSI: 0000014fabb84509 RDI: ffff8bf07e55cd80
     RBP: ffff8bb237533480 R08: 0000014fabb84509 R09: 0000000000000001
     R10: 0000000000000001 R11: 0000000000000000 R12: ffff8bf07e571b00
     R13: 0000000000000009 R14: ffffd162151ffe90 R15: 0000000000000008
     FS:  00007fcd9e01f640(0000) GS:ffff8bf0f0858000(0000) knlGS:0000000000000000
     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
     CR2: 00007fcf3990c004 CR3: 0000000147f9900b CR4: 0000000000f70ef0
     PKRU: 55555554
     Call Trace:
      <TASK>
      ttwu_do_activate+0x75/0x230
      sched_ttwu_pending+0x2b9/0x430
      __flush_smp_call_function_queue+0x140/0x420
      __sysvec_call_function_single+0x1c/0xb0
      sysvec_call_function_single+0x43/0xb0
      asm_sysvec_call_function_single+0x1a/0x20
     RIP: 0033:0x202a6de
     Code: 89 f1 4d 89 c4 4d 8d 44 24 01 41 0f b6 50 ff 49 8d 71 01 44 0f b6 5e ff 89 d0 44 29 d8 0f 85 01 02 00 00 48 89 ca 48 83 ea 01 <0f> 84 0c 02 00 00 4c 39 c7 75 c7 48 89 4d 80 4c 89 55 88 4c 89 4d
     RSP: 002b:00007fcd9e01a1f0 EFLAGS: 00000202
     RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000003
     RDX: 0000000000000002 RSI: 00007fc2684926c2 RDI: 00007fb96fe862b7
     RBP: 00007fcd9e01a270 R08: 00007fb96fe862b5 R09: 00007fc2684926c1
     R10: 0000000000000000 R11: 0000000000000000 R12: 00007fb96fe862b4
     R13: 0000000000000000 R14: 00000000ffffffff R15: 00007fcd9e01a310
      </TASK>
     ---[ end trace 0000000000000000 ]---

-- 
Thanks and Regards,
Prateek

