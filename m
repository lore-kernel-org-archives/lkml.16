Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B57D2367D9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390533; cv=fail; b=BesuDPkyROcgi6MsP7Lsh8QFMMHMi7c9skS1OJZDtc/GhOesYPdPYtu6xbVU4/Mk5MYS+D1MY3z2BZrx60hgaIfisQpbv6NI1NcEIc5T9JGo6DvL5EaULeroVhrPpReEk/3b9kIbhbqUmmwluFpKkARAfen/vyXSNASwn6ISvlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390533; c=relaxed/simple;
	bh=C502muoYmszNmTimYHgxIT1U2AUACKjjKlyVdmscI3o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PmzfZi3kjpV4czanSA/9X0pDZ0o8sp11/N0Ez3qKvMDjEKomTmZq43f21YhVXwqBKH9V9OYH2FJCBq3UbJ5wx1zM6P1ORcJh6K4Fb3mp7HzWLKf7XwYFfeK6le9rPDuHe27+ZwKh1gwb2NVRt0XpHbqBzcyViyIDXMvouQky3GM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LU6s86LP; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LU6s86LP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744390531; x=1775926531;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C502muoYmszNmTimYHgxIT1U2AUACKjjKlyVdmscI3o=;
  b=LU6s86LPePmPckzvcGTLbqVckBl4qeyLZbjivDckxw14Y3+ToboAyp1Y
   6C1ZJGPPkdxvmBpt3XXZQ5yYzOBMV+m9KIhQUL+bWzL3o2QIaIItBBvye
   /Q+eukK1z4yL3MAKfoq8RtSSnQ+3QX4J+dRz1LjGqAFZCac2qQB/YeW2T
   +rvkZ4fnpP/twfBQ0Enxyl7PRh4/PI14YYvbL37ZD/ZfBqmfVMwdINbwX
   3Wg4lXgwupyjcD9auD8EVVoBG/kMkC3KeArFYbivYedk0GQqO69XTHuxy
   DvcBJiin+WMRtg02zB1ARbllhBFgzifO4tc5ZE97q3I44ogPba76QYUqy
   A==;
X-CSE-ConnectionGUID: cDPVMA7xTl2yX2HeBlbFdg==
X-CSE-MsgGUID: pDCboVusQla69C50Tqpw0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="33563677"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="33563677"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 09:55:30 -0700
X-CSE-ConnectionGUID: b/aEQjZeRSmNCn6nPr4wWQ==
X-CSE-MsgGUID: dUwu0aK/QG+uadTMVk1xVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="152427790"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 09:55:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 09:55:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 09:55:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 09:55:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=robuQwNQOynORojqeXzC0x9pNEDCucs/DK8r/Ad5zsk84OM7h5NHLVr0plOiwBMgIGAsDBbZLSPRejs5N0D1kz5siZ6DMpqBXpb+vfvRijV4hREP70abBfvRE0hWgwQXmkCFAFojo2j4c5K47uAvYl0f3wKhi077PhshctMFITlH6JdfDwdGN310cUbJ+05e2DD7Dbr2BmHNMI+vXUH06Bx9U0xle1+trQzfz5HDUj+dflxdZyGa6y86yG+frqJdVfcFdt1MDOaXqtrAaqLLkTvdpAiflSIVlaX1mTXTilhG9ShlvLNXWr4hHLm63YWfbYZt1egq7x8YVfT2Bwilbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19G9owuRpMQOQl/idAytfCtcYdX88liZHYLKyjxDXVM=;
 b=lTqwtUZkPIkpfa38J341mT60pfPYVltBaM96hAA4Fewjw6MWXWzb/e23graMLQq2jX8MxFy0DV40LP1Way1tfkpE5hqrRd5zJ3Na4bCW84OrrlpZJKQyNL9GAED5gLhG1kqQP7j2B825X8GGDzJa1CCYVmNNsfYyt9CvD23WnAFK29OZI58oN+ZErTM+vWIFd6deAyH7Fea47BFiVfvk4zB0HSnjWzAGdvv0NffQ8dJGYQZlVCi/OWW6obZH3LrN9Hm6K1wtSrQxgzQkmE6MDdXESnLgZmOTOgt2uqqoQHsjjhBHJC2kO9RN7QU25Mub7CvlwB14JhjLyQfFjUncaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by BL1PR11MB5240.namprd11.prod.outlook.com (2603:10b6:208:30a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 16:54:59 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 16:54:58 +0000
Message-ID: <d076ee8c-0c22-4e99-964c-5ea254f5be14@intel.com>
Date: Fri, 11 Apr 2025 09:54:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2a 5/9] x86/cpufeatures: Add X86_FEATURE_APX
To: "Chang S. Bae" <chang.seok.bae@intel.com>, <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
References: <20250320234301.8342-6-chang.seok.bae@intel.com>
 <20250411161250.14662-1-chang.seok.bae@intel.com>
Content-Language: en-US
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20250411161250.14662-1-chang.seok.bae@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::24) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|BL1PR11MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4fb424-1bdc-413b-2473-08dd791997e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXVXWHJ6dU0yUGxaNHRQaEFGTFFDZnVhVWJ1WnJCaGVKQ2MzOUpIOGtCWHV0?=
 =?utf-8?B?Nm1pUkpLbmhsdStxaXNzeFBaRXJQclVZR2NZem9uYkhKRFRsUStsK0ZBMnZB?=
 =?utf-8?B?U3RUcFFIdWp0VDlyUlVYT2VBMFQ5UDd2QXpFK01rcXNYekhhNkN5dXZxNmxF?=
 =?utf-8?B?UXpjalpvL0cvWkRwQlZud3U5aVAwQ0ZWNjJrNHYvWG9SbUNEMmE5U2t0U3U0?=
 =?utf-8?B?Z2dQRlp0UWc3U3BkelJaQ3BmMTVNYklSVHBjSTZGaGJySTVCYUUzMDd4dDdp?=
 =?utf-8?B?QTl3UjloNVpLV2dFSUUrOWNYajlOaUJnVUlkaFBRR0t3T0MrUEtNa0xhd2tD?=
 =?utf-8?B?eE0xQVVKQXFpMUluMFN0K2RFNFUxN2V3ckY3MEVCMVd3ZnFYUk5OcVA5NFB4?=
 =?utf-8?B?dFgrMzNTdGp1aWhLdXdVaHFLOUdpYi9MYTdEMGJXbCtDcmRrdlphTndKc0VD?=
 =?utf-8?B?ZEZJbm92bDVrK2UvdHQvdUJ4Z05EYjZMcHdwcXVhd2lqMG45RkkvRzNQMy9L?=
 =?utf-8?B?ajhDY2VvREovZXRFSFBsZ0gzNlNDWGtDTjdaUVcxUStxT0lGM0RrK2FLNjd2?=
 =?utf-8?B?SVB4V2RSQkFvS3dQMlhZZ3JRa0tSYnA0ajRBSCtVOGJnRGttMldiMjdmakJM?=
 =?utf-8?B?UkYzbnk0aVVYUDUyN0xvemJWWTllNUV5aFk1RjJXWkdvWkE2NlNmYVlaMVUr?=
 =?utf-8?B?MVh6TEgySEZJSHJIaExKbmRoWHMwZFE4TzZjOW1QcTN4V3BCb3QwTElLbG5M?=
 =?utf-8?B?ekZBNjNPM0orNHZTUkkvbFRvWStOSDNIek5vZGkyb0RUUmxndkFZc2padlFJ?=
 =?utf-8?B?cGE4cUlSM1BES2huVjA5ZjQ5NTExdlhmaCtUKzJjV1A1TGdKNWVZeWFCU3Jq?=
 =?utf-8?B?aUtzRGRBbFphU1dERHpzMXFmczlrei9TSUNOQkJlOGpGWFhBRURUa1FMVGJZ?=
 =?utf-8?B?UWhKcDlJNjUwK3BwWUFlK2ZvREM0UkxWWjlabFJ2OEYxb2VJK1hoWTk1Ulo2?=
 =?utf-8?B?cDNwMUFsK3JwQ3dKdFJWSHB0SWVqRFpMQjRSbDRkVVB4MzYwUEJVSnBEaVRj?=
 =?utf-8?B?MjNLZ3JPY1lCeU1TdjlvZUg4eHQ4R1FLcjFQM2VnYmxtbTdWMmMrVk5kNWFi?=
 =?utf-8?B?RkQ5VmsvOW9oVzN6WGRJaXdvMnJwc3JVQ2xieFVhN2FBRlF6SHEwOXIxUFZT?=
 =?utf-8?B?TUlsak44RlljZDEzWlY2dVloVUJjSUIrZzJ1RnFSd1RRaU40U2dFSmRPWEVE?=
 =?utf-8?B?d1pPaDZKUkR6S05aR1JZV203eFNwdE1jY2lhYkFRVGh0d2Zwd2NrVDhCUDBK?=
 =?utf-8?B?SXNrb200cHpCSndEMHpaUEN6RWNsMGFtN0twRFl4Rkd4MzZjamduQjF6Tm51?=
 =?utf-8?B?Z0NzQzlTQk9Ta1BtMjRtYVFhSHFYWDMxSzJJMHpwUWJZcmt0QkFFcG5Xend2?=
 =?utf-8?B?N25xcnNtc1VJWjBVRFFCdmlDTUtTLzZwcjgyczhML1ZaL00wS1RseTkvWVlV?=
 =?utf-8?B?SlZxZ3pkeW1VN2pxb2kwTGl6Mm5lSWpRUXFqTklJbFhNWlB2S1VnUnBuVnVD?=
 =?utf-8?B?dFNWcTZQdjRPaDF6UnFKZXVHT285elUwMVYvMUg0K0gzYi92S2VVQ3RuSjJx?=
 =?utf-8?B?SzlLci8rSFBYWTB2SkYzNkl2Y0E5dmlsUENSL05pSFJmc2gyMkdEWU1DQmRD?=
 =?utf-8?B?d2NWS1huU1FBcW9YQm1Ld3B0RWVIRkJhd0p5OXEzQ1dDZnFFNW54K2F4K21X?=
 =?utf-8?B?Z25jSGtmTlpudEo2Q3NKMnc2MGN1NEJuZ1QyaVZkR2xDbjlueVg4MXNEVlky?=
 =?utf-8?B?TjdReTRTOEE1MG1YZ2JKeXhxQkNvVFhaelJxdGIyTWQyV2pVeE0wSWhwZVF2?=
 =?utf-8?B?aHpQV01hQzBHemNRcTlKRk1SNityRUUxb2tzbEZlL2NlOWQ1cmRWK3pFeU9S?=
 =?utf-8?Q?T05SDQPgb8E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anBGdDBqY2M1c3lSanRvdTBUa1R0K01OTXR0czZWZExhVlNScVFOL3FYRE9n?=
 =?utf-8?B?TTd6b0hmakkwQXdtc0d2Y1BPd2tVaTVMMU53Z08zRERtNTBNNWl0c0ZmdWFu?=
 =?utf-8?B?RVZqN1RHQTYxNEFyOWRmUE1YRUc0YnRLajNvYTBqWEhxenR5bmJGRllFbU91?=
 =?utf-8?B?K1RqajV5VldTVXZOZTdQSjZRRnhtcmNBdllQaVhpU3daditLSWl6RUVodjlL?=
 =?utf-8?B?MWlqdVBrcmVrSm1MaXV0Ti91ZVNsbGR1eU1wSHgzaVRWUkYvTUljRloycVox?=
 =?utf-8?B?R2ppdzdscmpXU3VSdWs5NkRtczFGOFh3MzJPcTFuWHZpdW9SdTh0bWp6ZUxu?=
 =?utf-8?B?aUl3bk9mWmVvYzdmTkRvUEdDRk9vbVFQU0pCYkVLQUJZRVNNeUJyb08vUUs0?=
 =?utf-8?B?S3NVcXVHRWlIbHBwaVdtN3pidWtsMmt6UTlTNWU3azA3akJqdlBKWGp2MlRP?=
 =?utf-8?B?aDhpOVhtaUg2K2NvSXNrTjl6bVhrYnVyREZkR0VhZDROYVFOTWQ5Myt6eWdY?=
 =?utf-8?B?OXNIbUdpd3BTY3N5d1BBbHpuODlvclZhVmViQ3p1d2s5c01peGlJcjJxbFVi?=
 =?utf-8?B?VEpoTUIraFpZREprQ0Y1bmI1ZDgxSWZ5UW53QzA3WW80WElqQ1BDQVRIY053?=
 =?utf-8?B?d3FBcmo1ei80aTdzZXRESHhxSHA3eStXcUpRbnMxZW9UdFpwaTJCSVZKQUMw?=
 =?utf-8?B?NnpGSzBZOWE3bFBYSmhXdko4VzlPd3dMaXZnZWFBNHlMZkJ5K3dlNjIyaStt?=
 =?utf-8?B?YnNOT2xOSWU5aU5Jc0ZPUnYyVzlZdXRJUXFyNm5zeVBOZ0JILzNMalJnV1Jo?=
 =?utf-8?B?TWVCM3Vnbm4vb2JFa05pZjJjM3h2bnZCdkpPRWp5YVhCV1pmbyt5am9WNi9z?=
 =?utf-8?B?WlVRc0hVQkUvRUYwTEZrSjZhbkpxcHdQVGltUktKSGdsWTd6dUc1T0w2cVJL?=
 =?utf-8?B?UWFmY0NpWVpYK0Yrd3lzbTBVQ081NVo4M0dnblp6OHhJWC9JNlI1WHN2SjB1?=
 =?utf-8?B?dUxYSnNBM1h6Q2pVY3d1QlVoc2U2NzJ2cHpaMkJKSGtPa3Y3eVFLNzNNYkoz?=
 =?utf-8?B?Yyt6Skh5aUZJQm4xaVg1R2NRMUxHV2RGUGdzVi91dmlPRXo5ZDN3MHlHQ2p4?=
 =?utf-8?B?cWhLMHdVM0trSm45VVJMeTczUGV3M1Y0VXRUN1YzNUJyWkE4YTVMNGx1bG02?=
 =?utf-8?B?KzdYZFRyZkVhYUxsWVBERnF3d3M1QWZMVkE4YUFDenZtcklCOFgwWUlZN1VP?=
 =?utf-8?B?VTIreGl4YmxLTmkyL0tidmdRcDJRczZCb3FKblc3b3Z0ZFAzK0ZkMnFoaDdk?=
 =?utf-8?B?d0I4ZVdXQmJRcUZPR0pQeTBNWGFBaERxYjE4T0k4ZTR1eUt1alljbXQra29w?=
 =?utf-8?B?VzFJWHorckcrNi9yZHVRZStwcFErMG5FQWNLeEU3UWRvc3lJa1NSU002a3Q3?=
 =?utf-8?B?aDJxUVU5bFRCZ0ppcWY2Qy9ScEprODU2dFZRUlVCTHdETnFkNmluSzBZcFpD?=
 =?utf-8?B?R29JTE9peVRKQjVWcDNlYTc4WDYzSXgrei9MbWZIeUpmbEtQRFl6MmNrUTNq?=
 =?utf-8?B?M0FRZEtyL2ttaFI5ZXR6REdMbEhGL2JTdEtiSVJtYzMvVW1EK2NGOHRpVndW?=
 =?utf-8?B?Rnlwc1YyQmlLNnEvTmJ5N2gxeCthSEErRUxSUEhkQXRlcTl0V3Nxb2MxOGR4?=
 =?utf-8?B?MWhRa0VCem03Y1lrUnJQZktOcXQwY2lyZERDSUkzOXF6MkFwKzUxdk9CdWZV?=
 =?utf-8?B?SjBTQ2pHeEJ2cE1VV3BRNUl1QUt2azZjR3R1aFFqaGwzM21tZjlUZkVhdHNW?=
 =?utf-8?B?YUFpTWlEV09VZzIrYjFrTkRWb1JiS0RxRHh4ZXBBWWlDUjFWNkIzelN0ZkND?=
 =?utf-8?B?WjZ5bHFBN1g0VDg2Vnl1cGtxUGxLS0ZwM2U3eTFlQzhDY0xtcWRqSTJDaUxR?=
 =?utf-8?B?Mmg4QWczVXE1Rm9WeFl4aTBTcURVTkRpSWVpcDErVEJ0NzZqSXJ4SXlwb29n?=
 =?utf-8?B?YUs1aVB1ejRBemVRdXJwS24rMitHUWp2VUY1cFF5dnpkQ25CeUJJS3NSTGNq?=
 =?utf-8?B?YXcwb1hFRkw5cnVMeEVJeHNUTnpZRzhVM3Q0aWNnWWtWckozMUUrUkdUS21X?=
 =?utf-8?Q?w0dULUMyiiAE2b+moKkjLdQAx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4fb424-1bdc-413b-2473-08dd791997e0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 16:54:58.7586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+emQ3ZqfQMi3Bjn373yxtBUGEF/uPJOfRoIuuvlWcfYPU0dDMvejb0WrDSldLTNz631ZMb9uOdASfuTzxvvAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5240
X-OriginatorOrg: intel.com

On 4/11/2025 9:12 AM, Chang S. Bae wrote:

> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index 6c2c152d8a67..5445937eff3d 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -481,6 +481,7 @@
>  #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
>  #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
>  #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
> +#define X86_FEATURE_APX			(21*32 + 9) /* Advanced #Performance Extensions */
>  

Is the '#' before 'Performance' intentional? The previous version didn't
seem to have it.

>  /*
>   * BUG word(s)
> diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
> index 94c062cddfa4..7c1268138a7a 100644
> --- a/arch/x86/kernel/cpu/cpuid-deps.c
> +++ b/arch/x86/kernel/cpu/cpuid-deps.c
> @@ -88,6 +88,7 @@ static const struct cpuid_dep cpuid_deps[] = {
>  	{ X86_FEATURE_SHSTK,			X86_FEATURE_XSAVES    },
>  	{ X86_FEATURE_FRED,			X86_FEATURE_LKGS      },
>  	{ X86_FEATURE_SPEC_CTRL_SSBD,		X86_FEATURE_SPEC_CTRL },
> +	{ X86_FEATURE_APX,			X86_FEATURE_XSAVE     },

I don't think this table follows any specific logic, but recent patches
have tried grouping by similar features or features with similar
dependencies.

I don't have a preference, but should this be inserted closer to other
XSAVE dependent features?

    { X86_FEATURE_PKU,                      X86_FEATURE_XSAVE     },
    { X86_FEATURE_MPX,                      X86_FEATURE_XSAVE     },
    { X86_FEATURE_XGETBV1,                  X86_FEATURE_XSAVE     },
+   { X86_FEATURE_APX,                      X86_FEATURE_XSAVE     },
    { X86_FEATURE_CMOV,                     X86_FEATURE_FXSR      },


>  	{}
>  };
>  
> diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
> index 16f3ca30626a..6c40d5af8479 100644
> --- a/arch/x86/kernel/cpu/scattered.c
> +++ b/arch/x86/kernel/cpu/scattered.c
> @@ -54,6 +54,7 @@ static const struct cpuid_bit cpuid_bits[] = {
>  	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
>  	{ X86_FEATURE_AMD_LBR_PMC_FREEZE,	CPUID_EAX,  2, 0x80000022, 0 },
>  	{ X86_FEATURE_AMD_HETEROGENEOUS_CORES,	CPUID_EAX, 30, 0x80000026, 0 },
> +	{ X86_FEATURE_APX,			CPUID_EDX, 21, 0x00000007, 1 },

There is a comment on top of that table that says:
"Please keep the leaf sorted by cpuid_bit.level for faster search."

Based on that, APX should be inserted here:

 { X86_FEATURE_INTEL_PPIN,               CPUID_EBX,  0, 0x00000007, 1 },
+{ X86_FEATURE_APX,                      CPUID_EDX, 21, 0x00000007, 1 },
 { X86_FEATURE_RRSBA_CTRL,               CPUID_EDX,  2, 0x00000007, 2 },

>  	{ 0, 0, 0, 0, 0 }
>  };
>  

