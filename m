Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D93801
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614562; cv=fail; b=JXmaM7iOYIim4wH6UW4uhDegKyVmb2qgZIQPa9TOYH950vhYdAJyQ8pQbgX1FCcKByw2zFycpZy0efzZj0Ws/n7upiHXLVqrOXbGv+P3a7+Z5BdMtkOZZ1/eHnS2Ce75UGhqVBpxpqvPd8gY100bswPsCTItIhPio95fNYqHmEs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614562; c=relaxed/simple;
	bh=qYLhqXENcRXweJRval3GkLmE6CNW2TMm2SY8XtQ/H0s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UnB2z1klprW5gkhAXxSXy6oQUy+HMULoVtNC+g5mCY8vpW69m3uNhJtBVpPBxkKC88BOKkDVrMlR/hlC97cCjmXIC5UDo/1Dd2GvcPJn048HoSTczkVDLhjvlAy8SS1xYs4UmVJGbTowx9ZEPuAGALxm5LrjEtqwk2H0t1ScqQE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q+k/MU1m; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q+k/MU1m; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q+k/MU1m";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q+k/MU1m"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UO9RKS1USgMmyXga/533qUHjV7Hja8cknLUVUN9W65cafDGolFftbhe/DwWA3xf+AzlKz+3tpreTGm0q6wQgkyHXgZSLd78nd9zsOvRJp1ZhJjJJHSQGH03wvgdcI7Uv9OZCAiuX444jelLhVQH4+nOaRAih8Sueg90skVLUyQIm5vpLatA6ojPX4dEF4OHGV6+rYLrjmw41tYc04wYt6erJ6xiqcVr9upiAJ+1pIIQ4FFuSX112JAurqJsb6oXYsFNTk+jpkagNdGAzg52gxhNteNxSwKSuEn/l3jTykUFV5CNY40/C8zc0Jr4In/3VSyhMX5Xj9RpWYGB14p8sFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkIOsq162bslET/fYnxBokXxyhRIJguHGTbm+qFTdTw=;
 b=MHSEYW8iC2yhEjM4nV3c172noHEhds/JT6UbvGR+vL82qyj1N08ZO1CBLJxklUaoSWkuOa9UoKqRX637S7RFj9SGleVJMIGoiGzZ3Fv3K9JDJJl9Gbpaza7uB+q35/koka3qaRI6BGnwY2pSG0cuURqJdhwn72E2hreNO14YtRn43amMYWd7Q8FoiWvOKEAkpilroo47m6y6gZHv4uStva9Xka9QHzTKDGbd30ZCLCyhfwsIBjOs3mQMDidwLZ/IF6f7k1qQk7TqPnYF2LaIwGTDaUzOflYDKPfJ6qbk1gVt0O0a5FI9G0Dr8fIHEXwO6eoLvwgwcBO0Tm6Sz6/qxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkIOsq162bslET/fYnxBokXxyhRIJguHGTbm+qFTdTw=;
 b=q+k/MU1mp/It0lvsNq788cqdtNx8CnPGfuQ8Y+NA8tzi3z5s4UCXX/h742Og5/swR4SG05oaPwJPnMjGu5XhpEzKcWWjKPTv/zrkK6m6NOBRlBDHGtpd2oA5agFwjeHyhtN05C/k7S/7MMcdRIkCfxB7YwJrrf5MllEY67S1XbM=
Received: from DB8PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:10:110::39)
 by GVXPR08MB11094.eurprd08.prod.outlook.com (2603:10a6:150:1fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Wed, 11 Jun
 2025 04:02:32 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::47) by DB8PR04CA0029.outlook.office365.com
 (2603:10a6:10:110::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.28 via Frontend Transport; Wed,
 11 Jun 2025 04:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15 via
 Frontend Transport; Wed, 11 Jun 2025 04:02:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWicTQMBXVfZSxvViudL3hi+Mqd1WpoaOSqavplsd7txrR7FaINh/BU857nV1BMb+FcKnhoY5L5h9lfFbZgD6BEiaK25cfV/22FeF8JRqk7PB7T5lNwGfAKj/mYs9NMm0rUw6bfaqo5t6Ugs7+2XNF8uaU2CQzaIh6Yl5j3Ke08Jq1wsUeQsc2PiDirEnlFAZqltAih4mPVNhS/s22v4128uE+s2qxdXnYwC0CH4a6l22hENLRA/bpUY9DbBw4sBLeyoPwthKKVJTmJMyf7zdoNVHyM5iEfL1FEj1cYwDXpaQg25LOglYRIcMbcLz1w1ZTTYbCFa635wMWyH2my5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkIOsq162bslET/fYnxBokXxyhRIJguHGTbm+qFTdTw=;
 b=uxs6X+jinvQTsCSIeUJcuDR7hn65MBNjMYBAh0rD0lNpD1aS1EI6+PFoSsTYuwnhZCnY+EABAE2fOryd7HFKbgzHpXU5/FtdwFAN2SX5QRwxnBRqmfru87/q5rZs2wwkn9PHCWOxaVCRa7xW9fCSFCmpEM7VXJk5OTsntT92wVesv+y2cY/DMtFTQheJv7RI5H34wFObmFc4Xqz+VQjeEGjkhxx4LUh9tEt4nt2g9ffB8LCT2Q7ySW0gLFe6djCgqrK6+ODKC1gZUaU8l9vvHGz15kz+GeWFFDpPyOdoNQOWXMRZaI5VhnKtm8xMn/iOPikzDGkKI10VplCcTGg0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkIOsq162bslET/fYnxBokXxyhRIJguHGTbm+qFTdTw=;
 b=q+k/MU1mp/It0lvsNq788cqdtNx8CnPGfuQ8Y+NA8tzi3z5s4UCXX/h742Og5/swR4SG05oaPwJPnMjGu5XhpEzKcWWjKPTv/zrkK6m6NOBRlBDHGtpd2oA5agFwjeHyhtN05C/k7S/7MMcdRIkCfxB7YwJrrf5MllEY67S1XbM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PA4PR08MB5902.eurprd08.prod.outlook.com (2603:10a6:102:e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 04:01:58 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 04:01:58 +0000
Message-ID: <f5457df8-c4d8-45ef-a7b3-80cc591afa70@arm.com>
Date: Wed, 11 Jun 2025 09:31:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: pageattr: Use walk_page_range_novma() to
 change memory permissions
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 david@redhat.com, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-3-dev.jain@arm.com>
 <dc2ead47-3f8c-498b-bc64-1abe3d3ba56b@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <dc2ead47-3f8c-498b-bc64-1abe3d3ba56b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::28) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PA4PR08MB5902:EE_|DU6PEPF00009524:EE_|GVXPR08MB11094:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b05f71-ca47-4b6d-0d43-08dda89cc970
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZjFTOHp6RlQxa1U1d3h6V080RmZxTzdsMDB6K3Y0bmVqUkNINm1SRG9CUTk0?=
 =?utf-8?B?dmZ3bTRuclpOMGNMWTFHSjh3VW1MYTAwU0w0QjhPSlVGcmRtNHJiQ0JaaGNH?=
 =?utf-8?B?QmhUeEJTdURsejYxdDBvdmd2T0hWQkFZaDZudDlWaXVzSnB1L1gyUmpGanI0?=
 =?utf-8?B?eUlyZXBkWDU0OUdWZlVuc0xZQWw4TE5rdVVxK0hMWFlleGlVQnZuYytDeWhC?=
 =?utf-8?B?WWRQamlXMk1JNmJZZURoUDAvd0h1Tll6RnUvZmlGalNuMnNQZjhqVnBsb3Zy?=
 =?utf-8?B?RVg2MWxrSFZFcklwV0lCZldtZGxSV0syOFRocjVTTUxRbHptcHZETEdSUTJR?=
 =?utf-8?B?eE5qU3lhcWptR1J3emJKQXMwSUFvd2F5c09lSjF5Y0QrYnVBQXhDc3Nxdm1W?=
 =?utf-8?B?Z2FweTlkTDlNQ3JTQjN2L2FQWVJCcWY3c0pickRsdDB3dk1aTk1YanVrQ2tI?=
 =?utf-8?B?UHF2Ry9Vc0dhcDcweitWUDJtQnJ1K1Y4WHRsR0pEblFtRGhYK1huMDlnbGRq?=
 =?utf-8?B?Tm1hQmtoa0JPYm1JTVJLYmNsQkVOYUpKWURpSmcrcjU4MXNvaHVtWVcyK2VS?=
 =?utf-8?B?V0dKbzFnMzhUOGlIY0tiRlZ0Zzc1eE9rUkQyNGZ1V0YyenRLV3owM1ZMd2lG?=
 =?utf-8?B?TGFxdGlVcDJBZlRhNDYxYktrdWpIZlhzNUZqUHBhbTE3STdlYkdVdG5VdXY4?=
 =?utf-8?B?T1JFWWFkNXlPOW5XMW5VNDlQVGN6NHNlSFQxa0hkc1F0QXhsVjUyWUxvZTY3?=
 =?utf-8?B?M0RuOGhjd3dXSTlmL0REODRIUkRxdkYzSVFnOUxQUzQxWVU4d0U1a094RVVv?=
 =?utf-8?B?RHdlU1JlaEhTQVYrZGhTYjVPM0gyWk1CQXVFRW5jWU9MMU5CZHAwZVB2ejZM?=
 =?utf-8?B?ZHNPVlczK1UwZW03SHhxSWpNbytGUGh5cFhja0kzbTNEd3I1Qys4ME4xS3Fs?=
 =?utf-8?B?b2k1MkhPTGkvK3d3bitsd1NKMHVrd1F1Vzk0aDFnNzdGYWhIUmV6TkNxQTRa?=
 =?utf-8?B?dnMvUTlMR3lEcGVrdkdCeHBWZy9jdFVmbDVmN2EwM2Q5NmVkMzNISGFOWXlU?=
 =?utf-8?B?YTRCTmwwSGhJNnNQVnJnbjBJS1hlU1JQNHVXSHdBUStNaTdlam54cEdXT3R2?=
 =?utf-8?B?YXE3VVQ3bTNwYXNuWjNNdlQ1b3hBUUNQZ1pDME0xZndaVmRVeXVWdkllVG9i?=
 =?utf-8?B?ejczdHR3blhSWXBGNnlTc2UxWS8rQXVFNGlyZUgyUnJhVWV1Z1cwaGJoODVz?=
 =?utf-8?B?V2U0K3J6c0NzTmVMa01LUEcwWVJNZlphaFpyUjJFMkp5SzkvWXhnVVdtUUZh?=
 =?utf-8?B?UUpyejRBQWx3VUord0RWa1hQUStmcEo5NTdXR1l1T0tzWjhlS1BYdE5NcEFS?=
 =?utf-8?B?VmVSaUk4SjVLSzRRMkxYWjMyaWxEWmJRZ0h6cExrcFFOaGdUU1NXSXNRM05E?=
 =?utf-8?B?YmtCVnlUc0t6S05VcDhZQnJDanFnTnZESVpsRkxFa2pxVGZpZWowVHhBZXRC?=
 =?utf-8?B?R3pWM2hGNXRQeU9MVmNSVzdWMWwxdkZxdXk2ZzNMUnM4czVlZ1VUNUFSU3li?=
 =?utf-8?B?Rk9KcjZpcXlCVDNnbU9HYlVEb045UGNDV0pUYVUrODc1ZkV4SFBOV05UTGI3?=
 =?utf-8?B?d0tOUDNERDNubmVpNkpibVVjRXVna29uOVVJZjdCS2p0OGY0YWxEZ3VubE9q?=
 =?utf-8?B?Yk0vK0Zqa3NWQjlyam5zbmFVU1VENG82QU5vamNER1NvWENjcnVQN0FCMVNU?=
 =?utf-8?B?K0xHTW5hQWk4Z2VlM1J0TWpjRUFnNmh1eUdmZU92OFFrOFVjNEhBSnBHOHpp?=
 =?utf-8?B?Z0l5dTJKTUsyeCtGVXY3Z2VSY09xMVB3eDV1OXdDVjhqUUtRVGpsMnoxY0JK?=
 =?utf-8?B?WVp4K1J0TmpiS1hSb3k3enB1UU4rU0Uvd3Z0d1dRVVgwQmZwSXFNVHF0R0hm?=
 =?utf-8?Q?gpdWbLDhvuY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5902
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae739574-29f6-40ab-c31d-08dda89cb630
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|7416014|35042699022|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUl1STk2SDhTSEQ0dUxSWTFZdnRGK09wNjVSK3EwZ2o5VWhwM1B0OFJ0aTB6?=
 =?utf-8?B?V2JxTkRGckNvZnpkc3Y4QmJCaEt2TkxkL1RRTG1vcXhLa1NROExsTTFBOWZx?=
 =?utf-8?B?Vm9pRU5jNGw2RmZSbHVNa0ZlcE56RG9IcnZBQ2IvbWV5NktNU0V3MFBQbEVG?=
 =?utf-8?B?QktTYlY4b2szRXlMWjVYWDdVNnRoODdybEZMUnhWclRFTm5nQ3M3OVRCZlRq?=
 =?utf-8?B?Y01pNElwN1NXcUJ0RjBxMGlFaVBOS2dZTjNPWTJnMFY1QUhCZm9ITXdJb0l3?=
 =?utf-8?B?YnpDdE5tQ0RTemVWZGZXaGFtbTJmNEhXMzQxcVk0RzJROVlkQ1R3QkM2czJ0?=
 =?utf-8?B?M05VRHJiZXpvSWtON0RaR1NsTEFFZktITjM1YXVOaHlBWi9ZK1VVZjBSREti?=
 =?utf-8?B?VWwxTU1FMHd6STE3eStEOHE1YktEV0NhUVpNRzVqUG53SjJYbisxdGxFK2tu?=
 =?utf-8?B?UThJT1oyZU9YV0tjNVhPbDJUbjNKWTN1bGgxRHZTT3Z4MWNLOEd2d2sybEZv?=
 =?utf-8?B?amtVUTAwdmRUNFN5REI5cHQwVElwTUJraVJNbzdoTmhwMCtyT0RpeksxNXVj?=
 =?utf-8?B?cHV5MGxFMmFjWFBIRlFUYlZkU2FPMll6WU1URFFFT0ZCUko2SW1JN3RLL3JU?=
 =?utf-8?B?R2ViSXFGd2RWZWZYTjB2UUtXeVV3MTVrM2crbGxGUGFud1RxRWY2dFVuNjRR?=
 =?utf-8?B?WmNnV3hIN1lJaGZUL3ZQcnNsN2N3dEdrZ3h5bnorN1g5YjNaR3A1amIrMlcw?=
 =?utf-8?B?THNUc1NQemdwdXAzOXp3c3BiMWpWSXEvaXUxOUNFejd3bXplSnZTbzhPdnpD?=
 =?utf-8?B?MWVJc3lGSkRpRld3R2lMVW0vUVdjN09tZ3lVMEFrU1N2M1h3NVVxRWphWEs0?=
 =?utf-8?B?OVBhUzM4MXNpVWh4UkYreCszc1FTSEZWTWIrQ2hJdmRXQ0QrOU82eXVBb0RZ?=
 =?utf-8?B?SXlzYmduVmxOWFM3UE9nWmZyK2I2cERlMnovY0VDWEJWeEYxRVJ6cU1HN2dD?=
 =?utf-8?B?U3dKWktUL0IzZWh2ZEVpNkRTOGxGWm9ZWFgyNFJVVjV6clRHY3ZOb1AzNHZm?=
 =?utf-8?B?SU1wZWRvekVxaysyemFvVk1mZnQyR05lb0JhVU9Nd1lFY3BLQVdxSk81N0pX?=
 =?utf-8?B?d3pwVklOa2xhcDNPZDVjY2NQQWhmb1JMaXlKZ1hiOEphRXFmWFliL2gvRnFF?=
 =?utf-8?B?L25QL1dpcXJ0K0JxaTFMNTVaZWF1TU5FTXpXWVcvNVU2cStyQjRnRGlPVEcr?=
 =?utf-8?B?NDVTME9BbVI4cm1GOGR4eXlwMUp3UVQ3SmRtcWsveHNZUDE0VG83eXBWM050?=
 =?utf-8?B?SVpoZSt0M1ZzYTc5azFnV0NuSDVVb2EvUmZicVQ0VDlsMXViTHZUeG5YVHhN?=
 =?utf-8?B?WWdrSzl3MDdaY2tTWitocWpXZk9hUHhuNUN5ME5vL3ZsQ0FOY0padkwwcGVY?=
 =?utf-8?B?UFE0UDhSY2lwNE5xbnlCWEVYckhxWTlTZWU0bkltQ3J3Y0Z0L1VzR1VmZ0Jh?=
 =?utf-8?B?ckt4YnpQaW9ia0ZwNi90MmExZXBXclllZHZscVZLeWhyN3R3UHJqdHlUZEZw?=
 =?utf-8?B?VlRKalFGaXQrMkZOZDlLNk9nbVh1L0pKdXNTUCsyRDFZNHM5UTRDRWoyOElr?=
 =?utf-8?B?a2s2Q01SQ2xEbHR0cHVUR2k5MGl2OVJKZVdEeWswYzVDQ0ZNc1dXZjRTU0xQ?=
 =?utf-8?B?SWhKN2M4TC82VVN4azV3TXg5Q2p3Tit6b2s5UEREbUtZeHJoVmFNWk1SM3JT?=
 =?utf-8?B?Nk40cDhtQjVTeC9mZ25kNVEvTVhUUHBwR082cmtQR0pkMHkyd3piYVJDUmNJ?=
 =?utf-8?B?VzlHQ3poU0lXT1ArUG1PRmE1Qy9UbUdSa0dPRkt0cEUxZ2JVNlg1UmUrSjNK?=
 =?utf-8?B?YVRsbS85aWx6SXcxaG9vRHByZ09BTTFSTjhLekVzaEsrU05Vd1V6ZWJudmw3?=
 =?utf-8?B?Y1dxMW9ySGJmRVVHTzFJc0lGYldSUXdNbm5LZnFLV2xEU1lMNFlwOU9iUVk0?=
 =?utf-8?B?bjU0TUkyMU5wcTlhVEZ6SXhiQzk0czlLeVpYYXZ5RDVWQlA5VVI1eU9qY1ly?=
 =?utf-8?Q?sEDPdM?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(7416014)(35042699022)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 04:02:30.3325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b05f71-ca47-4b6d-0d43-08dda89cc970
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11094


On 10/06/25 8:11 pm, Ryan Roberts wrote:
> On 10/06/2025 12:44, Dev Jain wrote:
>> Since apply_to_page_range does not support operations on block mappings,
>> use the generic pagewalk API to enable changing permissions for kernel
>> block mappings. This paves the path for enabling huge mappings by default
>> on kernel space mappings, thus leading to more efficient TLB usage.
>>
>> We only require that the start and end of a given range lie on leaf mapping
>> boundaries. Return EINVAL in case a partial block mapping is detected; add
> nit: return -EINVAL

My intention here was to say "Return invalid argument error" so I omitted the
sign, but anyways I'll do that.

>
>> a corresponding comment in ___change_memory_common() to warn that
>> eliminating such a condition is the responsibility of the caller.
>>
>> apply_to_page_range ultimately uses the lazy MMU hooks at the pte level
>> function (apply_to_pte_range) - we want to use this functionality after
>> this patch too. Ryan says:
>> "The only reason we traditionally confine the lazy mmu mode to a single
>> page table is because we want to enclose it within the PTL. But that
>> requirement doesn't stand for kernel mappings. As long as the walker can
>> guarantee that it doesn't allocate any memory (because with certain debug
>> settings that can cause lazy mmu nesting) or try to sleep then I think we
>> can just bracket the entire call."
> It would be better to state the facts here rather than repeat what I previously
> wrote on another thread :)
>
> How about something like:
>
> """
> apply_to_page_range() performs all pte level callbacks while in lazy mmu mode.
> Since arm64 can optimize performance by batching barriers when modifying kernel
> pgtables in lazy mmu mode, we would like to continue to benefit from this
> optimisation. Unfortunately walk_kernel_page_table_range() does not use lazy mmu
> mode. However, since the pagewalk framework is not allocating any memory, we can
> safely bracket the whole operation inside lazy mmu mode ourselves.
> """

I didn't properly understand what you were saying so I copied it verbatim : )

How does not allocating memory imply that we can bracket the whole call with
lazy mmu? As I understand, the logic should be that, we can bracket a call if
we can ensure that in that call, the entries which are being updated, the corresponding
VAs will never be accessed before exiting lazy MMU. Therefore we can delay the
barriers till that time.

>> Therefore, wrap the call to walk_kernel_page_table_range() with the
>> lazy MMU helpers.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/mm/pageattr.c | 158 +++++++++++++++++++++++++++++++--------
>>   1 file changed, 126 insertions(+), 32 deletions(-)
>>
>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> index 04d4a8f676db..2c118c0922ef 100644
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/mem_encrypt.h>
>>   #include <linux/sched.h>
>>   #include <linux/vmalloc.h>
>> +#include <linux/pagewalk.h>
>>   
>>   #include <asm/cacheflush.h>
>>   #include <asm/pgtable-prot.h>
>> @@ -20,6 +21,100 @@ struct page_change_data {
>>   	pgprot_t clear_mask;
>>   };
>>   
>> +static pteval_t set_pageattr_masks(ptdesc_t val, struct mm_walk *walk)
> val is ptdesc_t on entry and pteval_t on return. Let's use ptdesc_t throughout
> since it's intended to represent a "pgtable descriptor at any level".

Sure.

>
>> +{
>> +	struct page_change_data *masks = walk->private;
>> +
>> +	val &= ~(pgprot_val(masks->clear_mask));
>> +	val |= (pgprot_val(masks->set_mask));
>> +
>> +	return val;
>> +}
>> +
>> +static int pageattr_pgd_entry(pgd_t *pgd, unsigned long addr,
>> +			      unsigned long next, struct mm_walk *walk)
>> +{
>> +	pgd_t val = pgdp_get(pgd);
>> +
>> +	if (pgd_leaf(val)) {
>> +		if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
>> +			return -EINVAL;
>> +		val = __pgd(set_pageattr_masks(pgd_val(val), walk));
>> +		set_pgd(pgd, val);
>> +		walk->action = ACTION_CONTINUE;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
>> +			      unsigned long next, struct mm_walk *walk)
>> +{
>> +	p4d_t val = p4dp_get(p4d);
>> +
>> +	if (p4d_leaf(val)) {
>> +		if (WARN_ON_ONCE((next - addr) != P4D_SIZE))
>> +			return -EINVAL;
>> +		val = __p4d(set_pageattr_masks(p4d_val(val), walk));
>> +		set_p4d(p4d, val);
>> +		walk->action = ACTION_CONTINUE;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
>> +			      unsigned long next, struct mm_walk *walk)
>> +{
>> +	pud_t val = pudp_get(pud);
>> +
>> +	if (pud_leaf(val)) {
>> +		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
>> +			return -EINVAL;
>> +		val = __pud(set_pageattr_masks(pud_val(val), walk));
>> +		set_pud(pud, val);
>> +		walk->action = ACTION_CONTINUE;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
>> +			      unsigned long next, struct mm_walk *walk)
>> +{
>> +	pmd_t val = pmdp_get(pmd);
>> +
>> +	if (pmd_leaf(val)) {
>> +		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
>> +			return -EINVAL;
>> +		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
>> +		set_pmd(pmd, val);
>> +		walk->action = ACTION_CONTINUE;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
>> +			      unsigned long next, struct mm_walk *walk)
>> +{
>> +	pte_t val = __ptep_get(pte);
>> +
>> +	val = __pte(set_pageattr_masks(pte_val(val), walk));
>> +	__set_pte(pte, val);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct mm_walk_ops pageattr_ops = {
>> +	.pgd_entry	= pageattr_pgd_entry,
>> +	.p4d_entry	= pageattr_p4d_entry,
> I may have been wrong when I told you that we would need to support pgd and p4d
> for certain configs. Looking again at the code, I'm not sure.
>
> Let's say we have 64K page size with 42 bit VA. That gives 2 levels of lookup.
> We would normally think of that as a PGD table and a PTE table. But I think for
> the purposes of this, pte_entry and pmd_entry will be called? I'm not really
> sure - I don't have a great grasp on how pgtable folding works.

As far as I remember it should be pmd and pte.

>
> Trouble is, if pte_entry and pgd_entry get called (as I originally thought),
> pgd_leaf() is always false on arm64, which would clearly be a bug...
>
> I'm hoping someone else can pipe up to clarify. Or perhaps you can build the
> config and do a test?
>
> If it turns out that the "lower" callbacks will always be called, we should
> probably remove pgd_entry and p4d_entry in the name of performance.

I shall confirm this, thanks.

>
>> +	.pud_entry	= pageattr_pud_entry,
>> +	.pmd_entry	= pageattr_pmd_entry,
>> +	.pte_entry	= pageattr_pte_entry,
>> +	.walk_lock	= PGWALK_NOLOCK,
>> +};
>> +
>>   bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED);
>>   
>>   bool can_set_direct_map(void)
>> @@ -37,22 +132,7 @@ bool can_set_direct_map(void)
>>   		arm64_kfence_can_set_direct_map() || is_realm_world();
>>   }
>>   
>> -static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
>> -{
>> -	struct page_change_data *cdata = data;
>> -	pte_t pte = __ptep_get(ptep);
>> -
>> -	pte = clear_pte_bit(pte, cdata->clear_mask);
>> -	pte = set_pte_bit(pte, cdata->set_mask);
>> -
>> -	__set_pte(ptep, pte);
>> -	return 0;
>> -}
>> -
>> -/*
>> - * This function assumes that the range is mapped with PAGE_SIZE pages.
>> - */
>> -static int __change_memory_common(unsigned long start, unsigned long size,
>> +static int ___change_memory_common(unsigned long start, unsigned long size,
>>   				pgprot_t set_mask, pgprot_t clear_mask)
>>   {
>>   	struct page_change_data data;
>> @@ -61,9 +141,28 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>>   	data.set_mask = set_mask;
>>   	data.clear_mask = clear_mask;
>>   
>> -	ret = apply_to_page_range(&init_mm, start, size, change_page_range,
>> -					&data);
>> +	arch_enter_lazy_mmu_mode();
>> +
>> +	/*
>> +	 * The caller must ensure that the range we are operating on does not
>> +	 * partially overlap a block mapping. Any such case should either not
>> +	 * exist, or must be eliminated by splitting the mapping - which for
>> +	 * kernel mappings can be done only on BBML2 systems.
>> +	 *
>> +	 */
>> +	ret = walk_kernel_page_table_range(start, start + size, &pageattr_ops,
>> +					   NULL, &data);
>> +	arch_leave_lazy_mmu_mode();
>> +
>> +	return ret;
>> +}
>>   
>> +static int __change_memory_common(unsigned long start, unsigned long size,
>> +				  pgprot_t set_mask, pgprot_t clear_mask)
>> +{
>> +	int ret;
>> +
>> +	ret = ___change_memory_common(start, size, set_mask, clear_mask);
>>   	/*
>>   	 * If the memory is being made valid without changing any other bits
>>   	 * then a TLBI isn't required as a non-valid entry cannot be cached in
>> @@ -71,6 +170,7 @@ static int __change_memory_common(unsigned long start, unsigned long size,
>>   	 */
>>   	if (pgprot_val(set_mask) != PTE_VALID || pgprot_val(clear_mask))
>>   		flush_tlb_kernel_range(start, start + size);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -174,32 +274,26 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
>>   
>>   int set_direct_map_invalid_noflush(struct page *page)
>>   {
>> -	struct page_change_data data = {
>> -		.set_mask = __pgprot(0),
>> -		.clear_mask = __pgprot(PTE_VALID),
>> -	};
>> +	pgprot_t clear_mask = __pgprot(PTE_VALID);
>> +	pgprot_t set_mask = __pgprot(0);
>>   
>>   	if (!can_set_direct_map())
>>   		return 0;
>>   
>> -	return apply_to_page_range(&init_mm,
>> -				   (unsigned long)page_address(page),
>> -				   PAGE_SIZE, change_page_range, &data);
>> +	return ___change_memory_common((unsigned long)page_address(page), PAGE_SIZE,
>> +					set_mask, clear_mask);
>>   }
>>   
>>   int set_direct_map_default_noflush(struct page *page)
>>   {
>> -	struct page_change_data data = {
>> -		.set_mask = __pgprot(PTE_VALID | PTE_WRITE),
>> -		.clear_mask = __pgprot(PTE_RDONLY),
>> -	};
>> +	pgprot_t set_mask = __pgprot(PTE_VALID | PTE_WRITE);
>> +	pgprot_t clear_mask = __pgprot(PTE_RDONLY);
>>   
>>   	if (!can_set_direct_map())
>>   		return 0;
>>   
>> -	return apply_to_page_range(&init_mm,
>> -				   (unsigned long)page_address(page),
>> -				   PAGE_SIZE, change_page_range, &data);
>> +	return ___change_memory_common((unsigned long)page_address(page), PAGE_SIZE,
> nit: you're at 85 chars here. Given you are breaking anyway, why not put
> PAGE_SIZE on the next line? Same for set_direct_map_invalid_noflush().

Makes sense.

>
>> +					set_mask, clear_mask);
>>   }
>>   
>>   static int __set_memory_enc_dec(unsigned long addr,
>
> This is looking good to me overall - nearly there!
>
> Thanks,
> Ryan
>
>
