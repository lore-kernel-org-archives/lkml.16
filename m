Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7032C3256
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752812; cv=fail; b=IrFCig+B+iYCVt6lBlNPnq7uSKKxrZM8Hd/jBLQTx1Qi6COBYjcTd5Svrhaiisfye9OHEtITu4jztfElGU4dKiV/4W0mk0/8OOfq3m/YfRFcyEy6ETzW/WAvKYfoJ9h5fyZJFTQ4f0PdY0JIyQOeyNvL/Iu9t7RavvsuNNbpWlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752812; c=relaxed/simple;
	bh=H2Jbf2GnU6aclUcUdBAACC/+zDTVgej8tRWslTPZtwY=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EcrXTTotZzhwqvynSj0ZiMUVF++1CYz5pi0WYCP0S0/i5GCAOYPbl1xW/0FHpRm3vXGjz+UNmRgbdWynLBlIeZwZz5aTMAzRkFutaDPppit08FrMqNeKTO9rYOuJZvSfNm7ljeEGpD+zXCa6VjvVbDaRHXXrJwAEA93M5JhyzzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUYclzIC; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUYclzIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749752811; x=1781288811;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H2Jbf2GnU6aclUcUdBAACC/+zDTVgej8tRWslTPZtwY=;
  b=BUYclzICY/uWIjKT3kHAHndaMBknaKk3fMQ+v0Nk5GPYOBYAXzeuKUMz
   O4bQKOK5jGBp3ycFcv1/fCvmaWJkoz3hzEn4axY3IcoLbcTqwj5sk7ZMy
   /+plStg+5JEW5DrzINbXIsJlWwm9GoQPhKy8lJ66iU5d4rl8WNKGNMb2+
   vbK5aMfWX/UCnRkVZdoqbTNRQlenT1L9ohtKcU1NrcuSTjrDu7mGbQbJt
   I6VsGS1N1dLtnn/Xe/DE0/R3aPn2vVcf6Gn4HxXOfdJLH8mlgP2F6mEYv
   j/UwSRtr/az5+l0ja449nTVZ6dPUAGLZ5iUV0eTd0Z9akK+/pgzC59/sb
   g==;
X-CSE-ConnectionGUID: JGjt9cO5Q8qYrtWBnj7I6Q==
X-CSE-MsgGUID: clFYOMSuSeGbZ1R3Y3vzSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69390053"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="69390053"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:26:48 -0700
X-CSE-ConnectionGUID: Ews3WcgAS32WTntNooMq/g==
X-CSE-MsgGUID: iV85jKiJRhKyIX9TvrigQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="148090264"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:26:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:26:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 11:26:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 11:26:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFREINQ7nTIDCF7CB2iWWMe3v5s82NhxLwt240bHbT9pHNf7y0N+p/sZXzEMqs5eseIRlFNvjsf3iOzWXjalO/ZF5YVedOKEBr8DoRwVSGcAPyHGgFI3aa2HgNv1lYPPV6oASPHAA2VeAk1O7O/AjbsrJq0TDw4KCMbrwp7a+5Ym2O5XxonFfkFVNxYTNxI6H26K2zTmelI+LsvGVR30anARGChfSbiM7yeNRBGqJVS3+mgjsErQ1BgEEHexbCz1w9aVVdQXOL24O1tNlmpFFc6jxlraErPy4wqr1zQ0o8vnZOqsfGrsKzNsC7XM+u5F6qDbjXGQNP+XWitlHjcekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2Jbf2GnU6aclUcUdBAACC/+zDTVgej8tRWslTPZtwY=;
 b=Dn6IY+M82dpDq1tFqsWLHEEksrn5iJ1iYrLSRGzr6gyfoJvTKqmE2FwKKrMhy+nG0PGMWhhNc/yS6wC96I8J4YS3SZeWxsLdyTFzZ/4KwVFuTA0AMeGjZRRL+C8G8vW9VfUnJbNzwsOgNfdQq44LEpf075bDg2hcOO6IAgNPnI25WG1YNmcVqGAYx259xXDPepy/7RXs8+fCQ/YwS/8tNK3xEs4xozfNX8G3m7leuGcMGjvwUq9C46farAamIh/CPeawluyOLFKBOpGUnsvgkPx9XFlOV+lXdV/VCHQ1R8l2MEMvEiiEOOPyKEXpzthCHG4VsX+GDYOiSrQ0kcpKfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB8068.namprd11.prod.outlook.com (2603:10b6:806:2e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 12 Jun
 2025 18:26:24 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Thu, 12 Jun 2025
 18:26:24 +0000
Message-ID: <b58db91a-d765-49a5-8182-b1d4b2c03bdd@intel.com>
Date: Thu, 12 Jun 2025 11:26:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/resctrl: Optimize code in rdt_get_tree()
From: Reinette Chatre <reinette.chatre@intel.com>
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
References: <20250611021547.2766889-1-tan.shaopeng@jp.fujitsu.com>
 <20250611021547.2766889-3-tan.shaopeng@jp.fujitsu.com>
 <fea254dd-c622-4868-b9ec-3a902c5d7fa6@intel.com>
Content-Language: en-US
In-Reply-To: <fea254dd-c622-4868-b9ec-3a902c5d7fa6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::35) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d7b69b-a74a-4b6f-9cc7-08dda9dea331
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlJheFFIOHdkWGFZS3c4cjdVQktySU1vZkxXMUhvN2RnYmcwZUcrK2NGZS9L?=
 =?utf-8?B?ZUZ1Nm9xZENxZkNUY0hMRmlzc29XNzhrM0o0K0Z3U2hVdXZwYkh1WXB6MlZv?=
 =?utf-8?B?VVk0S2k0djFIOEJJUmc3bEo0SzVGYmpIM1F5UkhtRCtyeGVRUXBPOTUyeTgx?=
 =?utf-8?B?cXc4NHdGa0g0WThzaytuUUtCbmJrVFhPOUgvWnJsVnFmM1JyMUpRaFB1OGFn?=
 =?utf-8?B?eCthemJwNW9QSlpvQ0puSnB5d2doR2lUMitFUTFwOVZWKzZqZnIzL1o0cDZq?=
 =?utf-8?B?cGdKd1NPQmFDRkI0ZE1HS0lIajVHMFhXNUN1UTdmVzBobWZEVldmOXpuRDlk?=
 =?utf-8?B?S1E0UEZZdjNKMVM0RS9iRmxNQjhPbTJCU0JIOGVkTnJwODNCYWxpMm84QWpK?=
 =?utf-8?B?MzFRemdOb1dUb1ZoUGVUSjBrUlZzbnI1S25Ramlzb3hVdGNRR2VYa053M3JU?=
 =?utf-8?B?L0IvTzJKaVVZb3I5bi9rdThRd1drb251ODVhak5PaWZ4T1ZRVjZlZnhsUDVV?=
 =?utf-8?B?dUk3QzArcm9tNzdxUlJkWnJYbkRpVHhxbkJTSGFLTlZYeGgrdi9FOEgzRnJm?=
 =?utf-8?B?Z2VsQXdUaEh3djlXQ0I5TXBrU0NET2NuRWVMSzEwS2Z0L2xWSTdKYUc0SFhU?=
 =?utf-8?B?RzcvTzQ2UHRBNjJjZ2N5Y3VRQzQ1TFNkYzViRVJCcG1HVThGWnZvaGFXZWdv?=
 =?utf-8?B?NlJsdkZwbVhUNXFqdlAzNmsvdllGamNJRGZNQ08wUmRITTE5RlNibkJoWXZt?=
 =?utf-8?B?eDM5MzFuV0dybFZCeVk3d0NoT3EwRHhyazA2N0dnQjd0a1QrdmF4aFVrR3pn?=
 =?utf-8?B?aytZU295aHZXMHkrd3pJMFdWUVQ4QjRmSEJkcC9ZZEdFTi84L0pUY2RrVFp2?=
 =?utf-8?B?MTloTHJBNzZhOGowZVVZa3hieDVwaW5KcFRxZVdFZ2EzQ05yQ0lGQzVKL2p2?=
 =?utf-8?B?QWI5cEtDa2hoWWdzcDJNQnNiMFUvVHJ1Z3RDMmtiK1lGaW42S1BVUU5zd25O?=
 =?utf-8?B?Z0FJdnVwWmxOSDFjRC9iV3p5aDFWZDJBNmJ5OW92WUh1N2ZJVFlPTkVrMWwz?=
 =?utf-8?B?N1dqL1RhK1ljQkJ2RGV1OWJ6VWJYN0tETlc1OGJ3L25BTDBEcEFzUWJFQ1FL?=
 =?utf-8?B?RU4veUZRQ0JEaGJvTHNRWk1EbUlOVnptWVhCNEl5ejcvWW54YktEOU1wSmpW?=
 =?utf-8?B?OEpBTHgvTE5FQlpWZ3lIS3A0cFF6aHhEd2poTFVuN0hmY0k0VjNabnpvdVNS?=
 =?utf-8?B?ZElCekpRY1AxcXFERUFZYklnZXhTWmdxeFRSQjkzVEJWZ1dKck9XTmJQRFFv?=
 =?utf-8?B?N0FoNTdaZHNFaUswVUgwT1ZrTDc5dEx1WXhQWUhaaFFWVWEvbHB6cEFxcTVU?=
 =?utf-8?B?b1FYRUVZdk1aTjRaRGU1MmhDUERLTlNKaUZiVEFhN0V4alRCNzV1VU5pS1NN?=
 =?utf-8?B?YlNtMVhXOWsyTVBNb0tHeEprSUNQR1M2WDUyWVFmOXpvdUZBaUFBWmcwcFBF?=
 =?utf-8?B?dzhyZ3hxN25kaW8xTHNoOFFMVCtQTkZhMUMrRjlQR3lRb3RXRjlCM3hMUXhp?=
 =?utf-8?B?amNXcHpuTE5mdll6UFhOOFVjaHd2a0xnZ2QvcVZwSHI2cENRRzJScXFDYzNR?=
 =?utf-8?B?RThlN3c2UldiUXVuYUFGTklDVHhmWTdKSXI0VGFrWFNmUmxuSlcxeUw5VTVS?=
 =?utf-8?B?eTJ2N01UaTZFS1JjNWM0bHFqdEwycVBabzQ5S0tobFRtZFZiSmdLUTJnUXVR?=
 =?utf-8?B?Q3RTV2RJV25HdnhlWkJxM00rZ2FMbk9WMUJtVVlzOS9KTDNZZVJleklrSUJ0?=
 =?utf-8?B?ZGxQdERVbXlJa1RpeFFaM0tYNVJXYk9RdzdKbzVaSGJMSHpGUXF6OTBuTlYz?=
 =?utf-8?B?ei9KenVzVTd5ak83M21GU3FGOG1aVmUwZXh1K0JNRmJmSVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE9DTnd5TXI3R2ZyY09SNnVVZi94SVFVNHJkRlBPTDI5djZ3eWM4VVJUTE13?=
 =?utf-8?B?Z1dSQVpIbndBNzQ1YnB3RWQ1ZC9qY0EwYlNGZVZ5c2hjZVBOWFJLOGlNVW9O?=
 =?utf-8?B?Tyt4RFJuY2JMNXB2allJTmJzRHJSZ3Fpc0hTQ25IcFVOOVZhMHU1bkF1TkdN?=
 =?utf-8?B?SUJycUluTS8wdnRJN01kSXhuYkxYSGRjZld6VHN0bmJGNG9TS055azg4KzRK?=
 =?utf-8?B?ckkvWWRqY2hZRndnbEk3clNobEZIcW5TRERUTVlwaXdqVkFPdit5aXZZYWln?=
 =?utf-8?B?OGM1c3V5RlVsY1JWUDdtdVFrMCtWVkJ5RElqNTRKNFpNeUtjM0RSb2QvaXEz?=
 =?utf-8?B?RW5rRStJT3hLZnhycXhHeUJYZWZRVWZOVFFUc1FwYkJhYUVZM2FtaGx5VVBj?=
 =?utf-8?B?SS9IMHdjbDJVdHBLZTdzRzBYMFR2UUliWUphcXNPS093NDZtZW9tdkZQL28z?=
 =?utf-8?B?N0tyN1NBblVyZVlzeXZpR01OZkh3K296anJzcDhhbU1qU3d2WGxuZlpYcDlp?=
 =?utf-8?B?R2VwbzhsYWExUjMrTHNFYUMzZENPWWVRWFlXaFVoVGhONjk0ZFI5Y1hwQ3h3?=
 =?utf-8?B?YmluUHdSbXA2WXkrKzRyT1MvYlNTSE1RSm5EQVg3UWhMdXZyS0lmanhGaUUr?=
 =?utf-8?B?QXU3dkViYkt1NGV4cUJrbjBPdEFvTFpzYS8xTGxLTlNQbG1qZTBLdGRQVjJy?=
 =?utf-8?B?aUNQMGVzUGsrSFZ4L1V1cjgzczdxaWI2MjVPeEdYZWprbmt4ajMzaHRMcUFK?=
 =?utf-8?B?RmNnZkNvU24wWlZzZUowSng5Y1BYVHVPY2s1N3dyUDhZRThjbHJSemdqVWRK?=
 =?utf-8?B?UWV6Q3pHZW1OZ1VJdTJJSzlQYVFDQzQybUd2VkwvR0RGeW52SE1iZFhmOU8y?=
 =?utf-8?B?bHVCdG1Nb0pGbmtySTFQekN2QSsxektwTWIzblJuYmprejNibm1vMVRRMFQ2?=
 =?utf-8?B?Y2RvUEFyYlhaRkMvN1E3cncvNDhSTlJrZGVWSUFlSWN4S04rajRJY0hGbzVM?=
 =?utf-8?B?elB1empxMDNjbTI5Z1UzNTVUMHVseEZnUDBMbHhHM2txaVRhTzlBeDJ4OVhh?=
 =?utf-8?B?VDY1NUx0UStxMHk4eG9EU0dIMmU2WU9kWnRIVFZ4azM5Sk95SU9FblBDNTRj?=
 =?utf-8?B?THFkK2NteHJtLzI1d1hPa3BxanlCNWZyVlFiZVQ3Ukova3dndGEvSHl5clll?=
 =?utf-8?B?ZmRrL1VRWVBqK1BYLzJXNksrZ2JqL2oxZGRDUUhOdEtJaEh3UGZhQjM0QnRJ?=
 =?utf-8?B?Ym5FYVVnQzdxR1FuKzlOem9BeGdvSHA4bTYzc01nU2R3b0hNeHFuMjQ1WkFB?=
 =?utf-8?B?R2l6UEFvN2xjbUpabi85ZEhCVDJncXhJY1pPV0s3TnBWQ243amgwbC8rRkRW?=
 =?utf-8?B?OGZ3TTMyRVVia3pqREhxVXdUZHRra1UwMW9RREJkcmZRek83cTZnbEJIZmh3?=
 =?utf-8?B?VUd1d3d3NzNJSTNYd3NvNk9pc0k3eU11NDU0NzJ6RmxISHFCWXlrSXJOK1Vr?=
 =?utf-8?B?dGdxK2FDeVVoWUNHeklrNGR2TWt2YkdDWmV5WWl5ZFo1eFBJR3MvZ2dYZWVk?=
 =?utf-8?B?bFBTVURlRzNjUUZkZ3JSUEJva1lMSWExbmRTNW9WbHJMdUE3c29KUUV6c1c0?=
 =?utf-8?B?WENKUWtJMXRWMXRrOXVSUDAzZ3Nzc0R6a29BME1MT0l6Ykc0Q3JsWkJOcXlF?=
 =?utf-8?B?cjFCMDJNdi9CV1A4cHhqcXZUYTU0aVMvRGdLb0hBNmtCUWYvaTR0bi8zdEMy?=
 =?utf-8?B?T2xicldDclR0VmV5NUh2TzJYdU9qdnV3MUdQN0dJRFNWQzFWNjExVVAzaUdT?=
 =?utf-8?B?eW91UERrSzc0dG9SS3lsZGY4cjg5cEVyL0xCOC8rT0JYTHRCKzVXYlVzRDB2?=
 =?utf-8?B?enIzSnliSnJVZXJHSGJSTC9uRW5ZbGNrdTZoV0ppUGh3L05kMVRMT1FzUEhI?=
 =?utf-8?B?cDdVd1NPTEpCdHBCOG5iQ3MzRWxXUTN0VlFNQzFob0JTclVkbGwrN0ttWGl1?=
 =?utf-8?B?anh4dkdpY0tqTElncS9wdVV0eUo1MlhaVndZLzZFcnlpUlBWOTJ4SnBwRXpk?=
 =?utf-8?B?ckJ0Qy8vcDNCdE94dnQvbHdSeGJNQWIwM1IxZExZd0dHZENWbEQzN01oYVNO?=
 =?utf-8?B?Q2phelovUlBJM3kyYitUMHp1SFNnYVd5VUYzOGFLc1ZEd3VwbGNOZERVNHdX?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d7b69b-a74a-4b6f-9cc7-08dda9dea331
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 18:26:24.3321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrFJpfH8ivQA+5WrnAZcHNIwS1zZ/+Eau5DQej4oXYzQo8c79K7gypjf+o/zwVuArQ11TM4GzDmSmd8YVNA28YvffYkM/xkshzjy7lmc2QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8068
X-OriginatorOrg: intel.com

Hi Shaopeng,

One small follow-up ... since this is a resctrl fs change,
could you please switch prefix to be "fs/resctrl"?

Thank you

Reinette

