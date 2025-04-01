Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41EF2AF14
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743486793; cv=fail; b=emWR9ZiPXTC5A1kPKIuXULwnznu7TvdS0THiqPLDokQFFFZiM2m/Uqwh6fNzpHBVMCOYOx2ZKLYzUWJVbjpv3Nbxgk4f8oQxYcndoQm1PNJ/GTRITxCQx+YBW9Iepbe5MQvhJ27kI6YV1+g/sCzPthk090nbpf1ulw0lRq65zmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743486793; c=relaxed/simple;
	bh=pPwsy56OMETiNpZoMgIJHzRh3ugsheRk+4gb2gfS81U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Zn0GqZSS6smE6ex6uoCf/SXhVqLN2cxzobd7vaLAYKdbJ8Q222xLR/2gXo07HMeZdUjB+7AWFbmmZFJi3lleOLKDl0MTNwz61hOOll7bVKT/u0ms/oQdHCYuGB/xc+m3f8FtJ+9d7XYtdw841zcTrV3uADQi/i7a3gZ31muhqzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncxheQ3X; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncxheQ3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743486792; x=1775022792;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pPwsy56OMETiNpZoMgIJHzRh3ugsheRk+4gb2gfS81U=;
  b=ncxheQ3Xg0dGTSJ3Pvj0dmz5D6GCnR23ZIgDkCOA7LTJoDZoWBTm83eB
   tPU76AuG4akYdtOv52JdauDtOBjPLzhKUbMXbxKPf318F7BJhQJLDV3fA
   xQ0T7nEgARnxuGPo7K+D0tGYtqDEYIHfspnNydvBdFE2Y9e1kjPMjAgvM
   O+J5P4+GfRoi6X0+qz4QSKCAYSTxUNslTqizi2gCc+v4Gn3nf3PJrt1OF
   7WzPSHf2hZCZXJLAr0vkExiq77LM4EhEGjE/PmfMd1cPcdBcaOdnKAtXU
   BHNZpDdqap1RU0MyzPrcs2a8J0qn/fvVGX13iKJ9FxpoqnoYQTfS4tZIi
   A==;
X-CSE-ConnectionGUID: eRFFwuQIS769AkIUiwrZVQ==
X-CSE-MsgGUID: LA0EQVMZS56aCa80AmMPSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44805063"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="44805063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 22:53:12 -0700
X-CSE-ConnectionGUID: 02e11ZoqSSSOhcaWasJLNA==
X-CSE-MsgGUID: w8w/2Wd6RFaRmaZmkaVgJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="157285739"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 22:53:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 22:53:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 22:53:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:53:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzHYA+lDHsSI2ZzbNW3NWsE9ycWTVpA0KiheYQJ2r1QMJpej1Iy8fMpzggaBw1gSWvblggA9XhcHZ6YC9sSYcW84wgksgYGbvxDdBBNqBQ1wW6s9ur+/o5qu286skL+996TOfzLPjXILTbjX/0oEvWney0wtycH5PWY6maY9sStJ+7hURLoa3iqwtUu78xXlZyZRIPwBKHhaj7Ae+5AeuLZGDUD6u44I68WL0ma54BuROwbhZOEB6CTN4iqj+KlC6rsHhbHjfzej+gCTFJ1EQAKbeHhLmXiigBOiXSTb/LXLuF5zbWFjmV63XSjsUz9FwWvQzLEW1sfUVMykwmxZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPwsy56OMETiNpZoMgIJHzRh3ugsheRk+4gb2gfS81U=;
 b=Lblq1XQzVXV5OhPVfcr5glXy8Dqoy2UPLOGIa+qppeOFeIk1dujpIf5wzmX2mrdoSp1zcRthL/ZvbXhR/PuEcHe1rLzXH2Vzrx39zS5rwM9lKxYxr+V8j1cM9fSz4I2bfKmUqDVfSFCfnyeaOXSsS606MohISPK2MR58xKcUDr36E2ms7v1tsstrBgSb162f9cuH/0maAtIIOzK/bcSaf0gb/aJNmkt8ZddxxU8r8E1NeF5RxI5TmtsaYv0uPdYPrxGA49L6PhhRmkqCHYBfGvQV5Q1ApWj8S3vpG+9rznOpm/Jg7yQz8p+LTLtQCpXxaUeqUt8AStYNAz6umZzlYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by CH3PR11MB8750.namprd11.prod.outlook.com (2603:10b6:610:1c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 05:53:07 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 05:53:07 +0000
Message-ID: <e01c2866-87d2-4881-9825-1b033dead5de@intel.com>
Date: Mon, 31 Mar 2025 22:53:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] x86/nmi: Fix comment in unknown NMI handling
Content-Language: en-US
To: "H. Peter Anvin" <hpa@zytor.com>, "Huang, Kai" <kai.huang@intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "x86@kernel.org" <x86@kernel.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, "xin@zytor.com"
	<xin@zytor.com>, "Luck, Tony" <tony.luck@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-6-sohil.mehta@intel.com>
 <4e7937e946d94d5f62ff1a5f3b416f7d1eb2c71f.camel@intel.com>
 <BF35DF73-974C-4C8F-8ECE-3C9C254BAD1C@zytor.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <BF35DF73-974C-4C8F-8ECE-3C9C254BAD1C@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::14) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|CH3PR11MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 4015cad7-d575-44a3-ea20-08dd70e179c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHFKYTUzc085UkxKMkdHSkd3YUZiNmZIVmFLZ1lWWU9TMGEvZTZsbk9CWGhy?=
 =?utf-8?B?UmhWRzdvN2MxUTlFeVBxZDc2RE54Z0tGdWpOcTkwRDdmdTBMeUIwaXR1TG1t?=
 =?utf-8?B?M3luQ3VzOHRwWFMyYUxiOTNkdHFWdnVNVEc5L0YvU2RYbjhFM0xaSTdIbGFt?=
 =?utf-8?B?cDhuTUEyZC8rbnRJeW1mNmlYcWRQQ0luZjJLYW43TkdFU3p0VlUwd1NQdTNj?=
 =?utf-8?B?VktpR0tJSHNtN0k4NjRvekhNOTRRdHJJM1NhTEFab2hwWmo3dG56U0QxTjF0?=
 =?utf-8?B?dE1WZUk0dk50RXJsUGxDZ21qSkEyOG83c2VvSFBlMTJndlVQTDJGM2ZLOXVk?=
 =?utf-8?B?dDJQNm9IZGtmeU0wczhLTkZvU3ZCT2t2aXlMeTZhMU4xcTZoTVdkT2t1TENV?=
 =?utf-8?B?SUlIaTd2Lzh0MUZaNGFqczM4bzNMdUtPU1RKbXYrZzFGcXZ5NStocnMxakxh?=
 =?utf-8?B?eGVvMGE3ZlZXRGpmck5XLzJadzZabWhQaVg5NzgyL1RHZXJyUm4xSWVTMnJu?=
 =?utf-8?B?blgzTVBhUklHMjB2OVBiSnpUZEhZUFJzQklYdlhJekpvSFNmOE44WWFTTXVL?=
 =?utf-8?B?MDlkSEZacVhmMVJ6dThhUENYc0Q3d3g3bGFHdlFGOE9VY0NnaTVndHJ4TnlU?=
 =?utf-8?B?S0ZkZG1CUkMxK1EyMXRYNTkyNWJab2xyUnNqbmRQcEVPZzZuRXphM3prai85?=
 =?utf-8?B?UUpBUkttcVczRHk0MWhBaFlsMGVtWDNtSVk0b2JBSGlsdGJoWnpRQ1lZd1lZ?=
 =?utf-8?B?cFpqeEtyU2h2Q2dySEJYT1BmNUtpSGs2NUhhNjhmN2ZEc0ZTSHJMZlFpQUE3?=
 =?utf-8?B?MEVRQ0pRUkg4RnZVTldVZ0crSTFmVTErSWxYN3NuRXFjWElocGNtWStKbUF1?=
 =?utf-8?B?Q3JnU2hYMWpKeklYb3VrSnlDYnJtVTh4cyszMVJRTWdCMU5ZVzVVWFQrcHEx?=
 =?utf-8?B?LzYrL0YrSGM1MlBsYWF4aHdMYjFMK1lKblNqUGpnNU1PK0FGaVA1ZVBRTGJ4?=
 =?utf-8?B?bHFhRkpuYUVGWUlYUGRYQmVnbGhNVGNLeG9Ha0Z2MG41VnFvKzk1eE1MN3Ba?=
 =?utf-8?B?TytMK2pHTDFlYW9kVFFhUGlqa3NxK2dLWDVPWG5BMks1R1Jsa1NkaUxxNWZB?=
 =?utf-8?B?cDNrQWluQkFKdVBDc0FXQUlSdFgvWjNJV3pHdG41Y2pqcHg4OEJmTjRvQzFo?=
 =?utf-8?B?clRWZHpPU25DbEdOVW9MUVVFV3I3dXlyemF6MFd4cytlWlBSd2VaTUxOYjR3?=
 =?utf-8?B?eVJzQXFZbmkyYlREN3YvKzdWUWM0M2c5UzF2cVdVSmQreTlETUUvT3JIVXNy?=
 =?utf-8?B?bnROcVV4amVhN1NLejNsYU9wTFY4L2x3SnV0K2s4VG5rR2VOOTBWdXZLK3VU?=
 =?utf-8?B?dWdOdlhPOUV3UCtvMU1MUGpTMWxBbWdpNnYvdVVQbUNiRkpTTTk0cmVIUms3?=
 =?utf-8?B?REF2NmpmNk9QVU43Z2tYWXFvMzJtVW8xNERDY2pLdFRIRHZPcnFtcS8wN1dV?=
 =?utf-8?B?QmVYUVU1V3hqNXVIZW1tcWpsQlZVNGszMFRXQ2JFTFFXMERpRWdDTXhuM25L?=
 =?utf-8?B?QXRFSktHbUJwNlVTd08ydzd5NU1mMTE2NWErSHk2cDFzMG1xTXcyUDJhMW5X?=
 =?utf-8?B?Y2RFNnh0dm9YMFU3dDJQM1hZMHQ2M21XRHFSQXFUNjBDYmdXejNneUxLTmZm?=
 =?utf-8?B?UVpCc2xLRk52REkxeWpERDk5QkFlYzgwODVqTGFnd3ZQTjVIOVJLM3NsRzV6?=
 =?utf-8?B?QmVYa1YyeGRUS2V3cm02aHVrT3NSTWNaTVVwWHhGeCthMmU3Q3czSloyT0to?=
 =?utf-8?B?d0pWTUJwellZM3RsekdGaXZWMWhBMGQ3MDB6NmRWTjBnZThSOHVNNi9oVHBD?=
 =?utf-8?B?aUh5emREd2tYQ09mcXlzT29qeEtqdVZNcjFIb2ZVcHBBRlZFRE9pRGQxTmJP?=
 =?utf-8?Q?5wAU9ZDLKb4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1h1Snp5N1N6QmI5c1BQK0dxUkRoSE9neVJsMEtvRDUzTWUxczhma0ZDbkRO?=
 =?utf-8?B?TTJLVS94WFU3Q0VmRm5qSnRkTmRaVmVuZWVCTy9iWnQxNjRFeWNQTVZHNzBQ?=
 =?utf-8?B?YnJVY055Y28yNmhxNVpablp0c1liMXdaZXlCWnYyQVFpU0sremI0WGU1dUFP?=
 =?utf-8?B?Q082TWgvWHo5azFuUVEwTU5aaWM4VkhtMzNxeWF6cG1NU2JoMnZ4TmVSRHVa?=
 =?utf-8?B?Qm14bTZTbGNTZlhUWTJtYzV2K1N1cjluTGhJMU45NFQzb040VndEV3d3TFBP?=
 =?utf-8?B?b2xjamphUTdpQmQ2OEtEZ3dWU0lSdUIyeGhOKytXbFdQa1ZhUTlndFcxTEow?=
 =?utf-8?B?RGJ1SnpKekZLSGR1c2gvRkc1WDR5QkZRWllENVAyMGl3VGJ1WmNLYzJPcGVz?=
 =?utf-8?B?eitUeldOUWJKVWp2TTM3UFhGc1FpRGprU1h3aHFIN01OUFNjQXhmU1kwV3pj?=
 =?utf-8?B?amRETEFFVG5sRGEvSk9ZUW5iTEc3VHpRZU1VTU9lZDRlTWRCLzlTWXp5S09a?=
 =?utf-8?B?b1gvdytlVGdkcTRMa0NxVFBWYW5Ba005RnMwYlJyaElHbjM4Mng3NXVlZ0lN?=
 =?utf-8?B?UHB2YkwwVzByZzRucUhHTC9wTFBtVjduQTVzSWtleHZpSG9OZlN6VWRYbGlD?=
 =?utf-8?B?WmNTQm9rTnBDTy9GVUp0ZVdtME1pd2R2Sm9nQkZCN3lwbkdFQnF2a2ZpanRP?=
 =?utf-8?B?by92VktPOTJqamJCSXE1Mm1BOVh6YW40R0hQeXBYMk9rcGl5c1N2VjlFaHdG?=
 =?utf-8?B?YnpsU2dMRGFjOTl1TG9heldHSmZqVjRZeTgwYXQ1MUpXRzByQkxLYjRpOXRT?=
 =?utf-8?B?ZVFKSEZ4Y2VnQi9FWGJKTHc1dUswaGFBRm13Y08yQnVCNkt0UHJFeHI2RlRB?=
 =?utf-8?B?a2ZJcjVqQ3pUZ1pHNzZ2bWNrRjkxb1psNWFIeEtvQlZtU3grODlzKzM4ZmpQ?=
 =?utf-8?B?UnhvZ2dRNWd6cHAwSGs0Vk05Wi9KMXJ2UEpubERPWGdSV0crZHM0OVNNWmFu?=
 =?utf-8?B?bGNJSE1BSFpid3Y1NEdremwrOEg2ZTN1Vk11WXdteEowdlk1YnM2cXdYNHZG?=
 =?utf-8?B?V0lpUDBHODRjQkpPTUtFd3k0ZzM2eHQ0S082MVNnQ09mMkhYYlFyd2NHTFVU?=
 =?utf-8?B?ckp5SFIxTWhZbkJqZVdYWmkvdlpXS0cxczB0MnU1azhPQXpQclJWWDg1Tk5l?=
 =?utf-8?B?Q3VRSDMzNktzWTQ1SXh4dXZqdDV4bXptWFdGc0N0Y0RXMERPQXNyakpOeUs2?=
 =?utf-8?B?aWRwNzFDdjh1ZnlPSjVvWVBtNnY4U1Fac3lLYWN5MjVXUmsybTFHNlltM012?=
 =?utf-8?B?VEhoOTgxTVVuK1RMN1k5clNxM2VNQTU1WVRMcmJYcHFhTk5tRVBxQnUvYi9j?=
 =?utf-8?B?U29kWXpxckU1Y3dOWHlleXR2U01Jdm1zQ1NiNGcxbFVTR29NVDB1RGlYSExJ?=
 =?utf-8?B?ZGg4ejZ3QTlRdEpFUG00MEpSOGtWU0F6WGpsQlZvV1NaQ1FVYjZ6S01ldjNB?=
 =?utf-8?B?ZHJORWdISjR4b2kxQk1lVkVqUE5nZHBUTG1lb1huNG5yYk9pV2MzQmI3cWNK?=
 =?utf-8?B?bHdYcDRKem8rWDdWTS82ZFhDNTYvM05qVE8ycWVGZWZvL3lFMkF0c0xWVm9G?=
 =?utf-8?B?SnFQaFI0T2ZkMnRueTFSdC9nWmE2N2V2Y0s0K0dmNUIyOU4rTVhTVVBOT0VX?=
 =?utf-8?B?YS80RUVoYUlNSEVYUTFETzV4dEg3dFhBMmFXMzlQR09adUlXUDMwSFUyRWVG?=
 =?utf-8?B?T1NlNkV0cWUxMjI5NXFDd21FQXM3UDFkOVV3ZUxsRWlFU2UzM0lhd3R3QTJH?=
 =?utf-8?B?eUFESmlJVWY1L3ZnN0kraElYQlJ1UkJXUzdRTEJ4UGVuaXdPMTNzSGVPSHVC?=
 =?utf-8?B?Y1JNZk1lcGdBbFN5K1JXV2ljWG1zYTg1RHFaeUpveXdBcWpxUzNQejJVWHN4?=
 =?utf-8?B?NU5KcXRWZlVzSHkvTFBEdmZpRUtwS0ZDZEV2ODR5Ujl2a1htVDdqcy9tVWR4?=
 =?utf-8?B?T01vWVcwcWtUT3RObVVvanFySG5na1YvbnBSclk1M0hIMk1RbzJkcm90TDh2?=
 =?utf-8?B?MVFVbnVHbUJjRGd4S0l5ODRaakRDOUJBSmcrald6czUxK2paVVAvN1lraWNV?=
 =?utf-8?Q?npyQFuGNFHD/KDnGe+TwPt2XT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4015cad7-d575-44a3-ea20-08dd70e179c6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:53:07.1592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loWjKbHbViI6uUET5OUP69Oe+e8wAhu9/YSR6kPsMDr6QacnxkvpiwRbTwV0F0frnl4jaGNZnlaIfHVFoEvZlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8750
X-OriginatorOrg: intel.com

On 3/31/2025 10:45 PM, H. Peter Anvin wrote:

> Ha! Any idea what it was *supposed* to do? I'm guessing it stood for "back to back" or some such?

Yes, it stands for back to back NMIs. I added additional comments to
clarify how they are detected.
https://lore.kernel.org/lkml/20250327234629.3953536-7-sohil.mehta@intel.com/

nmi_handle() still has special handling for back to back NMIs. But at
some point, there was a b2b parameter that was passed to nmi_handle().
AFAICT, that parameter was never really used.

Sohil

