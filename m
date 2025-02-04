Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F373139CE3;
	Tue,  4 Feb 2025 08:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738658090; cv=fail; b=Ab//vknq+f/JyIVwCMR4S6EBGNjtXzYctvcquH0jGmZJf9/Kj1jAhQcoxcNz0f+h/KnpfJbWgTZQj9kLB7TFQ+RymB2CRdbOAW3oKaJB2HfLm/TQL7Lh/Wb/2QFhcYTYp6dtyFon8gPp25rUOqkirk1tvG57vUQJs+MziJKsd/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738658090; c=relaxed/simple;
	bh=sB06T5k2JOlJ/3qunBxGYcuCYhr7U2q/YMui/Wg1gGA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HjAdGw6aVOEdmqeO1YTzalmvSWhF+i1sDvt6N094/Lm2n/bsJCb+I8bXXrDl7uskT1pVJJZiLaPONdmJlPNQKkpUS1xqbw+fl3cvcundsKvvFI7EXwRi8O4zRIKX0bdvBb9/Q2wGouXd8L+I4MD3A3+bt9W5xPWgzltgoGShsS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jmkbzJTV; arc=fail smtp.client-ip=40.107.243.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jmkbzJTV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Espu51t+zi1rXtSe8DsWaRDSxK28InNh9eAV7zTCk9T/OjsgCCG3vsKVmvsJYR/ZcS6LAZ7xRK1DBl6VNLGP+iFfeeIomKYJ+I3NEl+AycxA5JLRb8qLkAwOl9XrhqEVFD4PJCVf6K4yWoyVZIFlgsV1NX9qQAetMU85FGmFofK78NK0wUXrGb3U9UY8HdKkACfnIJI145d+LguITZm98f02mQwYKxBn3u2ARPqGTFAS1UAs7aEjrLuQrdBn1gNtB4+aOllnREzktaegbc3kN8J5msPX+6QU9dSvSr7W1Q9havquAD6Zv4eOnXA4C9PAAiH+W8jJgrxgjkhfZMLILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cl2P9cPfFnCRsfCVAOsOKJw7qKLwTLoAfNvoeJ0zBB0=;
 b=wEBDyN4TsypYSH74H0OavZDzcSv4xz0tGp5smF5xSw8iYobAg8I2g8y6by59hDrk9Cqd7W0sDkgWG3crQ/qYn/R3nyHZEJjbsiCG3yPVlthdRF88asxIS06cShpsejBQJZK4SisHCc7jJuC5REMGyx4UjufP9a2T2g1EiICQS3CjUxyMa6cjdxqZt0VcwGsaKza9wsTYXm7CS0OguoUvqZDLnAViC/nUzP1iq+5ZEbZZPqLHjL5MYh+4ji8gJlmRIJOJGDvMP6la9J9L7u67ZrYmcxwFqHITQfpaEEmjEv6OEst3flE3CU5ie+vXmC8baT0IMSVdy+qhQKeEA/p58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cl2P9cPfFnCRsfCVAOsOKJw7qKLwTLoAfNvoeJ0zBB0=;
 b=jmkbzJTVITEl6eck0XEU3E8lY4CjDBttuHmHZ64TqFJL4wCrhEvQDR3ss1l8oSFV9YloKhwh+6JIiAjmVaU8VjdEYkE9BvE4NRaGp/n5WFA1x893oLJRZrF/Z6u1b3EUb+R827jaob0+bQxMvZc71NpPSRcXk8Qnno8SpOxxHq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 08:34:46 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%3]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 08:34:46 +0000
Message-ID: <d98b9294-32c2-4333-bda9-9d18cef35675@amd.com>
Date: Tue, 4 Feb 2025 09:34:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: zynq: Do not define address/size-cells for
 nand-controller
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <7a3b9eb256b90ea19d35f8bbe3fd311890767974.1736233292.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <7a3b9eb256b90ea19d35f8bbe3fd311890767974.1736233292.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ecb7a65-807f-4ea6-5e84-08dd44f6c7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGwwc3kyc0RYYlc1RXZIU2x3c3pPV0E1SUFhTGxjNTN5c3VRNDF6TEZRbGdG?=
 =?utf-8?B?ZXZEOWtESTFDZklRWVQ1eGJGU29BZ29LblNYd25nWFNuQ3ZsMWcvWTN0Vk9W?=
 =?utf-8?B?cDE1L3JyNmFDNURodGZhNWhLc0hoNSswbGtXZlB3a3BjQnFyVmNJbHdnUU1L?=
 =?utf-8?B?UzdKdlc1YUgvUm1aSGlXSG0reE45clBybFhxRHBjbjBBTnlPcy93Mk4rK2NL?=
 =?utf-8?B?TXpueCsyZGdFdHl2Uk5xWXBJbmpvbXVwazZsTkVXalNjY1JjUU9nc3krcmRR?=
 =?utf-8?B?VVYrYmJTTGRVd3BBc1M4UWdDMFVKbnM1aVduTDhFSnNodWt3ZUVqdEVwMDB0?=
 =?utf-8?B?bExZMkFMRks3T1ZrK2E5OUxtRzE1dng0RFNITks2K3ZUbmJ5YXFoUWRqVGNr?=
 =?utf-8?B?clMrOURyeUJ3RDZ4SG1JRlZnNkFud0V0bmpta0lxRFMxUUl2WFczNWpVZ00r?=
 =?utf-8?B?QjNNWkNYck1BTkg3SnBsZGNyOGVyZndhY0RGcng3M1dWYk54T000SW9pZXpa?=
 =?utf-8?B?VWI0SFlrOE8rblNyOGY2bDd0WE9OMGNNMEc1OWlZQVBCRlVyRlM1STFzSlJR?=
 =?utf-8?B?ZitNY2hoVEFhSEJuNXBTZ254UDhTM29JaCtrQ0lPcVBWbk9VTGlwYVhWSnZr?=
 =?utf-8?B?RmVlTks2VmtuT1BtVGs5RnJCaHlKanpOWkVJb2NmeWJUeUM2d3dUVXNtbGRa?=
 =?utf-8?B?WElYdzkwbFB5TDlkcTkyRDlFalZDTml0VWwxTVpPcFErSVRCK1JrV28vc3Fx?=
 =?utf-8?B?bDI1MkxHV0FDekFjUkV0T3dzMm5FRkJqdCtPUXRGMWZZdUxkWW5LczdLZGVu?=
 =?utf-8?B?N2RkMm9lSnJTbUxJa21uMElZaCtHeGdQTWUxdkI1aE9zeGdCeUpYSlZiZDNV?=
 =?utf-8?B?K1pLazBLd0dFdWw3TmFlSytHMGFlNElqUXFMZjNBdHhPSThRcnVXMDFURyt2?=
 =?utf-8?B?dmxOQ3V1QTREdmE4YjZ5Yk12Z3gzL0gwajZ6RFMxNktMME1weis1OTdUbjNt?=
 =?utf-8?B?QkRtODFSVS9GaG1PQ0pMcGZNdGxpNGZaeC9JSzdwNm5sSEFEZVE0dkVKTllJ?=
 =?utf-8?B?NUg3TGhxNGRVenMrdkFmQkdETTBwdkFtYloxSjUvaUUvUTVFaUliSXYreFNF?=
 =?utf-8?B?cktqZWNJR0txSERrd1NEU1RWakdldzlmMnBGd0FSL1BURHNSZWZXc0w5TTQ3?=
 =?utf-8?B?YWIwV1ZYKzJqTEMyNFk4KzBlc09PSWJOYnc1V3c1enV6aDJwVVVCRmJQQTdU?=
 =?utf-8?B?SG42cXhwbmFCYU1YOGY0VngrSkNKck9hKzVsRXNuTmg4VlRKVWF2RTJMNGxw?=
 =?utf-8?B?VzdPWHFKa0ZIejR1YW92RVIyWlpDU1o5TEMrdFFoQ1N6VTA5TVU0ZDNLQmJG?=
 =?utf-8?B?OUFrS2swbEJQOVExT2JuNHhXcWVGZGlqKy8yYjhtRGlUR3QyVC8yQkNvQWcz?=
 =?utf-8?B?UUllNk5HYUtOQ2Rkb2FBcEdRTDlDZVU4YzcvbnNRQ0l0azJJdlJQMUVqZTlX?=
 =?utf-8?B?RHc4NzRhbEk2M1hqR3FYaGJQZFVYRkRlL1VoNDBaNUZRUHlmTjZOYzdHV3No?=
 =?utf-8?B?a1VCWEFCZUhmTGpwQ0J5bTdPdTBIZlNxK2gvT1ByWVZXZ25Ndm9OUG5NOE1j?=
 =?utf-8?B?MGhTcjZIaWlPZ1lXSXJ5Nk1hMEg3K0d3SmhJOEIydFU5TkFHQVdOTWg2aG00?=
 =?utf-8?B?OXBoVStTWlc4emgzS0ZSOGtudnNlSUFDRG05NzZJaFhSaU9waklaU29obHoz?=
 =?utf-8?B?MjVaamhtYTR3Y2g2ZDltNzRSU0s2ZHRHbk9vWU1ORWVROHJLK0RnczBaOW96?=
 =?utf-8?B?MXg0ZDJ5TXkyc08yVVpJWGF5R2xVUmRGNzNsd3RLUUVkZXJ6ODkxYUdUbGxY?=
 =?utf-8?Q?6kiXBvq11lb3y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGhPZ2xlU0I1SGx5TjlvN2RWZzlOWGVKRmxzdDVtVy9wdm1RdjJYVGFhVDBv?=
 =?utf-8?B?eU03UXN0T1BVMWpjUkswMUNSdTZPcXhaSHVXQlk3TDU2QnlsNTRQK1NtMzRs?=
 =?utf-8?B?TDVoc3R6VGxSN0hzblIzYkRqWk1sSURNSkhQdWw0MXdxU2N5bVNFSEt4ZzVQ?=
 =?utf-8?B?ZWZJUVdqVU9URStveVdaa3IwUmNxdnQ2QVh3Ym1hamtEeWNuemFDbEpuMTZm?=
 =?utf-8?B?Ly9OeFdwTDRuUmhPemU1ZHk0K1NJTnROa1cvTGszMGZySnh6L2EzSUxUUG0r?=
 =?utf-8?B?SmxnTGkyTzN6RjRXQWRQZFRFelR6UVY5UmZGdXBiQy9WNlZmV1RCMENGeXB3?=
 =?utf-8?B?QUEwQ05JcEVjRDIyczZabEQ1MDhvdVpQSktsa2YxN2pKdUJ5eXl2aTlxelB3?=
 =?utf-8?B?ZlVwdkZsekxaMnR5OUVqdDBFcktDbDA4REJaZEc2cVFFVlpsbjg5T0RKMFBi?=
 =?utf-8?B?TUpRWWg0clNTUElIWjc0U043d3gvWnhMY1AwQjJzbTlhdFc2L3dFWGVzeVZI?=
 =?utf-8?B?NFNuLzdCOVZlc1MwM3ExUFRzT05pQy9DNVVWVnJhSWRSVERkeHBta2xod3lx?=
 =?utf-8?B?NTk1VHF6QUFnV3RIMFlMd1liWkN2MWxYRW9HSXJIdVBMdzJIcEo2dkUzLzVz?=
 =?utf-8?B?RWlXWHEwbm9ta2RZd0ZobGRRa2k2K20xMVpoM0EzYndnR1NQNmhBTHY1Zmcz?=
 =?utf-8?B?bDJoNlgvb1B5M0tzengvelI2bkNTSmgzOXhMZFpsZFNic3dxN2pLaWVSL2VI?=
 =?utf-8?B?bVpjL2xmOVJ4eTZzVVMzVWdRQlJtZEFlcUpYemZORlYwWUNEbnVkcHN6MXcv?=
 =?utf-8?B?UlgzVTR6ZWgwN3ZJQm1qV21ONExud1RzQnB0djhrWjI0bmFtNlNQVmFMd2RS?=
 =?utf-8?B?alljdXRUSGtwYUFGcW01dmEzNVRIbDNiVmM5QnlQb3hGbDFWcWk3SUJuWFdl?=
 =?utf-8?B?RVpZY3BmVitML1NkckZrTmVXdVpzc1NlSlFoUHZ4MFlOUkVBcUJ4MThYNjhP?=
 =?utf-8?B?RUNNZzd0YUdYRVNzRFk1NTZObkhOTDJCVkRGRUxoVHZRNGVTWFU3aFRBQTJk?=
 =?utf-8?B?ejJtZXBvUFFiRFFqcDhIOHp1andLT0VsN3JsVWZPM0NSdmlsZFpUOEJHbFJ4?=
 =?utf-8?B?aVVaTXNwZ0pzL1VDYlpPK0pTVzlNY2dWYmFzZ3NZUWx0ZHRZclNCVUwzemI4?=
 =?utf-8?B?bnRSaVArNGRudENzQWJqUVk2em1uaHNDQWNMNXNzK0JReVAvem1HZTltZDhh?=
 =?utf-8?B?dFZhK2dFdE1ORzQ5b1BsakNqVnEwbE42bFJEcldsWmU1bGpjWUdEMzdSbW9h?=
 =?utf-8?B?bVc3Mk1RREgyTFBCWkRWNGF0ZytucXN0NC8rbWVCTXFwVXd3MHBGY01JVUZv?=
 =?utf-8?B?eDkxaEIvMGh0TFNIM2Y0SEM0bUduMm5JeVl6UE1FbVJSR1ZUNFZ4eUhKNHJp?=
 =?utf-8?B?eC9VVS9GMnNWbEpzQVYyNTExS1RYekdFRzcwdmZSdDBkTkd3aDNTRlU3YWRz?=
 =?utf-8?B?U0RRY3Z2RWliTkdyT2lLNFVHbjFFUldRWEJRWXBMci9PMmdPM1g1Ym92U3g2?=
 =?utf-8?B?QVBTZU9lWXUrL2RJTUtGRmNCeXJseE5OR09UaXdNUU9tK2dLTHBSOC9zeGov?=
 =?utf-8?B?NG1xZklQcGV0OFZsOVg5RGFhOE9wSVdaMUFNa25rTUNNa3R3RFVUd2dxSU1x?=
 =?utf-8?B?ZG1OZTR5SlhOdnF0allMeXVkNlBYUWpYMFVCKzJDdmh6RGNUakc0S2VuM0Rs?=
 =?utf-8?B?UUVZNDlVM1JGMi9NV2tHd2xSRlNrTEdRRHpNaC84RS9td2paUGxjSnVxYVYv?=
 =?utf-8?B?RnlPUldlUnZMM3RhTW5oY0Y0Znp2U2h6bWxObVZCVDVqN3RMaVBLbDZyaFhI?=
 =?utf-8?B?U09lSmRWU3Z3R1dTYUxDMEN2WmNMSFdVWTl1KzNwd1NrNStiYVpqK2puWWtu?=
 =?utf-8?B?eXplUHI3S3NFbWVEVXFVdUNkNEIweFhjUmR6aXdMdWdJSUZGWjBnL0dMRXpy?=
 =?utf-8?B?ZlQ2bzVONEZ2YjFDWk9jZ3VFeFJIRmhGVmxMa1A0bXFmdzBkZnBhSE16aE9w?=
 =?utf-8?B?Zzg1a1d3M3VtUTc1czZ0T3RDV1JwRktNd0piQ1BDK3haVS9WeEhNZDJYRkZL?=
 =?utf-8?Q?6fXImFs+SPiRyTy1Bz8+U8Hbb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ecb7a65-807f-4ea6-5e84-08dd44f6c7de
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 08:34:46.3648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6j322zoZXu3YtXXTFf+jFEdisUZtco/NWr/ir4TVkMq7Q4a+iPpKMpxyIzKYdq/8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962



On 1/7/25 08:01, Michal Simek wrote:
> There is no reason to define address/size-cells without defining child
> nodes in zynq-7000.dtsi. Define it in board file instead.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
> Changes in v2:
> - Update also zynq-ebaz4205.dts
> - Update commit message
> - Send it separately v1
>    https://lore.kernel.org/all/37057526d8ee14416f61fb6e2b82bed65bde5d3c.1733920873.git.michal.simek@amd.com/
> 
>   arch/arm/boot/dts/xilinx/zynq-7000.dtsi    | 2 --
>   arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts | 2 ++
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> index 4a29216a6d64..153b8d93cbee 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
> @@ -303,8 +303,6 @@ nfc0: nand-controller@0,0 {
>   				compatible = "arm,pl353-nand-r2p1";
>   				reg = <0 0 0x1000000>;
>   				status = "disabled";
> -				#address-cells = <1>;
> -				#size-cells = <0>;
>   			};
>   			nor0: flash@1,0 {
>   				status = "disabled";
> diff --git a/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts b/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
> index 53fa6dbfd8fd..14f644156a6f 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
> @@ -51,6 +51,8 @@ &gpio0 {
>   &nfc0 {
>   	status = "okay";
>   
> +	#address-cells = <1>;
> +	#size-cells = <0>;
>   	nand@0 {
>   		reg = <0>;
>   	};

Applied.
M
