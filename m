Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B1025C6F9;
	Mon, 10 Feb 2025 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216827; cv=fail; b=uub2+jaZ+OpjwjSOFg3R1WVDhwhQi6XCJdSeAv/RgJIzF3p5ofMzbZEqHtdD9lpWlGqrnXamkvIiZwulkTfZ8dprTrHt6tpHdh1w8qfSpnFe3ZSGDq+mASklF61/j7Rk0mf7TZhRzoEWcwdQU05y8Q4Aq1bGEIETOPu5nDE+ycM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216827; c=relaxed/simple;
	bh=vwNpUqcAk5+Q6yCMco5dpJNQjl6N7S24UTc5a+sjn/Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=boPoaqYKMbU0RPNXXJpSxQtjMIViVHWjuN1rvNEN3rfO+lQlQHyy8pprNEU65v+z1zRZ4Acok/U7VaLE7aL3aVh4dYpTRCU+kdT+OjoUsCy807mPMLUVI8uEbXwgIyLqjn96r1u53MyWK7JncjG5HIbC0q7aALVJf7uH0slR+qU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eKk0L3rk; arc=fail smtp.client-ip=40.107.92.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eKk0L3rk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQ757u8aKJfScMYCiFQBpubITknxhsFpF0xBTsaqTfp6PvvDsSBBchSL4BCJ4Jm0sW9hQ7LpywSnhiPPdIm9pUtEaCt8zb2EFGLvrLeA59vHZuxrI/+hZPunPjxttVm6HEF31f1+i2i17uW8RwyNRyw0LxGy6revezz3nFY5Azvqq8whGW0TjP2tttxLF1felqDB4H2QG1D2teWx+OgQ6Da4AUM9yiNBP1iSlFmiZBDvJ0YWdPrL6wCDJxn6HGUXLCiPZ5LPYSfRud5HgVdCjetQMehZIsz+WkS7SMdy+ZRZ4F+3HTazwliz+/rJBx3HAIjPFYj4MjYD0xYQGxRSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oi/oa5bYmfVlD38mK7yWCxdhw5MFM6E8TFprFUO/hMQ=;
 b=foK2yGeVymrdJy4DRKqSEMeSB2q2JhJ2asa3MYsKJv9vdUEFSVHRhZ0XoXruns5L9KXomp4a57JSqOPDl1Xx7b8GNgUgLlQ4UtnXVJAbwqY0blWr5VuERDv1SpZqK5pC7no9zhVBU5ABMaHzJJ6gSkEX8ci2kiHbL5DMlRz9LDRn8fRN05GO24k2iV95cyzfoOH1XHlUu+p16DnUvzPs1w837fD5zdkxbl9KEevXhFkrkwCWya7+LJmKRTk0uZx9Burr6h2VjXW0s1uRIIYza6/p0wLZw3Vgi518vwmm7bZMpbEfU2ULkfvw3CCnP8ketugLOD8bbYZSzFEBBwa1Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oi/oa5bYmfVlD38mK7yWCxdhw5MFM6E8TFprFUO/hMQ=;
 b=eKk0L3rkARZm7plts6ovkFnNtNWUps1/yq9JJUAAKZZM/exTTz9yJmOiLXmNELgA/aOW2Nvt9HGFBkm2vse+UCrMyNoiGpNBN4y32AHYuDDR3t38l2h7Z69HGpPRK6vIK9dVoJFAhM02SlmJqCUDhTERHomxzSXUSE4JvB0NhTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN0PR12MB5860.namprd12.prod.outlook.com (2603:10b6:208:37b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 19:47:01 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:47:01 +0000
Message-ID: <c531c218-6eee-4262-a89f-50e1bfde6dfb@amd.com>
Date: Mon, 10 Feb 2025 13:46:57 -0600
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v11 23/23] x86/resctrl: Introduce interface to modify
 assignment states of the groups
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, tony.luck@intel.com, peternewman@google.com
Cc: x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <fe1c0c4cebd353ccb3e588d7ea2fe9ef3dff0ef2.1737577229.git.babu.moger@amd.com>
 <c8dfccf7-602a-4188-91a1-098095181812@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <c8dfccf7-602a-4188-91a1-098095181812@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0085.namprd04.prod.outlook.com
 (2603:10b6:806:121::30) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN0PR12MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d31fcf-548b-453c-882e-08dd4a0bb019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjAvNjlwZkpTaEpiWksxRUg1NHplRHFkVGpNY0RHenYzZUwwN1NiVWRVMHgx?=
 =?utf-8?B?KzZoSzFkMWxTb3JLdmJ3MElnaWJKK3dvTnUvT2YyZFkwWGdJdTNNZ0lsazQv?=
 =?utf-8?B?dlBESk1TZ1h4VXVENm1LMENjbVc2Sk9mUkpyVUtvSzFJYllnWXozblZFSVJ0?=
 =?utf-8?B?U21obXJrd25YOSs0b1RoVVpJcEFIWHZJOVJVV01peFp4OEdVQURyOGtuZXVr?=
 =?utf-8?B?cENsaFphNGJSY2psbTBveGZhSVhwY1IvdWJ0bjM4bjB4VkMyRWQrK2Fwd1Ni?=
 =?utf-8?B?TXB4RjRYRnRENk9HWGE3K1p0UEQ0clBUcUtDYU1Ucmljcm90Mm04bzM2eFRw?=
 =?utf-8?B?WU1Tc2UvZHU3c0lBUVNFRENGWE00YVR0Q1pBOE5sWVI3ZDhqQXFGdjRaWnlO?=
 =?utf-8?B?UFlIUVJtZW51YXJhZk4vdmFNVjd6Z2FJSVRWeEdhMk9YV0kwdnJQOHNPeTFB?=
 =?utf-8?B?cm1hYjB6LzFkVWdicnpJejc2Z1RUNDZjUzczZDBTM3lBT21QeG4wN3RTZ1ph?=
 =?utf-8?B?V3g2RTl1YlZ2U1JoU0wvZ1hHd0c3NXlWT0JnOW83Z0NrNEdYWjZZZHFmRlZl?=
 =?utf-8?B?UzY5TGJKVloyMCtrckpnMzN5T2c1dzkwMzBsWWI0a1l5K3VmdGJRdE1kdUtJ?=
 =?utf-8?B?Q3hZNnI1SFp2cDMwbXl3M0JYSGVNdUNlRW0rdGpsc3NtMS93YWJDY3ZDNU9S?=
 =?utf-8?B?VEJ5cmFkS2IrcEEva0xlTmQrWjMwOEZwZXl2Q3NyTFdmbUlvSnB1T0xnRnJv?=
 =?utf-8?B?ekpxSnVaR0VqbWRlQitBMEdWS20waFZRNWpjbFE4MzVuVjVOejJYbHRONkFK?=
 =?utf-8?B?ZlJmdDZWU2xEVVFpUFh3MUdkcExpVXJRWEhTKzhsUWxsZEh4d2dYYk5YNHNN?=
 =?utf-8?B?dXBTZHY0NjU0R0Nya0ZxNkhXeEhIUGFIQXNwMUdmSC9DWmVxZE5DVUZjQnJm?=
 =?utf-8?B?c3BQeUc2bUl3aTRseGdhTWJneDhyS2tDSlBEZnUrNlM1bmRDcy9rYTZTSGdJ?=
 =?utf-8?B?cDB0WWlpSU1LZWJiMkhpbTZycHpxc0xHbzJ3eEppU1RCbW1UckgxR1V6QUFB?=
 =?utf-8?B?L3FxVFRvNitoNHNURTVkYnRFN0xVeFZUYi83ckxNOUNlVWtYZ2ZsSGdUTlEy?=
 =?utf-8?B?aVpUOS9oTnlrMDlybFltYS9raUxzTlRzS1dqL05BT0lrdjRDVGFLblVPZ3RW?=
 =?utf-8?B?LzdIWnJXbncwWWh3WjJZK0FHaHBhVlNlTG83amJHUHF4NyszUzYzRE9Da3Bt?=
 =?utf-8?B?VXExZE1wb0Q3Z2lPSDdZNkRPNC84SlgvaDhCaVNueEtkL1E0blJRR2h0STFx?=
 =?utf-8?B?RW5MQUNTTG5QK1VMblRDY3RIemtxdk0rd011Y25Jb0sxWEZhR2JoTVN4R0RO?=
 =?utf-8?B?eW45ZTh3UWxXS1NRR1NqVXB6V3Bsd2VuQkJjV2k5Z0swVkhhNElTZlEyZzhO?=
 =?utf-8?B?ekhYM0E4bzdoK2c4NSsxNkl0Vk9nWmNrUHB2cFhsdFkycytBZ2F1aGc2amgr?=
 =?utf-8?B?ZWdhbXhEWFRNd1hxZjBSY1VxalptcjczZnJLQW9kRUczRUo5clJaNGNOcDU0?=
 =?utf-8?B?cmdJYUUwZk1ZazkvS2NtYStvSGJ3K0hPenAweEwwdWZyY2t2U0ZOR2lwQ3Fs?=
 =?utf-8?B?ZEJrN1dHRWlsR3d6UEhDYlRyNUJ3dnFmaml2cldRaTZPNG4yZmZQS0prOGhR?=
 =?utf-8?B?SG9FNStyVzNid002a1RxZk4xT2dCcGVhRm5yWGxLek45Y1k0dDk2U3dVMFpH?=
 =?utf-8?B?cDlORFZDNHRoekdZdk9CNEZ3ZWh6MmM2bDI0M29jWDRZMUdOVUI5MllqLzFN?=
 =?utf-8?B?VllDVHZ6cW0rQllxM1BYeDF2bHBScVNQUkZTNHNMN3IvcXFOcjB3RUNBWmZJ?=
 =?utf-8?Q?BxnKbpq1jE56m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDBVNE5zQ0x4QmlVQ1pVdGxtcy9zcjczc1c2d3dEdGdqRE5yMFZldzBwZEhZ?=
 =?utf-8?B?RXF3amRZd1ZJVnN1clFOeW5HT3crQVoxOFhnVDJHWTR4aVl4RnZQMmdqQ1JX?=
 =?utf-8?B?d1kvQUVaTldVc1Izd3VDZ1JDbExsN2JXclZZMU1LZzZLczRNQ1Z6d1pzWnlr?=
 =?utf-8?B?V0hIcVJZQnlnU1EwUGIwVGFBa29FaHdxU2U0ZEFOb0FaRi83SG1MajY1UXRQ?=
 =?utf-8?B?d28zZHdJQ2ZDY3Juakg5OFJKWWd5VTBpdisweC9zNGlUQUd6dU1OVmkrVWoz?=
 =?utf-8?B?aHlWZ1g4UkpsTU43Tk0vdlpvTXcycXRtZ2d3RURjaEVVYnJ2aktoMldlbFU1?=
 =?utf-8?B?bGwzSHo2UGN3a3pHaVMxWkREblA3Z1F3TDk1ZzdXWmFSSHhaaDMwMlAwQnFI?=
 =?utf-8?B?c2lJcjY2dGFKa1AyTE9CMGxRNG1ZMXo5RTRjdzRTUWZWNXhaNldrT2xxTXRY?=
 =?utf-8?B?ZkYyS3NJd3ozcEFpYWNsdHFiMmlpeHM5aG9TMzVqMnc4TXR6M21Td2F3dVdx?=
 =?utf-8?B?UFAxVU9ZWStHeDFCdGZYNjVUZ3VCbGZrNnFnbEcxTWE4b1EyWlZpTml3QzV5?=
 =?utf-8?B?RC9pSExjR0ErN2ZDd2wrTi9VSDBrUXUycnR5R2FQN0xsZiszUWdNWFhCMFJT?=
 =?utf-8?B?UE1LeDVzT0Qyc2JtR2cvNGFoTk5kOGlqTk5qbUZZT0pDTFA0VnB2emp3WWxV?=
 =?utf-8?B?dkJveHdkOTZkRDJSMHZsNDlUMGdwZGNwTDhtd2U4b1JCQjVBOFRmcVVsNUZh?=
 =?utf-8?B?ZHBUNkpHKzUwNlV6THltVThMMXdJTzZ5dEN4N2pWNzZST0g5SHZnc0Y4eFh0?=
 =?utf-8?B?NXBpSFRBZmY1NXN0bHV6bWJocFJWeHhaWGVyRkYxYUxlM2RpMXBrMzBGKzJp?=
 =?utf-8?B?YlFaT0tXZWgvT3QwWVBMdE42U2xQdWRYNEw5V3pta1NmTlNjK2xkWTEvZFMx?=
 =?utf-8?B?SkJVTnk2MFZybDIrL2xqRnNWWnR4dDZTd0J5UmRYcFoxL09FeVN5RmVJR1Q1?=
 =?utf-8?B?M2hSbjRTMjFEWGlLdXVXVCtkTUxreUJaazBPNWhqTGNUR05iOUYvcTFld0tB?=
 =?utf-8?B?Uk5NVnBiZzRzdFJEMkgxcy9xYi8yVHBDQ0F2SjFYbzZSejdmemdOcUdRUE1S?=
 =?utf-8?B?cmlmcXVuNjN6elRucHBXaEZjVHh1bzlDZWJlckJveTFZYzlRVHh5ZjZ4NDNr?=
 =?utf-8?B?NDdWVXh4SVJKbWo4T3FheWgvN1k5NklDcFhGbHZwSk04NlljN0x0WGJsMElt?=
 =?utf-8?B?QUJUaWp3RG45bTUza0dlNGZ2MTNXQ0hYemt2bStNdHZvUVNJTDRxbk9HUlRF?=
 =?utf-8?B?ZUMvUklSZXlmcldEbis1aFlaMEpyTE5xRmJvSWdUaG5lMXRIRU5qZS83ZWln?=
 =?utf-8?B?YUY3WndlZnM3R1krSzgrYmdGL3NBWVU0THpqUU15OGUzei9uRHZKL3JTN0Y3?=
 =?utf-8?B?MWNPSlBTQU1wd2ZEdUgrUkRmMitXWnFyTkJaQUVaQXByRlpMY1VNSVJqbFpR?=
 =?utf-8?B?TzQvRTM2Y1VXLy9yQURLVXVMU1UwYk9xWmZyeWUyY0FIWVdLVkdKWDNJU2Ju?=
 =?utf-8?B?M2pWQkNxZVQ1TDdFRU1iUjhBVVZRcjlnWVRIZmNQM3NzNVB3RGxLZzdKdWFB?=
 =?utf-8?B?SW9iV2xtSG9GdTVsZ2owcnpHQVpERnBPWE1IbjFkenJjaGc2MXp4M0ZRczNo?=
 =?utf-8?B?UmU0cW11QW9NWm9qNW9ZRUZEckRaaGxDc1Joa0F0aGdlUyt5eEgvd1hIRWdy?=
 =?utf-8?B?a0tYdTJnZkk4cEVyNmY4QmdSd1A2UFNYOXUybDR2SlFDR1R1VjhSTjVhUHZK?=
 =?utf-8?B?dzlpL0cvSTA3NGFBTTlBVDN1eTFyZm50VjZOeVg0MXdKamUvWlVuajE0NWJ6?=
 =?utf-8?B?ZEw3aUllK2lWdTdpOEZqbDdmNFI5a3h0ayttRkRCckVSZXo2Z1VUOWUraXgz?=
 =?utf-8?B?cXFrUHZMRisrU2Y4U2YxWTR1QzBTOVQ2Uk84ZmMrcS9xRzY4QXZ1Qm8vbXB0?=
 =?utf-8?B?Vnp0aDZTc1RoR2pCRTlhSW5xbkxnVWlqWThVUnVQdUpZeHVSREJjNjBLa2RB?=
 =?utf-8?B?N1JLTVEvRVJtK2l3ZCtaclRIL1lCQTNCOStSYmJ1cEkvTlZ4NDhNUDZySGdy?=
 =?utf-8?Q?8jfc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d31fcf-548b-453c-882e-08dd4a0bb019
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:47:01.7705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQ2BWDLPi+j6U8qKGmpgyoFMrC43paTmTZn1lUKJLQHJwhEnRWjMLspVGqxEkQmQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5860

Hi Reinette,

On 2/6/25 12:48, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> When mbm_cntr_assign mode is enabled, users can designate which of the MBM
>> events in the CTRL_MON or MON groups should have counters assigned.
>>
>> Provide an interface for assigning MBM events by writing to the file:
>> /sys/fs/resctrl/info/L3_MON/mbm_assign_control. Using this interface,
>> events can be assigned or unassigned as needed.
>>
>> Format is similar to the list format with addition of opcode for the
>> assignment operation.
>>  "<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"
>>
>> Format for specific type of groups:
>>
>>  * Default CTRL_MON group:
>>          "//<domain_id><opcode><flags>"
>>
>>  * Non-default CTRL_MON group:
>>          "<CTRL_MON group>//<domain_id><opcode><flags>"
>>
>>  * Child MON group of default CTRL_MON group:
>>          "/<MON group>/<domain_id><opcode><flags>"
>>
>>  * Child MON group of non-default CTRL_MON group:
>>          "<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"
>>
>> Domain_id '*' will apply the flags on all the domains.
>>
>> Opcode can be one of the following:
>>
>>  = Update the assignment to match the flags
>>  + Assign a new MBM event without impacting existing assignments.
>>  - Unassign a MBM event from currently assigned events.
>>
>> Assignment flags can be one of the following:
>>  t  MBM total event
>>  l  MBM local event
>>  tl Both total and local MBM events
>>  _  None of the MBM events. Valid only with '=' opcode. This flag cannot
>>     be combined with other flags.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v11: Fixed the static check warning with initializing dom_id in resctrl_process_flags().
>>
>> v10: Fixed the issue with finding the domain in multiple iterations.
>>      Printed error message with domain information when assign fails.
>>      Changed the variables to unsigned for processing assign state.
>>      Taken care of few format corrections.
>>
>> v9: Fixed handling special case '//0=' and '//".
>>     Removed extra strstr() call.
>>     Added generic failure text when assignment operation fails.
>>     Corrected user documentation format texts.
>>
>> v8: Moved unassign as the first action during the assign modification.
>>     Assign none "_" takes priority. Cannot be mixed with other flags.
>>     Updated the documentation and .rst file format. htmldoc looks ok.
>>
>> v7: Simplified the parsing (strsep(&token, "//") in rdtgroup_mbm_assign_control_write().
>>     Added mutex lock in rdtgroup_mbm_assign_control_write() while processing.
>>     Renamed rdtgroup_find_grp to rdtgroup_find_grp_by_name.
>>     Fixed rdtgroup_str_to_mon_state to return error for invalid flags.
>>     Simplified the calls rdtgroup_assign_cntr by merging few functions earlier.
>>     Removed ABMC reference in FS code.
>>     Reinette commented about handling the combination of flags like 'lt_' and '_lt'.
>>     Not sure if we need to change the behaviour here. Processed them sequencially right now.
>>     Users have the liberty to pass the flags. Restricting it might be a problem later.
>>
>> v6: Added support assign all if domain id is '*'
>>     Fixed the allocation of counter id if it not assigned already.
>>
>> v5: Interface name changed from mbm_assign_control to mbm_control.
>>     Fixed opcode and flags combination.
>>     '=_" is valid.
>>     "-_" amd "+_" is not valid.
>>     Minor message update.
>>     Renamed the function with prefix - rdtgroup_.
>>     Corrected few documentation mistakes.
>>     Rebase related changes after SNC support.
>>
>> v4: Added domain specific assignments. Fixed the opcode parsing.
>>
>> v3: New patch.
>>     Addresses the feedback to provide the global assignment interface.
>> ---
>>  Documentation/arch/x86/resctrl.rst     | 116 +++++++++++-
>>  arch/x86/kernel/cpu/resctrl/internal.h |  10 +
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 241 ++++++++++++++++++++++++-
>>  3 files changed, 365 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 3040e5c4cd76..47e15b48d951 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -356,7 +356,8 @@ with the following files:
>>  	 t  MBM total event is assigned.
>>  	 l  MBM local event is assigned.
>>  	 tl Both MBM total and local events are assigned.
>> -	 _  None of the MBM events are assigned.
>> +	 _  None of the MBM events are assigned. Only works with opcode '=' for write
>> +	    and cannot be combined with other flags.
>>  
>>  	Examples:
>>  	::
>> @@ -374,6 +375,119 @@ with the following files:
>>  	There are four resctrl groups. All the groups have total and local MBM events
>>  	assigned on domain 0 and 1.
>>  
>> +	Assignment state can be updated by writing to "mbm_assign_control".
>> +
>> +	Format is similar to the list format with addition of opcode for the
>> +	assignment operation.
>> +
>> +		"<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"
>> +
>> +	Format for each type of group:
>> +
>> +        * Default CTRL_MON group:
>> +                "//<domain_id><opcode><flags>"
>> +
>> +        * Non-default CTRL_MON group:
>> +                "<CTRL_MON group>//<domain_id><opcode><flags>"
>> +
>> +        * Child MON group of default CTRL_MON group:
>> +                "/<MON group>/<domain_id><opcode><flags>"
>> +
>> +        * Child MON group of non-default CTRL_MON group:
>> +                "<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"
>> +
>> +	Domain_id '*' will apply the flags to all the domains.
>> +
>> +	Opcode can be one of the following:
>> +	::
>> +
>> +	 = Update the assignment to match the MBM event.
>> +	 + Assign a new MBM event without impacting existing assignments.
>> +	 - Unassign a MBM event from currently assigned events.
>> +
>> +	Examples:
>> +	Initial group status:
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>> +	  non_default_ctrl_mon_grp//0=tl;1=tl
>> +	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
>> +	  //0=tl;1=tl
>> +	  /child_default_mon_grp/0=tl;1=tl
>> +
>> +	To update the default group to assign only total MBM event on domain 0:
>> +	::
>> +
>> +	  # echo "//0=t" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>> +
>> +	Assignment status after the update:
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>> +	  non_default_ctrl_mon_grp//0=tl;1=tl
>> +	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
>> +	  //0=t;1=tl
>> +	  /child_default_mon_grp/0=tl;1=tl
>> +
>> +	To update the MON group child_default_mon_grp to remove total MBM event on domain 1:
>> +	::
>> +
>> +	  # echo "/child_default_mon_grp/1-t" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>> +
>> +	Assignment status after the update:
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>> +	  non_default_ctrl_mon_grp//0=tl;1=tl
>> +	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
>> +	  //0=t;1=tl
>> +	  /child_default_mon_grp/0=tl;1=l
>> +
>> +	To update the MON group non_default_ctrl_mon_grp/child_non_default_mon_grp to unassign
>> +	both local and total MBM events on domain 1:
>> +	::
>> +
>> +	  # echo "non_default_ctrl_mon_grp/child_non_default_mon_grp/1=_" >
>> +			/sys/fs/resctrl/info/L3_MON/mbm_assign_control
>> +
>> +	Assignment status after the update:
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
>> +	  non_default_ctrl_mon_grp//0=tl;1=tl
>> +	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=_
>> +	  //0=t;1=tl
>> +	  /child_default_mon_grp/0=tl;1=l
>> +
>> +	To update the default group to add a local MBM event domain 0:
> 
> "local MBM event domain 0" -> "local MBM event on domain 0"?

Sure.

> 
> Taking a step back to look at the completed "mbm_assign_control" section
> it is noteworthy that all this work is about assigning counters to events
> but after this large section is complete the word "counter" does not appear
> a single time.
> 
> The section starts with a brief:
> "Reports the resctrl group and monitor status of each group." and then
> moves to terms like "assigning events"/"assignment status" without defining
> what that means.
> 
> Instead of rewriting this, what do you think of adding some definition
> of what "assignment state" means to the start of the section. For example,
> (I am sure it can be improved):
> 
> "Use "mbm_assign_control" to manage monitoring counter assignment to
> monitoring events when mbm_cntr_assign_mode is enabled."


Sure.

-- 
Thanks
Babu Moger
