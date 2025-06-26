Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3EE194A65
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750901088; cv=fail; b=T4tRWE6rsZaB6cFhvOZ39IL0MOvWXOrdLHkKrQRojxmIymy5/LDlWWaT6TpODKn1DFSyMtdCnW7xXFDtz+KVmPAVEcL5SSJfbugFlPNVjHP5ajsH06l/GoCweEW4DIq1NNW13+SKihOjMGuY9/uPheb95H4s5Sg7KeuHiGoN1ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750901088; c=relaxed/simple;
	bh=8Mh9g2vtmFKkRNhtGhpGCQGf1rtXuSzowa9jzXdPua0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FMT+qG7G5kfbMWhqSXDX3VhKupvPTx7tn7pCQlRvDATHQiSNntRGj9foNsZXI7d7gdHqtuJXgMPvu2TXY39CtJyJSAOtK0nrZCV52oAw+pNXqIPHeHMfmIEe1Xla7215Qjbmk9SBF8rqGq+WfI33f0L7HIdvauphSmwWRHw7S6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7ltrlM7; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7ltrlM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750901087; x=1782437087;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8Mh9g2vtmFKkRNhtGhpGCQGf1rtXuSzowa9jzXdPua0=;
  b=T7ltrlM7EF+1oqbp2tNZczhGPlxSgy3KidjhuV0wzz8A+tuTmsaJqkQx
   AluBSi9Smt/V3CQp9+FdjuSX/LnGsFWKMwzXtmsiDWCZsDMLw6CJT1plY
   3NRkQHUTQT64M2SrysBjwK5TMExnB9utAZPkPDi81+bqhrdKyVN7YeVNo
   2hmH6m/k+6iPmHsEhtqeqf874Ek1NX6L7Y0Nbt2ugJqUJjVz4R4kUUPZH
   J50H8x5CTnVkrLdx7T6rLjkGbceB+b111j6Jmwl5GoEz4dldDrVTZbZ9d
   Elc8ROfNN3c7G3VLWs1IxWNnIZqaLul53cI15PWrgx9M94CRRbO34V2So
   A==;
X-CSE-ConnectionGUID: Pul/w7ZaRS6leMN3Ug/QyQ==
X-CSE-MsgGUID: I6/E3p5LRTiNy7TC7aDehA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53124474"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="53124474"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 18:24:46 -0700
X-CSE-ConnectionGUID: sCo6+PqyR1mbFl6yxM0S8w==
X-CSE-MsgGUID: o/SiQcnQRKSXZMDD5OBKQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="157869621"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 18:24:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 18:24:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 18:24:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 18:24:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdNUAFgcQSqrU8h7Cmm4JzstRzny3OWaA9bae65xsfdK10Rh0dEljHje3dlFRQ8HplN0vkc/H+aeitVCaqZa8EwyP5bvSVGwzwfGINfaHsj7mbLD0G04wPkTpxBnYwO2LDlZ9AuhyuZy8Xa7HnfDVmXA1HIWzZvZ5IDarBYXq0nu0ZdT20DUOXJWadQOpdUsteoNcbWpYfIwX3i/LC1yAk8pVfpo9WJ/RUOpaaAwaEsiaCWhWYAj/rzgg+R3tou0ZdTWIcx7O2eCt0dXVKO6g8pyTsJmiC83DB4UILY94XdLH9zUd1/i9f6gUHKzD7EUQsbNJrfs1fBT5R/hN1h8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Mh9g2vtmFKkRNhtGhpGCQGf1rtXuSzowa9jzXdPua0=;
 b=ujNlPJHK1WqWKFBcRF9ec13F129RDWDHzPBCY5TvCorNRcU4Qs4ngKBXW1f3gTmMvDD8dNAghjrcjgSCeq7ySzZXstKfP3yMzzk55rvjKmbis/qh2L+O7qfDl7dcR+9kXdNTWPdsv6VlIRZw6IavwwGuY2xs8kY7nldQmlE7Z1JAsBEwu+pukup0K/xi5WOROb1BeVUcP1NxpRv+2DVAb2jbdi3JAYv7kUMO4zUh5YaTofW8A3bn3LXLlDJ+phpuxObEA3Je9EPks7jZkyBIYwUlpViSQLo9XgiLRTNHFQiuwe4rU3nLGiwIwl4MHLba0cwVSc1KiOr7/M1Vk2YWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 01:24:42 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 01:24:42 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "Hansen, Dave" <dave.hansen@intel.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "seanjc@google.com"
	<seanjc@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/virt/tdx: Further fix tdh_vp_enter() calls
 instrumentable code warning
Thread-Topic: [PATCH] x86/virt/tdx: Further fix tdh_vp_enter() calls
 instrumentable code warning
Thread-Index: AQHb5PDU969bA5TUb0eLqFWJ9LubALQUj6QAgAAYo4A=
Date: Thu, 26 Jun 2025 01:24:42 +0000
Message-ID: <1f738756819f046feaac2e89e08b87f93927cb06.camel@intel.com>
References: <20250624101351.8019-1-kai.huang@intel.com>
	 <6d997522660f3ddf673d981cf2511674a94e99ae.camel@intel.com>
In-Reply-To: <6d997522660f3ddf673d981cf2511674a94e99ae.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|SA2PR11MB5082:EE_
x-ms-office365-filtering-correlation-id: 4bf0210d-d325-4bbc-ebbe-08ddb4503a33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?VWphL3k3NHJweGR2MWdiT0pEeWZFbWFnYTEzUVRocnpIcm44Qmc1M0o1MlVr?=
 =?utf-8?B?Q0tVaVRuTWVrMHBKVC9lWGFDOW1MOXpKSVp4dTFjMGJVNGdQNE9ZeFJ1L25o?=
 =?utf-8?B?TC9WZER6eVk5Y1NBUFJUV2lRY3pUaS9wU2p5RkUwR09DU2tBUVdDRndFWjVL?=
 =?utf-8?B?Q3hxaHNuYkVVMU45RkNHcjhuaEtmUzU4WE1UcEJhNDUwbUhTeFJ2OFp0bEtB?=
 =?utf-8?B?RklwS1gzNndqN3drTlVLcHo0WXhKc3paeHhNUSs4cVE0ZHNVYXZNeEVoR25U?=
 =?utf-8?B?VUhleWkybGxPYVhCb2lFbTJVNzdvTU1oaVh2aEVtVWRlajZXQXRUYk1FUGJo?=
 =?utf-8?B?NmRWU3QraGR3SkZUc3hGc2NyVDVKR1hyOFM2dlowRzZjZW9jaC9wZ1dQZ1FL?=
 =?utf-8?B?ZWl3UW9ZSTFaejIyZWczaHNQOHdIVWp6S2U0OEloY1NONDhjMkdka3EvMmFp?=
 =?utf-8?B?MGNZalVpcFpZT0o3RWcvRnpyWkxOMTJac0NXc0dwYW9uR3NjcFlhMmd6eFBa?=
 =?utf-8?B?ZUxWbDZBcXJhNUc3VEhPQm5EeDVCMEN4UUt4QWVVSEU5SHZaS05VNzdxYk1D?=
 =?utf-8?B?U2JZZTN6eEJKdldpSEVDL1lJaGxHUFBZeUxNMGhocStnU2d0T0V2QlJENmVX?=
 =?utf-8?B?Mi9rR2pmaFM3aFdsZ0tNNDBOMXZFNm1qSSs3encwUG5DRkU5VDFnSU8rbkJs?=
 =?utf-8?B?SEZkSk9IRlRNbFVSTXRHQnp1ckZXek9hZldkc2F4d0w2akgvWjYxU1dvai80?=
 =?utf-8?B?NXYrT3k3elJlOUZKWWtQdGRTaGIvQzZoVk5tSGpzaU5JQ2lMc2dGSVFHV1FF?=
 =?utf-8?B?eUxwWGV6bWZ0MTFqYzkzVDNrUjMrZGNKOVBtK0VYNTlJVTNMb3IzUGJXejl3?=
 =?utf-8?B?VTVrS3dVNVlmeENES3UwaXdRTUlUbTc2cDY2YnR5eDJVclYreFd1TkZtRnBY?=
 =?utf-8?B?dVBCMno0K0tSOWZmcXc4ZHA5ZnZvTTh6RFg3N3BNK3NVa0dycXNvZFA4d002?=
 =?utf-8?B?V3hwUXUvK25neU9iakdVaUdRRmZzRzdmTFpTTXRwMUZNY3crdkxFQnhjdzI5?=
 =?utf-8?B?ZFZXemw2b1ZyalRsVlFtcURrcno3ZlM2OXBQRFhzTUxhVDNuYmY0YW9iM0N6?=
 =?utf-8?B?SlNEdkpoUUJyZ3NGaU96bVF4RHRhNWhhOHA3THRZdVovV1U5QS9wOVhoWUt6?=
 =?utf-8?B?d2Z4VVlWUkRrbU1LckJYMC9OTjRnM1pRcXNOakgyVEF1M0pWWDRQNmFWVlNX?=
 =?utf-8?B?UVNZeHg5cFVCcGFjVk5GN29PUVE4c3ptOWlVc210SXVlbUVKdit0WXJsZXNM?=
 =?utf-8?B?V29yMStNWFVKeFNINWpZNGZ6Q1Q3eUxNNyt5Q0VsbjlyeXg3N1FXWnIzZU10?=
 =?utf-8?B?RGJKWTkxQWxxT3QvcG9reC9MS2d3TklWS2tMVzlUd3FNZUgrOVN4NDhhOEpI?=
 =?utf-8?B?VlA5b2M5d3VKdmxYcGVCTWp3UWNHVVVWOTd4UjdQR2szekhXUnpvMGRZNWJ1?=
 =?utf-8?B?bXNKdXdpaU5HVmNBTWg3RkMraERIb3dxUmpqQnNlNUN6L1RiYTBkQmlBbGds?=
 =?utf-8?B?QjM2OVdMcitPNzN0MFl4REMvc3owVDlRaldydmlvWFZuOXZMc0ljSDZGeXdX?=
 =?utf-8?B?SFA5dEgrK2ZQdHkwcy9nVFFWYVAwd1c5NGFUZW03aXdlQ0xua0tHNG9weTZB?=
 =?utf-8?B?dzhRMW1OVmhwY1ZZMTNRYjdkZ25sS0wrS0E1NDR1RHdjenRhdUg3cUYyZzNZ?=
 =?utf-8?B?Yyttb1dIeWJ4d0IyVVFmLzZ0Ny9rREdDUHo0VmJYcFBHTW1sZU5zeXdDSkh5?=
 =?utf-8?B?MDJaTE1Ca3dNK2IxeHdUaHdKa0ZpbDAweFAranE4cGlqbDVJdks1ZG5lMEhJ?=
 =?utf-8?B?Wk9qb2lNdFVVWUZqenNvMVJucGhvNElvOHljaDJBb1IvN1k0QUNWR1NkQ1dk?=
 =?utf-8?B?Z1BaYno1L3ZPNjBoLytvTS9PeDlTQ2p5c2hUZlM2YTFSS0xRcXJ0UzFLQ2Jx?=
 =?utf-8?Q?rAsMTQhn4PnEqGe6JhFsrdNYlFvUgg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blUxSEJxMGllMWtpbmtMdWMwK2IzUnk1MlVnZDRxSGxMV2YyZVp2Nm9RcnAz?=
 =?utf-8?B?K2M5aUUvNC9XLzJHSEhYSUtjQ0NqL0F1Z0czb2E3SExCcW1ac2habUZoRUo2?=
 =?utf-8?B?WVpGMytJWUNtQ3pGUDFFM2kyR1BWRStoTGpoNlp3MjZWN21qTXljdkRWcXlY?=
 =?utf-8?B?NENYY2ZRc2t2cEFFNjRLTkEwbC91TC9UV05idnBnTDBXQ0N1T2dXOUVzaEZ4?=
 =?utf-8?B?WkwxMDNDUnBhdENrV2RINUgyQVZWUHBTVlVTZmkzdnN5VDNyVnBoRm5DOE9X?=
 =?utf-8?B?UlN1Rm9UQzBPYytPYk5JUWlMV2FYakJtVVlJNjNwMnlsaVJBdlJnenBGNkRY?=
 =?utf-8?B?VnhlMlI3M29CR0orOVMwYVdoZDFuUmFkK1hkQ0JUL3VrODFxZm1KTEdzVnVB?=
 =?utf-8?B?bVRzSTh2MzFkOFB6MGRwQUxrbDlVNkV2V1NkZXg4S09COTRCSzYzTElJSWVn?=
 =?utf-8?B?SmFzeVJ6N2p4MG9SK0xjRVdVdWtUWVYzWXVYK0kzQktoUTllUjZWbGlBeU9Q?=
 =?utf-8?B?OFdlM1QwQ3hkSzh4K3BqOU5tVkNjWTF0b25pYjAxUG52UC9HcUgwbzJVSHhG?=
 =?utf-8?B?MjhxTDJuSnJicUNlMWxONTJoL1VmU3BGSTBFejRoMjA3OXA5S2VmcGJpSy9s?=
 =?utf-8?B?WDRMVlNnODNndEQvMFZFUzJZYnBLMFQ5YjJnaFhQZmplR3RibnhBL0hKcnYr?=
 =?utf-8?B?eG1YQ3ZIa1FPK3VwbkpwMC8wZytneWgzWmhKRUwybzBkU1JOMEZGYWprUWFi?=
 =?utf-8?B?YzQyOGxWZ3FMc1BrU1lTMHgvVTl0SVdicFNOcENBYkNMdjI2WlFNY0d5NVpn?=
 =?utf-8?B?d1N0a0ErMDZDL2dZUmE2OUZOaXVWeDJjekJiQmZxUWJUN3FjdmROeU5RaHRz?=
 =?utf-8?B?VnA2ajl0WGFNaG5vVTJqbkNoWVowRDNIQ08xbU5ISFFQRnBNV0ZRYTBYZ2ZM?=
 =?utf-8?B?a3dFbHZteGM5NFpLeG05VmdBckdUOTFlek9GdDlJTFlrYXd0REQ0L0ZMNEJ3?=
 =?utf-8?B?Uy9janF3T2pkblhrQWxEeElCaGFvdEpyUThkSExwdzg2L1hYRnhORmZLbUVB?=
 =?utf-8?B?SzN1UTE4TlJvdEsreWNLR3dOMUZybHo2eTJzd0xOYjhNYm1zTS9iNlFtczRS?=
 =?utf-8?B?bnNEY2tWdDVZM1dKN1Y2MS9LMkdseEdWd2NDMW5rbFphRWcyMWFmckNTYXZh?=
 =?utf-8?B?R0VQUjNCL2RVbmg2UXg2OHIzM0VBczJsZWd4bHBnMkZrVUxJbE90VXI3Q0Fw?=
 =?utf-8?B?eXpqQ04xVGMvQ0JCSUo2UkpWMms0dkd4dUNIM0c3OEREQXFVMDRLeWd5cDRH?=
 =?utf-8?B?bUtiWFpUS2gwdzVqcGEvazJaa0VodkpEVHBiNGg3SE5keitoNWNPU3Zmb1BT?=
 =?utf-8?B?OTFXWG1GTjN6TXlmOTNpelBzSUhTQVpvQTNHSjNlcGFZbEwxdHBVRXNtbEdH?=
 =?utf-8?B?QytSR0xsN0hKOE53V0QzT05VcnlXeGlma0ZaQWE5WXBCUEZCUnNlZUZScE11?=
 =?utf-8?B?cGNYOVdtbkE2SjZySndIVmRJb0RUeHlVN2RCcXd5N0dVZzh0ejVpTDFKWlc3?=
 =?utf-8?B?aldQL1k1MVE1WTc0b2ZRbnZlaEpDbk1LVGhUc0xtTGVBL2hrSGh4eFFKb0Rt?=
 =?utf-8?B?WEtBTlNTM1lnblNJWi9ZSXlyejBqVVI3T3lLcSs4UUJTS2pDM0lqTWN0TlU2?=
 =?utf-8?B?am1lUnBuOThBNjFza2dDWG85bHJ4dGhUVHpxeXdMdmRqY1NHMXJlYTFwSEU0?=
 =?utf-8?B?VHFudnkrbVBVVnZJdFp6OU5LeVMreUpTNjF2V1B0eVQ0V0tsRDJNVTN0QW1J?=
 =?utf-8?B?N0tZWFJtaGZJYXl0NEJBeGczbGx3b1VLcExKMEVBbEpzTC93alRnV1o2ZS9w?=
 =?utf-8?B?RWloakVkRjZQblIvaVpIdUJ6a25PWVp0NVIxS2RQQjh2dlNKWVBBYjdCVytz?=
 =?utf-8?B?ZllvNzNKclF3WnpUTmIyakVDcytXOVJDSG1HdzVoM25ZVnB2N2g5Z3E0dUlo?=
 =?utf-8?B?b1VMQ1dBN295YU94L1lwZ1EwOUZZVkp3d01zUXJyS295dVBDcHpQV3BwZDB1?=
 =?utf-8?B?OUpNNFB0QkxkQWNOYlNLYWZvRkR0bmpUcGk4cXdpNnV3LzM5NjVDaGJZNmFG?=
 =?utf-8?Q?6DRKnlzzXn+nKMA0Ifg++njVp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B3D336CF0A0794D8570740CE726A4F0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf0210d-d325-4bbc-ebbe-08ddb4503a33
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 01:24:42.2775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 78Xza6K+7R5eAAJVUs3BQpJOxQ5w5DzcWKpoltOczmiNM3k1ZwM0NB951JjhYVfRilrkdMYKP3PJzLRYgC1yeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5082
X-OriginatorOrg: intel.com

PiA+IA0KPiA+IFRvIGZpeCB0aGUgc2Vjb25kIHByb2JsZW0sIGNoYW5nZSB0ZHhfdGR2cHJfcGEo
KSB0byB1c2UNCj4gPiBQRk5fUEhZUyhwYWdlX3RvX3BmbigpKSBpbnN0ZWFkIG9mIHBhZ2VfdG9f
cGh5cygpIHNvIHRoYXQgdGhlcmUgd2lsbCBiZQ0KPiA+IG5vIG1vcmUgZnVuY3Rpb24gY2FsbCBp
bnNpZGUgdGR4X3RkdnByX3BhKClbKl0uDQo+IA0KPiBUbyBjaGVjayBteSB1bmRlcnN0YW5kaW5n
LCBwYWdlX3RvX3BmbigpIG9uIENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUCBvcg0KPiBDT05GSUdf
RkxBVE1FTSBoYXMgbm8gZnVuY3Rpb24gY2FsbHMsIGJ1dCBvbiBDT05GSUdfU1BBUlNFTUVNLCBp
dCBkb2VzLiBXZSBhcmUNCj4gY291bnRpbmcgb24geDg2XzY0IHRvIG5vdCB1c2UgQ09ORklHX1NQ
QVJTRU1FTT8NCg0KWWVzLiAgUGxlYXNlIHNlZSBpbmNsdWRlL2FzbS1nZW5lcmljL21lbW9yeV9t
b2RlbC5oLg0KDQo+IA0KPiA+IA0KPiA+IFRoZSBURFZQUiBwYWdlIGlzIGFsd2F5cyBhbiBhY3R1
YWwgcGFnZSBvdXQgb2YgcGFnZSBhbGxvY2F0b3IsIHNvIHRoZQ0KPiA+IGFkZGl0aW9uYWwgd2Fy
bmluZyBhcm91bmQgcGZuX3ZhbGlkKCkgY2hlY2sgaW4gcGFnZV90b19waHlzKCkgZG9lc24ndA0K
PiA+IGhlbHAgYSBsb3QgYW55d2F5LsKgIEl0J3Mgbm90IHdvcnRoIGNvbXBsaWNhdGluZyB0aGUg
Y29kZSBmb3Igc3VjaA0KPiA+IHdhcm5pbmcgd2hlbiBDT05GSUdfREVCVUdfVklSVFVBTD15Lg0K
PiA+IA0KPiA+IFsqXSBTaW5jZSBjb21taXQgY2JhNWQ5YjNlOTlkICgieDg2L21tLzY0OiBNYWtl
IFNQQVJTRU1FTV9WTUVNTUFQIHRoZQ0KPiA+IMKgwqDCoCBvbmx5IG1lbW9yeSBtb2RlbCIpIHBh
Z2VfdG9fcGZuKCkgaGFzIGJlZW4gYSBzaW1wbGUgbWFjcm8gd2l0aG91dA0KPiA+IMKgwqDCoCBh
bnkgZnVuY3Rpb24gY2FsbC4NCj4gPiANCj4gPiBGaXhlczogZTlmMTcwMzhkODE0ICgieDg2L3Rk
eDogbWFyayB0ZGhfdnBfZW50ZXIoKSBhcyBfX2ZsYXR0ZW4iKQ0KPiA+IFNpZ25lZC1vZmYtYnk6
IEthaSBIdWFuZyA8a2FpLmh1YW5nQGludGVsLmNvbT4NCj4gDQo+IE90aGVyd2lzZSwgTEdUTS4N
Cg0KSXMgdGhpcyBhIFJCPyA6LSkNCg==
