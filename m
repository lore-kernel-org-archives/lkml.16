Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A91F099A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745342086; cv=fail; b=EpkVFAom7ghW177oolxOo11uMP21HZt+ZUd/hIGhiBokQSFxE/uj10uTTpjoubcCxGqGm4qcFxhduUW+onZhVq7bAWC0iNfMz+tERH8ZImo4rmgcbmzM5dG688nW27gLFL7LxzOFvpnQwMESXdFqtNwINWcjRy20hlQzW2ujYTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745342086; c=relaxed/simple;
	bh=hYYeKU5ea/Bba7HEUVzUhbQe/tbheRNOu5osLdAFZYQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=McGtpIQB4ZaYcOXbhuBMqZzrKPta90Hwg7dZ0H1ZPgamxEk0tLTbgvX+Mp6nTxj7hDrKz1D5+3ekcERIDhVewRFI/+TizAkDKNUKjm6D31mSfVfTY8jYOCBNOIw20wmez+vHpU0jmjYDWrVTiXpyb5jKhIdJvXcg21Wjs6JZ6m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyzu1Onz; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyzu1Onz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745342085; x=1776878085;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hYYeKU5ea/Bba7HEUVzUhbQe/tbheRNOu5osLdAFZYQ=;
  b=hyzu1OnzGdvV0BCv5RAGFl6ti59N7g1RSFLXjtvglzaD5GCJOJ1lCG1A
   odDtEaXQ71o1xrD6YYyAi258xqdSY0ePAsQ9Af2ap3o1zd1KoStpF1W3q
   g5pPiBvtxXsb0+QWQF7u1PwQEUR+NfmvPHxGTSyT+eDae3guZalb3rKW9
   aoc6ixa/LDvSCpeCbDNcd958jBz8GTdA/3BL7QhCN+0fULrRF91scPulF
   eYEiPgzVIQhglcpo9lbx3xHSEx16WG19uNrkIj0ico87iFPJrWa2MrEl2
   XOV2byaiYn7V1qVG8l9gk10v9XdGixVO00BYAd2ZvAw9g1wDhAbOSmIL6
   g==;
X-CSE-ConnectionGUID: isRgeDrUS1+zvjsNHEairw==
X-CSE-MsgGUID: iDJX9eE2QUmtmkybo+kmvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47013304"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="47013304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 10:14:44 -0700
X-CSE-ConnectionGUID: 2s9FBN43Rwy2YFkYDEZCag==
X-CSE-MsgGUID: TBqC1A8qTQevktP2FfEOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="132391573"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 10:14:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 10:14:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 10:14:42 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 10:14:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=or91lmqWjb9b+CDnHqvWB27kKx6tjCD9eP7MufBcwKBpY8Wq3/J3/1YdfHz18NkLUOfvshmuwwTWSM5xLwcECKjTrErVAK7Rkg/st+AyfgBn5PQK8GevCGYgbT51X1feJ6gEg+YkRV3pSLFvZzlQbUN1K0ScWMaR0eqzvmq3ytIG2HMJFs5Uzbjoi0+3eeQN3K0ifV82Rg+lQUsKvYCH9z6mkOn16p5gCw4En7C0BoroOco/QnJtgoCFlOQYbRATwLIsIcVtNA1IxrPryCyVmcw56zm1H5RQGbzKDEsPYC6b9L3BZudInHh4GCU7Dxniw9NRFD/adaNXUJ2ugKSggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYYeKU5ea/Bba7HEUVzUhbQe/tbheRNOu5osLdAFZYQ=;
 b=NA0Ji0yrwVdmJHjYtZG8vGLP7w+v7UHCEQS4ZzO7Eu11XP1di9U4JaDSG1mhNnOv9cU4fq6oSVDzyYu3m5zuhz1aN0y7xr1H2cux1G0l0NIY5Utvsz7pPSpPe8Ak7qRm7nDlCQi8jt41O9qUpWxSkuT/Xvi0Nj3LziO1BPlBe8kNSCBPIRSsUL/KfxaZfcCga27WTTbR0IfXpsn5HVsHO88hIMrxMq95AyzEc8JyoWYQs6Eq7LfK4ebpoegqwptjs0gABjSfXXLE85Nbd8cPYa+zRtldHKU6oAOcZ1UJxzZBP5ZGMAh8z7s94raA+tIimRlbiaCL5a8+8htIn+flIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) by
 PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 17:14:40 +0000
Received: from DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::509c:f906:cc6:2bec]) by DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::509c:f906:cc6:2bec%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 17:14:40 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Moger, Babu" <bmoger@amd.com>, James Morse <james.morse@arm.com>,
	"x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Chatre, Reinette" <reinette.chatre@intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, "shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, "carl@os.amperecomputing.com"
	<carl@os.amperecomputing.com>, "lcherian@marvell.com" <lcherian@marvell.com>,
	"bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
	"tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	"peternewman@google.com" <peternewman@google.com>, "dfustini@baylibre.com"
	<dfustini@baylibre.com>, "amitsinght@marvell.com" <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>, Dave
 Martin <dave.martin@arm.com>, "Ko, Koba" <kobak@nvidia.com>, "Shanker
 Donthineni" <sdonthineni@nvidia.com>, "fenghuay@nvidia.com"
	<fenghuay@nvidia.com>
Subject: RE: [PATCH v8 08/21] x86/resctrl: Expand the width of dom_id by
 replacing mon_data_bits
Thread-Topic: [PATCH v8 08/21] x86/resctrl: Expand the width of dom_id by
 replacing mon_data_bits
Thread-Index: AQHbqwDpCJPCUxJEkkqlOWfnOq4757Ov+7AAgAAAndA=
Date: Tue, 22 Apr 2025 17:14:40 +0000
Message-ID: <DS7PR11MB6077A729E4338E6C62939005FCBB2@DS7PR11MB6077.namprd11.prod.outlook.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-9-james.morse@arm.com>
 <70403b1c-d81f-4c5f-936e-f3cf3308822f@amd.com>
In-Reply-To: <70403b1c-d81f-4c5f-936e-f3cf3308822f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6077:EE_|PH7PR11MB8569:EE_
x-ms-office365-filtering-correlation-id: 231e7861-e473-4474-cb58-08dd81c12aef
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZUx5dEkrVHh3a1hxT0pRN0dVdnRxOHJGTStCcTZGZkdZaUZBY2JQZG9vaFBl?=
 =?utf-8?B?ckQ1TFpsZk5zdkw0N2xyVkl6N1FlR2lxZk5oY1A5NjBPdFFmT05vaTgxNUZ2?=
 =?utf-8?B?dmpnakhtdkFNNlc0Yi90cjd0Zlh3U0NORFhRVGg1RzVaeHhLTnU0R3UwSWxo?=
 =?utf-8?B?SS9XKytrSWtkT2psNVNVejBCYk5tbk1uSEduRysrMkdHdy9BWW44Z3piUkI1?=
 =?utf-8?B?OW9hMnNGeFEvbFhNamZRaEZFZEw0YXdrKzlkenZSdTM4QWdGRmMvUGVieTha?=
 =?utf-8?B?Rm14c3VBcFl3YmFnQWt6SmI1U0VZT3Mxb0FZWWo4NGtSMFZvdVQrM0tLSy9W?=
 =?utf-8?B?WHIyanZYMW1TOHdKRlVpdURLVXM0citxa290OTgwL2JkOUNCK1JqVkZNOVVp?=
 =?utf-8?B?aHQ1akVhZ1RBZ0IxaTFBNllyRER6K2hHMS9XVlh1azREZXpFcmYzeVF3ZzNK?=
 =?utf-8?B?MzBVb094QjNrTkYvd3QwQTJGbS9zeU01M0g1eFRvVGxDWDB4cHJFZE96OG9I?=
 =?utf-8?B?ZzYzTFhBQkdMeEVzYVRiOUVkWkhMZnNjUkNKeXhJK2NNSFltallIVW03ek9z?=
 =?utf-8?B?NGxyWkNSbnpDako5dVU5SklDV2t3UWkwMTNrbDBhcW56T3JBUmVBQ3JHcElu?=
 =?utf-8?B?NysrTmJrL0FzNkxLNlpKK2R5UThnVTBvZlBpeno3WkpENjdHS2hOU3RjMGtM?=
 =?utf-8?B?OW1ZYmxZR29wRm5rY3gvT3VKUTQ0N2JOTDhiRWZtaG5JRXl3b1VYbHF4enhH?=
 =?utf-8?B?NGM2amRBK0Z6aE5wSHZDdG0zckp6VzBvcEFDS3hTajlST0psMmw3MzNLQytE?=
 =?utf-8?B?TWUvWmVVcWY0bjNsUDRPYk82dExSdk1PbDFyUjJOeENoMW1QRlBiMmNhYmZp?=
 =?utf-8?B?b0p1SUxNd0J3dlRWOE1WQTk0QzdWaStNYjVkMnZnQlZvd1hZRGFvQndkT0hT?=
 =?utf-8?B?WFZscWovUU5Gb3lOQ1J1WGdQU1Nkci8vSHI1UmdoYjc4SE41L0s3dXJnbzhL?=
 =?utf-8?B?eGJ4U2RteG53cmo1S1JKSjR0TTdYdlltQ0VaSnRSenU1TWFDc01qSThhWEgw?=
 =?utf-8?B?YnI5V3lXL0FFdzh6YWYrS3JnSmROckdkM0VNVnZtTXdEQ2UwdVZ1akgybDBB?=
 =?utf-8?B?OXdVT1NTdUp3cUpkUGEvVFpQNVlLSVBlYUxBQVh3L3dENkVTQ1N3Rm1WM2w1?=
 =?utf-8?B?M1JybFlmVDUvamJEVzFDaWNVUEQzRGFVMVdOY3grcWV3UTAwNm9WUFI3ekhF?=
 =?utf-8?B?UkRkbEJxa1huc0krN1JaMk1rTVE1aVFrdVpTUzlwVkwzTmZ6UEZBVlhMT2gz?=
 =?utf-8?B?b25oWW9YNlpEYk9IMmhrWmtMMUNqcnNKRWxHdFV5UTE5NnV1eWtSai90aVFj?=
 =?utf-8?B?NmhQaEFTVTJvZ1JrQWlJb3hqa2NrZFI0SHMwTmNKNk13M3Q3KzUwNlJ3bkRz?=
 =?utf-8?B?dVVzcU82cEg2UGkxeVF0TW5BcDE3L1ZNeEVTL1d6YVRxcnI3VzFUZU5SY3Bp?=
 =?utf-8?B?S3FiSzFqLzBlMmh3SndYdklDRkRQenRSeW1Yb1dkZloxcVIrVXNROEN2OHdI?=
 =?utf-8?B?U1ZIU1g1UXY5MlFSN1BkYUx1YWVtNS9KZU9Ub0E3QnBUQWpGZFBkUGFpSnRE?=
 =?utf-8?B?dEZ1Y3hSekh3QVNCcFJMTTlGR3p6NDdwRVpGSzM5eE1UUW9Ha3F5ZmdyK3Vi?=
 =?utf-8?B?c0hPZTBzR3AzVUYwOUQ0Y0VDTkNrUlJoUlg1NXA3Q3JrZHdWSkJoT25CaXBt?=
 =?utf-8?B?Sk5wblJHeEJDem14SFE1b3FuL2xybVFWVXVGOW8yTDd3Ym9aTnc3MlU1T2pv?=
 =?utf-8?B?RXFvV1NiUFR5WUl0WVpvUjM0Qkw1eTJlZkg4MEZPcm5JcU1BYVZZZElaWEQ4?=
 =?utf-8?B?enZaYmZVcVUzcmhWNi9OMElrWjQ3czczTklXTkNSNTJlVUlSMzNNZkFBdmN5?=
 =?utf-8?B?aWhESFpvaEtwbzl2WVk3YlBQdG1DOHQvS2x5bUFYUEFhL2JDMi8wUXlQb2tF?=
 =?utf-8?B?c2o1Y2JpS3hRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6077.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3d0VFkxTFpoN3gxbjR4UmwwanI0cWI0TWpkL25MWnozYmY4ZWg0V0dDcE5J?=
 =?utf-8?B?cWFFbFFaeXY1aUROcUxCTHpqTFE4dmVBczNadTB4ZWdZN3JKOHdvSFBUT2dp?=
 =?utf-8?B?VXV0QXY5ditGRkxjQVl0dUxZWEIvdDUrTjN1elpDVUhqWlEwODlBeVpBekRJ?=
 =?utf-8?B?SWlDOFF1N3JobSt5ajlJeEJGbkhvNXpPNHVWSW4xTDBHWGhGbE9mTlBXcWtZ?=
 =?utf-8?B?eS96aG5kRGhJWnBPdjZ6b1ZmR3EweUJ2TVZadTdDbzRCRXRpbWxCOVdSMUgv?=
 =?utf-8?B?QlAwd3o1VTM2RFcwKytQVlIxeTJBUnJRM3E0SlJ6c2NScS9tVFAyQnFscEpr?=
 =?utf-8?B?TXVYN2Zoa0VpdG5kY3RnTG5DTllxczJ2ZTJVRFdLRzFsU3VNR2xRYjI5UEpU?=
 =?utf-8?B?WlVoK1duVXgvZXVsdUViZHUvR0lEZjZBcU1VbTBSRWFDd2VyMCtSTDEzOVNx?=
 =?utf-8?B?ZWJGK2RyRjB0WHM0aS9jV29uTlN6eUx2bC8vd1hCUVRqeVJvVTBHOE1QSUh2?=
 =?utf-8?B?N3ZBbS9ZRm5MMlJCSVQ5M0plMWNLc292djJpYlNpN3dOTnJvUGZFY0lKRGlW?=
 =?utf-8?B?RVFaSzh1RENWWVdBdWpTTmJMRk5GUVVhb1R2bStzQ1grdk15aXJBTjBBZ0hw?=
 =?utf-8?B?ZHhRUlJQMXlWaVFqMXBBWkNDd0xWWWRLUThmdENqcVpNcjhyT0wwVmJkQUk1?=
 =?utf-8?B?ejJhendCUXREUHI2ZGZDZUtiMXNmbG5wendjMkJQcjE1ejY2Um8veU1TNDYz?=
 =?utf-8?B?UWc2UlVFbE9oNDJRZ3NrcDBSbTEzVmN3UFpUZUFDT2dwV2VDWFhZY1FnaHBS?=
 =?utf-8?B?ZGgxeXdobWpvYTZ2MytlaVcvL1AvRkFnNm9oZThINjZ5ZmpqK0RVcS8zTnZM?=
 =?utf-8?B?d0xlNkd3NzIzS0NRaE9oZFRUQ0h2K1FtSkdNNXJUUUkzNGdTQ0cyd1hqcWlK?=
 =?utf-8?B?ekxScVJnR05NcHRaMGY4NEo0RGtqV09TUTkzcDJOSUxJNzcyd1RrU2ZmU3Q4?=
 =?utf-8?B?Tkw4cnhYeEtLV1FMMElHMkFmaC9VNTFzQU1PZzVIV2VxYXNGZzFqdmx2N3Fl?=
 =?utf-8?B?bTBGOWltLzV6UVBJeGFpUS9pbUVIRCtCOUQxRW51ZFZZWUJUczlYcUJISGhD?=
 =?utf-8?B?bXIzNVZ1b3hDWHJQYTU1YTIxQWtWT0JROE15QW9HeEcxUjZjSjdmeUwzWUNz?=
 =?utf-8?B?QlVDMUdBbndjbVk4eHJUZGZ3cjNBOGk1MlBOOTlqSDJKVS9iWEJuVDNadTcv?=
 =?utf-8?B?ZXNxSWlOZW94eVlUU3FvQ0RhVGwvKzBLR2l4dFNHWVQ2UzExRjdpQUphQnVR?=
 =?utf-8?B?Wko1SzBHZzQ2NjgxVzk2eXZEemQrMnNRQUt0dkM1c1R1TEUxeEN1eW1aWW41?=
 =?utf-8?B?a1RRNXRxWThmNFF4bThTQjVneUJkbTJRRmxwMWYzdVpTd3NiMkx0TkJsYnZo?=
 =?utf-8?B?R09GQVNqQkJpekg0YUovT285MWtaekFVVG1VaXpWYjFwQzZxbXMreGtHaHQy?=
 =?utf-8?B?T2hUL3Q3MFk0c09kUmd4TUN3Z3BwbVZtL091czdQZG9nUlhkL0hxaGcxeVFM?=
 =?utf-8?B?R3FjQWRFNWthTUlYb3dHcDFGUGhCQ2FVbUhjdDE2ZVR5ZWpXMU5pTGdObm5v?=
 =?utf-8?B?S0xRMXhtWmhkdlU2cnJHUmlkNC91SkZ6cHRpRzhVRlIrN1lxSnlNNXZ2d0pG?=
 =?utf-8?B?blY2YXljYStSdzFFZWs4WUVkZm5NTzlMWG9EdEJFbk16dEdDU2lYKzZrZHE1?=
 =?utf-8?B?Y3RUb3ZvQjNiWkdkYnF1NXo0MVlqbk5Ga2ZOdWozOHRnVC9od0Q2NGV3UjQ1?=
 =?utf-8?B?WFFUNmtUWndlcjRHY0JLc2VKV1h6VmFEYnVHWHlYdktTWUpZczR5UFdkZFh2?=
 =?utf-8?B?Q3VXZjJBVERBTjRoRWIrTlJtT1lrdVQvZE1ndDAvL1JNRTkrM1kyN096djdR?=
 =?utf-8?B?cUk1d0VGNHc0amdieDhyVElQejR4aHltek1KZitUUHhIRDFaQW9UY1JOUnYv?=
 =?utf-8?B?eWMxU0M3T2tKbWovblZkRGNQNnBUdk5CSlU5WC9JVGI1bzNwQ0VTZjNFL3ls?=
 =?utf-8?B?MjB4bW9SQ25HZWd1Rkc1ZFh5UmVvUSt1bWUrOCtQTjl2N1FWa01UUWNhM3hF?=
 =?utf-8?Q?jtdtXONtCG8PA8US0K3cJmAfF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6077.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231e7861-e473-4474-cb58-08dd81c12aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 17:14:40.5147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XTpKqzk+c22oPvKZiBwDRLX+CfkJxPfcK4HmEpOQq3Uwrs+PUUSRGILvAolf5HuzPdwtV0/Z13COf+Bd1kqu8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
X-OriginatorOrg: intel.com

PiBEbyB3ZSByZWFsbHkgbmVlZCB0byBtYWludGFpbiBhIHNlcGFyYXRlIGxpc3QgZm9yIGFsbCB0
aGUgcHJpdmF0ZSBwb2ludGVycz8NCj4NCj4gSGVyZSdzIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhl
IHBhdGNo4oCUcGxlYXNlIGNvcnJlY3QgbWUgaWYgSeKAmW0gbWlzc2luZw0KPiBhbnl0aGluZzoN
Cj4NCj4gUGF0Y2ggUmVxdWlyZW1lbnRzOg0KPg0KPiAxLiBFeHBhbmQgZG9tX2lkLg0KPg0KPiAy
LiBQYWNrIGFsbCBuZWNlc3NhcnkgZGF0YSAoZG9tX2lkLCBldmVudF9pZCwgcmVzaWQpIGludG8g
dGhlDQo+IG9mLT5rbi0+cHJpdiBwb2ludGVyIHdoZW4gY3JlYXRpbmcgZXZlbnQgZmlsZXMgaW4g
dGhlIG1vbl9kYXRhDQo+IGRpcmVjdG9yeSBmb3IgZWFjaCBkb21haW4uDQoNClRoaXMgc3RlcCBp
bmNsdWRlcyBzZWFyY2hpbmcgdGhlIGxpc3Qgb2YgcHJldmlvdXNseSBjcmVhdGVkIHByaXYgc3Ry
dWN0dXJlcw0KdG8gZmluZCBhIG1hdGNoaW5nIG9uZSB0aGF0IGNhbiBiZSBzaGFyZWQuICBUaGlz
IGhhcHBlbnMgYWxsIHRoZSB0aW1lDQpiZWNhdXNlIHRoZSBzYW1lIHNldCBvZiB2YWx1ZXMgaXMg
cmUtdXNlZCBvdmVyIGFuZCBvdmVyLiBFc3NlbnRpYWxseQ0Kd2Ugb25seSBhbGxvY2F0ZSBhbnl0
aGluZyB3aGlsZSBjcmVhdGluZyB0aGUgbW9uX2RhdGEgZGlyZWN0b3J5IGluIHRoZQ0Kcm9vdCBk
aXJlY3Rvcnkgb2YgcmVzY3RybC4gSmFtZXMnIG9yaWdpbmFsIGltcGxlbWVudGF0aW9uIG1hZGUg
dXNlIG9mDQp0aGlzIGJ5IHNwZWNpYWwgY2FzZSBhbGxvY2F0aW9uIGZvciB0aGUgZGVmYXVsdCBn
cm91cCwgYW5kIHRoZW4gZG9pbmcNCmtlcm5mcyBsb29rdXBzIHdoaWxlIGNyZWF0aW5nIG5ldyBn
cm91cHMgdG8gZmluZCB0aGUgbWF0Y2hpbmcgb25lDQphbmQgbGlua2luZyB0byB0aGUgc2FtZSAt
PnByaXYgcG9pbnRlci4NCg0KLVRvbnkNCg==
