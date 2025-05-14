Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110E71DFE8
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747191375; cv=fail; b=efmo665+Ag4YzL9eLA2LBms0I3JRvyUgzmfpcG3pvGIPDJhqk5eP5moBg6ngkEUYveV+QBzthN45/4KMsLv/Uit5GfHrY3D7Av9fiEGM60IGSrUssVtEyqVSkXfy9JavB672Ey4pQYkll7RMAnn2ylP+RJu/jWMEzY8ms7JygtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747191375; c=relaxed/simple;
	bh=P132f2QDHNLfUIyqOobzLbalYoiUyKDEiEPLUQzQpz4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fkglq5Id93+Xp0LqZUOT1BNXKgoUMp2jgx4kei/SdhB/yerzTT1hhAbDjDAzACYNqvYfulKnqrEf8UgdvYQH7IMYaTl9FgLSWg1jrJ/kV5Y079pXeq6vsN1yjHZYquZ4BAvqrBP+q4Jh3gyYRDjdq5JfsdOLLT+Fxz/h+xsdNtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJJZUYji; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJJZUYji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747191372; x=1778727372;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P132f2QDHNLfUIyqOobzLbalYoiUyKDEiEPLUQzQpz4=;
  b=TJJZUYjiYScmH7tzzZzcs9csVQCUVR7HR4jqW0DpeJZya0PDgrwPJcC6
   e9NyhWRd9cF5NWLasHkaJYp/AwbKR8CDuSRxyUz0RkoNJejpup4wFRj+8
   F3/58p8H8RDiFjt4djYsFg3s04IdGMGqIg9+7E71ovu8q1DSYQJ+GTqHD
   hpS3KQCjS6WmS0Ql37KQ3NYlnG9M2kv5LqZmiCiEbYjhYDVff0WzqavX0
   YcQWTboG8Px5j+glPaFqGQLvXSij2I1Smzyvmvi9f/JCzDek7sVzOiG4g
   dDRfsPTPpgVPDA7nNJT46LiHfdR7sYpnqHKQEFRPDhwyPxXKSjjur70IP
   Q==;
X-CSE-ConnectionGUID: gYnoz/bXTRm8HBcKUL998A==
X-CSE-MsgGUID: E/qc1LDXRVifHavueKB4TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48999515"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48999515"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 19:56:11 -0700
X-CSE-ConnectionGUID: JCmidxLwS9ubyfpVT79aMw==
X-CSE-MsgGUID: 2uqxcTgcRt2KtfdaQYzErA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="161196677"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 19:56:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 19:56:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 19:56:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 19:56:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4xuLzE6qxJW6eB2CRT8rWKJHtyRXh8Darb7O7xq9oLNIgVtzq38hN5KoJJSWoPqRYpQTgM4h26N1G79qvq+9Ks3KSfk6WXU/E3f1LfdQeCz4s4JLT2FvIkIfD5Pm9kfJu2bGuqAqzzSvc1Id5y87klnX6Y96Z7LE6LDM8sB0WBHr+etdqmw5bo3nUByTAIU5NJAZ/Hcsgp8Q2mZjL1wwevwQywnRCMUNq9Scw5nRysL/UKm7sqbKrLXW4zCY/MZyr9NDpnBANAz+7tHFYU2wX3jFuuYu5M1Wogfb8cEGYiVU554ER4GI35Mar0bZ2+XAoiOtAGhFvNHqfop+goxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJZedQridFX7/CMWAJnl7ewNxsFzEmpmwXXAN/3UFaY=;
 b=CxuCPS0uJLdkyAhAIomtoU+50bxWFdQe+/5Arq3Br8NRwXcmc8sV2UW8R75DkmcPnj4uJHdS04o7F7ZQWPnMZX3zyI2/RuVW+LtFeyMOaUiZCcs09muEGKfiF69JTJz2F3rCcTaTVvUDnD4Scdj7Bh5MHyvEH3YfuOMIWMcWzv6Btkx9SMwiJKXIXhPHAmeS6K9sgsZHaaHloIGbt4sAe261AMlx8kdVxAxVQT3MBa9zUInIzzQu158DX03Jcs0s9uoXPjLx9jnQKPr0r47G1pj4n+ETes9AebwTAJ8FpPjSlJ00APzlxCHCKoL0JUF2OsakKzFvXrol2tNgVdgs9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by DM3PPFE50071912.namprd11.prod.outlook.com (2603:10b6:f:fc00::f57) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 02:56:08 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 02:56:08 +0000
Message-ID: <6e9286b1-6d76-4f30-97bd-8fcc3ca8f211@intel.com>
Date: Tue, 13 May 2025 19:56:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/26] x86/cpuid: Introduce debugfs
 'x86/scanned_cpuid/[0-ncpus]'
Content-Language: en-US
To: "Ahmed S. Darwish" <darwi@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, John Ogness
	<john.ogness@linutronix.de>, <x86@kernel.org>, <x86-cpuid@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-8-darwi@linutronix.de>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250506050437.10264-8-darwi@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0039.namprd08.prod.outlook.com
 (2603:10b6:a03:117::16) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|DM3PPFE50071912:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ce5370-1231-4b6d-a109-08dd9292e010
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTg4OXBOKzZsTXhOUzFyQ29RYXdETmpKUlR0Z2RJaGtMa3FoYTdsay9GQ1ky?=
 =?utf-8?B?ZW93VTE4MHlmQklmdmRTcFBuUXBUNnNwcTl6TnQ0NG1WMGY0bEQrUGVQNC9Y?=
 =?utf-8?B?OUJBY0VMOFcxdUpQVnVsN0d2MlhqZVJVL0FCM3hOcTZ6ZmJKeHFOUDZaT1lY?=
 =?utf-8?B?ME5SclNrbUdocGo4bkVSNitmcXMyeml2Y2F1UzRCOVA5R3FnMVBCbE9PMllT?=
 =?utf-8?B?Zk9TQW5pdUtYV3NLblRUem82YW1xeENVbjJmZzhDL3VRRFo5UHBaeitMWisr?=
 =?utf-8?B?SVRwaFNPVE1QaG15K21LcTVQcDY5Ukk2MFB0bzlxSHYxT1FhR0YrVFJRRno0?=
 =?utf-8?B?T05TY3VOTXBtQnNNa2JsSk8yNWZvcGZzMFdtaXlReVp0MGp3bEJuVGpxRFdx?=
 =?utf-8?B?bTRxK1VCdXc1VnlrSURPenRWcjhSTjUrQVQ1N1UrZlFpQkpFaDJMWnQzMWU4?=
 =?utf-8?B?RmJWUE10V2VKSC9lSFZEVFMvNS9xRXI1U2ljRXJEYUVwT1hzSVd0QzJWK2cx?=
 =?utf-8?B?b0V3c2p2OXdaMHcyK0YrU1BiUmlSTCtUb0ZsU2IvU1RIZ2xiSUVXTlFCU0lu?=
 =?utf-8?B?cEJUV2srN0tlQ3kvN054NjFuOUNGR0Z5ZlA5UkJYczZZMWpEeHZDRXdzQjFw?=
 =?utf-8?B?bmwzN3VjUEprV01VMnArdHRuY001TDdzYmJKc09hMFNZcUJGRnV4aS9tZEhi?=
 =?utf-8?B?ZnNHTU9RaXVZb01ra3oyRExkcDlYbVBPV29HSDB2QnNLQjMrQ0RsSTdWays2?=
 =?utf-8?B?bUoyZVE1SXhLeU15NmdCUFIzeFg0cUxVaXE3TFlhKzB6NmZycVJMMUxqUERW?=
 =?utf-8?B?bjlLelZvdDM5WE9aQXFqSUlXdklFdnBEdEtPZEQzekZiRnNPTFNobXBiTmhn?=
 =?utf-8?B?R2dBbEZ6ZU16RnMraVRyOUhTZDIxc1lIMGVRVXB1SVMvRnZGUUtkanMwZElo?=
 =?utf-8?B?NlVhRUdZWjVId3l1VTRqWm83dEM0cEMxczhWbFNSbjNiQlhZZUZqWkQ5ZnZU?=
 =?utf-8?B?MU94ZVdaVlJFUll0aENqa3VWekdEUVhCekdHRXREVXRIUUQxQ0VxV0JsbEJQ?=
 =?utf-8?B?OVlPbkxkNHdTODNhMGJHZnM3T280SmlMekkyblhQZEErbTZCMVFmMWZaZFdY?=
 =?utf-8?B?bWlwcTgrYzlhOFR2Mjg3ZFhxYUw3Zmk4OERoblRPZ3hFRGNsRGhpYTR6elJu?=
 =?utf-8?B?dEk2Y2w2bEp0NnhERk9majZVOFZwN29qcGNYWms2YVduWnFWZHJDSFdEUURo?=
 =?utf-8?B?ZmRkOENyT0oxcHNYZTh4SGVmcExCa2FveEN0RVVlSGplSmpFR1QyOXR2VlhN?=
 =?utf-8?B?bXh6R2w4YSs5Y2YzY0RTMFZrMndMMHNjTk8vWUNYNVZxNVVwM2lJekF1RTBh?=
 =?utf-8?B?NGIzVElQZUw2cXlvYmZSQzE2bVhpcnhReUFteDhCTzFGWUhEenJLOUZzZlJx?=
 =?utf-8?B?K29LNDM3VlBUTTNlRXZObjlOTkpIQ3E1NHpBQW40b2tUVGpWRjQvdUtNQWs3?=
 =?utf-8?B?UFhuc2JQZStDeUtXa1hYb1VsSm53QW01M3IzWFZkREVoWVNYSFpXM1NUSlZi?=
 =?utf-8?B?bHFyamI1Zk9WcDE3Y0RvTm9RVWNoZ25Qc2RsSVBZZTJicVNlSytULzlqMmdq?=
 =?utf-8?B?b1ZRTnNud1k3YWIwcXVWNFo4ZUhKT1AxZVZQUUJZcUZudTJFWktHVzZ5a1Yx?=
 =?utf-8?B?dE85bWg3bFFBL2J6TU9pcnZYOFkxR3NodmpJYzZHQ21RWDRQVTlSMk1IZ1dS?=
 =?utf-8?B?SHB3c3VxNlAwYm9leVNHZ0pRR09jN1lCdi9jNmNSYzVkZHp4RFBmaFVMTlp5?=
 =?utf-8?B?R1VjSmQxQWR1aklRTEZISDJUU3cyYjZRdm9DejU2VmxBZHJCVlM1V3NhdENJ?=
 =?utf-8?B?ZU5BVDRhREVUeDlhT05LS0doRHp1V2hGcFlST2JpdEVwdlFXTkZlaWhQdVBF?=
 =?utf-8?Q?IojJFTBQbV8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZNNkIzZ3NHL1JBOTZUWU0vRmRFbFc1dDZKakxnL2NsZUUxVDVrZ2tyWi8x?=
 =?utf-8?B?Q0xyYlduQ3lrb1YwZU1lZGxHRUUwMHBTajhzWlRLaWZTME9aN3pWMGZBWG9t?=
 =?utf-8?B?YUhsOU90UXNrS29KaTVPOStFdHA1UXJtNGNQWm9YYnY3UzNCTU9KVUxVd3Zy?=
 =?utf-8?B?WFQzb3UyTkFyRU5WaWJOOEl1cVVsZ253R1RhaHZIeFU4bWxlekxaZFpQSjJl?=
 =?utf-8?B?S2V2cWRIdTlpQ3lSMFRld0ZKTmZZUVdsNXhkN1pjNHdSeE1zd2dNSVpTWU1T?=
 =?utf-8?B?d0ZPZFlHZ2NHWWpGc2ZtVm1GSkhscXFWSGUrYUNqQkNSUC9nZFp1aU10a2Fs?=
 =?utf-8?B?ZEt6bnJBWk50QjZVS0lTR1l3SlF1Q2hMU09UUnRtVUxmUWNtbFZwbWM3bVlN?=
 =?utf-8?B?RERQZENvNHNGcFRNQ2lhZHVTcTU0N1RYVGFnY2dGa3kvQStKd2ZUQ3hpY3RU?=
 =?utf-8?B?MUdVM2xJM0N0OWxCL3lYaHhqNzJZZHJGcGkvTmtILytrZFZHNTdXTEtNQmU4?=
 =?utf-8?B?a0FScitVU3N4bU5rZ1ZkN0w1OFgvVmRzSkNwREcyemswTThpeFZmMHRiZC9E?=
 =?utf-8?B?ZWRTdU40bS9ZK1FXNU9hcVkrS3RhZG5Gdy9EeGx5bXl5eUlGWHBuZkRkWDR6?=
 =?utf-8?B?eXh5ZTJneUZrMDNPN2VmTlIyNHFaYmxFa1k3aVpxci84NU5TdmhCR3g3eS84?=
 =?utf-8?B?Y29ONXI5Q2k5ZnE1c29iMjZUUnQvbDJaV1lwT3JTalprZzZsQ0xvZGdSL3Z6?=
 =?utf-8?B?Wmh3dnVlMnpqRVVpS3Y4Zlg2SWZpaDk4a3pham43RDlSK1pGTmRJQmtITFNF?=
 =?utf-8?B?WXFyeHM4SlcwS21ISFJiaTA0SHJUMFB1Wkt0WTZJaVBHd3puclJzVXBLdnd1?=
 =?utf-8?B?dzhkNDhHNmNtNkxaWThMcXRlUDJiN28waHhUNXRSZ3l5RENHWEVYemsxME41?=
 =?utf-8?B?dHhBaWxOVGVjSENYZjdjOVUvcmJ0dW5FQlREWE5JTisyVUhBdE5lQkhaTlYy?=
 =?utf-8?B?dWMrV2RNLzJDSGZReVlucFVzZ2FzaUw4QmFTZ21rRC83Z1BHLzVrOGNYNkxS?=
 =?utf-8?B?SmMxd3FQdUlXMHhOV3JDRDgycm1DV3lFWXVvbVBqSlNPUUNMOFNocnBOakhN?=
 =?utf-8?B?UkRKU0RTd1hmY3ZHZXhJUy9qcmJCREx4MDIrTTF6UVFoNmMrV3BLdUdCaGdC?=
 =?utf-8?B?U1NnMXFuZ0FHOEh1UjEzdG1vWUY0a2pNdFJxN0hXcFN4dGNSc0NRekE0Zlh4?=
 =?utf-8?B?Lys4aWtHYU5zTG1DNExHdUFwOTVGbmlGTWFORGc3YkhYeFVrM0MvMlNtOG9i?=
 =?utf-8?B?RDFRTktmV0dhUkZCRCtDMlhwQmsxekpyN29ZRzdIallWVERRRzFRR2EwZGli?=
 =?utf-8?B?cmRhbHFKRTNxM2lpWTUvZmdwVWkwZXRDS0JEaWJFQlEyUWJ0dTNpYWJSOG8y?=
 =?utf-8?B?a2JqbnM1ZzZySTAycjAyRjZZUzhNQ1VlVWl4djZaYVRaVHhhcm5QRDhBOGV4?=
 =?utf-8?B?OEtTa25MRS82V05rMUNPclNucWNRK0xQVm1DRTVaQXpIeGpnWFE2Z0JQWURt?=
 =?utf-8?B?RjExb3c1aHMzWEQxTU12ZGZpVHBOK1VmOVk2V3dDUmpyNlA2SmRjemp6dnFJ?=
 =?utf-8?B?R284T3pZSXZvZ3duNnBTVThDRzJBM0w0bkwrR2VBdFM1SU5sWmJWVEFOOG5Z?=
 =?utf-8?B?NzNTZ2QveWhPd2cyQ1IyVDBQd0pkVVE0eGsvWWlTMjc4VTNDZ3MyMEF6bkYr?=
 =?utf-8?B?N2oveFFHK09jakd2M1dnWUpTWHdINFY1QnNtcURKZElqUE1tSGtLSjFDMDgv?=
 =?utf-8?B?U0hXTG82Y0NiT1NYeDQ1Y2k5eE9qV3FTUytJeGMvNlA0NXZyRkVVQVJxbkZS?=
 =?utf-8?B?aXIvNnNzOXUwRW9aS1V3YlVtNHg0aWNHc2YrbDhCL3RDaUhlbFpNRnNqQUdL?=
 =?utf-8?B?Z0xhNlF4SFRqVXQ1enZOdWF2Qm9Femc0VDVLaEZ5b09ISDd5c0hkVE4ya3hi?=
 =?utf-8?B?ZlF3LzNYM2xBWmpMRXRzdHNieUFFMUdaNTZSdytIZWp4SWpsRTVIWWlzUDJF?=
 =?utf-8?B?YWFlZlljNjh5YWdacnMvaG1rNTFzL0U3dlNMZk1DL2E5RVNHTkhCQnNtMU02?=
 =?utf-8?Q?LXCNqR5YbQNibH1jda0hYpd5S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ce5370-1231-4b6d-a109-08dd9292e010
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 02:56:08.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0AqaXfWC5r+RXwtHVUl14U0d+nObvCMWQPAJ6i7IpSdqn0A5INaLkitZt76kio6V0q9z7Zep7835MsMeFg1/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE50071912
X-OriginatorOrg: intel.com

On 5/5/2025 10:04 PM, Ahmed S. Darwish wrote:
> Introduce the debugfs files 'x86/scanned_cpuid/[0-ncpus]' to dump the
> scanned CPUID table for each CPU.
> 

I tried out the patches. The debugfs hierarchy mentioned here doesn't
match the code.

The code actually builds:
  x86/scanned_cpuid/cpus/[0-ncpus].

Can we simplify it to below? The "scanned_" part seems unnecessary.
  x86/cpuid/[0-ncpus]

I would also suggest slight changes to the formatting to make it easier
to read.
1) Indent for the printed register values.
2) Move the * to the front of the value to make it more prominent.

Current
-------
Leaf 0x00000001, subleaf 0:
cached: EAX=0x000306e4  EBX=0x00200800  ECX=0x77bee3ff* EDX=0xbfebfbff
actual: EAX=0x000306e4  EBX=0x00200800  ECX=0x7fbee3ff  EDX=0xbfebfbff
Leaf 0x00000002, subleaf 0:
cached: EAX=0x76036301  EBX=0x00f0b2ff  ECX=0x00000000  EDX=0x00ca0000
actual: EAX=0x76036301  EBX=0x00f0b2ff  ECX=0x00000000  EDX=0x00ca0000
Leaf 0x00000004, subleaf 0:
cached: EAX=0x3c004121  EBX=0x01c0003f  ECX=0x0000003f  EDX=0x00000000
actual: EAX=0x3c004121  EBX=0x01c0003f  ECX=0x0000003f  EDX=0x00000000
Leaf 0x00000004, subleaf 1:
cached: EAX=0x3c004122  EBX=0x01c0003f  ECX=0x0000003f  EDX=0x00000000
actual: EAX=0x3c004122  EBX=0x01c0003f  ECX=0x0000003f  EDX=0x00000000

Suggested
---------
Leaf 0x00000001, subleaf 0:
  cached: EAX=0x000306e4  EBX=0x00200800 *ECX=0x77bee3ff  EDX=0xbfebfbff
  actual: EAX=0x000306e4  EBX=0x00200800  ECX=0x7fbee3ff  EDX=0xbfebfbff
Leaf 0x00000002, subleaf 0:
  cached: EAX=0x76036301  EBX=0x00f0b2ff  ECX=0x00000000  EDX=0x00ca0000
  actual: EAX=0x76036301  EBX=0x00f0b2ff  ECX=0x00000000  EDX=0x00ca0000
Leaf 0x00000004, subleaf 0:
  cached: EAX=0x3c004121  EBX=0x01c0003f  ECX=0x0000003f  EDX=0x00000000
  actual: EAX=0x3c004121  EBX=0x01c0003f  ECX=0x0000003f  EDX=0x00000000
Leaf 0x00000004, subleaf 1:
  cached: EAX=0x3c004122  EBX=0x01c0003f  ECX=0x0000003f  EDX=0x00000000
  actual: EAX=0x3c004122  EBX=0x01c0003f  ECX=0x0000003f  EDX=0x00000000


> While dumping the tables, for each cached CPUID leaf/subleaf entry, run
> the corresponding CPUID instruction on the target CPU.  Compare the live
> hardware output with the cached register values.  If a cached register
> differs, mark its cached value output entry with an asterisk.
> 
> This should help with tricky bug reports in the future, if/when the
> scanned CPUID tables get (unexpectedly) out of sync with actual hardware
> state.  It also simplifies the development and testing of adding new
> CPUID leaves and custom read functions to the CPUID scanner.
> 
> Note, add an extern 'cpuid_common_scan_entries[]' declaration to the
> "cpuid_scanner.h" internal header to allow the debugfs code to access the
> CPUID scan entries directly.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  arch/x86/kernel/cpu/Makefile        |  1 +
>  arch/x86/kernel/cpu/cpuid_debugfs.c | 98 +++++++++++++++++++++++++++++
>  arch/x86/kernel/cpu/cpuid_scanner.c |  6 +-
>  arch/x86/kernel/cpu/cpuid_scanner.h |  3 +
>  4 files changed, 106 insertions(+), 2 deletions(-)
>  create mode 100644 arch/x86/kernel/cpu/cpuid_debugfs.c
> 
> diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
> index 994539fd0e17..eb9cd1dee58e 100644
> --- a/arch/x86/kernel/cpu/Makefile
> +++ b/arch/x86/kernel/cpu/Makefile
> @@ -62,6 +62,7 @@ obj-$(CONFIG_HYPERVISOR_GUEST)		+= vmware.o hypervisor.o mshyperv.o
>  obj-$(CONFIG_ACRN_GUEST)		+= acrn.o
>  
>  obj-$(CONFIG_DEBUG_FS)			+= debugfs.o
> +obj-$(CONFIG_DEBUG_FS)			+= cpuid_debugfs.o
>  

How about reusing the same line since the config option is the same?

>  obj-$(CONFIG_X86_BUS_LOCK_DETECT)	+= bus_lock.o
>  

