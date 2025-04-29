Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B302A242D80;
	Tue, 29 Apr 2025 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745955018; cv=fail; b=eyZajnbJ1UNAi7AuuA7iyQ/pJEFR+RpAE1SStEpFJJjxLwhOth8qBeHMOoeEKuCkvsSc7aO4GtMVoNtJKevsH4twTb9lC558cvxRDfGZ9Cz+0mCkQ9JKKxFbJb/pEJTtqXL2/Ijjyu2a4QQ+UdxvZBw0PqJOvg6ChyduE68RKJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745955018; c=relaxed/simple;
	bh=E9KsC5Ebn/pBTDFi6yq+XtxuflVOEAK8EV1g2YLVOos=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TRMyGcRmc0W4bilV8v3h8N5WHWQ974C5oBjGzHWJUlYeazOZy3yH3MuIWeAPjT1GB644XCf78Yb1yICL2on/klLkAfsGvgYHcUOFqJs7tjUDBiUKxoot6aekMsX2Y7uDJ5N+rJ3R4+ccqYkCYtVZbET+3NBzz4aV9Nl1Ox7XPHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eMiXZ7I2; arc=fail smtp.client-ip=40.107.93.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eMiXZ7I2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCha0K3upcFDlX1iv1T2jjV6egS7mbYBbo8+aGpvPtdjtAt7aH5kVyXLK6WDjS3EYT06I9HOsndRayvYJJK4fqL7LTg7dquqD0uayqHHGLMK/jEcwznNm0dZFqFOLVsJemQa5IxbgR2SVqoC3tFbzzJ33nDJ4n+GnQhsHUvGRvTRBc+mH1RB9CtLKormH0JRvbZrNxozoxD0zXWHbHN7Alk5pIiS/O2pspONEozJPC6ae0qYnSimoFkHMYzyGY34FYTBhpfwfi74Fxu6vZw6rkxK8nsNgLnMmA/gSg2kf7ukN4OdGKoH9w4eot7Ji3Z6nYJuVtxkGqVAbPWPuyjp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypd/FHCNKav+Lz1jne/MGO++0P/SDdDXkXC0M30QsSo=;
 b=e41awslMkb9FJkPXcLPNszado5XKFrPB/vvVzwgo2bLPSRcP3EMUde+WxNAwW8I0v57FR1jumoP/GzGD/w0R4VfCuhyoZE3d4qyDJaEk66u4tumHtQaZrO2nm6T31dmp6yRPi24rCUW5ZnnWGDTo9JvyrfbyX6HqpFFLjpzSaZ+jP6QCmo7BoNLbAfVwfTfqrHNCdmZnFkLqUDL3qjBP7GFmMif0ZG+0/aC/arLvKZdlagTBbdT6Ql7c0NsXJYukKaRynKuO880fE2bxsd79O12HVl419A13DArQ6CQ6T+MwexgBoBAa7yFf7E33fwT1pGLcsRY7POFVm3TbzsC9GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypd/FHCNKav+Lz1jne/MGO++0P/SDdDXkXC0M30QsSo=;
 b=eMiXZ7I2raTt0UBIz33I4XO9IHQyE+gK6l1eOSC4b39DTNXby9j5EtWzmgC8UA/rlzpHZ6h8NLy68OW3e4rGXuOJGe4FPSsPOTjDTsmJSDhvdJxneNbj7LwwN2M6X2t3g4H9ydWGKDarmSGT/LOroELV50uIMNOpQI5QLIMC6WA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8562.namprd12.prod.outlook.com (2603:10b6:8:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.32; Tue, 29 Apr
 2025 19:30:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 19:30:12 +0000
Message-ID: <911a1642-2cd9-4619-b409-6df8aae82ca9@amd.com>
Date: Tue, 29 Apr 2025 14:30:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] platform/x86: Add AMD ISP platform config for OV05C10
To: "Nirujogi, Pratap" <pnirujog@amd.com>, Armin Wolf <W_Armin@gmx.de>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250417182923.1836092-1-pratap.nirujogi@amd.com>
 <b6701589-4aa9-4988-8b28-4b0ae60daa43@gmx.de>
 <7d17ec49-e075-4b04-ab00-3eeabf58c4f2@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <7d17ec49-e075-4b04-ab00-3eeabf58c4f2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0092.namprd11.prod.outlook.com
 (2603:10b6:806:d1::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a4bcaa-94f0-4a54-eccf-08dd875442e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RERZamZtVDkzQ0FjbTk5MHQ0V1cxN0JQRWtTZS9xYmhBUWxtc3pxMzB0MXc3?=
 =?utf-8?B?Nlczc2syYlZJR0ZtaWpYcG9ZSEkvTTJmaXBQZ0dVeWdkTnMveU54VVZ2eUpu?=
 =?utf-8?B?U1U3MlNTZ2R2eW5yMzJDYWhLQ1RYMmxjUDg0WnI3Rmk4UUZCMUFUY1lhNDhU?=
 =?utf-8?B?SUZBQVc3cTRkR1I4T0RwZGZWaTFvaVRoSUpoODJCMmk4ck5DdENtZTdlT2oz?=
 =?utf-8?B?U1VKT25vODVueXNTakt1OVFMNEdkL0JpZ0FBS0wxaU5wWFgvd1ZPRkR2U1pj?=
 =?utf-8?B?QTR4SjlJZ09uZitZenkrOFpubnlPa3Nna0hCZXoxTHE2NHFSSzRtM0EzUWRk?=
 =?utf-8?B?RXdHZFpmVmd5RkM0dTRXcm5CaUYwb1RoWE5QNnZJSll6SnEzcnVFUTYxZHRG?=
 =?utf-8?B?YzdDbGdteUtoVWhrVEt2L3RkK3hYb1lIeC9XSiswYWNUcm5udnJnZS96K0Zy?=
 =?utf-8?B?TXBKOURJa0Nzc3hzWTFLclM0cks2dWF3RmU1cVZxRWpvcVNJWUU3anhJcEtP?=
 =?utf-8?B?enhKTjExbkdCUnEzOGk1azkvbitqbjA2THBDcXY4K2MvZ3VYbDVIdzlXUElj?=
 =?utf-8?B?d3cyODNZNGh6OWVaQlJQVlF5ajErYUF2czcvVGhXQTRtOW9HSWxLNUJ2bEdZ?=
 =?utf-8?B?b1FNT29PSnJEZHlESHU4Q2ZKRC92RCs5Y05kaUl0MU9MaXI5RXE5QW1rVnZw?=
 =?utf-8?B?ZFNqOURFd2lKdTRyVXpHMDRJVVRHSTY0aS9IVEVmSWwxckpJNjZKNVRYUGRQ?=
 =?utf-8?B?VTdKN0hFMFdFalNMMjFod0dZQWRrV3VNbThxdDhMRXVaWmlJcEFERWJOSTQw?=
 =?utf-8?B?YXFTRnRpd0IxdVkwSFgrZWs5NkNHYmx0dEZWck9TN0pjdXNjNEsrSEFjem5N?=
 =?utf-8?B?bTAwcVErSXNkT2E1cDRrcUFXVjgwMlR0R0tzWHJ6Qk9jdVdjdVpSS1JRRitz?=
 =?utf-8?B?L0lHNVNvTjJEb0I0Q0w1T1htckowdDVieFhWQXVteEhkcTlxRG9INDUybitU?=
 =?utf-8?B?b0NhOEdFb1cvYSs3S0ZpWGNPeEpMeVhyczVEVHQ5QmN3alZBWStsUlJXRVJF?=
 =?utf-8?B?bi9WbmVOZ25EWkJWRU5FZHJVRWphUlZsbDlzUnNKM0xieHUxRWkxTFh1dVNH?=
 =?utf-8?B?cWx3WTRGTW95MW9uSHV6UGJCYnBwWlpPOU05VHgwL2d6R29lR2JEcmpORVll?=
 =?utf-8?B?dnlqdFVhQWdsRHA3eDhTMFpnVWlweWh6VWpwNUI1cGgxS2VoME9uR2VNQnJ6?=
 =?utf-8?B?OWc1L3h3QUhJRG5qMFQzWnFUa0Z0TXlLa0xuZVpEajBMY21RR09UWkxGdVZx?=
 =?utf-8?B?c3hmVFZueEx4L0U4cjMvV0dMTko5RWkrTTZJbHJxbDBoVVJLbUxlTWhnRDhD?=
 =?utf-8?B?WEUyVWx1S3lZdEZDUVBic0lNUGVEaGVYSWtkU2h4TGlhY1JyemhWTW02cUUy?=
 =?utf-8?B?VkhuWmk1TFd6YnhpWTd0UWROMXV4bkZueEErWWxDemgwSzFXQXByYlRKWG5D?=
 =?utf-8?B?cGpXdkpZUFZ4U1NrMC9sWnYvREtkOW10SGlwWXBWUms0eTl0eGdUOUoyajN0?=
 =?utf-8?B?NGU0VnlOSHJDN1poWnc4Rkl1WEkvU1JiU1NCTVRnNkRkcTNpZlZ5RVFEM2Jq?=
 =?utf-8?B?V25HWW9pNVFTZENJNTVSbzJnODlaVkJrRVZqWGsvOUIzOTQ2ZG9mN3RDdDlF?=
 =?utf-8?B?dzI3dldYKytzd3J5NmQrdjJFK0YxaHN1eUdKYWVqZFB5aHd4YTJrNGhPNG91?=
 =?utf-8?B?ODQ3OEZkTWtROHV2STQxREZyemV3MHM4RzFkWTZ3bXB4UGxuMXQya0hlcDdt?=
 =?utf-8?B?bDhDT3lMaml2SlkyZUc2aDFBK0I3aUVlVTc3N096MlZVVm5XemdUTXdreUdx?=
 =?utf-8?B?QjJPMWxrdkpIemJ1R3llWlBxaTRaajFhdUxjSkV3TXNBMmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3djQzVXYXAwT01WbG1xeHdzZnA4ZnNaLzFJQ0I3blNxdzNIV0p0OFloVlVO?=
 =?utf-8?B?UmNvN0svUjdwb0V5QmtqMnFLZ1BlbTlTV0pzaHBPY0d1S3g2dGQzc29VaDZt?=
 =?utf-8?B?VFVTaE5TNlVreHFXOFowTlVLQnEvdDZnMUFyVm5rTG8vTkdFcENmUm1ST2dV?=
 =?utf-8?B?NXdIZVIzcFhrRWM4VDBtZytvTmkxY25MVlJXTmpqUEdmVTdvV2FIeXMzajcz?=
 =?utf-8?B?b01kOC9JQXdLaDYyRklNNDNUZ3RJVS93UllUOEdDSU84QlJ5eW85dlhaUkpU?=
 =?utf-8?B?WUtxTUNXcGE3YVNLVW0vd3JJaC9XNU9pMjZYZm50TFFFRkNVN25JaUw0aEpI?=
 =?utf-8?B?VEdSUDMrUUpuMlVKUnJQNzh1WE5tUGgrMGFFbVhIZUR0Vm1EYXN3RUNCL3M0?=
 =?utf-8?B?cVd2cUpYeks3ODJEa2E1d0dLNEFOaVVzbngyWnhJZVBlY3R4eGlUV1FId2tU?=
 =?utf-8?B?anRQVnAwcDhYV0ZoVjBFQmJrYVFuVnZ3aG1lUWtIbG1RRWIrTHFBVE8rMmNU?=
 =?utf-8?B?djlHazNKZXhQRHB2aTZSM015OVczVDlJV2J6S0RyUUh0akVGNjFFdVF4aWx1?=
 =?utf-8?B?ODlJS1RsalFKNFZXaEZRK3hESkpZU3lONXpQWU5CZWhFclRkbUpEU2VjZ29G?=
 =?utf-8?B?TGpOZ1QvekJPczdZbTJDcTFiWHlzWVhrVHY5SVdIQk50QW9RN2pla2cxRWpO?=
 =?utf-8?B?T1lrdDhndTcrcGtyVHd2Rlp5TzNFc0JCY2RPUk0xL2tjcGNvUGVHcWFCS0xs?=
 =?utf-8?B?aks2Ym13cFRzbERRM084K0VwSkhLbkVnMExzTi9QeVpjMTBTMS9aS2lzYjZN?=
 =?utf-8?B?Sk5Wenc0b0hsbHNaVjBIQW9QU2ZaMThDV3RaZU1pZXFGK21VMWd3MUFMRTJH?=
 =?utf-8?B?NHgreUNuMjZVSWdSYVBCZmpBNFRObUhURG5yYUlxOUZDRWtXM2JnNGhMR1pQ?=
 =?utf-8?B?dmpMeHFYY1M2N2NBd21ScVZGMldsMXJub0cxTEFvUTZ5RG9VeTEyNU9HcDBQ?=
 =?utf-8?B?MHMxUU9Lc1p1ZUV5d1ZtM0p5UnRYREFrMEpVL3cxVHFiekJkekU1QkEwZFU4?=
 =?utf-8?B?dkJDcXFWbkg0cVZKUjdWV0VUd2l0alFPaHd5WHExa1dES1h6SnhzajVGeHR3?=
 =?utf-8?B?YmlyOHpnQVRvdVc0WjZ5SFRZKzZobE5wZmpyYUlsRjZLQmkvQWlqN29wVkFE?=
 =?utf-8?B?T2FjdTV2S3ErUlVoZW5PbVQ3UHNNZHVEVFBweWUwUms4bmZabUJ3ZGVoWEQz?=
 =?utf-8?B?R0VobU1xV2lIeS9Ic1FJMFo1RmMrVlVRaXVJOFlKWmRFMEVCTm9zaXZVWFkr?=
 =?utf-8?B?WmViV3pqUnM1SGdwRFFoaVg2eWVnK1RoaWJVUHJFNlFRQXFhV2dQaDZwRWlP?=
 =?utf-8?B?V1FtT3UvbjI2N0VaNU5tQ2E1aXJacDh1TjRkZ1gyMEJrakF2ckMwcXVVeVNy?=
 =?utf-8?B?TENKYk85YVFINUtNajc1RUhMUVZlTU9QVDc5dUwrZ2R2b041TVVDK0pmYXRS?=
 =?utf-8?B?bzdmeDBRbnVtZUVGNVgzc3ZpckJxVk9uMndvblhZN3Y0ZnN5S09aTnljYUF6?=
 =?utf-8?B?T0FNcTJncllnQzRWK3h1S2hCUHU5Wm94Y2NZK3pXVk9rVGhaSjZmUDN0N1JI?=
 =?utf-8?B?cVkzWXpSY1pXd1hPallZVGZ3WW0vQVc2QzVZQ0FMaDI5emxacDVhWEsvMkRi?=
 =?utf-8?B?MUJPLzl2REViVlBDYW1LS1RpV1RqZDdHRjduYVJ0dU5aZks0V3k1OW9lS1Yw?=
 =?utf-8?B?SStpa0FOUzBFdlo0S1ZkMmc1SlVNQmhldXlsVlFWRWxCUVpkTjU5MmFlUzNo?=
 =?utf-8?B?QTROaEN2ajFSRWltRTA3UDA4OXZGZVI4VzQyTFhWcE5ndFkxSWVXNnRaaDNL?=
 =?utf-8?B?NjlOM2N0LzliNnRZeGhtSXR1a1UxaUJBbWlsVit2SGpsbTkvQ0VxL2xHSXVT?=
 =?utf-8?B?RVNZSHc1aXR4eDlUa1JFQjRJQUJKN0RhNmh0VGI4aXhrYVNqbHVCeU56bnRD?=
 =?utf-8?B?QnZ5eGNJYVdyejJzRGJiTnltcEpHQ0F0MHhreGFCeWpQVHdXNUE0WjgrNkpX?=
 =?utf-8?B?cGpJUkI3S3BzbWxiL1FnaGFsa1FwcDIvNmJKVHplTXQ3cW16UXVNWDk3QWFJ?=
 =?utf-8?Q?Ir21z4V6uQg3LxvTw4Em3LFGF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a4bcaa-94f0-4a54-eccf-08dd875442e1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 19:30:12.8124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PAiW1WucJNT27nahPAINsPb13+hkhL6XUji5XgKF6kLD5T+a4mr85K70Ox3mqJ4yFBcVXIdkAaxSz+gdmfqSdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8562

>> Hi,
>>
>> just a question: when will the CONFIG_AMD_ISP4 symbol be introduced?
>>
> CONFIG_AMD_ISP4 will be introduced in the V4L2 ISP driver patches. We 
> are working on isp driver patches and planning to submit once the review 
> for x86/platform and sensor driver patches completes.
> 

I had a side bar conversation with Pratap on this and that dependency 
isn't needed right now as no symbols are used from it.

The drivers are coming in different subsystems and can be enabled 
independently.  That dependency can be dropped for the next version.
