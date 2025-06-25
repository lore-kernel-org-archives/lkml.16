Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF629E10D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850440; cv=fail; b=POvHFdga/Rlfvh2QlVw5Fk3H4P7tvDE0nyXZWYwA1BZksVenWcmg7mJVNEqpmkzN5fKu3VlHB2OI/n3y4SCuNkUpfmzVwTwyXcGqaoQcV79n2jxmdlaB45fvc5Vz7vy0PlFZAloOi5WLaaPxvR5iM9HfyRMV/Or7ubl/rE3xplA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850440; c=relaxed/simple;
	bh=IzhGBwvAqsTGOd88DQxKcQNFxYUVU2dt+J6aQ8jRAfA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CgxkqpyDY7KaOlqo1i0SWwLcvLnlZRdew/MCa/od9iIfDgZVJO5tBgBQaTT09BN8MmaZX2LwWM0vJTLxBCvFi0Y7x5+oceCvR/C7NRKzzTtvFp8Rm9mXheSUeMae44yv4XPJ6XrPNUK7a5L19N3Z1o6b3+WZmXMPn1zMPVEyYp8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=k1Y2uYC/; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=k1Y2uYC/; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k1Y2uYC/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k1Y2uYC/"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lviJ6aXiZq9X7E0FOhkaXC+64FdAROy/XweDTay8Xz9uoGe9qKSaDBkso/80hEXJsSO7SldIsrdJ5znsJLY1mmteoNBjqrIwxsf5e77ZaItL9yp8c6TrYfW7GOLBuNLh9ocwk6pF1XNj53olu+MD5GX/ElYBKmfTQ0O7I1gsa+cZ1S/bLIu9iAmHfSi1Z3jxXAZjAZ71hLQ9OszdB9Mf/aaH9fdzQ9IiNYt0+cVuQ6V/IwgZaFhnlLgWOD2O0seasxUpgC+N2vDeQo5NbzZDCuf1uDFZT0dTiuFBz6N7SdlNNDnn+vwNfG/rT1D9zZZYIvoQ5KeJez1ZWnLN3nBnXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aObWi4CYewjQSoqPBeHsj8EaezBaF1jNv1o5EOw6OJQ=;
 b=R9C0LrpvChzFkKreZ10hSKVb+jYihbSmgz+4WpBUfnjXGS+oTgyodqBfhFD8mkBCWj9JjGufAjFK0SEbFATJuLijf6yha0wfQPnl+HBS8+VimPBtK4Rcitt2IN8epJ5BpdXwwrDTj7f4+/ynSsqGhVz8pdQvQaKhso4707bdTAqQNppZnKWbeYU6tHS1IxgfFpZzLzjhVw8PZPLF1RkyRb0SE2W4GQtSDD3rtoiQCS4jjwbj3rZIR2EKHvfO8iAlIr6pEPmuwXeqlxhMNIWn8oQsKFMy719DEVD9VBj3rp3+0fRAYn/1+3oW4LlcMdYkhYE9gKGv4qyBNIGslIpV3w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aObWi4CYewjQSoqPBeHsj8EaezBaF1jNv1o5EOw6OJQ=;
 b=k1Y2uYC/yLt00rPzsG62r1hFvgD6w3wsNiRLnFOaBUhcZQyFaIESQLzpxgMTChZpkhuiIW8rgTV3BYXRSTdfGwDpvohbos1nJqDCW5TYuVqER7jsCXBWsorFSQLG0f6hG2B+8Llst1wDdS12SKkpPocDCNyDcM04JYGUl8BBonc=
Received: from AS4P195CA0023.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::14)
 by GVXPR08MB7799.eurprd08.prod.outlook.com (2603:10a6:150:3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Wed, 25 Jun
 2025 11:20:28 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::13) by AS4P195CA0023.outlook.office365.com
 (2603:10a6:20b:5d6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 11:20:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Wed, 25 Jun 2025 11:20:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arclbjrhouir7kMXPzpb9Ctx4daQRkI+vQe358gT8LXzBTUMZQyAkw6mLTgg4/+J+Zn31BglT/3/1E/f2RHED/f+1zRptXHiUza9U5q4Qb6RtEr/LDon87aTeO2fcvqCnZFTdjC/TvLeuhSLLmq7a/9mxXXrleltenYxt0NiE/di1F+sps2YBpV9V12yH+OpgCi2BZfCr7TWSe/nmKv6u4RRCj/U4PbefPO7a0RkZwUYVtxwNTyyqgxEPIyBdRtQHQTgnpQWzrFXoeReZlHWx/Su7eS3siAgzXFXalymX3Yj4di+ne3JKbo6q4ONMvlN096wO02bNWViLG5HvFSV3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aObWi4CYewjQSoqPBeHsj8EaezBaF1jNv1o5EOw6OJQ=;
 b=EH6KDeIj2DPIzuTHu19//AvfUCikmZ4rXt6P/Hcz1FpGV5Wo9zFwKR1ewnL2VxCqd1gRZ5mUlPW5lO5pNr10ELUMw7uEZ4aZkpdQInkEbIHjLLZi64BHOXOeQ+ax6wGSEAcuH5avSMNqAdys/o7MkWmfwbYtOvu3tBFX/2bel4ZZAEC/OpK2w9xfHjZPwDkbE+s7/DSXKjMshFlbAT+nOdZg2LLSMIIsAPa3W11d6P6Rg2s3LLQB8HE5H7KXZ6BTHWZU7QBDlwhoCVnUjppQITfLI2m4KUk2Zvnxb9NYNQTarhL2V0eImon6TivAuvQ+yztQNSGgjckVILhS3jlHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aObWi4CYewjQSoqPBeHsj8EaezBaF1jNv1o5EOw6OJQ=;
 b=k1Y2uYC/yLt00rPzsG62r1hFvgD6w3wsNiRLnFOaBUhcZQyFaIESQLzpxgMTChZpkhuiIW8rgTV3BYXRSTdfGwDpvohbos1nJqDCW5TYuVqER7jsCXBWsorFSQLG0f6hG2B+8Llst1wDdS12SKkpPocDCNyDcM04JYGUl8BBonc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7114.eurprd08.prod.outlook.com (2603:10a6:10:2c7::19)
 by DBAPR08MB5717.eurprd08.prod.outlook.com (2603:10a6:10:1ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 11:19:54 +0000
Received: from DB9PR08MB7114.eurprd08.prod.outlook.com
 ([fe80::515:9f73:5a61:fddb]) by DB9PR08MB7114.eurprd08.prod.outlook.com
 ([fe80::515:9f73:5a61:fddb%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 11:19:54 +0000
Message-ID: <cc0b33d1-a2e5-4c9a-9b9a-4ef3d3bd9606@arm.com>
Date: Wed, 25 Jun 2025 16:49:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() by PTE batching
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-2-dev.jain@arm.com>
 <426ec9bd-3109-4927-a96e-367e882c7067@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <426ec9bd-3109-4927-a96e-367e882c7067@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB7114:EE_|DBAPR08MB5717:EE_|AMS1EPF00000040:EE_|GVXPR08MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 47271c29-dd49-4def-8d50-08ddb3da4931
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YURIbUtVWWdFTkQ3ZGtpaHBPMnFLVitmRXVFSlFSUHFMejc3a3FVaHBpbSs1?=
 =?utf-8?B?UFlPNS9RYlI2NVE0cThBaEZDZEdaZktoaWJPbVVzRVBjOWwrY09RNGZtTjJi?=
 =?utf-8?B?dXJJNG1OUEZBcFZYd2M5VjFWQnN3NEdqTm5RU3oxSE83cjRMWlQ4SzFRSllq?=
 =?utf-8?B?M1dOTW9kWGp2dE1NN3FMcWlBYjZsMTBnMTkyRkk5TjZZdWJEV2tkZTFBNDNq?=
 =?utf-8?B?UmRraXR2b2p0UVA4WmRyTnJ4anlpemZwYVNYbmx4Z0IycVBSeUVUZTRqZG5r?=
 =?utf-8?B?NU1lK2pXQ2xSUmJwOGk0S0Y3bS9GS2dVQk10SjU3T3NLdndza1EvYlBLUFZh?=
 =?utf-8?B?eU5PNnV6OURWQ25PaVZiWEprTnpJbTdtdjhZYU9IVkI1YVdQR21WT0NlWGJH?=
 =?utf-8?B?WEJUNTM2ejZJWXdOVkcySEkwRG9jMnFXeHdPY1BpcVNGNHJMR0c5V0hsWmF1?=
 =?utf-8?B?T2gzbTBQd0orNHozMXl6NmxKQUZzRG1GUllvdmcrSGsrMjdmVml5UWcxU1hz?=
 =?utf-8?B?Y0lXVjN6NkF0VGFvNXR6SWFCeGhoYUtKOWZET1JjSFBTQ3FFSFlRLzVKOEVX?=
 =?utf-8?B?Q2FuaTlJWWNQT0tRVFZoem1tVllOVUZ3VThDQjFxK1FOVzYweXZ3Qmh3bDFu?=
 =?utf-8?B?UldFNS9NL3FZNi9ZN3lxMngvTS9qM1NEV1JsVk5iUXkvNkJYbGFXeHVYL0pj?=
 =?utf-8?B?d0gxNGdjN29ud21LVTBrcUFQWEVXUW1JM3Z0bFFuNFNnVW9WTUpQOWVMOHFi?=
 =?utf-8?B?TVV3NWpXT0FYTnVxSDVucXk5NXVFbE5nWU80U0g2L1lKTVA5aFdQSHVoR0Zu?=
 =?utf-8?B?UkNsZm5QSzVDQXg1Y3N5d1NiNWk4MnFBcGxOYWYwaEJnQkZqYXNSOGhoRWpP?=
 =?utf-8?B?WVZISGx3Wk9iYThJTG1LVjBlYmIyUXJwSXJlNmk3MEgvNXdLZlRrVG5Xcm9q?=
 =?utf-8?B?TGNZcVkzUTlaK3NrY2h0bSs5MlMveU1xM0R5aWg1UHNpR255ZEVaK3VxUzRE?=
 =?utf-8?B?Ykttc3V2bDBCa2JzTzBIYWRac0taNm5tbCtuNDd2aUxSODEyRDVWZzU1Qk9p?=
 =?utf-8?B?T0N4K2cyTHQrK204WFVEeU10cHpNOXhsYlFpUjFrS3Y4WkVscmhMVm5sc3Ra?=
 =?utf-8?B?aklFRkJSWTJ6SVBYMnNMb29GOTEveTVCa1lVenFVSUdBS1VKQmRLQ3Rub1dN?=
 =?utf-8?B?L0oyQVpxVE1FdUkzaHFLWTVGYVdXTzlpU1lIV1EvdnV6QUpxbkZkM1Jrckhu?=
 =?utf-8?B?ZGxGT1Z4bmhzZkY5aENlZm1nQzJBby9ZeG1DekhPcHp1anNCZXVLVnIrL3NR?=
 =?utf-8?B?RXgwb0RYUnBaNlZBRkJ2Ti9pQVJhNlVJUEtId3F5RWFCMnpXSzVpNkdkTnVP?=
 =?utf-8?B?aXIyZUpoQ0dLK3JqWGUraU1sOGRKYVhqckhNM2RuTWV6eCtBcFBqVXBvbDMx?=
 =?utf-8?B?MFZsSEhMVDRoOHEzK0xmaG1zcnAwd2JEWnIwWUlMSUdEb0hZQUxCWVhOK2dP?=
 =?utf-8?B?bEFwRWtacDZLTThMQmhqWnZXTHc4VVZldmlBa2poMG13alFwZ0kzLy9TVWk0?=
 =?utf-8?B?NThzN3gwOUY5dTkvNGh6cDlkdXhadWVCYVFlMmIvVlp0dHdPemkvTnEySi9K?=
 =?utf-8?B?NkFZYjBtL1drZFFQZ2lzZFcydkhQVnVJT1VoTDR3U1BRanQ3V2dOeEVDeDRU?=
 =?utf-8?B?ODF2K2Mvd0VuYXlISmdGMCtZOFpHanhPUEwwL0F0cm1xUythK08xQjUrajFC?=
 =?utf-8?B?dHVpSm5tWVlESVR2eWtrWWoya2dkT3NGRi8zaFlSc0xORzBjVEZIY2xYdk1T?=
 =?utf-8?B?RVl5VHkxWFBBbjFMNFJReGlaTU8yaGF3anRIdVhHU1F5K3VqL0RCcXhOTkFm?=
 =?utf-8?B?ZGpRWHVjdXdSaFpOZFRZZ2NnNkhLUUZ3NlRCclhIT1oxdTBtOVlHcXFmMjQv?=
 =?utf-8?Q?Us/49gUdo94=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7114.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5717
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8413b96b-546a-4db7-9b70-08ddb3da3534
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|14060799003|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXBjRnNxQmw1SGJkZmxEYjJMMkpDbmZ0YlkzTnhpTkdwbUE3VkpDZ21xOFBO?=
 =?utf-8?B?UFNuaStJSmd1RGZxTURZcjBYQzJZRWZxQlZrT0s5c0J6RWhHeHJiVU0vdmlk?=
 =?utf-8?B?Rm4rS2dReVhGZXZvcjRGUnY5ZG9Qc0diQTQwdVNqVmVTTVI2Vmw1WFZCMG16?=
 =?utf-8?B?OUZ5RnN6QktQL0JTOXVrT0FyNjIvUGZhTkZ6YmlaNDBoS0FNMlZWWlN5Q0VL?=
 =?utf-8?B?UTNUelZiZGdRTWZXOGNqTDFROW82U3dseER5ZnJUZVlOSXk1TnNuNGNaY2Mw?=
 =?utf-8?B?ekQ5Yitkb0RzZkZsNW9PcWRZc3dIYitMNU10NVBmNXMxVUwwbTBNNHpUMUwv?=
 =?utf-8?B?bjhpVTU2eE9KNkFGUnd4c1FhbnFkRk9Sc25zOXdKZHp3TkkwckZoc3p1Ulhp?=
 =?utf-8?B?aEgzNlY2UGhNcXNCTUo0c2lRYjQxYU5sNzNFMUZqWHcxM0ZUMldBa0RYZ0xR?=
 =?utf-8?B?d09jQW1JWUNMWlV1TG4xeVVqaExyaEFvck5ueGZtSFlsWDlIaE1sdkxqOGJR?=
 =?utf-8?B?N3E0T1l5VEVobzhxNEo4Y29lYXVDYktLS0gzd2MzWEV1Y3lPajE2ZG9qR09X?=
 =?utf-8?B?NGNkMTJ2RytqSzdjcVZ6cmxpdnRqZ1lTOXFjM3RkcG80aVpKMjNSS2lmMUFz?=
 =?utf-8?B?OWh5U1JTcVptd1daQlFWdXZiWFo1L2JhVTlqRm42Y05ZSkFYSi9JWHdBdGhv?=
 =?utf-8?B?MVc3eDBOOWR5ZlBDV3owVEhOYmlObVZ6MGhFTStUalpHWldPVnpTa25ObjhY?=
 =?utf-8?B?V1R5amR3RDJvVFl6aFZMcjNiZldVeEUwWDVEelNaQzRRSTlFZG9vYnhzRHRV?=
 =?utf-8?B?RkdTcTI5OFVHeGRKTERVSnVoTW02bkhzQVdWNkNZTnVqKzNjYVdKRUtseS9V?=
 =?utf-8?B?VUt5bE1pUGNmQlA1Q2J6N0FBL3VleTN4TldwcktSUVZQMWZLaE5iUzE5SHov?=
 =?utf-8?B?ZkN2QjMzczJJTkxxeGZNbTdSaUo1NGlJTWFYeWxFU01EdER2aW52V0VQdG05?=
 =?utf-8?B?ZXZoL1ZselkrYkp5SkZ2SzMwVXdXbExtcjZvWWVwTitra3p6UXFSc3lRRytQ?=
 =?utf-8?B?MCtzVlZXTGNDMU93ODJBci9RSVhLLy9yWVp5TlFqSWtSSzBnNWlPUWpnSUZw?=
 =?utf-8?B?Wkg2ci9VM3dEc3lUd25RSGx5RnU4MXp0Q1BWTDllMTYyVWhLZzBCMUNFak1z?=
 =?utf-8?B?M3lGN3R5VWtseHRqQy92REFDTDBnQkRZQS9FV0prd2pteXlRTnJJOVltbFh2?=
 =?utf-8?B?V2Zyb3NlR3BvVW9vb1hiT2h0MjdkeU1td1Q1Z3RWUnlDVndUOHhEaktIQm1s?=
 =?utf-8?B?bm1rRTYrRCtsdDdwWDFlNEM0RUtVZ3pYNWJRTDJSd2JYc0RKZ2JxZ2NvM0NR?=
 =?utf-8?B?UWdXSDVjaUpUVEF6a3h5bUVpbHpjaktONVJVaFFzWXFJUWJKRE1OdjVzU0Fp?=
 =?utf-8?B?amR2Ti9ScGFNZ3hMQzJMaVJqRVJLLzVuOU5pV21oZzdWQVBqWUphYjF4L3lI?=
 =?utf-8?B?b3N6NGc4SVc0NitiV3dzaEZ5bmtka3FOb2ZLN3FrT3lKRTROYTB1TjN6YlEr?=
 =?utf-8?B?cHJXQTAxNmp0Rm1XZW9qS0FBNDhTZVNkQ3V3eFhVZjRPTmx2Zk1yV3JzRWEv?=
 =?utf-8?B?U3Fuc2ZFVVAzd25laXdhVU02bVhhYjFXeDFJSVZIUHhaRHBuMnplN2tXL1hO?=
 =?utf-8?B?WFNJaW9VNGFrUDREdE9SMWVTWWY5clVwNlVuYWJLaFh2NmR6L2N6aUIzM3FW?=
 =?utf-8?B?NGlVaUVIb0NFclltdHBqSWNOMzVWeU1XQWNTOGc1dlNNT3c4VS90ZmR2VjlP?=
 =?utf-8?B?c0MvczZuV2JiMGYzVVZVdGFMS2ZDNW9YS2p2MGdTaTRnSjc2SjBQSm1FbnRF?=
 =?utf-8?B?S2tkS210MndmbWdWK0YxQi9LMlVCT1piaE5OU0E1NVFNdHdtcFBhMmZoZWpE?=
 =?utf-8?B?YU5BSFd6QlNXbDYvVys2ZkhZdU5pQjNTekd0ZUE2Y3p1RFVvb0FyZVZTeDVO?=
 =?utf-8?B?ZUhld0RmWEVjeE5mTVZodHc0RlBTckdpVXZET2g2cXowaFhVRUQycXYxVDBG?=
 =?utf-8?Q?6RUKyh?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(14060799003)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 11:20:26.7635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47271c29-dd49-4def-8d50-08ddb3da4931
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7799


On 25/06/25 4:44 pm, David Hildenbrand wrote:
> On 25.06.25 07:58, Dev Jain wrote:
>> Use PTE batching to optimize __collapse_huge_page_copy_succeeded().
>>
>> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for 
>> collapse.
>> Then, calling ptep_clear() for every pte will cause a TLB flush for 
>> every
>> contpte block. Instead, clear_full_ptes() does a
>> contpte_try_unfold_partial() which will flush the TLB only for the 
>> (if any)
>> starting and ending contpte block, if they partially overlap with the 
>> range
>> khugepaged is looking at.
>>
>> For all arches, there should be a benefit due to batching atomic 
>> operations
>> on mapcounts due to folio_remove_rmap_ptes().
>>
>> No issues were observed with mm-selftests.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/khugepaged.c | 27 +++++++++++++++++++++------
>>   1 file changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index d45d08b521f6..3944b112d452 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -700,12 +700,15 @@ static void 
>> __collapse_huge_page_copy_succeeded(pte_t *pte,
>>                           spinlock_t *ptl,
>>                           struct list_head *compound_pagelist)
>>   {
>> +    unsigned long end = address + HPAGE_PMD_SIZE;
>>       struct folio *src, *tmp;
>> -    pte_t *_pte;
>>       pte_t pteval;
>> +    pte_t *_pte;
>> +    int nr_ptes;
>>   -    for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
>> -         _pte++, address += PAGE_SIZE) {
>> +    for (_pte = pte; _pte < pte + HPAGE_PMD_NR; _pte += nr_ptes,
>> +         address += nr_ptes * PAGE_SIZE) {
>> +        nr_ptes = 1;
>>           pteval = ptep_get(_pte);
>>           if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
>>               add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
>> @@ -719,21 +722,33 @@ static void 
>> __collapse_huge_page_copy_succeeded(pte_t *pte,
>>                   ksm_might_unmap_zero_page(vma->vm_mm, pteval);
>>               }
>>           } else {
>> +            const fpb_t flags = FPB_IGNORE_DIRTY | 
>> FPB_IGNORE_SOFT_DIRTY;
>> +            int max_nr_ptes;
>> +
>>               struct page *src_page = pte_page(pteval);
>>                 src = page_folio(src_page);
>>               if (!folio_test_large(src))
>>                   release_pte_folio(src);
>> +
>> +            max_nr_ptes = (end - address) >> PAGE_SHIFT;
>> +            if (folio_test_large(src))
>> +                nr_ptes = folio_pte_batch(src, address, _pte,
>> +                              pteval, max_nr_ptes,
>> +                              flags, NULL, NULL, NULL);
>> +
>>               /*
>>                * ptl mostly unnecessary, but preempt has to
>>                * be disabled to update the per-cpu stats
>>                * inside folio_remove_rmap_pte().
>>                */
>>               spin_lock(ptl);
>> -            ptep_clear(vma->vm_mm, address, _pte);
>> -            folio_remove_rmap_pte(src, src_page, vma);
>> +            clear_full_ptes(vma->vm_mm, address, _pte, nr_ptes,
>> +                    /* full = */ false);
>
> Can you add this patch to your series if nobody objects and use 
> clear_ptes()
> instead?

Thanks! Stupid me thought, because of arm64-specific impl of these, it

will be churn to do this, I am indeed lazy :)


>
> From 95e20ab0ff62bbbdcd89898c9d76fdc1ea961257 Mon Sep 17 00:00:00 2001
> From: David Hildenbrand <david@redhat.com>
> Date: Wed, 25 Jun 2025 12:55:20 +0200
> Subject: [PATCH] mm: add get_and_clear_ptes() and clear_ptes()
>
> Let's add variants to be used where "full" does not apply -- which will
> be the majority of cases in the future. "full" really only applies if
> we are about to tear down a full MM.
>
> Use get_and_clear_ptes() in existing code, clear_ptes() users will
> be added next.
>
> Should we make these inline functions instead and add separate docs?
> Probably not worth it for now.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/pgtable.h | 6 ++++++
>  mm/mremap.c             | 2 +-
>  mm/rmap.c               | 2 +-
>  3 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index cf1515c163e26..28679254b4f65 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -736,6 +736,9 @@ static inline pte_t get_and_clear_full_ptes(struct 
> mm_struct *mm,
>  }
>  #endif
>
> +#define get_and_clear_ptes(_mm, _addr, _ptep, _nr) \
> +    get_and_clear_full_ptes(_mm, _addr, _ptep, _nr, 0)
> +
>  #ifndef clear_full_ptes
>  /**
>   * clear_full_ptes - Clear present PTEs that map consecutive pages of 
> the same
> @@ -768,6 +771,9 @@ static inline void clear_full_ptes(struct 
> mm_struct *mm, unsigned long addr,
>  }
>  #endif
>
> +#define clear_ptes(_mm, _addr, _ptep, _nr) \
> +    clear_full_ptes(_mm, _addr, _ptep, _nr, 0)
> +
>  /*
>   * If two threads concurrently fault at the same page, the thread that
>   * won the race updates the PTE and its local TLB/Cache. The other 
> thread
> diff --git a/mm/mremap.c b/mm/mremap.c
> index b31740f77b840..92890f8367574 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -322,7 +322,7 @@ static int move_ptes(struct pagetable_move_control 
> *pmc,
>                               old_pte, max_nr_ptes);
>              force_flush = true;
>          }
> -        pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, 
> nr_ptes, 0);
> +        pte = get_and_clear_ptes(mm, old_addr, old_ptep, nr_ptes);
>          pte = move_pte(pte, old_addr, new_addr);
>          pte = move_soft_dirty_pte(pte);
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 3b74bb19c11dd..8200d705fe4ac 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2031,7 +2031,7 @@ static bool try_to_unmap_one(struct folio 
> *folio, struct vm_area_struct *vma,
>              flush_cache_range(vma, address, end_addr);
>
>              /* Nuke the page table entry. */
> -            pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, 
> nr_pages, 0);
> +            pteval = get_and_clear_ptes(mm, address, pvmw.pte, 
> nr_pages);
>              /*
>               * We clear the PTE but do not flush so potentially
>               * a remote CPU could still be writing to the folio.
