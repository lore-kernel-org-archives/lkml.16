Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D852397A4;
	Thu, 26 Jun 2025 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947477; cv=fail; b=fFhR/jwgFtL6RD227zVH4Y+fRdwKwEjuqK7x8lKJVOA5Be7vxbMBsIJZTI38yCke3Z3jVoxZurHhgRweZaDxTs9Wpl1msxzA38WlqvF5AzqlZoJzBh9UwwKb263FxB/RNDaiZOnXup9vSVBDubpqlxppz7joLd6nBMKJgnubzdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947477; c=relaxed/simple;
	bh=KbcjYwzX45X+MFk8qgLvRua9p5QgHhdKxemdsAtqPdA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f9W68gIYK+RMqki3zY6o4tw3q6Z21MRTey/RSZszJq0n6/u3khWPIGcVnnf20WkR0qk0ELstkN7izF3357qImC9jsszBY+h/AjZXcgpZLygGyDnB4Nz3wsH6J69+Fd4SFBDkI3Rig07VsXnWWHsSTibK+FNMlO8Pz67uLkh68JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FcT+cJ4g; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FcT+cJ4g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTNpXUXjp7o9TcGgbGlM7FKbu1qumdCsJ0jo3QX4xGX0V0/avMK8uLvVeS1FAnDhEGRoPJnXwuKHx9QwYFzsWNTQKB8qpibCLmJ8qkxN/F+zep5DcdBXSmxQBhse3MxCRAGnbe3fUMp/Z9fhad4OQcKbJ9Q7TyVOXoB/KPpi7s6uvWx856JqYj83R1mqyPXw8dEbbMkTnK5PtRPUzf6iBiTe1oINaEQm9osFk7QwupTmtLW543PHCiPk25vSD+Z8jISCJCyouYcWac57ba15XIJu5hjaD6wNPsrDRzcu7Nr0TsdLjITWlChmGTxRGjrLwZcfjXEvdDoLdK65ZePAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVrHzfW5ZTlaxB5LbufXuZO5tyHcSla3XmoPZNPKdNw=;
 b=mdwyYItli7I/l8bj1Itii9COUJKRH1TE7Xa8o3+FOvGstjPElRkEoIRNRZ6RuH8QcmzVPSQhNzgYueShBDbdhB+VPb+Tzfs0PzHSuuebYS2pN6d6kKava03F9GFuLN411esTdWBBgXNuQGHpVCG5mjCpGnfCCpCrwlp4LdSddlwc50c4soJSa3bjS3HVMcbV2v2wO6KrZK/9y6JSLdbp+2yY+uqceqaLWpB4H8YAti80aZxkqZczJbB3KhXYxnhUh/plivOqx1GsiDObl636V6cAWUKIMEOoiaOGz88c+B5RxOZDblmbrZGW3vCkq1vvgq14sZSdMOOCpcUG5mHehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVrHzfW5ZTlaxB5LbufXuZO5tyHcSla3XmoPZNPKdNw=;
 b=FcT+cJ4gSz0Hido/R5fx5sEBO2+E4O8tAXOvf5tFt2vQ5PCtJdmcs9RJRZFGriNYI9NWVw3dVYPYpkGIFaCBMEoS4dgpaZBt8JPN1l0U2Y3uCKKs78fcNBQxaXDeU8j7XXc0o+4dqzMgKtX5ICA50b4jCURAhlCqJ5QKdJXic88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Thu, 26 Jun
 2025 14:17:51 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 14:17:49 +0000
Message-ID: <3915f9cd-5c82-4947-b5c6-47b5ecdef5c2@amd.com>
Date: Thu, 26 Jun 2025 09:17:45 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 14/32] fs/resctrl: Introduce interface to display
 number of free MBM counters
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
 <ad9a9feca7638f9be09e348e3647d010a1a5db61.1749848715.git.babu.moger@amd.com>
 <dee2c51a-5fb3-4aac-b8e4-a1ec87d76545@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <dee2c51a-5fb3-4aac-b8e4-a1ec87d76545@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0049.namprd04.prod.outlook.com
 (2603:10b6:806:120::24) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 300121aa-b1cd-4e5f-1b9d-08ddb4bc3af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDVMY3BYeC9pWWpyL0l0TjVCWTdTZ1Q4V25vcGs5MkRueTFSUHFtMmRqeldH?=
 =?utf-8?B?TDJZeDFvUTR4clp5UTlnazg4R2hXK2EzM0RWQjVaOHJTaElrNWlDZVlLMmpj?=
 =?utf-8?B?Z3M3ZFFiRERXK0twbnF6TUlpbmxGTzJTemZyNTFxRHlmSFR0dm9PTklyRXFx?=
 =?utf-8?B?eU4yV250dEhCcDRieForNkdnTGxwR3RHZStZMGNDTVN3SlR0S081bTVRalJI?=
 =?utf-8?B?TjhaVm9aeE9UU2k3UHFGaHZDUU1tNkJwcFZIUzFkZVR1WlpWUHVJUEs2UG91?=
 =?utf-8?B?aWVVc1E5bHlGMituRUdaalZSQW5DM2JYMzFSSVVjcEt4LytjQmtmVEttUXh0?=
 =?utf-8?B?Zk9qTDh0b3NtRmNTYzJyOFZHaHRYcDNWZWE2dTFSWW1JTUh5cG5PWXJhRUFF?=
 =?utf-8?B?eUVDcjh1cTYySkxsYkVxN1ZqUjA2NmJlaHg2SUIreTU4NEFOaXpCTUpNR1Jz?=
 =?utf-8?B?SlFBSWN6T29meFRpYWhEMnI5Wkk2QVZCbGZFMlRncU9ZVWNsWVl6ejZNVjBI?=
 =?utf-8?B?Q3didTNFRS9FNHlFcGllSlY1TW9jOGJTbWRoYWp2QWY5VGtRK3pYTmZxL1Z1?=
 =?utf-8?B?dGF2djBha1k0LyszcnlEM2M2UEVlTkZWWGVWVjViOVRNZGxLSkxjSHNjYzM2?=
 =?utf-8?B?bmduSGthbGhjOTZDMDJTSkxKdmVnRVU1ams3dXBxKzRXN1dGbDh3dlNIN2o1?=
 =?utf-8?B?QkdJQ2NhRllJL2FJTTN5OEdSNWNWWXJBNXBYbmJWZ0NJRGYzWlVOd1ZVWEZx?=
 =?utf-8?B?dHpqdXJDWFNsdEZnN0RyVWpTZDl6dCtrTnJyeG9YSmIxTU5EU1NRK1RoRG9W?=
 =?utf-8?B?YUpkVzNHcEFHU2N1UlE4MWtYeVRmZzZiT3UzRkoydXovZ21tYzlIMGNxRy8w?=
 =?utf-8?B?YWdlSkxGQmJqNHo4aldQMkJxT0RWUWs0NFAxU0Y1UjEvbEpwYWtLSUtqUEhQ?=
 =?utf-8?B?RnFwTkZuUTh1SGZqM3BIRzAwVVFBOGg1ODNKbG5Ud2N1OVdkaHRjdWhPNzUr?=
 =?utf-8?B?ZnAybm1jajNEWG1mU1NuZDFiajFDTU9sSzJ6QXhKaVJKY1VkOTE4R0NWYS8v?=
 =?utf-8?B?WXdMNGlBSTNjRXJuVkg0Z284NFI1N3lvbWdoY2dtUXFsOW91NjFIQVB0OSt6?=
 =?utf-8?B?RTYrRjlGdnQxN0RSOTVDYzBrL2lhWllNU1NLSjIwUTE2OGNhaW14ZkxiNGN2?=
 =?utf-8?B?NG1oVkFNdWFaSllKdGpEbUdYczhWTG5FaFVRNWlvTWFWMHJwdXZZalJkeTZ6?=
 =?utf-8?B?Y2RIK3F6aGhDVmtPbWlZTUJIbUIzZ1dmRUlzc0F2cTF5YTVIQ1ZWWGYwMVNF?=
 =?utf-8?B?S0dqOUNWREZrZEk0T256V1dZV3FIeGNvUExzVEZac0xWR0RCL0Q1TThHR05L?=
 =?utf-8?B?b3Nsd29ldmxrTTJSWng1a2dJdGkwNTY3bHVKcWt3bk9jZ0hXRW4yZDZ4TXoz?=
 =?utf-8?B?ejNoUllDMWlSRDh6RzRNaXBwZlJ3MFdDTFVPTXExZjFRb3NXYksvYzdUL0JG?=
 =?utf-8?B?MGpOMzJhdFdHUFFEcFk0c2xIODB5QlBvWkthdkRRU1VmMDFoVUNMcFl0NGFZ?=
 =?utf-8?B?NkZyMGtmclFRbTFLSjQ4bjFsbmQ0UTA0QXJCUzRYUTM4RjFXdUlMUWpydVdx?=
 =?utf-8?B?NUViVTZHc1pCSEJwTERYYVhNQmI3c1ZuNU1nUzMySGFGY1pmcUtpcUNyeHdG?=
 =?utf-8?B?S0JERjVuSFZQbmN1Z1c3cGdXeHRKK1Q4YUtBa0sxTU9JNlhyQWhDQjY4dURq?=
 =?utf-8?B?TFFYbHZKLzJaZ2NIcU1Lb2Zub0xzSHhzWGFLOXFHVys4cDhzdGMvWkxjR0dm?=
 =?utf-8?B?V0xOU0VhelJNckpDUjF4ekpxWWRvWjBrT203YWVpU1Vta2VyNjNhYjJNdng4?=
 =?utf-8?B?enIwWndQQ0Q1K1hJR3dtODBGZ0hReCtPVHRLeDQ0YXJjSG53bnlrR1kwQ05q?=
 =?utf-8?Q?uz2CDqM7RyE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXN6YzJ2RDQ3K0xPYWUyaE00WjREYlhoa2d2K0w0ZlpCUTRvY1pOOXdOaHMy?=
 =?utf-8?B?ZnlEVy9JZ0RPb1Z2TWhMOGNibXovVUlFUFhDbHl4bTVIMk8rcGE2NE1WTnNF?=
 =?utf-8?B?SHc1WTlwdlloK3NFb1BPcmZzeU9PaXR1bDlaNUYyYkE1V3VJUzRXbFAwaVk1?=
 =?utf-8?B?Q2xpUFlnUnEvRERxeWJ5ZytyaGNvZW0zcXB1NW9KeWI1K3RwaEJtbE8zazND?=
 =?utf-8?B?eTkyY2JkdkRWMUh5R3pJNk14YVdIR24wU1ZmbmlqNWlQamY1L0gzcERqbkZD?=
 =?utf-8?B?ZTNsMDYzRGVUN0pPdzl5bXRJZ1l3Y092MlhMK2hOcG56OWNSeWI0ZENNYXV1?=
 =?utf-8?B?TzRDbWMwblNudFRlSVdEQmJqeUFsNVEvNDduR2hndUkvVmJ3Ynd1SFFMZWEz?=
 =?utf-8?B?NzlNV1lhbUw3czl0cXFOc0VNZTBkNHNZWW5zRm1Qelc4Y1pVNmhFWkhwWXc0?=
 =?utf-8?B?TlRjaEpJUm8xcUNCNWdQZXhmem43TFBScDRqaUx3dDhIeHV0d0E1ZDVQVmJk?=
 =?utf-8?B?ajYxUldHZnJuKytpYUYrODZKbTkrem4wK1c4VklKMHZ1UEV1NER2L2t6Ui9T?=
 =?utf-8?B?STVWVkZFVndzbjRYcitkWm4rZFlMVXJ1WnpIdFlNYWFyN1ZEQ0UvRG1RUnVH?=
 =?utf-8?B?bG1RVG5sOGZZemhkZkl6cUtFdFpMWExrcHlhV1Z1dTM4NldCWnpncmN4bjlF?=
 =?utf-8?B?citPdTJYclY2UklPaStlSTFneStVSWFhV25sQ3M2aE9Ud09CdlJJTDVkd1hu?=
 =?utf-8?B?STNYcjlwMkVzS2ZtbFpjZU9kY1NmNjYvVHZOWUxJaFhNTHdVUktMaHpHSk9l?=
 =?utf-8?B?R1d2ZzB2czVKUzhnbXJXMWZCSDZPRlJ3ckR1VUJqRzUrL2tqcThEcVN4TFdM?=
 =?utf-8?B?eWFpYi9aMGdoRzkvY1Q5d21lSkhsZlZ2UzU4VVRWVHhWWGFRL0xuOXJROWZZ?=
 =?utf-8?B?OUdxaGZ3WG9oN0NFbnFHUENwT1ltOXFDTHczL05vbmZ5bDVzMHJEdzQxZVZE?=
 =?utf-8?B?dmNrWjdxS2wwcHVYanYyYlozSFBYZ1QyL29UMjZrYVFmaXA1QTdEOXphQ3pD?=
 =?utf-8?B?V2lpTEtIRHlEQWF6RDk4QW1XZlo4dlNOUFRhVzhwNDZteVBvKy9RcnNTNS9o?=
 =?utf-8?B?N0xDVFMvdWl6YlpFS0w2bld5NGUyYTI3NzVUU2FtMk9rQlNwWmJESWl5TVdW?=
 =?utf-8?B?SDZwb29lbE0zYy9tS2p0d3licEI3WmkyeHh2REhxUjA3cEJUY0UxdE16akVR?=
 =?utf-8?B?M2liWGEveTl0UXIrQXBtdDIzbFJXQXczNFp5NkI5SlM1enVudUR0SzJGbEJx?=
 =?utf-8?B?WDUxTW1PVHFlTEFwSUZvZnpwK3VPaG05cXBrZDNwMFB1L0tCTkFRcVBSbm9F?=
 =?utf-8?B?cDNRbXQ1VmFkNEx5YU5uRTVMSDF6RVIyV01COXZuZVM4RXR3cTFxUlRxakpY?=
 =?utf-8?B?N05NM2QyWnZVMVJIR3luS2ZSNFlrc1hFVVByT2FocmlaSCsxRXpPSHB5YWtw?=
 =?utf-8?B?NWF3bzMzQzRheHFNeUZieklTWis5djlwcEwyY3dxN3R6N29obnY3a29ROVRK?=
 =?utf-8?B?bTJSN0IyckxDTDZWQzVTTVpwb0RQRUd2Qi9GcHZ2bnpqMUVWekxnRTBPcHkz?=
 =?utf-8?B?V2dENjJvaW1kdEhWbEhjdEIzYzd5ZktVYTVHZUszRi9ZRjJVc3VqbXlRa3FC?=
 =?utf-8?B?QmM3ODl5U2xiNEpXZ3ZsRG9WQVl2N29tNHh6bHhqR2xvdnFZcUdTd1VCOXMy?=
 =?utf-8?B?eVlkdWR6UHVXTStoNlJUeGtuVEdkV3U0bVhsc1BjVWNzdmpWbWxCTFdtRTBK?=
 =?utf-8?B?eVprQ1R0QXVldnJvV1RUQmFBTGp1SHlEV2o2N2dNY1Q4MWh0QzNnQWtpcHJj?=
 =?utf-8?B?b2U5TjJBeUEyM1N0eEgvTEJKb3BCeUVNQnkzMnRHZUtMS2l3NTFPUjVWQmU3?=
 =?utf-8?B?YzJGMTRUdkFPaHZyZXF6VktwdXZKWGQ4cHRLamFHSm5YVjYxYmJWc0hNZncx?=
 =?utf-8?B?cnFDbU1UNGMxRGhzSXU0L0NzelU2eTdickRHOFUzOTNDTjhSbGZZQzlOUlNw?=
 =?utf-8?B?aGlmZktHMmN1OEQzeVdXdjdZYmRNMUlPbmx5ZUxZRGwrUnV0VHdXMHJiYm1i?=
 =?utf-8?Q?Ojt0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 300121aa-b1cd-4e5f-1b9d-08ddb4bc3af9
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 14:17:49.7574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVFQ+MLV+FYO7V/iJlWchGqN4zcLiWwfM6bU638plPmd5NQG2sOEPEKpQPQ5cFaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949

Hi Reinette

On 6/24/25 18:39, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:04 PM, Babu Moger wrote:
>> Provide the interface to display the number of counters IDs available for
> 
> "Introduce the "available_mbm_cntrs" resctrl file to display the number of
> counters available ..."

Sure.

> ,
>> assignment in each domain when "mbm_event" mode is enabled.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> ...
> 
>> ---
>>  Documentation/filesystems/resctrl.rst | 11 ++++++
>>  fs/resctrl/monitor.c                  |  5 ++-
>>  fs/resctrl/rdtgroup.c                 | 48 +++++++++++++++++++++++++++
>>  3 files changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 801914de0c81..8a2050098091 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -299,6 +299,17 @@ with the following files:
>>  	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>>  	  0=32;1=32
>>  
>> +"available_mbm_cntrs":
>> +	The number of assignable counters available in each domain when
> 
> "The number of counters available for assignment in each domain ..."

Sure.
> 
>> +	mbm_event mode is enabled on the system.
>> +
>> +	For example, on a system with 30 available [hardware] assignable counters
>> +	in each of its L3 domains:
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>> +	  0=30;1=30
>> +
>>  "max_threshold_occupancy":
>>  		Read/write file provides the largest value (in
>>  		bytes) at which a previously used LLC_occupancy
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 92a87aa97b0f..2893da994f3c 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -924,9 +924,12 @@ int resctrl_mon_resource_init(void)
>>  	else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
>>  		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
>>  
>> -	if (r->mon.mbm_cntr_assignable)
>> +	if (r->mon.mbm_cntr_assignable) {
>>  		resctrl_file_fflags_init("num_mbm_cntrs",
>>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>> +		resctrl_file_fflags_init("available_mbm_cntrs",
>> +					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>> +	}
>>  
>>  	return 0;
>>  }
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 90b52593ef29..08bcca9bd8b6 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1853,6 +1853,48 @@ static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
>>  	return 0;
>>  }
>>  
>> +static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
>> +					    struct seq_file *s, void *v)
>> +{
>> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
>> +	struct rdt_mon_domain *dom;
>> +	bool sep = false;
>> +	u32 cntrs, i;
>> +	int ret = 0;
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	rdt_last_cmd_clear();
>> +
>> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
>> +		ret = -EINVAL;
>> +		goto unlock_cntrs_show;
> 
> unlock_cntrs_show -> out_unlock (to be consistent with rest of resctrl)
> 

Sure.
-- 
Thanks
Babu Moger
