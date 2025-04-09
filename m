Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1103515689A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204060; cv=fail; b=hwy2ppTs5xF2JFXbTuE8sT5kADUo0wYopm2roXDdfpiDn044crbmNuyeq80nEA4yl1qvYPHNUpJiVHYu3oouleH3z0IR9ToxJcsbityqHtpOaLkvEW4Gu0RTPAFF5fQecR0tZ5noLgG1u5QZDjR4nwcdEsrLgU+bgLC5im7RRbI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204060; c=relaxed/simple;
	bh=t37jYMSkEXR88lo36M9epBBbQR2WvcrswPj2K1sW8Og=;
	h=Message-ID:Date:Subject:To:Cc:References:In-Reply-To:From:
	 Content-Type:MIME-Version; b=nFqs2aWY2bcpg9Qcz2In88l/lu3fxuofQC34tQ4U9QQyyPtfDIz0zatOLp9k0/chmXyVb9JeWACeztRW95w5+1fWrvPjX0hAFmj1meR0ixD0TgAyHRp9ETcVH01a3TCwj3mLt02jyEq/Kbpjbi9p9ApZDLbeZgslNOTZdZmxx18=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DAHwR91d; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DAHwR91d; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DAHwR91d";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DAHwR91d"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HVu6ZX9jOw80Eh1X/Wjr3TBH+jY2WpABxdnZqtXvKg2Ex9YhmecT7sy5+3kqm4zEeSUhl1qjrCz7Ze+58QRRBqaKsR11XtIxKGcRjMx2moK9AHdUENDJRzxvMMuJuaLvHWeoqmyxt+h0l8SnQzlSg2CkpRtivUbFXRTMf5s+Phm9ETY6hkLJIbNqnE9Qi8v5NjGaHXUe7HrnG/7Asc8+dMdFsE+ZJ3emI17MZM+pGNBO9SYI5modeQsyK0gXLQaZhLm+ieOVDiiRAe7+J1VvUfV5Mv1JjTIVg3vnuHfu9PZpqiGpKSEFvJ1lrrDYQ6d6hHq0WJd0ksdek4Nm5qVHUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks7oEgdQTOwY36AHvyUSLHAAT7DZurHqyJ7CciasPX8=;
 b=VTMWj9kiIIaDsB66HDUugjdCWR9cX8+/MX2FxFS12GeVCSMzwSaSYo5n0tFHpg9ZRS5Mqqm5hZb8n3DV3buIlcyIYQYBM8d63jkz5n8m2Pl83+Yqg6Uq5tUNVaYWWH5F9fSSLhTmBGmNgURJ8DcPk1glzM4mZl2E1zUTD6v2lKfoOESm4PLPp3YgrAKxFYRm3GYDTGKfNRLyhzDFyHGopVsW3aBAxh0tLwJhbu8p/xskqlgWa1dCd806UgOdVTkxRtgZ1W/NxH9v8t5pMlnyifqliMcTu6L3nkMb6DNpt1X5Kk52ONZk9e1/wp/Ma6OAEDg0fTI2P2J6z20hfTa2WQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ks7oEgdQTOwY36AHvyUSLHAAT7DZurHqyJ7CciasPX8=;
 b=DAHwR91dQp09qOS+MY4C9e5fSF8wPdSo0gh71/lmpOezwezf6ugydsLOvWXoBrXZJkQMdYSv+z6RBawS34cgaaIzcRjbzqLYhP3F+87yg5O8psQPV2Ejp5abFubuilLPVy6YVdfwNN7S6cAKuFYYah16twBprZ2C5ehg4OP7iuE=
Received: from DU2PR04CA0211.eurprd04.prod.outlook.com (2603:10a6:10:2b1::6)
 by AS8PR08MB9789.eurprd08.prod.outlook.com (2603:10a6:20b:616::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 13:07:33 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::20) by DU2PR04CA0211.outlook.office365.com
 (2603:10a6:10:2b1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Wed,
 9 Apr 2025 13:07:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Wed, 9 Apr 2025 13:07:32 +0000
Received: ("Tessian outbound ef9f95d5bce0:v605"); Wed, 09 Apr 2025 13:07:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 651ebdd7a159c37a
X-TessianGatewayMetadata: /qATlKxW4R3hwfW/mAPGyyd/xRaWuxqgUuAgd1YSkhwpotShWcYclUdl0azLtDQSOhs1e8uA9+ITVNr1u9u+GH2upEy4LkFt6tUPndOw8JK2H/YTSl09TePkJ8SlRZWlne+Kw0ZiGXwGcQK82xDRiwZjkUa0ivGOwv+gJI9LeCM=
X-CR-MTA-TID: 64aa7808
Received: from L92e7aa4ab00c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 69E1B1BE-108B-43D1-BD6E-3B00D00BC685.1;
	Wed, 09 Apr 2025 13:07:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L92e7aa4ab00c.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 09 Apr 2025 13:07:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTOY6G/3b21+P0ffkXhzcRFfV2In7MfFuBLYlIuDPsmAKKZLTHvoZlfV9Vgb6htZ2vVbG/s1ne1ZB7NXKhlgChVb9xI5SN6yOWdqJeq5QRQcCL94cmjgkyONjvRWkmyWm+pPw8AARx5qxFfCIqnfpWElMRxDh9OUlgB+0uT4YXv3wO0AparhDAFZc7ZgaAFRakJakHQsXhyGGCYCnZTSZXuXF7JdIv+3MKf21zxxCMs2r7naUJ5C9+GE77E5ZhaFYmWKSWNA8VdAbQRd3CcWcBJSurqd9a1t5Rq7cbSvRl1bIDABFR2jqnJbs34MsmDD9YZ7BCs23gepJIT9ntvZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks7oEgdQTOwY36AHvyUSLHAAT7DZurHqyJ7CciasPX8=;
 b=f00KKSWXjUanSiE34o18j5U1YJPaEpZ46NC01s6iMJeHWor3DQw+ydHT17dBybq+fnVST/Pweu36tuElBG5CBAK1JyprtSnZiJlXrZ93FW0fkHYQCLjTb1irZ++lZF9DM+8ELma7Kiu5sXT9zTF4hRE6X7Qv7J1EDiwSifjrFyW0iYhOBUHmfmBij7HwLpYrM/mkp0DfRzMOpbiZbRpKflbNbo0nWXmZWX3Oyj/SN0VwF4xtbsaV3IPiOGaDtHwHB6/OzEH0r07Uf9yWMIJ+kFzC1ncQEAQ4jMLXV9UA7gNl1oba4gEzp8hrHij5khrEja8XdPXjClCWo0iVCUW2mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ks7oEgdQTOwY36AHvyUSLHAAT7DZurHqyJ7CciasPX8=;
 b=DAHwR91dQp09qOS+MY4C9e5fSF8wPdSo0gh71/lmpOezwezf6ugydsLOvWXoBrXZJkQMdYSv+z6RBawS34cgaaIzcRjbzqLYhP3F+87yg5O8psQPV2Ejp5abFubuilLPVy6YVdfwNN7S6cAKuFYYah16twBprZ2C5ehg4OP7iuE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB10639.eurprd08.prod.outlook.com
 (2603:10a6:150:14d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 13:07:21 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 13:07:21 +0000
Message-ID: <d8fb496d-7bb3-42ad-8af7-200f393b4a73@arm.com>
Date: Wed, 9 Apr 2025 14:07:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] drm/panthor: Use 64-bit and poll register
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
 <20250320111741.1937892-3-karunika.choo@arm.com>
 <20250321085306.0d79ec5d@collabora.com>
In-Reply-To: <20250321085306.0d79ec5d@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0681.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::15) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11200:EE_|GVXPR08MB10639:EE_|DU2PEPF00028D07:EE_|AS8PR08MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e9e526-b6f7-464e-0919-08dd77677d3b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Yjd6Qjd1ekxBN3dwdlpoOXkzODJaY0JOVXVpeVMrdStGR0UxTzIxcXcxY2cr?=
 =?utf-8?B?TzRnS1RUWGJ1L0lMZ1llUGUrS24vTXBEaGRTQkVwTmppZ242NXN6Vno2Qm9K?=
 =?utf-8?B?YUVTZjJSdVBqVk5MYW93d3NmcVgrQkM2Y2NSd3g4TVlzSU8zUmVqZ0gyTDVL?=
 =?utf-8?B?OXljOVNFZnBXVEtJNHZ1TkhHZ0Yvak5HT3FNWUNma0ZxNzFQVzFiRmhnSmFp?=
 =?utf-8?B?czBnQ1Fpb1lUUGxML09jdjlOb2MvY2NFSkRtTDYxZkZ6WitCMFhXODM0ckdE?=
 =?utf-8?B?bjFBL1lNSnFpSGFuclAzLzM3ckRHSitKRzRKOU0yZStpOUFkOTNySG9hbEhM?=
 =?utf-8?B?RHdZeWNWMGRBK29oL2IvdUI3eHRoQkI5bVR6TWVzc09XZTlIbnlHTEFSdDQ3?=
 =?utf-8?B?NzExSEFXcGdDdzlyRjAvSFArVzlDbWIwbExmMkplRmJlbXhmUVF3UWRjN1Bv?=
 =?utf-8?B?WkNKRlgrSHVBN0diRmppaVhSTUhzYnROcStSQzRLaXlZVDloekFSZ1hwR2h0?=
 =?utf-8?B?SHNRTmdhc2dKNzZhOGJ0WDdBSEczSWtKZ2FCTU5XWmYwK210QzZXUUFGcjlz?=
 =?utf-8?B?YmdHaWs5M29SNTFoamVFTXJjUjVSN2V4N2JlWkZXMldiYlZjS0ZsK24vVTFp?=
 =?utf-8?B?ME1XRlQ1UUdsVVU0c3BSMlNyayt2Ky9MZFJXYUZTTHRtd3BHLzhDbEp4RE5k?=
 =?utf-8?B?TzRYMWJEdlRoYUZqU1hXeVhrcEZGcVJtNGIxRHRxNDZaWVV3RFlIWTFva1Fn?=
 =?utf-8?B?TklZSUVKeDlsRE9wRU5Ca2R6bmd3SlBhcENhMUdzdy9tUzlWYlBSRVJQbDht?=
 =?utf-8?B?ZDh2RDNveDQrS2RSRkZFMWVzekE0d2JNUlhVbnBVR3hRUXJPUDBhc0tNaVhy?=
 =?utf-8?B?bmUrMjNMSGN5V2tiV3BhZ1RUZVg2ZUlGYnY3aDNGeTFFZ2J0aWdhZUJZcWtw?=
 =?utf-8?B?Y08wOVBqVHpPUVMzbW5tV1JIeEJWTmd2L0Z4b2Z6K3lSVWpvUTVDZDJZcjE3?=
 =?utf-8?B?UlJWbm0vTURtT0RNa0NiNTZpRmJOejFvUmFTSnhzclNxaGs3TU9oL3E5MzJV?=
 =?utf-8?B?NnkrZUlJT3RDQnM4R01DZXdvN3hBYnNRSndlcU9jelZKY0JtckJpQ3luQVdI?=
 =?utf-8?B?ajlyTnlNbHFqYjIzQjJnVHVuYkE0SzBwN2dSMWhXQ0g4bVFQYzlUNEg1amQw?=
 =?utf-8?B?MjhUeVZlZDZDdW9pOXhnb1RYV3BpVzljbS9kY2lEdHlXT2EzN1RZZC9LbmE4?=
 =?utf-8?B?akc5NTFvUXFXNU5XWStNUVVYaG1ScTViVHVOVlNJM2h3b3ZzZkhUR0Zyb2l1?=
 =?utf-8?B?ZC9IYWduUzRpYiticTFBSkt3Wk9NekdWSzlRVXAzTHlxT1g4SFdBbU5aemN4?=
 =?utf-8?B?RmFxdnI2dnBwK3JZdUMxd3dhVHorUGlqRnprRU9qU3lyWXFCclYvcG5Fc0hP?=
 =?utf-8?B?WXV0bFp3dlh0cTRhVUJEVGcxY0dOR2QwWENGZXpiYllVZTMzOTY1TitwcWVT?=
 =?utf-8?B?ZEpnN3BoSWUxVmllYXNNUkNyV0h2OTNDS2R1SG9HcWo0cjFSSTdrYjdLRTdV?=
 =?utf-8?B?ck5SdEthWWRyRHZMRG9qUElxcTZmdHV6OGxoekZNemxXaDRYZWd0M2JJVGhp?=
 =?utf-8?B?aW11dW1WTUQvdTVxcEVYRlV6bHZhdmF1RUwvY2NEd2s1cGNlcWRyK0JNMEIx?=
 =?utf-8?B?TDhXUExVczdtMHdyUTR3NWV1TEtPcWNza25TTktpaGlqbTdBcWREN0RxN05S?=
 =?utf-8?B?TWljZFhxVzFIWUZyYlMxeFJjQTV4VGQvL2lPMWFYUG81WlpZTithSDFVYmxI?=
 =?utf-8?B?Unc5ZVpKMm9wR3g0bkFJWW1iOXAxaURqNkVnUjdHdCtabDQ2eDRCZHlUQU1L?=
 =?utf-8?Q?vinlfSd5jCibp?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11200.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10639
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:257::18];domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	90457e65-c131-4e02-67dc-08dd776776d5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|14060799003|376014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d00wOHVOaE1vQ0E1dWtHbytZNXNFa2lLVVpwVUlFRXRMdUZCK2xRVjRFMWcw?=
 =?utf-8?B?VzNFaWxpbE1Lcy9CM2w5SVluZlNCbzduV1h5YUo0OXYwOUt1cnQvdzhtTUcz?=
 =?utf-8?B?MWZKdWVpdWdGQzRnNjNZYVNSMUdHQ2gyTFpjekFSdlFOcFBSQU9lM21acGNF?=
 =?utf-8?B?WTBTZHRCL0luNWMrVWJCZFI5Uy83bSsxeGJTdXd5SzhJODhOT2RmYzRDMkdJ?=
 =?utf-8?B?R09mQThsYUZQREkvVzQwTnBXOEx5VHFWYnVLMVg3Q2l6MnBIWjZWdTUxVWda?=
 =?utf-8?B?eDhEZWd2cWNLTzJjNDl1ZzdwN3ptSzZqc3JXU2FNSDZFNGpMdW9CMGc5TmRy?=
 =?utf-8?B?MENBWGhvQkdiUmpCa2NNTUJYaE8yckxrdGNpbmlyS25oQmlDeEJQZTI0Y0dk?=
 =?utf-8?B?N3BsRFlJVFNkT2g3K09sYnpteFlIcm5UMllVYzVzOHNVcmhUN3BBaW54cll5?=
 =?utf-8?B?Qm1hdnRINitOMnhCNTJlRHpBNTZ1N2xXaWZHcGRMTmFINVFWUTJyV2lmOHJy?=
 =?utf-8?B?K3lGZmtwanErUXRURUxxcThTZzZHcU85RUVEVGxwZW9nTGg3eEJLYzQrL3dK?=
 =?utf-8?B?ck81cUNsRkFaTkJjNi9IcFRJdkpwM0JDelFvelY1NmgxbjFQeC82K29oZFpO?=
 =?utf-8?B?dVQ5S01pMnBIVDN6VlcwUmtlbm9EZVRvUWUzVXZKdVZyVzhSdC9mODV1WUlj?=
 =?utf-8?B?eHJQdWh0NnBrSExmWStHUlQ2N3poa2JyZU0xVms4eUxXYVFPV0toNmFHY3FE?=
 =?utf-8?B?R3NOT3c1aWtxRHpkWEFhVGZheFJrbW9rRmhFV3F0ckZVdEd0ZU54ODNSazE4?=
 =?utf-8?B?cXRmYjBRelZ0MHEyVW51eTd3Ym04VXo3cDlLZWI5WkFSNTAvN2pnTlhnSjA5?=
 =?utf-8?B?cUl6TTBuVk5wbzR1eENRVlpXMDI2dDMzL1Z3bEt1Y01nTHJ0eDJmRVArQ1FQ?=
 =?utf-8?B?emNkbjJsR2NrQXdxTWQ5cURpUnllM0xOT1BwQnB2Mm5lUTNBbTJZK2k1R3V4?=
 =?utf-8?B?ekhLclM3MHowTWFYZklBVE9aUGhIRlpWVS81V2gvMm5EZktza3RScWo3NGlJ?=
 =?utf-8?B?ODBRWG1DdndpYjNjQnl4K2lLc0JibWp3UTg0SVkwMU0vcUxvNmJsMVpPbXc2?=
 =?utf-8?B?cTdJRVVUdHVUTllSbThOMjVPTHRzTVp3dEhQcXFjNUsvKzFhOC9lcnBSbHRY?=
 =?utf-8?B?ZzhmazY5dFNmWE4rem5XTnBjUGtLa1VYZmtuM01ESys2Mk1FNUxGMktZQm1n?=
 =?utf-8?B?YVdWOUZ3R0p3RVhQcUtuY05QVVNobFhpaS81N2lJMWRodlcvRHQwTnN4WmRM?=
 =?utf-8?B?dzFaN01ieG9nem9zRzdZRDlWMEtScTBVblRIc3JJVDl5bjFCa0VPUS9aSitW?=
 =?utf-8?B?RHE2ZXRMd1FOajgwZ1gxQWVFdms1Y0RxbmV6azhlVWdpUGlvb3NTSERoRkNU?=
 =?utf-8?B?YlFCUGdqUHNscTIwVVV1ajBOdkxONVZWalhBTnBQY3VjLzBYS1JKMjhQYUhH?=
 =?utf-8?B?NlRmUDc5TWVCRmRSQzk3Q0ZHbHcrbi9LMHB4OURyNnp1dkEwUDdtTFhaeG9a?=
 =?utf-8?B?eml3RTBod1ZDNE54SjJ1OWdPdEVRdVBuYzVzdGg1bEo5Rk9tcUx0c3JKcG5T?=
 =?utf-8?B?SndpYXo3cEkrTnkxdHhQMytwRUVvSG1jWlljdEdibnRqaEZjRHJ4RmRBSzRC?=
 =?utf-8?B?b1hzUlBnbDZOZXN5ZWoya1ZvWklYc3E0YzdLY3U2WWVNODRnY29rM3lPdkRj?=
 =?utf-8?B?NXV3cFN2aitCemxtMkhmRnZlMFEveTNJR3ZseG1PaUZuc3p5WTltMTMzOHRX?=
 =?utf-8?B?M2pQdEVFQ094L3ErS29ZRVdyVTBFcWdYNXJ5YnpRRENKU0RPK1Jsbi9SVWY4?=
 =?utf-8?B?cE1scFgrcDFySENRb2RtL0hMbG1kMkh2ai9MWlZCdXFza2tnTlRqVG1WN2ZU?=
 =?utf-8?B?T093TU1EWkkvWWVWdkpjUXNqRDZRa21nbU50aW5zdUozSjlhTmdQMytsV2J3?=
 =?utf-8?B?UUJUcE9XdjJrSUFPSHpVRGpORHVSeThieDM3UTRjYitma2Q1clc2NVlOTTA3?=
 =?utf-8?Q?FJlEfZ?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(376014)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 13:07:32.2836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e9e526-b6f7-464e-0919-08dd77677d3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9789

On 21/03/2025 07:53, Boris Brezillon wrote:
> On Thu, 20 Mar 2025 11:17:34 +0000
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
>> This patch updates Panthor to use the new 64-bit accessors and poll
>> functions.
> 
> nit: I don't think it makes sense to dissociate the introduction of the
> new helpers and their use. Could we squash this patch into the previous
> one?

It was previously requested that I split the patches into two to ease
review. I can merge it back into the previous one in v3.

Kind regards,
Karunika Choo

>
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_fw.c  |   9 +-
>>  drivers/gpu/drm/panthor/panthor_gpu.c | 142 +++++++-------------------
>>  drivers/gpu/drm/panthor/panthor_mmu.c |  34 ++----
>>  3 files changed, 53 insertions(+), 132 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>> index 0f52766a3120..ecfbe0456f89 100644
>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>> @@ -1059,8 +1059,8 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
>>  	u32 status;
>>  
>>  	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
>> -	if (readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
>> -			       status == MCU_STATUS_DISABLED, 10, 100000))
>> +	if (gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
>> +				  status == MCU_STATUS_DISABLED, 10, 100000))
>>  		drm_err(&ptdev->base, "Failed to stop MCU");
>>  }
>>  
>> @@ -1085,8 +1085,9 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
>>  
>>  		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
>>  		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
>> -		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
>> -					status == MCU_STATUS_HALT, 10, 100000)) {
>> +		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
>> +					   status == MCU_STATUS_HALT, 10,
>> +					   100000)) {
>>  			ptdev->reset.fast = true;
>>  		} else {
>>  			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>> index 671049020afa..0dee011fe2e9 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>> @@ -108,14 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
>>  
>>  	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
>>  
>> -	ptdev->gpu_info.shader_present = gpu_read(ptdev, GPU_SHADER_PRESENT_LO);
>> -	ptdev->gpu_info.shader_present |= (u64)gpu_read(ptdev, GPU_SHADER_PRESENT_HI) << 32;
>> -
>> -	ptdev->gpu_info.tiler_present = gpu_read(ptdev, GPU_TILER_PRESENT_LO);
>> -	ptdev->gpu_info.tiler_present |= (u64)gpu_read(ptdev, GPU_TILER_PRESENT_HI) << 32;
>> -
>> -	ptdev->gpu_info.l2_present = gpu_read(ptdev, GPU_L2_PRESENT_LO);
>> -	ptdev->gpu_info.l2_present |= (u64)gpu_read(ptdev, GPU_L2_PRESENT_HI) << 32;
>> +	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
>> +	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
>> +	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
>>  
>>  	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
>>  	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
>> @@ -152,8 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>>  {
>>  	if (status & GPU_IRQ_FAULT) {
>>  		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
>> -		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
>> -			      gpu_read(ptdev, GPU_FAULT_ADDR_LO);
>> +		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
>>  
>>  		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
>>  			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
>> @@ -244,45 +238,27 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
>>  				u32 pwroff_reg, u32 pwrtrans_reg,
>>  				u64 mask, u32 timeout_us)
>>  {
>> -	u32 val, i;
>> +	u32 val;
>>  	int ret;
>>  
>> -	for (i = 0; i < 2; i++) {
>> -		u32 mask32 = mask >> (i * 32);
>> -
>> -		if (!mask32)
>> -			continue;
>> -
>> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
>> -						 val, !(mask32 & val),
>> -						 100, timeout_us);
>> -		if (ret) {
>> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
>> -				blk_name, mask);
>> -			return ret;
>> -		}
>> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
>> +					      100, timeout_us);
>> +	if (ret) {
>> +		drm_err(&ptdev->base,
>> +			"timeout waiting on %s:%llx power transition", blk_name,
>> +			mask);
>> +		return ret;
>>  	}
>>  
>> -	if (mask & GENMASK(31, 0))
>> -		gpu_write(ptdev, pwroff_reg, mask);
>> -
>> -	if (mask >> 32)
>> -		gpu_write(ptdev, pwroff_reg + 4, mask >> 32);
>> -
>> -	for (i = 0; i < 2; i++) {
>> -		u32 mask32 = mask >> (i * 32);
>> +	gpu_write64(ptdev, pwroff_reg, mask);
>>  
>> -		if (!mask32)
>> -			continue;
>> -
>> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
>> -						 val, !(mask32 & val),
>> -						 100, timeout_us);
>> -		if (ret) {
>> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
>> -				blk_name, mask);
>> -			return ret;
>> -		}
>> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
>> +					      100, timeout_us);
>> +	if (ret) {
>> +		drm_err(&ptdev->base,
>> +			"timeout waiting on %s:%llx power transition", blk_name,
>> +			mask);
>> +		return ret;
>>  	}
>>  
>>  	return 0;
>> @@ -305,45 +281,26 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
>>  			       u32 pwron_reg, u32 pwrtrans_reg,
>>  			       u32 rdy_reg, u64 mask, u32 timeout_us)
>>  {
>> -	u32 val, i;
>> +	u32 val;
>>  	int ret;
>>  
>> -	for (i = 0; i < 2; i++) {
>> -		u32 mask32 = mask >> (i * 32);
>> -
>> -		if (!mask32)
>> -			continue;
>> -
>> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
>> -						 val, !(mask32 & val),
>> -						 100, timeout_us);
>> -		if (ret) {
>> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
>> -				blk_name, mask);
>> -			return ret;
>> -		}
>> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
>> +					      100, timeout_us);
>> +	if (ret) {
>> +		drm_err(&ptdev->base,
>> +			"timeout waiting on %s:%llx power transition", blk_name,
>> +			mask);
>> +		return ret;
>>  	}
>>  
>> -	if (mask & GENMASK(31, 0))
>> -		gpu_write(ptdev, pwron_reg, mask);
>> -
>> -	if (mask >> 32)
>> -		gpu_write(ptdev, pwron_reg + 4, mask >> 32);
>> -
>> -	for (i = 0; i < 2; i++) {
>> -		u32 mask32 = mask >> (i * 32);
>> +	gpu_write64(ptdev, pwron_reg, mask);
>>  
>> -		if (!mask32)
>> -			continue;
>> -
>> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + rdy_reg + (i * 4),
>> -						 val, (mask32 & val) == mask32,
>> -						 100, timeout_us);
>> -		if (ret) {
>> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
>> -				blk_name, mask);
>> -			return ret;
>> -		}
>> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
>> +					      100, timeout_us);
>> +	if (ret) {
>> +		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
>> +			blk_name, mask);
>> +		return ret;
>>  	}
>>  
>>  	return 0;
>> @@ -492,26 +449,6 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
>>  	panthor_gpu_l2_power_on(ptdev);
>>  }
>>  
>> -/**
>> - * panthor_gpu_read_64bit_counter() - Read a 64-bit counter at a given offset.
>> - * @ptdev: Device.
>> - * @reg: The offset of the register to read.
>> - *
>> - * Return: The counter value.
>> - */
>> -static u64
>> -panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
>> -{
>> -	u32 hi, lo;
>> -
>> -	do {
>> -		hi = gpu_read(ptdev, reg + 0x4);
>> -		lo = gpu_read(ptdev, reg);
>> -	} while (hi != gpu_read(ptdev, reg + 0x4));
>> -
>> -	return ((u64)hi << 32) | lo;
>> -}
>> -
>>  /**
>>   * panthor_gpu_read_timestamp() - Read the timestamp register.
>>   * @ptdev: Device.
>> @@ -520,7 +457,7 @@ panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
>>   */
>>  u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
>>  {
>> -	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
>> +	return gpu_read64_sync(ptdev, GPU_TIMESTAMP_LO);
>>  }
>>  
>>  /**
>> @@ -531,10 +468,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
>>   */
>>  u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
>>  {
>> -	u32 hi, lo;
>> -
>> -	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
>> -	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
>> -
>> -	return ((u64)hi << 32) | lo;
>> +	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
>>  }
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index 12a02e28f50f..a0a79f19bdea 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -510,9 +510,9 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
>>  	/* Wait for the MMU status to indicate there is no active command, in
>>  	 * case one is pending.
>>  	 */
>> -	ret = readl_relaxed_poll_timeout_atomic(ptdev->iomem + AS_STATUS(as_nr),
>> -						val, !(val & AS_STATUS_AS_ACTIVE),
>> -						10, 100000);
>> +	ret = gpu_read_relaxed_poll_timeout_atomic(ptdev, AS_STATUS(as_nr), val,
>> +						   !(val & AS_STATUS_AS_ACTIVE),
>> +						   10, 100000);
>>  
>>  	if (ret) {
>>  		panthor_device_schedule_reset(ptdev);
>> @@ -564,8 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>>  	region = region_width | region_start;
>>  
>>  	/* Lock the region that needs to be updated */
>> -	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
>> -	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
>> +	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
>>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
>>  }
>>  
>> @@ -615,14 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>>  	if (ret)
>>  		return ret;
>>  
>> -	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
>> -	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
>> -
>> -	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
>> -	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
>> -
>> -	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
>> -	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
>> +	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
>> +	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
>> +	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
>>  
>>  	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
>>  }
>> @@ -635,14 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
>>  	if (ret)
>>  		return ret;
>>  
>> -	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), 0);
>> -	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), 0);
>> -
>> -	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), 0);
>> -	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), 0);
>> -
>> -	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
>> -	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), 0);
>> +	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
>> +	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
>> +	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
>>  
>>  	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
>>  }
>> @@ -1680,8 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>>  		u32 source_id;
>>  
>>  		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
>> -		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
>> -		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
>> +		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
>>  
>>  		/* decode the fault status */
>>  		exception_type = fault_status & 0xFF;
> 
