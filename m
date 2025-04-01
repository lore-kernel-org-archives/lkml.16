Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4351D5141
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743485308; cv=fail; b=IDOahbLHdCOKxL7ZbwMHkyjMik+w3wzPqj0kYeJS6aYSVW2wgOsH/YfHqzs4eKvpods/pytmVd1F5eMPjtLIXlObAx5hGDAMVDYjjUGj31oRVhA+71Fl0OhQjFyIXMQT1MliH9uX4WkL1zoejx4KGeg63g12J7HVxtEV9SpOkPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743485308; c=relaxed/simple;
	bh=uIk9CTODE1P9FMJCYZBRwcOO/mf6DMi0GNiHqK6HyPU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AKcNW/n+qOBJCSWFKBPcfk/9BPVl7w79YvD6DJ4mTJigdK/J+kVYEvbfNqx7MBg/2nCi4J/xN8/Zz+HqP8hiE3wWBkomaxGv3BQhuhqWmpTw88P0m0Emnp7IWSOj0SAvhgXGTLCbKg77WqiJHf6KcPl97P/ZSBrYVwyrtEanlMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KN3lA9Ny; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KN3lA9Ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743485306; x=1775021306;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uIk9CTODE1P9FMJCYZBRwcOO/mf6DMi0GNiHqK6HyPU=;
  b=KN3lA9Ny+iWBWn5HeLCXYBn2j09m0RfMtF913IVPVbUA9XZHElSTv4ed
   XJxUIivAcX2QmKCzn9xQLZ9mIbzfMVBUsl/8PeYRWRAALZfK5rlQ7JXat
   0jsNQgKa9B3NP6EMoPsJCmVLjbpqmLNN8ayrco/LwCT21y9L0o9WH0cvE
   9XA2Dq5iy2O/qIxjefS9gYTHEmCUUBB8hPK8mn+c3NvI1YhrH+59MSBKk
   EheiFYMHp8RBzMVkWMKqorw6eymIcQz8RQUcWuyqhHuTAusgndNxkIlcK
   hGDooUv4Lj8pjjaKHCLZHz6yA/xWsBPJjt9wScXi5x/CFhYJX3U9BeqWr
   Q==;
X-CSE-ConnectionGUID: ahnKxxELRlmESnUUj/2tew==
X-CSE-MsgGUID: OC5TpTbyT4WKddaCPtoWrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48579397"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="48579397"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 22:28:25 -0700
X-CSE-ConnectionGUID: cu7J+j3NTJCCVW4kNGmY+Q==
X-CSE-MsgGUID: ym/w9KGKQqWuWbJ+qaW1VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="130401812"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 22:28:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 22:28:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 22:28:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:28:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5Xzoi72xrJ5UpAyFI4Q2uOg9R4+k/EHC34qmpb0Al+/ymr8iGoby8QT9NzzBC/bglnfFRu96LTxlfpV1SnYIxWwx09U8y2NZDo6AukP8j2IgsK+F4tOYFkl3j4n3pYppS4j9BfRUDZ/KVvk6VfffF5DS0lXqX1W2iG9w6GYc+HtfduvvAdW7Eq4PYYh4F0gpKcU7jb763qFT9letgQYm4WmPWLdrAkZXYsWP2SZpAX6FnYKf4BWQhzTSls+HBpKzvNMW9tums/Jv/+5+mOEIw+7U/l0Js8ABkHsJhiVnbA4p0IcoSlR8DfaYiQhUvBa5Fgh3uHoibiM0XonvdnDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzRWsj8CcSz/l2nD8plESMwcj6mZ921ulHhPkli2Eus=;
 b=IJbG1I309cQUsfmAc/8KCQvMrPnDdLTa+63OkZf9oIByk2xIEEMiaMshmeGGT6du98eZcLN8zeMBkNhQF2yWOCXMiTNE60x5C1T+LzxHnQLPn9+ChtVaTfc23XJ9hLXBdP0qEtxqpookS3vEE/xlxg5P66VR17qbRFqznlw8O7Wvu5WaV70XEI7J+vctmOFMQyNlF3zYbvDlx5buTV3DMUosScDa9/5AjHsJML2MZsbjW/DsHNgm+N0EAdPFS/dIqbvrcc8oEYY3tc7YIe/6Xp2faW1MeY5sDO2hRggenAfl6cz78kw6FjSbwhLqi8oDS2qZ9kgUW0KNf4KyBJsKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by IA3PR11MB9325.namprd11.prod.outlook.com (2603:10b6:208:571::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 05:28:22 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 05:28:22 +0000
Message-ID: <c042fc4c-061e-4cb5-af3b-0ad701850052@intel.com>
Date: Mon, 31 Mar 2025 22:28:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] x86/nmi: Fix comment in unknown NMI handling
Content-Language: en-US
To: "Huang, Kai" <kai.huang@intel.com>, "tglx@linutronix.de"
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
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-6-sohil.mehta@intel.com>
 <4e7937e946d94d5f62ff1a5f3b416f7d1eb2c71f.camel@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <4e7937e946d94d5f62ff1a5f3b416f7d1eb2c71f.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::18) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|IA3PR11MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5d0873-555f-4ec6-d8fa-08dd70de0481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTZpZHplTnBaSUlnbTdpNHdxbTR6VTJGKzRIWnBhV1VEc3JDSW51Ty9VM05w?=
 =?utf-8?B?NjRMbEMrYi9XTXZ0YXVCamYvREpreTBiWGdTczRGRkwwTktaVWtURDFsK3pO?=
 =?utf-8?B?Y0Q2NjhBNFBRak4vY2JqYm5oR0NWcWdDclBlTEVZYTc2dFRoTHpUUVlaMzZX?=
 =?utf-8?B?TUtEVzNGZ2d1SEszbzhibTYraXpFSnVQc0s4R0pOTW40Z1VpNHpFc1dLeWZa?=
 =?utf-8?B?ckFLdy85UkFHckZUV05JemNFQ0xId1hWOTk1WExNVURVeEozVThpWFhhMlhx?=
 =?utf-8?B?dUFZZXdWSzVMRHNQZitwbmtpZFIrVTR0MlBURWlpaWt1MFpOWG5TeW1FbDFk?=
 =?utf-8?B?UEJRc0xFdXNKb1lyNG1kN2Z0eXBiRGpnVWovbGgycE5GL1hDeHJaRnJtbVRj?=
 =?utf-8?B?TWUweXRqOE8xWHUyOVNyM3RRa21odGlrek9xSFVtei8wNTEybzMwbmRJRlZi?=
 =?utf-8?B?OFNHU1gzZElaRzIzcE5xUEdnOGhaaEdqYXErVE52VERUNi9WMVh5aDNwdklQ?=
 =?utf-8?B?WDIzMGZ2YXBHS2wrd0dMZzJ2c2piMjMxTkZQZFBSTkdobFI3bkErRkZ1aEUy?=
 =?utf-8?B?MGpab3FucForVGx4T2xIa1dmZENRVUVnMDR4QW5IWis0WGdGY25qbjdNa0o0?=
 =?utf-8?B?UWRJanBKek1GdDFGZHd2dHFxZDYybkRXVUZCZVBLVVJkMFdNRUFUckU1QVNG?=
 =?utf-8?B?YjVqT3dDTnBwS1VSenFSSjdxOHlKeldKTXQ1U2cvcVlDQlNMMEc1dThnZGwx?=
 =?utf-8?B?NUZ6QmFkejJ4YXBtZXpRNGNnMmtHaGFFak4rUGNPTGI0Mm5SWXJhRWJ1SEx0?=
 =?utf-8?B?QWtHWm52TDJvcGp2VjNubVdyYjdIUHpFYXVlWjFjNFNtdEJuUWg3K2JESVgv?=
 =?utf-8?B?eGV3blRBaVBtVFVTRzVydDRNVFZNQkxaUTA5Y01kRUhnY25qZTV3TmVFTWRM?=
 =?utf-8?B?WVNhR1EyVzFrQ3Q1N21XdHpneWFVL3Z6cmM4VkNoL01Db0hnRlFIY1lqb1dr?=
 =?utf-8?B?NTA3WHRhR2JsRVFGc3dXc2JTZzNjbVcyZFNzU2VzY0FSOGdCYXJJMmtnbkVP?=
 =?utf-8?B?ZlFwM3NIN0REbWJjcGJSUmhNY1EwN0dKbFVFVFUyc1hpdzVPeTFBVWZ3MS9C?=
 =?utf-8?B?anpCdmU2ajY5WGdMbjNHQW5UYmMzbXlDWEFLWG5OMk9GUFBKeWpTUk5aYklC?=
 =?utf-8?B?cDBhTDFSaENvWlcrMXRSSEdoZ0k0bGZhMzl1eVJWR0IvSlVwTmV5SHlyT3lD?=
 =?utf-8?B?WTVDZ3phTFVOUE1QMXV5RUxrUFNtSFk0QnpvSEwyTCtrWUJVbGQyRWlzWWZa?=
 =?utf-8?B?amVyaEx5Q3FmWi9QRUpGNnVqemV0YWEyMUxUc3M5RUhIK3c3NFBJejN0b1Ny?=
 =?utf-8?B?cWNYdEwwMUE3N0NmUVRydmczbVl1Qkxjb0FnbGFWcGpUZEVVcm4xUWlpVlBi?=
 =?utf-8?B?ZTF4OEtiV3lVbWFacENXQ2psWXUzRWI1NGFLVVBvOWpNVkd5UTNKWk45bFVs?=
 =?utf-8?B?Ukk1MEcxNEFYYUo4Y1QvZEx2cDg1ZHdMbzBDUWlCTU13Y0hlWVNkS2FMaWti?=
 =?utf-8?B?V0dnUUJPWjBrL1AzUGZ5UjBFMGVFcjBPZDJxWkFNU1A3NGZKN1R3ekNOSzJV?=
 =?utf-8?B?OHVuN3hseGY3ZnFEb1BYUXNnN2V6OGVnYy9EMC9JRTgwWVZqTzFOVXR3T1Q4?=
 =?utf-8?B?K0hSb0REU2ZTS28yZWVpdk02UGpWdGVqQlVTUTdZMlljcHpMUmpsZldwL0NI?=
 =?utf-8?B?UkZ1cG5YU2tlcEc0amJjVHhRM2NKdTlpN3JvTGZldlU5NExmSTNnSkdxdWha?=
 =?utf-8?B?K0hTSFdwNSt5UzEyVHRVcGlFd0loSnhpTEtiNUkzU3VUcmhMNHQ5TklxZ3lu?=
 =?utf-8?Q?7XOY9JlJtugYc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWZtZjZUTStTVXd2ME9LQjNJYjl3VWJ1bVFjVHlWbjF4ZjVRdEt2SmhNU283?=
 =?utf-8?B?M3U4NXQ1QjRpYnZiRmxyMHAwWUhIVFoyRFlCaFQ1NjNSbzJVS3pvYk1NOGI5?=
 =?utf-8?B?cGxhOGJoTTR1OFlyamVJZXpBUlJtdkVjbXAzWDFCTlZZZkRHWHZML0NMbWZF?=
 =?utf-8?B?TW5rR3l0dldrM0czNFBXWjFqTm9IRVY4VGZVUVFaVXErTjJXeGNYRWtwcTVa?=
 =?utf-8?B?WWxHbFRFN3BvZndpbldVTWhxaVoxYTBxTVY3NVRBejFrcm0rYnNiOEJUWjVq?=
 =?utf-8?B?MkFyWVMwYkhuUUZYdFpOcU1PeUJXUFBuYjBFL3k1M2thUHFnaytOT0dpb1Rn?=
 =?utf-8?B?cy9IVyt6ci90WkVqL1d6OEQ4YVluRlVPTXNlaDJpcWM4MDkyejF1SHMrbWI0?=
 =?utf-8?B?c0IyanhFYUd5S1dCM0xJeTdjbWZlaHBpd0VQY3AxRVY3L3QwU2JZRENZSkhJ?=
 =?utf-8?B?cXdhSmNGT2JzdTVyQlRzeDc2a0VMdTExamsvQ0IyY0R1cWx0UEttOG4yTXBB?=
 =?utf-8?B?TWg3Zmc0K05McFZVSytMbUVHcHoya0lqbWVWdzFQNGx4d1h2SkpvbmgzYU13?=
 =?utf-8?B?TEh2YWtLVkRvSTlucW9tK0FxQXhWMno4clpicTVJdHp0VGU3YUQwbU5wVUg0?=
 =?utf-8?B?Rm5JNW5WTEtUWk1XK3BlQlJiQmtpWGtIT1QyYXMrT3lUZDJGZWpjbTVBT2dm?=
 =?utf-8?B?Wm1IcHcwdEFQd0xrNGFXSUM0WTE0bFgyRi94N215VGZHYW4yb3cvV3RtSDdB?=
 =?utf-8?B?dHV1TmIxbk9jd1l0dkhhbm9OUGJrYjA5ZzBXQ2tBTy8rVlhRcTdnRTBRdE1B?=
 =?utf-8?B?YXh0bnFSV0REMHN1RFBmWUdNd2E3ZXpjR3ZlWTNxNHdZL2h1RWFXVy9XdW9L?=
 =?utf-8?B?ZnFMRHNwRCtQdlFXSGdyMEVXOHc0VlBxcThtVmlwbXhESE5aWmxTbFhseGJz?=
 =?utf-8?B?V1JKUitJU3FkbElWR3NnV0E1ZktkZ1pObkZDdE1KamRWdG5BejIvZTJqVzl1?=
 =?utf-8?B?ZVVNQTQxVlNic3VBZE1TQ1VsYU5lVlF0Q3AxWTVHbXhJcG1uYWZrT3ZzZ1dE?=
 =?utf-8?B?blZadzVwSDRBK3pWQWNLZlVWSGpTWEVIeGZxVXhSWFFKdGxTblRwOEtZT2FD?=
 =?utf-8?B?aXFIZ096OUFHeVN1Sys0bkt0a0wxNThnWHlxZGNRc2E5bE9TSTRCSFBLcVNv?=
 =?utf-8?B?ZFQ4aXYyanJSWEszazJQMWU0d05KQVFFMjJKbnc0TDBkeHVsdm01aWtqamtv?=
 =?utf-8?B?S3NWOGR0NFVieWpZV0NieG9rODZkbFdxRTlGZlFGZTk5R085WFNJYnc3a05n?=
 =?utf-8?B?SlhsM0diOHFab0lWQ2hrMnFHMng4Z2wzYTlEcjlFU2ZLb3lHVG4rNm9EV2JC?=
 =?utf-8?B?R2haZFFTc3VpRW1Qa0lVNjd1MUR1UzBrWi9kNy95M053TzR1TWlKRjNPVG5l?=
 =?utf-8?B?QXpyVVA2T3dWZUxqT1paVjdjckI2aWdUbENPTnUydnZVRjZqcEgzcVBsN1BN?=
 =?utf-8?B?bUFNekhON0kwcWZwNmRvT0RITnZ4cXNRdnFKQzhkQ1Nsci83U2lMT3B1MFk5?=
 =?utf-8?B?cWEvZURvK1doRytCWlBjeUNxWVkvSDcyMUsyQVNjc0V5LzZVYUxxcmNFZGpH?=
 =?utf-8?B?ZVExTEFXM0dWN3kzK3d6WVd5eHhSL1ViU2F0SnJvWFFYT0hEZGpyQ0tsZ3Az?=
 =?utf-8?B?dkhjSXJ0NGgxMkVPbExSQ1hwZFdEdVlzdlFNOUN3VTNIQlNtQlBkNVpoSHJV?=
 =?utf-8?B?OFlFWCtGR0VHOEtrOGtRSG1BZnJxRWt6RzZvS3VPMDF6SHFtY0xhbGVzSG15?=
 =?utf-8?B?TjlzQlE2d01IZHV5NXR4bDhVbVNqSGtmai9scktaTm94YkhOY1hPUzdoeDBu?=
 =?utf-8?B?dyttOXBOY0ZCNGhFU3kwbHI3RTJzNTdJRVlEaHFnRnZKN1dYaGlEZVNOb3pG?=
 =?utf-8?B?SXM1czhZVHZkWk1ORUROTU9NV1p4L0xWYkZ3NFpGazlYS2V5UG5wZzR1dUpU?=
 =?utf-8?B?eFBNRnFGKzk3S3E5dlFkakxINmYxcHhidytBSmNxeVdmdXVXUDZ5UjJBMlBq?=
 =?utf-8?B?ZkRjR20zUmFsZlh6dERlbVpjaGJhTVMrTkVUYWlXbjgwRThqK3JiWjhFcUxh?=
 =?utf-8?Q?34yNp+PBPt+y/S+Hc980QlI3C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5d0873-555f-4ec6-d8fa-08dd70de0481
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:28:21.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoGj0G53rJlTjGZg/eNRfphlF+aQCOAtjUjQ/KumgXmrxHhf9ANwajtwIRDMInAXqrhHXRBvDUWw+7V5ceGzgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9325
X-OriginatorOrg: intel.com

On 3/31/2025 5:17 PM, Huang, Kai wrote:
> On Thu, 2025-03-27 at 23:46 +0000, Mehta, Sohil wrote:
>> The comment in unknown NMI handling is incorrect and misleading. There
>> is no longer a restriction on having a single Unknown NMI handler. Also,
>> nmi_handle() does not use the 'b2b' parameter anymore.
>>
>> The changes that made the comment outdated are:
>>
>> commit 0d443b70cc92 ("x86/platform: Remove warning message for duplicate
>> NMI handlers")
>>
>> commit bf9f2ee28d47 ("x86/nmi: Remove the 'b2b' parameter from
>> nmi_handle()")
> 
> After some digging, IIUC, the 'b2b' parameter of the nmi_handle() was actually
> never used when it was originally added in the 
> 

You are right. The b2b parameter was never really used. The fixup patch
says the same thing as well.

	"x86/nmi: Remove the 'b2b' parameter from nmi_handle()

	It has never had any effect. Remove it for comprehensibility."



>   commit b227e23399dc ("x86, nmi: Add in logic to handle multiple events and
> unknown NMIs")
> 

It's probably okay even if we don't mention this directly in the
changelog. It is indirectly implied through the above fixup patch.

> .., so IIUC the comment was wrong when it was firstly added.  
> > The above commit to remove the 'b2b' seems just a fixup patch but it
didn't fix
> the comment.
> 

Yup, that's what I meant. The fixup patch should have fixed the comment
as well.

> Not sure whether it is worth to mention in the changelog.
> 

> 
> Anyway:
> 
> Reviewed-by: Kai Huang <kai.huang@intel.com>

Thanks!
