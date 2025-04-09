Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF8270EA2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218378; cv=fail; b=n6XdYnE0txO0l2KOPtj8mNKB24EqQm/rMUUPP2dkhxhikKfaVv6SqdH7R5eVUzuhzBZY0oh0Zm6VGYylDhXXB3xGYmrQRmlwRxT9TiUNVneqSyhGuKUGqRocA9864OTyvKFJYtr9Qe/Gdttwo3eLxafnCqg3NLaLGlKUCc32QVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218378; c=relaxed/simple;
	bh=V5clAtSilL0qKm57RFq13VQ7zQHLu/zbjd6hPGfgr9A=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d8FbLrbVMDLp0H3NaUe20AQlvken3s1dTL6iRNu0sIxcKIdbL6O2+wjjUMyemJE8bhvcFksGQkrfcDQKOhfZmshbJZaGwOeyx+XsTYIRgm6sk1KuVYl7mJzVw+r7iOdIJMm2BftgkbGCX7pF79F2W0V8jH4e41sLU3oaEmfQp5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+SM2Sre; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+SM2Sre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744218376; x=1775754376;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=V5clAtSilL0qKm57RFq13VQ7zQHLu/zbjd6hPGfgr9A=;
  b=O+SM2Sre6UZ42pE0w8RInG57Nxz1N/kEoLr8EAnMZI1pXxbds4Rw1mxm
   /OKk5YjITHtXQAs3oj1pcZDO2HU6if6pSvj5MRr11Nwwu58QIHIwdUR1D
   +eWltETGH2gJjyKQowmSFgJcyO97WHuGmLv2VsZnotEZVH+aSVvbxVe4k
   gTfhzWZVOuwx4Mjysi/cWOemDG2lJwEalTF6TtwrDEN1jJrhrldSl2gEq
   P4yZAyI4G1U1YOzqTuHQUvNXdGAel8Ercr29+K0czdXZnHKuRpBx0ztJ0
   868gvl3RDcv+i/OuIH8vIw7VdACjaS2QKzMQqvyUCdYTrvxox1T/Kwp0I
   Q==;
X-CSE-ConnectionGUID: 6O8lDnX8SRev4E5N/lMGpg==
X-CSE-MsgGUID: iD2AgV6YRK2q38rDn06e1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45878022"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45878022"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 10:06:15 -0700
X-CSE-ConnectionGUID: lhNSo8JdSeW4Zo2EKvChrw==
X-CSE-MsgGUID: YDdvMWmKR4qbd7WHKZmIDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="128992907"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 10:06:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 10:06:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 10:06:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 10:06:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8h58z0jq0Kddv4fgC6k6RO/uGVmbwOJU1pqKM8d28UPPsPuRg3Jv/wyj7nPOyqyDjL52v1/6YUrtM+A922qlAw5m5Ec/eKxDMFJt+GeG9uEB/LE2nbPzkfypsa4BG6EnCEnUX2G1LZFG/HD2/KaWgE511PPrBIF/sk0RK5sX2s3QrUD0D+16JFecxPpy5G6T19tvBT6PmCqieb4tbx2rdfT6g89pz92U2UEcvvYLH07F0DnnnvrpkbVLBwPMdJELY0B7WMrGS5MBphLFgqrmpfF3pHpozUjgDizWN5+yfVpNrTU+yX5q+wtnIGB8guldpjomdLzhbjuZgsxWywPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKPepItJ0VzFablIeEnwI6e1J3VAbmE6hs/SrD5po1o=;
 b=VBiC9Fs2tMOibquZlXupAKcQKfGMh8BL3yu18fE0W8rYeYrG+1bhYaUOmHf/C4gZfxPiu70jzMsiYoE/P+EfIV8G5cK1frnwVy+c/PuEQKqS9MLPo1VWj3NL+SyO6r+MVSNrLbgyrSiDBMH3zCc71eKx/50fvojAfhpEtc0/Pq4RRj690Sit+1oRjPGibWJYI/eANTo0WO1T1JakKIOMnqQQ4ys95KNQafHmnnC/MXsZ/tpxpthJJaNOAPzGrtfJ24bsSz0pfwoA6XawdhbvMm9cgnorWG8cTQyGxBphGMlfVCMnIsKL7V6XlSzrVyUBfLRrX+PXaF+LtsHIU90GIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA0PR11MB8355.namprd11.prod.outlook.com (2603:10b6:208:480::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 17:06:10 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 17:06:10 +0000
Date: Wed, 9 Apr 2025 10:06:06 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>, Dan Williams
	<dan.j.williams@intel.com>, Dave Hansen <dave.hansen@intel.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Naveen N Rao <naveen@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<linux-coco@lists.linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Vishal Annapurve <vannapurve@google.com>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>, Kevin Loughlin
	<kevinloughlin@google.com>
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region
 for SEV-SNP guests
Message-ID: <67f6a8fe3b01f_71fe2945c@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250403120228.2344377-1-naveen@kernel.org>
 <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
 <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
 <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
 <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
 <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
 <8d5412a3-5742-43d0-b7aa-a0091dc30cf8@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d5412a3-5742-43d0-b7aa-a0091dc30cf8@suse.com>
X-ClientProxiedBy: MW4PR04CA0267.namprd04.prod.outlook.com
 (2603:10b6:303:88::32) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA0PR11MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 48a87b66-bbea-4453-3ca9-08dd7788d346
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K005dStZazNsRWVmWXVUMmxIZGdHOGJtcGJHOWxyNlM2NnpWakRWS3gvZ1VY?=
 =?utf-8?B?T0lGaFI0cWVhU0p2VURmMDNoN1V2NEdIcUxpZ2xzdDJGL09saWIwQ3d6ZTZE?=
 =?utf-8?B?L0N5eXdMNFkxZVoxb1VoQ3RuTytqMDlSVkpLSG9FRGlxZzliN0F4Yk9BMW1W?=
 =?utf-8?B?Um54UURRQ1dsNEtaVTFhN1lGOVFJMkpUZjlUbFFVZ1lLY21uMFpySjJiay8r?=
 =?utf-8?B?ejQvY21TaUd5bmFTNTl4MW1NZHpKVG9GQWZ2MGh0M3JFU2JQelNnRlBFb20z?=
 =?utf-8?B?QXIzUWdwUnBBSldIR1F5K1J5cGJnQnM4VFlTWkc1Q2YvcEhldVM3dGZtak9J?=
 =?utf-8?B?VHlPd1pvV2NQZkJYcDhldmpyYlNnTWhyR2xTa0JMbVR6YnZ2WlJObUR0TlZU?=
 =?utf-8?B?ek5JSEE2ZUwzRlduTGxDLyt0VnRNSWFwT3FsdTRnc1VSMHJHZERKL3FVeTN1?=
 =?utf-8?B?T091Y2YwbzdkUnoxU09wNld2S1l2dWVXMmh5M1dzWFpjN0RzKzZtSGlIdG5l?=
 =?utf-8?B?VFgvd3p3d0YyVEZhOUFMMlJiQnV0eUtNUmpZZG1VVkpVN2o5QlM5enZsaDEr?=
 =?utf-8?B?Kzg3OTFpRFhoUUxpY0t6VEQ0bTQ3Q2sxZUxXTGdqT013SG1PV3grcUNSZW9u?=
 =?utf-8?B?SjVzbkEyVEZZNU5qclJoSUN4OGNjNFltYnZuaC8yd3RiZ0hoVnRvWFN6a0xI?=
 =?utf-8?B?Mm44enllNUR2RXpmNmJUbHoxc0ZoUHd1cWJQZ3MwWnhyOXc5WjdOTXRQSTFp?=
 =?utf-8?B?V0xxVzM2RFZtTkNaYU5Sb0hmc1VDRWpTcjFmbmpiTWpvUlV3WElodGdEOFFX?=
 =?utf-8?B?SThKaEJ4NXhuZHpMVlNOQkkveDk3Y0pXVzJmVTZCVEM0eGhTSzNNOUNOSVgv?=
 =?utf-8?B?Y1pqdmV3SDN5aVQ4NkxsY2pwdWF6U211ZS93cDBPUFI0VENBbm5EVEJoYzNQ?=
 =?utf-8?B?ZG9VN1BRbUM2cHZmUnRUekdPMXphTndYT21CclQreVA3d3g1aytMRUUxUnlN?=
 =?utf-8?B?cVVUSVVzMDh4SFVTdzR0elNsc1ZyZG9GY2Q0RTlCbVMxaDgxTDhBYlJ3S20x?=
 =?utf-8?B?cFBqS3RzQjhKWUI5VkpLWUJRQjYxeiszMm0wQzlrc0QxcTB3N29nb1pDRUlX?=
 =?utf-8?B?YzhzemFMYzQ0a04zN2RpelpIdFBnT09FdnExL0VObGV3THpOUzVENHorNWtE?=
 =?utf-8?B?aTNVcXorTDAvTk1Vbmc0KzFVajdoTkRLZHkzd2doellOdWFLN3JNNHJJQnJy?=
 =?utf-8?B?dEZoOHY2SHVwb1MwT2ZOWVQrQmFRbkZJK216emVMSzZITGh3bG5UMGNmZjI1?=
 =?utf-8?B?aDIvakpRMXZWbFZHajg1MGprRGVtMEQxRWNjTmdzaGhFRGc1cDFFNTgzVk1z?=
 =?utf-8?B?UnRNbFRFb3E1Vmtxb2phc3hweDdRc2dkbVd2STUyeDVvTWsyby9ER3ZsWG9Z?=
 =?utf-8?B?ajc5MnJJamZ3dVBUYzYwc05NVlhQcStlZWlOYWRBNU13MmZVamdoUzUyL3pX?=
 =?utf-8?B?S3R2SzJWQUVQbDhDc1pNSnVUK1BvVU03QkhpODIreTNlNU56aCs4anllNUlX?=
 =?utf-8?B?bFlLUkh5d1V1R3ZzS2tSQlNSc3NzT0E2RmZUMkFWUnpmeVFSL0R4czRPUnFS?=
 =?utf-8?B?N2FFQXdqSS9aeXNoQk54dTRpN0gyTzBJNVpkNkYvemRiWjlTS1JCK2w3a2F1?=
 =?utf-8?B?UlUrS3kxaURITjBxU2FWYlo3YVp2aGlIeE4zc2ZiYU5EdjBwU0ZNeUVlK3cz?=
 =?utf-8?B?aE84OC80MSt0RzlvWW8vZ2EyNVpNRHZhWHNqL0Vlajh3U3RMdzdYZ204NU9E?=
 =?utf-8?B?NnhCbzI1eTYvdyt2dklhVzFVbUViVk1ZVmRxbDlrd1IrSEhPZVR2L1ovcVdm?=
 =?utf-8?Q?wfNBdlVYl3K1X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk05OW5EV1o1TkRMbzBQWmZWUmdHa1pLUXpvTDZGQ0VHQThscVNlY1lIT2h4?=
 =?utf-8?B?Zk9XT2xNUnVvYkdmOFJnZFhTbTE1RHYwZzFPYTJhL3V3aGR1Uk1WYmNYdzls?=
 =?utf-8?B?SGJCT3MwWHVKai9rZjZWSjVndHJ6WlE3SkIydVdxMkxRNnkwblFXb2JBOTVN?=
 =?utf-8?B?dHFRZ0JOMFY1NDNUN1hDRzVxVy9aSTRxT1BQVytKd21SQkZHREY4N3l1SUlp?=
 =?utf-8?B?QmF2ZlZlck81NGM4bHRucmh0MVFobUVmS3JLRzVUYW83MGVMUElYQkppSzZa?=
 =?utf-8?B?UnVsOURVTWQ5NjNqY1F0VEJ3MTNvUWpjUk1xcDVFSnQxN2RxQjNXWFgrM25D?=
 =?utf-8?B?U3A1U3pLNUc5V0lQY3hjLzQ1ZUZ4YTFrSS9JVDg0R2t1Z2IwQkxFeVZHNVRn?=
 =?utf-8?B?N3ZESk1Uc3h6SHJwZ0hwUFY0NS8yckl3dFBTVUhGUkVDQVdlc2lkMHNEeGIy?=
 =?utf-8?B?RUZrNmhxZnJHaCtZSXVnVDMwSnJLeW82WWZpVlFLd09yTXp4MTVwT2ZySW83?=
 =?utf-8?B?Y2FwK09FUnhoSTB2R2dDT3lHS0xRS25UUTdZRWs1MndZay9ZcUpHaG1VY1hS?=
 =?utf-8?B?aFBOaWN4Q2YvQ1NRRzBvK1BXR2ZKTEpyTTYxc0dDQ1lVTGxxcDB6YmIyaGFU?=
 =?utf-8?B?SURSNE91Z1RsK1hsZmJYWlZNWEJMak5FK1lWZFZNUTFkS2Q4K003a0lZRXBR?=
 =?utf-8?B?aytWVXdXTWRib29idEVkTjdvM0kwb3cvRUdiRnNmaWJtcFR5aEJxSE1lMTN1?=
 =?utf-8?B?ekM3enh5emcyNnY5THd3bmx0YkNWOXUrQW1NUFh4Tm5sT1AyVEJJRkhCMmtO?=
 =?utf-8?B?MldhSUU2K0NvczJXN3plZGV0U2dPNEtxM3B2R3ZPcUJYVDFGaXQyNGMyaEV6?=
 =?utf-8?B?UkYxUkxrRE9rWGxoOWRBZEhSU0VGSC9FbGhYQTF1bEpJZWNSL0QzRThVTDVs?=
 =?utf-8?B?YjdibURlYWd6NFcvUXdOVnFWVTdYSVRHOExEWFF3M1V5UHFIb1hXYjBjaUdy?=
 =?utf-8?B?VGtOT0xHVjhkSkVkQTBRNDlHS0pxQjNScVo4WnUrMmhOMUdpZGljODhTWTFv?=
 =?utf-8?B?NXZVd002Y3ZsRGdHaWdPWmxOSEdTRU5JV3BiOEpMbzZNZnpQck1tV2QwOWxS?=
 =?utf-8?B?bDV2emdUNDMzOHcyOXphOFhkWFFVbDZabzBnUWR2VGNuMFpKMm5Mc0JrRUVM?=
 =?utf-8?B?RHVNalMwOWhYSVJpQnppSUtHWkVHZjl1WDh5UnBtN3B0N2RDeE0rR3d4eVVZ?=
 =?utf-8?B?UVVnY1FjbFJvL3N2NzkxTEh2YjBuY2ZLckJrdmxhcVpVNjlMcFd4Mkx6cytS?=
 =?utf-8?B?ZFRYKzI2ZUFOUE9jSTRUamVDVkx0akQ2VjZ4VUxjU2dEa2pRbUE1b01ESk9n?=
 =?utf-8?B?MEp0N1RVSEVzRC8wNVl5TnR6bkk2akFocFV6Y0JxWUFOemNRZU9aMlJnQjVS?=
 =?utf-8?B?YlJOME1pcW5ObWpwMWFXRFJTdU1NUWIzWlU5MEhXMkZVOWFmWTVrQ2lJcmxY?=
 =?utf-8?B?clluLytCRzZQZ1NFWFpNcnZCRUE0RG9FNTNQRWZEOVFoQm9DVk1zdEI0Z3RS?=
 =?utf-8?B?WHlUV3Y1NHdPQUJSWXZCRkxNME1ka1JKZ3lxbmM0NGJnYmRscXU5Y2JaL0V5?=
 =?utf-8?B?RDRzV2cxUmNpY0hNV3A1djV5cTJLQTcwckw5Vnl3VXFndVdRZmpSRUlaeXNX?=
 =?utf-8?B?cmh0YlY3VFpCdjB5MDJ0Zm0wMDVCc00zZWJsZ3owU0xlZ1pEaGpVQXVobkZB?=
 =?utf-8?B?ZHk3MHdPdkRHZnN0K0VGc3hHR3hvZlhKRGZseUo3Q0E4SkZRT2V6T1JUU0NI?=
 =?utf-8?B?TFZwZkl6QnVVajZid3gzajQxQVRwL3VDL1N6MHdFY21pVm1QdXQrV1hDdzgy?=
 =?utf-8?B?U3FZbnRRVEcvK3FnYTlkcjEzOHJ1ajk4S1Y2bHZzS0g2THZxQ2pEUVpDZ2RM?=
 =?utf-8?B?bFRvZnNOa1NXZmhPRFVYKzNmS2dWa3ErVWpqZUYrczVEMmZvTGJ0SHlaQ2R2?=
 =?utf-8?B?aUlNdHRmcUlXdjBrUVNZQ0t0c2YzYjlwQmJrdExYR3hNalVYMENTMkZZZnMx?=
 =?utf-8?B?WFBQaDlJbk9WSnVva3JBTXBUQi9mQ3BiYzFqY2VQRGhsbW9yMHIxNkQ2Z1JY?=
 =?utf-8?B?SXhuNEZ3TzgyQ29xVVJZOVZnZzVvdXV6ZVlTMkFZMkR2cFpZV2s3bzl1R3dv?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a87b66-bbea-4453-3ca9-08dd7788d346
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 17:06:10.2068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmVgvweabZ/gdQnZlKLeLZMY3L+iJ3TG8//my6pyO8ICOQbGSslUQ+wkSkCvFH+V2Oe4f5RRbWC32ZlRaIc4KwR/x4H3SNDizXPStLMi8gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8355
X-OriginatorOrg: intel.com

Nikolay Borisov wrote:
> 
> 
> On 9.04.25 г. 2:55 ч., Dan Williams wrote:
> > Dave Hansen wrote:
> >> On 4/8/25 06:43, Tom Lendacky wrote:
> >>>> Tom/Boris, do you see a problem blocking access to /dev/mem for SEV
> >>>> guests?
> >>> Not sure why we would suddenly not allow that.
> >>
> >> Both TDX and SEV-SNP have issues with allowing access to /dev/mem.
> >> Disallowing access to the individually troublesome regions can fix
> >> _part_ of the problem. But suddenly blocking access is guaranteed to fix
> >> *ALL* the problems forever.
> > 
> > ...or at least solicits practical use cases for why the kernel needs to
> > poke holes in the policy.
> > 
> >> Or, maybe we just start returning 0's for all reads and throw away all
> >> writes. That is probably less likely to break userspace that doesn't
> >> know what it's doing in the first place.
> > 
> > Yes, and a bulk of the regression risk has already been pipe-cleaned by
> > KERNEL_LOCKDOWN that shuts down /dev/mem and PCI resource file mmap in
> > many scenarios.
> > 
> > Here is an updated patch that includes some consideration for mapping
> > zeros for known legacy compatibility use cases.
> > 
> > -- 8< --
> > From: Dan Williams <dan.j.williams@intel.com>
> > Subject: [PATCH] x86: Restrict /dev/mem access for potentially unaccepted
> >   memory by default
> > 
> > Nikolay reports [1] that accessing BIOS data (first 1MB of the physical
> > address space) via /dev/mem results in an SEPT violation.
> > 
> > The cause is ioremap() (via xlate_dev_mem_ptr()) establishes an
> > unencrypted mapping where the kernel had established an encrypted
> > mapping previously.
> > 
> > An initial attempt to fix this revealed that TDX and SEV-SNP have
> > different expectations about which and when address ranges can be mapped
> > via /dev/mem.
> > 
> > Rather than develop a precise set of allowed /dev/mem capable TVM
> > address ranges, lean on the observation that KERNEL_LOCKDOWN is already
> > blocking /dev/mem access in many cases to do the same by default for x86
> > TVMs. This can still be later relaxed as specific needs arise, but in
> > the meantime close off this source of mismatched IORES_MAP_ENCRYPTED
> > expectations.
> > 
> > Note that this is careful to map zeroes rather than reject mappings of
> > the BIOS data space.
> > 
> > Cc: <x86@kernel.org>
> > Cc: Vishal Annapurve <vannapurve@google.com>
> > Cc: Kirill Shutemov <kirill.shutemov@linux.intel.com>
> > Reported-by: Nikolay Borisov <nik.borisov@suse.com>
> > Closes: http://lore.kernel.org/20250318113604.297726-1-nik.borisov@suse.com [1]
> > Fixes: 9aa6ea69852c ("x86/tdx: Make pages shared in ioremap()")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> >   arch/x86/Kconfig                |  2 ++
> >   arch/x86/include/asm/x86_init.h |  2 ++
> >   arch/x86/kernel/x86_init.c      |  6 ++++++
> >   arch/x86/mm/init.c              | 14 +++++++++++---
> >   4 files changed, 21 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 15f346f02af0..6d4f94a79314 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -888,6 +888,7 @@ config INTEL_TDX_GUEST
> >   	depends on X86_64 && CPU_SUP_INTEL
> >   	depends on X86_X2APIC
> >   	depends on EFI_STUB
> > +	depends on STRICT_DEVMEM
> >   	select ARCH_HAS_CC_PLATFORM
> >   	select X86_MEM_ENCRYPT
> >   	select X86_MCE
> > @@ -1507,6 +1508,7 @@ config AMD_MEM_ENCRYPT
> >   	bool "AMD Secure Memory Encryption (SME) support"
> >   	depends on X86_64 && CPU_SUP_AMD
> >   	depends on EFI_STUB
> > +	depends on STRICT_DEVMEM
> >   	select DMA_COHERENT_POOL
> >   	select ARCH_USE_MEMREMAP_PROT
> >   	select INSTRUCTION_DECODER
> > diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
> > index 213cf5379a5a..0ae436b34b88 100644
> > --- a/arch/x86/include/asm/x86_init.h
> > +++ b/arch/x86/include/asm/x86_init.h
> > @@ -305,6 +305,7 @@ struct x86_hyper_runtime {
> >    * 				semantics.
> >    * @realmode_reserve:		reserve memory for realmode trampoline
> >    * @realmode_init:		initialize realmode trampoline
> > + * @devmem_is_allowed		restrict /dev/mem and PCI sysfs resource access
> >    * @hyper:			x86 hypervisor specific runtime callbacks
> >    */
> >   struct x86_platform_ops {
> > @@ -323,6 +324,7 @@ struct x86_platform_ops {
> >   	void (*set_legacy_features)(void);
> >   	void (*realmode_reserve)(void);
> >   	void (*realmode_init)(void);
> > +	bool (*devmem_is_allowed)(unsigned long pfn);
> >   	struct x86_hyper_runtime hyper;
> >   	struct x86_guest guest;
> >   };
> > diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
> > index 0a2bbd674a6d..346301375bd4 100644
> > --- a/arch/x86/kernel/x86_init.c
> > +++ b/arch/x86/kernel/x86_init.c
> > @@ -143,6 +143,11 @@ static void enc_kexec_begin_noop(void) {}
> >   static void enc_kexec_finish_noop(void) {}
> >   static bool is_private_mmio_noop(u64 addr) {return false; }
> >   
> > +static bool platform_devmem_is_allowed(unsigned long pfn)
> > +{
> > +	return !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
> > +}
> > +
> >   struct x86_platform_ops x86_platform __ro_after_init = {
> >   	.calibrate_cpu			= native_calibrate_cpu_early,
> >   	.calibrate_tsc			= native_calibrate_tsc,
> > @@ -156,6 +161,7 @@ struct x86_platform_ops x86_platform __ro_after_init = {
> >   	.restore_sched_clock_state	= tsc_restore_sched_clock_state,
> >   	.realmode_reserve		= reserve_real_mode,
> >   	.realmode_init			= init_real_mode,
> > +	.devmem_is_allowed		= platform_devmem_is_allowed,
> >   	.hyper.pin_vcpu			= x86_op_int_noop,
> >   	.hyper.is_private_mmio		= is_private_mmio_noop,
> >   
> > diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> > index bfa444a7dbb0..c8679ae1bc8b 100644
> > --- a/arch/x86/mm/init.c
> > +++ b/arch/x86/mm/init.c
> > @@ -867,6 +867,8 @@ void __init poking_init(void)
> >    */
> >   int devmem_is_allowed(unsigned long pagenr)
> >   {
> > +	bool platform_allowed = x86_platform.devmem_is_allowed(pagenr);
> > +
> >   	if (region_intersects(PFN_PHYS(pagenr), PAGE_SIZE,
> >   				IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE)
> >   			!= REGION_DISJOINT) {
> > @@ -885,14 +887,20 @@ int devmem_is_allowed(unsigned long pagenr)
> >   	 * restricted resource under CONFIG_STRICT_DEVMEM.
> >   	 */
> >   	if (iomem_is_exclusive(pagenr << PAGE_SHIFT)) {
> > -		/* Low 1MB bypasses iomem restrictions. */
> > -		if (pagenr < 256)
> > +		/*
> > +		 * Low 1MB bypasses iomem restrictions unless the
> > +		 * platform says "no", in which case map zeroes
> > +		 */
> > +		if (pagenr < 256) {
> > +			if (!platform_allowed)
> > +				return 2;
> 
> That'll work but I hate the way this interface works. The sole user of 
> this 0/1/2 convention is page_is_allowed() and the check for 1  inside 
> write_mem(). The proper patch will need to document this...

That's good feedback. I will introduce some defines for those magic
values: DEVMEM_{ALLOW,DENY,ZEROES}.

> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>

Thanks for taking a look.
