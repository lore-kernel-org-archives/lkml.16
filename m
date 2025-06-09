Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEEB2566F5;
	Mon,  9 Jun 2025 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475693; cv=fail; b=obhNVJM9uKZrZYuX+WeodCBYJBqA5Jk7fjvwed9j6LP+nLcFmdHdC7daxFLpFcXMZSN4n+M3MJw5VPurIQC3lwsFhOpT1LtthOBW3GZVFCeYZ42qx/F5cwj1wSRizz2GfSY+Sbp2Rv6kBWof9oGQAmpYOQIkvv5w33uzdV+CZdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475693; c=relaxed/simple;
	bh=WnXTQLpD67TEarseL97NPYNgeSD4DlPltTh9UYn9VzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A5wKOp8oim6b/cTsRJqUxTniMSdQupty1DZYV9vrVXYfwbciRLwY/SS8UpXfmkRGKvtYXKmP2tYGqFn+8KYk1cS6A8IEI3yKqGciLv0M6kAhTJwv2RENe+esMq5SdnTYfRcZd1dOSeGSGvw/kY34bBVlPm/oCKXZv43uGS8GWos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VvEKQbU9; arc=fail smtp.client-ip=40.107.223.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VvEKQbU9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DN5x4lzQkLuAiqZR4y5IyAf6pjoep4irGbWAEurg0qlSKIu7KF5P/s13/tbzy/FuXf6gvB9Ly2nP+9YO9QZ6gPcnb4KvEvGNt/9tEZDhhuF7mdmNRyBagzzb2PWkBJRxFBfNtlnonzT8pJ8z9HXAetNJxMwLRBL7Iy4auIZMSCjTXBTNJC0MvrAstws7svKjmCtCrtGJbyciGxL7OzcT+0/UbhchGZXfqdq5eQs56p6cwaGy2BD93Wl5fAbMwtaR72nCRrfV5IMQG14YLykxnCddlvrLQQ0zGWcubpzRZQ2ckQY9c99V0jdnYZtHHENglYt35xZfGvjrwb8JA+lT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnXTQLpD67TEarseL97NPYNgeSD4DlPltTh9UYn9VzM=;
 b=cD4KIisTs2EhkZt7ysaGEM35m4YPGEQ3y5cVR/Q1rSSb5McBooCiMIoayyZz//ApIP4M1VGQTLjMLbrAS0n022MTkM1vtiig34iSm4LCEOL5fdcHU1kmaZEoB/v3ihaI6AppjcOLSDhi4Vqac6v6TyaRrn128bEJjlq6LX2DfVdeQVA8Nr2VD7kQX9ZhORcUuff6TT05GZMqisSCfCIXtYAQtwvlcpc7rpW6t0HbPnP9spxGtAYtHydEWauEixVh4JuUo4xOS665NpTbS++3IRRSbaRAGSfXxjCBM/K8V3+HEN84FwUeinMAaXj+1zcn5KRuJxDorH9iVsb5znp8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnXTQLpD67TEarseL97NPYNgeSD4DlPltTh9UYn9VzM=;
 b=VvEKQbU97GvOJHcFqt+uvlEQfGcQAnLLuwaFcD8MazImKVmzOJYh8smcw9C8iyzLoMf5xvD0lDayOMIXkmPSDDEL4jB/kOOc5J71/gmOp5vxhDrHwosooudlAtlVJusVeVGyHvWOk7854pKgZD7QImqLy6K8nT/AAmtYF9zQVoLXpyDS6BEgdM/s5bwAqHfX9knpua5eGC6kowCKe1TPOsvNGmWXJ49Z8nR+x5TWBJuey49eN2bKVLA0lWohtpE0KvpZ2Kyf9N3qcZyqsanaWq9cRvU7QVFBnWv4vnThgtJ+GpYkRxeTBN0nIpaFq49bUDepxBzBSrhzewcQ3QWzLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW4PR12MB6950.namprd12.prod.outlook.com (2603:10b6:303:207::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Mon, 9 Jun
 2025 13:28:08 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 13:28:08 +0000
From: Zi Yan <ziy@nvidia.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, hughd@google.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com,
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Date: Mon, 09 Jun 2025 09:28:06 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <76D057AA-58C1-46A0-B067-EB78FE5D2D37@nvidia.com>
In-Reply-To: <4adf1f8b-781d-4ab0-b82e-49795ad712cb@gmail.com>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <4c1d5033-0c90-4672-84a1-15978ced245d@redhat.com>
 <4adf1f8b-781d-4ab0-b82e-49795ad712cb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW4PR12MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbb8615-4ca3-48df-e64d-08dda75978ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODJHa2c4SThMeUlYWXRwL25uay9HRTFjbmRHS1Q5KzV5WlY1TmJTdUg3MzZ3?=
 =?utf-8?B?RjVDUitPNVZGWUtSV1VwZVMzVTM4VFNGWkMvekQzbjZ4c2xTYWE1bWlUbXha?=
 =?utf-8?B?bkovVWdNeFFFU0Q5bUlBSWxYZGMvVG1jZzdnaHhKZDNLdndIN0tGL3RsTHNp?=
 =?utf-8?B?VGo2N0g1RUtMaVJmWkx5WnYzZmNMWW5kZ3gwSktsWFRpalNBQ20wVVgyc1lk?=
 =?utf-8?B?UVZQNlg2d0JlTENMZllrSHg2OTY0RDJlQkF1UXVFMnJHY1p3RU1RSGJERFBh?=
 =?utf-8?B?QzhKMHhRd2IramxIWCs2NEtudzhydllZanRmcDN0K2NqanVxeERQNVNWTnl4?=
 =?utf-8?B?OFkzR0M3RCt2RmtLeFZRY2pyTjFWZm1EaXBiNlM1enVmMEliNjIyM29SOXhj?=
 =?utf-8?B?Mlk4aGRaN0w2dlFVVlVzU0VENlNUcnZQYVI3cnhmNmE4cGZLUTZmMHQwMGF5?=
 =?utf-8?B?dTViRjZFc0FBSVArSkNlUUpSQ0VGbEdYQnZESjNSVnorZy80OXZ5R2M4V2Jk?=
 =?utf-8?B?NWpQQncyWlg1VUY5d0E5N3ZMT3lqL0E2TWp2MHpZaFJIbUtwZ3JDeXJNUThL?=
 =?utf-8?B?SE1TenlDQzFMTW5La0RMQ2s2UzJrUElLc05iRDFjNEI4Sk1VWlVwNm5FU25t?=
 =?utf-8?B?QlAxUTRkMzE0WnNyY3BaSmxHMFd2QUpSeGtkN1NBSzdBWXozdDA0QWxBMWM3?=
 =?utf-8?B?R2l5N2pGZUhrQ2Qwd1huZTErOU1MbC9iUmJoU0N4ZWhHZmw3bGZMUTA3Y05G?=
 =?utf-8?B?eDRYMFQvc0ZBd3lFQjJ3azB4Tjd1UDMyV2FKV3YyRnlaWG5pazdlUVB0M3F6?=
 =?utf-8?B?aDRCQ2dxelBDRzlDNmREUGMzc2ZaWmpHa29ocEZQcXJBS3M5bS9UZ3l5VTlC?=
 =?utf-8?B?T1RzZlZsRktkM1RXa3JOR2lSNTE1V2M1d214TFlOTTNia1ZBTDVLcm1Jc25r?=
 =?utf-8?B?QWI5blhBVjVsTFdPSHh4cngxaVNhaEVmMmptZXBSMjd3NGlnYTZyY2NmVEVh?=
 =?utf-8?B?LzFsOTZWV3VrbEJUVFlvUkJwWXlqTmJEenFSTUd5UGZydHh5cFRFZ0dKQSts?=
 =?utf-8?B?WDRDUWxjUjlBZ04xSTVTTGVHM0hEeE1sU2RWUWNES0hmMFV3aG9kVmJaY1ZM?=
 =?utf-8?B?eG9PUTkwMFNlVG92RVltZU0zRGFuYlh2Y044RytvamdyR01pVE9Yc2NFTTE1?=
 =?utf-8?B?M0thakUyNS9scGd1bkxYUnROYU43cmZ4dmpDSGtNU0hYOEE0SWlxU29aK0Uz?=
 =?utf-8?B?NTA1V0lEMTJwVzNPZlVKM3RpWjgwUk5sTktGSnhiL1VMc3A2dGxDSE1jQjF5?=
 =?utf-8?B?L3NTWHJkZ3YwWWd5b21SYnZYVzJ1RnN3cUtsTG5lVzc4dzRjMzgrc2lTeDhr?=
 =?utf-8?B?RFlSZThFWHNnWWQ2SmJIeTZVUTNZQ2NVdlgyTDdhMWovUHE5VjBDYUtaU0RY?=
 =?utf-8?B?MVkrSXRxcnpvNTBBaW5CQ0dySjI4R21KcFlrbjUzWm5ZZk5xa1Y3QkhkdlQ0?=
 =?utf-8?B?MElRTmtidXowYmVubmc4SkQzRXhYNU1DNmtza3hsdVNwNGhxeGpsUE0yMUJQ?=
 =?utf-8?B?S3p2d1Y0V1NIbTVSYUlUUTBkWk5TTHd2QlEzRW80L0cvaVN2MnlTL0NkbVVs?=
 =?utf-8?B?UVBxcktyRFBLRmZoaHhvaWlFa0pvVGVGWS9TYUR2c09DZk5CUVVLMEVpdit2?=
 =?utf-8?B?YlZWL2hJOEM2bWkwNndLWTlQSFhQV1RqSk1zc0IyU1UwS3JKM2srQ1RScTYy?=
 =?utf-8?B?WVRpbVJtcE9RbVVmSVRQL0U1QW1xYVdXNSs0VUJkRmRVRDhJb2ZuSktxVFl3?=
 =?utf-8?B?QlNoRGl1eFBmQXNkYU1SY3ViV0NWSW1NNkxMdmU5cjVvSzRhZi9lSFQ3MGVT?=
 =?utf-8?B?enlNbkdBdTMyWnlBU0JSWUorTHNveXVxenBGTDVQQUg3QVEyUk02ZTEyc2Nt?=
 =?utf-8?Q?AvxFmwVH1KA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWpNODUwaXE2a24reitnazdTdlVQNzVZb3BOZE1rTFBEbEMzUXE3NU1SZXB5?=
 =?utf-8?B?NWgrdDZ4aFZ1Zmh6Y2RHSGNWekJ3b1RlRkQ1YTVOaDljRE4zUnRDcUhKSTlh?=
 =?utf-8?B?eDNyS2VtSWZBai9aVDU0Rk1RQ0VSMDkxVjZubTZXV3kyNjNzTHRONVN0VUZ0?=
 =?utf-8?B?Y3ZuVUV2UENheldGWnBkb3o1cHJPVG1BekgzWXRGcU5scmd4YlNmSHN4VVNS?=
 =?utf-8?B?bE9oVWx3YU5RMWh3NDJIMC9QZkZmWUMvamExa3pqV2RlYlhQK3lVbytLWUp5?=
 =?utf-8?B?clgyTHYxTmxDd1lWTkxSdWRrNUhwWGxjSmJKQ2svdy9xaVNBaVlJTUJ1OHM4?=
 =?utf-8?B?UGQwelFYcmpvMndFQktncTJGT0xoUmpmd2gyMzArM0VlTGVNYWhGSmJJSTlr?=
 =?utf-8?B?QjNndEpWQ1Z1QVFWZ0dzU3JUc0czQ05wQkNQWkE4WmxNMVFaSnQ3S0JlWVhK?=
 =?utf-8?B?d04yb1hrUGE0UGRJWjBvakdVRDVSUVp4KzEwRGp5NElRVGJPOTJSNi96WmIw?=
 =?utf-8?B?T1B5dnhMeFhsblhyZlJpNTFCbWQ3azVIVmtvN3NqWmY4VzVkS2NMVlRCYUFT?=
 =?utf-8?B?MzNSVVV3dDlWa1ljTHdkVWx4RGJrYktZMGxSSVZvajFGU3ZkYU50ejNtdDJG?=
 =?utf-8?B?T3FqVXp2NGdsWTRmR0ZQSTZzVHpDalczWlp2TUtiS1dncHZmSlcvRkdTT0Jz?=
 =?utf-8?B?dFZpT3pTT3ZCOERJSUhlRlFWNlV5ajcxcUJxWE9BZ3cvbDd5UURFL3pFMm12?=
 =?utf-8?B?WjIzbHZ3K1ZEWnd6NzUwaWhaL1B6dU9GU24wc3VYWms5Z3JrbGxIUFAwYUdk?=
 =?utf-8?B?aTlDaHREZ0kxcGtMSm1yZzB0L2Q4MUtBdkRnazZkazJIaUpQNyszY0dLcjBU?=
 =?utf-8?B?a0JBU2VXM3Jxb0daeEJlcTlRWnVSakJUcGVvTHpTWWdsNmU4aEVDN2VjK1B3?=
 =?utf-8?B?WHNtUUd4OXpjMVZrVzBmNUNrekdScFJhYXBPZXFDckFDa1locVBORXpIOEtx?=
 =?utf-8?B?UVJJdVFpUEprOFBsbjJOZDJzTXA1amNzM1BTd09kT0ViR2tydDkvZXNrSWJY?=
 =?utf-8?B?UXp3MDJnNm9WOEt2M1VHUmI0TVBmak90T1gydlJXN0k1S2JwVGpFV0QyVnQw?=
 =?utf-8?B?dk1pTUR3OUVyMU9BQTdWY2VzdjVOOEd3V2tjelZHZDhWRkY1RzdKWTJzRnNv?=
 =?utf-8?B?NllOa0R2WXQ1QWlRazVEQURGWStZT2FMaUJXVkcvQVh5RmlxYncxN1ZZaVBt?=
 =?utf-8?B?Umo0VkNaa0o4L2VHaW5ab0tPRi9ZUmVUYy9mL0daejZqdTUwT2xJOVViWHlQ?=
 =?utf-8?B?R2NqMjU1WS94TFRYRWFHVkF3VXUycjZpbTNyZkJrNTRadGk3SGQ4d0R3Nndo?=
 =?utf-8?B?R0lxelFJcnJDNUFoeXM3ZXpZSUU1THFBS3FleXEwczV4clYwVFVsWWFjQnRP?=
 =?utf-8?B?cXZVWThuM25GVWlLWWNmR2xQZjQ2VXcyU1UyMFJTL0tHWjNDZ04wRjM4WnhG?=
 =?utf-8?B?b3EwNjdtSjQ3dmVvdzVXbXduQ09iT3FNWDVNQ2VSTDdDR3NWYWZQLzdGdzFJ?=
 =?utf-8?B?akp6NkxRbndaZlJ1d1l0dXkxN0wzN2lwektPR0hNdzF3Qmd4QUVSRWtwRENx?=
 =?utf-8?B?dzBqUldHR0VBL2E3NXdCa1BvdkhvTnN1ZWx2OUJiUVlCZnBvV0JmSEtnWU9L?=
 =?utf-8?B?aWdLZStQS2tGVWsrU0VRUE5SbFlNbGlWSjhnQjNkNzh0akx2eDQ2RXkreHZT?=
 =?utf-8?B?UmlxcXI2TTlkUy9pYXZOK3gxWDdOZUk0RHFWTDNmdWRMZEJFeTEzcE5Bb2lL?=
 =?utf-8?B?QUtQV0lDcVQxUExGRWo2NmdYNVNoaDIyQ2hFZ0YzV2tvUkJTbFJVRS9LRUht?=
 =?utf-8?B?ZUluY1JOOWdaNlRsWG8zRXl0Y1pFSDcvOWlvTnEzUVJxb1RxeEN5L00zRVBS?=
 =?utf-8?B?SG5lYlVLR05MOURHcXp4bDdnRWhtN1FiNStSWGQvYzBKRXBZU0hTZDg5Vkdv?=
 =?utf-8?B?RUpTQ0RnOXhJNTl0U1lRcTk4L0ZMeHBXQ3YrUXVCRFRhcU5jZ0JuaGsyMlFV?=
 =?utf-8?B?ZGZ2Q3pCV29KaG50MjA4UDRwbHNnamVkdXJ5dFl2MXBWU3lOWldwR1Y1RC9D?=
 =?utf-8?Q?7I9mX8+2CyHoSDX/tCcVGhOwc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbb8615-4ca3-48df-e64d-08dda75978ef
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:28:08.0530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXM+sRMLFjzD6Bq3CwusvcZ7k56gmZWN4eJoqaR7Tt2vsFa63dmKknBdxuBQzZ/Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6950

On 9 Jun 2025, at 7:34, Usama Arif wrote:

> On 06/06/2025 18:37, David Hildenbrand wrote:
>> On 06.06.25 16:37, Usama Arif wrote:
>>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
>>> watermarks are evaluated to extremely high values, for e.g. a server wi=
th
>>> 480G of memory, only 2M mTHP hugepage size set to madvise, with the res=
t
>>> of the sizes set to never, the min, low and high watermarks evaluate to
>>> 11.2G, 14G and 16.8G respectively.
>>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP huge=
page
>>> size set to madvise, the min, low and high watermarks evaluate to 86M, =
566M
>>> and 1G respectively.
>>> This is because set_recommended_min_free_kbytes is designed for PMD
>>> hugepages (pageblock_order =3D min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
>>> Such high watermark values can cause performance and latency issues in
>>> memory bound applications on arm servers that use 64K PAGE_SIZE, eventh=
ough
>>> most of them would never actually use a 512M PMD THP.
>>>
>>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest la=
rge
>>> folio order enabled in set_recommended_min_free_kbytes.
>>> With this patch, when only 2M THP hugepage size is set to madvise for t=
he
>>> same machine with 64K page size, with the rest of the sizes set to neve=
r,
>>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
>>> respectively. When 512M THP hugepage size is set to madvise for the sam=
e
>>> machine with 64K page size, the min, low and high watermarks evaluate t=
o
>>> 11.2G, 14G and 16.8G respectively, the same as without this patch.
>>>
>>> An alternative solution would be to change PAGE_BLOCK_ORDER by changing
>>> ARCH_FORCE_MAX_ORDER to a lower value for ARM64_64K_PAGES. However, thi=
s
>>> is not dynamic with hugepage size, will need different kernel builds fo=
r
>>> different hugepage sizes and most users won't know that this needs to b=
e
>>> done as it can be difficult to detmermine that the performance and late=
ncy
>>> issues are coming from the high watermark values.
>>>
>>> All watermark numbers are for zones of nodes that had the highest numbe=
r
>>> of pages, i.e. the value for min size for 4K is obtained using:
>>> cat /proc/zoneinfo=C2=A0 | grep -i min | awk '{print $2}' | sort -n=C2=
=A0 | tail -n 1 | awk '{print $1 * 4096 / 1024 / 1024}';
>>> and for 64K using:
>>> cat /proc/zoneinfo=C2=A0 | grep -i min | awk '{print $2}' | sort -n=C2=
=A0 | tail -n 1 | awk '{print $1 * 65536 / 1024 / 1024}';
>>>
>>> An arbirtary min of 128 pages is used for when no hugepage sizes are se=
t
>>> enabled.
>>>
>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>> ---
>>> =C2=A0 include/linux/huge_mm.h | 25 +++++++++++++++++++++++++
>>> =C2=A0 mm/khugepaged.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 32 ++++++++++++++++++++++++++++----
>>> =C2=A0 mm/shmem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 29 +++++------------------------
>>> =C2=A0 3 files changed, 58 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>> index 2f190c90192d..fb4e51ef0acb 100644
>>> --- a/include/linux/huge_mm.h
>>> +++ b/include/linux/huge_mm.h
>>> @@ -170,6 +170,25 @@ static inline void count_mthp_stat(int order, enum=
 mthp_stat_item item)
>>> =C2=A0 }
>>> =C2=A0 #endif
>>> =C2=A0 +/*
>>> + * Definitions for "huge tmpfs": tmpfs mounted with the huge=3D option
>>> + *
>>> + * SHMEM_HUGE_NEVER:
>>> + *=C2=A0=C2=A0=C2=A0 disables huge pages for the mount;
>>> + * SHMEM_HUGE_ALWAYS:
>>> + *=C2=A0=C2=A0=C2=A0 enables huge pages for the mount;
>>> + * SHMEM_HUGE_WITHIN_SIZE:
>>> + *=C2=A0=C2=A0=C2=A0 only allocate huge pages if the page will be full=
y within i_size,
>>> + *=C2=A0=C2=A0=C2=A0 also respect madvise() hints;
>>> + * SHMEM_HUGE_ADVISE:
>>> + *=C2=A0=C2=A0=C2=A0 only allocate huge pages if requested with madvis=
e();
>>> + */
>>> +
>>> + #define SHMEM_HUGE_NEVER=C2=A0=C2=A0=C2=A0 0
>>> + #define SHMEM_HUGE_ALWAYS=C2=A0=C2=A0=C2=A0 1
>>> + #define SHMEM_HUGE_WITHIN_SIZE=C2=A0=C2=A0=C2=A0 2
>>> + #define SHMEM_HUGE_ADVISE=C2=A0=C2=A0=C2=A0 3
>>> +
>>> =C2=A0 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>> =C2=A0 =C2=A0 extern unsigned long transparent_hugepage_flags;
>>> @@ -177,6 +196,12 @@ extern unsigned long huge_anon_orders_always;
>>> =C2=A0 extern unsigned long huge_anon_orders_madvise;
>>> =C2=A0 extern unsigned long huge_anon_orders_inherit;
>>> =C2=A0 +extern int shmem_huge __read_mostly;
>>> +extern unsigned long huge_shmem_orders_always;
>>> +extern unsigned long huge_shmem_orders_madvise;
>>> +extern unsigned long huge_shmem_orders_inherit;
>>> +extern unsigned long huge_shmem_orders_within_size;
>>
>> Do really all of these have to be exported?
>>
>
> Hi David,
>
> Thanks for the review!
>
> For the RFC, I just did it similar to the anon ones when I got the build =
error
> trying to use these, but yeah a much better approach would be to just hav=
e a
> function in shmem that would return the largest shmem thp allowable order=
.
>
>>> +
>>> =C2=A0 static inline bool hugepage_global_enabled(void)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return transparent_hugepage_flags &
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index 15203ea7d007..e64cba74eb2a 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -2607,6 +2607,26 @@ static int khugepaged(void *none)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> =C2=A0 +static int thp_highest_allowable_order(void)
>>
>> Did you mean "largest" ?
>
> Yes
>
>>
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 unsigned long orders =3D READ_ONCE(huge_anon_orders=
_always)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | READ_ONCE(huge_anon_orders_madvis=
e)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | READ_ONCE(huge_shmem_orders_alway=
s)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | READ_ONCE(huge_shmem_orders_madvi=
se)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | READ_ONCE(huge_shmem_orders_withi=
n_size);
>>> +=C2=A0=C2=A0=C2=A0 if (hugepage_global_enabled())
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 orders |=3D READ_ONCE(huge_=
anon_orders_inherit);
>>> +=C2=A0=C2=A0=C2=A0 if (shmem_huge !=3D SHMEM_HUGE_NEVER)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 orders |=3D READ_ONCE(huge_=
shmem_orders_inherit);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return orders =3D=3D 0 ? 0 : fls(orders) - 1;
>>> +}
>>
>> But how does this interact with large folios / THPs in the page cache?
>>
>
> Yes this will be a problem.
>
> From what I see, there doesn't seem to be a max order for pagecache, only
> mapping_set_folio_min_order for the min.

Actually, there is one[1]. But it is limited by xas_split_alloc() and
can be lifted once xas_split_alloc() is gone (implying READ_ONLY_THP_FOR_FS
needs to go).

[1] https://elixir.bootlin.com/linux/v6.15.1/source/include/linux/pagemap.h=
#L377

> Does this mean that pagecache can fault in 128M, 256M, 512M large folios?
>
> I think this could increase the OOM rate significantly when ARM64 servers
> are used with filesystems that support large folios..
>
> Should there be an upper limit for pagecache? If so, it would either be a=
 new
> sysfs entry (which I dont like :( ) or just try and reuse the existing en=
tries
> with something like thp_highest_allowable_order?

MAX_PAGECACHE_ORDER limits the max folio size at the moment in theory
and the readahead code only reads PMD level folios at max IIRC.


--
Best Regards,
Yan, Zi
