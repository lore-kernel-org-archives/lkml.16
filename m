Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D703B2248B0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260606; cv=fail; b=aB3TyE8VHJdIurtsV/msQ0HE3kuwYDQOuWa6tC8eG2lsBoe1GLhYjEcmQbTC5+b2e01BlnL80GEqzXJfG5PwoJYOAGOOirXcAPvtz4FWJ7rkhDbYIfQ8HN6gJuyYZaYYYTZ0yBhvHq+Uv2KQDyO0du5vH3cuPX4rRsGy2hS7Q4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260606; c=relaxed/simple;
	bh=PHX6e9XmQWI4wSsPoGLpb0liswVUe4Q7r1hxCTsCZ04=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oKAvol6FpLL+1fs1GxXgE8+jqrTEK59yE2OXdDGgE94uZwDwUIbdw3G6mMkXBU+CaPNxq1QFa4n0nJQM2QbjiyUWpnjrdG17RY8vUSbwGE0O7A7mbDxtjEmERZ9dy+jWeXH4z61uqzPc6HLHsjUaagKo9CZ7UTexy3f1NdHwDKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhzHaYLh; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhzHaYLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747260605; x=1778796605;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PHX6e9XmQWI4wSsPoGLpb0liswVUe4Q7r1hxCTsCZ04=;
  b=hhzHaYLhBJzpxWolrvLtimMcb3QAk8CcZLo4qf8f4aENB3IPTIxhSJie
   oaFlB8klCl9hYoQNMaMwNNvrakoHhhct7xBlcfmXMCBMGPFZ3z+8P8Jf4
   rhCNVj5tjlbXwBvATcjSKeuwXeFv74U8d/LcmhRslnH23H9B6nbp74R3V
   31dHPdvnCkH0WF6QAjseylLWh1U3vrWG6tj1wdrEfPEXVxc2DFY3qSqGx
   XNLS7hxYsirpsYui5moEVmf6AJ4iwWJbsTdXHlEQ23yTsv7hk8alGh0wJ
   5cBLCx+QL6gPEIEg9llO6EJok9GJnhIjk0/dx7OikMaqcNK/OD6I3YVYH
   w==;
X-CSE-ConnectionGUID: SyyJqUjWRZ2SYzNrIvEVAg==
X-CSE-MsgGUID: f4dX2fODSnuZ2UIHiJbnEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60582050"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="60582050"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 15:10:03 -0700
X-CSE-ConnectionGUID: AvcgBkBzRseukWup3JOk4w==
X-CSE-MsgGUID: i7nbTQZYTX+Ns2nb9TM/4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="139172901"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 15:10:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:10:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:10:01 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:10:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unhHFGVPSat4Di/2Uja7XnqFFmP+dQNyqCOr4XB6srZ8EEJdMxmGzNXfcHmVWfkpqjgihOsvzgzmVVTjkHqyu9mvXxTNuIyX4fyOlOFAR7tzI3DYqAUV+ePBLgIZqq9O2DI89643tKGaol/96xNH3hahXlHakgSjMQ/0fB7b+4p+iJNAaZiO31E/bDL9/qcHCStnPP2jsJqfOLCs0aXGMIWTtJA0RIYDUodlBhJNhNlH7Q+PQwVaJeosCyjGhHgsskJkLVClYwz3HCBqamJmeM57yslwwnKGt/WvWBcGUTxB2+WE0ANx84Pit3gyr8yVCX3BzrlxOkM7YwOWO3mo+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHX6e9XmQWI4wSsPoGLpb0liswVUe4Q7r1hxCTsCZ04=;
 b=a9A49aWkW1dcIZYH+eLfaKUfMOqBJma6lhy0xLN0lGyfEnutPEShlbfG64227gOl9oKJ3yj8Srac1iJJZmwViVSt0e0X063IN4WyJdhPxC5PW+A8exDUW0gAmhjP0ef3VdI8jVwOKNw+issNBOcUhmbNLT+M6lzTDtwlfwDQagZjjvqN6xKm/awCEBxYXmeXw317Nqaul7Sam4kCXvCfarzf2KxmkhhMQY+/eMM4/NJcf9m+ivNYQIW+MPjy874fLwjVVxhaM8rYIWayEt/QW9k7L/i3QBxFctuy9T/Sz5wl1dbmcMsQWauAe51fhw7FE3rXW00uTFwrlJlNl+Zq3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3303.namprd11.prod.outlook.com (2603:10b6:a03:18::15)
 by PH3PPF307806035.namprd11.prod.outlook.com (2603:10b6:518:1::d13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 22:09:45 +0000
Received: from BYAPR11MB3303.namprd11.prod.outlook.com
 ([fe80::c67e:581f:46f5:f79c]) by BYAPR11MB3303.namprd11.prod.outlook.com
 ([fe80::c67e:581f:46f5:f79c%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 22:09:45 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "peterz@infradead.org" <peterz@infradead.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>
CC: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "seanjc@google.com"
	<seanjc@google.com>, "x86@kernel.org" <x86@kernel.org>, "sagis@google.com"
	<sagis@google.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "Chatre,
 Reinette" <reinette.chatre@intel.com>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "Williams, Dan J" <dan.j.williams@intel.com>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>, "ashish.kalra@amd.com"
	<ashish.kalra@amd.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: Re: [PATCH v2 0/5] TDX host: kexec/kdump support
Thread-Topic: [PATCH v2 0/5] TDX host: kexec/kdump support
Thread-Index: AQHbwZtbGZeoyLnlbkGa9srHpvt1sbPSFsWAgACfzQA=
Date: Wed, 14 May 2025 22:09:45 +0000
Message-ID: <cc060b97dbc56b5a7547d92ec0e624b7686fd55d.camel@intel.com>
References: <cover.1746874095.git.kai.huang@intel.com>
	 <9a88386d-6610-9ff3-2a71-42961e7168f3@amd.com>
In-Reply-To: <9a88386d-6610-9ff3-2a71-42961e7168f3@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.1 (3.56.1-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3303:EE_|PH3PPF307806035:EE_
x-ms-office365-filtering-correlation-id: 1e7a7de8-1f83-4ef4-f849-08dd933408fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eEZQODVCV1U2ckVDdldKdTVmUWdheEJhekp1ZUQ1VDdkM3hKcUlSMDNLQWta?=
 =?utf-8?B?SzZtVDJDNGM5Uk5PRFQ5cmw2TGs1bmRwKy83bTlWZ01rNVRXMGRlellWQVp2?=
 =?utf-8?B?K0p3QWVEeWxNMFN0azFLa1NuNDd1M3owSGRDeThvakJhZ2xCYktOZFIzd1V2?=
 =?utf-8?B?dVhkcjBYczBHZUVRNDl2RW1LTW5veXlUQkZlVFFCTEE2YXJ6cUxSWGpkMjhj?=
 =?utf-8?B?N1hlOVZLVk9SVXhwWW01Zjg4clFUMXRCWU0zb09mNit2NzFEMlFNM3JSeTVF?=
 =?utf-8?B?MWtSSlIvSXMreGV2bHh1U2cvU1B5Z1BVTVFsOE9hb2pMUFYrQ2VjNWIzOW92?=
 =?utf-8?B?Y05keFc0QWo3T1EvUUNwMjBJMWZqcm1oTWJXMGRJcGlkMFZwNkJRRDYyOHdO?=
 =?utf-8?B?T21WSzhnYVVQYTlWVVRyMUtwbXlkWXBQOUNDWFVvcmZJcCtXczZhTk0rZGZT?=
 =?utf-8?B?UmtMN1B1L29mRk0xa0RDUUR5ZnhKNzIvWC9OcE1JY1ZwTTE1MlJMQllwdlpK?=
 =?utf-8?B?L1VaNGlSRS9XNXNlTmF2WkdFZW5qUDd3VU8ydUVCQjU3NWNnVTFjcEMyYWFF?=
 =?utf-8?B?QjBteHBIakFKR0Ruektjc0UxSysvZitNWnRQRUVvSUcrbk9DdjhUWmRpK0Y2?=
 =?utf-8?B?N3Nob3NRU1RxNXplUUg1N3l0S2lOWUVFbWhxZjUvY3F5cTh3cW8vQ3Nrb211?=
 =?utf-8?B?aEd3czNTTmFQZC9GTEtpVUk5cHFMVXpUaHlrQ1NhbE1xOFkzQnVuOEc1Si9S?=
 =?utf-8?B?azI2ODRUNGJETng2VHFlS1ZDWlUwN0pTemExUVI1QWJWUXNyWmQycHQvQXFu?=
 =?utf-8?B?cjRGYmpQa3hpSDhORHhTekpaZVByK20zUkcxb2lwcGFTOFBSeUR3Y2dpSjRI?=
 =?utf-8?B?eXE4SmxzSWh6UHNWZFM4MWVQS1c1SFlWbjJQSlA1bjF3cGFEUGJtTVc4Y3ox?=
 =?utf-8?B?OTAzTUl2K1loU1VBNmNkcWMyQ2E1MXIyWGJ5ckNYS3gvVUNyenFJN2c5NnRD?=
 =?utf-8?B?U3U5eStjTFZUN0wveXcwSnNSWFNxZmdUNlBJemVZWDZxSGpkS0NDTUpmMVFZ?=
 =?utf-8?B?QUkreDExSUxEaUtyT0w1c2d2V0RTNGhiVEt0aHpOR1U3MEhZSjBSYW16aXdU?=
 =?utf-8?B?cjE1YmN4by9sTGtOcTF5ZXFRYmZ4SkswTnoxcFlyNWlzSWh6eFVlK2JqeUN5?=
 =?utf-8?B?Q3BUeVhiUGYzRU1hQVl2c3RtVzNtL1poK2Rma0hYTXR6TnRjSkpNVFRQZGt4?=
 =?utf-8?B?TDhEZjU4RklhT1lSVU4rSGdzOVZleDYyV0dhdU54U0JIWHpmSGZlY25YUlRv?=
 =?utf-8?B?cm9LTUtYcG91MVZ3VXBXTXFyYkV1RkpRSjFDOW1BOFlTOEJJTXI3TWxzclFZ?=
 =?utf-8?B?L2hBNVI3VVRwbHBveWVPbHZDSXQxMklLakhTVmJ1ZmVWb3JnSkh3aFVIeStm?=
 =?utf-8?B?VCszV3RvUlpLU1ZxNlp2RXlwT0lGMWpJMm1YWnFXV3B4T0t3bS9iRE5od21n?=
 =?utf-8?B?ZmhFNll2SzliRzFzUllCRmIvdmpqc3cwaFp2ZTJPV0pya3VVR3FIYWtabC8w?=
 =?utf-8?B?T2FiRDdmRy94ZzdBR1huZlFNYldvOXA2WHdkODBIdElVemVLYjFGbzJLb25j?=
 =?utf-8?B?NVdnOVlGR3R2MmNQVTVzamU2R2NtN2QrYlorTU1Bc0hFc01mS3k5RERraDVm?=
 =?utf-8?B?SEVtU082K2hTRXlIRDFNN3R2bEZabmRuK3UrUzVqNnQvUy85a28rVkVlY21x?=
 =?utf-8?B?emYvNSttOUxRdk1SLzZlRXRZWXovcUljS1JSdlJaQUhuQUVxc0FBRU5BTG1D?=
 =?utf-8?B?dGV2MmFPSGFXQkVTdGMvUjc3clFPSU5SZkhRQU1OZEx0L1NIVGVzUDl0eEk4?=
 =?utf-8?B?V1Rha3dGUDNIbkJLdEtvRlZ6YVoreHk5U1FldFA4NFJSV3MrNXFqSFVDclFh?=
 =?utf-8?Q?BJS7QOUBIX5JTEFjZvOL0aB3OBLBvtgo?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3303.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEl3U1kvaWNmUGlQRkNWeC85TGx0VmxhQkxPRnh1L3I2VjNuQk1BQzkyUUNB?=
 =?utf-8?B?NTIxeHlzQjBTQldxUU5LeUxkbGFnU1VSUi9hZ2phcWhqSmptcXdBSlRXaGJk?=
 =?utf-8?B?OFFxNS9Ralgyb21wcEI2OUR1Z2x6Yi94MUdBM1dxRTk4NFNkY1p0elR0NU0y?=
 =?utf-8?B?VCsyaWVNUDBWOTZkbUsyenpCRElUT1pzWUo5dTR5TkdUUEVMZTJCbGpaY1dQ?=
 =?utf-8?B?Tmpvd2JuQ2szaXpkVGpVVUMrbkN6dnV3TlpkaFJOYUgrUjdPRmhrT25JSStt?=
 =?utf-8?B?ejNsZUt6WU1rOG8zQmJ5V3E4blYvYUp3ZEhZTUxRQmcxMk51bldEeUhSY3FJ?=
 =?utf-8?B?QXFXVGhaTXlkRjJYRitjSWhxTVVVMGt0OE9ocHArNTExeWFXRnBnY05meG1N?=
 =?utf-8?B?c2RjUklQUEQ3UG9NSktibE0vMW5jZXRvSFdGOURINitsLytyTFBKRnFyM0J4?=
 =?utf-8?B?OXdORWhmdHJoeGJEZS9qS25oZHpPY2lxcUhub2JKL2s3T2pxdGtvNGs0VG1s?=
 =?utf-8?B?b0F0NksvcWk2YjM1cVJtUTl5RU5WbUdtcXhEWFM5cWpDT2FGbGNyUnBydHJP?=
 =?utf-8?B?bk96L0tKL2pqSE5XN3B1b3IwNmsxMDg0QndPMmpHVG56bHFzNE16aDVkeC80?=
 =?utf-8?B?VWVTdytaNVl2TmFNSDUzZmZGemtHNmRNT2I3cVMrMmJwdm03d3pyT0hwa2Q2?=
 =?utf-8?B?TWhWRGsvVjNBU1A0T3N5c1RVeTFzalJmSS9Ba3diNENlS0pjUytLWDFNYkRN?=
 =?utf-8?B?dlQxMXZPT0Y0c0NSNmlUTlM3dFAxZjJISmJPS1BoOVZ2OHdmcmxuenhqaTJU?=
 =?utf-8?B?bDkwN0MyZEFKT0RXWEdWNFhwdFlqTzBBMkFKRDQ5Zkx2UDRWeGdMQzhqUXhS?=
 =?utf-8?B?OUViSnR3M2dKR28wWnNrYm9tU2VXeXFCemVoNmF3RTEvQ3g2NUFBVmdSTEV3?=
 =?utf-8?B?NXdqejFya2JnMXBsanovN1Z3QjlvQUhURzM2b1Nkbml5RHJveFNMcWY4QzhJ?=
 =?utf-8?B?WG1JRElBYVo4R2FiZkJpYkY0bnZHLy9MN0d6L1djM3VzeUE5UjMybEwyQXdT?=
 =?utf-8?B?NFQ1T0dveWJML1FSNk1wUUhQS1A5Q2dFc25TSUIwdHNzMVRDSmlzcm9CNTVC?=
 =?utf-8?B?MDR4OEZYd3lKZHpqeTAwdEIyNTRXdGxsY0FwRjA4OFJ5Ukg5cEhheHR5VFVK?=
 =?utf-8?B?eU0wTW9SRlhlUXA1RXdmcW9meDhVODlwNmE5SmRSdE5jMldXY3VmcVlTd2cy?=
 =?utf-8?B?RTRKeDhNeFYwMHkwc2xGR3J3VkZWT3pYTll0SXU4TTA3WlErRXhWSUhwTUo1?=
 =?utf-8?B?c3N5YTByei9BSldTa25JU2x0cDl5TTlxcTFhOGJPRXFDd25SN3Y2aXRhK0dG?=
 =?utf-8?B?dEtBamE4cXQ2ZUVma2tLYjRhY1pJb3R3L2FneUJ6bUZLQVppeUZWQU5selBl?=
 =?utf-8?B?SytJQ1hGc3YrM2ErTlpSVCtMd1M1ZEFXdGxQQURqVG00NnZjMGl1M3lzM2dY?=
 =?utf-8?B?WldGVEpSM3NyWk55cWVaV01LSDQvL2crdjR1QWlTd0hZL1I4aG11VFBwZGhS?=
 =?utf-8?B?UVJrZjlTNGwzdDJ6alFFUU5KbDEvQUtLOElkOFNTWFp0bytKU1VKOFB1NTlx?=
 =?utf-8?B?RzlBbFpYYzJFTDM4UTl6S0ZETGRLZDZHckZ1QjBhQzVPV3pXMUY3QkloVFoz?=
 =?utf-8?B?OGxQSzg1VHRZR0ZCRVNLVkdIN2k4aUR5QTVaN21KSG9Tcm83N1dPYjc3RDdC?=
 =?utf-8?B?R01CZzBMLzNscy9ITW9CaFF5MEV2cmNIcFFhbllHaXVmdVRiZTV5T1MwVEh5?=
 =?utf-8?B?SE9BS0ZCQmZaS3lhOEFSazY1R2R4eUxVYVFGMm5sOHFmMVp6U1h6VFRDSnNk?=
 =?utf-8?B?aTUwbFZadlRyYmNLNjltMldBZFF4UkRqTlp2R2lxSzkrSTFaN2FFRStsMC8x?=
 =?utf-8?B?WGYvaTc4cm5jL1YvL2xydkl3d0xBTUIxUHU2OHhXVTRueVJya25aRmhLZnZG?=
 =?utf-8?B?dkwzWVBCUTJkQ3VLZGc2Vng1bmhMK1BvKytlNmVSSWZ4ZEdUUXNld2pTZThv?=
 =?utf-8?B?SjVCRURRT0FmWmQ1ZkNRVlo2YmFDY3pCS2ozbmdRN3hCZ2kyK1hsSGtUaERo?=
 =?utf-8?Q?jVVA4skgCywHGo4rCg8NchaT7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1557184A875185489EFA85C69FDE000D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3303.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7a7de8-1f83-4ef4-f849-08dd933408fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 22:09:45.4217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qICzdu8IUvy11JYEFd8NOhULF34/Rq8EQqAZzquU+N7ngat3n0KTlht8buDavm/xr+JNbprqv/pu+JWoDV7siA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF307806035
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTA1LTE0IGF0IDA3OjM3IC0wNTAwLCBUb20gTGVuZGFja3kgd3JvdGU6DQo+
IE9uIDUvMTAvMjUgMDY6MjAsIEthaSBIdWFuZyB3cm90ZToNCj4gPiBIaSBEYXZlLA0KPiA+IA0K
PiA+IFRoaXMgc2VyaWVzIGlzIHRoZSBsYXRlc3QgYXR0ZW1wdCB0byBzdXBwb3J0IGtleGVjIG9u
IFREWCBob3N0IGZvbGxvd2luZw0KPiA+IHlvdXIgc3VnZ2VzdGlvbiB0byB1c2UgYSBwZXJjcHUg
Ym9vbGVhbiB0byBjb250cm9sIFdCSU5WRCBkdXJpbmcga2V4ZWMuDQo+ID4gSSBhcHByZWNpYXRl
IGlmIHlvdSBjYW4gaGVscCB0byByZXZpZXcuDQo+ID4gDQo+ID4gVGhlIGxhc3QgYXR0ZW1wdCB3
YXMgdG8gaGF2ZSBvbmUgcGF0Y2ggdG8gbWFrZSBURFggYW5kIGtleGVjIG11dHVhbGx5DQo+ID4g
ZXhjbHVzaXZlIGF0IHJ1bnRpbWUgd2hpbGUgYWxsb3dpbmcgdGhlbSB0byBiZSBib3RoIGVuYWJs
ZWQgaW4gS2NvbmZpZywNCj4gPiBidXQgaXQgdHVybnMgb3V0IHRvIGJlIG92ZXJraWxsLiAgRGF2
ZSBwcm9wb3NlZCBhbm90aGVyIG9wdGlvbiBvZiB1c2luZw0KPiA+IGEgcGVyY3B1IGJvb2xlYW4g
dG8gdHJhY2sgdGhlIG5lZWQgZm9yIGZsdXNoaW5nOg0KPiA+IA0KPiA+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyNTA0MTYyMzAyNTkuOTc5ODktMS1rYWkuaHVhbmdAaW50ZWwuY29t
Lw0KPiA+IA0KPiA+IE9uZSBhZHZhbnRhZ2Ugb2YgdGhlIHBlcmNwdSBib29sZWFuIGlzIGZvciBU
RFggd2UgY291bGQgZG8gb3B0aW1pemF0aW9uDQo+ID4gdG8gZG86DQo+ID4gDQo+ID4gCXdiaW52
ZCgpOw0KPiA+IAlwZXJjcHUoYm9vbGVhbikgPSAwOw0KPiA+IA0KPiA+IGZvciBhbGwgQ1BVcyBh
dCBlYXJseSBzdGFnZSB0byBhdm9pZCBoYXZpbmcgdG8gZG8gV0JJTlZEIGluDQo+ID4gc3RvcF90
aGlzX2NwdSgpIGF0IGtleGVjIHRpbWUuICBJIG1hZGUgYSBSRkMgcGF0Y2ggdG8gc2hvdyB0aGUg
aWRlYToNCj4gPiANCj4gPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvdGR4L2NvbW1pdC9kOWYw
MTIzYjFkNjNiYTI0ZjQ3MmRhNjk3MTE4MTkzOWNlNTNkMmUzDQo+ID4gDQo+ID4gSSdsbCBhbHNv
IHJlcGx5IHRoaXMgUkZDIHBhdGNoIHRvIHRoaXMgY292ZXJsZXR0ZXIgaW4gY2FzZSBhbnlvbmUg
d2FudHMNCj4gPiB0byBoYXZlIGEgZGlzY3Vzc2lvbi4gIE5ldmVydGhlbGVzcywgbXkgZXhjZXB0
aW9uIGlzIHRoaXMgc2VyaWVzIGNhbiBiZQ0KPiA+IG1lcmdlZCBmaXJzdCB3L28gdGhlIFJGQyBw
YXRjaC4gIFdlIGNhbiBmb2xsb3cgdXAgdGhlIG9wdGltaXphdGlvbnMNCj4gPiBsYXRlci4NCj4g
PiANCj4gPiBUaGlzIHNlcmllcyBpcyB0YWdnZWQgdjIsIHNpbmNlIGl0J3MgYSBjbG9zZXIgZm9s
bG93IG9uIHRvIHRoZSBSRkMNCj4gPiBwYXRjaHNldCwgd2hpY2ggd2FzIHBvc3RlZCBiZWZvcmUg
dGhlIHNpbmdsZSBwYXRjaDoNCj4gPiANCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
Y292ZXIuMTc0MTc3ODUzNy5naXQua2FpLmh1YW5nQGludGVsLmNvbS8NCj4gPiANCj4gPiBUaGlz
IHNlcmllcyBpcyBiYXNlZCBvbiB0b2RheSdzIHRpcC9tYXN0ZXIuDQo+IA0KPiBJJ20gb24gUFRP
IGZvciB0aGUgbmV4dCBmZXcgZGF5cywgc28gSSdsbCB0cnkgdG8gcmV2aWV3L3Rlc3QgdGhlIFNN
RQ0KPiByZWxhdGVkIGNoYW5nZXMgd2hlbiBJIHJldHVybi4NCj4gDQoNClRoYW5rcyBUb20sIEkg
YXBwcmVjaWF0ZSB5b3VyIGhlbHAhDQo=
