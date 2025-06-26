Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F2C43159
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750910053; cv=fail; b=Nwz6yiXlG0ihPcaeZeDKHxf0VtMwR4kINWCu1QFkVwCC1uy1ZCjQqIhrsDrmnvM3fWiDH8XAomsbN+sheQR2FBqpij98OPXmEvotsByeGUEWuNVvmdipuWU5dxlCmn8guVNjDtv/hjydWX7drOiDBBq53xIPLYCJScINVMZOekg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750910053; c=relaxed/simple;
	bh=Cepb+YQUSciEkZWu+iLEP11G1Ztn8vxT7lEGUiWifPc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AzAI0xyd2XSFfLyAZF0mkhm5Xy0SfefaCADsIcIeim9ibdIbpg0JChKxbV3qqmYk38VQJc43IfjRhW//vbh4v/C9R3Wo/eWQiOBqYBU6qZdydrb3aAQ+DFTybXkmIu3bEDz6ATDc8CG7q0wa7ZU8de+YwgwVCHedQQZux1aXN5E=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=od/z1jeK; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=od/z1jeK; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="od/z1jeK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="od/z1jeK"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=viu8bv46Ns2Yaykk0tsnp/po8xIcHOIej4Vlnu2c7ztZIBjlhNyPNrugzJS/QD7irrAJ/sc8X2JACOjKYxjDpIxVxhUV1R9JHrVmD7d7zSAd3RTfv4g4dM3zRgw2tISFXmaOYY70uGv7l8+tQx7ApfDKg6iEIlkTSJloTt30bTGKuINQaf4TcA16F8ebtBhKKWHQOKBIx0EXRVHLABiGGOpvyXCQTiFZZusNVe/K0OI6a3Rp2hzVv6FmePUkqKqV4BV+Ykoa1C1hNJbU+Pow+SYPz1d7rqxnj0aAhny6Roch546XsnV6YG11eqtKE7Qqh2KXRz6o5MrJ7Kq71kqKGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=supl1BZ3lSL3+KI2JJBJWyktPZGYGpDICMVxCF1ss5g=;
 b=H9xTQEKXpH7CXBcpKE1QdWBxJbZeBXMZ0m1kCLrlPVrtHTTpcYuv3G0dtx4U7ac92vocmq9v4Yp7my2D+pziLKqno6iwCQtB4PW6aP9VplNTespo8V8PV7Y4v/0QkM1kdLKkT4g04NoOOqoBosbXeCutZzNlSLM+ExftuLHhFXNh0UhiEzDsWJ8x2+IW0IdYHn/9k9nLMtjdHI94EhBHsh6ibOxt4XT5gvQ3ZnE4XSvQJYe/IGEKMuOVO5znWw7XMkeTHCA72+/Ds06CNkQkDNPvn+FLh1J3JFnHE2/BrE8H7FKEqd8vf9ssgMPUr6lmyfg0flOrXGiXJy59hhoKAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=supl1BZ3lSL3+KI2JJBJWyktPZGYGpDICMVxCF1ss5g=;
 b=od/z1jeKGxAguw5+lTiH65IATCAUCBtoX25VySPsvVwq9pAV5A8OBeIktsXSeiiQa+1U2wNi6I3aysAScxPX3QjojLwwivKnYiMdNcVfnhRwJbS51a8v/Gmz5qH2XOwzmi4lMOAryj0ARelGMlGP1d2lDnLYIEJfPZZnChD9ypU=
Received: from DU2P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::26)
 by AS2PR08MB8381.eurprd08.prod.outlook.com (2603:10a6:20b:558::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 03:54:05 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::83) by DU2P250CA0021.outlook.office365.com
 (2603:10a6:10:231::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Thu,
 26 Jun 2025 03:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14 via
 Frontend Transport; Thu, 26 Jun 2025 03:54:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/P7JdUPmVrvDmGEcfMZEW+vWMse4THCEwcadM1YfRMpGSkiWPTu7wPN7gveY6eNg25L1WEoSwQA8z3sUHrhwTh1iC6KYvKjqd+P5Yx++Q8/3kIl2ULqCKjAP2HMunagBCse3DN8fqBAARV3shxkat4NbBWHuNX/YJIuu1s1enAZFzqomuCmWZXX/2T1soZf/R6G9wPHj+p902ARbGrpKytoxmAMQLBJuCfoRWs64dVMmLjCj3ytPvr2dfyYubLeCg3Re2jEptPrxXtyLb7DYvhsRm9pRAgPeu2qjMX0k4QBKaw2i2vIH/aN6VubUI/clo0WlWnvBolr2Ddq2kPspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=supl1BZ3lSL3+KI2JJBJWyktPZGYGpDICMVxCF1ss5g=;
 b=A2wGx4DBSydeOKuLTGjbNfoqGxru4D6TdXePFhAuBtIIPh26djBY9tYqSWfIUmA8bjQqH8kfvReVd9R5lgf8x+bk4HGPkgAkpMrEprugejbZTqIsJTXcmvwyjAk5KSh88LgUYX80ks4kfndjpuLqZk9flE+BWlArPEhwnusSmUbi1W7KSLAWv7MmF8/ZYMIGUfjEHw9+03yoPIFOUOph3ju8F/evXLC2Ln1vjO3A2c22cb8zSid4q+G0ZpvBeOrgvKpfzYNj/KDpGNeYOQMSAyJx9Yj8ltd6nWXB0SL21nPSpkkKNRwIAa2wQ74+2EfdbH6Lt4W/zUh5p09pzRYe6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=supl1BZ3lSL3+KI2JJBJWyktPZGYGpDICMVxCF1ss5g=;
 b=od/z1jeKGxAguw5+lTiH65IATCAUCBtoX25VySPsvVwq9pAV5A8OBeIktsXSeiiQa+1U2wNi6I3aysAScxPX3QjojLwwivKnYiMdNcVfnhRwJbS51a8v/Gmz5qH2XOwzmi4lMOAryj0ARelGMlGP1d2lDnLYIEJfPZZnChD9ypU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB6005.eurprd08.prod.outlook.com (2603:10a6:20b:298::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 03:53:32 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 03:53:32 +0000
Message-ID: <f0037dc3-a8a9-4dda-9ba1-1032eeb34895@arm.com>
Date: Thu, 26 Jun 2025 09:23:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-2-dev.jain@arm.com>
 <f350b114-c932-4516-98f6-caf3599208f8@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f350b114-c932-4516-98f6-caf3599208f8@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::31) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB6005:EE_|DU6PEPF0000A7DE:EE_|AS2PR08MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: c2816d89-e44d-4f7c-2949-08ddb4651817
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cWtZWW50Y0ZQS2VuVzhwcWkxdFF3eEtwWmJ5ME82SjZVY0FOYnpUWlVRa05p?=
 =?utf-8?B?NU5MWFBOQmVJQkZCb3h5eEo1Z0hFczErU1Y3LzhUYklzMkNwY2E4TElPaVZ1?=
 =?utf-8?B?VE55eHVpK2dnZW5uUnBvUktQQ2UxOTFOSzJPWEZvekliNFg2UzdQUEQrdTY4?=
 =?utf-8?B?RlJ1R1g5RnV4dHJZbWhUYUxnNnltWGNFdDEwaDQvbjJ2MGgxTXc1OFNwVENW?=
 =?utf-8?B?WEpLQkRDdjc1K3RmUlJwYmM4WkR5eVpQNVNINlg3dUV3MG1jdSt6OXU3allp?=
 =?utf-8?B?QUlnNFk2YjdjVFl1SWl6cFJkLzFOR1l2TVdFazFtRmQ3TUN5dldJZWZXVHVq?=
 =?utf-8?B?MXdxNWRNa3F2MVltTUh5V3M0Tzg0ZEc3OFBubWI4eVRZZHAvZGpDWXdvUDFn?=
 =?utf-8?B?ZVFSM01nSmRtbDdSemd3bjduaSswZVR3Q3pQbUdIUTRlR1lVYlh6VUFNTDVZ?=
 =?utf-8?B?ZU1zOTlmOHRaZmkvaHBKZ2taZm5HVlR0Szg5N1d5ODMvZExQQXU3eUVUN1NC?=
 =?utf-8?B?SVdMeURRVUdIRlNpTENLeEsxb1NEdWoya0w0T1hnZTlkcEM5ZGtINkhwem13?=
 =?utf-8?B?T3ZTUDlQSVp0eEp2bWZrdk5ndlhyYndLVzMxVndyTTdTZmJqMmZxdXk3aS9Z?=
 =?utf-8?B?ckNGUEZQTkdPM3ZEc25BN3c2a1BRMWE1QXdnelF2UTBsTnlCT3NBQmNsaUJP?=
 =?utf-8?B?c0t0SFkvcm14ckxXYXRmUGlLM0VNaUx2K3llU1U3ZzNFUFhQRnE1cTl2bVFV?=
 =?utf-8?B?T3pGRXh3Sk1PdFhWTmo0WHhjc0doQjRuQ3ZGWkpUbTVjNXZLWVZpeVhHd3lL?=
 =?utf-8?B?S0RHVzI2cUp1cEVwK0tEMDB6cEVSbnlRT0lZTzM4dGdjeklwZWtBV3poa2I1?=
 =?utf-8?B?VitScUF0VlM3TFA1Q2tueTdsNGtmSU5pcTVxL2lsNkhtbFJXZE1yM1N0VjFO?=
 =?utf-8?B?OVFPQ0xIRUJsZEd3cHFyY1k2NTBHSlB3MDBNWk9MOHRmYTE0d3NSeWVwL3Rv?=
 =?utf-8?B?M1ZkaUVXeVJBWGoxQllhdkM0dldKYVk2RjRpUWJYWUVrYllQcm9SOFVNemY0?=
 =?utf-8?B?ZTVCR3RDb2hQQkhYYWlFaDJ3S3ZwajlXWHJiM0U5ekh0TEpNZWJFbW42N3FG?=
 =?utf-8?B?S1FhSGFnWnJSYXc5R2tzYTVuZ2FUTDRmSDBUSXhnR0tEbnBnOFhLdW9lbGY3?=
 =?utf-8?B?d3dKWEJrQnY1dzNJQ2xtRGpnNExhNEhiN0dkMTJBWVIyMlJUUm1FdEdBbzFE?=
 =?utf-8?B?MGlvMTN2OGM0YWN4S1BwbzVaRXVBWVpBSVBab1c2Yk41ZE9DN2t2b0FGcHhJ?=
 =?utf-8?B?dXRNR3F4aWF0QnFmczlsbGJyU0R1UmQ5aDdYSlhKQ2NGVzFQOTBnemVxK25F?=
 =?utf-8?B?bFdWcDJjUkhacVhxdlppMUpaZUpkSDVlUTBnTG5sSmcraG50bmhQVmZJVDZu?=
 =?utf-8?B?Z0h5RE5pbWFvbzVaTVhtN2syazM5UE85blVHd21PYldnbWhOTlNuNjFla3J4?=
 =?utf-8?B?emRsMXBjMkQ5Wm1WZnI2VjExaWo0Z0tZRHhvbWlENFplVzJieFNOZ3VGWXQ4?=
 =?utf-8?B?Y2owRmM5UnBPTDNhZDBoL3dPdU16aC9YSXdmTTNqb2ZiaWxvbmV2TkMzbEZS?=
 =?utf-8?B?ZlVZa2ZEd1JueWtVT2Q0RS82eDk2dnpwU1lEQnhGOEF4Y1VMZytYam1UUnpB?=
 =?utf-8?B?cG5GdG1SYlRkNitObUZVNW9Gc3V5ZWdnVmNKbmZPSzE2MnpPUkJpeGdMejlI?=
 =?utf-8?B?QURRUWc3dmtxNEdacENTUFA5Rmt4M1REaUl2ajZSSEVrbHVKRktIOFAvU3Ir?=
 =?utf-8?B?U29WOE1MZ1ZTaGNFVFg0MjE5ODRFbVh0eGVqYllEYkJneTg0T25JaXdkZ09I?=
 =?utf-8?B?ZTRRZmNBaldUaFhScFZtTkIrZU5MN24xb0RZUE96WkVFTGc9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6005
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45e88794-b25d-4930-6e9e-08ddb46504a8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|35042699022|376014|36860700013|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3Noa2cwdzVQMzdOT1Z4eEVxcXZZUmg0aEtJMnRWYzNqblRySHcrWUpFejVq?=
 =?utf-8?B?b08wc2FzaXZQMFRudnpDMzNvNysvK2ZVbDhFbzdISS9IVkp1Uk0rRHk3TWRh?=
 =?utf-8?B?MG1saEZrNHdZM2hWQ0FlYzZvV3FUdXg2R3FoY1FqWnFWOFJBcUlsdGt1MkJN?=
 =?utf-8?B?ckxjdU81aXBCWERrM2xsSjlVa2pkK3dFSENQTHFZWXpJVFgvL3BVWnV1NElm?=
 =?utf-8?B?VkFPa0ZVeVp0WDZzNyttMXNsN0xLQUFvS3FNSHk3SWt5UktRdXVIdWpPRTV0?=
 =?utf-8?B?aWJNQmQrUjFRbW9ObG9qVmN0SVBjbmN5R3VLYVVGK3Mxa1R2clFGWnJNT0RK?=
 =?utf-8?B?OWdESDJyc1FMK250VG81RzFWdUxlYm0wWEN1dFErUkNkc2h4Z0w3blYrUVpW?=
 =?utf-8?B?akMyakF4VzE5OENScVI4VWpxRXhUaEtkM3RvUGlscUZQOWoxdzFFVTIwWUFJ?=
 =?utf-8?B?RzYxZDVoVFNXV2YxVTNqZVllUlJ2MHB3YUhtSmJSeDdFR0s0MUZDaFh6MXhI?=
 =?utf-8?B?Sk02bkhnck0reGtLWlE2ZnVnbTh4NlNFcDNHZU5DMlU2cHdlVStFakJyOEMz?=
 =?utf-8?B?MkxINURnVHJzVW5xQkN2d2FtcGpjWDVyZ2hLRlV0cmdSdnhIRWJqUzVPbWc2?=
 =?utf-8?B?R1Nvc25FN1VSWWU3OXNETVIySElwMGgwZm51UHROK2xaWjU3VzUvV2lBdmlx?=
 =?utf-8?B?R09PRFpOL0VoOG1HUzJJdG03Wi8rR2RBZjM4eEVuVzRTZDlWbUVGUVRPNXRy?=
 =?utf-8?B?THR3WWY5eTh2RUR6bmtiSUpNd2ZXYUVjbWVWT0hpcDFYZzJlMGlRSEJrZ2ll?=
 =?utf-8?B?Y1JaVWJuaXRZNzVLTHMwcVVrUXJCQkFhTmJndXN5R2pVSXc3dnI3K1ZKN2J4?=
 =?utf-8?B?OFl1V29FR2prZUIwanVUdGZjN05xakw0Um9hQTFHOGFja3R0Nm9UMEMwMEQr?=
 =?utf-8?B?Y0RkOEp1ZXp5b3pQVXk3bEpBZHJDYm9IRVAwQmRMNE12U3gyL2p2eUU4cG5U?=
 =?utf-8?B?d2F2bTAwMGJTWkFzTGFPSTFzdUY0eENtek1LdXFhNnh5RHFnc241d2RtSTcz?=
 =?utf-8?B?aWpRQUNaVWJ4aURnMDRRQWxwMCs2dTNpT3FGazRwK1dlSXhhbGkrVHZreXQ5?=
 =?utf-8?B?eUVZQnVZeUdJZEUzNytNakdQV0JxTjNQeUc4eWY2bWxWR2J6VHBVSVpKRisx?=
 =?utf-8?B?V3FMQ2JMRjBJaDZiWGNaVTJDeEEyMXI4dXptdFF6ZlE4RFJaRnZXaVZmclpT?=
 =?utf-8?B?aldVMUVjZU9kSnB2a0psMUpsUVUvYlgwbWZkcHBsR0xlbFcrSEhkU3o1b1hp?=
 =?utf-8?B?SUlWWkxFNG9GVTVlWnFoWlhuMUNKRmY3VHhtNUxzaU1pT3NlcU0ra1pmakMz?=
 =?utf-8?B?R1N6YUtpcWdOMnNuMW5vR0ZsajlMeWFUWnVLYTlUMlRyZWRIb2ZvMlBVQklS?=
 =?utf-8?B?YTZMODFyZi9PeWpJeTV6ZE1ndU1PeitpelBNYzBMYUFnOFBaZlgxb3dzMTNy?=
 =?utf-8?B?TkdMNEhNcHZoN3NMUDQvRkd6eUtQV2NTeDJDODBJRmtFNFVobHJKSml5NWs0?=
 =?utf-8?B?MjhCdnlkdytQckhpNXM3TFU1U3Q0c1gwa20rcUxvd3ViSTh1Rzk4c0Y5NHQw?=
 =?utf-8?B?NnVRejBBNG9wV1BtNjl4RklLREpTVHduU0FJbXhNbFlNTFYrVjU5WTNSZ2NY?=
 =?utf-8?B?WVpUdUNvV2JaV1k5dElwV1YxcE0rZk91TzlnbFovUllqTm10M2tCWVFIREc0?=
 =?utf-8?B?c0t5WnUvb3ljYW51ZDJhOG9qN25JZElaV1Y5eFRYTkdnSlE4S0FEK2ZIMmZh?=
 =?utf-8?B?V3BwaEV2MmdUUWltaUZTQUJzK0VENysyR1JMd0hBbG05M25UelQ5dmJWWmFD?=
 =?utf-8?B?czdIa3dmakpWSk5sQkl1UVlPRmNMZmNDcVFmR3ljekEyaEY5dTZyL05aQWls?=
 =?utf-8?B?OHgwOStvWm1OK2p3VTRrTDMvQ09tNkZ6T0xyejlrU3hiMEF5ZldpcGFINmxK?=
 =?utf-8?B?SXRiR3lxbnZRZ0w4cUpRTlk4VDRvWkZIdHM4c29WQlBYSWpWbExEa1ZiNFAx?=
 =?utf-8?Q?r6m22P?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(35042699022)(376014)(36860700013)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 03:54:04.4253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2816d89-e44d-4f7c-2949-08ddb4651817
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8381


On 25/06/25 5:44 pm, Lorenzo Stoakes wrote:
> You forgot the v2 here :) this breaks b4 shazam...
>
> I managed to do this on the cover letter (but not patches) of a series
> before. So you're in good company... ;)
>
> On Wed, Jun 25, 2025 at 11:28:04AM +0530, Dev Jain wrote:
>> Use PTE batching to optimize __collapse_huge_page_copy_succeeded().
>>
>> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
>> Then, calling ptep_clear() for every pte will cause a TLB flush for every
>> contpte block. Instead, clear_full_ptes() does a
>> contpte_try_unfold_partial() which will flush the TLB only for the (if any)
>> starting and ending contpte block, if they partially overlap with the range
>> khugepaged is looking at.
>>
>> For all arches, there should be a benefit due to batching atomic operations
>> on mapcounts due to folio_remove_rmap_ptes().
>>
>> No issues were observed with mm-selftests.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> Overall looking way way better! Just some nits below.
>
>> ---
>>   mm/khugepaged.c | 27 +++++++++++++++++++++------
>>   1 file changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index d45d08b521f6..3944b112d452 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -700,12 +700,15 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>>   						spinlock_t *ptl,
>>   						struct list_head *compound_pagelist)
>>   {
>> +	unsigned long end = address + HPAGE_PMD_SIZE;
>>   	struct folio *src, *tmp;
>> -	pte_t *_pte;
>>   	pte_t pteval;
>> +	pte_t *_pte;
>> +	int nr_ptes;
>>
>> -	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
>> -	     _pte++, address += PAGE_SIZE) {
>> +	for (_pte = pte; _pte < pte + HPAGE_PMD_NR; _pte += nr_ptes,
>> +	     address += nr_ptes * PAGE_SIZE) {
> Thanks this is much better.
>
>> +		nr_ptes = 1;
>>   		pteval = ptep_get(_pte);
>>   		if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
>>   			add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
>> @@ -719,21 +722,33 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>>   				ksm_might_unmap_zero_page(vma->vm_mm, pteval);
>>   			}
>>   		} else {
>> +			const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +			int max_nr_ptes;
>> +
>>   			struct page *src_page = pte_page(pteval);
>>
>>   			src = page_folio(src_page);
>>   			if (!folio_test_large(src))
>>   				release_pte_folio(src);
>> +
>> +			max_nr_ptes = (end - address) >> PAGE_SHIFT;
>> +			if (folio_test_large(src))
>> +				nr_ptes = folio_pte_batch(src, address, _pte,
>> +							  pteval, max_nr_ptes,
>> +							  flags, NULL, NULL, NULL);
> Nit, but we only use max_nr_ptes here so could declare and set here, e.g.:
>
> 			if (folio_test_large(src)) {
> 				int max_nr_ptes = (end - address) >> PAGE_SHIFT;
>
> 				nr_ptes = folio_pte_batch(src, address, _pte,
> 							  pteval, max_nr_ptes,
> 							  flags, NULL, NULL, NULL);
> 			}
>
> BTW I think David raised it, but is there a way to wrap folio_pte_batch() to not
> have to NULL, NULL, NULL here? :)
>
>
> oh and if we do this, we can also combine this line with above so:
>
> 			if (folio_test_large(src)) {
> 				int max_nr_ptes = (end - address) >> PAGE_SHIFT;
>
> 				nr_ptes = folio_pte_batch(src, address, _pte,
> 							  pteval, max_nr_ptes,
> 							  flags, NULL, NULL, NULL);
> 			} else {
>    				release_pte_folio(src);
> 			}
>
> Which is neater.

Okay.

>
>> +
>>   			/*
>>   			 * ptl mostly unnecessary, but preempt has to
>>   			 * be disabled to update the per-cpu stats
>>   			 * inside folio_remove_rmap_pte().
>>   			 */
>>   			spin_lock(ptl);
>> -			ptep_clear(vma->vm_mm, address, _pte);
>> -			folio_remove_rmap_pte(src, src_page, vma);
>> +			clear_full_ptes(vma->vm_mm, address, _pte, nr_ptes,
>> +					/* full = */ false);
>> +			folio_remove_rmap_ptes(src, src_page, nr_ptes, vma);
>>   			spin_unlock(ptl);
>> -			free_folio_and_swap_cache(src);
>> +			free_swap_cache(src);
>> +			folio_put_refs(src, nr_ptes);
>>   		}
>>   	}
>>
>> --
>> 2.30.2
>>
