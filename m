Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708381E32D3;
	Tue,  1 Jul 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386490; cv=fail; b=Yxw5WFYp8fvnoquTUezcpVZGt9l0gCTuTJK1bg/i/b+RMu4ZUKHr9etLOyT0x0AAby6N75lf8x7yGiS0ghZ/Mr9+d3T0by3+Eup7DjhgFNjSxhvuCjVy9rgFLP/T9quvIcq0zgiwygKZ5GoIoS+ostGjdSam8GFar5zzJIk0M7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386490; c=relaxed/simple;
	bh=t/NnxemRMYAG3N+4OoDui1SmLatUP+2NQuu5zGtrZO4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mAUGzMDBEe4OrhsWq10YieTZHcPDrLBLUzrDaJffYvSbm4wSnxsQoOES81t86g6OKwZhlNpwPnleoCfGpZlnbn+6EBZTZ46EnhUrdW/aPDmSvEoon1saS7gws3fAUgGCs9N1zLRFnwEZ9m4i97uNXHrvmRdQ2EVXmwIUL5y+tgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jIa+HmIc; arc=fail smtp.client-ip=40.107.223.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jIa+HmIc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfxPVprcWpF3VXrxuUjD90j0Ahx2bOFIfd2H3gdDER5XewWq3n7dDG1NCGIG2FiY8+H4lBunyqU5FudYBzAhfaMS8nEQejmJdolOV5OWh0LvYyUpg98LxuIis/QXW4JTmZRnQVsfoa58Kfcx/1yNJ8KI5yAu9iu0NznaBwjCcCjQaiYzbuzUUM1ZtwGfEn99Vv6dZferm47AA5BNZo24y6vphGzu/IjVdOlLXHMrZ/88NwMpLLboRmDsXgp9Zc077z8JfE4QmhLp6QUV9uIEV7Utvw4B+nS9jKj/U70oIwN2IbuP5Vr6Pho+mpK5msJ6ZvqqOU12HMTO4w3Yo/C1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLzPLDneoG40prmV3TiEb/zFJ7wY7t+P2kyoBzSwjgU=;
 b=oSjsrq6CDsRYeamS7A2tEt3eBYkE3IGffaMn+JAA2K9cuUDl0YN/N3nX59BdS7KMra00I6uSGanS4+bRX49xhcyrCV/wjc9qxOfZOY+2K+XTB9GOExxYThXyF0tLUcjUrsgYGauNkcZNmN1Fc8Z1+SRqucYzf4x3y2uW9c0pUEWwV4REhpLGzVJrQzNE6+SH5jOHZOq1+B7tnVYpHQofA3LxxTumbujTSPOmYdsKX5je8W1szdqaNdT8m/siOHyQ/Y4fgrgGtIfVXE+SZOdRqywstEjU8CPDq8ZQPOa9v7Id9fPZIhgPKhjNhefs5KIS8xfSTRxJdkH9R/2kPZYmiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLzPLDneoG40prmV3TiEb/zFJ7wY7t+P2kyoBzSwjgU=;
 b=jIa+HmIcpdlI9rnR8L1mW2qu+KVWRvetNEtLE+aC9DsXDsiYUc6GtllMhivPy3gXnZiv/ARCEpn5LoHnW+D1N8x3pvLyqIHJvkNx9zvmeF62p1c4t34BSHxhKti0qqDjAvQoaZNc7vQQSWRNQ0VdwPnmJf9mB3LfliTtk7yZbK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MW3PR12MB4412.namprd12.prod.outlook.com (2603:10b6:303:58::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Tue, 1 Jul
 2025 16:14:42 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 16:14:41 +0000
Message-ID: <23667132-e070-437e-9d28-3db53ed220a5@amd.com>
Date: Tue, 1 Jul 2025 11:14:37 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 25/32] fs/resctrl: Provide interface to update the
 event configurations
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, corbet@lwn.net, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
 <dc097e5caa1c7df42c211fffb67f8d860a6b39da.1749848715.git.babu.moger@amd.com>
 <de1e1946-15d2-401e-a974-cbc86d08a78c@intel.com>
 <35238a5e-fa04-4e08-97ba-7e206c36bf4d@amd.com>
 <be483586-fa15-4426-ab16-7d250a6cf653@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <be483586-fa15-4426-ab16-7d250a6cf653@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0114.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::21) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MW3PR12MB4412:EE_
X-MS-Office365-Filtering-Correlation-Id: 298db6b7-bbca-447f-1f57-08ddb8ba62c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1M3cml3TTNWQjlYY2FJMmdTMEhTbDBPaTl5RGplalFCRnVIWDdzS3FhQWE4?=
 =?utf-8?B?REllWWZ5Y2ErYzB5cHBQa2tWL3VGS1diUTVSMVJJYkx5cXNaa1dXcVcrcWoz?=
 =?utf-8?B?L0FjWDZ4NTRCdjIrc3ExUUREai9YK1V2REpCZzRNRmtIM1kwOWhVTnBwR3Zo?=
 =?utf-8?B?SjdYVUVsMWhrcjFmOXFaUFE0ZE8rTGlncGhUWFl4ZkhkeFNjelhLYnhlR1p0?=
 =?utf-8?B?eWVYUmNjb3d6RkVxMjVWUUNIWTZSKzFpNUh4ZFdqQTZKbTBDcEVMS1d4UERu?=
 =?utf-8?B?Z2Y0blRPVWEwMXAvVk1odGhEMDNWY0RzYVoxN3FhTk5nRjJSNytiNVBIQVF6?=
 =?utf-8?B?MmozTWZxbEdrMmZoeWE2VWU4cFdCVFdWYU9MN1p0TG9DUzJuMmM1MWEwOHd3?=
 =?utf-8?B?cVNwTXR0QVg3ZGZVc0dKQjRhUlU4b3NwbU5FTUExeDJJdGV4cWVYZ1Q4bmJm?=
 =?utf-8?B?eXpYWW1yY2h4dFNwckhZMHVUOE1uWkJ2VkIvaE8wL0dEZjBTNDBsZnc0alI1?=
 =?utf-8?B?Y1ZObzlnMERyYlkwMk5FOFhvaitYTVQ1MmhmMUF6TDEzMGZ5QStNcTdkcmI1?=
 =?utf-8?B?U0VMMkI0Y1FLUC9BOWN6ZzJwS21KRUdBY1NEUUlDWFB6aTRCayt4cVFDV1Jt?=
 =?utf-8?B?QmRMV0UwMkN5OXpwVDVETDYwUXd5WGpYdzg4SDdMS1Y4MTc4UDJFbXhOY1Br?=
 =?utf-8?B?S2tZdXdncm9GT2haRk52bzFxbmx2d1JwdjFLYy9JbHNQd3hrcEtmTmFRZGpX?=
 =?utf-8?B?L1BqZDF4a3dQZll1QmU5YksxQUhkOENXU0FlZ29RclBZeUIwRmFYVWNydUFq?=
 =?utf-8?B?bnBmSXhBVzNkWXdZeDlkZDJBNTk0MHJuUWt5amRvTHVuZjJzdWxtUE5RV05O?=
 =?utf-8?B?WTRrbFRtaWNkSjRTS2FLQ3ZpdmlGTEU1bExRU0Z0WDM4VE9pVEYxaUVyRlVW?=
 =?utf-8?B?UWo2RlFkdHRsWDVoV3NWV1hDMkNpbVhvQXBCWUxjOUZ5KzBUZHh4T0dsTTNN?=
 =?utf-8?B?eE5CM3d5WW93RVNNb01zU3REenJrbHNRY3FhVThGTS9PTjBucDZNTGNwbTAw?=
 =?utf-8?B?WG5yejhQU1d5U2FTR3JFTmNYZ3JHRDBRc1VFbTVUcjJVNFF1bHN6SElvSFFW?=
 =?utf-8?B?ZFVKR1VNOGE4V2ZJRWJPWXorNEdmT3ZKVHZ5UDM1MHZRbWkvMjBDZUp1eEdt?=
 =?utf-8?B?NzluSHI2SjJETklIb0dDS2pPZzQ2WldtMGlxa2VmdDlBanRMZzF0dXY2YmdV?=
 =?utf-8?B?YXZXaVRKR0llQklscEtEbEc3ZlJoeGV6VkYyaTJRSGlRd05JSGtOK0cwNkwy?=
 =?utf-8?B?RVRvQVJ4Z1FmL0NvNzdERlNITDFCeFJ2Y2grdlprUnlsSDZIYURxZi83anlq?=
 =?utf-8?B?TDFQUDdHTGE4bVYxY3RBeUJ6UjRUZGFkR2piMDVoYTdvNWhrQXk3eWVhWlAw?=
 =?utf-8?B?QTVKRU81UWpFbW5iaHFRcXVDMktrMGZTUzVXV1RvVlZHbGVjY1dnUElFQXNr?=
 =?utf-8?B?U3loTHowc05tOCtDQXBwWDIwVTgrRTNOU1c5VU04a2YrVktDS3Bud3pINWJO?=
 =?utf-8?B?WFJYR3c5RmVFWFVnMWZFYmRlSHBPVHFVVzNwNXArRzNyU1pWQldJdVRVM0Fi?=
 =?utf-8?B?MXQ1WXgzdm43S3lhRkhKSDMvWUJsaGdJcUZZWEpsdXBPQ2dVaUlsandRZkZi?=
 =?utf-8?B?cnVvWHFDZUlaN3MxUUJhZE9VZEdkbEhPUkxHRjR6Vi9LNzVDMFpSOVlMbTdh?=
 =?utf-8?B?akZZZzhNUGFwRHpNWjFmc09XbVQ0Tnl3S2I3SWFGU29lOGdMVXBIN1o1N2Qw?=
 =?utf-8?B?RjZKU3VSb2RyaFM3djFnbUxLMDBPRGJtRXV3OWpHRUJnZVRIRlFwVjJhNDBD?=
 =?utf-8?B?VUhRUmNVSXgzUFBXSmFYc3NmMWNsNVIwOEZuRUd1YkdISWo4NGpHaGFWY3hL?=
 =?utf-8?B?cWlRRFg4RkVEQ0NxbXp6UXZwQk5ZUFJvblk1Tk1CQUt1cUJDTGttR01QTkV1?=
 =?utf-8?B?THJWVXM3RjZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnRnNkw5ZHZCNXdYZmVYTUdwQXBQTjBROWxEbDFYa3pJNC9qZXNZSHFrVWs3?=
 =?utf-8?B?RzFlM1NLekdaWXZOWFhCblJZWDdnNmdjOEJQaEFoYnhlUnhVZGQvWklRV0Uv?=
 =?utf-8?B?RVdGcHFnZndScGZJMzJNNlh0NGdkMFF3dTRiNk1EZytuWXdQNFpqMW1OTXFO?=
 =?utf-8?B?WlZyNWJDM0dXZFMyck5JOFU2bXF2VlhXZEhIYVRJbHBycHI5UXNndWNYeEZr?=
 =?utf-8?B?cDRLUlBjS2dXTmZLUzRLbERBVG1zK3BHblpYTXZ6YWMwUjluWk1GQldudnl4?=
 =?utf-8?B?Rk9YYi9ObmsrZklRS09VazRGODV0aVdQNUxTQVNXQ2s2akZXMDFtWFZubXYy?=
 =?utf-8?B?UC9Va2EvTVlrWGZnL2ttMmVKQjBPaHdCL2hvVytkcEYvZ3pSQzB1dlE2SUpZ?=
 =?utf-8?B?WHNxYUxBUFF5bUM2VTNKc0p1enQ3REt2a1JHeEc1U3FoYXlKOUw5Y05ObXRU?=
 =?utf-8?B?RXlKY25FWEJ6bTVYYUNsVkdvMlpyRjI4cHBRaG9zR2RSbnpsNklDa3B0WWJE?=
 =?utf-8?B?amc4dlJTTFB6cHEvekp1TFlDb2tjZ2ZmSWNVakRkL3lPc2hOMjVRdnBldEJS?=
 =?utf-8?B?Z1FVVzNGMy9jTHJsSG11dU56T0ZKWEp6SFJTNjV1UDZodlVoWGkrZVMzdFpS?=
 =?utf-8?B?ZklUOVNSRUg3WDRTeER3bEpqTTJST01QeDdwWlN0a0ZkSDNHRWVUa0ExWTNO?=
 =?utf-8?B?TmlDTTdZSU9rc2tCUnp6TXhwZGFucG8rZWRib1piVW1STGJwbWwzOG5QTEx4?=
 =?utf-8?B?Y1IzOExOWUxMei9xeTJJc2dtME5LU01JdEhXQzFHeUsyV1drQ29xZGN1ajd6?=
 =?utf-8?B?UDdzNitFZ2pHNWVPU054Z1BFZVZBUm1vMUcycDJ1eGxmQ2YrQTA5SitwK0ow?=
 =?utf-8?B?NVc1UFZWckFIY0hWSWxyWk8rSGR0RTUvbVZvbWUvVWc5eXlCVFIySnMyTlNB?=
 =?utf-8?B?VnhybHRTR3p4emtoSHk1YitOY0dhdnJ5bE9YczVaUTVrY2Rpb1NoYUZwbVpw?=
 =?utf-8?B?MUZZZlNKMytMQ3ZRcEJROTV0Zm9Kc1Jmcit4Q3VzMCswVGNQbXRMUUlMVTly?=
 =?utf-8?B?RXJKblJUOHFDM2JCRUtvUlBhSmd6SnU3cTc0TmkrMnlFRG4zVzlnS2dMMjNV?=
 =?utf-8?B?MGxpK3N1dXFZT25uNi83TVl0VnF6R1B3MzBNalcrU0JYcmM5K3JyeXhaQXJI?=
 =?utf-8?B?ZFpTSkg0ZFRXNWdtUmxTeW9rcFBuTCs0MnpjRXJQYXJQTzIvd3E5VCs4UUlo?=
 =?utf-8?B?THc1aWx1UG42MU0wWVBnaUpyRE9lZS96SnUvRmRlNnY1RHpkc2w4aExka2Vy?=
 =?utf-8?B?NlV6em1od0ttUXZUTE1JbE9sSW5EZ1pMbXYrSUZZL0sxNDRkR3M0YXdLMXlD?=
 =?utf-8?B?cUZDWDhpMzZFRWhPQjg1OW4rTmhoYlFJc1ZEcEhlNUlBWFNWKzJ5eEJXMDg2?=
 =?utf-8?B?UDhMWW43OU14eUYzSDMyc3RqTXkvdk8rVjhlNGtnNDVIT0MvZzhRUW1vV252?=
 =?utf-8?B?R0ppejEzRHNXMzJGOFZqeUlPUFpNckx2VVpqS1YxN3Z4dmVnOXpRVG5UYTFZ?=
 =?utf-8?B?bytQK0ZNUElMeG1KT0hoeEJJdFJ2QzlTVVB0REF3TjhTMzFLSit2emd6bDBz?=
 =?utf-8?B?NExLTDdyRGxPU25oOGc2VEFockJYeW1MUlo0SnR4Tk5rQk81em9pTldMS1ht?=
 =?utf-8?B?NHpPd2VCNXcwR3hVcXJ4cTJpd3pnSytFRnhWRDVySktwRER2VHpNTDFVSUFh?=
 =?utf-8?B?T0gzamh0THoxMUxheWNVWFY5cWdSRFZ6QjVPcm1YelIrUmgxeE50SWpEM1px?=
 =?utf-8?B?bGpFVUtuWWtqejVnTmIrMkJ6SVNsaU5STDc2NktQQTNaVU5veVZIYk1xTGNM?=
 =?utf-8?B?TVFFR0didWRQeDVnWmNQOEYxSFM3UUIxbWVYVGkxR3cwTDl1dEhQYUN1NWha?=
 =?utf-8?B?dk81KzgyOXFWSlAwVys3NkFtYUJvcnQyN0FQdFE0VGZ6TVgxbzY1cEZKUUJV?=
 =?utf-8?B?dVI4Uk41TmtyeU82UFFiQWh1Z3pFVFBvNlMyNzc3TDF1UmhtV0VoUDRvbDFF?=
 =?utf-8?B?SlZPUkM1TTdVNkdnZzBvQkY2ZFhsR3JSbUNWVi9GOGNxVDNjU0V1QlZnNTF2?=
 =?utf-8?Q?t+A8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298db6b7-bbca-447f-1f57-08ddb8ba62c8
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:14:41.9256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0hocuklK/ea706tnE+iWWFyzrCvv92tumsyFJMas4V/ozh15l2um8TsIMcv7MxU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4412

Hi Reinette,

On 6/30/25 20:33, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/30/25 5:43 PM, Moger, Babu wrote:
>> On 6/25/2025 6:21 PM, Reinette Chatre wrote:
>>> On 6/13/25 2:05 PM, Babu Moger wrote:
> 
> ...
> 
>>>> +     * the assignment
>>>> +     */
>>>> +    list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
>>>> +        rdtgroup_assign_cntr(r, prgrp, mevt);
>>>> +
>>>> +        list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list)
>>>> +            rdtgroup_assign_cntr(r, crgrp, mevt);
>>>> +    }
>>>> +}
>>>> +
>>>> +static int resctrl_process_configs(char *tok, u32 *val)
>>>> +{
>>>> +    char *evt_str;
>>>> +    u32 temp_val;
>>>> +    bool found;
>>>> +    int i;
>>>> +
>>>> +next_config:
>>>> +    if (!tok || tok[0] == '\0')
>>>> +        return 0;
>>>> +
>>>> +    /* Start processing the strings for each memory transaction type */
>>>> +    evt_str = strim(strsep(&tok, ","));
>>>> +    found = false;
>>>> +    for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
>>>> +        if (!strcmp(mbm_config_values[i].name, evt_str)) {
>>>> +            temp_val = mbm_config_values[i].val;
>>>> +            found = true;
>>>> +            break;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    if (!found) {
>>>> +        rdt_last_cmd_printf("Invalid memory transaction type %s\n", evt_str);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    *val |= temp_val;
>>>
>>> This still returns a partially initialized value on failure. Please only set
>>> provided parameter on success.
>>
>> Yes. Changed it.
>>
>>  if (!tok || tok[0] == '\0') {
>>                *val = temp_val;
>>                return 0;
>>  }
> 
> You may just not have included this in your snippet, but please ensure temp_val is always
> initialized. Just this snippet on top of original patch risks using uninitialized variable.

Yes. Got it. Should have pasted the full change. Its taken care already.

> 
>>>> +
>>>> +    goto next_config;
>>>> +}
>>>> +
>>>> +static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
>>>> +                  size_t nbytes, loff_t off)
>>>> +{
>>>> +    struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>>>> +    struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
>>>
>>> With mon_evt::rid available it should not be necessary to hardcode the resource?
>>
>> changed it
>>
>>  r = resctrl_arch_get_resource(mevt->rid);
>>
>>> Do any of these new functions need a struct rdt_resource parameter in addition
>>> to struct mon_evt?
>>
>> We need to make a call resctrl_arch_mbm_cntr_assign_enabled(r)) to proceed. So we need  struct rdt_resource.
> 
> Understood, but since struct rdt_resource can be determined from mon_evt::rid
> it is not obvious to me that providing both is always needed by all these functions.
> 
Yes. Got it. Taken care of this.
-- 
Thanks
Babu Moger
