Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768621DA60F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.52
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203675; cv=fail; b=p43NPct65W40xupckSjtoX8IZIF9umMaWSzg5W6FaXHC+DtdnIoyJJC+fAHgBxtcYq5FwLNbaS5RBcci/o8GC1r3iq/7l1zLwpGghX7PMV8ZCnVsW6OsQ6Qd5JJu6YIL85GhmdUWMb3+sOL/FKQHYLgk+9CApzdrWrSxFMi85n4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203675; c=relaxed/simple;
	bh=0eU2dagCdik/LFWsT2pemLXu+zV3Vl7zdKkK/xeQV0I=;
	h=Message-ID:Date:Subject:To:Cc:References:In-Reply-To:From:
	 Content-Type:MIME-Version; b=ZIKb1odGuh/NP4uwkQoVVt35SIdWTacQ8229v51REK7BqaFSNJh3vm8FSE0bV3RoqGBMZBEWY2Mjwl3yU/Ewc38KBd4tORiGW18eZhSQK8jjul5H8fK6BAf/Jk+AtTn3x8oX++6FWbvJx0jTqDrIaU2W9SsJyC/tgs95uh0U03s=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DdObzhBm; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DdObzhBm; arc=fail smtp.client-ip=40.107.21.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DdObzhBm";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DdObzhBm"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wwy7cHbnIDfgWSwIAdRK9tEnMSfBW6Bp8Qf4egM6oPcOJV51i/HKSBH32ju+d+RAIF2+X4WhiZ2eX9EOfqlL4DavnXwT6a26NsEDQKuqWMwTwhYKFhrgAUGs6sHvHAWABJhx8LWfsE3884Kn9buz2uHeZsiU428jokna0Bq95lnhuiu8El0JF6W2q1Wroy8v8uIKw79hhsffaVq2j6tdWKQtEIvnXFGAaEfX78c7EmIx+PLTu0wc+leu2GFJ4a7Whpki+gE7NNFzh7vKLhMBy2C6GHVnbU0kURQDpCmuP7E4YaFk/im87bwjeCS54+LfxpH3HwAlOQVYL2+3MOVTNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U48QCf6J0sJ88rueHdNT5wJWJy9QoUixwu3+PHnpEaM=;
 b=NCwl29JtMme5qDCV7guFEPnCMH5d5H4joqF8gf62itEcw78+6w5PzTfcUcCzpkB77wq/B1EVIbNJ/5kLMyzcPySekNA0MsFF8MS92OjoiZHCaBKT28EiF64wBceHcBAyuopcCH4ibTFuqtKNA0DyO1nlglMuwfliyXNuHE/K6xg37JwNKR7yxQ4CskydOCLxcnNyuoPwyov0ycFgOP71SYKmgjkdyQyMUcEC946dkGhTB+Y7qq8BAtv/7ekxQUJr98bn/dfOqVATN3C7qDjKZbrwjA4O9FxdiOFB7W5D5X5UTIqFVyWNQaNLwO62KKL4UMNxaxjdluh1pugbGEn29w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U48QCf6J0sJ88rueHdNT5wJWJy9QoUixwu3+PHnpEaM=;
 b=DdObzhBmQDfwJ9naVHFzhK0YtIqMhibtbzoJRQdQyfAPdoB5cUUYEy36hHY0nLHJhWq/FqUflFs/zjye/MT2V6QCa2D2R4GzTd5SWXffzoGQT0NULF4+i/QrvuISdFoH/KqMS7reMmpwQO3r8tTz9a0rGoXDhdZhhGoTw0i/dmE=
Received: from DB7PR03CA0085.eurprd03.prod.outlook.com (2603:10a6:10:72::26)
 by DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 13:01:07 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:72:cafe::4c) by DB7PR03CA0085.outlook.office365.com
 (2603:10a6:10:72::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Wed,
 9 Apr 2025 13:01:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Wed, 9 Apr 2025 13:01:07 +0000
Received: ("Tessian outbound f9fef7c7dc50:v605"); Wed, 09 Apr 2025 13:01:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9576ba688fa7dded
X-TessianGatewayMetadata: H7beHD+xZNPQ3vLT8S+E876puQAtKSuL045yB+CUMfeTnM6ZnLYTZ+qlH7+GO6oxR6V1fp8MtEcguf+lLRj7hDlINw1mAqJi00zIokUanv2bY62VkKNWFlHFDeIWGWTt04pZ9UslP+ESwBYxAPcgRVztSOnCvMQ0GYV4UtMDPDQ=
X-CR-MTA-TID: 64aa7808
Received: from L867b2692dca8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FC9A3ABF-1D35-424E-A0C2-B645D32872A0.1;
	Wed, 09 Apr 2025 13:01:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L867b2692dca8.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 09 Apr 2025 13:01:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/ddyp3NwWGqPNobf4YTCcdcbSbxvmyBkb18rmk8nJOLgkKKx+Ob7PaqKb6oQe9CpiBN0eg3Y2g9OmMhSyWp5SvemNxX1q5vpg6QVt3a15qs3iifWnLu4A5Du4niY3v+Od3tu8+kkrpFHI7eSjwZ6kHalHK7ukhdiuioXBXr0iLb+OWGaIjSa8GBSmp0Qup8mWmIhGW7FxMqXRQgNTFz6fGy22f89WGKMOVWtr3OA1OjO30jWVJ8N4KvamjaRr6fOEbb5oJVQxFiizYwI1ZctJS7887MhUaHk+QObesAOTABRfjFZXn7QPtQQw+aSrg7OF7p+Mt9EcSMEj4mtgEREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U48QCf6J0sJ88rueHdNT5wJWJy9QoUixwu3+PHnpEaM=;
 b=OqUOMq4/dcqCl5ZnlOwikIQ2v+p9acv1bUDdqRGt9uhFM/DPy636/SbKbr+uuoB2lx1ooSU8Q6xxWN2rdaAigoDuMwyiEAhWCR4Nrxqfz283pmB8jV7EbqmVSc374591fmNDBpWhIbTu8Ra1QGmKSSQwr54rkBFgpKTzeOZY2KC0FCToIZXuY7lKEYjnjMeUw5FPDBYQUcergM+AQc8SbpSZTjZLE64qgNeoeoB2LH9IvSHTx//J2YgANasod4/lpSnUtB+EwBEQxj2oNF3CUqeYXZIcPAudRQL4ImdfiDYzB/gtQzwiaGXWs+ZZdC6h+6o73BKZ6lKUYB7Wmv72VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U48QCf6J0sJ88rueHdNT5wJWJy9QoUixwu3+PHnpEaM=;
 b=DdObzhBmQDfwJ9naVHFzhK0YtIqMhibtbzoJRQdQyfAPdoB5cUUYEy36hHY0nLHJhWq/FqUflFs/zjye/MT2V6QCa2D2R4GzTd5SWXffzoGQT0NULF4+i/QrvuISdFoH/KqMS7reMmpwQO3r8tTz9a0rGoXDhdZhhGoTw0i/dmE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AM8PR08MB6594.eurprd08.prod.outlook.com
 (2603:10a6:20b:36a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 13:00:58 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 13:00:57 +0000
Message-ID: <d9a4aa99-2f00-4da9-9f7e-26729f7f8fda@arm.com>
Date: Wed, 9 Apr 2025 14:00:54 +0100
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
In-Reply-To: <20250321084809.5f217049@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0262.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::15) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11200:EE_|AM8PR08MB6594:EE_|DB1PEPF00039230:EE_|DBAPR08MB5590:EE_
X-MS-Office365-Filtering-Correlation-Id: 5618ed1e-f164-4717-57b1-08dd776697be
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VExHTVNKTndRYmlRUU1GY3JiT2ZkNm4xZjdkajBVcGp4ZUVGZ3pQa2hJa1RT?=
 =?utf-8?B?WlNmWHBCL2xNWXhzZEY3cWN2RllKSjdyemxkR2FQODRxbnlkdlcyeTRJaThT?=
 =?utf-8?B?SCtsYmFpU2pQdmVJTUg0d0tGZm8yVVlPSFY2STN1T0hKSCs0Sm9OamFMeUxY?=
 =?utf-8?B?T2N2cTdteXlTUUFqVVpuRTIrUjhCaWhDTnNValhjNFRxbHMxb1dJRjl3M1Av?=
 =?utf-8?B?bVlQYnhzMnV5UXU5MUdjZWZsRUZrQXBheXFWK2xsR2Q4dmlveFQ1bENFTFpN?=
 =?utf-8?B?d1NIaUF2bHdWc1JNWkxlb1g3SzhodTNwWjFIZFd3UVJ2VnZ3WGVLMUNpZmsz?=
 =?utf-8?B?bkdDcnMxRkRYMGRiTW1pMjJHeHU1QW9hd2xLc2haZHgvQ1FycWVnQXhZdkR2?=
 =?utf-8?B?aGZKMHR6c2ViT0ZhWWw1cjd0MVJQcmpPVnJsTERONGsxbzVOajFWUis2b2kz?=
 =?utf-8?B?ZVhNVklMbU9vMU9JZEZrMVpkbHRHNi9tMTRUam15dnRsNzR3aHVCNVdyK3Jz?=
 =?utf-8?B?bHJiSzlpTUhYajdHRHVPUkRxa1phL0llc0REZTd5aEdtaE5oTThrYi9SaFRF?=
 =?utf-8?B?MWpNY3Bac29WSEFqUHgyT3dPZUcwUE9zZnJwT0NQZEJiRXVidjRLejRTZmlm?=
 =?utf-8?B?SVhKTGJHWjlRVTlrRCtqNTVrN3ZQaFVkQk9hQi9NRWlWVzI3ay9LZ1lOcGlX?=
 =?utf-8?B?OGJLM3ZTRVRBZi95alQ5dTFSbytqbzBna3hwTXVqU05pRi9YTVRKSFZGZHdJ?=
 =?utf-8?B?SUhrNTJwY0RVSXNxeE1EWkpuOVVJUy9jZFJmNWh1Mm91alZwMStYeEQyM3g0?=
 =?utf-8?B?b2MwdFU0ZkExMEo2QUpVZE1zTGIvU2FhdWhpYnlMbGRkaUw4d3BQS1Rhb3Nr?=
 =?utf-8?B?RktYOWorWVRmeWFqVDkxQS9UR1FjT3ptYXQrcmNnMjQwQ0IrQkRULzlJK0JF?=
 =?utf-8?B?azVEYUswclVEV085L1lJNDFadlByM2N6WXhQTzQzOGJPUTRvZG10UkZQVDlm?=
 =?utf-8?B?UlN5YXVqRDd3TXJpanVGdXBxVHk3aWtIUVY3VnJVMGtqMmlPU2h5K25JeHhN?=
 =?utf-8?B?Tk5RVWRQSlErcEcwblZseE9IcWlMQzVEb0VkWHdPMDZaTDFISVdpdU45M2Fo?=
 =?utf-8?B?L1NYS1JSalo3L1NwaXNuVHc1R2Q1WkFPT1FONklkVWhVcklxMVVYRVhUMURQ?=
 =?utf-8?B?bElOaEhYYWlOLy9KcXFCODNXSkYxOFhVVldhdDNydi92MllWaFhma3BzUnov?=
 =?utf-8?B?c1NOSmxpcDJ6YklFQ1hqc3ZSSkdtUEtZK1N1VndRaHJ6Zkd5aWtVdDVzK0pl?=
 =?utf-8?B?ZGU0N2JySENqZ1RUUDZ1M2RUdXdlM203YVFqOEgxRm1nclFZYTRIVXY0Q3ZM?=
 =?utf-8?B?bUEzbmE2MGtaUkUyWHhwN0JoUkpBVXJOU3EvNDNNQ3Jac1RmODQ2eCtLS3A2?=
 =?utf-8?B?SHpzTUZ6K21VZUxNNnQ3d1N6RWQxZHRueWhsWkhUQzNQaW5FUEZ1dlBxS1BF?=
 =?utf-8?B?Mk9VaGVqMWtMT2xiby9FMGtFem5xRTJwd1pZUThJdFBEZGQ4eDJXajgzdjNs?=
 =?utf-8?B?QWRiK09HRzcvRTI4a3JkdUxJVVYyUFlhYmRSWW15ZEFlcGI4ZVhjRWZWQzRM?=
 =?utf-8?B?OExlS1U3OGJyTHUzaHlBRlh1bklra0JyNFhDUm03QldtWDAzZlpud2VGQks1?=
 =?utf-8?B?a0FpNStDaFlQSHRqeG9HWitzNmZ5M2V0akFXbVVvT2hHRjBwdWJFWXk4ODc0?=
 =?utf-8?B?RmN5QTlGUHZ4VlhKOWVNeTJqNHU3d0JXR1hVcjl4MjduNFVuTm5mQnpEQTBt?=
 =?utf-8?B?aFRDMVY4WDJuS25xOU5pSjJmd0tBSkM2MXFSSmhUN2lLbmMwT016L0pYam5w?=
 =?utf-8?Q?9Uq59/nB7V+nT?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11200.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6594
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:257::18];domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5bdce8b6-1e70-4732-7684-08dd776691ac
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|376014|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXJibWRtZXBZWkJkY0VFQ2JLZURiOFBnd3ZJY3F0Q0tiNTFaZ0dRUEFkWXJ6?=
 =?utf-8?B?MCtDeDVDTngwc29QTGxOR0hTcmZrMDlQQVIyeWpVNG00NnZEOEVPYUgrdUYy?=
 =?utf-8?B?QXk3YW9MWk40SHRXY0NnaEU1Q0RjV3ZoWExpZS9WVlVxMk1pNHpXRG5KbVlS?=
 =?utf-8?B?Nm14ZGpxVzZNWlRERnp0SWF5RUM3RCtPYXVZbXJ4YVkvNUhGc0pUYXlnQ2VZ?=
 =?utf-8?B?MVRleTNZa2Y4TVB3SjhlTkVXNHJHakcyVHorQlVrQXRZNVpQRCtuK2k0RGVC?=
 =?utf-8?B?MG1tQ1F0djZZcFE0ai9OVVlYUU5rVlZycklKdXlHZmwyRHRVTk1EWXFXM3g1?=
 =?utf-8?B?SWtQVUQxUXFiUDBHblZzVXIrbnFOYVFRN2NtWFZ5S3hlQnJoRDFMK0JqWFhu?=
 =?utf-8?B?QjBHRm5RTUw5aXdobWdQRmIrTG4yMGxIVmpsbTFudExwUFRlT3NndHF2Yk9x?=
 =?utf-8?B?REFHakZya0tiYVN3SnFFNDZkTlZvdG8vNmZYM2pEOHMvSklwNjd3RndacmlP?=
 =?utf-8?B?Z3cyazZSUXlsSnpBWG5QUXJUWWwzc1lramVCemxrbGsxbW91aWJRbFBpbXFr?=
 =?utf-8?B?Sk5yWUJ0eVhhMTRVV3J2NXZ5WWF0ZmtFdWM4ei9QdlFZRzlNYzR5eS9FOE13?=
 =?utf-8?B?WXJCdlBNdUlYcGphVzkrZ0xaNG96eG94WURpdjNwS1N1REE5b25UTHJjWFB2?=
 =?utf-8?B?K3NDeE5DOGJjQ0p5R21pc2hUZzI3RXVrblZQd0JEbDF1QnZDU2FaMTdCdW82?=
 =?utf-8?B?Z21neEhYNFdtTVZ6OVBuY2dwVmtuSFhoVjFNY0NMU2tvYUtzLy9Jd3BkbVF2?=
 =?utf-8?B?YnVGUFNndUVnY2lIQlhEQmVVbmFaTW9nbFFBczUzQk5VeC9vNHpBQ09Qbm05?=
 =?utf-8?B?UXdaTkY4SDM5U2RyRVZxMWpWTkhNOTJWTFJDdTJpbkZYSXZjK2NiQ2t0dW1a?=
 =?utf-8?B?UXZGSko0a0JMTEFzSkFad25hYlNEdGdzNVJIQUZmeW00bWZuVTByYXBDeURB?=
 =?utf-8?B?QjVCYjRPQmQvcURrLzdGSWJ5WG8wK3JwWFo1Y213MnZzblAzVEw1YmxjNmZl?=
 =?utf-8?B?N0hBMVJMcFIvNTVRb2VSTUtyNmlHbTBRUWJNejYxL0Q0aHJjNGZZdTVXV2VZ?=
 =?utf-8?B?cWIvemJ2eTlGeFBNdDJUZXV3SVhJVDhXMnZkZGN6SlN5UDNqUE5hTWt1ZjBw?=
 =?utf-8?B?RWV2YjVKUlpYeDBLZkk4S1IxN2RwNGZqcCtXRUpSRGdIejU0NkJWSmRsNnVJ?=
 =?utf-8?B?YUxRZGlMYVQzMnh5cVZxR1NtOHdMcW5DanpBWFF1cWdjK210YUJyRnBTZkxi?=
 =?utf-8?B?OUlXVmhZdjVLVEdWamtMTk92Sy84K3NTcjh6TG1odDlselhRYXk3U0pnR21Y?=
 =?utf-8?B?NHdrM0VWLzFzMG9BVEgyR0FKdXFVMlhJeWdVcmUvL1R6bjdUdEJRYkNtTmhK?=
 =?utf-8?B?bnlmSy9PS3IvenlyU2o0cEgxTHdKbnljS0t6ZEkwTVd3RTVhdUpuWFI1bkhG?=
 =?utf-8?B?V29YV0plZGN2bjZMeWNuR1V4R3kyRU5pL3Fic3NYMk5sNloxNjNjVTJJZ1px?=
 =?utf-8?B?WGFaSEVUVkp1dmJ5YTlIcVBuMjZYeUx2WW5kRTJSLy8zakpDL05QRHBxa25N?=
 =?utf-8?B?bjcyUldmczZsbVlMWUl5V2w3MnBsYVk0eElrbWE0N3R3Qzh5VGt2aGVHbGRB?=
 =?utf-8?B?aVpnalY3Mkl6Q21TQlYwdWVBSENERVhuWk5rbXA1UlFLWnNVTUgvOTRHRWk2?=
 =?utf-8?B?S3d0TmZ0SGg5TVU0UXdRKyt0RDlES2k0ejBubllVc2tKbExzWTBldTBFYnZn?=
 =?utf-8?B?bm9URGFSS0dkQ2FmeGdGRVpDN1BNWHlqUnRISjdqeUdVNitvUDFqWURaREhB?=
 =?utf-8?B?SDFnU05tOEJDU1hRdFZWZWNHWkVLeDBMbVkzeG1sMGVnTE4rZk5oL3pCYlBx?=
 =?utf-8?B?NnJ2eGR6RVVTMk1kUG1IV0t2UFJHaDdLT0ZRM0FsN2pISmJlS0s3ekZaNTlv?=
 =?utf-8?B?K25uaHZWWk5VT0tLT0VGWi9mczdRUHRVNUN2akFJZ2tYM24yTEdOcDZCNzh1?=
 =?utf-8?Q?GAf7Zu?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(376014)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 13:01:07.2525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5618ed1e-f164-4717-57b1-08dd776697be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5590

On 21/03/2025 07:48, Boris Brezillon wrote:
> On Thu, 20 Mar 2025 11:17:33 +0000
> Karunika Choo <karunika.choo@arm.com> wrote:
>
>> This patch adds 64-bit register accessors to simplify register access in
>> Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_regs.h | 55 ++++++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h
b/drivers/gpu/drm/panthor/panthor_regs.h
>> index 42dc3fedb0d4..7ec4a1d04e20 100644
>> --- a/drivers/gpu/drm/panthor/panthor_regs.h
>> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
>> @@ -238,4 +238,59 @@
>>  #define gpu_read(dev, reg) \
>>  	readl((dev)->iomem + (reg))
>>
>> +#define gpu_read_relaxed(dev, reg) readl_relaxed((dev)->iomem + (reg))
>> +
>> +#define gpu_write64(dev, reg, data)                            \
>> +	do {                                                   \
>> +		u64 __val = (u64)(data);                       \
>> +		gpu_write(dev, reg, lower_32_bits(__val));     \
>> +		gpu_write(dev, reg + 4, upper_32_bits(__val)); \
>> +	} while (0)
>
> We're not doing funky name concatenation in these macros, so I'd rather
> have them defined as static inline funcs in panthor_device.h. We
> probably want to move the gpu_read/write definitions there as well if
> we do that.

I see where you're coming from, and it makes sense. I was thinking it
might be better to keep it in panthor_regs.h since that's the file we
include when accessing GPU registers. That said, we could certainly
convert them to static inline functions if you prefer.

>> +
>> +#define gpu_read64(dev, reg) \
>> +	(gpu_read(dev, reg) | ((u64)gpu_read(dev, reg + 4) << 32))
>> +
>> +#define gpu_read64_relaxed(dev, reg)  \
>> +	(gpu_read_relaxed(dev, reg) | \
>> +	 ((u64)gpu_read_relaxed(dev, reg + 4) << 32))
>> +
>> +#define gpu_read64_sync(dev, reg)                     \
>> +	({                                            \
>> +		u32 lo, hi1, hi2;                     \
>> +		do {                                  \
>> +			hi1 = gpu_read(dev, reg + 4); \
>> +			lo = gpu_read(dev, reg);      \
>> +			hi2 = gpu_read(dev, reg + 4); \
>> +		} while (hi1 != hi2);                 \
>> +		lo | ((u64)hi2 << 32);                \
>> +	})
>
> I would name that one gpu_read64_counter and make it a static inline
> function. Note that we already have panthor_gpu_read_64bit_counter()
> which does the same thing, so maybe move it there and rename it along
> the way.

Happy to rename this to gpu_read64_counter in v3, if you're okay with
us keeping the macros/functions in this file.

Kind regards,
Karunika

>> +
>> +#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us,
timeout_us)    \
>> +	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false, \
>> +			  dev, reg)
>> +
>> +#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us,
       \
>> +				     timeout_us)                            \
>> +	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us, \
>> +				 false, dev, reg)
>> +
>> +#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us,
timeout_us)    \
>> +	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false, \
>> +			  dev, reg)
>> +
>> +#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond,
delay_us,         \
>> +				       timeout_us)                            \
>> +	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us, \
>> +				 false, dev, reg)
>> +
>> +#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond,
delay_us, \
>> +					     timeout_us)                    \
>> +	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,     \
>> +				 timeout_us, false, dev, reg)
>> +
>> +#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond,
delay_us,         \
>> +					timeout_us)                            \
>> +	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us,
timeout_us, \
>> +			  false, dev, reg)
>> +
>>  #endif
>
