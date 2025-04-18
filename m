Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B7F1B4243
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006869; cv=fail; b=l2NJpgXRmXMOeCXZEX9IC8V7R4YcaqiPu0P2HTHkom+psXdtbUKgY/zopSMNwt5Y2BBaEhtSYjSj5ulvWXUf639vNPgKCvEx3rOxDyTkjenD36buZUkZ37Ri2na9hfDwCUORrR9vxwFH9A04zKYbtdlP6DjY7jaTS27dHvZf/u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006869; c=relaxed/simple;
	bh=mfafjai4exS/av58Yonc5/vcpRX6xJPZdhIsqTR/xsc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AJiGfCpB0iX3AGS+z7bG4/o7WTnm9h6D/A+DtT3R7f8oDMRJKOF/PlV0dFcVPJxkx77thM2MHshgvaxbCu1gIOlModsEZgLHOJ3WNuD9ZepP/Rrz+Pqqmm2XrRODYwN8JxdfDzRiwNeZtLVhHI2x8OB7PD2twsTdzqNxiCe6xso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWUmcz2n; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWUmcz2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745006868; x=1776542868;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mfafjai4exS/av58Yonc5/vcpRX6xJPZdhIsqTR/xsc=;
  b=hWUmcz2nXnjY0zyHL1uLC2mkfkSgEgJxPdl0M1Jk1d3UB1gsEke/detk
   HzqdOtatOHAH+bHho0dlfHAWOOm+H3R9E9fR+HIbn9SzlaWSVFRzpkNp0
   l283tYZ+EK+srAWRtjVDK+jg2Q+dt3qcVW9R7QV515HlI+VUiaryhTY02
   y9Zmuzby+WIW2czoTRImoyY8U1+EX8XnA0jNFar3NOfCPUiq3+5kihlLv
   7rlwiW9VlxnvBUti/x36iABI9EAXYsLJLPffU2udrDmUg8NkuNFIFl+Y1
   NETN21MERTemTd/9DTme2XfU37fJ1zd7WKM2Z245PYticC9PvYN7pWO6D
   A==;
X-CSE-ConnectionGUID: XTEEht7RTjKnPLuWKTFyWA==
X-CSE-MsgGUID: AGR0/UK7QCG8gmZeefWgGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46763681"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="46763681"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 13:07:46 -0700
X-CSE-ConnectionGUID: EIfg4Kv7QEWTgi52/bcoRg==
X-CSE-MsgGUID: n2WpUsC2RSW84Thaf8gEnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="131064478"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 13:07:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 18 Apr 2025 13:07:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 18 Apr 2025 13:07:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 18 Apr 2025 13:07:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXCk5oJK+dJN2qVPAWQ8HCVokp2GrWeV0nic664LB1gIIdAjvQIxbo1bw6pEIohC3TtUlQZWmAtVitalMmeuIXb+gpMsYD6orab3z1BeAmi5ndZVdaM0hTlkijEu1crHK0Tt8Q9Oz+3Wg/ABtJsuWiA6dXClO4eOczX2CTV7mv6ckLOKzkUI5Aj0LQT9VqB5IXS6UREgZ+nMOe7PatobnhXWrIs9MMyk83/4G2b9Q+kxauFBY+cG14/l3v1NzVRRbDrfmiovar+KDQTUnNb3d8Cju/IuJBod/JUVTUnh0AwYHx6kDncNHeoz8jbkNfqTMjP3w6w7gF4onzs0ZT0RxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfafjai4exS/av58Yonc5/vcpRX6xJPZdhIsqTR/xsc=;
 b=iTbojYGPYZRtb/TwuNn8TLheMaIp/8yA7pbM7asy+hf8MwZSWcj8Ypk+SM0+MCGdivPJ0GYNtpKgcStoIr9cus1UyGwGmfmbYbTsi7Cb0b2eKNeNdrrHRVYI3C1rDtV2/KBkZWaieHTxvurYV2/0uFN7eZfzx7pJNTpB1xO2zpgVDSm2AFJWqW2n8MAs6ieSYxStE2WN1WDvUUhWsSgsiMHeXTbIyZ4QiOGXNYySUCFIapqDDFeoQEpbZF2NKXcQ/pkk5R+S8zcy+sTPTSl9JnRmnNMUuLYp/3YWX+EpArAETCrkYxQmC3EPSJgz6xxn9tpvwwWnm4dYYC2TZYtg0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Fri, 18 Apr
 2025 20:07:29 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 20:07:28 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Hansen, Dave" <dave.hansen@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>
CC: "luto@kernel.org" <luto@kernel.org>, "jgross@suse.com" <jgross@suse.com>,
	"x86@kernel.org" <x86@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "bp@alien8.de" <bp@alien8.de>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH 1/2] x86/mm: Kill a 32-bit #ifdef for shared PMD handling
Thread-Topic: [PATCH 1/2] x86/mm: Kill a 32-bit #ifdef for shared PMD handling
Thread-Index: AQHbsHpx1Cj8qlAk9E6LeEPswtNoQbOpu5+AgAAIkgCAABXeAA==
Date: Fri, 18 Apr 2025 20:07:28 +0000
Message-ID: <c620decfd3eb00df2aef3be5bdd98cae69916da4.camel@intel.com>
References: <20250418155612.8F276BC7@davehans-spike.ostc.intel.com>
	 <20250418155614.8F925958@davehans-spike.ostc.intel.com>
	 <3a14471baa1fe0803a27922fe9bd929a0062f780.camel@intel.com>
	 <a2f144f8-09ae-449a-a005-bc8d76dd0260@intel.com>
In-Reply-To: <a2f144f8-09ae-449a-a005-bc8d76dd0260@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CH3PR11MB8443:EE_
x-ms-office365-filtering-correlation-id: f0a06013-a772-4727-8b2c-08dd7eb4a553
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?djIramdrdU50ZldTT2ZmbTIvTGQyUERpMHdyV3FuclN2bXp1cTAxTTVHQXVM?=
 =?utf-8?B?ako3bzhIMWhXNHQvQ2M2Uitsc2ZtT3BnQ24vWlJ2djVWV1VXWWVSLzVFZnRh?=
 =?utf-8?B?RHJVSERuLzkxR0NmL3lMMHM4NXZvRTRNS29Md1hjOHVMbllCMHl6TjF1STBK?=
 =?utf-8?B?RjhsUlZobm1UZG5CckZtd0RMelI3dmlGUzhhT3llV3F5NDNER2xBb0Z5dlF5?=
 =?utf-8?B?ODZ4KzFWMGtBeXlRSDc1Z1l0VStmNXJ1NkhPajNTRFpDYWNmN3VWak4rSkJX?=
 =?utf-8?B?ZHRnOXRwdlpRY3pFc2tpNTBrSjJiOWt4Q0pZUGkzMnBveUV2dFllMFBLVzFq?=
 =?utf-8?B?a3czVFhtYk4xRFRCN1hhNWtmR0lxbVgweEE2ajZ4TVNpTGFLUktrZnlTUVhJ?=
 =?utf-8?B?Z1NVSGZzTWRjSXJQYk4vejdsODJVM21JY0JONldqUGkwYVVSK3pHZWtvdEVt?=
 =?utf-8?B?M0FDVUo5YW9CcXBuZXBZdklab2ZNdlU5NHM3ajdWODZKYXEwTjRnek9ZSnZl?=
 =?utf-8?B?bTFxRHRjVCtybmtRekdzTXRtNlMvTFNsTkdBTVRKTmNtaC9zSjV5MzNVcHg1?=
 =?utf-8?B?dDJzU0NkZko2Q1JqRCt1bE9TS093K2FIVEw3bktMSmxYSTF3NnBySllBcnV6?=
 =?utf-8?B?NDVneW12M3dTZExDdVFqUlRBZzF5dWp2WERlR2NzYmVlZHkrZHhiSWYvM1Fy?=
 =?utf-8?B?ZWVoMVlUYit0WENLK0c4eHYxUVJ6Z0xHemFmL1ZnTmlqVDdLWC9BY1JtQ3E5?=
 =?utf-8?B?MXlCem5seXYrQVZWNzdNNklwTU1xQ01iUE1zZjlSMFVZU25wTVlNaHFiZjhm?=
 =?utf-8?B?eEpHTytVVzd2M21QQWI0eE83cGd5RmpLdXh0d3JIUDB1SDZpY1g4Q3ltUElG?=
 =?utf-8?B?SjJmdkh3ampieWZjbzY1MGkwRnBQRmRJb3BMNExmcCtxd2krYkZsK0xodHlG?=
 =?utf-8?B?aXRlZ2VxVkhsWGxMeEQ5eVhlLzVHbjd5ZzMxRWpUUHZmL1F6ZENZUTg0WGlN?=
 =?utf-8?B?ZlBFWWJqNFkySStidUhORThnTTVIeWFUYm9BelMzclJQRjMzYjNJRkl4cXlV?=
 =?utf-8?B?VDNMaTVpVHBGSE1kdXl6MGVBVFhVVjd5NDQ4TDRxUE5VSUtaR01Kbm5Sdlp6?=
 =?utf-8?B?VnB4ZUN2VTBxMFMxZUdwRWkydzZqdXJLM3liSkhHa0k2TUZYQnRwZnpSZ09s?=
 =?utf-8?B?UXA0TG1FTzhmK1FIM1dMaWFaY0c1dm9QNmEyNjBHZC9HbEVTSjZrcStOa0tq?=
 =?utf-8?B?eDJRR0dxMU1xWDJWanVwdHZYYmloQ0FKcnhqaFVWWW1ZUlpUUWZQSnhVVUV4?=
 =?utf-8?B?dGhzSlVuamZBcnpXc3JTTXZ2N0RVV0g2bExhdTRjNEVxeDk3cEw4aG91Z2di?=
 =?utf-8?B?OCt5OHlnejJHY0xQYVl0eE1OSzBpbmdZbStqYk9VSUNLTllwWmZQL2FGNFF4?=
 =?utf-8?B?YlArVzAvVmR3VUNrTnArSHp4WndQNlRYS2JQN3h3OUtvL1BIWkFzbzRTdXAz?=
 =?utf-8?B?dFkyc3FmdWxLbkFqbGNWaFJadTRUUTlDRUl5SUhJRUlMSVdleVJ4VE5Na3Q0?=
 =?utf-8?B?dGxDeE9UZ2Y5aHZjR0VUTytoVU4xQ2NacUdhYjZFMDA1OWVITWpmRUNuc25m?=
 =?utf-8?B?LzFuVTVzRjl5cmNHVHRWTDloV2dFS1FKVmkxcUNPbk5nOTNGeS90NzdySGtz?=
 =?utf-8?B?SEo2b2NlTi8rQ3pWQ0V3QzNLYXA4cnR3QnA1Q1Vqb0hQUjQ1dTZPWnVZakFp?=
 =?utf-8?B?c1p2WU9jY0VXMDhiWW15UzNROUdod09UNmxsd1MyeWZsYmk4ZXc1YVdsWjEy?=
 =?utf-8?B?V0VweW04c2dFazVaZEFFZHlZZ0FnV3JXTm5MeDFtbHdjYTYvVFBJQjZjWGcw?=
 =?utf-8?B?UjJYbWk3L1h5emdiZ2JyMCs5WDZ5NVZxK1czOTM5ajIvMzBieCtpZVZuVy9s?=
 =?utf-8?B?c2xtenBBNDNxb1dubW40d3lPa2hUL1V0UThhMnBCWnFSUG1Nb3FVcy9rS2JZ?=
 =?utf-8?Q?qfETQYD3Lh/wgaSH7AwwAnNg8A31qA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0VISGl0MDZFQ3dycFVvUnh2emxQNWRFVE1mY0graklZSDZxR3FzcXFoRUF1?=
 =?utf-8?B?YWNGS0hsR3BiMFpNUWRlQUNEMEx0MVpaUkFhaWhOSTFiRWxWc2M5WWVpVlRw?=
 =?utf-8?B?eUc4bkEvbnJYTjhsTlRqYk83NjE5UzBZQzZ4SVZiQ3dHemVLMHJ1cmhSR1U5?=
 =?utf-8?B?djZpakF0eXFCd3lqUm5HaGkxcERkOHVLU1k1UlVMSFJDMFN6R0ltMnRhTUlR?=
 =?utf-8?B?ak1nUFhjQjdzclF4dTBPbDNhTVlhU05Kd1ZNWlZFdXRtWlRYNi90RHRZUXMx?=
 =?utf-8?B?YjIvY3ZBRjhvTmZuc0NuYjZqSTR6cmRndlE3M2g5RWtwRUhLaVJXVFZEa1Ar?=
 =?utf-8?B?S0RGNGE5MG5LWHFzOVFPUnJLWXZnVXY4N1gzQXdoODVmT1h3KzRRdzhMWlcx?=
 =?utf-8?B?L1R4bCtSOTZ4ckQzUVlhaWs0RU45N1RhVkszRW9xUTFOcjM2cUtFenU1aXlZ?=
 =?utf-8?B?Z1J5Z0I2ZVh6RW9NR00xcDRsSVUvTW1NbUVRWmhBU2NDd3Vjd3NuZkVTUXVD?=
 =?utf-8?B?UC9BVllUVTNISlFZYXJ4U2JnVWNySE1jaEJPamZCd2wwRTh6VG8wTGk3c2tW?=
 =?utf-8?B?QTZ1N2liTVdWc3QycXc5Z1gxdEI2K1lyK3c3VjhnWjZOREF6cmFNZHNVempX?=
 =?utf-8?B?ZitOSjFINjlmRVl2cHhwOHBQUzZLeGoxd2pLSzc5aVhoTE4wRGF6WlNDQ016?=
 =?utf-8?B?LzVJbnczYXpJdk8zYWlUakZQdFFEQ1I5ZmprL2FIdlhmUllya0crU0dWdDlI?=
 =?utf-8?B?QWhKVGUwODI4UmpHZlBTd3BFTURwcTZWMnJKdzdvYTkyTllMbEhFRGZrTFo0?=
 =?utf-8?B?NVVHRlZuOWxqOXhZcVd0U3FXd2hTaEY1S21LeDB3YkJRb3lUZzh6TjY4VW5p?=
 =?utf-8?B?b1pTM2ljWTdTeTBXTHlkYWVsaVJ6SEUxRUhvb1BLL2J2akg4YnNXUHl2akZK?=
 =?utf-8?B?dG10ejZLYWExUXpQU2NFcnNueUduVTJvQnlscmcyblFiNVNjYllMY0k2aG42?=
 =?utf-8?B?V1dqZlo1WE52TGg3NGlPV0FkUXNSSGdKRy9Gb0xLZzA2ZG14bUlOMVZiaFFm?=
 =?utf-8?B?bDJxdWJHY1I2bVJsOUdBdHpENVR0eGR1cEVISlY5R1gvNUF5ckpUS25YV01I?=
 =?utf-8?B?dy9BbTZxcHlHOG5hYXQ3WEZZQ0dVQTJ1U0lpeTFLeDRVTVdtZDJGYURsVFBZ?=
 =?utf-8?B?cUZLVitDUyt0bno1OEt3QzEwZVplc09pRURKQWZKRlUzVG5US2dDZGVtSGRL?=
 =?utf-8?B?a2ZFM0R6bTM1UmN5YlRkRk5ycGo0VnVFUUlyWlg5VU9IZlJrYUg1WlZrQ3pZ?=
 =?utf-8?B?eDZtTFFHNEpWSDJhVFI0TXlLbjZ1OTJSaUs4ODc5Skg5WXBDa2JFM3ZNTHoy?=
 =?utf-8?B?R1lXRnpmV0lMbjZ6eml2SHdWaFFiWVNnNVBKcUphblFLTk8vL3NxTCtlYm5t?=
 =?utf-8?B?S0laOVlyOHhDVGpwSjN4b09RajhlNE9aemsyZnFLWmZZWlQ2RTdnbkhNS25l?=
 =?utf-8?B?WTh6ZSt4VU16NjMwUFVURDgrZkRxSGMzQVBYeDRSaGlkN2hLSERpSncwZ2lO?=
 =?utf-8?B?RmFJU0JtbDFaenN4b211ZHdoNy9ZNnk0YUpFdVRnVFNQZnpEQzVOa29mVlFj?=
 =?utf-8?B?dEYyaFdtcVo4YXlSdkk3cXo2dk5mbUwwRktJN0JRWDVhSWU4NUxjUHJPTkQr?=
 =?utf-8?B?aFM4TUxlOGMzQys5MkFTNzNjWUlud3ZMV2lGYUNuWFN2TlFuaVVocDR0Tkg2?=
 =?utf-8?B?b0NSNnNibUdRV2k3MCszWFBZT2VxRlFnS0dSWXYxVEp3eEc0KzcvTCt3RGNU?=
 =?utf-8?B?bjNBWlJMa0paVnk4WWtjMEZwM25iZExHNGorQjRKMDBTRVFSdVB5M1NDWFZL?=
 =?utf-8?B?clplOW1NK3NORk8yejgxM3RXS0ZnYURyaUl5NVI2ek5veEt1Y0ZZQmZJM1Fr?=
 =?utf-8?B?WW1pMUduYUFoUGRtRzVhR2NvSUFKS0tVUXRMQWhXTjM1TExoZ2U5bDZwWjlW?=
 =?utf-8?B?dytnL1JicGsyY1o4eXRoVVpBSDZsSXFjQXBURlFVclhvUitBcmhTdXFPVXhU?=
 =?utf-8?B?TFZzSFBDWnEwWTFNT2ZKaEVuK05VQmNUUFEzWWt1dnhabm52U0UvT0FZd3lH?=
 =?utf-8?B?YmY4ZVJYdDVkdWFDNDFVa0UrRjNZSWt3cFlEUC9UT1pIcnIyMzRDSGhvQyta?=
 =?utf-8?Q?uUmES6+RdsF9xxsHEEVrGvg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC4BB0B17D36AB42A13CB14D901308F1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a06013-a772-4727-8b2c-08dd7eb4a553
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 20:07:28.9063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5b4C4aaslS9wuvkzgTOE5oieOBJk6DhKsfVoGlmRzka2StWKXJ99huJzMFSBSNKg05Sj3Qag/66UW5FVN2vyRewJK5aVgXNpOQkp6fFZltQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8443
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI1LTA0LTE4IGF0IDExOjQ5IC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4g
SSBsaWtlIHRoZSBzdWdnZXN0aW9uLiBJIHRoaW5rIEkgZXZlbiB3cm90ZSBpdCB0aGF0IHdheSBv
cmlnaW5hbGx5Lg0KPiANCj4gSSBldmVudHVhbGx5IGRlY2lkZWQgdG8gdHJ5IGFuZCBvcHRpbWl6
ZSBmb3IgdGhlIGx1Y2t5IGd1eSB3aG8gY29tZXMNCj4gdGhyb3VnaCBzb21lIGRheSBhbmQgaXMg
cmVtb3ZpbmcgYWxsIHRoZSBub24tNjQtYml0IGNvZGUuIEl0IHdvdWxkIGJlDQo+IGVhc2llciBm
b3IgdGhlbSB0byBpbnR1aXQgdGhhdCB0aGUgY3J1ZnQgY2FuIGdvIGF3YXkgaGVyZToNCj4gDQo+
IAlpZiAoSVNfRU5BQkxFRChDT05GSUdfWDg2XzY0KSkNCj4gCQlyZXR1cm47DQo+IAkvLyBjcnVm
dA0KPiANCj4gRG9lcyB0aGF0IG1ha2Ugc2Vuc2UsIG9yIGFtIEkgb3B0aW1pemluZyBmb3IgdGhl
IHdyb25nIHRoaW5nPw0KDQpIbW0sIHdlIG1pZ2h0IGV4cGVjdCBzdWNoIGEgcGVyc29uIHRvIGJl
IGluIGEgZ2xlZWZ1bCwgdG9sZXJhbnQgbW9vZC4gQWxzbyB3ZWxsDQpwcmFjdGljZWQgaW4gcmVh
c29uaW5nIGFib3V0IHNpbWlsYXIgY29uZGl0aW9uYWxzLiBJIHNlZSB5b3VyIHBvaW50IHRob3Vn
aC4NCg0KDQo=
