Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF41020FA9D;
	Wed, 16 Apr 2025 16:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820478; cv=fail; b=SiusVaYLDCOjEWNsuMLW9MrW4Y26qfEJ1h6gwPx7LudW5EXG8ay7mPW35P9WwD9hjOVDlVQi6rhn4hhuj918LFN7eWO30yRrv2djfF2NafkUEN3QpJoyGDCAbt1OCyO4pFclf/ah8NO9oNDTDq+R1uYUr0NLVIBAx6gqmb0QRv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820478; c=relaxed/simple;
	bh=4D2ENGNsHV/XSnZFhFILH9dchDC0aZdEzHB5khcu7Jk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ocVtPXdqSzwZVn98FuPxG6p1/82LEdkFi5lNrespPaDfbs9Aa0IruhgIem96v61s/f1gbtiNnIhNdcXrmzcHk6cQ4E1miowpOLA5aRbv6QJ+aI1HX/BS8Npy5+Um97Vgnu4g+pSzj4QdshUAzhUO4BvLmXIhkuP9IY9F0etm+k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rd+b1mmx; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rd+b1mmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744820477; x=1776356477;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4D2ENGNsHV/XSnZFhFILH9dchDC0aZdEzHB5khcu7Jk=;
  b=Rd+b1mmxf2XeENLC/KaC5egQOxdLvt33F1FSX1NYyihgTQGbAFr+WLYo
   35gXL/FNJiYi4sUELM0jKPe5i9CNK1q2vWdaCmWDjwK84ZB2SekRqLIGn
   jG/nsqfsc6w73MLvdsDR+XmIOylZk9yecg/vg6nUXz39foSJxH6WSFlVA
   Tz0TesjF64MDgJHCOmtkgGBddBTccASyfsJ4EpI39PK2AY1i/P8La69dA
   L+CQX/XdRkvNCTlTIFChiAGTzRE3/U0zTj+lyJZfktcN42TsG4XLRPfBh
   mlhj+2dneZ9CBJOW6o7M3HYHLjuBLMIVqZN2WVboBeb7UT3v4w9RW/9Mb
   Q==;
X-CSE-ConnectionGUID: Dy//r2c+QTqR16rlhIMUag==
X-CSE-MsgGUID: R4y6HtfFTM2W6rtr1Q9qKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46544624"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46544624"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:21:16 -0700
X-CSE-ConnectionGUID: KsX3dq2vQmyJz+4NfgaO8w==
X-CSE-MsgGUID: qSMUeGs3RP+q1gptlHPgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="153720097"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:21:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 09:21:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 09:21:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 09:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSQ+yCUfssNuSGGKVG0kePrHQdkPwnaTmDiprXpcUZNInYBjStnXLMDrFipSSb5xs6CiDnfUt+sbsLlRhBNAlWtcN96KNaygfAflXIjfuJq2XPlixSLx+p104EO9ccc2DBDYSr8g3ia9CPBVRBPV+VSv09uEVWF8oNUs1LaKfhlF6PzLxZ2kVW+ZBbZ87d21Ujd/mLbLN+N/A7LvMucyxvaKaqOoXfTf2eV+izNZrCcStWpQZuP1hi97R72bam/HQeeBEgNo6Ck32c0lTLD+QdeZsNvnCwVxzgfACJ+9l6xOZuZEMMkyC2cPmStVsumZoiXUTenLMTZrrOuOnDi/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2NxcqCcDXTIvDacwG66AT0/WWoVpj1/BTen8VOnWwo=;
 b=ArtEH4aihDTDyTYoMfVhO7D74MO63EFEFHoTqxgaAlbnSWOw86c3wk32IuoGwZc0zeVcNmDWqaTXlQL5NEf/GlNYCjpmhvlAM2QLWV8rfO2TI6ozqIpaXdfeGcWwkxctfpMwSvMTVNIQJO/Y84iXn3e9uGjE5gO2q2QoK24rPNW9vsi8lJcNJ4AyCXUVn5fechLH7lAxjh+gff/WIowEwwy+z1bfoy41t4//vGDMKKJ/TGd2F8oJbTN0995Q3nYxE3fZGJRdQ531rqxi521StwGPgr5FBBGSURhi0JfcsjamEJG1F4XL3ENIRtdNOtFfqY5teTb6kJzERH29B881kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB8343.namprd11.prod.outlook.com (2603:10b6:610:180::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 16:21:06 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 16:21:05 +0000
Message-ID: <d6079947-2538-4258-8b1d-1f7b18a628f6@intel.com>
Date: Wed, 16 Apr 2025 09:21:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 18/26] x86/resctrl: Add default MBM event
 configurations for mbm_cntr_assign mode
To: "Luck, Tony" <tony.luck@intel.com>, "babu.moger@amd.com"
	<babu.moger@amd.com>, "peternewman@google.com" <peternewman@google.com>
CC: "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"paulmck@kernel.org" <paulmck@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "ardb@kernel.org"
	<ardb@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "alexandre.chartre@oracle.com"
	<alexandre.chartre@oracle.com>, "pawan.kumar.gupta@linux.intel.com"
	<pawan.kumar.gupta@linux.intel.com>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "perry.yuan@amd.com" <perry.yuan@amd.com>,
	"seanjc@google.com" <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "kan.liang@linux.intel.com"
	<kan.liang@linux.intel.com>, "Li, Xin3" <xin3.li@intel.com>,
	"ebiggers@google.com" <ebiggers@google.com>, "xin@zytor.com" <xin@zytor.com>,
	"Mehta, Sohil" <sohil.mehta@intel.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Wieczor-Retman, Maciej"
	<maciej.wieczor-retman@intel.com>, "Eranian, Stephane" <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <03cfb41a0b2538cb994fa0c5b0950b7280cf2eb7.1743725907.git.babu.moger@amd.com>
 <8c3aa9cd-335e-415d-a9d3-35593fdbe812@intel.com>
 <15852d2a-5a44-4d15-aecd-d28660a40a85@amd.com>
 <DS7PR11MB60771546582C59A917647239FCB22@DS7PR11MB6077.namprd11.prod.outlook.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <DS7PR11MB60771546582C59A917647239FCB22@DS7PR11MB6077.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0251.namprd04.prod.outlook.com
 (2603:10b6:303:88::16) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 0629eb70-5103-4c98-60ed-08dd7d02b047
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnVoM0FrOU9RR256T001RUdNYmpscEtrTWV0dUoxV1NXMzlGOVE2RGdJWHRi?=
 =?utf-8?B?R2hPT0NkR2s3cHRPeEdrRnZRSUk4MkNqS2JsMEFWd0VlN1ZOU2IzYzRCODZD?=
 =?utf-8?B?OFcrV2pGSUFsRExZaG1VTGpCVFlNM05GZmpTdDRHSjlseXB3QkszcFVzT0VV?=
 =?utf-8?B?UGpUV2FLclFDa2pPS0d4U0h5QlFmRU1Lbnp1Y3lPVk9jeDVvc1ZreFU4aStW?=
 =?utf-8?B?RmJJRi9yc3JTVE5KTWgvTFBLVWxxOHhUMzlZeDQ3Z0R2Sm1xd2FpcVZ3TlZr?=
 =?utf-8?B?RzNsODNSTmg4MlE5Y2VINEJkdWNIaGNDNjVpY2gyRHVjNE1NTmZ4QXR1dWZK?=
 =?utf-8?B?ZGNFd3dMRkQwYmY2NkVFU1dsUkZnZUhzZkpXYllmdFBUeUlWc1MyMXM1Rlhn?=
 =?utf-8?B?cnY3bjVsMEdnQ1VWL2NOWTZ4cmcvRDFSa0lvSmEwTVo0aVIvdUpvRXdmSFMr?=
 =?utf-8?B?czNTQ0gxTkRMR1owWEpkd2laZ09KWHJydVdtVkJTVUFTc0JuN25lWHBxK0FE?=
 =?utf-8?B?UVd5RkRZalFiLzg2cFkwOXZjd2d0RE81UEx6OGlDaytmR2dhcWVUUHpBRWNH?=
 =?utf-8?B?TmM2Q0xES2F0T0o0QWE1WFIzZWtMd0pVUXByMU8rQk1kbFRuNXlpV1pqaFVu?=
 =?utf-8?B?ZEdCa3A0eFpVZGpFRVlIMG5yWkVPZ1lSSU8rM3Fnc3U5aDBMY3dsU1hqSU0x?=
 =?utf-8?B?R0ZPQStMeWhGTU5rMzNmakloTEtwbjhUSDI2NUxBNlpNS0VUbWJzdWhRSUhP?=
 =?utf-8?B?NnF5Vm1NWjE0eFh5VnpialdWQnpyR291TWtOTWxwMzBsOU5nc0lxd2pmYXNs?=
 =?utf-8?B?UktKOUlwZ1JQaVA4OUxwcDN3T29ETEpNWUp6STMzeGg1aDZyRzhxT3hUVHJn?=
 =?utf-8?B?Vi94WGtEc1N0Wjh5N05JamcxUmI3Qnc4MlBSSlJLczFxVm9rVFZPK3RUWGFM?=
 =?utf-8?B?YzVJUEJ1T3M1bGh4aEJTc29wRUE0ZjlyUnBkeFU4aGYzWnRWMFhhbnIxM2pN?=
 =?utf-8?B?SnBQVGU3T0ppaG9MRDlOTDl0VVdiREpkOEc1Q2d4NmI4TWdlZlZBRHdvd0Q3?=
 =?utf-8?B?Njk3MWRiSHQ0Tm9VdUdMRVFnUVU1WFArdjRlVXEyVnk3LzNjTU5jeEtzVE5s?=
 =?utf-8?B?b3MzWVh6NE9IWG16STFaM2VlTzR3enBQS3dwemV4ckJTUDl3Y1VmNy9sZ2p0?=
 =?utf-8?B?aFB6Y3hsTnY5dU5mMTg3U2s5QTBUejhzeUllTHl6SXQyZWhuUWRvQ0hYM3dI?=
 =?utf-8?B?M3hNZVcyaEhmdDdRaGZzaGFKaHptdytDbmVaQzJFQmtGSUFUUWJYUnZxM2Jr?=
 =?utf-8?B?VXc4VmJHZ2NFbmRyTUduTkZtM1FHRmxLeFB2UEo0MllVNWZObDNWTVBHcXhw?=
 =?utf-8?B?dW1zZ240SHBhMERXdzNVNVJOejc2ODlXcE05MTZlWjZUdmhDYlVYSzc1QVhW?=
 =?utf-8?B?Uk1ndVhWaXN5UGNDM2llc2daaWMxTXFiT2YzMys2L0lKU0V4aXhOSFhLRXI2?=
 =?utf-8?B?Q0dzeUVHMlhZMTJHY3hxVGFlT3AyUnBsWS9WSitQY1NWNXJpd2x3RlRBS1Vo?=
 =?utf-8?B?Wm1mVlRkYS93Nm9QSG9WZ2ZNZlZWSGZsRVVqeEN1MWhCRkJPdHQ1aHVMMTJS?=
 =?utf-8?B?bG93b3hFWjVmbVduMFQwMVBHd04vRFNOS3IzQTZiNE9UYlYyb3R3VVErdkZM?=
 =?utf-8?B?eHJmNTJnalFBeHNZYjBMbGRvZmN1NTAzaUVHRy9nQUJmYUVobDJhUEVZNVhL?=
 =?utf-8?B?MjJLSjNIQ2dzOGwzRHg1bEIxcExXWm1DK1FUQll3ZkYvcFRxbURlKzdTbUJH?=
 =?utf-8?B?TVlUMWRLVmdXVVFXMmR1VnF0a3pySlZBUGdiZTRoRmlIQVY2Y3E3dE9FSVl3?=
 =?utf-8?B?T1hPVk5FN3R4elZleWVaYjF6UCtSZmRFR2lHd2VRQ2xYMnFET1ZvVkU4TVVI?=
 =?utf-8?Q?mu/Hbfpfw7c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmxkV3JtZ25PWEhSWHdUVjVzRGxoN2NIYWd6M2had0ZYbWFkcnBRS3VWUk5F?=
 =?utf-8?B?cUk2Q3p0Z0RURHRabnFQOHZWTVczRG5CLzdWSjJ5SGZwRnNqR3pUVUk4YzQ4?=
 =?utf-8?B?MGZNT1crdVFiUGVzVENJL3FXVGJQdXBDd1NMRS9Gd3I4RzUrcXpva3pXTzFT?=
 =?utf-8?B?aDNEWlYva1E0OEJqNldDQlVDWkV5YlBEUVg0aWpxUVBLQXZrSmNndFY4VnZy?=
 =?utf-8?B?U0c1cDFUMTFMbHZJQWhJZGU0OURaci84bU5uM3VNcWpBSmllV25wN2pNYlhV?=
 =?utf-8?B?Z0QrRk9ITkU2S2VVbDJiOXg0VEtFR0x4OFpJMUc3UVlBMzNJTjlqL1l3Tm01?=
 =?utf-8?B?dEtTbGVCSm1aWk54c3huL1RuQXZTMDV1SWZxeUxFSmRiTUE4WWpBNG9SckdL?=
 =?utf-8?B?ZFNkaWc5Tkg3WnlnMm4yQ2d6RjVUVlVNWTZDQ0VuZkNhL2xoK1p4dTB5UGpk?=
 =?utf-8?B?RWlNeUpJWTJ0VC9TVFlHbVFaS21udGs4MjBDRmhEQTQxSUVEcEVzcFNoVkFB?=
 =?utf-8?B?dDdocVZYUDJBcklCdlBVQ1BacldNSHhRNFRiTEJJSGN4MmtIWitoN3dXTWQr?=
 =?utf-8?B?MEJUdi80d0FSTm5Vb3NUdURjbHBSRG9NYkF1cXY0QUt1dEJEcU1XRE8va3lv?=
 =?utf-8?B?Zk9MTCtEMk4xRjZKQnZ6dTFQcUZVd1ZyVmpmQTVOZVpkcy9pb3NrcGpwL2s5?=
 =?utf-8?B?Sy8zdHo1UHBxSmdTWEdLa3JYWTM4Qi9teUNwdW96M3kycDhzaUo4dGtYSnJZ?=
 =?utf-8?B?c3JJWFMybXcxNEZLdDd5Y0MzVzVmaGt2M2JwY2RzSjlkbXQwMDhlRWdEeGpS?=
 =?utf-8?B?a05TaUYvbG1iR05CdHd4b2g0TU5zM2ZQNEd5WHRiSWtIRUVSVVdsK3dRTkx5?=
 =?utf-8?B?aW9LZEs4c00rUTI4aTdZTlJKUkpiNFNiY2UxRE1UTzIyYTIzUXo3b2tNR2Fq?=
 =?utf-8?B?WGs5QUFJam96c2ZPemdVd1RlaGdsbk1vajEreEJwZElXWDJKV005YXkweE0v?=
 =?utf-8?B?ckxaejhmRlBpMG5aNkhjSFNyQ2hkUzcxVUpTUlhaQU1aRU0yS3ExdUhuUS9l?=
 =?utf-8?B?WlVhR3M1d25mVTJVRGYvdzhXRThISGxjN2M1eWI2VWd3b1QrQjROUkJtcUxC?=
 =?utf-8?B?RFdUM285eVZkU3U2UjdXQ21MbllUNkd6aElSMzdtQlBIdFJoVWVBK1d2Wmdk?=
 =?utf-8?B?c3ZlL1A5bkt3RjRTUWhRVDhQdzFwTkpVV0hWZ1RtSzNsZlZLelpmd0dYV01m?=
 =?utf-8?B?N1c0RCtuUkJjSVhzNUpVNnpCektiQ1pzZHF2TXNIMFZFQXFFM0RjZWFhdTJk?=
 =?utf-8?B?cTZWTk1MSkgvdDNNVEVXc2NsZlNuSXBpOXo4Q0h6Ykh4Tkl2K3BpOUNKMGZr?=
 =?utf-8?B?RjRQdm9SbzFMZUR2SnF6WUpxOEpad1BRU3NmSHhqdEVuUFY3cGdpWlhRd3Vz?=
 =?utf-8?B?b1psWVVJb2tYQWtDNWQ0WEp3UEZCbkhYdFpiRktPV0IxL2lsNStseThVMmFj?=
 =?utf-8?B?VmRhVGNLMTU5YWR3eVJVcVFoQU4rcTMzMzI1WlZ4K1VZY3hwalFsWGM1TkVt?=
 =?utf-8?B?RlV5N0tzRUw2emNGWS91N3JRekYyOFptZ0JrVEI5eWVlNjNCUnpoUXVwdmlS?=
 =?utf-8?B?ZHRCOWVYbzlGU3MrZXpNcXFySnkzL1RGbklGL0V5eHFLL05jcS82TWN5V3p4?=
 =?utf-8?B?K3IwbHVzWjV4WExud1NueGV4ZXFoMk5iZURGeHRHZWllZndoc1d1M1NlZVEv?=
 =?utf-8?B?UGljZXpuQnpGMUJFbHhSUVdJMnQvL0NSSml3QWtwT3Rpd2lNSFEzNnRaOFV3?=
 =?utf-8?B?ZmpFYnZabUNXMkt6UVFpTnlLQ2ZoeWVsK0ZXeVRMRjFIa29nRWRRUWF0M2hK?=
 =?utf-8?B?Q1plYkIrM2JIZUZSbFdvLy9NK29SSlFkY0tKamVtM2x6V3hMK2pPRzluOUlp?=
 =?utf-8?B?UUNPdS9OdCs3NDFXaHZ0UjI3RDJvUVVvVHJjZFJwbUtXSTZLUkphVlFWQldD?=
 =?utf-8?B?aG9YN1VSQnF6am1lK0hjNVlOenRYUlNxd1lpZ2hrdjhCczg0aUU0c0dFb2p1?=
 =?utf-8?B?aFIvRHdSWUlNWSsyRkZaNUFPd1ZBMFd4ZWtXZ3FnLytjQnJkZ2krWGUxNk1J?=
 =?utf-8?B?V0JLN0JWRW9LUm03Zi9CMGRjV05xSXhreTRlOWFDZHRwT2dGaDhQVlpJS01j?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0629eb70-5103-4c98-60ed-08dd7d02b047
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 16:21:05.8853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJwQxNi9woChwoz9Gk/goTGVmxbwBTnJyczpjxijbXDcVcCu0gq3R0Xz1sNOmnq3om/9jIVhN4MpB+HbkY7rkeubV9gP98D1J6ePVa9AaCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8343
X-OriginatorOrg: intel.com

Hi Tony,

On 4/15/25 12:25 PM, Luck, Tony wrote:
>> By default, each resctrl group supports two MBM events: mbm_total_bytes
>> and mbm_local_bytes. These represent total and local memory bandwidth
>> monitoring, respectively. Each event corresponds to a specific MBM
>> configuration. Use these default configurations to set up the counters
>> during mount. Allow users to modify the configurations as needed after
>> initialization.
> 
> I think an update to this part of the resctrl.rst documentation is somewhat
> overdue:
> 
>         In a MON group these files provide a read out of the current
>         value of the event for all tasks in the group. In CTRL_MON groups
>         these files provide the sum for all tasks in the CTRL_MON group
>         and all tasks in MON groups. Please see example section for more
>         details on usage.
> 
> The sentence about CTRL_MON groups providing the sum for all tasks
> in the child MON groups is only true if counters are assigned to all of
> those MON groups. What mon_event_count() actually does is to
> return success if any of the CTRL_MON or child MON groups succeeded
> with the count being the sum of all the successes.

Thanks for catching this. This would be important to highlight so that
user space does not have impression that events of CTRL_MON can be
used as estimate for MON groups that do not have counters assigned.

Reinette
