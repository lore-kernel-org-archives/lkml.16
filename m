Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E29B148832;
	Tue, 15 Apr 2025 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749602; cv=fail; b=axB6UFiUxLm6rKtuY7gUENv2soAaNBfmGjb5bRatuJVhTJ1FpkDDnaKjPaPnEkCZXjUhu37HOOEbGeij0tD+Sj6SxCxwy2EhCmxEOE+NegCvyoMmx0nqJGU9eAuWWaJlR18/aDxn9i52aNo3YB1n7tUwXZ2v53A1BZKf6aIR4EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749602; c=relaxed/simple;
	bh=hxQd9h86WcnZW15//3x+GOTYd1AZD3cCfHbo/GdWZ5Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gAFAwxKcw2JIvj5phUnpldmUMnSdgb5M0OlbaDI70vA9nqmH/lXgq1ynQvJdMdX8TP59nBqch3bYqp3Uz5yhmtMZEY6u+eiKLPgIdumzKZZCdDI5UDtQKWLfbzQuvdDveoJgG9rIP/v8dMqbDUG5HN8HCB1x9IKWnXYR3L92tzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gaUeu7wd; arc=fail smtp.client-ip=40.107.92.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gaUeu7wd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T72/Kcaa33jNzhYah1QpLDa+VnpijsM6nW7ymQBHWUAJPldfcIU9IrAICyfUcMFEk/+HIwPM2/yjsqYoUJbm0CirqHxG8G+VHfRQb/C7F2aGHWhMC7OmYVixlNQ91HsqV38T7L6orHdJbmrDuDhUlRlURGGrt2cLH4OfVzWPHoSu0eQfasinh6oPUQfTismP1xKJuqaQ2VYW4FM3Z7FhLMl7ICYW8L9rwU7lMPP1M6FsXU9X1Xeu5KdE4ZN0qELaEGMdEFgqhe6qIT7X/zyJaQlIvk17lUEY0vylTxXSOA6vQLqcGyl6gTZmsqGt9jVTbpBlMnn7hCUxZ1T2Y6nipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2Ri4Gnz8+eCL1fetAosP0vCsVY1T4Mfdms5QdkxQZw=;
 b=kvVxf7v5RGHeosNKeTKb3yrqUtYIJuY0RnV/9qF6I0zvwKWD6y9tV5XtT5ADmTEv3ROwnRjYy+TXmGniou1hQS9ftp2eQr0dk14xdI4PgBpTp7cH4ZfevCzm0wd1OkhCnv4v9pgUOfM580N9qOR9GkwySRi6x0vwsZtdmhIXIY3/c7XrXZTCoqb/WMRWfoeCEn11IP7SBZygsiA9qred7gKqPh7qZUSzo7jCuTjFlb7IrRlCVSfuR3dl/6bkoEpyk0dH6trZG/7bR8mq+znDmK4Mco3XPYSpq3c8E1Fxxyt8mW9o1r14V4fY/lme2O9Z71saTXboSseAPHz/o96yXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2Ri4Gnz8+eCL1fetAosP0vCsVY1T4Mfdms5QdkxQZw=;
 b=gaUeu7wdhD/ExLvEhGZLzPyCbtiy434SbJgPeKzt3IU6bbBM/XG+FWOwEDlaCC/qMut0oITLCmk251I/3jruF1wqBZ2OONI/KIwSuc4eok3YV9OPY9VeVSpc8j4Lk1jV1a+oZZrY6MdkQaRfJJ7ToZO27F702FMWYEnWaOGpT6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DM3PR12MB9349.namprd12.prod.outlook.com (2603:10b6:0:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 20:39:57 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 20:39:57 +0000
Message-ID: <91023926-578b-4035-aa7f-b839da1c56ec@amd.com>
Date: Tue, 15 Apr 2025 15:39:49 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 21/26] x86/resctrl: Introduce mbm_assign_on_mkdir to
 configure assignments
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <96edc86bf65a7c261a4d4eb1467220d7f7d1cd62.1743725907.git.babu.moger@amd.com>
 <18b3d120-ae00-4ad4-aeb8-694a072195ca@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <18b3d120-ae00-4ad4-aeb8-694a072195ca@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0097.namprd04.prod.outlook.com
 (2603:10b6:805:f2::38) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DM3PR12MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: f37ab5f8-5032-44a0-4212-08dd7c5daeff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enFZdHNwSDZUaDZWMndEUUVXRFhZMjcrNGprMW1PNTVQS3ZCejBYcnBkTms0?=
 =?utf-8?B?dVppTUVtTGxad29zdmgvWmNmM3dINFU1VzZzbEpZUU0ySDVQTG12UkdZbjRW?=
 =?utf-8?B?Z0p1TEN5cVA1c2VIWnhUMzJLemxDeWoxeitBMUpVYmU0TEc2eUtxNnlZVmhq?=
 =?utf-8?B?K1RKazR5MStneHJMTEZSZjhhbkNtVEE2eEF4Y3lxblovYTEwNzBzVTZ1QTdR?=
 =?utf-8?B?Q3lmZGJyalpMSWJoZVRESlU2Q0QvcXlMWnBHSytoemY4Ym1pT1pMKzRQUXRi?=
 =?utf-8?B?T0lGVUplTVRVZ1YxbHBmSzh1Y1hsYWxjTnZWa1AyeGtWYktFSS9RWnNzRmJp?=
 =?utf-8?B?clN6cXVPYnFReVVwWlVwTTYweUFzYVdYV0Znc3VqMjNMMTZpRStqbFQ0Vk8z?=
 =?utf-8?B?RWFwWG9nYlI0cGVhNW5YekN1aHpjdDhoS2xuV0pqVEZ2K1NRT2Y4TEpNYXd3?=
 =?utf-8?B?dmUzbVd2alM4Q2lHNkY4QWhrYWxScjEzcGw0MXdNU00zSTErZFVkSzZrV08y?=
 =?utf-8?B?MTNrcmkrMlczNm44QndjUExjcy8rWkJQMlEwMkUvWTZHaWx4TVlic3hGT3JO?=
 =?utf-8?B?VFZpTHRzWE9qTjYrazFVZlpDcG02MFVkVGZPRGJzRkxkY0xGVENzdHNHeFdQ?=
 =?utf-8?B?akZEMHUwMXYrNW15dDdXYS9oVnlXaVIrQU9STkltWFVrVyt2eXJRL3RCNU5m?=
 =?utf-8?B?Ny93NG1CWjY3YVZzVDRtbUFiMFBaL2xIL0d0Q0s3cHZUajZqVkoyTjFCR216?=
 =?utf-8?B?VUxkdThmTVJHQ2E1T25sNnFNczZNQVJ0U1pwOWtjenk2U2RuRy9VRUZROEh6?=
 =?utf-8?B?aFB3QTVBNmgxSHUyWFNVZzgrWnVVZFpnbVdGN0dzQ0N3REFQbmtNdXI2Ulhl?=
 =?utf-8?B?Q09PTGhVRnlBMDNKNnJjWHJib1hsbG5jL1ZqMEVFZ2tYZkRVbC9DN1FjeWc2?=
 =?utf-8?B?UlRrOUdXTnhiUWhMdzNETkdZMk1IYjhGa3ptaWt1TjM1S2l4aVRpeGRlV1Fx?=
 =?utf-8?B?Z0NydllOa0JaL2pmUEFmcEVSZ2dhK1Nsd3BPYkpCSDRpc1BzejZvT09IMDYx?=
 =?utf-8?B?VENYWmd0ZGIvZjBVbWhPK0xIYnZaQjkyMTJDc2VMYU0zS1ZaUWhuQXZud0tL?=
 =?utf-8?B?M1h5bzdYYUt3L3FvTElPTmRqVm1td2x2SjRpeDV4TE12dDdlUzgzNXROY3cx?=
 =?utf-8?B?TW4rTnFaMFh3ZnNhOGtyeWNLNndYcHJBNmtqRHdqWFVsK0pBNHNKVG1EaTdj?=
 =?utf-8?B?alVqTXM4MGNKTzgxTzVHVEtsSlEvcWcrOXNpbkxQeGRUcjdNQVp3RHJPdjJq?=
 =?utf-8?B?Y21SdTcrNE1ZNnpGeHBYMVVGY3llSE9laXRkQjNaYnNZNU03Z1pnaENod2s4?=
 =?utf-8?B?R1pxMFgwOHBQZytuODRLRHZDTnVnRjlQUjVtQ0IxTWZ0b2lQT0ZxR3hYWmc1?=
 =?utf-8?B?bU9nZEc2TWhTdk8rcGFhMWk5TjVYWGRlWmgrVFVCdWw5SGhxV20xcTNZT25Z?=
 =?utf-8?B?R0JGNkJiaTRTdmE5a3djaEdaaTl2OUxIZUdrWTNzbVJvdWZWaVpOVkZRd3pt?=
 =?utf-8?B?UHdnK1RzSnUyMnQzWk1mR0xZSU1oQ2ZpaWMyRG1XOEVEQTZPS21FMEhwMmtw?=
 =?utf-8?B?OTgybHZnOE40T1VkNjFqbllQdUloZFN4VE1VVUtDMVUwTHk2blJraGx0UUtu?=
 =?utf-8?B?OHdLUEovcGNHalBvRTJWcGNlYXJxSzZ0Ukh5RkhQV1crbDBVaEtoRGY2Zmd2?=
 =?utf-8?B?SWRiSGllQjBBWUw3ZGxYZjJSU3NWN2J0NjZnbEV2V3Z1aDJLMGNVT3RjREhE?=
 =?utf-8?B?eGpIWXlSYjVHUldmU3c2N2diMWhiK3YvZXd2b3ZPWDVlVUdQLzJTSlBWU3BX?=
 =?utf-8?B?TFpYZUpWVGZRQkc0ZWkzM3VmYXZBN216TlZDK1ptVnd0ejlMbnJua1JOWXFY?=
 =?utf-8?Q?I+q5GsC9ON8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1cyY0p3UjZDR0hOdkpXcXQ3Zmw2RXptUVBHbmVTVmFmc3dsOTNoN2FjdmU5?=
 =?utf-8?B?MWtFSTZiWDl5Sk5UZ2pKS0VGU2VvWEEvMlhnTkp2RDBaRlkwb01Od1VpdDdU?=
 =?utf-8?B?YmdvN0I5SjZkWURoQ0c1S3pWUzNqRGNJV3NQaVJzbmZ5N1A5RnBRVGM4QTdI?=
 =?utf-8?B?cVZoS0hqcGpDVnluU080VW02UWVYTzFSbXg5dnduNVBERmpjWmllRE90djdQ?=
 =?utf-8?B?UWpVYXVhdDFwaW5qZVFUaTFkek5hZTBCUmVEVkt5ekNtYllVQVlVSTZ6NFh2?=
 =?utf-8?B?am80ZEtuWklvRTVobFVFTG5tQ2hGZ1laczRadTkwajY1TW1RcDRvWjVXY0tG?=
 =?utf-8?B?ZTdkbVBnclFRUG1PWVMrSUcrTEErN0J3Rjlxd2NaWURONnJVb252Qjc1SjBD?=
 =?utf-8?B?MlZSb1RmK3k2dGhZaVhWNmwzS3NnUWt5dHJLaDl5UnpkT0Y4S3RhZFhoR3ho?=
 =?utf-8?B?TVltU3FwRVNNYURtYjhUUmlLdlZqMEdKVnd0YzhmbC93WmFlMFFMUy9CMnRK?=
 =?utf-8?B?WDFKc1dnanVaTW9CcGcvdEw5dGdSM0w5Tlc3WVpESG5xeVQxQVZFb0ZFbHBy?=
 =?utf-8?B?d2h4T0VrZTFjU21VMmFtQVcvOW56ZkpCVmpBSzZYRTEvYVU2OFVzZEsyQzJX?=
 =?utf-8?B?QjlqWVhFVittclZ3cEpNSC9PbzFCdS8zdTlCSWFOT0N3UzJkRjRZOEc4TGF1?=
 =?utf-8?B?bzBWK1hsVmw1S1Y0T3VsU0FEMkpJVFMwTllRd3A1TjFjUGFBZlA5R0NOaHk1?=
 =?utf-8?B?T2xjQTFFMUx0WDF4dWtsS2QyOHIyTUJvb1RmdGtmK1MyR1pzY2lwQitqWkdV?=
 =?utf-8?B?TWZUVDllcEpmN01oNjFMLzlRT1FZUE9KNmsyWVh6UGRXaUZ1K3h6VEZObTIw?=
 =?utf-8?B?MU9NMHM5Y0FKakI1MTAvSmVzNDAvbkJiKzhEdVNVNzZ1MnpjMkQxUWpNbG4y?=
 =?utf-8?B?RmRSdWJ6YUNwK2xTUXY4MmM4MGM1aE13UlN5Z1R5REZkeXRTejRTcEVRUGVL?=
 =?utf-8?B?U25IZDlVd3RJdmprazlaS3QySk4xOTlySktDOWczYzM1NEZvQUI3NmNPUXpI?=
 =?utf-8?B?Z0ZtMlVjbEJQMmdjYTg3cU1SQjF3ckNlK0dQbml3YkJTZ25OY3MrZGtOYVpU?=
 =?utf-8?B?Vm4rNnpMaWtCa1ZZNkhjaU1JaHVBbGdxNjFuTStIUk1EemlrODZqMUlRUXd2?=
 =?utf-8?B?azhHOU1xTHJ3UG5zMFhwbWRpRmV5UlBsY2Zmd2pnVEZzenF4dC93UGNoY2Zn?=
 =?utf-8?B?ZVNHaURtdTZBa0ppVEJWTkdZYVpvbUJWTGpmeTRLcUVmdzIxL3hDVVhRbFFq?=
 =?utf-8?B?aVJ6Vlo4eVZvRG8yS2xiQjQzZmd4czI1c3h3Sy8veXNxNTJFb0tWeUY5c1pE?=
 =?utf-8?B?MnZQdFFhdFhDMnZibXZyWG1Zc2hrazBROUYzWC9HelFQWGU3bUNUbEIxOVQ3?=
 =?utf-8?B?WW02NUt1WTJvL0NyWmFYNkRzd1FVcWNSZFdIY1lRRmdFV05jb3czREYzSGlH?=
 =?utf-8?B?dzloMGFMaTRSMlVWNUlDY2dycDRjS3FXREF1VnpXVUlyU3o2cWMrVFk0RFAy?=
 =?utf-8?B?NUh4YldwY2NXaVZYMlZuTzlHeXBGWVNRelNBZTVuWllkWGF3Z0tFbTY0RmRo?=
 =?utf-8?B?TEMxZ2VoaHR0YW9KSU1RTjh3ekJGNEpva09UOEdlQ1lwYmdkMHhSSHM4azVy?=
 =?utf-8?B?QXBWWVhtZG9xUHhwamRxY3VsdURSanZYempJS0ZtOWN5T3Nrc0xFSnZTWHVw?=
 =?utf-8?B?Q1V1YysvN1Vod1FJNVliLy8wWkhTUDVjNXhOZ3pERWgxZ2hTVWF2THRPWEpM?=
 =?utf-8?B?WHdKeFlWL2tTd0Zsc2hIZUtsYmZZZVR2Rm5EcEJFeTJnN2NBK2xyWjJVOW4r?=
 =?utf-8?B?cW54QTBiRWdCRTh0NmFudEo3Z3JXdUtudU02K0R6Yk1teXpHSFJQaHZBWnIr?=
 =?utf-8?B?TktvUUhxdDVkK1ZmdHdWOTEvYy93OE40T1FwUFQ1T3dLOTJqczNKN2NwRnhV?=
 =?utf-8?B?b3JMby9VNUl5elMzajJTeVc2VzN4WDNWWGxmWlZvWnpPSkZZV3BRaEpMMW42?=
 =?utf-8?B?Q24zWmtzVWZLcVZMZ01yR1BRSUtWLzRpV2g0dEhySkt2bkU3Q0pIK1ZTZXh4?=
 =?utf-8?Q?vlJY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37ab5f8-5032-44a0-4212-08dd7c5daeff
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 20:39:56.9564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hcC1ZS0L2CZz+4VhaCoIMRc+zlssmbc19fM2N6vcJ1Qo54ogovzA4k0qEhJRfcY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9349

Hi Reinette,

On 4/11/25 17:08, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/3/25 5:18 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode provides an option to the user to assign a
>> counter to an RMID, event pair and monitor the bandwidth as long as
>> the counter is assigned.
>>
>> Introduce a configuration option to automatically assign counter IDs
>> when a resctrl group is created, provided the counters are available.
>> By default, this option is enabled at boot.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v12: New patch. Added after the discussion on the list.
>>      https://lore.kernel.org/lkml/CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVGbQ86nD+Q2_SA@mail.gmail.com/
> 
> Seems like this needs a Suggested-by for Peter.
> 

Sure. Will add  "Suggested-by: Peter Newman <peternewman@google.com>"
-- 
Thanks
Babu Moger
