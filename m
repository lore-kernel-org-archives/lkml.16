Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020106.outbound.protection.outlook.com [52.101.191.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AEF18DB1E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642894; cv=fail; b=EcfhnLuopSjaM2wTMixzV1OPQtlruN7dL3FUiDIvPQXd/SkpmL7jNmW2IzTPkJoFhGaueIT49ouGDgS+B4okZrNxujSEuQtjSSbQtlqdGn2hqgzKUXxlPgaWl8sQ3Ymx24/B4AdFQljZqoJ3tq0KbSLXoegFOCvYIK0nhiWUli0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642894; c=relaxed/simple;
	bh=Q+9WrxB59pvguiSr8d5PxtDVGBqE/X4Ge/JEST7+ggk=;
	h=Message-ID:Date:From:To:Cc:Subject:Content-Type:MIME-Version; b=L8LtQlHZFjGU713Vxhed12IHy1GxWcxnIUHn4s+q67o2NUKg4ZyjiwmAmsepPqmV8yKr3BehJzBboluxVAXbq0SIWk6h7XDold04su8a5mSdg8458BIv/bU+cEXzXQUL+C+lZAiaDBJylZyH575waBvL8pD9gy9Qsm5rLU2san0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=SdwVZWZ7; arc=fail smtp.client-ip=52.101.191.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="SdwVZWZ7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVLe5QmMl4z+CVlvJ7fSLFVIwC9EoPKBwIc0TgbMElG0ALtEHbXAQLWtGY4NX9A0KK193LZIkUU/E3Ir3UZw7KKfVfhFY/x1uKYq5/DViZzB17tqjCVGC+I2Jemsuk77WVsQ+cUEnYY10Umcl4aHorf9CAuOmc/J85p3S1x4a0tUUlmjsEOKDynJHrND5jALg6n4XApDIaKLJlCI8ovA1BF77CmciVfDENpyMcktLNcJOBnrli7fz1mFt7hS/epy+1TOztmbsNWrYzmYfl1cglCshcPMcLnjOc5DDv1r2rNyUebW0ZV2GUiI58L4IJs3EV3u26Ug8irkTrisuCrwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtFPoy/Cwi5Ubmyc9D4vA5fR2XqugSOTrhFAdpfvIpQ=;
 b=e1AsVPdtt6l4r72e/fvd+d44KaYt8770CFmkevPZF5BkI+QX4oTJaUuc2BBhX+BHz6/hdQBixNeXNeNszhXMhO8p6aQeb8/i/+VR1GI5v8CbtwS2TYWejhbVM92u1m/bdci8/GDrmhFNOhE/9nGXZLpvtzvpm9zPJRw+N2w8evVMtHZ/hly8LZzoZvOO/PFIBD4GMx2K3qgbOGhgs+elJmpk5hUcbpkLa9U8mn6Abtb9pUgIoziapLn9i9Cx99Dgy+FGt1lGkYLJoIubNHjWVxco2YNnyQhQ8awv7cUhoEOz2b6ymEA3DutydvUFLEYVH4c7y8F7T6XdOtrvpHDsgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtFPoy/Cwi5Ubmyc9D4vA5fR2XqugSOTrhFAdpfvIpQ=;
 b=SdwVZWZ7H0ut9rsD5GDfK9WIMRNwiGe4B5yVd3aKNaYNZn5JL68KTBwJIW8koqeUNIEv/F/T2XUYtx/HPh+Unue3UqTISLOekccL7ldp8ptmGFEeWynbRqaRcgXY6z48xl9GuaMpUsHKlPkluCzXILwwr6Ydjq3xxm6V52xM97kcdaskI0vVXhP5/eCbBeJtAutilofRjx+3XcLBhFdxZHDDIyeETa8/KDUQ1+HmuEeOu5PwEG1c5xzpiWuH3UBdL1vPBsE4bRoint8UChm1qu+Ida6MzVVacCjpT0OQpMFygjbv7BAh/FiBWasayQJnH3BzR7uiEDxixkueRW/GbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by TO1PPF49FA00C18.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::63d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 15:01:28 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%7]) with mapi id 15.20.8632.035; Mon, 14 Apr 2025
 15:01:28 +0000
Message-ID: <d57111ec-0743-4da2-a3b6-4b82994aa75a@efficios.com>
Date: Mon, 14 Apr 2025 11:01:26 -0400
User-Agent: Mozilla Thunderbird
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
To: linux-kernel@vger.kernel.org, lttng-dev@lists.lttng.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Olivier Dion <odion@efficios.com>,
 Michael Jeanson <mjeanson@efficios.com>, =?UTF-8?B?T25kxZllaiBTdXLDvQ==?=
 <ondrej@isc.org>
Subject: [RELEASE] Userspace RCU 0.15.2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::19) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|TO1PPF49FA00C18:EE_
X-MS-Office365-Filtering-Correlation-Id: 943905fb-00c5-4511-6324-08dd7b653ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzQrQ0JFekFNWU1kN3huMmhRNlh5UlpQRTlIcEwvT3VuOVd3cTVWWU9sRG9u?=
 =?utf-8?B?eTNvMFJOUjBvZzVmdVJGdlNudXAvOURzZEtjMmU5YTRtWFlZYmoxNHVlYTc5?=
 =?utf-8?B?YU5wei9wdFFaQUVOTUpERXhyYjV3enZzNFpXRDdWZWFiejZmZlYydXJyeHY5?=
 =?utf-8?B?bWVlS1FLYVk0Z01mN2Z5RnkwZU1RRWRrT0VibE44a2NGdnhVT2ZjU1hFVUZQ?=
 =?utf-8?B?UWR3RlJ3Q1hNcXQ0aDBKbVAzL3lrSHRWV1NCVWYwTVc1Y0t6YkVXeWxndnlP?=
 =?utf-8?B?c1dMNDhac05zQnlXUUVUMUp4VU5UMURyU2FUdFl1UlBlcDN4QUFIYWlQaXRp?=
 =?utf-8?B?RXFPT0RaekhXYzVCbFBKbGh4K0JWMkRxcUhienovVThISllVMFZRSDVlOTdL?=
 =?utf-8?B?Zk9kMDZpQmZxeDg5UXFFU1ZZaVVHTmxTSFdTeWpSbCszUHFpWEJ4SkVoeE5B?=
 =?utf-8?B?c0l2TDBvbmp4N0wxa3FDVGxYU2U1bEdJMnk2RXYrYUJLemFVUlVVeGZuZ0dm?=
 =?utf-8?B?NnVUTTFjQ3hKZWZTMW9SZGxocXhlQVdjNW9WSWc2bVhiQjBONVZEM21KU2hW?=
 =?utf-8?B?WWxvcWtJaWR6QkxpclAzS2ZPZ2JVTi9qUUl6eDk1c1RtMmRtaVRyczF3TzR2?=
 =?utf-8?B?TXRTYkNnRHZvcEhGNUZjeTVYS09FclVwd2JRT0tBUE16a1VyU1ZTb1F6ZXAx?=
 =?utf-8?B?L2VSaE9icjIzOE5lQTg5S05JcHNwdVBOQzFhRDJ5djc0am0rQ2M2UXhMeENH?=
 =?utf-8?B?NVhzYldUcG5sY0REM0IzekdUVXBraE5wK2ZiSitzYmVKR2NJRU9id2gzSk9a?=
 =?utf-8?B?dXZaV2xWeldQS2p1YnBrN2V2dllmT215bzZ1TCtaNDBoNExNWC9ZUHZDdDJE?=
 =?utf-8?B?OWpFM3ExQ1BJNDdwWGxPTVhFSWQ3V1krSTRCblZEWW9PeFI2ak9rOHlkVFBE?=
 =?utf-8?B?YmM2UGxtbTc2bjdhTTM1eTM1QVpuR0NKTmZ6b3Exc1ZndS83RVFWZHc4TWtE?=
 =?utf-8?B?WVBiQjMxUm5NVVNmYytGY2ViUE13VFZoQjg2c2FpdHduVE02WDZFZ1QrSks1?=
 =?utf-8?B?WThuOFdlbld4MmVubkRjQU16dndtTWEveHNPNWJkeVkzR3dzOXhlRzRnVDNp?=
 =?utf-8?B?RHJpdEtRZWgyRkZ3NnhkUzhkV21JbXE4NXhVdC8wTG1COW4wcnVmZDh1bUZW?=
 =?utf-8?B?MVNGc3JCelh1VGRXbFN3TCtncmI3MGN0WEZMMnZ3VE5rVWR5Y0o0Nmx2cVV2?=
 =?utf-8?B?VUpVUlY0d1A2M3lqRnBhbzZicmtSSTVKNXVzaExRcXhFU29XMEZnTEhzQU45?=
 =?utf-8?B?UElzbVZQWEUyZld4L2wwMU1QSURKNytsMmZ4V0tWTkZYbDlaS056c1JXRnY0?=
 =?utf-8?B?N2tyUXQ1OFZROFJGNHlVdXpwR3d4RS9vTnQxT2tSWHpIaUlGZFRCWUp4OWZn?=
 =?utf-8?B?R3lHcmNXUHdzb01Xa3g1Z0I5ZFNZeTMyeUd0R0lPNnVDVlkvMmtkMTcrSC9a?=
 =?utf-8?B?cVVuRnUxdlBuNkRsUXB1WWlobG5kYm5SZmp6OVkrZzNXK1REdGF5T1BySmV3?=
 =?utf-8?B?NmkzdjdZNGdEdnNxTmJqbi9GdVRxT3U1dmhuUGNUTys0SWkwVXlrelNyZXpP?=
 =?utf-8?B?MlZlUU5ETWxzVXRzSUV2d3BsTkRUaC9oVk5DVFI2eVNQM0lVVWFpd3hmNDRB?=
 =?utf-8?B?ZThSeU45SjVKcnFVcldPZTU5cGl1b1B3UUozRkFKUk8ydXJSODFRTjc2N1Fk?=
 =?utf-8?B?WmY5Vy85bHFNSks5ZEpOMVAvbHBnci8vRDhwUERja3FYWHJhZ2tlZXZQaC9V?=
 =?utf-8?Q?qAdhhTN/Oh5wN+5H5Dn7H31S3vK3YOPKjRgbQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEtWQXlGTnJweGpCM3ZlRndxd01iZEZJU2Q0YmM1V3FwaWJPYVFNUGtIR2Q0?=
 =?utf-8?B?SWVaTkFuNVY4Y2JCVk5NdFNkSCtRMjhIb1FHdVhZWDU5R25PWVQ0NEY5cnpt?=
 =?utf-8?B?MVozMytmU0VRL1RlVnpETk5oVU45c205eDBQWGNBTklyTVJ6VURpSVdZb3g0?=
 =?utf-8?B?Tk5hbmU4RytVNzRxQ1pXNkNjQ1NTeERKeDZ2VzMwV0VreG5kRlg1dUZMUllJ?=
 =?utf-8?B?Z0JnOEE0Sy9kUEEzSmxaRmFOcCtpSXh5VHpYbERYOVU0cUpaeG9iK0JEaFRt?=
 =?utf-8?B?Mk5YanQwdE1kOEp6djMremJ1NnRBUlBCRGl4NHk5dGYzcWtKdzhQT3A1RjVT?=
 =?utf-8?B?VHBHUnVtNFdZTkVTcEpZMUZqRDZ1TGYxS3RkN0NFdlg5c2kxWXJ6VWtZT1M1?=
 =?utf-8?B?R2ZlWExUZFJkTFkzOWk2TUpDWm5JMk1SVHJBSmcrMzJTRkFnc3VaMWRjVUlB?=
 =?utf-8?B?Q0JHWGVybW8wVTM5bFpKeTYvTjYvSXVnN25PZ0FIVng0SjgwUjZSSG84R041?=
 =?utf-8?B?bnZ4bDBtcno3NkpSbG9OWXB1blFZUGFKdHBkWXJEMnhOTlUyL3RKYytGVjQ3?=
 =?utf-8?B?N0lXYTUxK1lZUG1oTjk5amtMci9XakxrMkJoTVlhTmpmVFZrOVcvY0MyK1Zu?=
 =?utf-8?B?TFlpRlRUb2RhVmRqcll4U0VvU2liUUlCRW9rK05oOHlkS01YU0dVTGl2VUZ5?=
 =?utf-8?B?bmIveDJTdDZqdEVwSW5hSDNDd0Z5QTFNaDVOQzlhT0RUMW00N3I4TW5SdFp2?=
 =?utf-8?B?YTBUbGNCczFYWFpQUXkxMnFrWklESlFaU2ZWS09IQnp0eVpTUC9KeHZyQUtX?=
 =?utf-8?B?TUJTbWpZNW9ZN2F2SXlNQmtVSTlQVStMUm84OGx6THJ2empTbFdjaDlrM1dj?=
 =?utf-8?B?WGpGaGprRnIvcjBKRExSL25TRjVFZ0t0UG9CTGxZVkJWN0F3ckJuZ1FRSDVh?=
 =?utf-8?B?bndnSndjYkMrY1Zpc2t1ditKVEdJd296NThYMDdtS0RIZW5JZXlIZTVMZFJt?=
 =?utf-8?B?VHhwOHkyNkh4dzIyUm5vK0FjS3U4aE1JMHUwOGprVzBvalVqMUUySUN4cTBH?=
 =?utf-8?B?Rnk5UWlUMm84VjNxOFlueGlhQ2hId29sTWl3UkNyNStaLzBPVS9odktKWi9w?=
 =?utf-8?B?SFlDT3praUJncjcxQTlsTS9pS1hmK3RPR2QwREtKWGg4SUx5c0lSTmlsN0Z6?=
 =?utf-8?B?T0ZLalJ2V1B6RDY3Wm5BcU9lUDJ6TUR0Rm5aMzhDY1UyMVVIZVR3L2dZQWo5?=
 =?utf-8?B?WUdKb3VObjVZbzVld0J2K2FPK2ZPL2lLSEltdGppZm1kcVQ4K1NHWjUvY2ov?=
 =?utf-8?B?S0JZdVJXNkVML1BncjZrR3BoeG1lTUpDbERvaTBXTnJidmNCQ1VsdldwTlNH?=
 =?utf-8?B?ZEFKR1hLZ1RZcnJkc0x6T0hIUUFJSEUraXdTSFdvaHNJakJTM0V4OEl5RmRp?=
 =?utf-8?B?RWY1RmNKNkl5VHlwL1lld1Ric2UxVXNYS09xd3c3MmJGR3Q3NDFVRGNyazMv?=
 =?utf-8?B?MG54RWMrblpLSXUxcCt4a3VTdjBqTVgwaktFWGU5RDcrNjM3dStZRHlWejI4?=
 =?utf-8?B?ZCt3Y3hORGhRRFlzQXdnN1UrcjNRMWExSnRhNnM3RUJZRHNUcGczdTlyTjFT?=
 =?utf-8?B?ZHBvSWhDR3ZkYjhpZWxic0d6dzN5TUUxelBraVZqOVFjK1JDaURNVXBsalBt?=
 =?utf-8?B?SkU2R0hQc1pKM2ZVdFNHeTZCTUVRK0dPcHQxRGFSTWNiUEdDRUQzQk9pbFlk?=
 =?utf-8?B?WjYyNG9sVTdiWFg5MFV1MS9teFFZZ3JxbFNUQmtIRklOY1pXbnZ0NXk0M250?=
 =?utf-8?B?aWRUcGoyYWJhY28vamFNK3JnYjh0QktGN2RUY0FsVjNyRitHcExad1drZDgv?=
 =?utf-8?B?UTNUa256d1NnMGlDWjM3Zmg5M1Q1REhmRHlUdUV5QW5adTkzVSsrWW9aNys0?=
 =?utf-8?B?L1hZN3dtNDJtY0dTbE5hN1UyYkNZSEhnMEExSkZYNnlQMlAzK1J0dE5ka1h3?=
 =?utf-8?B?dnQ5cmtad0kzcDNiS01UMEtqUzZHa0xDYU5VNCsyNXNGZ1BYSHo3TlhpRUk0?=
 =?utf-8?B?THZUVDQ1N3RTaTdvL3pVZ1l0M2k1QXlEcmcyVjM5SWsrRVMrbFQvbHJzd1Jl?=
 =?utf-8?B?dVEyMkg5QldYdFBXUTJRTm5oK2Z6VXk5dXY5cWZNeWpDUTNxMzcwUXZNdUti?=
 =?utf-8?Q?Rj2bNQ6tQ95OjOrrkioNZsk=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943905fb-00c5-4511-6324-08dd7b653ba6
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:01:28.1420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+VK6btbagCJOMjq2MCnCoEZP9lWId6CYqFxzMf4GJ+P2iUA+t3UAP3icLVqWuBPLCYeU6cuPyCZGpSa3oekma5XwHLoCRzCBuvsooCbm9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TO1PPF49FA00C18

Hi,

This is a release announcement of Userspace RCU v0.15.2. The
most noteworthy changes in this stable release are:

* Tree-wide: Rename uatomic and CMM_*_SHARED callers to uatomic_load/uatomic_store
     
     This change renames all the following callers to uatomic_load()
     (implicitly relaxed):
     
     - CMM_LOAD_SHARED(),
     - _CMM_LOAD_SHARED(),
     - uatomic_read(),
     - uatomic_load with explicit CMM_RELAXED.
     
     It also renames all the following callers to uatomic_store()
     (implicitly relaxed):
     
     - CMM_STORE_SHARED(),
     - _CMM_STORE_SHARED(),
     - uatomic_set(),
     - uatomic_store with explicit CMM_RELAXED.
     
     This will allow moving the CMM_{LOAD,STORE}_SHARED() API back to a
     volatile access, which is relevant in cases where it would be used
     on data type sizes not supported by C11 atomics.

* Reintroduce read barrier depends in rcu_dereference on Alpha
   for URCU_DEREFERENCE_USE_VOLATILE build.

* Use uatomic_load CMM_RELAXED when building with URCU_DEREFERENCE_USE_VOLATILE

     This makes URCU_DEREFERENCE_USE_VOLATILE mark the rcu_dereference
     memory read as atomic, which helps ThreadSanitizer not flag this
     as a data race.

* Add cmm_annotate_mem_acquire() to URCU_DEREFERENCE_USE_VOLATILE rcu_dereference

     This explicit dependency makes ThreadSanitizer understand the
     happen-before relationship implied by the rcu_dereference
     address dependency with URCU_DEREFERENCE_USE_VOLATILE.

* Move back CMM_{LOAD,STORE}_SHARED to volatile access

     The CMM_{LOAD,STORE}_SHARED() API is intended to be usable on types that
     are not necessarily supported by atomic operations on all platforms.
   
     Move it back to a volatile access, all call sites both internal and in
     the public headers that required ThreadSanitizer support were moved to
     uatomic_load/store in 4d197dd19c44 ("Tree-wide: Rename to
     uatomic_load/uatomic_store").

* Only define UATOMIC_HAS_ATOMIC_BYTE and UATOMIC_HAS_ATOMIC_SHORT when the
   builtin atomics support those as lock-free atomics.

* Introduce static size assertions for uatomic checks

     Move away from linker tricks for validation of uatomic API usage, and
     use static assertions instead, which fails at compilation with a clearer
     error message, and does not depend on compiling the code with
     optimizations.

     This introduces type size validation across the uatomic API, including
     loads and stores, thus preventing the need to link against libatomic
     for atomic builtin operations performed on types which are not
     lock-free on the architecture.

* Introduce UATOMIC_HAS_ATOMIC_INT/LLONG macros for various architectures.

liburcu is a LGPLv2.1 userspace RCU (read-copy-update) library. This
data synchronization library provides read-side access which scales
linearly with the number of cores. It does so by allowing multiple
copies of a given data structure to live at the same time, and by
monitoring the data structure accesses to detect grace periods after
which memory reclamation is possible.

liburcu-cds provides efficient data structures based on RCU and
lock-free algorithms. Those structures include hash tables, queues,
stacks, and doubly-linked lists.

Changelog:

2025-04-14 Userspace RCU 0.15.2
         * fix: __atomic_always_lock_free() not a constant expression on g++ < 5.1
         * fix: urcu assert fallback for pre-C11 builds
         * doc: update uatomic-api for static assert
         * Add uatomic size static assert for 's390'
         * Add uatomic size static assert for 'sparc64'
         * Add uatomic size static assert for 'ppc'
         * Add uatomic size static assert for 'x86'
         * Add uatomic size static assert for 'generic'
         * Add uatomic size static assert
         * Use UATOMIC_HAS_ATOMIC_INT/LLONG in generic implementation
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for x86
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for tile
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for sparc64
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for s390
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for riscv
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for ppc
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for nios2
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for mips
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for m68k
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for loongarch
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for ia64
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for hppa
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for 'gcc' arch
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for arm
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for alpha
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for aarch64
         * Add UATOMIC_HAS_ATOMIC_INT/LLONG for atomic builtins
         * Add builtin atomics size static asserts
         * cleanup: use URCU_GCC_VERSION from compiler.h
         * fix: atomic builtins defines for type support
         * Move back CMM_LOAD/STORE_SHARED to volatile access
         * Add cmm_annotate_mem_acquire() to URCU_DEREFERENCE_USE_VOLATILE rcu_dereference
         * Use uatomic_load CMM_RELAXED in URCU_DEREFERENCE_USE_VOLATILE
         * Fix: Re-introduce URCU_DEREFERENCE_USE_VOLATILE read barrier depends for alpha
         * Tree-wide: Rename to uatomic_load/uatomic_store
         * src: Use __*__ for attribute names
         * API: Use __*__ for attribute names
         * Fix Changelog 0.15.1 date

Project website: https://liburcu.org
Git repository: git://git.liburcu.org/urcu.git

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

