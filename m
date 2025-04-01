Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8254E22612
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 01:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743469424; cv=fail; b=FR53ENBGLkh1WEifobatlAz9mrWruMlmqG9fcx2HBLxxEQATtbo7xhRdkHUe86cn7jqfpOQZo7BYL64p4pjMZOp1trGwwIDzXZlbVTYKVVIke97LHXD2xT0v6Gi47eN65CGmvibhmJNpfJfz9R35yXbgVieaznPeGExtkMtwEls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743469424; c=relaxed/simple;
	bh=ha9DC561sRfb5u9YnCzs2Wfo+40U/8KBVgfOb1ZuWU0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QMB4cz8dnm+QHy0NtgK76pn1aM2gR6rlUKAlfBLiT0UfTlTEvM4WQIXsg3JF3kPJgyWiCtBDz8wpn5tcKS0p1nZXi/Xu4G6+srXGi9xrrZS6z1WzlaJHOeJvHFnOv+iv3pFyFK+Dcv+oiZqBnVVFEYbZAHGjSD2z7iZstHn+KN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBDKFMxS; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBDKFMxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743469423; x=1775005423;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ha9DC561sRfb5u9YnCzs2Wfo+40U/8KBVgfOb1ZuWU0=;
  b=MBDKFMxSBec/bKLaOHQmGOjF3PzW6k/VLxpjBakoQS+AWWPW72LLL+WH
   3MJ5J9jqF2DZLEpXE+dvZaKUxWAJrRj3IIUI/Wk8cJqh1ybl0qP35riQL
   BqlfSIb7PXrEktNaIYKhhVsXg9oUFTyK34atvieppysqMCTmkUGCh75lF
   oHCTpe61L3cGlS9m6NfmFiN8oosOb8gixastfOGCbVD07ZLR+LP5j56Kq
   4ayvlj2C7z8OxETwnArj7CJJ4N8Ge6rKljtsZAHFvnKgSnHlZDNOOEb72
   IzDFkomtURvPl+9mrcC9lcgt90Zb3QUcEfaPcgcpKrC6dob2qud/Lbg+w
   g==;
X-CSE-ConnectionGUID: mylk87WnQlixa4IEWwSnjg==
X-CSE-MsgGUID: V+EGSd5WRCiRWuDQJfiiyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55435197"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="55435197"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:03:40 -0700
X-CSE-ConnectionGUID: ahc5vBOPSHyTcwsnAPH/QA==
X-CSE-MsgGUID: SGl7svqGQ1WJSBci29yBxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="126464680"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 18:03:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 18:03:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 18:03:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 18:03:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lERgJ5RErYOe7dNHKwylGbd811OE4/Md6YETORBxvSbOZW7iYMdxWgukl652y1YthsQ7YJXvdyZEf5qCUmR08gt5zft0Yb5y2kELBweuBkzpVvSAduKbj1b69M3bKTvfNzzLUt/IuKWS0WE3B+Jw0dpwA1tMoBZz5EHSAS1XcFQDJ8jSGFszx7Uz/PS/Z2/C5x8dvacuAt9jBXAytix6YDr6DWiJv6P2DNU9dpWiUCZqrjsfenIldPdujPMsJyoi2/z4Hhx+8bniw8cBf4X/dCZMkgGsNQKetDvVoSXFQSE88nDm6B8jCqjKrIvdFd1C/UufpdkNoty6Uq/Kmr2f+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ha9DC561sRfb5u9YnCzs2Wfo+40U/8KBVgfOb1ZuWU0=;
 b=E49kDCUqyDgghPkv1I2Ou5BDKyMoOK6FzdwhQgUSsx+4Ax+zFeFnecpd33hI2EJG/2mldttxX8epndQdGA3mXDnqu0dv4Edzlsk/wab+zTh9B4r7p4C9lhLUrikBXQ7uoI8kFoiGgh4NDvky91U+mnwm1U9chWb+q0re+WS9L/L7uWNxBUdWPsGvL8OPsYkZk0O++irdWQ07ov2HHE8UWwDfb0hEVsTjV6mD8wPSxQP5Fw+AwXvCbLSsxVggEpM3P/OWkaXfN64xr5d5PV13W21hbF5m2wYbCje451AvscfzpGfpIZ5xtzvskn3H+fvJZiY2QQeqJbYyf0VNcJb6Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by CH3PR11MB7202.namprd11.prod.outlook.com (2603:10b6:610:142::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Tue, 1 Apr
 2025 01:03:03 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 01:03:03 +0000
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
Subject: Re: [PATCH 6/9] x86/nmi: Improve and relocate NMI handler comments
Thread-Topic: [PATCH 6/9] x86/nmi: Improve and relocate NMI handler comments
Thread-Index: AQHbn3Leie2R5s77/kySrL5Me8QKk7OOBLiA
Date: Tue, 1 Apr 2025 01:03:02 +0000
Message-ID: <ebe40381df4306a6cf772f868d4980d7ada1767b.camel@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
	 <20250327234629.3953536-7-sohil.mehta@intel.com>
In-Reply-To: <20250327234629.3953536-7-sohil.mehta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|CH3PR11MB7202:EE_
x-ms-office365-filtering-correlation-id: ce5baf4e-f086-4555-84f0-08dd70b8f43a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TXMxaGduL3g3d1p0RytNaEtxNkNjakE2WVkxVC8wVGVhS3VTZUJGNjRWZ3Aw?=
 =?utf-8?B?dE90TTVuSlRkVUtXM3BXWHJweEl5cXJjT3FTQlAwT3JVcnYwNFd4Wm9SQzFa?=
 =?utf-8?B?MWMrcHh1cVZ5YWk3UkZRNUxMc1ZQTDFuK2wySERreXVXOGRsdmwvVXpRTCt0?=
 =?utf-8?B?RXFyRnpTNFRrbDdQR0hUSzduZk84UnFDK0wzdDA1QnQzSFIycUFZV2UrUFUr?=
 =?utf-8?B?TndBdit3QVJiTG5CTDhtNkorSGJyN1VIais3MVRNOFVxSTNkb1VVSXlOd2pW?=
 =?utf-8?B?Tmt2M0dJRlZ6OGJGaWlGNnlVKzBoeTV1elJzNEJ4dGQwSEhZZlE2N2QzazhO?=
 =?utf-8?B?YkJJVENwNEdhUzh0cGlHMGRxeWlEM0UzOWluM0RrZzlSazdsa1FhNUdQNHNO?=
 =?utf-8?B?VTJVZUZSUU5TRm5pMVN0MHJONkN4RFVDelJrRVNtZ2tjd1FlMHdzV09oSkRi?=
 =?utf-8?B?YytMUGQvSXVqYWk1azFmME00NVdhQ1piR3FPcE5GaHQyaENKMmFEeEdzWjhN?=
 =?utf-8?B?K1g0RTczSFdqS0Jsa2Jxb3NFSXBaQ1EwN3pKclBNcGRWVjJBanFIYmNxZ2Yx?=
 =?utf-8?B?bHY4TEpYaUlRN0d3cm9yWnRPMzRVR2V0RFMyRG01OFY1Um9kZjR0Z0cxOEZZ?=
 =?utf-8?B?Y2o1STZ4RCtsS1c0SmtGQm5XYTlxKzAwRkZFNFJiUWltZHN6dXdMejN2MUNv?=
 =?utf-8?B?NS9NSCtVZHdpajZIaTlMZXZWejM4alZ4VjlxbVQ1b3ZnTlJnTEJIV29rbnND?=
 =?utf-8?B?elducFgwUENSWnFsM3c0THh4bzNmQy9VVGhtRzhsSE16T09iZm03N1ZmQWFo?=
 =?utf-8?B?d2RvVmJoKzJjeXJOdmEvRWQxYTJiRkJmcHhEVkMwK0w1WnJFQ0EvWDZ2T0hL?=
 =?utf-8?B?QTZHWTBLcGtjWVd3QXVaaGxxRC9BZXQ4Njg2SWNFbWVKZENkTmdMeTJiQU5S?=
 =?utf-8?B?SmZZaE1SeFlyQnFMcmFNTGh1bUw5RWxINmI4NG1PK0lFMXhNMW9rdTVZSDlu?=
 =?utf-8?B?RTFsbTFtU01XQk5ESnlzL2k2bjRpOFZ6dkZMVWpEckl0Q1dqdlVyYkFSSnRo?=
 =?utf-8?B?Uk1EVllIdUxtRGNwemROUitkckpXTFFnWlNvRXhHRWMwb1FQd0N6OFQyOWhP?=
 =?utf-8?B?WktsaWxSTHh0cFMwcjdwU1JTRThhR0EwdDdRTm5sSDhWbzFmd0ZnN2JPcmFn?=
 =?utf-8?B?ZWxxSDR0WEdhaDNXZWtEeWFJcCtwMi9RV3MwWGZOYVRKNEd1NUozM2l5dG1M?=
 =?utf-8?B?OEdHS0p0RGUxbW1mWHNDZFBTazB4Ri9zbFJaaDkramRXMFhWR3Y4QWdYV3dR?=
 =?utf-8?B?M3JhNG0xSDdMUFZRMGl4MDRORTRnU0E3bGc2NS93amFpbE1COTRpTlc2dTNn?=
 =?utf-8?B?a3hRTWVXbStPaXduSVNQUHZZcFY1VGlkLzBOYytHUXRxcm11dmQ5VWhmN2k2?=
 =?utf-8?B?MElBcFMrWmExdWxVVzE0bXR2MW84ak5iVFo4ckVQNlRuZ3RSUkRqRFlSSWY5?=
 =?utf-8?B?dmx6L25SQi8wdmJsaGdhYVI3Q0F5U0hQa3lxanNXNHdyZGl6M2wyL0xXRUlr?=
 =?utf-8?B?SlY3WllrRXRhQU5sV09DYmVRZUIyODVoM25LaFU2djhIdU5YRHhZMWZLb1Nr?=
 =?utf-8?B?alRRb2k4S0theUo2a0w0VEptUkhPcGxjRGtvbWlzbGUzcmRRcHg4bWRyMTdL?=
 =?utf-8?B?TWt5MFY4OXdDdE1EaGpwTzlhb0xldTk4Q2crQWJ2ZTJRYUdMY2RZNUdZMjNu?=
 =?utf-8?B?UDdETW80RlorQmZ2clcyM095K1dTR05hdmQ4VUtMTHYvdUZKRk13Mk1PZUdm?=
 =?utf-8?B?SlF5NXdWd2cwQ0NLUmJZVGtwT0lSaE5TZVQ3cmROdmtwOXRGL1BlTGg4eXMz?=
 =?utf-8?B?V2s1bHQ4SzliWW9BdmMydDhIQkJNNTQxdWQ0ckpUeVJkWW9CVGIrZUE2d3M5?=
 =?utf-8?Q?Dz9SkcaJ0+j957bjqPQa/6v1l4phyGl7?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkMrQjZZRGNEUEVZL3preUZLcE1tMWtRR3ZIT3V3NUwrejdFYVk5OXNwaTJP?=
 =?utf-8?B?VEk3V3REY3MrQTVDT3g5b3FIa0pkQmFlb0JPMlpPSDN3T0YwY1IvSk9jTjJk?=
 =?utf-8?B?Qi9KMnA0NW96Zi9FZWR2Y012K292VlkxTmx2N0tKTk05RmRjWkp4Rm5QeStI?=
 =?utf-8?B?d2NqWkxNbk5UaTZEN3JQVGsyMWozdmNvYW42eXNYa1A1Y1g0MVJOVlpxQVhj?=
 =?utf-8?B?ZllNU0RVUTA1bWNYdUw3OHlNMDJMMkxkWkVRT2tuUXZVYnpqUUd6dXdwSTFE?=
 =?utf-8?B?dVYxdElLblZVV1BzVUJ3YThPdVZYQjZSUWl6QkpON0U3UHBCcFhXemlWdlJs?=
 =?utf-8?B?UFZ1bjNoZ0R5czBzSTlCUUNrL1o2U2JDZW1pMFFqbGc5aCt1RXhDaHI3ck1t?=
 =?utf-8?B?WmttY1hSbnozZHVjZ1JadlcrUVVSM1hzaitNZHZFQ28ybE9YZzZhZnV6SGEw?=
 =?utf-8?B?VUdYT0Rzcm1jL3M1Vjh5bk9rMitaQTRvaTFwVWw4Q1FoQlU1UTB0bmV0Nmt0?=
 =?utf-8?B?SGVGRzcyV0ZaTFB0VGlBdms3aUF3cXJsZEtKcUdBVEZIaEtLdDUzTWFsenVS?=
 =?utf-8?B?L0RDaXNrTXhTNVJDZE11Y2FPVlFFT1lscUF5Tm01a1hUT0QzOFFYSTRTbzhS?=
 =?utf-8?B?WDBEckRRQ0ltamVvUnpoS2labEFPVUNtN2FqKzRwNnRocys3WjBYR0NiQSs0?=
 =?utf-8?B?aFZ0aXJocU9DNmM4djVNb3VpdGU2QVVudHBZbzBhcTVvVlF1L1kxOWtEa21O?=
 =?utf-8?B?V1paeXVXNkFNVmFUWVoxK21JUWNBYjBxNXlsKzNqOE1tMUFyUGVqUGxoOGhJ?=
 =?utf-8?B?SUdENExxMDRZWk5jczRwdkxWN1pwSjlxRjZDc29QN3BFTVUzRkxrbGdFaE9W?=
 =?utf-8?B?MFpHQXF3L2xoYWRMUHRHaUF6K3orWmpRL2F5elVVTzcyd01CRWNXemdWNjMx?=
 =?utf-8?B?YnFnSllFY1FoNnNyVE9zVGZKOTVhbzNsRXFuUUErOWRUVlc3ZUQ4M0pjb0d4?=
 =?utf-8?B?NUlFNmZMZ3BoNXlVOEpBUHpJN0VIVk11a2l3ay9nMFpWN0ZFUllJcGJwTDJm?=
 =?utf-8?B?WmEzd3FKdTcwYkdVMUE2VTR4V21iUHBSOEIrTnZwaitFSHBxM2VPZHlPQjdi?=
 =?utf-8?B?dGZyckIzcTFMZEZSdVB3SlNJMS8yMTZKckdKUjQ5alRsYzFNN2poS0JQQXhL?=
 =?utf-8?B?OVdLaTdRb0xBcUNFRWkwaTZUN2tmV3FPdUp1ZHN1ZjJVT2RNVlBwMkIxZjc3?=
 =?utf-8?B?MVJUNUoxMy9lL3dqQnl5ejBuU0ZHb1RxMWpmSE9hVTE1RDdnS3BYWk1adUQ3?=
 =?utf-8?B?U3FuZ1lGQUtpclpoT2FXU2VxbW1PWFhCcWE0RGtJN0hXa3BrbDFQQlhxeVVi?=
 =?utf-8?B?b2xHWXRRcEQ3ekZJT3haWVIwQStXZURhYUI5VE5La2lRVHNCaXRXNHlNR3F2?=
 =?utf-8?B?WE1kNndMc2Y3d2Q5dnRlaHZiTTc5OVVUemEwNzIwdmJSdW5MeXZiajMxak1Y?=
 =?utf-8?B?cTlqVmE0UHpmcHN3bHNKOFZwMmpDUGpnRUp1b1FJMUJYNnloTFdiU1dDNmgv?=
 =?utf-8?B?RUpvaFNUT2NER0ZBa1JGTE9UVnRzalZsUGhCaGVDaGFBam1MaWcybVJHZmtr?=
 =?utf-8?B?elcwbklxV3NadnhQaU5WTnNKQzQxZnoxZjlmNEt2ZHlrQzc2Z1NCaTV0R1pV?=
 =?utf-8?B?U0dUYkZwc1I5TXUyeWxnOEFkZ3pYWDNZN1NkWG9yZ2NtTExEc3B0ZUJJajhR?=
 =?utf-8?B?WHU0TisrWVVFUEZqRGdWd3FXL3d5WmtDMlNoU1N0L3R6WHc2Ukk1eVNpNG5Y?=
 =?utf-8?B?OU00bHpaSERjK05IeDFTM0ZEdm4zOTVVb3luUmw0RTcxbmowcVJ6NldUblAx?=
 =?utf-8?B?SGx4THllYXlSMXArZktHNkVvUE5FTWp3OHNESHVxRjkwUkZ3aFdCNTBkRVc5?=
 =?utf-8?B?RHU0Vk9OdGJTa2pycDZGM29CbytuODF0UVZhb3MxV1JVQTlJaENWRTQzekNP?=
 =?utf-8?B?eHNlNFFLQmlJd1g4ZjVFNDFWYjhiTzZaWWdPRU5Xb0JZeFBUN2QwK1gwR0I2?=
 =?utf-8?B?QmFrWTEwak1NTTYvNW92a3RBcHFpckJ1cVBvY1pUMjRNQWU5VktqUkN4S2g2?=
 =?utf-8?Q?Lq8rnrtfiA4RMmTnc8urwl6vt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <228DA48040094A4AAEC4446D7F70F252@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5baf4e-f086-4555-84f0-08dd70b8f43a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 01:03:03.0009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RauiRKsC1THUworMpQQdGc5SghLCFq4zFvOBmWVETz+PyS8iKxf9Mk0tV9y26VE4uibyjj0OZHljZkXcF6kLMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7202
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTAzLTI3IGF0IDIzOjQ2ICswMDAwLCBNZWh0YSwgU29oaWwgd3JvdGU6DQo+
IFNvbWUgb2YgdGhlIGNvbW1lbnRzIGluIHRoZSBkZWZhdWx0IE5NSSBoYW5kbGluZyBjb2RlIGFy
ZSBvdXQgb2YgcGxhY2UNCj4gb3IgaW5hZGVxdWF0ZS4gTW92ZSB0aGVtIHRvIHRoZSBhcHByb3By
aWF0ZSBsb2NhdGlvbnMgYW5kIHVwZGF0ZSB0aGVtIGFzDQo+IG5lZWRlZC4NCj4gDQo+IE1vdmUg
dGhlIGNvbW1lbnQgcmVsYXRlZCB0byBDUFUtc3BlY2lmaWMgTk1JcyBjbG9zZXIgdG8gdGhlIGFj
dHVhbCBjb2RlLg0KPiBBbHNvLCBhZGQgbW9yZSBkZXRhaWxzIGFib3V0IGhvdyBiYWNrLXRvLWJh
Y2sgTk1JcyBhcmUgZGV0ZWN0ZWQgc2luY2UNCj4gdGhhdCBpc24ndCBpbW1lZGlhdGVseSBvYnZp
b3VzLg0KPiANCj4gT3Bwb3J0dW5pc3RpY2FsbHksIHJlcGxhY2UgYW4gI2lmZGVmIHNlY3Rpb24g
aW4gdGhlIHZpY2luaXR5IHdpdGggYW4NCj4gSVNfRU5BQkxFRCgpIGNoZWNrIHRvIG1ha2UgdGhl
IGNvZGUgZWFzaWVyIHRvIHJlYWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTb2hpbCBNZWh0YSA8
c29oaWwubWVodGFAaW50ZWwuY29tPg0KDQpBY2tlZC1ieTogS2FpIEh1YW5nIDxrYWkuaHVhbmdA
aW50ZWwuY29tPg0KDQo=
