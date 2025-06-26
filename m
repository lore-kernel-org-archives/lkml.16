Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3689D12CDBE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950468; cv=fail; b=V9AGyFLu5j/HG0ipPXWCuTEzRwlh2jhYZ8yOpigOlgTjV9wAeLgiq0hJAjocRfXacJGUHJI6FQyo0ZZUxsxGnFJO7BgxCACKYt/8f3gSqSJoPLcQqWpKLf+XgadoPpvKHdcuM104N/zIpa+pPTD3UKo+VN5llqh4iCxfR7STOSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950468; c=relaxed/simple;
	bh=Sh9lEQJOcDMRJ72/4rfUJJXOuhSi0uyqkqH+uq3RJW8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B36RRJhyt/S5AaWEMHuJaqep/vwRaCFS8QueapzgW4Jx2PLnN5L8XaQfLY4kDhNvL/Dle+DuOfwwAGh6YrynJaGKpabd8O1IAOr7rvCNOyPT8RlQDSorA9KopWb9W3qBtGBEoPBa6sAkVkIFDH+l/5+e6TIQ82DK7vODBi9bu7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uv0gMKow; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uv0gMKow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750950467; x=1782486467;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Sh9lEQJOcDMRJ72/4rfUJJXOuhSi0uyqkqH+uq3RJW8=;
  b=Uv0gMKow9NGMGlyKR4nLSeQ9t6QhrzObL28xBUOcERbWMwMnBCZkCVHT
   Kdfta6u/56iVZETqzxbgB03R7WLKh+6Px2823XU0vwHkfnv9iP+3Sa1kX
   AKEgFmgjlqEyPRkoHq33MQY1xAGgtt91zoHSu6x/v7RO5Gb6MMG1x3d7l
   NAeAmNhd2eWlu4AD/Rw1gKdl7x6+vYDqkf0hD7E/gsozrl0QlbnEl7xat
   GgwwIBLoK5962wLlCLbE4eQLNQ7booXhCX6exfG8qAIGLs4mZQ6WPcchn
   fCyb2sKQQss7JEDQmvIxA0JF5RNFifbOcO91NUJ38hau0EFt3i1nx7wcA
   Q==;
X-CSE-ConnectionGUID: 5+A4VPedSq2L+/zppUyxKQ==
X-CSE-MsgGUID: TxUXQ7h0TfCu6Q+ne70rUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="78687330"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="78687330"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:07:46 -0700
X-CSE-ConnectionGUID: NkVi72gaSCSGaTwOqe5Kzw==
X-CSE-MsgGUID: avlsUGFNSMGm5a3AddTCyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="183575208"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:07:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 08:07:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 08:07:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.78)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 08:07:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qd3uN/prynI2Mq8sAagoasH7QCOc0dzIltEnVVEZawNNPv1lbq0ISjmeJtIWwnMbWCaWvYupr+4FYic1jGWXX0KGDdPYD48UMZsc+8i+YhBPPf4kk6x6+ODnqt12JqyWAtlwuiqdmokBX5C061ENSS3IkYnSpZyGPKwhtpP++jsmnXbW9qMBmsj9rBSpdVy4+sRLt87Mj6DwdGFunf1ve5JkDBLbBsAuEOypk0USSoFahpGHsXNVKdcWOIFwLeuaybxCDTttP1iNCzzYJa8xMgbugGFHQPY5/3Xd3b4M2I1el2mqZhmZgqhD9BkhyJuJwSiZXr3iTZ+FL+Ni7h7XzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh9lEQJOcDMRJ72/4rfUJJXOuhSi0uyqkqH+uq3RJW8=;
 b=fGMaldYqIYV/i1BI/p7qOFc5fEbSxl/jYD562SpMTRCHmGrDagEhR18eG+r+yRg/tY8UWP0vi/CNm8jUzBk7O8102/BzH59b+WII/CXdB8yUHN870Zh+fjZnsGg3d733z2fA9Z3rfAkyZEbJHW8YV757ktjNHLCPM1KHrxatHjX7qd+eySCZMzXuDmEXS+DPLS+s7hXYyxTbJIy3P5xtNcM7ImzyC5OFgzrQ63ljXkEfZZSEdGRyQnMyHTpgK4bLdfWj3LStixwG301y0Bxysos/s2RoPVjPTnCQboRGLikb3vdhCt9TS6bonxGwg00f2td7u6fQtzS6ec0or64erg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 15:07:41 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.8857.025; Thu, 26 Jun 2025
 15:07:41 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Hansen, Dave" <dave.hansen@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"Huang, Kai" <kai.huang@intel.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "seanjc@google.com"
	<seanjc@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/virt/tdx: Further fix tdh_vp_enter() calls
 instrumentable code warning
Thread-Topic: [PATCH] x86/virt/tdx: Further fix tdh_vp_enter() calls
 instrumentable code warning
Thread-Index: AQHb5PC9lU3WKkxH00+3HD/9HmyxhbQUj6OAgAAYqgCAAOXugA==
Date: Thu, 26 Jun 2025 15:07:41 +0000
Message-ID: <b7ee10745a6ab4335229e56fa401e505ecc7e1c9.camel@intel.com>
References: <20250624101351.8019-1-kai.huang@intel.com>
	 <6d997522660f3ddf673d981cf2511674a94e99ae.camel@intel.com>
	 <1f738756819f046feaac2e89e08b87f93927cb06.camel@intel.com>
In-Reply-To: <1f738756819f046feaac2e89e08b87f93927cb06.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CH3PR11MB8209:EE_
x-ms-office365-filtering-correlation-id: fb329289-dec0-4b75-a03c-08ddb4c33266
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?dVZKN0FLNTJxVENObVMyL0dRMHR1ZkFTdGJBeThxcm1FUkFhMGhjaHBGcWor?=
 =?utf-8?B?RVdBNmtjNjBnd1h4NGpYZGpXWUhmaEdHRnI5bVBGZ1Z3R01HbEhaNzBZbGFn?=
 =?utf-8?B?OVZrWjlkZVpmK3VCNmt6RDlEaURiellLWjFDbHg3M2Y1T1N0ZG56WVVURWts?=
 =?utf-8?B?YU0xN1A4b2xyUlhyMVdSdldhT3p6VHN4SU5Id25JTmpqSTV2dkZTL0xpSWJo?=
 =?utf-8?B?N2U3c0V6d0FzWFJ5WHBxVEZrZHBnbmMxZzNyVEkwMllJcXJQZ1NBVXJMYVIw?=
 =?utf-8?B?bUpqdHJCdUN0aCsrRnMrWk42MEZwQ3hMNmF3TUtwbWFLUnd4Uy85RUxDNjNN?=
 =?utf-8?B?bE9DTmVXR2FYUm51dFlXbW1waHZBRGRZNmhQN3pDK0d4MzkwT1dicVY3MjUv?=
 =?utf-8?B?a2hFaHJMbDBYKzZTTlUrT2VWVk5BdHFtWUVEVVRiSGNWV3p3OFFnYzVYYk9I?=
 =?utf-8?B?dk1Ea1lBOXE1S1c3WTh2NWhGYTJXU0hzQ3J3cHV6SXV3TXhEVGFGUGZqTkpM?=
 =?utf-8?B?a2U4ZmUrbG5tQTFoZnJZYUJUTm5IcUZoeEE1cXY4bFNvbksxNlVWWnowMUhZ?=
 =?utf-8?B?TzdxcDJ6TUttRUxONndicUxXUGU1VGFVRDY3clc0Qm1XVjFsWU55RVFwUVVX?=
 =?utf-8?B?WmhVWDBmWGhlMnliK3dubHBhSTEzSVZZSThOdFI4S3B1OEhocHpTZEVxRy9K?=
 =?utf-8?B?UC9BRnlHbE1vM0ZXaDFkTnNEWS9iL2twaTNtd1JOREcyZDN2OFQwRUJtSmFm?=
 =?utf-8?B?NE5tTkVLdEJEL0ZGT2pwYzdzZDlQRVVJOStvM3o2WlpBWkp5eGhxbjNwNkJK?=
 =?utf-8?B?ak1vMlZkTHJTQjAvMG9ZWTJqUkF6V0FrZlJSWE5wd1JEV2MwSkUwbEpjVXRQ?=
 =?utf-8?B?THZGVUZKQU02K0FXZENuWXlTUWVnWmk3RlBsZ0xFd3A5eFJXWXRncHlBN2JX?=
 =?utf-8?B?aGRXL2JUeEVaemU3ckk0VWZ0eEwxQ0FvRnF5TXlydzc3SnJuQ3c0TmhrZnFW?=
 =?utf-8?B?Q1JrUUl4dStHTWwxS0pMMjZ3YTdBSEtrODdla1pqZENobGE2bGQ5UjgyOG5U?=
 =?utf-8?B?UHhpREw4S3BqOWtxc3JacTV0MVhVNDQwd2QyeFRsL3M1R0oxKzA1OFFSRGtW?=
 =?utf-8?B?eTJ5S2p6RE1rZkhUUjdrdEtXUDJERklvaTluSmdCUC94Rm9TZ25zZ0Q2TkRq?=
 =?utf-8?B?QmF4UTZyZnpMR3ZXOGZDc3YxdFdtUThWMVJpZmptb2d4cG5Db3A3YnJuTGtV?=
 =?utf-8?B?Y01meEtTQlB6NWlickcyVjU4QXhOZExLclp6SUFSNHQxU1d1cGFFb0pIZVQ0?=
 =?utf-8?B?N2NTN3VTUUR0RHpIcnpmYTZvRExEQlI5eW8rVnFJRjhUdHVEMDZxMnhxOU1I?=
 =?utf-8?B?aGVwUW5ZbkJrQWlFRkp0UnVaVVFDY0dnLzJ0dm1LR3BLMDNHdlM0OStnUExi?=
 =?utf-8?B?WHZBa0c2SW0weEI3Ym05a0JKbE5ES1dPbFdJZVQ1RkwxdjVYbkhyNThodTQv?=
 =?utf-8?B?VTRXayszQjQvSjFxS3Z0VVlnYnlORHVHZFVmbGpRbjBFRVRNL2R6VFVxL3pW?=
 =?utf-8?B?WW84RHZJKzBxNVI2N252WjlPK04zVkYremFJMVV4VFVSK1h6eU1waWd3Vmhr?=
 =?utf-8?B?dE1uTXRJaUZRUjlOaHdwblRCWkxRRXc3YytNbTdMV3RiQXNJVk9EclBDaTRh?=
 =?utf-8?B?M1Bia0NXSU0yWk01NnV6U0ZqeVY5RitnVXN3K255aW5JNWF4bWh3TVdGVnA1?=
 =?utf-8?B?MmgydTYrU3grNFkveVoyNEk2OHh6cWh1VFE3M1laSDV2R1BkbHlpakZOUndw?=
 =?utf-8?B?MldXOGFDYWNzZGRLNzJmS1gyOG9oZGN0WTVndVFSanVzdEtuRlFlTVBzY3Rw?=
 =?utf-8?B?SXN5QVJmUFFkcGtDeFY1amRVTW5WM1BraThqVjlkRGNWQ3hBOUM4WFJlUFVj?=
 =?utf-8?B?UG9iT0NyUWt5K0ZCUmYxVkY1L1lTVU4zY2M2ckkveDBGbHNhZ3lqNlpYdU03?=
 =?utf-8?Q?7/snD/iX6ych8gDdkML/WQUQB07Bts=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dldQanFkbVpKUHRhK250TjJxUE9rS0UvVUVDazdLcTNlRVBoMXdveTFkNUdu?=
 =?utf-8?B?V2RvVGREUU1vZE43a2VpMnl5WWE4NVM0a3NLN2sxaUJHSmpJNFhOTnRIRXNm?=
 =?utf-8?B?TldPVjFNUVpGZk1FWmhwd1V5VlBoQlRKTzZPZGJyQng1TEVicTdXSVFUYnpp?=
 =?utf-8?B?Nm0zMFptSjRIZGF5U2sxSG03bnlGN1NSZWNHaXpmTS9tbmtFcXYvTmFsazlO?=
 =?utf-8?B?bGVOWlFudFZuVmVlZHhsNHA5U0FsaGczQXNkN2JEVjZRZVlqRkhKTDV0QkE5?=
 =?utf-8?B?cVFleFlBMkI0TFk3MTJJV2dKeXhWRU1DdS9RS3Q4Qzk5SXIrQkZTSFdWZUhX?=
 =?utf-8?B?UXYzckphNDFueFdUeUVXV1lGazJqZUFxNUJTSEE4ZnFLMFQ5N08wOE51dFFC?=
 =?utf-8?B?RFVWYVA2NXJsVzJUQ3FFdjFEdXRWVm5sR2lzbVk2L2RDbTJSdERUeEd5SFg4?=
 =?utf-8?B?VmVlNU1UYUpVbVE4Vk5iM1BBc1I5QUptVjBPcTNLeDVqaWJaVkY3UTNMVCt3?=
 =?utf-8?B?TmdBUEkzZVZhZ0wzZzFod2Rha0tvQkFnNnMzdDg5eVBsbXVKaFVxOER1SWxq?=
 =?utf-8?B?cTJpRVc5TFVHWnBlam4rOHJjTVdZSklWdHZYWjBEdnByTndXZmliVlZpY05w?=
 =?utf-8?B?dEptNDNmMFBsZmF6eTQyQ3BBVGViWUZMTWlFUnFacFhyakZEQkdaWmhRR0tP?=
 =?utf-8?B?SEpSWGpzeDZTcnl4S3k2TWk5dmhFK25wTVlySXY4bmVLQ3JsTVFha09yMmZv?=
 =?utf-8?B?TjZxKzhjVm5ZWVAyYlRrSFJMYVRZM2szUm5IYVhrWEl5T2VSaVQ1OGlPRFVE?=
 =?utf-8?B?Tk1RbHNMNkhwUFcyU1VvZ2hTSnhLN3dkcEVWanFTQUl3NG9pbzVySDBNb0lG?=
 =?utf-8?B?UWIvVTlOenl2YTJwMm5ZN1BQTFVqWm9aRVNkeHFEanV6VlFWVWprVTFSOVpp?=
 =?utf-8?B?RE1Ybk9aNXYyb0xZSm44Sk5UaXZ0cGN4Y080bm44VWNWUXZBQ2QzLy9LQ1pW?=
 =?utf-8?B?Sy9YRDFsbi9nK2duNS9PaUErSFpPaS9SdUJqNjFYWXZqOHJwanZ1RFVIYVJp?=
 =?utf-8?B?QnpFcFVoU1RTUTBGOGswY3AvampUY0Y3VENoU0VkQUVlSGRDZlVqbG1LY2JZ?=
 =?utf-8?B?Rk1GRzY2Z2JCWVd6VUJzL3FwbmhCL0xUSWxwZU55YTVadE1DcEVhUzU3YWk4?=
 =?utf-8?B?T2tQNThWQTh5VDFPK0RETCt6WUFwSndpYlgzYVR3MHhVcEJrQkJ3WXZ5YXc3?=
 =?utf-8?B?RkcwNlQyZ0JiS1hhL0MxVHRVUE5MTVpFTzltaXRzaXpVbjhYVG5Va2hYTzEz?=
 =?utf-8?B?K3ZqMFZZTnl1VzF1b3dHYnNwNnVTY05ZZnM1YytNN29LWlUzT29mVWxKbWlp?=
 =?utf-8?B?NlY5bm02SHE2TTFaVzM3S2lLaW1vR1VSMXNsN3VzWk90SjhldnhZbm9OR01O?=
 =?utf-8?B?SjVGQ3d6cE1MbjlUZ2JweE93ZER2TnlwNSt0YU1uMTNPUFI1TjZxUlRaM2dp?=
 =?utf-8?B?cWpYWmdBUGk3eHhSR2lhQjEvZlVKWWpJSWswaFAvRk1sS1Y0eWZPRkc5aGtx?=
 =?utf-8?B?ZnJ0R3hHZmpoc0dMQkNBbmRvQkUrM1RyVmpKeXpGNlVSclhSYUlmSzUzcjV0?=
 =?utf-8?B?eEUzbHpGQmR2WmU3Szl2YUx5bENGSmQrU0pMeEMzNnBNbTRZQXhzMDM2aTJs?=
 =?utf-8?B?TktIZHNCUkdEUlVGUGFYVlNjL05MQVUzanVLR3ZacW1DTVNJRlhLcjlyYTlU?=
 =?utf-8?B?WkpKUGFiMUNwNEYvclNxc2pCNGFSU0kvbUlqalJ1UDRpYmpqRFFzZGR1L1JM?=
 =?utf-8?B?RisydEZjcHVXeDBxS3BSWktudEZoVFRCcFUxT21ZeUxnL05Qd3BIcERsWnlX?=
 =?utf-8?B?M3gwZDRNbkRiV3Z2Z09SY1dIbWV5N0dIcGNuTzRsVHVqei9kd1l5Rk01OWhj?=
 =?utf-8?B?MHhsTVBSUWdEaFlhejZjMnJJemRub0JUcThRNGVRTmlFNC94VHVvWjlncFR1?=
 =?utf-8?B?R0tjT1d6WVB2cG52VE55M1diS2JlWWNNbkJhM0gzSCt6emtDUlIvcGdjV1dy?=
 =?utf-8?B?OUJVUm9YemYxRElKVWtmVG5hWWxldDhmaTY4SkdtWk5PNEVXSktRcGVBWlht?=
 =?utf-8?B?cTdKaW9PeDRWM1l0QjBVMDA4WFdvTk9TSVpCUXZVQmlFM3pueEkrMldVWXVE?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A37CD584CE16F742A5A59BF34D05A436@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb329289-dec0-4b75-a03c-08ddb4c33266
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 15:07:41.3302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mijuEg+WJkRm1M5+KLAbN61hOifZIpJ9UDq1JCZQ/ZrEnUguVd5xjnU4eBCeT/wewiDl22SHduilgmJDxDRPMZKmpCMlABxdj7QgBoHFSLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTA2LTI2IGF0IDAxOjI0ICswMDAwLCBIdWFuZywgS2FpIHdyb3RlOg0KPiA+
ID4gDQo+ID4gPiBUbyBmaXggdGhlIHNlY29uZCBwcm9ibGVtLCBjaGFuZ2UgdGR4X3RkdnByX3Bh
KCkgdG8gdXNlDQo+ID4gPiBQRk5fUEhZUyhwYWdlX3RvX3BmbigpKSBpbnN0ZWFkIG9mIHBhZ2Vf
dG9fcGh5cygpIHNvIHRoYXQgdGhlcmUgd2lsbCBiZQ0KPiA+ID4gbm8gbW9yZSBmdW5jdGlvbiBj
YWxsIGluc2lkZSB0ZHhfdGR2cHJfcGEoKVsqXS4NCj4gPiANCj4gPiBUbyBjaGVjayBteSB1bmRl
cnN0YW5kaW5nLCBwYWdlX3RvX3BmbigpIG9uIENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUCBvcg0K
PiA+IENPTkZJR19GTEFUTUVNIGhhcyBubyBmdW5jdGlvbiBjYWxscywgYnV0IG9uIENPTkZJR19T
UEFSU0VNRU0sIGl0IGRvZXMuIFdlDQo+ID4gYXJlDQo+ID4gY291bnRpbmcgb24geDg2XzY0IHRv
IG5vdCB1c2UgQ09ORklHX1NQQVJTRU1FTT8NCj4gDQo+IFllcy7CoCBQbGVhc2Ugc2VlIGluY2x1
ZGUvYXNtLWdlbmVyaWMvbWVtb3J5X21vZGVsLmguDQoNCkl0J3MgYSBsaXR0bGUgYnJpdHRsZSwg
YnV0IHRoZSBjb21waWxlciBzaG91bGQgd2FybiBhdCBsZWFzdC4NCg0KPiANCj4gPiANCj4gPiA+
IA0KPiA+ID4gVGhlIFREVlBSIHBhZ2UgaXMgYWx3YXlzIGFuIGFjdHVhbCBwYWdlIG91dCBvZiBw
YWdlIGFsbG9jYXRvciwgc28gdGhlDQo+ID4gPiBhZGRpdGlvbmFsIHdhcm5pbmcgYXJvdW5kIHBm
bl92YWxpZCgpIGNoZWNrIGluIHBhZ2VfdG9fcGh5cygpIGRvZXNuJ3QNCj4gPiA+IGhlbHAgYSBs
b3QgYW55d2F5LsKgIEl0J3Mgbm90IHdvcnRoIGNvbXBsaWNhdGluZyB0aGUgY29kZSBmb3Igc3Vj
aA0KPiA+ID4gd2FybmluZyB3aGVuIENPTkZJR19ERUJVR19WSVJUVUFMPXkuDQo+ID4gPiANCj4g
PiA+IFsqXSBTaW5jZSBjb21taXQgY2JhNWQ5YjNlOTlkICgieDg2L21tLzY0OiBNYWtlIFNQQVJT
RU1FTV9WTUVNTUFQIHRoZQ0KPiA+ID4gwqDCoMKgIG9ubHkgbWVtb3J5IG1vZGVsIikgcGFnZV90
b19wZm4oKSBoYXMgYmVlbiBhIHNpbXBsZSBtYWNybyB3aXRob3V0DQo+ID4gPiDCoMKgwqAgYW55
IGZ1bmN0aW9uIGNhbGwuDQo+ID4gPiANCj4gPiA+IEZpeGVzOiBlOWYxNzAzOGQ4MTQgKCJ4ODYv
dGR4OiBtYXJrIHRkaF92cF9lbnRlcigpIGFzIF9fZmxhdHRlbiIpDQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBLYWkgSHVhbmcgPGthaS5odWFuZ0BpbnRlbC5jb20+DQo+ID4gDQo+ID4gT3RoZXJ3aXNl
LCBMR1RNLg0KPiANCj4gSXMgdGhpcyBhIFJCPyA6LSkNCg0KWWVzLCBJIHRoaW5rIHRoaXMgcHJv
YmxlbSBoYXMgYmVlbiBhbm5veWluZy4gVGhpcyBpcyBhIGRlY2VudCBzb2x1dGlvbiBhbGwNCnRo
aW5ncyBjb25zaWRlcmVkLg0KDQpSZXZpZXdlZC1ieTogUmljayBFZGdlY29tYmUgPHJpY2sucC5l
ZGdlY29tYmVAaW50ZWwuY29tPg0K
