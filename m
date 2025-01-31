Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E398720318;
	Fri, 31 Jan 2025 21:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738357276; cv=fail; b=UuS2IpOUMZBPrb7fReL3MNp+2IGMzhTP3Z3kjKmhXDGJTiBY4GmvOQnkotpiz6khOTcwgVAA94dSM1vN29SHLjkMc8F9ZrcOZnDC4/XNmE2kSFmVst05f8HBxhlhUBtwUp5iKkdScHqTiO9qK5RdBj1BDmxHzr56oiv8+CuCGtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738357276; c=relaxed/simple;
	bh=omMDYSHIjdAGxg+g1TkzcoEAzx5rHB0lgQEFSfsaj0s=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i8aHYAP24+8mgqMpOmruXbSYSsXCNPg8+TS1Oq3qn+zyPH9vigpXlrdsnHXGDPlBXki8JY5nv/abzaBmVebFFkyQ0aHfbH9//QyoFCnM+VHPfzwQ8Kb8XLp3OngHFnly+YQXpOCyDHcHve33I1IeuIPzFvFOClQBbWiWpy6TtTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5UMlvbb; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5UMlvbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738357275; x=1769893275;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=omMDYSHIjdAGxg+g1TkzcoEAzx5rHB0lgQEFSfsaj0s=;
  b=M5UMlvbbrzbJtnBylGLFjbINTTOdVLC0NvD5DwTSuL3PVfOI/yH04Ipy
   wzoeLJ1HKWvX4d+3ygGJ/y5Mp/BZHJurgrVrLpJArX+5PGsKMUgnCA2NE
   abaTUVquCEHXzyOn/YBoQKsSG1WIhjZzAlOgfVi8dXzBxEWDcTEMRpxAU
   3kuHRnGHc1lUFpab2NJkgZIsV2VVXSy9xUI8cflUzrg+QTa+vT3iWWU1e
   ZObiej0KeYatOQW844WYhQQF4Losas/8PHnE3ASjEi08pxYImOWYQ2p86
   eBLb/PX5J6MPSwyoneOgE/qOY+CSW7GLJjIT4atZICzntqC4Zr3qONrDV
   g==;
X-CSE-ConnectionGUID: ukyBqe65THmKV7mBeBzvrQ==
X-CSE-MsgGUID: O5oBhq0MSjmi6ZNG/+HNJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49926138"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="49926138"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 13:01:14 -0800
X-CSE-ConnectionGUID: XudS//94T82AH28Js5H3UA==
X-CSE-MsgGUID: tQBsK/wwTjWTZUdK7W/9Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109571228"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jan 2025 13:01:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 13:01:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 13:01:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 13:01:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMCWNQ++0rFl1MsX3QibWwvtubmWFhLtj3uWouR+YUEDVPADnFBlYLHvz1uOatMrZWEMJR2uzFi/kHQerDjZbrpIFm/+OCX+gAkK1fwhN2DWEG2yCTYpU5s3BKfxKaeGyEPxhJViaaZQwU40FDdIDD0fbFFoKEM2V+6FzUlemM9mJj+UptXrBzNRL9a0+Q3jvxU0TJW2tCr7OjJIQTwzJIZQi44B7YNNu3oTu0kO1ouT0N+Av2zYmxa4ilCK2GSlCo77LL2WBzbxEGghZIZleiiuPqnmqk5sqID82KANSmaSnjqnIkH72QaduCWbjMg39o03X39af1KX6r+1HRwnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArM8nFdYq+6wNyRc0i8FnGU+GyLy1j/A9tvdFdHKHJg=;
 b=mDO8vwpekPemcnpeMzEWBuWwjRhM5LzH3T905887uf1MK94v/N7CQNGd07S1jYWXA1wjtbcQqzcbSQxumlrICTt6qGj7uldg5jb0hLr336wH1AG/GZh/m8UtFcNZZ1Cg3+YHbRdfw6Hs8KZ46hqkUmT5/unq7XqDsi0duF6LI7DZPAjMDEQdPN/i7h4tyo4Lki2unthUgvG4Qgxyn9LrKcNdnehYUEV51ksWzFdqDN8A9ki9WAYIscXGNJ/d2rqxEhnCv7HTcNuBNcva51kwNNh/SrCAfSUGq+w+s2I3RHJwE/yvuSGMV9QRqS/TfL3jbDoxzn1Vm3DZJhMC+AVimg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by DS0PR11MB7286.namprd11.prod.outlook.com (2603:10b6:8:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Fri, 31 Jan
 2025 21:00:57 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%3]) with mapi id 15.20.8398.021; Fri, 31 Jan 2025
 21:00:57 +0000
Message-ID: <82a64793-a585-4d4e-afcf-b5fdba72bf9e@intel.com>
Date: Fri, 31 Jan 2025 13:00:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/intel/ifs: Update documentation to match
 current availability of firmware images
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Anisse
 Astier" <anisse@astier.eu>
CC: <ashok.raj.linux@gmail.com>, Hans de Goede <hdegoede@redhat.com>, LKML
	<linux-kernel@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<tony.luck@intel.com>
References: <928769f4-081c-4655-ad8a-f7b65ea21749@intel.com>
 <20250121183930.182315-1-anisse@astier.eu>
 <894eda78-d942-22a7-2349-b70ac3a9f836@linux.intel.com>
Content-Language: en-US
From: "Joseph, Jithu" <jithu.joseph@intel.com>
In-Reply-To: <894eda78-d942-22a7-2349-b70ac3a9f836@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::30) To BN0PR11MB5758.namprd11.prod.outlook.com
 (2603:10b6:408:166::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5758:EE_|DS0PR11MB7286:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c7604b-155b-41c5-2891-08dd423a5ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TExTUjBoZ1VmS24vVEY0NHNFSCs3YVlWc2E1RDRZMHhpYll1cklQeUxVNkhJ?=
 =?utf-8?B?QS9QQXZ3S1k3ckxYUmIwQkxqK1hOdUNxRGZ5akIrTi8raFMrVCtaWlNwVTZi?=
 =?utf-8?B?dWh4Znk0NWx1NTg2b2ZDbXpGL3N2SWFqL25rSzdaQUhEeU1Ham8wSnJtRkx2?=
 =?utf-8?B?OGFhKzFSazhUSU5xTnZpeHhSOUJKK1BQaGxQNUlsRFpoK1pZMkVmOFBlRVZv?=
 =?utf-8?B?VFl0LzZsTkFpVnJzWDhucjNZR1R4MnJZVEdXOXV3VmFNUE9mb3RRbFc3SFNF?=
 =?utf-8?B?Q0FXcDdDWWJNV3gxUVVhNzdicUIxN1k5L0pTRXg4OERvQWRDTnpBcnVWOWpq?=
 =?utf-8?B?TUIzalExazhYNEZkN0FsOUF6ZG94SSswQ1BPNFg3dkZWa0NldEZHSFo1UU1I?=
 =?utf-8?B?a2dEMjJKNTNLMmt6S0d3RnFTNEprb3dObHFQV0toekh4YUZLUkFKNCtRWWR5?=
 =?utf-8?B?dndKK1ExZ3NRSW5LWWVOOTVVS082RGxFdkF4UW9xQm5BcTFDOHJrQlY0b3R0?=
 =?utf-8?B?Sk9tM0wwQ2Q1WmpEM0Z1TWFqT0dSWnc2a0x0Nk56WlZUak93Y01SbUpvM2FP?=
 =?utf-8?B?TzEvY3dKRVJ2bGw4a0laMEdEMk5qSlliN0FDcXk0VDhna25yRVJpRG5ETmxU?=
 =?utf-8?B?SW1OMjFOK25PYWRTVUI4K0pXaVg0djNBemlwZG1sZ1NMYVlOaExSdDhhU21C?=
 =?utf-8?B?czViUzNUTk9ScTlxOGFmeWpiaFRZU2tvc2NDeSs0MVNYdER6OVBHVjVPeGZw?=
 =?utf-8?B?WGZlWjhSeFhEWXA3WVdtem55SGZ5K2ViS2V6RzJ0WGpmaWhWR0Q1UkhxZGYx?=
 =?utf-8?B?ek1kOVRpaEp4SFdjMEh5UmQ3c3BVSStrNTAwWWpOWTdLeUtQSkdEeFZBbjh1?=
 =?utf-8?B?a2E1ejhUSkVkOUhMOFVuamxSQzBZTExEdldQaUxxMzMvbURYQkhRQlVNTFFS?=
 =?utf-8?B?OWlmUkZvQ0hpakx5Y3ZMdTFIeWkyMVVGSEpaUWMyL2pUNVlMN1ZmUGU5QTgy?=
 =?utf-8?B?R2pqdVdDU3FSczJIdGVqSHE0VkkreGFjc090WU5WcW5BdlZndUF3dXp3S1RD?=
 =?utf-8?B?RStVeW94S21WZnZiUHcxTm1PUHJzdVlwTVNoSVBxS1l2b0dQc1E2N3NjdmMz?=
 =?utf-8?B?cXBaZzQ2SmszWkl1Y0dRS3ZvQXBDbzh6YkJ2SDU5d2FGdnRXL3I3UEIxQjEv?=
 =?utf-8?B?OHNqVFBOWnlTZWg5ZUFxcjRYNXVXZ3VkM3hKNHVndmQrT1JwaHNpa2VSTStM?=
 =?utf-8?B?QXBnejVFZEdGVUt3VG5GSis3OFlMY2d0bWdVSWFlakR5ZEh0V01ndVhpUXFB?=
 =?utf-8?B?UzUwdUo0VTZMREhRVVRPSFcyZ2hRb2JtMnUxdkxPQnZaQVpiRm0yd3FaZmlU?=
 =?utf-8?B?bUJwN29kKzI5bHYzdFhZMXJzeVUraFZLZVBISVFsR2cweDJlYlNINFgyRFFK?=
 =?utf-8?B?NlFHRkpaTWJDYndNbDVaUXNlaCs1ZmcwRE5FVm0waEk1V2tjWEFzWnN5dkJW?=
 =?utf-8?B?UWcwNGVKUEMzaG1pNDFkeitGUElML1NPSHRxcDByT215eU04aktUNzVUSVlO?=
 =?utf-8?B?ZGRVaFhTejk0MUkvZmJpM3pIVVNRd0h4WlNIa0thUjg1UjdhMTQxem5RQ0dm?=
 =?utf-8?B?RFNpdXVaSEJFa2NJQjBTc1puS1ZzZ3FQRUV3d21lTTlHWVNZNUdQeEhSZlMv?=
 =?utf-8?B?YTdyNkMreUZjc3ZFTmd0aGdrRjg0VXBnMHdKQ1hoK0pWdEZKQ0dVUFlvM0c4?=
 =?utf-8?B?TDN2Q3FoRzVkSmtkdkhkT1RqcStwTmtXSEd5dSsyQ2daNHZ0WEoveG01Sll5?=
 =?utf-8?B?NkxlUmZMeHVETVpTdENkbGorTzg4NXlWV1FpRkR4TVY1S29JUGFkN1FMRzV4?=
 =?utf-8?Q?EjFjxvK2oXVmm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR11MB5758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXh5d1lUajJxVjlPSnh3QjUrTXNhWnE4cWprRHI5L2RPY0dtSjh5Nnh5STVW?=
 =?utf-8?B?OERuVmV3RFZtYkxaL1dJN0pSS0RjaC9CTHlVNDBVUGdSYnhmN0UvQzIrRHRq?=
 =?utf-8?B?MlN4SGZPSEtOMThJMWROdnFCc3JtRGRKYmFGYzBwVXpvNTNFZWdCMzJVTlg3?=
 =?utf-8?B?OUNveG00a1lUL1Z6ZG1NWFo1bmYzQ205ek1ZSEo1bm1DTGVhM3RpZXBXQWlU?=
 =?utf-8?B?K3o4KzBtd0tCdkRKYUpvekppTExQc0N0Vkt6dEhaUTBTT0JRaHAzZnZsZ21F?=
 =?utf-8?B?czFIcXdOZkNVWVRtSjc1RFQ0d2F5MDF1ZnZtSnRWaW13MVVJOW5JQmxZTmJu?=
 =?utf-8?B?OFhGMU1vV0d3eC9rYTdad2Uvc3lLNmVoSHR6bkgwL0lNT2NMZzV4YUV1ZkNO?=
 =?utf-8?B?NVNMWUczMU1oRmNucVN5Z2MvQ3BXTXdUaUdIVDV1STBWOEtJalQ0VmFpTWV3?=
 =?utf-8?B?Z05mTldXQ2phRGhWckkvaEJiVXU0eGdXeTFUVGR3Y25UaDA0cTNKQlJRR2ox?=
 =?utf-8?B?OE9ia3VObEZ6V1k5ZjhEQzR5cmpDWjMzK2d3WXBjWWJnajFjQXNDQ1JCNVJ2?=
 =?utf-8?B?bkRMNWM3QndaTCtuOGlRdHYrUXVRamEvV0RRY3pkUUVLdVE2ZzBKYWZLOE1s?=
 =?utf-8?B?L3ZJMVNocVpwR3lyVWJaR1JVcWdlQjdHTk9EaEJQYTUrRjhvRXRPUkRYY0l5?=
 =?utf-8?B?Tmg2VzdaM3ppZlV3QVlhR0dUeWxFTGtWK2EzZTcxM0RrS0pabkZSMmF4TUoy?=
 =?utf-8?B?MTRXc3huNDhVWFRONnVaRFJkUTU1TWdCNUEyYnVQMWNvZlFZbEJOdzRQTzRt?=
 =?utf-8?B?bVFpaVlZY0pSSklsVW1ta0RabzNlUktJanYvTjV5RG5kNzdOYnVpUFJ2V2dQ?=
 =?utf-8?B?ckJPSEpsRm1wWnhFL2tPSnVsdUFFNHUzdVRmYmVWOGxPU1Fzd0oyMEJpVjhk?=
 =?utf-8?B?dTQ1WnNRNHZDMHkxNXRkSGxhOS9zcVBaTEhmc1RQck80RUZzUUxjSEZGMVp4?=
 =?utf-8?B?cG1TMVU2VEpDMkJCL0JHZ1VKY2M1M0xPcWF5QUdmR0p5cWQ1WEMzMXlxMUpT?=
 =?utf-8?B?UldwNUhnSjgzUlN5bktUWXVrZHd1Z2ZWSlUzQ3pYZXNwRW1tNjJqRzJpT3ZR?=
 =?utf-8?B?RnA3eGF0M0w1WUNuYUxnbFB3K3R3dmJJTDRWTDMwdXFWQUxTeXF5eTRNcHIx?=
 =?utf-8?B?NXdQSTFiNGg4Z3VQaUZzcFJKOENOYUpwSnY2cm9ac3V0ZklEY2diQTh6UmIy?=
 =?utf-8?B?bVFESVhtQnJiS00rcER1OW1xdDExYndNRWhsWEw1dlg4ZmU1Rm5KZ3pQZSta?=
 =?utf-8?B?Y2tkMVRxWEVjMUNVZ1FzZXlkOWFUaXdmOHNxWWFOSjZWRndHNEgwM3Q2QU83?=
 =?utf-8?B?UVl3OFdnQWlCeWl3QkM4NGZ1empqV2N2ZHRRWkhFVVpyempiOFFVb1ladUIv?=
 =?utf-8?B?ZStkVlhjaXFMSmxuQXBod3Z5OEVyVHJtRms4anNHRVYxVkpOVHBrWUI4VDhJ?=
 =?utf-8?B?WGYzWHpLY2dRRWh2dzJlOERiN3RUcmt6cU5HYzh4d2JrYVZNQ0o2UUNpVUpZ?=
 =?utf-8?B?WTI1TEljV3F6VzE5ZUV3S3hFdCtRRXF6YXZhVWlxMFNBSEI0ck1FWDRqQ0VS?=
 =?utf-8?B?ODdkWll5V0kxM3hrRG9sb2xpOHhuYnFiOS9BRHZ2NkFSVkRKZldPR3UvcTRE?=
 =?utf-8?B?Nm1yTERsTUpHVGFaNnpVL2lkaVNVTkJ2OVJNZHNyc001VTYyOSttSDRnazM4?=
 =?utf-8?B?SjJNeHZaNXd6TXAwOE1jeWYxNllGUkNQamZ1bWtWV01DMkppRzVFTTV1Y2gx?=
 =?utf-8?B?cEU5ckF1Q1lnczNmVDdOczVYM3hjUGhZeURaZGxoQzM2S25JNHVZTUhRSk02?=
 =?utf-8?B?QXJ5OHJ0emJpM09NMDVmcXAra2k0K2JRdDgvdVkxUTFMbVZUdFVDaDJrWHh3?=
 =?utf-8?B?SFRrYWk4RFVqc00waEMwTy94NlhwUFcvRGdaN2toZHE4WGlETmtjYWh4cUlz?=
 =?utf-8?B?djVnenQ5TU4xRkZLaVI3blZLMHNmdENUc1VFakhuVzlKQ2pDdGpKUmdRNG0w?=
 =?utf-8?B?ejBWWXliZklEclgzTGxBWXdMMDNvN2VQNTcxZStDcGxTZk53M2ZxekE5YnUv?=
 =?utf-8?Q?cTKz5cETGO2v8fFNpFYeKZT46?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c7604b-155b-41c5-2891-08dd423a5ba5
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:00:57.1923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1x96/TixmM33HYir9gAyXgtodW1gxlpSa7r0OdQDebdaR44bjE0hQXg7nmEzzUjpJ1GdjAuio+TMxZxfzhJhKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7286
X-OriginatorOrg: intel.com


On 1/22/2025 5:42 AM, Ilpo Järvinen wrote:

> 
> Thanks for the update. My intention is to apply this patch though the 
> fixes branch towards the end of the -rc cycle if those images are not 
> available by then.

Ilpo, Anisse  I sent a patch with link to IFS images here [1]


[1] https://lore.kernel.org/lkml/20250131205315.1585663-1-jithu.joseph@intel.com/

Thanks
Jithu


