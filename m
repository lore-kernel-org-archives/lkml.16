Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013038.outbound.protection.outlook.com [40.107.162.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7AA2F1FF6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.38
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750914332; cv=fail; b=tqgDmBfq2nv7gg/rpdUADdHcbBaq4E6aTfurE6d+nhUU6sVvmWPqEQBMsIJhKg1jeDSAZdJoDpXuI2pWBRJ4SXY33KN60VumRs5h3cFKzq0qIYXoveWShIkXZg6K62kZewn+laEfhJP667RToeemCuqxKKE8rJglFosNLDh0W6k=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750914332; c=relaxed/simple;
	bh=/Tr2qghMXZAhKNGudjl25r4g/XfQtrxyWd31qPZHPuE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=goXS9aAIHJOhon96qH8xt81JdvuOK0DrFatC4FTUM+TE5PnMeWXDOYU2/MUK4cCLdVv8+4ICaSTcL0CEjlxveUiZWYSx20rzTKPUYkTx16W13oFL6JV0N5ZuvkmzX9WzPYXBfLWYjEKetDEfpIM+V0GPQ4YHEmg/5oLMpympi0w=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ISTdFNPE; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ISTdFNPE; arc=fail smtp.client-ip=40.107.162.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ISTdFNPE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ISTdFNPE"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EV8xZXYXjbT55qJXN8C2YML0zIQIxmR7KFOjReU1FTWHvDS4jhkDPAFJNz+bQwrV/ceWM7Ut6A9IgQ9jZXwNAILx9jD3Mr60ZwsURUryJHeb9OuwNiUau98q5cqUPREyTL8vDp2a3f1XHP0iXHsTnEVx70NNWC3+ftwXo8EtXqaQGc3oF7qXPN4N+59cXE+oLiBOol2oW0pDEDmSI1sI6wShKiZLWrAqEdAfgdWGGzAg62kgF+t7cF6XPIgRf3NwMH7TvOFyRlSrnkhvBAixSHrWJZAyyXPseL4ndSC8F5ne+UQpcEHEsAyTYKXbLVRqmsU8hjLPuvg6tOYbqaRGGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Tr2qghMXZAhKNGudjl25r4g/XfQtrxyWd31qPZHPuE=;
 b=WNuwvQ5hIzDq7JjWu2dPdhLYt5gkoWHwX1FFuPa2MklZElDKVCiUnicsHXaqoBPgA645Zg461XGigbhQCEaDldEQ4vcXyRQ3Nv2QlVd6AViHOYqDxnbZcZ30CxplJzEX5lf3jB/Mwgq6gLUK5HlLA3xq+q7DmnEO6qyInjrJz2so/dS0Za9vPIvuWuJi6L6X71oJzIZ9T5bpY+hFKjvnaJZDm5U2BngBAuT2Q9EbCY1zc08YS8sJUu0jOyxRamUtp+YZuMin58PLRRxbTX0PLqV3b5m9BFsYLiXuEG/Nu+S8mop0Ll7dUp3Y5J3S6ihwELssVzxqTiXqJ2NlCYE8Zg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Tr2qghMXZAhKNGudjl25r4g/XfQtrxyWd31qPZHPuE=;
 b=ISTdFNPESy7YtaOj+g4MmFKQHD9t6B10jw7E0WkikhPABkoAHFjUnjKBp1eX5bTgo6k8lkU0GfBqXTEVWCkhDGwMgpQXVGTDqSqX/ISw5CDJj8TqdEX2X3XJ7jabCCmQ4LsD9S6GjuFI24bhr/4gJC2/d4bLgu3nJN3OLSFpcRk=
Received: from DU6P191CA0052.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::12)
 by DB9PR08MB9441.eurprd08.prod.outlook.com (2603:10a6:10:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Thu, 26 Jun
 2025 05:05:25 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::29) by DU6P191CA0052.outlook.office365.com
 (2603:10a6:10:53e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.19 via Frontend Transport; Thu,
 26 Jun 2025 05:05:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Thu, 26 Jun 2025 05:05:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UP+A8fOoA/YhPncwbf2vzpHZTlDaCgFsHGFqDzphMIiBj+G0MYRK59jas5GZn2dlozxmMoxEbIPSxTPj7Cf7/iwSJFFiQU14zdrcphfnifjYrY2xusx6Hq1894ESmIRz7LSZHyIslVQjHGBNgWmhba0bC+7S0LuirgV5pK04JCCO4cuPjGZTkYOFtEfJZYS7ANY4TDIcXMJzrx9uTChVTg8KjqTExA+tgbTrHc5l0Icm38MOkr9csRg34QDxdLoac5GjfKRSNHpj0qGRkXsRkAwP+X5vT+2NxZz62HYflcbdKxEJcGFdYIM86CiSHFyg3IZvg0mM/vh2zrjiElDFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Tr2qghMXZAhKNGudjl25r4g/XfQtrxyWd31qPZHPuE=;
 b=dhPdkdMQlfpitFgHzyIDafbJRFnh/xyzT39em5FqKBCtGRSx4iUDmfJtVv/mc2MpJ8872OgxQPLzlq95qWBzeL5xj90z4s3zjg6xw2I6LdQ1OsHrwcQ9DhnTLsH3ol0WW5Qb+83s+wjThTL8mIA6Vq9v1hiWL7yYcrJcvRgYT2AKoFfNfmEVSYe0rU6A3HAMfdarmnvXMV2jDwqehLL9S8f87pUxg34vsf/UreftAQCstA1Rb9FxEU0DuvlaU8QeHLM+9HLXPoU8D3jiOiw944Pv/CNnrC1ZYX8jULl3V7mBaCK78XWTCJFwVXUczJkDxUZ/5ClYJ9kS0BfDBkIOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Tr2qghMXZAhKNGudjl25r4g/XfQtrxyWd31qPZHPuE=;
 b=ISTdFNPESy7YtaOj+g4MmFKQHD9t6B10jw7E0WkikhPABkoAHFjUnjKBp1eX5bTgo6k8lkU0GfBqXTEVWCkhDGwMgpQXVGTDqSqX/ISw5CDJj8TqdEX2X3XJ7jabCCmQ4LsD9S6GjuFI24bhr/4gJC2/d4bLgu3nJN3OLSFpcRk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV1PR08MB10930.eurprd08.prod.outlook.com (2603:10a6:150:1ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 05:04:51 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 05:04:51 +0000
Message-ID: <b5bf26a4-e276-4b26-bf1a-d5af53529e2f@arm.com>
Date: Thu, 26 Jun 2025 10:34:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] khugepaged: Reduce race probability between
 migration and khugepaged
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-4-dev.jain@arm.com>
 <e94c3460-144d-4243-98a3-fbced10feefe@lucifer.local>
 <6989406d-dfdf-4be5-b467-bb3b0d32d384@arm.com>
 <1ce8408d-32b0-469d-a560-2e0050cb91d2@lucifer.local>
 <561b17cd-ad82-45ca-aba2-78515873ebb8@arm.com>
 <f3b2ae95-cc0e-42a5-858e-a614578553a6@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f3b2ae95-cc0e-42a5-858e-a614578553a6@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV1PR08MB10930:EE_|DB5PEPF00014B88:EE_|DB9PR08MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: 39cf6d1d-2ce8-490c-3907-08ddb46f0f24
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UTU0K1IwenZnd3ZQUVkra2RVZFptdk8ybFRsYnRWSDJvQk94eWljOURBTmhP?=
 =?utf-8?B?aTQ2bGN5cVpTYnh3aFNvcXdnelh3bDhscDZaaWp2SGYzNXR0b3B3Rm0vd25Z?=
 =?utf-8?B?Z21SaVErQ2lkTlM2YlM4LzBlTk53Q01sZSt5VzVBKzJqTHhHNW8yeWVHcUw4?=
 =?utf-8?B?VFZLb09KRkc5ajdnUVpSWWgyUGJBM0NDWWZ6WHlreDFrWFUxNnl0K0w2YlIw?=
 =?utf-8?B?WEFoN0VuL3pTNERJMXBwTnRiTk4wMU1reFJaNy9RODlsbWlBblo2RXdnQ0Jm?=
 =?utf-8?B?SjdZUHdjWXAvNHlWRkRSMDA3SWo3NG8vcU9nbDNPU0s0czUzTXlSNTc4Rkdo?=
 =?utf-8?B?Tktqc0xSTEEwY3NyKzN6c1RqLzcxT2xMMFVSMXNMNkNVQ1lXZTZ2T0NRVTNU?=
 =?utf-8?B?ZEFxNDZiMUdCb3JBVnRPc3l1T0hSN29PZTlsNjkwT0NVenhwaVgxeFJvMnNS?=
 =?utf-8?B?Z3RGTnJiK1VHb0V2ckpJNWdmNGU3a0QzREZ2Y0NBdzJpVU1GNmxWSjRiUTBw?=
 =?utf-8?B?TERta1RRUUNrd0J2a3Z2VmsvQ0U2R3V5ZXpmc2EzcDg0Znk3M0hDL296ODYw?=
 =?utf-8?B?R3VWQW9vNEs1TmdDUFNabm5lT2xSbldSdlBjRWQ2MVd6WHBSMVJLelorSXFq?=
 =?utf-8?B?M3BFR2prVTVQZ2JBa2VwdlZDQUJsTGFFQzdMVTUyS0diSlZTTUY0c0NFUEFX?=
 =?utf-8?B?OXRnS1ZkUk9YWVBZVFRBSjBzVFZXbExZY1pJMTdSVnJUVnpBTjJ2MUpQY3Vr?=
 =?utf-8?B?WWZkSmVmSTZOelg2SmNtcklqV0pOSUhURUdseXlOZlkrM2Ztb0RFY1lFS0gy?=
 =?utf-8?B?UDJCa3ZPRmdFeWlGbmdkRUV0bC9WT2VmZTFPOHh3K09BMnVFNElERmllZjFm?=
 =?utf-8?B?NHJEQVpPaTc1SlV4MG1OV1RORWtFTitBVDluYzhEWjN2RnYrVkVzOW9pZ0t0?=
 =?utf-8?B?VnlyeEtZVzY3aW5OeUNhUFhCcThZVlRvVEtGODBrL25yNkRmR083L0hyUnZ3?=
 =?utf-8?B?S3F6aCtIUUxidlYrNGtWZnEwR3VuQ0FXRUxZV1EyRTkzMDhaVnVlNGFPT3hx?=
 =?utf-8?B?cmk0dzFZYkQ3ZXVKdFhHcnVRTFFBcVRKbm9EMzNYQjIvZFF1bUR1TG5DU0JH?=
 =?utf-8?B?NmhPQmw1UEwzRno0TFZCdjRhS0Y5dXZhTDIyRXNzdFVLUmRZWUQ1a0Fwenlh?=
 =?utf-8?B?KzlETm95SStvaCtCZ2hSTjJDZ1BOVHJ6L0FtWnBlQ1h3QkJoSHhuakpoZjRw?=
 =?utf-8?B?UnBHSHhwd3dONnh6UGRsNmljSmxNSFZ0NFFkdm80MGVReUJKbkVzT1R5RGpG?=
 =?utf-8?B?M3RsV2MyZ3V0cldkWUU0K0FXaWZOQWZOL0pIY2puQmtZV1VrYkRtRFVvTXRy?=
 =?utf-8?B?S1JjaWVaaEtwM0dEZ3NSUUlwYmNCbzJFT0s4Q3BDKzhNQ2tLaXhjaGpYSzFk?=
 =?utf-8?B?cDFyMU9SUG9tTFlKNW1MSTdKOEZQeHQ4R3c2U3I4Znloc2NsTnUrTTlKOEJQ?=
 =?utf-8?B?SzlYUkVWTkJQTUYzZFo1QzF1dk1FVTExN0FJQThPTnZudkJDM0dKTUNqalEv?=
 =?utf-8?B?bmVRT3hlMVZkQW9sbEVxZXBGTDlsM0RvdHltNjc1TTlNUmwwMUJHb3NwSC8w?=
 =?utf-8?B?UTBJd2ROZXlpTUUxOTdudXBxbXdWTCtHVHE4ckloa0wzcmI5YTZ1ekFEWThm?=
 =?utf-8?B?NTdyQ0xWekd0M2ZCZmNueWdXUGZsRXU0UVUwTWIvVmZlclpuc0xlY2RlVDQz?=
 =?utf-8?B?SzFUVklFRWR6cG5NdVpZaFdidzB6UVBON08vT2NYb21oWnZGcFpZTVl3b2Yr?=
 =?utf-8?B?YWpneCs2UHdSSTA5VVVDTWpCL2JnY0ZWNndtQmVWMURJNXMrWmFzTVEzSnlL?=
 =?utf-8?B?S1A3NXIwajE1NE84UUlua01PUFpWZjFWY1BLK2lHNC9PTldPdUErRlZuSjVv?=
 =?utf-8?Q?jc8Nf3LiY8c=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10930
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc695a53-2cc1-43f0-b4b5-08ddb46efb0f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|1800799024|376014|82310400026|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czZoaU9PdnNjUGlCekpWODRDNS9aUlVBbFJHTkdWRk9jM3BYbXdvaGRyK0hX?=
 =?utf-8?B?c3dzQVd6aVlDcjZBUzYzbFFmQjlQVFVjVjZ1MjhVelFFaVJkWDN3L0hZTkZD?=
 =?utf-8?B?MmtQdHhjN0I4Zy9zYkp0dGhwZnRZQzROaVJRWFMrRXA5aVliRlRkRlJWdzVV?=
 =?utf-8?B?RTdSVHFod1FDSXdlRWJQVW5UZ29qTTQyNjBOdEIvTzhEWXE0VndBTE1RcHRG?=
 =?utf-8?B?aDl2R0c3SnNSVnNiSzkvQ25wMXJDRzByeXRLRnRrUVo2Yy8rajBCaWFwUUtN?=
 =?utf-8?B?Sjk4MWk2WUQvNWVLdEVpSEcrVCszZDZMd0FIbnFiZzF0WDBCc0c3aGxsNzE3?=
 =?utf-8?B?ZVJuZU5YbUlqenVyWjNqYVlJTVV1eHBKMW0yaUpUMG9nK2tyYjFwMkhsbXVO?=
 =?utf-8?B?VGNtTnRSMmxFbnJNdFc2VGkzYityc2NMWERpRHlMVkllOG9vL1BXeXoyMlIr?=
 =?utf-8?B?dTZtcDg1K2ZZQ2o3M2REc1FVSFRZZHE3a0NNbVZva1IySzRydmhJUHlKOTJM?=
 =?utf-8?B?ZWlkSXVtTlR0WFZLVmh4ck5RVGZ2ZjZReldYNWFkM0s5UGF5SjNaUkF0bllp?=
 =?utf-8?B?V1lJZUkxYWJyOE9MU2pFU3JvVyt2NlgzYmZ2MFptYUFobFloUHk3YTQyOWhK?=
 =?utf-8?B?SEd4aDl1NDdVcUNsZHV0N1RLTzJmQ3pHcVVWOUF2T3BqMG0rR1huZ1p1bFpM?=
 =?utf-8?B?ZWs1L2NUWDRrY1dBbFp3YU03WTdJTTlzaVMxNlJXUEpyQnZUZzl6TEVkWFM0?=
 =?utf-8?B?SzFZQWVwNHRFOENuQlN5N2tIOGRHN29YQm9aL0Y5RkJyTS85cWVxbEIrK1p5?=
 =?utf-8?B?L3RnSGVaOWFicUFhbWVvTDlsM2RsK20yVFZGdnB6c241aHIrWXhaTk1YaG9G?=
 =?utf-8?B?dWI2ZlE5WTR2b090ZWJOaUtPU2Jwb0NkNlNaS0w4RG52eU5YR1E2Wkgxbjkr?=
 =?utf-8?B?Lyt5azBMZ3JWRjFXb3NFLzJlZmFpK0s1aDdrSFYvSDJ6MWl6N1hXbFpxZjNY?=
 =?utf-8?B?UFZkMXJkcHg0VExaVFYxMnNZaXV2c21DTS9Ybk5Hc3BwdVd1ZVlYd242Z2pj?=
 =?utf-8?B?bmNBaU9lMjRrYjN2RjJPQlRVemdvdlNOazZXVVl1WUFDSG8xVUJlVWVDNVVv?=
 =?utf-8?B?dVhTMGI2UWRGb0tsU3hwVmhadXgzSkhmNzFIVnJuYVVDWG83aGdVbGlYVW8y?=
 =?utf-8?B?cWs0bG5JK2YrOFo4bHRGVmhIRmpUMmM2WkNyMndiZnlYNzJtS2I5bGhFY3M4?=
 =?utf-8?B?SnlpbEoxeFhmekhKUUFwSWdseTZYeEVXWHlIWFA2WVlsaGxjZlpRU2hVSkRB?=
 =?utf-8?B?MjN2SzlGZ1VnbmQ3RG5sR1RGbU05UDBMMXVWTk11YldHTFpTOEs4aHBtWFN3?=
 =?utf-8?B?U3lNMjlYRFBtcldhUVU5ZVdMcVFySlVqdlgwSXkwNHAxYnNsZUEwSG9JN1Ev?=
 =?utf-8?B?aWpIeFRCQ1JEek1LaHg4ZmtJd29nNnV6YlBVeDRML1dmSjB2bXk1RHF1WEFm?=
 =?utf-8?B?aUlvOWpjL1FlbGJuTjdRQWNpN2ZmVE9henBjTlpQL3A3eWk0RXkvcGZGcklw?=
 =?utf-8?B?RmE4eGRSWnRzSkdQM0crOVNXckNoRW1wU3BuTDJldmEwcUFOZUM2OEdRV2x6?=
 =?utf-8?B?RGlmalE1dTJvYXBkRThhOVRmS2tCUFZ1MnRiOFkvdGk4WUl4bzZhWFdaTEhl?=
 =?utf-8?B?NkU1VVJOaElkZVNudDFpSWg4WnNKeVYzMk83RDIwL0poblhPN2hoTXFpRlJZ?=
 =?utf-8?B?R3lBc1JOZ1RyTUc3V3ZJeXpCeXhSVzVoQWFHMVVlalRtaDRMTEJ2SlVDd2NO?=
 =?utf-8?B?UUkxLzE4Mk5KR3RVWXlTNlJ3c3JTVHVxNDErN3dhV1Z3YWQ1aTNGMUdQSGUv?=
 =?utf-8?B?UWF3ZFo5RS9ZTFpXbloxSWx1aG5xTXA5ZElsdEdvNXB4UFZYWS9GN2cwaHc2?=
 =?utf-8?B?QldmT0Zkc0ZVQW02QzZGbnVUdU9HUG5WTk4ySzNNY3FQbUozQitLSWloTVVT?=
 =?utf-8?B?djYxUHBnN0ltUUd0WitTRFNsa0pFZy9JbGlyZ1NqRkQ0KzViSnN4bjQrRTd0?=
 =?utf-8?Q?wRriLW?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 05:05:24.3902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cf6d1d-2ce8-490c-3907-08ddb46f0f24
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9441


On 26/06/25 10:32 am, Lorenzo Stoakes wrote:
> On Thu, Jun 26, 2025 at 10:29:22AM +0530, Dev Jain wrote:
>> On 26/06/25 10:27 am, Lorenzo Stoakes wrote:
>>> On Thu, Jun 26, 2025 at 09:22:28AM +0530, Dev Jain wrote:
>>>> On 25/06/25 6:58 pm, Lorenzo Stoakes wrote:
>>>>> On Wed, Jun 25, 2025 at 11:28:06AM +0530, Dev Jain wrote:
>>>>>> Suppose a folio is under migration, and khugepaged is also trying to
>>>>>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
>>>>>> page cache via filemap_lock_folio(), thus taking a reference on the folio
>>>>>> and sleeping on the folio lock, since the lock is held by the migration
>>>>>> path. Migration will then fail in
>>>>>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>>>>>> such a race happening (leading to migration failure) by bailing out
>>>>>> if we detect a PMD is marked with a migration entry.
>>>>>>
>>>>>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>>>>> Hm is this related to the series at all? Seems somewhat unrelated?
>>>> Not related.
>>>>
>>>>> Is there a Fixes, Closes, etc.? Do we need something in stable?
>>>> We don't need anything. This is an "expected race" in the sense that
>>>> both migration and khugepaged collapse are best effort algorithms.
>>>> I am just seeing a test failure on my system because my system hits
>>>> the race more often. So this patch reduces the window for the race.
>>> Does it rely on previous patches? If not probably best to send this one
>>> separately :)
>> To prevent rebasing headaches for others (if any) I thought to send all together.
>> I'll send it separately if still that is the preference.
>>
>>
> Oh actually would it be a pain to rebase given the previous 2 patches? Maybe

Didn't take the time to actually check that, more of a "it *may* be a pain
so let's send this together".

> leave it then. And I can actually finally review it... :)
