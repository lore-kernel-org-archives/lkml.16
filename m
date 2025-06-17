Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C16F28ECE3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.60
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150744; cv=fail; b=Yr0XFoJ5mp4KybRbmGTdtDA4Oj4cYolQsqzZBHxQ9exVluJCY71S9OIwQ6/MhHc5Itlrn/QFJZOhgQLRJPNspx1zk38JCG7qasnaNBuMRvGsZcJHDmnffbnbrUztROGbLAwDdrKU+1wSv288Ns9qgkYv4hl8B+jVclUX+ostTpM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150744; c=relaxed/simple;
	bh=fj/D8kpKkJt9MJ765Zrrkqubww8Jrc3Ac4+W7Ncmq80=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bIXkcx+FOOrqGG4dbb7tBBSvor1xfUazuDIwGuqFNag24g9Ldqm6cSQDbI2ken7rmjExp9vBl74fMLfscv27w/EgvDUmoSC7QMBLt3LU7KkoHGx+azDPG3hYomWF9onpj0JYL80eM9jCHJMRiHed+P+5MwA3Lfn/A34vfFxGCNE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=k8u8GLmy; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=k8u8GLmy; arc=fail smtp.client-ip=40.107.159.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k8u8GLmy";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k8u8GLmy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d7tqaXXFJ9X6U6SiJdctbdFf4geAcUykBo8gY71vrTdbuTUSrVmAwmUngmU/dymPIlmadtnl3Z/fjCT+AFaGUCacVugB2qwFHsM3gatbOCkSy7GrO4SRu8U9C06l53i1yz3T74BG6X02fFckQdGYWLoUPLTB199CqQoFNeBMVrb6OKLqmHdK01m0mylUG14Ylm+0mLAAFrzIZmFg+1/bqItWKhXncWn4425PpYvLvaxdizISp13kbjH5AR3L7BsoRPZiI/S0yPY1tdmVHH2FfMXZoeuG4D8HokiedJHNuz/zaQ/CwRSa6MTr0Fs4qtApc2MF/cwTdnOySteN1KvS5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1VW0qvhewKAxAarrX5GvC2eeNXJTfHmEjztaBaKsks=;
 b=a00NkgaQVxjxILaz7xutktv81wB52FupkNnJltQGY/1ME7WIt0cHEft/APffh0w7TphtoZrPKs6RZh1DcfFyIPD/9qlCr/IOUApatPgYWWg3FG4Qf/B558OEk/taU/xTl7N4vcL77AoEkgGylag8Trlgr/UZ3eynGKS1AdMYmVvSV2NQ1UMMQTsweEVgBslb5rGimilFdMBbHbpI0tvnOMWDziZHDXfdX9ptreFgzIdcCrZQthRsCI95nFl94O5Z8MmApnYCtw759utCkK9A/qfw6cxnZEXYNCDlnqlOEUQtp+Q7Mb7KRn204Rce0hSUlZ+hfvsGJC5FkBWKhHpWEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1VW0qvhewKAxAarrX5GvC2eeNXJTfHmEjztaBaKsks=;
 b=k8u8GLmyQ/X98GJItcKkDYD/vJ5JCdT6BCwtIWbxR8Qh2TGuQ02ul6IUST3mdMsaEka5HsvEVbxPa9J0UG2wCMDpzqsLiy4IFpVPpjyVJqpFJIw8GzmqMsE9XCAQAnL4TNyVmGhwuWqB4BJNZlBqWS8k81yQfSxXWWXGfdVXHYU=
Received: from DB6PR0301CA0093.eurprd03.prod.outlook.com (2603:10a6:6:30::40)
 by DU0PR08MB8640.eurprd08.prod.outlook.com (2603:10a6:10:400::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 08:58:53 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::ce) by DB6PR0301CA0093.outlook.office365.com
 (2603:10a6:6:30::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 08:58:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 08:58:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLzcZ9HSjKKDpXJ9nchZFcSI/yi/FSFV3xHrC63tMzsJVJbpiWgXqTnqpLkxSoH937bKPC9uk1ipvKGZINFmoVk19jnKqvdFXB7FtgvJZ0ceykcj29HZA76Aiec9ol+lNWFzVAsVAcUfFQHo+4FS7c8q0OJzQmvBLYhM/0OKqiPGQJTKxwChhJgT6d+c1Tx2BWortKpdVCVfL66PCAndG2VWZG42Oe/dHM7babUremtSkuL22rmevEJiTl3GxkZR1XicVvfgnLxMHIIR+/gPJJC1iuw7lcySYrqnV8FxQTLWRJU872hXAkXk8Oo4qxATX6DZSR4RA+m/KiEpQjcHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1VW0qvhewKAxAarrX5GvC2eeNXJTfHmEjztaBaKsks=;
 b=cXZbaw5382s02c9DK1Qo/Rt7dwDodbOEpq//7qVurMZTNYMqJzrTEXIrs9LtXo9HZauYVJ9HS7YYBRsSeUYYTJyyLlKEpqPhSKIUl3GXKH4yDCSXzQ1Yd/zk3N3MglmSF2o+yeZpmYGtfjcQenbIiRE9JS1AkpOADzaU5LWwtQEmUXG+0sXK6by+HmVXwG2fBdAZDOqO9LmkLZ9U8JPcTOd35Cmx/octbthQw+VQqZwgoVE9oGlYtAL/g9gp8Q54YalA5f3LdEnuJpeJVFTNaSLVmmfiqSsXXj93v/Xcsdfhr0uvvrxdDWWTYATCTGW2cavlgU2/2RmVatFvjUL5UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1VW0qvhewKAxAarrX5GvC2eeNXJTfHmEjztaBaKsks=;
 b=k8u8GLmyQ/X98GJItcKkDYD/vJ5JCdT6BCwtIWbxR8Qh2TGuQ02ul6IUST3mdMsaEka5HsvEVbxPa9J0UG2wCMDpzqsLiy4IFpVPpjyVJqpFJIw8GzmqMsE9XCAQAnL4TNyVmGhwuWqB4BJNZlBqWS8k81yQfSxXWWXGfdVXHYU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM8PR08MB5841.eurprd08.prod.outlook.com (2603:10a6:20b:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Tue, 17 Jun
 2025 08:58:19 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 08:58:19 +0000
Message-ID: <eaa10f47-210f-4f8e-86a9-42fdd0ebdf48@arm.com>
Date: Tue, 17 Jun 2025 14:28:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
 <5f7b0a4d-fb3f-43bc-9f2a-3951222cfff2@arm.com>
 <ec8a398c-727c-420a-9110-5362ce35f786@arm.com>
 <f1876bc1-94f5-46d0-b51d-12537d979830@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f1876bc1-94f5-46d0-b51d-12537d979830@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM8PR08MB5841:EE_|DB5PEPF00014B89:EE_|DU0PR08MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 251c065e-13ca-4ee5-90f5-08ddad7d2f23
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?REFQd010TmxQSG1ncTVBaVpCTk8zaTJCK2JWRWhWMkd4WmJSd0tlNWxtdk1q?=
 =?utf-8?B?dE95b1AxRTkwRnp2WmVpYW5UV2d1WHptTVlWSjQyNlJjWkpjdTFleVlvSkhJ?=
 =?utf-8?B?QUhpcUNmMTVDN1d5MTYreWNDQ0didEtsSFRNOGRlUWMvMW5UUWs1bXBxQlhW?=
 =?utf-8?B?d1pYeERKQktRQUxCbCs2Sll1WXJYU0VFd1pTdEwvSEJLNkVlWDhPRTQ0bWZp?=
 =?utf-8?B?R3RvSTJYZnJkKzdldzJtbTVKMWVabEhzK3hmN09EU0ZjTjBqSXhsd2NMT054?=
 =?utf-8?B?SVNXOFdzcFRUN01pOWF2WUozWlJpWnduWHRBSm9qcFlEK2FUbENtL1hYNTJQ?=
 =?utf-8?B?eXorNHZDT3Y2RG9sNFJHc3EwRE0yTGxyRWR6eGFlQmNrZXJ6cGN6djN5QlE2?=
 =?utf-8?B?UGxwMTZuYmgvU0hGbVd0SStUdTRJaHcwMWd4bUlwazl0b01FQWIxZzlJOVVL?=
 =?utf-8?B?VTVSUW9LdTRqVVVPeW10ZUpQK3dDeXpzTVJwMytHR3lxWFMzQXF3UXdUZGd1?=
 =?utf-8?B?eDlEQUhoaFQyUSt2Sk9uNUNqVzhJS1FDMVVyZmpKSDd1VEh6SGZsd2l5M0Zx?=
 =?utf-8?B?OFdKOE1LUVNPUGMvby9MOE5HZnhOMUMyamFLc3BUZzdDSVZETnpmUndxT3ZH?=
 =?utf-8?B?OEtpbXhtaUc5MC8yQXFWeUdxUmEyQkJ4QWJrM2dueURMZzYwMU1zRkEvZFFn?=
 =?utf-8?B?OEZqUVVUUE9xdTRzTk0rUGYrS2g2WmxYLytSdnZ5MU1uMFNWSzRuVFVkOGg3?=
 =?utf-8?B?QkhWL0t3SU9rOHBDeXV6c00rbW8wNnEraG9YUUNRMU1xR0pHV1N4WFhMcHQx?=
 =?utf-8?B?Rjd4dkM4b01BQk1xTUZzNHNqQkJXQTI3ZGMzN0crRVNjbi9WeS9pNkcxZTl0?=
 =?utf-8?B?VTFqeVQ4TXBlUmF1RTd1M3V1b3E3Q2ZOL3lxZGVHMUt0Ung4V1ZuNjFBa0Rm?=
 =?utf-8?B?Wmt5ZHB6WEdUMW5JQWlDSlBjNzIxbVBHcGxWb1NkY3lham1Pdm50eUR6U1Vq?=
 =?utf-8?B?N0VxdTJKQmVBcE9DbDE4cHpiRVBibHRrRURoL21sZzhBempXS3pjUnpIL0Rt?=
 =?utf-8?B?Zk54c25oVHdNdzNBWTJXUmlaNGs5K1NHak5pdGtzRmR4YU5CK2FjVGRCVENK?=
 =?utf-8?B?RmtrR08rOEk0R1VHeUZwNVZxSktUT0FFZWZrNnBNbEo1N3R4MmlvNXlDVlFM?=
 =?utf-8?B?Q0Z5U2pteThCSUVNZk5nTCtTVFZ2VWRyam5xWC8xQ3NQMnd4LzVKUjNQQ1Zn?=
 =?utf-8?B?YjVyTFdJbStvMEl3ZVhvV3U3MFhFWGVzeUNCYmFIZms1N2VkZXJZd3pydlpF?=
 =?utf-8?B?U2xiMjV2WFlpaEhJTzVZZXZGNjJRQi8rTG44bTVGdFQzVVRDeldPMEJLeWsy?=
 =?utf-8?B?ZkxSQWRwcUtYc2w4MHB0cHhNT2JjZDJXbGlVYjc3R3VyNVB0SEhrRkg3ZWNJ?=
 =?utf-8?B?MHUyaXdESzJHRmNMQkxyaE9nRGI2b0xlbVhDd3orK05aeXFydGJocDdQdmFY?=
 =?utf-8?B?MCszZThHbzE2T3l1cnZ4dTZPc3VLNG5ud3F5TjFDcUVDZmJ6Qi9BMk0zcTk2?=
 =?utf-8?B?YzdmVFVyZ3B5ZlVjTVhzeGtpMmI1WGxVNnB6SFBVd1ViSkJ4eDJ6UlovaUNM?=
 =?utf-8?B?NG0wOWIxb2ZIQUdUMHdOSUkzNUNKYzUyK2U4V0NLN2NTVDZFd3VjeHR1eGJN?=
 =?utf-8?B?QzBQbFdZb09UOXlhZ0kxWUs2dno3WE10UjJETWsvVDNjTzkxK2VSOGpTaytY?=
 =?utf-8?B?aXY3OTQrRlJTdncwYXN2aC9JZjVuWGJkQUFoUzJXWTM3V2RheEZDaGVkUW5S?=
 =?utf-8?B?NEpzTkRKUDJ1b2k2VDFpSHFEQkJubnJjYmtIUFdVZUdCT0xnSTA1aEpkU1Az?=
 =?utf-8?B?QVpqRld6dzZhWjlhSzNHUEhCQUtXMVpUWC9ZWkNHci9WMUE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5841
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd57530e-91d3-4fc2-127e-08ddad7d1b1c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|30052699003|35042699022|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXV6Wlg0dHJNNDVIZDRCU0FNN2Z2eFBnN01wNWdWTkFFblc4VVhkc2VEKzB0?=
 =?utf-8?B?aEl6M05XeEcwS1pJVGhWU1dkQ0VwaXl0WFlFNFZCMGY0TXpveWlGQUtpeFJa?=
 =?utf-8?B?b1lsRDJxMVRsSnlTUkxaV3JRQTVUYTFyOEUyZXJsbWtrY1FqSHV1KzlBQkU3?=
 =?utf-8?B?M21ML1VLRjVwVWI1N2xwQ0xJWjluczM0MGFRZ1UwVHhhMHVZTjV6UVpQNFJL?=
 =?utf-8?B?VlNHZndOWmtqSkl3Wk1pVHhPMXA1akRNbzZ6NEk5Q0F6eE1HRXNTM3luUzhV?=
 =?utf-8?B?MUZUOGpTdnRHVkNkZk1sOGgwTndOZ3NmQTBXVlpLc3QzY2xWSGtUb2RRcExj?=
 =?utf-8?B?OGZuWW5LYmhESUVQSmFaUkVBVkUvRWRqMW91ZE1YS01TTWxuRG1LWGRLVEQr?=
 =?utf-8?B?ZHlZRDZENjFWdjFDZ1ZRTDIxeW10a0cyYlRsK3JiNlQrR2QrYmpPeElNamlN?=
 =?utf-8?B?Yk1QRytjYzZEVWpBcUtWTUJpMFQxQWY1d1IwblRwOU9iSXNRSTlxNHhta0NJ?=
 =?utf-8?B?OTFXeFZMRDh3WU00b3lmdk5YbC9lRnZ4R1lmbjI4dUN1YkNxaTV2dFY3Q1pU?=
 =?utf-8?B?blJsUFRpTTFJOGpMRkJ5RFZjY1JCa0ZURFJaRE5ZRDM3WVVkb2JGbjJkTXRH?=
 =?utf-8?B?UDNoanM2S2lHL2NRN3Q5djRyalcrVHJGRnI0LzNVbWpzdi9JU2VVY3JvUEU2?=
 =?utf-8?B?a1pXWTBDei9ESm0wZWlRUHBVb2xBUGxHaVJFTjdDM0hhT3VoWFFaZ0IwWkZE?=
 =?utf-8?B?NTJaQjRiMXM2eU5DRTJSZWNCWE9UOUdxUVJDanNPVmkyMklwVDR4V0dVZXRE?=
 =?utf-8?B?bkZNcEh3aU1VSng5b0VROXk3NkgwL1g4b3hUbGx3OE5hZGdDS1F3N2ViVlF1?=
 =?utf-8?B?L2w3bjJkVUhqeWl4VjVmeU55eEZrOWNTOW5CSURiajcrbEEvY09BT3NqUTFY?=
 =?utf-8?B?cVQ4di9IRjdtYmRFOU5velErSG5MeW5MV3NNZnpTbWorTG8yVkVtVEFWN0k3?=
 =?utf-8?B?cW9IdVFKZkE2RCtzQ0VFQWpiS0xjbnFjcUdjZ1E0K2FlZHJ5QTRhR0krcHps?=
 =?utf-8?B?SW1Hb2RCSkd4cEVmb1RiZVJFUUkxZlF1bU9LOTVieHMzMkp3dHNQbUhKUmJk?=
 =?utf-8?B?RjFOdkdpdmFZTzVKMjZVWTlBdU13SFY3WkZUMENHN2s0L2Jqc2wvZmNQSDdo?=
 =?utf-8?B?RmN4SUJNQ0dLcWFMZ1NxUC9QbWVZbnJucDZXcWxsbS9xREd0V21JMUpLUmpC?=
 =?utf-8?B?eExuT3RPdmhSWk1GTjJqczMyM29RYXpKOEVvQ3JWYkhpZFg2MTZzMGhzeWtC?=
 =?utf-8?B?YWZlZ05TT29EZzNic2pBek5LVitKdkN3NkIvb3JKc3drMnRDdllQNUpNcHVW?=
 =?utf-8?B?NW1MTkdUUUJMNVM4L2taMlorbEp6ekxLcnF2ZU1qd09kZzZ1enBFdThZSXlh?=
 =?utf-8?B?c3E2bjdkK2YvS0FkNlN5VjBxK2hSNWpBSkJFdk1yb09yeEFnbnRtS1VpTWY3?=
 =?utf-8?B?RmZxLzQ1ZHY0eDdUSDg3QnRyaTBKaXhvMmNHMkNINnZmVzc4RnRhOFF6U1J6?=
 =?utf-8?B?eCtqL1ZVQ1ZhbkpvT09TbjMrZ0dWcjluRC9HdlQrb0JickowKzBBQmhBU3lr?=
 =?utf-8?B?Wjc0cXpSZEpDeGdBLzFORXg1MmpiWkptU2xSdHRLL0lTbmpDZEZ1d0Z5S0lt?=
 =?utf-8?B?TEw3TWFQOGxNanBQNW1Ccm5uV05YQ1BDZFZ5elhkaFNHOTk2THhKeGc5Z1JP?=
 =?utf-8?B?M0V5WndYMGJNNlF4QUJkdWxVckRJL1VxUUdQczF4dTlBSElVejNVcHo0alhw?=
 =?utf-8?B?T3VtZjFnN0lRY25sOFZ1QXprcDFlSWljb3dHWFRGdHJZTVBOWklNVDE3RUho?=
 =?utf-8?B?UnQ3eGhXdncvNnpZK1FHZnl0bUtmYm5Mb0Era29EREZIOG9DWFo1UkZqWVA1?=
 =?utf-8?B?WFZrOEc2VXZMR1ZFSTlRV1B2U3Axb0QySFAzbUFsS2dJVVpWUUZtN1RTUzNI?=
 =?utf-8?B?dUN2Y2p4Y0Q3S2RpN0pEVjI4R0hiQnkwTnpReHpBSmdDdDR4WEMvS3JQVDh1?=
 =?utf-8?Q?jW1Vt/?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(30052699003)(35042699022)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:58:52.8660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 251c065e-13ca-4ee5-90f5-08ddad7d2f23
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8640


On 17/06/25 1:42 pm, Ryan Roberts wrote:
> On 17/06/2025 04:59, Dev Jain wrote:
>> On 17/06/25 8:24 am, Dev Jain wrote:
>>> On 16/06/25 11:37 pm, Ryan Roberts wrote:
>>>> On 16/06/2025 11:33, Dev Jain wrote:
>>>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>>>> because an intermediate table may be removed, potentially causing the
>>>>> ptdump code to dereference an invalid address. We want to be able to
>>>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>>>> between two different vm_structs; two vmalloc objects running this same
>>>>> code path will point to different page tables, hence there is no race.
>>>>>
>>>>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>>>>> 512 times again via pmd_free_pte_page().
>>>>>
>>>>> We implement the locking mechanism using static keys, since the chance
>>>>> of a race is very small. Observe that the synchronization is needed
>>>>> to avoid the following race:
>>>>>
>>>>> CPU1                            CPU2
>>>>>                          take reference of PMD table
>>>>> pud_clear()
>>>>> pte_free_kernel()
>>>>>                          walk freed PMD table
>>>>>
>>>>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>>>>
>>>>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>>>>> we are safe. If not, then the patched-in read and write locks help us
>>>>> avoid the race.
>>>>>
>>>>> To implement the mechanism, we need the static key access from mmu.c and
>>>>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>>>>> target in the Makefile, therefore we cannot initialize the key there, as
>>>>> is being done, for example, in the static key implementation of
>>>>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>>>>> the jump_label mechanism. Declare the key there and define the key to false
>>>>> in mmu.c.
>>>>>
>>>>> No issues were observed with mm-selftests. No issues were observed while
>>>>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>>>>> sysfs in a loop.
>>>>>
>>>>> v2->v3:
>>>>>    - Use static key mechanism
>>>>>
>>>>> v1->v2:
>>>>>    - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>>>>    - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>>>>      the lock 512 times again via pmd_free_pte_page()
>>>>>
>>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>>> ---
>>>>>    arch/arm64/include/asm/cpufeature.h |  1 +
>>>>>    arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>>>>>    arch/arm64/mm/ptdump.c              |  5 +++
>>>>>    3 files changed, 53 insertions(+), 4 deletions(-)
>>>>>
> [...]
>
>>>>> +    pud_clear(pudp);
>>>> How can this possibly be correct; you're clearing the pud without any
>>>> synchronisation. So you could have this situation:
>>>>
>>>> CPU1 (vmalloc)            CPU2 (ptdump)
>>>>
>>>>                  static_branch_enable()
>>>>                    mmap_write_lock()
>>>>                      pud = pudp_get()
>>> When you do pudp_get(), you won't be dereferencing a NULL pointer.
>>> pud_clear() will nullify the pud entry. So pudp_get() will boil
>>> down to retrieving a NULL entry. Or, pudp_get() will retrieve an
>>> entry pointing to the now isolated PMD table. Correct me if I am
>>> wrong.
>>>
>>>> pud_free_pmd_page()
>>>>     pud_clear()
>>>>                      access the table pointed to by pud
>>>>                      BANG!
>> I am also confused thoroughly now : ) This should not go bang as the
>>
>> table pointed to by pud is still there, and our sequence guarantees that
>>
>> if the ptdump walk is using the pmd table, then pud_free_pmd_page won't
>>
>> free the PMD table yet.
> You're right... I'm not sure what I was smoking last night. For some reason I
> read the pXd_clear() as "free". This approach looks good to me - very clever!
> And you even managed to ensure the WRITE_ONCE() in pXd_clear() doesn't get
> reordered after taking the lock via the existing dsb in the tlb maintenance
> operation - I like it!

Haha! It indeed was very confusing, the important observation separating this
from other cases was that ptdump only cares about reading the tables, not about
what it reads.

>
> I'll send a separate review with some nits, but I'm out today, so that might
> have to wait until tomorrow.
>
> Thanks, and sorry again for the noise!

Ah no it was not noise : ) Sure, enjoy.

> Ryan
>
