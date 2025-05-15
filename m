Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF83B664
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747271000; cv=fail; b=JZsAuf51oIURGQdSP7vmkxpsYoCD5cv5h/rCce5TgQD+uWOnB1/o3O8ptzW5bS8ri0wR9xwXrD6oeoHIrqATlR/lTNkD74EnE/1sCCWZDYFVS59SZpxTbE9cS8aIV7eNFFxRSLmaJP2/qaBnooxMATid0M/Y8sfojJjjuiBNr64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747271000; c=relaxed/simple;
	bh=g0Nk2RqC8sMEeOfCwC32v3VEDXXXKNwRzfDQNVKknl8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oK3araSZTCVcEIrZeksjnpvvKRep9Hh0oOUx5G48olL+y82VEpKKFDkOV9iMMOhkHRRSbkXABQIsaX4qHSY01nGg4t4edh4Rw0nGugBIxVyYKLWPUR+1qa1fwAmtw9GJPeRRSCbmyDIByifciFtqY8PBzhQsgwPJTDDFXSbPs2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sQwu1ZgQ; arc=fail smtp.client-ip=40.107.93.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sQwu1ZgQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jn2U/fjGyaS06+ye/s0gpupuPE8GMnm7RRHXkwCxi1rZlg8L+W2TH1LD8o/cA3zKBaTTve2Hg+/Vn+Xq1K7EZBEAHBewF837xdi/nOB9YTIH80nvNoNWUrpoCIF2KUHpIXHkBxXpNoU6QdvAXWv6iH/rJY1QqyGPDP0DQaYdscQxWCyG+IWZJuJCLz+2rxkCPGfoLWr9GuuowwSiEJoEn+Zjpg7jR4i9LyqDM+pWcLpXu4bDx2/lqmAvAjze25VIXwvBB5jMebRX6nS/spUEcAMCGGKGxIiL+LkW8qzBQuLcPhC2rLD4tYs6yc/Gqd4qMHgj4jZAEu8XpjTaxYp8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0Nk2RqC8sMEeOfCwC32v3VEDXXXKNwRzfDQNVKknl8=;
 b=nJu08gcXzI08KPkPwHiMRKHfb9yhXawSGwVslM+ZaKbHm7msIFSimnUxlb0YNsIsnLDbp3NGZoDkzvSdFYZknPVQ4NJp21OVSfnUCdJiBuHIZJVkz+NEO0whASz+uJ97f/glKK+N11RH29BhRRezNXE83o/Vcu9iSDGqJu8vrkrTlEQcadpb9W9JYHKdzweSHkipG3kjju9Tz3xgQCKaDQKGkFbrbVgFaxQDrL5+bwIeJVXr7TVZ87k/+O9UmO2tKcVr2hKh3CwAhCGiPbyRRuSChdY5FKhUj9YF35rYMJ420SJNgwUJKLllB7wr4N7o2FXMhV0HfmrIiT/gLwnz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0Nk2RqC8sMEeOfCwC32v3VEDXXXKNwRzfDQNVKknl8=;
 b=sQwu1ZgQ6yrQ1t4a5uI6JVjut31uJyu/qKYVzv7BPwfdJxYen5zEwKcSFTzfaMnuGgSe0968QsXlnZeRah9K3nfgbsLWy/M8pbLL5XkiXeTcP/d30jBALG35TDTiONOIowj+ImcycvL/yKDJzywiEJWyfMKbBOHjptL680HEVI3PiCmiP1xWKOUOXbxS60HhvznvL0e6EybTdggLYufGKqmCJpZAYq46l3KDd/G8MsxQB9rRY8xPoMyoM49Gf9LGG0AlH3FYb6OGfRF4KrXKAdo/iaaTGiQ3A1W7l9vOYhYvACv0SyySKmAA5AXhySMlIDAhczMnqKi8hL4QqD4z6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Thu, 15 May 2025 01:03:14 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 01:03:14 +0000
Message-ID: <245d7419-2079-42e5-8f73-5ccc1b4e4c96@nvidia.com>
Date: Wed, 14 May 2025 18:03:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 18/30] x86/resctrl: Fix types in
 resctrl_arch_mon_ctx_{alloc,free}() stubs
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-19-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-19-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::15) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 0496d6bb-08e1-439f-73a4-08dd934c44f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEhlTDI1V3o3N0FoMmYyd3lnUGJCYVlObFlkMTBYellUZGczeDlOOElYdS8w?=
 =?utf-8?B?QmhzRUJkbE8yZWZ2OXIwQk55NWptSlJTb1J2MHdLZWVFalpya1gyUWwvaGZP?=
 =?utf-8?B?WG5qSUVNUWtMOUNrTlZ5WWwzcXpreU1WME5rVlF4bldmWW9XTEh0QWFHNGJF?=
 =?utf-8?B?dEt6MmQrNjhpdFVFUHhnRkRPYlFQbWp1eEUzaHB1ZFBhWE1iSWZ3VExMSUNP?=
 =?utf-8?B?dlFkRThwMUN2b2x5WlV0QS9Rak0vQlVRc2VaMk1IK3l5YmlRdW1pQlBmb0Nm?=
 =?utf-8?B?ZUEwc2pOOE0rMllxS3VhRGJKTWlyaVNHV0ZyN2pVVm9kSEdBSXNxbkF0NFhv?=
 =?utf-8?B?RnJkK2x5SEVVTHZsZ0VycXdydlFwRkVtTDQyd0FteGpQL3FRRTZlMlI0Qy9h?=
 =?utf-8?B?U3c4dzBGMFIwNTJYRCtIWTN5dFVqMEt0emc0NHh3WVYyMjdObVZnSVpPaFQ3?=
 =?utf-8?B?RU5ScmFySEFYT0lPYzFlUThlcmFYaVozZTZQZVViRVFuN0RsMU5Td0JxRUJ4?=
 =?utf-8?B?bHhBN2taZ3FTZ0s1eVZremJOSVA2bm11NXNqSUZMK01VTGpaaHRpR2x3VzlE?=
 =?utf-8?B?blNuZ3FRdEJJMlliZkd2NmdNekF0SUdCNWVFeFpHSHFlOG1mL2hxUnVDaGpI?=
 =?utf-8?B?Qm4xa1VnSFZiYVNiRXpzWnZQdkNjTVJXbzVWQVBTZzBwSlNFdy9QUHNXcVFh?=
 =?utf-8?B?N2QvNGx4ZmoyNUJ5S1Z1NGdYMXBhblFGOE1USVFKSmlzTk1kSmEvSFVSOWdD?=
 =?utf-8?B?aVlhd282T2pYc2xYUTMzazlBVTJXNmtsWHZIZVZYTElUckRVUjluaFVwSnR1?=
 =?utf-8?B?cmlWOGlCNFN6TXhhZTNvaHpKZitiMisrVkgrbU1CM0o3L1lEZnByNEZwcGpm?=
 =?utf-8?B?YllDaFcyL1FOTElILzZ2VlNzcXNoYy9Ma0VpaTRxSlBTNlBtK21yVURVRFRm?=
 =?utf-8?B?SUMvb05NYlI2cGY1TS8xekYvdU9scmhsL09zSHpMRGxaRk5kdXR1OUF6TE1m?=
 =?utf-8?B?dHNkVTEveVZxTFErVTgwdDZmU0g5djRHbktYZ0NhRVdmNWRmRmRVdXFnbTRa?=
 =?utf-8?B?cG5Qdm1qazZhWHpGSEZiWjViWXVFYmxtREh0cGNPaVhaM2I4QmFxRjNtaG0v?=
 =?utf-8?B?cXh2M2VzVnE2RjJualRlTmdSZjNWaitrcDhJdzRLM3hCc1crOXI3RGxpRXdV?=
 =?utf-8?B?d2RlMnN6MGwyQ1lyVVE1SEJFQytSUkxOaDNJV0xod2k4Nm9QdFdiUmh2Rm51?=
 =?utf-8?B?UHNEczlQd05iOHF5a1VZdnJKT0tsaThCTGdyUWpRQ1ZsbGo2VDhHT3BpSDhC?=
 =?utf-8?B?UitNQUNTV3JVVU13d2hYdVdpTDBuMW10aEUzQmg1azJxWDdXWm5DdXVjYUc1?=
 =?utf-8?B?SFMxbDVtOTY4VDdmSWlGU3ovWTVlb1lLWnUvaFRaS3J3VlIyalhjb1VyY1Av?=
 =?utf-8?B?M0NUMGIvZ3JrUDNNM3J4THdhK0tqMG94WSs1WXk0Z21iNkVUbHdFUVdjdU8x?=
 =?utf-8?B?T2U5K1NhcU40MG5qR2ZiVGtVWmFUOTFPaExwSTFLanZFUVVIVnVyNW9DbXJG?=
 =?utf-8?B?N0RtZXZLdnNVK0d0YXFieG5UWHNMUkJLT2REd0djMG85N1ZNNXFqZmk0dHdJ?=
 =?utf-8?B?THZXZG9sV2VmT21tOTJheWJOOUVaNTVQZVN6Qk1NOWw1b0VVT0ltWEZNeHJO?=
 =?utf-8?B?bVdJZ2x5clNsVTlEZHQ3MUdoQmNXM0JCdFM2VFBjcm5VM0IvdGdJdXdUazh0?=
 =?utf-8?B?TFBocTJ6SndmTzJRRmo1VEFNNTBmcGYrbnlLcHVaZHpITnkyRU9aazVaTlo2?=
 =?utf-8?B?dWhKblU5UlJNUnMrcVdWZ0ZkaVgyV0drWU1iL2NRTVB1c3JCRXg1RnRCejhq?=
 =?utf-8?B?cFllamdXWGhFdHBVR0prNlZhUmhnTTFyZDl0djJQZlVQYjhxcENpSjhadXBs?=
 =?utf-8?Q?0uG4ZtSe6nA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVROK01MdENaTmpRcTRKaWpuSzNpUWV1T1VCeHRKcFZ4RXVPc3RKcU8raWZ5?=
 =?utf-8?B?R05DK3hoRlpyUzZKanJlZWs4cGlNMnNNQzZNSXMrR040bnIvL2VSM3dydEdK?=
 =?utf-8?B?NER6Ryt5a2lSVXdjTHpiaWEzbnc3a3FzK2hNMlJQakcrNXRORGtISlJsMit5?=
 =?utf-8?B?c2lPMisvRGViTzNSYUlpYzNGb0g4aE50am1UQzN6ZDlES1lwbVVvbEVyM2NN?=
 =?utf-8?B?dlBpNWxnTERlNWhGdmNUWWJqVWtWNWQ0TER1bVRyWG1XNWdPZkdJSGEweDM1?=
 =?utf-8?B?L0c1QUxFbG1COVRydzQyRjcvQ1g1aDFubldPMG5Xb20zbkI4TXpvazdTdzBV?=
 =?utf-8?B?UldkTHhIQTMrbXVVQW9SNXhidnNuUlRIdVVtV3N0Mklpdm9hS2VmQyt4b1Zx?=
 =?utf-8?B?WHR2UkxBUFYzNWJWeFVwZTBIK3FtV0hiY1RmQ3JpWE9rRjFVMlp2RFMxUlNV?=
 =?utf-8?B?dm8yUVhKQ00walRjQk01SjBMcEJKTDRtQjJ0Q0hzclhNaXF4Y1l6djNkYitk?=
 =?utf-8?B?UnlyQWlKbDZGd2pGck5QNWNoKzQreVBhemcyc1R0bFU4WFB6Sjk5bWNsZ2JK?=
 =?utf-8?B?cUJxQzl1OVAwK1FZdk4yN0FvOGRUMG5KM0R2bDZWYXJ1elFLbU95ak1jaEds?=
 =?utf-8?B?YVlOcXowbnBWdklsTHE0WWs2VTZlT0tLZE93S3BkaEVCUXpZYVMyc2Z0ZHNP?=
 =?utf-8?B?TlQzK2YyVzYvbGw1d2s0NkFPckJKZWJISnJkS2RjMUswUDFnY0E0SXZ2T1RL?=
 =?utf-8?B?aFFoRGRJQnN2bkx2b1FjMlp5a1JxWWxWc0dtRmhTWmJCYUg1Q21GRXhaZGlJ?=
 =?utf-8?B?TUoyS3FpN215Qld1Qk41SmNIaW9vUW9BOFBMUHNmeUg5akZhT1RGTGtIRnZP?=
 =?utf-8?B?ZDRnbE9YOHdOWXU5RitVQzBjU1k2Y3lnOGRLSnJHaUJBQWwrZVYvTnZoemQv?=
 =?utf-8?B?STZkSmNCZkJIMXhLL0N0MDMxcjdrYXl5THdwTEF4TDFtL0tyY3I3anVxNnRW?=
 =?utf-8?B?Z29uTEl2QVkveEVZaXpBQVJhYlFNY2hJRXdnMThxWDZ5OWpIQWNOczJwUFla?=
 =?utf-8?B?VlNzT1RvaVlUSHpMMmRXRm1Jd2NuYm9yZ1J3Z0IxSXhJRXAxTm81Um43Vzlx?=
 =?utf-8?B?UkVTTzVxYzZHZ0FnM2ZvMjBpRzU3ZjlUYUZja2dUQU5jaVNXa0JRYWtRbFc0?=
 =?utf-8?B?SGpFbVg3ajFRNit5N3JidXZLWmdKM1Nad2tCVUxBN3N6QnJKdk4rbDVnWU9x?=
 =?utf-8?B?MzVCQU8wQTBpaktrSjIvMEd2Wkl4YjJCdDc1VXd1Tmh3bWdtRjhGVGN1Z3lV?=
 =?utf-8?B?akd2NU9zWjhjMnlZL1YyYUVkUi9zNnd3V3ZPTU9TbHRaOVJ0WW5pUzhRNzda?=
 =?utf-8?B?UG1MbllLeDhYbUd4YlBMQllzMmMrQVNqeWJFNGxOZmYrdzdpMExkeHZSdlFx?=
 =?utf-8?B?OCtZcU8zNWdqa1pvOFZTWXRMcE9IV0ZnQUlwbWVrR0dlSHJrVW01TDJhRU9r?=
 =?utf-8?B?YVhreWI3M2dkWjRBNVZKbUszRUl3UGhwTUF5bC9CNjRyMDFtSjJkMlNnZi9y?=
 =?utf-8?B?UzQ5T01EajdLWGV0OFJ0Mmt6VzBYRzYybGFlNXNqZnAwTWxGeHlLMm5aUUpl?=
 =?utf-8?B?Vzh3NmRWdkNsVVFkWlk1cVc5MWtrWVRmY1MraWczUFp0aVRIQW1QYmNCMTg3?=
 =?utf-8?B?QmlTVVNaRHBYcVhBSXVqTnNZdlcxUkxEM0dQVG9hU0pTVnRadWptVEoxSmp6?=
 =?utf-8?B?QTMrSzdWeFZySlI0Y1lNTDNiODVjemNLd3NTN2RDWFlSMEVIaFZ0Q0dTd29p?=
 =?utf-8?B?ektuOHRPd0xxTTFRWUtPRVk3RkpEOVZ1ZzdHZkpmOWZ2TmFLQ0VvaDBhQTkv?=
 =?utf-8?B?eDkwZlV2OU5tQ2xJODJPeno3NStxbGlwd2JDYm50S0hUK0pUYnRDYTZESWdG?=
 =?utf-8?B?REZIbVUrNzVRR1A4bHllL1pVMTI2Mk15QjdjM214VVZIMjJ6Zlc0WXQ1RVNF?=
 =?utf-8?B?TTFLZFNOSzFvRHNDeHZhUW5UbFRPWnlFZ0FNMjVoNno5MXlrbDZVcHdWOHln?=
 =?utf-8?B?Zy9ZeWcvbmh1V3RTT2dYZHlCZWNudXA5WXM5OGZsL2ttZWNnTFp2SUNBVFpx?=
 =?utf-8?Q?JpXpweAQFMuPE32FrS8fp2g9v?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0496d6bb-08e1-439f-73a4-08dd934c44f4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 01:03:14.1666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jc+wZzDkZ42lHYOQjb7yvhi25lACY/cUPUDvFysAW0zwGNt99rY36J6cnSyuFOjTm5gx3Txwqy7zcq3bonEnhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600


On 5/13/25 10:15, James Morse wrote:
> resctrl_arch_mon_ctx_alloc() and resctrl_arch_mon_ctx_free() take an enum
> resctrl_event_id that is already defined in resctrl_types.h to be
> accessible to asm/resctrl.h.
>
> The x86 stubs take an int. Fix that.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Babu Moger <babu.moger@amd.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

