Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F08C1F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699989; cv=fail; b=VWzIQnBbsyD8RrSFPEEUmRkK98Gsmv2gIIB9b0+V05LIRJ2jhMBT0Zeoa0cAFEDwZg1mLozZxnItPXPFsMToY2aHIbxp9I/RWe7Bs+zaAPOVU0mM9+7ObRdZhWJpWV7FI/yx2nvOGRZyLMFn7ywKFpRqu/Zb5mLv9cfbYpMW74c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699989; c=relaxed/simple;
	bh=awULuRp3XAY/E6lQWzuNZJ4I9ylglLvFJID5h3Tf8oI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=quR8PJzzvuAynDPS42V43jGr6ThtrCCSydFanaAKUr9SkVnwAdP2q6B829HEe7pmfYcUmqtoxSJyt2E1cWOiTFRhj6D5yK+Vd/n9Plg/NabkAuOWr4Xp3MM8nBHuNJBgpwoVfVN7U7EDeWSUwH8pkkTrTXuoj/CWKIbTTQW9MlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d0LdBSOs; arc=fail smtp.client-ip=40.107.100.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d0LdBSOs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhdqxclhAKgZDa34lDm6CoQ16kdMTPOJluz9cH046phwogmW1p9ar+sELs4518/45P9nxygW6o0JmsphAxkwZu/csekx3ZGq3DNuKoUukKiLYtP/mKqi3FCrwUHcTl/sAhYT3WxG8ZcZ2g9EYMAOaVm2Sz35MZksutWGjFKqA4g9mBlwEDBGbs2jpKQBlJYe+CIEtLn4nZTfHgSZjv8xbVlIaYYwYPMdQzosiSs49Lix1Ih1OSyu77BM+QZXOttmeV0FpZtDaJa/qa+90o2h2bIZvdCjndBYEJuBd3E9cH+SkVdCy8AoBr/pDOdJ4Evb/8960HirMKveTB/tQEzjuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToOHOXxCmdHcT0ePg7eJf5YeChNTSwx3kSvD5Og6q7A=;
 b=MHL3BnR80lI2Svc5kSRR+GSxzQc9TBMyW+ixzR6t48q56F3SOWvgeBaCu0m9quomsVpCGcRcRAfqGKju7VbWGZfcWoMNvjIVGjoJG4giJf+1dHeADBPaI4erSFnWOduN38Zl6O1RUSp7D/wv1Of6ZS75BQ5ntK4aO+xKmPtNwBLIR8P7/hcIHktF3ub4SzhXcEey10H7VA75bJlES8vYo6qgha9HHd930wIO3Er7qbluj5GqvgewGNg1JdrB1TPLUTd1w0t36k2Dd0Cf3FQHNTi1yyO8iWuh+bIzLihJoao7KfDReWt5OBiW+cw/a85vcOm7uQHIx1ADVHsxY4D8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToOHOXxCmdHcT0ePg7eJf5YeChNTSwx3kSvD5Og6q7A=;
 b=d0LdBSOsyZWL6OhXLK6rh5pj83TfTOvcTwWtNh1N7ar6mRTvMGMw4ZBCuKa0zh8RQQiTqNcMmP6GcVYxAcr7kbg9apeSQAm54B8PaESkmf9y/KBzy6eedCbl4+x3JP4BYPof+hOHukfJChCk4UDpWrj2+jKGwzt3HooHseZJsYsDrXS5SDgKZMG4ItAAIYBlXNanNdFoUw8P7AklWpePLvEKrM+iUwa8zjVzvUuPW+PZx2zVzmJHtORlx/K2s/8HHTMtutnORDCmp01QgZ/zfcq/A26NCjemM9YlOclH7cmzqmeFtJrzccrznyiX2CYeAEd/AujNXusV76ebAj02Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CYYPR12MB8856.namprd12.prod.outlook.com (2603:10b6:930:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 06:53:04 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 06:53:04 +0000
Date: Tue, 15 Apr 2025 08:52:54 +0200
From: Andrea Righi <arighi@nvidia.com>
To: yangsonghua <jluyangsonghua@gmail.com>
Cc: tj@kernel.org, void@manifault.com, changwoo@igalia.com,
	linux-kernel@vger.kernel.org, sched-ext@meta.com,
	yangsonghua <yangsonghua@lixiang.com>
Subject: Re: [PATCH v2] tools/sched_ext: Improve cross-compilation support in
 Makefile
Message-ID: <Z_4CRtuigYg5RPQ8@gpd3>
References: <20250415054642.3878839-1-yangsonghua@lixiang.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415054642.3878839-1-yangsonghua@lixiang.com>
X-ClientProxiedBy: ZR0P278CA0163.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::10) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CYYPR12MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 962275c8-1a8b-4f19-69b4-08dd7bea2ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4+D4MFARB/qCROL0v2Ss4d3IFq5D1xsg+tDh8oaVKaixqIbZH4E2MgVQm+Bb?=
 =?us-ascii?Q?taIn+kBu9GJQ3Zd7+PMDQ+xvwa+mmlswnunaZ1PZ+sRNIzB2DzQM9bqUz3iV?=
 =?us-ascii?Q?/OCKDu8Bq0qJhBdcrIeT3/wRBXF5Wqa+Gh8Ndis96Z5G5UXzhGfL5COhpf3E?=
 =?us-ascii?Q?c6+GdPiqQJV7KsDb0T/L8PvPvO2Gh3F5QEI3onizEDt+q3yYitevocoJMMLN?=
 =?us-ascii?Q?A18Zv/gjMAbSVPt8rIAzBIWHpU5BOhlhnWT/w3cuy5z4McKEdfs2EsGfa15t?=
 =?us-ascii?Q?r1r2tcE3sLEdFfpKpoD5SmwS3bTc8t/3Sb+OEJbKwEOs+5wZxnTE/35tetjl?=
 =?us-ascii?Q?J2h/VxmUuJPdei56kAH+w7KDt1IquW7dj3Mn1nZ4UcbDSvjKYkQlUIyoy1Ds?=
 =?us-ascii?Q?iDa753w6tkTMDNpQPeDJ3GrzJXRgao6SNhTXQkkqmN3Lq7s7HV7ATpVOD/6K?=
 =?us-ascii?Q?z7QJeG6q3J0w8LMNbehvehqX5k4WTThxrND4t7ujzIuuPkX+wdR8dhbiv740?=
 =?us-ascii?Q?e0iA0bv1DwNoeyZLBT/CHLlAJ7BXReocCG8qSc1XZtfjYmxwXgFoSJW4FhRA?=
 =?us-ascii?Q?flFvSkbwofFCsu0UCLos/K8aUeQylsW7SOsa22CRS6Dl7ovYZWdpCvxmXoJh?=
 =?us-ascii?Q?2BH1QKP2FIv2oSTNyQRawJ1ytyC+fclwuM5o6XCk4WqzthLL0xFcWFXrsHG2?=
 =?us-ascii?Q?kVwSW6sEf/WbU8jLkgmE6Q5DRFpNOGRPeegGa8EVG4vBuWc7YZv3onKdYMi4?=
 =?us-ascii?Q?Pls4EinJoebx3MlkQ3n8D2aoPGb9Fw3sS8VoAoGWUsGd07Avo0bitUqSgO6J?=
 =?us-ascii?Q?bXuHMFHDdvxCytbTyghHGI3ZyEhBrbIC3Jlpsy85Fya/lY1UXoT1n5uHgFuN?=
 =?us-ascii?Q?1GJuQ1ffcxbkvyzSXjG3lVT83/e05TvheSH4vCsaXxDpKWFB0UZ8+Tw7RMkE?=
 =?us-ascii?Q?IoCVyqT3Q5Mhy/kEv+utdO6hfIyLOwc1QYqo6qQeQT6QLP4XMIBVNnUIoeoL?=
 =?us-ascii?Q?/Ax/FaZoNEPVaIoFO5AwCpdwoqOXVV1V60GW1tlD2qT3oaOYwuDzT7Rms813?=
 =?us-ascii?Q?vpjVMRpwlTlmEn8ZyeEvXOqhB20Aa7ImW/2f/2BAhDoYum63tDQaszDgGiXY?=
 =?us-ascii?Q?QNHlGKqOEKeAo8OZPoQOGBqUpqolbRQyYa6ncR3PmXNSDBqraB3FetB8ucE5?=
 =?us-ascii?Q?12kQCOfLkxeQlRxKuRKali7BABsbuZ2NoFxvW/fxuxBBjHHyxnHJecZIcReD?=
 =?us-ascii?Q?2ueeQUygodimqQNiL2a+VQS7an5F8gZYJWEsTAsemL6Poqqyetec3LFpbWZJ?=
 =?us-ascii?Q?9UbJKgybE2wI10SBILJ3ai7BBoeaUSWch4B0yzAvMKjjpTIsJvBSE7oTJUHE?=
 =?us-ascii?Q?+ihvDejrEf/9p0H/iEq3/ksPjO1k2qHVuon/2YAcKZHUlR7XsTaGJh61iVqT?=
 =?us-ascii?Q?djjDHlZvRhw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mq23BNOidx0Vm+q118921h8TNO5R0XbaX4WOkh1jiuo7HSaIdNqGL8uhEl8i?=
 =?us-ascii?Q?w51bOl5BMw2hTJAmHHn818KFih9YsWRKthEqOi+pPyADUUGDYYE9obJ01lX1?=
 =?us-ascii?Q?QM0IK7W26nfJ0U7/SUtwDqBRreV5H/pl5loTd47QeL9Q4Vc9KWMaFel+qdit?=
 =?us-ascii?Q?8xcB4e+t/ZJpjMgbfZ1ZrkYEW/L4/akXf8swLGA81ruucDtYJi8giWiDEK4j?=
 =?us-ascii?Q?Pt5ceR2B8ZEzWEQhCjjmIMBvjqPBvMQBQBw6pfF2GZa0G0vPc5bwEVoLxhvY?=
 =?us-ascii?Q?/+jarF8/kNOPaEzeFjxMyx8CiQXV1qZ06G+muf7mZcVFIUU+NXmYpQXPGdK2?=
 =?us-ascii?Q?p58bkD6kIqncfU1WYP39TWC6vr4+wMP5uftNbhKCcsZwmJwy9pokrRuxUzyg?=
 =?us-ascii?Q?l08KRtnnODl5WUX5qJege/5zv0OqV9wAvKyvBtf3o0tNfzfAQoDh3vgqTnVB?=
 =?us-ascii?Q?x891wodSEZraeVuw3947w8LERArp6cN5x0o2iOJBSCzb3Rwr17m2L3pEUHg5?=
 =?us-ascii?Q?cacGK7NklOFFw5FjyR5uyXMgjGtUgBmU6JSveIiQUAREruxGO6S6xXL9V6+B?=
 =?us-ascii?Q?TsFVbhWfeeJN5mUdwuP5a+Ghol8liqIweltjRJElsNF9yK0rcO/KncawqESF?=
 =?us-ascii?Q?vhqqtoRCpmssR3ruyzWVu/ztcqSKa1H7ae2StLmU5eTruFs8LI/WsIIH7M7/?=
 =?us-ascii?Q?MxY4QCtb/FoS6vjYU8CFqfGlDEkvP50kCIwvg2ogQuPJFYQs3LbIiVFECYA9?=
 =?us-ascii?Q?44IIH/Q0//X6zows5YQ2HUK1TOINeHuWbS5Z3kQMBCK9bu56y83YwxVr34Hq?=
 =?us-ascii?Q?FVjq/8EFxgPYcpdxR2iB+gIPGmQVd4kRLgNjDOf7Bm6/qEUxQsIyEKPOAc9N?=
 =?us-ascii?Q?O5vfRPvEFsQY0sQn6IE+utl9RQKftbfOtAxt8E99XvEhSHt7bEoS1DP+tTF3?=
 =?us-ascii?Q?eI5zqDNLh3Afad/rjtSbgD/qQPFgjxLYm5hiF4Ba0TrN9lyMdzUQLSTvp+OD?=
 =?us-ascii?Q?4TE3iEWH5AbXhPu20KY8U8hhPS4bm180oyyJFMEWcBCY4xpRYVNzv7BNeG07?=
 =?us-ascii?Q?tHRnoR7GkqGd1Cn4fLAenomeRhOWqmhtMkVCOk7bxYc/V+7sqWfAVw+s40as?=
 =?us-ascii?Q?bO8QDt0CxpvVWb6w0asTARrpfQyS3/UULnfNYeuDaBLr35tNTOyt7M0PHsYf?=
 =?us-ascii?Q?1IVAdKYn/Mr2+nhnzCG1RPSCln1GR2hhLNjlPiE03SN/SK2U7mXq8U0v6zyF?=
 =?us-ascii?Q?OoZcrsinNpQgzCM5I+KCNPrWGtBE9/W4GO698YojbxuPS9Xf8iFZEwxt8Ow0?=
 =?us-ascii?Q?oz1+KjnRyCl5KVPV1v3jBQ0ljLyzjEF6eeB9d2A913RPDwybVQO1fRjNEGnC?=
 =?us-ascii?Q?2kzJhk/VcMS0cNjZj6p8F0xppDxvx/p8T/EtywWGA49Cj5agBflqlzEsMw8t?=
 =?us-ascii?Q?xAfvYOIlmTcaBHgl/ip03ixRNNSVosOCQXSpWpr02ieF+qEaHtf2VwGRWzC+?=
 =?us-ascii?Q?LdZuBlqOhIvnq8JKoV6AOWYrQZWEDyOIs5gYU0Tw3cIOW14lSIo4UlCWQOSr?=
 =?us-ascii?Q?0GUYtNsMPToxTlvTK9c6zGCxy7UBEUyxvQjHnPCr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962275c8-1a8b-4f19-69b4-08dd7bea2ba6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 06:53:04.2905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ak+PStOxx+va5llhr91cBCuLmELW8Q4j4vYo1oJNpjW795tT+bRgQ5zRe2+bWSG7mSf9FYSE4UAscMaVUpKnyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8856

On Tue, Apr 15, 2025 at 01:46:42PM +0800, yangsonghua wrote:
> Modify the tools/sched_ext/Makefile to better handle cross-compilation
> environments by:
> 
> 1. Adjusted `HOST_OUTPUT_DIR` to be relative to `$(OBJ_DIR)`, ensuring
>    correct path handling during host tool building when cross-compile
>    (HOST_OUTPUT_DIR now points to $(OBJ_DIR)/host-tools)
> 2. Properly propagate CROSS_COMPILE to libbpf sub-make invocation
> 3. Add missing $(HOST_BPFOBJ) build rule with proper host toolchain flags
>    (ARCH=, CROSS_COMPILE=, explicit HOSTCC/HOSTLD)
> 4. Consistently quote $(HOSTCC) in bpftool build rule
> 
> The changes ensure proper cross-compilation behavior while maintaining
> backward compatibility with native builds. Host tools are now correctly
> built with the host toolchain while target binaries use the cross-toolchain.
> 
> Signed-off-by: yangsonghua <yangsonghua@lixiang.com>

It makes things better with this applied, at least it starts the cross
build, but I'm still getting troubles with libelf and zlib:

$ make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64
...
  LINK    /home/arighi/src/linux/tools/sched_ext/build/obj/libbpf/libbpf.so.1.6.0
/usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: cannot find -lelf: No such file or directory
/usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: cannot find -lz: No such file or directory

Which distro are you using and what command are you running exactly to test
the cross build?

Thanks,
-Andrea

> 
> ------
> v2:
>   - keep HOST_BUILD_DIR and LDFLAGS unchanged
>   - change the title prefix "sched_ext" to "tools/sched_ext"
> 
> v1:
>   - https://lore.kernel.org/lkml/20250414081436.2574882-1-yangsonghua@lixiang.com/
> ---
>  tools/sched_ext/Makefile | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/sched_ext/Makefile b/tools/sched_ext/Makefile
> index ca3815e572d8..eb85f3762a1f 100644
> --- a/tools/sched_ext/Makefile
> +++ b/tools/sched_ext/Makefile
> @@ -62,7 +62,7 @@ BINDIR := $(OUTPUT_DIR)/bin
>  BPFOBJ := $(BPFOBJ_DIR)/libbpf.a
>  ifneq ($(CROSS_COMPILE),)
>  HOST_BUILD_DIR		:= $(OBJ_DIR)/host
> -HOST_OUTPUT_DIR	:= host-tools
> +HOST_OUTPUT_DIR	:= $(OBJ_DIR)/host-tools
>  HOST_INCLUDE_DIR	:= $(HOST_OUTPUT_DIR)/include
>  else
>  HOST_BUILD_DIR		:= $(OBJ_DIR)
> @@ -136,14 +136,25 @@ $(MAKE_DIRS):
>  $(BPFOBJ): $(wildcard $(BPFDIR)/*.[ch] $(BPFDIR)/Makefile)			\
>  	   $(APIDIR)/linux/bpf.h						\
>  	   | $(OBJ_DIR)/libbpf
> -	$(Q)$(MAKE) $(submake_extras) -C $(BPFDIR) OUTPUT=$(OBJ_DIR)/libbpf/	\
> +	$(Q)$(MAKE) $(submake_extras) CROSS_COMPILE=$(CROSS_COMPILE) 		\
> +		    -C $(BPFDIR) OUTPUT=$(OBJ_DIR)/libbpf/			\
>  		    EXTRA_CFLAGS='-g -O0 -fPIC'					\
> +		    LDFLAGS="$(LDFLAGS)"					\
>  		    DESTDIR=$(OUTPUT_DIR) prefix= all install_headers
>  
> +$(HOST_BPFOBJ): $(wildcard $(BPFDIR)/*.[ch] $(BPFDIR)/Makefile)		\
> +	   $(APIDIR)/linux/bpf.h						\
> +	   | $(HOST_BUILD_DIR)/libbpf
> +	$(Q)$(MAKE) $(submake_extras) -C $(BPFDIR) 				\
> +		    OUTPUT=$(HOST_BUILD_DIR)/libbpf/				\
> +		    ARCH= CROSS_COMPILE= CC="$(HOSTCC)" LD=$(HOSTLD)		\
> +		    EXTRA_CFLAGS='-g -O0 -fPIC'					\
> +		    DESTDIR=$(HOST_OUTPUT_DIR) prefix= all install_headers
> +
>  $(DEFAULT_BPFTOOL): $(wildcard $(BPFTOOLDIR)/*.[ch] $(BPFTOOLDIR)/Makefile)	\
>  		    $(HOST_BPFOBJ) | $(HOST_BUILD_DIR)/bpftool
>  	$(Q)$(MAKE) $(submake_extras)  -C $(BPFTOOLDIR)				\
> -		    ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD)		\
> +		    ARCH= CROSS_COMPILE= CC="$(HOSTCC)" LD=$(HOSTLD)		\
>  		    EXTRA_CFLAGS='-g -O0'					\
>  		    OUTPUT=$(HOST_BUILD_DIR)/bpftool/				\
>  		    LIBBPF_OUTPUT=$(HOST_BUILD_DIR)/libbpf/			\
> @@ -185,7 +196,7 @@ $(addprefix $(BINDIR)/,$(c-sched-targets)): \
>  		$(SCX_COMMON_DEPS)
>  	$(eval sched=$(notdir $@))
>  	$(CC) $(CFLAGS) -c $(sched).c -o $(SCXOBJ_DIR)/$(sched).o
> -	$(CC) -o $@ $(SCXOBJ_DIR)/$(sched).o $(HOST_BPFOBJ) $(LDFLAGS)
> +	$(CC) -o $@ $(SCXOBJ_DIR)/$(sched).o $(BPFOBJ) $(LDFLAGS)
>  
>  $(c-sched-targets): %: $(BINDIR)/%
>  
> -- 
> 2.25.1
> 
