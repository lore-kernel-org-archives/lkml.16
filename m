Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3CD10F9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638759; cv=fail; b=gLwbRIRvimBJG3bRukdVwh2tuQhTh2gc3S28xOL51Pyy+Qzu3tPdeFgvbkXvfvmU+ziTDdpC0+zI8i+QQyxruKWI23SHNhgKJRhbp0cb4rzpoqq58nduBrtuG0puemd/bXnsGb+sBGng1nM7E9zkbmvA9lFUfwqrVEFHC1jHMio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638759; c=relaxed/simple;
	bh=WeWuAUjez2tS9eaFsz9ivjooK3qPlq/PAREEUGvrzts=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ay5IbDWd50XI3wlM6LriNiy+GE+ZxouzLQE6wC3RR8SLqB9h3/b2aQCfp5b+D7gBwigMfsciC+HCs696FaTHOhyQSz6EbR9PcJUrxInRaJ3RGvhbU8Bb34rKeDaGNJEOG7ErJ7RwPhPqgjOqR3PEDggbGDB3TVlyQyqvTdD5+do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBNP6NYT; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBNP6NYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746638757; x=1778174757;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WeWuAUjez2tS9eaFsz9ivjooK3qPlq/PAREEUGvrzts=;
  b=KBNP6NYTBri8W+PtI+Yb4SKCOm/NdvFHaD9pGvEigy7mDFOgOBrwY60T
   YrSXRiMbfTKEzFnAIXwyayDkoqFawD50fBJ70TGLfmqN+ZfaQLM6mYRMc
   IgVD1oQTzYZkgHzoHS3acsz2y0Flvx5TfurRpUYIMORW4pDe0zIr0BRZ1
   8ID/+kAOr1/+KZNwExq2Z75I+hCFzTvuvOojmIONHSSa1v43qm+BryTMr
   r23weUqP7NJgoSpX4geVIIk5VtxaNxL4tFbYU2lukuxMmXyzxMbh3Yo0H
   jPkfDH9RpS9RC/Jky5pIaNP4YTiJeiJ3gXwl/lf0V4Qnj8FsQLt3z8hht
   g==;
X-CSE-ConnectionGUID: bsYjBEqRT/WF4yepwgv5QA==
X-CSE-MsgGUID: lBzQIbHMRW68SnwZPP27Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51045048"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="51045048"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 10:25:56 -0700
X-CSE-ConnectionGUID: DbmBcM4TTsGzb52R4+NVvg==
X-CSE-MsgGUID: dQSAIPh/TTiyH1UryYDaYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="141225683"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 10:25:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 10:25:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 10:25:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 10:25:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxMAUhm9I/NJJprjBTScrUXWwhhP1Ujb4/ZfCgfCWoFWs9vXrYYq1H1aePeEfazDBeZfc9/5sqVPQmYKAECEKfViDkcqbk2No2iPJ8Sgc55+XpSjd+4A2VJvgVr2+rInXGyjQWaNWFE0EWWLCcSkhix0eC939kFtG1WDQnKMKqlKWL3F2noczut+wIOvjaUgpwanoIMfqdM8PS/oaZM9RYhaaEhio+a73mAayf975JTyxGc+YtZULtgBJwdxQq3Y+N+vrTGGWPgXdsblV0/RuiMFmZtdyKQORNFNJ2/ihAIj5KAKo8bpzruKSP19qTGiS8nKgefy5RcUVL5157owJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTgkLsx8IvCDf2+iHLo1Wq8dwDI4B+Myk9t96ibaX9E=;
 b=aetHixsnJ3ozzS0Hd/AMVr11VO9omEfLYUf+Iiga6f6noSY8ojut6VziuOM0O+OXL/GDdyBFwAT7RB9XKyD566v2xd04AljeELtOZAhMCx2kGhgrZZts3XqHxRdd66ZqmTg6DDVOdxuOaS+bCDszXWiIU6Ou/psr3EkFOlQgYZnYM01HJ1M7bpXlMT+raqIb5TGrpzxPnc7tXrw4WozeW0j8lTDNwDGIbllBEBhoX4QYNQGGAocA0PHS/lsO2tEQOQSp+hgJHrrf7pTDmg++iqGeGUC3tER/jg7KN7oUIEDGnsc2ErhFEmD8KvyeSh1KW7uCXJMxaIf2k9WW2nidIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH3PPFEC89C124F.namprd11.prod.outlook.com (2603:10b6:518:1::d5d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 17:25:46 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 17:25:46 +0000
Message-ID: <b3e31246-52d7-42b8-97f7-35925c85ddb6@intel.com>
Date: Wed, 7 May 2025 10:25:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <dd2b3b2b-84bc-490e-a2f4-2096cb08c84c@intel.com>
 <a3e83058-5a7d-4077-9249-f6d128510f37@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <a3e83058-5a7d-4077-9249-f6d128510f37@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:217::15) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH3PPFEC89C124F:EE_
X-MS-Office365-Filtering-Correlation-Id: 2055b8d6-b850-4e1d-88c1-08dd8d8c33c3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTZEQzVIWDZLZjBPSHJKeDlycE1tbGdpOWNWdFExSk9NVUp1SWZXd2ZpYmFF?=
 =?utf-8?B?Q1c5UmdyL29JWEI0MGNienc3N2pUZk9ZQjYzQWM4cHQyeHo3dUIzUHhrQ1Rn?=
 =?utf-8?B?TUE1MUFkcjRyV2dTYXpRZ2pjVzBGN0NRcDJpTGdXK29DODBWYnBlenoydnpY?=
 =?utf-8?B?bTRuUCt2eGNDQWpyZ3FneTZxV0lyUkVvY2NuZVc4QVRXY0x0am1jRmxhN3I1?=
 =?utf-8?B?cnhOcytpT1VpRmZnM2d1OFpjeVQrM3NjalR6NEFudnNiaWd4eXpHcXRGUkpC?=
 =?utf-8?B?aDBweXJzNTZYOW5SelhZUDRCNjZOQ3pKNDhSRUZZTEJnQVZ5UFEwMjczbGZC?=
 =?utf-8?B?YUdsUjZOSVRCVXBVU3NNanhCU0RQdWd3U29qMXZNcW9neXZXWko2aUhuUGNr?=
 =?utf-8?B?K2dEdHdXaTZVdVkrdVZWWXJxeGdmVStHTzBIb3hEU2g4Szg5T0gweTZQV1hG?=
 =?utf-8?B?UHdSMkpUNS9qd2lOZHBFbFBTenV5YmV4eXhoOGNuakFBWUNkZDhiaTRTTkc4?=
 =?utf-8?B?OG5WcmREam9TWmRTRFJ4MmdvMGQxRXZLNmo2VzZMZFBMY2lEeEpacTBtaXZE?=
 =?utf-8?B?TzJDR0g5R3pyelJ3NXU3SmVoVEdaT0VVNVQweVhSOGtSUTJhbnBmMXdDaUZN?=
 =?utf-8?B?ZS9DamNJR0kycEJoSkNYNkdHclBEWHB5VVRTc0lVeUlzQW5FLy9NL203TlhS?=
 =?utf-8?B?WTFocm5sY0JMVWhBYWF3TkJxVWlhM0xxV2hzZ1FmZ2ZJR0NLRUZxaFR2VTZh?=
 =?utf-8?B?M1lMemp4N3hOK0xiSlIxdmxpT3pIRnJXOXJzYkVUVHhRZkFXL0ZJMVh5dXZO?=
 =?utf-8?B?WEZWeDdpelRBTEpIaWExcGRXYlg3VWtPSzQ1Kzlhd1hjR2xJdm4xZnBpdDY1?=
 =?utf-8?B?TVFCeFpoNCs1UWY4RHF2d1MrOXp1WVYzckNVcWU4K1JXSjRERklxajR5V2RD?=
 =?utf-8?B?ajNaN2dIRWN4ZlJyRWtWb240dGtiMTRkNTllWnNoSE0rRTk2Z2dmSU45SUl2?=
 =?utf-8?B?eWZ4aHJCdWZtQzg0TnpPY3U1eG9kMUVaanY2US81RlVERHZ4dlI1MkNTNmpq?=
 =?utf-8?B?ZFJZd0xpMzVQUUZUZUtSeGhLbWRtK1dsWGFSUGI1ZlFuZTJsTlpuQ3E0Ti8v?=
 =?utf-8?B?cXJoMU5FMWxwS0tVakpZM1dJMFJlYzE2Uk1SM0llK1pYbWlVTVdYSjU4MC85?=
 =?utf-8?B?NHo0RTRlUUphYTA5UDJ2RnRWNy83N2xqYzJFTGtsMGE4UlkxYk1kRGVqV1Iy?=
 =?utf-8?B?aUZvQ1ZGUFdtME05bjV5eFN1MTBpUVc5V1RLWVBmSk9ieG9MQy9mbDhSZVpU?=
 =?utf-8?B?TGNxeWp4d2FWYk5lejlVVXJVM2lhakp5YW82dUNWeXMxeXl5NnlXTHdGRnNR?=
 =?utf-8?B?ZjQrRVJQTjJsLy92a3NxNjIwN1ZUZ0NJY05UaDlMQ3R0ME5sUkNWRXUvUWVT?=
 =?utf-8?B?ejZsNDNSYUhQRDlaV3JaN2hadkFIMGxJc1lYamZyM3Jtd0psU3hDSXVnMlli?=
 =?utf-8?B?TnFVOTRPMjBTVXhxcjhQcFZuZTNyWDBoQjFaMnpWUWxQTXZLRElzWWJGODRJ?=
 =?utf-8?B?c0JVeWUyYi85STF2ajk2Qm4wS2swSC9lSGpzSlJsb3hXb2svVG9pR2hwK0tP?=
 =?utf-8?B?Z0wxejU4TzJUcjhVMlgxK0J4VDczZUd3NFh2c1ZZWEdyeWVkRGxZdXJCNXEr?=
 =?utf-8?B?YS9GTFRCVmNpV0d5YmRpc2kzK09ucXVRNHd4S1JXc2lORHcvYkl0b0RIWEw3?=
 =?utf-8?B?SE5WOGwxY1FmQzZrc1YvWllzcytsVURDdWdYUkI4SGE1NFd5M2YzaXZSWG9K?=
 =?utf-8?B?d0VuRmE0RHZqWHN3OTlieXhyWUQyWmZDa0lZdEdqZHVuaWRwQVo4WTZDUWdN?=
 =?utf-8?B?dHB0aDc4MkRNY2NGMG51VEprYUdSTmlnSC8vb2NOT1ZUbWM0aDNIc2hrUFBQ?=
 =?utf-8?Q?22vjs0zTzkg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3N4a1RsRXMxTllRdW5TQ0JYYnJJbHV5MXZXTkk1QnF0dmpnUjk4emtVS3pX?=
 =?utf-8?B?NElGQ2pYeGhGRHBPSUlselZ3Z3UzQWZldVdMeEtPS1NpMkZvY0FINm4yMU9U?=
 =?utf-8?B?aWxBQzc3Sk5vUU1nTWwzUnFtZjdDcHU2aUNjaS9Xc3Q5NHZ1ZFRjOFJ2a3dS?=
 =?utf-8?B?UFUxQ3MyeHhaUDJTY2RmcU12WGc0ekwxMXVWR0s5VUh2dFVtRFhaMUgvcUxN?=
 =?utf-8?B?dHRaOU5XMVVFSlNab0kxM2ViM01yU1o1VmRRbmxCbjI1ZGRqSXR4aHVOQUxT?=
 =?utf-8?B?MWpYSlM3c2pxcHFELzBTWitwNmF4Y1Z0ak9Odk9NRVJ0Lzl4Ym9lTDVYbVZD?=
 =?utf-8?B?ODhld0srbnRyaC9vWnJXbFdjWEFjNndHVEFOc1greVk0MHBRN1NPeWN0a2F4?=
 =?utf-8?B?TXFDVXp3SmJ5VFI1b1V4THJaRnd1Y3dxR1o0dWVkeG94UFJHVlNjR1B0eDI4?=
 =?utf-8?B?R2JGc0JQSFkwd3Qrc0NYbUpQZDZrdExNUVhLVzJQZFF4ZTgzZ1F3alZrSzZh?=
 =?utf-8?B?YzlJSXRWOGpBUTlqaklwU211WGNZaGFYVGthSXlta3lFckpOaFN0WGcyTndQ?=
 =?utf-8?B?WHByc2VxTGttWHZENzdXalF6a0dMeVBBQzdtLzFtYjNUVHVlSWYzd1NPMnVt?=
 =?utf-8?B?RkRTbzEzd2FXYnRVMlBwak9aaTQrblFjb3Q5bmkxQkZ6T0JkeWw3bEhaK3Fn?=
 =?utf-8?B?RDBDYVFoakc0QVNINzRzY21aTXJuVVloVmZmb0ljNjFBZFgzSEFrUmt3Wkly?=
 =?utf-8?B?R0sxS0UyeVpZRnBieFJmd1IwNTdPZFFQc0lqdzZIRDVWT1JqQ0lDTWlJOXky?=
 =?utf-8?B?VmJsa2MxSHpYVDVlRmVCZEJUR2ZiSmdkMWFQK01IZlVRNFFqSzBPMXFGZ3Zi?=
 =?utf-8?B?c2xuZlJ3NUFmUHBlcTZEWkJ6dzBmVDNRRVV6V0dYTDdxM21iVGtwU3llNUtm?=
 =?utf-8?B?WFhZU1FJTW5Pc2J6bXZUdGxKSEJTMGZNNTZJRUQ3S0R3TzFDTTRyZkQ5cnJB?=
 =?utf-8?B?MTJIa3BNTTNmcUhDelVKeGgzWXVuSnJ3VFpZTWhwVVM3M0N3L1QxWlNVeUE5?=
 =?utf-8?B?NEJCMzRqU3VRNHkyQ0Z3ZkxoMWpoeC9kemkrblIyMTVoUG5FMVFBV1FzV01D?=
 =?utf-8?B?TzRhU3VITlYrTGtCSkpKZzF6RkFsVVhGNDlqV3hSWlZhTUFZd3lnTk5nUFov?=
 =?utf-8?B?WHk3WjZweFFvZmhLWU03cm1UNUpZVE5YMDBCSWs1VW1IbkRKUzlFcHZzWW03?=
 =?utf-8?B?Y1NnODNuNWRuNC9xN0N6NTlFb0xSS1I1UERaeVdRbUkxN1ErdlpLb1BIeGFB?=
 =?utf-8?B?MG5URWhSSTNDTnNKSVR2V2Q3VndJT0VXeEJxU2JyN2dEVC9xNjR2WDRBZE1O?=
 =?utf-8?B?aTdsemRtS1NsK3l2L0dBQThxaktPNCtOUG9PQUhvaUFCLzRNRUEvOEppZmo2?=
 =?utf-8?B?WVlYa3h2eGRNNUdBdzk0MDZKVE92MWtDeXVZSFBGNVVGRFZHTlY1eFZzR3F1?=
 =?utf-8?B?S1pBRVJGUFoweFdlNHhKT3lXbGpudEJjLzV0MDl1L2FHaG5VQkxHd3o3b0ps?=
 =?utf-8?B?Ujl2b01NMTl2SURhQXhyK0d4bXlON1lnMWpLUkRoL25TdkFjVE4xcTg5VElE?=
 =?utf-8?B?ZXpJOGpzbTczWG12aWgwMkl1NWdFZ2w3YUZjU1ZNeUoxaWxvWnJtRjNmNjh3?=
 =?utf-8?B?NEVoLzk5TURQTEdJR0ZkaXZWU3NkQ3JuVCtMV09hS2hZaEc1RWd0bjZTN2c4?=
 =?utf-8?B?MTZUakFSZXp1K0loY3k5WU9KTlZLQmJoYWRnMmo2djRLZm16Rmt5VHJSUFJU?=
 =?utf-8?B?cXgxQUxPay9KaFBlL29CZjB0VmZKa2JtcGFYZlprRlczNlRoTmJBdEMycjhO?=
 =?utf-8?B?enhqUTMvOWt3TkU5UlZDbzRlZ1JpKzBsRU0rYWpYbjBUU3VUdzRYcVR3aEpy?=
 =?utf-8?B?NjVJU2lEb2pYVWFIdG81RjI0VUkrUW92ZjZVcXFiRGRhZmgvSUJHcGZkWkNq?=
 =?utf-8?B?Qm1qTUMveWNmQlY4UTRzUXZWbjhBMC9tQjRXYUNiT3NHQ05JQXdQMlE3M2pm?=
 =?utf-8?B?amlaMGV4OXAxZnRQeE9NOFlUWjRIYzllODJpQzFacEJMK0dVdldnODE0aWpU?=
 =?utf-8?B?a3BrRGRBRnlJcTRBbEc2aEZ4OFY1ZGpkSXNsOGxNbTdTWW9sUlBnUnAxZlcr?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2055b8d6-b850-4e1d-88c1-08dd8d8c33c3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 17:25:46.1061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQeTU9ix5h2JFPIlHt2lNtogfOz3OjlDiqpV9+0hqSyBznPN3Q3Won0lJwccO7SrbyK0WgLgMUK7lBl1alQ1iVQPf3VucHG359b6v9fQHuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFEC89C124F
X-OriginatorOrg: intel.com

Hi James,

On 5/7/25 9:49 AM, James Morse wrote:
> Hi Reinette,
> 
> On 01/05/2025 18:51, Reinette Chatre wrote:
>> On 4/25/25 10:37 AM, James Morse wrote:
>>> Changes since v8:
>>>  * Added check for closid_init() on monitor only platforms.
>>>  * Moved end-marker into array and added default cases.
>>>  * Additional patches to move prototpyes between header files.
>>>  
>>> Changes otherwise noted on each patch.
>>>
>>> ---
>>>
>>> Patches 20-26 should be squashed together when merged, taking the commit message
>>
>> To make things as simple as possible this needs to be as detailed as possible. For
>> example, drop patch 21, *then* squash patches 20, 22 - 26. Having your repo as
>> reference is a great help.  
> 
> Ah - I thought I'd deleted the python script from the version posted!
> I'll tighten up that wording, it should really say which commit message to keep too.
> 
> If there is unlikely to be further review for those last patches, the other option is to
> do this for v9 - but point people at the earlier version if they want to see the changes
> broken out. This saves some work for the tip folk.

(v9 -> v10)

I do not know how much tip folk have been following this work. I also believe that 
any version should make things as simple and straightforward as possible. To that end
I am concerned about requiring folks to compare versions in order to understand a posting.
To me it sounds simpler to keep changes broken out. Personally I think squashing
clear broken out patches is simpler than trying to understand a bigger change by comparing
it to a different version of a series. Of course, this is my opinion with caveat that I
am not the one that will be doing this.

Reinette


