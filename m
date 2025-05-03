Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BCF156F45
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746277812; cv=fail; b=mTkySnWcTEbA7jc2jcQ7JpHQPpRRXN+3E4rTgAxwIEBE+J6vzqacyg+0YEsdE/SaR9dO6h99/9cX+EtuUb788CC8bgQuE8GgmZE4ox4qlwZtN42OEtvPAC/l/LS7BjbRFIZmIjPFJpNAn/Ct0YpB6X75sCAvO/q82FysdkwPzFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746277812; c=relaxed/simple;
	bh=GzVML+KInjetgaewYxmBiWEs8HIcaawxqM5GsmyKBq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Od7551pv9eECc/K8t31CVInZGYmazFxZnnCBY5laKwCTEV4mGHAS8QmFY5Pil2Hl3bO2k4JXYJgkUsVamuRS2HnGsjsyiwNVIUKdk7Wr1jXD+YV3iPyAjaFwuSjsgcNYb9DoyNafCOtFye1jdzA0EVMZOuwdIb/o5LuWPTbTyc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cTVE9QYc; arc=fail smtp.client-ip=40.107.212.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cTVE9QYc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNeieM4AUbuQ2oWOWZR0inl0ceu6K5dcjatdUd5kLwoIArOMQpJpf8LUF6YGvw66/q6LymKLTPo+Pu2lNydQnF7I1+Oh+mtqSeFTx9kp6ze6Ao2CHbm3D2GbaRZrJk5VWoXcUIpACB0mfH8U3myrr8Dj9gIKZVtOqt56CV0fGZ2ZlXiF9nfw/IHOzA+N2BEnLe60JTpQhnOoDZ5df5Hhdl39sjub0N1mzz/5lfcxCvMx3XoOhqFwjNxZViDG18F9kOQ0f+CHM3pUiGGbJhrTvx269xz8TvdfoMDkCr0saWUJdKCTusEV9H/nr7q9HvGyYl92fw7qg8GN+X7JC+hCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w893VKOGOgs+DUaitNUAPTLwG+4DGG8qA6OkiynTKuQ=;
 b=jg9LK/bXLGnfGU5jLMaInVDGthFMrI+WRDfo72ZXct05oEqafErHovcfB+S0/S5WHoIzmMgKRc0wegQpIAGcpL3iwZr5WgXpmbxbqxMajSHdrcJ+zhxEIFe2fWRtsc7OdXtdwCop3SxfZK4/U+DMBoLHQzc+AVVT6juDfn/rIem2i9fdVLJHf/qbsHmJTbrVElZ8/Cy0WANHyheMTs6VpV7Py3CEi1qc4HlW/+3sVnUikXGUG1L3mafNt54eKHbhuY0Nc7Vg9FniytIfPheCB0VHUvd8eHeQt4MTRThtqggttyRA6yvNQ46FPh6B+B3ziMW63WmbPfp+pnxADRTdyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w893VKOGOgs+DUaitNUAPTLwG+4DGG8qA6OkiynTKuQ=;
 b=cTVE9QYc8ChUUFblixszvTIWBYNkSy2sxQDsEcmWiNqI0CYtSobmDEJTQsqiZL5WWzZ/OQNh23jmG/c2VBGGiCLSWdB0siiDW0LjC6KFcBemef4E7rXVsaJKxgVzx2oIwLz9IlJwN9YLn4KHJjXwR/e0TuYw+vD70HTGDnpHgFlbecyjtWboF2l9wDNF7mMCbuBpbyAX+6+XeOXwN6QVRcpzjbz0L2xuzoG3o4c5cFOh/Bl7oL5NwU1WTM2S5RijoraUwvvHxvFvL3SAhLqSSOA4E63/o9ySPuhHVRYQSiznnnW7kCzNOogPPtldObP9+vcX/AGSshvIRL8OcVg+uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.24; Sat, 3 May 2025 13:10:06 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 13:10:06 +0000
From: Zi Yan <ziy@nvidia.com>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration to
 reduce boot time
Date: Sat, 03 May 2025 09:10:04 -0400
X-Mailer: MailMate (2.0r6249)
Message-ID: <39457C12-784A-407F-BA63-F44E8FCA8B8F@nvidia.com>
In-Reply-To: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:408:fb::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0a8644-0849-4874-79ff-08dd8a43d2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWxnaDhLZUYxQVBrS29jNVNsakF1ZGhESk9NWEJQdDlDdWo3bCtmMEpHaXZW?=
 =?utf-8?B?VVZrSFR3L25vQlBaU3d3aEFqWVBJaGJlalVoTXFjcnA5dXdVT3J2ZHNVK1Vr?=
 =?utf-8?B?bm80UjRYV1VvUFoxd3VVa25LeitQSjNxMzN3RlNwVjlvVURzUW51M0NFbkNz?=
 =?utf-8?B?cUR3a1JudjdZMnpwUmJWZ2FKMEN5MmJtZWJ1K1JhT2NrK0dIdno0TUcrV0lR?=
 =?utf-8?B?enpDeXR6RTRyL0ZJanBXNy9uWllIMzA2UDVuaFlOeDNEN0tRT21sRTRlV0Q5?=
 =?utf-8?B?Wlh2d2xHOGd3NHJhL2I5ak42dTZnb1hvN21CZkVjRVFzU2VQakpINEY5TGQr?=
 =?utf-8?B?VjdlR0xabURiOVlHVjhKb2JmeDd6TExVb0owVmJGci9oWGxwUkVJQmYrZE04?=
 =?utf-8?B?UXlzWVFySVZITGlzTlN1bGJIRVF1Ymp2VmxTR2ZXRm16NUM2eUp2dmlIWlUw?=
 =?utf-8?B?UlRNVVZocjRFeFo0a3UxK2xOb0l6U3dzb29EWTJBeExmaWgrMHFOUTk5WnBM?=
 =?utf-8?B?ZUxma21kUnNaZlpxa2t5dnNMdlQveXJCeFVLZVdiNGRFZTV1QU1JYjJKZzNV?=
 =?utf-8?B?OU1CZGNTbG8xVGpHdU9jKytMZmRDNlM3WWgrUGVGMHRBdjAyRlQzeGN5RHRH?=
 =?utf-8?B?OFlzUWEwTXZMMzZnZUcxLzBaZnpJUG5mNEFlSm1YalB4UHk2Q0oxWUZ5MGM0?=
 =?utf-8?B?aFZXTUtKdiswc2M2bGdPcGpRVmZkUlNBNFg5bXFtWHh0MTl2cENQL0xNNEdC?=
 =?utf-8?B?eGVPaE1jd1hHMDJHeFFya3IzUm9rdVFJKzd4TkszQVhpRDRRalNEdExFWEdM?=
 =?utf-8?B?ZUU3bVdDS05iUkxPL2wrMTByNGxiM2UvWURpWUttZ0lHZHAwd1dCWVpoZmFu?=
 =?utf-8?B?T0hHcWg4R1FkbkVWb2VtR0xVSmFYYTBTMm1yZVIxOWhzd2djcDNkTklaaU5N?=
 =?utf-8?B?R01nd0dMallqaWdWWEhRSUljQ2NsWTJ1dFV3bDFtM2xRU1dTY0dBYytXSGN4?=
 =?utf-8?B?UmZtY044WFN3RGcwUUtXeG85enF1NFBCVkwybUlUSWR5bEJobitVaWY3QUhJ?=
 =?utf-8?B?MTVhZWdXWktPWVVMajkxQitnZVU2Y1VtaTR6djZBbUR2Skppdjc2NWlBSFVs?=
 =?utf-8?B?Z0wrcFRiSGZzQXE3Sk02UUdhbFpOd2tHTncrRnM0L3B5a2ZUOHcwdlJDb1lx?=
 =?utf-8?B?c05Ob3ZTeGlWQkNMazNvOW9zYy9FOUxJTnhFZU5WRXU0dmNaL210REpOTFpM?=
 =?utf-8?B?NU42VUQzdVA1aFNzK20wb3ZyZlNRWVJ5QVVUWCtGY0N0T2FubGJRM2xhRGZB?=
 =?utf-8?B?QXFVTGxHZXFadC9FRXBibXFLbkI5Y2MyTmthci9MTVpFbmQ5TG5WN2dqeGg3?=
 =?utf-8?B?QSs1THFlWXY0R3Z1aGV1aWJDRUYrRk5Gc243RHpkQVZZZGJsQUxySjI2MHlY?=
 =?utf-8?B?WHJGM1p6dmUwL3dCVyt6aG9mcmUveFlqMlpqQjNhTzliZU1XbjFSWkdsRnlV?=
 =?utf-8?B?YTlzZkRBTHNBN2FsajA0cmo0aVNYcG1QVzREdldiazJnUkNIejZHVWIvWmtS?=
 =?utf-8?B?elkvVEIxQTB0Uk82L2xNWVZDWjhmK1R1OVpENGpBbUZJSTZtRFhmOEJ1VlRK?=
 =?utf-8?B?YjNQOVQ4aS9FUVJaa1gyTzV6SkprS3ZyWUNObFB0Nm1XSXkzUWs1MHQ5SmZn?=
 =?utf-8?B?K2hGeThmQnZWOUwvdzgrcEIvOE9FZ2pidU5UZU9JRDdlYU52Q3YvQTcwUEgv?=
 =?utf-8?B?dFhhUEhBNlJvWnNYUms5RkNLZmpScnhVeEE3eE1wY2ZZOWpoQVBkTlpoQk1j?=
 =?utf-8?B?ekZ1SnpiZjNYajdKUnZEaWdIdHB4M2tvdnBBdDJKN3dtSGlOOVM2UERhczJj?=
 =?utf-8?B?cHRDdElTdkZlQlpzTU9mSmVHOEJCVThUOFdGWkswZ3ovR0gvVy9QYkpGM0Nk?=
 =?utf-8?Q?DpWG75Vmpbk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEhSWGYwekZST1F3SkhXckVSQS9iWk40THdYU0t4NisraWVBanJvRExNNVMz?=
 =?utf-8?B?MXJ6Z3U1Y296NGFVMXcyU3hrNGdBZjI5K2xoVlVvQU50ZG5vVkJXMWRqSjZG?=
 =?utf-8?B?MHhRb283RTc2MzA2UVFJYW5DVW5IUWJxY1dDZm1XRzhKZm5qMnl1ZzNDVlR1?=
 =?utf-8?B?cXJmeHhseFRGV2tObnEyWGNUNlZPaHpPTi8zWWI0QVJuT21zQ2lseXovQ1Ju?=
 =?utf-8?B?bFRxaVB4L3N3S0lZb2RlSTdiQi9oV3dDYXo0SjMwN01IR1Q5VFpJY0U0L09k?=
 =?utf-8?B?a21KY2NEL2Rzdk5Uait3ckhDdjFGVG9ReitEZlRlSy9EU21LMWxkR2FqRUNP?=
 =?utf-8?B?bWpDcjBERldIR09iZzh6aXdxMWdMY2xnVW5kZWNjb2dOcW5zY0ErNmQyU3NT?=
 =?utf-8?B?d2swZFdMeDQ4NDZ4cllhMjlzbktRRVFUMVNCSGpDdk5vdFhtbEw3cytjYUIw?=
 =?utf-8?B?RTI4NUlObHVmbEJhbGtWSlloOWY1N0JsYTRZQXZxaHNKR05iZ1J0STViNUhO?=
 =?utf-8?B?MVdueTNmUWpickJMMkVSd0pmdXZOd0c3eWpaMHREMlIzeUp4U1JjMGRLeUJN?=
 =?utf-8?B?aGRCYUFYc2FZOTh5VkVSUlFHcmlQbTh2TzNjSlVucXlUa2U0RG5Id0RpZk1Q?=
 =?utf-8?B?eXBCd2J6QVM1cElLUGNZNDBnTWM4ZS82bW1RMStOL2VPWjU4SWVNUVFlMW96?=
 =?utf-8?B?WDB2TmVMTGVuWHNLTWJOdXh6cWVaZzhaYTJSVzBrL3dKU3ZIVGxvRHcvaFdo?=
 =?utf-8?B?MnYrcjNpUVg1aGFaQWt2RkFtR09DU2lwMFdZVGZNaFhVUUtPKzhHZmxZVUN4?=
 =?utf-8?B?c2hHalJPVkZjaDVSQU9ZK3l5a1NYVThrUEZoSnJmckd1OWkvMHdrcXVCWktq?=
 =?utf-8?B?TzVEVXFGaGJJU1pQUndHd2FhRDJRVGozODN6ZlpYaEFNRXlGZE5Rd3pGcFhD?=
 =?utf-8?B?R3NpUUw3aTNZWUJFM2Q0cFVnSXRLRWRrY2hWNEhWMi9DV3FrVmpRS1RYUFlF?=
 =?utf-8?B?bmhmSENEUDhIVzdJV0pUYlJmU3lndnE4NFJhTlY0TWRGaDZpcEFINThJdzhB?=
 =?utf-8?B?ZEluL0ZmZXNOeFFNdjR1QWhSdzJkcUVpY2NTVGFjc3BQV2pjVEFXNDFHL0Qr?=
 =?utf-8?B?S1VDeXJaYVdZSVpUWi8reVdWclM0VlBLMXdJTEorSlMvVGF2Y29rRStBbjBN?=
 =?utf-8?B?S3pZbVozU0Rmd0k2YnJVTlJEL1UvenlLb201Y0phTmRQbDBQcFlUbE1SZTVx?=
 =?utf-8?B?bUQvM2tLZEJaZzd4ZXdRM0N0TW0wdXZpbFY4MUhpbkgvYSthcU9pcWJNOU5k?=
 =?utf-8?B?cEhndkxkeElJakdmZ3NRY0V0QlFiZCsxNmpHbDdyMHRJcDFCaEd5WUdNTTBX?=
 =?utf-8?B?SkFDbjJreExwcGVBL1NlazdrVGZXdmRXVER3WFJaOGJRL1BuL21iQStaZyts?=
 =?utf-8?B?Ulh0RElHSFBWbVBTYXhnNXFBSm01OVJJbUdLdWNQSUp4aTV0WG9iZ2pwZHJF?=
 =?utf-8?B?K01tdEZTMUwvb1RsaDFSZWZwOW9kU1hjOEdWQUUxOEJRTVFXb3NuSXd5UkZk?=
 =?utf-8?B?QUNFWE1aUHBOWlhLa1Y3SjBqczl2MUxTaVlrZlpCSHNoeGVFY05JcUNubm1B?=
 =?utf-8?B?QitHZE5leThaa2JMYWttQUE3cngwNUlUc28wZ1VrNGJVZjMzcmIrSlhLdHRt?=
 =?utf-8?B?SnFWTUFUS2pJVUdUbkJWS0dXOXBmSUFQNFZmenpqOTZ3ZGlvQk8vRDNhYWVz?=
 =?utf-8?B?aloxZ0NqSVNBUGRETWtCVk02MWNFSVh4OVFoWVN2ODlobjFUemVvekczYUxh?=
 =?utf-8?B?Yitzb3BPV2xhZkxvN0h3SzBTdXhpKzN1OFAyVTBMV0lUcjd2QTVDbTdIVVcw?=
 =?utf-8?B?R3JzZlpCK054LyswTzVhU1RHWnFkenY3TTFLR01BTlNXRmI0TGJ1d2pkS29n?=
 =?utf-8?B?bWx2ekZobmNMZktnV2NYdmIxbnZlclNTZUdPVS9EUlF6VzVmUU5xVncyNHpP?=
 =?utf-8?B?SjJWcCtuMUZrejlSOFlrc0VacGRCNkNHNVRueW55T21HUDVUVG4vUkE2RE16?=
 =?utf-8?B?ZzNTbVNnQ2JyN3J3SHlHdW1mbVRjKzMxYUFSa2xtQ2ZiOWJpVFhGZyt1eiti?=
 =?utf-8?Q?CIPvESNwIfMU1lebnxlQ8jZSr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0a8644-0849-4874-79ff-08dd8a43d2e1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 13:10:06.3179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNIhJNqGSb4AtpejBh1JAcjE2cGwkSgxPn0NzgqcJaeRHj5G/j74+bkt23Oqwbka
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220

On 3 May 2025, at 1:40, Donet Tom wrote:

> During node device initialization, `memory blocks` are registered under
> each NUMA node. The `memory blocks` to be registered are identified using
> the node=E2=80=99s start and end PFNs, which are obtained from the node's=
 pg_data
>
> However, not all PFNs within this range necessarily belong to the same
> node=E2=80=94some may belong to other nodes. Additionally, due to the
> discontiguous nature of physical memory, certain sections within a
> `memory block` may be absent.
>
> As a result, `memory blocks` that fall between a node=E2=80=99s start and=
 end
> PFNs may span across multiple nodes, and some sections within those block=
s
> may be missing. `Memory blocks` have a fixed size, which is architecture
> dependent.
>
> Due to these considerations, the memory block registration is currently
> performed as follows:
>
> for_each_online_node(nid):
>     start_pfn =3D pgdat->node_start_pfn;
>     end_pfn =3D pgdat->node_start_pfn + node_spanned_pages;
>     for_each_memory_block_between(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn))
>         mem_blk =3D memory_block_id(pfn_to_section_nr(pfn));
>         pfn_mb_start=3Dsection_nr_to_pfn(mem_blk->start_section_nr)
>         pfn_mb_end =3D pfn_start + memory_block_pfns - 1
>         for (pfn =3D pfn_mb_start; pfn < pfn_mb_end; pfn++):
>             if (get_nid_for_pfn(pfn) !=3D nid):
>                 continue;
>             else
>                 do_register_memory_block_under_node(nid, mem_blk,
>                                                         MEMINIT_EARLY);
>
> Here, we derive the start and end PFNs from the node's pg_data, then
> determine the memory blocks that may belong to the node. For each
> `memory block` in this range, we inspect all PFNs it contains and check
> their associated NUMA node ID. If a PFN within the block matches the
> current node, the memory block is registered under that node.
>
> If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, get_nid_for_pfn() perform=
s
> a binary search in the `memblock regions` to determine the NUMA node ID
> for a given PFN. If it is not enabled, the node ID is retrieved directly
> from the struct page.
>
> On large systems, this process can become time-consuming, especially sinc=
e
> we iterate over each `memory block` and all PFNs within it until a match =
is
> found. When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, the additional
> overhead of the binary search increases the execution time significantly,
> potentially leading to soft lockups during boot.
>
> In this patch, we iterate over `memblock region` to identify the
> `memory blocks` that belong to the current NUMA node. `memblock regions`
> are contiguous memory ranges, each associated with a single NUMA node, an=
d
> they do not span across multiple nodes.
>
> for_each_online_node(nid):
>   for_each_memory_region(r): // r =3D> region
>     if (r->nid !=3D nid):
>       continue;
>     else
>       for_each_memory_block_between(r->base, r->base + r->size - 1):
>         do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
>
> We iterate over all `memblock regions` and identify those that belong to
> the current NUMA node. For each `memblock region` associated with the
> current node, we calculate the start and end `memory blocks` based on the
> region's start and end PFNs. We then register all `memory blocks` within
> that range under the current node.
>
> Test Results on My system with 32TB RAM
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
>
> Without this patch
> ------------------
> Startup finished in 1min 16.528s (kernel)
>
> With this patch
> ---------------
> Startup finished in 17.236s (kernel) - 78% Improvement
>
> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
>
> Without this patch
> ------------------
> Startup finished in 28.320s (kernel)
>
> With this patch
> ---------------
> Startup finished in 15.621s (kernel) - 46% Improvement
>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>
> ---
> v2 -> v3
>
> Fixed indentation issues, made `start_block_id` and `end_block_id` consta=
nts,
> and moved variable declarations to the places where they are needed.
>
> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7=
.1745852397.git.donettom@linux.ibm.com/
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df=
.1744175097.git.donettom@linux.ibm.com/
> ---
>  drivers/base/memory.c  |  4 ++--
>  drivers/base/node.c    | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/memory.h |  2 ++
>  include/linux/node.h   | 11 +++++------
>  4 files changed, 47 insertions(+), 8 deletions(-)
>

Impressive improvement. Acked-by: Zi Yan <ziy@nvidia.com>
--
Best Regards,
Yan, Zi
