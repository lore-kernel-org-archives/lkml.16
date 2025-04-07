Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D52153D1;
	Mon,  7 Apr 2025 20:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056888; cv=fail; b=gWKIXcCYcbDBSxzlD12VGb/SCTLFipkr0h1mXHxGNcPzbxCrZLcGdKlVdFsR226eIIkeG45B0x3kSmBaRrxpHdX6WIV9nVR1SjbtXK2eJwLvtYudrAa8dDPAmFz1Is74zAQCW6OMmex2OJogdTBeKSjhsR704KWUggbbRxLE1m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056888; c=relaxed/simple;
	bh=xBDS7XMyjdkLLrPSaIKnOa1C38LWjuwQq7k6s6jdsMU=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SLlaKs/4DaxD3yX4MET+m/vGZxcg0D7OAtjSCzsxTOdxxNd/LbthArVKloOWtqPK0JPJabCZ9yEfeIgEZJGg5HvN81XV8+782QNOaYQRelvr9dRqEHPKouWaQ/FZBCg9ur0V3Zkz3r4i8FX+aV5tT6pfBwL9cTJpsVcRg9ZeLxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iuLMX6C3; arc=fail smtp.client-ip=40.107.220.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iuLMX6C3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yY0NaD6vHNuPiwL/pKx/a1CJgsz+OrgSNdwuMgA7n4Engrhn4EIgf4fMTaM4Gvb9eE9iVpwGL3f8G400XG8o6umwLglfcoOVbfoYMa9lZ3O0EuLOYWidcUVtiCEfGmxsemwrMyZnzXpJl8L8EUVtwicrDgLPi5C/wDOcBUDxTiwVuhP3uMpmnJXiklGBWpEJVtc8n23Fiq1U98srLiJR0VHjT9AskePyiBm9ooVNEdcc8MG/TEd6Lo7TgwWX3kmseBLg0oM1iLHIheOUBMehFGIrIOkHd+7n6ON5VhJHqU/a1PDzjfelX/xJJpYgqJ+a9yL550Kuq9stYoJqqVwscA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdcY3IbVJdt90xmBICRuE6xgSVjIRWBv0WawAKyxQ+U=;
 b=AwRh+zhtUit92pm1JIPu5SI29sSE58wvk9IdrddACBep7rPuVkmozuzqDQ5LAJWY+GacWosPUdyF6IZGGTWI4TB47a5ILhkhXtK7z2epFTFvIGW1JdKlH63NSjdu2QZFTYTqHi/Cso6UZ1LqDh+ysM/ISdF6b3mx1KUuwaDwDc7+AR2z2ifKfUamf7+d+BxBUXJ8k8IAbjei9u635gkq9iMh1uzYkcbb4MGuhAtFgEobE7WhuguAmvQEzHA+wUg+XwUjecp0XLxWDlTpHLs/l3IJQ4u+/9sFeFcGbyCLBUOgDbquVF8486VSAAJKZWv5thRulqgvjCOnHp7y+EIVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdcY3IbVJdt90xmBICRuE6xgSVjIRWBv0WawAKyxQ+U=;
 b=iuLMX6C38Ow2cvVjjJwyub3GX4f9xNjrgsyfpstdVpiDrpJdeLn0Xgijla8nXk73UjQ/3zipFvnhGg8EwTaKueZVwl3uZj2f+yB4UmYWGz5ZI6w5HpRpsQALjJTgQFNJJqqKWZYhGLkyuPbk0x30oYrk8r4JxyHkVIL/oiDPmMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 20:14:44 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 20:14:44 +0000
Message-ID: <a4006113-44f7-480a-ac1b-3b34158c8297@amd.com>
Date: Mon, 7 Apr 2025 15:14:40 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v3 4/7] x86/resctrl: Implement "io_alloc" enable/disable
 handlers
Reply-To: babu.moger@amd.com
To: Reinette Chatre <reinette.chatre@intel.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 jpoimboe@kernel.org, daniel.sneddon@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, sandipan.das@amd.com,
 kai.huang@intel.com, seanjc@google.com, xin3.li@intel.com,
 ebiggers@google.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 tan.shaopeng@fujitsu.com, james.morse@arm.com, tony.luck@intel.com,
 peternewman@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com, corbet@lwn.net
References: <cover.1738272037.git.babu.moger@amd.com>
 <dbb4447267592aa731c8fbe1274adf81b0ef2103.1738272037.git.babu.moger@amd.com>
 <f1a67245-4c29-4b31-9e29-58d6b3b2676f@intel.com>
Content-Language: en-US
In-Reply-To: <f1a67245-4c29-4b31-9e29-58d6b3b2676f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0009.prod.exchangelabs.com (2603:10b6:805:b6::22)
 To MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9a56de-9cf8-4412-058f-08dd7610d632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUlIR0R0VlQ2KytqeGdsWE9HWjdWeDFMTDdKOGVBV2E0dXZkT21xd2lDY212?=
 =?utf-8?B?RXBEYTVvdnloS2ZUbXd2V2hUVmdYUk9YYUhaL3JjNS9PdWFaa3BtWDZrQVI1?=
 =?utf-8?B?MTRNOHp5NEhycS9sN1JKUFJ6NkpleHV4RStUU3pSdTJxN0RsMFY5ZjJ0MWlV?=
 =?utf-8?B?Um1KWHhua2dvdkRRbWtzNFN0R0dDd3lMWFYxOUVQejQxNEt5S2YzNExhcDlQ?=
 =?utf-8?B?Zlg4T256R1BjSDVTczBhdzl5UUt6Q0E1TkMzNW5IWWhvbEtDK205c2NDQ2du?=
 =?utf-8?B?NjFoczdkS1pFM1Q4NUZlbUxmc2lldU5BWTNqRjB6ZEd5dlQyb01vRUc3TGNn?=
 =?utf-8?B?VlNkL0JaT0wvZWhiZVhYRXByWHFwbmVSTnNlRmVtVGljYWFVMjM3Qkt4N2Ey?=
 =?utf-8?B?V3YzWTk1K1dIYXNBVldTVnY0eXRTYVFLdXN0SHhlVG9DZjEwcnBTbWluYUdZ?=
 =?utf-8?B?WmFkTWd3ZGdMUlhucURZUWEzTU12SVFoUWQ0WlNudmtjemdLVmkxZlNhazRC?=
 =?utf-8?B?Ym9pRDVPSUg1NEc4MmNad2NKM0I4RlZPZjJEQldRZUpjMWNQWEM4Q3AwelQ0?=
 =?utf-8?B?RlhYY00xbFJFRjVESXBYKzZqaG9pN3hBVE9pL1ZuN1NqaHZ5eHlVSDYySGRh?=
 =?utf-8?B?UGlLVWJDU1BYaVlJcS9NWnZpWkUvVkJ4REJOelRlNnJ5Uy9HUkV0bitFajd3?=
 =?utf-8?B?Q21TKytNcm80dkFjMkFRUk9pcVl2WkV1alRqL2pUM0o0MUEyMXcva1BpQlgz?=
 =?utf-8?B?MzBlOU5rdHRUeXQxbllTYjAvUDVqVnlOU0c3SVJ3WE9WUExneHF3SFNxODZl?=
 =?utf-8?B?eHZRenZWa01LK3EyTm5aU0VjT0hER2tmcElXdUtjREtpeDE0aXJRZk5zZis0?=
 =?utf-8?B?SHpRR0VOdGxuNk5oQ3QrWTMzdVVhWVkweHlSOGd2RGtVamdLMTY0RWhFaTN4?=
 =?utf-8?B?YjJlYnZ6YWpWQmVRZGN5RnFQVVk0NUNpbmRjR3JXUzMvbEt6ekRJSUtnU2kv?=
 =?utf-8?B?bTFWSER5Q2RmYWV0anN4T29JdWxmdmJuanYveVhOZnlIaUNNNGc0V1c3Z0Vx?=
 =?utf-8?B?bEdVMHdBa1B3aFJYdDNUMXRuUytCVXNUMVR1NDBLUUppcEZGN0l2Qm5FMVRw?=
 =?utf-8?B?TDRIU2ZGM1lxQzJiMTFjNVZKS01xekpNWkxTczIrWFZ1R3dBTzZBbDMxK0NX?=
 =?utf-8?B?OTVXSkdvUzU3ZE52NWVSNDQ3YytNVE9MM0JraTlzdlM3TjNzc2hEZ3gxUFIx?=
 =?utf-8?B?cTF3OVVpOHAvdy8xVjRhclRPd1FKQUp0SVc4cVlYOXBIbktPRWpPMEp1dDd4?=
 =?utf-8?B?eC9ldExHWTdtOUtQRzhsTW9pdEFTbWxWZk41enI2VkZxbisyN0hHN25WZ2pn?=
 =?utf-8?B?ZCt0L2tnNUlOMlZ0U1ozdTNJSGsxbnJyTzgybTVNYW4yMXY5c1p0V2tubEpR?=
 =?utf-8?B?MUk3VVozRmo3NkJMc0psNDBTRzA0RE5Id2U0TEU3NHluR3RLcnFjMzVrT0x0?=
 =?utf-8?B?N1B2MlA3dWt1U2JPWUZpcjArWUxueVU5SzhnSlk0OWVjd1dkeHd5TzBMV2lN?=
 =?utf-8?B?SnhWZXl5cHBNN0NpWVBTcjNodmU3ZmMrRTcvM04wZ0Ywem1ibzVMaE1CSGpL?=
 =?utf-8?B?Ykt6RGVrdUVXSUxINjhvWVNoa2FOTmEvSHNPSlphdXNFRGNYMnA0K3RIRy9R?=
 =?utf-8?B?T0pJVldPeGhTZUpqYlo5c0UrQkVLbG92V211MHFkREdSRVVBaE5UK1hSa3gx?=
 =?utf-8?B?SWpqcEtlUmw5eXhKRTYwRkNjTkwrS2JkbEh4OG1ibXlvQXRaOUlGZ2lCOHM3?=
 =?utf-8?B?dFdRTDc0aXVpMkQ3NXMvUTR1eDZtUzhuN3laZkliL0lueWlWMVJxUExxbzA4?=
 =?utf-8?Q?o4gjGH+Kka0i9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3dRYjB4ZklQOGd5N3o1Q0hXUklLdzRvWnNkcHRFTlRocXNmckVVaGNuTjJp?=
 =?utf-8?B?OFFoaWIyY1VMQUVkWEFkREhGRFF5SFd5S3hIZzhYMXdRaytUMllidEJmNEht?=
 =?utf-8?B?enhBL21oL3JiUzVoSmpiTmpNemZmUEk4bE5LZzZJbkZtYkZLMzFJOGtJMEdL?=
 =?utf-8?B?bGtKMGZ0VWlIUzNyTVBGN1U3RFdKZE93bG12dHpYSkQ3V21hWlI5TXovdERI?=
 =?utf-8?B?YzJuc0dpSDZOQlBVUmhLTENuT2FTVkQ2WU1mZFB2TjhtNTBlMU1rR0NPbzNB?=
 =?utf-8?B?WkVTYXJWejErZEpSWjVzMHFvcEZUdm1Gd096NVp6RnordXpFOHRkT0dXYXNO?=
 =?utf-8?B?YS90NjhFU05Nbm5pOTBNNU1KMkdSMTJtaDh4OXV6V2xnWlpxbUlNYzlUbU5h?=
 =?utf-8?B?VExSTlhXYzZOTHZsWTdYbHZBTXRzVEZnSURoaGl4eVYrdWpoUTlsWDV6dVBL?=
 =?utf-8?B?YldRRy91Snc1cXZ4VXFPalEyMjc0eUFwUGVaZStwWWZxanVLbmZGVkZLamI2?=
 =?utf-8?B?ek84WTdGZTFTS1p0a081ZTVQVVNvVkJoSVd3bElqT0sxb0QwcTZZRHhCS0U2?=
 =?utf-8?B?TDd4UGovdVNHOGkxK2RzMUQ2R3ltTThEYm51OFVNK2xhblMyRmZKdGpPSjFX?=
 =?utf-8?B?emt1WTRxblIyUFZNeElWa08rYWoxQURSMmxVbXMvNXczdEZTdXNaejlaQmZz?=
 =?utf-8?B?TGkraXAwRGhHZE1zaTRhWit3QWZoOEpqR2owc3hFVkkzSXZWVGFGOXdPNmdJ?=
 =?utf-8?B?cUJTR1gxaEdETDU3SE0zekY4L1V4TUN0T0pNTU5SSTVzUUVkMytIWlBqbEhy?=
 =?utf-8?B?OTZEblRzcU12Q0lVUnM1QXJoUWJJb3FpMDRFR0NPTnY3dlkwSStlbjhyUEE1?=
 =?utf-8?B?NUMyWVdubnhKM1c5aWhvc25tQjlTNUk5YWlTVjJPdlBMQ1YweGdlUTV0Z3Rp?=
 =?utf-8?B?em5hK0FJV0hGc3g1UVRvTWdSZDdNTW5KV2t6eE1mN2h3SFVRN2ZJT0lSUEl1?=
 =?utf-8?B?Q0FYaFJUdENLTTExUWpJemlQQzBjWjMyd0YzTGJ0Q25VUEdZaWU3N0xiSFN4?=
 =?utf-8?B?cUdneHZOWlVIc0pzVTJ3V0pIUDBNakllSGVjellVckk4YVFXbFZSdVFDeEhH?=
 =?utf-8?B?WEJnemxTTllxbk8rQ3pLSkN5bGtycVM1ZXZ5UytZdGthdkNDRVR3T2dpUWov?=
 =?utf-8?B?eDZhK3lDb2RKbjNSV0FFZmVqQncrWFUvWDlZV3p4MG9wTmJ0S1g2N1d4bVZw?=
 =?utf-8?B?NkhHRTd0TGYwWGxBVk1hOGNTMVN1b1Z4VlI5OE9Yek1wSEdXbllpcGp5bHlz?=
 =?utf-8?B?S3hEd0VpSEdBUEFEdEdXTmRoVnJTVHFrOTNXclZqMDZXelV0OGpXLzExdjBD?=
 =?utf-8?B?SmEvS21sT1p4Y2JRTU16M2pkNnZuaDJTM1A5UGFvMHg4Ym8wdTBFSGFuUnp1?=
 =?utf-8?B?bDRqOTBXZ1BxbzNXSmlPSXEzckZ4MjI3b0JqbUFkbGE2bWV5WUFKOUdScWl1?=
 =?utf-8?B?bjdDcnFDNk95eVpmeFpKcFp3TmFRTkU5WlloL3U1M0k4RGZZTnd0OGIxQjZU?=
 =?utf-8?B?aXV6NFc0WGRSTTFQZkhEeGZmWU53ZE9QNWJib3o5WWNxZHk1TkI3NlZHUVJF?=
 =?utf-8?B?SVVFbTcyb0NHQmtrQWIyNVpSVzFGQTdLLytPUzc0SUVNVkJZVWJBTURZS3ls?=
 =?utf-8?B?S0hjSlhIYUlZSlk0SDJXQ1hGK3Vma1lrUlJ2YVcvWkFLQXMwWG1nWURIclhV?=
 =?utf-8?B?VlEwN3R6aGZnVkozQnM1NGlHcC9mLy80YzJuUWFURmZsOFFpVE1sRE1QVWI3?=
 =?utf-8?B?TmV2N0RNMUV1R2lreEtiazFlemx3SWRYSncxaysvRlRMSXJoR3FlVDlHb0NZ?=
 =?utf-8?B?OHB1cTg0Y1NLUkppSUNiLzFJTmhuWVA0WDJaOG1TWHZ3akNyQ1U5ZnJ3VVVX?=
 =?utf-8?B?bHI4Skt0eGtqazlaU2FBM3ljQXlyV1RJL1lHM0luL2RQa2c0ZkdPd3lHY1dV?=
 =?utf-8?B?VGp5YWRwQXc0VXhnRm5SZ3Qxak1reGxGZU13SlNpbktHV3RTSHJ2bExiZ29D?=
 =?utf-8?B?SVl6UGlyeUhMQ1NncFB6WEhIYVJVN09QS0JlVXdnb2Vscjloa3IyanoxbTJw?=
 =?utf-8?Q?kxzw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9a56de-9cf8-4412-058f-08dd7610d632
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 20:14:44.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsr/jb66Yzy1NiNePTj+uMqJJMKIwRfpFoErl5nrspmj+98gO2iVvgrZrwYUkOfj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315

Hi Reinette,

On 3/21/25 17:53, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/30/25 1:20 PM, Babu Moger wrote:
>> "io_alloc" feature that enables direct insertion of data from I/O devices
>> into the L3 cache.
> 
> Above is not clear to me. Should this maybe be ""io_alloc" enables direct insertion ..."

Sure.

> 
> 
>>
>> On AMD, 'io_alloc" feature is backed by L3 Smart Data Cache Injection
> 
> (mismatch quotes around io_alloc ... also below)

Sure. Will correct both.

> 
>> Allocation Enforcement (SDCIAE). SDCIAE feature can be enabled by setting
> 
> "can be enabled" -> "is enabled"?

Sure.

> 
>> bit 1 in MSR L3_QOS_EXT_CFG. Apply the updated SDCIAE value across all
>> logical processors within the QOS domain when modifying its state.
> 
> ... it could also just be "Change SDCIAE state by setting (to enable) or
> clearing (to disable) bit 1 of MSR L3_QOS_EXT_CFG on all logical processors
> within the cache domain."

Sure.

> 
>>
>> Introduce architecture-specific handlers to manage the detection and
> 
> This patch only seem to do the enable/disable with detection done in
> earlier patch.

Sure. Will fix it.

> 
>> enabling/disabling of 'io_alloc" feature.

Yes. Mismatched quotes.

>>
>> The SDCIAE feature details are available in APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
>> Injection Allocation Enforcement (SDCIAE)
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index dbe6461f3fbc..e77c3b37bad4 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -343,6 +343,15 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>>   */
>>  void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
>>  
>> +/**
>> + * resctrl_arch_io_alloc_enable() - Enable/disable io_alloc feature.
>> + * @r:		The resctrl resource.
>> + * @enable:	Enable (1) or disable (0) the feature
> 
> Please be consistent in using periods at end of sentence. 
> This could be made more specific with:
> 
> 	"Enable (true) or disable (false) io_alloc on resource @r."

Sure.

> 
>> + *
>> + * This can be called from any CPU.
>> + */
>> +int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
>> +
>>  extern unsigned int resctrl_rmid_realloc_threshold;
>>  extern unsigned int resctrl_rmid_realloc_limit;
>>  
> 
> Reinette
> 

-- 
Thanks
Babu Moger
