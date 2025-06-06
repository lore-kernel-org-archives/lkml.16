Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BB91311AC
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.38
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749235691; cv=fail; b=C0nNTDPSisptaIcpshxGQ+kgSZHjPyi/OhX/VGs6oMCcJoiSuDgN/gc95tsqMWnZBQ4xN+poHIhC/3/dYOVlz3dugOL+rZGZI/lfEKONHMMXnSCjafpo3QsL5T7S67KaELFetWhkxt5h7EBQwFdxMDS4FuW9m/8iqRaI/MpWb7Y=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749235691; c=relaxed/simple;
	bh=yVdatzaMnqopy6+8IXnogKV3ILAgDogD3v5EIN62u+c=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aw/PwQIkex2tLEK/MRJnPuImWY4FMyXgf7ZOd1Imf0tcZ2chWiI55pDnDToBGlyHBNECzaaZEeGFwQIo/ljyJZhANtEBA/0tB3a0drfQ7CWSWapnAh6VoEPo3/e4exx2SWf+rvoeIs1DU76KVSyq9EhcwiY/JE48Ko4jGK3Qyv0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aVos9BBO; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aVos9BBO; arc=fail smtp.client-ip=40.107.130.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aVos9BBO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aVos9BBO"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TdgSiUEZlnDoV6CMdNj+20Fn4u+bKRCDNCd6HoXpHcLLmtE3t4z0lRx4A1hGioE5iFezYyNC2GdaVoLyJdX5yai68Hr0juPcfRw9zbJLXaCgaZvogt0JuGfGVvW9Vxg/0wmGjVX5PxR4e8JX8s7AW5LpDD6lOk9/VKry9nv/QsAYVRRsiB1o7Nx4zTQiplf/egvkRd+nL6mx2NKJYigle79d0mvq8/Mwb895ql/MZQ7T0TbP1bpvijg+IHeFR40ZT83F97Q94UXYYQXbKdQfciZkYodaaOkZKKkRCOJOXBrZ12W7iRIJFz6S/Qr/nbVwtSdWV+6SCsZXM91cjgnyZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHr95Vzp9ttLwwRQ9ialukf2ht19iD4Kt+uqBzsrUEk=;
 b=rF8/xVy8thExpynn/Xogo5ueWMElKYvU42fJc5Ab3DdHtyr3xFIeaGabNU8pWnhTbIDbLR9NzT2nq753RbLIw0VU72EQyjJwm6W7XhK2Q/gy3WNBIBbY8H7JNaGE6rBQqtmMRGPlyYQg1k5jNaf7l0zuSlSUGVbDOZO6sca53iyCpauOHvMd+hNiXavSJI0vImFmCribc1n9txsKvRHNSBweHsdixNvMLIqdLGsf3v1dTDA/4zrjJLq43p9PgUt0xHVZPvXqcY8Bq068ZJrfy55aegPTdwMptjoB6jy2SqBFdA5bioAmS/S5Frgl546L/wVzKhvIJ6wjQ+QpgFP6Cg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHr95Vzp9ttLwwRQ9ialukf2ht19iD4Kt+uqBzsrUEk=;
 b=aVos9BBOquKcsxPgNWnMKxYwCX8NW8CzQCpWrY0v/v/c2i16U4dTgoT+OtpiYcTpJcz/QiDL23Yr8bW/+nOT5dpC85sJ8T2IA84i11WvL34ViPxHrwdQUF3MaURuVqFMJM1EKRxj/e2NMT8pXpl676WYeRWuvf9n8w+F2zHUOKI=
Received: from DB8PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:10:a0::26)
 by AS2PR08MB8504.eurprd08.prod.outlook.com (2603:10a6:20b:55f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 18:48:02 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::67) by DB8PR09CA0013.outlook.office365.com
 (2603:10a6:10:a0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Fri,
 6 Jun 2025 18:48:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Fri, 6 Jun 2025 18:48:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s03eK0t+5m59OD3b8EQ7wHrMCEGO59KX5Y1HVZS1gA4tfRYN+7jYAkbgFzicUsrw0wGWXO4QtmGUNWzpmONx+w1NAKFJVymNtcBMg63fyDA3cuWELmKeE9V+Ykl3KQhUJzn+9fZvRFD3LQyIK/qNwq9m6pP8TiUK2vKJlAkYse0/1xUvCpbBl7Tx9+JMDokDStBSQuqP2AvT/Nrdus4keGP+vRBOfl5S/bWYTQ0lXhKC9wW/tiy60cPolq23+wdUl/q7kabV9AMqD1TmdOWU1f+5/X5EDzOA4Qkdq2k7FFK4yj4CPbrfoJVDdR1FmIjQ82exB7XLZFCBseE5XjTt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHr95Vzp9ttLwwRQ9ialukf2ht19iD4Kt+uqBzsrUEk=;
 b=iqwAYM0XA51WqdqqsPIl9oxY3TG+jeifoKDZD7+jEUJnGBw2S6OSugpQNLLPK5BI7cTFLejfF+RU+EPPmAjj9r7oa+r253c4zB3Hz44cAg1pePsFCLnahZJjDInWntaTA+J2uRYA565KfjCR3kXjfmk8ZNCGigr0wzUUB+zjfLL16ZOF8R/sPxqI8naaQR6wpUo0cza0givfUmiIiS7zkx5U6nctXvL5Hdf6HTCtzxGJWJAx7naRsTLoMAAwEcREcHCwrrKDrJML3cm9oGIi9BXJpkj9rXZu7WZvCE8akjtYgqBsZKZi2WlVm7enB2Gsdy9yKjVHFRX20VfUS09Mug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHr95Vzp9ttLwwRQ9ialukf2ht19iD4Kt+uqBzsrUEk=;
 b=aVos9BBOquKcsxPgNWnMKxYwCX8NW8CzQCpWrY0v/v/c2i16U4dTgoT+OtpiYcTpJcz/QiDL23Yr8bW/+nOT5dpC85sJ8T2IA84i11WvL34ViPxHrwdQUF3MaURuVqFMJM1EKRxj/e2NMT8pXpl676WYeRWuvf9n8w+F2zHUOKI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 18:47:28 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 18:47:28 +0000
Message-ID: <e4356d6f-ac7a-40dc-b89d-27031b490fa1@arm.com>
Date: Sat, 7 Jun 2025 00:17:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
From: Dev Jain <dev.jain@arm.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com, david@redhat.com
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <c5ba98b8-a686-4a70-92e3-28d76ce05d1e@arm.com>
Content-Language: en-US
In-Reply-To: <c5ba98b8-a686-4a70-92e3-28d76ce05d1e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::16) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS4PR08MB7429:EE_|DU6PEPF0000B622:EE_|AS2PR08MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: 848e666b-8659-4a21-781c-08dda52aa9e4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OW5yeWhKeW5ycklCdmp6c3V0UTVYWFRPd1A0cSsrTzhCbkRaMVJhRkdvK3NY?=
 =?utf-8?B?RnVLM3k5WlZMS1VNZVExUEpMb3dQNU9laVVFYnZsT3lONDk3azdHWWN3WHJy?=
 =?utf-8?B?UE1vUkdKc0lTMWtTUGt4a2loOFMyWGpIZDV2N2JKNVlyVitoOG81dmxOaTVG?=
 =?utf-8?B?T2xwclNRNStEZVlNMmV6SlJQUGgyK0lHbmtZYlhQK2NFUDlKQ1ZxMER0Nnhu?=
 =?utf-8?B?T3hpSVU4VjdwZ1VKc2JVOHBZeko2OFlXWFM3RnB4MmtGMU41bmpNY3NrY1ow?=
 =?utf-8?B?dG04ZGQ2TU1oUHhBbnJsRG5zYXFZNkYycG56SlBqcU1pTFdhVjhzcTVOQllk?=
 =?utf-8?B?TkhWK09Ub2pNYjNNSmxVR2xPUXFDRmFWYTNnQnRuKytFMzR1NjlaZFIyRXht?=
 =?utf-8?B?NUEzcGFUclZJYzIvVTFVUHFOS1NoL05WNWs0VGpOSGRUNlBqWVpMWm13VVEr?=
 =?utf-8?B?ejNKa3AwMHpMWVZIS1hSSUNDa00vUVJrNDl2cUlrV2dQeTNXNmdSS3FBUHhD?=
 =?utf-8?B?UHB1Unp3QjJMQUN6aTRQYkpwalp0UWhqYTNOOVhlQm1TQ2VzNk5hODdsOGVZ?=
 =?utf-8?B?YWFQZDdsYi9mckxOKzZrZ3pzTXN4VStDbVYvanhsY3Q4RkROWWJ2TUtyUExj?=
 =?utf-8?B?TFJYcUF5bVUwZXBvN0Y4dFEzQ2UweDE3TWsvYUNyTm1EK0k3MVY1a1JOU0Np?=
 =?utf-8?B?MG15eEdIcWRPanlwSlBMQ3E5WUNaTE5ENFU0YkpyU3UwdHVxcFp0ZVVkZklz?=
 =?utf-8?B?eGhPcW1EclVXMFVPaXQ4eTFxRTdVenEzd2VIQ2QzTW9vcU10Z0lETjFEbFNo?=
 =?utf-8?B?R3pWdlJ4ZlAzU2RPdU9ReVFUd2szU3FOT3pGL2ZoL3FoS1kzc3FHSGtrZ2VS?=
 =?utf-8?B?V2FNLzhiUU0yMWhaTXJjTlNGWnBidXhXM0NmVnFObEczZVZSU01FaGptWGVM?=
 =?utf-8?B?Zkd0NGZUeU5ERWVBOUZCamo5QVIxNUJ4bXlLZlJsbDhmN2JQbkNKUVBMWGZP?=
 =?utf-8?B?bVpJeno4UVQ1dGN4Ync4NC9Tc21mRk5xOXFIMzE5OW96VVZiN1RFSnRaK1ly?=
 =?utf-8?B?S3BoZE5BYjJpNXpXMkl3WE1peVFveWJqTEYwTW1lOGxXTFZvYWNtMmNGVU52?=
 =?utf-8?B?bFdZdnpLZmsrRGhEWStaNUlMN0ZsM08zSmpDdGpMWnErVWhwQko4WkdiRXU0?=
 =?utf-8?B?OG5McXB2Rk5kRUE5ZGtGS3dRcmlBcW9rKzFXNXc2am1EcnljZWlpc3dqQ05q?=
 =?utf-8?B?VVE5RXdydlRZSFNGdHBTNXdMbTRBZmZCcTRSend1d2YxOHk3WXIvaFgwTDFh?=
 =?utf-8?B?SnJ3OHNqUExUY0VEamxZQ1d4dk9BR2JhdUJCK3RQaWxNMlVsdS9NY2hqTS9m?=
 =?utf-8?B?Smo1SE9iN0VMcmxkblJxS2c3N2dkMTEzaGlxVnVVY0Y3QzBOenA4WWMrekw1?=
 =?utf-8?B?QWxubkNxVzlQdUJsNUNXQ3FWdUZxVXlBbkhDaEZ5Y0ExMENHSE10R0hUZjEx?=
 =?utf-8?B?TFpWRnR0anpRZklJZElHdnEzNW9md3J6UHY4Tk5BQkMwdVRPZ1ZEamtzd0hF?=
 =?utf-8?B?enlRTEJzOGZtOU9MbWZLUklHdDJRZUczMlNyS2V2SmlqVXBTcjFMRVNtcDY3?=
 =?utf-8?B?RDJ6ajhYRVJtTDYwcDBjbmRTLys1M0djOWFYbHBMOTRmdThXZzdqckdYM3hF?=
 =?utf-8?B?OCtqZ1JNb3NmMStFV09iSGZBeUgzVnFNbXFlcHFxNmVaMjIyUEdNVm1PS3o0?=
 =?utf-8?B?N2VzNlc4RzU1SWJtRUFkSkhTL3RKdFdJNVpyenhneFNvSS9uVUtRdWVRTDBW?=
 =?utf-8?B?eGJxN0ZMODU5NXZHa3krWVpaY09xb05FWnk0RnViaDJES1h5TUFMU3hXYTVD?=
 =?utf-8?B?ZTQ5UzY0OEg1SU9WU3lzWlFBbmNNQkd3cEM2eW15WS9xSkJhNFhiYXJvcU5E?=
 =?utf-8?Q?uu7wEguG+RM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7429
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1f1eb2e-b567-4cb7-fba2-08dda52a95c6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|14060799003|82310400026|36860700013|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkNSaWNrSXZlM21lQ2dRU0VtUnBkT0t0YjRXbXNXTi9kd3pEWVJoMkZFbjdr?=
 =?utf-8?B?TmhQWlVUay84MmFFMGR3RldWUEFIUXcyaXJoSW04R2dqZHJVVGlqM1RlcG9k?=
 =?utf-8?B?ellnTWR3OVIxQlhmaHJtNHN1Z1RPY0w4Tnk1RlpIRHczZjFMRmI1eHUzeGJV?=
 =?utf-8?B?bmZHYmg1R2VKSlNUMEx5bDc3QnNGNkt0QmxlQzZHK0tib045c3BIbUdGMWx5?=
 =?utf-8?B?NnBSZE9DUE5KVXN3djhrZnJoa3pIUHZCeE8xeUVvUXVDN0JXQW16L2FoWHYz?=
 =?utf-8?B?alZBSjduc3lRYXVNU2wzd3VKaklqWndVYjhXN2w5UjRTUUNwMVpMUld0cnl1?=
 =?utf-8?B?THJZWTQ2YVJ6SHpROEg1UFlsZ2h5dmhvOW5vTENyclE4UlZ4c1AyalRZSTVW?=
 =?utf-8?B?OVF0WDlOSDJrWGZ3SmxhQnRUSkVhbEY3cHBKUDBubTV2ajlzVXcwNS9kZlZV?=
 =?utf-8?B?UlBaUC9pN3VkQll5VGNZKzc0ZE15bEQ5M0tTZmY3Q1dhenljakdJakxqajlJ?=
 =?utf-8?B?ODVvd0JORXRrM1d3b0FMZlZRcWxPTG9ITCt2SEdKWENockFDb3BqSWRHSUlH?=
 =?utf-8?B?aCtWNFgzbDVaWWJDQ1NnZGF4eCs4VHhIR0VrRWp2MHlLT05JYThQVnVoTVpE?=
 =?utf-8?B?UXZBeG1HSHBVY1Fkajc5MXdobERZRzM2TWZmNTd0NGxqTlVCNlh5QmFFMU84?=
 =?utf-8?B?OGVNSE9zazZMTHhWOXVFR0ozVndyb3VVQ2Q4TmJNTml1VmxiS0x5TG9RZDB3?=
 =?utf-8?B?L1FyVW1jcjN0a1lMOTExb0tNOHN4Y0hXdVBRQnhYU1RYdVhiVVlQaFpHckFD?=
 =?utf-8?B?Z3BZRzAraEN0a2pBUjFrRkhtaE05U1ZMSTVTWmRCZ2RHQVRlNSt3TGUwVnc0?=
 =?utf-8?B?Sm1xcXlwZ2ZUelRyam92cHF5K3ZkTGordGcrOW0vWWxqcUQ4MnhFWHBUMTIx?=
 =?utf-8?B?T25lMVRSUkM2NUhRTmFrMDIyZEgwS0puU2NGRmJlcDhVNDEyeXlKdTEvT29O?=
 =?utf-8?B?UmlmNFJJUjMzeXlKM2tPbzZTMkNlY0hBL0p6QTdoQlNWSHFkdWEvN1BCYXdK?=
 =?utf-8?B?d1RIL0xqU09CbU1JMms5M25KNGJ6YVJkT3RXWlRwai9DWlJpTHNsTFQ1Znps?=
 =?utf-8?B?d2JVREZWQ25mVFhyZ1NXdWhJMnZiNDFLMFZYdUtVZ0I5MUZsbjZ3Uks3VzU2?=
 =?utf-8?B?d3VybWpZdzN1NlJNYTV5TXorWEc4RWVDM1NvcjZWZ0ZQdEtpK3NTcllsSFQr?=
 =?utf-8?B?Rnd6YXo4RWk0UlBKME0vUEk2WkZqbXpZcnJaMm05RDF1U0NkTFMvRkpTa1Bu?=
 =?utf-8?B?cVVVT1RsbVBkYmFQb2FETVhQNGo3WjdZL2hqZUVmdnpKTExMd1Z4RFgxci9W?=
 =?utf-8?B?T2JFMnI1Z1UzbURabTJrY2krb1FYcVhWSDZBT0JKU2ZPQklMTCtQZjVuRFlS?=
 =?utf-8?B?cUVCM1AxL3JEaXh3TXE4UUptVXVlWkoxcDJLOWtDZ0krbVQyWmdtejdvbzZH?=
 =?utf-8?B?Q285YnRPVUFhUWtSTkZxcWJYVDIzMDdFQ2RmTVVZWVAyeFlveUNHcTJSWXVO?=
 =?utf-8?B?UW0wQzl4UkdPVGZtVjQ0bmJIS0hacEpaaDZOVEt4cVQwM2ZSSDdycGZZd1pw?=
 =?utf-8?B?dXgxam9maW9XNDErcjN4U0s2L0VhdmdLWlRUUjRieWdnRlpGWXd5V0hOVHcz?=
 =?utf-8?B?TXpXUlUyRzNKdDNLemtsNVpjdjd6WXRDZThVT2tZWFV0ZG5KWmVCekFrVHdY?=
 =?utf-8?B?bXhQamd4d0F5Rm9JTzhNbjE1R1NsK3MvZERxQkhDOE9KQmxMa2dKRXI1QmRX?=
 =?utf-8?B?L2M0ODhML2V4VVBxK3o2SlJ4UUM0VmczZzF2YkJvNElBcitncUhUTHBGeCt3?=
 =?utf-8?B?ano2ejlZOGowbG1kckpwNWpmbVhTeUduQWtNK1dWZWVhVnRUcWxQN2RWdTM4?=
 =?utf-8?B?alVjZXNjQ3hPN0tvWGJoeDRINCtRSDM2K2VoWGJCWlBtanNOd25tb2REN0xB?=
 =?utf-8?B?QjBiU2lrak1GOVJKZUVVVDhLMVFDckVMbDFaem9wemlremIvMDJnWnRsSS8w?=
 =?utf-8?Q?DQ49En?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(14060799003)(82310400026)(36860700013)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 18:48:01.2959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 848e666b-8659-4a21-781c-08dda52aa9e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8504


On 06/06/25 10:19 pm, Dev Jain wrote:
>
> On 05/06/25 1:30 pm, Baolin Wang wrote:
>> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs 
>> settings, which
>> means that even though we have disabled the Anon THP configuration, 
>> MADV_COLLAPSE
>> will still attempt to collapse into a Anon THP. This violates the 
>> rule we have
>> agreed upon: never means never.
>>
>> Another rule for madvise, referring to David's suggestion: “allowing 
>> for collapsing
>> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>>
>> To address this issue, should check whether the Anon THP 
>> configuration is disabled
>> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag 
>> is set.
>
> Did you mean to say "even when the TVA_ENFORCE_SYSFS flag is *not* 
> set"? Because if
> is set, then we have to check the anon THP sysfs config.

Otherwise the patch itself looks good to me, so:

Reviewed-by: Dev Jain <dev.jain@arm.com>


>
>>
>> In summary, the current strategy is:
>>
>> 1. If always & orders == 0, and madvise & orders == 0, and 
>> hugepage_global_enabled() == false
>> (global THP settings are not enabled), it means mTHP of that orders 
>> are prohibited
>> from being used, then madvise_collapse() is forbidden for that orders.
>>
>> 2. If always & orders == 0, and madvise & orders == 0, and 
>> hugepage_global_enabled() == true
>> (global THP settings are enabled), and inherit & orders == 0, it 
>> means mTHP of that
>> orders are still prohibited from being used, thus madvise_collapse() 
>> is not allowed
>> for that orders.
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   include/linux/huge_mm.h | 23 +++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index 2f190c90192d..199ddc9f04a1 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct 
>> vm_area_struct *vma,
>>                          unsigned long orders)
>>   {
>>       /* Optimization to check if required orders are enabled early. */
>> -    if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
>> -        unsigned long mask = READ_ONCE(huge_anon_orders_always);
>> +    if (vma_is_anonymous(vma)) {
>> +        unsigned long always = READ_ONCE(huge_anon_orders_always);
>> +        unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>> +        unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
>> +        unsigned long mask = always | madvise;
>> +
>> +        /*
>> +         * If the system-wide THP/mTHP sysfs settings are disabled,
>> +         * then we should never allow hugepages.
>> +         */
>> +        if (!(mask & orders) && !(hugepage_global_enabled() && 
>> (inherit & orders)))
>> +            return 0;
>> +
>> +        if (!(tva_flags & TVA_ENFORCE_SYSFS))
>> +            goto skip;
>>   +        mask = always;
>>           if (vm_flags & VM_HUGEPAGE)
>> -            mask |= READ_ONCE(huge_anon_orders_madvise);
>> +            mask |= madvise;
>>           if (hugepage_global_always() ||
>>               ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
>> -            mask |= READ_ONCE(huge_anon_orders_inherit);
>> +            mask |= inherit;
>>             orders &= mask;
>>           if (!orders)
>>               return 0;
>>       }
>>   +skip:
>>       return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, 
>> orders);
>>   }
>
