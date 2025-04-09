Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8E1A315A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 04:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744172833; cv=fail; b=Lo3Zy2sPagLBszv8igdt+m3aS/g0/W9B9Q9QHD0gRhizwiWfoNXV0sVaw0FkLn4faGo4NBeF8CiV1YEl+H8B2GnVHxyQ8IiQd5P/ncCxMsnU5zT4VTFWZfGHEnT7cVQYlrMItIex4ID8yVHd1kU6S9+V4NKLVKplwgLISFTdRzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744172833; c=relaxed/simple;
	bh=7de6FTQJIpKwr1ecaaM1JwUFI+G0RzhhpPs4/wPDOFw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YlkN/6SMKVWtHEZxVdhV9MwomZvoIxN2jsJKFMnoutFC1bGs5P9/3zDGitui8k5S5LszB1ydLPdOK4rcU8UwgzAng8N9gjESA822SL0mfBdsHEOqk9w+qg9N+5WnR6BTQpPTB3I7Ulo164fzpJRPy9JXu5n6NdUpJAAWd7xScx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8Ap4Sm3; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8Ap4Sm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744172831; x=1775708831;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7de6FTQJIpKwr1ecaaM1JwUFI+G0RzhhpPs4/wPDOFw=;
  b=F8Ap4Sm3Iw4iuqrKKzSLc3eAHU9b9dMcuLHXpkkIW3FlBj7EDJMCWLnR
   4A1a8qNEg7Ai/iU9MmbyIq+A+mD5tJZW1DSma0ThMicQQfQyPKUdjaEYg
   1mSMNHjPxgsnJmKiG2weCHef+a8G9pI49IjTrgR+f9KdCryGlfoiUOzAT
   UsjAF8xz1ODLNAQpv9USfsUAJ6/+XUMpL6UXVjDeiByNx+yCgeMNHLx3+
   pggNnUJT3Slz5ke8gd8+oxCXR+M5CZauaomdMjY6a/ne380SiSPo0e9He
   XhA66ieD6O5TIPIWScVS4l3MCitFNFgU+VujVPloCC02XglqlEGwUPNoA
   g==;
X-CSE-ConnectionGUID: Rj8Ct73ATz+d+oHO1yvbzw==
X-CSE-MsgGUID: SV1xmc9PTHCyN4Tcd9JW1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="71003891"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="71003891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 21:27:09 -0700
X-CSE-ConnectionGUID: z850PGm1R2ufi0/N8+tASw==
X-CSE-MsgGUID: d5shEonAQA22uyV+GEtudQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="129416927"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 21:27:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 8 Apr 2025 21:27:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 8 Apr 2025 21:27:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 21:27:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3fPTOWxmu5N/+2Hsu4yneSPHi4r69AANZHoteiY35XXG2msvVXqJ/zr2oALOXlK6Zeg+ktass7t2J/nS5g166D1jwd1FaCoK9i4WtUVMrwbLAjkMPVvHvAWfSNBIombl/YXJLi7S4an8iaJX1Q7AOKzFqr9Z3soqW0ZDScoHPL2mYE8M1OoWxe7kxCmQL73cJveNZY8WkJ6RnUyCw9RoHgBgVWpTi3CwoJReK/L/oncu2qAhbCeVODco+Qj6Lvq6RrOjZEDXCASLhu3XKrx2yue4IA9aQuSOt0Xvd3mLbHLDzGJ3/nZwrWOqGnjResroWEMQdH1s41J6N6/7/6Eug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8i1L7oRaqL/cT8weCg9syZWA6dJ7LuiMidQuN8tDfc=;
 b=cViYZV4WgcNC47TiWLjprPmTeqPunqeWOpU4HSRDZ8fFNfXz/DDkP83NfncNkHy3YePH2K3n90YaAm0oal+GfMYT+HgTWQiBhG8DsONcjtoYR2gUxo+1QJ7rEVSoLVyjC5DXr+LK+rJbqyQdP/vbsbNtCIPDxJXyY3VeEBtIJwY5KFFi7JOXdfcMy7+gvtHnb0I6LbZIr4OurnekCiuwxnrNEp83rSpm111A3c4VmBhfMx+oERfYul7yca6LJjENVs5GjrlppsHoSvU21LL8hAex+K4CQJk+bsj9YEPnnubXAi15PwgpSDdausL3X7kv9DGPAlBohw7FuSz0/HRnvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH8PR11MB7024.namprd11.prod.outlook.com (2603:10b6:510:220::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 04:26:50 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 04:26:49 +0000
Date: Tue, 8 Apr 2025 21:26:46 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Cedric Xing <cedric.xing@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>, "Dionna
 Amalie Glaze" <dionnaglaze@google.com>, Guorui Yu
	<guorui.yu@linux.alibaba.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v3 2/5] tsm-mr: Add tsm-mr sample code
Message-ID: <67f5f706de0f9_72052948@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
 <20250407-tdx-rtmr-v3-2-54f17bc65228@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407-tdx-rtmr-v3-2-54f17bc65228@intel.com>
X-ClientProxiedBy: MW4PR03CA0115.namprd03.prod.outlook.com
 (2603:10b6:303:b7::30) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH8PR11MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cc10d2-77ba-42cc-2a37-08dd771ebf38
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGtuRzRoQms0TnNHWTRYYnFoK3gxbjdsczFVbFN4cHhwQlNVYWhNVDV5NTFQ?=
 =?utf-8?B?Q3ZzTXhlOWFvWjhzRVZKcjY5UzRBak1BZFNDOHljQ0VPeWxDYnlueG5ZQTd0?=
 =?utf-8?B?SjRBeHl3NVZ5aEhOTHpDaEs4Q2FOSGVUSjdXWTR6ay9FQzd2c0RadkVoakY1?=
 =?utf-8?B?Y2NTYkpWTktxZU1YdFI5Zjd1d1VwZG5vNEdaTU10a09rRUt5QlBJTEswRExo?=
 =?utf-8?B?eUtQRDJLRnFpSkpycjZ5bTQrbXlaajE3N2xPSUlJUlBVZUlST1FzZGpRNWht?=
 =?utf-8?B?ODFnd3BNcnNvV0pZV3FaeWlGQ2ZjaHNEZStYRVFKRFlwRlV6bjQwUWZKaldT?=
 =?utf-8?B?ay9aUUNHOVBna1BaZFF2RkVpR0p1UURMSDhOWkplT2Y2N0tIY3c4NnJxTmZx?=
 =?utf-8?B?ajR6cUV1Zm5NMUw3VTRlbGYzK29icFp5T05jUzZoQWtzc2tpL1FJSUZldm94?=
 =?utf-8?B?eXRPSHZ3UlArcEpkaytXZS9MVUFpMGdFNkg2VTRDcXRMUGcwdThvRkEvVmx5?=
 =?utf-8?B?M0s2dHVUbWQ0RmdRTXJ0YXY2dHZyRThBTEYrRXUvNTNPSGpiWk9XaGIyTVRY?=
 =?utf-8?B?NXVMZmlqWGhJTi9rcGhUbUhISUF3WXFYaVBmWTJxRVhpZ041cWFRU3laTlEy?=
 =?utf-8?B?Q0tPMjNhdDNBZlU2TzdMa2xhTDVabi9FYy85dUlqb2U4RHB2NXc5NVo1RFNV?=
 =?utf-8?B?ajJFYXBmSlcvRDUxZE82NHZ3N2ZvT1ZRbVBtcy9mblNNYlVWT3p0RXJibmQ1?=
 =?utf-8?B?aW5WVmlnOXZ0VUhqTHE3b3pMOEdGUDRzSHlnZTcwbGJ4alJqcVJvekZ5ZU8y?=
 =?utf-8?B?VEtWSnpZVmE1bm1oR2R1cVdhSlI5UGM2UW1nZHJzb2dvVVpOVDB0ZjZ4dWpS?=
 =?utf-8?B?b3ZQSDVUZ2RJRUVkTFNrbE51Zm9SR0JmY2YvNWNTMldWNXNGSkFJZEFObGxi?=
 =?utf-8?B?UUZCa3dZRmlvV0MvL2V3VzhUcllneklzeWZzTWFHM3ZucHExUGlnY1pLL0th?=
 =?utf-8?B?RVhKNjlsL1RWd0hjSFM1NUdRSnNFL1BHa1ZYMlk3YjRucWNWcWJlYmpTMmxJ?=
 =?utf-8?B?UDhwVTJHdFZwQ0IrWEczOVMwVEFNSCtncTFsTjI1UWxzUjdrdHJnN2J6Wldp?=
 =?utf-8?B?UTZVb2hUVVl6TGM0dU9HOTdZK2dxdUQ5czlicDljYXVzRXR4WjFwWnVPTVlL?=
 =?utf-8?B?eGtzQmxwbzVsSjhpYURBdm1GYzVjaTZjQy95a3lzWEwybnNaZ1VTUTdjUHFO?=
 =?utf-8?B?Tk5DL0I4ckZOaGpqMFRrSllpcU9VMzcxNlpnWlI2ajdvUFpKLzBYME9UMmJ0?=
 =?utf-8?B?RFJyQ3NhWHBIU04zTzI3eExDM20rKytTV0hrN2ZlaUNSbzNidmZQY1BBMTdP?=
 =?utf-8?B?aTVwbUxNSlVzeDFYTnBoQ2FnVHFJL3U3YXdsVlAyc253Q3JGUklKVjJyNU5S?=
 =?utf-8?B?bElIUnR1QkxtYWZyRGh6QkN1RVd3K1diWnNudTBYUWZBRlBEWDFTU0pydVdu?=
 =?utf-8?B?UUpNK1dHVkNlQTR2U1V1SndYTjRVSFhFR0dpYzl5aTU2VlVnYXBaTklTQUtP?=
 =?utf-8?B?VzNyOGVXTGFjbjd0eTJGRmVOb25yMGlBZ1ZpQW82TDAxWEVLQWp0aHBxRUow?=
 =?utf-8?B?TDhMS3Z1YWRncG5pV3RLSWRwM2hKNllhUXo3RzAvUk1LZHYvM1g0VC9yUnFJ?=
 =?utf-8?B?VkRYbWEwbDhkdjlVSFg2WXh6VEV1eDZ4bzRtK3ZMc0FVUUlGL3JwMklmdzA0?=
 =?utf-8?B?UkUwYUwwMGxZbERwRVk3dVBIZ2NuVWdLcE9wY1ZrdE90eC9MSmdELzhmdjE1?=
 =?utf-8?B?bUxIeExMWWxWbDRNTzZEdmh5S1l4Z2ZpNjlwR0duY0UvWEF1STFFQ2xxS0Rj?=
 =?utf-8?Q?3S9ERQgN07cX2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnZQdTdTQWtQWHpKWXZ1ZnN3cFpOMUgwOUF1Rkp2ejltZGRtT2dDaTcxL0FP?=
 =?utf-8?B?TU9yMXM4Q3duTXVxL1hiRkFzT3JLUllDaHRYQVhZelJGd203Sy9jTFNNa3Ex?=
 =?utf-8?B?aUJuWThvUnhGNmU0THJSSmZVYW5qWlpRMEExeTZNKy9GcWtORjJIRTFrZnlY?=
 =?utf-8?B?azZraXhrRWVtQ1l0cVR4N1RuenR0NHM1dUNxSDdlelgrUGdYOWVOcjRFemFh?=
 =?utf-8?B?SUlFaXhyTC9HMHgrbWFXdU9QV3dOSjRtc2R5SmlLNEZESGVWQXhJZVR6NTBx?=
 =?utf-8?B?Y1ZNVS9RdndUSE4rSjBwL0pONXp4VjRrd0hZSDJMcHBQNng4T2dFY1JuT3h5?=
 =?utf-8?B?cGxjU0MvczZpRGdodTVJbWVwZGRjbDNIWmF5eURCTnVFOWNxcnhpd3BrT3FP?=
 =?utf-8?B?RUNtMUp2VHlvMUk5MnByRjlmbDNlb0ZDNkFPTzRzWmxST20zaWRoMHB5N0ZP?=
 =?utf-8?B?VDJ0MlYxUGRNNEJUVDFQR1g2Rlc5bTFtSCtxdFpOMFNyWDdDdjNmdHM1TXlO?=
 =?utf-8?B?NElDUGFaRFd0Y1hQdWJtaUJtbGVMTUY0Q2FBaStzck5MNFUyWWRzWGxvRXc3?=
 =?utf-8?B?WGxKWmtTWDFwY2FQRnZFalE4TDNHUG9GaGpOV2xhdW5LRFdNaHRweVo1Wmxv?=
 =?utf-8?B?QTZQU3dwRGZsNE1paHoxeUJnOVdpVlFKK1ZpTklaVnppWWtDdnU0bkRxV3c3?=
 =?utf-8?B?WXpEZUk4SWlZVEhlVENxc2MwU1JzTGFZSFJVWnFldDdYL0plNyt5eEwrSlRz?=
 =?utf-8?B?WTdmM1NPVlRNRnJseVdGWW5LZ21qdk81TDhUVkdZbDdrdjB2NDJJMGRyeThK?=
 =?utf-8?B?VzdBU0VyWDMvZ2hxOWgvQTFCanFUNnNUV01vQ01pNHRNUUo1cnNib09YdzJM?=
 =?utf-8?B?dVJWeG83dXRwbk9xNmR2dEdwS2NLUGtydUR3cE5qbUVYTFBXN1BxVVFsMzJJ?=
 =?utf-8?B?MEdjTTFtQW1Qa01pNEN1YWVjNzBRdkZmVHFNaE9ZMEVmY2hwY3FqeVJoUFBM?=
 =?utf-8?B?U2NrSUdmem5PSlROZUZtV1QwN3EyMVFGdTJiTXR2eG9kTmZBdmtSalV6K0cx?=
 =?utf-8?B?b3hWNFU0NWc0TU5aZ0dHTGpEaVJGQjQyQXJ5NFNaTzd3YUFVSkZYNVFLSUFU?=
 =?utf-8?B?TGc1b1VoRkJVd3FLMm85RWdYRjJzTVFKdEw1bndZREhVVFQ4aytVYnhHWE9k?=
 =?utf-8?B?cmNZYndCVzdoREdWaWZPbVhyWWF5ZkYwc1BRQXRWMmcyRDhiN1pmUkRYVlZM?=
 =?utf-8?B?cGhObTZDQ3lUZS9CWkVTc3BNNk9JZUpodFlzMlBrdGJzTkdncjdKRldLdTlB?=
 =?utf-8?B?a3JseUdndWpCb0wydGovaEF4TkM4NmxFc3pGRTJiUnRyaVA4b25KMk1pdVFx?=
 =?utf-8?B?U0tvamY3WmRVSTNPMFh0R0ZRNXZ4NjdlZmp2Mmpvc2MwQWErTDZocG5TTDdR?=
 =?utf-8?B?Q1F1VGd3a2hybzRHcmRDZ0ZqbG5mcVlwTE5kNnVaL2NTcnhmSHBYZWxYdDF3?=
 =?utf-8?B?SWZPQkR6THRFdmNTVUJBSGVlMmlzYlZxUGd6QTFlSCtweG0vUkt5UHhGWjlE?=
 =?utf-8?B?SjNqOTZBUDRseWRJS2w0UkpvSUJTWlNJZTFaOEJRY2VSTm5oZW5BL2dxUk56?=
 =?utf-8?B?dDgyajlOYXR0Qm82Nk9WTlN5aVFIMXpVU1BQQ1EyZzQ0RzROOEt3Y0dYVmdo?=
 =?utf-8?B?end2MUdDQWQ0OGJFMEYxTWVLdU12VUJxWk4rdkQyRDJjd29RcXphdXpMck9u?=
 =?utf-8?B?bkpvY08vdjBleWlnd3FHQ3BYVzdrdmpuM1hMRExqbVBhcHFnTU8zdXlGR0Ro?=
 =?utf-8?B?ME5wRUtENVFzR0xiVlVNMFNldWNLaGZFWEFranBrUElmdGNKMkE1QmQ1b3ha?=
 =?utf-8?B?T2h5Y0VlWUFRWlI5OC9SS1lod1lqZklrWmQ4ZTI3ZlBtQ1p6WjBoWVhBTkhu?=
 =?utf-8?B?Z29RSTBtVndod3VOL0IyeXBpNzNoblFoMTk3ZzBFZ3FYbjI5NWZicjRjQlEy?=
 =?utf-8?B?cHY4bXFiUXNpU1llcU9rZkE3SHppVmJ4RmgwWFZyYm1QNTY0MmRJWSs4VU9Y?=
 =?utf-8?B?bWpaUWkvR1VxY3IxaU8zYUtyY0NuYVlqdXhycDJMK3BFZkVyZmgxQUR5QzBR?=
 =?utf-8?B?Mkp4RGtzWFhqSms3Vms3OUU1ZXRFL0lLalBIWi9HdDlzRjV2c3JQQmhPOVhi?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cc10d2-77ba-42cc-2a37-08dd771ebf38
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 04:26:49.8991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLQlJ1j0sg7SfmK+sXYbBzdvDZ5lPcO3FuWX4+VJzYneTCnGjD+vu/SQrMz91IZQa7UDirp8cKyEOykgZv3eQ8UaRZl/6usmcPRWOD+4xo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7024
X-OriginatorOrg: intel.com

Cedric Xing wrote:
> This sample kernel module demonstrates how to make MRs accessible to user
> mode through the tsm-mr library.
> 
> Once loaded, this module registers a `miscdevice` that host a set of
> emulated measurement registers as shown in the directory tree below.
> 
> /sys/class/misc/tsm_mr_sample
> └── emulated_mr
>     ├── config_mr
>     ├── report_digest:sha512
>     ├── rtmr0:sha256
>     ├── rtmr1:sha384
>     ├── rtmr_crypto_agile:sha256
>     ├── rtmr_crypto_agile:sha384
>     └── static_mr:sha384
> 
> Among the MRs in this example:
> 
> - `config_mr` demonstrates a hashless MR, like MRCONFIGID in Intel TDX or
>   HOSTDATA in AMD SEV.
> - `static_mr` demonstrates a static MR. The suffix `:sha384` indicates its
>   value is a sha384 digest.
> - `rtmr0` is an RTMR with `TSM_MR_F_WRITABLE` **cleared**, preventing
>   direct extensions; as a result, the attribute `rtmr0:sha256` is
>   read-only.
> - `rtmr1` is an RTMR with `TSM_MR_F_WRITABLE` **set**, permitting direct
>   extensions; thus, the attribute `rtmr1:sha384` is writable.
> - `rtmr_crypto_agile` demonstrates a "single" MR that supports multiple
>   hash algorithms. Each supported algorithm has a corresponding digest,
>   usually referred to as a "bank" in TCG terminology. In this specific
>   sample, the 2 banks are aliased to `rtmr0` and `rtmr1`, respectively.
> - `report_digest` contains the digest of the internal report structure
>   living in this sample module's memory. It is to demonstrate the use of
>   the `TSM_MR_F_LIVE` flag. Its value changes each time an RTMR is
>   extended.
> 
> Signed-off-by: Cedric Xing <cedric.xing@intel.com>
[..]
> +static struct tsm_measurements emulated_mr = {
> +	.name = "emulated_mr",

I think the convention should be that all consumers use a common name
for this common ABI, similar to a sysfs-class. So, I would say set the
name to "measurement_registers" inside tsm_mr_create_attribute_group(),
and make the "custom name" or "no-name" case an isolated corner case.

Other than that, thanks for taking the time to build this sample it
makes the reviewing the implementation easier and allows for some ABI
testing.
