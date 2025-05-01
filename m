Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458A520E026
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120489; cv=fail; b=a7+owPapRnCBpabSSj+Y3zqXagb2YqDQ6nK9SXvwPOyzNn2CKgIVDZtL/U4w4vdfIczbZJgCl188oQi9CqGZ5+pbdRCVJ4+EK2vKriK+DlkNvOOWqkT2D3dxxzlA/xfXnEoz7O1u1yuKMIye3FqI83dkZHZJTBAnbuwIitZdC3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120489; c=relaxed/simple;
	bh=otOwXgXV7ZraY/oblhxJmZTIrj9T3tePIGI0yNlU7y4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rpglXOLxP4zPAJ+Uux3Qbi536Norkse5y66orCs4OUUlKSGfduOrO7lgU1On4YN/L89CwlqYe9vwvz1gdLSxL9lzhQmfqbWvadA5IM62a7/mBhVtraZVT74oOrdzOceaHoS9tGUydWDeaP1T6tJrEplmbp87qqi+p6zEvrIpURo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3LGa3fe; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3LGa3fe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746120477; x=1777656477;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=otOwXgXV7ZraY/oblhxJmZTIrj9T3tePIGI0yNlU7y4=;
  b=U3LGa3feJhV1HkrUjC5CwRKDtKbQo0sWe22g23lb5BJs6xycSNBBsW8a
   kzUPqTCENksJi/wSprKu5UfJNtUDdfFQe8a3fwlAsMkK9S7NBIbgL4B/v
   sXEiAhB2Wf1Q+6SD719e4likWJqqhgZNo+PxMKD0i5m5rdukxzX/+Her5
   9jQP2VXCr18KipkDefxfkEAgBzurLZNYjWYquUd7ru/DMO+zFcpSHgGSI
   xODfxqyEH0UHf3kPWWqyu928lglMICO1kQzUVBm+XPtCmGUS/guN3Z/xn
   QthNwfaYma3iyH1eA1dHXmst6KTYRb8uTS8opr/PRqefcvdXfynKBvu4A
   Q==;
X-CSE-ConnectionGUID: qkjQP292QCunEai+gQ7tFw==
X-CSE-MsgGUID: yQ4eFNkmTWqBdTiABOE1lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47709772"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47709772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:27:56 -0700
X-CSE-ConnectionGUID: 1EME8Ax+QIiM6ZoST4F+rQ==
X-CSE-MsgGUID: IFeO7y86TEKLh/pbWCHrww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="139612382"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:27:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:27:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:27:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfCr0K5RUoZyddx1vNrbcL7RIjWEHSNH9u/mXMi/AvfCdz2X+jUhcQ0/MDxkyGaxOmI7TI6jSL0PHWU1HpEdRyTmCksp+UvmL/nGcH7Xbcjb+jkPy9WoMNOKOwnq7vRVKc63fculNiPBnT6QuqB+Aq7eLjqm0HxP75MFSn+JiWz52GaFHpwL+zoM97Gmz7wV7WB0fifSjZQnGOXR+CNjkN4ljjXqXOHNKJqzXqRU6UPjZV5F0kQMIY8WgMFAbs2G8aveLImCKyujvBxbhoXRz/r+bkNuG1iUcM8+hFRawFmNr6gs4ZhCiEdJ2qpbUPYwbdm5XjCUdlFc57tkthDgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsbSyCt6UQD4A5/4BupI03YDgO/fN8gLWWF93ZhYQhA=;
 b=A3CnYtdaDBFbGaPjVru8ZBU8uVsD9CFCPCYsVnyOa4WzuqREeFUXFacsq5bVbvkl/N4+W/X6Iajq9IRN1KmnqNqeqL+4BxFmT9M626yjyRpg5J9YrODq0ZTqCE2Xrx5ygukA2pHF5soK5r2lAakAfjUEO1hQd25AO3/GWpeyjgRjj5RvaWv8UHEoNsGxRTfIOAL4+GGL8zGZq+Vc4b8p2442wYPLFjGSz0c9T0ewLNht1xt0k6q34IbFMvT5Hj0uCw1xMaZVojCIwA4ZpHbYy9+oIfGnOh3Gz1Fo2C/GYZ46LHPKKWk1QgY/59GydFAarTFlZGhHsMZad9/mgyNlNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ5PPFE62D2CE76.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 17:27:52 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:27:52 +0000
Message-ID: <b29fdd2e-56a2-45ed-a82c-1a154b02846d@intel.com>
Date: Thu, 1 May 2025 10:27:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/27] x86/resctrl: Fix types in
 resctrl_arch_mon_ctx_alloc() and free stubs
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
 <20250425173809.5529-15-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-15-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0299.namprd04.prod.outlook.com
 (2603:10b6:303:89::34) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ5PPFE62D2CE76:EE_
X-MS-Office365-Filtering-Correlation-Id: f62ef978-aec0-4e9d-9723-08dd88d58049
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXAxQjJ6S0tWVmp4ZjZFbU5lczNqRTNvcWp1TTd1Q2puZk5Pa1JEVUxOMmtP?=
 =?utf-8?B?RnNndWc2VmpYdisyVTFtemRrZnRmVzBDSGVmNlpBZTVjN0xkdG5rc2Z2TXpm?=
 =?utf-8?B?R1hFb1FRS1BPWVFyazlLNU91cmsxOEtmQWpBc3Z4NVkraG9tdTdXZlc1ZkNG?=
 =?utf-8?B?UU1CWXZkSnpnZVRFWWpLMGJXSTEzMFJvQ0tYOHh6WVU1NVplTk5LbHpCQ0Jh?=
 =?utf-8?B?MlFUNEJLMnRUcmZ5N2MvcWlLdVlrTHF2NUhTbC9KYmY1QlBoNm04b0RTdmww?=
 =?utf-8?B?VG01dU15ZUtBUHE1dTNwdm1LYTd6cEtvem1lWjFWYld2YmJLNWZDR25aL0wv?=
 =?utf-8?B?ZU5DT0xWVUd4OCtQWWo2NUtybHZuUTNlalRQQm9TMTV4eUovUW53VERhMzBE?=
 =?utf-8?B?UlhIYVZKcmNJNWFLd0FDWlZ1UWRibmM0MlFhOHZIY1NvRElpZzhCSWx6R1Av?=
 =?utf-8?B?bkpMRW03Y3ZsOEVZei9KOUpQK2orZ2pvQkdNTXhCRUdNNVRDcC9rdytKZEJv?=
 =?utf-8?B?UURzbjAwMFE0bnJ3WWJiM3FENWNjUVQ3cWVtdnd6ZUhNbE43eS9iZVhwcHFK?=
 =?utf-8?B?YmlmUzFBVTVybjhJR240OWJXZ0ErY3UvSkFCM0l1dktOeHhWeURBbTBKYnpu?=
 =?utf-8?B?L2dBbm00YVljcHlZSkplbm1GRDc2NGRZemM1RDl5WnRLKzhlK2JWZnRYbGRO?=
 =?utf-8?B?enlqR3lsay9acS9FRDFodUl0UGdaSHBmYXpBNmdXQmxCdHlTMjV5RlVUTjQ1?=
 =?utf-8?B?NkdVM3NLY3RBd1laVFNCZWRDKzBFcTJzaS9OenBxZjBQU3dZOFl6WldDVVFz?=
 =?utf-8?B?cDlGVEZBYUljVzF1cVhXek9ub09Lcm9nSmczOUZpeDVwYVpQTWtmbUxVTTVx?=
 =?utf-8?B?Kzh1MndXelQ0TjhtS1RPSk5qelRMSUpBdkVGRFlNSi9VdzZyeXJ0eExWd0FO?=
 =?utf-8?B?ZXgwYUlzdnl0TU80N1ZXbHVVeHJzY2xqNkNxRFJzc1BBSmpFaXQ1YUNrTkV0?=
 =?utf-8?B?a0cyVE52WTNnR3Q3N09rdFk3ZWhjYW5ON2pSbTNOOHhhcGFGQnkxbWJuM01G?=
 =?utf-8?B?QTlQRFhQb2h1dFh5ejJlcnp3M3kxUmZGRXhLNlkvQ1gzaldZWjJkVGhMcHRK?=
 =?utf-8?B?L2ljWG8yQXhodWhyNjRhS0JsNkF3cUFPQkZWRmc3ejZnS2MwUEdnT0hrd2hn?=
 =?utf-8?B?T0ZSdW5EZ2s2T0FLNlk1VEhveHdJZUhJK09vbmNGWkNvTHNxWTF6Y21YS3BI?=
 =?utf-8?B?V25WdWg5T2E3WWZCVGowTTVUMkl6M1dhaDJpNlNubCttaFRuOU1kOFlRa2tj?=
 =?utf-8?B?SktVcE1rWGlZVFVRajNIZldMZ0kySDNyQkpzM2VoamRsRk9maVNZL2ZFQlMr?=
 =?utf-8?B?VXk4TnlYdWc1RStiU0wrZTA5RWNDQ1ZKSXdVWHRWNWN4WnhtL281OCswdW8x?=
 =?utf-8?B?bDdNV3ZZTzJVc2hOZzJoQ2JEWkZrRTdySGRveVUyUEpsLzRSVDhKd21DZ0Za?=
 =?utf-8?B?eDlHL0RiWlplSEI4dk5PQmNYQ2lHMnM2MXdBRHRiSWdRWHpFMERlRFBuMDl0?=
 =?utf-8?B?Z1kyMXlQbHdtZ3FjYldSRUxqSXFnUXFKMEkrajdycDNaZ2JzbnR4RU41cUI0?=
 =?utf-8?B?eDVyNTk0aGpiaXdpK0xmNHl6ZUszMHJxMnRLTjY4T0dOemFBT2tSQWxSRzh0?=
 =?utf-8?B?cG9LT052NXQ3bFJyekZaQjJIL1BmQUtFcWYxNm5VM2ZNMkNNVFpOZDZHaE5i?=
 =?utf-8?B?ckVGaFZLc1hrWVNqdVh1eG9hU1hyN3RJRVdydFhpQUlCZ0xFbFkzUTBscnd1?=
 =?utf-8?B?OW1IRXl3VFAweXpvOHU0RytrbFR5NC9OMk5veE5kSHhpRUYySm5GM3NTY0I1?=
 =?utf-8?B?a3dqWS81VlFJSm5JMTg0U1cxRzQ2ZEMvRzVDYVBCa3JzeWljNUtJWlAxV084?=
 =?utf-8?Q?rBuUExOQfd0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVJXOUVIUlBnRUJ5ZVAyaUJPSVZFTHlrelBxQ2FOUFVob25PNWdnM0FlNnpU?=
 =?utf-8?B?TnFKNGc2RWtXa2daK3JEM1hOSDNXRGRlaVJOUkNmTCtFTVpTNzA3VHJqaXNU?=
 =?utf-8?B?MmlqTXVDQ1JVbk5weGVYeWNzRjlnWEVJblVzNHZ5YVBJOHZIejlyM3hSQXpv?=
 =?utf-8?B?Q3RzNllaS0NISlQ4Ny9sRU50K09ORXYwYWRZMFo4TWtCSmw2bGhaL2pFNXNV?=
 =?utf-8?B?VTB6akpHTmdJQmVOa3ZIL295NXNMbm9YUHMrbUZ5Mk8xMmlwZGZKSFYyNUVZ?=
 =?utf-8?B?UG1TZU0zalM4Z0pxZEdISTVibitwVHM0Mkswdmk1allPTVpXcHFCc3RQQ1dj?=
 =?utf-8?B?ZFdNekJjdGpHOXpCNXpZRmlRckpTdndPR2g5QXdQcDdUUjZoSVRzdmpmMjdv?=
 =?utf-8?B?aHZPQm9qWHZtcHZHSDFMMDlqQ1Z0SFBYVkM0Z0wwbUNYQXIrZ1JXT1JLZ25s?=
 =?utf-8?B?WklvR0lEMktvVFYvdWU3dGtsRHlGOW93UDM5VG8ydWZhVW5wakl2VXZ0OHFm?=
 =?utf-8?B?VURheEZDVC8vQ1d5OUtBME0vcmdOVW1oODhPYkxweVJKcWN5Tmh1M0RpeGZD?=
 =?utf-8?B?dHlyZWhnRTBHdW5uMzBUMktCeHRiOFlRbFJxcTBHY2xURFZYdDY1d1BNSHlk?=
 =?utf-8?B?SjV5dkJzcXRrTjRtYWdNU2F4MGxyb09FeEYrRG5XRm0wZEg5VmlsZE9FUTdW?=
 =?utf-8?B?YkwxbzQwSkNyMVQvU1BNa0JIcjNJNEI1NjFjQzJYa1d6MjdmZHFtZTVDb1RO?=
 =?utf-8?B?Njh4NDZQanpBVGtQbTBhZGxTcTJETXNQL3lKaGNKS0dWZzk2ZzB2Qmt5a2Y5?=
 =?utf-8?B?MEJoUkZNYzhMOUtoWEtrMVc0d05TY1Q1cGRJZnVMNGxydzVWWnlMdmY1R3lR?=
 =?utf-8?B?Zm1lNUo1V1dFS2ZHWTd4QSs1b2hkT0FQNUUvT0F5ZzdDQm5GeGpvU2JOWjBq?=
 =?utf-8?B?TTRFZDd4WnlEbjJ2N3A1STgxUVdiaGVrM3RjNW9RTTlNSWJTbDh0L3dEOG9Z?=
 =?utf-8?B?c042emcxVDVTOTVsMVRCcXNGbzl0eGQxY3lHVkZaMzNNbCtTVVdQR29TcFFF?=
 =?utf-8?B?bVI3d0ZrbGlYNit0TmMwWDBrZzFqbUcwYUo5a3UyNE1GVnpSTHBsRmttcytL?=
 =?utf-8?B?TFphUlBEUFAxUTY2eGQ5VnU1MzMyZWNYUGltZVdxYVNYU3hCMUxLKzNTMlpn?=
 =?utf-8?B?SWx2ZDkzd01XbGFyZGpqdHFxblVWdlNNUlh0N2VodTFER05lRDN0TE1FTHZq?=
 =?utf-8?B?WTJtdlhwMkEvU2lqOWtzeFFCbGs1OElUUDd2MFpmcTZtQmtSaVVqaHBHSnhO?=
 =?utf-8?B?SENNSTA2Ky9MZFllV2dSSzAydEs3ZlBYNzB4ZFRjblJRMzVEbzZWRFdiSEZp?=
 =?utf-8?B?VE5xUXJFeWRXU1QzWCtqbVB0cDRCQzBEeVhxa1ppRzlGTTlKOGxtdUxZdHVK?=
 =?utf-8?B?cDg3elJGQjRiTitVcmpPS2hEb3pORzVUUDE3eDU5VEoxeWxac0E5UlNLRDBj?=
 =?utf-8?B?RFI4a29qbGNxb0NpQUpTMElpTUNQSjdzSHNjRCtwd1ZVYjVLamorb3oxZ0dC?=
 =?utf-8?B?Vk42b1prZXQvU0pQekxqWTV5UCs1SW55UUVnN1EvRmFVRk8vYXkvTnRVTXV5?=
 =?utf-8?B?QWFSZ2xLN01UMC9qOGNZZ0NJQ3JDZXFONGFtVkZQallFVUJ1andkTktqWW9N?=
 =?utf-8?B?ckJlaGU1TUwyRjRqU3hldW5pMVVNeUhZclh6c2NJb0NZS2hiV1hhMy8xc1Rr?=
 =?utf-8?B?UllSdHYycGRLVUkrQ3F5L3VWR1diWW90Vy9HM1JaR013RTFkVVdWeEtkOFBt?=
 =?utf-8?B?V2hJRmt0SUpVTUpmSU83ME03RDlwYmdyOGM3WEtmai85elBDclRiaVAyalJT?=
 =?utf-8?B?V0M0NlRnbWtZQmFQM2cyZTBTUkNETHkvZm9RYkE3alVLSU5xMGVuVW13M3l0?=
 =?utf-8?B?cWRKcW9iWUtGb3U5STg2TDF0RWt2QnJ3R1lXZWp2L04vcGxVT3pjWUZqYjBR?=
 =?utf-8?B?YWJ1bzdaelVrWHlpREU4K1FiYS9oVFNTV3Y4ZC9aWk12b3lvL1Awbk15Nktu?=
 =?utf-8?B?UmJ6ZEJjbzg1anJlVGxxdUo4OW1SZHpNbzdVbnJRbjM5ek4wNzI1Z1d4a3Z6?=
 =?utf-8?B?Umg5b2xvUWxiMXNoSkRORU93UndIS01TM3VtQlRqcGs2ZXNRZDJkdFBnMUhE?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f62ef978-aec0-4e9d-9723-08dd88d58049
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:27:51.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqDa/issUvUV/wRrRZanfupfIIaDFj1LI+q2Pbf9V3oRcTtzEBfo69NwwOqrvK6F03NB/p/ZzLgF5bm86rxVrUleAfIlkkxx8Y2jk6Nj2eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE62D2CE76
X-OriginatorOrg: intel.com

Hi James,

The shortlog sounds like the stubs themselves are being free'd. How about
    x86/resctrl: Fix types in resctrl_arch_mon_ctx_{alloc,free}() stubs

On 4/25/25 10:37 AM, James Morse wrote:
> resctrl_arch_mon_ctx_alloc() and resctrl_arch_mon_ctx_free() take an enum
> resctrl_event_id. This in turn requires the enum to be defined in
> resctrl_types.h so that it is accessible to asm/resctrl.h.

I found the "This in turn requires ..." to indicate that this dependency
still needs to be met. How about:

 resctrl_arch_mon_ctx_alloc() and resctrl_arch_mon_ctx_free() take an enum
 resctrl_event_id that is already defined in resctrl_types.h to be accessible
 to asm/resctrl.h.

> 
> The x86 stubs take an int. Fix that.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---



> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
> index 7a39728b0743..bd149c37551c 100644
> --- a/arch/x86/include/asm/resctrl.h
> +++ b/arch/x86/include/asm/resctrl.h
> @@ -194,13 +194,15 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
>  
>  /* x86 can always read an rmid, nothing needs allocating */
>  struct rdt_resource;
> -static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, int evtid)
> +static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
> +					       enum resctrl_event_id evtid)
>  {
>  	might_sleep();
>  	return NULL;
>  };

I missed this stray ";" sneaking in ...

>  
> -static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r, int evtid,
> +static inline void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
> +					     enum resctrl_event_id evtid,
>  					     void *ctx) { };
>  
... and this one.

>  u64 resctrl_arch_get_prefetch_disable_bits(void);

Reinette
