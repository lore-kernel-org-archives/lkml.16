Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D61199236
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119842; cv=fail; b=KyaF2nre8+EGLGyuSaaVwyMkW9FXebc7bk5vVs3zL1qYFHsWlsK6Mpl50tOuKg56sXQigLWfKMPcIqx2C+eZJdCuqsiTjDwVCY1sbIAT7J1o/ANlQoeQr0rTrn8WLVXxAs0ulWO5RggIQZceH1uOxhMABOSCSyx0sHsFTdKZTpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119842; c=relaxed/simple;
	bh=ApK3mf0/DNrggMxY0DoSJx1dveU4Qsj2DZ+OZcka9c8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l8oVZ67YPSsbH/xgdYAZXkUDKedvRPQmLAIGu5CWoQrb3yrhMnSeTBfX0ZSSIl0NYjpH6o2zv6TVS/D4qKAp/fPYEgx66LWF64cgXc8IUZzV/yBJcG1gKp3u78PLAuWzr26m3iJHvbTIJtKPjEDhtxVZTNL8BSvnK2rNLHfDarU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ozE/yDTK; arc=fail smtp.client-ip=40.107.236.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ozE/yDTK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5CQi6JVAVeYsOVVvJNyyRKqM6WLD6tHsBny8dpTWpR9rdgCFdi99vkZyDkOj+Xk4vvxMXZSiif1kinzEe6oZ6SCWRl/POxvWdiyBZv3fLbEAP7VTT47nWC0d/xdLLqGcDzPwatho1KcAr/jIDp9yyHG/p5j0HBwbE4VR7add19QCVRHBLeDJ4krhMoG2w1z3HRgXw1umYNYDhNS+zWWmUNC5hMs4MP/TLPM8kMep/IdPBGJc4EcgSwexTaRPMesawjJ0ThvwXGTbWkZGtQVQZi35sO7cKh78yUUf3AtG2HsuZ40sJNGA445JoLufva+dmdwrYQzvvnLvqjTWRPA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxArG4Y2PQ1YwvaH/cWWlVFo+TPMDftuJ+mDKrdlgIo=;
 b=igfMRtT/hIM/ovuAbDq8nt+3neqdykjauhiL+9k7hSVtlLUZYyrMeT47N7P2pT8JA36Ow2W0T3zed6kdHD0LcVdlDB8FyHRmpJTYZZHzFW2OrIYjUCkJbtuNVpFtGFeW3zuTF5tOdmONNX1HqmhoqSBQdHgLRfXvY+MYzVdP4yFBU65c6OSDfoQbPGSIU7sL3voEWO6giT3bTcZcgRU/SnZBXNWPKVlkaSl6Bq/QyVoG00G6UY2IE54i76kHawq6lcSQE8w3/xQAwRlqMPy3J9z1qF6+D2l/2Lc34RrUZXXWGsnnsjCLv6tNXC7zIenmxsWQCGciTF1+d8x19piWCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxArG4Y2PQ1YwvaH/cWWlVFo+TPMDftuJ+mDKrdlgIo=;
 b=ozE/yDTKWl7skY6lvh4n6cg3hdYJ7khsgvymN5SgXtFouR7+QkR6dhScCbepSCWynRttDAMEwQBSSOp3aArJ0p644ixKBXRSwSN6zafrApJjmEkRyUeUQpHeC9KCCEL7ZS643S3vFi+VwRfpfyGOUb5uEO7dKEuOc3Ln8ztBlb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 13:43:58 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%5]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 13:43:57 +0000
Message-ID: <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
Date: Tue, 8 Apr 2025 08:43:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region for
 SEV-SNP guests
Content-Language: en-US
To: Naveen N Rao <naveen@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
 Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Vishal Annapurve <vannapurve@google.com>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>,
 Kevin Loughlin <kevinloughlin@google.com>
References: <20250403120228.2344377-1-naveen@kernel.org>
 <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
 <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0094.namprd11.prod.outlook.com
 (2603:10b6:806:d1::9) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|SA1PR12MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: c328165e-1108-4122-1a14-08dd76a3696f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3pSVDBQTG04Mi9pcU1RRGdNN0pRSFdXYm93UVFKbk5Bd2dFbDIrdUNnSXpq?=
 =?utf-8?B?d2d6ZHdBajI4S0o0VFFrK3FtQkVGQ2ZFa3BSUDM1Z1loMEYwN3drUTZCRWdJ?=
 =?utf-8?B?OFpXaFJmZVlZenFEcGpQeW9VZlp0ZXRwbmVhQmNoNmdCemNDaTNRa2pCdkxP?=
 =?utf-8?B?RWd0VUFiZGluNVBFVkV2Z0tRcTdoZnFSaVduU3ozSXpCK1V4WDNWMlorREZO?=
 =?utf-8?B?U0JmdEpsTUkxeWo1T0oxUjdIRlJRL2RGU0hDdm5VNE5RL09UdGFyNmx0NTN3?=
 =?utf-8?B?TUVHOTZsdks4SnlodVlkbExEbVlJNlljSDJML1pzTHVkakRWZ3ovWUxFSEVN?=
 =?utf-8?B?Zm1EU1JZeGRRd1BWY3ByZ2NKVzJJbHpGOUlsaFR2cXBTbHUwa1ZydXR5RkQ4?=
 =?utf-8?B?RzA3ZmZ5VkdWZnZtSHdEMHB2cEdwNkw3UEk2cDRVTjQ0dmFNOHhwZmJydE1a?=
 =?utf-8?B?Yi82N3BhRGVJSGw3U0NVVGg5SjMxSFFDQTZHUlBEWjA5dHhwemI4VXZseFJk?=
 =?utf-8?B?OWFTZHpLaURtR1FZVk5QQXgrQno2MDF2MEN1NHZVVElDeEdzSTg0aG9EMURs?=
 =?utf-8?B?bUlSU3hOM1ZTQ0w1OVFpb3RpL2cwMDNEZ1hEVUllR21wTnpONkZieTlQdTk2?=
 =?utf-8?B?S0YyQWhBT2NERU1DK3BBUDc1VWRXbFBxSWc2ZktpSWhIZDFRVWNkOGlpSWt3?=
 =?utf-8?B?d2wzTTd2ajlpd3p0UG82M0k2N1diSGZCNW9pSW9ycWpKd1UxUHBwQVY5dVkv?=
 =?utf-8?B?L3ZzNitUTzgwRFJNVTd1bVVnZklDR3J3TCtQY3ZPOXVzeVYvZmNMRmM2L0xp?=
 =?utf-8?B?YUN5Snc2R0NIT3lXdzdxSWpDMWxhZXhHVVE5Z3kvcUU0djZQYkMwamgwMjc1?=
 =?utf-8?B?eFFYekZqT0M5cm5BZUtIZVI5YllLbFF2dkN4UXE4T09GaGc4em01V081MGVv?=
 =?utf-8?B?ekQvSWdtY2tMUExjbmpyNGdKZk1tOXdoalUyelpWY21ja1MrUnYyVWRWWmpR?=
 =?utf-8?B?bnlXUkQwOHRWNjZpWTV2Nmc1VURDSFUxdEFvdG5FaVB2WEJYczVnYWNuZ3E5?=
 =?utf-8?B?cnpLMmZvWU1MalR5YTk2OWUzeVlFQ1prMFFrTnBvNWlBazlTVjBTT0FMNlJ6?=
 =?utf-8?B?ZmlhQm1jQXJ6Rmd5OTR5NHR2WEdYUDBCUlB5VnFRK0VsbGRmSG01eVZxdmF5?=
 =?utf-8?B?eGRTb0NsOUp1MVdLMEU4eHl4bmpHakFsd2ordjhVZi85TExpNEd4TEd3eFB0?=
 =?utf-8?B?cm84aFlVSU03RXNoTThqUEZ1MlhqV1RSK2Fha3BpcWNFdURweEI4T0FpZ0d0?=
 =?utf-8?B?QmhyMCt4eS9nTFFoeVJIN3VtOWdhNUY1YTFOdmFhUlczdUI2QkpERVMzTlg1?=
 =?utf-8?B?MG15aFE0QzlITFJUcnBpTlR5Z0ptRDhna0lSQ0w4Yktad0pSclVyWE5MMGs4?=
 =?utf-8?B?bTlJZTR6TTFDaFplNndEeEcycHovN1N4OEREcDQ3aldleGYxaFJFaGcxTERP?=
 =?utf-8?B?OGtxNkZsMk5JSUNYdGFCMFkydFlLWHkwcEhMbUtVUmpMZ211UHNYd2NiTWxG?=
 =?utf-8?B?UGcrcHJSblRYWnlPMno2RnZ1Rm1OeXZ3OEJGMlhvUHoxcTQ5UnlJY1NSclcw?=
 =?utf-8?B?aTNndmVqbTNFb1Nua1JPbkhHZXhHSmZCL201MFdqRE11KytwZGdBbFlVR29s?=
 =?utf-8?B?SlloM2JNYnNaNFQ5VmxwMXNBa1RXNzB2NEN1RTBTeVBqWThiNHo0ZStxc0E3?=
 =?utf-8?B?ZDMycGNneDVIVzEvdVJUN1RhbjNQOXdCNUNJVWJ5bWwyUG1pTVFFMkFnazZG?=
 =?utf-8?B?VkFBMTRWWjVWT2p6eVhGY3JLVXovM2NuK3FoZEV0d0pJRlpsdDd1dTg1LzFT?=
 =?utf-8?Q?DFRk8IE48z5mb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajViZ21OWFVzaWxuR2RKN3gvQ1dMVGQzL0x0RW1YUGFIaGdRUkFhSkNpQTFp?=
 =?utf-8?B?eWtYZ1BhRytqbTd5bG1DaldFbHNnenBXQXpkTGVTMGhzcHpyQVp0VlhURTJC?=
 =?utf-8?B?R1hkMlB4SHNiRTdXQ28zK213WVdLMSt3VjFNVzUyQ3dUdm5MV2IxRHhzajBa?=
 =?utf-8?B?cnpYdVFIOEZyVmplNm1xU3M4aXN0d2x5ZXE2a3U4b0JrY0paRlNleTVYOXN6?=
 =?utf-8?B?dndQVHJjNE93OUdMYWt3QUVXKytqMDd6V2hrMVF4dCtzaDRiK2hzbWRnb3Yr?=
 =?utf-8?B?NzdKaGR5dnZKR056dGZaK1d0bTdBTWx4N0wvOEltSzYzSXZvQlg0MWZGNzFQ?=
 =?utf-8?B?QkxQUVoycnVyaVMvUGdCYmtUMUxqSnlXVisrRUJadnVTcVZubjZpQXpTNWNT?=
 =?utf-8?B?SkRYOWs3QkJOMWRaNis5aDd2bGN6R3hXZWFrM0hJWGVOQWQxYkhsNjZWSkZk?=
 =?utf-8?B?NS83M1MzZ3lZdjczYkhseGY2L0MwYngzRXFVYWh4TzRQcFlJc0MzSCt1azlT?=
 =?utf-8?B?Uk8vQmVWWGplZFpsRzVnTjVjaTBQUFpycGVTZ2pQR1gxZWVwcGZ1MGRRaUZk?=
 =?utf-8?B?azFIanp0Mko1WFVLVVVqeWczeFpCWjA3LzBBaEFKYWxZL1NQTjhXSU90ZkV6?=
 =?utf-8?B?bUVZb0NSbUtjYUd6N2orcW5FdVR1UG5nb3ZySnNrOVBEbG5JMXhmQUwrRzFZ?=
 =?utf-8?B?TDZmMThKMnV4U2Iya3NEamJ0WlYwNlFvckRNVnhxVVAzQWRSZ1BGakozNlVl?=
 =?utf-8?B?VUttVzNuZm9HWis2NExPL3Y3U0YvZWR1YXRhREJlZW5vUGtRMmVhRThKb01F?=
 =?utf-8?B?My9HY09hME43WFFEcVNKYzhqOHJ6Z3pPdnB2QXRocGdoMHZueGFkM0FGTDA3?=
 =?utf-8?B?aEM4ZWZnay9aZXYyK0Q3ckc2amhyVVZpSHpva1JBaFMyejJWYWYva1dpQWN4?=
 =?utf-8?B?aTlzcVJqQkswcEZieXpYSHRxS2RWMEdOR3hFcFBVV2hNb3pReUdrckdPSFJS?=
 =?utf-8?B?WnF1d2txek85T2R6TU0rSUlhN01SOWV6MWl5elp2cTQ5QzAxZExCYkNlNWZh?=
 =?utf-8?B?aUZ5SzhsaEFacG5EbXRYamhRS1hWck9jZlZaaHVCVm8xOE9JbGZ6djlnemVs?=
 =?utf-8?B?WVdFSnBMTW1CWVNvbXRBeWtVTFFwVjdZQmlmTDNiaTZsNjk5VXlMb3FGWGVR?=
 =?utf-8?B?cXY0cmwrZXZZcnREdHJqZTQrTU1tUk01aHdqL1NCSEh3MEFOMVUrYTJDQnJO?=
 =?utf-8?B?SkF4bnkrcU5ldTY0UXdjUXgxUFQ2VjZDMDdMelRneG5JN3lleXdUSE9JMkJH?=
 =?utf-8?B?R0ZyNEpwTHJIc3F0Ty9wTkpjbG8ydENPSUdSSzZjWXkyMURjRTFmYmtNUHRq?=
 =?utf-8?B?bXZSVEljeUo1eFhITUxpTW5vNUx4c1VaY0RzdXJyQ0F5bUh0Q2tCdGt5czRR?=
 =?utf-8?B?TXNkMnZwR09iWk5zeDF1cllrcjVEQzgwaWI1bFJFYjU1Ri9uUndCMDYycVE5?=
 =?utf-8?B?Sk5ucnh4UlVHSVp1ckE1cWxSZVFid21UTFd6WTc3RGRZOG5YZVErbHV5T3Rv?=
 =?utf-8?B?eTVNUDdhdDlIS2hKSDNsRnBOc3czeVVxSzZjMnlBQXJaRDJRSjRtd3Mydmxh?=
 =?utf-8?B?VXVOYTZaTS92ZitFL2h4TFlzdk5TWGVuZTdTTTVrN3pSa1lLUDBKblRqTXM1?=
 =?utf-8?B?N0tpVXZRSmgrOENHMjl2aDF3MkhTMWMyMHdCODBjaWVtVkhoQ09WQVZCYjlZ?=
 =?utf-8?B?UmlKUE9sWUVEYzVBZ1AxUU1DenIyWFFlQUFubzNId3R4VFExU281VU5sa0g1?=
 =?utf-8?B?andjdlhrcUV0Y1ZiZFRvTmFSdEVMTDBiVVU3WUU2VU9IQjlMSVI3TjR3Ymw4?=
 =?utf-8?B?RExpZy9NMWhPd3M4NDc3MVhMak9aS283VGdMbkVoa2t1Rnd4RFZMTlpuN2ZJ?=
 =?utf-8?B?N3NReXpyTjlrS3BxVEhLMklQSXQ4azhCdktPbitvNzk1RTVyblAvZUU5KzNE?=
 =?utf-8?B?ZzZ5Y1Mzd1pyU2FOWEdwK2N5UUF0U3JUT0kwZUs3cXVGQ2hCYktuSzJaaS82?=
 =?utf-8?B?NVBTVFQzMTNBOHB1QTNVdnVua3ZXR09Vam8yOTBpNGxwS3VzRUZuNkVpRysy?=
 =?utf-8?Q?NooYhR8nKcNHJzcyfKMLBihBd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c328165e-1108-4122-1a14-08dd76a3696f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:43:57.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxXRqDK/UkHeQHVrbJ+VNtvl82kKyUBc78tinOF0FMFRc1nt2ZcbKKg7un5vancPwTi4Ow3SeVvtcr7iNCQAgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247

On 4/7/25 08:13, Naveen N Rao wrote:
> On Thu, Apr 03, 2025 at 12:06:29PM -0700, Dan Williams wrote:
>> Naveen N Rao (AMD) wrote:
>>> Commit 9704c07bf9f7 ("x86/kernel: Validate ROM memory before accessing
>>> when SEV-SNP is active") added code to validate the ROM region from
>>> 0xc0000 to 0xfffff in a SEV-SNP guest since that region can be accessed
>>> during kernel boot. That address range is not part of the system RAM, so
>>> it needed to be validated separately.
>>>
>>> Commit 0f4a1e80989a ("x86/sev: Skip ROM range scans and validation for
>>> SEV-SNP guests") reverted those changes and instead chose to prevent the
>>> guest from accessing the ROM region since SEV-SNP guests did not rely on
>>> data from that region. However, while the kernel itself no longer
>>> accessed the ROM region, there are userspace programs that probe this
>>> region through /dev/mem and they started crashing due to this change. In
>>> particular, fwupd (up until versions released last year that no longer
>>> link against libsmbios) and smbios utilities such as smbios-sys-info
>>> crash with a cryptic message in dmesg:
>>>   Wrong/unhandled opcode bytes: 0x8b, exit_code: 0x404, rIP: 0x7fe5404d3840
>>>   SEV: Unsupported exit-code 0x404 in #VC exception (IP: 0x7fe5404d3840)
>>>
>>> Deny access to the BIOS region (rather than just the video ROM range)
>>> via /dev/mem to address this. Restrict changes to CONFIG_STRICT_DEVMEM=y
>>> which is enabled by default on x86. Add a new x86_platform_ops callback
>>> so Intel can customize the address range to block.
>>>
>>> Fixes: 0f4a1e80989a ("x86/sev: Skip ROM range scans and validation for SEV-SNP guests")
>>> Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
>>> ---
>>>  arch/x86/coco/sev/core.c        | 13 +++++++++++++
>>>  arch/x86/include/asm/sev.h      |  2 ++
>>>  arch/x86/include/asm/x86_init.h |  2 ++
>>>  arch/x86/kernel/x86_init.c      |  2 ++
>>>  arch/x86/mm/init.c              |  3 +++
>>>  arch/x86/mm/mem_encrypt_amd.c   |  1 +
>>>  6 files changed, 23 insertions(+)
>>>
> <snip>
>>
>> Is there any driving need to allow devmem at all for TVM access at this
>> point?
>>
>> I would be in favor of making this clearly tied to devmem, call it
>> ".devmem_is_allowed" for symmetry with the mm/init.c helper, and make
>> the default implementation be:
>>
>> static bool platform_devmem_is_allowed(unsigned long pfn)
>> {
>> 	return !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT));
>> }
>>
>> ...if a TVM technology wants more leniency, it can override.
> 
> I'm not fully aware of the history here, but I suppose a TVM should 
> appear as any other VM for userspace. For that reason, I didn't want to 
> block access to /dev/mem any more than was necessary. Admittedly, I have 
> limited insight into which utilities may be using /dev/mem today.
> 
> Tom/Boris, do you see a problem blocking access to /dev/mem for SEV 
> guests?

Not sure why we would suddenly not allow that.

Thanks,
Tom

> 
> 
> - Naveen
> 
