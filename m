Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7B13CA9C;
	Wed, 14 May 2025 17:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747243192; cv=fail; b=r8u4BlYu6zsOlpIp+SIejAsckdm8xRbc/QDnOLQYfb0bcnGH75qu6QnZ1vxN6v9UEjf8RS3bv5A7yTjzXnSfpVq6UJsPsfVcXjhvUw5z1xDgFZFIvC0Y0aU6qiN/qXspAfWEAxFyXz9SwG5oZxejEJ/YmywgD/qVGu32/ioOapk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747243192; c=relaxed/simple;
	bh=C9HbCRaO1fkUglOBns6QDmeYsAYcePJWBkjkH7+kxBM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CIW1pB8Q5EMF7i6aQP3bNOHTeEVVKPMM+eYGPzTQO33OlsFfgnxEgizbvVK24ZrdtzZ/Pk0tPD0ia62GEHfix90pb/akmd2Xa1AIpKuCKduWAYvlGYQPeL7dG/Gt/INz+166iFOd+Sv4I3Qfa1JNjrR1Tnm94bgB6CL1oap4jkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CXf3+xXL; arc=fail smtp.client-ip=40.107.243.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CXf3+xXL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPaS4ddfieL4fgB9LhIGkcoDJ/0MmNmFfyrTas/V6BHHGY2IGaaV+jU17VHntRDf4eGaCnsOiwCaVUFy80EwBCkxvV+NphyIdkGsthcIZBUQZbn5EMPKSpQf922PJk+L98wschpwq1qybFuT6WEgQnbbhcaaktoXwJqZ10q8e6xckiUJR614aA9jb+2PyPVtDNU/pcyEq/lZTP+YEn8XNAS+VqtNcqdp1DxMnoyWYjp/GOWepBLjEWJ1LnfhMD7hgoPadgOgvF6xtkf2/1RnnTNsERlqsVbtUAHfkvf648cEQMSN2Yym/mWicyHSh4ocUIKDzIzcXgRZAmJoUIqbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0jR3LpBlyyIcictpgizIWsmBwaBhj1C5K0tiZa0pDc=;
 b=iXDG6nkNu8DAK1FYahMXvVbvRRMU+oB9wjy0Msg/YbULAcT96rQ4GU1lcCUZlm4RQtBJTF4pwKROnX1/pDcGVdGlwbsUx9cpBLPnf88BoYL+JHJ8bGTqJyEQH1aeHRxEC5BsXaqMK70+LBD85ex5IIOqnev8GnXPBS4WelmupH9WuLpxgtrl/f7NEY3NwP0ieXItjB2E6SeuLpFS651NLRQfPqkMX4x7q86TBVniPSABP4TU1rt8PUPZ2mqGwsD0AYgchbVVD1mapU2gXQkA6xRuwxRkiriQ3j3Mlpb6Jz3hcpdI4lSoNVExkz4QM6UM3GDfAh37IagEiOx3Z5e9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0jR3LpBlyyIcictpgizIWsmBwaBhj1C5K0tiZa0pDc=;
 b=CXf3+xXLe5jRcayGK2o9So+uJmjWxicE2opvNgJ6PoGNSlyFO10jlEDMEMpcLrDgD6CfZjuMGRk0jrhYSl06i2uo2fr0ufSaAnAkK4SU7WHrw8SsYNObcKxyyS1NVWFvXSU5vQ//3KHemx3tyFv9VE2azp/6m/Uo4CYK3IUJyv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 MN0PR12MB6343.namprd12.prod.outlook.com (2603:10b6:208:3c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 17:19:47 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 17:19:46 +0000
Message-ID: <80008a56-f410-4186-8bb6-7794aa066d0e@amd.com>
Date: Wed, 14 May 2025 13:19:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: ALOK TIWARI <alok.a.tiwari@oracle.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, W_Armin@gmx.de, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250512213711.3226784-1-pratap.nirujogi@amd.com>
 <aece6449-8acd-41ae-bed6-fe5cc7d64050@oracle.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <aece6449-8acd-41ae-bed6-fe5cc7d64050@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0223.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::15) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|MN0PR12MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: fadb52e0-824c-4450-99ba-08dd930b8616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmtzdlhLb05VckJQYXhEZyt1MG1DU3NUbGJTaGRidE9kaWx4aFhQQkVGUG1S?=
 =?utf-8?B?bWFpVHNzdVVXNWRDYlZVcC9tU3QxcHNPcDNCSHVJdVJKaFdjTjRraGVTdTVL?=
 =?utf-8?B?c1YzUzdUZVNWV0tjM2EzejFJdmw2dHhjMGZOKzJTazZXUmtYWVk1ZTgxeVE1?=
 =?utf-8?B?NzJMUUdFUEcyYjJxYXFzVWR3REdxS3JoSGR3Qld1dDlCQ3p3MUpZa3dGNDJt?=
 =?utf-8?B?WXFOVm1VdVpWckhySEh1ZEhGbllWeWk4NjRNOGs3VnVnd3kvOUhrd0NEK3Q3?=
 =?utf-8?B?ZDl3UlZPaHpURkp4R1k3Wk1jQ0gvaGtab0pNWUpRcmtuLzJxd3JwT1M1MlU2?=
 =?utf-8?B?djZZanVnS2F1YzJ3QXlyY1NjU3hlL1NKQVhtQkFHekJPUFdMNmZxWlB1enRM?=
 =?utf-8?B?TXdtbkE2OVRiZFBCNlBNQW1rSHo4aEpDcFEzUVJyNGtIRm55a0ZDMElzaVB5?=
 =?utf-8?B?Q0JEbWRYbG5rVndyZ2xsdWFkYlVLM2s3NWNjT2hVbkVhMmZ0akNRMTZoTHdI?=
 =?utf-8?B?T0hiZHNiTU5FUkFrTzNuYWluVDRFdXRyWml3MmNWdGF3WUs3QkF5cURlYWdn?=
 =?utf-8?B?ZDdVRlZmYmxLbVNpbUU5OXYwU3o0RjlVdjZzamlJMzFyVTUwTGE2SWxOemFh?=
 =?utf-8?B?bjhYR1MycklsMnluZnlCL3lwWTRmR1V1c3lMMkkyY09GUlBpSGxFNWVpd0V0?=
 =?utf-8?B?Sjd3ZjZVRlVmM21CYmFpVWZSajR5TGJ2OEM1a29yazBUQ1V5T1d6R1hVT2Z3?=
 =?utf-8?B?RVloTjhsUWlzV010S1lTQ2p3c3U3akZmN0xheHFqU0ZjMUQ3SzNadTdMYmd5?=
 =?utf-8?B?K0V4SVRWRmZTM3pUSzI5WVFZSVlhWXp5aDVxSUp5L2ViaWhtNmdMdlF2Q2JW?=
 =?utf-8?B?VjhlV1gyU0JnQmt5eExzcWNQVmVkc3hGQUdmalc2ZytsT0ZQSEthZVpFVGJx?=
 =?utf-8?B?bnFiOENiUFIvdzJ4QVQ1SlJnSlZFc2ZmTE5WeTB0RHNvd2dIOHRSZ01rRlBs?=
 =?utf-8?B?Q3Uwei9Qd2lMOUpwQjVwMFlMTXNLcWl4VEZsYjlTbkh5eHVDVXJpam04YzdH?=
 =?utf-8?B?dlVXaFpDWXN2T2NPeHlNMjM0RlJMU2pFbll5L1oxR2k1M3ZVMEV4V3RtaldS?=
 =?utf-8?B?SXVjVWsxOWI3VUFScmVlektlME40VWJ6LzIwNmZKKzZhdlBSa0E0eW9YelQ1?=
 =?utf-8?B?SnlOK21YdnpzSXdBaEt0dk1lOUdmQXlKejRnWnlwTGtyMDhJN2k0V0hqNWd5?=
 =?utf-8?B?KzNISXI4ZFpIM3NIdHlnQmZKM0EwK2pKcDRrKzBjTktCVTM0OFVjMFZJZWdE?=
 =?utf-8?B?VE92S0RJKy8wK3doajJ5WnhTNEZ6M20yc3Q0TUY5TG9rOXlYZ1RDTXEzbC9r?=
 =?utf-8?B?dFlGZXBFeENTc1JreDVIMlh5bnlJc2lrcHcyT1p4Rm9Hc3RtVklPOEpKejVH?=
 =?utf-8?B?MU04UmZYZE1QYWRoWXNEVWdKRERIOGlvVU1QQU1TNExuT1ZLZ3dDSStqL2Ux?=
 =?utf-8?B?QmUzNVZ4OHJ0ZXYxRlJjaklOV2s4TTNnU0szelpiY04vVjdPdVIrN0ZqWU1W?=
 =?utf-8?B?QzRyVVBkNy9NWG45OWl5cWFXQ3d6em5sT05sT3JaTmYrQmVFbnB2eGxZNHJD?=
 =?utf-8?B?ZFlrWXJEbk1jVEc0QmR2eWdpTlgzamtKRTdvSDg0YlZ5YWdiY0Z3T2dZRmF1?=
 =?utf-8?B?YXJiS1ovblRTYVIyQW10Y0ZhcTBJL1MwQnhQYXJxVWovRnExOGNpTDhFVDZ1?=
 =?utf-8?B?cGpyV2EwSFRaVHljbXBkc002N0VIMjg1M0FHY3M0a3ptN0pSbEVQWWFiQ1Rq?=
 =?utf-8?B?NGZ1T0c0b01EdXBOa3I4VG1UdFlPaWVZL0IxaGU5N0ZZelJ1RElTZUlsWnds?=
 =?utf-8?B?QlV6TmMwdlFrelZUdTRDUTJiMTFoODFIMDE1YzFRVU5qc2tyR3FlaG5oaXVE?=
 =?utf-8?Q?kXSCG/pDsCo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REhyVnUraTJxYWNDY1IvM3IxOVkveGNYUFdTd3MrMnBFUzE2ODZWZlpGVDFW?=
 =?utf-8?B?eUFxNFE3OS9xYjZvdm93ZzNMaDc4b2dGYWppNS9FMFEyT2I4WFZnRDQ5U09H?=
 =?utf-8?B?a0hoZVRUd0d2Q0kyV1pjZUlLZTVCS0dQNlNoVnJ4OWY3SVVucXd5NmpGdHpW?=
 =?utf-8?B?aU5kSnE2SGlVUE9GZmg4cUNsUWtyT1V6OVltWGZubEZ2ZVRMb3RqdFc5NFV5?=
 =?utf-8?B?YVRxdU9XVlYxQ0h3Ujd4OTB3eWhaMXArVjhhdzJqRlNoN2IzUG9hRExyY2JC?=
 =?utf-8?B?TEwyVHBKaURQOStnYTFZSmhXa3ZUYmpxSlc2OEgwZU4zM003VTBpTzZibWp0?=
 =?utf-8?B?WXdzVmg2Y2pUaExuNjd3TmZIbXdjR01FRjVza1kyVUVrenFJaVJqZ3dkSm4r?=
 =?utf-8?B?eVV3UXlBbCsxWEFSNENzck5WL2tUNUV5bDlHdEZjbXc3N2IxenNMbkZRM214?=
 =?utf-8?B?T3BIdW81OFNIbk83UjZwWjNyRGlWSGttckZZcmtldU9XK3VhYXNDV0VBRXB0?=
 =?utf-8?B?WVlZdW1zdUdCblozQksyNHFaUUl6ajllc2RjSzBlVzByNWx5Nnk4WVFDUmdP?=
 =?utf-8?B?Zm9hSFljL1VKYkNsSWJtOUxDMGozNjFtYVJHMUdsZFptOW53UDBIbG5JRGQx?=
 =?utf-8?B?cXlnWlZURmozdnJCWmc2VlpqaVc3dmVkSkVXNDdLbHdHeVFhNTk3akVwTmNT?=
 =?utf-8?B?eFBLT0ZQS0F0b0dVUmhZUmYxWVNkMG8xTEhhR1Q5YjlBVWFwNDNLaVVqOWpr?=
 =?utf-8?B?eDhmckNhdnRhMXg1cDYyT3I4NGttOGNnWDRFbDI2L1RwUnNRZEd0TFpmeWJJ?=
 =?utf-8?B?OTBYZlFSTU9lMXBiMEg3dnY0Y2Z5Nm5tb291RFJJWXY2aExlZkdxUWVKMC8r?=
 =?utf-8?B?cUpGdXdtT2pLTFQ2UVVZOXFLMDFXOFZZc3FWVFVmOHMrNXlBMnlwVXlnTERM?=
 =?utf-8?B?MjUwdU9sUjFxN1dzNXdSdUlPdUtySUtNK0VZZjNuT1hNSFg4ZmQxSGhFSkY1?=
 =?utf-8?B?dWJjL3FPQ01USk8rOGhFQVVoSC85TVdJb1FreXlkbVNDNTlIRmUrR1MxdzRI?=
 =?utf-8?B?YVV5YlJZeEhlSEQ4TE5oY1FTNCsxbFZwNC9VRzBuY00ybWl4TUJiRXQrV1Zr?=
 =?utf-8?B?ZFBkczRFcWxPSkptYW9Wdkg3YmhORmFuQk5vbXFGT3p6RGZ1K2RDcjcwdDRB?=
 =?utf-8?B?a0g2VTVHUVF6QlpVbjA4M2JrQzJtYmJCemc3NnJoU2RkN1pzd21iL2JPZGxP?=
 =?utf-8?B?cUU1aW5XaU1rWHljMnh4b2xiQTEvQWdnV2xZaWYzOTliSit0S2xjeWZYU2xy?=
 =?utf-8?B?Q205Z2dVZDlubzAzV2xKSVRiN1h3cGhDajNjRGd6UlEzalhmTWRSNFBYeElk?=
 =?utf-8?B?ekc2TkRXYWNGZDlxTUFVaUwzcmRTNEVqck9XQW42ZmNMQ3FzTkl2MXNuaEl2?=
 =?utf-8?B?bDdXdnV2WVFleVhLRkM4OG15NlVyYWNoNjV0eEZUaFBsS0JwK3F4WWF1QlBL?=
 =?utf-8?B?RmJ3N1ZPdWZ0dS9ESGRkck5rUWx0b2RwazcrbGNoa2JZZEMwUCt6RGl1V2Zn?=
 =?utf-8?B?SVp3NVhMZmdlUXp2bGZNRXhTMkZuR0VIVGRWVGpjYmRSTW02ZXFab2R1bi9s?=
 =?utf-8?B?NG9OdGszNzJmMmNKbFRtVElVdlNPTVdIdGhGNGJWWEpqalQrMm4wdmQybkpL?=
 =?utf-8?B?M0pSdWpsQStxeFhEUE9oYnVvSFZQVjJYTVhrSUl3Y3QyZFQ4NnExYzluY3lE?=
 =?utf-8?B?ZjlHSDZWZGZoNUQ0d0E1ZW1NT1dsS2lDMDlwTHBFc0krV2ErSnp0eGd2UlJ3?=
 =?utf-8?B?ZjhLa0kveHpSYko1K0dIUUxvMnRHUnNQcG0zZU1VM0oyNUxNTnRCVXg1cmM4?=
 =?utf-8?B?TGRtZFFzSjVQbVJmM2xNZzh5V1kzMUdLa24zY092a09XSG8rVEp2Q0Zjek9O?=
 =?utf-8?B?NnBrM0Y3N3JoSHZiTFhlY0VqWFdPQk53V3JKdnYrS3pENWZYUlFKbDlNRG5G?=
 =?utf-8?B?cW5Ub1p6ZWQ4S01BWDV1b0c0NjYzWFhRUzRodTdQb3NwUksxRWdiVk80NGQv?=
 =?utf-8?B?a1I0NVBHYml1Nk8rbUN5c2hhNTRDWE9ua1J5cDVscUZkZWdpWTcvZUw3b094?=
 =?utf-8?Q?vnnKJ3/xHsUQs0apfzgE7l+Mz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fadb52e0-824c-4450-99ba-08dd930b8616
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 17:19:46.3493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJc4FoVcvV9pDeNU0tm6QB5mG2bqZfzLosU/+TvuFGd/gyORHNhfrRyGiUhFyMct8BykXQ+qQFHxmlOqmZfVwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6343

Hi Alok,

On 5/14/2025 4:34 AM, ALOK TIWARI wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
>> +config AMD_ISP_PLATFORM
>> +     tristate "AMD ISP4 platform driver"
>> +     depends on I2C && X86_64 && ACPI
>> +     help
>> +       Platform driver for AMD platforms containing image signal 
>> processor
>> +       gen 4. Provides camera sensor module board information to allow
>> +       sensor and V4L drivers to work properly.
>> +
>> +       This driver can also be built as a module.  If so, the module
> 
> remove extra '' before If
> 
sure, will remove the extra space.

> [clip]
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
> 
> OV05C -> OV05C10
> 
ok, will fix it in next patch v15.

Thanks,
Pratap

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
> [clip]
> 
> 
> Thanks,
> Alok
> 
> 
> 

