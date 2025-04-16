Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEEC212B10;
	Wed, 16 Apr 2025 16:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820306; cv=fail; b=Bb6WH0lgWoygSRQ0dmwC5uYHoEw3fWlaBpimwgR561WnFrn0OLbQMVZRsfk71BhtrpvedSkkWY4ZaaHQtw5IcidVgFKkeOQFwzuoNM8K/yHXuim8esJbv1FVY2QVkakYZUxQnmNTN6NZaYaVm4IvUPLOMNeSZDBFwUsEK7uXnOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820306; c=relaxed/simple;
	bh=Chdn2AXOtohRHHTlNQTW6/MI993YwNBJZHK1Fzpy5rE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ihBkW7nNhdJ0fbHD9SWHegULhrs4YarNzVXzDJhB0q2Ie5VRACM416aY24fVyQeNf3NyFQl9C3ePREDqL/iz3Mgh1t5HwBmt6df0xenIDec9FS36vglrbjncdBUVDOi4FnFo+6pJ2PYz+lSYV0DjvUOGkJAhTrO/2cR/ZzH66xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nq2zNjtk; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nq2zNjtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744820304; x=1776356304;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Chdn2AXOtohRHHTlNQTW6/MI993YwNBJZHK1Fzpy5rE=;
  b=nq2zNjtk3ZD0BlfvPM2u0B62a0iL6Xt8zgqDL7+iOtAnscrNbOs2ArX5
   GOS3nJei0DLp0ki8Rjse5Bww9NajGvKg8FR4TqBSoaB/UzUtWr5Sekm5Z
   /yV0ALXNxRknM4mFUhjqEpcEK4ACtgR3jJWAf6KdNxtqC7HAvkw1yLM+z
   vB+2ATBcfoiC/pWH1ecrZnyeUzjfoxiJVIgRw2SdCie6LfoaRU2aCCZSh
   Zb5GgCHDjy20ilrSr8OMrMqaCDIkPMIQH3ikyFqB2Md90vD4BUiPEF/DH
   alYCYvK1ohveRVpt2N4o+Yx9ijVmIZNSSYkzObvJVVUo25WsgLcipVYza
   A==;
X-CSE-ConnectionGUID: 5q6iD5o2TWycjNgd36F8mw==
X-CSE-MsgGUID: y7JOgSHUQPORfj701QjQ3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50186142"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50186142"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:18:23 -0700
X-CSE-ConnectionGUID: SIbgDUcpRS+c2Gf1tbEvnQ==
X-CSE-MsgGUID: loLqzfZ/TSWcnldhGNqcRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130843993"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:18:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 09:18:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 09:18:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 09:18:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4VaLXXOccug/zSKKL/aBH3f62qal8i7guCkXIT9EauCaEDwJWfp31cokz0+dQWQMdkHtHBB8oiTyFJgzpbvb3jTbbVxOYs+jQg3HGYokC7/dTgNFx+Oi7diss93cg9/oAXJOujGpjxO6YW5eDIGHeaHPjZQfCQIplfzNOYU0fplDnpkIC54Dp0aAE9XDZqtrflPZBbqcu0O3fVp6uoy2poyuipbJTYP919vxmMFTRkN7Y/7ENRJ2uu2PoRyL7bdKcl0xaeGqTxHmFN0bFbrNUZGQX/8cdCQoad0ldcTvKTnY6K8TTJLcoPs+Ejqfz6KNI+yun7TkHGFkmAsfqiQwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9j4FeTpyMQywWZ91b865vwEK8uKKtUqBZ4UOt3o2A8=;
 b=kboW26iCLNRK1qS0XkzQ0jaQF3KrsJrejVAMeFMDW6qWc5puTohG9Z7p/bnNzXhvHwDntoWaDbWW136W2+10BEuXHZ1McVTcbnLv+1GdTblg+yW45HyjynLyz5/LE/+TK1cXP5EGJ8sWVhxJ+IBCIfXLnf9NfyrcSfm6xP/VexxuCAaVxxWmRSDTHyzkm/MpegFpGq68xVy890Bw/xp3MhrHXHz0dGGWZ+ZYZ6IAvFpeYDcA+VEu4TPc3nX0ZOteWahPbQMlSv1PC2o2B1KN8HwNAa3pQneNt2M06T89a5n/NlAAIvtYpLGTH8+q+rC85PRUXE+MOBOBDVZRMDIstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM6PR11MB4643.namprd11.prod.outlook.com (2603:10b6:5:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 16:18:18 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 16:18:17 +0000
Message-ID: <5cbd73c9-421c-4147-9922-29123f011882@intel.com>
Date: Wed, 16 Apr 2025 09:18:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 18/26] x86/resctrl: Add default MBM event
 configurations for mbm_cntr_assign mode
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <03cfb41a0b2538cb994fa0c5b0950b7280cf2eb7.1743725907.git.babu.moger@amd.com>
 <8c3aa9cd-335e-415d-a9d3-35593fdbe812@intel.com>
 <15852d2a-5a44-4d15-aecd-d28660a40a85@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <15852d2a-5a44-4d15-aecd-d28660a40a85@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0311.namprd04.prod.outlook.com
 (2603:10b6:303:82::16) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM6PR11MB4643:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e3aef5-9a58-49b9-3a6c-08dd7d024c07
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFM2d3RubXBWYVJpeEJIUTJJQ2puT3EwSXNZWkE2ZlNXdTgzMUxBTzJ1cTBU?=
 =?utf-8?B?elRibjczZWdYK1R0TGdaaUg1ZGd4azQrZ1g2TXNlZFpRUjNmYklFR3Q1Z1RR?=
 =?utf-8?B?bHZsNzdyVnp4bWVydFdHRzdNcWlrN0FNc1h6bkw0QkJadWE1Mk5IUm9YK1hM?=
 =?utf-8?B?SW5QVk5sNy9tMmxCLzE1Tnl3QXRzMkN6ak9RcUN0alRuYmVmdEg0VndlSWZ4?=
 =?utf-8?B?WFlEbjQvV21kWmJiRGhPTXIyVFg0bWVkUElhd0pLd1o4V3hVbFJRL3ZJS2VN?=
 =?utf-8?B?M1B4eDhxZkViZC9DTG1XTkpoWjJPMG9RNkU5ZmtvcVFIZnRLSUJkRFVEUjRE?=
 =?utf-8?B?NGFOU2wveGlGOVVwd3RZcTdyQi93bW11Nm5yTTNEblJzc2FRSnZSMzdnZm1U?=
 =?utf-8?B?VmdpMU1mbjEwekJ6cVZHR0JFOXpMUk82aWdvcGFFTTlOWktMRzNhTmlHeVVk?=
 =?utf-8?B?QmxJN2szSXlkYzIzSnd0MFJScDRxeDhwYzlvVFNWUHJmS3BZWDJBSjgrbTU1?=
 =?utf-8?B?R1RMRTZadGV6bkRCTm1UdTdUZkdRWjhueTM2KytIOHM2OGdjM1pJYkdSakgy?=
 =?utf-8?B?aEpUbDNacEtJZnYzWGZrbnRxdUZhSHBFenBDWUs1WEc4dXlMc0JlejBtMUgr?=
 =?utf-8?B?SnNJV1k5U2RmRytBS25lWDBIeGxzZVJmRlV4SHpSMVZrYkYwRDlZK2VkQ1Rm?=
 =?utf-8?B?MFdSVS9sbWlMeE1iWmN5NGhQUlZsbWRzbTlkcHQ5ZlBnN0MxRVVGcW90UDlM?=
 =?utf-8?B?ZU83U09sRWVOcFZpOHhxY2hacXlTVHF6YUJJMUdqVTkvT21xYUpXM0dIZ0pm?=
 =?utf-8?B?eWJack5VVmhjNjFtSUczYWNKZUdnSW16QTdJNUlOTkovbXJwdXZCeWdxQWww?=
 =?utf-8?B?UVg1b3Q5cWJ5NWlwSUd1M0cxUURRQTBPWXhaOTExcHdNQmJBUktjMUo0ZXI4?=
 =?utf-8?B?TVFKSFRJd2x2a0c1RnZ2bkc1dW9BU1JScjlwYlk1OXN2T1NGQXNZaWM5Mldz?=
 =?utf-8?B?eSsyL2NVS3VxeHRKTG9vY2hQaVdtOGlheVRydjlpRkFDWmI1T0ZlRkQ3RGJh?=
 =?utf-8?B?eDBWVFd2RG5tYllLYm9iRFVERHVFM0t4eENQWkx0Zy9jekVSRU5EU2p4Uys3?=
 =?utf-8?B?am5neGczNnBuUnlqTkxhVlZrcXIxSHdxdjZGWkVkZ2FlMzdKdHdRYkdoRGlZ?=
 =?utf-8?B?bEFock5Sd0lmdnVjMnpOYlA3T2hBSFQ4ZjhhMG81cnZjVnQ4MXlBVVVKcHIv?=
 =?utf-8?B?SFBEeGxkQWxSaVBOYktPMFhwdTRNSTZFV3JsMkt2ZW1hUnFROXdYMHZ3ZXVV?=
 =?utf-8?B?OUs0ZWRLb0hST0VEekZaRnB0bSsyUDRocURhY1BEUmRISE9SQ01qMTFBTTJU?=
 =?utf-8?B?aXZJaXZYMUhWck1IUDJPM0JxUDlvZUFqTTFrZ1pEWDVpcHEwMVNXd3cwczdM?=
 =?utf-8?B?em44MmNwbXJWeWRyWVVWYU8rMU1XVzRPMkQ5ZVZKRG5EZkxweHNodTBZWURa?=
 =?utf-8?B?aXA1OWxNUXhaT09NTVR3eC9UbWhvTDJPajkrazBqell4ZEpTTnQ1Y0srNFoy?=
 =?utf-8?B?MkVxb0NsUmpvT28wY1p5azhmZ0k5ZnliTThtYm1DRDczdXJIdkV5L0F2N0Z1?=
 =?utf-8?B?elFrSEdkK2ZBV2tVMnNiZUl0WTZZTlZWRHhaRnRGT1NsTlpycUVTcU84MGxv?=
 =?utf-8?B?ZGpkRlRzTmFLN3ZkYjBLS1NVZHB4cDZMVm5QTTBnYUhDT2J5ZkdMTGFaTjFU?=
 =?utf-8?B?SEVneGd4dXZvNUR2dDI0NFdLNWRqeUVUd1FHTlJNKzdialpvT2RHd0RhYkhz?=
 =?utf-8?B?QnRnYmpqSGZlZERkWFJDU1ZPY293ZVdjUm84QkV5N09zOHhYLy9YWi9zV3Jx?=
 =?utf-8?B?OFpGUlJvY1BlcUYxK2duYVE1UFgxb3c0REJtSVlGRGxLQmxqOFhJVWFoOXlB?=
 =?utf-8?Q?+hGp8MugZPo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3U0d21Rb0VBcHNGcTlvQjV1Vmw2TFFOUHU3RGgvdGEzRmE0ZWthdHRIY3Nw?=
 =?utf-8?B?MCthY0ZZVDlPL2JVOFBZYXR6UzJGYUUrK2hBRy9MSFh1Ui83YVVjMk1PcDJN?=
 =?utf-8?B?UDBvNzRReDE2Qm9YNm1QdFdZejZsVVZhdXl1QzJQL1hjekNLMHJGeEh1eVZX?=
 =?utf-8?B?RVJCRlZyRWN6Y003MXJYUnRWeGNxeVpaUzFYS0JOWWJjM1VIZjVSOTJyQlBV?=
 =?utf-8?B?YVNJc1FJTGU5SlRSdDU2OGt0M2ordGpnZGQrZzBSUTduQXd2Z1h4cWFqcjli?=
 =?utf-8?B?S3VuUDZ5ck5lR01PMnNTdjIwbFMxYVRtb0pIN1RzdVpXbHNGamxURTZrdzc5?=
 =?utf-8?B?bUVlQUllay9TZ1V5Y2pNMXExc01ISVd6WDFTcXVvZzhnWDhaTFE3U2J0dFV6?=
 =?utf-8?B?MGUxSUh1UHprRXZER3J4aC9Ta1ZzaE54TGFLNmQwaG90cnZacDBtSWNESEo2?=
 =?utf-8?B?a0VvSmZlUm9SeWtLT3hOY2pWMlY3WDVYZ1owaDJXUlpqTmVMMGUzM3k2WWV1?=
 =?utf-8?B?d25xSFRNRWxSWkplU2N4SHVpM3FOckltS20raDhPKzJtbXlzUVZWdE5uaExr?=
 =?utf-8?B?WUJYcXpzZ0ZqalN5OHY4SEZRelpRRjJ0K3ZJZWJpZTV4T21pUGRndGVxRUhL?=
 =?utf-8?B?TU5mODVZdGZjQThtMm4vZDZWU0pZWVZvS3B0OXZyVkNnU1g4MVRLNUtsZFZM?=
 =?utf-8?B?OE9rbHNUVmEzbzlFTHVpOVFpa25xZGpwSlBTWHpCaDZ1Y041VzNKbEtXNE4x?=
 =?utf-8?B?UmNQYnhCWE96b3VoeDdLbEtGZERPREc0TzFXK0Vwa29PQmFiazJMZ2FRVXBE?=
 =?utf-8?B?aFl5SUFud3ljZjZJUjdDVzFrOFZyMjJ5RDJXZFo3NUZpV3g1V2N6UjVqS0Nq?=
 =?utf-8?B?bDRFdHRsQUlNVnFRaHM5ZkdGU2RiMW9vUFl6MGQwM0NYY3p3N2xMVHJuOU5G?=
 =?utf-8?B?bUg1dVBLM2toM1lCblBvcDNheEs2eUNEdDdEcXRNeEpOYjBQSTFjVlpialBL?=
 =?utf-8?B?UTlmcU9xOHlHMytnVDBkWWVoYWtRellOVUNzc1J1eEZQQUJzZ1RCb0JqejB6?=
 =?utf-8?B?NTdIOWxGU2hqYjhJL1FZQ3VCdE9GQWNmdnBUQzZRSlJKMjNXSS9POTBBZkxZ?=
 =?utf-8?B?a0dhdlI3aUl6QURLNklJYzlFVXA0bFlHWjI5Z01sWVlQV0l3d09rYnZuM1Bi?=
 =?utf-8?B?bzdpRWFhMlQvc0oxWVp3dURaSVFEWlYycEhUcWx3alNLMGtJV0MwQ0VwVmpJ?=
 =?utf-8?B?VEo5dFU0WFFRejFCUk9aSTkraTZiR2pqTkpyT2UxZUFaN1Z4cVNHaUw2NVph?=
 =?utf-8?B?dG1ROTdQejlPeEN4NU5vc1hpMTZObFdnaHJlanZkVE00RTg2QjJGOHdycmEz?=
 =?utf-8?B?UGdTb0RRQjFLNElveFJpVXhGKzZ1eG5SamRJMGhmRDJuQS9ENVIvOHJkVkRC?=
 =?utf-8?B?cnZiSEhTbmlmSm45TkVxNXlNUUxsSlBMdnhlNEZqVU5BbklUMG1VOExQZnk4?=
 =?utf-8?B?aWJZOHE3TnJ2TzFkUVlXZzlqdVZrQTBSNTdiYis2NzB2OW02UmJwSlJVN3Vk?=
 =?utf-8?B?K1o0aGVhdVZsUUlsMEhaeFkzczd6TWRjdzV0UzNyL3ZtRVdqRVRRL2g4TzNw?=
 =?utf-8?B?WFkrcTRkZkNQNE00RmZBbXl2MGQwL3c1UENoN0EvSStsR3V4ckhCL3pYZ3ZV?=
 =?utf-8?B?bEF5ZTRKdU00aG5oYzRLNk1kSnNNVHJSWFpZQlVzQzMvRUZGd2htdlUxWlAz?=
 =?utf-8?B?a2k5WStlOGptMjNZWmxQdndmYTFyd01kVjR0QnRJSFBXMlRsdVQ0NWxlVU1i?=
 =?utf-8?B?WVd4djhVNHhkY01QaUpIRFdqK2kvVFpKU0xoZzJPdjcyWHc1SDhuSzdSTzRW?=
 =?utf-8?B?N09jQm9QcWFjVjRHN3FQNFhjdVNDdW1wQ3dHQi9mOW9ReGowS0ZWUWlQYXVR?=
 =?utf-8?B?YkNpTVRzb2ZGR0V4RjFsS29FaEZFbDlkV24zMjY2Nk5zbmZsN1FaVHNzR1Zs?=
 =?utf-8?B?dUdqRy9wZVBwN2hoY2loeGZ2N3IwazhhTUs2d3dOdU1XU2ZzRzQ2dEtyWG0w?=
 =?utf-8?B?bmpIeXN1eElKYjdEbk5GZktoUm02alNLUS9iVWtnL2dXZ0E3ZURmZG9qMGpD?=
 =?utf-8?B?eml3R29BTGR2L3ZhMm5Oa3k2d3lzaWZVMUc3dU5wUGRTWXpYbHJ2Z2syelpk?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e3aef5-9a58-49b9-3a6c-08dd7d024c07
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 16:18:17.7989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZBl8xngYkuPpaddVi+CC7vSB4j1RxzWyXqvv5cPTXQiNMHLtDNPBSFUawW1tTUnE2PBVOcjiY0qtX+Gh+0pAZbjwP8ACF4lykn5+EoJCPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4643
X-OriginatorOrg: intel.com

Hi Babu,

On 4/15/25 11:48 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/11/25 16:44, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/3/25 5:18 PM, Babu Moger wrote:
>>> By default, each resctrl group supports two MBM events: mbm_total_bytes
>>> and mbm_local_bytes. To maintain the same level of support, two default
>>> MBM configurations are added. These configurations will initially be used
>>> to set up the counters upon mounting, while users will have the option to
>>> modify them as needed.
>>
>> This jumps in quite fast by stating that MBM configurations are added but
>> there is no definition of what an MBM configuration is.
> 
> How about this?
> 
> 
> By default, each resctrl group supports two MBM events: mbm_total_bytes
> and mbm_local_bytes. These represent total and local memory bandwidth
> monitoring, respectively. Each event corresponds to a specific MBM
> configuration. Use these default configurations to set up the counters
> during mount. Allow users to modify the configurations as needed after
> initialization.

I am still missing a definition of "MBM configuration". How about:

"Each event corresponds to a specific MBM configuration." -> "Each event
corresponds to an MBM configuration that specifies the bandwidth sources
tracked by the event."

...

>>
>> There seems more and more overlap with Tony's RMID work. Did you get a
>> chance to look at that?
> 
> Looked little bit. Will have look bit closer again.

I'll study that series next to catch up with Tony's plans.

Reinette
