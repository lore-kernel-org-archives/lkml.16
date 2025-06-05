Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9542C324C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 02:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749091229; cv=fail; b=nuzjvPnZEFR/wWBWmR+OUK/4qnrcDqXt+dztZPxkmFe5oA70Wujw0aWNKZBa9HFXRQ0D598vBVr1LcleBWExBtCyVt+KcFkyP8DUhszNcg0oFXXo30W+DKYjxnb1x3IrFCphH94jafjdN/YqjpD8nzp00TrUasaIsxv5WBx9YSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749091229; c=relaxed/simple;
	bh=stK2QnAxcwcErCovt1AQxe4017ZDmhgYOUWv9urXdZE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XktJMP2DPTj7st6x+qRwYIdtWLHrCJapeEKNb0OI6O+JVKJs8LstIcsvU1AySpoMVlZwyZ1Ti2pvsf0utzyJN0gsgD6UroVBIB/CyP6OZo5KdQKfKnstl6xXvOPQjA0iA47w4L4KITGdK86SmvbTSRO8G/jZzRgELsl9d3UxqcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yn2jvELG; arc=fail smtp.client-ip=40.107.93.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yn2jvELG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcINJLtX+r1+hYdOgKxAKqiMAytJ+kmEbQae40mgbPBcJYpvbjm9HEgGyBy/mS0Hp7xqIOdMOVKErFDdLDHT6doHJeDfCZlsT82u8OvjdkUiRA+b9/95kFp1hBc69UlbrtsEUg4mauZ0CfZdh+A4cMoMs2I9YQWMpms+UGSZOkhG54aJD50r/UGOUsraiUkkk3bYmR4945toYT34eAkUAOO8GHcAcF8QCc1XA1roVRsrbjSb4CanY7EOVu9PPmU3++lDI80Z7nYQpOutLWPyKh5ecpj7sOyhyukzDAQhBFHCE/mSUIzI4ZYTY3XILsTumSTKcp/dTq7m85obEmtsnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ER08pZHmspDbfe/so8x25etR+Pe8T3zNh8ZksO/+Y94=;
 b=xez2K/NZWgsapS4n3jQ+WzvVjXiREL7CPVIgAUrO+o6DJsxE20MQaHu+OmdN2+8iD815kZKX3nbsrvGWfkr3l9+cZKe7SyJueFzUlRZhbpxvMa6fmjJuknYzoPs0kbctNja01CwctRTpOW/lDw17Wsc+6wX4cUfUarrggOTA43LbepVykadQfCHfImPDCipWa1Qfzc+ZfXkdl0wl3wn02s5jnv2boaDzxcFt0pd11HCw6uHPwP05HRdplbG2BrxHunaclpvR4LIhl9vc6sZDVD37qCJk/Z1HkxLyykLsV3D632a0Rl/lvBsih5DoTBRbDTF/ljGi/ZJFtFak3KnZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ER08pZHmspDbfe/so8x25etR+Pe8T3zNh8ZksO/+Y94=;
 b=yn2jvELGFiKVU6qQP7VV4IB2iNFYyfG8wjz/8WubgCpHIDgphGDxsQkSBYShF8mRPzv5XtxOUptrjsDzFKDskm/WTiOVDJVimclxMGit9bqpvSbnzBxGZFJBK1IqmknFKn9MCSRiPh+Fc9gx3fynIe+6g1tnyIj4f0ntoZCjC1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by MW4PR12MB6777.namprd12.prod.outlook.com (2603:10b6:303:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 5 Jun
 2025 02:40:25 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 02:40:23 +0000
Message-ID: <33e24f7a-427d-43ef-ac48-ff665e1c1914@amd.com>
Date: Thu, 5 Jun 2025 12:40:15 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 0/4] x86/sev: Rework SNP Guest Request
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Nikunj A Dadhania <nikunj@amd.com>,
 Ard Biesheuvel <ardb@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org
References: <20250505141238.4179623-1-aik@amd.com>
 <fae08232-51ed-cc88-3de0-1cd9b014603b@amd.com>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <fae08232-51ed-cc88-3de0-1cd9b014603b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5P282CA0045.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:206::12) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|MW4PR12MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d97228-bdda-4970-611e-08dda3da51b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkV1Z0Y0eHFFWEJaQk4vUGhiRzA0b25PemMzUWR6MjRXWXVUL1p3T0RlRzZC?=
 =?utf-8?B?NUkzTmZlU1VSVzFndithQTNYajFUVjV1K2ttYzE4bGhoNzBPSFNsazQ2SW50?=
 =?utf-8?B?U1dMdjZJN2FiQzF4L1VRZ0MweEVzMWptVCt5UTRFZjFxRUJvYmlET2kvSlFD?=
 =?utf-8?B?d0hiY1NmVUVIZEJDcUtqNXk0dkVmUnZCZjNGOFZ3YnpyNTY0M3p4TDFva0tG?=
 =?utf-8?B?STRlVFlHYy91Y3FsVDNva3I4ZFNySWp0akgxaE9CZzBUWHpLTVpMNklxWFhH?=
 =?utf-8?B?VXl3cUJwamw0TnlCQUhqRWVpeHE1SmF2dWpJOStTdDg0ZGNmN2tNWExWMjlp?=
 =?utf-8?B?bUI4bjBnTHQ5SGZyTU56UlRYVnpSbGlZVnhNVVFzTEc0SVI2NmI2ZHZKbVU1?=
 =?utf-8?B?OGNUbnVsQ1JRVkNuaHVxdllWd1c1WjVCY0c4aEE2ZStGbStKL2pPUVRrYlp1?=
 =?utf-8?B?aGpNK0x3VjRYcVYwa1Vab2cvYUNUVGRuZWNMRTJ6WnhmRloyZUI1bDc2WXVL?=
 =?utf-8?B?dzBUN205Q2xsTzRCdWg3ZGt0a3dyNmJ0cWRUT1d3WDkvN1R4M2lZNGt5M3lZ?=
 =?utf-8?B?bFdIdmlKRTBOcGdaZmxLeHIrcGtqbGNrTHREcldKYmVHa3VENkd2b1VBTWNu?=
 =?utf-8?B?dVgwaVRia25NZlI1Y3VJbjNuT1dRbndDeTJaTkhEOU5LYUlwRmJsTGx2ZVdu?=
 =?utf-8?B?M1h0UlM2RFJxclhGMjBWVERwRStxdEZ3ZWxxenZSNDBkYnFQbHBPeUEvN2N2?=
 =?utf-8?B?YzZZd1Z2UnI0VG5XeTBiaUFFSFIwVnVjQmZkZlRyclJTTUxqM1N6SzYyUVBs?=
 =?utf-8?B?dG1zUUdSMktOVDJ0UzJVMnhYR0tiVzh0K2lWR0VsWm5WQlRZSXp5aHFQZTNn?=
 =?utf-8?B?WVlZa3R4dHdRazkyeE51LzkwWUJMSG40QjdYdTZkbTJGeWpFOGlaOWhUOGU2?=
 =?utf-8?B?MGp0VGpUck5SWGNHT0NQaFFmYTZVTzNjWnZEbmdESUd4K0ErQUJyQnQ3TjRl?=
 =?utf-8?B?dmJhbDFKNTRNaDRBbzllQlVycE1Vb0c1Yjg3SG1kWDBQblBybERrWHJGUHpy?=
 =?utf-8?B?cHZpdHNNVHFIbzdMVlYxMFd0WW5CUzlXK0FMRG9hbXBSK1p3SnMrRWhzUVN1?=
 =?utf-8?B?NCtwYkpycmgrSlpTRzdJeEZKanBzaUdqLzZYRUd5cW5jbk9ldzFMZWFqRFhx?=
 =?utf-8?B?UnBMZmh5QmRDam1ZUmVTYXFpUGJzL0Y3blNORmdWQTIzdU5pdTYyUmlkcndN?=
 =?utf-8?B?aTBqR2JpZWcybjlTZ2dWelhneWZJMHBBMTBwOC9mV0FpWmpWU1VvTFpEUSsx?=
 =?utf-8?B?TXhhTy9kczlsUUVRWStqeU5yUmNKWThzc04vc1d0TURHd3ZkWUNhaHAzaGNv?=
 =?utf-8?B?V3VkQURBYmUzbWdpazM3T2kyLzNBVjBtY0lIUWFQV1BLUWp0NFhYUW5MeXVz?=
 =?utf-8?B?NnQzWWd6Zk5pcElVV0NPcWltSmVsYUxnczhkYXhER3p5SHV2aEV0OC9pZlp1?=
 =?utf-8?B?L1dPaHhwQVJBakR0Z3Q1V0swR0JoRndhQXZwWmxjOUZ2c2JkOXplZ3REaFk4?=
 =?utf-8?B?cG02aDVSdmVjYmZDWk5CdVZJMTFLcVh4TUpNRTFDZDRKOENTbWowdVBldHBw?=
 =?utf-8?B?ek5xRnVoZDk3aDhJTnQ3RlRONm9Sb2JkU2NZM1ZLTER4S1BMRlVIY0ZVb2xm?=
 =?utf-8?B?eVVWRHM2L0dkSWxQbkwwUDVNMldKV2VURldIcThISm1oaE0zUHA1ZnNjZ2hk?=
 =?utf-8?B?dzBGN0h1cTBLOGZ3K0VxVkpFSXlqU3kwbVNDSi9YUUNQUlhKZHJUeU16UVRp?=
 =?utf-8?B?bm5CVExjRXgwT2l5Rkl5ZWJlV2NpYTRqWmtQYS8xb3J6Sk15RGhwVmRvbHdH?=
 =?utf-8?B?T1hoM1ZuVkFIZ0V5L3dmNExOZVBMenlhVnY0d3A0RjJZU1hzRGZ2ZTJuZWNm?=
 =?utf-8?Q?Qy+4QFYuV7w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUhLNWgzSGRPMlZCRTIwUXM4cStra2FRdVFuSkozU1l4bFpTVlpPczdxWFlE?=
 =?utf-8?B?UUJ5eFk0a0ZsL1k2b2FzaEEvYkIyVTVxR1ZhelZ5TnFrY2puL3hNVzc3NFFn?=
 =?utf-8?B?RndtekZmMTJJeXRIbE5HZXJlanE4dEloS2c4VU1rTWtqUE83S1J6bDYzcHZH?=
 =?utf-8?B?UkhJSFBtRnRkcVFUVWRSa1cwTkNZTXZLdXdkdWpiVjYxMUsrYkNjczcxZ010?=
 =?utf-8?B?cHBXRlJMM1h4RG5rcTExMkthQXIwZ082RlpuRUNsWkJtOWpVaGRtUmhaRms1?=
 =?utf-8?B?cFZvZnFwbDc0Yno2V0drOWJROG1wT3ZLeTRnTG1wdEdjclozZ0RnNlgwb0tL?=
 =?utf-8?B?VWZiOHRqRnpuMDNpeVRNc0t0SnFpaDlwQndXbEttcCtJdHBueWhyTFFHU1V3?=
 =?utf-8?B?UTFUK0lXL0V0SjV5Sk13azM5VmxkZ24vUHVnQk1WRGhRdHVDUWw0NzRHeXds?=
 =?utf-8?B?QVFrVWNmUE1wRzcvRHVyN1JFcDRlamNzaUR5cHdXYVNBU3VZQnZwdDYvMnd6?=
 =?utf-8?B?cUpFTkVLcnA4QTV2aklwQkFKajFwTG41dkFvem9GckV2Ymh5SDBScHU5SURp?=
 =?utf-8?B?Mkt3SWNBVlYwNzFQRnFJS2hjUG1VOU9aRkZOaTl0RzZidGV0VnJzdTQvZEN2?=
 =?utf-8?B?bTVoRFB0b3ZQUkJCR1NZU01nRHljVnpOZkgxUkw0M204ak1mbkx5NE10bnhi?=
 =?utf-8?B?THdyMWV0Vm1vN2dhVmZ3QmZUYXNLRTExTWdNTm9ucVVjNnNKZUhpV2QxUmMy?=
 =?utf-8?B?UnZESFRYLyt3S2EzMlVYTnlrUlEwOUJsMUJZZ0RwMlgvQW12Q0JuM1A1bGQ3?=
 =?utf-8?B?dGhGdkF3WnhRNVVxTXMvakUwQ1V6aUJOUk1XZ21tNU9jYWFpOUMxRTFwaWpC?=
 =?utf-8?B?UVN0bzBBNlEwTlBGSURLd2JTb3dNdW5hek1rWkJhaFlzWUhQcFByQUtFU2FN?=
 =?utf-8?B?akNvV1NHYmVrVlBvM3JCMHpRWjZBdnJaZi9xL1NjcHloVVgvVTg4cjQ4Snc0?=
 =?utf-8?B?aEN1Q0FsTXpBZWwwUmtudkZXSkN2U0h0bzljaUVRL0RSSm4wTzBidXlMVkt1?=
 =?utf-8?B?eXB1MVZDYzdXSnl1RDJjbnZPNzhQV2JJemdJKy9DNHFBU2pWS2tGOHJkVjM4?=
 =?utf-8?B?dXo4M1gxbmNuQW9GNFNSSmVqNng5NElzYk4zcEs3MzZlaEp6S3QzVWErckpS?=
 =?utf-8?B?Q0xyVWlmZ3VMZGlRcG1LM0JYZU1NWTdhL0JiSThYWXFnTmdZQ2c3aElGSEs2?=
 =?utf-8?B?ZndxUXdleit2MlpMSWdTTTM0UW1ObnRlSEg4TXFaWHJnajN3Sml1cWVKTXcz?=
 =?utf-8?B?MThwczZOU2UzOHpPUlJOQmd5STNIK1NoMitTNGdkZ2pLZTM0OENGN3NaNS9n?=
 =?utf-8?B?OG9lQzNhMnNTU3VBeVJYUmxzamgxOWlLQzZsV1UvNWQyTlp0SzZ0NXJ1cVJ1?=
 =?utf-8?B?bVI0eG05ZEQwZXNHMWhwdE5iTWU4bjl0V1IwVVNQd3hwL3Y3TjVrTEZaWXBR?=
 =?utf-8?B?cFcvSDIrcGxnbzZlUWxycnZxUHlnRzBOYjIvbStrcUVNSmtMZ3ZDbHpnU21N?=
 =?utf-8?B?Q3hSZzBiV1MzN1JobDZKNFJBMHFQQ2NEZ3ROeE9KaHN0ZjljMTExMGxaSDJD?=
 =?utf-8?B?Y21YeEpsNXZIN3pnMHUrRlhJZm9FeEZVR0ZoREd6cTFnazFJMkFHckJENEpX?=
 =?utf-8?B?cUJnRVpvNlJKRGFQb0doWHZxZXRRZ1cxQkE0N3FFdGhTUFRZd0xVVHVQTGha?=
 =?utf-8?B?UjFwc29QdldDV0xsU0pnaVZxcUxIM0pZQTJobWhGeHRtRys4OVRmcGlOemFZ?=
 =?utf-8?B?alE1bFRBam5KbHdhWjdsUEt3SHhlZ2FEZ3BtNXVYdjVRWXppWmNFU0tqK1g3?=
 =?utf-8?B?NGxHRGxId29RYTZzZTlhQzdQU0FDaDl1R0JFR1NPeVdOdHFKT1lQMU5DcDFV?=
 =?utf-8?B?bmVTZXJBOWFMRjRlMFdNWmNObDluTE9NV3BtbEUrWXhUc0I5Wm5LdldXVS9N?=
 =?utf-8?B?Y3EvUlpObW9RcGthc2RjakNOYStVTTJlV1hOekRyMkVSV2RCUU42bDJJalBT?=
 =?utf-8?B?cGJtbktvTm1hRzltcTdXSkxPMDlIQ0RucHpIcmdPbmNjVlNiVStneFRXbUlU?=
 =?utf-8?Q?FR41G/SrPLOPcLKMAZIWK32rU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d97228-bdda-4970-611e-08dda3da51b5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 02:40:23.1201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1P1x79D5A7OfAAvVstqyDOSUpidu6G/F9JOyUkq/kcn4qZYqUhwjNYxuwffLq67VgcTrQlW2liPKgUvqJ27Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6777



On 7/5/25 04:55, Tom Lendacky wrote:
> On 5/5/25 09:12, Alexey Kardashevskiy wrote:
>> Started as a part of the fix for
>> ae596615d93d ("virt: sev-guest: Reduce the scope of SNP command mutex")
>>
>> these are the remainder of followup fixes/improvements as
>> the SNP Guest Request code evolved enough to make it a bit hard to
>> follow.
>>
>>
>> This is based on sha1
>> 6c201ee95a30 Ingo Molnar "Merge branch into tip/master: 'x86/sgx'".
>>
>> Please comment. Thanks.
>>
>>
>>
>> Alexey Kardashevskiy (4):
>>    virt: sev-guest: Contain snp_guest_request_ioctl in sev-guest
>>    x86/sev: Allocate request in TSC_INFO_REQ on stack
>>    x86/sev: Document requirement for linear mapping of Guest Request
>>      buffers
>>    x86/sev: Drop unnecessary parameter in snp_issue_guest_request
>>
>>   arch/x86/include/asm/sev.h              | 10 ++-
>>   arch/x86/coco/sev/core.c                | 73 +++++++++-----------
>>   drivers/virt/coco/sev-guest/sev-guest.c |  9 ++-
>>   3 files changed, 44 insertions(+), 48 deletions(-)
> 
> For the series:
> 
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>


Ping?

> 
>>

-- 
Alexey

