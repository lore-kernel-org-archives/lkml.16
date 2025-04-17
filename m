Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2066.outbound.protection.outlook.com [40.107.96.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644904A02
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744848591; cv=fail; b=uxeLRW7wwY4o+Plb9CzMts7eGc6/3nndiGWmMqgB/fDVkWFthxr9vJItZhoByfcHsAeB6ZavJbjuQfSMbZWk6QlGM/RhjfN2ibK2H88ZdWpXQbMVLLLX0Flchh8jlie/dJcE8phYjZZpY/ZYyAEyc9Wrsp93dWL1ZCGnDGi7pdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744848591; c=relaxed/simple;
	bh=WbOTfEUxXJQ3g/Y+8Zic0TYPa8Q/H0BNIQkeMykiaC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=elrwc3M0KuceV/4jCjfUbNmT5GN9/By4dlCTwIsmdSrodlYpSVtXVDiwMaM+ek0Ujc/mUw3L8lFqRJPuXhieuCxbzJ8wybfIAAiNunVFNB7cSHxRCO0OtMVdap6blpcvDRK/yyXZrjn9rfxQZYRKntf2C08V3l+rJsNjfuh5Zgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4X3RVDub; arc=fail smtp.client-ip=40.107.96.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4X3RVDub"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZLoJHGyRzSBpNB7EAMB8CSWkNkIe9PHnmqNDRWaO58HOEvfd6P5OIne46qkwBi5GALNfo3T5fGQU7kvr7bIc1rcm7i+sfoc7ACFVhpIsYF6KeRYHIf9j+X+wIc5AuAF/kW3IkErbp0jkFq9qkJuZNpbdr4rkZuS2QKS3eV0+zndx0tW/JVAS8SSd9b5TMzDS7Bgw4JWA2V8W0FwdwRF5oxAO+TNdVE6HWy7dfHDSL6wwx6e2UC6uAEbn9y7TpnIAfb1v/qO3tJIomTnKLWo3vbuJqY6l6vcOrUzCqiI4vfzIoACe2YJIBzGx2E2ALd1VUpgZcWMDxpREVavrzJidA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWns1xIlV8sVPRFIGtcNhxweO5hBLP1rWkEn6oRXD3g=;
 b=nhlpO4cma+fv17Asqmpqcb4tfghtiVUcS0UeMnInRVwVPP1YKPQquLlocZDeJyHkuXGV9wmTBtXwFRm5Sbf2T/stLW35R8IS+Eq26kCnMzmWKc6Ty+0gL3uxOidzoVfuh2IR1veJhRITVMQLCDOy5mEuxI/Q6+xXv04tV6eEEOVDvcoRw8JLaS7pxGbX6EHv72fEtRf4CX1lE0Bg5qoVVrpSKRbNuP59ZA2HEoCcXTOnrWMphGOUWoIGB/ul5tHzPMtS3lfCnyTSkqAXZf7k9gCVcOaFzPzTYAVsCCw6WK5Qu8EB4cbRiKnWbDMqKgfkdEAun7IC+E6+YhnhFxLwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWns1xIlV8sVPRFIGtcNhxweO5hBLP1rWkEn6oRXD3g=;
 b=4X3RVDub4Alb0JOwr9PmEOUG7K1yOA6hWU8yiw3BOLqvzbtY26Q1EUSVuQeDnf9Japl/SkVpRwaC51aiFeRqQ8Tpi0hkohctX70G5QEZh3TnmFxX8CowPmjt1fGgUzh8xUDdltLs8ET5csYPf/8YC8FUZKd5MggOaAXWPG2pjTU=
Received: from BL6PEPF00016414.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:c) by MN2PR12MB4206.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 00:09:44 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2a01:111:f403:c901::1) by BL6PEPF00016414.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Thu,
 17 Apr 2025 00:09:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 00:09:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 19:09:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 19:09:43 -0500
Received: from [172.19.74.139] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Apr 2025 19:09:43 -0500
Message-ID: <0738f3eb-bb3a-4190-929e-d533c4b7f9f8@amd.com>
Date: Wed, 16 Apr 2025 17:09:38 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V0 0/3] Add versal-pci driver
To: Greg KH <gregkh@linuxfoundation.org>
CC: <arnd@arndb.de>, <linux-kernel@vger.kernel.org>, <lizhi.hou@amd.com>,
	<christophe.jaillet@wanadoo.fr>
References: <20250303044313.679012-1-yidong.zhang@amd.com>
 <2025041504-ultimatum-unmade-e54a@gregkh>
Content-Language: en-US
From: Yidong Zhang <yidong.zhang@amd.com>
In-Reply-To: <2025041504-ultimatum-unmade-e54a@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: yidong.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|MN2PR12MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e228560-b42b-4304-e773-08dd7d442848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WlRqdzdLTFBsaXNxNVhvRTY0NEMvS0R6YStsU0NlNkl2WCtFd3lpQk14a3Vt?=
 =?utf-8?B?VlNJOXhhYUZITlh2RVl2Y2xEeCtIQkJGMEg3REdINWtoSTN1WWN4THJ4YzNZ?=
 =?utf-8?B?dm5xZGxNWFVEYVFrbVBjVUl6ZDZMeHNvQlVhTEJtVlB2WFlneGQ2UnBuS29Y?=
 =?utf-8?B?Rm9HeFJ0c2lvZ1BreUNEd3ovNU80MjMxdkFCdGFpdUhDS2NqYkd3Q0JpSE9l?=
 =?utf-8?B?L25FVWQ0WjFvVmpQam9QQ3Q4ZG8wQXZHcTFKeU8zTzI4cmJSNmdsd05HQklI?=
 =?utf-8?B?anRiMnhNQmw4SUgvSFBFMm5Xc0U4WC83ckwvWVBVeEQ5V1AxZDRhY1d5UHNu?=
 =?utf-8?B?QkhUZ0pQdUxFb3dLTDdRSTMrU2c4dDduUGkxL1hhRnA2c3g5WG9zTjBwRzJy?=
 =?utf-8?B?Y0tMTUR4TVFxcGlnK1o1TnBFZEhsc1pTVy9GeGV4OFVZSENZMGZEMGE1Lzlm?=
 =?utf-8?B?M3VvVXRYaGZMcmFiVW9oRnIwVmJMS2FYdWRmbFljbnhxWU42bE9WZjlOY2xa?=
 =?utf-8?B?Z3R1NGROdmFZV2U5eWk0QWNJZm9jN0MvckhZOVJYbVMzSlhCNnJZamtlVUps?=
 =?utf-8?B?R083dG1PK01ZZGJhTm1EbDJxRzl4Q1FsMTBOeVUwVCttZm5odlhyVVEvSUs5?=
 =?utf-8?B?QzBpNzYzRmpUQWN1azVDd2hmVVpvMEUyVnluY3JIY2xxWnYybVNoalJnQ3ht?=
 =?utf-8?B?SC8yWVJTNm1FdnFMN2RZZVhXVHdFSlpOcHlFTm5qdWxUQ2pCYUlvMnczdmdL?=
 =?utf-8?B?L1QzSVVkZEZpY0laWVBpa3NaVFMzTTUvbEFOMmdvMnl3SS9TcnpWZGl4Mk9H?=
 =?utf-8?B?c0l2Q1VKN2MvbkhiY3NaSzM2NTNaV1NpRnFvdDYwUmpwcHBaRXp0WHFMakFz?=
 =?utf-8?B?UDUxRWk4aWpVZHRtUUplWVk4OFJCc0ZUQWc1cGxyOWkxR20rQWVTVFZHdk01?=
 =?utf-8?B?OS9US2tiSVl5azlvd1V5TlRsRHpYc2xrVHAxYUswUEQvZW50NFh3MjMwa1d5?=
 =?utf-8?B?YVlidjdYU2N3dUlEdGNqSTdWMk9hUFF3QlJhSmZpelJZaElhbjU5blpPSWQ1?=
 =?utf-8?B?NENPMmZiNXRmTDdPOFg2ZVBPdVpITi9tRTRBck90R3dJRUZNTjdEWWkzTlNr?=
 =?utf-8?B?aUhVTk95VHJ2czZrVDNSS1BUNkdnWFlkRjIwa3NPZUJBdnBaTWVUNy9iWmM5?=
 =?utf-8?B?Y2FDZkp6MnZvbVRpMDlaWWRpakxGQ3VZZnd5SUh4L0kxV3dPUFpEb0tBNzhB?=
 =?utf-8?B?QlJiNjZ4STNVT1ZjTWtmWElZOTV5OFI1dFBJbm9hR1ViVjlLbHEwN2Jra1pp?=
 =?utf-8?B?RW4rc1YvYUlDOERyMjJMQm03M3RxelZPYWdjTTRvRENCWndtbVpKaXZ1dGh0?=
 =?utf-8?B?TFZvZWpkaDlwVCtmL0IzSnl3RUJIVUdvOVVYU0E2Tjd3UVAxMUlYQW9pOFJ4?=
 =?utf-8?B?ZjNVTGVsWHZScHNleC9qWlJBcVM0ZDBvemFUcTBBNXRrekppaS9FbFJ3S1FJ?=
 =?utf-8?B?SFFFN0JWeHIxRUJqTWNvSWcrYTA4a1k5YlhxSjhHazRRVnZpQkhBajA2L0JK?=
 =?utf-8?B?eHBiOHpaa1hGNDV5SHdsT0xLck8zQ0d5Q1hkRmg0NzBGMUFVOG53SFJXUWtQ?=
 =?utf-8?B?YnpJSDl5R2pmN0tKSUs0dFY4cVZTRXUrMmZHMWxuYTQ2NEo0QlRZMVlMNU9W?=
 =?utf-8?B?TXRxZGJDMWpBcjMvVlM5Ny9WY0ZYK2FjcWdiV3BhWXhMMk10NzVuUEpxVVBu?=
 =?utf-8?B?WmxseExrYVZZQzRpaERZYVVTQWw3T2c2US9IYm4xUDN2UWlBcWxyd3draitQ?=
 =?utf-8?B?Y2lJeTdQZFc2NVY2Y3NPYklkd2NYbWY1emRrbDU4RlNGSkNYY0M1WUQ2SGdD?=
 =?utf-8?B?WVI0cm9OVmtkVWhqL3h5cjBOVXVmTWpuK3BrbHF2NWZ4RTR4ZkVPUllLZm9x?=
 =?utf-8?B?NzRwL3V2cEl4NzBwY2JyUFFJY1dFV0tkWGE1aDdDMHVBaHY5SUdEQTJOVDJm?=
 =?utf-8?B?ajF1MDMrbHpSSzNQVmRBbFJ3eHlEZysvdU1RL3dQK2duMCtsZlJxRm53YUhs?=
 =?utf-8?Q?f/NsXB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 00:09:44.3280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e228560-b42b-4304-e773-08dd7d442848
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206



On 4/15/25 07:11, Greg KH wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Sun, Mar 02, 2025 at 08:43:09PM -0800, Yidong Zhang wrote:
>> This patchset introduces a new Linux Kernel Driver, versal-pci for AMD
>> Alevo Versal based PCIe Card.
>>
>> The AMD Alevo Versal based PCIe Card, including V70 and RAVE, is the first
>> Alevo production card leveraging AMD XDNA architecture with AI Engines. It
>> is designed for AI inference efficiency and is tuned for video analytics
>> and natural language processing applications [1].
> 
> accelerator drivers should be under drivers/accel/, please work with the
> maintainers there to get it reviewed properly in that location.

Hi Greg,

We will work with drivers/accel community and send updated patches to 
them for further review.

Thank you so much for taking your time guiding us the right direction.

Thanks,
David

> 
> thanks,
> 
> greg k-h
