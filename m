Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53528466D;
	Wed, 25 Jun 2025 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750870413; cv=fail; b=lo1/De9mYUgPNklLAeTfPMZMERgYcRI0HBNQb8IsRrSQDP3BwFYu2HGotl+pYKCp0mhnP1GX9fkBSInm2tI1Ge37lYi7cmvhLJSijmCbS6SXSD0eGkXH7NX8LrDm+WC/uYccbLI1PU7PJ8ULdeR6CUw4py0LHCjYesNO5zvpqWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750870413; c=relaxed/simple;
	bh=Kotv7tupl9MJ5SEhqxAXhbncz/FVlPGkt6TiZ61AP6M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l6hJpzD7Cx3A4NJbhCbY8CPUhnJK5JjqW+3Lwpl9IF2NdpAkVe4N1GjcLcHiGW0PtNNcuFZmqnHtKxSDSJG5feIjxIwVCIfSiDBEkFPaqXxvsAMRVmfuz87J2QzX+yvz5I9cS6rNyARfpvN1/DuvoxFctIdnAoPqJYCt2t+DduQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=suQEa2lq; arc=fail smtp.client-ip=40.107.93.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="suQEa2lq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Onix4myR9R/akMvSz36TJKOt5ANw8iD97X0u8bYPYV40ZRaTwwxEJ/xVjeimwnf+FM5HJ6CMBE/PBnUN40Y1GQKhqgikP6KWrOGHGl8UmGjBo2Ld/Krza8AZHXGqU3y+5Ktl2lLPWjsQoy0fs/b0YcaYFciK1Og0DiFHSJgzzqnb5IE+BT+YZVOeOdjJV/O1fhXy+eZpOfuLK5rwIdIETlqopxFsvMoZGiFnk12Epjdnt1moeSE9ynUg5/BarTlqWpPkGtEGMhftmLPubMg42yl9FzsRsdogELa7Cka82TRsuXjqvDRYj6m6gQiLOHTnvN5au8ISI7upOfyN47gG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQVkiG6g3dQ5QhtlDrNSpHJWgxf57sxNcRL/R9POUds=;
 b=U+uOKyWQkYHlXjSXwpWX7FgvT7eSNOQphihnDwJj8GGwajf9jJL9FLY8t1AIU7KbYFYryd+xEFsHeEMW1WvA+Lx5jjxBmXuHavda+xxw5WwpHOvJo53v/P1khJk6i1OPhMWNnba7seWGJ5H6tl2WT2c61eVVyuAY86BMsRbDQyp0Aj7wS8c+DCzgfC8LrBA58Mziy+Jk+WrpZUjEjmPLQtTscCh0iddwwmJaUeIjEoPSmV3ygulEvYdtn2Nje7y01N+IqCa9Kd05wCnDdaeW1BPz2JYI1gmCc6+G0wslkubxZ0AM3i+izhLhEkut5K3lHVt4+90owDNtl7RKwkTsQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQVkiG6g3dQ5QhtlDrNSpHJWgxf57sxNcRL/R9POUds=;
 b=suQEa2lqzOOpM4WJaAxBHbykVLQrcSjT6OBYHPEd8jU0BK5sBbHlrXOXCLtrlzHRvWD4vEDadnsaiCf1eXzBJYFd6ik08lGsS/AuWZoeMe9IPWbfOs16dBPs/zCwLKqGijsDoXbLaTY6OnezW8KLQeix8TqSI4NTE8BQ9fEq8xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DS7PR12MB9527.namprd12.prod.outlook.com (2603:10b6:8:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 16:53:28 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 16:53:28 +0000
Message-ID: <6484f9c4-894d-40f3-937c-ccbd6adef61b@amd.com>
Date: Wed, 25 Jun 2025 11:53:24 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 08/32] x86,fs/resctrl: Consolidate monitoring related
 data from rdt_resource
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
 <f6d15921bff2d698d0cc0b2a35d2361c846203e6.1749848715.git.babu.moger@amd.com>
 <356a213e-d8a4-420c-adc1-1f58b4feef1d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <356a213e-d8a4-420c-adc1-1f58b4feef1d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0027.namprd08.prod.outlook.com
 (2603:10b6:805:66::40) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DS7PR12MB9527:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b6fa5c-ad12-49c3-7f4e-08ddb408cf11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3VlWnhtY1RxK0QvTktXRlpYWFlBRTZya1U3TlU0N09XRmdBdnY0UGNBZ1lv?=
 =?utf-8?B?VDFBVGw1eDRLbklCbm9Yd3Nick81enZSR0E4L1A2NTZHdjdvdW44R0N1aW5T?=
 =?utf-8?B?YUpnLyswZ25GMC9iczZlSlJXTmJzdFJtcE9OSWhFNlNLZVZFNTZxV0htUjFj?=
 =?utf-8?B?TUNIcE5JeXYrUUhTTzU1WFIwYzlTQkVuRjdJeFNHTkJjWmRwL3A5TlJRaVpp?=
 =?utf-8?B?OEkzU2RvV2xhNEM3QXAzS3FJZmMzbUNaSFlpTFViQ2ZTbHk4TFJCWVFmY0Z4?=
 =?utf-8?B?MmlCenhaMWloZGJjNEtHQTNBMTVCYTdBVUFrMlN4Q2xQVGRsN1U4enE0dEcw?=
 =?utf-8?B?NkVOTDhpQ1NIUUllUEo5N05kRXZ3cnFlWnBaL1NudUM4b0pyZDlpbFI3dmZI?=
 =?utf-8?B?UVppZEIyVThlOVBBd2I2UzUzRk5aa0I0WE5sZjgyRm1Cd3ZYbWE3RU9RYnRD?=
 =?utf-8?B?cGx4c1NFZG9qTmtZRk13NVhEaUVGYkkvNW1tZ2FRc0Z5ZHZwWFBtSTY5czBC?=
 =?utf-8?B?b1FwNHJZcDR2bmZMbHc4U2FQVk1YbGVEc0NPenFxUG9VVithUnQyeVBMcWdt?=
 =?utf-8?B?ZlpsbE5zaFdSZmpNMW1IamhjcGxsZS84QnkxNFRlWm92b0tXdlVKZzhaSzU5?=
 =?utf-8?B?R20zU2dFUlpyWTk1T2phSDNxdTdDRHd4bWFMeStxZTZQUHRTQVhUeUhrL0Rq?=
 =?utf-8?B?eUVQNVh5UHdVSnVmOHlIZUErK3dDaSsyWW9obVVNc2xmeGNmUFYyK01mc3N1?=
 =?utf-8?B?MGJqbVUvaEpOU25ybWhvazRNam9rUjBjZHNNZk04SllmQlhPZXVjL0E1bTd2?=
 =?utf-8?B?QmtrdWpRckxRM3NWdm0wZmo3NTd5RCs3RWJmc3EvdDgvTzRrSjVxY3VRMGVQ?=
 =?utf-8?B?N2p6MU91R015a3RZcnVQVGpOMU1sb3FrRDJOS0ZCUFdjVFpmbjh5TnpHUkVw?=
 =?utf-8?B?UzczN2t5djl3NEs4TnptUVlJcEI5V2NQTElMT3FOYXloWmNyUlB4ZDl0ZnhB?=
 =?utf-8?B?VEQzSnMyZXZ2dUZaM05RYUR4M1FoU2JSN3NZWUlwMWR3NGJMYkdWUkN3Y1R0?=
 =?utf-8?B?SVg0aFBDRmIxVDlhUVV1aWUyTFBFNmkrdy93SURSN0JnQ3lqUnJ3aTJUSEpG?=
 =?utf-8?B?bFpEbTMxeGlnQ1N0RTVjeVJ0cFpJMTZWTlpYVEZHY3EzT3NCcTdhbXJvd2Q0?=
 =?utf-8?B?QWZJODhQSjh4dGx3NFpjN2N2bkQ3bWtaWHdERXJ3UzYrSHZjZElHUG9WZzJz?=
 =?utf-8?B?djNUZTRqZkJNNllUQXpidXVhWElFbE9CL0taWEFjMFpJSTVXZDNyTXUvREta?=
 =?utf-8?B?TXgxNUYzWVhyTEJ5REZhaEozTUFGNDVFSmMwQ3JXZGhEVDhIR3kxU1FUdHUv?=
 =?utf-8?B?aUFrK0dCeDdRSHpKQTgrUjM1M01SRFJ4N0dza2djUzE4RDJ5RllndE1UclFS?=
 =?utf-8?B?OFpOSENDUmhZVGIzSzd6bUM4NzlQSDBhV2xNSVo3VHRGNFNHZDdLeDhmQXM2?=
 =?utf-8?B?VjFERDlwZUtEdG9xcEVFOXJmRVVrVzhmdmt1VVhrQml6WWNCZHZ3UHU2VzBq?=
 =?utf-8?B?QUVPRXcvRzB5ZS9TazVYVERmYmt4YTJRZ1RJTkpWN1FPZkIrUHk1Qk90dS84?=
 =?utf-8?B?L3hVbVJJN1B6U21mRUNydVpHSmFkMlFtUjBnQlE0M3Qvb2gxZ1RVL1NRSU00?=
 =?utf-8?B?c25MNVoremh6amtPUzVtalFFUmxpUXk1eDlnWVNFa0c3RW53TWZRS2huanVT?=
 =?utf-8?B?MWtwR2JlUkN4anNFVHJpWVRTUzRreDNUZUdseHZvdm02ckY4N21kZDdJOVlX?=
 =?utf-8?B?RmxvSUcrVUhJTmFjSTJSSVZVemZHRVRrU0JBVEJ5L0RkK2lBeXpxZzhsUDJH?=
 =?utf-8?B?NytqTU0reXBMUHVwWS9lNFJMa1pwbUkrd3pWM1ljTlZwc0xvSGhjVzR0Wk53?=
 =?utf-8?Q?BWDqCJWobSY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVJENFhiMWxZM0o1b090cDRTYnozZTB3WWtoTVRzbmZUM2lOSkxObmRkUU5x?=
 =?utf-8?B?Sml5OU1rV1NoM2ErRlBUeGowTzM0QXlBd1psR0tEb28zSVlqQXNGdGU5a3lp?=
 =?utf-8?B?dEVhaFlONkxiaCtOcXFRUzFLZkpUWjRrYytPcUxLQ2x2aXhFMlY3RFRXWjFa?=
 =?utf-8?B?OU1qRHlvWGQ5TWplQWhHRUVrMmxIRnBvVVdHdklXVEdvQXBlVHYzMFZiWjJz?=
 =?utf-8?B?dGVWeEd1UGVONW1uYVpWbzNFMTNSanRXQ3hINTBkK1N1WDlsU1NyUk5UT09D?=
 =?utf-8?B?ZXlscFVXdEdVSHBvQXdZNTd6Ykh6TmVVc0RaUk13NlRvK0VaaEdLK2x1YjIz?=
 =?utf-8?B?VlhOQlNiTWNId0ZsYzMrdkdTMXJkVUwrTXJTdy9adXFjSGFyaTE4TFlmeWhC?=
 =?utf-8?B?UWJIaGFBanFnQkJqWkRwdkNRTFE5WWprUVRiVnBFWkgwZUwzcTJIcjhDNFVv?=
 =?utf-8?B?Q3BaUWt4dGJUNmhqckhJeGlyQnRRRVpVblhHN3R0d1FCcWwyRjNSdmZ2eG9k?=
 =?utf-8?B?UC9UVHNxcHJEVEFOeVZIWEJNMjFXL3dYb3JQLzU0K21pNVJsVzVBT0RlTVdK?=
 =?utf-8?B?V3ptcVd3ZVRrb2dmY2VwVlBiQW9QRTN0dkV0RHN6OGxoS3lYbXFCTko4d1ZB?=
 =?utf-8?B?aHFLVUlhcVN6VFBYWExUYWRzbWo3dFNNdUJYajk0RXVuSjVTNU1WeGtGSjd4?=
 =?utf-8?B?NkM4czhnbGhNb1dxQlVpclk4NVc2SXROdEhBSkRNWWRZQzZOaXB5dHFPek0z?=
 =?utf-8?B?ZHZpUGl4R0NZbG9nSUo0RG9rOGZxcGFqTGlkaDgyV2NJdlFxeWdlYVduTVlI?=
 =?utf-8?B?RFd6bUJwZmRqL210RFIxWCtjV2IrcTNXRk5ZcVRCUEVEd20rMzcvT0o0dnky?=
 =?utf-8?B?YXBvNFZxSXozc3g4RDVCa0VrbWNpbzRrWnFuYm9iczU4UFlMWGFXOWswUkxT?=
 =?utf-8?B?QkwwS0V1NEhHNzNVSU5RVncwWFVyb3hkUm9IQ2dUKy9aMDYxSk1lNDc5UEVj?=
 =?utf-8?B?dUFjRTliU3N5bUJ0Sk5TMUJjeWszTm5hMVE2dHpvdEQzUkI5VEcwaVJZUGor?=
 =?utf-8?B?RFhFTXh1VERjOUtFdHhvU0UwTkV3SlpZU0pJOC81Rm1HQkdyV1lJb1hQd0Vl?=
 =?utf-8?B?WnFZOGJxNEhiV1F6ME5ERFlXTWRQUVVScDJFKzVnN09JN1JicyswNVl3bHBO?=
 =?utf-8?B?Zy83OSs4b0kxUUxLenU1cVN0SUh1MGI2Tzg3YTVQbTFJcS9pclpaN1hUc3cy?=
 =?utf-8?B?Rm9YMHNoam42S0Q1V2Jvb1A2K2NKOEdyeFJBaTRldFRPLzYrTG1oRmJYUWlT?=
 =?utf-8?B?RjVtYThieWhLSlIxaXpvRzM1b3c4NFl1dUVUV3BXczNKdEFEdjREQnlvT0pX?=
 =?utf-8?B?Qjd5YXYrbmxmMjJKY2tsTmRTelNWM2UvWkxMemZPczdqMzBHWEVxOFNyZ0cx?=
 =?utf-8?B?NWxHVnhwanBnanlVamxnRFNRbnBneDlSbnl2VzJxdW9jOUF1a0twTUE5SzA4?=
 =?utf-8?B?bjkwNXdvVTBCczVNeHBTZXlvaTVPTUlQWFJLUjBsRTBUekdTY2ZHS2VleEpP?=
 =?utf-8?B?VmxiS3lLRzljQ2tuMnhKaEF2TlFrUUV3TmVyNjRFRjNhdFB3TEJYRU1nZWpH?=
 =?utf-8?B?UlhIREZnTmhzaUhUVW11cy9KVnhPWFZYeU1xMkcrcGlJd1h5RXZzOCtnTlVG?=
 =?utf-8?B?VXhzTk04ZVdHaGpvZWp4SHhydEZPc21EcXB1MXpjRmg2YlEwSU81MWlOalA0?=
 =?utf-8?B?V2xjSFJnY2NoSENmM0h2NzgzZnRaYUc0WGNDNFNsdGkwT3JBcHdLdlEvbTNk?=
 =?utf-8?B?OGZGQkZnSVZMNVhSa2VaaGwvOUM0bnJUK0Z5ZU5Hejl2Ny8vTFNWS2wyaTJx?=
 =?utf-8?B?MEdaa2dTOEJYTTFwSVlTdi8rODE3cFdqb1FqOFppbmI3YXc0R3ZwdzcxRnB0?=
 =?utf-8?B?SFR4ZUN5YnN2TXNsQ2h6bHE5S3NsQ1RQMitTaDVHdHZmOGdPd3JTOXg0MHZV?=
 =?utf-8?B?UUtFSVRMaS9YdjNQcXVaVTkyMWVONnJlSkpoZHRER1g5cXQ2RGhFd3BPZG9R?=
 =?utf-8?B?eGdjcjluNkxEVVRhMGNZWGI0WVFNQlFuYmZHYnRTY3pUOUJUTjJHakw2anJN?=
 =?utf-8?Q?ZY5w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b6fa5c-ad12-49c3-7f4e-08ddb408cf11
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 16:53:28.5639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4LDLKrigsGeaEwChrih5JY3NnvVDtLdMJiELYWlJKb390E3lB+4ae8C/5+hxoxM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9527

Hi Reinette,

On 6/24/25 16:32, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:04 PM, Babu Moger wrote:
> 
> ...
> 
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index bbe57eff962b..22766b8b670b 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -255,38 +255,46 @@ enum resctrl_schema_fmt {
>>  	RESCTRL_SCHEMA_RANGE,
>>  };
>>  
>> +/**
>> + * struct resctrl_mon - Monitoring related data of a resctrl resource.
>> + * @num_rmid:		Number of RMIDs available.
>> + * @mbm_cfg_mask:	Memory transactions that can be tracked when bandwidth
>> + *			monitoring events are configured.
> 
> "are configured" -> "can be configured" (like it was before). This is a property
> that is discovered from hardware. The feature need not be in use for the property
> to be valid.

Sure.


> Also, this version switches "Bandwidth sources" -> "Memory transactions". I think this
> is a good change but it may be unexpected. Perhaps a snippet in changelog to
> point out the motivation for this change: "Also switch "bandwidth sources" term
> to "memory transactions" to use consistent term within resctrl for related monitoring
> features". Please feel free to improve.
> 

Sure. This is how it looks now.

"The cache allocation and memory bandwidth allocation feature properties
are consolidated into struct resctrl_cache and struct resctrl_membw
respectively.

In preparation for more monitoring properties that will clobber the
existing resource struct more, re-organize the monitoring specific
properties to also be in a separate structure.

Also switch "bandwidth sources" term to "memory transactions" to use
consistent term within resctrl for related monitoring features."

-- 
Thanks
Babu Moger
