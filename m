Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2067.outbound.protection.outlook.com [40.107.104.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A32B29A0
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.67
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896046; cv=fail; b=qRZhw+cJi+VADQm/3D7XGNa/9EQxjKDrdHZjcG8IjhrECrvwF/EuYowgRpALC+J+tu3ZhZklhRY6J/BN4B5716oYeXsEStHfsFEz3vguoelcLHxjuo+lYCGnxadUUwP7XQVmUOxM3QRkPjTriN+mHTAv47Zgk2bWRQL0v4o9kco=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896046; c=relaxed/simple;
	bh=U0aiB+vm9ZkQTUhGfIV2+z7NNgL7E7tFvbKFNOMSX78=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JryyV54ZptMx3RLPq/y87DwObkdHHqsypev7fmAwWOmXdyirMH49Elg6cT7lsSkHIE2rVXiJlW1YDkC2a1dwuJ/+Y7HPRSZ8zY4Yz22zhWbhYd86tTUC9xNSt65AqQUG585hL0stH0I3qDZP8IFxM4sCRB6WWkuhn2UzqCM/ZbQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ngcr7dHf; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ngcr7dHf; arc=fail smtp.client-ip=40.107.104.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ngcr7dHf";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ngcr7dHf"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JK9Y6tV4I1NSK1hRd8g1mmj8KpLaE7StYIVW9ykNkpRhR0BGJRQIcyn7S9tRQzKyPJ5UL+mtkNkRLQGZbkcG2G13YRWVuQvhbgUVOgyv+b+le6uoChPIEi/o9cFroYliTovS418PwgDrd9thAp+y6SgkOI/F9xd3AIgqIuWB6MuKEXOTyHlICvdQ4hjNN+8VfooSqhymZJ/aUZgY6thTg9KfRH6b9IjgEFKKDaH4J1Now/Gw9Rv3Iw78nsUxIPvaE9beSZlsN8coDgWojgJCbUAc8vqAqbX2ZO8H12ir+FoV6ZHLpzl089+xGb8HEPg4ignrDTZ1tKerQw/YH+kfPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYt59VRAIsE3T5nmsELzOxxQPPxlhQUuYQKp5pgMl+4=;
 b=iFkdIeSYmqKgpS7FsJrmpX/5FHkyETudW/fzvR0azSvdzOy0klxMTD+hwOj/ZhtoGY/WB2u1E71Re+eDv5wtXlSNLYhdEWgwsaxtqWeK3u5blxLf6suS1QugZgNa2vDhUbJfMtYRz4WS/w8dGcnPHDA0XNOQoQ+XLsGuZLghlVqoHy5Lw/FQpi1MWIYb+upNG/Iq+SG7UWr7ecE7RCn3cWH5omrt0kfQzRohGWA9+ZtFdjcuCD5EkYJ32My3abc5jJgHeLTkVdTIZkehHe536f8lfMiJadqD4gW9N/d/J3kPFaEyPZH0r4L3ooOygM5ff/2qHCvuGXeeKNDcbvLj2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYt59VRAIsE3T5nmsELzOxxQPPxlhQUuYQKp5pgMl+4=;
 b=Ngcr7dHfsGiaL3KXwsJOOBOnB9IXoeIfvstUWVbEGduMwjAoTY2SnuWFtOfSuTxaG8sDRozFdLFrF26jCVKX6DWJTf8XNX/dwQ60ul84d0CVYP+YaOSUk0VREdrkR5JZA7iY11Uy14sNrWFiy+0o29a9+FiDvjl0Jw7+Fig0LA0=
Received: from AS9PR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::27) by AM8PR08MB5762.eurprd08.prod.outlook.com
 (2603:10a6:20b:1c6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 06:40:40 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:542:cafe::9a) by AS9PR01CA0045.outlook.office365.com
 (2603:10a6:20b:542::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 06:41:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 06:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDlRKVcbaq9x7fOa7N3Awg6xHdOWDNmflQivkwj0wj2obJ/HtugbVeg7INIA49enm//+A+QHtjLY7BcBJ2aEEc0dNL0gvL1La9EzHubAQ1A0QGtunpK09ttA13GY1CIodvsnAuq5nV9lDhhtDniHCV/0PFLKJxZiw0CjF03IqOTU1J5ont9BAPMHz6FfiU8vRBFGunCkIdQi5AA2XBpGpidb7FxKVXUaVTQwAm74PiPJCU8scvtQ8K6h1f8zXdp62XHIEDUApJr2gTrhrU84uQ45zq3LOPPyxM0eaE4KYnbRZD7GFAYH/Z6V/TCAo3txZTsLeH4NkmctKmLVBTfgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYt59VRAIsE3T5nmsELzOxxQPPxlhQUuYQKp5pgMl+4=;
 b=VqA48lKj5DjG2ZfFMLiEmESUhST21t+kl75OYSBrJSVvbbvhAYm/9ISBFAYj0egYFl+rKofOEKxgqOB/4vsrhULmhNw8A1qN6XohPPvozhxdThU5vXQ2NtTxwM8FOB8bwo2Rt2nLAZ4sD09sNy1I3K3rS9kD6U0d93dX8Aj/uKHsjBjIuKvQ4LJYshA3L5UupOZdTv0AujTCgOmrQ3lTvn8ZfQ7oH52XzM6T9Gf3HoVpgBfEzoHvwGLZsIgNi9UP32UGATTV8CKzPq9HOFFvPGKk63HQJEHQ/xhpT+5DUyxcQWa58YPK3yYBsRQIuYD8ihHt6rcocYrHXKxDe1a3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYt59VRAIsE3T5nmsELzOxxQPPxlhQUuYQKp5pgMl+4=;
 b=Ngcr7dHfsGiaL3KXwsJOOBOnB9IXoeIfvstUWVbEGduMwjAoTY2SnuWFtOfSuTxaG8sDRozFdLFrF26jCVKX6DWJTf8XNX/dwQ60ul84d0CVYP+YaOSUk0VREdrkR5JZA7iY11Uy14sNrWFiy+0o29a9+FiDvjl0Jw7+Fig0LA0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV1PR08MB10907.eurprd08.prod.outlook.com (2603:10a6:150:1ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 06:40:05 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 06:40:05 +0000
Message-ID: <1c7b0ada-c657-40df-b1ed-ab2543dcef6a@arm.com>
Date: Thu, 22 May 2025 12:09:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] mm: Add batched versions of
 ptep_modify_prot_start/commit
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org
Cc: david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-3-dev.jain@arm.com>
 <59242559-5e90-4422-82f7-179a44eb968a@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <59242559-5e90-4422-82f7-179a44eb968a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::13) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV1PR08MB10907:EE_|AMS0EPF000001B4:EE_|AM8PR08MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3760a1-6338-45cc-494c-08dd98fb9157
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?K0MraXhGTGVZbmIyRmtaZjUrY1JaUTJ4djBYSnRSYmV1SEJGLzVqMU5La0lJ?=
 =?utf-8?B?L1ZQNTE0anpka2dMNDJtUjFGZlpwaWQ3VmdCMUo0L0ZQYmdOUThlbW90WGVX?=
 =?utf-8?B?VWhQeHpjZFI4WUI2MDk5WXlpKzdWSVZlU0pyZG1MWmVSWUhuaUtkN3R3TG1M?=
 =?utf-8?B?VEtTRWlvd1drL0lBS3lFdzBIcWEwalVWUVViN3NiUFdEQng0SVI2bmMyQ0tH?=
 =?utf-8?B?VTA3RGVJNzlWRklnUlBvM0d3Qmg4U01WRHZzazdTRlREdllvS1BqMEJKb3pM?=
 =?utf-8?B?bThxY0xwOWdyaWpoUVN6TklieXltWHl5ajM3Y0RoVVZGZExyY0NYcERKanZI?=
 =?utf-8?B?dmhUbWNHNDAxcFlhNFJqbkw3K0JLdFhmTWQrUXpKTDJyamR5aEorK3VsY3gv?=
 =?utf-8?B?ZzUrdlc4RWUwQUVkVE1lUElnUWUwRG53MUVRa0pnSXU1UlhMVks1OU0xZ2tY?=
 =?utf-8?B?ak91VTlWTUVmQmpRemhXbTdpeFZHTGtydzZwd0d6SmtvU3hFaDFzZDZkaUZy?=
 =?utf-8?B?a3hjZW1IYXJmRU5jRzJzbGFFNUdmWmdVTjBPZ05aU0kxei9PVE92c0hkZExT?=
 =?utf-8?B?YWtOZksyTnQxV2xRdTBtUTEydDZaTXk5cWV1Y1Z6Q2xwdlpPZC9PVGVWbko1?=
 =?utf-8?B?THFzeStoMU0vam1lcFlIOWlBWm9BSldsbU41cXUrUCt5ZHFVNUVobUE5K3lF?=
 =?utf-8?B?NktTNkR5QjdvQkxvZHZ0d2xvamJ2UUhRblJYSjMrSTZtZEJNSERwREtVSmF2?=
 =?utf-8?B?akNjS1hZbzNIVmtyNmcrclJaU1dUdXB5cnh4UWVaRTlUTGtIazJwcnBVeTF2?=
 =?utf-8?B?VllPaS84eFNVQ3NZTGxNZXBGcllnbHVyQXlQUDE0OUFaa25KRmtnclZqbm5a?=
 =?utf-8?B?NkhaTkxDUlg4bWhOcENrYktYa2Q5UU0vbU93M0NYTXNvdlBzTzYrQzljbVc1?=
 =?utf-8?B?Y1hNcks0ZWFqV2ZNSm1iV1NKNC90RGtWakFIeWlZMS9qZ2dzLzQ1dThTY1R3?=
 =?utf-8?B?NVdVdFhLTm1OcGdZN0s4NFRMRWxQbzZRSUNhMk5VMWtuMzZaS1k2UTRiUmdS?=
 =?utf-8?B?c3h1ZTQ4TnUzNVVNODlWcjMrMkYxRDdUZU9mYVArM1ErZlFob0tUN0RUWWU0?=
 =?utf-8?B?dk0rcVAwWVhTQmNWMXBHd0VZWG00bEpjSlkrZkRzNlptd3dRWmxqRmNOMSt0?=
 =?utf-8?B?ckpDa01vM0JiWmFWZTBGTXBMQ1UrZ3ZmLzc1Q3hlMlRtaXl0cXZpZmJMK3FB?=
 =?utf-8?B?UCswOXptcDZSc2poNXhyODJiME9hZnRNbU9hRmgydDJYYVhId1ZOVnk3TUQ4?=
 =?utf-8?B?UTF4QkE1eHBVUWQrOUV5OXorREpKR2lmOTBNeTI1Z0U4dzdlNnY1MitnbW9j?=
 =?utf-8?B?Q20yWHVoRmdhVE9mM0dzYkNQZmhlcGF4azJpbEJQclpMdWkvT0oyeGp6dlBl?=
 =?utf-8?B?QzRDcHcySmh3Q0dhQlUwY2ZoRXFLbUFUWWZWNTRPOU5oOVE3Uzc3WkVob3FB?=
 =?utf-8?B?LzBQSWs1clQyMU04Z0ZBdzhTT0dsaXhyZktuSCtKS1NJdEdHNEFmTkpTaHNT?=
 =?utf-8?B?SlU4TE1QVEZCYlJZQmQ2dlN4VEFXRlRsZ1VuTWVIMEc5WUxST0lyeDJUUTcw?=
 =?utf-8?B?WWU1T2o1MWYyaGVNY05LdHl4c1llTFVWTW52NWxSeVZHMGZ4d3BwWVI4QWNN?=
 =?utf-8?B?L01HWTdqdEFpa3hJRXdRVkM2OXhvcjQwckM0SnNsb1VkVGgyTFR5VDBaZDZi?=
 =?utf-8?B?VGpmUGJsbTcyOS9idGtDZWVCemdRL2J6aWJjQTE2ak8yV1RDWDR2VG1KVnpB?=
 =?utf-8?B?K2UxZDlGOGRwaUs0a1BsSUZYVnNnN1dYSEpJRThrZkxhZkczdS9rTm5KaG1C?=
 =?utf-8?B?N0ZxbjEzT0RWSWNmdFlJaW9XdTBhUWRWbVNGQmxnWDhtaHc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10907
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b206c19-ea8c-4a3f-33d7-08dd98fb7c41
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|82310400026|14060799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTg2blF1SlFkZ3QzdmJyY1ZXeWd0REVyMFhhblB3N21WZlNFTWVTQ3ZQVnhx?=
 =?utf-8?B?THlQSEV1bktIZWdhYjlMZC9QL3FYcWIyRmNxb0p3S3dVUDJZalNyMXdVWnY1?=
 =?utf-8?B?QVZhdkpmbGZFOEVFRXYvbmRCY0kwSmN1ZWxiWGRDWlBBSjZjQkQ0U3hTM05F?=
 =?utf-8?B?SkhRNjU1dTZCMG1seVc1RXV0TUkrTWxCL01sRXA3T3I3aDZKZU44VnYwSDMx?=
 =?utf-8?B?Z0hmb0dQUjdlRDVRZFRjTkgrZnUyd1dDa0tSNElCNFNMSVc5Y3hUVHNCanlD?=
 =?utf-8?B?ZHNoaUpmRDl3ZUU0aUhuVERCd2pHMklkU1B1ZlpEbElhaS8vUVlWVVM4QWNC?=
 =?utf-8?B?VWJLVXhMN1pyekhCTWdRWWdPNmNYVndJb0luUXdnTDVBWFRMZVYzbFNRZklj?=
 =?utf-8?B?eVc4djRuTEhMT3ZlVXFyQkk5Tkw5ZjI0Q0hzRjBWSUszZXBXODZFSFBVbjJy?=
 =?utf-8?B?SzFlNHl0dXIzeldIZEdhdkN4MzRNUXV3MTZYVGt5NzB4OVdtK3lHMFYzVHNa?=
 =?utf-8?B?R2tiS0FCR0VDOGg4RDA2THJhcjZydjJqOERMZHV5Rk1VMVVhMFN4QnpKd3R1?=
 =?utf-8?B?cDBlUEZMSHFNTE15QWM1bkdqOVhLUjBRN2JMVXlWYVFKQUtuU2tqMzcvRXVW?=
 =?utf-8?B?ZlIyNVVLVnliN2llZWdXLzYvUFl0QUZSbWJvajNFODNEOVE4dFM3Y2JyTkFZ?=
 =?utf-8?B?Uy9jYXhUY3k2Nlg2dVErMkFxU0FvWmgzOUNPeTNJelg4TnRXODkyZkpHRmw4?=
 =?utf-8?B?RCtUd3FiUkYyTysvbzR4YTJaQm02ZUlVVjFldWt3bEZ1amhNSHB1NVdHZnNQ?=
 =?utf-8?B?UFJmT0xhaU44N2VsK3hKNWczWXpOL3NLcFFxeXBoRnBaRzQ3MktaWWl3SUow?=
 =?utf-8?B?SFlHemo4TWg2Yi82V0h5bGUvZzlxdllrbEJUbGZDYmgvcVY4Z2N0dFZaSmkv?=
 =?utf-8?B?d253VUtqN1BJQ2U5bWtuUnB5UHBSdEV4eXFGVFUxS0dpZVgxblpoU0ZlcmVk?=
 =?utf-8?B?MmZPOGZTejc3bVpaMHFoMXI1Q3diSHZlK1FLTUFKMEpZN1FPUEdaVnM2WFZP?=
 =?utf-8?B?MEJiRmVraHNIZEQ3eWI3azRYVkRSUjN0WldHMEhxMDhvdWJzd1pPVE11dlli?=
 =?utf-8?B?eEVObzlMZ2JpL2RCckJ4cmI0d1AwcmlqbzBuYzF3Z05UUjUvVzZpTEJKUVdB?=
 =?utf-8?B?NE53SFRZeDNtT0RHNnMvUDBWTHhJbnBHR0tOZFBMWDBEM28vS3lIdzVvTlpD?=
 =?utf-8?B?YzNDcFAwZ0tGNU1SeUl5K1hzWldoczYvWXhvTGdKa0F4RHlsTWFKMzUxNGZm?=
 =?utf-8?B?dytzT2M3OEtiY29xOTRWLzQ3N1luWVBucTRBQjZseitmemx4MnEzakYyazJE?=
 =?utf-8?B?R1ZvSXpaQWloaytsVkZHSXlzNStzUk10N2dCSFVod1REWWIrSTNxcjQvOXlz?=
 =?utf-8?B?Um9YQWlKelpXMG1hNndKRVBwUjVOQ2lqbStwSnplUDhyeFN1RnZFVEtnWUdm?=
 =?utf-8?B?c1V3c3FJSzZWeUR3cXU0SWlIWGVhUDQ3TC9scjBtWStHbzFnbHg0dHRKTjQy?=
 =?utf-8?B?Q0pNYnBtdEx0dzl4VG5tRXJpMVZrQUptazFyakZPWWJVanlVb2VUcUVMQ3N2?=
 =?utf-8?B?Si9KdEJxN21UMXhDKzhMQ05LRVgvK3hncU5IbC9uS29lUGdoMzE0TVJxa2FZ?=
 =?utf-8?B?aW1wTlJlQjB1ZUZrTGlWQnNRdHVsaDZrbHl3ZmlLd2FiNmtwbHhZV3JwWUh2?=
 =?utf-8?B?YXgvUUE2ZlFEZlp4WE1UNzM3RXRTNlk2aVhDV1hnS052a1daTnRITlNMQVUv?=
 =?utf-8?B?VnZqcnp0Qkp4dVU5SktZT0FLWG1jeGRubURtaFNQYk1XeWtUYlViVUQ5WjA3?=
 =?utf-8?B?ZUxFL3REeVQ4TnBWdFdFb1pHdEU4VWRhcUVSTE9OMmYrZUt3cXJsQVNEQjNx?=
 =?utf-8?B?V3djYkc2ZzBvRG82VWJzM3ozMEtUcGIwZVBWbjRRbERKNE82QnZPOTZacWtV?=
 =?utf-8?B?RHlGdlhlWENtM1BuRUpDMmhRZVNIbEhYS3VUY0R3LzkrTXhmVjFQSDhCTjhV?=
 =?utf-8?Q?kE7klA?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(82310400026)(14060799003)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 06:40:39.8149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3760a1-6338-45cc-494c-08dd98fb9157
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5762


On 21/05/25 4:46 pm, Ryan Roberts wrote:
> On 19/05/2025 08:48, Dev Jain wrote:
>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
>> Architecture can override these helpers; in case not, they are implemented
>> as a simple loop over the corresponding single pte helpers.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pgtable.h | 75 +++++++++++++++++++++++++++++++++++++++++
>>   mm/mprotect.c           |  4 +--
>>   2 files changed, 77 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..e40ed57e034d 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1333,6 +1333,81 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>>   	__ptep_modify_prot_commit(vma, addr, ptep, pte);
>>   }
>>   #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
>> +
>> +/**
>> + * modify_prot_start_ptes - Start a pte protection read-modify-write transaction
>> + * over a batch of ptes, which protects against asynchronous hardware modifications
> nit: This overflows the 80 char soft limit.
>
>> + * to the ptes. The intention is not to prevent the hardware from making pte
>> + * updates, but to prevent any updates it may make from being lost.
>> + * Please see the comment above ptep_modify_prot_start() for full description.
>> + *
>> + * @vma: The virtual memory area the pages are mapped into.
>> + * @addr: Address the first page is mapped at.
>> + * @ptep: Page table pointer for the first entry.
>> + * @nr: Number of entries.
>> + *
>> + * May be overridden by the architecture; otherwise, implemented as a simple
>> + * loop over ptep_modify_prot_start(), collecting the a/d bits of the mapped
>> + * folio.
> nit: "mapped folio" is a bit confusing given we are operating on ptes. Perhaps
> "collecting the a/d bits from each pte in the batch" is clearer.


Sure.


>
>> + *
>> + * Note that PTE bits in the PTE range besides the PFN can differ.
> nit: Perhaps "batch" would be more consistent than "range"?


Sure.


>
>> + *
>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
>> + */
>> +#ifndef modify_prot_start_ptes
>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t *ptep, unsigned int nr)
> I thought David H suggested modify_prot_ptes_start() and
> modify_prot_ptes_commit(), which we settled on? I'm personally fine with either
> though.


No strong opinion, I'll do that.


>
>> +{
>> +	pte_t pte, tmp_pte;
>> +
>> +	pte = ptep_modify_prot_start(vma, addr, ptep);
>> +	while (--nr) {
> I thought we agreed to make the loop logic a bit more standard. I don't recall
> exactly what was finally agreed, but I would think something like this would be
> better:
>
> 	for (i = 1; i < nr; i++) {


Sure.


>
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
>> +		if (pte_dirty(tmp_pte))
>> +			pte = pte_mkdirty(pte);
>> +		if (pte_young(tmp_pte))
>> +			pte = pte_mkyoung(pte);
>> +	}
>> +	return pte;
>> +}
>> +#endif
>> +
>> +/**
>> + * modify_prot_commit_ptes - Commit an update to a batch of ptes, leaving any
>> + * hardware-controlled bits in the PTE unmodified.
>> + *
>> + * @vma: The virtual memory area the pages are mapped into.
>> + * @addr: Address the first page is mapped at.
>> + * @ptep: Page table pointer for the first entry.
> You've missed pte and old_pte params here.


My bad.


>
>> + * @nr: Number of entries.
>> + *
>> + * May be overridden by the architecture; otherwise, implemented as a simple
>> + * loop over ptep_modify_prot_commit().
>> + *
>> + * Note that PTE bits in the PTE range besides the PFN can differ.
> How can it? All the applied bits other than the PFN will be exactly the same for
> the range because they all come from pte. I think this line can be dropped.


Copy pasted, then forgot to remove :)


>
>> + *
>> + * Context: The caller holds the page table lock.  The PTEs map consecutive
>> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
> The middle sentance doesn't apply; the PTEs will all initially be none if using
> the default version of modify_prot_start_ptes(). I think that can be dropped.
> But I think you need to explain that this will be the case on exit.


Ah got it. "On exit, the set ptes will map the same folio."


>
>> + */
>> +#ifndef modify_prot_commit_ptes
>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
>> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < nr; ++i) {
>> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		old_pte = pte_next_pfn(old_pte);
>> +		pte = pte_next_pfn(pte);
>> +	}
>> +}
>> +#endif
> I have some general concerns about the correctness of batching these functions.
> The support was originally added by Commit 1ea0704e0da6 ("mm: add a
> ptep_modify_prot transaction abstraction"), and the intent was to make it easier
> to defer the pte updates for XEN on x86.
>
> Your default implementations of the batched versions will match the number of
> ptep_modify_prot_start() calls with the same number of ptep_modify_prot_commit()
> calls, even if modify_prot_commit_ptes() is called incrementally for sub-batches
> of the batch used for modify_prot_start_ptes(). That's a requirement and you've
> met it. But in the batched case, there are 2 differences;
>
>    - You can now have multiple PTEs within a start-commit block at one time. I
> hope none of the specialized implementations care about that (i.e. XEN).
>
>    - when calling ptep_modify_prot_commit(), old_pte may not be exactly what
> ptep_modify_prot_start() returned for that pte. You have collected the A/D bits,
> and according to your docs "PTE bits in the PTE range besides the PFN can
> differ" when calling modify_prot_start_ptes() so R/W and other things could
> differ here.
>
> I'm not sure if these are problems in practice; they probably are not. But have
> you checked the XEN implementation (and any other specialized implementations)
> are definitely compatible with your batched semantics?
>
> Thanks,
> Ryan
>
>> +
>>   #endif /* CONFIG_MMU */
>>   
>>   /*
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 1ee160ed0b14..124612ce3d24 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -188,7 +188,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   						jiffies_to_msecs(jiffies));
>>   			}
>>   
>> -			oldpte = ptep_modify_prot_start(vma, addr, pte);
>> +			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>   			ptent = pte_modify(oldpte, newprot);
>>   
>>   			if (uffd_wp)
>> @@ -214,7 +214,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			    can_change_pte_writable(vma, addr, ptent))
>>   				ptent = pte_mkwrite(ptent, vma);
>>   
>> -			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
>> +			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>   			if (pte_needs_flush(oldpte, ptent))
>>   				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>   			pages++;
