Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D308A22CBEF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126192; cv=fail; b=TBKgYurw+ACgOJkPxnjVDVkCLia3oYQguCqg1IanqBXOn/3l+ikc4WzYAi8JajZTIXpg019YH6HCIaqUojebNkWsps8i3xIP0IFYeHa6mPjNqA/yaOrvk/u9emFSVbaeXNUsiIC3ozm7EKTBwvsmvlz72DemKfYAIdWpi1ReBdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126192; c=relaxed/simple;
	bh=pJ5wxNAI6XaY/TQBr6bPF+XDdOWfu6TdiohAIsig7qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nnfs1HCr7wO37Q5ulk9VeHAa9Nxf54lJhrWaKFQBeKRT2Wbn7K9QCmeR30Yu/ln9IdOmAo3znmgakypN5dobUpAAGKTQyHmyH0aE8nqxRaS/JrBc2hn2eGAWQN5/ttufh/fCaI9awZ5yoe9EOUWszjbsQwBq3bGhc8FYpsHnTH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WgHKSfT6; arc=fail smtp.client-ip=40.107.94.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WgHKSfT6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIXBeeefIOic5o5N5lK9uu45k7m8mfHWfXWD0K22GyKoe1GNgBVJ+mftvaUm1Zv0Bsmk8JLoo6YqOMZhTb+bUiEw5LwgdorRaongYj7+0g/YodSxVYn0PFUTppq0uHiKNxSFPDgQfN/eqVFT6U0ksrQI6eRaEx5PuL4RbExqceUBNtdDg7eDEYOOM6rfdfu01iA8axjW4wwCJ5oDIaF5dXekXfMQJ8C8bBznbbnPfE6x9vo9MSf1V86y8BkrL6RTA71NwXzkelmMxWEKaYI7dennXb/1s4Ip18P2aBB+Jl3D6ISqN/gtPhJM5qrxk7J2kTa18XXC26GK7dsY4S0j+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Do++F+89NXfbJkbt9SpcOtPvZk0fquGY99owQebtmAg=;
 b=pvhrFz1uBu2P7G/IaKqLwStHqen+byNc352YkTbWaAr4/NzEK4/alB7PsWi/1K1SioF6CNfV39kPFcDIj/vJWGIgjYqFE+cr/ud3PVNdO3GhCz9y1g7MIJdSTxja7s2/O2vpASqf7O1pMQOT2fZp7wBcbVCclX0hHrhMdQKhzvgET914vupQO0oJZG7N8wOa953h1a8/nGXsPHXZpfPJatl0QwZPlGALXwudJjgg4wVeoVr2Cjbcv+/5nuiK3rTFM37OMV2HAXyb6fdDNLcu8PrYiAGh7+r25IbTrdK5r1F4iueGIAYVeqV5HbeFc/YoYXak3cOnRu7UW79y/we3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do++F+89NXfbJkbt9SpcOtPvZk0fquGY99owQebtmAg=;
 b=WgHKSfT6nGKt7hugo7sxNR/QG8ZmF25A/setC6Rb1J9O7Jn2/OrC88NySjqQo9kqJ9nHlGmB3mFY6/qaw3suMjyL8f33hQexkTgqKnOFEo8Zhg5lmCgFBcK2XMKMxLhMqiZX/YlpKHFRuqJX4rh+64w0WGS7+FdKDlotJiAXVJlXxag5BV1RBF1qfh8et2EHwUECBmPVAcTpubAzJaa5mw23lO2x0ZR1ihNFGfUclsHXm92s03jsSyKzZcTr/6NG7c0wO7y3id/HebiZpB6C0CVkpVbGEdi4jj9T4o9J76G4RhqTJT/8oIOjEGDJnuhGIlJY2+VVsVHg/P1OwzaPVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA1PR12MB7613.namprd12.prod.outlook.com (2603:10b6:208:42a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 15:29:47 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 15:29:47 +0000
From: Zi Yan <ziy@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
 21cnbao@gmail.com, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [RFC PATCH] mm: huge_memory: add folio_mark_accessed() when
 zapping file THP
Date: Tue, 08 Apr 2025 11:29:43 -0400
X-Mailer: MailMate (2.0r6241)
Message-ID: <282545E0-5B66-492D-B63F-838C6F066A22@nvidia.com>
In-Reply-To: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
References: <34bab7a60930472377afbfeefe05b980d0512aa4.1744118089.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0059.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::34) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA1PR12MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f02cc1-bf5e-404f-6cb9-08dd76b23231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXJjY2V4N0FLMkVmdEdaYVFRRlNQYStlcmxjS2V1dkdUaDBxeElEb3pXeXJI?=
 =?utf-8?B?RjNOcFVjUUtWRklCa3pYZnNncWNlZjFTQVRMQ0RBZXZUdFlPQk9tY0tFUU5K?=
 =?utf-8?B?UUJ3aXNpSDlqL0RLemRHMUxLL3NwQ09kcG9rK1VwUkxjejk5bU9XWEZvMXRu?=
 =?utf-8?B?RVlEdjIrTXJaS3c0ZDdqaFRrSG0rRUJyMjl0WFAwaGV4aEp3cG1SQzlNNmxE?=
 =?utf-8?B?anJaQnMrejlNVWh2MlRBanRmYUR5RDd4S0Y0QzNuZjhrLzM2b3cyRm9OYjVY?=
 =?utf-8?B?NHhieVFOSnpxeHVmSFN6Q2xWSDEzbXl1V283bUptOVM1cTJTVklWay9iU3Ni?=
 =?utf-8?B?R1gyQWZHVklZdURJR1lrQlArNjdjYXNPVkhFclkzdGg2c2dndkRXQU0wSTEw?=
 =?utf-8?B?SGN5S2d5NUVTMDNzaVZoelI2YWJsWkpOMzF0Mk4wMklpYzZ5V1pkdHJjRS9n?=
 =?utf-8?B?SVZZbkZxYU1OTk00aTdPN3psamI1dkNjZTU2dGVVTkNLZy9JSS91a2tvNGJh?=
 =?utf-8?B?WWNwV2ZIQWw3Zm9sbW11c0U0bTlJWDAzM1pBSWw2VURjVXF5UVBtVG1EOHdl?=
 =?utf-8?B?OE1sNXZGQVMrNTZ6TUs0cW51RHFOK1JxVnZJQVZDc2Y4Q285SW5hU1d0OG9J?=
 =?utf-8?B?L0JyOWlsYWxJNEpGS25SQS80UnNGMG85UW5uZ2s1anc1YzIrajBzUjBDbVZH?=
 =?utf-8?B?UTdwallTa0x2b0Q2U2tLV0hTL0ovZkxSNWhlcDZDT1A4cjRzME40RWVmLy9t?=
 =?utf-8?B?T2h0djQ2c3BhYzRTcDJlNzVZSTE2S2tGNTBEYXcyMUMrTXhWbTlqeUpRZ2pW?=
 =?utf-8?B?cFNBRXY4VklWMEc3S2NDQjJ6TExrV1YrbkRPNll4NXVKdlBYdUw0ZlRCVCtT?=
 =?utf-8?B?WmdWOTdFQ3RCRmFMYXF4R0k2bU9NRUpEVDFJYlhxOTlJMmZJdXdjY1RudVo4?=
 =?utf-8?B?Y1hHUGFCbFhqM2ZlZlJ4SC8wcjB6bUgyZFpFSWQ5SWM5YktnOHVDYjBmRkcx?=
 =?utf-8?B?L25QSk9hN1U2ekp4TU44eit1RTJTQnMxWnE1V3BuNFVnUnZjalNpLzc5Z0p4?=
 =?utf-8?B?aENDLzVGMXJDQ2xHSUtDYUxyVzM2TnFvV1J3UkMyMkRVeW5qOUpTYnAxc0hK?=
 =?utf-8?B?UzBiRjNHdmhQOVpNeWg5RkJjUXk3UFQyQUthc1pvL0VvQ2dHT2VobDVzSThI?=
 =?utf-8?B?WHZ0aS9xaUVKSzdvN1pmNWRUdVhaaUJnY2hqMjRlU2htZVpWbnBUS3ExYnlm?=
 =?utf-8?B?NHIxZDhUelByamo0S0UvM013WDFZWWRiNjhhaC92dDVUTVlsU3FoZTF5amtt?=
 =?utf-8?B?QmVLSVhaYTF6bDNhanFVN0JlSVRRVXF1eWZHanVTY2REWHQ2QjdFRU54QW9M?=
 =?utf-8?B?MzJPTVFmR1g2MTlSMlJTc3RSS1VvbnpWL3FVR1JCanFZK2NHWVlnaGM2QXl4?=
 =?utf-8?B?Yk9PZDJrZUNtdDhMS3JHTDhwRmFzYzF0TDYzQVRJUHN0Nm13dHAwajdhYTFs?=
 =?utf-8?B?Q0p1ZVJxS1ZobXBzWnpBNWdqRGpDSzllTTNsdTV0WWNRUnRCNVdSdWpKRGx3?=
 =?utf-8?B?azdzMEZDWWdGZGhncmp3T21aemQzQyt3UURvMzdIbEF3YzdQeGZyRENmUExu?=
 =?utf-8?B?NHplVkM4MkdVVUhlSTZORVY1K0FnUGhRZjFLNGVXOU1FOU5Ddk5GL1plSlN2?=
 =?utf-8?B?dm1ZOXhiOUdJU3RnbjJENy92S2oySDR4VE9JS0xSc2Q4UzAyNHhNKzdsWkxI?=
 =?utf-8?B?R0wrNEZ1NHJoQm9hWHNXVXZRRU9Qb01EOURCNDI4aGZKWm5CeHFHbzBPNFVn?=
 =?utf-8?B?SWV1QlFyMFJ4UjdzVWxhamNsYi8yQW9meFJGeGJXSGtveS9xSFhML3l2c2ZK?=
 =?utf-8?B?Q1lhUHV6ZHdlK1huMDlRS0pieFU4RHJFTStEYm5nZzcremhqVUtLU0NhYnBq?=
 =?utf-8?Q?wa/Le5CJp3c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlNCSWc4eEVnVXZ6UWZpVGZqOG85b0xROVZNTU40QXoyOGl3NmFQaElHb2xT?=
 =?utf-8?B?QzFCWjA0WUJZeXJ5VEorR0I4aTVDQmhlZ0hJR29GK2ZEY3FSN1BwWXVidDQx?=
 =?utf-8?B?enl0V2JEVE1hVlhLM2dzVDZ1OEQvb2FwUGQyeWY4OVJNQVV3UXBBUUR6UXpX?=
 =?utf-8?B?eTR0cUlkaHgwUGU0TnJEbWl6UTFzYjlaeVBQTFB4ZHFPR2ZVenRJNVdMS1lW?=
 =?utf-8?B?c2t3bWRrU1FZQnpmS05ZNlQxSnlTQmluU3NvenpvemFDNW0vdmFpQUViNWdY?=
 =?utf-8?B?Z3crVmVuNG9qSU5JNUhMQzJOSFhnVDVhODhqb1IwamRKbjltUDVpTWl6cEZW?=
 =?utf-8?B?R280cHJTNStDZ3Uwek1UTlUxdm9MZW85YTVoZjQ0M0VjbWVnNEhlZ0lyK2Zo?=
 =?utf-8?B?YkNaSmhxK2xyU2ZRK3kwZDF4RHZEVDBuQUVHT2ZTLzFOOW9nc1hJdml6cDBm?=
 =?utf-8?B?VlI4Z3JVQzZJUHpscDFWK1FoUGd5c0lQd21tTVVxYU93Njd6V1B1dU1oSDFz?=
 =?utf-8?B?bG5yd0JwYkJEZ3YrNEpHell3Z0NRUnFEWXZlZVoyelY3eHNONjhvODhMYzlB?=
 =?utf-8?B?aHUvUE5WUDZWNXljTkU5Z3dhMnBlbEwwc0VsQUQxNXNvZ0VOMEYwV2ZmZVkz?=
 =?utf-8?B?OUZNQWhBeWRjY0FjMy8rK2dBdmQ0Q1dWVXB5UXgxZm1SZEx1eG05NSs3RWdX?=
 =?utf-8?B?SStiOC9NSTN6Sm1pbGRWWHVXdk9kamJsbUF3MGpUMjc0S0dHMytDRnJxMDZt?=
 =?utf-8?B?ckxiNmZmKzZuMGUwZUF0YjlVTE9LWkIxTGd5ZVpMbC9UdzV6dk5UMDNDUm9O?=
 =?utf-8?B?K3BhK2xNR0VvVUJMd0ZmMjJ1QlhweURwTWRJUFhRa2xZcStRR2o2dkJ0Z3kw?=
 =?utf-8?B?WGgzVzZvN2RFQkp5VjZ1THk3L1VCYXY0eSs4OGI4NVZscnZKbmh3YXB3VjB0?=
 =?utf-8?B?MUp4eGd5V2ZJNURiVEZwV2Q2KzdCNVZDdFlrZXdaR3Fvck0rUmVXSE1YeEpH?=
 =?utf-8?B?ZEtGUlhGZjJzZUFKeVBNcXVTYzhvTDNNVGlqbTV0UnZyWFJ4NlFNbmZWQnFv?=
 =?utf-8?B?b3JLay9QWHUzM2tjS0M2OGhBUTZxckVMY3BVUXZuZ29vdUdQQzhKY0pFdTN0?=
 =?utf-8?B?SC9hZmw5SXJYMGFxbUV1YlZscXE5TldSN0dkSjJPLy9CaGFHSXhQOVJCZFZi?=
 =?utf-8?B?UnU2RlNNeURabkJqTlM2RDkwS00xQzROVXpxeE5tNzk2WWpsRVVZc0JDWmEz?=
 =?utf-8?B?bkE5VUl3a2lnV2NraGpkMEI0V0JlVkZTb0U2bStqTDZWNlFhazFjcytjSkd2?=
 =?utf-8?B?WnRIRXVtYUpNUTEvaGJKdHRWT3RJM2MzTTVrbVZOa3F0MTVIVWJzQ1ZmY1pq?=
 =?utf-8?B?bG1hWEhjR0pzZkZlYi9QR3dGNDk4VUhuUkNXRmRBNGd3bll3c0ZtRU44TENG?=
 =?utf-8?B?T1JJdXB3Tm5SbHZHNFJXYVlmTXZEM2ZFN3lKcGlmZkJobHoyN0dXVTZCK3hS?=
 =?utf-8?B?akdzRXpGZ1MxN2p2ckhOQkJicndSZlFKL1RhSjBrVXNScENXMGMxcldoMXBT?=
 =?utf-8?B?N25wYlZKalNUUUpIMTlacngzSVNuMmxCU0E3Y1lxUTVVc0YyVHFnazVlcGFx?=
 =?utf-8?B?L3RBdkhiWFJvTytuMmQ0SC8zZHU1NDRzcW1MQ0pYY0F0WTA3R3VIdE1yYnNN?=
 =?utf-8?B?SGkvUWt6L0xPNDAxSFBVcGwwWHJDVFZyR2NGZG9sMGJnczNvUmd2cVZ1KzVX?=
 =?utf-8?B?NDIrN3d6alJwZkphc0NsN3hUaGxNUnEvTTNDMlU4eER0S0NnTUwyWHZ1c2ly?=
 =?utf-8?B?TVNhOGl2OXdGMllNcG42S2E1aWdjVlZiTFBpa1pvQ3ZnZlF2cnJaVTh1RWJa?=
 =?utf-8?B?Q0g1TDM3OW5iUk1rNGJTK2p6Q1NQTi9FVkEwNzRvM25kdXJ6dVlXbU45Q0tu?=
 =?utf-8?B?NDlHbUM2NjVJWFdWV3ZnR1pUN1J0NExnRzlGd0FiTGRJNjVoMUJKanQzVW4x?=
 =?utf-8?B?TlFlMmhtWitjSUVBaTk4QnVDZmRSbGJDTzVVeldHT3cwYWUydTIrTjJ1V1Jw?=
 =?utf-8?B?L3ptVWh4elBvN2pxelhmcE1ERDNIWXd4RGVtZEpyZFN1bGNvQVBDbEwwNmk1?=
 =?utf-8?Q?CUWtUauTZyRxynJEfSEE7XP8r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f02cc1-bf5e-404f-6cb9-08dd76b23231
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 15:29:47.5769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEHjr5PsNqYWex0SZvXeQ0CDyt+1oyIX+XWsvneqXzMeR5YCG+iFekKqFqheLoKu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7613

On 8 Apr 2025, at 9:16, Baolin Wang wrote:

> When investigating performance issues during file folio unmap, I noticed =
some
> behavioral differences in handling non-PMD-sized folios and PMD-sized fol=
ios.
> For non-PMD-sized file folios, it will call folio_mark_accessed() to mark=
 the
> folio as having seen activity, but this is not done for PMD-sized folios.
>
> This might not cause obvious issues, but a potential problem could be tha=
t,
> it might lead to more frequent refaults of PMD-sized file folios under me=
mory
> pressure. Therefore, I am unsure whether the folio_mark_accessed() should=
 be

How likely will the system get PMD-sized file folios when it is under
memory pressure? Johannes=E2=80=99 recent patch increases THP allocation su=
ccessful
rate, maybe it was not happening before but will be after the patch?

> added for PMD-sized file folios?

Do you see any performance change after your patch?

>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  mm/huge_memory.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 6ac6d468af0d..b3ade7ac5bbf 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2262,6 +2262,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm=
_area_struct *vma,
>  				zap_deposited_table(tlb->mm, pmd);
>  			add_mm_counter(tlb->mm, mm_counter_file(folio),
>  				       -HPAGE_PMD_NR);
> +
> +			if (flush_needed && pmd_young(orig_pmd) &&
> +			    likely(vma_has_recency(vma)))
> +				folio_mark_accessed(folio);
>  		}
>
>  		spin_unlock(ptl);
> --=20
> 2.43.5


Best Regards,
Yan, Zi
