Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D426514658D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549904; cv=fail; b=BD66SLMUSMZ18WEgLpAXmi8KyTb58rw+uT5cIk2crmggtlm8mIx+q8VZvE2xIt8J8wvv9qMhnyQOCy7eBvXict1GPG02RSYsTIJ0yw1wozgkUdlsnC2KWT58QE/jiTsUKjufay684UOBzam/F0pZ3RD9q8E70KDDXO0BbUQuEr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549904; c=relaxed/simple;
	bh=v8OuOur1ejQidxRbpmrH9Z37n0ot4hbFmOGHCVk0CNk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ANXJwtv+LyGyV6XmXXLo0tND2jQ+nv1wJCKufrkGRmO0M2fGtG6svtcJ6im0viNnz8WZe4tjy4JGT7ZF0Q+b2mWbkOODSVNshlxO1Iw151BC6mxK/B1ZGYluBH6vpM/muk57Ob8O4u/qk2X/t5bBLsj1f2Po+qO9XR8r6Pp4/VM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kY7SuGKt; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kY7SuGKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751549902; x=1783085902;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=v8OuOur1ejQidxRbpmrH9Z37n0ot4hbFmOGHCVk0CNk=;
  b=kY7SuGKtrDMz4loI/YYvXS4VoC0MgDy1V5jait5M+XagkJymbPwCcG6d
   B1h11CPE1FZq9xjSeZRON1QPw0MquggRoNXjsJWKxXgALJZgwtsePLq6t
   AZSO83OVjvxT4y3kDWuoO3YeI4zVzY88SzGmSFY1OiSgVvSJRiPdJALsb
   SKw5eKi7rwrsggYvag+pQ0LS9qto9qO0QQrTBBsr7JkDi6om3me26TzDb
   w9hmwERmu0kR/ByeOQR3h7aZ6regBs8AgrsTjUFn0bJ9QG0k5aWVLxSig
   RpYQaou53SQ3DjrQfFmHzEZhjN3wjPM9hzXf5pKYu8hZfOLbnsiYkd9tu
   A==;
X-CSE-ConnectionGUID: eoJw6OuwQpyW8Cf3ZRl/7g==
X-CSE-MsgGUID: hxG0Gy6TRDqD91T5es5HYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53990209"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53990209"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:38:22 -0700
X-CSE-ConnectionGUID: RtR0fEwHSt+HHokPsxihrw==
X-CSE-MsgGUID: sMTVto4aSnCrCaPOt4w8Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="158934222"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:38:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 06:38:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 06:38:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.49)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 06:38:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDZsXkz35VVeVtomVr8vp4nY51qRFi1GBzE1fZQIh7KYPUUTNQKHUf/LRMohbGPaEQGgU3LvorbKrk5Q+HaEhrROzwplY+RAE6hFu5nS4pzho0SgER4VDA8d+2Mle7twicMs4NioU9b0MH+XKzlP3zYOA1fQoDHpTf2caqYPet+9BY97TDpFzN0dXIShgL/6At3sHwoX528tuVq9jQdxrB42fQJleI+VdvuXColJYuo3N+Q71YH2CyYZdq+aO6KWQdGmq5xESFQIw0e0aarlsqnbTr8xrRe78QbFQsreqdMJ8Q1z1ciBY3wlOI5mHOQvFesBVy5rsZZ3jxvk6GTzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TDcVzHR/FU7HmG/uj8lPs1oTRWSdEGOe9oM++2hRDU=;
 b=jwLrcZqbKdoJECXJZUo3lx4uV1siuQQeoQmQkDKCPH/PxboLGqHGPoLKc/PYS3chMjN2oyOFZa1bRZUT/BPCO1R1GttapygDB7vL6mAP6cHTVH8Z0qtCuoEPwEFxE4VvFcvMmb8r58ZjsRY7l1jn+J1sfvlfHRDHz2HB8+8Q7JOp3Ytj7veheeNjUAJINyK9cl0n1nVjAxZLQ13NH5t6SEMfQbYgjPgG/iMzHgBF0u6ni+NapPujQUnhDhLEdHEKfivbqIBgQZt4BZboxIEygJjwZb2wJkLrA1yk+Uch8yWaz85eTAGjS+Qxq1KctMiRFFsdUpHopDlvW8Jx7A3JxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA1PR11MB8320.namprd11.prod.outlook.com (2603:10b6:806:37c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Thu, 3 Jul 2025 13:38:19 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 13:38:19 +0000
Message-ID: <b96a326c-7ca7-4cfe-96e2-28c1dad5c9dc@intel.com>
Date: Thu, 3 Jul 2025 21:38:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
To: Peter Zijlstra <peterz@infradead.org>
CC: Michal Hocko <mhocko@suse.com>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Andrew Morton
	<akpm@linux-foundation.org>, Tim Chen <tim.c.chen@intel.com>,
	<linux-kernel@vger.kernel.org>, Jirka Hladky <jhladky@redhat.com>, "Srikanth
 Aithal" <Srikanth.Aithal@amd.com>, Suneeth D <Suneeth.D@amd.com>, Libo Chen
	<libo.chen@oracle.com>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
 <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
 <aGZxFRVxHouLaMPg@tiehlicka> <b4891cca-4da3-4411-bc9c-669118bf825a@intel.com>
 <e944b504-a852-4f07-a514-7dd99e63b888@oracle.com>
 <20250703123626.GW1613200@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20250703123626.GW1613200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0115.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::19) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA1PR11MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: d8778c7d-95b2-41bf-266c-08ddba36df20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cG82YzV6YjlIYWluZWJ1cnVDWEUxZzRtZ1Z3dGNNc21ROWRQK1hXUjQ5Q0Zl?=
 =?utf-8?B?dU5hdk16SnF3ayt5M2JydWpZQVpQcHpZU0lBWkdhazhGYkN3aFUyNXhSZzA1?=
 =?utf-8?B?cXRGRGlRNjNRSzZlU3lMT3VuRGtSVjJrYUJmQ1J0NExJcWdoK3d6Rkk1RXlG?=
 =?utf-8?B?elJBUmxVVmptcDRFMGFPaVFueWZIWUhpNmp5bitlek1LeGx3R3ptMU10MFR1?=
 =?utf-8?B?Q2N2WUszcTZNQVlCTzI4Ung0M2J6RCsvcGFYdGJYcFJMT2xPV0RXYzU5bW9J?=
 =?utf-8?B?RENZc2tiY0xDbGh6eDhpYnkzWEZ5ZzVzd1lMRUZ2WDNjL2NqTm9weGx5M0xC?=
 =?utf-8?B?cTBDT2FhVzJHbW5tQWFjYWliS21iRUZiMCtkR1UrVmhOWGNDZmk4aFZaL0FH?=
 =?utf-8?B?ekphRmRhWkowWHk4Y1Raa2ZGdmRFSHVpV3BIMFA5V0FLdlZmY2NOMU1ZRC9R?=
 =?utf-8?B?WEtEYjhvZ3ZZOW5FVmhlTnNMZnhycXlmRGdHL0YwQnZUaWtiOFdaZDVDR011?=
 =?utf-8?B?SmNXOUtVeE5RY1g4WDZweTdVc3lsMmRZM251dXVtclFiN1c1WTNUVGRDYTRB?=
 =?utf-8?B?ZXorRWVKN1FTb2d1YjRQUHUzQWF0Y1d5bW5vZThKSkNzK2dSemp3eW5Zd0NS?=
 =?utf-8?B?WFYvMjJ4OEVuc3Y2dmpNVVJvSXRobVNtNXREc0kvUnJwei9kcEdPQ2VNSmQz?=
 =?utf-8?B?UTdmYWFKVEZnQTdjRjk4aEJURzNKZmRFY0tOODZLNWljWS81eFBpTjRDaVgz?=
 =?utf-8?B?OFE3VWx3R0Zwc2FVVVVqTkhwQVp4TEpTUTRSQnBSWkdXbmtNRVNVQ2JxR0Jz?=
 =?utf-8?B?SHRXZitHMlhSd0orc21sb0ZEanVqUU50VWhZNmJEeld2T0Y4ajE3VjdLMEhV?=
 =?utf-8?B?VjVadC8vcmtGL09FT0xma0YxUyt3NFpwRTNzN1Q1RzZyU0lFZHNiSzFHblVz?=
 =?utf-8?B?VjlWRzF4UWhCMGpWTGVNSXU2bFdxdVVLRWFwU2pFa1BGLzN4RGVGQy9iUmpK?=
 =?utf-8?B?RlJGSVUramJzUytDNnoxZ256NVUwc0NHNUQ3N2dKZGFYUGUzdXFlL3krWWxR?=
 =?utf-8?B?a0s0Q0FtSThVNFJVYitxMlA2d0xFSEQrNzRWd0RBUkcvbzhDdlVwUGxnTjVX?=
 =?utf-8?B?clIxRU1UKzNsajVITk9wM0NpSWE0a1E4Y2ljNldMdVRNYlA0SXdmRWFmakpp?=
 =?utf-8?B?VU5Da0VYc0I5dmo4SUZNOXhvbHlqRVA0WloyK1d5NTd1cWc1bDg3SUtOamdm?=
 =?utf-8?B?RTR1Q2dTbWVPTkZ2V0lFbmQrSTY5azhCRmhIcVVCbWUzS1VGaHZNWkZHc1dC?=
 =?utf-8?B?bFVjR0RTZEIrM0NTM1Z6aXdRaUhVSnB4TmdJS1JtaXBFYUxMMWlKbk1NVERz?=
 =?utf-8?B?MFRWMXFoZ1c4K2xqRHpDTGxseGU4WHVBSmVhajFvYzBqUFFaSDYyOWZUK01V?=
 =?utf-8?B?SytzVUE2S3FNd0hjRndLQ1dka2I5WFRlanhVenBQWVViQVdkRjNXOUFJdlcy?=
 =?utf-8?B?aUs2VExmWE8zNFU2bVFkV3FTUmttWHVyUDdFUXB5dnQ0MTQ5akdSY3JIWDNJ?=
 =?utf-8?B?UkEvTXlVeHp6UHpTMTV3U0I5UEU0d0pabFBPeWRudUhOS3dlc2NxQzNYL1pu?=
 =?utf-8?B?Z0t3YThzYWF4R0ZxTlBYZHk1dndicWxZQ2xMaDlUVVZabHRmR2dTT0xlbzBG?=
 =?utf-8?B?N2JFck9JcjIzdTJpREVtUENwL2M5aGRncFBkUEVGTGR5d2pXd0JCcGhUUGI0?=
 =?utf-8?B?cVhteXNDY1dvVGpoZi9kZk1zKzVETXl0WFg4Mk9VemdyWWtjd0lvZmZxMGxW?=
 =?utf-8?B?N1JoVG5kYlFreit5bDZnMWtPZG5kdUxqRmY3NHBhYUY0TkRzZDg4eVZ5ckNK?=
 =?utf-8?B?eUtZeHpsaXJTVkdKSkZnVTl3cUtWcWppemhHN1h4Z0cyTlljN0s2K0Nva0FE?=
 =?utf-8?Q?34kGdxva8aA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmNpbCs5eTc2SkJpenExNGplcFpnSER6TTgvcE1xbk8zZ0RlRlArNjhJNThX?=
 =?utf-8?B?dWRSSktUY3lvZi9xR1kzOWdURkFvRmREMURRSitPNVJLcHd5YzZyd3YzUjFI?=
 =?utf-8?B?Z0pQTzlPK0hFOEpubmlyWE4rcjltNXVIZWxpTTFBanZuTWZTbW4yVHZTeTky?=
 =?utf-8?B?cml1clpSUmZpcURDRlRVTTYrUUZhLzJhcGdveEg4aHRNRHNYanVrNXI5L1ZF?=
 =?utf-8?B?QXYzV0R5QkVNd0F5UytEaUQyWkN4RVkwTEYzWm5tM3g2RjE5UzhHelczZDc0?=
 =?utf-8?B?WlI4TjFyNVA5KzVFanBYVGhjOFFMb21RWEQ5eGM5NlNmeUVPMUJSS0RMdGE1?=
 =?utf-8?B?Z0xEaUY2N3h2cE0wUDRmcUl6WXBweEhnSnFFNXFrdFZuT0Vlb1l6blh5WnY1?=
 =?utf-8?B?ZEVXbUZoZjVFZndPKzVwWm9JRGNaME1vKzg1MlordXQzSk5GazhzWDlsZTRs?=
 =?utf-8?B?cmtkajhqS0NiejFYQndIMmFqblc1R2xrM1BUK1RDTGpWNllPUElFbnNRM2hj?=
 =?utf-8?B?ZVh0d05JSjJSVkpXdEViRkthNkFTcWNGR2xoTXRjRzdlVUluM09aTGR1VFBQ?=
 =?utf-8?B?V2tLU2xMU3hQekN1dGpUY2w1S3MydnUraHM5dmVLRWovMDFMa1JnZHJ5UmdB?=
 =?utf-8?B?V1M5SUx5S2ttTGU3WmlzNG9xZWMwWDh6bUZ5bURHeFFSNHozOVI2cklXTTJP?=
 =?utf-8?B?R01HQ25FMlMzQ0RMR0tsV3BLQlF0RlZiTVU3amc1YWpEY240ZWlGemZMVito?=
 =?utf-8?B?SU50Ym5JKzk3L0hUSFl4Z21JL3hocjd6elF4ZURVc3VuKzlzQUU1UWhiZXhy?=
 =?utf-8?B?VWI4L2FRZ3hzTS9WYWx3Ty9CRlFIZ2dERC9qYnQ2NUp6cjR4MjVuVnVLUG8x?=
 =?utf-8?B?VkN4aFpDdnNhSnYzS3RNUlpxeFdrZE1LZFZYTHZZV0k4K2VFblNydTJtamtT?=
 =?utf-8?B?RTAzZXNUb2xwOWpDOXAvRGowSGdVYllwaXNkOGQ2bVhwdCt4WlRyZGY4cE5w?=
 =?utf-8?B?Nzc5Njh6YmRoaHhMa1lIRmx1bE9VTzNhK3dWc0llczBFNnZmOUlwdngyZk1v?=
 =?utf-8?B?SkhQbkVTL0EyNTNveU5XS2h4Q1JRRUUyZlhIdHRZVXRaLy9EeTRLMzA5eGxi?=
 =?utf-8?B?U251NjN5VVBzSzl6bUlHczJ0d2ZMdmZJN2F1Tk1tNVdyeWh0RlhKemtRTUVE?=
 =?utf-8?B?a3pQQmxIUGJPK1BKc3hQbDkxNHhadElyeW1pdmtTOFI0NG1iQjh1YTF2UlBy?=
 =?utf-8?B?ZU1uTEtoKzdNWmJlN1RITUZoMHV4QzV0R2g1aCtZNHBKNzlxcFduQTRSUkF6?=
 =?utf-8?B?QUZkS2YwUTltNVNPbXZLb095dmYvOTBsSGNDMmQrMlFMSk1URkVNUjF4MFV1?=
 =?utf-8?B?cm5QNThBMFdqMzV2aVR4dWEvS2NVb1NmOTRxcDdRTmx5cXdhRDJhV1pNRmRH?=
 =?utf-8?B?UFlWWU9yUk4rVUtGRyswV3QvaHhpcXZoYnRXbDVIaTNkU3UweDcvWkJPMFEz?=
 =?utf-8?B?ZHVwaGpTK2d0OXUvRjVtQ25yWFpoNWF3WHRiSVVMQmw5MitlZC9sZ2RqZldS?=
 =?utf-8?B?NVZTRzVqUEdlWFBraGZQZEZ6RUxsNnc3VHVBeDJ2aEwwTCtueWJyazF5cHRD?=
 =?utf-8?B?eERsNXhNOS82WDRZL2lCNzNJTkFENzRGclpZU2tzUkszd0RNZm9BZExHL05H?=
 =?utf-8?B?UmpJdEw5VUFUM3NhNnFjQ0kvWmRXQWxvemhnZmpzT2FKY3NvZ1h0L21Ramoz?=
 =?utf-8?B?U3huazRzNU9GNXQ3OVFYdDRVK0JFdDQ5L2pSbmQ3eGIvRk1XNWpwN0pBMmFV?=
 =?utf-8?B?dUsxLzMvcHVEK2JYRStSa0JCRUNEQzY0RytrUWppcDNYOWd0cFpjWUN6VVpn?=
 =?utf-8?B?THRMd2ppaE12RXpVUUdCek1wRktudjdmTUtqU3k2NjkrV1lVMmEwKzRBT2Rl?=
 =?utf-8?B?ZDlsTGNHeXlGenFJVUVabmhoRnI1KzZ6SEFXd0JoSW45ODBXQ2EyenkydHND?=
 =?utf-8?B?Yzdpck9GVkNxR3hSd3dPVGRqRXdyenhCNmdZNkRPMDVYemw5WXplcHpTbVZ4?=
 =?utf-8?B?ZzJ5d2xJNEhodFY1eTZXTm9YdVltdmROSEpOd21ZNElFNWJObVNrV0RlMHNC?=
 =?utf-8?Q?6/VqfAb6vfNFrT+A6ArtYcMbL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8778c7d-95b2-41bf-266c-08ddba36df20
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 13:38:19.6869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ux9rvom3r7LrvxSHoOABmL5WRUqBgK2zbdpFSHLs5Z6KQBSY4aI01QjuzPgF+LOLStiDHThP1RCMh8WVwJDuCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8320
X-OriginatorOrg: intel.com

Hi Peter,

On 7/3/2025 8:36 PM, Peter Zijlstra wrote:
> On Thu, Jul 03, 2025 at 05:20:47AM -0700, Libo Chen wrote:
> 
>> I agree. The other parts, schedstat and vmstat, are still quite helpful.
>> Also tracepoints are more expensive than counters once enabled, I think
>> that's too much for just counting numbers.
> 
> I'm not generally a fan of eBPF, but supposedly it is really good for
> stuff like this.
> 
> Attaching to a tracepoint and distributing into cgroup buckets seems
> like it should be a trivial script.

Yes, it is feasible to use eBPF. On the other hand, if some
existing monitoring programs rely on /proc/{pid}/sched to observe
the NUMA balancing metrics of processes, it might be helpful to
include the NUMA migration/swap information in /proc/{pid}/sched.
This approach can minimize the modifications needed for these
monitoring programs, eliminating the need to add a new BPF script
to obtain NUMA balancing statistics from different sources IMHO.


thanks,
Chenyu
