Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046C642A9E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744408113; cv=fail; b=kRFWYyFQ5gcq255dhpjlXHUVfqSingD2M8Kffqg61et/ZRe58DsiH03jdP+R/eTkickhQwgBq64Z+QMPLiZ9KObUp3hSGpbrYTiIkKVr5uJGpplleEM2mhsEVcOUVvFH37/qbwfHgWonal1qr326MQuW7Pl42lxZWdAQAV4hOX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744408113; c=relaxed/simple;
	bh=vRkh6TtGP3hCdKzx0uKeEMCyAUJx32azp37L3E7UBuY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BsiLOwwsFw91l/lzWoEFVO0Bb6Nkyw8gXUSgH/3xIkpGiMfdlpVUlzCXEtfTnP31z3BmfwhCTpKZsIE/OlsGwpAaQptdp+UF3jZGWBHuRnuXHJPkHlC91944qejwuhoRrjsp6hhfv8K/4GWbSxL3Vkt9aXWYBLj+hyMKwe4DvXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyPlVEcV; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyPlVEcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744408111; x=1775944111;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=vRkh6TtGP3hCdKzx0uKeEMCyAUJx32azp37L3E7UBuY=;
  b=cyPlVEcVnQ0rc3IDFivNrVPJnKJgiPXY7K0RgJxfVRmSUom6z7doy2tl
   5SIQmrZv4fC/nSMP6s5E78pYrp1TOdCXPMUmFbh8hI+cDZAJdzmauasmj
   HqeULv237AAiK9QZPk1D2g54hcfairwK2bqnUCxrOxwA1V6+0kG0JvHCv
   4TPMSK4zEPqrblEi6skE+UuELS6mYwImfNFyZf/V4HrAxFTpKAEV2gF4X
   rHH3L8EVVagIKaVSq380Xipmk+XzMcj43FkRnAaO1UCuPdudeVbljNoqS
   xo2SEA6LlhHKRCh9OvlyuOQqJblOvtATwvSQlW7WI5noNTxVx2GFOWn7F
   Q==;
X-CSE-ConnectionGUID: bqVLVbhbT2K6WOrKIAsr6A==
X-CSE-MsgGUID: nS+OtyvVRWCb3Rsco2wcow==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46136414"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="46136414"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:48:30 -0700
X-CSE-ConnectionGUID: GbaCHu6TToSOiOQ10BkJag==
X-CSE-MsgGUID: DrkyQgjSS0Gpvd3JAzQV1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="130142191"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:48:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 14:48:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 14:48:29 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 14:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pu5m9kcHewBelP6RfnarV8+C1d20MHhIn3gpFe01NeQLozRfOnYazv88aYNNY4bP52RPYUZXiGC8pAlSw2CGIxQHnSl5AUm9wNW8GEagnUKiVaW0LoEu1AgLTtbHICJcNkpAkmrIp/ZqpaFVeErAVQsvPPFxQRHk1dQqFEYhZPSSlxR82VjAum0Ou8McoCqv9VUPwPwNyNcBW0c1NdNq5plRDra36cYXTWdiOJ2odcQd6mWSmTso7oK39v0Ol+RtlAtSCQNb7ByaXLxS7cjO7JB8qvHc4FNW+3W5PJi6LaaoPhvxWt8kQvlYvqhjyz/wGJqHHU0ViGM95wjHnIFnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4Hs3LtkUc7sjRzPz9/7yKL9GvtOAlT0PTr5dSaYiLk=;
 b=xs8wHT0taZIxft5Pjqs5gMiz0U2yuZiVHnETlAJgMwXGRU81KEaBseEwgZL2pP5YXw7DukYh3FKrUqNVgDdxyb6xy49lZPAtvnU4/iIKVToYvtgPOz881nBTqk1aWZhdy4ptQIxatcsMPibCQExme3MoP8rT76fNTmmwG5epti/iNIo3jrVQWncLNp7derExXce46+f+/QBAkkA7kKtOpJvfC1cR/TMX+R/bYCkRdzLdzlBMRnaOrgv86q6vnY5f0MTjhUo0TYgw+PzlviBixzzVW2SsnJFpijNgXtqdxMyRm4z2Yo0O98dlmeasNHKbY/BQ/vwQtmE79UJ5gJ0Ozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 21:48:27 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 21:48:27 +0000
Date: Fri, 11 Apr 2025 14:48:23 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Dave Hansen <dave.hansen@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, Kees Cook <kees@kernel.org>
CC: <dave.hansen@linux.intel.com>, Nikolay Borisov <nik.borisov@suse.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] devmem: Block mmap access when read/write access
 is restricted
Message-ID: <67f98e27a799e_7205294e3@dwillia2-xfh.jf.intel.com.notmuch>
References: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
 <174433455090.924142.10859114556652046264.stgit@dwillia2-xfh.jf.intel.com>
 <202504101926.0F8FB73@keescook>
 <67f8a1a15cc29_7205294d7@dwillia2-xfh.jf.intel.com.notmuch>
 <bf63b3e3-afdd-424c-87dc-f5488e770315@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf63b3e3-afdd-424c-87dc-f5488e770315@intel.com>
X-ClientProxiedBy: MW4PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:303:b4::17) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MN6PR11MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: afae3d50-ee3d-40dc-c646-08dd79429742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFNQRXNGRFh4WVVHcE5GakVMNmlYcWEyOHM3RGFFMmJYOUkxeWlZYkQvV1ZP?=
 =?utf-8?B?dWMxR2RCVVhuN1Avc0xWZXZseDU1R21uRDVVeEU1MVZZckFZY20vRzluMWJF?=
 =?utf-8?B?R2t6MGJVVEJ0aU9XZG00UkhLOGl6Y0RNbmdBdTk0NDU0VGx1QjdDcHVWNnFI?=
 =?utf-8?B?SEhQbVdHZjZkZ2pGSzFFSzVrdHh3Z0VuQVFvMlpybDJVSUxpeWYxMEs2NzBx?=
 =?utf-8?B?c0JpTzJsMkYvZ0Z0Q2FBQXQ4Z0pTd1NPMDlDWkVaWVhnbnlMMEdRZEcvb0tG?=
 =?utf-8?B?NGg2aGN4QWV3cEkyUHYzRmJ5QXlLaW9hOVJyWm8zMjg2N2dGZmhHSjRITGdF?=
 =?utf-8?B?YUpjK3hiYTJ0dnRiRWpLcENKRlJ4bUFRUW9WZWlOU0ZsNXhGZzgrRnB2Wm91?=
 =?utf-8?B?YXM5ZG12M3FnSEpidkw2WDR2Y3FBNFFzM3B5VzVSODY2bmllKzZDRDdCK2d2?=
 =?utf-8?B?ZVVxN2sxNnZFOFpmeDVlKzRHTEx4ZWt3NGozZHpuQkQ5NC94azdPK0M2cG9y?=
 =?utf-8?B?L0JBYlFCZW9JUkJKaUVDWkNkOFRLK0xGRkVLTTBhT1VsSzFYOUp1UzJ3ZTAv?=
 =?utf-8?B?VEgrWUpST1MyeEY1Q3Nld3BZOXY3TnppajYrNEszY3pMRGlNWVZ3M3FBOXhS?=
 =?utf-8?B?cFZBZnJwQmhYU2ZCVUNhbnNGMjFmbzFMbVJLcU8vOE11OUUyMURFd3ZEa3Fz?=
 =?utf-8?B?UjlsWlBMQXdKSzYya0ZKYXNCNnpLeUN1SzQxNzhzOENtaFFzWmhEMlJCYjBx?=
 =?utf-8?B?MUVYNC81bnYvb1VrUVdzeUlvZGlzc0YxN2t3Y2N1WDFJVUhPbnB6NGtld0xQ?=
 =?utf-8?B?V2pld3JmRDdQRFI0UUZtSHYzZDFHQzhTU3QxS2QzYzBzSTdCNjZzMDRHSUdX?=
 =?utf-8?B?OXBjQ3J4TGdyVkFIQlFWUVlIRTRwemN0aXZBN3RsVjZrTXNxakR3aGQxSEti?=
 =?utf-8?B?eFFPWDg2SVcyOFpzSXdJUWFkdnlqaDQxVGp3MkhtVFJlOXcwZEZmSUorT0xt?=
 =?utf-8?B?OUNBQ2tRVHRwMEI2Uy9oRnNUWUQxU0VOTGppWTdZRWIvdUdPYU1pSlpFZ1A4?=
 =?utf-8?B?MXpHLzlLaGF3UC9FUXNFT3V0engrRyszUXBCSDVLYzdDMUwwdzUrVndFNTlM?=
 =?utf-8?B?dVZqQkZQSXg2RHNuWDZMMFZscjdCcWNrbjZBb2t1Q1IwaC91OWtBd2swbzFo?=
 =?utf-8?B?b2U2OEpzUE9hMVdWSVd6Z3JpVEdVM2k0TCs1UWNwbVZ6eWZoQmVBakwwT2lT?=
 =?utf-8?B?WlhvYms4TzJma1ZuVjhUM1Zld1kxTVhZYjhPWlhCM2t4cmJxbnJ4bG5CUEUw?=
 =?utf-8?B?WkhHalNOY2JrMmhha1dja3hsckoxZ1VRa2JleVk5Qzdrd0xiUDdiT3FUY1Jk?=
 =?utf-8?B?OGx5QjNPSS9EWFJEMzVYenZ0Y3AvWWNZbDdCWDhJZ2wxZSt6K0poeFYxNzRj?=
 =?utf-8?B?SHJHQ1UxbTR1UTJIc0RRNVdpSVQyQ1pOWkE1U3NWU0xmZ0tvUGFvNENpanV5?=
 =?utf-8?B?SmxoZkZPelMzSTJIT3g2U3RVMmNzc0swUWhBWFBpdjhoOEYzR2Zud1pjNzdS?=
 =?utf-8?B?RTJ4RCt3VTlkbXJ2L2Y3YmoydDBiUFl2eGlSei9VNzlZbmVIN3V6Q05wV1pm?=
 =?utf-8?B?bVg3QnlabzNrOVVKWXd5WkY3cGtITW5FRHA0MmdCTitFNmVuQzc4Z21kSnIr?=
 =?utf-8?B?bHY0RkRWazJkQ0dwZFJ0eEVNWnZnSW9WSUxmVUg1b292ZU5mNGcxeGhta1RE?=
 =?utf-8?B?ODdsUENnMkdBMjBVK1phTStyaVdOY3VMZUpxeXFINUQ1U3JOZHdvZGgzZWxp?=
 =?utf-8?B?Q3hmQUs2VXdWQ0pUWXAwTDZOTC9Ma0tTMmJvd0lvMXNxRUNhOHFhUWFyQk4v?=
 =?utf-8?B?aFNmaldzMERGUDZWNytaUVVmS2xDYmN6WFlVQ2l4bFNTYzdpNTJLekRnUElt?=
 =?utf-8?Q?ZDlFEkOBdU0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEs1NVRTQ0ppRHYvZm1yRS9PV2lxaDZHRGdOVkRyazVHN29MTjRUaU1ibCt3?=
 =?utf-8?B?WjZFZ2ZHemxrcHdZUnhJeVhyKzJWdnNaZXNxWXYzeTEyRXdLcDgyMkNDckpP?=
 =?utf-8?B?eTBYRjk4Qk55eTRoTGZWN0VjQXRzNElHZW05dlk2SzR5bm1hWTh6bUZFL2Q2?=
 =?utf-8?B?MTF3L0lKMU1iOGVYdnJvaTBYZjJOUitibXIyNXl4MUZkc21FSmgyODJWdVpC?=
 =?utf-8?B?SzJPVXJXN2hkeUN6SktNTHNyemxsclYwK2MzWExrRDRQQ09wZmdCcjI4ZUl0?=
 =?utf-8?B?aCsrclJ6WVhrV0pMbVNLTjFLbS9DT0d3YkJrb2U4RDlQbklIK1RsaVhCbzEw?=
 =?utf-8?B?TExTZno3SllBQm5VRy83Y0FEeWlPbjlCQmlSWGcxdDBicitHSjdHQmhsYmRB?=
 =?utf-8?B?aDNKakxpejUvSVpzYlFLTFZUUTVIMUlZdVFDUW5kQXZFRGFUTWZaUkhrMDRa?=
 =?utf-8?B?T0lXbVN4SFFBYzdPZTRoUnJJcE9RWlVUNC9PN2dXN1JqNlljZXNJbHBwdlQr?=
 =?utf-8?B?VHhqWEt0bE50Rzd4d0sxMjAwbGhZUVJia3pjMExPTmdBY0kybTVXSm5CeTdk?=
 =?utf-8?B?akFuV294bExpT0xuWGpFb3NsKzV3eFIza3RyTXkvUkx1N0hObE81STRXTm5O?=
 =?utf-8?B?a1pPSGNWM3Bta1phaUVQZE1BWm1PMFA4K1RLZUN3T2pXS2tWMnFkMzI4TTBK?=
 =?utf-8?B?cExDWUovTFpIZlk3OGhzZEZsdjRqT1NLcHQ4N1JUQWpBb3FocitsL1g0dTVz?=
 =?utf-8?B?WTdsSjh0MFdpZUV6WjFjSnlxRElEZnZBK2pHZFZqMDFtYWh3M3lMMm0xYzJs?=
 =?utf-8?B?SjVvak1QZXBzSzErYnpJVUJwdjVDZmZvUndKV2tPOHFwZHUrV2crMis4WVBm?=
 =?utf-8?B?dHJ0a0VwNVIzSUZxMmlnZGtDaEM2bDA0MkZ5TEtUWUJwMDlGQTlrR1R2WFZO?=
 =?utf-8?B?RndERGNScktmTVd4UHpqYjRXdGdROWc0bkdYOFRyZDQ1L1M2U0d5TzJKQXB2?=
 =?utf-8?B?MW5CUDJUUTZTTERZL2lpNktoeGs2aEIzZmdudjUvbUp4MjNLMml6d3NxdVFC?=
 =?utf-8?B?UGx1UHdWTlVselZCVHk5Q3ZHLzRuS2xDdFlTNytJQzBxSytFZ2tJdHNYNWZ5?=
 =?utf-8?B?VjhpditKbk9PSXFTZTZQaUFSZlI1b1FHc1Y0enZRNWN1dW9IUXNkWnczNUIr?=
 =?utf-8?B?ck81alZ5ajBGemdNMDIxRk5FdTVrN0tybUduS2wzRjZFNWFhVnphS3dLcGpF?=
 =?utf-8?B?R2RXNGJmYjFUaVRyUmlFRHF6Rm9XMHFOSXpxalIyNng0TVNzTXYzbEVFV3Bq?=
 =?utf-8?B?YzN2TjRZTjNEVHBTMUNNdXlkSnV5cnF4NGs4QmFVbTllWU4zdkZCWHdGQzRa?=
 =?utf-8?B?cDltcnRTWWtZRWl1dVorWmhqekRNUFBPVlhlYUJTTUN2SkVoRmlReEw4cC82?=
 =?utf-8?B?Q0liblNVa1AwRmdycUphT1hxSXNMek14UmQzT2ZrTUhiU0tWeG1QbTV4THhP?=
 =?utf-8?B?Qk5RS3hnQ1VmbmtJTFVBZWlDTjkwWEdxSGR0a1RNUDdEUU8zYWRKK09EdHp2?=
 =?utf-8?B?VVdkS1VMY1BUK3kvR2NxQ3M2MU9lVWxzSEZKRG15dWJMTDNESU1kb2NmYkxo?=
 =?utf-8?B?MUdDSGNJZWdwbjVCMUVBVG5tdDY0VUNFY2RTL090S2VhSGJDR1Y2OFFDeFJF?=
 =?utf-8?B?WXhEdFFhWGQ1bHJVZmVnNmZudW1ocTZvTHE3UytMMTF5R0R5WUtBQVZ3Syt2?=
 =?utf-8?B?NEhYZnRLdTdSbUlwbUY0NE9jdkJBMDJBTnFnVnVIUmZVSXRKSFZwck1iRnJj?=
 =?utf-8?B?b1B6UEdyTTJZSEV3cTlRS2tBQUVnNkJDakZwcjV2aHV6RkNXd3RhZlJuQW9W?=
 =?utf-8?B?cXZCTFY4VElaRVRSdWkrSWpxM2tYV3RrckNvdytQR09NaTFXS3hLM0JOZTdP?=
 =?utf-8?B?akZuQ0dMZkQvN1U1WWx2c1RuRUM3a201NExJOU01VU4yYkM3MWdRTlBVMHR6?=
 =?utf-8?B?Nk1QZjBuTmRwSDVTMWJZR0ZlVStzc1VoaGVhOUhqRUNRN3Uya3NhS2JxYnMy?=
 =?utf-8?B?T05OajVSZFZoZlRuc2lVaTMrYnNVR0tzcnB3NGtuYkhuY3ZibjJ6b3N2emtw?=
 =?utf-8?B?dS81TitMTzZXNDJWQU44Q0VuaFJudVpTVFZKazZIaUwxKzlabFVWckJ4TXh5?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afae3d50-ee3d-40dc-c646-08dd79429742
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:48:27.0497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgPjZoJE+UC/oZQ8A1VYfa4ab60WYoJrt43eGRr6mXN939s/xBkMp05L1GkOILZk3aRJY3t3X5yNnzL03UNm+AKBfZ6xeOUWddMfQ4jRHx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
X-OriginatorOrg: intel.com

Dave Hansen wrote:
> On 4/10/25 21:59, Dan Williams wrote:
> >> I don't think we can just fail the mmap. 🙁
> > For the TVM case the havoc of failing mmap for DMI info is smaller and
> > the recommended fallback for /dev/mem being in accessible is
> > /sys/firmware/dmi/tables. So I feel ok making TVMs take the modern
> > replacement path which is what they would need to do anyway in the
> > lockdown_kernel case. Tom, Dave, what do you think?
> 
> Yeah, doing the same as lockdown should be fine.

Note that lockdown fails the open() for /dev/mem and fails the mmap()
for PCI sysfs. So the proposal here would arrange for lockdown to not be
required, but fail mmap() in both cases.

> The other alternative to failing all mmap()s is to allow mmap(PROT_READ)
> to succeed and then just map the zero page.

The only goal of mapping zeroes I can see is to attempt to break legacy
userspace less severely, but as the Debian code search shows, legacy
/dev/mem users have already found the mmap() loophole. So, zeroes for
the TVM case does not help satisfy the requirement to use
/sys/firmware/dmi/tables and other modern methods with
private-memory-safe semantics. I.e. the "success but zero" and "mmap()
failed" cases have the same outcome: legacy software falls back to no
DMI info.

For PCI sysfs resource mmap() the semantics are different. mmap() fails
only when devmem_is_allowed() says "no" *and* the kernel has marked the
range as IORESOURCE_BUSY in the iomem resource tree. That should be
sufficient to allow userpsace PCI drivers in TVMs because the goal here
is to avoid simultaneous mappings with mismatched encryption settings or
allowing userspace access to unaccepted private memory.

As long as the upcoming TDISP code is careful to hold a
request_resource() reservation over attempts to convert PCI MMIO from
shared to private, it should close any potential for mismatched
encryption settings, or access to unaccepted private MMIO.

However to get that behavior of not allowing simultaneous
kernel-ioremap() plus userspace mmap() of a PCI resource the kernel
needs to be built with CONFIG_IO_STRICT_DEVMEM=y. I note, for example
that RHEL does not set that, but Fedora does.
