Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3377921C9E5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743464859; cv=fail; b=gC4i8jTmamDGFmGw2auudULBGnhBi6GJG89YOH8i2/m2+GDkydxamevJxH9Sk9wiG/JtxgE8dmvTr55QQqOhmILZsL8/tOwXOkMDv/jEQbT+c4QpKAwwpyzSxIn8uV4KA7rOJjOF3DcIKI78fizf1E3JEl2sdtbR6QlNaFbVk0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743464859; c=relaxed/simple;
	bh=Jad0m1AMMD8+4heRgsfJzh7rYlMOc34dMpi/nBstZng=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P+ue05ySpmJR0s9+xIUgjuvV8qc1ExW7FP4E1/LxI9Z9p1diY0bWQ+NvHZsDfwCEDsIDmNfxSgMFOYvnn53L8GKk5CnD+VCAmIlOHOVd1VBL0o2T32Y0RM0bEktvuasJYQlXJ+sQPxTsaEiIVlLCGCGv6FVbfxfmrm+4UNlmF6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2nV0aXZ; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2nV0aXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743464854; x=1775000854;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Jad0m1AMMD8+4heRgsfJzh7rYlMOc34dMpi/nBstZng=;
  b=A2nV0aXZY8Y4EHJX6fbwwnQqATS9qu3J2PSsdjr+N5JCrlQy6P/vPVCr
   6GhZe4Zi7GxVTk4KhUOzCZs7D3nZCH9Zi8BwL4oynDmMzAqiiwOXdlUbG
   hFZQzmi3AHmsZfjugw2jrdVoAfkfLCavNDha+CTDAnzoDQ9yZQ8I1W1oa
   vG9JaYAg/dSOAUWrE7Cv5DcbmX1wiKEi49RSLkFwItFxkHtwgK3aHTXQ3
   S+U5jG4BXFYK8y2hMmkhiPOwAf/YYXuS5HyH2GWpWIFrlhUt352VnI7Vq
   n+bzUcWlaMtClXelGxfH4frIQsYWFz7SJ6fNKZCmrGe4s16xytLks/OuD
   w==;
X-CSE-ConnectionGUID: UMbv8h+WSaOP4VVmz/rwhg==
X-CSE-MsgGUID: UjgexranSzes5DtuZvT3Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55765685"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="55765685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 16:47:34 -0700
X-CSE-ConnectionGUID: sQqIQC6JS6G6eAPhRWHZnw==
X-CSE-MsgGUID: oSaDgi+GTvynwYnDcYXRaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="125982355"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 16:47:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 16:47:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 16:47:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 16:47:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjZThHPRmFbVroZGDmV9f8uTmslBHtrxU36y/UWZfzfIOZ44vvdJ3tvwhM1Qd02dmqAEkt4SOddWIWQ1fq5RXJThPc5xlH1bftlRhCgHywAALQM8APxW8YYxpTbxWf5cpQcyMvTogibW+Xlp+BiBPA2/MSEXQcrv7zern9l+JE5gIGgaGYlSVMzRv0ROMstZNIPq8ZL8x6ILmsOJ2356ODF51nj3vyzMjcKoFE7BGil/gGH9rJxoU46hNVJnu/6603T/oUfgCi9EMqkHPMg6H0B4tMM95vDGaSkPkXpDjHI1ZjN5c+6NnpXO1Q1V2DG4ueOL2amAsYGrl1yzUkiFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jad0m1AMMD8+4heRgsfJzh7rYlMOc34dMpi/nBstZng=;
 b=d5fJ3dQ3yFCwfNmmGMjH5rlrvCakczjPa/+yNmq6ECcIpYNVrqm07aNzMo2oYDkJSg0X+R+waMuTubQaXiUcJVEbY0nFT0nr9BeQdIVNTs5jzhSj8voXM6OnPOuo/nQ66OrNL7kdPfng8C4++CyJx41lyq8LBExh3slbyE8PqOuAPgu44TgcfT212EQkhXA0acjiXUNZXMpL0OZmmAf4tezxLGE/apCbk4vurgwvpe8e2i78YpRJE/U3a7oIsYGuhrnanH5Dj0vretGJW3NaH5OSlY/0vVEQ1J8QDhKYk5DehvhZunybnz7+RgBqLJCKRl3MedFJIl63sectpZ/DSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by IA0PR11MB7693.namprd11.prod.outlook.com (2603:10b6:208:401::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 23:47:30 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 23:47:30 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "Mehta, Sohil" <sohil.mehta@intel.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, "xin@zytor.com"
	<xin@zytor.com>, "Luck, Tony" <tony.luck@intel.com>
Subject: Re: [PATCH 4/9] x86/nmi: Remove export of local_touch_nmi()
Thread-Topic: [PATCH 4/9] x86/nmi: Remove export of local_touch_nmi()
Thread-Index: AQHbn3LWZ9BEqdcEhESHiLDW1gBoMrON758A
Date: Mon, 31 Mar 2025 23:47:30 +0000
Message-ID: <ae57b1c048849caf26135f9b03e6bd36af95e847.camel@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
	 <20250327234629.3953536-5-sohil.mehta@intel.com>
In-Reply-To: <20250327234629.3953536-5-sohil.mehta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|IA0PR11MB7693:EE_
x-ms-office365-filtering-correlation-id: 7ab6a672-4733-4ddf-5c96-08dd70ae66df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bnpFMGZzQm80SEdKZU10LzltR1pSSDVrQWtTb2pyak5NTkJXTWJyOUI2enQ2?=
 =?utf-8?B?NVI2cnZpUDQ4bDVSRnJSMVl0MVAwREI1aFVFYlZyTkw5V0VDeFNjajB4TUt0?=
 =?utf-8?B?YWNUZFZna2ZFRllJWnZJcWVQUWZmNHl6WktHc1FxTWwvRVlhaG84aDdod2Rt?=
 =?utf-8?B?NjAwdDZFVWdQVEkxS2V2Kzd0QUxObEppWStqeW1ubXpyQXlBWlhBRzB5NkZz?=
 =?utf-8?B?WC93SXk3QXhGWC9rcEtrTmJCWkZFdldqOFJQWW5DZFRzbHpmWGpFeE9WU1lF?=
 =?utf-8?B?NHR5OStRTjFQVkxlc091Y3FhbnlYUitCUDhvY0VnTkcrOG8xbjd0dmlDbHJY?=
 =?utf-8?B?TFNqaFBLeTV2S0xmd05zZi9VMmdxazRvRGZPUGZ2eDFCdEZNcml6QkY3S1Zs?=
 =?utf-8?B?dlNBOURFS2cwUkd1OWNWTHRrRGlOWlFCYkNkNXprUVR1TXk3ZGhKdFVIS3g2?=
 =?utf-8?B?MWlvQXlBZHBJdG9HQmtYb2QvTHkwczREZlQ0UDBNUng5cjVvMUo3dGZqUkFu?=
 =?utf-8?B?VnpNTUhXUVZ3M0k5T1ZxZnA0L0l3NGViaWNOZ3Znd200RUx4bkpQUVhlSUov?=
 =?utf-8?B?MUhGd1ZzWnBnV2YwMWVtRko4R0tmVmFEeEtzR2JTNHFCY2hSYitkbURxSnlN?=
 =?utf-8?B?KzMxTEJMWlhORU5yOURmRmZQcjlKbTZqTS9nTWZ4M1NPSGlMNWRMcXRrTzdY?=
 =?utf-8?B?OHl6M3JwR1pMeStWeE13NEpLQ3gvVTZ4NEJBZXFYL2tpbGNqQTBYOWVHMWp5?=
 =?utf-8?B?MXR2cUI2dzY4VjZpZWptVXVLbUV5VDZWaFhiN0d4QnRmTyt0UmVUWVl3TEJh?=
 =?utf-8?B?NFFNRWJVY21yNGoyR0c3ZzNxbEJrOFAwdno0YkowTHlRdW5zZTFobTMycStv?=
 =?utf-8?B?SllSMUhRUlhFdmlYTE9ycHZ1SGRibGRuNERVNDdCakl2aEZTRUlGM2cxRHND?=
 =?utf-8?B?Vy9PcHRoM1Y3MU94bUVsa0l0K2poRG9Hc2F2UmdRTmJwUjRsU2NFb3ZRR3dH?=
 =?utf-8?B?Z0FnNXRhSVBVc0gvaTdKSEM1RmtGREdXUHIxbEp0WVYyeWEzSlRZZXdaYWIx?=
 =?utf-8?B?Nk1JR3BUM1hiVlRibExoT2IySXBuaFFGNEJZOXJFamd5dk5XSGpRMktmcUFC?=
 =?utf-8?B?ZEt2eVFRN3NaTHQycDcrNmxTZitOUTFZWG9CbTV2UHdpNk5Jb1lTUzZzZjRK?=
 =?utf-8?B?Q09QNE9qc1Q4Y0huSXVvQjJuYXg0cGU3RG9zQmxsd1VDbytBRVZXaGVzK3pr?=
 =?utf-8?B?ekVJU0ZpVi93NHdCTzVGNU81bFEwZ2NRbTVCSFA0SUJYL2JXcWJObUU1SEhM?=
 =?utf-8?B?MklqdDhya0s5VlhUNDJzVHcwdi8yeEt6cVFxdmo1SzM5dytYSDh6MU9GV1hR?=
 =?utf-8?B?MWVOVTczODZmR2pCTXJYWjVuVHkvTnRJSkd5ZkZ3WEVCdDd2RmluZk9rM014?=
 =?utf-8?B?NXR2dEp0ek5JMnZTcmNaQXFQUFJUWUFHcE5PUkN3Q1d5VFRmVlJ0K0JyeE5G?=
 =?utf-8?B?dFU2UGdSdHdtWFlxS1crTkVMMzNFK1dhZ0tmUmo4TytqdDVHZmJwVTVHTTJ5?=
 =?utf-8?B?a1lqaHk4S3Z2S1gwT2haTUJPdXNGUVNxK1RSMjUzYjEvM3VvZlovS1kyR1Vn?=
 =?utf-8?B?TlhGam5IdDZUcm05ajZSa2dGV2haSFRLZFJ4TEF0VnliRFBJNXEwNlVKNVF0?=
 =?utf-8?B?ckFuT0V2aWN4RVVldGxrcjB2TUJTZnNnNENtVW5YUlJVejR5SGk3WGtPRzdv?=
 =?utf-8?B?MzZNZXNJUVlzQ1BtWFJWVEM5UTRtdXZXdUFkMnZuZUNNZ01keWpZVmNDNVJP?=
 =?utf-8?B?WUhTK0RWQUJnbHNITW1hTnlMZnFsdG91VkQxTUZ0SGV3Z3N0YndCRG1Xancz?=
 =?utf-8?B?OEwyN3BsM1BhNk0wbWQ0ZjlSVEU2WUpNdXlYV2FXbUpqOU41aDcySHdMWG1C?=
 =?utf-8?Q?RtYJgYrQgjBBwqD7YOvKg3K58NkguzPu?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0hSR1Y4TVJqRGpiWmU0QWRHOGNyN0hUZ0FxZTBpbnhGcE9jZ1cvR1NrZngv?=
 =?utf-8?B?YkE5VHN6V3hybmJiWWpOQ2JJald1c0RhdStucFlNbEZKc0p4bmdOUHBjUlMz?=
 =?utf-8?B?V29kWlVwYitDZzNKcnRHTklub3hYUjVLVmRZZWoyWkhCQzNudlhqU0RhV0x2?=
 =?utf-8?B?SXdGN2pqcFA5TzJMU3FOSjE2N21IdDc1eWY2RjdKTC9uSUhlTzFOTW9iMW42?=
 =?utf-8?B?NHh1WU5icjY2Tk5HOU5renVOYzVFazladEM5M0F2S0RIQ1lnS2JIQkNvN25L?=
 =?utf-8?B?dEdpZzUzMTg2cFMxNkNmcTBna2thMXJHcVFidjFWWnJwd3F5RlhrOGJKY3Vr?=
 =?utf-8?B?bWhPZHIxVWpia1pMeXZLNTYyT3U4cjBZLzVKaFp0RFZYTHdpUHplQmxsZDZB?=
 =?utf-8?B?dkVsY29hb3Z3Wm5qZ0Y1U1R2SityOEFjdGhaVkh4RzFiaDU3NW9xQ1RxZVRa?=
 =?utf-8?B?M3F0c21HZVQ1WW1VdUU1ci96ZGVxaXZQV2xEcExNRE1UdXAwUGlVMnI5Wjh0?=
 =?utf-8?B?b0NTZVd3RVN4OXdDM0ROcmJFdVloTjJ4OWpNNmhncTJFT29OVjgrTTJoWkIv?=
 =?utf-8?B?YmpLM0IvbFUrbTJnZGJuQS8rZ2dNa2ozK0VqZkN6VmtqUjV2a2NTU3pDRmZT?=
 =?utf-8?B?VnVKNEhncHJiK3dVUVV5b3ZjWUV6dzJqaGttTExRQkNkSDc3Y2VKR3hJR1ZW?=
 =?utf-8?B?a3ltZ28xNkhxeXBMcXdDd3U1OWdnSGhUQ1hCZS9CMWhDQk5Ud2xmZCtBamRx?=
 =?utf-8?B?UTJiczJzUGoybk9GdVpxdXlLTGNGdk41MzV5cHpTaGtRWGNNZnVub0tDNVlh?=
 =?utf-8?B?NEFSS2Jha1J1ZVBZNGZyU2NLK1ZhdlNIMjhwMHVyczdvQWRlcjZzSjE4U3py?=
 =?utf-8?B?TDZOT0M5b0VyNWtsbXErVU40NmVBbGd5OERPMktPU0RWdUQvMndHWStTVlVV?=
 =?utf-8?B?WVZUWndNUTVLSlgrc2dGVkZlYnIrOUwzbU5JRTlTNkUrVGF5V2ZGb3BROXJW?=
 =?utf-8?B?OE02bFdpVEl0NTdXUkp0Nkdrb3dtZERKeUNmVUltL3NheDJPSjRoWkVPOXJq?=
 =?utf-8?B?QzhDSlV0RnRDTGoxMU5JVnhkcGhLcUEwR3BUV0hNSUV5ZlJMMGF6RDNKaWFB?=
 =?utf-8?B?TlI0OFJJOS9qNFRyV1Q2V1A0MWYvb3I0dC9hZkZzVVZVUnA0dkgzNitaRDhw?=
 =?utf-8?B?WkVjL0xZS243YTRDZWgxZzY3UUtnRkZzVWw4K3dZejgyNzYzZzZjbmhtVlV5?=
 =?utf-8?B?WTNTY2hqSkNqTkZOQmRHY2EvY1hhMytiR2JTU0hEZ2ZabS9RcmRhNjd5N0Vp?=
 =?utf-8?B?dnR6TWQwSkxGZ1VFT0NOZTZ6alAwVTNpS2VZblBscXVCUTdxSkllRDdUcC8z?=
 =?utf-8?B?dmdlRDZqZ2s1VzhTd2hkZXRBcWx6RU9ScDcxc1FsWlQ4WDNMUHhnLzZlczJT?=
 =?utf-8?B?NkZGUkhxVm5DYW5Va2pDbWRiblFmaVY4UFdwYXpNakR4NGVpN1lnejFUY3dG?=
 =?utf-8?B?cUFUdGJ5UjVWako0VlVKaWkzOU1uM2Z2bU5CQ0tYRERTZWozZEI3Um5YRmEr?=
 =?utf-8?B?UWtJd1ZtZklVaDcwVDlQMkcwL0hQUWhtTi94SnF5MXp3UTJVK0N1dXMxYXR2?=
 =?utf-8?B?bWJSUFlwNDVzZkJoTnprSVphZXpiOEpHM2xYUDFrSHB3YUZja2RtK1ErYTVK?=
 =?utf-8?B?bnJqKzJxcy9LOEtDcWhWZWEyOWxMNlY5MGYzYnNHcXdsZ1hmemJCdm5rS2lB?=
 =?utf-8?B?NEo5ZGFLdm1MMGtnZzlTRDBDMmhSeVRjdXp1L01vT2xxR1FhZ09kWS9USGR0?=
 =?utf-8?B?VndWc3lpTEZnUmZSbnFDRFBVeUNLbnl4dWc3NVJCSTB5ZGljaTc5TytDRzFF?=
 =?utf-8?B?M2R6ejYvWU5PTXlldlhZcmNGYUpRaGJZRWhYc0tnbG1KRkJIRS9IRDFlbzRx?=
 =?utf-8?B?SmlvMDVyRnd4L0ROMjBIK2hXVnFSS1RPUEhSalNqbzkyb1QrdDZtTjhkTlpD?=
 =?utf-8?B?RmhBWlgxQ2pVWlk4b0FhRnRZWU9EWjQ2VGVsMVI0WnAvRk1ucTZkRmorSGJV?=
 =?utf-8?B?N1dxZ01iRGpmSmJZeWd1NDd5cmF1bVVKOGRqL0Q2M1NCRTJuYVRiL3FOQWdJ?=
 =?utf-8?Q?qfWkfzjXVZBOfbS5x3AzWDcHK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDB89775B1DC074F9E2D49D3A673ED1D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab6a672-4733-4ddf-5c96-08dd70ae66df
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 23:47:30.8669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jzBtIHbUaS+j8/dCbg2b4WIY4B10Goo1gYcKvlQWS7clMljgawK4YQvlgeJi8a+tCmd175t/hOAlY610wQlkRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7693
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTAzLTI3IGF0IDIzOjQ2ICswMDAwLCBNZWh0YSwgU29oaWwgd3JvdGU6DQo+
IENvbW1pdCBmZWI2Y2Q2YTBmOWYgKCJ0aGVybWFsL2ludGVsX3Bvd2VyY2xhbXA6IHN0b3Agc2No
ZWQgdGljayBpbg0KPiBmb3JjZWQgaWRsZSIpDQo+IA0KPiBnb3QgcmlkIG9mIHRoZSBsYXN0IGV4
cG9ydGVkIHVzZXIgb2YgbG9jYWxfdG91Y2hfbm1pKCkgYSB3aGlsZSBiYWNrLg0KPiANCj4gUmVt
b3ZlIHRoZSB1bm5lY2Vzc2FyeSBleHBvcnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTb2hpbCBN
ZWh0YSA8c29oaWwubWVodGFAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogS2FpIEh1YW5nIDxr
YWkuaHVhbmdAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgYXJjaC94ODYva2VybmVsL25taS5jIHwg
MSAtDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2tlcm5lbC9ubWkuYyBiL2FyY2gveDg2L2tlcm5lbC9ubWkuYw0KPiBpbmRleCA2
YTVkYzM1NTIyYzguLmNkZmIzODY0ZDU5YSAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYva2VybmVs
L25taS5jDQo+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9ubWkuYw0KPiBAQCAtNzQ1LDQgKzc0NSwz
IEBAIHZvaWQgbG9jYWxfdG91Y2hfbm1pKHZvaWQpDQo+ICB7DQo+ICAJX190aGlzX2NwdV93cml0
ZShsYXN0X25taV9yaXAsIDApOw0KPiAgfQ0KPiAtRVhQT1JUX1NZTUJPTF9HUEwobG9jYWxfdG91
Y2hfbm1pKTsNCg0K
