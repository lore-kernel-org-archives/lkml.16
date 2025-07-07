Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12785800
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875390; cv=fail; b=rHbYe7uBYORVv04GTefXL+3xjXQ33X2q2w6sYGQ+ecpPpD5vnb+DUu+qDaHWmXJRNVOrW/ellukE62BEtr5HzEqoSBYDBLkQ3wzddGKY1K/a+hn/E9yqfsgJGhlLpin7MtrZVkKWljsxFVpAPTuubwm3PAMx1fe7uCZwJPVmCYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875390; c=relaxed/simple;
	bh=SfwdzQttFvXbEfkB0ibnuQybLXwUsb424DOfsltqqy8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BVGteOsUNfMCuW03Q1xaltgC1U7eS2w7L+6IEcQQgfu7igM/JPs0dXVl4XZV4gLSLOA2llgsxqRbBeG9B/MQJTzvY30x7xAMipzirVZhdohVtajwNICIdBgsBfxswBDdro1O73uGNtLtNr2zqzRUimPl769Uag/X6thMU6h8yJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cohPG4Ld; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cohPG4Ld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751875389; x=1783411389;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SfwdzQttFvXbEfkB0ibnuQybLXwUsb424DOfsltqqy8=;
  b=cohPG4Ldm/3sGdGtVBlJgde6a4RDHEuvWh1rmTa3HXeGWaXtbNoneT/g
   IW7JNs53HnHD828o8qC0KE4qX3BLbLXkfHtl4AgUQELvIcqieKFaTNHba
   JmN32UjX7PTK0HJ56IGPazF9Pz3dbEBeEZqy1K8ICPvy0hC/PsnZ7BXt3
   07ua6uW1CjnTBtWxHuDjUNTZzn/wtxheAx6ebHbT9eF+1RtLq2nErmium
   M7VBZd5E1jZPyrIhHl2Ih9Ucmsqsy7Ri5H5Rv/YuCW3ciJFI4cpH66yCe
   PxkLC6UPiakZeGrQWUZiePVbW79/WOyl5XSIpVFlGNWOOUJv3MHycRH8X
   w==;
X-CSE-ConnectionGUID: CHxlH1RfSwWei01gs999Qg==
X-CSE-MsgGUID: +U3rL0oSRMGt9TAslFvm7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="57891053"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="57891053"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 01:03:09 -0700
X-CSE-ConnectionGUID: RZ5qQWWbSleFGTeW4QCisA==
X-CSE-MsgGUID: Ahdy1/BOSam4SKgtEYg4aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="159689689"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 01:03:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 01:03:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 01:03:08 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 01:03:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KN+FwhfUTpygaql1YPWK3b/jmKBd7U46vmLUziG+Y8+1zB3Mam+XtBr+9ab6LT6flv1VKCx/xS5xs6UrhrKlnyHtMJqoN/UV5BZMYhaqUzftqpJUEsyuCf8sAWvib/Slg35z9nHVbOEqsju+UmyUVR86VhJYaB/Ps2PitWHnD++gOlu4xOyWClkMcpT60gpVD7rH1y4qCisbNXvNHmJPNeyot090xDhk6cPk+fN502alHwqJYGvfnLzBi0CWRxXFw9iEnAKy9AljSS8AXGSQEoUsY9L9OxQ1fTDigR8IzDyKPOvUQ+nZhY4/qBny4bogOjKHp4+23/NYbOqL7NYPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfwdzQttFvXbEfkB0ibnuQybLXwUsb424DOfsltqqy8=;
 b=oxTj0dKI2hHSt9Hi12N7W4ZQSNB99pjJgcxuKeqGmQs1UdI8f1ckj0+de+j1AQu/8PpmXYP/k4uQsXA+RONxU0/uYkybNJOlSe06CwL+HH36Lkz11X08IC+1RZa/OgACjQytNHqRVacunwjQF4l05rRPgeRLsogsulvoT8xJtJ3QI93q71cx5Clkq3QYRE0SKPhX3ALblQIkpaxlogOxPmsoZtbunvsZ3QiF2S6ATMlz4WCNDNGWlJxXc5BdMV+YO6cVbFWr+Qhi5hKNpD4VD9HyF+Tw0pbIQw6FfLuU6a//oXq9dH4SWusJ7SjKojXbYOUPQMVQXdzzv+1f2kYe1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.34; Mon, 7 Jul
 2025 08:02:50 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 08:02:50 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [char-misc-next v2] mei: bus: fix device leak
Thread-Topic: [char-misc-next v2] mei: bus: fix device leak
Thread-Index: AQHb5PnBD41lwh8Xa0K5qwLV+EJSerQYgVYAgAMMHgCAAAnvAIAAAS9ggAAZ14CACp7vEIAAC0SAgAAB7vA=
Date: Mon, 7 Jul 2025 08:02:50 +0000
Message-ID: <CY5PR11MB63666ED02DF650185911490CED4FA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250624110520.1403597-1-alexander.usyskin@intel.com>
 <2025062836-twentieth-kudos-1148@gregkh>
 <CY5PR11MB63664DE1B93F480CCC199D8FED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025063022-riverbed-country-5c2b@gregkh>
 <CY5PR11MB6366BBFF44C7F21C24292590ED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025063042-usual-acutely-0d3b@gregkh>
 <CY5PR11MB636694A9C7A086AF584B7CDDED4FA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025070710-civil-laborious-ad3c@gregkh>
In-Reply-To: <2025070710-civil-laborious-ad3c@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB6929:EE_
x-ms-office365-filtering-correlation-id: ca1b39f7-a464-4fa3-4dd3-08ddbd2cab50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L0NmYjZISDZCRitrZi95YlRwRTZTM3NYZXZSc2Y4SHloM3ZUbm13VkhvNG5Y?=
 =?utf-8?B?WGJTN1c3RGtydXFub0g0SEJRbzk2dHNZWGczeTJaRWszVUlveWk2ZElYUEtT?=
 =?utf-8?B?MFh4N3hKZmNVTE1iQ3dhd2NheERTS0tRZ2dsanFZcU9wdytQalFqZlQxdENi?=
 =?utf-8?B?NlVkMVBJdit0ZGF0aEJoc3ZRVXp3MzBUR3NkYVF1ZjVjcTljUkRNWjZxdlla?=
 =?utf-8?B?Tnk3dDNVTkNLcTdST1FaQlV1dGhMRmQ4TEJ1c3dEaWs1MDBBeDBTMDR6NE1C?=
 =?utf-8?B?dVpMOUNoQUNCeUpRWXBnMlJpMnUrQ0xCcEpEa2xRVWdnaFBrWWRWazdEUEF4?=
 =?utf-8?B?bThSRktQVXA4QXlDMXdNUjJ0dHFlNTd6SkZHdDlCT2RWa3ZZdVBuRlVYb0pn?=
 =?utf-8?B?dEFuNzgxbVZjZGJPRkJaU2FpWnN6Umdlc3NSa04wYUhXaTRJRWlxaGd3VXB6?=
 =?utf-8?B?THB2eThDaFNrUkhvVEVoQ0g2UmxFT21zaEhQR0srUm9aS1QvbXJyS2IveXla?=
 =?utf-8?B?VEZxRVN3ZzByQUxvS2NSN3ZPc2hmY2lRV1FJdm9PeGFJbGZSZWdvR1dpclls?=
 =?utf-8?B?Vm1HUG0rdEFsYUs2NFYxUkk1OXBDbnFPQmlMMnkwKzN0VjVLWDArdGVjNVAy?=
 =?utf-8?B?bmVKMnhRblRqampML1hodW9lSmlRVDYrR1YvM0JuNGRycXk3QmhjcXpmYmVU?=
 =?utf-8?B?bTF6V0RBQ0ljMGU4MTNzelZCa0pBMzJyQlpNVVIzMU1kR0ErRTRyQkVlbVl3?=
 =?utf-8?B?VStmNWdsZ2NNYnE4Z0JUZEw3d0RZUHhWcW1UcDhaQkc2YjhEaW9DWGhkOC9s?=
 =?utf-8?B?bEgxQi9BRDdzSnYvanJ3eWc1cVhXWk9nZGVjbFpkc2RmZWdCcThKY0tScXNw?=
 =?utf-8?B?V1ZkSXlmcDl0NE1Lb1dUMnArRjF2VUhxWUkybUZVQ2g0TlNQOUNrZUFGVjYy?=
 =?utf-8?B?YzR6S2ROdmtOTzZNVk5KV1RLMk85eG9HMFJITi9SdHhhV09sWUpZVEpsaHRa?=
 =?utf-8?B?MlhLN1Y1NnFVL3l1WkJFWko5WkRuNzZmdkxQUzNoWFRnTDY1WXpGeldpTGpp?=
 =?utf-8?B?NkxWV093WFVPZG5wSDc1c09Kc0wydFYwenlVUkdBV3BEQytyN1kya0RBK2o2?=
 =?utf-8?B?T1pORXVHR0kvSklNUkxFRUo3WXVFODZMN0d5Q0RXUWdjdmdTd2txekVmRXNS?=
 =?utf-8?B?YTF2Ym54MHhhNnVaNWQ5Q25vdXRVWlFnZnZKV3BSYlNDMmF4VXdOdlJ0RFJB?=
 =?utf-8?B?ZzQzdTJROEI2Y0Fya1NwK25GdkJhWm1qMGxpcE9lODNZZk42RWhmVmNrRWxz?=
 =?utf-8?B?UEk0Qlo5UFFrLzVvc1Iyd0hEcndIalc0NjlHODNnUTA0ZTB5b3pwZEd5WWlL?=
 =?utf-8?B?S1pIYWNNNlViVGRJKy9QVk1BTkU4U0kwdTBaVG5kdjRmUGY5bm5IbThWUnJG?=
 =?utf-8?B?ZDdrSDl0SzBONU0xODgxVVBrVTNGSG1tWEh1OVRIZXRad1BSdmEraE9CS2Rt?=
 =?utf-8?B?ejZROHFyTEthNitObGdNU0lYRXpZQ01JUkNwN0VsK3pTVHo2SEZPTUx5c1dB?=
 =?utf-8?B?YXhvY3RaVUNqRFAxQjVBM3pjU1ZKMzJCakdIaEx0R3FsSGJwMzFWbkRHSXR2?=
 =?utf-8?B?QVNLbHlnVW03WFFaNDMreVBjekxhUHN5VEE1dEs3d2cvK0RpSWVERFEzZlo0?=
 =?utf-8?B?czBZc2ZlODVTdTRnbXdnNmVvUFBlU1VGbEpVMjNHWDZFNWZXMHpxZkFTVTBa?=
 =?utf-8?B?blh3enZ2djF3MW5xQVdWd3R4STV4WWg5RWtNeHlSTWh3ZGN3VzJrclkvbVpU?=
 =?utf-8?B?MTlLQ1pDTUhaSENEVzY3cVpldzJmWXNtQy9KRXJhckprLytKYjEvUjBDclZW?=
 =?utf-8?B?Ymk5MklXOFVIaFJTVWFWNS9GZWZSeTh6alZmYmdqVWhESFYvSnR3ejAzWlhu?=
 =?utf-8?B?emdrVUZmOFl0eXVrdTRzaG5wMmZhNFJwbzdMOXEyK05jZXBHRUgrNi9XOVp6?=
 =?utf-8?Q?7evVKz1efPNbXjCpY2pFM0w7ctrTvo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHFhRHV5WGNqRkphTk5DUGU3UURWOGFLNnQxVHAwcmN6VWwvRDBpVU5BVHl3?=
 =?utf-8?B?R29BMWlhRTVNSGNmcmx6NU9sdERjMkxtRW1FSzE1eFZnTGNMakV1eTY5RWdt?=
 =?utf-8?B?a0lLU2lqYUpndW9CcXJzVVBjdjRaUjNuR2FQVGxwK2VqQ25BbnlTM2l1WVpv?=
 =?utf-8?B?TDRtaDNxSHFSOHBFcmNQUzVFRFpnWWUya1k0TUFNTkw4djdYY010blNYTFFF?=
 =?utf-8?B?N1BzK0ljY2ZZdkttcHU0a3Z0azdqelpVcDlrN2R6KzBMeVR5anhycSthYmtk?=
 =?utf-8?B?Y2FWOHB6YStuWFV5NjNVMDBrWnBaZWJJbjlCNVNWczhuMkhWYVpXelZ2cUVS?=
 =?utf-8?B?UzUzcFRKZmZYV25md0dNVTlLa01HWGd6TzlpclFmeXpwaEdVZXRheTZMUXpF?=
 =?utf-8?B?emZoR0RtcTBjYlU5YXovVGtrT3dDa1Q2S2w4eExKNzRNbEVBZHl3bVVjSllU?=
 =?utf-8?B?blhPdW9CMmRqVHdpWFl5YUxVR1RZK3lHRDFEd0Y0WnE1LzlHU3NzSDlUWklN?=
 =?utf-8?B?SllZV2lGTnlaNU9uRWxYcnhGRHFWK0lOY1hVK05sV3dUS3o2UkJWaUlJWmN2?=
 =?utf-8?B?Rmt3N2JpTmhNTHZzdDhrOVU4clplZlIvb04wMHEvWjBKNFJXUXNBblJvYW51?=
 =?utf-8?B?bDhrUmY0Q0hZVGljNDdJRmQyRmFJQVB5MzE1N1IzRjE4b0dhWkthTDljYXkr?=
 =?utf-8?B?YWVEdzZGRzJMQWFBZnhsRDJEdEEvZ0o0eUg0bGtEYUxNYXhLNjUrcFdzS1Zu?=
 =?utf-8?B?dmh2ZGVuZlJ1QWE1VEg2aDRxdjhmZXVpVGtlWEx3U1hxVUdnWnNMRFFhK3hx?=
 =?utf-8?B?Vk9OQ1laUGZsNlpWK3NTUEdLVklQbGw5ckdjZmw5SXpCcTZtSUl6VnNFT0xo?=
 =?utf-8?B?Uk84bHZqQkYzU3BZOXloVEJIT1FLRnRidkxKTDBqSlh6NTJYaXJJeG5IRENJ?=
 =?utf-8?B?YmNDNEhrSWVnUzIwYmhNdytnMFpwSk14WWhaWWpFdWZKTlBLRHErcmhqL3BK?=
 =?utf-8?B?bFlvWTVKSk1LMERoWHRGNDBaNFhnalQwbitkSXRmVEo3Ujk5bm1DelU1VWJk?=
 =?utf-8?B?QVR5Snpjd1lPUU52VzByMVZXRzJQK3BtK2JYUzBDTnZlYSt2ZHBhdzZCKzFQ?=
 =?utf-8?B?aEo4UjBWSlZGcWRYUTZ6aGFZOW5xb1Myb3lXbjZ5bXpTcWVGVXNhcHd1NXR1?=
 =?utf-8?B?MlBVQVUzcTlFT05Uem91UXFsUzYvRmlyUGU1bXN3VEtpUW44WDI0aHpsTlRr?=
 =?utf-8?B?eU1iNlZhSTJGRDBSN0JyR080OTdPMmwxbER5MW9UOTBQd1JINkJ2aDVEYWF0?=
 =?utf-8?B?aUZPbm9jY2ppZXZqenI2TnA5eDVkaXYwdW56Vzg1VDB5djAxbGZwT0xXUkY1?=
 =?utf-8?B?Z01BclhWbXhSNHgrcnljQjdyeFFzNUZqTWVCOExSVVhaamZXNXo2ZXc0cXJY?=
 =?utf-8?B?SkVNTFpFOGNlZ050LzZqMTFJYnFudHpEcks0UThNa1dKZXR5c0VDMitDS2pO?=
 =?utf-8?B?Qm5TSXpUNkxrTFpxLzM0dGRUbm53ZldmcXMxVnpLNVk1MFBtdGlaellwT0FF?=
 =?utf-8?B?dGVTMGxFYldBd0d2VDRvS0YxUktoOXNHVFIzZXZ5azdscWRlcmxvS0NBL2Z3?=
 =?utf-8?B?YlJwUkllUzFqbDZGbk40a2FHMEtWb1hCcTlKdTZ6cXY5WkVZVTVSeDhmMXpw?=
 =?utf-8?B?YzlDVVdNMmtudzYvdlpZZmd5VDZNT0ZHL3JTck5KY2xjRlBvZFYxdDZxYXJi?=
 =?utf-8?B?bnY5NzRtdlE3Q0hjaFl6UzZiMk1td1pIdithQWlYTWgzWWJGUnlJcnlPWnB4?=
 =?utf-8?B?RUZIYnV1eWFpTWRWaGhOajBFSUpENWhlWllkWVdLT3BmVDk1NDJnZVFYcy9s?=
 =?utf-8?B?NzNVWmh0ZDBwVlBqNWs5RWUrTDVUR2tobm1Xd1p2cERYZTJoT3Zxdk5WNkQ4?=
 =?utf-8?B?WXdoWUkwdDd4Tk9aZlZwcVhzRzhnUWRGTERoSjh1bmVrenZ6NEs5eGJ6RzZi?=
 =?utf-8?B?T2ZseFNML2NRRUFFQjU4WkI2VGxkaUlxNG9kSzBRaGhmUnl1WHJDTkdRVytI?=
 =?utf-8?B?aklicWZGSmhndHd4TWRsQmRTV3JrV0RRdlRjN0JMemduZ2gzNTd5U2lCbXUr?=
 =?utf-8?Q?59JA4n/Wzm6m/kEAtcKpB0mH3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1b39f7-a464-4fa3-4dd3-08ddbd2cab50
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 08:02:50.6517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJ9MAXMRj+KItPwl7OoUpIW9Nt35cGZOKcKB3RE8wdWkONlRXpFbwDnTD0/VKmxpQ1Vpz++7raVf6qmnX4mnuzfZgg0K5ZQifM3s9Mib0WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0IHYyXSBtZWk6IGJ1czogZml4IGRldmljZSBs
ZWFrDQo+IA0KPiBPbiBNb24sIEp1bCAwNywgMjAyNSBhdCAwNzowODozM0FNICswMDAwLCBVc3lz
a2luLCBBbGV4YW5kZXIgd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0
IHYyXSBtZWk6IGJ1czogZml4IGRldmljZSBsZWFrDQo+ID4gPg0KPiA+ID4gT24gTW9uLCBKdW4g
MzAsIDIwMjUgYXQgMTE6Mjc6MTRBTSArMDAwMCwgVXN5c2tpbiwgQWxleGFuZGVyIHdyb3RlOg0K
PiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbY2hhci1taXNjLW5leHQgdjJdIG1laTogYnVzOiBmaXgg
ZGV2aWNlIGxlYWsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIE1vbiwgSnVuIDMwLCAyMDI1IGF0
IDEwOjUyOjA4QU0gKzAwMDAsIFVzeXNraW4sIEFsZXhhbmRlcg0KPiB3cm90ZToNCj4gPiA+ID4g
PiA+ID4gU3ViamVjdDogUmU6IFtjaGFyLW1pc2MtbmV4dCB2Ml0gbWVpOiBidXM6IGZpeCBkZXZp
Y2UgbGVhaw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBPbiBUdWUsIEp1biAyNCwgMjAy
NSBhdCAwMjowNToyMFBNICswMzAwLCBBbGV4YW5kZXIgVXN5c2tpbg0KPiB3cm90ZToNCj4gPiA+
ID4gPiA+ID4gPiBUaGUgYnVzIHJlc2NhbiBmdW5jdGlvbiBjcmVhdGVzIGJ1cyBkZXZpY2VzIGZv
ciBhbGwgY2xpZW50cy4NCj4gPiA+ID4gPiA+ID4gPiBUaGUgZml4dXAgcm91dGluZSBpcyBleGVj
dXRlZCBvbiBhbGwgZGV2aWNlcywgdW5uZWVkZWQNCj4gPiA+ID4gPiA+ID4gPiBkZXZpY2VzIGFy
ZSByZW1vdmVkIGFuZCBmdWxseSBpbml0aWFsaXplZCBvbmNlIHNldA0KPiA+ID4gPiA+ID4gPiA+
IGlzX2FkZGVkIGZsYWcgdG8gMS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSSBkb24n
dCB1bmRlcnN0YW5kIHdoeSB0aGUgbWVpIGJ1cyBpcyBzbyBzcGVjaWFsIHRoYXQgaXQgaGFzIHRv
IGhhdmUNCj4gPiA+ID4gPiA+ID4gdGhpcyB0eXBlIG9mIGZsYWcsIHdoZW4gbm8gb3RoZXIgYnVz
IGhhcyB0aGF0IGZvciBpdHMgZGV2aWNlcy4gIFRoZSBidXMNCj4gPiA+ID4gPiA+ID4gY29kZSBz
aG91bGQga25vdyBpZiB0aGUgZGV2aWNlIGhhcyBiZWVuIHByb3Blcmx5IGFkZGVkIG9yIG5vdCwg
aWYNCj4gbm90LA0KPiA+ID4gPiA+ID4gPiB0aGVuIG5vIHJlbGVhc2UgZnVuY3Rpb24gY2FuIGJl
IGNhbGxlZCBhbmQgdGhlIHN0cnVjdHVyZSBpc24ndCBldmVuDQo+ID4gPiA+ID4gPiA+IHZpYWJs
ZSB0byBiZSB1c2VkIG9yIHRvdWNoZWQgYXQgYWxsLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiBTbyB3aHkgaXMgdGhpcyBuZWVkZWQ/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSXQg
c2VlbXMgdGhhdCBpc19hZGRlZCBjYW4gYmUgcmVwbGFjZWQgYnkgZGV2aWNlX2lzX3JlZ2lzdGVy
ZWQoKS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFnYWluLCB3aHkgZG8geW91IG5lZWQgdG8gdHJh
Y2sgdGhhdD8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEJ1dCB5ZXMsIHRoYXQgc2hvdWxkIHdvcmss
IGFsdGhvdWdoIHVzaW5nIGl0IGlzIHVzdWFsbHkgYSBzaWduIHRoYXQNCj4gPiA+ID4gPiBzb21l
dGhpbmcgaXMgYSBiaXQgYnJva2VuIGluIHRoZSBkZXNpZ24uDQo+ID4gPiA+ID4NCj4gPiA+ID4N
Cj4gPiA+ID4gTWVpIGJ1cyB1c2VzIGRldmljZV9pbml0aWFsaXplKCkgYW5kIGRldmljZV9hZGQo
KSBwYWlyLg0KPiA+ID4gPiBBZnRlciBkZXZpY2VfaW5pdGlhbGl6ZSgpIHRoZXJlIGFyZSBkaWZm
ZXJlbnQgaG9va3MgYW5kIGZpbHRlcnMgY2FsbGVkLA0KPiA+ID4gPiB0aGF0IG1heSBsZWFkIHRv
IGRyb3BwaW5nIHRoZSBkZXZpY2Ugb3IgYWRkaW5nIHdpdGggZGV2aWNlX2FkZCgpLg0KPiA+ID4g
PiBUaHVzLCB3ZSBzaG91bGQgdHJhY2sgaWYgZGV2aWNlX2FkZCgpIGlzIGNhbGxlZCB3aGVuIGRl
c3Ryb3lpbmcgdGhlDQo+IGRldmljZS4NCj4gPiA+ID4gTm90IHN1cmUgaWYgdGhpcyBjYW4gYmUg
cmUtYXJjaGl0ZWN0ZWQgdG8gdXNlIGRldmljZV9yZWdpc3RlcigpLg0KPiA+ID4NCj4gPiA+IFlv
dSBkb24ndCBuZWVkIHRvIHVzZSBkZXZpY2VfcmVnaXN0ZXIoKSBidXQgcGVyaGFwcyBzdG9wIGl0
IHdpdGggdGhlDQo+ID4gPiAicmVzY2FuIHRoZSBidXMgYW5kIGF0dGVtcHQgdG8gYWRkIGFsbCBk
ZXZpY2VzIGFnYWluIiBsb2dpYyB0aGF0IGlzIGluDQo+ID4gPiBtZWlfY2xfYnVzX3Jlc2Nhbigp
PyAgVGhlcmUncyBubyBuZWVkIHRvIGNhbGwgZGV2aWNlX2FkZCgpIG9uIGEgZGV2aWNlDQo+ID4g
PiBhbmQgdGhlbiB3YXkgbGF0ZXIgYXR0ZW1wdCB0byBpbml0aWFsaXplIGl0LCByaWdodD8NCj4g
PiA+DQo+ID4gPiBKdXN0IGZpbmQgYW55IG5ldyBkZXZpY2VzIHRoYXQgeW91IGRvbid0IGFscmVh
ZHkgaGF2ZSBvbiB5b3VyIGxpc3Qgb2YNCj4gPiA+IHJlZ2lzdGVyZWQgZGV2aWNlcywgYW5kIHRo
ZW4gb25seSBhZGQvaW5pdGlhbGl6ZSB0aGVtLCBzaG91bGQgYmUgYSBsb3QNCj4gPiA+IHNpbXBs
ZXIgbG9naWMgb3ZlcmFsbCB0aGFuIHdoYXQgdGhlIGNvZGUgaXMgY3VycmVudGx5IGRvaW5nLg0K
PiA+ID4NCj4gPiA+IGdyZWcgay1oDQo+ID4NCj4gPiBUaGlzIHdpbGwgcmVxdWlyZSBhIGJpZyBy
ZWZhY3RvcmluZy4gSSdsbCBsb29rIGhvdyB0aGF0IGNhbiBiZSBkb25lLg0KPiA+IE1lYW53aGls
ZSBjYW4gdGhpcyBmaXggYmUgbWVyZ2VkIG9uIGN1cnJlbnQgY29kZWJhc2UgYW5kDQo+ID4gcmVm
YWN0b3Jpbmcgd2lsbCBiZSBkb25lIHNlcGFyYXRlbHk/DQo+IA0KPiBXaHkgbm90IGRvIGl0IHBy
b3Blcmx5IGp1c3Qgb25jZT8gIFdoYXQgaXMgdXJnZW50IGFib3V0IHRoaXMgcmFyZSBsZWFrDQo+
IG5vdz8NCj4gDQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgayAtaA0KDQpXYW50ZWQgdG8gY2xvc2Ug
dGhlIGdhcCBmb3IgbXkgcGVhY2Ugb2YgbWluZC4NCkl0IG1heSBsZWFkIGZvciBwYXJlbnQgZGV2
aWNlIG5vdCBiZWVuIHJlbGVhc2VkIHdpdGggbWVpIGxpZmV0aW1lIHJld3JpdGUuDQpXaWxsIHB1
dCBpdCBhc2lkZSBpZiB5b3Ugc2F5IHNvLg0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoNCg==
