Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11022131.outbound.protection.outlook.com [40.93.200.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF59F1F5834
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.200.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750712225; cv=fail; b=dsCE9am+BnuQ/rbop5AWrXbUOZNz0bC3/UNsCYpWxmXK0FsXafuhWEI7eT3oIxIBtCz+LhSCrVym1gRT3+LT4g2fcyLP7duk9GYe/pQhp8Ec6ds0z1jEFBeZbHFZwRTqm5imniMUMsgI8dMR/0YdJc/evO8/9yDsurG1A7gBv/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750712225; c=relaxed/simple;
	bh=l3hDE6CS0u3fWO/OTW17odHgpp4fHoAA75Leojj7PEA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EpExwEIgoS1mDCCJnyDA7CTnbgqFDtsQrB6zrLppvAeUa3GH7xyUrJnATzj8PfAnM1jTl92Mvm5Xl/ctpzloOnhD2nTmtGLPlEFd7AGPKWjIXEaVzD5VwCcRu3n/d42GFCGF1fLb6TTITce13us2OQDBxASfSfcmXxjC0ojG70E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=MYpIL/bx; arc=fail smtp.client-ip=40.93.200.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="MYpIL/bx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2db27lnMkm0v3y/AbXGx9KA0NkPpoSnj0qiDNnOATzYX/R5buc849xF++MsA4HggKonWm3zXcxSW7pl5YN+9KuCQI+0UpDmL78x0CpsCxLERAFqk/B0NdQKJvsK07AbOHVGCCqvpIbejFnkxOnx1MwIqLxc8q9rvvZg2g9UscDVZDZ4fHCUD036u1inaNeLq/QNWnv4TLqhbeOyokDgYe7JriHvuz9L2/agZYeOqk3bhxD6Ne5oZsR9zTRXhPfRqHs8k90k32WNsY16WzUumzY/0oQoGmVPJ28OGiGb1ICYMpGKGfqYrTWzSvK9MKV+afHJ5yydCqFwsn5SJIbmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIsxXjSNfyM1KvGSe6iVwHLdKS+IOXyYbj+dKIDKiGM=;
 b=gn5W0e8WWFwmTo/JMJa8rGpuaLSofKQaxxiuf8p6jab8azfVi8W65NehvkXJ7GLLvjLu1FRUJNLvyRCYW8KwrBo6Z3/it7qu3WMvjoCacuoxGojpBvr6cYIbkl5bw5LjvJCxM0PFepUfmAZ/51nq7DFOgR20xBUtiQOjOgQ+/osyuYGlEB59RCNKN5QhSpyxzBk8S3wlgjc1W5Bb2+iEdvvPflyQzsP0U/klaCmzi5w7xkOJI3JiWClIWW3aKW3EYojxJTehbnROXQMPw9S57agOTGe+wlAojEuwpos250ZbjpY+WI61txNOILf4sS+x0yIszzbCxXJ7Qy1cm1x7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIsxXjSNfyM1KvGSe6iVwHLdKS+IOXyYbj+dKIDKiGM=;
 b=MYpIL/bx/ZsVJu6/v/NwepE0Y2S46LGRN+s3GMXfWYrcDqnma+IWcEFj3UyXblrqWB7RY2JQdLzUVAr252IegAKnZcu7kd7uLwizsuyjvoAq5LvLppUzZS0W7XbYcTEVOZopr/Fn71kVKAOmQWev6ukso5suGmr25JpgeBbMg5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BL4PR01MB9100.prod.exchangelabs.com (2603:10b6:208:58e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Mon, 23 Jun 2025 20:56:59 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 20:56:59 +0000
Message-ID: <e304762f-6d66-44f4-8fe4-7ca866f93d69@os.amperecomputing.com>
Date: Mon, 23 Jun 2025 13:56:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: mm: split linear mapping if BBML2 is not
 supported on secondary CPUs
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
 <20250531024545.1101304-5-yang@os.amperecomputing.com>
 <3bc77e2c-66d6-40d3-a30f-07139e8e8f43@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <3bc77e2c-66d6-40d3-a30f-07139e8e8f43@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::31) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BL4PR01MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5be724-5e5c-4c04-5107-08ddb2987f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZU9KVDA0MGcyMW93S1Q4MERHVmZmcVRhK3JUYkpGZmdoRmUxZHB5VjN6V3ZU?=
 =?utf-8?B?bmdISXliNDJGaEtxclJWUXFNMzFoUWtpSVFtcCsyVjB1VkpZK1U3VmxIWTNM?=
 =?utf-8?B?ZE1XeEovNkV5YTczUHdvdnlla0dCY2J2Q0hLU0F2L2dWVFIrVmdMYjdNcFZa?=
 =?utf-8?B?ZVQvRHVUK0NubXlGSVA5dTBaM1pQcCsxK0U1aWdJVkk2eW8xWGlsdkhNRzBl?=
 =?utf-8?B?Tms3NU5FMjB0U3lxK3hMNnlvZUJjb0pLN2grRkEwRndZZ3NmWXBPaUlYYktJ?=
 =?utf-8?B?dkQ4RXA0TUhta2hIY0ppaktzek9XWmhSeWpMbUhVL2FQUTRoNllwaXJ2QXFC?=
 =?utf-8?B?NTdyYktpNUZGazZsRU9qYVlieTVEbTNyNDdyVmsvZGF5WDU4MWdJcDEwQnZj?=
 =?utf-8?B?ZldFcWx5QXlhZDNhWktFUnp1YXkyU2ZoeW1VRjN3MUptSytIWmhPRG9HYzQy?=
 =?utf-8?B?VkI0WmFpbHVmR0t5TUR2WDdiLzlpalNCWExhMVRaNml2RVFHMWI1NFhReURT?=
 =?utf-8?B?VDExME9NSmpWUzEwYWhEU1ZXdXpMSElMSm5NelNIb1ZGQTVaS0F5cHIrVXlQ?=
 =?utf-8?B?YlBPQUZjZEgvSmZaVENKQzhwb0JhSFNuT1oxMk45REp5dUgySHowWC96WGJq?=
 =?utf-8?B?cDM4Y0tndUY1dFN1cmRnOEQrSkpXc0MvL1pRWUZlV3NYQXlvbXZJTmVUdktt?=
 =?utf-8?B?Um1oVDBYRFV4S0YyRnRVMkw2QmNObzVoUDVPQ0NyclFLOWcrRjQyemZWS1I2?=
 =?utf-8?B?MnZVbHlIRVlnQnRCN2FLeWFPMzliYmZ3MGdMYkZrWDZnWWRBNW5RU2pzd1Ew?=
 =?utf-8?B?cFlQUytMK0QxSTdERytiZjgwYmo0S2k3eHc3N3RIZkg1NENQbVlIR1NETG4x?=
 =?utf-8?B?bEtQS3hMaGNKQlhYTktEYVBmWC9jcm1aV05KTDFIZ2NGM1dnK0hvYW1aVjNr?=
 =?utf-8?B?M0tOMFdoa1FNdzEyMnM4R1doUE9acURZYmlxRUJWdzdxcU5rVnhNWWF2ZkpK?=
 =?utf-8?B?c2NadFBYZTFoS0FsQVcxbkh0NTBBbS9ZN2pmV2MvSXluTC9RYWQ5NUdScjA3?=
 =?utf-8?B?QmEvUGlyL0J6WUJYdHU5WGN3WjFQV2JDL1RMNThLYnZ6R0JBL1dYUUErVTd5?=
 =?utf-8?B?Zk1LTW5ScVV1c0ZkYkluZ3IvajZERENxazNWRlhySTROQURPMHA1WEw1Nm5B?=
 =?utf-8?B?aWxUaEhwQktzVmFXZmVFRHZ1M0ZhekFnZFBzUWNXRkdOVlM0M0JmbkViMWwv?=
 =?utf-8?B?aFFoSFpLditKcTk3Uk1mL1ZpMWJFeEZucnRoZmFLTE91dXlKOW55ZCtBS0k5?=
 =?utf-8?B?VFNTNFBla1paRnRiS2ljSFg0cXBIMHdBdEh0dWlkYXByZk5ncFduaVlDZ3lR?=
 =?utf-8?B?b3VmT2k0c1JIQUhHMDV4NHRYZ2M3QnhSdzl2L29WNEpPdGRNRnYweWdETDc1?=
 =?utf-8?B?aVlaMG83MHZ4TkRldXVRMlFXOVRKOWxRc1dCZW8yekp6UEJnQ2E0eHVDSjJn?=
 =?utf-8?B?WTVpS2FIVzFYMkhaL0ZiNnZCbFBWU2VkeFdPRXhhMjJ5dU84S2lKU1puREZq?=
 =?utf-8?B?S1YwdVQrZ012Yy95NFk2bC96UGZPUzY0bHN6TG5lV21lei9takZ6RTl0V3FG?=
 =?utf-8?B?L3pJai9wSDN5TTIwdXptOFQ3N0Nna1FaTEJEQWliUGgwbXpPM1N4ZHdiNUlQ?=
 =?utf-8?B?MCsxdmd5amtSVnJkT2c5TFFYczZiVlFmOXZpSzFhUXBCeU9WZmdxV1F6MWQ1?=
 =?utf-8?B?TVMvT3JBR3BaRmpGT1BxNjZtN1VYS2E1ZXUzL1lEUkRLbHlSL2I2VldnSHFp?=
 =?utf-8?B?Z0kwSGNhTUZWeFZNdzRlbmNVaEg1TGJNb0VWNnlGaE5aN09SY0dyVXMrVDl1?=
 =?utf-8?B?SGhUZ0trWGpXS3JZWTRJOFNxWmRoOWNnd2gvcXFHVzNvV2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THEvc0Fiem1MMmVWdzBOb1p6NXNSSnlPZGwrS0ZQbG1WcmFYRjRrb01DUGFG?=
 =?utf-8?B?RmJaTU5veS9QRnE4QW9qM1pENlg1bURNSUplL0hHMXJUZThadjgzVGRybmFY?=
 =?utf-8?B?SzE3OWNVRkRmeDJsUE9Rd1VpWDVjNUIyNHRrRG9ZMGUzY0FWWVVYZFlMTi95?=
 =?utf-8?B?akFmOVV6VU90VDQwWS9MR0NTeUhBcHN6TGh3dUVqZXUydU40aU92Vy9QSzZm?=
 =?utf-8?B?RmVRWnJsaGZkT0hFcVhDNk5uMU5uTklRUFozZ3p3ekhHaDUyOUc0RnBvTVJF?=
 =?utf-8?B?ekNJcEZiQjMyTWQ0NitHcEhIR2NaL2FxSUJsODR3ODVwQ09taTMwd0xSNE1a?=
 =?utf-8?B?Z01yTWg5Yk12Q2paTlpnNWppd096YmhlaTUxWisrK3BEMUhCNHIySGtvdUFP?=
 =?utf-8?B?NWQ4S0lhNEVUb2hnYzhJS21EWGVSRTdRVkhoeHdKcmtCOXNaeVZoa2plSWhY?=
 =?utf-8?B?QjBpK0JDbEltcEdBenZLUWtCSnlLMkowb21UMTkvTmx1THUyblhGU2VaM2JR?=
 =?utf-8?B?RWFQOU5VYjdzWGpLQlkrSTlJZjJnN2krbnF4MFBIMXZyUEV3MkYrTUZmd1ZI?=
 =?utf-8?B?WTN2L0s5bUpGc0k3ZGt2V2RPVzMzYUNNcXcyQkJFZVp2QUhVdE5wdFBESllM?=
 =?utf-8?B?M2dsSEZQVXpFa2tneG10ZXgyT0xDZ0pZcDMzSFVlN0RPeXN2MVlWM2kzdG9s?=
 =?utf-8?B?ZGlNQW11U0RnREdSKyt1bU5VaDJoM2E3WFRBb1FaQ1o1aXBXZGQ3bHVuVFE3?=
 =?utf-8?B?RW5LM1NlYXhoR2dmellyd1oyVjI3elZ0ZFc4dkc1aTBqN0JtZS9naXJnNVpt?=
 =?utf-8?B?am0yVEJMQzdoZ2o4bnUycUtQNHN1KzNWUzNQOWpWY2NHeWcrVlFRbTY3N3Ny?=
 =?utf-8?B?dXVFYjN4SjRETUhLMXhudnhxK05GYStZd3ZSTmhza3RRaFVBSGVLTldBSmdr?=
 =?utf-8?B?S2lFcFluY0J2Y0UveVh3THBBMUxVTWlOK3NxV05TNHMwTkVrYzZEdFpyOXRG?=
 =?utf-8?B?UFhyMVBPODRoL1gzOVBzUnlmYVk4NENQQkNmY2piMk9JSUN3QlJTZk9JbW9E?=
 =?utf-8?B?M2RFbXRyYzI2UHJ2T2RNckoyRUxkdExzcW5VVS9mZ0pmVnN5clF6SkNQRlhx?=
 =?utf-8?B?SnNNWU51SFU5Vk1Hd1d4WGg1R21jbG9icEFGNlQva0pzbFZSUElHRTdUTnVw?=
 =?utf-8?B?L2dKMXZCNmwrMlVNeE1CaUc4QkdqWXlDRXZ1UzRGRndyb2txdnVSWUxPdmpx?=
 =?utf-8?B?YmYrdGc2QmNqVXZQMXpvakJoSlZBTk1EUFpxU1BSY2prY3g0bHU2N3FPL3l5?=
 =?utf-8?B?aUFadnNRSmVnbVphc0prVjVaUEhSUi8xY3hiL1B5V082Zy9wdEtIYlMrelQv?=
 =?utf-8?B?T3ovamY2VTl5ajZvcnIwU0hxTnpKUDNteHB6TlVFckRqL1pyS3cwT3JtOUJ1?=
 =?utf-8?B?VmdBYnZkQXVXdTVvdHJSamNTcG4xK1A5R3E3UXR3eWN4OGV2YjBLbGFHcFBw?=
 =?utf-8?B?aDBCaS83T2plQnNXeHJyZkFhVzBoU3JrdVBYMlZhSmFGK1ozQitzM09oUVlY?=
 =?utf-8?B?dnJFVnlZbGFTZTREV0Z6RWZtZGdjdU9DRSthamh4OUVOYVpvbjIxdUVQNmtF?=
 =?utf-8?B?WDRiVjRwUzd5VDZ2V2wzdlFoeVQ4aFhHVDVnQ1ZIdktSNzA0RDhLeGVmKzFE?=
 =?utf-8?B?bm1Kdmdsc3hLcGloWWZyNW5RK3MrZkk5bmVxdk9XT2d4bWRlc0N0VWF3RDVl?=
 =?utf-8?B?d1ZPNHFLOG5taXZwUVdWLzQyNXFranB0SXgxcHpvVm4xdFJuNDUrNUhhOHln?=
 =?utf-8?B?T1oxQkswMUx5WnFuVjN6d0gya1NGNE9OSzd3eXpuS3ZGbDJtWWQ2WTNKNlNI?=
 =?utf-8?B?aS83NTQrV053ejFaMXRCRyt4Qng4elFKUVdaTm9xQ2lYZjk0aklpck9MalNp?=
 =?utf-8?B?cGsxNnVWUXE1Qjc1bG9EVjJZK3kxcGhiR0lsVG5aenFkVWlyZkg2M3pGYm5S?=
 =?utf-8?B?Z0dFR2xhRDBnODc4WWdhSk5ybVB3OVZROVZSaUliWEVNWlJMZk1sZ0N5bHFE?=
 =?utf-8?B?V0lWL0g0cXZhZ1Zla0ZJN2pRNnJTV1A4R0pBN2VGN0tCdGMzK1lmL0NOWDlB?=
 =?utf-8?B?VUNFY1NWaEtkRXQyelFsMHBNcHhHd0oyVWtTeDNWaHZQclFUSHNlT2FnV2No?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5be724-5e5c-4c04-5107-08ddb2987f23
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 20:56:59.5767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdGF4QbZBk44pyEt/hqy8NG4hiSI0WGNztwViUdiFbvar0ipHmiKETl8ppRKVPTXBHHvlDsNIq66MEI50bflJkT66D4SZYBDFjtxzqGKo/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR01MB9100



On 6/23/25 5:26 AM, Ryan Roberts wrote:
> On 31/05/2025 03:41, Yang Shi wrote:
>> The kernel linear mapping is painted in very early stage of system boot.
>> The cpufeature has not been finalized yet at this point.  So the linear
>> mapping is determined by the capability of boot CPU.  If the boot CPU
>> supports BBML2, large block mapping will be used for linear mapping.
>>
>> But the secondary CPUs may not support BBML2, so repaint the linear mapping
>> if large block mapping is used and the secondary CPUs don't support BBML2
>> once cpufeature is finalized on all CPUs.
>>
>> If the boot CPU doesn't support BBML2 or the secondary CPUs have the
>> same BBML2 capability with the boot CPU, repainting the linear mapping
>> is not needed.
>>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>>   arch/arm64/include/asm/mmu.h   |   3 +
>>   arch/arm64/kernel/cpufeature.c |  16 +++++
>>   arch/arm64/mm/mmu.c            | 108 ++++++++++++++++++++++++++++++++-
>>   arch/arm64/mm/proc.S           |  41 +++++++++++++
>>   4 files changed, 166 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
>> index 2693d63bf837..ad38135d1aa1 100644
>> --- a/arch/arm64/include/asm/mmu.h
>> +++ b/arch/arm64/include/asm/mmu.h
>> @@ -56,6 +56,8 @@ typedef struct {
>>    */
>>   #define ASID(mm)	(atomic64_read(&(mm)->context.id) & 0xffff)
>>   
>> +extern bool block_mapping;
> Is this really useful to cache? Why not just call force_pte_mapping() instead?
> Its the inverse. It's also not a great name for a global variable.

We can use force_pte_mapping().

>
> But perhaps it is better to cache a boolean that also reflects the bbml2 status:
>
> bool linear_map_requires_bbml2;
>
> Then create_idmap() will only bother to add to the idmap if there is a chance
> you will need to repaint. And repaint_linear_mappings() won't need to explcitly
> check !rodata_full.

OK, IIUC linear_map_requires_bbml2 = !force_pte_mapping() && rodata_full

>
> I think this can be __initdata too?

Yes, it is just used at bootup stage.

>
>> +
>>   static inline bool arm64_kernel_unmapped_at_el0(void)
>>   {
>>   	return alternative_has_cap_unlikely(ARM64_UNMAP_KERNEL_AT_EL0);
>> @@ -72,6 +74,7 @@ extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
>>   extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
>>   extern void mark_linear_text_alias_ro(void);
>>   extern int split_linear_mapping(unsigned long start, unsigned long end);
>> +extern int __repaint_linear_mappings(void *__unused);
> nit: "repaint_linear_mappings" is a bit vague. How about
> linear_map_split_to_ptes() or similar?

Sounds good to me.

>
>>   
>>   /*
>>    * This check is triggered during the early boot before the cpufeature
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 5fc2a4a804de..5151c101fbaf 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -85,6 +85,7 @@
>>   #include <asm/insn.h>
>>   #include <asm/kvm_host.h>
>>   #include <asm/mmu_context.h>
>> +#include <asm/mmu.h>
>>   #include <asm/mte.h>
>>   #include <asm/hypervisor.h>
>>   #include <asm/processor.h>
>> @@ -2005,6 +2006,20 @@ static int __init __kpti_install_ng_mappings(void *__unused)
>>   	return 0;
>>   }
>>   
>> +static void __init repaint_linear_mappings(void)
>> +{
>> +	if (!block_mapping)
>> +		return;
>> +
>> +	if (!rodata_full)
>> +		return;
>> +
>> +	if (system_supports_bbml2_noabort())
>> +		return;
>> +
>> +	stop_machine(__repaint_linear_mappings, NULL, cpu_online_mask);
> With the above suggestions, I think this can be simplified to something like:
>
> static void __init linear_map_maybe_split_to_ptes(void)
> {
> 	if (linear_map_requires_bbml2 && !system_supports_bbml2_noabort())
> 		stop_machine(linear_map_split_to_ptes, NULL, cpu_online_mask);
> }

Yeah, ack.

>
>> +}
>> +
>>   static void __init kpti_install_ng_mappings(void)
>>   {
>>   	/* Check whether KPTI is going to be used */
>> @@ -3868,6 +3883,7 @@ void __init setup_system_features(void)
>>   {
>>   	setup_system_capabilities();
>>   
>> +	repaint_linear_mappings();
>>   	kpti_install_ng_mappings();
>>   
>>   	sve_setup();
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 4c5d3aa35d62..3922af89abbb 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -209,6 +209,8 @@ static void split_pmd(pmd_t pmd, phys_addr_t pte_phys, int flags)
>>   	/* It must be naturally aligned if PMD is leaf */
>>   	if ((flags & NO_CONT_MAPPINGS) == 0)
>>   		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>> +	else
>> +		prot = __pgprot(pgprot_val(prot) & ~PTE_CONT);
>>   
>>   	for (int i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
>>   		__set_pte_nosync(ptep, pfn_pte(pfn, prot));
>> @@ -230,6 +232,8 @@ static void split_pud(pud_t pud, phys_addr_t pmd_phys, int flags)
>>   	/* It must be naturally aligned if PUD is leaf */
>>   	if ((flags & NO_CONT_MAPPINGS) == 0)
>>   		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>> +	else
>> +		prot = __pgprot(pgprot_val(prot) & ~PTE_CONT);
>>   
>>   	for (int i = 0; i < PTRS_PER_PMD; i++, pmdp++) {
>>   		__set_pmd_nosync(pmdp, pfn_pmd(pfn, prot));
>> @@ -833,6 +837,86 @@ void __init mark_linear_text_alias_ro(void)
>>   			    PAGE_KERNEL_RO);
>>   }
>>   
>> +static phys_addr_t repaint_pgtable_alloc(int shift)
>> +{
>> +	void *ptr;
>> +
>> +	ptr = (void *)__get_free_page(GFP_ATOMIC);
>> +	if (!ptr)
>> +		return -1;
>> +
>> +	return __pa(ptr);
>> +}
>> +
>> +extern u32 repaint_done;
>> +
>> +int __init __repaint_linear_mappings(void *__unused)
>> +{
>> +	typedef void (repaint_wait_fn)(void);
>> +	extern repaint_wait_fn bbml2_wait_for_repainting;
>> +	repaint_wait_fn *wait_fn;
>> +
>> +	phys_addr_t kernel_start = __pa_symbol(_stext);
>> +	phys_addr_t kernel_end = __pa_symbol(__init_begin);
>> +	phys_addr_t start, end;
>> +	unsigned long vstart, vend;
>> +	u64 i;
>> +	int ret;
>> +	int flags = NO_EXEC_MAPPINGS | NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS |
>> +		    SPLIT_MAPPINGS;
>> +	int cpu = smp_processor_id();
> nit: most of these variables are only needed by cpu 0 so you could defer their
> initialization until inside the if condition below.

OK

>
>> +
>> +	wait_fn = (void *)__pa_symbol(bbml2_wait_for_repainting);
>> +
>> +	/*
>> +	 * Repainting just can be run on CPU 0 because we just can be sure
>> +	 * CPU 0 supports BBML2.
>> +	 */
>> +	if (!cpu) {
>> +		/*
>> +		 * Wait for all secondary CPUs get prepared for repainting
>> +		 * the linear mapping.
>> +		 */
>> +wait_for_secondary:
>> +		if (READ_ONCE(repaint_done) != num_online_cpus())
>> +			goto wait_for_secondary;
> This feels suspect when comparing against the assembly code that does a similar
> sync operation in idmap_kpti_install_ng_mappings:
>
> 	/* We're the boot CPU. Wait for the others to catch up */
> 	sevl
> 1:	wfe
> 	ldaxr	w17, [flag_ptr]
> 	eor	w17, w17, num_cpus
> 	cbnz	w17, 1b
>
> The acquire semantics of the ldaxr are needed here to ensure that program-order
> future memory accesses don't get reordered before. READ_ONCE() is relaxed so
> permits reordering.
>
> The wfe means the CPU is not just furiously spinning, but actually waiting for a
> secondary cpu exclusively write to the variable at flag_ptr.
>
> I think you can drop the whole loop and just call:
>
> 	smp_cond_load_acquire(&repaint_done, VAL == num_online_cpus());

Yeah, it seems better.

>
>> +
>> +		memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
>> +		/* Split the whole linear mapping */
>> +		for_each_mem_range(i, &start, &end) {
>> +			if (start >= end)
>> +				return -EINVAL;
>> +
>> +			vstart = __phys_to_virt(start);
>> +			vend = __phys_to_virt(end);
>> +			ret = __create_pgd_mapping_locked(init_mm.pgd, start,
>> +					vstart, (end - start), __pgprot(0),
>> +					repaint_pgtable_alloc, flags);
>> +			if (ret)
>> +				panic("Failed to split linear mappings\n");
>> +
>> +			flush_tlb_kernel_range(vstart, vend);
>> +		}
>> +		memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
> You're relyng on the memblock API here. Is that valid, given we are quite late
> into the boot at this point and we have transferred control to the buddy?

Yes, it is still valid at this point. The memblock won't be discarded 
until page_alloc_init_late(), it is called after smp_init(). And whether 
discarding memblock also depends on !CONFIG_ARCH_KEEP_MEMBLOCK, however 
arm64 (and some other arches, i.e. x86, riscv, etc) selects this config. 
It means memblock is always valid.

>
> I was thinking you would just need to traverse the the linear map region of the
> kernel page table, splitting each large leaf you find into the next size down?

The benefit with using memblock is we can easily skip the memory for 
kernel itself. Kernel itself is always mapped by block mappings, we 
don't want to split it. Traversing page table is hard to tell whether 
the mapping is for kernel itself or not.

>
>> +
>> +		WRITE_ONCE(repaint_done, 0);
> I think this depends on the dsb(ish) in flush_tlb_kernel_range() to ensure it is
> not re-ordered before any pgtable split operations? Might be worth a comment.

Sure.

>
>
>> +	} else {
>> +		/*
>> +		 * The secondary CPUs can't run in the same address space
>> +		 * with CPU 0 because accessing the linear mapping address
>> +		 * when CPU 0 is repainting it is not safe.
>> +		 *
>> +		 * Let the secondary CPUs run busy loop in idmap address
>> +		 * space when repainting is ongoing.
>> +		 */
>> +		cpu_install_idmap();
>> +		wait_fn();
>> +		cpu_uninstall_idmap();
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   #ifdef CONFIG_KFENCE
>>   
>>   bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
>> @@ -887,6 +971,8 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
>>   
>>   #endif /* CONFIG_KFENCE */
>>   
>> +bool block_mapping;
>> +>  static inline bool force_pte_mapping(void)
>>   {
>>   	/*
>> @@ -915,6 +1001,8 @@ static void __init map_mem(pgd_t *pgdp)
>>   	int flags = NO_EXEC_MAPPINGS;
>>   	u64 i;
>>   
>> +	block_mapping = true;
>> +
>>   	/*
>>   	 * Setting hierarchical PXNTable attributes on table entries covering
>>   	 * the linear region is only possible if it is guaranteed that no table
>> @@ -930,8 +1018,10 @@ static void __init map_mem(pgd_t *pgdp)
>>   
>>   	early_kfence_pool = arm64_kfence_alloc_pool();
>>   
>> -	if (force_pte_mapping())
>> +	if (force_pte_mapping()) {
>> +		block_mapping = false;
>>   		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>> +	}
>>   
>>   	/*
>>   	 * Take care not to create a writable alias for the
>> @@ -1063,7 +1153,8 @@ void __pi_map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
>>   		    int level, pte_t *tbl, bool may_use_cont, u64 va_offset);
>>   
>>   static u8 idmap_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init,
>> -	  kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init;
>> +	  kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init,
>> +	  bbml2_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init;
>>   
>>   static void __init create_idmap(void)
>>   {
>> @@ -1088,6 +1179,19 @@ static void __init create_idmap(void)
>>   			       IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
>>   			       __phys_to_virt(ptep) - ptep);
>>   	}
>> +
>> +	/*
>> +	 * Setup idmap mapping for repaint_done flag.  It will be used if
>> +	 * repainting the linear mapping is needed later.
>> +	 */
>> +	if (block_mapping) {
>> +		u64 pa = __pa_symbol(&repaint_done);
>> +		ptep = __pa_symbol(bbml2_ptes);
>> +
>> +		__pi_map_range(&ptep, pa, pa + sizeof(u32), pa, PAGE_KERNEL,
>> +			       IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
>> +			       __phys_to_virt(ptep) - ptep);
>> +	}
>>   }
>>   
>>   void __init paging_init(void)
>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>> index fb30c8804f87..c40e6126c093 100644
>> --- a/arch/arm64/mm/proc.S
>> +++ b/arch/arm64/mm/proc.S
>> @@ -440,6 +440,47 @@ SYM_FUNC_END(idmap_kpti_install_ng_mappings)
>>   	.popsection
>>   #endif
>>   
>> +/*
>> + * Wait for repainting is done. Run on secondary CPUs
>> + * only.
>> + */
>> +	.pushsection	".data", "aw", %progbits
>> +SYM_DATA(repaint_done, .long 1)
>> +	.popsection
>> +
>> +	.pushsection ".idmap.text", "a"
>> +SYM_TYPED_FUNC_START(bbml2_wait_for_repainting)
>> +	swapper_ttb	.req	x0
>> +	flag_ptr	.req	x1
>> +
>> +	mrs	swapper_ttb, ttbr1_el1
>> +	adr_l	flag_ptr, repaint_done
>> +
>> +	/* Uninstall swapper before surgery begins */
>> +	__idmap_cpu_set_reserved_ttbr1 x16, x17
>> +
>> +	/* Increment the flag to let the boot CPU we're ready */
>> +1:	ldxr	w16, [flag_ptr]
>> +	add	w16, w16, #1
>> +	stxr	w17, w16, [flag_ptr]
>> +	cbnz	w17, 1b
>> +
>> +	/* Wait for the boot CPU to finish repainting */
>> +	sevl
>> +1:	wfe
>> +	ldxr	w16, [flag_ptr]
>> +	cbnz	w16, 1b
>> +
>> +	/* All done, act like nothing happened */
>> +	msr	ttbr1_el1, swapper_ttb
>> +	isb
>> +	ret
>> +
>> +	.unreq	swapper_ttb
>> +	.unreq	flag_ptr
>> +SYM_FUNC_END(bbml2_wait_for_repainting)
>> +	.popsection
> This is identical to __idmap_kpti_secondary. Can't we just refactor it into a
> common function? I think you can even reuse the same refcount variable (i.e. no
> need for both repaint_done and __idmap_kpti_flag).

I think we can extract the below busy-loop logic into a macro:

         .macro wait_for_boot_cpu, swapper_ttb, flag_ptr
         /* Uninstall swapper before surgery begins */
         __idmap_cpu_set_reserved_ttbr1 x16, x17

         /* Increment the flag to let the boot CPU we're ready */
1:      ldxr    w16, [flag_ptr]
         add     w16, w16, #1
         stxr    w17, w16, [flag_ptr]
         cbnz    w17, 1b

         /* Wait for the boot CPU to finish messing around with swapper */
         sevl
1:      wfe
         ldxr    w16, [flag_ptr]
         cbnz    w16, 1b

         /* All done, act like nothing happened */
         msr     ttbr1_el1, swapper_ttb
         isb
         ret
         .endm

Then kpti and repainting can just call this macro so that we don't have 
to keep both them use the same registers for swapper_ttb and flag_ptr 
parameters.

Thanks,
Yang


>
> Thanks,
> Ryan
>
>
>> +
>>   /*
>>    *	__cpu_setup
>>    *

