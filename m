Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C5F28FFEA;
	Fri, 11 Apr 2025 20:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744404740; cv=fail; b=dZszIHiosd4FQaVQIN7fYt4xPaPAbjiKV2a9NoSNeX0KtiTkt3NLXu/RmkmleqLZ3IRH8Vo6XXdRv9We+YpKAJUxqPOk0sh0TL3pAb3KlDho/e/kAKfmKhholeDZqEciLJ69xRYQdA0Dld5CQ+zRyimF/ZmqG5JvIHa/kWwZmRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744404740; c=relaxed/simple;
	bh=XCY5k2DkfbIctqDKYr/I9sS6z8E+JTAuLq8SX7yceO0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UYRI3WyoWJ7JIDmBo9d3LbG57AdiVwDyVorYneBVVbEF6/0fyIgEWwnTKVy2QysaZzgCJYs397CUZTZ/3bLYyRdvuJAul9g30FqFJec9ZYcZ9YrR5aY0uLGfBPsJjaXtw+JB+7mRXwTuw7UBtuxwvSB4Ir/Lq1Ndsd726lhlAt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbvZy0Kb; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbvZy0Kb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744404738; x=1775940738;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XCY5k2DkfbIctqDKYr/I9sS6z8E+JTAuLq8SX7yceO0=;
  b=fbvZy0KblyOx7YmzaGB9rKNSUGVX6GjEcbwDbSrzYgegKTwURQNysyg4
   LCGTiCDOVXlXSeVepIV0yRr8lPYKKgJKHb22bBYLHoA2qKeEy/j4+8EX1
   wES6r0XKzKp5zHzf4qxPU0wYUS4X3SwzRkR1BSFvafD1O14c3e37SB/Iu
   wJOpjwc85PVm9FXu64NpMIOZbtlWWbx+5RaVhNJankGRoQ9KaqlgF2wN0
   Gcrkr5tH9rBnKgatSZYuXwUYm8VynGDaYyQz6lAkLCPv+mh350G/LfVx0
   RdwXjsqQdP7Ui8IgOa7w+k+HdCHfRMS9PiimXMWLr+71DJWYTM2fwxv6/
   w==;
X-CSE-ConnectionGUID: iKdOk1gWTuuMYwN50uw3bA==
X-CSE-MsgGUID: WAdBYupMRYm2y40BYvJaJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45870134"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="45870134"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 13:52:17 -0700
X-CSE-ConnectionGUID: AYeuZNF+TXiOTyOzl4NnLg==
X-CSE-MsgGUID: E2Nt5fVIT16Urj6LMOsKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="133392314"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 13:52:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 13:52:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 13:52:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 13:52:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4gDwZ4OcBVUDj3wgj4nXk4Pf2s1lFpXspi6VR/ZBU7zOaqKk7k8QJcZUai8RFQRNKt2Pnue/hpC/3pGVNfH3yoL/ZJSbKC13XRUvfWaYGUV5FSgCB8J/IAMCv3wmRexYA1eshlEBW172QlXVENIUULw7DnbhA0QXXUx+cugL9GD5KuOeU6+mvWMbQbLvdvR13XIs2EXNclU7w1atv9IiuwI2iE3TKJ/uD04pdUD7NGfD0iYsY7RzP/fSJt/C9NnRefDD0aMfztv2kW5q9ulEZDVXR1RJKeQYDi1SQm5fTQmavemC5SGIzHmSCIL2Cuu+l2C91G5eLue6wSFEubmRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/x3Fg5mVuEbgf7HVehPu6o++3Dmk60cMDE+SWJeIXw=;
 b=mxARoNv+nIYKzdGQygzOO3+pxndCu0ZWqtGBWMxdsiLGc3fUHJnMEgI/P6t/8kXSJ4/VJ/pJLxhrPIGk6xLIm4e6LDt67u+c/zvr2rwQqrhw2Ky3Ab0Xwd8lb93TSMgfWzqGj91yw2EYCeIgC4bnXcmGjLwq3+U4d/0ftYBwthrSHk3Xq1xugxvuYL1a1ZCaTvnd5gFQRv0F5D4PktnEjyRqzSWUDZhOBQA0F9tcVy+l+m1pRUmos1dT7dgsRhgWoKVrEmtPVr/R5kd2Ieaui5OyFtngNri5IBIwNwqz8OMnZjZExX2mKQL7oD2I2jk2O1HJdTj+sDO6A+NKfgWuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by DS0PR11MB7849.namprd11.prod.outlook.com (2603:10b6:8:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 20:52:11 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 20:52:11 +0000
Message-ID: <74255838-47dd-4e18-b458-f9488b38b9e2@intel.com>
Date: Fri, 11 Apr 2025 13:52:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/26] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <135e452ba38426487e143bc4661883e4939d502c.1743725907.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <135e452ba38426487e143bc4661883e4939d502c.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0374.namprd04.prod.outlook.com
 (2603:10b6:303:81::19) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|DS0PR11MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5ce413-9167-443f-eb3f-08dd793abb4c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFkvRU5NN3BuVE0rbGNhbVZZL0lBdGEvQ3JXdDVkc0tQNUxMSXB2YkVMRlF1?=
 =?utf-8?B?US9tU0gwNVpTWDNnVUIrcGRRM2lLNFNuSzRaRXpwY2NvQkk2RzFGRUNjVDVj?=
 =?utf-8?B?Slc0aU5xUTJWamlrVk4rMW05V0hiVUErczdKaTdaQVpmVXc5U25LVnFmYlZB?=
 =?utf-8?B?cElMMTlJMVhWY2hiNEVqQnRCRW5ZVk0wVWR3RmFnVDE4Vlg3akI2MTlhN0xl?=
 =?utf-8?B?S1JYNC8yditjV0E1MEdEMkI5VjBoUjhWRWd5MW9GcUZ2VS9aS3Fzd2VoKzdt?=
 =?utf-8?B?MWNNSkpzSGNXTFlmQzVROWo1Y1loVm1tYjlDeWF0a3RyQTQ3a2hGZmNrdHBG?=
 =?utf-8?B?WHA4ZFFObVRFR1ppKy9EcGRqL3dlNU9zc1BOd0JHZm1zcUxFcTFabnQ4R25r?=
 =?utf-8?B?SjZpNWpWUFd6TDVsd1MzZTI5MldLZC9xb2RiazF5c2xlSEwrNWpjL3R4N1FE?=
 =?utf-8?B?dG9ta2l2aEJyTWdzWklrNVd2YkxadUlSMUhJT1E5S3picUhOZm15T0hyd0V5?=
 =?utf-8?B?NWx0ck5RYmJGcEp2QUZmWnNlU3VvYXJiL2NvNEgyQXFEaE9XbEw2U3VpL0FC?=
 =?utf-8?B?T25XNGNNdXNRQzBFbU9QbDhHV2JkVjRWdGtsRW01UVl1N2VzREFORGs2UmRR?=
 =?utf-8?B?ZzVyOW40SWliWWZHM2Y0b25nV0g2TkRULys1alBOaEkwVDJpa0NYYXZkYldp?=
 =?utf-8?B?UlFEMVgvVlNqRndXSHBOd21ldVVZV1E0Rkp2N3R5bHpLdGlxT0hueWM2ek4w?=
 =?utf-8?B?cXhDQ21EcXc0WEZFL0JTMVFrNlgxQjd1NWZxWTI5SGF2S2wvdXpYd3RwUWlK?=
 =?utf-8?B?V2xFZzcvcUlod01QNDIzSjhiUkI1ckFIUHRwRTdTTnhwQTU2ZVVFMjZPMHk0?=
 =?utf-8?B?MnFSTXN0UGRJcHFxYkFBdXNFaiszYkZrRG4xellBQXZnS0dmRGVHck9PaGdy?=
 =?utf-8?B?NWNRVzBkUWRCVmcxN2h0QVJvQ29qUkdDM1Fvb0oydzhNMkVqQ29tVm9tenJZ?=
 =?utf-8?B?MGVoQ1pOQ2hnbG1FSmtXeG9HYStLNmEwZk53QlZQUFJTUDI1NU10ZlB6Wldr?=
 =?utf-8?B?WTh4TytpMW5zcGFyOXBVLzZtbFAwRElDWUxra1c1TVZGZmtKT3lMSVdXbVpW?=
 =?utf-8?B?dDdaNEtOTU43RlhvcWp3UjRid0hNSzdhK2t1c2V5ejk2S09HVkp6TE94bk16?=
 =?utf-8?B?YlR5bjAzY085c2g2YkZ5cm1kOTRkWUZobzFkMG5JckZXQ1Q3MmhmY0kreUVz?=
 =?utf-8?B?VExJbjAzc1A3T1A2dWprbXNPMG5GNWIxZVA4KzlQdUE4R0RuSTZ6UzVEbzcw?=
 =?utf-8?B?bzdVRXY1ME1SdTI1RXFNdEZ2cDNibVp5VDkvdU9aKzJlbWxEeVZrNjVpKzdI?=
 =?utf-8?B?Rlk1UzJJUmJKUmJ6VW1kU28xQzVjTldyRjIxWTVkLzJ5K0I5TUZuNGdxcU5t?=
 =?utf-8?B?MzkyMzdORTdFZHlsMFhOeExsbitUbDlaVlhKWlFpWVo3R0RURDVsZCtnUkZo?=
 =?utf-8?B?dEYyaU1NRmJ0Sk16Y29vL1hBOGhxclNvVFFLd1l5NExWUEQ1bHl2R2M0cmxz?=
 =?utf-8?B?c2VHc05rMmhsWms0dzhYWXVMelkxcmVUbzkxRjV6ZFZDOEZzWURhZDBsUkZC?=
 =?utf-8?B?OVdoWTQwTzdrbi8wTkZlM0l1LzVBbkJaUGpWbFlreDBWS0k4eGo3Y1NHdExZ?=
 =?utf-8?B?NDFOOW10UkFDRkFZY1orSHhWOTRLSzB4dDEwMlpHRmRwb3JxWmdjMEsyL0FG?=
 =?utf-8?B?Q2hISHJ4d05UbTFjeFFPR0g1NS9pSFYzdkVMS2szQUdLYmV1ZThZNzIzR0J2?=
 =?utf-8?B?Nmw2SXRyTFFZTU8xU21mQ2l3U0h3eUpJMnZvNjFrV3ZKcGlBcXJxNjJqSFRs?=
 =?utf-8?B?R2dOUnVuUTM5YTBKaGNwSmY5ZEVaeCtsakpaUE5uVnZlU3R2aG9YZ0V6V1hu?=
 =?utf-8?Q?5KkTXBLqnxw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVNwVklCMmdBNVgybzNGakh6NjZPZkpwQ1VnY0VKalRJSGh4ZTd6bldPRTdE?=
 =?utf-8?B?dktucTlkTkJmeVpuVm96eTF0V0NEeFMxbnNqTTZyZTJhV1pWTnkxTkRPREN4?=
 =?utf-8?B?OXVEUTNMOTFNdDlLeHN1ZVhzRHF3NlExb05JdHI3RUpCMWRSbDFvUmd4SnYx?=
 =?utf-8?B?S05TWnBPZ0E1b1ZSQ3lIc0VWMHZMeG03ckRoU2ljczRBM1NURDE0TVZLcGEv?=
 =?utf-8?B?MmFHUmVSOVVIMk5udFk0R2ZobGdBS2oxZ1RxUVRGeXQ1QVN5c3FSNnZjT2Rl?=
 =?utf-8?B?am95NW1rN09UMllZL01lK01RQ0lObDl3VTFRNDAwZmdkeXNkeTRKRU9Ob0d4?=
 =?utf-8?B?dUVsTHhoWHdZSjk1S1M1akJENnNNOXFIYnFlSk5neXZ2MUFyR1N5R21IZ1ZY?=
 =?utf-8?B?RWVXa3hPbEtpeDZraEo0cGtjaGRXd1FtRzAxcVNYL3Fib1F3U3NxTjB2emtG?=
 =?utf-8?B?ZGJ4cHlNNlVqQnlvK292b3FhYWtoMkVuL2NWSXl1cGlDdGdFVEU0NHpMTlBo?=
 =?utf-8?B?TmRzMmwvQWJDaE1aT0R4dWx5d2F1MzVvWFhEWHVGT3Jpek9uN0w1bWtUT1NI?=
 =?utf-8?B?YnhMZDFBdm9jN2V5Mkl2eHNaK2VnWmxieHdwcS9pTklyYUc5TmhlcTFsTWJh?=
 =?utf-8?B?VXZiMmpLb3BvaHU0UWJrcTBncG5SdHF4T0c4ZGRGMzlMeTFHSU1jcVVJand5?=
 =?utf-8?B?eU1oSGFkaG9ZbXFEOG14V092Z0YzZWFXZDNiM3hHbTZ3WE01L3R0eVkyWWFW?=
 =?utf-8?B?OGNscm1BZ0pvRlI3NjY2ZzcrT3RHTktpTVdVdVRnd2NZZDRSY1lJNzhiTUo0?=
 =?utf-8?B?Z3V1UDJPcUZBU1J6aHNOUHNzU2U0RG0rcVBNQ0xTOXlFaEtJbHBKSDZEejdH?=
 =?utf-8?B?cUhMQmdhQU5ZeEl4QncrMUNkUGZNNEJuV3lmeDhTeGlnUnRGUzZoTmtpYkJN?=
 =?utf-8?B?SGNINU9lcnE2bUtad0cxVUlORCtVeGFqUTZNQ1B4OWNsNUVqNHdGb0xyZXZt?=
 =?utf-8?B?SmFTSFA3T1Y5V3paVHJ5RkRJWXhlZS9oNVRGQXlrU28zeEMwWi9qMHRHTlEx?=
 =?utf-8?B?dlhPZkc5SGhKb0RXZTBjcHhPbzhRYkxrZjMzT2FCdWpLWGdVeTBTZ3pHVWxM?=
 =?utf-8?B?YkRKd3psWHlLcy81Sm52OVBGN2x1eFNQMytqdmE0SjI5ck1UKzQwYmo4d3g3?=
 =?utf-8?B?Y3NSK3RKNWNUV2xmcDcyeG9JS1djaSs4M0R3V3RPMVdpOXNnNnlGeTl6ZXJS?=
 =?utf-8?B?bjNlVVhFOWNITDJ2ODFJdzU4d1oxbEZPM3pjc1RWM2RNM3lZMmRTci90WXlC?=
 =?utf-8?B?Sm40a2IrMlMvU1hRV3A5Q1RMOStiZ3l3UE5nVFBpWkxaY0N6NjFlTTlEaEE1?=
 =?utf-8?B?a1lTclQwaXFSS3BCMkFRRzZCSEpINEIzT0U4QTNIdGFYaWRjRTE3Zi9LY2Iz?=
 =?utf-8?B?eG5HKzk5QjZHRjRvNlVpMVFidFNvVnZXVkJDNG4xWk9XUTBwSy81RHNyVlFt?=
 =?utf-8?B?eGZ0eW5qKzFxbEx1cktEQnUyT3lSdkdITWRPWG00Wnk2SUY0TzhpWWRhdERM?=
 =?utf-8?B?eUNvY3BBRTk5R3RSeEd2YS94ZVVZMFRqL2lUL0FrNUR0MTVJT2pCUGpmeDNN?=
 =?utf-8?B?UXd5TEZ6U1U0WFdPTkhUK3BFNkJyQUxEMFlVakMrVm5kdG5jYTVnbDBrd3U4?=
 =?utf-8?B?SFlkcXU5MHgvMFFqeWJ6Zm03M1VMR0NVSHFSaVJQSTI3MFplRXFPMVJTZ1lN?=
 =?utf-8?B?U0lMeG9RSlJrSUdTR1J1OUl0OUExWFNDakFmU1JNeXJTcTBaUG5jRWUvMnFW?=
 =?utf-8?B?Nk83VjJRWEw3S1RNOVhENWFheVA2aitNWnU0OUpidnA5TTdRUzVySGM5TGFL?=
 =?utf-8?B?RmJTenpON2ovajNzOTJYVE9LeTZ0MkgrWGRUSkgwVmFvdHNLYVVoMEN4RzBB?=
 =?utf-8?B?dENzNk0wSmlER3lUMHU1bVFIQjFDZEFFUXdxRTdWdjRKVkhxRE9pLzFzTzlk?=
 =?utf-8?B?dFd0Mi9PaDZkZWVVZlI5ZTBTOW5CY2xIM0ZBRThxNGpIUGY3UkNFZFlpek1n?=
 =?utf-8?B?bmF1YzBLWDVnZ3RYdFZJQ1R5NjArU2wzd21TUkdqVDY5NEVqRm11MmNocllZ?=
 =?utf-8?B?eUthWXVGMXU3MjhvL212dDhwTmRMUTQrOHpVKzczZDJSVURzcEFVcXoveHpE?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5ce413-9167-443f-eb3f-08dd793abb4c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 20:52:11.5969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3c6fAkBeaVjbUbOhRetlPpiAJ8hRRmwbeF4URRXlIrup5c/WvBLm7VOCCre+twKMsfSv37Qm9DoPM+OmxpPJwS1CM9hQayE/87WeZ4KFiPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7849
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> Users can create as many monitor groups as RMIDs supported by the hardware.
> However, bandwidth monitoring feature on AMD system only guarantees that
> RMIDs currently assigned to a processor will be tracked by hardware. The
> counters of any other RMIDs which are no longer being tracked will be reset
> to zero. The MBM event counters return "Unavailable" for the RMIDs that are
> not tracked by hardware. So, there can be only limited number of groups
> that can give guaranteed monitoring numbers. With ever changing
> configurations there is no way to definitely know which of these groups are
> being tracked for certain point of time. Users do not have the option to
> monitor a group or set of groups for certain period of time without
> worrying about RMID being reset in between.
> 
> The ABMC feature provides an option to the user to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as it is
> assigned. The assigned RMID will be tracked by the hardware until the user
> unassigns it manually. There is no need to worry about counters being reset
> during this period. Additionally, the user can specify a bitmask
> identifying the specific bandwidth types from the given source to track
> with the counter.
> 
> Without ABMC enabled, monitoring will work in current mode without
> assignment option.
> 
> Linux resctrl subsystem provides the interface to count maximum of two
> memory bandwidth events per group, from a combination of available total
> and local events. Keeping the current interface, users can enable a maximum
> of 2 ABMC counters per group. User will also have the option to enable only
> one counter to the group. If the system runs out of assignable ABMC
> counters, kernel will display an error. Users need to disable an already
> enabled counter to make space for new assignments.

The above paragraph sounds like it is still talking about the original
global assignment of counters.

> 
> The feature can be detected via CPUID_Fn80000020_EBX_x00 bit 5.
> Bits Description
> 5    ABMC (Assignable Bandwidth Monitoring Counters)
> 
> The feature details are documented in APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> 
> Note: Checkpatch checks/warnings are ignored to maintain coding style.
> 
> v12: Removed the dependancy on X86_FEATURE_BMEC.

Considering this removal it is not clear to me how the BMEC and ABMC features
are managed on a platform. Since this dependency existed I assume platforms
that support both ABMC and BMEC exist and after previous discussion [1]
I expected to see that BMEC support will be disabled when ABMC is detected
but I do not see this done in this series. From what I can tell, looking at
patch "x86/resctrl: Detect Assignable Bandwidth Monitoring feature details"
BMEC and ABMC are both detected and enabled while I do not see any
interactions handled. For example, a user modifying the BMEC appears
to have no impact on existing ABMC assigned counters. Could you please clarify
how event configuration works on platforms that support both ABMC and BMEC?

Reinette

[1] https://lore.kernel.org/all/4b66ea1c-2f76-4218-a67b-2232b2be6990@amd.com/
