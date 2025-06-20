Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6281DE4E7;
	Fri, 20 Jun 2025 15:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434811; cv=fail; b=GKFcrjaze7CwCDqQzcCrWR5MAt3tXYb/PJ54SlRYkyEE/1+nb32ZJ+yIp4exk0GV1NnlcEBLjMDfD48crr0BPBpRWLg0xgDHiYHBq05KKOKBl6RCgs0z0yqRPvhTr0NhUD4Dx/xVJ4pptqQHOLD+MBNC3L7cNgebjM/QsaS7Q20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434811; c=relaxed/simple;
	bh=M50MIfoPWuKh8VHt29o9u1jPKKya0jMk1ZhJQMBVgPQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e0XvF3VlLrB9RRO5hK9w8oU7oczgg7xA+X1VLFuMz1xnmYTNOJIhEGZFaD9BrGOBXAxuTF6WZMmqZUDklyS6s0uEosOVcEFnMsWmb2XVMl1ttBwJqHrxeGYCaOJI7FmoM11VgsFsYyi0WmbfwsFVS5UXB5OgoIPHbmB5prroAv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQpffAt0; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQpffAt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750434811; x=1781970811;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M50MIfoPWuKh8VHt29o9u1jPKKya0jMk1ZhJQMBVgPQ=;
  b=CQpffAt0Xmsf5vDSz8n5vf+WA20d1dwnMy/9wJyONNkHwhkUxhNy1BSo
   X4PhGntgmKPMbWKKUws1DOhR8R1uzKfcz/VjfbyYG8RuvslfTeTR4QlxB
   /TJbHHEBuEB+vgjxDMN3O9dXvtSjWsBLcDuGKevijGvJJs9nsHV+o6x6J
   QBZWwxRtV94vGTzVDub9bD6jJe4O9evtWr2MjxKsbWzQZYyxIMqO74huX
   LJgOJF4o0N7Ds8s9PSy6oQu7GBFjswJJc6NM20NZsU32IJif7Ou3Gzyyz
   QhEKKhcqHPqePLNfq7Wz6Juu25dZMWPSnOlBRdFCGDND82oz+tLfr+8d6
   Q==;
X-CSE-ConnectionGUID: PIMik+DbQ2i1bDSdBPM/ww==
X-CSE-MsgGUID: 18Q+qPgdSF6bSRhgRpGnRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64131523"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="64131523"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 08:53:30 -0700
X-CSE-ConnectionGUID: zxiTlzd/S8GB/VaYYxywBA==
X-CSE-MsgGUID: wCEGivbjTBmu/0O1nac3Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="151476098"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 08:53:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 08:53:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 20 Jun 2025 08:53:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 20 Jun 2025 08:53:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRT2ssKHiLT2a7JQyWllZIRju1ig0CNPQH0t1W0UaOMiRFidS4u1NERM7UWkPYgvaBnBPiTbUbNwirsIk1DV+If8DE2RRUc+yWCBAo7PqcaUT/8WEommSRUoLEsfBJyukXgmyYxYG27TeeRbcUiHfNP0+IiLERSxLNKCSH3yVexVjsYfGhYeW4h81KEpcP7yGPc1GEfPOTo2BgqoVVWNMRz9pfAe8JZf/fztJ4mLc21W1HRJSSJKyQTlLO/mr4aY10DAGgnI5nzH27Mpd4SQikxfSuqbc6z3niZGTOidWCfg2Ee1Y6gIi+D8J4qg5PaoEiMraoqwBFLrj+4a4W9+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=318yH8xCoOZtPvCtlRTBf99z4yetOim7Y/CcdRZgkHI=;
 b=cAuCzxiUp02TfuO9nEPzjmQAsvDsNje2EBfRX7Vr5N5mCGW18tCjMmc9P7PTSFDE1nGnHKmQWHpHwo8+a/3yOVulRViBydtORrvwSXfAWvttXbNBO6+hkn1I0ovRnV+CW2DEuZzRiusMrg8t8xkFu/zbeMk1JRbo26EedfOezoK6mzPLvS6L2MRofy06gOSPkMkSVPvyFq0w2lWcCKixcyPf32E1glu9YfjlC6ENZiQ55RUqOBjVIyXxmylHxNmOCVevGc+LvXCQssoZWP1pc5oGMClK4oyTbDntMKkXd0DBQn7jLuZlHKqGO3PsX8gMWj+UQp4Vb/rsQNEBow6QhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 15:53:24 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Fri, 20 Jun 2025
 15:53:24 +0000
Message-ID: <93df95f2-b37d-436e-9872-b64f14256914@intel.com>
Date: Fri, 20 Jun 2025 08:53:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable
 io_alloc feature
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1749677012.git.babu.moger@amd.com>
 <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>
 <3bec3844-7fda-452b-988f-42b0de9d63ba@intel.com>
 <93d010d7-4fc2-46ee-965b-7606fd2cd5ee@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <93d010d7-4fc2-46ee-965b-7606fd2cd5ee@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::30) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: c084da23-a6ff-4f78-5217-08ddb012967c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnhRRWtsUkZTQzRhZ3Q4RVpLRzRZbTdjVTllTTM5SUNCMzlMeVNZbnVpT0dR?=
 =?utf-8?B?a1Q3U2xJeFJHL2psWDdFeWRTb0JaU2tDMzVlemc5V0JkRVl1bDBZZGZhQjZz?=
 =?utf-8?B?OUpVdjJHckt5aXo2bllkcmNZUG1FOUhLL2pBaWVCejVnVGpFeWxnSW9ZYTVL?=
 =?utf-8?B?Qjh3NUY2RXFId211Um5oZWhyYktIRlFKU3BGNHRsZXMyZEdYMUFQYmw4dHNH?=
 =?utf-8?B?VU00ZEVpUmVsQkI1WmJXMVpkNzNNWTRnZSt2Y1V6VVBnRWUzN1N0Q2txOWY4?=
 =?utf-8?B?WTV0RW55WXBxWDd2emwzeHVFUGJxS3ZWL2dnZC82M1FNeEpwanV4bWJTd2dO?=
 =?utf-8?B?VUxlM29CUHo1YmhydzVYY1ExcVp1WG9oVlU0c052YnFwNG1ZazYzRGZDakIx?=
 =?utf-8?B?bi9wUjd5L0FUMVFJU0MrQi91eXg0Tll4M1dZRXZ3djVjZzhrVEllTzdzNmt0?=
 =?utf-8?B?VktIYmEvT00vdHFJcmZjMmNVYWJ3SDNnNjUxRjl2WXFUajZZRyt5U0x0bkZq?=
 =?utf-8?B?VThYTFR2bDBBQzJsQVdvMEVXRnhFbnY5S1RtQ1EwSUNZZWJ1aVVzZ3ZMZDNP?=
 =?utf-8?B?emVvK0tRdVJrN0hocjczZDJFL1ozeHoyODZYRmI5UXcwSHYySUp1UnNjYnk5?=
 =?utf-8?B?dzRWUUt3M3d0WXFiNFVFYllNWE83bTMvU3diam8vbVVEM3RqbTlKa3BJbVhE?=
 =?utf-8?B?SC9SMDd4Q3RXNzRTWTFlRlNLbkJFUVRGaTFsS2xSbnRzNFZHcDBKNEpaTzM5?=
 =?utf-8?B?Nkl2QmpQWG9WUWc3b0graTFZcVkxRDA1Z0lmMlZFTVEzMGkxZU9ncXJ6aFlp?=
 =?utf-8?B?M3MrTitObDFueEtld3g0MGFuRXN2azFQNEFBU20zeXIwRzF1SUo3ODVlcVdJ?=
 =?utf-8?B?SVpxY0V5cXZPNnNGK3FIa0Z1NjI0MXFwN2lIR1VqMm5BME8vSytmR1J2NnhM?=
 =?utf-8?B?VWVncUk4Tms1SlV5clViOTFUSG9lTEVzMktMQzY1ZTI3cU53OERlaE9mMDFM?=
 =?utf-8?B?cXB3Y255dGRkUk52MTk1VTNSOGt1Q1VhN2ptRFpnUk5YYklJckJzTmdKYmFC?=
 =?utf-8?B?TkJOV3hyd0JtbXlsWUlhcmtqS0FFWk1kZXBHN3dVdlFGbDhYTVRoYXZLaDlW?=
 =?utf-8?B?TzlJalZ0ZmlFaUp5eWw4WCtwMHc0VkNxWXhaWXVMR0pTQWVrZzJSRFZ2aTBH?=
 =?utf-8?B?b0tMV3FiekRUbldEd2lwZEFMdG9sVXFRRTI2Zk4rTjBOdk1YSDlQejMxV0xr?=
 =?utf-8?B?Y3pmUTlVWlVDcmJQSXVFRVpmM1N6Q3AxQUZKN0E3ZGppSmRvRHN5YmM5Yzlt?=
 =?utf-8?B?cWkxd3M1dWFWOTJHbkRXZEdIeHBMMzk5cnJNZTJqc0JnOWQxSVhocHczd2FX?=
 =?utf-8?B?ODB6YzYvMHhIQlJsTVEzREVPN1Z0WDd0d2NONEdIQkx5VEJheWRCME5mQUZD?=
 =?utf-8?B?aHpUQ0p6dlVyb1VhU3NFbmlMbmxYZEpGaTkzU21zU21DN015QmpZZUZxWFZZ?=
 =?utf-8?B?azQ4ZlhVTHlla2hNUDlWclhSKzBMQW52NjFGVFBsc3grcDV2SUtPMEgwOWRQ?=
 =?utf-8?B?Q2tVOG5SZk1BejE3aXAxTmdaeTMxc3lBcExHRWFQeGdnZXY3MjlzTDBiQ0tT?=
 =?utf-8?B?RzVkNWtZN09RaS9WTXFieWF3VEtxWDM4UGFwbkJKSjE1alh2Z0p6SXE1aVZq?=
 =?utf-8?B?K0tDK3RONkRJaXAzL0lIbmRHUUFsL3dIc1lrNHBHeDVROTFvTzZkdEZhSEZG?=
 =?utf-8?B?YU9IdWFFdFNxMlFFV05RUTlvMlhjcS9ldzM2Z0gwL0twN3o2VDNxM2lTM2NQ?=
 =?utf-8?B?SERzR0tUcUhOTk1FVTk4cE5JR0dIR3NXS0F5QnB1Z2I2Z2RvaTVWUGN5SnlF?=
 =?utf-8?B?ZkJEL2RWOVAwZ1lVVUtFRGRuS0pmYjMrOGlKeC9pYlRDRlQrRllWdGV3Q09R?=
 =?utf-8?Q?kW7ttXw7K2E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjlzM3dYMitwOU9xTHlhTmt2dzJDdkRkYmx5Q2dVOHRnU2xDKy8yYkVRRWhk?=
 =?utf-8?B?Wnp3SmhXWkNLNFFmNVNBbVZPemxsWlFLekhqT3kvMFkybndTWFZ1Y21hYWE1?=
 =?utf-8?B?Q201dEwveVl4d0RNejM3aHMvbStoZkZZaDZNeThYL1o2blhET2FRSURMSGIr?=
 =?utf-8?B?MzVuekZuTllGMFJoWCtLSDRCTDgxdlBUNEhSY0JKTzQ2c2w0QndWRk5BcGNv?=
 =?utf-8?B?U21JL2lUMlNtaXkxM0VXVTkxRjNuak5yWE10YmVnekZnemMyQ0R1dE1aUlRl?=
 =?utf-8?B?R2Z6WVNtSXhzM1E2RUhaUkI5cHJSTEMyNy9KSENJUlBnekpZOFhzZTNxRlgy?=
 =?utf-8?B?WkVuMStTUm8xNlVXdkg5SVpiSmJQV0JHY2x4YzdLTE5TZVltS2s1VkZ5cE1Q?=
 =?utf-8?B?ZGczZ0ZGdVROSjFtNU00RTQ1N255N0hLbnJjMDBFamVPY0R6SG5PUHhUL0Zv?=
 =?utf-8?B?cFZrS2dURVVaMDNyeVFiYTFNRnhybklPYklzYi9UWG43NmxiSmhxNGlKWnpM?=
 =?utf-8?B?YjV4Yi9ray95L29KRGlZUVJaRXZWV0t3Mkxxck1zYWlQTjlxak1FeVAzTVBF?=
 =?utf-8?B?enM1bS9kbkI4OWptQW1nM1V3b3NKVFFpYmFtT3Q4enVtRjh2TXI0Q0tvRVhI?=
 =?utf-8?B?SGlFZHdCTXdVSDlyemJMYk5iRE1SSEZIUjJBT3JOckdZb3FSUGJZNmpQcjBY?=
 =?utf-8?B?Y3k0TGVRR1l0NlFVMnh5dkRydjYrZWRXTWRLSlFQNjZHWTIwN0dZMXptMWVY?=
 =?utf-8?B?TFN3Y2NjemIrUXZLRXN5ZmEwV2taZmVyeG9QVklzdlp2a01CTWVrRVllNEVU?=
 =?utf-8?B?S1djb3dDQy9tanN3eU56a29vYVJlUjYrVVFBRlBXQ0VOc215MlIyMEF3U1Zu?=
 =?utf-8?B?bHBQN3BPSzFZS0FCc3puTnYwQXQ5MnY1bTZaRUVHSkRRSUthbVlKQ0xrWFJD?=
 =?utf-8?B?M0M5VXh4ZUlyeUJXTmZNc09rNGFic2FPK0NDSVVKTWhybEZuQ1paSmlocDNC?=
 =?utf-8?B?NmdUdnFObjFkZlUwNzBKYUFTSkJ1M1MxcGd4ZnMzN21lVmhrT2hZNkRILzJZ?=
 =?utf-8?B?Um1PVzlCMVFURWlYa1VzenFUK1lhVEY5NXRFbktmcUFCYis4K3FyelZGdzdE?=
 =?utf-8?B?NTFBVnNPUG9qcXRVYS9qSU5TSkZ0ZGo1VHBySzZHeFMyckd1Y3dRWkZVaTQv?=
 =?utf-8?B?OHRWaDdNWElsRkxWUjFSR1RmZzVuSmoremNpOUdWN1NDbVk1SEZFdHlSQVhY?=
 =?utf-8?B?NFJBV0hzMkJJZFhPeFlZT2RoS1NVcnBqRUZSTG1rYkJWSlFJYmtleVUrZUlk?=
 =?utf-8?B?U3JjU1JPSEk2QkRCdWNhQVF5YnhjRERBZGF1VWR1eGtHNjNQNGcxVkxnRGh0?=
 =?utf-8?B?a0ZpcXNrQUJvcWpiSnRNdmxtTmVIdDYrOUdaTEtWakN4eklpcUNXVEx0SDlW?=
 =?utf-8?B?QTRoNlhnWkxrTXcyV05rT081VjBkNUU2bTJSODUxdUt2ZmZvY2RGZDBMMEZy?=
 =?utf-8?B?MFpxRytINlpMbVV4NlFuWWhCbFNxTWlrdVJkNi9jTXo0TVplTU9GL2xvSjVE?=
 =?utf-8?B?UmtxeHJ0ZjcrNEZrTW5ZQVVRWEpqRkVaeWg1SDVONVA1VFE5VGtBVWJ4b0tC?=
 =?utf-8?B?UjRlRU5BYUdNYkhTMUt5ZTEyVS8rREVkdXVBV3VZdStEczU2NENxaUhEeFcr?=
 =?utf-8?B?aFZkSXJyT0dVeEtubENXUXROQ0M3VHBiVDM0eEo5TTljWjBOemZnbmRXOHlE?=
 =?utf-8?B?NWxFSko2YnFzSS9qWmNCeTFaNjBRNkFBT1hBYjhMWEFSa05xcnJJOElDUE1J?=
 =?utf-8?B?blJtZnFmYWIyQk5BdjAxQmNmcU1ZZG9zQWJXbklqYjdMMGRRYTlCRm9PN0c5?=
 =?utf-8?B?K1Npcy9Lenh6a080a2xFOVpUb3QySjI0VVFLcGNXdlp5Ym0wRkNGSHpaVEJ2?=
 =?utf-8?B?TmVOTHNON0VaSlhKbVpkMmNHcnFtdFo2czRNMHBQamQrYkIwR3gwSTYxUnVz?=
 =?utf-8?B?ZzZ4WWRZL0VEQmZIeWhHTTRaaUJDZWlBRllMWXVSbVF2aVpncW1oNUtJalRP?=
 =?utf-8?B?ZnVUcFVRSEpveTkvTUk1MDV3VmFkRGo5ZFVZM0NyaVoxZ0JaZGgxNEVTbHVR?=
 =?utf-8?B?a3ZiOTZWQ09hTjVaaTl2Mlp4VEgyQ1lvMmx3Mk9BOW8zNWxBTTcxZDRYL2tN?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c084da23-a6ff-4f78-5217-08ddb012967c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 15:53:24.1303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfSdSH8j5L9pwIQF3GB9+R/IOST1v4jx+cjUIFfbl0rDra1nlIfztGp2blYKTb5n+0w0bSixbXxHS2R6Oq3WCuOArNgOT0Sq5Qy0CHwZL18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
X-OriginatorOrg: intel.com

Hi Babu,

On 6/19/25 11:41 AM, Moger, Babu wrote:
> On 6/17/25 22:59, Reinette Chatre wrote:
>> On 6/11/25 2:23 PM, Babu Moger wrote:

...

>>> + */
>>> +static int resctrl_io_alloc_closid_get(struct rdt_resource *r)
>>> +{
>>> +	int num_closids = closids_supported();
>>> +
>>> +	if (resctrl_arch_get_cdp_enabled(r->rid))
>>> +		num_closids *= 2;
>>> +
>>> +	if (num_closids != resctrl_arch_get_num_closid(r))
>>> +		return -ENOSPC;
>>> +
>>> +	return closids_supported() - 1;
>>> +}
>>
>> resctrl_io_alloc_closid_get() seems to be trying to do two things: 
>> - determine what the io_alloc_closid is
>> - make sure the io_alloc_closid is supported
>>
>> I think this should be split into two functions. Once the
>> io_alloc_closid is determined to be supported and io_alloc
>> enabled then there is no reason to keep checking if it is
>> supported whenever the io_alloc_closid is queried.
>>
>> How about simplifying this to:
>>
>> /*
>>  * note how this returns u32 that will eliminate
>>  * unnecessary error checking in usages where io_alloc_closid
>>  * needs to be determined after an resctrl_arch_get_io_alloc_enabled(r)
>>  * already confirmed io_alloc is enabled
>>  * function comment could note that this returns the CLOSID
>>  * required by io_alloc but not whether the CLOSID can
>>  * be supported, for this resctrl_io_alloc_closid_supported() should
>>  * be used.
>>  * Can also note that returned value will always be valid if
>>  * resctrl_arch_get_io_alloc_enabled(r) is true.
>>  */
>> u32 resctrl_io_alloc_closid(struct rdt_resource *r) {
>> 	if (resctrl_arch_get_cdp_enabled(r->rid))
>> 		return resctrl_arch_get_num_closid(r)/2  - 1
>> 	else
>> 		return resctrl_arch_get_num_closid(r) -1
>> }
>>
>> /*
>>  * note how below already makes resctrl's io_alloc implementation
>>  * more generic
>>  */
>> resctrl_io_alloc_closid_supported(u32 io_alloc_closid) {
>> 	return io_alloc_closid <  closids_supported()
>> }
>>
> 
> Sure.
>    Changed the check to
> 
>     return io_alloc_closid == (closids_supported() -1)
> 

resctrl_io_alloc_closid_supported() is not intended to reflect what the
value is but just check if provided value is supported. By changing the
check to above resctrl_io_alloc_closid_supported() does two things again
(what the move to new functions aimed to avoid): checking that the CLOSID
is supported while requiring that it is the highest supported CLOSID.
What issue(s) do you see with using "io_alloc_closid <  closids_supported()"
as the check?

Reinette
