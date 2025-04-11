Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0F92367D8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744393779; cv=fail; b=PEmTGgWQ9qOlFwvj0lY2IIZHzvOaaGZmEvPXvUTHBouFmkxDkLl47SyPxI6/PmtqshYcop1RRj+AGwtkySmAvY93PvZ1ZuXsuEEUxzQ92G+JZLHbhOVhs0USRKFHl4qykSRIjQDf1y98W9i9xV3kqN19FB+PoW5WAJcGAOfy54U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744393779; c=relaxed/simple;
	bh=093yymkc6XmX4ZFUvyJxFQin2noMnaBzvybVrScB/CY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O5Y3ZuOTbfZOcBYJYPT4VsmJsjU5fs7Bf9AUyxn/PtKNy13uOyLbBCurFJDb/DYKs3JxiHgYTuhTvSlM1Dr1VnASLdV36O6lnM2nqWryxLkE22AButksS58aNfqR8snNarrYKnv4qYrsi4nENhGK/24k6ESRn4J2JWBq3fQzhks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOd1Lk1F; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOd1Lk1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744393778; x=1775929778;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=093yymkc6XmX4ZFUvyJxFQin2noMnaBzvybVrScB/CY=;
  b=kOd1Lk1FIsu1NmQQRv2ZTRvkKMKHwbj6cP2r5GpI/SBlrLgTcjIi0FBu
   csRpgVq2UftbRtNqGx7VrxaTDrck0pkG8sJy/Pplmj44lwFEAxjeii1F5
   DV1LUy5SMCpiphZy7A/YVWjFmfhJKLjiyJZjlQz0tE1IwkbBIxABGTGJ0
   63G+zhS4qlcALnTKH3faIpiAMXkpIbsTueYBztDZxWVkixBkayDJjOEQC
   TLDEB1NUj+MmMRrjqQc38swuHJ7u6Nsd+OaFmw63KHPubIRGEJuLjVqGV
   B9lVSQa+4WS+me+IDa/4jv5R9mg5OPtZ92s8+qJMj/DY3mZLbXXXOFq/A
   Q==;
X-CSE-ConnectionGUID: UZU6X/HoQAKBRLk4WP2Waw==
X-CSE-MsgGUID: ZaRqppSnStSu9FVDxKugIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="68444534"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="68444534"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 10:49:38 -0700
X-CSE-ConnectionGUID: 867srdjKRf6O0QFbzjzJyg==
X-CSE-MsgGUID: dZAd5eCOQ8CWDAmHVoUp/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="129604114"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 10:49:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 10:49:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 10:49:36 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 10:49:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emktaUFL6iCyVUSwpMxn7oJ9KEVM/fs5VbVKz0wcruzegY043bOo+c5h+Ztk9VVzE4uFOryWzJ5Ylvuf5usBCLf9WQkFmzZDv/AcHalIE/5U+I5Cr7NLUyJGcVX1kNN9zfthkfZGuF4hYE9oNouJz2u+CoaBDj73x/Cfu64RzyaAP8hVlCZUsG8+6OCj+wLZDvuYZero2B2eCyV5m04WwEpqTL2Vk9a2FROftC6wAqOe8XpJL+9+Cb8J16mbnKQPHOnP2BIe77u6I3O3A2nZRuQz7OSrKTz292YOOuw+X94yxSqnVMLz+6MT8jkRAv4Bsu3y9m+aa1wqufn3LtorWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mq+84YWNoCPn44gB2Hddx7NYNoOko+ZSOosrqUa06h8=;
 b=NwV1k/ORrKodNEYNPHCMnuZ7lnUyYXmhQJgtBF7auW1G5pWqp9QYzoFED6cbnaVOFBpSp8MRuoXyZT8kP07HppuKJYjsv+IMO/eJFRm7T0FBROXygFk6xHgar3EXWG55Ypp8ekJD48KJDvXtVnRBKCV+bEP0a4JOA067Nu03+kqOBacAWm+ByTmrCPXyqx5lj/wLofKdx7h/Q/J+WrqZC5STp4WFyqVHBqTcYS8T89Hl5Zt9gWfhOTsDmonGNhxhcVswbqKN58hOYinnPoEpTm6QehfxmOBGZzwpwx8dIlGZV13Q2GMIRBdHhN0+lKGooqW6QoSQFgw6qudFEmABgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6269.namprd11.prod.outlook.com (2603:10b6:8:97::14) by
 PH8PR11MB7046.namprd11.prod.outlook.com (2603:10b6:510:216::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.29; Fri, 11 Apr 2025 17:49:31 +0000
Received: from DS7PR11MB6269.namprd11.prod.outlook.com
 ([fe80::af1f:dcc:49bf:1a26]) by DS7PR11MB6269.namprd11.prod.outlook.com
 ([fe80::af1f:dcc:49bf:1a26%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 17:49:30 +0000
Message-ID: <7e0c1c42-30a7-41f0-96a6-a0ec16808f88@intel.com>
Date: Fri, 11 Apr 2025 12:49:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] x86/tdx: Add tdx_mcall_extend_rtmr() interface
To: Dan Williams <dan.j.williams@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>, "Dionna
 Amalie Glaze" <dionnaglaze@google.com>, Guorui Yu
	<guorui.yu@linux.alibaba.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
 <20250407-tdx-rtmr-v3-3-54f17bc65228@intel.com>
 <67f601479a155_720529471@dwillia2-xfh.jf.intel.com.notmuch>
Content-Language: en-US
From: "Xing, Cedric" <cedric.xing@intel.com>
In-Reply-To: <67f601479a155_720529471@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::16) To DS7PR11MB6269.namprd11.prod.outlook.com
 (2603:10b6:8:97::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6269:EE_|PH8PR11MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 782d93fe-10de-4ce3-9ff6-08dd79213634
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzhhSmZWV2RyL080bFFUVHF1QnJMNUNJYUN1d3g4QnVtRFBERFdLTHFJWm5z?=
 =?utf-8?B?OUVQdzdHbjVXNzMvOTk4ZFBSVDBtL3ZWWi9TVzc2Vk8wS0NPVVBwL2szUFky?=
 =?utf-8?B?a1cxcjVIWEQydVNQRDZ5MndodENFYW84MUN6K29zeWoyUFNYVjJ3d094TWNw?=
 =?utf-8?B?VUxVOXA3ZEJieGV2MVJWKzh4RHcvTFpJazBFMldGNHJ1YjAzZGdUbmF2TDlC?=
 =?utf-8?B?amI4cEM4RWxvaTdBN2NDb29OMjlKUkUxNEc2TGlRVjN2L05aWVFjK0I5UHpC?=
 =?utf-8?B?Z0E4OTlKMHRHYW5NM0ZpU3V1UmV5Q3FSdVNsTnVKNi9Ic0djbXB6MHJpVWc0?=
 =?utf-8?B?bzNMcHdHM01jQVhuc0VDZFNQVFZPTmZEYTNzWDhxTkVxN1NXYWY4TkY5OVQz?=
 =?utf-8?B?bFRucXhRVW1lQU9OU1hsRjhwSHZ6ZExIRDgzWWpraUV1c2w4bG5yMWRoQ083?=
 =?utf-8?B?QS9LOHpVcUFhVTAxekNoVDZnR3lRcmlGeVFnWThGb0Q0QXFYQXJjd0VYWjlD?=
 =?utf-8?B?cWZ2NXVZalBKc0ZoVEpTeCtxQm5zWXcxWVVpbS85UnlHRUtYeU1ZM0pxb1JH?=
 =?utf-8?B?QzY2ZGwwK3YrdjhpZmsvSWtwN1NsMm5uMWUrbWhENVRnTXhmNW1hc3plNHl5?=
 =?utf-8?B?b09XUFNFRDBNRGxXVjNVc1JyWHQrMTMraUN2QUxNSVZxSVJnbEpuR1hBbzVt?=
 =?utf-8?B?UHl6TlJWd3lzc3NhZk9OVkszMmZ4REhOQlBlU0trOU1lWkRQTUR4R0JHNk03?=
 =?utf-8?B?cjN4UW5Eb2JkMlhzUzJna3FSWXkxY3VhUGJIUEt1UHBOMll3bWtZRnFtc2VH?=
 =?utf-8?B?TUZiUllWV25nWFFKTUJoWlcrYXZXWlNSQnZnRUFkS2trV2VYVlhuUjNCa3Qx?=
 =?utf-8?B?dU9pVXQ5M0wwZnJYM01BV2dvcHJUNERHUzlydlRZZVB4NmJNUVB0NEVZQmpB?=
 =?utf-8?B?d3ZOTmZqOCs3cnJYL0VoNFFGUTFTL0RNODhmNm5xalh5VWo5NlUxRmhKOURi?=
 =?utf-8?B?UFZFL0hOb2xMWEhmQW5LdG56K2d4NC9zUFFXSHBtVnV4dWcxbmVoR2c4ZEpD?=
 =?utf-8?B?SE10S0RGQWRMTkNneG1xZXIwUFpWSzRhdnBndUNuRjEvb3JadFhqemUzQTRJ?=
 =?utf-8?B?L3N5YlJEWUtDRDF5K2ZqMWlkc1hqeTBKUUZJQklIdGVnanB3dkFGa1pKV1p0?=
 =?utf-8?B?dlFwQ0ozVk1VSXRqQTRBaGl2eXpiTFNsWCtPQVNHOVArSjRGTVVENGM4MWhy?=
 =?utf-8?B?TnJjRXYxcjB0MlAvdTVCYU80Zmk3QUEzeHpqYnJndmZiMTArZlE0TXp2ekts?=
 =?utf-8?B?WnN3QllmS0tTWUl4L0tJU01teWVIaWlMNWdVUmVPbER1SzhVZ0kvTHN4ZWxv?=
 =?utf-8?B?Vk5yWGVCVVlzT1BoT0VOQ3VVNG9mWHhaYjhuQ0Z0VTNna2JJOUllV1AyQ3Rn?=
 =?utf-8?B?RzBLYXcvMFQ0QmRsOWZTaFcyTTJaLzZQcVlpNERQdVRKMENPMGJMTFIwekdD?=
 =?utf-8?B?STY3Wmd5ZmZBSzV3RDVUaWk3Z3ZoVlQxMmJwVDE2aWhNNGprekRmZFVMeG9M?=
 =?utf-8?B?MDA5WW9zMVE1WS85aWQ3dlVmRjFNYUQyTmtXZDNKZU1PRXYyN0xHZm85T0lt?=
 =?utf-8?B?T0M5anNGWGtocWRHQjlyKzFlYVlRVmY4bk5tSWVIUGx4WVRQZlpuRE9XUHY3?=
 =?utf-8?B?R0hSMmdiRVA4WkRnQnlDeEdxT0MvQ083Skk1VVArcGROd3hWalZsS1F3WTNm?=
 =?utf-8?B?cm13cDhkV1ZOL1lPeUhHZEs2RlI4VVhNN0tNbytUZ29Cbm5Wenl0cFY3dkQ4?=
 =?utf-8?B?eHg4VmtJaXlUYklNNDVreDFjSzdPNUtTVXc4Q1l3a1FUSE5MZkF2VWppbE0w?=
 =?utf-8?B?UXBzM3Y1SXdWRkxpTk5pU2lsRUZNZmExL2s0RVFBbkE5Zk5JYW1BcTlLTTR4?=
 =?utf-8?Q?fwjZelwv64A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6269.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFNxWlUwcHVUK3ZSVEtKM2s2ZFRncFRBRFNmQkZzUVRsT1NXR1VjOU5QQXYy?=
 =?utf-8?B?NjZrWjZyOTU0TUthY2VmSHlGR0kvYlNIdlBNY0F0NWp3WEJob3RxcmMrV1Ja?=
 =?utf-8?B?VTUvdHg0dGVFZ1BteTRZclI4UkFmVnVCSTYrdkgva21HNXY4OUFlajA1bnlj?=
 =?utf-8?B?aUFTYTE0ZEs2ejhuT2QyQ1VreXViL3UyRm1PbzZsREtlR1VxNUN1c1l6dnYw?=
 =?utf-8?B?VGx5QUNFZ0RyVElxUTlRL1RGNEQ1ckpiVThYZWN4UUJROWFzN3gzZ0h4Z2t2?=
 =?utf-8?B?TjZENUhIc1JuMjY1cGhmeEVWb2JRbzRMMm1SUktSUUM4a1prTUlUVHFNZlZq?=
 =?utf-8?B?KzNGODJzRjVUY1BLS0FFK2M0ZkV6RHMyS2JNVStZbWdZS3FUZmM1VUdNVXIr?=
 =?utf-8?B?RmozYUxrY21xMUttYlhpbEZKUWxCYTgrM2xvMHNDWThoRDNqYjlxSlF1TU83?=
 =?utf-8?B?UDVKUWdBbDF2NisyUmYzcU9NdVpVRjNVZDNscklyTEFDdkRnWVA5djkwTWZK?=
 =?utf-8?B?UFUwV1dnRFNJeE5CeXBpZ1hUZGUxNWxXT1pUR3ArcCtkMGJiYVdBYVVqR2li?=
 =?utf-8?B?SWVQM3lSdWMrUTBwUFVzaFJlTE1JR3NiL2JIMS9MOGNnNG9kYVphaWVrSWpI?=
 =?utf-8?B?anBDd1RPWHh3OUg4dEFwdVBPa1hYSzZqZnc1QXRzZ1IyTTVtRGU2Y28xRTdm?=
 =?utf-8?B?akJNVTFESWM2c2JjQXBOL3pkZFprY0ZRQld0YlZGQkw2dGRMQ0pHb2IzbjZq?=
 =?utf-8?B?R1FYZFlpcVNVank4Y3ZYWlZRSUkrL004UHNMSjFOaCtkajdWbWYvSzRRUnEv?=
 =?utf-8?B?UGdsbFpBTUpEbUY1eUFDLyt3Sm03bklEdnVmaFNUZGY4L1JxRXRRdUUydkRE?=
 =?utf-8?B?SGRZdmhlY0pzN2htL3BpREZmeTBYOXA0bEpCYnBMRUtkVDJJU1ZQTWl4OTFS?=
 =?utf-8?B?THVlN1hDVzBpTGlqMDQvMUExa1FFSFdVdVpkSitzQWtNV0F2ZTBwSElZMld3?=
 =?utf-8?B?VDBETEpNNTF0MU4vci9Bd0E5U3d6NFg4ejJTVDVoODJwdHNFb014dlVScFBM?=
 =?utf-8?B?MnBDaE1YWHZkeDhEbGlwK2cwa1kxb0srR09IQ0FwckJJbnNSekpiNm9nRkcz?=
 =?utf-8?B?RjNFY2NXUk5Nb2FUbDZaK3ZLanNiTEp6dVVHTVorczFyeG5HdTcvdSt2TitY?=
 =?utf-8?B?VUlGQ1hvQUxwamFQZ3dOODVPZ3RjZ3N4SjlUNXRWcTh5S2F4UUYzQXpVTVY2?=
 =?utf-8?B?dkFEcDZBV0JxZmt0a29TSU1RVVJKd29MYjNnc2M1anVValcwVVpnWXNoL3hV?=
 =?utf-8?B?SEYzUVlRWDBUaWoyTUVaNC9xMnBXNXVuZGg4akc0UUttZkVWVkVKdXREZU1O?=
 =?utf-8?B?WHFVRlJkZFBhYXcxU3Y3bHRtaGdSR2k3VDNveDRLWlV4TkZ0bkpXQW02WUU4?=
 =?utf-8?B?Q01iL29LaVArNXB4Qk9HNXdIVEVRZmloRU5tUStmdVZGdnNHYVdmbFVYVUw0?=
 =?utf-8?B?VEM4R1lmdmlweDVmMmJIeEpKMGVDWnNERitwL2dmWDVvNW5RSUhqc2FLVnJz?=
 =?utf-8?B?aE05TGlLUUJqYys2Z2RsNnhHVzFBODNCZFEveXROSFBOUEZaZVRTY0QraFBw?=
 =?utf-8?B?QitNMzBFaWZyVXBjWFhzVzZDeWk2NnFwRThOd1ZsUGlhZlJ3d2o4NlhFRnZ2?=
 =?utf-8?B?eUUrMHdJWHFHS2dha2NacWdpMzMvbUgvS1FNT3lhdEk3MVRCRnB3cnNsQXcv?=
 =?utf-8?B?N2hYamVVdHV3aVpDWEVCTks1c2VrMG5mSThXbFNNN21DTHplQWVXR3EvUGxV?=
 =?utf-8?B?Zmx0ZVgzZStzMlREQ3VxTzZYUDhrVFNhQVBualZuWks4VmNYNGJucDg4NHI5?=
 =?utf-8?B?NU9JVmJTREk0clhTanBicllkWXIvcVFSRWJ2b0U2d3o0SGVGTFVHWGJpb1R2?=
 =?utf-8?B?OXp0VHYrTEdyQ3d0Ty9yNTg3bXRxLzBrOHFQL1VGN2J5TDNIZTkvc1Z2QzA4?=
 =?utf-8?B?VkNHQ05KMWdsNlU3dVhsbUl4RlpITGh6bHNOSE5mdHAzdWlmQ1JzVCtCa2tO?=
 =?utf-8?B?MXVSSk10VHhrQ2tVNS91SlMwQktTcUFya2dkN056ZWxkUlhvZWNsN0EwL2t2?=
 =?utf-8?Q?tVc6wgZ3HafyUskFCU7tkaQ3S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 782d93fe-10de-4ce3-9ff6-08dd79213634
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6269.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:49:30.8778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0ZFoMYGqb7ZZWi56G/qbEFZVGLbFKEJCobEQP6IN4JOOovovEZlam3JZTGRdPcimgAq3EVlDeaCbBRgz1UwxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7046
X-OriginatorOrg: intel.com

On 4/9/2025 12:10 AM, Dan Williams wrote:
> Cedric Xing wrote:
>> The TDX guest exposes one MRTD (Build-time Measurement Register) and four
>> RTMR (Run-time Measurement Register) registers to record the build and boot
>> measurements of a virtual machine (VM). These registers are similar to PCR
>> (Platform Configuration Register) registers in the TPM (Trusted Platform
>> Module) space. This measurement data is used to implement security features
>> like attestation and trusted boot.
>>
>> To facilitate updating the RTMR registers, the TDX module provides support
>> for the `TDG.MR.RTMR.EXTEND` TDCALL which can be used to securely extend
>> the RTMR registers.
>>
>> Add helper function to update RTMR registers. It will be used by the TDX
>> guest driver in enabling RTMR extension support.
>>
>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> Typically Signed-off-by without Co-developed-by means that the patch was
> submitted upstream be Sathya, so did you also intend to add a
> Co-developed-by or should this solo tag just be Reviewed-by?
> 
I did modify slightly this commit from Sathya. I could be wrong but was 
told that "Signed-off-by:" was necessary to certify I had the authority 
to submit this patch. scripts/checkpatch.py complained about the 
co-existence of "Co-developed-by" and "Signed-off-by". So I had to keep 
the "Signed-off-by" tag only.

>> Signed-off-by: Cedric Xing <cedric.xing@intel.com>
>> ---
>>   arch/x86/coco/tdx/tdx.c           | 36 ++++++++++++++++++++++++++++++++++++
>>   arch/x86/include/asm/shared/tdx.h |  1 +
>>   arch/x86/include/asm/tdx.h        |  2 ++
>>   3 files changed, 39 insertions(+)
>>
>> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
>> index edab6d6049be..b042ca74bcd3 100644
>> --- a/arch/x86/coco/tdx/tdx.c
>> +++ b/arch/x86/coco/tdx/tdx.c
>> @@ -36,6 +36,7 @@
>>   /* TDX Module call error codes */
>>   #define TDCALL_RETURN_CODE(a)	((a) >> 32)
>>   #define TDCALL_INVALID_OPERAND	0xc0000100
>> +#define TDCALL_OPERAND_BUSY	0x80000200
>>   
>>   #define TDREPORT_SUBTYPE_0	0
>>   
>> @@ -136,6 +137,41 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
>>   }
>>   EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
>>   
>> +/**
>> + * tdx_mcall_extend_rtmr() - Wrapper to extend RTMR registers using
>> + *			     TDG.MR.RTMR.EXTEND TDCALL.
>> + * @index: Index of RTMR register to be extended.
>> + * @data: Address of the input buffer with RTMR register extend data.
>> + *
>> + * Refer to section titled "TDG.MR.RTMR.EXTEND leaf" in the TDX Module
>> + * v1.0 specification for more information on TDG.MR.RTMR.EXTEND TDCALL.
>> + * It is used in the TDX guest driver module to allow user extend the
>> + * RTMR registers (index > 1).
>> + *
>> + * Return 0 on success, -EINVAL for invalid operands, -EBUSY for busy
>> + * operation or -EIO on other TDCALL failures.
>> + */
>> +int tdx_mcall_extend_rtmr(u8 index, u8 *data)
>> +{
>> +	struct tdx_module_args args = {
>> +		.rcx = virt_to_phys(data),
>> +		.rdx = index,
>> +	};
>> +	u64 ret;
>> +
>> +	ret = __tdcall(TDG_MR_RTMR_EXTEND, &args);
>> +	if (ret) {
>> +		if (TDCALL_RETURN_CODE(ret) == TDCALL_INVALID_OPERAND)
>> +			return -EINVAL;
> 
> Here is where the ABI documentation can help to make sure that userspace
> can tell the difference between userspace bugs, kernel bugs, or TDX
> internal errors. So perhaps translate this EINVAL to
> ENXIO in tsm-mr.c. Otherwise, this patch looks good to me:
> 
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> 
Agreed. I'll change -EINVAL to -ENXIO as this would be due to the 
inability to convert VA to GPA.

> [..]

