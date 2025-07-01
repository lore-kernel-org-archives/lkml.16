Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2083.outbound.protection.outlook.com [40.107.96.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B52197A6C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361396; cv=fail; b=AgYIF1cHCiBz7idq05zsda68C0ZtSHR9Y+AF171tyJ28mDMPpLo1as3v+wk+9nkiFXxLfq2o/Nlu8wQi3bfW1KQ9ZNqnzsx3+J9qHmY4bR4TSdEL0ceYUOVO+qsJypCUExol7CZm9xUvP3EbfWkXyJ0WCdivxe3rBHRtv/64MEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361396; c=relaxed/simple;
	bh=OQwERIaGknHmv30UwH4Mkuu+7zEALZC359JvMmDvBAc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VP8OqaKbHRkeVPFZeiSJ8E+d5VVpercunCCr3TBiUJmvMTVVbdWltjOAls/I135Q6AR57dcUgC4bYA2SPsdXq6zJEA8/SFn7tK7OTzgNIGUAnQiUvIRSUlYqHHHgItEb72YqkE4ws1G3aYRDjxaM2mlwtXfwLbINthDF3CsWGyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jZh9lhwg; arc=fail smtp.client-ip=40.107.96.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jZh9lhwg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRZjgFQ6tv9BF7JCHvoAhJfNTqgrH71tyvvpoHK/8NRCrbZdqR72y4WesUdUJk+PBKWJEq662vEFRu08EJ9B+Wom/Vpm9PwlYaavdg0siFkehAbhE9SrxaoLXMTv2GSqqTh1kYaVxD0U/ZmVU62pgq28GeQOJCflK7kRjxCmCH4rxLYBtqqK/2vwhsJPY9Ub6QeMCC5egDM5fc8u4SwtRUqG1s6RZlmJDGuaJY4ourA95F7QNFB8gEIqfk6JaGvcyEKah5Q1t0ndgYhOD4GjKB3AkdCTiWzxxNhFxNsa6ojW+pW5/fP7Tn6z8ObMW3CPjW7XfZSgcH0rIgOhCwfrXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXJtMidgt9rJf5aVLDQTUVdwKn5c9ICrujeQ02WVv+c=;
 b=olGNrV3GaqCCeaoXVSzNC+kh4WBCPim5AiAELMPrtCtJK51M2S8SUG8DCf7k6com/tbrOJ5/UyqowLOTrJLmV7hbecqgl+vFaKTcIkOE5we2bIdbcseLFeCVrABcaVXFwgWBibw8jcQ+HMqyMjAX0y0Myl4Hhr6uZmR7QKCu3wxMZQOR8YxgyUfQ/exxXevvduNhpRuw7uBbN8H5B1GOh43z94bdQLptpLxLRLz0b0vEDYfMtukkmmBB4NpP8CvafSioWUR6EYHCld8ps7aiLPgjedAdObLqmSjaVE4pBaAQApdcp991AeI+0gtm58S8oplCGVPygyNctzwSA2iBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXJtMidgt9rJf5aVLDQTUVdwKn5c9ICrujeQ02WVv+c=;
 b=jZh9lhwgMAXynlEQAsvxM9lCA4E5LecNhzV3bUnAH5Fro2pfAa6opP8A4dZRQZHTJ5ZLcNf9JAOZzhbdlRNsqT+zbAZ/nz8jyDvX0r8sMXcYKE98qvhsMsZgiPFMHFnqP0kIs5ujl06IkZZoKI7DO92ltFYCtVwfQhVgpg7o8wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10)
 by CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 09:16:32 +0000
Received: from CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753]) by CH3PR12MB8909.namprd12.prod.outlook.com
 ([fe80::b55b:2420:83e9:9753%6]) with mapi id 15.20.8880.015; Tue, 1 Jul 2025
 09:16:32 +0000
Message-ID: <fcb1fe6f-56c2-46f1-a8bb-1a97916af892@amd.com>
Date: Tue, 1 Jul 2025 14:46:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] misc: amd-sbi: Address copy_to/from_user() warning
 reported in smatch
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, shyam-sundar.s-k@amd.com,
 gautham.shenoy@amd.com, mario.limonciello@amd.com,
 naveenkrishna.chatradhi@amd.com, anand.umarji@amd.com,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20250701054041.373358-1-akshay.gupta@amd.com>
 <20250701054041.373358-2-akshay.gupta@amd.com>
 <2025070119-kitchen-drowsily-1f2d@gregkh>
Content-Language: en-US
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
In-Reply-To: <2025070119-kitchen-drowsily-1f2d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::19) To CH3PR12MB8909.namprd12.prod.outlook.com
 (2603:10b6:610:179::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8909:EE_|CY5PR12MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 883233c6-238f-4591-f4da-08ddb87ff7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0JYeGYwT1RHRW9lWXdHaTBKYzB0VHY2MDkwOWtKa1FySGhxWGJ4M204UHJI?=
 =?utf-8?B?djBEOEM2cU9jT2t2a1BoUU1JQ2d1QU1zUWtWSWZsSDRFODlHZlE4QVR5TEhU?=
 =?utf-8?B?TEtpcnhlbnY2ZEthd2xEcDFjZy9GTUlvU2dudHFGRGwvNE10QS9Eck5qMUov?=
 =?utf-8?B?NjIzZHhlVWtUbmZ0VndMaVVaRUhGOUJ1L1ZRWEZTMEdqemJTSzFhNzA2Z015?=
 =?utf-8?B?WStHelVzMWpzTjNVanN2bzB2M1ZrZG94SzNRQWE0TlhxcHRFOEJEZEhVcTdp?=
 =?utf-8?B?RkdaNHo1NmlzaFdLd1RicXBrM0daSGQ4RGkvdGx5c0I4TTcvMTJXd28vb2FX?=
 =?utf-8?B?cmR5K3Y2aEJTak1DSVZSdExhTVFlYnN2emhhTW1iUWd1dTJsWGZnb3RjTVQz?=
 =?utf-8?B?WmtXMFl3Ny9ha05CZEg2dW5QdW81T0dIcFByeEwwWjVSeG53WU5rSmNrTWZS?=
 =?utf-8?B?QnRqbDdhMjFXRkJ4R1o0aE1lTDZ3ZENOY0psaEFKVGpGVlF3RXBSMnE5SEdr?=
 =?utf-8?B?YnEzdklqTDU0RVdFUWp0WTgxQjJyekxIalN0QnA3U1ZPZFBXZmVtdDMwK1k2?=
 =?utf-8?B?VG5WODVFYW9oUEhwak1yeE5iNU5UMHQ5aW03a3NUNjRCN29Kck8xd0pBajIy?=
 =?utf-8?B?clNVSnlyckN3LzVhak0vUTBSVHd4MVhOR0QwWUFWcjNGQ0dqQjVyTFB2NXMz?=
 =?utf-8?B?bnExaWZNNWxtdzRlYlJHYlViajU3bmF3WnN4RmQrSUlValNVa1Q2bFVleEpG?=
 =?utf-8?B?V3EwNERvTWVmMEZ5NVp4dTFzdmVraXBwNVRGajFmb1MxNmlNUVRRYTliU0NP?=
 =?utf-8?B?cDVRbWZnRUJLbmQ0bVo4Q0pNQ2M2c3lOWWppU05PNnZINitHdkZOMWZVdHVK?=
 =?utf-8?B?K3ZZbG5rTE0relMyR0xyZ1ZHaWZyVmxWT2RTQWdoNnRwL29FME1HcEt6V0s0?=
 =?utf-8?B?TGJnVFllemZKazFTYnp0aWdpWEZTbHJqcVkza0RZY1p1U3dxMk0xNUJUTDlu?=
 =?utf-8?B?T2tYODlLQ3grc093T3ovSTVrTExoemZ2eW1WZVlaZStyc3RnUzUwakJqOU9v?=
 =?utf-8?B?MFlJYTRLN1RKbWxQQnA3d2FhbVV2bVNNbWJoTm9IeUpmS1lZNzZTM0lob29u?=
 =?utf-8?B?ZnR4NElnT1pBemVnWEIwT0xMemhKVlZRY2dEQXVqU0FkWHV3bjdpV1dCNWw0?=
 =?utf-8?B?QUQ5Qm9IQ2ptdGdhWWVuc01oRlpCZ3YyVFcxTHBUMnlSSVV5bE8xYU9xM2Fz?=
 =?utf-8?B?NEVPbU92bVhxdkpyNSs0M3FHRUtEZHNGbndubDlUUS9SZy9DcUI1SlZnMFA3?=
 =?utf-8?B?SnJsWVR3LzZIUUlCZzNLY1hndnNoa2xvSTl6STBHaDBVanYvaVlJRlNpZEJU?=
 =?utf-8?B?Zy9KQ000NklleTJvM0FHbUxWYnNuNWVwQ0hTUEpReU8vYlhsTGxmaHZUM0py?=
 =?utf-8?B?ME9nemowcXlBeEpRSmMzdHgzaVpLYnpzeTVtNWp0L2J1bEZvaFhzTUZtOFpC?=
 =?utf-8?B?YkhrZWJrRjhQWGR5VmRtV1RYWFlHNHFBb0VOaHI1WFpCRHpRSDYvc0RKd2hK?=
 =?utf-8?B?NTdUbEo4Wm53RjZmRFd2WGZzeTZDcGtXUU1rQjdtcVFIdERtSGpqVXJWdENU?=
 =?utf-8?B?VHdMK2xrak5qczlPSDJlNWlpQzNadC9jdnhiOXNyWTdoYlU2WGhxbm5jNXEx?=
 =?utf-8?B?TWZrZnF5RVRpQlVuZjVxRzFKdEJmUWNGazMzL2FiMFFJdkQ3OFNNSi9NVUVK?=
 =?utf-8?B?ZXMzaHd4UDRsRTVSV2lHdVB3ZkFiVnlNYlh0V01Sd24wWUt4MTg2Wno1dTMx?=
 =?utf-8?Q?X/oYObZhu00TuqMai1og3bwIXTxiDL5Hd6x3c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8909.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXNNaUJmWWVRRTZSL05BS0hvU2Q5Zit6aHRkNHFHbTZBWnZiT1VVUThQK0ZH?=
 =?utf-8?B?RThmY2F2WXlVYmhGRzd5Z0hkaHdkUW5MWmhpUGZyVWVxZkhXVC80REMxQWJm?=
 =?utf-8?B?ZUd6WlQ1eUo0ODZHRmNvamFSeVFqMi9MckRoSW5leW1jUitYLzNVQXlaUGti?=
 =?utf-8?B?UC9iVGlZaDNoUVE2ZTIzU1crNDRDckVBVkxvbkhHdXNnYXd3Zm5KcWVpc0hQ?=
 =?utf-8?B?WlZVdkZzZUVVa1lFYUFwbkdsTFd4Qk5NQ25EVGtMcjNyQUV2d3RzL2tkTzcy?=
 =?utf-8?B?bFRhK0xjMGY3WEl6bGJPV2dCWHRKTkpzRUt0d0hFTXF6UkFMQ2sxYmNCTDA1?=
 =?utf-8?B?amlFejM2VUhrV0Fac01xSGVaOE9oNnp2clY2K0pyYkM1R3FkQ28vRVNxMVdB?=
 =?utf-8?B?cThOV25Bb3NsdFJkQ2FBY3hOWUM2dHpzUkw1M3ZJeFZOeHRIaWFubHQyUHNp?=
 =?utf-8?B?SGRaRkEwTU9HbE1vUFRiOUxxMEZtNUU5VkRIY3RSVncyMFdGMW1ubnpOeTBa?=
 =?utf-8?B?MXhmNDBEV0EvMVZCV0swVnplTXVVNWYwdDh4Z0VyRDRvOTl4Yjl6QUljQWI2?=
 =?utf-8?B?YTUrckhGSEZ3WWxpUkE4aWNtWG9hUS9qU2IrZUNnU0Y0WlZGODIxbk1tdkJp?=
 =?utf-8?B?eEx0MUIxNDZSWCtJOFY1d2VlMlhJckc0aFhUeEkwS1pjS3RIREdLUTcrL0Vp?=
 =?utf-8?B?VTJWcGZabzY1RHdBR3JuVmJRcUxrUDNRZy9RRTc1SWZBM2ZGd3hEbFFMUWNT?=
 =?utf-8?B?L3FKUGE0NEFCOGg0Ni9LRUNqSVUxbjNKTXB1dmxkQThadHEwalF6djFzUDNK?=
 =?utf-8?B?d3FDcnZpVjBtVnRxMlF1ZmRrdDVHTHFIQzFvd2RGdjJZMlVJMmx6ci8xeXVt?=
 =?utf-8?B?QTFTWUlkMmFUUWRQNmFJbnZGSTZYdTFEUzlZTkZLMTBIbzhFR3kxblNmVUZj?=
 =?utf-8?B?NlN3eTRPWXNJa3FVV3BjclNRMDRGMnczR2VGdG9XZ3dYNUlCY2VOcHhGeWpi?=
 =?utf-8?B?ellpbUFOcmdjcWlMeEF4dTdDVVhxVnlvRjJDQjA0Mno4Umc2V2tXRDNQdEtS?=
 =?utf-8?B?OUQ2MTN2Z2ZBT3JWZXdZMUJ4UUcwTVA4ZjlHdW9IZlBIMGFSYTNzc3ZDMDJX?=
 =?utf-8?B?N3VidVl3dllOUU05V0xDVThsSXRvTVczWllKd05saGtBOG5IZVJLMVY4Titk?=
 =?utf-8?B?VnVIbmg3M0F2M1Z0aW5EV2lYTTdIUEVzZmpVQjdrb0pJNmpkeTJ3eEQyZ3Bj?=
 =?utf-8?B?MENZWjdZaHJ2d0Z6QkpMbnVCZEN3cGYwd0dONHBQK1ZFbkZqTFpaSCt5bkp5?=
 =?utf-8?B?R000bVhERmRBMUlnNzlmeTRNUFA3ZStsekUrdWJmVC9xcWptME1KejQ5dGhu?=
 =?utf-8?B?SFk3UmsyNXhrUHl3a3I5NHROMmQ1eVkvbkpGL0p5c3BYdjBYNnZmMm1FWldj?=
 =?utf-8?B?azdsRDFidktWL0RhWEI5R1NzajNlVkV2VEJScVpIcjg2bXB4TWNQZUxEMjNU?=
 =?utf-8?B?T2N6Z1pvV0RLaEpJYzNPaHJoc1cvUHlMV2J4SzZqRUhGdDJnT1J2VTJieTVJ?=
 =?utf-8?B?YUczU05wa2pVQjY2cFZqUFZteGRKdnk5Q3E1aGVYZGlLYU1oa0hEanRLWGFu?=
 =?utf-8?B?eStTbk9xUG5qeUlxQ01mTTRQakpUS3RWMVBjY1h1T2VldTBSSGpHWjQxM3dz?=
 =?utf-8?B?RVFtaWNJNzdURytVd0NFQlBMK09VMUZ0a3FXVi85UVVWeUo5ck5BUzZGWkgv?=
 =?utf-8?B?bkdyVkhteXlCWmdobk03SmpGYlBZRlNPbmtjbkRhL2ppaE5CSTVuY0ZVTUFJ?=
 =?utf-8?B?YlV1eXpzeTlrN0JiQUFNazA4SXdNT0VyM3dZOHpuVHgyMFBKcUNUL1dPeHQy?=
 =?utf-8?B?SlhwK2NWbjVSdU9yYnZRUUxLU05UUGE2QWRhMHpKbFJ3bHJwVjVTNjU4RWhu?=
 =?utf-8?B?VW9NVlZzSkFESkdmOElQQXc4TzRnL0xOVHk3ZTBmem41ZmF0UjRMT2gwSGFm?=
 =?utf-8?B?V2tIb3hWeW15dmJKRlR3eXNyQmFkMUlTbFp6R1dOZFgvalUxWEE2WiszL2hZ?=
 =?utf-8?B?eHBOeFJZSlNIU2lpSDM2aVpGYVE1MS8vTzNOMUozbDBLbWJ3SHRINzNHbGJo?=
 =?utf-8?Q?uLgBQUYkuqi2JPGZ1lr+zBUwt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883233c6-238f-4591-f4da-08ddb87ff7f8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8909.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 09:16:32.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14CG+tUCC0QIjgDWzVGmIA8XoN2tqWsm5Z+HZ/IaBC5/jhhs1pjgKMubSGPJhmibm1UaT3VGsSwR4LlYgNMXqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6478


On 7/1/2025 11:19 AM, Greg KH wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, Jul 01, 2025 at 05:40:41AM +0000, Akshay Gupta wrote:
>> Smatch warnings are reported for below commit,
>>
>> Commit bb13a84ed6b7 ("misc: amd-sbi: Add support for CPUID protocol")
>> from Apr 28, 2025 (linux-next), leads to the following Smatch static
>> checker warning:
>>
>> drivers/misc/amd-sbi/rmi-core.c:376 apml_rmi_reg_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
>> drivers/misc/amd-sbi/rmi-core.c:394 apml_mailbox_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
>> drivers/misc/amd-sbi/rmi-core.c:411 apml_cpuid_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
>> drivers/misc/amd-sbi/rmi-core.c:428 apml_mcamsr_xfer() warn: maybe return -EFAULT instead of the bytes remaining?
>>
>> copy_to/from_user() returns number of bytes, not copied.
>> In case data not copied, return "-EFAULT".
>> Additionally, fixes the "-EPROTOTYPE" error return as intended.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/all/aDVyO8ByVsceybk9@stanley.mountain/
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> Signed-off-by: Akshay Gupta <akshay.gupta@amd.com>
>> ---
>> Changes from v2:
>>   - Update commit message to add, "fix the -EPROTOTYPE error return".
>>
>> Changes from v1:
>>   - Split patch as per Greg's suggestion
>>
>>   drivers/misc/amd-sbi/rmi-core.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
>> index 3570f3b269a9..9048517c088c 100644
>> --- a/drivers/misc/amd-sbi/rmi-core.c
>> +++ b/drivers/misc/amd-sbi/rmi-core.c
>> @@ -372,7 +372,8 @@ static int apml_rmi_reg_xfer(struct sbrmi_data *data,
>>        mutex_unlock(&data->lock);
>>
>>        if (msg.rflag && !ret)
>> -             return copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg));
>> +             if (copy_to_user(arg, &msg, sizeof(struct apml_reg_xfer_msg)))
>> +                     return -EFAULT;
>>        return ret;
> What commit id does this change fix?
I will update the commit message to address this, thank you
>
> thanks,
>
> greg k-h
