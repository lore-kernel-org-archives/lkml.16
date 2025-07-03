Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32A2EBBAD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538467; cv=fail; b=cbTJbgQW1y/YS7CcKOcRlNTfi894FXBXurvl3/q89dVfoOWWZCa1IwMKaCTnxkw4XWPUHi/UDcf4OgcEPWN9Fj2fHxswrrSvLSLLar47CtwJKQubFOoSg92K6/1lZ+sKFKCjOGbXuPy5drRRcFltn+RWYcAbVUzmjqPBU/SZlYg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538467; c=relaxed/simple;
	bh=9wLYgDTu2TIZbeDdFX0N9N4pSsIBilVZltI+Bh19txQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iJlziPB9G9GOlH4hOmcpUjx1bTWxdLX+NCVUL7Qv/h/GY6m7ZfIxk8nYrtIM8ODUDQTvi1iJGWqzX2qen4Xq/mgSXGhk1Ab1clY5yOCIstRRgkbwGOegDYVAik2xNNsb6yFutwHqFvxUA/go9xtp+ssEXUgWfXSWFwt6jKjq7Mk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Az/ezWlK; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Az/ezWlK; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Az/ezWlK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Az/ezWlK"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ze3rE6VNEBl/g/yhcB9h2bhSYpn6gq79KfeTdw0SxJi0BRZyk6yfPgQSm5KMjYpcUGknK+ODHqHMNguvPRv/dAQ2QipFRxEBmjQCUDavBRnlMj15Mpa2bHq04cIbBBQgkFIbsOtfUo3wCLJsTVG5vgnbm7UxPqsn8OCw8m3W3BxDFh9K1t6U4296+I2rjvM/gZ7PJDulHuhOt6Ylj0Nu+R7XD0hK3fu5pypE3MVNkx5deHhbOUb52ENkUv+6fRFanMYyKMIUngVLkUPSJDGGN07oXJfVZFsaT7m/ZXTnf0OwnY/M037BTAYrx6DVrL4BFfzNTioetlnvW+Azmmwzgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/4RqmSIm5eHAOo2LfGHusac3XRT0mUlkX6Jk+j9hvY=;
 b=RdTqMmsTUMHMRWeuw5FmVrJMvL9cxmNXauYyEJIBkgK4E+EOa5s4ogG9qUXYWKnxh7Y4npnMQOOHnFBSn7IIPcW4lOsoVD7nQTGuF24yL5t2+CWeELQh1gDevzstX3DCzURuknIqkWSNDf38mtqDNxqKWd+9eMh2Jky7o+WBzzg2u8yBYwmxdjrGhAWkPaJ1Iyo8r269mnUJZi/XW50QwlXxuprB27tOn7dK9/DFP7Lx0j/NjdF+VuNE6qXXGCCMh9XDQ9cnRMMdxZUvJXsi3n/1JN7byA3wloOYDzz6ELDfBZ4OMKMH8kIHj7HC4p4/3eTcK2M87I9Wv7/SOSXMcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/4RqmSIm5eHAOo2LfGHusac3XRT0mUlkX6Jk+j9hvY=;
 b=Az/ezWlK+wceYMj/2ZzFgNl2ZHRJ8/ah8HIObLUCCVBwlJclGIcy43hBssyIHmjok2NONgPQa3TgTxkWHwDNuASKCvQ7YgELEQ3zV0H3wdbzrr91HitL+h6/lEGa7kRf9DJLYNHiztqFbtaR0aCRjS+XvuwqPWLXLns9bmyyIMg=
Received: from AM0PR05CA0088.eurprd05.prod.outlook.com (2603:10a6:208:136::28)
 by AS1PR08MB7634.eurprd08.prod.outlook.com (2603:10a6:20b:476::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 10:27:38 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:208:136:cafe::8a) by AM0PR05CA0088.outlook.office365.com
 (2603:10a6:208:136::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 10:27:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20
 via Frontend Transport; Thu, 3 Jul 2025 10:27:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7snM+Ug0ypf+otSc6NeUarCQkDZseqGLwY41FDKdAMiH/sTLNYd0WItV6nH8lvzakjrsnH7Wfj+DLKKiIM6T5tfrgKCz8Dpw/REY3c0VVYZ9/BgBQwqoZ1Xh44Q9bkMqReRHqtHJkSLrTI9dtMeQGIOlZ2eztoCXUP8uZToeE25HmBb/Cyq41aGMqRHc4jNDRxeeHEJ/DiSZAnAFNbT9AUglJTWseXb08mwASYxci3b9YjP6m1nGyohYkbTatBJQ7On40Q6roeL6F+v00XzZZ3vsOmhrCa+IR1gtJQ9JPKVpNE0BeQUXpKybAV6CI1QF9RLUriLLM9I13jqnt5kCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/4RqmSIm5eHAOo2LfGHusac3XRT0mUlkX6Jk+j9hvY=;
 b=FTDgbyBpGdJ2i0BrnP5i3+ufeoTWgi1GzmMvzxa/iTCOev+fNIIDqr/e0tLtnxZxgqZ49F65H/mUzDSkDxydTKXJUnDy0HtrMd0q9DSVKq4uKLy18xDs3tgX5ELH1TrCH4EdaZePR4tXeSkXK1pVWHtyqkORe2gWM9yzVHV1q8qL9d6/eXbPL+Cvx3g8Ji55Egqu35ux/tMkvbJgCOT268vZ0dVcHmVY/+FIa5udWrIKY0IxWlz7vfg+8nOG++5oVPKXrMNZUspfpZh9mpNYAFTUKtaVQUenmTjF2A7H+ge/7Yw/JSZtOmIsMV5vD/4EDcucSnj7em3nb0BDl37E2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/4RqmSIm5eHAOo2LfGHusac3XRT0mUlkX6Jk+j9hvY=;
 b=Az/ezWlK+wceYMj/2ZzFgNl2ZHRJ8/ah8HIObLUCCVBwlJclGIcy43hBssyIHmjok2NONgPQa3TgTxkWHwDNuASKCvQ7YgELEQ3zV0H3wdbzrr91HitL+h6/lEGa7kRf9DJLYNHiztqFbtaR0aCRjS+XvuwqPWLXLns9bmyyIMg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PA6PR08MB10472.eurprd08.prod.outlook.com (2603:10a6:102:3d6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 10:27:06 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 10:27:04 +0000
Message-ID: <94a8e495-3830-4be1-94e0-4e4ef9aa5b90@arm.com>
Date: Thu, 3 Jul 2025 15:57:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] khugepaged: Reduce race probability between migration
 and khugepaged
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250703054823.49149-1-dev.jain@arm.com>
 <1d82c930-be52-4983-9fd7-099df487eb48@redhat.com>
 <ef3f1916-a8ca-455b-bc3a-adb69e3d3242@arm.com>
 <a81bbf40-7c71-4f50-9cb3-e4c5e4f84f25@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <a81bbf40-7c71-4f50-9cb3-e4c5e4f84f25@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PA6PR08MB10472:EE_|AM1PEPF000252E1:EE_|AS1PR08MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b44611-ae40-4767-b314-08ddba1c3bd1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UVF3UnlvKzYrQzBBNFN5RzNLV2wzaW9PazNUV2hvaTlJUmlzMjlRWHZmVnRv?=
 =?utf-8?B?OG5BRkQ2cUhaVkVPVnRtdTlQV2p0N1lhOEFISWU1RnBMaytIMEZMVzAyaEFl?=
 =?utf-8?B?ZWFmU1dEZGYxUmdjcXRGSmNHZU1rSysvU3RURURFQzg0OFpjTWI2cTJmbHVJ?=
 =?utf-8?B?WnZTR0RXbkU0Rk5acWxZaEpnUTBUVDNIa0k2QmZzTkkxS3FGWFlRWXUwdzBa?=
 =?utf-8?B?V3M1cTJiNENaTmlrWnc3b1NpTEdmRm5xYTEvZmV0ckNwL2E3K01mZi9lNlFu?=
 =?utf-8?B?WWRXYmtaaVg1THlFQy9wSGdmVUF5cXVrajJPR0hsU2oxNjcrWUdLUnEyaTN3?=
 =?utf-8?B?TDN1LzltdWFLWUhvNXhld2xLSnVYMVBMeVhIRzFvYTM3REJGWkdHNGdsMUty?=
 =?utf-8?B?ZkErVjk2eDlvVnFvZGpPbmZLUUJ5Y3d4eWxDUFlJbDdsZ1c5aW91L3Y1RkVT?=
 =?utf-8?B?eXU1d2dzQ1Z4NHhWUHN4dFZuU3ZHR256ZEpIclBQbVVJV291bDB4NzFrRGVi?=
 =?utf-8?B?VGhTeGx1ZENTajNwaVBwTDdKRStBVFpadEV4VENQQmtTNkRQUVYxd0dmclNG?=
 =?utf-8?B?anUzZC9jdXNDOHU3UlVsTC8vWDNHdXFVOWJWNHowekpOVmhva3pJWks3cnVt?=
 =?utf-8?B?NmZxVThzNUg5MUZxQTZPcFcrZGVCMFp5SXFxVWhhUW5zdStqNHZoNVM5YWJz?=
 =?utf-8?B?TzNzNE5MeHhheTM5bEpkczNqN2JYWDE4dFowQmhDYUVBK3JRdFlIRDE5eDli?=
 =?utf-8?B?RFlxOXBJS2lWY2t1UXBYWi8xUTdrLzlSNVc5UUc0NnJmcnVxSjBwditGWE42?=
 =?utf-8?B?OXBmU0p4amhnVWYvVWkwTlI5bHdTcTNIZUxXRXM3bDBDbmF1UE0rT00rYTZ2?=
 =?utf-8?B?UzMwTTBpbU5vSWdXQTc2Z3Q4QzFYYWxMNXE3YVExWWZJbkF5RlZJQ0dodEJW?=
 =?utf-8?B?bVA5bEdqZVU5eG1KamNNS0VoSHlzK3B5cUNmRmU2UnlPQ2dvaWtITUxtOEd4?=
 =?utf-8?B?aURMaGJJa2FHYUVOMFluOExqYmUyZldPYzRkenlRUHlTRDI1Qm9xYjdrdlBX?=
 =?utf-8?B?ekZWbUl1S2JVZTZkNU5lWVhleDFxUC9rUnhkM0VSRmVrYzZsci9ERVdFL3Qz?=
 =?utf-8?B?c3M1dkFSbHJIeG1DZTUyQUxXRFVFVTV4Z0dIaHBYMDJvZnQ1SjZBMVRBUXRP?=
 =?utf-8?B?L0R1Smp3UUNEdFIwa2svZE5Jc3UwSWlaakswQ0JxZjd3UVBoMjdQSWhUUlFr?=
 =?utf-8?B?aDVIUjVxVzczYVNFOEVYdmNqNHovQXp3REhzQWpFUVlRbHU5TkdqbnZ0VWdI?=
 =?utf-8?B?bVRTWWVHd1Y0cU1xMWRNb0NjQzJudHcrSnBuSjhpSWpVbzhJYjhncFZCRCts?=
 =?utf-8?B?UVQvbVA5ZTJ5N3JZS25OOHRuelljYkdwQWIrN2hKaSt4dU1kcDVLM1hNSmVC?=
 =?utf-8?B?aHdSWmpZL21kUXFxYTN3WXRSL2xJT0FvY0UrYXZnUkZia283VmhaWURHWXpG?=
 =?utf-8?B?Ly9TVWNGN1FkallDTGpZRzFISDJycmpUTm1NZVdYcEtsdkFieG51eVU2ZGs1?=
 =?utf-8?B?V0U2Q0xSVldmUytNLzJZSGhQOW1oaTE4bXN4aXFXVUgxaEZRV1R3MzFIZlZn?=
 =?utf-8?B?WCttL3RZRG9XTXg1d1lIYmRxL3g3N3hPUitJczZ6MlVUa3dHTnRTRnNiRU5o?=
 =?utf-8?B?T0xYVE9ZZ3J5d2FxeWM5eGsvUU5xUThSenBMak84WTZiTkl1SENPRUFZYkQy?=
 =?utf-8?B?VThyRnE5Tm90T3NmV2R3dlp0dTZPaGYrSC9zWkFKR2VZRHJCbFhnVGlGMmg2?=
 =?utf-8?B?S2phZWc0RnVQbjM3bGhCNlZFdUk4dXBLcDM3RmI5N3FYRFRYK0VIZ1FLNDJn?=
 =?utf-8?B?MUZSSDBCQWdaYTRDSHdscS80N1lLY25iV0pJVDNCc0xsZDBNMDUvcEltS0t2?=
 =?utf-8?Q?HvmEPFvNeq0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10472
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9647a4f7-755e-42cb-b182-08ddba1c27db
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|14060799003|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2IwZ2UzQWZWUnc1dVY4SVJyZGdYRC9Jc2E2cVlYZkRDbXNRcG9TNVhLdU11?=
 =?utf-8?B?RTg0Q3VBUi9xQXkzZjBzblBDWHFNK2RHN1RhNnJueWxKTEx4aUx6VjUxUUFp?=
 =?utf-8?B?bW80ZG9RTDZ0UHdPK0NRUTI2bnEwSE42NGQyRzFXaVNPd1hsVkpXWk9SR0lE?=
 =?utf-8?B?SkNzZTZvakZ1MVVJejBjUnVVZ2tsZlFQU2hUZk5UUWpZTGNSbmxTZjZvbkRa?=
 =?utf-8?B?MGdKRUVCWDBkVkJyVUZDV2dXVC85NDZ6dnJzU25ERk1vNklaYjkwL25TcHRG?=
 =?utf-8?B?YVFFaUp0NEZKWWNLeEliNjhGSllFZGorajhIREZsUnZWcWMxSzZxanp4K05S?=
 =?utf-8?B?UHY3TTdveFlIQWNnWTFPZmhYTEJmVlJ4STR2TUlUbHlabW1WV2psL3VzeERY?=
 =?utf-8?B?Y2tKRlVRZ0JBNUxUdFRkTTh0WGkxYlA4WlJ3NFpXNnQyZU1DMUVGT1I5L3lX?=
 =?utf-8?B?RWNMb05NRUFoOTB5R3JLbDc5cGltTGZmZTA0VXViRisyY0R3RjV4eGprVy8y?=
 =?utf-8?B?UXc2RWQvcDZ0QVFwZ2hhRVNMK1ZlTmI2NHF0ZG1tRkV1Qjl5RWUzaXAxYjhD?=
 =?utf-8?B?Z1BGNDEzUUVLYkUwZERyQXY3MElhVTJEcWd5aWs5TzUyZEQ2ZjMxbk9OSjlX?=
 =?utf-8?B?SlA2Q1B6NGlTZUNZR1M0Y3hsWVVQbTA2eTNNNEVmV0x5SFVuNWVIWWFEWEdR?=
 =?utf-8?B?c3pNUE8vNGNxY0UzYXFkZHh0dUZ6SUtYTkJ1NjRPS3huTFMwQUhEWEU1WFdU?=
 =?utf-8?B?OGxBTmUxS2lDa0dWZ1ZFYTE4R1JSSTVXZlFXSVFOQmdWSTdOWWd4Nk43czBL?=
 =?utf-8?B?bzRMeGtaVXQwTU5NMGhjNHg5ait2aTFmdDJUcDZ5bXlPWDVyaUZPRTVYbnNm?=
 =?utf-8?B?dWR0VmZVV1JDc3RVUU9UeXZZZEhxRitMZGxhbzVmQmxra3Zybm1pTURIUWl2?=
 =?utf-8?B?ejU5WnlodXA4QStZUUJzc1dSbHd6VTJDMm9LejQ0N2R0RllqN1hZNjRRWk0r?=
 =?utf-8?B?aHdReGVPTWp1VCt5aGNqbXVwcTNoaGpUSVdaVlV4N3VIbEZmYk5KTFhmZVRL?=
 =?utf-8?B?Tk9hcmk3QVVFZTQxdnpnTkxDeFZyZCtVcFJwOU1EcTdYNlNRdDNnSlk4TDd4?=
 =?utf-8?B?dlVhQitROFd0VWZJSnlMZWY2Slg5bVhlK2l2QWMrVW5hYkFKQ0JsanBFSEFN?=
 =?utf-8?B?S2MxODZBaTVkRVMrSnZ2R2VFV0lySU1yY1RLR0luc050N0h3Y1lRRDA3QVBW?=
 =?utf-8?B?V0pWbTV1MnVPUzhtYXNUNVc5TEszSzVqa2dEeGhtdWp6K3pyNG1zdXhkSXc4?=
 =?utf-8?B?SDZyc3Y4V2dyOTlET2U4aENxazlWN0tlWmZuSlRoUlNadGtGdFVTRVI3ekZH?=
 =?utf-8?B?UzBqaTFQSHQ0dlVwQ0ZESGFPeXdIeVRyMW9zMStjNnd4L2sydXo1OVpLV0RE?=
 =?utf-8?B?c0U3TlhCclhNaHB0ZTlIZDJMQk92bGtYVTNUV3ptVWUwNU02VkEvVVhKcE5K?=
 =?utf-8?B?bnZBcmVSV0lWcy9MQUsvaVF0YXlMYjZRSUNZZXFLeGJ5MUVkaTdmNjdxRlFh?=
 =?utf-8?B?Vlh6UzZYR0twN2tnTWMwREJ6YnlMT2R6eHVZdWpPUkhDdFBTd1hXQTk0U1Jn?=
 =?utf-8?B?YkM4T3NzQXk3ZGFiZXdkRlc1NVBWK1dvV25XUE1LNk55R1ZDeENuNE5obXNx?=
 =?utf-8?B?dE5DeGdMeFZjb3czQzMzSGZOZkZHcldrWFNqLzR1cVJ5c2RqU2hHSnF2dFl4?=
 =?utf-8?B?RXZmaHE3UzZaYTFOSnVYMTlkUmdJR3ozRWxIeDdEWlFNVHgwK1Bpc29Sd2VP?=
 =?utf-8?B?b3VXN2FsazNrTGdkblRmazJOYTlCdXJCQkludTJIQjIwc0s4cjhmV0s1bjQ5?=
 =?utf-8?B?WjNhL3VCZENoZkNtaTE5cjlOaHl5QVFzaDNXUkFnUDJ1dUgxYWJpWnUwM3BI?=
 =?utf-8?B?UWxtOE0yU2RjQnpQVzF3ZHpHV09XMzZpS2VxNVB2RDMvZHJPZG1DRkM0SzMr?=
 =?utf-8?B?bktZUmNSOTRIUml2cUluZm9aSkU3Q09kWDhneXEveDRUUnpaY0p3Nmp3NFZN?=
 =?utf-8?B?c2R3bXA4bTUwdWd6cDRhUkVPOXVyV2p1UTl2Zz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(14060799003)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:27:38.0926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b44611-ae40-4767-b314-08ddba1c3bd1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7634


On 03/07/25 3:39 pm, David Hildenbrand wrote:
> On 03.07.25 11:52, Dev Jain wrote:
>>
>> On 03/07/25 2:55 pm, David Hildenbrand wrote:
>>> On 03.07.25 07:48, Dev Jain wrote:
>>>> Suppose a folio is under migration, and khugepaged is also trying to
>>>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from 
>>>> the
>>>> page cache via filemap_lock_folio(), thus taking a reference on the
>>>> folio
>>>> and sleeping on the folio lock, since the lock is held by the 
>>>> migration
>>>> path. Migration will then fail in
>>>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>>>> such a race happening (leading to migration failure) by bailing out
>>>> if we detect a PMD is marked with a migration entry.
>>>>
>>>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>>>>
>>>> Note that, this is not a "fix" since it only reduces the chance of
>>>> interference of khugepaged with migration, wherein both the kernel
>>>> functionalities are deemed "best-effort".
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>
>>>> v1->v2:
>>>>    - Remove SCAN_PMD_MIGRATION, merge into SCAN_PMD_MAPPED (David,
>>>> Anshuman)
>>>>    - Add a comment (Lorenzo)
>>>>
>>>> v1:
>>>>    - 
>>>> https://lore.kernel.org/all/20250630044837.4675-1-dev.jain@arm.com/
>>>>
>>>>    mm/khugepaged.c | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>>> index 1aa7ca67c756..3fdefc4f4984 100644
>>>> --- a/mm/khugepaged.c
>>>> +++ b/mm/khugepaged.c
>>>> @@ -941,6 +941,15 @@ static inline int check_pmd_state(pmd_t *pmd)
>>>>          if (pmd_none(pmde))
>>>>            return SCAN_PMD_NONE;
>>>> +
>>>> +    /*
>>>> +     * The folio may be under migration when khugepaged is trying to
>>>> +     * collapse it. Migration success or failure will eventually end
>>>> +     * up with the PMD still pointing to a PMD-order folio, so return
>>>> +     * SCAN_PMD_MAPPED.
>>>
>>> Nit: the last part (, so return ..) is obvious from the code.
>>>
>>> I would have written
>>>
>>> /*
>>>   * The folio may be under migration when khugepaged is trying to
>>>   * collapse it. Migration success or failure will eventually end
>>>   * up with a present PMD entry again.
>>>   */
>>>
>> Thanks for the suggestion, but
>>
>> PMD pointing to PMD-order folio necessarily implies present PMD entry,
> > > but the converse is not true? For example it may point to a PTE 
> table.
>
> I see, talking about orders is confusing though.
>
> "with a present PMD mapping a folio again."

Sure. Shall respin.


