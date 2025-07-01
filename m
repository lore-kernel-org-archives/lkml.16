Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F92B1DC994
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369320; cv=fail; b=BJpSY8J/PgYC1MogIHRLWc4auAk2r5RI9JnyEZvF2nVY6ltZmD/edGNA0N4P5U3xARyfTZffp5b/AuvxtuEv9+5ZTt60G/Gakn4d6PmDWOlnEUF8Vb+pWqvKzKIEtKJpj5vlUEw6nKYHQLMet4gjHhn32Kyz7zfuOQn7vjuCfWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369320; c=relaxed/simple;
	bh=lxdzYxZi3RhjaZhzRawqbpgTxMqKTb+OjSp/tuZOWpE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pZv8zo5S7SopXS+XJa5/XX83xNR39EUOPJCe1CE2CcAdJtrCleNqBbqD41EEw5XTMhgH+H4nB7Ek7oqxFW0eUWk2Yh9TzDc+2pGoOP00GLKbYhktgkxUKYTSaTR0lxSBQHCPkAoIiJ8k6gkGWV3TzFCrfOLHg38HTgDRlMsRUR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ig/qW3c0; arc=fail smtp.client-ip=40.107.212.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ig/qW3c0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TK4DEphIXHKg1gYafs1UkJrotY6xCrDUH4ZswrjjOVxcJU3c4VXQ7c5/2+ODI71K1fHle9IdFbKsrlFvpW1cKGW0a4kEjjhDVzU3uUpAO6oX/l0BUo/GWbjXx3sjRG/bQnu2PajxyZ43S94TVWu2S73Q1lcQAsYgtm/Ob/R9DeTeWl7ASFG3aEyNbJHsZWAegxkBw6Twe+NdrpeTJVZISCWOjtyF/N0BU9z+IqW8aLGxrstC1uVxK/lK9omBBF7RfOyd73Nd9Fw5SH0WXYlV3nmpa532Lb7/7m9Rh7IoCcy5quMIhe9mkkN/m69D9qe644DxA9QEBWlaj8P9t4ludQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oL0mtVCINiSekfGPB6tqeCWDBw8YxlPzD4LQWIHvRFU=;
 b=bRuhJmRsDQZQYP2tWsY5KCv7VMc9L5yQ8fVyAzu9M8f3T3AbxA+3iO2uRVYzOgOMQPdQ7n6Z5L4Zb+MxTLX2gCxryneLuiEL9hz65sS26ppECNQmaYC0VHg0hYcvzUR++62N3hhdu3IhvQpEQKpN8eGI+QlJtCHx0GiQxw+Jnd18ImZL6Y5Fb9G2TdHzhptbLrEE0KI3O9aompOybzzJ60SPxN3wvkiPi0Zi1Q5oIrV/bTzKaQBGEOe0ycnmgL22pMHSeCKZwx+H3CZNWKoeUsbFxWBg4TIzr93EE7LOjRfWd7JRCn/2db4x1Eko5MUHQRcu7ZKZL3VnpiTRxBSKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oL0mtVCINiSekfGPB6tqeCWDBw8YxlPzD4LQWIHvRFU=;
 b=Ig/qW3c0CcEDefxhT9ec/rKt7c2i1FhaZqINz7F2Hn9ErcQzweZHtXimByUfYD0cinbUqHi+ucDdJeUfh8NUWMrR2xmkdYNNNueqpGUjowZeN/wedn4mymvyeOtEJyJ0lXwFqqelNB6BOB93I8sIuGkA1sQPiKKIXsWhTnTAc+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by MN0PR12MB5906.namprd12.prod.outlook.com (2603:10b6:208:37a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 11:28:33 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 11:28:33 +0000
Message-ID: <1170c037-15c0-4f22-8e2d-456ad17396cf@amd.com>
Date: Tue, 1 Jul 2025 16:58:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 1/7] Sched: Scheduler time slice extension
To: Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Prakash Sangappa <prakash.sangappa@oracle.com>,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, bigeasy@linutronix.de, vineethr@linux.ibm.com
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-2-prakash.sangappa@oracle.com> <87cyakmhdv.ffs@tglx>
 <20250701105653.GO1613376@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250701105653.GO1613376@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0106.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::6) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|MN0PR12MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cd9f6b-3caf-4c37-2cfc-08ddb8926978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U053K1hEd0VlT0thUFhFU3UvaitqeUp2eTFnSmltYTh0dHA3TmNxdVNUeW56?=
 =?utf-8?B?V0M4QUdzdCtGY0NOdGFJYk5FWHo2eFBQU01uemhTV1h6SDdidmdiVGJydjlD?=
 =?utf-8?B?NlViZFYrYm9VMXl2d0w0UTNxR25RaERvYUdvcW1FdXRxYkVibUp4c1JNMVVh?=
 =?utf-8?B?QzFuNVUxNm93R0VycGw4RHgyNGsrRGc5Y20vU1RPeDFxVGp5Nm0rMm0veWU5?=
 =?utf-8?B?Sys3S2dKbjdiTlFqY0VTa3RkblhCejAwK21Ta3NtbkwzMGljdGpmUVZYMFpw?=
 =?utf-8?B?bWZFU1BWN1RLdHprRnA5MjRVMTJoZFBNaUk1VUkwUklrNHV6b0NqMFpRUnZi?=
 =?utf-8?B?SEl5U2VyWjdqaE1iZ3BLN0VjWnUyd3J4WEpBc0RNMTZDcjl2YVZKSU1hWXJJ?=
 =?utf-8?B?aENBMjV2TFNlUWtxdGxuS3NieXJhZVA0MGVFaVRBNlpKZUEweVRhN2hYUjlL?=
 =?utf-8?B?RE5FSUdGTUFOZVlTV1pqSU52S2JOaWpwSmIyR3FEM0h0WTI1d3FoVk1zbTlM?=
 =?utf-8?B?RDgvanpweXZaYWZ5Rk1DbjUxNkV5SU9yMmVtZVpYK1hJdUR1M09Xc1RmcFBs?=
 =?utf-8?B?YVhWTlEvVHA4UkpJUmtqVmdINjBleFdCa2tCR1V4TDFyUkcxa3ErWi9HQ2Qr?=
 =?utf-8?B?dDMzNURmWEg4YnZqb2dFcEJZYk5WVGxXQjdjRENlMHRtUU9wN1JuU21oeXlI?=
 =?utf-8?B?bGJKM3BGZXA4djB3Vkw0TCtUc2Q4UG1pMjRwYzhITWhTc0JsNmhEMk04bzRJ?=
 =?utf-8?B?Q1pTd1J2UlBrNjRNV1hEUHE5YVBidUVINkMvb2p3SXU3YkRkK2k2N1VaUWZZ?=
 =?utf-8?B?cStkNlU5WnpiVVFnYlR0b0VsMVpDSHcxdzhQazZyRGxPZ2lDSEp4eWcwV2NB?=
 =?utf-8?B?VlNlY1ZZMTRRUk1SVEh4Zlk0MHVQUkxTdmpnYUliZkVoVTNvOXU2UGNEWEJH?=
 =?utf-8?B?anZxaW1OdDZaVXg0cnVOSHJ4eEV5aFhTajkxRG81QWdEdytIYU9vY3FvSENR?=
 =?utf-8?B?VWM2ZTJnYVAycU5Ya2JDbFVOOWlMeE9NLy9BWE0rUER0Wit1ZmxtK3hXUFRE?=
 =?utf-8?B?VVJsMVp6dzk3d3Z3QVRhWDh5bWNKbXN5VFNQS21MQVQvci83K0hrQzlpVXE4?=
 =?utf-8?B?aHJwQytrTjhEdGM4VndQdjBCZWdlWkFqVGU3YkEyVllhbGowZWJwbXpicm1G?=
 =?utf-8?B?bXR3WlJRMm5IaEgrL3BGaVBBOWxZM1dhRmM3VEc4T0U0aGd0YzRxSGVzbFgr?=
 =?utf-8?B?a2xJbURMZUhmako3T05NMnloTldQd3crcEdzNVhhSVBzWVJTbSsrZDVmMmpz?=
 =?utf-8?B?TDQ4RkJNREFSS0ZhczZqYnMrQ3hEYmxDYlBVZ0kzWDRSL3VaODIvZFpUemNP?=
 =?utf-8?B?SjBBUjFWY3djSldydnBjOFliRGJUTVgzM1cyVGRFZ3NSWEQvOFdTTk5RdDN5?=
 =?utf-8?B?UWhGNE5LNG9XRUlHQ3ZFdXpQdldZNENOeWJHR1VpTGJteFBmaEpYUGJ2ajRQ?=
 =?utf-8?B?dERFTHBXNzhHdS9CTUdVaVN1UlZLejVuRVNYRy9laW1RdFRmVTVlaUcvaVlR?=
 =?utf-8?B?enVzbWtjYTFZTm1WV05tK0lPRmxEOHdzZ3crbzZvTWFycGlBcEwxMmVVRTJl?=
 =?utf-8?B?UmcydDdCWlEvUlJycWtkaSs5S1huaGhKNko0bmoxVUdQcGVTcTZmQnJOOU5T?=
 =?utf-8?B?S2hDWUJubU5pSWo3QjBZc25KYVQ3MC8zMndQYXVZcGFaVDNDTjVwRlVJdDRp?=
 =?utf-8?B?NWxPaWRmcmJlQjNLekRCd2pzamxhZFIzR1QyUmJENGJiSWFhS0FNazJna1V3?=
 =?utf-8?B?WjJ5QlZnd3FtWFRpa3YzcnF1aXdBbGZFdnljaVhtSmltNWhBeGNFTFEwUFpV?=
 =?utf-8?B?VngvcU5IWXJqZEdTTTRzeS9YdkM5MjlDUXFsUGFvMkg0YnhDRDJ5SDRabnZ4?=
 =?utf-8?Q?mxVuMG60M1Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmxCTlExazJRSDlhL08zU1Nyd0N5T1I4NHpQRmJJRWtyZHJONCtzKzB3WVI0?=
 =?utf-8?B?VjNwQ2NTOG81ckdBTElPUFJTWk1TWVJkWnd2L0lFby9IYjV6TFd4M3UxaUgy?=
 =?utf-8?B?SU1uUEMwRXJQSHY0ZFc2dE9aZW1EaTc2UEQ1ZDhSb09KKy9BQW1NZnVxcTUz?=
 =?utf-8?B?YnVmUjFRRENOZHJnenBRNmFIU2x5UVZJSjZyWWgrOGsxV1BDTVVYRHFuOHQ4?=
 =?utf-8?B?REhTbitpQ2YvSnZmZkgycXNSUXhBeWEybHJIeVNmbTRBK1J6UjRKdUxmczNP?=
 =?utf-8?B?TXcyWm53UndlOFZRUnBIU1YrOVZTbXBNUFRKeVJPMU9iblU0R3FIcm5DSkZv?=
 =?utf-8?B?NnRqc2FqUnBQdE9EZmJNV2w0b3BKOW9iOURjMkFEOU5DRk8xR0xYQ0t5SnZR?=
 =?utf-8?B?alRvbWlpUDRtemtqOS9RTm5CeUZxb25lcGkxMVBCUXdCTlIzcUZuV1BhQ2Rv?=
 =?utf-8?B?cHhteXptc0p2ZXBER3RVWVVwN1lueDJabXh0VElxYmR5RWd1dmRkZkJZc1R2?=
 =?utf-8?B?K0h6cWgrZUdMK2ozNnAycm84dUF0MkhwUzN4cEpOKytsamtjNlFjNW05dG1C?=
 =?utf-8?B?eG1Nd056dURocmI0MFRwaUlUeWF6amRuTTV4RkZ2bTVGUXZXaVhPU3dhRUN3?=
 =?utf-8?B?UHQvamxZbE9mdmcyeVEyWWVUZVFwcE8vaTdmU0tkdHFDYmJ1bHE1QzBuMDB3?=
 =?utf-8?B?WnRWdmVzMjdmU2ZYZnB4UmRicUkzTzhOS2NLNzZ3Rm16ZHVHWWxySFpwSCtF?=
 =?utf-8?B?SFdZdm5JeXZOenk2Um9ja3l3S294Z0dRbnJmU0ppRGI5bnF6cktqYTBndGFW?=
 =?utf-8?B?OU5mRm13WXZYL1MrN3BteUREcTNKTllORXJ6eU9URERJRmt2QWMzd1VRMDJU?=
 =?utf-8?B?TFZuV2JCWWpOSVQ4eEZpTzVzV2hZeGh3WFVpNzhwN3RLeDl0aFl4RVFOdzVn?=
 =?utf-8?B?Z3lpRnV1VjJQT0RMMVA4NjZKcm1NcG51dHQ1djZ5MnhmWFR6eWtiZFBoNzRo?=
 =?utf-8?B?djlFdURTbERFOVAxMWluWTRWZlBJWG9JbG85RVRPYjdOYU1DUlpEK3RITDN4?=
 =?utf-8?B?eGduR1RVU0dUdEtURUFmeEQrYWJyc0gzMll4QkxtR1NNWkI0c2VBQUxiWG01?=
 =?utf-8?B?LzFubk85MWhIN1pTMWpPWlQ5UjJZRkEvNENVM1EvZXFkaFFWR0FiT3ZId0k0?=
 =?utf-8?B?UTdkam8rOW0xSnFzeEVSR2Z4ZlQ5ek9JeUJ2NktYRWRRYXY3TWsydFhvVmlI?=
 =?utf-8?B?cXRrTy9WamcxeUJxdEZ4aEcvVlJMTTgwTjZuZWNkNHJpeWVRcWJ2dFlXNnJh?=
 =?utf-8?B?aDVseTRPVW9QRFYvZFdYdzI2eGw1T0FKNGxnbTJPb0xiMnNyTkxQV2xsVita?=
 =?utf-8?B?OXVSNUlqSi9VcDVaMU5weGx5YzZVT0dkdGtrSkVyUXhPYjRPZmhXbTZGQXA5?=
 =?utf-8?B?MkFYUkN6U0tZRnFMbHZSSitSeHphSEJCamtJSGFVY2hLMDk1akErWUFGV3pC?=
 =?utf-8?B?RFZrSXJ5YW1OUkxteDByY1gveVBsc2R6SStSK1JoSk9zV1Z2STJqaTAxVEw2?=
 =?utf-8?B?OG4yeElDTlpqWGxyc1ZvRDl5ZFNBaDV5d05UbGx4dkpBSG9CRHhDWU1RWUhD?=
 =?utf-8?B?MG1pTTVjVTJsTDZGSkR4d0NyZ1dvZmdQZjRKNStXN1krTVBTTEdJVjZUWFl3?=
 =?utf-8?B?aDJ5cnZuOGkvMUFZeUYwTFRXTGJ3eWxGT2pOY21sVEwxU1YzKytYR2ZKTXZ4?=
 =?utf-8?B?czZUNTBVemtzLzhMZktuSndEak9FV09rekd0LzF6M1pDRzcrRXNocHZ5RjZ4?=
 =?utf-8?B?Q2dFQm4rd0NIczBCMTR6ZmRmNWVVMUhEVVhNWEk0NU14VjJOUlFzM0JYYjc0?=
 =?utf-8?B?ZTBaaCtkRG1pY2NmUDJhV3M3dnJpM3FnUTd0QVd0TnVheVlaS2JHRlZMdGNl?=
 =?utf-8?B?c3ZhZlhnMk02Y3VYOXFld1ZkT0EvendoWDZkcE5YYkxyOEpkcS9kaDhyc0pG?=
 =?utf-8?B?SWRhb1VZK3ZieGtJOThsTVN4RDBxcC9xai81ZG40VUtqWG9QaDBFaWFEQmhY?=
 =?utf-8?B?Y1FmYkpXMDdPNjVsZzE2YWw0UVEyY1VoY3NMaitzYnM4WHZzMjBFd0JURjYw?=
 =?utf-8?Q?zzssGfrUGHoMRhxpdGCZD3HcM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cd9f6b-3caf-4c37-2cfc-08ddb8926978
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 11:28:33.2400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kcS3QzTBJxg1O7jTzqLrZyZ8sdBRS7+uyFw/5j+o+gWW0MbUi3ouHDYrp6vdJlB2BYTFFBZ1H7hrDl3CCCa2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5906

Hello Peter,

On 7/1/2025 4:26 PM, Peter Zijlstra wrote:
> On Tue, Jul 01, 2025 at 10:42:36AM +0200, Thomas Gleixner wrote:
> 
>> What's worse is that it breaks the LAZY semantics. I explained this to
>> you before and this thing needs to be tied on the LAZY bit otherwise a
>> SCHED_OTHER task can prevent a real-time task from running, which is
>> fundamentally wrong.
> 
> So here we disagree, I don't want this tied to LAZY.
> 
> SCHED_OTHER can already inhibit a RT task from getting ran by doing a
> syscall, this syscall will have non-preemptible sections and the RT task
> will get delayed.
> 
> I very much want this thing to be limited to a time frame where a
> userspace critical section (this thing) is smaller than such a kernel
> critical section.
> 
> That is, there should be no observable difference between the effects of
> this new thing and a syscall doing preempt_disable().
> 
> 
> That said; the reason I don't want this tied to LAZY is that RT itself
> is not subject to LAZY and this then means that RT threads cannot make
> use of this new facility, whereas I think it makes perfect sense for
> them to use this.

Thinking out loud: I know we are trying to keep the overhead to a
minimum but is it acceptable to go through with schedule() and decide
on extending the time slice in pick_next_task_fair() / pick_task_rt()?

Then, a higher priority task can always preempt us when preemption is
enabled and between the tasks of same class, it is just a redundant
schedule() loop.

It'll require some additional care to start accounting for delay from
the time when NEED_RESCHED was set and not when schedule() is actually
called but would the overhead be that bad?

Or would we like to prevent preemption from RT tasks too on
!PREMMPT_RT since whatever the task asking for the extended slice is
doing is considered important enough?

-- 
Thanks and Regards,
Prateek

