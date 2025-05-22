Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31A6198A1A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.77
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747892686; cv=fail; b=O17MzzCXte+jilt3gu6IzmZ3jEGFdiIdzb0msLVS47jivKlcdkt21hVcS2JMrdNUYa5ghzcyBlkkPY3VSi2QmGVMi2iNVrWn0HsmnICe7e/ELjiHoUhk7W21bNvAwGBBPuJBe74AeJUkRedThg2Ks9buJzfbymKWFZpQOsrR308=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747892686; c=relaxed/simple;
	bh=74LwvxFTJHMNEvwTEYJVW/QIV2rpUwjGfOzCWuTuR+0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GAJLcKMQAxPaG81O7jxkq4YNds0Ow+0iD6gZq4mLrVcgK1zVsq3D9WSvHqvqTya6ohiQZku+3bPrm1ZvNNodGlqMOG82IoG6HztwGzMiHuYxqoKh7x8u8Og8foiU8z5701VcxB22Dz5Ks4Cphh7CirfkPegUcOiFLXCDZ3KKuMs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SDwvGOTu; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SDwvGOTu; arc=fail smtp.client-ip=40.107.20.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SDwvGOTu";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SDwvGOTu"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=raSAQBpHNe6klq96LNisEYEvU8G5HH83jg+mADRLl8L0chUuxERSw3oNhhl1XNVI5AJFNDkTzNv7tLc0BRMUH3C/IqbyqzZLC0NVtI84rRybY5kkVJCJyvmHFDD142Ol2FRPCo1jjRM2EOrQoYR+V3SlTo7BYaS8GobtW2IP0B3ZlxJMSgJtVZT2+M5SjQE6ZW1EM3xvpUzdz897fUi8TR4HC7fURdKMyRnGAN7gA/jx0u88xnhYZqjroh29e3Oe9DgWYMxLuGTilgmk2PVrsiejOYxcF5pWOxkBom8A7JHj1UfnNWAFRYimrSwA9D0g5qBjVQRlhWnlHQbqp90fsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94wX4suIV1GK8s4HZbrP6xJpjbGvOrIUXoLxn+3No1A=;
 b=bWNZX5O/WTR5BAZ0NbcpN21qAOVUHkti3fRrtYOPXr4YxhW3YEjy5iMdMBFmDYTpeDR3ebeQRmh9H3Q0z0sXAi8OQjERzwL/AvS9ZdufvbbYhhbn+5A3AmkG3p9zfSlQhtmLhSIjzzN7b20iY8QQh6Rzg6eiZblD+cHVwmuM7p9dlNX+f1uH0Zy+eKCRODSgtGi4K6i8i1yZXAXStAMyUcrGtvgq2w8xzLWYycgYaz976it0Rz+xJE2LO/J9ZWFK2P3HPK232+JQLdQVbE0W7D85aJDDJCWBCtaH9s1zfR9W863d3rh55/L4CsSpL7DdMHp1lsu7YV7CU4rQwa4DYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94wX4suIV1GK8s4HZbrP6xJpjbGvOrIUXoLxn+3No1A=;
 b=SDwvGOTuSSe80qrXwM9wEAjWWdWnMKcyJ1FGFCpSbqkRWv5MY6JRpbDhWeqsDBqfaVrCjoUuLIrJymCkqPHoPxXxw10OV0WDTP6RM3xW7HVoCZsAdnvtuXrjgCTGEBZbqrO/5okQEx/H31UCexj9GK68/gndqnx4B8BgHYa7deo=
Received: from DUZPR01CA0180.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::14) by AM0PR08MB5522.eurprd08.prod.outlook.com
 (2603:10a6:208:18c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 05:44:36 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::9c) by DUZPR01CA0180.outlook.office365.com
 (2603:10a6:10:4b3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 05:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 05:44:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUte4yA3bprVXC1kY/dJvMs/88lL0TPZlazkXnSCpYz/CDkqeYMjzCBGOzr1FAkNoc9yWyZQtRBMFok+QvbTGU14QYxW09qcTYUX5eqRiawQTX071Z3KmNz/MKfX7D/RYobaMeEQfcWSiSlRdwBT/mj4s4jzPAYZV8W8pFQ3graDdv9WeRoEGWnCZejwfrine9IXrLirKyjXKgLripf4eHklZ81iXlLKwlVxiflkfVzl44W3m4+24ZHl1n9NyggGkOtDZOHxP0YMy9wVPbfJUK4e6OYKJvQ3Pjf57s674QB/XJErJJiJ2BJ6NjPZCh8Z6c1EVs92gXubOlCIP//FLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94wX4suIV1GK8s4HZbrP6xJpjbGvOrIUXoLxn+3No1A=;
 b=gjuA5IyqVIfC+6adSHR5SvSs+9xFTjhypJukJG7rxn9EL2JSzhld15SONF1ThcVAsSz22KyAUWA3z8gTl74wiom5NL83ESGg1PgUq1cuwuppuItSXeda1DP2jLs4qj6bkG61oFWDabog414ZfFCPHMJ2Vm6wSRxO9WuZ8J8LTjIE4tmc+97DXEreGNOjmend6m5NmiOLg4IvqAM6ohl0uuZFbAvr1nLDWHf70lKeWAKWtTEsHAkOEsL+wrvA7q/iny7U2myDfDXsfZd0ycsG2PYpqOCQEpKI/NjJGydnFmQQHtguG1GtLeMn9i4qeaZCP0WOORsMDsZeIIp58cpNAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94wX4suIV1GK8s4HZbrP6xJpjbGvOrIUXoLxn+3No1A=;
 b=SDwvGOTuSSe80qrXwM9wEAjWWdWnMKcyJ1FGFCpSbqkRWv5MY6JRpbDhWeqsDBqfaVrCjoUuLIrJymCkqPHoPxXxw10OV0WDTP6RM3xW7HVoCZsAdnvtuXrjgCTGEBZbqrO/5okQEx/H31UCexj9GK68/gndqnx4B8BgHYa7deo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU5PR08MB10658.eurprd08.prod.outlook.com (2603:10a6:10:523::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 05:44:00 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 05:44:00 +0000
Message-ID: <76afb4f3-79b5-4126-b408-614bb6202526@arm.com>
Date: Thu, 22 May 2025 11:13:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: Optimize mprotect() by batch-skipping PTEs
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-2-dev.jain@arm.com>
 <912757c0-8a75-4307-a0bd-8755f6135b5a@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <912757c0-8a75-4307-a0bd-8755f6135b5a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU5PR08MB10658:EE_|DU6PEPF0000B61C:EE_|AM0PR08MB5522:EE_
X-MS-Office365-Filtering-Correlation-Id: b10e8768-647b-4e6b-16b7-08dd98f3bbb9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ekZLUCtGTjZuMEVDU05IV05lZ3hOajNzTkkzNE1aWFJBOTFoS2paNGtoV09q?=
 =?utf-8?B?UmNubEdJQ0tpNGttK0I3ZHlHTEZxcW1XRWUzUHh3S1FoVVh6dEdBUlNQR2ts?=
 =?utf-8?B?MXloNEs3MTFJcUYrSG5FV3dUNm1IaGNiRXI5TmVhY3JPcFhjTTdQb1NEcWhW?=
 =?utf-8?B?Vk14dXNOZFZUTklRS29wRUp3K2FwdGUzUkZTK3dKdjJicDBJcnBNbnNLTUc1?=
 =?utf-8?B?SEFQRU5URHRZUnFQSWxhWjkxM1o3MGc0b0NOdnBUT3ZBVG1oMDVsZCtzQW53?=
 =?utf-8?B?T2NGSWYyaVZvbDdBcldRSUw5bUFYdm04MjVERGVNdDczZXdWY2toZkRpV0hp?=
 =?utf-8?B?bllYN2ZuOGhHbWNiSVduQmd0dXZMMGtHTzBHdVJHeTAySXNPa28zSzZDc0hI?=
 =?utf-8?B?TGpobW1jOHo0enNac3FLZEIwMTNuak9MdXYwU2pXRmVBY01yalVSTmNaWW5I?=
 =?utf-8?B?OVJ0LzZwcEZCeGJZT01LcE42bHVITnk2N3VyS3VjWG1oeE1ON1FjUTU1V1d3?=
 =?utf-8?B?MGNVWEtsRlRRbkxDdFZCZHhXVitBa3QyMzlVaTdmU0Vac2s5eUtmb21aSnd2?=
 =?utf-8?B?a0V1N2RrVlZCelh1TkdnVnVHU1owYkhxNXZhOUVvNmxDd3pPYjU2VlIyTUhm?=
 =?utf-8?B?ZVA0TjBkelI5RVJYRTc3Mi82V2tudFhHdjNZNDVnNVJpeThTbTlPZ1JpSlI5?=
 =?utf-8?B?emx3bjhQSnkvZ2gvRkFpdC9hWkpzTi9oQnpRVzJxRWE0eWh4YzVRbTg3MkJF?=
 =?utf-8?B?NlJRUm1LRGQ1UmZPYWttSiszcTlQNlhyOXgvOWRDUDJvaVNJclJNcUxTNyth?=
 =?utf-8?B?MTdPYmNDTmlYOHBndUs5TzdaU2VaNVhaZFZjclFwRnhFN2xuZWxYY2JEalB3?=
 =?utf-8?B?WWlUWGFCOU9KQ2xqeHFZL0s5SG9XRTR1bkV1T2F2eHJhTi81YzhTQnBoYkRr?=
 =?utf-8?B?Z3lLV3VyQnY3cHdGV3FoaDczS3NrUTJ6QllzV2piVDdubW1PUUM1Nkk3aml1?=
 =?utf-8?B?c1JJK1FZdHNSeW5PYVNoRXM0NTYrdWpleDNUSUFCNzZrYmlxQUFFUFJXdXYw?=
 =?utf-8?B?bTJGWHN3YUZORjRTdm10YWVraXdVYVBsWEU5WVZqdldEeCs2L2srLzF5WkJi?=
 =?utf-8?B?amNhc2h4ZXZFOXVBMGZ4TVVrek84RFprT1ZpUGQxMnd4N05PL2dBZGR1TTZB?=
 =?utf-8?B?bWZhU3JFSncxOG9IZ3JVU3pWZUFLRmhCTG96SVNXSWw0U2dKeXN3U3lHS1Fo?=
 =?utf-8?B?bjZTdXF2bTN6NW9qKzlSY3RWdTAzUkQ1amx0RVUrS3R4MVBRU3dwS1RGQ2wv?=
 =?utf-8?B?UHl3dWtYQlhsYkMyQW9JRnEySWxSUUJaOXY2bFpnYTNXWWcrNmsxSGhqQm1p?=
 =?utf-8?B?VFV6QWRYV2NlV09pN3hoWWlBcjc4RFV4dmt3YmN3T2N0bS8vOXJxQ0ZLcWVT?=
 =?utf-8?B?ZUdESUJMd0hZMlFNVTMwQzZpNlBTcitKWWdqUElLS0hXeFMvRGZMT2ZHTnpB?=
 =?utf-8?B?MklvNDJQcmx3blJNWnJQNHlhNXFpUUJLdElvdmEyRlNaTUlFRTJScnlFb0tM?=
 =?utf-8?B?OFZzU1R6Z0dIWWpWbTk2Y1dLMHRkQ0Z2ZnI5dUduRmRoc3VmVVZoUnF6ak9K?=
 =?utf-8?B?RXNJWndoT253WXpsL2tzaGljcTlNVit4WkV2Q2ZvNDdaTzM1d1lFeS9JMHVY?=
 =?utf-8?B?OWlvQWJlMlpHemRPNmd0WUJMelRtQnBWNE9yV2xja1hvdTFsSXpQVnd6Y0o0?=
 =?utf-8?B?TVVmK1JkQ2RiZmg1ODhNUUdZdDNXdnRPMzl4NkpXQTl1YkUwWEY4dzlNdWdw?=
 =?utf-8?B?NDVIQmdNWUZvOXNxczdTVmFxS1JMRTRjd0lnUzZGeHVubTEvOGt4VFh3UStm?=
 =?utf-8?B?NUl2V3lvYUhwalRqbWw3Wk5ES1Z0QTZReFU5dVVFZitKc2c9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10658
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37f6442a-4926-4c20-96da-08dd98f3a6ca
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|14060799003|7416014|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDRZMStxMHY4czREWm5rZlJUclArekxZUkFKRHM0ZTNPZDVZSVRyQ0IxZnBh?=
 =?utf-8?B?bVFpSGtndUozZEppK2ZsNlpmOEF4NzBRaGh2MUg5NUhSaEdTcERWTmhlekly?=
 =?utf-8?B?ZjJHQldjTHptV01UaVJ5d2FWL0Fia2xsUHVHM0ZLeFpaNjZENWNPVE1wL3JL?=
 =?utf-8?B?Nnl6QVordXQ2SVczS2N2TEpkMjdUZDRiRjl6TUU2dmFpM3Q5TFFSYitDREtH?=
 =?utf-8?B?aWo5b0NITzJlSlB5YVR4eWF4L1VJYVlSb1p2V05uem1nbFYxMkxQREo5QWxE?=
 =?utf-8?B?TzZQK0VmMVY1dHJzVTJROXpDVXhKTXkreVI3UzgwSzlrSlBuR3ZoeXFRMVE0?=
 =?utf-8?B?TEV1K1FFM3YxZ0dSc1lZVjlJV1ZEMUJPdHNiUnJVMEtGeDYzdmNQdGJiVUJn?=
 =?utf-8?B?anFjOUxJMUdIbXQvZ1JZd0ZFSnFwVnJJalcvMGZRWnFrbnRmcUN4WDRmU1Zu?=
 =?utf-8?B?STFxMkMvV1B3NFVvMW9kMGdQSjVjZ1VaZi8yWUxOYmtmL0NBTElTUXhjS3FZ?=
 =?utf-8?B?YmlIaDRxcmJpUU9qc1QvTkJEZEdWeGNQai9FZy9BeDA5VGp0eDdiN1FLS3A5?=
 =?utf-8?B?RTQvalRRNDU0YzU5VzBHR1B2Y250YzlxN0hTYWZOcVZmSHVrdWFZUHZoOFQ4?=
 =?utf-8?B?NlNjOEtnWkhBTnlKdExFTGx0TGViSHRTZkJxd3l3NHBodE5iVExSNFNqM1lr?=
 =?utf-8?B?SmxCZm1ITkk0bjd5NmNrZlA3eE16d0dyS1AveHhYQ3BFR1BPWUNhSTBsT2ZO?=
 =?utf-8?B?a25ORzI5QnFub0o3MElIOE9Kd0JXRG1MbCtiTHJSTnJXRkZCVlEwN0pNNHZS?=
 =?utf-8?B?Y2pQbkZvSCtRMWJTOThqdzhoSlQ2a2hZOHVmTWNhMmkzK1F3YWQyVEt0OXo5?=
 =?utf-8?B?aWZxeC80SzdPLzhndUtOOGZFOERQL08zdFpNUmNLZGVHdGo5dmN6eDBNcXln?=
 =?utf-8?B?dTB6UE9uSlY5MnJ3M09Pc2N3UWlXa25sOGRqNkpWY0F1Ukcvdzh3LzhEcTBt?=
 =?utf-8?B?R1ZlcGNOSnk4amRPOURtVjZyZ3VUdUlrSXBiQXM1bHFuTVNJRzRFZ0lhSE1O?=
 =?utf-8?B?TVZJUHlGcXloa0dHaUNMcVp5Rlhsc0dlV3pJaDM4QkZyMHd4Y1NYUUlRNnR1?=
 =?utf-8?B?SmFoU040SkUvd1VpN1V5SDQ4WUliYWxqSjExNmlTbmw0Z09sNXBPeVRJSmFP?=
 =?utf-8?B?eU1YeXA1QTNhSVZla1NoMXRuZ0dFdTdYeXI0amRjQmJzbm5ZU1VZenRRSURJ?=
 =?utf-8?B?eThQazdKN0ZJbEhmYlhnVXYwTmRJUEpXOUUwNzZyV1pUY2QwWnJ4Wm42QlpH?=
 =?utf-8?B?bUd1L0FkUkQraWpILzBlMGQ4L053NC84OFlFbEEvMC9SdHBPMjNXeW5PbXFj?=
 =?utf-8?B?a2NFQ05oK1ZNbWRZMEtCdjM4Mkx2UHk5TE9DTGx4dlJWd2RZMTRWTG9GNGVE?=
 =?utf-8?B?V0xZaVR3SGZGaGVrdGwwU2N6dXZBV1NxSXcvaGhybVVhZEZLaVl6MU9lWUtZ?=
 =?utf-8?B?d25iNkVJTnRSeVVrTUU0L3R0NTIwamZqeFVDbmJMRW9XVC9SeVdMc1dxZzVJ?=
 =?utf-8?B?clJaRWltcWtuNUQ1aW05Wmx3cys3ZnE1QldTRFBMTlNldWZEc285QXZuT0tv?=
 =?utf-8?B?NzRWK2tGL01RME8waUdUQmVIRFdTTnB2c2hMb1laRDRGeXdZVHBHNFYrS29k?=
 =?utf-8?B?M3hRZGgzd25kUlJSdFhWNzg5bU0zUWp4MFc3aFhZQkZoZFgwOTZtamVBeXh6?=
 =?utf-8?B?dmk4dzM4VWtEdnVVaktaY1dUY1pGaEZ4TkRueEgyVU9WdlhINWFKSnM2WmJP?=
 =?utf-8?B?WE15NGtDUk5SK1Z0NVh1elpnR2NscVN4b3FKZnF3Wms1aGhzQ2pCSmVSOVp1?=
 =?utf-8?B?ZDRHYkpLM3V2WEhVWkJaTERIM0lIZDV5SzR6ZXVwRU90VXpGWVRsZmwxUFFz?=
 =?utf-8?B?SHk4RWNIUWVpZ0NrbGNnR2ttOGExdnhsN3VpQm43eU01d0NCTVZLamNMbkV5?=
 =?utf-8?B?ZW1rMEhKeVdDNDFDcUN6bWRoTXNYSTZ4SE4zeklWRUJsYVBSV3VxbUZ0Yksx?=
 =?utf-8?Q?Ubyws3?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(14060799003)(7416014)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 05:44:34.9323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b10e8768-647b-4e6b-16b7-08dd98f3bbb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5522


On 21/05/25 5:36 pm, David Hildenbrand wrote:
> On 19.05.25 09:48, Dev Jain wrote:
>
> Please highlight in the subject that this is only about 
> MM_CP_PROT_NUMA handling.


Sure.


>
>> In case of prot_numa, there are various cases in which we can skip to 
>> the
>> next iteration. Since the skip condition is based on the folio and not
>> the PTEs, we can skip a PTE batch.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 36 +++++++++++++++++++++++++++++-------
>>   1 file changed, 29 insertions(+), 7 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 88608d0dc2c2..1ee160ed0b14 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -83,6 +83,18 @@ bool can_change_pte_writable(struct vm_area_struct 
>> *vma, unsigned long addr,
>>       return pte_dirty(pte);
>>   }
>>   +static int mprotect_batch(struct folio *folio, unsigned long addr, 
>> pte_t *ptep,
>> +        pte_t pte, int max_nr_ptes)
>> +{
>> +    const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +
>> +    if (!folio_test_large(folio) || (max_nr_ptes == 1))
>> +        return 1;
>> +
>> +    return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>> +                   NULL, NULL, NULL);
>> +}
>> +
>>   static long change_pte_range(struct mmu_gather *tlb,
>>           struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>>           unsigned long end, pgprot_t newprot, unsigned long cp_flags)
>> @@ -94,6 +106,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>       bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>       bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>       bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>> +    int nr_ptes;
>>         tlb_change_page_size(tlb, PAGE_SIZE);
>>       pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>> @@ -108,8 +121,10 @@ static long change_pte_range(struct mmu_gather 
>> *tlb,
>>       flush_tlb_batched_pending(vma->vm_mm);
>>       arch_enter_lazy_mmu_mode();
>>       do {
>> +        nr_ptes = 1;
>>           oldpte = ptep_get(pte);
>>           if (pte_present(oldpte)) {
>> +            int max_nr_ptes = (end - addr) >> PAGE_SHIFT;
>>               pte_t ptent;
>>                 /*
>> @@ -126,15 +141,18 @@ static long change_pte_range(struct mmu_gather 
>> *tlb,
>>                       continue;
>>                     folio = vm_normal_folio(vma, addr, oldpte);
>> -                if (!folio || folio_is_zone_device(folio) ||
>> -                    folio_test_ksm(folio))
>> +                if (!folio)
>>                       continue;
>>   +                if (folio_is_zone_device(folio) ||
>> +                    folio_test_ksm(folio))
>> +                    goto skip_batch;
>> +
>>                   /* Also skip shared copy-on-write pages */
>>                   if (is_cow_mapping(vma->vm_flags) &&
>>                       (folio_maybe_dma_pinned(folio) ||
>>                        folio_maybe_mapped_shared(folio)))
>> -                    continue;
>> +                    goto skip_batch;
>>                     /*
>>                    * While migration can move some dirty pages,
>> @@ -143,7 +161,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>                    */
>>                   if (folio_is_file_lru(folio) &&
>>                       folio_test_dirty(folio))
>> -                    continue;
>> +                    goto skip_batch;
>>                     /*
>>                    * Don't mess with PTEs if page is already on the node
>> @@ -151,7 +169,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>                    */
>>                   nid = folio_nid(folio);
>>                   if (target_node == nid)
>> -                    continue;
>> +                    goto skip_batch;
>>                   toptier = node_is_toptier(nid);
>>                     /*
>> @@ -159,8 +177,12 @@ static long change_pte_range(struct mmu_gather 
>> *tlb,
>>                    * balancing is disabled
>>                    */
>>                   if (!(sysctl_numa_balancing_mode & 
>> NUMA_BALANCING_NORMAL) &&
>> -                    toptier)
>> +                    toptier) {
>> +skip_batch:
>> +                    nr_ptes = mprotect_batch(folio, addr, pte,
>> +                                 oldpte, max_nr_ptes);
>>                       continue;
>> +                }
>
>
> I suggest
>
> a) not burying that skip_batch label in another if condition
>
> b) looking into factoring out prot_numa handling into a separate 
> function first.
>
>
> Likely we want something like
>
> if (prot_numa) {
>     nr_ptes = prot_numa_pte_range_skip_ptes(vma, addr, oldpte);
>     if (nr_ptes)
>         continue;
> }
>
> ... likely with a better function name,


I want to be able to reuse the folio from vm_normal_folio(), and we also 
need

nr_ptes to know how much to skip, so if there is no objection in passing 
int *nr_ptes,

or struct folio **foliop to this new function, then I'll carry on with 
your suggestion :)


>
>
