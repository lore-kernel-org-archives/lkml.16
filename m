Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5E04685
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437087; cv=fail; b=GHdDMCBeIhPISQXq1SD4IPbf11rpbguEyNst2m7gZ998cTiRs1LQfpDG9NmrIHzng7+QgVdAZSYNz7zOdJCLYBiNFNBBzZW5j7bjTHbRXvClIw/KSiKsI6rqDTFIT/Qwle2TLfDvIIqq0Ff15paLy43L4nf+eZbF1LgUu+rVb4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437087; c=relaxed/simple;
	bh=m+jWVW04O/GbwG6TcU0deBQ3FG2Jf5zGBbj+N36tVPc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y1+/U6zJ3rwyg3E1oz+UJwG2Um2qktjBNdVePVCyN1oCNfp4JdiyrNxNKG9Kvxr8DeEjsdL4RrR4//2x8ASo1tE23z2W0VEq0a4wIbxkGrgcz0XpqOA9BHLIfSXzA0iNEmr3AifioUKzgq9uCPtasvkAGo7G29QuowhGtYGd9y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsReqUMs; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsReqUMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743437085; x=1774973085;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=m+jWVW04O/GbwG6TcU0deBQ3FG2Jf5zGBbj+N36tVPc=;
  b=lsReqUMsHKr4H29qcxCdoE7xizqzMDhhByusTJ/0XxNrS1VDFouCuQOx
   HG0TRLrmMr5kih7KuC30mrE902e9FdBp/dDnSJ33VKjDNuh8h/NGmh9EN
   JHqMvQEkNwvMpPvJr9n3ds7LLaMvsgF3Gxyqfi4tJwYKAj5mJSl7nRyG/
   0WVqiggCMNZvXBRtZce+6LjgPtrsNzfVLF2Rm8H4AhUzk/oeJY8lSG3oG
   4C8UiHy98GowGHfvpuivtd/Ks6rvBOK/tmp1oX8RL3sg/xWlUfeIHXe6B
   HBrodhvqCjN8+IfjB/FjCQwwzHANVLImcl5Ka+uZ5S9OFvXnV8Bxvd85U
   A==;
X-CSE-ConnectionGUID: EfpjSTRBQ7qElZmSnX8Frw==
X-CSE-MsgGUID: 0NLyHBAiTCi+In1OtZlv9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="54929151"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="54929151"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 09:04:45 -0700
X-CSE-ConnectionGUID: tRC3feMKSRaXX4HnKL+rHQ==
X-CSE-MsgGUID: a951i+PcT8+RVHrF5zowTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="126108824"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 09:04:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 09:04:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 09:04:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 09:04:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsImcQ9NvlLvotUJxPVLN/0XE2BKWdPBMmdIaZY667BHx3G8CZIEFdlweHhhZ3srnHhqBT0Zrqfoypd4h2OXXmme6MS+MmSs6wqPJzdipdWRhRaXFUFXxOSTD30dH2rwiaoMc/ff00zNpixoZl5ZNk08Df3MRumESYaKEabq2Z42S1LGgavm9rSDHQMm6L4jY5yQC3La6yeK13d5jzmHtC1jkxvEY5E+Tcu1bkBqHNzUAMkt2WoHYcQKaaefqBoqluczmMB9HW6I36WAb0LJGu2jP5wlrFT0b6SIwhZUq8wu3QRtXXs0qcaNGonh7FsDVPzxLqTI/5ag5EbOP+nQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n95HIKi87ujzFw+jkbhyhPR2jvzwfYaZDo6oV/4na/0=;
 b=R3kYpW+pvXr6ufuqU/GcKhOxn7NoPhKmhTZrEhqJswTKarlZsQ+JYOz6FwSI31PybM2jVAuprdcsXvHd9twbLidlsOYlB77kiNbQyOs8r+l46aCLEgELQi/O2FZxOpYjE+wpuQ5GJOW0B1CeAL/vJZKUK39byu1hNr73KVGvqpHtSuq7EGqGhhnyLDLG5TW+NLsBsswquSNtzQuZgfzofOpE2HtUO5KNMCqjGiUhwMDvH9CkuZjYEYCcr8nfHqvhFpebR2GzfxzJUEmgfJHzJhOjL0xHugk0nvFGgmPJZQOOlVGxzHbvMgTT1ISVTpFCCq3+OAUjtukE/9gg0ldDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Mon, 31 Mar
 2025 16:04:40 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 16:04:40 +0000
Message-ID: <4e9bc37b-34a2-4d5d-ab14-904ff2938292@intel.com>
Date: Mon, 31 Mar 2025 09:04:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] x86/nmi: Improve NMI header documentation
To: Ingo Molnar <mingo@kernel.org>
CC: <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Kai Huang
	<kai.huang@intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>, Petr Mladek <pmladek@suse.com>, Jani Nikula
	<jani.nikula@intel.com>, Tony Luck <tony.luck@intel.com>, Xin Li
	<xin@zytor.com>, <linux-kernel@vger.kernel.org>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-8-sohil.mehta@intel.com> <Z-py21rwghagQDEI@gmail.com>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <Z-py21rwghagQDEI@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0044.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::21) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 369d3144-d14e-4aa9-4139-08dd706dbe02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTl5ZFBLeU5NNHFhWmdyV3JRUUJxdDQ3VnpDeDRUZkJPbzJmV25LellwTjhl?=
 =?utf-8?B?MTYxUnNRak5obUJ0QlNQOUlway9vL1VLR3l0SERtdVkxY0xCbk5OZDFTVjhs?=
 =?utf-8?B?U2hhUjJ5QlpheWtDSDljczRiVUpjZnlVL0RoZEErUDlodXhyYXViSXBvVnB1?=
 =?utf-8?B?WW5PWWMxSzJKZ0VkWFFzYlJVTlB4N3V6SFRTVDFkWW5IZHNsUStzNTdMRmMv?=
 =?utf-8?B?c2FVVkVQYlExY081YmxkZnU4M1Y5OXNOeVVGMlVXZzN3OE5BVXV3TU9XcUs1?=
 =?utf-8?B?eTVyNzU3SWY4TUFNQ2NSNjExNTluZCs4MmN0NE9TODRSNmUrK1JLQ2FBSkhX?=
 =?utf-8?B?RWJHS3NCZDRrSlk4NlQ4cTFuVlAwWHBWNkEyakp0Y3lkRnhQUW9DOFc5Z3lQ?=
 =?utf-8?B?ZWpYbk5aWFhvd0NYZWVzMk9LYWF0ZU5UMkV4d2gyRTNObmd3MXN0aC9GRzFh?=
 =?utf-8?B?OG9ORng2cWg5RVFpQUxVeFF6MGNFNm5rU0RTSlpKcXRkUEFQMVAzbGw2cWpz?=
 =?utf-8?B?eCs0aFFzcEJxOTVNRU1Tcm50YlM5WGlib0QvY25WQ3pYSy9aSWp4eERFVVhs?=
 =?utf-8?B?VlBMVmpnYjBIajRoUG5sTGF1OHo3dEVIVzJCWDVFRUpTSlpkdjk5SmpoUWd0?=
 =?utf-8?B?QmZtTmxaVUxXdUhYWVZFUGtWTHlNdXE4S0dXVDNrUFNMWkxFN0VWOG1jZDFG?=
 =?utf-8?B?Mnl6ZU1XaHlQSGN4QVRDQU9hZWlwdytqdDIyQ294bXZ6bGRYS3F6YzlpZ0xS?=
 =?utf-8?B?ZTFtM3JZelR0eGVBNFNHby9UZTJPRk1BUDYzVzFIMGl1VUxGa1ZFKzJJamds?=
 =?utf-8?B?ZjlNNmhTMzl0c2syZ09LS3VoMmtnMnlnVmFxVG51Wlg1TGRUN1NZZWJLY2Nu?=
 =?utf-8?B?Y2hGMjFkeWpicFJIOTNPRU5SV3d2ZTM0ckpZRWp5a04vQ09NNlpQRHprTFpm?=
 =?utf-8?B?ZWQwVG5SWWtkeFhndm80Q1dpejhCRFk3b0RyalNRTGRueEJlTDA0Lys1UnNX?=
 =?utf-8?B?VTkvM0lMaERPK2lkSmF6VGc2Nmg5SDhhc1RXR1NlV1lYNjVOTEREaGVySGov?=
 =?utf-8?B?VGVlMHFzNEJrZk1MME5WKzQwN21WT2hnRXF1dVVEV0VKa3Bab1U5MVhZeXVO?=
 =?utf-8?B?ekloNmVRZDk3OUE5L2tBNXNGa1haaFRvWFB6dGVPVXFlWTJTL0VkV3lULzdw?=
 =?utf-8?B?SzZ1N0V6TVE0dkFrK1RZVXlrZENXblM1L1VkLzBZWkRYbXQyTkRKaVd6VVpz?=
 =?utf-8?B?YTFNSFBOVEtqZFlsazkwU1FrQ0Z0cW16L2NPS1hsZkRXOXR6ekZ5cDVoTGto?=
 =?utf-8?B?dlIwZ3diTk9ubDIvaGQvYzlKNGVkTHZrK094V0Y3UmozWklySmhBNXVsNWpF?=
 =?utf-8?B?ang1cU5zY1ZIZ1JCdHI5QURVanN0dUV6OEFZaDI4SThNSytxYkhPb2hnR3JM?=
 =?utf-8?B?d0dlWEdwRmVoZ2hYYi9TNlVEakxnQzYwTUtPRVhuYTFJencrUW9rbS8zNThH?=
 =?utf-8?B?dTcrQTM3ejlUa051MlYyemZQdTJSdVhIZ3BFMHlCcjJ6Tk5XYit6VmdDWlQx?=
 =?utf-8?B?OWp1alJNS0FqVFB6Ukhic2prY0hKdCs1S0FETmEySGVpMmN5L0RNMGEyVzda?=
 =?utf-8?B?MWVDUnVkWnozVkprUmRKblZibERvTFNFTXI5cUdXWDVkdzVlTFh1cndiR01D?=
 =?utf-8?B?ZjZ2ampieUVGNXVpazZibHhhSXpNYUkrZm9PS0ZwYlJKUEx3MVBzQXBTYk9Y?=
 =?utf-8?B?cnBoWTdlaWxlYjZZYU5aeCtWRlpwcWtHbC9DUjU3NUlNM0ZjSmtQZUZXVGpG?=
 =?utf-8?B?Umk1NG02OWNseWFlcjEybVNwTTZMMXR4L3FVNlY1ZnBnMXFFZ3Jidy9GaTJI?=
 =?utf-8?Q?L4oTIlXa8X6hk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkI4Y0E0c0NnaFcrQWtKeXZPVUN3VmZLSllnQm51KzJ5dHNLdWhzeTB5L0Z4?=
 =?utf-8?B?Skhlekg3TzI3R3g0WlJQY3liZUs2K2pHdHQrK0p4SjhOQU9TcmlSVjkxZ084?=
 =?utf-8?B?RGo0Q29MeUxYeGZUTEpndDIvMlFubGg3RThhL2hCSW1vdkhkeUFwZEgzQnpn?=
 =?utf-8?B?NzhVRkp0OHBINGtXVEg3R2xkL2dBeS9rd0x3K1M1V3hqaUFTOUQzZG1VTms1?=
 =?utf-8?B?TDdwd0o5WXlhUTU2SjZ3aWpIQjg0eFRRTjFMcGxjdVAwbUYvdnI5TTVmSjc5?=
 =?utf-8?B?dG8zZ2M0NkRxSjNGZFJQdDVDZ0t2R1NCVmQ1b1Z3SldrdDU2TTlLSittRnJq?=
 =?utf-8?B?UjNYOUR2ZERUL2FkYkxmeUJmT1h1QTZOQlN0WjZhVVNpV21TNEl4cWlieDNo?=
 =?utf-8?B?eXUxd0VaUFczMGJaRVlIZTdtTGE4OUZ6Rm5kVUpHZ0d4VTBnNzBpUmFSSFR6?=
 =?utf-8?B?SWFqN0ZGeHBxY3YyeHVvbmk1aFZSNGVjeEtxcVlmb3E2SVEwNlJyS3k4UVFC?=
 =?utf-8?B?NnQ3cjRNczVXMlRzYXhCVzJFYWsrQWlKaWVUdzZHbzFOc2tMNEk5OHBIdjRx?=
 =?utf-8?B?MC9aY0FxaElVaTFSOVlWQ0cwV2QwcCtmaVd1QnhlazhaU3lsdm95akFPN29G?=
 =?utf-8?B?eSs2YnF6TVFZWTVmY3FFSGtFdXh2QzJLSjBqemx3NjJSRjQyd2dhUEozVEpt?=
 =?utf-8?B?b3pjcitSN2htUVVINjFHL3RqQVNmVHN0Nnp5ZlAzME9aSGlJL3F6TGw3NjNy?=
 =?utf-8?B?L1c2eFBrSDRiQXVJYXRaaDhCbTdJWUV6SkZRcU5aVUNOUjgvQ0pvR0JxcWIx?=
 =?utf-8?B?Q1I1cEkyZ0duaWhhcG9pR0U2OVJkMFBrSUh6NDVwUkU0ZWo5dVFXZHJnNmc5?=
 =?utf-8?B?MkpldCt0bmtXdFVaRmNKTFFkWkFVVUhDUEZjaWNkaXdLTmNuSGhQU1FXenpB?=
 =?utf-8?B?V0xOK1hESmRMUHVscjd1T3JKZ09OV2ttSVNQWkZQSldxQnVkaXFDRnpiK3cr?=
 =?utf-8?B?NHU2MXFNTlB0TzNNSHpJekZ5S1FkYjdWcmVNWWk1RStoM2JsZitxTml1dUZ4?=
 =?utf-8?B?M0o2dUU0WEVLdjBJUXpDOU9tcW9CNHFHQzZhS0ZPOEU4TVdveGt1aStkTkp4?=
 =?utf-8?B?UXd0NXI2NDdON080VDRKWko0VVdveWt1bHVmcXo2ZVpEdmdtbnZ0M2FqNExu?=
 =?utf-8?B?VmduU2pwVTRhWHJSa1M4NCt6ZWtZVXFSam9BRTV0ekhBUUFrSlFoMjRmeTg4?=
 =?utf-8?B?aStjaXI4Z21xT0p2YkdLdTllbmRVaUxjMFhVY1ZMckVMZ0VnY2FBWDBCWnNU?=
 =?utf-8?B?NUdjaisxekRzbmdaSldnTEM2K1pJSDFPQ3VNbVlYYy9QSVd0djd4bUVOUEdG?=
 =?utf-8?B?dXcrVUwxa29iaWZaemxFMkxHOGcrVU9WV09zUkpvVCtNR3N6U1BpZVRxZFNJ?=
 =?utf-8?B?ZGNqNWJGaUtmY2dScEEzaTBKTzc0b1ZTRHBLOXJHdk5KOVM1RWpLRFhDcDMz?=
 =?utf-8?B?T1BWWFZtMjMzR1VwR3VaZEhhSXpUVXlPbUVFOTZIT0tKNmhuR3ZHU1lLZ3F6?=
 =?utf-8?B?VFFTS0FkTVhTeEFFb1BkOS9OTDVBaklGcnhJQXQvQUNPSHVCZ2xTRUFuSVNR?=
 =?utf-8?B?cUsyS2NSaERIVWlCQVNHQjZDb0JvTjVVeXY1RTBxK1lRRUh3Vk5jWnpyK0VT?=
 =?utf-8?B?eEh1Um9SOVVzQ0pZaElSVjRYa2pSZUFybU9WOWt2VlluMlFpQlo2TDFVSnhw?=
 =?utf-8?B?bHlreXRUZzdwT3A0QTQweklkZEZtdGd6YmJhdWh5SHFNTUpQUWlwckZoRyt4?=
 =?utf-8?B?WklVTXFsc25wcjdHOHJuY2crelZKWmQrMWZXVDVJdlNFYUZGKzBDTGtadkcz?=
 =?utf-8?B?aWNIVnhXSEgxaktWV3lUbzhONjNoWnB2RmtPeU80YWNWY2p4OVk3aWhhaG5n?=
 =?utf-8?B?cysra1RlMHhzR0FiNEJuUEZ5WUtXSkNHM3BXUjI0aVp5QXZmUGFadmladys0?=
 =?utf-8?B?WGpTMWxEbitHc0JublRteHZvdk5IRmttQjZTeTdldFYxUFFGZ092OElMc2VS?=
 =?utf-8?B?YkFWVWxtTEVkSERRUFowWVh0bzZPVFFaZnZRLzVVdk1yRGIxKzB5UHA4dkow?=
 =?utf-8?Q?6XvKMe4J2NUPAM/Y3MgM+7soI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 369d3144-d14e-4aa9-4139-08dd706dbe02
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:04:40.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ni0DbdKsdA1++FCEDRVErwplyBKYHvDgA0mVsB3iVZo66HxU6sd5rWg0b1+nnMmN3gsjuQGlcJJr0fAEZsoFIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
X-OriginatorOrg: intel.com

On 3/31/2025 3:47 AM, Ingo Molnar wrote:
> 
> * Sohil Mehta <sohil.mehta@intel.com> wrote:
> 
>> diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
>> index 213cf5379a5a..36698cc9fb44 100644
>> --- a/arch/x86/include/asm/x86_init.h
>> +++ b/arch/x86/include/asm/x86_init.h
>> @@ -292,6 +292,7 @@ struct x86_hyper_runtime {
>>   * @set_wallclock:		set time back to HW clock
>>   * @is_untracked_pat_range	exclude from PAT logic
>>   * @nmi_init			enable NMI on cpus
>> + * @get_nmi_reason		get the reason an NMI was received
>>   * @save_sched_clock_state:	save state for sched_clock() on suspend
>>   * @restore_sched_clock_state:	restore state for sched_clock() on resume
>>   * @apic_post_init:		adjust apic if needed
> 
> Note that I've split off this second half into a separate commit:
> 
>   x86/nmi: Add missing description x86_hyper_runtime::get_nmi_reason to <asm/x86_init.h>
> 
> as it's basically an independent KernelDoc bugfix AFAICS.
> 

That's fine with me. I did consider it for a moment but choose otherwise
to avoid micro-patches. Here is my sign-off if you need one.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
