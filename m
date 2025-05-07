Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3DFA927;
	Wed,  7 May 2025 20:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746648972; cv=fail; b=XMv3pD25nb0y+Bj+/9aiY3bNWLvLEinO5pqS+dCzSLX59DbR7Ky6oiwC7ep0J+odAa427gzAq0cEDcssiHwQB0S32adZLl2C25faecUWqDhlzSTqu3hxb5xs5xdBDTxYfONXTy9wgVyXLvHusz5VWrCYlFxZDTnZyJCu2Oww3GA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746648972; c=relaxed/simple;
	bh=+4ZwxrIjJHiiNt5jc4aVU+QrP2iDfmbj4eeQ9ZcWVXo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WPtDocn9Zihsk22DTnxCqUOlSv9OI6vE8qArfUGBSEC9F46aXN/B3921sm4uFSLAOfJFQla6CK///3tyn9fZh9l/OQtaBcmuTK1X/cj5ZrACgFU+aM3H5pQcgyqcBV8mglYrJVFWU7m5Lh63qzKWlw0lorLiMOIi32ar1Z4icj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dz3gAta3; arc=fail smtp.client-ip=40.107.220.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dz3gAta3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sjdi6WageYq9otYNFBAkYRzbTHZK33vK4q8Tk+1GKz+NrtipQWOeyKDcQGo13wlvXP9O6yIWjlmcD7T3P330X2VGK7rQAw6u6yW2sGQ7mhMQmUcU7heNRKiUnnUPL5SwllPRnqwaR7NQjLOsS7Jk5gg4B+H+AXsVH/vnK7gko++cokG5qpNWFPH8oZ+4FtuTGx5NQK7uE3BPuqH8LJ0pSSNt7rtGltX/vUvExjDlZZk7sISExIF0e5IFaX9dWVEOlqeey6fmRehFWpzk5QQ8mlnv4RlKBLA5cCSulqRP1QCRGnS8hjf2W+fntzaeadMGFEJJ8gqKRDIiwuZwiHTXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpsk25YVJcCoU7b+UMMR3SNNE8Nm+uLX7U4HloqPhy4=;
 b=KliaHEB3k7BogWQvm6wEkn9uTFnmJqDhWK5aKIrGopfeA5CdeeGbkosqeLC6pdTkaa5BmLyNbUE/dZayMNvcSRJ7n86Mepp7Hksusf38KsDLWRJStvOiyP9ScmlN7p5QXGKg8SdieKGQf/cIjtlLTKfq1p9aJBCOkzEbeJ+NhryI2b2iideryXJ38ay+2k0hISn3+/zQiiCf5VlNRtw+tvjQhyU+vlvswxOhJgSXf1yHfl0vUkN8podwuX5C+wLZjGsmH1hbC/PH0yg9JYFh+N/lb+3wYBpPX3oVGdlxrbX1gMFiSfu4zF1mFAnCsryt1DZmrPuQYnNiRYT422VWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpsk25YVJcCoU7b+UMMR3SNNE8Nm+uLX7U4HloqPhy4=;
 b=dz3gAta3MM4cppzE9SOaKxm1PQg6uT7P38KUkh1nysb1hFe6yskhG85zSq1qcF1D0qxU+jKvMQ4XKlUY7/JmC92ujvXu7GmeBoEUTExfBpg3u/kCt4xTBKveUxePkIsNz6TtYvXU0K7xkDXupBf2jR988yOYj3l287SsO7Lw2ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by PH7PR12MB9126.namprd12.prod.outlook.com (2603:10b6:510:2f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 20:16:07 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 20:16:07 +0000
Message-ID: <9c99a76d-8fe4-4793-8036-67d2923a1e51@amd.com>
Date: Wed, 7 May 2025 16:16:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: Sakari Ailus <sakari.ailus@iki.fi>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: hdegoede@redhat.com, W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
 <aBosuj_TbH7bzjfZ@valkosipuli.retiisi.eu>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <aBosuj_TbH7bzjfZ@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0125.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::27) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|PH7PR12MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e80de6-0a63-42f6-f08e-08dd8da3fffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEhWdWo4ZnkzZmM3UWplQjdkWG1haWR3empESmdvNXlhem1sMVdWR1N2ejF2?=
 =?utf-8?B?WmwwRGM2dGMwZHJHRjRoaWJhS3kxNlNiNXM3a3JDMGFvTmpZS1FJU044WTZ3?=
 =?utf-8?B?ZGROb1UrQzZMM0FzY3pDZER6Z2M4TjZNZ0Y3UXpueU1aR2hINm05SmtNbFFH?=
 =?utf-8?B?OHIwQWlNVnRheFEyUFVpZ3V5M3FITUhnOEc5NG9uWjV0RU84R2RUT2FvM01R?=
 =?utf-8?B?OHZYN0FDaS95WmxGcXNGb1phdWRuWXhnNzNHS0VtSUNLdUhPc0pXNFJyREpX?=
 =?utf-8?B?ODdJWC9PcUdka2ZUSHhIcHlvTk5WcXVPY29JWlNmSmttem0vNHBaWER3UWZH?=
 =?utf-8?B?ZEJDazNTckRobUxPMlI4R1NDS21Pc3hzSDM4QkVWMjBkbGxkdVBLazJlRTlt?=
 =?utf-8?B?MnN0OUtBSTJFbUFlYlU4K2RXVndWRDltQUVUYWFGTnRHMDdaMUNzeTFud0My?=
 =?utf-8?B?V2hONDdQK3hlSzV5YnBCY0NqQlozUlB5UEtXdmk4aGZwMWZQNE9yZ3NJTjFL?=
 =?utf-8?B?NS9pUmRNNkJVRjQrbjRWdmxycTA3bG9QT3ZOUWMrNVAvZXJKZTdXc05NbGZR?=
 =?utf-8?B?TE90dnE1Q0RQQ2pKb2tuYWxQTURJSzJpdG5TWGRHakNJV013ZXhzODIrN3NF?=
 =?utf-8?B?NVdmN3dmdDR6bUcvN1FGS1lLQ2JQdnMyaUJoSWdLSW9WWnptRTRFbThBZkhw?=
 =?utf-8?B?SG1udlozeVhUZUZsS3l3eml2RkhyNXIxZkwyUUg2Vy9kdUxoV3JKOVFTd2RC?=
 =?utf-8?B?ZGlCeW13WEJhdGlyQTd4QklzT21JWStteitmYllNaVYrMUZOUGxhSXFIb2pW?=
 =?utf-8?B?d1ZYKytxRzBUbisycU5mYkRBMmpsZTF4c3hSRkRKSGs3WndiSDd4ZEc1cUwy?=
 =?utf-8?B?d0JjOHlTT2ZnUXoxWTBSVW5RSVBJcCtQZ1BXTmFabHVUVWg5UWI5TmV1ZU5r?=
 =?utf-8?B?bjZuT1BnWlVocWIyYk5HNi9vYUlCYlBMTjUyYWsycFpWWDMrNEdKUWllOG4v?=
 =?utf-8?B?YmdjT2E2b21zbU5xTUtwY1VCYkJqTXBSMkdqKy95bkxVRmJlWmloOEpqL0Zq?=
 =?utf-8?B?K2JFVm04L2NrZHdVcWV0a05OYlNSMnBCTlB6a2R6b21RVTNTcnIycTJSaEFo?=
 =?utf-8?B?cWlMNmIyT3d0UW5ZL3RmekZPRnE3OXdBTklFRXA3Z0g1ZHdRbDVzamVVa0Jw?=
 =?utf-8?B?M3lDT0h0aHFPK1o0K05PRjRlb25najM5bnZQMno4dGxURUlBRE92VFRCVmsx?=
 =?utf-8?B?MmdSanJZZFpiN1FQKzlrems4QkdYWXd5UmpJQUVoUEhBRXBmdGVnQ2h4QStQ?=
 =?utf-8?B?Szl2dVRGalMrT00rL0JMc1d0bHBIY3VYRjQxcXhBaEgvZHRvc3Rka1dXZUlK?=
 =?utf-8?B?aUM4VzNCQnhtck1yWjJ2aDNLT05BZmJRWm1qOFRTUGdWb2w2SzMzdXNLMkky?=
 =?utf-8?B?dDY0YjkxZU9YSUJkQ09xSzQ1L1g5TFNIUUt5L0NyMjN1d2M5THNpd1hNYWhV?=
 =?utf-8?B?dHIvaVZHdmFzZ0lBZmJySjNENkNPOU9nTDBrVzV2OHd4aEk4NnR6UkF0UzBI?=
 =?utf-8?B?UitxQk05U0xNWk4yQ21PNU5xTGdmeXhiVFFjZndwTlkzRHNUSjhqemlWQk44?=
 =?utf-8?B?dzJkN2xsTTh2dnlHc3FuQ2loemVhNXRGMituM0xocUN6dE1Cck51S0YyTmZs?=
 =?utf-8?B?ellCL1BFMldOemJIWXloV3VEVjh4UUNiRjRLdTBlQjVUL1UzT2VwRkxzSzhx?=
 =?utf-8?B?SDJ5YlVoOTE1MjgwR1lOamJHMlVGay9IR0hXaEhqRE9kVXl3T05PbWpjK3l3?=
 =?utf-8?B?Q21aNzE3MXB6QlJFVGs5ODZGSlROTnhlV0ZrYkN5dSttUW15Mk1JU0llcVVw?=
 =?utf-8?B?RnkrcWdBN2xERUpyZHRWTnV2T003cG4xSzkxby95RThYSytnNHhUM1dLVjcx?=
 =?utf-8?Q?ycPNQBBKrdg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blVvWDZURDl3RWg0cVZZY1d1eWcxOCtVWXcxMXlYQmMvcjlYY04xaTN6dFNJ?=
 =?utf-8?B?aHF4VStWVC9YelBCbFZSbXhaK0RoL0NXakNoQkNVU1RiU2JacFZsUy9RSkFN?=
 =?utf-8?B?bXdQYTRsOW13cFFBU1JDaWVTUG05ejlkOTdlcTNQZ3ROWXptOUpUUVJzUTU4?=
 =?utf-8?B?d1JMUnRTZ1lKcStIWnZjMm8yOFpOdW9RTmUzbmJSZ2Uzb0U5NzlieHdnb055?=
 =?utf-8?B?bFo0UU50NzMxZkZNMTZRYXJlM3hoYlZtNXg3THZMRk95YXpXQnpRdFJCSkxt?=
 =?utf-8?B?WDZPWVMrb3hpR1UvVjNKdFhVQ0t3WjVpL1hjRnU0M0pNMW1mR1dQemszVFZy?=
 =?utf-8?B?OUFFaWhEYUk3bnQ3eFU0K3FBSERNQ2dNUHBRNE5rVnFTV2JhTVhYR0pSay93?=
 =?utf-8?B?RzRsdG5qQ0JpTHhCczlYd0x1WlBuRVNGcWtMdytUTlo3MGFXS1JFQkY0amFS?=
 =?utf-8?B?NHRzOGQ1TW5qTTRnRm5iNC9hUWZoSUtIZlAyUElMbzZyd29ockEvcFdOUW1U?=
 =?utf-8?B?eFllQ0E1VWt2TVl1aTJPWVFPQUVaY3lpMnpsc1FhaVJhelZEbWd0bTNrYWZE?=
 =?utf-8?B?ODU4dFNmV0ErQWRzaDdDR0ozNmNPL1l6SlVDWGRzMVYzUy9qY3ZwSXF1TjUr?=
 =?utf-8?B?S3BrcFlnWE5QamVlVENTVnBJblhMN2JyQkRUUStJbGhDbkQyNDJyejVjbkFj?=
 =?utf-8?B?MkV5ellmdmh6THJOZW9vb3lXZnd4bmJlQVNpcEV2ZWZBQXRKMTJrWjFMYXRZ?=
 =?utf-8?B?a1VaaVkyUWQwc2JmeDhCUVBrRnJJdVVHakYxVG4wWldSNzVrOFJGcnlPOXIw?=
 =?utf-8?B?VHMzSHhxbVRTT0kzNDF5N3BhUDROaDFsVzVmWEdrKytlRnRZc3lFc0p6L00w?=
 =?utf-8?B?MzRaclZHMEozcVVOQ0laZWd6MXB4SjVQbUtDWGdBb0pDTVRZMG03YmorWkV3?=
 =?utf-8?B?a2J6M0hNR1B5Rm15RnBlZXhBdVJ6QnJ1MVNNUnRpZ2U4NEJVWjdVbHdRdGZw?=
 =?utf-8?B?b1lkN1BDWG8zWldWQTFTaUo3dVNBMmwydzlPcno4R0NPSndPWHAyaHBZampH?=
 =?utf-8?B?cmk4UDlaUjlaVWRqbDNhajJ2aG50bjRhcC9FMmxjek1LY3BJeWhvSGREODd1?=
 =?utf-8?B?aDRmbjF4QUZuVFBFaWZwc2IwR2QzajZQZ1FQWGQwY1ZLS0xYQ1hZN2lGWEFJ?=
 =?utf-8?B?VXQxNXI1dHE1elVpTFpuT1NIUmtHamJiQVVXTTR2UVZQVDhTV094UXhaQXA4?=
 =?utf-8?B?T0hIMkVsQ3lkQ01pcyszaGpDOG5FZTU0d1NtT0JJMHFodUNGWFcxaTJrTU55?=
 =?utf-8?B?bDJ3Y3ZVeHp5Zzk1L1BQblBSa2hzUi9pQ004SzNXWERCWkJsUzBsWEpvbWc0?=
 =?utf-8?B?d1NkaWVFL3NyOGtpY1E1MFRseGIvTFpuWUs5Y2dKWDVlTGFiV2ZxRlNnbmlW?=
 =?utf-8?B?TDZKTDVlTzBuN0o5UE5nSkVYbldOVi94MU5hT1h5aGx4Mkk3bm0vK01iSmZt?=
 =?utf-8?B?Sm50RWlDT3llZGNnWHlMSEl4eTY2bGpNQ0VYdkVVOTRwOHJoZVFtNkJYYk85?=
 =?utf-8?B?T3o2ZC9iTjBzMGZMeTRtb2htVFRkeGRpbWhVWmlxcTJ1UlU5SXkyUEZkN296?=
 =?utf-8?B?WEdGaGRHUlI3WWlVQkFLek9yU2dBbENPSGc0cE51dU1tekZUbmx4Yk5rVG5h?=
 =?utf-8?B?eFRTWVhzMVVKMFFSbTRodUlRcW4wcDJpSm1zWVlsWms3SUpkc2U0NEJGcGM5?=
 =?utf-8?B?R25zdUcyVC9Wcmd6THBnYTh5T0s0L0xvODBjVGNIM1NvNFFNZVI1SW9LSHhB?=
 =?utf-8?B?OGpUck1nVGdmT3VoOGhlZ1ViWlBtMWVobDlHUDJpS25iNTd1eVh1Q25ZT3pX?=
 =?utf-8?B?SnF4S01FS1V1TVVZZ0lLcjFreUNxRkM5anNUZ2Jkem15eVZublBuZU9NZFhu?=
 =?utf-8?B?TitreDYzdDVHUmhtd2tVc0FpMVpGZXlJaS83T3ZIOUhNaE1nVE1MQWphQ0hY?=
 =?utf-8?B?ai90UGRTNFpOblR1YnlpTVdIS0NuMzRkVXBBcEFUNkV0bHJubVEyUE1YeEll?=
 =?utf-8?B?ZVloM3dLSUhSOVlqd001Ym5PZlNQRG9jZElacFgwbG95bmRmakFyR2RxMHp5?=
 =?utf-8?Q?3YKmgbo234xhSJQ4V5sbAEovk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e80de6-0a63-42f6-f08e-08dd8da3fffe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:16:07.2716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmEn41lSgUf3ZKDmOpkz1QYp/vtQzbNnRsKO2EKgykyaAJO7VUvyDrJreNZMRlouGdFeZClXbh244YV0wVQpLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9126

Hi Sakari,

On 5/6/2025 11:37 AM, Sakari Ailus wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Pratap,
> 
> On Mon, May 05, 2025 at 01:11:26PM -0400, Pratap Nirujogi wrote:
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>> Changes v11 -> v12:
>>
>> * Add missing space before the open parenthesis '('
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 280 ++++++++++++++++++++++++++++
>>   3 files changed, 292 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>> index c3e086ea64fc..152a68a470e8 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>
>>          This mechanism will only be activated on platforms that advertise a
>>          need for it.
>> +
>> +config AMD_ISP_PLATFORM
>> +     tristate "AMD ISP4 platform driver"
>> +     depends on I2C && X86_64 && ACPI
>> +     help
>> +       Platform driver for AMD platforms containing image signal processor
>> +       gen 4. Provides camera sensor module board information to allow
>> +       sensor and V4L drivers to work properly.
>> +
>> +       This driver can also be built as a module.  If so, the module
>> +       will be called amd_isp4.
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
>> index c6c40bdcbded..b0e284b5d497 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>   obj-$(CONFIG_AMD_HSMP)               += hsmp/
>>   obj-$(CONFIG_AMD_PMF)                += pmf/
>>   obj-$(CONFIG_AMD_WBRF)               += wbrf.o
>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
>> new file mode 100644
>> index 000000000000..1520ebb94507
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,280 @@
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
>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
> 
> What's the purpose of this _HID and is it present on actual firmware
> implementation? There's no such ACPI vendor ID as "OMNI".
> 
The (_HID, "OMNI5C10") is used to check if the OV05C10 ACPI device is 
actually present before creating the AMD ISP4 platform driver. Yes, ACPI 
entry is present for OV05C10 sensor in _SB/CAMF.

      Scope (_SB)
      {
          Device (CAMF)
          {
              Name (_HID, "OMNI5C10")  // _HID: Hardware ID
              Name (_DDN, "OV05C-RGB")  // _DDN: DOS Device Name
              Name (_SUB, "OV05C")  // _SUB: Subsystem ID


>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>> +
>> +/*
>> + * AMD ISP platform definition to configure the device properties
>> + * missing in the ACPI table.
>> + */
>> +struct amdisp_platform {
>> +     struct i2c_board_info board_info;
>> +     struct notifier_block i2c_nb;
>> +     struct i2c_client *i2c_dev;
>> +     struct mutex lock; /* protects i2c client creation */
>> +};
>> +
>> +/* Top-level OV05C10 camera node property table */
>> +static const struct property_entry ov05c10_camera_props[] = {
>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>> +     { }
>> +};
>> +
>> +/* Root AMD ISP OV05C10 camera node definition */
>> +static const struct software_node camera_node = {
>> +     .name = AMDISP_OV05C10_HID,
>> +     .properties = ov05c10_camera_props,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * ports node for OV05C10.
>> + */
>> +static const struct software_node ports = {
>> +     .name = "ports",
>> +     .parent = &camera_node,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>> + * port node for OV05C10.
>> + */
>> +static const struct software_node port_node = {
>> +     .name = "port@",
>> +     .parent = &ports,
>> +};
>> +
>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
> 
> How will this scale? Can you use other sensors with this ISP? Although if
> you get little from firmware, there's not much you can do. That being said,
> switching to DisCo for Imaging could be an easier step in this case.
> 
the scope of this driver is limited to ov05c10, and it can be enhanced 
to support other sensor modules in future.

Sorry, I'm not familiar with the term DisCo. Could you please elaborate.

>> + */
>> +static const struct software_node remote_ep_isp_node = {
>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +};
>> +
>> +/*
>> + * Remote endpoint reference for isp node included in the
>> + * OV05C10 endpoint.
>> + */
>> +static const struct software_node_ref_args ov05c10_refs[] = {
>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +};
>> +
>> +/* OV05C supports one single link frequency */
>> +static const u64 ov05c10_link_freqs[] = {
>> +     925 * HZ_PER_MHZ,
>> +};
>> +
>> +/* OV05C supports only 2-lane configuration */
>> +static const u32 ov05c10_data_lanes[] = {
>> +     1,
>> +     2,
>> +};
>> +
>> +/* OV05C10 endpoint node properties table */
>> +static const struct property_entry ov05c10_endpoint_props[] = {
>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>> +                                  ARRAY_SIZE(ov05c10_data_lanes)),
>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
>> +                                  ARRAY_SIZE(ov05c10_link_freqs)),
>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>> +     { }
>> +};
>> +
>> +/* AMD ISP endpoint node definition */
>> +static const struct software_node endpoint_node = {
>> +     .name = "endpoint",
>> +     .parent = &port_node,
>> +     .properties = ov05c10_endpoint_props,
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
> 
> Defining the number of entries seems to be redundant here.
> 
yes, NUM_SW_NODES can be removed, its no longer important. Will remove 
it in v13.

Thanks,
Pratap

>> +     &camera_node,
>> +     &ports,
>> +     &port_node,
>> +     &endpoint_node,
>> +     &remote_ep_isp_node,
>> +     NULL
>> +};
>> +
>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>> +     { AMDISP_OV05C10_HID },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>> +
>> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>> +{
>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>> +}
>> +
>> +static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10, struct i2c_adapter *adap)
>> +{
>> +     struct i2c_board_info *info = &ov05c10->board_info;
>> +     struct i2c_client *i2c_dev;
>> +
>> +     guard(mutex)(&ov05c10->lock);
>> +
>> +     if (ov05c10->i2c_dev)
>> +             return;
>> +
>> +     i2c_dev = i2c_new_client_device(adap, info);
>> +     if (IS_ERR(i2c_dev)) {
>> +             dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev);
>> +             return;
>> +     }
>> +     ov05c10->i2c_dev = i2c_dev;
>> +}
>> +
>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>> +                           unsigned long action, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = container_of(nb, struct amdisp_platform, i2c_nb);
>> +     struct device *dev = data;
>> +     struct i2c_client *client;
>> +     struct i2c_adapter *adap;
>> +
>> +     switch (action) {
>> +     case BUS_NOTIFY_ADD_DEVICE:
>> +             adap = i2c_verify_adapter(dev);
>> +             if (!adap)
>> +                     break;
>> +             if (is_isp_i2c_adapter(adap))
>> +                     instantiate_isp_i2c_client(ov05c10, adap);
>> +             break;
>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>> +             client = i2c_verify_client(dev);
>> +             if (!client)
>> +                     break;
>> +
>> +             scoped_guard(mutex, &ov05c10->lock) {
>> +                     if (ov05c10->i2c_dev == client) {
>> +                             dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
>> +                             ov05c10->i2c_dev = NULL;
>> +                     }
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return NOTIFY_DONE;
>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(struct device *dev)
>> +{
>> +     struct amdisp_platform *isp_ov05c10;
>> +     int ret;
>> +
>> +     isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
>> +     if (!isp_ov05c10)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     ret = devm_mutex_init(dev, &isp_ov05c10->lock);
>> +     if (ret)
>> +             return ERR_PTR(ret);
>> +
>> +     isp_ov05c10->board_info.dev_name = "ov05c10";
>> +     strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
>> +     isp_ov05c10->board_info.addr = AMDISP_OV05C10_I2C_ADDR;
>> +
>> +     ret = software_node_register_node_group(ov05c10_nodes);
>> +     if (ret)
>> +             return ERR_PTR(ret);
>> +
>> +     isp_ov05c10->board_info.swnode = ov05c10_nodes[0];
>> +
>> +     return isp_ov05c10;
>> +}
>> +
>> +static int try_to_instantiate_i2c_client(struct device *dev, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = (struct amdisp_platform *)data;
>> +     struct i2c_adapter *adap = i2c_verify_adapter(dev);
>> +
>> +     if (!ov05c10 || !adap)
>> +             return 0;
>> +     if (!adap->owner)
>> +             return 0;
>> +
>> +     if (is_isp_i2c_adapter(adap))
>> +             instantiate_isp_i2c_client(ov05c10, adap);
>> +
>> +     return 0;
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10;
>> +     int ret;
>> +
>> +     ov05c10 = prepare_amdisp_platform(&pdev->dev);
>> +     if (IS_ERR(ov05c10))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>> +                                  "failed to prepare AMD ISP platform fwnode\n");
>> +
>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     if (ret)
>> +             goto error_unregister_sw_node;
>> +
>> +     /* check if adapter is already registered and create i2c client instance */
>> +     i2c_for_each_dev((void *)ov05c10, try_to_instantiate_i2c_client);
>> +
>> +     platform_set_drvdata(pdev, ov05c10);
>> +     return 0;
>> +
>> +error_unregister_sw_node:
>> +     software_node_unregister_node_group(ov05c10_nodes);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>> +
>> +     bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     i2c_unregister_device(ov05c10->i2c_dev);
>> +     software_node_unregister_node_group(ov05c10_nodes);
>> +}
>> +
>> +static struct platform_driver amd_isp_platform_driver = {
>> +     .driver = {
>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>> +             .acpi_match_table       = amdisp_sensor_ids,
>> +     },
>> +     .probe  = amd_isp_probe,
>> +     .remove = amd_isp_remove,
>> +};
>> +
>> +module_platform_driver(amd_isp_platform_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>> +MODULE_LICENSE("GPL");
> 
> --
> Regards,
> 
> Sakari Ailus

