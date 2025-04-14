Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0958125C6E6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744650601; cv=fail; b=IXIzMDmkLHlIIph/PdGa9liYkazg7n4Op/+hBgOodH62ANqvbOTn6lw+kQMEcsG1Y+rfKTGYiFdirI/0ZaKwrJ+5derRxKrGUl7XQaiVmHg70rjR/zAjWMAMhnLu18TXmGCFxr7nXcfx7VatjHngf3MqKqLdgruWoCJ/7zup0Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744650601; c=relaxed/simple;
	bh=FzpJQP8RVyP6Nck22G7D46OV0bW0tJoM5Mg6GcGgHpE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FVkT//91V7O8Y7yeFbWyDGC7zraBasQUD92H+jKe0DAS+SQcgEi3eiEi+dHn71iG24Js0o/TiIyFmRxk0PmNGL7+E14kXdX6kc4aXRHOK/EP4houFo5N1F1kcpQIuZJJb/TeLu6uhukbtSBxF5EYunGoQnUW68F7ZGMXZ1uOTK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iT5yKQvE; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iT5yKQvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744650599; x=1776186599;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FzpJQP8RVyP6Nck22G7D46OV0bW0tJoM5Mg6GcGgHpE=;
  b=iT5yKQvEkTT6k1M2Ayfj4YMINGuuIe9idSfqfXD/VzSBDM+j8lLBkED0
   2MCNObaXwbqv9ZN38aK+GicivLrf09FhtKp5ZQvPdysI3tarxqi9Bo8Al
   NES9w/30IK0BvHHEXYintcG+4B1ECbaf9f33Dx/ZJxDlAbkBP3/g1VI75
   OvELiUSMgcqe+GcE+ExoZtyigkKd7EyvxaUpiq3srewtoAutVye3mStM/
   XW0tJohT8FwFI9334CsfJ9+xIASM0C9EYfje33/ZCqFkwKfu02ug8WDBu
   ZPLEfeiPKZ01yOCTmwlw3FfQQV6HjriiKQsfxA+hZGh4QM+TJjQGijJYL
   w==;
X-CSE-ConnectionGUID: fVnpTtNwQD24U09jkkholA==
X-CSE-MsgGUID: Kn3jtNl4QYCofcZhiG8IvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49965586"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49965586"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:09:58 -0700
X-CSE-ConnectionGUID: u/FLPRZPQEmamLiGD7OTfg==
X-CSE-MsgGUID: nL/nNIBgQpWk2J75eFb6bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="133984274"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 10:09:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 10:09:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 10:09:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 10:09:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Net1XLeQqnQPk2aKMsB4CZXn7UKajhEG0zx2Dpx8qfRjbenJkvRdh0pXet9VdHk56dOKSyCMgIvbWvNh7t/9uAwzVggM4lfKO7eY0r96s2e9NxTzO/lDh9i3iytYPSlUQy0aNf9Q66oT4GSPpZ+5UWew3Qr5OmaRaphk+4tHbaDflbm9UKpyh8Wkwqra/Ja7apaJiUqNY9OZo+Vf8pmSJkqOMNEMRQH3Aq0Cjrpvlk8DgdVIj/XFqi0bdrTpcC531p0DDmM1Xj7kSjex4/T4WbKVFzBoEGQ4yj5KzOGGBcAeMtbAAKnKEw/IEX+R4RhjDeD7A4DG6QtWc4svMqXV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlp9BrktcoytZT2aNmxV//krShNf6pC9cc10WfyXQ5k=;
 b=aaRKLewJA/Q28wGd978RDRyzfaCgPxkqL92zTriPqdsywATymmiPGy9KjRH+QWRgZp9w/8wcDhJULeIzVmWJqeMMN2EZX65qxZuVjw5VrjnQLZWWgebGOYRWUmgTDJQNEbalTff6ly4Ewok/RHKPRfyKVdggNT/LYhhW+wiGRZxRvLjm3t7iD5i5X53zry4vsWfeXC8NNSB4jVGBn0xFfqcFkH2nxpxw8O4fvyJQWfxJmI84pufafeTobi3rE5bzL7/DDXlqR8rMbGhoMxXc1uw/zdsSCsPyqiOGB/Fgpb6x2D9KxAWxU24D+qv+eMwf4PJtTNTpuXIVRAfGLB5teg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by MW3PR11MB4601.namprd11.prod.outlook.com (2603:10b6:303:59::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 17:09:55 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%7]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 17:09:55 +0000
Message-ID: <b18e4a00-c404-474c-8839-862f78125f37@intel.com>
Date: Mon, 14 Apr 2025 10:09:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 7/9] x86/fpu/apx: Disallow conflicting MPX presence
Content-Language: en-US
To: "Chang S. Bae" <chang.seok.bae@intel.com>, <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250227184502.10288-1-chang.seok.bae@intel.com>
 <20250320234301.8342-1-chang.seok.bae@intel.com>
 <20250320234301.8342-8-chang.seok.bae@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250320234301.8342-8-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|MW3PR11MB4601:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae4b140-394b-42bb-4c9c-08dd7b772d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3M5eWlqMVIvekpLTU9qcFpwQWxtWnlSWEpGbU13cG9UKzFNZU52RGRIZVhz?=
 =?utf-8?B?NSt1bk5XNG9yQVl0U1Bvd09LMGIyWXlvQ3VOcSt3UG1jeEtxODM0THNlRGVp?=
 =?utf-8?B?Vk5weHlZMmVBc1lNendMTHg3eUJLYTd6K3lGU0MvR1dFeTNVYml4TEVDRW12?=
 =?utf-8?B?bmlkQldiSHloTHFFaXRWcFpqUFpUNU5OVlNrM2t0TnFsUWhHb1Y5a3Q3NXEv?=
 =?utf-8?B?ZWd5VjJaMk9jRVRaQmhyK1NpbFVzRGNxRUNYSkZJTTZhbUVoR3FBMjUyVksr?=
 =?utf-8?B?RndTWmVGYnlOS0JsRm1vaXNRbW81VWhXRElDY3h3MVlBeEJPTzJZdEtZUElE?=
 =?utf-8?B?WmJlaHR2Z0dQN2xTbGlsQWZudmtTQkE1UXRIUSszc1NSdndtNXQ4T0FzY2xu?=
 =?utf-8?B?ejFTalNVRzhGd21MOGNzQUFqQ3BUbFVRZE0wTWJxdGFZSGJzcVRYSU9oNW13?=
 =?utf-8?B?am0xbGx1K2hnaHNZd2ZYVHJuRUs5YWlYNU9oVjBhQkd0cnRRUEJvQVFFTklT?=
 =?utf-8?B?WTVNWEpCTkNiZ0RNRDVyVzBaYVNBWFNvcjBRemJMTU0vWTFsS2Y5cjdvT2g4?=
 =?utf-8?B?Q0FFTElsSUszcDZFOTFKMHdsSXQ5a093aXpKMkxQeHljOC9xYldHSUFPUEFk?=
 =?utf-8?B?bjNldGsyaVBiZVZuQm5CY1IxOE1ndlU1c3pzQy9ySC95RnRXRHRJS3d1MHJs?=
 =?utf-8?B?Sk1Wd2xVWTM0T2tueGtRRllESEQ2Z2pCMGRTTk9QNUc0VWxCZkRoejUyYmxa?=
 =?utf-8?B?aUtOSWhJNHhMWHhYL3MvUm9ZYjNHUmJ3R3RyN2s2eWphWnFJUDM5cVpzN3ps?=
 =?utf-8?B?ZXlzb2VnUTFkeElCTXUzVkZjQ3B0b2U0aTFndm45OWNrcHBuRGplWVl2Z2Rl?=
 =?utf-8?B?dStSMThFNXlkV01kTjB4MzFzV0swU092emJaZGJnVWtrT1hYZlVBb0FuRHNt?=
 =?utf-8?B?L0xPU05HdFk1Mzh2RmptMGZUZDlhVEN0MkVWTzJtbGFvVlNnazdYNlU4aWhU?=
 =?utf-8?B?c25HSWdCWWlzMUNubjduZVZXazlDR1FqNVlTTDJNeGxyVWttSVhVODdWVExO?=
 =?utf-8?B?ODUvL29KT204bFBQOC9kN2FqaUQ4TTJtRmRlRE9HR3RFaENMZnRLRTExR3pi?=
 =?utf-8?B?OUNKZ0R1OURIMmVZMVQrVzNNODV5UmZCOEhvYVhROVJLVjQvU2RrWlhPdWZR?=
 =?utf-8?B?ZkE3dkxDSHlHbFo1ZCt0MDNCS010MmFRQ29MLzNZWVlxVWx0cUowRXd0SHVL?=
 =?utf-8?B?L01JaWtMZzF5YmF1Vzk1RHNPRTBZTThoVXNZWlNGZ05Yb0ovbWl1cUl6aTNC?=
 =?utf-8?B?VU1JMnhWc3hjeHAwdUh1RTVxV0RZd00yUFdxMWZlU0x4MXlhT24wL2xEZVBZ?=
 =?utf-8?B?elBnSEhSUmJ0by93K2Y0TXZZc0RnRmRNRHdwYmZ6eURUQXJnMHFQOStPeFhl?=
 =?utf-8?B?YkFpQ1BwZ1Brd1pRdVZYV3ZLdkYramJRZGlZNmt1MkhyeXp1OFNqZkNjZCtN?=
 =?utf-8?B?Z1poSGc0bGtsZ1lhemVzS0Q1Yy9vREsvR0RBaTRJZ0dxZGNNSHV2VHJJN0lB?=
 =?utf-8?B?WWx5MCs4QU5qZWl4Tm5MYUR2ZjlJMmJLYy8wWXZWRG1xbnIxSktPN2pma0dY?=
 =?utf-8?B?VkRKUjd5RmIzaXlVNVRtUmdHTGNiMERpd2Mvc3BpTmk0OEZ2TTd5UTZiRzB1?=
 =?utf-8?B?MUd6T3B3VVJPcEhQdVlBSnZrOWo5SG5jeVE4c3hkclJVR3ZPZ0hwREgrMmlp?=
 =?utf-8?B?M3Z4MEdNaGVXT3ppRk0wUmFQQ2x1UDVQNk1Ha2g5VUIyazRxb0xYMG5HRFBn?=
 =?utf-8?B?ckkvazRNVnZSUWpTS1QvNXB4NDgxTkdkbTc3eTBkNHY4TjZKTWs1dCs0RnMz?=
 =?utf-8?B?cmdEbmdyVzF3c21KdytGb1crckJiVUZqMHY2ekhUV2VacnBrZXhkUVE2dmxj?=
 =?utf-8?Q?pxA0+dQiyqg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uml5ZmNhK080Y3ltK05Xa2V0YkpFU1lwdTlkSkc3VnRYaWluOUx6TWwyTzVH?=
 =?utf-8?B?MlE5eEtIdmUyblhscG5EL1hsY2JpdldWczJzN3psRlhoM2dxQUJQRGkxYkNx?=
 =?utf-8?B?b3k4T3F4UDhUWFk2TGUzT1FoRVNsNDBFNjEvZW9lbGZnd2Vpb2N1dndpYklY?=
 =?utf-8?B?VTF0V3VzSCtTY01Zblg5NzFZa2w1bFZmc3ZRRkd2UWpXaERHdjc2ZWN3ZVdH?=
 =?utf-8?B?RHFQR0M3THB2am9pVjY1eEhxT3hZWUJrZkMxcWJIcGFOcWhPaEpRWDkwWXgz?=
 =?utf-8?B?NUFZc3Y5eXc0WVJmSHBzdGNMbXJ0c2RPek85YWRnTjRmTy9CWGVlczMwdkZq?=
 =?utf-8?B?bFhuUi9LMC8rc05oeFl5amVzN1I1dTdmUjVERVlJREJ4ZWlDbkdpNHFjYnN6?=
 =?utf-8?B?S3dwWHYrUlBsb3ByeUdRTTJmWEd6eENLaTNaRkwvZ2JOUFBBQXpoeVlreHdz?=
 =?utf-8?B?b1VINUdBcmlEMHhMZU0wVHl2YndidCtKc0ZxbndiR2hLVkNFNklVaVJHS2py?=
 =?utf-8?B?L2xrS3VtaTJ1eEhGTzc5MmxoMW9mRCtVWmZMRFcrM0tnTTFWTE8yYVY1SXpT?=
 =?utf-8?B?dWtmaUw5ZEtqTW52VTVXdzFPYkVzVkNCSnA1WVErQzZHZkI4MUU2YVZEWVh5?=
 =?utf-8?B?OFlMRDhVbnVkY1hkSjlnVGJscjZkNk15TTBCZFRZeFkxeDNCSXBLZGZIOEJF?=
 =?utf-8?B?Mk80dE5IVkNQMk9ub2Iya3hrbzV2Qm8wd1NpUXYwSnU1eXdIL2JFTFBZVUVQ?=
 =?utf-8?B?Y242bTlDcktnNStUYnVyODhWS0lHZFk2cG5MVEtydkFhUXVvKzcxZC9QZXk3?=
 =?utf-8?B?OFpWMGFKUFpjSnd4WHRoSkdwYzd5ayt4OVY1L3hmc1VSUzJZUmxreWxGRU4w?=
 =?utf-8?B?MHNUYmduckxtbmVoWTBlSkpPNFNvV29GME9pSjdwMk1GMGNIU2h6UVlzbDFE?=
 =?utf-8?B?Y05YSDZMVnNaQzBJOHo2OE84NDNMeFJHT21pcEhTcjdHa3ltbDZ5YVlUcUpG?=
 =?utf-8?B?Ym5UQ3dDN3JGa2ZsN1RlalM3cDUwemVURXVnR3laNXJoM2VZSnRLQkl2cDlD?=
 =?utf-8?B?d0xhcSt0cjlKelQ4TkMyanorZjNrSVc1VjZBSC93c2V4NldxaWRTbWFuVnNn?=
 =?utf-8?B?cC85TFozWGdLUUxMVWRNYWRtREVnSFVNUzBhVk8vUFBCNWtGTk0rNGFoY1FN?=
 =?utf-8?B?NjRFbC9JeXlCeWNIeFZMcERJWk5Vc1JhUVlvdkdDejV3cTNHd3BNUzNXQjdT?=
 =?utf-8?B?QkE5SGRRRmU5R3RVYU9Jekl5a3N3V3pZMVpyUm85RnpHdmJqejEyK2h4YTYv?=
 =?utf-8?B?MktibWc5MXhlRjhUT2pydWNWaFVSUUh4ZEpFRGovdWpUaVN3TlNrT3BkZFBx?=
 =?utf-8?B?K3FiU2R0ellDOEozOU53VWNCQi9EYzJFMkJwYVVrYjFzMDZ1akVJL01xc1Bv?=
 =?utf-8?B?bng4OVFRdHM5QTFBV3NKanpKQmVXVmZhMmZLU1NVa016QTNHcnp3UlRTdGtO?=
 =?utf-8?B?SVlFblFmQzk5d2RERzFRdkc2MjJHaVZDRVF4RWJZZDZHQm16akNNbitKYThY?=
 =?utf-8?B?UjdIZ2dJSGNFZFo3R2lqdW04UWE5RGIrblhzWmNQajlIUGczWXlEWjFsKzg0?=
 =?utf-8?B?SVFNWXJYMGFnMi9oYTRad3FnUHRIcGhEVE5WaEI5QkM1SHVxemsrVUhmYnoy?=
 =?utf-8?B?c3UrK0phOWxvUzFVL1hlQWE4VWpWRHQzM0U0WGFOWU5wcGYvWWttaThITVdo?=
 =?utf-8?B?ODdZNEx2NFY5MkU2djhPalRILzdzUjVObXlGbVVNVDc0VWpwZkxKUE5rczhC?=
 =?utf-8?B?UGNBSjJQdkFQWVVXQVdQQzU0U3g0ZGN1eU8xVjJRSWRpRkJzcGw2QzZKc0Ex?=
 =?utf-8?B?dm9LK1lTZWJoNFpRN3NOdU1EbW5GSEt2bzdNSld2N2dwYUJJVDNkbWNYdjR5?=
 =?utf-8?B?MjJTank0NWI1RTBCRHM5ODhCQ1J4YTdBTjhxOTB5NVZxZlp5T3c4NUd3aytt?=
 =?utf-8?B?MXZ1OUltelNvWFI0K2NuL05kc1docVljZkRvZy8va0VXSFF0ZVFOeHV1K0Vs?=
 =?utf-8?B?R3JoZTBHZG5USTRyNXJXNjc1TXZKQkR3NW00ZmRDdzdzdWNNR05MS0ZkSys5?=
 =?utf-8?Q?Cu/4yTfkzur7oVN8H1FwgzXZt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae4b140-394b-42bb-4c9c-08dd7b772d58
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 17:09:55.0480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wmq3cIJc14UyAxu69DUgy0ION0fihvmbWPNuvR87CERH+etkblqpQcoXcaEONjZRTiAF1p4GioaPYh0CLd7Ftg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4601
X-OriginatorOrg: intel.com

On 3/20/2025 4:42 PM, Chang S. Bae wrote:
> APX is introduced as xstate component 19, following AMX. However, in the
> non-compacted format, its offset overlaps with the space previously
> occupied by the now-deprecated MPX:
> 
>   45fc24e89b7c ("x86/mpx: remove MPX from arch/x86")
> 

Would it be useful to describe why and how this is possible?

My knowledge on this fairly limited, is it because the size of the APX
register state is the same or less than the legacy MPX state?

Also, what other options does the kernel have to handle this?

There was an earlier email from Dave that describes the trade-offs.
Would it be useful to insert some form of summary here or in a different
patch?
https://lore.kernel.org/lkml/674db309-e206-4bb4-bf99-b3c39bff7973@intel.com/


> To prevent conflicts, the kernel must ensure the CPU never expose both
> features at the same time. If so, it indicates unreliable hardware. In
> such cases, XSAVE should be disabled entirely as a precautionary measure.
> 
> Add a sanity check to detect this condition and disable XSAVE if an
> invalid hardware configuration is identified.
> 
> Note: MPX state components remain enabled on legacy systems solely for
> KVM guest support.
> 

I didn't understand this properly. Can you please explain more? Is there
an impact or restriction that this imposes on a combination of legacy
and modern components?
Old KVM — new Guest kernel
 	or
New KVM — Old guest kernel

> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> ---
>  arch/x86/kernel/fpu/xstate.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
> index 2a270683a762..0d68d5c4bc48 100644
> --- a/arch/x86/kernel/fpu/xstate.c
> +++ b/arch/x86/kernel/fpu/xstate.c
> @@ -814,6 +814,17 @@ void __init fpu__init_system_xstate(unsigned int legacy_size)
>  		goto out_disable;
>  	}
>  
> +	if (fpu_kernel_cfg.max_features & XFEATURE_MASK_APX &&
> +	    fpu_kernel_cfg.max_features & (XFEATURE_MASK_BNDREGS | XFEATURE_MASK_BNDCSR)) {
> +		/*
> +		 * This is a problematic CPU configuration where two
> +		 * conflicting state components are both enumerated.
> +		 */
> +		pr_err("x86/fpu: both APX and MPX present in the CPU's xstate features: 0x%llx.\n",
> +		       fpu_kernel_cfg.max_features);

s/both/Both

For the user, this statement doesn't necessarily seem like an error
message, nor does it say what action the kernel takes.
IIUC, there is no other print that says the kernel is disabling XSAVE
once it jumps to out_disable?

It might be useful to add a "disabling XSAVE" print at the end of this
statement, like the other error messages in the same function.

With this change,
Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

> +		goto out_disable;
> +	}
> +
>  	fpu_kernel_cfg.independent_features = fpu_kernel_cfg.max_features &
>  					      XFEATURE_MASK_INDEPENDENT;
>  

