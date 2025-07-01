Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B976CF9D6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351469; cv=fail; b=qnjGhIs6p4xxnq7b5H8fu632xSv1z9/H7vzwOFBsx2Zk/mkGSJG4IqygvdO2VklXvGvbjPmGR2LwYVWm0iibYRbu+7f6yxag7etTFJVRXUNkrhyuA2okWtGjcrByLIIDN5hNYI6UKXS3vn8hTjPNzvcYL9qMDGWpXndzb/OlBMk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351469; c=relaxed/simple;
	bh=a0pTibuj7+gAD4jSumkTSSUIm0nV6faeJ/v5g4i7yXs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=InHcb+RB+kjKLYwCOnJDvsqd6PjTNZ+BAT5uwVnb+t7RWDKo77mueBGqQ+BA/57g5J4fi6FWlo5ByELRZkWiIwQDaxR/q1efUxe+OwTWnWWzbMo9P0u529zGYmOZWM7JF2YHvRMkWRMxHySMF605mMyjGcQZhfX9yj3aY0F0n64=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aPJLqADa; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aPJLqADa; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aPJLqADa";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aPJLqADa"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PTAGAFdzY3FxsGeto148DKbKMhKzFXNO7E/pKr05mQELGSEBohVBzaoYd6pbSy51/jODFwx1l9EbO7HHBtHVjoL6nTdSs+5ecKE3c5ZLNk/3TEqevVzJP9V7gl0lwKY3fG3DImjiU+1IMcM+RA3MBF4TfrMwiaqO8jXY3l1IjEVBLEw9GJ1rnCvfHsr0c9mIsCj2pAhpPsx4gSMPdFCaJ0CtybWdLnX592OphRpqAs7l/BUNV70Yi2TrcTgpnPtmIKCdiA7u0a4qva6lBCCe7Pva5TUgdqQvo+eB//KUvTjJuw6gq3qwrm5xL3bfMjYg4P/mNQwIIlS996fj3EOIGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNNpvw5jtJbl65i3eNE2pdcJmLXAu7Yigk1WwyZxS5k=;
 b=xqnLPPSNZ/4CLRqs+QLYX1G+do8pbr3pmhq0U4YgRjyXEAL3suvQixZ1fAe+Jm4gw13N9FH/OAqcB1t25EY4l1K6Q8UZ/V9epPYAy9hA9ElvjZ0ZS6BAE3wESBu2YLBEI+4oLFyIHHpgDUUlHoZZhsbZ7xostPZ3d9HePON6byLh5DLiUFHC8Fugk6wWPd0hhvQVm8aFilSsiyvzEE1rPw8PNLdlLuqns/3vyqDECZHwon3VK58jVtY1xVFpE+b3X93qzQN6uVKvu0TLvb2BLrhvEzwMpBuEUxyV2APXig70w1QxuKP5zDTOa20dbMBIBfPu8y07o6x4LewlUsWWzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNNpvw5jtJbl65i3eNE2pdcJmLXAu7Yigk1WwyZxS5k=;
 b=aPJLqADafQ2bA/jVLKzrPV84NvuMUivphpIcoRURHZJRZL8Dhn1jnvAT8R3rQIVtXpPQIYsANJJ59emKMo3AxstbFEdAeREDf89xTOFnew5P7qjrxfDn+8tranqMdfyKl6/2cJ1dw/uRwH/qb+ZHp7WGZFDty6v3gbiS9tU8JDw=
Received: from PAYP264CA0005.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11e::10)
 by DBBPR08MB6204.eurprd08.prod.outlook.com (2603:10a6:10:1f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 06:31:02 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:102:11e:cafe::c4) by PAYP264CA0005.outlook.office365.com
 (2603:10a6:102:11e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Tue,
 1 Jul 2025 06:31:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 06:31:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5Dd40zRk+p6tsejZqKyO2PFgN+8g8oVQVD0Lt64QAbKkD21bl8douboWEtcFGd2yUshUc8nbLNS11Ys/t/LZYF0G86ZELhI24B9tKGeYx3Kr0p+P4cju/BzVm6Cd9z4nXdXI+yA5jlewxUDTDprRRVYZ8PiRXF1+Llk9yS43Zo833mM7KXbvGwr0s274bf0YAwZ9jD5NeN5aj8oNiQ+dtGcOUCLbFTuyCQ9hP4ffkfQU/J/o6CvfZ1545jSy8AHFuKaBV6gEiX6P6LDXazmEQ+FObrDJGaR2CRPcyIEnwylL2DCS8k8XVMU6BcyKmPcyID89qiUE4c9uA2bq5ArFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNNpvw5jtJbl65i3eNE2pdcJmLXAu7Yigk1WwyZxS5k=;
 b=RvcLrD5sunAC1oNovZyKefHvX/sswxSd/i5Prfeca+W+YbuO6M1u10oVxVtwTLYXyLqRQJYwr0hYBqJlhaQtmmm0C2DtDn20o4+P/7SFFuGxS2dh/UieZAirtrzsp4HlfzzQmbqYiZm+gKB4VyQLA+FT6A0nna603MNqeAJepLDw/yUJmXCIfKqB7L0qBSBok7KW2dHaijHg88R0wXNUOG92K8kuv6jFbdNJCRcK0pkKnj+Y8WQqwVn0y50Dr16NsengpmBQn056fe74tTz15zNxaR7dVjn7tXIWzaF6hktoVqSxvHjUS5Clk4wuZzeagyRNR3Wg2WWQO/d1B/YUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNNpvw5jtJbl65i3eNE2pdcJmLXAu7Yigk1WwyZxS5k=;
 b=aPJLqADafQ2bA/jVLKzrPV84NvuMUivphpIcoRURHZJRZL8Dhn1jnvAT8R3rQIVtXpPQIYsANJJ59emKMo3AxstbFEdAeREDf89xTOFnew5P7qjrxfDn+8tranqMdfyKl6/2cJ1dw/uRwH/qb+ZHp7WGZFDty6v3gbiS9tU8JDw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PA4PR08MB6176.eurprd08.prod.outlook.com (2603:10a6:102:ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 1 Jul
 2025 06:30:26 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 06:30:26 +0000
Message-ID: <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
Date: Tue, 1 Jul 2025 12:00:21 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_per?=
 =?UTF-8?Q?formance_gain_observed_in_AI_inference_workloads?=
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: siddhartha@kenip.in, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 mgorman@suse.de, Vlastimil Babka <vbabka@suse.cz>
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
 <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
 <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PA4PR08MB6176:EE_|AMS0EPF000001A2:EE_|DBBPR08MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ceaa556-08ce-483b-d21e-08ddb868d8db
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YkNScXp3Z1JLVE5temlMNnBjT2pVMEhlUDJqWmZCUnVyckptZ2lUV3o5WWxk?=
 =?utf-8?B?M2VxVnUycXRNQ2FRUzhGM2FWcGdoVVgyczhPT2djQzg3Y2VnZFlleWlpbkg4?=
 =?utf-8?B?OENlbXFFanlNdVJoTjFWbm9ITzNCanQzaWxYbkxlZ2p5WXYzQkNPdHh5M0ds?=
 =?utf-8?B?MUdxSGdmQk8xNGRjVDlRNjdzNnQ1ako5dnA1MWVJd2xBN0tkSVdLZzAvdnBE?=
 =?utf-8?B?T2RPOEVQOGtydndUVlJWbVp0RTdxZm5HZkhRREJNNURqeEU4cGY3UjdQZmI1?=
 =?utf-8?B?b1RtODNpU1pEZ2NjdTZ2dC9BbmxWVkt1THMwQzhGTGdYcDZlWG9lSkI2Z2dh?=
 =?utf-8?B?UW1nTmR0UkVJeEE3N1gyWU9mbDhKWDc1TStjeFUybGRTZGUzM0g2Sld0WEZr?=
 =?utf-8?B?bk9Ud2JvWmNyY2RxZmFLYVQyR29IMEwzbXFTR1RVSTF1cDVDUUQxZlJoZG1F?=
 =?utf-8?B?clE3QlNyWkExOVJ1bVlvMEdFU3NlWlNZblBJc1BzWXZmdE1MSXJCckhTbnVN?=
 =?utf-8?B?TVNVZUhhUVZFM0JGZHNDUmNZeWJDQjg4NkFhbEYzcklDdWh5L2t0WU0rcFg2?=
 =?utf-8?B?RGJqRTg1UGFSL1FGY0JHa3ZlUkZ2WXVkb3FiTS9oWkJRUXErcWVKQk1xakxD?=
 =?utf-8?B?M3NOamNGcWdyemYwdm5scS9FWmNvNytVNDEvSW02YlExT25NSTJFQ1hTOU0z?=
 =?utf-8?B?cTl0NDBqejk0WE1KanMyY1ExQ3NYL0tEaEU1eFNMZHlqTS9CUjlBb2M1ZGtt?=
 =?utf-8?B?WVl3TFVOajNmczNtS3NSSmFlMEFwd3Vnem5BK0NuZW5sQUN1YWdINTZVdjJ5?=
 =?utf-8?B?QlZjR2k5am9Qc3c5T0pEbEpGbmYxbG5vblc3ZFVZL3J3L0ppSHdWdlJ3QXZL?=
 =?utf-8?B?WEJ6dHNkNTdxbHg2L2h1U1Z0Z2UzOHVCV0RCQTJET2tKeFFLcEFkdzh3bE4z?=
 =?utf-8?B?QU9OMFZINUlpK2d1aWhpN21IVXJzemtRUjhHT0NEMTFRTDUyUDhwZkx3K3pY?=
 =?utf-8?B?M0hUSS9lYzZFS0liMWZwVkFWVVFNTFBNTys0ZHFGT0RKZVpnb25nTVFpWkJa?=
 =?utf-8?B?OXdSaFB6b2w3a2MzLzRRTnBzVUdtSmpJbXNXMGZTcXFPMGk4Qk42MHcyKzNk?=
 =?utf-8?B?RCtQb2grc3lpV1ZjM05vejduQWt3b2t6akxicGZKY0VKZnV2OFZZbUx1WWxU?=
 =?utf-8?B?YjRtS0pMMnpmMXFJYUlDbUtmVnZnelRUODVmanBSV29LS1BPWGE5SlJhV1p1?=
 =?utf-8?B?cTdsaE5wV2ZLQXpqNXdZZjRidlRiQ0Mzb0JEOVRKRmFwRC9Yd1hPUVBsUmJ1?=
 =?utf-8?B?cTZ0bGJRa05SdWpNY1VNNjE3WWVsakMrcW9UTWVwWTBlUHhGbXF1K045bnh2?=
 =?utf-8?B?dHpRTEVQWVV3emx3bDl5dUwvcTRicjd2bWwwTjNLVXlFZW4wL2t3NUIyYnh4?=
 =?utf-8?B?RDhEMFpLeEVhdVlKaU13QXhMMmtIakFsWTA0M21YL1h1Z3RZeTdyeFlCcU1T?=
 =?utf-8?B?YUI0cFJLcG1pNUtXZ2RMTERud1VXbFJLMC9EUWJWY0czVUlvODVOY1JZNkhq?=
 =?utf-8?B?ZUVIK25USlpjanRNemxwRm05RzhqTjRwWHlTaGJrUUpnZTc0NFBvNUM0WUxE?=
 =?utf-8?B?TmRqeFBkdk1XOTNyWVRKc2k4S0oxTU00b0JxQXZmYjZHWVM0WDFpRDlWM3Ew?=
 =?utf-8?B?eEdMaVBhbjI0MkFqLy93TTNZSTdzRTR5OE5nYlorb3N1a1VyWjMyM0EyeW5Q?=
 =?utf-8?B?aU5TSldnMkQrMjV5dXJaa2VvTnpLdzZHRGxicmM0dHNpREVVRGZpVHZoMi85?=
 =?utf-8?B?NFhaMVRoYW1Rb25FZ0VEZTJWbllRZFpoL3M2YW40dTNPNDE2VjdBYTFseUZr?=
 =?utf-8?B?OFp6WEU4TFFPREdaNk9IdEtWUXZ6M2hUWlRvUms5NDZrUXIxV0d1MkpRTDdB?=
 =?utf-8?Q?aNULfXUbdEc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6176
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a46da3b-d480-4a1d-8ef9-08ddb868c414
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|14060799003|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REd1K0NMenpDdzhVVXZUbXBCbTl6VlAySUt3RW0wekUxQkRZTWFZc0Rtak1i?=
 =?utf-8?B?R3F1TWtsaEF5WGt0QStjRGg5N2dIVlBWVDJ6M2sySklpbjdUcWtYT3hoNHJj?=
 =?utf-8?B?RnFRV25pSEFwa3owNjhyRUFsTFdKMCt2bmhOeEFXRHRjOXZFWTJPOW5LeVhw?=
 =?utf-8?B?ZmRoTWd6emQyTk81NjAvT1JHUTZlZGxZTW93UXJZYlhtUGNTd2hZRmE0WXYx?=
 =?utf-8?B?VnRmZUZzRU9mVWtYRTRGcXk5Nk41Wlg1VFRweEFOLzgxL04vcUppNW9Pc0pM?=
 =?utf-8?B?M05uejBvazdpRXRySllZRHp3UHlidnhyK24wQkt6V2w0cWdLbnI2RnhML0Jp?=
 =?utf-8?B?Qlp3TUZ1MldlZDU0ZStLbzUySTcwcUJaYjVaRTdqZUpmdzY2TndYV0p3R3ZO?=
 =?utf-8?B?cm9zWFB2TDRDSXY1aWpVcTFucGtuc1JUeG9vOVlFcjBybjBJU2UyS2JoWXA5?=
 =?utf-8?B?RWtXQkp3SWk2d2VmS3VYNWt2WlI5ODJOUWVHR3BrdG5sRmhlajdrVDV5eWFx?=
 =?utf-8?B?cEZLTy9KWm9ESFBmbFdHcWtINFRUcVgxOVZ2bHF2SDNlUDkzaXozSW9TV0oy?=
 =?utf-8?B?RjJPaGthVTZpbTV4UDM1b0gyYTZkYmhYaHdJbjJQaEw4SmVXMG5PcS8rQVE5?=
 =?utf-8?B?UldzZXBEcmdScTMvQXlBeWtxY2dBMGdrRlprbytKdmhjQ2MzU2h1S3h6L1g5?=
 =?utf-8?B?c29vRi8vOEtNMnJuNTV6RTlFSWpVVjVpdGpYa2c2UXlCcGZhZFhtdXUzZklM?=
 =?utf-8?B?N0VGdWM1NGxwOUhhUW5uZHV4OTh1WmR3aFlHaU5xMEJ5eHkydVhtUURpanFI?=
 =?utf-8?B?OHI4K2hjWFdhVHMxNklaVjVqVGRqNVZJeVVtNjM5UFUrY1gxc0hsOUNHUit2?=
 =?utf-8?B?Umxjc2ZUMUgxS3NvbmpQSThHVWF3NlNLV0U2L1laeWdqQ3diYUVDODQ2NHB1?=
 =?utf-8?B?dmpMZFNqWXR6TzRaRFJsYjRaRWp1cHVhbWVCRjA3RW45WW1HdmVnMU9xblRB?=
 =?utf-8?B?VXgrWG0vTTBJRVBURkF3VEtWZkgrVVJlQWdGMzFQampjSGlPbWJVNWQ4enRJ?=
 =?utf-8?B?UGlYdEJWbldJdFZ3L1RUNnBzaWd4T0dPKzBaNTBEOEhpSzlieXQ2N2VxY1dB?=
 =?utf-8?B?Mnp1VFdRbThJNkVnV2ZLNWF5Vmk3SWZDVVd6Y0pjZXdsWlNIdVU4cjlPY3ZB?=
 =?utf-8?B?OWJaMTZNbUFRQTRuZEVJNnlaVWtBeHVybU9NSkpXaVQycVpjL2tFdS9ReVZI?=
 =?utf-8?B?S2JvaGFGeDA4K2pLWEhsNngrS1lXL2xXRW5CaEcxZlF6RXZZdVkySEdLTGVM?=
 =?utf-8?B?KzFGN2VkNFJiWitROUtvMzJDb0M4YmQ4djRzakFPZnJZdXB5dXJnWEtabXBq?=
 =?utf-8?B?VVJad09UMUNTblBMbnlYSXVIM1hmUWxJNStNSmRuV2FrSm12Y2htRmM4ekVU?=
 =?utf-8?B?OExDTS95WlF3VVNPN2FZaWNqYm9DTW9CakJnVkVXdHNweTNHWkt1M1dTcWNU?=
 =?utf-8?B?SzkxbUVXUGorNFlrYkY0NTJYOFJ1VXRkdW9xR0tzc3o4Y1JDejl4ekJTV2Fu?=
 =?utf-8?B?SU5HaHdrYjh2dWJ0dmhhcDdPcTZRMEZaVWRCMWQrdVBybnYxZlE2N0tBOFhM?=
 =?utf-8?B?QlFOOWF0Y1NmVkQvdEltOS9JV0lwQkp4cU5QODBjVENMSVdzU2h4MzZpRWJo?=
 =?utf-8?B?SkVVYkQ3NnBMSXhZVGdCZWRuWmpLOTdjcDIyQWFRUzk3RzNWN2ZldFpxd2o2?=
 =?utf-8?B?S2xWR1BiUDdBVzFBaFlMTzNSTyttV0FsTVQ0NzFENlI4eUN6WFpsSnpobjZx?=
 =?utf-8?B?RlA4Mjl2RTEwSFN4dE93UmZtdU9qU2xXOXFSZmx2dnZTbHZGUGEvSCtlOGg0?=
 =?utf-8?B?WUg0bjN5RzNhS0RvZFRhMitPWFdMWk05QTIydE5rWHBieUJBT1dCQ1NwOXpC?=
 =?utf-8?B?bm45MnpRNG93YVBNSFhqSXlJZHhZQVhKbU1kMTdERkxINDh0dVExNGdoOUFS?=
 =?utf-8?B?UlU0WTNjbUMrV1RaZWNwK0x4eTBVdW00ZC9HazI4cFZFYmZjbjdrSEpsVHBN?=
 =?utf-8?Q?n9CnP7?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(14060799003)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 06:31:00.9921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceaa556-08ce-483b-d21e-08ddb868d8db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6204


On 01/07/25 11:23 am, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 11:15:25AM +0530, Dev Jain wrote:
>> Sorry I am not following, don't know in detail about the VMA merge stuff.
>> Are you saying the after the patch, the VMAs will eventually get merged?
>> Is it possible in the kernel to get a merge in the "future"; as I understand
>> it only happens at mmap() time?
>>
>> Suppose before the patch, you have two consecutive VMAs between (PMD, 2*PMD) size.
>> If they are able to get merged after the patch, why won't they be merged before the patch,
>> since the VMA characteristics are the same?
>>
>>
> Rik's patch aligned each to 2 MiB boundary. So you'd get gaps:
>
>
>    0            2MB                      4MB           6MB                      8MB          10MB
>    |-------------.------|                 |-------------.------|                 |-------------.------|
>    |             .      |		 |             .      |                 |             .      |
>    |             .      |		 |             .      |                 |             .      |
>    |-------------.------|		 |-------------.------|                 |-------------.------|
>      huge mapped  4k m'd

The effort to draw this is appreciated!

I understood the alignment, what I am asking is this:

In __get_unmapped_area(), we will return a THP-aligned addr from
thp_get_unmapped_area_vmflags(). Now for the diagram you have
drawn, suppose that before the patch, we first mmap() the
8MB-start chunk. Then we mmap the 4MB start chunk.
We go to __mmap_region(), and we see that the 8MB-start chunk
has mergeable characteristics, so we merge. So the gap goes away?

>
> If you don't force alignment then subsequent mappings will be adjacent to one
> another and those non-huge page parts can be merged.
>
> Vlasta's fix up means we only try to get the THP up-front if the length is
> already aligned at which point you won't end up with these gaps.
