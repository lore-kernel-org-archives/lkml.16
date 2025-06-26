Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C452F1FF9;
	Thu, 26 Jun 2025 16:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750956457; cv=fail; b=nPG9FtXw91ppsRjEc8PSvXoJeGbEdHTge57gI/KQljKdNkeksb7apzAkrrmwlyqD7kZEycUVG3AWs8frvdrk+wh+/ewaZT4rbAN5a79uHE3/e+3xOah+d1TcChbQECxz0Vfs5eRDFHFsWqN5GnZxXvpM32OtAdLsp/AVv3Bf2L0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750956457; c=relaxed/simple;
	bh=B857qy+BHCYciOzU9hXjxrmH7XUdAbMow8HdBrGiCt0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ryIdKDTY6g9KHP78WDUGauxZjT4A9QUgn/Ad7BfSVXdpwrs10Ah4fjvAJX550oBl5ajlWasZE7OP7xME0JGMD/bJqaW3EfJoodve63ZFLJZhaNZe1YZZJ14OniFkfewPyxNsCThtNRGYkpXBzlIYBJ9Wm4tr6iL6wx1BgyX8kzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PXi4om9c; arc=fail smtp.client-ip=40.107.94.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PXi4om9c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mR+6cuUgY9Nwcc+klh5bv4ik85C1lBZeQEh4UnvvblaAmvWSwr8gWhNvLYUG0kQ+yhyiG7rE6IUePr9FMkgxr4H4rktnvGx74AHhcSXsP3B0POtWfZws/Co3VnEVttwfOVUvCEF6e5avcRDA+Qv+pP7jER2X+OLjw5vM8v21Cfy/tKI2mDKmHQp8bkRdMjeqzfzltATYU3ZL5lQ5Fm1khI9pEqTi9mpRqcd4CZOXk4P8FZVeQMA7xOBAaokLMrgiZUfFNHxV6kjlgKVItwgyVXS6QCR67zWbzOcNfiXXzNEMmo99qiVsYOgG7DXgrS90R59HfNCQBfQtOQ3dhD3FUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIqvEFD9FsktMivx9afQipw1HxlMmMOAeEn2uzRDvCk=;
 b=e1A7SG+1QwPNkNvrUqi4zT+S8oLjDhJCx85xjZk9Ju6qLZlCLHvrXDxmLqceMSdOvcOgylZqIj3GebQsABc66EawIXsxwLhbqV4W+4DHB3e0rdF0Q/rP1Gopt6k7q/v5SrQ8SgTjRuZ13Z6V+ZToOduKFirHjgSSBHmzQPSAnycVFJambnPpfZsy1nXXV9mEyrX1/1tl9AiNwyrAKDjdbUZYW2d3COU2GxMT1ieoLri/XnIvt33/mN8XCgcxTtMUNxs2dAnpQya3809A4tABzy0Uho5Pw7pg6b4w4VP0N3ssm4mNmCLMuLPoK61MeLd+2g/9EkhnXXxQK8QYvMLs+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIqvEFD9FsktMivx9afQipw1HxlMmMOAeEn2uzRDvCk=;
 b=PXi4om9cEPNewfMR96ACq1nevYU9i2ZMKJU/6jXwASyTAcxeYwVUnN6P3+rceSephixFzbCsmb11C56KU4x0qqKtV8Q+j9GY1qQw/E9k3HVxgSPeTd+8wTK5i9x6CTGE37e8izx0YwmElEnbXUF5MSDchNO48CTQYbhQHs5stSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY1PR12MB9699.namprd12.prod.outlook.com (2603:10b6:930:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 26 Jun
 2025 16:47:33 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 16:47:33 +0000
Message-ID: <97a2718c-9088-4762-84cb-06299bc33d3a@amd.com>
Date: Thu, 26 Jun 2025 11:47:28 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 16/32] x86,fs/resctrl: Introduce event configuration
 field in struct mon_evt
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
 <1b9d6c39f654c2a4fe500d7e9be4a13221ac4910.1749848715.git.babu.moger@amd.com>
 <14b723c8-5d8e-45d4-9c25-ea1d8c6e69a4@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <14b723c8-5d8e-45d4-9c25-ea1d8c6e69a4@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0028.namprd11.prod.outlook.com
 (2603:10b6:806:d3::33) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY1PR12MB9699:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f68ce1-b816-42e9-33dc-08ddb4d12558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0FlZWxSSXVsVU0rNTdTWE1UeU1VY3VyY3JSVnZvSENxOXp1ckxXVExBWWpO?=
 =?utf-8?B?ZmF1RzFudHc1OU5HUzhPd0RURFVKc0h6U2VFTFNqaExBdFVRQ0xwYnBjdzl4?=
 =?utf-8?B?Y3JSbVAzenZsLzBHeVBpaXNCRkcrSXIrTWxJdnE5Vi9uRlltRTRYVFZROUlQ?=
 =?utf-8?B?ZThtNUI4VVFRRHhSYzN3cmYwc3FxV0dEMzQyR2pJZlppc0hIUWJRckd6b09h?=
 =?utf-8?B?eDc5Mi9vdkxCK0pvRGtYRU1RVlh4ZjdjQ2EwUkEwNm1paTdxeVNGQUNiU1NZ?=
 =?utf-8?B?UUlUbDhab1E3c04xQjN6eE1SM3lBUFJ3L3RkaDhKTWlzSnpUSkJwWFk1U3VB?=
 =?utf-8?B?dFZzdXl6Wk5Tb3FOS3NJNEt5VTRQQzBzc3ZuTFdKekVTRi9CNER3OHkzM2tS?=
 =?utf-8?B?eGRDOGh4Tjl2NWtvWHJkUnF4dUJnaXkvbzRjWDVIYWxlMm03MFhpck5WVHpm?=
 =?utf-8?B?Q0Uzeko0V25qUlV3KzFRZUNOS2dFVnh0VkFaODVSQkhFbk5sWjN0SWhRUXNv?=
 =?utf-8?B?dHoyNUFZenpGU1dBOG0xeTVBTFIzckgvcEY0QkFob0FFUGxHek4yRFpYQ1dn?=
 =?utf-8?B?OUM2MlFVeGlvcjBMYzB2MjhTbXh0R2dDeXVEanlTMHNualdiTnR6elRkUEV1?=
 =?utf-8?B?MHFJQ3lGdENuUk9ZS2NveEtGQ3Vjd09RT0tXa240b3V6ZERSWHY2MmJoeWtK?=
 =?utf-8?B?cFJweU02cU8xZjYwYkswVWhWb1pWMFVyZ3hXbE9rTm9PQmxnSjJsbmdGdzZs?=
 =?utf-8?B?Qk01YW9hMlpMN0taaWxRRVFBZ3VoVU1WcFpZRS9wQUtJczFFNGsxbHc2cVVM?=
 =?utf-8?B?SThtb3dzd0tCNVdhUWltM09VWmw3dlpXUWIyOVZscTUwcmNKOStxdFNDeVNP?=
 =?utf-8?B?UXVwd1VzbUlqL01BYWZxUk1GbG1xZmZKa0s5Q0FibDBNYXBHelRSejFvcHFu?=
 =?utf-8?B?SU5xVDB3azNCajIxaE9CS2Ntd2FzNlduU2d5ZldaWUt2S0FvVVVmOGw5L1dk?=
 =?utf-8?B?WlVCakNlR25MZjZUeUgvTHZ6VE05NXpHaG4za29RMGZhbnkyMEtCL3M3UHho?=
 =?utf-8?B?Q2d0RHBucTZlZUJuaDZkRjcvSTZiWW5iRTZFVkk2d29VcThqTlM1bVpRYlgx?=
 =?utf-8?B?RnlEd3ltRmhxcjRIMmlIUk8za3pHa2JHNkwxTytqWnVNbG01dmQxVFV6cVJD?=
 =?utf-8?B?d0ZqOG1JR0M4OEZGZ3VjcysyNjR6WnVxL3luTVR2Rk1FbWNJc1h6VHhyejRs?=
 =?utf-8?B?WnRwT2d5c09QaFgxUkhUUzgybHVXVmZacVlpeTUzanVOVXRXTk9Kak8xWlE4?=
 =?utf-8?B?bjY3VXpwcVhSRGVVVEl1aHBOVGJiSDdEVytReWtsU2FPV0dyVEgzbVRxUkE3?=
 =?utf-8?B?SGhMWGVBTmlZVk5TRmZtZFBRQ1ZqdHZOcXArVy93dCtIVnpRaG5aTHE0QlA3?=
 =?utf-8?B?cE5nK2JYSWNJcU5Vd0JHTENqcW9DVDZaV2JHbzFOK0RyMFV3TzBxK0QvcitL?=
 =?utf-8?B?NXYvY0JjS1JRbzd1NHUydTFBa2kwNUlXUkRhQ0liM1BhOE40QU1ycGlxREsr?=
 =?utf-8?B?RlRwOFFYdThHb3k4Q0Jnank5U3diclZnT0pQbXluRUJ3WWluTjhScmlLSkMz?=
 =?utf-8?B?UFAySHpWZ2FSZXZPc1NielMzem1vZDRsWUJ0b0tTeTNmVU1mN0o1aExzZzJG?=
 =?utf-8?B?Z2prRktPZUlJSHBpZWlSaGNWbjd6M2dENEJrL3c3RllhNi9tQkg0K1FRdDQv?=
 =?utf-8?B?OHBEN3Z1NjdqWVhWOFNveDUyVzJiUTZpUHhFOTR4VnlEZnVIU1dFNlpaQ0Z6?=
 =?utf-8?B?MmVyNDY3c0hIL3R1R05XTDRXMnVQMmh4UkpyUUJoMHZ5aW1sb1dqS3ROTmZi?=
 =?utf-8?B?d2l2bENRK01EWWdya1dLYzJQcFJ1OWhuMDNzOXdrU0hTaVMwNFRSQytKeUtG?=
 =?utf-8?Q?3fGreSB/xvM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDU5RW9aY3F1UC95aHh6c25wcnJTc2xadU53d05MMit5WjlIdDg3WFpsNjVo?=
 =?utf-8?B?dmVna0d2TllIS045WStjZnFnVzFPaXpjam9qN2VOZE4vZmt5SzQzQ0x2NGZm?=
 =?utf-8?B?STdVRFFQUTQ5ZGFQZ1VNUWxRQzVTK0NaY0dTbXZHMnduOGcyd24wc2hRMmNs?=
 =?utf-8?B?QnJTZzl6VE5RbFNYRndINlZqdHB2UTV6RHE1cW5IeHN4emlkV0g5RzBNQis1?=
 =?utf-8?B?UHdoZHNTdDlDc1NzdzdraWgwVERRdVAxTC9Fb281SFJ3K1VWNnR0R2NGZHZH?=
 =?utf-8?B?VUdYSUQxL2RQR1ZpQUhjRllCMXYyYnNUdnNjTUJuck5GQlB0Z3dxMkJhbDU0?=
 =?utf-8?B?ek83a1MrbERMWGpzYmFpSEtPMkErUEhnOGZEcm1SZEx5T2QvWHNVQmd2dXVG?=
 =?utf-8?B?VGlURG1kTG1ZeUgzMHpVVjM0UmxxUVpld1Z6NGtLbU1wSzYrb093OXRUdjFF?=
 =?utf-8?B?M3lJcmtUdUxLWXBJaDlwMmh3d2JKYzdwVW5peWx0MTVGQWc3K1QwbDNmWXVa?=
 =?utf-8?B?cThSUFVKeHFqMFgvaFZYczkyMk0va2R0cG11T3VMZGhsMnozdzBOblVybGpB?=
 =?utf-8?B?N21iL0NxQUpCa3k3MWlXU3B3ckIxenJ6UVVENjNybjBGZC9OcmJJUDNTRmNr?=
 =?utf-8?B?RHFxTVdOdmI5blpXVGQwNXRwRDB1Y2dDdVZiQXlkS0tZVVhuUWRNMkdHSmRK?=
 =?utf-8?B?enUwODVoQXZsd0ZoRThBZXpCS3VwU0F1ZUVrdHRuSDFEM3d0aEtOdDhSTE5M?=
 =?utf-8?B?R0VyNEMrSGs3OUV3ZG5pR0NXVDdSK1ptTnVsZm9LbitPS2NWTXNzSFA1ZEZa?=
 =?utf-8?B?K28xZjNYL2JualpkUjhPNjZvYmNmQ09RNHB3MFNqRFRvT1VrSVMzMVJudzQr?=
 =?utf-8?B?N0FJenRPMldTVVh5V0UvY09rMEtYOXBVZjUxNmJhSG1SV1pqS3UwRklNYWhv?=
 =?utf-8?B?YnhueFVXdnR5a3h3eVhZc3ZIaE9EWTB4TDJFb3p3OFlqNUZ3OE1WSHlOdjdO?=
 =?utf-8?B?WWxZc1VDbzFaMWZKSGlFaXFUUnpVdzkyOTlwVnFnaWhIVzVkcFUzWWhEQjYw?=
 =?utf-8?B?VGhnTlZ5alhFWXpsYTk5bFpaTE5YVk44WkpqMHpESzJnQXV1ZUVscjRCZ0hm?=
 =?utf-8?B?TGozL1hzUXpEVzhJblp6UzF1c0Y0T1l0R3ArbC8yMVlxSFRJS3ZLLzVRR3dB?=
 =?utf-8?B?Z2cyVTZQUjY5aUppSzdyZWtvTW5WR1dSOTEyLzJNek9VdzZZQ1lQSStXdFow?=
 =?utf-8?B?TkJMS1pHM1dDa0tFQ0lZejZ6VUxKQ2lSWjRiTmY5Y3pFTDNxdkNFTUZyRFRH?=
 =?utf-8?B?T0tIT3BOUVUyMGNQWUtramZMTE9uWWNXVVd1ZXlNZzZqTThLSjAzbHAwSXM4?=
 =?utf-8?B?bFZZL3ZVMmtQLyt5Q3BpYmYxSHlVMzVRWnMwTzRVN21hcE1RM0VkUVo2Y1M5?=
 =?utf-8?B?dk0wdG9VNmF2SFpqQld0cElUalNkaXdMdXJPbGtkSzdUMHY2VFJONGgwSkJE?=
 =?utf-8?B?MGtuTjhmN0p4MW0zOENENnkwV3UydHBqVFo1L2swYU16cGVsdEJoUXI1WUpw?=
 =?utf-8?B?YkdLUW43aHU0d3p1NmorR2Q5c0VZSmJ6alZLazNMeDBZRWdUNFg1MjBEOS93?=
 =?utf-8?B?WTg1aHJPZHlkL3FZWk9xSy90OVdKalhzRUhqWUt5RnhacUlxZmEzU2RodHIr?=
 =?utf-8?B?djdwRHdYTkFIb3JuOG9MajlYUEtmNk1uYkxNdmxFZE5QMVZtY3VGcHFnK3Nr?=
 =?utf-8?B?QWRPVjNML21PcEE5ZUgzT1N3Z2ZJejBVRWlYQ0NQVTQzUk55SzZZWkVlQmdW?=
 =?utf-8?B?OEpWZWJHS2VqWDRtZ2VPRTRRWXVLTVJRTHdER1R1QlVqMVFFY1lJNVJlYUFp?=
 =?utf-8?B?ejY4Z3FOeHFYRk9ZVlloUzE3WFpadFFBcDdzbjdKZlBtREdJSFRHSkl3bzc0?=
 =?utf-8?B?dzRiYkNMWU9QdXBta05zZzNWRjE2ZU8rVW1pSHh3dWYrT1NqajdCd203STl3?=
 =?utf-8?B?bW11SXFhcHkxeW1oUW1kdEY5ZmpzOGgwT2hFQWJwNW9KSzhzVUlqV2xJdjdY?=
 =?utf-8?B?cUdXcG83UFFpNFV2c01rWVhBSkkzR3Z0eVNKWkg0UWlGazhmSEF1d0s1TWtN?=
 =?utf-8?Q?xOGg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f68ce1-b816-42e9-33dc-08ddb4d12558
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 16:47:32.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUKD4I9G+ne7wKKtFbHmBZ88a5/TUiMhI65SLppyccWvR8UJmIvXSLuM9VwMu4pr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9699

Hi Reinette,

On 6/24/25 18:51, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> When supported, mbm_assign_mode allows the user to configure events to
>> track specific types of memory transactions.
> 
> Since there is also a "default" mbm_assign_mode this should be made specific
> to mbm_event.
> 
Changed to
"When supported, mbm_event mode allows the user to configure events to
track specific types of memory transactions."


>>
>> Introduce the evt_cfg field in struct mon_evt to define the type of memory
>> transactions tracked by a monitoring event. Also add helper functions to
>> get and set the evt_cfg value.
> 
> hmmm ... this does not sound right (more below)
> 

Removed the resctrl_set_mon_evt_cfg().

Changed to
"Introduce the evt_cfg field in struct mon_evt to define the type of
memory transactions tracked by a monitoring event. Also add a helper
function to get the evt_cfg value."

>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v14: This is updated patch from previous patch.
>>      https://lore.kernel.org/lkml/95b7f4e9d72773e8fda327fc80b429646efc3a8a.1747349530.git.babu.moger@amd.com/
>>      Removed mbm_mode as it is not required anymore.
>>      Added resctrl_get_mon_evt_cfg() and resctrl_set_mon_evt_cfg().
>>
>> v13: New patch to handle different event configuration types with
>>      mbm_cntr_assign mode.
>> ---
>>  arch/x86/kernel/cpu/resctrl/core.c |  4 ++++
>>  fs/resctrl/internal.h              |  4 ++++
>>  fs/resctrl/monitor.c               | 10 ++++++++++
>>  include/linux/resctrl.h            |  3 +++
>>  4 files changed, 21 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index 01b210febc7d..1df171d04bea 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -875,10 +875,14 @@ static __init bool get_rdt_mon_resources(void)
>>  	}
>>  	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
>>  		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
>> +		resctrl_set_mon_evt_cfg(QOS_L3_MBM_TOTAL_EVENT_ID, MAX_EVT_CONFIG_BITS);
>>  		ret = true;
>>  	}
>>  	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
>>  		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
>> +		resctrl_set_mon_evt_cfg(QOS_L3_MBM_LOCAL_EVENT_ID,
>> +					READS_TO_LOCAL_MEM | READS_TO_LOCAL_S_MEM |
>> +					NON_TEMP_WRITE_TO_LOCAL_MEM);
>>  		ret = true;
>>  	}
> 
> The architecture should have no business setting the event configuration. This should
> all be managed via resctrl fs, no? I think the resctrl_set_mon_evt_cfg() helper should
> be dropped. The above initialization can be done as part of mon_event_all[] initialization
> within resctrl.
> 
Moved it to resctrl_mon_resource_init().


@@ -926,7 +931,12 @@ int resctrl_mon_resource_init(void)

        if (r->mon.mbm_cntr_assignable) {
                resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
+               mon_event_all[QOS_L3_MBM_TOTAL_EVENT_ID].evt_cfg =
MAX_EVT_CONFIG_BITS;
+
                resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
+               mon_event_all[QOS_L3_MBM_LOCAL_EVENT_ID].evt_cfg =
READS_TO_LOCAL_MEM |
+
READS_TO_LOCAL_S_MEM |
+
NON_TEMP_WRITE_TO_LOCAL_MEM;
                resctrl_file_fflags_init("num_mbm_cntrs",
                                         RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
                resctrl_file_fflags_init("available_mbm_cntrs",


>>  
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 20e2c45cea64..71059c2cda16 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -56,6 +56,9 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
>>   * @evtid:		event id
>>   * @rid:		index of the resource for this event
>>   * @name:		name of the event
>> + * @@evt_cfg:		Event configuration value that represents the
> 
> Extra @ in "@@evt_cfg"

Sure.

> 
>> + *			memory transactions (e.g., READS_TO_LOCAL_MEM,
>> + *			READS_TO_REMOTE_MEM) being tracked by @evtid.
> 
> Can append "Only valid if @evtid is an MBM event."

Sure.

> 
>>   * @configurable:	true if the event is configurable
>>   * @enabled:		true if the event is enabled
>>   */
>> @@ -63,6 +66,7 @@ struct mon_evt {
>>  	enum resctrl_event_id	evtid;
>>  	enum resctrl_res_level	rid;
>>  	char			*name;
>> +	u32			evt_cfg;
>>  	bool			configurable;
>>  	bool			enabled;
>>  };
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 2893da994f3c..3e1a8239b0d3 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -884,6 +884,16 @@ bool resctrl_is_mon_event_enabled(enum resctrl_event_id eventid)
>>  	       mon_event_all[eventid].enabled;
>>  }
>>  
>> +u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id evtid)
>> +{
>> +	return mon_event_all[evtid].evt_cfg;
>> +}
>> +
>> +void resctrl_set_mon_evt_cfg(enum resctrl_event_id evtid, u32 evt_cfg)
>> +{
>> +	mon_event_all[evtid].evt_cfg = evt_cfg;
>> +}
>> +
>>  /**
>>   * resctrl_mon_resource_init() - Initialise global monitoring structures.
>>   *
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 468a4ebabc64..a58dd40b7246 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -413,6 +413,9 @@ static inline bool resctrl_is_mbm_event(enum resctrl_event_id eventid)
>>  		eventid <= QOS_L3_MBM_LOCAL_EVENT_ID);
>>  }
>>  
>> +u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id eventid);
>> +void resctrl_set_mon_evt_cfg(enum resctrl_event_id eventid, u32 evt_cfg);
> 
> I think resctrl_set_mon_evt_cfg() should be dropped. Any changes to mon_evt:evt_cfg
> should be via resctrl, either via initialization (all archs should use same default)
> or when user writes to the event configuration's file.

Sure.

> 
>> +
>>  #define for_each_mbm_event_id(eventid)				\
>>  	for (eventid = QOS_L3_MBM_TOTAL_EVENT_ID;		\
>>  	     eventid <= QOS_L3_MBM_LOCAL_EVENT_ID; eventid++)
> 
> sidenote: This change looks to be a good foundation to bring back the BMEC optimization
> you worked on earlier where it is no longer needed to read event configuration from
> hardware.
> 

Yes. Sure. Will work on it later.

-- 
Thanks
Babu Moger
