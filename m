Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6133C2E92D5;
	Thu, 26 Jun 2025 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947592; cv=fail; b=o6w3c4Q4xSIOFQsEWCct13Dxsj3w6ovbBG7efL0XGTI/O3QZ6Rg7Ux3QXEdrcXQXfy0OuvN4RA5CjZcB9oQVfV8updAeAFzHyYPiHbREQGVhyuBZE7GO65nSm6wFVP+RgfL/N7wabNewZZwZAiWtJmygFG+p6HQkfXKILmfmmlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947592; c=relaxed/simple;
	bh=qkeRe+2ZlxJO6MI65L3cg1fe31OqdUkCOodxeJMnsNs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sfQeqwfeBN6BEpx5n49VA8N9sm+R9pUb4qCCy+XD5slbjdfKTHlyHQXFr8w2jfoyJzrC7Yrdg+yJNthZto8R7kq5QoFmEmYlqiCMwrBto17lTQ+dksmmcnWP23dAq/uxRHDVjdXUIGQieNCfjgktKSqFwoYfQseFpd12EL2pgdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PufCAB/q; arc=fail smtp.client-ip=40.107.236.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PufCAB/q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ky7/mNPbiPK1LjutaWmaJHhxnw7UEtztQRjJ20+Eex5JA4cWENy0JfjaDL0taW7YQy+pemL/9zD5fDy6Ld0MRfUNyFFHn2QLZfme7OO65GgqK6Lyu1aWEwuCf/ewvb64f/YdGNxUDN723DOBzcP+vuOTiCZLjg0f9RJ5/n/yrtWUmMNP6ZwGg8Dr/PmJMzGYYY/ajhZ5u2fAN9McsJtiYCbQdEJzw2qW/HqT5R3uabo1wWw3f7re84M7V8Vnhpn0HcRFK/Oqx1vxgvS3dtlbHhsXOquzcz1Jtp1GONvNdEqI0oZgtRlJd+4TmQOk33CJMmH3PciiXjcbBvWvkqqU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hfkbGdbKhLslRzTLhArk6iUcvb55E0jtRcyLP/CaUc=;
 b=qie3TXR1WyIpa52UyIEaDQ/OSD90OnEGSqlRSfBENc/JcMFWuvQio1uU0Elj3uJBAOGhiIHiSfncdwPEdws48pdyndRhUhqJeDnqjkWoJbpC9/RsxYm7QGFb81+kJQdsCGuawOgWUxjdF6Y/4f9/jWyJGlZ9OKOPVYz7bIEeIJ+z/PdGNlAaOInJtkUtVW2exWZRc4UVZaFbe5MkNkhzWvLjrimxfXrvdAzlDJMECgo1WJgQCTpbkcowlPdpH7PTQWM+6muaP+f3mJ0BIThKdneUGmjQOikuTO+6EnryvwUYG6wH2uZKAvD9EPAVaSLpYRQvS58Brs9XKUNo9LgYTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hfkbGdbKhLslRzTLhArk6iUcvb55E0jtRcyLP/CaUc=;
 b=PufCAB/q/YmCyNsBVmksJ3EX4diOzh9ZhTqDeUfH8IKTa05XFbYX39xD6RnKEXVM5QZNCaTKSGyOfoCkntYGnmVzAG6dLWIbU0w5gRIpNddfVViQ4cPz1ZnyTVRoXaauJzSb3rIDKfmiPc3GKufmq93GDDwTDDUAyzSpqYhgLbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN0PR12MB5860.namprd12.prod.outlook.com (2603:10b6:208:37b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 26 Jun
 2025 14:19:48 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 14:19:48 +0000
Message-ID: <bbac36ef-e03e-4c73-8975-38ff2c85183e@amd.com>
Date: Thu, 26 Jun 2025 09:19:43 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 14/32] fs/resctrl: Introduce interface to display
 number of free MBM counters
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
 <ad9a9feca7638f9be09e348e3647d010a1a5db61.1749848715.git.babu.moger@amd.com>
 <d0e29689-c2c0-4283-a688-f5de92b2df48@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <d0e29689-c2c0-4283-a688-f5de92b2df48@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:806:120::13) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN0PR12MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: 1521a843-b786-437a-5727-08ddb4bc8199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXpBbDNiczVqaWI5aWRIeUlsN204QlIvVXVkNnNEWHIwUUd4eDlvbW4xQUpM?=
 =?utf-8?B?TVJGNm9JREFuS3M2RHZTU0Q4NExiV0w1SmtsYWh5WUNMZWNlUU1vL0pWa095?=
 =?utf-8?B?anR3VzkwMjJ5U21JQnRHYnFsWUc0R2NoYk9RT0cwQnVDL3Qvc2pxWlRHRm1F?=
 =?utf-8?B?RzhZWU9FdXc5TElxa1g4YWxKaE41MVIrSktSVDh6bks3aE5Ec2NCdHpUSmto?=
 =?utf-8?B?R2RuRUlXQU54bFI2dE9oWUt6My8zS21xWDNiRUtMNk52OWpOWTJNdlEzS0tU?=
 =?utf-8?B?Z2xwTlBvVzZ5VG11U3U4cXZOVHhGUGNkaXZoaWdjdFZtampwWkR2YjZ1bjhq?=
 =?utf-8?B?MTVBbFVjTyswemRycURYaHc5NUM5ZXBiU0VpbzU1WDJKYkdKTWJwWHRJVFg0?=
 =?utf-8?B?d2diWDM2NlRINTV1bGpXQlNyZmc4OHA2b1g2ZlFqc3pGbU1XeTZCNUtMRnJV?=
 =?utf-8?B?Ym5CMFN1OGJORkJWai96TGRTdGZUTllTbnBQUEpPa0dhMDVuR2Erc1RrTWds?=
 =?utf-8?B?S2FrSW0yaTJJYktmY0pqcFhjRE5oQWxXYkpPQTg3cE5uQ3ZJZnRHYlJvT2hJ?=
 =?utf-8?B?LzZTdFM2dUovWjlobitxdXVzUjVVRS9mZHZYd0Z5dW9FQjhZZ3pmdkpXR0Zh?=
 =?utf-8?B?OEdOWGFsNzlHT01MamY5MzdzOHp3b1B1V01KUmw1ZDN6ZVB0Tm1uOHZNT2dV?=
 =?utf-8?B?S0dzc28zUURtQ3drRW9iRmtFbGdkLzcwdHFoN09uaHRNdFJFMndLcUw0ckRu?=
 =?utf-8?B?Tms0NjFtU2NFbEZjWUxTUVVIcE16UGlaNzlKbXRoamN2N3ZiQ0pTNzFmaWJj?=
 =?utf-8?B?TVY5b013T0VsMlUwMjRROElUdGRJdkx1YXdYZ080Qm9xVDBSamxMTjYvT2xH?=
 =?utf-8?B?TGplMVBWbWZXZitoV3Zza3hQMTRBN1I2MXQ2aWF4dW1wZWlnbGF1T3VIMHZu?=
 =?utf-8?B?UjhGcUw5bzRjNkZzdGFYU2xublhZbGdtZWs0a0poRzBEZXQrdFlTdTY3TWIz?=
 =?utf-8?B?OFNjbFp6ODBoTWFjTnZva1pEUnZWRWI4NDlUYmMzWFFqVFAySTExcXdveTdk?=
 =?utf-8?B?WDZTWnkxYndySG9KelBmSXQyTXlVcUJXc1VlRU5FejllWDBCQVA3akVmTERW?=
 =?utf-8?B?R2xrSGVKcEJ5cVNnQ0p1bzQ0dEN4UTAySm1lSnJjWDRnZDJhWDRueG42c3FD?=
 =?utf-8?B?T015NVk4NHJhemkraStQRzF5c2pheVNQTU43emJyLzJ4N291Q2p0VTN1UjdF?=
 =?utf-8?B?YUUxYUVKalpQL2xab0xSeTB1M09EQVdqKzhFcXA5Um1XSzliM3ZCRmMvMCtj?=
 =?utf-8?B?RGZaUXVxM1J6bnBBZWthSHY0bVVySkNvSkhOZ3FsMkRySXRrRTVrYWhNVHdl?=
 =?utf-8?B?YjhST21KUDhKOW1iaWNVeDhlLzd5SUJoR1Q2RzBWSERxazZuTStuekE3WVkw?=
 =?utf-8?B?eG9SOUhWNjhCNkx3dWtZQjU4ODBHeWRzM2E5bWErQmxCNkJSWVpuTUVESEdY?=
 =?utf-8?B?L3FSc0RzK3paWVBOUU5BSHdUVithZFpoMHZJWWVlbC8zNzBQTGdvdHBaT2Yw?=
 =?utf-8?B?MnY1N1dMUjhYcmhiaW15a2hFRlM4M2VCYi9Zb0EydGxEUlg2V244dDFKaklK?=
 =?utf-8?B?c2hrT0MwaDgveDB5S1UwTUtZTTN5WGFmTmNrcWxURHBjZm5OT09WTkxDTXph?=
 =?utf-8?B?Y290V0w5S21yek9pL0cyNUpYYTlZK244ZDJoSWJRWE9CcktCN0M5cVNYSHV5?=
 =?utf-8?B?bXdYRFBndzhPSS9CeExzajRGTGwwWlZkaDNkY3FpOWY4UGVVV09sM0xNeXYy?=
 =?utf-8?B?ZmJNRURPOUtNZlNlRDdyMEFQZnY1RUFEQmFBanhGSi91MDUwZnBFS1BNUEY2?=
 =?utf-8?B?Z0o2cmNHREZ3UzM1NHIyYnJucW5EZGNQVEpaaTRMQk5ybXdnRWRYZWdnMzF0?=
 =?utf-8?Q?/B9pBOvNI1Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXB2ZGtoMkxHR3J3TXhPZnY3akdIOWJ4NmpMeE81cXRDUko5emNZK3UxL0tp?=
 =?utf-8?B?Tk1KRmV2ekIyc3VkVHNnTGhOS3hxODYxSk1BUm1RN1ZrMnI3alk0Zm9PN3VY?=
 =?utf-8?B?aThqNFlFbEU2KzFjMnloSllqUWRtbzdWSlRVWTlCeGVyUVdFRm9nSXhnQ1lS?=
 =?utf-8?B?N2pDdjJreWQ0TUkrZ3R2SGJxUm5BMy9MVmR1cExENXhjcTBHVDdLS2JRMURr?=
 =?utf-8?B?bkJsOWliaEt0UU9vdExpeVBDT281Wjh0Ri9mSnpjVUxERkxHOWwvZ1IrblVF?=
 =?utf-8?B?eWRRQy9Da0VOampFSGl3Tm5OTWJnT2NVNHlFOGVYL0Z5cVhEVGFQa1dnbXJi?=
 =?utf-8?B?RTM2bEtBcXlzdnYrbEdCbHhlSllhbkVpaHg3RzhNc2JvUElGU2RPMExZb3Ri?=
 =?utf-8?B?aXI4MmlFZ20xdjR2eEVnazl0b2FZK3lLM0JCWXpSdWplTFVrMjUvNjVyN2py?=
 =?utf-8?B?QnhqUEh5WlhYb2VpUDJTTVladzFJc0F1YnRBTHdiaVFOT1BjKzd6aGQzUmxH?=
 =?utf-8?B?MGxBSFB4bkFhQUk5Z3dRUW4vYUJDd1czWm01Qk93cG1aSTJYRUF6a0FRSHAy?=
 =?utf-8?B?S3B1OU1wejg4RWh6Mm56dUZScXY4Nml1WWZadlhkek11L1hjY2UzaVNRbzQv?=
 =?utf-8?B?OXhuSk9Sd2hZOEhvSUw5OSswSEdyUTN1b2dpU0pqUG5nbE9YdVd6a2xuOUsw?=
 =?utf-8?B?Vk4xNC9GWjNxSHY3NHZHSmVxTjdrQUx0K3grc3BsTXpzSEF3NVh3V1BMbXFh?=
 =?utf-8?B?QVBPaDRVU3htTERLSG5UbENSc2hudC9ubU9Rb1A2cDNXMkFtRjJMUk0zeXFY?=
 =?utf-8?B?TTlGemlsdjFBWVI5ZXRUK1Z1V0VXV3RMa1VXdGw2aXhyZzFlU0l0dGdKRkN6?=
 =?utf-8?B?a2N3ZWd6MUhQUkZ6VkFGZ25ReXhHV0NOU1FxL3NTY0pMN1FiajVacWgwMlZv?=
 =?utf-8?B?OXV3UERBWjZDVmYrU2VlRXN3YW5CVVd0Mlo1ejNFU2VJaGFZaHM0ZkRpSGsv?=
 =?utf-8?B?d2tTejZpMVNTUXFabU9ibVlHellsWFRUZXp1SFczQXJ6aXZKR1BQNEx3Z1kr?=
 =?utf-8?B?aXIrL1BHV1BxcUdZMnNhRll1Mnp6bEMzaHl0b3pTdmE5QksxL1N6WlFmbTRP?=
 =?utf-8?B?MTdDRzV6U1VHQjdQaFVMWUhxTHQ0YU5pbnNxOG83NExFd2NWQlF6b3dHWmkv?=
 =?utf-8?B?TEJjZ1hHWW1aK1ZaN2lmb1pPZ29BcHFEbnlZcGNSWXBhWEo5dmM2TnkvbFN2?=
 =?utf-8?B?b3RmTlFNQlRsYWh5OXlGRDZWY1hWb1FMcFJBa05iL0F6c2ltVzcvTVNEc05l?=
 =?utf-8?B?ZDRtdFUwY1c5UTZZRnNVcXlZeW1TQTZKRWtickE1UWJBR3Vwcmp5RG42ZUgv?=
 =?utf-8?B?a1pPU2wwRHlqTktXeHUvTlB5cXNQRWtGb0cwbmFydStXQU5SWE5XM1E0MStH?=
 =?utf-8?B?ZHQ4Q2k1cGxGVU9OUlhnZTlEUUNLUGNyd0R6ZG8xa3BqSi9KVU9rQnRTMklI?=
 =?utf-8?B?MCswVG9wQW4yK0hXa25xamV3TUhqQlVJWmVrL3pZaFNCYmF5TGVtVjk4M25s?=
 =?utf-8?B?cTdRNmZsLzNka3RxZWhaTkRPNmZhTDlhMndXWVZMbHJwSHI4UitlMGFpT2hH?=
 =?utf-8?B?NERFZVRJWFB0bGxqL211NDRKaXdBMWpqSkRuR204T0hZYmxBOXdDTituWW5m?=
 =?utf-8?B?WDZEcTdJRVVyWnV5eFQxUjlCWVY3MVZvRnduN3VCNmNCVGk5cmpzSlhKUVV2?=
 =?utf-8?B?YnVhb0M0OEJGRXoyTnBrQlY2ZmZ3ZWN0Yjl4ZkhuZ0Q0ai84L1BPQnFCTDJE?=
 =?utf-8?B?d2llQjJ3ZGdIaUVRcUVKTkdNd2FnM1FDQ0tkU0k0U0lCWEpNRWlzbEcra3BJ?=
 =?utf-8?B?bHU5KzJpZUo2Nm5KWXpXbUNjYU50NTZGQkx0TVhXdkhNaVFsS2dqbU9OcGRv?=
 =?utf-8?B?bUVjTGtCVWZMY2VWOTYrK0kwd2oxQi85QnNnRFlQZDhwQmxjU0JJTVdyQzkw?=
 =?utf-8?B?RDJ5TitHNEZNcnQ3YVBSQ2k0K3JqSGhCakhMdlV5U1QvMGtkNHVjMDQzUFZZ?=
 =?utf-8?B?NmJRZ0Rjb3k1cGtlN2d0d2puck5SUXhGaCtvTWhWdG4yVVg5c29zR29iYWJP?=
 =?utf-8?Q?3smLPNDK8nk//UZcaVLlCHbGL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1521a843-b786-437a-5727-08ddb4bc8199
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 14:19:48.0310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roO643QCpIuGioYNPJU2jae8iDDfFkW9AKIwd3UAHHmJn9NI3MgAukpRjfoCYVpZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5860

Hi Reinette,

On 6/24/25 18:41, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:04 PM, Babu Moger wrote:
>> +static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
>> +					    struct seq_file *s, void *v)
>> +{
>> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
>> +	struct rdt_mon_domain *dom;
>> +	bool sep = false;
>> +	u32 cntrs, i;
>> +	int ret = 0;
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	rdt_last_cmd_clear();
>> +
>> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
> 
> Missed this in earlier response ... needs update to new terms.

Sure. Changed it to.

rdt_last_cmd_puts("mbm_event mode is not enabled\n");

-- 
Thanks
Babu Moger
