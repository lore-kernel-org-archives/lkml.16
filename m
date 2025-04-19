Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF952188CDB
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745093423; cv=fail; b=kyclXLtvE9b0VWzzsWYZqq9G9xQBuUNmSw+/un4GUjquCAfedSO77+rIahoLJQdZLKn29L6OHnuzPBZ6luirpMAmVVbEt60PSxbKr3/WbT5rfHSImuKaOz8K78FhyMWPyn9Q3idliSjckya5l+8FhAfrdAZKHD4LK4vjZaz3hP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745093423; c=relaxed/simple;
	bh=mqb56S8g6zlaS1jiRQ4rq5r+1L29xy5BKdQHU/YlT3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hKFoF145P8vfEgjQ39SvZspUd0Hn8A4F6e1PxD3NR1krrPI6/orEbNw6sJIhuGyJlIy7R7n5v031fO2pNrQvH0MIyrJKRwe5aYs6Tat3fPSCdrHHvRMhUi89H4VIY5I4+oKo50Jn7/omK8OQHi2cXT724AaQ2rTzSI/b6Nt/i5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sai8wzIb; arc=fail smtp.client-ip=40.107.95.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sai8wzIb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6fvDUE9VkqLy94MJoFPCVkHjBHLXIqT+nQqXn/9V8xfz6PQWa7PzHJaRu0QX2ZvqFJsqzucAhoCvtW3byScJUVnlY5NW5+7p14c7upP7wqTDLTR2+qS+PZIrOhMYATDxu/qF7TjW0KagkJKCrGtTuzqhbR7LzPtbFlj8at9FZK+aJKGEORrg6cdC7I2sZ+TPTzXlk4I0ImWGCFxuxm8qyncDgPwtzAd2xkBumPxe/J10YysXCbzbijNHz+VfYhVjgjyI2SleYtuO2M46pdpbbw3Qj7aYqUAjwvscemmESXIPKMVaXTeT9isnqNjcUl09vByl+OMTY1MygDQszq/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UP7Gd9sQauySC3xKr25oVUgXR+U5h86DOEf6fU1g2OI=;
 b=Srg5vQ1i9cheSs2uwTLnKGMZGeAlG43out3WURcKuageTc2BbaDu18BB8TyLnTdl1zvM9jIVovTbrmHtInBZRxgQZyx+rDhcxHQJZvRQwF7FEIvq3+mU/rXUhVO+GIusTuZ51iBVyQ5u8wzUYtL8VSnWlnZuuIFMEsnYHs+ED3h9fDQbZG0AsymCCnu1bJ6vGE/3ggyq5H52KpgxNmN+Z6n89VPar337/jJjJpkf0a8SSv7eGeVAAPVLamhho2zLcbnHcC/JVImcQ4WLBKCoCeEcuFnd7y4wEIf1Hw520sdxJf1n/HDa65/UOSvK4ixiUowFvO37w+JaxZIfcHlX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UP7Gd9sQauySC3xKr25oVUgXR+U5h86DOEf6fU1g2OI=;
 b=sai8wzIbWr5E+HAeyqPrlh9GXaw+7y72sxwv1NEON2v5gTxrk1fMLSi2lqL0yFZGZb/3Sey3MUDKzSRGoyxvJzorWbcM7S9K9sHEVu4ICyvJoDGnO0Ede9PnUdC5eSERdH/cOUKbBsokHvG+Dlh5PfYu4n6rR+7/aPDVg42BB/8sztk8Nxypp6Op/wi5x+vDEpD91wXlULimTH26C0vuvsLK9HO1jY3xBHD11USV8OMelqvUM2U8w84nDvf89mJnvzjj+2esmOOV2Lk9QHDI1t2kGDF/BwJ1FWzvWI8iOltRQMAc/OrLVjataYwWxp7jlC2SwouS0Z0ahRUODsrCPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by PH8PR12MB6940.namprd12.prod.outlook.com (2603:10b6:510:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Sat, 19 Apr
 2025 20:10:13 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.022; Sat, 19 Apr 2025
 20:10:13 +0000
Date: Sat, 19 Apr 2025 22:10:08 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched_ext: Track currently locked rq
Message-ID: <aAQDIIPOUAU-nB_F@gpd3>
References: <20250419123536.154469-1-arighi@nvidia.com>
 <20250419123536.154469-2-arighi@nvidia.com>
 <aAPemAFUsJaF_C2X@slm.duckdns.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAPemAFUsJaF_C2X@slm.duckdns.org>
X-ClientProxiedBy: MI0P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::17) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|PH8PR12MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: fea7bc64-b254-4474-8ae3-08dd7f7e3192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXBGODlSRjZXMkJSUE1RdCtJbjF4NHNpQ3pqQllLRVVYUFhtY1ZRaFhOaXNQ?=
 =?utf-8?B?V1dYbVR0bXNpckFhek9uR24yb0dMNVY5eWhOaEVFR2RCWXZwVzNLZU8wMFAy?=
 =?utf-8?B?UGExdHhEd1FETXloR05PeGpNb3ZkRTlDTjUvbnZHdVRSRmhPQ2VveEtERVEy?=
 =?utf-8?B?Y2ZVVnE2L2wxU0Q2OWlFWEVUN0NkSE5ZOUowanMzbHNrenVIKzZNbk0wZTZl?=
 =?utf-8?B?aHhCdjBSNFV3dzI5b09Vb0ltcG4wV1NpTm1oUzBabXdiTGxUbjA3UVFzTUh0?=
 =?utf-8?B?OFNRVmVGNkJWSVdndmF6TE0zb0lNcVFPN1RJRGNnUW13eFhPWVFKUk9FUEVo?=
 =?utf-8?B?SFlZT0Vjdk94dGNUTHYySkNjenFLb2l0eVhQdFJKTDVLMVZHbUhDbENoY0Nn?=
 =?utf-8?B?dW00NzFJbStZOHdMQTcyT0NIcGMrREkrY3NhQWs0YmpqMWk4ZGVzVm1BVmZ1?=
 =?utf-8?B?QnJRbWVSK1dXNy9kQW1ZdmJTa1ZXRXQ1aGNrMXVkV2luekV4YjNyQXI3ZUJK?=
 =?utf-8?B?TUpPZEFXUkwxTmFZQnhNNHEwdVZjVzFiTGxNQ0syMmFZTi9aZndWajkyc0xS?=
 =?utf-8?B?VlFFTFBQSXVxUmZqbVo0Smk4bU9jcEhOME9xRHU3VSs1UWNBWmlYT0xmZUpr?=
 =?utf-8?B?MnpCYm82QmRhRUx0cmkrZXFCbDdJMVlkaEt2cElzTlRudW5hQ0hFVit6SmRv?=
 =?utf-8?B?N2VrUXJQOCt0NGhxeWRqWW9STGtrdnUzT0JkNUxyeUNtOGJDS211aERqZ3hE?=
 =?utf-8?B?dnRid3ZmanZNUXFwSlJxUm9vZHM4OCs5eUNKOFQ0MktaMUF0WEVSLzVqVENv?=
 =?utf-8?B?Zi9YTmhPM0xtVEQ0b3FzcnZwQnFaeTJHMFU2MHR6Vk12T2p0ZXdIazI3Rktp?=
 =?utf-8?B?VUFHTHZ4VzNxeWxaQUwyb1lLMjdmaFhBek1ZSzQxOUx5YVExNStBb2w4aFd6?=
 =?utf-8?B?UUFvQVJOK1BWNzR1MFN4NXhoa3pxZjVMbHR3bzZvVndyRHhkQlp5bHRxSXFP?=
 =?utf-8?B?VlRxVFVOWWtUZ1FCbjR5ZjdxWkdkUXhlaXJWcnV4Z2hpU3BrblNQNVA1aGRE?=
 =?utf-8?B?M0NkRTk5NWd6KzAwdCtTK09xSnZadk1hcDZMNWlwTXpKUE0wR3NjdkZkM0tl?=
 =?utf-8?B?T1l1MWtyaEZFeGxLRldFNThDdHl2Ynp6dFZHZ2loYzhzd3h1KzM1a2diY1ND?=
 =?utf-8?B?dVlSbnBpNTNTWFNGQUlNVmdabGFPMWhSYUxhTi83dHlIUk5zT1Z2eVdRMmlE?=
 =?utf-8?B?NklCSjBlM2k0TlYxRU0xRzZ4ZThLWXNNNktjKzBaRmF6SVdDeWVVa3BNcnFJ?=
 =?utf-8?B?Q3g2dlhGTzRLQk9YT3hCUm5IUG1pUVlFMlZaemJwWGZwbmYyRnJ2dW9IbjBl?=
 =?utf-8?B?UDdpREx5UHJ5ekg4eW5Ea2hOUVRaQ25oWVRQSWEzdlJyZGh3S1lyS21UcUlX?=
 =?utf-8?B?UnRKL25vaWlRSXd4MStoNW5xYUdJeG5TTFJROFlESy9HdGdXTUFub2ViMWg1?=
 =?utf-8?B?VVdzTnFtSlUzZXlhdkMxbmZuY0E2RFlrQVJ3a3hxOUh0YnY5Mit0RE9lUnE2?=
 =?utf-8?B?MTRkdXBweHhPUzE0djRLNGpLaXZIM1lSazdqQzRJM05pS0F1NTJoSVN1SkpO?=
 =?utf-8?B?QUNmNmVnL05qMkdRYzA0ODJiQVlHbUZ3Um5XZ3J5VGRidVoyRWZ1WGRiSFBP?=
 =?utf-8?B?ckZpb252cWg5WjN4SGxPNDJYWktOQkZpamhKaGVFSzlvMklaeDU0enpvSUlE?=
 =?utf-8?B?WGQvOTd4bDZLRlNJM2xoZXRRd2xqNDVSOE5reHNLQVEyVmpKTDU1YW9pbXhS?=
 =?utf-8?B?WGIvUmZVQnI5bTZPRlUxOThhMnBjc25XZEQwb2hRUkxoNndvc0ZxWDM4Rm0x?=
 =?utf-8?B?SFMzclF1ekNLcGpkaWxPMFlCSFlrejVVSExNRndzMXMzeVhvY2dIRXlCaStV?=
 =?utf-8?Q?tXjHhK310MQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTY2YVpRUVpucENkd0IrcVJOZWx1MGFsTGRQMTBmRnNSMFhPZ2orRHBjZ3NP?=
 =?utf-8?B?eVZxRDNHYmk1RlBFcTZ1aHpXYjNHbDBCZkxVVzhpREorb0plV01DL0pvZUdT?=
 =?utf-8?B?anJrL2h6MXZHV1daYkx3elhSVjlwcVFEQ1VIbEs0ZWF2UXpjd0dHd3l2RHlY?=
 =?utf-8?B?NSt6S0xWUUJHdGhVZjhLM3dSWVVCR1pwbnFjZkZ0eC83S0oxRFpUUjYrZEts?=
 =?utf-8?B?WGVMQWY1UkxQbmF5V1JIaGNMVldVbis5ZEJyRktJMkRQNzdkTmxYYXh6ZFNT?=
 =?utf-8?B?Vk5EZ0o3RVVRNnJMWDVHTXV6WWZmTlN6QVlxUlRBSktQdnQxRFhaMkloQWJY?=
 =?utf-8?B?TnBCdWQ2eG4xM0NkYzVMSnZ4dGlYanVUNmh1Vjd5TlI2WWg5OFRCUzRoci9I?=
 =?utf-8?B?ZERXY2tyVCtNamtmckgzV0VqM2dOd0hWdVd5aXZwMkhRbXRQSDlLZHdtYWtx?=
 =?utf-8?B?K0dMenI0Z29JaXlmTm00aGZqWXRnQjR0TTNlUW1rYzFVcjBIWVEzMDVYQmJv?=
 =?utf-8?B?cFowMXpLSCtjcmhxRU5kZFpFSWF0OXNIWGhvV0hrWUZpUnM1N1c1NkFnaHda?=
 =?utf-8?B?UFBtRzdSYVhOZEMvSW9KWkxXWEdqd1RNR0dnTVhKejFOWDN2a2lpVmtqUG9C?=
 =?utf-8?B?RStrQTlucW5NeUtGcVM1aFZFSG9QZ29GcE9PTW9XbThSUjRuNDNYZlM2Mnl6?=
 =?utf-8?B?QWNyamJ0a0tkMFJqV3pkOUU5KzlnQ1VVQkRJNm9QcXhaUExoaVA3ZXFTSlcr?=
 =?utf-8?B?SXVURWN0VjdzRlh2MlVScm43b1AxWC9uc1VxNSsxRVJ5RnpCS0dPMUlqTVRO?=
 =?utf-8?B?WG5NVElRTWdTRkNReHBPa1JVeDAwSHRGQ2FBdGpIWUIzcElHSFVJWktSQ3Z2?=
 =?utf-8?B?cldFTlVRYmdBZHNhbEFleFlOR2xMS3dzcVJweXhqK3h2MVMraUt6T2RGeXVz?=
 =?utf-8?B?WC9sZFo2WjVRa2h6aVVadkJFRjFmL1oxK3JUcHhoK2xJYmpxRkFUY2xGZU90?=
 =?utf-8?B?VEJrNmhkVDJCWkh1MmdwVE1MSkFNY1hCcUNSL1VZTDk1b25WRWJkZ1c5akMy?=
 =?utf-8?B?Y20xTzJlMmdRVjFlV3BjQ24yOEV3OFF5eEc3TWFZSFMvbnFSNS9tNVNWNTZr?=
 =?utf-8?B?T2VlbWR4Z2R1TUptOWVPMUkvOTBENk5vaDd3UVFZZ3Q2U2hsSkdWYmdyZThx?=
 =?utf-8?B?MDJmTGVpdGNLRWl4a2V5L1NZdUowc1F1dk1RaStzWENVYUhNTzBLbVZnbS9F?=
 =?utf-8?B?VmtiZ2FhU1MxUE1ram5DRFlJQ3NYVThzaTVjbTlmK25iUEk1Nk5WQnZHYlQ2?=
 =?utf-8?B?WFBxV0YzVDBHL1F6SjV1SXlVYTR0dkRnUE9XSENxZTVCTVBjejh0K3NMNTk2?=
 =?utf-8?B?QkphdTNvOXRWVXNnR0Q1N1hWbnBHUG5TMjZ0U3pzcG14cnk5ZXVVVkVNSEZw?=
 =?utf-8?B?NVV6bmlRN1FYT1FoQWxMNTFMU1ZLeGRJbTRKOHFFZzl5RWxEU3BrMVV2SG1u?=
 =?utf-8?B?SWVuak5BZEVBVlJKemp6MkdBSXVFTG1MV3p2S1VKYkRWbG9YY2pLV1Fub1N1?=
 =?utf-8?B?eGVqZm13ZDNWWStLcjhoc3djbTZYUUtseW1PcTAyaGpHQ1hCZDM1UzJVV1Bt?=
 =?utf-8?B?ZXlkSnFVMnVZM1lzZUhWZHJ5b1dOYzV2YS9TdWROWFpXVVlwZURrNStBNU82?=
 =?utf-8?B?a2xQZmxGVFlYODJPcVMyK0M3a0pUUEF4YlRiR0tUY2doVldNcjhIRE9Razcv?=
 =?utf-8?B?Wlp2emJFTjBVYjI0U1NZWXo3aUxURFlVV3hEems1b3BNeTFxZFFIM2srOWIz?=
 =?utf-8?B?OXJoUSsvRkdSQzh6N3VRS0JjYWdMTllxWFROcjdVTk11aE1GNnZmQXNmcE15?=
 =?utf-8?B?OTFJU3prdEQxZVNOMEhrYXl2SUgzTS84U3g4QnNWSXczR3pSZndDQWU3NVlw?=
 =?utf-8?B?ZHhsc09iUHpHM1JKRGgwTjcwa25udmk3TVRHUG80Y2V4UXVrbE0rMW9LTVNt?=
 =?utf-8?B?Mm1xdnM5bWpGQU0rYitzTHRxc0pZbTMwWFcxb21OSDhlbjJ3SHJrM0o5UmtC?=
 =?utf-8?B?cllqeTJ5ajMxeFRINnNpaXdxdm5GbmRqVnU5MGMwQ0k2S3dlZU5wTHFFMWxL?=
 =?utf-8?Q?KS1wN7EaMMzSxV2r9Z7HLsV3X?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea7bc64-b254-4474-8ae3-08dd7f7e3192
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2025 20:10:13.2347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ID/Ac0FCwmC+9feQiQkEQ/rKbBpGwMgjyDFtZ6iOltNIcZR/QUVmcX+53P0Cr8g4R346f2LZ3+T/nXusBoEoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6940

On Sat, Apr 19, 2025 at 07:34:16AM -1000, Tejun Heo wrote:
> Hello, Andrea.
> 
> On Sat, Apr 19, 2025 at 02:24:30PM +0200, Andrea Righi wrote:
> > @@ -149,6 +149,7 @@ struct sched_ext_entity {
> >  	s32			selected_cpu;
> >  	u32			kf_mask;	/* see scx_kf_mask above */
> >  	struct task_struct	*kf_tasks[2];	/* see SCX_CALL_OP_TASK() */
> > +	struct rq		*locked_rq;	/* currently locked rq */
> 
> Can this be a percpu variable? While rq is locked, current can't switch out
> anyway and that way we don't have to increase the size of task. Note that
> kf_tasks[] are different in that some ops may, at least theoretically,
> sleep.

Yeah, I was debating between using a percpu variable or storing it in
current. I went with current just to stay consistent with kf_tasks.

But you're right about not to increasing the size of the task, and as you
pointed out, we can’t switch if the rq is locked, so a percpu variable
should work. I’ll update that in v2.

> 
> > +static inline void update_locked_rq(struct rq *rq)
> > +{
> > +	/*
> > +	 * Check whether @rq is actually locked. This can help expose bugs
> > +	 * or incorrect assumptions about the context in which a kfunc or
> > +	 * callback is executed.
> > +	 */
> > +	if (rq)
> > +		lockdep_assert_rq_held(rq);
> > +	current->scx.locked_rq = rq;
> > +	barrier();
> 
> As these conditions are program-order checks on the local CPU, I don't think
> any barrier is necessary.

Right, these are local CPU access only, I'll drop the barrier.

Thanks,
-Andrea
