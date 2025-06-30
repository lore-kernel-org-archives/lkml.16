Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE402A1D1
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751254509; cv=fail; b=tZeduRr79nid/8fJ/37qEzif6Dth3AaJDJF55P1C7mBAfeDckT97lj9ct2YpeoKyFht5uq6ojZ2A2aX2rjGqNV+Or842kV+MxJ+Sy1vtViE6cPaQGTy15u/ZUmhoWfZxlKBc7a0TSery54kwQJLACRSi4Y/OJDayg+vGoM80pWk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751254509; c=relaxed/simple;
	bh=qOorSZ/cPtxQoDIntPULPJINcc1h/5aVVEzN1+oAXUY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tMfLV4NdMHOqt6Gf+R8uyBNlsjI9zEtt2m+38W7hxWNB+6TRUerBesGGxxfft5HXHNmqkRRruqri8QJ/aebmcfd0GLP43UNd4NtZ7KI4t2EpElaqliXnOavzo/J4wipMOVYknzmXRZqqSssTKObpGV3oSAYbAjcJElBfcHbiqmo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Cro2M/JZ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Cro2M/JZ; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Cro2M/JZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Cro2M/JZ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fTLxmrJpj+DJx8HnkMZOJMj2weBAeiKWQe109DVA+fd/X8YQMCbLKVXAlD8dcgQUQnmaZtDg86vHP5CiVlQPIa6zw/M01piFtLuNbcVpHsn5lqRdQs5LtN/IUN3ZYCcIWlOAn3B6nahBBFqXh2MZbsA93JfMlpgJL/aYg2FflVuG2HGpHCsufsUiqSyNCCGWKOvhsNmQwivhGeKWOgqa3pE8ulN8XAqRDX1i1rVIEgmbQ2QniXfXZfiSwisLfVxevImnrIs3TtQKzG7ie4KeSAAbKeTGJYQzwaaZAuP8+3EFXhxxg2WltVgMDbfzYwCYbpTC3ECvLEmneCsc9GOu5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1laBDjDwr2J5PZlSsO/uQZ3t/GtVq7hvW/BZ3YFHRHo=;
 b=lofrmTDP7nYUp20iRrd6vyPqDOHmaBnw/tNLz2cqrxEuVCpNXj4xv5IBgSX0PZUBvzvbUby8xQ3sw2/ew2IFK06AFesXd8hL553a52hypbijRdk2mazE9f+//pWYJn90pghzutbbJ7YiypiKo3t/zzqa02+GempU3GnjqcHWxFIHwiHIcYPCeE/ad4GOLX0QpWVPDpomqZBf43LWV7yUc1nGEtvhQlYyq1LiAf5qLFJAUYqvo4bCjPtAqJ2sj4QAxJdvqRuKjrVB6oHugdnjZbUBv2y8DGaVcDabPUG146dv2O3qXLmQy3Ar/CQhWpXFA+bDrzT0xyWYfwSxxLbhpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1laBDjDwr2J5PZlSsO/uQZ3t/GtVq7hvW/BZ3YFHRHo=;
 b=Cro2M/JZRX9rU1zCABlv2GsX/eyToNUCPkFNYl/cB8Y/F+R4dm6tJa6kD+zwawuOt4Gkxb2A//cFsv1xZytRhoAb2WDZiMKmMCodlhDazcrazxtugYhr9Mj2Ga5p/74gxzFrZUFaiaoyjO9v6gYL701uvX/cSgXiEfMaWyPrPS4=
Received: from AM0PR02CA0220.eurprd02.prod.outlook.com (2603:10a6:20b:28f::27)
 by AS8PR08MB9717.eurprd08.prod.outlook.com (2603:10a6:20b:617::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 03:35:02 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::d6) by AM0PR02CA0220.outlook.office365.com
 (2603:10a6:20b:28f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Mon,
 30 Jun 2025 03:35:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 03:35:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nv3NIg7AwYzp4esRP8J4ANy2Po7HNB1D1SjL1BUFOvDsRM8zP68qXThy7vBlS7p5IBzUYOUW7EfqUzanoIz/JFpbmBltf9pf/YvY48BIgyjcbo5UxboVmzxjj5yW6jzFuVaVuj11pi3rCcsOGfKdvsNJGmJyOhyrSFBqgTX84SRFhqQuj//x3/vwaH9rSSC18j3OtJ2Q7CLcjSDfk5DWbZLN1tFPAEDuMhm772SbtZWqdEKYSHm4+qQxxVPIWYoQN6Ogn9wk95LDQ8N80GiaZazI4R9UZELG2leI3WkuD7nkvez2g+mffOIOES9jNlxvgKS0NRB/zdMZtGYS/wBeqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1laBDjDwr2J5PZlSsO/uQZ3t/GtVq7hvW/BZ3YFHRHo=;
 b=U2OTVAs3CCEkpd2yPEOoi1HCSVa81/BGLYMwt8KYHGIUB6p3XktrSZjIcN2kEDZpt/Q9yyfpRxYmjlxkbxSdITJFIf/2zAA87EdiHlmXXZMmFOusnhEugmRR2gB5xo4W8ZNXkALXQJkP+3wcw7GU9CfWjYBDVhLamZL93eHucb9JdvObF57tb1LVyyPhvV01ErzQDxlwj7cIDLTY7DtLZKFWRErILtp4twmkzyP0Bi6HVbIHsJe0HQMdA+KUfyGpcf46NJE5s6Qg3oxb1yF64kzBqDl12vfq9LI6ltO6xlMGwYCBBC8Jv+TWyP1dHJZO3YMMqr4vDQbh85Thr91kQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1laBDjDwr2J5PZlSsO/uQZ3t/GtVq7hvW/BZ3YFHRHo=;
 b=Cro2M/JZRX9rU1zCABlv2GsX/eyToNUCPkFNYl/cB8Y/F+R4dm6tJa6kD+zwawuOt4Gkxb2A//cFsv1xZytRhoAb2WDZiMKmMCodlhDazcrazxtugYhr9Mj2Ga5p/74gxzFrZUFaiaoyjO9v6gYL701uvX/cSgXiEfMaWyPrPS4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB9521.eurprd08.prod.outlook.com (2603:10a6:20b:60f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 03:34:29 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 03:34:29 +0000
Message-ID: <5375208d-2c11-4579-a303-e8416ab07159@arm.com>
Date: Mon, 30 Jun 2025 09:04:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
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
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
 <5c3428c6-25be-4a94-811a-6bb6718f6c58@arm.com>
 <cc846c55-0505-4ad6-9664-ac799d9c0226@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <cc846c55-0505-4ad6-9664-ac799d9c0226@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB9521:EE_|AMS1EPF0000004D:EE_|AS8PR08MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e05aec6-f0fd-4cfe-c923-08ddb7871875
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bmNncEg1YU1nZWgvZ2g0azBSYU5JVWlnbUs0dWJsVDlQMmVESUpWTHl1Yi9J?=
 =?utf-8?B?NllzL1pCQmk3bm1GMHlTTjYrVU9Gcmdialo5em9yb1MwRDVVSTVreUNmOTVo?=
 =?utf-8?B?Ny9wTmkwc0FuSjVqU05pc0JYRVo1SytaNGdYTmRBSXcwY215SUcwSkx3eG9o?=
 =?utf-8?B?cm04Z0RGYjZhOCtWWXl2VEltWElVaDBHOXp0dlZ3dFU4b0U2MCtLSFcrNyt1?=
 =?utf-8?B?T1pLR1F5QTJKRktFUkFLdXdscnE1c1Q2cE95dWlYYnpLRWM3WW0vdXpwZFRL?=
 =?utf-8?B?cXFuODNtMUxxRk0rYys3RFJHeVdrWXFFM3YrWWRISCtFTzBTQ1M0YzljeGZm?=
 =?utf-8?B?YS96SlQ2dnFvb0srUVNoVGFidURzTUJqMndLNUp3KzJwSjIxRExIUm9oZ3lh?=
 =?utf-8?B?QllmbjAxWHg5TE9lS3pVQVRVY3NDSm4xemthSXUwRmE3S1JoUzBtWmd2eGpC?=
 =?utf-8?B?ZEQ4cURDeHNaUU9EZ0NlNmQwSEpML0ZiTTdkS3BHRjBVV0dkS25XQXNiRzlw?=
 =?utf-8?B?SGNlUktPYnpYNUJZcmZvV21HeWRLd0ZJUFV3VGV0QkRIUmtyNTIzRVNaUmwr?=
 =?utf-8?B?R0FBSTFMYXMrM1ZBd3Q4V3p5Kytwd0N1SnBzSTNEOE9UVFhoQ2xSdXdRbUFi?=
 =?utf-8?B?MWFNSmVITi9mY2JOeVd4SzhDb2pqTG5uM3VLcUg2QnNoSThlaCtIMGpTUVdu?=
 =?utf-8?B?aFdKTHZGdTlSRGV2Ni96eXgya0U4aGNzNjRaeXorY0g2cWJXelVLcVhyeEpU?=
 =?utf-8?B?U3NoZ0VEOTM2eWJLLzY2SzBrNTFINXdBNVpPMVE3ZnQwWG1yNXpRNVpYempN?=
 =?utf-8?B?RnhjOFFrQ2VxSmJibmxla01oL3NBZSt2SUhtWE05dXFIZllpQUNoQmIrSGx3?=
 =?utf-8?B?RTdxc0FIempIaTlwNmxBSkp6Q2UyTWNBUE5BUVFWQ3BWVTRmVFBkTWlqbk1P?=
 =?utf-8?B?TVRpOUdWaE5LMC8xYXUwQ3ZxYVFQRG9hZGZaUTFseEF4bTdMMXBDNnh3eFFN?=
 =?utf-8?B?QUJFbnlvbDZsTmtUUDhMMGgwWXdlRXozbHduYTFqZ3I1cUNZb0oxWG1jOWQ5?=
 =?utf-8?B?VEN2Vlc2UEJtdmRrZlpXa0pjSGdqY0oyQzQ5M2MrbVR6ZVRSbGlJdUg4Zkhl?=
 =?utf-8?B?RURySFBCd1MreFF1L21qWXBuTnBUSWlDVmtGdmFPVENOczQ1QmYySldLRE9N?=
 =?utf-8?B?dUFZNjRRT0RvYjJmdjFPUFBWeGFTVG1xZE9KRDhZVnkxeDNhMVJXbFlrQ3pX?=
 =?utf-8?B?cWZKaHV6MGdSV1htZUIwTjl4SmxUODcvanhFNnBRRVVQejdVWndidGJtNUlW?=
 =?utf-8?B?aHpreVpsZ3I0NE1HTnVLNHFTN3NVaTFUZU8rbjFtZUx2K0N3QTdXR0xyRVFX?=
 =?utf-8?B?ZmZyYndNdnM0d1orcXNGRUd5SWxadnZnR1ZvWFlHY2tUY0ZUcVl6NVI0RlBG?=
 =?utf-8?B?VXJMbVN2dG8rYjBSR2o0TkwraW9IVGlHYmtSY29BOEFCN0VUTWxRb2dreE10?=
 =?utf-8?B?M0VLRm1RK2kzeUs0T2lOSzBlRzBXcDR0VjVhSGNSRndnMkxrdVJ6MVVJRjIw?=
 =?utf-8?B?RUYrRWYycG1jWFVRUm12NVMwelN1U1pJdDRjVE5SZGsxVXpadDczS2lEWUJP?=
 =?utf-8?B?NktmanFNNFRncU1FWE1BVDFPSGp0QWZlbG1rWDNuS1ZXYk11c3dGMWRVa3A5?=
 =?utf-8?B?RWw4ZVhtS0tIa3pYakhudEU0azZIRlNURk5hNVlZS3ozVWQ5NnE4engxR0sy?=
 =?utf-8?B?QnprN1JwbDlLYzlWN0NlaUNoblM0QlFKREovZ3ZnQnM2bzczQzgwTkRiR000?=
 =?utf-8?B?VWFXVWs0NEllMWhQNXVSSDUyeStZeU9DbjV1eVJYWU94NSs4blBvaUVIRWpH?=
 =?utf-8?B?ZEpHd3BHTzBXSElSQ2dYZzg4V0VsVTU3dUF5c2xER3ZRNXU1SHdMS1VrdnFh?=
 =?utf-8?Q?YFa3XbX/YB0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9521
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef5ef90c-b041-42ae-aa91-08ddb7870514
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|36860700013|1800799024|7416014|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1BQQm9RZWVoRU0reU9MZWtPMzVMZjhHR2Rvb1djaUFjQ2ZsZXM1bDF0Rldo?=
 =?utf-8?B?N1pKTWRzRmRjZnFyR2dKUDdaR09uUjA4UFlUMlVEZnNja1ZhRmI3d1BDYU9E?=
 =?utf-8?B?MEtUeUoxd3lBTUpwSnU4SUM2TWxDZVlldy9HMS9UVWVjQk9IZGdXY3NKU01I?=
 =?utf-8?B?cjZWVlZxMzhVQzBHL0ltNWFKTmlCbkthMkxFS1BDQzNFRVBUdXh3OXVabHpz?=
 =?utf-8?B?aHkzMzRUMUJIeGxkQjFIWStiTGt3amowbkpGYkF5K2Z3VHhuMmUzamd0VHRi?=
 =?utf-8?B?WStuNCtKVG5VR01aRUhGaXI0TVNjVTZ0MTBqUCtUa0JDaGxoUFJmQTFKZ21l?=
 =?utf-8?B?Mkx5bEpscHp6RGpXZlAwVGtGN1Mwb1dxOThTd2dZNXNJZkFYZFRUZnBvVG53?=
 =?utf-8?B?OVlDaXJPVjNsN0ZmempwOStFRWF2SDU2NC9IWWdDRTZydVdUSCtvaFBSWEEw?=
 =?utf-8?B?d0hDUG56T2ttbGpjekxzMzNwWElLRlJDNUZjdXYxcllWMW9Yc1FWVFgyMUlH?=
 =?utf-8?B?d05RZWpVMit0cUxhalUvT0NZTFVjVFJLQ3FIanorNXB3TjdtSGVFdmpjNWxx?=
 =?utf-8?B?RWlweTFhZ3crWkE5Ykd4RmVYa2h3RXRmbWh6UE83c1VEK1dmeHpIV3NMUnZi?=
 =?utf-8?B?QlYwWVg1OWpsVDdPcXJPU0RpSUNjV0FJb0UxMnM1Y3RocTlwRzBDaFVzblRk?=
 =?utf-8?B?Y0FROTY5MWdRaHg2Z0tOR3pFWDVONVhzVy95L2wxR2M1ZHIrSGN6TkVNNWNE?=
 =?utf-8?B?UllCWmZtb0E5VUsxTW5CbkJZb1ZyRHhqdjQ1NHpjUW9VbVFKZjAvMVkxMmJJ?=
 =?utf-8?B?M1Z5QlpMcWtacEtNeHZHZVdlL1JGZ0RlRU42VXBSYmpWTW1KRW5yN2JMeFIy?=
 =?utf-8?B?dm4zODNoWGdtK3ZKMGEya3NtbzAycDlrRHRqOUxQOGhIRlhkQlJqUDNkMmdu?=
 =?utf-8?B?SDZ3NGVDbndRVTJlQmE5aitZcVErMDRnSGMrUzdtMFc4OGI1N3NLbXRxd2pa?=
 =?utf-8?B?dURjQzYxSGNPZFQrUXh1OGNDU2M4Y0JpT2VVYnFFOW1kUTJiQnV1RFFKZVQr?=
 =?utf-8?B?NElQbW80MVRRMk1nb1BuOVduOHVwMTZ3MnNkZDJLMVBYMnNiaklBY3NZVk1q?=
 =?utf-8?B?YjgvOFJiRjRCVVV4UmdhcDlrZEpkSHVZWGhrYm9pY1hCNlJ2aGJCSFB4eHhX?=
 =?utf-8?B?VmxxOC9Va2NTZFQ4aFphdDhxa2JXV01qYmN4c1BlSGVQWng5ckFYdk1aK1hv?=
 =?utf-8?B?Y2VBZE54WkIva05STllDUUhxMTZVRmw0TjVLN0hCNmViYVZEUmZZRldQY05q?=
 =?utf-8?B?QWo0amcvRXlwSUdPaWt1WHVrdnJ2dndTMC9sSmNwak9adWxvL296dG4wOWI3?=
 =?utf-8?B?SGRrRmhwKzF0bmI5MFFBSHhFUnN0Tno0MXhIQmh1ZmF2b1V6aUc2cHBUZHVO?=
 =?utf-8?B?MDdTb0JsRUtVcEp1V2xMWUtTYlh4ZWdrUG93NEtXNDNtTjZtSEpxZWZhbG9m?=
 =?utf-8?B?dzlRNmozcnN3UGxKVGxNQXNWY3MrTDdIeGpLc25GcnFabTcyNy9MUjgwdTJy?=
 =?utf-8?B?azJVeisxOXNoYWNGVnZHcVF6Ty9NN0Z2UTN3VVpqcW5WY1ZhME5YYnkrb2xW?=
 =?utf-8?B?MWd1dWVGUkNMYllSMTZ6cW1lajhJOElhR3dOSWhqZTJSeEhDTDJCbllQdTNY?=
 =?utf-8?B?TmZNN3RNRnN2cCt6d3grd3R3dGFuZHN5ZXF5U1FaSXpjY2NLUFZCSU80ZWJV?=
 =?utf-8?B?L29LMW1TYjczRC9vWWdiaDhhbGZ5cFk5TzdEYlVPRk1nTTF1RUFFTVJKeTdK?=
 =?utf-8?B?Yy9nV3RqNlRCYW5nZ1Z5eWNReTRBRy9MZTFWR0orbGVLZENGaVcxYlJjYnE4?=
 =?utf-8?B?c1JhdTdIV3JENDBoTm5sNEhWWTZ0VGtESGY3cmtRU2VWK0JsWlhGOTR5ZFhM?=
 =?utf-8?B?bnMrSk54dFZMa1psZnY3QTFXQ21CWVFxRkpISU1YZzNVaEgwcVZJU3FPajNp?=
 =?utf-8?B?MUhFN0ZiR3MvZkd6UWcrdE12R3lYbTJ4N21oN2d2Rm1aUEg2YTB6aEhDMVNN?=
 =?utf-8?Q?AFh5VI?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700013)(1800799024)(7416014)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 03:35:01.4387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e05aec6-f0fd-4cfe-c923-08ddb7871875
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9717


On 29/06/25 2:30 am, David Hildenbrand wrote:
> On 28.06.25 05:37, Dev Jain wrote:
>>
>> On 27/06/25 5:25 pm, David Hildenbrand wrote:
>>> Honoring these PTE bits is the exception, so let's invert the meaning.
>>>
>>> With this change, most callers don't have to pass any flags.
>>>
>>> No functional change intended.
>>
>> FWIW I had proposed this kind of change earlier to Ryan (CCed) and
>> he pointed out: "Doesn't that argument apply in reverse if you want
>> to ignore something new in future?
>>
>> By default we are comparing all the bits in the pte when determining 
>> the batch.
>> The flags request to ignore certain bits.
>
> That statement is not true: as default we ignore the write and young 
> bit. And we don't have flags for that ;)
>
> Now we also ignore the dirty and soft-dity bit as default, unless told 
> not to do that by one very specific caller.
>
>> If we want to ignore extra bits in
>> future, we add new flags and the existing callers don't need to be 
>> updated.
>
> What stops you from using FPB_IGNORE_* for something else in the future?
>
> As a side note, there are not that many relevant PTE bits to worry 
> about in the near future ;)
>
> I mean, uffd-wp, sure, ... and before we add a FPB_HONOR_UFFD_WP to 
> all users to be safe (and changing the default to ignore), you could 
> add a FPB_IGNORE_UFFD_WP first, to then check who really can tolerate 
> just ignoring it (most of them, I assume).
I agree.
