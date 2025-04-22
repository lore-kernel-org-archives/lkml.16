Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5D9284B42
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745334874; cv=fail; b=exDFEUrPHY7I+oKB5pB68NSbBJNgc0U6KkRn2rQh2b09ZI8zLl4ymgI0pmtsBrLC19dhohqzW26cAlquDebn3kPRp8yjBaBGktdXZ9l79bOpt5Xg2yRQJrn1fbNBNq+4wFsEocX7mO20lJ8UtV+XuTWvZlcZRmK4XGIbu128nXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745334874; c=relaxed/simple;
	bh=sGEIXL7DrwJYKyWRUo+2JftMfBAPnWV4Midvrox0b9M=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I1DaYtGkHcDqWb8GFjLefSfqjn3ba8uXPSllUlVI7/+1Ro5giYypvp3TKDQHSAUe7RXXDoQJQIbdaxj1IdSufTGG700yJXgeF8i7F4qqWHCJdQrxdgeF0MLOe1dw2P1qycCsiqD5pN593MOA+eyoOmrPH4rdjb/+e0zCHDWwWTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkJjTIP9; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkJjTIP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745334873; x=1776870873;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=sGEIXL7DrwJYKyWRUo+2JftMfBAPnWV4Midvrox0b9M=;
  b=hkJjTIP9m302jTZAaqzOU4fe8ygv4TjyKdhza7ZEq7qhO86caDEhaGng
   +L24dZgY2lk/ShyZov2mP3jGWTSrrJEvkfYhVEMhzqYGTE28Cv1IL8uGU
   Z8UIh4QvQXbRuRtf0DkxT3P2Bq4O7zB0+VoTOt14zlooIyW3rh9uSR01M
   PJvPI1uhTTnKXSJikm07mDY4JRYE4/MSW9NcaWQNbZDma8sm67gf6QHNR
   pIYwiS/hA8NWbnIggIJTnx6g3KzpYnD+J/knnW/N1ND9jGXrD4o2a6Lfl
   cSfxIOFY72KCFTWPpwPqjlqfDrPN7y6ilDcsWWZQDdNOlaYMsIIdb9Uql
   g==;
X-CSE-ConnectionGUID: h7wA0DNxR/iIa/N1Y2Hthw==
X-CSE-MsgGUID: L+JMGoGDT3y7rPYnSHMNww==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50728340"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="50728340"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:14:30 -0700
X-CSE-ConnectionGUID: yQmXYwHTTDWWaBX4+JONqQ==
X-CSE-MsgGUID: Mp7gGGUcT0iH4U5g6OpV0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="163092525"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:14:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 08:14:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 08:14:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 08:14:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIv8t6FDhl4H+Jl2O72fdqzxCe2tUiyiTalaDR1zOp4w0zEMtF7lUfFaNChtUAOshu3KNlBa2VzOsKf/80QYU7GkqOu1OgebX608cdfOcgcpv03sqwt1LnwglLKyij5Wdcmyr7MRe3SLcAPTfYHwQAoeby2EQ7aGrfkQG3yqdgSIJRBKKSkH/0S6E1zggZEsZ7UC/8uJwafn30QhSpQmffhDFHJFsXtwrCA3/tjX5GJOcuOcBwgj1Q1nDprnS9nFry3xtSEr6rjX1Y9zsoAhhUQLBXJBOEQQeE3E6Nrw3s0OkVzre/qTkL18X7+qoOmp2X+grvb2yqpS6qXtzpY6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGEIXL7DrwJYKyWRUo+2JftMfBAPnWV4Midvrox0b9M=;
 b=w+y/bf1c+HHJnyAf3eX99PYvrJDcnokv6N4oiPc+zoFMNzmulEBkmKzBNmNkcb5Qhk8Zxz3h3O2lc2YOOeB7l8/I2XFsiQAhzGAQkoSN81n4OI8/irSsDNI0/v9R+1QLJFskxkXO/g1bxQrjSsIa4rCZBJSFkrj3/7mKcvNEXrTKf8lRsYeP/FJzw1rQjF5UnuMJV8CkDA9yXOO98cBkY5EjdQ5O4HGqT33pECoHLcxPFVNGkrDFQ3Y2/1BznRX2CXVvqGVwmV/mdsQLnMc2Sel+e7GdLZwo7kAKajNn18rZ6OtoxZGfpddCujkE8+0SgWjwbBLalSTdSPYk9oC/GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Tue, 22 Apr
 2025 15:13:40 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8655.024; Tue, 22 Apr 2025
 15:13:39 +0000
Message-ID: <08b9f1b6-6294-40ba-92de-2b349b876490@intel.com>
Date: Tue, 22 Apr 2025 08:13:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cpumask: add missing API and simplify
 cpumask_any_housekeeping()
To: Yury Norov <yury.norov@gmail.com>, Tony Luck <tony.luck@intel.com>,
	"Thomas Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <aAeerphfzpvBKjpA@yury>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <aAeerphfzpvBKjpA@yury>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0006.namprd16.prod.outlook.com (2603:10b6:907::19)
 To SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a390bd0-cf80-410c-00b0-08dd81b0430b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFpjbk5TMVBYdnV6Vml2dmtDeWtmUFkzOHlWWmV6SWRlOHlCb1REek1TWDRp?=
 =?utf-8?B?T2dyeGtPS2tUWUV0Wk5BbG1RMlpydmdybmtDK1VkWFh1YUlXeDBLN25UTThn?=
 =?utf-8?B?L29Pb2Y5NkI2VXV4SDc5eTYrenFYei9Jay80Vlg5OThWY2l4ZGVFelRKTXRa?=
 =?utf-8?B?SmVBcHBmOWZVeGg1d2k3QmVBSWczVmFsTE96VExMem1xelpmdndudk9GazVG?=
 =?utf-8?B?Q3JnUDV1WHg3Mk1FQ3ZuY0dGWDhLYXNYMVFsZjc2K0k1T1BRQUltVTB3SDEw?=
 =?utf-8?B?N2E3dlJxVVpBUkZlTHlIQ09zSEZESmppc0xXM0ZSZnc5VFF5cld4Y2J6VlhM?=
 =?utf-8?B?dGwrZFQ5Rk1FVW9jL1czUkdUenNxUTY4SGQ1Rkt5ZDEvMmJEQ2lnbk9YM2lu?=
 =?utf-8?B?ZXRhR25NY3JJaHg3L1hITHFXc0FEaHh3OXhoVTJZU1Z3cXFGTU1MYTd6eUR0?=
 =?utf-8?B?VVlHMm5lOWZqaWg5eWpIeGQrdEk3eGkwcnB4S2NCMXlrdzVVUGpSSGx1R0Vt?=
 =?utf-8?B?ZUlOMW1rOGd4bHMzTjJnWW0wU3p5Zkd0dThCeGppMUtlMnZ5NWRXZWtKZ2Rx?=
 =?utf-8?B?OFRCUytjdmRsOFhTdnlHb1hISmRyd24yVFNpbkg5UG5OZitNc2RaUWtMOUxK?=
 =?utf-8?B?MHZwYlRkWlEzREpmc2FJWTlGVTRLaW92Z3lQVEx0U0tZRlBLdGtid2N0YWNx?=
 =?utf-8?B?UzdQd2xEZjJNaGJkd2J5dUZhQTZyckNRRVZUM3RaUzFYOTNjaG5wR1pyWk9W?=
 =?utf-8?B?Mkt2bVl0R1hiWU1NenhubXpFbmVCbHdVYklsVk1hb2h4MjhZcmJaa2FGaElV?=
 =?utf-8?B?eGRSR3QrNUE2eUE2VXgzb1hWME1YMTdOa0VQVmlncW1aUktaQjc0K1FFVmd5?=
 =?utf-8?B?bzZ2NisrZUo3RW1CZTNRSmpxM1NWdzVPV3VXa3ZrOUphYWJ2SWxLMk5sTkJE?=
 =?utf-8?B?djRPVUhzMUFUYU1QWDlTeXVUayttNThteS94MkZrQUxjK0NUVjdnQ0dSNGhF?=
 =?utf-8?B?UmljdjhObVN2bEFNN3c1OW55ZVc3MkkvZ2IyK01IdUdGcEJKNkl2RDlnWGRr?=
 =?utf-8?B?TjAwYlpheFpXSE1NUmVLVzZ3VEJMWS9tRitzbk5vZmZGUXR6N2ZpNSsxVzVw?=
 =?utf-8?B?and0cDY1UTF2cnBEa3llRWM1eW5ZQ2ZvZWxBajFsZDNMemVzeUQvQjNtOUUv?=
 =?utf-8?B?WHZJbTQxSWNxcVdib0luVDIva0dQTUhTc1FCUXJpN0xrdzFCbW1Qank4Y3VO?=
 =?utf-8?B?VERraXM5YnF5UHNMSkNYaWgrTTVHdmowMkl4TE5MRGs2dFpUVWRYTnplVWJM?=
 =?utf-8?B?MEQzTjNTYnE1eTBxN3Fvbm01blQ5WTVrRFhoZ0U5V3E2cHJySlh1TXQzV0Yr?=
 =?utf-8?B?QzBLVkIxSUxkYi9lTDNLR1lJR2ljRUVMRlRUSHRiLy9uSWsydUFldDZKdUU5?=
 =?utf-8?B?bFFXNUFRWlgza1BFVkc1YmdwWTVxU0FDN0NZVTFvRVdlbUdCNmpQTTAycHZi?=
 =?utf-8?B?NjlBZVBwVmNNSWxTTFE1UEwwUHZJWE9VdTZjc09zUmZwSlY5dUVkUThWZkFm?=
 =?utf-8?B?YjJlRE0zTmlPN0tERHIzeEdNQlhrR0F3MEM3YkJOYTlQOWl3bVlSWUE1bWN6?=
 =?utf-8?B?bVYrMWpQQ0NGS25OendzZE5XaklOZjJPd21FelZ6a0w3YnhLU1padFpHRG0x?=
 =?utf-8?B?RkwvL3VqVUdmK29ld2xIUHFvTU1aL0hNSGpvYWFrVmUvZ3VZQ3UzbUhJVndm?=
 =?utf-8?B?c1FzY3UyT0k4WFVHZmlqYzJhQzR2dGFpWEdOSVdweG5KNVUvTzlhOGVROGFr?=
 =?utf-8?B?QmdtbGtQQWZSZDR0elVwMGgxaGVBT0xIYno4UVNHbGlnYk8xSWJ2ejJPbXpp?=
 =?utf-8?B?NmdTZGx6RzZhLzN5RlB5Z2FlMTZMbWNxT3B6bGRKRWV0aE12V3A1MTNIZnhD?=
 =?utf-8?B?U3hxY0laOUM3SWl6ZWJZLzY3ZjBQVWNiVklVYXUyLzFsNnVVeXhDOTJ4dmRM?=
 =?utf-8?B?enp5emlpQzd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NCsrODlDZjJiVCtsWDFnT3c1RG04bmluL1hNd0xUaHNzNmhVTjBRRnV0aWo3?=
 =?utf-8?B?bjl3MHNGbm9ZQW1FOFZJYTU4Mm16SVY4UVRWNklvK0NKa1VRZzY4dndNbmQv?=
 =?utf-8?B?ZDE2NmRiSlQ0am1YaXROVlczTlBrbzhtQ21NT1c4WWFncWxvKzViRTRNQXh6?=
 =?utf-8?B?NmlmM0wwOE1sdWRweUYxTXhCeUVVVzdoSVc4QVdDeHIwMHVnWS9mWThJWTV0?=
 =?utf-8?B?YUx5Q1pPcC8wRzNHbXAwakprUzlmZHZxclpudG96aWZ3MjN3ckwwMi92NFM4?=
 =?utf-8?B?TUtQcEJ0NVdrNmdKSkJKSEJKcDBZWEE4ZzZlNlMxdWRZa05zc2k0aUE1QkR5?=
 =?utf-8?B?b2lCVDhuZ1dsZXQvNjBsUnhQTGJYSEpLVG9uU1hwSzNLUUVONFI3UXhIRk41?=
 =?utf-8?B?UDQxQzhJUWZHSnhIM3dYZ1QxeFluc0NEWk5icCt4ZjM3VFNBelJYSVk5WkNo?=
 =?utf-8?B?VzFhVVdXVG1sV3hkLytteXJ5SFN2bk8yM21paC9lT1ZhRzBLOVhvbWRtQVVz?=
 =?utf-8?B?WThNY2RyTE5tdmFkRG9EY0hWTS94QzM1cjN4dU9VWEFVTHZLaytIbUxXV2pl?=
 =?utf-8?B?L2h1TG5oeDRtS1ZiSzRBQTVwSjBvMExCUnMwZ0ZyNjNlOFRoTXNpRnlRSUtN?=
 =?utf-8?B?bEp0NlpFYS9lVUw1QS9IMUFtMFBXOE9Hc0VZRy81R3ZhanZOaGFRc0pJbk5Y?=
 =?utf-8?B?Z2w4Z0o3NWVIaXZINzdOalllNzBKbndQRDJ5UDZ2d09IMEw2SEh3VkVXQ2Zp?=
 =?utf-8?B?NWQ5MDYvNTYxY2NBSHBEeU95bHpmbjdWS1hScEdlN3R0UzMwOVV2cFltd1JJ?=
 =?utf-8?B?emZCYmZWWmYvYUZ2QzdHclN6dUlhbnh4M2xkRGwwU3VDZTBOU1lobS9nTVd6?=
 =?utf-8?B?bUc0NXpGQmlKdE14T1R6SjFRZW8yR3d4OHdQNmtZNkEySkhOV25vc0NIT0V0?=
 =?utf-8?B?RDJZaUN3OW41OTduRlhvekpQSEVteW5WUkJud0pubzlybDZYUHVFUGl1cHBJ?=
 =?utf-8?B?MW5CNVpFZkxYWitBZW1ONzJSVDBQOUJYSGx0YXNJSUllczhreWJhZGhMNlNX?=
 =?utf-8?B?Sm51SkpMNjBMcS9kaGpuQ1hnVVowaXh0c3ZTMUVLUzczZFczMWRDc1M2NXl4?=
 =?utf-8?B?aWJuWTJKYmdsMVZFOEd5a1ovdTJnNkdBT3lKdVNwc25xbEtOdlZPdVRUcXpw?=
 =?utf-8?B?bk5LK1NmOG5UMS9aRzNqZ293TjZMbnQrb09MRFVLQ1h2VnQ1OHZ5ZUNpSUNC?=
 =?utf-8?B?YWhRU2lsSDlMazlsUXVVdmJwQmxLb0RKbXl0UHZIUHBvSGlDMGk4NHdpaldh?=
 =?utf-8?B?WW9uWllNU3czODdOQW4yYXh2QWlHZHJldWJldzg2YTR1QzVvTGlBV3MraGtG?=
 =?utf-8?B?QmVzZHVrbit0WSt3bXNGNWpZS0draUgyKzBScktqZDlkanVHSUQ2VUY2TWNH?=
 =?utf-8?B?cE5ISURCZ1BRUFdiSm1CTzczbEN5T1FhVWxwWjR2Nm1iemQvMVhKUXdkbExP?=
 =?utf-8?B?RUwxWmlVcVplVkNOYThrdE1pemdTdEkzcVVSeXhkb3dXZWtnWnFjbnh1U2RJ?=
 =?utf-8?B?Tm5IcUFxS29qK1RPWjdvVWdvODZNa2EzeVJrTzZpSldWaW9qaUpxRjhDTGFp?=
 =?utf-8?B?d3FaVFM5N2RVZWJuUTRhSmRwOXFWK1lRNDFZcERDeUJtQW5iUmlUTy9UM3lq?=
 =?utf-8?B?ZUFWSCtGdGN5UHpxRzhBT2VUYjNwZmdqVzQ4c2ZMRVJqbnpEN3RmZVU4SCtO?=
 =?utf-8?B?Z1BqVWxwYlozQ3ZoOXEzTzEvYmdRYUZtd29oZ0pnRUsrSU03T0swMFQ3WEla?=
 =?utf-8?B?bmFIUzJtL0JXVFlRbXJOYjlQeGE2bnRyd2J4SFhqOStlQWdFdXZUaGNKNi9O?=
 =?utf-8?B?cDhGRDRKb21EQTVmNlBaQzY3eU5yOU5Da0xYTFNvRi9kWnZJbUJQcUU2YXdH?=
 =?utf-8?B?T1IyaG1qUHVEWWZZRy9yenVlaG9qSlNaOVY4ZEM0QnAxdnBEeGZCdnRHRCtO?=
 =?utf-8?B?RVVlVGt3a1BvNlVrY1c2ZHV2dEpycGtWNmJTcTlwQkM2TWt0M1NMMkgzaFVS?=
 =?utf-8?B?RHhpWGk2aEViMjlZUlNYZUFPRk1nV3VZYWUzVnArQ3NlY3RGaXBnNnROa2ZX?=
 =?utf-8?B?KzFJU0JCK2I3SnJzS2xteURlYkN4ZFAzdWV0Qy9nMVdvTkdVaVhJYnJaWFVL?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a390bd0-cf80-410c-00b0-08dd81b0430b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:13:39.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNi7nYSzDN1UKNnlq9EHNYaw2WJGq3gsLKiu3SIpxejsdn6IaUzRuArtj+/uy5ZZV0kNtAlDLE7EbGfqZzpeu6orOpPZ31WGwet7WP45QOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
X-OriginatorOrg: intel.com

Hi Yury,

On 4/22/25 6:50 AM, Yury Norov wrote:
> Ping?

From the resctrl side this looks promising and I have been meaning to review
it with more detail. It looks promising because, apart from simplifying the
resctrl parts, it also looks like it may help to address some new resctrl [1]
requirements.

Thank you.

Reinette

[1] https://lore.kernel.org/lkml/da51ba61-4ff0-4db4-a55f-743f6a3ea7da@intel.com/

