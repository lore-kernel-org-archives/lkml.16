Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF03BA33
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282254; cv=fail; b=CjQkmR21rG19jObSQJo7T7lAIdvzYnZE5GLjw5stEBzurUYt4VwN1jDaq5YQSWmdwjgMntMGlY858nS7gdRhcKFphsLkkQyHzrcrqW6QHvXFCumwYGQRgq2pI0uMzcBSWSW7oSANR6d3wHYfzSqrAYla4MKjJyMeQ6+0zi041eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282254; c=relaxed/simple;
	bh=wzfBKXpEsOGIX4StcGeeck1tAJn65LJRHUpJWO6XeiQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m/jbt2tfQdtzb0P5rztSnG/gkEBHcaSRU6SIsBEZ0AILsts5Oqdwrq31hOPmJjJWJsVOJZILnyKghCbKhK1VInAMTTrQFPdHja7OyF+c4umypWSTg5a7cOy2pVpv2Q1UvnW/N/5k3vtVs2XICKHSigxWWF/DqcLRs4H+zu6+qjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sihFmZwN; arc=fail smtp.client-ip=40.107.212.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sihFmZwN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoTK33OHefIJm/QImEVuy0KcU84eowYEcfm3CK+spZT9YOSATPQgr4FyfDNXYo2P5hj01CMmwxdWGHbXGz5aKF8h00Nkbr/8+2OhSgFmabaLp5qTqWC6XXV4PBp8mFt6cE5TdYz7Cb6XMzSWuWobVz7D5uo5qkR9MG7d0NSSy4SCW9hpXRKzEUPHVqMcCSjvkla5FkD294h/RuECO0OsusXl9OOG49Svz18PyhKiYuP1ufFv0gDGlVA+hJ10qljryh2ppQIP+VEqOyQ0lYFgjPNLt2QC35Tc2E43UEk3PzdPzmTtK55oHfI/aUELpL7z13tq/7swx7dyPy/SKjrLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RFHyD9x1EA6okdNX9I8GQ0ql6GloBpmq3b0JYZwZwg=;
 b=frSZN5w+qf3e1qNgBq9qCUmEJShvbe7UVBuamhkKgdCLiU9ioo0gAF0HPNI02y7vL22AuPHoM0vQ1+qPpqESdWRAPFvEJxN2kWlYH9FB9KjFo8k+1ahlC/uxXc3ujfeJTlQU2N4iv6Mb+/HBDdXv+wLiyVV+otnIbKQZnuz+agVRdbcx965746NO0aExYbt/LE8NI6NW8GDR+4YRRYwSVfyv82uxe8jK3zdi/StzFFCo94OiB1ecsdpD4YQszIeBOZKzGfGlsRCBn0OXrmY2KTnALtjSEodNpgVMPFGt72c2axGNy0RtJ23mGsmm6SiR0nVujuz8MfpOfrXFB793rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RFHyD9x1EA6okdNX9I8GQ0ql6GloBpmq3b0JYZwZwg=;
 b=sihFmZwNcVaCp6srnLCcNFBk9/2mfzHTXHnlMK7OUHcwJBMXxafqNrTedTbX9Ffp01bBoDpmgARoQY2++Pt1IS8B9eng56tbdMS5T6tJVg6s+muELfsbZAQ10fj36/Cisc+XbyLvb6cjtZfpVfkOAuk81kVdplx9owv2kdltLKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by CH2PR12MB9460.namprd12.prod.outlook.com (2603:10b6:610:27f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 10:50:50 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 10:50:50 +0000
Message-ID: <c0fc9e59-ba64-4faa-a03f-f8940fb466a1@amd.com>
Date: Thu, 10 Apr 2025 16:20:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: page_alloc: tighten up find_suitable_fallback()
To: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Brendan Jackman <jackmanb@google.com>,
 Mel Gorman <mgorman@techsingularity.net>, Carlos Song <carlos.song@nxp.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250407180154.63348-1-hannes@cmpxchg.org>
 <20250407180154.63348-2-hannes@cmpxchg.org>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250407180154.63348-2-hannes@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::25) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|CH2PR12MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: f39ea7f7-9b1d-4835-2533-08dd781d8ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3hRb2p4ZFNLSXU0VndDQUdzOG1sOUVyVC94a1dsT0FpRTB3Z3NPbzhiTjBM?=
 =?utf-8?B?QjlZQU11WExZUEVtTm1seVdwc1RQRWdXWThza1gvYSt1eHhFUzdSWmJ1Mmpn?=
 =?utf-8?B?QlB2MVZNenEva0JtenU5M1JNdkp4L3RwYkxBb2tmM3IyL1FSMVl4eGtmSUJ4?=
 =?utf-8?B?dlVxaDJDT2FtMnR4QjRLcXI3aDBtVThHOSt3eUlxUFNNNi9Oa2pGV29WVXlv?=
 =?utf-8?B?TW1ZdkJ3amFxZTcwNWJJMDBxNHVQbHJkVWY4eDVhNUFwZG9jZUZrUHMrMDhQ?=
 =?utf-8?B?SFdoWW9XVHpMOUN6VlEvN2ZoZFhmRUtpblFPc0RuOGZTd25wSTRPZGJwazZr?=
 =?utf-8?B?dUIrT2VRSzVPR2ZKY2NTdHZrVjFucUJNanBzeVZkcFhVMFNpU0lBdjRwWUZF?=
 =?utf-8?B?NDJrR1pYK3FKTnU3dDU5R2hEVllWRkt2OGVBZWxRc1NjbThaZ3FjN0xpVkpi?=
 =?utf-8?B?RmVjbk1tL0JQUEloQ0w1N0J3eGhPVWFJUDJxTm1yUjhMRm1HbVNkdnR1dGN1?=
 =?utf-8?B?enc0anlYMzlocDY3dnRtKzVDUWdKWUx1cmp1MXQxRVduTWVCK1k4MlN3YmdP?=
 =?utf-8?B?aXVUMC9XeDB1dVlTZERoVUw4UFAraDFWcXRqajFUWXV5UllDZVFJb2ZSdnUw?=
 =?utf-8?B?dGcydVN3cGR2U0JBZWx0QjBBaW9zbGRPQmVNbUFiN01US081ZUM5UTRNZVNw?=
 =?utf-8?B?a2JaQ3A2S1h3WXpWOTIrRFU3dldGY2JJYkZKZG44M1VCaWdGc2VLUFZPaGxH?=
 =?utf-8?B?M1c2SXRBTVR6OElMa09CYWhuMmM3L1pPTkdDYUFabDR2MEdrNmtJa2ZQZi9M?=
 =?utf-8?B?WU1wWlE1aUQ3MGV0dnkrVTJPMTAyVWxISXduSW5PbGpuTENJUjg4NVF6amo4?=
 =?utf-8?B?bFRZcWlGVTl0SmZLK2lkeVRhSGh5T1U4TnBmcTIwL2VhS1JPd1JNbzZkMnN0?=
 =?utf-8?B?ZU53MS92bXpObXFIamRJalJNOXBnTlA5c0l6UElvU2wyYWdCaGx1NTU1eFI0?=
 =?utf-8?B?Z0NGcThmVWU3emtaT2RXSzlwQTNSWXVHd3hrSVVaU0hFcjNnaXdBd1Y2QlA1?=
 =?utf-8?B?N256cDk0QWo3NXJQaGthWVUycXBkTVQxMGkyTnFlazBpbmdJUUpUSWQ0Vktr?=
 =?utf-8?B?enNhMUFsT0l1anhSSytlejJSbU43Tlo1bW1iYlY3UFQ2eVdOOE5DU29LRWRE?=
 =?utf-8?B?UE83UmIza3VXeDNDL1B6RmFTdUZncU5TZXN2RW9MVStla1plMlZZa3Z6Slcv?=
 =?utf-8?B?aGJZLzhNb2lPWlBWUHdiOXRaU2dhbzRCdTdzYjg3d2NRbFZTdkExVE5rUEFB?=
 =?utf-8?B?T0xlRUNPWm1uN1prWS9zdzlPZzZ4Mk5yVHlXV2xqSXRjTGpGbDBKWjdVakFq?=
 =?utf-8?B?S3VQZk1heFRLTlUzd0NaOXYzTUh1VDRoUUdiUEV3REc2Y3UyVXNCQnVFTXg1?=
 =?utf-8?B?V3dJVWhKRFh4VHF5ajVka3NEOFFnREY1UjNReGRwdlB6U3d4VFZxNS8xQWR5?=
 =?utf-8?B?b2dNQVVVeUgxVnQvQk12ZHVRSUR4WWJ1S3laNm43NldNTjNvRThKWUNVaFRJ?=
 =?utf-8?B?NC81T2h4Z0JSbDNlRGlCN0lpOC9HT3JRTnNURC8wbk94SFBLeUNScUZkSzdT?=
 =?utf-8?B?cy9hemRDVWVJckIzOFBpYWZTWHYrOG0vTnAvNkEwRHNRQVczRVF1TWFaUnVk?=
 =?utf-8?B?RXlONDYxWmY5aVViWEFaYnYrREYyUVFiN09EMDVPc3k3YjJONUk0NEo1Z1ly?=
 =?utf-8?B?Q04vV3pPMnN2c2laOFV1WGpGV2dQTjRiMjRvK0FCVUZnVHRTekdjWkdPMkNC?=
 =?utf-8?B?alh5UkxSYnljSWhuV2Ruc3lpTzV6bTlRcHg5UnpUZGxnTkVOb1hSUERDS29L?=
 =?utf-8?Q?6BYok4GFoYYSJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkdnMHN0NWttSVgySXhMTThQMG9QK3k5SnprcGtWMzc4a2ZYN1RFZUpPMVRK?=
 =?utf-8?B?L0VVZ0RQSWRrM1ZTOU9hVERPREM2NXg0T1RIdTVzWlQrUHdwUzNRL3dYSmVv?=
 =?utf-8?B?NEk3bW5oZEdhVDIwL3FVcVBYWUxYelp4dzYxSWdaeEVOQ3pidFFGd05sK21v?=
 =?utf-8?B?UndZRXF1UVVYZHp0Uk1rT24vNTZtNzJXOE1aMVZ2VGdycmRrd1ZWc2NOTU9Q?=
 =?utf-8?B?VU5iNWlZVUdiN2JpcFR0dnYrUmNNYTRldkFvOGhnQzRuMGEremRHRWJQUjdx?=
 =?utf-8?B?N2FjbzNtVHNUNmhkZDBpbW5sdXFtQmRQdWFTTEhvVzhra1pxYVplR21XNWVZ?=
 =?utf-8?B?MzNZVW1rUkJZR0x3ckdWSTBsUWcwVVR5Tk1RQU1ZK1FYQVptNytyYjJpM1hh?=
 =?utf-8?B?dmZLM3YzY2Y0eWFjTmZ3SFd1N1U2bHEzZHk0aVhaWmh1WlBJZXUyOGk3NnBI?=
 =?utf-8?B?amtvdEEvL0hTQjZiNHZibWJqUmFjTW9rN1BaMDFqQmZFOGdkN0RSalJ4aitO?=
 =?utf-8?B?Y3JKd00vY3V0K3NUUjNNTjNhalNsdHdyTDRCcVRmUWFZeFVNQzNlU2JOanRl?=
 =?utf-8?B?NmVUSmxzZk5MSjlleExZaEhabkZZcTBjUGtBL0d2aVYwT1MxNHRJUEhnWldJ?=
 =?utf-8?B?bTRXVWxudUZFUjBnbmdPb1hWa0V5ZnF6ZFduRHY2Wm4rTGptOGJMWWMrbHlV?=
 =?utf-8?B?cXFQbU1FMDVJRjJtYmlwUFZqYVh2NVpvbHdLYkZ1MGh6aEs1VEM2aG1naEg3?=
 =?utf-8?B?MUVZZUJ1aHNTYmpzWGhsd3h3TFZBS0FtZHdQOWtPVEkySm5zc2VwemJsNUha?=
 =?utf-8?B?RmE4Qmg3WFNFeGNtM2kzT3cxWVE4Z0hvUDJtTkxXRnpweUtWZ1JzUW90Zmpt?=
 =?utf-8?B?ZkpZUHhiUjVqZFU2QXlnUnVZWGhHcFVNLzlQVUxGUnlOY0p6VmZVZjV3TU1x?=
 =?utf-8?B?cSt0d0lNREYrSWZvZThNYXd1MVJwRUs4Z1pvT2hmMmtYU1lwWWdoM3h2S1Zx?=
 =?utf-8?B?eUtXbEttak9OOVlHSHJrU2p5RHo4ZXJDY20yVjNFNVJ3NFhpb095TTl6KzlI?=
 =?utf-8?B?bGFTcHdnd1VwUW5wYVNDa2tBSG51NXlkRlBTRkZXZWE3bGpzUjhQMk12WnJS?=
 =?utf-8?B?YUUzbjA1QmRZREhydi90NTEvbG50ZFF1NVRRVkZ1RnQxUTJOaDVYZHo5MkRi?=
 =?utf-8?B?QUdjRWhXZURmd0pKbXA3SFV5Ri9iZnV4ZUpGUnpTMnNMR3h6VGY5RERFL04y?=
 =?utf-8?B?eGNOSVhHaWRPWmNGVUtGQ1pSeFdGUXdUL3dWNUdPRDF3MSsweXlhVUxTODZR?=
 =?utf-8?B?amdNcEJjSlNHcUZUejByLzBLWGFzSWExbEh0WjVUbmNyRVlmelI4WWh3SjlZ?=
 =?utf-8?B?OG5vM2w0ZTljeTNIWXg4WnJ1TTF5eEpSYWU3Ty9WWENTbnplRUxnVCtGa0tv?=
 =?utf-8?B?TnIyZWFUSXhaUis3S3p5TmQxZ3kzTUNMN3MyU2lSYjdpc1JibTNPN01Ya0da?=
 =?utf-8?B?Q1A3VTN2VTA3Wmdqc1pOczBweFN1TjhCOEFjTTk1Sks3SExGUmI0OTc4bThs?=
 =?utf-8?B?YTBpOXZGQkJHVDdjak5GVExlNXFaYkFJdzZnVXRsUEJEUndFd1JDZTdCaVpK?=
 =?utf-8?B?NVBoY0Qydkk5SkRWa1FHSkl1eCs4bmluemhyN0krRGo0M005c3g3NEpPMHE4?=
 =?utf-8?B?NWwra0NrREhUL3R4cll4MGdKbU5LRFR0MHJuenErTHN5SkJNSDNMWFMzUTA0?=
 =?utf-8?B?K0dNdThaVC94dzZRdnkyVEpzK2JsY3QzRGNEU05QRnBGclRlaGtzZDRiUE41?=
 =?utf-8?B?Mk5YdDFyT2JFQXpyZVNDeG00MkdYNlc4d29CVkh0amI0Rit5SEZKTUs4RzBz?=
 =?utf-8?B?TkZWd1h3ckM1VXcrZStFbUJpTFBWWWRYenVBdFFSYnhnN2lSSmhsQ3I5NVhs?=
 =?utf-8?B?WTUyR2JZZWxaS3RpeTNqUU5TWHhsMXpvOGZyaWhkZVg0VzRRQkIzNVdyRnE0?=
 =?utf-8?B?R1R0Y0czbm9NWGRZNk1rRHVYbWdIUVVxL3E1S2VrcWFaV0JiNGsvYXp6ZE5J?=
 =?utf-8?B?bEdkL2JSSGZyNklpL0c4U3FJNFA3OEdTMkx6UXdxVGV0dnhERzZ4djV3RlhF?=
 =?utf-8?Q?zCc0twAEBjDPT+nU/03KctZsn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39ea7f7-9b1d-4835-2533-08dd781d8ea2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 10:50:50.2156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyoHIAg3+I0+BKYD3LvDm3GtNC2b7BQwKtOQD+TT/LtwecW9PI0jFxZnXtEXHmKHFLjNKnSprzCGiiYL1AFfzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9460



On 4/7/2025 11:31 PM, Johannes Weiner wrote:
> find_suitable_fallback() is not as efficient as it could be, and
> somewhat difficult to follow.
> 
> 1. should_try_claim_block() is a loop invariant. There is no point in
>    checking fallback areas if the caller is interested in claimable
>    blocks but the order and the migratetype don't allow for that.
> 
> 2. __rmqueue_steal() doesn't care about claimability, so it shouldn't
>    have to run those tests.
> 
> Different callers want different things from this helper:
> 
> 1. __compact_finished() scans orders up until it finds a claimable block
> 2. __rmqueue_claim() scans orders down as long as blocks are claimable
> 3. __rmqueue_steal() doesn't care about claimability at all
> 
> Move should_try_claim_block() out of the loop. Only test it for the
> two callers who care in the first place. Distinguish "no blocks" from
> "order + mt are not claimable" in the return value; __rmqueue_claim()
> can stop once order becomes unclaimable, __compact_finished() can keep
> advancing until order becomes claimable.
> 
> Before:
> 
>  Performance counter stats for './run case-lru-file-mmap-read' (5 runs):
> 
> 	 85,294.85 msec task-clock                       #    5.644 CPUs utilized               ( +-  0.32% )
> 	    15,968      context-switches                 #  187.209 /sec                        ( +-  3.81% )
> 	       153      cpu-migrations                   #    1.794 /sec                        ( +-  3.29% )
> 	   801,808      page-faults                      #    9.400 K/sec                       ( +-  0.10% )
>    733,358,331,786      instructions                     #    1.87  insn per cycle              ( +-  0.20% )  (64.94%)
>    392,622,904,199      cycles                           #    4.603 GHz                         ( +-  0.31% )  (64.84%)
>    148,563,488,531      branches                         #    1.742 G/sec                       ( +-  0.18% )  (63.86%)
>        152,143,228      branch-misses                    #    0.10% of all branches             ( +-  1.19% )  (62.82%)
> 
> 	   15.1128 +- 0.0637 seconds time elapsed  ( +-  0.42% )
> 
> After:
> 
>  Performance counter stats for './run case-lru-file-mmap-read' (5 runs):
> 
>          84,380.21 msec task-clock                       #    5.664 CPUs utilized               ( +-  0.21% )
>             16,656      context-switches                 #  197.392 /sec                        ( +-  3.27% )
>                151      cpu-migrations                   #    1.790 /sec                        ( +-  3.28% )
>            801,703      page-faults                      #    9.501 K/sec                       ( +-  0.09% )
>    731,914,183,060      instructions                     #    1.88  insn per cycle              ( +-  0.38% )  (64.90%)
>    388,673,535,116      cycles                           #    4.606 GHz                         ( +-  0.24% )  (65.06%)
>    148,251,482,143      branches                         #    1.757 G/sec                       ( +-  0.37% )  (63.92%)
>        149,766,550      branch-misses                    #    0.10% of all branches             ( +-  1.22% )  (62.88%)
> 
>            14.8968 +- 0.0486 seconds time elapsed  ( +-  0.33% )
> 
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> ---
>  mm/compaction.c |  4 +---
>  mm/internal.h   |  2 +-
>  mm/page_alloc.c | 31 +++++++++++++------------------
>  3 files changed, 15 insertions(+), 22 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index 139f00c0308a..7462a02802a5 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -2348,7 +2348,6 @@ static enum compact_result __compact_finished(struct compact_control *cc)
>  	ret = COMPACT_NO_SUITABLE_PAGE;
>  	for (order = cc->order; order < NR_PAGE_ORDERS; order++) {
>  		struct free_area *area = &cc->zone->free_area[order];
> -		bool claim_block;
>  
>  		/* Job done if page is free of the right migratetype */
>  		if (!free_area_empty(area, migratetype))
> @@ -2364,8 +2363,7 @@ static enum compact_result __compact_finished(struct compact_control *cc)
>  		 * Job done if allocation would steal freepages from
>  		 * other migratetype buddy lists.
>  		 */
> -		if (find_suitable_fallback(area, order, migratetype,
> -						true, &claim_block) != -1)
> +		if (find_suitable_fallback(area, order, migratetype, true) >= 0)
>  			/*
>  			 * Movable pages are OK in any pageblock. If we are
>  			 * stealing for a non-movable allocation, make sure
> diff --git a/mm/internal.h b/mm/internal.h
> index 50c2f590b2d0..55384b9971c3 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -915,7 +915,7 @@ static inline void init_cma_pageblock(struct page *page)
>  
>  
>  int find_suitable_fallback(struct free_area *area, unsigned int order,
> -			int migratetype, bool claim_only, bool *claim_block);
> +			   int migratetype, bool claimable);
>  
>  static inline bool free_area_empty(struct free_area *area, int migratetype)
>  {
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 03b0d45ed45a..1522e3a29b16 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -2077,31 +2077,25 @@ static bool should_try_claim_block(unsigned int order, int start_mt)
>  
>  /*
>   * Check whether there is a suitable fallback freepage with requested order.
> - * Sets *claim_block to instruct the caller whether it should convert a whole
> - * pageblock to the returned migratetype.
> - * If only_claim is true, this function returns fallback_mt only if
> + * If claimable is true, this function returns fallback_mt only if
>   * we would do this whole-block claiming. This would help to reduce
>   * fragmentation due to mixed migratetype pages in one pageblock.
>   */
>  int find_suitable_fallback(struct free_area *area, unsigned int order,
> -			int migratetype, bool only_claim, bool *claim_block)
> +			   int migratetype, bool claimable)
>  {
>  	int i;
> -	int fallback_mt;
> +
> +	if (claimable && !should_try_claim_block(order, migratetype))
> +		return -2;
>  
>  	if (area->nr_free == 0)
>  		return -1;
>  
> -	*claim_block = false;
>  	for (i = 0; i < MIGRATE_PCPTYPES - 1 ; i++) {
> -		fallback_mt = fallbacks[migratetype][i];
> -		if (free_area_empty(area, fallback_mt))
> -			continue;
> +		int fallback_mt = fallbacks[migratetype][i];
>  
> -		if (should_try_claim_block(order, migratetype))
> -			*claim_block = true;
> -
> -		if (*claim_block || !only_claim)
> +		if (!free_area_empty(area, fallback_mt))
>  			return fallback_mt;
>  	}
>  
> @@ -2206,7 +2200,6 @@ __rmqueue_claim(struct zone *zone, int order, int start_migratetype,
>  	int min_order = order;
>  	struct page *page;
>  	int fallback_mt;
> -	bool claim_block;
>  
>  	/*
>  	 * Do not steal pages from freelists belonging to other pageblocks
> @@ -2225,11 +2218,14 @@ __rmqueue_claim(struct zone *zone, int order, int start_migratetype,
>  				--current_order) {
>  		area = &(zone->free_area[current_order]);
>  		fallback_mt = find_suitable_fallback(area, current_order,
> -				start_migratetype, false, &claim_block);
> +						     start_migratetype, true);
> +
> +		/* No block in that order */
>  		if (fallback_mt == -1)
>  			continue;
>  
> -		if (!claim_block)
> +		/* Advanced into orders too low to claim, abort */
> +		if (fallback_mt == -2)
>  			break;
>  
>  		page = get_page_from_free_area(area, fallback_mt);
> @@ -2254,12 +2250,11 @@ __rmqueue_steal(struct zone *zone, int order, int start_migratetype)
>  	int current_order;
>  	struct page *page;
>  	int fallback_mt;
> -	bool claim_block;
>  
>  	for (current_order = order; current_order < NR_PAGE_ORDERS; current_order++) {
>  		area = &(zone->free_area[current_order]);
>  		fallback_mt = find_suitable_fallback(area, current_order,
> -				start_migratetype, false, &claim_block);
> +						     start_migratetype, false);
>  		if (fallback_mt == -1)
>  			continue;
>  


Tested-by: Shivank Garg <shivankg@amd.com>

Thanks,
Shivank
