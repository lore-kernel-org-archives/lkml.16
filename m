Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134F8214A74
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822595; cv=fail; b=l/4mLRsudl4VQGEDo/bAyay+499pBt73hG22+UDi2434fU6WwXkwpIuOfHdYeGbz8rjKFrv0LgRh6MErJ5x0rK8UmAheuxV/FGPX6oGL3smflrE08jWBqQQnQFVNF3+HXOzae2s93YI06oyB1GGtRGA+GwQW7jpEkFBEasGZrIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822595; c=relaxed/simple;
	bh=fIPKZk9NE/OZZQ3KvAnYmSFlaciIkkaZKaIl2vM9PvU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QmINR7ZTp54Ul+I5kmzomZtSVeZXnMRrLXpGOwLu1FctUJKN3Efe8b+IMRKipIk1IWOTBnRxDgha16LJkQNJni5XgukZixZy0bzIqE+oVfoJGv+HN3UkpqQhFG2HVfrbDpzCLPDFY4ah1xGKAA0boarU9yZj0kDPCX73LYKbwiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmLC0/go; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmLC0/go"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744822594; x=1776358594;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fIPKZk9NE/OZZQ3KvAnYmSFlaciIkkaZKaIl2vM9PvU=;
  b=KmLC0/goFiGa/O8kaWt18pOtwHk+u7qFYLojlb3QYMS/IEx0WzPQKNCI
   qdIi9lnEuMpt/cUwilA8lrY88/Wk8lucWC4z16DoKrkpbil0dEywLxlzg
   magLjwYEIKa67ahVh7efKNFphOytRR25uwT3WIL5xkW+KZVHjAGjFWSZC
   Grd5NeF0uq+G4a9ZGgqquCBcKgTq4ZPqMB0UHD/mQUPrsMrmZ2X3dyf7V
   MMGzLP3EXDRYRzQKcWZFGEARy2yK5MEkLzPLREc9mYOdGyg8prARnM5DY
   lezG3HxpFlHt7hITKMUGLhCyYtGUyPjMjUFiIpWQh0bgxpqU+iTe832BS
   A==;
X-CSE-ConnectionGUID: s7sj4uxxTbWHJj7RtDEyrQ==
X-CSE-MsgGUID: Pp+z7T9GSyyiKgB0OPEpdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46468821"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46468821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:56:34 -0700
X-CSE-ConnectionGUID: 0MN0v6LVSzKC1nVmg41Aeg==
X-CSE-MsgGUID: O+Xi31F1Sa6MM/vrwS+L/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135528159"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:56:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 09:56:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 09:56:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 09:56:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKz3ttTBgui2/G5E+Q5Gsp0MpBI9ILbf02+PQ+zqJj7bQVMe0UwVrLVfMXLvLrYL8fggo83RFqrJ/fAjjBaox5nQY33Wf41VY21cVB0JPPBc1B7I0mHu+IhPs0ZcRwXebB2LzAhVcD0cUuGYUzJ+KYF3hOSsDFF7abxGYeo5OboRDz+oT/f3/BKB4Dy4xB3/emLdj+vFQhO6DCuLTWYRtC3tkj867/fK7oIVAp0I76hXUMDoaaRO3Gy8DWiKrnf81Bx3Kh90osLoU8XMFDzPk8hcV04ONWZlxttZ4V4OQnueDKzM7s4Ep2gXYs2nVTxUOlRgEUjXsoz2iK9zwk3O6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTphes8d434rzRfmqt82I53apqipdwqB9h57AlHjFak=;
 b=MU1zTu84Zg86lRuhhe5vlle+cmyWB3UL3Jh1OQUXJJVYGWd95AqWe3yS4n+q77uPL+S91qpj19IONx3ZxMIHkHm0/zjT1WIxGvgyXjRKGgYZ3org+gzc6IuthXYi31J9QqemmiMGwq2HLcoX2UM/dcbepImv4maJGl/GCtYaqG4h2vrBUR9c1s8W7KUclZF6ALpS4smKysdheAFa0nnTDuQBpd2gv9hxX90ibQr7CUGMH6o3/fSvYaqsHLo7l1nS99qRViJApwBqX7OhqsnZvaZkG5A8Ob9iPRE9tc8f9zmFbmSmqNe/v/4ZYQUkuSrWTdM9ONKUzlje+Vj6NJmiNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.35; Wed, 16 Apr 2025 16:56:01 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 16:56:01 +0000
Message-ID: <4dd209b7-0c56-4782-880e-4642516dbf1b@intel.com>
Date: Wed, 16 Apr 2025 09:55:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] x86/fpu: Refactor xfeature bitmask update code for
 sigframe XSAVE
To: Ingo Molnar <mingo@kernel.org>
CC: <mingo@redhat.com>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<tglx@linutronix.de>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <Z_onl1QbH9L1-8dq@gmail.com>
 <20250416021720.12305-1-chang.seok.bae@intel.com>
 <20250416021720.12305-8-chang.seok.bae@intel.com>
 <Z_9kvTUIqOo7htBl@gmail.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <Z_9kvTUIqOo7htBl@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|CY5PR11MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: 74983648-41cb-49bf-3691-08dd7d079128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkMzZGFOVzZIQUxJeitFSkM1NnBOdEtuTC9HZTdZM0RKei9oRUNQWGthWThy?=
 =?utf-8?B?eUtORkY3ZGMvL2dmWEw3UHEyQ292YWN1OXh0RkxKNVE2N3pFQU1nYU8yZXY1?=
 =?utf-8?B?cEJxY2VZdjR5R1Blejh3UW0wVXdTSEsyb2VFaWl0Sm1nVjUzUVhZamxvRlVp?=
 =?utf-8?B?cnE5bTJEL0F1SnVjUUViTW1lN3NhVFFZVExndndRaEtERGlNQk1UZWhkb0JG?=
 =?utf-8?B?VVQyTUdWbXU0WTI1VHFwNmQxa25kK0tpUDhOQVdtaTZGRFRpaW8wT0RtVmNj?=
 =?utf-8?B?bDE1MUduejhBU01NTHREbG5Nc25mNFlDZWNhNCs4UitVUmNTOHNtNnY0YzdE?=
 =?utf-8?B?YzBoaEVEajBDYUhZZytoOFczMDRQYVRZdkZucVhBQkpUNmNtelZYR29MampD?=
 =?utf-8?B?RUovcWVSVzRyUVI2RGN6dUVjRUxOblViN1NTMmlFSDU2aWw2Y3NYM1ZHaisw?=
 =?utf-8?B?aEt0bzBDU1lveGNYRnJZSVVGQzdaaWFrempNRFpaaThURk9jdndmZjBaREth?=
 =?utf-8?B?SCtSRG1QVjVkVnAyQXpCNUtpeFhaREc3NnFVVkJlWXAyQkNXZXpNS3NmK1dT?=
 =?utf-8?B?RGpzb3NPV3habE16cThCdEZZMHV2M0pXSitHSzNHT3ViV3JwNXRwc3c4QjZT?=
 =?utf-8?B?WjZmeDN4dGJxaG9ianNtMHZGWFhjekg0alZkd0FuYU0vM2NFVTUva0VSR3pR?=
 =?utf-8?B?dTBaZnl5ZUU1c1FHZFZhSnBkdW9kblVwSkxTdWc4alZMNkc1dFhXTGFhcDNH?=
 =?utf-8?B?cVdQQmpOTXVPS08rRHdlTk05SUxUTk1hVG9DK2xxZUdEVk5BKzArUlJJUzkz?=
 =?utf-8?B?akJhNTJzL3lEQ0Zic25paXh2c0s4SmVKU2laUWhQZzg3YjdFOVF4YzJNbGcy?=
 =?utf-8?B?VFJCbHREZFdrQ0ZVTDlva1IzUG5iRUtZSVFZTjlPcTVOZk1OcWI1bm8weHhY?=
 =?utf-8?B?MXg3QkZFdUpQWWxrWWRkYXBjN0lKY1FEb2xLOGVBNUgwQ2x0aTVXV2tUVWEy?=
 =?utf-8?B?UStsVlo5bXQ4M2x3M1Q4dU9zT0c2djdFMjlDTmhxbnUrd3E5K211czBvd0VY?=
 =?utf-8?B?N2ZNNGpIOWVDZUp2djRtM0tBU0VoamI1SDFFWDhQYitsZTRQSk9JbE1vK1lQ?=
 =?utf-8?B?OXFETmJJMEZBaWNEUkhUbGw5ZFpMVHdqTitNb1F3U0U1NndOUDJSMjZ1Vlor?=
 =?utf-8?B?clhPcVhpL2VsdUs3RFpnbS9OT2w5dGE1YysvWVpFUUJpaXV5bW1tdnVUUkJl?=
 =?utf-8?B?L1krMlM2OGlIeGVOMTVxR3NyUklhVFZieUdtYnVUZkJaK0JxUU1NRGJubHFL?=
 =?utf-8?B?SnQrSjhSclVUWEVSelQvcDdZZ1NiUGtuZnZTcm5BVlltendDY1BERFlSVVhO?=
 =?utf-8?B?RHBQNGZxbkJTVnRFSjJrbytoeGsyQ0VvRVU5eWVYcldKeW5YcDBIOSt4Qkpj?=
 =?utf-8?B?QW85RmVSU0FrMlYwSDdnRTE2dVQ5UUZ3Z0xaMUlPazZzQzFubFRmYlYvWmdZ?=
 =?utf-8?B?ZlBrVGtPb0dld1BhQWFxclFUQnViWGlwSk12aytNQmRyRkNhL3A1YTFPQ3Zq?=
 =?utf-8?B?Wk5WY0trbTR1dkJpWElLbFZFQlNzWXJpRXdjZnZCb3VLbEpNZEFUMjNwMUR4?=
 =?utf-8?B?YktnN3JXa1AxRDROeFlCWEN6d3kxbFV6MEViajdLMTRLR3E0VWlMYjd1aWhi?=
 =?utf-8?B?VVo5a2ttOWdIK2lJWjhwK3RaUE1YOGZVVmNXTGdHcWxtbmh5Wk9nUW54NDNC?=
 =?utf-8?B?eWNJVGVPTURpMWIxYnoyQjMyNTdJeVYxMXJHcUZBQnMyUS8yRVI4bFluNEl5?=
 =?utf-8?B?MGQyZEgyeDlRZFhFQk1xS3RVNVMweDBodjltQ0xvd1MzcUx4YloxSVMwbmtG?=
 =?utf-8?B?dS9Cazg4NUpLcGxJb09SNmZMQ2QzVmVYNXIrc2dJZjdsVTA4UHFRa1ZvYVBi?=
 =?utf-8?Q?Z2G3/LtFVCM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a05HU1d5d0NxcWhCU2tadTVKZk1MT0h4cEJZQ21XRndDTi9QVy9haHlUWkhi?=
 =?utf-8?B?c0FqMENKRDZjeUdTVHN3dXRLVEVHVlpnSmNpRTZYeHYvMmR4aWdzc1AwbW1T?=
 =?utf-8?B?ZmNoemRINlMyQm5WWGNWK3ZUU0lqbEJ1NG8rWEM5TW93UmU2VEFmSlBqN3lM?=
 =?utf-8?B?cUNTTzRvNTZndXRMTWsyOHRmYWFwZm1OeUJpeUhiRVdlMXA0Ryt1dkhNWG5n?=
 =?utf-8?B?WEkwZ1hUOHhrVjdIUGIxZkpob2s4MUNPM3RVV1FrV0w5NGVvWHZnMFBOZElZ?=
 =?utf-8?B?RElLRHRsSFA5Y3VvS2RIWE5OTU4ydlA4S2gxMzRaNUpBVmgvczJxa2dHWHFy?=
 =?utf-8?B?aDZTcE4vcUo2WWZ4RGlBOWFSSDRGeGIrQmtmMThZWmc2Wk9ORGIxejh3RTNM?=
 =?utf-8?B?UzcyK0grRWFoUnhYalh3ZktoYWluVW1qbmZoVjFPblFxNEkvekcrZlhpTW9m?=
 =?utf-8?B?bnVQdFl6alBSSFhmaG1DS3pXbEVZWUszc1JtUEVabGNWcnV5R1FsYUJsYW9G?=
 =?utf-8?B?UFY1OTJrVnBFUXdmeXF0anFBYzU0cDd0WUtuSWx0RDRWcm1mUVZxMHJUa3pQ?=
 =?utf-8?B?TlI5NSs5UlBtc2ZvV3pDQldPdUpGNXNEVlRJNE9kQmJrN094b01iYnd4V2Rh?=
 =?utf-8?B?WFRUQWpGa0tENDRYUTA3NFVxdDVScUpKU3BTcXlhSExuZmlmM3kwNVNVbE5I?=
 =?utf-8?B?Z0dPYkY4VTYxMkwxOHp3bzU5L3dzeHN1eU56dE1xTTFySEF2eHB3V3loaEZn?=
 =?utf-8?B?TTlwUXkwbEFIeG95OHF5YmNORzhLQy91bjVBVzAyOVd6MTZUc0VwNWlIVm9m?=
 =?utf-8?B?QkxxSDZkcGJtVDF2UmZRVkREY28vWi9pUTdrUVFsSklKR0Z2MXcrcFE5NHNW?=
 =?utf-8?B?M3ZuRGU2cDRWM016dUNCdGtSME9MdHRMNnk1QUd3QU1OdXkydTRETlRyMlFS?=
 =?utf-8?B?N2dMdk5VZGtGYnI0c1pTK2ZzSDFUY3lqajNCbEluS3FkMTNkMWNZQVpkY3NH?=
 =?utf-8?B?SDRwUUY4RStJUG1USmN4b1ExaEt2cXl5NU5sOE41RlNDUGRKT3c2T1I0R0dZ?=
 =?utf-8?B?RngwYmtFSUxoR2NpSm5jdE8rN01WbnRFY0Fkc2JQV0oydG9aajBUdHlFanM2?=
 =?utf-8?B?L001ZzN4Umc5aFVyYXAzVkxKRUhVM3N2UmFJUFppYUpmLzQzQjE0NnpIazlB?=
 =?utf-8?B?KzdoK1RZcDRQSlE5SzRDajdoRkFXRjJxdnFCTEZtRmFpckdpUmtCdW56MmNJ?=
 =?utf-8?B?dGlrWW1DZk5HS1Q4Q0k1b3VRNXVMcEdBc0pBOEhmQ2k5QWd3WWJZQldmeTJz?=
 =?utf-8?B?WmhkcW90Q0dSU1ZNem02elBnK1NmUWxZNGREZW1HcTVQUTlkaWcwRzNaVHFp?=
 =?utf-8?B?WnhNM3djMnVOK3lDcU50bDhseVg5ZklnSUtOS3NqaG9PeWxqUUd1blVqVkNV?=
 =?utf-8?B?eGpvSElSNkNxSmE5Q0M5eWxRRTNVbU1yNWhIWStRMmJkcjRVbUlraXNFS1Ay?=
 =?utf-8?B?a1NNQml4VFU2STFMMUg3T3kvOURRMERyb29CTXV6eW9QT3dpamNyV0VvbVV6?=
 =?utf-8?B?MlFISkJVZVNRWG1vMkNIb3BQZDJrRHpsdmJnMERyb0FYR0daSEFjbG55ajFJ?=
 =?utf-8?B?dEFtRDJjSk5iRGh2bElMa2RLY0hHTTF0YWdxY1NBMnhLTVJnYzA4ZGtGWEkv?=
 =?utf-8?B?NExXci9FalVsZ2dFUGwxUGYzeUpOQU9hRWJRVlNISHpZT0VNVXErMnJPaE14?=
 =?utf-8?B?S2p6Zk0vWjBZMmI5OXd6eThwZ1NHOEExeVhVaUdTZjhRdFN6c0l4N2FRUUxj?=
 =?utf-8?B?SytieXFITDE4SXFSU0ZEcUpqSCthdXRXbmQrVGl3L1lieGJQaEdCWTg3UHB4?=
 =?utf-8?B?OG02V1l3dVdpbWpwZkxZYklCcHBuNVNLby9MMEhja2RlaFF3ckMzTERVUm8z?=
 =?utf-8?B?M0ZMT1VYcSt5bVBFRS9sbjVOeVpGYTVwb3U5VVJ3NmRHbEFFamJCVDhiTjRh?=
 =?utf-8?B?d204TDROSXc1a3piUEttZHBkVnBhcHBPZFdxTlFRRVV1a3BuYkZnVUdVUy8v?=
 =?utf-8?B?a0NGT3FhN21YRXNVR3ppU2FSeThGKzZvdGsyV0FidlZMbkFFWWFlbjJMbFAw?=
 =?utf-8?B?M293TWxsNlMyaGNreW9sUUZxdkV3aGN2eG54OGlONnZ3aWw5R0NMUFVia1F6?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74983648-41cb-49bf-3691-08dd7d079128
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 16:56:01.2445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbNYle3OqVpxfNRfnwAlFyP6eFEx6UuNcBozzqfyWO26vQh+m5WBQcGmRdUvzdE1DfoyzooDxdQR37umEpwuMzDSN+VoysY7z2n+v6RZdkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6320
X-OriginatorOrg: intel.com

On 4/16/2025 1:05 AM, Ingo Molnar wrote:
> 
> * Chang S. Bae <chang.seok.bae@intel.com> wrote:
> 
>> +static inline int set_xfeature_in_sigframe(struct xregs_state __user *xbuf, u64 mask)
>> +{
>> +	u64 xfeatures;
>> +	int err;
>> +
>> +	/* Read the xfeatures value already saved in the user buffer */
>> +	err  = __get_user(xfeatures, &xbuf->header.xfeatures);
>> +	xfeatures |= mask;
>> +	err |= __put_user(xfeatures, &xbuf->header.xfeatures);
>> +	return err;
>> +}
> 
> For future reference, please put an extra newline before 'return'
> statements, so that the code looks more 'balanced':
> 
>> +{
>> +	u64 xfeatures;
>> +	int err;
>> +
>> +	/* Read the xfeatures value already saved in the user buffer */
>> +	err  = __get_user(xfeatures, &xbuf->header.xfeatures);
>> +	xfeatures |= mask;
>> +	err |= __put_user(xfeatures, &xbuf->header.xfeatures);
>> +
>> +	return err;
>> +}

I see. Thanks for the note.

> I've done that for this patch, so no need to resend it.

Thanks!
Chang
