Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2084.outbound.protection.outlook.com [40.107.247.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E7520B7F4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.84
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065957; cv=fail; b=q/ebNhAL00hBj2cHfRLDKbKt2pcEysUkb0Uj9bslkcKuJrqeXxEc+ZQNyZjkEETFgNIqp0eE880e1qOur2Pd3To4i+HDNmyJpupkRShuBTeagNQd4IukNzLjWx7AvKx0pUWjKCTckVDEg+W/uxzIL7s/h4NKtsuQxgJ5kbFuSF8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065957; c=relaxed/simple;
	bh=Y2c8bKCWTQ8rxdzEOAD16tnZsTjqEe/BBLSVWp2FbgY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XddGpq3x829dJ9J/sBivSNC6NO672yl53npZXotvAkHzAFc9oQu69h//cK1SkDLHFfQ+x+2crrMR3HI52+rsk+ewzY0Q+pjTLIJzwDtqZZAc2J4ReijxB+Dsnn/RyD11VtGCnmJVd12Mj5YUPRJ7HFjHG02vVGXsVSj8KE8QOgs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UTbEanaA; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UTbEanaA; arc=fail smtp.client-ip=40.107.247.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UTbEanaA";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UTbEanaA"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I8wSWJECqwVdeAb7bXMg8p89CN7Z8H4AXJvF2Vk36ZWZThM1msybS5Y2dE0p3yPJDIvZNIiSVrw9RiDliAdHh4mQ8MzZXx4u37rMSgCl8U3RjnztjflTJGjmrogeOnDE8+PwSubVH6zlEI8dBrP5bsFQnPd68n8Yk+auTetaOf+FaWN18xjHDL9r2UWVKP2k3aMAUV9WaKAYz/CTYMlFAV2BtHxWXhfSMgPkGEk9WkqIxuaUdMKYfcZuTqLjovDmtyVt7PXPmt+K4M031oX0rX4SzGElqpNjY3hkn1xOPBY4EHDgepNkQCjgt78CaN+aP3WQjo339oETSKb5fiELRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+joEiBWcZdqoa7PjbjpHs/1Z33X6ppbboOt7jJqG3M=;
 b=rSV3fPsg6qN7JylOkS1+TYC222nATKzg0JvVMR71bD5H6weZRqXgyTIDCz2hTD/4KigRoCfL4B2vvnUeZVRwylg+fJOMX7GyghoX0+7Y/uwBEEoopG/WV+FGFURadgTN6vpzGf+JN86QPKz+6BUwCbnZ2oAg2zEuB46Os3sd93eGnrCEdqgRmSVtmmb1SHVNcTA0Kh6Nm6cfBEKDk9UIbcRJIxvLH8Kx3cpp968C6ASDHfrhzz9Dop1ubDn4V5pZo3VWm99O5ue9RA2DjgCzs1HnQRqrtHWZV/F4OtPhcwLDUjXrvi1j8gvpdZsOh/kDXkKhMNetgNQH5d8G72vibA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+joEiBWcZdqoa7PjbjpHs/1Z33X6ppbboOt7jJqG3M=;
 b=UTbEanaA1BDUAlaBcVVsVK5GM4bRUd0LOO2JXMAKqEAOBtCzASLj/gP6y9wQEUCaNJLVk9afFcnp5I7yhtF9dIzZ/TTpiC5ynLZ/nO3i0ZKyuEzsbZXA8fpDGN7T6UiTsV5U9ec5LRG2Zht4tmxIh0jRdlyM4fQRXoa+iZMCVwY=
Received: from AM9P250CA0007.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::12)
 by AS8PR08MB6391.eurprd08.prod.outlook.com (2603:10a6:20b:31d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:59:11 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:21c:cafe::ac) by AM9P250CA0007.outlook.office365.com
 (2603:10a6:20b:21c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Thu,
 27 Mar 2025 08:59:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 08:59:11 +0000
Received: ("Tessian outbound eb3c789b7dfa:v604"); Thu, 27 Mar 2025 08:59:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a4e8bf8b5289c3a
X-TessianGatewayMetadata: X/8koUvNfL6FDTQo5p6wpjRRelgUG6xThIlNgPWdL7NlhBOBCZN7+NG6In2jeckGcPoP9XLmkK45akIDcmj3QShnyuxSFdr9Du4BmXuRBzNaC9KSbV9H4nOFNwMME99u9p34b79Cbrkm1JT2rjRVUN+mCKa8CKttqSqLwkpU8GU=
X-CR-MTA-TID: 64aa7808
Received: from L5a367fc766c9.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 043813FD-3B65-4747-86B2-37459C618CB3.1;
	Thu, 27 Mar 2025 08:58:59 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L5a367fc766c9.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 27 Mar 2025 08:58:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cj37wNwV4Ui0sZL8niGbkNFcwVDb1+YuI9FLYN/uUKCcygUw3TjY18LRag04zcfAkm+5s+UYXQ86ZQlAu3suxWSxOcx6CPvCoz/rk75f+ys/JWKi9d/DLUfMOW8dbKlPSmafPUjdHIs0eYgp9TWdKVaQRDlQ/YRmO/SMfCpthVi/8UFO+J4EvC6mSIsLNG/iyzLMehB4TdEQEID+7YyybEhZ+mte6pBtyxYJ+4YSBe5hPrGauSh2DAeaS2mNTXCyuQFYsdNYP79cLADmIOal2piZSj0JuUpeeUqNbv5wONoBbczwoea0EcjS9ZslBapgAM0ViTuBPcJpieFhxf30Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+joEiBWcZdqoa7PjbjpHs/1Z33X6ppbboOt7jJqG3M=;
 b=rtcpBdO2uHcqXudI47zR1sljC55GnLhbEJPlE/DnATThtk3atboxrjgvf4hLw7soCP9tRqVCHMdGuWUeKRj7/jxWBKbMpa8SnMLd+Y1h7oRwfQAovCoAtZzHD/mOqXTTH+VHd8MMUEB6n5pls5JW8Yp4tvB3z/uBB//CNf+aJvmUvEnu+ynaTfVeBjFzXph8zK5PR7x4h6UdzuS9Wzq335ndNbIR2hpv7Yfh+NhD4Ne6ZaA7GgFaMyoDpPxQvHC+ki0PidxiezKluW1WzvARk5aQHYcRhF0RqDTLCiU6NF3WnQUhmGAD/pVivZw5x48iCVLnLsRM2Xut92fm+nooQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+joEiBWcZdqoa7PjbjpHs/1Z33X6ppbboOt7jJqG3M=;
 b=UTbEanaA1BDUAlaBcVVsVK5GM4bRUd0LOO2JXMAKqEAOBtCzASLj/gP6y9wQEUCaNJLVk9afFcnp5I7yhtF9dIzZ/TTpiC5ynLZ/nO3i0ZKyuEzsbZXA8fpDGN7T6UiTsV5U9ec5LRG2Zht4tmxIh0jRdlyM4fQRXoa+iZMCVwY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by GV1PR08MB11025.eurprd08.prod.outlook.com (2603:10a6:150:1ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 08:58:55 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:58:55 +0000
Message-ID: <33a9bb1c-136f-40cc-adfb-9f94365158ed@arm.com>
Date: Thu, 27 Mar 2025 08:58:53 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 8/8] drm/panthor: Expose the panthor perf ioctls
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-9-lukas.zapolskas@arm.com>
 <ym5gk6uhwteiv3p4kvjjvpujval3rfjsv2lnzzgmq3cvnmfv5o@qbwtvgnqyyui>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <ym5gk6uhwteiv3p4kvjjvpujval3rfjsv2lnzzgmq3cvnmfv5o@qbwtvgnqyyui>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::12) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3315:EE_|GV1PR08MB11025:EE_|AMS0EPF0000019A:EE_|AS8PR08MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: 8223022b-209e-420d-1722-08dd6d0da43d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WlcrdGU3L05iRkJPL1lMb29IdS9EelI2REZqWms0VTR6VldkR0F3YThhZVcx?=
 =?utf-8?B?THJYbFZ5bWdvYmdTbHNyMUtvK2VXUlpEeEF1QkZXUjFNemNOYkIzYXNlQ0lR?=
 =?utf-8?B?Z0FBRmZQbkkyTmtYV3ZPSEtpVXJHWE1JZktBUjRKcUtlWUVua05IZjZjKzA4?=
 =?utf-8?B?WEMwOVRRUzlVcWdiZGdlaHpHc2RDYWw1dFk5UGN5dGNMNjAvMDdnR2U4NkNP?=
 =?utf-8?B?Qlprb3dENWFIUmhlazhmKzh2UTdYMC9DK0NVdUxxSVZkc00zcllYZ09hWHhj?=
 =?utf-8?B?Z0xCNjVpZWNvODRSRlhtaGtjSWNRTDQ2MVNQdGtJOWJaWWovcGYrUHB3eUg3?=
 =?utf-8?B?Q2RZQWhobjFyQWJwRzZEZDIxS2p2SHRnUENOR1NFcThsUTVwQTV0WVpleVYw?=
 =?utf-8?B?K1FuRVloVnRrSEhBMWhCYnl0WjNWT1NlZldxS2Y0Z0JobjNWSlhVV0tqSDBu?=
 =?utf-8?B?V0xqWTFyZERiK1NLZnQweXZxVVI4bXVzaWVtcWs1NURSVDVWdjAvY3pqbTNi?=
 =?utf-8?B?LzVJMVYvRDMxS1Z2RGRwVUJHdUNmbnhlanVJMXZsMHIrclUwb0RGa2wrcFUy?=
 =?utf-8?B?NkU3ekovVDAvaytpaWtBMVZHNE9LeWVwTzJyQU9JK1FZYXowdW1LMmFSYnZk?=
 =?utf-8?B?ZTZFLzlPTmF3cVBIajFNNm5MNXpRc1ZXSHBYbnd4b1FlM0NQRFBrQVZjOHov?=
 =?utf-8?B?bkxZTWx0OVJhcVdEUUFUb0NRRUxNN2hsZlRQV0ZKVTZBV3BRbC9kQitmc0ZJ?=
 =?utf-8?B?NC84WGUrcEp0TEliY3pMUDJVNm55YUlMaDNreDFxbHIwMHphVkF3cURVRHhq?=
 =?utf-8?B?dkxKT1o2bVgveGh2OEtORHJiYnBTMkREd1gzZUZlVjRZRkwxWkNab0U3cnFj?=
 =?utf-8?B?c2xhNUJ2SzdtYU1GV05mWHRIeDFvZXA0RzE0bmh5TzZraStyK1VMdWVURUhE?=
 =?utf-8?B?WGRCWjlhbnpxUUkvK2N3VStCWVIwdTQzMGsvWUVabDBOUHN3M0laZzRKc2g2?=
 =?utf-8?B?YVR2RE5JaUV0dTRjQm80am5MMzEveDFCYml4S1d0RTVqblN0d3A4UFFpMml6?=
 =?utf-8?B?amNONEZvMW1XeEVjQktJOWlWcWRhWkc5V0pLaTA2ZEQzR0FHbVZqMkN6ZWdq?=
 =?utf-8?B?TnQwUjNKUXNmUmI1KzhjT3V4d2M1ZXVLRjZNQWxoSjRiazI5NEIzWTh3blhS?=
 =?utf-8?B?RHNWbFVsVXEyRkFrZHZDM3dnNnh6bEZEYys5aXRxdGhYRkR6dkE4Z1pQaW9N?=
 =?utf-8?B?bXBudUFrMXhETXdrd243SDFETkZJdTdsSVV5T3JaT3dNYW1GSDJRcUl6ME9Z?=
 =?utf-8?B?ZTdOY1p3TGZQV1lQT29hNkF0bjl6Q1RFUFl6bi9XMTRicC92alFhQnNyK0Y4?=
 =?utf-8?B?WEVQVGVSWHlnWHFLelJ6a29obkM3RDRkTncrdVVkLzArWEJIRHEydDl6L3RX?=
 =?utf-8?B?OVljUmZoSzN3eWxxVjN0LzVscTdNTExZNkt5RkJXb3dsSmVzeFZMdWZibExw?=
 =?utf-8?B?V3VDOUNTV0RQNjhLYmVmQ0RpU1M4R01ReGlCak02Z1lFRTcrWWZtekpjZU5n?=
 =?utf-8?B?YVBzOG9CUFBqMnY3YXZzcFVpRS9jRVdKOTA1RVJQUlA5cVdlTFBvNVgwbFdp?=
 =?utf-8?B?NUNEQWpGU1hSSk1nSWhVU3B0WGd0Mmtna212TEw5YWFGbVhwQ1FCeDJVOWRl?=
 =?utf-8?B?Q2VodjlabWk1a0NlUGR4WDVOWEM5M0dBT3FHd2VHcHlYOG5YeVlScDhQZStr?=
 =?utf-8?B?bWpzUTFDV0J1QUtBc292bk5MZWRMQmhBOCtORzJxMFpoTlllV01JTUk5VVZE?=
 =?utf-8?B?V0Z0dE5MS0ZKbFR2L3psaFU0ZU53ZHlSTFVWZFIzOXl3c1lOdHNWWk9SSHJp?=
 =?utf-8?B?NXgzMnFaWTduRUhlTk1lNk81OSt1T2xWWmhUTFg3VWdQdWxSZHp5OUR2UUhX?=
 =?utf-8?Q?MI7ulAero3c=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3315.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11025
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:208:5c::16];domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08b7b1ba-7882-4e93-ecd3-08dd6d0d9a2f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|14060799003|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGM5ZkNZOXhSZ0pmUkR1Ui9ONzVMVThqYVhVOEZ2cldPTzZpMzdmekhPc3Nt?=
 =?utf-8?B?bUR3V3ZmcWpVZ3ZhVkV5ODhScXJxNyt5ODRPSlB6L1pnclBzU2xVa2YwSlI2?=
 =?utf-8?B?NForOTlZWDBMVC9KbUwxMWVGSEwwQ0lPaE1ZTG5NWWRZckRnRkpZZ0Q0WHlF?=
 =?utf-8?B?TGpEVnZIcTVCdlRmaldKbjJZbnNjb2lFaDlHTUYxdm4zcHY1SER3VGQxKzJP?=
 =?utf-8?B?UWREd2Z4UXpzRC8zOGlBbnJwMDEwelVZRDRrWnQ1Rk8walhaMCtoV3MzNlRv?=
 =?utf-8?B?clBzejBHbGF0ZXRjeEpkZE5EWEZKMVEzT3BSSlFRbDdnK2dtWkhpa3Q5U2xQ?=
 =?utf-8?B?Y0VqWjRGSzNVTWlIeFozRG5oc3F6a3J4OHpLRnExVDlPRnBLRURtYUlGVzNh?=
 =?utf-8?B?Ylkwb2pFaE5hcjh0akpmUmZYRHlGVEkweDNZZHorTTNpenJLa2dDTnpsZ0R5?=
 =?utf-8?B?eHVHajIwNlRXVFVsRkpFUit2aUFDUmQ1aTgxZVo0OXZhZ0E4alNqVWpMdEJ5?=
 =?utf-8?B?bEZpTytaY1JsWitqQWNpeFhoWmNmcVNpWW9iT1BkcHFpZU05ZEpCRDBCZXJY?=
 =?utf-8?B?eVpIZEFvT2Z4aE82MHQvZlhQbmlYME1uUk5mSVlRWnd4eUNTQjFsT2xzUm9y?=
 =?utf-8?B?Z0x4bGVtM1JTT2xtaE56NzFzUmdWNmh2cGhwV1Jta2VhenNGdHU0QXpxQ1A5?=
 =?utf-8?B?L0FCcDBtNE8zSFFvL0hFc044VkUwOFg3Z1g1a2NOQVp4aU5CS1VhT0tVRENI?=
 =?utf-8?B?UjVyRHYzMnlEL0lSQVZUamEyWGNrVWdkL3IwOStDd2Zkci84QmJZYTJHZnA2?=
 =?utf-8?B?YXIyMUppVE1XRlh4Qzd3YXdOMGI3TWxIeW9qdDU1dStubSsrSklGWEF1M3g4?=
 =?utf-8?B?YUNTeUxGU21FbFh3b0Voa1hCUllCczd1ZDJ1cFYvdmNJcnJmc3kzMnEycWFp?=
 =?utf-8?B?T0lEcDROZ3pZMlFGUEVpM2JpeFZLMVM5TERwNmUvT24yeEhuNlV3ZW1oTTBZ?=
 =?utf-8?B?b1M2d1Vjakd4am8vMWV5dElOM2pkRmJNU29hMmpZTnRXWExRQ2NkMTFYVW5j?=
 =?utf-8?B?RzNDQkI0Sm9vQnROaTN2NGh4ODdoNis4SlBwakhrWGdKY3FvZU82ZjV0Ukli?=
 =?utf-8?B?QXNuaE93QjlzZzRYSjJXUTJ1Z1VBRFlDRGhlSWJFR0p2akYxUUZhNUJsRzVW?=
 =?utf-8?B?Y293dUV2dVZsNWcrYnVMTHE1b0V4N0FBUVVQcXBIa3hYQWk0enpBanRMQnd6?=
 =?utf-8?B?aGpsK1VxL1JsUEUzVWVaeDJ4cFhySEVwK2NhNlF1NHV5Z1lGeDBxaTY4aVkw?=
 =?utf-8?B?VUg1TUNxZ3dMZVl1T2FZTVdneXplZTZySFRsMDRaeXhySDJVYjZxMkJINW5X?=
 =?utf-8?B?cy9mOWZoUGw0azF2ejdyTEdsUXhib1ZlbmNrc25kbllMbEhaakRXNTRTUnhx?=
 =?utf-8?B?Z2IxS0tsMkxHZXBHL0MrWGlXN0czNm9JeVd2ZEgyZU1kN2JiTDRkRnNhQ29M?=
 =?utf-8?B?ZmV1dXVzMkxvZjhDSXVZdlhUZEhoWTlXT256U0kycHBrRFQ4YVM4SDExOUt4?=
 =?utf-8?B?MkozeERMU3IxOVVsanRTYml5ZGNBcTh1WjlCRzZTZnpTOTB6YnNTc2tHSG1P?=
 =?utf-8?B?WkVrRnRDb1krREQrM2ljNExWMlJqaWhsL0NWZTM2b2NQMktSUzZUcCs5VHJq?=
 =?utf-8?B?V0M4YjhyenBYdE8xZHBkWXJ1cmtaalhVRWVqZHp5U3JqSVpwUmZsRHlTejhr?=
 =?utf-8?B?UnZYYUtjZzRMMnYyNHc0OHp3SjFGMHFQVE04ZmVKVGxXbk5wQ3ExbGtrWk1M?=
 =?utf-8?B?em1IUWcxYkRMUTNqWHdMTUYrMWVHY0Q2NFBhNW5jNlFNQVFuWjBQMHJSeVF4?=
 =?utf-8?B?WGR5TGV1RDdVTmt0Q25kaU1yaGZTd25LQXZuOUNzRVcvWUtDem42SkF0WldL?=
 =?utf-8?B?SWdLL0FhQTFXTmZ5UWhZTVJhTHY4RGpuV2ZTc3ZlTFJvLzJnN0wzZWJuUzkr?=
 =?utf-8?Q?VlK/UlhPUNoyBFdakC6WZ4GWiB1pjw=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(14060799003)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:59:11.3322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8223022b-209e-420d-1722-08dd6d0da43d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6391



On 27/01/2025 20:14, Adrián Larumbe wrote:
> I don't know what the usual practice is when adding a new DRM driver ioctl(), but wouldn't it make
> more sense to add the PERF_CONTROL one to the panthor_drm_driver_ioctls array in this patch instead?
>

That does make more sense, I'll shuffle the patches around.


> Other than that:
> 
> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> On 11.12.2024 16:50, Lukas Zapolskas wrote:
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 2848ab442d10..ef081a383fa9 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1654,6 +1654,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>>    * - 1.1 - adds DEV_QUERY_TIMESTAMP_INFO query
>>    * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
>>    *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
>> + * - 1.3 - adds DEV_QUERY_PERF_INFO query
>> + *         adds PERF_CONTROL ioctl
>>    */
>>   static const struct drm_driver panthor_drm_driver = {
>>   	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
>> @@ -1667,7 +1669,7 @@ static const struct drm_driver panthor_drm_driver = {
>>   	.name = "panthor",
>>   	.desc = "Panthor DRM driver",
>>   	.major = 1,
>> -	.minor = 2,
>> +	.minor = 3,
>>   
>>   	.gem_create_object = panthor_gem_create_object,
>>   	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
>> -- 
>> 2.25.1
> 
> 
> Adrian Larumbe

Thank you very much for taking a look! I'm working on addressing
the comments you left and hoping to get a v3 up soon.

Kind regards,
Lukas Zapolskas

