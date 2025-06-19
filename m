Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9E6220F3B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339343; cv=fail; b=ogoWsmyBK7uydBM3Tb/RJRAMS1mKTPLOVkYFTCukKge+0TG7weObIFFDom1wr3x59gEc36hJLE68RDJw8PoXM1nmjdfCrTwgZmJRXfCnZ7B8ox47XEZV4ZtczeC8EIblnk4eegNRK7ayF8VavA2xCG8NcmAOEObUqYoNVTkWqR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339343; c=relaxed/simple;
	bh=+p7OGHW8O5sk93/wr/QvegRjwZCRj9TSt4wkMNNZQQw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C3rGlsS6W4ucCt7UncZZCWWbEYB0YfNd9C3FWnyxhbHTXVog2ORPSn2Pa+duF/XwJA5+aS+YjD++IPKfM+wV9hQgqKA4WLHPXTY4cxX+Qosr+HIteYW1tJZfFuAlLN+ZQJQ3nvb7UHYnL7TC1Yp89rPoGDbBVJOciwL6q2IXtd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kV3KL2OA; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kV3KL2OA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750339342; x=1781875342;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+p7OGHW8O5sk93/wr/QvegRjwZCRj9TSt4wkMNNZQQw=;
  b=kV3KL2OA9j4tIbjqyYSok1DvP7nqmEcdnKwfDRD6o16h75LOTyh1q5+w
   QB6iBVKjB3YOlzK+ywgQKPMBNNDJAZOxxZLZPzvyV8pYvR4AuM6quvoTN
   xuBWKLGIngFlzqYJ2OLlu447wIQHPqT0kTP3upY2Grj7U75Qz0AtQKyjK
   SMxkiy2Hetd7prUkDyZ6N3kLdjoHoKSCdz4KEJcpJW/fFUASa6/fyFvp9
   lwp+3+UmZcraVZR7eX5OvCr1zRcfgrts6MAKGqBtn5VjQPQ/32QfZpASq
   QtUqk6wTHLRl+zwnSerWUHHx8ZKXgwRQIOA2exnTj8SIBFeo38IGyM7Mp
   g==;
X-CSE-ConnectionGUID: 10HhSOQOQIKCwYjEESHoIA==
X-CSE-MsgGUID: bCb5xYrmRM+z3SJbEMmewg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40198304"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="40198304"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 06:22:21 -0700
X-CSE-ConnectionGUID: 2bwDqyCFSDCzdYl/4MEWuQ==
X-CSE-MsgGUID: /5Cj8UzTTNmhCLfnFEe/yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155211993"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 06:22:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 06:22:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 06:22:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 06:22:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpVRDRay5Cz/6OpFp1nlre8k3e6q8TMyvCmm2BpEwKadHeZjbyL7klx7jwUKpS+8toCYDFA1uIk5Lwv9V3c9xS61WDsenQK+NbSuK22eNGLoLY10g6MU7Pu2qZApwU8XSgyPMWpysqA7uomTpLEkvUHQgIhPf0kjUKxU9pT6vQXr0wqkMHTArnFJBWUxmjHYpNl/RzYTpuzzZR00438QVVpPVWn1TL6OgdVtdi9XA8vboRa5P68jUK+zU7iABqHmfzTZEIqhu0MpydK27kMRN+ljHRoG2swcV+ovT+w47e9p9TU6vuDUauRy+4csoIFS6mQp3WfrTNb/HgZdgkz0GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xl/9e8QPqJuNtUBHC2CToW3W1WO3Rl44dWQhAfrW6k=;
 b=SAxCzMfT96DzGkuDA+2spYO+1+yfTG90/0kkZYeKE2SVhbD1T2CPuVXaufB6yf1lApxJ04o7M1Md9YQa3I5yMVRcesI3nqx/3iJeKA2zb2nwGtBoTzX5JBII7iqKok2JbwhA+eoTfaH+IgC9TTof9nRSxQv3MHcppfHOdcqntuqVpYKgD5Uq/fvzIk1LihFf+dmMrh0bz7iIYBm3vluXt4mM1laUA/BF/yRNzvMtfdUQv5VqlBU1vC+PtDUbq9vbCVx+xHp5BIBblXkkes4fVZO7TB90iNNTC1UWoeCvrTR/MtEEoHYuDN8YfNL85AQeVEuZw++SdGhvIida2A6X2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MW6PR11MB8411.namprd11.prod.outlook.com (2603:10b6:303:23c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 19 Jun
 2025 13:21:51 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8835.025; Thu, 19 Jun 2025
 13:21:51 +0000
Message-ID: <9dbdfec2-0a2d-4110-b8ef-b9d16900ff87@intel.com>
Date: Thu, 19 Jun 2025 21:21:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
To: Yangyu Chen <cyy@cyyself.name>, Tim Chen <tim.c.chen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>, "Gautham R . Shenoy"
	<gautham.shenoy@amd.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>, Abel Wu
	<wuyun.abel@bytedance.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
	<linux-kernel@vger.kernel.org>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <tencent_6E51A3175F8AE0A7F684A319EE63CC56C806@qq.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <tencent_6E51A3175F8AE0A7F684A319EE63CC56C806@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR0401CA0034.apcprd04.prod.outlook.com
 (2603:1096:820:e::21) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MW6PR11MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7699c4-373b-418b-f7a3-08ddaf344021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y054Q09LQU5xZ2NWM3VWTWRvR1NpaHIxUk9Jek8reGpJdjZOaGdXYitlUklH?=
 =?utf-8?B?d3NBeXJNRUJOOVQ1NHBPVWtXOVgwUmhValZKMUpaMHhSazJJYzNSWi9RT3gy?=
 =?utf-8?B?WWlCa2lCVXBnU3ZHL3EydTc4U1JzR1FrZ0lxWmxxRSs1T3ViYnJLa2Qrb2Nu?=
 =?utf-8?B?M0t3S1B3NjUrQzJWSVVIK0VQSUc4UGZDZmQ0UnFPM2c1UjJILzgxN0JLVFVB?=
 =?utf-8?B?NG1TYnRWSjY3bWxodW5zQlBWcktBV1B6U1NFV3BaU05BYklScEtxN3VmUEFV?=
 =?utf-8?B?K3AzNVMwbU41bWhzZ0ovMStYTW9OUEF0MWlqZFFqVHRhSGsrSFdRelZyb0ta?=
 =?utf-8?B?MjlzSHg1MDg0dzVoVGo4S1RmNTEzLzNaUEtnazdhT0EzVU9kYTFSWHRqYllw?=
 =?utf-8?B?YVFJdEl0ME4vcVFrR25oNG1QeGgyOXA1b1JyZXJFLytxNlNNRlZaa25XcHk3?=
 =?utf-8?B?S3dkVkVDS3BzYkJpb3k2aDFFZVBFVkJwN3l1TkdNSHVuY2txRExMSSt2a2R5?=
 =?utf-8?B?a0JKU0tVOHVWUzdkNDJGVjlXYWd3bi8yQmpJbTRhUmFud1B0K243ZVRKK2RT?=
 =?utf-8?B?bE9aRHZBL1E4em5hSVdDKzYrVm5ZM2gvUldrK2hWYi96U0habWtqR1o5Y0FY?=
 =?utf-8?B?R0FjUEJDanJ4RjhIUjBrREx3WXUzUXc4ZUQ1ZXpxVTBXUzZaekFmMTF5WjJw?=
 =?utf-8?B?SUx0aFc5VWx4b1gwbnJTZXdmaHRFRlJoWm1pN21jaVVDd3RRNXZFNGRUQWtJ?=
 =?utf-8?B?SGU2bzdLa3crR1RIM3VmR1JjN3dEVnpJTjl5bmdObW03TEtFNUlUM0pSbTB2?=
 =?utf-8?B?YnVaNHN1WnlUbXE4L1QzSE5sTDNhQmRvVW5ZUHJCa3kxSEZrY1Rxb1hoV0xN?=
 =?utf-8?B?S25na09HU0Y0VUZsa2lUS25UaTg5VkxBc0o5Z1NRNC9GUkptazFJR3NmeVdO?=
 =?utf-8?B?NFlIWm5VeENiTEtVMFgwNzJLQkZ2WVpJaGwxdHV2ZlU3dDI1anREajFsTFpx?=
 =?utf-8?B?M2NERUhROEFHblNTaHpjbFhXSGRYUGhMTnpYTlFzelhzeU4vRGdIa2NqdHhI?=
 =?utf-8?B?cDVEcWdNSUNyd0FwMVRQajJlMEswU2o5MFREZWs5bjAvOXJyRUdvZ2NnamY5?=
 =?utf-8?B?WnF2NCtCUFlKdWFPd3hlUDdEOFZNUWtWRkJCSU9udkprWEcwVlhERjhuTmJD?=
 =?utf-8?B?di9UV0h4cFFOUVc4VFBXU2lCT2xUd1hROENFYmZ1Zml2bmlNbmd0bkdYVEJu?=
 =?utf-8?B?TzJOemI1aDNYdW5sY1paeVJmVXFKYitKN3lVRW5MYmx4K0FhTzZrenN0UHQ4?=
 =?utf-8?B?b3poRkMyeDV4dEpXVnNBU2JwcE5GdStUNzlCTW9RN1cwQ3h5ci9nNmRsODJS?=
 =?utf-8?B?MzNwNXZmZ1B2azBIT2s4WFdBZ0M1enJJR0kwVkU4YU5CQ1pmYTRXTmFyMUIx?=
 =?utf-8?B?K0NtaGNjMjlYamlRb0lHeE0vVWVuRG1ETmI3aTJTcU1OOG40R2FLQkdqL1VM?=
 =?utf-8?B?NDJ3MDNJbXBVdDgydXBqWllTeFQ0SHJJVjN1ckRoVElNcjluNTFTcFZwUzJa?=
 =?utf-8?B?dzJWSkxRUWxxRDI1SVNTN1U2Z1IzaU13SkRCSGNtTEEyKzlqTER6RUpCR25u?=
 =?utf-8?B?MEVxSndjUGdaQ1MvUElyUnhHaGpoZk1iVXhDeW9KUlBVMkhoQkZyeW9qNi8x?=
 =?utf-8?B?WHVQOTA1SE5tcEhvUFZYMUh1N0hHd1dCcW9KRmF5WkkwQ0JyN3lHUmdMTFhB?=
 =?utf-8?B?OVVZTDRWcC82MTB1dys5cHRzdGJlaFJtTy9XdUQyRVlsME83c0R5NkxLQ2Jj?=
 =?utf-8?B?UXk4Rk1ZS0U5a1hjaW11Tk5iMUJNM0o1bUNjMDgyN0h1VWZ3ckdYcGRDRFpX?=
 =?utf-8?B?WEZHd2h1VStUV0E0OG1iUmFiWHlUdThLaG15ME5DZjJSVCtRSDY4bkpBa25E?=
 =?utf-8?Q?74lOxsxR8xo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3RRdlJ6cnE1TGdZZWV0VkdLMm5wMkF2VG5Kamk1OEpldjNFc2J2cGxsa1Q3?=
 =?utf-8?B?T0pHdVBWUTZLaFNJR2hjRW1Zc2VOT1dlSEk2ZFJXQ1JUeGJ5Rmo4d1daMVpa?=
 =?utf-8?B?eVpXb0FQSnQ0SGR2ZHV4MGJYbTR3dks0ODZHV2k4MDQ4am9xZFlLWVVESENN?=
 =?utf-8?B?V0NwdThZcVVJTFZSSGtPbDBDdlZVdGVMWkVWa0VXc0hsQ1d1b2U0SUNrZTRo?=
 =?utf-8?B?aXNST0JubFZ3aG9WNTl0VFpIMnpHQkUyMjc0MUNYNFIvaXlpSUJSNHFkOUFm?=
 =?utf-8?B?eDdkUTlvL3R2T1pWZHNwZXZ3QTJRVlpTRllvQmQ4SVJYM0ZISmZZUHVsWXJx?=
 =?utf-8?B?UXVxVTNteG9taDlGU09iVEN5WVdSMk93RXFSclVqM1pnblVmMmR2Z3VqaUNj?=
 =?utf-8?B?MVFGMkUxUmVvYXFxZVFFUHU3TkhGb0hvVDhuS2VDTmpqQ3R5VVJlVlV2UnIz?=
 =?utf-8?B?R1ZUZGJvSndaRWdnUnVmdUc0ZHVaVk1KdVY3K1dXRi8wTFg4QkNzSDRGaVFY?=
 =?utf-8?B?K1h2QTgwdDI4eU85d00rNkFET0N6K3JBTjZ1akMvd05GUTNuZnhvTWZPS0ww?=
 =?utf-8?B?OEQ0T2Q2dDc0c0gzZEdmQUQ4NS9ESkxCYlI2ampJOGlGUFM3VE9jQjN1eXE2?=
 =?utf-8?B?aUh1d3pUYmRNRlVJUld2TWxoTEk5L3BUTENma0xsYlFpV3B4a2RCbEM0dko3?=
 =?utf-8?B?Z0JhaG1GaitSdmZyZnNaSmpXOVlMWmlCMDdCdk9ENjUzdlUzSy9JU0ptT0Vt?=
 =?utf-8?B?R3pZMmNMQUZxdDU1YTV3aHd4U2N5VnpaK0hQUlJ2eDdWaXV2R2k2Q3JnN0U0?=
 =?utf-8?B?WXVzalVwemJMeTBGa0RkeTkranlpbXBXWDB5bFBWM2dqQlpYOFVuUlZsUngr?=
 =?utf-8?B?Y2VTbGZmOWM4SEZySVEyVG1zK1Y2WFdvOW5zN0p5ZXdpamR1bFN0RFIrQlVz?=
 =?utf-8?B?a3JsMFVnSTJaTEtlRWt0UEtKZjdtV0xWQ3RUTk5QU25veVZtU1BPbHdWQ0NX?=
 =?utf-8?B?TDkxK0VhMlZ1clRYTkwwMDFqcTVuSHFrckNTdFJFVlM3UFIyc2VuUTFGUHpW?=
 =?utf-8?B?Zy85SVpDdk5Bcm50RUdXZWlaR2ZBbkZKbFF5MHhHZU52VXlpWVdhODBMRlpN?=
 =?utf-8?B?b1RHbDlPY0RqcDJhVzNRbXkwTDNXQWJMaDBPRXVVSmJCSlIzSS9GNnJXeUNj?=
 =?utf-8?B?dFFRUVZmSUZrSUdicHJuK0M0c2VLTHZYTDM4RXFLUDdrS01mZTNINGU1bW9o?=
 =?utf-8?B?azZ2NHhrTkcyS0tTUjhYYmdMbnRVVHJIQlhoRm9MenhNWm1kNUp6NWxhdmpl?=
 =?utf-8?B?Y0lVOGJJMFpreG4yTHp3anRSSFZxQ3F3Zm93Q0hwK3hpZUx4UXpUTlZjUENn?=
 =?utf-8?B?R0F2dHBqRmp6S05rVGJneVh3eUpZUjRPT0xFaEtmbDM1SmpUMk5KYklRaUVa?=
 =?utf-8?B?Z1A4ZVAzY3pCcnROSGtXWk1SNDB0L0srakw5MFRUNTlRNHgzdmNxNjV2T0s0?=
 =?utf-8?B?TFVlalVRSldkT2phRjdDSC9acDI2S1RZQkNac2hPN2kzUDQ1dStGTzZTK0xk?=
 =?utf-8?B?cVN1R1VNSlhxdUZOWnYvSjRCMlI3bHdZeGRncEdWY0pBYVl3T1hDSFJPUDBi?=
 =?utf-8?B?QmZqL1oveXJzSTJjdWJacHdxLythMlV0RFZDRmQ3aFhmdW5EcGVCRERxVVQ4?=
 =?utf-8?B?Y0pUL1d2MW9xVUVqcCsxTVNWYlpTVnhrZ2dBNHg5dC91cXpRa2NRV3BSOEFz?=
 =?utf-8?B?RUl6aTY5ZFFLbG5NNGtpQlI2UG5HczB5V0IrVVBESWJBNDh4eHk3Z1ROd0dt?=
 =?utf-8?B?YU9tZ1pERkJCS094WWxwTmxlVTZsYk41ektiZUhBMlR5b2trNVBuMlUzdzZX?=
 =?utf-8?B?eThzZWJPeHdJRUY5a2FQOGxXekhvcFl1dWZrRVIxUWllTEFBVUJBbVhGQzUy?=
 =?utf-8?B?ZlVzMEVPNXpOS2ZKVFpiNXN5MzNobHhxY1BMZEJvbXJLeDJtZEFZS2ZSQy9h?=
 =?utf-8?B?WmZLanpPZTYzVVJVbStNcSsxV1lZZzNFV1NkSGJjdkcxWFltMkFaazF1R3ZD?=
 =?utf-8?B?UEs1TUEwb2V5ZFZsSVcvTGN2bDVmVm9FNC82MUtKeXRFcjUvVWRma1E2Tm1E?=
 =?utf-8?Q?jbcy36Cdc2UQ+7SR8wYihYyzI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7699c4-373b-418b-f7a3-08ddaf344021
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:21:50.9790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqWiD05D4JZcp1XI9q4xIXYdnVw3yLCVd6id7GkKsbLu7fzyirTmwYwWwl+5mnVWvzRXv6UKTgvJe6jPI/dwyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8411
X-OriginatorOrg: intel.com

On 6/19/2025 2:39 PM, Yangyu Chen wrote:
> Nice work!
> 
> I've tested your patch based on commit fb4d33ab452e and found it
> incredibly helpful for Verilator with large RTL simulations like
> XiangShan [1] on AMD EPYC Geona.
> 
> I've created a simple benchmark [2] using a static build of an
> 8-thread Verilator of XiangShan. Simply clone the repository and
> run `make run`.
> 
> In a static allocated 8-CCX KVM (with a total of 128 vCPUs) on EPYC
> 9T24, before the patch, we have a simulation time of 49.348ms. This
> was because each thread was distributed across every CCX, resulting
> in extremely high core-to-core latency. However, after applying the
> patch, the entire 8-thread Verilator is allocated to a single CCX.
> Consequently, the simulation time was reduced to 24.196ms, which
> is a remarkable 2.03x faster than before. We don't need numactl
> anymore!
> 
> [1] https://github.com/OpenXiangShan/XiangShan
> [2] https://github.com/cyyself/chacha20-xiangshan
> 
> Tested-by: Yangyu Chen <cyy@cyyself.name>
> 

Thanks Yangyu for your test. May I know if these 8-threads have any
data sharing with each other, or each thread has their dedicated
data? Or, there is 1 main thread, the other 7 threads do the
chacha20 rotate and put the result to the main thread?
Anyway I tested it on a Xeon EMR with turbo-disabled and saw ~20%
reduction in the total time.

Thanks,
Chenyu

