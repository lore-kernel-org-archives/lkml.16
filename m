Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDC72561BD;
	Thu, 17 Apr 2025 16:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908833; cv=fail; b=Upk+8WoD0CKP1dhspZJk58D7DMqPT1KdF6EJ6YnP24hlhdY2agEy9DDL9gih0nxD4id1qd6ChU8NLHkyvc8WukL7ceT55nGtdGSNRKaGXmA0TCUefxrSHvsIXVW4AHv5eiUGSViD8Pzu+R9VYTeYbdWKMry4edNAZr85hg5ydSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908833; c=relaxed/simple;
	bh=aFVXyRCWOXPAW5c9Mil4gg7Bxe6qqfFysOO6fKMN/S8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DB4lT+l35cyDHerpDaNk4IZqkY92+fYMs7XfENOUWk0fJU+cKRVmPxEOqV3mBWvJ6kWj0TX2w6fs/6CrT1mzj9JYFoJDEyf10WOldzWR9qVwRzBX8Gkqe8XCGh6f1659MvZnZ8xqN1NaC4PVVy52H5ZrMDipe5y/2q/Nv1Jz2Ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yLLUOEyK; arc=fail smtp.client-ip=40.107.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yLLUOEyK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+FZuY10rChkwSQkBTI8sg8Xqdazc+N45D05fGxAOSlwoZzT/8xX8AdG3tllzrQq9mfVN5RoQd8coKjA8y4y8fdF1LfDErCx/RF0Ji7RXoBay0oC5e+lkWLJWxnekzto4Z+Dpq+BIZpsMaz9MtYSgQAxRCk5IGGishw0X+y2DdC7KDweh/OSs9cK1xV8sEv6cMlD35n+LBbLCtMAzgycLZV5/2pJQpz+f2Z9mkFGSt8wKTxqw9q2+AKf5URURm0Ue1L8xXX2SX8N/d+6+/AzZrhWSCDykindSJeR9VVRmr7cG0Y4NEalVd8DKEiuhrYvzc60qWfK4c4loMBkmV4CaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh24SQwF2V6ThSgtVWF0aFzK5cIQogZIFVXeg7JCmDc=;
 b=vd+Kydgxb3nq85RuqaZva1SjsDfzGIiIMjhwsWNonruJryBhdP8SW0SBJXMEHjLWVqV3/393PbL7x/9Mmac458nZeMU4SLbGtMoAyoy4YI2cXDBCNtovYIHY6uoUSe+ahmb21DFR6ZnP/NQQpuNtND0qkvDhAixCDPVRlHYMiVaXPlLDNqh7xWh6SAEcC9+hx7rcqXPZeYgARkmVyTllseuPqGlIER5hNumCAyyxkJNsCtDm8szU2ubMW0gy4jseQqwviMNNxpoOLIrlKtXWnHbvNYSY7M5lsw2YSMziHGHDaswuPlVrZOi/GbhuQgl3zbi+fxanGv9nRqvI9U4sDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh24SQwF2V6ThSgtVWF0aFzK5cIQogZIFVXeg7JCmDc=;
 b=yLLUOEyKail2ughdenoTgXIfYbT68OYTbLxbgHrlDjBrxSJtAm7uTC3ceF6dAsTar9LkRmiW3HbM5dAMZoXLlXROOMHgiaWN0M1/wgbJLVOxA5J3RZktW5NvknQV0fSJ1nL8VlBc5MUKkiDf8UG3y9qijgOeBUHsO9Ns97x0rxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SJ2PR12MB7847.namprd12.prod.outlook.com (2603:10b6:a03:4d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 16:53:46 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 16:53:46 +0000
Message-ID: <4c1fe9b6-4081-426a-82ca-59276bd5f300@amd.com>
Date: Thu, 17 Apr 2025 12:53:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250416191411.1482060-1-pratap.nirujogi@amd.com>
 <1ae7245f-54e3-8fef-db0a-43479ed514b3@linux.intel.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <1ae7245f-54e3-8fef-db0a-43479ed514b3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0433.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::13) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SJ2PR12MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b53611-2564-4c01-2ebf-08dd7dd06b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWRUaDNndUFjb0VrNllCRjBQVUljbHhGcXpLdUVPV0c0S1EvMHpKeEhoaEFD?=
 =?utf-8?B?U01rMXNjcmNVaStuK0h6bkJ2SHA3YUVXYXNUUHFMelYvem5oeCtiSGhHOVZT?=
 =?utf-8?B?M3krRlZCRnlMUUZQNGV4Y1h5MnFLd1VuNjQ1c0hjMVM3RC9HOVc4L2w3UkpP?=
 =?utf-8?B?TWx3ZFRJRGpTSVJ5em9wMXpSbXNUYytOR0hYcnRBNzlCSEZyNnJXUGlqdEp2?=
 =?utf-8?B?V1g3NFdVVE1OVlZVaXYySGIrN2lRemJiSDVPMGtTMGRvZUJNTzJGMHM3T1BG?=
 =?utf-8?B?M1dNeWlCT2tvankwelpnL3dEbTZUNlJ0Z21JQjJZOGgvS1dtQVVFSTkxTHNk?=
 =?utf-8?B?b3NzcUFqcm1IbnJmNnRjZ1lDenZ1Q1o0UXJOejROUEI4VmhPd3N3T2UzeFpD?=
 =?utf-8?B?Qm5qN1NuT0l3T1dNT2JFTUprQ2FtVWtPTUdKK3pSVGR3Z2hiNi9aUWlValFV?=
 =?utf-8?B?SHczNWxwdW01a2NsRlBGMWM2ZkR3TG9obEdqYTJDZHI1OEQyNzFCSUhyeEs2?=
 =?utf-8?B?VlEyUmxScGV0MnlMWlhjNmR3dEFlTzluZjVwL3FBZmRnTW9OanhIcTYyL1Vw?=
 =?utf-8?B?VTRLYW5TTjU4OTA0WUtOanRIYjlaK0pmM0FnelNQU3Y1RGhiWXVPeVZWRldO?=
 =?utf-8?B?dmI3a2prZExyclBHVXc4Z2FQL2s4cTBSMi9zWXF2aFZhTEhxcTFWOW9JK1BJ?=
 =?utf-8?B?amVzVUxvVTdsNG9XM2VFMW1OTHpCZEp5clhDZ3FTQ2RJRkxWb29CTS93NE02?=
 =?utf-8?B?TCtCTEd6Rk5KOE5HYUd3a09tZTRidEdmL2NOUHBTN3d5b0JNNllPUkwyd1E4?=
 =?utf-8?B?Q0xQeXMyeVBuMnJMbEFIS0ZCTzhURHhUblRlcFl4dkF4QWl0UzRsMWI3emF6?=
 =?utf-8?B?bjZ2cW1YNWhlMzIrMG5NYVEydmE2SklLSWRBaSsxdHEvNk56S0dpcWNhbk9m?=
 =?utf-8?B?UTQ4Y0Q2WkxUUkxJUG8wMG83Y083ODdvZCttYTlLWWMwZ3RtenZRTVJXZ2VR?=
 =?utf-8?B?ZDlxRjQ4K2hRRmVTcUNPNW9rUEYzRE0wdXFlTExVOWJOb1loem8vVzFiWlI5?=
 =?utf-8?B?dXdvUFU4TDB2T3YrVS92cVJEWnFSQjVxcWNOWVhCOExtUWk2aCtNdG5PeU0z?=
 =?utf-8?B?RXIwdjlrTXp1R3Z0T0JsUDVBVzB0V0orQmNhVW45TWZtTFFEWG1sRXEyTmQy?=
 =?utf-8?B?ckVxdVVNMm5TYTlHQkFpQUJhMk5DQ1JiaGNnb3oyTktQbkFOT2VEZDc5aE1z?=
 =?utf-8?B?MFlnQ3BFbkZVWEtJRjNxaytQenpSZUYzaUQxUjZNcnpiY21FcThYSlZWekVB?=
 =?utf-8?B?MXFlVXdDVzNLL0JNT21Vdk0reGV4R3piM3lMUVdKVmdsQ05vbzlUUnN1RXZB?=
 =?utf-8?B?eDFYUU5iUlp6Vjk0bmc3Z0g4ejV4Q1V5T3IrUVZTV3N4bDVqNmMrTVpXVmJF?=
 =?utf-8?B?NU9ydCtYL0w3a0JFaitGOHZBRkJYTVBhY3NnTmxXOUp0bjZKRmZURVlWaUZy?=
 =?utf-8?B?R2l4bUdWdWdWZ21GV3lOZHZKRitubW9vdHFhQWdxSHl6aDRNZm5wWE03S2hz?=
 =?utf-8?B?WTBrUnZNZWZIelQ1cnR3VmFTQTZIc3Zod1c1ZnFlRVpPc0pOaERsZWJBbkU0?=
 =?utf-8?B?T3FYNEJuWURtQnhKa1Z0ZytUS0ZEQWxQKzBDa3F1Nnhza0xISDcvQitpbE9N?=
 =?utf-8?B?UjgzbUl2dU9TK1RCbzR3VjYxc1RCemFSN3IzeEROV0RMYlBVSXI2bktiaUNq?=
 =?utf-8?B?SjNoeWVaZkNjSGY2bHV2YUI5cTdPOGVMdFA3cDNGVWwrbHdZTzRCdjhCdjRO?=
 =?utf-8?B?SFZheEllMFkySllFd2lHTm1GeThkY2hrQ0NtQjZSSEIvL1daRU9CbkRjbnhY?=
 =?utf-8?B?Vkxwdlk0bzJDZXhRTG51WUY2M0ZreUcxM01jV2NtalZiakMwNFF3TG9GQWE2?=
 =?utf-8?Q?RVUb9nH7C1Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UENtUTJZMmVoOTFNUjlGZ2ZQUWJjTEhMNU5tdktBaDdSVHQvbEc4dUpEMXZq?=
 =?utf-8?B?UTYyb0NxZnp3cVIwRzRqMEdGZGhPN3RTamhSZWxHTlQzMVJ0blZOUDU5YjVV?=
 =?utf-8?B?TkRST2NjTDdkMG55a2QyN3duUmUrRWE0VDduMXpDMU9PVDFBM1E5OWUvMlh2?=
 =?utf-8?B?NXFxQUZIUHByb0xFaHpvOUpvbHJzSWd6S0lmSkduOWorQ2V5WEFLcHhQN0lT?=
 =?utf-8?B?K1hGVDF3a0pua281TlJ1eGhSNDFIdjJOYXlIZ25NRWl5Uk1lSWY1cXhzY0xx?=
 =?utf-8?B?VEVUT3U3UkhBS1hIVjAwVVY4VDNjTVczdnIvdkgzMXRGOFk4U3Y2aGNhM1J6?=
 =?utf-8?B?Z2JJamhUWTVCVnExTGtERWU1U3ljcEpML01EaTRCanczY3JIbVZMYTMvTHNJ?=
 =?utf-8?B?NEV2YkNvZVc2eFN6TGxWRUZWYnFYdDlBaklya3pSQkRGQUlqK21vdy9VOXdM?=
 =?utf-8?B?UE4yM2lRZ2VxWFlZWVc2Y1VkYTdFdTl2N3lmUXdSN0s5ZlpPdjFxTThLblE5?=
 =?utf-8?B?cWZiNFY5ditEcDZOdXhHMWl3d1RxY0pETXdlV2g1S0N4UjYxN2doV2ZxTmlK?=
 =?utf-8?B?YUNPeFNUbXVTbHRBOFNZQzhYY0YyNXZzay9uWlk1L2dYUGhmbndWc3ZJN1Fj?=
 =?utf-8?B?RHltc3MxK0xWUDRCVkRHNnVweWFmVk05Rm5RQnMwakVldTgzTGQwQXg4UlNB?=
 =?utf-8?B?Z1lwai9MeGdYTmoxLzdzRzFucXlOVGxJdEpKK3hTSmw2NHg5QzF3T2lSK0h1?=
 =?utf-8?B?S0ZZSjhtQzNXeXN5d21DWk5PWk81eDRXYnVnYVo3VnVreUpIb0lyc3NEQ3Ev?=
 =?utf-8?B?Q0JzTm9XWnVUNHdVUEJlZEVYejRHQWx4aFJLd3JTL0ZVOTdCWnV1TVV4anJG?=
 =?utf-8?B?em5GcU12UStpYnNWRStYZlNxNUlhZTh0THZ5TXl6Vkw2RFk4eFRGN1NFeDd3?=
 =?utf-8?B?MzE5MzQxVDBCVXorWWVRVElGcklITUpSVy9tWjNXZXRSaXc2eVBaRHdpVkwy?=
 =?utf-8?B?ekFvamIveG4rRXFLRjk4RUZIU1YzaTJPZGxzbVRMV0IwdDFxMk10ZjAvaDFq?=
 =?utf-8?B?Nm1iYTZicFVCY3Z1RXIxRXRsMzNLSWZuK2JTUjVqS0t6alB3aENNZzBtakI1?=
 =?utf-8?B?dWNwRnBTakFYMmw2T255ZHJBTXZRWFRkb1hveWNMUU5mb3UxYkg0N0lFVmZ3?=
 =?utf-8?B?cjIrbDNBTjdNSGdWNVlQbjQwRzM0dlY0aVZBKzdBa29HbzVvSU5vSy9OL0hW?=
 =?utf-8?B?WDVoMEJ3WUd2L1VMdnJ6NTR5bC9GdTgydXhrek5BZmNtODlzcGtwNTZ6Nm5K?=
 =?utf-8?B?ZXhaTkdWV1I0YVRyWDFYUk1uSzV5bjhFZE5zUGRkdXNIeUl4QmtCSnpLWGVV?=
 =?utf-8?B?UlhtZHFhQ1RtZXV1RFhHMFIyN3RlbFM1Z0VhL0dhWmVjRmlxanlyZU1FOXpM?=
 =?utf-8?B?MVcxNnphL09ZZEVJakxPZmR3Um95Wk82MmhWOTJVa1lUb205UDV3NmRVTmRX?=
 =?utf-8?B?R2RPeURaZlBLL3k2T1dLcDdlTnI0cCtqVWZYY3ZpQUFkbjV3UFFDRmY4b0Vj?=
 =?utf-8?B?dlNIMGNid0M0ckwrRWdLemZqeGl5OGZVN2lNQXVwc1pnRTlYY3hoUjVGNmFn?=
 =?utf-8?B?UFMxUXgvYkI3ekZ6VUwvalc5cUxCY1BNR0dsSGVzZC9rWEppTmQ4MU04dEZj?=
 =?utf-8?B?b25ocmlvYmxHcWx4N1BFTzFsQk9NWGdmTG1aMjZ0NnhFbUEvdjU0SDFxdFVi?=
 =?utf-8?B?bkowaTFsc2plKzUvYWJvYk9rbGNYb1IyMC80OWgzamlFTjJWYVdMVHZZN1Z1?=
 =?utf-8?B?WHZPeGUyRnV2eWtYYm5pbUhtdkZxdWZMZ0h1NFdUcnhIT1kvNHRpaW8vYTVJ?=
 =?utf-8?B?ZHdQN2o0OEVQQURsaFp1bHhmNDc5cmFGMEJ1OTA3TlF5bzdGZ0JGM2FPdCtS?=
 =?utf-8?B?NGc4Nk5HeU9MQmZzMkE1YnY0b3dJRE9yeVA3OXlvVkdRKy92QkNDTCtsYTFq?=
 =?utf-8?B?dzUyK0Z0T29kNjY3NjJHNFI5WDljamVFakJxVG90aUFZSjFQZm1pVHo5N3dz?=
 =?utf-8?B?NDVpdmNmdzNDN1RXbFlKZEZGN3RGUlZLU0k1TVl2bXh4ZXkvU252ZVc1dncr?=
 =?utf-8?Q?sWwLfSntKxBlNUtNZO59RhlVa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b53611-2564-4c01-2ebf-08dd7dd06b17
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 16:53:46.1766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQqHMK4bDk5v6ryncy7eU3oBfahwmfeNif12IFr7e5r5rPKr2ghntCtwXzoPV3epyAngDBsqzJuJA4fFGVL8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7847

Hi Ilpo,

On 4/17/2025 5:29 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Wed, 16 Apr 2025, Pratap Nirujogi wrote:
> 
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>> Changes v5 -> v6:
>>
>> * Cleanup header files
>> * Avoid unnecessary casts
>> * Fix coding error with software_node_unregister_node_group()
>> * Use i2c_client_has_driver() to validate i2c client handle
>> * Address other cosmetic errors
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 278 ++++++++++++++++++++++++++++
>>   3 files changed, 290 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>> index c3e086ea64fc..ec755b5fc93c 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>
>>          This mechanism will only be activated on platforms that advertise a
>>          need for it.
>> +
>> +config AMD_ISP_PLATFORM
>> +     tristate "AMD ISP4 platform driver"
>> +     depends on I2C && X86_64 && ACPI && AMD_ISP4
>> +     help
>> +       Platform driver for AMD platforms containing image signal processor
>> +       gen 4. Provides camera sensor module board information to allow
>> +       sensor and V4L drivers to work properly.
>> +
>> +       This driver can also be built as a module.  If so, the module
>> +       will be called amd_isp4.
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
>> index c6c40bdcbded..b0e284b5d497 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>   obj-$(CONFIG_AMD_HSMP)               += hsmp/
>>   obj-$(CONFIG_AMD_PMF)                += pmf/
>>   obj-$(CONFIG_AMD_WBRF)               += wbrf.o
>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
>> new file mode 100644
>> index 000000000000..9d1abbcc915f
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,278 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * AMD ISP platform driver for sensor i2-client instantiation
>> + *
>> + * Copyright 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/units.h>
>> +
>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>> +
>> +/*
>> + * AMD ISP platform definition to configure the device properties
>> + * missing in the ACPI table.
>> + */
>> +struct amdisp_platform {
>> +     const char *name;
>> +     u8 i2c_addr;
>> +     u8 max_num_swnodes;
>> +     struct i2c_board_info board_info;
>> +     struct notifier_block i2c_nb;
>> +     struct i2c_client *i2c_dev;
>> +     const struct software_node **swnodes;
>> +};
>> +
>> +/* Top-level OV05C10 camera node property table */
>> +static const struct property_entry ov05c10_camera_props[] = {
>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>> +     { }
>> +};
>> +
>> +/* Root AMD ISP OV05C10 camera node definition */
>> +static const struct software_node camera_node = {
>> +     .name = AMDISP_OV05C10_HID,
>> +     .properties = ov05c10_camera_props,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * ports node for OV05C10.
>> + */
>> +static const struct software_node ports = {
>> +     .name = "ports",
>> +     .parent = &camera_node,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>> + * port node for OV05C10.
>> + */
>> +static const struct software_node port_node = {
>> +     .name = "port@",
>> +     .parent = &ports,
>> +};
>> +
>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
>> + */
>> +static const struct software_node remote_ep_isp_node = {
>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +};
>> +
>> +/*
>> + * Remote endpoint reference for isp node included in the
>> + * OV05C10 endpoint.
>> + */
>> +static const struct software_node_ref_args ov05c10_refs[] = {
>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +};
>> +
>> +/* OV05C supports one single link frequency */
>> +static const u64 ov05c10_link_freqs[] = {
>> +     925 * HZ_PER_MHZ,
>> +};
>> +
>> +/* OV05C supports only 2-lane configuration */
>> +static const u32 ov05c10_data_lanes[] = {
>> +     1,
>> +     2,
>> +};
>> +
>> +/* OV05C10 endpoint node properties table */
>> +static const struct property_entry ov05c10_endpoint_props[] = {
>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>> +                                  ARRAY_SIZE(ov05c10_data_lanes)),
>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
>> +                                  ARRAY_SIZE(ov05c10_link_freqs)),
>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>> +     { }
>> +};
>> +
>> +/* AMD ISP endpoint node definition */
>> +static const struct software_node endpoint_node = {
>> +     .name = "endpoint",
>> +     .parent = &port_node,
>> +     .properties = ov05c10_endpoint_props,
>> +};
>> +
>> +/*
>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>> + * fixed to align with the structure that v4l2 expects for successful
>> + * endpoint fwnode parsing.
>> + *
>> + * It is only the node property_entries that will vary for each platform
>> + * supporting different sensor modules.
>> + */
>> +#define NUM_SW_NODES 5
>> +
>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>> +     &camera_node,
>> +     &ports,
>> +     &port_node,
>> +     &endpoint_node,
>> +     &remote_ep_isp_node,
>> +     NULL
>> +};
>> +
>> +/* OV05C10 specific AMD ISP platform configuration */
>> +static const struct amdisp_platform amdisp_ov05c10_platform_config = {
>> +     .name = AMDISP_OV05C10_PLAT_NAME,
>> +     .board_info = {
>> +             .dev_name = "ov05c10",
>> +             I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>> +     },
>> +     .i2c_addr = AMDISP_OV05C10_I2C_ADDR,
>> +     .max_num_swnodes = NUM_SW_NODES,
>> +     .swnodes = ov05c10_nodes,
>> +};
>> +
>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>> +     { AMDISP_OV05C10_HID },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>> +
>> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>> +{
>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>> +}
>> +
>> +static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10, struct i2c_adapter *adap)
>> +{
>> +     struct i2c_board_info *info = &ov05c10->board_info;
>> +     struct i2c_client *i2c_dev;
>> +
>> +     if (ov05c10->i2c_dev)
>> +             return;
>> +
>> +     if (!info->addr) {
>> +             dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n", ov05c10->i2c_addr);
>> +             return;
>> +     }
>> +
>> +     i2c_dev = i2c_new_client_device(adap, info);
>> +     if (!i2c_client_has_driver(i2c_dev)) {
>> +             dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev);
>> +             return;
>> +     }
>> +     ov05c10->i2c_dev = i2c_dev;
>> +}
>> +
>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>> +                           unsigned long action, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = container_of(nb, struct amdisp_platform, i2c_nb);
>> +     struct device *dev = data;
>> +     struct i2c_client *client;
>> +     struct i2c_adapter *adap;
>> +
>> +     switch (action) {
>> +     case BUS_NOTIFY_ADD_DEVICE:
>> +             adap = i2c_verify_adapter(dev);
>> +             if (!adap)
>> +                     break;
>> +             if (is_isp_i2c_adapter(adap))
>> +                     instantiate_isp_i2c_client(ov05c10, adap);
>> +             break;
>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>> +             client = i2c_verify_client(dev);
>> +             if (!client)
>> +                     break;
>> +             if (ov05c10->i2c_dev == client) {
>> +                     dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
>> +                     ov05c10->i2c_dev = NULL;
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return NOTIFY_DONE;
>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(const struct amdisp_platform *src)
>> +{
>> +     struct amdisp_platform *isp_ov05c10;
>> +     const struct software_node **sw_nodes;
>> +     struct i2c_board_info *info;
>> +     int ret;
>> +
>> +     isp_ov05c10 = kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
>> +     if (!isp_ov05c10)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     info = &isp_ov05c10->board_info;
>> +
>> +     sw_nodes = (const struct software_node **)src->swnodes;
> 
> Did you forget to remove this cast?
> 
Oops, sorry I missed this one. Will fix it in V7. Thank you.

> --
>   i.
> 
>> +     ret = software_node_register_node_group(sw_nodes);
>> +     if (ret)
>> +             goto error_free_platform;
>> +
>> +     info->swnode = src->swnodes[0];
>> +
>> +     return isp_ov05c10;
>> +
>> +error_free_platform:
>> +     kfree(isp_ov05c10);
>> +     return ERR_PTR(ret);
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10;
>> +     int ret;
>> +
>> +     ov05c10 = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
>> +     if (IS_ERR(ov05c10))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>> +                                  "failed to prepare AMD ISP platform fwnode\n");
>> +
>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     if (ret)
>> +             goto error_free_platform;
>> +
>> +     platform_set_drvdata(pdev, ov05c10);
>> +     return 0;
>> +
>> +error_free_platform:
>> +     kfree(ov05c10);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>> +
>> +     bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     i2c_unregister_device(ov05c10->i2c_dev);
>> +     software_node_unregister_node_group(ov05c10->swnodes);
>> +     kfree(ov05c10);
>> +}
>> +
>> +static struct platform_driver amd_isp_platform_driver = {
>> +     .driver = {
>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>> +             .acpi_match_table       = amdisp_sensor_ids,
>> +     },
>> +     .probe  = amd_isp_probe,
>> +     .remove = amd_isp_remove,
>> +};
>> +
>> +module_platform_driver(amd_isp_platform_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>> +MODULE_LICENSE("GPL");
>>

