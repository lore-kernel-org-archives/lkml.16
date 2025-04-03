Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7954719CC39;
	Thu,  3 Apr 2025 16:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699057; cv=fail; b=UDP8DeQVIkGAGmeYCkyrAJU0gZrW4gzccI0LVjzbgAx+BjVWK4OWmN6zCiftlAVfEu5M3MT7Hq/MvqNq0l62oOsUM8sXUUSkB595tM1iVgXz6MLWmi7D3tgVfAVtTOHhmjBCMejAJqYKve5wHxCXV0duF253V8eQi4F9JK+MMgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699057; c=relaxed/simple;
	bh=ihLiYTWOupHApM5VuQzj5J4fCaVQUeiokFQpLBA9uyI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lo8E4nRwWUOfdZV3Viuy53othqFSTB6HUtRpk8hdYQUx80CewjcvOnwz6l6sBmfwdktbruX3iIuYKATU6zIrr4MY/rTEnYUyie71+VDSNZdQydli2keduiXUCAegexJeHDCDJ5vm+2CiUYXgyKwK4S1eHRnq2vJAmEjeFvOa78k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WTNj3u6X; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WTNj3u6X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BK64xIgQtc6aKGeWe61SNkBF4HEKbMjNRuNauDAuhAGQ59oX8vRMB8drYDesUA+Dt29qsMK3e1n+RP8sGumy7rmuCSNFN1I2PXpnghnZi+ITjON4PseQZOPxDsfnDfKcHRbd8g3S5kmZ/BCt+SajuazFFI4AEF+5seQ6pJOyt8xfDQ9R8aQvP+A1SLMwEDq4hxRlcKGGWilBjSM2FhVrJPGZgx0SsflwtfZXxWk/lxwz1iaepfjGe1gqPEzUX12LmiP6NGA5yCMaRTKtecsQza01KE0/z5JolYOGwakBfYfVPXRj/ZDl/AUY/smL9q3KBCEmsvPsNCTI1tta7wWlhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ou43WsWsyyZihO+JAodzHeEzSizEuVKJN3hhpmOTP/8=;
 b=VxFthhPFhqx8XvBLH8/Yn0pMBnH53MoAB+sAQ4BrIeFZ18n/OK8TOl+YUZZepvFUqZufGxX59qOs68sdJopbCXuwzpdtaUE62rmAbINDTMXe2+c33nMeh5zeFKTxe9wLeEqCO5A48sT0NFXoN5JtozCk67uZj9Q72sN6pw6WZVgy+AUhEroMIhGdKC0kXnJQmtMViL6TfV7JZDDpAwnZvbNywZk+Uy1Pdt7C8fBD4EyHBRjOIlC5u3Tuct/JwggggoqaCfg68CwrbZta46eIB3e4WvXteLmpn/lwGHjSrQ2Bn3GONZYAcvKqr8MDbQNcIsIJLZArL+vSJ8WihqYEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou43WsWsyyZihO+JAodzHeEzSizEuVKJN3hhpmOTP/8=;
 b=WTNj3u6XGOX5y92zlyvcsoYGJ5yjBd3+C4iMYq1Iq5IQxXA0xtgCuCO57Y9G+9vq20dyfU04RvaQMLGSvomdNcssq/IOhPxCwavW4vl07diHQ/snIM7MzoUwLRbBqArmfj2GT3Y82ias2DjSLlvs/qSyFTc4aQU2FTqIT/n1DWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB8051.namprd12.prod.outlook.com (2603:10b6:510:26d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 16:50:52 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 16:50:52 +0000
Message-ID: <c3f85d86-9566-4cfb-ab1d-97e597ecc93d@amd.com>
Date: Thu, 3 Apr 2025 11:50:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: Add AMD ISP platform config for OV05C10
To: Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com
References: <20250402225658.4003616-1-pratap.nirujogi@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250402225658.4003616-1-pratap.nirujogi@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0088.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH0PR12MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: df4285f6-1ab8-4c9c-ff57-08dd72cfb1b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VU81eEpucHc2aEdTbFN0aTN5T1RENzRNWEY2VGRidG5UNm5YS04yREVpUWNm?=
 =?utf-8?B?ZzN5M2hCVUJ0OUdjTyt4THk0dmpnU3FHSkZRU3FhVmFqdUYrTnRXNFNBQlFj?=
 =?utf-8?B?YkVVbW5aNXAzSHBTd05ybGQzUWNuWGZtRkZwd3E0OVBLaWx0bEdpZ1JvaDNC?=
 =?utf-8?B?a0lydDZaTkwxaUVBbldYNnJOS042Q3p0SzlkZ0drMDFyam9Ecm15eEhKTHU1?=
 =?utf-8?B?UnJOV2lyMHJzcFlHT083bS85Nnc0ZDFnOTRNRkFuV0kzNnVWZ1V2ajAvRTdV?=
 =?utf-8?B?UHhkRFIrMEMrRHBmOWMxYzRaY2xmemtURDErQUhKOGJDSGppVWVyNEp5Y3Np?=
 =?utf-8?B?QU1RN2czRlAwMjJERkRhUkJsUkRYdHdFNk50NHk0cFQzSEV4ejVoMHlqdjVT?=
 =?utf-8?B?SGpLTmtGcWUyM29BcUlvKzhuWVFUSXYwNyt1aEVGNXVaMlRVc280V1EyZHdE?=
 =?utf-8?B?ODZrc3NQcy8rR1UyV2t1K2dwYTI1RlpFTnlzS2R6SVhSQU1YQjFJMHJMQkpH?=
 =?utf-8?B?UWFpcTlGNGFYUms1bEN6ZW5rdG9udEVHMFFkY3ZNQnJBUHVaZFpZL1VFY0l0?=
 =?utf-8?B?N0dvaEU3WlVUYjRuZkF6TTg3THdxVlBOckRUUW1PNHpWY3NFZmVleFRwdHNt?=
 =?utf-8?B?RjZ5RDJCdzFudndSWUlNSkRZQWlIN1J3c093V01DaVpUdGZvdUdJbGw0MVA3?=
 =?utf-8?B?N3BzWHIvaUg1aXJZekhYWHdZSjdtVXZDaDNlTFJTdHRDOHpYdnBTeWpDNmxY?=
 =?utf-8?B?b3FDWGJYWGI2ZlJwWlErczk0NEpTdFZ0RXpkZ2dzc0FzSnZLdi9zZzJMcDJ3?=
 =?utf-8?B?OEUrN2wyUUY2eEp4WGxpaitlVWhmV01mRnZLWStyOFFoUUFsMnJVNXZSZkty?=
 =?utf-8?B?RklvZldBT3FvSjZGNFduSHNrMnF3enl3VnVxSmt4ekVlYm5UU3lsT0VUZmor?=
 =?utf-8?B?d1FTcWpHR2IyVCtIS2Vsb3p6NWd1ZTBlZDEwTHFHOTBBOGpFemNqK3hYQUlh?=
 =?utf-8?B?QlF6WjZMQlZ3d1hzckJjNC9GZEIwZWFWdHZndlROdnVGUnRSSGpydGJ3SHRq?=
 =?utf-8?B?T21Jcnl1M2ZGK2VGcUlRVFNnM1pUWTZuVkVXUzJKNU85QWJpR1RKSncySGR2?=
 =?utf-8?B?aXQrSEs3dDQrSjIrdXBSK0djbHl4UTBXSXhMbmh1T3R6M3ZPM0twT3FhaTFN?=
 =?utf-8?B?elNPamlqT1M5MDNLTFpFNTB6S3pEMEJlRmpNZENhUGlvbW8wNmZjTkZRNWtr?=
 =?utf-8?B?bld4bTVXZHJrbjhHMXhiaFBJWXVoU3R6RTc4OTRWNnNyeHZtanNNODF3bzlS?=
 =?utf-8?B?b002enIyejduQUd1MWJ1OXVCYzVZTkJ3dUtVakR5eDcxdFRqREN1aDB3c3hq?=
 =?utf-8?B?VjNoeHlZQUkrL21GQXNxTFhLTXgzTWI0SHVpWkZiMTYwWVVoaUREVmF1UHY3?=
 =?utf-8?B?Y090TUJYTWRKMkhZdElGUTBvK1FMQlAwZXZYNHpMNHNFVmFOZ1NJRVN4MHlq?=
 =?utf-8?B?dDA2cHY3b0xjZ1d1RldnZjVKZ1VlWDNYanNnT0ZTSS9KNmVkVVF1STN2UHU5?=
 =?utf-8?B?djBITVlidVRjQk5uSlZkQUYzM2ZuYWNkSHFVRHJnbDFhR1BqM2NQNnBxdWpD?=
 =?utf-8?B?S3hyQm5ISU1MMnVtQVh6bk5aQ3dVQXNGMTJuVXZyMWRqaGM0VnQ5Mi96Z1lY?=
 =?utf-8?B?Q3pWOWZwTUhSaHV0c0ZEN0dvQkJQaFV2WmI2Zy9XN0tpMG5lTXBOM3hLejZ5?=
 =?utf-8?B?R2VET2FHME43SjdQMlU5NDlJY0Vzc0VhWXR6a0RPeWQzRi93UjhzS0pxdkl6?=
 =?utf-8?B?KzAxNkI2bkZpcWNqcURDQVM1Z24ycEpPZ0lCUVAwaTJ4VnBoemZWSk1yNG9G?=
 =?utf-8?Q?tzyV/zHxhHXQe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkxMUFU4OGZ3alFSamppNUh0emorWGFtRnN6MTlVMzRTb3ZDbGxmL2ZSYVBH?=
 =?utf-8?B?eVRNOXZobE13R240aEhNdk41SUkvWE5GQ21SL3lkQTlWSE5NVHg3a01semcz?=
 =?utf-8?B?dUVrdEpmbjI0enpkNm1xeVNmbnl1K2d0bm1adytRSG5YL01JeWc3TDcvNjZa?=
 =?utf-8?B?dmFrcEJqWWIzL3h0SE5jUmZpQm80ZnVSQVhxUkFXQzhzdEFMNk9RZ1R2eXJT?=
 =?utf-8?B?R1ZiM3UvekJTRkNlU2FTa2dBQlBjQzczalhwMUh1eFN3UWROR0JBbk1UcElW?=
 =?utf-8?B?RlU2dnhYZW85Q29nRWVZK0dKQzZkYjFsNGc2Uk4zNUJScmlZemZKbmIzVXcv?=
 =?utf-8?B?cUxMamp4dU9PSGpOTTQydDJmcEZreDREL2J0T1N3YW1MVTJkVU1JdDFvM3ov?=
 =?utf-8?B?enN1UndhRzlEamNOVTM5NjBYV08vb2Z5bk5NcGIrNzVCSGlyVmNrbk5FbkJD?=
 =?utf-8?B?TG1SNzRtQUVCQm1La0p1S2VTYllPL0NHMG5ka1BPeXRjam95WG12eVNaY1FC?=
 =?utf-8?B?aXNiM0ZPMTQ3NU1SYXBhT0RpbTlaRGFaVWg4T0dpSWhibEpiamhKcTlCNklO?=
 =?utf-8?B?UGFXOE9KVUpxV3Y1azNzdXlQdGxFQ3FpTDRLVlhaZmxrWUkyRmN3Slc5eFRx?=
 =?utf-8?B?WFY0YUJXZk82TXgzVFliMGFrNi9tYkx0RE1HUmE2OS9YeENVOU8vdmJLcVN0?=
 =?utf-8?B?RE5XdnNpd3QzbXh5NlQ5Ky9ORWVKSDV6RnpSSGUyam1PZzViL3F2QTN3aFc5?=
 =?utf-8?B?MktoeFJPQmZ0ODlYcnBqWGNzQThuWlVIYlVPNU91V0hZUmUzMTNzKytUQjJY?=
 =?utf-8?B?OUVsdXYvOGFyQXJzSTRPb1g4aGZiMjcwcHFoK0FRMDJuMG14amtlRzI0UnEw?=
 =?utf-8?B?VVJ3YzkwOWttc0E0d0ovT08zZHpYQUN2QWZ2MkJ6VXE0NHAxdlAzd1diRW1z?=
 =?utf-8?B?bXN1alZtMlQyUk5WdkNEdWJ3ajRHT20rV2d3RzRhMStWSnJqcys2c2pwcVhX?=
 =?utf-8?B?VEhUTG9RUDR4c2dHL0w5ZFRLL3FtSTRlZ09EVkxjQ1FwYnVlMHlkeDlneURU?=
 =?utf-8?B?dFNnekVPUlZOazF0bWJ6K0p6bFhKaHBwTlhwRk4vMWRlUUxNYzdaTDZOenBn?=
 =?utf-8?B?WXVneFFsVTZFalkrVGhrYk9vQ2Nrdk53dE9WYmg3Q2haeXpkSnA1OE1YTit3?=
 =?utf-8?B?UkVmNm5GdElBUDNleDhmaEp2b0Mxckx1eTlWa2cvSVJibWxIaTBIeXpCaW81?=
 =?utf-8?B?MGNDY3FYUDhZTS9iNEgySFJuRkE2R2FuOFN1b0lqMExuQ25qZnJhQTVJT0F2?=
 =?utf-8?B?bmhBUWlZdVFlSkFNSTd4cXNWOXd0SE4vQUNqRExsQXV4ODZteWFXYWFrSkdp?=
 =?utf-8?B?NElIb3VvZ2lZT1BrWWk4ZmlFZlBzYzlISitaY0FLT3hDSTExcWRYcHZvaFlu?=
 =?utf-8?B?TTNjb3lvYnM4anEvTmFVOUUzaDR4TWdGRHhtemdkVHNnYm9NbXNSWmFrb0hJ?=
 =?utf-8?B?a1hsTEtyenJmV3h4a0VZbnh1bDk4aHVLOGRxeHJQazc4S3BFTGhWUHE1RDNQ?=
 =?utf-8?B?UDdzalM3cndGOFFFbWlPajRzMlRyOWFXSG5TcUd1QklLb3VMcXBDYmpldEwz?=
 =?utf-8?B?NEFIMUVGSkVxcGtlV0hDVllEZnFDUUlCMkR1L0VuTUR5V2lBU2xNRjQwVk9h?=
 =?utf-8?B?cDZGdGU3QVVYWnlDenRzTVNUZEhabjBTL3JQaXFBVXdpVk4xa3lTZDV0OWJL?=
 =?utf-8?B?eEdDZWJ3eGs0OUdwa3RYWmR0TmorZnJrWTRBUHVydXVGbWxWK1VnU2Nxc3JL?=
 =?utf-8?B?SzdVNHVjYVVJaUlzKy9jbjUwd3hxazg0K3MrK1hsOXRRSkk4WWlmUjVRL1oy?=
 =?utf-8?B?cHJCa3dnVktuNGZoMVN1R1g2L05oSCtoSFRweWJlYityK3FsVEFveStxYmJT?=
 =?utf-8?B?QVVKRjBqNE53cHRYenNua1BIR1BWVFU1bGdSUnI0Yy9GZVp5Mlh2M2Fya1pW?=
 =?utf-8?B?cjU1SjFqbDNjZXhaUy9xUzNKU3JmOElZVjc1alpkT3l3cDhKb3FLNzkzR0NF?=
 =?utf-8?B?T0pISHdYU1luSG1SSXNpN3pCVXFwMmxjdWZ4SDVjTUdVb0lnb1JxL3VQQVpi?=
 =?utf-8?Q?2jxALdg0iVZwub3h1yxeKduo+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4285f6-1ab8-4c9c-ff57-08dd72cfb1b7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 16:50:52.3726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mu1NRe+YYViWIG4MDCKEmAt+Zdmr+579IjKxzyZDmfhOhTRtnZTNnMiKJuvdxck3df2783Txc21VtB5AE//okA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8051

On 4/2/2025 5:56 PM, Pratap Nirujogi wrote:
> ISP device specific configuration is not available in ACPI. Add
> swnode graph to configure the missing device properties for the
> OV05C10 camera device supported on amdisp platform.
> 
> Add support to create i2c-client dynamically when amdisp i2c
> adapter is available.
> 
> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>

I think you got these S-o-b wrong.  Right now this reads as it was done 
by Pratap but then Ben sent it out.  I don't think that's the intent to 
convey though.

Did you guys both work on it together?  That's what I suspect, and it 
would mean you are missing a Co-Developed-by tag and need to check the 
tag order.  I think it should be this (but double check with checkpatch 
I didn't mess it up):

C-d-b: Ben
S-o-b: Ben
S-o-b: Pratap

After fixing that and some Kconfig nits below:

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
> Changes v3 -> v4:
> 
> * Updated AMD_ISP_PLATFORM as tristate driver
> 
> * Removed initialize_ov05c10_swnode_props() and release_amdisp_swnode_props(). Its
> because page fault errors observed on accessing the variables in __initconst section
> when the driver is loaded as module instead of feature-builtin. To fix the issue moved
> all property_entry vairables outside __initconst section and also skipped
> initialize_ov05c10_swnode_props() and release_amdisp_swnode_props() as they are no longer
> required.
> 
> * Address review comments.
> 
>   drivers/platform/x86/amd/Kconfig    |  11 ++
>   drivers/platform/x86/amd/Makefile   |   1 +
>   drivers/platform/x86/amd/amd_isp4.c | 297 ++++++++++++++++++++++++++++
>   3 files changed, 309 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index c3e086ea64fc..0281c4286619 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -32,3 +32,14 @@ config AMD_WBRF
>   
>   	  This mechanism will only be activated on platforms that advertise a
>   	  need for it.
> +
> +config AMD_ISP_PLATFORM

Since the module is amd_isp4, should this maybe be CONFIG_AMD_ISP4?

That way if there is a amd_isp5 in the future the Kconfig doesn't need 
to be renamed.

> +	tristate "AMD platform with ISP4 that supports Camera sensor device"

This seems like a long description.  What do you think of:

tristate "AMD ISP4 platform driver"

> +	depends on I2C && X86_64 && ACPI && AMD_ISP4
> +	help
> +	  For AMD platform that support Image signal processor generation 4, it
> +	  is necessary to add platform specific camera sensor module board info
> +	  which includes the sensor driver device id and the i2c address.
> +

Alternate wording proposal:

Platform driver for AMD platforms containing image signal processor gen 
4. Provides camera sensor module board information to allow GPIO and V4L 
drivers to work properly.

This driver can optionally be built as module.  If so, the module
will be called amd_isp4.

> +	  This driver can also be built as a module.  If so, the module
> +	  will be called amd_isp4.
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index c6c40bdcbded..b0e284b5d497 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)		+= pmc/
>   obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>   obj-$(CONFIG_AMD_PMF)		+= pmf/
>   obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> +obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
> new file mode 100644
> index 000000000000..0b52042d92ce
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * AMD ISP platform driver for sensor i2-client instantiation
> + *
> + * Copyright 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device/bus.h>
> +#include <linux/dmi.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/init.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/units.h>
> +
> +#define AMDISP_OV05C10_I2C_ADDR		0x10
> +#define AMDISP_OV05C10_PLAT_NAME	"amdisp_ov05c10_platform"
> +#define AMDISP_OV05C10_HID		"OMNI5C10"
> +#define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
> +#define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
> +
> +/*
> + * AMD ISP platform definition to configure the device properties
> + * missing in the ACPI table.
> + */
> +struct amdisp_platform {
> +	const char *name;
> +	u8 i2c_addr;
> +	u8 max_num_swnodes;
> +	struct i2c_board_info board_info;
> +	struct i2c_client *i2c_dev;
> +	struct software_node **swnodes;
> +};
> +
> +static struct amdisp_platform *ov05c10_amdisp;
> +
> +/* Top-level OV05C10 camera node property table */
> +static const struct property_entry ov05c10_camera_props[] = {
> +	PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
> +	{ }
> +};
> +
> +/* Root AMD ISP OV05C10 camera node definition */
> +static const struct software_node camera_node = {
> +	.name = AMDISP_OV05C10_HID,
> +	.properties = ov05c10_camera_props,
> +};
> +
> +/*
> + * AMD ISP OV05C10 Ports node definition. No properties defined for
> + * ports node for OV05C10.
> + */
> +static const struct software_node ports = {
> +	.name = "ports",
> +	.parent = &camera_node,
> +};
> +
> +/*
> + * AMD ISP OV05C10 Port node definition. No properties defined for
> + * port node for OV05C10.
> + */
> +static const struct software_node port_node = {
> +	.name = "port@",
> +	.parent = &ports,
> +};
> +
> +/*
> + * Remote endpoint AMD ISP node definition. No properties defined for
> + * remote endpoint node for OV05C10.
> + */
> +static const struct software_node remote_ep_isp_node = {
> +	.name = AMDISP_OV05C10_REMOTE_EP_NAME,
> +};
> +
> +/*
> + * Remote endpoint reference for isp node included in the
> + * OV05C10 endpoint.
> + */
> +static const struct software_node_ref_args ov05c10_refs[] = {
> +	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
> +};
> +
> +/* OV05C supports one single link frequency */
> +static const u64 ov05c10_link_freqs[] = {
> +	925 * HZ_PER_MHZ,
> +};
> +
> +/* OV05C supports only 2-lane configuration */
> +static const u32 ov05c10_data_lanes[] = {
> +	1,
> +	2,
> +};
> +
> +/* OV05C10 endpoint node properties table */
> +static const struct property_entry ov05c10_endpoint_props[] = {
> +	PROPERTY_ENTRY_U32("bus-type", 4),
> +	PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
> +				     ARRAY_SIZE(ov05c10_data_lanes)),
> +	PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
> +				     ARRAY_SIZE(ov05c10_link_freqs)),
> +	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
> +	{ }
> +};
> +
> +/* AMD ISP endpoint node definition */
> +static const struct software_node endpoint_node = {
> +	.name = "endpoint",
> +	.parent = &port_node,
> +	.properties = ov05c10_endpoint_props,
> +};
> +
> +/*
> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
> + * fixed to align with the structure that v4l2 expects for successful
> + * endpoint fwnode parsing.
> + *
> + * It is only the node property_entries that will vary for each platform
> + * supporting different sensor modules.
> + */
> +#define NUM_SW_NODES 5
> +
> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
> +	&camera_node,
> +	&ports,
> +	&port_node,
> +	&endpoint_node,
> +	&remote_ep_isp_node,
> +	NULL
> +};
> +
> +/* OV05C10 specific AMD ISP platform configuration */
> +static const struct amdisp_platform amdisp_ov05c10_platform_config = {
> +	.name = AMDISP_OV05C10_PLAT_NAME,
> +	.board_info = {
> +		.dev_name = "ov05c10",
> +		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
> +	},
> +	.i2c_addr = AMDISP_OV05C10_I2C_ADDR,
> +	.max_num_swnodes = NUM_SW_NODES,
> +	.swnodes = (struct software_node **)ov05c10_nodes,
> +};
> +
> +static const struct acpi_device_id amdisp_sensor_ids[] = {
> +	{ AMDISP_OV05C10_HID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> +
> +static bool is_isp_i2c_adapter(struct i2c_adapter *adap)
> +{
> +	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
> +}
> +
> +static void instantiate_isp_i2c_client(struct i2c_adapter *adap)
> +{
> +	struct i2c_board_info *info = &ov05c10_amdisp->board_info;
> +	struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
> +
> +	if (i2c_dev)
> +		return;
> +
> +	if (!info->addr) {
> +		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n",
> +			ov05c10_amdisp->i2c_addr);
> +		return;
> +	}
> +
> +	i2c_dev = i2c_new_client_device(adap, info);
> +	if (IS_ERR(i2c_dev)) {
> +		dev_err(&adap->dev, "error %pe registering isp i2c_client\n",
> +			i2c_dev);
> +		i2c_dev = NULL;
> +	} else {
> +		dev_dbg(&adap->dev, "registered amdisp i2c_client on address 0x%02x\n",
> +			info->addr);
> +	}
> +	i2c_put_adapter(adap);
> +}
> +
> +static int isp_i2c_bus_notify(struct notifier_block *nb,
> +			      unsigned long action, void *data)
> +{
> +	struct device *dev = data;
> +	struct i2c_client *client;
> +	struct i2c_adapter *adap;
> +	struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_ADD_DEVICE:
> +		adap = i2c_verify_adapter(dev);
> +		if (!adap)
> +			break;
> +		if (is_isp_i2c_adapter(adap))
> +			instantiate_isp_i2c_client(adap);
> +		break;
> +	case BUS_NOTIFY_REMOVED_DEVICE:
> +		client = i2c_verify_client(dev);
> +		if (!client)
> +			break;
> +		if (i2c_dev == client) {
> +			dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
> +			i2c_dev = NULL;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block isp_i2c_nb = { .notifier_call = isp_i2c_bus_notify };
> +
> +static struct amdisp_platform *prepare_amdisp_platform(const struct amdisp_platform *src)
> +{
> +	struct amdisp_platform *isp_ov05c10;
> +	const struct software_node **sw_nodes;
> +	const struct software_node *sw_node;
> +	struct i2c_board_info *info;
> +	int ret;
> +
> +	isp_ov05c10 = kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
> +	if (!isp_ov05c10)
> +		return ERR_PTR(-ENOMEM);
> +
> +	info = &isp_ov05c10->board_info;
> +
> +	sw_nodes = (const struct software_node **)src->swnodes;
> +	ret = software_node_register_node_group(sw_nodes);
> +	if (ret)
> +		goto error_unregister_sw_node;
> +
> +	sw_node = (const struct software_node *)src->swnodes[0];
> +	info->fwnode = software_node_fwnode(sw_node);
> +	if (IS_ERR(info->fwnode)) {
> +		ret = PTR_ERR(info->fwnode);
> +		goto error_unregister_sw_node;
> +	}
> +
> +	return isp_ov05c10;
> +
> +error_unregister_sw_node:
> +	software_node_unregister_node_group(sw_nodes);
> +	kfree(isp_ov05c10);
> +	return ERR_PTR(ret);
> +}
> +
> +static int amd_isp_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ov05c10_amdisp = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
> +	if (IS_ERR(ov05c10_amdisp)) {
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10_amdisp),
> +				     "failed to prepare amdisp platform fw node\n");
> +	}
> +
> +	ret = bus_register_notifier(&i2c_bus_type, &isp_i2c_nb);
> +	if (ret)
> +		goto error_free_platform;
> +
> +	return ret;
> +
> +error_free_platform:
> +	kfree(ov05c10_amdisp);
> +	return ret;
> +}
> +
> +static void amd_isp_remove(struct platform_device *pdev)
> +{
> +	bus_unregister_notifier(&i2c_bus_type, &isp_i2c_nb);
> +	i2c_unregister_device(ov05c10_amdisp->i2c_dev);
> +	software_node_unregister_node_group((const struct software_node **)
> +					    ov05c10_amdisp->swnodes);
> +	kfree(ov05c10_amdisp);
> +}
> +
> +static struct platform_driver amd_isp_platform_driver = {
> +	.driver	= {
> +		.name			= AMD_ISP_PLAT_DRV_NAME,
> +		.acpi_match_table	= amdisp_sensor_ids,
> +	},
> +	.probe	= amd_isp_probe,
> +	.remove	= amd_isp_remove,
> +};
> +
> +module_platform_driver(amd_isp_platform_driver);
> +
> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
> +MODULE_LICENSE("GPL");

