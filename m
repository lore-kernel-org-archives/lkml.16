Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E55619F111;
	Thu,  6 Feb 2025 18:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867741; cv=fail; b=AuP0CmTc8dfrxEIFBnytffWz0MZniOWCrr/452nadloeYkR/BIUkiUe18zy5OGAcZNiyvNNBoVj+czGiaEQ8Asz3OJsIKZfvkf7DQgeRvYyK93i/FfBQGTB/JyQBWc1IRyI6kJLJoxoAQWTFsyZbH/YM7QJAvuwP7ajsFRCHffQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867741; c=relaxed/simple;
	bh=TlqLze8glRbf1P6sMsi+4qm1fl0Xnv4t7BsTBvnOSWQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BADOJDVjIa8J3n3eo9xhviO7VfLMwRamU9NkAbq+0bq36Pnv53VrIAdU81GYJFjzBa1Wf393NKREVsptOnzuDZ8m1UyVMx8JKqtVlGsTsOheQw+yuL3R/NeT6ZkbfB0Q/IA1WFF1VILHE35wFbnIavcY+6+Oz87KaEjcuwfjH/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfNPid2G; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfNPid2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738867739; x=1770403739;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TlqLze8glRbf1P6sMsi+4qm1fl0Xnv4t7BsTBvnOSWQ=;
  b=UfNPid2Gbejq/kvUdRuNe++k2BQVTlYQjy+rE7QR2Md8cJgl4Ttyc0ZS
   nABtkdK+ZlCqnrhmFXV+ZIPB8sy/5vEknuHYQToIp85WorD5jCTmtEJqN
   j3WgkzVLXTgzo5qZHCWPLxAMl+4kVa6exSDIMIaO1x9T50Rd8Y5/gaZ3G
   7sqEAAqafPhHYHnJVfFs9ARYZrXlLB1UQu+XnESpsKW8b7ie+zFHCT5aC
   PRkBp4sV1tRYSCrMAxeMyVuQ6uesoGD0c4S7/qrtk/GJ4yiUiO6EMi/Jo
   CSlZS2PzD5vrXUkvUelq8JoO82BW/+036kqVV2KjRHDow7GTaJUzQ0+wB
   g==;
X-CSE-ConnectionGUID: 7rfERPbtQIevuoLk4TIEzA==
X-CSE-MsgGUID: bxsLsb55QkyEo3AN1j3Qgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39513532"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39513532"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:48:59 -0800
X-CSE-ConnectionGUID: djh7kDLAR5K3Xh1Anh9+tw==
X-CSE-MsgGUID: ORZW2ww7QLuj1ugNGAd5EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111909345"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 10:48:57 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 10:48:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 10:48:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 10:48:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyg66QVUBneSEPQ31dcca4JnyzkdSNdfsVe0wzlmNX/7gLZaqZJMhvlcGlyLZR97m8PzVlFqotSwy0Kd3ABdHu4WgbB4ZC0tCIIaJKwMzLogqceMTUmAsIY7Znw1vAenUfclUHQM34fXW32dvMVtljGFcSBMxEpDdyrINGnQb9S3cSvNY5pasJBAngf74WSzrBF6X3HAlVtkyuEDPiJ1enyAXP5pShe7OxhjaqvLa1lwScSbiI0IJBqs44zovJ2AXY4GDnxG7gX4Bp4ucwyTueHLxOz7FidzlDb2mflPsXqG7ZI38Fmf/h75Zg5j561VxdVyS0cjo078ZZDKTuawLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYP/u01G2ZzJuOKaXuI0zVth2OBpvHDtCm+7wREouAU=;
 b=dfZH1nvYGsgDI26G5cY/LUTY5eAdIifYCa8O4QQIeocLVbIJ/fCFVTiVz2Lk1n8mH3eunJ2wQLqHa+ZrOTpc4YkrUWEHb+TUh+yN3VoH+OIX1EtFaMC0nICAXueYHcVEyjjcEYDYw8TvCzbZbMcf3ZmKjRUGieiuWWkXVfScNQtDNIDg9+Ovva8RkXp9AHdQv7parrs1egKdoDL/qHHiuQafZT947vm1TqImCGQUsL2LnA4DXwsGxwf8ILufNftpHvXnC5vjopYoMH1yps7LSOJ3e4qxg77m10tAuPZ8tZg2WXWvNGQ8RJQDMXTko0stnKrGfYUsAyiLC68HLvRtUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB6754.namprd11.prod.outlook.com (2603:10b6:510:1c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 18:48:47 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 18:48:47 +0000
Message-ID: <c8dfccf7-602a-4188-91a1-098095181812@intel.com>
Date: Thu, 6 Feb 2025 10:48:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 23/23] x86/resctrl: Introduce interface to modify
 assignment states of the groups
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <fe1c0c4cebd353ccb3e588d7ea2fe9ef3dff0ef2.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <fe1c0c4cebd353ccb3e588d7ea2fe9ef3dff0ef2.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:303:2b::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 35576311-ec4c-4bdc-e0a3-08dd46dee37a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjQ2cGtKTTB3OCtXcmF0STkvVmNLUjBrcS9QMzBZdmEyZWZsK3ZOM2gzUHZ3?=
 =?utf-8?B?Q25DZXQyM2hFQlFMaG5vU1VZQUQrVWw4cGZ0TGhQYTdIWDZFVzBRSk9MZzJk?=
 =?utf-8?B?SXpSSFpwN241VHRuQzlHakJkSzZmYXZ0RU41L1N0Zk5sQ05NUjMxdlZobXR6?=
 =?utf-8?B?c0RsaEtGQVIrTUhybzZ5SDdiY2t6anZxUUJrR2RpbGhKNjBaR09LZ1AxN1VR?=
 =?utf-8?B?MFRvOEZjUkRtblE5VFpFYUlCR1l3NUZpNjlkTlU5R0lTeDNoMisvWUtxTjIw?=
 =?utf-8?B?NVczemV5Vk5MOUZaR1Naei9ibEtrb001NVU0TXEyS1ZKcDdnTFBoSDJ4U0xN?=
 =?utf-8?B?NTlNcU5qUkM4ME42QWJwU2hzTnh3Y1JWa0xQbnZIdEp5bFFQbXErOXN2Z1h2?=
 =?utf-8?B?bUFUMjJNTThMRm4rM3p4QzhqL01rQmc5SlhWazBWVGNtNXFwb3ljVzdKb2Rq?=
 =?utf-8?B?YWdHVzkzRkd1blNLWmxZM1NFMTlMNnJVekVVNDgrYVhxU3NmM0NSdW5qY3Qz?=
 =?utf-8?B?Z29JcDlHSlZaZXd4Sm53d20rekI0UXVmRE81YzVSM00zZ2Z0ZlpRZllUaVRL?=
 =?utf-8?B?bFZtVlQyMGUzNnkxRTN0bi8xaHozSEo4YmQzeDFwRnA2RU5WSHpUcTBkRzNH?=
 =?utf-8?B?SlBvenV1N1RXS1E2SnJVVGprU01IWjFUeDh4VUxVcW9rcVV5Y1RvdWIrdldG?=
 =?utf-8?B?bzZvZS9QNTQySnZNeFhrOXNhNU9BZjRJa2h0RWUzU01TYk5WZ1orZFRwVWdN?=
 =?utf-8?B?QkJEVktHVkdUakNYdHh3V2NnRUVlcmFtNlM2cG55N2ZDUUVSKzBTckxNNVh3?=
 =?utf-8?B?RnpMaWNGK3ZyWWNCa21uSmwwNllGeWd3bTQ3QUxjUDhGbGFxeXlFRnRqQ0dv?=
 =?utf-8?B?T1ZSSzB5UzdURmcrTDB5bm91U3JQbk0rRjFDYnlXNUM4ek5yVndxaWJHV3FW?=
 =?utf-8?B?UnFGb0xDZGUwTmpYOUszN0hvMGJQWkRSNlV5alQ5U1Iya0FkZWlUbWZ3eFlm?=
 =?utf-8?B?QnZNQjEycmRlVUgrOWRqNVN3Mi9ibHpKTy9KTG0xMHloVmpiemxWRHpIeDZI?=
 =?utf-8?B?SFFzdXUrUW5UcldvdDZSL0ZraEFrN01COWx2Wkoxc1ByVC9hdmkzVGliSElt?=
 =?utf-8?B?b1ZaTTB4Z0QveDEvRkRJVzRsOEhGVldMU3gvVUdyaDRWakFRL2lLTlVrYUg4?=
 =?utf-8?B?OTVmbkF3NVZ2WnFrRUVNZ2xoQThBUkxyOUZwZmJpUXdRY2FqT1RFeXNFNGtV?=
 =?utf-8?B?NlQ3Qm1Xby9WY3FZQlhCOE1xY3FoQWEzWXBsVHU2V1pQdjdQSHFOZEN4cEZ1?=
 =?utf-8?B?MkhJSDR5ano1aWlBeURYV3hwZjRQTmNPREhaZEJKSVRFdXRnN3JIdDZRVm5y?=
 =?utf-8?B?WXU4d2Q1ZkhESzBsZHY0WG1iRTVHUmNIZlFGTEhnOUI5Ui9FNlJPRFM5SkJj?=
 =?utf-8?B?Z3NDR09PRXRhQzlrOXpKK2crWFBvaHBNeGJHVjREaEMxNkhZdE9wdWdEUDYw?=
 =?utf-8?B?Q3Q3dlhKWE9mQWhvQWJBVlNyUXJ4emhGSCtHeno2YmtHL0ZjaXliVStvYkE2?=
 =?utf-8?B?cU9jd1M3eCtxdVFZMllRSk56ZGIyWE1nRTVtS3IzU0dtZTZrbXY3dDdmNEJ2?=
 =?utf-8?B?Y0hEbWtPeWlkbWZtNjNBUUhGTXVJYlRlWjVhTkU3TGlIVTZQOTRSdWdYY2FI?=
 =?utf-8?B?ZXUyME5nbEYrTXBhVVc2ZE5aNHJuNTdaSDAyNFJZdC84K0JQTCtDbURsK0Qv?=
 =?utf-8?B?UkpsNXNacFJ3MThRYVdBbGk3cXVGWVdQQzBVdWo3WlpQajlkbTJ5ZDV2cXRK?=
 =?utf-8?B?ZHo4amx1bG40N0JhTEVHUTZqZzFDSzNGbTk0dWdOaFp0Ukl1d2RpMzFlYi9X?=
 =?utf-8?Q?Eq2BNDz8yDuQb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDlwRTJ3QUphZ2ZFTVVJR2krMWV3Nk10SGIzcWUvcXBTN09EejVLWmpOMVdK?=
 =?utf-8?B?bW8rSkVhTGxxOVh0RVAzYXF6eUZ6T3lhMWxwYzhERVFiM3N0RUx3TnA0R0dR?=
 =?utf-8?B?Zms5VVZhQkVQSWw1dnd4N3ltOW03SDc3UW5hRTJ0L2F3bWRnbDBQSER4MkU1?=
 =?utf-8?B?U3JlWEFQdVNMS3dXeDNXcjc2SVVQL0ZoNU1na1ordWt2T0kzckU0U0xzbjlw?=
 =?utf-8?B?SENYNVlGdXFJSEtMZ080ZlkyZmRKa2ZQWHM2N3RzOUVQWWRXZ2tncFBNUEtk?=
 =?utf-8?B?RCs0WEJHS3FGNjhaTjlUd3dYNkppRzN1L01CdWxRb0h5SGRZaDN0QjVxTHBV?=
 =?utf-8?B?K0dFNkcvdnZWa3djYkR1Wi9qQi9FZmJoTU80ODNDekZIYUJJRUVMQXorMk5P?=
 =?utf-8?B?NTlOKzl2OW1Wdldmc2p0d3MrQ3dhcmE3WkYwVlRJTUUrai95c0FXU0VCelRk?=
 =?utf-8?B?c0g4WW91MW9ETC9sZm5yVTBhTmE4Z054ME9acUoxVzNJUVJrd3FpWHlUSW1i?=
 =?utf-8?B?T3BZcnIzN1M2T3R6RkJYY3lDV0t4RDQyaEhsLy9pMUNzVGJBaUUrZGhRdy9R?=
 =?utf-8?B?cG1PL0ZEZU5hT0trdTdwejNrdDI1Q2l0eDNUSkNQZC9BdjA4NDZDRXp0UFgx?=
 =?utf-8?B?SXZiREhCaEs2MUZGVkh3dEhERldlT1IydU5SSVh0WmdIS1Q1TGJ5VVJWbnZn?=
 =?utf-8?B?WERaQ083UXhGaGEwSWNVcEoxNkFrRVBQSFhNakZObUg2ZVYvWWpjV3YrY0VL?=
 =?utf-8?B?Q0lNU2tkdkI1Y3RFMHl5MHRuNFhIY3hsdUo1M2tCQUpjRUJ6REZSeTd1bSs1?=
 =?utf-8?B?ZGZnMzZvWHlmTlBoMDhZRmRYa21LUU1XTzQ1Qkl4amtVZ1krYXRXMFg4VEJZ?=
 =?utf-8?B?UFUyY2tPczJPK3VJb2E0WWF2c09TcVExNXNzRkFEeUxpREQzVTNURUxidTVn?=
 =?utf-8?B?Yjc1V3VoMVhnaG5ZeHBvbE1McWFYSlBCdFBmTlYxUUxkWEpkVndlMUEyaEdI?=
 =?utf-8?B?NzB3QXBvdUM5bFpyWTh3c3UxRjd3NmZtS0p3d3Jkai9HT2xQcXhLUjc3QStX?=
 =?utf-8?B?cGJTM2tpWGxVZlpDY1dDejNNUTFJdENsWjB1Q2piamViNStCTTAzcmlXQXJj?=
 =?utf-8?B?SDFtMk44UWJLbVpXQlRwNy9xMmZ6OXYzTEFacklKNjZpSkZtVm9sa1ZhU1c0?=
 =?utf-8?B?RUVPdldpZkdZcjYzSlliQmtGbWxqK3RYLy90VmJxK28rNlh1MytETnRQczBt?=
 =?utf-8?B?azJtYlEzd0lXOHNhdnlmejd0MVBwRWFPb2wvWWNZTENlNmtZMDRuZTNYR3hn?=
 =?utf-8?B?NFQ1NjVrS2lBUHNEVWZuZWtNd21Ia20rNDVEaDNnc0dzbktOdUVCMHpyRWI0?=
 =?utf-8?B?SE9LRkRleUlWRFN0VDg0LzRWdTllc2YyMkVBdjIrcmV2Vk01UTVQUk9vckE1?=
 =?utf-8?B?dVBBQ0piaHBqUDJ4L21Bd1NBOU9MaXZDazBrQkl4ZmhmalQ1RFhYakJPbHVK?=
 =?utf-8?B?NHU3VmZMNXY1MzNmZVJHN1ZZeHYrODRVTkh5a1h4bDF1bUF0bVJEcVY4U3cy?=
 =?utf-8?B?TG0zeTljaCt1cjFNQjJrOElTS25SSVhBaG1YMHNjNWtiZ1lpZFQrek9EKzhh?=
 =?utf-8?B?MXZZajVSUFBUUGFZaGJKbkFRQnVmR1AzZUlXWkZ0TVNnQ2k2WXFYWHZXZ2JQ?=
 =?utf-8?B?bkloMHg2K0wyajJkNkJzZCtsdEo3dGF6aGJ4djJzbnRsajJOdnlwM1pyL096?=
 =?utf-8?B?djlDTHlRSG5LK1lNWEVCUFA5clNiU2djNDBSRmU3SmdGVS9mZlhMRzRLYWRK?=
 =?utf-8?B?a3JBWGFHb25CVmhHVXFHQWQxS0JmeThmQ0d1dE1VTnlrQVVNNHRRdi9WTlJS?=
 =?utf-8?B?bW52aXpGR3pWOGZtbFV2dXFDOFZwVmxISlQrQlpnYlFIclZOeHBYR3czaFY3?=
 =?utf-8?B?eFAvanJOQWtEQng5ZnhNd09pSnpvZmlVSEZWaTNqOGk0eEVWanlGeVU0Rzl5?=
 =?utf-8?B?dVV0R3htTXlTTWt1SVJHY0ZMN091UTRjYlFhVEhROEV5Q0tVQUNocWVGQ0Jw?=
 =?utf-8?B?Ukp5emxqQlh4Q1E3aVpScStuell2NXFmZnpOc3NJNDlnbU9CSFo5SCtDRVAy?=
 =?utf-8?B?RzFHbWlvRlNIYkFQcVBLUVI1VVArcTFHcjVqSUl5RGdROE0rUGJIdkNkZ241?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35576311-ec4c-4bdc-e0a3-08dd46dee37a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 18:48:47.1271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWDAY6olI9GOc7i58FDAnsgdMyDvbfvIVdUE2O6+BMEMYXaW0Wlm0kQ/rV0nQXjB7NRG5EIaZTGmeqQEOlrVpuvfrokmKVKME7Fy4bW6J90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6754
X-OriginatorOrg: intel.com

Hi Babu,

On 1/22/25 12:20 PM, Babu Moger wrote:
> When mbm_cntr_assign mode is enabled, users can designate which of the MBM
> events in the CTRL_MON or MON groups should have counters assigned.
> 
> Provide an interface for assigning MBM events by writing to the file:
> /sys/fs/resctrl/info/L3_MON/mbm_assign_control. Using this interface,
> events can be assigned or unassigned as needed.
> 
> Format is similar to the list format with addition of opcode for the
> assignment operation.
>  "<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"
> 
> Format for specific type of groups:
> 
>  * Default CTRL_MON group:
>          "//<domain_id><opcode><flags>"
> 
>  * Non-default CTRL_MON group:
>          "<CTRL_MON group>//<domain_id><opcode><flags>"
> 
>  * Child MON group of default CTRL_MON group:
>          "/<MON group>/<domain_id><opcode><flags>"
> 
>  * Child MON group of non-default CTRL_MON group:
>          "<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"
> 
> Domain_id '*' will apply the flags on all the domains.
> 
> Opcode can be one of the following:
> 
>  = Update the assignment to match the flags
>  + Assign a new MBM event without impacting existing assignments.
>  - Unassign a MBM event from currently assigned events.
> 
> Assignment flags can be one of the following:
>  t  MBM total event
>  l  MBM local event
>  tl Both total and local MBM events
>  _  None of the MBM events. Valid only with '=' opcode. This flag cannot
>     be combined with other flags.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v11: Fixed the static check warning with initializing dom_id in resctrl_process_flags().
> 
> v10: Fixed the issue with finding the domain in multiple iterations.
>      Printed error message with domain information when assign fails.
>      Changed the variables to unsigned for processing assign state.
>      Taken care of few format corrections.
> 
> v9: Fixed handling special case '//0=' and '//".
>     Removed extra strstr() call.
>     Added generic failure text when assignment operation fails.
>     Corrected user documentation format texts.
> 
> v8: Moved unassign as the first action during the assign modification.
>     Assign none "_" takes priority. Cannot be mixed with other flags.
>     Updated the documentation and .rst file format. htmldoc looks ok.
> 
> v7: Simplified the parsing (strsep(&token, "//") in rdtgroup_mbm_assign_control_write().
>     Added mutex lock in rdtgroup_mbm_assign_control_write() while processing.
>     Renamed rdtgroup_find_grp to rdtgroup_find_grp_by_name.
>     Fixed rdtgroup_str_to_mon_state to return error for invalid flags.
>     Simplified the calls rdtgroup_assign_cntr by merging few functions earlier.
>     Removed ABMC reference in FS code.
>     Reinette commented about handling the combination of flags like 'lt_' and '_lt'.
>     Not sure if we need to change the behaviour here. Processed them sequencially right now.
>     Users have the liberty to pass the flags. Restricting it might be a problem later.
> 
> v6: Added support assign all if domain id is '*'
>     Fixed the allocation of counter id if it not assigned already.
> 
> v5: Interface name changed from mbm_assign_control to mbm_control.
>     Fixed opcode and flags combination.
>     '=_" is valid.
>     "-_" amd "+_" is not valid.
>     Minor message update.
>     Renamed the function with prefix - rdtgroup_.
>     Corrected few documentation mistakes.
>     Rebase related changes after SNC support.
> 
> v4: Added domain specific assignments. Fixed the opcode parsing.
> 
> v3: New patch.
>     Addresses the feedback to provide the global assignment interface.
> ---
>  Documentation/arch/x86/resctrl.rst     | 116 +++++++++++-
>  arch/x86/kernel/cpu/resctrl/internal.h |  10 +
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 241 ++++++++++++++++++++++++-
>  3 files changed, 365 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 3040e5c4cd76..47e15b48d951 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -356,7 +356,8 @@ with the following files:
>  	 t  MBM total event is assigned.
>  	 l  MBM local event is assigned.
>  	 tl Both MBM total and local events are assigned.
> -	 _  None of the MBM events are assigned.
> +	 _  None of the MBM events are assigned. Only works with opcode '=' for write
> +	    and cannot be combined with other flags.
>  
>  	Examples:
>  	::
> @@ -374,6 +375,119 @@ with the following files:
>  	There are four resctrl groups. All the groups have total and local MBM events
>  	assigned on domain 0 and 1.
>  
> +	Assignment state can be updated by writing to "mbm_assign_control".
> +
> +	Format is similar to the list format with addition of opcode for the
> +	assignment operation.
> +
> +		"<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"
> +
> +	Format for each type of group:
> +
> +        * Default CTRL_MON group:
> +                "//<domain_id><opcode><flags>"
> +
> +        * Non-default CTRL_MON group:
> +                "<CTRL_MON group>//<domain_id><opcode><flags>"
> +
> +        * Child MON group of default CTRL_MON group:
> +                "/<MON group>/<domain_id><opcode><flags>"
> +
> +        * Child MON group of non-default CTRL_MON group:
> +                "<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"
> +
> +	Domain_id '*' will apply the flags to all the domains.
> +
> +	Opcode can be one of the following:
> +	::
> +
> +	 = Update the assignment to match the MBM event.
> +	 + Assign a new MBM event without impacting existing assignments.
> +	 - Unassign a MBM event from currently assigned events.
> +
> +	Examples:
> +	Initial group status:
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
> +	  non_default_ctrl_mon_grp//0=tl;1=tl
> +	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
> +	  //0=tl;1=tl
> +	  /child_default_mon_grp/0=tl;1=tl
> +
> +	To update the default group to assign only total MBM event on domain 0:
> +	::
> +
> +	  # echo "//0=t" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control
> +
> +	Assignment status after the update:
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
> +	  non_default_ctrl_mon_grp//0=tl;1=tl
> +	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
> +	  //0=t;1=tl
> +	  /child_default_mon_grp/0=tl;1=tl
> +
> +	To update the MON group child_default_mon_grp to remove total MBM event on domain 1:
> +	::
> +
> +	  # echo "/child_default_mon_grp/1-t" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control
> +
> +	Assignment status after the update:
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
> +	  non_default_ctrl_mon_grp//0=tl;1=tl
> +	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
> +	  //0=t;1=tl
> +	  /child_default_mon_grp/0=tl;1=l
> +
> +	To update the MON group non_default_ctrl_mon_grp/child_non_default_mon_grp to unassign
> +	both local and total MBM events on domain 1:
> +	::
> +
> +	  # echo "non_default_ctrl_mon_grp/child_non_default_mon_grp/1=_" >
> +			/sys/fs/resctrl/info/L3_MON/mbm_assign_control
> +
> +	Assignment status after the update:
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
> +	  non_default_ctrl_mon_grp//0=tl;1=tl
> +	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=_
> +	  //0=t;1=tl
> +	  /child_default_mon_grp/0=tl;1=l
> +
> +	To update the default group to add a local MBM event domain 0:

"local MBM event domain 0" -> "local MBM event on domain 0"?

Taking a step back to look at the completed "mbm_assign_control" section
it is noteworthy that all this work is about assigning counters to events
but after this large section is complete the word "counter" does not appear
a single time.

The section starts with a brief:
"Reports the resctrl group and monitor status of each group." and then
moves to terms like "assigning events"/"assignment status" without defining
what that means.

Instead of rewriting this, what do you think of adding some definition
of what "assignment state" means to the start of the section. For example,
(I am sure it can be improved):

"Use "mbm_assign_control" to manage monitoring counter assignment to
monitoring events when mbm_cntr_assign_mode is enabled."

Reinette

