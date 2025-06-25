Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF200170826;
	Wed, 25 Jun 2025 03:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750822728; cv=fail; b=YZQ1E3IKnYRxh0zwuj9+UfB5Pg+PeODBt8Uh+9IGsN0YBhiXNkg/EERB3vGDa6iG9CUAZ47ILyE4d4bdydEbeiBJRfwjUo2sdUJQIDkkYavUMsJyJRarBGM6hZ/QntKxxa68UMjhx0YnBAPKoYvBfAcxJKd+XzCEucYv2slrav8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750822728; c=relaxed/simple;
	bh=JKBYu73L1dJqij6PKgxe+l65vX6GC6gwScqdXtkLcsE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ii3GqSMeueX7p9CAOMWFpM4TgI7j/r30CNFf/hqA+X6p9P1MyDb922lW5r9uOSVBE0TcbR8WjoKVpn/+BdIT3U06t1rtUoDedynA7gx1zIJVCi8tjRyRqoF/CmGo4TxUQCFaXOjKSmfUrx4FXvx3DYVa6+RYbrvNJmf26p187rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYM/80n8; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYM/80n8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750822727; x=1782358727;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JKBYu73L1dJqij6PKgxe+l65vX6GC6gwScqdXtkLcsE=;
  b=CYM/80n8VvqTCz0Ygs55ODZVA0HUZbMhrmozZ+Ho8n/otmiKZS2ML4Xb
   EnG4JzdHED+WE2pZPQnFp+cEgOaO7003sF0bCvnbO6bAqtAo0xZlLkuNe
   UsYbbBxW4lTwvMTkvvHkaK++1FOoG3JzMZfcznPkRMc7JbgcPL5I7ES8m
   KNr2cOoVbKwAyVmX6/Ip0zcz8+3PMDK6WAHa86ME6x6sGHw3q3LVDiGAU
   kFwhHEmAjidD3dhpaNebOiPybDYI21Q0TPrO3XINabYzIkenhMuzgW/dr
   8mv/2fvixWb5Qc0Pax3X0krKpS/LMQlVZIqNSdZ3z5LdyEq/IJfTXr2hI
   A==;
X-CSE-ConnectionGUID: de8pD0TfQWeAZnUOUkZE2w==
X-CSE-MsgGUID: Jwlpx/LjQPydIRnafBg6Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63768575"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="63768575"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 20:38:46 -0700
X-CSE-ConnectionGUID: ZpsZ63cYStugT20YmoOCNg==
X-CSE-MsgGUID: jZZNPb5zRoyGtlTfD7C9Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="156127413"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 20:38:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 20:38:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 20:38:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 20:38:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKw5Je7JuvyMYKajTd01QvKcw3kgMnMmRSFmQD/y3IRhhi0mTr7X0TRGbOA/OP2tx3qvFoILl68rmOHg22rjWWuN2ErwqpVHxKYhxfEqAgptaAsf2euzGlM2utSViayeyHIDmJKHN9q4NbO/fkBj5uwn37CxvPMRQ3YUBW1lbFSfIKyXrUEd5PMONBFDJgrQgf1iRabOrbKkInKBGXkGevKHB/inZe5Jtt7cEx9fgVhaw9gjj0V4QbdNvbxskzE/vQ4GK98TqNAjOSa7zieaAupt1pIgFtmf+FBTifyylZaY4Z8i5CxOzxWGj/s3Ljtx55DisDHEVvnitEvnW+esTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AYQGkx7vRwIqjdHZQ5GYVzo+5Z7pOcGzy2lTAT8OX8=;
 b=Nr0AnQnObnUQ9s40rjO3bCLJNDcp4G5VIUHBq2ouwWqUEFMuA1fzBJFXSuSu3jUCuUj7XRzLz8ZnOLmgiqXNxK7/hWeRx/4W759c+AM/G5rgJwDOHz4WGdq0PIlT1kCEvqdI47Ujhc8aKkbSt/XOpHmmFa1VDclLAd9IWWr/B1vxsdSb1LbzwNKgguuA08lSa1mMDaKD9ss/NUMDfEv75AWXadpUAGLAJ/zHKgu1FsquJTBx/kzjRb6LZLBrDAbxxNHsAZa9CEB16diCnqCZFi2x8qCirgwpSgZYrNC2h6vRTl26cCPX1xA/RgK3nrY+i1fNF06Pf82ECklIadYEZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA2PR11MB5212.namprd11.prod.outlook.com (2603:10b6:806:114::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 03:38:39 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 03:38:38 +0000
Message-ID: <96297efd-0f65-4dde-9720-36dd9b689295@intel.com>
Date: Tue, 24 Jun 2025 20:38:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 19/32] fs/resctrl: Add the functionality to unassign
 MBM events
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <83d54b00cc873d7d4dec433b7f528da10963d025.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <83d54b00cc873d7d4dec433b7f528da10963d025.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0294.namprd04.prod.outlook.com
 (2603:10b6:303:89::29) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA2PR11MB5212:EE_
X-MS-Office365-Filtering-Correlation-Id: d82dafe8-48e7-4061-c975-08ddb399c5cf
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm4ydHh4eFpOV2M2d1VHZ0JvcUlpMFVPeTlsKzNIaEVLS01xbzg1eFRqVG4z?=
 =?utf-8?B?dnJXVUcySEtRZnFvNXZndU5wbmRPcm1rbmZyVDc2ZGlmSkZ5eGhhUEtJTUpI?=
 =?utf-8?B?aXNFb1pxSTFCbGNlaDJHUlhWWFZyVEtCVHliZEMwa0RVSzhKNitqTkc1N0c3?=
 =?utf-8?B?Vms1UzYxYmNKVkQ5d1hVVFBsUnU1ZERBUGprYmFjMFAzRHdLeERZZ0o3bEFI?=
 =?utf-8?B?ZjM5ekFsYjlxRFFsUW01V255ZWRyNUEvelNST2o0MXM1a252bXB1d21RMFJI?=
 =?utf-8?B?a2cvZmJwM3ExcXBlOU1KTjJ6NkxPOENCR3hsVmhBZXJGdjZYVEZWU2ZQeHVX?=
 =?utf-8?B?bzlRbVdwaG5kMnJrbVNrOWJNVUtjb0xGeXFOZzI0TWlxajVYVUxUVGVUcFZS?=
 =?utf-8?B?NVZaMmxIaFJaZndiVEJQbDJzWGRkeXJKMjNGNTdqcFB0MkhYZjZMWXRKNXQy?=
 =?utf-8?B?cjBjVTNjRzZhUjhNL1laNkxGZ3JVUnBHeFluUFRnWTM4RUFFdDN6eDdzOHl0?=
 =?utf-8?B?K1N6dXlTMWZCZS9vUEN3T2JTOVJvS0hRRnF4VTRZV3BJUHBFWXEyY0FPVnND?=
 =?utf-8?B?VHZ0UkNzU2ZxRWlTQVJSRFBlckh0MmMyTk1PR0dFZnZ2VHRWYTdlWnFITndh?=
 =?utf-8?B?QXJYZ1VkUnltOTdzUDFMU2Q5aFFQTmk1WnAzdWxjbm1YODdNZko0dWI4MFpD?=
 =?utf-8?B?Z2o4TkwxMHJWamVhbDJTeEYwVnRUZkpqdlRkVTAzZkVyMjNMT0lMTk5LUy82?=
 =?utf-8?B?NUZ0by8wbW5GZjdNMktvZ3Y5VXYrdENvcFlQK1JwN09vbjNjRUwyVytNMFFq?=
 =?utf-8?B?UU9FT25WVmUvTGJ1WTNvb0tva0FvUGVIT3JGejNRcVVvVkFnL1QyeUNkVUI2?=
 =?utf-8?B?Q21ZS01HUWI3NnhRVDIvaFJRcFQvSFBXVEU4QmMxVVRrV2dTbjBiQnBCb1or?=
 =?utf-8?B?cll2cDhIVHIzb1dxZ2VGMUhML29KOThzZWV6bHZ1dzBuNU1uRDMvc0Mwck9s?=
 =?utf-8?B?MFRyK1NneitMaTZtcmZ5WUpGSGp5L1VwRDNYd1pQY05LTStld0szSFNPN21a?=
 =?utf-8?B?Y0hxUUZkUXJNSGhxUERLcVlOWXZBd0hjZFpQWUVEZFEwY1p6b3ZYcnViMzlH?=
 =?utf-8?B?bjJKNnF0cnY3K0xLZXJCdEp5NHFjdGtXaVRBandBSjJXdHZ6dGJuaVRQL2Jz?=
 =?utf-8?B?dHRmUHRWTGdZNkllR0hvcUlnS0g0UmxzMTg5L05OeVF2SWRoSGNsTzI1M1Zi?=
 =?utf-8?B?VFp0MTNBelNsSWtEd08zYzJxbU55d2d4T0FqMzRTUC9BZHorMlZBUU5xaEdu?=
 =?utf-8?B?cXVaNzlQMEFhSnowaUQ3cVduREM5REVnMzlacVl4UnBLa0VadEtubng5Sk5X?=
 =?utf-8?B?bUhlRUViS1pKWHJ1K2xBbzFxZkFPYXZWb0dyQkRScEtmcWN4QW55cHNGQUpB?=
 =?utf-8?B?VkJsOGdTN0Z0R3dkNk1WZ2g0SUE1aUpmYWJ1YzE3VEFFd2FUSDB3NGtCdVBQ?=
 =?utf-8?B?aEF1TFJhTnN5TjdjczV2eVpFdWRXbGlxS1Q1VVVFWmw0Z0VtVElSTi95aHNn?=
 =?utf-8?B?ZDVXeG9kK0pVL0RSd2g1enJhbldmRjEzbGZaMVNwY0kvWnVWeklMRFZpUkN3?=
 =?utf-8?B?M2oxZkFDTVpZU1kvNndkdGFhMThjWlhTL20zNXc4UndhaEZ4WUZxTHJaZE9u?=
 =?utf-8?B?d1JHMk1vREJmNzFHbVcxczI3VzlqcVhrVk9XTGJwWVBkMWpTd2pzRG0wWDRW?=
 =?utf-8?B?SGwwY2ZkYnV3MTFHQ2h3RGJpT09lVEplMlBDSlI0QUNqSmR1M1oxdi9YOXEz?=
 =?utf-8?B?N3JCYlhHdDRuWkNGZ0NCZjNIa21mT2dPY1MwWnZNOWIyb3hYVitPNGM3ek1Z?=
 =?utf-8?B?bldRWEJxN0I5WlZUY05SQkVQUDBOS1BzOVRCVHgvMk5uMDc4V0pHSmpaa0J1?=
 =?utf-8?Q?6B5EU92VqJs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXg1ZVBzdXhkTlExOHRyejIvSjdDdm8zYWwwV2d2WjlkeXU4bHNRY3FhTUFV?=
 =?utf-8?B?MFdJckl5SzU2QU1oRUY3L3dReTJVWDBUNHNlWFNXOFQ0WndzdmZqMUg5VEt1?=
 =?utf-8?B?cUNCOXNYVXRJS2k4SG92WjNHN3J1Vk5CMTBxY0VlejhnS1Q4YUtGeFV4bzlK?=
 =?utf-8?B?emlBdnQrZlQ5aHByck1pYUxhSUk2RFhmK0dVNktONi9QRHkyT1EyK0J0cU1v?=
 =?utf-8?B?YmxHdmJqaGJpMFo1YVFNZWxFbHRnbzdraHFWanQzenhXYjEzdnhrYkYzaThU?=
 =?utf-8?B?UGxZd2pURWsrWGgrN1o2dzV4NHVoK2h6Qkp3L2F3aHRZbVFpeDRrY3JIQWJx?=
 =?utf-8?B?NStwNm5LMEtqbkhwdThhQUtzbEpXVnRCN2lyV2kwNnZLMzVDSlZ2RU1ILzhx?=
 =?utf-8?B?TTlIUmlaQjNaNEJkcXF0cDRialpIT3BGS0ZmdmZNdFJQNkRPNXNUOTJzckJu?=
 =?utf-8?B?WHRIaXhCc0hSOWtDTFIzeDZ0cDExcDJTM0g4V3ZhT1pGM3RlLy9iTWhiQTFW?=
 =?utf-8?B?ZDh6NXFzK3FBZ05LTmNwbElCeVpRZU1FWjl0OWVrMTNlbktrVEFURjRGOEN4?=
 =?utf-8?B?NnBZWVJyL0hSa2wvN3dHams0MWxCVDlCL2o1L1lTdENNKzVES2dnVzgvRmE5?=
 =?utf-8?B?cjJncTdSM0gxd1lleUhqQTNvY0VBQnZLTU5tOVZQSEpYQW5HeTU2SEhTUUI1?=
 =?utf-8?B?R211ZHBMK05tNnQrd0V5ZE5vUC9OV1Y4YndpRUQrUkdCUjVuMXNuUStPc1lO?=
 =?utf-8?B?WWRSTzFHN0ltOFpoK3BLZzhodU9Ub0lreEpkN3l0d2hnVGdRbkhVY2t3NjhM?=
 =?utf-8?B?OFBTWmJvWjRjeEVWanpCUkJvTS9OdXRGSVhvdWQ0NmJPanBicWlvZHFGc0xO?=
 =?utf-8?B?LzBNcUx1S3ZMVEc2czExcnZFeWZjOHNEMmRuTit0TmUzbGFpYUxzd3hzS0Jw?=
 =?utf-8?B?dEFkTytMV29FbC94SU56ZllQZXBvR2FJTTBzYVRxUDFFVi82d1hJcWcrOEha?=
 =?utf-8?B?ckNQQkpXWU5Fd0puZnFwbHJKaklOWEFqWDQ4MURKTHR4Tk00NXQwTi9vd1dw?=
 =?utf-8?B?TVFkemFpWWs2Wk81Y29YNGhCcWJwenhuaDVpNGM0aE9nT1JnS2NTRFkzSCsx?=
 =?utf-8?B?ZThBK2pWbTJuV3ZwbHNBYTNUWWhOU1UzdHc2SHdKQmhQSzluVnFnQ1dubkQ1?=
 =?utf-8?B?Z1duYXYyQVNUZmZ4YlFYYW9ybWdqSXg4dnE1Y0pzVE03SFlzd0w3aFlwMG5Y?=
 =?utf-8?B?cVpTOHVLWmxKYU53TE5NVTREazVMQitqN0krMm1qY3p1RVA5UDJ1QS9iNHEr?=
 =?utf-8?B?NGZ5VDE2MUN3cTBaU1B4RCtxTDdiZVdCMjhLTnVsQWFnaGQ4dFM5amhVeTR5?=
 =?utf-8?B?ZGNUVXYyZmc3dVVPQkd1Qnp5c2dsdEpKcGtPSCtEeDZCMUNVTUZIZzdQaHV5?=
 =?utf-8?B?UVJrUGY2SnNkQzRVQzZSN1pyU0pYY1NleldTd1BrTmI4b0NBUlpEREI5c1lT?=
 =?utf-8?B?UThiWFhVOWJkT3FrZ1pTcTlzZTlkZWZMQXorbzNZdWh3WUJkZU9hcUlSK2VR?=
 =?utf-8?B?dG40QjcxYjVNK0x2cXRlT1ljL1AvdW5tQ1ZKeXcrdW9ZcE5OVEc1N2tmTUNk?=
 =?utf-8?B?K3o2bGxLeFJXQVpSZWx3VnF2OEJubnNNNWdXQ04zNytMWEZ0Y04rekFuckpT?=
 =?utf-8?B?OHBsUlBqZ3drSE4xZU5WL0Rjd1pVRGV2M3VFWWxPdmg1MitZYjZBYitTN3M2?=
 =?utf-8?B?UGZpcnhxK0dreWZHTHpaTUM1WVVmL2o0WEpvQXFIcDNhYkJZWWdTT1JwNEFa?=
 =?utf-8?B?R2dQZ0NBdnBITjI4T3dTTFlpTWxaMm5NQlYzVlVuMWVmRjdhWWNXc2cyZk55?=
 =?utf-8?B?amJocnJNdTkvM3pFSjlPbUkvb1JaRXI3dlNOMDVhMjdWNjJ6aTNsWGFTaHJT?=
 =?utf-8?B?L0ZydkZJbDdKUHd1N05TY1E4aWhUWC9YVXh4MzZzWjlTV0NXZVRYQlJ5clFQ?=
 =?utf-8?B?OG80UFFiNnBxNEYvbk1rTHdyY2FaM1dONkhyNzBLQ0RlQ3gzRWZZeXhwdzR5?=
 =?utf-8?B?ZCtaNmI3QXp0NlZKQ2I1K1VoL3NVNGR5bHBZOUN4QW1MZXFjUnk0WnNmM3Jr?=
 =?utf-8?B?NEV4RSt1Ymp3aElVT2RhODBCZzJTWkFlOUJJa0RnZ0o3NDdqd0I4NktKZGpO?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d82dafe8-48e7-4061-c975-08ddb399c5cf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 03:38:38.7829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WTlpHAS2LTpLdLZyRJ4i+kYKZpd0PP6R+e6noFqAQNQzmOK+gcvL4e/t0X2efHDjgu6T8yXM0hVWXV/MsP3ed5rf6RA0J6bXS3LUg49X7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5212
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> The "mbm_event" mode offers "num_mbm_cntrs" number of counters that can be

"The "mbm_event" mode" -> "The "mbm_event" counter assignment mode"?

> assigned to RMID, event pairs and monitor bandwidth usage as long as it is
> assigned. If all the counters are in use, the kernel logs the error message
> "Unable to allocate counter in domain" in
> /sys/fs/resctrl/info/last_cmd_status when a new assignment is requested.
> 
> To make space for a new assignment, users must unassign an already
> assigned counter and retry the assignment again.
> 
> Add the functionality to unassign and free the counters in the domain.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
...

> ---
>  fs/resctrl/internal.h |  2 ++
>  fs/resctrl/monitor.c  | 47 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 0767a1c46f26..4496c359ac22 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -388,6 +388,8 @@ int resctrl_find_cleanest_closid(void);
>  
>  int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>  			      struct rdtgroup *rdtgrp, struct mon_evt *mevt);
> +void resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				 struct rdtgroup *rdtgrp, struct mon_evt *mevt);
>  
>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 38800fe45931..f2636aea6545 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -1016,6 +1016,14 @@ static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
>  	return -ENOSPC;
>  }
>  
> +/**
> + * mbm_cntr_free() - Clear the counter ID configuration details in the domain @d.
> + */
> +static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
> +{
> +	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));

sizeof(struct mbm_cntr_cfg) -> sizeof(*d->cntr_cfg[0])

> +}
> +
>  /**
>   * resctrl_alloc_config_cntr() - Allocate a counter ID and configure it for the
>   * event pointed to by @mevt and the resctrl group @rdtgrp within the domain @d.
> @@ -1084,3 +1092,42 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>  
>  	return ret;
>  }
> +
> +/**
> + * resctrl_free_config_cntr() - Unassign and reset the counter ID configuration
> + * for the event pointed to by @mevt within the domain @d and resctrl group @rdtgrp.
> + */
> +static void resctrl_free_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				     struct rdtgroup *rdtgrp, struct mon_evt *mevt)
> +{
> +	int cntr_id;
> +
> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
> +
> +	/* If there is no cntr_id assigned, nothing to do */
> +	if (cntr_id < 0)
> +		return;
> +
> +	resctrl_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid, rdtgrp->closid,
> +			    cntr_id, false);
> +
> +	mbm_cntr_free(d, cntr_id);
> +
> +	return;

No need for this return.

> +}
> +
> +/**
> + * resctrl_unassign_cntr_event() - Unassign a hardware counter associated with
> + * the event structure @mevt from the domain @d and the group @rdtgrp. Unassign
> + * the counters from all the domains if @d is NULL else unassign from @d.
> + */
> +void resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				 struct rdtgroup *rdtgrp, struct mon_evt *mevt)
> +{
> +	if (!d) {
> +		list_for_each_entry(d, &r->mon_domains, hdr.list)
> +			resctrl_free_config_cntr(r, d, rdtgrp, mevt);
> +	} else {
> +		resctrl_free_config_cntr(r, d, rdtgrp, mevt);
> +	}
> +}

Reinette
