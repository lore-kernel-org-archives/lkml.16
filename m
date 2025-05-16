Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1351ADC83;
	Fri, 16 May 2025 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747411492; cv=fail; b=OJ0uEUVZ2iBCxzNf0hYarOrPaEX4AXSsEoFBs05XrjPLONcXD/LFqi1ZBmF4b1bBATs6Q+tAsKdPyYn14lYn/Y5W5o6bHmwm8oCmSVt6cji08Fmqb1bVv1n6dg5pDTPKDYfOB3hUB7iTn0o7CaHAPI0tEdIGMinauWy4mvm1P3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747411492; c=relaxed/simple;
	bh=rdF1XzYvgMs1fprUshkKI09SnNi9gh3AvqadM/BglpQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oJuS0SNjEZPAbS34Wtpe6Zjd7y912PjnGCnZZ8IfcWXcyQ2rX1d+m//JTP6KyoUtcjeJ0N5w9eeRvrEZc6ddMJup9uTXs9NK+g0WoiqhlrLINXSRJLYdwi6kXY5lPsDqwcngWrD6FZt98MBhGk5Ryv6jg9Prbo4RGLO3aHFC4vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlOFOhIs; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlOFOhIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747411490; x=1778947490;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rdF1XzYvgMs1fprUshkKI09SnNi9gh3AvqadM/BglpQ=;
  b=DlOFOhIssVlpwTr0qQQIIXlGCMwP5vH+oXXZq6SfLDO1DrzxWtySQWfw
   J9Jt25aTk5mTv/+eZvWRfboqI1d5SqWNmchQe9b47DGhmfh9+qO5osJw4
   uyY+AvhwUgX1ftD9DPgNp63MEzrW1J9cS/uDKgsh1xZX8ixW9bzgkvHDa
   ZBr7LWCE3bkY/fuaZPIL4UEmp/CkukTmbOlAANCrrvtNvySPEzVayjhLH
   HYG7LMd15FzkGm+bcPxHpFW0WrFjTxuJtYoL8yio1aLSOfMzjlrPZQO7Z
   YBFBGRHhZslXOciJ2fbUolbYC3uRrLh6eRbbkPME/mI8fqSBKEJ8J3BaK
   w==;
X-CSE-ConnectionGUID: Wrs9Qh2wSTOELAZONjjB0g==
X-CSE-MsgGUID: K+BNtXTnTaune/S2DAewlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49530229"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49530229"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 09:04:49 -0700
X-CSE-ConnectionGUID: v5uxY7QGRdC2UzNpugNzEg==
X-CSE-MsgGUID: pIPuCq2XTlihDRoyyKWevg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="175860115"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 09:04:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 09:04:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 09:04:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 09:04:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAX08A1pOU2qNjp3xNpyL9inI7cXXw5aIst+Wzyi9BAniNTDw/7NtFRPinVeXpXHS+PvinLd5YRNqvEzJLCLWsXLn9WYYi0g0nOnjLgR9GfUY6VOf7wMTKB7Z8s6k/bSmwT76jKyQ25rqAuNZVfmQalbyVbA23+k0u9eAuK14DmKGq2AqmpTJn2YUS0suOs79ultKxxmSCbcWWD60TyzNy/bnKmyfqjyXjCwVUpWRiDVJLBN+KqDJyL5p19cVnbLeLMrGVD5OjtZvEOPr35oqvldgE/YiodZhcKOnylZfOWrVO4RW1Pogjz078VY5ThgFoMLXm6tD9K8GBNX3/nlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdF1XzYvgMs1fprUshkKI09SnNi9gh3AvqadM/BglpQ=;
 b=YnfmMbJwj5h31v+PhqgejvJPr6lZDl/H4vhKI6egy13KTgDuS/9EdLBHXxGaCy4qm8kuuQ5YaleFFWejXnUPgEhBlH6TG0EFZVO1x2z/OrEM/XDPQU+Eb64YCf4tzT1SWX9WHADTF03YSxcTvgGvDs7iCqLrEgw7kpjQQVodC7R0P+pQQG8Paz2gyEK6bsbiIlKr3BbvGK7L/2Atp0wv/whgAv03e4X2RR5UE0ssOaXkAigrjDoqatLQ8TwPyJ5lE6MrTehVAbnbpy0CN5nhtdlGgFjS+0t6HH6OoG3kBz94fs6Fn9qDgGNcSbB3DuYcaewQ+33AUus7ys19zC0cKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Fri, 16 May
 2025 16:04:16 +0000
Received: from IA1PR11MB6267.namprd11.prod.outlook.com
 ([fe80::30b6:4b51:6cde:faa9]) by IA1PR11MB6267.namprd11.prod.outlook.com
 ([fe80::30b6:4b51:6cde:faa9%5]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 16:04:16 +0000
From: "Brandt, Todd E" <todd.e.brandt@intel.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "xi.pardee@linux.intel.com" <xi.pardee@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/intel/pmc Fix Arrow Lake U/H support to
 intel_pmc_core driver
Thread-Topic: [PATCH] platform/x86/intel/pmc Fix Arrow Lake U/H support to
 intel_pmc_core driver
Thread-Index: AQHbxgWzbGCMJZdozkqdaIs1djNzgLPVIroAgABJkoA=
Date: Fri, 16 May 2025 16:04:16 +0000
Message-ID: <3897079803884d99025833dd4e4760a61693b644.camel@intel.com>
References: <3492e00e6e343d03e28bc58c4365b282e71e786d.1747360275.git.todd.e.brandt@intel.com>
	 <faee2ba9-dfb5-a4c4-77b0-7291400e0ad6@linux.intel.com>
In-Reply-To: <faee2ba9-dfb5-a4c4-77b0-7291400e0ad6@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6267:EE_|MN0PR11MB6183:EE_
x-ms-office365-filtering-correlation-id: 092d95e7-cb9d-4dec-42ab-08dd94934f26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NkFJamMzTkNhOHFrM2VWZ01DVlFGZG9GdDdCM3pWNlk1bXFRL05oR3luamNV?=
 =?utf-8?B?VnhDTDc3NHpXVFd6V1N0b0NjYWlZc3BaaUh3TmVFcXc0NkovM0NLRUVoWE5I?=
 =?utf-8?B?aHlGcWtTWWcrUWtRQmdnSjI0ZjJpd1cxS2c3b2N3dkFWbEtyRVkvOFhJaUZ4?=
 =?utf-8?B?N1ZCNGtuKzZkN2RtNUlSbFd2RGtBTDN5QWdyUFhwTmhRZEFiQXljaEtobHFy?=
 =?utf-8?B?YmFIaTQ1Nm8rbFMxS3Q5NWl3NzhQVFloSnFqcEV6L2NOUFQ5RjNQL1pQU0lN?=
 =?utf-8?B?QU5zY3dSbGdIQ1lhTC9tdzBlUE92RkJvRldVTU1Ibm05aVlxK1BXSnEwTGVt?=
 =?utf-8?B?YzN4TXA5cjAydlduazk2RjhZNDIveTkyaTcvSDhDMTFYTktvbldySFBVVkdh?=
 =?utf-8?B?Mk9KNjBJU3owSmpBdXh5ZWNHa3lWVDlMT1lHd0JPekVwM2hiMjdlZTRiT2N4?=
 =?utf-8?B?QWNOYkFGT1AxSnM4T3loS3VqMVN1SW1XMGRMUmJIZ2VLMmQ5WFBud3BNODAw?=
 =?utf-8?B?U1I5SFVFdjBlWDc0VU1yQnByQnJ2clc4ZnVWbHhrQmVVdGpjYkd4Q1htTTQy?=
 =?utf-8?B?eHpYdDVualZ6M2tKQWRhM3d2MGx1MXNKMFZaSXBDdFdMQytqYlBSUFduSnFM?=
 =?utf-8?B?VDBaTkxUcEd2TDFqUVIyM3VGMnNzdUlzVEhlUjF5Q2ZqbzRGaWhicnQrUTll?=
 =?utf-8?B?amlVbVIyOHF0ajZxUFpmdGtEYU9RQ2tTMWtydEtXSW43cmRYMXhOSG9nVWcv?=
 =?utf-8?B?WnJwa1QrYTY1ZmlXUS8xR3NNaTIxN0ZSMUtTdEZRemhQaHpRaGtNaFg2RjJJ?=
 =?utf-8?B?Z2IrbXpqcFlQUi9sL01JYlpGTHoxbEM4OXZnSnkyQUNVemx5TFJCUlg5aDl0?=
 =?utf-8?B?MmJMY1hqbldsajluT3hVZDc1Slk3ZjJLSE4zMnlvUGhPTjBKZlZyaW1aZXJh?=
 =?utf-8?B?ZFRJMER1VUQ4c3V3UWZEeDJab0hraDljeE9mQmlSVVRXcXh2T0hHS05Rb29S?=
 =?utf-8?B?a1lTckMramZod1J6VDB1YnFnbzZ2R1dJeWhiRHkwWk90QzdnZUU0OVFLVWQx?=
 =?utf-8?B?QkcvbC9IdGZjKzVYTGV2VzRZVS90SHNsM3dnME4zZ2UrWVhTUkgySjZITXFS?=
 =?utf-8?B?Yi9IY0YxWXV0b043bmdTTW1kQ1pBVWM1d2owTDQ1Mm81ZlVRZTNiV0dwVU9T?=
 =?utf-8?B?TElKallTVUtMVzVOWkZaM3BhWGp1a2FpN0NGQWNOcjg0NkZZUGRtU05PRU43?=
 =?utf-8?B?RU85OFBSWnR6S1BXVzhOd0ozV3hBU0VTNE1jbmljWHQzTzl2bFA1Vm5MRWcv?=
 =?utf-8?B?cWlDc3Y4TGRkSS8xa0s5OXo3dnVTY2pmTXhQSTlteDR5eDFuWHBxRlJDMmVh?=
 =?utf-8?B?K3VLOEcvQVhNNFZyUGs2WjNKVDk3RjIzNVIrL1hMSEM3TDE0bHpVbVloUDJl?=
 =?utf-8?B?RzFZRGFYQmJtMjFOMXNDOXM1Wm0rUGNMbXhyUHlCN2lNQW1tQ0IzeXdVbGpJ?=
 =?utf-8?B?WmQweitJcktHWUJtVkJVWE84NWlNS1RoaFNlVHdMczUrZmRsemZmQURMTkRv?=
 =?utf-8?B?SWpvMXdsZ0lZQUNtYVNTbzRBOGRiK01hVm5NVldRa3VVaGZuV3hTK1d3N0Vx?=
 =?utf-8?B?dm1vQnFkWE9HN1ZnTGZRM3ZIcSt5TlJ6M3AxTFVMZkpsVkp2eUVsaHRoQThh?=
 =?utf-8?B?YS9BOWRvbGRGdm1MT1ZJNElWS09NYXp1MjNudlRvWXJFYTBjL2ppUXU1ekdO?=
 =?utf-8?B?c3l1ZVI0M0xLcWRGSnFMcWdicmZEeGEwbTZ4QTh5b3EzdkMrK1JRV0c2MG5W?=
 =?utf-8?B?dDF1VW5OK1VUSGJwbDVIY1RpQzlWdFk3Y0gxc0VMQnBueHBFckpHbGpZYkMy?=
 =?utf-8?B?TkZidUdDZWdlZk0yUDJlUmlMbFd5djk0M2w0ZjJkc2M3aEZGeWJMQ0ZtdUlT?=
 =?utf-8?B?eUFIVExDNWsvZEx2R1U0VlQwR3pKNjh2L045MExkRENqZ3JtdWV2UHlLbHZa?=
 =?utf-8?B?UHhiV3plVDFBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6267.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmthRXZJQUdsMVBSd1Y2aHlPZTdqenIwc3puT3JzVzZUOEVqUXU0TVhVRWxB?=
 =?utf-8?B?RUhUV1VvSjd4a2s3dWhBazZBcVJwNTh6RkZpU2lTSUFSY0IyZEwvVWJ3UEZS?=
 =?utf-8?B?VU9KWTgyS2NaMHkrR0d4T0tQanAxN1RaRUdyWXZrajlVOWVyN3JSQjMzRlVJ?=
 =?utf-8?B?WGhlbWcxWUJlbkUwSnlxbWRHdWw0Z1JYSlBTSVc2c002ZHJUSUhwRFZqa25B?=
 =?utf-8?B?QkN2Tmx6MFJ5RzBuNGJTbThSRWt0dnA5NW1qMk1Bd2xVa3lpRnZRR0RieWRi?=
 =?utf-8?B?bW5QcW9icGZOU1NZRFFnd21KMTM4NDZjVUZIeVdJMDArdE9KUVRRc09wV2E5?=
 =?utf-8?B?YUZFdm81Nzd4ZVdSdXJwV3RBSTA0UUU1YkRWMGMrYlYxNGttSDY3QzZPU29k?=
 =?utf-8?B?T2FrQ2VKL3V3Ykh3TnN2VmJSYUhrSVY5dDNXa1VMdndXdEo1MlNUd2JyTVor?=
 =?utf-8?B?akhpNXJrSTFtTjNvcGdtWU5sR1NnSkNBRzFpRmRLT2xNMEdKYm83MlNCalNY?=
 =?utf-8?B?Q1FHRndaZmkvYVFZU3NMdEpjclE0MmRmVzUvNEk0dVNsTFllT1YyNmVFcm03?=
 =?utf-8?B?bnpwckNYMVVZMmZ1WlRwT2FDYjhiZDBKK0NpME52RDg2VGNXRGFGZlBEcURL?=
 =?utf-8?B?VzZoNUt0Z29ERzBGVEpHT2xuNXcweUM1bWJEVEE4ckVEOHF4RUo4bUdaNEg5?=
 =?utf-8?B?SEpQRTFIQlJ0RkdtREhuTHhkbEU1Zk1EU2pBYmVONncvQnY5Q0h2ekQxUzRG?=
 =?utf-8?B?d2RvSENCODhZVEpzelNRKzRnbUZhcjB1SVlnRm9hTTJlTXJzVktSSHg4SStP?=
 =?utf-8?B?REpodkJMaTlnSkdTOHAvUDVBbUJTSm1DQThvVWhydjlGd1BTK0Z0a0ZkVDZy?=
 =?utf-8?B?MWEvenBVVVpMV0NoeENzbWc0QzVCZGFiK2JDWDViUi9ETkpLK3VrTFgrd3pH?=
 =?utf-8?B?MzFUeTQxaVpCQm13Sm8xVVRua0Zpbk4wdkEyUGtWa1lTVUpvMmlNd0VuYmtv?=
 =?utf-8?B?dVpuL3VqaDhwVEpteEhoTkp6QWRQU2tRN00zT0dISEhGQjljZFd6WmhOeU82?=
 =?utf-8?B?ck5Ta1Y3L1o1ZXRqN3Rud2dCd09SOFY3bW1EZzVnb0pmTGwzRVFYSVM2MEY3?=
 =?utf-8?B?Rkh4OWMvcW9FVXJwKzVhTUJIMTZnWFJ3TmdGZmlBdDRYVGVuNnY5Z0FQcGJN?=
 =?utf-8?B?eHZWVFVXdXJwbTJMSGhzcTNkS3pCVWRlUkcwbjVuTk9VNklUdHJacGtPSy9W?=
 =?utf-8?B?b0ZtUUZNUlRkRDhDWEQzdnpuMW9yTGdwK0VMd0gxZHJGR2k3VEwwNWVxOUdS?=
 =?utf-8?B?RHFXUVRPQUxKRHAya1NmNWxCZUErSG9tcGd0dXh2WGJoVXJNYU4xaEdBN3Nu?=
 =?utf-8?B?anFJdFhGeEFPZyt3V1JoRjBjMHEwcGFNQ3JKU0drMFR0d3NNaGlwMWdSOWVy?=
 =?utf-8?B?TjBibmtaaUNucFZnVHdlVkRVTXV4REEvOW1YWHdOMVZHTUlqSmU0VjhhMFFF?=
 =?utf-8?B?UXBiSzdJeEJuUmJtZjVENzF1ZGppSkdtRENxTU9pdExkamdJYnU2Nzl6YW1y?=
 =?utf-8?B?WGVIVEhzMHhFdVpkVjBHT1RLVGJyZVJidjcwN0JyYXpnM3l0N0pRZFNpa0xk?=
 =?utf-8?B?RWJHRFMydWJ2SHg3ZVQzQllyUmZHTXFZRGYwbC9jd2FQWndHeXNvVE5jTlo5?=
 =?utf-8?B?NWs4a0xueXVCcjRCdTQ3QXFKNVdjRTNoT29UR1FuR2hVN2pqYjlOV0ljVTRx?=
 =?utf-8?B?RUFKLzRCdTF6MmVXTG9rOHFVTkl3RndpNXl2ZVpBdDVibHc3RUIxc2Qxa3pp?=
 =?utf-8?B?RDVOaHhHalhpaG5xR0c4bmZ6ZnQwTTl1aFdESlVnbFlxOTUwbUMweXhPOW9F?=
 =?utf-8?B?UGpTVGFLM0NSVHJzejk2RjZzczMzS1RTWEM4R0JiYXBoUFBxVzVJN1U2ZmJ5?=
 =?utf-8?B?Nmcza0hyK1JOZzFyWU1aRXNSNkl3L2NCamhUTzJMQ2orSWkrR09obE5VMGMw?=
 =?utf-8?B?UExmdThtTTVLcWVtdFYzaHd6WVBrWDE4cVhyeGt2U3p6eS9lZ0RkOGlwOWZk?=
 =?utf-8?B?UEdqV0VMdG4ya01meE00YlBRZjdOV0ZYbjBvWjZCMmRmSU8xby91TUQ1VUNR?=
 =?utf-8?B?ZHpYcTJoVVljbWs4a0ppYkhRMm14T0dmL3FKcmRJVWlLWFlqRytoS3ZKM0F0?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <924303CD8DAA4D4FA5872B84A7AE2C08@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6267.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092d95e7-cb9d-4dec-42ab-08dd94934f26
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 16:04:16.4947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D8XoOpjjFhC6HNC3QdbVsL5PV+GJlPBtHnIEZiuWx40HS6UEpABLMHlv3m4VnohZZZUsjolvTeLEHc8PGGU0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI1LTA1LTE2IGF0IDE0OjQwICswMzAwLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToN
Cj4gT24gVGh1LCAxNSBNYXkgMjAyNSwgVG9kZCBCcmFuZHQgd3JvdGU6DQo+IA0KPiA+IFRoZSBB
UkwgcmVxdWlyZXMgdGhhdCB0aGUgR01BIGFuZCBOUFUgZGV2aWNlcyBib3RoIGJlIGluIEQzSG90
IGluDQo+ID4gb3JkZXINCj4gPiBmb3IgUEMxMCBhbmQgUzBpWCB0byBiZSBhY2hpZXZlZCBpbiBT
MmlkbGUuIFRoZSBvcmlnaW5hbCBBUkwtSC9VDQo+ID4gYWRkaXRpb24NCj4gPiB0byB0aGUgaW50
ZWxfcG1jX2NvcmUgZHJpdmVyIGF0dGVtcHRlZCB0byBkbyB0aGlzIGJ5IHN3aXRjaGluZyB0aGVt
DQo+ID4gdG8gRDMNCj4gPiBpbiB0aGUgaW5pdCBhbmQgcmVzdW1lIGNhbGxzIG9mIHRoZSBpbnRl
bF9wbWNfY29yZSBkcml2ZXIuDQo+ID4gDQo+ID4gVGhlIHByb2JsZW0gaXMgdGhlIEFSTC1IL1Ug
aGF2ZSBhIGRpZmZlcmVudCBOUFUgZGV2aWNlIGFuZCB0aHVzIGFyZQ0KPiA+IG5vdA0KPiA+IGJl
aW5nIHByb3Blcmx5IHNldCBhbmQgdGh1cyBTMGlYIGRvZXMgbm90IHdvcmsgcHJvcGVybHkgaW4g
QVJMLUgvVS4NCj4gPiBUaGlzDQo+ID4gcGF0Y2ggY3JlYXRlcyBhIG5ldyBBUkwtSCBzcGVjaWZp
YyBkZXZpY2UgaWQgdGhhdCBpcyBjb3JyZWN0IGFuZA0KPiA+IGFsc28NCj4gPiBhZGRzIHRoZSBE
MyBmaXh1cCB0byB0aGUgc3VzcGVuZCBjYWxsYmFjay4gVGhpcyB3YXkgaWYgdGhlIFBDSQ0KPiA+
IGRldmllcw0KPiA+IGRyb3AgZnJvbSBEMyB0byBEMCBhZnRlciByZXN1bWUgdGhleSBjYW4gYmUg
Y29ycmVjdGVkIGZvciB0aGUgbmV4dA0KPiA+IHN1c3BlbmQuIFRodXMgdGhlcmUgaXMgbm8gZHJv
cG91dCBpbiBTMGlYLg0KPiA+IA0KPiANCj4gU2hvdWxkbid0IHRoaXMgaGF2ZSBhIEZpeGVzIHRh
Zz8NCg0KWWVzLCB5b3UncmUgcmlnaHQsIGxldCBtZSByZS1zZW5kIGl0LiANCg0KPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBUb2RkIEJyYW5kdCA8dG9kZC5lLmJyYW5kdEBpbnRlbC5jb20+DQo+ID4g
LS0tDQo+ID4gwqBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbWMvYXJsLmMgfCAxMiArKysr
KysrKysrLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRl
bC9wbWMvYXJsLmMNCj4gPiBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYy9hcmwuYw0K
PiA+IGluZGV4IDMyMDk5M2JkNmQzMS4uNTA1M2UzZGQ4ZjVlIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYy9hcmwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGxh
dGZvcm0veDg2L2ludGVsL3BtYy9hcmwuYw0KPiA+IEBAIC02ODEsNiArNjgxLDcgQEAgc3RhdGlj
IHN0cnVjdCBwbWNfaW5mbyBhcmxfcG1jX2luZm9fbGlzdFtdID0gew0KPiA+IMKgDQo+ID4gwqAj
ZGVmaW5lIEFSTF9OUFVfUENJX0RFVsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoDB4YWQxZA0KPiA+IMKgI2RlZmluZSBBUkxfR05BX1BDSV9ERVbCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweGFlNGMNCj4gPiArI2Rl
ZmluZSBBUkxfSF9OUFVfUENJX0RFVsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDdkMWQN
Cj4gPiDCoCNkZWZpbmUgQVJMX0hfR05BX1BDSV9ERVbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgMHg3NzRjDQo+ID4gwqAvKg0KPiA+IMKgICogU2V0IHBvd2VyIHN0YXRlIG9mIHNlbGVjdCBk
ZXZpY2VzIHRoYXQgZG8gbm90IGhhdmUgZHJpdmVycyB0bw0KPiA+IEQzDQo+ID4gQEAgLTY5NCw3
ICs2OTUsNyBAQCBzdGF0aWMgdm9pZCBhcmxfZDNfZml4dXAodm9pZCkNCj4gPiDCoA0KPiA+IMKg
c3RhdGljIHZvaWQgYXJsX2hfZDNfZml4dXAodm9pZCkNCj4gPiDCoHsNCj4gPiAtwqDCoMKgwqDC
oMKgwqBwbWNfY29yZV9zZXRfZGV2aWNlX2QzKEFSTF9OUFVfUENJX0RFVik7DQo+ID4gK8KgwqDC
oMKgwqDCoMKgcG1jX2NvcmVfc2V0X2RldmljZV9kMyhBUkxfSF9OUFVfUENJX0RFVik7DQo+ID4g
wqDCoMKgwqDCoMKgwqDCoHBtY19jb3JlX3NldF9kZXZpY2VfZDMoQVJMX0hfR05BX1BDSV9ERVYp
Ow0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gQEAgLTcwNSw2ICs3MDYsMTMgQEAgc3RhdGljIGludCBh
cmxfcmVzdW1lKHN0cnVjdCBwbWNfZGV2ICpwbWNkZXYpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiBjbmxfcmVzdW1lKHBtY2Rldik7DQo+ID4gwqB9DQo+ID4gwqANCj4gPiArc3RhdGljIHZv
aWQgYXJsX2hfc3VzcGVuZChzdHJ1Y3QgcG1jX2RldiAqcG1jZGV2KQ0KPiA+ICt7DQo+ID4gK8Kg
wqDCoMKgwqDCoMKgYXJsX2hfZDNfZml4dXAoKTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKg
Y25sX3N1c3BlbmQocG1jZGV2KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiDCoHN0YXRpYyBpbnQgYXJs
X2hfcmVzdW1lKHN0cnVjdCBwbWNfZGV2ICpwbWNkZXYpDQo+ID4gwqB7DQo+ID4gwqDCoMKgwqDC
oMKgwqDCoGFybF9oX2QzX2ZpeHVwKCk7DQo+ID4gQEAgLTczOSw3ICs3NDcsNyBAQCBzdHJ1Y3Qg
cG1jX2Rldl9pbmZvIGFybF9oX3BtY19kZXYgPSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoC5kbXVf
Z3VpZCA9IEFSTF9QTVRfRE1VX0dVSUQsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoC5yZWdtYXBfbGlz
dCA9IGFybF9wbWNfaW5mb19saXN0LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqAubWFwID0gJm10bF9z
b2NtX3JlZ19tYXAsDQo+ID4gLcKgwqDCoMKgwqDCoMKgLnN1c3BlbmQgPSBjbmxfc3VzcGVuZCwN
Cj4gPiArwqDCoMKgwqDCoMKgwqAuc3VzcGVuZCA9IGFybF9oX3N1c3BlbmQsDQo+ID4gwqDCoMKg
wqDCoMKgwqDCoC5yZXN1bWUgPSBhcmxfaF9yZXN1bWUsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoC5p
bml0ID0gYXJsX2hfY29yZV9pbml0LA0KPiA+IMKgfTsNCj4gPiANCj4gDQoNCg==
