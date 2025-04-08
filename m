Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F1435972
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128765; cv=fail; b=FL1+lrqxKCaQh/hSiotQ/KphncMigBTibz0wwZCOld+qqVsiubq756ltzDEhJLbpeBId/Lrs6NrOacg6lYFouGev9q4TKiENnOOluI8F+suShyblZarOD+r90nYvhK4EbAvxWZThN+UQfFU+vv4lKmDi1tE+0Wdxt0Bi8aAOHQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128765; c=relaxed/simple;
	bh=qNO6whkqfaTN+cs/fSGw8X/cdltmfVtIoPV4Gg9BoPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rqYYIX88ukPANzvEq849G7gBoJbiWl4+ZQsYlw3Ciql+VQ2Nz++Pcw4i0DFYczNTx1uf+8+ntRGHQjSrAHnuFNEnrN5FkUXs2kPMxTDotYFFuEXqALsJYi1HRu98pjLCpvjsXvQcZs3hMQ5n92+e8lSGCCk3VUQfheGffNr8QxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q5s1mEy7; arc=fail smtp.client-ip=40.107.220.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q5s1mEy7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWBrZIzJFxUmJuJUJTRsIahDGUi0+bnOMpwi824bYkiqGzGK5zRJxq9+bHjy6tHk3cila1ZDwFIUjvlMX9J5AbKhtcGW1uXPgMmDD3HtvzEvz46ZIqCJp7WknwaWxt9yhRbgamNiNsFsYw0T5oO9U++tqFYdPMyOaq7ye8pUwoDvswpizb71GJLpC9dfsfTfuULLZXiEugsDqw5AqdWouToS7E7LEiNr3uJ/CMkFgVaRjoWP4rAG+MKkyF4FEUA/AZetzMM9BaR0ZzAx4xhHr7Hq0+qy8rFhVd930UgDaBsMs8KiJpHjttPua7Ssw+ZjKy85XrlA04xXTiWZ0EtM/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdSMw9bkWsB+i1Ju5zX70Kz7lNsp5Eyq8QoKt4kCifA=;
 b=JOD9XlQyeSWqARhbt8EpZeOKeixHkukU+KkobxchAR3MexgOYSiFysoRuWZhdp1Tc1Cv6x+CYv3+aY6mIBva1PKegYIS2oeO10scprfYm/JDtJfBPjsH5WAt028ckSXfATmAayZlHpfgcyEASAd45K0DYYjq0Ld/S6XIGE9+QM9y5S462npxnb9CxTOXXyjOwn8pYChfLCBEi7V4hsbiYLB8t4XXnCsj3EibugMlfyB5dBepWm6MP235685RJ3hkoY7ddIqETqyuU/tCq59Sx5VyCla3VWEDAB7gaft3BBGndajdguhWu2/IuJ+ZaBJtvJYOi4FFsuZobPDW7x+c7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdSMw9bkWsB+i1Ju5zX70Kz7lNsp5Eyq8QoKt4kCifA=;
 b=q5s1mEy7KsLw7d1haB2AtS7IokTQlafw6qKXim0RV2iv5kmUBmdGbfC9efxbdzGKDn49cXFzID+1ozY7eabSnzfuKKXRgsTUy1p6iChUncrRCY5zKj1dCKE2q3yHRpvtDEWzkooJGfZH0fXHSWGFHeuNdu+N6P4TnbbALEsKJ8Ju+D6wJIi8wbUFkost84tprU3JmNdgjiBMMLV3AUJJhW7MiRq/KcE66qt1HW+ujN0AcY6gYk+W0DQN1sR3etAOB4ybAa0wgVj8CflTH/8ZEgsbp+EqPq9LcfkiCXo+fsNe9AQnHPL0RT+y+8omDxP26fqVTI/k8VnelcB3wO11Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CYXPR12MB9427.namprd12.prod.outlook.com (2603:10b6:930:d6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.34; Tue, 8 Apr 2025 16:12:41 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 16:12:41 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
 21cnbao@gmail.com, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
Date: Tue, 08 Apr 2025 12:12:37 -0400
X-Mailer: MailMate (2.0r6241)
Message-ID: <2C391CDE-0C6D-4ECD-9EDF-5CC165999EA2@nvidia.com>
In-Reply-To: <20250408160205.GD816@cmpxchg.org>
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
 <282545E0-5B66-492D-B63F-838C6F066A22@nvidia.com>
 <20250408160205.GD816@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CYXPR12MB9427:EE_
X-MS-Office365-Filtering-Correlation-Id: 1469b9a8-f640-4c2d-2a6c-08dd76b83072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zlg1djBXZ1BZY0gwTG9WKytYSDRGNURLSzJDSEFNY3ZodzIwbjErM0JQQ1dV?=
 =?utf-8?B?S0UrVWFWWG1vSzJCS2c2NGpuTk9TM0xJNzlqYVE4RzUyc05vMkxFL3I4QTlX?=
 =?utf-8?B?LzZ6ankvWkpCejZVMzVPTWhIeGwwWVpqVmg2a0xDWklLOE15U0laVm5aUTln?=
 =?utf-8?B?MDNzMEpnWEkzcTA3ZXJtVVhUaWMweERUMkQ1UVE1MERBN0o3L3I4L3ZaL1c3?=
 =?utf-8?B?UitFYTMvU3VMeXBkS2YvK1pFVllzeHFpdVhySFFmYXh2SG9sQlJWTVZJTjdo?=
 =?utf-8?B?Y05hV09hd3RjcGhOOFNUTmk1QlVYakpTV2MrK0hqTzR6YXBWWk1iTnFWaVp6?=
 =?utf-8?B?WmF5cTYxa0lEb2JOWkJsVHRoQy9rd0VOR1lKV3ZGLzEvcGtTMVNJZ3d5dUFR?=
 =?utf-8?B?MlZneWlvcWUzZXpVd1dqTHp0SmtldVdmUm0wN1R5RkRxa2h0ZXJXMmJNajFJ?=
 =?utf-8?B?dzRSYlk5eWF4M21zdlJlczVHOHlJN1JJaG5Cckp0TllJVjJ2SThUVURJeHBF?=
 =?utf-8?B?MEtKUjJMNVI2MnBFcFFVOHlUMW5oTjVNQytPVnZFNW1ldlVIUmhwRmxyM0pk?=
 =?utf-8?B?djF2d1dZanlGLzdtL2pqNGUvclZSbnpRV2d3ODZaSlU2V0tJc05IL1lpWHJC?=
 =?utf-8?B?QzA5UzNCRlJKSzY4bmw5cXRhanAxRS80RFhCay90dTBPc0FxZXNha0V5UmtH?=
 =?utf-8?B?dXVGczB1WURrM0pOdHVTblZ3VjFqTlQ2ZkkyTTIyREpDeUFkSWt1WHNHSmJk?=
 =?utf-8?B?S2dXQ2xJb2tlaDFWL2lqWVJDM25XMXg1RCtMN0xsT3gwTFMxYURFb0t5MG5Y?=
 =?utf-8?B?VkZ4RC9zVG1SNUJlS2FhdDBwcTd2K2pEQU8xZm1uSDd0ZElxd01xUkR0ajFG?=
 =?utf-8?B?VnpFZm1rb2lkY1U3Qlk5TWxzZFFoR3BycHNPS3Z2USt5UDN0S1lqNnJJc3Aw?=
 =?utf-8?B?alFTTWtBaVNpNlltckU4a3grZnFHeDRnTjFidGdYdVlnRXZ1aEk1RjFaYjBW?=
 =?utf-8?B?MkszTDhRdW8xWjI1dTIwek1waGRuVTVwazB1TC9DcXRHMk8vQ2lsQ0ZPQWh3?=
 =?utf-8?B?akNmTDkwMkZ6azBKekdIcmFqWnpuZzdMcUd5V1h5UjhhWG1hQUoxcGRwMzRS?=
 =?utf-8?B?K09hYktteE4vNmhSVHRuUjZFVDk2NjN6Rm12Z2pnTndIb3BUV25Wb3grcmps?=
 =?utf-8?B?djZ4cVpLdzc3NG1QTXlLRUl6eHlsWFdvdG85OUFZaUJmWTNzVmVnU1NmSlJK?=
 =?utf-8?B?OVowM0hVTllmbC80NzFnVmJNMnFJbnZoRm1Gd25NODVuYzUwNmRqY1FiL3pw?=
 =?utf-8?B?V0c2WkN6d1BTaDdibld1QVNBRk5IQzBpVWZFVG1ScjYvVnhZWWtINzNHN2dH?=
 =?utf-8?B?cVhNeHlzdUhVTnpJd2JGendGdlFWU2FVbExKMUxiV0w4eWtxK1B0NXpSb1VT?=
 =?utf-8?B?RTFmVnFMRnliMmRTQ1RVRzIrczBHc3VUMm84UlpmSDJWK3BJUzF4dENnMkVP?=
 =?utf-8?B?WC9PTVdGV0NFMkpIUFp1VUttM0RrNHh5WjZXOTRpcGkvUzBKaXV1eFZUUHIv?=
 =?utf-8?B?OWZOc2NLbExJczJmS2Y3aWtmQTloaHVzR0dmNWtKVkRQTnZRdWJJRFlvcUJv?=
 =?utf-8?B?Q3dSL0VBTklxMlgzZFVOZFlsTnhLWlBVc1RCL1oxYWJCL0g4SnhLaytheGdZ?=
 =?utf-8?B?SThSL0xXMnEyVXM0dlpaNFI1ejdQVlFDMUpZMmlUMElOazVwMjk4TnE4WG45?=
 =?utf-8?B?WlpCNElxRTRyc1RvcXUwSFdoZUttOFk4VEZGdkRjblRkQzNXSnB5YnpoNkFS?=
 =?utf-8?B?OW53bi9xUFVuaXJlN3liNVVpckV3eGRjZStPRVdLb3c4TEM4ZXdJV3hQd3Fi?=
 =?utf-8?Q?aWCsr+bIx2aTr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGVwN3VRS3VPSitXSEJ4cFVGNDdhZE1idGsrbWZRQURqU0N6MXB4VlkvVGEr?=
 =?utf-8?B?MzMvdkhvcWRrVW01b3pRWCtRSFpjR1lXZGxpWXBCY1pZakpqM3RLUzgxMDZJ?=
 =?utf-8?B?dFYwaFY4eVdhYnNVT0RqbDRXcWhPQWQ1WmZtY3hlSU5BOWZiemtiY2F2WXlm?=
 =?utf-8?B?RFZQODRoTWRja3QrNVBOTTlqZ1V5QmFaNG5tUlBqNTJYeTcybUZmeld2REJB?=
 =?utf-8?B?NzkrQmtoV0lhT1BSaXJWOWJNdE1DR1lQOUVycXEycU9IeDQ5L1dJRnRjMFFn?=
 =?utf-8?B?SWhzVzlYK1lkekVuOEVOVllmWkwydFNPRDZvK1F0eFU1STZ2bzVyQmdiRnI1?=
 =?utf-8?B?ZUVaNFhMWngxSThSdGhlbG5ya3YyUVN5NHZ6SWJQSGxONTc0dy9xWE5wN00y?=
 =?utf-8?B?QWJoc25kSjBab2t6djhBczlDRmcydnZuc2xCUVJTbXlXejQ3OTlGd0ovTU5S?=
 =?utf-8?B?LzUzMVZmaG5HdVFRY3BNRjhvc1ZlRWhTV280ZWZYMzUvRHRoWG13NXczb29z?=
 =?utf-8?B?VjVuajJISFExNTVvNzArN1hjcHJNN3hxS1VuVmt0TjJJNndPM3QrOXk1R3NM?=
 =?utf-8?B?bW5SMy9mWnBSSnpJckt1T2dVUHYzaXM5L3lGb2lhYWUxTjJGT2UxS3BYTHhy?=
 =?utf-8?B?MU1xZWdXc0dXOHRINkI2cjlOYTlKNkdvaDhycWlsSDA3L1Q2OFhHVnh4b2Mr?=
 =?utf-8?B?V3lNQ2lxYkVwdDI4VG5YUmR5VkI4M2p6WFNQYVdQYTJzcW50ZTBvSFp4MTJs?=
 =?utf-8?B?K3dRT0xnbkp3THpuVGEvb1JjUkxrRXF5K05sWUMxZEJXRCswRVhnUW1UZmRU?=
 =?utf-8?B?RzFGbHRGb3k2R2t2Si9palMrMGttZldoNEY2OStHSUhsSVcwVC85d0JKY3Jm?=
 =?utf-8?B?TEtEMEVjM1M1UzFGMXV6UFZUclM5b3ZBcjBVZlhaMllHK3pvUkpVRFZ4UjI0?=
 =?utf-8?B?M0UyYmdoekh1d2I2VU15LzZaWTM5K3NVRHN1K2p0bXk1aUxDeG4wWnpwUkxo?=
 =?utf-8?B?V3Jmc2N4WXFGRWlzNHU3d0gzZkVMcWtjWWlBb3FiVFRXT3RnYUczdE5vdHNV?=
 =?utf-8?B?YUVteC9uc3Z2d2p4YzNUd3FyKzlxQVFJdkNwUGN0MnJhU1J4ODZYVDA5a3E5?=
 =?utf-8?B?dENjUHhHSEM5SVVNdXFGTG1VRnNDS3ZvLzk2bnFVd250ditvYmVINzFObzJX?=
 =?utf-8?B?ZzJpT1RJR0xwWGNGK3ZGWDZNVUdMMHJOeWZWRit6cDZwcmwyY3FxRHBZSXhi?=
 =?utf-8?B?YnhlbG9McXAreXFPeWY1Y0NkZ014R2YxK2NRQVBKdVZ4UlRwU0dnemo3aWN3?=
 =?utf-8?B?V2lNd0dtUGw0aldIUlNoTWJ6RmJPK0xyaGVkN3RtNCtZTDFwckhnNUNHakdy?=
 =?utf-8?B?NEdDVHI1WG9CNTlqbzlPYVBERUxqa09kNlZ4U1U3Q2dLNmovVmxPS3pwaGMr?=
 =?utf-8?B?cDZlMHpFbTBVdVg0bHU2UmFuYnA5NlJCOUpreVBNNVdwMDRDVUdYbDFLL3NN?=
 =?utf-8?B?TzgySXJDeWQzUkFXQzU5MlFwMnVFcVZQMnc0SzFSWXluUVZhUEEwNFE5R2lk?=
 =?utf-8?B?aDE3NStud3JmVDRzQm1aSk9UcFFBVmthU0lrM0l6QWF4dlBFRGEza3oza3Fk?=
 =?utf-8?B?RHpFQmdBektEU0lxSGlDNzc5NllzUm54Mmo4MXE4MnhZQlp1eVZzOGtGa1J6?=
 =?utf-8?B?UXdaOUpPYXF0WDEwbXhPcWlsOHRCajBhK1VxaGI2WEp2eDRpMFZVby9GWFgw?=
 =?utf-8?B?MmJQclBiZEdYbXdKN1ZMU1ZZcHBjcWJIMnNQS09YWWpqZVV1YUFFK0pBRWJ1?=
 =?utf-8?B?RTIzR0tDazNxNitQaTYzVy9DelZPY3BHQjVyZ0VqdVVJTlVHdEVRTmVhNzds?=
 =?utf-8?B?aXZLNGU1RWxidjgvUm1YY3hvSzF0cW1tRUw0WmF1VXdrV25aUTVnTksxK3lM?=
 =?utf-8?B?OGVnRFg5aUFEc01veU91b2V4Z1ZkZ2E0Wm5vRWpiQVl6Y0NrOE9EZFpUdDhU?=
 =?utf-8?B?U0dYUGlSa1ZKQ256czBCK1EvZFNHUjFnQlJwcGNJL3JqMnEzajFSVkVhc2Zx?=
 =?utf-8?B?eE1zNHJTbTJQd2NCdjRHRHh6M014NlQxUWQrbWZJYytzTHdRL2VtVHRvcEF5?=
 =?utf-8?Q?ttBIv/scWRhGxKc0dem5TPwbP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1469b9a8-f640-4c2d-2a6c-08dd76b83072
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:12:41.6397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hj77BrG1tj6bE/BI6S9o9nqvXs9AWW/BAQkP1V1MjVY8TzGnCRnB/w7AB+l9wflO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9427

On 8 Apr 2025, at 12:02, Johannes Weiner wrote:

> On Tue, Apr 08, 2025 at 11:29:43AM -0400, Zi Yan wrote:
>> On 8 Apr 2025, at 9:16, Baolin Wang wrote:
>>
>>> When investigating performance issues during file folio unmap, I notice=
d some
>>> behavioral differences in handling non-PMD-sized folios and PMD-sized f=
olios.
>>> For non-PMD-sized file folios, it will call folio_mark_accessed() to ma=
rk the
>>> folio as having seen activity, but this is not done for PMD-sized folio=
s.
>>>
>>> This might not cause obvious issues, but a potential problem could be t=
hat,
>>> it might lead to more frequent refaults of PMD-sized file folios under =
memory
>>> pressure. Therefore, I am unsure whether the folio_mark_accessed() shou=
ld be
>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
>
>> How likely will the system get PMD-sized file folios when it is under
>> memory pressure? Johannes=E2=80=99 recent patch increases THP allocation=
 successful
>> rate, maybe it was not happening before but will be after the patch?
>
> It's not so much about whether the refault can construct a THP again,
> but whether we should have evicted this data under pressure to begin
> with. It's more about IO and paging. And it's the same consideration
> why we transfer the young bit for base pages.

Got it. It clarifies things a lot.

>
> Sometimes file contents are only accessed through relatively
> short-lived mappings. But they can nevertheless be accessed a lot and
> be hot. It's important to not lose that information on unmap, and end
> up kicking out a frequently used cache page.

So folio_mark_accessed() will prevent the folio from going down in
the LRU lists, when PTE access information is transferred to the folio.
The addition of folio_mark_accessed() makes sense to me now.

Baolin, can you include Johannes=E2=80=99s explanation in your commit log?

Feel free to add Acked-by: Zi Yan <ziy@nvidia.com>

>
>>> added for PMD-sized file folios?
>>
>> Do you see any performance change after your patch?
>>
>>>
>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> ---
>>>  mm/huge_memory.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 6ac6d468af0d..b3ade7ac5bbf 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct =
vm_area_struct *vma,
>>>  				zap_deposited_table(tlb->mm, pmd);
>>>  			add_mm_counter(tlb->mm, mm_counter_file(folio),
>>>  				       -HPAGE_PMD_NR);
>>> +
>>> +			if (flush_needed && pmd_young(orig_pmd) &&
>>> +			    likely(vma_has_recency(vma)))
>>> +				folio_mark_accessed(folio);
>>>  		}
>>>
>>>  		spin_unlock(ptl);
>>> --=20
>>> 2.43.5


Best Regards,
Yan, Zi
