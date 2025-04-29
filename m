Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7154124E00F;
	Tue, 29 Apr 2025 18:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951605; cv=fail; b=YTdPb8sKfaq+tIjLmiXPoDDxGdI5VfxFmQddZTWYii9Y3sBUbyLX4M38XjdKRm4EbbZl6cTuFfJJPhidxlaKhtxXb3vCmixCqL8rYpEhMIHT54V3KkP2XgRNKyp2ytzR1lASqZZWIx59JjKNRZTHYeadKxxKrthKANNNTalUtfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951605; c=relaxed/simple;
	bh=N3F91SiNuQ09co8rIUgWHVNwajSm5dDUKaD/eIZB+DU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TQgDn0d9MOylzKqVmZ8QQYeFUKMfguL2elVs/yotmtKXbYutnty9CJXKnj5ddBmzt1HJxoFuUfHeYovKrKRnJ7drpw9OxIh8d4qN/uj+kjbn0fOGCVQwtxRaSXeSf3f03fFalwytSct4DimGS/wnogPhO86kO5fXrVygplvfjHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ot1jfdDZ; arc=fail smtp.client-ip=40.107.220.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ot1jfdDZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfDH3TyW2Fxfssva5X2PPuD6ZNdwuh/T+cK/+6x+pD1JSIXjOUAhjq215i+ZTLeZi2Blbu0CqYcuEmyL6LcAi2yfEMXqCVkXupsa5S78VLm6Da9VQtDJaYK9YfOG+QFGwAYHZ1qP1wYzDHRDa72NTleiVQ6v0y3mEpOnNzwlBJjSznrTdYt34dzhXEN0kXP1oFRfLTW+aDMv9xgSoxSWXPmuWpFydPYkbJ4NdnQp1kzMtPyZu8bGbGPbRBLdeod2+tdP2yndgxRC+tSNac38HmHXSyF65HSK+wEkHOeDAignxtc1hhVVW1aBjJiImjJUTunGvIhnVZ4e1RESY5fvLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQ/jyL4PQ9Cuc6ivjY/BLUU0EL+vH1Sl7zqimQrpKms=;
 b=gYjdNdw6J/Ma/wh16WvCRuh8rB6U9apmFHdZLmkB9LmHsbJ548e3Wgx+x7+KYbKnAyaqbiw3NYTXZSEWMbv+Xq2ViCGHKoTMD/ydG+OjIW/tocDOLhvNiGxx64JEUy7+rAH6bd7nRpXi2TnUb8NQUt8OfZbCUws+DNPDt5akIywpf/u8xnRtlEj47qIlGsNK1h2uTG3pwqvUpR2DjzxGtJwkKhuQUJA/p3+y05sH3dYICz9lxCV3uX5MxkFEdy4tRrAeZAN/pOdMu+lkrWv1JphTZ65rG+1aKaecGYgVA1Bdd9Ieqs4BBn0Bi+t+g+R0tGLG6QGOqU5r918gFP9V2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQ/jyL4PQ9Cuc6ivjY/BLUU0EL+vH1Sl7zqimQrpKms=;
 b=Ot1jfdDZJPb28oO4jOkQtrDvcf9BC80dUEm3cNcC+kbu5r8LwRUoVJhGf0+8bV22YjJixDnAvzpUemnIyT6BAIXxXjLQ2kHpZqfafekTcd1JmlG+UTICDPXJV5ZssCKdi8Z0wE3ZMlIDANc5xtVMV5CBI0pMVrqZs4k7LF+wtuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 18:33:18 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 18:33:17 +0000
Message-ID: <7d17ec49-e075-4b04-ab00-3eeabf58c4f2@amd.com>
Date: Tue, 29 Apr 2025 14:33:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] platform/x86: Add AMD ISP platform config for OV05C10
To: Armin Wolf <W_Armin@gmx.de>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250417182923.1836092-1-pratap.nirujogi@amd.com>
 <b6701589-4aa9-4988-8b28-4b0ae60daa43@gmx.de>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <b6701589-4aa9-4988-8b28-4b0ae60daa43@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTBP288CA0011.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: be51e30d-00c4-4e2d-9f0e-08dd874c4ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sm05a1pJdHVOL21odEhsN2xFenVSZVJJRDF1WVlJVWttMzc5L0FCY0tCcTFW?=
 =?utf-8?B?bXpkZlczMGQ3bU9TeFNWRExoMGxYRTBoVlFWTnQ0eVJ0a1Z3c05ydi8xZ1Rn?=
 =?utf-8?B?eERkQXVmTFpFbUFSeWNiMnp1bHNNempiWVMweDJ2ZVVZRldPNVBMeWJMem44?=
 =?utf-8?B?Z2h4S0hOS3FDMGgxY1poZm0zc2RHam5LTDloZm83clkreUJEUjdaTG5NZkR0?=
 =?utf-8?B?UlZJM1RRUFVoOWpicWlZWjJyaTRQOUpBY1hyZDVCVUhzYTY2akZqSy9tQy83?=
 =?utf-8?B?czJFSFEyL1pPZzFFakVLRk53Qm9nSTFrSEdTR0NqeVphNUZFazBHMURVTFVj?=
 =?utf-8?B?emNySFRzSkR4bk15c3ZkVEFyaGJzcThabjVrd0kydTFRRWRSbVY4MXh5eXFT?=
 =?utf-8?B?blUzeDAvZklCN29hZldaNDg2OEdXRksyL3ZtR2tLUkdCdFlXbnNySENieHpQ?=
 =?utf-8?B?RHdINlJranZNV0d0Q01aRzNDZzlUNHU2MVQzWURkZmxxKytyZi9pSjdXakdJ?=
 =?utf-8?B?VzJaUlR3TnRHWnI4S2VsZTFDYmN4cGFaSmdmRkJmSTcwelJaMzh4V2RhZGpa?=
 =?utf-8?B?aWsxMWx0cVdkcFVhSXU5VVoyTlFia2xZYUFCaWcyVzkyekpYdnlraE0zZGlw?=
 =?utf-8?B?WmdJNkNnQURsMTZLUHgyUXBYeVhwUFNKVGdwZkNKK212TUZ1K2Rkb0ZaQkZ6?=
 =?utf-8?B?eXdMQ0l5MWllL0tENmJnV1d5NndtcnVXaGcwNVpEQVdSMko5TXZsZkJtUXQr?=
 =?utf-8?B?eGJBQlJacmZ1ejk0cWpRZ1R3bSsydFIwY0IxeWpDR3hNNXFFZzgvQW1Cc3NY?=
 =?utf-8?B?QVpEUkhYMmx1OE9HVnI2SEVPK2tsWE1PUDdCNkhUd2d1TEowWUpINnJtNEJr?=
 =?utf-8?B?eGFITVNZSTl0TWRCamdoQUpiczF1eFlzYlpyU0JoYXBMNkdXeTc3S05KYU1Q?=
 =?utf-8?B?d1NycEczeXF5SHlCNGF3NHJvTVR6WGYvWDl4eWpkZjdubkJQRmJXSnYxQ2o1?=
 =?utf-8?B?UnowQkNFMCtqWGVZU3FHVGNDNWhUcS9YcFVMWkkyaGxuTFRBU0ZQWDFUSUZX?=
 =?utf-8?B?dmtCbm5WOE1RdGhmcVZCR3A1SEhQT2NkbENSTUlPRUNwUVBRNmZXaHU3WjZB?=
 =?utf-8?B?UU5EZDN4ekRZTSt3aUdoMEIwQzlZRGlPZTc1ZVVNSUY2NzI2S0FZVkNGb1do?=
 =?utf-8?B?Rk9RTlA5NUlCVlVUaUF4Qzd4YXVWbC8yS2F2bW1CSDB1cW1sYm5YR1p5VGZS?=
 =?utf-8?B?L24vTWhDeHUydG8xaW5KT3YzNEJlWktlMkp6anBBMkwrTW5yNEtDanRpSEJ3?=
 =?utf-8?B?OGRvTWpCUitIeEYwa1NBUnQrL05mbXhSeGI1U2kxa0dDWWtjQTlRdnQ4M1Zn?=
 =?utf-8?B?Q2FwMmg1NjlGMFJybGxiZmZzc2YvZjVWRGg1Z1h6d3Z3cnlzeG04UkhoVXQ0?=
 =?utf-8?B?UDlqcjhQNE9KTGR0ZEU5VFpXOVZLQ3lRRHJGY3hrbjhXeHlhUXFiaW5RSXF1?=
 =?utf-8?B?ZjRBa2ViMGFUM3VER2RranQwUGdqdHljeGxOaVJidEk5TFJSRlllRGpyeVla?=
 =?utf-8?B?VkRlaFRTdE1NNGlkUEMxQURiK0V1TGdqMXdnS2xFZ0UyL3RWM0Q1N3IvQ0Zm?=
 =?utf-8?B?N2djVy9rM0JxRmF4T0UzbkYrQU9VQVMxZEVFajlONVZEaVUycEErMnduNUtD?=
 =?utf-8?B?NmtEK213ZzlBZlEyQ1VFU1grUWVRMFU0a2MxeUViRjRHclhvbE45andXU1Zy?=
 =?utf-8?B?cG8yRnlxVDlBaUpRQW5YUEhSWHdsZnJVaDJQSjBoaFZlVHMvK3ZrR2JyWnYv?=
 =?utf-8?B?czVIRTNBbUgraHVSalNMVDZXV1JCS2ZCMllKVWgwZ2krN2t5cXA0VjQrOVB4?=
 =?utf-8?B?K1phdDNETDZjcFZGSm9ZcGFFdW4vQ1lXTFlQWlp6VUQzNUpHNVZURUlQdTZD?=
 =?utf-8?Q?WxkmaG0TOI0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUxqTWlrajczbHl0dFRIU3VYN0ZiRGZEZzBtNEJXUHc4bW1CWmcyM3RSVWlk?=
 =?utf-8?B?OWYvQXQrdFRSdXpNL2xYMm1EZWlDQnIzS2dGa2pReHd1RkQxY1pZZlFSMWF2?=
 =?utf-8?B?bmdKYW1tT1JreldCVWtKcUdadm5TSzYzdmg3K2JQQXB5S3JPWWZiQ3Y4WlNU?=
 =?utf-8?B?cmJ3YU9CcWtCUTBsZTVuV0pMNmJiMmpKVlRzaU1ZeGs3S0ROZUVrVkQxWmdY?=
 =?utf-8?B?bUhKVFpUQmJjNTlVUnVpQnF3MXQxVFlqNWlBRXpBblVJdXlSUGhFbU03cVdn?=
 =?utf-8?B?ais2QjNwMDhCTWRuTlk4VVNEMGJnVmhYVEltZUJ0T0ZaMTdYc0pVUWhZZDZu?=
 =?utf-8?B?eDVDeEhGdk9ZOG9vWGRpWFBKUlZPblltdjhOZkhSQUsrZDZWMnBHcE5TWE1s?=
 =?utf-8?B?Tkh3VmNaWHZpdkVoUTdNb0JZUlpFeEdrZUpJNkVVWWtKVGtHQWRQM1hBN1Bw?=
 =?utf-8?B?bmJQdnR3Z2EweUdKWXE5dFRzb0ZXdTltSFVQdUVqWlRaU2d3WG1mTFcvSFVY?=
 =?utf-8?B?V1Y4a3dYdUhmTk50RU1rMEpUQ051M3V5TlVWQXV0cFByTHlQM2xoZGpOcDVq?=
 =?utf-8?B?NHEyZ0FoeVBOSG9VRVptL0c1YThDV2R0L01GWE9JcEo1NXU0TnM3NjhkY0JI?=
 =?utf-8?B?OXhpcm5JZ3N3azgzS0NvdGpHZXhUZ3lDQUVQalgrZFpaeGFhZFNqZlFtaDhF?=
 =?utf-8?B?Uy9FWGJhbEVNQ1BUVUtzRCsrQ1VmeGxmYjdoTzQ2WFhVSnZGajhLUHhXYWNF?=
 =?utf-8?B?NHZSQ3l2citkUE81eVZ6SlBWVkk0dWREeXN6RDNFRXRrdDl4MndCbUwzSWpt?=
 =?utf-8?B?bEpoN1M0ZXUvNVk5ZC9JSnpTZmlONC9HVkhnM2FNM2k0ZkU0M25HUmI3elBW?=
 =?utf-8?B?bDFsZHF4dTRzbW4ydnJ5UnNFdWMyR3JDS3djWUF0ZEVCZFZZVGh4RWt1SFBP?=
 =?utf-8?B?cnZLaGNQSUw2SU5wVWZMbDdDNVVNQkFxUVhlajhjOVl3dVVUQ2prVjJ1b1Rs?=
 =?utf-8?B?Zmw1YzFJMTFURVQ3UEFNOTh3REkvbUpRRzVlclNLd2ZHYThHM2tTZ2RjZlV2?=
 =?utf-8?B?bHZkM29WNWh1K2E0MXU0a3Bmc015YXI1RG9Edm5ZZXNGRndsM2dtbGh5b0Za?=
 =?utf-8?B?QzJJMFJsTGp6a0hpUENJdU4veDdjWWJHdFdCV1FTQ2tyT0s3ZzhQd1N3ZHEw?=
 =?utf-8?B?WWNhNWNGL3RiT3JMUStoOVFVUkk5b2Zjd3ZrMUJUVkNVTzZvaEpoNExwTHpC?=
 =?utf-8?B?MEZZT2d2NDJsMnlpdVZqSDIzS2N1Sm5hUXZTR0JUWllpQjVzcldENndwSDdS?=
 =?utf-8?B?djMzL3Z0VmJlSEFDN1pua0Fpc1c3TnBFNVFoaEJnN0VHVlZOa3RVa0tBc3FN?=
 =?utf-8?B?TkZtMVZ1dTJtWHZ2VXVpR21TWDZJTjYzZWh3ckhBcVo2NEdlTnYzaVlLVXBB?=
 =?utf-8?B?clBSc3NaZW9YWFNvN0Z5eDJMd0pORGVPK2pBTUJTRFNaNTdBekc3TUViSUgw?=
 =?utf-8?B?OTB0bzdSbHhpSEhrVmNIUExiWHdTcENuUkpMaFNEUWVuWXNnZGxvaTVpUnJz?=
 =?utf-8?B?L3IxL25OeXI3MmR2cmxDbEZ0V3hFdWFUc0ZjdGp4Vk1tdWI2K0hpcXRoenhv?=
 =?utf-8?B?eUdYMDhPNEdSbm9iOUhscUV5WkxVVEJoV1NCcVRGUDV1UmlYL0lDaTNiRWM1?=
 =?utf-8?B?eFU0QlFQelJDN01zbWI1MnpOSSt2RktmdVZjdktTSUxHOEJLR0l6bWpkcmxZ?=
 =?utf-8?B?ZmMydU1aSW1takt1b01DMTBCSnhZWmdDRExHVUQ4OGIreDJUWmoxWnQ4OGNO?=
 =?utf-8?B?R0kxNkhvZXUwY0EwT29vNmlsVDFIN0VOajR5RVNMT3FObzJ3RVZUTnM3YzVt?=
 =?utf-8?B?WURYeVllOGdZNkorVVZMOGpyZzZvUXlpUUh3cUVaUyt5aEo4U01xendpcmlh?=
 =?utf-8?B?a2JTZmNnUjRGb2pNaHdmRkh5L1JCZkRkaWdRR0NHNVp0ZXM3ZWQ4eGdWZUMx?=
 =?utf-8?B?akV5MUZnTXpaRkhMczhhaVUvV0JLY2V1dEVNWmlNdEhlbngyRnZMNmtPVzJD?=
 =?utf-8?B?SjdPeFNXSGh4eHhjVUpTU2hGS1lnNUoyZmdEejF0TUlVKzUrT1VaOEZVY3Jw?=
 =?utf-8?Q?55Cx/gjWGa+iJIOYfCTxW6y1n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be51e30d-00c4-4e2d-9f0e-08dd874c4ee5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 18:33:17.0089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4a/YYeT3VPgZO7SYMQa/Lkk8p6FSkujn4v08kaEUxY0qvaZP1fZ6K5vgcvfdX4qPecAIoS18Al831RSRqkfG8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313

Hi Armin,

On 4/26/2025 8:25 PM, Armin Wolf wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Am 17.04.25 um 20:28 schrieb Pratap Nirujogi:
> 
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>> Changes v6 -> v7:
>>
>> * Use devm_kzalloc() inplace of kmemdup()
>> * Use IS_ERR() inplace of i2c_client_has_driver()
>> * Remove the extra cast
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 269 ++++++++++++++++++++++++++++
>>   3 files changed, 281 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/ 
>> amd/Kconfig
>> index c3e086ea64fc..ec755b5fc93c 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>
>>         This mechanism will only be activated on platforms that 
>> advertise a
>>         need for it.
>> +
>> +config AMD_ISP_PLATFORM
>> +     tristate "AMD ISP4 platform driver"
>> +     depends on I2C && X86_64 && ACPI && AMD_ISP4
> 
> Hi,
> 
> just a question: when will the CONFIG_AMD_ISP4 symbol be introduced?
> 
CONFIG_AMD_ISP4 will be introduced in the V4L2 ISP driver patches. We 
are working on isp driver patches and planning to submit once the review 
for x86/platform and sensor driver patches completes.

>> +     help
>> +       Platform driver for AMD platforms containing image signal 
>> processor
>> +       gen 4. Provides camera sensor module board information to allow
>> +       sensor and V4L drivers to work properly.
>> +
>> +       This driver can also be built as a module.  If so, the module
>> +       will be called amd_isp4.
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/ 
>> amd/Makefile
>> index c6c40bdcbded..b0e284b5d497 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>   obj-$(CONFIG_AMD_HSMP)              += hsmp/
>>   obj-$(CONFIG_AMD_PMF)               += pmf/
>>   obj-$(CONFIG_AMD_WBRF)              += wbrf.o
>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/ 
>> x86/amd/amd_isp4.c
>> new file mode 100644
>> index 000000000000..461a10be5ccd
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,269 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * AMD ISP platform driver for sensor i2-client instantiation
>> + *
>> + * Copyright 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/units.h>
>> +
>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>> +
>> +/*
>> + * AMD ISP platform definition to configure the device properties
>> + * missing in the ACPI table.
>> + */
>> +struct amdisp_platform {
>> +     const char *name;
>> +     u8 i2c_addr;
>> +     u8 max_num_swnodes;
>> +     struct i2c_board_info board_info;
>> +     struct notifier_block i2c_nb;
>> +     struct i2c_client *i2c_dev;
>> +     const struct software_node **swnodes;
>> +};
>> +
>> +/* Top-level OV05C10 camera node property table */
>> +static const struct property_entry ov05c10_camera_props[] = {
>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>> +     { }
>> +};
>> +
>> +/* Root AMD ISP OV05C10 camera node definition */
>> +static const struct software_node camera_node = {
>> +     .name = AMDISP_OV05C10_HID,
>> +     .properties = ov05c10_camera_props,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * ports node for OV05C10.
>> + */
>> +static const struct software_node ports = {
>> +     .name = "ports",
>> +     .parent = &camera_node,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>> + * port node for OV05C10.
>> + */
>> +static const struct software_node port_node = {
>> +     .name = "port@",
>> +     .parent = &ports,
>> +};
>> +
>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
>> + */
>> +static const struct software_node remote_ep_isp_node = {
>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +};
>> +
>> +/*
>> + * Remote endpoint reference for isp node included in the
>> + * OV05C10 endpoint.
>> + */
>> +static const struct software_node_ref_args ov05c10_refs[] = {
>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +};
>> +
>> +/* OV05C supports one single link frequency */
>> +static const u64 ov05c10_link_freqs[] = {
>> +     925 * HZ_PER_MHZ,
>> +};
>> +
>> +/* OV05C supports only 2-lane configuration */
>> +static const u32 ov05c10_data_lanes[] = {
>> +     1,
>> +     2,
>> +};
>> +
>> +/* OV05C10 endpoint node properties table */
>> +static const struct property_entry ov05c10_endpoint_props[] = {
>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>> +                                  ARRAY_SIZE(ov05c10_data_lanes)),
>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", 
>> ov05c10_link_freqs,
>> +                                  ARRAY_SIZE(ov05c10_link_freqs)),
>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>> +     { }
>> +};
>> +
>> +/* AMD ISP endpoint node definition */
>> +static const struct software_node endpoint_node = {
>> +     .name = "endpoint",
>> +     .parent = &port_node,
>> +     .properties = ov05c10_endpoint_props,
>> +};
>> +
>> +/*
>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>> + * fixed to align with the structure that v4l2 expects for successful
>> + * endpoint fwnode parsing.
>> + *
>> + * It is only the node property_entries that will vary for each platform
>> + * supporting different sensor modules.
>> + */
>> +#define NUM_SW_NODES 5
>> +
>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>> +     &camera_node,
>> +     &ports,
>> +     &port_node,
>> +     &endpoint_node,
>> +     &remote_ep_isp_node,
>> +     NULL
>> +};
>> +
>> +/* OV05C10 specific AMD ISP platform configuration */
>> +static const struct amdisp_platform amdisp_ov05c10_platform_config = {
>> +     .name = AMDISP_OV05C10_PLAT_NAME,
> 
> Where is this field being used?
> 
>> +     .board_info = {
>> +             .dev_name = "ov05c10",
>> +             I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>> +     },
>> +     .i2c_addr = AMDISP_OV05C10_I2C_ADDR,
> 
> Please reuse board_info->addr.
> 
>> +     .max_num_swnodes = NUM_SW_NODES,
> 
> Where is max_num_swnodes being used?
> 
>> +     .swnodes = ov05c10_nodes,
> 
> Why not drop .swnodes and referencing ov05c10_nodes directly?
> 
Thanks. Some of the variables phased out with the ongoing development 
and patching. I will take care of removing the unused and redudant 
variables in 'struct amdisp_platform'.

>> +};
>> +
>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>> +     { AMDISP_OV05C10_HID },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>> +
>> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>> +{
>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>> +}
>> +
>> +static void instantiate_isp_i2c_client(struct amdisp_platform 
>> *ov05c10, struct i2c_adapter *adap)
>> +{
>> +     struct i2c_board_info *info = &ov05c10->board_info;
>> +     struct i2c_client *i2c_dev;
>> +
>> +     if (ov05c10->i2c_dev)
>> +             return;
>> +
>> +     if (!info->addr) {
>> +             dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n", 
>> ov05c10->i2c_addr);
>> +             return;
>> +     }
>> +
>> +     i2c_dev = i2c_new_client_device(adap, info);
>> +     if (IS_ERR(i2c_dev)) {
>> +             dev_err(&adap->dev, "error %pe registering isp 
>> i2c_client\n", i2c_dev);
>> +             return;
>> +     }
>> +     ov05c10->i2c_dev = i2c_dev;
>> +}
>> +
>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>> +                           unsigned long action, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = container_of(nb, struct 
>> amdisp_platform, i2c_nb);
>> +     struct device *dev = data;
>> +     struct i2c_client *client;
>> +     struct i2c_adapter *adap;
>> +
>> +     switch (action) {
>> +     case BUS_NOTIFY_ADD_DEVICE:
>> +             adap = i2c_verify_adapter(dev);
>> +             if (!adap)
>> +                     break;
>> +             if (is_isp_i2c_adapter(adap))
>> +                     instantiate_isp_i2c_client(ov05c10, adap);
>> +             break;
>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>> +             client = i2c_verify_client(dev);
>> +             if (!client)
>> +                     break;
>> +             if (ov05c10->i2c_dev == client) {
>> +                     dev_dbg(&client->adapter->dev, "amdisp 
>> i2c_client removed\n");
>> +                     ov05c10->i2c_dev = NULL;
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return NOTIFY_DONE;
> 
> You still need to handle the situation where the AMD I2C adapter is 
> already registered when
> registering the bus notifier. In this case you will miss the 
> BUS_NOTIFY_ADD_DEVICE event.
> 
Thanks. I will cover this case using the below sequence.

1. bus_register_notifier()
2. i2c_for_each_dev()

If at all i2c adapter is registered by the time bus_register_notifier() 
is called, it should be detected in i2c_for_each_dev(). I will add 
checks to avoid creation of duplicate i2c_client devices when both 
notifier callback and i2c_for_each_dev() passes especially when i2c 
adapter gets added between 1 and 2.

Please suggest if there is an alternate better approach that I should 
use to handle this case.

>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(struct device 
>> *dev,
>> +                                                    const struct 
>> amdisp_platform *src)
>> +{
>> +     struct amdisp_platform *isp_ov05c10;
>> +     struct i2c_board_info *info;
>> +     int ret;
>> +
>> +     isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
>> +     if (!isp_ov05c10)
>> +             return ERR_PTR(-ENOMEM);
>> +     memcpy(isp_ov05c10, src, sizeof(*isp_ov05c10));
> 
> This is not what i meant. I was complaining that 
> amdisp_ov05c10_platform_config contains both
> static data (swnodes) and data assigned during runtime (board_info- 
>  >swnode, i2c_dev, ...).
> 
> Please do not use a global instance of struct amdisp_platform for 
> initialization. Instead initialize a
> fresh instance of this struct inside prepare_amdisp_platform().
> 
sure, will remove the global variable 'amdisp_ov05c10_platform_config', 
and will take care of initializing the amdisp_platform instance in the 
prepare_amdisp_platform().

>> +
>> +     info = &isp_ov05c10->board_info;
>> +
>> +     ret = software_node_register_node_group(src->swnodes);
>> +     if (ret)
>> +             return ERR_PTR(ret);
>> +
>> +     info->swnode = src->swnodes[0];
>> +
>> +     return isp_ov05c10;
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10;
>> +     int ret;
>> +
>> +     ov05c10 = prepare_amdisp_platform(&pdev->dev, 
>> &amdisp_ov05c10_platform_config);
>> +     if (IS_ERR(ov05c10))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>> +                                  "failed to prepare AMD ISP platform 
>> fwnode\n");
>> +
>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     if (ret)
>> +             return ret;
> 
> You need to call software_node_unregister_node_group() here when 
> bus_register_notifier() fails.
> 
Thanks. I will fix this in the next V8 patch.

> Thanks,
> Armin Wolf>
Thanks,
Pratap

>> +
>> +     platform_set_drvdata(pdev, ov05c10);
>> +     return 0;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>> +
>> +     bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     i2c_unregister_device(ov05c10->i2c_dev);
>> +     software_node_unregister_node_group(ov05c10->swnodes);
>> +}
>> +
>> +static struct platform_driver amd_isp_platform_driver = {
>> +     .driver = {
>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>> +             .acpi_match_table       = amdisp_sensor_ids,
>> +     },
>> +     .probe  = amd_isp_probe,
>> +     .remove = amd_isp_remove,
>> +};
>> +
>> +module_platform_driver(amd_isp_platform_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>> +MODULE_LICENSE("GPL");

