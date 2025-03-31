Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D29F38F80
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743464803; cv=fail; b=li5JW+ZXprJlFfNG2mYWy8TfheuerFKmF4vAjRfnZL+6njJp1Qd6GjlAA7mJmaDiH1YFuWedEJ32zIAgDoAkOXsfypGbMv3MCjzoL9IhbPVPzoeIbTl9WocotBlCWjEFgKSwVeghjn2Z5jTTImjbMw1eOFYvWkrNPevPIorpN64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743464803; c=relaxed/simple;
	bh=8QG2QsR+lmjwjroNQyF4GD/wZ9ac7K4HGdn+BM7Bphc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TOcD2gkBoCDYaSTKepdRv0zkE3+7V8RwQxcTVv42LIo8//HbzTQxHSEtU/5t516rBvnpNzTj5unaNL9d0xlg2uBQ3OpNOX8Y27K5RkjJ7+4TNhM1UuEQqqfVaOr0DQ3LvVRR7suty8XilO/BIAewATt4bHRId6Wbjs6/tyc4PkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMV3oOHs; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMV3oOHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743464802; x=1775000802;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8QG2QsR+lmjwjroNQyF4GD/wZ9ac7K4HGdn+BM7Bphc=;
  b=jMV3oOHsE9PyPABygj54xPP5BzckbbMvLIrxz+veSlzFD3wJSZqyg41h
   oha75hzJrWs8jqSDzUIJiQ8Bc7hW3DyYvzTuJeWf5KbeWXuqZihpJMD1C
   z++LBaGkzQNGnbZBZxGvXpqO6kq5lJM/mN5vFOqRkIhL/g6HJa4YUjh2B
   u6gh+vUzxnD50mVVj479n+mcCvyBO8cU99nD7umo1ww/vTWhR+vO1rdkh
   kj4Hz2BWUtiIYcKAZxC09DkYCQu9HB6TSZ3voS/Gpr6fht6nj73uXUlNH
   5/eK4IOov3BC1RJggKHz0IMhGPkePfnBo2NcfeDAeKv+5mJsH15iUl9ml
   A==;
X-CSE-ConnectionGUID: 9n19FLCHTB+CqTOv4egAzQ==
X-CSE-MsgGUID: Bk92VDxwQiKRJVOfEWv/+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55765595"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="55765595"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 16:46:41 -0700
X-CSE-ConnectionGUID: OyMnnXVzSfKWk/dVCTJHQg==
X-CSE-MsgGUID: fhTiZnr/SzGgXfhiOg0R9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="131438991"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 16:46:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 16:46:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 16:46:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 16:46:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNN7OfUEPtgKlEdmYH46LvAmMIFuQnAPoFadTDsG7xbUiDw4ph2Lr1sBbvl4O0ADglAe9PXJddUN205mldVZcY5p7lG84S3tKpmR+/hikkv3MbCXkz2zjLRxbGAAoSNAHkRrU67bMDRkpRDDREs4iNk6OaHJYA6Xuru/lhQDuSZ1S/0EfolMbQfj+AD1LTSKwKs+CYhqBi/j0Ghamk5wwDJ2gyny6x1rv0BR6fl2N/kEAtTJkFbTsjyoesETqQ5h8tb6lUpaH/fJ76NiBpGzUwUC74iySgUvs2qt9HzbHEPn9aR8IBQjQycJ2NTv3MEM4/Lc5kOmwK+D/vIIi4vvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QG2QsR+lmjwjroNQyF4GD/wZ9ac7K4HGdn+BM7Bphc=;
 b=QvJ/4dzZoF20BO1gPUuOLTDKaNfexTdtwKWdhh4TbnfVMb3kVEHXsE2zhipfwfQG6aSJga9qtOZej752XC/i2UMwvFfaW5FdnFk3zwG3vycSPEU9RWO+e7zPF4/YR7CG0C2fO42xInUEdYUBVuMtGXLOnqJ8RNavS36fsgXiuPLcEvGNqBbyGXuO+zfk6x8KNBlij6T1Rxi4BmwoCREjvvGQpiaNDCfENUyJWHp6J/NMUkqRpI91MHu0BpC6xGh4CNogbL3NogxEbqxxwsf3rYh0Ecan1KGs44bV21OWOpyzgd0rCgjrFh8wJrfWXUT4TyTQ2jo3CO3hjgTG4mqznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by IA0PR11MB7693.namprd11.prod.outlook.com (2603:10b6:208:401::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 23:46:09 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 23:46:09 +0000
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
Subject: Re: [PATCH 3/9] x86/nmi: Use a macro to initialize NMI descriptors
Thread-Topic: [PATCH 3/9] x86/nmi: Use a macro to initialize NMI descriptors
Thread-Index: AQHbn3LWi9kjk8lb10e3Kw16p8sKYbON7zyA
Date: Mon, 31 Mar 2025 23:46:09 +0000
Message-ID: <bb3c2ea4ba29635d71d004eeac794b1f15998765.camel@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
	 <20250327234629.3953536-4-sohil.mehta@intel.com>
In-Reply-To: <20250327234629.3953536-4-sohil.mehta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|IA0PR11MB7693:EE_
x-ms-office365-filtering-correlation-id: c1a925c2-9571-4561-df41-08dd70ae3648
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QWloN3dpUGMvWTgvUk9zeFArRlpzVG9pSU02cUFTTm0wMVBqOU5Kc254bUVJ?=
 =?utf-8?B?Y3ZYeE5JejVQL2llTDZXWEZRb3MyQzlDeXMydUwvQmcrUGxvV0ZzbzhYMEVY?=
 =?utf-8?B?b0ZhdDJpbCtvQXZHNjlpcmJlSW4zWTdzd2JrdHVjZW1OSzRlNTRQaVJJUmFQ?=
 =?utf-8?B?bTYvcFhEc0J0Wm44UkxQWXM3bDZ1VElyNXNiQkM5ZWZOVmpaL3J6RXFKQTdC?=
 =?utf-8?B?QVp3dkYzSVR1TC9Fa3N2SUFZc0J3NjVjbjFzWkFYRFp1YlB5L2lEWUNjNkJV?=
 =?utf-8?B?VHBVUE9mT0IwZVlENlBBZmFsMDlMNmU2ajJWQllNc2xDNDFFdmVpUTlCTVpF?=
 =?utf-8?B?aGZOQmt3RzlRZ2U4eDI5K2lyem9WTC9UMDRuNGVqRWg2SENCZ2pnMENkTmlD?=
 =?utf-8?B?VmMxRnlUb0dGdTVraFBNZmR5RGVpQkEzU25sc2hrU3F6S2l1aWo1d2xibDlo?=
 =?utf-8?B?dTJjUFJ2MEQ2eEdlRUZ6eFh1SVVBWEoxRSs5aDcxK2ZQZGhQSXZ2WXp3UzZn?=
 =?utf-8?B?UXk2cEdVbW8xUWliMkJVMlR5dm9yU1M5OHJPOEkyWDVUVEVvUzNxdVhocng0?=
 =?utf-8?B?VmNEYUZqNElKN1QzRDdIVGFDL1VQWmt0czl0bjkvTDBMNjhvSnI1VTNUYk9V?=
 =?utf-8?B?U25qU2hhR3pYS2tXaHJ4RFRSeFVJbnNMZ1Yybmpxblp5SUNvOWVmdU0yNlI4?=
 =?utf-8?B?eGo0ckdiOWFvRGFqcUZ6ek9BRmJwZUNoN2hQYlVmcTd2Zi92Z2xvcHF0Qm5s?=
 =?utf-8?B?UFE2VVp5Y2RMcXhMQi9KMHl2TmhxaElKbVZ0WFJXTGNrWjJZc2wyNndtcTRZ?=
 =?utf-8?B?d2ZDVVpZNkRxL0p2OWlvM0o3OFNiVlYxL3NKdVRTbDFvT2IxRFZWZDdaMnJz?=
 =?utf-8?B?d21OYlg5QWlGM2M5ZTBtYUhOSEhJQStYWm5sajlrSWtJWlpjMUNub2V5S2Fi?=
 =?utf-8?B?Nmw5NzBMRjRZa0huQnRQRmVMNE5uUmdKd1RKSk5Od20vSmthYkVwVnBWaTZN?=
 =?utf-8?B?YnlJaStmd2ZVSjNweFFjWFh5SGFXR0p1V3g3bWJxYmx6dkFLQTJLZFE1SE9p?=
 =?utf-8?B?Q2VSK2pNV1Y3OVM2NkF5WWtmcDNEajY4cUMrVlErdnl6L0Y1V3daQ1VCQjVM?=
 =?utf-8?B?ZWxHOGhPKzNwSVJ3eUNCQzkxZk5yZkxLWmp0czRXS3cyYURKRUQrMnpUMFNW?=
 =?utf-8?B?Z3BCMnNIUmZYKzR4cFpTb3VGQ2IzbysxbjY5KzRCSS90dkYzR2dlemVTYXM5?=
 =?utf-8?B?a1VsUm02UklsOGFqai8xVlc5MWs0eUZyVTFvSzF4dEJ0WENib0U2cE5yTmIr?=
 =?utf-8?B?TkljblNkM28zVHA0NnllK1YrUHRYaXdHbElJL292Yko2bDd5dVVEMThpblU4?=
 =?utf-8?B?aFdpbGN1YzFTcFNPaHRJbENwZjhpNFE3T3ppMXlqekc1Zkp0azN1dmJESjV3?=
 =?utf-8?B?Tlc3SXAwenV4TVRiVy9CcTJZMTBDRGY2Q1VpMEd5WjFLRHlBY0tUa0pQQTU3?=
 =?utf-8?B?Y1NtMU5VRzMxWnh1T0xWUGRyYmdVeHpob1BZSWxMdmxuR1N2S3M3RWtEL0dp?=
 =?utf-8?B?OWhDckJrMHRyUmtGVkpkMGpWUmN5Y1o4dndDZWM0ZVk3akIxRzNYcDN3MmE0?=
 =?utf-8?B?anpCdTZ6Y3BhSWFjNFVXa3gySEpmWGFZdkJ6RkliRDVQS3FUc2JhV2MyMDhF?=
 =?utf-8?B?anl6dTQ0WFhvUHBuR05xeUdzYkVEYTdpTC8rZ0VoZ2lMVHpoVUc0RmdYc0JY?=
 =?utf-8?B?SnZsNzZ6bU1vMEl2YUxVbFZsS0VyYVlJKzkvVWVjaUNsWk9PRWNPb1dLRkZE?=
 =?utf-8?B?SS85aS9wR1FKYVFZRkY5V2VyaU83RzRzMmdST3poMDNVVmxUZkpyVTc2OUZ2?=
 =?utf-8?B?Yml2VmgwRSthS2VYSEFsM2hzSFVLTXJWVmFjOGZIODVRbnFBRmYwRlhIeXVQ?=
 =?utf-8?Q?sBg+qIDcLFKx47QuyDrxkmrZFo/Iw6ve?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qm45RHRhUTRwS0FNdkt3M2lRUk1xRk1GWkV1K09meHlxay9jcnIrZWdRS3lE?=
 =?utf-8?B?dnlDS2NqOTJ3dVYvcGhFblJXMUdhVGRKNnNtVU9QWTVaME5mVjJ6ODJQL0kv?=
 =?utf-8?B?OWg0K0RoaDlNZHNGdGxpNUhDRkVJWWtwenYwYWJtTUJnbTA5Q3JSbzdncTg4?=
 =?utf-8?B?NExESUl5U3k5TUlQNHZvZ0R0OUFLWFFQQVJwS3A4N2J3Rmc2QnBNNVhVd2s3?=
 =?utf-8?B?Rk1ubWtaeHFlaDNudUdxNmVsSkdWQk1Cb0JmTmNPeHJoWkMybVBwK1UwUnJJ?=
 =?utf-8?B?L2R3MGRmVEhQU3JNb3doK1ozaSsyREgrSUI0NittUXJzd0NVR1hKUFJtUWRH?=
 =?utf-8?B?RjdtK2ZpN1F1WE1uWGpldHh5K1c0MzU3UHd0bmMzeWFkYmRiVWwxTmxRV05s?=
 =?utf-8?B?TzN0RTFHTWRSMEp5L01HTXhzQVFUVmVkVUIvd29BNEs2QkdHcUd3STM1bWpE?=
 =?utf-8?B?b1h4Wm5HOUJiblZ0KzdrV1NGQWI3WUpHbWY2N2N6eHpVNk1lRGlPNUNsaTFM?=
 =?utf-8?B?dUdyOHlJUUZnUnBvWjZLVjd5Qm4yaGlRekh2UFN6R2hzbjNlOS9ZNDRwck0y?=
 =?utf-8?B?em5lNmZiM2FDNjY4eUVYWTZ4cVhHWC8xLzNoSDFndXNyTUZQWTFhdFBHdEwr?=
 =?utf-8?B?QzNZM2dWNDd0RjBCTVErL1g4RmhMV0tEVXM2S1NCQkozUmVMeGwyY3RzcWkr?=
 =?utf-8?B?ZWw1M085VmxZM3BybkExYU5uNEY1SjZabHlaekR2N1Zwd2MzQzhGc3ZkR1Fm?=
 =?utf-8?B?dnBzSldlUFJNcGxucDZmcDhEVmF6anVVNWVYTXBGUkt2K0pPMXM2TTVWRkE0?=
 =?utf-8?B?T0Q2dzNjR3dZaEUvMDhQN3krNkNWYVNpRGVyQjc0YjRJV2h0VUlqcUhLVHJU?=
 =?utf-8?B?ZFVHTDVFczlmK2diMjZtMWZ0allqeFh4Um52clI0cGJ3TlhOLzlhVWhXektX?=
 =?utf-8?B?ZnJHZGJLRWFkRitiWFhEdDBjdUR0bUdrNldZWTBTUnlic1lyWVd6bE0xSzA3?=
 =?utf-8?B?b0syK0k4QVp4M0hnc2lGOURINkZOdVYxaFBtejV3NEZvY2NNRUZHVmxYaEZl?=
 =?utf-8?B?TmhoRmhYTXE1STJsQXhQQ01pSDhDZjFRajI0UlRUVExySXc3YkpIWU5yU3J3?=
 =?utf-8?B?eEI2d092OUtqZ0dhbnJCTXlCdGI0bTRuY3NFQ2VqSllsL0lTcStQczBTZ1Mw?=
 =?utf-8?B?MUNiQks3M2pGVERNc0pCb1MwbXlLZlJxa1p2cmVuWHQ3TVRHQnF3MFFUeDJX?=
 =?utf-8?B?OVpBRGg1SGJOdVZjM0xSb0dWNkVpRG5vZ0tCT3lqLy9yYWZvdHZHdjY3c3M2?=
 =?utf-8?B?WjRXMDNxdnhlcUF4U3liSHY3VWJoaDViZzVTMmovZGV5UE9VTW1JN0lrekxt?=
 =?utf-8?B?eTlNTGV3MlR4N3pPOFJLcjZKK1prUHQ0UllaK0lVcnBERCtWaW1pdEdibjJk?=
 =?utf-8?B?eHRTNFQ3S0NURE9SNk9MWUpTOEgvaFNjODlXaVdSVTNIdVgvT3ZWTytnY1NF?=
 =?utf-8?B?NHlKbGZCRDRCSWRVNXE5VTNWKzlkd09LZE1wK3FWSFFDR1RUNERKakhqbktk?=
 =?utf-8?B?Vm4yMllpVS85UWxmbmRxTWQxQTRJcXFudUNJMzhJclE5Rys1YVhHZkEvU21O?=
 =?utf-8?B?Q0QvNmRKdWNua25yTFN6Y2lzelNlcVNNVWpSbnBxWGt4RDBLREZhOGFHbVFJ?=
 =?utf-8?B?SmtxU1BoYXRWWmQ1OFllcWVWTnBpTmdIbFhTTkp1UlNid0gzakRSbFgwWG9W?=
 =?utf-8?B?YTVkRjNIYmtveW1TWXB1MkNudE5NTWVlNFV1TTFqL0pIS3dCekZLMVdmWFdD?=
 =?utf-8?B?WEgrK0NTcGZ2NWVJclVGYVNnRlptYmxWR2MrZFJsZHNTZlZMNHd5TWZuTFhD?=
 =?utf-8?B?Nkw0Y0QrY3h2RWRPTDZVWjRwdDBpUUdOeGZsc2VFNUJySTA3ZFcvUTA2ZHFn?=
 =?utf-8?B?NE5KOUtMNkxZcHdXS3BsNC91b1I4S3VvUG5QYjE1YWU2M0xSQ2liNE50SXA3?=
 =?utf-8?B?a2x6d1hNYzdCSGEzOXAzY1FBN3VwOWd0bzdNZ2J4c1E4Q0pwTFduWEs0UmV1?=
 =?utf-8?B?MVo5SExuNVc2aW5vazRCUWZBSEZvTFpjSXI3Yk9nbXB4VzVHc29zZWluRm45?=
 =?utf-8?Q?y6sGPs6d5VW3nMdfqL2mM9l+H?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A6157A187895E4E8024FFCB6CFA3015@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a925c2-9571-4561-df41-08dd70ae3648
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 23:46:09.3702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wcgxFb0AdOWpogiwjWJ0GlN+lzF7InCFIcGCVHqRqf2pvYYIeSRSEJ7Zep5mmzabY18W9JAKdkhEajk4x8YBFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7693
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTAzLTI3IGF0IDIzOjQ2ICswMDAwLCBNZWh0YSwgU29oaWwgd3JvdGU6DQo+
IFRoZSBOTUkgZGVzY3JpcHRvcnMgZm9yIGVhY2ggTk1JIHR5cGUgYXJlIHN0b3JlZCBpbiBhbiBh
cnJheS4gSG93ZXZlciwNCj4gdGhleSBhcmUgY3VycmVudGx5IGluaXRpYWxpemVkIHVzaW5nIHJh
dyBudW1iZXJzLCB3aGljaCBtYWtlcyBpdA0KPiBkaWZmaWN1bHQgdG8gdW5kZXJzdGFuZCB0aGUg
Y29kZS4NCj4gDQo+IEludHJvZHVjZSBhIG1hY3JvIHRvIGluaXRpYWxpemUgdGhlIE5NSSBkZXNj
cmlwdG9ycyB1c2luZyB0aGUgTk1JIHR5cGUNCj4gZW51bSB2YWx1ZXMgdG8gbWFrZSB0aGUgY29k
ZSBtb3JlIHJlYWRhYmxlLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTb2hpbCBNZWh0YSA8c29oaWwubWVodGFAaW50ZWwuY29tPg0KPiANCg0KUmV2
aWV3ZWQtYnk6IEthaSBIdWFuZyA8a2FpLmh1YW5nQGludGVsLmNvbT4NCg==
