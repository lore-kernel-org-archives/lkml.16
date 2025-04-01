Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2055.outbound.protection.outlook.com [40.107.103.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744D020E03F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.55
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522552; cv=fail; b=AsyvpylzNjM6uw/6AQmOUCBJ7vqiHVFykRLIBEsHRQ884PcA3ivtOz473mhZXhqq+CO7SStIkuCsj4Dgz+A7aYsahAaPNUPFdhLUeQeA5VQuPCV96/zCq/b4RlxOXLUWmp9/yXM6Sy2a29i4MpvfGAmF94HmdhdExF6LN3xpsuQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522552; c=relaxed/simple;
	bh=/8o3cFgnnrgWoQjy9f42CHMAGgoGSsKkTA+lJgfF2v8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VAvnbb/XiXVSC7h9Rn5XGjidvKkfTUT/yByCQwR/4jms6W2Wn3AbITudlfr2vrgTj3kiUpFDUjY2lyDotyFgltrSz+La/hrW7559RALAsv5vq4NRVaw54X3N2h1G4lH0gqPyjQLpeTmJvqleK0BvBpyCkQ9uJdhXlreHy7EmRLc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Brc2ZYea; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Brc2ZYea; arc=fail smtp.client-ip=40.107.103.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Brc2ZYea";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Brc2ZYea"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NTyPPSEI3e8fuCneML29ou6AnWRDjIByIAs0ezUSTRuLYMoj5pERcVbjDSmbw0xq7yGC5uc9qsKYUcYGoHYChNST0uehUofkFmnK2OXhc8IHXa52Y0q0IDPP66gj7YxQ3uvAhg9g0o90W8hiPJOuGrAYNbSDNgKo/jQZP/NftQggBF4JEyXChTMVchxhuYXei7oZ34EI/Jy9uaZEe1Yyoy2JATZ2CWouBDyPXgH/DoUwhyQavXBIvFkcqsEyNoIPp6igTl8kAdG3OIgBk5TW8Xa1w6je9RalhK7U4p8bfDfRO1uaCUprguPaLXAo4WTgJ8kj7KZqNgUUHM2G47Nxtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=Wk8IUMfYXSF6xzlO4cqR//mbthzvuWmI/zifl9xddDg3D/mcBXPg77TVlVCNllTJaBIm3x+vFV71P7HA5AZ0q/etWvpqxiMMeD6r+WX+SFBOwRuOs2Mf9AEr+RrlcBiG1kPui/rOMzgd12g32o1/VtVlFPA63RJzlMVqwckJ3CtEAeQp7vPUz+18sohp03uw1rCioIoYDHj0oe5/cjf2biwUD0q8rwWINvCqrbm8PV/wO7XJF1gdmIj7OfWUvXU3iy9GxgtchBDKmDVZZJGYcMzTVoTkENmOXekkECqHzVj0i/96l7tBlnVI+enxgSpmqGNFKLknhAUtPHZLdLeqVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=Brc2ZYeawqTOE4b0ZRYihd13CtrWN9bW953r+DXsJJ1nCFK/dcN/rAfPwV9/0dqcDqb4sB7XdhHXD9694xtsucPybid+YeQ2VaGDurMSw/yIoKocZzAjfOHZowKPULk2mFKs9UdpRLMNVCKnKzNGJQh/FnXc8ISFUWE9O3zI3gw=
Received: from DU6P191CA0050.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::13)
 by AM8PR08MB5780.eurprd08.prod.outlook.com (2603:10a6:20b:1c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Tue, 1 Apr
 2025 15:49:03 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::c3) by DU6P191CA0050.outlook.office365.com
 (2603:10a6:10:53e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 15:49:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 15:49:03 +0000
Received: ("Tessian outbound eb3c789b7dfa:v604"); Tue, 01 Apr 2025 15:49:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 054820aff8357f30
X-TessianGatewayMetadata: V9GQzal8YZ2Ke0O9w0rhnllqJQWy0U0aVPUNZ/GoNGOHAeXOg2xgPreGwImCkDXf2Bgx65yR9Tyo0bB2GoesCYCzE7bSgsRb/bynKuu+DdaO/TJnUFUv9avSuWu+76DvvbEjMY06N2qYsHMfJMxyIhf/qDJ73fGFwFaPZKvwsm+8UxEEsxMpQOHMutL+Iuz/sq/oDgZdHyt6Dol/n0GL5w==
X-CR-MTA-TID: 64aa7808
Received: from L09bc3a1ed403.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FF6A9144-F857-42B2-841E-E4C600CA087C.1;
	Tue, 01 Apr 2025 15:48:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L09bc3a1ed403.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 01 Apr 2025 15:48:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyAB7QIyXG61lgi9Xaz0bX++huN4J08+PIyBPl3ZIm6WIjAxzz9j0xtnIhotRGaZoOtYRfBAqzng2o2PJueKD3fhid8AK6MK+wKrNBmLfoBEJulgJyLNqoC5tTtKLWiYUvp5VATUss0W7aKQgqikHdW0utogjqf4xoMIITbxnOtVK+KSbOvggVfyyo+VPkNRdlOMYzOHlEsBVem3sPmSVpqFNX18TYGnkh1aMV7ld6EW4ARSHReFGgkHxaDxGCdKHy5o8d2HApIuJt+rzR5v770mBaLg2oWf7+Nn1lgkULt2Cv+LbLCmM7nQ+tMw/y5u+3NyLnLRKphUg51g30IhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=ftUvpiqY9W5jR4nV5qVcwagxv0jCXX3EliNqmORytGAFfbNbDhgj5LhDEevkME7gERxc9S/mWHyVZFF9V0HA4BU1xBmpF6UEf1+3YjW+W/NFOirrpCeUgoJR+f2Krfd658HmXXNqg2P1K4+z0d3G3U2zBT5UT0gqK3ZaFtaDVQ8Pgw/7cmYRPXEGQ3nRAlR9/AhFQS2NNazfCk1eGw0IA8Kbco/gsbJ/MBYIxA2KypmChmD0bBi/3N6TMEqA3uVPsKcqs34obZelEvtluhiw4mEIfRWMpUpYi9pQRtwEwgV/ljUeNGd7RfJHlpktjYjFPUAVntjix24aHssOY0LPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=Brc2ZYeawqTOE4b0ZRYihd13CtrWN9bW953r+DXsJJ1nCFK/dcN/rAfPwV9/0dqcDqb4sB7XdhHXD9694xtsucPybid+YeQ2VaGDurMSw/yIoKocZzAjfOHZowKPULk2mFKs9UdpRLMNVCKnKzNGJQh/FnXc8ISFUWE9O3zI3gw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:49 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:48:49 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v3 7/7] drm/panthor: Expose the panthor perf ioctls
Date: Tue,  1 Apr 2025 16:48:22 +0100
Message-Id: <1db5077232173ec63bb16e953422c55efcd41e69.1743517880.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1743517880.git.lukas.zapolskas@arm.com>
References: <cover.1743517880.git.lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0584.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::15) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3315:EE_|DU0PR08MB8279:EE_|DU6PEPF0000B61D:EE_|AM8PR08MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cf1e56d-d877-481d-8f7b-08dd7134ba79
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dVZ5VlRWS2F2bVQ0RW5PMEprKzFOY0g0eCt5eGFQdENhMW1MQlArcnJGclI4?=
 =?utf-8?B?a3BqNGFrNWZpeDVqdWFhV2lnbUlnbmZ0clJOT0JxVGhRd3JmTWRjMUpsK1h4?=
 =?utf-8?B?aURqTDYrZDk3NGtzWitVVlJXeU1vT0JZdndsZWp0S3F4UnNtekR3Y0JDc0xY?=
 =?utf-8?B?akxCR3VRWmgrVk04UG4yb2xOenp0U0dJR1gvOURZTmI2RmYrdVRhVElqejhv?=
 =?utf-8?B?N2p3aXRxenJjN2xUdVo1Yi9oWGRaRGhuZWFTYlJiaGtIK1AvNXhrenZkRlRs?=
 =?utf-8?B?cUR6ektCWHlVTjNHYWYwQjlESERZS2t6bVdxaXh4TS8xWlFFYldCdCtJaEky?=
 =?utf-8?B?UTJHdmpKQnB2OFFUR0d3bnBBTlA0bmVaNW1tTzBXMGtVNEhJdFY1OVphdm9x?=
 =?utf-8?B?R3NzcWtDeFVlYUx1N00zM05ESUlmUTR1YS9jZ25IMGw5QWNla2xGVmxKQ3ZX?=
 =?utf-8?B?WFhxdnBQSFF1WkFMK2h3aEJrbmw2NEg0N2V3cDN1dmNLUm5CNGYrV1A1bnpF?=
 =?utf-8?B?a2kzbDFuSXFEK0FKLzNFS0o5ZkJVYWhheW1xbDkxbGVFVHFVeHBHaU5GU0F4?=
 =?utf-8?B?OGlxWldaMkNjbE1xc2szTVByajdWbEJlNVBJM0dUNmJYZ1lhVC9mblN2bytF?=
 =?utf-8?B?bG56SDJmRUdLSXRWVVozYnJRb0IzaVlld3pNa3RrOHRSdXJTZFNQU2JhalZN?=
 =?utf-8?B?bU1xL0NVWVZiNFJ4cGtVR0RLeHJRYTk5NUhsZ2hpbFR0MVZKTWVyWUg0QTNh?=
 =?utf-8?B?c3kzeElocTU3YzRKbHhxK0tqSUNrRFBnY3pUa2RBdDIxUSs0QW5Pd1ZSV24w?=
 =?utf-8?B?QXRadWZnNlhXYVQ0VUlmVU9OMmVsSldCOG5RWkZIcmp2YktoUHF5d1grOWVt?=
 =?utf-8?B?MnozVG5KVDlVcXpPRkZVU3BKTnhpS25vSEg2NGplNW13REx1cnB0cnJIZXpM?=
 =?utf-8?B?aGRPRHBwSWl2NUhBU1VmYVZadVRpS3dPK2NScG9pblkwcEwzaXFLK3hDcWt3?=
 =?utf-8?B?Umg3RDIrWWcrZ1dLRmdnRVlYTkVUa08rNEEzWmZXQ3ZHNm8rZGxMNDdkc0Y2?=
 =?utf-8?B?R21IS2R6eUw1ZFJ2bTdyR3RnTUV3alMvL1JEbzN2S3BtK256UktyS0txeHFF?=
 =?utf-8?B?VEVqZFcydDBuamZYSkN2YmhqelllaE03NTZIZjIxS3FMZlliRnhqR0pjeGhM?=
 =?utf-8?B?a3dTbU1FSktIRUkyVW9NT3hjRGpiaVdDV1BoZVBDVC9uZzhiQjZDZHNoeFBO?=
 =?utf-8?B?MWoyMm5PK3Vsdy9CalpWSENFWmRMK0FkVlptMWRyUWZXTjlBbEhzSXB1RS9j?=
 =?utf-8?B?R0IxbktrMC9oV25MVHNsVFVNK3BVRzIrSFMwdnVRcllRUTdzdEtqeTBzaDBa?=
 =?utf-8?B?cDF4WVpvcURBSy9xT3h6SmcrR05uVXgxZ0tUZllMcm1lUEN6ZmVpL1BRRkJI?=
 =?utf-8?B?UENVNWRZbTIrbUxCTS9pL0FxaHl1ajhjV0ROZFB1Ujg0OVRxNEFZbjhtNEZk?=
 =?utf-8?B?Y25rcmNtSG5xVTJsR252aUNFbDAzell1amExeCtrdWhWZHZ3Y2ZPckNtdVhv?=
 =?utf-8?B?WVI5bVA0ZmFtMUJEK2NqTmVQOTNyeHJ4a2c0ckZzM3RPT0ZoVkYwS0c4a0hL?=
 =?utf-8?B?cWpQUVJ0V3VmZmcvODd6ZDlxV01VZ21JRWRkZHZYd1QxVEJpNnVFUExMejhv?=
 =?utf-8?B?K2c3cDJRV0dJM0hja3FsRUlkOEFTaVczVFlkdnhBejgrZ0cybXNjTnpHdCta?=
 =?utf-8?B?b0hHVUdwbU4zZ2dScjlXTS9oNS9lSytpTSszR21Qc0w5bmJ4M2pCbTB1L3Nz?=
 =?utf-8?B?NlVNV2F6T1MrZHB4cFpwdUd1RU9Pa2tIaG9NS002L1RzMnh5MTg2ODVWVkdC?=
 =?utf-8?B?ck1Edk9pclk1Qkd5dWp5am5WMWZDT0tNeDBsQTE1VFowWk1lZXpzUXQ4UFR3?=
 =?utf-8?Q?UeHQ81MNJEg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3315.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:208:5c::16];domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	73bd0a7d-bf87-41c5-2a3e-08dd7134b21d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|35042699022|14060799003|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3JyVnF0NEpIKzg4M1dGN05lQ0IvdmZXbzJmclUvN1h5RE13ZVc2aXhERERG?=
 =?utf-8?B?WlR5UkJ3R2JiWFd4V0RXcTV1eEpqZDR1TnYyZnl1R2JGUndEbUh2cGs4TVJv?=
 =?utf-8?B?NWhMelM2UWlOY0cxR0JkamlQNGs1RzlwaGxiYkhSUlM4d1pZMFFodXo1QTdG?=
 =?utf-8?B?UnNNRW9IWExINGgzbTJINEVxQkpCMk5NQWVaTWM3TFBydnF3T25tT0YrNVZh?=
 =?utf-8?B?K1p5eEJaOWc3SFFGMEN6Zy9vQVdOMmNaSlg0L2lmS3VCczBWVWp5VXhxN0RI?=
 =?utf-8?B?cURDdDYzMlp0Y2JqRnVHcysvZkFNd1NDbVFDaGhoQmlkbCtpYnZIR2tSaGtW?=
 =?utf-8?B?aU96UTFUMHBkN1dsSXRrR1dPS2Rnb01ldVY5NWZvYzhVWk9EQVdTU1FZSlht?=
 =?utf-8?B?Y2VMRTFXU0RrRE5Qc3VoQ2ZTTGxzaTBUdnhwMFNCdUk4dmtjM0hwcGdhV01s?=
 =?utf-8?B?c1NhSzg1eWZLT0NXVEJFZStPNGpqVVd2MVYrN0hHWW1PaEVQN0NJVU5teFhN?=
 =?utf-8?B?VGJ0UC9lQmVvUnBRYW03OTBwblFUVkNFN3hxd0ltOGRVQ0ZlL0dFdE1IUVVN?=
 =?utf-8?B?eFZMOUljaE1ZajBjZzFXNG91WDdJenFkdUFkNW1lVEsrWStVRkhZQWtiVXZ5?=
 =?utf-8?B?YXduSGpVeUFjVEdpYnNWbzBsVjNCeDdpajdHY1ZvVGVVL3JKdEVneHdLVTdJ?=
 =?utf-8?B?czlCdlZLeHFRb0hicW5DVno5azY4bkVHcXJSQ2FyRElqS1JBazJ2dE1yZ0to?=
 =?utf-8?B?cVhsT2pKMVNiTmd2NnBNaXZROGZJRnJRMmZkZXpVT2VWVEtSdW5LR1hxemU5?=
 =?utf-8?B?blBCVTU1Ritmck8wMFk4cXRobnVzdzU3TGFZd2FOQURPdGk4SzVidnM4b3lL?=
 =?utf-8?B?TkJQZU9ob2tSZ3EvZDB0c1BBaGxIMEtaN2ZjZlNsOU9qSmpQUGpGQ3lIaFZv?=
 =?utf-8?B?eWErZG9SL3k4c1hQTVRUUm9VOXM3aTVUb084d2VaOW55cXhtS0VoZHU5eGkx?=
 =?utf-8?B?blVKV1JQbFJLcFZkVWFqVnRkNVFSNTFsTmtYM2pJK2RLOEtZOTFtbGYvMTRW?=
 =?utf-8?B?dVpIMmhONkJMcmkxK3NFVWs4T24xZUNtZXNsMkVSUW53cjVmRGtmRHFBWlFP?=
 =?utf-8?B?WlR6M1BNS2hLYktxV2ljR1F5RUFVMi9Sa2lQVDhlMTNidklUS3RqS3hTd2o1?=
 =?utf-8?B?OUNpUkFxRkVHTDJDajZKM01ScEJjcExualhlQndzL2thbnFmRHdsbTZkaXE1?=
 =?utf-8?B?dzhpZktHUTJoR3RKQlZiZHhDOUxFYVpKUjM1OW1NRUxWUWVjWW8wMnp1ZkxY?=
 =?utf-8?B?Mm1wODdEamNpSVQ5c0JIcENXMW9IdzNjYzBUNW5kTEo0STYyMS92aEVPQ1R0?=
 =?utf-8?B?Wm1ieFBYcWF5RWlQZFkrOHBUcGd4eWRsYmRDWnQvbWxmSStDVVFZSm5maHNu?=
 =?utf-8?B?TURaa2QzNjBhbWMxQWJGTkJjQWhNNW9pay95dUJSa0lwZm9mc2NBOXB2UFp5?=
 =?utf-8?B?QUM4K3duRGhXM1pwRENoTkhQMWFFSmtIeFFJaFo0N2IxNk1hdUpud0h5VDlv?=
 =?utf-8?B?TVBpRzhWM1B5aU5yM2oyOFkwYWR1dGhueTZqUkN3bUZ5TFUvNnhTWkRYUUM4?=
 =?utf-8?B?ZXl6dzJhRC9rNE1hcHNyN3Bqend1bFkxWlZkbGdoQWhWeUZZUG1YZ2lCOE02?=
 =?utf-8?B?YkpvbnE1M2dsSk1GcWNVK3pqSjV3NkZ1T0tLWFlFeXBwaGNMRzhwYXhHM1Mv?=
 =?utf-8?B?dmJOcmk1U2lUYjluT041WC9wdENneUlsL2ZhbjFuMXNVY3g0ekVJZE5MZ3p0?=
 =?utf-8?B?ZndncnV1SVJVS0ZNUVovc0lqSmVqUk94bGtaM2pMTUxaTnBOZzYvZFZHNzhN?=
 =?utf-8?B?TXRVcTQrTW13cnd3SWY1RWs4NHY3RzNWY3ZEV1VBT0FKOExaWVE5M3RHS05t?=
 =?utf-8?B?Q3ErQ0Qzbmg3aGNMclcvbkVuZkJLcGUrSlVXeERqVG01dVVwV2VIZEJSeFBv?=
 =?utf-8?B?cWdFVFhLVDlDRVpnQVh6RmM1emszKzhpdVdYUG01Q0JDQ2REeUR3cENSUEJz?=
 =?utf-8?Q?zv2dQ5?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(35042699022)(14060799003)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:49:03.6620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf1e56d-d877-481d-8f7b-08dd7134ba79
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5780

This patch implements the PANTHOR_PERF_CONTROL ioctl series, and
a PANTHOR_GET_UOBJ wrapper to deal with the backwards and forwards
compatibility of the uAPI.

The minor version is bumped to indicate that the feature is now
supported.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 141 +++++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 4c1381320859..850a894fe91b 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -31,6 +31,7 @@
 #include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -73,6 +74,39 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
 	return 0;
 }
 
+/**
+ * panthor_get_uobj() - Copy kernel object to user object.
+ * @usr_ptr: Users pointer.
+ * @usr_size: Size of the user object.
+ * @min_size: Minimum size for this object.
+ *
+ * Helper automating kernel -> user object copies.
+ *
+ * Don't use this function directly, use PANTHOR_UOBJ_GET() instead.
+ *
+ * Return: valid pointer on success, an encoded error code otherwise.
+ */
+static void*
+panthor_get_uobj(u64 usr_ptr, u32 usr_size, u32 min_size)
+{
+	int ret;
+	void *out_alloc __free(kvfree) = NULL;
+
+	/* User size shouldn't be smaller than the minimal object size. */
+	if (usr_size < min_size)
+		return ERR_PTR(-EINVAL);
+
+	out_alloc = kvmalloc(min_size, GFP_KERNEL);
+	if (!out_alloc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = copy_struct_from_user(out_alloc, min_size, u64_to_user_ptr(usr_ptr), usr_size);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return_ptr(out_alloc);
+}
+
 /**
  * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
  * @in: The object array to copy.
@@ -176,7 +210,12 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_setup, shader_enable_mask), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_start, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_stop, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_sample, user_data))
+
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -191,6 +230,24 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
 			 sizeof(_src_obj), &(_src_obj))
 
+/**
+ * PANTHOR_UOBJ_GET() - Copies a user object from _usr_ptr to a kernel accessible _dest_ptr.
+ * @_dest_ptr: Local variable
+ * @_usr_size: Size of the user object.
+ * @_usr_ptr: The pointer of the object in userspace.
+ *
+ * Return: Error code. See panthor_get_uobj().
+ */
+#define PANTHOR_UOBJ_GET(_dest_ptr, _usr_size, _usr_ptr) \
+	({ \
+		typeof(_dest_ptr) _tmp; \
+		_tmp = panthor_get_uobj(_usr_ptr, _usr_size, \
+				PANTHOR_UOBJ_MIN_SIZE(_tmp[0])); \
+		if (!IS_ERR(_tmp)) \
+			_dest_ptr = _tmp; \
+		PTR_ERR_OR_ZERO(_tmp); \
+	})
+
 /**
  * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
  * object array.
@@ -1339,6 +1396,83 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
 	return 0;
 }
 
+#define perf_cmd(command) \
+	({ \
+		struct drm_panthor_perf_cmd_##command *command##_args __free(kvfree) = NULL; \
+		int _ret = PANTHOR_UOBJ_GET(command##_args, args->size, args->pointer); \
+		if (_ret) \
+			return _ret; \
+		return panthor_perf_session_##command(pfile, ptdev->perf, args->handle, \
+				command##_args->user_data); \
+	})
+
+static int panthor_ioctl_perf_control(struct drm_device *ddev, void *data,
+				      struct drm_file *file)
+{
+	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
+	struct panthor_file *pfile = file->driver_priv;
+	struct drm_panthor_perf_control *args = data;
+	int ret;
+
+	if (!args->pointer) {
+		switch (args->cmd) {
+		case DRM_PANTHOR_PERF_COMMAND_SETUP:
+			args->size = sizeof(struct drm_panthor_perf_cmd_setup);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
+			args->size = 0;
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_START:
+			args->size = sizeof(struct drm_panthor_perf_cmd_start);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_STOP:
+			args->size = sizeof(struct drm_panthor_perf_cmd_stop);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
+			args->size = sizeof(struct drm_panthor_perf_cmd_sample);
+			return 0;
+
+		default:
+			return -EINVAL;
+		}
+	}
+
+	switch (args->cmd) {
+	case DRM_PANTHOR_PERF_COMMAND_SETUP:
+	{
+		struct drm_panthor_perf_cmd_setup *setup_args __free(kvfree) = NULL;
+
+		ret = PANTHOR_UOBJ_GET(setup_args, args->size, args->pointer);
+		if (ret)
+			return -EINVAL;
+
+		return panthor_perf_session_setup(ptdev, ptdev->perf, setup_args, pfile);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
+	{
+		return panthor_perf_session_teardown(pfile, ptdev->perf, args->handle);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_START:
+	{
+		perf_cmd(start);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_STOP:
+	{
+		perf_cmd(stop);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
+	{
+		perf_cmd(sample);
+	}
+	default:
+		return -EINVAL;
+	}
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1409,6 +1543,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(PERF_CONTROL, perf_control, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
@@ -1518,6 +1653,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
  *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
+ * - 1.4 - adds DEV_QUERY_PERF_INFO query
+ *       - adds PERF_CONTROL ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1531,7 +1668,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 3,
+	.minor = 4,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
-- 
2.33.0.dirty

