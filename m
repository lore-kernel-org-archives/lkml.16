Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7633D1D63FC
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000206; cv=fail; b=YDPVs7hyDzSVuBpsS16wol/FWixH3/7xRnhzb0XPPBUjQsuEkoosmKoMLYpR4sJgkJ4sJClBOtwColBmU2BXV8uIOam78cmmApn+OYW5Jb8cWN2zDdpiLNj8Atw07RH99BaC2752wqvQKBrCEWaGpPdp3DTkywsjhh+NwleufhI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000206; c=relaxed/simple;
	bh=5Jd3yv/EINILvQyViNRCZGVudaengC9IY+XIXRG48JM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sbzsRZlzZ69mzex7JaMzb60AazAvrE9Lm/lNOxByV4arG10RpCnsscBDGb0JALITpuzzd95zud9xBOnWznWZ1nlcy9oGBNluMMCx4G705l2fHKFmAp8WfkkSVyMyGIHKQS30oPUut7V2M9fmob8lFSPIOx05xIJQLkxpFIP8NYg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aUcTChDL; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aUcTChDL; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aUcTChDL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aUcTChDL"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bPgrGSx9XnKnPUAmhQ/gkoadXrqzxrA4HkOGzDpNI7n/reOxZVthl4pk3MfdinNt3c5RVjNo5dQykQWMb2ZnlnSirwQmBpF0meKr7U8ZnwzELDQESy814x6tBZtWI4NxAQfuX5G20dBcJrE7PN/w+Kr9hBa3j9fPoEdkIujgizWmBNzv8jq8T2rGG4Ip7x9+xS2uZIqLIHnso9RZBIPN3OTSKpCflXZjJSrzPyh8WAok7yov2TX4ybiB9E/A4CBfHmwTJDe6c8lxXxaPQUmCXbUAscPeTq/irfIV6yclQhylj7g0MXeEk4PBNoKcT2sGnyXzYR34cgNSvZEJgrJYKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++1c2Z4APnKJdbvZ05bA1rcgNLvAUd4hY3wXxO707rc=;
 b=sVZFlQ4OWT7kiRK638UXGcqChs0lJn3b5CfXpYTM+dv04fxI48ettauDns711iyRvY9jGnUWtQEETG7xziPa+8X+9sh5FdRtOIOHGZFYFPHCTeGiAMI+Zi7/bhiS6DqnlD++1btX93VGA5DlfuljEvplOZnkgBwa26rC/0PaGsTbTmcFZ9dDr/C1E0O5cX2CTbtyJCfp92++JHm+I4VG2zVPyv2aSnVLicI0wVe5pWs3Ax6wrWPyReG6ThsiY+zbpoQa+W36JXOBIBex640Iu2ac532S+chZ3bh7OfFGQaVM/pmJNsiNFIXxgm2hsV9yxdRvMgaTrFJcHgqGTsi/ZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++1c2Z4APnKJdbvZ05bA1rcgNLvAUd4hY3wXxO707rc=;
 b=aUcTChDLT2mYxb+mBIS8++7upRWFt3Ou6M3kqdsbu8PkCuvRYkyOYd+hVCQMO4EFDR9MDLjsMMRerUELyrJOKKFswE2tny1SNh3xrws7hohVgyMiusAifH76eVIIGv3xq9kIED5KfxP5p1p3goCRRVZX1Ppp3c+Z/m1CPaDdi5c=
Received: from DB8P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::14)
 by GVXPR08MB7822.eurprd08.prod.outlook.com (2603:10a6:150:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 04:56:34 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::4) by DB8P191CA0004.outlook.office365.com
 (2603:10a6:10:130::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 04:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Fri, 27 Jun 2025 04:56:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgbVDw0R1MCjBzOrO2pWZNLqo86ChwZjJGfLhXe1AicEe3UsWoPAZ7gRn7DRCYXYtWCyj9zLcB1EQuWiiDuqaqsBw8m5xes+rolu9KbOVojQjTXhAgNVHf7Uf3HuZQrbSw3qiCLE5gkbC7KKHHj1aOEAFcXE4jR0dBx3gnOhw0o5X7eEWRzgI45lQaDYEkx/3fwb/tGeKBQPrRZ0PNaXfiRpq0bRuzw5ARZ6IIc1bF4Bhe7im1LEMEcSmMwSwm5hpPCLuzGDGgAAzoS4RHx8ZwbZyp3QisOKJdfpPwjfFqXGjegPXzNxrovFcTo+A+O6VZ2LJFhV2RrNDQhsCEl1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++1c2Z4APnKJdbvZ05bA1rcgNLvAUd4hY3wXxO707rc=;
 b=Gphv8bvQd+ZSo2DYreLPVdTyLY0aaexTUQz17yPh78GnAynVfGlRW0gXSwxhfKpj4ngxOr9K6zpX/6qXQeqnmu8LBD5chkUmgqOxgnHV7OjvbAZ32tZ7rA3m/Z8mR8WulqPwT6HM/O0MHoqPJnkXJUsDDeDK71s4yw/h0E48v72zz/cAzL977zJBjQIQ0sStnP2K0QzOiUXSlwGgr2EySQKoPZaTSIfAzslFUrW2r+3paVeBIum8GpP6JaKOVQdaIjiPeBx2I+xbkQf8/O+ZdMvgZ2WIkHqOLW+mcnITKw+mkoYV4gsF3qEhlWAisFGnmP7miRJbYexndDK5mXx4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++1c2Z4APnKJdbvZ05bA1rcgNLvAUd4hY3wXxO707rc=;
 b=aUcTChDLT2mYxb+mBIS8++7upRWFt3Ou6M3kqdsbu8PkCuvRYkyOYd+hVCQMO4EFDR9MDLjsMMRerUELyrJOKKFswE2tny1SNh3xrws7hohVgyMiusAifH76eVIIGv3xq9kIED5KfxP5p1p3goCRRVZX1Ppp3c+Z/m1CPaDdi5c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB8904.eurprd08.prod.outlook.com (2603:10a6:20b:5f8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Fri, 27 Jun
 2025 04:56:01 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 04:56:00 +0000
Message-ID: <9c42acb3-09f3-46bd-9fde-7e1901fb66d1@arm.com>
Date: Fri, 27 Jun 2025 10:25:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] mm: Optimize mprotect() by PTE batching
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
 <20250519074824.42909-4-dev.jain@arm.com>
 <b3064b82-dcea-4b88-940b-9419d869a39a@arm.com>
 <1c6a7220-5bf8-44f3-8602-ece207aa1a83@arm.com>
 <6379442c-9abb-4996-831a-aea7f9f30403@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <6379442c-9abb-4996-831a-aea7f9f30403@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB8904:EE_|DU6PEPF0000B621:EE_|GVXPR08MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 643b8b3f-7dcf-4250-095e-08ddb536fcd2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eGI2QzN1S0QwclpwV25JOCtBQ2NkcmNIV2NHWUlOSFBTUTA5TE0vVkdHalhz?=
 =?utf-8?B?bTlZY0doeW1XbVk5Q3hlRjBmL29rYzBkYUs3ZEQvSzRjQ0o2SVBpdGNOZUU2?=
 =?utf-8?B?Zk9FYzhMMG4rQWhkM0c3WUpmMTBHMGdJa3lGYm9OWmUyODdQV28vSkxBWnRW?=
 =?utf-8?B?MmRKVit3RXlrZmJZNjMxSFZ3SmVaY3J2SXdQc0V2VlpiMTVOWFJMM0tBaFlx?=
 =?utf-8?B?aFdvbzdYQW5EQlpQTWRYSTE1azkzUmVDRFl0d1d3NThXeHlnbVB6TS8xM0tj?=
 =?utf-8?B?WUxOYlVqVU9IWmRnTm44VC94YytEb2VuR29WTmptanYzUjI2VCtrdnlCNksr?=
 =?utf-8?B?TjhVNm5MczV0WVdPdmJsV3l0UngyS2VBM0hYcTdvM0tvcjNNMG5TOFhEM21H?=
 =?utf-8?B?a0MrR2JxZXhWdTQyN2ZtQkpHeTMxZU9McXljVjZoTGNmMjB3VzhBRDM4TkJ1?=
 =?utf-8?B?Q2t5WUFIWUFGN2JuV3NIUzM3TGR0MThkVE1mR09VZ01rY3pYRzRIcFh3L1lT?=
 =?utf-8?B?Y1NZUUU5d1d0ZERLemhYcnFjb2k5UjRJbXNLcXJyZHlYNDVYSFAxd21UMzQv?=
 =?utf-8?B?WEZ6RVBSZUp6bXZVdFZvREU0d2czeUYwcklRZFB2ai94YzN2Q2dSaTZSYmg5?=
 =?utf-8?B?YmRMdndBVWhpVmtaWU05aDVENy8zS1A5NG9FZC91M2prNWszSlZ6ZzEycnhN?=
 =?utf-8?B?UFIvb3VFZkZwK05tVm01MlJWazF6eVhQQysyM3QvNmd0dXlMVGwvTml6Y1RX?=
 =?utf-8?B?eUxOc05veEx4OVNNUkhUSi9tMEFkSzdFU2F1Rlp3amRTbmlFd1FsQ28vK2tZ?=
 =?utf-8?B?K0R1MXNab2dqWVBIYWpvR1BwOXBaNG8rUnRLRkRtdFJDZ0JLcTBCRC9qMHNp?=
 =?utf-8?B?a0FnV2UySDE0TjJBQWlTWGpuUVhNdkRNSlJGQzFuSklzR2o0enpmRW5hajkr?=
 =?utf-8?B?YlJGVnIycGxGc0RIRklrMWNzNmxBaEVOU1IvdTB3dWRLZS9vNlpwanlTeUZQ?=
 =?utf-8?B?NXJsYkJRRHlPUXd2OWRrcHZPdWtzOU0xellXVUw1bGpURFFZVldoTDUwSE9l?=
 =?utf-8?B?VHJEV0daV3FJeHN3eEdTK1h2YWxWdWVwcGVKengrcUVtaDVHcmxJVmhYdEd1?=
 =?utf-8?B?UjZScDBUT1FZU1grL0s0blpmTVQ5TnhJYWVRWGNORnJXVC9MODA3WGpKY3Fx?=
 =?utf-8?B?bWRxSHFGUmpyaU5tMTd3cUdZbG5TK0RBSWZ2NUVLeFQ3YWRwc21DVHdMcUJN?=
 =?utf-8?B?VG0yZThuTmk4NEk3UGdGcmR2bWQrdUdxOVRyREUxaW1rdXUxUkNNakt3TUtZ?=
 =?utf-8?B?Q3JzRmYreG85LzM3dHgzWkl3bXJoTTZ4dy82STZ5SDFEb2dUUVJWZjJZRHo0?=
 =?utf-8?B?VU40M1UrUzBvQlZGcGVOQzMvVSt3RWtFc0hqOUl5Rkp5WmdCc0s2QWZ6RStk?=
 =?utf-8?B?eUp5YlFjRVhxVGZtZmc2Vml5aC9QWTFIcG9VWkdwTHcxeVFrTU11UmV1Q3Vs?=
 =?utf-8?B?MDR1MGdYK3VNbjA2ZW9lYmdMWnFPTTltc2pwSVcyZllpcTM0RnQxR2g3WUpj?=
 =?utf-8?B?R1l1WGZJRVNrdGlJdTZsZlV4UU5tQmlPUVNxR3lPZHJBcjhLRUV1S1RKeTBU?=
 =?utf-8?B?WEJjc0hJTm0rcjl4K1FDbnpSYjRINFR2VTZjZ3BYTnBOSkExdThLVEUyc2VS?=
 =?utf-8?B?QnNtT1JJWTJKTUNDTHVrY3pyNlFVQUw5SE42Mjl1eGtMNlo4a3QvTS9nc3R4?=
 =?utf-8?B?SFovb0V3WFl5UzFnM1Y4Qnk3dDkyWVQ1Ymc2L0x3Z2ZmK2dXN3MvWm0yVng0?=
 =?utf-8?B?N2ZyVWNKTUFibzc5OWp1R0VhaHJIWWgvSzIzaFhRV1ZPTjRsUDBQb08rQTdG?=
 =?utf-8?B?R1IwOG9pekdjQTZ5UGNFVVZzNkk0Z1RCcmJpckZvbklaSVpnN1VtVTl2U0ZJ?=
 =?utf-8?Q?JMkEc2NWzQk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8904
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e7ae2f70-522d-4d0a-752b-08ddb536e948
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|7416014|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjEzakZtc0R6WEhYdU1kdGQvd3puZjFqTmdrU29PVDB5ZnRxWFY1MHRraVNo?=
 =?utf-8?B?cnRMams0YTVnY0kyaDFERVcxemxsZzdIdTdNSXpvdzMxK0lzckV4eDhPYm5Q?=
 =?utf-8?B?aE5VR3FWS0Jad2wzV0o1VFFZTG41b3gvQWp6dG94SFVQbndYZlFrYUxOSDNJ?=
 =?utf-8?B?bG1IMXN2U25TQm1SVnNlRFFRbWhucEFPR2xDc091L082eUczaTQ1aUx6a21w?=
 =?utf-8?B?T3NwU0MxYlN0Tm9wZlhDTnhteVJ6RWhLMFhYYkVQczEvTmhDWTFKRVBzeVJY?=
 =?utf-8?B?dllJWDBTU0Z1U2FLaVRGL3RZR0ljSklsQmdXZFI2Ty96bUpWeDRJaHZUQTNQ?=
 =?utf-8?B?d2pwVktqTWtGcEdDa2pCZnV6K0UrQ1dYYzVydmRIVjhnTUpFYTlLOVNlaXVp?=
 =?utf-8?B?eXdhbUM5aHYzek9DTUJodVY4ZjRXRzZBaWJGOUJ5Rkl1YUZvcWJUaFZUM25J?=
 =?utf-8?B?eXFpQVdPVStjQzFiNkNKbjBNbnhWZ3lJQWVYdlRLK0dmVnNJWUNVWEZHOVU3?=
 =?utf-8?B?REppTG9PZWhOc0d4UkFhMEF4NlpsWGpueWk0UWk4cVFoMDgrYU9pUzY3NFVs?=
 =?utf-8?B?aGhFRURDV2xESll1a0E5Wnpoa3BCVmowb25Jc1phWlZENGhteDhmaEd3Njdz?=
 =?utf-8?B?aDQzWG8xV0VqSUJuR1NmRXZ6MWVMNVZOejkvaW9WOG8rVDBjbUp0SWpRUnhl?=
 =?utf-8?B?dE1wNTFuSVk4RXlhSGJ2a3RtRjJLZmQvN3hFQVVpNDMyMFBiS1VJQW1MaERB?=
 =?utf-8?B?UGFUT1Vta1lyR21nZlJLRVlZSWpzcUJrSWdNSStmbklGZEVtS1Q3d0MzSkx3?=
 =?utf-8?B?ZURtcm1WN0pwa3VYc28zcXREdUlvNytlSm9GVGFYcE54Q3o0MGkyZ21ITlg2?=
 =?utf-8?B?YUtXRm9tODBFL0Vya2ZlclpSZ2RQMk9vaDFQRDQyTHBrQ2Q1eVpiKytPWHNY?=
 =?utf-8?B?bng1MnBFQkpKUmxHa2FLU0R1dHQzUU40aVZEK2dTZW5velQ2OGsyNHNTMVU1?=
 =?utf-8?B?NHFJRldSRmwrbXhLZ0RnS0x4MWJSeFlkS0lmVUI5R2xyMUpPeE8va2Jtd1RC?=
 =?utf-8?B?bnArV0dMd3FMWXdrTGE0MEl2M1FVYTBHUU1oVXl0Tm1zS1k5YklxRk1ZY0J4?=
 =?utf-8?B?VEIwV1pVdjVCYjRLcnBUNVU5a2x4QUcyTlNpZ0EybVVraWV3eGt1TGRWU2FR?=
 =?utf-8?B?elVTdE5ORUtpSk8wZjNEeHFkWFFwV1FtS01NTEQveHpndUprK2luektiUjdR?=
 =?utf-8?B?TnU3VWc5eitlRVdCN3JwWG5pRmpQdlp4dlE2c0RMYjhTd3h4UEpMV3VXY1NF?=
 =?utf-8?B?enUxOTlrYUtPM3NKL2ZjOURUdGVVVmZaQ0NKZnY1MUh4NTdrczlKdE1TaTRN?=
 =?utf-8?B?N2xTU2l0eUM5K0Ivd0kwV3dyd0JvNHhLL21DaDU5ZlVTa3Q3Vnp0bitzUDhW?=
 =?utf-8?B?N1JyRkhuWkdXUkRrczBwNlFVRlUvRSt1ZFRPeFZvbEZHejNrZUhnUm9EUFoy?=
 =?utf-8?B?ZEk5TFF2YVU5UGNaOTJwa1FEbEtMSlFOR2tjTjF1L3lmano0OXU3cktPVzdU?=
 =?utf-8?B?TmxMVDRacFRJZkl0Z2p6U0kzb2hJOURFRW1hUmtDUmVuYVlHcFRyN1JZbG5s?=
 =?utf-8?B?eExWVTBuTkx6UDhQYkdteXFISER5eWpBZDYvK2JYZUMvQlJwSXNUVDBxd3J0?=
 =?utf-8?B?WE96bWhLMHN4anVMd0Z5bWVldXRDNExhN0NnMzNjb1Q0TjFkemRYSXhjblVV?=
 =?utf-8?B?MzF0Q1NCZlBPVTZmNU9wOWd1YWhuZEszeG1pODhuaGE1QnBXanRFQ1NmSUlX?=
 =?utf-8?B?Y0c3Mzl4SlNMVGxtUTRtMDBaSm9rM2RURmtKMTN2UERTRk44OThUcDFCWFpE?=
 =?utf-8?B?UW8yYUU5eGVsczB2N1BTcW1ITlVWSzgrWTcyaFZPZFNYcC9HOThSNWw1TUQw?=
 =?utf-8?B?UjJaaWpoT0ptMnRScmhqTmtHK1VhVFlSWm9ibTBOSUIycmREdXk1bHJTeGJP?=
 =?utf-8?B?QmFzNmRKWlRMVTM3N1pDd1Iyb3FYK0k2Yml5WklOWHRDYzFKdndqbXlnSFF5?=
 =?utf-8?Q?a5hRDe?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(7416014)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 04:56:32.9926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 643b8b3f-7dcf-4250-095e-08ddb536fcd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7822


On 26/06/25 1:39 pm, Ryan Roberts wrote:
> On 16/06/2025 12:24, Dev Jain wrote:
>> On 21/05/25 6:56 pm, Ryan Roberts wrote:
>>> On 19/05/2025 08:48, Dev Jain wrote:
>>>> Use folio_pte_batch to batch process a large folio. Reuse the folio from
>>>> prot_numa
>>>> case if possible. Since modify_prot_start_ptes() gathers access/dirty bits,
>>>> it lets us batch around pte_needs_flush() (for parisc, the definition includes
>>>> the access bit).
>>> parisc's pte_needs_flush() is a different (static) function, just coincidentally
>>> named - it takes different arguments.
>>>
>>> But powerpc and x86 both specialize it and they consider the dirty bit. Both
>>> implementations look to me like they will function correctly but it is a bit
>>> ugly. They both conclude that if there is no change or if dirty has gone from
>>> clear to set, then no flush is needed. (flush only needed when dirty goes from
>>> set to clear). Given after your change, oldpte may have dirty set when it wasn't
>>> really set for the pte in question that means the function could detect no
>>> change when really its a clear -> set change; it gives the same answer in both
>>> cases so it's safe. Perhaps a bit fragile though...
>>>
>>>> For all cases other than the PageAnonExclusive case, if the case holds true
>>>> for one pte in the batch, one can confirm that that case will hold true for
>>>> other ptes in the batch too; for pte_needs_soft_dirty_wp(), we do not pass
>>>> FPB_IGNORE_SOFT_DIRTY. modify_prot_start_ptes() collects the dirty and access
>>>> bits
>>>> across the batch, therefore batching across pte_dirty(): this is correct since
>>>> the dirty bit on the PTE really is just an indication that the folio got written
>>>> to, so even if the PTE is not actually dirty (but one of the PTEs in the
>>>> batch is),
>>>> the wp-fault optimization can be made.
>>>> The crux now is how to batch around the PageAnonExclusive case; we must check
>>>> the corresponding condition for every single page. Therefore, from the large
>>>> folio batch, we process sub batches of ptes mapping pages with the same
>>>> PageAnonExclusive
>>>> condition, and process that sub batch, then determine and process the next
>>>> sub batch,
>>>> and so on. Note that this does not cause any extra overhead; if suppose the
>>>> size of
>>>> the folio batch is 512, then the sub batch processing in total will take 512
>>>> iterations,
>>>> which is the same as what we would have done before.
>>> This commit log could do with some reformatting; blank lines between paragraphs
>>> and break at whatever the usual git commit log char limit is (72 chars?).
>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>    include/linux/mm.h |   7 ++-
>>>>    mm/mprotect.c      | 126 +++++++++++++++++++++++++++++++++++----------
>>>>    2 files changed, 104 insertions(+), 29 deletions(-)
>>>>
>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>> index 43748c8f3454..7d5b96f005dc 100644
>>>> --- a/include/linux/mm.h
>>>> +++ b/include/linux/mm.h
>>>> @@ -2542,8 +2542,11 @@ int get_cmdline(struct task_struct *task, char
>>>> *buffer, int buflen);
>>>>    #define  MM_CP_UFFD_WP_ALL                 (MM_CP_UFFD_WP | \
>>>>                            MM_CP_UFFD_WP_RESOLVE)
>>>>    -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> -                 pte_t pte);
>>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> +                 pte_t pte, int max_len, int *len);
>>>> +#define can_change_pte_writable(vma, addr, pte)    \
>>>> +    can_change_ptes_writable(vma, addr, pte, 1, NULL)
>>> nit: add an extra tab for readability:
>>>
>>> #define can_change_pte_writable(vma, addr, pte)    \
>>>          can_change_ptes_writable(vma, addr, pte, 1, NULL)
>>>
>>>> +
>>>>    extern long change_protection(struct mmu_gather *tlb,
>>>>                      struct vm_area_struct *vma, unsigned long start,
>>>>                      unsigned long end, unsigned long cp_flags);
>>>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>>>> index 124612ce3d24..6cd8cdc168fa 100644
>>>> --- a/mm/mprotect.c
>>>> +++ b/mm/mprotect.c
>>>> @@ -40,25 +40,36 @@
>>>>      #include "internal.h"
>>>>    -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> -                 pte_t pte)
>>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> +                 pte_t pte, int max_len, int *len)
>>>>    {
>>>>        struct page *page;
>>>> +    bool temp_ret;
>>>> +    bool ret;
>>>> +    int i;
>>>>    -    if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
>>>> -        return false;
>>>> +    if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE))) {
>>>> +        ret = false;
>>>> +        goto out;
>>>> +    }
>>>>          /* Don't touch entries that are not even readable. */
>>>> -    if (pte_protnone(pte))
>>>> -        return false;
>>>> +    if (pte_protnone(pte)) {
>>>> +        ret = false;
>>>> +        goto out;
>>>> +    }
>>>>          /* Do we need write faults for softdirty tracking? */
>>>> -    if (pte_needs_soft_dirty_wp(vma, pte))
>>>> -        return false;
>>>> +    if (pte_needs_soft_dirty_wp(vma, pte)) {
>>>> +        ret = false;
>>>> +        goto out;
>>>> +    }
>>>>          /* Do we need write faults for uffd-wp tracking? */
>>>> -    if (userfaultfd_pte_wp(vma, pte))
>>>> -        return false;
>>>> +    if (userfaultfd_pte_wp(vma, pte)) {
>>>> +        ret = false;
>>>> +        goto out;
>>>> +    }
>>>>          if (!(vma->vm_flags & VM_SHARED)) {
>>>>            /*
>>>> @@ -68,7 +79,19 @@ bool can_change_pte_writable(struct vm_area_struct *vma,
>>>> unsigned long addr,
>>>>             * any additional checks while holding the PT lock.
>>>>             */
>>>>            page = vm_normal_page(vma, addr, pte);
>>>> -        return page && PageAnon(page) && PageAnonExclusive(page);
>>>> +        ret = (page && PageAnon(page) && PageAnonExclusive(page));
>>>> +        if (!len)
>>>> +            return ret;
>>>> +
>>>> +        /* Check how many consecutive pages are AnonExclusive or not */
>>>> +        for (i = 1; i < max_len; ++i) {
>>>> +            ++page;
>>>> +            temp_ret = (page && PageAnon(page) && PageAnonExclusive(page));
>>>> +            if (temp_ret != ret)
>>>> +                break;
>>>> +        }
>>>> +        *len = i;
>>>> +        return ret;
>>>>        }
>>>>          VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
>>>> @@ -80,21 +103,55 @@ bool can_change_pte_writable(struct vm_area_struct *vma,
>>>> unsigned long addr,
>>>>         * FS was already notified and we can simply mark the PTE writable
>>>>         * just like the write-fault handler would do.
>>>>         */
>>>> -    return pte_dirty(pte);
>>>> +    ret = pte_dirty(pte);
>>>> +
>>>> +out:
>>>> +    /* The entire batch is guaranteed to have the same return value */
>>>> +    if (len)
>>>> +        *len = max_len;
>>>> +    return ret;
>>>>    }
>>>>      static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t
>>>> *ptep,
>>>> -        pte_t pte, int max_nr_ptes)
>>>> +        pte_t pte, int max_nr_ptes, bool ignore_soft_dirty)
>>> We'll almost certainly want more flags here in future. I wonder if it's cleaner
>>> just to pass "fpb_t extra_flags" here instead of the bool, then OR them in. You
>>> can pass 0 or FPB_IGNORE_SOFT_DIRTY at your 2 callsites. No strong opinion
>>> though.
>>>
>>>>    {
>>>> -    const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +    fpb_t flags = FPB_IGNORE_DIRTY;
>>>>    -    if (!folio_test_large(folio) || (max_nr_ptes == 1))
>>>> +    if (ignore_soft_dirty)
>>>> +        flags |= FPB_IGNORE_SOFT_DIRTY;
>>>> +
>>>> +    if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>>>>            return 1;
>>>>          return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>>>>                       NULL, NULL, NULL);
>>>>    }
>>>>    +/**
>>>> + * modify_sub_batch - Identifies a sub-batch which has the same return value
>>>> + * of can_change_pte_writable(), from within a folio batch. max_len is the
>>>> + * max length of the possible sub-batch. sub_batch_idx is the offset from
>>>> + * the start of the original folio batch.
>>>> + */
>>>> +static int modify_sub_batch(struct vm_area_struct *vma, struct mmu_gather *tlb,
>>>> +        unsigned long addr, pte_t *ptep, pte_t oldpte, pte_t ptent,
>>>> +        int max_len, int sub_batch_idx)
>>>> +{
>>>> +    unsigned long new_addr = addr + sub_batch_idx * PAGE_SIZE;
>>>> +    pte_t new_oldpte = pte_advance_pfn(oldpte, sub_batch_idx);
>>>> +    pte_t new_ptent = pte_advance_pfn(ptent, sub_batch_idx);
>>>> +    pte_t *new_ptep = ptep + sub_batch_idx;
>>>> +    int len = 1;
>>>> +
>>>> +    if (can_change_ptes_writable(vma, new_addr, new_ptent, max_len, &len))
>>>> +        new_ptent = pte_mkwrite(new_ptent, vma);
>>>> +
>>>> +    modify_prot_commit_ptes(vma, new_addr, new_ptep, new_oldpte, new_ptent,
>>>> len);
>>>> +    if (pte_needs_flush(new_oldpte, new_ptent))
>>>> +        tlb_flush_pte_range(tlb, new_addr, len * PAGE_SIZE);
>>>> +    return len;
>>>> +}
>>>> +
>>>>    static long change_pte_range(struct mmu_gather *tlb,
>>>>            struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>>>>            unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>>>> @@ -106,7 +163,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>        bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>>>        bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>>>        bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>>>> -    int nr_ptes;
>>>> +    int sub_batch_idx, max_len, len, nr_ptes;
>>>>          tlb_change_page_size(tlb, PAGE_SIZE);
>>>>        pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>>>> @@ -121,10 +178,12 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>        flush_tlb_batched_pending(vma->vm_mm);
>>>>        arch_enter_lazy_mmu_mode();
>>>>        do {
>>>> +        sub_batch_idx = 0;
>>>>            nr_ptes = 1;
>>>>            oldpte = ptep_get(pte);
>>>>            if (pte_present(oldpte)) {
>>>>                int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>>>> +            struct folio *folio = NULL;
>>>>                pte_t ptent;
>>>>                  /*
>>>> @@ -132,7 +191,6 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                 * pages. See similar comment in change_huge_pmd.
>>>>                 */
>>>>                if (prot_numa) {
>>>> -                struct folio *folio;
>>>>                    int nid;
>>>>                    bool toptier;
>>>>    @@ -180,7 +238,8 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                        toptier) {
>>>>    skip_batch:
>>>>                        nr_ptes = mprotect_batch(folio, addr, pte,
>>>> -                                 oldpte, max_nr_ptes);
>>>> +                                 oldpte, max_nr_ptes,
>>>> +                                 true);
>>>>                        continue;
>>>>                    }
>>>>                    if (folio_use_access_time(folio))
>>>> @@ -188,6 +247,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                            jiffies_to_msecs(jiffies));
>>>>                }
>>>>    +            if (!folio)
>>>> +                folio = vm_normal_folio(vma, addr, oldpte);
>>>> +
>>>> +            nr_ptes = mprotect_batch(folio, addr, pte, oldpte,
>>>> +                         max_nr_ptes, false);
>>>>                oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>>>>                ptent = pte_modify(oldpte, newprot);
>>>>    @@ -209,15 +273,23 @@ static long change_pte_range(struct mmu_gather *tlb,
>>>>                 * example, if a PTE is already dirty and no other
>>>>                 * COW or special handling is required.
>>>>                 */
>>>> -            if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>>> -                !pte_write(ptent) &&
>>> Don't you need to keep the !pte_write(ptent) condition here? No need to sub-
>>> batch if write is already set.
>>>
>>>> -                can_change_pte_writable(vma, addr, ptent))
>>>> -                ptent = pte_mkwrite(ptent, vma);
>>>> -
>>>> -            modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
>>>> -            if (pte_needs_flush(oldpte, ptent))
>>>> -                tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
>>>> -            pages++;
>>>> +            if (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) {
>>>> +                max_len = nr_ptes;
>>>> +                while (sub_batch_idx < nr_ptes) {
>>>> +
>>>> +                    /* Get length of sub batch */
>>>> +                    len = modify_sub_batch(vma, tlb, addr, pte,
>>>> +                                   oldpte, ptent, max_len,
>>>> +                                   sub_batch_idx);
>>>> +                    sub_batch_idx += len;
>>>> +                    max_len -= len;
>>>> +                }
>>>> +            } else {
>>>> +                modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent,
>>>> nr_ptes);
>>>> +                if (pte_needs_flush(oldpte, ptent))
>>>> +                    tlb_flush_pte_range(tlb, addr, nr_ptes * PAGE_SIZE);
>>>> +            }
>>> This if/else block and modify_sub_block() is all pretty ugly. I wonder if
>>> something like this would be neater:
>>>
>>>              use_sub_batch = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
>>>                      !pte_write(ptent) &&
>>>                      LIKE_can_change_pte_writable(vma, addr, ptent, folio);
>>>
>>>              while (nr_ptes) {
>>>                  if (use_sub_batch)
>>>                      sub_nr_ptes = sub_batch(...);
>>>                  else
>>>                      sub_nr_ptes = nr_ptes;
>>>
>>>                  modify_prot_commit_ptes(vma, addr, pte, oldpte,
>>>                              ptent, sub_nr_ptes);
>>>                  if (pte_needs_flush(oldpte, ptent))
>>>                      tlb_flush_pte_range(tlb, addr,
>>>                          sub_nr_ptes * PAGE_SIZE);
>>>
>>>                  addr += sub_nr_ptes * PAGE_SIZE;
>>>                  pte += sub_nr_ptes;
>>>                  oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
>>>                  ptent = pte_advance_pfn(ptent, sub_nr_ptes);
>>>                  nr_ptes -= sub_nr_ptes;
>>>                  pages += sub_nr_ptes;
>>>              }
>>>
>>> Where:
>>>
>>>    - LIKE_can_change_pte_writable() is similar to can_change_pte_writable() but
>>>      does everything except checking the per-page exclusive flag. Note that we
>>>      already have the folio so can pass that rather than calling vm_normal_page()
>>>      again.
>>>
>>>    - sub_batch() can be passed the folio and the index of the first page within
>>>      the folio and the max number of pages to check (nr_ptes). Then returns the
>>>      number of pages where exclusive flag is the same.
>>>
>>> Obviously they both need better names...
>> I cannot figure a nice way of implementing your suggestion. We need to get the
>> length
>> of the sub batch and the true/false return value from can_change_ptes_writable, and
>> we also need to call pte_mkwrite in case the ret is true. Doing that in your
>> suggested
>> way seems harder to me, along with the fact that it is causing indentation
>> problem by
>> one extra tab compared to my current implementation.
>>
>> I don't know, my method looks pretty neat to me : )
>
> How about something like this (compile-tested only)? Personally I find this
> easier to follow:
>
> ---8<---
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 124612ce3d24..97ccc2a92a7b 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -40,35 +40,47 @@
>
>   #include "internal.h"
>
> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> -			     pte_t pte)
> -{
> -	struct page *page;
> +enum tristate {
> +	TRI_FALSE = 0,
> +	TRI_TRUE = 1,
> +	TRI_MAYBE = -1,
> +};
>
> +/*
> + * Returns enum tristate indicating whether the pte can be changed to writable.
> + * If TRI_MAYBE is returned, then the folio is anonymous and the user must
> + * additionally check PageAnonExclusive() for every page in the desired range.
> + */
> +static int maybe_change_pte_writable(struct vm_area_struct *vma,
> +				     unsigned long addr, pte_t pte,
> +				     struct folio *folio)
> +{
>   	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
> -		return false;
> +		return TRI_FALSE;
>
>   	/* Don't touch entries that are not even readable. */
>   	if (pte_protnone(pte))
> -		return false;
> +		return TRI_FALSE;
>
>   	/* Do we need write faults for softdirty tracking? */
>   	if (pte_needs_soft_dirty_wp(vma, pte))
> -		return false;
> +		return TRI_FALSE;
>
>   	/* Do we need write faults for uffd-wp tracking? */
>   	if (userfaultfd_pte_wp(vma, pte))
> -		return false;
> +		return TRI_FALSE;
>
>   	if (!(vma->vm_flags & VM_SHARED)) {
>   		/*
>   		 * Writable MAP_PRIVATE mapping: We can only special-case on
>   		 * exclusive anonymous pages, because we know that our
>   		 * write-fault handler similarly would map them writable without
> -		 * any additional checks while holding the PT lock.
> +		 * any additional checks while holding the PT lock. So if the
> +		 * folio is not anonymous, we know we cannot change pte
> +		 * writable. If it is anonymous then the caller must further
> +		 * check that the page is AnonExclusive().
>   		 */
> -		page = vm_normal_page(vma, addr, pte);
> -		return page && PageAnon(page) && PageAnonExclusive(page);
> +		return (!folio || folio_test_anon(folio)) ? TRI_MAYBE : TRI_FALSE;
>   	}
>
>   	VM_WARN_ON_ONCE(is_zero_pfn(pte_pfn(pte)) && pte_dirty(pte));
> @@ -80,15 +92,60 @@ bool can_change_pte_writable(struct vm_area_struct *vma,
> unsigned long addr,
>   	 * FS was already notified and we can simply mark the PTE writable
>   	 * just like the write-fault handler would do.
>   	 */
> -	return pte_dirty(pte);
> +	return pte_dirty(pte) ? TRI_TRUE : TRI_FALSE;
> +}
> +
> +/*
> + * Returns the number of pages within the folio, starting from the page
> + * indicated by pgidx and up to pgidx + max_nr, that have the same value of
> + * PageAnonExclusive(). Must only be called for anonymous folios. Value of
> + * PageAnonExclusive() is returned in *exclusive.
> + */
> +static int anon_exclusive_batch(struct folio *folio, int pgidx, int max_nr,
> +				bool *exclusive)
> +{
> +	VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
> +	VM_WARN_ON_FOLIO(folio_nr_pages(folio) < pgidx + max_nr, folio);
> +
> +	struct page *page = folio_page(folio, pgidx++);
> +	int nr = 1;
> +
> +	*exclusive = PageAnonExclusive(page);
> +
> +	while (nr < max_nr) {
> +		page = folio_page(folio, pgidx++);
> +		if (*exclusive != PageAnonExclusive(page))
> +			break;
> +		nr++;
> +	}
> +
> +	return nr;
> +}
> +
> +bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> +			     pte_t pte)
> +{
> +	int ret;
> +	struct page *page;
> +
> +	ret = maybe_change_pte_writable(vma, addr, pte, NULL);
> +	if (ret == TRI_MAYBE) {
> +		page = vm_normal_page(vma, addr, pte);
> +		ret = page && PageAnon(page) && PageAnonExclusive(page);
> +	}
> +
> +	return ret;
>   }
>
>   static int mprotect_batch(struct folio *folio, unsigned long addr, pte_t *ptep,
> -		pte_t pte, int max_nr_ptes)
> +		pte_t pte, int max_nr_ptes, bool ignore_soft_dirty)
>   {
> -	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	fpb_t flags = FPB_IGNORE_DIRTY;
>
> -	if (!folio_test_large(folio) || (max_nr_ptes == 1))
> +	if (ignore_soft_dirty)
> +		flags |= FPB_IGNORE_SOFT_DIRTY;
> +
> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>   		return 1;
>
>   	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
> @@ -125,14 +182,17 @@ static long change_pte_range(struct mmu_gather *tlb,
>   		oldpte = ptep_get(pte);
>   		if (pte_present(oldpte)) {
>   			int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
> -			pte_t ptent;
> +			struct folio *folio = NULL;
> +			int sub_nr_ptes, pgidx;
> +			pte_t ptent, newpte;
> +			bool sub_set_write;
> +			int set_write;
>
>   			/*
>   			 * Avoid trapping faults against the zero or KSM
>   			 * pages. See similar comment in change_huge_pmd.
>   			 */
>   			if (prot_numa) {
> -				struct folio *folio;
>   				int nid;
>   				bool toptier;
>
> @@ -180,7 +240,8 @@ static long change_pte_range(struct mmu_gather *tlb,
>   				    toptier) {
>   skip_batch:
>   					nr_ptes = mprotect_batch(folio, addr, pte,
> -								 oldpte, max_nr_ptes);
> +								 oldpte, max_nr_ptes,
> +								 true);
>   					continue;
>   				}
>   				if (folio_use_access_time(folio))
> @@ -188,6 +249,11 @@ static long change_pte_range(struct mmu_gather *tlb,
>   						jiffies_to_msecs(jiffies));
>   			}
>
> +			if (!folio)
> +				folio = vm_normal_folio(vma, addr, oldpte);
> +
> +			nr_ptes = mprotect_batch(folio, addr, pte, oldpte,
> +						 max_nr_ptes, false);
>   			oldpte = modify_prot_start_ptes(vma, addr, pte, nr_ptes);
>   			ptent = pte_modify(oldpte, newprot);
>
> @@ -209,15 +275,38 @@ static long change_pte_range(struct mmu_gather *tlb,
>   			 * example, if a PTE is already dirty and no other
>   			 * COW or special handling is required.
>   			 */
> -			if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> -			    !pte_write(ptent) &&
> -			    can_change_pte_writable(vma, addr, ptent))
> -				ptent = pte_mkwrite(ptent, vma);
> -
> -			modify_prot_commit_ptes(vma, addr, pte, oldpte, ptent, nr_ptes);
> -			if (pte_needs_flush(oldpte, ptent))
> -				tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
> -			pages++;
> +			set_write = (cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
> +				    !pte_write(ptent) &&
> +				    maybe_change_pte_writable(vma, addr, ptent, folio);
> +
> +			while (nr_ptes) {
> +				if (set_write == TRI_MAYBE) {
> +					pgidx = folio_pfn(folio) - pte_pfn(ptent);
> +					sub_nr_ptes = anon_exclusive_batch(folio,
> +						pgidx, nr_ptes, &sub_set_write);
> +				} else {
> +					sub_nr_ptes = nr_ptes;
> +					sub_set_write = set_write == TRI_TRUE;
> +				}
> +
> +				if (sub_set_write)
> +					newpte = pte_mkwrite(ptent, vma);
> +				else
> +					newpte = ptent;
> +
> +				modify_prot_commit_ptes(vma, addr, pte, oldpte,
> +							newpte, sub_nr_ptes);
> +				if (pte_needs_flush(oldpte, newpte))
> +					tlb_flush_pte_range(tlb, addr,
> +						sub_nr_ptes * PAGE_SIZE);
> +
> +				addr += sub_nr_ptes * PAGE_SIZE;
> +				pte += sub_nr_ptes;
> +				oldpte = pte_advance_pfn(oldpte, sub_nr_ptes);
> +				ptent = pte_advance_pfn(ptent, sub_nr_ptes);
> +				nr_ptes -= sub_nr_ptes;
> +				pages += sub_nr_ptes;
> +			}
>   		} else if (is_swap_pte(oldpte)) {
>   			swp_entry_t entry = pte_to_swp_entry(oldpte);
>   			pte_t newpte;
> ---8<---

Looks quite clean! I'll try this.

> Thanks,
> Ryan
>
