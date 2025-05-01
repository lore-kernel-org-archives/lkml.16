Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F7E219E93
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119078; cv=fail; b=HNBCfLroC4itvcUGzeJQyiNT251EjKMGtdqA1wA7aD1KVuZyl04HcIJHBePT0KWKpZeHRvDfq67Dtvs9S/KbVMIBr05izUsugDyaGtTB5aB1pYUjolr6H2YMOr3txwbNmARe5KJltSLhkFF70HQE1Ir7iIKw4W1se9yCMFXjYfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119078; c=relaxed/simple;
	bh=nbDixhLEodbA8DCGXX6Cuur8s673o35m1L4K6WZp1yk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HF9Oo8PqLCNRirB2kDBk+Jm/mZx8+szwqZto1ve8lLJeURWktior6TqoxNRd4wb2OGV9VKKDevrr8ZbDEhNTdnU5feG1oF3MKs9NYts3PbbU1j5lsbDG73VN4fferKisqaQMFDcUdL725EalAypHQW2HX2I/cBQO2CC+Oz1yT0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6Ewh35P; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6Ewh35P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746119076; x=1777655076;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nbDixhLEodbA8DCGXX6Cuur8s673o35m1L4K6WZp1yk=;
  b=m6Ewh35Pm9r0VbJsRPYruDbXDwvJkbZYBuz5yb2AqOzx4yh1umFbWNTA
   df4Xtda23jLqf7U2lWoANZ0ks2P9jImQBiGrheGDZYEZ7/7QvLa3+rfXk
   wXRIC59/WCmtjPm5N+aFBuJB10BcdkMVPuH8KbEFcmPqVJaxtYtaNLqhp
   RlbLq2bVcfmZANiiDoAgLarm/rgRRHchnsVAzOrNMJW/td03xj4ZAWLE/
   zvuAnG2ceddkfMRMOyRURgoowzsnUmo+1LPW+HBlpZzkv91gb8xt1lWG6
   WLtzhQBvVZtPBP6b9nAGMisA10lN3fbp57DcKIHT3lgjr2UTN6IAJqJu7
   w==;
X-CSE-ConnectionGUID: SFtPtTaLSzOVSVcqu7nI5g==
X-CSE-MsgGUID: Dmx7kVLNQgirlbpXzu0EWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58460634"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="58460634"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:04:35 -0700
X-CSE-ConnectionGUID: EIuEjUfnTq+0Hz3A0bwVvA==
X-CSE-MsgGUID: M0SB+8YKQRKFNIrgNFzirw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134936576"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:04:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:04:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:04:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:04:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOezotJx7BFtYFweFTnHd1mxlfkIEYH/lKDd8VxksbSmH9TejTe8LZmA1Zfpr6+JG2xUONNhIA7KXskHHBo+IcAmDTU9HcHXp3lwOKFkB8NJ5JaxOIgMgPKGKtmrXJnJzflzgmrMFCIca+py1qJE+6KgqacR7GaQE6tYftqp9vSbLe9HlZQwUOgh7iFuMT4RnoNJ0LXgRqq7Zk9HxJaW85AAhTi3GENnmYfMFKRb5AOmTAx+xTMfd/JY0LHDestupsknEH21Bn4w6nwIu0rL9qO53N9TriVfQKjk0xMX452Ycwm6utBAZjt2tV7FXPLwY7mF3SOLdYC38TtoGx2lqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLvTxpu4pL9EbHbPAisaGIajIwWsBAS0vN2UEHuq8Jk=;
 b=ThlPuR3MvzyJUvzJ4WvoRJg6fP38IiciVFBqoP+/rvMeXsFWlOQ2CeDc6LcLbpZJ29yIxFQ+ouhQ2qqQlTvt8idj+kALD4dSQie368IWKXtTE8RaGD5jvAnFq5IlJU5qEbzyskFdba+zoMJYydlD1YrArSla2arqrI70jRCJ5r1qmlTCsy1UxmYCxrv1xDX3xMuzT8d8ztVlqgjyxpfMDsBwDZrC8Aesrg1ajVOipMkG3ZH45zdTLd+rYqJ/Zp515sNASt+CWECmZeFnKGgKgmddsFmqL1/ByI09vnLwz4J3detv2eYDOryHCJENFsE4TrM/bVQhFzP55GLOXbRUCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM3PPFE50071912.namprd11.prod.outlook.com (2603:10b6:f:fc00::f57) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 1 May
 2025 17:04:13 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:04:13 +0000
Message-ID: <ac19ac7e-e230-4310-9b70-b9d57ee4439e@intel.com>
Date: Thu, 1 May 2025 10:04:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/27] x86/resctrl: Expand the width of domid by
 replacing mon_data_bits
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Tony Luck
	<tony.luck@intel.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-9-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-9-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:303:2a::22) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM3PPFE50071912:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f640c59-cad0-4acc-ba9e-08dd88d232ae
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEtPcEoxNlR5S0ZVWVdBTkNKcU5oYysyVWxQazh0WnV5N2JJZ3BBLzhZNzVq?=
 =?utf-8?B?Unp4NlYwWkJObmxmOFl5amR1Z1lZbVBiMFdWSkNsaDlIeXFQOVlGekR6bllS?=
 =?utf-8?B?Sm5laktEdG9hVVpNU0xZekRybC9POXZjU2h0SkZmVHFZQnhEVmtuY1hNMHBP?=
 =?utf-8?B?UlBWUmRLbnNGUmZqdWlZYmN5VDBKTnFGdWZUVjFJdG4zZ2g2SjF3RWdSQmdj?=
 =?utf-8?B?dFdJY0pjT0NQSEZMQ1RZS2lUTm92NGF1Tm5haGNzTGozbHlUZGozd0syZHpB?=
 =?utf-8?B?Y0xrSlBsby9QMUtZSzVCRXB6c3hqTXZmZjNxa2hDQWhVRU85ZjE1dExEWGxh?=
 =?utf-8?B?VlJzYmVLUGZvaVJuWlJkUS9Fc2lZZm5uL1hOS01KTUMwTkZpK0RRNjJVU1g2?=
 =?utf-8?B?NW1wMUx5bHpsVU8rU1g4ellhS3pWNmVYTW4vWlI5SkZwdE9mWmFkYzA0WEQz?=
 =?utf-8?B?MnRwUmJENTdRVFhkNzB0ejJhbFlkbzhpbTVURmFhWW1HQkcwVkxuN1pBR3dK?=
 =?utf-8?B?M3l6MzRyVDA0TmMzcVNqbjBZaWRUK29KY3BXRHNxR1FhZzAzVFBUdlU2MnR6?=
 =?utf-8?B?Zm10c1lrbGtBL0w5Y0wrTEIzQm9xWjZDSTIxMFMydVRrUWo4ZTZEb1pFSmRo?=
 =?utf-8?B?REk3a1dENW0xbjBsYnpCeGtuaHRmQUxOYTBnUG90aEV0RTV4Uk82SHN4L3BQ?=
 =?utf-8?B?MWVCWjEzRjZNcFg2czFTY29QSVMxckxxMEVnOU5GOTRrT1loVFRGLzBrNG5X?=
 =?utf-8?B?UHVhY0lUbVdPbnlVcDE5SGJXSXFrOGxCakM4c1ZDdy9OWEJRUnJVUnRMR2lI?=
 =?utf-8?B?Ymc2cVoxTGFuT0dmaWxmaVJ2dzh1RG1idWIvMDdXSW1Bb3oxYXJxVXk1c2p4?=
 =?utf-8?B?d29JVVJCalRZZFFveC9VTHhwWDlvTUV0aVlDMmgyUkNESnpmOVI4eUR5UWdV?=
 =?utf-8?B?aEp0TUtFQ1VHRXVYMVlmWnp5RW1GaFRxb1pDVHpTTWJaUFNZU0VEcktxdHcr?=
 =?utf-8?B?VkFla1ovTXRzVHZmd3F5TkVJclV1ZzMyQWFIZm5BYVZDZ2hZQW5UQzdLZkRx?=
 =?utf-8?B?V0xmbFZmUjlaRnJSYUNodERjQmNxWU5zNFN3NWpSWEZZcnhVcHBFa3Y5WlJG?=
 =?utf-8?B?c3dMdjhxajlPTGpWUU9Sa2xBK2NuQUZZQ0ZRSzFtejJ1eVFjeFNER1hsSzBG?=
 =?utf-8?B?cy9oQ0psTjR2bG9scjJlQXMvU0cxUTZhajY1V2U0ZlVXcnBSem5HYlQ1V2lK?=
 =?utf-8?B?bkhZYUxkOWNiUGhnNVFablpQNDEyTXJ3NWhzdXBxVmtNQXJWWXpRckcxSHNW?=
 =?utf-8?B?akQrUEdFbWw1ZUw4bEJ0RVM1L05TcDEvL2VWSStvWmNkbUZ2K2UwM0diMEI3?=
 =?utf-8?B?YlBLQjJMVERycCtESWpVNE8wZGJwSXd5a2g3Mml3RmJ4SDEzUlJrcXZLNDdU?=
 =?utf-8?B?UzUydnlDeUI3c0pudlE4Q0ZWMTV1MHN6Vmc1ZEhQSjVGL241MVNObUw4L3ZB?=
 =?utf-8?B?YnhhaHFJbnY0Y0ZNVjArdFVld0QwNlYwN2p1K1F3WnNXdjZycndDYUYzdndK?=
 =?utf-8?B?dVVaK1orQnhzd2pNSUpub0d1MFMzcm0xNzhVekhZU0xHRGora2RiVTRqMGxx?=
 =?utf-8?B?L1FLeGtGdEh4RWZ4NTdaOTlJOUJ5bnordW5YcEh3MUwyd3JRMnFpbWtuOWRu?=
 =?utf-8?B?S09ja1VyTmR2MFlZeko4enQzQXhWbEJpV29jaFhVSFBHMVYyb0xhZWozWXFO?=
 =?utf-8?B?REM0cHUvcG1wdzVGRi9HRVFTUUFnOTZNZDlURVRzenZmaFU5d3duenVLVFNX?=
 =?utf-8?B?b1dmQW9YNkw0a1FPSUFBUml5WEJOT1oyRUJNSDg4SDlHRlpaZUVyRjMrbnZK?=
 =?utf-8?B?NlVEZ1JEbG5lL1o2dzc0Zi9QSVNLZkx1OGlDejc5VTBFU1JmbmFOb1hobTNi?=
 =?utf-8?Q?p5ksFvww9Ug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVlld25CakhXeWgyLy84dWh5L1lBaHlXanFBVG0xN0lJKzAwbHdlRlBpSmw4?=
 =?utf-8?B?VUs1ODZOYytmam1pTFJ6QlZuZG41bER0OC9YdTVxV2JtL3JFL05qblVwN1k3?=
 =?utf-8?B?OW55QVFxZUJpWHlLQXhKSzVaeFRmVUZkbVRrZlk0UGI5Q1ZPN2ZjM2ppYitJ?=
 =?utf-8?B?TSsrWmpsalMwbXdEWTlNOG84T2JPOEE3MkhEeUFUS0JncEEzWG1LSW43RFY3?=
 =?utf-8?B?NkxxRDFMOTZHZFBZVFp3TG9FMjBJTVNPNzREbUUwNXdnSWxrS0I3MHREckRu?=
 =?utf-8?B?YStkSFZzNjBQRzduaU95RWdQcEtOOGtBcyt5Mno3WGtHNE40L3ZpeXFFakZr?=
 =?utf-8?B?a2YvSFZNOWVGdkJEOEVOaWVRM3d2bmdRa0hRckJuT0JsN0RTZGJKb2xBcVgy?=
 =?utf-8?B?M3IwQkhtUHJhNSs2aE5Hc1FBdmZkR0s2T3lVSC9iNk94NDhUbWxKbTcrSm1T?=
 =?utf-8?B?Z2ZBNHJXWm53d2dLOElEc0dNNVg4cDRSOUhKQkpCZ01iT2NyejBySUlmNXIr?=
 =?utf-8?B?eS9EdFdhcDVwQjJ6UFBPWTBzQXA4d25IeTVlaWl3dEY5cHdYWXVXY0poQklX?=
 =?utf-8?B?QjBjMWwxOHpySXZLNlVqelM4cmpYY05xeE5jMytTT2xreDYxYTZJUU9qeW9U?=
 =?utf-8?B?UnQwRDdjZUU4OG9jUVM5eTFiMkkrNWZXaHVuZ3piY3EzL2J3aGxnaTV4SzU5?=
 =?utf-8?B?MlJmT2VIb0VIYzJESEZtVnFvOU5DQlZ5RGVVS3QrZ3Vtb2wxVng5d2duaWdm?=
 =?utf-8?B?Vm9DdUVuT2JIR0RTWDZlRkp2WE1UVEVFL25yVVhvaE5oREpDRTcwaGJHSzNK?=
 =?utf-8?B?SnE3WFlsa1Nta1RJOUc3U1E1RE5EdjgzTG9BbkViK2kzak5XaFFHeVZCV0ln?=
 =?utf-8?B?WVI4WGJzUHJMdDhubEROcWNJRmNnN0JoMmtERWQvZGNLbkRFckJvOEJJcE9D?=
 =?utf-8?B?Y0p2RHJ3SWFBMVovejhlbmR5U1ZENnRtc00vaUg5UzJDTVVHeSt1bGZWTVV1?=
 =?utf-8?B?NFlJSktBWWZwTC94NHpyUE42Vy8xK09yeU5CRmZGTUw3ZmxkOEs2MUlNRUwr?=
 =?utf-8?B?aG9MeVRrWGd4UnpPYnpiYXRtblByQnJyaDl6NE9nbkQ0YUhWcjRNd1BqL3Vz?=
 =?utf-8?B?OTdKaDRuWit0ZzRBYzRXbWs4U3dFUTlGa2lLazVKM2IybnFhTWo5bVhUMDhy?=
 =?utf-8?B?WElYWDIxcWpBbm9hWW91ZlVXMWExeEhibldnc2lFM3pHQTZMSFYrdzdYdVhX?=
 =?utf-8?B?ckVCcFpFeEN6eHJHSEtaK05Ram5MVmNMQkJZeU1LbDJTZzlQb0FQR2hOU3Qx?=
 =?utf-8?B?bk8xUkEyOEpvTWpLU25DN3FGOWxiRHZLUEZCYUJZL01NRXM3TUQ0dEZsVHAv?=
 =?utf-8?B?djFUa2pyTWcwUEo5MjRzQUo0d1ZBTXVIMEV4WS9YMi9ETDJ5NWxBY0hXclZn?=
 =?utf-8?B?NEtwbFM5bXN4bDFQaDhBR1lFaXFFVGVQZXZzKzFUNmtHRlhIMG5xbGxlQ3pQ?=
 =?utf-8?B?MjdiSTR2MFEyVUkvdkNaeTY0WXlGUXFvS2RaZlhtY0NSR0tmby9FYnAxcHRk?=
 =?utf-8?B?bkxvOE42RkZvNW9ZT1pOUU5QS2ttbGxNUGtjZ0FqN2lucHZ3RHpucldMcFZm?=
 =?utf-8?B?S1FzRkJYTUtNb0lvcW9XdVlYbGdUcjFxV2JUK0U4eGc3MXIzMG1ZdCtYRGFj?=
 =?utf-8?B?OXc5bUtLUVFUb0toVG5FL28rUUZ0cVpzZllkU0xIRFIrMHUxaXlBMm0yVG1L?=
 =?utf-8?B?SnRzekk0ZnVrVlo1QllHQ05BRDU2TnZ4eEdJcjlvM1AyNS82OEtHNXRBblZN?=
 =?utf-8?B?UVI4bS90V2dlZk1lQ2ErUkxEVW5GSnpCVUV0VHUwc0V0VFIyQnFiYlE4S1Vp?=
 =?utf-8?B?Nyt1OStPWFl4Sk1iTHc5dE96M1owNnNXRUhnV0RzdnlrQ1pjZGpDYlJ0djRm?=
 =?utf-8?B?RUtxdHUzSFBoRnlWaE9mWnY0MldNNDhXNE10eUlmaDFHOXIyc3pKQmtjdUh3?=
 =?utf-8?B?MVJWWUhDNEdmL2pCTE9VeVF6bmIyYTJlb2lXZkVyRjBmTy9nbGpXbEFqaCtD?=
 =?utf-8?B?MnBxQ2c5MXY4Q1c4V1JWOTBEY1MwYk9ydzIvMlgwNjFYWTh6OFR4eDZLZ3Ev?=
 =?utf-8?B?VjcwR085aU9FdlQyR1dsOWswZ0xxbkUvckc5NUhiSWg1Wk5tdU1Va2VlcW5y?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f640c59-cad0-4acc-ba9e-08dd88d232ae
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:04:13.2881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JEsu6Tj/2IofdspqU0lDECDOcqkCEwLhN59bXcZxLn1DitG551qlXti5jMc1Ue9XpTqfYJiTRPtp6ScOcnwd+iK1xwoQjMIH7jrBqk1ybo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE50071912
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:37 AM, James Morse wrote:
> ---
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 19 ++++--
>  arch/x86/kernel/cpu/resctrl/internal.h    | 39 ++++++-----
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 79 +++++++++++++++++++++--
>  3 files changed, 103 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index 0a0ac5f6112e..159972c3fe73 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -667,7 +667,7 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>  	u32 resid, evtid, domid;

I was expecting this to look differently after reading 
https://lore.kernel.org/lkml/a9008c2d-e83d-4bc6-8197-0753666a7ec2@arm.com/

I believe u32 was used for resid, evtid, and domid because of how they
used to be initialized from the bitfield within the union. With the switch to
a struct that now has the proper types these can also use proper types.

	enum resctrl_res_level resid;
	enum resctrl_event_id evtid;
	int domid;

This highlights that the incorrect type propagated from rdtgroup_mondata_show()
to mon_event_read() where its "int evtid" parameter should also be
"enum resctrl_event_id evtid", which is a good complement to patch #14
that fixes the type used by functions called by mon_event_read().

>  	struct rdtgroup *rdtgrp;
>  	struct rdt_resource *r;
> -	union mon_data_bits md;
> +	struct mon_data *md;
>  	int ret = 0;
>  
>  	rdtgrp = rdtgroup_kn_lock_live(of->kn);


> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 36a862a4832f..954dc391fc33 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -103,27 +103,26 @@ struct mon_evt {
>  };
>  
>  /**
> - * union mon_data_bits - Monitoring details for each event file.
> - * @priv:              Used to store monitoring event data in @u
> - *                     as kernfs private data.
> - * @u.rid:             Resource id associated with the event file.
> - * @u.evtid:           Event id associated with the event file.
> - * @u.sum:             Set when event must be summed across multiple
> - *                     domains.
> - * @u.domid:           When @u.sum is zero this is the domain to which
> - *                     the event file belongs. When @sum is one this
> - *                     is the id of the L3 cache that all domains to be
> - *                     summed share.
> - * @u:                 Name of the bit fields struct.
> + * struct mon_data - Monitoring details for each event file.
> + * @list:            Member of the global @mon_data_kn_priv_list list.
> + * @rid:             Resource id associated with the event file.
> + * @evtid:           Event id associated with the event file.
> + * @sum:             Set when event must be summed across multiple
> + *                   domains.
> + * @domid:           When @sum is zero this is the domain to which
> + *                   the event file belongs. When @sum is one this
> + *                   is the id of the L3 cache that all domains to be
> + *                   summed share.
> + *
> + * Pointed to by the kernfs kn->priv field of monitoring event files.
> + * Readers and writers must hold rdtgroup_mutex.
>   */
> -union mon_data_bits {
> -	void *priv;
> -	struct {
> -		unsigned int rid		: 10;
> -		enum resctrl_event_id evtid	: 7;
> -		unsigned int sum		: 1;
> -		unsigned int domid		: 14;
> -	} u;
> +struct mon_data {
> +	struct list_head	list;
> +	enum resctrl_res_level	rid;
> +	enum resctrl_event_id	evtid;
> +	int			domid;
> +	bool			sum;
>  };
>  

Thank you.

>  /**
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index eccdfcb1a6f5..7ef5cf0c4d1d 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -45,6 +45,12 @@ LIST_HEAD(rdt_all_groups);
>  /* list of entries for the schemata file */
>  LIST_HEAD(resctrl_schema_all);
>  
> +/*
> + * List of struct mon_data containing private data of event files for use by
> + * rdtgroup_mondata_show(). Protected by rdtgroup_mutex.
> + */
> +static LIST_HEAD(mon_data_kn_priv_list);
> +
>  /* The filesystem can only be mounted once. */
>  bool resctrl_mounted;
>  
> @@ -3093,6 +3099,63 @@ static void rmdir_all_sub(void)
>  	kernfs_remove(kn_mondata);
>  }
>  
> +/**
> + * mon_get_kn_priv() - Get the mon_data priv data for this event.
> + *
> + * The same values are used across the mon_data directories of all control and
> + * monitor groups for the same event in the same domain. Keep a list of
> + * allocated structures and re-use an existing one with the same values for
> + * @rid, @domid, etc.
> + *
> + * @rid:    The resource id for the event file being created.
> + * @domid:  The domain id for the event file being created.
> + * @mevt:   The type of event file being created.
> + * @do_sum: Whether SNC summing monitors are being created.
> + */
> +static struct mon_data *mon_get_kn_priv(int rid, int domid,

"int rid" -> "enum resctrl_res_level rid"

> +					struct mon_evt *mevt,
> +					bool do_sum)
> +{
> +	struct mon_data *priv;
> +
> +	lockdep_assert_held(&rdtgroup_mutex);
> +
> +	list_for_each_entry(priv, &mon_data_kn_priv_list, list) {
> +		if (priv->rid == rid && priv->domid == domid &&
> +		    priv->sum == do_sum && priv->evtid == mevt->evtid)
> +			return priv;
> +	}
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return NULL;
> +
> +	priv->rid = rid;
> +	priv->domid = domid;
> +	priv->sum = do_sum;
> +	priv->evtid = mevt->evtid;
> +	list_add_tail(&priv->list, &mon_data_kn_priv_list);
> +
> +	return priv;
> +}
> +
> +/**
> + * mon_put_kn_priv() - Free all allocated mon_data structures.
> + *
> + * Called when resctrl file system is unmounted.
> + */
> +static void mon_put_kn_priv(void)
> +{
> +	struct mon_data *priv, *tmp;
> +
> +	lockdep_assert_held(&rdtgroup_mutex);
> +
> +	list_for_each_entry_safe(priv, tmp, &mon_data_kn_priv_list, list) {
> +		list_del(&priv->list);
> +		kfree(priv);
> +	}
> +}
> +
>  static void resctrl_fs_teardown(void)
>  {
>  	lockdep_assert_held(&rdtgroup_mutex);

Reinette

