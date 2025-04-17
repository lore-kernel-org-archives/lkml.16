Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2074.outbound.protection.outlook.com [40.107.212.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7253D18E743;
	Thu, 17 Apr 2025 16:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908504; cv=fail; b=SsYWDmlbQ6PUh4eincdjQInrTsxjSiHTYUw16ilElpDgQA8M6yq21tOP1MhHg9EsRiO0vNciNoNd9NDEztXTVR/TpUzNHy5W75R5mlcWfD2LSB2r4cOZUPVAV6LFMdu79tm9JoIwcYY6iCOVmeryJZfWVhCf25PhdVNtJNjLi94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908504; c=relaxed/simple;
	bh=3dm7JxqEfDtkTDm7QGJWYYYtrVkcWZhBir2I81MN43c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cSKWQ6DcxSCdarBJgFhc9rq32/dxAU0RhWly85IHv9SZmJqXE54H13vwYrWyAxwfdYYrGYiYfRGA3MYR6V1PT+H2plQTsUoenhuUf52ZAm7/CikYdDUKQQSWcn25iWaFrEUVJfzIwMWBxYFDvYegaUPNwRcSSPsRW9F4AHJRuWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CkFADRRo; arc=fail smtp.client-ip=40.107.212.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CkFADRRo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rw6sbO+IgPR9SMue/rHi4TY86yYX39QuKmK3lV3yCZZmapVdxFjmdm0r1sGMH67RYemscsTS1EurAN5zfm8xrPjUVV+YABydkMJ85NRNlsor+YasvyFNQeKOXV+OvoyWbbCFRthJdiMfgPSZIjAb3NgG06bqjnKdCGl5U1zD+8frq3wKKmbnkqE7LUNym2omc0Eng3yJc9+fUqtN6jY7YCnCI6aiEYWWxlibY10KVPRNSt+BLvv/KQZMJ3joqLW7n0vP4E+qB0+PJSE+vL9D023W27oea6gUaErXOnG2fbOIjS9dmqeeE9Wbbh77I5xpP4qOTv5gesV1rVA1AcDaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KceYi8rMtRvDmBg7iMAw4bWO49rEt5s73kB6g/BqMb0=;
 b=dyc2WuIn1Synnp3zVvcGyjszuG+8MllMCAkhRU4Bz72LU4NGuauPhaWU5muCt+O1nTpD7Be3Rezi7oAcxMU6tQVITZlc1xirp7vRjWzPbx1irlg1KPC5eaqpfUAyVzK+yseVtKU0MW88PyWz9hA37M+lfOJf2fjewYwdffvrXeNitMObOhvyykxZu8IBUdpvHKWNaSlwmIIOvwb+Yk6diilwyNTJ3DGNwzfQ1w9Vd+v/2lxz6rL1fVqzV+kUyALyK3XObghYpbwoFhkBbvP3SiVk/pEFV6dMD/WOux1J8aQ/p9eqw6yY2vu7M0naFH8OkxtjY4sfU9unCH9vHuz1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KceYi8rMtRvDmBg7iMAw4bWO49rEt5s73kB6g/BqMb0=;
 b=CkFADRRoYqp/TnjY8+3BdC4aDVaUxnznKXTWYCN9pOwrmJ0eEbazaOb4oodviah7poV6goMfeXQjqs/qqD/SEZE+X+lWtvW5+hviDQfo9FEFnerUdaAzKo8zxqTREWjmagCtUg/1R/GnR4FYn+M1SCutfotvqmwVNPPDDz0SAN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CH1PPFDAD84AB72.namprd12.prod.outlook.com (2603:10b6:61f:fc00::627) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 16:48:19 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 16:48:19 +0000
Message-ID: <42e6ba7a-6a6f-4400-b4ee-4992f67f9ff8@amd.com>
Date: Thu, 17 Apr 2025 12:48:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] platform/x86: Add AMD ISP platform config for OV05C10
To: Armin Wolf <W_Armin@gmx.de>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250416191411.1482060-1-pratap.nirujogi@amd.com>
 <9c657496-05b4-49c6-b24c-57be45ef8cc1@gmx.de>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <9c657496-05b4-49c6-b24c-57be45ef8cc1@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0192.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::13) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|CH1PPFDAD84AB72:EE_
X-MS-Office365-Filtering-Correlation-Id: 41eb0db2-f375-43d8-e4dc-08dd7dcfa85d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEVaTDltSlJUYzdWQkJJdHV4ckNnaS9MblNlQzB0TE9kWDdOSTNaS296Q0Jv?=
 =?utf-8?B?Tit6akNSS285N1M0THlnTGdzM3EvaXNhK1lXK0VsUkYwV3ZiQ3dwSEEra0Y2?=
 =?utf-8?B?OEJHZE5kTWFmdkh6bmhFOFhFdlNQdXVEMGM1ZndGdkM0eVR5V2MwMm0xQ2ky?=
 =?utf-8?B?UUdYdzZ1SWpyTXpqdnUwdTYwbjZndWhJYjd2WkpZQXRaZ09iRnRpMkZCQ0hz?=
 =?utf-8?B?MDVyYmh1VFFKTzV1Nmc2aVJEM2NLSWI1R2VRd3BpaUNGRmFIVEhGa1hXb04z?=
 =?utf-8?B?SVRQbG9wUko3RjN5M0lkVTRzbWl6Mno2eWdBc1M5ZHlDbEp0N0ZjMG9OeUNP?=
 =?utf-8?B?YnJpRkN0ZUxMcTFmWHJLaEVWSWE2anNtQUNrNWRMa0lJcUNjbVhBQVh0bFJR?=
 =?utf-8?B?S3NDRlhVVFRaY2cxTTFMeTQ1elNSb1ZhUXRyR085VVN3aUt2N2pzWUhpbjI2?=
 =?utf-8?B?K0ZVaWk5dXEvS2hEaGtZZG1UdFB5MURqejFwSG94dHNYRGRxTlROMlhsR3l3?=
 =?utf-8?B?Rm1uZVVzV0VWWFkwKzJKNGFxamlwZERFZERhTmVFckNaZGFYdHRlTGJEcHFv?=
 =?utf-8?B?aHhKNmFtdnpzUEd3TTFkaitIN2w2bGRkYXh5bEFGVnptRW01SXJ6ZzNETzY1?=
 =?utf-8?B?ckJyS3BjUy9FSlhHeFFtcDdtVU1iT21lR0tpYlhIalFmMmxNRHJZdmpkZjJq?=
 =?utf-8?B?VVI5bS9LeWJ1Q2dHR0toWW1OemNEMnpsQk5kNSt2Y3JGZjd5aTh1eWJuS3lH?=
 =?utf-8?B?WGZsSzg1OFlxMW5FUTIxb0kyOFR6ZjMvSUdXZFZzY0VIQTZiS3pCbC84enZT?=
 =?utf-8?B?VkhvUE9VS1REdjlYRDg1R2VaQnNpRkVNTTdLb0FOYzFmNVVFdVdJbFBMWnlo?=
 =?utf-8?B?UjlXelpqQkh6Skh2MzhKcmphczBtdHNLdXl0NklYalRHOW9PQnJNUkUvV2pH?=
 =?utf-8?B?b09SMXliVGdLcGNCdFVsZGFDejg2U2ppeVdodGRpNHZyMEQ2TkF3cDRYanNy?=
 =?utf-8?B?OVJsS0lnYmd3SlNkU1VNMnIxY1I3RVVhOG0rYWtqSVlRTDdMVnlPTFhyNUVT?=
 =?utf-8?B?YU1PMGJxWmMwUWRFc3BDNXJCa3F4QXE0Uy9zUmxCb0lVNUllZ1FXZTkyK0x1?=
 =?utf-8?B?QXdGNk9vbmUrd1F5MndLb01aa29VM3ZIRXlGZmp4UjNjSDBXWitZdWI0NExo?=
 =?utf-8?B?L3BGcUFXa1h0UTVDT29sZWJ2QThoang5VXI4L1BFSVBqLy84RHNoYllrTlZq?=
 =?utf-8?B?QzJCVTBIQlZEUmJjZ3o5RDBhSW1VWE5ZMVhJWjRHZ0NUWExpWGU1eE5YdS85?=
 =?utf-8?B?Z241djZVM1NBWHprSnpvWUZkWUJHQ3ZMZU1rN202QmVVb253anFCL20xWFEx?=
 =?utf-8?B?K3ExRmlpWGs2NjVNRnUza052b2NLYVJNYkZHa3ZacSt4MmUycHl4VmNDZ1Zt?=
 =?utf-8?B?VjFucC9jZ3UxZjVhM0hwK0pUc3ZnWHMwdldmZS85Z1VKdkJjbU5UY3ZWb2hv?=
 =?utf-8?B?V3F4L0o2OUFhWHBrRGh3d2VRcStycDJ6VVFuZElNZTcwV0JsSzRkTk9vVW1R?=
 =?utf-8?B?a3V4dzFGR1hyUzJlYnhaUFM0N1haOXJmMnNKT2lFMDZQdkdBV2lqZnpiK0I1?=
 =?utf-8?B?UDQzd3hrTkIzVzlLMklCNEVGZUNSUm5aRlNiSXNhUFYrTVRDcjJFRG9PQnY2?=
 =?utf-8?B?dlA2YnZaSTlLOElzYkZEYmhMK0pDd2pZcS80aGRiUVNzUTFvMWc2dkJaMTVq?=
 =?utf-8?B?cHF1YXNXMzdNcDNYbXdIWlNPTm9Kc0pRcFk0Y0F6bUJ1Qk9LdFFLZ0FKQkg2?=
 =?utf-8?B?Yk8wTkQyQVJWR1h6S09VazhVRlhWWU52TGRTSTJxMktPMXJJakJ6TTEyN0Fk?=
 =?utf-8?B?enAwY0lhSXhKVktsalM4cXd0RERpK3A4K0lxNTQrb1RaSVk4azVjWWc3ZGtP?=
 =?utf-8?Q?uAB1fWH4MAw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WElkeklzZjZiQmFTNGpiR2trVWJqV1EyYkpMZmo2cjAvaGZQanZuNk9sVTBE?=
 =?utf-8?B?TmFRSjR5WHJNdy9KRHRIcmNhbUtQNmU5ekRqeDBzSFlCTVpvVDVLWFdyTm9z?=
 =?utf-8?B?cWt0UlphZnNNQkZXTGlGMjgySDVjemtQZlJ2aWNOS0RSMEU4SmljWGtaSExN?=
 =?utf-8?B?c0xhQ0Z5cStrTDF2SER0RHZCeVhYd1J5WE9FcDlKeHlvUElhZVlha3dFd3RS?=
 =?utf-8?B?bVpMZ056M2JhTWFmckNEaUljYVRDZWdjL2M3ZTcvYVp5a20zYXhwUTFaL1hB?=
 =?utf-8?B?RDEyQUZEU0Fva3ZrUVcxV0xwZXdDa1QzYU95SjcvYUtoNHdrVFNxUk8vSnJM?=
 =?utf-8?B?ZTJaMHIzazZRMWUySi9VWDJUOHZndU0rTTNUaXgvNnk3SUk0QnJZdWNVMVVG?=
 =?utf-8?B?a2ozWGZ3YmRsT0ttL3ByWXVrNjA1em9JRGxQTENTSm5VbklEN1czenBENUVW?=
 =?utf-8?B?blVlYWRJYkZuOThrUTZoOWRGZVJtQXdRVFJnNnFaN3VuRmx3UWlrZVRnMVI2?=
 =?utf-8?B?MTNwMnQ0Vzlxd0pha0FneXNxQ1IvRXBjLy9vcHZMclMzZU5SN1diMHQ1ZUds?=
 =?utf-8?B?b0tpRzJZTGFDRXAzdzVQT0lVMW1pUGxKeDZRalNzeVgzeVllMURhTFQ0bHhs?=
 =?utf-8?B?OHBBdThHRVJKaEZka0dSWUtiNWRWd0VqRGYzVWxDeVk3bGxxMXo2VkJkbTJY?=
 =?utf-8?B?b1RxQ3phT0R2M21vdE1VQm5EMjZ6T0lnYVRyVWk5RG9BSDgwWEo1V0Y4MjlN?=
 =?utf-8?B?VnRRR3FJMkY2akY0Q1hLSlZML3VUd2lQMk1uS2lMU0J5Z0N6Q2NOWG4rVFJh?=
 =?utf-8?B?a1FqeHBGK0toN0lab2F2bXQweXgxRUxWWW5DbUZVaXhNRVRRTCtPcGhlNVRP?=
 =?utf-8?B?TmVZMHJOMXZTRE1nVjgwb09IaVpndnNUMGZIWFJ4a3FaZWZtYXQ3VTBVK1lh?=
 =?utf-8?B?RDZrVHhiQ21zM0RnaktUQ0dwNk16d0hVSndNUHlXeWxaeWk1dUdzeCtXclEv?=
 =?utf-8?B?VFNqSDEyK0J5NHZUR3RMaUdWQ01QZkVZYWxOS3pta01SM3JicXFrOXoxL0gx?=
 =?utf-8?B?QVJUamxKTU92T0duUXZUVWdNbk9PNjZUMmN4U080S1BzSm42MzlLSVptU2hJ?=
 =?utf-8?B?eWt4L3lMTWhTV1BXK2c4TFJic3ZNUElNK1ZDaTF4K2JXR3RpWU5NY2FNOEZ3?=
 =?utf-8?B?SGlkb2dFQU1DYUhtVE1zdEpFRWF3cUxkL0FUekVzMThBUkJIUkxPQkFNTWFE?=
 =?utf-8?B?MUdxcjh4WUZKeTVsSklKKzcvVFpzcmNiZGtNVDg3OCtadmpKNE90QTZTQmxh?=
 =?utf-8?B?bUE3UUdGV3JKSHJSR1RtMXI5NFQyOW9zRTVzY21ETlprcjh0UW1uaGlHYUtj?=
 =?utf-8?B?cERXdlJjZFRZTktqM3FRbzRsZGdrbWptYzBBL000aC9GZU9EK042QU1iUWFt?=
 =?utf-8?B?Y0hrampPVVZLa3F5WWExdnJydDVyV3A1Q3N3ZktLckFxZU1peGx1OGR3TXYr?=
 =?utf-8?B?djRnY3JpNUwyOHJnZzNpYnpaNlArajNxNkNqRmdzYVZrTWY5MWNJcXZjT0FI?=
 =?utf-8?B?akc0dU8zT2VFNEtmK2xNcVVFNnIxcEhPVERNYkdWalU1R29QUS9hWXltbU1z?=
 =?utf-8?B?dHY4RzFGYjdNU09TYnFRN2NXOEZ3L21JbEt2OEJBejdrR1lHMmZXZ2ZHTU1h?=
 =?utf-8?B?L1dDOUUxVUdGaFJFRlBBRStZb2ZDazhGM3lCeUs0bGp0SWlzRnRNS2dpdmpP?=
 =?utf-8?B?aVZweTFTLzVCYnNQUERFbGlnKzVPZ0NmZGd6T1AzY0JVTklLMlgxdGJzTVhy?=
 =?utf-8?B?cTFlQzR0akhaRWdRU0E4d3Rvc0lnRTUzQ3g0ejBhd0ZKWDVXNWhkTWtUb05B?=
 =?utf-8?B?KzV2OG5ZeVlUM2h6Uk9GZW1sQi9vK3pnU2FUN1N0em5zU3NPV0l0VjJvcmZ3?=
 =?utf-8?B?OEs4bC9YMit5OTFNejkrbjVSYkIwUDhvMldSSitCY09NQ3BUMWd5Qm5rWjdw?=
 =?utf-8?B?clFYaE5OTlBpcTd3TVVQTDFwMkVoRzRQOGNLLzlGWWRya1RPTCtpL2FxQzhw?=
 =?utf-8?B?RWZSOGtvQnhndzlLTEdnSDBvdXV2eHluT0hyZFJGYjlTa2ZoUGtQNTdrOG5D?=
 =?utf-8?Q?SEJXXJn2PphHL12qtoPbSjCH6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41eb0db2-f375-43d8-e4dc-08dd7dcfa85d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 16:48:19.5066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cmo3BVaIEPSTSNRkljFQg3lP1nSZzRgk6CoUY1oHNqMHivC7NJu3mcvDJTM1MIav2WtiTu3dwITNQDJnWiobQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDAD84AB72

Hi Armin,

On 4/16/2025 7:22 PM, Armin Wolf wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Am 16.04.25 um 21:13 schrieb Pratap Nirujogi:
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
>> Changes v5 -> v6:
>>
>> * Cleanup header files
>> * Avoid unnecessary casts
>> * Fix coding error with software_node_unregister_node_group()
>> * Use i2c_client_has_driver() to validate i2c client handle
>> * Address other cosmetic errors
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 278 ++++++++++++++++++++++++++++
>>   3 files changed, 290 insertions(+)
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
>> index 000000000000..9d1abbcc915f
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,278 @@
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
>> +     .board_info = {
>> +             .dev_name = "ov05c10",
>> +             I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>> +     },
>> +     .i2c_addr = AMDISP_OV05C10_I2C_ADDR,
>> +     .max_num_swnodes = NUM_SW_NODES,
>> +     .swnodes = ov05c10_nodes,
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
>> +     if (!i2c_client_has_driver(i2c_dev)) {
> 
> Hi,
> 
> i think you meant to use IS_ERR() here instead of i2c_client_has_driver().
> 
sure, will revert to IS_ERR() check in V7.

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
>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(const struct 
>> amdisp_platform *src)
>> +{
>> +     struct amdisp_platform *isp_ov05c10;
>> +     const struct software_node **sw_nodes;
>> +     struct i2c_board_info *info;
>> +     int ret;
>> +
>> +     isp_ov05c10 = kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
>> +     if (!isp_ov05c10)
>> +             return ERR_PTR(-ENOMEM);
> 
> Please allocate a fresh instance of amd_platform using devm_kzalloc() 
> and perform the initialization
> there. Using kmemdup() means that we waste memory by having a useless 
> struct amd_platform in memory.
> 
Thanks. Will update using devm_kzalloc() inplace of kmemdup() in V7.

> Thanks,
> Armin Wolf
> 
>> +
>> +     info = &isp_ov05c10->board_info;
>> +
>> +     sw_nodes = (const struct software_node **)src->swnodes;
>> +     ret = software_node_register_node_group(sw_nodes);
>> +     if (ret)
>> +             goto error_free_platform;
>> +
>> +     info->swnode = src->swnodes[0];
>> +
>> +     return isp_ov05c10;
>> +
>> +error_free_platform:
>> +     kfree(isp_ov05c10);
>> +     return ERR_PTR(ret);
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10;
>> +     int ret;
>> +
>> +     ov05c10 = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
>> +     if (IS_ERR(ov05c10))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>> +                                  "failed to prepare AMD ISP platform 
>> fwnode\n");
>> +
>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     if (ret)
>> +             goto error_free_platform;
>> +
>> +     platform_set_drvdata(pdev, ov05c10);
>> +     return 0;
>> +
>> +error_free_platform:
>> +     kfree(ov05c10);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>> +
>> +     bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     i2c_unregister_device(ov05c10->i2c_dev);
>> +     software_node_unregister_node_group(ov05c10->swnodes);
>> +     kfree(ov05c10);
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

