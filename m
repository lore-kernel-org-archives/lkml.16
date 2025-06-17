Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D548179BD
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153133; cv=fail; b=ruqDE0ih1kFGrQuwSsvCKmj59mIRqJdUzEfJXMeKWShijkc+v6mi6nHwzPWkMeOsEicic3Gu9iJ+Ns8XNAp+WGRjpZIiqXyI1CTjxXHnjwca3QrHmxDWny+hBnfYN9BQrAV65PKorn56NFxX2yqriX3kXlNh/U9gO0HRPoHWiJc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153133; c=relaxed/simple;
	bh=NIGioxGkScdIPAmly8qUUmz1nOhvLh7JlfTjvVzv76Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WVo4SFdRhMbKr5h1c0PSciO+iAY4iVtYk7NM2ppkSsjJQ4yjOP+8Ggk3I9wiSZxCZi7A6zRYEkocJCnzeib1t9WV0himEEJVIliWyjhs88Z9ZQWhV0c7ZgUtBgr/AIw/ujhidLU/4RW1iOI+5bFfvj+wUTSGLXk0Q0FiIs+GNmw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qnrYPbXC; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qnrYPbXC; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qnrYPbXC";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qnrYPbXC"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G9jS5w0D1Ay0BoyYLb/jxmkZGMd2RmRaZlRu95myUFr5N2S/KOEzIkL6Ns6OBH1M6kTLD5o0LRIQgreFrmHqWLq5OtRB3C98bbqaPCWC+g/G9ytYFeW60Xw/x1YJjDAq8iOte2U4a2laZ439pjF+Drb/7kWt2jGxAuTl1wEa4aS6rdvA0lYxtwQF8HGSrjTPH9pqH6wzMk2dWXb7/FepxWtAZAZMdtS1rndXEXsbBSMjMsz2yPlJrIPLWmc+skV3pn6OuAe2DV+P7W8xTRy9TDzNAi9jd3182sx1BCqTUHBJeUiTgZCQaOKg+4KsPoC6pO1SdKoEfKoemX7EWqLVgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYdMkwESRNRO9t8dFOp28DZSfZR10sZ2HM8UGGp5X9g=;
 b=qWTr9yUShOSp/DpsWT/Ynhr0a83qU4rOh/KzCApdaoHQvoZ6c8yFI0bpIm8xhHHDPTPVN3VioAphiou4afZ8ztcHsCkrzVZl0xxs3Vw2ybDiDyDqfZMSPxsWyt74Ym6Yap5Rbz06A+0C06AyA/0SEYFaktTDyf83FU5qySAqBBikKpqljiG7xpSI5VTHAXIvh5HvILMM7XvofpOvQIWgBb9hKHw3lGORsn4E3blAcRoitvPLo22tJP+jha8jzQHrVQ0/CDrz7fU9IWlGIHr05B9vJRMXe2+aMKzhVNasnZ2HMGKmRvuPZbgAQxJAbnMOe0sYqrtb85mhwCwXRJr4vA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYdMkwESRNRO9t8dFOp28DZSfZR10sZ2HM8UGGp5X9g=;
 b=qnrYPbXClzDLLZmAy2oigjeMYPiI6IBb9x1TlWTpJLfUX82kSjWNhh3KqNNIljylsZ3i5nev4FN4xX/sScEf55labYlDjm9L+vefTcCtjqg+YaQ0PyrwESIiozNSU7HJq9PZO6Dop3rP2WR3lRJL0IBsG2b9NjQoMWqYKsEqDzo=
Received: from DU6P191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::29)
 by DBBPR08MB10650.eurprd08.prod.outlook.com (2603:10a6:10:52d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 09:38:45 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::52) by DU6P191CA0043.outlook.office365.com
 (2603:10a6:10:53f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.30 via Frontend Transport; Tue,
 17 Jun 2025 09:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 09:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhJNt2RnEYxsSI7LySFbDdeVLDohcof1PLlQUsl1UEQ9al2Kw8zoh0+kYrCfSmpFoIqJyatt2NZn2UTf3Ff1j4XeZLQEVoET2nIFdeOaCxzWVZyB6PPwtCaS7N9hVl1OiUmHauhPEV6/jhP+chIaQ5TeSjx5zLnyT4RvayzmDYonxAKkL0mmb0tjST9Wh1D+06egxUKOPIIxDQeW3BonfvQKf9LeYGc+kOXdH00Hni0VhPIIs3fSXtEodC/bKnH+aSEG/NNTqOFICNTr1oDcoM7HEG9G2aRKn/lOIvy6KGPy7fv1rRRkPNF7ME2au6D7ejnRzaCtcaVgV0CzDDrZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYdMkwESRNRO9t8dFOp28DZSfZR10sZ2HM8UGGp5X9g=;
 b=x59Hcj7uXzVe1rsTI4bcYXmMgxin4g6TdRPNAQUHMnQ7VPxg/xFIBcrPkMWSoMf2rhEJclj0vtBQM/z1FqWsZpDhwfzbZkUeRsAFSJjbdqJrFKu2k0DOe8MEbN5eg5YPpTI1jtzO+ThM3OViaR0gP8+bF0kiRuHEt6hwUwdmyJL16mD0cPOR774rGA18zevvmhSSgoRG3NDlPJ+5rOkzL6QYgpeGoQeE9NyRYI7eFROWXPhHao1POSgRom6em8L6bi1M2ZmsukqhHUAAIKHOEXpE6hgux8abkaZsFokj9A3IeVBGHuB5qWPTc+PG6ltT9Q+/aTgsVDMo9uBJ9VzqlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYdMkwESRNRO9t8dFOp28DZSfZR10sZ2HM8UGGp5X9g=;
 b=qnrYPbXClzDLLZmAy2oigjeMYPiI6IBb9x1TlWTpJLfUX82kSjWNhh3KqNNIljylsZ3i5nev4FN4xX/sScEf55labYlDjm9L+vefTcCtjqg+YaQ0PyrwESIiozNSU7HJq9PZO6Dop3rP2WR3lRJL0IBsG2b9NjQoMWqYKsEqDzo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB8649.eurprd08.prod.outlook.com (2603:10a6:10:3d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 09:38:11 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 09:38:11 +0000
Message-ID: <f34b8dae-82cb-45d1-837a-a02f0db77760@arm.com>
Date: Tue, 17 Jun 2025 15:08:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] xas_reload() in iter_xarray_populate_pages()
To: David Hildenbrand <david@redhat.com>, ziy@nvidia.com,
 willy@infradead.org, dhowells@redhat.com, hughd@google.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
 aneesh.kumar@kernel.org
References: <20250526063524.22597-1-dev.jain@arm.com>
 <918d552a-085a-4529-8f20-a060b1f0c9f1@arm.com>
 <5bbf39b9-ddfc-4d97-8f08-8bd43223982f@redhat.com>
 <8b8ce450-0300-4eed-a80f-2e8e18fb4e11@arm.com>
 <b2a08c1f-190b-4e20-b8be-704d12b406c8@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <b2a08c1f-190b-4e20-b8be-704d12b406c8@redhat.com>
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
	AM9PR08MB7120:EE_|DB9PR08MB8649:EE_|DB3PEPF0000885F:EE_|DBBPR08MB10650:EE_
X-MS-Office365-Filtering-Correlation-Id: c47d7c57-05cb-4dfa-466b-08ddad82c07e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UnRFREdCTStGSUZ5THdXVHBleThKek1qa0xQTjNIdGdWQnA2Zkd5aGFrZEFU?=
 =?utf-8?B?U2lQQU10dDcxdmR2WWV1cUZkakRRWVBQQXZRV2lOcXdxZmluZVVwMHVnZFlr?=
 =?utf-8?B?OHNVYjFLdWNNaG11S1NSRnRHUytrcTEwWE5NZk1rN0RUcWh5Sm5xYW5xVHRZ?=
 =?utf-8?B?c2VvcXQrTWtKdGZRYmlpY25SQTh2RkFzY3lkWDBPY2pnQWsvQmkxZWNjUTZ5?=
 =?utf-8?B?K24zQUlmL1dhbGVGWVl1cUpXZ2g2K1d4L010QUtFVklXLyswVGFMeXR5ang4?=
 =?utf-8?B?RG83WDlpSFpSdHFTdjRraFA4ZzZlTjV1MzJOZVdHTzE1YW1rWVFhdWlCV1BU?=
 =?utf-8?B?d0dGRWYvemZiTm8vYk9meFVtM0RaSDBBM010ZlExOE5saUpYWEprcWlTWFhn?=
 =?utf-8?B?d2NqWTBWY0pyLzl0TzlXeGhkcC8wQ3ArbHA2N2hjS29KTTJJa0NuU2lOb1lY?=
 =?utf-8?B?QjMyS0lhNUw0OHUzVW9SMzgydkF1eGF4Vjd1OEJjSmpDNWRsdDNsOGlTZ1lD?=
 =?utf-8?B?YUw2Mk94cVZ0R25EWmFtMGdJZjN3MWJmemUyL0xrVTBEVXlVMmM4eHM3czBX?=
 =?utf-8?B?VWJOYVVpcTlqTVIrRTJrS0NvVVRyN3h2SWtmNGk0aUFpd05wUWh5d3g4Qm53?=
 =?utf-8?B?Sk5PRGxIeVhvY0pqaGR5RVY1Y3dJT3F4WWVhWFJBNmVzWFJjV0JKN0N0QW5Q?=
 =?utf-8?B?ajFOME80aFJUR2I5K2lrSkJOSFlZOWMvZmxBOFpCL1F5VUw5S3ZUT1JScTBl?=
 =?utf-8?B?OHlLSFJPU1diL2ZVWEN0ejN0QUJzN3h1WkFWZFYvNUNlcEJwS3JNUlFGTXZD?=
 =?utf-8?B?aGdQcEMzSHNVenZyZld1QXV6K1hmdXlGR2FsR1YzZWxmck5NcDZXUlVqSUkr?=
 =?utf-8?B?NXhKL2pwMU13NThMbkgwZGREejlPTmJSU0Rqcjd2eVFQamtUNGg2TG02S1dZ?=
 =?utf-8?B?NlVLRGhoQjY1aEZGOHg3ZUxOK1FVS3ZSL1J1QTVwRkpaUWFLaFRyNmdDMm01?=
 =?utf-8?B?MlhudU8zQThxOE1QUllXeG45YVV6UzA1a2xVbzBVVkRPeWVaSHhFamtMWEEy?=
 =?utf-8?B?SVplaW9MU3Z3WC9nVVBQUmtGdXNGNWNjcXlnOWl3S09nU1VES3VZUG5PN3ZD?=
 =?utf-8?B?enVsVUtZZy93NTY5cVNpbUUxa1d5Tnl2UEFqcnZ6YlUvYUtRREF3dHdRaEZL?=
 =?utf-8?B?OW9xQTFmQ3Q0SS9FQng4SEhlVk8yQ0FueFNZT0VxSWF1M09qa0RCWmdhUEsw?=
 =?utf-8?B?UStDd1NKc0pSNjZkN0k1NVowMm44Q243WUJNSmw4bXhONVZHQjlJdnVqOWQ4?=
 =?utf-8?B?MjlCeHh3UkxaOHVCRWcyYTVCMUJkREVmdkVJbzE4K013Ry8yWUJBNWFUSEhY?=
 =?utf-8?B?WUtjcTB2Ylh3b0lCeHVsalFVR01xYmthTjdiZmp1WXNxV3FSbm9OV2NaLzRt?=
 =?utf-8?B?Ui9iaGV5YnFML0FkUGxXWG5rRGY3ZXYzVnBReit4SkxOWG5OaitJK0MvSmtH?=
 =?utf-8?B?MTN3YXJVVllrTVJNNFVuaUZkOEZRSksyOVFMOFNLT25mek1MRmExTEZUWEVs?=
 =?utf-8?B?cEovNDQ0TE9kUzI3TnplTEU4KzBTZmtiaEFDdERMeHcwcW5sUmd5MFpTOVhT?=
 =?utf-8?B?TGliRkFib3BVWFVaN283b0ZwQmpmRU0wNFVIVmJwbjI0S3BWVUsraXg4V0s1?=
 =?utf-8?B?K3FkeXBrU3p1Z1lDbnhSWm12a3pnSUwzNDh0aS82RUQ4dW9iNmVTYTRML0ND?=
 =?utf-8?B?QTBPamg0Z1owcjNSV2c1L2U4aUxRamlXZDB6blBWWFkwMmpmZ0dqblMwWkFn?=
 =?utf-8?B?aXZUbUVrWGV1WWF3RUk1RDAzUTU3TkJ1WGkxRStva2RIVldZeG0zRFdyY3Ar?=
 =?utf-8?B?aWpQeWsvb0J6eVFZWjJDSUtML0pxYSt2akM2OHZwYkZFVmc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8649
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b1183d6-df21-4f22-49ab-08ddad82acdd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzIzSDFXMFMwR0hrKzRMSzRXWTBxa1lkZWUwZEhWNnVSWUV3RkI3d2FjTTQr?=
 =?utf-8?B?cThIcjZPTHkzQXJHcW1yZnpMWVR2enVEaEFuME9JVVdNOTVNRi9sb1hjZnN0?=
 =?utf-8?B?T0NjRkwwVkkyb0pDWHZJbGN0akRUQ1hyR0FMZjhxWnRZRVhraFJ0WHRQblc0?=
 =?utf-8?B?YkJIZHZRd0hFSHBUUVlFNGxuN0MyUmNTOEdsUU1GL244UDNOdzkyaWJkWURP?=
 =?utf-8?B?VU1RVnY2and5NDRsZVQxd25oMHRVVUZOaG5nZ2l1L1QvK0lkazYyN2JHUGhU?=
 =?utf-8?B?T3R0NXlXbUhiaUNWWUx5REFJdlZhdFpWQzh4aHNmVXFFYWQvR0NPRVRHdHhZ?=
 =?utf-8?B?OG5IUzc0OFY0bUVyd3NueVpnL0pmZVU3Y3Y1eGhUM292Zll2RkM4ZnJ3QUpI?=
 =?utf-8?B?VUlaVTVTTE5kcWZrajA2VlE0UUxKaFFjUGs1Mzg1Q1pOVlEzWjRMVTh4dXM5?=
 =?utf-8?B?dklScHZZQUJ0OFhRVjRvSWFaYW04enczUEx1RUFweUhOT2pqRkV3bmpyRjhI?=
 =?utf-8?B?b1lTSWh4N1I3SDhZSHBXcDRJY3NoYWcwM2ZlTnFySVFoUVVJMU9KRWE3RFlW?=
 =?utf-8?B?TDBTTG9LYXh0MnFpT1QxWDJONXg5Y0NoczVyTFdSVWtxczI0Zk1nMDZRTEJR?=
 =?utf-8?B?cWJpM0NCczRTenVBTm8rQTRyRGh6WFZJODNKeVN6a0NyUXRnL0l0dXhFUXNs?=
 =?utf-8?B?OTVBQllUSFpDQys0c2ZjZmFFQlgvSmlmNk1IWDYwL1ZSb0JiZ1o1ekVhb3BO?=
 =?utf-8?B?OXBuWit0c0czcS9jajBiWXorbVVOYjdOczR4aGVUZktvK0hxWlIwMXN6UDAv?=
 =?utf-8?B?aEc5ZnRGQnZQdEc1eGRyVW1qZEYvME9JRVd6MnB4dmw2aThHd2FvQzZkeCts?=
 =?utf-8?B?L05ZZnlGZ0hSOTBOODQxZkZQVzhjVXhIUStPNk94NFF0MUxKYk9GbnljbUZ1?=
 =?utf-8?B?VmZ5Rk5WZ2lQKzVaUzF6NzhSMWwveGRCTzAxQm1aM3ptRU1qKzJ5cnd1aTBJ?=
 =?utf-8?B?R3ByYVppbUxudnF0WWlnaDFPSnZ3djQ1SXY4UThLT3ZOSHRqbERWUkJVOG9n?=
 =?utf-8?B?aXpzZXd0L09lU1VYRm45SGQrQXQ5ZVF5RkpoWlVjUVNLd1J6TWJqYXpyUEV3?=
 =?utf-8?B?Z3ZzOUkvbFp2Nm1KdmdtNit6dkRXcnM2RFNIQy83dW9yM2dtRUhycTJTbWlB?=
 =?utf-8?B?MldpM0pHRGMvdlJkSW5HOUx6SzZuditLRVhvNVJhL0lMNEtMNm9JdFRRdUpQ?=
 =?utf-8?B?VC9TY3JZMnZYNDRHSVFLM3pvK2xuK1JRVlYrUW9iZnlwRnRoN0RZT0U2MmNZ?=
 =?utf-8?B?L0NseUsvVHZ2ZTBNTVZEREUrL2hXUGdlN0ZQSU81UjQ1blp0S3EwUGVoY0ls?=
 =?utf-8?B?NWMybEhTT2pXdjZ4cG1nWllUY09RK0I3d1VScHMzZzlqNFVpZDdHS3lEM3p3?=
 =?utf-8?B?Z1FHdkovTGllZXB5TjZjNUNRMGUyZ0Y2UE8rU3NCV0FTSisrMVFVeXpxV3Rs?=
 =?utf-8?B?dEFiNW52QUVEZGx1Rk9vM3VsOHFoQ2hUVjNOdTZ4ZkJKSEV0aml6UDkyY1FC?=
 =?utf-8?B?UlJMekxKdlh1ZGZLZW05SzlsM1dWemh2Tzd6TjVIUEcxMnIzdHR0L0MvNWlQ?=
 =?utf-8?B?akFFenRPNGtyd2hiamw3amFOYVEzdWtyRXNlTGtOSW13RTVFU2ZmT2pKWDFr?=
 =?utf-8?B?UUh5NHdMeXBpclIyU1dhaG1OQnRaRFdidmMwSk1VeVM1aGJMOHoxQU5WSXJi?=
 =?utf-8?B?Z2psWlpKcVlsTk5UcVNKTFB1ZG51S21vYWt1UTlqM0QwWUVYTFl6SDVORXFl?=
 =?utf-8?B?bmgyeVlEaVY2QUhrN3V0VjR1bnYrMkZyTWVqOG9yTE14a05Kb0dsL1V6cnNH?=
 =?utf-8?B?V0NLazIwb1ZNVS9oVUdDSU1zZm1FSGNOQVZyc3NoeVFTaW1nTG1BS2pwbHha?=
 =?utf-8?B?aHBybFNFV0tJSTVFdWJhRlFpQkZFRVFjdHlHdFVPdnVGaHd3RitSbDFzczUw?=
 =?utf-8?B?R3htbWdCWi9tZ2h3M2RQNjhxVHJURkRieSs2ck01M05DbThMYkVma05YSWtU?=
 =?utf-8?Q?/bhGVo?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:38:44.2355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c47d7c57-05cb-4dfa-466b-08ddad82c07e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10650


On 17/06/25 2:56 pm, David Hildenbrand wrote:
> On 17.06.25 11:18, Dev Jain wrote:
>>
>> On 17/06/25 1:17 pm, David Hildenbrand wrote:
>>> On 17.06.25 07:10, Dev Jain wrote:
>>>>
>>>> On 26/05/25 12:05 pm, Dev Jain wrote:
>>>>> Hello all,
>>>>>
>>>>> After doing an xas_load() and xas_retry(), we take neither a
>>>>> reference nor a lock
>>>>> on the folio, and we do an xas_reload(). Is this just to reduce the
>>>>> time window
>>>>> for a race?
>>>>>
>>>>> If the above is true, then, there is a negligible window between
>>>>> xas_load() and
>>>>> xas_reload(), because only xas_retry() exists between them, so why
>>>>> to even reload()?
>>>>>
>>>>> Thanks,
>>>>> Dev
>>>>
>>>> I do not completely remember our discussion in THP Cabal; I recall
>>>> David Howells maybe
>>>> saying that the folios are already locked, so it is safe to do
>>>> xas_load and then do
>>>> a folio_get()? Even if we remove the redundant xas_reload(), I still
>>>> don't understand
>>>> why we won't need xas_reload() at least after folio_get()?
>>>
>>> I think the points where
>>>
>>> (a) this should go all away soon
>>>
>>> (b) there is the expectation that the folios cannot get truncated
>>>      concurrently. So we can do an unconditional folio_get(), don't 
>>> have
>>>      to check folio->mapping etc.
>>
>> Well...pretty sure the file read path is taking the inode->i_rwsem or
>> i_lock somewhere,
>>
>> to synchronize with truncation/reclaim, can't figure out where. Reclaim
>> takes the i_lock in __remove_mapping and
>>
>> then freezes the folio reference, so the read path must lock i_lock
>> somewhere.
>
> I mean, if concurrent freeing of a folio would be possible, the 
> function would be horribly broken :)
Yes, trusting the kernel overlords I have dropped my search : )
