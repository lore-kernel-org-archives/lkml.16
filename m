Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B7113C3F2;
	Tue,  1 Jul 2025 01:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751333646; cv=fail; b=XHdLVptbT2w8ebI2dWQovpuJOY/nNmRE0yMhNA/wZvRrJnJV8n3OTMvAZDfhPho8Dw24UW2HSkabWwNt+mDh7q6ZGpLRXR9nK+qzOR7N9zDSubONZrs9wJeuNFmNl88poyIhBoz0vvzCz7MNvXOD9rV4euM3Wq9n3ACmMew4kGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751333646; c=relaxed/simple;
	bh=i4HGs8LWDsUnrYHJPmR2wKT7JaYqJzkivVHG4XPf0Xo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pfB41WNAp/p1c9r0iemkTPUhdMspIvNtGCzVoDAEUDLV1cqFIJjkI2HYY/FiKzpX7jNiF/jcWCPJypTjGSTAmmDetyTfcVc9O9L6fyuoFXgdw8n4gxVQEXyp5T5SeYU6L1xOml22ZZm6CdCdKvc9AmiiZ3DO4Cvlojci/xVOuq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZRDP+Ks; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZRDP+Ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751333644; x=1782869644;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i4HGs8LWDsUnrYHJPmR2wKT7JaYqJzkivVHG4XPf0Xo=;
  b=UZRDP+KsYjBe2AliG/jlHysII568UMqKoH0TGxLcQqH3pnvJbXkufaaD
   2dRmto+/1zNaDszE8Joix5XcoOwhab1JgOktpBB7oeSvfd66yPN+yQLeW
   APHWSdq/fEKTRvPPsEPGEevFPzcLSVtgIoR6zfis1rvrT9Xn8So+zwcWw
   G34FHXZpqYddoLJ1YI0lcIVvWuiRaVHAxjy2SwjIgQXQ1mpIzDVYDOS4u
   ycVtehjKBBfZ9GUrXKzR0Nhgvmy+qjK6Q+OMuH+TIXWDG6t3BgUs2YM2S
   NGsSrx0sOICJyZUCXKDxmHtzJrNCmjw5JIRnpmoPtChyjS6U+2qRKMh1w
   A==;
X-CSE-ConnectionGUID: HNWzIu2aSzOcAjLV9kI9GA==
X-CSE-MsgGUID: 54oYkg1rTXSGZwoJD81T3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64272206"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64272206"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:34:03 -0700
X-CSE-ConnectionGUID: BcWLW5JhS7SbPknubSsHqw==
X-CSE-MsgGUID: 9xPQVEDhQ++tBzvmjfzUqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="157658741"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:34:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 18:34:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 18:34:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 18:34:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYCWIbm84GCaPDMwUWj0F1kRVIjU8AD/n1D+SPSEeQifj3xjUzflHEtOL9WUoUVBDkYRRc5YYiXxnappuvviW3BfuefW4zYNjrPOWs4/yg3mcXy0JtXNFS7vwAnPkFp1VkbscpGssMWRWX/MzwGZxdpEKBDfos4qO2dLkds3AOUXT1q4V2ZFUdQCNAlY88zfwi813PqZzf1OBzvWiTsFOlvhnyeAhaByIfRliMTCrpmogdagCankPWXDonEfopNCdz2X9piW10V5Q674kWGI3h2oU+wQAYBXX+NmUlE8B6qW5AO5mwmN+Z6vjk5J0558zg+caFsSFjqr0BuCO8IVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pd96g7bZir02YKEDKs6m53vQOabOMP6si+iFUbC8JJc=;
 b=w6yKsQF+l8ZnscGpGl2IdclT8FObqKmBTINpJSy+V4qp/4iysMCrElzMcO4hQ/Oq3qXMg4ZASKn3F1Sv27imyOn8/n/0wi3gj0vxVTpolDDXXm5Sfmm+pcpRBc3JTza+Kf76WVMkQOO3qvdFnughSXNS9P0DU149qWSHHtksjXUw/FnCcP9P//DNFHkW6JxX3beG/A1yHR24Xkoj2BmlwtFTh/6wBQEwMAjSaGWX2wFIlEvLDtdOO/5vaqNkCDIu7GlAl32gAhoG3xQCQGVKcWsEVpV/5A9J0viQsyjUg8qvZAzUMqnwJU/wmhQeQkdgAeOGB7DmTnGerTdNwTmMVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CO1PR11MB4884.namprd11.prod.outlook.com (2603:10b6:303:6c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 01:33:54 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 1 Jul 2025
 01:33:54 +0000
Message-ID: <be483586-fa15-4426-ab16-7d250a6cf653@intel.com>
Date: Mon, 30 Jun 2025 18:33:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 25/32] fs/resctrl: Provide interface to update the
 event configurations
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
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
 <dc097e5caa1c7df42c211fffb67f8d860a6b39da.1749848715.git.babu.moger@amd.com>
 <de1e1946-15d2-401e-a974-cbc86d08a78c@intel.com>
 <35238a5e-fa04-4e08-97ba-7e206c36bf4d@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <35238a5e-fa04-4e08-97ba-7e206c36bf4d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:303:2a::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CO1PR11MB4884:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cee738b-48f0-4f4e-a8a7-08ddb83f56f3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1A3MkFBQkJER05tVjgwOVBkZ3V1cEwydGMrb2lKZTlnOXNTN2xvNk9NU3FB?=
 =?utf-8?B?bVRwMkV6OE1VVVJVZjRoNFBJT1FBZkZ6VEZaTTM5TXJnSjR3Q3pBZFVNNEx6?=
 =?utf-8?B?UVJmM21uZGNqbzdmRjVuWVFPVkdNRlFqdzFnbldOYzhjV3QvbkFCeTJONkt6?=
 =?utf-8?B?VDRQWWQ4QVFiaUhMd0QvTUU1aFYrT1I1T3lRSk9VTWV3aXlMeHNUZU9Fc0lh?=
 =?utf-8?B?QXZHWGpNZmVjMzZ3bHFNZmwvekllWkhVRUd6T1ZnTW03TW5zZzI5L1cxdkVD?=
 =?utf-8?B?SlQyOGVwdzNQQmVNL01lWDVwZ1dlaDdCcVdhQkJ4azFiQ3I4R05QM1cyS3pZ?=
 =?utf-8?B?enZ3bDJMMDB2NysrNytQZGFYcEtYMjcyays5VGc2S0krTlNrL2c5MTRxYWdK?=
 =?utf-8?B?VnlTWWwzU2dtQmcxL2xTa2NGSlRoMVU4ZDJkZWI2b2tKYkd4ZWdzZjlBajdW?=
 =?utf-8?B?ODdSU2tjQ2hMSHRRbWFTRFRMd1FTMW5EU3BlbThNVG1Ha1VOMHRTc2k3Rm02?=
 =?utf-8?B?NWhKZWZaQm54RFFlanoxMVFaRmFiODBEN2lZVW53R3RxVTVBbk44OTZTTW81?=
 =?utf-8?B?NlAxb0tpSVNSN1NtYkpqeVFCSHJaVzEvRjFZR05RMHVwdVltSXNRUCtQcWYw?=
 =?utf-8?B?Uk9wU1llWmlHNnd0bGpCVWtYTXJOa3JCRXJaaDR4dW1qWTBkckVBQjkrOHBL?=
 =?utf-8?B?bXVSd05rd1JXcGxnWFVKb0ZqUW4wWWR0YWpkYlpUejI4N1lseTVaRUttcG4r?=
 =?utf-8?B?WUsyU1lTbERsMytXek8weWNuaktpMFZZbGRJclZzaTgxSmZYc2x6cnEwMDc3?=
 =?utf-8?B?czFIRS9kaXVZdXUxa1pKQkp6OTlHdGVPempQdEkvTDdnY2dPaDJLeHBibFhw?=
 =?utf-8?B?cmwyaVNWcjluVGZWK25wQzJMWnJORjMxSGoyOVJXQjFvL25FMU85bEpLbElP?=
 =?utf-8?B?ZEI5UVBCK3JBNUdBSnN5SzlNaXA3U011VS9kSFJUbTVUQ1FBOSszME9ObE14?=
 =?utf-8?B?a016MmNrWUlJR3hBZjY5cklienZvQzF4M214R2VJZ0l4Um9MR2pSNEg5K0dr?=
 =?utf-8?B?OHBSTmYrZEdIWG85aERIbVNaZ1MzR1Jwazc0dDBsUFVINC9td3ZJZDY1YlJJ?=
 =?utf-8?B?bVBOVHdHaDZmVHVSVTdkQ3g4NkFXZm8rOHdRSHJwd0wvZ3ljZFVtRUtjWHIz?=
 =?utf-8?B?VGd6anVmNzZWbjdSZ20xdGdpbTMwVllvZkJTc1JJUzZzbWp3UE1CUGFlM1do?=
 =?utf-8?B?U3NkV05jR1Z0QWloRUJTN1A4SUdFTnZzMWxWRHhMcE5kcDVxQVJ5WGtwOGF5?=
 =?utf-8?B?b1AzSEQrd0FOTk5TS0ZERjhabHlvTnJpUlB1M3BIQlJWNFhZQVdjZVZtRkln?=
 =?utf-8?B?dXNQdDBGMkpWM2Y3Zmd6Z3A5VjZiNGd5aU55Smk5Y1BoM2JMSUduY29ZVFdP?=
 =?utf-8?B?QTMxVzYrRGZoc0wwNnIweWRvUHRUczA2L3BiN21vT1N6LzJQc3loTGdoRVBT?=
 =?utf-8?B?MUM2Q3RXVXBwaGFuRy85MmhDSno2U3VlY3JhVDRIZlZMUmhEUE9tTlZKYzZW?=
 =?utf-8?B?dE11SllGK2hyZy9LZm1sSEdNeW1EdkxUWGk4ZE04anRSLzkrY1BORko0Tit1?=
 =?utf-8?B?eEtMUkN1cGwyOHBweG1XeXNjZlFhVkkzNDNOU1BFVXN2REhYdzF0bzcyd05E?=
 =?utf-8?B?QmNNRGVDU0YveWlSSXRVM1U4UWFHQjlMa2cwZEV0dGkxbUhtcDVZUFBLVTFs?=
 =?utf-8?B?dmNDY1RIOVJQSXlUR0FpRXgxdzhEL0krckdtUzVnMWVDVnllL25DVjhTV1l4?=
 =?utf-8?B?d3B6RjRvSWxPQUlndHMwUXdGNVJianRSUG93MTJIMEh2U1FiUVRGS0NDNHg3?=
 =?utf-8?B?dzZBbGZDNlZSQlZVbzcrbWNmVFVlQVRxSVRpQnRvRE01UUk0TEN6ZS8wYzNv?=
 =?utf-8?B?cmxLVmhJS011a0VzeUR4UGR0ZHlQSm5VRWJuMWlYVmc3c0RXS01SZVNiSlBq?=
 =?utf-8?B?T2pqR2VMK293PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2g4STlaVUtWUkdCSjRZUlZPV05FbE4zamRKQVFBblUyWGdwZjFEdGNmcEd1?=
 =?utf-8?B?eDZrOG1USFNnM3J3aDJsL3l0VVBObW9pYkVwRW14QkEwL3ppU3RwSkxVbkFM?=
 =?utf-8?B?UWNIRVBzOVQvUzJ1ZWVTNFpoS21pZUdiYVVHaFI2c0dCdEZNa2xnSVFKOThm?=
 =?utf-8?B?dWxGYTRNbFVRQmd1RGJUdzNpaVo2M1U2U0orNUd0a21aYjRlVVVHck1uZU1R?=
 =?utf-8?B?RUx0dTl6TEZLcEVNM3laY3VnR2lwOGlzSUpLWGk0YTBtOGJ3RDF5VHdvbTBB?=
 =?utf-8?B?TWlkNks1ejN5MElqTjU3bnRQUjlHWEwwdHdaQVRXNXVCaHA5QktReWh3ZC9K?=
 =?utf-8?B?emNVTENQak8xam0wTW5PQlF6V0VzOVNyanNheWlZQ1BrZURMQzBaelVIdEF6?=
 =?utf-8?B?aFBqTHBJNXhmV0FzSlVMOFdEQmgvanlaWVM3cVR0ZDVKUFJ1R3l2dEVDZUpF?=
 =?utf-8?B?Nk9MaWl3T3RyWklqejg1SExkRjN5ZzNOOUc3QmZ4WENwQkwrSjUvQ3NRN0pN?=
 =?utf-8?B?OTloSHRSM25oYlJITEdnMGNiMVdBWlpubW1jdEswRzhxUW5NcEVOdjhCTHVa?=
 =?utf-8?B?eW1mMnA3Vnd3ZVNYeDlicjhhMFp3cm00YUR1YUJvek5ieEVVLzFyaFdnTlVt?=
 =?utf-8?B?Z1U1Y3p1MFpnbGxiSno3cHduNXpxUGF0ZmpMYVI4dmNFRHdZM2xXbjNueVNx?=
 =?utf-8?B?dkczZ0dkMUtSVUxyVU9EZi9VS2xkd3RVR1UxVW1tbjIrUFBaNCtYRGE3bGtJ?=
 =?utf-8?B?b0VwYmhmVS83MjBEU0JObTJ6TldFSy9VUzEzaS9CRGE5RytTeFI3MExDNE5F?=
 =?utf-8?B?ZnRPdm1Db29mZ2NyM0hVWXNKaFlSUUZZMDZ1S1JTQVlJMHlGdW5vbzNsSys3?=
 =?utf-8?B?NDh3dW5DRmFlVTBscVVLcXJSYU9UVG54S0JTK0M1dzFLZ2F2bWNWTUpQZlJt?=
 =?utf-8?B?dHdlb093dUxRZE9ZWEl3ZldqN2J2Nk5kVHMvc1FCZDd5ZS90ZlhtM3A1aTJP?=
 =?utf-8?B?MXY5NzdTQ3dqOXRkUnV0a2hWYWR5T0VZOGRlUE4yTDc2L3h2aHhnMU5TemJS?=
 =?utf-8?B?UFlCdElXMmV4WWk0UHRrMmdSQ1ZYY2cwcGFvazFoYTY0VWJDODZqaVpUd0Zn?=
 =?utf-8?B?ZnNuRmxxLytud2tzUEY0UGNEKzB6cTQ1MzloNmxBdHkvU3hjcUdQL05hYVh4?=
 =?utf-8?B?dVNnRHRKek9SZVlnczJqdkRmbTRFblhwUjNOWWRwQ2R6VGxDc2ZRbFcxRGE5?=
 =?utf-8?B?OCtwdmVQaFVxQzhiSWtjalZDb0lNZFE4WFVDUzF2V2hleUxpTzdmWUtLL1Np?=
 =?utf-8?B?TlIrYlkxV3VRWmd1VWRVakZuR2V2MmdLZHJkTGJ4QWNIdDNGdjh4TXZwd0t0?=
 =?utf-8?B?Y3lyWklMVGllUGpuWnpwelMzVklUZnlDT05Dc1k0OGVMVG1OMFhONElncm1Y?=
 =?utf-8?B?ZHZQbUd4Wlk1ZmpoQTRuZ3ROMU91Zm9tSjFRRWNveTBwVStVWXA4Smw0R0ZR?=
 =?utf-8?B?clpTVjgzNUQyWUtsYzcyTUZseEVObzBFV3lPN0lMbGZETktnRlBlNkRPQzMv?=
 =?utf-8?B?RXAwNHQvQkV2UFBKZk0rNDlOd3VqTitwUmZLUDhhYXpwanpVRzBqN052TzBk?=
 =?utf-8?B?Umt5LzBObjc4WUdISFRzY0plelZteEM2VnkrWE5kUStrbmlQZlowRW1FbjA4?=
 =?utf-8?B?eHR0eTAyZm1HT0VleHFlTStOWnQvLy91cDFYMkdSTk1oSFRmRjhTb1pDUENw?=
 =?utf-8?B?Qm5yVDd1Y2szTGR6NnRtM21ldG94Ykt5Y09Qby9nU2tsdHFPVE5XVEdvZnpn?=
 =?utf-8?B?ZVpySW1yTTZxSUk0c2t2Ry9GVWtqNVBmZDN4RWRsNGhJeU1mYWZvTVRnSm5I?=
 =?utf-8?B?Mkd6V2EyK1pvMWtxdXNNNDFGUWJwUXJkb3cxdFJFM2hFRms4Y1JKejZjU3gr?=
 =?utf-8?B?U2hrTEJrY2V5Q2t3U1NaY1lUVFB4R1dpVjNCMmlrZlUxUDVFQjFTc0lUSkVz?=
 =?utf-8?B?Nk9nWnVOSkxROFp2RStJMnZ5R2JYYlNyYm5SOWZCbk9BVDNiUEMwSFp0dGpl?=
 =?utf-8?B?T3BnWGM2T3FoTW4vNElXR1I0eWFjMVRLSEErQzljaitaU1pWZnFLWXI3S2Mz?=
 =?utf-8?B?aDdJWXNZSjJRRFZxZlEyclZVOTIva0l1bXUvcjg0WUJjZ1F6YUR1azZrWE1P?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cee738b-48f0-4f4e-a8a7-08ddb83f56f3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 01:33:53.9732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwAd8rsprAy6HrnXPkebDoihaZv+7C9+gGraqbPPQb7mJBvfe5Slwcztqcuy37VW242J1aBZpWjXjZnLzT0ih2dyv2qABOEuSBd1NP1OniY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4884
X-OriginatorOrg: intel.com

Hi Babu,

On 6/30/25 5:43 PM, Moger, Babu wrote:
> On 6/25/2025 6:21 PM, Reinette Chatre wrote:
>> On 6/13/25 2:05 PM, Babu Moger wrote:

...

>>> +     * the assignment
>>> +     */
>>> +    list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
>>> +        rdtgroup_assign_cntr(r, prgrp, mevt);
>>> +
>>> +        list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list)
>>> +            rdtgroup_assign_cntr(r, crgrp, mevt);
>>> +    }
>>> +}
>>> +
>>> +static int resctrl_process_configs(char *tok, u32 *val)
>>> +{
>>> +    char *evt_str;
>>> +    u32 temp_val;
>>> +    bool found;
>>> +    int i;
>>> +
>>> +next_config:
>>> +    if (!tok || tok[0] == '\0')
>>> +        return 0;
>>> +
>>> +    /* Start processing the strings for each memory transaction type */
>>> +    evt_str = strim(strsep(&tok, ","));
>>> +    found = false;
>>> +    for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
>>> +        if (!strcmp(mbm_config_values[i].name, evt_str)) {
>>> +            temp_val = mbm_config_values[i].val;
>>> +            found = true;
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    if (!found) {
>>> +        rdt_last_cmd_printf("Invalid memory transaction type %s\n", evt_str);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    *val |= temp_val;
>>
>> This still returns a partially initialized value on failure. Please only set
>> provided parameter on success.
> 
> Yes. Changed it.
> 
>  if (!tok || tok[0] == '\0') {
>                *val = temp_val;
>                return 0;
>  }

You may just not have included this in your snippet, but please ensure temp_val is always
initialized. Just this snippet on top of original patch risks using uninitialized variable.

>>> +
>>> +    goto next_config;
>>> +}
>>> +
>>> +static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
>>> +                  size_t nbytes, loff_t off)
>>> +{
>>> +    struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>>> +    struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
>>
>> With mon_evt::rid available it should not be necessary to hardcode the resource?
> 
> changed it
> 
>  r = resctrl_arch_get_resource(mevt->rid);
> 
>> Do any of these new functions need a struct rdt_resource parameter in addition
>> to struct mon_evt?
> 
> We need to make a call resctrl_arch_mbm_cntr_assign_enabled(r)) to proceed. So we need  struct rdt_resource.

Understood, but since struct rdt_resource can be determined from mon_evt::rid
it is not obvious to me that providing both is always needed by all these functions.

Reinette

