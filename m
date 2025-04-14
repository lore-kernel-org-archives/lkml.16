Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1834223D2BC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652751; cv=fail; b=JalODPGF1/ObSvI6WmbPAPggGSAgas47OIQ3vDLF2lC1go2u2MtqaLXipIsvczlTBU3A3wbw4k5rXF/7WniQ2o3S3kNmtrfrmQ5gRGmdLgm3+EAY49pHK/Y1JcLJ82HF+hQyBXHZArUmHZPB/KKGhWoDSMMqnqAbGruKHoWvh6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652751; c=relaxed/simple;
	bh=bAK6HP54CMPxKJUUplgeaLg32/PU1A0lOdNmY1xQVY4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bh23t6zead87T7Iu+gnNYVOfgoGUfKqqNz6LrMLhVNpL7QmzMWYXEyN8Dv3lm/E8fbfXOA3FHIRcMHC1B3KX+oYd1bHVGJXDW3os3kZPRgpQDJ1Y1WIehbuWxd5MG2JztmKNX/HOPCwK7ICuz8jBHnKeJqZLQWyO6I+NHWwOD/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/fRxrTV; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/fRxrTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744652750; x=1776188750;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bAK6HP54CMPxKJUUplgeaLg32/PU1A0lOdNmY1xQVY4=;
  b=X/fRxrTVcg/DiXVHh/hojK5b0HvrAKlTMlFTnnlq1oU+CmayTdYRSVI8
   JTkEbQZ0tsjYeiWK+BMXwJXtIlwvyf9cmIMTwKtdhAqk2OSIrg/ZjEdU8
   jbyyOuu1N6CsfPnjREDLf0RNdFsH8FH9t30Msho5MaSxvUPxpZEVdMeOQ
   YEnOnGaY1GaHck7dMivNmwL9k+KE6PmaFaK2/V5j8jE+MFyeu3IH0YIXp
   l/MJpEAa04oCyxRPL7ZT3iwXYQkuBIaFRIJ8RBIlr8ZnZILeh6SaKCYsr
   xhBY3sEoflf+kGjcNFVe8CNpPn6noOugEI68BCBIst6JaneDb0wZZ/uwX
   A==;
X-CSE-ConnectionGUID: D7XqGLtxQUiA52EnesbF8g==
X-CSE-MsgGUID: jlcrjg+OSzmaUepjDI3Pvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49940239"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49940239"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:45:50 -0700
X-CSE-ConnectionGUID: QOW2mimyTS26tSjsSpWf7Q==
X-CSE-MsgGUID: 8NYnzxxzTKmcqokbBU0Vhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134656087"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:45:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 10:45:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 10:45:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 10:45:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teUaLrrA/6965fzTDJ2oPSyoGRoARPIj/e4w7dQP3KXM/Zr1XeCh2GOsddoIkLxKVhFl/cosaHw1zc0SS6VYfI7LoL9aw9vDfnupvgurrxZi4Tt65yxB2o4jvl7gwoO9VgJETpRzo6CFo0gjMVPOfZ7jFRvxsoWP0NtvToQIyCZUi08EksUVUE+JeNkDEKABlxNfhXqVZAwS1V80X2Ca0FHfRCZ8tGVaBttxwiekqackvOQLEDrvkH1bh8w0qJ6Ei0hcZdNugEPqnTlJUfox3sKxy6wcJZxUHVJJ+AA8WspgYRAbajD+jT6ivK3mO+KQoTNunyN4fB+25CczUiijoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlxMMz7mk9crzZE4wBEqSxlfdjbrf1ZfhSfK6njbMn8=;
 b=JpDq34nyqhWkw2OhN54NOO7nmhY670YBIm3I3Or0Wpd5cufdXHsPyxrR0tAAg4bbm2nEUr32SF4s4qTUr/7qOUSWfiq9eqICSwtHwKtnjUUUJg/ByYrW5EDx+s5PbUoesGWIvIoRfQhDtytcweuYBHYsKtHNPfhleZTUgQ+EgrVbd3G+vhDtEnr1VrfJn/7V8Ep8zLhIjDKrYFLPQ7PVvw9U+85gLaQbA27w1cdCGbxcuh2hG4FFifHxkAg5aAwJuDrDpw7CZw1dORd7JBlcbKWl1BwtkgAVxYUk0yPgNaX25zmT5CjGA5p2soLyWV0w4P/BFnmF52D2u+9GQNzojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by IA4PR11MB8891.namprd11.prod.outlook.com (2603:10b6:208:56d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 17:45:45 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%7]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 17:45:45 +0000
Message-ID: <10032664-c16e-4599-ae10-3d2b1aef0265@intel.com>
Date: Mon, 14 Apr 2025 10:45:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2a 5/9] x86/cpufeatures: Add X86_FEATURE_APX
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>, Ingo Molnar <mingo@kernel.org>,
	"Chang S. Bae" <chang.seok.bae@intel.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250320234301.8342-6-chang.seok.bae@intel.com>
 <20250411161250.14662-1-chang.seok.bae@intel.com>
 <d076ee8c-0c22-4e99-964c-5ea254f5be14@intel.com>
 <7b91d929-fe97-44c6-aa94-05417bce1014@intel.com>
 <009062d3-d4db-443f-8337-ae4223efffa1@intel.com> <Z_onl1QbH9L1-8dq@gmail.com>
 <Z_zGCCNE_Qt3IlMZ@gmail.com> <eb33f181-a89f-47a9-ad98-f5a079920950@intel.com>
 <d6d19e39-2749-4d45-aeab-a209a0ecba17@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <d6d19e39-2749-4d45-aeab-a209a0ecba17@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::31) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|IA4PR11MB8891:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8a0e36-52ba-43f0-bd60-08dd7b7c2eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emg0OGc5dU1OMzFXTTMxdG5HajVtVk8vL0xkSUttT3JFaHVCd2JxZFd4ZDZF?=
 =?utf-8?B?SFIyWDZncnFsVkgrRGtGRnlNN1VvY3puc3FJVk50ek83OWZRV1k5UTJCRVlR?=
 =?utf-8?B?Zko4UTJleThERm0zbmM1SVFiWWk3cFV5UDAxVWxIdHlQaGs4bmRQRHhwNDl2?=
 =?utf-8?B?aW5BZW9aZklGWTdTL3BQODB6TDNWMVk1T2JDajJ6OWRzeVgranlPK05TVDZT?=
 =?utf-8?B?SzZXU3BIN3ppSlpLbXRhNHVFMjBNSXVkT0hvcFU5VWRQNGcwL1htU0NjOERu?=
 =?utf-8?B?MG52RUl2S0tGYzBBeDlvZWs5VE1DS2prRHhDdEdOeTYxY1dvbVdVNytCUEpD?=
 =?utf-8?B?SXJhUENXRWp5QU9BbWVleXdseTFKVGpvVDJwTG9YM0g1ekhYTlVIVnN0bzBN?=
 =?utf-8?B?YlhubFcvZjZtbnRPK1gwNktrRDFwdWdKaitRUXNiU2FEMHBzT1ZoOG5XdXFD?=
 =?utf-8?B?VFB5eUpXZVJWdFpNT3BiOG05OHNwNFloTTJFbjZ1elhaTEk2aUdqOTRCd1VS?=
 =?utf-8?B?OTBUczg3ejB1dUtlenBkdEh5ZGlTVjZ4T3JtcE9SOFAxVGo5ZTdveVRpK2J6?=
 =?utf-8?B?WW1qVk5xUm5uOUNlaFZKMzdZdCs0NnVCanc1ZVhUbW1NaklIM2txSWU3Z01K?=
 =?utf-8?B?NUxUdVhFNmc2UmY0ektyTTFxYWlnR29BQktZdWhtSHNDTVFmN3ZPOHc0Yks5?=
 =?utf-8?B?NDdjS3RyWS9icmlDaHAzQnMwWVB3NHhHUlhCMTg4dWFESUo1YjBHYlQ4RXpX?=
 =?utf-8?B?bjh2bDE3SThwK1NBU1o3TXNDVTdmc0hvcUZLaEZjSjh5WmNrL3puWThiN2J1?=
 =?utf-8?B?dTNSb0F3ZlhZSlkxVzdnam9ySTh3OUZqVnN0bTJJS1RneklVa0hraHJMK3B2?=
 =?utf-8?B?dStoL1ZvSVVuVFdEbjI3NFAxcXVPWkl0czF1bnJDWTE2YzVERzFEeHFWNlV2?=
 =?utf-8?B?QWpDYWpDVThKYVdnTG03MVNDeWpZU2VFMURkZlYwaTJ0RDVFc08vWHRweHhq?=
 =?utf-8?B?NmlSTnIzMi9qLzBTaXZ6eGdibUR4b05TSmh3VDJTS0RLL2NFc0l1QnU5V3da?=
 =?utf-8?B?RGVReUkxeGJ0SUp6bkJGQkhkY3piWTVGZkt2RlNkaEtZWlFOOXdkcVdubFNV?=
 =?utf-8?B?a2wxZy90N3hsUnNGRERjY3hxZGl6SlhTZ3N1aW9sMEpLcVFCdWQzV2Y0cld6?=
 =?utf-8?B?aERnc0p3WnhzNjUxVG1lNEhRZW5vcS9sR0s3NUlxTlhSOHYvc0kxVk9PZFZh?=
 =?utf-8?B?SHNPUUkwcHBaVDFMSjcvU1IrdVBPT1Jab1FYMkk5czJPcjFhVzVIR2orNGli?=
 =?utf-8?B?UXN5bjM4SytVdG82MnQrQVU4TWRsVXY0bW5pZ2xKZVhscExIa1c5S1hjRTJ5?=
 =?utf-8?B?UVdhQW5qbDFCSVF6VGJBcitndTlpcWxqR1AxSTU1N2ZuUGxTaVhPNzFFSWxq?=
 =?utf-8?B?aUtYQlpUZzdXeDc2NE9EYUVBc3Fpdm1Sa3hPL3hmams2YjUrY3dPb21vS3Np?=
 =?utf-8?B?MXpnbWdaM2FOMEh2Q0QrL3RiNE1ZdElPd2hzYkxOamZBbHR6V0kzNDlBNEI0?=
 =?utf-8?B?bmxtS1NueThDMXpERGtGR1Q3UGdZWVZWSytMUkkvK1VLKy80NmV5NGhFcjFO?=
 =?utf-8?B?bUp2NU01TnBmcUw1cGNweEdFMzkyL3B6MXN1M2prejV3K2Q1Y24zYVhaTmQ5?=
 =?utf-8?B?TmY5aDkxNklSTVFFS3RyR25ibm4vVDBGbVBqaGl4Q3JsWjgvRk1rcjdIWVVV?=
 =?utf-8?B?VlUyR3JEOTQ3cUU4VWpNNkZIUUFNQXRMUVNjczl0UTFXaVluRGlINVFpMlgw?=
 =?utf-8?B?TmtIL1BQTmZHTUJDNy9lVEZXSUpic2pSbWxXOXplVlpHN0ZFdzRvT1BNMEI4?=
 =?utf-8?B?Nm1ndXY0c09YSjFRZ3ZsaWExZE5mTzNmY1BsbVA5cjhPNkV2RkNkRGdYUkdn?=
 =?utf-8?Q?E2LY0PinoOM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXl5SUpFaEJkZmtMa3pPQWlib2lVVk1PK3pQVlpSM0lVMXQzYzdrYTA0eWVr?=
 =?utf-8?B?WFlpOUh4Lzkybjh4cS9EQjFleW9xVkYvUEdGUDM5N1NsOHFPeUFjWnZCVXJD?=
 =?utf-8?B?L1FRSVlmU2plODh5cWNaczA2NzU2OGxjZ2oxRnNib1pxK0JPYkpqTHVxMHow?=
 =?utf-8?B?M1B0dDhkSWZQUGlIUk5SMUczaDBweDg2ZWxpT3pKK1A3TEtFZTlFUmhmbXhF?=
 =?utf-8?B?Smdoajd1NHBmSUx5U1lFb3creDZwV1R2WGdBMllFc21iUHdDMWIrUlord1dD?=
 =?utf-8?B?b2NjZStSRzh6MitPRGJaN242ZmU1L09SejBsbnEzSkN5dXcvdE9mRklSci8w?=
 =?utf-8?B?RXdTUE5ld1dZblJLNlBXQVVzZS9sYUEzbk1LZU1sT1U5dmI3NEFMcEtJWkRQ?=
 =?utf-8?B?cDBOZmxMUlVXWktQY1lNcXZNek01SEJhSFBKOEROWEtjZGdDbXlQRnN0b3ZF?=
 =?utf-8?B?dHQvaTNDWXhocXU0Uk9ISG1ZV2RtMHN0bXdmbmRaUGlhUnlBWEZPc1dZMXJw?=
 =?utf-8?B?ZkRJY25aYkJxWkFsSFg4d1ZDS0xOQ3VPUDFTT21JMERocWxzQjZDMUxQMmE3?=
 =?utf-8?B?YTFwVDlsaXp0TkM4ZzVhdHVqMlFPRkczYi90MnBIUFF2cXd2d3FNNEllQTJr?=
 =?utf-8?B?dHduN1ZzbGZTWkZOQTdTa0pQbDNKcUU5blJ6aFB5b3N5S2locWZCYjRxaTM1?=
 =?utf-8?B?K3ExY250TDZVZmZGbEozWStRTlVpTlF3OEsxcGhLRVhaYmk1M3JMK1EwVktQ?=
 =?utf-8?B?akZnSkRXbWgrWit2ZXp1WUZ6SFRqTlpHWUNuL0xJanVwbkRxZjJsVlhnZER4?=
 =?utf-8?B?MEdMczk5YzZKZWowZzZGdjE4aXBrM2ZTKy9VUm5pU05qMVpWMm5kTmcwckl2?=
 =?utf-8?B?T0lCK0ljRHZQVHRwTVV5QjNaZEliZ0IzaG14eitxbUpDUE55Ri9WcEMvWVJa?=
 =?utf-8?B?Y2N1cmtlbCttcjVGL1NlTjlXR1RZbFBlUFJBNGxyVUJOSGd3ZjNBQklIVDds?=
 =?utf-8?B?VGZydjRnVUxsUkdoUGlsT3Yvc2QzN2pxN2djMU5MMkViSVlmQWNOanZjRjdZ?=
 =?utf-8?B?OEhtdmZJSW54eXkyNE84RXQvMkREcGhlRDB3TVhzdndpdDBCT2huNGV5ekdm?=
 =?utf-8?B?bmVVUXNUY04yQ0lkSG9Hby9HTlVvR0VKdERZZVowTzJDc0Q3Y1IzWTFLdkhZ?=
 =?utf-8?B?c0IweUZEeVRNOWRoRlRacjZ6Um5JbnFxZ0tBNUY0YkYzRUkwRFZTd09hU0Vy?=
 =?utf-8?B?YVFqaUsrTlZ0MXcvVjczZnVkbmY4cVFaTk9DUWNxMzBGMFQxMzdFd0VJdXpm?=
 =?utf-8?B?Ukk0aU5sdkNYVmJDRkFZSEZPZG5ncjI5UkZZOWJucTI3ekhya042UXJHYkdS?=
 =?utf-8?B?c0FYZjlUM2hlU1RkN0N1eVNtWkp5d3B4YVFvTjhzZHVBQVNPNW1XMklhQVoy?=
 =?utf-8?B?Rk1Fd2IwY1dzRlBVZWZVSjhLakpWazdWTHRzcGEzTkRaR3BFcVFYd0lTZG1Z?=
 =?utf-8?B?Sk1rcWVQSGpWNVEreTBCbllUeGU0OWI5c3VYa1B1eDVSZFU0SWY5Rk82d09l?=
 =?utf-8?B?b0RPeGExdUQzUG9KamJOTmtmYlBDMnUySWZlZkZXanY4MzJsTmxieVZ1dDRV?=
 =?utf-8?B?U2dhN0hOdjBNWHpLZmxhS1o2TGt4QUZNb0l3QzdCQWJMVVJIZytnOFhHZDNz?=
 =?utf-8?B?TUlZN0tLSHVneVNiNmFBZHhNYmQ5cnRXVlJIeDZxWEQ0VTBTVVFJQ1h5T3d5?=
 =?utf-8?B?MitaL3drNjI5THVxaG9QZlNIeEdRRlVBd2UyalNPc2NYS1hLdmc4MlpHbytz?=
 =?utf-8?B?QWs3cUFjcTB1amZSTEl3NU1yeUR3cHdxSXZNTFk2aDlRUjZLbmE0aE9uZXpT?=
 =?utf-8?B?U1lnMHVqYVhGeERUNkh1b08xMDdaMGtROFF1QVY3eTB1K0llSkEwWXdvT3I4?=
 =?utf-8?B?V1QvM2YwQlEvOUNPdjN0aUMzaGZjbXl5Q0RreTNCckx0UytycVFNS0JBMzdX?=
 =?utf-8?B?VWd5ZTJCa0VvVjlXdmlkMjVSMUxPWHB0R2s5aFhhQWcxQ1pLSzdSaWoxY21m?=
 =?utf-8?B?am4vM1lKOEFESlBvV2Y1bG92UVRWSWlQYlJ5Y2JqWGxZbCtiM2pzR3Uxbkky?=
 =?utf-8?Q?W8xllyUNYVblKYUNhzbpM0p7u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8a0e36-52ba-43f0-bd60-08dd7b7c2eed
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 17:45:45.2569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpODxQ47JrWqv/cAA4IpvMe1Zxve2ONYErJhT6T85ru4+/0NGoSvZzOUyfH+h95ygIWtJxLnYCY35qyCedAquQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8891
X-OriginatorOrg: intel.com

On 4/14/2025 10:32 AM, Dave Hansen wrote:
> On 4/14/25 10:28, Sohil Mehta wrote:
>> Functionally, the only change I have requested is in patch 7/9 to add a
>> "disabling XSAVE" message to the error print.
> 
> That's probably a good idea to stick in:
> 
> 	fpu__init_disable_system_xstate()
> 
> for all of the "out_disable" cases to use, no?

That way my initial inclination as well. My suggestion was mainly to
keep it consistent. But looking more closely, there is mismatch already.
So either of the options work for me.

"x86/fpu: FP/SSE not present amongst the CPU's xstate features: 0x%llx."

"x86/fpu: init_fpstate buffer too small (%zu < %d), disabling XSAVE"

"x86/fpu: xfeatures modified from 0x%016llx to 0x%016llx during init,
disabling XSAVE"


