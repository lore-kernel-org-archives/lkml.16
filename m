Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420DB3D3B8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837719; cv=fail; b=JU/CDcgPwedLBw5d64mSwdu9ObTDqDxPfLJIOgSR7iHxR9OIl5dBcSZLkF62pfuBoovk6FvLsslvYrziYX/dvUqxhioIg9b7tiUUXmqYcGIqkegWBQt3Y/AIYnvOkXwy6M2LNx7mDlkksJYPnJ9DoKoHznZIJYbFaeksq0+f3ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837719; c=relaxed/simple;
	bh=upfTKcQiu9qurwyRsY1lJ21CWv7bp5aVibXjxwOQ0ww=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TQ5Acm0ZDbnO9SptF7VWgGC/8ysVGMM5uwTSDVYtJdrxsTi+NM3xLMkB9jpRm+oD8weyOBJRyXEz0/C3ZtjutlA0Tn0vng8XRMQkkQdrxDD0Ax2laJpjK/oLeqJmSAHrcrAu3cWM461RMxKpBSHWgPaAletAHPZUnh8baP4AIhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2A3l8We; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2A3l8We"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749837717; x=1781373717;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=upfTKcQiu9qurwyRsY1lJ21CWv7bp5aVibXjxwOQ0ww=;
  b=Q2A3l8Wey5h7MS3rzt+/p3JSvwbbq1Omh3B4sYHx8QArJBUaA0r6UQKA
   1gB4yO4rp+1jt0Pzdr5XJG+9MaEQbHobvycQX1kA1QEjg6B/JSrKPzukg
   lKdaIt+7VVAf0lUDSMl/2gtx94wo72DynFZyvxsGBSpgf10gfGtYXslJd
   OnBxNcbDia6EZhitiV4L+oJXGEalFwq97ICISl2mFpH5VNmc3jhp5H/Jb
   7+WjPasJygX93kzIuuwsESEYqJjent9V9orHI3RUmvwPo3ypKOHDTsAj7
   NFK+0/rn8/zg1/hJ5IPGHhkGxpnuEPT2YKAR5mfQLIXtn9rqODZ2KbIhM
   g==;
X-CSE-ConnectionGUID: 1KWlyfYITyedSiaCXqJ+rQ==
X-CSE-MsgGUID: pKVlllYWScaNF5/B3EIwag==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51779266"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="51779266"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 11:01:56 -0700
X-CSE-ConnectionGUID: FR4Q5QL6R7WYj8V6bIOXBg==
X-CSE-MsgGUID: QbpvfxxtTtOFt5yGnQS3uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148781034"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 11:01:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 11:01:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 11:01:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 11:01:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwkILFEPOUcFzyjabdTbDAbTXJpKkXD6NPOWZJ2HUUVXz0PWsyl6UlA4NBosb/21p/4XkOTfvdcrRiNOJXajmLmTewxIYlihg+E2lWHdzuIeRS4hQmwc6KoxFD4sD6gC+uNFbg4PVe8l0tDdl+cXbf6EPuV62nd/yMZmyQCn4CpIMEu/VsSiCLnRkZh4rQZK0tleO8Lj7noWgyZOlPwGecdBcaxbdO3CS2i1/gFuUSM7f25h2j5GSh6TVds8RoudnQYmqH24UPj8m60aaxQVdJlkuI1A9k08zlgiD//eysabrMYqyc2EENQD0ozggHfRq0zimHD1cGPU1/F6yRTDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qQ+ZTxqygaqxVMHerZLr8or01RhsN4jXd0n9PjAEHo=;
 b=Uf6cN46Mtl+/pMOIPGZWp1v9QfYhvPYCvNJxJJobZXyEvAB+XzkjI7/ev4fc74M1PXbpNyjWCGDGifEWuLMT1fj4anUttNBkiNEo8gupFUa0YOAXxUzPHLTVRZToU+3F5VPNAempflgbiWrMb9j+88ymesWyRgFa7RrAiVnKs8g3GQ+9lFZH7e3oGh3aS6/ehbFDP9Z99RrlNV/qjNRIxcKdyAmnK+7/P4K1zJ0+yJEzgko0xGTLRhrJSWYy69YE8bHnPW3o+fkQuIrH1FQRWPmqKtiH8gj+6sBJHms4bfV0RlDzIj9oxGbykTnSCddYVhCbK0AKAoaL9jFHiyDh8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 18:01:34 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Fri, 13 Jun 2025
 18:01:34 +0000
Message-ID: <d24b79d3-9a15-4b64-91d0-dfddaa6f5e42@intel.com>
Date: Fri, 13 Jun 2025 11:01:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/resctrl: Optimize code in rdt_get_tree()
To: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: James Morse <james.morse@arm.com>, Yury Norov <yury.norov@gmail.com>,
	"Dave Martin" <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, Babu Moger <Babu.Moger@amd.com>, Borislav Petkov
	<bp@alien8.de>, <shameerali.kolothum.thodi@huawei.com>,
	<bobo.shaobowang@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>, Koba Ko
	<kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Xin Hao
	<xhao@linux.alibaba.com>, <baolin.wang@linux.alibaba.com>,
	<lcherian@marvell.com>, <amitsinght@marvell.com>, Ingo Molnar
	<mingo@redhat.com>, David Hildenbrand <david@redhat.com>, H Peter Anvin
	<hpa@zytor.com>, Rex Nie <rex.nie@jaguarmicro.com>, Jamie Iles
	<quic_jiles@quicinc.com>, <dfustini@baylibre.com>, Thomas Gleixner
	<tglx@linutronix.de>
References: <20250613073733.3642679-1-tan.shaopeng@jp.fujitsu.com>
 <20250613073733.3642679-2-tan.shaopeng@jp.fujitsu.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250613073733.3642679-2-tan.shaopeng@jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::24) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: b652237e-45ac-41eb-d7e5-08ddaaa4554b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTF0Q252T2dhWk45ZkR6cFpvZVdWakVySE1EK2lZSTR0SUxOVGxOcDFPUmZZ?=
 =?utf-8?B?LzFBendMSWR2S1JFTTlZcmJDVHZKR0NMd210T3hmWndwZUVoUGxJY0g2dWxR?=
 =?utf-8?B?cW5GbmZxcFFSSGFwMDNtVFpta0oxc3k3MVIxL1JxSWlDZDRkMW0xbUJuNm5C?=
 =?utf-8?B?R1FjVzhJTkZ2alFRQmo5OE9UV3NTZjlRdndZZEp4dHhmQnB5SlpZZmtkUGd4?=
 =?utf-8?B?eGQxVGhIVkg0ZzhyQ1FMcWMvSmt3bHQwT1ZtN1Rzd0RGdktGcEV2YS90RmMv?=
 =?utf-8?B?WTRNYWRKT3JUelgvdDZQaHdzOStndVArT1VCL1pXVUVKNExSMTVLV1VLdUgz?=
 =?utf-8?B?K0FxZDlDTkFPUDRrWU0vMnRJRWI3Nm44NEtqZ0JOYk5ZbUtpMnRMK2MrQzNy?=
 =?utf-8?B?NTd1S1Z2TGxGVE9PSlJ4amIwM2Q3RGRLR3RXTzloZUFmUnF3L01YS0Nyd2NQ?=
 =?utf-8?B?WW90Rm5iQmdteU1ZVjJESUJZU2hiYUdjK3R6N2ppaEhMNm5DWFFIeEVXZ2pG?=
 =?utf-8?B?cC91OTVNTmpza2tGdTRsY3ZhZVhYbnhydURjQ01oZ0ZkSHBaQzV0dHZwd2ow?=
 =?utf-8?B?SGIvUlZCN1FRQmN0RlRGV2xCRG4xT29iL0M2SmhYb0pUU3cyUUVraU5RK256?=
 =?utf-8?B?S0FHNWpFdExKOHQ0OUZEaUNBTXVvMy9pWmpHcmN5UlNGQTY2TnVseEFQa3Z4?=
 =?utf-8?B?K25rK2kxOHZpcFZiM2NOYWpqTGVPeVgwQk5RSkJjZTdYd1JWaXhXUytRQVF3?=
 =?utf-8?B?OU00TWwyVzNsdExBeUdaQ3EwUEZnRUpCMjRSVWsxUisvWDVzZklOQnpxL0ZV?=
 =?utf-8?B?RGJzMGJvYk42TnJKSTdXTVZhT3orWTdCdTh3Q1RhRnhZUStWaDZXbHUraTR1?=
 =?utf-8?B?OFJhZmUxWmFpanc1MlJIVzMvSm40VDZ2elJCc05EbGpLUGRLQmhEVW1WOHlz?=
 =?utf-8?B?L21xanpncUhqMHN6TlZteCtzN0YvN283STVqRW9UTHNLanZ5Z0x6ZzZhcEtT?=
 =?utf-8?B?RmVkWFZDVTVUREtrNm94NzVlZG44d3czV3JIeFRKaC9LUVl2NExrUDF5UVBS?=
 =?utf-8?B?T0FIWVY0bUFJMWN5aGNiZW1Wc29xMEpJWjFudzJwYXRCbGJsZXZnUWxqNmc1?=
 =?utf-8?B?QjI3a3FSZy9jblFUaVM3MWNuZC9Ebi93enBrbVhQbUpmV3BycjRNWXhMS2F3?=
 =?utf-8?B?Zy9PUlFrMENFeUphbWxEclJybXRSTzJNeEp2eFB1ckZsVnlHZkMzaEVCRHY4?=
 =?utf-8?B?RmtQd3dlT2hiWEdmU0pONXZBdnJ5akU4WjZQMG5Iei84cHlmUWoybDc4Z3M4?=
 =?utf-8?B?emw2T0xWRGp0aDJJM0ZieU82dk5wK0pNa1AyS1dxelpCWWptdjVJK3RaS3RF?=
 =?utf-8?B?Q0JzVlI2c25ET2xTQzFzeDZFNFJBR29GVXppb3QrMG5POWQrTW9FWmh1ZVFi?=
 =?utf-8?B?WFRxZzFld2tmZnl5MVRZRXlzRnJ3Wk40ZnhOQ01KZDZMYnMyTW5VdEsvVDFx?=
 =?utf-8?B?R3NqNFdVU3Evak5xcHR0bE5taklqYXpOekxyb1VTeHhobkExU3Q3MGYzYk5I?=
 =?utf-8?B?NEl1OE82Y2QxejYzelFGWllOR2ZDQ3NndFNzV1VseklJSVJYK3Z3bXJoUG5C?=
 =?utf-8?B?VzVTMDlEeGpXOENvVDAvakNZdHNLNkJ3aFJPcEZGc0gyS056VWdLNnhqMkFx?=
 =?utf-8?B?eTVscFZGYS94QVk4NTRFRittdyt3MlFnVy9hanp3bGJTMzNwQ3dweUJJUVJJ?=
 =?utf-8?B?Qk1ZdU15cUxMVk1lYzJOR2tKaWk5MUJQcU8wQ0hLTGRlRnRYRGszbTh2dHd0?=
 =?utf-8?B?V1I2ZDNQaWVvMWxpVkhmMWhUQlRDbkdtTm1tYlFlQUZ3MnE1cE1jdjRUdXdz?=
 =?utf-8?B?LzRwL1BEVS9XeXVaMm1HRE9ncm1yWVpuV1BqOEw3MzJVcis3R3NnNC96UE9v?=
 =?utf-8?Q?ab8R3Ditr6A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVVnaDloMi9yWkVWby9icGFiM25TaE1kbkFFSzZJL0FPWFAzZVN4bzQ2VUNq?=
 =?utf-8?B?ZUhRbElVMXhNb1FkbmswVEtuWDJRZlp3VFJZOFYvdUlxWm15RHhRSFFNWTBl?=
 =?utf-8?B?V0RHRlZScDNNemdwWlZOVWNjWWNiSzkrWGl2RmppOCs0dXd6U1lmOWhnQzVo?=
 =?utf-8?B?NHhHZFRKU2NCUVNQUHY1ZldveGY1TGFIRUlpUWNWdkxaL2lxaUZHeFlxeHVT?=
 =?utf-8?B?T2kyUmV1NitoaW9GNHFhNVVXaGl0Tmxzc2tlZHJpWUdOVzliRlgvaXIrbFIz?=
 =?utf-8?B?b3JEUzVKVmZ4MUNKN2RxcFB3UGVSZ0xURlBJaGlOK3Fsc1JPYkdMNVBtdUt1?=
 =?utf-8?B?RkVGekFXSWlKR2FuSWFtNE5lV2dLYjJid0JJbjBoWWpwbUFzeTdjdnBFTWF6?=
 =?utf-8?B?RXdzdDJqRUZlbjhHVENNTmVTQ2hBUE5lN3hFMVEwZkVGOUVBR3dOcWhWMFNh?=
 =?utf-8?B?NG04ZHZoV1prd0kzblhBM1RHVXlXRU9PdHVheVNJeDhJNkMyWkwzZVMxc2Y1?=
 =?utf-8?B?eDFUN1lkTUp6TEtZWStrWGxuVVQzTGVMZUV0WkFJeElrUldma3NVc2xxOGdi?=
 =?utf-8?B?S2IzVjQvSGNaSUpNM0NGZnVlVU1KY0Q2OEhwVVQ5SllxTVNrc1J0WlJQbk8w?=
 =?utf-8?B?K2hkNnFtdVlvajNMeUxJckR2bVZ5U3lEQUNSdmR6ZEdVYVJmbTF3WGIzelA1?=
 =?utf-8?B?WmtlZFd1VHh1cTJoS29zY1BlREdiTHE3TkN1a2JsY05WdXAyeGRxK2lPR1p3?=
 =?utf-8?B?Mm0vc2JNa3ZMS3pSZFU2VUpneXhhSVdEQk1GeDd2YkcweDdkV0sraUlualFZ?=
 =?utf-8?B?YkxPTmpuTlRjUVZ2a0sxZVc0NERaVUtKWE81ckEwNitOT0NrZWFUOWI2QUR2?=
 =?utf-8?B?VnZoQVlvUkRwdkJ5anNIOHBzQ1ZjUjh5WTZBRGRPTGFrUWNoR2NZQTZPejU5?=
 =?utf-8?B?Q3JyanZUdDdlanF3ZXdaM0F6R09IUDBNNTJWbXkvT05idlJzMHQzaEZWK0hX?=
 =?utf-8?B?V0VrNDRoS2dGbWpKUDFwVEV6TlUxQk1EZktXQ0RCSWR3Umx2OW5UTFNadURV?=
 =?utf-8?B?UHFjaFVudlk0OGlEM1NzQlpidHByTFFNaFpQQWQrblhzZHJmRWNuY0dnSHBo?=
 =?utf-8?B?TUdxR0kwYk5uZ2R1Q3VoRFpDQ1U4b2txVjdLSWw4SHFmQXRaQThPUlZsYld6?=
 =?utf-8?B?SVZ3aEFMK0dVcWlvYk82NnJic3VyNWVGZUlSL3lyVkZDa3FOVmh2VmVyZ0c1?=
 =?utf-8?B?VjNQbm1ENjVZMGlBcjB3YXVIZndZKzZHd0VNdWRpN3VKWEpBeWplamhpVENK?=
 =?utf-8?B?QzNuZi85QjhZa3lnZDdyeGhUUk5RQW5xdmRSVElKOHp4Rnpnb0ZkYUVBTWIz?=
 =?utf-8?B?cjlIUFJqUHNzNTFFc2xmR2pDN3V3ZVBQNnQrZXBnZUl3S1hoa2tQVmp4Q1lH?=
 =?utf-8?B?Z3VkeDEwSnJnTjhuc24yVDVzVkVxY1EyZ0VzdjIrZHpESUxqVFBSa1k3YitF?=
 =?utf-8?B?a2J6SWZUWHdYU3VCM0hxRVdZRDQyYmRLYStJNTZ1blYrM2FmVkhFZjF5TzZL?=
 =?utf-8?B?WEZmUE5qaFZ4eExaRWZSOGdmUlVkR01Xd2R1dktkV2svT1BQcVdIYTJXRFpq?=
 =?utf-8?B?MXoyUGZlVXlBSmxzaUEwRzdhRWpXWGRjVnNwNEJrdnp4R2UzT04wQXp6czJ3?=
 =?utf-8?B?NkhmYUtDaEprY1AyTEUxUFRsYk92a09aY3ExV2RaQkxKMy9BYkozS0Y4dUxJ?=
 =?utf-8?B?OTRWREJ3V29yTXNjTVo0RjVuTFJ0TDUxVWUrZ0VxeVNxMGQ0dm9PNTV3UkNK?=
 =?utf-8?B?TVB5V2dQQU9XS3c5UXhSOERXNWs1MU1xQjN4ZE4vUDRxVHl4NmpraUx2LzVl?=
 =?utf-8?B?ekFIQklabWF5R2xaUVk1OFU0dXlFeWdqMnN5SmFxeWl4UWZiV2xrM05XR3cz?=
 =?utf-8?B?dW1kQXFRQjNtQ0pnSzIzdks5SVh6ZGRPVHpKWHJtNlpqRnE0SW5NUGhZMzBC?=
 =?utf-8?B?Ri9iZGltTnZjNXNUUjBxYS80Tlh4T1BEZm5LZnNoZjkwNERHSW0rUFBDQ2I4?=
 =?utf-8?B?Y0Q2dEI0aGF6MEZUdDRtc0VHRCtHL282aUprcnJTZStNVklkdnV5UGdjS0FN?=
 =?utf-8?B?RXZSak4yWXBBMnFHMityNlZiUXJuSnViWVBweVZzVE03RWx5K2M2TytGVmJD?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b652237e-45ac-41eb-d7e5-08ddaaa4554b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:01:34.0405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6/AQImkfv2599pLhTiTWSmwUkjLfMghiTAI9BIzNtmNPcfvWUPodadyouYpzJ8fPqHrMsnell20q94PNHXf6T4Hmv/sH9l8EZelgeFfUAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
X-OriginatorOrg: intel.com

Hi Shaopeng,

On 6/13/25 12:37 AM, Shaopeng Tan wrote:
> schemata_list_destroy() has to be called if schemata_list_create() fails.
> 
> rdt_get_tree() calls schemata_list_destroy() in two different ways: 
> directly if schemata_list_create() itself fails and 
> on the exit path via the out_schemata_free goto label.
> 
> Remove schemata_list_destroy() call on schemata_list_create() failure.
> Use existing out_schemata_free goto label instead.
> 
> Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> ---
>  fs/resctrl/rdtgroup.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 1beb124e25f6..592d4f69fce9 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2608,10 +2608,8 @@ static int rdt_get_tree(struct fs_context *fc)
>  		goto out_root;
>  
>  	ret = schemata_list_create();
> -	if (ret) {
> -		schemata_list_destroy();
> -		goto out_ctx;
> -	}
> +	if (ret)
> +		goto out_schemata_free;
>  
>  	ret = closid_init();
>  	if (ret)
> @@ -2683,7 +2681,6 @@ static int rdt_get_tree(struct fs_context *fc)
>  	closid_exit();
>  out_schemata_free:
>  	schemata_list_destroy();
> -out_ctx:
>  	rdt_disable_ctx();
>  out_root:
>  	rdtgroup_destroy_root();

Could you please resubmit this independently? That is, not in an
email thread with the cpumask patch?

With that:
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Thank you very much.

Reinette

