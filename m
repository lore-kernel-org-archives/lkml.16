Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7624467A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.20
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282748; cv=fail; b=qKGjdtaSQdKpkY1k1U6xhOCpS2XvjUWSffqGRWrbYCGdiREB2Idf/6DOed1LeTV9DVq7aJkACTELc/AQnLiXvRTob1M7czpzFpDZyNisVPUZ5oAo4bSiP0b7YyWGS2Y8doWsNNTMIRTJ1c9mw7Q/DAb7zvsKsZt9i9FQthWJa/o=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282748; c=relaxed/simple;
	bh=RtgwmAZkBjG2zFqv3uhPStLU5gWOCKMdO8NQrf/r97U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ilhME+fuJZqCdIZ6iLcMd13YyVh4Y6FgQ7VxpZHxSU7L5X13hOuF6pGUP3w9U30yeG7VqxFRNpiDrGrMYMdMIoLc3d0Vsa+SUY4UXbYNJe66BsGiTFzmiU/tKJ+JtTPLFviZ6N2n6ztZCqWLzGvTOKLj7fZAHvEn1f5pXxUBKwk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NdrpLyZ9; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NdrpLyZ9; arc=fail smtp.client-ip=52.101.66.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NdrpLyZ9";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NdrpLyZ9"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gIAr7sTRM3V0kX5pL46FFu7ij0iyb1n0iMatmmogLHJ5WRAcVyVsXPr93/LDoKcytGkvbPOkd9uc2G8xWJVzzmZINtcElbzQnYwcfecQQ2AE6MbKS/V6TCXi0WGRgQhUUGifn7A7INCXXsYPNbCRjiPkHjLxOpNPOXa+AcmMB7OIwDn5ujBoMPWgsQmMg/2ZzV+3xf4zor06CddI8m0eIn3DD0Xmh1DzBccT63T9rYpYcp+agW0dXrsA2vUWjWtxNeeXUqwe4ym16/3eHdxSKxUEcYiYSszrmP1x711sG/aj4TpEUp/LbF+NxVOOvHGedQfImhQic7N6gTJYyyyIwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGXCN1FrGIZ50Ydn6DyHU+9FQAF9h34R7AP0Nfk2yLY=;
 b=J06FxQAIrBqI8pNjRQ0h1WlDtox0zi5+X4QH9vGxPRq9BL4sGNfuYnWnMn8jTzJwG9M4D6Pu3I/Z9/uGJFvyr8IcEYdA4fzzS/uT7gXQ/oSR1u8EOFvQpHiJPa/3ZjI6gfi/OjXyZrivT6gXPHmP3zhWxU52edWiTz+WzAkWQOKfrogCOgwMnPOIp81TOhMLfQJYtftcWdldIo3F0r9YdXlkVowZGLHU2MZrtuRyB4ESUY/tsqi+LezyqkaSuhHFHx1yUR2PF6ynkDNi4FqE037FWwpbUfHCd0ORvAM/2OoTnYBQVb0aYfOWpdsLFJ3sMvwNBFip+s0ZCLLo4eu9nA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGXCN1FrGIZ50Ydn6DyHU+9FQAF9h34R7AP0Nfk2yLY=;
 b=NdrpLyZ9L1r4l5GlKRmyNhV1+Qrm23bvHZgXndPOvUTiEpGYWn0JFyxKm7Zep0UbGzzl71VPU8ALKBPQMeHxOxqR0pQHR4Nx45tIMnrkKsaTVlamlt2sbtketECjeJbm/OlQNID8rzsNJuxdKIYTnkNHau/PXJ3DBrrMAQeA/7Y=
Received: from AS4P190CA0037.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::18)
 by PA4PR08MB7458.eurprd08.prod.outlook.com (2603:10a6:102:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 11:25:42 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::31) by AS4P190CA0037.outlook.office365.com
 (2603:10a6:20b:5d1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Mon,
 30 Jun 2025 11:25:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 11:25:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3Izxb9rcmGzNHQ32MXM1Ese/BhzCWUrbwdLgo3isuE7qLS5GHpNlbkht43phvEzwiCWy4z2QfBZ9UWSUmA+zsHTWya0hd7nWnzEHe9X0FGnVrnagQlf/8f1rtJ7FP+r1AxkRuoTYJQGqgJVhq7OwLGQ46A178l6XJWwxTpghMofPODvjH6cxSqwlT1ii12eet1DHN7gITUvYUo0rk/BWEgwZP9zRBXlaMP4309mpwKm73iVKLsbcRCTbQOk2gz/m00czkxVCMrI7pMRarU+RCh9zZTrIqNFqirhGaCFC/XWSAeAQkh8wKK/HpebIUuEQrQjNsHCc/bU/WSrTLdGYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGXCN1FrGIZ50Ydn6DyHU+9FQAF9h34R7AP0Nfk2yLY=;
 b=eKWmwiMkXfdFkN0dJ42Lz9VCq0TG1i1mFEEifA0SHgYseycC6IeZOe45vPujQBYcKwlkMyMPt5InAWzKWeShpAuY4bmwv0DHubOvuki7HAs7HoWglgGE+9WBajL8IWojK1z1yIb0KM2PaMcwKgg4xvPfk+l/t26gs7UkLdnYoFkxfffpSTr8ar5EP1uXqZT2V8uJjSXtafheDwEIpXsPCcTPm/o1Lz5Ty5/Khf9FfQs7NBxKrfcE8kljppWuO69nZc6xdFOt/Vr/FXoMxwmsEBbngeENmbBnssXYQ2N28H99+8Kv0kYOfGXDZXbbzbSOPnYJPvdotaWzI7zMP/ayJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGXCN1FrGIZ50Ydn6DyHU+9FQAF9h34R7AP0Nfk2yLY=;
 b=NdrpLyZ9L1r4l5GlKRmyNhV1+Qrm23bvHZgXndPOvUTiEpGYWn0JFyxKm7Zep0UbGzzl71VPU8ALKBPQMeHxOxqR0pQHR4Nx45tIMnrkKsaTVlamlt2sbtketECjeJbm/OlQNID8rzsNJuxdKIYTnkNHau/PXJ3DBrrMAQeA/7Y=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS4PR08MB7878.eurprd08.prod.outlook.com (2603:10a6:20b:51d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 11:25:08 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:25:08 +0000
Message-ID: <7e5c044c-1d9e-439a-b121-a842039ca6c0@arm.com>
Date: Mon, 30 Jun 2025 16:55:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <11939364-5488-4067-885b-aabd76fee46e@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <11939364-5488-4067-885b-aabd76fee46e@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::6) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS4PR08MB7878:EE_|AM1PEPF000252DD:EE_|PA4PR08MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5dffbb-c81c-4af9-18b2-08ddb7c8d852
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?K3FIa0xKanZQZUQwekNNdnd0amJyT0tobllVT1BGM1NsM3FJRjBYRGlWaFhN?=
 =?utf-8?B?QTZrZkdqdjg2R1g4Vjc1MTFsVmlObHdra0t2QVk0Q2JPQVpLanVkMGtQVzNh?=
 =?utf-8?B?WEU3c2FYU0xGdDQvVm9OS3pRY2tGS3BRNXQ3Z2F4S2FvV2YrR3dpTVhZOTBp?=
 =?utf-8?B?aUNXNTVDdnREMTBvNk9Da3BaSXpUVjRmNy9uL1EzNE1CaXRhY3h1ZWZ3MEV3?=
 =?utf-8?B?K29YL1BpWEZTTGZsaXFzT0FDUTdmZ3IvRUtnSUN2S1hvVU53VkpGeDJCTExq?=
 =?utf-8?B?amlGZGYyRThPTHh2cXlJd3N3TnorV2Vna1NtNHA5SWtrMkdUNmFPUjJIekor?=
 =?utf-8?B?ZWdxbG5neWhEVFdyWGVqWHk0YmpQS1hVcmY2cU52MVRXWnpTYlcyTGFaVlhV?=
 =?utf-8?B?dDlqSk9TWHNUOWNBM2RYY3RkbzBhcU9SZzZoVmFVSXp1cHczK3RiN0xVYVhn?=
 =?utf-8?B?U1ZVRE05WVpJMjFtZ0FVdkF3dlZDbTZzWWtUWG5HVnZUNS9PUktTYlNaMlRS?=
 =?utf-8?B?YmFKN09kcUlGa0p0T005anlGcWlMb2oyNEpjYUl2MmJnNmVYKzdsay84MUti?=
 =?utf-8?B?dVUvTVhyOEtqY3R5QVh5RUZYUUR6WG8zSWRIVjVFTFBpLytGQ1pIakRIYVR2?=
 =?utf-8?B?RHZDeitUSzhZUGoyMTB0NEpYbDRtbWlGamFiTzR5dVhMcjNHL0ZFVmJTcm1H?=
 =?utf-8?B?RE9EQU9uY1huREtPUjZaSkxXYkFFbW5CZm14WnBoZXRzNk1BelA5VnE1Nm91?=
 =?utf-8?B?SWduaVc4QW5JS05QRHJMVW44c25NVEhYMlc1ZXlPSXlKM3crMkJkYmlMaHla?=
 =?utf-8?B?V0pMRTdrRjNmaUZPa0VpM1ljTWVzbXV1bGVFVTM0bi83UlQ0SGkyc1psbnJJ?=
 =?utf-8?B?UUZjYm9vQ3B0QXJSeDBRdDNhaXlvd0huYkJkS0lUOWt3am9hWDFiL0tKTFVH?=
 =?utf-8?B?bXZidXFmSU1TeGdaUlJGK09xazR5Y3ZTTDlzZTFRVjJCWUYzaXQ2YkQwRTRZ?=
 =?utf-8?B?cnVRdjVqK0FWSHJpdm4vb3BiNGo3R2ROcVhocytGZUNmNkJEdUpwemdDc2Vz?=
 =?utf-8?B?MW9mNkN0K3pEN1o5RmwrT09aK00vNTVCQXc4dUNRRHRudm1xczhlR3h3THJK?=
 =?utf-8?B?dnVQSXRrdURTbGlXWlgzdzRaS1dPUnRnNEI2NmNzVEhoUWtYZmVnVDQ5ZTlu?=
 =?utf-8?B?aE5BNGYwVGU5K2oydXpXdXc2U1ZxcTlRWXIvRjJsV1RzMm1Pb2cvakQzY2Nu?=
 =?utf-8?B?VW9xOFA2R3dhMW5mVjBkUkNTZDJHbnRONXVZSkVIb2x2RDdhMXNwbGVEcUcv?=
 =?utf-8?B?dFgyMjh6QVQxb0NoQlg1Z0hYMzhjRENSa3I0eHo2UytQK0xqMW5MMWo1TkJ1?=
 =?utf-8?B?WEhOdkc2L0czdTQwUG1MbXpHQmlPNUZqdTFzRWJ0OVU0cnJ1N05aWDlDcDJm?=
 =?utf-8?B?OU9KamZITGJ2WkNCUGJuaGEvNU5nRnB1dEhITTFMUDVvSVh0aHZVSVEyYVBU?=
 =?utf-8?B?QTNPMzBkL1c2Y1prN1p3UVc4UEJFekh0TFlZdVU2Tk83YWo3Y2w0eUdRbmpp?=
 =?utf-8?B?bmREbTVzN1RsOGlvNGxhYkxQRWM3Q2ZRSS8zY1dCVFJNcVY4SWhUMFgrNVBE?=
 =?utf-8?B?Z1FOTldMM1dOWjBWS2VwTndBMjRoRnROYjRRc09acnZ6MUhDbnloc0dINDkw?=
 =?utf-8?B?Q05ob1ZQWDN3c3Y2aHUzNUxuaUU0ckp5a3hxS0FpSjV2ZU5TeEY3RzVST0Jm?=
 =?utf-8?B?d0lxbnVFeGN3bzgvU2hSS3ZFVFJrSHNmMkpadGlOYm9LTFNIQ24ycjBVZG9s?=
 =?utf-8?B?cEE3ZVBLQXVNekh6RFAwRlhneGdPdTNXbVZtTlNUdW1kNEMyUWt3QmIvU1hT?=
 =?utf-8?B?RkZXREZBWkN4b1VCMUJlQTdjWkQ2WStzdXhWU0RGbTF3d0E9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7878
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b14f5dfd-aa0f-41ee-96b3-08ddb7c8c51e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|7416014|14060799003|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3hFQ1l4UkxVenhPcmxTaVNIOE1wL01NYnhGZHM1S2V3Tm5Ka2pwaXVZY0pa?=
 =?utf-8?B?SnkrMkdQWlB6Nkw5Y3dNZTlCSCt0ZmF6eE8vSlhUMWhPeW1oaHprdzgrMENv?=
 =?utf-8?B?Szk1VXZ6eFVCbDU1UU1Pc0tabG9nbmpSK1VzM1hIQmlXZkJ2RHJoY0RRUGFs?=
 =?utf-8?B?ZjNBZC9COFBpd0gxS1ZSc25uakczVTVkKzFEcWFydU1jVmhnb3VYWlRWL1NL?=
 =?utf-8?B?YUIya1ROUmxHcGpVcUFSUER5K09oZ3REMVlteHExVm5rSlBTSVkyZGtoTURJ?=
 =?utf-8?B?b2NiRGwxSGp5cU4yaVJ6N0NLSGh5K2NURWpPTEQvdFBNelNuQ0FieTR6SzRi?=
 =?utf-8?B?Q2xYOWczdXJUWnVUZWwvT3NHWTRkcFBxb1pOQWpVYkNWWFdCdFlPVDRZU1NQ?=
 =?utf-8?B?anRVbW90UnFRQk9OOTV1bnhWSzdnYWhycXAzT0NJQVFucnkxV2pUSkNIbjR6?=
 =?utf-8?B?Z0YvVVViM3dMNUFtS2E4QTdEdFR5N1h2dHNiQTlWKzJ0eHprU1F4Y0tZRHhT?=
 =?utf-8?B?OUMzcHNoSU5BK1ZZKytHa0VJSTNWWnhFR2pabVpES3JHS2lwUEhmTzdyRXpJ?=
 =?utf-8?B?Y1crSmFDaURSMXN1ejZCS1ZJd1VWS1hQRWg1NHV2dWFpdzg1Q2F4dW1Ja2dl?=
 =?utf-8?B?aGNSUGRYWDdMMHZvbzFYc2RTYW1iZVRDKzU5R0lhS0Y5SnVTYnRQcDloVUVl?=
 =?utf-8?B?KzhHMlNQUWJFNG1URGx6WVlyTE02L2VSNS80SXZSR2RZaVBiRUdxUDV1NFBZ?=
 =?utf-8?B?elg3Nnp0MmJKeXZMSnh3TU01aHBuZ3pDOGVOaTFuTTlXOHZpeE1oRkJvZlRM?=
 =?utf-8?B?R2RnZGxTcWI3amVLZWxnQmF0T3EwNGRqVnhXdm43TlZwN2poMUpHTDhsaHBK?=
 =?utf-8?B?OGxlbW1Xd0I2M2hLRi83bld2bkhPVnFmTlRhYW8rZEFobVRyZ0RmRXNLRFE3?=
 =?utf-8?B?UUY2VHFKbThQbjNCWEZPVEpGYjRTcUl1aVl1Z09EUThTSGhZQktXenZIS0d5?=
 =?utf-8?B?ZENqWXJ2TWR5UnBVdEt4TzArWWlYV2lzditlTHdDSzZSdEJrUlFPN211UzUy?=
 =?utf-8?B?dGptR0cwSHhHU250dTZXYmtZNEMxazdzYURsR2JGZ1BIVmw4UFg5WWw4MVFR?=
 =?utf-8?B?SE55Um9pSk9CQ0dlYlQ0NDA4WEkzcUdtQXhaSmVxcGVoKytxN3lHMXd6T3Vl?=
 =?utf-8?B?ajlLbTQwL3RWQUd6OVpwdVY1OFk3a2RzVy9iKzVXVmV0SmQ0Zmw1Ulp0ZHU1?=
 =?utf-8?B?NXU5cXhPaW5VeFozS3NycHdkNUNIa3p1U2QrbmRneDcvMDg0dFlnNktRbVNu?=
 =?utf-8?B?MDNvQktuSDVTSU5qOXNzVzJhaVlSQ0FxcUh2MmwrWkVvZFZZVW5oa09WNEFm?=
 =?utf-8?B?eTU4NWJGNWZJS1FVNG8zcWx4VFBlcXhKLzZsWVVQZUU4UCtsbThJVkdBTVNv?=
 =?utf-8?B?bUtoUnZseDZTU1E2YzFRNFdPcnk5eDUxL0pSb0dYMCt1QlhmTFBvai9iN1R5?=
 =?utf-8?B?MkpGV0hoMDNKemdxTXl2Z0Q2WFJRa0oyaGtaWjg1b1RqalNHSVY4TXRiSnhm?=
 =?utf-8?B?S2g1c1FUTTlLWHBCVEh5OENmMzRvZnlhaTAvVm81ZmhvRkR3S0pPV2orRWlU?=
 =?utf-8?B?Vk94NDg3UDlHRFExUFZwVG41YmxwSnN5YUM2dGd0Nm9HcklsK1JpOGsvaU9p?=
 =?utf-8?B?ZFcxUk1ycmJsMjNtNDE4Z0FCRmlPRkVZWlFCRzBkMzlSdHN3T2NzbVgwMjh1?=
 =?utf-8?B?dzdNZU1pZml6WE8yRnRscFljSlJWeS9EcEZYRTlQV0hRTGhXYVRaRnh6ZnNk?=
 =?utf-8?B?cXVBVDNsTWJCOGtuZDM2NFRNTEgzOTRWY3lWcDUyOU12VFg1bVVVT2kycFRz?=
 =?utf-8?B?UXVrdGhtWjM3NDJmQ1dmaDBOSy9mOHE0M1NBYWRucGxtc0Q4UWtjV05hMVNU?=
 =?utf-8?B?MmFNMTBzM3pCd1lzaE9heFpkQkZMR3NGR25zSUhsWU95NHRHYU9OYlFCZkZi?=
 =?utf-8?B?YjIyKzFKQlB3VHRUQlNLYXlFNmdnQXA0dllFQkZ3MFl2RHgvbjdjT1lWOWVB?=
 =?utf-8?Q?69IOqF?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(7416014)(14060799003)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:25:40.6063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5dffbb-c81c-4af9-18b2-08ddb7c8d852
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7458


On 30/06/25 4:47 pm, Lorenzo Stoakes wrote:
> On Sat, Jun 28, 2025 at 05:04:31PM +0530, Dev Jain wrote:
>> This patchset optimizes the mprotect() system call for large folios
>> by PTE-batching. No issues were observed with mm-selftests, build
>> tested on x86_64.
> Should also be tested on x86-64 not only build tested :)
>
> You are still not really giving details here, so same comment as your mremap()
> series, please explain why you're doing this, what for, what benefits you expect
> to achieve, where etc.
>
> E.g. 'this is deisgned to optimise mTHP cases on arm64, we expect to see
> benefits on amd64 also and for intel there should be no impact'.

Okay.

>
> It's probably also worth actually going and checking to make sure that this is
> the case re: other arches. See below on that...
>
>> We use the following test cases to measure performance, mprotect()'ing
>> the mapped memory to read-only then read-write 40 times:
>>
>> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
>> pte-mapping those THPs
>> Test case 2: Mapping 1G of memory with 64K mTHPs
>> Test case 3: Mapping 1G of memory with 4K pages
>>
>> Average execution time on arm64, Apple M3:
>> Before the patchset:
>> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
>>
>> After the patchset:
>> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.3 seconds
>>
>> Observing T1/T2 and T3 before the patchset, we also remove the regression
>> introduced by ptep_get() on a contpte block. And, for large folios we get
>> an almost 74% performance improvement, albeit the trade-off being a slight
>> degradation in the small folio case.
> This is nice, though order-0 is probably going to be your bread and butter no?
>
> Having said that, mprotect() is not a hot path, this delta is small enough to
> quite possibly just be noise, and personally I'm not all that bothered.

It is only the vm_normal_folio() + folio_test_large() overhead. Trying to avoid
this by the horrible maybe_contiguous_pte_pfns() I introduced somewhere else
is not worth it : )

>
> But let's run this same test on x86-64 too please and get some before/after
> numbers just to confirm no major impact.
>
> Thanks for including code.
>
>> Here is the test program:
>>
>>   #define _GNU_SOURCE
>>   #include <sys/mman.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>>   #include <stdio.h>
>>   #include <unistd.h>
>>
>>   #define SIZE (1024*1024*1024)
>>
>> unsigned long pmdsize = (1UL << 21);
>> unsigned long pagesize = (1UL << 12);
>>
>> static void pte_map_thps(char *mem, size_t size)
>> {
>> 	size_t offs;
>> 	int ret = 0;
>>
>>
>> 	/* PTE-map each THP by temporarily splitting the VMAs. */
>> 	for (offs = 0; offs < size; offs += pmdsize) {
>> 		ret |= madvise(mem + offs, pagesize, MADV_DONTFORK);
>> 		ret |= madvise(mem + offs, pagesize, MADV_DOFORK);
>> 	}
>>
>> 	if (ret) {
>> 		fprintf(stderr, "ERROR: mprotect() failed\n");
>> 		exit(1);
>> 	}
>> }
>>
>> int main(int argc, char *argv[])
>> {
>> 	char *p;
>>          int ret = 0;
>> 	p = mmap((1UL << 30), SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>> 	if (p != (1UL << 30)) {
>> 		perror("mmap");
>> 		return 1;
>> 	}
>>
>>
>>
>> 	memset(p, 0, SIZE);
>> 	if (madvise(p, SIZE, MADV_NOHUGEPAGE))
>> 		perror("madvise");
>> 	explicit_bzero(p, SIZE);
>> 	pte_map_thps(p, SIZE);
>>
>> 	for (int loops = 0; loops < 40; loops++) {
>> 		if (mprotect(p, SIZE, PROT_READ))
>> 			perror("mprotect"), exit(1);
>> 		if (mprotect(p, SIZE, PROT_READ|PROT_WRITE))
>> 			perror("mprotect"), exit(1);
>> 		explicit_bzero(p, SIZE);
>> 	}
>> }
>>
>> ---
>> The patchset is rebased onto Saturday's mm-new.
>>
>> v3->v4:
>>   - Refactor skipping logic into a new function, edit patch 1 subject
>>     to highlight it is only for MM_CP_PROT_NUMA case (David H)
>>   - Refactor the optimization logic, add more documentation to the generic
>>     batched functions, do not add clear_flush_ptes, squash patch 4
>>     and 5 (Ryan)
>>
>> v2->v3:
>>   - Add comments for the new APIs (Ryan, Lorenzo)
>>   - Instead of refactoring, use a "skip_batch" label
>>   - Move arm64 patches at the end (Ryan)
>>   - In can_change_pte_writable(), check AnonExclusive page-by-page (David H)
>>   - Resolve implicit declaration; tested build on x86 (Lance Yang)
>>
>> v1->v2:
>>   - Rebase onto mm-unstable (6ebffe676fcf: util_macros.h: make the header more resilient)
>>   - Abridge the anon-exclusive condition (Lance Yang)
>>
>> Dev Jain (4):
>>    mm: Optimize mprotect() for MM_CP_PROT_NUMA by batch-skipping PTEs
>>    mm: Add batched versions of ptep_modify_prot_start/commit
>>    mm: Optimize mprotect() by PTE-batching
>>    arm64: Add batched versions of ptep_modify_prot_start/commit
>>
>>   arch/arm64/include/asm/pgtable.h |  10 ++
>>   arch/arm64/mm/mmu.c              |  28 +++-
>>   include/linux/pgtable.h          |  83 +++++++++-
>>   mm/mprotect.c                    | 269 +++++++++++++++++++++++--------
>>   4 files changed, 315 insertions(+), 75 deletions(-)
>>
>> --
>> 2.30.2
>>
