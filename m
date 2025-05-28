Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A656A2D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748391268; cv=fail; b=TBnqVvSPT9rp3mHFGeoxa7wxAZNjc8S/wnCv7dgdsbNT7UCa2iMipU/5UDjOICAR2KAknSAZfet1mlvOiBzwKPRKRxtYH6HWaQnBRT0EdIcn/7PlcFAVGUvF02CNY2VC8dGNoffxbbBIRMycNXYnQbobapiQzvNoc5i4cqQcyp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748391268; c=relaxed/simple;
	bh=TCZR7TFFuGtSqkjlPtuUvRtV49bbmL3Wvvf6tCcgZco=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eEhKhpeI+P6JYQhJGjaIfNcGhaxNz3wRF0lL1EWoyzNvcHBUt/c53jb0Yib+/aO7lXivP/tTFx/OHb90dPdu1lifYjLHFUqOj4Ij7edhlhRYCztRUzJGne6n3S6OSe6gUnNw3YpKBziLUrLy+aVrW6ygSIEI9tgIG0r+nB639YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVcL3J0G; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVcL3J0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748391266; x=1779927266;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TCZR7TFFuGtSqkjlPtuUvRtV49bbmL3Wvvf6tCcgZco=;
  b=TVcL3J0GlCOD934OsyZCbfrT+HWUmuYMBscfnjkDSWi/0oq2R4wN+csm
   VPrZzrGDVlY6eRjddyhIcqXCWio4JT1K3ZA6ypFFI3o9n1+zabL3JnrRA
   cQPdzGZZXjQBM8HUn5MCSO4zBxLl/PwDH8SkHKWdr0xUYehclkJ+6lc3k
   QaZFlaQyeB7JH7WXSYANAP5vijSHqqLch5ISLbKPA+XirX/TkXqlYRf0o
   NkSc0x1pz+VNeOIdut25lZBYfz99hNQPx0cMbjntHVltUoMJojQ6wlrcL
   5ei79vr5F8rhAHXYDekR2hoPS9Y6kQ1jp03PfHbiGYLKp2zHxc+9ZsZH6
   A==;
X-CSE-ConnectionGUID: wCSFD31FS02hSDQ1fLd2tw==
X-CSE-MsgGUID: b2dc0nGDQf6wq4o4Eoj0Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54199701"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="54199701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 17:14:26 -0700
X-CSE-ConnectionGUID: YSG0vB/MQKu250FtRV09mg==
X-CSE-MsgGUID: wH7i1AIiSdSSfeeKBeUyTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="148170175"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 17:14:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 17:14:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 17:14:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.63)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 17:14:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bznrhi60EIfFilE2MD2kVGDlFO67u6g/Rqfqzg5sYpKKbymf2FV7ET8oYbwALMSzcg47dcl+8L+g5kbJ2AyZ63fZfHSnJYwX5kf23ELJF5M9TDmd7Qs70rS2VyxBfiVukRVQi/duMGTV0dyb9Lrr3iDzhiqM+xbJ03suciw61xc0S2VvvD+1C5RLGnpmppWV4josyO6vwpDisGkEJCoZpizizC/oXmrR+W2TAf+6GEewlPSlk/673mujUrZgPr1oLLtYYDHqr6NVzJq2KP8v2XicryNYfSkRYMvwBgv/f1dYBDPqUlAMQdLKxq542hq2eeuxg1vhuAtzGvim30tkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCZR7TFFuGtSqkjlPtuUvRtV49bbmL3Wvvf6tCcgZco=;
 b=Qf++KaorV70uQNfR000xzOMt8rNKWpx8Kk98a+Uy0db15ckoIRjKvDrfP9iye0FeKt1A9k3gqqP0wUN/l3OEynNZGwFAKK5eGUUPafVM6Xz+5WHgalp46DNtYuSKPAa9/jcvtuFVhASXGaIWdoMTC8oPz46FUvFohLQXWkhzMpXhiF8v7gxA3vAPa42hGtiGFc5pkUY83Ho6HxNI1BZk0AAi+XrcR8yC7tVnoE4/fTmReoGQ17crvfR1+BFA7nyiAYfg7yTXz6QS5Iaz79CmduRYAJWESLxtaHQk2vF+vzhIwHsonhNPEi79JVig2Re3bcK85EU5QlMER++XycSBSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 00:14:17 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 00:14:17 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>, Qinyun Tan
	<qinyuntan@linux.alibaba.com>
CC: "H . Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Subject: RE: [PATCH] x86/resctrl: Remove unnecessary references to cacheinfo
 in the resctrl subsystem.
Thread-Topic: [PATCH] x86/resctrl: Remove unnecessary references to cacheinfo
 in the resctrl subsystem.
Thread-Index: AQHbzhEhhh89erV+b0W0jZM2djh1HrPnJCaAgAAJQhA=
Date: Wed, 28 May 2025 00:14:17 +0000
Message-ID: <SJ1PR11MB60838CB8BB51EA5B7B9261D6FC67A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20250526073744.62520-1-qinyuntan@linux.alibaba.com>
 <c4382156-a51e-4d07-9ccb-e6db2ca9d719@intel.com>
In-Reply-To: <c4382156-a51e-4d07-9ccb-e6db2ca9d719@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|MW4PR11MB7006:EE_
x-ms-office365-filtering-correlation-id: 01f8640c-cb4d-4b41-092c-08dd9d7c95db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?enRrRXdjODZJZDBsTlZ3OW9JNE5LR0VoTTlOVEhBUENqRTlWN0pveHc2ZUZT?=
 =?utf-8?B?SnFVTGNnSkhxbFdvYTNMVUgvSXRYWkFPRjhIRnArN2w0dTcra0NWczAyNzZI?=
 =?utf-8?B?VlhkaDlGR2lLWU5PTkhVK3dESWx2MXV1OFpUMUcvNk5yMzdweXc3MVlaRitw?=
 =?utf-8?B?Qm9vUzEvY2F4bFpTK0Q0cU03dE5FWHI3bExpOG5UNUYxbXBNYjRHVVdCaHhT?=
 =?utf-8?B?cWtpaGtCMW51eVR5aFNyWHFzc0J5SSttUUZ4RUU3c1ZtVEdWd1NnZlROejhJ?=
 =?utf-8?B?THpJSllQZ3B3ajNONTkyTEc0TEZZSnQvRXNVaUpISThvc0tQdGxlbGtsVTFu?=
 =?utf-8?B?aEo2MHlMb3FES3dsNTZzcEFpVHlPR2VQU3dRRVdFeGV2Ym9FYTc3NGdsNkpM?=
 =?utf-8?B?U2kxQVlMY3EwdG4zZ0NTQ1BGWHg5SmFxTFhBRG1MbjVnTlF6L2h4UXNudUo3?=
 =?utf-8?B?b0toRjZjdUR0dW5Rb0dVTHo1cWp6Rk8yMFk1OFo3eWduMmNVcEs3SzN5NE9B?=
 =?utf-8?B?UGYyM3YrVTJ4QWhnVXBZK3hyWTdBU3N5ZGw1ZW5MaVg4M3VDMFRQL2RoRUJE?=
 =?utf-8?B?a3NWdXhjZGlmUTlUYzFlVkRhRjdXMzZ3bktVa0VMa3B3QnlSYVBFOWRWQm5R?=
 =?utf-8?B?U3p0bzYrTnM3RGx0THFUZU03dHJXN01YbS96Y3V3MmcyVlo2SVltb2xxWUJm?=
 =?utf-8?B?Vmt3Sko5aWZHaUtRdFRLZWorU0ZoWVFLSDlmV1VrNjZnaGNpS2RlYTVhYVJH?=
 =?utf-8?B?RWtnZjJxV1dOWEZNM3FTbzROTUsyUHBCcWlBZzZKVG9NMGpOZGkwS3piSmFl?=
 =?utf-8?B?R2Nsb2NuYmtEcldYUXdPTmJNcWhIclVCbldiUHFUbnRDcUVtcUtiZkdXbjB0?=
 =?utf-8?B?OVgyQjdINzZ4dnk3OTFXTUNPZU9ycHA4bFJNaGloWS9QWHhtcmFiMEtaZGNw?=
 =?utf-8?B?ZUhvMnN3Q1pnclNackJIR0M3ckNJRUVxOXgrdExrcVZZVmhDMmVHN2JmNVp5?=
 =?utf-8?B?cGd2ZmNEOVRsSEJaOGh6c3hNMmxJR0UvVXFYSTJjQzB5RDBOMklVTDNkQ0Nq?=
 =?utf-8?B?RkpnV1RhZ0c1SDg2cklDUXEzK0djb2hZT2VkYmlHYm5mM3J6QjNTaEVCbFBR?=
 =?utf-8?B?Syt6QlRtYmhLVmsycjV5eHhadTNZSEhFSTRTUU1QOUN2OCtHaEJSQ2pvT3Jj?=
 =?utf-8?B?TTJRaWdialljZnBIS1AxYllwWkZqbDdkb0JIaUE0ZWc2NTVMTXJHWFVLZHY3?=
 =?utf-8?B?YTRoSC8wdXVOd3lhVnpNZjMrZ0x3TjBVWEQzV092ZU50ZEdKK3ZNRExwVkx5?=
 =?utf-8?B?QW5oTkF0OE1RNDBXbjNLemJvVlR6M21vMFR1WisrVlpmZmI5eEtSYkdmclox?=
 =?utf-8?B?ejdzSGE4RTIrdVpmckRGM1VFcDMzZkFQSmVybWdOT3dHZDV3UUs3U3pUalJj?=
 =?utf-8?B?d1llSUdweXlGL2ZucXhXVDBTUG0xcExud1hDSGhvSUQ1U2NTZThyaVQ3YjZG?=
 =?utf-8?B?ZUNFRUlHdDBMWi92QmxPZkIrWDN0VUlHTFluTkFWR29YV1FUOUlUSGdXb1Yz?=
 =?utf-8?B?ditpTkFEVTd5Sk9wUHk2YjVISlI3d3c0azVaYlI3SWg2VXFmSEhNdVJ5a2ho?=
 =?utf-8?B?SUNNZXl2UlJSeGxUWGtlWHNwRnpxVVcrWkcrUWFza3lXdUZBaG1peUoxVnQz?=
 =?utf-8?B?Z0RBdjlSaGx6T2lUa3U4dHkxbHhVQy82M09TdE4zT2piY3VOdWxzYnppalVY?=
 =?utf-8?B?UDJrVzRMYk9UMXhXeWNMYkFjTi8weFN1bHhMb2pDWGVRV2ZoWG1VdWd0cDYv?=
 =?utf-8?B?NWJJNzdGQTk2RjhNR1MydlV0VjNqamh2QmMxODRqUlZXanl6ZDJPNlVpMldN?=
 =?utf-8?B?NmpHU1BNbjdTaVdTdTVQS2w1SkVTTFRHY0VaRWdkWWg0RXJQWDkxNVZLS3RJ?=
 =?utf-8?B?MkYyV1ZmRHloVFFPb2J2SFpzbHlLWE9vZlNtS0pvS3JlcWRUSFNWUWJUcFlN?=
 =?utf-8?Q?uOIgiLe6i+i6G/ggYDYgQEPpXwFMuM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXhXaDVIdlZwWGt5QUJGNkMrMXpBYzNWL2xGS3kzc2VKWWwwbDRBMXEwWkho?=
 =?utf-8?B?bWdwckp0ZkJHZ01VdkMvMTY1Z042NmNCWjNFT0hWRUZFaDExVmdaVG1XS2x3?=
 =?utf-8?B?WnQwaFZwUjFMMmI5Y3BvUGdqNUk1TFRRMTB4eXAwY2ZOL2JuRUQzMEpJUysw?=
 =?utf-8?B?U3dsZlgrRHVhRGZUQks1TTVtdklmQ083dk5jYjJzc2JGa3NCNHhWaHJMQVJZ?=
 =?utf-8?B?V1dTckVyT3g2OVRXMlFMdHF4RVBNNWdBZFdhd2NZdU5pemhYdHJhYW9hUjlV?=
 =?utf-8?B?aEVmWk5kS3YvWllDOW5sK3VsS2J6TXdFdTNGaWtSWFljTmJkSGlqL1dTZVpq?=
 =?utf-8?B?MGNFb0k4RDR2K25aekhTdngzZndiU0R2WU5YdjQ0Y0h5Z0pWcFpEZmJyamRl?=
 =?utf-8?B?Q2xtNDBqUjVhRWpuMkhjbEt3RlB1Z3M2YjlzdSs1cEZTSDlKTVpaeEk1bldJ?=
 =?utf-8?B?em82cUM2S1ZoanpRdDhxVkR4MWtsanVpbGFOeDQ0NFErWWdvVmFOdWhUWHE3?=
 =?utf-8?B?bnRPejJ4RWwyekY4TkpwYWxBdXpzWlQ0cnEyVE9kVjhmYjFIVy9DcCtZQlpp?=
 =?utf-8?B?dmhyOFh4VSsycEE4aERkb29TT1VqdWFZcTBURXBhd2cvbXZ0REhyWm5VUHpL?=
 =?utf-8?B?NzlKVW13RnlRdjl3UkoxeVUvdlNXSDFyU0RXcHZoc2cxSjhobzBoY1c5RGJP?=
 =?utf-8?B?MDVnU1hGcGZJWksrdWhkY1ZySzZjQ2FLMDN5L2EvNmt3YWt3RWt5QklXcC94?=
 =?utf-8?B?OERGTk1Fb0UwOTNoWTJSNnMycG10Y09JQmh4V3F4L09Sa3dNVjIzdGdsZ0Ex?=
 =?utf-8?B?cTVVMFh3ZExsVTQySGdLK3gvWWYxWVdXRHBBNGdBUC9HUktGRUxMU2ZjSkxH?=
 =?utf-8?B?Y3dSZUNFbzdDOUs1d1dPUzl6b29VRU5oWVhlMFFFbmJiSE1XR0ZldVNDL0Jq?=
 =?utf-8?B?bFZYRDBaQTIvSHVqU2YzR3VUdkJHVXV5OW5ySUlTUHFhV1FhTjl6SjFVMmVD?=
 =?utf-8?B?aDBpc0V2MXN4RXZ4RGdkYUVNU2ZocXk5QS9jR2QvVm5wa3ZGcTlBbWhlVEVW?=
 =?utf-8?B?UExqRThyeG41WElhY2xzZlA0QVkxSVJzT1hlZ1I2a2F6dFplNjV2RGJLb3dE?=
 =?utf-8?B?WmdnK0RPU2g3WmZERHJMQ21TaHRybGtUaUx0cndySW82TXM0TEVDaExITjBJ?=
 =?utf-8?B?Z2FTdWdkV2NJR216M2VDc1FyQk1hT1c0U3NhbU4wbklKOFBwelcwOStXNk9w?=
 =?utf-8?B?VUxiaTI1eFdvc002RUpLMmJBUVQ4TDM5Szg0NzVTMFQ3d3VMejYyNlpvNVJV?=
 =?utf-8?B?UWZsc1h1VDIxZzVFM0lxd3dnOWZiQ3dwbE00L1NCZHlvZVFKMHVPR3pnZFVt?=
 =?utf-8?B?aTgrdERjWlBnTEhOdjZyMk9TV3NtcksrWUpHU2lESEZsTnZqT01zRjFtSXUv?=
 =?utf-8?B?L2dxcTFiT25oWlpkQ3FqamZZWjVRNHBlc3pQMENSUlFQSTlKNDc0NEhYRE0w?=
 =?utf-8?B?d0FaUHVKS05sN2lsd2VOVmNhUGVEQjlXdk1nMEdSTTlxQUFGbzI2K29ZVm1a?=
 =?utf-8?B?MW0yd0ZpMWIrdngrdjFmdFZ2em9FMWx4OXl1S21wWXFkUFFKWTRZcHlNRHEy?=
 =?utf-8?B?eWM1N3hKSEUvOWNqUFhHOEkzVVVWWDM1RWt5YnN6UCt5c21Za284bzY3cTZJ?=
 =?utf-8?B?ckhEYW9iUGdGWEp5Mmt2SE9mbjBwK3J0VEtvU2dUeHZ5S2RFTFJFdzVJNXEy?=
 =?utf-8?B?STlNK1lDcWplc1NIZTFSaGZCYXNXT3U1bEgvNzlkaTUvakJXTEV0WU9qSTVH?=
 =?utf-8?B?Zmt4SHRDSUFnZnRPRlJObE1EYlRwK3JmSWhBaTJlR3VvZ2JvU2NFYUVBVERw?=
 =?utf-8?B?UmNoU3Rveit0VjFMWjJnZkZQeWw2UXFQcWRxQjVybDUxSjZoRTJzWnhUczhj?=
 =?utf-8?B?K0ZQUUFwMXV0dm5odTB1bktQTHJQVXpsSUJvOHErL1FGMm1oOENITHNqZG1I?=
 =?utf-8?B?K0MxZUMxSFQyY1o1bzFCQnhoSHJ5K2wrUUQ1bFdpbjVhVVBweWpHRWNVUmhx?=
 =?utf-8?B?T2dyWjlXOFFoaTJmQ0RyOUxid3FtbDBFcGplUXc1aG0zOGhKakZHVnlMdGNJ?=
 =?utf-8?Q?pQmOLCx6ESt4kFprhm3DPxHru?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f8640c-cb4d-4b41-092c-08dd9d7c95db
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 00:14:17.1948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UXszOXF9tRyK2KyClAsWpoPiPXleSLPB+x0SALpeRjIAfswR4IS2m500scYjOpSrnuxi1XkVbDeHxPclSwScbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
X-OriginatorOrg: intel.com

PiA+IDIuIExpZmVjeWNsZSBkZXBlbmRlbmN5OiBUaGUgY2FjaGVpbmZvIHN0cnVjdHVyZSdzIGxp
ZmVjeWNsZSBpcyBtYW5hZ2VkDQo+ID4gYnkgdGhlIGNhY2hlIHN1YnN5c3RlbSwgbWFraW5nIGl0
IHVuc2FmZSBmb3IgcmVzY3RybCB0byBob2xkDQo+ID4gbG9uZy10ZXJtIHJlZmVyZW5jZXMuDQo+
DQo+IFRoaXMgaXMgbm90IG9idmlvdXMgdG8gbWUuIENvdWxkIHlvdSBwbGVhc2UgZWxhYm9yYXRl
IGhvdyByZXNjdHJsIGNvdWxkDQo+IGhhdmUgYSByZWZlcmVuY2UgdG8gYSByZW1vdmVkIHN0cnVj
dHVyZT8NCg0KZ2V0X2NwdV9jYWNoZWluZm9fbGV2ZWwoKSByZXR1cm5zIGEgcG9pbnRlciB0byBh
IHBlci1jcHUgc3RydWN0dXJlLg0KDQpXaGlsZSBpdCBhcHBlYXJzIHRoYXQgdGhvc2UgZG9uJ3Qg
Z2V0IGZyZWVkIGFuZCByZS11c2VkIHdoZW4gYSBDUFUgaXMNCnRha2VuIG9mZmxpbmUsIGl0IGRv
ZXMgc2VlbSBoaWdobHkgZHViaW91cyB0byBrZWVwIHVzaW5nIG9uZSBmb3IgYW4NCm9mZmxpbmUg
Q1BVICh3aGljaCBpcyB3aGF0IGhhcHBlbnMgaWYgdGhlIGZpcnN0IENQVSB0aGF0IGNvbWVzIG9u
bGluZQ0KaW4gYSBkb21haW4gaXMgdGFrZW4gb2ZmbGluZSkuDQoNCi1Ub255DQoNCg0K
