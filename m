Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647F618BBB9;
	Wed, 18 Jun 2025 04:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219331; cv=fail; b=WswvoCB6HyPUXCfgYEyaDU//Zp9ZVpm27AEiT21l3qfZaq1+rbqE1+VosoCW6JhD8L11esQU/MLbuAI8LbU9f7YrWiaV/I6eOagUlW4Me2TCycXgYdZ1q0zRR/krkww/AWhi3OMutOtwEQunnFFvxHwVtk08VTqE36S/pmqnq8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219331; c=relaxed/simple;
	bh=kvS+19Da8LpHWyi/EPbZpSLrxW6rHd7SOjPynKlaTBc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I7uCHxjV+o8PmQHTFO0B3RVHeYnJG0NUQ5z0/8EmY7XD18B513UVCPWxpBM3KutKi9NmJfJsroyH8LDx8sq+0BozbYCQcAk02CzxriprAb9qzwSDENGpJ02WQtFkRJXdNYmR2x8kxoBmSMRnopaS5gtYz+FOPwrY5AI0P5+PJJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bx6btm2x; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bx6btm2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750219329; x=1781755329;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kvS+19Da8LpHWyi/EPbZpSLrxW6rHd7SOjPynKlaTBc=;
  b=bx6btm2xwmbTvbg+zgOuY0Mka2aoNGjJy5In+6ih7LtaJC8GyYn+0w2u
   BOmrZrjnf+jtZYhBL1aCsQPquWmssGwQ2QdGYgTOOUPB1eHHYZShhVvvN
   dnoCLMNMBu/AIQiaTBfgXJKWFguMGGjqSFpyrxezD17n7GbGEn9eRbPJx
   K7lw1oCQQvS0cl6TT7x8dFTSrkq5AeeMjTPzj1aISyyUd1vgmufgxw5uc
   rwMZuYkwehkij3NzTUqRYyQ2iWCRQ9siPcWWzBdneTZWEZqggtTfR3aQ2
   X0daxB5W3gGHwyJx79p5D7dTCR47E3G6XK8lXylx2mI7Oj3+FiwfyCHSz
   w==;
X-CSE-ConnectionGUID: 2TINFFU8T5u09L0LEwh+nA==
X-CSE-MsgGUID: NFAEdcU8TEGuu2pQpX6O0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52560544"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52560544"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:02:08 -0700
X-CSE-ConnectionGUID: C7IJacViSbSJSixu2Pt7bQ==
X-CSE-MsgGUID: OOuwSnqoSEa61YsjPYL+gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="154445642"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:02:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 21:02:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 21:02:06 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 21:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYKemb+IXMhmbn5l0XMwH+J7bXna1ELvZPTVU6n1armW/bm1zJziaRdbjDMLeoydL1xGRdu00/KJ48lMGJgoPaFsTe7Daj3BN8fR8t4kbC2MRbvQjzIUywGohtTqFGez1BepjxZfjhANpB4dBINTSwq6xtA6c9TqWLwNETIt82R32ipeN/GOMW5KyOt4iTzpPImf3Af4ESWr6MKwYd0GRYzr8dJvc0A2c8fzgpNWVtIgRdzHltsq8gczFb21P3vi0uqdpbDTA1QK93S6V+51jh/8I8RVCivlcU3IEwIf0FBkbWXBaJheTKne3f4wsDnzxHqxjoyCUA1auVx6D8fCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzEwNI0htUsyn4Dz0wzR3i32fN8iUOMPTTsJQRtB7q4=;
 b=j1fflsH0vw1+tqG+O8MDdN456dMIPD3DVpp9zTlHaWNCvJ2tS8A1eR+Q2sK/E3wj6jDGrwOj7rB9giAN6VpOQ5wOotDqmqkeczj+y8BLOebHPOyEbMa14Hxxz1pjNzaAUB6rEig8FbIA+zVxwXZd/z2/yKObLyCAtkE+7Q914ROMFuvKtVYDw4PiFVqHjKcSohDwqTqYz11eOR0HS8xxxTt8yP/QKxey9RQHzbygVLkyEWxEm08iIo0umUSURjyDPsaNfwttXMV3r77sOAjtGy0TrPCruXfZHd5PTyipE25bhgIhFKxP5daXpOgTNjW6tJAZQXexxhtpPcMKOowIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA4PR11MB9059.namprd11.prod.outlook.com (2603:10b6:208:560::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 04:01:49 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 18 Jun 2025
 04:01:48 +0000
Message-ID: <6870a52c-4594-4ec0-aa56-1bf9e1fadeb0@intel.com>
Date: Tue, 17 Jun 2025 21:01:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] fs/resctrl: Introduce interface to display
 io_alloc CBMs
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1749677012.git.babu.moger@amd.com>
 <16cebf7069e11e07c0d9e343aa72363325befafd.1749677012.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <16cebf7069e11e07c0d9e343aa72363325befafd.1749677012.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::26) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA4PR11MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: ac52a362-a4d9-478e-7fc3-08ddae1cd973
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEJ5YjczN2IvRU9qYU9GVWNZNGZXRVN0cVAyZUxzRGRUZDFYNE0xdnd1OWd3?=
 =?utf-8?B?WmxiZEk5UUVrL2JKZHd0US9hWmJGTUR1aFhhWG9FaWlXdEhGM0NLUFNQSGVw?=
 =?utf-8?B?aG9IU1BKelVPbXM0ZWVhaU44T2xtcjBvRzF0Q3dTS2NHYjBCYWcrcVZWbjc1?=
 =?utf-8?B?Y21lV2pKK1k5ZGNXN0JzNlZvS3c0RlNpYng0WmMyRHI2alB1QmFQU2pFY0Np?=
 =?utf-8?B?S0N1NVB2ZCsxczRRcVhDSWV1RnBacHpNZUJzTmUxMzg4a0ZiL1dxK3lpeUlR?=
 =?utf-8?B?bnBjVXczNXpOb1NpNVJlL2NtWC9lSURNU2VrL0ZoWVJSeElhOXZoWGZXVDF4?=
 =?utf-8?B?MnF2cCtyOEgyRjB0QmQram5oN1lYdVFNWDlmV2JrdGRtMGovU0FpVTV0OWRa?=
 =?utf-8?B?aDFja2xqNjZBOEdMaU9UYTgrUjkyWCtTcVJKOTM1Unhwcm95ZFVaa1Q1RWU5?=
 =?utf-8?B?a3R3N0ZLMnJTU1NMWlZZM0ZiZkt0dXlOaVp2MUUvVDVmMDBOdnRjdm1qR1Bo?=
 =?utf-8?B?R1M3ZTlxdHhuVjZrZFBRNzhjQzByc2w2YTYwU3B4T3p6Ymx0b1pXdmNZWFdy?=
 =?utf-8?B?M0RmQVJoWnUva3FFSzdpeUZUTEVVbzhpTlE0RkxMaitDbDRSNXYySkVNdC9w?=
 =?utf-8?B?cW51RDZwR3g0T3V0WkFBMmFsZWx1M0kxTFdZclZYU3Z6cHNjODRxdlk3RVNv?=
 =?utf-8?B?ZUJRSStwYnZLZUh4MTVqM1NoV2dERjBZazZHZkdnTHVtR2QrUTBkV0tac09p?=
 =?utf-8?B?ek8xV2F6Zk12bmduaG5WQ25jVmNuRmRyMTFwb1hPWEgrZjV3dGxVeXpZZ0R1?=
 =?utf-8?B?c01QTTQ2dkdUWURXNGFsTThnM0FsV1h5Z3JhUUFPdDhXdEtoSXE2NjhPUEpa?=
 =?utf-8?B?VlVYekMxU2Zxdko2RmZOZVNLUEhzc3ErSVJzU3QxcmRTMnBRUmlQWlNIY1lZ?=
 =?utf-8?B?bi9XenJHMEhlR2xyd25ReTM1blY1ZTdVRExPSng4c0lwZk9jakV1OElFZVlW?=
 =?utf-8?B?ZFNvWXVGelJJYnhjUUxMRG82RkhZNGgxRm9rcVBMQzVkYVRFZTJwTDJLWDVk?=
 =?utf-8?B?VDMrVUw5QTFadmhPbXZmN3pLU3BUeUZ3RGZwQnQvbURDS1lPTVloVHVMclk4?=
 =?utf-8?B?bnpqVndwc1hvVytSZEgzc3B3Ykp0ellnUi9pZnVSQUIrUUNGNktVRGNJWGg5?=
 =?utf-8?B?WS9YWlhyZUE3TzVTdEV1K2NIbWVaMVlQV2w0WFlkcWpGN3B2cjRkU1Z1R3di?=
 =?utf-8?B?TzkzVExwNHFrano5d0dPOHkrT2JXbWVya0ZaMHprQ1loY0hyYVFuSFRrU0o5?=
 =?utf-8?B?NnlGSzNkWHJoYzJ1MVgxajBOVXF3TjlJalVBR0R2TUphQmFNZzB5cm5rWEtr?=
 =?utf-8?B?dFkxOVNESGQ3NGxYVHNkVlU5ci9yblJpRjY1NGRSd2Mzby9QQ2hjOFh1SW05?=
 =?utf-8?B?NXVrYnFsMmJFQ1lLUzB4NExHajhOWG5SWllGM1N2MHlZZHliNU9qY1pkM3VT?=
 =?utf-8?B?Y0MrMzV0V0g1ZzhxZ3JZa3Z0ckRyNUlsQ3UySWlEdU9tRGRuZDNqV2tScDd2?=
 =?utf-8?B?Y0R1VVIrT3c0SVhKZHBVRUc2RkZPdUZIUjBkOWw5SU1UbTl1aEtHM3Y2QXo5?=
 =?utf-8?B?MmhIR21OMkd6U3lVOUNDdmFyK0MzZm92NDJQMzVqMlJaL3lybThiQU1EMm5p?=
 =?utf-8?B?MlJSNjBnaXZlT1VsOGpjRXdYY0JoTjdWbk5DakthR1plOXlhTCtrZ09CQjdr?=
 =?utf-8?B?Mjg0Y1lqaUlDeFVQcGVaT01WcXUrdkpRM0VBb2tBWmptN1R2ZFRwbjZ1YlM4?=
 =?utf-8?B?UVV1dFVIK2pQOGk3aTFYQ0Z1K3NwSXBzaUV0RFV5SmtEdEtzNlZzbC9pNU9F?=
 =?utf-8?B?OXg5M3FYMjdGazl0VmFSdG0zRmE3eWNCZG45SWVJRjlRQjlraTU3Ti8wM1U2?=
 =?utf-8?Q?lctK/2pFSaY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGlkQTNOSFgyRzVmbmhDekRUNmYvdTUrT2xzTEJsUVYrNHBHRkJ4NXByN2kr?=
 =?utf-8?B?WjNsSUxCbmhmNXJFUktVd0poV3o5VXMzSnJhSGkzcXBYTGFsVE9FZWZBTXJW?=
 =?utf-8?B?VEFQRm5vYUdZWUd1dEQzODluUkxtM2szQ1Z2U1Bia290cmxQbEZxTjBrWmtT?=
 =?utf-8?B?WDRoYkRiTnBUWXFaK2JBNjFac1lMNVdIMjlRZ2pTd0hzMVI0MncrTCtXQzVs?=
 =?utf-8?B?YnNVczJ5QnptZ25zZ2E4OGY0MU8yeEFyb0tpMEQxQkhvc3Vvd2Q5cCtpdzZG?=
 =?utf-8?B?M0VYQnpQc0daVHhKKzhLUVBoTjdia3RtRUZUbkpJZnRIOVRpelJPUHhaZDZQ?=
 =?utf-8?B?djNHTjlId3h3VGRUVjJQSWROODlUYmtmZXl1OEVTUjhtK2hEQm5jeGhBa25j?=
 =?utf-8?B?NDFhZzlkc3IrVTFTaVpRNklGYzBNU3FXaVdaMFhZY0l2N3AyVjZzSE9jOEhX?=
 =?utf-8?B?Sm5yWThVbjNGM05pTnZ0N1dDRU55QlBvT0owN1YreWxWVWxVY3V3U3dmNFhL?=
 =?utf-8?B?cVVSOFJwbWxiNFJTcWxmeWM4L2hlRlU1UVQwaFVjc004QnJjQVRld0xlUTdD?=
 =?utf-8?B?SUFFVWQzWEZOZFBQSVhjbUJaVy92aFZGc2hnVjRWb3NqWDBVQzJMcTQyQ0ps?=
 =?utf-8?B?T1AybGttKzAzWVV3dEd5QUVzbkxKMmx1azgrQXRPUVpyOFQ5QkRrNjJSWlR0?=
 =?utf-8?B?YzdOVm54TjdMT1R5VzhRalhXQjd3Vkx2Z3c0ZkVWeXVIbjh5dFdScHJ3aWNQ?=
 =?utf-8?B?T3REOUJQOGVTSkkwczloNUpkTUNEZ0JWUW43Q1A2dllKOFF0OHdHNjBBMkRt?=
 =?utf-8?B?V3FZMHNNU25YVC9FVXFLSGQza2Y4TmJvMHhaeFhFMmprK3ozZ0g1TEVFRU45?=
 =?utf-8?B?Q3E2WUozT0s5U04xaGhFcTlFTW5iOVltQUd0OHBiV0sxbmxyblYwK1EyOTBV?=
 =?utf-8?B?TTJDRGJiZ3ptRUExU2IzRVk3YUI1VTFWV0JCUGlyR2U1eEpoK2V3ZUFhcWth?=
 =?utf-8?B?eE9DWkVhUEVVUVVrbFdycmZMdUVWRzdYQ1VXbVF0SHlmd3lwT3U5M3gwUzht?=
 =?utf-8?B?WGlSeU9UdmN6OHFDZEJGai8zU3pXbmpxWlNldVhlZW9QZDZEUzJaUVNaWW5F?=
 =?utf-8?B?cXJvMVJwVWVXU1ZRNzFKcUwxYVJaazl3OG9uZjlBWXcvYUF4dFlaV1RWQ1Jz?=
 =?utf-8?B?bVoySUk2d2FHbU0zYW5aZkczeXlDb3RZTUpYckMrRGYzSUVCN3I5V2tFRFVw?=
 =?utf-8?B?V013ajllT0NUV3FFOUdEV0MySDM1ZC83MC9kZk8raW1ta3NTUGJ1QVl0YU9J?=
 =?utf-8?B?cnpJVnZ6ZGQrZWlyQ3lmbkFrM05CSXZyOGp4VVByaEh3S1FZa3FMNllFS2o2?=
 =?utf-8?B?ODlZZkd6emNQYlk3bGFXUldtUXJLNmNRc1pBUEZWY3ZHR2lhekNxaXA4Z093?=
 =?utf-8?B?b3FVd3dqRzU3TlBReEdPak9RNFNqYTJpMFdTZjh3cERDYnZJV090YU5sZ2ZY?=
 =?utf-8?B?VFFDQXhlYVliM3NXM3EvWkYvZE5ZVU1yemJpSzFwbkhMVDlicERWbE1EOWN3?=
 =?utf-8?B?clhSYko4NWJsQVhOZE81MXJ3YXJOS0tIUEd3VXFpdzNaYk1Wd2Z1TGtybXFJ?=
 =?utf-8?B?UkNyc0ZLclBCaUNGYTZ6QnhPaWJQU3I4Z0g2ZlJhMExGeStEczFUZGxhdWRH?=
 =?utf-8?B?MGNBVWdrRU42cmo5cWJzaFAvUkd1QmRINXFOdVhQZHhKRXVNckFlMDVjM2s2?=
 =?utf-8?B?NkRlZjA1M3o3YkRFdy9ZOHpEczk4TlVCSU1yQkxBZW1hUmwzOVZGWkRneDhh?=
 =?utf-8?B?anBQd0MrSFBoY3RYK1c1T2svQ1FiNjVnSE84NEc5M0pJNE41Uy9uVy9nRDJK?=
 =?utf-8?B?Q1V3ZmFSWTNrUTlRSHZ2bjBlTzN3MnVySm5qVjZWdmp3ejEzc2d6aVpoMHpT?=
 =?utf-8?B?TnpNek1XeC9TN1hoQU9IV09vQ1JuazhVRVhPNnJrQVF4Yk43cXJwaXFNYW0w?=
 =?utf-8?B?Mm1pWVFNWENKQUg3cHFSazRKL1JCVjJUMkFBU0NXQjEyclBQVU9qRG1OR1NS?=
 =?utf-8?B?aVVKcUNhWmRHUzlSanIwMFFLRzZkMmpSSU1OclFpRytQemhBNzNWc0x6bGtS?=
 =?utf-8?B?bWNVdDEvcXhUN2xVZUloNnU4M0JGS1ZyQWZVME16Um1JT2t6eUJZTmFqTUNJ?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac52a362-a4d9-478e-7fc3-08ddae1cd973
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 04:01:48.8666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Do1D7yM7mzexVSOiPW6r2c6FfJcrDgIo4vhVi63J0l/ZhDtjJGVf1LFvV04cLbcanwRzzURvigZ3jfXXG/9wsDs5Jan+kRxYiUAVHZY1FA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9059
X-OriginatorOrg: intel.com

Hi Babu,

On 6/11/25 2:23 PM, Babu Moger wrote:
> The io_alloc feature in resctrl enables system software to configure
> the portion of the L3 cache allocated for I/O traffic.

Drop L3?

> 
> Add the interface to display CBMs (Capacity Bit Mask) of io_alloc
> feature.

After the fs/arch split it is not always obvious what is meant with
"interface" ... it could be new API between fs and arch or it could be
new resctrl file.
This can be specific:
	Add "io_alloc_cbm" resctrl file to display ...

> 
> The CBM interface file io_alloc_cbm will reside in the info directory
> (e.g., /sys/fs/resctrl/info/L3/). Displaying the resource name is not
> necessary. Pass the resource name to show_doms() and print it only if
> the name is valid. For io_alloc, pass NULL to suppress printing the
> resource name.
> 
> When CDP is enabled, io_alloc routes traffic using the highest CLOSID
> associated with an L3CODE resource. However, CBMs can be accessed via
> either L3CODE or L3DATA resources.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  Documentation/filesystems/resctrl.rst | 13 +++++++
>  fs/resctrl/ctrlmondata.c              |  8 +++--
>  fs/resctrl/internal.h                 |  2 ++
>  fs/resctrl/rdtgroup.c                 | 51 ++++++++++++++++++++++++++-
>  4 files changed, 70 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 03c829b2c276..b31748ec8c61 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -169,6 +169,19 @@ related to allocation:
>  		When CDP is enabled, io_alloc routes I/O traffic using the highest
>  		CLOSID allocated for the instruction cache (L3CODE).
>  
> +"io_alloc_cbm":
> +		Capacity Bit Masks (CBMs) available to supported IO devices which
> +		can directly insert cache lines in L3 which can help to reduce the

"CBMs that describe the portions of cache instances to which I/O traffic               
from supported IO devices are routed."

Please check ...  there seems to be some inconsistency in "IO" vs "I/O" use.

Also consider something like,
"When CDP is enabled "io_alloc_cbm" associated with the DATA 
 and CODE resources may reflect the same values. For example, values read from
 and written to /sys/fs/resctrl/info/L3DATA/io_alloc_cbm may be reflected by
 /sys/fs/resctrl/info/L3CODE/io_alloc_cbm and vice versa."
What do you think?

> +		latency. CBMs are displayed in the following format:
> +
> +			<cache_id0>=<cbm>;<cache_id1>=<cbm>;...
> +
> +		Example::
> +
> +			# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
> +			0=ffff;1=ffff
> +
> +
>  Memory bandwidth(MB) subdirectory contains the following files
>  with respect to allocation:
>  
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index 6ed2dfd4dbbd..ea039852569a 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -381,7 +381,8 @@ ssize_t rdtgroup_schemata_write(struct kernfs_open_file *of,
>  	return ret ?: nbytes;
>  }
>  
> -static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid)
> +void show_doms(struct seq_file *s, struct resctrl_schema *schema, char *resource_name,
> +	       int closid)
>  {
>  	struct rdt_resource *r = schema->res;
>  	struct rdt_ctrl_domain *dom;
> @@ -391,7 +392,8 @@ static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int clo
>  	/* Walking r->domains, ensure it can't race with cpuhp */
>  	lockdep_assert_cpus_held();
>  
> -	seq_printf(s, "%*s:", max_name_width, schema->name);
> +	if (resource_name)
> +		seq_printf(s, "%*s:", max_name_width, resource_name);
>  	list_for_each_entry(dom, &r->ctrl_domains, hdr.list) {
>  		if (sep)
>  			seq_puts(s, ";");
> @@ -437,7 +439,7 @@ int rdtgroup_schemata_show(struct kernfs_open_file *of,
>  			closid = rdtgrp->closid;
>  			list_for_each_entry(schema, &resctrl_schema_all, list) {
>  				if (closid < schema->num_closid)
> -					show_doms(s, schema, closid);
> +					show_doms(s, schema, schema->name, closid);
>  			}
>  		}
>  	} else {
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 9a8cf6f11151..14f3697c1187 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -374,6 +374,8 @@ void rdt_staged_configs_clear(void);
>  bool closid_allocated(unsigned int closid);
>  
>  int resctrl_find_cleanest_closid(void);
> +void show_doms(struct seq_file *s, struct resctrl_schema *schema,
> +	       char *name, int closid);
>  
>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index bbc032b4d0e9..0c2d2cf4baa1 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1997,6 +1997,46 @@ static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
>  	return ret ?: nbytes;
>  }
>  
> +static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
> +				     struct seq_file *seq, void *v)
> +{
> +	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
> +	struct rdt_resource *r = s->res;
> +	u32 io_alloc_closid;
> +	int ret = 0;
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	rdt_last_cmd_clear();
> +
> +	if (!r->cache.io_alloc_capable) {
> +		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
> +		ret = -ENODEV;
> +		goto cbm_show_out;

out_unlock

> +	}
> +
> +	if (!resctrl_arch_get_io_alloc_enabled(r)) {
> +		rdt_last_cmd_puts("io_alloc feature is not enabled\n");
> +		ret = -EINVAL;
> +		goto cbm_show_out;
> +	}
> +
> +	io_alloc_closid = resctrl_io_alloc_closid_get(r);
> +	if (io_alloc_closid < 0) {

Another example where io_alloc_closid must be valid thanks to earlier resctrl_arch_get_io_alloc_enabled(r).

> +		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
> +		ret = -EINVAL;
> +		goto cbm_show_out;
> +	}
> +
> +	show_doms(seq, resctrl_schema_io_alloc(s), NULL, io_alloc_closid);
> +
> +cbm_show_out:

out_unlock ... to match rest of resctrl

> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +	return ret;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{

Reinette
