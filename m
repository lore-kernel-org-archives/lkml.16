Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660192DCBF2;
	Fri, 23 May 2025 04:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747975766; cv=fail; b=tEAHZaDo/fDU9cWPpW7iIc40p7Of6hgzT4IUFfGUHgNXhbD3MJsNSDNnbbdOXoZgP6NFfsEhv9PrvunYRX90kQHoHHCZbSihumWSd5yZJU+Zo4GVn8WPrwzG/dVMGAVXfUTlKEVfwzhXVtVVTOkNThH265CccyohFD5ZrnsFcBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747975766; c=relaxed/simple;
	bh=YtuKIByg+wYpJjKFSVi4M9+w0aX9FZNYa48BO/6Lz5k=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kYces6lbBdSfZxUugTiRcX5xophIHhB42nusWhMq/2S3JUjhneMox6jx/IRgZkSe5wvwrdcmzMKacXmZCgphxq22t2Z8TBz43jbt6773r4l3xnKBbZQXfWEI/tuFprC5u6F4d8rE9bT7HLKiDNoDANS75qpSQuqOeYC0s+aMYts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQlVqTyx; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQlVqTyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747975764; x=1779511764;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YtuKIByg+wYpJjKFSVi4M9+w0aX9FZNYa48BO/6Lz5k=;
  b=iQlVqTyxxWL16e4Bk1iouiuSJCBLZbayAtxJHiJ4ZpKSl+HHGOoK8SYr
   TmELTpvIBj+VdXm5IyGPqz8MTTLlY7GJ1ZVXpb2ypxt/xJ4hLeSn1nCEP
   59QbqrVgDa7slTmPh+hEC6B4wQkVw9slIEl8TNvrzbMzt779TF2LO4Hut
   fqb9qlp7lxjaosBQWvVDgCfUa/6gGZWsO2/2Nf7zTFrfO7DnYBnaneV+W
   L6sD9zbYdASh+ZoIbtGB7DirAdcYmQIHdNUIw6OXay/1O4AbLYm56+dMI
   KXOx/Q2ifVF1bc+lPTG4IFiU0pNifsBM/fYy+5j7NeFkvW3euilLSg8/e
   w==;
X-CSE-ConnectionGUID: V5nLTkuZQayolQlasY+7CQ==
X-CSE-MsgGUID: MvD+pwrrTX6D0JAZKJHVvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61377374"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="61377374"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 21:49:24 -0700
X-CSE-ConnectionGUID: zaAWOEfBR7mhMkzC0SAGyA==
X-CSE-MsgGUID: MFayXBT7Taaw9Wqfu6aHcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="145788186"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 21:49:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 21:49:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 21:49:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.51) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 21:49:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVEt/qKSw/38YDjItQ/JjdOWOJanX/1GJ9GPqmwYZLVu2VyvbQn4SM7xiW0PVL2r/AnWdDoBiAYIlK3aRYtwn/j/UZRX+gEFqS3ftOR3Tq7ATfOYmW1sHImMPY9TVDFWnNw4FSVlf5LeC5ko1Yc/XbLR/1FEvzNffrPx9n99mtCZ4OjK3utU8xVcmmWXGvL82zApwZ3mZCf5+tWTS4EoerhWvIVv+n4kYIOmvHSag1Up+YDwofoeB8U7ug1nfrZeDhHJjcNdFebHDntyTG8GjY+Jbc39RmYoHYljeuTh+5THtwfecLNjScin+ligFZhk4Px5rMsXz78Cwd+/hnHTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAkR92VIUEHm6YO7/afeLGE/ZW6WBH1jUlSqsy81Ykc=;
 b=D4tytg4sDd/I4ZGVD1OG4OXPJdsurfy7dgMRc7daoJ5N7qbk0uSUa4PKvszBeopOOGpIyCjgpAdtgQZUu8Eg5gg/j0khD85vG+AvLALVv8MXOwoTk9URkZxxJefV6NKSZmklIhBHY0cAQrKDWrEI2SBgTxcvmBhRRgCZVlLXv0r4ynl1cRmNnpgTVoDUfAr7dcDlmhZ+G1G8764fMXYTOK8ELcrx1s5RcQdXv/TBAkTkaDPkE76g/APR41Z4oLj3kgMFBFmIzHfiISAhFDPqcgohaUdKBPoeTseeOUP1w6O51wNc7ck/z82YxXrPGt1WwIdHBahppXTMcbzclLaoeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB5915.namprd11.prod.outlook.com (2603:10b6:510:13c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 04:48:47 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 04:48:47 +0000
Message-ID: <1395b692-cc65-4d84-a68e-f9b20c37f74a@intel.com>
Date: Thu, 22 May 2025 21:48:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 21/27] x86/resctrl: Introduce mbm_assign_on_mkdir to
 configure assignments
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <ec8d3053a63980fb7fd2b4fc8bba0a1cfa8a69e6.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <ec8d3053a63980fb7fd2b4fc8bba0a1cfa8a69e6.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::49) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: a67a90e7-d3d0-4589-3b31-08dd99b51abe
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0Q3bGROeDNrbkx0Y09rTElzRWl5YlY3UTdzQmpzM0s0cm11VTFRTlA2Skt5?=
 =?utf-8?B?TEpaVHN1ZGlwY0Z3MEd6Q29BdkhDclFFelkrQ1EzNVZaWDZROW14YUNIMVd1?=
 =?utf-8?B?RlZON2hHcm52QzZBRnVrc0hCRWZ1amVlNGR0QzQzWjJvRy8rQkIrYUFyaUNK?=
 =?utf-8?B?bGIvUDFGRkMwSGszVkdDa0NiQUJqeTFuMFJjU2R3N2pXeE85azVlbVNtemZM?=
 =?utf-8?B?UWFpclpQcnBwek1Oa05wRnN6ZHkrSGoxeTlJZWJpQmtnck4rZDQ4S05kTy96?=
 =?utf-8?B?aDJmcyt4cjNYZEo3VGhGZ3ZVV2J4dGtOaHNRaHFJMUg1RTRGTm1zTE9CLzRC?=
 =?utf-8?B?OTE3akIwcUg2U1BVbmMrRnZzaldxSzVleXM5ZEN3YkpVQnBFZUhZRm1ONG4y?=
 =?utf-8?B?ZUtWY0YzTVFic3Q3NG8wVUt5WUx4aVB3YStCRXdGTG9pM2REZFNxREp2bEZX?=
 =?utf-8?B?MzhMaGZLZ2t3VjZLZ3hENEFtQXVZOHlzQTF5L2d5OG5iRVhmMzcxZW90aU5t?=
 =?utf-8?B?Tlo4WEpTTDZnYmcvNFR0U2ErOVZkQjNpNVhlZVI2c3ZiV0RaMHNQYWp0UTkv?=
 =?utf-8?B?a2JKOUNTSGtIaXBTNWFWbDhPanlCRFNrQjlwc3p5bU0rSk5pSXYwUy9ka1Vr?=
 =?utf-8?B?eG5XRnVTVUtoMzdDY3lVQjNGNGFveUdJUTNSZ3R1RkNCTGN4ajI2Zy80WXFX?=
 =?utf-8?B?V2E2TXJmUjNnMDdXNTVtcFVEWjd0VFRudGd0ckZRU2FKVmR5U0Q4SEdud0Rh?=
 =?utf-8?B?QWk1NmZONW4zQjRYWGJPOVpHRzB4dlF0aTlLOHV3a0p1cHFBRFA3V0hsZXJF?=
 =?utf-8?B?NExiVUVucmNMZGh4NkxTYkJrczZQNFZabkc0MVBCVFhQWWNGNjZVMFI2cDd3?=
 =?utf-8?B?aVJZRWxoaEN0SktpV0YwYlNWRlludGpmeFVjRHJFQnVSNnhDTG9xOTRrMVk1?=
 =?utf-8?B?UzR6Ty9sNWN4VGh6ZlZqc2p3Yjc5VzNTNmxLZE9NQzNoUk9ndm5tMjFGWWlY?=
 =?utf-8?B?Qjd2a2ZyMm9xeXdLT3JRZmdGc3lYdjNhU1VsbGVFWkN0QkFqK0I3Tnk5b0t0?=
 =?utf-8?B?Wm4zU2Z3MWVQMDFWbXdVU2NMSkFJejJuUjR3UmFKekNKb2RoQVU5VWJPVkow?=
 =?utf-8?B?TkZsRk9qdnRLMElUbXhPeVVkclI3Ui9YRU5wWnY5ZkVac1R2bU1leGdRTEJJ?=
 =?utf-8?B?eWpNbkpqcmx6ZFpQam1KZVYrTk1zelNPUmdhNHVLOWU5bndZWjdLdzBPNk9n?=
 =?utf-8?B?UTJ4VzNQL0hnYUpYL1NjZWZSbEZvczIrcjZjb0o3bytFK00vbFhZR2FqNG5l?=
 =?utf-8?B?cjJoWnZZOHo0NWxIM2xJK2ZCTUZpTm9WQjRHaXkyOHM5L3ZFeEo1M0NrMklo?=
 =?utf-8?B?TEVIME1HekVMZnBzUnlkOUV4djNEYWNaRTVaUVVTamFSYlpUV1JORzdMSEZU?=
 =?utf-8?B?QmhqYnR0TWVCMXlCdG80ZGx6Wk85dWxwUXg0cXZDUFlOYmZSNTZqb3lMNzIy?=
 =?utf-8?B?cktNdnNKWnFSdkdqTFVtcEhoSmkyK0tkOStKaXN6Y3JmSXpMYklXZ1UxYStU?=
 =?utf-8?B?QW5hdFVqbUlnVEhzN3liNHlBNzExbGp1K1lkaEtJRjNiZG1KMTJLS0VYOXNt?=
 =?utf-8?B?c1N6NW1RcEMxTVBVYnJLRW5nKy80Vm1zUWVsUEZVUTVmdlB2d0NZRVJiMjVh?=
 =?utf-8?B?akoxazc1Q3hTZlRoYmplMzY3cVRiK3lkaitIdWdLVXpOdTk2V3pVcktFeml6?=
 =?utf-8?B?M1NlT3N4bjlqM1Z1WXUyK3pPbDRxWmg1Rk50VjJKMDZITTFUUlhiWWo1WE9K?=
 =?utf-8?Q?naaeQYzHWIXf7tUUOvI2XvHE4LyI3YFH2tDGo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmVkVTZHNmNDQXFpZFZlVTVWL2JuS2twTmV1THNWbUFrRktwUVlMME15QWtP?=
 =?utf-8?B?THpYRForZStUUzZDQTVhT2Y4dy95TWpiVHhDVFpIVktocHh4NWZZcUlyUVNG?=
 =?utf-8?B?SExSdWVlQUhXNkNMSC8rWXgvT0M4a2VHcndkS2pZaEJZTnlaK1lXRkRvbnFy?=
 =?utf-8?B?TE5kb2xwWkt5NVdrWXZvT2pjdHZlZXVtSFRaRkVtSWVTanp6Y3IxY0d5ZS9o?=
 =?utf-8?B?dkNsbmlpQzlCWmppVEJOSXdoTlg3WUsvUXhnd2RLcWdtdkZzSTlUbGZENmQ0?=
 =?utf-8?B?MUlPUGRaS3JBc3JpZ2c4ZXFhL2JVU0JHTytSRFdSbjM5STRjcm8vcU9leXdl?=
 =?utf-8?B?M1V1dDc3RHZpSlB2dnQxQUljRVdCNmFjS0YrdFdqK2FCQnpxdXJRSG9LMFo1?=
 =?utf-8?B?NW5pcTJSaGRsOWZWOENqQXpYL3ZPaEprOENCNVpSeG9LaGlVNlBsNDk0NkhM?=
 =?utf-8?B?QVVwVzlUMWJYNFRITDdaQWphQ3NkZi9mWXhZSE1OZjhkTzVvSEQyNHV2czQx?=
 =?utf-8?B?VDlEaVB1REs3NUpYTy8rL1ZmK25acXdOTDVMelpUZGUyaVJpSWp4cGJRRnBV?=
 =?utf-8?B?Mlg0VW9BazQ2ZWZiVGJjZmtmWFFVU0VxU3d0cXdqWGI4ZnZQcG02T0FyRHBZ?=
 =?utf-8?B?dUJvSDgzOFdrY1J1cjZTU3Z4TXI4OENUb2JQaEtGcHRrbzFZWU10VWZ5Rldk?=
 =?utf-8?B?NDRTTHFGMzhDY2xXWk9La2Izak9ldUI2THZRaGFvUHptYmNTTDFlN3JabHdM?=
 =?utf-8?B?Zmpld0dGaFZsOWdhVlh0LzRnUlM2VmExRW9QQWNlVGZmbW5TVFFTRVJaT1Q1?=
 =?utf-8?B?S3NhRUNFZ3dESHd5Y25ZYUZqUjhaZ05IWjJlQjV0d2JCUEFYUjc0UmsvU0Rz?=
 =?utf-8?B?VUwwRWlzQU05UndtSS9qaE5GOU9oeHZOS2s1bGxsamRWazJPY2RMMzdMWnZ3?=
 =?utf-8?B?bTE4SXJMK3BVWjRXWEw1L3dpY0wydDR2VEVUb2E4dUpnMXJyazVjRVlzdmta?=
 =?utf-8?B?WCtwUVZKUmkvTWxRK25USEVnTkRyTUJSNUJyVVdHZlJialIyaGZ4ODJkV1h2?=
 =?utf-8?B?QW1Tdk03eDM2SHBUOGluL0lmMjRaanI2dzRXZFIyWlhNWng5VTlIWUZEVVpY?=
 =?utf-8?B?bGhYaVJsZm5taVpsN2M1K3J2Q1MzNlNCQnVJRlBiY1RqT2pjS2d0NmRYSlVP?=
 =?utf-8?B?TmowcE1vQSs3eFZKNm54ZzRDWk5hOXNHSFExU0NqQktmN0NuSmpqSnIrc1Zv?=
 =?utf-8?B?a3lEZHZGUUF1bGtxcUhkTG40NlNWSjcvK1p6S1lDWmNHcUttQnJUV0FRR2tt?=
 =?utf-8?B?WVdxWHRXd3AwSGhRK3BjaC9TQXdZdTd2OTVNZHdPcS9UWk5IUTVjTC8vT1p6?=
 =?utf-8?B?azcxWEI1RVZPM3lSRmkwb0VxYjVyWjduZU81eFRKbUgwV1NIVHp4UytaWmlk?=
 =?utf-8?B?amlSV1BsbElEdnZzYSs1Skxsb0xvQXpNbmFOSlgzZjlDcWNlMVpWY2t3UVFi?=
 =?utf-8?B?T2swVDBoM1FWcHFUcFJNZlZzL25MS0xxMktXR1RiZW5HcURNbWxDc3h2VG9n?=
 =?utf-8?B?OXBMcEx5UlN0dGltYjJUL09TaGp6ZWtxWE1GRElzakVUaUNaS29CdFVEREVo?=
 =?utf-8?B?TVl1b1BBVVBZa2VVcHg3ajVqb1lHR2MzQ2xTV0o0a2pXMmdjV1lIeTEwWks4?=
 =?utf-8?B?QUZxSUp5RXlrWVVycmNoMTVRRjFzYTVjcEc5c0dlSTJ6MnphMGFmZUZRSE41?=
 =?utf-8?B?bkhDK1oySW1LZ3RSWkxkSmxiWlJlTStoMHVIRlhEaGVZZlJmMDVkbm1nZ2VH?=
 =?utf-8?B?NFRxVmYyQThPUkgxTTV6Q2kwZUNLcW03cWx2VGIyazZpNExXM0l5M1NMK2RQ?=
 =?utf-8?B?OW56RkdmcHhCSTlXMmh2cmt3MU5veGF5bkp5Ti80RDR1Rmd2Ym1JcGxXS1Bp?=
 =?utf-8?B?OS9RbDdYSTJRc09yc1M2VEhXbHhJSUpKUU9VR25HdDQxV0w1QWhRN0xDTW9L?=
 =?utf-8?B?WG1zbzJVWUdyNzBVd0pGeU9ZeGFoQ1BrUjlyWmNpRTdrdmU4Y2lpMlNUVXVQ?=
 =?utf-8?B?VFZZYnBqSjlRZ3dJNTdjZG5zY3A3bzdnS01TckhxanQySE9YZi9qMXhjckRv?=
 =?utf-8?B?amlmeDh4UEF6ZkNaUWE1aDF3MDVKU3FRM1NnTXJrMmlLQ2VXYjVyYzdFeExy?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a67a90e7-d3d0-4589-3b31-08dd99b51abe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 04:48:47.4576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7usGI/87obupARb+ZfKkfROd2/PAnqpoL0ftlRqTUoQ6pdS2ow6bIPPbAu6Vho+92ZzphKicNChYEsraoAmJFD+ZxIXm6jSB0sbNNFz23R8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5915
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:52 PM, Babu Moger wrote:
> The mbm_cntr_assign mode provides an option to the user to assign a
> counter to an RMID, event pair and monitor the bandwidth as long as
> the counter is assigned.
> 
> Introduce a configuration option to automatically assign counter IDs

"assign counter IDs" -> "assign counter IDs to <what?>"

> when a resctrl group is created, provided the counters are available.
> By default, this option is enabled at boot.
> 
> Suggested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v13: Added Suggested-by tag.
>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>      The rdtgroup.c/monitor.c file has now been split between the FS and ARCH directories.
> 
> v12: New patch. Added after the discussion on the list.
>      https://lore.kernel.org/lkml/CALPaoCh8siZKjL_3yvOYGL4cF_n_38KpUFgHVGbQ86nD+Q2_SA@mail.gmail.com/
> ---
>  Documentation/filesystems/resctrl.rst | 10 ++++++
>  fs/resctrl/monitor.c                  |  2 ++
>  fs/resctrl/rdtgroup.c                 | 44 +++++++++++++++++++++++++--
>  include/linux/resctrl.h               |  2 ++
>  4 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 9923276826db..356f1f918a86 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -348,6 +348,16 @@ with the following files:
>  	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>  	   local_reads, local_non_temporal_writes
>  
> +"mbm_assign_on_mkdir":
> +	Automatically assign the monitoring counters on resctrl group creation

assign the monitoring counters to what?

> +	if the counters are available. It is enabled by default on boot and users
> +	can disable by writing to the interface.
> +	::
> +
> +	  # echo 0 > /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_on_mkdir
> +	  0

Please be explicit in docs what possible values are and what they mean.

> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 1f72249a5c93..5f6c4b662f3b 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -933,6 +933,8 @@ int resctrl_mon_resource_init(void)
>  		resctrl_file_fflags_init("available_mbm_cntrs",
>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>  		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
> +		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
> +					 RFTYPE_RES_CACHE);
>  	}
>  
>  	return 0;
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 8c498b41be5d..0093b323d858 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2035,8 +2035,8 @@ static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
>  	}
>  
>  	ret = resctrl_process_configs(buf, &evt_cfg);
> -	if (!ret && mevt->evt_val != evt_cfg) {
> -		mevt->evt_val = evt_cfg;
> +	if (!ret && mevt->evt_cfg != evt_cfg) {
> +		mevt->evt_cfg = evt_cfg;
>  		resctrl_update_assign(r, mevt->evtid, evt_cfg);
>  	}
>  

Needs to be squashed.

> @@ -2047,6 +2047,39 @@ static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
>  	return ret ?: nbytes;
>  }
>  
> +static int resctrl_mbm_assign_on_mkdir_show(struct kernfs_open_file *of,
> +					    struct seq_file *s, void *v)
> +{
> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
> +
> +	seq_printf(s, "%u\n", r->mon.mbm_assign_on_mkdir);
> +
> +	return 0;
> +}
> +
> +static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
> +						 char *buf, size_t nbytes, loff_t off)
> +{
> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
> +	bool value;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &value);
> +	if (ret)
> +		return ret;
> +
> +	cpus_read_lock();

not traversing the domain list so hotplug lock not needed.

> +	mutex_lock(&rdtgroup_mutex);

rdtgroup_mutex seems only needed because the message buffer is cleared below, and this is why it
is not required in the show()?

> +	rdt_last_cmd_clear();
> +
> +	r->mon.mbm_assign_on_mkdir = value;
> +
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +
> +	return ret ?: nbytes;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -2056,6 +2089,13 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= rdt_last_cmd_status_show,
>  		.fflags		= RFTYPE_TOP_INFO,
>  	},
> +	{
> +		.name		= "mbm_assign_on_mkdir",
> +		.mode		= 0644,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= resctrl_mbm_assign_on_mkdir_show,
> +		.write		= resctrl_mbm_assign_on_mkdir_write,
> +	},
>  	{
>  		.name		= "num_closids",
>  		.mode		= 0444,
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index cd24d1577e0a..d6435abdde7b 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -278,6 +278,7 @@ enum resctrl_schema_fmt {
>   *			monitoring events can be configured.
>   * @num_mbm_cntrs:	Number of assignable monitoring counters
>   * @mbm_cntr_assignable:Is system capable of supporting monitor assignment?
> + * @mbm_assign_on_mkdir:Auto enable monitor assignment on mkdir?

How is "monitor assignment" different from "counter assignment"?

>   * @evt_list:		List of monitoring events
>   */
>  struct resctrl_mon {
> @@ -285,6 +286,7 @@ struct resctrl_mon {
>  	unsigned int		mbm_cfg_mask;
>  	int			num_mbm_cntrs;
>  	bool			mbm_cntr_assignable;
> +	bool			mbm_assign_on_mkdir;
>  	struct list_head	evt_list;
>  };
>  

Reinette
