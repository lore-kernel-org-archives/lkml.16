Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1392DF59;
	Wed, 18 Jun 2025 03:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218371; cv=fail; b=r55SX3EdqZV1jgtJ1CV6AfW7ubeyJqHrdlE4h+zexQ2sTKqCWNtWT5PFtRVkYQ6Uel/IAs6xNcv1II03k4bo0M4bwSbLFpwdS96wbqrEpsZz1iekwg/fB+DzoYYep17sXEZ8saRNbS1i2QoGXqQYlaBxWLzEGsOerjXdDmNLHJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218371; c=relaxed/simple;
	bh=a98GfbHuoEwS+of60pPLA7msmp5fcqdHhVD5BxUO7NE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hmGriIEpNtyVpQwxKkWEmkWxFD87F62DnKHXCmGFnkBHe+urRK2UMg0Bpt0wC/DtfJJWExN6BNpkUIldHlsQ/grqu3e1bgL4GqByDQN+N2ZoGk9QC/KWWpkGZL25rmwY3Rg7/NmTxywat1yJakNwgYVNfZUcX8negoXcJtEZMaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdtxY9aA; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdtxY9aA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750218367; x=1781754367;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=a98GfbHuoEwS+of60pPLA7msmp5fcqdHhVD5BxUO7NE=;
  b=GdtxY9aAog0hYl0ErPTdJ8cDca0ugNnEJW5m8eYKUZ32usAr/NI/aIcy
   FidgGQ9mufz5Gz1RDMSqqh3GhIRiW1WVniunt+rOvupJD/cakfqCW0DV3
   8H7HcNLUi2C91rKNraz7+TQguNdgeNqAhPLEGQ/24rY4BobkG6q75XVLi
   +Z4y78Hj60oI2kNWcJgJktM/39uhnBADnxOOlpsOelzzy6hn5QoqbcNdl
   SOwawoJiMqlJWv5Zyyby+X6a5gkvrkM7PAM9iMWVesZNAbKVfHU84JuAm
   Q/V3p68wkoUQM43r85aeu4bDLmcsLQYA1+R2DuWkZEwBr+8DYt/RFt6NF
   Q==;
X-CSE-ConnectionGUID: RFJ+q9+pSd2qbrGAixKpxQ==
X-CSE-MsgGUID: OKpfrEc0RJCoJVx6Hm5dGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52288600"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52288600"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 20:46:06 -0700
X-CSE-ConnectionGUID: FsyUeBvrRiOVoJvHdHSQ5A==
X-CSE-MsgGUID: Qh4q4oSLTQ24/+y9lW9Bvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149002952"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 20:46:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 20:46:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 20:46:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 20:46:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfmVJd2qiQO+aCjRiyCu0wtdOQUjKYZm74FNjHP8+KkmGghjk62ncCQzCWwLfiDBmQ86VBTWekCTeGFVvq4V1kxaKmLsC0vXG/PvP7RdWELRh0z25NNtKNI8rvzva2/2nhiCudWQnquvljMd7DS0Llaq1/yCOmNd7fDUiCuaThbtELUt8sfVRIkS0rungD6wAoYf7aQMw0r/lrRsLBmPSe03VGk0ysRHNDtAdH8/LHp2W6Cq8neTKI518E8hnyt5uxEr/T9qPaaYlSNCNfK0ehPuf5wC6buPTAjsxhIY+/5a8boIYArDzOHkLeABFXcO8dEd74MMUaw0DwXQepmjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjBDtkZKOkZgWGj60MaxUiJnIKpB098/LzsVySBnHpc=;
 b=EsYJlEgLW0PbtthW1+xY0f+L5JNpCQmm2WMS6WqOePslc+dVBQ5vs1h9w2jYwb3TIpuJa4JtJGwjeuvWSXFW/ao5QJxp0pv5V8M/P0cGthxPJ0U0PDxXWvxntsF6LKg9Zt1McoiITWWK+G5CLhvZs9fdGZ7vW/EIyFTpvIJqY/AwJFFnSxLyR99BebwY0VVQuvbgTGPP0TTptobzd81x4uZa4dWZsENhYzylCP1Kveyg+VH5I+csyWQ8AQrsW9N5zI7Yo+bOLfdzrRkJBRPPcKj/gZCHHQgmXQVv7/PebOhTZRELgyAvaosUZ7Q37xTK38NWoCPABDpfISVb44ym7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW6PR11MB8339.namprd11.prod.outlook.com (2603:10b6:303:24b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 03:46:00 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 18 Jun 2025
 03:46:00 +0000
Message-ID: <053a6879-f069-4073-a96f-dfacd7673d1f@intel.com>
Date: Tue, 17 Jun 2025 20:45:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] x86/resctrl: Detect io_alloc feature
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1749677012.git.babu.moger@amd.com>
 <8861ecc4aa962909faf07985448a333a75ca7c33.1749677012.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <8861ecc4aa962909faf07985448a333a75ca7c33.1749677012.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0088.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::29) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW6PR11MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: aaac6721-9afa-452e-643d-08ddae1aa424
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzFiSmVoWFgxU2hNWWg4SmJJbndjNmJTbitBYnlMR2hrc0h5WlY5V2pUQ2Ez?=
 =?utf-8?B?Z0lOTy9DdEFGMDJUdUVxcjNTbGZ4Z0xWU2tCQXVCOGc0L1p4Z2xNR3l3VmN6?=
 =?utf-8?B?NlNwQWZwYTY4ZWNVSm1uUzZqWXY3c01XMlBwNWJGcFdBNUs4em92UnBJN29t?=
 =?utf-8?B?ZWNLWEMycTRtYUg2WGpNS0hhekNzWXJRbnlETW50dDdMWWYvaWg3RUlJY2t4?=
 =?utf-8?B?anN4SXpLREVXSEVhMVhWcitUdFJUWkEveHRUOExZOWxsNGhlRHBzR3N6REtG?=
 =?utf-8?B?eVA1YzlrMWpUcExWM0lES0ZTSm5Za1ZKTEpmNlB4MlloRlc5dlBPS1piL05T?=
 =?utf-8?B?Zkl5azk0aTVmTERZTVhvendacmt2TXJ3cGpEdU4wVlRIK1pWd014ZlBjVUxi?=
 =?utf-8?B?TW56bHFGdExRaWpVdFd1ck5NdXJxRUc1eFpHb0dYdnNDbkpCc0UzS0hMU0VB?=
 =?utf-8?B?QUJPOGNlcWdRUmxJbitRV3FyOUcwaStja3N5YS9lcDFncG5VRDZ3YUpPclNL?=
 =?utf-8?B?aDZkMTVjU0RDOWJJWTZkLzZkRUNyQzA2YmkxVUVaNllKWTU5TnJvZm9jelhy?=
 =?utf-8?B?bW83SlB5ZGxRNG9xNG05SzByOG9ic2EwaXpzbWNGT1pKdWphSFA3SlhEd0VL?=
 =?utf-8?B?VjFubzJOcjVOY3BqNFFDVThlazNNektqZ1BLYXgvNVBtanpYV3JGQjQ1djlo?=
 =?utf-8?B?K1dLRXFTQmhINFNPcVBITTB5dkxVemtZVDl3dldiczRCcHBEY00zOG9hMUo0?=
 =?utf-8?B?VnphdmVURHdpQm90cXFVbHFlN3pGdnNmWkJXU1NQRmJVdHdEL2loMGpyZFVt?=
 =?utf-8?B?cFJHSkZqZVlDMldmeWV1NGhvbHFPOGczb25oSjRnQWdKQ3owT0gwRUV6QVky?=
 =?utf-8?B?N3pDQzV2ZUhvWjE5NEw0M2xERXpKeEQvVndHaGFrWmZhSytXZkhkZ2V4aGFN?=
 =?utf-8?B?cnUvZ3VseVNJRWpBcjFzTklUcDg0VVhucG5jWUtxZ2hQQkhlVlhLRnRlSXNq?=
 =?utf-8?B?UFhJbThjdEZ0Slh3cmtCMjExb0dzTE90eEhhYzRxdjA3VlVaY2ZIQjFVL1kz?=
 =?utf-8?B?aHJLejdLQ0RYOVNwMUxGVXJ1R1FNOUZvb2NMYjd6SHJuRkZjWFA3THBuMTBV?=
 =?utf-8?B?NEhyNEZ6d1haZ2NyVXAvN204NHcwNU1wNU9FVVNiQlhLYTcyOFhYZlQ2M0Q2?=
 =?utf-8?B?V1lZRzkxYW1NVnMyNjRLOTZpUXpkcFA1dGJXVHEzQ2pzSk5XYTNnQlM2UUFL?=
 =?utf-8?B?RGhZd1JCUmpHbUNnWkM1eGdqV0QwdHhMYzRNMTFQM3lnLytCYlhwWS92VWFH?=
 =?utf-8?B?OWRHcjdDS1lmSHlaSnRETU91SGJSeTg5WE5QQmxLN2FmZXk4VEpNbTFTQVV4?=
 =?utf-8?B?eVpWdGRxU09LUEc4TDdmV1lncHUwc3hjd3d1WVJkMHF5bmc4RjdBZi9LMXBy?=
 =?utf-8?B?SkdmZzFyQiswM2k4VjNnU2kxRmpNbHFWZHg5dlpsRVJwakRLZkxFSTAvdnZ5?=
 =?utf-8?B?QjhMdG5KOHVpUHp0bmhidE40VEFXMTUwSmtNL2tSODc4cGUzcTYwWFFmUGNr?=
 =?utf-8?B?K2NDbVNNMlpTT2tZSmZUSTA3d1RHR3AzdnQvM1dWUWNGTkUzQVRGazY2d1Za?=
 =?utf-8?B?S0dob0RMTmFyQ0xLSnRhcmtGbUY1bDJjQk9MT2diZ1lWWDQ5ZWN1M2hyQUlS?=
 =?utf-8?B?NGdiVjFmOHVMbWFMWktyZUNjNzJuVm00WWh5a2xlK1ViYkNsbGtLa2UvN2VO?=
 =?utf-8?B?alhkb2Q0ZkMvTmwrSXZ0bk03aTAzTXZ4bEdpd3JLQWFyejZOSE1NNWZxS2VK?=
 =?utf-8?B?V2phblZnbEFtNU8vUHM3dmpNSEs1MlNldVJPVlAwM3pYaVYyNTZGdXkyUW1K?=
 =?utf-8?B?VEoySGVGa0l1cHJhb0xPdzBvYWdad2RXNC9vSUlVREtiNDhISzhDaVhZRHpk?=
 =?utf-8?Q?zQAbFnc8QLY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENXaXJDR2ZkTGFZVWRMZUIwVmpuLzZCVU1aSEZWUkxLNEovbDNDWkV0eTNj?=
 =?utf-8?B?OFRpeVVBWUVGeXRwK01yclB6NlhRcGlUcnZxS3ZFMXE4dThWZkQrK3orVFYv?=
 =?utf-8?B?aGlLektJcTBJRUZWalZicEhkeGRCOWVRQjlUaERkS1QwOTdWemZUakJSaFhB?=
 =?utf-8?B?VElrSFhGTDl3b0pYa0xhMHYrSGNVUkNzdFNXM3dTQnFhckJQUk9rNDlGVVVW?=
 =?utf-8?B?eGljdE9ZR3V0a2NEQVh6bmkrT2NmelpnUTNJaUpFSHZuSmhhTWhxSkJnWjVL?=
 =?utf-8?B?ZFdKeE1uTTVueHNlbXBBNHVUVXJpcEtmR2J5Sm5haDl4ZkljQ29KQmRsYUtU?=
 =?utf-8?B?ZmxHV3dGS1pCdDlveDhrelF1dVU3MXJHRVdVR3NDK1JHSWFrMGF1NUx4WUpm?=
 =?utf-8?B?b2ZoY2l0MHRuVUlJZUdKcXp6TXNqd0VwQjMwUnRwcU12WnpkYTZOaWoraDRx?=
 =?utf-8?B?RzFWd1g5clIyN0IwTFZMNktHNVhkZ0U1eEdaUzF5YlZhYnQ3SHN2dk41SFpp?=
 =?utf-8?B?Qkx1MWQ1NEQrd1BYS2pHOE9VQlhoQmdiNTFqVytqMHNSSjVTSXlBd1h0RU5O?=
 =?utf-8?B?VlZLS2ZzY3lxMXFXdmVOR2kwVjk5aUJOQUpleGdxMHlwcG1SSVVmU29paWx0?=
 =?utf-8?B?QXl5N3hDQ0RHMGIrUHN0OXQwNll2N3N2SnBsK0NQcFdnSVRlWnY1dWhOb3do?=
 =?utf-8?B?NDhFSXdyUTE1em41c1oxRjd5L2tFZzlkcXUzZTk2ZmcyRDhTRjl1MUVBN01F?=
 =?utf-8?B?TlhiTnhhalFZazF4bFNFTnBBenpINlo2ZkJ0dzA0N0xBWVFkc3RtMmUzQy9E?=
 =?utf-8?B?ZWRnWEthSE1RckJTbFkzbXlrZHgzbFhyMEdua3E4SExORXkxcUZ0WUxWRWZI?=
 =?utf-8?B?Vy8rbTMyWEp6aXhpZVRpYTdEL1c0SldMZC9GOHd6SGdJT1dRZ3hVcDI4V3Jm?=
 =?utf-8?B?dk5RUjNEOUxkVkx5eU1NeDYxVDl1V0lCZEJ3NHduSy9yeXdQbG85ZFNZczht?=
 =?utf-8?B?RHk4RXN4NzN1bUtKOGZoTGNOeWJQQjVyVTVqZHp0Q2RWb2d5djk5eVNzSWJD?=
 =?utf-8?B?Yzlzemp2Mi9WZzI1NmRobnI2aFJ6b1RMbWp5dEk4bkl1bkEwWXZRZFM2WEZ2?=
 =?utf-8?B?VUhqeEh4azJuM3V4WEd3M216Uk5pR0JxUkx0ci9DaDlWRG9HYm9iaDhPSW8v?=
 =?utf-8?B?LzhMTUFESFZZbDNTRGJxUnE1dHZHOFg3Q0FrajhuT2x1WDN4R3VaOXZjd05P?=
 =?utf-8?B?dDV4TTlqbDM0OTFxRXJxRWRhQjRWUU82UXdMejFiQ2hXVW4vSFpqa1VHVnhl?=
 =?utf-8?B?Vm5CZmNDZXhsSnFjMWhwS3BSeFh5ak5ydXVLTDZITndlbnl0ZGJkam9QbTBn?=
 =?utf-8?B?UU92NVRrVnZWVUdsSmlZR1dvd0lEUWFVTjMwaHZqRFZiOU5zZ2g5ek5IeXZ2?=
 =?utf-8?B?UVBKeUtVL0lrb3J4bTZ3L3lzT2lMUjM2ZmhYemUrdWw2UVZmaG5qeXorVVdK?=
 =?utf-8?B?UWFFZDFMUGNvWUE5Vk5Rb0VBV1BBZVMzdytsbkJTVXJKdW1xQm9Pci9Udzgy?=
 =?utf-8?B?TDJRMXh3WmNuc1N3dmJyWXBjeTEvSkltUDVYZ2ZoL2RjV2NzTDEyRkwzSkhP?=
 =?utf-8?B?RGU0UEZKbm52V3NVbEZQaEpvbWdCTzlkTDN0M0JRR0phM0sxKzNTZEQwNU1K?=
 =?utf-8?B?dXE3NCtSRFZPQWlwdE1KS1dCbUZNczh5UVVPc0lHbVluYmdKQ1ZFTGZVbk9U?=
 =?utf-8?B?TjVaZkt5Ny9ORTdTZDY1SnhBdzZSUEN2dVNiYnU3WDV3UWljRVNOWktsbzZZ?=
 =?utf-8?B?L1BsMHBaaEdLSjBjZFFYUERTQ3lEQTRXZE8xVHBzYWw1Nk42WFBxM2duWURo?=
 =?utf-8?B?K1E2UFNGR0UzcmhiL0dyd2ZxOElVSmltb2JUYk1VNlFiVGw2Tk1QOERqbmdM?=
 =?utf-8?B?Qlh3enpJWW5kWEtKK3FaeEV6SFY0QW9TNVdpVkdjYXUxblNTeTkxajcxNnNy?=
 =?utf-8?B?Z3RqTU9RN255cXpYaWt5eVViSFBNclc5c0hnYndoNGRhbDdBWmFaQll0SEJ4?=
 =?utf-8?B?eFZBY1BubTdrUEowcEpTVWE5cTJxZmtKRzNTL2Z1TEZUMzU0a25lQmxWSExP?=
 =?utf-8?B?YituQ2NMc200M2JSOUhjMUJTaE43WWVUbEZDczFaTGhkUElWOU5SdGFpOW1q?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaac6721-9afa-452e-643d-08ddae1aa424
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 03:46:00.4122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrs9yJo/CK9QsgUw7F5d702ln7hMPx+vinQfSYcwKdhvHT5m7oNyucamsStjIfq/7arWbCRiEx6L8MWddzP9t6PrUcLctQPQGNGZEgpQYtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8339
X-OriginatorOrg: intel.com

Hi Babu,

Please modify subject prefix to "x86,fs/resctrl" since this adds new arch
API called by resctrl fs.

On 6/11/25 2:23 PM, Babu Moger wrote:
> Smart Data Cache Injection (SDCI) is a mechanism that enables direct
> insertion of data from I/O devices into the L3 cache. It can the demands

"It can the demands" -> "It can reduce demands"?

> on DRAM bandwidth and reduces latency to the processor consuming the I/O
> data.
> 
> Introduce cache resource property "io_alloc_capable" that an architecture
> can set if a portion of the L3 cache can be allocated for I/O traffic.

I think "L3" should be dropped because the cache resource property is not
unique to L3. It is a property of all cache resources. 

> Set this property on x86 systems that support SDCIAE (L3 Smart Data Cache
> Injection Allocation Enforcement).

Here it can be mentioned that this property is only set for the L3 cache
resource on systems that supports SDCIAE.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v6: No changes.
> 
> v5: No changes.
> 
> v4: Updated the commit message and code comment based on feedback.
> 
> v3: Rewrote commit log. Changed the text to bit generic than the AMD specific.
>     Renamed the rdt_get_sdciae_alloc_cfg() to rdt_set_io_alloc_capable().
>     Removed leftover comment from v2.
> 
> v2: Changed sdciae_capable to io_alloc_capable to make it generic feature.
>     Also moved the io_alloc_capable in struct resctrl_cache.
> ---
>  arch/x86/kernel/cpu/resctrl/core.c | 7 +++++++
>  include/linux/resctrl.h            | 3 +++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 326c679ade5c..a3d174362249 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -274,6 +274,11 @@ static void rdt_get_cdp_config(int level)
>  	rdt_resources_all[level].r_resctrl.cdp_capable = true;
>  }
>  
> +static void rdt_set_io_alloc_capable(struct rdt_resource *r)
> +{
> +	r->cache.io_alloc_capable = true;
> +}
> +
>  static void rdt_get_cdp_l3_config(void)
>  {
>  	rdt_get_cdp_config(RDT_RESOURCE_L3);
> @@ -840,6 +845,8 @@ static __init bool get_rdt_alloc_resources(void)
>  		rdt_get_cache_alloc_cfg(1, r);
>  		if (rdt_cpu_has(X86_FEATURE_CDP_L3))
>  			rdt_get_cdp_l3_config();
> +		if (rdt_cpu_has(X86_FEATURE_SDCIAE))
> +			rdt_set_io_alloc_capable(r);
>  		ret = true;
>  	}
>  	if (rdt_cpu_has(X86_FEATURE_CAT_L2)) {
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 9ba771f2ddea..0e8641e41100 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -191,6 +191,8 @@ struct rdt_mon_domain {
>   * @arch_has_sparse_bitmasks:	True if a bitmask like f00f is valid.
>   * @arch_has_per_cpu_cfg:	True if QOS_CFG register for this cache
>   *				level has CPU scope.
> + * @io_alloc_capable:	True if portion of the cache can be allocated
> + *			for I/O traffic.

Reading this again I think the description can be improved since technically
resctrl does not allocate a portion of cache but instead configures the
portion of cache that device can allocate into.
So perhaps this can be: "True if portion of the cache can be configured
for I/O traffic allocation."

>   */
>  struct resctrl_cache {
>  	unsigned int	cbm_len;
> @@ -198,6 +200,7 @@ struct resctrl_cache {
>  	unsigned int	shareable_bits;
>  	bool		arch_has_sparse_bitmasks;
>  	bool		arch_has_per_cpu_cfg;
> +	bool		io_alloc_capable;
>  };
>  
>  /**

Reinette
