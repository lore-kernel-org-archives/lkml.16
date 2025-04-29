Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1E01BDCF;
	Tue, 29 Apr 2025 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745961951; cv=fail; b=eGT/4aBIcx41jJz/RMsCN7te+pkqTs5XsHG+TXm/a0sFxNg+dwLolj1lyjHL06N2ScaV3IrktjSrlfxIq6yQvbQNmtgFsoIMZb66/kRDAqQow9NkAH2vGgjDv9HeQ+OfRLJxo0Jt2tf9GGefDguIaxBIGVHfUi88eHUULFrIQ4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745961951; c=relaxed/simple;
	bh=cY3dvhpVvH619ZM8YKNG9TlVWuWtmZvXmdaZJUR6/0I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CPi/I7/BOYH2stvAfV7a+3G+HsHRCRY78nuEe8buNzHe47imnWYJd0n7ghDm3V9fpViEXq97pu80N0rPOzbSQcj3slb+q3Q5K+6kOcHbJyGiMZax9EPHhLD6oS4pJo78epVuwMZFBqalrNcNqkUcFK++tRiaQBSJM7Y03eZZRrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bt3aE2OM; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bt3aE2OM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gS6SVpxSjPob5aQlGO7f1xEv2Zf+g93uvAh3euTX+nevPQKklBJLl4Rdgk3OJk9gK/Owa3gpYT5eswvxwuVcgn7dXDM1c3eDqEdMe2qLlOCtmrIokP6UhwDZZDHRCthYn/dZ/eFZgK8P3Ok4Mk5It0VANqu6XZWRmCgQpUf8pU2xUuMuBfGUUc/Rpl+S2apQa+jROIRZPcOpWpCswunBi+nXyAtFRttxmMgcnI4Ws+nxXjHFziYs4Nu+4ktoafiOSgblKQZzEi4fBQPw+yTVs4wY2vuldEW8ses9N19rlKU4EGoZH+8KonKWxmHMyqZg0WuHZj0VzU6Dxa2ntGh8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpJrdPNuI/Pa2iozjeqjQdBkbTGwVJVk19q8dyw9AY4=;
 b=Ect67yj6eoeHEosklDUDP0ZUFWvqKYYguUnO5JzPD6QjxsFZofc0sjAqGWhyGabyEIPp2ygwd35ZRkL6JLNkP5urLqyMlEfbEavKARL5pl+W9yhLcGnPrCsr82oNthMJRY3+VadJzGbZrhH2XJMCFSIHR8OF3suCrSqtR+OWQNIiLn+vfnXS2CR6S/Nvxss4WbbCgxLgLA42nGNivIr8hbctc8O8A2MEGhi5G9bPplbGKpdw/UIVii7tNGr+/49dbZfa9ayNUh/HABlKRZ63l7/juPcTpJOa9PQEmeCp3iEXH7gwJgH6hFTvbBj14hqFxlN7aUdwSvQcQaqOOReLGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpJrdPNuI/Pa2iozjeqjQdBkbTGwVJVk19q8dyw9AY4=;
 b=bt3aE2OMC2Dcx7SvxkjZNiuXwb1+vQnQ3Tnj/CPLp8k4h4hJ4pOI0tRxBWcb/zxS/iQ+OGzPI5EAgeiX6odSA2zGoGZ49f0G3T+Xjmwu3jFWzN9wgsz9qR0TQohMueaT60u0kI9pDpvm3LPFe4igi0IGqE0i2vmwJyvGE9ej4oU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by IA1PR12MB6090.namprd12.prod.outlook.com (2603:10b6:208:3ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 21:25:46 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 21:25:45 +0000
Message-ID: <043d2044-f8a0-4fe7-8c98-7ba9cc394b33@amd.com>
Date: Tue, 29 Apr 2025 17:25:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: Armin Wolf <W_Armin@gmx.de>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250417182923.1836092-1-pratap.nirujogi@amd.com>
 <b6701589-4aa9-4988-8b28-4b0ae60daa43@gmx.de>
 <7d17ec49-e075-4b04-ab00-3eeabf58c4f2@amd.com>
 <815f1029-fc0c-4211-ab47-c9ca985f52f1@gmx.de>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <815f1029-fc0c-4211-ab47-c9ca985f52f1@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::31) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|IA1PR12MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5dc784-7fcf-437a-dae5-08dd876466cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmhrVG1UQ1crZjNIYUNiblFHdk5HS2s4V25UK2ZsZmZTNUNUZGRQZXFMZlVD?=
 =?utf-8?B?cndtM1hXYnNWcklvSUZQRXhPYzVReVI2b0RFb2k5VWxyWncycUJVUHF6VVBG?=
 =?utf-8?B?a3NpTld3dkI2NG9IbFpnMTBxYUlZNTg2SVJyZVp2UEo5aDFBVVJ3aEwwNE9I?=
 =?utf-8?B?d3p5a0I1TDdqbFA3cnB5amdZaTVuVTdkb0Q2TGxUTTkzYkFaUXpqQ3pIZjVk?=
 =?utf-8?B?R2daYmZZT2M5YjFIc1pxbWNsUzNobUtwYkFJWUdycEkzcTc0Z3BnSDBUS1JV?=
 =?utf-8?B?QlhkbWVWakxQUWFLM2lOM0dTNmFKL1pNejNLWEJDQ2FnSUJ5dkUxaFI2eGRm?=
 =?utf-8?B?QXFxMW10MDJoS3ZNQlA5Snk3OEh5cGN5aHV2Wll5aXVRZW5wc09ndEtZS3pm?=
 =?utf-8?B?dklsTlY2R01Rb0NmOThYTWRiNDNQVFQ0TlFqaFZ5YUxiK1o1RzJmSWIxTGpE?=
 =?utf-8?B?R2g0TjhxdUVBcnVoQjZnNFZmMTlkNmlpcy9ZdTgvNTVwRGtvWGFFZm0yNjNX?=
 =?utf-8?B?RjZrMXBJaDk1YjA4RWJES3NYSnlzbk9hY3FFTXZjRU1HVWUycXJXU1RWZlZt?=
 =?utf-8?B?UC9EY2JmSzFNemE5akdUam5FdnFZTDk2QzJ6MWxkRGdadjhjZE1TSDFxU05o?=
 =?utf-8?B?RE9IanFMWXl1K3dpMnJRS0lNQ2F5UE1mV2RzM05YUi9WT2lTalRsOEtJOXBW?=
 =?utf-8?B?cW01dFY0SGZtaEdhYmlza2ZvUDlNeGRoTG1LMHJZa2wwTFh6cWx2Z041V2Rl?=
 =?utf-8?B?R2lVWmdYaFpHV2Z0ZW9pL3JlcnRYSCtLTWtMRFVIU3NwMWR2M0VCN2pNY0wx?=
 =?utf-8?B?OGgvOWZ3eWJ4NjhKRGM2Z2FQR1doVXVNT1pZTTBwcXpqYW9FcXNYRmdVU1JN?=
 =?utf-8?B?MUVLRDJXc3J0L0Q2eEZqbGtLOGhuSy9EMDVqNzJkb0VFaWp4czhJQW42WUoy?=
 =?utf-8?B?eXgvZEdIMVNRVVlVckNadGs0anhKd3VROEI5R2ZCbjAvcUdDUFlTZHk5eUg4?=
 =?utf-8?B?dThyT3gxRVBqVkVaWGF0Z0Y5T2VrRDZjdjJrOFZZbUVKWEVxZGM3OXR2RG4z?=
 =?utf-8?B?U3VXaGRwSHhFbytLQ1M4OGhvblZLMW5tOEVqL3dGM2lQWmVDUXpwSjc3c3kv?=
 =?utf-8?B?TnRqOThQOEpKYzRrcTBpTlJwalZVSUt5OHArUzdXM2h5Q2JTVFJ2MjZsOGx0?=
 =?utf-8?B?azBqKzRRNVE1dThqemx4M1R0YmwxejBZd0J6S1pWUE4yRnppdERlSGlyNnZh?=
 =?utf-8?B?eGEwZXg0WUxmSU9odG5zYU5ONEJ5L2FLUmRmaFJvWnp4T3IwYnptL0c2M0Nv?=
 =?utf-8?B?YlNQMSsyYkxYZXdrQVd6QWhML3A2cXNwZ3NocWRybUpaN2VQTE5uNUFEOUYz?=
 =?utf-8?B?dGM5TElmS1JNU2lFRlNLVFB4ZUJDZmhKQkQzK0tQN09oSHBEa3YreUU4TGty?=
 =?utf-8?B?QURwc2w1dFJrVEpQeldreXVEWVlzbDU4U0dGTzhvU0dsd2JIa1lLTjBLdGp0?=
 =?utf-8?B?ejA2elBGU3JzTlRyVWZuNkRBWVp5enVzUEMzK2FqRjB1NXUzZk4vSXlJUmNp?=
 =?utf-8?B?U3g3cTBUdFU3U2wveEhmZkY4VmJyZ2R2eU9Yb3gzK003ZzdoY0F5TTF5eXEz?=
 =?utf-8?B?MDdhWTM5dlRnZ0pWWjFObHg0eWZLZ0FGa0hOY1B4WjVHMFhtdUtRSFBQb1Rn?=
 =?utf-8?B?eUw3aDd3SjRQQU83MXAzUkNmZnlyN0tzZTFCVGZGN1JRNGdnbXlRcGhtQVZF?=
 =?utf-8?B?TjFhUUlqNUo3Nml5SnZ5QmhVLy8vOVZLQUlaL1c0WWIzYk1rRjhaT04wRnV5?=
 =?utf-8?B?a2VjNEk5OStEckNsZXEvK0NKQVRVbDV1TXpnNklJZWJXbFVjbklicnNLQldO?=
 =?utf-8?B?azF0M25CeVZiM3hjaU9YZW5vd2dLZzZrMUNSRGxMUWtQTWpXNkRyb01rYjBV?=
 =?utf-8?Q?K2dfYjf+OyE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rlh4cWtYNXFQWnRJOS9uNysxTUcyalpEY3ZmT2F0Z09vNjBVR3BWNkpqTk5i?=
 =?utf-8?B?WW9WNlNwdnlBNnFycVljaEdLTHhRSU81ZHlXUm1ZTksyK3E0V3Jud0RCVFpy?=
 =?utf-8?B?VU41MVRMSGZNcFF3Q1doL0s2UEd6L204b09GRGk1R2VnRHFmZVFSWVl5ZDk4?=
 =?utf-8?B?OEw5cHFxSEdYYWQvSThWMmlvUnkrZXZsenVrYnZXcjREbW5XREZISjV5SFRV?=
 =?utf-8?B?VTZRZ1NrQTdGb1EvQ2RpMU1vZjVNUGE1Z2RmYlV2cEs0cGVxWlU1TkhxMGRm?=
 =?utf-8?B?SnZJcUxYckRlU1BmNjhraWtneU5kVk5rK0RmaGZkTmZlV3Nmb3hoSTFrWU5R?=
 =?utf-8?B?WFEyQ1Y2SGpYZlZjZE1zUU9VbnlGNmdUenBmMWs5Mlp4clhOVDE1aDBWSldD?=
 =?utf-8?B?YkxORDRrZ01NREhuUWxNY1pKMGoxZ1I1U1FDM0czSUZKRmlEd2NjUHUxcGp6?=
 =?utf-8?B?cGhGblpzTXpiTUlVRGpOazJaTWZXQWhwT2tZaFlVNWM1dW5SY0ZnVnpERytn?=
 =?utf-8?B?SFNQbSs0cHJOKzJqSElKSFY1VHI2SENzaWhSU1hScloxWTl2YnY2dDZzWmMy?=
 =?utf-8?B?SkU1Q1QzbUZibGN0aTkvbGtURGNUMlcxQ0hFUDcyeWtEM3JqcXZoeEVBckhP?=
 =?utf-8?B?RWtOOWZQWTI4Q09WSkhlRFdDQm9PTVVVV2o0akhrdW1wVi9KZWNhZjVpcXZ5?=
 =?utf-8?B?RjdxNXIzQ0Y5TlB5OEVoRWhRRFdqbHh5RmE1TGFMMzlmenhJb2ZoT3M4d2xN?=
 =?utf-8?B?UWlxdndNWWxwaWFabjFCdXBJdHpJR3FzZUZIUWh1TEZjSnRBK3FaTzFyNlQx?=
 =?utf-8?B?L21KYThsRlpTeWlCZWZ0anFMTXIycDR0Mkg5NFVBZmNGVkVTbitkT2xrVzlZ?=
 =?utf-8?B?US9vODNPTWVhYyt6MmtzZWpiVzFGNWpOZnVMUUV0cWlUUWg5QW1LRXcyblNs?=
 =?utf-8?B?ZGRzVGhwbS9VdGtnSGwwUlprSU5jMnY1QkJrQWxWcDkwWDdaUHJjMzZqL215?=
 =?utf-8?B?dXcvZjZTbFdFSVhENjNYMlpJRUdVeHVIRG9vbjAvRzF4NGlWNlNxUS94T2pC?=
 =?utf-8?B?WERxWmN5aUFDRzVaM3JxYTlzYVZPUnQwSE9xeWo5bER4alNkWVFGZ0V6bGhq?=
 =?utf-8?B?MEJneVR0dXlRMlFjUWxSZUxtRks4VXhUM2pUL2liUkdDbTNXUDVyclM4ckIr?=
 =?utf-8?B?K0cwbytpUks2OGxuK0VRR1gzb3JWNk1CamhneExGTVQ4YzE1aENsUlUvcnFi?=
 =?utf-8?B?TlRSTDZha0RyTGpvMDlFdkw4QnVKeXJjZ2xQTitJNDBBNEswckRmUkIxdjlH?=
 =?utf-8?B?MmpnMDB2Q1I5Q1VmMWtKRUVHSWFuNHhaV0h6SnJyQmNQcFJlWHRFN05tZUQv?=
 =?utf-8?B?cyt4amFGNGJhUkk4TktBYWdLdlgzdkxTN25XNjVBUDhiVThteHZvRnpzQXhx?=
 =?utf-8?B?RUYvZzlib3RKV0F2b0gxVE4rMmd3V3JuNUtBVTE1RUpPdXZEZXppL2p2V3Q0?=
 =?utf-8?B?SmVCeW1qeUN5aE1HaVNoZmhFTGlIMFdIMjc5QktZdWdhNmxwbThLbHRUaFI1?=
 =?utf-8?B?MksreWtOSHZiWnJ2cW5sa3Q4RjVaa2RKUlNXMHR1WlY1QjBER1hEMkpEUGpL?=
 =?utf-8?B?Mm5OYWZxTGRoTm15RmRVUm9mS2hwKzNaVmxHTDF5aGZuZG5XdnBSQmpvcFds?=
 =?utf-8?B?alkxZ09iYzZjWVN2YUtMKzlua0RYRkJjcmIxOFFDM0RHVWw1WGRFNlo2eFVa?=
 =?utf-8?B?QnJyd0JWV0krN1piMmJlWGlWY1FjV0QyYVhpZUlTWXNIa2dvdFNLNSs2cEc4?=
 =?utf-8?B?SUpjRDhYdDFvdEVmWG4vOExKRy9vSURNejcyYW1YZE81R25PSk1YeURyVUF3?=
 =?utf-8?B?eU84L2RsYlhmS0laQk9QeSs1Y2FrSnZXMSt0aFRyeXU1My9QVzYySU5tZWFK?=
 =?utf-8?B?alUvQVhES2tjM245bG1NbURyUDZqTlZBTEJHMzlZWXAzYmRkNVNkb3p4ejI4?=
 =?utf-8?B?MyttM2hCOWE0UmE2Wk5hdVdBS1ZjdDNRUGV0N1k0cUVzS2d4dC9ZY2YvZHE5?=
 =?utf-8?B?MjJ0UWpxTTZTMS9jalJVN3N6bEd3ZCsyV2NIdk1TVWs5Q1FwMTVvWEZ2ODRB?=
 =?utf-8?Q?QQI/v8B0RyGsb6pgCcKNhyCfA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5dc784-7fcf-437a-dae5-08dd876466cd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 21:25:44.9979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWjfZmAOZz2tbnW2Nzr/r0vjct6w3/KiQyskNvjE1WmYT+lNsskaacanaJsGVtwgYIIX7jb/wZMYhTRMUlYUuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6090



On 4/29/2025 4:52 PM, Armin Wolf wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Am 29.04.25 um 20:33 schrieb Nirujogi, Pratap:
> 
>> Hi Armin,
>>
>> On 4/26/2025 8:25 PM, Armin Wolf wrote:
>>> Caution: This message originated from an External Source. Use proper
>>> caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> Am 17.04.25 um 20:28 schrieb Pratap Nirujogi:
>>>
>>>> ISP device specific configuration is not available in ACPI. Add
>>>> swnode graph to configure the missing device properties for the
>>>> OV05C10 camera device supported on amdisp platform.
>>>>
>>>> Add support to create i2c-client dynamically when amdisp i2c
>>>> adapter is available.
>>>>
>>>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>>>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>> ---
>>>> Changes v6 -> v7:
>>>>
>>>> * Use devm_kzalloc() inplace of kmemdup()
>>>> * Use IS_ERR() inplace of i2c_client_has_driver()
>>>> * Remove the extra cast
>>>>
>>>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>>>   drivers/platform/x86/amd/Makefile   |   1 +
>>>>   drivers/platform/x86/amd/amd_isp4.c | 269
>>>> ++++++++++++++++++++++++++++
>>>>   3 files changed, 281 insertions(+)
>>>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>>>
>>>> diff --git a/drivers/platform/x86/amd/Kconfig
>>>> b/drivers/platform/x86/ amd/Kconfig
>>>> index c3e086ea64fc..ec755b5fc93c 100644
>>>> --- a/drivers/platform/x86/amd/Kconfig
>>>> +++ b/drivers/platform/x86/amd/Kconfig
>>>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>>>
>>>>         This mechanism will only be activated on platforms that
>>>> advertise a
>>>>         need for it.
>>>> +
>>>> +config AMD_ISP_PLATFORM
>>>> +     tristate "AMD ISP4 platform driver"
>>>> +     depends on I2C && X86_64 && ACPI && AMD_ISP4
>>>
>>> Hi,
>>>
>>> just a question: when will the CONFIG_AMD_ISP4 symbol be introduced?
>>>
>> CONFIG_AMD_ISP4 will be introduced in the V4L2 ISP driver patches. We
>> are working on isp driver patches and planning to submit once the
>> review for x86/platform and sensor driver patches completes.
> 
> Alright.
> 
>>
>>>> +     help
>>>> +       Platform driver for AMD platforms containing image signal
>>>> processor
>>>> +       gen 4. Provides camera sensor module board information to allow
>>>> +       sensor and V4L drivers to work properly.
>>>> +
>>>> +       This driver can also be built as a module.  If so, the module
>>>> +       will be called amd_isp4.
>>>> diff --git a/drivers/platform/x86/amd/Makefile
>>>> b/drivers/platform/x86/ amd/Makefile
>>>> index c6c40bdcbded..b0e284b5d497 100644
>>>> --- a/drivers/platform/x86/amd/Makefile
>>>> +++ b/drivers/platform/x86/amd/Makefile
>>>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>>>   obj-$(CONFIG_AMD_HSMP)              += hsmp/
>>>>   obj-$(CONFIG_AMD_PMF)               += pmf/
>>>>   obj-$(CONFIG_AMD_WBRF)              += wbrf.o
>>>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>>>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/
>>>> x86/amd/amd_isp4.c
>>>> new file mode 100644
>>>> index 000000000000..461a10be5ccd
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>>>> @@ -0,0 +1,269 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * AMD ISP platform driver for sensor i2-client instantiation
>>>> + *
>>>> + * Copyright 2025 Advanced Micro Devices, Inc.
>>>> + */
>>>> +
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/property.h>
>>>> +#include <linux/units.h>
>>>> +
>>>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>>>> +#define AMDISP_OV05C10_PLAT_NAME "amdisp_ov05c10_platform"
>>>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>>>> +#define AMDISP_OV05C10_REMOTE_EP_NAME "ov05c10_isp_4_1_1"
>>>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>>>> +
>>>> +/*
>>>> + * AMD ISP platform definition to configure the device properties
>>>> + * missing in the ACPI table.
>>>> + */
>>>> +struct amdisp_platform {
>>>> +     const char *name;
>>>> +     u8 i2c_addr;
>>>> +     u8 max_num_swnodes;
>>>> +     struct i2c_board_info board_info;
>>>> +     struct notifier_block i2c_nb;
>>>> +     struct i2c_client *i2c_dev;
>>>> +     const struct software_node **swnodes;
>>>> +};
>>>> +
>>>> +/* Top-level OV05C10 camera node property table */
>>>> +static const struct property_entry ov05c10_camera_props[] = {
>>>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>>>> +     { }
>>>> +};
>>>> +
>>>> +/* Root AMD ISP OV05C10 camera node definition */
>>>> +static const struct software_node camera_node = {
>>>> +     .name = AMDISP_OV05C10_HID,
>>>> +     .properties = ov05c10_camera_props,
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>>>> + * ports node for OV05C10.
>>>> + */
>>>> +static const struct software_node ports = {
>>>> +     .name = "ports",
>>>> +     .parent = &camera_node,
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>>>> + * port node for OV05C10.
>>>> + */
>>>> +static const struct software_node port_node = {
>>>> +     .name = "port@",
>>>> +     .parent = &ports,
>>>> +};
>>>> +
>>>> +/*
>>>> + * Remote endpoint AMD ISP node definition. No properties defined for
>>>> + * remote endpoint node for OV05C10.
>>>> + */
>>>> +static const struct software_node remote_ep_isp_node = {
>>>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>>>> +};
>>>> +
>>>> +/*
>>>> + * Remote endpoint reference for isp node included in the
>>>> + * OV05C10 endpoint.
>>>> + */
>>>> +static const struct software_node_ref_args ov05c10_refs[] = {
>>>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>>>> +};
>>>> +
>>>> +/* OV05C supports one single link frequency */
>>>> +static const u64 ov05c10_link_freqs[] = {
>>>> +     925 * HZ_PER_MHZ,
>>>> +};
>>>> +
>>>> +/* OV05C supports only 2-lane configuration */
>>>> +static const u32 ov05c10_data_lanes[] = {
>>>> +     1,
>>>> +     2,
>>>> +};
>>>> +
>>>> +/* OV05C10 endpoint node properties table */
>>>> +static const struct property_entry ov05c10_endpoint_props[] = {
>>>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>>>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>>>> + ARRAY_SIZE(ov05c10_data_lanes)),
>>>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies",
>>>> ov05c10_link_freqs,
>>>> + ARRAY_SIZE(ov05c10_link_freqs)),
>>>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>>>> +     { }
>>>> +};
>>>> +
>>>> +/* AMD ISP endpoint node definition */
>>>> +static const struct software_node endpoint_node = {
>>>> +     .name = "endpoint",
>>>> +     .parent = &port_node,
>>>> +     .properties = ov05c10_endpoint_props,
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>>>> + * fixed to align with the structure that v4l2 expects for successful
>>>> + * endpoint fwnode parsing.
>>>> + *
>>>> + * It is only the node property_entries that will vary for each
>>>> platform
>>>> + * supporting different sensor modules.
>>>> + */
>>>> +#define NUM_SW_NODES 5
>>>> +
>>>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>>>> +     &camera_node,
>>>> +     &ports,
>>>> +     &port_node,
>>>> +     &endpoint_node,
>>>> +     &remote_ep_isp_node,
>>>> +     NULL
>>>> +};
>>>> +
>>>> +/* OV05C10 specific AMD ISP platform configuration */
>>>> +static const struct amdisp_platform amdisp_ov05c10_platform_config = {
>>>> +     .name = AMDISP_OV05C10_PLAT_NAME,
>>>
>>> Where is this field being used?
>>>
>>>> +     .board_info = {
>>>> +             .dev_name = "ov05c10",
>>>> +             I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>>>> +     },
>>>> +     .i2c_addr = AMDISP_OV05C10_I2C_ADDR,
>>>
>>> Please reuse board_info->addr.
>>>
>>>> +     .max_num_swnodes = NUM_SW_NODES,
>>>
>>> Where is max_num_swnodes being used?
>>>
>>>> +     .swnodes = ov05c10_nodes,
>>>
>>> Why not drop .swnodes and referencing ov05c10_nodes directly?
>>>
>> Thanks. Some of the variables phased out with the ongoing development
>> and patching. I will take care of removing the unused and redudant
>> variables in 'struct amdisp_platform'.
>>
>>>> +};
>>>> +
>>>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>>>> +     { AMDISP_OV05C10_HID },
>>>> +     { }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>>>> +
>>>> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>>>> +{
>>>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>>>> +}
>>>> +
>>>> +static void instantiate_isp_i2c_client(struct amdisp_platform
>>>> *ov05c10, struct i2c_adapter *adap)
>>>> +{
>>>> +     struct i2c_board_info *info = &ov05c10->board_info;
>>>> +     struct i2c_client *i2c_dev;
>>>> +
>>>> +     if (ov05c10->i2c_dev)
>>>> +             return;
>>>> +
>>>> +     if (!info->addr) {
>>>> +             dev_err(&adap->dev, "invalid i2c_addr 0x%x
>>>> detected\n", ov05c10->i2c_addr);
>>>> +             return;
>>>> +     }
>>>> +
>>>> +     i2c_dev = i2c_new_client_device(adap, info);
>>>> +     if (IS_ERR(i2c_dev)) {
>>>> +             dev_err(&adap->dev, "error %pe registering isp
>>>> i2c_client\n", i2c_dev);
>>>> +             return;
>>>> +     }
>>>> +     ov05c10->i2c_dev = i2c_dev;
>>>> +}
>>>> +
>>>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>>>> +                           unsigned long action, void *data)
>>>> +{
>>>> +     struct amdisp_platform *ov05c10 = container_of(nb, struct
>>>> amdisp_platform, i2c_nb);
>>>> +     struct device *dev = data;
>>>> +     struct i2c_client *client;
>>>> +     struct i2c_adapter *adap;
>>>> +
>>>> +     switch (action) {
>>>> +     case BUS_NOTIFY_ADD_DEVICE:
>>>> +             adap = i2c_verify_adapter(dev);
>>>> +             if (!adap)
>>>> +                     break;
>>>> +             if (is_isp_i2c_adapter(adap))
>>>> +                     instantiate_isp_i2c_client(ov05c10, adap);
>>>> +             break;
>>>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>>>> +             client = i2c_verify_client(dev);
>>>> +             if (!client)
>>>> +                     break;
>>>> +             if (ov05c10->i2c_dev == client) {
>>>> +                     dev_dbg(&client->adapter->dev, "amdisp
>>>> i2c_client removed\n");
>>>> +                     ov05c10->i2c_dev = NULL;
>>>> +             }
>>>> +             break;
>>>> +     default:
>>>> +             break;
>>>> +     }
>>>> +
>>>> +     return NOTIFY_DONE;
>>>
>>> You still need to handle the situation where the AMD I2C adapter is
>>> already registered when
>>> registering the bus notifier. In this case you will miss the
>>> BUS_NOTIFY_ADD_DEVICE event.
>>>
>> Thanks. I will cover this case using the below sequence.
>>
>> 1. bus_register_notifier()
>> 2. i2c_for_each_dev()
>>
>> If at all i2c adapter is registered by the time
>> bus_register_notifier() is called, it should be detected in
>> i2c_for_each_dev(). I will add checks to avoid creation of duplicate
>> i2c_client devices when both notifier callback and i2c_for_each_dev()
>> passes especially when i2c adapter gets added between 1 and 2.
>>
>> Please suggest if there is an alternate better approach that I should
>> use to handle this case.
>>
> This approach seems good to me, i2c-dev uses something similar.
> 
Thanks Armin for confirming and providing the reference. I will address 
the comments and submit the patch V8 soon.

> Thanks,
> Armin Wolf
> 
>>>> +}
>>>> +
>>>> +static struct amdisp_platform *prepare_amdisp_platform(struct
>>>> device *dev,
>>>> +                                                    const struct
>>>> amdisp_platform *src)
>>>> +{
>>>> +     struct amdisp_platform *isp_ov05c10;
>>>> +     struct i2c_board_info *info;
>>>> +     int ret;
>>>> +
>>>> +     isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10),
>>>> GFP_KERNEL);
>>>> +     if (!isp_ov05c10)
>>>> +             return ERR_PTR(-ENOMEM);
>>>> +     memcpy(isp_ov05c10, src, sizeof(*isp_ov05c10));
>>>
>>> This is not what i meant. I was complaining that
>>> amdisp_ov05c10_platform_config contains both
>>> static data (swnodes) and data assigned during runtime (board_info-
>>>  >swnode, i2c_dev, ...).
>>>
>>> Please do not use a global instance of struct amdisp_platform for
>>> initialization. Instead initialize a
>>> fresh instance of this struct inside prepare_amdisp_platform().
>>>
>> sure, will remove the global variable
>> 'amdisp_ov05c10_platform_config', and will take care of initializing
>> the amdisp_platform instance in the prepare_amdisp_platform().
>>
>>>> +
>>>> +     info = &isp_ov05c10->board_info;
>>>> +
>>>> +     ret = software_node_register_node_group(src->swnodes);
>>>> +     if (ret)
>>>> +             return ERR_PTR(ret);
>>>> +
>>>> +     info->swnode = src->swnodes[0];
>>>> +
>>>> +     return isp_ov05c10;
>>>> +}
>>>> +
>>>> +static int amd_isp_probe(struct platform_device *pdev)
>>>> +{
>>>> +     struct amdisp_platform *ov05c10;
>>>> +     int ret;
>>>> +
>>>> +     ov05c10 = prepare_amdisp_platform(&pdev->dev,
>>>> &amdisp_ov05c10_platform_config);
>>>> +     if (IS_ERR(ov05c10))
>>>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>>>> +                                  "failed to prepare AMD ISP
>>>> platform fwnode\n");
>>>> +
>>>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>>>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>>>> +     if (ret)
>>>> +             return ret;
>>>
>>> You need to call software_node_unregister_node_group() here when
>>> bus_register_notifier() fails.
>>>
>> Thanks. I will fix this in the next V8 patch.
>>
>>> Thanks,
>>> Armin Wolf>
>> Thanks,
>> Pratap
>>
>>>> +
>>>> +     platform_set_drvdata(pdev, ov05c10);
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static void amd_isp_remove(struct platform_device *pdev)
>>>> +{
>>>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>>>> +
>>>> +     bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>>>> +     i2c_unregister_device(ov05c10->i2c_dev);
>>>> + software_node_unregister_node_group(ov05c10->swnodes);
>>>> +}
>>>> +
>>>> +static struct platform_driver amd_isp_platform_driver = {
>>>> +     .driver = {
>>>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>>>> +             .acpi_match_table       = amdisp_sensor_ids,
>>>> +     },
>>>> +     .probe  = amd_isp_probe,
>>>> +     .remove = amd_isp_remove,
>>>> +};
>>>> +
>>>> +module_platform_driver(amd_isp_platform_driver);
>>>> +
>>>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>>>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>>>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>>>> +MODULE_LICENSE("GPL");
>>
>>

