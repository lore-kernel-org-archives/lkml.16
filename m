Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F9F190072;
	Wed,  2 Jul 2025 19:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483109; cv=fail; b=G0aL9HW7cwldkIvncdSXcmOGU2TlcN6trH63+r4ecG5vwzDzajnqXmJ+fTnVI9lQgK66V6/Gc2F8bkH+YiGSlivWRCq4y9NZjdobaK/d6pMATHavywer2G1efAKEULzRu9flp4NE+eLQmiTFhyZHHFkxuya1uwA8piUgHM0krdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483109; c=relaxed/simple;
	bh=TEwQ5fOYhhWI9b3MMbJtvNoUntJr0UW4RKDGlFnJXFo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EzjKxzRBGKOMwecyHrxZoJf2haiFJWjS9BFd34OVrAhozOeCE/f0l4c7ZPWm9ExI+6gK9WPJIJfggicwsiAJOWkEkuTvq5CqVYhCG4dLRPGsNufRbi+9Vf4JxDTMLXz2KL5eBL9VqdBJ3Ofsqv0VJi3zN/kMeTKi7r2ZDO9kdIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OQ7RD8eZ; arc=fail smtp.client-ip=40.107.223.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OQ7RD8eZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T69L8eCH7tloS4mLsaaF6KoERlRFu481XaEZQmSkfyo9ha5paTl8bNYV0JaqLsqpP9BOpGb8Dceg4odJWnFTvE5rXEofzQLpQ/tmrDfr7wCU48/v9RTUsAOfHXiqFuUvBLM3jr5vVZDuJlAt6/hLePw8pEXzQA/8y6ede3T4EirhWRcHcnZka1pFVTH0AOWJYTyNo2ATjI96P90dWbp3GA20yKd+keHee9BStN/JjHWVgQMFpIpwXd9tJidWqWvarv3rz0n2JGWpTPjTUtm76Dh267i4PmEWggScqrjqh9nI38Dgl+L4dvDxeRMm0izNMorCF6vGW9yCIapyaPzcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2lJ+OWvvISQbW7hCZbmpA8ORrQxuWt9Qquiz50k84E=;
 b=gOrTHihmLEor1pLic4CgrsDJdNyq+zevO0mnkr8EF1kyXZ50kQYGVUXx9LWSvAiEMTs86hqYVcHM4FVExQmSCmzdttfvx1uWQz1rY8PIFjm5wBTr3tuALuek0SWjFzL54zHIei4ukQlaskbwt+PjpBfrPsXAK8lUwdTIRD4EorWeCstl8Usd9M7KbgvBJm0ZX8OkBDPXyDrrZEaFBTzKOV0A5Bm8Y50TSluAQkBe97UhkM0p7smcFOi8PxWKYa3FvzcTQllC1G/HUW48jReRHNLy1R2rdKpua362GVVr9JANSzgWdpV6AjP7WtFfSUwuTDjjlV4O/qJJkFcR5XFdLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2lJ+OWvvISQbW7hCZbmpA8ORrQxuWt9Qquiz50k84E=;
 b=OQ7RD8eZmzE8iuKIZEu0Bfw4asVhErSS/bjsIAC6srsMwwLJjyfTfBji9ukn1+ZgbG+wIU0MV/+xndJ3gAYkOIBHDLZsni5CHnwve2Qg7CTDK6jyUQJeNnFyDXuZ7xKZbgd8YP4FFrg/fq2svZ9hS7y4p2eRFGQXdnZax/jvlCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by CY8PR12MB7218.namprd12.prod.outlook.com (2603:10b6:930:5a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Wed, 2 Jul
 2025 19:05:04 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f%3]) with mapi id 15.20.8880.034; Wed, 2 Jul 2025
 19:05:04 +0000
Message-ID: <471975cf-1094-42dd-a965-f536cf399d0a@amd.com>
Date: Wed, 2 Jul 2025 14:04:58 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 30/32] fs/resctrl: Hide the BMEC related files when
 mbm_event mode is enabled
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
 <4769751d1de7c4f66b1c7f3c5ea7eeeb49951363.1749848715.git.babu.moger@amd.com>
 <3c753f3c-e91b-4cfe-983d-efe8ff07b750@intel.com>
 <f85e467a-1d17-4f34-98e3-512679baad47@amd.com>
 <ff314427-1c03-4e26-be19-c5f5090f3d8a@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <ff314427-1c03-4e26-be19-c5f5090f3d8a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:805:66::32) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|CY8PR12MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: e63b3b35-91da-4d72-5ffd-08ddb99b5a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L09VMjFmemdKNDV4TWxKQm1ZMHhlZHpEZGRlUWNVYUtuUWdhVmlVK1NvWFBW?=
 =?utf-8?B?RUJrM3ltbXo2a0V4ZllDTzNsaXJZeHg5WUF6dDJvdHdFdjZxZGVsTzBPSnRL?=
 =?utf-8?B?djhZelgxNmpiMWh4TUpGdkdDUFdMTzA1QUJUb1BvRGthaDZXbW1mNUlXSnBv?=
 =?utf-8?B?M2RlSzBNWC9JSURhU0dPZUFsV0FySnAvTFVPQTFIRVl4ZDd3Vmk2eEZmTWR2?=
 =?utf-8?B?THQ3MVhvbkxjYVpSSnpzaXNGeDliQUlkWFp2cVF4SHA1U3ltUXdiUW5XbnVj?=
 =?utf-8?B?NFlqRy9OZFkwQi9TdE5MTitLc1F5OWsxTnpuaDBUTGR5L2xBTHBncnBtQUhr?=
 =?utf-8?B?STFQOTJtODd6WmQwaks1S0w1clBnZ2RkQWxZcVVqSEJBeFQ0SEloSHpDWTBj?=
 =?utf-8?B?VjVmS2xzUkxVbC9pejVJa05Pd09yZ09uYkFIUDY4OUREd1BxMHlwdXRIWW9O?=
 =?utf-8?B?dFREVnNXcnFidk81ejdpcnVWTGVXKzA1ajVVSVdoSkIvaEUxbzFuMFpHdm0r?=
 =?utf-8?B?RmZVN3pHc3VMSTJqSzJTVzd2eGpzYmJWbjlZTlcycWN1NEJZZGk1UDFnejZM?=
 =?utf-8?B?TWFKU01ESEFGVG9RbFpNb1Q3Q2xaWndIU05sWWw5SFZINyt2Y3RoYXlPT3cx?=
 =?utf-8?B?eERjM0tFL2w1ZTNRbktCRHdGZitVZEN3YU1qOXRUUXZmcytoUjBkaEgzL0Rn?=
 =?utf-8?B?ZzFRMVZ5c2FyQUlhUHpCUmIzSDBia3IxVmNnZHg2UVA3WStHZTR5dmhlUEZL?=
 =?utf-8?B?ZVJCL3BqNFpIemZRR0VYN0FRSDRJTGFOR2cwS2xScHJNYXkvNTV1d0FqL1RF?=
 =?utf-8?B?L2JBRXJNSWkvcFV6Q01GcVRLc0tDa0YzYWk4eDZwYkdHeEpOSlNGZzNUUlNL?=
 =?utf-8?B?djFENjZkeHE2YTBKbWNKU0U4cUNyWG5BYnU4V1NlNmhPbGY4K2Jhdkw5TFRP?=
 =?utf-8?B?RkkvaGY5NEd6ZW9UZFU4N3JvbXplRWNya2h4VWJKbGdGUFc4QjRjT2tXa0tI?=
 =?utf-8?B?MW9xaEhHVUl4ZWhIQWp2NmFTSUdBTlZRajgvUUszVGtDNm52djR0S0NLdUxj?=
 =?utf-8?B?TjRFZVU3aTZWeU5pNnVlWUdJQmV5N3V5TUpwS0dtYmNYL2hHYTIrRnZwQkYz?=
 =?utf-8?B?RXluaUgrbXlaZThXOVVxNXBPYkJ2VVNWOS9tSzNGUDV4cUFIbCs4d3NyTEly?=
 =?utf-8?B?NzhHUEpwWEU3clRKNmJST3NLbUNKOEh5MEdDUFhaWk9CTWJGa2pZa2JicWtF?=
 =?utf-8?B?OGVQM3BSN1Q2ajU4cE5mVWF2QlpTNzRNN3dBOU9PQlE1VmNZM0RROFN6SEdZ?=
 =?utf-8?B?aXpHRjRuY2RscGQwVzc1U3lVWFBpQXp6eGliR25FMTBWTWpKcjZPcVlwcTgv?=
 =?utf-8?B?OGYzU3lKT05GNDZUQU5YM3p3QWJMTGdZQzJnWi94dnVBVS9nb3dUUnp2dVR6?=
 =?utf-8?B?bUdoUTBDd0JBYkp4TzNYcS85MWhKRmVnbVJ1dVJMM09wZ0p4cldDaXdkSFpN?=
 =?utf-8?B?Wjh2bnd0bDZiYXRvUEc2U1REUzZURUgzZnVjV2ZTZU5mUHhFMUIrREI3aEFO?=
 =?utf-8?B?MlRBREpDdUdpbVY2WGhIZnVkUkpoUDMyQTJkNisweW9LMldKU0xKeUNwTk9J?=
 =?utf-8?B?QlJTOW9ZZFlGLzVXcUpnTnhnZDhZTmtWb205OGdhaEZDQUFaLy9Eb3ZyNWVQ?=
 =?utf-8?B?Yk5UQ2lYN3ZJZmdsU3VPL0VnS1Vtc09OS1poTDBZK25uYnNycFJHSlBoTWlO?=
 =?utf-8?B?T0NrMEJYS3c4VjhYbnJzSzNiZ21tYWJ4VThqbjdyTHp4RG16NXRTcGllNU1R?=
 =?utf-8?B?SFlzU0JLZ0xPVkxZaU54UFFuRmw0QkhQejU0blZ0cDlXRTQ3SThCb01YMTlI?=
 =?utf-8?B?ODI4QWN6YnRNL2pLNGVyd3d0NWlYWXphNzVXTEtsNlU1MldnVkllVk91T2Qv?=
 =?utf-8?Q?/owGm/OMadc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW1jWlUxYk1SRDhlWXBQb0pwNkoyQnB1eWVwTXllSU1rcTdJYWVUbW91ZTJv?=
 =?utf-8?B?K3RtZHNkd0JmYk4vWndlQXo1R2FCdVA2U253L08wWjdLdngvNWp2R2JVcFdJ?=
 =?utf-8?B?cVRiSGlKandjTkJMOTRJeHlFZUJueUg5SUhVU3VDdHdhNFpCN0hGSUJaK25a?=
 =?utf-8?B?MlpSVExsSXNJMHRCWmVIUWZNMmpOVklUNGZOTVZBQ2xjQnN0VldTRmhINDN3?=
 =?utf-8?B?VDVnMjJEeTNPbFM1bG5XM2NFV1BkYzlvTGlNcW1TUDZBcDZ4aTdFamtXc1or?=
 =?utf-8?B?cHlhWjQ2Tm4rQXNkMElTNDJSVnA2WWRXRmtvTnprR1VyNERBMWNYWlJwZ1dX?=
 =?utf-8?B?a2xmaEp6aE5qOXIvZVovNjBzUHVDaXlDcUtDZmpST3Vlait5QW1OWlJoRHBm?=
 =?utf-8?B?QjhJZjBVa2FuVjNLSkFJV1lVSFlYQVFLalZvQjI1d3luYUVpVGZwVGVkTUxk?=
 =?utf-8?B?RjhVTDFUd1JVVDhZbmt6YnpOaHlCTHFVbHhJOWplT2dhQm8ycVRUeFZ6eFBH?=
 =?utf-8?B?bFQvd2loTjg5WkJxZE9pbllhZmdiQnRyYTY3ZjJiMVovbytSazFBdU45VkZJ?=
 =?utf-8?B?STBVR2g4a2k3enpaazh4TVZYSmgxV1VMRGcxZzlaNEN2MVMvUHVDeGprenN0?=
 =?utf-8?B?M2wxYUUvZGdoRFlHY0hCVlZvakZWd0dzc1NlcEFmNzlNSFdSYkdCeGtQZXRs?=
 =?utf-8?B?cEJsRUhYS3RENUZROVpxbXRya085bzB1NS9teUR6RThTeExYUFEzT3lCVmFU?=
 =?utf-8?B?VVlGZVE1WDBtY3VoY0RxUmFSYVlLS1BaWEFUa3ZjcXo3ekdVWUM5UU1IYkdF?=
 =?utf-8?B?dUFKSndpSHNjNjFiMXR0ZGhCRjBJY0ErdVBnNTBaM094OFFWQjV0VmN1Y1Y5?=
 =?utf-8?B?YnE3eFF2T3VNYk5QKzNYRGl1LzBWY2hTMVNIVHYxMVoxeHJneXFMamN3d2FU?=
 =?utf-8?B?VnQxMzRiM3BDTE9kZE50L3NPYlhLNDYzTEJMdWppSFBqbFJZeTM2SFh3eHhP?=
 =?utf-8?B?UXFGVXh0cmpXMStOVHNBNjhMZU5pNTBZMkxhTmtlZ3g1cG5pSjJ6cGVzMnhL?=
 =?utf-8?B?OGNGbk5reENjV250UG1zYU1xRFdkbzAraDZDQ1BWMXdkTHlqNlI3M05ua3RI?=
 =?utf-8?B?YjJRSmYxazYzc2VNZmw2TXF0anhiUDJXU0d0L1NqWUM3MkFKL21mcnQ0Q282?=
 =?utf-8?B?TGFndThiTTdqc0I5OCtWT0lCNTRpNkdJKzArbGx5Q1lpZkZvaVd5SVpZQmE2?=
 =?utf-8?B?MjNwclEyaCtkM09RTUZnSk5yOGJ0NFNqTWhBYkpzd2t5N1RXWEd1S1lxcmdr?=
 =?utf-8?B?MEJqelZjOFZxV2d4UVpiQWxVU3RySXZKU3Rad01CTEVQbHBOWGlEekxNbkdR?=
 =?utf-8?B?RDR0T3M2Z00zSG5kZ2NoTkpOWHlUNlNCZzYvOGc4cURPYmR6bVhiMnZUMHpV?=
 =?utf-8?B?dlZuYzd4bi84R3d1TDVjU2hqUnhqWUlmSG1XbGN5YjB5TWRsaFordk1SRitO?=
 =?utf-8?B?YTVGeGNEQUt0ZWx6dnhDU1doTjE5Wk9pbXhaYVFQL3kwNEViZkt2N0NBV1lr?=
 =?utf-8?B?VFBrazRjSWErd3pEeFF3clM2aDJZdi9hYzRObEY1MlBJMFNtamlxOVZTNS9X?=
 =?utf-8?B?Q0J3RlNZOVVPOUlDdC90RjZJWUMydzJXMEpaRFd2cnJXZGxLR3BycTRzb1h6?=
 =?utf-8?B?WDZvNkZadXo1Y0hDS1NvR3NsMHIrdGFHYWgrRUtGTzB4VmpxU0NoYmd1R0Vm?=
 =?utf-8?B?ZTVLeStHNlVBN2N2bUhLOXVpcno5ZWtMNktuRG03TG5yRkVNN2VxTFF4bUh2?=
 =?utf-8?B?ZytwRDFnOFhUb21oOCsxdk9wUThwby9QaXJ0dWpuMVFwSlpFL0xXeEtuei85?=
 =?utf-8?B?b0JsZ3hRL0JSSXA0Y1Zsbm11Q2tUQkJhQStCVWFFdTZUUUwzd3BEbHVpUU1r?=
 =?utf-8?B?azAwRDdPWU11NWRWMnErZERsY1BQSHVBRUh5SGhBQ05ETjJmSWh5RmxHWnRs?=
 =?utf-8?B?SVpuZU0wNWdsT2JQNXB2dGI3U2tYWVNhMzNvSUozN3FOK0JpTjAwbDBMLzFG?=
 =?utf-8?B?cGxQOVdNYzdxeWhrVGk2a0xIdzFkbHJ2UTZYeGNwVmpDbkhIb0IzRTAybEMx?=
 =?utf-8?Q?/Ge8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63b3b35-91da-4d72-5ffd-08ddb99b5a63
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 19:05:04.5529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFVz+BFNfbjKc8kH7bINMq9y66RD71rB1evVrHmZ80pmJUwx0Km77KbAsFa5zvyt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7218

Hi Reinette,

On 7/2/25 12:21, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/2/25 9:42 AM, Moger, Babu wrote:
>> On 6/25/25 18:39, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 6/13/25 2:05 PM, Babu Moger wrote:
>>>> BMEC (Bandwidth Monitoring Event Configuration) and mbm_event mode do not
>>>> work simultaneously.
>>>
>>> Could you please elaborate why they do not work simultaneously?
>>
>> Changed the changelog.
>>
>> When mbm_event counter assignment mode is enabled, events are configured
>> through the "event_filter" files under
>> /sys/fs/resctrl/info/L3_MON/event_configs/.
>>
>> The default monitoring mode and with BMEC (Bandwidth Monitoring Event
>> Configuration) support, events are configured using the files
>> mbm_total_bytes_config or mbm_local_bytes_config in
>> /sys/fs/resctrl/info/L3_MON/.
> 
> A reasonable question here may be why not just keep using the existing
> (BMEC supporting) event configuration files for event configuration? Why
> are new event configuration files needed?

New interface that enables users to read and write memory transaction
events using human-readable strings, simplifying configuration and
improving usability.

In future it can be extended to create free form event names.

> 
>>
>> To avoid the confusion, hide BMEC-related files when mbm_event counter
>> assignment mode is enabled and update the mon_features display accordingly.
>>
> 
> Reinette
> 

-- 
Thanks
Babu Moger
