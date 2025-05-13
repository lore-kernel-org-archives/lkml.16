Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F581D555
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148907; cv=fail; b=kT/azgCWE3qA8j/iiGCIwa5SCWVpiGEY5rWDY6W4/BF6J/m2okbV/0r/nloBYpDmGdJ7ee1cLjXMvCzMq5i0QQ4dv2Q0uMnDj3mm2jycLynpotfIyx4eEPjHxzvFMB7xn4ZsO5v/JujGc4rsvvL9Oal93FIkIpTRnqAS2mpsx34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148907; c=relaxed/simple;
	bh=OYxBm4twnnWuQm6odYT+JoV+orXs49J8EMfyAugpRVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pvkZnVpXRbg87RqDp4J0gVGBoJ9M0UmpBFq6E6KkG76VN6hasxoWdY0gPi3FA747zcAFuAgHejgkf8Jjx/3ohIEuaIv4hyQZoSkxKflvKqo8tGDDDFunHgTkwDPyDii6m8DC34d1V5O2YkJKkBlM1OagmUCbrnuBZ9QyWoVhEoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d4HwQkTG; arc=fail smtp.client-ip=40.107.244.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d4HwQkTG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=quKSXcY0AySN6+gz+8ILq710BsqktT5jS4gDS3Tajj67ozfFsfSwfWONIk+tQi5Fm1oEDFYhwue0pwb/aygGt3TaRoCpi0JLG9Cw+kGWsd7b4c/DA9kBM5+uB6X/uScVKRLmfxeZOsxvFI014BfZOfsGA8JHIyxoB1GsVvD5VEbqXzsMqtwXb4ikZ235g/wh0vrc9VZyMz/4LQ4JJKb1TSD1ZPaXpAYUcMrA0RTaWErlZMHO108lX8dfsHiWhLujfI6xV5Zy+zTBl0XjxBCGbVAGQewjBadFW9i8wXftaI8iBDgGRPbhMkhq8SgZPoP33wHougItaFQ7Ty8WxPVf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJg8Rg6Ds57Q210/jqmLA8qIuPn4YWSLB7CY+sv/ScU=;
 b=SZIF8CF0AW6WD/FoOoViBRQ8tRto61YJ+ahB5hRcpH0/P3JMd+CEsUlmMsjzXaOQobiXwqtNPdVFsMz/WuJZFbTPgCLum19oXRVDvlR0nZgCttJsy8C1/irGeaC78RjwgjSdX5kxxAgpEbCfN9nDW8ACRirsmwTaO7cr+ObqlCyNrD9EAePJUC0ZgJZ+y7GFikSL1JVnrQI9+uiXO5aew9PhxVJqDXw2n14X80HaIH+5xe+vrTux8oK2aWHCD1GR1MPfUQPQzpAd40ffVXI4lxfmXF/bnuYv0CVMgCeuQyA76ou3N92KuqULXZKNYv2/i6Oil7x+rAGg0v8OetqgMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJg8Rg6Ds57Q210/jqmLA8qIuPn4YWSLB7CY+sv/ScU=;
 b=d4HwQkTGkNEf79lm06/JTKhGnf+la8iv51dB6eaBhnA+laLGcQq7nTKwoFUgbNlvg5zZVNGUHdAUcVsdr8K1kKZFRFPuXpv6SKqr3UkEcHGKUiM0KcfOo6F2fMp8/ROlG1PI7z+BV8s9JHO8eUPcavZu1ehNUjt+Ro8nNNbAIJDX7uln53I9LP6qc179fMh0C481exF5vctn1G1YO3Suh3yY/fQ49eH4f8gj1XAgQ9z30xSiUjA/Qi1Ub5kUYkYHPrgVGTmlMY7IemGc6P7xU+m07dFc6Vg36xsvxOGFWMz8yqJV43o5NMCDDnACrGC1qGvrAZK/fZXWeK0pVuqnyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BN7PPFD3499E3E3.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Tue, 13 May
 2025 15:08:22 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 15:08:22 +0000
From: Zi Yan <ziy@nvidia.com>
To: Juan Yescas <jyescas@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, tjmercier@google.com,
 isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com,
 Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Date: Tue, 13 May 2025 11:08:20 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <A3E9017A-7282-4BF9-AC60-E2C74EB68980@nvidia.com>
In-Reply-To: <202505110035.wtOWnL8o-lkp@intel.com>
References: <20250510010338.3978696-1-jyescas@google.com>
 <202505110035.wtOWnL8o-lkp@intel.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR06CA0004.namprd06.prod.outlook.com
 (2603:10b6:208:23d::9) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BN7PPFD3499E3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad0ad09-e0d9-4432-cac5-08dd92300089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n5VPCzdbGgO0cNlrkM/JnqeSLL9ezhfU0i5GqHz9Rkv8PbkRw0kPmalc/VYj?=
 =?us-ascii?Q?Z3CZuWOF71wdf+pGUEp+3BfSS8fm6PnV7XaAhUbo9ZIkEt/xI9YJl5kBDwJp?=
 =?us-ascii?Q?SyT0GqAfSuhHS4vzzNKY/DSQiArLXnttn8aA+Ei8vpqcwk6UrWXy0yxpiXDX?=
 =?us-ascii?Q?ijZ4IIntwtIHgkUPT9aKUFD69yPTvOZohk4Of1dDNkpdhnmhw1K4zX8TkcYX?=
 =?us-ascii?Q?7Wd7VLrCzcKr+tXF3kqGpIkC1bxTWwyliXICsfPn1HVsIsxfXr4wnr0lb262?=
 =?us-ascii?Q?niCDYmz6jl0Xl6q6sOAYnhP+0NzKu0zKOxK2Nc8q2tFO+lbj0bepfQ899Bod?=
 =?us-ascii?Q?aJWEGWwE/H8MuO5FYRHYxf04C1rZQvUUz7H016okEd9J0QDfiJsok1q7bIrS?=
 =?us-ascii?Q?6oZNyRQXbZ+VZYzdxa2AP/QbZT6+fjwI9HT+efxbPjP/Nu081MLVcAhWkF7w?=
 =?us-ascii?Q?RDlkqjxXdKPvKyFiWM8mWxR23O7kEYrVNmW0pOBABnHp4w61iMoiERIz4jX5?=
 =?us-ascii?Q?aeSro6VF7Cy4YCRv4d/rE1jFoUyaap5b53GbtzC2eTw4a5jUIXJYh82htU4u?=
 =?us-ascii?Q?AoFNIuU+gUkOvpu8aTrGd4qTzujQom+kipLuq/bWkKltrXMBz+HiPgX24dvQ?=
 =?us-ascii?Q?+wuBN37ITeJOJUjAit5foAOS21miqKUV1u3+Hmt2v+n5RjnFoECT1GfGx47k?=
 =?us-ascii?Q?cSNS1jIzvW+DvcfXSxd29xfDjxoChzzdGzR6khOveJBzpEENEpi8+cle9K3r?=
 =?us-ascii?Q?m+yMw5oohbYUHLXMaArRqHDxU9BW+KiKpmJaGHA3rJ4gWVn+fOQR6/oM+DK6?=
 =?us-ascii?Q?k0oFU0tQo97PQShte/F/+rXPnEyVMvS4Kru3Nhrvd1cNwSpjX2Eg2kC57qQw?=
 =?us-ascii?Q?V5OEDeubVWCHXva2rlp7tXrsrR1aiUIeLd8rzCg3aCKVoMNGcGhvSIajMW2a?=
 =?us-ascii?Q?PDdRUUUk838BBtlwg8XfILYeNvkpaqe4tbWejAxtXNB+9fyPFo23ZsDmBUzn?=
 =?us-ascii?Q?m5CMhhS0CpYrAH+aqOhxDAiMXqyQbU1lGt70KP8KKaEoVQ7JjtI+Sv/jD9ZO?=
 =?us-ascii?Q?qBMppGYw5JB7vIvHr9nGRBFxOTSsDsvgrK/q5d3HVN1tOgdpGHAVwF+D27m8?=
 =?us-ascii?Q?gyKBk7GuDzFMjOqk18UjSb7PZAO1uoh+FcO7PXL298pYTG/bpyJoV8M6G+Tz?=
 =?us-ascii?Q?wGHFO78UYHJqR8uEKmciyHT9zOvLD4cjTp25cxhIri+DlMAWUP8bKvjNnIUD?=
 =?us-ascii?Q?WiP5SL4dsE32hIH88jnJxN+boYfFOg9UMDasyt6/+2v9PTcqXo0uaxqjkFDX?=
 =?us-ascii?Q?d9WlLGkhATD7C9aiRMKgE8Qx815re2AqAKg6f5ee/ph+j5nF3CVCtdFBhxLO?=
 =?us-ascii?Q?GpSMn7voLSSFWcicpDnkZq8QuUpAfnQ9GQai4p2cyZDa7NmCC6pURHm/NHKv?=
 =?us-ascii?Q?e+SFecwitB4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3oUncuaYtBZbGoUWsLkXvofzxMW+qOdS7U4Lv3Hc10UQycKTOCqX22B5AgGy?=
 =?us-ascii?Q?78URWB6v0FnZXCPs0uRp60ojdsGhi/gAhuRCK0Nt2Jx2K+JwAU4m32Uo+9P6?=
 =?us-ascii?Q?UHV2Tq2s7P6aC0KAhJrCgwpNqGLOygVUpNug1WZWhF00nGhAKOMMthKWB/1S?=
 =?us-ascii?Q?HlvLgkPq+35StwknmuJ1Uve/uNynGE8IgkiD8yQrIZAKMu+bnIi+mekAMqUj?=
 =?us-ascii?Q?90fwshHeLM72MdGsZuoxWIOmN1fMMEtXaiPmDe8IkZCwFtpgSydioi2zej8p?=
 =?us-ascii?Q?VE3uyYsHBuhqp+V2nctemQKnOxtj9PBKlKrF9QBSqfSw+RYJU8royTruitGk?=
 =?us-ascii?Q?w5eWEbyvwwVagwluK2sqAawxPgN/+/2rUaLIbKQdjKyYfAvZep+z4HEhhzEa?=
 =?us-ascii?Q?Zw3ed5WjiMKtUjPmcRBqm6+k8EI95AbW/Poo9I74/tlVjTQW4Dotntr0jArT?=
 =?us-ascii?Q?a3FA2IR1r0dWE3mfg2S8rhUBfhv7JxBOS++atEK/O5KQpSkBbABRjIVRrXWV?=
 =?us-ascii?Q?Y7k03eNKC2O4ZmVORDTVES7vqR3IupzvCghC5dhROZt40i+TmE26uepNjV8T?=
 =?us-ascii?Q?QDMIrOpwE36lMp2c/FyPdJtm/YX1Vl7NByJvuFF77iTSZYlwn1E93tPQ+pFx?=
 =?us-ascii?Q?Wzlu1Z8u9whoK8KrInsXPfTIhb3vP5YXSdu85vwFTLtbHb2QETokNtGD0ip1?=
 =?us-ascii?Q?zJw6OvDCiPDfXws/UPq0kJHmcI5lBUBj607fjMl1v9hyR7NIU+eBw61Dvecd?=
 =?us-ascii?Q?rKZ8o6meknN+u3OBqT4rWAVJgO4Ugq8bZWJ5pOT0KqS0foc47v+wlAluCyY+?=
 =?us-ascii?Q?5mivn2OmpCUdluTxmWaGRtNu1j4uYdAYUk5TNcFa1bZEgeuAtU8Uu2KqcXpq?=
 =?us-ascii?Q?uKFf9FXVfNZAUN1ESm5e499A1tDB51a0fgPukGwWucv2NanKmBnGlGyMGUbb?=
 =?us-ascii?Q?ZCkK8l/zbsSvfED7/4sK1RGbWrlCnb+XK6SC03gppRQl7c8DnD2Lo4JsFkWW?=
 =?us-ascii?Q?PsCxpVOKtOejC58C+jFSgr0jVZezbUPoLarrrKTWMU8iUMgTY4UrXHjh2MFV?=
 =?us-ascii?Q?NqmUiH2v6qMJ/qnYnXUdXy7T6m50963aYHra6yI3X8IGVMQ4UmPBvsHsVnds?=
 =?us-ascii?Q?nOeGG06GuFl8Ez5CR0us/xohgHcymXBwioun8DOK7aA20BQQheqm4J4KQeGA?=
 =?us-ascii?Q?J5iv3xirfoQvyv7k2GGR9puoacCGZnJ9rFoUKZrhc3TEYeGCzPH0yePGyr0r?=
 =?us-ascii?Q?DNvLZUW6g575LIErkXCEnj6Utnua3coJOOREjf0mke6L8OV6o8tUA8p25xBV?=
 =?us-ascii?Q?qezM68p1Kk19UqopXKjW2HCPZNdRxD9kEGSwr8UmUEtBZDMznWG49xTL/L8d?=
 =?us-ascii?Q?XHByDBK1djWicMaZ6OLQ2wnING7s1oND3nKZtzBNgWlvs9e8tsFTQSdNvXfp?=
 =?us-ascii?Q?zuMJuHbReGWSt6M2t17nBYaix5GDSgr1JecB+ZzyEveE7k36wgcoTG298ff7?=
 =?us-ascii?Q?/Zk8+SDEeOpfgcLKLQC1sTPzhi0JaUo52NKAUVJrFho9jp3V40vxk9s/QD/S?=
 =?us-ascii?Q?ZE797CWrqum4cedp0mLigrKzTyqoVW9kcKJDg26W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad0ad09-e0d9-4432-cac5-08dd92300089
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 15:08:22.2666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yF0q+zlCn5vXRXZik16E5J/1UBvE5TcNewf8u3AhIiwMXdMNxNTpy0JfnRYV3AYr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD3499E3E3

On 10 May 2025, at 13:16, kernel test robot wrote:

> Hi Juan,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.15-rc5]
> [cannot apply to akpm-mm/mm-everything next-20250509]
> [If your patch is applied to the wrong git tree, kindly drop us a note.=

> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Juan-Yescas/mm-A=
dd-CONFIG_PAGE_BLOCK_ORDER-to-select-page-block-order/20250510-090501
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250510010338.3978696-1-jyesc=
as%40google.com
> patch subject: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select pag=
e block order
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/2=
0250511/202505110035.wtOWnL8o-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250511/202505110035.wtOWnL8o-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505110035.wtOWnL8o-l=
kp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from include/linux/gfp.h:7,
>                     from include/linux/xarray.h:16,
>                     from include/linux/list_lru.h:14,
>                     from include/linux/fs.h:14,
>                     from include/linux/compat.h:17,
>                     from arch/powerpc/kernel/asm-offsets.c:12:
>>> include/linux/mmzone.h:53:2: error: #error MAX_PAGE_ORDER must be >=3D=
 PAGE_BLOCK_ORDER
>       53 | #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
>          |  ^~~~~
>    make[3]: *** [scripts/Makefile.build:98: arch/powerpc/kernel/asm-off=
sets.s] Error 1

In this config, CONFIG_ARCH_FORCE_MAX_ORDER is set to 8, lower than
the default PAGE_BLOCK_ORDER value, 10. I wonder if the error should
be changed to ignore CONFIG_PAGE_BLOCK_ORDER when MAX_PAGE_ORDER is
set by CONFIG_ARCH_FORCE_MAX_ORDER and give a warning instead.

>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1275: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
>
>
> vim +53 include/linux/mmzone.h
>
>     46	=

>     47	/*
>     48	 * The MAX_PAGE_ORDER, which defines the max order of pages to b=
e allocated
>     49	 * by the buddy allocator, has to be larger or equal to the PAGE=
_BLOCK_ORDER,
>     50	 * which defines the order for the number of pages that can have=
 a migrate type
>     51	 */
>     52	#if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
>   > 53	#error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
>     54	#endif
>     55	=

>
> -- =

> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


Best Regards,
Yan, Zi
