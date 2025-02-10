Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C1D23645A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202806; cv=fail; b=CvTczYfADioJ5jKeG3ogmDaPlA/3nsqCFaqaFHGSCCNDjUtlZX2brJxWhWJesf89hh4wiM+EGHH1vt1s1mLEfAHa6RhNRnfXOTHrgz6J18yH7urCFYSqJ1INA9dMrY5SieHTOTyQlFII91sEkvROVHgBsDjSeT6Hzk63gLTHiLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202806; c=relaxed/simple;
	bh=7GjCY92tD81HsKvp5xqh1ceeyIHpcNj0zSSYTSn9qHg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ci4yhxQx/AGWlorIDuUgdPkiKwKyGkX3RvHlyoF52lD08HHUSBFvVKASOa1nYZ3fkVcxytt7q/2lo8YbS/LL6j2ZOoCOs3tqAvzxCaqHzoiEwkNIdxLfFuMmtq6SCBPOFCmG2jeyOvG2TiC/mSOPoYiZaKtFT0eHFCr+qb3qAuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9SxgqkU; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9SxgqkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739202805; x=1770738805;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7GjCY92tD81HsKvp5xqh1ceeyIHpcNj0zSSYTSn9qHg=;
  b=M9SxgqkUsQyMYxD6aM/TvTteAjK8MLHpxLqSPRirG4gsdxyHd0DU6XAM
   fQPJL7KzpVmwJ4cymikDqY+s0NwY2OPB2MWpuksniJGrX/oMTC8lPfdUM
   54hVOdGe0zHwcD+P5S698etaOZF6uYvKPn40AvK6DgjchrK9BbHszEM4F
   k8hrmuVS/zEYWKm/+F/UCARoPiy6HpRH6+qG5k7FPGrLf+BW67teXg1rz
   6ZdgAUqFw/9e6i4T5WlraJviK/9uX9YxTKY/OsZCNr5GJoc9u9Y4lY7R5
   0NuIby4BFgz+n5JLRlMDyStu0YhriWI7nBqpOIiFCVRHZJWVv5DaWZ0yx
   w==;
X-CSE-ConnectionGUID: pNHsFjT+TqiUtWpRH8eGOQ==
X-CSE-MsgGUID: rftnVxzfTN+cK2QGNLy9pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39026442"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39026442"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 07:53:24 -0800
X-CSE-ConnectionGUID: Km589XdZRxGodlVWM/9ZTA==
X-CSE-MsgGUID: 46uHB0KURmSoa/YitPwKcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112175324"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Feb 2025 07:53:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 07:53:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 07:53:23 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 07:53:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFjBDOv16c7VHAF1Y2B5biuJd4hkWq5W89gErVZpN9PKai+o6YJJJX8h87qUtNNetMlVOwcn/1HtN28+/O25D5fPlbX6lcxHw2jIqIsgC90NysrJagSuYr4/6p65dRJwJypMo0jotnRuHdem+pfxz1fCm8jFFGkzT0FOG4eYkGWj9Ku9p3j1HIMRqC37emXux8UCNj1L4W3r4B4SFXcNA38IQnvpHa0J/aLU2BKBxBFfrwrtXiQ6wp22dbP+1cdM/O2n61a8/wcqFmFMmDzp56p4QuuhdEHo55NTXfrK6ggKiJ1+qxqa8ypAKmyaAta+01xknpm/ChGGqtoM9S4iiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIz9FcmO/SFsHvB3pBxp+3AATYuNEN+9YY0u6lUa0Cc=;
 b=d8Idt+WBi5AEGqv5sgkUm/h9FddfXrx8K31TkT/1wGTBu15uBFAMZ7fuXT9+pdCzJsy03WwkkUWhjWbsG+gA/riBToQ0eR9cAE4ONkNffaHcq0A4SjmieE7DSP7u3Xt2r5KQZyXOPzXwivxmpCLY0Nj68Y3w5rBQQPlwqgjKTyHGgsXkFT0Atu1HELe62crHupQuBnJy3JFd+qDcNyWizciKg35ADI/x1ni/MrVaIhoNul/DLLQi8Ol8ZUc6sbMfu5S8wHBy+P7nP3GOk2DyGZgzaQkOb8QMTPbGRLvsFENHJz4Bsmhc5a+nwuNdlZgZq8ogRnTvPBV7TWW0etlQLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 15:53:20 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 15:53:20 +0000
Date: Mon, 10 Feb 2025 16:52:51 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>, Andrey Ryabinin
	<ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, "Dmitry
 Vyukov" <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	<kasan-dev@googlegroups.com>, <llvm@lists.linux.dev>, Catalin Marinas
	<catalin.marinas@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon
	<will@kernel.org>, Evgenii Stepanov <eugenis@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow
 computation
Message-ID: <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com>
 <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
X-ClientProxiedBy: DB8PR03CA0009.eurprd03.prod.outlook.com
 (2603:10a6:10:be::22) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|BL1PR11MB5223:EE_
X-MS-Office365-Filtering-Correlation-Id: fcfe3632-e491-4881-c9f0-08dd49eb0ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2RCbUFCbm5qUVZlOEZGQVJmN2RVQmJLT1A2YUpSNUpBdmt5ejJhMmF1cFZZ?=
 =?utf-8?B?cTN4R0s3NkN1dGo3cnpCYmtNeFdDQzNnMTBldXA0RlY4K3hMYlRQc3RGT3Zt?=
 =?utf-8?B?cFFvYTllRXIxRHFXSnkrS2hWbFZ1TGJOMXdGRXZyT3ZLYmI0ZXh0a0M1MjRS?=
 =?utf-8?B?SW5zbVZ5Z0paRktUdjZuQWYxR3o2MXA0OTVOd3NRYkJrQUR1Tk8yNjdvd0R5?=
 =?utf-8?B?TkZIM3B3eXVpRks0V082TWtSUmRVeUhEbVhnUTVORkRrR3YyYjBiYzY3ZXUv?=
 =?utf-8?B?THJVMkVnQjJNdXMxaVYvOXVvMTh3OW5BOEIwTGhmY0RZWGdRNFM5d2piR0k2?=
 =?utf-8?B?MXo4ZGlCYUJoQUoyNTFmRDVFM3krT09kQTU2QTY2Zld0Uy9uNUVuRnBGWGFs?=
 =?utf-8?B?Um9MUHpnR1pZKzMzWkJIZFBLdmFVU1Y2STc1M2QyQnRGSUsrdmthZmxCWjZD?=
 =?utf-8?B?QTJoekJOK2lQaDNJcVJFSVZhL0RTQ0RXSllUSUVMRktSOWRySDNSQUdjNkdV?=
 =?utf-8?B?bUlZWEJ5bVF4TzdvMlg0RkRVRDh4UmxIUCtnUVM4Y1IwQmNyaHRZNWdwZXpl?=
 =?utf-8?B?ei9VMlEwNFBYZ3pmSHczME1tOCtBdnZVTkxSbHZzalFDSHROSTJ2V2JCUG5C?=
 =?utf-8?B?M3NtdzlnWXlLTVlVQ2JjNk05MEVHalVzaEFnV2pwWk9NbHN4Sm41V0xoczFI?=
 =?utf-8?B?MDVXREI2dlJuZGdqL3YzWVVydk5HNFYwOGs3dFZGN2pFOTZUbnlxOTdScXhj?=
 =?utf-8?B?amg5NlltSi9VOU9vY2F3aTZWSXg1TVZON1dlVFkrbUdTcTZQem53WS9WS3R3?=
 =?utf-8?B?TklFTkYzeXAyM3NwMXVpYXgzaUFuckU3TlV4SndlSTlvVy9iLzI0amsrMnJk?=
 =?utf-8?B?WUhpeEFQbDNpMlprb0pvbnZuQng0L1M4c1RRN0VFVjMyVU8vTTF0QlRmQUNG?=
 =?utf-8?B?ZkptTWU4SkhjYm9LSXhlcnNKdGpBS0FiU3V3VGMxSnJ1Z044djZORGxTTVFE?=
 =?utf-8?B?WS9RV2I3QjROWlhmSTNQNGtqMFBSTDlSNVZ2SzhZQ0sxQXh3T1RFOWZGNTRq?=
 =?utf-8?B?OEFrSlJvUVdPTHpHbW1HWVA0ckk3dTN3V3I5SGVrREk5cVNVMktwQmMzSG5M?=
 =?utf-8?B?dGl5U2IxeHNYTVkxeGpmSS8wSG9tTC8yZE4wWDZpWTZ2ZGFBRVB1QVYvTFlp?=
 =?utf-8?B?UHN1eWVwTnlzdU1jaXZuVmEyaW5ueFlzVllxdUF3alRCa0pOR2U0ejNwZU1W?=
 =?utf-8?B?b0hVQ1FpNVEyQUhIdDF0Tm4yYXdpTTRxcWYybHVvSytHUHMzRG5EaCs1TExY?=
 =?utf-8?B?VHU0VWNuSkNYaDMzSTZxSVBBSGt2bm11VEpyM1k5SFJrVTQ5WjhGWVlCYUFa?=
 =?utf-8?B?Zy9kYVFSdVpENHNYbEFwQVVMc0w2V0JXOFBZdjJySXhHMlZ0OGUvUm5Ic0ZG?=
 =?utf-8?B?YXUyY216a2RVenJwcWV3R01QdjVZN0FBaTl5L09haXBuZTlXNXQrU1dpNVg4?=
 =?utf-8?B?c3pVSjE3TkN3WHVWcDJ2akpjRE81QlZ3TFRCZ3FnYldsMDNpTDFvUlROZW5h?=
 =?utf-8?B?N04zMnFDWkIzNGNTaVk3aEhkNU1OZXJ2Q0F1QUVxOGtGeWtrMzF3U0NWenAy?=
 =?utf-8?B?LzZPMVlydW91NWpMVHRmUG9aYmNOZGg2UTlDL2p1Q2IrS1FCNXd5c0EwWXp0?=
 =?utf-8?B?RnJLcmFlMzAreXVQb3p1dzZRNVlpWHUybjNsRytCbmpyMDY1eE5mcktKdXRK?=
 =?utf-8?B?Y2VtQWpaNTB2TUpFbzBTaThqZklSUkNKK1dGUUFTT2txSHhTZVpka2Y2TTRq?=
 =?utf-8?B?YnYrRDBwNXc1a0RUMVZlVGJyY21sZnFaNzgvUWhWbHV6Wm1XSURtQUxiVElj?=
 =?utf-8?Q?AsUi2QsxJZfEw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0UyRHhzTjgrM2Zza280Vk5oakNsNmljbDNQNDRJQy94U0xUOVVGRHd1MXFu?=
 =?utf-8?B?dnYwQnpRK1JIOE1hNkFTVExXdFE1VzJjZUhPeUtsbWxac1dnS1g3MFJXaW1k?=
 =?utf-8?B?OTFYK20vLzlYbFVBOTVGby9VZkp2RXVVOG9nancrT3Fib1lOY2sySGJodndM?=
 =?utf-8?B?aFJCYUhUWjJHckhqdEdGdWE3M1lRNnRWSU1rK3R6ZHE0WlB6b0ZsN0NiK3lE?=
 =?utf-8?B?MzNSZDVCWU5lUW9SdkpUMllSTFdvZFh1S3JwZmVFWS81bXZtTGpNRVF0WHVk?=
 =?utf-8?B?ZlJQclJveU0yNjhGK0dPUUF0Z0lad3VNZEtRVWo1WGJENGg0SXNWYUVpRmpZ?=
 =?utf-8?B?bk5jbnVmS2V6S3dqZC9rdkVxYXREN3lTL2xKT3Blb0tOVnRGeDRWTWZ0YTR6?=
 =?utf-8?B?Zk01NEQzNlBmT3A4NGtZZTN4MWNoUGI3UXovTHdUYTB5UjFOaytuT3BuRmNw?=
 =?utf-8?B?NkcyKzVRamVyaHVBcGVtQUZXRmVud1FrZCthdmhVZVJkUGx3VytkNjdKeDlM?=
 =?utf-8?B?NzlqMUx4Z3VlLzFQWFZPMUloNXVKZlNsTUZLODZQUkhDYjBaUkxmc2xOYjdF?=
 =?utf-8?B?RE1zdGN5Vk9aZStnS3pSamV2TEdsU3ZrcUN0WVlraUtiSzBjMU9vemxhc0tC?=
 =?utf-8?B?V0VsUWJ3aVdOZUhsQ09jOGF5MmVJT3JCbmE5TzFiTzlJcnZlM1dnakpmVUdZ?=
 =?utf-8?B?MmxwM1NBZXVTUDhtWHo0dml3U0kyUnBXekJ1ZldrSHZpY2JZczlUWmVybmdY?=
 =?utf-8?B?aW5CNVhFTTRidWZxMjBnU0tjNXRCL1BNTmViNkpyMmFSQXdoZ28wcFhHMEFS?=
 =?utf-8?B?VlB6OGpGN2R6VE9LSDJ4bTlvdGtQc3hxL3pCMi82MkJ4SzlkRy9uSStuV1RU?=
 =?utf-8?B?ekp3bU9WSitHV05NNytEam9ZQWpEdHFFMmNPNEIrTmtCVjg0c2wwSnUzQldJ?=
 =?utf-8?B?MlFhRk1TVTBwem1Bb3RZZWdhM09NYTJScGVMSEtua2I1WlYrcjJZWmJ5UmtN?=
 =?utf-8?B?RUVvcUhyd0ZBRmpkclpQYXhnSFJFOVFnT3dmNlhnOUgzTFl1cVZRUTNBK1A2?=
 =?utf-8?B?L3Zncy9QbHp6RjY2eC9vNUx2THIzdjk3RkNtQ09jT2ZWdTlKUTVlWTNDdlh6?=
 =?utf-8?B?NTZSdDNOZjJkVXZRYUY3K0RpaFdHZ2VRRTZVeGlUWU9mekRLUVZwTjlibHFI?=
 =?utf-8?B?UFU1U0JNYlBMUUZsSkZPVVhaRjhWc25VNUFDeXNnTTFTR0hrUXJvL3pwU2pK?=
 =?utf-8?B?c1p5VEF6N21jWldTY2w2b3IzN3AyVCtPWFhSL0V4UzFWdWZQUkdkS2piTXoy?=
 =?utf-8?B?VXJ2eHBUTGFRWXdHMm9ESUVYcXdJdjNIVnFYUG11MGNnSWp0bzhGYjlwTnM3?=
 =?utf-8?B?NWwycWJXSVB2YlJoUzZWVkpIczFQMXE5WUcxTW1iMlFoRlRMWXpCSThJczJz?=
 =?utf-8?B?UVg0THNuUW1qQTl6aHVTTlpIeFptajJIdnpiK0IwNVZhRFQzcjEwSVhlekhx?=
 =?utf-8?B?Z3lDbkgxYzl6UHdhQ3F4N253a2FDQ29jK1ZMa1VJcVYwNGRKTlpGQXhKN1B4?=
 =?utf-8?B?eE1QUEdjQ1BmTHlDcFZJdW1laXNPdjRoNVhHWUNub3RSUTEwN21CZEVoTldr?=
 =?utf-8?B?RjlZVnhPZUZYVFhoY3RZQXJNd0ZBcVhQYlA0cXhJSThsL0JHL2ZGQ1llNGFI?=
 =?utf-8?B?NkdtU2FwS0RNNzRONU1VZ2ExNkV4WHpMS25acXpXNnBJbXJXdUdwczdZSUFR?=
 =?utf-8?B?TnZuaEFlUXg3Q2MzZnZHODhSODBOS0lYMVI5ZzUrbmxQWHdicHlFamthdzZt?=
 =?utf-8?B?L3AzVXlrZVJCYW5XRWRKSkFTdXRMYjdiM2dlMUw0OCtQS2FVS3VXZmxacVNi?=
 =?utf-8?B?N3lWQkpQVitSQzViK1pXL3hpL1ZjZWg3b2tzNzduSXc3cVFieE1yYTY1bTZH?=
 =?utf-8?B?NWVOaER0YzQ3RzRHcklRY2pZNWFZY3JUZUtxMkFtN0p4Y2w3RVZTM0R0RUVZ?=
 =?utf-8?B?QmtkeldjbmwxcStMZjNFTlB3YnZEYVloWEJsMHBwL3BUUTd2Sk9iMDlVem9q?=
 =?utf-8?B?UmFWWHVlSzZJQyt4K041WGVLUWUveUYrZTd1N1NIY1V3a1hnclVvYkJFSDRP?=
 =?utf-8?B?Z0pINHdoNXh3bzFzUzdybytJb09sVzM1SEZybkllQjE0N0YvTlJmQURNRmxL?=
 =?utf-8?Q?7OhDBqZZuXzI0+uCYRonflA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfe3632-e491-4881-c9f0-08dd49eb0ada
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 15:53:20.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWUga8BA5V0rj8EumqnSf1Jj56iY598xehR7S/SbqrSVcIQR0JOK0jAcJh8anzUfgga4pkHNSEdm25NxLBvrV0EVC2iJ+8QAUIjrv/VJvQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
X-OriginatorOrg: intel.com

On 2025-02-10 at 16:22:41 +0100, Maciej Wieczor-Retman wrote:
>On 2024-10-23 at 20:41:57 +0200, Andrey Konovalov wrote:
>>On Tue, Oct 22, 2024 at 3:59 AM Samuel Holland
>><samuel.holland@sifive.com> wrote:
>...
>>> +        * Software Tag-Based KASAN, the displacement is signed, so
>>> +        * KASAN_SHADOW_OFFSET is the center of the range.
>>>          */
>>> -       if (addr < KASAN_SHADOW_OFFSET)
>>> -               return;
>>> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
>>> +               if (addr < KASAN_SHADOW_OFFSET ||
>>> +                   addr >= KASAN_SHADOW_OFFSET + max_shadow_size)
>>> +                       return;
>>> +       } else {
>>> +               if (addr < KASAN_SHADOW_OFFSET - max_shadow_size / 2 ||
>>> +                   addr >= KASAN_SHADOW_OFFSET + max_shadow_size / 2)
>>> +                       return;
>>
>>Hm, I might be wrong, but I think this check does not work.
>>
>>Let's say we have non-canonical address 0x4242424242424242 and number
>>of VA bits is 48.
>>
>>Then:
>>
>>KASAN_SHADOW_OFFSET == 0xffff800000000000
>>kasan_mem_to_shadow(0x4242424242424242) == 0x0423a42424242424
>>max_shadow_size == 0x1000000000000000
>>KASAN_SHADOW_OFFSET - max_shadow_size / 2 == 0xf7ff800000000000
>>KASAN_SHADOW_OFFSET + max_shadow_size / 2 == 0x07ff800000000000 (overflows)
>>
>>0x0423a42424242424 is < than 0xf7ff800000000000, so the function will
>>wrongly return.
>
>As I understand this check aims to figure out if the address landed in shadow
>space and if it didn't we can return.
>
>Can't this above snippet be a simple:
>
>	if (!addr_in_shadow(addr))
>		return;
>
>?

Sorry, I think this wouldn't work. The tag also needs to be reset. Does this
perhaps work for this problem?

	if (!addr_in_shadow(kasan_reset_tag((void *)addr)))
		return;

>
>-- 
>Kind regards
>Maciej Wieczór-Retman

-- 
Kind regards
Maciej Wieczór-Retman
