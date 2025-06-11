Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51971D6AA;
	Wed, 11 Jun 2025 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749666608; cv=fail; b=sv0sG0YZMysL/eTwU1EeNuVJuvR9LI86a1A1T9wArhR/MgY1gX/FLRsJvJSZooqvNKx3HxN6Hd7WRJyQXGryFsWmnJ51MzQUzu1kWgaxYmQkTIa40yEQPSxiZMIAg2fyFbjZZiVG65K46NmoeaPxt47t/NIjv7PJaz7LHmFZ/OA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749666608; c=relaxed/simple;
	bh=ZioRikXV02cbJAmXnnPL1uGYA0WAge4P5k+IBGz1cW8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O6aV8twYJ25fVpsvoHZRiXozoVGKyEoecAWZQO4z8XZQV6Zj1MpB4TIbu4z1k2/uhYY4rqxy7GwN92o0Lc0lAjH0msCpSp//A9RS8oSaKhk+hg9x1ByHGMjs7D/nwPTfAnR4LL3fCDQQast1NiHQma5Y8MHwlLjzLouzW52V7/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJhH/WbY; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJhH/WbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749666607; x=1781202607;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZioRikXV02cbJAmXnnPL1uGYA0WAge4P5k+IBGz1cW8=;
  b=FJhH/WbYl6B6N4FCGtvyMlhmBO7XeiFu76y9XsyFH4xHkxwPhDnzQasp
   qMSGd3UqUpIv9O1AIl6veQjKbupcFgZppQcOMmF/hKDKCIx09zqg4wJVn
   fh1Hf6XspkwV2ygy5oqpwGWDmn0f0WjCmxbIDrqdyTkDO31jctqyee54p
   WBCbnXWzxr7QbNGqtGI/T/VSVx5BNk6kQOY4zQtPK0dhmYIGUUNjUCiGV
   /OILeipKbes3332SIRKL+ubAJOG07PL5OqZnF2fimu4Z99bdEo3fKl9/J
   i69urS43mfC/tYO4G9rqujqJFwxPghSRHETVqg0p10mHLGQiUYv2PZrRO
   g==;
X-CSE-ConnectionGUID: 33owkE/vQGG8/AM2ixHdZQ==
X-CSE-MsgGUID: 6+TIFb4xScKcTOpKIA3nAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51538260"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51538260"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 11:30:06 -0700
X-CSE-ConnectionGUID: nXiBNaYgSvGcKzleHn/lDA==
X-CSE-MsgGUID: GqYmrXPcTw+B5b8FVqdswA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147154237"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 11:30:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 11:30:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 11:30:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 11:30:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYMvoohAkkoV7HNXSxhXOFT02jMHngLqq7BhaKEDyczIkYYTQI7KCV4mPioy6P1pOo0oVGhkwJUEFXcdAtDZk61hZXx6151MGPzF70DtFSZReNopJS96GUz/3Czf9G5apWcFJck5mM4ZWh+7nehXOgxkTw9EQBYdMii+WNVL8E89va6V1ia2Xx45V2f2v4ChLaTYTo5xvLSbhKOrTR/eoVt3oujni7YODhpaumAe5DmiOHFfdVk6h4wlgQ1qsty0LwqHH6mRIFvIjSajXb0CaziduKlyaqO0wag+/LkB4O+yVYSqirnCrHMZcbORWKiTvZO2WwGjejtcmbdpaOY0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5GvIW/lXvZOcxpY+Q4uAa2Dtsd92E3rf1kuFgxKRRg=;
 b=TbC/Nny5BumfG5h06mzasv2742K9ruN4E9zp1q9Y7Rx5i3DEZvFhEZIOe5+k+sxdiBDzsTOOG9LQmm9JBQoxR9lXIJPSfeuT+DXPyj7g+zMTSK87+T1wG5cLa7pbdKhJQIwe7Um8QVi1UtmljfbkY+DP9oAN2nFaKD4ilo1Tsh2Y09eBA2xo6R5Qu2iY2JRrYULXkTuPKY1Ll3t/QT9bxlAWKyO6dH5FyPEi1Dvu5bcxmN/SaPzTDeZ6tYHSo4XShFFUP/KA+CJYDDM+0tGAeY2qioKzB0h8rzNOgoKnpRsX4wCdRHsqnQTrxERI4xdGYaG6y8P29iPsjyAc575QYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA4PR11MB9370.namprd11.prod.outlook.com (2603:10b6:208:55c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Wed, 11 Jun
 2025 18:29:34 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 11 Jun 2025
 18:29:34 +0000
Message-ID: <0081a33a-2f92-47db-af45-afe3c820950c@intel.com>
Date: Wed, 11 Jun 2025 11:29:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: "Moger, Babu" <bmoger@amd.com>, <babu.moger@amd.com>, Peter Newman
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tony.luck@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
 <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
 <7628cec8-5914-4895-8289-027e7821777e@amd.com>
 <877642a9-cef0-4b80-9053-3ecace9326ed@intel.com>
 <9b08ab86-22d2-40c1-be20-fcc73ee98b3d@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <9b08ab86-22d2-40c1-be20-fcc73ee98b3d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::15) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA4PR11MB9370:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b6bf56-e87e-47c5-246e-08dda915e9d0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnNtSlpYaVBzY3ZZazlJT1RRU0htK0QrTmI0MmdUb1NycCt5VnVua2I4TEUy?=
 =?utf-8?B?dUNNL3dkUVM0dllpbVNGVk1DSjJ6U1BFMk95ODh3Tjk5MStnRUtYRWE2K2xQ?=
 =?utf-8?B?N3pIRm9oUHlWL1JKbk9TQkRRWTNUWWhvejNqd2diclo3Zys1Zno3OHl5MkdO?=
 =?utf-8?B?MGJtSElOcTNwYm9Pckw1TEFMZ1JOS0hOYTFIc3MvRitlbHU3YlhXbHB5MFh6?=
 =?utf-8?B?Y0lHNVMxbVpNSlJrZDk3YjZmaVJ4a3FLV0VXR205ejZrbmYwWVRZcnVkcWJL?=
 =?utf-8?B?SStaOXZHRFZCanU5ZklkN0hnR1RuZDVoNjFNREw2OUh1aXVuMzQwNUlObkhI?=
 =?utf-8?B?QSttWHlVNHBwcElLYlo0NngzYTJJc3NEempPV1pvMFJzbGZrU256a2I4djFh?=
 =?utf-8?B?bG9lYjkvM3psek9XT3lpbE1VZSsvcXYvb0IzY3liUEFGdlNQemwwZkVUZXU4?=
 =?utf-8?B?bWpUMFpCQVo5V1BrUk9RUHdmYWxLNHRmQ3J1NnVOQzRuTE5FSHhHRndCSkZT?=
 =?utf-8?B?cmNaamgwRjlyeU42czFsWnRyR3NqVUFMbjdZMVVodE1YWHd3THl6c3NZVTli?=
 =?utf-8?B?QUxOWjQxaWxGeThDTzVJMTJDTisvVi9kOERhcFVRa1RiODEwUjRDWjVRejVi?=
 =?utf-8?B?WjMrNFdXUEd1Wm0rdUJENkZGR1lDWVgrYzNWMHBIc0wxdU9PUGJQSHNGaU5C?=
 =?utf-8?B?Mzkzc2NERzFmSG5ZMGlWTHpLK21kVE5GSFVzR0d3TVA5cld1bXdlaEEvcFFE?=
 =?utf-8?B?cU5lU1p0dmVjSGdJdWx5aXVTZ0d1ZDdkN1FlWFl5TU1NNkoyUDNzUHozb2NT?=
 =?utf-8?B?dG1jSmhITWoxa2pTeFdBSlhuTmRFQ1ErRXlGS3ZUbzB4ZHNtRFB6MTViQmVn?=
 =?utf-8?B?b2k0bitiV3hHK29PQ1lJbGNsbFBvV2hScm00ZlpvcndCV1hjUnM5OGlsQS8z?=
 =?utf-8?B?dDlzd0Y5WCs4Z2RML0t5U1hmVVNUWEY5ZHdlSzRRRG9PWDB2NUdmQ09IV1Bq?=
 =?utf-8?B?NVhHRzE1Tk5QRGpid1E4ZE1QelQ4RUxlRGhhdU42UDlMODI1cTZTUFozOVpp?=
 =?utf-8?B?enhBOU9xaU9QK0hFdDE0UGtCTXBHbE5IL3gwVVNZbE9SVnBDZjdtaUYyanhS?=
 =?utf-8?B?T1NFRWx5R1lxOVVCaXNIWE1nUHovajB3N3NaeEhXZ1JjTVkreitHRjZ0bSth?=
 =?utf-8?B?MUJZby9JZUxrSG9zUkhzbC9KUzJTMG1kd1dpc0IyeHZCanpyajJjbFlxUHBu?=
 =?utf-8?B?OHkweEdWYjM2MjJnTGVzTWszbVc0ampjaWV4Y2dzQmg5VHhuNjY4R01TUkxW?=
 =?utf-8?B?dS8xVE9vZm55TUdDVUlvV3VRbldJcGR0NEg0dUFTQU4vY3VLMWV4QVdrc3BO?=
 =?utf-8?B?MXJxbTRjWk40MGRFbjRNb3QwQ2Q3b1VUYzhxbUZ2N2FRZVZXNFRkeHNaL21o?=
 =?utf-8?B?dkw2OElWdnh0S29CVEx5d09GMHJWdWFOdHpIVDdMWXFBd0M5N1hReGNUenFu?=
 =?utf-8?B?djQ0aytzWTNLcUxWUmRYaWlDWkZhb3Fsd3RScnREU2NTL2MwdmN6cUNGVzlY?=
 =?utf-8?B?VFRnSTAyeVFMcHN2eFBXWUxkazdnZDk0b1RCNjNuZ0w4WnZyY0treHVrZlRm?=
 =?utf-8?B?emM1Nnl2ZS9DaDY2U3NONFNKc3dqV1NCUGVvWlp3alVzakpxc0VMcS8xRWR2?=
 =?utf-8?B?S3NCcW9Udmd2NTN3SmNlcjdreW02NDFDcUw3cnpvTllXT0pFL29Jek9zMEdS?=
 =?utf-8?B?U2RLS241c0IvM1Q5bGFTNGVGekowcEUzQTA1RjByUy9mdld3WDZ4WWFrMkJr?=
 =?utf-8?B?RVE1VmoyY0RLU3piVVlZOVppUkZCVW12Rzk5K0wyTDY5VVdITmt3RUQvVnY4?=
 =?utf-8?B?b1d6d0FlU1AySFg3bGlOVFpVdkdob20zYjJBV2M0Uzk3Qmo4YW9PcXJGbkhF?=
 =?utf-8?Q?7rSF/8VSkCE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M01RdFRxaUhUMmxucFpvTGt5SmltZjhCWW1QVzRLU0ZUeUcyTE5rOVlJM2NU?=
 =?utf-8?B?OHc2U25uaXg5a0NBTU9KTTVLdGREQVdoM3pQYUhTNENlTWRCS3ZKR2lFdHFS?=
 =?utf-8?B?d3ZvU1VueVFNdlpMNEE4RVE5SUp0V0V5Zk1sWXFiUU1RRjFubWh1Q0FzQ1ZT?=
 =?utf-8?B?M25MR0dtdnRHRVlKVEhSUXQ0Qnh2cHBadzZDcTcycFdJMVNkWWxFVnJCaUZn?=
 =?utf-8?B?RG1RUWVWVVZZdlZBUXlocUp1emdkUUxjN3R1T09TUGN3QzUwT1JoWUZzdGRL?=
 =?utf-8?B?cTBCYnFqNndvY1FYNGt1M0ROZkhjUkRGS0cwQVpVc1g3clpKdFNXUXlPaUtQ?=
 =?utf-8?B?SngwQ2VLdERaa2Y2SjZiV3l5b0xudmEzVURyMlhGZGRRWU5DamwxUU1RUU84?=
 =?utf-8?B?cGhIUEdVZDZpU1VrYlAxcjB1SzY4VjI4aGdzUlIrczhrdks4T2swZGQ1bHJG?=
 =?utf-8?B?OU9IR0FFUjduS2ZTNEhCUnJUQng1bE01UHJ3Y283OGF5YURTbHEvcVpzdjZX?=
 =?utf-8?B?cWJFRzFJR0VZSS84MDg4RjlCSjdYWWZoeUlEYklBaGxrVVF1SzhmQjFTcXlD?=
 =?utf-8?B?cFNzRzl2Y2VRU1pONnJ4Wm82SG56WWpubm9DMCsyKzJKRDNEV1dOR0w1K1Y3?=
 =?utf-8?B?ak8zOWN1elhRVlJCc3dVbC9mcGFLVlhzTTlPdlJTeXVxcWlyRUphZi80ZUpB?=
 =?utf-8?B?cDJqNG5qeGZTRUFoaTBiVW13TG8zcUtVWHFwT2xTNnQ3eStST1VzOU5laHBF?=
 =?utf-8?B?N2JBL0lPY254OG05SWx1TDJNak5oYXgzOXRyMTlQMGEzcFJmZFI3eHYxRy81?=
 =?utf-8?B?OFhaZUhkdjF4U0JGMndkeGpXaFlQZWo3TDJsdzB6U2J6TDRad0VENjY1SEZW?=
 =?utf-8?B?bEt0RjdZSGVqNTZxTUJhLzk2Z1AyZ0Q4OUNocWNOU2RHenZTYVp1bGY0bUxE?=
 =?utf-8?B?ZFhTbWNuT1dFL2U5VU9LZ0ZtZWZabTd2NWlnY3VJNlNJSHNyQ0p2cS9WODBT?=
 =?utf-8?B?SG0vdTJjWFZYaXgvVTdPRThXeGNhSjJIeTRxd3kyaHpmYmVhbmZyMEVYc1R0?=
 =?utf-8?B?TXFhK2x6UWVzRmhUKzlpVDM1Rm9YeWNvazNrK2dHRFBSRyttVEphQUgzTDdu?=
 =?utf-8?B?NHIzVTRGbnlJTjRoTDZyRThDYjhEVkpmQnVYZWhuaGxvTkdqZUlaN0lDWVZP?=
 =?utf-8?B?cmNNRmxXMXZuYWdkemxLU21BWkZMUjBUVmNQWVNSTkJTOTlRTlUxQnpXRXJ0?=
 =?utf-8?B?a0pWTnF4UTN3dDhWVldObU9xZVlzOXpPaTNYSFdxSVF2Qjd2Y082ZExhSXZh?=
 =?utf-8?B?K0orelllSHlyQmpPN2wybzk5OWsveEYvSEFlYVhDQ2U2aXh1R1A5cjZ2OVBq?=
 =?utf-8?B?RWV2YlQvQW1hc2lUMVhMNzV0YW1zUG1kMFU5OFoyc1krRFE3b3EvdGZaVm8r?=
 =?utf-8?B?WGVUU04wSm5Fbkx2RFZESEpLaG5mS2ZWS004dGlnTnRDdkRRWDVHVUhKaVVL?=
 =?utf-8?B?T0lLVzE2OEN1Rjh3QjF2QjJ3Q3ZuY3YydDVPWGlOOEpJSjE4enJuczY5OHlH?=
 =?utf-8?B?MGlhTFFKMzNENnd0QW5tdHBDQXFsN3hSOHR2b2R1aEd2R1lEdW5uMEZNL3Ux?=
 =?utf-8?B?OHBYeGFUL21yNmsxV0pJM2VJcnQzWHRjWVdQUjZZVFlET2tWM2FUUTh0WThl?=
 =?utf-8?B?U3dRdjVRL2t3T3ZqSEl3NStDRTFBZTltbzNLNjIrMGRtRmlzOEk0VkNlYUVI?=
 =?utf-8?B?UnZsQlQ5bnRtdkRnS2RJNkVwZUFMWmY3RUMrVUljdnQzZTRDOThFR3k0QW0y?=
 =?utf-8?B?clljYXZsZVFseWluR3A0TVNzSmVYVnVCOTlWR2UyVkJ4RlQ1Q1ZnTW1WRE9y?=
 =?utf-8?B?OEFqbFA1TWRVeWtpRTJWRHpPMWRpcXpEaldzcmxtMkRndTlZbDcyWGNxck5y?=
 =?utf-8?B?QTRXMXduSCtRekFxVUtkN1JCTW9lNERPN2oyZUJWWlU5ZFUvUlpDOFVQWFd4?=
 =?utf-8?B?RWV4QVlNbTRlbC9wZ05OOSt6WkJOb1c4ejlCUGdSNkFXaFJ4eU8vR2hqOHVU?=
 =?utf-8?B?T2VlVytPdytZWHU2OERNdnpicDlXeE1Ec2hJVGFhNDVMSU9sdm9oNWc5cmRv?=
 =?utf-8?B?aG9FdkdTVzBXYnh6UjcvWEJoclZ1cW1lM0NoMXB3ajVQNEJLQ1BFRkNFbVU4?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b6bf56-e87e-47c5-246e-08dda915e9d0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 18:29:34.0845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XchwS6lp5JZr9yL0aBWJqN+vB+So9UjvZMydLFgpKMai36XDnQOw9hLpUse5nVfYS0PeQGldo5/cSGF2D5/hU1uWySIHFMa5VVyC9I/Des=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9370
X-OriginatorOrg: intel.com

Hi Babu,

On 6/10/25 4:19 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 5/22/2025 11:33 AM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 5/22/25 8:44 AM, Moger, Babu wrote:
>>> On 5/21/25 18:03, Reinette Chatre wrote:
>>
>> ...
>>
>>>> This is why I proposed in [3] that the name of the mode reflects how user can interact
>>>> with the system. Instead of one "mbm_cntr_assign" mode there can be "mbm_cntr_event_assign"
>>>> that is used for ABMC and "mbm_cntr_group_assign" that is used for soft-ABMC. The mode should
>>>> make it clear what the system is capable of wrt counter assignments.
>>>
>>> Yes, that makes sense. Perhaps we can also simplify it further:
>>>
>>> # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode:
>>> [mbm_cntr_evt_assign] <- for ABMC
>>>   mbm_cntr_grp_assign  <- for soft-ABMC
>>
>> Looks good to me. Thank you.
> 
> I am actually ready with v14 series. I have good feeling that we are getting closer to making these changes final.
> 
> So, Looking back again, it might make more sense to rename few user visible interfaces.
> 
> 1. # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode.
>    [mbm_assign_event] <- for ABMC
>     mbm_assign_group  <- for soft-ABMC
> 
>    This looks much more cleaner.  It matches with "mbm_assign_mode"

ah, I see, by dropping "cntr" it reduces confusion where ABMC assigns counters
and soft-ABMC assigned RMID. This looks good.

Taking this further, the "assign" term in "mbm_assign_event" and "mbm_assign_group" may also
be redundant considering that the filename, "mbm_assign_mode", already has "assign" in its name.

> 
> Similarly, we can rename few functions and variable names to make little more readable.
> 
> 2. mbm_cntr_assignable -> mbm_assignable
> 

I have no insight into how the soft-ABMC implementation will look and thus if it will
build on this property. If soft-ABMC uses the property then making it more generic may
help, but if it does not then it may make the code harder to read. Since this is all
internal I'd vote for keeping it mbm_cntr_assignable since the current implementation
directly associates it with hardware counters. I do not know if there will be a scenario
where a system may support *both* event and group assignable counters. The idea did
briefly come up[1]. If that may be possible then resctrl would need to distinguish them.
Also, interesting to note that the example used in (1) above notes a system that
supports both event and group assignment.

> 3. resctrl_arch_mbm_cntr_assign_enabled
>  -> >resctrl_arch_mbm_assign_enabled
> 

This is directly connected to choice for (2)

> 4. mbm_cntr_assign_enabled -> mbm_assign_enabled

hmmm ... here mbm_cntr_assign_enabled is even more directly associated with hardware
support for counter assignment. It is not clear what the benefit is to make it generic.

> 
> 5. resctrl_arch_mbm_cntr_assign_set_one ->
> 
>    resctrl_arch_mbm_assign_set_one.

Same as (4)

> 
> 6. There will few more functions. I will look into that if you agree with approach.
> 
> 7. No need to change few of these below. These are related to actual counters.
>    num_mbm_cntrs
>    available_mbm_cntrs
> 
> What do you think?

It sounds to me as though you are aiming to make the ABMC implementation more
generic in preparation for soft-ABMC support. If you have insight into the soft-ABMC
implementation then please share the details for this to be taken into account.
Until then I think it will be simpler for the implementation to be specific to
the feature being enabled here. When soft-ABMC enabling arrives the needed changes
can be made. Since this is about internals of resctrl (not the user interface) we
are not as pressured to "get it right" while not having all information required
to make these choices.

Reinette
 
[1] https://lore.kernel.org/lkml/CALPaoCj438UfH3QA_VnGo-pj2a_48sJufUWjBKT3MQatcMJ_Uw@mail.gmail.com/
