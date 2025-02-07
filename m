Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5471718C00B;
	Fri,  7 Feb 2025 16:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946291; cv=fail; b=h7vz8CdQeSzJSYS/mrKjdygbkkUybrj800LGgWSC2o+Rn9c0XxIh2ZRrIS8hUDp7EPtJFjaQ34/sjVsMsaKDolUS2UNctDmAqZ/dzrl00Of4D7GcGeioBJGEMecoHOX4e8w81m2ZlqA+E9/hQWs7Bec1TM3O2JYTI0CxCVRy59s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946291; c=relaxed/simple;
	bh=W0BkITRofUNp/ADF5oB0f0Tuo0P6ox1ATYHoP9mJJjg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b66Luth7Yw5DRzP9Kiemdt6PEz+3e1t3FCs9bv+VHczPhSE4+PReKpz/MVDiw76pk0DFq3cQPP9qb69sJi/RKaA2BKI57yCBQKwYU/6d71FEkS+i1mMb5iOv1ZcBRvRd+0VbTBKs4t++o+e5i2PEC0P6vXYgCTtWBEWkZrUmThg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZin1sun; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZin1sun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738946289; x=1770482289;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=W0BkITRofUNp/ADF5oB0f0Tuo0P6ox1ATYHoP9mJJjg=;
  b=kZin1sunvkKOZwgx1L2PaFAChmRg+hAVFf3SgTdrA0ylke4mUrMuHBfH
   xUeDryu6Auors3kbEgvMpSUk5KLUZYMV65U1oIT0u0yYeWGTckPOg+B9i
   vTQnHAN7ex77MzrkKvnxiJCEyh8uwTN9K3PMARdBp0kSbTVN6aSsTpYAR
   HMf4acAw67i83N5tH3mihE8Ppx5TtyvnY3MuEyM2bcKD0ID1LKTem0OLZ
   zkv2mJ4Vm6cc43zrRMPQH7+PAgS5Kir063hSjAwPrNKAU2aVQEiXAe+8G
   NEhKvLGh4WvcRurpzqUgnGclkUX0tRRO2PrDCXdkCQSqFxercx7OChjj+
   w==;
X-CSE-ConnectionGUID: taeIRG65R4uvz7F2UepY5Q==
X-CSE-MsgGUID: KJSoPQHQQa6hTpml5g+rZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39501553"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="39501553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 08:38:08 -0800
X-CSE-ConnectionGUID: hdS7J96aTRanES7dCzb+Mg==
X-CSE-MsgGUID: WpKli3YIQ5yu3OPxGp/QKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111415394"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Feb 2025 08:38:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 08:38:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 08:38:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 08:38:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHU8uRUUoyCgsmkkSuFI5YePyp3bvoiRXh04KMf5eAAzU+CxCV+Zpi+vxSk14lyrAuPK6lztg7Ojue80t32KyfNWYt1sAvPuxQUV/D43kbfb9z5yb+nJj61IFo36XQeC3Dmaenf4mIQPul8oNwZLR315uTxZE7sXw9r3u1rTMn0kgeZ4oUXyk37K0VsE6t77gIpKXVV9xhKVLp/Jq3oJ4Yibva+/rEjcguLAJJmIMfbOYn4TUcbzDNE1/aIkZ/J0Xtnn0e5sUrYpR3dEU/ZQ2sNRBM136pUiIB5Z4sTFDThni7Yj37xlYtVPBp0yVlZj0XIBtk9JAZJi77MpGrx6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiHk+oIWzMPrZcjMbGrJHqbzNVGDj9+nQKJ0JRUKRnU=;
 b=koChEIlwEyQqx7HJuklHzEgutcsxBvH8gbZ3EBMWXec/DGc2VuNk6AdeYUROAs/JCs2Kz5SpeRiDROqbh9FFR1cOiL+hfI4E/uFpmKc3NCuKMRHzA/FlQLbtMUphnG1ifPWe3gTSBAEBPAwArdYjNE2fvGjaRUb2+vi2xF4AA+8pt+y8q0QEtFWfydk3cD6S1v1+eI0Y4Hn7aSoFRQYT9GA9ir0NLdHIaKTWsgEZ8af/ypV/KVrUbYqVgSe/uRcwqLOlMYH/7sK4FAiAsavESSbfw6CyhjoMF+r8clRRNqWE1M+EjDolDqA4J5EeH7KMSNm/3afMnG+IgWrKHSATJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by PH7PR11MB6772.namprd11.prod.outlook.com (2603:10b6:510:1b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Fri, 7 Feb
 2025 16:38:03 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 16:38:03 +0000
Date: Fri, 7 Feb 2025 17:37:30 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
CC: <luto@kernel.org>, <xin@zytor.com>, <kirill.shutemov@linux.intel.com>,
	<palmer@dabbelt.com>, <tj@kernel.org>, <andreyknvl@gmail.com>,
	<brgerst@gmail.com>, <ardb@kernel.org>, <dave.hansen@linux.intel.com>,
	<jgross@suse.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<arnd@arndb.de>, <corbet@lwn.net>, <dvyukov@google.com>,
	<richard.weiyang@gmail.com>, <ytcoode@gmail.com>, <tglx@linutronix.de>,
	<hpa@zytor.com>, <seanjc@google.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <justinstitt@google.com>, <jason.andryuk@amd.com>,
	<glider@google.com>, <ubizjak@gmail.com>, <jannh@google.com>,
	<bhe@redhat.com>, <vincenzo.frascino@arm.com>, <rafael.j.wysocki@intel.com>,
	<ndesaulniers@google.com>, <mingo@redhat.com>, <catalin.marinas@arm.com>,
	<junichi.nomura@nec.com>, <nathan@kernel.org>, <ryabinin.a.a@gmail.com>,
	<dennis@kernel.org>, <bp@alien8.de>, <kevinloughlin@google.com>,
	<morbo@google.com>, <dan.j.williams@intel.com>,
	<julian.stecklina@cyberus-technology.de>, <peterz@infradead.org>,
	<cl@linux.com>, <kees@kernel.org>, <kasan-dev@googlegroups.com>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <llvm@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 08/15] x86: Physical address comparisons in fill_p*d/pte
Message-ID: <lm5dg55q4vhhlsbsrvtskpz2hhdxa25pieq4gmf62ogtr4b4tw@xsq7ua7i5lto>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <2c2a71ec844db597f30754dd79faf87c9de0b21f.1738686764.git.maciej.wieczor-retman@intel.com>
 <c344dfaa-7e79-498f-89d7-44631140d0f4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c344dfaa-7e79-498f-89d7-44631140d0f4@intel.com>
X-ClientProxiedBy: DU7PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::27) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|PH7PR11MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ed4e94-d65f-4531-18e9-08dd4795cadc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?dLbFd+I2TOg3XDkKgBwIfo1VPD5/ftj8QOf3CKB4m0Y0/z+M2M7/hTP9zV?=
 =?iso-8859-1?Q?cS5k3pu/Kp2/xjRSN9Z9XD5I5okRR8WFJsIc6RAG75spCO47dUhPHpX7C6?=
 =?iso-8859-1?Q?QXSJVf4KeWaBdJo633BTW4OvttFyWit4691ks8boXuMQS1L0dF125LD398?=
 =?iso-8859-1?Q?/WxwcLnEoNqNZeB1GL6EChCU4mAYXFO9xDHpT5tcas9hzSd9+RJ4FJocSR?=
 =?iso-8859-1?Q?q9Hb46i7sLb1U5UzXuALI4jiODv0a3JZ2MjfNfjPAuJHK32V+lXl73PUO6?=
 =?iso-8859-1?Q?+tklfevO1uSYs7EUj5lFUJQPnneMSvHZNvqCkH5rADbPom2+MKY+oib61B?=
 =?iso-8859-1?Q?iCd9zTPrNki1q+7ae4syPzu+ey3lT/2e6GRckZLTOFGGJ33/bcVKQWXjjU?=
 =?iso-8859-1?Q?HlztuTKhFjwk5Ds2jhB48mGPAJQTrBn0hFwk+3YakJriam9f1Hvck7Pslx?=
 =?iso-8859-1?Q?mc0mJjMdoqz6zcqfpwKgVZMn5LkvpsuhlHIe/CfAwNKU1OLATCt4jo47KZ?=
 =?iso-8859-1?Q?X+eaJKcqiRa9lbTGui4+XuX5+gsJ22SbSJGHQdpq9hfrsVjrDL5IyiA7nJ?=
 =?iso-8859-1?Q?m+EgPyJufzsGEX84yMNQ8hh49RA/waqpHnvIL9aOVL3wpHMhpK4kFzNwCX?=
 =?iso-8859-1?Q?RwkPYOz82I41ZM3a6SCAUIfOLX2FLB5vou5IgRStcSiDEp8Zks6IcQVD9+?=
 =?iso-8859-1?Q?5RLnQjQ7q/NEsE2P5NOH5JU00Jsi3wwjHCOrKmr1ZOKv2kcyVcKGfqxcO7?=
 =?iso-8859-1?Q?b7adwabs0bT8VF3h5Z0Z4XdJFlH5StVNTcFWOPAAFD8vPLS4u45DRh2/XF?=
 =?iso-8859-1?Q?YwmsQRko5KIFXLaK23tdIsqZIropM/aJKrBk989qJjVV5/6uw0yvmgHVjo?=
 =?iso-8859-1?Q?4MX3+1umfhQ0qbj1I/mOv4rfYFw2TDT1bfqfIxvWXU3OgpBgo46RqbhOht?=
 =?iso-8859-1?Q?vGyIJac9ic1Z6tgR20FjDloa/lTtK/Un/aaOjwu0mQ+Tl3cltaP+5bM5xR?=
 =?iso-8859-1?Q?tZJ65FVxkXwz3Ecu/n29bN0HoI+rLzytMvA+fkkmbx1fq0Ui0Sir3YqN26?=
 =?iso-8859-1?Q?MOLJ4DncvkLWz11vVgiL5iqud1Am9dSL1F7KegBdZ0ySi3XQGn7eokmizt?=
 =?iso-8859-1?Q?NlT/N3XXAOxZoZzqBjetzOyewV6QeSs7SWXMYjwxLbhT1IPFZqoz7rdTmS?=
 =?iso-8859-1?Q?/Qg7UmY4G8XJpSg9CH27ifxOIOQYsXPlgmHR09IAU/jqzq+VFbikH3NT7X?=
 =?iso-8859-1?Q?yjGF1rEqS9VJiB70jakVBL13ety9nhW/9B891lgRXNXl50zvPSb0HmOcP8?=
 =?iso-8859-1?Q?g8NiAn6Wgh6YPj5BFLHW0AIhi6zA9z3d7za2HDvCdgk1DQa6dHi03Uf2El?=
 =?iso-8859-1?Q?sCs8ezIpmb8iYEPIJKTq9kG0w8FgHhpVWLaA3PajFeVIc8pc4SSH+X1kGB?=
 =?iso-8859-1?Q?mmQRFrW7EVe9hk4x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+3VlTPcj57ADpWnLL9A1kkaF1xmndhzovBVI29VFgPt51ewscwStRQNdCZ?=
 =?iso-8859-1?Q?wpJKpUsxfmcccPIYxnU3aCDiCvWkxgjJNZa5Y79i6LYkeilnDZlMi/BJLI?=
 =?iso-8859-1?Q?hfGPPMdENMZUoEJEI8iK99+JX4g6eRqDc6kBChmCLQOhd/3i6Rqt8Elorw?=
 =?iso-8859-1?Q?u3Lb9upoclk8pwBXkzEEP9uzXS2Hu4fNsxRZd9+0Y47g+42JQqX044VZBh?=
 =?iso-8859-1?Q?1jasgAw1CBXn99j43C1Dux/iLBBx0SJqq8YM9KGZYG5vX6O/cQxL+69tob?=
 =?iso-8859-1?Q?9RnTKNMhmZiO7vu0fig1fXEm/FBitzwU5UGbwD1pjfbJ4Wl7uZXk+YYrfp?=
 =?iso-8859-1?Q?LKgTFZpjYw3dd0CtqmCfVK/oZ1n+bIsTRg5FydxMK97bYrUHZlDp8pk1wP?=
 =?iso-8859-1?Q?VOMKSyuyT1U8JF772rOmTVY3YIUZ4y9a7EK+dLNvrVxjPlvgSwSVYO8l3F?=
 =?iso-8859-1?Q?D9bxeMEqIwIuWJZIiIbkbBJt7tmDLf4Ya+r28HAuoblmckW5HutOQlRsBb?=
 =?iso-8859-1?Q?/491lEynEz+aBxCIYtjpyxnXJXTb9oRT7EsSJBfVmoV0uq1irYIF0Ul2BG?=
 =?iso-8859-1?Q?calOnJ4wvZytkXMaPHeQNONTrqUr7bvYI/tsUe8pmMRmZqPzOnrqoPgkR4?=
 =?iso-8859-1?Q?a+SygsBHTpscoxEWtu0EAogtpc7uQVgzzb3sQ6xMX688H4aAwcScaNUws1?=
 =?iso-8859-1?Q?BIb6at1+Nk3W3ieAaTLBL23hNkqxKDzuOy2T/AH9ySZtGlXxHC/UNvtie3?=
 =?iso-8859-1?Q?L3nk022Y+kPno8IZVdhxV1IETIIxxTbF1EDpXyad34hvqd18r4NfKbmxOQ?=
 =?iso-8859-1?Q?LxqXm3//Zuv5wK3Jg2CuzZLVxHrSS8exwOOMqcR4sEjWKIjXbcoVDCikR0?=
 =?iso-8859-1?Q?t4Q2ggP+AVwwsDKK9nvMQvrcf0mYpCF1kABS1M7m3Pf4i6F2KOnMxF0s2E?=
 =?iso-8859-1?Q?EDo+3IMOGIOzeyN0/UNEzpgbULFJR6w06ba6Ibs83GaIpjbAJ3CzXQvXAz?=
 =?iso-8859-1?Q?zEI4ke3P6yb6GeVqstvWnjiT/aGuYfzPosBOgXl99QH8frJIOmgzC9GWnu?=
 =?iso-8859-1?Q?8moZzycQbexwHBE2XYjRhAdiKs0YDsqlU2z0NoypxvrX76VcFx16DiOZqa?=
 =?iso-8859-1?Q?cn8+1QCOrLTPQuw8+ZflqUOqg9cj24NMx+RPJMLPq+PmEiOzCCGb/vXqtv?=
 =?iso-8859-1?Q?tkYW0T+aVUAPJhlGQIqVr+BO1OvcJU1zJx1U5R7G0TCj6fiGqda6nVwder?=
 =?iso-8859-1?Q?koDufU+5q8+e+7Vren5aDHGX7d8kIBJTLQnEvhaMAsEi+TQI96KOBcaePi?=
 =?iso-8859-1?Q?oOMnIcyBP4lQj4nJXSIteduv7N4ohxfF4J+iaVUQA/PgjRlfYGXEDcuRxR?=
 =?iso-8859-1?Q?HmUJDN7Qh6VwERaH5QD+PKyegjAmsZSTcHZLuNbIWJ1fGjP5LRiLUpzgpb?=
 =?iso-8859-1?Q?duDYujjxhHHdLkl3UUkOif+/MGSA+/SEffHm1hGLaWlamKUbM2rmKsfMHB?=
 =?iso-8859-1?Q?hKElDYbD5UrhsdxWpFp1pwH7cw1cELfL0k/J33C4qESnr6aQdueRxSnUAL?=
 =?iso-8859-1?Q?uNwi3WHXPqdihvjL2cHtCmFVecrIKjRZIkE0BajV0X3F/Ih2aB3aW2IW/s?=
 =?iso-8859-1?Q?b94jWEZ7Xc/Ea90P4VJ5jHwnJXGiNEq/n+9NKnz4UxDrhL3oTKXZWsa8Dc?=
 =?iso-8859-1?Q?LkUMtcvRvAOvK5ZmtPQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ed4e94-d65f-4531-18e9-08dd4795cadc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 16:38:03.7942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rU5g5X4J+UGsdrvJFAWjzwUshHQLZZuM1AU1X/zLra87YHnW7kSxqjdACtFBRHtT+e8vrXmtXoCT7WLhh1U3bUXdk3hyJe0U/OqyXjBzXG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6772
X-OriginatorOrg: intel.com

On 2025-02-05 at 16:57:15 -0800, Dave Hansen wrote:
>On 2/4/25 09:33, Maciej Wieczor-Retman wrote:
>> @@ -287,7 +287,7 @@ static pte_t *fill_pte(pmd_t *pmd, unsigned long vaddr)
>>  	if (pmd_none(*pmd)) {
>>  		pte_t *pte = (pte_t *) spp_getpage();
>>  		pmd_populate_kernel(&init_mm, pmd, pte);
>> -		if (pte != pte_offset_kernel(pmd, 0))
>> +		if (__pa(pte) != __pa(pte_offset_kernel(pmd, 0)))
>>  			printk(KERN_ERR "PAGETABLE BUG #03!\n");
>>  	}
>>  	return pte_offset_kernel(pmd, vaddr);
>
>Maciej, could you do a quick check on this and make sure that it doesn't
>hurt code generation on current kernels?
>
>pte_offset_kernel() has an internal __va() so this ends up logically
>being something like:
>
>-	if (     pte  !=      __va(pmd))
>+	if (__pa(pte) != __pa(__va(pmd)))
>
>The __pa() and __va() obviously logically cancel each other out in the
>new version. But if the compiler for whatever reason can't figure this
>out we might end up with worse code.

I browsed through assembly and indeed the __pa(__va()) is longer compared to
only __va() or kasan_reset_tag(__va()).

How about we just open code the *_offset()? What do you think about the patch
below? We can lose the calls to *_index() because they are all zero so we're
only left with insides of the internal __va(). It didn't report any issues in
QEMU at least. The p4d_offset() isn't very pretty here but I think I can make it
better if you like the idea.

----------------------------------------

x86: Physical address comparisons in fill_p*d/pte

Calculating page offset returns a pointer without a tag. When comparing
the calculated offset to a tagged page pointer an error is raised
because they are not equal.

Change pointer comparisons to physical address comparisons as to avoid
issues in KASAN that pointer arithmetic would create. Open code parts
of p*d_offset() to avoid the internal __va() which complicates output
assembly.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/mm/init_64.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index ff253648706f..89a86ac34d95 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -251,7 +251,10 @@ static p4d_t *fill_p4d(pgd_t *pgd, unsigned long vaddr)
 	if (pgd_none(*pgd)) {
 		p4d_t *p4d = (p4d_t *)spp_getpage();
 		pgd_populate(&init_mm, pgd, p4d);
-		if (p4d != p4d_offset(pgd, 0))
+
+		if (__pa(p4d) != (pgtable_l5_enabled() ?
+				  __pa(pgd) :
+				  (unsigned long)pgd_val(*pgd) & PTE_PFN_MASK))
 			printk(KERN_ERR "PAGETABLE BUG #00! %p <-> %p\n",
 			       p4d, p4d_offset(pgd, 0));
 	}
@@ -263,7 +266,7 @@ static pud_t *fill_pud(p4d_t *p4d, unsigned long vaddr)
 	if (p4d_none(*p4d)) {
 		pud_t *pud = (pud_t *)spp_getpage();
 		p4d_populate(&init_mm, p4d, pud);
-		if (pud != pud_offset(p4d, 0))
+		if (__pa(pud) != (p4d_val(*p4d) & p4d_pfn_mask(*p4d)))
 			printk(KERN_ERR "PAGETABLE BUG #01! %p <-> %p\n",
 			       pud, pud_offset(p4d, 0));
 	}
@@ -275,7 +278,7 @@ static pmd_t *fill_pmd(pud_t *pud, unsigned long vaddr)
 	if (pud_none(*pud)) {
 		pmd_t *pmd = (pmd_t *) spp_getpage();
 		pud_populate(&init_mm, pud, pmd);
-		if (pmd != pmd_offset(pud, 0))
+		if (__pa(pmd) != (pud_val(*pud) & pud_pfn_mask(*pud)))
 			printk(KERN_ERR "PAGETABLE BUG #02! %p <-> %p\n",
 			       pmd, pmd_offset(pud, 0));
 	}
@@ -287,7 +290,7 @@ static pte_t *fill_pte(pmd_t *pmd, unsigned long vaddr)
 	if (pmd_none(*pmd)) {
 		pte_t *pte = (pte_t *) spp_getpage();
 		pmd_populate_kernel(&init_mm, pmd, pte);
-		if (pte != pte_offset_kernel(pmd, 0))
+		if (__pa(pte) != (pmd_val(*pmd) & pmd_pfn_mask(*pmd)))
 			printk(KERN_ERR "PAGETABLE BUG #03!\n");
 	}
 	return pte_offset_kernel(pmd, vaddr);


>
>If it generates crummy code we might want to do this differently like
>avoiding pte_offset_kernel() and adding some other helper that's more
>direct and to the point.

-- 
Kind regards
Maciej Wieczór-Retman
