Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0483633EC;
	Fri,  7 Feb 2025 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738948701; cv=fail; b=R2jiifo0Ol7s1CCKG+sxoOovB8SA52hBNcd3UR/31StHRJUb/P1oUVL/guo4gag+Kni1OcB6EUdZtW9ECe0baVYHHLVPGhGBQCyl42KKF/DqkRRa04k80mxu/9cLcP2TMZ6dvD0r0wFKz6pglE9b0psPReXl5JnlJfI/LWQYzLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738948701; c=relaxed/simple;
	bh=MDhFdijp+4wPGvmk89ftsrW+HROyFVQjkFetyZjNmcM=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TErnu3bDpZgEm/Lfkr1+bXggmWpockn7ewD8iIuGAAQAGgFTkYCVH1QZBgAegLR32q85sTyEiYjlUGfxxZwQnDu3X9sY23QK0WXxGh9/Yw7r8N2qvhLIUeyPbKTW/tB7w5IpMBJ/rKZMawIkZlDqbX3Y3tLtgyrE6B3aNly7vVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=19V9vCHz; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="19V9vCHz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwpb5NK0Wfy7/gbNQoh7nsBfPQXT6lyPigZl8JXNsBqQ5/YtoCI2c8c3rEIIHwJMxQB/XMP5YqYayc3/+chU6JO4z2leUkXG8YSqEh+W2MaWAQcFaSli+YVR+3rwk2ov+uucyJ1x8DLkPv8WV36sC11t585ByI0C/KqU9DOw7F2jDO2hNgV9YDSPKGH5pbfKzDdxOM8DjC36SdYJp/QUr7zJldpG385uHgwHGY8IGqviCuW51ff7wrGLuMl+SItiEvBTHwgByyL1yqet8c+H9vJE6bbhs2NS2QPZrRsNgyqFOgKMDOe20aznONYyNx5tpMmEhMrUOFZkRO5rGlGNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrbTLC2gIw4tKslC6KyiE17JWFheQ55qRG7b4RlB3zw=;
 b=IlTbGMT+lJSX+kqHR7sod2JQGe7IwOOWQ9dlG940gV0kTt0S/dEJmPr9ce0297h83hPXly/oXrYKZRCYglZAjhnhqIYhBlG7mfPPyNKWbOEFGTiga7Wx91S5N4XCBTQ4wcNnXsc+QXi3KhRbc3AH3PikOcj5A5pag7WRFhz8XZ0TIP8lulL1Uy2S6sKxOTjyDSHT6rZh3X1QR/mtQw08fdrFX2S4dfvzo1zO83LoBX6y2APn954vTH38N7tnc1OdZs36dtKe7HQ8QGeXbyNxT7qmAOzS9dxHZjMuC8k9yKJqCKQ4loYuBCpmjb0SgkQzHoWNGt83pAHe4G7TvVmWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrbTLC2gIw4tKslC6KyiE17JWFheQ55qRG7b4RlB3zw=;
 b=19V9vCHzILXBP0ZBYhoD0pBRSXh3I6Iel8uki6UvOUol3Irvt0ers5nkSRs1zVg3WzBwWyXsT/HeGxGSrzcSXlCpl2AsoejdM3IHCFlWYxqbFwf/yHw4Tr+T/IZS9DFL/PvN8pGCEo9hvxH6SKET1rlWHvUUTTT50594XoUYJqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 17:18:17 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 17:18:17 +0000
Message-ID: <a6120ad5-c9fc-48cd-b2a6-cfb7ac33100a@amd.com>
Date: Fri, 7 Feb 2025 11:18:11 -0600
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <bmoger@amd.com>
Subject: Re: [PATCH v11 08/23] x86/resctrl: Introduce interface to display
 number of monitoring counters
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
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
 <80457612b98078bd7786c73f83775e4de86c699e.1737577229.git.babu.moger@amd.com>
 <6376ea35-4ce7-4ac1-967b-97f2728228e3@intel.com>
Content-Language: en-US
In-Reply-To: <6376ea35-4ce7-4ac1-967b-97f2728228e3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:806:121::14) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SJ0PR12MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e493640-8df0-4658-6e64-08dd479b6948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekFKZlVMT0RSeWVmc2NRNmMyTURvVmZwVm1RWCtrUUc1YzVqMGZ5bVpnUGtG?=
 =?utf-8?B?VkdkR05zVWZGWjhxV05OYmo1bFAwbVg5NUhVL2tNa25UclhTdGRRcUdnZWVD?=
 =?utf-8?B?ZytySnNOOHNyQjFXOXhabEhRTTFzak1xdDI5dytxZ0hGTFFBYjVYL3k2djND?=
 =?utf-8?B?U0dySlhQL3dvekZyVjRIemNYb25ZeHF4c1lGMnpCaFNYRWtSdEd6dE9MWU4y?=
 =?utf-8?B?bzVhdi9hMHBLVENOdGRZajUzcjA0dEl4d0hWZWh4TEdSalhUdEJmUW9vSVBP?=
 =?utf-8?B?Tk5tL1hRTUROUEkvSkhQVEN1TkFuT3JFbE1tTWw4MjllRVMxU1orNnA3Zkx0?=
 =?utf-8?B?dFR3b0tuQzM3ZjBOY1JyQVRZS2cvTTB2UCtrelhqd01qRUV6YWZ4WjMxWmVE?=
 =?utf-8?B?R096T2NGVjBIYk5NSFNKN3lWTnBocXpxWEF1b1VtN1NtQXpQMG1aUDJZNzVP?=
 =?utf-8?B?ME53YkQybGFHNkJBektXdzlzemY2Znk1ckY5SEdOMHkxYmkwa09iRndIaTZ6?=
 =?utf-8?B?ZExnc0hjWkF0TFlpMFZORnRJWDJTYXNXWWdoUWt1Q2VUcDJydFJKRmJWYktQ?=
 =?utf-8?B?eW5IWFdQRHVWdUFld3Rhd1dTcW0vMWRhd1BBaVZwYUJlTjR1SXR4bWtPVXhN?=
 =?utf-8?B?NndyR2VseDAyQnhLM3BKQVBlZG5WNUlZektLTU9Weis3bDlGTzRrWmhEb3lu?=
 =?utf-8?B?bXVxSlQrblVCcThPTXpmQWtTRlJoZDZzSEV0bE9BWnd2NExSakxRUGVORjRq?=
 =?utf-8?B?dEM3M3FMY3lXRGNNMzhiNS8yUzlGamxmVFcxbzFZMGp2eEVET2NiOWsrSnBY?=
 =?utf-8?B?YnVlZm1LNTdPT25SMlMzRjVVMU41V1EweUtPbHdUZzV4bzBMU3l4Z0IyWHRw?=
 =?utf-8?B?bXBwUEZCdzVmMXZqSWtQRDNPVTdqN3VMSzI2QzdrSGZ2ZW5DK0ZheCtPTEk0?=
 =?utf-8?B?MUJvNldaU1RCdmRxZmJUd3B5S3U3dUMrMGE2UHd1czF4djQya3FwZGw5ajFX?=
 =?utf-8?B?ZFRaei9nUEtDNHhVeTFxRFZJTFRYR3VBdWd4WTY0U2tGUnd4NVNUUXdtUG9o?=
 =?utf-8?B?VEozaEIwWkwyelIyeEppQUJTdHl6MFR5YmJhSFpQQkR4eTh0dHJmT25IOHdQ?=
 =?utf-8?B?NElXY2xGNkcvK0Z1UUZ5Z1VYb1pNR0FyWmE3NEwvRk1kM1hKeldxd3FlY2Rt?=
 =?utf-8?B?RGExWWI5SmhHM3ZrQUNpR0luVno0RjhWWE1ERGV3cmFmM2VQdDlWdzBRM2ZF?=
 =?utf-8?B?Q3hsVDc0WEluWkZTV0ozWUUrQlhUb2xXNFFuL3hmTnVCbEd6RlZ3QUpMUGtJ?=
 =?utf-8?B?NW8xb1FJUjE2WVlCM3JhTkhTM1JTRERnaDR2S1VJRkdRQmZYdXhQUlFRUm5W?=
 =?utf-8?B?eStTWnJzdmRYQXJXVmdJMGhTeUR0Y2V5ZU9RK3BvK0p5Y2dTUWlDaFFOcytj?=
 =?utf-8?B?c05ZWkZNQnpLOUdoYjdCK0pyS3ZkUWZXeVI0cndGTXh1cGx4UjQwRktiWnAv?=
 =?utf-8?B?NFk3OEhmcEgycC94MjEyZjIzTWp0WThUL1NwaERTM254YWdyZ0ZFUUtJSENW?=
 =?utf-8?B?TlAvNEZDL3V1UDl2bHdUT2hJbW5NSjhUNFMxUVRIZ1dLTG9VSjUvMVRVR1dJ?=
 =?utf-8?B?NkE0aDJGK0FkS2JQdzFNUjlLdXRoWVdpb25FRy83ejBmYTJCT0F0TVhtYXpP?=
 =?utf-8?B?ZjFNN1FtRFhRTHJXblhoZ3hHME5aeVJlM2IzdDhqTVZuUWVVaCtPUWx4VFda?=
 =?utf-8?B?Wkh4cGNYK3JvRTJxQVljQzMweWJveVRjd0V5c1dvM2FWcGgrL0twdGlKVWtp?=
 =?utf-8?B?dHdUUlVNNGk2TWoveUYyNXE5VTlBNFN3YkhTRkdFMDV0YTl3ZmlORklkd29i?=
 =?utf-8?Q?kt+2T3NveJCfV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjR1eURMYjNsWTdyQVZYQXR3ZUxTL0JpTTM2U2JiRjRmWVFzWmRXUzhqUmw5?=
 =?utf-8?B?OWhkbDVnRHY3OXlFbEgvVGN6THdVZ3dCajBZaDdaUUF0K3ViWllYNy8ybXBQ?=
 =?utf-8?B?d3k5Ly9BUkZDL0JsUGt0Ry90dFdQZHp6ZHFOTDExczRqMlQ2K2pCbTM4S2pT?=
 =?utf-8?B?YVozT3NoRHpzUDd5SzAxU0FTQ1lqeUEwT0R3QlpvQWJCWWgwTk13Zjh1YnF3?=
 =?utf-8?B?Z1ZULzcrcncxbnBacXFvVWVIY2VHSEpyUzdqdFJENFE0QmNEZ2lmMmQ4TUpX?=
 =?utf-8?B?YW5jNDQrT0NTZHExeVJReDV3RG8vbmhtTFZZT3UyNzJKSHNCekVTVXZ6NUJR?=
 =?utf-8?B?ZVpnZ2drRVl2MS9US3RFVE42UlAzYkI1MkliWEV2eCtWb05EVlhXYW41cUlh?=
 =?utf-8?B?VmJCMUxUNDNEM1hMMHJ5TDNibm1pM1FsZzhSMWU0TGpNY2NGWWp5bUpVRmF4?=
 =?utf-8?B?RG5XczdhZzZCVEtjcytpRnRtZGVGb3d2OUdJZlBQV2ZSV3V3VzJCSWtlcGpY?=
 =?utf-8?B?T2pCTHIxUXozbi8rZHRoRmRoblFlYkdHSG9ORmowcFlwTkhac2lkV2w3Nmhr?=
 =?utf-8?B?Skk0OWd4NUc4czdrNEIxYUhscVphOWMyN2RkZ2NldVRWK0F5RGpLZGFuSEpu?=
 =?utf-8?B?d1FoMUFmeExIakU3a0g4czMrZGpDTldqeUs3TlJlUERWUUk3Nk1QejRkY2RB?=
 =?utf-8?B?diszZjd0My9Sem8rblpEZmp3T0VQUXF1S3ZadzlXZitBa1o3SFZocjh2ZC9q?=
 =?utf-8?B?d2xOZ2JEM28yYkU4c042TnFQbHc3RVc1Vk42UGk1cWtMN05pcW1yVWVkc3Jt?=
 =?utf-8?B?dElaZmxGZG8zSDE1MjI2YWJxa2UreXQ0SjJ0SXRPN3Y2NnBRdytlcFVFbjY2?=
 =?utf-8?B?SmpVQ2FEcng0WEZGaUkzWWZqYUpJMFkyaUhJeWhhMHM3dFhOTHNqbTNHclFV?=
 =?utf-8?B?K2pneGNtMVUwbnhaVlBvaWdhM2hHYzBVdXlvTTZXbGEzZzZlak5CM3BwZG1l?=
 =?utf-8?B?M0R4VHNGR2REeUdOdnplSzQyWStpKzF2aDRLSldGSmZjci9lcWtVVUdmZXZs?=
 =?utf-8?B?a2hrbUxwdDZtYm83dk1tajdiN25kYmNGMlVaU1ZpcGt0a1VuczhQYlY0MVhT?=
 =?utf-8?B?K3kyeERnSEErOTV3ZmNBMk8yTWdwb3N1WDdjRXVwbnYySHNKQk9XR3djVGlu?=
 =?utf-8?B?WGViYVU1dkdUTGp0cFd0MjVXZmV2cXVPWkhZVGtkZnV5R3F6MXBPVnBxT3Bk?=
 =?utf-8?B?SmxxS3ZscW94RTZqYklpaTgxUG00dExMYXVjbGxSZVZXdGVJUkV4YUZqWTFq?=
 =?utf-8?B?RjJOUklRMWdpQjV6N0xHRm0xZXhCc0xib0F6V0FwTVhLOFVaR0NGc3UwZkVy?=
 =?utf-8?B?KzZIV2NSRjRpMVJPWUR6a09tVGRQYzZTSXJLQTdrVHkzY2NBT2dNZFQyYlBE?=
 =?utf-8?B?MHh5UUg5L1Q5S0h3dmFSZUhKa3kxOW5zdW4zRCtWaDR2VmsxWC81RDQ3Nnp0?=
 =?utf-8?B?VDlybWJtNENpQWE5YXcyMmZoTG5Hc05kdUx5OEg3NE9YckZFdENQVEs5d3JE?=
 =?utf-8?B?REFvWDUrdWVpSXZmSS9vcFhzZmlkUG50V0U3Mkd2alZ3VVpkK1hoV0lEOTM1?=
 =?utf-8?B?a3A4WDF6MURKZXo0SXJ2V29FZ29WWXlZR2JEbnlWUkk5L05EZk1XVis0eVBu?=
 =?utf-8?B?N0dGcFU1SE5JL3NMZDRydVRBaXBmbVdyK2t6ay9Sb2Z6N201Mm1uTWxzTHhG?=
 =?utf-8?B?VHV5STI3cEJBQy9Lako0VkhjVzNWT3ZEMlU1VWNFSzZPSm9SMmI3OVM1UnN5?=
 =?utf-8?B?SUs5ZTlucTBnbEFEVmY0V3NvUUR6QWs5WkJxWDVKT3kzeFVoRnVwYjlFVXRo?=
 =?utf-8?B?VjVGVC90ZXUyRENKRHo0ekVlbEEzVU5TTGlaWlhCN21kKzBHRmZFSDVZV0JR?=
 =?utf-8?B?Z0ZMSmRCNmhPeC9UVVc0MTlqQWtyVVgxYkFtVWdiOFhPdzhIY3pEejlhV05Z?=
 =?utf-8?B?eFZ6YzdtaWsrbkhoWm85OFZ0bzZ6TFBRU09ZNHZHQ3JpZlcvRkhUWGF3WFJR?=
 =?utf-8?B?ZGtKbXQ1aW1VamMxVm1qd3luSG5WamZPSWxvSzN2Y1EwSjlzdjU1WlJad2Mx?=
 =?utf-8?Q?AFnM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e493640-8df0-4658-6e64-08dd479b6948
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 17:18:17.0270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryim2wxppvGth5HkUElCJkSfPm/PnhPdY6DWuLwC1e8oVqn3iNRetipfC2UrqvCa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6855

Hi Reinette,

On 2/5/2025 5:17 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode provides an option to the user to assign a
>> counter to an RMID, event pair and monitor the bandwidth as long as
>> the counter is assigned. Number of assignments depend on number of
>> monitoring counters available.
>>
>> Provide the interface to display the number of monitoring counters
>> supported. The resctrl file 'num_mbm_cntrs' is visible to user space
>> when the system supports mbm_cntr_assign mode.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index b5defc5bce0e..31ff764deeeb 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -283,6 +283,22 @@ with the following files:
>>   	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
>>   	there is no counter associated with that event.
>>   
>> +"num_mbm_cntrs":
>> +	The number of monitoring counters available for assignment when the
>> +	system supports mbm_cntr_assign mode.
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>> +	  32
>> +
>> +	The resctrl file system supports tracking up to two memory bandwidth
>> +	events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
>> +	Up to two counters can be assigned per monitoring group, one for each
>> +	memory bandwidth event. More monitoring groups can be tracked by
>> +	assigning one counter per monitoring group. However, doing so limits
>> +	memory bandwidth tracking to a single memory bandwidth event per
>> +	monitoring group.
>> +
> 
> This text needs an update to reflect the switch to per-domain counter assignment.

Does this look ok? Just added domain in the text.

"The number of monitoring counters available in each domain for 
assignment when the system supports mbm_cntr_assign mode.
::
   # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
   32

The resctrl file system supports tracking up to two memory bandwidth
events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
Up to two counters can be assigned per monitoring group, one for each
memory bandwidth event in each domain. More monitoring groups can be 
tracked by assigning one counter per monitoring group. However, doing so 
limits memory bandwidth tracking to a single memory bandwidth event per
monitoring group."


Thanks
Babu
