Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BB315533F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260841; cv=fail; b=rBXb3m989macoAC8+DGMk8pv+gUk7LZFR1MVYmjTXYpmNAzmnHd7xBTmifowhfqYYUV5a6qKsvdClF/io5ixhj+qs5IasU9ouDxQA6v2uvYRcAinX4sPkuTnyeoxeWNDlnFLR9y+03Okw/qbxqO4ihuSxnebIpo3duKMvRskJMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260841; c=relaxed/simple;
	bh=em/Twt5cLw1ovQ21S+MYwHOfgW70BiAxqqlw5VElAn0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h9Y0007NDLe0o3NAbojnnP8mOvIgVwzrgo/8wJwNpk7KUMIFtKHYGZUlY4+KCJuL3RFeLoJRDOop687Q3oJDoLsTEJ46CY5DUWx6PNxCvWw+J93eQW2VWJ9LsVythjL1Vm82iX6o8bhXOJE+3YEgexgz4fXTHPfLkyzIKZRkPRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmUQnF/x; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmUQnF/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747260840; x=1778796840;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=em/Twt5cLw1ovQ21S+MYwHOfgW70BiAxqqlw5VElAn0=;
  b=VmUQnF/xtSBWZ21tb8XP99kUYD6eRfBKa9lEs2vwGvlwlWUdk4nZTiIR
   Mvkl1mrfN+11zTDZHeqYV1CRr08abbekKh6RiDWN6GrQYLEXusZS8qtzJ
   lqPh4Yqy0Krk8hD1+rwL8pKETwuouC6rTlPhe4bAWCO+pW7JRcraVnOfl
   ov/a3BgxFax0QTwzlxj7JddNNYN0U5AQU9121G/oCZ7vwMcWz0zNtHcZD
   PuegwJ+Bke8iPFsmrzDA/eSzYHdEJ4sumhuj3Kl5eyP+sh2OtE2txVn9I
   +aZsHH8WbpolYSP6pJOrW9cyKJol9IYCOItstdR8QcdleDBmoEIeh4wkT
   g==;
X-CSE-ConnectionGUID: 8CZpK4lKS7O/tPgWs2FRQg==
X-CSE-MsgGUID: ZZhBwz0fT+aa4pO0CJuBwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48292691"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="48292691"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 15:13:58 -0700
X-CSE-ConnectionGUID: jTOWf6f6SNuTHieQ3om4pw==
X-CSE-MsgGUID: gC2jIpuTSpqdNRRiusMK2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138089949"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 15:13:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:13:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:13:57 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:13:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPe7LWHDE6krI0oe/1HFsxCjxO4gELio1zBJec/Oj6BxMiqs2v44nZff8O6/tpzAEfHk7ez8+EInoru5Y7V3IymIiPleQyt0+rGus2kowKlmF3S9Sg4IHvgQfedjpv3IeX6xMSP/TUHVoRkDl9rjoIhdyFeoNRpCM5nLYRBaceJFLVyQ9VUAYoa1GLdUeAcSFyw/5TjAvSkIqQ5UDleFDIONV4sEXSeyFTmTQ4qeMAWv3H+/sLjQ/JJ3qD9BDlYmqQYf5f//M97iuR2gtIdoErqTPedpNiBxnQBAJ7XbsnB2PHcBzaFj5dbmfodIdmILln4ZL0+FUV7zQnJnTzsYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=em/Twt5cLw1ovQ21S+MYwHOfgW70BiAxqqlw5VElAn0=;
 b=sDc8yBCqIGfN5ywbfFAndJM5VYd9EQcKsrjLPyyPezekgng81BZjomTdnSpIrciiLrFGXWeedhw+LdLeZ5YjVQ+L4W5PqYm8D3zqAI7F9QVpphK89hfWw58p42NZWGIalzgGK2wjXzpK1tOSH1iG+u6fLnAjqaoRcvQPW2f4QBAT8nOoRcMmJM3Wko1uZ+g6RKh4PcGDZaAjkVCvGQ5LKaVrRm6IMXUexcSDxgSorRN7jNeaamFbCuQCo/Dnx+PrbwYc783iQ9q3YXt6qAox8i8nrfR3IOVCDYY393QFt9IKBUFBANykHTOZf+/r0jQgxJR/EtuARZnLVNAzWUyl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3303.namprd11.prod.outlook.com (2603:10b6:a03:18::15)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 22:13:55 +0000
Received: from BYAPR11MB3303.namprd11.prod.outlook.com
 ([fe80::c67e:581f:46f5:f79c]) by BYAPR11MB3303.namprd11.prod.outlook.com
 ([fe80::c67e:581f:46f5:f79c%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 22:13:55 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "bp@alien8.de" <bp@alien8.de>
CC: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "seanjc@google.com"
	<seanjc@google.com>, "x86@kernel.org" <x86@kernel.org>, "sagis@google.com"
	<sagis@google.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "Chatre,
 Reinette" <reinette.chatre@intel.com>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "Williams, Dan J" <dan.j.williams@intel.com>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>, "ashish.kalra@amd.com"
	<ashish.kalra@amd.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: Re: [PATCH v2.1 2/5] x86/virt/tdx: Mark memory cache state incoherent
 when making SEAMCALL
Thread-Topic: [PATCH v2.1 2/5] x86/virt/tdx: Mark memory cache state
 incoherent when making SEAMCALL
Thread-Index: AQHbxLiRUmHzT5mbwkmRtRuCesUR0bPSRugAgABqmQA=
Date: Wed, 14 May 2025 22:13:54 +0000
Message-ID: <489d219318944a7fd0bb7ebe6a58835943a9d684.camel@intel.com>
References: <ab08a6a1f4d1873eb09d5ad625c42a51d29e5971.1746874095.git.kai.huang@intel.com>
	 <20250514101022.7537-1-kai.huang@intel.com>
	 <66f5b7f0-8109-4c10-80ef-783ba8bccae6@intel.com>
In-Reply-To: <66f5b7f0-8109-4c10-80ef-783ba8bccae6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.1 (3.56.1-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3303:EE_|SA0PR11MB4559:EE_
x-ms-office365-filtering-correlation-id: a39a5e65-5758-4456-1f1b-08dd93349dc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cEZJa1NYcFZwamd5WHVYdSt0Qi90MkhzazVCeW5MMmF3dzR3RVA2Y08ya1VD?=
 =?utf-8?B?WWJZVGhOcGpTM3pyRlBMWFlJVjc3WDhkU2FHK1RkeTh0MC9hQitsWGVEUzdJ?=
 =?utf-8?B?VnBwRXp0cUx2UzZxcTFuWUhWYU04U0xYaG95dDZQcXlHaWpuQUt1UU9OSFBl?=
 =?utf-8?B?WWhYQnNFSFpyMWFiKzFSMWpLSUIzTGNFMWlnT0QxZVVBTHpJYmQ0VCt4S1Rh?=
 =?utf-8?B?MHEvRzI0cG5QRUVxbmhIM2w3TkNrVndHSnAwQ3R4U3JtdlZtNWY4TVFIdzJk?=
 =?utf-8?B?L0xtU0JORCs1Mmd2OU1uZGxIcXJGNkNvQ1JlRHFPRWoycGk0NlEvbFlkeVl4?=
 =?utf-8?B?bXNiU0lWY0JZckJ2cDJMTUZlYTg3aTJCbndZeVhmZENpdXJsTU1NaUtKZURY?=
 =?utf-8?B?NGdLVGRrZ292aldzYTJDLzk2VGZad1E1R0R5UXY0TlZHRWcyZjZUREdTeFkz?=
 =?utf-8?B?SFJtOGFBM2xQT21aeTdIZmRFQ0h5VHdPOG5qMjVGSHNOaDM3SEVHMm9SSHJZ?=
 =?utf-8?B?RFBJb05IOHo4N2JldHJWbnI3UkhHNURkMndvN2dVVC9CZFhmOWlNcEoyWmZZ?=
 =?utf-8?B?RmhCMEhlOE5iV0dKdFY4OHVDTTluanlOVFZvREJYVjFueDZOQTdSUnl1bXpF?=
 =?utf-8?B?VVY0d2lCeW5SbzRJUENpbllsNkduOTkyeUQxeUJFWW5WVVB1OEgwK0xpcnlD?=
 =?utf-8?B?RHJCRmFSR3JTdjBLYkNNVEJtSEpzdDZqNmR3RzcxRittWnJRV0s5TkJNdlpt?=
 =?utf-8?B?TU1Yb2pSWmo1ZjRrRHcrK3NVV3FaL21TTUdWTlBFa255YjZYWUdZUWpuN2pF?=
 =?utf-8?B?M3JkYXN2OXZOSWZEUGl2V2RxMm5VbEVrSjhOcFpoTndiQ2dFYThZcDYwcDVh?=
 =?utf-8?B?N0xZSkUyUlV4empsYUR5K1JKZ1JSbDAyb1dWRm03RDFZMmhkVnM1ZmtLTlFo?=
 =?utf-8?B?a080NjBQaU95QUdvQjlXdlVuT2c2end2N0Q2VW85cjhZVHJLT0I4cUd1eWxK?=
 =?utf-8?B?cVpCRG1PK2paRjgzUC91cnFRS1B3eGY0cmhpOElRYVN2QWR4TCtoZGRXUWVr?=
 =?utf-8?B?T0tXOTFaVG1yMWNyYjRJQ3lQOFRlNVl1WlFWVGJobFdCWG1vYWQrMmJzWGhW?=
 =?utf-8?B?VzRXNWdaRkp4V01rYnQrZEcwamZCRjdjckJ2Yy9YQ1VkOTZDeEFiUWx1U2NR?=
 =?utf-8?B?Q3Qvdk9wMWY5UnozRTlMSHRLTlJGR1FZamxENzh6dVFKeGtHcVdtTUxId05X?=
 =?utf-8?B?L1FLa0JNZFp4Q2xRUEc4NnVmeGs5cHd1eWpjODBicDlvMnFwOUhOa3FNeHB4?=
 =?utf-8?B?R2g1VnhwTmJTaHprK29UTkMzRU02QktCWDNCUnVvY1M4T3lZSEMzMnpsaFJM?=
 =?utf-8?B?SmFHeTNXeVhYMjJPa0JmSjBidk1oMmpqZE93b1llYldqbllEVnp4VXd2UXAv?=
 =?utf-8?B?TDBVMnBiYmk0dldZVkZDN3huUXhPZ1RvUk1uUmtrdDFtU1Z0UWRUWXBoekV1?=
 =?utf-8?B?ZUhhOEQ0ZW9DSTB3YTBuSThvOUI3Z1dKQ0V2OTYvc3ZlTmZxaFBqcHc0cmlQ?=
 =?utf-8?B?dGh3VXhWbmFJUzJ1cXVsOVo0VXRRbEg1Y1BsSDQyQlYxaTR4dXQ1bUlhMUJn?=
 =?utf-8?B?UUNlY01SVUZ2VVdPNDRUZlVoQzhRVmczQ1ZSMWt1MW9jUXVRSTJscWhYMlRp?=
 =?utf-8?B?Z09YcktCY3RWbmRhcTBONUNwWnZtYnZjUGprVnRTVXFsdWZTM1MvZ0xsK1o4?=
 =?utf-8?B?TkdwaW9MS0hmT3NxWm1GNHNXTC9RZml4a2tISkxTcytsQW9SZHowOUMwdy9u?=
 =?utf-8?B?Z3EzM3llUC9HNi9YYWJwUXRmVEVCbmJieVZCT3RKcmdGdlVUcXBEQkRCbm9Q?=
 =?utf-8?B?U0I5MC9WMWZUR1FCdGx1MEdrU0NJRTQzZERtOHd1d3JROVZCSTNjUll1a0xj?=
 =?utf-8?B?VGxFTmpOMnF0TnNmVzBKa1BDZEJpUHp1TWJzZjZmZjBWTkRndmFlK1Rta2w0?=
 =?utf-8?Q?skbIfxMc5SzXqP7tDNVV/MFOyonkro=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3303.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXhucTU1TzFVL3JlTi9ZNE00SHJDZmZKaVBGMW0rMGZOSTBBc1hiN3lJVEpG?=
 =?utf-8?B?LzJzVVk1RkZUcTBxbENzZHhYaklCbmFsK2dtY1pLQUQvWUwxTzNORytqSFdJ?=
 =?utf-8?B?TWxLQ1ZIajltZzYyMW9mcWV2aXoyUFRhVHNTVWJBeVRDR3lNakdoUE14dm1q?=
 =?utf-8?B?TTNFTituNXRCRmdEV2UwRm1kMjlFVENxaXAwMDl6RTdxeDNJRlk3clhaRmpK?=
 =?utf-8?B?aWxXem1CbmRNaTdocmpyK25WcWZNVWxiaTF1amxnV3FLUzRlQVp5bHVuNk1B?=
 =?utf-8?B?dzhMSmNHUnRtMHB6K01aRER0c1BRRFJVMDBPdjkrZlZ5YU5aSUh5a0ZIcG95?=
 =?utf-8?B?ditQZ0JSUmJTb01PcXFwM2ZkSWEzRkxmZ3dJNllsektwNTZ6YlJMWVR2bzlH?=
 =?utf-8?B?NVkvOU04NFNEQjZCVHJCckY2VjA3cDhER2d1K3hKZk9WRUc5aWluUEdXL0xT?=
 =?utf-8?B?aVdxa2RIN3I3M3JhMDIySUM3N0pGMmMyK3lsR2JyNHVyU0x4QjBKdVlidHZt?=
 =?utf-8?B?N2NzYXhkeFFBTnNJWjA1QlQ4OWV3cDlIMyt1ZVIwd1c4M0dRaTFVV0VUSlBD?=
 =?utf-8?B?ZzdSWGxRS3dqdGNoNmdqZkI3alpqTStBOFdHaDBVY01td2wyVTc2OUQ2WGtB?=
 =?utf-8?B?Vm9WamNGVGE1SW04anNXcUZBbUNNN01Nbk5vMDlEME40UXh5dWJjQ2FtSzRX?=
 =?utf-8?B?UFZqVGlHU3JFa2xzcjNDcWRTN0lMUEpLd2U5MUxnWHYwRDJZVUU1WFFtblhq?=
 =?utf-8?B?Qy9icjFpc1RIWjB2eW5xazRobXJGK2NBVWc4WE54MEJYMy9yRFRhb2JRNklL?=
 =?utf-8?B?NnhwSDU2TEd4N2hNaHU3MjFaT0pzUDdZS3VxNy9COVp0NG0ya2I1M2E2bEdn?=
 =?utf-8?B?RVUvNHlpU0dCejF2YUIwT0tTTTZrMHVSYzNxOXBWMDBGQUhPRWx0eEVjN1hR?=
 =?utf-8?B?M0ZIbFlLYSs5L3lKZmR5YTMvelFqVEtPSldYSHN6MkRUQUNYY3NHRHBIWFBN?=
 =?utf-8?B?ZUJJM3hlYUExMC9HN0loZ0RnUHE3NzNhditTaytQQ0dBUHh6QzE2dE1SbDQ2?=
 =?utf-8?B?L2lxeEtoWG1CcTBydFhERmVtSitSTCs5dnF4TmZrNXhKRjI0SmV2K0pzUHhK?=
 =?utf-8?B?QVFGNTBtVCt5dGhZVFdZQmVmZ0UvTmZPRjFhaDJLSm9pTHpLQTZDZzVGYzNQ?=
 =?utf-8?B?K044K3dVY25EZU8zQVorQ3FCSUVPOE02U09vaEdVZldWbWJhN0gyQ2F4Qnd4?=
 =?utf-8?B?dUpLTVd3N2lwQzMrcXlWQU1Zbmk5U3RhcmR6Y0ZUWlk2MTRLSVdycnRNT1Ax?=
 =?utf-8?B?T1pWMld5cXdXNnV4blpNTkVIUXJPUWNTQm5sSktrNDRmNGRtYnlIMkEwbHg0?=
 =?utf-8?B?U09jb3JuNEFBRDU4OFpGWWU0U2ZZSW9aUkxua0NHUzYzb1RJNGdNdE5CVmFj?=
 =?utf-8?B?eENReS9tbUpQbU9vTGJmZTQzdm1ITDlCT1Q2dUpsQ0hFMzBseGlpSTVuS21Y?=
 =?utf-8?B?eEVpamdtU3FpcWxoTFY5MG1nV0xBaEVRdElSSXRzd3Z2bmlpazVwZGNrMHZZ?=
 =?utf-8?B?eXc2NjhMNmRnK1NtaHQxbjF4R2pRUjVzK2x3ZElzdVM5REpGU2RRNHRvaFZw?=
 =?utf-8?B?RUpwUGhodWZRV0YzUGs1ZWp0UmEvSUFrR0pQM1FxRWs5UUlWcjNUc2JSWVE4?=
 =?utf-8?B?ZWQ3TUQzZE8vQ1ZQWXRxNWdOMTVoNDEyYUlWSXhCNHV4VG1NVkJlYzhBL0Nq?=
 =?utf-8?B?c3pCSVV2K1NqOWZ5SUZyRFBGM2dGRktSOVZQZll6WHRJMjRSV1NFbXA4NHV0?=
 =?utf-8?B?MmVydWdjSldDUDVYdU12dmpFV1pZVXB4L3JqTFVTNktwVFZEVmE5d3ArWU13?=
 =?utf-8?B?R1JUakxiTjZkUXdHUmpaSFV1eDBmbGtidjJuR24yajV2dEt0UndKaTlIejJC?=
 =?utf-8?B?S2g5NHBCeGpCRjVSTU1pdytkQjJtSnpwVFJubkRFQXZLRFVMQjA4UWlWS3ly?=
 =?utf-8?B?MHdDVGM2Qk1hcWlabXRWbFNCb0w1bkZjRmZYUUxROE9ucnJCMUVrd2ZxVUJy?=
 =?utf-8?B?ODE3RWFEM2g2YlRvZ2xnMldZNU1KQU0rdmg4bVZ6Z3FvMFcxUFdkbDRLNFF2?=
 =?utf-8?Q?mopJb9GfqTvrFqfzzvIiYiUSk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BED4A003639A6845BD291929B84A5BFC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3303.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39a5e65-5758-4456-1f1b-08dd93349dc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 22:13:55.0921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ls8ijqZk4P+3j4/nOywuYvaiDW7V7ndUgS/2PfQgZT7iYENWELNkDSRVENzox9gyLiy3oGVS+chGha2few8khA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTA1LTE0IGF0IDA4OjUyIC0wNzAwLCBIYW5zZW4sIERhdmUgd3JvdGU6DQo+
IE9uIDUvMTQvMjUgMDM6MTAsIEthaSBIdWFuZyB3cm90ZToNCj4gPiBUdXJuIG9uIHRoYXQgYm9v
bGVhbiB3aGVuIHRoZSBrZXJuZWwgZG9lcyBTRUFNQ0FMTCBzbyB0aGF0IGtleGVjIGNhbg0KPiA+
IGNvcnJlY3RseSBmbHVzaCBjYWNoZS4gIE5vdGUgbm90IGFsbCBTRUFNQ0FMTCBsZWFmIGZ1bmN0
aW9ucyBnZW5lcmF0ZQ0KPiA+IGRpcnR5IGNhY2hlbGluZXMgb2YgVERYIHByaXZhdGUgbWVtb3J5
LCBidXQgZm9yIHNpbXBsaWNpdHksIGp1c3QgdHJlYXQNCj4gPiBhbGwgb2YgdGhlbSBkby4NCj4g
DQo+IEl0J3Mgbm90IGp1c3QgZm9yIHNpbXBsaWNpdHkuDQo+IA0KPiBUaGVyZSdzIG5vIGNvbnRy
YWN0IGluIHBsYWNlIGZvciB3aGVuIHRoZSBURFggbW9kdWxlIHdpbGwgZGlydHkgbWVtb3J5DQo+
IG9yIG5vdC4gQSBjYWxsIHRoYXQgaXMgImNsZWFuIiB0b2RheSBtaWdodCBkaXJ0eSBtZW1vcnkg
dG9tb3Jyb3cuDQo+IA0KPiBUaGUgX29ubHlfIHRoaW5nIHdlIGtub3cgaXMgdGhhdCBTRUFNQ0FM
THMgY2FuIGRpcnR5IGNhY2hlbGluZXMuIFdlDQo+IGRvbid0IGtub3cgd2hlbiBvciBob3cgdGhl
eSBkbyBpdC4gVGhpcyBibHVyYiBtYWtlcyBpdCBzb3VuZCBsaWtlIGl0J3MNCj4gcG9zc2libGUg
dG8gb3B0aW1pemUgdGhpcy4gSXQncyBub3QuDQoNCkkgdGhvdWdodCBpdCBzaG91bGQgbm90IGJl
IHBvc3NpYmxlIHRvIGdlbmVyYXRlIGRpcnR5IGNhY2hlbGluZXMgd2l0aCBURFgNCnByaXZhdGUg
S2V5SURzIGJlZm9yZSB0aGUgdmVyeSBmaXJzdCBURFggS2V5SUQgKHdoaWNoIGlzIGdsb2JhbCBL
ZXlJRCkgaXMNCmNvbmZpZ3VyZWQsIGJ1dCByaWdodCBJIGd1ZXNzIHdlJ2QgYmV0dGVyIG5vdCBh
c3N1bWUgdGhhdC4NCg0KSSdsbCByZW1vdGUgdGhlICJOb3RlIC4uLiIgcGFydC4gIFRoYW5rcyEN
Cg==
