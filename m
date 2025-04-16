Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D21C4A24
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823017; cv=fail; b=hmpyIdTC/Y6u/skGsceydQsJSNvknbqUkDrR7sS1WA6AgxUxef+ObHUr3emoRpjmfgocA/LilzJdcjzl8wcrxcY2/f35FmNCYxUPHfpQ+7kgyn7wYu9+QxN5BVvUi6QE1pLIKNTmf2UMniFGb67CNj1Y46PQ+WHTMJ4OH1VJt2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823017; c=relaxed/simple;
	bh=7HeNK2i6ShZANnva431d3VPvv6SOK9a9caY4AtPI9ds=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A76idsifJ6lcnMskas94Yfqn8M0rL6mIupK0vrzrt9pjICEmNflb27zGkYhTcRdkX1YXwa1PsTLzOZBO4gIRyIlih3M4S9xCXrUwpNao2zDjwPv6ilUqDsStrtuPmY9dZgfIFbBw/7q3USiyGCB9tDowXJqJsGrf5jDve/YKEJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFxOGkAo; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFxOGkAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744823016; x=1776359016;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7HeNK2i6ShZANnva431d3VPvv6SOK9a9caY4AtPI9ds=;
  b=aFxOGkAo9upr9RUeAGgQyUG/CdPSvSea4qeQ+0wjk/K6k8eP79ig78xP
   aNA0NwxBDdkkcb7fpJLOjTSAGredXW0oBK7k2WOatLHKRCAsZydC6UPrl
   46/xrrFErA1NWOgRdLvRG2vjRk57LEoek2J3e1z/BMHvo1pBeptiDOs8c
   Cf0ueB6+irH04tk0PdinDaBSJ6/zz++tb+jobkOKbuCiTNXmLLpkfp5u/
   9L4w/4oWLb5TzLfu7RfFt/mJFgAHAUXf4E+IkTKoEppzsJw79uaL8aLYY
   fVH5V3w0sRhn+6WsVbMu3y3xrEmlYFIXi2EHsJntm5ccXK/xXAEksoClq
   A==;
X-CSE-ConnectionGUID: Yso1LUppT6+f1O0IgTWvrw==
X-CSE-MsgGUID: 7lCetEg4QHed8RbYEerw2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46277955"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46277955"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:03:36 -0700
X-CSE-ConnectionGUID: LuU0MzGNQeC6h5g+1IFdsQ==
X-CSE-MsgGUID: KBcRD6rST4SdPc/MfWfVbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130390976"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:03:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 10:03:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 10:03:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 10:03:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaHztkc40vqIJSQKgdutT5cJWbO/4s5oxfJBfeTUa407Z2VVAFN2Rd7IgiwfxxNB+4lpuMIX16LwErokL4rBdAmDZNoBT6QodUGOA+ACtF21gHIq45UY+nYvh+o7zWau5U3/7Mghin6VJkq+wyT6FRm/OCX9XOizN1faHBGD6ikL8zzauVFpKMJC9+ERS/qeJZ4etL3k0OIHJxBGB3QiDD/oq2F1AxkH8UrnFYZvacgH3/Dr6LH2znw+0hGHXRVUujJuUqfiDGebVXgEm9q/jSsIZ8/zQc58GgD1b+YwkNLj/bEuRCag3r6OG5HXVlJWUrmMEDvjSjYhmNUWuecmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0E1DjT0JD7hBneA+UWstVpNZTpFdUr3L/+ilOmOwrhc=;
 b=Jk3S54Jhm0dmOaZsxv4DqyjDGRDXXQGhS8Jo3VY21yPZxTe1HhPh4nrfuo3ZA0JTHXFrkEoJ9iXYe14vI6yo/fKceCOLafhS8dkl1h/+juwDR09Bo86w70aITUTHUDOaSScTtbRJhFO5QqckswJ3uh+0nG5I1q4kbORWAl7hnTVdAi/Pv/LxzDUUhujZ9DuUH5c4dMF0CYfFoKdYU2dm+l+6esEjbRu67imINvxzJCNVe99L66pZZYvrKkYbFiSMFFzMp405xWrRDo5vNNcPopgmfOt7yKpK3h9yQFlWrqCkI6umo8iH3bRIWtmRYJDoEkV/QcTFVzoWesrdmfwggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 MN6PR11MB8193.namprd11.prod.outlook.com (2603:10b6:208:47a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 17:03:03 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 17:03:03 +0000
Message-ID: <80368392-505a-486e-93ca-73737dd8eb6d@intel.com>
Date: Wed, 16 Apr 2025 10:03:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] x86/fpu: Log XSAVE disablement consistently
To: Sohil Mehta <sohil.mehta@intel.com>, <mingo@redhat.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <Z_onl1QbH9L1-8dq@gmail.com>
 <20250416021720.12305-1-chang.seok.bae@intel.com>
 <20250416021720.12305-7-chang.seok.bae@intel.com>
 <d67648a0-925c-433a-a33d-1cdba02cacef@intel.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <d67648a0-925c-433a-a33d-1cdba02cacef@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|MN6PR11MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb31108-346f-458d-d782-08dd7d088c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NllTbDE5SkJJbFl4MzRRei9JV3ZTYWVEM0tVVVVaYklOTTdSVHZKK2dxL0dn?=
 =?utf-8?B?K3Z1VjJXbDQ5ZEtwQlRmZmZKTS9IUW5aR2pwWW1ZT2UwYkxJWXNZdDRpL0tO?=
 =?utf-8?B?dmU0QURZMUQrd29qNHZyeDJpVTAyTE0wWGNGREMvZk9HcktMVXI4ZEVtcWoy?=
 =?utf-8?B?L1dCY2dQUGhVRFNKcFk5UjRrbUJ4N2lxQ1RPQjFYbGdqbDJUSjE2K3BySEtm?=
 =?utf-8?B?d1RvSmZETmJXeCt2M2tpWlU2MjVVT05VcStKMmgwUDljTWdsaitnaUExNnE1?=
 =?utf-8?B?WDRBRWJmLzBhSWtkb2FoNXNnQWVqRWZ0ektGa2lFNXdWTEhRei8vVCs4UVNL?=
 =?utf-8?B?MXoxb2JaT1lqUWxoVjZwc0FjVzFFSHI2dHhFeCtxY3ZmT0lJUGt0UlFxczJi?=
 =?utf-8?B?L2NqaGs1UDllRGJaTStXR3g5WmJDT01LSGY0TmxJUjV6SG1laHNyc1ZKaXhU?=
 =?utf-8?B?MktMZTlPMERnUkVTdkdsTGlKYXhFRE0yR2w3UjV5bHNtMHpPOGZRVE5KOEIx?=
 =?utf-8?B?V24yaVBBUHFEK0pWVnIxSHFITUxQZFQ4Vy9BK3VLQzZkeXV3WTNmMzE2Rlhj?=
 =?utf-8?B?VXNGbWJhcGR6UlFPUDhjcUd2NGVlaDBBaDAvQjMwdnlxU1FqbzErZ3MrNmd2?=
 =?utf-8?B?b1dTNDBKTVFkMCs5RVZjQ3M5dW5JanVGR20weWF5SmJQVFFpNC9QTFdzaWZa?=
 =?utf-8?B?Y1lmTXUrakpXL3pzaEtmYXZFZU5ETzRVdlE0bFU3TVc5N0lsakhHOUoxQXNq?=
 =?utf-8?B?WmIrWUI2R3QrQlF4RVpYUlJ4Nk9UV0oyMDFjanJyN3k2VENiRGNzZnhweWNS?=
 =?utf-8?B?cGNoM0paOXVFd2Q1MHBSZDdZU3NsV1lzbXYxRG5hWnRTZnNaL04vMjE3c1cy?=
 =?utf-8?B?elRCSDBEcGVWZ0g1VWs5UFJoelhBSVd2aExoK2dUV1JiamdkTldRNU9WNm1Q?=
 =?utf-8?B?TXc1eWI0U0tlT3pTNkpYWkJ0WHdrMFdVQ014R2Rtc1NtMExEUFVBVTJnMW52?=
 =?utf-8?B?dmpKdEtneDg2RHZlNm4vdlk0c3BBM2E1QWFYVWJXZ2pvalA0M2lXSlBtbFB4?=
 =?utf-8?B?d0l2VzY1Q2NsZ3VIRmtsVlgrRlZYcjFUeXZ6SzVISkpQZWlScVYxUFdBUXpl?=
 =?utf-8?B?cmFPYXNzWDV3OXJKb2tRTXpNVDNvUjFBQmhGcGsvb1VFaVFuSXA4bHFiRmJK?=
 =?utf-8?B?TU5ZdTlwTmJGcWdJOHlGU2JLTFF0NUpXMjJlN3ZHNFdWdUkycTdtOWd3RmNW?=
 =?utf-8?B?eFRUT3lKc1NwKzdVUm5xRWVSeW0xZTFHWUJ0STlNVk1TNFM4VkFES1VFOG1M?=
 =?utf-8?B?anI0VXo3aHpKSXptQThLNy9KUTNadUl6cENwaWR0MjBCRzFXc0xTeGR4K2lI?=
 =?utf-8?B?SkZSb3pTcEp4N2U0YjByRGE1TFB2UDJTcTJldXM0NWxxNVg3LzFCYUVNWkpM?=
 =?utf-8?B?ZisvYVlFdW8zbDZMMG4vcHZwK0N6TjErQVd2OC9Eb05rVTVweThsYWsvbTVK?=
 =?utf-8?B?SlJqaXNRWWdOWnRvTmU5OTJ4azM5YnVLWUZzbXdHRllTQjFHWE8xS0FYei9r?=
 =?utf-8?B?R0w1L3hLazRxOWZlR3BMZE9mb0lrbEJYSHhpSHh3TUhqOFh5T2NTSnRHbXBs?=
 =?utf-8?B?bUI2RlpFUkJUMGY0NU1uNlJDa2h5SXJQeVBwMWVDeG52VzNQMGxkOFByY3dp?=
 =?utf-8?B?cTduV3ZCejF5cVd1U1pPTG9JbjBYMmd5WUhIUExiSDVZRUtNRlM0V25BM2Zj?=
 =?utf-8?B?bjNSZEhwWGRtQWhIUW5YVHIyU1NmeVhkQUMwTDU3SU1LZmJQM3hUQVlpTEhi?=
 =?utf-8?B?U3YxREFxbXpJN0FXNXZkRnZaVFBoQ0ppWjVlRmUrQ0JRRjhpK3RvemlnRytq?=
 =?utf-8?B?a2FuYzZnSmwweDJEQWRqY1lUYnVzazFXUEhjemFnYkp2YlBnQ3pGVG1iTzVy?=
 =?utf-8?Q?z+fW3d8i+JY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVVGd2RMWkFUZHZ2TGxVUlNzQVIvQThjYU96VExsTEU3TThYT3VXV3E0aHRD?=
 =?utf-8?B?RUh5bTMwbjZiakpuQXJMUjZlckVRZ0R6M2I4ZWF6UTVsd3VtSUpsOStLWVdm?=
 =?utf-8?B?WFlGSml0QURLSWxNTDNWNGQxcXVNaGlZVGZ3ZmFvMVdmcE5vcXJUaEc4VGlB?=
 =?utf-8?B?UzlqL1BsaW1pWUd4YjhaZ21DeTEwc3BuZmMxcm8vNEoxMVFobFVlVWtmdUJU?=
 =?utf-8?B?N2xpVzJKNEp0eXkzYW90Qy9NblVRQmd6WmRnOTNnOVhpMTFBTTZGaDJmQnQz?=
 =?utf-8?B?dklqMys2UDR2SnQvOEFJM1FsODNYTE1ycER5QTdxUjg2cnI1TnFCM2tsTTJN?=
 =?utf-8?B?QjJJUjR4WjRsYkZ5K2RzZ0FHNURaZUFSbXRyMEYrUTYvWWtGdDltZWZiU3Ix?=
 =?utf-8?B?VHpqdmRmNjBCczBPLytkWmVVN2sxSng0ekJ4WExERnhRcStLWHFmMGVBOVBD?=
 =?utf-8?B?QVVxNVJmRStDYmlseVpTN0RvTUpQck9lMjFuUHJIOWZla2Y3cmZhMGZnYXBG?=
 =?utf-8?B?WnI3ZWZXZjJjMTB3cCtWUmErZGJObEc2UC9abUgyM3liazNldituTVVjNUV6?=
 =?utf-8?B?TWQ4MGN5RVcrSGhBUnY5V0FERHR0VHg3bUp2Z3pVQmxPSHJ5TVM2Ynh4NCtZ?=
 =?utf-8?B?TFNJVG8vUTROdWQ3VDB3RUpkM0F5QmhmcWxGU3Q2RnptQVJ1QW1sdHZ0Tnl6?=
 =?utf-8?B?RjBFV3dYbzBFa2Q5bG1uUmxmSUo3bG5wb2JkUDRWY2xPRzErOWpWV3JhdS9Y?=
 =?utf-8?B?aDJ6S0czOXZJVXYva3orQnFTbWtFYy9nWlJjVE5MMGhiSTJYb0RUN1VGNXVs?=
 =?utf-8?B?SUk1amdua0JIQ3hMbkc2VHVlc2lyZk1tSm9FbURxN1BiL2JYTFNvY2QvTERU?=
 =?utf-8?B?djJ1Qnd4QjV5L0puUDNjbEV1R21qTFRYMllwSFRkNDV3YVQ4aEFpT1ZxZFlR?=
 =?utf-8?B?UTE5bGU5S3ZaVkNiRERtekhIUXZlWktta2xyZVpCVVRMNS91M2hrSUkwT3M5?=
 =?utf-8?B?YnhCZkJsRDZ4eEFSSWdFQ1gwVGIyY1N2cjRVYm1UdGd5Z2RGUjQzY2xXNEZX?=
 =?utf-8?B?RUhJN0VvSUNmaWZqMzlkMGVIbW9vcUd6S2RQSndHd2RBYkZWejNIUWFoc0hp?=
 =?utf-8?B?S0ZoRSsvWjZGRE5VZG16bUlQWi9tbENsTktDRGl1Z0tNQmJ0ZG1lLzFRaHp4?=
 =?utf-8?B?RmtnRHlscm5qcTE4bE83YnI5elVjakQ0Q0RYdjRmYkZybGxpaHBiSFlONVoy?=
 =?utf-8?B?YzBMaEwxZ2xjYWt4d25jTGJhbzZhOTlJMXkrMFF3MGhhNkEyWGtsbTlBK2Nj?=
 =?utf-8?B?QllDS2VKdUlHUmc5aXhWS2NxTjFjZ3MvMHlTdStMMGlMeE9WbW9oVGt0WkdI?=
 =?utf-8?B?cURFOGNzWEdYeEdNR25La0VVMUhvdGpsZmRBb0FDQ0R2c1ZzTU5vaGR5OStv?=
 =?utf-8?B?dU8xU25xYmVTVE1FWkNjU2V2QWpsQnBvOEpaQ1hOTU5tOHlza2w4cXhGMmdM?=
 =?utf-8?B?aW9mWU5vcWxYQ1BYV3hmUTdhRTVCTTdrOHBSUWJpazZRcUttYTdjR2YyTnRJ?=
 =?utf-8?B?bjZVcDBCVExiSlU2ZWxHL1lHSGw0UHFDbyt2WW1ocUlXaWZXdGlFTE95cHZE?=
 =?utf-8?B?WVIxeVpuVitKM21QQW9XciszbDQ4eGp6SmZYdXlvd3VCU1REREdGbS9mWjBG?=
 =?utf-8?B?eTVUYlp3c1doNHJOcUltSnhaWXZrMFJPRzdiekdNYTVHK1NlQ3pkY2NGb001?=
 =?utf-8?B?Uk9Yanl0OGVqaHVYMWhYYWJIeGZEdWFXaXViQW5odHcxZ1htNXFLc0NseXZq?=
 =?utf-8?B?U1JvMGFIdVYwRExOZE9VUkdCZnduZDhJR2h5UGk0Mi8wVkR1WUhUTUtybkpD?=
 =?utf-8?B?dnFiVkdVeGVLbUxTdXk3S1RjOGtveERoei9ZR3didGdXMHVzcmFMbkpSd0Fw?=
 =?utf-8?B?aDM0YU9DbFJFT1QrRkJlS2xsb083MTd6QnJueHEyNExUNWliY0FaSXQ0Mi80?=
 =?utf-8?B?NHlGU0txN016eG85STZTMHdUNGRnWExkWUZvN3htT3lVOEtvVkhEanpUcGtD?=
 =?utf-8?B?SG56Mkx1dzcxb2xPblZBWjB6NklhTmpEVC9jTXdoaTV5b0dkWnRSMUJxMG5C?=
 =?utf-8?B?eHV3TFpLNFZGdzFtVFI3djQzdVNsMUxSenRPd1VNUkd0K0l3bUxuMjk3VXN6?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb31108-346f-458d-d782-08dd7d088c9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 17:03:03.1119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wiMAESbPOo9rcTfmEx370v/bTmYUMzx/cw5obc4Y2SG9O0K27LgiDyi8cwUx4H7q+zlfnHdNH+DnOFIC2I45gfLTp79rKdG95KDdx94FRZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8193
X-OriginatorOrg: intel.com

On 4/16/2025 9:56 AM, Sohil Mehta wrote:
> On 4/15/2025 7:16 PM, Chang S. Bae wrote:
>>
>>   static void __init fpu__init_disable_system_xstate(unsigned int legacy_size)
>>   {
>> +	pr_info("x86/fpu: XSAVE disabled\n");
>> +
> 
> There is a mix of pr_info(), pr_warn() and pr_err() to log these related
> messages. Would it be useful to make the log level consistent in this
> patch or a follow-up?
> 
> I think new the "XSAVE disabled" print should be a pr_warn() at least.

I think pr_info() makes sense here, as it aligns with this hunk:

static __init void disable_smp(void)
{
	pr_info("SMP disabled\n");

	disable_ioapic_support();
	topology_reset_possible_cpus_up();

	cpumask_set_cpu(0, topology_sibling_cpumask(0));
	cpumask_set_cpu(0, topology_core_cpumask(0));
	cpumask_set_cpu(0, topology_die_cpumask(0));
}

If you strongly feel that pr_warn() is more appropriate, then it would 
make sense to update all related messages consistently. But honestly, I 
don’t think it’s a big deal either way.
