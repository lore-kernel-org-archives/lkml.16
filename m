Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013059.outbound.protection.outlook.com [40.107.162.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F8F1DF982
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.59
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111414; cv=fail; b=jRQh0zk4QbT3UwFuOQ5mX1m0JbtEjsmv3eM8PZuKhPXhHsGi38g88BFYj06An+NmYfU2UxLLn540ac7ezjWBLpAHMPVp0BtyaZjwnDMwpgpVmjx0n/aS8GsAZ2g28qxB0mfua/vAJzDva1MC1gbcRuQqVgPYnbIP3RY4KCRNfDA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111414; c=relaxed/simple;
	bh=wig8nx71MA6kvNFJEMf0Fbb2bM+thXB4pQ3NNrW/Oqg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A6Fp2/OD15cV0I3mzZZ9MJwoUZcv5PF8+BWGwSiK+5vvFUF/fcohoBbRUF1cTJchQegPRDP55sWprJFrbICUtenGpRmG3joZ+95oG1Txl+EueCE7LUeoVSStiL1Zq5RcqS5A8WuaA07JUIKqO8xAkeA0JSqm8Sc+nMAa9Ug0bpA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Zj+0mp3F; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Zj+0mp3F; arc=fail smtp.client-ip=40.107.162.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Zj+0mp3F";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Zj+0mp3F"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X8cIJMk3W2R/ZgmtvFHAyKIVs1yVZEyhNFXkdU8bJkcUUoPTBbQjnlYsO+ByTCYgHNWDTVZQczhhMe9Z0cOBji9WL86ySBDwDARvxZX98cAxURrpCC8vvi9MDMV3o1RWLupDXdVuNcQz4kxDCaZKTX/zZwqGQqDhhSe1c9DJwnWNx9fDEp+gySYnQUNL6SaYFNRy8xj4Prt7VHpd/bZpGu5dvergCS1DQE9KNpGcf7NrB31neKtNQkH38PPUTcYscfc5NaZhJWZxqg/m2yDh1IKdom7SrhRPYhx8CxX0Cre4xEJFUzrBHGBjHSy4Ci0pJCEOMVdYxS5DipJkhgg2mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvSJuV3fWYLVGDS01dxU/xT7odXAnfgWkFsFIs75UWw=;
 b=QzuWTR8ZA9txueeIbjeeMJsatLZr/0eNzI0SZ6TdRoQc+TiC2/n6Im9mZTCZxJc32gy/otEhPfa/6TO5ohwMXmbz2iFlu74MO/mQtx9A7Q6TwMfhHRlT9TnN6HF45I61+f1ZSH7a/mXuaNwg78wSypR5nudqqQc1SIKO14wGlxmb6WzKuhFdqb9jQH52q9xdwyJRY9gA6kjbDl4xkMoSuM0yAKfprkjNCDt2IoFXkyaCAXexZGq47X6R9mSiLmQb2OKUifC1TXmxhBCxpUpUSODqjOGrBpIlLddV0wvWThykcDmSZ8dHS1UyR2mKPi3cx6OPXEM1BssAWeYFC+NumQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvSJuV3fWYLVGDS01dxU/xT7odXAnfgWkFsFIs75UWw=;
 b=Zj+0mp3FWurEI2cN2azbPUguv7Zu1NfVvASrxjwjKfBZhpCmQch8b370Edi9phIHK8VctgIjNd+RWiFqTlmIuXzNSI928y1oTwtQPFiWwc+j3B91MsFXy5WZWijT6XSxkrKNIyWxmguU+wNQhHVU8SNPXHcZTbNeuc/UwQc9ux0=
Received: from JNXP275CA0034.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::22) by
 PA4PR08MB6287.eurprd08.prod.outlook.com (2603:10a6:102:ef::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.20; Thu, 5 Jun 2025 08:16:42 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:1086:0:18:cafe::29) by JNXP275CA0034.outlook.office365.com
 (2603:1086:0:18::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.32 via Frontend Transport; Thu,
 5 Jun 2025 08:16:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 08:16:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SckC1pgEANSDbxhVCi43SfamoZbZxowJZCphp0+W5psOh0Gj03kxTD6dhFlCo+4zZ0U5DIBE1Pyf/CysfG6pp2UxoW1IgXhNYfHKHpmA5Zs8ikWgO4itzs7E0PoI4ToAxQbnddLaoGyVpbNcuqG3O6BSonDy6XghZWWv6jZoAQ1idNbdQVC5Xx1mKVJEgkJ8HCnfyG0NBich3WhVzPfeiYmxYu4SJ22WCzz506WSkOPDKccCC/t+aeObUJfEWpozZt9or266uUx6+PJFWTSsBuv8wBr4ugtydpBTG85+7qqln5lba4GNOEeE22aesQzutwWkFfD3ECIhrEuzWJe1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvSJuV3fWYLVGDS01dxU/xT7odXAnfgWkFsFIs75UWw=;
 b=sriPMSlPS9LafV2HXgEoRNHU9BjGuDQq+MpqstqLtKc6gaX+4QSiaejfJzTMen9vDiCXzR0Sf2iwTYZIvslV0JEp0kvji3+sW07d4/gXOjXg5tltOnwV7tDgg8houdm216ufkXedfdwnV6IAwAfU3Hw8Yk2UAgScq/86rsm8OPoR0ovQwJ0DoL6Wmf5peXPmDsl+4nV/ipCcmGo7pJftVXcHsyQH9rLYr9C4Sik5hosoXa62XxQuebzNKcl45lr7yvxAXTI6tvt7nxu+q8cQj0X5FjiJuSjZDPJ12fag7xw5cKMHA707Sa3/Sw5SkyGgCvRFyxRQ0JQK41j5VU+EuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvSJuV3fWYLVGDS01dxU/xT7odXAnfgWkFsFIs75UWw=;
 b=Zj+0mp3FWurEI2cN2azbPUguv7Zu1NfVvASrxjwjKfBZhpCmQch8b370Edi9phIHK8VctgIjNd+RWiFqTlmIuXzNSI928y1oTwtQPFiWwc+j3B91MsFXy5WZWijT6XSxkrKNIyWxmguU+wNQhHVU8SNPXHcZTbNeuc/UwQc9ux0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAWPR08MB9544.eurprd08.prod.outlook.com (2603:10a6:102:2f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 08:16:07 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 08:16:06 +0000
Message-ID: <33dd9ce3-f6ab-4054-9245-7338f06afbfd@arm.com>
Date: Thu, 5 Jun 2025 13:46:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
From: Dev Jain <dev.jain@arm.com>
To: Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
Cc: catalin.marinas@arm.com, anshuman.khandual@arm.com,
 quic_zhenhuah@quicinc.com, kevin.brodsky@arm.com, yangyicong@hisilicon.com,
 joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david@redhat.com
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
 <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
 <4202a03d-dacd-429c-91e6-81a5d05726a4@arm.com>
 <20250530123527.GA30463@willie-the-truck>
 <b223245d-c43c-4d3e-86d4-9fbfd90cfacf@arm.com>
 <20250530133625.GA30622@willie-the-truck>
 <6cd41ae9-303d-4eda-8d64-f7dba19eb106@arm.com>
Content-Language: en-US
In-Reply-To: <6cd41ae9-303d-4eda-8d64-f7dba19eb106@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::9) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAWPR08MB9544:EE_|DB1PEPF00039232:EE_|PA4PR08MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 383ea788-ace8-446b-9851-08dda4094c8f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YTMxeTJRMTZmcE13WGJjNE1DWWJnVFFvaVY2elhLdnYvZ1drQkpBcFdmK0Q0?=
 =?utf-8?B?ZGlnUWI2dlpzS3hFZHpSWHNGTjdpMy9NRWpjWGdaSnh5RC9MTDU0R2t6dXEz?=
 =?utf-8?B?OHgvRElSOHF3N0J6UmVESU80OXNpMmt5RnZLOUF2dENsK1FOaGxqOGFrMEl4?=
 =?utf-8?B?N3BubFhnTFM2ZmRsRGViYzRXbzNBVkFkb3VFQWVweGg0c2FJTlAzZ3haalBV?=
 =?utf-8?B?TjY5S09rN0h6aWRUOC9aUjNhSDA4WlNQSVVhWEtWRklNckc2b3ExT2dUcTZt?=
 =?utf-8?B?ZXNzNzdsTUdlSytkKzV6R0ZhaTlMRVRGWDE5ZzJxdkR6MVNZTTJtR2w5Zlhu?=
 =?utf-8?B?QUJHVEp6eS9pcWthOTVnQ2RHY2drT3dCai9Lall3dWNGdnhHTWFrS0pnZllp?=
 =?utf-8?B?Z25FdTFwZ3AxRXJtNWt1TWZEMkdIWllmU2Zxa0t0SE5iZGlnOE45S3F0S1d2?=
 =?utf-8?B?TCtOMTgzREl0OGJpcVA1bUlDaW8rMW5JRDdHaHhxSDJ4MVRja3BZR2hQblha?=
 =?utf-8?B?WnAvRHpQblN2VWJhMjByellXTk5KY2xuTDUwbi9oWGd4UDdnSVhJZ0hNVW5O?=
 =?utf-8?B?NVZYL1k4bkU5SnVDTWJDalN1MWczd0pndDRtYytiSVNLZDhNaWlPYWJ3ZnhW?=
 =?utf-8?B?Vk50RWw3aHd5Ty9VR2hoMXdkbU03aGk0Z3h3K3JKTnRxL1lQNndwaVhSTVdD?=
 =?utf-8?B?dS9aK3FxMDdJeTRxeGtYeDg3UHRWK3RRQ1dKeW5DNVRGd2FEQ1dtNkxxWDFC?=
 =?utf-8?B?Wjd1MFdFczBoN1FnTW9sbGNNOXpIOFA3MXB2dlZjWmo4QUJKRDhya3RCZkQ3?=
 =?utf-8?B?d2lSZ0VUUENkd2ViTTdUelFsby96QXRyWDZseFRGOTJlQ3Rkb2R1WGhJWTFD?=
 =?utf-8?B?bU1JWWNTdUJrbHorQVdPZG45QXgxVmVjOVFzZjNqazJxNXd5SUJtaFNzMkp6?=
 =?utf-8?B?eUxSNThMc1J5Yi8vdFB3S3BVVzNydTg1blU3UEloSlE4OVpBNThjRVlLK2Fp?=
 =?utf-8?B?aTg2cXk5OFZtOFhsdDFveGtvUU9ISHEwbUg2MDJSYzVMS0E1a0JiWGJDbi9B?=
 =?utf-8?B?N0F5emltbExENlh1cWx2NDVlNmNYd0VMeFpxM2Nva2dRblpQd3hVL1pxSkFB?=
 =?utf-8?B?WFUyVUZzL2lYR29GSG4vVjhYYUtVN1NSL2dFZzU3NU5yNjFMMTRCYVFOSVdL?=
 =?utf-8?B?clRMdjFQSytXUDZBNEZSS282RHlsV25VRWlOVG52U2VwVlJhNFI2bDhKc0Nj?=
 =?utf-8?B?ZmJYWkZrZThzRi9QMmkrSWNiWjRzbGYwVkhQcHpjbE1WUnJlZVo1R0RMU0Rh?=
 =?utf-8?B?WW5Sa3JRKzFWNjA2bUhQMXRsa2VudkxTZk1hSmVNRlBkek1pYUJEQ3NvZkt5?=
 =?utf-8?B?b2NpcVZMSGJVR3I1dXVNMENBNHFvM3FHTHJxbnlsSlA5VngvUXllbnVkWlBj?=
 =?utf-8?B?TUdVczNUNDU5U1cwM2I3QUZwSUUveGZzRzk4R1FlbnBUZ1ZpaDBURUU1ajlQ?=
 =?utf-8?B?cjk0cWJwcjh5NWtvdWM2V1V1TzJweWNYQ21LK1pkN0lreWJ2UGJtNjM4SDZM?=
 =?utf-8?B?YkZOYkJFQzBaOGJnRDNJYTdDVDFXZ29HSUcrM0VadVFzQi93NjNQNi93VERG?=
 =?utf-8?B?RmlrakQzZ29yL1YzMkJmMEpyUUdNdEEzNkNZRWlWREd4OHduUmlENEVWbEtM?=
 =?utf-8?B?VE9RVWxiNElCMk5rOThIQ1ZBN2pSMHEzYldVYjBOaXFSYXd1U3BXaWtlU0gx?=
 =?utf-8?B?VjJVRWdvTWFxa0JHSkNGMWZJNUJ0VGVxOU4zRUlFL1VrWHpIZTFzMXdXUllu?=
 =?utf-8?B?VU9jTkJYMk5ETTRRUmpaMUpOMUZObVNkYjluK1YwSG1sL1hWdUJZUXBxYXBV?=
 =?utf-8?B?TG9MRmljb3hzOGZSVk5jQzVkdHFtdlFQSHp3Z0dWRUJPRXc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9544
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3077f7e-4402-4b35-a61a-08dda409386c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|35042699022|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGlmUFRmN1U3SkQ5QXgyMk0vY2xtQ0xyTGp5dkRBZnFabFpXalBnWlVpc1o3?=
 =?utf-8?B?aUI5K2ZwRC9DMXNuMER3YUVaVVljNWRMcFZ1V0pFZVRzK0ZDVkwwMG9wZzV0?=
 =?utf-8?B?ZmcydHowSXhnRDNqTzc1WGY0M1VkQU5UUG9mSWZpaXJhZWFMZkdERjhNR2Zi?=
 =?utf-8?B?YTc0VytqVEZiVjZyQUFzM3FoZTBwSmhEUFAxcG1ncGcxalVLUUVnVWdNVFJS?=
 =?utf-8?B?M1J6bGM1eUgvb2hqak1LU2lyMjdJQVErSm9BOCtQb0puOHhscXZYRkdJN0lv?=
 =?utf-8?B?UnhScWEwdjBieGpmODdJbXVyRUJDSHBGUExwcDVNbmdSVnN0VUZxY2dUWjJz?=
 =?utf-8?B?czhWM01reU5DMXFna1djakg2Um5QRGpRZHl1c3laRE4vMFF1ZnRYQ2tNdXF1?=
 =?utf-8?B?UnhibTR5MTIrTlF5Rm14M2tYZ2RGMC96d1dzRWNObzc3MEFFeElaWTlabXBZ?=
 =?utf-8?B?N3o5YjBaT2xrSElTcjVXWktabmtjYVRtZDNkWis4N3FvdllBc1VKVUFSaENM?=
 =?utf-8?B?NlB3WmUwLzR3MEk5ZmY4c3Z6ZzQ0RlN4bmE5VG5QMWJmZHZnMUtQMDdxWmIx?=
 =?utf-8?B?M1BGazhYT3RXTkRQVE9pQ1g1UHVTbnBGL3VTM1NQYjM2SzN4RURjdUlUZndr?=
 =?utf-8?B?NnRvdWlFblJibUk4SituM3B5S1BIeTVHclVpUjhRRWhrZ2txUDRKVFRDV1l3?=
 =?utf-8?B?VVhtcEl1OUxCekZWaFZOWEJ1eURGTWh0SDRpY0xzR3dEV094M20wSGxpTTdu?=
 =?utf-8?B?MkxXSnAxWUFka3Q1c1o3UzdpY3Y0ZURjeVRYRXNTNVl6MEV5QkFOdXpFUW14?=
 =?utf-8?B?RFRuRDAyK29NcXBmNVBxNDB2dGd4K2tUdUw4bGpGc0o0dGVmeVhZTW9DT2pD?=
 =?utf-8?B?dGNJNXJ0dUVQZEkzUnZxektrU0xJTmJJNmhSRSt2SDFqN0FVemY1UWhyeGFS?=
 =?utf-8?B?ZlBuRXVkMkpQNkxCYTdENDdFQWJKZmUyRjE0Smd6K2t4dTBwYk9OdlprTzA3?=
 =?utf-8?B?cFBRYkRPdjc3L1pGbGx4ckVHUU0zVU8wUVVoYmJXS015cVpRQWx4bGN2dXhk?=
 =?utf-8?B?dGNYQ2N5NnFERnFMK1ZWdGdZQkF3UGVFWmczUTNpQUNHa3FwK01WNHRzblFs?=
 =?utf-8?B?b3JRbGlzV0w5eVFxUStjNWk1ZlNPMldGa2lzS1o1bEpNNHFKaGJNdGRlejZ4?=
 =?utf-8?B?WHJSRkxLSTFHb1VhUGpDdEFLTmhIaUVILzdEd3YzR2RyTCtxQVRxb1Bmemo3?=
 =?utf-8?B?WkxIT3lDOU1SSnVIMUtPLzNPbVZGVERPOFZGR1owTjZaVHhMTWZaeXNINno1?=
 =?utf-8?B?WmViWEdoN05jRHFYSlhqL1lTemo4aW9jMUZwdHVsaWtCbVdkRWxvd1F4M1pF?=
 =?utf-8?B?UGloTmtMUzlNR0FPQVdaRHlsZDJURmpDbGNKV2k2aXBGNVI5c0xEQ1dnenlW?=
 =?utf-8?B?MXE4c0lqdlloT1lkSEFucUpvdEV4VnVaT3RaNHVNdWRhOUxOMHpUQnBUSVFr?=
 =?utf-8?B?SnR2ZDlLekgrdEhsVjUwS1B5RzZJdldpQnZvQ0lVdjVCVjFTaFRhVHl6NUhX?=
 =?utf-8?B?bFlLRmlpajBCNnFOb2hpNUhCb3JnaFhiRllsQ05BQzlRbm5ScnNvK3ZOWDU3?=
 =?utf-8?B?YXA0L3RuWFhRWUx5WlVWZGhXb1hQSldJL3hSdnpBSWIrcWp2NzVLbm1relFR?=
 =?utf-8?B?SytkUEU4bTBKbnJ3a05Zc3c0UkFHb21tOUd5ZE9rSEZkS1VwcUVwL05JLzRB?=
 =?utf-8?B?QWk0OXpNaGJtZEg1VHBWaDU0dDJXQXFQYWN4ZlVzYjFZOEs0VTloZ1Nhdnl0?=
 =?utf-8?B?U0E3Z3NaaWxERHNQUzBhME5ZUmJWVkIyQ1R0N09RRGkvNG1Fa296MXFKYWh0?=
 =?utf-8?B?TTBkY1ZPTDFtYzdKK0RCQ3RVaE5XYUhickFDb3haQ0xIcFdpbXJvc2VSK3hX?=
 =?utf-8?B?MkNaSDVpS3ZSbGZhNnNHaDBCQWI2L0RQMHA4Tm1CZWFvR2lUcHp4WDFVa2tL?=
 =?utf-8?B?aXRGOEUyUG14S0ZrSlNGU0lteXlOOFQ3WW9WbjZQRzlYZ0tLbUtYVjZmNHJv?=
 =?utf-8?Q?aOClL7?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(35042699022)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 08:16:40.1540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 383ea788-ace8-446b-9851-08dda4094c8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6287


On 05/06/25 10:18 am, Dev Jain wrote:
>
> On 30/05/25 7:06 pm, Will Deacon wrote:
>> On Fri, May 30, 2025 at 02:11:36PM +0100, Ryan Roberts wrote:
>>> On 30/05/2025 13:35, Will Deacon wrote:
>>>> On Fri, May 30, 2025 at 12:50:40PM +0100, Ryan Roberts wrote:
>>>>> On 30/05/2025 10:14, Dev Jain wrote:
>>>>>> On 30/05/25 2:10 pm, Ryan Roberts wrote:
>>>>>>> On 30/05/2025 09:20, Dev Jain wrote:
>>>>>>>> arm64 disables vmalloc-huge when kernel page table dumping is 
>>>>>>>> enabled,
>>>>>>>> because an intermediate table may be removed, potentially 
>>>>>>>> causing the
>>>>>>>> ptdump code to dereference an invalid address. We want to be 
>>>>>>>> able to
>>>>>>>> analyze block vs page mappings for kernel mappings with ptdump, 
>>>>>>>> so to
>>>>>>>> enable vmalloc-huge with ptdump, synchronize between page table 
>>>>>>>> removal in
>>>>>>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable 
>>>>>>>> walking. We
>>>>>>>> use mmap_read_lock and not write lock because we don't need to 
>>>>>>>> synchronize
>>>>>>>> between two different vm_structs; two vmalloc objects running 
>>>>>>>> this same
>>>>>>>> code path will point to different page tables, hence there is 
>>>>>>>> no race.
>>>>>> My "correction" from race->no problem was incorrect after all :) 
>>>>>> There will
>>>>>> be no race too since the vm_struct object has exclusive access to 
>>>>>> whatever
>>>>>> table it is clearing.
>>>>>>
>>>>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>>>>>> ---
>>>>>>>>    arch/arm64/include/asm/vmalloc.h | 6 ++----
>>>>>>>>    arch/arm64/mm/mmu.c              | 7 +++++++
>>>>>>>>    2 files changed, 9 insertions(+), 4 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/include/asm/vmalloc.h 
>>>>>>>> b/arch/arm64/include/asm/vmalloc.h
>>>>>>>> index 38fafffe699f..28b7173d8693 100644
>>>>>>>> --- a/arch/arm64/include/asm/vmalloc.h
>>>>>>>> +++ b/arch/arm64/include/asm/vmalloc.h
>>>>>>>> @@ -12,15 +12,13 @@ static inline bool 
>>>>>>>> arch_vmap_pud_supported(pgprot_t prot)
>>>>>>>>        /*
>>>>>>>>         * SW table walks can't handle removal of intermediate 
>>>>>>>> entries.
>>>>>>>>         */
>>>>>>>> -    return pud_sect_supported() &&
>>>>>>>> -           !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>>>>>>> +    return pud_sect_supported();
>>>>>>>>    }
>>>>>>>>      #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>>>>>>>>    static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>>>>>>>    {
>>>>>>>> -    /* See arch_vmap_pud_supported() */
>>>>>>>> -    return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>>>>>>> +    return true;
>>>>>>>>    }
>>>>>>>>      #endif
>>>>>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>>>>>> index ea6695d53fb9..798cebd9e147 100644
>>>>>>>> --- a/arch/arm64/mm/mmu.c
>>>>>>>> +++ b/arch/arm64/mm/mmu.c
>>>>>>>> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, 
>>>>>>>> unsigned long addr)
>>>>>>>>        }
>>>>>>>>          table = pte_offset_kernel(pmdp, addr);
>>>>>>>> +
>>>>>>>> +    /* Synchronize against ptdump_walk_pgd() */
>>>>>>>> +    mmap_read_lock(&init_mm);
>>>>>>>>        pmd_clear(pmdp);
>>>>>>>> +    mmap_read_unlock(&init_mm);
>>>>>>> So this works because ptdump_walk_pgd() takes the write_lock 
>>>>>>> (which is mutually
>>>>>>> exclusive with any read_lock holders) for the duration of the 
>>>>>>> table walk, so it
>>>>>>> will either consistently see the pgtables before or after this 
>>>>>>> removal. It will
>>>>>>> never disappear during the walk, correct?
>>>>>>>
>>>>>>> I guess there is a risk of this showing up as contention with 
>>>>>>> other init_mm
>>>>>>> write_lock holders. But I expect that 
>>>>>>> pmd_free_pte_page()/pud_free_pmd_page()
>>>>>>> are called sufficiently rarely that the risk is very small. 
>>>>>>> Let's fix any perf
>>>>>>> problem if/when we see it.
>>>>>> We can avoid all of that by my initial approach - to wrap the 
>>>>>> lock around
>>>>>> CONFIG_PTDUMP_DEBUGFS.
>>>>>> I don't have a strong opinion, just putting it out there.
>>>>> (I wrote then failed to send earlier):
>>>>>
>>>>> It's ugly though. Personally I'd prefer to keep it simple unless 
>>>>> we have clear
>>>>> evidence that its needed. I was just laying out my justification 
>>>>> for not needing
>>>>> to doing the conditional wrapping in this comment.
>>>> I really don't think we should be adding unconditional locking 
>>>> overhead
>>>> to core mm routines purely to facilitate a rarely used debug option.
>>>>
>>>> Instead, can we either adopt something like the RCU-like walk used by
>>>> fast GUP or stick the locking behind a static key that's only enabled
>>>> when a ptdump walk is in progress (a bit like how
>>>> hugetlb_vmemmap_optimize_folio() manipulates 
>>>> hugetlb_optimize_vmemmap_key)?
>>> My sense is that the static key will be less effort and can be 
>>> contained fully
>>> in arm64. I think we would need to enable the key around the call to
>>> ptdump_walk_pgd() in both ptdump_walk() and ptdump_check_wx(). Then 
>>> where Dev is
>>> currently taking the read lock, that would be contingent on the key 
>>> being
>>> enabled and the unlock would be contingent on having taken the lock.
>>>
>>> Does that sound like an acceptable approach?
>> Yup, and I think you'll probably need something like a synchronize_rcu()
>> when flipping the key to deal with any pre-existing page-table freers.
>
> IIUC, you mean to say that we need to ensure any existing readers having
> a reference to the isolated table in pmd_free_pte_page and friend, 
> have exited.
> But the problem is that we take an mmap_write_lock() around 
> ptdump_walk_pgd() so
> this is a sleepable code path.

The mmap_write_lock around ptdump_walk_pgd() is definitely restrictive. 
I think that

was put because ptdump is rarely used, I think we could have done 
RCU-freeing of pagetables to

synchronize between ptdump and vmalloc pagetable lazy freeing/ hotunplug 
pagetable freeing.


>
>>
>> Will
>
