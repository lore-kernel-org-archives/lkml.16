Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F511CAB3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389771; cv=fail; b=EfgKUVp8tk0MiV8LYDH+ZEWGtkA3dXXR6QXmTCm2Hp0U8DGjfcyl3jETBUenIHsvitJMzodsKa9O4Ere2ZRaD3VStnD+jT6nKYpIl7wTIyp+RRLvekiATsADtWaTimCXfXdLCXowjYJRL0KOt6qMNSQWHjqoj1lIdcNnUj7fuc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389771; c=relaxed/simple;
	bh=Rf1atuSXpu6vn+fMH6KP5z2685DDeGHIjM18UhNXd7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nGHrridMrvpsB3jOIjh3QQ2CJLc8awJcjcL9vr4Hc5R/vPaZNfX7Oya5hhYGwvJOTZ85Goh6GneX8yVPlWnwgGzcQfJ7CVfxMBbrHKPYaG4+JGfX/Ca6QTpu6T6FE3/yDbNQ5eJLnmKQDzBUcfSGweCLMZaeg4HDSW/OSeetWO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ftTLjIxp; arc=fail smtp.client-ip=40.107.223.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ftTLjIxp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+K30qqRGbDhNL2HoGI8X7Akwg9HRGx9eokLPJVDlghpGS9EbP6hh9MpVTiLeYjSm7768/yAKt5/SnsV1JC5VYJkCacA4ZHZvjn6icSBUjDnbitOvPHwFUeT5sexCdikOINsfvh/2/0LQWpvellwBA+wjZ3Bt2OtPXS/Rb7ZT4zBag9XeRYeBqs323YS6BMk95WT+2Shmtq1VcSdulob3Kc8F1tPBTSeNqf03Xt0PcJLWi3l+DBzN9zW6Ivj7CC3z5whKCL5OuSp9vbidiSsyBgmxdN63BKHUuk8dmdlAApguqxt/+EkSzYUOj6ol1RE8bjDnus8E+u4XnyrXCAM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eN9JQe0MgoPDNkGVMo9hrnhPHj8hxoBN4TnH07AUqw8=;
 b=X2T6EbC+64svR7ru8ywY1rjMZsiih0yqeb0Stw/R/yF40n0/IfWRvvPzeOPMKZ8/Kx2TAMIu5ucHWUm+1RPWhI4DZLMpVH44XDSAiL5l0kXCh9CR5fP9BHyT65A5ZkSCULEoMh4lzdZTKkWPRUWIsChVKpJasZNX4w+Ek7qyDT1tI958vwZiEc9cbHlXERCUox/8ISHszzBhlfRx48qlhpgOkLdI+9CqNrjUPMd9hvzwzNwEnhMGOMMvw8aFTRHo7nKGgYbR7+F4yg2SENirVco7jgLWsUd5Xyi5M+E/jg0181ysdpqzxkv16XfEbrYZR1YWtQsYMOZie/IHDkDT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eN9JQe0MgoPDNkGVMo9hrnhPHj8hxoBN4TnH07AUqw8=;
 b=ftTLjIxpET40j3zWeFBdNchrq55gg7Uhe8pe93gFJ4uK1yntfnvRUNd/AjHBGmwUvoHyHpwHTIJmzwn/0cg0FMUtBoZqBcQ1deUzmcNyCdhUw3UICyEhS+cEDdfJa6oYsYpLmzBPKDSBjCSVZ3PxY2Z124pylboM72qVc9W48VCFDTUrA28L5j/pvoJsFg65YBOt96TN98YZ9ZAzqLtGyD+0Sw5lCUyiyN1piZnHC3h33rDKbIlqUU+Ifo3SKLCspU0HLPq34Z1XwyUbC5MsvtYPK/nQyDTLrKM9A7+9wNasgfnEys3UmZpYwAioqhCQDeYlb87r4g5StJ1rOAXEFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH8PR12MB7351.namprd12.prod.outlook.com (2603:10b6:510:215::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 1 Jul
 2025 17:09:26 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 17:09:26 +0000
From: Zi Yan <ziy@nvidia.com>
To: Christoph Berg <myon@debian.org>
Cc: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION" <linux-mm@kvack.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mm/migrate: Fix do_pages_stat in 32-bit mode
Date: Tue, 01 Jul 2025 13:09:23 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <25EB3C6C-4D6D-4946-BF0B-9B322E7DC16D@nvidia.com>
In-Reply-To: <aGQTtCkgH4kQTNlp@msg.df7cb.de>
References: <aGQTtCkgH4kQTNlp@msg.df7cb.de>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL6PEPF0001641C.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:11) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH8PR12MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: cd644932-dfcd-48de-7a71-08ddb8c20847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?njJJxppgT6Rjye2uwCajD7Wl/VacSBKgTOlgLJalmlv+uhV3wFjpG8/n2HvC?=
 =?us-ascii?Q?2RekUIqzoiuenAhHttd5QzTcHovXqrggNjsABGgExHHyiorgkicnevqQrSaU?=
 =?us-ascii?Q?GDnssv/OQkDMIDpuHl1N+xSOcayrMeHVae3vzFkT+f2pWoX3p3Yb3UKxHCaF?=
 =?us-ascii?Q?6BXq4aWgYBqXVuFOtP91VoKRGJvbvqMfRNR/6Jw9iIV/Y598+8hl8RrQLzal?=
 =?us-ascii?Q?Lc766yE5OWZK/3rd6uhLWnCzps4rd/wpXSHoY/w8h2x+STBRCd3gc+4/fs13?=
 =?us-ascii?Q?VmQlpmpmnydg+B5QR9wHUDbPTp+pC2LQ+NuEMIIoEWUEezYV0817CpPSG9N3?=
 =?us-ascii?Q?CLV6pv10hPwzC1tj59kz+0bGYZdjx8WxENUosXr9Q4F/5ThISS50X8tXG2m9?=
 =?us-ascii?Q?rm6NRBYY+HljJ13/Bs0ZbJtDz1V+0n7P0ErtLCBJ4PPtFL2JZ2QNGh3i/gmB?=
 =?us-ascii?Q?mpvcGkmFu+E7RDT0gdXpODTad+5r4ygzIjFi+mFgd1ymmfYP6koYIIV03Pgk?=
 =?us-ascii?Q?5JCn2jswZlog5D/IVPNGyd+Qm7IEe3rXV/E92/fKm2HEcsFTYiad6m2sCFk5?=
 =?us-ascii?Q?O5WR6MD21nARziLPtt5ry9A4uoA4lb8AdLojwz+mjR6I0/o+F8zaBIJRm5zf?=
 =?us-ascii?Q?SXZWv5OE3PCDedAClzWIR2c+A2KGGL8NpD3mzDLd06kcCXy12wT7DUMap6KU?=
 =?us-ascii?Q?71dKJudjbXxpHqh+9ibIgXK1zTG8OnQFofa2I5PkPsrFUfDETRv6mlK1nWcd?=
 =?us-ascii?Q?Ev4KB0REeicdwWzr/FWbQefrshMpoBoQo4hBgdsitGqNcSM6N5ae+2z373bt?=
 =?us-ascii?Q?VBLgentOmkDDBxmiLQyhiPHnuu5hIdixvyaEiKtaVHqQ+yS9bNxW6oRacZxz?=
 =?us-ascii?Q?GyUq4ZbhmxBpVf4FPqohKAKXNm2IaOxS4Fr/I2AU7bkMnG8y7wkQ757UzKPD?=
 =?us-ascii?Q?6dwKQ4PuzYWH3Iee+hIv7ffrvITeIoUQ0sOumJHpBYkCnNFb81h7MmyAKsCx?=
 =?us-ascii?Q?SNk/YTGyN1v2xvoACgGE87YB4+7Z3a7nxF+fXEIEKx9vTp9wliCcU/WXwLCJ?=
 =?us-ascii?Q?DZ8SgB7npzFW1Jy6pI4cidnSmLe2zvaLQvoJDdYQ2jbjjXWu8mu2AFvCsIdt?=
 =?us-ascii?Q?M5SzOLNZv+8VavJTKQrloY0QOFAWPCRpjNoxeuAOtbtJWLe9ZeSy8zfCaCYh?=
 =?us-ascii?Q?wn2zKPOsNRQhM5pyTRlhh78mjxNpk4APERcNFDugjhwl3D56UL6kboMRbfu8?=
 =?us-ascii?Q?UIoDvnnV+VCy4ORUCMWXV0RuxVCUn5nZNiAB0LH1uKx4LQmhN5jvP0vUzKXk?=
 =?us-ascii?Q?WxuvjLa6Hrwg2DIcidSBAkRcHAZX8356r6ixJfWFfnnLdYDyLi5ox6hBeKJ3?=
 =?us-ascii?Q?8KAvugaj6+ffO8lIF40oeLWqgPCmlpwHfeSk+vlh2IkQTIvHEbrRUM6GpKut?=
 =?us-ascii?Q?zjjbc3WAaOI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K2wyj+W2H+Vt8JLRvK6L51I2Twu0bzU66WswaPnEAcLH1aYSYEOf3HB8qF5W?=
 =?us-ascii?Q?lI5OZTZkjClEahZ4Dqsn/FRbfBe2gv15hbuN3vlY1WdQOm2TlDzDegoAE+so?=
 =?us-ascii?Q?UIPnxNPDqkBDTiDDnrQEeI9jyNTFFSOGSEQQEBd/VKBlcIGHYlH9PzDFkTXA?=
 =?us-ascii?Q?UJ1Pz/l+tbfpxqDvXI527qvO5y5PheM4fI4LokGRk1ggS+SgZX/PfQ7bYqMX?=
 =?us-ascii?Q?gpSe4r5raJrmYbjXD9QcNQFKYEmqzW803u+r1kQP6LCdDqhCRhkX/GaC4omn?=
 =?us-ascii?Q?UHMGAgrh34bqjtzkvHqo1ynmY9omgFTS03HYEKpnZRZkjYb4xcQioQoNDNs1?=
 =?us-ascii?Q?7duWUJCBVeBv/WEhy9Yt94i2WUzCha0OmGoDhAXk7Rj/MA67reiHqP+6g3sc?=
 =?us-ascii?Q?B5qgZhhhznZwnjORpCPvFnKazknl8feyV5yKo0JcsQW1vTW5zB5QvNh+Cowj?=
 =?us-ascii?Q?fnkyQSUg95QP2mnFvyPE6afBK4+lFRbT8H3OYotU9PjrDHErFRNP7haQT8Sn?=
 =?us-ascii?Q?kgQx378Pw2aL3OUKzvbFZeb2YobaMFUmb5p6QBarjuOaoKGJYgYyzbl7+v/d?=
 =?us-ascii?Q?y0nZZZraIWaN7VwOxBx9hr+wNAkZGUbtmsMXpBK1Gk6+z/EUVhuL4pAJtQt0?=
 =?us-ascii?Q?zsTO0meVjilcapEDLxKDOGjhkPKi7d+EmnvqmdR5nqEeUIwiC0AxOT4Aw6lg?=
 =?us-ascii?Q?UU5lujKywzsz7up5ysVRoD4MQRhLFVn0BCBOoKxeTCxWZvqY+80Kjoh8/KF/?=
 =?us-ascii?Q?byxmrPuqylfrONhOIgJKfQpALTdIjyf9wrBT6+3UQHn7igY8nRTx1cWaH110?=
 =?us-ascii?Q?0Y4HACa8kRIJPWXE/NIdVPkAQKFkkpD6TWPvVxE1cMt4GOT1g9B3QtcWS1Sa?=
 =?us-ascii?Q?J35ZqajVMGMMnwhk2/0qP4EWsRriJPUDNk2zw5FrC/6cW0gcJrswde3fKNa/?=
 =?us-ascii?Q?ef2hV3DK/evs6UL/5Mp8F1vvJ019Sw5e5OaKg0NK+EHHf0Rm/6VgD/q4rMZh?=
 =?us-ascii?Q?xBzk2h7A3rJXq5h3CIM1f7A1rKTeqPoLZdnHVB0ZQOx1MbxVTVzkyJzeSnim?=
 =?us-ascii?Q?VbhHtStZMk9jtG/6EGdwX1YmyMs0tyQLtoOUOA4CHUhIgJbDE+eHNtUXTZbQ?=
 =?us-ascii?Q?RLbRgE1WH87NBYVz4m8E0GZ9YS1HH2LWgy1p8jg0P5HoqUFfqKAc/hWYrKKP?=
 =?us-ascii?Q?3VUqm43GQhJHxZLQISuS1KagtBTFT27wldnJr7CXS1hI4vveJnmCDaWUP51x?=
 =?us-ascii?Q?Jna8/I+WuM2dr8dCgjP/Lns9lC8zQ0oC8S+zRDHoV55M/H3KbKm/aLq3qJJp?=
 =?us-ascii?Q?vKMxd+1n/DeilHa7WSt7cnCoxL+iFrLEMsv+xC1qDSV/yRe1Wt+vJC4rdbgl?=
 =?us-ascii?Q?pvERZOmvSkec82SDd0csdpRqEaZ6Fr/m2sxnG2fBav4JroghJCP0mFsRUM66?=
 =?us-ascii?Q?Azq6eRqFfzAct3U072FgAXxHNtNucqVj5B0CDPuKBAKQC0htVjubRN84dLTW?=
 =?us-ascii?Q?OddLDRydSWQD3YEBzSx0DOtjHEd+Uaac3RvWCfPSZOzC/8V+P1UL4l3gI+Jf?=
 =?us-ascii?Q?Ne3R9hlZwJJK57v7JJk/6ZFqjc4gVZUvEzTD2Ud9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd644932-dfcd-48de-7a71-08ddb8c20847
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 17:09:26.1456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjeNjPfNwNJ1//rRP9mfTHnZYG63xB98pHHBpg0tKwVz2d4pusSsqf+ncnpHyf8E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7351

On 1 Jul 2025, at 12:58, Christoph Berg wrote:

> Re: David Hildenbrand
>> Subject should start with "mm/migrate:"
>> Likely we want a
>> Fixes:
>> and then this is probably "Reported-by:" paired with a "Closes:" link
>> to any such report.
>
> I included these now, except for "Closes:" which I have to idea what
> to put in.

Fixes should be:

Fixes: 5b1b561ba73c ("mm: simplify compat_sys_move_pages")

Closes could be a link to the bug report.

>
>> But I'm wondering how long this has already been like that. :)
>
> The now-offending "pages +=3D chunk_nr" line is from 2010, but I think
> the bug is rather from 5b1b561ba73c8ab9c98e5dfd14dc7ee47efb6530 (2021)
> which reshuffled the array-vs-32-bit handling.
>
>> Something a bit more elegant might be:
>
> Thanks, I used your patch draft with some minor changes.
>
>>  static int get_compat_pages_array(const void __user *chunk_pages[],
>>                                   const void __user * __user *pages,
>> +                                 unsigned long chunk_offs,
>
> I replaced chunk_offs with "chunk_offset" since "offs" looked too much
> like plural (list of offsets) to me.
>
>>                 if (in_compat_syscall()) {
>>                         if (get_compat_pages_array(chunk_pages, pages,=

>> -                                                  chunk_nr))
>> +                                                  chunk_offs, chunk_n=
r))
>>                                 break;
>>                 } else {
>>                         if (copy_from_user(chunk_pages, pages,
>
> The else branch here needs tweaking as well:
>
>                 } else {
> -                       if (copy_from_user(chunk_pages, pages,
> +                       if (copy_from_user(chunk_pages, pages + chunk_o=
ffset,
>                                       chunk_nr * sizeof(*chunk_pages)))=

>
>
>> @@ -2440,11 +2442,11 @@ static int do_pages_stat(struct mm_struct *mm,=
 unsigned long nr_pages,
>>                 do_pages_stat_array(mm, chunk_nr, chunk_pages, chunk_s=
tatus);
>> -               if (copy_to_user(status, chunk_status, chunk_nr * size=
of(*status)))
>> +               if (copy_to_user(status + chunk_offs, chunk_status,
>> +                                chunk_nr * sizeof(*status)))
>
> This seems to work, but honestly I am wondering, if copy_from_user
> needs a special 32-bit case, doesn't copy_to_user need special casing
> as well?
>
>> (untested, of course)
>
> The attached patch makes PG18's new numa test pass on amd64 kernels
> both in amd64 and i386 userlands.
>
> (In the meantime, PG git head got a workaround that limits the chunk
> size to the same 16 as used in do_pages_stat; I tested with the
> version before that.)
>
> Christoph
>
>
> From fdbcbc88825bc2e857dfeeebc91d62864e0774dd Mon Sep 17 00:00:00 2001
> From: Christoph Berg <myon@debian.org>
> Date: Tue, 24 Jun 2025 16:44:27 +0200
> Subject: [PATCH v2] mm/migrate: Fix do_pages_stat in 32-bit mode
>
> For arrays with more than 16 entries, the old code would incorrectly
> advance the pages pointer by 16 words instead of 16 compat_uptr_t.
> Fix by doing the pointer arithmetic inside get_compat_pages_array where=

> pages32 is already a correctly-typed pointer.
>
> Discovered while working on PostgreSQL 18's new NUMA introspection code=
=2E
>
> Signed-off-by: Christoph Berg <myon@debian.org>
> Reported-by: Bertrand Drouvot <bertranddrouvot.pg@gmail.com>
> Reported-by: Tomas Vondra <tomas@vondra.me>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Fixes: 5b1b561ba73c8ab9c98e5dfd14dc7ee47efb6530
> ---
>  mm/migrate.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 8cf0f9c9599d..2c88f3b33833 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2399,6 +2399,7 @@ static void do_pages_stat_array(struct mm_struct =
*mm, unsigned long nr_pages,
>
>  static int get_compat_pages_array(const void __user *chunk_pages[],
>  				  const void __user * __user *pages,
> +				  unsigned long chunk_offset,
>  				  unsigned long chunk_nr)
>  {
>  	compat_uptr_t __user *pages32 =3D (compat_uptr_t __user *)pages;
> @@ -2406,7 +2407,7 @@ static int get_compat_pages_array(const void __us=
er *chunk_pages[],
>  	int i;
>
>  	for (i =3D 0; i < chunk_nr; i++) {
> -		if (get_user(p, pages32 + i))
> +		if (get_user(p, pages32 + chunk_offset + i))
>  			return -EFAULT;
>  		chunk_pages[i] =3D compat_ptr(p);
>  	}
> @@ -2425,27 +2426,28 @@ static int do_pages_stat(struct mm_struct *mm, =
unsigned long nr_pages,
>  #define DO_PAGES_STAT_CHUNK_NR 16UL
>  	const void __user *chunk_pages[DO_PAGES_STAT_CHUNK_NR];
>  	int chunk_status[DO_PAGES_STAT_CHUNK_NR];
> +	unsigned long chunk_offset =3D 0;
>
>  	while (nr_pages) {
>  		unsigned long chunk_nr =3D min(nr_pages, DO_PAGES_STAT_CHUNK_NR);
>
>  		if (in_compat_syscall()) {
>  			if (get_compat_pages_array(chunk_pages, pages,
> -						   chunk_nr))
> +						   chunk_offset, chunk_nr))
>  				break;
>  		} else {
> -			if (copy_from_user(chunk_pages, pages,
> +			if (copy_from_user(chunk_pages, pages + chunk_offset,
>  				      chunk_nr * sizeof(*chunk_pages)))
>  				break;
>  		}
>
>  		do_pages_stat_array(mm, chunk_nr, chunk_pages, chunk_status);
>
> -		if (copy_to_user(status, chunk_status, chunk_nr * sizeof(*status)))
> +		if (copy_to_user(status + chunk_offset, chunk_status,
> +				 chunk_nr * sizeof(*status)))
>  			break;
>
> -		pages +=3D chunk_nr;
> -		status +=3D chunk_nr;
> +		chunk_offset +=3D chunk_nr;
>  		nr_pages -=3D chunk_nr;
>  	}
>  	return nr_pages ? -EFAULT : 0;
> -- =

> 2.47.2


Best Regards,
Yan, Zi
