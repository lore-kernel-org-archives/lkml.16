Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F021AAA1E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.50
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744303771; cv=fail; b=N3+n1ZZ+W/WsbLQHErfKcsQiQEzRRgXcttLVfT7DmWaxNjPqhq4zjVyWiZeT14Dn06qrFT4auPE8RTZxhQfYT2YIEGMOAo6kL63dUyb/K8szYuqH6ACyzGPIxXLR+SbHbpFUtchlrKS4pb9koufse+wElM/mp+vfV1YIumrdpys=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744303771; c=relaxed/simple;
	bh=huaLGAK+tTRBTnseaf2zA1qIPFZ6FEqWBOInHrC+0c0=;
	h=Message-ID:Date:Subject:To:Cc:References:In-Reply-To:From:
	 Content-Type:MIME-Version; b=nkjH639yZF+uJejdMvlltjHEnPF760kFYyvEKW3A1AZ/DJnk8q567iuiRlYZoUqZxkJy6iN6bQNKYSHr7AVmEyPAlVeIDonS5ZJgxwgp4NDW2bW37rJhziJQ0xUIGLWyHvlQsFWfbmywrnol4SpS/8L8iKsPvjgjQNrQB31GOgo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mBwRnaeK; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mBwRnaeK; arc=fail smtp.client-ip=40.107.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mBwRnaeK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mBwRnaeK"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=k8vCIl+LuKn7ctg1NE2ql4HIKi46PcyK5zaTjb4Npv4mEzp1hT5yKE4sK7rARXxPL4UqR4Glv3qXyegCexkI8JSdporwgw0M8aXCt9jYlEZ6/gzUaykxjDJ4+bVlXGiFip4LKDGsp03aVcBo6Sax/fjNHyrA4Yb2/5nfL7IYFhITbXHa90vGlB2DUONAHaWw7Id32hYXNI9IvnxQvJgDy26OaynU3/o4TkkSyxt5uGjoBQuM4oT5WrdY3lAI4h5ipuKv6jDmSNDsJPz0RGATLiYXy2DoIfI6OT10LifJiXJhWODNlcyEBwn8YcCHc8Ml5+ssFtWxtYw/8tzualOvOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ITB7K9lktptmpqIOgQr7taaJ6SgiKDFBeSqaQ/5kO8=;
 b=vt2fPhjQta9NRqjrxnFtDuJrXVdZQZ21qnUHfwvcXTyy33FeKSbRw6wesMRR8+KmVxngGHP1NVJkXYhJDc7U76xc6mbCKM+GxI0qE4Vp3vMYK87tir0R94ejGUF7HryAkn7aqpaxZ+AA0CCsLkIw1uRCk9sLUq/WQM9aT/U8fnNhqjqgv4fvLPbNRBK45PWIyEhGWGmnEQx9y16lMZI3CVQxJ/bKGv7wehX/URzRbR/gf3KlCiFt2vWnW68FoKssNybFS5Rf9Re675rqCIgfO6J4EpRsI13bxXw74CVCT3gu1b8gHckD0tuazYOk4SqLlMtGOKPPuW2idsXfvxhGEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ITB7K9lktptmpqIOgQr7taaJ6SgiKDFBeSqaQ/5kO8=;
 b=mBwRnaeKdMTvYlU71e28cBilKXGRQS1XLtFOx2wfYT+a3QYckmQVaofIgOH4qJRYIJS3sYuPLml703Sj7whbCJ+F0Dih/NETo1QwxHeniw4mzGYSKZ7YbbTwVpVJkp4NaBCDXLPgVIDPxsU5THRDa0avnruSSgPin9JpHnbSMZk=
Received: from AM0PR02CA0152.eurprd02.prod.outlook.com (2603:10a6:20b:28d::19)
 by GVXPR08MB10764.eurprd08.prod.outlook.com (2603:10a6:150:14f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 16:49:23 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::71) by AM0PR02CA0152.outlook.office365.com
 (2603:10a6:20b:28d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.23 via Frontend Transport; Thu,
 10 Apr 2025 16:49:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Thu, 10 Apr 2025 16:49:21 +0000
Received: ("Tessian outbound ef9f95d5bce0:v605"); Thu, 10 Apr 2025 16:49:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eda9fe4912e2306a
X-TessianGatewayMetadata: W+lWsw9fpqEHYiQBqcVgYC3or4gDFlo7RiHI0WvDcV7jTIySOQzDzctczx6ZbnF2l+LqH431yDgQbfWOLp4oQkTPa7ZM+7WblC6SQBVTfN4ElF4UvkeNi9MCXGfMUE96ZCURfPirY6qKbB7wWCxMnBAekRWGXVhtIVHNopQ9Y/o=
X-CR-MTA-TID: 64aa7808
Received: from Lbc66333c9cbe.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3C545DB2-16A1-4997-A338-D4102DBA19C9.1;
	Thu, 10 Apr 2025 16:49:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lbc66333c9cbe.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 10 Apr 2025 16:49:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xloWgas9ElUOd5Ytym5GdKCz8O8F1A+wpjbWhNAaOrAd8WWpPV2SQixoaMfHlfyQkdgLcorigG+owC2FPKLONNJzZSH/1NnNtToUDFD2dAMLbElQzmg2iUJK1SpbqcSn35hACwagLLQ3AH4XmOufS88MGyA9ycU3GVXWqv8H0oDfQaOKjSR1rXu1MOvVNuJh8nPz04NPOESvOg3jgcbcfeqrltBv+G9TROi9AjZHWWC4ucNTZ/Q8qfsT0Ai06QPYEGxFhvgEFXC2HNBxtA9pGHWY7hI1AdPqHyJg0AjNbie6rJiU4atXkVQqEheaBZaFv+GtThGGQXZf6TRpLp8OOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ITB7K9lktptmpqIOgQr7taaJ6SgiKDFBeSqaQ/5kO8=;
 b=R9N+NS2D6wS6yKLw56hZkJHy3o6Sd/FOmwyhPJ9TbEyXS+7Ilh4lsACKiTpgKbI4BRDATWM0xy4/TeuhWPit1H8MF62bCFVagu1APDU3m0XWdV9l/RDq7QQgISZpuP7V7Wph0e4bDg8nYgYkTEJYjFTBrxsKuzNdOGhsJ2RQPa1FH7IxnxkT4cT9Idi8O8ZIe/0Uzp4TptM3ZTT5G7Oa6mJm5ZNpeUo7BJjRMIndkzFfRl5BdF2rWus/8U0GTc3Y5Qx5qKWFaz6CS9Gi1/Pc3acYlG8/S4deyYbvORWE2mW1L+jDOLHp12MPa4BIGZNLRFt35DZMCvZQBl9TBlahFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ITB7K9lktptmpqIOgQr7taaJ6SgiKDFBeSqaQ/5kO8=;
 b=mBwRnaeKdMTvYlU71e28cBilKXGRQS1XLtFOx2wfYT+a3QYckmQVaofIgOH4qJRYIJS3sYuPLml703Sj7whbCJ+F0Dih/NETo1QwxHeniw4mzGYSKZ7YbbTwVpVJkp4NaBCDXLPgVIDPxsU5THRDa0avnruSSgPin9JpHnbSMZk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PA6PR08MB10393.eurprd08.prod.outlook.com
 (2603:10a6:102:3cb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 16:49:12 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 16:49:12 +0000
Message-ID: <c9715da2-f239-4c9b-b6ef-020e08e3b40a@arm.com>
Date: Thu, 10 Apr 2025 17:49:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] drm/panthor: Add 64-bit and poll register
 accessors
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-2-karunika.choo@arm.com>
 <20250321084809.5f217049@collabora.com>
 <d9a4aa99-2f00-4da9-9f7e-26729f7f8fda@arm.com>
 <20250410152822.632b09b8@collabora.com>
In-Reply-To: <20250410152822.632b09b8@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::32) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11200:EE_|PA6PR08MB10393:EE_|AM2PEPF0001C714:EE_|GVXPR08MB10764:EE_
X-MS-Office365-Filtering-Correlation-Id: e39d38f8-d008-4ee6-73f3-08dd784fa4a4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZHJYcFF1MEswL25temc1NE1NQytjaVVVc2JRRVJkcVRQVFZqTEh4dHVMRGpH?=
 =?utf-8?B?U2tabkxJT3JENFk1UWJNdGtBUjlwSlRRZEFocUtXL0o1VGRjekQxaFpGVzBI?=
 =?utf-8?B?d3BLWGdza2xNRnBIU1N3R01lblBaa0FoUGZlVTVyQnlHbEJETXAyTnQ3dmtF?=
 =?utf-8?B?MnBLcHRvM1hwYUdEYlkzQk4yOGIzVUpJM0dtVytGRnlEdVE5cUpjUGhSUVg5?=
 =?utf-8?B?T08raFJsazc1R1FDWmxyNC9BYVNZenFKeVFNZk5MNG91Q2IyNTFCMlk5S0Fq?=
 =?utf-8?B?ZmF6MDBLZHZwcFlMMktINUpTcXVHcU14cnR2MmdJU2dsZ2w1RUhWTWliL1BY?=
 =?utf-8?B?eGw0SzViOU1TZ2ZkdGJmYklkbTgzaVVZaitLT3ZZaVF3NGw2V1lMNXp6OGVh?=
 =?utf-8?B?Vm5zYmVhMkUxaUdFdWxOM21rQzJ2RFE5dlZJR2x4NWtsTDJzenlmRExtOWUz?=
 =?utf-8?B?WWttWVZTRlo4ODNhOTF5c242YW1lU1Jjc3Z4NVhWTmlTck1pdndlMmJBSmdq?=
 =?utf-8?B?SVJsUGFGS1FneWpDSU9HbUhkQnBxN3k1SjhCYk1SQWtaSlc4TDlLcGR3ZFJY?=
 =?utf-8?B?Sjkxb21zd09MR1FVRVcwczNiT2dlQU1MbWEzVS9KL2xsTFRLdVdXVk9UZGJw?=
 =?utf-8?B?R1hKNE93S3laUnQwYytYd0RGQTVJeVFMR1lIUFFNL3phUkVQV3premUrR3VI?=
 =?utf-8?B?Um9zeC9YUGxFclRLZnBQeVA3UEtnQ2FmVFNQSHBjYjJkR3IvaUhDaytTckVO?=
 =?utf-8?B?bzNKNGtQOXJWZ2lwMEJ2Vkdrd3VTa2VJV3VXUHAxY3RoNER5R0tPcXdvbUY4?=
 =?utf-8?B?cDlqMFlNeFk5ekpaZ1cxdEpKUis5UmtlODF6SUtZR0E3WE9JYnQrekxVZHZ1?=
 =?utf-8?B?anhHZmNzbHQ5bWQrVjhtSDZGQnNCbDZvbE5RM2xkMlc5SWlpQi9ja0FhaTR4?=
 =?utf-8?B?SkpjWlR2Y3MyWG5sWWFLZUNiWTVBQXl3R2l0Ung1VHlnUHp3eUFVUktIZ25G?=
 =?utf-8?B?aWhER1RpNm9VT1QyNjVZSU8yY0p6UmRHQjZudW1iSEZLcmpETDlGRk5pMGxh?=
 =?utf-8?B?Q2hSQXBxSHlYcnR4QWMyK2xDTlFTdTdjbkE1cVdDcjNOdGszQkNmcTgvZlRS?=
 =?utf-8?B?UlFTNFdySEw4SHpwMGZjUStFUm5tSmtyKzRvQ25ZaHVOaSsvRnZzcGwzNmJr?=
 =?utf-8?B?bUI1WUt6akRkbGZvdkY1M2pOeEQ2OGdFZ2xveUMyVEtMU2tkeTZscVZRN0ZT?=
 =?utf-8?B?Y2N1dmFTMlBEN3dDTlhldVBIUC9UL1VVMGVzTzR3RHY4R1JtNmxGMUZUS3Mz?=
 =?utf-8?B?djlMN3BtR0RFY2t5ejFiMTlmRjBKUm1objk0YzN6TUZBckxZRmpmU2ozTVk4?=
 =?utf-8?B?Y2ZmRTNiSFFTUkV5ZGY1ZWY0bVBVM3Q0ellMTXJLaVJrM0ZjKzhUL0JQNFE3?=
 =?utf-8?B?MEdzTlh4c0JVbEVuaGsxSm1JeUlQU1NvMEhFU0l4VVFiL0VYYit1KzVuV01y?=
 =?utf-8?B?S3dFQjFodDBub1lKV3RnbGNHZ2RYdzNZZTFxVlRXcmlyOTdTTTM5M2V2ejh3?=
 =?utf-8?B?ZWtZZW9YdWtLdzFaZHNRR1BSTFNaVUFLVXpiQ2xiLzB2aXhERjNhVzlRWEkw?=
 =?utf-8?B?MkJiemZhQlpleUI2TGdqY2lKMXVRTFZ5aTJuU0h6V0xabVpuMkRmUjVBdG9s?=
 =?utf-8?B?b2RiMXhtMXdvcFRUcU0wOVAyVWdNRzBHT1h1Wkg1cUZDTzRVTGkvdXhpTTZH?=
 =?utf-8?B?MzF5bjhmemIzUVUzOUc4MjZwKzRTOUZBU2xXQVcwczdreDJjaE1tOTJnUThz?=
 =?utf-8?B?ZHJPUjZzbmhIcCtqRGpZa0VZKzRGK25PbnQ0UCt2T3dENDdtNVdGN3pwbTlk?=
 =?utf-8?Q?Rg2hgKEPcWxmd?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11200.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10393
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:257::18];domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa6fe690-7ee2-471e-35d2-08dd784f9f08
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|376014|35042699022|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Njh3Wk13RFBoUFliR0E1MkRZZlNyMEhqRjVXYjA2a3VsdkVsZGJTYTFTOUdH?=
 =?utf-8?B?V3Vpc2VqTWpkTDRpWjhBMDErMmptZ3c0WGpjeVROQnFwMjJqWmYxTGl5dnl4?=
 =?utf-8?B?anhnNUI1bzU0VklpNjBKMEorNnppd0prTEFHOWU2U2p1ckF6aEVKQk9JdzFn?=
 =?utf-8?B?L1RxQmtQU1RnQ2xSMWJmWGJlSjNPTlI0a3BKcEJBZUxYVmpqdWxKaUhJamdL?=
 =?utf-8?B?c3pRVnpSS0xpZ1VJaUtJSEI4T25XTXVXWXlSVExsNDhtZHpic2hFQ1VoZ1Mr?=
 =?utf-8?B?S2l3SVhIeER3cldtR2N2TE54N2ozT2NrSEdnOTFTYzhoNUNJUndWQS9UUTgv?=
 =?utf-8?B?cFByV0lkWkJSNmZlWTJsMVc5eGt0YmtDRWhJL2hMcDN2MS9YZ3FnQmdPc1Uv?=
 =?utf-8?B?U2FtQmhBZTcxSEVkUlgzUFpRUm9iSDhvNXVQRnFMb0YyZmEwSVRhVzFmSW1t?=
 =?utf-8?B?Y25XUU83NnZ6bDNMbXQwdkZoVDBFRGVUVkpQdVdBS29KOERlU05VcGNFS0Y4?=
 =?utf-8?B?MGluNEt4OUZqY2NlMTlldm92cEZGS21xNTM5NitUdktaNkFzVkdCcDZ2dktH?=
 =?utf-8?B?TXcvdGlKeDFXMlpENDZwdUIvNEdkQzUrQ0s1N2l5OWVaWi9DZDVvcGx1dkpX?=
 =?utf-8?B?WjdrUkE4c3lUckxqVFVZR3JyVFRBU3Y0OC9KL0Y4NjVvUGNDbnVZRWNiOXlq?=
 =?utf-8?B?OTZyY0lidU9yRzAyMkNEYkhNSnRYUFA4dktqWW45WkdJVlA1bGcySUpmS25i?=
 =?utf-8?B?Z2h1bHFBVVFYUXVjZVU2cUwweFU4SzlQbU9PK0IrSHpzSkN5eHorcUxKdkto?=
 =?utf-8?B?UWY2MXhWQXFBSmFlSXVMR0tNUDVwZHJ1MHZ5L3ZMWGF2Nk1ibkhvbWcwZ0JF?=
 =?utf-8?B?K0Vzald5RHBwbzRRQWpiT0Z5ekUyaFpRMSs5OUJvWXNJSUFDRE9VTWpJUFBq?=
 =?utf-8?B?bFlYYTFoYzcwTUFJS1hwcjV6S1hVeHd6K2M1b1ZpWmJkZFkwZmhiTFdWbVJO?=
 =?utf-8?B?c1VHRzZFSjNaQ3FRZi9ha1dsSk8xSjRyaVJWNkkxeDIzdHo1aWo5ZVc2YzlO?=
 =?utf-8?B?SDVmU09UdnBUOEpNTy9EN2Z2dWhib1VyRzcyU3ZkWE01ZVJ6M1Brd3k5cjA4?=
 =?utf-8?B?Mnl2RVI0aDRBSm1SY3FlMTBzb1lMRllVRUZHSW9IQWpYYURxK1UzUXNMdDB2?=
 =?utf-8?B?NlJXaE5TOTFpSjRJRDhBQTVuZFNjZGpIbzBLcnB3TDdQbVlhVzltcUhaVkI5?=
 =?utf-8?B?N3Z4cFZZaFJaQWE0Y214cDZ1K204RGFGZFJKVzR0ZzJLWmJFVVBuekRXYmpX?=
 =?utf-8?B?T1JlMEx1UEQrYnRrQ00xalBDZWkxdkdBclhGWkxCL3EwR1NGZDZ1ZTk4MjlD?=
 =?utf-8?B?VXNWRGpoajJ4MUFQWWRVV21jSWloV0NFL1VJWDdLa09wNzlqQmp5a2dubGFy?=
 =?utf-8?B?cGY0Z1JadjJMOSt3TUorbDEwTU5wRUJaQ0hLQW02SDNTYXZoekdIRkJDaHRM?=
 =?utf-8?B?b2RiN1R1UHVRQXM0SytLU1M5K2FQZDZYK3NsdktDdVoxOHVQZnNCcVVsWUpM?=
 =?utf-8?B?ZDRTeVBnamtFbWEyTWYremJoY1BGSng1Ymtmcm5sYVF1a2lYUTRrQzlMUUkv?=
 =?utf-8?B?TnhhNnczT0NucjloUTlwUHRXL2NSTE1JeTJsMTR6cHduT0poTUFCd1V2Wk05?=
 =?utf-8?B?Q2c3R2FKSHVkWWVKWE4ySmJPRC9pd29admZ5T3Y2S0xRZzltOUg0eCtJODZs?=
 =?utf-8?B?bktmTjFuRkRIN0JDbEluMlZCaVQvUmNzRzdkMXI1bWFsM2tnbFRjTTZxZGRQ?=
 =?utf-8?B?eDZjV3pMQ3g5SUdzS052VnpnM2VsVEg4U3JFeFBSV0pFWVJhZk9aUnYxTC9Z?=
 =?utf-8?B?UXljV1JOYmxuZnJBRzQ0WVRzUDJLUTN0V2pUSUxDdnZlT29meHRBbC9Wdmpq?=
 =?utf-8?B?TDg4TG1tamphU0RWTWlvL3ZmdnpkMWt6RFY3S2JCSVBmSWZmOUhzQnRZVm5R?=
 =?utf-8?Q?mGyrzUatY6q2Rw1Fr1GrjKl0kkcG78=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(376014)(35042699022)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:49:21.5687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e39d38f8-d008-4ee6-73f3-08dd784fa4a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10764

On 10/04/2025 14:28, Boris Brezillon wrote:
> On Wed, 9 Apr 2025 14:00:54 +0100
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
>> On 21/03/2025 07:48, Boris Brezillon wrote:
>>> On Thu, 20 Mar 2025 11:17:33 +0000
>>> Karunika Choo <karunika.choo@arm.com> wrote:
>>>  
>>>> This patch adds 64-bit register accessors to simplify register access in
>>>> Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.
>>>>
>>>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>>>> ---
>>>>  drivers/gpu/drm/panthor/panthor_regs.h | 55 ++++++++++++++++++++++++++
>>>>  1 file changed, 55 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h  
>> b/drivers/gpu/drm/panthor/panthor_regs.h
>>>> index 42dc3fedb0d4..7ec4a1d04e20 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_regs.h
>>>> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
>>>> @@ -238,4 +238,59 @@
>>>>  #define gpu_read(dev, reg) \
>>>>  	readl((dev)->iomem + (reg))
>>>>
>>>> +#define gpu_read_relaxed(dev, reg) readl_relaxed((dev)->iomem + (reg))
>>>> +
>>>> +#define gpu_write64(dev, reg, data)                            \
>>>> +	do {                                                   \
>>>> +		u64 __val = (u64)(data);                       \
>>>> +		gpu_write(dev, reg, lower_32_bits(__val));     \
>>>> +		gpu_write(dev, reg + 4, upper_32_bits(__val)); \
>>>> +	} while (0)  
>>>
>>> We're not doing funky name concatenation in these macros, so I'd rather
>>> have them defined as static inline funcs in panthor_device.h. We
>>> probably want to move the gpu_read/write definitions there as well if
>>> we do that.  
>>
>> I see where you're coming from, and it makes sense. I was thinking it
>> might be better to keep it in panthor_regs.h since that's the file we
>> include when accessing GPU registers.
> 
> Well, yes, but also gpu_write/read() take a panthor_device, which is
> defined in panthor_device.h. I guess we can keep those in
> panthor_regs.h and include panthor_device.h from panthor_regs.h if
> there's no circular inclusion. I'm fine either way.
> 
>> That said, we could certainly
>> convert them to static inline functions if you prefer.
> 
> Yeah, I'd prefer that.
> 

Apologies for the back-and-forth. You’re absolutely right—it’s a good
point that struct panthor_device is defined in panthor_device.h. I
have moved these functions there as static inline functions, in a
separate patch outside this series.

Link: https://lore.kernel.org/lkml/20250410163546.919749-1-karunika.choo@arm.com/

Kind regards,
Karunika Choo

>>
>>>> +
>>>> +#define gpu_read64(dev, reg) \
>>>> +	(gpu_read(dev, reg) | ((u64)gpu_read(dev, reg + 4) << 32))
>>>> +
>>>> +#define gpu_read64_relaxed(dev, reg)  \
>>>> +	(gpu_read_relaxed(dev, reg) | \
>>>> +	 ((u64)gpu_read_relaxed(dev, reg + 4) << 32))
>>>> +
>>>> +#define gpu_read64_sync(dev, reg)                     \
>>>> +	({                                            \
>>>> +		u32 lo, hi1, hi2;                     \
>>>> +		do {                                  \
>>>> +			hi1 = gpu_read(dev, reg + 4); \
>>>> +			lo = gpu_read(dev, reg);      \
>>>> +			hi2 = gpu_read(dev, reg + 4); \
>>>> +		} while (hi1 != hi2);                 \
>>>> +		lo | ((u64)hi2 << 32);                \
>>>> +	})  
>>>
>>> I would name that one gpu_read64_counter and make it a static inline
>>> function. Note that we already have panthor_gpu_read_64bit_counter()
>>> which does the same thing, so maybe move it there and rename it along
>>> the way.  
>>
>> Happy to rename this to gpu_read64_counter in v3, if you're okay with
>> us keeping the macros/functions in this file.
> 
> Renaming the function is orthogonal to moving its definition to a
> different header, no? I'm not sure I see why one depends on the other.
