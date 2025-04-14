Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3201FDA9B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744673403; cv=fail; b=Tuc8/mfI7EIdJ6jWKKdc8mjWBKg2vKc0hhRo2YVRDiYqAobu46c/4R9DSGiswhniPW3DHJij4TZr8cSuy8pN5ynSV+pTURpybewyL6CP+qGC3e5udM7i0r/TsC/n62jFqubSLB0uVlTzqowL9b3CGb7PKTvMRSo1UZpXwyc9dgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744673403; c=relaxed/simple;
	bh=kv07fjUTNfBrJVe3yS98l+mReuCdqCMmhaEynCpMpHs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R070glB/gBnvQDi0L35ThtlPEr5lMP+SlT5ZdAtxZNi9VkoSamZeg4sQOzySqM2//qEjXRYfz9c0M+yuaWZYZ/kQSHfx7WbUFo5/E3zyUS1EeviwpzmYb4DjqkALKJCPis6ZTKfQioyBdQb8iVdpNJn8In3P0/2vfPQAuM14SVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ME/ARgJr; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ME/ARgJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744673401; x=1776209401;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kv07fjUTNfBrJVe3yS98l+mReuCdqCMmhaEynCpMpHs=;
  b=ME/ARgJrrgmKoUBY8+Qg1ghUzPk9QOfNDpEdmFnaTp3N2OWaeCbUhlDZ
   PCa2Zj+Mfb4Ua0q8ywWK5BDkE5x2ughYGR6brqjcWiyj6ePjVDeFuUjgL
   31ASEzhTMn/Hpt9IsB9AIfxQIR7PzDqoaQ4uHmPojQ5I+vtJgGk7v3ZZu
   ijMlxPylV1fZZIM8+1UdHpCkGE6Svsr1zR6hIjbzIBp/UGHvcNd9oG0E9
   XBw+0zMwLL+psBvH5lScoXa72wJ53z/BQZYGem6FE/8VUwVmqJAEYNitY
   jttq7nt1+nqWeVYO6y/S2qPdBaQirUplFPx+xulFg7t/rlfF65rkQMPZ0
   g==;
X-CSE-ConnectionGUID: jnGza6mFTkuxdTluxxFQoQ==
X-CSE-MsgGUID: qSvoXtsqRSmW4vHkK8ombQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46248778"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46248778"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 16:30:00 -0700
X-CSE-ConnectionGUID: a0IurgHpR0uEZy9nLKZwzA==
X-CSE-MsgGUID: RzTDMW5VSwyQI04k+Sgbhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="153133730"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 16:29:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 16:29:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 16:29:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 16:29:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+mgBJn1gNRtb/PyinCpwKr3IIuWzOJKeZxLg8tmkPmrimwzqtq9FXxBL7zYHVmwivJMUxl85GCuen234QyxOkbmG2arEouSyP1kqksevRgKJ12pCO62no0fF8mvi7MhnaVcR7DlWWS2l992UyWY+BKjlZePdJHtJFabsutPzYC/NyjJvk4kjCmybJvtBPlHwf8iGds9uijzCOBZThNBI20K8qlEvAiPghMQKbHo4lhkXdrM6kGXIgGlC5mAfUmAu+CKXnKNS2XKPbf2cOAqZEgzhrjFNw/lUS9PVJXK8HMqnr5ppW/zs2HoGsweOQF2GCEifgqO0KUndOjurYgxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDMgI/+kBZjVODMcPn31Opv0+JAFdb/K+AGJ8XWkf6o=;
 b=KFGca8yRv+V0JOwHcF1ZwWuR3LdFlsLhsvAYg6LQNRHwj/TdTRlgBzBHuQ087gkmgYcUfXn2hTxQLzx7Tpx1NV7FBIbVVp0g3pHxn9lEevA0mgQQjDLG+Jc+ONGisaG1RVr2x8CUs3kY2wKTNY5KyqcKADNw1pyt0kMT/HHgHvCiNPyZajib/vdUmTf71pP955Q6lYbTd89TuMfLylzLoSqMcmGJtm7J3fzrxEgWzF4tzSfERREXugRFq2MNPGx6koljQGQFra341VBjJVs7u4ZIRFUNts02qcCzUcGAk/AqDve4c9tx3kVswCwUGITdYDdLgF1p0YmNgWUYMuhssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ5PPFC362E0A4E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::854) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 23:29:52 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 23:29:52 +0000
Message-ID: <a2a743c8-3288-484d-935e-db0b2737b3de@intel.com>
Date: Mon, 14 Apr 2025 16:29:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/21] x86,fs/resctrl: Move the resctrl filesystem code
 to live in /fs/resctrl
To: Fenghua Yu <fenghuay@nvidia.com>, James Morse <james.morse@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-18-james.morse@arm.com>
 <f4ab6c75-f6ef-4504-9060-8ca9ab38b0aa@nvidia.com>
 <2dce14d8-55b8-451e-942e-5979f1454db6@intel.com>
 <b1679053-feb0-4b73-87f7-69175f0fe6e0@nvidia.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <b1679053-feb0-4b73-87f7-69175f0fe6e0@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:303:8e::25) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ5PPFC362E0A4E:EE_
X-MS-Office365-Filtering-Correlation-Id: a41427c7-3272-4fa0-eaa8-08dd7bac4199
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWFjbWMwZng3TGpmUmlsS09hdERvQ1pqMnJHUUh4WlZmb04yOSs3NHNYUEdV?=
 =?utf-8?B?K3pXTzAvbmJkK1dZekswY2JPNXZUdU1MR2RMWDMrWW9MQys1S0c2ZTdOWFZi?=
 =?utf-8?B?NTZFTXNyQkVneU1MTkloMndOL2h6Z2NqN1dJVm12clc4ZnhlbndzL2JKY1Rj?=
 =?utf-8?B?Y05mZ3dIKzdQaytLVmEvVE51dEltekdhSEFVdFcyckR3TlJDT09DRjV4WVNG?=
 =?utf-8?B?NGpPendKV3FaSVdjZTZKZnVyR043eEF6amxHTUFSbUduYk84QW80cWNQWVh1?=
 =?utf-8?B?NXVlbU1WRXFrRUUvNFo5dnI5c2svazJ2T1BDYkYvS1hYQi9aNU9pdzJySWZ4?=
 =?utf-8?B?d1VqQVAwUkt2ZzR1SldyaXc0WEFaeDJVTjV3MVJaUXVLWWg3SDhMc3dOV0dZ?=
 =?utf-8?B?MEREc0xYUGlGUENvakRhUHlpSFkrSnNDSE1MbzQ2WG45akx2anNWcWx0K2Fi?=
 =?utf-8?B?VVZVZzFoWHRHd1JKZ29zM1o4ck9LaFZMQXRCRGNETVdvT2ErVlkxV241eTVU?=
 =?utf-8?B?aXJFYVREaGVCbS80RXl2OHdZZFh1akd0NlBDL0tTNHF2d2sxUnRldjY4YWZP?=
 =?utf-8?B?ZlNqWlRNaDVtRVVwUExQRE9EMktiUGZwemxSN2gvYUxIaVYrTG5XaWkwZTJn?=
 =?utf-8?B?QkhwS1IwQWgyUlhxNm1QVGpBSHgrc3NvUkN5NXg4bHpkRDRlT1N0dzRnOThD?=
 =?utf-8?B?elZ3L1pIU093NDljTk9ENFZyczJ6UmllVWdqUnV0cWk2VHZkL09xb29oUjdQ?=
 =?utf-8?B?b1BmWDY0VWpoRW5qbnAzcEJNZHROUUp4NVo1Z3BrOU85SUE2QlRyTnVyUXpH?=
 =?utf-8?B?UzgycFFsMzZZelNpd2w5aE5YQVllZlpsWFN5V3VSZ1Z3L2Z4OXdMV2RvVWVB?=
 =?utf-8?B?WE9MSHpJWS81b0FRTDVUSHh6NXUxWnJmSXFRM3lMOUdoSjFzbWJucU13Mnpp?=
 =?utf-8?B?amh3b2h2R2RpOTJvcWVsa3NUTHdiREF1UHFCbm0yZi9kd09WR1hmUXVXM0dh?=
 =?utf-8?B?RjhKdUNjU1dad2JaaGVYVm1ITnNGVGN3OGJnSTBEVkJ0Q2Y5NXZ3UEFCVE1C?=
 =?utf-8?B?d1E5eGtuUUoxUnNLS2NSdGZKU0lmbEJIeXByU1lmR2JFK25sR2cyV3djQVBQ?=
 =?utf-8?B?dTJpUDdrRlBlOFI3YlVWTnlneEZvTUo3ZGtnM2g0ZXh0WVNGN2JXaFdNa1A2?=
 =?utf-8?B?RlpjUHBQV0JPS1VvakZKV09rQk5vV0ZsVjVTS1NkcG9TSTlHcWM3Y1k0YVJi?=
 =?utf-8?B?ZHBoS05xWk5CUjJrd0Q2cWZIdWx6ZmhuTURYUy95OWYyT2djSVlxbk9DL2xz?=
 =?utf-8?B?UlFYNnZQTXZKU2ZscTF4Q3owRUFQTWtJcDBQMS8zNHY4cDFxcmhOTXNFY2NS?=
 =?utf-8?B?QXJLQm1POEF0Y1htY1lCajdkVEUzUzVDS3BKREU2K0JZU0N3MXViZ3RkaStC?=
 =?utf-8?B?TWd6QU5hZ0dIWEpjdmJ3Ry9vMmxNbFl4bnc1TkdiRVNKUkdBR2R6dXJrT0to?=
 =?utf-8?B?NmpXNjU2aC84MDhoTzI4RFlhcjJhVUR3dnowelc2bUc1ZjN0TncvNFNFY0hQ?=
 =?utf-8?B?K1M3MjFFVHNqRGRpbTZnY3RhWHFhbnhVOU1LUi9lZWZRVktheVFWM25CWWkw?=
 =?utf-8?B?bzYxaURHU2JnV1NCTGpEYWRLbFQyS2pTOTlXcGlwR1Z1ek1ZekU1Wk1pRDJS?=
 =?utf-8?B?UmNtaVppTy9Tdm9MVldXN1I2eEo3TjRJdGZTSHUyMUh0YWFPbDJQTzVXdkNk?=
 =?utf-8?B?bGhrZDBlWDArU0JNM25lL2ZJb1lGU3dIelZCRmlFVHZId2YzSlBKVkNlbkpK?=
 =?utf-8?B?b3NVaWIzNDZDWHJEd01kcldVcGxzZXpHUmxjZHNRcW5sSHg2Nmp0UmZ0Y2Vm?=
 =?utf-8?B?d01uS2hmSkhrQ0h4a2h1WElnMVUzeE1xMnBWendiNTJkQUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzdNWU1UVGhlVW5zM0N4TGMzUGRsNzY3ZXY0RnBISXZqVW05R0UzSW9XakZR?=
 =?utf-8?B?TzhNcUpFK3V2NWttSXZtbXFqOE5PTFIxbkd5QVJtM25xd0xERGpURFRSLzZa?=
 =?utf-8?B?VHVLMHhRTVZ1NmJiZDdPRjhxdzJWQVUxY0ZhbVAxYWVZK0hUdEF1UklEUU42?=
 =?utf-8?B?OG5ibkFkVnRGaTRldk1Db214RlVTKzBmdFpHWCtxTG5Rem1OTmtKb0ZqTHlu?=
 =?utf-8?B?d0M1cU54eG1sSnJ3UFU2OGhtTXNUbEFLeHV3T2pQQk5kb3pCamdTLzRCVTZS?=
 =?utf-8?B?KzhXT2ZOdE1kTGtlbThxRWJMQWpwUXFJSS9XQWg3Y0NaQnAxYUZKenM4OWtR?=
 =?utf-8?B?d2xTM0dvOGRQNDh2WHczbFVmc2ZkUGFESHRoSEJUMVZWellFbkFMRUJPdTQw?=
 =?utf-8?B?S25TOXNsS3VSNkVmU0pQekxkSVZhbUVmdW9IRjlWSE1uNm9ETlFRT2JrWE51?=
 =?utf-8?B?cmJ0R1c0Y3VKVHgzdHVvS3Zoc3h5eTM1bk1BSXRPa3N1V3JybTlPbjlpVHRq?=
 =?utf-8?B?cUdTSXhPZE55NGdqc1B3RXg4NnF1YmhkaDRZay8wRTlHMkYrR3JsazE2Z0dF?=
 =?utf-8?B?UzN4dHFkeHlqdXY5TEUzRkhkQm9LMk0xZUxOQUF5Q0s4QlJWZ0Jiam5KeHVp?=
 =?utf-8?B?aCtNMStuSlZ2d2RkR3k3cFpEOE5nbWs4UDg4MzRnYWpRbnc5cHR5K0loKzdW?=
 =?utf-8?B?SG1vZERSeGdPbnl6N3VVczQ4RDVuaTJKV3JhUXFvRSt5VHpJLzdRcDVlazI3?=
 =?utf-8?B?N1BGbHV4Qm1yUUtoc3FidmdjcUNqYVV0blBBamlnQWZBMTA3SkZhL1M4UHYr?=
 =?utf-8?B?QzBSS2FFaWNpalZzSkRMd21nZGFCdHAzSlZSUUpLYjBERTFxWjJTakcvQnNt?=
 =?utf-8?B?WlpRcXNVaUVmRE9XY1RXenFqcFBCU1BZbXUxcytseExEWVVUV3VnQlhVUVFJ?=
 =?utf-8?B?cjQwYTVjU2lNQVdibWEwVUJyTnJzWmtEbHpPcktZOWZsMzk3SXdiekpNT25D?=
 =?utf-8?B?akF0WTBIK2ZyTUdPM3YzZm1pNWo1elNSNkI2Qk1hbTQxZ1pRVFNhSUc3RVkx?=
 =?utf-8?B?Wk5zS3FSU3dabVpmb0F1cGFsenJrVmVpUmJ5QXBsMS93ZVBTTkFlU09zY2M0?=
 =?utf-8?B?bVBVRmNkanZHWkx4MWx4UEQ4VTZtYzMvNmtCampEZWRmUlZPVEVsa0EyVHpl?=
 =?utf-8?B?RmpyS0hhbzMxQnhBaDlkQlFYamtnWUVUSldBSVlTUjZHRS9nN1g3NEozaita?=
 =?utf-8?B?VVUySmEzOFJzbXVSM0c3bGxWT0tUVXpJR2c4VG55WExDTTdJVmE1OUhuODVm?=
 =?utf-8?B?ZTJmVHV4cWhPbkQzNDdIQnVLTUFkT2JtUXRNdEdhVUNmZElXL2hrdEY4Q2tN?=
 =?utf-8?B?V3FwN256SWl1WmoxVFRiK1l1eGNWWDhRbHFLVXJVVFcwd1B2bkwxcUxQNklv?=
 =?utf-8?B?MzFZTXdscEd6Qys0cHdVdUVIWFc2cHppWHQ1QVR6RXIxQmp5MzE1dHBLZFhn?=
 =?utf-8?B?ajJSQUswckhRQk0veWlYR2M3OWRuUlZaeEZrUmdiTDVjVTlJTEtKNmxMeXNB?=
 =?utf-8?B?QWNMdUdQcHJVV29qU1U4L1NBeEpqVXRJRXJsNEV3R2o4YTFnYklHVm5PNFBT?=
 =?utf-8?B?VWo0WjlpektwcHJwZ3lxYXpFdHB2VndSUzhERDFkV2kwbGRwTEJqRDY2NUJ5?=
 =?utf-8?B?a2MyTFNYM1J1OGNIVHVRMDVpb3ZiWjhMUmNkMm1BRVJQam5FY09rRFBwSFYv?=
 =?utf-8?B?TkhGWGtEcG9sblMzTGNPYnBlRmxNMExiTFVVT25VQnZxTzFSQUFndnJuaEgy?=
 =?utf-8?B?akw3TzluM0tPV3kvVW5IS3o3MnJodDA5SmpLREV0YnhXWXd2QXo2Q0ZNbHdk?=
 =?utf-8?B?czNKRWo1UXRvVmg5VGFLK2JoTTkrZk1zZm9UZkVjTGFMUkY0YlV6VHhROG1Z?=
 =?utf-8?B?V253WlhRZWRJTS85cmxJNUxNSnJnL1VMa2h5YS9rWVdnSE9lWWNlSi85eEZR?=
 =?utf-8?B?NFBmUzZpUFZnWnFVOU9tYXlsenYvWDNTc2dxY0ZIVUhJRVpEZ2FWKzJnVWdB?=
 =?utf-8?B?aTZCSHliL3pYSTlLYVJnUWs2SmkzSlc1NHF1enNUNUM1T0x3QjZONnZQWUJw?=
 =?utf-8?B?elhJVXJVU2R3UFJPa0lneGkxOHR5cS9jUGxISkY4STdMZ2VVbDlaY0g0WDhh?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a41427c7-3272-4fa0-eaa8-08dd7bac4199
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 23:29:52.3449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/ebG3mCIP0UgHTP94VQeunlSDwmaclVbfhxBhZME2v0sAS5dA9RQFudZ5+cF/DGyWr8SvlRMahyYA7RI/RHhxiAn7TIsQ8Y2t6GfaVuOrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC362E0A4E
X-OriginatorOrg: intel.com

Hi Fenghua,

On 4/14/25 4:22 PM, Fenghua Yu wrote:
> Hi, Reinette,
> 
> On 4/14/25 09:04, Reinette Chatre wrote:
>> Hi Fenghua,
>>
>> On 4/11/25 5:18 PM, Fenghua Yu wrote:
>>
>>>>    arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  636 ---
>>>>    arch/x86/kernel/cpu/resctrl/internal.h        |  380 +-
>>>>    arch/x86/kernel/cpu/resctrl/monitor.c         |  902 +---
>>>>    arch/x86/kernel/cpu/resctrl/monitor_trace.h   |   18 +-
>>>>    arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1080 +---
>>>>    .../kernel/cpu/resctrl/pseudo_lock_trace.h    |    2 +
>>>>    arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4556 +----------------
>>>>    fs/resctrl/ctrlmondata.c                      |  660 +++
>>>>    fs/resctrl/internal.h                         |  442 ++
>>>>    fs/resctrl/monitor.c                          |  932 ++++
>>>>    fs/resctrl/monitor_trace.h                    |   33 +
>>>>    fs/resctrl/pseudo_lock.c                      | 1115 ++++
>>>>    fs/resctrl/pseudo_lock_trace.h                |   17 +
>>>>    fs/resctrl/rdtgroup.c                         | 4313 ++++++++++++++++
>>>>    14 files changed, 7668 insertions(+), 7418 deletions(-)
>> This patch is huge. Placing a response in the middle of it makes your feedback
>> very hard to find. Please trim your replies.
>>
>> Reinette
>>
>>
> You are right! I re-sent my comment and remove all irrelevant code. Now hopefully it's easier to see my comment:)
> 

Thank you very much for re-sending the trimmed version. This helps a lot.

Reinette
