Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDA128D8CD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537948; cv=fail; b=WXOwUiwDt+VLainZQ/b34//Bzimti7LXbSosWWf1hr1db8T1wIh+iZWZ+xSo6eJJ4m3/HwBo1XVebjCxfono4BhwydNXYlewyR84g51PCDLJE96QZ35vsoy+WEc4/J19epcsD3jrke+K3Lg52n3lUP+csUB67P9KG8PzI6Q45IA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537948; c=relaxed/simple;
	bh=U9CgeF3HmADWgfSCI7OY7b1Cp5A8wG5E/UUQKnUkSvE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fo538uKjviWaNsXbzJsFnOgVxHjGh9pCvl+LZyYakGJFm9Yi+DooKvorKNYo4Nc1SbsFjcSc51GdNAcnkPkMW7RPEiB7DyMkvr0O88VQ8fVYrsvbYBozoyOrPsEKhxBIdy2pxJNNiPNwabDhXg3BLyI69sQAiZ/D/eM3RYYYun0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fdPlUe8E; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fdPlUe8E; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fdPlUe8E";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fdPlUe8E"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BXCZ1yKHFIei2M+JJPwfYqivsDsyBteS7K0L0LwS6/QHqBBDfV7jKYVH4CVQFxUIK2xmcoz+7mXw2oTU09Y+RrJ63z4sbkEx9x9Jfm9qxRwuMugax5E9t1bVKJrwNSxPeMRGcjOlONdtsDixeUqgCmZy2EWiidGiCM6BDnoWcWbxUJHvCRtREEHXXO35KwSnWl6e+Jpl8XTHZSDfiom3Qzo+PZnWzUDekDTUAFCg/FMDQtyT0AhaLGDwUgkts3BH50kdydgBiX7MIK/D4bMOib4bK7tK4zfRrultSWjBrxjSKgnpfs8l2UZeNaC+bqoyYRhjuN4u50Fk/7EVH1/l4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmrfSRub5pzGVzHIBBzZxLxlm2Oo2Duwj/5bwKWNNfA=;
 b=mJAqVsET8wPmZblKEgH6DEkap3tgRZxEB13Qwed/q/uG7K2fO/Xzg6oKx8jkkkpmfchrWCMo++yWMaACFMgxg9/Rfu7Hx7x/SWHReQ7DAg07DjVnrG7lR2OHc1nIxcwKTLJ8XmyrbhlTCSxUgZI8XBKG0OdpCVdGGOEd1NTOrlsHGrq7PMRrNQgfBvqYDzIwKYgeOykWNA/BgNqv4dqWfYEIwBaa9aIN67SE1EVGbx/FuifEsMMp3ShJht3dICN+6GTijzs803+4FSq2DITXjcHZdQpB7ePkB3guHwDmZ+wCSya8fxiSIzy75Ew7BhtmbotPf4FaOXj6BpYLIGUCJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmrfSRub5pzGVzHIBBzZxLxlm2Oo2Duwj/5bwKWNNfA=;
 b=fdPlUe8E+/YAQxrV0Ax2dSNOf/fMOSawfHgLojfLqiJ66CCDP8wrgJocyQ8fT6JNHzi5NkKWjB3pfCZiHRyciML1e1vnm8lQf6wCNslVCTMA/+sMB91FkjVxwNdzx4c+3F1vqC4n0TloS4FVlnwzCR23lD14UECkwhEBUs7NDkg=
Received: from AS4P192CA0053.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::17)
 by DU0PR08MB9511.eurprd08.prod.outlook.com (2603:10a6:10:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 10:19:02 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::ab) by AS4P192CA0053.outlook.office365.com
 (2603:10a6:20b:658::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 10:19:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 10:19:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWZv5efzrSyK4432L0RXriiZfaQHPDYqBfe95Zb3hJVE+KsbY87KIKIziR9VtxuZkixNV7+zJpM+6roCWKeY/d5NszBZVM+sCPtKJOXF3kumd7POEHDL6WPUT3g6rCCJWcRDM5OB82DB1ZSshbe5vZ/vv91PcED9K1p690/l3Yez1YJ2HkL8YvhgxrqPzEeFIqEsUsdygCqHfO778/XFA5SE4sFb+6tp2BJ24r04bbQpkP8i3koDhTtWWmngRj7fRfuD/M5A2u5Kb8HFVDjzvSA16RpcmsEnDPdxzEvYXfefi+AFCbiOmBefEpMskhR3KtWXlNRfNmAmOjNToEmB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmrfSRub5pzGVzHIBBzZxLxlm2Oo2Duwj/5bwKWNNfA=;
 b=PpKG4w3wE1zVlMQV+xkJb1PwWe6NdoJ0yYnzR4SCRkTxNMYkMPkAl8srVX6bllXpt1tV5guBl6pt9zW05q6WH1sMiR/7T4QTKmk/KLGjgyTnheKuWm0w9Hj9OGAo4SmjUk48bP7c1KRrjzdR0mL7QHWYlAU/cIZZ9V4aejihFGAvAYCiB1LNqQKDFmyrW0HABdK8aAHQGlEq8gmydJkhItLJNBWEUtVey4E8FAaYZUHUXIRbVK+wY7U/M0hRJR/8lcURSG/huuk+H0ZOaaNggG6H5XtjEK7npXvAGZe7HsNeE2wi+QXhrbwSPlLF43RN1JdSgwx2RZMZnthkBWKn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmrfSRub5pzGVzHIBBzZxLxlm2Oo2Duwj/5bwKWNNfA=;
 b=fdPlUe8E+/YAQxrV0Ax2dSNOf/fMOSawfHgLojfLqiJ66CCDP8wrgJocyQ8fT6JNHzi5NkKWjB3pfCZiHRyciML1e1vnm8lQf6wCNslVCTMA/+sMB91FkjVxwNdzx4c+3F1vqC4n0TloS4FVlnwzCR23lD14UECkwhEBUs7NDkg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DBBPR08MB10793.eurprd08.prod.outlook.com (2603:10a6:10:53d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 10:18:28 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 10:18:28 +0000
Message-ID: <f0e1cf94-1579-4be4-801f-ed1fb48b98ed@arm.com>
Date: Thu, 3 Jul 2025 15:48:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] mm: smaller folio_pte_batch() improvements
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Lance Yang <ioworker0@gmail.com>, Oscar Salvador <osalvador@suse.de>,
 Lance Yang <lance.yang@linux.dev>
References: <20250702104926.212243-1-david@redhat.com>
 <20250702104926.212243-3-david@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250702104926.212243-3-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::13) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DBBPR08MB10793:EE_|AMS0EPF0000019F:EE_|DU0PR08MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: 12aa3ce1-4034-4574-d95a-08ddba1b07d6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZzZJcFN6UHpwb1VPQkVINDl1MTVPaXVZUXpmV2owSjh3SlUxYlhqVHdWNy9W?=
 =?utf-8?B?emsvTzI1S29YWlM4ZHB4OXhqa1lGRVVNa2tOY3VyMUdiNEs3VFpxV09oQXli?=
 =?utf-8?B?KzhZZ3ZYc21FWnREUlhmU2tBZ2l4SXR0cDd2QkxJSVpNYVBpRzE0ZHQwN3d1?=
 =?utf-8?B?dUwvemhCOTl0dmRnUjBaay9xYWpPUER4bWVaRVpDT09iOW5IYkNrQVo0cEdy?=
 =?utf-8?B?WDRYVVM4S2NySzhNUHpreW5UQmZRcFB5bHJLZVRERURIMVhKZDlSUkJIL08v?=
 =?utf-8?B?U2cySzdrdGYzODVUWjJ0OEZMOUFwVHpwY1U0S3RBL3VMTWI4dWV4SS9hWERP?=
 =?utf-8?B?bzUzMlVSSmNvNXp4T0Zoc2R2bUhKTWtLRmxWTFFrT3VMY0E4TTVRK3BpS2xy?=
 =?utf-8?B?dUNFMjBNZzJNdFRLNC9XK2d3VWJBWTNYS3pEMmVwNmVyTkNVREJyMXd4NmVX?=
 =?utf-8?B?bDRpR0dUWHdCT0gzeFFhdjdTanNwYVg3dXdOOSt1UmlHRnJxaHRwRTh4R2N0?=
 =?utf-8?B?RmxoeE9wa3JDemRPSUZjWGxlZlRwTkNRNjF4SlhqSGRaYWVQS3o2RkllVDlK?=
 =?utf-8?B?T0pycm81b0tTRTVyNW10UjZYaTl0SzJ3YjUvTUtxNlkwaHlUY29JVG1Vck5n?=
 =?utf-8?B?YXRVQlFKaVVqUHFyNXVyWStkTm40cFRsMXhuZlRjeThsYXJOSm9UM2xTb2dj?=
 =?utf-8?B?cWI4MVV3VjBYMlJBSzNYd24vaFlhSzNFMkFzblhCc0tnbk1NZm95Z1pacEpn?=
 =?utf-8?B?Z0sxOWFpY3JCSDA0RDFVbllhZlJyak04cE95VVk1Vk5Vd3l4ZU1zVXRWOFl5?=
 =?utf-8?B?S0Y1U0pFMFBDN1RMbDZTVHc4eDF5TGYrejBnWXdoL21vbVlZUFZ1Vk9zOFdl?=
 =?utf-8?B?cmNiR0x6czlpclJsb2E4ZElubW1pQk50d0w3Mzl2cTM0RGxtNTJlL20yR3Vi?=
 =?utf-8?B?TFZGWE5aWTNsQU5aTHdyd05jTXhSR1lJdm40UTgvbTllNEZ3cDBPZUE5Tysz?=
 =?utf-8?B?ZENyQmZzTmxKdVFjQXNzb3d3NXEvZDVNcThBb0xNNTR6YXlDVThCcll5Z3ZJ?=
 =?utf-8?B?NENmbktCYkd0TkR6MkEwSW5WeEJHTmZ0MGtudzEvdWNvZ3BJM1BjMUxBa0FY?=
 =?utf-8?B?cXI2VERaclp3cXN5QlJqc085Z2NuR3ZXUlRZeTlRQWpkamZRa0pSdGpkeVZu?=
 =?utf-8?B?WnJicTVvdTZQTkVnbUR6ckdOS1lYTnptNEFoUTF6TUR2LzlVdTErUytpUkRC?=
 =?utf-8?B?by9mVmRESktnMVlLVEJlRk56enpadXdMbGR6WEY4dGNUTW9qaUQvanE0Q0xp?=
 =?utf-8?B?NUo5M2pHNjVEZndNQ09kN3U1aHBvQzlhRTdBS3BMVEhqS2tHSkpBRWZzWFE1?=
 =?utf-8?B?Q3ZERXRWNkRZb1FrdG0vWUtuUnRzclFERy9CdjlRMElIZkhMakptdm9EcjZ6?=
 =?utf-8?B?Tk9LbFZ2SnBIUkVvQ3Q3QTlUKzFncXQ0NDV0c0ovRjJ1VGxKQ0xUV3lKaGli?=
 =?utf-8?B?WlMvb0ZkbHg3OGppcEQvUHgrbG1xNmMyTlN5enY3ME5nZmYxbEpUR0RyY2x4?=
 =?utf-8?B?Smt3SFMyYlN0VGNLTDBCVmFrNkwxOCs3dG9aZ2I5aWUvTDVacStwZjRxbWFF?=
 =?utf-8?B?SkZBMjFsSEE1VUZaOS9jZ2JNY3ZDcGxWbmNLNEtBVGpJSER4aFBOWExBZkVK?=
 =?utf-8?B?LzZPOUl5TUhwb1VzV1dKamN2TVlIRG9HMGpzM2E2dlhvYjF3RXU1b3JZYWM2?=
 =?utf-8?B?Z2pKb0tqbnB2NVdOb1BXWGRRVXg5eUpwOG43eWFrbERxNm5zS3gwQlJEaUJN?=
 =?utf-8?B?dmdZWUQyYVcvaGdWNktRMzJ3YlpZQlRKVlAzcWEyMEZwVDVUZlFPMldXUzZP?=
 =?utf-8?B?aGhVMTFHWEpLZ0NMRUNrRHFFZXZ0RlBjTUZ5eEhWRDYxblo3bVZFSGkvOHpo?=
 =?utf-8?Q?oeNSVzJekn4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10793
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25b1e025-ade9-4294-ad7c-08ddba1af43f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024|35042699022|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGVQWTNZc092NnY3U3RiRkhzWDZ5R210a1pNalc4VHh0NEY0cElxQXVpNlM1?=
 =?utf-8?B?NmFPN09GZFdENXhJa1Z3WHUydEJuUm9Wa3BWbWNkWUxiS2RIQWdxSkNXL2xM?=
 =?utf-8?B?a0t1RXF1VFZSc0ptc3JuY0tkREp6a3NXdlgxQThzMnlwM3R5U0ExbnN0aWhy?=
 =?utf-8?B?REUvN2w5dGc5NCtQemtFU2JCWlYyQTB1UVlyaU8vT1JaQWdCcGN2ejFIWk5v?=
 =?utf-8?B?MUV1L3J0SkhDc2VKMnkwQldUWEoyYk9SaURXdXZiREh1MEEwUzNtNUc1M2gy?=
 =?utf-8?B?VHUxaHR2QnFyTHFJOGZDNjd0RjgwdDRGUFVEclFHcmpVY1B4N2JSUTN3QjQ4?=
 =?utf-8?B?UFNqZDlMd0ZoOFhPZTZYVHIrbHhuWFhVZWxyejVrUzVKV0RCMmErV0Y0MEo3?=
 =?utf-8?B?a3FVVEFEb05JdWUyOWV3cStnMXNVekxPWjZMSnZQZmI4dHJzZjlUbHJzbFRv?=
 =?utf-8?B?UnYxQWlQaTFlTmsyeGlpeXYvZU8vVlUvWE1JM2JNKzdEelpocVlnUTU0NjJL?=
 =?utf-8?B?UFRWcHc2NCtvYXJkZmorUmlhcGlES25RZ09UMmFvaGZXbFNpOXNpYjVkKzZW?=
 =?utf-8?B?WTZOd2RLVkd5dFJXczc2Z1JuU281cDF2OG5zbEhCNnJqUGk3a2dYZFMvT1l2?=
 =?utf-8?B?NGFsZUVXMWtaeENHamthdlVZL3dHS2g0THF2M2c4WWNXT3ZFelhQQ1Y5TCtx?=
 =?utf-8?B?U0YxaDU4VWJSVGhpbHFkVzdmL1liYlBhVDdvMkhJdnJRb1lVeHRpYnZTNnZO?=
 =?utf-8?B?ZjJhWXRNeXhXMGtJdFRKZHcwdS9halhmRmZjeHN6SGZFeE5QTDF6dDJ1eWJy?=
 =?utf-8?B?enBFNDNpS2Z2aktYbkQ4WU5XSGdia3liY25PT05BWlROdFp6YXVkOVRMWTFm?=
 =?utf-8?B?ZW15SmtWc2VXZnlNMnFMazJnZTFxNjBrQk91WW8yQzRnUWlKL0dDRENPbGxC?=
 =?utf-8?B?YkVUbUd3ZHhFdEhETjZqNWhXN3phVmRlUEVtd0ptdExHR1hPQ0hTb2pPK1Uy?=
 =?utf-8?B?cGdyUHdxcm9vNHlvcENwdUZaV2duMlA0QldyMU56MGFPdlkzVVUyWFhxemZp?=
 =?utf-8?B?eGZjdHNuNTVabXZvT0FReUFBK2xvVFBTVzl2eGRaVEF0NXBGdmpYNWdmYWZS?=
 =?utf-8?B?bjRxckI0aEFNU09jZjlUZEtoK3R6Y2RwYVVvWlA1bmtyTWxHYXE2U3dhc29Q?=
 =?utf-8?B?WU9QNFZGZGpHNS80Rk9LcG5HOGg4M2Vqb2RrZXp3ektaRGpkUFZReXVmMGov?=
 =?utf-8?B?WnRvSVcxR01KallyRmV3cnJvZkVtZlpIOVFjTHdRZHNuYjcxNDdaWmVSN3Ru?=
 =?utf-8?B?YzBheGNBZytHYmo1VjZYWEpUb2pyRTFvL3ltQWZaNzJaYzBQTHpodUZBdytK?=
 =?utf-8?B?WUxRSUxURDJjb1BWcHZHbGZPOS9oZ0ZxeCtLajFQZHdQSHFHNTFvdzF0WVVr?=
 =?utf-8?B?V1FuTEJZRVl0SVYxalYxRU9tRmU0TkVxUnBUTGRCY2RoMXhpVVdKM2tBS1JY?=
 =?utf-8?B?V01EZGJFN1lYSEJCR2prUnJ3dERnYTZQWm82QnRRVnVrUVZRaEZiTWI3SThn?=
 =?utf-8?B?YjFzcmNuOG5uVU1MODhrbHdLRmJ0bVJ6NHBvaFc1R0tXN3MvMi8wTEdoQXFt?=
 =?utf-8?B?ODJpTTd5VkVDNHhIdE56a1JBSVZxVURnSHd4QXJ0MytYTHBLRXNwY3U0MG8v?=
 =?utf-8?B?RDQyNzJmSnNsYVRSM0Rnc3c5M253MlZwU2dpNXV2TEJPb2o0c3VuRkt1ai9D?=
 =?utf-8?B?QkRNODhmaEVWNFJVRTM1REdiTkR6aUhNRzhYNS9PQUJUWXVIM3lnZExDUThl?=
 =?utf-8?B?QVBkVHp3S0lEREJ5UXFWYWRsSkc3Q3pWMFlCVjRiQXA2MkpnRmRUUUQzK29s?=
 =?utf-8?B?alJnVWZXUnVFWEt3OTRsMFNOd245Z2ZVWUZvdGM5SVdnRTA2bm5ZNzdVZ2Jt?=
 =?utf-8?B?TkpzSDRuVmp6WjFhaThLeU1RRFpzcG9UWEZUUnhnYkUvSi8yT1N5OExZUjRx?=
 =?utf-8?B?SExCbzkvaU14bFhZUFlqMGFWbjlKR1pVaC9WRWswUGJITGtaQk9SemZ2OVI4?=
 =?utf-8?Q?8CuNKQ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024)(35042699022)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:19:01.3905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12aa3ce1-4034-4574-d95a-08ddba1b07d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9511


On 02/07/25 4:19 pm, David Hildenbrand wrote:
> Let's clean up a bit:
>
> (1) No need for start_ptep vs. ptep anymore, we can simply use ptep.
>
> (2) Let's switch to "unsigned int" for everything. Negative values do
>      not make sense.
>
> (3) We can simplify the code by leaving the pte unchanged after the
>      pte_same() check.
>
> (4) Clarify that we should never exceed a single VMA; it indicates a
>      problem in the caller.
>
> No functional change intended.
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   

Reviewed-by: Dev Jain <dev.jain@arm.com>

