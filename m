Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E13085D8;
	Wed, 18 Jun 2025 19:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750274844; cv=fail; b=UAamp7CnfFYMMtjqZZXkk2rvsfs4ZCbs2kf8RteUDszCkeCXPmpUoCuCwJKoJQrr06lVuBvyvj1cNlLNf4WMsubfXAFSZ9wo2FfuGn+3mDOIVKzW4j5wHs3AEU2bHszkBA8lAmARy7fj3dcq1NvmMhD1mjlt6P39t2RWKYYQciQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750274844; c=relaxed/simple;
	bh=fAjo7O29zKyI6zr9ViLWttaLrmGupFYAr2pVvw/uhbU=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aAuXoY4heM7p+I0sZdddGUwUeUQg2kXN3cef4EL9EHblS3AG04v5gdP+GqBJFFogQ4I3IW18SlFik1/WXrkIU1TYvHU5uxjXxfFIpYXEpC7gbhxdhPJFNR1BBPFkstr+81ZY3XnGqlk8cmYvkGc8J5hlayqyZuwzs2HSNGyUNeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k5U71l5h; arc=fail smtp.client-ip=40.107.244.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k5U71l5h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrhmkZq9/ARc0G3rAhlk9q/eu8ZpXxS6P5YwH+is0mDBMZq0Y/CnUZ4hcRGUpBuRa3ESkrJ+G1gHCDyAxzkdmhLUCzYbmWrH9OqYXzs7r38gzpfXbJEyhSl5UppR+I5GBIKgZj8Hlfm5HDjja7VSYwSdnJ+JcvDrjQsigmE6RugrNlCt+1hwdma53R8ZzwpR8Gd2PJIBqgjA8U1hMfdmJGcDzZF+xbLuQxcYABle0gKXekm5WFY3Roc4927gvwpesxoIyNqtv68/UEarVT510ZtZzayqR365W8lW+yQNqFrLiQp5CE0UKjFdJY+Gg490kTq0L6kzWiHQsXIYvuHzsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rznZOPd1Pah0YuxZjfGfbZGqdFQ5P3l9lFqzwwckmw=;
 b=W45VxobqEpRfpyLwSR+o0iBG/NfuTP+n9RPauIByqsHq9QIARGVjcf7XSGauLI3FgYdN+8va1RB9WwPlcqCkBgSVr3D0oHDpR3lvUYnBIpf4Xr90WKnzCUwux1hzlKbntYZ0HeyvOKOKyI9zs3hqWHsecYn/+a0JPKfguBcY9P6GPOL3Gn9MoLSBbf54fQrrD69ON7ZeqKTzzkNAuebDsHGADD35FAzskEN/4jXp+0BwcCwMcu2veYvJNk4eJDIZ7PZxCcAgsHH1TKeTk6JAamHdOI+ro+U/AWbolClDziAKGrVzTkQjoYZ2qBMki9hfuqnBePEZcWo2uaAAPKlJAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rznZOPd1Pah0YuxZjfGfbZGqdFQ5P3l9lFqzwwckmw=;
 b=k5U71l5hmRYL22Z1kUUuqu5lyv4fSss34vBiXTX3w/2U7jTI5HsFUMrsZy0k/mVIsKaZOvYiOUpWtWDJvpG21uj1wOAuazvsBAsiUHGvzr0YQBICf6RkvzHFT6h998ftNpLJMcnU1NpLoXRh2UrKi3lcKN/kmPhE67IyhLka8Q8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MW4PR12MB6899.namprd12.prod.outlook.com (2603:10b6:303:208::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 19:27:20 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8835.026; Wed, 18 Jun 2025
 19:27:20 +0000
Message-ID: <58ea6834-7765-434f-8d25-ea71e1f2d5e4@amd.com>
Date: Wed, 18 Jun 2025 14:27:13 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v6 3/8] x86/resctrl: Detect io_alloc feature
Reply-To: babu.moger@amd.com
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com,
 yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com,
 peterz@infradead.org, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, sohil.mehta@intel.com, chang.seok.bae@intel.com,
 andrew.cooper3@citrix.com, ebiggers@google.com, ak@linux.intel.com,
 xin@zytor.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749677012.git.babu.moger@amd.com>
 <8861ecc4aa962909faf07985448a333a75ca7c33.1749677012.git.babu.moger@amd.com>
 <053a6879-f069-4073-a96f-dfacd7673d1f@intel.com>
Content-Language: en-US
In-Reply-To: <053a6879-f069-4073-a96f-dfacd7673d1f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:806:d3::29) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MW4PR12MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 307cb1fc-2b0f-4357-445f-08ddae9e24a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?elNkVlEvQTBqR0dudnN1UTltSzJYb2xsV1ZqWHhNbE9tOWpWYlNSUkRGaDlk?=
 =?utf-8?B?ZXJXWmpwSjUvdzRZaXhaaEllY1ZIQmZkUUV1cytvTzNFWXdiVWQxSUFEdDVz?=
 =?utf-8?B?ZytyNjZ6SWsxc2Z1U3g2ckJkOUoxaklSVHRrKytSTmJzc09xK09pMVcrVmps?=
 =?utf-8?B?cGNlQlZOOGIyeGUxMkUyU293aHVPdmJwbzc4aytXQVJrNHpkL3lHRUsrdmUr?=
 =?utf-8?B?N2s0SHVoVHJ4NldSS09RY3NSZkdiOVcwYWhuU0RtN1dNRjNtOUVrUE9LdDM2?=
 =?utf-8?B?d0dFVkxuY3VlVk9xTytZVFYxMVI3ajVOcnJLMDgwYWVSQTJmeExDbmQrRVdX?=
 =?utf-8?B?MG93UFBVSWJFd2VCOGZ6WEZoTjhTNHFFbVJ3cmpxMjVBcXZCUG9HaGlwNWhP?=
 =?utf-8?B?elpoQm9DTW9QRXBUMWlQemlLRHFWOSt3dGFDR2RxKzBqWjNvWUxMUUYvemRO?=
 =?utf-8?B?eFVPMHM5dkxVQzlCQXNiNXlneWwxVUFkTFhCUXpsajVPS0VhUVFJUUF6SHRy?=
 =?utf-8?B?OG5rZzZUZE5SWU9yTTlQSmwxNXVyV21HbytJSXBRSE4zMEdqYytBamdMRlFN?=
 =?utf-8?B?bjNKQXM3QmRua2V5K2NBUW1TaVBkd2FpQ0x2MFc3ZG1ZMEsrL3Y4blRBTUpi?=
 =?utf-8?B?aW43MjdXeWZRcFdZYjczaHpna2oyRlA1TTF5SDd1bmEvbmpiRmNNTjN3MDNW?=
 =?utf-8?B?bjVBUHpSZFRRaXdLbjBueVFidjVZb2tCVXRQeFBQYXVsb3dueXFOUVB0RUVm?=
 =?utf-8?B?Y0Z3UTdDVm1QVUlZc1YrMXh2YlBzVW0wUXRnS1BsY3JYbC81Qi9FU0xpK1gv?=
 =?utf-8?B?Z2VPM3dYc2VjcGdYRDdrVlc1VVZIZEhvdFZCN3JFdzhJalY2MTNFRzJOR3NG?=
 =?utf-8?B?LzI5VkVlSDlBYm5XdkJQbmdTTi9sRk5LTlJjZldUdTM5WWI0U0tBSHF5RU9R?=
 =?utf-8?B?RkRQUERBaDdZVlhHQm4vUGVEMkhwbnYwUTEzK0twa1gyT2xuYWluK212Q2t6?=
 =?utf-8?B?SXJQVTJLZUhaeWF0ekdrNC9QbUNLeW1OZmJVdzBjajlYRHRkRnJqZ3gyQnZx?=
 =?utf-8?B?ME1IT0dkZTRUVDNQWWt4T1R5V2dWNFg3MkphVTNERDAvSXZIRUZDd1JleThG?=
 =?utf-8?B?UytQbnJSY3B4RHRubml2Yjd2SkFMWWJWMTRtVXdwOTZweVR5ZWdhZ3NhM3hN?=
 =?utf-8?B?QytvYm55b05PYlRncHp6WVBJc1RnSTdLYjJpRHZCNU9iVmFMMzhNaVBwUjRn?=
 =?utf-8?B?a3RQaVVnZTZMMFNtSVV6UE9lS2x2c1hiSjdNYXdUVlp1aU1LUFB4V1NWdjFh?=
 =?utf-8?B?YlF1a3ZiUWNXSUdEZ08wTUlJZ25qUTJkSy9FTHUzQjhaaWJYNDVyMXVFNENp?=
 =?utf-8?B?dDhqYVRvU3lTNWp2aVlBWGFqalg2RlNkV3BqSEpMYjIrczYvSG5vK1ZEZWcy?=
 =?utf-8?B?bW40czNCaDFuT2t3RXNaZ2hFa1F1dTNDUWZMVWdOdzh6eElxL0haV2JybGND?=
 =?utf-8?B?N3hqYmFhVHlCVytMeUV2MVNuOE5sT3NQTDZFbHBFN0ZDT1RqSitCcFFoVFNl?=
 =?utf-8?B?UUE0c3NIRzIyOUZvYlFDTDdBaG50QWVpSzlja2dnSEJwTCt1WktKUm9ueEFV?=
 =?utf-8?B?TlRVNXRTNTZ0SVZHbm1kSWptSzJYMGhJWGliQWhtRFhDblhYWWo3UG81cTJr?=
 =?utf-8?B?Tkw4RHp6ZFNiYTJQMUVyeHlMOU5JQzN3WWZ1VkM1WUdTVCt5ckZCVXZ2ZUV4?=
 =?utf-8?B?OGVYSXdIMGtFMDMrMXZseC9uVjUyM3l1VGpqdWs3aWFSTnpubFZkVkFtRVVK?=
 =?utf-8?B?dEp2d0VDdGJHRUNZaGlmdnp2dFRUbitGZUZNZXZ3ckpiZVRJUWV5WmNlajZ0?=
 =?utf-8?B?N1JqbGdVN2RXbUhoUjFQT3lPSlRlN3NaNGsxdUhIcGxZTklncE1KSHhyYkRv?=
 =?utf-8?Q?AWgWPyh/nnk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bS9yUmVxeS95OHdGK0FMOFBaN1BsSi91bVhFMG5YZkRZdTUvWTdTNDQ2TWVK?=
 =?utf-8?B?OUF3TEN1U2szL0UwN0Y3bldNT2pmVm96WFhveVpDelExK3RkTExtekxKM1gz?=
 =?utf-8?B?WHI0L1l6TUEvMjd4a1dQQ1RxQlVZblNvdDhUU25WcHd3MVpEZHA4c0huMVlx?=
 =?utf-8?B?QjluWGI2ajlqUGtDVWxhMkVmRmdVN2FYTjZJWVhIYnpuNTRPem1qVDk0TjhF?=
 =?utf-8?B?SXM2Tll0OVQyODQybkRqVmhuNWRZTDBrcXdQektLQUZJb0tFMDIwbllHV3JY?=
 =?utf-8?B?YTM2OFY2V3lrUXRHL21yeWZGVk5Eck9sem5VU0JNQTY4eFJ3Mm40WnBhd21H?=
 =?utf-8?B?VFU1ODVONEFHWTJWaS9pZDYvQXNuWlNQM2JnNTZYSWhZdGNCb0R2WC9FMUJt?=
 =?utf-8?B?NVJFd2FuTUpVSkx0bG52Z1hTS3Y4ZGF6OFZaamU5M05PaENJblJLaytDcGxO?=
 =?utf-8?B?eVhicTM5TzBnSHZTZ2czTkNac3pQcUpOVGlVZm4wdDJHVFUvU2o0M2V4SGFY?=
 =?utf-8?B?aFlmM1dSMjlLekJGMUJQR1FrZTFVRUd4THRYKzdMaXJQczkwNDZIeVBVeXhk?=
 =?utf-8?B?L1duRG9FU2xwaHNGWWwwNzdKQUIyRnhEMFVuNGhtSkNqQW5peVBJbFRGbXJa?=
 =?utf-8?B?NkxuWWQvR0hGdnVOUW50a3pvNm9nVXkrRnF5Z3VHMVB3ZFM5cUFPYmpWUzg1?=
 =?utf-8?B?a3gzUzVsMEhhcENLeFdHWnczYWZ1QVZ4R1BqTWJjNTdtaGpEYm1kS0VZSk04?=
 =?utf-8?B?bEtzWjB4ZEYrYnd6UnhPSmQyU04vRHdWaWtuTy9NZG5IdzFhMGE4VHdTQTZI?=
 =?utf-8?B?b1ZXOVFVb0ExWXY2ck1aQWFSOHJNdWl4MURnSGJXTTVPeG1Gb0s1YmZWdmEr?=
 =?utf-8?B?REoyTGFjdFJNc29yVXRxdHB6b1BWNi9tQlRSMVAzZ1liL0s1SGM0Uktjb2ll?=
 =?utf-8?B?cVp0a0VoUWdhZDdZZlo2US9NWTRyYkE1VmV1TmVJUTVheWN6S1NRaUZsYWZy?=
 =?utf-8?B?dWhCbms2UlRvanB1TUpRNi81Nkhudmg5ZSttdE82UUQrSCtTdC9uNXFCTi9t?=
 =?utf-8?B?VmM2SmZsTGxyRUNvVi96eGNWd2dOQmZJZXdaemNPUkM0aGVxbU1VTlJnV3Z1?=
 =?utf-8?B?RHJySzQyY0s5OWgwcy9DMkEvYThteHZwbFRRcXhZZzBOY2pVTjdENUhpM1N4?=
 =?utf-8?B?Y2VXeWZRbElIdzg2WnAyTktpczg0eU54ZkZ0MmZzSzl3bUxlRkpDaGJrZzRW?=
 =?utf-8?B?MWZmaU5wZXcxQVNsVDRVTzNFYnIzL1N6aWhQMnR4S2cxdmluS3FTSUhxdlZE?=
 =?utf-8?B?VXZBQ0M3ak1CbWJsTkYvbU94eGtQOVZyWWdMcUltL3ptUzhKTzE3UmVaNmNz?=
 =?utf-8?B?VndUUXFJbkwxa1RFSDFDZDFEUHB5THdoRzFUWWFaK0J4N0d5UnViczZUdHVB?=
 =?utf-8?B?ckFJNk9yaEVOTWphL1BqRkVSQ1pva3ptQTZibkx1NTBBUkJPVkJ1b05OYkE0?=
 =?utf-8?B?YnBJY1R2YWpHanJkUWI3RlBSb2lIRCtsV3BVei92dStjL3BJMXoyK0ZRemhM?=
 =?utf-8?B?bXk2V25hbE5NRHdsSEQrVnV6NXI1ZXBhdU5NdlVjOUlGY2dIWURrdTYxTXYx?=
 =?utf-8?B?NFZwVVJpZjZEQXRXY3FJVGFKdVkwN1RDMVkyMjE3aVFaQ2E5L01vMnNpd1Jq?=
 =?utf-8?B?a2RjQ2NGa3MvK2NTU01ISTJDd3dsNWg5blhBcEc3UUI1MVNQQm5xZ29xeEYx?=
 =?utf-8?B?V0gzMXVKQzRYcitQREhYb1BKYnlvcG52dytwZDBNTlFjNm5RYzhhWFBoQ0w4?=
 =?utf-8?B?bjQrdXdCS2lrZkFnT2pOYkN1bHJFQWVjZXlhT0VMTGZtNCtiRHNFUlNQQUp0?=
 =?utf-8?B?eDVXTE1XTXVVWExEeTY0MG5qYW51aWZkOGtnYzBNYVRkRVJYMVExbG9YUWZU?=
 =?utf-8?B?Y1ZjelFDelBmSzlpL3V4c0tJRy8xcVI4ZHFaOUlpSW5PRE42RVJLc2trbU9r?=
 =?utf-8?B?eFk4VUtxVDFKMWw4bmN2N1RTc250N0pQZ0JxdTM3Skk1Mzk3dzNneS8wci9S?=
 =?utf-8?B?SDRXeFVGaVMvNDQyOUd6SzhaR2tGQlh4ZFFvZURYOWw5ZHdyam5rWjF0d2Vq?=
 =?utf-8?Q?372Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307cb1fc-2b0f-4357-445f-08ddae9e24a3
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 19:27:20.1202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1KsrK6VKAAYHY4r2WIV9fQRzCvh7Q8UQc5i1ptEazEhaSUTt38Qfsaj4TMo+/mI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6899

Hi Reinette,

On 6/17/25 22:45, Reinette Chatre wrote:
> Hi Babu,
> 
> Please modify subject prefix to "x86,fs/resctrl" since this adds new arch
> API called by resctrl fs.

Sure.

> 
> On 6/11/25 2:23 PM, Babu Moger wrote:
>> Smart Data Cache Injection (SDCI) is a mechanism that enables direct
>> insertion of data from I/O devices into the L3 cache. It can the demands
> 
> "It can the demands" -> "It can reduce demands"?

Sure.

> 
>> on DRAM bandwidth and reduces latency to the processor consuming the I/O
>> data.
>>
>> Introduce cache resource property "io_alloc_capable" that an architecture
>> can set if a portion of the L3 cache can be allocated for I/O traffic.
> 
> I think "L3" should be dropped because the cache resource property is not
> unique to L3. It is a property of all cache resources. 
> 
>> Set this property on x86 systems that support SDCIAE (L3 Smart Data Cache
>> Injection Allocation Enforcement).
> 
> Here it can be mentioned that this property is only set for the L3 cache
> resource on systems that supports SDCIAE.
> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v6: No changes.
>>
>> v5: No changes.
>>
>> v4: Updated the commit message and code comment based on feedback.
>>
>> v3: Rewrote commit log. Changed the text to bit generic than the AMD specific.
>>     Renamed the rdt_get_sdciae_alloc_cfg() to rdt_set_io_alloc_capable().
>>     Removed leftover comment from v2.
>>
>> v2: Changed sdciae_capable to io_alloc_capable to make it generic feature.
>>     Also moved the io_alloc_capable in struct resctrl_cache.
>> ---
>>  arch/x86/kernel/cpu/resctrl/core.c | 7 +++++++
>>  include/linux/resctrl.h            | 3 +++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index 326c679ade5c..a3d174362249 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -274,6 +274,11 @@ static void rdt_get_cdp_config(int level)
>>  	rdt_resources_all[level].r_resctrl.cdp_capable = true;
>>  }
>>  
>> +static void rdt_set_io_alloc_capable(struct rdt_resource *r)
>> +{
>> +	r->cache.io_alloc_capable = true;
>> +}
>> +
>>  static void rdt_get_cdp_l3_config(void)
>>  {
>>  	rdt_get_cdp_config(RDT_RESOURCE_L3);
>> @@ -840,6 +845,8 @@ static __init bool get_rdt_alloc_resources(void)
>>  		rdt_get_cache_alloc_cfg(1, r);
>>  		if (rdt_cpu_has(X86_FEATURE_CDP_L3))
>>  			rdt_get_cdp_l3_config();
>> +		if (rdt_cpu_has(X86_FEATURE_SDCIAE))
>> +			rdt_set_io_alloc_capable(r);
>>  		ret = true;
>>  	}
>>  	if (rdt_cpu_has(X86_FEATURE_CAT_L2)) {
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 9ba771f2ddea..0e8641e41100 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -191,6 +191,8 @@ struct rdt_mon_domain {
>>   * @arch_has_sparse_bitmasks:	True if a bitmask like f00f is valid.
>>   * @arch_has_per_cpu_cfg:	True if QOS_CFG register for this cache
>>   *				level has CPU scope.
>> + * @io_alloc_capable:	True if portion of the cache can be allocated
>> + *			for I/O traffic.
> 
> Reading this again I think the description can be improved since technically
> resctrl does not allocate a portion of cache but instead configures the
> portion of cache that device can allocate into.
> So perhaps this can be: "True if portion of the cache can be configured
> for I/O traffic allocation."

Sure.

> 
>>   */
>>  struct resctrl_cache {
>>  	unsigned int	cbm_len;
>> @@ -198,6 +200,7 @@ struct resctrl_cache {
>>  	unsigned int	shareable_bits;
>>  	bool		arch_has_sparse_bitmasks;
>>  	bool		arch_has_per_cpu_cfg;
>> +	bool		io_alloc_capable;
>>  };
>>  
>>  /**
> 
> Reinette
> 

-- 
Thanks
Babu Moger
