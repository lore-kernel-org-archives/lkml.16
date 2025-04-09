Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8303EC5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 00:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744158481; cv=fail; b=qW7TE+ZFqgIxK3AHVufYXuCQT/RJ+1Ht3lJfqhE/AYYo0CDwlUxkUAc92hicQ9XT/He9hgbFW61/so6fCIF3euE4ayROYTrhe1JgaiR/j2q8UCTjCeEA4g5sAE9aYtVLf6EZNNeJNogfw5FtiGVjB1mIolZZN/C8U/B0wBrCaPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744158481; c=relaxed/simple;
	bh=HNR8TVE7FrjoKrPLe86uTvrvBaKgVl+F3woW2hTZp2Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JVID8I1S53SScawh/IB5/nFXO6dq3afvFdoIBcyBLb89HJRiWQjCTajKKoDQIR7V18Xbf7oGK6vlPnmTrG582+Ksk3FoRtUIZt2vJLYOC1SMVw1niocgAag7+ty2KjnGiMg1be1TIhf85B2wPdjyXJVmbfNapXG5+eUS+uSOPvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnqJid1H; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnqJid1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744158478; x=1775694478;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HNR8TVE7FrjoKrPLe86uTvrvBaKgVl+F3woW2hTZp2Q=;
  b=CnqJid1HOTPDoYfEYIlAGvmr6qz5D73V6yGColwKU0cR06f855/frz4q
   TV7FCMeXHAr9N9Y/rmL66hUsgM4ekVsC3MewARhWjWx8RRJE0VjIZM0Ye
   /0eOaCMJV84GxxvBbbY7jvSIDYVMs2zR/6X0a3KRB8RZsvcg9gd7mN2dD
   elW9smIHZGegq+dkJ3dQfejYwkkTmp0siXNaX1VBl1y5ypz+xTBwc7cFD
   CkOYBNtQjPTXySs58ZBicajjNsS5F43GnaDw9hPTyj+FZmggrs7ujsKDW
   3pq4HcR03/JljG41fHHN+X1S4VC9T/S9djsyFEOvsSLc69WdbNnUEnOcM
   g==;
X-CSE-ConnectionGUID: O0f+Q20XTEayiF3dqYLSYA==
X-CSE-MsgGUID: +2S0n6KVQR2bnDUgxhIDPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49274602"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="49274602"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 17:27:57 -0700
X-CSE-ConnectionGUID: WkoxJ8wJRame6CoxHzJs/A==
X-CSE-MsgGUID: P83UR8HySrGA5mLDSeo8TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="128280582"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 17:27:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 17:27:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 17:27:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 17:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xnw5vmTdsQgER0K4/Hbq1i00iGdKHbreXzjiWhv4VA7QhCtV+igsvo2OVAT7cpnoeZd/HoA+SH5b/WQ9fLl8/yuyZ4cQQNJ05t7zpWFXEOyt66mcXoXwraQKPxCfkeo8zgDI7z2K27Thb2OVSB2ClS9Sk+7TpniwY0WwwCwnpaiD3iPCW2m0NfPEUCh/wUK99gfePDCeyWg0EpJjkhgOyxAgYcdOlD+2g7OiPJvjtr+PNGK/pUBYeOAVB8JH9X0x0AUCLtmXdo4dPjinDTOO1/P1hZbw5Ft4nGNtQ4/Mr7eB7YbrIjHgANx7FKj6kcs00rFPSpK4Mw2NxmW5KSy4mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/6x0Vnps+2T5hd7lZ3PlIml2Q0BdGW0j11pBcz/UpI=;
 b=gIy+iiCrmBwdfd2aWapJL+YpggxxbW1HwRMgafR/Si8DzErtwrtoGNG590D//h4QusMNulKFs8KtdeygQW4JU7twVR7LNqynPZL42DoGugS154CPK54GCWxcJNGUP+RRReqYMB1VzlQsIlHibcXgvSWcVreSFRd4p7gFHyXBVyw7GSVCW4XpCAjQ3Z3QyNMEhoLSxicTItIq8CUU5DGpyfpx5f6N0jbZSISUgvt2+ct7COlF8Ggved0JhEI2qwltuhUMMWGJ9+yOwgED0ERk0V683FAcWNM0bGMbhwMW9BzqXQ+B7TeuOUOIUardws1b8KKlqmKBnNOaVFTcr4TocA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS0PR11MB7213.namprd11.prod.outlook.com (2603:10b6:8:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.20; Wed, 9 Apr
 2025 00:27:50 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 00:27:50 +0000
Date: Tue, 8 Apr 2025 17:27:47 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Cedric Xing <cedric.xing@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>, "Dionna
 Amalie Glaze" <dionnaglaze@google.com>, Guorui Yu
	<guorui.yu@linux.alibaba.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v3 1/5] tsm-mr: Add TVM Measurement Register support
Message-ID: <67f5bf037da7d_720529449@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
 <20250407-tdx-rtmr-v3-1-54f17bc65228@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407-tdx-rtmr-v3-1-54f17bc65228@intel.com>
X-ClientProxiedBy: MW4PR04CA0284.namprd04.prod.outlook.com
 (2603:10b6:303:89::19) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS0PR11MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2cf111-0eb2-4882-63c7-08dd76fd5c7a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bYPJkNTGwPJwW0rmhXtkijTpHdv493fTkD3329hMQnPftckDLlUcVpTTKMrO?=
 =?us-ascii?Q?zwpvQpqOd9g0WU8wAmZiiHanUAPLt3ejXAwlE8AQ/5purQYktJoTda0CBN09?=
 =?us-ascii?Q?tp+zZJAmzEC6ri82WLZH/v7W9cYvZJpYod6sLqwaojBkS86S7HvPd2TdyX1s?=
 =?us-ascii?Q?QYXQtIIS/2ZFquiSuAhCU+WghTqEhJiLfdmeKNQ50XZBtqUo2AALd7ZNEeBf?=
 =?us-ascii?Q?Ppaz4za7378nL31CbhUyJXYacBmOrNqmn4lbgruRS7AQM6/vznrg7nOrJo2a?=
 =?us-ascii?Q?t4dGHDpb1QFy5H5PM7Tg2SIlaOEIXdh36+oLXzv6XRpmi5ifWeB1jlzDWyuK?=
 =?us-ascii?Q?BFAfWI7uTzmltpaArJFXWswi91RFqRnv7PQrip4/oZSLlz+vneeatjR5IC4e?=
 =?us-ascii?Q?uD8fH69rE3yx+5ok/YAsa6aqS8ekPdWq3F50Vi7xHI0cTRsdH/4RTDwhpHl9?=
 =?us-ascii?Q?DtiYPBrREZnSaPY+CJZyj1VS9nAwzmNIUL+XY49tETVjnbm03vPCkMYNijpW?=
 =?us-ascii?Q?HlZ7kGHuVKbT8JVdzsQIFIZ1UeYsCMlnxFVnPjEgOiB7Bd5qd42OFQL5cb3w?=
 =?us-ascii?Q?Nx/YbA2D0QteHOwK+iltQK2hd8d0R4rZZXbwQ2ETW35UqTqpQxXL76DaxxgB?=
 =?us-ascii?Q?AT+rv9MyyxHT7uYm0jAAyAl96Yf4Dwkhlf7SUOr5n0w1IIMRhWeoUBn/6245?=
 =?us-ascii?Q?b8bPiu9GiCuN8Z+3UTbns4jzXhgV56pDksfwKNCeNEToJD0YzhackoRWzkZF?=
 =?us-ascii?Q?l19tu+xKUowze+Pu6Ole+gnXa9K8PdSUYBC29oulBt8vfrzmkQfO5KzsA/LQ?=
 =?us-ascii?Q?zF0yYpJvWJ8/MiXuGFkNeJZ0xH3h6AAFst1ERWR8xs9QhqLwIwQ2UEItl+xd?=
 =?us-ascii?Q?70oX9iM8aqQGHO/3rFWm2lLg1sG/ufK/P2KG4X62XcIc+PkgNK8XSN7I5reG?=
 =?us-ascii?Q?FU3f+9LfIDDTpqBsmnWgCKgz/Cjk+pVQsbu/qL25mSdSHqWPUO8FAR4/wvs/?=
 =?us-ascii?Q?jtJtIcXmK7AB2/pfUjSoKL4p23CZI72JL1fFDCqsju1YO7g3mftUjKuQtNXR?=
 =?us-ascii?Q?rmsibPKLSFHmpwhizUwAffw0xpPfet0Z7PB8gjLEiudqt9JyqWqI9lNpXtKZ?=
 =?us-ascii?Q?mSsktcP1GM66fl+S+TCihtpjCNKpDBNcQKqCzVpTEt3YY4zSrhdOtGhr7lw3?=
 =?us-ascii?Q?rVTWN1cr9VFz01oWwEoy2QmPAozlZcPrfNuSuJvu6GSGtGWxrjWiYT0IKQ9V?=
 =?us-ascii?Q?rwC9mzk1gLUK5TaihSsK/mdy9oNWS4WzEdpUw8OdW4ffH6Yb/09DyGxjNhjb?=
 =?us-ascii?Q?oO7axAAnej65zIFKOCE6oZoKw540mgimpTFU8FUd0qYWiXJeiWIuqAJQk28M?=
 =?us-ascii?Q?ppdR1tTQnZqRj5L0O1PRPny4wSm4w9IVJg0bQCS6R5RujX5EGg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gNZQ/sngmTkEIFKZZiGrPko51stVLcRUuNvCX6Ot8TG0DDlbHsMIERHpf//L?=
 =?us-ascii?Q?LojDi9fFfQlCsjIxKg8gbzp8eN/oIHg48SNAgun919YAiQjBb0HT11y16+z2?=
 =?us-ascii?Q?cgq6MDCeZ0A5h19+KeHaP/j4oSb2SBOsnD1sAJb0mbP9PWGgnp+m33CZLbfb?=
 =?us-ascii?Q?Dj2VqlYmv23/BWfSoGjmDux1RlbLfDmLtfwtt6psIZp3RvfES9MXAxLcO8bG?=
 =?us-ascii?Q?l57XRWjdaGxuoyy/aVcMfOq329sycgbdGPkIbZT0clCJZkL7d/DGojJa4OTG?=
 =?us-ascii?Q?LmRx/foh/1BNvVpc1BU3ySHcWlByguJHdx6ufF1lnjmF8vdDMMzQb/SOpWgN?=
 =?us-ascii?Q?nY8K2yG+PQlszbbUVgysCt0JY0yDGb7RIvn8qwQLEfzHZOuRl1A8MAJ7bhs0?=
 =?us-ascii?Q?CFn8aBS+Oypsi2zdiDuWDoNDvzfiImrdirY5kFG2XTmya6wzs7MSquBWCB9H?=
 =?us-ascii?Q?hYi2fxs2x9AMDNgqIzxpS4IVF8daXdrwIc1m79QxtkUJ4+Vq9WXlH4tJLeSp?=
 =?us-ascii?Q?0FZP7aDN/moT0yoLfM/R9B3I3Mf9POzwjbCyATfzDJZsVPBqnGNH5/CzyJS2?=
 =?us-ascii?Q?+Vcr6ktI4SLdtAPPQmw2srq4nFKkie4hj1KgRar1JC/kLthU5lsedusSK1bt?=
 =?us-ascii?Q?tpx1FrUG+7UY2zu6ChpQCSWhP3qHea7DC+IDFUDo7NCSxFh+GlGP+Ansbh2g?=
 =?us-ascii?Q?d1iGQkCxow+X6yKoieQy87adenj/GoaKHugF89j0hUByYvxxbwHxgtXWLuOR?=
 =?us-ascii?Q?R2oR5uo0G3zKlC3BsopVS7rNf5KtnutjMyI45/IhTCZZ33v3vmZxZoGYTg/i?=
 =?us-ascii?Q?OK1JK80jPiZ0M8rHq5/DMvVw84vaRb3UQkjVVLx41LksKdy0sCqEuUBDqccF?=
 =?us-ascii?Q?dCVpTR6HMIQ8F4NyLw3N6KUtcdmsFUOpLPbmURJELlWB9OyFfakIZmd3dfWw?=
 =?us-ascii?Q?G80OPSLBDbwqiX0NFTs8Q9WY45JRnmVihQ3ekkvUeKy/l3gyaBkbClbY1Vg6?=
 =?us-ascii?Q?bWP/Vsu98zqszffRwMKMEYffGMGghcE7+I+j8gOSXlWdX96F8/FjJSDe0J7K?=
 =?us-ascii?Q?sfjsNZahOwmRF84Nxz+Agy72zKcp6NsYGPK+I07EH+e36SGNkMy6t8vu5Af8?=
 =?us-ascii?Q?d3aKUEfB/IFWO2ihOx7yU3WVP7TCWvF2FWeqfn/pYch5CvnYG1oq8yO+a9Aa?=
 =?us-ascii?Q?vsgY3zRj39XOgBkUmXnpjiT7M/iaDFOkh4YkgACS3TeqV4KTXwoOvgU62HdL?=
 =?us-ascii?Q?E1GTjB8/3GbePj0hwOEDwpJlVMSQSSI0tkpMXRhN+i0mx2OeMJqJHFD75ArA?=
 =?us-ascii?Q?b3PlQ1sSFUqJLVQonxYhgwl1khg+7mxPBCPVzAquX4/whVAwJNtbcsw2XGlD?=
 =?us-ascii?Q?NwybU9tIsp1vzg7zLZkNQLqudwUkiYuNvW+PfnEbSwbiFAhEZDbLvIZ6LyoP?=
 =?us-ascii?Q?bGqPdcn27Gbj5DI5AicQ5e46MggkPQtS/RQQgD3jPHYJr3tDtCm6Lf3wwV4T?=
 =?us-ascii?Q?14gQEwuQap8V+mHbQh3Q1q2uri5nfrglgzbNM8Y0a524MZEYjQ+ZX8HEB8La?=
 =?us-ascii?Q?CcHB9OB9CwVqpcgW8BKLlZvcw3qFTNwzfibWO+3BCixkkF/YjBco4IRu3Lz+?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2cf111-0eb2-4882-63c7-08dd76fd5c7a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 00:27:50.8489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HK4rUDaGeV9yTREaD7pONJR+yQ/ThIcfR+RiQKuu3IhkjYqfbrEvswK9Zb5wnZq3AxI1b+ZoJs5iw0/IprU7Qw/HiwFK0NT/uUVFTmWYHpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7213
X-OriginatorOrg: intel.com

Cedric Xing wrote:
> Introduce new TSM Measurement helper library (tsm-mr) for TVM guest drivers
> to expose MRs (Measurement Registers) as sysfs attributes, with Crypto
> Agility support.
> 
> Add the following new APIs (see include/linux/tsm-mr.h for details):
> 
> - tsm_mr_create_attribute_group(): Take on input a `struct
>   tsm_measurements` instance, which includes one `struct
>   tsm_measurement_register` per MR with properties like `TSM_MR_F_READABLE`
>   and `TSM_MR_F_WRITABLE`, to determine the supported operations and create
>   the sysfs attributes accordingly. On success, return a `struct
>   attribute_group` instance that will typically be included by the guest
>   driver into `miscdevice.groups` before calling misc_register().
> 
> - tsm_mr_free_attribute_group(): Free the memory allocated to the attrubute
>   group returned by tsm_mr_create_attribute_group().
> 
> tsm_mr_create_attribute_group() creates one attribute for each MR, with
> names following this pattern:
> 
>         MRNAME[:HASH]
> 
> - MRNAME - Placeholder for the MR name, as specified by
>   `tsm_measurement_register.mr_name`.
> - :HASH - Optional suffix indicating the hash algorithm associated with
>   this MR, as specified by `tsm_measurement_register.mr_hash`.
> 
> Support Crypto Agility by allowing multiple definitions of the same MR
> (i.e., with the same `mr_name`) with distinct HASH algorithms.
> 
> NOTE: Crypto Agility, introduced in TPM 2.0, allows new hash algorithms to
> be introduced without breaking compatibility with applications using older
> algorithms. CC architectures may face the same challenge in the future,
> needing new hashes for security while retaining compatibility with older
> hashes, hence the need for Crypto Agility.
> 
> Signed-off-by: Cedric Xing <cedric.xing@intel.com>

Given that this defines a shared ABI scheme for "measurement registers"
lets add a Documentation/ entry for those shared mechanics that per-arch
implementations can reference from their Documentation/ABI/ entry.

"Documentation/driver-api/measurement-registers.rst" seems suitable, and
that can pull in the kernel-doc commentary from tsm-mr.[ch]. Here's a
template to get that started:

diff --git a/Documentation/driver-api/coco/index.rst b/Documentation/driver-api/coco/index.rst
new file mode 100644
index 000000000000..af9f08ca0cfd
--- /dev/null
+++ b/Documentation/driver-api/coco/index.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
+Confidential Computing
+======================
+
+.. toctree::
+   :maxdepth: 1
+
+   measurement-registers
+
+.. only::  subproject and html
diff --git a/Documentation/driver-api/coco/measurement-registers.rst b/Documentation/driver-api/coco/measurement-registers.rst
new file mode 100644
index 000000000000..cef85945a9a7
--- /dev/null
+++ b/Documentation/driver-api/coco/measurement-registers.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+=====================
+Measurement Registers
+=====================
+
+.. kernel-doc:: include/linux/tsm-mr.h
+   :internal:
+
+.. kernel-doc:: drivers/virt/coco/tsm-mr.c
+   :export:
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 16e2c4ec3c01..3e2a270bd828 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -81,6 +81,7 @@ Subsystem-specific APIs
    acpi/index
    backlight/lp855x-driver.rst
    clk
+   coco/index
    console
    crypto/index
    dmaengine/index

> ---
>  MAINTAINERS                |   4 +-
>  drivers/virt/coco/Kconfig  |   5 ++
>  drivers/virt/coco/Makefile |   1 +
>  drivers/virt/coco/tsm-mr.c | 209 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/tsm-mr.h     |  93 ++++++++++++++++++++

I note that the pending proposals for TEE I/O suggests splitting
drivers/virt/coco/ into drivers/virt/coco/{host,guest} [1] [2] [3].

[1]: http://lore.kernel.org/174107246021.1288555.7203769833791489618.stgit@dwillia2-xfh.jf.intel.com
[2]: http://lore.kernel.org/20250218111017.491719-8-aik@amd.com
[3]: http://lore.kernel.org/20250218111017.491719-17-aik@amd.com

So if I take this through devsec.git I will get that rename queued and
ask you to rebase on top of that.

>  5 files changed, 310 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b827049501..df3aada3ada6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24558,8 +24558,8 @@ M:	Dan Williams <dan.j.williams@intel.com>
>  L:	linux-coco@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/ABI/testing/configfs-tsm
> -F:	drivers/virt/coco/tsm.c
> -F:	include/linux/tsm.h
> +F:	drivers/virt/coco/tsm*.c
> +F:	include/linux/tsm*.h
>  
>  TRUSTED SERVICES TEE DRIVER
>  M:	Balint Dobszay <balint.dobszay@arm.com>
> diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
> index ff869d883d95..737106d5dcbc 100644
> --- a/drivers/virt/coco/Kconfig
> +++ b/drivers/virt/coco/Kconfig
> @@ -7,6 +7,11 @@ config TSM_REPORTS
>  	select CONFIGFS_FS
>  	tristate
>  
> +config TSM_MEASUREMENTS
> +	select CRYPTO_HASH_INFO
> +	select CRYPTO
> +	bool
> +
>  source "drivers/virt/coco/efi_secret/Kconfig"
>  
>  source "drivers/virt/coco/pkvm-guest/Kconfig"
> diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
> index c3d07cfc087e..eb6ec5c1d2e1 100644
> --- a/drivers/virt/coco/Makefile
> +++ b/drivers/virt/coco/Makefile
> @@ -3,6 +3,7 @@
>  # Confidential computing related collateral
>  #
>  obj-$(CONFIG_TSM_REPORTS)	+= tsm.o
> +obj-$(CONFIG_TSM_MEASUREMENTS)	+= tsm-mr.o
>  obj-$(CONFIG_EFI_SECRET)	+= efi_secret/
>  obj-$(CONFIG_ARM_PKVM_GUEST)	+= pkvm-guest/
>  obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
> diff --git a/drivers/virt/coco/tsm-mr.c b/drivers/virt/coco/tsm-mr.c
> new file mode 100644
> index 000000000000..695ac28530e3
> --- /dev/null
> +++ b/drivers/virt/coco/tsm-mr.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright(c) 2024-2025 Intel Corporation. All rights reserved. */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>
> +#include <linux/tsm-mr.h>
> +
> +struct tm_context {
> +	struct rw_semaphore rwsem;
> +	struct attribute_group agrp;
> +	const struct tsm_measurements *tm;
> +	bool in_sync;
> +	struct bin_attribute mrs[];
> +};
> +
> +static ssize_t tm_digest_read(struct file *filp, struct kobject *kobj,
> +			      const struct bin_attribute *attr, char *buffer,
> +			      loff_t off, size_t count)
> +{
> +	struct tm_context *ctx;
> +	const struct tsm_measurement_register *mr;
> +	int rc;
> +
> +	ctx = attr->private;
> +	rc = down_read_interruptible(&ctx->rwsem);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * @ctx->in_sync indicates if any MRs have been written since the last
> +	 * ctx->refresh() call. When @ctx->in_sync is false, ctx->refresh() is
> +	 * necessary to sync the cached values of all live MRs (i.e., with
> +	 * %TSM_MR_F_LIVE set) with the underlying hardware.
> +	 */

Code comments should add to the understanding of the code, not simply
restate the code in prose. So I would replace this comment with some
non-obvious insight to aid future maintenance, something like:

/*
 * Note that the typical read path for MRs is via an attestation report,
 * this is why the ->write() path does not automatically ->refresh()
 * invalidated data for TSM_MR_LIVE registers. The use case for reading
 * back a individual hash-extending-write to an MR is for debug not
 * attestation. 
 */

...at least an explanation like that would have helped me understand the
locking and caching model of this implementation.


> +	mr = &ctx->tm->mrs[attr - ctx->mrs];
> +	if ((mr->mr_flags & TSM_MR_F_LIVE) && !ctx->in_sync) {
> +		up_read(&ctx->rwsem);
> +
> +		rc = down_write_killable(&ctx->rwsem);
> +		if (rc)
> +			return rc;
> +
> +		if (!ctx->in_sync) {
> +			rc = ctx->tm->refresh(ctx->tm, mr);
> +			ctx->in_sync = !rc;
> +		}
> +
> +		downgrade_write(&ctx->rwsem);
> +	}
> +
> +	memcpy(buffer, mr->mr_value + off, count);
> +
> +	up_read(&ctx->rwsem);
> +	return rc ?: count;
> +}
> +
> +static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
> +			       const struct bin_attribute *attr, char *buffer,
> +			       loff_t off, size_t count)
> +{
> +	struct tm_context *ctx;
> +	const struct tsm_measurement_register *mr;
> +	ssize_t rc;
> +
> +	/* partial writes are not supported */
> +	if (off != 0 || count != attr->size)
> +		return -EINVAL;
> +
> +	ctx = attr->private;
> +	mr = &ctx->tm->mrs[attr - ctx->mrs];
> +
> +	rc = down_write_killable(&ctx->rwsem);
> +	if (rc)
> +		return rc;
> +
> +	rc = ctx->tm->write(ctx->tm, mr, buffer);

There needs to be explicit ABI and driver-api documentation here for what are the
allowed error codes that ->write() can return so as not to be confused
with EINVAL or EINTR arising from user error or interrupt.

> +
> +	/* reset @ctx->in_sync to refresh LIVE MRs on next read */
> +	if (!rc)
> +		ctx->in_sync = false;
> +
> +	up_write(&ctx->rwsem);
> +	return rc ?: count;
> +}
> +
> +/**
> + * tsm_mr_create_attribute_group() - creates an attribute group for measurement
> + * registers
> + * @tm: pointer to &struct tsm_measurements containing the MR definitions.
> + *
> + * This function creates attributes corresponding to the MR definitions
> + * provided by @tm->mrs.
> + *
> + * The created attributes will reference @tm and its members. The caller must
> + * not free @tm until after tsm_mr_free_attribute_group() is called.
> + *
> + * Context: Process context. May sleep due to memory allocation.
> + *
> + * Return:
> + * * On success, the pointer to a an attribute group is returned; otherwise
> + * * %-EINVAL - Invalid MR definitions.
> + * * %-ENOMEM - Out of memory.
> + */
> +const struct attribute_group *__must_check

No need to mark this function as __must_check. That attribute is
typically reserved for core-apis.

> +tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
> +{
> +	if (!tm->mrs)
> +		return ERR_PTR(-EINVAL);

If you're going to check for !tm->mrs, might as well also check for !tm.

> +
> +	/* aggregated length of all MR names */
> +	size_t nlen = 0;

Typically the only exceptions for not declaring variables at the top of
a function are for "for ()" loops and scope-based cleanup.

> +
> +	for (size_t i = 0; i < tm->nr_mrs; ++i) {
> +		if ((tm->mrs[i].mr_flags & TSM_MR_F_LIVE) && !tm->refresh)
> +			return ERR_PTR(-EINVAL);
> +
> +		if ((tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) && !tm->write)
> +			return ERR_PTR(-EINVAL);
> +
> +		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
> +			continue;
> +
> +		if (WARN_ON(tm->mrs[i].mr_hash >= HASH_ALGO__LAST))

Why potentially crash the kernel here? EINVAL should be sufficient.

> +			return ERR_PTR(-EINVAL);
> +
> +		/* MR sysfs attribute names have the form of MRNAME:HASH */
> +		nlen += strlen(tm->mrs[i].mr_name) + 1 +
> +			strlen(hash_algo_name[tm->mrs[i].mr_hash]) + 1;
> +	}
> +
> +	/*
> +	 * @bas and the MR name strings are combined into a single allocation
> +	 * so that we don't have to free MR names one-by-one in
> +	 * tsm_mr_free_attribute_group()
> +	 */
> +	struct bin_attribute **bas __free(kfree) =
> +		kzalloc(sizeof(*bas) * (tm->nr_mrs + 1) + nlen, GFP_KERNEL);
> +	struct tm_context *ctx __free(kfree) =
> +		kzalloc(struct_size(ctx, mrs, tm->nr_mrs), GFP_KERNEL);
> +	char *name, *end;
> +
> +	if (!ctx || !bas)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/* @bas is followed immediately by MR name strings */
> +	name = (char *)&bas[tm->nr_mrs + 1];

I looked for a helper macro for a "buffer at the end of a structure",
but could not immediately find one. It feels like something Linux should
already have.

> +	end = name + nlen;
> +
> +	for (size_t i = 0; i < tm->nr_mrs; ++i) {
> +		bas[i] = &ctx->mrs[i];
> +		sysfs_bin_attr_init(bas[i]);
> +
> +		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
> +			bas[i]->attr.name = tm->mrs[i].mr_name;
> +		else if (name < end) {
> +			bas[i]->attr.name = name;
> +			name += snprintf(name, end - name, "%s:%s",
> +					 tm->mrs[i].mr_name,
> +					 hash_algo_name[tm->mrs[i].mr_hash]);
> +			++name;
> +		} else
> +			return ERR_PTR(-EINVAL);
> +
> +		/* check for duplicated MR definitions */
> +		for (size_t j = 0; j < i; ++j)
> +			if (!strcmp(bas[i]->attr.name, bas[j]->attr.name))
> +				return ERR_PTR(-EINVAL);
> +
> +		if (tm->mrs[i].mr_flags & TSM_MR_F_READABLE) {
> +			bas[i]->attr.mode |= 0444;
> +			bas[i]->read_new = tm_digest_read;
> +		}
> +
> +		if (tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) {
> +			bas[i]->attr.mode |= 0220;

Typical expectation for writable attributes is 0200.

> +			bas[i]->write_new = tm_digest_write;
> +		}
> +
> +		bas[i]->size = tm->mrs[i].mr_size;
> +		bas[i]->private = ctx;
> +	}
> +
> +	if (name != end)
> +		return ERR_PTR(-EINVAL);
> +
> +	init_rwsem(&ctx->rwsem);
> +	ctx->agrp.name = tm->name;
> +	ctx->agrp.bin_attrs = no_free_ptr(bas);
> +	ctx->tm = tm;
> +	return &no_free_ptr(ctx)->agrp;
> +}
> +EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
> +
> +/**
> + * tsm_mr_free_attribute_group() - frees the attribute group returned by
> + * tsm_mr_create_attribute_group()
> + * @attr_grp: attribute group returned by tsm_mr_create_attribute_group()
> + *
> + * Context: Process context.
> + */
> +void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp)
> +{

Related to the removal of __must_check add safety here for cases where
someone passes in an ERR_PTR():

	if (IS_ERR_OR_NULL(attr_grp)
		return;

This also makes the function amenable to scope-based cleanup.

> +	kfree(attr_grp->bin_attrs);
> +	kfree(container_of(attr_grp, struct tm_context, agrp));
> +}
> +EXPORT_SYMBOL_GPL(tsm_mr_free_attribute_group);
> diff --git a/include/linux/tsm-mr.h b/include/linux/tsm-mr.h
> new file mode 100644
> index 000000000000..94a14d48a012
> --- /dev/null
> +++ b/include/linux/tsm-mr.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __TSM_MR_H
> +#define __TSM_MR_H
> +
> +#include <crypto/hash_info.h>
> +
> +/**
> + * struct tsm_measurement_register - describes an architectural measurement
> + * register (MR)
> + * @mr_name: name of the MR
> + * @mr_value: buffer containing the current value of the MR
> + * @mr_size: size of the MR - typically the digest size of @mr_hash
> + * @mr_flags: bitwise OR of one or more flags, detailed below
> + * @mr_hash: optional hash identifier defined in include/uapi/linux/hash_info.h.
> + *
> + * A CC guest driver encloses an array of this structure in struct
> + * tsm_measurements to detail the measurement facility supported by the
> + * underlying CC hardware.
> + *
> + * @mr_name and @mr_value must stay valid until this structure is no longer in
> + * use.
> + *
> + * @mr_flags is the bitwise-OR of zero or more of the flags below.
> + *
> + * * %TSM_MR_F_READABLE - the sysfs attribute corresponding to this MR is readable.
> + * * %TSM_MR_F_WRITABLE - the sysfs attribute corresponding to this MR is writable.
> + * * %TSM_MR_F_LIVE - this MR's value may differ from the last value written, so
> + *   must be read back from the underlying CC hardware/firmware.

Maybe use the word "extend" somewhere in this description for clarity.

> + * * %TSM_MR_F_RTMR - bitwise-OR of %TSM_MR_F_LIVE and %TSM_MR_F_WRITABLE.
> + * * %TSM_MR_F_NOHASH - this MR does NOT have an associated hash algorithm.
> + *   @mr_hash will be ignored when this flag is set.
> + */
> +struct tsm_measurement_register {
> +	const char *mr_name;
> +	void *mr_value;
> +	u32 mr_size;
> +	u32 mr_flags;
> +	enum hash_algo mr_hash;
> +};
> +
> +#define TSM_MR_F_NOHASH 1
> +#define TSM_MR_F_WRITABLE 2
> +#define TSM_MR_F_READABLE 4
> +#define TSM_MR_F_LIVE 8
> +#define TSM_MR_F_RTMR (TSM_MR_F_LIVE | TSM_MR_F_WRITABLE)
> +
> +#define TSM_MR_(mr, hash)                              \
> +	.mr_name = #mr, .mr_size = hash##_DIGEST_SIZE, \
> +	.mr_hash = HASH_ALGO_##hash, .mr_flags = TSM_MR_F_READABLE
> +
> +/**
> + * struct tsm_measurements - Defines the CC-specific measurement facility and
> + * methods for updating measurement registers (MRs).
> + * @name: Optional parent directory name.
> + * @mrs: Array of MR definitions.
> + * @nr_mrs: Number of elements in @mrs.
> + * @refresh: Callback function to load/sync all MRs from TVM hardware/firmware
> + *           into the kernel cache.
> + * @write: Callback function to write to the MR specified by the parameter @mr.
> + *
> + * @refresh takes two parameters:
> + *
> + * * @tm - points back to this structure.
> + * * @mr - points to the MR (an element of @mrs) being read (hence triggered
> + *   this callback).
> + *
> + * Note that @refresh is invoked only when an MR with %TSM_MR_F_LIVE set is
> + * being read and the cache is stale. However, @refresh must reload not only
> + * the MR being read (@mr) but also all MRs with %TSM_MR_F_LIVE set.
> + *
> + * @write takes an additional parameter besides @tm and @mr:
> + *
> + * * @data - contains the bytes to write and whose size is @mr->mr_size.
> + *
> + * Both @refresh and @write should return 0 on success and an appropriate error
> + * code on failure.
> + */
> +struct tsm_measurements {
> +	const char *name;
> +	const struct tsm_measurement_register *mrs __counted_by(nr_mrs);

I had assumed that __counted_by() is only for inline flexible arrays,
not out-of-line dynamically allocated arrays. Are you sure this does
what you expect?

> +	size_t nr_mrs;
> +	int (*refresh)(const struct tsm_measurements *tm,
> +		       const struct tsm_measurement_register *mr);
> +	int (*write)(const struct tsm_measurements *tm,
> +		     const struct tsm_measurement_register *mr, const u8 *data);
> +};
> +
> +const struct attribute_group *__must_check
> +tsm_mr_create_attribute_group(const struct tsm_measurements *tm);
> +void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp);
> +
> +#endif
> 
> -- 
> 2.43.0
> 


