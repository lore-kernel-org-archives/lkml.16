Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA48243362
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700232; cv=fail; b=tvdum6tRNUBl7ZKu9NlTtPh0AeiVJwKIuJ2+uRRUqRudPM9Cw4ex7/HW3x2LksZoifgS5G8W1zYNTGhz4udEQFVBgiG/GdM0xrA/LC7R79IaYRiMBHB03lc6vYyTbLOKLHs4GDG9quwyutBbv1BBguZN50qiBsx08lt+yxwWhXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700232; c=relaxed/simple;
	bh=YTv3v2lTZHkfcZUi6yrSnBfTf95MKUEZDtN1UvWBZOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WGWWUndt3yU6sid8e5w0JmEBrUKu5NmgleWnXYXFjZ35FRSKdNIG9nxr/KgufPmY3p2IF1wvdMPLwkF5FNaXNkvcTk3pAczhnno2mYV0Cmb3+N6lEDw1c8C1nvhR5AYsQQmgtZ6YKJaJ8fZs40RUiFQjthuh3WFTflJHC/WnwEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y4ewfpHl; arc=fail smtp.client-ip=40.107.93.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y4ewfpHl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bp/vgTp/S4D9b61+GKP26H+BhqiamzINk9dFGcA8B9SiSZRJglRmojhCHK8ZCj76odQW+RfAexZYF2LXTQ86IFr2si6zWtJg4+Mu20Hi6QOrVfujKHQkXjZKIszSQmteecbIFjMPv2JSSeTpCZ5bZRi7YX/z3rQaJrRGh46JBAphL55h3nz+cWbre0AnIu2sJsoVMslRlktggJWWMDWw4I1NznyzjlAglSOz5kICi/pGPwTw+Q0Fg/hKvlibSK5boYd+lu0bEvhyABLmigBL831s3d/KiJKPhuHnnMNJPJit05itR8+QF0VzSCnp7wJ87VqYxZiPh2LhI87o0CLXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2QjwmdUm+LfEWgwuwraXH2AaQA0yGozNPa+GMwOAfc=;
 b=q0SJy1nKheVtFXx/3a14GunAZDU+QzzDcMfAmCWOKux5pFVSEz6K1dP/zTFGyFtOaY9z2spf+tfl7I/kXDGjeq+p6t7fcRSEJcNzBbEbT+AhjOIPEzW4s61wo/qsCAuXY2JXonflNeJxM8YDz8Z/bSpxZMvrT8e/oVCfLWBL6EGmcLlBaT18HUwSV+V6jRxdmE2tLNka5J0L7Vk29S3pq4MgrwqUgThUe2cDqTy/U5WKIetZGUvvKtcg7mayVUIZW3gDmd1KVD3Jyzab3f/bw81GdAgFM91tpaLf3VYc61gJ8SHSU8XAv1Abee9hN2SWKTgrRz/xITmUsn+mNKMXkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2QjwmdUm+LfEWgwuwraXH2AaQA0yGozNPa+GMwOAfc=;
 b=Y4ewfpHllJiY/LVd+ovB23rluK2dQAyZFxrsxOoYlHoSTm34C/ISOwbwI49h3o3jlOD438koTaOF3J300S6+VL6I0c3uyUKC4ZXDP3jW8XxQpnsgAL1C2Gg7UIL/eu5L1b5Mtg/uQ/OeYwaebibscg0MpUeNSmFSNzIg2/Zo3O5KeJQj+Ew0njxYqSgnEq9QbafPB6LYwRjesqRUAooGUTEqytCg26B++dCcaAfeBW7cwo86KyDS0KczIXL0y8R2lxkN5cI1gRsNFU/L+hGF9lDhxsg/oXhlA7pOwWra3u1hG1wPYWzYbNrtOtijkZaN7FuOBMNopjZD2K7zKHSXJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:431::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 06:57:07 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 06:57:07 +0000
Date: Tue, 15 Apr 2025 08:56:59 +0200
From: Andrea Righi <arighi@nvidia.com>
To: yangsonghua <jluyangsonghua@gmail.com>
Cc: tj@kernel.org, void@manifault.com, changwoo@igalia.com,
	linux-kernel@vger.kernel.org, sched-ext@meta.com,
	yangsonghua <yangsonghua@lixiang.com>
Subject: Re: [PATCH v2] tools/sched_ext: Improve cross-compilation support in
 Makefile
Message-ID: <Z_4DO9uwfi5G7XwF@gpd3>
References: <20250415054642.3878839-1-yangsonghua@lixiang.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415054642.3878839-1-yangsonghua@lixiang.com>
X-ClientProxiedBy: ZR2P278CA0049.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::15) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|IA0PR12MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 06223de8-3615-4692-8b7f-08dd7beabccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VFi9VPZs4sbIq19zUnt33hjBF45dvDenDQjs0IrbiOLeEDmLCXJNrGiEokbT?=
 =?us-ascii?Q?st+XPIaRuraBXu5OA1FbuDemlS1ShruyBJcFrJrl3VysQQOAOKlQhHAD75hb?=
 =?us-ascii?Q?IBpynhXOTBo3/zdnSHqZE9eDvezJX3hq80OTsIYYR96lRkpEbxIs5tD4/m2u?=
 =?us-ascii?Q?EqH7Oo7BBOhkLUqtTVo34lAfpiAlAmO1h//CUBUjIhreL21kNshlV8ewPXPY?=
 =?us-ascii?Q?QNreU4YuVjy3WH62Kx1n+7Pz5KniMmGcOiub55op74+jtybnua2CitloS9tq?=
 =?us-ascii?Q?PFXX7m5nfq0qrZkg9BCMK9S3iW/XtBS/4kOmNx3mLA/602h8gR6H9p/ABXUk?=
 =?us-ascii?Q?fnJygAjq1A53q2B72gRQEG52xWDSxY8rC3QwsTYzRf/D0AHBmOl3orQIJ/yp?=
 =?us-ascii?Q?t5vcR2TIUbYX1gFuZY4wtBYflwCjOC35ECPqQOyR0oXDIpyG8hksrFovu/Tv?=
 =?us-ascii?Q?M8/xC3ikC1YxJGyafYuWLp882DF3eFAy/OaNKXWlYDKp/IdUq41nsNqbLMdY?=
 =?us-ascii?Q?q3byy48+y4a6xKBFGzV2OBr4S4VNZrV2YvA0rMp2WDPy0q92MB3a5Y9prYFs?=
 =?us-ascii?Q?GjCKh6HP3ewcSXB1tU+qeSzxMrDpF37ojdkSTR+vYTCH2tOlHl/VAwUJw67a?=
 =?us-ascii?Q?O7Xv1Duwm9jtWMoK7C26el7BLJTdroLLtRZMbJ5cBELS5OIT63/3B5Fjpnji?=
 =?us-ascii?Q?iRa2RZ4muX8kNzPl4shUnMTkTsburWz3enNupuPBscX32kGxqcgXQca+xEXo?=
 =?us-ascii?Q?DoGnuhLvQvfK6oJL1mruYMZcFjLsnDwtYFQXyUilerz6No6zRGsVEP1Speeb?=
 =?us-ascii?Q?4INok/3/kYzFnrH1JwTFTFTU71eKMgolF5R/xWZERk5Saor37jbEia3sr50l?=
 =?us-ascii?Q?/8AZJsG5a2+5/px8pLIsrIh0X9Jh26LLzykE3W8BjEqmXGZRRaqAR0Fa8qD/?=
 =?us-ascii?Q?kij2PFpa6XZYcVCN0q/+CDvNTFZbKBS1If45wPtey2lIgyB4/Rl0SgAyulBA?=
 =?us-ascii?Q?Tfgbj31RZtiXk0Tc4wcxYPBgO4Sdhz5EvjnYM7YDREhpE/4wWv21trRKebBw?=
 =?us-ascii?Q?OJzaeHpI7uE4+lJ7rsZfckLitWBv49biMmLqTzEsJmBwWeEDwcHaTl1pMmJL?=
 =?us-ascii?Q?Octy6Q91v4TUBk5aUk4fVaSytjLLsLsMAV3PbxVRc6+EDzTdpYfUIkxBLkkK?=
 =?us-ascii?Q?sxo1ISeJAnYBGBdCCJZpV/xRXHjMGvSspz+WHYH2kQ7i0I4TNuLPqKlfT5Vg?=
 =?us-ascii?Q?ErxZwiFEiI80MZLE1+i16DwfQjUmF4zVxGTsvGSU6FJoez+o5aB932WLKFpY?=
 =?us-ascii?Q?5cRI6QVikUYQGI0ZoprH/xOOErux5fKe2LAHczSaK12KekJQ2kPXv23hzkNX?=
 =?us-ascii?Q?evS6ZWBcht9q61kXcXSnUdVzdYlgJXZ+pNj1K6n4rL4lTwhWIqs10fzbQGEl?=
 =?us-ascii?Q?8yb4MrupG+A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tWkfnmAvaLN/inCKSJhB7rqVKij/oJoM65dCgesEOmgnMJjPjks5sc/ValMs?=
 =?us-ascii?Q?KKEqM3OTWP1Sd6ZtEF51HK8GP3IIlk8AlE4cOg13uTjeSjXtWMb2jYzKYpBp?=
 =?us-ascii?Q?4Y9hFHSpspS+eEIjBOsFVYslli/FAIZu6OtD1g3gTTTl8ni67EgJZEzYjjoj?=
 =?us-ascii?Q?gn5hqFTaheqYVI8uzXQV/8MKxs4WmuDT2IcMjGcRIxT59YK8qbb/mCQL/wWO?=
 =?us-ascii?Q?KNtiKlpxXJbQXp9KEtrDQzZkv/naqqgNuu8HUch0roJ3KsBuv0yZAFh8R4eK?=
 =?us-ascii?Q?Jhb0MT+XVMqQ6hDyfqKKwjY6T09jG8BLKY64ZxkhZVqsjK3e339Gq0JT+IKE?=
 =?us-ascii?Q?W9hZiYuNBCj8jipU2yS0yoqgb9MJWv9PzkP2gETWgZke36mjW1GcqJSIspTo?=
 =?us-ascii?Q?RqijrNyCU44qhmKho8CAmsh8YPi+CWIO1DJr64d8VwMsp3Zyf3T+6cPfFe1S?=
 =?us-ascii?Q?Lz3cEdEsEvcpiw1lan9lu7ODOulqPUjN+BOh1D37w3DD478JhiwpaRsJIeeB?=
 =?us-ascii?Q?a9e8kJ5E6OASgP36kchU/651H6l6dAeilhyd31xa8uwjC2uawbnuiDbw9zrK?=
 =?us-ascii?Q?xlIPfiGpFC4pRZa4cAPq6QhRRc3e5WOZ8EiGndI0EwPnyvY/ct7rMPhgDtOE?=
 =?us-ascii?Q?Fcxh9OZBLED2vAAyBZIKlpYhXxtm5Iva7JGOjFUqAWbB/0/ai2TAo/YwfAVj?=
 =?us-ascii?Q?QSDYY08LvYO6TTF3tGLTZQYcXxZjA0EGhkPpmSPG8vyJCFiDJY+mpkJUv5pa?=
 =?us-ascii?Q?QQv8Xl1uxEONsNP1+VFad87y/qGuLBj9vXENRcm2eDRujHkT85wkwxyWOhZD?=
 =?us-ascii?Q?bAxnR3pIYOcZwu/l7sqinwMtjfq8TbRcsgnGfvpR3VgDqKhY8hvrHCf8WfbX?=
 =?us-ascii?Q?18UaDkNXW1h/sr/0Lu51XGTYvfFfa+XmW/dIzNyNwF0bJ94r4zUPPJpfvsrd?=
 =?us-ascii?Q?dl5hVMM+yzAj038/Ph9Xn2QK4I6PQNa1EOSmsA/5Of6beKGlTSNR4oh3/pfR?=
 =?us-ascii?Q?stUhj3DJk0TuDn0mtsi9uA+34oL5Rv2t0MFGGonF6cDsOEjpURfROa7rGmeH?=
 =?us-ascii?Q?gilDYsF7picZa2j9jW4PgAJNdq0hUn/q7A7jChQqCnzevjDHATGsM3QHP2VF?=
 =?us-ascii?Q?76rSW0QQWx0BZdx7NJroxvUpyMSvzDrW4MwlGbc4rWtSlEraewWk6xA4RXZy?=
 =?us-ascii?Q?hSf6x0yrp9tbYiPQKWqIeu58aXypzSIa2oksDousNlOOsp8UVcyoVsjJ8CEu?=
 =?us-ascii?Q?C8Qu8JZmaftlblnBA2j25zmNaLROnDuk6ApCQje5j80qkB/fJ+W92El9BTAh?=
 =?us-ascii?Q?rfy97Jz6kdao72d1lHThhAe+O3ZLRvs7KDe5SmvzIuLJgqgzDbiL75rV489o?=
 =?us-ascii?Q?H5BkKD0Lq3r5M/WpqwStF7d/T3NDEGl7BOsZQPM4nnaTTYUJ147voiJyUaV5?=
 =?us-ascii?Q?jxcCK3wamZTsW/s3SN5cKevGWJ63mYS1iNHtmvasj4a42TeBYqr+o7+RTm5V?=
 =?us-ascii?Q?jQ1Sq3dyR0FmHK5Xhw8tJpr0MpXmpkvdVTFxKGdhRKeFLhMDIwaSsh0WhpK2?=
 =?us-ascii?Q?1R/jIFXUwLVDBIJt1CkWZsPdJpnTDPFIQnNyKUFE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06223de8-3615-4692-8b7f-08dd7beabccd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 06:57:07.7489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 370liQZC/VjVlqdeLKhpGjYorpyMA8TeoG1b1BJjhups3AK2qIfttFv/RTYBKbFVhURjHqipESriFEn7eGB44g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529

On Tue, Apr 15, 2025 at 01:46:42PM +0800, yangsonghua wrote:
...
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

Are we missing ARCH=$(ARCH) here?

Thanks,
-Andrea

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
