Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013009.outbound.protection.outlook.com [40.107.159.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFDA1F19A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 05:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.9
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749445456; cv=fail; b=LTxRTvwL7zu6Y7wmZyKroSlTAIqwNVi21bbOES6Y7yeO1kN8+HF0xza9HiXmKEm3SRSu4mNSOu9Pg9X+5Uq56zWCVQHaD3g8b/nVJBmR8zKBlHQiGKRYA2LvaoGbnFoGb38G0jIYcYu1vFKykOUAvZe4Y+gS6bux1TtaXybnOP0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749445456; c=relaxed/simple;
	bh=8owN4wbTzY4oXP43yCRIJ5z4F3HCfqlQNVGK1Kc/a70=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rnpvU+NW0ggOWW30Vhh+V0ld56d2Dt+zyi/PBGqm0sb8GaVrM7mb9+PkoBvSvvpPafCY6jcoA0LrTDTv6g5aKr+MDtqcIMmZud1lQvfTAy9Lkvr8KsvfjQ4uohrbnEZLY02rUgTgBS4omoRy5Eoupkk+QZRiJax3yYZh4Q92QN8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o7IBDHCr; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=o7IBDHCr; arc=fail smtp.client-ip=40.107.159.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o7IBDHCr";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="o7IBDHCr"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TA3SBtCPjnGyjK0i1LntpkHXF5p6DWPMbzlCpxqDmvTiA4RrXyV+4yTfdf2z/E3gTBIp/bQRLCuJAiCSXtVGUzR9dADdRJ2/5Qs/ZpCPhQAB1x3uLAbHDmbGzxZuE4byX63xG8HoPjxew6v2iUKMSoQXHGCg4S2XmVlRDlLV7jVFwi/tXehmZhtVtBS6fb+GCCijabr0ihv6DHzbPC4z/HKxeTK9G28UwcXWjakcOSR6GmF9wkA+ANSS299CjBnNn/SsAv5+xM4qx5G2ei6nMGiII3J5YQZv4qWc5fXaD/lPI8vO9qYkMJNn7IJJ/s07Zo+YoF4+wcu4rZ74xBu+nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0UJBSxpJU+YBHSh6qXhgSzytAOIasmPY9S2YN51o48=;
 b=l+52jgDaFHt55a7C4H8AFfpJDXC1GgyAn/C3cq3B7hDdhKFFx64Gw8Heim2TKnCgj8UYaZBkB6NFtkNxMr2QQ42OW6oA402FK7t7OdJLZHm4Y8uoRJbcF2+gxIw75gF9Lxp1MDC5DI+z2mNZQF5WDmhYJnQi+NNzkonfF2GXtAP+34Iuv4Sp1cpnmqTJozzUhtPZca2GJYwTWBDP/X4GeIfGb6ZFRa86txCn+EnxD0gMVK0EKccE+ZEluQUggrLF914GHklAawiEUw1BL1+d4md0XTSK03dJvEosqk2FXLsvGR92mEoxKTVhPnNbLBZMIx8rAvFooMuulg3xNhdg2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0UJBSxpJU+YBHSh6qXhgSzytAOIasmPY9S2YN51o48=;
 b=o7IBDHCr7K5RnF+AArscuWx10mXVqfpJeXrU+41X0S3Vf6q2G/+MrY78KdIVc//qfyXKLvzR3dOFt1KUwp6AfXrlJEL/33iWHecx0z9S5yxZ8HRfPZxQ1k5vS9vkL+kfWwd+iRoiy/4ScKd7xDm/mZ/jek6g3Is4pVCZPc+e0LY=
Received: from DU2PR04CA0238.eurprd04.prod.outlook.com (2603:10a6:10:2b1::33)
 by AS8PR08MB9146.eurprd08.prod.outlook.com (2603:10a6:20b:57d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Mon, 9 Jun
 2025 05:04:06 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::5d) by DU2PR04CA0238.outlook.office365.com
 (2603:10a6:10:2b1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.28 via Frontend Transport; Mon,
 9 Jun 2025 05:04:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 05:04:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuld+zPuVYyg7x+K2lBsEzRMZmo8J1DlJrTNXCyWT1NQerCm7sL4sJbXZgxrq6I+tsNhl2C+4lk68crBgsaOqSNmuOXHq50vPqxvyuGB2Z+NHAyRyMZMnEUzFtuLjnwOXOuRxm6yvx4tP1iU81KI1rpDouIOh6E0K8KGaGkG6q3sbaA08HNmWyxMmT4Jo2Jzh9cjeA3/TODPSi9tju07y8OWsWmCkpsayQOhT+u8oF7jl61j+v4tvaAraB5myI7b5GK436BLIm3ifB62afn/tVaXrVeOp3O0cpaayhFAgFoLHU6a14rxeZnTtjDsbNJTbF5uW1yEqEig3cdiEX/9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0UJBSxpJU+YBHSh6qXhgSzytAOIasmPY9S2YN51o48=;
 b=pJWbF7N47U9RCWdBdQcut8oBrQqXiGOg0qH7/JP40Qv9mSlPSpCPhNdUwjhmY2w3ReNlmcs1zxjcBfSuH+19WU3DRw0/rVDNNvzKTC7aS7pyonqC2vkJ4YZpoXApyfkdnd0n35ic0EeSNp97iYn+DLapNBJxSVBLtr3m09bmJTCwg/4OEMJdgonGoiyDJom9fjDFUlqjKUK/mBqRlL1Yw/ZQWzadjjLqV3aW+Ct3BHADi+ur6UTqN/B8L4o0C4j8yeS7gsSf7FcpR+IZuYrnLU5OamFevgHyJud52zMv/dseMO1zHgWlf6Oum64ahG9QPFv0IYoFctxE/hn9YAL4Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0UJBSxpJU+YBHSh6qXhgSzytAOIasmPY9S2YN51o48=;
 b=o7IBDHCr7K5RnF+AArscuWx10mXVqfpJeXrU+41X0S3Vf6q2G/+MrY78KdIVc//qfyXKLvzR3dOFt1KUwp6AfXrlJEL/33iWHecx0z9S5yxZ8HRfPZxQ1k5vS9vkL+kfWwd+iRoiy/4ScKd7xDm/mZ/jek6g3Is4pVCZPc+e0LY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB7861.eurprd08.prod.outlook.com (2603:10a6:20b:52c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 05:03:33 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 05:03:33 +0000
Message-ID: <07329481-cf45-4c97-92dc-237310b61a80@arm.com>
Date: Mon, 9 Jun 2025 10:33:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Barry Song <baohua@kernel.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>
References: <20250609002442.1856-1-21cnbao@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250609002442.1856-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB7861:EE_|DU2PEPF00028D02:EE_|AS8PR08MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc341c0-fe07-4165-880a-08dda7130f31
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?R2xiNVAvbFdUU281MGNsMVRLRGFJSFhRcEZpbUJtVkdFRWFhT1JDNmxic3pz?=
 =?utf-8?B?RzB6Mnl2SEJ1dEFnN014NmNraE9aNnN1QWNOYnB4TlNvME5kNjFaMEZYbmYw?=
 =?utf-8?B?dkZWNVFBMzlpNUtOUDUyMHNBWThydUhJRnIwNnh1Y3RUSGVEOXRCWGJjZ0M3?=
 =?utf-8?B?K0lYRE02Ky9xd2dHcnpJTE5pU2UvOElLTnNMdnpRbXNOR2IrMThSZjVXRnpE?=
 =?utf-8?B?RXJTUldDd2VqYm1zY1o1aEJwZlQxN2UycDIvdVZVYW94SzBOclJYZkZxclhq?=
 =?utf-8?B?dU5VdWxOU1BibW0rS3RQcFNScDdHK0NDVTVRV21vRVBhcStJbUwrMDM3NGVa?=
 =?utf-8?B?alNrRnpvQ0RiemNwZzJlRVhtRTNyaXdDVCtFQjYwc0w2YXF3c3RNanZIYWpR?=
 =?utf-8?B?bmY5dVZOVXpDS2RRMVBaSVNGcXBNU3kxaHhoYTB6Qy81NlBISlM2VXd4WUEr?=
 =?utf-8?B?bVordlNBVGw3UCtrbDVJOWVZbDdhUzRiSEVTMDhCVTFhMndzZ1pmNXNUTExB?=
 =?utf-8?B?YTRuTEtJZWJRUGpQcU5lQTBLcjlHcTFtYzI1U21sQWVvYXdFcG5hQ2wyN1Q0?=
 =?utf-8?B?cnNLM2RjZ0gxQ1phc3ZsRmlLN1EvYmxxWVdvMDBxSGx4U1U3OG13VlUyWlM2?=
 =?utf-8?B?T2FHYVdZVnFjb3FUNm5WY2kvSzJ0VCtUVDJXeXU1b0hwZXZBblhaaHhuWkQz?=
 =?utf-8?B?U0lMRkhTVTEyMVlFZXQrOU0rcVRqYlc4UUJYRkd3dGRqb2hwbnE5Z1NxVmY5?=
 =?utf-8?B?am5GTTA4TkZQRGw2WUpFbTljL01tRW5VM1JLQ3RBejVoRDZpNmxEd1E1OThF?=
 =?utf-8?B?bkZTemczMndMSlZsaGRKSHZRakVPbWlqUXVEdDAyVmQ0UGlLYmtDK0lrczNu?=
 =?utf-8?B?OHcxQXRHbE5vQWwrMVJIZUxNVXpDbkhjbDdzcHQvNlloY213eTNzbU50WEhk?=
 =?utf-8?B?bHRzSG1Fa3g3clVGR2ZTbDR1aUtMS1ZTWG1hS2dtT2JxSUxTNE03TzdXUmxP?=
 =?utf-8?B?bW9YRTdwK2hEbXpabWl6OTFRWHdVbmlwQVhva3VEVlpMbUVGZmloZ3paUmtL?=
 =?utf-8?B?cnA5ZnlnbUxqY1I3OUExcE9hc3hXNlB4THlNb1pjV2t3Tmh3S2VqemNJNU1F?=
 =?utf-8?B?cXRpQ0Q4YXFaOCtJdEVKS0NPNWhkdlA5NThlZVgraG1DQ0pzZUM4MGExZy9E?=
 =?utf-8?B?cDJFUXFGcTMzd2tQQjBsWklXenBLYjlkR0J5WnJ2WHJJd2dEUmRpaXpvVnds?=
 =?utf-8?B?QzBrYmRjb3BSaFBTZTRTdEN2aUpnQWhVRnZjMmlZUE1kNjF5Q0NHRkdkbVln?=
 =?utf-8?B?LzJmbkkralN3UjVKcFVRa0ZwWkJGMXBreDN4dXh6NDlVZHQ5QUxHM3doQ0Y1?=
 =?utf-8?B?NUZYbDhVcEF3anJZZjgvSXkwTHRiUGVROGZoVUVRSmEwaS90c2RXU2ppaGF2?=
 =?utf-8?B?MTFvbUpTZGdsOEpMWUpNcXJOY0lmTTVmeXV4WXk2NkhJejQxV1o0b0lpLzFi?=
 =?utf-8?B?SnlJcUdPQ1BKdXI0MHM1dlVWTUkvQXhwTmFlVHJjTzA1Mk1BQlo1clBwdUlx?=
 =?utf-8?B?eUhGZkhNcHlGWVlhQVoybytKZGtDMi9EaXdkSWh0bGVuQklOS3VXend0RFMx?=
 =?utf-8?B?OSs1dG5iL0M4ZVNSNmdhZ0VTbEtZS3Q1MDZmWFlYWVBaRjJtb1ZtaEh6N3Bu?=
 =?utf-8?B?V1NPRW54STFJbWFYYTBaRkl0TFY4YVBsMVZOY0tqZlRSc0FFb29sbFl6dUlu?=
 =?utf-8?B?Zi9qTlRZSGpDWG9ZSVQxaGFNRThtUndJQWs1bVdNTFVtTnFRRE8zWjEzUWRL?=
 =?utf-8?B?aU8rL2RIbTRmWW5Ud24weWxRdVlIenlvOG5DTkkyVENZMTZYSUVQSks3ZEpM?=
 =?utf-8?B?SkZaRTNtdHZTNlZtYXhVTm5wOXY5K2hIdnZzMDBaS0pQZ2ZtYWpBUUVhbFlP?=
 =?utf-8?Q?W0shKhj9MGU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7861
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fda0409-70d1-41ee-85cc-08dda712fbd4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWZ0THlXVjZsMEUxanFTUmNwUkV4L1ZwMDRKemtZQUJvenBPeThaK2JVQk41?=
 =?utf-8?B?ejhzZENtakJ6bjJIZ1VYQlIvaC9ZdXBBSmNISUV5Qm9ab3BsZ1dYY2IyZlR1?=
 =?utf-8?B?QUh4V21nd1ZCaithZ2xnTDg1dFgzeHZWL21OMFZSZnhaclBuUTk5OTdkanVu?=
 =?utf-8?B?dCtsM0FZdXRWaFQzcUhOZWJ4YVRUOEVNYmR0SE9SSjFielFtTzlJUCt5ajlK?=
 =?utf-8?B?SVpjT2NOYWwvRW5PK2prWkNYUGxScElScWdGSlJXNklaSGlYQ25aWGQ1aEVS?=
 =?utf-8?B?WUZpL2dGckJ1S3J2eDJSb0VPWmxMNTg4b200NHBGTWlJbU9wVzRHb1RBdHZk?=
 =?utf-8?B?eG1veEhNZWNWRWlOclF4cW1HNHlEQk9sY09uNmR3ODJoTUdmWnlQSUY2eHVV?=
 =?utf-8?B?cVY4cFRPV1dndkpVZkdPNmZGSlVYMFRveUVDTjQyMzh6QWI2YUl2VUdtN084?=
 =?utf-8?B?N092c2ptcWhqRWpnR09mMHRxY21TWVNGWXgvc1lxU2ZVQTgxS2NaMGFDSFdS?=
 =?utf-8?B?RXBHRkFjSllVUFIrMFdFeUQvZGs2Q3lkNEtCVlZkemZ4RVgxWWdiZ1hnakJq?=
 =?utf-8?B?OWJFbHhMR3p4SjhOcGd3cU5HcjI4aWNBMHNrc1ljQTcvTGFTVFJTUTc2cVRW?=
 =?utf-8?B?OUFRNnBLQis3VnVYZmNjYXNDMHdTblgvZ3JKR0F5VWVDbXdYZGVvdmwwQjdI?=
 =?utf-8?B?dmpuZ2pJRVh3b2Mwd0E3b2V1VXo5NzhNckdVVisvTytNdVQxaWpndjZLYUVZ?=
 =?utf-8?B?VUc3SW1Kczg1TnJpeDZlc3c0bDNsUVYxdTFPRHV1a1FJSjNUY3YxcW5LVzFq?=
 =?utf-8?B?MzVtRjBtQUN2ZXJsTTFXbXN1S1Vmcm9JMlVvbk5zbGgvOFNRRVFMdGJkd1VS?=
 =?utf-8?B?eFhIbFFiQ1llZ00yTG95UmRmdUZSNFZSSThKU2hnN1cxS1ozS3Rxa2lxOU9W?=
 =?utf-8?B?R3AzaDdsbHM2eGNBRUVRbVg2c1ZiYVZPZDJwb2xIbm9BSXNCN2dONVlyR2dQ?=
 =?utf-8?B?L1ExVWlnREhvQnEyUSszL0xIeDRvSjFxMi9MUXBjOWRiQm56WlUyRi9DQWJW?=
 =?utf-8?B?Qy9nUGhHVkt1eGc0OUpaZVZZS24yekRpTGNVZWErd1JUbFJBN1RXdVM5YVp2?=
 =?utf-8?B?Tk9lN3RMT0VyelFNdlpxME1ZcGRvSmhIVmJGOXFZa2luVXlzRWpzeDFMNkNJ?=
 =?utf-8?B?ZGFtMmgyZDVxdUczTGpuR0xsdktqajF3cUJnb1NBR3dCTlg1U05xWlV6bWwv?=
 =?utf-8?B?WGNQeHdyWlhrcDR3MUVuaHBlTnRidHRmbEZmbXo4cnhrdmtsTUo0QmRBY1d2?=
 =?utf-8?B?UHM0eXNIU0EvQlVkdFpYWmJEOXFjeFNBUHd5NFUxRnZsS0JTY09PQ0JZUmlF?=
 =?utf-8?B?dzdZMFcreWIwTnhoY2JCbnFtZUVGOEp4MG0xazRjdGpOY3pZWnhpbnZXV3hp?=
 =?utf-8?B?bGhkUkFwMUVJeHQvMjdBK2pwUldPNHlDbWVhVE9IZjgyVU00UjU5eVlCWjNl?=
 =?utf-8?B?U1ByRU5EdU92TDlSM2hkNmQ5VTBOVjk5YWt6aUJ6WVUydVNzdVhsMkNMY3Zk?=
 =?utf-8?B?cGtCTjlnQ2E1MTF0SEtVNU1oc1Zvc256Z2xGYUhpRmkzMjZXSStWNC9iUUN2?=
 =?utf-8?B?UHVWc0pjQTQ1QVNtbFdEYXJGOWtNbHlFbVBJM3dsbFFDNEhVNzlFUU4rYy9F?=
 =?utf-8?B?ZUk4TS9SQnpHSEs5ZVZvS1IyU3hhTEM5M1Z5VjR6MjMwaHNtNzdJdjNXTzdG?=
 =?utf-8?B?Y0NDbTVpVDkvcXpnaGFBZ21RS3JZajRWL2xwczRFQU9LVUhhVmtzMkdhd3V3?=
 =?utf-8?B?TkRNVVNXVjVmY3FpSzcwV2crVlRtcTlNZk8zZ3U2K3R3UUt0VFhLODcxOGlV?=
 =?utf-8?B?VXpaUy9QaVdIVjlmdW0zaXN1YkJzM0kxRjNEMW56WWRoZWZmZUpPMW96ejBq?=
 =?utf-8?B?VlRvOFBGRjVmdjZMQ1UwQndjRnp6ekQ1WlltcElXcFpGWWx6aVJ6WGM2V0lm?=
 =?utf-8?B?UTU4dWZZUzJ3WDBqTWRlM2VTMWxieWt3cVJ1bUdOSk91U1BGd21xajZESEg5?=
 =?utf-8?Q?0V+EjP?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 05:04:05.6629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc341c0-fe07-4165-880a-08dda7130f31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9146


On 09/06/25 5:54 am, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
>
> I have been actively contributing to mTHP and reviewing related patches
> for an extended period, and I would like to continue supporting patch
> reviews.
>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>   

Acked-by: Dev Jain <dev.jain@arm.com>

