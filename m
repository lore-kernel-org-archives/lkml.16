Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2084.outbound.protection.outlook.com [40.107.96.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D856415C0;
	Tue,  1 Jul 2025 19:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751399322; cv=fail; b=q+NStl5XlS0ZWbWe7K+dDKaGaMUu9+5OmBzWkbTOhxgloALHQnVqiCU9NbIrp7U5a+jcpohOU94Ihg8fHfZ6bu8RZy3cjKhYSc5KSNEVxEvQrqfC7JLaTlbTuCzN4sC+yOpyWRB2IZ5emcz7D8Nd0PPZrdL+6CilpmhGs6T/aQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751399322; c=relaxed/simple;
	bh=7Yct/n3k7Vnxkcx2KR9/nU/vfSyZl/wrHBtdos8XwO0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R4QeDs14uD7t58s2vu3GuUbWQiHXOFBcglIeEtOS/iYdL6i8/f8TTRStPIFpe9HZ3CTDjzc5pGJwWo84z0Cyfkoej8+TAsl+tPuSAh+9NKdx0RYi8CB28bi+ndVUMWIlyzvHrwobaV0mZ3z8QyVm6xuGz10nzSDmk5xqqheef+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TR+C7hdb; arc=fail smtp.client-ip=40.107.96.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TR+C7hdb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whUhuOFl1U/OCSw/TKvLmaHrr63tkI9ctgTuX3t7t2Xho53zCBMIF+Nbr9B+4ycbPaVNfGn0fo8CExxEGssWivQLoCPBMGO9hrzqPVM32wMKIn4s9G8yLDvK+dPhdQGslMH5i8jGgf2WkL9uN4JZc0gaUWnvcQH6bzz6Na7+gqEozl/eIGVL00CXRGxsaLcZpdOw13Rd0b5f0NAyjZeqGAuERjkLJAm4SXZ1PNg2SHtxwTY+w/MZhjqBDpzJfL73hFjG1jsvmR8kJqlHD1yhHZd/bAO87UrlwP0sSg4k4nMjfd6kcqjIin6wWvS7fwWXSUJRrDYaSprpUPG0D5/29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5kxKWEMnOt6fkoTL7K4vYTpZhS3cjQ0TPG2KsPrxW0=;
 b=hFU3Y2q+tfo9Ejcogu9bTmNEKyEkUkgN+AFfEv+6JC3A9lHR8XlGti8icnWeRkRrQyM+gVHAzmGowdkXACAEHuXN/qIyT/eXz1YciViKxszPbFbpgiZ0CetyLFo3rM50pWOb0VpiVVyofb4KbVKpMjXgfv6u29eQSZI9CTiuqdvMjIaSvOmDsaQXPjVUEOQow95ymssr9XnJtG7e7yHWyOHqKT7YLoG+1UOzandTVP2l0FoYig3239B9U9LNIZG7YXr0NWEN+OAiV4cmBtVrTupj7+v3wKRVgkrH1zW3tu2PxjQuo2nNw6ptSPJFqAy6otWpudfKR/A0YYTqhY0BFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5kxKWEMnOt6fkoTL7K4vYTpZhS3cjQ0TPG2KsPrxW0=;
 b=TR+C7hdbd7BBnuWMoCZ1/tMz6/mqw20OPThacfra8mjla0eCUMYOOig3HTrxB+piBZLhImKc87yTSWGztWDIvcxsrd4tuzyj0QZi3KTi2UAyK2wXO+Oxb7Ht/KwW+9+iVjJqMgSmJ9SBIGa4SX89vOxPuqbY/3m1Ctr5fVIVKuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH8PR12MB9741.namprd12.prod.outlook.com (2603:10b6:610:27a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 1 Jul
 2025 19:48:35 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 19:48:34 +0000
Message-ID: <7c9bcb5c-0626-495d-b581-2bcbdf8d8699@amd.com>
Date: Tue, 1 Jul 2025 14:48:30 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 28/32] fs/resctrl: Introduce mbm_L3_assignments to
 list assignments in a group
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
 <ee123e224ae4b7869378316df0da4ff00a19d093.1749848715.git.babu.moger@amd.com>
 <2313a148-2946-4d33-9062-852dc56e16dc@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <2313a148-2946-4d33-9062-852dc56e16dc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:806:120::29) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH8PR12MB9741:EE_
X-MS-Office365-Filtering-Correlation-Id: 201c1465-e29c-4d42-3045-08ddb8d843c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVZ5QklZVndoQUV5SE1BMmZrMStFMjBoYkJvSS9YMDZLUVhYZUJ0WjJKV3hY?=
 =?utf-8?B?eG56ZXQ5M0gvM3FFRWFvaUZQNVprVkhJSzYvZUYySStiS1dGeHd1WG9RTzUz?=
 =?utf-8?B?U0NFRGZoYS9zMzZtVkcvSnNwSVcyenNCcUNVWHRSVkpyZDJiQXdBdjZDdWhT?=
 =?utf-8?B?TzkyWnJsY0xYTHBGMkhaQmF2cUJtTVE2eDBkQ1U4cHV5dHRBN0laM0MxTkxD?=
 =?utf-8?B?Y2h2WmUyNEh0cTJna0JtY2ZlVE5DQjM4NmwyM05IYUs4eXg3V0E4NWp2UFBI?=
 =?utf-8?B?VDdlWDdqSFBhYlhwMjVRSEtBb3hIMzRBMS9kbE5lZkdOaGZ2YUlvT0p2UkxY?=
 =?utf-8?B?akF6MjBxeFVXWllJUnhSNWQyUFRZSCt5NXRmNXY0NTZEUGZ2ZXlVeTNQWWRv?=
 =?utf-8?B?aEZYVWMrZVJyL0UxMnkyRnpOMFk4YUxlVW9TU1NsWHBubVJaUnY5WnkzWTdk?=
 =?utf-8?B?RVVOMUdCdkJXY0Iycmw1K3Z5djE4a0JOU2tJK0w2c3IwZS9zSVA1TUFwZjhB?=
 =?utf-8?B?NVNPRUYwOS8wcEI3VVFEbXYySFV0eWVEdkNtM2xMQS9tYlVnVlAyQkN0TzND?=
 =?utf-8?B?WVd6WVN3cEZZWjhIVEsvYlY5RUt4RXNTNUdtU3JuSXNzYlFRNEdlVWhGR1lr?=
 =?utf-8?B?bm5ubjJJODl6VFNCclNKTlA1U0xrQ0FwTDhRNjB0SnlHTzQ1ZWJSNG0wYUNK?=
 =?utf-8?B?cXhaN1AyMGVBZ2Y5L0xkOFkxZXgzNlNZN3JzOHBlS3NJdHRYNmtMVyt0SGR5?=
 =?utf-8?B?U1VDMzhqMytwcFM1Mkd1anFNdUMwSzNmS3FUdFhBTy8wd0RjUW1CaGFyalZn?=
 =?utf-8?B?NERQZWxYQjd3S0VaTXh5WE14OFhjWURYNWdXL3NxZklPMkNsVEVBVURtWXRD?=
 =?utf-8?B?L3NOakVPczNzU1p4eU1wTjNwaWJFVmN0VDFPM1dXUVovZ3Rvb3FsWjJKamRx?=
 =?utf-8?B?Vk5FcHo4SnVVZ01CYXI5QlNuUEJFTy81U0hpeEh3ZmwrREVXK3Q2ZGx2cStT?=
 =?utf-8?B?MUd4d1FVSGg1dHdoblhISUpPWGtZMmZGQUVuWkErTnd5N3pXYU9wOGhxd1NN?=
 =?utf-8?B?TFVZQUZyS1FlUGJNQ3NSTXJzTXJxUjIwMmNZQTErNWxHbGFyODRtaDNER2J0?=
 =?utf-8?B?bS9FUXdaWnZqNFphRkd5S0JhWkt2aEdUdGZXTWNGMVV4Y1FRVFM1c21lekp6?=
 =?utf-8?B?YkhMTHhtL21ZWCtGTmNhSE9jSkxzb0RTWHVrSGRlWjV3YkNEWkZZUU55ZE94?=
 =?utf-8?B?RGNUcmRXTUdMVE5ZNy9nclNZUFdadmE5VGNpZlFPZXo1cm80dWRXcjZoVmVw?=
 =?utf-8?B?c0dWRVQvUUs0SmZRTE90bWVLVXpFMjIxamczSG9ETTE4Q2U4VXhmcWVPelor?=
 =?utf-8?B?blFmaUVSOUhLSFdGZnpHaXJOZkJwUGZCUnRsa3lETi9iREVKaFhmYzMrQndn?=
 =?utf-8?B?QTJSZFhqbWdUeHRPYnFOUUhkdHdnQ0RKZVF0aHdacHlxUFNScjZvcm83SUZN?=
 =?utf-8?B?djRVRklNeXZQNEFOcWtSK0FVLzlFdk5iaFcwdU4yYytENW92ZGU0TmxiemJ3?=
 =?utf-8?B?UjhkZklzWVFkOWN2Y0toSmR4OG5UOXNrb3pJTWE1UUJjcXI1enQrRFl2b01x?=
 =?utf-8?B?Y3dMdVBUQjAycDRzMVpyb1VTeU9KMTlMWWVUNFdxZjNuKzF4NVgzUHJRcTcr?=
 =?utf-8?B?azdxR0hBeks0dWpwZzVZcDEwN3drNUY0MkJiOFpPMFFpWjVZQTJicTZkRjNl?=
 =?utf-8?B?UEE1aWNhTGJtT285bkdlSXMzdUk5OUdQcjF6NmRCT21ZUWo2WU9laEhRdjlO?=
 =?utf-8?Q?HCD3pK3iMB4OxPb1SiMiHhKCic+Wo6PrOGBs8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVNGRFlzRFJkZE5EcXNyOGNzM3plU0hzZ3BldWczaTh4d2xScG9KZzE2NDc2?=
 =?utf-8?B?cWJPVUczb0diRUtJTzd6TDBOc2owNkR4bUtuU3Y2TDhERHVTQjhPcEJKaGhU?=
 =?utf-8?B?RzR6YkVGamhLTDZ2UEdUeDBSVDVnclVsbm4zVi84SmpMWG1nbHkzVVlFZTNo?=
 =?utf-8?B?d2JuWmNScHF2MFR4MWZvTWRLTCtEa2Fva0h0THVBT2xZQmNmRVUyN1dWOGtp?=
 =?utf-8?B?dWphYzRnOGhRQWxnbll0L25VN0hzV294dFN2blZyM3FWZE51Q2d1VzliMWhY?=
 =?utf-8?B?Y1VKVGJWNlNmMG0xSndXemZhOTE3cVdvTFBRYXNHcTBsRGx0WEpRSUF6bHA4?=
 =?utf-8?B?cFJvZzFoRmM0UjEwbW9IWno1SFQvUFVTc2RHVlJnaXlmdEh1V3puSGNuaVNU?=
 =?utf-8?B?NStreHZibFVqVGs4VzJzSms4MFUwRDIrb0JYS0ZwdnVCRjdaVXlCeVlGY1Qr?=
 =?utf-8?B?QUdWNVd6VEVZRVpYM3FTZTk4T0V4VFB5ZnNLY0UrOXI5eFhicXF3UGYxd3hy?=
 =?utf-8?B?REdqcGpzeDIwL05qR1FnWThLZE9lSjJSOUxjNG9NK2tVUFJGSHR0QW5nRllY?=
 =?utf-8?B?Sm8wN21DSEJ2MXlEZm9PaHNOb2VobVdRSnBuNmFpeFFnUThiNDN2TnE3cUFD?=
 =?utf-8?B?SFB0ZTlJV3RxUnRxajd5YW1QaVlEQmZKdERMNmJDTlVNUUVEaEdYZ3hFektY?=
 =?utf-8?B?ZFEvTGJ4aWZFWDBjZlRHZUoreUV0Q2kxeFFGVUdlS2duaVhXVEFRSWt2Vlgr?=
 =?utf-8?B?anRUZUdyaEMzZmVNbXhIUFN0ZzZrWmRDYldtSVdKU2VUZjAyT28zSlFKMHRm?=
 =?utf-8?B?SDNNS21mSzFrbzBuTDJSRk9vT2V2dFk1MU1JS2E4dXJYQk1Jc1RCa2pHYzJn?=
 =?utf-8?B?TGJpbVN4ZUR5eUN3RWc2VFRodDV0a0JtRnF1bWl4b0Z0ZlBEbmlUaVZYUmUx?=
 =?utf-8?B?d1JBV1J3TDIxK2FmUDBncUZZUkM2ZGhibVBvTHNlRmxPVDdWd3pSdDNoN0Zk?=
 =?utf-8?B?eGNhUmlRUENxL2lkVzdmdkw3U0ZpQWdtYUovb1ltKzVFa25kejZEWnBFb3BJ?=
 =?utf-8?B?RkljaGI0TEMvUnlVQnlsNmpEbVlhRGIxRUFFckdCenpTSkNNeDlJcVcrZGRO?=
 =?utf-8?B?QWljaW9oMXhSOWxXYWpUQm93Qzk2bmdLVEc4bE5nWFI3NGNNbTM1RE00Y0l4?=
 =?utf-8?B?M1BmNEV2WjBFY2VJWlJwQzU0Q2FhM0RRdTgrV0FleUgrY2hqSWEzbHNWZjVo?=
 =?utf-8?B?YUVPNDQvZ1JoMjYwdURncjM5OVc0OXhIVVlFK0Q2YU5yODJsM3U2UFpudzQy?=
 =?utf-8?B?S1czUkIvVU1FRVcxaWhKNGVTSFlNOVhGb2NjZDNTb3VnY0MzdVJvL3Z6K3ht?=
 =?utf-8?B?TldYbzZEU1R0b0QzZDZtNGp6MVdqRTN2VXVReXBoMmJYOGhYV3V0bk93dUZ2?=
 =?utf-8?B?Nzk4UE9TVWVJajhGZUdwc3VHdVRMUnRqTHdUMXJSTVR4U2o2eStBUldJWE9N?=
 =?utf-8?B?RkpyQnNsWXhwZEhhQkhScG5oR1dQakl0c1lLTHZKR3ViY1BXdTlyTzNzaGU0?=
 =?utf-8?B?a2FVZ3BITG5KckpEZFJPQm4zdE9iTWRDemF5LzJ4SWkrM2hDcDd4RmQ0K1dJ?=
 =?utf-8?B?UzN2RWZtdnVDSENraFhtUU8wVmNIdWZTMDVQS1lrbVRFMm45aks5Y2dTSzRq?=
 =?utf-8?B?bUNkYWk5N0tObTFDUmozUk5mVGF4MGVPbEZqbGhwa1M4WTlRSU9NNzcyQStM?=
 =?utf-8?B?U01tYkhaUmNyRGRvTnZaOGpPM0N2TXlvakhWa0tRQkNCekJZZmdyUk5DbkJi?=
 =?utf-8?B?RHhPd1FQQWZOZVlVZHVFelNVNmZ5TWc5Vy9BQ1FDZTdnKzlMcGhKTFRMSTRF?=
 =?utf-8?B?VElWR0dXKzQ3djJGcDdYektaV0lYZlpwVlVrM21PbGhoVERHSjVCZGUveTNN?=
 =?utf-8?B?aVZBZGVsN05pRzBUOW9aa1FSQy9MK0svT2dzaHFoZEZtTTFwYXpZZ2JNSTE3?=
 =?utf-8?B?bm9uSFhVdml1QlhRWFVUQVBJaWdQeHZGUVA2Y0duTlZMZ0E0OGVvR2dJQkN6?=
 =?utf-8?B?M2p3ZktSc0RMVEV0YVZRblRnZy96MTBkbFQxeGg0MjZEZU8xTGloMGI1dDV1?=
 =?utf-8?Q?s39Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201c1465-e29c-4d42-3045-08ddb8d843c3
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 19:48:34.8254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhMR9RMc/K9biA/4QYTz0rqfuK3I0CDmtsQG/QbITQdyFCKtNRZQH4j7585zAvND
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9741

Hi Reinette,

On 6/25/25 18:27, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> Introduce the interface to display the assignment states for resctrl group
> 
> "Introduce the mbm_L3_assignments resctrl file associated with
> CTRL_MON an MON resource groups to display the counter assignment
> states of the resource group when "mbm_event" counter assignment
> mode is enabled."

Sure.

> 
>> when "mbm_event" mdoe is enabled.
> 
> "mdoe" -> "counter assignment mode"
>

Sure.


>>
>> The list is displayed in the following format:
>> <Event>:<Domain id>=<Assignment state>
> 
> Similar to previous note, please add syntax for multiple domains to avoid
> it appearing that each domain is on one line.

The list is displayed in the following format:
    <Event>:<Domain id>=<Assignment state>;<Domain id>=<Assignment state>


> 
>>
>> Event: A valid MBM event listed in
>>        /sys/fs/resctrl/info/L3_MON/event_configs directory.
>>
>> Domain ID: A valid domain ID.
>>
>> The assignment state can be one of the following:
>>
>> _ : No counter assigned.
>>
>> e : Counter assigned exclusively.
>>
>> Example:
>> To list the assignment states for the default group
>> $ cd /sys/fs/resctrl
>> $ cat /sys/fs/resctrl/mbm_L3_assignments
>> mbm_total_bytes:0=e;1=e
>> mbm_local_bytes:0=e;1=e
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v14: Added missed rdtgroup_kn_lock_live on failure case.
>>      Updated the user doc resctrl.rst to clarify counter assignments.
>>      Updated the changelog.
>>
>> v13: Changelog update.
>>      Few changes in mbm_L3_assignments_show() after moving the event config to evt_list.
>>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>>      The rdtgroup.c/monitor.c files have been split between the FS and ARCH directories.
>>
>> v12: New patch:
>>      Assignment interface moved inside the group based the discussion
>>      https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/#t
>> ---
>>  Documentation/filesystems/resctrl.rst | 28 ++++++++++++++
>>  fs/resctrl/monitor.c                  |  1 +
>>  fs/resctrl/rdtgroup.c                 | 54 +++++++++++++++++++++++++++
>>  3 files changed, 83 insertions(+)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index f94c7c387416..a232a0b1356c 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -516,6 +516,34 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
>>  	/sys/fs/resctrl/info/L3_MON/mon_features changes the input
>>  	event.
>>  
>> +"mbm_L3_assignments":
>> +	Exists when "mbm_event" mode is supported and lists the counter
> 
> ""mbm_event" mode" -> "mbm_event" counter assignment mode"
> 
>> +	assignment states for the group.
> 
> "for the group" -> "of the group"?
> 

Sure.

>> +
>> +	The assignment list is displayed in the following format:
>> +
>> +	<Event>:<Domain ID>=<Assignment state>
> 
> Same comment about syntax example.
> 

Sure.

>> +
>> +	Event: A valid MBM event in the
>> +	       /sys/fs/resctrl/info/L3_MON/event_configs directory.
>> +
>> +	Domain ID: A valid domain ID.
>> +
>> +	Assignment states:
>> +
>> +	_ : No counter assigned.
>> +
>> +	e : Counter assigned exclusively.
>> +
>> +	Example:
>> +	To display the counter assignment states for the default group.
>> +	::
>> +
>> +	 # cd /sys/fs/resctrl
>> +	 # cat /sys/fs/resctrl/mbm_L3_assignments
>> +	   mbm_total_bytes:0=e;1=e
>> +	   mbm_local_bytes:0=e;1=e
>> +
>>  Resource allocation rules
>>  -------------------------
>>  
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 1ec2efd50273..618c94cd1ad8 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -959,6 +959,7 @@ int resctrl_mon_resource_init(void)
>>  		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
>>  		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
>>  					 RFTYPE_RES_CACHE);
>> +		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
>>  	}
>>  
>>  	return 0;
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 128a9db339f3..18ec65801dbb 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -2081,6 +2081,54 @@ static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
>>  	return ret ?: nbytes;
>>  }
>>  
>> +static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
>> +{
>> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>> +	struct rdt_mon_domain *d;
>> +	struct rdtgroup *rdtgrp;
>> +	struct mon_evt *mevt;
>> +	int ret = 0;
>> +	bool sep;
>> +
>> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
>> +	if (!rdtgrp) {
>> +		ret = -ENOENT;
>> +		goto out_assign;
> 
> out_assign -> out_unlock
> 

Sure.

>> +	}
>> +
>> +	rdt_last_cmd_clear();
>> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +		rdt_last_cmd_puts("mbm_event mode is not enabled\n");
>> +		ret = -ENOENT;
>> +		goto out_assign;
>> +	}
>> +
>> +	for (mevt = &mon_event_all[0]; mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++) {
>> +		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
>> +			continue;
> 
> (use macro and mon_evt::rid)
> 

Sure.

>> +
>> +		sep = false;
>> +		seq_printf(s, "%s:", mevt->name);
>> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +			if (sep)
>> +				seq_putc(s, ';');
>> +
>> +			if (mbm_cntr_get(r, d, rdtgrp, mevt->evtid) >= 0)
>> +				seq_printf(s, "%d=e", d->hdr.id);
>> +			else
>> +				seq_printf(s, "%d=_", d->hdr.id);
>> +
>> +			sep = true;
>> +		}
>> +		seq_putc(s, '\n');
>> +	}
>> +
>> +out_assign:
>> +	rdtgroup_kn_unlock(of->kn);
>> +
>> +	return ret;
>> +}
>> +
>>  /* rdtgroup information files for one cache resource. */
>>  static struct rftype res_common_files[] = {
>>  	{
>> @@ -2219,6 +2267,12 @@ static struct rftype res_common_files[] = {
>>  		.seq_show	= event_filter_show,
>>  		.write		= event_filter_write,
>>  	},
>> +	{
>> +		.name		= "mbm_L3_assignments",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= mbm_L3_assignments_show,
>> +	},
>>  	{
>>  		.name		= "mbm_assign_mode",
>>  		.mode		= 0444,
> 
> Reinette
> 

-- 
Thanks
Babu Moger
