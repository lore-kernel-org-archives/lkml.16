Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CA2451C3
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 01:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746494656; cv=fail; b=i2aaCfOVb9hPG2XNcUxRF4b8LMLw1F36fCvGvWDG07vbBwisM1i0FwHrUQwHPfGJRhIyb/yy0Sm11qYAVJQGuFu3rAY0VyiUh3Sd7GIOPQEAiNNoS8NQnIAYzX6lO7nDVuXEeeoNtBpXKSw5IjDAIuKSCRcZMjtmmCbwLTDbgG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746494656; c=relaxed/simple;
	bh=CKq7hanYDav3q0uK0hNKbf1jX0xhHO+kSQKKX9xfdB4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HV5iBh5GzPtpL4KzlN1HydiQGmoLnBRLCZ4g7TJ0IC1saK7TABBeX+2/+7oKDm6C7SC43cpIl7Se2p0gbauNfIh0E7Nb8d4+pHj4t+ian/JzAhsQ0hOR9U7R5TXo9Z3g/ZQMEKq0kMkFvD5PELzGD28u8eb1dba8fIheYdyXUGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BAxRF4ov; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kpYaf1Ev; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BAxRF4ov";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kpYaf1Ev"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54602WXm006708;
	Tue, 6 May 2025 01:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=CKq7hanYDav3q0uK0hNKbf1jX0xhHO+kSQKKX9xfdB4=; b=
	BAxRF4ovQIquoTRbRkt+eaCzGudrtnDUAuN3x92CTO8w0EoyJQ4xsEI5bzkuc16t
	njRnX35fOg/LrtA9zm+BfuNU8hB+LktKKs17J55sxWST5S2bCeth4TJkqyGLMqVK
	t/4MMvhZ8//erZUM/rCp9EFF4itodEtnyGTug6J8VpkzZh6fW5B6ugAnPJVBCxt7
	lqVGrJqV6oAPasBlxEeUKQ0CSGfk/uL38R5tcA0VPecdgovEmMSVGHqiqpERnWa4
	uAEV/ItEgmvQ66V3kWHwdv3T0hBuOG1PHwmvHYOcXdk2DXUOckk0uBxv8eZeoUGr
	4zLwXkvmMnLQdBrnqqGaoQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46f7h882u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 01:24:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 545NUPcQ025049;
	Tue, 6 May 2025 01:24:02 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010006.outbound.protection.outlook.com [40.93.10.6])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kempu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 01:24:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkSO7tcr3KaQQesaq7LJ+tzAEVMj0K9w53JY54H9WqB8KtSjvA0x/hHaBRvJxNcECyWuAZQarWgK1sGfOJfJ3Mz/aZyL2YUi41J0IEw9JuIKd0Ko9HwrxVasgeqvAdbgZFHpRwmVySrhArvEPc94twVaVkngK5cuQ8HEc3VjCKDUm0vftkm1YaToWUvjeKBAckKOhHasHP6QXKJJNKOqZsDEmQHv+hFYy9F4fndvzpLD/g91qBAg3PyqTSR14i83IfU/yAjzAz3Ik/3s2PfsEjsaSnVxuE3g60uqmKHrNuBvKjjeAbjwQr9nYJT3naRQsMglUMGrUhRb00nREzW+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKq7hanYDav3q0uK0hNKbf1jX0xhHO+kSQKKX9xfdB4=;
 b=yPc6oYC10wkAoyvpx+E4hV3LGzg/hO44OUmTyEhrDcv9cWx5SPMlUM5leU/j86ADcUlZosGqygoScVxHFmwN5BNiNu1pVg5ft6/a7FFwj4pZ5Mc5Ogor4IW5qksJiyQ8NMmDnq/YsExB5YxusD1tWie3pXabHJLebLBNZvQm7GJomQpsh3F0u0D2QTX6b3mSBj8qeYcA7AxDV19XxI2e0uaQoksbLOJ2HO08lAZmAM8yLG8NiCeC/DHK1Gl+sWxhn0v3GsNm9EeAj1vsJNFgHXPczOoJoQvYSM/X9G1DSBior+aTAwVkWTk5jn/S3SdxGCZgrURj4ej4h+jyCU4OvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKq7hanYDav3q0uK0hNKbf1jX0xhHO+kSQKKX9xfdB4=;
 b=kpYaf1Evjb3BGvOUQhT5S+TY0971zyT/2ovjNQTDGqtKp8VaSfqjcDiNpKzRl+wCSv8ryEQIy3uFsoG7ULLcdFrMDAfTgQp/pzF3xlAme18kyuMP9zb/lh8MGYNzfsm1pH8KbA2k5tN8XP2+2f0lcaHujUhpwiMXACUVGDMCIvo=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by CH3PR10MB6901.namprd10.prod.outlook.com (2603:10b6:610:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 6 May
 2025 01:23:56 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 01:23:55 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: Peter Zijlstra <peterz@infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>
Subject: Re: [PATCH V3 1/4] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V3 1/4] Sched: Scheduler time slice extension
Thread-Index:
 AQHbu0F1MdTMmRhrrUCPTfzyEjyJ57O/T5aAgAP6VoCAANkZAIAAE2yAgAAKKYCAAJPmAA==
Date: Tue, 6 May 2025 01:23:55 +0000
Message-ID: <E47F0700-73FE-4D85-A5FA-CE14D0C41CE4@oracle.com>
References: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
 <20250502015955.3146733-2-prakash.sangappa@oracle.com>
 <20250502090529.GU4198@noisy.programming.kicks-ass.net>
 <20250502090643.3809b6f5@batman.local.home>
 <C3F85063-68B5-4C6D-B95F-27B72DBFA178@oracle.com>
 <20250505104830.36f22a4d@gandalf.local.home>
 <4D9FC618-1BD6-4126-8B1D-96ECD497CA90@oracle.com>
 <20250505123423.3494a18b@gandalf.local.home>
In-Reply-To: <20250505123423.3494a18b@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|CH3PR10MB6901:EE_
x-ms-office365-filtering-correlation-id: 4b727661-87e6-4e61-ba81-08dd8c3cab76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UXp0VU5YSnhtejBOaEtNa041NGVCWk5YNlRiOGRJTHR4MHR2dmx1UW9mMzVD?=
 =?utf-8?B?V1Q1R0EvLzJkOS9QWS9rYlNSd0dUU1BRcUlQTWhXTnZNMFFkdkt1dHJnQkpj?=
 =?utf-8?B?TDZIeTczMkI3ZnY1UVFMT0RWZHJsdncwMWdYb1UzdFFvTXB4YldQNS9Mc1d1?=
 =?utf-8?B?RmxqNDJSb0xJTW1KczB6YTg5eFhrUy9xVmtmU3dJVC9lOTJDNXQ5V1FhVzFo?=
 =?utf-8?B?ZHM3bkt1bWc0c3Z4QXhTNm9vbk5ZaE8xUFcxRW9menB2emw5Wm0wc2dJL1Rs?=
 =?utf-8?B?VFpmank0RksvcEd0L1ZUeE4wMGsvbzFNdERBZ1NyRzZwSzZJWnhNNkVhSWNQ?=
 =?utf-8?B?TCtWQ08zdEZlbmI5USt4dEZuSTNFSzltM1Q1N2swcFArZWZ2bFhQWXJ4VlFw?=
 =?utf-8?B?cW1aNnE5WFZ3azZtbjlrVG1uTlRVUE9qS1pNS0toNHk4ZDA3SUIrZzVrTzVr?=
 =?utf-8?B?V0xDa3hpTmRsUlNRWGpURVk3cDlqc1F5ZTlGdmZHZWppaWlSU2pMb0o0bUcy?=
 =?utf-8?B?Y0pGcEswc0JMamthUEhNbWdEMVB3cE9VQThFbE1XSWZnWW5WM2ZpNWJwSnNF?=
 =?utf-8?B?NVpLQ2h5dTdSNkVDYmVxVmFuaUZ3eTVndXd4SmZ5Q05FY2c4T1ZBSHVVVHNj?=
 =?utf-8?B?WXJ2a25VanVjRDRGYWh6TnJkSHlGVlgzY25palorWFRBWW1PRkRtSXVjRXY1?=
 =?utf-8?B?amxIRk5KU09PZzdsT1pKN1k4dW1DMmNQMU9iVG1wZTcwR1B3ZDAwSlNaQUtx?=
 =?utf-8?B?ZEpRL0lzaXFJU1Q3aUtudThRaTZ4U3dDbXF5SjNWZ3RnV1dmRXRlSmgzZjIv?=
 =?utf-8?B?ZW5MY0VpSXZST3RNT01qU0FHaGF1cU42UkxKMFdWT0Y2ZmhPdTA2M0VGQzUx?=
 =?utf-8?B?aHhSRHdKYjRZVlA4UDZvVlpEcytGUmZLbFZQNmVIMzVBU042Y1YvSmJOL3Qr?=
 =?utf-8?B?SHlabFY5VEdYS0pDTURiV1JGTDBHQ3ZqazduM21KLzNKRFdWNVlubHMrQlFu?=
 =?utf-8?B?MFlsaXViWnlnT3JvY0dwKzFyZVBqTDdUNHhsSDlsbFJxWjVVa1pGcHA5Y21m?=
 =?utf-8?B?enN3dW8wU2R5eXk5OWhiZEo5QXI2bDFpZ25xaDFYTXdYUWhnaFJ1Kzc4TTNp?=
 =?utf-8?B?dTRlSXVtT1JhRTZoVHA3WHZ4SURkbmpqaDRTS1dlbkNqT1YxQU81RzNaRk1k?=
 =?utf-8?B?dE1ZVHIvOEVQZURJalVncW1OUkxGYTZOcDg0NkNLWUZQbFJQaG1EdnY4Tzhw?=
 =?utf-8?B?dFQvZFZFYmdhek84WmlmZzRiYVhEVWhWd3I5eU1la0x6aTRWdlpWcy9uQlpZ?=
 =?utf-8?B?WGl1eWJlZlBmV3l1eGJ2N29HTkFOZjYwdC9KVDR6V1JTMDdLcmxPTDh2V2JL?=
 =?utf-8?B?TmhGM1hvL29GR0lYWnRuK3VuQ2laRlpkc0U4eWU0bUc4U3RyZmZaa1M3aWxI?=
 =?utf-8?B?Z3NFQUgwQmxIWm1JQ1JGV1p3SDBLMWhHOFNaQzdwdXFqL2haV0hMbUpKV3pD?=
 =?utf-8?B?UXNiamRSMXlhL0hhZGdOUjVCN1hOT1VNT1BWT1I4QWJYOTN1bitaOVc1aVlt?=
 =?utf-8?B?UUYwS2tHT09iZmNWdDRlYUlGL2RMZ3ZudVcxK1p0VG5PUDE5aEx1bm9tZVk2?=
 =?utf-8?B?MGpwR0FvZWxKVklxOG5KNzRUdUczVzk4cys1a05SQURWRTFQUTJnVXh1bUI0?=
 =?utf-8?B?QUo4NWhMd0RYRGU4ejJEY0RUVjN2U0IrUTZydE1jVnM1MzRpOFUyNVhDN3RF?=
 =?utf-8?B?M1ZMcG1WYnQ1RHRVdUFsOVUxelNUeVc0bGtlMXBnRDI1SmtIMmFaSFBCZGxJ?=
 =?utf-8?B?cWhaQ3BMcjJxZys3aEJrZDVpNUpwSUtMNlNEbFdHSFZnaFdmb1hjK1BSYmdp?=
 =?utf-8?B?Z3M1b3NWVHZhb3FaMXJ5aDFUc1I5WU9DZDcyWFpuTjFUUFpDMzlETmNIV2Qv?=
 =?utf-8?B?dEplYUxWSmtUbmFlSXBzZWY3VXN1MjNaZ2VlejZlazdkWHVjNVJCWjBCek4w?=
 =?utf-8?B?TWVVbGpYQVhnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjJmK0ZwaDRXcFo3Z2JKb1RTc1ZVMWFYN1ZpVXVxa01KWmpZTkt5SUxoYWVQ?=
 =?utf-8?B?UnJjbTNJbkFkb0YvY0F0aXJGNkZvY3NjaGNxeUhsTTJUT1VrT0dlalR5TVlH?=
 =?utf-8?B?eEFJdWxSTVdjL3pVOEtkMUl3SDhFaExVUHRMbnU1eFNteWZqU09YMHphSWNs?=
 =?utf-8?B?ZnNZSi9za2VlY1c2M05KM3l0azYxSHV6VjJXbXhubGFma2hyaENrSW5Rcndt?=
 =?utf-8?B?Tll4Y2FIblduUlppSHlFdlRNdDIwb20wcVg1NzA4cVYwUFhLK21IcWZnYnl1?=
 =?utf-8?B?WHJOemZLTzl3UE81Z3BCeFo0Tkt0TlhvRTFpdytvRDcwYnlaMWFpQXl4OElJ?=
 =?utf-8?B?ZGRrc3NXTnRvanBJNVNxLytnY2tSSzZ1aWdwbUpUMXlVYW5LbStuVTFqVVda?=
 =?utf-8?B?NHdzcE1vRXlOUTB3YWxTSDJtMy9oak1mQXcrTFAxMk42SEZIaERGN2VXSWFj?=
 =?utf-8?B?K3lpZ2pMZWpGS291Ui9CekhBTGF3TVVhRVFJL2pzK0lLclcrMlBCRGpuTFpl?=
 =?utf-8?B?ZjFSZWpnU1NHNGd0b08zamlYL0RLdHFWeXJHc3RTcFZlazlnVDg0VDEybGMr?=
 =?utf-8?B?S1pFM3JKWkcxNm04dTN2VE04elkrdTRndjhsckNRYmNxRUoyeXpzVHVsNUZX?=
 =?utf-8?B?Y0RRc21hN09oUmR4UmtkM3AwK1EwWUg5OC90ZmdUR2RoMTczK00vSTBMSG0y?=
 =?utf-8?B?aHQ5djhQQ1RQODRNR0JoNDhsZ0dqMmNiR1JYRGJYRk9sZCtpcDExTlBOckFY?=
 =?utf-8?B?RHJhT3lKQzFjU2M0dzhUNlZBVXlxVHFsTDlnNVYxaWF1akdJQkdzbU1qakh1?=
 =?utf-8?B?U1FjamZLRDV5bnVYeHFmcmpwdzRoU3pvZ2x2bGU3SjBxMkkzaTNyOWd0Rk8z?=
 =?utf-8?B?L3E1SU9ZQVhLQ1BlQTBDR09tcTVmQ3dSRVZleXpSZEZ2TDMxYngzT29MVmFG?=
 =?utf-8?B?M0VNZ25vVk9zai9Sb0JoNlY2cXlBSVNhcE04MHR4eDFvcmVVU3ptU0pWNTky?=
 =?utf-8?B?UVlDbHVOb0FQSk0wZmFpak9laGFzaHE1eVpJZkp0RmE0UnFUdXh3OENGNUdE?=
 =?utf-8?B?OXZWanBzQVUydi92cWY1aTI3R2U0L3RSUXF1VVpsUElNcFMzb0k5UnlJSlBr?=
 =?utf-8?B?eHRwbVhscHFJdkdwZWhBTm5FelkySVdkdnVkY3cycnI4cFc4Z0ZhUUk3ZFZC?=
 =?utf-8?B?cFZKYjA3aEdHN3ZwQnZKZVF5aER0RE1SOTl4NUtRcnM2c3U3Nk4zTFA5dXpR?=
 =?utf-8?B?aW5BK2RFcHo1Z0ZRK1lmcXdBWlBqeWNidFRsb0VPZDArWWo3TUhXN21Wc2ow?=
 =?utf-8?B?QUF3SUVBWEl0Wkx5c211dWNmMFM3bHp1dEtZWXBuRkx1UCtkSDVtSjRCU0xs?=
 =?utf-8?B?MTVzZmVaRFNtVXh6MG5lVkQwNmdla2JJZWxVTUl4SVFUaTFQTVZaK294ek5I?=
 =?utf-8?B?aThIUldEQ3NZSUpNY0oyaDBGaFFETXhRb1NwOVNMWStWckFoYUxnTytQaEsr?=
 =?utf-8?B?Z3RQRXhVaGlwelZGVlF6SEhoSzZBQTRSbkhvdmUyakdndm9hbzFvMldIa2Ex?=
 =?utf-8?B?djFaQXBDb0hTYlFuMlFKWmZBSG1GSUhjdUEvWHFZdTFzRVBmOW5OdEdQenN2?=
 =?utf-8?B?UW04WXBGdUxiOXVQWTRSQlZKbDE3ZXlQZGdmVFJ2NkVESEpmbUM0TDZSbzJq?=
 =?utf-8?B?K1E3WUdEMHhIby9UNWM3elVmbkJJdGR1ejdiQ1FyVnBjaWszRGtWM0hSanJl?=
 =?utf-8?B?Y0dlSTJMTjNSTXpSazQrYml5RTJMYWRQK1NyVXVxMXc4dGtRRm85aUowdnFZ?=
 =?utf-8?B?c3NjTzNQaHZoOVJzMEYzanF6VmxST2tYcm1yKzVJSnZUWHZEOGVKMzlpYktS?=
 =?utf-8?B?R2U2NFNZWjM0cEw0QzJVNVpvNDgybG1jcFN5YU5ybjcxOWNZblVseUk0Uldu?=
 =?utf-8?B?Y0ZDVW9Yb0pQcGVLaFNOa0RVN1o1d1g0MFVHemJBQU5zdk90NkwzMU9nZytB?=
 =?utf-8?B?bVNvQmhoRHdoQS9jYzZad3RLTVBOL1pmRTdFVTFWQzl6MXorbFliRGlHc1o3?=
 =?utf-8?B?MnhqYUMzS0N1bWF5L2NmaTM0cTNSNW5GUDlveW95TGt3MEVuWlphWXlhRFNz?=
 =?utf-8?B?ZFV2dzRBMkY1RnNUcnhxd1c3a0x0MHV1Und1bzN4c01kdnZmdEFsSElFVUJQ?=
 =?utf-8?Q?TZXO5+JLALREt2iJt1Bdujo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E395388186F5747BB8B0FD936A81B59@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ARhrtu7BrgSV9iieHpCS126I5A4Qi43V+pcQxhDHOST2NmLQcw59VZrkjBraLVAEgUs2U2FP9ReingmyHAaRe5qH95q1I4F7Mw5ndvTMWUUQj94iezLpulTyo84qcPNrsjNLGInpYV8UXTJolbwfDXMAkgBv6ciMLNxyfUf3D4VfVIYfdavX+y2zI2HcFYluLVIaOeP6IU0m+ioYIwO4TUkTv7dSACR8XkihjuLZ0OLz6OJl3K3eiicl0NPUpBt5Nqng5SptsKUwsWoPQQdf4dgTE2NwDH6W1+A6BGep+xgxPITKrs85L4ZKpEQ5UK495CdGLsIl+AbFxNMlg1bkV69/0Vzby4DRZQJ0UbXOCay5xiqqshXqWw1WrQVOhbjBTCbTujeBE8pJmyK7MYFRfxER+UUGGmNsuqmu9Rb2z4E3tyF8Sc04oHKwEY5hfjVQW+ZcUQ7BugERZx9HPwiTwQ8s78MoYqixVrybb9H+R7ihtTBFCDS30xJ8rGEh6QePFQeUndh91h/KFXOPODgC8V89O7GEFSsd75oir0+tY9BmwrhlqsecBb8EMhiff/gwtKT2hJQbkwDbQJ2fAMuzFJ/9EnxFQT0WyJ15l6mGmak=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b727661-87e6-4e61-ba81-08dd8c3cab76
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 01:23:55.8519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gLM4hyGzWWZeGV378TT3BgT7dvuors6f52IWvhuZB5plk9q8cy3LRrKG+a62++sDqVWzD0sU9zW/4rMcbQ0mAS5NQt7Iwsc1/eN4lDW5R/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6901
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_01,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060011
X-Proofpoint-ORIG-GUID: Gt7ZEFuIrlbDTZNR9TolRx5N8Ipbdj8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDAxMSBTYWx0ZWRfX2R4B1dB6jmyl jJJHnAc+pRL4e3dWKEvub4SaiThd8l4FgDFzjSUP3hiuWJOIlVWsGrNdYfIacA+c8jW1RftJknD hlP7tBVkGk8CN/tO2XUG3do8025ukxx7/JKNrs5TXGIh3kOqfouDTtCqw5740nvAFA4JVTEu7/r
 2J8kQN8Rrccm3riCV2ZFa2HdWrm+BvJAlmVW5zIZjagaCXv9FnD3/C8u+3W4IQ8dUinV1RfKMKo 6/7WJ096AqxrDmzqdKfkazo4pclqTkpQQyBY/01nKkfEwchbETahDumuwoP2juWpPPl2GbtwLWV Bt0gYqwgmvymylzpZO1f0taO2TwSByBNO5C7L4BjDJG4D3zf+sMj3N82z5G4xrYPq6vUcUaBraP
 0DPONORZcNUOug3OsWYoDFggbo0d6KDpuzYAc5t09EKaneNUa4s0QKblT1FpfjYxIecZdxKT
X-Authority-Analysis: v=2.4 cv=CeoI5Krl c=1 sm=1 tr=0 ts=681964b3 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=meVymXHHAAAA:8 a=yPCof4ZbAAAA:8 a=iWbgQY8t5s6-KZRxNE4A:9 a=QEXdDO2ut3YA:10 a=2JgSa4NbpEOStq-L5dxp:22 cc=ntf awl=host:13129
X-Proofpoint-GUID: Gt7ZEFuIrlbDTZNR9TolRx5N8Ipbdj8x

DQoNCj4gT24gTWF5IDUsIDIwMjUsIGF0IDk6MzTigK9BTSwgU3RldmVuIFJvc3RlZHQgPHJvc3Rl
ZHRAZ29vZG1pcy5vcmc+IHdyb3RlOg0KPiANCj4gT24gTW9uLCA1IE1heSAyMDI1IDE1OjU4OjEy
ICswMDAwDQo+IFByYWthc2ggU2FuZ2FwcGEgPHByYWthc2guc2FuZ2FwcGFAb3JhY2xlLmNvbT4g
d3JvdGU6DQo+IA0KPj4gWWVzIHRoZSBhcHBsaWNhdGlvbiB3b3VsZCBvbmx5IGNhbGwgdGhleSBz
eXN0ZW0gY2FsbCB0byB5aWVsZCBjcHUsIGlmIHRoZSBleHRlbnNpb24gaXMgZ3JhbnRlZC4gDQo+
PiANCj4+IFRoZSDigJhSU0VRX0NTX0ZMQUdfREVMQVlfUkVTQ0hFROKAmSBiaXQgaW4gdGhlIOKA
mHJzZXHigJkgc3RydWN0dXJlICBpcyBjbGVhcmVkIHdoZW4gdGhlIA0KPj4gdGltZSBleHRlbnNp
b24gaXMgZ3JhbnRlZC4gVGhpcyB3b3VsZCBpbmRpY2F0ZSB0byB0aGUgYXBwbGljYXRpb24gdGhh
dCBhIHRpbWUgZXh0ZW5zaW9uIHdhcw0KPj4gZ3JhbnRlZC4gVGhlIGFwcGxpY2F0aW9uIGlzIGV4
cGVjdGVkIHRvIGNhbGwgdGhlIHN5c3RlbSBjYWxsIGlmIHRoaXMgYml0IGdvdCBjbGVhcmVkLg0K
Pj4gDQo+PiBIb3dldmVyLCBJdCBpcyBwb3NzaWJsZSB0aGF0IHRoZSB0aHJlYWQgZ2V0cyByZXNj
aGVkdWxlZCB3aXRoaW4gdGhlIGV4dGVuZGVkIHRpbWUgd2luZG93IGR1ZSANCj4+IHRvIGFub3Ro
ZXIgd2FrZXVwIG9yIHJ1bnRpbWUgZXhwaXJ5LCB3aGljaCB0aGUgdXNlciB0aHJlYWQgd291bGQg
bm90IGtub3cgdW5sZXNzIHdlIGFkZA0KPj4gYW5vdGhlciBiaXQgdG8gaW5kaWNhdGUgaXQgZ290
IHJlc2NoZWR1bGVkIGluIHRoZSBleHRlbmRlZCB0aW1lLiBBbHNvLCBpZiB0aGUgdGFza+KAmXMg
Y3JpdGljYWwgc2VjdGlvbg0KPj4gcmFuIGxvbmdlciBhbmQgdGhlIGhydGljayByZXNjaGVkdWxl
ZCB0aGUgdGhyZWFkLCB0aGUgYXBwbGljYXRpb24gd291bGQgbm90IGtub3cuDQo+PiANCj4+IE9y
IHdlIG5lZWQgdG8gZ3VhcmFudGVlIHRoZSB0aHJlYWQgd2lsbCBub3QgZ2V0IHJlc2NoZWR1bGVk
IGluIHRoZSBleHRlbmRlZCB0aW1lPw0KPj4gDQo+PiBJIGJlbGlldmUgaXQgd291bGQgYmUgc2Ft
ZSB3aXRoIHlvdXIgcGF0Y2ggYWxzby4NCj4gDQo+IFNvLCBteSBwYXRjaCBoYWQgYSBiaXQgdGhh
dCBnb3Qgc2V0IHdoZW4gYW4gZXh0ZW5zaW9uIGhhcHBlbmVkLg0KPiANCj4gQml0IHplcm8gd2Fz
IHNldCBieSB0aGUga2VybmVsLg0KPiANCj4gQml0cyAxLTMxIHdhcyBhIGNvdW50ZXIgKHNvIHRo
YXQgdGhlIGNvZGUgY291bGQgbmVzdCkuDQo+IA0KPiBPbiBleGl0aW5nIHRoZSBjcml0aWNhbCBz
ZWN0aW9uIGEgdGFzayB3b3VsZCBjYWxsIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gc3RhdGljIGlu
bGluZSBib29sIGRlY19leHRlbmQodm9sYXRpbGUgdW5zaWduZWQgKnB0cikNCj4gew0KPiBpZiAo
KnB0ciAmIH4xKQ0KPiBhc20gdm9sYXRpbGUoInN1YmwgJWIxLCUwIg0KPiA6ICIrbSIgKCoodm9s
YXRpbGUgY2hhciAqKXB0cikNCj4gOiAiaXEiICgweDIpDQo+IDogIm1lbW9yeSIpOw0KPiANCj4g
cmV0dXJuICpwdHIgPT0gMTsNCj4gfQ0KPiANCj4gWy4uXQ0KPiBpZiAoZGVjX2V4dGVuZCgmcnNl
cV9tYXAtPmNyX2NvdW50ZXIpKSB7DQo+IHJzZXFfbWFwLT5jcl9jb3VudGVyID0gMDsNCj4geWll
bGQoKTsNCj4gfQ0KPiANCj4gVGhhdCBpcywgdGhlIHVzZXIgc3BhY2UgdGFzayB3b3VsZCBpbmNy
ZW1lbnQgdGhlIGNvdW50ZXIgYnkgdHdvIHdoZW4NCj4gZW50ZXJpbmcgYSBjcml0aWNhbCBzZWN0
aW9uIGFuZCBkZWNyZW1lbnQgaXQgYnkgdHdvIHdoZW4gZXhpdGluZy4gSWYgdGhlDQo+IGNvdW50
ZXIgZW5kcyB1cCBhcyAxLCB0aGVuIGl0IG5vdCBvbmx5IGlzIG91dCBvZiBhbGwgbmVzdGVkIGNy
aXRpY2FsDQo+IHNlY3Rpb25zLCBpdCBhbHNvIGtub3dzIGl0IHdhcyBleHRlbmRlZCBhbmQgd2ls
bCBzY2hlZHVsZSBvdXQuDQo+IA0KPiBNeSBrZXJuZWwgcGF0Y2hlcyB3b3VsZCBzZXQgdGhlIGJp
dCBpZiBpdCBleHRlbmRlZCB0aGUgdGltZSBzbGljZSwgYnV0IGlmDQo+IGl0IHRoZW4gc2NoZWR1
bGVkIHRoZSB0YXNrLCBpdCB3b3VsZCBjbGVhciBpdCBhZ2Fpbi4gVGhhdCB3YXkgd2hlbiB0aGUg
dGFzaw0KPiBpcyBzY2hlZHVsZWQgYmFjayBvbiB0aGUgQ1BVIGl0IHdpbGwgbm90IGNhbGwgeWll
bGQoKSBhZ2Fpbi4NCj4gDQoNCkkgc2VlLCB5b3Ugc2V0IHRoZSBmbGFnIGluIOKAmHJzZXHigJkg
c3RydWN0IHdoZW4gZXh0ZW5zaW9uIHdhcyBncmFudGVkIGFuZCBjbGVhciBpdCBpbiANCnJzZXFf
ZGVsYXlfcmVzY2hlZF90aWNrKCkuIEluIHlvdXIgY2FzZSB5b3UgaGFkIHJzZXFfZGVsYXlfcmVz
Y2hlZF90aWNrKCkNCmJlaW5nIGNhbGxlZCBmcm9tIGhydGlja19jbGVhcigpLiBocnRpY2tfY2xl
YXIoKSBnZXRzIGNhbGxlZCBmcm9tIF9fc2NoZWR1bGUoKSBpZiBzY2hlZF9mZWF0KCkNCmlzIHNl
dC4NCg0KSW4gbXkgcGF0Y2hzZXQsIGl0IGp1c3QgY2xlYXJzIHRoZSBSU0VRX0NTX0ZMQUdfREVM
QVlfUkVTQ0hFRCBiaXQgdG8gaW5kaWNhdGUgDQp3aGVuIGV4dGVuc2lvbiB3YXMgZ3JhbnRlZC4N
Cg0KSW4gb3JkZXIgdG8gYWxsb3cgdGhlIGFwcGxpY2F0aW9uIHRvIGNhbGwgc2NoZWRfeWllbGQo
KSB0byB5aWVsZCB0aGUgY3B1LCBvbmx5IGlmIHRoZSB0aHJlYWQgd2FzIG5vdCANCmFscmVhZHkg
cmVzY2hlZHVsZWQgaW4gdGhlIGV4dGVuZGVkIHRpbWUsIHdlIHdvdWxkIG5lZWQgdGhlIHN1cHBv
cnQgYXMgeW91IGhhdmUgaW4geW91ciBwYXRjaCBzZXQuDQoNCkRvZXMgaXQgaGF2ZSB0byBiZSBz
Y2hlZF95aWVsZCgpPyBPciBjYW4gdGhlIGFwcGxpY2F0aW9uIGNhbGwgc29tZSBvdGhlciAoZmFz
dClzeXN0ZW0gY2FsbCB0byB5aWVsZCB0aGUgY3B1DQooZ2V0cHBpZCgyKSApIGlmIGV4dGVuZGVk
IHRpbWUgd2FzIGdyYW50ZWQ/IA0KDQpJdCBhcHBlYXJzIGJ5IGRlZmF1bHQgc2NoZWQgZmVhdHVy
ZSBIUlRJQ0svSFJUSUNLX0RMIGlzIGRpc2FibGVkIHNvIGhydGlja19jbGVhcigpDQpXaWxsIG5v
dCBnZXQgY2FsbGVkIGZyb20gX19zY2hlZHVsZSgpLiAgSSBoYXZlIG5vdGljZWQgdGhhdCBlbmFi
bGluZyB0aGVzZSBzY2hlZA0KZmVhdHVyZSB0byBsZXQgaHJ0aWNrX2NsZWFyKCkgZ2V0IGNhbGxl
ZCBmcm9tIF9fc2NoZWR1bGUoKSwgYWRkcyBvdmVyaGVhZC4NCg0KU28gbm90IHN1cmUgaWYgd2Ug
bmVlZCB0byBlbmFibGUgdGhlIHNjaGVkX2ZlYXQoSFJUSUNLLy9IUlRJQ0tfREwpIHRvIHVzZSB0
aGUgc2NoZWR1bGVyIHRpbWUgZXh0ZW5zaW9uLg0KDQpNYXliZSByc2VxX2RlbGF5X3Jlc2NoZWRf
dGljaygpIHdpdGggdGhpcyBzdXBwb3J0LCAgd291bGQgaGF2ZSB0byBiZSBjYWxsZWQgaW4gX19z
Y2hlZHVsZSgpIHBhdGggYnV0IG5vdCANCnRocnUgaHJ0aWNrX2NsZWFyKCksDQoNCi1QcmFrYXNo
DQoNCg0KDQo+IC0tIFN0ZXZlDQoNCg==
