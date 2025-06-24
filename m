Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012059.outbound.protection.outlook.com [52.101.71.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEF726A1AE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.59
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754547; cv=fail; b=LfNrgBh83Hn7GU5GeUNQ5yxSZP1AoAL2GIXxBdCk+WTlqbjBGoMnhxeQnXZLooijhEzF//Whms7CEpEySvwYfY1VYrjddmsQArbmsOw3GcXICac2vID6m62ElEGXQMpUoYp6lcorODMF7c/wzpzxsZ16GAGqa5I3bO2W8/Vg/lQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754547; c=relaxed/simple;
	bh=BO/IVyjLYpRB4BU+cYoO3iRpFMqnIqBEtqrBgJ5SAxU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jhHhwtGLYK76d99Jb5o47KUXCgxHEC+9UXPtfbAmn3CBFQKM/fdN4NTbJfbjl/+Jiy7VJJ7WqB+IOBDSYtsp3EvYSg0lgchdz9kBB3zHeWiWVdIey/0OH0aGtwYkSV0EOgKZybBV0murLQITDF3ryP84EEDONkjmGDfoIADFtV0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ms3Rf08X; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ms3Rf08X; arc=fail smtp.client-ip=52.101.71.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ms3Rf08X";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ms3Rf08X"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aL2qEYNPJqDjU9agiMQtzfzanr7Kn0U/PVl27CFPYim17NBUYHZHE9tcm6BKquOq/l9bJRjZkxgZHxfPMh1YiVsbhBFIY9a7chji0vPiuI4E4CLsEg8qVaABjAYyv+mlIj4lRwoErf+XiD/Vyxa215nmT92MFsZNMg5UhMrmA1wrsEbXdyswrXkwxYrYlK5PbOPP70OzoDsd8wtjynUbr6OqguTqJCq0vb97bB983IzD0qKlkcA0IfOUvqEdXfh9sJAqNNuVkuZcER89782FS4vjvsXuq+58aGu/uavRDPZNaF9ft0m7LNTY6O5E4UKGICwNNoVcWnAiyPDMzYmpJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9069FHBZTseaRQX2hpabSvzLmvz79TQCF95JD+UAZ6k=;
 b=tZ3AmGFwH7P9k81Bkg79c3wyj+qFOokaxxGsbRQ/KwAe94hPTmGZZ3hWGw1yLYuJczTfMkXcmCssW918ccBHOjrJtEW7AjwyP09n9CIIPrLtsoSS2lgrGeFzAfx8wQb1JrlD5YBdjtTB04AEG0vP3BizbgjbPhVavUwE33vHlgf5YcPU01AtwJ7l1VoS0eWSS2BF4ZYYvi7Sd9pj+6HudTVo51n/9tfOkGr/7zcllCcIRf4mvDgyhbG7TP7/LN1/8rVn9BmGZGdvPfjvRLv7BCvOAqFsrhhqB/GU61CHBBqx29pBo/qJ8hXy3F5Prvz5gVMbOf13wOnluAq1lLNDcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9069FHBZTseaRQX2hpabSvzLmvz79TQCF95JD+UAZ6k=;
 b=Ms3Rf08XDMnEHSZhPd16GQtiF+dwExhLGR48o3iyLKiVZyn1eLozSRL4gNnTtRnyIkQmEyCLtjaydxP05+eYI1xLLxULiBW/lxmWo4Jg8XVZrjJN8utAg5fB53sAscGKqhw9nZT4cz0bAKV/RT8VKUIQYo+NKsKiNAivLnJGkLk=
Received: from DUZPR01CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::15) by AS8PR08MB5925.eurprd08.prod.outlook.com
 (2603:10a6:20b:23d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 08:42:17 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::d6) by DUZPR01CA0037.outlook.office365.com
 (2603:10a6:10:468::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Tue,
 24 Jun 2025 08:42:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 24 Jun 2025 08:42:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZI2issI4DmwdqFo+zieAJcfaqsDnNyu0y7wyJpcCeOX45Itel9PlBSmUMq9udFgW7O2H0Z/WQ82Rypcu+oU1aZWkEOIAl+RPhyaVPVlBqhMI/Y/7ImSJEbBlMR0r32WDW/bN5mZiTOWFcH8NpOx15Xw8k7nEBToNwBIgDQu1vVKdN+Kyscm8lTg4PiQQfi/dWf8dj2x48A8YGr38VHtJ61oYdzg1rAuy4TMSsOPcfzP76yP/bfUUflo9b41ErRNxDIygqXy2an8cvk66ZInxxD2L1SC6rk5vhWuTE/8vqWHxrBtxrYj6ertjuIdQc9NmF8u+01qecTkyeQgsxX3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9069FHBZTseaRQX2hpabSvzLmvz79TQCF95JD+UAZ6k=;
 b=aGCb9Q/k1Akp7McSx7qHInj3A+c+ZziJN08SbtRO6vVPHfvkoLdB6KoNSN8xRTnATzux4mSzKCFL9C4E3jK75LTKpSC5Q0GK+TAnhdrmEC7xUINSVUMwdzTVAnenNa6McId6otRQ5gVHMKHGiw4lUxV5bWC9yWHTYjQ4Kx4xkBo291h+AdmkXOKqguLurXZJl3JDbGivS60mSHrWbc1EEC46y2PLpiwIu+OF5Vd/FW7di1leIhxk6grlTt0V7Fip6389mSs0duv2DstTwfGA3DAFOPZcL2PCGWYGMLUgfsG1Ieev7y5ePKkxPc2KWsbCJ+GwOjHyaNfWQeWvFAG1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9069FHBZTseaRQX2hpabSvzLmvz79TQCF95JD+UAZ6k=;
 b=Ms3Rf08XDMnEHSZhPd16GQtiF+dwExhLGR48o3iyLKiVZyn1eLozSRL4gNnTtRnyIkQmEyCLtjaydxP05+eYI1xLLxULiBW/lxmWo4Jg8XVZrjJN8utAg5fB53sAscGKqhw9nZT4cz0bAKV/RT8VKUIQYo+NKsKiNAivLnJGkLk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 08:41:41 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 08:41:41 +0000
Message-ID: <8912e179-601a-4677-b2f6-14f40d488d98@arm.com>
Date: Tue, 24 Jun 2025 14:11:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com, david@redhat.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB6697:EE_|DB1PEPF000509EB:EE_|AS8PR08MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: d83a3ed3-c73f-4e7b-1128-08ddb2fb05ec
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cGRTT0lNT0Q0R3JOWDdoSUlMN3U4Y2JsaDJNVXVjWGc5YTBJZytjdmtGVW1F?=
 =?utf-8?B?TUdSSmdFNElSQnk1N2tsSkx1akx1WFlabitwOU9KS0ZnVzlmdW5uRHo5cXVO?=
 =?utf-8?B?Y1VHM1RjR1JGQ25yaG1Lb1NKZ0pONndEQkg0a1hENlFOQUZDTzViU0F2YUQ4?=
 =?utf-8?B?bGgxWDZGMWsycVJFMzRiSGF3NTdibEY1ekRENFhLNnpmeWxWL1dScHJRYkl5?=
 =?utf-8?B?RUpiVXRHVnpsNEJDSmdseWxtYi9RYXc1MkVuMEora1VVckZpMy9wY3lDZTY3?=
 =?utf-8?B?VXdZZnR2dmwwTzFUUWswSVBUbE5OVGxDbG1ZQ1dHY2MrU3A0bXIvU1p2YkQ0?=
 =?utf-8?B?dElVemYrMVA2MUpPKzJoMUxscnJSYkppWnNHazVoNEFIOE9aTU92TkRmZkh4?=
 =?utf-8?B?RzlwOUREajdNa2MyQUNBYlB5d3pJRDJuZFFWdkZOUktXWFpOWHdpRWIvNW5z?=
 =?utf-8?B?NW9WbjVFZXJKVjVFR0grSWU3NTZQcTJLYktTby83VDFXbGlibjU0UnZndngv?=
 =?utf-8?B?Q1hpVXhWd1ZvamtDQjdzbFFia3lUZ2c4UThRWFpkT0owTmpmRUhUSS94Wkl4?=
 =?utf-8?B?QkwreThwcUFwMjZxREVtWGpEVXJjVlRnRDFRcG9GNUZYd21PTERzQWlqTkVq?=
 =?utf-8?B?MEwvY0FIcGtUa1NJdVJ0c3JIMHFXQUpDREE5TWlxU3VCbXBZd2RwK1p6Rzl5?=
 =?utf-8?B?UDFjZTRqbU9tcTd4VUtHWFlUNHRyL1JDNWFGUVROMTdpT3g3WktrcUdIN3RP?=
 =?utf-8?B?bWcrcm5ISHdrMDF6aElNZEhYTmplbUJwLytINjVYT3lNdmZBeFR3TnZKelhZ?=
 =?utf-8?B?SHVleFJTbUNkZHI3RlNqTUIwSHlaWlo4ZHpkd2N4QzZCMTcvcnNEbUhLWXd3?=
 =?utf-8?B?dTdpOVd0Nm9id24xSm52aXJBdXY4Z21xc3duOXY5RUFyQWxvOVE4eEF6aEtj?=
 =?utf-8?B?NHVmUytBWXY4TXZvVnBMQU1UY2xUT25ybk5sZnZtSW9UUGplcWVwRWZUZ3I0?=
 =?utf-8?B?di9DMmtUemRIdDl2RERzbTdjWThsZEVxV3Z3NGpFYU95SklKcm5NZ3R1Q1BF?=
 =?utf-8?B?N2puazhYbXQ1Wm1DOHRzcWNJaDd6c3R2MmNVM1VBMmpETlpXWklyYndoZnI3?=
 =?utf-8?B?T3Q2OVRYaWZWSGtZQW5KZFRuSFordkQ0YS82bFVRYVR2UkhGN2RTOE1Sbm80?=
 =?utf-8?B?UUl1QnBXU2xnNzBFaHc5MmhpUEV2T3d1UnIzSTJmT3JLYzI0d3EvSGlHRWt1?=
 =?utf-8?B?bUNXWmxJeS9RUkFQZW5oOUp0ZE5Xa3N1a2FhVnB1TldyckJ6TzJoYlJUL2c1?=
 =?utf-8?B?bnZEVFZXVGJnTUxYMFVzcUV6MHNkOE1aK3h2V0hPdE4wdjE1VWNmR1VKVmMy?=
 =?utf-8?B?cTJrU0RQOUd0ajlNcUZZMHFOZjRQVVF6cDFIU0tGRjlPeWRBRTEvb3RyV3ZG?=
 =?utf-8?B?Vi9ldHNvYjBhcXRDbGREd1dRZ2F5K1FVaG9wQmQ5L005YS9MR1RUUXh4M05B?=
 =?utf-8?B?M0xPNGlhaC82WmdvNFpkNm9hN2RtOVd4RFlCdWhQZFVJbStyekJzL3o4ZzhH?=
 =?utf-8?B?TGFVVXBvUUNQRDJBaEYyekN5YWxYREU3dWV4dE5iSHBOL1VNNThpM1NsRHA0?=
 =?utf-8?B?R0QwYXg4SmY0M1BTVzh6R3EwNXR6YURzcDhHcUhFbWpSK3VZRmdjb0N1Um15?=
 =?utf-8?B?U1RMaFZhTi9TTzhKQkZsL1VKWUpVZUlrL1pCYnZVaWVNWGdPZjFPa2orbXhK?=
 =?utf-8?B?RUNWdlFnZVM2RjNhSGNSaFlQaE5kMVRVU0w1Y3NtOGsvWSsrMDAwUGVJTWlU?=
 =?utf-8?B?VFVaNk8xcGQyc3FDbkJFK1RNejdKSTJKaDh3RU5UUnhEaTdvK25XQUx1Y3o0?=
 =?utf-8?B?eGRxaHhjOVBQdUNUSTJSb1VtQXJvbThyNC92OVZENGdGd0RwTjNmRW9qWEo5?=
 =?utf-8?Q?fxJeQU60E4Y=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6697
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1c2525c8-5b3b-48a6-b38a-08ddb2faf120
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|14060799003|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0dNVEVVQmcvVUV6RmNxQko1dno0VUxOL3ZhSlRkMXljZzdYWkVkZFd6Tlkw?=
 =?utf-8?B?WGIwRlFFcXpDOGlTbFc3UDdjMnRTVlpuczc2ZnIrMWNiNzgweERWN2ZjUW1D?=
 =?utf-8?B?OGV3RkdsWFk4MUhMUXVxSllYL2FQYlFCcEpTV1Y0VjNSN2NyTWFRR0FsM1R4?=
 =?utf-8?B?NEtyRjQ0Umhxc015S2pvemU1M1Ura2F3RmtwaU9mV1JEQktZMFNvdElreno4?=
 =?utf-8?B?bUlkaEhteTBlV1lmaFJack5IaEhzUC9VaEJqNmZDNVJaOFRPYVUwVnVBZi9z?=
 =?utf-8?B?MThwOEJxZm9ycFh3NGh6REw0VVdNazk4ZlNUb1lhcW9qalBUay9zWmZTbWwy?=
 =?utf-8?B?Rml4OVJhUk14bnB4SkVBR0RBVXZBNjdhWFROR1lVSTN6eHYzeXRYbzVqMk1u?=
 =?utf-8?B?alJWY2JQYjB6UHRqV0p1eithZTQzbXJKOU9wWHhaSSsyRHorRTR2OWFIbDJX?=
 =?utf-8?B?ZUpTazlTSjEyVUpmRjNTOXErR2sxdWkvUnI4WlRDQzFLdGNYaEJyL0NzdTN0?=
 =?utf-8?B?QjFpQkJZOElpemk4Q2N3WUlnYk1sRW9FODUvaUZIb2ZLWHFFcDdQYlExV0Yz?=
 =?utf-8?B?MTRVSlA2WmxReGFqWGFLNnIyRE5nakhmd0hzcTluQkxzK2dVVnBTZWE3ajBr?=
 =?utf-8?B?ekpnQ2l0cFA0SU9nZjBnTDNQQzV5Vm5GckxsSHVhelFYcUh2RHpRNmtkdmF3?=
 =?utf-8?B?K3VWS1pHRHRMamk0V3ZKY2ZNTUlpbDgxZjZIaldwd1Y1UFpkQnRDVHNneWhK?=
 =?utf-8?B?emRTTVJ6V1RpMEtlYytoN0NKY21Jcng1VGFMUGNmcGtsQXlMSGVVRDBPaHJu?=
 =?utf-8?B?UG1DZ2pYTmVCZlBaSFdlYjhPMDc0VS9OVGl0aFZsV3A3dDlRSTlBd1ozUzFI?=
 =?utf-8?B?Z3RobHZ4U3lzL0cyV0tvb0R5Vk9jV2ZUb0p0NlkwVk1sWFd1cGJ1RnhHTnJE?=
 =?utf-8?B?ZUExWnFkd1ZhZUJ6MDlXWjdic01pY1VOamxZYjk2NmIrckVnVThRcTRMWTJa?=
 =?utf-8?B?VDlrb0FodjdhY0tUeTY4UVp1RHJBbEo0U1FLaUFKV3ZDaDU2elliMUc1WEdR?=
 =?utf-8?B?NU5vSXdKWWtPSjlZQ29OalRldWk3cmwvWFJNUHhFanBkUUZTOHBPaWFXekY5?=
 =?utf-8?B?aTJDQXp0K2ZSVGQ2UkJMMHVrSUpCekw3eXhJMHlEVDNpZ1Q5Y1B0SlJFRjIv?=
 =?utf-8?B?cHorT3JqWi9vaGxxa0ZGQjNSbnJLVGhmVUxtTElsb0pZK0tPV3ovVGlEZFNN?=
 =?utf-8?B?SnIyUm1CMVVHR1U2U3Y2ai9WYWY3eXFNL2pHSDNZREtRU3RsVkRTSHlGZDJj?=
 =?utf-8?B?cEo0ZE9MRTJmRjc5dG1sUkhtUUhoZVNVbGcyeEY2YnJqVFRrdFFyYjRpcnhF?=
 =?utf-8?B?RVRVK2ZocldKRHcvV1BsdjArakQyZzFSUk5IbXJNb1J6UmkrenVEd3ZxTHJ5?=
 =?utf-8?B?NThXeDZncEpSMklLR0xpazk1V1lCQjRZSVlZaTdVVHRrL1RtRnR0dlc2LzF3?=
 =?utf-8?B?SW55Q1g4QXpZQ0s3WnA0dmtxOW5WVUkyVHBsU29YT1lieFh3TGUydjlUMlNs?=
 =?utf-8?B?WmhnTTI4bnVlcUhUZHlKRmZ2eDNuUk5SV0NNbzZFWGdYNko1K3d1OG1wYllF?=
 =?utf-8?B?VmpBdmxBWDhadnJnS01NYnhxRTBhd0tHSXJMRHphblZKQW1IeDNtYWtBaklB?=
 =?utf-8?B?aDRwTFI2SDFkV0NqZmNzUjhxUFlpZytFenRES0RFQmhIZmlDUlNNUWpmbDlk?=
 =?utf-8?B?R0hCVnRzQkhiZjVYdlNmYU5hOEhjTWE2T3NjZ3BPM3pJcWtGWERrMUh0UFBW?=
 =?utf-8?B?d3Flek1ZeHNGekxqU3dESzFkS0xxby9kUlNBWVZOL3dkZ2NTZWlwajJFNk5h?=
 =?utf-8?B?K1R3bHY3OHJkWDlTaTZRVFR1QXhUQXltWVhUZlV5WWNPcndIYTJyZ0swdjdV?=
 =?utf-8?B?M3hTQmdhTnhxUHhoVWJ5K2hXV0JYaWZKUldEckFkdWNVemFVWkhpZk42RVIx?=
 =?utf-8?B?dlhUNEc1b21KUG1rNDdTdnh2UHkxL2o2WEZkZE5WeEI4VWkxdDZ2UXJwY2hU?=
 =?utf-8?Q?YKUUIg?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(14060799003)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 08:42:16.1217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d83a3ed3-c73f-4e7b-1128-08ddb2fb05ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5925


On 23/06/25 1:58 pm, Baolin Wang wrote:
> When invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS flag is not
> specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
> callers who do not specify this flag, it creates a odd and surprising situation
> where a sysadmin specifying 'never' for all THP sizes still observing THP pages
> being allocated and used on the system.
>
> The motivating case for this is MADV_COLLAPSE. The MADV_COLLAPSE will ignore
> the system-wide Anon THP sysfs settings, which means that even though we have
> disabled the Anon THP configuration, MADV_COLLAPSE will still attempt to collapse
> into a Anon THP. This violates the rule we have agreed upon: never means never.
>
> Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, there is only
> one other instance where TVA_ENFORCE_SYSFS is not set, which is in the
> collapse_pte_mapped_thp() function, but I believe this is reasonable from its
> comments:
>
> "
> /*
>   * If we are here, we've succeeded in replacing all the native pages
>   * in the page cache with a single hugepage. If a mm were to fault-in
>   * this memory (mapped by a suitably aligned VMA), we'd get the hugepage
>   * and map it by a PMD, regardless of sysfs THP settings. As such, let's
>   * analogously elide sysfs THP settings here.
>   */
> if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))

So the behaviour now is: First check whether THP settings converge to never.
Then, if enforce_sysfs is not set, return immediately. So in this khugepaged
code will it be better to call __thp_vma_allowable_orders()? If the sysfs
settings are changed to never before hitting collapse_pte_mapped_thp(),
then right now we will return SCAN_VMA_CHECK from here, whereas, the comment
says "regardless of sysfs THP settings", which should include "regardless
of whether the sysfs settings say never".

> "
>
> Another rule for madvise, referring to David's suggestion: “allowing for
> collapsing in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>
> To address this issue, the current strategy should be:
>
> If no hugepage modes are enabled for the desired orders, nor can we enable them
> by inheriting from a 'global' enabled setting - then it must be the case that
> all desired orders either specify or inherit 'NEVER' - and we must abort.
>
> Meanwhile, we should fix the khugepaged selftest for MADV_COLLAPSE by enabling
> THP.
>
> Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   include/linux/huge_mm.h                 | 51 ++++++++++++++++++-------
>   tools/testing/selftests/mm/khugepaged.c |  6 +--
>   2 files changed, 39 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 4d5bb67dc4ec..ab70ca4e704b 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -267,6 +267,42 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>   					 unsigned long tva_flags,
>   					 unsigned long orders);
>   
> +/* Strictly mask requested anonymous orders according to sysfs settings. */
> +static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> +		unsigned long tva_flags, unsigned long orders)
> +{
> +	const unsigned long always = READ_ONCE(huge_anon_orders_always);
> +	const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> +	const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);
> +	const unsigned long never = ~(always | madvise | inherit);
> +	const bool inherit_never = !hugepage_global_enabled();
> +
> +	/* Disallow orders that are set to NEVER directly ... */
> +	orders &= ~never;
> +
> +	/* ... or through inheritance (global == NEVER). */
> +	if (inherit_never)
> +		orders &= ~inherit;
> +
> +	/*
> +	 * Otherwise, we only enforce sysfs settings if asked. In addition,
> +	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> +	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> +	 * set.
> +	 */
> +	if (!(tva_flags & TVA_ENFORCE_SYSFS))
> +		return orders;
> +
> +	/* We already excluded never inherit above. */
> +	if (vm_flags & VM_HUGEPAGE)
> +		return orders & (always | madvise | inherit);
> +
> +	if (hugepage_global_always())
> +		return orders & (always | inherit);
> +
> +	return orders & always;
> +}
> +
>   /**
>    * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
>    * @vma:  the vm area to check
> @@ -289,19 +325,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>   				       unsigned long orders)
>   {
>   	/* Optimization to check if required orders are enabled early. */
> -	if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> -		unsigned long mask = READ_ONCE(huge_anon_orders_always);
> -
> -		if (vm_flags & VM_HUGEPAGE)
> -			mask |= READ_ONCE(huge_anon_orders_madvise);
> -		if (hugepage_global_always() ||
> -		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
> -			mask |= READ_ONCE(huge_anon_orders_inherit);
> -
> -		orders &= mask;
> -		if (!orders)
> -			return 0;
> -	}
> +	if (vma_is_anonymous(vma))
> +		orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
>   
>   	return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, orders);
>   }
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 4341ce6b3b38..85bfff53dba6 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -501,11 +501,7 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>   
>   	printf("%s...", msg);
>   
> -	/*
> -	 * Prevent khugepaged interference and tests that MADV_COLLAPSE
> -	 * ignores /sys/kernel/mm/transparent_hugepage/enabled
> -	 */
> -	settings.thp_enabled = THP_NEVER;
> +	settings.thp_enabled = THP_ALWAYS;
>   	settings.shmem_enabled = SHMEM_NEVER;
>   	thp_push_settings(&settings);
>   
