Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB5E17A313;
	Tue, 15 Apr 2025 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744734664; cv=fail; b=KaOihH7pA2xc9eP4xb2rQ1q/rrKDlObkZUv8lRMJyW1YihYDEEr6zhaNdn3ODVQ7DWaDwplEnp66KbAP4S4ThmBhTwYUOR20JTnl0ttIqyEwwrXGY03+jXf+s8S6uz0ms1sTeLltlDDvhqqAUjGLzChVc73uQSIwCeimDAc0MN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744734664; c=relaxed/simple;
	bh=YieHis4OHb1H/hmX5Qc3bRz03swkrf38GBUexE675wM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OplL08K5GqZAGqqtNYovtI2QIQVgn7MuPE29wTGTvEu+n0RavMfYW0Xybllxqc/yuJ7QMDCtPso8O1qPUADFLYWDPA80pjiBdrteVdWqOne0IpuFqN/QcrMgxAtP17rdH8VMR/vjTecy+fXk+CADbEOioYKpH4S2U2SgvdJzdI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvkwIBrY; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvkwIBrY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744734661; x=1776270661;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YieHis4OHb1H/hmX5Qc3bRz03swkrf38GBUexE675wM=;
  b=UvkwIBrYKpkUVeEMFyKq6Bupv/3aooe/iWeBa+qXocWOqqRdn5FBMx7f
   LI+6smfvjvBEyYcOqxU8bT4gumAW2IR5PkKIJxmvNRvdvNihBQis3BN1N
   LJsWyfDMlajJRriTS9o1NTQo7NA4CB+9XTf9drkO1Ebmtjr+NanOcQjp1
   TAgBMKwPdkv5MHROL+NHiXcTF3edCd1svTon0cCJnCT30nfXqw7MrSyhs
   xoYl5dp6e8oRanxk1Mlmf40Qgr2OZ/ruVEEx8Pj1kdJUvtb4Z/FjQOwuy
   alU/VX5OqMuJ6XIEI2DEuzeFzTjjfXlwSvhpYUWIqcXuXikrihiJ/e86/
   g==;
X-CSE-ConnectionGUID: xAUqIZwoSxyE8hycZJLvIA==
X-CSE-MsgGUID: SPA5VeocQgSkGMcHO65A3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45489436"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="45489436"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 09:30:59 -0700
X-CSE-ConnectionGUID: N/DDoUtSQcuX6xfksbI/ew==
X-CSE-MsgGUID: 8Pq9LEM0TGCU9XFlsxUCdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="135236602"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 09:30:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 09:30:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 09:30:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 09:30:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOTZBSAAXzwxTBqhj3BhVuXPXmSX+a+PdcevtjnUx47VIC50m+Wr6BFiUBmbu5sy4FGCGl5DCUgUEYhHEWoQ+PkX3/YlBLKf7Vn9VX00AWD2uIaIx2YhTWb4wRLVqljcwX0C6Dp75kJIzgvvHQSlnuaUbKNw2uEOw6/EnlmpL5O6OasNB8rbxXg71twQj/OGp2fPuP8fODgFAIBhNiVcnLiNKBF45iERspWKcFyVzJTSU1HCqcx2b7kFha6JjtY7E5yErUnP2j+hg/kojZ67uSbN7kLBsXB/lXZoJ+4vCoKt3nGXeuNszyjZokbMPbDqeesYvW41UOjVk8aRv3H4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oypLBaZXwExG6a2ZDVBAA9wMXEo1+dWHT9GqJ3u5wc=;
 b=jU7bhRID0iQLQF6A8O9iTb0ifUzIP4w/HJLX5Rdm7+7E/fb9zUGXicgHuazKgi5lsmU4pak4lv5YF8n9qyKTa/L6vmX0OkP0B2qk1W+yAS0rT2VoRjXpYvIzmcuTV0OPREpuNL2koSCLPjWvx986jUfoN4EBJCMqiI5zHiTSJV1ymI428qnu2KcbPdH7NaJza0tvXdqu3uz8YpaZlUEP4gjJmeXECYAOy+UBseotWcAxTP18jZ4U4leIMX2oXMFtGbyYp60BgUXtqcivvF9GMnV1eyojHClTmsy6Pm2pBw01GIb4ERHf38fgu5oqiLpRaqNx+5KIZaC6OA8penAYUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 16:30:27 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 16:30:27 +0000
Message-ID: <a58bd6f6-f5a7-4f3d-ba2a-b45be09b3c3a@intel.com>
Date: Tue, 15 Apr 2025 09:30:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 12/26] x86/resctrl: Add data structures and
 definitions for ABMC assignment
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <3a15e2e5d6c8a5e9ee65b3fae48ada7eafb77628.1743725907.git.babu.moger@amd.com>
 <cb71665f-a732-4fd9-90cf-213f5609e872@intel.com>
 <0d8cb80a-d34e-461a-9864-cadd5497bcf1@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <0d8cb80a-d34e-461a-9864-cadd5497bcf1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::28) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 590b4def-a062-4492-9eb7-08dd7c3ad458
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVlqcnY5SDBlSXc2dDdHZDdmaFlDZVNYeTlyWWRzS3NabzAzcWE4WnhQRnZp?=
 =?utf-8?B?bHlmZDlDbk0rM05zaktHd0szK0NGcHErYlhRUTJsL3hWSlhEbzh4dS9NeGl6?=
 =?utf-8?B?WmlkaW9rN1NJM05RbDMxdGdvQVVqNHpYR3IyaUZtbWI2ak56dkkzckVtUFFp?=
 =?utf-8?B?NWlmMk11LzNyYjFpVGRaOGVCc012N3JHaTIvcDJNZjd4dGEwMmJRTGdCbzE1?=
 =?utf-8?B?NGorNDBmbFdQbERpRWVyaXkybWdrMkpueFNTQ1p3Z2tLV2tDU0lPQ3J2SEpS?=
 =?utf-8?B?dEtZbWErUjJWc1JvUi9ERzRrM1RzdmNZV3kwMEVRLy9XRkRJcTkrcWFhSjJm?=
 =?utf-8?B?TG9nSHltcklhamxkdTl5MTh0VGVDck5xYjN0NHJTbUR0b01aUEF6ZlA0eDJk?=
 =?utf-8?B?MXhOcERWM0xUSlpKcnBKVHYyVUtycWlseTFGQjR5czVXZVVuVjFNaFlzd0Nq?=
 =?utf-8?B?UFlRMlMrWWVtSmlndllGVGVwdC9Bc3FDMm5HdW54NGE4NS9pSHNUMGNmcURw?=
 =?utf-8?B?dk1qUmEzdzAraFRJR2NZbGZGcHQ5Mzk0am1pMTRvS0lrM0pqUDdKTkdDNHlG?=
 =?utf-8?B?VitjUE9CUk9HemYzV1hXV1hUMC9pQTlMMzIwWmNGcExaK0prWVBnRWhoRVpj?=
 =?utf-8?B?NWtPdEhJdEtvYjA2Yk9sVEJJamJSNlVPV1hVbUtzSFhacUZGOVk2RWRJRTda?=
 =?utf-8?B?SFFlbFlyZnBES3ZKN2l2NHpNWmRUVVdpaFlKdEtHaWFaUHJCMi9xaFRubm1L?=
 =?utf-8?B?Q0s2T2dhWUpUeURSMDNHbmNnaWw3dDFVdWNUOXhLRG1BL2Q3VGFoN0VjdzIr?=
 =?utf-8?B?bUxITEEvOWVYeHp6VFhtcENyL3BkNG5RS2tZTVFid0lJOEZqSy95MEcxczNT?=
 =?utf-8?B?Z0RSMTFZTTZvVXppYXJoTkVGRC94ZFpOSU5WZVladlEwNVFxazVLVFdNMnFD?=
 =?utf-8?B?VFdoZmxIZ2VOdmgwcTlsUHNCMGJtbEdtbFVpR1NTSU40a3V3Y0RhbFMvc0Ju?=
 =?utf-8?B?aGV2aFYzMWM3bU5SRzhTdllsM3QwdVJaZldnQ3llMzk5M3I5WXkxSjF0L0hY?=
 =?utf-8?B?MlBMWVJCYmZCb3dPYktsM0VqSlJOcE9jU1VNOXM0T3BhcWVpelhUYzlnOWIr?=
 =?utf-8?B?WnBzdlFLUFJjQ1loenErSWc0cDhxUEVJbXVPTHhvQzhKK3laQlZVRjlmVTF4?=
 =?utf-8?B?TzBmOGtjZTBTQXBSbW5ia0EyczJJNDhxUzhIWGFIcnBrdFVjVUpmSGdlY3NC?=
 =?utf-8?B?bkdvTnJLbXkwNmR1eXhIdEkvT1ROall5OWJud0NSN1h1ZkNMVTRBWjFCblBO?=
 =?utf-8?B?elY1bGFVczZ3RTJGdk04LzU4aFBucTlkQUF3UG1FcTltcnU1ZmJsR3VQTVo3?=
 =?utf-8?B?Uks4dXV0NG11UW5DOTJCdlNoell2bnNkSWY4UWdYWk9hOG95OEpwc2hOQlk4?=
 =?utf-8?B?R1RMaDgvY0dQbUIrYk1hTEd0aDZSbG9PMnlvNGV1eTJXYVh3dmJkTHFlbkhP?=
 =?utf-8?B?c3p3UVZETEZaTFgrdXFKcktrelNJa1ovY0ZqRVRuZEZIaFRNWUNNdnZDV2Ex?=
 =?utf-8?B?Nk5JUGtxM3VCWElKRDBSOTVVZEFSV0RlNkpMR2ozdVNRRGhNdnJ1QnJGQ1FM?=
 =?utf-8?B?YmdaN3ZwektFMWpKZ1F0dG5nVWtPSUMzSzJ5dTB3ZWJlRm4wZUF2R2Fodjdi?=
 =?utf-8?B?ZlB2aDVvTnB3QUtuK2Zvdi9XN2tRajFQTTBXTnQ2TGdmNU83UWtHQXNSKzV4?=
 =?utf-8?B?YkwvbHYwS1o3NVpYZ3VWK25qcU5odjQ5d2ZKUTFGOVljY3BScUxVRm50eitr?=
 =?utf-8?B?cHNqSllXU2xWVFR4WjkxdXhOekxLdlNjSXo3b2VXZHd1NVoxZC9DS3Q3TWVX?=
 =?utf-8?B?QnpyRm03MGdyLzJ3UTZyZFRGWVVFdlVxYnRHL0JoUTQ2TEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk5lcDJPZk5ERmRhbHZHbUFvcGlhcHZncnRUZlF6QmtpbEZ4a2xTeGtNSW1J?=
 =?utf-8?B?UUtRWGtUeDZrcFZCdng3VDE0WUEycjBmSWdBNlduR1Azakg3V0x0d3RHM0k5?=
 =?utf-8?B?UDdVLzBYdDhoQ29MTk1hVldzeUpCVzhKdFRlRysvWnY3dUJYd1pJSjZBL1lL?=
 =?utf-8?B?S2MxWGFkeEdRYStQTFdNcktZem5WVDAyL1lsRmkwaHZRdEI3VGhYaEc5NmM2?=
 =?utf-8?B?VThFM0RhRVZYQ0Y3TzFtRHJZUnV0eE8zbGJVODZLOEZFYis4QnN5RWxGNkx5?=
 =?utf-8?B?RnFyRTJaMDkxUVRLVWhrZGVHVjk0TFVhWWRSb05KVmUrVUpMdjMzUGh0TGIz?=
 =?utf-8?B?eGd1UkJhamNmQytnL0VaYzA4ZzVtS2tQcHFLeTZLci8rT05VaEZHb1Q1ZDRn?=
 =?utf-8?B?Z2xjdjVQalFrZ2xwdnVoQlhRQVJ6OCtocjZVZGlhalZ1cWhGOG4xTGhMM2FP?=
 =?utf-8?B?QWdFZFBkYW9rcTRvdEFLSVVXSXdoUitJcm80bTV4Q2RRN0pFeVZzbmFRVmt6?=
 =?utf-8?B?U2RGYks0eWxLUGd2WmpHME9pL2o5T3BhcWNQR3QvUzYwcENDaFZEY2JmWjBk?=
 =?utf-8?B?cDZ1ZkF1Sm1GQ3hzZ3NXSWVEYUp0NFZ5bElVeXJTU01abVRjbGZaejZTdi9E?=
 =?utf-8?B?SkkrUm1ZYVVmMmtzN1B3bEdzK3JBUThHa3VGeEloK2RZN2k4em9sUU5yN0hO?=
 =?utf-8?B?aWdQenoxVWtOcE9qUk1RcVpuNWh5V1hyOFZIWDUyN2piV3dkYVR6NlYySXB5?=
 =?utf-8?B?bzdSbWhQSGw0ZnVLcUJmaWtVaTFJMlUyOS93MUUzTHJSLzRSN29aSEp0MW4r?=
 =?utf-8?B?dXdHMldvTUtpbThCdjNwcklacWZJZG9LNDBJQ2RVNHNQQnR6S1JxR1pock1D?=
 =?utf-8?B?VllObngyOUFYVldHMnl6cEJ0RmVrL3NiWUZZYmZ3QUQxM2t2ZmlJY01mdkJy?=
 =?utf-8?B?SUphVDJLdUduZmE0TEx2ZGNZa3hacDRWNkRYc2xJZHU0OFBYTzkyUWMzb20w?=
 =?utf-8?B?VHlnSkhyWjR6VkhmTitWWkRVNXE3cW9mWXJWUTJOdVRyK2Y0ZVR5RHJzYUxF?=
 =?utf-8?B?cmxlWEd4VmhNR01qQmx5Y1UwM2R6WUs2eFc0endQWkN1STlzOTZxVjVLM0RW?=
 =?utf-8?B?VnJLdDBlNTRHeEdUUTVYR2ZFK3N3a1FoRHVxZFNQYmhDL2lMM2NoM096a3di?=
 =?utf-8?B?TzFhdVl3WVppTTRpZVZkZit5WHM5eUMyZ3htV015cnpHVDZxcG1IWDAvWWgy?=
 =?utf-8?B?LzVta2ZENkVMSDAzR2NuRUV2b0VmTXM1LzlsaC9zRzU5WFBCVjJtM3pPKzl4?=
 =?utf-8?B?N3FYQVlkNGRqd2tlZG5oV05yaTRnT1dVSkppbGN5QUg5V0psZEtOSkJ3SGVj?=
 =?utf-8?B?RUdFK1d6SHhUNStpV2pDYmk0SU5DSy9hcXpBVVBHSlN5NXQyeWJCdzhJTFJ2?=
 =?utf-8?B?MmczOFJvNHRvd0lBNVJVMXJka2RqRElEYXc3VTl2ME9SMmg1d1hRMWtGMk1o?=
 =?utf-8?B?blZnSnJJTldER0VydUdSZnhDVUJxcEhydWpDSGFmYm5EZzhwTlZXU1o2MWl0?=
 =?utf-8?B?RjcrYy9aTk5TNFRkaWw4OUdHK284Ry9DU2RnM2Rhdi8wS3hGa1RZTkNqWmla?=
 =?utf-8?B?SUUrZEdxNlB1THRkaWJPRnNiS1YrNmx0eXNDRTlOYU91TXZ0U3JVdGRTQXMv?=
 =?utf-8?B?MndOeHdkNjZNV2N3cFAwWkRwTUtCTUJzd2hqSWNudkpCR1FmSllaRDBMcTB1?=
 =?utf-8?B?WFFEakNoVFBOSkhhbFVuNS9wc20zcHVaZEU2a2ZKUFBqTmlpZkFJa2VBTS93?=
 =?utf-8?B?d2RjMFl2UXZrZFdSSzdsWDIzbHIwUXVtbi9LTGRZV0VpbzdQRGExTDQ4elVj?=
 =?utf-8?B?K2lxVWRyc0dNQ1NlR2pjeVlLQ3RLWXpKOEpNdFdNbmd0NDU3eGYrenY0MHZG?=
 =?utf-8?B?WHQ4Q3VKWThDQjNpcUdjemtNeWUwbjRNcHEwYXUwazhJaTlhS3Jra0w2VHBX?=
 =?utf-8?B?TS91OGhVYytaYXhJakRGdmJwcUhPQ3RVMElaN0F0d3pPVlo4TzhvOVJKT3Nq?=
 =?utf-8?B?YzR2UDhuR1FTVURDN0w0Q0pCZlpqVHVqRlpXMzEzbU1YMEcrNnQrcWZwbmtw?=
 =?utf-8?B?R3o4c3BXay9zdEtSVDhmYjRNT3dxTFBkUy9nSUFTUFNZbWNLS1FYSG1HQ1ZJ?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 590b4def-a062-4492-9eb7-08dd7c3ad458
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:30:27.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epmFa6DTvJTy+McJ8Ssm5ITAV9bEWIPl6E5/5JBXWxNxIYh640XJMvSCIdhPJefHRPLkrLSqcTP8hQDQ1VwXrBuJBzM3jT9Z3JDpndzjVVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
X-OriginatorOrg: intel.com

Hi Babu,

On 4/14/25 1:30 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/11/25 16:01, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/3/25 5:18 PM, Babu Moger wrote:
>>> The ABMC feature provides an option to the user to assign a hardware
>>> counter to an RMID, event pair and monitor the bandwidth as long as the
>>> counter is assigned. The bandwidth events will be tracked by the hardware
>>> until the user changes the configuration. Each resctrl group can configure
>>> maximum two counters, one for total event and one for local event.
>>>
>>> The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
>>> Configuration is done by setting the counter id, bandwidth source (RMID)
>>> and bandwidth configuration supported by BMEC (Bandwidth Monitoring Event
>>> Configuration).
>>
>> Apart from the BMEC optimization in patch #1 and patch #2 this is the
>> first and only mention of BMEC dependency I see in this series while I do
>> not see implementation support for this. What am I missing?
>>
> 
> My mistake. I should have corrected it.  How about this?
> 
> "The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
> ABMC counter assignment is done by setting the counter id, bandwidth
> source (RMID) and bandwidth configuration. Users will have the option to
> change the bandwidth configuration using resctrl interface which will be
> introduced later in the series."
> 

Please just stick to what this patch does. The part starting with "Users will ..."
can cause confusion. To support what bandwidth configuration means the description
can point to existing definitions in include/linux/resctrl_types.h without needing
to mention BMEC.

Reinette
