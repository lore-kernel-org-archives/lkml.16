Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64D71B422A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 23:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746661772; cv=fail; b=nESJJlKuT9B5GrWcEUU8R92U5TKlQv+3RJBuRPQlBD9Hc0y8wTZYn9cTyCs/RdRAqOXu236Q47Jmc33AyERN/TOAGF+EJCokmPsKlFR2mjXZ2nBMAsEqhchr0k3cSDyD7mmhSOWcIonTuEr9l4JjIggGaTg5Sy9jqDzT5X+NerY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746661772; c=relaxed/simple;
	bh=zJP0k+X4Rn3Epn/JM6Vg+JGyppLeps25JzxdTHy4ZHM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c/b7sbqW99JY/tK3vaKWxfnt4xIuwl1RL5nLFO7gL82Pvr5y9pK2nqzwstafrhl8b8+qsCyH+dB1dAQYxaP8PK/G5jDnVhOOB/tshKLffOja+7zxFzJPM87Hl+zAIzOb3ImVgGRwIko7S54fy35ovZxEQAeSiJpABa+WZf9/uic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQTphVOT; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQTphVOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746661770; x=1778197770;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zJP0k+X4Rn3Epn/JM6Vg+JGyppLeps25JzxdTHy4ZHM=;
  b=EQTphVOTGn3fs2uoZXnTw2xpY0B1Bpad/RzKgoIVca/yvTrHErtjgbTA
   YItyJt0DaKHTojrVD9g1Pn9Mu0oUEAJw2cf+MPOE6JcUTyBkkrlLqkskw
   lneiuCrqBCsEg5tf3XO8vdJAw2EOi4oycU+gjbCk/dHGfEHfCyS8LVTmC
   FMyaQKaV8WTeI4zytlNy89pHAJLf5xjEFdJQQXWj3myD2yudtfr7i1Yrd
   2QQEj21YsBcGKZ0CTQbh25N9tXaQ9Rirbt8jhE7mgxYpRRRDehBV9zebD
   zAKi0bS/ksHSTx5hkskNo/mEhoU82j38dnaCR72utLvtGML5gOS8l+iD0
   A==;
X-CSE-ConnectionGUID: e5A1ZviYQZO0sPG3ZuhIWw==
X-CSE-MsgGUID: /NHW5B2USZCO2E9FkMjrRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47679315"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="47679315"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 16:49:29 -0700
X-CSE-ConnectionGUID: BtTSthKQQmujDGzWbBK+DQ==
X-CSE-MsgGUID: COt7BaxwQomI40WKBg3V3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="136076243"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 16:49:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 16:49:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 16:49:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 16:49:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xf0oJ0rxgeSjXdunztWpI/lVYHrEHlWPAvsRBuFcf/C2j0NBDmd8zy2O8Vdfnbk1+q2KQUVTjh6FThURTEYqLT/jhCyVRH2pLEsUI6zcgAfs39/+gpztIugO8W1Fph3mawlVO3qbRdebELIauUTNOwG6em6VXlhVwT5n3W9uogtdeGx+fYSK+uQerzx0rSucpcMxdWpggO4eTZyT+G9OXgHr7sYf5xjXFayoHcYii+2ITiSQBpy1VoQXS4JRgsHuWMYfs4uhlUknK7+p72vMQuv/YfpDBY12/zWEU4SvBntCK2/SqofYesTid3ZD7Ye5R5cd6JDslWDj9IqkzXDVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJP0k+X4Rn3Epn/JM6Vg+JGyppLeps25JzxdTHy4ZHM=;
 b=LQWjVkKvOkVpEVL2+aKgAIoEG19ZmEo7py9bGWhw+8rSiDfDb9zt5MRHOxB7L/t1NsV4rrGfbR+nEie/Kv+QMK4Ss3u2p5N+KPY2KmGa2pu1jH686xXZ5BpbZMa5reqgRtWqRNJQBqMUC6BE0MfznZHKWl1tZBgGZca3KU+13+mEePceIKgDcHsIXi+anPnv2TYaX5XuD5ITekGL+UoW1yKU6Nbi5KHhsv4EGO+iwansei+SiblZ9gAliPx3QbM6IXgaw378HMS32zwJlUp3t/o293LYbyVvz6rxpFNf8EFtk5JS83SX4CccV1lXIYhtt6kZA8CYoUnUCWxzt2/q0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DM4PR11MB7373.namprd11.prod.outlook.com (2603:10b6:8:103::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Wed, 7 May
 2025 23:49:21 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.8699.019; Wed, 7 May 2025
 23:49:21 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "Huang, Kai" <kai.huang@intel.com>, "bp@alien8.de"
	<bp@alien8.de>
CC: "seanjc@google.com" <seanjc@google.com>, "x86@kernel.org"
	<x86@kernel.org>, "sagis@google.com" <sagis@google.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "Chatre, Reinette" <reinette.chatre@intel.com>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>, "ashish.kalra@amd.com"
	<ashish.kalra@amd.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: Re: [PATCH] x86/virt/tdx: Make TDX and kexec mutually exclusive at
 runtime
Thread-Topic: [PATCH] x86/virt/tdx: Make TDX and kexec mutually exclusive at
 runtime
Thread-Index: AQHbryPIQc8IA+YWOkSunFUCTSHsmLOoJAYAgAAIsQCAAAnGgIAfkh4AgAAuagA=
Date: Wed, 7 May 2025 23:49:21 +0000
Message-ID: <6536c0cf614101eda89b3fe861f95ad0c1476cfd.camel@intel.com>
References: <20250416230259.97989-1-kai.huang@intel.com>
	 <7bd03311-0c4c-41e6-b6dc-803b6455f170@intel.com>
	 <ea0b0b1a842ad1fc209438c776f68ffb4ac17b9f.camel@intel.com>
	 <31e17bc8-2e9e-4e93-a912-3d54826e59d0@intel.com>
	 <9a9380b55e1d01c650456e56be0949b531d88af5.camel@intel.com>
In-Reply-To: <9a9380b55e1d01c650456e56be0949b531d88af5.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DM4PR11MB7373:EE_
x-ms-office365-filtering-correlation-id: 0cf40944-0ffe-4062-6729-08dd8dc1c9e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M0ptS21vcWgwamNoaFFOZ3dEYTVkTjM2V3A4NFVpVTlQaTVIdWNxNDZUTFVq?=
 =?utf-8?B?UkJTS0ZVZ2w0dURoYTZWbnRqNzZUQVgrNUZBV3drMXFRUDlPMDNTSVVucDNs?=
 =?utf-8?B?QkRxc0NFOTVxYU4yVEh1NGJkdDM5Z1FyT2VMa1V5RE55SmpCQithWDQ5K296?=
 =?utf-8?B?SFV6eThkdm1CZXlPVlRCcnNLemp5bWU2UGNTQkx4Mm9OT2xpclBFWC9ZQmd3?=
 =?utf-8?B?TU5PRFhPNFNsRkhCU0FxdEVicytmdXBveGQwTGlsM3Qwc0RoZllEcXNrTVNI?=
 =?utf-8?B?ZHNWcC9DQ3BCbThqdlJtUzUvQzJEdnlpaWlIOUNMaG1VUzAwSUhxRGRlb3Uw?=
 =?utf-8?B?ODJ5ZFFkUDJucjd0ajVlTTlMT0xvaUt1b0dCUlcvanZad1ZoSzNqWmFDRWhy?=
 =?utf-8?B?QlBGZUFlelFLUVVyWUFhUFp0ek1yY3ZiN1h1N041ejEzV0pCcGNWdkRyMG5q?=
 =?utf-8?B?Qzl4M1RkaU9ITisvVmUzU1ExVnN3dXF2SmRKY0RQRHYzbjRKQW03aTByUWFR?=
 =?utf-8?B?TnhZWlpmenpVa0w3aVFReFBzcExFcDRPVHlGUS94NWtLcnd6M1lVUEFtblE5?=
 =?utf-8?B?bWhTRk9nc3ZvRHlLS3RrQTRlT2Q0K1crVkR0dk1kalZYU2U1ZzFGV1krejZw?=
 =?utf-8?B?K3ZtbzJ4K3dXTU5XSHBMcThlRklrVGRhVU9DbEtQWE8vTERSaC9IRXJ4QlZM?=
 =?utf-8?B?R3BtSW9mMWEyUGxJMWs3N0lYZlBjK0ZyZnZYVzdCZHBKMnl1amZiV1RnWUs1?=
 =?utf-8?B?MDlMSFprZ0cyWXRTdy9vNExweGIyNmIvUzFITy9IOXJ5QS9FVmNVOVRwWVkz?=
 =?utf-8?B?TTNIQUVmUy80REpZMVd0QkltN20zTTQwSU1DS0NmMWtQV1BJL0NydTIvWWhI?=
 =?utf-8?B?NFVnd1NWMmU0MFNjTE5reWZBWnFUQWRPTnEwWG1sV2dLS093OWZqTDlBSWdX?=
 =?utf-8?B?Y3BwVnFVVmMvRUc4OWtIZWpTZVQxeDRyQ2RDZXh5aVhVZzFqREtMNjV2bzJa?=
 =?utf-8?B?bVRsZWxjQ3BaaXhZdnNSaUhsazUvL3FaQUpVTkppWFlLOVIrbTBENTVxckw4?=
 =?utf-8?B?dXZpdzJkNWgvSlc0TEt1Y0FISzFlMmJLVitMcFRZbTZUQVB5VVpQeDZ1M0pE?=
 =?utf-8?B?Uzl4S3lYdGdDbGlCSHJaUmJWWkhqSDJ1RzVhcVBjSVBkbEh6YmNsSGtzQWw5?=
 =?utf-8?B?R0pVcm56Q3hyUDlGZjJGNXJ2UFVLaWUwR0VKOE5VeEZrbENlNUs2SFBxdlVM?=
 =?utf-8?B?MHFEb2xJZjFWVXoydzd4K1VtM2tHK3E2RVhBbEdNajRaZDhQNExZSHRxY1d0?=
 =?utf-8?B?d3kwVXVOZDRrd0d4d3NxR3lQUFEzNTRwcHQ2ME9BU3M1dnExK2ptYXlwYUZ1?=
 =?utf-8?B?TVh6SkRiODNtUTZLSHBTamU5TVRwNDNWWEhyMkZvTG5hS0VKOFp3SGRIN2J5?=
 =?utf-8?B?UCtvUTg5RFdGNzZ6Yk5jSzJjZDdWclprdW9IdFVaT3lvZ2IxV3gvK3hDem4y?=
 =?utf-8?B?ejJCcEJDZ1VPaVBVZm9PSlcwaDZCUTVZVVJGVXQ5N3hiWlBtS1I1MFNpMmx4?=
 =?utf-8?B?aGdtdEF6U2VrMG1uMnlROGx1OG5QcjNaRUVPUld4T1FJY2hSdWs4OTR3SFI0?=
 =?utf-8?B?VzYzVU1SY1RkclZuYUZ0MVBxVVRXTnhndUJiTk5qTzFiSVZvRHZlWU9kUjNx?=
 =?utf-8?B?TDAvL0JVYkNPSzM5QnJBWkJpdW8yaml4YStyMjdIL28vY25YUWoxSkhCRHhR?=
 =?utf-8?B?cFEzeWU4MzRPZGpJdEYwZEJzYUZjQzJ1RjR4TVVjTXdkeHYzamNHVGVtS3kv?=
 =?utf-8?B?VC9tczVxbjEySHdTMjJFWitiNkVYMTVSR3dMM3ZPMlkrcFA4WWhEejlxOXVT?=
 =?utf-8?B?dzVMRTJvRTliQU5hK0FVUG1kODM1V0FReGpBNzlVTFprSVZYa1p0elJ1VU5C?=
 =?utf-8?B?bkNsWmVvcXJ1cDZ4UWFnUmo0YU1XS0xSK3NCSEIxdlBIR1ZwK0tkUS80eCtJ?=
 =?utf-8?Q?1SKKcNgAroEV7tnBxNVDG8q7t/GPl0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjhDK0RKTEZXK1Rrc1BMdVgrUklMdHlsWUR6dUNneHk3aldsYmZ1aUtKYTEy?=
 =?utf-8?B?S0ZubXJFN0Yva3BRZ252NDhOeDhLWEZmd0JQOEZDTnJCang2cHphQUdBMTRL?=
 =?utf-8?B?cUs1cGNOTkVMWncwK3lLeUh0WmczQWRqS0dDak01QXhZMHNlaGg1ODZzS2Vz?=
 =?utf-8?B?S3hVcVVpUXI3dVhPL3BQNWpDWEVMVU04R25yeG43cjJjNWx0cXZPUzNETTVL?=
 =?utf-8?B?ay9RZTZPSnE3bHZQQm44c3haMWhtTDJVU3IwR045OG9oM2hDTmNQbWFhMFlm?=
 =?utf-8?B?bHJIcERxWGdFQ1oxM0NrQnIrcnZpWjRQUWtISGJZa3RlcW1XOHBBUFE0L2dG?=
 =?utf-8?B?Y1gvTlpuOUxlc2NEVGl2QUtxOHFzY1c4YmNMZ0g3Y3NsczRSN2EwcWhJZVBt?=
 =?utf-8?B?VVdMSDltR2hMZDgyNGhET1pHZjA4VGVnMEhOMXArUnZneVRCZnVKUVdRQUtS?=
 =?utf-8?B?OStMMThMdFRnV2NUMi9BVzJqK2JTOFE0cUpsZ2tFOGU3Nkx4Qjc0ZmVpVUR1?=
 =?utf-8?B?aWphcGNQMk5hVkxGRnM4WGNZS216MUwxRW5qLzFwTmNNNFVtNzFNQjNHSnVy?=
 =?utf-8?B?eDhmVWszV2w3MGRwdXNycUhzbTJnVHpuZWZUUEJqUEFQL2RPVVcvaXpJdUZq?=
 =?utf-8?B?aGxWRDJjQWZzNHgwYU1OYXRhM3Mvb0lHaXBaZGt0MktLUVBBL21NamdxTFVr?=
 =?utf-8?B?cFFqUEFXUzBoeUx1a1NPTU4vNStsMjh3YlRxS2RiVkpDa3UwbEJzZGszUzVL?=
 =?utf-8?B?VWJWdXlRanA0d1Z4MXFUR2trYWdVWXZOeGRuWCtucDB3alF5WityMnA5c2VO?=
 =?utf-8?B?TFlMcjcya3hHOXNFSEIrU0MybGhyYTY0d3lnaWRrQ3lWWDN5UUlZcTh5MUtN?=
 =?utf-8?B?SlZSaCs3c3pWdm9ZOWlSSVYyUCtySFBKaG1ObkFCWFF1TWJCem5WS1N5YkZJ?=
 =?utf-8?B?cGJYcS9VWnVVZXFDZmhTc0dFdFBjV0tSMEF1MWEzaTIzMHpIK2hMeGVvZ2Vt?=
 =?utf-8?B?UGNwSExIUzd2aTArTzdPNU1scmowV3dNaWhKQnBPZjUwK0pTRmU4ekVzbWFM?=
 =?utf-8?B?NTNuUlVzM0pkZE5aVkE3R0krRG84eGlEd3IxYlRzSmJaeDJqM1lDZ2kyUm4x?=
 =?utf-8?B?YkhQbGp3dWJzaFYzK1g0dWd2MFphcGI1V1h3OW56ekNnSE93VFVuVVpjWnh2?=
 =?utf-8?B?MUJCb09lZXhVWDJCTm5Eb2N5ZU81MWp4UnFjOXR6RmhVeExUWWFNTDNMdGhy?=
 =?utf-8?B?aWRaUExKOFJDc2VvL2l6WGduZVZBNmRSOURLOElJVWxaZ0JneVJHMzNwbVNL?=
 =?utf-8?B?bGZFOS82T0RQNTRiTFdzcWN3K3dPcUZSakhiekVGcEVLdTJzdCtPMzBxcGFw?=
 =?utf-8?B?TzQ5cko2aWlPeW5heE1ITnkyTGgzWDRXZHNGa3plV0dRVzY4NHF5M1dSaUlD?=
 =?utf-8?B?bGUwTnU1K3VIUVZSa1lqbWkwcko3WVVRMUVpakY0cmRyYlp2MG0yT1hNRFpa?=
 =?utf-8?B?SGU0YU9Yd0dDUTVCcUJHc24ra3ArMWhkTXhGK0gxSWhLZ0plcElraTZNV0FZ?=
 =?utf-8?B?dGVjTlU1MmF5ekdrZEtmaU8yUnlPN1ZUckE4T2VEQzZTYlNxbEJyV1ljb0Ur?=
 =?utf-8?B?QVRQdkZYNVU1SkZBeXFJbXpJVjlmbUtxaUF6UHc0aTRvT3B6cnhkOWtDYXlp?=
 =?utf-8?B?eWhPWm1LSm9oR1hRQWRtblVEVlcvOWJQQzIwSzNqclJiTUkxcWhzNlZKdWFT?=
 =?utf-8?B?Ny96b1lsZ01MQ2prZjNYTnErVFV6Ry8yUndUOTFvSjB6bmk3YVVKcWxab0pQ?=
 =?utf-8?B?b2hUeTVFRWJVMmtvMWtGZ1lTaXhWdU9OTzk0WmszaEZpTUluQkdPMVBxeE1a?=
 =?utf-8?B?bDBQYmo3THcrNEI4bCtOVVkrMXp3WjBORmoyaXJ5eDFUSlE3T0lYNURkSFZm?=
 =?utf-8?B?SjliTWRYN21nOWo2US9iMnZTTlloZ2tTVW5XbGJWZmhXTmx4ZE1KV2lFYm04?=
 =?utf-8?B?b25RL1RoMDJhY2RteE5uNmF3Ni9NTW41aVF5VDhVcFJReE5uMC9rOURpMm5C?=
 =?utf-8?B?ZEErc1RhV1lqVnY4MGhveDlZQmhjYXZRK21xMFNHWFRwYmJHRlJJcTZjVWdL?=
 =?utf-8?B?WS9HRE05WVNIZkxLY1U4bzRrc3IyamtHQkpkY09jOWRQNC82cmJEUm1xeU9F?=
 =?utf-8?B?ZlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3662192303AFF9488D1C9EBDB981CD62@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf40944-0ffe-4062-6729-08dd8dc1c9e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 23:49:21.1659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gg1h2iUybHT5AT+gMQ4YJUOxMbOIbQt6BEKJetBlbwFe/N2bjcG8hCabR9Yz9OF+9vqJbNLyOCvhCIgBFMG8OZwbjufWr6Y2WK00+EXIe7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7373
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTA1LTA3IGF0IDE0OjAzIC0wNzAwLCBSaWNrIEVkZ2Vjb21iZSB3cm90ZToN
Cj4gS2FpIGFuZCBJIGhhdmUgYmVlbiBkaXNjdXNzaW5nIHRoaXMgaW50ZXJuYWxseS4gSGVyZSBJ
J2xsIHRyeSB0byBtb3ZlIHRoZQ0KPiBkaXNjdXNzaW9uIGV4dGVybmFsIGFuZCBjb250aW51ZSBp
dC4NCj4gDQo+IFRoZSBwcm9ibGVtIHdpdGggdGhpcyBhcHByb2FjaCB0dXJuZWQgb3V0IHRvIGJl
IHBlcl9jcHUobmV3Ym9vbCkgPSAxIHBhcnQgaXMNCj4gcmFjeSB3aXRoIHRoZSBTRUFNQ0FMTC4g
VGhlIHRhc2sgY291bGQgcmVzY2hlZHVsZSBiZXR3ZWVuIFNFQU1DQUxMIGFuZCB0aGUgcGVyLQ0K
PiBjcHUgc2V0LiBEaXNhYmxpbmcgcHJlZW1wdGlvbiBhcm91bmQgZXZlcnkgU0VBTUNBTEwgc2hv
dWxkIGJlIHBvc3NpYmxlLCBidXQgaXQNCj4gc2VlbXMgYSBiaXQgaGVhdnl3ZWlnaHQgZm9yIHdo
YXQgb3JpZ2luYWxseSBhcHBlYXJlZCB0byBiZSBhbiBlYXN5IHdheSB0byByZWR1Y2UNCj4gYnV0
IG5vdCBlbGltaW5hdGUgdGhlIGNoYW5jZXMgb2YgaGl0dGluZyB0aGUgcmFjZS4NCg0KDQpXZWxs
LCBhZnRlciBtb3JlIG9mZmxpbmUgZGlzY3Vzc2lvbiwgdGhpcyB0aW1lIHdpdGggRGF2ZSwgd2Un
bGwgZ28gd2l0aCB0aGUgcGVyLQ0KY3B1IGFwcHJvYWNoLiBUaGUgcmVhc29ucyBhcmU6DQogLSBn
bG9iYWwgdmFyIGlzIG5vdCBob3JyaWJsZSwgYnV0Li4uDQogLSBwcmVlbXB0X2Rpc2FibGUvZW5h
YmxlKCkgaXMgbm90IGhlYXZ5d2VpZ2h0LiBTaW5jZSB0aGUgU0VBTUNBTEwgaXMgbm90DQpwcmVl
bXB0aWJsZSwgdGhlIG5vbi1wcmVlbXB0aWJsZSBjeWNsZXMgZGlmZmVyZW5jZSBpcyBvbmx5IGEg
ZmV3IGluc3RydWN0aW9ucy4NCnNvICJwcmVlbXB0X2Rpc2FibGUgaXMgYmFkIiBpcyBub3QgYSBn
b29kIHJlYXNvbi4NCiAtIElzIHRoZSBjb21wbGV4aXR5IHN0aWxsIHRvbyBoaWdoIGZvciB3aGF0
IHdlIGFyZSB0cnlpbmcgdG8gZG8gaGVyZSAoc2hyaW5rIGENCnJhY2UpPyBObywgYW5kIGl0J3Mg
c2ltcGxlciB0byB1bmRlcnN0YW5kLiB3YmludmQgaXMgcGVyLWNwdSwgc28gdGhlDQpuZWVkc190
b19mbHVzaCBib29sIHNob3VsZCBhbHNvIGJlIHBlci1jcHUuDQoNClNvIGJhY2sgdG8gdGhlIHBl
ci1jcHUgYXBwcm9hY2guDQoNCg==
