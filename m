Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4658225B66F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202673; cv=fail; b=O2yir641O/DRIaLKINMySCXQ2vY5LtsxS2kpnlL+hP76x57LhpokzwrnvGPYm1OJURBH1acPfK68lYiNeFwDcpkvtEoNcRlK79Xh6IiKgL1ixSS82th6V/h7i4kgFNoKbmxreOh2L7ifGJGRw7OvEN6rqshNtWd6zBcCDeN46ZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202673; c=relaxed/simple;
	bh=6O4QyuJosbK/6wEhLwyVRJbXiSB++oMtmi+DrFThxts=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p2f/hbAPSRCuWOvVIcHkgsaj2FyWYS295/1LF8X3KaNFbvHmVXrRW0VzvYnwI6pNOB5fCOyCoJBjldHcykzn+ep3H358f6fTNwjIOTflz518CxkRRicFXFwB53EkgDMi1ihyVYFH/W6VnZaOfLWQqUrzS9WEqtw8B9X3mytc3Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3aKi3V6; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3aKi3V6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746202671; x=1777738671;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6O4QyuJosbK/6wEhLwyVRJbXiSB++oMtmi+DrFThxts=;
  b=Z3aKi3V6xui9HrZ0YbXGn5+FQCstDmGWgEFcD/d43JsuMZnRGsABYWOy
   7B+w3tnsXO2cd5WShW4Ee6busWapT4mwGpmNwlF7xG5Lesss8ij9qXyEF
   wLpKgLPWViOVbLQS73DNQ0IcXlA0oLsj2aIygj7WenDLshgUt777uffCp
   RY1SB/BYMFZNPVR4T7lRgzZg8l3ml6jn7WkqTrV+tFvvPA+ShWf9nhAYs
   VFrNTbw5pVahnJ8jaIRsGL8aC+/mBrsMo/nun2vZLVivdNnk72P/TappW
   LrL1qhuKvr9r4fTLSM7ncAM+I9qU5NuMz9SA72vRRG3E2zJm3pXEyPhJM
   A==;
X-CSE-ConnectionGUID: pu48bgFkSBC6DRKomAujXg==
X-CSE-MsgGUID: bibn9Ew/QE+SrdhiTCzvYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48028457"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="48028457"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 09:17:50 -0700
X-CSE-ConnectionGUID: tXDiwbJ5RMuFmV/lM2VkPg==
X-CSE-MsgGUID: q8/W6v+ERgOAKo5iC53nmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="157909346"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 09:17:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 09:17:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 09:17:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 09:17:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkqUvyK3yPOpfODzaAMi6GKTtbAo0swz1cQSpim3hDVfPehX5VpXfKMq9HqyR8KOKf7hrW6ALc2jPSItEZr3Tw3ifv8d6ZP91XavpKPoebfY/hNAgFVvST/b21aTQkbgMjVSY0LOTUh4EJyrsMzcq7tgrhpFHnk//fOOvmcoSeXF2xNgNs3EqE7mXJeXOgpvxrZ++FlDQng32mpnswmmnoL2Xh78+QLafLiSoKW1aviGiU/G5uSTomd3ijRsjnQo06yGBVmDSuo+RCIozCTUQH/BKfljdZ92+eBm6UZrnCBDtwfZa2IPpd8P6owhLunuX+nw+WlIQIBkQf1Ail9bYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRMXSgIdevaKK/rGFAmPvM3GLc3dE4tScsiC+H3qgvY=;
 b=HyKn75eEOi0hCEWnRy2WUGq5pEmHKLBeiAA/5j4qdnVCpQyNaCdvsCuYMar3Oj7k3iF9tJzZ3JIsCLtHbDr9bhd0tSMGQZXBS4ag/SZF2PHXiRmnrlsddJF1F/ZTiWohf3aj/bFmwHl56RMu5PLn3Zdd1o6X0+OPepMIr93cP5I/vlTKVXDCt9v/vUqzgUB5jfbGWz/goKwBI/C+rwL6mFSuSJQ687SJH1M5fvI1x2XqGq9Nnxo9/klS5p+VtZRHFnVXJLFieQ3mjQa9Yv84qF1i38UUNZYcIpoYPk7bf1EmUYmAnpNEgGqcbLmnocro8r8fixt6R+ROk02KBeYY7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB8037.namprd11.prod.outlook.com (2603:10b6:510:25d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 16:17:45 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 16:17:45 +0000
Message-ID: <dccc8512-750d-4806-9c56-acbe9e3340a6@intel.com>
Date: Fri, 2 May 2025 09:17:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] cpumask: add missing API and simplify
 cpumask_any_housekeeping()
To: Yury Norov <yury.norov@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>
CC: James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	"Rasmus Villemoes" <linux@rasmusvillemoes.dk>, "H. Peter Anvin"
	<hpa@zytor.com>, <linux-kernel@vger.kernel.org>
References: <20250427185242.221974-1-yury.norov@gmail.com>
 <2e033056-c2a0-4a91-8b4b-c5e53bdfb171@intel.com> <aBTlh5RdqqyQbQFn@yury>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <aBTlh5RdqqyQbQFn@yury>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b135e7b-38da-4608-f76c-08dd8994df02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWs1UG1BUnk1MEEzM2VhdzJBbTNpYldNampWUFA1Qi9NczN0aGE0OUNhYnZn?=
 =?utf-8?B?VjhZZit4Yms5SFNQTVdhY3pjRitXU29KRlZBZStJRmF0OUlvWHlHaXpKMWV2?=
 =?utf-8?B?OUNLazYyNU9ib2Q5Z2RKUG1LSGFZTjU2OTRjenFuckVFMXQwOEtEcGtCWjNw?=
 =?utf-8?B?UXpPWkFYTXZPeFdLSUprd28weDg0eThDc3p6WmwwaldEUVdVNW1PUFZIbVVV?=
 =?utf-8?B?Q1hUNEpLNzZNYkZlcG5idUhVcXkzOGUyRTlhazlHZWxkbnRTTWxtMWFTZGR1?=
 =?utf-8?B?bHk5UDY0L1ZFL0FhejlXeDArRGsyRU1MRXlCb1VhUTUzalhmR2NvVERXZThL?=
 =?utf-8?B?WWpacDY4a0MzeTJFaTZ4Nyt2Zm9ZLzhKTXphaW80NFV4NnMyZFNLZnpxaG5z?=
 =?utf-8?B?MWUwTlc3bjVraHdzQXNkTkVBT2tzYWVrR05kV0JzZzFQa2k5N2g4ZnZ1Q1Ux?=
 =?utf-8?B?QjNaSTRHSGtZL2Jwc2hqeG5CakxUVHRYOTV0WHUwZzJDemtsMU1SYUhBVGN4?=
 =?utf-8?B?ajZHMks2ODM1ZTEzaVBnMDR3d2hLeEY4MStnUmZUZkRZR2UrZXAwVUJzem5I?=
 =?utf-8?B?MTc1amR6WWMvN29UUXZPQ28yNktCVmIveHk0V3RMcnBWdHh6U2hGdkVmclRj?=
 =?utf-8?B?UGtmVlhQaEtVR1hCZTdYWEF0QlRIS3ltT3pLUGVxWUpqaXZ1K3h0MUljd3Vw?=
 =?utf-8?B?bStCMURYSjMvd3RHTk14UUhwd21hRkVEZFFOUEt3S3Z6OVVBelBvMTJlcnlG?=
 =?utf-8?B?OEZNOFJKdE5TM0pNZm9LQ29xbWtKUUhPeUw2QjVSUHJVZk1SZ3hzaU9kMTNu?=
 =?utf-8?B?T0xzSjh3Y2pPVW5TREhZOVJ3djFsNXVsNysrZjAwbTlOVUVkYzAvcHFSVXUw?=
 =?utf-8?B?eC9UeUtKNUFhdm45NjQwdXRidmZNeHlHdkZsOTU3STRsM3RZZmp4cklVUUZW?=
 =?utf-8?B?SFFORDVabVJyT3NabGk4RGVlSXdVekE3M1hkUHJpNmV5OEM5RHJOM2p4Y0dM?=
 =?utf-8?B?dkFFTEJKYjV6ck84bjlENVdPSXo5UDFCZDZ3M0U4TmFRZVRTT1B4STVxUGI4?=
 =?utf-8?B?cExjb0s2NDVRdFp3enFSdDdJR3djelNHOXFSaDVncExxRWpGbTViVTl1Skkx?=
 =?utf-8?B?RlB2UVdoc2FMMlhjTEZLcGRaZnBIVW5oVUo1VHpTODJidGUzWFR1cStqWWZz?=
 =?utf-8?B?THo1eCtOckp5YzJUNmFZNHFMQ2FxOEtScnI3WlY3QW5jQm1tSDgwbXZUd2Zw?=
 =?utf-8?B?VjVsN01kUzg0bGI3UzZwWnBIRVJ3NWF2N0pTcUNOMGhEZy9OclhZM0M4WTlT?=
 =?utf-8?B?alp6S0NMSHBYRXVVMmNZaXBjV3AvSDdjOEN0UTBSWlc5ZWdzMGkwNkYwdlJE?=
 =?utf-8?B?UFhIWVVWVnJBOWZ5aXRGL0RHOWUxV0xYQlRUbkZNTENOY1llbFdRY3FpOTIz?=
 =?utf-8?B?TUJrVTdwRDJDdVNpdWt0dm1TWFBxK204SmZ2UzJ3YTh1SjJON3V4Qk1KQ0hv?=
 =?utf-8?B?SklibXRpV1lta3paeWI4eDBKeXoySW5WZXpiRW41YjlJWkNJUEhMUjFLT1Zv?=
 =?utf-8?B?bVRJWTZhdWFHTGZ2NnQxSkVQUzVuVE1WRXBZZS85eUUzVHlqRFMrQ0k1OW9P?=
 =?utf-8?B?NHl1T3pjbUo3R2U4VDVvQWhIcmN0M1hUb2lUdWVDWnU4TDNhWmlMZmpzVmtC?=
 =?utf-8?B?Ykpld2dMVVlrSnRBY1ZHclF1WFhibG0wYkVpalFQKzRHbG5sbnd1MkVBbkJN?=
 =?utf-8?B?bjBpYUE3dUJEUm5NTWRiaTQ3SDZSajFBSml0Y3BMY3JCR3hwS0RmbDgyWVhF?=
 =?utf-8?B?UGFOZlRBOEJSYUY3YXI1VlRvZXZ3MGl6bldKRU1XOHdVTXpXOFAyMWxQbTBx?=
 =?utf-8?B?QnZ1UDFkSk44ek5FNWsrTkVFa3d1UzZzVERkZzJtTzVKbzdHSzFqL25jdkRv?=
 =?utf-8?Q?LTbo9eXQ1ao=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmhNNFFaWHhpT2FjMFN4YXpHTzV6QWxqbGdJN0sxYlJOcEx0SEhGcGtJLzU2?=
 =?utf-8?B?VzU1WWRFZ3VVYzlQYkxCQk5najdPemp2YWJ4clJYTjk4N3NjMi8waXh3dFBI?=
 =?utf-8?B?b3pCV2Y4Qko0b25sSXRmNm5NVnpDWjM3aExRMTZacWhzNjlINlFIMEZUUXho?=
 =?utf-8?B?TnB6M0JRdW8vdTlPNzlzY2lhZFRvbGRjRmcwSVpLNlZsa1RETUVXWHJyc01Y?=
 =?utf-8?B?OUs1VmYwN0dzMXpPdGZkaFZVUmU1aDRmVVVaUlNiYitkRjNTM0dScnFKZDFG?=
 =?utf-8?B?R1dqUFhuNXZ6WlZ1K2haeTFyWGp5TDVRMjRTUnNTd2QyNmFiNlp0UlZKdFhP?=
 =?utf-8?B?RGdYTkVNVE5iVUZQN0VFazd3MlR3ZlJqWDQya0QvUVBHV1NpN2JVd2ZwV3p0?=
 =?utf-8?B?QWlsS3lTbkdZRmNWYkNzRlgrQ1dJREpjbDd0TUdCaWhkTUtIVmtmRFVHcFBm?=
 =?utf-8?B?bU1VQjJGeEROZ3hRWENDRnpXODVlQVdYVVRESUFYK1Jwbk5FVXF3NkQ0Nk5K?=
 =?utf-8?B?b09Bc09lMmxnSG1GV0hFQ3VlcHdZUzExU291WkpMenFKQyt6OGdFSjljL3Z1?=
 =?utf-8?B?a0ZsTytzRzAxeis3VHRPeG9uS3R5bnVvRmR3MjFyWDVoR3Y0d2xTODJDRm1Y?=
 =?utf-8?B?ZGNva3QyUTVhUUgzV0hxdXFJUjN3K2dHZk4rd2V6ZUlVTE45eTlpNDdxeENP?=
 =?utf-8?B?eHdKZHZkVXN6VDJXTGlvMUcwblNVRTlrT28xNngxMy9hUld2YTkvZlJ1VjIv?=
 =?utf-8?B?WVZiUDE1WWF3QTI4eWtUTCtGeHNwS2ZRT05rNkRFeWtRaEhIVkZoN0p1MFFT?=
 =?utf-8?B?alVjWENQaDAvMWZFcGdLV2VmSEt5TE9zYVZhYjRIQk9qWGlncm5KOFlWamNa?=
 =?utf-8?B?YWF1aWpnZWliWkNuWENUS3pQRnNlb2hjNUpWQXhwVFB3OC91R1o5KzEvRm93?=
 =?utf-8?B?QWRTeW5KUTBzNTFiaDRwZzE3WXNBanBIdkRweTVjNlExOUpWaFQrVjJETUpp?=
 =?utf-8?B?dFROeGxNOTRGa0gvSllWVG9xTEZLYkFKUUpaRDJoalVTVlk3SzNoWG5zNUxW?=
 =?utf-8?B?MDM5bTFOTHpSNG9Gaktva2hwdkZndzNLNjU3OURwZCthME9idVQxRWU3WitR?=
 =?utf-8?B?WHUzY1JEUkRoZ2p6cnVxcG5zcW9TakhJMEhzU3gzclhGcklvbUtkdEJmQ1p2?=
 =?utf-8?B?R3ZTSlEyTExraFBoWTlFVE5FSTkyV0Zka1NZRk1ObXlJWWVoZkROK2diY2hj?=
 =?utf-8?B?UmtaS3g4cHdWWEZxM004UTM0M2xNYkp3VFpjWlVBcXZBMnRkYnpOU3lDUUlD?=
 =?utf-8?B?d1VOYWpJeU5OODhtVHV3TUp1ME52c3VtL1BvNU5VZTM1NitTektsNTVQckdp?=
 =?utf-8?B?c0NHWXpXNGlyOFZWOVJiSkZRbDZ2K1d4S2VwMkhqUDg4Wi9hMkRmM0EwbzYz?=
 =?utf-8?B?a1h3N1hEVzNaWGNkVDl2TXF5TllSeUQwMHY5cWwxWWZXa3dWVHFjK2ZTeWdS?=
 =?utf-8?B?QURDbGhMaE5qaTZSUTJYMFArcWttamhhNGhhaEpGYlZ0RXdNMGNLc3hDWjR4?=
 =?utf-8?B?STFFSmtUTUc4cmhvajE1dkF1T0RxOUVWSDVWTkJDWWdUNUxqMjVhRm43TW1K?=
 =?utf-8?B?N0xGYmptR3Qvek5QTThkQWY2QjFRL09tWFFuWVFIaGMvNUh4ZW9DVWxzTVRs?=
 =?utf-8?B?UHVIb1BEakplUExWUUlUZFBSYmFjR3dZd2tSbFBYSEpRK3ZHdzlOdVZlTmlR?=
 =?utf-8?B?ZW9YT1B4c0YxV042aGZBZlA1d0VkMmV6M3lsbWk3Nmg4Q0RNMzFWQ1VKejYr?=
 =?utf-8?B?SXl2VUl2NU1qU0g0b1dZQ3IyZDkxakNIMXJCWVNERml4YVROeUt2Vkw3SGVU?=
 =?utf-8?B?citOdE0rZHl1eWYwZmpOZ21sZlJBYlRhZnQrY24rVVhJSGEvVDQxV010dzNS?=
 =?utf-8?B?b1d4Q1BuR2xVN013WHNFY0xGNWZ4bSttaExnTTBUVVpXSkpzM05XZytVV0RD?=
 =?utf-8?B?amJGQ013djhDZHB4NExLWnRsb0NJb05YQTFON2hZdFNzMFdqcUYxMXZQZzZ2?=
 =?utf-8?B?WHp3c2VxOWZZeVROanRaSGQxWUMzL09IV3ZRWFMvUWJuZnhyTUlUaGlXQzVD?=
 =?utf-8?B?M05zL3c4em1NQ3FIT2k1VHJRa2UzU2hFSS9SYlNMQi9Gd0hqRUdETytLYXE2?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b135e7b-38da-4608-f76c-08dd8994df02
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:17:44.9063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ae54y9gbNnDA6Riws3rFIX6rVFMH01iNMaSrSqDTTO8IFQ4hlEhVW4A1WMPmE47FwDNRM3msOHeaWUcSUfMq4/GWpfKfxZMFQ0Oe3LYcQos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8037
X-OriginatorOrg: intel.com

Dear x86 Maintainers,

On 5/2/25 8:32 AM, Yury Norov wrote:
> On Thu, May 01, 2025 at 03:06:18PM -0700, Reinette Chatre wrote:
>> Hi Yury,
>>
>> On 4/27/25 11:52 AM, Yury Norov wrote:
>>> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
>>>
>>> cpumask library missed some flavors of cpumask_any_but(), which makes
>>> users to workaround it by using less efficient cpumask_nth() functions
>>>
>>> This series adds missing cpumask_any_andnot_but() and makes
>>> cpumask_any_but() understanding the RESCTRL_PICK_ANY_CPU hint.
>>> This simplifies cpumask_any_housekeeping() significantly.
>>>
>>> v1: https://lore.kernel.org/all/20250407153856.133093-1-yury.norov@gmail.com/
>>> v2:
>>>  - switch cpumask_any_but() functions to signed type for CPU (Reinette);
>>>  - change name for the new function to cpumask_any_andnot_but() (James);
>>>  - drop O(n*log(n)) comment. cpumask_nth() is slower, but still linear.
>>>
>>> Yury Norov [NVIDIA] (4):
>>>   cpumask: relax cpumask_any_but()
>>>   find: add find_first_andnot_bit()
>>>   cpumask: add cpumask_{first,next}_andnot() API
>>>   x86/resctrl: optimize cpumask_any_housekeeping()
>>
>> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>>
>> Does anything in your "bitmap-for-next" branch depend on this
>> series? If not, would you be ok if this series goes upstream
>> via tip (pending confirmation from tip maintainers) to make
>> for smoother upstream of resctrl patches that touch the same area?
>  
> Sure, please take it with the resctrl material.
> 

Could you please consider this work for inclusion into tip's
x86/cache branch? 

Thank you very much.

Reinette
