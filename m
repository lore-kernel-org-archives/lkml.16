Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012063.outbound.protection.outlook.com [52.101.71.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D183E2E03F4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.63
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547424; cv=fail; b=TP0WSLKDUkYrbQTCkHPdMToSpgSQ/troDjyfZfg7aAFRTO7d4bjHzSaiQoAtxm2Qu9hBtZ93A2AOKd5C8B1Y8RKxcnkjopMDdARy+sEC89eUGCtPYBWqrEIJViY34MboKhlMcl0L4D3zF9poHuSBrex1OsgAdrhpvGCOZl81Grc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547424; c=relaxed/simple;
	bh=ezZGhnMfxePxGtpgzvHL7LNAeRyXqZTw3xFhEG6ovGs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AOBAZxGFE+s9jGhu7Nl36L7xEq80lzXz6T30X7fyADLIm21hvOZQ9OCRgz3YpvIwCb6IISabJ5cDN5HHI5Fh6uu0JmvinoJyEuAp0n0oY3DpIQesVuHEtDcWNRIDMUqk/5Rmhs/Vf3B9xIMg8DPKgKE0toAV9fVjijmHph6iHJ8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FcWHPXEj; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FcWHPXEj; arc=fail smtp.client-ip=52.101.71.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FcWHPXEj";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FcWHPXEj"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HzmRXu4gtJKOakNsB9IuHi8pZi1XTqAxoUDkCZQIi2ZuL1MIShUnr5i5Naddb5X77k9UA+JndOKFAk6VUo/vQqCwDq9A/vIffrUPE9DLhuc7bwJEgNdwa8Lg90TQdDS09liozCv0Nl5r75/dRWg6XJUQLh5UdNQ8hLEhdj8Y5BJkM9HraFbGu8zGGPOVpzgKQL4Ro7otSZIH3K6mRh+UCKyk+YQXDeXnelsgTjbLHJSaDVp7dbCyWqWKl1Wv+1zz94uoJZSkABtX+Lfhh1CodJAlImnGjCWI22h04KhidmJdisO7/yXn2iFCBiTCqhhsdqnifffDH95NDipsfjNGWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnedaeswdJrAp7DGxRa1qWRtftDh7vI2K3saTsYmQOY=;
 b=NQ87Xacj7OeMd8gWL+s4iuVSk8rxmEc/vY1G4XlD6trpSYNNW33YfHNnZLazLbdhqLAziEHN8CQcwfIxLs0Pyn2bBrcHnCsGIvBOauyhyXtkRvtHlGAMk371fEKeMbYqSIJ77H+jekhC+D9MvoKzDw1H8Nyi/NBRks23lDdJEniNNq1m7QpqLNXvs65g4v8uIKAG4wRgFzMaJ1rInYogbdiMj9h1IRCKef3G1IwbUjPSigYUfiQy95Bkik7oQ4jqE+U5+NLLhnSddYQtUR51lMeZZd+GEurGRBD5FuShoLx2tpNaN52F5qhsSwSqs59jOJ9gbUimJK/p95mxWkJZhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnedaeswdJrAp7DGxRa1qWRtftDh7vI2K3saTsYmQOY=;
 b=FcWHPXEjyT+o7k8TTB35FzMsXwMNpMvHaBaoA9ZDf2VN2BcrDmZgPYG0dKdKNT/VGpq2sGZzTBSGRtJgN+/Wh4jVhrNAIocUqtje4epabloGCqwqO8j3uB5Ijf6bVLa4F8Re4ewnVccbZ+aqftTGKhlHIRz2i0lYLVfOtrF81JY=
Received: from AM0PR10CA0090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::43)
 by GV1PR08MB11206.eurprd08.prod.outlook.com (2603:10a6:150:1ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 12:56:57 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:208:15:cafe::66) by AM0PR10CA0090.outlook.office365.com
 (2603:10a6:208:15::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Thu,
 3 Jul 2025 12:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.1
 via Frontend Transport; Thu, 3 Jul 2025 12:56:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNyjvZN6ZOVBhJLEstEjg0QfrhBXhCq4nxH2KXZHgnfE51J/o0cod1HywHn6ZCloXQxFOdMzlMV7nwwbIHjJDxXMPNEh4AVcU0Ku9NujSmeD9+MnsEOY93sIoaMsYWfUUHJ1OoXUdE90JUYWrVZeZJbDBC9HIsqp03897b/B3kH0dcT8c2tAPZ1LksbPAXIsxRuhP+4hsAE/27LyMt75I/jL7HH5e3ZI9KUOEc9XDyYfSZS07JhV7ju3on0c68zfXtVthCZR+XOvrAs0Fmsa23Ro6zD3+u9JDG05cCjdLJW5Ez3PtMjsGMOUGm1qvOF4o7sUKczPhV37PSHuluNQew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnedaeswdJrAp7DGxRa1qWRtftDh7vI2K3saTsYmQOY=;
 b=ex1e0jaRDt6rfcsMQJrujJeNl+PcEwjwxjy+qbUSFGwOpMsNc5wfOFMk3QdvoXbQXP79m+BI51E5aEJ5ETQ9oY6DJKSaRYmJ12BygCZK89ezIX+wgS6B1Z269tNjt18y477ET6JcAo1MCri1x1lt8CjSz/R00HnX9HCSEYxDB4iw5rzwyKuKeyuPxnk2UaQVU+ZLyn/fUAeqQ1Won2u3Q3QdBeabmh6+1yjRQO8JkSi+JhiqX8u33O88IUUQDVvIXNRvhObAb8Crs/CYl2Eog6/g3fwiN2U5T0hB5nnJOerow1xktC+XOLrT1xS7SItcqnyla45kdIQx0kgPAUzaXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnedaeswdJrAp7DGxRa1qWRtftDh7vI2K3saTsYmQOY=;
 b=FcWHPXEjyT+o7k8TTB35FzMsXwMNpMvHaBaoA9ZDf2VN2BcrDmZgPYG0dKdKNT/VGpq2sGZzTBSGRtJgN+/Wh4jVhrNAIocUqtje4epabloGCqwqO8j3uB5Ijf6bVLa4F8Re4ewnVccbZ+aqftTGKhlHIRz2i0lYLVfOtrF81JY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM9PR08MB5891.eurprd08.prod.outlook.com (2603:10a6:20b:2da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Thu, 3 Jul
 2025 12:56:22 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 12:56:22 +0000
Message-ID: <b3a30da9-ee95-4d33-835b-ec9cf42d68ff@arm.com>
Date: Thu, 3 Jul 2025 18:26:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
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
 Lance Yang <ioworker0@gmail.com>, Oscar Salvador <osalvador@suse.de>
References: <20250702104926.212243-1-david@redhat.com>
 <20250702104926.212243-5-david@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250702104926.212243-5-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::9) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM9PR08MB5891:EE_|AM4PEPF00025F9B:EE_|GV1PR08MB11206:EE_
X-MS-Office365-Filtering-Correlation-Id: d34ad5af-b903-4254-df58-08ddba311752
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RVByMTlmeFJsNkJQaUk3YWpQUjJ3Mk9HTXpYTGtMbGJsTHc0OGhkRTlkRGZq?=
 =?utf-8?B?YmowajZONjlGSCtVL3NUbkZMTXVQM3IydWhGY0JiNGVabzlaS3RJdWdQNWVR?=
 =?utf-8?B?U055cHNmeXlMS3lJYlJpbjFpcGxsSXpRbzIwNXBNb3RhRlpTRDdyVXhHUG5F?=
 =?utf-8?B?dyt1QkZWUWY5cjFZZTFjSUg1VnNwT1dPMUNiU0t5LzZZeDlweC93enRUWHhK?=
 =?utf-8?B?VURab09LdUEvNmpJMFVib08xSDlSNWRYcGV3c3ZRMHRFblVtQ0hlZjNZQ0NJ?=
 =?utf-8?B?bjFBMFVMd09OWEtSTXl0OEYxbkgweWZwWk1HM21rd0xUQWdSTUtlNVdaRDJF?=
 =?utf-8?B?M2tQRmlabGdBbW5NWitRaHlnbDFKQWsvLytvcStpZnZSUHBPS2dhMzQ5LzZX?=
 =?utf-8?B?a2o1ekVnSjBoT2duYzJGSDVYVUhlRCs3N1pUcjI2YzdmMHRQaUNkaXhXc2NC?=
 =?utf-8?B?VlpOa3ZXSmY2VmtaQjBOQ3ZwbFVTY0RvcXUwTzZjMjQ1ZFVTOW1vRmFBalBT?=
 =?utf-8?B?Qzk4UGZoblhWbUlHVFJ3Z2crUjltcHQ1UzJYdGVMZUtUN25TUG1UVUJGVkFW?=
 =?utf-8?B?Nkk4RWZUcGh5M1dTRUVubDZzS013aVp6Y3lxRnduSy9hVnNwQUxidVpvSEUv?=
 =?utf-8?B?NWxBWk5PUDd4eHREZ1czUTZlUGlKcmhwTEx6aW1HSzBHZGQrbHluRTIwSkpR?=
 =?utf-8?B?c0RyczJSeldlbUxjRGNNL1kyWDQrTkRaYkU3K3VDbUdWeTRYS3Jlb25NUXBr?=
 =?utf-8?B?Y2U0ZVNOTHdZRkEvQTMzWmRYaCswWStqYzdyWHQvQm1PNVBNSWxpWE1CZkhU?=
 =?utf-8?B?bVRwUjNQRFozdUtyMDhQQnlUc3V3UUdoZmdwMUVzMStZcThQQlRoTVdhcjBT?=
 =?utf-8?B?ai92Sy9IV2VzYmZJS2xXY3IyTWVwdTF6Wi9GR3diNDlsUjVrWXZpWVNDNVls?=
 =?utf-8?B?eG81Wm9kRFptTlM0WHpVSExzR0gyaWI3L3hoTTQ0K2xoVzM2K2Y5b3hwN0VX?=
 =?utf-8?B?ekMrVUwwODNCTEhJNVF4aUN0RURKQ0h4WG1XOWFEMXdMd0YzN2huWmpjMFJC?=
 =?utf-8?B?QkFoazh6MDhxUlc5L3dUQnJ6bTFIV2tzeEdOSWtyWVZiUjhXZXBHeENGWG1R?=
 =?utf-8?B?UnptbUxsV2NqUDI1YSs4RGlpa1ppOFlmRW0rMEEwdml1N1VPd0dVcUpvZjJ3?=
 =?utf-8?B?WnJOLzM0TVdrdzRWektiN3NHYkN1cDFKbTlJTm5XZVhqOWxDMndYOEdZU0g1?=
 =?utf-8?B?SVJPbm11MmdoaldDUmFvbjB1S1RVcTczaHpQbTZ1eHJNNExIYXEwQnkvdWRP?=
 =?utf-8?B?TlFrUEVsVUh0UXdWcC9vSlplV0Z4QWIydUdLNWY1dzhFcjdKUU9yV0g0dXFF?=
 =?utf-8?B?bFJ5dTl3bXlDcEpLeUovbTdETUhSOW5IQ3RhR3ZzMHpZNFExNjBERmFhWVFr?=
 =?utf-8?B?TUVLeTh0TXBpZldmMVUyR1MxdmF1QlpYQ1V2b3Vpek44WUhTZWtYMHRkNzgx?=
 =?utf-8?B?Y1p4VExQSUo4aldPRjU5MU5Ic0ZRbTAyWVc5WVJaaXpTb0dGVG1oaW1mTGVU?=
 =?utf-8?B?S1VvREN4d0IvYnNPRG9KQTJ3Sy9VdEI0WEV0bE1tbURIaXVGZHZpYWNJZUNI?=
 =?utf-8?B?OXhBRzBjUHpRc1VFSFJxemdLU3RxbWZ3NDlBdXFQeHlaQS9FZE8vN0JPL3pY?=
 =?utf-8?B?aHV6UTBIdjNrT211UGpMckFpRnRkUUNpenhadjZRQ1RWd2IweUNCSnBHWkdP?=
 =?utf-8?B?M3pqbW5GSEZMODFlQmVaRTlmcUxtVDRBT0Rsa3FnSk5Ha1dDUnNGaDFQS1ND?=
 =?utf-8?B?T1lKWGJTK2FUd3BHTnEyeW5QOVlEeVRMNWJqYnhmOXZnRTRjd1NxUmlEZnIw?=
 =?utf-8?B?dTAvNzlzQmVocGx2K1Q1TzhlMGptOW9WSDZaWkZLWERHRGdCbXhkdDFtenYr?=
 =?utf-8?Q?C9lYz5b3ydk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5891
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5ce8418-1e2a-4c6f-1e72-08ddba3102bc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|14060799003|82310400026|376014|7416014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkxmVzNaa1lCRytvWjBUTEJKazgraEpSQldEaXIvK2pSWExFaDJubFRNUXFk?=
 =?utf-8?B?ZllTd2tNMWk4ZWVtbTZqRDlOaEJtOHIyZ0daMW0yM3VnTXoxZjdLYXgvcjZV?=
 =?utf-8?B?SkJCOVdFaFliejNURHNKOWpHS1I1OURTL2FHUHpDQmxjWmN1aGs5MHpOSjFv?=
 =?utf-8?B?V2hXK3lBR21GbnptZ2FqUEx5NmVEbHIwTVBubkxRcGJoRFE5TUxHZFJuWWNJ?=
 =?utf-8?B?dTFjcFVwREpBUkU0eHVaWFBIU3lRVEd3dkIxeFBjd25Ubkp1OTRBODNCTEdn?=
 =?utf-8?B?b3FpbVpYZDhseWdNY09nYmNsUWVXODMxbGdHNk1yR3JUcjBlYmdjeWVvY3Uy?=
 =?utf-8?B?ZUEzTEY4RHJuN1h5Q2dKYkEyMkM5c3VJZjVneUgvYWpXT09YVE9PaHRLM3hK?=
 =?utf-8?B?R2RYTWpPc2NibVVzaDVoYXFQajN5b0d6TTNQMUpTbFRrSm5PL3RqZWtXVi9L?=
 =?utf-8?B?bW5CVTNPRmV5UEJsbXJaaHZxQkljSjZZejAxYXZqRUxPZlIwd2NnL1BjekRX?=
 =?utf-8?B?V3hqMjJjbHlDU2VNOVNadkdBSTN2L21mb1IwaTdMSG1yaXJ1d2hQbDdMMHlP?=
 =?utf-8?B?RGtaUnI4bFJPdW81Z0RyUGxmemFSUzFPRUhQVDFvbzRsMUJheTRTa29iMEtv?=
 =?utf-8?B?UTNoWmFWSk44K082ZXJhN202YW9heEdMYkJOdWpyNnY5N2c2SXBHWFVrMHFq?=
 =?utf-8?B?dVE5dGs0RktPY3RFYkNkNkN5MEFNZFRsb1ZIcXM0cHRJdEhMQ1VLdUIyUVNX?=
 =?utf-8?B?L1oyTEZEMHJXelR1ZlRFc0YwbFIrdlhZVkpjZ1FFN3kweU0rejhDb3Y1QTJV?=
 =?utf-8?B?b1pXNGxRZ0s2WnZtMGh1c2dBaytCK0NYVENSQk5GdUZTNzlvd1kwMEJZdjRk?=
 =?utf-8?B?bnhLZTEzbHpOemhxTXFuUlZvdkpEb3JjOEpQVTR4bG1VODY4TnRORnhMTzFW?=
 =?utf-8?B?U0llbHBaajlqdldFNXQzVE5qYWdLTWZ1Y3FXSXE3TEJ5RmRhZFlhaXlyUTJa?=
 =?utf-8?B?ZHEvazJMWjhjclNkWUZLWlpOUU9EUlBaRk04cm1FTkxZQXQ1aEllWTZ5OWdr?=
 =?utf-8?B?bzhDT3JkZnJMN0pmK0RzejhFYklwWkF6VkZWQ25yN0gzRjFjWDVvYlVPUjdO?=
 =?utf-8?B?Vk5zeU5OakdPSDFTWnk2N3VuWDZsT3Z6ZHBMNXkxcmxFb3FTNXBGMkdSeEhY?=
 =?utf-8?B?dXVyZ3did0E3TkZSK2hDK0JSTmJPN0U4SXhmbjZiYmJrbW9namVsRFhKZUY3?=
 =?utf-8?B?eENwVmpCajg2Um9uY0FPUHBUQUNiMkJaTDBuYlJvcXZmcXlhQ0RQZC9wRE5i?=
 =?utf-8?B?ZHhGMlpqa3ZuYVVsS25WRHBxRm9HcDZ6WW9tZWJ1Ulp2R24rNkZ2cmhUNG5x?=
 =?utf-8?B?MU94ei9POE9EWlJiVDZONnNZQjV2L1dFT3BGc1BDVFNhMEJMU0hwM3pGOXM5?=
 =?utf-8?B?OE1XOXdQNGJab3kvMXpvRjJrUVlNN3ZDSXpLTmdiakRHSTA0WU9ISDFDdUZu?=
 =?utf-8?B?cUFGaTV5V0EzMFVyVVJxbENrNUtUMmwzSHlwdVFjQk1iS01UL3N1QjhXL3dt?=
 =?utf-8?B?S0xYZHU3SHhSU05FczZFSTdHQ0FBemRWVlFmMHlzcE5xVUZNMXdoOE1NR0tm?=
 =?utf-8?B?L0R5WTRsZ2owZFh3NldyR2lBS3lCbGVhenBsbUJBQUlMUk1YWTZvODViOHM5?=
 =?utf-8?B?cnlFVWI5NjQwNEhGMTBKMlBwaitTOEU0T2Q1dFJUbjFTMUxSeUVVV2QrcktM?=
 =?utf-8?B?Y3BuS2R5Z0M1WXc1RTVMTytlUWUwb2RzMjBkNWtGaUZSN3VjeUhJampxY1ZV?=
 =?utf-8?B?QmxUWCs5K2gvbi83bjNRUnFOUDZPY2FYdU1vRGhFM28rbE1qS3JvaTIraDFV?=
 =?utf-8?B?c2hTYWU5em1lSTg4N3dWQ2sxVzRFV3ozTmxCSzFkb2xRMkRPWTNzNGR2amJC?=
 =?utf-8?B?YlI4R3JpOU4rR2ZTMUNjeUpTanIwTXoxVjdxUmJneWgxUG5mdVcyM2pOdXhw?=
 =?utf-8?B?U28vWFd1Z0JZY3BvcW9vc2gvT0VWZ011ZEptdS9QRXBYbjVqNno4WlZxeDBB?=
 =?utf-8?Q?9Gi9Qe?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(14060799003)(82310400026)(376014)(7416014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 12:56:56.2970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d34ad5af-b903-4254-df58-08ddba311752
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11206


On 02/07/25 4:19 pm, David Hildenbrand wrote:
> Instead, let's just allow for specifying through flags whether we want
> to have bits merged into the original PTE.
>
> For the madvise() case, simplify by having only a single parameter for
> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
> dirty bit is not required, but also not harmful. This code is not that
> performance critical after all to really force all micro-optimizations.

Makes sense.

>
> As we now have two pte_t * parameters, use PageTable() to make sure we
> are actually given a pointer at a copy of the PTE, not a pointer into
> an actual page table.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   

Reviewed-by: Dev Jain <dev.jain@arm.com>

