Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F2242AA3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291283; cv=fail; b=kLrJcF/UqfZThbHxaUOZ6cjFZDgcwGIVmADadJ1kjpusYHTKBVWFlTKZiKjiqetfzU+iXvkRawB20xEQkgtpU0n8buY6612EXgcyBfB0vWJKIfGuiTpMAkuOzEqcfnuOz8SQMJwbgafs9HdYlaN+RzYCViZSrrdz49YRUxwYO0Q=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291283; c=relaxed/simple;
	bh=aSsKFbqIuvjKAEp6tt9EwZZ+eI53HO6SXvH9uX2wqdo=;
	h=Message-ID:Date:Subject:To:Cc:References:In-Reply-To:From:
	 Content-Type:MIME-Version; b=ZxJMB/Z+ACLDmCrgrxVsCKcyjrgR1q42mseb5vo/V56h+km8IQgZ8OW3QIMtDOHDSUmnDvTa+ieQR4/wILKx3HVyfyhNT3w/e/AKnoFyUWFD7v81mm5jC9KuntzY4CIIX+SeDapVvV5xJktdXPFLBSdydhhBxRGHFS2c+WSlxVU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ixojrhgw; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ixojrhgw; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ixojrhgw";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ixojrhgw"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Fa0mzIjUsZzLok9mzHAzuK/bgwDuNSX7vojzQVW7/AD2w5cBNHLR10mm+Sbco3lRAxYfzcKIW8e/6w7JF4JW3e4jRDMvdNjiPfJWb+zAioHfbDh9qciTM9dYXc2ielvQwHJ5+nHhdLSSB1DSFoaKEAWEzRUJG1t4Xsgn91I5U5vEd7gR2GArEHrEB5apkEclbzGV/cwgHr9Y2F3coWvkT51uG1euUrbkpPkAIMD/ozuqVl4DtsCHxmh97w9AORHc0h/zvZ8tyVpBunVVnLdch5y5CNQMwQQIwcHmi0R7/fCv7RWq0r3qYzZPJbkdB4lzj8ozz4EYzu56wK1MNGgthQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q23B/bheZJWtXRLtVMYTBaN3MDcH2jtNdnPQmKwqLHU=;
 b=Kh74aQqouYh4yNGScXuEAP2Qo/H6wRopJzFuf5MygZIKbu0FwhwdJAp+o3bQ4n3hW8q/f/5YddwpvB8OXmTraidodaH+wU9xp4QAHldqTvn+x/X6Wh6sALvmjXlFE3J4iwlltjv6vb8emGXKKgsy3snPGM7avUkazEu4y4NWFERtuZrzpv7vQ6mHtr8JW9pVNsAWGVFBs7tzW84Dp1ar4HAHVP3e9vsXn4lf2nvPECavNPcJAPJE9Df1INh7HtRh6PzJo1Z9Ent625kSH14UruWWOiaghJeJrzw/PhW6QcjJWvD4k2I4k2BnQ01+Qx6x3svlm1QlJcSTnBd4mvS9NQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q23B/bheZJWtXRLtVMYTBaN3MDcH2jtNdnPQmKwqLHU=;
 b=IxojrhgwQU+m8B9di03cH+btfHghpIzNd/coG3biQxA3QBS2NQZ6GtY1k3Jg7HTmL0CvbJ0KXyk6lko2EjYscoK8r3KPGnHIb5ndi8gCYG7lLsyN8ms+1irPIZ6sTrn6/CtOG21XFZH71WqFZ8xtEceZ//4G9frBBQIVF8xKtfI=
Received: from DUZPR01CA0072.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::10) by AS8PR08MB8248.eurprd08.prod.outlook.com
 (2603:10a6:20b:520::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 13:21:12 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::76) by DUZPR01CA0072.outlook.office365.com
 (2603:10a6:10:3c2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.23 via Frontend Transport; Thu,
 10 Apr 2025 13:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Thu, 10 Apr 2025 13:21:12 +0000
Received: ("Tessian outbound f9fef7c7dc50:v605"); Thu, 10 Apr 2025 13:21:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28cedc2feb26c060
X-TessianGatewayMetadata: Zl/t4WJbABHbwSA6Yo2Nb1hZG6QPNwU22cSbG8OV+OZmpGGnGSQtaCxjm8nUTALmHQ04BXH4DNnGgkUad57i7bS6xhx7i1359GkDt6037b/7mHbe1pOjbx95wyBmKJcK3QcxLzelbEqwjh4cOL892f9yO7nTYYaWMqaUz2btiec=
X-CR-MTA-TID: 64aa7808
Received: from L179db3970da0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 91C69F77-D902-4BBF-9B79-6AB8E584FE1B.1;
	Thu, 10 Apr 2025 13:21:05 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L179db3970da0.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 10 Apr 2025 13:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urAFwHCv9AhX4cowfW3haF1hf+VLemcYsxMFo6FDzHlHBjOHKDW3dOhKnMI8988MAQgU9lF021hVt2fGFyj3YOyqpSHKLaNmi8fGtw1iCcHQ8e+d9YAVRQE8GWyp0uI9P+Jh3S2MzZ8xKqJJlbCLU+tjvHdOvnCM3KSXXM/8TxkIGkv4lcDJ/wsechXVARkEeekf/jRstJ8J33mgmpG8J8m2fsqJ+D2weLhEsc1PFbNq9jA0pibImJwogRQzPfu3tQoQQYGQO5AktKodz4Na2cGgulkxNZvVkvS/09Y50Ey+TE3zKlGFZXPoh76+3JDIytiAf82/SufbfNf+2BNQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q23B/bheZJWtXRLtVMYTBaN3MDcH2jtNdnPQmKwqLHU=;
 b=DTrkxGDnC+ERBqvfOmPjW5RW1yOusb8irX92uXLSp/0guNGD5z0Xb1HtN0nT/AHuI93CLl8T5wDxqYuQ/G+b6EEgJ5yD1E69R/xLYf+P36CzVk0QtDYc8Y+yeys7Iix88jzR1FZ5YmYLHtWDH8L9UskwSHvHOuFKkA26282LwlYbVArlwoYj9BgzXuyHhzxuUsBw4/eYciEaSRCl921reZZuq/2GXujvCiXwsRZvbM5rdap++f2AG9JcyHfJR1lK3BgXPh5hF+ZQlbWBKEMZh7tGBbCfwlYwBooiiX2hhdkqVtV5AXRsHCEKUbPrr50JpRvh77F2UwsXVErd5tOaiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q23B/bheZJWtXRLtVMYTBaN3MDcH2jtNdnPQmKwqLHU=;
 b=IxojrhgwQU+m8B9di03cH+btfHghpIzNd/coG3biQxA3QBS2NQZ6GtY1k3Jg7HTmL0CvbJ0KXyk6lko2EjYscoK8r3KPGnHIb5ndi8gCYG7lLsyN8ms+1irPIZ6sTrn6/CtOG21XFZH71WqFZ8xtEceZ//4G9frBBQIVF8xKtfI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AM8PR08MB6595.eurprd08.prod.outlook.com
 (2603:10a6:20b:365::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 13:21:01 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 13:21:01 +0000
Message-ID: <a661ba42-9393-4070-9e52-dd19df2d6880@arm.com>
Date: Thu, 10 Apr 2025 14:20:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] drm/panthor: Make getting GPU model name simple
 and extensible
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-6-karunika.choo@arm.com>
 <20250321090254.667a86cb@collabora.com>
In-Reply-To: <20250321090254.667a86cb@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0553.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::7) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB11200:EE_|AM8PR08MB6595:EE_|DU2PEPF00028D0E:EE_|AS8PR08MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 08aed526-817c-4b5c-bec4-08dd7832907b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bXlrTzJLSGF2YXhnajMzWWs3MjNBa3VORHMyYkxLQmFkc1NaMC93cWJoUXZI?=
 =?utf-8?B?eGJDR1pHUWlkYk5zNXEyaGFSc1FJRThiT25sNzE5REJNSFh2OUVITlZVY1Zr?=
 =?utf-8?B?b3lLOFNYdVAvVzBSYmxsa0htRzlBZmxVcCtxMkhJWXVzRGpjZFZlb0p2YkZQ?=
 =?utf-8?B?N0VGQ2dQMnltQ09xTWlTc2pkQVZiUTZZeldpQXV5dFNZWjVjODRDRlNlUStT?=
 =?utf-8?B?anBadnVXeERoTzlyWHJxNlNMNURQSm5ROXRYWFBxWCtsdW1sUVVsVWtwMlN0?=
 =?utf-8?B?aEhtamxxaFpVV3ZmUnh1K09pcnYrRlo4SWMrRFRyODRJVnRxdldmZHR0WVZZ?=
 =?utf-8?B?ZHp3SG1yRCt4Q3BtOXBJTVlKaVB0dUhDbS8rZGx0Q0NLQ0hPbW5DM01SSDF3?=
 =?utf-8?B?dmFlRUF0MzZQL1B0N2lrRnZsV1NySysyWWVzcHlUenplVTVWWXNIOWF2Wmla?=
 =?utf-8?B?cXMyVlhxaFJnNjdweTZWMWVHM1hiSzVKa3ZHSHZSdjdoSkhiV0Vwbk5QeC92?=
 =?utf-8?B?d2JpaFVjUFBZK1FiRFNiL3VUY0ZEcy8vNXRnVUJRZE1sa3RsMnNPa0o2SW1N?=
 =?utf-8?B?NUZjOHZkdHNHWWJYc3R5blZFeFdPaVJQNXV2M1ZGcWpjNDdhZkNlanIwaUR5?=
 =?utf-8?B?OUc5dnNaNlAvcFJEZjN0YmkySHl6RTFNUE1yMVNXdmRlZ3ZwUGZQekprTVJ0?=
 =?utf-8?B?dnBMYk1OUlNYMU5aK210STJreUw5bjNxUG5ob3NCWFVrZGdJWXRoM0dpaEl6?=
 =?utf-8?B?VWxmREFxcThNT3oxSHdsQy9HWUVJRGdUVkQ5U3ZzeGpDNktja1dBVFk4alQz?=
 =?utf-8?B?YVN1T2pNY3RXVTZNTzZWY0FEZ2ZhU2tNbWFJQ0xhUzg1TUNzdU1Ucmhnd1Ax?=
 =?utf-8?B?VTZscFh1M2ZiOVptL3JOZ3JkZ1NTYmhyVXJQNmdYSUs1Q1I3elNudllWd3dP?=
 =?utf-8?B?Z3NHWTNWaUY3S2s3bVNWQVUvTEszU0lRZGNkWDNDODlCVXk0cEZ1OHhLakR6?=
 =?utf-8?B?WTNYbHVqSVJyQUUyOVlZVlNQREwwTlUrSGRLazllM0tLWnhvSENBZVJzc0Ey?=
 =?utf-8?B?REFpZ2FiTTdTaERLUWI2MmdxVWZUcmpNa1NBQ2dOanNPenNzNkg3VkJsQTM5?=
 =?utf-8?B?N28rWHkyME5JREZXS3FHNFlJMHBqNEgyMUM5ZCtWZEd3VHVFMGVab1FwK3RF?=
 =?utf-8?B?NTlBSmJsbDV2N1J5NXNjbjFyVEs2NVIrZVBXdWhtTUwxclRpNnNuREpPYVJN?=
 =?utf-8?B?NGc3WnVYMkZqWDVLZnB0ZXl1R1NXbWp6ZHUxSUhNb0dsUWpDTDd5VTg1MkpD?=
 =?utf-8?B?RVUwZS9memZzZis0MkNhdzMxbU1xR3M0OEkzNUV3elhKeEJyMUN0TjhvSENq?=
 =?utf-8?B?Vk8zeTRDQWxWaDM1Y2hHSlVBRkNQc1FaR3drVENmc0xua2ZBOG00bmdiTkR2?=
 =?utf-8?B?QThWMFVBRVhsZHdoRS8yeHdsNlJsNTAxb1ozOW5zVUNqYmlzSDAwdVRQeGZJ?=
 =?utf-8?B?UXd0ZW9JRTREd1dTTWF1QzlJc3FiYmpCSm85WnVYQmVZQjcwUHA4aloyVmxB?=
 =?utf-8?B?MmlZOWxuSU9ybE8vS0U3VkF5WlpnK2M4dnBSbGFSWkFkTnNGa2U3N1BGbDE2?=
 =?utf-8?B?RUNubEY4UWx2cUdNS1BkWEdXMktwVFZQTmRLMkc0V3gwRGNROXIrTEQ1WTVX?=
 =?utf-8?B?bk4xT0liNTJNb0JaYmUyMWs2RTVoZjgwOGlJNlFCMktiQk5qaVJVcHJFY0U1?=
 =?utf-8?B?NHVJVkpXU0ptaWxJRmx5dkl1cGVITkxLNHdrNjhETXJVWi9aSDN3eUZMVkk1?=
 =?utf-8?B?djVFQk5oWE1tSHRHb2QxSDQ1bjZyOXU4anZCS0pHdEw3eno1d3ppOXZWWTdP?=
 =?utf-8?B?NHgrL0UxTDBPZGxqakdLcUk1WE1SQ0g3T0k5aTY1U3dVRVFDYVR1U1dJMWgw?=
 =?utf-8?Q?eEnEWnpat18=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB11200.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6595
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:257::18];domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5bdbb536-db4c-4a3c-19a8-08dd783289cd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|376014|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVgvNXpKb29kSzQ0NGhSL1BuSGRzcXJTR0dJcjlzNHZVVzFpTUN0U2hLVFNR?=
 =?utf-8?B?M211MTFEVGQ0VkxjN0RMbTJ0L2FCWVBKdnpHTkQ2NWd4bUNIVW8vbzl0Q3gy?=
 =?utf-8?B?YXQ4azFvM0w5WFEyb3lIVTZtbGhsMEhRbndTVjhHMzd0RTY2ditQQWhTenBF?=
 =?utf-8?B?bDQxOUROY0FKM0hCbmd3d1E5RjZYVXdNL3lpTlVnQm9LZEhVV3diY0FqWGNL?=
 =?utf-8?B?Z2hmUTR5aWFacHpIQ1BrZkhHSG5uSGkyNnkwcFJ6dEtWKzV6Z2Y1d0Y5dGJM?=
 =?utf-8?B?MEZ2bnFibFJpSnJCd1J2QytJMzFoUHd2VkMvTWZJNlhOVW41UHYxVUN1V2Uw?=
 =?utf-8?B?aC9yZ2k4cGtyZXdna1JoMmQzN2pLRVVkbWpxNUlEYTd5QVB0VEN2dWd2S0R3?=
 =?utf-8?B?VFVaMFRtS2FKTW1rSlYzOHJFWENYT21pL0tDUjZCcTRGZXREU0RhV3h3M2Vj?=
 =?utf-8?B?M2h6Q1V3dkM3a08wUnVpTTNmd1dNV3N2UVJsdStRaTZwcTUyMGNSMUFNb2Vm?=
 =?utf-8?B?czY4UVBGRE0vdkFKZmUrNkdBWEtvWTZSMUx1NmpsQXIweGtmM3VEOTZyWU9s?=
 =?utf-8?B?RURPYXlRcjJTR1BsOXovRzNtenEvTjBWVGFHWUV5bmZwamdDdHJoL3pLcC9X?=
 =?utf-8?B?Um9Pb3BtY1UvL1M0Y0NwSHhSOE5kTUhkOC8vZ1JhTi9PdzJjdmVyOWM2UWRC?=
 =?utf-8?B?TTVpQ3Uyakw5ZkxMT240YVNOZTUrMTltZDlzaklHb1lHUU9VRGRJR1JaTmor?=
 =?utf-8?B?YTZrWTNJVnR5TStrQk5oV2VIeC83cVVNQ0wwZnllNVh4dnd2RXpKbDAvQ214?=
 =?utf-8?B?TVRRUnVqMy80ellLd1B1bStxRXBXVW1YZ3lMWnlqQ0RHYkVBbml5S05pZmVy?=
 =?utf-8?B?V0ZLSGpmcXNqbXNDbWdoQVhtMnVlM1c5MzZaSS9XYko3dkQzWlozUEJHK0Fn?=
 =?utf-8?B?Ymk4T3RXTkxLclM4bmh5WStXQ2R2WWFhQ0Y3K3BFR1poRUg3OXRpelRkQ0FP?=
 =?utf-8?B?a01PbTQ5S2NFWEtDYTZhZGM5bjhrSjVJL3hXS1YrcmNQdUUzWEtGV3N6cDhu?=
 =?utf-8?B?RUsySnBPNzBSdjBUM1RuM2lGNWdZZWhqc2k3N3IrTis1SHE2RGJ6SWNBMThM?=
 =?utf-8?B?eWNtb2JBVWsvSCt6amZXMit5UFNaQ1pSaHFVYU5Mcnp5TmRpR2NSTlBVWndF?=
 =?utf-8?B?am9HVTkwNEU2aFJQckdqOGpIeXFRWlZKQk9NdTc4V3RBWGlZNnVHV2EwNHhy?=
 =?utf-8?B?dlp5N2dnb0dac3daZCtmRnJ6cG1uaTVXeTFvVlM2c2RnUWZOSVcvTFY3S0Qz?=
 =?utf-8?B?VkFhZWVLKzdLRFkxNHdMYnFEZlk0RFpvWmt0SXZUR0ZHelFpeUF6eHhhNmlL?=
 =?utf-8?B?aS9QS1VIVzhUWEI5QXRWUDBPZUlhTlk4aFMwd29FQm4xQloybkV1ZExTY2tX?=
 =?utf-8?B?Vk5iemxRVUhsYnBQUkdzcVVHaE1RNEJZdEI2VG8vc2cwT1RBVUVIRUdZQzd0?=
 =?utf-8?B?VXV1RU5Mc3NYVGEzN2J3elhSL0RYZ0RHbE1yMXc4ZVMvYkRQejRROXBia05w?=
 =?utf-8?B?dXRqamJJelRXUHRFQitYRkx1UnpFbFlqMFM5M3UrZTZVcm5PeDBGdTB1OGpK?=
 =?utf-8?B?WEx5OG5LMVFGeWFNaEppd3hJanZYSGozdEVmS01mSDVvaG5obE55UFpucEIy?=
 =?utf-8?B?UWtGNXF1ZDgzWm40UndmV3Nvald5Z3hSVXhuamtCNHRrbkMyeldnbmlWbkZv?=
 =?utf-8?B?MmhSMjlXMzhYM0N5ME1LVExLdk52cGx2bXV3bXJTU3hvK3FFdSswNnNGdFk5?=
 =?utf-8?B?SGFKL1NFU0twZWNzVXgzRTBHeHpZME5Pb0RYbkZSb3FuMUJTNmp1TFJURjF4?=
 =?utf-8?B?bDNvenFKVkEyMGVJRDFOYklDT1hscmVlZzdxRVg3aXNUOVpCcXhESnhZc1Y4?=
 =?utf-8?B?MFNSMEgyWUVqVWxMNnZrTWJ2Qjl0SGZjcXJhRG5jdDN4NVdTa1ZkWmd4RVJ5?=
 =?utf-8?Q?aEC//3KVvRsdpTa1IBBZDPmvk32/Co=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(376014)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:21:12.2955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08aed526-817c-4b5c-bec4-08dd7832907b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8248

On 21/03/2025 08:02, Boris Brezillon wrote:
> On Thu, 20 Mar 2025 11:17:37 +0000
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
>> This patch replaces the previous panthor_model structure with a simple
>> switch case based on the product_id, which is in the format of:
>>         ((arch_major << 24) | product_major)
>>
>> This not only simplifies the comparison, but also allows extending the
>> function to accommodate naming differences based on GPU features.
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
>>  drivers/gpu/drm/panthor/panthor_regs.h |  1 +
>>  2 files changed, 18 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
>> index 4cc4b0d5382c..12183c04cd21 100644
>> --- a/drivers/gpu/drm/panthor/panthor_hw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
>> @@ -5,40 +5,6 @@
>>  #include "panthor_hw.h"
>>  #include "panthor_regs.h"
>>  
>> -/**
>> - * struct panthor_model - GPU model description
>> - */
>> -struct panthor_model {
>> -	/** @name: Model name. */
>> -	const char *name;
>> -
>> -	/** @arch_major: Major version number of architecture. */
>> -	u8 arch_major;
>> -
>> -	/** @product_major: Major version number of product. */
>> -	u8 product_major;
>> -};
>> -
>> -/**
>> - * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
>> - * by a combination of the major architecture version and the major product
>> - * version.
>> - * @_name: Name for the GPU model.
>> - * @_arch_major: Architecture major.
>> - * @_product_major: Product major.
>> - */
>> -#define GPU_MODEL(_name, _arch_major, _product_major) \
>> -{\
>> -	.name = __stringify(_name),				\
>> -	.arch_major = _arch_major,				\
>> -	.product_major = _product_major,			\
>> -}
>> -
>> -static const struct panthor_model gpu_models[] = {
>> -	GPU_MODEL(g610, 10, 7),
>> -	{},
>> -};
>> -
>>  static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
>>  {
>>  	unsigned int i;
>> @@ -66,29 +32,34 @@ static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
>>  	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
>>  }
>>  
>> +static char *get_gpu_model_name(struct panthor_device *ptdev)
>> +{
>> +	const u32 gpu_id = ptdev->gpu_info.gpu_id;
>> +	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
>> +						GPU_PROD_MAJOR(gpu_id));
>> +
>> +	switch (product_id) {
>> +	case GPU_PROD_ID_MAKE(10, 7):
>> +		return "Mali-G610";
>> +	}
> 
> I a big fan of these ever growing switch statements with nested
> conditionals. Could we instead add an optional ::get_variant() callback
> in panthor_model and have the following formatting:
> 
> 	"Mali-%s%s%s", model->name,
> 		       model->get_variant ? "-" : "",
> 		       model->get_variant ? model->get_variant() : ""
>

While that’s certainly an option, I wonder if it’s better to avoid
additional string formatting when it’s not strictly necessary. The
switch cases provide a straightforward GPU name without needing to
handle conditional "-" separators or similar.

Also, with the current approach, if a GPU is misconfigured with an
incorrect product_major for its core count, the switch’s fallthrough
helps ensure the correct name is still returned. A model->get_variant()
callback wouldn’t give us that same flexibility to adjust the name based
on such mismatches.

Kind regards,
Karunika Choo

>> +
>> +	return "(Unknown Mali GPU)";
>> +}
>> +
>>  static void panthor_gpu_init_info(struct panthor_device *ptdev)
>>  {
>> -	const struct panthor_model *model;
>> -	u32 arch_major, product_major;
>> +	const char *gpu_model_name = get_gpu_model_name(ptdev);
>>  	u32 major, minor, status;
>>  
>>  	ptdev->hw->ops.gpu_info_init(ptdev);
>>  
>> -	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
>> -	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
>>  	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
>>  	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
>>  	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
>>  
>> -	for (model = gpu_models; model->name; model++) {
>> -		if (model->arch_major == arch_major &&
>> -		    model->product_major == product_major)
>> -			break;
>> -	}
>> -
>>  	drm_info(&ptdev->base,
>> -		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
>> -		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
>> +		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
>> +		 gpu_model_name, ptdev->gpu_info.gpu_id >> 16,
>>  		 major, minor, status);
>>  
>>  	drm_info(&ptdev->base,
>> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
>> index ba452c1dd644..d9e0769d6f1a 100644
>> --- a/drivers/gpu/drm/panthor/panthor_regs.h
>> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
>> @@ -20,6 +20,7 @@
>>  #define   GPU_VER_STATUS(x)				((x) & GENMASK(3, 0))
>>  
>>  #define GPU_ARCH_ID_MAKE(major, minor, rev)		(((major) << 16) | ((minor) << 8) | (rev))
>> +#define GPU_PROD_ID_MAKE(arch_major, prod_major)	(((arch_major) << 24) | (prod_major))
>>  
>>  #define GPU_L2_FEATURES					0x4
>>  #define  GPU_L2_FEATURES_LINE_SIZE(x)			(1 << ((x) & GENMASK(7, 0)))
> 

