Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D007619DF44
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043756; cv=fail; b=AzB49LIQ/OOXSjtAn29aaOZvkJcnq3UBmScoU4XcVzOw0Fks4t3yUjdTW7rh6WdGNwaIh55m+1BUbKK9LxZiiT9mM3DbpjtWRJJ3xoOcAy7JdyFiy0aiIJU5GORK8fdlSqXHO80QclkT1Bbe7gF09VYm0AEMw6lBiIjgzW63z6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043756; c=relaxed/simple;
	bh=uJIy+FexJwkuoef3/StTLLe20eeVOkLZpm1Y08/G6L8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XANj92gtDsaNne8qpYfjgoM2xkqg/OqyZ7LiOxAVHrWSF42mYmO97fGRM2ZczMGNQKB9fJu1lPznJS0Ygh9OXGkXzXRdzx3F3WjZ3EyFFeg9RvMs8aFjSPtl1wrYHG3w+2fIWUWv9B4Pp1lBB1yKy9M0RRDM/rm0mWZ6zxtP0qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRFcTZa1; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRFcTZa1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743043754; x=1774579754;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uJIy+FexJwkuoef3/StTLLe20eeVOkLZpm1Y08/G6L8=;
  b=bRFcTZa1akLx4zwBjqBLsL008hjgTQzCX9K4kFFYrasLxHaS8ZnvO+Am
   1EQkhEdWvuGpXnyRzEVUASz6KyO1QfmSzl8xS3ACEGB66GDp3YHbqQ3OO
   bVXr0fQSsPNkjyz0vFAwsGTFTANZN7+YcXfcdGfefJcE9nqS/eK840pnd
   dD4bd+6cjL9dSn2r8EjR1Bht/Vb0IL7Tg1QRp0dIthHqBgh8dfQRnpCUi
   7K6S4J1KVGR0KV/slMBAHcF81ryFbPru891U6RzfPCJogyQFbGC/ftZFs
   vA9A5DYt2Ms6pPd+CmS/dV3lLktJ66idvXm/rX3o8/vcgK4L8ghDapslv
   Q==;
X-CSE-ConnectionGUID: 7bEeYOOCSY6Xt7dT66ld5A==
X-CSE-MsgGUID: FLeOWIuYS4GAc/xLlotSYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48012614"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="48012614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 19:49:13 -0700
X-CSE-ConnectionGUID: nmhF6qWqT1ar+rGib3EMHw==
X-CSE-MsgGUID: AZJYHA8IRt+jSlk8s94wQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="162237232"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 19:49:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Mar 2025 19:49:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 19:49:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 19:49:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOXD+mrhKX694jdXpV5W7hyrx+pb1v0TEg/9IpkeuMx++ryFyb/7xAGUnOY5QsA2IhE/ummxlsZP9FSeAQnyWG394zZXqqlmmt4unKgElvJlfRAf0u3CT26OnIK8XtG9fyRV7qzX/TYLX/poxcWZOcE0zUTrFKxyQlK7O7PEsEYg1SAsVo2e68DdN+KQ5cIDCSQEysfBxs+rWKhUtypxmDBiC8UcQNSOx3b/xfHQFJFssvRO0iiLa62a5jaX7Jfy+GX3w3BOLbSQw6Myki/CsQd/SH1chwXIJ0VX4j8SrR4BApr3SNI8cyJntfxSfzYTGZZQI6ueuu073RWAIXw7Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZdMbrPgeKKZAjobtsGkMtYDyOQj5GcLzHV8MNZXVoY=;
 b=hAlp6cJn7R1WdPoRXI+Qh4pjYoNwBaMRLLX9nDSxU09qORD3lGIhhMHxs3patY52FpzHDPMtaLzB5kDk55OpJ+We0uEf+o8ktMxxHI15VacPuWx/xdWAnAWr9efTxn4YjUv26auX9BZbPiCC8K8MHAm+LY/04XNjGxtlrq2RqzFuaPraoPah2vCRn2nFuDoVGIqoykQOHebUi6lOVRtt6V936EW22E66JUT5r9G3t+PaCWJIaI3IyXsf0xYaYda08+WwIx3lviBJX4OZwpdfwzVYw5MXFPONqkvNVs9UxZi3phF2E5ifHppFvmN9HaFEuFuErq4RsDsm4jEY/csQ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA3PR11MB7978.namprd11.prod.outlook.com (2603:10b6:806:2fa::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Thu, 27 Mar 2025 02:48:36 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%7]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 02:48:36 +0000
Message-ID: <38126b7c-7782-46c9-ae07-86a669a710e0@intel.com>
Date: Thu, 27 Mar 2025 10:48:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] sched: Cache aware load-balancing
To: Peter Zijlstra <peterz@infradead.org>
CC: <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<tim.c.chen@linux.intel.com>, <tglx@linutronix.de>, <len.brown@intel.com>,
	<gautham.shenoy@amd.com>, <mingo@kernel.org>, <kprateek.nayak@amd.com>,
	<yu.chen.surf@foxmail.com>
References: <20250325120952.GJ36322@noisy.programming.kicks-ass.net>
 <4cd8ba54-8b9e-4563-8fbc-1d6cd6699e81@intel.com>
 <20250326093841.GC25239@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20250326093841.GC25239@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0205.apcprd04.prod.outlook.com
 (2603:1096:4:187::6) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA3PR11MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 7449995f-f406-44d1-8b9c-08dd6cd9dee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHJTenFyVHhKZkdnblNMQ1lXd1NXVDgyYTMwbVk4cFhiL0VNVGRPNzUwRWRB?=
 =?utf-8?B?Y2ZHVmxJRUVyYm5acUp3bThxMUVJcUpTcE1QaW5GZkJHKzBKR1QzaWZMK2o3?=
 =?utf-8?B?OWFPTE5TWXRUWWdNRFJUY3Fod0YyckNWR2pRdmQ3dFVYeXVOeHM5bENEVGJS?=
 =?utf-8?B?R2MxM1E5L1F3dDRVZ0ZIRG9CMXBUU2RZSFpyUmZuNkl2cU42SVgwZ0EwWmtG?=
 =?utf-8?B?Mm1mQnI4N3M5Zm05d0YvMHUxNTh3OUpMNEF3cGtEeDJFWE5QZ09MenBjQldD?=
 =?utf-8?B?QUlHWDlJeU50K1d0VWZGdEFQM3lDMkdwL3VIbEowems3MnEzdmYycUFVeGZv?=
 =?utf-8?B?ajQyeDcwVGpsWnFoRzc3Z1orU1FGVXFFYUpnQnowOWZRWE9JRGUxdGNtRlB1?=
 =?utf-8?B?NGJGbHBtRmRPTkZzVHF0bWF5cFhXd1E4NG9DT1pJZi8zbE5jSzdkT2k2eEh0?=
 =?utf-8?B?N1JBQ3VxREFWdnBFYXc4S3gyYkU4M0RMTVhLVDN3U3hoMEM3MnBCMGt2dHhX?=
 =?utf-8?B?dWYyUXZkT1JrK016VW84L0tRUVkxOWk3N0hlY2M5WHB3MUpxaVZjNzhUdGMv?=
 =?utf-8?B?Myt3YUd5UUtOUHl6VjVBclFyOVBEY0F2R1E4SFprdE5Hd1VQZG5yV1YycThi?=
 =?utf-8?B?a1J2Z0k4bWVlUlBVbDlqY3Nnb3pSUW9PSTVPNWpZSHhBbGRLaWRwS2dOYTFm?=
 =?utf-8?B?dVNXdlUrbmdNT21LSGhuSjBDaUlydnFlZVFsWGZaY2ZrbDNNaGNmZFZ4K1ZC?=
 =?utf-8?B?dVhnK0ducXdUNFJ6ck5Nc2E5TG50Umt5cHNkbW1xcW1KY0Q2NFptajUrY2Y2?=
 =?utf-8?B?Wng0ZlFTYVBqR3JueGJLK1BteURIUGU1OGMrQzVuRjhaTlEzYnNLN01jaklh?=
 =?utf-8?B?Tmo3RkV0WlUwa2dTMUd3ZjNmaTZjbHFaMlZwWml3MnJmc2NCNWVDWlFSd0xE?=
 =?utf-8?B?VzQ3Um96SXdvSTBLZG1iM0RnelNINWhkQSt3Mm5mcDYxcFluaWUyVGJmN3Bs?=
 =?utf-8?B?Qlk4dlZNcUJSMFBuM1lBOXkyMVIrWUJpMXNSUlYydzV6WDFHM2xtd21qOGVL?=
 =?utf-8?B?VnN3VFI5U1lnZ0dTRmFwMllhUzMyT3JuN1oySUpTcktOVktZUUhmeG80K0h2?=
 =?utf-8?B?QkF3aG9VNGpDbDBOTWdqVHJIdkQ2bmYyVVRTMW9BUUQzeE0xYjl2SEpOVGpR?=
 =?utf-8?B?SXhaQ0VpdXZBUWp5MG9yWjNLWlphZENJUWFENE9pdTJuUUFCU20ydFpiSFNE?=
 =?utf-8?B?RjRuSDl3cUtmVG5qcnhGN2YxOFRrSkZUWVlQeGJFNDh5M3cxaTdUWGl1Y29s?=
 =?utf-8?B?N2htMWhtczY4Rkd6OS9IVGVwLzhCR0xNdkNPRHk2NjJpU3BMZTlzU2pCRVN0?=
 =?utf-8?B?YUFXWW8rN29LS1JZalc2ZFRXRVJnSG9xbkxJZ3BGaFIxNEVmeGhGYnpqeDdQ?=
 =?utf-8?B?SnhHT1loZzBkTXZlNElPQlNyY2RBcXZVbXlzaWpBVE51cjJXa3YxMS9mdVZK?=
 =?utf-8?B?R2dMemlrYXFhcER2bXZNZmJvSm40eHpxcE5ldElRSHFUWGtPWGU2djA3a216?=
 =?utf-8?B?QzVMN3hjQ0pvNVY5L3Bmb05ZWG9JNlVicFZBSXpOeGlSbXU0cUhtblpKaFly?=
 =?utf-8?B?NGQwTGY2TXg0SXY4ZHdwbTRmYkxRSm1hZS9Sa0RtZi9hekZWSmQ1VC9obUNX?=
 =?utf-8?B?TURMekd6REhrczZHMWc3SEdNTE96aGdENHFST3hzU3c1QXFOMmtmeDA1N1BS?=
 =?utf-8?B?OVlPalp4NFR6eExGUHdGNjFORVpTMVVwR3pTaVppcG1CM3pCSWRYeEpaOGVl?=
 =?utf-8?B?L1FCMmRiK2FxNGdiS2Naa1FkeVZ4R0taZDk0dXEwcVZwTHdYbHlYb2QydzBa?=
 =?utf-8?Q?QyidvnRoF9qRq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFUrRzJJWUZiYm8wSUwwL2xZT011NjN1RnJoYzFSWkVBRHFjTXZ1US90SGdq?=
 =?utf-8?B?Zm1oL0VJV2tmMTlVd2ZaaVY3YStrWmJkeWxRSHEvTjJyZEwxU1l3ZGxWZURD?=
 =?utf-8?B?dkNTUGNnSXovaUFEUk1tUW5pVHljQXQ0V3RiSTB4ZnlUM2FyUzd1T05zMHlV?=
 =?utf-8?B?c1R6K3FYdEpYbmE4UXRoUzBwQzB2bWdOcGhwN0QzY0NvbzB6ZWlYLzZZN0VG?=
 =?utf-8?B?aWVTT2lEcFdwSVl3d2hWeFlMbmNUWG1yY0VqWkFYK1Yzc2FQaUl1Q25nbWt5?=
 =?utf-8?B?RGwvWnJhcGo0NitXUHVkYkRvNHRWN1FaSXM0NHhxKzVmRi9LU1VFZ2M1WFha?=
 =?utf-8?B?dUlkV1ZVZXZWWldMNXdkZ0xNdFp2RXdpSy9nL24xS0xjLzdva1lmQTduZEFj?=
 =?utf-8?B?R1F6cXdNMW1NR1c4Ky8zWmg4d2gzUVh6UUdoSHRWRWFvNGJ4NlZ3bVllQjJV?=
 =?utf-8?B?aXRhaUFMWDdxSmJRSWJOaFF0SzlYKzNuQzZPdFhoc1IvbmFRUVc2YzFtQ1RS?=
 =?utf-8?B?VEtNT1oyRkx4eXNPbHUzVzROV0VoVExOaVJsSzAyRXdPS3p5R1BZdFo4Sk44?=
 =?utf-8?B?UXNNTVpHTGlGaitpV2xmbTZsQWw1WGhYOTRCZnozekdEQjZiR2llWDRYVlJz?=
 =?utf-8?B?NzFYZGQveGdjSk8xVDFXQ2RFTlA1UXY4MG0raXFOUFRvNndaWURMSExJYUZX?=
 =?utf-8?B?RGdoRURXR01SVVZkUEM5TXluckdPM2sxRmVDc00wQTczY0dOdWJOQXJ6ZkQ2?=
 =?utf-8?B?Wlk4czVBRzZES1RjdlRhYzJmbDFIcFByN3MzVFVPS2V3S0NnRFZ6RmJ1dmdM?=
 =?utf-8?B?a3RYYVhFL1FtRW1LSXJzaERYRUorWEdLWnlpQWVNaW9NK3VmTWdIc245S0JM?=
 =?utf-8?B?QytydmhRUTYySzU5TW9BRWU3Nk5ROG5sMm9Fak9ZUm1iSkxyMGVtTG9sUHdN?=
 =?utf-8?B?WmJLTkNkN1JRVnNVMDdsTmFvbVcyV1lwREp1QnFWd1BEdkdLWjYyN2FHRFl6?=
 =?utf-8?B?VWdUMnZLVDh5bCtrTTFPVit4c1draTM2ZWdMaUVSRDFxYVBHR2tkN2I1RzJu?=
 =?utf-8?B?bnBwbEtyQVJXSEVzeGx6b0Zzby9COXd6bXU4djNVTEVmb2xsRjhub0RRcXF4?=
 =?utf-8?B?dDIvVDRVTTZNWnltckxtWjZSNmg2MGRNVHYramk2MmhEUHRlVk9uc0FYMTZk?=
 =?utf-8?B?ZDNrcTN0ZjA0cnd4Sy92V2xTdzJCWGo4TnJUaTJYUlpML00vOE50WStWVTBS?=
 =?utf-8?B?b1FRR3V1KzhqclV4ZE1yNkxVSk1OdEFwdyt3bkVHMzRuL3JpY3hFTjRGdUNP?=
 =?utf-8?B?aENEbEVZZ055bFhINytUVkRVZlUrWEc5c0lLcitSRjF3WlFqMFRoQVVrVjVi?=
 =?utf-8?B?UnMvUEhMYXVPb3FNWjFxd091NHFDTEFqYmgxOVZvZ3IvNjZ0SjZURWMvTTNl?=
 =?utf-8?B?UytWYjVXa2lUYzF6Q0hpQVZ3S2pydVY5VXBZVFgreDBqTE5CdHRCZWhlMWNW?=
 =?utf-8?B?b1Bkd2FqMzk4SlhtZ2FTb1VHMmcwMmdUdjJ0QmFSV0hyREcrelJ6OWh3dWVV?=
 =?utf-8?B?U2ZPQjFJU212Q3ZJSU1GREdHd3NUNVJja1pkRVg3VjM3UEo4QWo5dFFzYkRY?=
 =?utf-8?B?Yk5NRGp4LzlqSzBXY0xLSWVuaFNvQmswdTBIditoZVZMUWNWLzF0Mi9HQVJC?=
 =?utf-8?B?MXlncnFDdEZpeFpJak11SGNXaW0rRXpPdnYza01EQzlzbEplMXVJd2x2cEpm?=
 =?utf-8?B?eFZhM054dTVBV0c3Ymh0L25XbnBPK0k5VDBmNm15UHBWYnA1Yy9naTg2NW9H?=
 =?utf-8?B?T3J6M3gxVHhBQ3NMZThtRzJHRE94R3NyNlNsUzF0VlB5cS9RNjVMRk5CODJT?=
 =?utf-8?B?aDI5aUtCVDQxbVhaclNyek5oT0VBTnRmUkhNWG1BdkVZS1NMa3grVmtpYllV?=
 =?utf-8?B?ZzRaOWFoRmh1eEVzczgwTlBHY0RtbVg2SDBVMVFmdDVrbmZGRVJMN0duMCtU?=
 =?utf-8?B?ZlEvcHdnbGY1eUtXc2w4Z0plbitWbnNnSzI2UTdWc1paTE9IeTVTK29RaXJZ?=
 =?utf-8?B?OXVINDViU0JkVnAzazlFamxQaE93d2htU01VVGxlT1lhbzBVNGxvQ1pLby82?=
 =?utf-8?Q?lj1eF+d++21V558AVRspibmMu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7449995f-f406-44d1-8b9c-08dd6cd9dee5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 02:48:36.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9IcBLWSsj0l+SFLji+ZpmYquQ0HLhoxeSICcReMwQ+Y1r0NwHTeCZt83FwOac4/k7jsXTZqaBw8eh/00X9NJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7978
X-OriginatorOrg: intel.com

On 3/26/2025 5:38 PM, Peter Zijlstra wrote:
> On Tue, Mar 25, 2025 at 11:19:52PM +0800, Chen, Yu C wrote:
> 
>>> +static void task_tick_cache(struct rq *rq, struct task_struct *p)
>>> +{
>>> +	struct callback_head *work = &p->cache_work;
>>> +	struct mm_struct *mm = p->mm;
>>> +
>>> +	if (!mm || !mm->pcpu_sched)
>>> +		return;
>>> +
>>> +	if (mm->mm_sched_epoch == rq->cpu_epoch)
>>> +		return;
>>> +
>>
>> [1]
>>
>>> +	guard(raw_spinlock)(&mm->mm_sched_lock);
>>> +
>>> +	if (mm->mm_sched_epoch == rq->cpu_epoch)
>>> +		return;
>>
>> Remove above duplicated [1] and keep the check here?
> 
> Why? That just adds locking overhead for no reason.
> 

I thought mm->mm_sched_epoch is updated under the protect of
mm->mm_sched_lock, so the read side should also be protected by
this lock?

>>> +
>>> +	if (work->next == work) {
>>> +		task_work_add(p, work, TWA_RESUME);
>>> +		WRITE_ONCE(mm->mm_sched_epoch, rq->cpu_epoch);
>>> +	}
>>> +}
>>> +
>>> +static void task_cache_work(struct callback_head *work)
>>> +{
>>> +	struct task_struct *p = current;
>>> +	struct mm_struct *mm = p->mm;
>>> +	unsigned long m_a_occ = 0;
>>> +	int cpu, m_a_cpu = -1;
>>> +	cpumask_var_t cpus;
>>> +
>>> +	WARN_ON_ONCE(work != &p->cache_work);
>>> +
>>> +	work->next = work;
>>> +
>>> +	if (p->flags & PF_EXITING)
>>> +		return;
>>> +
>>> +	if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
>>> +		return;
>>> +
>>> +	scoped_guard (cpus_read_lock) {
>>> +		cpumask_copy(cpus, cpu_online_mask);
>>> +
>>> +		for_each_cpu(cpu, cpus) {
>>> +			/* XXX sched_cluster_active */
>>> +			struct sched_domain *sd = per_cpu(sd_llc, cpu);
>>> +			unsigned long occ, m_occ = 0, a_occ = 0;
>>> +			int m_cpu = -1, nr = 0, i;
>>> +
>>> +			for_each_cpu(i, sched_domain_span(sd)) {
>>> +				occ = fraction_mm_sched(cpu_rq(i),
>>> +							per_cpu_ptr(mm->pcpu_sched, i));
>>> +				a_occ += occ;
>>> +				if (occ > m_occ) {
>>> +					m_occ = occ;
>>> +					m_cpu = i;
>>> +				}
>>> +				nr++;
>>> +				trace_printk("(%d) occ: %ld m_occ: %ld m_cpu: %d nr: %d\n",
>>> +					     per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
>>> +			}
>>> +
>>> +			a_occ /= nr;
>>
>>
>> In systems with a larger number of CPUs within a single LLC, the division
>> may lose accuracy.
> 
> May, sure, but does it actually matter? We're tracking occupancy in ns
> per EPOCH_PERIOD, which is 1e7. Lets assume 'large' here is something
> daft like 100 CPUs per LLC (lets just really hope nobody actually goes
> and do that, please), then you're still only loosing like 1e2 ns from
> your average.
> 

I see, the 100 ns should not matter much compared to 10 ms sample period.

>> Can we either use multiplication for comparison, or just use the accumulated
>> total CPU occupancy
>> of that LLC for comparison (by removing a_occ /= nr)?
> 
> You can't remove the devision, you get into trouble when the LLCs do not
> have equal number of CPUs. 

On a hybrid system, suppose there are two LLCs, LLC1 has 8 CPUs, the 
sum_occ is 1024, its avg_occ is 128. LLC2 has 4 CPUs, the sum_occ is
768, avg_occ is 192. If we compare avg_occ, we should choose LLC2, even 
if LLC1 might have more idle CPUs, and LLC1 has more active cache-hot 
threads.

> You can carry that multiplication around ofc,
> but again, why bother?
> 
>>> +			if (a_occ > m_a_occ) {
>>> +				m_a_occ = a_occ;
>>> +				m_a_cpu = m_cpu;
>>> +			}
>>> +
>>> +			trace_printk("(%d) a_occ: %ld m_a_occ: %ld\n",
>>> +				     per_cpu(sd_llc_id, cpu), a_occ, m_a_occ);
>>> +
>>> +			for_each_cpu(i, sched_domain_span(sd)) {
>>> +				/* XXX threshold ? */
>>> +				per_cpu_ptr(mm->pcpu_sched, i)->occ = a_occ;
>>> +			}
>>> +
>>> +			cpumask_andnot(cpus, cpus, sched_domain_span(sd));
>>> +		}
>>> +	}
>>> +
>>> +	/*
>>> +	 * If the max average cache occupancy is 'small' we don't care.
>>> +	 */
>>> +	if (m_a_occ < (NICE_0_LOAD >> EPOCH_OLD))
>>> +		m_a_cpu = -1;
>>> +
>>> +	mm->mm_sched_cpu = m_a_cpu;
>>
>> There might be an issue with mm_sched_cpu bouncing. Perhaps adding a
>> threshold to compare the old a_occ of mm->mm_sched_cpu with the new a_occ of
>> m_a_cpu could help. For example, if the latter (new_a_occ) is twice larger
>> than the former (old a_occ), we can update mm->mm_sched_cpu to the new
>> m_a_cpu. Otherwise, we keep the old value.
> 
> Some hysteresis might make sense, but I don't think waiting for it to
> double makes sense, that might be too agressive.
> 

OK, might need to do some evaluation to figure out a reasonable threshold.

>>> +#ifdef CONFIG_SCHED_CACHE
>>> +static long __migrate_degrades_locality(struct task_struct *p, int src_cpu, int dst_cpu, bool idle);
>>> +
>>> +static int select_cache_cpu(struct task_struct *p, int prev_cpu)
>>> +{
>>> +	struct mm_struct *mm = p->mm;
>>> +	int cpu;
>>> +
>>> +	if (!mm || p->nr_cpus_allowed == 1)
>>> +		return prev_cpu;
>>> +
>>> +	cpu = mm->mm_sched_cpu;
>>> +	if (cpu < 0)
>>> +		return prev_cpu;
>>> +
>>
>>
>> We observed frequent task migrations during some highly context-switch
>> benchmarks, which led to performance regression when the LLC was saturated.
>> Could we avoid task migration in cases where the previous CPU and the
>> preferred CPU are within the same LLC?
>>
>> if (cpus_share_cache(prev_cpu, cpu))
>> 	return prev_cpu;
> 
> Sure.
> 
>>> +
>>> +	if (static_branch_likely(&sched_numa_balancing) &&
>>> +	    __migrate_degrades_locality(p, prev_cpu, cpu, false) > 0) {
>>> +		/*
>>> +		 * XXX look for max occupancy inside prev_cpu's node
>>> +		 */
>>> +		return prev_cpu;
>>> +	}
>>> +
>>
>> Tim found that spreading tasks within the preferred LLC might help avoid
>> task stacking:
>>
>> sd = rcu_dereference(per_cpu(sd_llc, cpu));
>> if (likely(sd))
>> 	return cpumask_any(sched_domain_span(sd));
> 
> You know that cpumask_any() is implemented using cpumask_first(), right?
> You're causing stacking if anything with that.
> 

I see, this still cause stacking issue. Let me try to find other method 
to spread task on its preferred LLC.

>>> @@ -9288,6 +9556,17 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
>>>    	if (sysctl_sched_migration_cost == 0)
>>>    		return 0;
>>> +#ifdef CONFIG_SCHED_CACHE
>>> +	if (p->mm && p->mm->pcpu_sched) {
>>> +		/*
>>> +		 * XXX things like Skylake have non-inclusive L3 and might not
>>> +		 * like this L3 centric view. What to do about L2 stickyness ?
>>> +		 */
>>> +		return per_cpu_ptr(p->mm->pcpu_sched, env->src_cpu)->occ >
>>> +		       per_cpu_ptr(p->mm->pcpu_sched, env->dst_cpu)->occ;
>>
>> This might encourage more task migration within the preferred LLC, leading
>> to some performance regression. Is it possible to raise the threshold for
>> task migration within the preferred LLC and use the original delta time to
>> determine whether a task is cache-hot?
>>
>> if (p->mm && p->mm->pcpu_sched &&
>>      cpus_share_cache(env->dst_cpu, env->src_cpu))
>> 	return  2*per_cpu_ptr(p->mm->pcpu_sched, env->src_cpu)->occ >
>> 		  per_cpu_ptr(p->mm->pcpu_sched, env->dst_cpu)->occ;
>> }

After a second thought, my change might be incorrect. Because every CPU 
in the same LLC should have the same percpu occ.

 > > Nah, the saner thing to do is to preserve the topology averages and 
look
> at those instead of the per-cpu values.
> 
> Eg. have task_cache_work() compute and store averages in the
> sched_domain structure and then use those.
Sorry I did not quite catch up with this, doesn't the
per_cpu_ptr(p->mm->pcpu_sched, cpu)->occ
already have the average occupancy of the whole LLC domain? Every
CPU in the same LLC should have the same average occ because in
task_cache_work():
for_each_cpu(i, sched_domain_span(sd)) {
	/* XXX threshold ? */
	per_cpu_ptr(mm->pcpu_sched, i)->occ = a_occ;
}


If the goal is to avoid migrating task to its non-preferred LLC during
load balance, maybe we can check if:
1. env->src_cpu is in p's preferred LLC already, and
2. env->dst_cpu is not in p's preferred LLC, and
3. p's preferred LLC is not overloaded,we should treat p as cache hot.

The definition of preferred LLC of a task is something like:
p->mm->mm_preferred_llc = llc_id(p->mm->mm_sched_cpu)


I'll add some trace/schedstat on top of your patch to investigate.

thanks,
Chenyu

thanks,
Chenyu
