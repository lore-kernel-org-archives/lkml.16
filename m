Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BAB309A5A;
	Wed,  2 Jul 2025 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751478323; cv=fail; b=oLQ4dnuxrQ9BSHsFIkEeeH3q2DsFCrIFg1QWIzLkApnQrseoZiAG3K5qP2XLzVl539N8xG1RXaSkNaMT4cISM5Ll5F9Yk34OeIJ0GKZdcBQnranVg5MPQFmfw+KMff5NmyVNWptOJXzwX5YrbnPCH/vPt2HD44519mplw8TTACI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751478323; c=relaxed/simple;
	bh=E7m/iYphg9ucyJrOAuMttmaveuqCfSMIQ6QIqIoKVwQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fx0yHFAN2e0bAhSgbJ+ONpYvHBdFZOjLPRMWtGxkh28iY1pLly8tfBWJ2N4Ra6P76wNkEWmeaUt2x+vim5PA4OvavaqMHbQeD7+GHZUwrUcBgUr5IwsoQEwyGlqIR43GmDLQzE2BkdScA6ej//duE2dnehgfv2JGKlNMr9Zz5Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IeI/2xpP; arc=fail smtp.client-ip=40.107.236.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IeI/2xpP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsq48r1XoPMkMxUA/nkjk+i5n1eHLEjFbHEXdqldD5YT1sc/Ukl6nv+ZnoXWCbcwUHmVN1FnWfX7wVU/kSEC+S2np78i9tblTDcSDZhGrQJE1opb+8Go0MbkgJd5Qfkw11r9EOngEOTWPcbwryo6K4JM2oRG8m6bNz+Yh1nVpfsBS9Za99FXnkbOzBSIrQITdwu9NySRY6lGHiBHnFzOitKI9t9J16yogWHw70er4nhcKSTQma/EUgv1McaJ4rTwXnQRw7XPscrJrBZh/QUy3EkdkvE0H7l26p2zmF1ZExPiXQjBGRh2v7JXOJwCj9my/fI4y8q8iXYdqeuo+qkeXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oxfw0YKKA+SBexdJktWcxQAGo7eua28RJtD3QoUwJog=;
 b=wbIUpudLgDgjsRAJI2gKjLN29il52FVIZVryGDol+8BAMeBAP+h3IY5fy7/n6J0yG91/cPTbv52+12lZUBia6ZBGZyOlpNsx+YlembtW0zoEABVGwwCLSTA+eGGgQkOnGVtHoXqWLGxpCrfR73o8nDyb7CjyG4jbmOHr74ezpTVKm5C12omEdpDyuJFAqZxJ/UoxZLAu9z0ezNrh3fB8KFnVfIZxB2BAdKmV2X6lF84Qs94xEg1kFb7hdW9/UvIQxCCUHuFplTOwHTCtke6k5055NoWSYjtyFjB+a3Mq8h0wCn5nloZsclaJtnEJDMzgSa9sFCwMRKTLME61glfVsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oxfw0YKKA+SBexdJktWcxQAGo7eua28RJtD3QoUwJog=;
 b=IeI/2xpP5r53MebR0YvxzFwIXYDYx019J+4cy1OWu3FZ2PdMsbC0CZTTlSW8Pi0UwzYW4rvrdxTX6cJZZgQ6Bb2YhvpZbPZ692ZpOkbT+O3OaLxcMp5IjRHv3YmXbBnafdoI9h2OdI1RE9QCVA1dJcpV2CIcenQvPtC509eJXMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by DS0PR12MB7780.namprd12.prod.outlook.com (2603:10b6:8:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 17:45:18 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f%3]) with mapi id 15.20.8880.034; Wed, 2 Jul 2025
 17:45:17 +0000
Message-ID: <55f5a446-faec-47a0-ac9d-a20ce128648d@amd.com>
Date: Wed, 2 Jul 2025 12:45:15 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 32/32] x86/resctrl: Configure mbm_event mode if
 supported
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
 <d0924000e0de931f414c7cc1697919f6d3beeff9.1749848715.git.babu.moger@amd.com>
 <367717a1-97e4-48ff-81dc-d6db90129016@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <367717a1-97e4-48ff-81dc-d6db90129016@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0022.prod.exchangelabs.com (2603:10b6:805:b6::35)
 To SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|DS0PR12MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa7e90f-db79-401b-b0aa-08ddb9903514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXdQUFVQcGxJcUtHWXVzcDRsTitNcHNjQW9qeDlDd0lFWGx3UHBEUFRicXBJ?=
 =?utf-8?B?QmpiSU5vaGhHRk1KSFl3ZkVMYlhFTHVURXpKNFZMb3RBbmNqbU9aWDh1Qys1?=
 =?utf-8?B?dWxLZktJYzgydWRQa3BFUWlZbHdsWDgwWStLcnZyMHUzMllzNWUyR2tOZ3Bm?=
 =?utf-8?B?ZTR3U21ZVVBPKzlEdGJSYi9MZ213RVRqbTg5TXUvcjZxcmVaZmlXTTBKbWp0?=
 =?utf-8?B?dzdlYkZKZi9PRm9ybDBWRHNZRU4ycGRFcE5QUmdmcndiQkJFaXU3ZU5tTC8w?=
 =?utf-8?B?M2J5bXpXU3NNTjJVUzRGS0lqZytZUy9zOFRyczhhRU5jTURqNXdHeCtRb0s5?=
 =?utf-8?B?ci9lRFMzTlYvOTJJTFIrbFNkWm0vaDZJc3pvYTJjUnY2enFYVGNKZkdTMVhE?=
 =?utf-8?B?ZGx5cnFPeW94bmYyek13Y09RWm1UV0dCM25CT1Y5Q0JMSWk1WXFkMnlSOFpO?=
 =?utf-8?B?bnB1dS82aUszTUhySWpUK05wWVNsZGhXTkdWaWkzZlhoRWdQb1ZmbW11ZHpY?=
 =?utf-8?B?N3pBQnIzY0svNjhDWDQxYm51T1FkQ0Vhd082MDlLb2VrbUlMTkR2S2d1dUlq?=
 =?utf-8?B?WjE1UjBmL1J0OWwrYnYyaXBBc0VOd2w5V2pQWEJCTVYxUk1zcVdteE9SYjFy?=
 =?utf-8?B?Q1p2VktMNmxxUzNGZGRyVGFTWU4vcklVOWtnT0x3WnVHbXlvRFVwT0pmVU90?=
 =?utf-8?B?OVpGb2pZYWkweXBFdVg1R2kxaFRxeHhBNTdDNXYrbURtYXlMYkpTODZjdW15?=
 =?utf-8?B?czNySXlWY3JLczJsWGgyOStyc0JDa2l2Sm8yUFNpWWhtYXBXdjZaTG9qQjdY?=
 =?utf-8?B?TUlJYW92S1BZNWxKM1l5NTZjNnlvbVZwY21LdFdxNHVXT2czOWFQRzFRYTIx?=
 =?utf-8?B?Z1Q5MEp3WVBlNzg2dHkya3VQaWtvRFE3SlZleFJHRDBqWjhLYVFDMTFYTDV6?=
 =?utf-8?B?NFR3WUlIOGFRNVA1eEpLMFdnc292NWx6NEx3eVoxNW9jTlBCOGlOS1NlUStp?=
 =?utf-8?B?OXlMeUV1VkVBSitoOVQyQkpyVlJlSnlGRlpMWTFENy9DcHN3a1N2WWhFZlU2?=
 =?utf-8?B?bWtHYlVTcUE0aHUvWmRKR29sNXJ6dG42clZ6Qll3OHBvTFlHdm8zRjNqTWhp?=
 =?utf-8?B?My9yRTRleDQ1cmQ1bWJENnNhUXhTUmY5cjdZUmpzeE9XWUxNWFBoWTJJUzhB?=
 =?utf-8?B?b0lTZE5YVmlMOUp3ck1CNlk1NGxPM1R1NjhTcnpONWtFaUVGNDdlaWk4SFI5?=
 =?utf-8?B?Wk1TYTdYV2Q0c01zVHVrdjEwRU9OclpTcDUwcWdROU13enBqdXZ4dUJTV2lJ?=
 =?utf-8?B?bWpGQ1ZhdFZnNzVEYmdxWHFBQlROQkI5UUtzUHpoQkFlSGNYQmNPUDJDQnRE?=
 =?utf-8?B?Y0pFT2ZZSFo2Mndta3JkdWwycU5tTE02eC9RZi80YUtjUjdoNEE0TDFDYmwz?=
 =?utf-8?B?RERUQ0VMOXViNUM2WWJSVGNXTXBtbjhZZzdLYkwwbDZrc3N4L0FwQUdVcE9a?=
 =?utf-8?B?RmpEOVhDc1lnUlVuc1ExUGc1Q0NrUzRVUkl4OUNiU2kwV25qZUVZTnJoY0lH?=
 =?utf-8?B?YnVTNE5rcnMzbjBtSStZY2MvSEJXZ1Y5dEEvdFV3YjlVUlBLYm96NEJUNk5E?=
 =?utf-8?B?L3ZsZDJHdGVBRTcvdHhIRDJ5bys0dnQ2MVBsQ1Z2b3FlNWk1bFdLR2VVUlVa?=
 =?utf-8?B?c0k5Ry90bzNhUGd5a2tKVjB1cGczc1ZLeDNRQVRPV24yVlJzdnB4QnF1cmR5?=
 =?utf-8?B?enBRMFZGaHFCdG1kaTd1bW1uS3ZLcnBSUUt3enE2K1hDUUgrUHFiREF0UlRZ?=
 =?utf-8?B?eTF2M1dnVmZqYWh5TnJxVmhCNGIyTy9hc3gwcXFrN0RYb0c3OWFGZy8ySjUy?=
 =?utf-8?B?SU5lNVMxTFlHMjZZODB6cUZmQUYxeDUrMHZtUXRiS1FCOEU5RVpmU2sxeVVZ?=
 =?utf-8?Q?BssKK0/Pt9k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTJNYUVwU1NtVVhvNFppMXgrbHVCUmxIMkZxNExWMGk4WUVRcDQzOFJPUkZl?=
 =?utf-8?B?QVlsZzJ3VUF1dlZIT05mSFlQYVloSE5PMWQ0ZHZQOThWS1BPaGlUNS91VjNH?=
 =?utf-8?B?OWFlN3JKWTdrK0JhU1hNTkRNYlNJZDkxbzY5UENZdzUvOUtQWnYxMnNRd1Mx?=
 =?utf-8?B?SmtvVWNWaHpGdXgxS09RQ044MlBWZ2V1Z1VXa2lLUDV2VHZtZ2pVdDJLMDgr?=
 =?utf-8?B?ajBhOTdicldUYjI0MVcvTTY1NjVtM0lMSS9RTEVZamdEakI5WGZlcVN3ZUFG?=
 =?utf-8?B?OWxUVHk4Y2pVSDRjQnkxaGREeXZQWEY4Znh1OEdQT05XUWJCc25qZThTazg4?=
 =?utf-8?B?UHR0ejgwQXhzUVZZdThxcFhIejNHQnBMbVVSV0M2M1M4bUJMcGtTVXVOUlhr?=
 =?utf-8?B?SWZKeDE5NmZkcHlUd2RWMjFOOWhGNlZBR2FjZDBnU2Y5cXpQNmV1Um13SEZH?=
 =?utf-8?B?VVFKbUFSZzVnclhtRysxZnh0VjZQaVVOWElkbm92cjlVWVRhdjN0Zjlmd0lJ?=
 =?utf-8?B?SVRXbitrOHA5Zzd1L2hCOUpZT0ltY25YamI1RUN1M2lxQjkxdlVOb2V4bVB3?=
 =?utf-8?B?cFk0dlFlYndmZUVRYWZHbW90U29tak5JaFdQV2QzbGhLaWFreVI3YWlFOXo0?=
 =?utf-8?B?RUZ6UkVGd0JSb3N2Vk0ycG1tS0wzZkNVbGRpSmtNY2FiUFZjdTRCRHVpTVBm?=
 =?utf-8?B?cXlUeXR0ZUltMmlLNm9TYTQ3VUhFZkkzdXVFZWJ2RFplMERRTFVIYTNPZDlL?=
 =?utf-8?B?a3dpbGxSVEVsZHFaTWJKZ0RSVUIrN25meXo1QWZVSGMxbXNBdTZJZ0NnYTAx?=
 =?utf-8?B?MzRFcndQa2hIL05TT040cmlLRng2elczcHJkN2lRNTJWZWRvY29mVVZJVlZy?=
 =?utf-8?B?N0MvVW5BTmlmVEhUVjFrcmNnYTB2dmU3Q3EwdUlBdnhGUDFycEJpOW13ZE81?=
 =?utf-8?B?eU1KWW1kbWNrSXBqNU8reUhZdEZ4SnduTDcrK0NoMlJpMkI4VXNEcFN0TmxG?=
 =?utf-8?B?cDNkaUNYRk9yZTlzajQ4bGIyR2YwTEZFUno0SWJ1VmlhMHZOTHplOWpRSVY5?=
 =?utf-8?B?akswUitYSUlMT0E2NmkvT25VOFBlN2NwNVU1N2RUa0I2VE5CQTRIWGczMGxZ?=
 =?utf-8?B?VjQvTms1ZTR6ZUdONkhxM3ZRazY4dlBEa3JGaWdmTFZSUDA0cjRQNHJrYXYv?=
 =?utf-8?B?MEpGK24xZlpsNzBCdFhnbmtWWHI5T2kvYjJiTU5yS1BLS3kra3hQRmZlMFhs?=
 =?utf-8?B?STZMaFZCVFBqdEREYzdqYmZpYkFBdlJzWHpEcHRzNmJzNFpkSnMyUFUrbmdI?=
 =?utf-8?B?ZzRoRkdORWVuV3VkL1V3eEJNaTZTYWkxMVV6NEd2VVQxQVp5QlZ3VjBlZU4v?=
 =?utf-8?B?MVcrZ1h4MkprNWhqd1hxaCt2SnkxT3NwSTM2OHRYcWNxL2NXNUhFZHZKY1JQ?=
 =?utf-8?B?clpzRzFBYlM3Sk81Yk42U1Ywbm42YXFxbXlScUx1cXFjZlg4TzJ6R2piN0pY?=
 =?utf-8?B?QW5yVlNyR2Z0Unp4ajM0QTU3UFhLQXdpTFZXS29Xb3R3bml6TWhtZE01dUk4?=
 =?utf-8?B?UktUc3IxWm12Rk1sVk5kdHNUOGJUNTZNR2xpc0VtckFxZmdRTXE1R1JJdUJi?=
 =?utf-8?B?ZUFKUjZLdTNMQ3RqV29NT2NPWGVPakNYbkllQnNBcHBvN3dta3RDbitWS1BC?=
 =?utf-8?B?dG1Canc2aVVoOTFBa1c5Y2dZSTkwVDJ6Qi9kYlJCdThRWEVqWUtjZGlYSXZn?=
 =?utf-8?B?U3ZOWHpxV1d6RDQ4QzNoeWtrSHBXSExTc3VYOE9QeUdVeFl6dk51NWRkYWlY?=
 =?utf-8?B?aVdCMGx3U0d5RU11Y0htQTJNempIN05zOVJvcENCR1JBeHJRRG1rVjJnNTFv?=
 =?utf-8?B?Si9yK2VoWVkwL000Nm5FNHZRQklHeENkazVlczRwNkljS0lRNXhSYy9uWnN3?=
 =?utf-8?B?YjhKQ21DN0NPRnIzMy8vWFp5b1ZVQVo5REhDYzNpUmZIMm82dWpzZ1dhR21r?=
 =?utf-8?B?ODVxempFNkR2VWppSVhWMGt3VTJCQ3FIMVNFWW1BZys5NEpSYzJ5ekI5WHlU?=
 =?utf-8?B?bStLakwyWUpIVDlONWp4a0tnM1FuTTF3WFUvNlA2b1FnT2NaTmVkQ1BDNW5l?=
 =?utf-8?Q?0eZU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa7e90f-db79-401b-b0aa-08ddb9903514
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 17:45:17.5184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxE2aPInftOuWEAXs/zIlAKpyiZL7u2KChHWCBv6+YGEZ5FhPFLHnizo/HRJyeCn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7780

Hi Reinette,

On 6/25/25 18:40, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
> 
>> @@ -537,6 +540,10 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
>>  	d->ci_id = ci->id;
>>  	cpumask_set_cpu(cpu, &d->hdr.cpu_mask);
>>  
>> +	/* Update the mbm_mbm_assign state for the CPU if supported */
> 
> "mbm_mbm_assign" -> "mbm_assign_mode"?
> 
Sure.

-- 
Thanks
Babu Moger
