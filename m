Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101644A04;
	Thu, 10 Apr 2025 04:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744257612; cv=fail; b=RtaUc/lI0lx2vDMi7DpPz4/TFLACIpsKU1cp9EPQs0qeD1XeufLDQ9oco7XUSnY960hKrTUUwwesuXB7iqYByZAbaM0XWvppHtaR+VTf6htrFP+jZ1fpRyUC4DRt9rkXcVos+1mU5tG77f5UOHbzNSBCtUDtSH9qQ7OnB85sE7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744257612; c=relaxed/simple;
	bh=pWK2csL77ANrdQeADhbp2KzNoqNHYh+4STK2qQXCEtE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jZAz9Qvve2MjBsCmX66KQ2bIeDvvLp94exXKCUIwDP7WjRopqZ+l9+88T3bNMQ6CgTcn/2b6CPmAwFqCzp8292sSheAsVQpTwuB1/JTN8bZ3X8TOA2RXZeiNfFGuI2PZ8rcLyPrTy56NOCThX+D9qCOol6ZWq3O5DhAk7QjlXJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NE0WLl3V; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NE0WLl3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744257611; x=1775793611;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pWK2csL77ANrdQeADhbp2KzNoqNHYh+4STK2qQXCEtE=;
  b=NE0WLl3VJHfiAn+ygjZqw7LySalfqlKJ7fDgDWgAMOZHiDakwjGmA/2h
   CupqN4dcKr+FNAvKS0NaXbGABdNZdm0rdQRhAS3wMyU9fWTe4IHVmjUEQ
   l++j69ObKcBbhFmEfyttUrBALWR49sUcP9ZDbj1qYVXkdtmm2tkIQtV0V
   7JKKI4kyRSuTLsvHPhIswIvlr12pnZ6OtW+rT29iQjlZYb5zxinWSmDLP
   t1axNwn/11iJ2yyjthKng5569O6BMxzksM6OxHfXdByqTppUD+FDiVCai
   8XBva0G0JCjxvV4Cer/WN5F1Ji7X5vVxQFN/QMh0dVdohbAuxBh/LPL6P
   g==;
X-CSE-ConnectionGUID: LagKXShxQu2BSL85lybwmA==
X-CSE-MsgGUID: ycHZRDhsSXumGmvvyucU8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45645875"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45645875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 21:00:09 -0700
X-CSE-ConnectionGUID: xYxg0DM3SKyAkNlMi7cGpA==
X-CSE-MsgGUID: NuDIWNzRSAanFZepMgWgEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="128519832"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 21:00:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 21:00:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 21:00:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 21:00:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3A2wrx6XtC2XA0p0j50Rt4/O7C5QuXrPSzf5b3MxGHgwT8PpS1G7oO2E1ljVCaB4hJhoVVMrZpgw2X2VY5QoJFmrVh1MKVDMe9MvzJzgCgWORlIp0WEE+lBKaM6Zjiqt0H5lGZBdQ6evzgv2K7yzalChhtBbGiNvMBhWkORdiT7EVjY1HQ++M56CCxBHNkw8y22XbpJZjFtOSDkpEyCYuZ7ShvMvqrszSQxtRME6LcxwYDyun5JRoFZVzvmNMJTHJAHwA3lTeere4hqdb9NAYz7eWfu1xnv9JZnXJK5hp0AWkF7KDADhZbg3VAEc4A5W+Y2c7AThFN5HaUd5KNLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpVqf3KN97lQucnYuNgkJfOY+MzaSC9DsV/Z1RZX6h8=;
 b=sJ1Dm1q9JeseLvQKbXa1N+fEkwZQgxk3kD18WOl6okiiwqHtP+cqFbWAg5GMNRs40PFYx2u5WbKubLqmVSEC7zlWEp1TNxxucQOzDb/OE+NlZJbdJTwadQJeQqMGWiU7oVYg9S1BtAnP05cFCt78IBdWUgxytx/Z4uM7d/ewyKEIvCWOcErs8WOGop00k7gotD9WWCmanvQb0UVNPYq9+yLUyq4YhKrCeu7ZY9WoGOUpKGilWAG8eYfxzRFdRiDlIO4G3uZjx3baMAtfo4dwdNmIOczSBhpCYYUbrrSBhyczCAnUw5lSf4tjussNLwR9Ozgh6rJn9bBU+g8Tm1EkEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 03:59:33 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 03:59:33 +0000
Message-ID: <a546a42f-206e-4a0a-9e3b-0d4ac472729f@intel.com>
Date: Wed, 9 Apr 2025 20:59:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: "Moger, Babu" <bmoger@amd.com>, <babu.moger@amd.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<jpoimboe@kernel.org>, <daniel.sneddon@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <sandipan.das@amd.com>,
	<kai.huang@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <tan.shaopeng@fujitsu.com>,
	<james.morse@arm.com>, <tony.luck@intel.com>, <peternewman@google.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <corbet@lwn.net>
References: <cover.1738272037.git.babu.moger@amd.com>
 <7c135464-d859-459b-b86d-e8c18f106fc4@intel.com>
 <251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com>
 <4a98eccf-4d31-40ac-8112-c89cde7a1c6e@intel.com>
 <46e40771-c73c-4ceb-acc3-812693f98f19@amd.com>
 <5ece1b6b-a225-4fab-be74-b48037986686@intel.com>
 <f16697d8-be6b-4dd2-b0dc-3c628fc4eec6@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f16697d8-be6b-4dd2-b0dc-3c628fc4eec6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0144.namprd04.prod.outlook.com
 (2603:10b6:303:84::29) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: f1314d6c-4e89-456e-c333-08dd77e41a05
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWdkQm5BWTN4OXV2R2FMU1lNdUduRXQ1RlVOUUlTUnFiK1pNVjF5YmwrNXdx?=
 =?utf-8?B?TlJoOEVZS2t5WTBaZ2czb2tQWS9vRDJ4ZUtWV0tLbUcwVWNCYVB3cEFCbUlB?=
 =?utf-8?B?T3pweTc1eFl2c0taRTJwT1d1SWUySG1JdTFWRk5GOFRZbUs3T1Q2RVNyTkFY?=
 =?utf-8?B?c1ErMjRBeDB5MnB2bTRYZ01sS3g4VkJnL01EeWdyUURKcW1JVTZ6ZHFCeTQ4?=
 =?utf-8?B?eHBFUG5UcXBHL0hPcWgyeUNOOWhDWERzMnFndjEvNUwzRVdXTldKb1hNc1hM?=
 =?utf-8?B?d0tzcHBqYnRoTkJ4Z3Z3WHJ3Q1oxaUU2VjN6RDVCb1VRZWRBY2FvRTc0Wk1L?=
 =?utf-8?B?K2JscmEvWWRHOXlxSDM0QTFvLzljUUtQZWZ4RDlESFpNQzN1dTlZS1pacWJo?=
 =?utf-8?B?dE5PSUc4QndRdHRPMEF1ZjZKOTdqUEY4ellaWCtXbDlzZFVDMEl2TWJXOVdU?=
 =?utf-8?B?U0FqYXcwME9MZ2VxL1Q5OTVDd1NDdG96dzJUQkNOQjUwWTN2RVlhU3l5b3dR?=
 =?utf-8?B?MlNVaXRTU3V5TnBWZmEvTkF2Vnk3cSsxWDBZd3d3ZDZZbXA0NWw1V0pRT1U3?=
 =?utf-8?B?UGZZcDcxQ1g3Qm4rOXVwZmJXUVZVYkRONHVNbkpiS2dQNSt4TDBRbE5XNENV?=
 =?utf-8?B?aEZ1VXJtUEtIZ0hvdkpYa3I1TGs1d1JIeExsY0FLY2xKcUs2VXdiNUZ3L2l6?=
 =?utf-8?B?TmJLSC9XR3BQYzBveXdmQ29TZmlESzRKb3haelNQeWsyNGRKUDlKajBEekxh?=
 =?utf-8?B?WHlldE9BaXI5eUsreFZHZUEyRURDUm4xWEN1WVI4eGxmbW1GTlNmY0gxK2ZF?=
 =?utf-8?B?ODFJWUlCVFFsWU80Zy9KWGJJalJhVk5neWlGU1BvWFR6OGtwRDJvdnJXUnhl?=
 =?utf-8?B?Y3p6djNCUUFHc2NuQ1BzOENYa2RsYU9lUy93WWpMcGkwYk12NHh3WlYzbzFD?=
 =?utf-8?B?NHlaWkIwNHJ0dk9mV1dsaVNUbFdtc2NmNjFaamhiZjR1Ky8vTXptZ3NLa1Vr?=
 =?utf-8?B?WlVMTHFGWnRRQytodmFHS01jb05DbXdtUTRmYlpvYUVjbWlrK0taQ0g4a3Jo?=
 =?utf-8?B?UFZab1hDMzNrU0NxaVkxa1BqbVEyYTFuSnZkSW5taW4wbnFsOTdXMDBzT05M?=
 =?utf-8?B?dkpTaHFwUlBSbU1CbVloOUNtLzVtNnRmZmloTUNEMFZkMGprQzA3V1kvMVh3?=
 =?utf-8?B?bVRSMkI5NlVhZXJhMkkxdTdMTGhLWjh5Q2xpUTBjUkFsQzNwcUdacWl0NWlr?=
 =?utf-8?B?c1BENUJPZ0gvREE3a0Mrb00yeUlSZ29UWnl5L28wU20yN0tkM3RPU3piMVI5?=
 =?utf-8?B?bUtEc2hvUWc3WGFQNW51cHdRSzhkcHc2enZBbXM2Sms2WHZzSmZVU09vZGRz?=
 =?utf-8?B?ekNFclZ4NXVDSURzeXIrRzkxUlc4aFZLVmNqM3JMcUh0bWlBYTBVYnFpZktv?=
 =?utf-8?B?RWlESHREMkgwYWg2b2s1REhBSFRzcHAwbWkzaWFLZ1FxOXg2YkorL1ZPSUdX?=
 =?utf-8?B?NkZEb0tzbzNDNUhibkpOdGV0eDNSY05MTWVKUVl0SG1CR1RTcThJcld5b2ZL?=
 =?utf-8?B?cGdpd3M0VzhaMG1hTzdSdXFnRFdSN1JsL1czcVlJWDJHL0tJTFBUZVd5TW96?=
 =?utf-8?B?am1rRm9jNkI5NHhkTm9aVU83L242b3FLUW1iSU1Uci9RTXJLR2Q4cjJQZXlC?=
 =?utf-8?B?OWdySTNpWVhVNXlQQlVSSFpISG5CMmhwMThlbytMQWwzcVRpQzdReHNRUkY2?=
 =?utf-8?B?RGlPUjFXZ01Hb3JsWEZYTWZmNHFJRjFKbkVqYThiUGRFSUh2cGdXOUJ4ZHdq?=
 =?utf-8?B?TzN2MjFVN2loVUZGV3kxb0plZzJmR2Y2b3ZOVmYvOTQ5WElGV2pEek5sczQz?=
 =?utf-8?B?U3RDenllVlJuU2N1RGUwNEJBVW1ETC9Rd003WjlLV1IvSVJWUEdqSzFuOGZj?=
 =?utf-8?Q?an5QuqE7wng=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K204aUtQTnIvYWF3bGZEVGRveEdzZC9OWjIvc3NmbWJLalUybGcwMEFvbkwy?=
 =?utf-8?B?UnE2M0NUQmdIL09LeGIra3dCbUdHWmxZVERiUU9wL2tKR2RLejNCaFU5Sk5W?=
 =?utf-8?B?VGFvczF3VEk5VWJkdjFMSkhDa3ZDK09zMlBsa2xpcXduQUFTTVFNcEdSVXdx?=
 =?utf-8?B?QU5iNVRyeFRTT04yY2NSbThsNWpETHVpek16eUx6cWhDK3MvMHFjN255M0NG?=
 =?utf-8?B?d0tlUm5QN0M3YWpxQThDQ2hIRXJlai9zUEdxTkUyNjZMb0UvM09UckwyL2VI?=
 =?utf-8?B?MTBjT2pUWjhlRjRSMmUzZkwyelRFdDVCY1pwMTZ4OXlrdWVLNERndVlyR256?=
 =?utf-8?B?cjRyT2FuOEJUZlZqbUhqbVJ5em5aeWgySEduVVB3aW14eC94YnFLQm5OSUl2?=
 =?utf-8?B?OFJnL3ozaGZ1U256RCs4R2tBWTJZVE9JN0s4Qm5pZnVrVm1WMGNKQ05MakJj?=
 =?utf-8?B?eUNNZHNrbGFXNXJMdEQ1eGxsL2VRSGxGa2phdnV1NldkVjJQaTZoZjI5Q3lZ?=
 =?utf-8?B?Z2NXK01NRTQ5RmxVaFJrZzF3RUV4QjA4UTN6TjJFY1BNMm5YTUtlK0poQWx3?=
 =?utf-8?B?anU5ZFB5K29WTFdYS2VSUkJPZUlmTGJySHJPejhCSUhEdW1FdFlRcTMvazZ3?=
 =?utf-8?B?c21JRTFFL2dBTjZSQWpZSVMxWmE0eWxDWjR0ZFVNa1I5amRGRksyNU1tTmdt?=
 =?utf-8?B?VGVLL0lYWWp4ZnFkWTY2bEZoVDdjbkFaMFErSlZnNFlzNFQ3c2QrZE1kRjMr?=
 =?utf-8?B?MlZFemVjRHpoV2x0NmU0ZTZ0WEtVcms0Vm96cjRMbHlnVDNjZVFiVkhGc2Qv?=
 =?utf-8?B?TExidXh0dDNGcERkck1Temk4RDB1bDV2cDZySitXV21takR0Yzl2Q1gyT3di?=
 =?utf-8?B?c0dwYTYrTERUUXFuWDNoMFRCdzJ6VSs1QWE0OENRVERGQWg3YTNjT2s5Z285?=
 =?utf-8?B?bU1lNStvbFZWWklVQldRcVljVlJnM0dGWmpoOVhaZ2R0VFRGRmtId2daZld5?=
 =?utf-8?B?dy9BUzViUU5CVjJ4M1IxeXUvd2pSZE5QYWZiQ1BCUnVyYVl4ZEVSM25ib25F?=
 =?utf-8?B?V3cyTWg5ZlJmODVFWG9vMUNtN3hUdlNPWjl1ajFCREljQTFWS0J6Q1hUYU1v?=
 =?utf-8?B?YmNuRmVTcXZuYW5ZclVCenBUcGpIQmdRb01vYkFaWG1wR0c5WnFhVXNlZHZQ?=
 =?utf-8?B?VzNLcElxS3V5emlpanJHd0htZ3BSMUx4VzdIVWJDMWhST01aMURUMnkvQjg1?=
 =?utf-8?B?Y0VDVFgva04reFc5RjljUitBTXh4QXoyQjluQ1hIZVNsaFd2VlFYQmZUZFBD?=
 =?utf-8?B?UkdNNWlGOFdtRG1zdWtKbUoxc2JlbHRWRDlpa0E4TERtMzE3UjZ5Y0o0N0py?=
 =?utf-8?B?T0l6TDBzaXlHWU5pc2h6SXlCNUJsNngwZFB3VjZaZWRZY2pZVlZlZGF1MHJR?=
 =?utf-8?B?TzZ0NmUvU2ZlbVdTcnpaODQzV25jNjJLTHgwS0ZCRnB1TUtBWmxvN0VjQS92?=
 =?utf-8?B?RFp0Ujk5WlFOUjFMM2JyTC8yVTF2SWtsdUlBRlY2YUFUc2ErU1VRMjdRaEdO?=
 =?utf-8?B?SDZ0TkZwZkU5aVFobmxET3JXWXkyNktTL0kzWklhWkpkcGZwZmprLzlDN0ph?=
 =?utf-8?B?TWM5L21GcG8wcHdlNnR3bzh0UEpJaTRValBKekEycjIrbEg0ZlRDVnV5Qlc5?=
 =?utf-8?B?RVdvRWJlRlJSRTFucVNNdTZjMlY1dDFjQktRUUt4V2dpWXE3elpMUHpnY3Zz?=
 =?utf-8?B?OWpobTVCSTdVR09adDhENnlNN09UUXpJbi9rYVpQV1ZnUlVESGY4ZDUyL1pv?=
 =?utf-8?B?MWZCWTkySjRybmx1bHNKdW9ZbmJ2eFdONEVDZVBjVWZ1ZE1RMjR6N3dFMGdj?=
 =?utf-8?B?VzRrc2pNMHZHdkJlbnQrSHFrWUtXWjR2K2kwTDcvSitWVkh1RXZlSkpYMFR2?=
 =?utf-8?B?N3dwZkVPMFMwRlRwYWRkeDF0dGFNTUJlb3oxd2FZWmVORm81STRxN0VqMTRs?=
 =?utf-8?B?Lzd2U0NHQkd0VFQzdW1QM2JYblV6ak92L2J3TURDRG1sUDZXQVpTdGROR1cw?=
 =?utf-8?B?WnJEUDhqNWFsbnR3RmlUaVM2Y08zSWVodWEzRjlUQ3U0TmZLWGFlR3piRWFu?=
 =?utf-8?B?Ri9wOHpLNXNEQ0grQUtqSnFoc3lCWFJtNHVDTVVBcXVkaXlSVWhUc0tHc3Rh?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1314d6c-4e89-456e-c333-08dd77e41a05
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 03:59:33.1999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qypFuUX3oHTSGuj3DLqMBUc8alHkHmTHEDr9lh30KZ8szd7hf91995tahX2nGUEHQQqL3Iu6us/cgH/HlwlhA4I3jgVmasaPDFVN89CYKlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
X-OriginatorOrg: intel.com

Hi Babu,

On 4/9/25 5:58 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/8/2025 8:41 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/8/25 5:41 PM, Moger, Babu wrote:
>>> Hi Reinette,
>>>
>>> On 4/8/2025 4:44 PM, Reinette Chatre wrote:
>>>> Hi Babu,
>>>>
>>>> On 4/7/25 1:12 PM, Moger, Babu wrote:
>>>>> On 3/21/25 17:50, Reinette Chatre wrote:
>>>>>> On 1/30/25 1:20 PM, Babu Moger wrote:
>>>>
>>>>
>>>>>>>
>>>>>>
>>>>>> AMD also supports what is exposed to user space as "shareable_bits". According
>>>>>> to APM:
>>>>>>      Depending on the implementation, some portions of the L3 Cache may be
>>>>>>      shared by other system functions or used for some other purpose not
>>>>>>      under the control of the PQOS feature set. The L3 Cache Allocation
>>>>>>      Sharing Mask returned by CPUID Fn0000_0010_EBX_x1[L3ShareAllocMask] is a
>>>>>>      bitmask that represents portions of the L3 that may be shared by those
>>>>>>      functions.
>>>>>
>>>>> Here is the complete text.
>>>>>
>>>>> The L3 Cache allocation sharing mask (L3ShareAllocMask) returned in EBX by
>>>>> CPUID Fn0000_0010 with ECX=1 is a bit vector which represents portions of
>>>>> the cache which may be shared with other system entities or used for some
>>>>> other purpose not under the control of the QOS feature set. When software
>>>>> sets a bit in one of the L3_MASK_n registers at the same bit positions a
>>>>> bit in the L3ShareAllocMask, processors executing with the corresponding
>>>>> COS will competitively share that portion of the cache with the other
>>>>> function. If this mask is all 0’s, then there is no other entity in the
>>>>> system competing with the processors for use of the L3 cache.
>>>>>
>>>>> The "L3ShareAllocMask" is always reported as 0 on AMD systems.
>>>>>
>>>>>> Could you please include what (if any) the relationship is between the CBM
>>>>>> discoverable via Fn0000_0010_EBX_x1[L3ShareAllocMask] and the CBM of
>>>>>> "highest-supported L3_MASK_n register" when SDCIAE is enabled?
>>>>>
>>>>> No. There is no relationship in here.
>>>>>
>>>>>>
>>>>>> On the resctrl interface side the documentation currently states:
>>>>>>
>>>>>>      "shareable_bits":
>>>>>>          Bitmask of shareable resource with other executing
>>>>>>          entities (e.g. I/O). User can use this when
>>>>>>          setting up exclusive cache partitions. Note that
>>>>>>          some platforms support devices that have their
>>>>>>          own settings for cache use which can over-ride
>>>>>>          these bits.
>>>>>>
>>>>>> Even though this was originally used to expose the content of
>>>>>> Fn0000_0010_EBX_x1[L3ShareAllocMask] the intent of the content does
>>>>>> seem to also apply to the "io_alloc" CBM also.
>>>>>
>>>>> It says "shared by other system functions or used for some other purpose
>>>>> not under the control of the PQOS feature set".
>>>>
>>>> This is a quote from the AMD spec, not the resctrl user interface documentation.
>>>>
>>>> Please consider this from resctrl user interface perspective.
>>>>
>>>>>
>>>>> "io_alloc" is PQOS feature set. I feel it should not affect "shareable_bits".
>>>>
>>>> When I read the resctrl user interface documentation for "shareable_bits" it
>>>> sounds relevant to io_alloc. The "shareable_bits" contains a bitmask "of
>>>> shareable resource with other executing entities (e.g. I/O)" ... is this
>>>> not exactly io_alloc?
>>>
>>> I agree the text is pretty generic. Actually, the whole bit mask (0xfffF) is shareable with io_alloc.
>>
>> I think the value of "shareable_bits" presented to user space could be the
>> actual io_alloc_cbm value. Thus, not the "possible IO bitmask" but the actual
> 
> Confused little bit here. The shareable_bits is resource property.
> io_alloc_cbm is domain specific value. Not sure how to display it.

ah, right. We should still aim to not let the new "io_alloc" interfaces cause
confusion with the existing "shareable_bits" that is already part of interface and
used to communicate IO allocation to user space. Perhaps we are just left with
needing a modification to the existing documentation surrounding "shareable_bits"?

> 
>> value. This seems to be the best match of what "shareable_bits" represents, which
>> is the region currently used by IO devices. This partners well with the "bit_usage"
>> output, for example, "X" can be used to show which portions of cache are currently
>> used by both software (via schemata of resource groups) and hardware (via io_alloc_cbm).
> 
> Haven't looked at this code much. Will look into it.

Thank you. This is per domain so should be a good fit ... but again the documentation
creates strong connection with "shareable_bits" that should be reworked.

Reinette
