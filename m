Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020141.outbound.protection.outlook.com [52.101.189.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115211BEF91
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199379; cv=fail; b=TyhzTCRJ22XOcWcJdmq5bk8mh0svvSG1sDh9KByfxm/+dpYjIaVMliRRxvKZCKwTif5Wev+MYIxu4H7fnWPRF6WEAJIKzJTQMqNR603J0q6hIeSa1YlliEgY308iDDwUypAJ3vJzOhROT5o+hZpL9xtJAkuWqoH90Thwv9dHRVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199379; c=relaxed/simple;
	bh=hWoRfzBXpKvFpd18xnyWMoiz//bnMmrmL0xWYuWH8DA=;
	h=Message-ID:Date:Subject:To:References:From:Cc:In-Reply-To:
	 Content-Type:MIME-Version; b=iiljKEJ0F4a1GmQ0iYk0yIGgZ957INSvCGC/Y75XelLfrSWacj0rLz5MB/c5kzFIG4Xy+ZCigxVDm9xxLGenrYcI9PvF/AX0dVIBmZuD5DYRGKangB3T91q/D86/U247mNVivLbILrl87nR2GMsCvC0+JjS1Wif6DQTj5S9sZhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=L1lFpzv/; arc=fail smtp.client-ip=52.101.189.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="L1lFpzv/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkScnSHiBt19KXK4SrO0sqYHu+DvCaNf4rB5J1atv/oJchxEiUir0hnASeclnhNE75ygGh3Cm5sKtVQ347RCgj72QMYy/CTjmzxSDFTEnkbBo/KlU4h/dxHaUsbXbwo0mCtGhWPKaE4yJyE6avegBlTb28SQjDGNUqddVqJTOXb/gdPke5QKO+hiCSQM7iM8FjFkGT4yqzR6g9SDz06OW5koU2aAIiAwj8L+KQlfiQVrybdexDuzDB+w9IZd0aG+meA9Hsbla7Plk7nABxuuXv/TDLlo4hKWDDzVsiZBIRnj2sSIuz7c2eWaSD+SH1BFwxrbR3wq9cccL1Zsykq3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ7rqoNU5BwfTSyLee4dsahdSiYC9sVoOCEGbvI74s8=;
 b=Jc0myz3l4/TjnGUkcDg72pVjCtY7rUAStmNnfRutLnJmbQWyPq5igxwcjqtemN45RdaWKuSkyrjCyd7sFWpysBU0cjJAzduM44pbIZ+grVit6T4ycYtTvcGSBNWy+kDqoHMXgtm/BWQwDzVr4c7/hnc+zR3cPK+2/5eeCYCUxcMoeLyRavHSS5bILZxxhLLp62lSHlvy1JlymIW43Ns9SpBuCT/lDxApkEoXQHNWrYPbLey2QvqQ8MqELRQDkUwve4Kne0bQUHQoVwcdDf9EDnV9XbYU2K2mksxiPGvcOewKZV9Z6Dy+vIZkYzA2+Iq0yus0u3UzWInItBK0szNUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ7rqoNU5BwfTSyLee4dsahdSiYC9sVoOCEGbvI74s8=;
 b=L1lFpzv/N5zkMKpGcF0YfRby8vc9q2M5vumjGeR9VrUHLE0rQj5W9ffGCo2ihewH/kLqa0pp1A2FdFONyI2MdJVRGnT/02OrB4HnkxIVNADIUd/rO+0dIwe65+3kiNXnR9iw6a6LCD3GVneGHs921ezRoYNzyLDtZxeld3LSNJhhet/nZ+rnNzG+YQY3Y3y/FMQz4M3r63W/xPrGtFyprHVaNESqv448uQQ1UZYGcyFkITa8wtJXDA+BNbZLz/N5yJX6DhAseV3QGTdL2vASKmx3xNQ/3XGiKW5dOqMT6XOq98hM7IjZ0wSPl2jrhsAFouVO4G7En5EttYSqANu63g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by TO1PPF55F13247B.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::646) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 14:56:14 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 14:56:14 +0000
Message-ID: <200a28bd-d3bd-4579-ad63-a197195b7382@efficios.com>
Date: Mon, 10 Feb 2025 15:56:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] sched: Restructure task_mm_cid_work for
 predictability
To: Gabriele Monaco <gmonaco@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
References: <20250210075703.79125-1-gmonaco@redhat.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
Cc: linux-mm <linux-mm@kvack.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Marco Elver <elver@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20250210075703.79125-1-gmonaco@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::35) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|TO1PPF55F13247B:EE_
X-MS-Office365-Filtering-Correlation-Id: cf991a1d-7100-4eef-2606-08dd49e3108d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b20yaWx0enZ4dUlaZUFhcG9uNm1TaVM3em9WZHF3bVpyRlZtU3IyamJxdTJM?=
 =?utf-8?B?L3p3dW04NnVFMmUyRFVIU1JOdWx1WEJxay9UbzhBUzRKM2FKeXdReWYvRlQ0?=
 =?utf-8?B?UkdjNXFySERacStUU001aHh1L0NGRi8zeDdqOVlZTUpJUkcrVmVIc2VxRHZN?=
 =?utf-8?B?a1FNM1d1OGw2eFVTNnBkajZaMytpb1pKZjUxK0Z5OUEzdTYyUlZYVHk4QUhR?=
 =?utf-8?B?TW4wNmRuWUV5Z2xRUHB3TmYzNnQ3ZXFrcHpXTUdrSnQ2OG1YTjltbWwrWCt4?=
 =?utf-8?B?bi9OUlpUd0RiQVoyRG5hV0dta09yTkkxVzhwemp6VTJKRHVveEdHczdpdjFV?=
 =?utf-8?B?M1prWmZXdFNrTURJazhMY3F3YlJob3dZcjZMUWkyeXF6S2R3dmgwdFQ5UFZp?=
 =?utf-8?B?c3ExU1Fydk9FSFJTeXJ6Q1VBT25BTDhzSDlwTU5tdXNndDE0VTRIVksxV29q?=
 =?utf-8?B?S3F0eHBmM3hsVFZaZzFNR1l5MUc3eXJzUHpSNWhqWXkvWG9LaDB2SU1CcDJs?=
 =?utf-8?B?ckFGZE1zcVR0NjJDY1hGdGh4ZStOZlk4VkIxRmVlZTN3bHdhcUw2RnFnM0hE?=
 =?utf-8?B?MmtEcEJzTXNZSHl5Q3V2UTRQWi8rLy9iTXpHMVEzNllPNHZvZ0hLMThXUmNK?=
 =?utf-8?B?dHN6RGxBN3NUa2FWcDlaU0Q2TVdRcG5XVm1DRndkR0NCcnBMZk56S096MU9l?=
 =?utf-8?B?bEJZVlMzU2VUWW1tWitlMHRoSzlvQnFFNzdWRzhwZmlXRm5BTkY4NjUwWEpq?=
 =?utf-8?B?ZXAzSVduMkhvOUVaN01oQzQwTDFiYVpvRjRQRDFrZW5aajVlVFoxcXM3WXkr?=
 =?utf-8?B?VHhxV2xLUVI4R2VIOWYwaUgrdUR2ODdjYXNOblJKZmpvV1puU1h4ZHc1RkVk?=
 =?utf-8?B?ZWJrbFF4RFZCdi9McHNOYmlqaUNnVm5YWVljVW10anJ6bjNUUFhna2E5V1ZD?=
 =?utf-8?B?RjJuZHdoT2RjVTBMaHZOKzRxRDFveHU1Vk5uUFlCcXh2clF6T29taTFHalFM?=
 =?utf-8?B?SGVCY2Y0TkFCSlhVZldKMmh2aCs1NERBdHkzTldYdDdBTjRxaTY3NHh0dzVv?=
 =?utf-8?B?SVR3eVdqOGlyVGJzSFNaUnlWK3VwTHpLZ3UzRThvdnY2Z0RWejRuclRIY1hx?=
 =?utf-8?B?c2hhTlk1bXdETDdzWnBGVFVjSFAwWVpZYVRpREFRMnY2ZmF1ZmhGeFZUQUpq?=
 =?utf-8?B?NSs0c0JVdWlzVlFQbktDRlFjYVUxSW1rVWRBcTRIcDVMeXN2UnFINDJKWkxX?=
 =?utf-8?B?bkc5aDM4T3ZvN1dsNTArOU4yVEgyRXhrTml5NnpGbVg4SmZZYWZhWng5Z05T?=
 =?utf-8?B?WEQzenJWaUllK3NIMkk0VDgzOGxWNGR1VEtGNmRzd2xWSGcwWmovcjd4WmlT?=
 =?utf-8?B?UEJhQjF5WEZUQ1M1enhJT0lvSkQ5MHgyOFFQL3FsbXlqVWd0RmxicHV1ZzVP?=
 =?utf-8?B?QkdITlJOWjFDVERTOW5LVEYzYkEvNzFhT1NYc1NWNEZWTWJvaVFkTHVFSk42?=
 =?utf-8?B?YU04ditaNHFpTWtmdVk4dE00Yld1UDNpNzErbnQxdGRESmFUZFo2eitVMWdu?=
 =?utf-8?B?WTh4NnFkejAzQThCamRrZFhOMnNVNUZTZmorZWt2b1pBZnVvalM2Z01mUGZQ?=
 =?utf-8?B?NjdVYVIrSjBqTVBYeFF0Nk83ZUExTjI2d0tpdy9sYlVQK1VtbHpBcG1sQlZP?=
 =?utf-8?B?bk1EWnVVM1lLL3FEazRYUGlLNnhLREc5RWlJSlREM0c3bFF3VGlqUmZvdE05?=
 =?utf-8?Q?wxqToOQhAX15EHyjDjAE1RaYOJvKEyidWtVeWKA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGlYc3RXZ2gvalc0TTZUUTk2YTZCNGU5L0RhQnJuNmpMNU1Sd0ZKUEt6aVFl?=
 =?utf-8?B?L0FVcE5BL1J3cHNKcys0bEZOekFVRHhLMkJ2cmNoN3VyY2svT2YxK05kZjJj?=
 =?utf-8?B?TlM4cjdVWjFpM0VOUnhjVExVbm9xa3NZUEFTS3VKWkFCUDFEZlZINUY3NGta?=
 =?utf-8?B?RkhscmhubnI3em1tQlFuRldKWU56M2JJbnY5czc2Z29kVkpNL01uREZJcWtX?=
 =?utf-8?B?OWlXN1lCeUNZbUlyejVadlJpMVpDb2Vhb01jQU1nWTV5ZmF0czhoa0F0QVJV?=
 =?utf-8?B?MWFSQmk0MkhFMzFsaTNYR0NLc2NrU0pjNUxwSjdtTk4yRUdwKzdZd0ZXdzY5?=
 =?utf-8?B?K0liMXZLOEVwUnhveEV4OWg5YllhSzBnUndTK3NGVEFtSmVmZk1Gd3haUFhS?=
 =?utf-8?B?VmJRTy8zMmt6amtTdVRuaWpkZk5nRitCZzZrTGEwL3NadlB2S0FjaVNWM2E0?=
 =?utf-8?B?Uy9peEJhNTVIc1l3WEtvUHFLZXJmY3pPdFhab1l6VWFDWHdqSGh5dG03U1pI?=
 =?utf-8?B?NWdFam5LZzRiOHNVcmN5STJVV1dPRUxuL3lFUnljSjdPK1pSNDBHSEtrUVlN?=
 =?utf-8?B?d2pFcnpLYmhsdXR0K3N1M2tZZXAydDZ6Ny9KbGdubHpWWVVOTFM3bVBOZHQ1?=
 =?utf-8?B?aUZTMForeUFONGRKSGFkeCtURG9wRTYwOWlwMkZ0UGs5RGhZbzJVcmpuZzU2?=
 =?utf-8?B?K01OVW96OGFvbno1Q2xFNXVqL1B5ckxCRk1rWTVMckducUVMTkVnTFdxN0x4?=
 =?utf-8?B?Q0ZPYk5IbTcvcG5ReHU0V3Byb2FiY253V3B5bWhGa013UTY3bEtCVzY1d1k2?=
 =?utf-8?B?UHIrdGxlWm1SRkNiZlRNdTh0ZEpvcHNlWlRJMXJ4elhXK2FGcktXMm9PQ3ZD?=
 =?utf-8?B?b2l3QlA0cDZOYkhGc2ZyUDVVTkhMSHNXSEdaTnAreHlkNFNZdDdCdWhvb1Rl?=
 =?utf-8?B?Z205K1dtS1hqR2kyZWxUOWlqNWJab3J0Y2o1cEFNVjFHZ0hsWG5MSFhUa2JO?=
 =?utf-8?B?MzhFYzNrRDl3cGkrdTI1UklacDVXOE5ZSW1LWWtnY1NOd29mS1orVXN4cXFm?=
 =?utf-8?B?cWxwMzVyRDhTVTFUUkxNQzZlSXRtSlpCeGhvejZjMEI0SUJjUnEyQWJuVXhF?=
 =?utf-8?B?VU1wT0xiSkNPTHJSdm5qYnNjcDNUdVI4Y1pOUHIzTWFLSXYwbFhiTU9kdjZW?=
 =?utf-8?B?YlE1dno2aHVYYm9udXhGWVd2VC96M3JKSjVlZVUzdGVJTXhPSTdSL2V3NWhq?=
 =?utf-8?B?TTgzZGovYTFnby9TSnFpOFBoUWwrSzZST0FpZklTVnBCMUR0Wm1kQW84Q08y?=
 =?utf-8?B?NzhGUXIxUCtXeUM2d1dkaDBULzhmZTJBVFhSZUFuQjlDRCs4MW9wY3JNQ1lo?=
 =?utf-8?B?Ulc3V0dJbUlnZkJMaHRrei85NS9XSC9DQ0N3SjV6ckFKeWEyZnR2TkUrdWdo?=
 =?utf-8?B?NDhwNnhrOUJESjRsTGkycHVDU2NiSHpXbExXWkRvTzhzMG1GOHp0N2NsWko0?=
 =?utf-8?B?VHo2NzdoV2ZUT3VHLzZUTHBLcmdiVHplRzJCdXVRdEZ2dkFkbjdvTE1UaFlF?=
 =?utf-8?B?bXZTeDFYV2JOMjdvWDI4cmd5OFhKVjIySVR4NjU4ZkRMQWpBRFdQMHhQV0tk?=
 =?utf-8?B?L2g5NE1YZkpkaHdrYm4zVjVqaW9iY3QxUEJta0Y1ZURzZ2Vvd0szbkhYemdr?=
 =?utf-8?B?WjdVd1VaTzJDZmVvK3F2cjkyc2kzS0paOFJNbWQzV0VFR05aaHVxczg4L2NT?=
 =?utf-8?B?NGc3aGNveVRXLzNpYVcyWUxrY0NFMmM1dWtTNFFyTjZLbGNLdDI5YzErT29M?=
 =?utf-8?B?SHVQR2pISUZVY0ZXRXlvZElkeUpkMmdHODFhbHQ5OXJEdTBmeCtKb2FMNElY?=
 =?utf-8?B?MU9FWEt6V2p1amk2N2k4L0FEN3VGalI3QU5NR2pQL2o4ZmV5WFhLMUFQK3Nh?=
 =?utf-8?B?WUlRRHNuaWhIaWVvL0V5MXRLWUFIalFHYkI5dmNsR0VJV3JONWVTTktPTC9n?=
 =?utf-8?B?K0k0SDhsQ2hMN1laZytUOXRkbEx6d1dHcWRLRk9vRTRvRE5vK21KVDZGZDBi?=
 =?utf-8?B?WlB1RDFhc3FmR0g3U1BkM2swZWVVay9CMVpBa3FWa1JMMjlLd2VTZHllemlE?=
 =?utf-8?B?QlhjNHNUd0lkb3pRMmR1MUxrc2l5bmoyMGZ0ZFVyb2I1WFc4MURGaFR3REls?=
 =?utf-8?Q?bsua58FF8Fh3YxfB4ZG7zew=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf991a1d-7100-4eef-2606-08dd49e3108d
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 14:56:14.2018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sx8xVmG9YYjFQVe2Pggs+OKCYOhHF51vPoc9js5jj2zNTE1n+EYJ+dZt3cSHRLIsQgsyU2h8aTuarRji9RMUWlJmNqsjtQ+3ZrRo2J6ipYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TO1PPF55F13247B

[ Please make sure to CC everyone for patch 0/3 next time. Added CCs. ]

On 2025-02-10 08:56, Gabriele Monaco wrote:
> This patchset moves the task_mm_cid_work to a preemptible and migratable
> context. This reduces the impact of this task to the scheduling latency
> of real time tasks.
> The change makes the recurrence of the task a bit more predictable.
> We also add optimisation and fixes to make sure the task_mm_cid_work
> works as intended.
> 
> The behaviour causing latency was introduced in commit 223baf9d17f2
> ("sched: Fix performance regression introduced by mm_cid") which
> introduced a task work tied to the scheduler tick.
> That approach presents two possible issues:
> * the task work runs before returning to user and causes, in fact, a
>    scheduling latency (with order of magnitude significant in PREEMPT_RT)
> * periodic tasks with short runtime are less likely to run during the
>    tick, hence they might not run the task work at all
> 
> Patch 1 allows the mm_cids to be actually compacted when a process
> reduces its number of threads, which was not the case since the same
> mm_cids were reused to improve cache locality, more details in [4].
> 
> Patch 2 contains the main changes, removing the task_work on the
> scheduler tick and using a delayed_work instead.
> Additionally, we terminate the call immediately if we see that no mm_cid
> is actually active, which could happen on processes sleeping for long
> time or which exited but whose mm has not been freed yet.
> 
> Patch 3 adds a selftest to validate the functionality of the
> task_mm_cid_work (i.e. to compact the mm_cids). The test fails if patch
> 1 is not applied and is flaky without patch 2. We expect it to always
> pass with the entire patchset applied.

There is a tiny nit in a comment in patch 3. Other than that the
series looks good. Please re-send with this fixed and please add
my reviewed by tag to patch 3.  Once updated, Peter, Ingo, you have my
blessing to pull this into tip.

Thanks!

Mathieu

> 
> Changes since V4 [1]:
> * Fixes on the selftest
>      * Polished memory allocation and cleanup
>      * Handle the test failure in main
> 
> Changes since V3 [2]:
> * Fixes on the selftest
>      * Minor style issues in comments and indentation
>      * Use of perror where possible
>      * Add a barrier to align threads execution
>      * Improve test failure and error handling
> 
> Changes since V2 [3]:
> * Change the order of the patches
> * Merge patches changing the main delayed_work logic
> * Improved self-test to spawn 1 less thread and use the main one instead
> 
> Changes since V1 [4]:
> * Re-arm the delayed_work at each invocation
> * Cancel the work synchronously at mmdrop
> * Remove next scan fields and completely rely on the delayed_work
> * Shrink mm_cid allocation with nr thread/affinity (Mathieu Desnoyers)
> * Add self test
> 
> Overhead comparison in [4]
> 
> [1] - https://lore.kernel.org/lkml/20250113074231.61638-4-gmonaco@redhat.com
> [2] - https://lore.kernel.org/lkml/20241216130909.240042-1-gmonaco@redhat.com
> [3] - https://lore.kernel.org/lkml/20241213095407.271357-1-gmonaco@redhat.com
> [4] - https://lore.kernel.org/lkml/20241205083110.180134-2-gmonaco@redhat.com
> 
> To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> To: Peter Zijlstra <peterz@infradead.org>
> To: Ingo Molnar <mingo@kernel.org>
> 
> Gabriele Monaco (2):
>    sched: Move task_mm_cid_work to mm delayed work
>    rseq/selftests: Add test for mm_cid compaction
> 
> Mathieu Desnoyers (1):
>    sched: Compact RSEQ concurrency IDs with reduced threads and affinity
> 
>   include/linux/mm_types.h                      |  23 +-
>   include/linux/sched.h                         |   1 -
>   kernel/sched/core.c                           |  66 +-----
>   kernel/sched/sched.h                          |  32 ++-
>   tools/testing/selftests/rseq/.gitignore       |   1 +
>   tools/testing/selftests/rseq/Makefile         |   2 +-
>   .../selftests/rseq/mm_cid_compaction_test.c   | 200 ++++++++++++++++++
>   7 files changed, 246 insertions(+), 79 deletions(-)
>   create mode 100644 tools/testing/selftests/rseq/mm_cid_compaction_test.c
> 
> 
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
