Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588471F09A7
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583925; cv=fail; b=TwPa01veVuKERWs4PWSrWUo7bMTIOrPg9ir2X/p4R9eJBglaSpyiGdzIi3lzPKH9PJL2Beb57mfoYPGN9qoVPXQYdlYXwVf43M/+YEiy2+k9spgYmAInblojELnWReBU/X/QU/zIs10eQyFHmKHhO1XZWyZIk3kIn7MvBX1j5EY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583925; c=relaxed/simple;
	bh=mwjjuBvkO9CJcj2fJxLP2NZSCUFfkba0nEP9yzIy9rA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b+0477kxYSD5ek8JAGwq9ylSKrDrK3kxgBuUOZfSTPnLA8X3WEp7O4tRcqwhmWNcprI/7hv2R8OYWerIJYhi/yLIjHuv9F2OZff19lKFCrtNhn1rLwCbTAwEj+7qNktZdXlcpQwAPMOBJHwXMYvt2DJgqNdutMAtAazU/Oaolsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMCnziE0; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMCnziE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748583924; x=1780119924;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mwjjuBvkO9CJcj2fJxLP2NZSCUFfkba0nEP9yzIy9rA=;
  b=OMCnziE04FEOMnImEu0PXpRXfxlz39pNGHbyOS+ihP0lV/QAH7a0rRi2
   5ZTDutc7Cfg6FcksRjqcS8dKYQ+3O1o7QK6ThtBPCBw+6U06oQWq3+VyS
   Ytocj1VCJYpPZWRUQ9TC/+gSj8lBhLgs+FiEnCWlcumpRcUeG2ROWEeMj
   0G95SKmun70s6v1tOEslUcFZs0M28ubktYeCGvucjIAeNhIhPCee9sdQV
   BwPzobYv4kzK+biwRm6VGmQyzV73ppfsS9mZTQQGySZpVxR6V+O00k+lI
   MxNnyT9Z4hPdGiD6fS8ef42FdXZC0DuTjJ181/CG/XBWN2qhWx26miL+f
   w==;
X-CSE-ConnectionGUID: kYTbCNV1T1G2kPexC9sJ/Q==
X-CSE-MsgGUID: IcGutOafTo6b25RRpIVk0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50365421"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="50365421"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 22:45:16 -0700
X-CSE-ConnectionGUID: aKw7MRc2S8ePUztTyRmL/g==
X-CSE-MsgGUID: HAP8qRT7TD+u8bwpDFPJMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="148927580"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 22:45:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 22:45:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 22:45:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.51) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 22:45:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSQv1CTZL4Y7B2dYNzsrTgw2I3B4ZuexFI/JRkBPPj9FlTPp+iwsCARX4r9VVLf1vab5OYXFhMOtljwam69DsYVAEIl+mjC0mOk5GGp1Th+EjVzzNgVXWTW2hIydUiLlfLadf82ErB7Oyhq4Vx69VhG0iqk+SnqrASN9rsBDolwnD2dVIy0vHV/jvxPc0r3228d5p9wAJevjzQLxS9ImP/Gg706UEZFCx3N/zBzQ0M4lq4zEDMKRxXYMTldTLtIg0yKVhfkRw43yZ8pwSog7xw4b0Ekpm/EQ369d7oQ3r/6MrfXzSErwVPlNmnb5R1VqCSWS6iA2Mrub0HAaFdcf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EA786hvPYTSQtpIl6+Yff1IGLrweF3SmOQPuO3amZBc=;
 b=VtMaIghk62mHflIvzAks3MeclxPOn7OC4ZnGxo4IaE0hhmOmNZh7+v2khLTjP+Hiib9OKQTi/9oqwzIu4xWGyfijc8j3zKBpjsPOOc7j8QEPYNnQ+VdTd8LlC+cK5cCt5cBA+Cnzrkek5O7A2dmQ3T4hEbLS1I5xc+ZMhAhSnKwTTog+4p233FySaogwhmmeII5qfncgXLabdHDeo/GTD8X8itrvkNRmS1Gnzld7v8J/nVYBI6Yl9DCPj6/0CpjbpVQkhLGDX5SL7JF51RA365N9dXLOJDjUOo80jc7E+nTGwGMeBkvY6oIbKYiJixxpBWUH3OKavMzEWbxekiVNCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF1A7C623DA.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::816) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 30 May
 2025 05:44:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 05:44:26 +0000
Date: Thu, 29 May 2025 22:45:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <akpm@linux-foundation.org>, <lorenzo.stoakes@oracle.com>,
	<david@redhat.com>, <ziy@nvidia.com>, <joshua.hahnjy@gmail.com>,
	<rakie.kim@sk.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: add myself as reviewer of mm memory policy
Message-ID: <aDlGFTOoKhFzrRY8@lstrano-desk.jf.intel.com>
References: <20250530014917.2946940-1-apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250530014917.2946940-1-apopple@nvidia.com>
X-ClientProxiedBy: MW4PR04CA0105.namprd04.prod.outlook.com
 (2603:10b6:303:83::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF1A7C623DA:EE_
X-MS-Office365-Filtering-Correlation-Id: 927389ab-7842-410b-5df8-08dd9f3d09d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BOUiheYaX4CKTFj7mC8eFWxkhMqJJBW6h1EoLZIA6qDHl0Mv8Hs+89twONzg?=
 =?us-ascii?Q?idK+h5V26GL62tU4bW9NYtIjNHf2JDMT7MVXiAwXth1XZE7d0asIxQlTNTTk?=
 =?us-ascii?Q?oX7GzXBwhUSDonllCs8py+GvdecTMgocOrYME0udOA4m/qY4RgoH2Xk9mKZ4?=
 =?us-ascii?Q?qS1nVoy35h0yz3n1AC0+5m5mMDP660iWsV8WV4F4hyJFK39qdFPNi/PwLs5f?=
 =?us-ascii?Q?lNK9CaL5EVcDL+cqihxE4MLbWG+ljJjU4wzLifgPLOfY6wKvyJ9BRzGIakwH?=
 =?us-ascii?Q?5uW9Uyc+1HCw6UYUGgcsAzMYnqBiWRHpir2W6gWoNhcNMlIjk6dbRKJL25DN?=
 =?us-ascii?Q?Mv+Gl/+kusvlp3L+riXakaJ6U2BlPToalYy/fV20jFQhjcx4rmqpS94rUXAw?=
 =?us-ascii?Q?vkTyFl/+HhZbAVYxewiDxADk4bOfGnghffw+5eRbFUUqzwmZF4HLCxb605sP?=
 =?us-ascii?Q?8dKRyRLigPMcvTGcMcjkNuqwRUWUX5LjXPlt+Tpa4LRmoy14a6HvoxQXECAp?=
 =?us-ascii?Q?9Y7kvWdESpWBGTySx2aDtQTgfHhpOKfiSMUNxn0Y51sOUWlwyuj+4KulrDqb?=
 =?us-ascii?Q?3WA3sOvJOgx3A5LqLDbee/dmiJyL6qiWFPP44CzfOhn7YQCoHEzYf7RrS9Ek?=
 =?us-ascii?Q?Im6ol3KMLmwQH9xpWNwixFkej2ZynXFunfrejYXWy/qYFE99DhOJm4EhBwvX?=
 =?us-ascii?Q?XllHlVvPKYzla+sjKWBmWOJ/K/DPzjtACfeOj4nx+yUy3S+vfkwON7tjLLL2?=
 =?us-ascii?Q?UwtmhM4itSFrcz8zfb9GSm8bB7Hgm1Z6/i6nGwOMFSl1ExBC+UsXJ7L8JNII?=
 =?us-ascii?Q?Sx8x55380UAmGc7cYHVurNuw0758F281DN3Stbnc2qtOId/7GomOYlcWEky+?=
 =?us-ascii?Q?4eO9yER+55zK3z87QbKJ6g5m2HlQOkKDJRyb61E8lwBrk326S2CXjG9/zpO6?=
 =?us-ascii?Q?8MBXcOReKhl5ihc7aMoTsMXpyHb6LaExttm04LMjiCzhmwn18uMNhce2FNuY?=
 =?us-ascii?Q?IMNU1VDJDuIk87JDyR+BC+b3r4EPbqtLOrHDcyHcl7ds/01O9UGiclSqPJl1?=
 =?us-ascii?Q?a2EmgWHGw1b67BM98QqmQDGOzuwvRc6/E5y5LbEDvLGEO3YFV4kKhZVSVGYG?=
 =?us-ascii?Q?AMjGG+jkVLXwsT8fltOTJ+1GpmEoKOHzp/eAgJthbqPFW78qe4TmbONsw5Mk?=
 =?us-ascii?Q?4hkRg72f7gtyYkUgA5f9zpRwu1Wo25qzLSgOJVfWHPjHOpXuqtHYpdry0xtT?=
 =?us-ascii?Q?LiBFSfQeKKnGQm3kJN3v6cgSd4UydFlRCUUCWh/6jAQXVCeFgGcPIfxjV1QX?=
 =?us-ascii?Q?Ps8ScBbIsA9V7ly1amd0ut4ycy+BlF+3+f1DLJD3z/igdEYBcBvIIbsL3PQz?=
 =?us-ascii?Q?HUfaGqs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mxXMv66P7hKqFKLGq7WM4SmlRu4nuZUoXxrAeN3TuHvU+mK9mQgGHUPfBNua?=
 =?us-ascii?Q?kpQNWvH78rEdYcXoPrv3cGRjvVT3XSZLnRJZwxhvJQ68p2507HvGAuu4h00Q?=
 =?us-ascii?Q?rNEnEOuW0lyLBLo54TkxLFRnVwcb2Af2N0oVYuoeqozY0n/9L8bAFtmqBg0s?=
 =?us-ascii?Q?Sm4AL6bmq54+GptZgXeclyt77F05YRM1VkNdZJrtAh9sH0ejqkbb1MKWrnkK?=
 =?us-ascii?Q?FJEzaOFzpjbYiPpAYOmjaSIGYMTN8WPxtZE73sOjwRgQgaze02DQyvQ0dyqx?=
 =?us-ascii?Q?P5Hn8WaHN7B39gHEM0VYX7drbdLN0u6pnCG+U4H9DiKQRIvbKtcJ2nzoZ88M?=
 =?us-ascii?Q?dMlsCoyfPdIIRnl5Z5D2A0zn2d5nK4S/b7ZUHi2o1Ci/oSipmOtjD+hC8hHX?=
 =?us-ascii?Q?0n2tkCxnoSP6qfT513omIz0rg/3oLHzdtoaIfr39QKj6uOzAF3Y7hA9s0SMi?=
 =?us-ascii?Q?ZgSxW3qMFlKpAQ4KGs2QzW2cDUpu2F6UxN5r/Y235gKUZbZ8Jo/JYC9tq57P?=
 =?us-ascii?Q?twQ0+E6CEaoVI+YyftmNPDPTRr2C119u5MqVD4N3jwSwecCjhQAKKOVcUbW/?=
 =?us-ascii?Q?ZPFBc/q4+vj4lHkSIPRe/ecy6aUDyJ3kzcwr7maVYclVlguuHxdcvkQkkiqW?=
 =?us-ascii?Q?QT2ISoHArulq2EYj0pAQlj/MnfGxskVCPNS1rXUSI2VenI5ImqQM1QHp74Vk?=
 =?us-ascii?Q?D6vN70AG1zLTKIJaukMHCV9WfjjU8AE/P2pyMtEXpwpAC1DWOgQ7LrV4J0Wm?=
 =?us-ascii?Q?aG6dyWgP6rC2ICrRul2WRF34ILTbYqdaxe6RBV3kFz29/m3GJPnYkpdMJ8SJ?=
 =?us-ascii?Q?Z4r+FPWj+e4D8ChPPdptHHD0OkfT9fv2rznGI8vvStBRNYYgYeKAopnAzX7Z?=
 =?us-ascii?Q?kyQXg2B7ceWQpleya6wx8V0QNHQLCHXY6BNCanzpY4hHHgG+3/FXegNAHZmG?=
 =?us-ascii?Q?/Q9TThDNFLDIDhv4Vj6Gew7cEFT06UnpktEqRzRD5/yDA1zWn2DeO4czucZv?=
 =?us-ascii?Q?1s3Bxe1rIz/0odktqTqXQVB6XL6jh/5phjeLpetdpTjbAb3cpS/YJrF/7Lxr?=
 =?us-ascii?Q?zveKEXCMcg1vJSKeT+mqMxhDqByqOlL6QhIFPNVOm2yPySxJTOf4fQKMXZDC?=
 =?us-ascii?Q?dFIA5zivJqBuwpSdMV2bUZpxzNtu/r8MyP7bkqWHWIk8a4ptfT9XSLd39Opf?=
 =?us-ascii?Q?3pL/dK/vEXEv62DIkTB8vuNBP6ZJ115AREnQbtzStbffTk+2J1Dha9oFnrGF?=
 =?us-ascii?Q?yb+XA/QLFHj0JvL1dg2AOLQ35gzKO+ecNJWExthI3c7/WyliHjklU8NR5umf?=
 =?us-ascii?Q?iyjDWkNFqfP3gGENFldOMNwLTpu33hW7j5nDUyas2SD3TqC22pPmduHWjnVL?=
 =?us-ascii?Q?b9ZI9UMg/UC1bm9voHtDYurCjt/reLhAy1GX6RXShzWLKAap39zcDIJXTg7e?=
 =?us-ascii?Q?+Q/+YsvfuV8pYplwFbtYlZVDEHzA35eE6MsKVK+X4CtvM0zxIlWCxOyLPfB3?=
 =?us-ascii?Q?63S8qldcnIPwAC4aNdty/f/tp+e8Zv5zwVE4PddGMzDmm78QTlnxb8sIkzlO?=
 =?us-ascii?Q?fXZ/XrpMQCfSmiiumejAGpALgl2qd0MmfnbVg6Nmh3J+kVZcaP2mznR8yD5Q?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 927389ab-7842-410b-5df8-08dd9f3d09d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 05:44:26.3991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiimZKhQoAk/Ra+F15Xi7ZwAACUq7Uo0iv60D6PMCIt5vnb97sIc/c0W23mp9TpQdJyc3jRCATbKnCY9PvhFeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1A7C623DA
X-OriginatorOrg: intel.com

On Fri, May 30, 2025 at 11:49:17AM +1000, Alistair Popple wrote:
> I'm particularly familiar with mm/migrate.c and especially
> mm/migrate_device.c so add myself to MAINTAINERS.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Acked-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8f1125f68da..219f887f810e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15713,6 +15713,7 @@ R:	Rakie Kim <rakie.kim@sk.com>
>  R:	Byungchul Park <byungchul@sk.com>
>  R:	Gregory Price <gourry@gourry.net>
>  R:	Ying Huang <ying.huang@linux.alibaba.com>
> +R:	Alistair Popple <apopple@nvidia.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
> -- 
> 2.47.2
> 
