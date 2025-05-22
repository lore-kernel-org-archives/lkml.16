Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4C54C74
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747889863; cv=fail; b=LjH1M59r3GXsBI3WU/MFs//ddb2sPhu4I87Q59gMGTXPOMq+r1vk94tiSQRz2qDi5np0gePsl5bdWwfHSPr+R38IeefwfLzvDaDgxz9zxsf2jxSPRg+OlbFiAJiH85Pwlns2tOxkaGND6RvzYzfrm14Lmfsg3tBx4wTJsWgn3p0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747889863; c=relaxed/simple;
	bh=L9k+iZaSdBdCNsZlwlBT5PmPz+esMIrAlY4F5/xUCx4=;
	h=Content-Type:Message-ID:Date:Subject:To:References:From:
	 In-Reply-To:MIME-Version; b=DW+RtJbH8xNaxxBMB3zzlCREfF8DHB6GwDvgy7qDXZkeFL11f9xakSmOZTt8QFBpPQDq5ywUA03C/LKtnNUB2XbEAYuanQThoFsmNdbSOz8eZ+yC9SezFkca3BTAqdiBJj2IyCpFdKxazkghPLRvbmeAtqq4dZlJA2XmCur6/yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cJjPwss8; arc=fail smtp.client-ip=40.107.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cJjPwss8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azAmfPjfm5Zv/k33m7KrrMEK7m+xXUcG0ZY4VZdy/S9OJ2jhLbyoJWV5MwO5Si8s15P4IHwx1yGwi3CRuo4CClqTRjSlj1x4f3hd1iS/ZUfVDLOU0fHGfcj7JA/9siStrsxPuFVFz39OTAOD+wq20J6YhDhLHNGZ6cMYQocP0R9+WwIR7bR9i7iRVUZlDYnM4Rk0uDZ5JYxb2ffehP2pcDQ5kTy6ZziW7pN9jVmPcY/K6Ax90jf9XPWp26hIW6hovblQGhx+/9WMmwvcL563UM9WhVOjqik/knN2b3DQtse74i3kdeqriOeLT7bdrE8zNdS/ZdBHCxzGXhUShuX3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuOhvc3vnxXgOQhBJEQCC5vZsoTQ1B1aPCL0EWQ/ccA=;
 b=WGNrttSAHhIrAIywAEtnNR6i5XO15bx/bio7Mm7I1eUpJs1rYze7uUk4jnI7cOrntHQsd7MIdtEgRy0hETpfB+XUj6Aau6hcoh+QTRwSEWWtezvleujch7Jm1swcRy9/SlzzmCdH12XhnHWXFtsNa6eGGb0H8EyemCA3tPn77YPvX0GY5N3Ng0YNGVeMsBX3MOSTkB1TXvyXesTnDXQ6MDp4Rok9pkRIPAlnkC/4IlkTCeX5oWCTO+xa6TvMmU/ottaBMcONNLMHpveHhfi/lmIGVqkCmZEFA7pa+MG9qagJNSbGOmFRtGED73RymnnsbmABNvRhF7ER3fZ00QsVyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuOhvc3vnxXgOQhBJEQCC5vZsoTQ1B1aPCL0EWQ/ccA=;
 b=cJjPwss8V8/Vfc0jAeukjUb0ZdpXybOqcQAx43hIInEDHC8v1Ff/F6FPbs/6JBuexpXGW4I4qep/giuiFbR1+YFXGHAqmCI6cOqaB3+ySbCIoSzUw9I/DvCr28LWAm3Yj9STANXipDfcweal5HylyURgeBu04vuKkBYWiA4i96w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by PH0PR12MB7077.namprd12.prod.outlook.com (2603:10b6:510:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 04:57:37 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 04:57:37 +0000
Content-Type: multipart/mixed; boundary="------------qSO1kzTNTFa2q7l9f3nyR0ay"
Message-ID: <885bd4ff-5b4e-452e-944c-1972517034e8@amd.com>
Date: Thu, 22 May 2025 10:27:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in folio_large_mapcount
To: David Hildenbrand <david@redhat.com>,
 syzbot <syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, dev.jain@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 syzkaller-bugs@googlegroups.com, ziy@nvidia.com,
 Matthew Wilcox <willy@infradead.org>
References: <6828470d.a70a0220.38f255.000c.GAE@google.com>
 <5cdc53ff-ff48-4deb-9551-92bd47590a53@redhat.com>
 <7d20b14c-5739-4556-9f6e-d19cc7e3ee9b@amd.com>
 <ffc5505e-9337-4000-979f-8edcefd91215@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <ffc5505e-9337-4000-979f-8edcefd91215@redhat.com>
X-ClientProxiedBy: PN2PR01CA0084.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::29) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|PH0PR12MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: c9826983-8452-451a-fb17-08dd98ed2ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|4053099003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekQzQ1djcnJQRkpwTSt0QkxNR0lyTC9wL1JubnRNMEUwSkFGWlRoZWFhWnM3?=
 =?utf-8?B?dXFtSHpDQXlNQjVpQS9sUTlKbWZuNExXRGRBL2h3UG1vdmpIaUVmSDRRNHRO?=
 =?utf-8?B?K0JEeldhNERpMGY4NXE0ZnpCUUtNZlE0T2ZtRjFjbWpZZDJjcEZwbDF2eldT?=
 =?utf-8?B?dmF0N2FuaC9oU2o0a3ZwYWNscUl1V2NUVmpXRFBraUdPVWdQeVp5QnFpTUMv?=
 =?utf-8?B?QnhBTnJwRVFxeVlyR1hMVENCZERRQS9aenpnRHY1M2IxOS9GQXZLQWRWVzNi?=
 =?utf-8?B?b1hDM1RGdVdWa0MxaEdiUll3MVNxU05oSmI5TkNvOHFkaXFjc3NFQk9zbUlP?=
 =?utf-8?B?S0hGY3lqTGpEQUEycWw4eHNqTGs1eUNpUGFPSzJRcEN0cTVIZ1JNeVNhY3ZO?=
 =?utf-8?B?RVZhcHRwNHRQbk5ocHZEOVhLSUNDNDhDRm5wNm80S2t2Y2F3MFRFUm91QXll?=
 =?utf-8?B?MWxkNEw4SERHcEZyM2tKZ0JYSW15U05uYTlweC91MmczQ21jcUVVWGFyTUY0?=
 =?utf-8?B?QjN5MHVnZU15ZkVRWklBV3JKa0kzUFhybmNIMTUzYzQ1eWh0a202SWpjUXFR?=
 =?utf-8?B?N0duRG1wMDdTc2lLbVlXOGt5eEJKaFZJdldCOXRNVmVyV013S2tDTFFybG51?=
 =?utf-8?B?azdhbE1FV0t5R1drWDFsZXhQbm5yNGMwUEZvdzVwMDNHUllWZlAwS2lhcjR3?=
 =?utf-8?B?MWRtcE1uc1RHSk5zOUZkUDNGTUdlMG5rRlF3UkQ0RSt4dm4zVUhQQmkxTmhW?=
 =?utf-8?B?c00wTFc5Y1hiRGlLa2FRNjF3T2VmMUNqbktad3FWaTF2MnRscHZLczk0YTgz?=
 =?utf-8?B?OXErUkE1cml3b0RvZVIvK0dnMGVrSUFlQXRhRkZOVnRwamZlaGhKSUtKeE9V?=
 =?utf-8?B?bEZMMWVEUm5lWDFrSnNseWY3dVVsOFdCck9MSkZEUzkwaXdQemhGclZISFJS?=
 =?utf-8?B?L0M4YjZTWlpyMmpUOFZVRzBxbGdIdGNaVkQ5aHV0azlGZFJPNWcwMDJXM3lP?=
 =?utf-8?B?MGp3czdYRnU0MzdTVDhZODE0UlNNdTJWNUFLRzVRSldGNFkzV3RWbVQzYStp?=
 =?utf-8?B?SmY5OCs0b2tpeW9lZkx4M2owWGEzZ1dhZmh1Wk5UaWlrcHJObS9QcmR6YWdh?=
 =?utf-8?B?TDBUZkJuZHpKR1AveXNwQUVXNFgxYi9sY1lPN0V1Z241SXBzQldFdnVaUURr?=
 =?utf-8?B?aS9lSWFTbTEybkJNZnRPdWpuYm9UQnIxMUFKNU9CQlh2S1NFdSt3QWFOaEdV?=
 =?utf-8?B?TmZHWTZKTjFXUkphRE9RM1d6SFE1Nk84NHpzWFVXdnFucklsYnFtM2tQQkFo?=
 =?utf-8?B?QWJsUCtLSXZZOGtUK3hkdHhzQ25meFc0eExNNXhFL1UxUFdySC9LbStHVW1L?=
 =?utf-8?B?YVY3dCtQTXRpZG5zWXFqdHFnSkQ3akVXbWJwYit3aldRWFZFRWxjVVJjYXdH?=
 =?utf-8?B?Y29qajhkV3NaWHkxWkVBektwZ2lOYjFZeTdqbnZDTWZVWFFOOEJyYllYUGQ2?=
 =?utf-8?B?WGg2dDdmdjAyOU9hTFJjS3FZL2hQRmNsMmJwRlUvbm1uWk1qdWliUGpxWng0?=
 =?utf-8?B?Z0dxRWd0MlZkMjV3dlhZRkc2czJ4VStlejBlclB4cXRyWHRZTER3Qi9XNDB0?=
 =?utf-8?B?S2NWRURFZTgybGM1dlNhQmJKbjZhM25jSDlCQTlZVDJRUjU1aXA2N2xXclVV?=
 =?utf-8?B?Vm5Zd3FpMlltb0YxTU5kODM1R3B3bGlObHB1VWpzTjd5Z3Y3eG5pbUt1T3N5?=
 =?utf-8?B?N2xBL3Z5LzczSEtWTExoaUtLdHN4VDZBV3k1OURJMlBiVVRTdDJwNkJRZ2lV?=
 =?utf-8?B?TlFvcTBjVm1WeFIrekNCeXVTSDF3NWJPeVM0TVB3V21lOFcyZ1J1cE1LY2FI?=
 =?utf-8?B?R3A5T0VWbTAxZW84MWQ3aFNUSk8zS3g3OGd6WFpaQkNpd29tRmNoeWJjd0Iw?=
 =?utf-8?Q?veeQ5P+Iqmg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(4053099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkZmdjBSeWRWWDdBYWZweDR4WSszbExENk8zZU1vbHlFVndQSlZIbENVVVRY?=
 =?utf-8?B?WUwzR2kzeXUwOHhvTEg2MklVdm11MFJMcTJxWGRnNE9lOXM3Y0ZHWTRSMXdB?=
 =?utf-8?B?cCsyTGFPbDl1VXR6VFVIUllkVTZOSlVvdVNVcDVGUS90SjYrY01RU0NlOUhu?=
 =?utf-8?B?bjVLbjNVUTVvdFdFcE9PcWh0UkV4bkp2RUtwK1A4WWNtWDRCc0l4ZnhVbFNT?=
 =?utf-8?B?NWo4STYra1gzQWhTVU1LU09SdmZIMko0N0QxN2JsZmtUekJRUU05cWMyME1u?=
 =?utf-8?B?bEdXSkZOZjhEUk9id0VYT3dQYVg5QXRVWHpIb3l1bnpuM2pOWkJ2S1JGekdx?=
 =?utf-8?B?Q1E1NmMxMWUzVk9qNlQ5S2RYaUp2RU4vUHBVMXptYWZ5YTRyRUFpaTlFWjdj?=
 =?utf-8?B?WU01T0VGb0YyWXlkamRzWW05YU43VG1YeEVBaDloMlQ2WGxMSHl6dmFPZHp4?=
 =?utf-8?B?WGlJQzg2Z1A0QSt1ZXl6MWZoLzdVNno0cEpTcVh3bktOVFh2eVZ5UVAxcmJR?=
 =?utf-8?B?SGt0UzRDc0JUYmZ4bnNGL05ROVJITGc5SHkxYWloM3hrYlU5RWF3OVZFMm1J?=
 =?utf-8?B?NThoeCtwTTJjRDh5V0dJTjV0b1ZMMlFUUXVjYXRBeUErU2tDY0JScVBuenJY?=
 =?utf-8?B?YjROQ1l4S0VoMitEZVBJdmVPdHc0eDE5VGZCTlFUVXp5MFYrQmYzQ1FxYlBL?=
 =?utf-8?B?TDVDWFM4Z2NGNlRLSGVyRGp0VWtHbG5lVmwrYXVzNHVvazBjQnJRbE1OWnN3?=
 =?utf-8?B?YnlQSHZZVXB1S2lmWW9OWXFCSm9oRi96cGZndFVCRm9HeWErdUdMVjMrTGRw?=
 =?utf-8?B?Tnlaa09LMHUzVGxNbXdTa2oxcmREcVN0WFl6UG9iQzdPRXBySEkvSERDZ3lI?=
 =?utf-8?B?TE5EUnNWVkgzNmZMMnJ0MmNNWmVwUHNnYXBLZ1JKOS9pcjdHUk5Rc05RSUJJ?=
 =?utf-8?B?OVJxSTBqZVdqNjZPZUlxbnY1cUpUN1lkYW5uUzBjTUZHcUYvVk5LdjVxTksv?=
 =?utf-8?B?TnBhWUFPOTRUSzNiZVRwSXVrNy9uS1h0MDdDMmtBaU5HZjYxdDE0ODM0TVZU?=
 =?utf-8?B?ZWhSa1pJTWRieXRSS2NIN016NVQvbGpwbzFCNWlJTTFzcXlhRisrTHJCRFRX?=
 =?utf-8?B?WWQzUmc1TUZaenY3R3FEWXc1TS96UlRqc3M4NFRWd1gvOUtVVlBXemFQaVYz?=
 =?utf-8?B?cWw2bC9TWFhubFZBRHFkN2hvZG1EQkVlNzdoL1ZHbzZBOHpyYi9Nckd6dHFQ?=
 =?utf-8?B?YTJ1SW0rc0xFQVFpMzhLOHJxWFE5Um1RY21zaTB4NDRkcVZhb2lZOS9XS2J3?=
 =?utf-8?B?WVRhQWpTRFpKd240eDVSYWk5Z0VHcy9oMi80eEhOT01PYlpWd3E1Qm9aMjBC?=
 =?utf-8?B?QmZScTBkanNMa2NsSXNJbHgrekhTcC9tRmc0QkJlVTlLRkt4SzhMR2xlcnFV?=
 =?utf-8?B?Ulcyai9yekUrQm5zOW0yY1JMNFZWZjVyNkhPUlBpRnArb1BjUldQTi9MTk9w?=
 =?utf-8?B?T1FhZy9YUDdQMnR4OGdqVHIrVDUxejFrQ0dTQ3lsa04xUnVnSEJYamJ6SERo?=
 =?utf-8?B?a1NuTk50cFQrY3ZaNmxsYmRxQm54RVFMaEpiZ1BXTkU4KzNBd1FoRlR5cUEw?=
 =?utf-8?B?VVljVTkvcDNOc2M0M0dtckxBSGk0NmVvNlYySWNOa2FmOUxWNWpiaFpZb3NN?=
 =?utf-8?B?RVJCUnNOSVdBdUZiRjBzT3lNeVZYbjhvb2pRNjZ6M2RocW9leG82b1pLaWZR?=
 =?utf-8?B?S0ZxVUEwamZac2pFT0JwbDlNNWxXVVdmT00zcGZaVC81Sm9XMG9hdU1vMHlR?=
 =?utf-8?B?RzRFZGM1bFRScmJIWWk2Y2kyeVY5dXp1U1oyZjlOUlNmUkw5L21tV3JGdFQ3?=
 =?utf-8?B?YlN4VXlybyt1RG5EOC9mUklKZUV0WnNzb1NscmJ5elo2eWxxTG1jZXVzZGx5?=
 =?utf-8?B?MXBSODhwTXNIM1dTMWxrVzg3aXorRVZYU2NlT0lLd2FnWnVYSEhKM1dmcU5i?=
 =?utf-8?B?SDR3TTkrRHR5OHE4ZzVJOXppNkhpamtSQ1BFaTJ2b2EzVDJxdVpmUkhjcDkw?=
 =?utf-8?B?bzFLVitOdVdZQW95YzNZK2FPN0RkakNyM093WkZyWVphcUFEemtkYTBEclNU?=
 =?utf-8?Q?RzE4jjZo+nYT5d1EizlO4wJQF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9826983-8452-451a-fb17-08dd98ed2ba0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 04:57:37.3187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZWg0KBIoCDv+A/w5TaFbbtL5Y+KYj/KroZNlGKAvxzLt8Wk3sZTCMGyAtkvFoSZVFofW7X1iCuWehxr+lW1E6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7077

--------------qSO1kzTNTFa2q7l9f3nyR0ay
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/20/2025 7:35 PM, David Hildenbrand wrote:
> On 20.05.25 07:45, Shivank Garg wrote:
>> On 5/19/2025 6:56 PM, David Hildenbrand wrote:
>>> On 17.05.25 10:21, syzbot wrote:
>>>> Hello,
>>>>
>>>> syzbot found the following issue on:
>>>>
>>>> HEAD commit:    627277ba7c23 Merge tag 'arm64_cbpf_mitigation_2025_05_08' ..
>>>> git tree:       upstream
>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1150f670580000
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=5929ac65be9baf3c
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=2b99589e33edbe9475ca
>>>> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
>>>>
>>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>>
>>>> Downloadable assets:
>>>> disk image: https://storage.googleapis.com/syzbot-assets/0a42ae72fe0e/disk-627277ba.raw.xz
>>>> vmlinux: https://storage.googleapis.com/syzbot-assets/0be88297bb66/vmlinux-627277ba.xz
>>>> kernel image: https://storage.googleapis.com/syzbot-assets/31808a4b1210/bzImage-627277ba.xz
>>>>
>>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>>> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
>>>>
>>>> ------------[ cut here ]------------
>>>> WARNING: CPU: 1 PID: 38 at ./include/linux/mm.h:1335 folio_large_mapcount+0xd0/0x110 include/linux/mm.h:1335
>>>
>>> This should be
>>>
>>> VM_WARN_ON_FOLIO(!folio_test_large(folio), folio);
>>>
>>>> Modules linked in:
>>>> CPU: 1 UID: 0 PID: 38 Comm: khugepaged Not tainted 6.15.0-rc6-syzkaller-00025-g627277ba7c23 #0 PREEMPT(full)
>>>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
>>>> RIP: 0010:folio_large_mapcount+0xd0/0x110 include/linux/mm.h:1335
>>>> Code: 04 38 84 c0 75 29 8b 03 ff c0 5b 41 5e 41 5f e9 96 d2 2b 09 cc e8 d0 cb 99 ff 48 89 df 48 c7 c6 20 de 77 8b e8 a1 dc de ff 90 <0f> 0b 90 eb b6 89 d9 80 e1 07 80 c1 03 38 c1 7c cb 48 89 df e8 87
>>>> RSP: 0018:ffffc90000af77e0 EFLAGS: 00010246
>>>> RAX: e1fcb38c0ff8ce00 RBX: ffffea00014c8000 RCX: e1fcb38c0ff8ce00
>>>> RDX: 0000000000000001 RSI: ffffffff8d9226df RDI: ffff88801e2fbc00
>>>> RBP: ffffc90000af7b50 R08: ffff8880b8923e93 R09: 1ffff110171247d2
>>>> R10: dffffc0000000000 R11: ffffed10171247d3 R12: 1ffffd4000299000
>>>> R13: dffffc0000000000 R14: 0000000000000000 R15: dffffc0000000000
>>>> FS:  0000000000000000(0000) GS:ffff8881261fb000(0000) knlGS:0000000000000000
>>>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> CR2: 00007ffe58f12dc0 CR3: 0000000030e04000 CR4: 00000000003526f0
>>>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>>>> Call Trace:
>>>>    <TASK>
>>>>    folio_mapcount include/linux/mm.h:1369 [inline]
>>>
>>> And here we come through
>>>
>>> if (likely(!folio_test_large(folio))) {
>>>      ...
>>> }
>>> return folio_large_mapcount(folio);
>>>
>>>
>>> So the folio is split concurrently. And I think there is nothing stopping it from getting freed.
>>>
>>> We do a xas_for_each() under RCU. So yes, this is racy.
>>>
>>> In  collapse_file(), we re-validate everything.
>>>
>>> We could
>>>
>>> (A) Take proper pagecache locks
>>>
>>> (B) Try grabbing a temporary folio reference
>>>
>>> (C) Try snapshotting the folio
>>>
>>> Probably, in this code, (B) might be cleanest for now? Handling it just like other code in mm/filemap.c.
>>>
>>
>> Hi,
> 
> Hi,
> 
>>
>> I've implemented your suggestion (B) using folio_try_get().
>> Could you please review if my patch looks correct?
> 
> You should probably drop both comments, the code merely mimics what filemap.c does.
> 
> Apart from that, nothing jumped at me.
> 

Thank you. I have attached revised patch.

Best Regards,
Shivank



--------------qSO1kzTNTFa2q7l9f3nyR0ay
Content-Type: text/plain; charset=UTF-8;
 name="0001-mm-khugepaged-Fix-race-with-folio-splitting-in-hpage.patch"
Content-Disposition: attachment;
 filename*0="0001-mm-khugepaged-Fix-race-with-folio-splitting-in-hpage.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBlNzc2OTNiNjdhOGMwMzJkNjM2ZjZjMGJjM2YxNzljNGU5Y2MxMTMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl2YW5rIEdhcmcgPHNoaXZhbmtnQGFtZC5jb20+CkRhdGU6
IE1vbiwgMTkgTWF5IDIwMjUgMjA6MTk6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBtbS9raHVn
ZXBhZ2VkOiBGaXggcmFjZSB3aXRoIGZvbGlvIHNwbGl0dGluZyBpbgogaHBhZ2VfY29sbGFwc2Vf
c2Nhbl9maWxlKCkKCmZvbGlvX21hcGNvdW50KCkgY2hlY2tzIGZvbGlvX3Rlc3RfbGFyZ2UoKSBi
ZWZvcmUgcHJvY2VlZGluZyB0bwpmb2xpb19sYXJnZV9tYXBjb3VudCgpLCBidXQgdGhlcmUgZXhp
c3RzIGEgcmFjZSB3aW5kb3cgd2hlcmUgYSBmb2xpbwpjb3VsZCBiZSBzcGxpdCBiZXR3ZWVuIHRo
ZXNlIGNoZWNrcyB3aGljaCB0cmlnZ2VyZWQgdGhlClZNX1dBUk5fT05fRk9MSU8oIWZvbGlvX3Rl
c3RfbGFyZ2UoZm9saW8pLCBmb2xpbykgaW4KZm9saW9fbGFyZ2VfbWFwY291bnQoKS4KClRha2Ug
YSB0ZW1wb3JhcnkgZm9saW8gcmVmZXJlbmNlIGluIGhwYWdlX2NvbGxhcHNlX3NjYW5fZmlsZSgp
IHRvIHByZXZlbnQKcmFjZXMgd2l0aCBjb25jdXJyZW50IGZvbGlvIHNwbGl0dGluZy9mcmVlaW5n
LiBUaGlzIHByZXZlbnQgcG90ZW50aWFsCmluY29ycmVjdCBsYXJnZSBmb2xpbyBkZXRlY3Rpb24u
CgpSZXBvcnRlZC1ieTogc3l6Ym90KzJiOTk1ODllMzNlZGJlOTQ3NWNhQHN5emthbGxlci5hcHBz
cG90bWFpbC5jb20KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNjgyODQ3MGQu
YTcwYTAyMjAuMzhmMjU1LjAwMGMuR0FFQGdvb2dsZS5jb20KU3VnZ2VzdGVkLWJ5OiBEYXZpZCBI
aWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU2hpdmFuayBHYXJn
IDxzaGl2YW5rZ0BhbWQuY29tPgotLS0KIG1tL2todWdlcGFnZWQuYyB8IDE2ICsrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbW0v
a2h1Z2VwYWdlZC5jIGIvbW0va2h1Z2VwYWdlZC5jCmluZGV4IGNjOTQ1YzZhYjNiZC4uNmU4OTAy
ZjlkODhjIDEwMDY0NAotLS0gYS9tbS9raHVnZXBhZ2VkLmMKKysrIGIvbW0va2h1Z2VwYWdlZC5j
CkBAIC0yMjk1LDYgKzIyOTUsMTcgQEAgc3RhdGljIGludCBocGFnZV9jb2xsYXBzZV9zY2FuX2Zp
bGUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJCWNvbnRpbnVl
OwogCQl9CiAKKwkJaWYgKCFmb2xpb190cnlfZ2V0KGZvbGlvKSkgeworCQkJeGFzX3Jlc2V0KCZ4
YXMpOworCQkJY29udGludWU7CisJCX0KKworCQlpZiAodW5saWtlbHkoZm9saW8gIT0geGFzX3Jl
bG9hZCgmeGFzKSkpIHsKKwkJCWZvbGlvX3B1dChmb2xpbyk7CisJCQl4YXNfcmVzZXQoJnhhcyk7
CisJCQljb250aW51ZTsKKwkJfQorCiAJCWlmIChmb2xpb19vcmRlcihmb2xpbykgPT0gSFBBR0Vf
UE1EX09SREVSICYmCiAJCSAgICBmb2xpby0+aW5kZXggPT0gc3RhcnQpIHsKIAkJCS8qIE1heWJl
IFBNRC1tYXBwZWQgKi8KQEAgLTIzMDUsMjMgKzIzMTYsMjcgQEAgc3RhdGljIGludCBocGFnZV9j
b2xsYXBzZV9zY2FuX2ZpbGUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRk
ciwKIAkJCSAqIGl0J3Mgc2FmZSB0byBza2lwIExSVSBhbmQgcmVmY291bnQgY2hlY2tzIGJlZm9y
ZQogCQkJICogcmV0dXJuaW5nLgogCQkJICovCisJCQlmb2xpb19wdXQoZm9saW8pOwogCQkJYnJl
YWs7CiAJCX0KIAogCQlub2RlID0gZm9saW9fbmlkKGZvbGlvKTsKIAkJaWYgKGhwYWdlX2NvbGxh
cHNlX3NjYW5fYWJvcnQobm9kZSwgY2MpKSB7CiAJCQlyZXN1bHQgPSBTQ0FOX1NDQU5fQUJPUlQ7
CisJCQlmb2xpb19wdXQoZm9saW8pOwogCQkJYnJlYWs7CiAJCX0KIAkJY2MtPm5vZGVfbG9hZFtu
b2RlXSsrOwogCiAJCWlmICghZm9saW9fdGVzdF9scnUoZm9saW8pKSB7CiAJCQlyZXN1bHQgPSBT
Q0FOX1BBR0VfTFJVOworCQkJZm9saW9fcHV0KGZvbGlvKTsKIAkJCWJyZWFrOwogCQl9CiAKIAkJ
aWYgKCFpc19yZWZjb3VudF9zdWl0YWJsZShmb2xpbykpIHsKIAkJCXJlc3VsdCA9IFNDQU5fUEFH
RV9DT1VOVDsKKwkJCWZvbGlvX3B1dChmb2xpbyk7CiAJCQlicmVhazsKIAkJfQogCkBAIC0yMzMz
LDYgKzIzNDgsNyBAQCBzdGF0aWMgaW50IGhwYWdlX2NvbGxhcHNlX3NjYW5fZmlsZShzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkgKi8KIAogCQlwcmVzZW50ICs9
IGZvbGlvX25yX3BhZ2VzKGZvbGlvKTsKKwkJZm9saW9fcHV0KGZvbGlvKTsKIAogCQlpZiAobmVl
ZF9yZXNjaGVkKCkpIHsKIAkJCXhhc19wYXVzZSgmeGFzKTsKLS0gCjIuMzQuMQoK

--------------qSO1kzTNTFa2q7l9f3nyR0ay--
