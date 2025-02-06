Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B818892D;
	Thu,  6 Feb 2025 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865075; cv=fail; b=CWiIn5VHpxmSQ5mulDyDwPlsfKFcTLWjkTfw5Z0zeHcDU6S8JL2Dp8LRrCEPdSD0hc1q8fkGeEg/1J98WFJGX0+yL75be1836QpB/+4kCwVmRIN0jKGN/3RzmtliMblR90zhaDvc+XFhMmHDeYKwazfQtHGkw3flh5cOYHC1Gk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865075; c=relaxed/simple;
	bh=T6dG0Uu7z4RnTWfKDCBnAPsRvadVmLmxL/9QJFqbFV4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i0t28tMt93V1C0LTf+Q2OHCOCp5tPS6gPIXYIl8CFHxJwqLI2kYJk+fd7oz9sOh5heO6JfTticWdspruu4vjdZjXv/yf4Y9tnOsshawTu7tC6E39xgANkRm6PNMZXfU8zQS8oxG3qPxGmYL5bvGzHCSjdmkpBYVUnSBSl7vFShE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0XtHRI9; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0XtHRI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738865074; x=1770401074;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T6dG0Uu7z4RnTWfKDCBnAPsRvadVmLmxL/9QJFqbFV4=;
  b=P0XtHRI9Jy/rb1aUlS2FLgZEh3wdSA1JMOIPVklXgXBYx+b1HdR58f8g
   JmCRGLwJBEFdEw9n0L7qk8G3CSVKeNtNswid2RW4W8QbVj+kWz56uXjyx
   6Gupj7V1rqgYJ0/+BMcxL+ZsclMXz+2fagkvAJdcE7w1xU+ZyTrY2mQ6K
   uZo1OIhGj7nsAkKyATrE/24YQZfdp7lh40dYQtIhQAOUjtW/Ot7171teU
   Hci0GyMKjcJZBpE5Besd+DxqUcxMkhAWFWdvccUkp6RtNU28IeFBZKwBq
   ccDBgkmlfHFDMRS1g4HWjHFAJje2vUr51Am5TSUR9lnR8HcMgPytKwQ1Q
   w==;
X-CSE-ConnectionGUID: w8hUu47VQqyJxhONzMzmeA==
X-CSE-MsgGUID: LhRw5Ig8SFmtSx26zCHE2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27090274"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="27090274"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:04:33 -0800
X-CSE-ConnectionGUID: Rs4Zm5HmQAKp4PGlOF/afQ==
X-CSE-MsgGUID: yT55EcFlSKq6IY9r3DWXDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116476923"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 10:04:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 10:04:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 10:04:32 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 10:04:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPT9wMk/SiU77qC0w7gJqykTYhhTpG8oH487QAmLD8NJwejZuNwUzDD+h8U+hwqpEcP5SGZhf3GcbGpzZxXupzpihnw2QR2wHnRDuCj7dLG7/XhWu8n7V7xzj1FK5S30irlg2EqNlmFomqLddoJiOCFmOl4LrqP2v2s2rZndVv4zkKFKzCQeEJ6+vhF5EVwl/KqDO68JI2lUfo9quRCqUzy45PAcO6RSvkwfRmHYp8E4E8//x+wUxuzLybSrsgApt/rRhjQS07CW/1ZGZnUKz6E/Wzs16/jPI4aoXIhJjPsRUPpkvtrzvvtHdJtguEJnkzH4m35wejTsrFhjADVkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZ4tcGx6zYMknHORhtpoRrnQFTqs3KqJRemnkfWI/7g=;
 b=s2obn0ZqlkA1gF4PCnBcPRIX/w/MYqXrOPsYDsnVFbRmW8NZ42crxaOvMMeaVW+XD2vAbTKudZiUhgLL3ko8Z0LVSIXJhklofhBIBUmoVOQTgFISNS6W3KrX0pKxeEQ5xYO4Sv4KltD2mPyJliTl+kvqpAO6Vosy1j4hxwxPEwCnCuPSIyIy3v/nDgAIVcZ+BM9tDpA2KKRIpde/cW8WG0JnvGthuNe+vMXUWBvgKFBshTASv75jR352u1ribZznuLwXaxyAOgKkYMrxOr8WjnxPFAjUHoHNRl+FOWm1PVt0ifng65Q6WFf8/I7E53MkDNc/0BNsHzwqeOHBDEOn3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB8702.namprd11.prod.outlook.com (2603:10b6:610:1cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 18:04:10 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 18:04:09 +0000
Message-ID: <5e911112-55f5-4b43-99f3-1dc11077da9c@intel.com>
Date: Thu, 6 Feb 2025 10:04:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 18/23] x86/resctrl: Report "Unassigned" for MBM events
 in mbm_cntr_assign mode
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <sandipan.das@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <seanjc@google.com>,
	<xin3.li@intel.com>, <andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <22cdafb381295c3802388613686d7b89a5e313c6.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <22cdafb381295c3802388613686d7b89a5e313c6.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::27) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d10ae51-ecbb-4101-bf99-08dd46d8a761
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHAxamovSzJvYm1lVm93b1JPaUpWSVdtMWlVY3JZbmIwOFcvdm1TZUdiTjBM?=
 =?utf-8?B?cFo5dzkxNitIUkdPV2lBRGRRZnVFTk5UbVh5QW5ReEpxZzlCVEhvRWlRQ2JV?=
 =?utf-8?B?SlF6UFhPb2ZpK0tFWkRJWWd5YTZQb3hIbHorQTRneER4a3BicEpuQnFlZWc3?=
 =?utf-8?B?NWZ4ZTNUYW02NG1Fc3BTY2FWUnpXaTVzdm5tYkd4emN1VTNVVDNOUlpwaVc2?=
 =?utf-8?B?MzRLSDNkZW45RzdBaVArSmxEL1NQbGtiZm9VRHordlBtNFZ1Z0xTMVJqVFE1?=
 =?utf-8?B?ZWExeS9KbEJOVkQ2L2dYSFBMbXhVcEtoSlhaMzZWdm5lODZXVks4YkJRNU1V?=
 =?utf-8?B?KzZFdXd1d1BLWHowNGxUN1B1Z0RHd0hqQlRzSVdkZnBkM2tRNjZMVVpOL0g1?=
 =?utf-8?B?dHFrRit1MjRFRlE2MWQxNW1iWGg4b3IxK2tERm9FTGpZQWVGRnZKVGROdUU0?=
 =?utf-8?B?d0cyNERESUE1bGN4U0JuRFdjWUxpVjZXRGNrNndmbjVNL25FVDhnTzJhbmVp?=
 =?utf-8?B?bE1TRWRFZGhiN3NvS0NkNElpcjZFS0N2NWFzYnZsNVdwSVphOGZ6Wkh2Tlgw?=
 =?utf-8?B?WHBvQ3BIKzhWVDNLVGFhNk1xTlhKYzlySkJ5WTdKUjZLcUkzOGMxdzhTelBi?=
 =?utf-8?B?eUNrZWU5R0ZpNTJaMlNJTG12TzlYYzdWU1puVGVDeDhSWFN1cE0xeFl1K3Bm?=
 =?utf-8?B?dHBlWHVET1htR3F2RFV4cnVEbUw4QlNtbzdSM05tOGg1aVhNOUJLSThUazNn?=
 =?utf-8?B?QnN4dkhab0NSbVB3dFUzNmduV0RXTHNtdlk3amxTYm4xTDlXL1FMQTRrdWo5?=
 =?utf-8?B?Uk5EMW1NZkV1Mm5rMS80ZE8xQVdJVmhZc2d2MXdBVkJMYzlQVUNRUVBWeVkz?=
 =?utf-8?B?ajdzS2JzYzZXMlBTdnl5ZE1tTG81NkgrVVM2MTlTcW00eHg1T0RWd3dKeGJz?=
 =?utf-8?B?LzVqcVN1ZDhmdjVrYklrY2M4bjJDY1YrL3RGRzl6dy9lUWg1alhWYTZDYTI5?=
 =?utf-8?B?ZWJvaTFoUkI0YVpUZU9qVllLWXAyWlZCbXJlQWo0bkl5YkhvQnJDUnorOFoz?=
 =?utf-8?B?N1lyZHIwdHNHZDRJRksrSk9adE9CaW04ajRpMjJNamRLTkUrWjNsalRndFc4?=
 =?utf-8?B?aUp2d0dkVGNaOWJNOE5jM2RINmEvWUxjRktuTjExNitWREpQZHN3bjhOOS9h?=
 =?utf-8?B?eWViTmtVNzBRbWI5OUdCQXVSNkxDbGdxRTd4Q2NDS0c4L0pzRkVrWVdXQ29W?=
 =?utf-8?B?TTFubENqQUF3YWhLVjhQMjh3eXRRYUF2TG04cGNlRmhQYklpUGN6ZUo0bmdv?=
 =?utf-8?B?L3pPSHZTTUlCNVlPYkJwZTMvWTlyWk5qOVBnMXRXeENxdkxrME4rL1ZuVDE0?=
 =?utf-8?B?bzEwamM0TEdIaVNxaFNkbDloRk93dzBsQjFaU0RVelE5U2RZMzR0clp5djQ5?=
 =?utf-8?B?UmhDWHF5M25ieWpWcjBtV0psRkk3SGZDZnhZL3djRllGZTcwbmdOalkyQmVy?=
 =?utf-8?B?cGtXQWZTVStMQ0dZT0lJL09sOWRvVHorUXRlcjVBUDZJN3NvS3B6enVvL1NT?=
 =?utf-8?B?MjQrTHIxWWFOMnBhbzhaS2FsanBuN084UXdpMVhiVnhJcFFOdWh5MTN1TUlS?=
 =?utf-8?B?eVcyMGM4NDY1akNKVm04K20vd2RBQ3BxeEc1WHZqVk04Y2g4MHdKc08vNDIr?=
 =?utf-8?B?RjBCODRQQXFrU001dC9PSzJKUFA1RWpWV3JkZTFPL1IrajJRc0p0djlYamY5?=
 =?utf-8?B?Mzg1emx4SzlNcThLdFBJUGdjRFlkYWFHb094ZnNEV1JGUnlGWGs0aGptYkd1?=
 =?utf-8?B?WkFwMUFSL0lDNlhoNmlrK3NvNXo3ZjZSNnJpVTJpTVpUa1JFdmM1MVVtZlFO?=
 =?utf-8?Q?PKK7ZmJW9QdfA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2lzZDNRQmZwVGMzSFFQK3ljd1M5UGROa1NUbXJYbGEzY0xLajlxakpMUzJE?=
 =?utf-8?B?ZUpLS25JMGgzOTZNQ2N0QUNEWG5mNlA3RHdKajkzTEtUWUQvQ2RXM1EwZ3ZY?=
 =?utf-8?B?YmdWbkl3dS9oTjVGVWdwWXhPZDR5d0szUVVxOXI4SDcwZUVQQlYva3FSQWlR?=
 =?utf-8?B?TEh2WVJ5VVNtUGtsR1l5dnZXbE9SbXQ3N3ZCYjlsSldUc21qQWc1OGxhbFdy?=
 =?utf-8?B?Q29kK29kWHRSd0dBeE5oQXFLL2FIS2JObVJsR09sVlh3SlQxT3A0SW8xcStE?=
 =?utf-8?B?NnplK0RnRVdvdmE3Z2M3Q215QVZKaTlDMW9oeXlVSHYyOEY2ckhHcVd5akJQ?=
 =?utf-8?B?OWxWVHdrNGRtNkdCcFY0NHlVQStHWnZDL1IyZXNKcStYS0Q1UjFWTzBVbG5N?=
 =?utf-8?B?K0IyYXRZREVGOFhNbDZydnZMeVV3VTNpUHVBVEhXY3dWRzFEblMzTFgxV1Q5?=
 =?utf-8?B?WmFCQ1FzZVV5aDBYdTFpK2NlZDluSld3c2VlT09kTWp6VzZHalI2dnBXSjdC?=
 =?utf-8?B?Rjltdyt0K0RYazlIbCtlaHpSdzN0ZlJmSU5GS3kxRmY0QVNjc0JzWjlsay9h?=
 =?utf-8?B?VENodjE2NlVKWUt0SklkK3I0eFVLZjdoeU04YWNwOHpRd2xDcENPN3lBdVhQ?=
 =?utf-8?B?N3loakN6OU1SOWVkNVpmMFhRb0w1aGZKdWloZzNCenBRbHNBdUttblk3YzFH?=
 =?utf-8?B?clZFR2xMR1FYVlpOUkVtTjRhWldIZDhFOHlJcU1nSE1EaHBhMUZSNzVwM2cv?=
 =?utf-8?B?SU1zUXdLam9qNUp5dGxEWjB4U3BhQ1IwRU5BREZVRTlWK0N1WWxsaGRHb0tq?=
 =?utf-8?B?OFdZMnBUUnprMHFEM3NZSjZPMEhGZEh2NU9kUHkvV05veHVjSm9YUW1peGt0?=
 =?utf-8?B?T2hmYkRTOWdFQ2x3bXJpQmd1Z3BNWW95dHgvbW9XT0NwdEpESzBtQktBalY1?=
 =?utf-8?B?ZSs5Qk9BRWw5WDk2SW9VdWVhVlVRWkJac1NXWEdYbUV5c1RGRURBdGNWcThX?=
 =?utf-8?B?NDZPZmpJRzZEQVhQQXJwdnhyb2MxaU1YTXBoOHJiQlVndVRib1l0TC9qUEx0?=
 =?utf-8?B?QTZLcVZzeS8yZmRBU3h6YWlMR01zcDdWVmJFQ1RhNjB0c1Uxc0dIUWFHU29j?=
 =?utf-8?B?UzloY3VCbVZWY21TUHBxY0V2VFNBVGtqMUppTzl1Z1l1TElFR3RHNXNqZTVq?=
 =?utf-8?B?ZGVwZnNVbzIxZE1BK2I1ZlN2Y1VxV3dBajBDeWVIYmY2ZDZjS0ZJSzNsVStN?=
 =?utf-8?B?Q0tjNngrQmFuODg2dHNCM0RTYkVRZjArWllpWS9Hc1FyMk1BVVFla0szZXg5?=
 =?utf-8?B?UmFYTlVHQWZyS2NNSGZKYkNVNm1ETGdGV3NyRFU3bHA5MEk3ejhjbUlncEVh?=
 =?utf-8?B?STdnY3NhZWhYdTlPaFhCak5NY2dxMThwRytXWDZ4Z1UzK29vdS81NGprZnh0?=
 =?utf-8?B?VWVaMENlbHlBNEd0cVI1aXBFeGExZ09MNUthNm13Wi9TU3g4dkVSa1d3U2FZ?=
 =?utf-8?B?cDl4UHlzNlV4aXpmelljb24vOStwUVlXVG5KREt6Ly9uV2ZndEkzS1dzMzZ2?=
 =?utf-8?B?YW1HWEhBY05iemxJRnRpbUpFT3Q0amN0cWVIV1ZNY0pIL21qWVJRR0Z1OXlE?=
 =?utf-8?B?V0xNRjVaNFBLaXUrNzNHODBMMVpZeEEwUStDUEk3YVdBdjR3NUZaUWErZnlh?=
 =?utf-8?B?ejdYMy9MSVVoeUdseTYzV0tsNnpLMkh0UVFuMXkwMmNOWDVKZDFzTWUreFNI?=
 =?utf-8?B?eHlKemhQb3cwQ1pPd04ya09XampnaE5zOG1OY05MTWhuVlVublVMU1dWYTdX?=
 =?utf-8?B?S25OUytZdCtVK2w2R1pEZWlaeTZ3aENOT0s3VE1LaEtWOTk0dSttcHN0cWNj?=
 =?utf-8?B?QlNlYWx1cTBKMDJNUU1vQlVHc293ZUZGdWxpM0QwN1F2SW5VQWtLRTJDUTdW?=
 =?utf-8?B?S2xOVWpXNWdlVkZMb2hJL3ltb2dWeGd2QytCQmZ5VEhQeEpmdXFBODY4THVy?=
 =?utf-8?B?MGRNaXpxUmtUeSt0TW1jNXFKV0k5YUJHYWkrUGdWQkZKM2U3MUtoVkt6TmdG?=
 =?utf-8?B?Zzl6c3Njd1BpOG51WlRIRlA0bFlhdzVrNS9qek1tbVgxMkQrakZJdjFubDFa?=
 =?utf-8?B?K01LVlZBajRxL0laZjBuc2RrNndtbzF6ZlppdXB4bmw3bnVBK0pPTDBVN0Zr?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d10ae51-ecbb-4101-bf99-08dd46d8a761
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 18:04:09.2977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMwVxW4LkWUStloPn6o7lad3kf0g2JabrGbYvuO0B9Ce6SlqZbsTfgm9ZtNy1zAqTzfaIOy7aZ1d/pqcgxMk0sUPq0wFfhXcz0y61W6JnxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8702
X-OriginatorOrg: intel.com

Hi Babu,

On 1/22/25 12:20 PM, Babu Moger wrote:
> In mbm_cntr_assign mode, the hardware counter should be assigned to read
> the MBM events.
> 
> Report 'Unassigned' in case the user attempts to read the events without
> assigning the counter.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 99cae75559b0..072b15550ff7 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -431,6 +431,16 @@ When monitoring is enabled all MON groups will also contain:
>  	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
>  	where "YY" is the node number.
>  
> +	When supported the mbm_cntr_assign mode allows users to assign a

Same comment as previous version.

> +	counter to mon_hw_id, event pair enabling bandwidth monitoring for
> +	as long as the counter remains assigned. The hardware will continue
> +	tracking the assigned mon_hw_id until the user manually unassigns
> +	it, ensuring that counters are not reset during this period. With
> +	a limited number of counters, the system may run out of assignable
> +	counters. In that case, MBM event counters will return 'Unassigned'
> +	when the event is read. Users must manually assign a counter to read
> +	the events.
> +
>  "mon_hw_id":
>  	Available only with debug option. The identifier used by hardware
>  	for the monitor group. On x86 this is the RMID.

Reinette
