Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D7F1DE3DB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750132823; cv=fail; b=RCv6NNl0OhK5IPidkyCFh7OGgBPm6VIH6zf3NKHMMDV6IZ2XZ0OKOQnpCWVba5LP6RG9IkdrWUUI0BNgfYcxbICjqJn3ISGvymUX+xsHt6Las1dL+ZptEMncpaHu1noSVrCheEqmjxqPLHCEggcaHpIwDnUWM4MxizI7N88iva4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750132823; c=relaxed/simple;
	bh=Him5d73fvUHjWKlrqyCo1cAvoVX/NX+vb3ZZUa4DNiU=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q9AQd/FP90RilD7MvKio8xBZqRBuGfcmFfJZwrg8zZm2BVtuMp2ovWMCzQdP4SnrErRdLcctfQffpPpQJbgdE/JLtLfKRHqVAw0gVSmyhYy470WkRLeHjkWgyzPY53SnL5cceYOIFDyyxY8UcjYgT+RfJ3732hbLHwkSNDoLjcg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aTHx1krQ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aTHx1krQ; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aTHx1krQ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aTHx1krQ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e/AWbJ8L4S1bWsjawQ5uYhD9vI4kAtd1C1Olk3fi8tl32etJU8JijhfTZU4WdEsh14KY2z/eE4aYwiXAaWMBdFENq/jrnDzfG04vCcua1+O2keQG2j/2UolPVNgH/8ZtkE3Hg/V09X5NpktCxyZWPbdqCFX+790LQwx5jeWKaHu7xhj4meIEZ0dvx0K66uE1pmuN+hZSdJFGmeYWe67ROrkatis8D0tmZAiuMH/kQOe3Rh+lQS4qJUBOytU0BquWxpPZnhqPwUssAOqxhJC31hbAn/lT/2+0HYL2JUzh+KCOPQlCHZD7T3NLL/30CPCZKg0duq0B7ykdP82pB4sxUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIdCQK35RJHgVN1yf3LFfh9EjuJ+1YfPwnyXH9810JY=;
 b=vQ5wc9G3AQQNUQumwO+IkyiHABtf1vJklRrVPlVC/Bf4VCMSp2RupSChqxkz19+pQhxbAYXZNe33iU0b5sv2KbVthxtr0HhQTDzv5E/0b2UzK8WXaQcC21owpnAP58Je2pRDWJ4o+MhzGeK2WDRM2tF6FjPuyqP4KZnuOZkcS/XIN0PJeH5F0RQgAz9T/+NTPPwPlusBS+y90NE7qG7z07R4Plv9U0W5ASy79tv62uzjmgMHqZMpAsBkHCb+xPmE2OKv3Segk9Va6uMc7DgeCqGcoEVKyBpNs0vmnsT79k40Uyoa1xm6n5U0U4IZn5KkSrQl+UZNe1TuxoRSvJ1XQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIdCQK35RJHgVN1yf3LFfh9EjuJ+1YfPwnyXH9810JY=;
 b=aTHx1krQz/3d5NZWNVZAY765U5lnpSwFtwpAYnGHhgkTRdlGdP2GrmHpdiRaHTUSdFcLolLyPNQExsGwqNrFdJ3gQ2PHATop/V/c6sJkj7mAmij4mejhQzVZ0mifBJnSGQfY1u5UZ2LrRLnle+TNWpQCiVXLz2A/66IvjmaSeos=
Received: from DUZPR01CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::7) by GV1PR08MB8744.eurprd08.prod.outlook.com
 (2603:10a6:150:3d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 04:00:12 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::c8) by DUZPR01CA0076.outlook.office365.com
 (2603:10a6:10:46a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.26 via Frontend Transport; Tue,
 17 Jun 2025 04:00:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 04:00:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMKHIdv37QKi++YU9Kc5dnS/1HDjt6aHg+vgpKj6UHYJnxL2NqQV0lFIr5YjRZ1g2LpXYCMK9NyAAOH3IOUh5HIFqUKyAVkjRIzpFnpZG7xssRGxo2zOhO6oDEICFAA6YWo4zmH20fXqsyzIXUKcjddVasnPpVl7aNDO+e0pe6xEbZkRBDsVIehvoJBQ1KmAdtdLWEyDyq7+1kts6jEYl2QDepKtuPV7wk7g079gEEq8PjxWJWrxDSfGWacuErelLXjUhTbOgowHKwrvNb+ySH4p0qb2Uhnu9relEqSijDbYMi/NAjOg7Ka2Tf1gu2WTxM2D1qPFDxk5QHNBnuAPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIdCQK35RJHgVN1yf3LFfh9EjuJ+1YfPwnyXH9810JY=;
 b=cyBXhZluCUNl3aLL6nzGh0gd0Kkoon2uCJCg8ylZOjkisAwYXYHyxHRAUQ/2AAYlixV3SRi+cWw8Lcqd9hwBltBCmu5l9HW6ktCIjJluFrDzaTAPCuRq30Ohq27pgFLCITPoHS8WG3nQc7xkP+cP1hDTDqRPEYjfNMQIxQefc5msqsPHUxa75vNFpqIqfrjYskBOiXUMKanrCBCP8ecQ44uRISq6hF4HHkqNfGTEkquL5+9/UxbAqU5pLxdUsJ762v6jQV6x+zPS90T8EgudvCm5hSFUH6wCXFsf/5t5EacpgJSxpz2cz7y3zOl9yDKAiwRzUuN6vMMD1bfyTo+VZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIdCQK35RJHgVN1yf3LFfh9EjuJ+1YfPwnyXH9810JY=;
 b=aTHx1krQz/3d5NZWNVZAY765U5lnpSwFtwpAYnGHhgkTRdlGdP2GrmHpdiRaHTUSdFcLolLyPNQExsGwqNrFdJ3gQ2PHATop/V/c6sJkj7mAmij4mejhQzVZ0mifBJnSGQfY1u5UZ2LrRLnle+TNWpQCiVXLz2A/66IvjmaSeos=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB3PR08MB9010.eurprd08.prod.outlook.com (2603:10a6:10:42b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 17 Jun
 2025 03:59:39 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 03:59:39 +0000
Message-ID: <ec8a398c-727c-420a-9110-5362ce35f786@arm.com>
Date: Tue, 17 Jun 2025 09:29:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
From: Dev Jain <dev.jain@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
 <5f7b0a4d-fb3f-43bc-9f2a-3951222cfff2@arm.com>
Content-Language: en-US
In-Reply-To: <5f7b0a4d-fb3f-43bc-9f2a-3951222cfff2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB3PR08MB9010:EE_|DB1PEPF00039230:EE_|GV1PR08MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 3462a143-5f3f-440f-c9d9-08ddad537551
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?R3ZsU2kwMnNUVHN6Q2lLaVdYNHl3WkU3MlZ4SzJaUTc4QU1kRmF6OEpFL2kv?=
 =?utf-8?B?VUF1TytUU3o4am5DckFjRjMvbTNsTjNkbU81S0dwMUhQTFU4TmZ5Uyt2WVZ5?=
 =?utf-8?B?dlppNTExQVA1QnFBQzNrZlcvNTc4ZTM3a25NdzJnTmFYWUlPYXF0V3FkK2Ns?=
 =?utf-8?B?RU54UEFOTkxUSjJTM0E2NFN2ZEJDOXE5RUYxb2t1Um0yeUZQbWhXOG85Tm9Y?=
 =?utf-8?B?ZlR5VUFJNjN2bDlKWGlyZFF0SmlqWk5YT0hZMUpVUVZlQ0RYNUlLUmVxdmxZ?=
 =?utf-8?B?Y2sxU25KUlhTY2ZRSkJrd2w1VmNmMWR1Wk4zeklVRzlxN2UrN3BPS09VZnA4?=
 =?utf-8?B?RjBRalJLOXVhS09tci8xYUF3TFZvK1VKMVhCRW5jSGkySFBuSTRCanZtenFy?=
 =?utf-8?B?aHZLOFo3aXF3SVpYYzJVUExFWmxaMTlxaWprVkJ2a3AyRlpTb1JpTGxJRWdt?=
 =?utf-8?B?aUJEdjFiZFBGNnRuWituek16VytLSXM1ZDZURDY0Vkthdi80RWRoWmhyQkFh?=
 =?utf-8?B?YTBqZGk3Ulo0RVl4ZlZrQmJGZnMxL2hOMVZXUndJWk4wQlMveXRSNC95VXM2?=
 =?utf-8?B?WlpmVGJxK0hhQlhuVWxmQmQ2cGx3Qk8wUHhjNTRiMURPcnFvTnhWK1hRUDZy?=
 =?utf-8?B?dmhuSjFiL2ZGZlNWY0I0MFhET20wU2c3VXJ5MVU3Sm1MN0lpb2dqY1hXMXdo?=
 =?utf-8?B?SlBVdlVGWXF6bWJLK1ovRk9ka2FhdW5NYnBzZDVzbjNQQXZpM1hjTmN0WTU5?=
 =?utf-8?B?S2xaMnQzeStFL25rVE81bVpMdUFpR3UwcDc2Ylgvek1GQ3M4WEE4Z1M5ZlZW?=
 =?utf-8?B?alo5WS9TbDVhVjJpMUQvdlhXcGxRa2JrNGJTc2pKOHdoRWVac2VnSWlQd01q?=
 =?utf-8?B?TzZwR05YUUpRdUNLd3ZTQlBEMGJvTUlPdVJuUEh4Umw1blVVUm1uQ09LajVt?=
 =?utf-8?B?SER0bHJqMERoaDdDcmxVdnExeVVpT3AxcDJlamJLMGlwMStXVDlvR2QvOE40?=
 =?utf-8?B?Nnh3WHpjemRHWWdvZVVLckF5ejRPU2NmN2lDQkc3eHJqaTJUU0QrZ3BxcSs1?=
 =?utf-8?B?Ym13NjRjUTM5bnNkZG1RVmhhT21CRThYYUdMdFNlZGR6aDlYTkNzVVM5R2Fa?=
 =?utf-8?B?NUxabzNhMHROdVVvUXJxYkRGNHVmdUwzTE9URThER0JRZWthNjBudktubDNi?=
 =?utf-8?B?dlFZenlEazVydWFqeXN6b0FTcVV1U1E4RklsMHdLaWkxRG5STnZuTEdZSDRZ?=
 =?utf-8?B?VUEzdjhWcm5Ba1JhcG1SSGRudkFFWHFRdmFWVWtXdG1uYSs2QktDdWZXZC9Y?=
 =?utf-8?B?dW1CYUdlUk5XRmgydmNwdzhWVll4anBVOUkzVSttbEJXWjZZSjgzNVVMbWJR?=
 =?utf-8?B?SFc1Q3NSNHI1RnZXc0k5aGlWZzJWMjYrOXJ4RzFURlZ2OC9yUzFTYmp6Y0tC?=
 =?utf-8?B?c3dGTmVYNTJUeGgwdDIrc25MSTZVcGdwOW9Yc20vVmFreERjbFd2VU5hVTR6?=
 =?utf-8?B?VzN4L0dRcmM1ZXVtZmpYbkQrTHBtdDJVdGJuTmFoRGZWc01YRWNXckx2OURH?=
 =?utf-8?B?K29NM28vWHFYbkhUSmhnT1NSNWZpelpKUlg4aVNnOUxEWEFIbTFUL3p5TjRt?=
 =?utf-8?B?dStGK1NXcDZ3TUFuSVR0REtld2h1NEpxcHdGbTU5ZEwxWHUvUzVGVUxuaHFM?=
 =?utf-8?B?RENjUmZRcFdKUTI1RWt5Z1BUUHFHb3lPRGZNNHlVQkRVUWk5Ly9CRC8yeW1L?=
 =?utf-8?B?QjhDemZhWGluREh0Z3RhKzkvZit3c3ZCSnMxbTNlMVBGK04zVkp4d202Vllt?=
 =?utf-8?B?aElkcWhFTFVBSzI3L1RGQUIzbFFmb1hMWjVlczFqNFVoM21zODJvbGcxNWJj?=
 =?utf-8?B?bHZFYk40N3g4d2xnN252Tmw5UG9xVThtaFN4a2lVK050RzBrdW5tRHNhV1FW?=
 =?utf-8?Q?HVfk9DsGAlU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9010
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	661ea080-0f25-4390-24db-08ddad53619f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|82310400026|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlpxenNkNGRiQTQraVZaZEZEOUI2SVRZNndCb1pRMlNXTTdjaUVIVFdBK0Y3?=
 =?utf-8?B?SWlnUjRtZ3hrWUhoTzdGdDg4eVh4Tlp4bUFGSGNvcUc4T0lYdVR5YW1Vc2N4?=
 =?utf-8?B?UXlDYjdud00wZmh3RWp6WGw1UXlrQmhJTEhJNjNRc2lFb3IzU21tVFdrZVox?=
 =?utf-8?B?a08xclZxd08xMWZNYmxsQ0RJTTZYZzRJMTBQQnJvc05oZjY1bm1LeXg0M2tv?=
 =?utf-8?B?UUYxS0FzdlpBOUp4alpMZGpoeFJ0U0xrWlQ0OWNLSmNuQVpIdURkSDJsOUww?=
 =?utf-8?B?TS82MjRWV3ZOc0NFMEFQTkpCa0pvaTU0bXJhOW5RTzQ1T00vOXZlNDh0NjNI?=
 =?utf-8?B?S1lJT1V5b3FBZ1NCdzA4YTU5OGRJUTJteThmNkhWRGMzeGJYOVZPNzR6VmRu?=
 =?utf-8?B?VnRBcEFMbEdsVDdOZU92UnpBWlZIcE9YWENYZzdNRUQ0TDB5YkhJUUUwZ3k5?=
 =?utf-8?B?WWc3RCtvS3M3RHlOTk1ldG9sN0xLOTk1bVZ0SUs4U0RIMmduSjR0bWFmc2l2?=
 =?utf-8?B?R0tkOThZVnJLVlhLYkNBdmxMbkVvdFFLQnhVSHdHZzByMlhsdlZTc3JCekpH?=
 =?utf-8?B?R2dpT2laNkcxM3cvOWhUOGpMVUd4dlNWOHNJc290emFOa3puaUhhYWkwdEE0?=
 =?utf-8?B?aUR6QTAwRUhpTmYzVkVuUjVjV3NReTBuMThBeFN5K21mWTVzWkJVTjc1ejkz?=
 =?utf-8?B?bnBzSGVES3hyK3NnRzRRWjJoM0F1Ujc3ajg3VTV4ZWNzZWp3NnNEUm9BaW9K?=
 =?utf-8?B?ajZ3OGNNbURHb29UMG8wSlplRnlmS3VjS1JIUkZjdUlrQ01seGhzQmQ4SlFB?=
 =?utf-8?B?MDlQa2hSdlNmT0gvdnkzcVB3YnRFYlkrYm5ZUmpDTkxRM051dmwrTEpML2lK?=
 =?utf-8?B?R01mRVJwVG9YNHZveWNlb2o0TDJzaVM3SzdWc0c0RWtOS0lObFpHbFVXQmtQ?=
 =?utf-8?B?a0ZpbVlaWXBnYUNLQnc1ZUVsdXJUbnZlM3hJUVdVSGJrM3ozOExtK1BMZ2hK?=
 =?utf-8?B?R2VSRk8xbEM4VXF5dk1BVlIwbVRZZkVBd2JWNDNHSGR2cU1PMzl1b3BWT1pI?=
 =?utf-8?B?RXRNM09QNnZlN29uUjZvRXFjdGFnUWkzbWwxUllNeGhaSXV1eWxpR05nK1JJ?=
 =?utf-8?B?WHBxaU01MVRyUnFkWUJqazB1T2t6cE5ZTXo0MkFWd3g2Z1RtTnIzcWJua1pU?=
 =?utf-8?B?RURGV3hHZWtEY01VMFdTQStxNEpsTmNhOFk4ZXFKUEJDQUhZMlFRT1puU2dR?=
 =?utf-8?B?clpoaDZKZkVqd3NaVXRrdWVZeDBsYzBUZnN0eTJkQy9Cc0h2eGcwdHM0ejhw?=
 =?utf-8?B?ZXg1MWViYk9ZQTFJNWMxUkFRUFFnZHhOY3k0SUZKZThYS2V5aXlLSGlZcTN5?=
 =?utf-8?B?VXdrYlJyZ2FQcTBTN25WVkFUQmh2OTNlTXp2SitNYXB4Y2ZrV0ljaCtsVGpQ?=
 =?utf-8?B?NWgrdHpRVkdKdU9yWldXOXFLbGF4VVpBenREM3l4c2xtcjR6dUZaZzh4Yy8v?=
 =?utf-8?B?L3JxcVlYbXhoMzJleVNOdFBYejlicWY1R0Q3QkdPY1FCMk52TWJYOHI5emZw?=
 =?utf-8?B?SHdQZnQ0emhtb1l6RHlGRE9YTVN4dGQxaEZKbytHSDBrSE11QWJzRzhUeEpz?=
 =?utf-8?B?cXpyK0QwcE81ZnNpWjlFRUJheHo2UmxSTklPb0laVTlBZityYm5kMk0vdkN1?=
 =?utf-8?B?TkxkRVJrTklyaStNZ2VmYmYzbHU1Nm85RHM1c3I2TEZQY0orQ2kxQTVHdlRI?=
 =?utf-8?B?SnFTTmQxbmJwb1VKWHE1QVM1bUZzbStvMGhyY3YzMEVjcFZwQTJUQ0puTlov?=
 =?utf-8?B?MEVxWXMyKzJrdVFFektjS1VWZVUzcmJSWFlOY1RnNFJ2S3pSdndDb2p1WTdM?=
 =?utf-8?B?ajd6ckF1Qm9ONGZaK0FZN0hya1Eyby90SVhsTE5rbUV2L2s2Y0YwS21ZQnZQ?=
 =?utf-8?B?WmhaYkt2ZWhXNUxNVFdySnhVZkVHRjg4V3hObzhYSEFjMmdnNmFiQkZvZm1V?=
 =?utf-8?B?R0ZMdC80dlVZUXV3dW9UL01yVCt0RXJnSkpIdWhBeXM5ci9ncGs5QXAyNmhZ?=
 =?utf-8?Q?F4ELUm?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(82310400026)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:00:11.7591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3462a143-5f3f-440f-c9d9-08ddad537551
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8744


On 17/06/25 8:24 am, Dev Jain wrote:
>
> On 16/06/25 11:37 pm, Ryan Roberts wrote:
>> On 16/06/2025 11:33, Dev Jain wrote:
>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>> because an intermediate table may be removed, potentially causing the
>>> ptdump code to dereference an invalid address. We want to be able to
>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>> enable vmalloc-huge with ptdump, synchronize between page table 
>>> removal in
>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable 
>>> walking. We
>>> use mmap_read_lock and not write lock because we don't need to 
>>> synchronize
>>> between two different vm_structs; two vmalloc objects running this same
>>> code path will point to different page tables, hence there is no race.
>>>
>>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking 
>>> the lock
>>> 512 times again via pmd_free_pte_page().
>>>
>>> We implement the locking mechanism using static keys, since the chance
>>> of a race is very small. Observe that the synchronization is needed
>>> to avoid the following race:
>>>
>>> CPU1                            CPU2
>>>                         take reference of PMD table
>>> pud_clear()
>>> pte_free_kernel()
>>>                         walk freed PMD table
>>>
>>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>>
>>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>>> we are safe. If not, then the patched-in read and write locks help us
>>> avoid the race.
>>>
>>> To implement the mechanism, we need the static key access from mmu.c 
>>> and
>>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>>> target in the Makefile, therefore we cannot initialize the key 
>>> there, as
>>> is being done, for example, in the static key implementation of
>>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>>> the jump_label mechanism. Declare the key there and define the key 
>>> to false
>>> in mmu.c.
>>>
>>> No issues were observed with mm-selftests. No issues were observed 
>>> while
>>> parallelly running test_vmalloc.sh and dumping the kernel pagetable 
>>> through
>>> sysfs in a loop.
>>>
>>> v2->v3:
>>>   - Use static key mechanism
>>>
>>> v1->v2:
>>>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid 
>>> taking
>>>     the lock 512 times again via pmd_free_pte_page()
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>   arch/arm64/include/asm/cpufeature.h |  1 +
>>>   arch/arm64/mm/mmu.c                 | 51 
>>> ++++++++++++++++++++++++++---
>>>   arch/arm64/mm/ptdump.c              |  5 +++
>>>   3 files changed, 53 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/cpufeature.h 
>>> b/arch/arm64/include/asm/cpufeature.h
>>> index c4326f1cb917..3e386563b587 100644
>>> --- a/arch/arm64/include/asm/cpufeature.h
>>> +++ b/arch/arm64/include/asm/cpufeature.h
>>> @@ -26,6 +26,7 @@
>>>   #include <linux/kernel.h>
>>>   #include <linux/cpumask.h>
>>>   +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
>>>   /*
>>>    * CPU feature register tracking
>>>    *
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 8fcf59ba39db..e242ba428820 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -41,11 +41,14 @@
>>>   #include <asm/tlbflush.h>
>>>   #include <asm/pgalloc.h>
>>>   #include <asm/kfence.h>
>>> +#include <asm/cpufeature.h>
>>>     #define NO_BLOCK_MAPPINGS    BIT(0)
>>>   #define NO_CONT_MAPPINGS    BIT(1)
>>>   #define NO_EXEC_MAPPINGS    BIT(2)    /* assumes FEAT_HPDS is not 
>>> used */
>>>   +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
>>> +
>>>   enum pgtable_type {
>>>       TABLE_PTE,
>>>       TABLE_PMD,
>>> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
>>>       return 1;
>>>   }
>>>   -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, 
>>> bool lock)
>>>   {
>>> +    bool lock_taken = false;
>>>       pte_t *table;
>>>       pmd_t pmd;
>>>   @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, 
>>> unsigned long addr)
>>>           return 1;
>>>       }
>>>   +    /* See comment in pud_free_pmd_page for static key logic */
>>>       table = pte_offset_kernel(pmdp, addr);
>>>       pmd_clear(pmdp);
>>>       __flush_tlb_kernel_pgtable(addr);
>>> +    if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>>> +        mmap_read_lock(&init_mm);
>>> +        lock_taken = true;
>>> +    }
>>> +    if (unlikely(lock_taken))
>>> +        mmap_read_unlock(&init_mm);
>>> +
>>>       pte_free_kernel(NULL, table);
>>>       return 1;
>>>   }
>>>   +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>> +{
>>> +    return __pmd_free_pte_page(pmdp, addr, true);
>>> +}
>>> +
>>>   int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>   {
>>> +    bool lock_taken = false;
>>>       pmd_t *table;
>>>       pmd_t *pmdp;
>>>       pud_t pud;
>>> @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned 
>>> long addr)
>>>       }
>>>         table = pmd_offset(pudp, addr);
>>> +    /*
>>> +     * Isolate the PMD table; in case of race with ptdump, this helps
>>> +     * us to avoid taking the lock in __pmd_free_pte_page().
>>> +     *
>>> +     * Static key logic:
>>> +     *
>>> +     * Case 1: If ptdump does static_branch_enable(), and after 
>>> that we
>>> +     * execute the if block, then this patches in the read lock, 
>>> ptdump has
>>> +     * the write lock patched in, therefore ptdump will never read 
>>> from
>>> +     * a potentially freed PMD table.
>>> +     *
>>> +     * Case 2: If the if block starts executing before ptdump's
>>> +     * static_branch_enable(), then no locking synchronization
>>> +     * will be done. However, pud_clear() + the dsb() in
>>> +     * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
>>> +     * empty PUD. Thus, it will never walk over a potentially freed
>>> +     * PMD table.
>>> +     */
>>> +    pud_clear(pudp);
>> How can this possibly be correct; you're clearing the pud without any
>> synchronisation. So you could have this situation:
>>
>> CPU1 (vmalloc)            CPU2 (ptdump)
>>
>>                 static_branch_enable()
>>                   mmap_write_lock()
>>                     pud = pudp_get()
>
> When you do pudp_get(), you won't be dereferencing a NULL pointer.
> pud_clear() will nullify the pud entry. So pudp_get() will boil
> down to retrieving a NULL entry. Or, pudp_get() will retrieve an
> entry pointing to the now isolated PMD table. Correct me if I am
> wrong.
>
>> pud_free_pmd_page()
>>    pud_clear()
>>                     access the table pointed to by pud
>>                     BANG!

I am also confused thoroughly now : ) This should not go bang as the

table pointed to by pud is still there, and our sequence guarantees that

if the ptdump walk is using the pmd table, then pud_free_pmd_page won't

free the PMD table yet.


>>
>> Surely the logic needs to be:
>>
>>     if (static_branch_unlikely(&ptdump_lock_key)) {
>>         mmap_read_lock(&init_mm);
>>         lock_taken = true;
>>     }
>>     pud_clear(pudp);
>>     if (unlikely(lock_taken))
>>         mmap_read_unlock(&init_mm);
>>
>> That fixes your first case, I think? But doesn't fix your second 
>> case. You could
>> still have:
>>
>> CPU1 (vmalloc)            CPU2 (ptdump)
>>
>> pud_free_pmd_page()
>>    <ptdump_lock_key=FALSE>
>>                 static_branch_enable()
>>                   mmap_write_lock()
>>                     pud = pudp_get()
>>    pud_clear()
>>                     access the table pointed to by pud
>>                     BANG!
>>
>> I think what you need is some sort of RCU read-size critical section 
>> in the
>> vmalloc side that you can then synchonize on in the ptdump side. But 
>> you would
>> need to be in the read side critical section when you sample the 
>> static key, but
>> you can't sleep waiting for the mmap lock while in the critical 
>> section. This
>> feels solvable, and there is almost certainly a well-used pattern, 
>> but I'm not
>> quite sure what the answer is. Perhaps others can help...
>>
>> Thanks,
>> Ryan
>>
>>
>>> +    __flush_tlb_kernel_pgtable(addr);
>>> +    if (static_branch_unlikely(&ptdump_lock_key)) {
>>> +        mmap_read_lock(&init_mm);
>>> +        lock_taken = true;
>>> +    }
>>> +    if (unlikely(lock_taken))
>>> +        mmap_read_unlock(&init_mm);
>>> +
>>>       pmdp = table;
>>>       next = addr;
>>>       end = addr + PUD_SIZE;
>>>       do {
>>> -        pmd_free_pte_page(pmdp, next);
>>> +        __pmd_free_pte_page(pmdp, next, false);
>>>       } while (pmdp++, next += PMD_SIZE, next != end);
>>>   -    pud_clear(pudp);
>>> -    __flush_tlb_kernel_pgtable(addr);
>>>       pmd_free(NULL, table);
>>>       return 1;
>>>   }
>>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>>> index 421a5de806c6..f75e12a1d068 100644
>>> --- a/arch/arm64/mm/ptdump.c
>>> +++ b/arch/arm64/mm/ptdump.c
>>> @@ -25,6 +25,7 @@
>>>   #include <asm/pgtable-hwdef.h>
>>>   #include <asm/ptdump.h>
>>>   +#include <asm/cpufeature.h>
>>>     #define pt_dump_seq_printf(m, fmt, args...)    \
>>>   ({                        \
>>> @@ -311,7 +312,9 @@ void ptdump_walk(struct seq_file *s, struct 
>>> ptdump_info *info)
>>>           }
>>>       };
>>>   +    static_branch_enable(&ptdump_lock_key);
>>>       ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
>>> +    static_branch_disable(&ptdump_lock_key);
>>>   }
>>>     static void __init ptdump_initialize(void)
>>> @@ -353,7 +356,9 @@ bool ptdump_check_wx(void)
>>>           }
>>>       };
>>>   +    static_branch_enable(&ptdump_lock_key);
>>>       ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
>>> +    static_branch_disable(&ptdump_lock_key);
>>>         if (st.wx_pages || st.uxn_pages) {
>>>           pr_warn("Checked W+X mappings: FAILED, %lu W+X pages 
>>> found, %lu non-UXN pages found\n",
>
