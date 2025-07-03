Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3D62E3AE7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544295; cv=fail; b=p13qiebATK/qpbUJpi0971IKJaf2usg8dDMtoeXlr/3fT79e0aH64UyiaTWB/PjDoyigb6nKvG5qWIChTmfXN87A6DHTADSRsMZefhfs2N5iEOOWkhcfCl/tbcNcc1AymGjr8hcNvrlITVnVUhcXmR1I6CoArqFYpwXfQYShbn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544295; c=relaxed/simple;
	bh=0sa3m4/0oyEGMHGgaBsajUhjZhnlrvG0QMMUp0fhJNY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Klxl33vMpMVb0yjJ0QaSIuMMZKn/OP6eDZQFrm1p0xrgBeSfMMv+XVisoJ+KH2M6dPn+bwVtykzMNGylLagLd0Lf5i4nL6k761jpOgkNarTG7ZNm2ZF3uDvNyyXhfK/5FXfyuixTDdUtNJG2S5MzfQpiQVaEROGLHMuclB6N1Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMCPWwRP; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMCPWwRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751544294; x=1783080294;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0sa3m4/0oyEGMHGgaBsajUhjZhnlrvG0QMMUp0fhJNY=;
  b=YMCPWwRPAuYI1AhDqFlprslEEjwhlDZl9ZyK1ytDqPeRs6dXL/oYPC4r
   sHjABQ1NaCqq84OjkDStMxKAXdL2e/WO8x8T8e5I6yKj/+F3F9z5KtyaM
   Al0FHsXVwpOCe+NISr3zu67MmidxQVoz199Vvrjt/cHaFpaE0PbiuzAuH
   Dy1+jAcuFCK3sNjHoEtHZHP3+dNskvQoi2E4rD4E03Ri9GnNNe2sB4XJZ
   /pMtPR9GtRV7atfozSeuDph/mQkZKU1wtarZSfhLi1GoNp9eyp95LAnPj
   zqbuiWPn/iruB82NqL0vDjBzZgdVjnx3am2SqMVVu4tRUP2lRxTek+lHD
   w==;
X-CSE-ConnectionGUID: m8Bq3VxMRTKvMCyDvwClew==
X-CSE-MsgGUID: SUInhE+vR++ebN1kCfIisQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="52990652"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="52990652"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 05:04:53 -0700
X-CSE-ConnectionGUID: 5IFV5GsGQsWJ53sxdHgpDg==
X-CSE-MsgGUID: 2nr5SHkiR0KM1BkjSxYoWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="154120678"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 05:04:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 05:04:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 05:04:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 05:04:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmcLRGo8QgWjzxlWwi2+XMJqTgt7NKonXkgm0EXoicR3jewi60+sHhZAaBxrilB0iSRF3UXdRyfI8P5Kh9lO7UHDF74baeRx6nhIRl6w/qhea6iusPOSUXQ3rVJoTNd8smPqTsw0hzTnIyUXDU1b2seaDVk2Va8ugJkrEyqVtUfetX4CqnBJ7dsVGQEXsv0bGkUWejueYN/RngXhK5htPK7eNvvp/eoUZtNsve7fLLUc07i05xupeTPJYtVwBylLRg04tc4VJuKRujCEx49pr7hQYvjfX7MeDdTAIUjA3d5wV5zxGTawt6ikUcQAxkOzsus3ZXUXbxLvq719gaW/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3/N1rCFWmmxWTsMWU2W2FqVQockd1Yn2iiVpCybN40=;
 b=bFzRsf/vrB2bmze7Uaa1M+nchtEJdz6/ZBVT4aNeMOSx1vb/6tXfJS2zCQJzECZR8+S/fGPJ6+20xpdI78j0zqUd3QhUZIjSt60z3CfZCpd26rn7JST/e88/ch9IXCQdlXS0QzD5mSNJD1B/rq3AKu9CAbZGHyE2mq5TI1GQjuqLLYHs4vNB022D6sybwjWmXvC8Ik8XVoA821j7JIVwrxqOpdjYrbly7Gg+5OacmQGQmU+pc9jBN22k5Q2nvknwsE/9E2er/mBsUxbL3DK3TeCx455h4dHRX6yFVKTpLlqZe+xwUJS/iPyrI92gS6fbt5DZP8SN7VRSUoHbLgL1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CYYPR11MB8306.namprd11.prod.outlook.com (2603:10b6:930:c6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.21; Thu, 3 Jul 2025 12:04:31 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 12:04:31 +0000
Message-ID: <b4891cca-4da3-4411-bc9c-669118bf825a@intel.com>
Date: Thu, 3 Jul 2025 20:04:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
To: Michal Hocko <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tim Chen
	<tim.c.chen@intel.com>, <linux-kernel@vger.kernel.org>, Jirka Hladky
	<jhladky@redhat.com>, Srikanth Aithal <Srikanth.Aithal@amd.com>, Suneeth D
	<Suneeth.D@amd.com>, Libo Chen <libo.chen@oracle.com>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
 <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
 <aGZxFRVxHouLaMPg@tiehlicka>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <aGZxFRVxHouLaMPg@tiehlicka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CYYPR11MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de7f4ab-f888-4908-af16-08ddba29c458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVNPQlQ3d0w2R0U2ZEtkYS9GMFF3SWJ4cGVtMFlLQTJuQ05Fd0MyS1ZUUHhC?=
 =?utf-8?B?Z3EyT2RCeTVXTVNoVVl1aWJpaVJHOW5VRnM1cmN0VTNrRDdXS1Z3S2gwaW42?=
 =?utf-8?B?cUpWcW9rZWlyVmpaczdER25hbW9BNkE4ZnlNWVgxZ2ZMbDNCcWxkT2xWWnNT?=
 =?utf-8?B?K3RSS1pZNWxFRG5CelE2eU5Wenp6Zm44MUVMMkdzaUs0Q1VzQXFvZHk1cDU1?=
 =?utf-8?B?QkdnV0VKS0ROZG1DODFNMTRzYm1Ga1QrQlNiSUJQbXVhaUZhb1o0NERJZFpY?=
 =?utf-8?B?R0lwSXQrU0VYaitPZTZ2MkhEcjc0WVZZYjhnSkVCWW13R2pmL1ljS1JSY1RI?=
 =?utf-8?B?ZlgvZnlQNzk5QW9BWXE3VzIzUlJxWXlWM2FqRmJZb3poS1NYZ1pwbU5WK3Vm?=
 =?utf-8?B?RnlVaTh5SFcyN1F1UE80eGNzNk9mUUM2bkxNUGFqaXQ4aWhrY0N1SmNHYXhW?=
 =?utf-8?B?TEJ1U2U5TENNYVVJb0lCNE9WaE4yZEs1ODdwdG1oZXFZbUhiSkFLYUp0K1ZV?=
 =?utf-8?B?RlUyV3hBRGlNOXV2VGI5TXJhUm5WL3RlUXF2cEgvc0lhT25FTzkzMDJuUHRW?=
 =?utf-8?B?cU5FeFVVdHkxOUVxWWhKenFJVm1maVdiRlNIU0ZsLzZVaEd6ckV4UlhXQng2?=
 =?utf-8?B?REFaNTR0am9ILzJ4dCtuM0xSbUdOTVptYThBVTZSamtsOEt4UWNibmNwcWxi?=
 =?utf-8?B?V01tQ2IwY3JNajR0MS9lMk10M1U0SDJ3bE5aZmJoZ2drZjl5WnJ2Y1VuZGNz?=
 =?utf-8?B?OGwwUjB4dDVKZ091ZmxpK2h4UTBrL3pocVJrcGRYdlRIc1BoUWIrSGxqVXQw?=
 =?utf-8?B?UHF1V0R4VmtUTkV6eTFvUjVDZFY1SU1OaTdNTTZEUG1lYXY1aWNrMDlOZDhY?=
 =?utf-8?B?akdqRUNib29GcEpVdVFKREhOY2pSUXpPd05ua0ZUYjM4S0J3bENENjk4amZO?=
 =?utf-8?B?UHV0TkFRVjFDQWVIdG0rS2x4RFIrenZ4SktaSktZODBYcTRIMVRXM2p2M1ly?=
 =?utf-8?B?Z2V1ZHFNZEZaaUpKSldjSE5xdUZrMWdHZmE0SzAzQTRwUmZ4czNpRHZNaXQz?=
 =?utf-8?B?M1l3L2FIK2l5MmU5MXJpd3hHNUN5bEI1QWpKT1pBUEJLTnUvUFQxZVBoZUJx?=
 =?utf-8?B?cWpzM1pFbUg4QXJ2YnNwMVQ5clZpWEk1ZGM1UW1kWmRSdnFLL3FWUE52OFpw?=
 =?utf-8?B?UHNmWkVXdDRvSVZubmZIa3RWbUQrK0ErVU8vampEa1VaMmpRWmQzOWwrdmZS?=
 =?utf-8?B?MjFOZk9ZbHVpemdmN0VkUTM0NS9VSFhHVXFsZGlPNk1ydHB2UDVaV0xreEJ4?=
 =?utf-8?B?UnUyUk5SNjVvQVZ0bEFBZVFUcDl4K0trcE1hUzRvK1JYeGkwTHZHemVIVmRh?=
 =?utf-8?B?YmVLNlVjYnRlQVkvSzdyMzBLNUszK0VYQWhWTzA2eVF2czBtT1dqQWd4UDU2?=
 =?utf-8?B?TTN1UVJSdE9QVFJ2aHF5SlNmVUVBV2c4TXorQ3hoVDduZFJFNUdZRUhIcXdn?=
 =?utf-8?B?T01wZnhkWnpobHNIYWlvckNiZUVqWU9iVWRPNFJFYkM3Qno1WFVkSWZXNVdh?=
 =?utf-8?B?ZTVad1pBWE12VGFCckU5d0ZITEdGOStvK3NiSmlHbXF0NTh0MHJ5YkdvMHBa?=
 =?utf-8?B?N1ZsQ2Z5UG84VUw4RHh4eHFNU3J2NGM1TG5MKzJKQ3F6L0Z4MzUrcjlWeklH?=
 =?utf-8?B?cTRBaTFLU2Y4ZVdOMHd6a3Y2VEoyd1djZWZzclVRSXhFYXZWb2pzRzR6NkRC?=
 =?utf-8?B?eWtPOVRDNjVxQWo3QmtydERIQWQvM213NVlHZVNqNGJGbGJ1bVdranVFSmNT?=
 =?utf-8?B?V2FOeUxVdkI5dDdEaE9ORXhBWk9FN2ZjYmp4Q1FVYUFzUVFUNmY4TUlSOFpt?=
 =?utf-8?B?R2NrVDB2WXhOR3VGOFJ3ancrVEN6dzQrYm0wOXBYR1MveEVzY05ocDBzcFR4?=
 =?utf-8?Q?vxlv4iBrIlE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sy83MGtGVDRDMkxMNWRXaUlNQnZBTHJOV213VVhteTJCSmZ6ZjVuYXNMenB3?=
 =?utf-8?B?SnlYR09CdzA3MzJMVHFkNmZjTjBKWUlGVXpndFFxbzlFcnRvcFZSUGpQQWty?=
 =?utf-8?B?TTZxeG9lOHNONHAxaWZFQjYzOWYrNkEzQ2hEUWQ4Y25VdVZGRkNsYzY4MXN4?=
 =?utf-8?B?MlpDQ2lQUEpPcHdJSzNTRkV5NDJGTVhkUmRtKy94UmR3a2ZtNVJud0FSdEZB?=
 =?utf-8?B?cjd0eG9aM2twR0JVK2JFMTBzdVc2dFBlY3lwWGF4VjVDNksvOVFsREhtZEtk?=
 =?utf-8?B?R2dHcUZPYmdkWWtORFUyenl3RlZpM1pBWXhnVWRKYnJRVDlDSHgyUDE5OVVi?=
 =?utf-8?B?bDZ5eTdDdVVXSU0xbXhwY2lnYllYeFZnSUVpbktzck1FOU43S20rUVR0MStJ?=
 =?utf-8?B?dmdUNk0vcHFqNVVvbFp3Tmc3MXMxcW8rcTRuV0lHaVl4aGZWOXNXRVZlaE5N?=
 =?utf-8?B?ODFvT3l6VWF1RmpXc1ZKSDV2YWpTaDFVTFR0VUh6ZjZyOTUvUmdYNlBoWURM?=
 =?utf-8?B?TER4d1hINStCSjFPcXNqaWdXWEtDdml5STRCd2lFYjVML3FNYVBic2xBeHdQ?=
 =?utf-8?B?VjV1djd6Yk1ySHoxVWgzWU1SanhaL3RuZFFZOVFmME01TlN1VllzTTRBdis4?=
 =?utf-8?B?TUpRaTVNV1Z3ZUtIcnUySlN5YjROaS9ZbU5mbWczZWp3OHZvZlZqWFJoY1o4?=
 =?utf-8?B?aDJYRzUwNjZFd1cvNGxwM0YxZjFOTFFISjkwbVN4YXkzcDNWNThMMGxjdXR6?=
 =?utf-8?B?T2VXZkEvTVB5VDRmd0gzNjV2TWkweThVRkRER2JqRVJPbWtjU2dWZTBXWmE5?=
 =?utf-8?B?M0Q5TDczUEZYNG5LZnBkVzAvZFRVQjVteWhhajdCTkphVUFNTXIzMVVSa2dF?=
 =?utf-8?B?QkhtTmlqVHNmNHk4YVZ0czc5VldVMmozWk5aeURRSzFPVjJyTDNHWlcvUHlY?=
 =?utf-8?B?SjFDbEEwaTlWTWpkbm8xN2l3TEtnSGIxRHlVZ1oweVVtYU1TR0x2ZklmSDFa?=
 =?utf-8?B?bHAvSnU3Z09jSHZNdWxBQW1WRDRKeUVUU21QU0NrTzIxaCtJZTEvWDJPaUFl?=
 =?utf-8?B?bHFoaytXYnpDY3BLSGZ2Mk1iazNnUXdFYUR5TTF3dXI2d2pHMWN5Tmx6OVp1?=
 =?utf-8?B?aEdneUF6M0pBUk8ycjFlS2lmT0dKSVZrSVRUY1Y0MmRmNXkvbXZ1KzQ4N01j?=
 =?utf-8?B?ZnhINXVBWlUwMXRWVmlzMGEvMEMwcEJkdHZjbStYWWZhN0dvMWtaZGZVTTMx?=
 =?utf-8?B?OWFabnVlRXBhR0FjWnBHMTFlVWozWVZFRkU3MUdvbnRFZGNkUGJ2M2kvUHMw?=
 =?utf-8?B?VmtUMTd1dnFTRVF1aUpFYlRQMU9OMU4xb0NvVi9GRkhJS0dwWU9LRWxMd2Nq?=
 =?utf-8?B?c1ZNc0pFQlVHVXFlOHdWUk1ad2ROUWpKSk5abmxBdDdXaVc3QTJYUzE4QlM2?=
 =?utf-8?B?NlVOdGRNZTJEc2RSYmVyVk9nVUlBSDZObjZheVdqQ1FSVm9GMlJvVjRqbVVW?=
 =?utf-8?B?TElDMHNPTmtNbHZGZ2FmSWw3KzY1RFBwVjhUUFRRQjRNZCsyakFRb0tubFht?=
 =?utf-8?B?aXRkdXNzcXJUNmtpdERTMk9PYzFadndiNVhvZnZwVThLNEJmandrZjk4K2JW?=
 =?utf-8?B?TGJCNzJiNFJOR1hZeURGd0FCYjNGc2JJUy91ZWdFUFBCdEN5ZWlJUmtvcnVt?=
 =?utf-8?B?VFIzc1IvREVXdWMwU1RsS3F5Q2hhNkpDbkdyL0R1MkY5WE9xWHJNVlBnb0Jk?=
 =?utf-8?B?Y1o4QlIweTNZczN6cmpMcEFmNjVYTFFyV0lLRmdGS3l2bXdaRHlQVEJET2ph?=
 =?utf-8?B?V2daS2FhOVpBN29ZdWowaHFRdG1OTlZMRkxCVWh5Q3pJQm9WUHVPeUg0Wmd6?=
 =?utf-8?B?WGlEd25ETnlrMGhSaXkxYnhnZDZZQmYwZk4rVkp2N2Vlb2l1OUFXb3l6YmNR?=
 =?utf-8?B?SlNNL1ZFaWJqc1B0THMrQlRBM0cwWDNRRUl3ZjFneTd5eVZ1UDkxSU85b1da?=
 =?utf-8?B?MHp4dnZteENTcmpFV1JBa2ZEYitOTU1oeVRGeGJHZURVdjNjZ1lnV0tXeURq?=
 =?utf-8?B?VTAwVUxkZVFWazc0bzJBb1VPN3pkWUcrelg2Ri9EdnNBNHdzZ2srME9hV3kx?=
 =?utf-8?Q?jfZuMyCrwJSCXXzovaGj7y3A0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de7f4ab-f888-4908-af16-08ddba29c458
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 12:04:31.1792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dePXwr810jCHbT9NEo6/ysjw+xnfau47AvtrbxVpmeZxQRkc6kznSDHKbsx6Jl4dHjnadcUSvjJ2Vr4Fc55xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8306
X-OriginatorOrg: intel.com

On 7/3/2025 8:01 PM, Michal Hocko wrote:
> On Thu 03-07-25 13:50:06, Peter Zijlstra wrote:
>> On Thu, Jul 03, 2025 at 11:28:46AM +0200, Michal Hocko wrote:
>>
>>> But thinking about this some more, this would be racy same as the
>>> PF_EXITING check. This is not my area but is this performance sensitive
>>> path that couldn't live with the proper find_lock_task_mm?
>>
>> find_lock_task_mm() seems eminently unsuitable for accounting --
>> iterating the task group is insane.
>>
>> Looking at this, the mm_struct lifetimes suck.. task_struct reference
>> doesn't help, rcu doesn't help :-(
>>
>> Also, whatever the solution it needs to be inside this count_memcg_*()
>> nonsense, because nobody wants this overhead, esp. not for something
>> daft like accounting.
>>
>> My primary desire at this point is to just revert the patch that caused
>> this. Accounting just isn't worth it. Esp. not since there is already a
>> tracepoint in this path -- people that want to count crap can very well
>> get their numbers from that.
> 
> I would tend to agree with this. Doing the accounting race free on a
> remote task is nasty and if this is a rare event that could be avoided
> then it should be just dropped than racy and oops prone.
> 

OK, Michal and Peter,
how about keeping the per task schedstat and drop the memcg statistics?
The user can still get the per task information without having to filter
the ftrace log.

thanks,
Chenyu
