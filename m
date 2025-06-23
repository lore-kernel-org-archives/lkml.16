Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013067.outbound.protection.outlook.com [40.107.162.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DA179F2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.67
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669037; cv=fail; b=dZGXRL3JesXcTszg9msPkug1zvPSJtVmXMbeKXeKxSppBSGwc71qHmIbnZa4FTDjLFUaY/Aymj74CWeupXsDB5H6Ec7VLzYmMtko0+VoiY/nVqWq9DXKQyddhpb+sqNYK4xJNAgMUft/BZj0n1hkRIPWE6ap+dpuYhNW7QcUnpk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669037; c=relaxed/simple;
	bh=0ZFNKJLMcBPl6xCohFHSH6wvDu51FCXanKJTF3LHoAw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O8ZX15hOm6LvA+GhTZ7A/mnjySS9vw7JWF3ZywbAtRQI/aJ0BKOo/2M5k0VQCFtE8/YS4O7xKYULkb3TEc5XDUKZNIX/AKpmr0+jhosli3YGR9Dz0LvRjq05jOtmUrTyUX0AL1sXAd3JKNkFIOeyeDVbhNOlhLRX1m0omKerzyE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ej6z8QrT; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ej6z8QrT; arc=fail smtp.client-ip=40.107.162.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ej6z8QrT";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ej6z8QrT"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=S8Fo0qxs0wkilVaZqVibpiM7dSYjUSNybKH1U9DpEhPr32ajJ6qCTLPlrq4ZH2OsFbOw8t/9Din00cDZiV+1ZaEDYIoFbgpSwL7eapIRPM8rGAeB8SmOp27q0n83hFcyMHzYdmQrG+mzggFBdE7U//bAxo2PtaNPXzfXFErlG/s33vwhxReBeWwtUXbCC6OhLqzCEB4dT/Q0FMvkplZClLUmhw1594ngCpBlcQFkvAEdNGtsHKAZ1+esAo166xj6loT9ZZBLpCdEXqKyUVnkWgzU3qpVfR0koKgcLj3gJqlnhNlZmdDHXK0bpe5g32/Ct2f+O0oF55dA66MA5ImbGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHCceNFc6pDg2g5SHNJ0wYiD5cXfEK2g+tFaw9fk110=;
 b=tUsRxLzg8jGYSuOxTfUH7G2vFau49S69y/viuqViySc1X9/jL3Tk0WntvRqmSPp8dkzQYwjAiDEEVdwnKLUoF3Z+v7zcCWNXh1dfPpmiFwwvFdV/UweUKPs2agyMGZz0+4Kp2EZ2Hr5DD+pE+CwQ81XRQW+Te4rL/Ns6rZAW2V/xn4A7viu9p+WRc5kg9QEUDqqny+99dBCdCclDNwF285OBm5DIGeDI4+op33i3hSX0MVFamQXIYdR5vDOwpW8j6lErYKZNuWWSPm+gywpY4NoW8xhfms78LfDHthpdcQQXrza/5Fy6M4UQRA4uA4qiXzlS1FOMXHJV3fcLs91GKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHCceNFc6pDg2g5SHNJ0wYiD5cXfEK2g+tFaw9fk110=;
 b=ej6z8QrThCulvlgNPnetzS7GDjyE4WEoIQIm7BFqXVO3ux3XKIomr7kKFIkCZ5azMVlol+YiMjxnOJRHsGclmF2sdMBW6+Vom663nN9lkvvFEKpm1jNZnyX6LQcye0FL15whctc0Yv8I2tPc6LdMW6B+Bcbwy8ZIlb68grE4974=
Received: from CWLP123CA0126.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:87::18)
 by AS8PR08MB6262.eurprd08.prod.outlook.com (2603:10a6:20b:23e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Mon, 23 Jun
 2025 08:57:11 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:401:87:cafe::90) by CWLP123CA0126.outlook.office365.com
 (2603:10a6:401:87::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.28 via Frontend Transport; Mon,
 23 Jun 2025 08:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 08:57:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjkxoS2hlQWDnjPdBgSy+Hcgmgsjfc+yN3wG2ROHfKVErSTb19rIgqLsJ4kOplj1MwhbQ5zG+49DNZhN/s4m+0ZfuWWswLpzx5kt7c9u2BmCqDsEFlEGyPCs829IfOP/wKJGoQvSx/CLY6Az0hqDyLFK00+klST4Un4GVXvX0R70bblIfr96XEhUc3xDLWlGK3yEvnJf4FMPLgva0YteBu/XfETnsYsMFQZmr0lgHdO7UuFVQJF7kOrm8Z/kU+uNBmc549mgmpaIfAD2HTubPntsLwnKEUCVla8JVgsD2cdbK18tVpNo2Oi0D/guGOEeLnJk9tyiC2c7xoKA7ASXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHCceNFc6pDg2g5SHNJ0wYiD5cXfEK2g+tFaw9fk110=;
 b=YDMzcs51NWVBSCC7WJllFwjK7Z/VkfUoqLX++6MrRAQWgabRfKRWHj8XFX0B/Xf6JEwFl/aL/r+Oy4CmIwi0wxNHSZHPL+tnNanIeZKKs05wdTd+Lfokqjwe9M1HdX9krutmUkPZk0+06Eo76+/bQBC2YfMgXWRRYfxf1BaYkBv6vmKXYt24W3XY3eQwxzwq1yUT8qGufozplSPK3MI8AVUXIy1hUZqB9hcCGXDdWaDacohUK2tSrFfsAk2BZ13CjMoJ/gHbc7iVu2NzGFoA9dJhRdCZKOpt1Lb55rp1f7gZqvxRslkhHGVX+O1R+gj9s55OmjNqvOoSFwvD+LCwkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHCceNFc6pDg2g5SHNJ0wYiD5cXfEK2g+tFaw9fk110=;
 b=ej6z8QrThCulvlgNPnetzS7GDjyE4WEoIQIm7BFqXVO3ux3XKIomr7kKFIkCZ5azMVlol+YiMjxnOJRHsGclmF2sdMBW6+Vom663nN9lkvvFEKpm1jNZnyX6LQcye0FL15whctc0Yv8I2tPc6LdMW6B+Bcbwy8ZIlb68grE4974=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GVXPR08MB8234.eurprd08.prod.outlook.com (2603:10a6:150:17::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 08:56:34 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 08:56:33 +0000
Message-ID: <c11a4b2e-6895-43b7-9ff6-620793bf8551@arm.com>
Date: Mon, 23 Jun 2025 14:26:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: move mask update out of the atomic context
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250623080440.3005693-1-agordeev@linux.ibm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250623080440.3005693-1-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GVXPR08MB8234:EE_|AMS0EPF00000197:EE_|AS8PR08MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5670a0-2f16-48e7-eed2-08ddb233f0b4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?V0xjc25ZMktmQnUxTDRoZVA4YlBkeDN3dDNrZUkyK1cxaTY0Zmx1bXFybkty?=
 =?utf-8?B?REwraWVrSWFFL2RzVmRsdGd4a3NoVzYwNm5FN1hQT3ZGbHpZcTJBbVBUWmYw?=
 =?utf-8?B?RlR0dTRteTVRM3pYeS8wWUx5K0RFVzlKeFdrczdQZlE5VmhBN21RQjgyNG84?=
 =?utf-8?B?ZElaZGZSZGdjS1V6dDZxNDdUVkRzMjBSVXIzWXlkcHpvcWlRR0FxWWUrQVlu?=
 =?utf-8?B?M3hPRDV2RE5YZGhhT00xd3hFdCs2YVZKZGpKWDZETzI0aDdQbi9URW44L1lF?=
 =?utf-8?B?bStkb3pTODFmeVk5WjRwOWtqa1pXUGEwRjVWQjB4TUJaaDVXampwSGNHaXlO?=
 =?utf-8?B?TndYS1Y3RVVHdWFHSkNidHh1SFE2cCtsRGFzYWU1aDVKY2VIYWp0eG1Nb2Vr?=
 =?utf-8?B?TGZUcUQ2NmNqdUUrRGwxRDFvOEVZdG1VV0MvTjZTTFhxU1B1d0tZSThwUURv?=
 =?utf-8?B?djFIeXZPeGZ5WU9WNUY3bDduRlN1UFRzd3BsLzkyQWZwaE9pb2hsNFlTTkJu?=
 =?utf-8?B?bXFITWR1RGpRelhudmJ3OGYrc2FGZ3VnMGtBNTc4Uzdrd2o2UUlDYkoxWXBp?=
 =?utf-8?B?Y0FMYjZIcjRya0EwdVA2b214OWRqNXVUcmZKQzFrM0JzNTg1NTlDODRJUGFM?=
 =?utf-8?B?UzV3Uy9oSEpiOUtXeEFzMS9QMDdlZnlibkxBcnN1ZHpDY2g5WWw0MjBndlRw?=
 =?utf-8?B?c0xIbjhMN0llWE1OcnFRS1ljQy9tWDl3cDlFa3dLSC9vRXR3MDloUXE5UFBN?=
 =?utf-8?B?STEwZHRKbVY5Q3Brb0tPeEZXUHJJSEkxV2dQYVN6bmhhMXZCeEFBQndvMUlo?=
 =?utf-8?B?aUhRUy9pREFzcmM3aXMwTXhNQUdsZXoxc0J4SVBPdkxTN2JsNFRwMjNabUFP?=
 =?utf-8?B?SVVJa01qNGY2MG05OHh0ZTRwSGh1OHBFQzJyRXE3SHJEQ1UrQmsrdE1jb2FZ?=
 =?utf-8?B?SGRiZnJzbkZTbXJ4VDRsWDhVQ3Fzd0tnbmhzUkI0NXNiQkRKQWlxUWZyZW12?=
 =?utf-8?B?ZjVqWC9LQkpyczNoQkJKa2xZMkZTNUdJbmVuak1zZS85eCtsZG9BbGF4M1k2?=
 =?utf-8?B?Y0pudUE1YkVZRzBleE5adjF4TkdzSGVRQXdic1lKN1hsQStlbGJxcFJCSmpk?=
 =?utf-8?B?Z0tnUXZUMFAva1VENFNhN1VhMzhUYW0vd2I1cHBvM0wzdXo5L3YrdGVkbGZ4?=
 =?utf-8?B?dVF5YUVmaUhneDBrZUMyNUhQRFFlNmZNZ2FOWFVEWVE3Z3dIS3BEbzZCaTJs?=
 =?utf-8?B?RWRpSlFXdWVNbmlLcWxjVWwvL2xyWmV6SHZwZWtMMTRBUUFzTjU1MU5Gc045?=
 =?utf-8?B?YSsrVDArc0ZqV1BMYlFLUGNBdEI4U0ZmVk05dHlRdi8wa3hkYXE3MEpDZXg3?=
 =?utf-8?B?RWVKeGVFTFdZVHpRZlQvckxTUk5qeVkrWXFWQjJvcmlCY1hqZ296Ri96eXUz?=
 =?utf-8?B?azRIdFlZZkpNVkZSTVJDVlJ5eVlCaHlDUFlsY09FQkJTTHNNVjhyMWdwdm03?=
 =?utf-8?B?NDN0T3ppd2U2VzhESXFTa1NvVjVUMWs4MU5pNkRZK3VoZFBCeW5mTkxLV3Qy?=
 =?utf-8?B?SURyS3QyUGFiSHFpYVBLTVpDc1dSWXRxTmFsVjNtZkFNZE5uekduOU1IWEJr?=
 =?utf-8?B?Rms2dUJEc0NIVlpxRTFTTU5wdldOTk4vVGs3NzhmckZ6SjZDbVVrUUc2Slcr?=
 =?utf-8?B?M1hGUGtMb1p2MjVBa0NxN0JmMDlKT3dKTGNSWVJlSEMxanJUZVhRa2RYc0hX?=
 =?utf-8?B?WGFaWnk5RENMMmlteDQzQjJuTkxvMzJkU1EvNi9wYnFuMEE0cC81cDlyd1Mw?=
 =?utf-8?B?dmx4N1Z0dTBqcTAwYU4zS0NObDJTd1pJL3Nza214TXU4ODZGV3RxVUhIZlc0?=
 =?utf-8?B?azd3ZHh4K1Q2UlZxeFhUWm8rRVE3Wlhkdkp1c3BpVlRlSHc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB8234
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	63dcaf81-a017-416e-5b7c-08ddb233da7e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFhPd1JWYnZOeTFNZjdJSXgrMW9Majl2c2pjOVNrV2tVOHY1REREcWFFOUsr?=
 =?utf-8?B?bU5xNzFSdDBjSVZWVFRWYjdFVXAwT1VvaEVQRW5pUzRvVG50TDFuTldsYjZR?=
 =?utf-8?B?eWNvZWpWaEY5amJHWTFyU3RkZ01uejFSMWJBQUlZektaMHBzZ2g0U200aHNB?=
 =?utf-8?B?TVFoWkhoaktaTHNtWFdGNi9QUDMrUEZMakNQVjMxTlhrQkZIbWhlNjZRRERn?=
 =?utf-8?B?azc2TlFqakJtcTZPNWNXM0hSeUc4dkw3ZzM0WnZJMnZKY3A2OXJzMm4yR1lO?=
 =?utf-8?B?RWFpVk5wb2pLRkRVdVNuVzhrTEtENFVEZXZQbDlLUVVWaGJIRTJ5OTBTaS9m?=
 =?utf-8?B?WU1OdTFqLy9LNUI5c1p0Mnk4N2VPbnd2UCtqQklyMXZuUnVuS25DUGtUKzJh?=
 =?utf-8?B?MmxXTjd1d1Q1V0xxa3FvWUI5Z2hiaVR0di9IREtOcHpGQnRlZTBkWnNyRmtw?=
 =?utf-8?B?OXhPZC8yTjV2S0tpRG5XOUNVcm4vYzdpVUxub0x3dXQ2TGxuSlEvWmR2WVZF?=
 =?utf-8?B?dVVHT3g2VmVrSitjWVNNN1lRYWFSV0NVblYyRzlVNFpScHJFY2REWklBM1lH?=
 =?utf-8?B?eTBaTzV1bVVickEwd3BXQ3BhTVNGWHBaam94NjBtemtuTzBzVGwyUFBrQ2ZV?=
 =?utf-8?B?UkVOamU5SjVOUHJ2Q292enM2Y0FvanNNMGlDQkZsQnErYmVKcnNxUlM3NjZp?=
 =?utf-8?B?a3ExK2toaFNubThIeWtaMFhpL0dxUnFVbVpHT012bFcxdjJXTGV3V2x1Z0R4?=
 =?utf-8?B?NUhkaHJ3MFdHblk1UTZYOGpNNVZqcURFZW1vKzB5bWp4anlNRVlEeDBBc1M5?=
 =?utf-8?B?MEY2OTQwYnEweXBWd0kvNG1CN3VUa01YOU9ibnV3ZG93aUhxS1VpVERObG5P?=
 =?utf-8?B?MUV0RkRuS1RxaFYrUERXc1ozRGF4SWNwQ0djK3krVm1OczY2eHlYb1RoL1ZB?=
 =?utf-8?B?b3FUcSs5NVR5UTVYNDZoMFR3NEo0RUpPbytoRjhzQXNpZnc0ZU5ETFNSSnJx?=
 =?utf-8?B?QXBGbHhxeVFyVFJkcGdvWEtNQlF4T0M3OW5tS0tOZnM1ZEY0RlBOeVJ6aXA2?=
 =?utf-8?B?dVF6aDhka3dCK1VNajc5T0lCeXFnSmlWRWtDKzNtM1pFNS9wbkRzblNsQVZn?=
 =?utf-8?B?Q2RlS3d2VHNYYXAxKy9kcmhZNkZFSnZEaTgyYjJEZTBnUjZaZVVjNDcybUFV?=
 =?utf-8?B?QjlYSC9WRzAzcUJkUFZqWFNYQXUwWHU5akdMZStsTkpYQ3VRVEMrK2w3aUNQ?=
 =?utf-8?B?V1pRVXhHQTByZzRMWkVYN0JxZDNkZlpjZUU1Wk9KUjZzZUNnQjJOWERWWHll?=
 =?utf-8?B?ZGNQY0xWUmNPR2FVN05PS1RPOGE0STdpaEUvajc3ZzNjaFlHZkpqMm12YlVy?=
 =?utf-8?B?Z2RqcTFhTUY4MGMvNUNkV1o4Q2RyY09xLzRrbXp6MVpXS3JaSzJQUm8vaFN6?=
 =?utf-8?B?YVZ3a25EMVpjZjNXZTF4bEdlbHI0RnRKa05wWVdObnQ5c1ZtUC9RZ29OcUJJ?=
 =?utf-8?B?NWVGZGlSOUgvcStES3ByYlYrUTNLMm9yLzViSDErb2tBNjgrQmhoU1MwN282?=
 =?utf-8?B?bzc2Nmp4U3VoRVlNcEJtR1BWTXJrbVg3aUlObDhxN1BtQUxuTk9xNHd0UzdJ?=
 =?utf-8?B?bHdVUU9EUStmWnFabmRuOHVLcGhWa2Jkb25acHpGRlZ0U243S2YrZjhybUhG?=
 =?utf-8?B?OUdGSjNpZE1rTlc0MXhZN2tEMnhTL2tZdm5IWDdBWENFamp5Q1lIcDJlMDZ6?=
 =?utf-8?B?cTNzR0c1VTNaR1diRXU3TkNkNHFBNkFCRFF1dWY2RVdqZG92V2E3SnBqQUdh?=
 =?utf-8?B?ZmRwNW5RNGt0T1JaZlkyWEc2M2JNZW1zMnFkQnhoN21XNXZOK2R2UmYyY2FG?=
 =?utf-8?B?WUhNeHJMMlliTmFCY29RQTJwVlh6aHU2dDhqejlUTlFGd0ZPNCtEQVZKdFV0?=
 =?utf-8?B?WERQU1RuREtkWkdjNUtGUFY5aVNDSlQwNlRjcUN2UG5tdkJ5R1hVWkhiUXF6?=
 =?utf-8?B?Yk1RRGsrbEhmUUljbnV4VE1aZzE5dkkxUGNTdjhTN1NsekhodkRtMDRUaFVL?=
 =?utf-8?Q?TKKISF?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:57:10.6995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5670a0-2f16-48e7-eed2-08ddb233f0b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6262


On 23/06/25 1:34 pm, Alexander Gordeev wrote:
> There is not need to modify page table synchronization mask
> while apply_to_pte_range() holds user page tables spinlock.

I don't get you, what is the problem with the current code?
Are you just concerned about the duration of holding the
lock?

>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>   mm/memory.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 8eba595056fe..6849ab4e44bf 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3035,12 +3035,13 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>   			}
>   		} while (pte++, addr += PAGE_SIZE, addr != end);
>   	}
> -	*mask |= PGTBL_PTE_MODIFIED;
>   
>   	arch_leave_lazy_mmu_mode();
>   
>   	if (mm != &init_mm)
>   		pte_unmap_unlock(mapped_pte, ptl);
> +	*mask |= PGTBL_PTE_MODIFIED;
> +
>   	return err;
>   }
>   
