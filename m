Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A6217F32
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084693; cv=fail; b=eqRVeObMAnmbQ+P+cthbN4ZVtHGKtfX8DDRxQpFy8uaRkxmV3dV9TNEgOhxHBrhM1g6Kz2EJqh90I0r05alhAFXNKSzDltJASJRA1CG/Y6A4JhgKe0m8qP5jxEo8Q8A5k7E+HlQwECwwuPjkXG6HxXKdiTH26LHNWWdWnnXvcF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084693; c=relaxed/simple;
	bh=FcdERSc1EmKIxBJhGSF5uvARHQHxzNIGqNaKD6+gHJI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XkC1EIaV0XiWdWyeW1zwgW6prEQd1gP5AIu23p0/glY0rDEY8b0fJhnESNWMLi2EcKgnwzuyuK17JH9cDH5HdEWAqZV1Egs/OOBj2ceLodpawRyZbxcH2YFLA9cSQo4/C8xLSs3b9Nid/81i1k7E9CQnlHOVfRGRmfr8Pzkr1gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eK4CHstF; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eK4CHstF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743084692; x=1774620692;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FcdERSc1EmKIxBJhGSF5uvARHQHxzNIGqNaKD6+gHJI=;
  b=eK4CHstFWtaHhOSwEGE1+UUUUbI9bMtE/OOF0UUx3re1Fd3r8BTZjWnS
   52dgZnujeWCgX+lJjP28f757DJ+ZKEHjaTS5igxmRc8FhXfh7MRsYXySh
   nlP9ir56Mk0Z7jjcvZz9njPh/uh+4tRWwTN1iPrbNpMG+y48TcaaXYH//
   unZGI1inEUu9eS6Ayp4rl0ToOz6kito5pq/G876nAXsX1QWkgXfwrutrD
   qdTioBm6au9SvkEh4jDd15bQlgCzK5EI3t0Q5byPyIJNGT3MGiigJBJbB
   kFLrkjzUG5aDA3dgfpLA382Kme630RNhSCpwuGpg4G8c16Znt3guJFRj2
   w==;
X-CSE-ConnectionGUID: 74ZUkwNwT0mH4xXYcdYHxQ==
X-CSE-MsgGUID: 5PA6d+A4QpG+Hz3plqPL8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66889986"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="66889986"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 07:11:31 -0700
X-CSE-ConnectionGUID: HiDcl7c1QRq404HPo0OxWA==
X-CSE-MsgGUID: qSMzz6gLSwi9xQ7cpjVYxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="129303450"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 07:11:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 07:11:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 07:11:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 07:11:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGdZ3Nn1kr52/uQoSWLlh22J70Vz0O022CsqwpSZAflplIrQvOu5s9zFWzc2P469OmQ7Lx8P0ZHMKtzizRuyF5vHA2Kv7h0+c41xuYfNxge9hujnchGM+BU7zGfY9WciAfSj0kaE+dsqSv33MWNf+VRSbz89g07bTYnByGC+8s9Jp5C2GksP5XCUOG4yAEssfEyErKckNE+HcMbs0sEhpleJm9AtU1NUjUVBuHE/nNfLM2o3Vglex8YXZwx8ckz56IaJX9+T0eNzuDLKVJvTSDieno03+z5aLAK4rWgck/ldELUDmXspzATjsZL0vWg8154fylmsd9/ms/YFYgU/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFaPw5B/c3jcqIWMMcN9DMsn+oE6fL6kLgqKL93ZkTo=;
 b=f2ym1BTzSb67id8+5llN4exQQx12jsVeCU8wyZopFi3OES8j/pX3LfuS3UQSVkNkz5W8C+bY/g4+OmU4JqkSZT3NVQq93rEjQLZYUNSh4K34TBx+WcI7kmr2Er+Rn5lGZcNmpCuS9c8fo2uWtBLmML+f/UZMT3blo1ROWA6W11xQrAYZ//KNLWButlRSd7CWVe3Ytibyt9lakURTTJ1uop47kfbxUa7G89x+GqtSqzQRjsMFGYaNM9KxWnXFEArvxr2ku4E7OqVXf5IJKeOGjpQGLoact8O1VnyuwuGWgigo1ddAQ9D4FsdrqxZMbrvp7uX7k02+FYOgYt7+YTAQaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 SN7PR11MB8068.namprd11.prod.outlook.com (2603:10b6:806:2e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 14:11:10 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::b1ef:c95b:554d:19c9%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 14:11:10 +0000
Message-ID: <6e784457-7696-4b14-8a2c-433f15da3a93@intel.com>
Date: Thu, 27 Mar 2025 07:11:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/microcode/intel: Support mailbox transfer
To: Chao Gao <chao.gao@intel.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<colinmitchell@google.com>
References: <20250320234104.8288-1-chang.seok.bae@intel.com>
 <20250320234104.8288-6-chang.seok.bae@intel.com> <Z+TG04nYo4SaRDmw@intel.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <Z+TG04nYo4SaRDmw@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::19) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|SN7PR11MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 641dd108-cf99-4225-4f08-08dd6d3939b1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlhjN2hnQjduUXV1QWhoVjFEZWxRa2sxc3cvRFRoVHNZcXFqbm5kM09wcTZ6?=
 =?utf-8?B?V1lFN216T2paL3NtOUorcVNnSjBBdGtjd2RGdmVvM1NuQklhZURNaFdtOGIv?=
 =?utf-8?B?VE9DYXlrVzBCbEtlQlBGbk1VY0JkMjlaRDA3N1BacGk3QVNrTGVlYzU4T2lS?=
 =?utf-8?B?OTVyciswT3NnVzNBMWY2WWYxVVRMbnM5eXhJWWdia2VhZHZZRjdFbHhpQTdK?=
 =?utf-8?B?VHV1WEFhWVlUZWpYbWFHcnpVVWZ5RjZvQmNqenU2UzhJYkxWZWlLc2JJdGw1?=
 =?utf-8?B?aEVEUlMwYkVpaVh4TlZRV0JQbzg1MnA3WHJGOTdGRVJ0MlQ4QmVjZDFhUzBw?=
 =?utf-8?B?cnB1TDY5dGwzMGluMndtTE5uTkFxZlVWVEZSaUIzVkdNcTRUU2VPTFc0c0s5?=
 =?utf-8?B?cWd3YWJNUFF3SmZzU1JqOVA1d2FESTN5S3hoK0pqWFB0SS9ZY1dGTFlKR2dN?=
 =?utf-8?B?YkErTWdBc1RTTDhySXNzSkVhbURwdDc3TUhZVXlFMTBLMWFDVEkzT3lwbDZk?=
 =?utf-8?B?Zk1kSWVkdSsycGdtUVdtelhCQzhJYzZ1N1A4ZE5Pa2dnNS9IbUN1N3VKTWov?=
 =?utf-8?B?R0RTenZmTkR5anA3bXp1STZkaW10OWpxS2cvYkdYdkhFZWF3bm5oSEpOcWJN?=
 =?utf-8?B?WXEzaVZXTEhSd2lLa1JnNTQ1R3g4OGkwZlpST05xbTVYY0l0RmZiSHVEVUR0?=
 =?utf-8?B?T2RpTVhZR2szTXQ1dGFpaW9CNW45R0NCVkxQby9qTThGTUxrZnBZNldVN0gr?=
 =?utf-8?B?eWdyOW9nNHFJbUVvdTFFQWNyekFxdVVBRG9ZdmViSUVaK05EcE5XSEo1Qk11?=
 =?utf-8?B?VllpM3I4ang1OTN3WWRDSzNPUXlkcTloczhKSzY4U2tmOHdiMFREU3MwZlo0?=
 =?utf-8?B?alJab2pDZ2x6Z0hFYkJUMUZ6YXhmVTRFNTgwY2ovY0pEeVJtYVRFYzJFb2Fr?=
 =?utf-8?B?N0p0Ly9RdUNnazF4d1dUNFEyTUdiT1RaQmRqM3MraTNYMnBmYVc0bE5KcUtJ?=
 =?utf-8?B?R2lRWExESmtEQzhGWmlneGZwWXZrZHRzbzlLNXFtb00zaXhxVE0yMGl0MnFG?=
 =?utf-8?B?RitEUDdXclhRVjBwZVpPaGxCdVJxVkNiKy9rNE9EYUtHaDNGZVB1TkRYdzBC?=
 =?utf-8?B?UmpBdEtJVUpnVU9KbUh5N2dOWkUrUkpOQUk5dGdRWmEwWHl4TTBBL29YRUg2?=
 =?utf-8?B?RXUvL283QUM5WWp4R2ZHMVp4cmRNK29oeXB4TUNQY0MxOGtnNGxWcTF1NW5V?=
 =?utf-8?B?b2VOQVRIcmhwM0tIem9lSDJESFdIOTlsMGFNblZWMjA1akdpejZST1pVVTNR?=
 =?utf-8?B?SDF5OW5qaUlHUzQ5YUVCSGxJVnBGWTk4SUYvekppY0hGOEJ6UGtkQVZ0MUI5?=
 =?utf-8?B?OS92SkFBSitEWEtMNE1BOWlKamZQVXZZVkhHUXZiREZrZ092OHlUUjNlTzFR?=
 =?utf-8?B?WFJsZFBPNHJpOC84S0QzUTBub0FzSWFrM2JBWmRqK1NKMVJNRFMwcjdvSzJw?=
 =?utf-8?B?eE44MjIrQlM3cXg3V2NnMjRWTzZOc05POFVRTTJPSXBEYlpHS2RGQkkwR0Ri?=
 =?utf-8?B?VmVXM2NnSTA0VmtBendxcDVBWnhSem1YK2Zub2NxZDM3V0MvVFkwdVBLblVv?=
 =?utf-8?B?STg3eElxV1lVU0xYRWMyMTN3dWdoRGljK2RaeXUvSDFPTDBjVHlvVk93MW45?=
 =?utf-8?B?MmpyS21qL25HY0oxWlFVTTNXSW43WW5SRUxjd1FGNEMrS2lYdVZPWUs0STh4?=
 =?utf-8?B?cHRCRGYwSGtZdVNlZTkwcG92bFNBNmkyYTZlYVU4UVppbWtnaXZpTlpxbkZG?=
 =?utf-8?B?dzVVdXIzS0hRWGJQZmExcy9CejdNd25OWCtRWTI0aXMwR0xReEpCMzN3cXU3?=
 =?utf-8?Q?wXbWfWgbqgXSx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEM3M3prTmkyM3ZNYTdpc0oyWGNPUWpoaVlJdmxCbGZwd2oyTHl5OXFwN0xV?=
 =?utf-8?B?bnZidGVpajFFNjJTSHdiSmVvVnd4R2xQU0JjdHA5RXRPc1FpaklOak56WGhY?=
 =?utf-8?B?MWJtVTR6dzdOZCsxNnVUYXlyMjJCeXFPRTJDV2tpNXV6UXRLMUJkOTJUUVho?=
 =?utf-8?B?dUFtOTQ0cmlIK0xCa01aQm4vdUlNcmUwNnhwMUE0MDIveXg3MDNJZDNwQ3dz?=
 =?utf-8?B?QlEzaFZPRDM1V0l5aUNqS1NTWDFqVmd3RkgyK1R0aW8rNnV3OFBTdnRLN2hy?=
 =?utf-8?B?Y0FhMFR3bTVyMlNJd1pDYS8rbXd0UlZZUWJWQ01kekw4RFd6RGtiSk15ZVZL?=
 =?utf-8?B?UWFpcVVBeGU1SkZYN3VkejUreHAweGp5bXR4T3VMUXVjK0t5MGlEK0YvZExR?=
 =?utf-8?B?M1BRcHVmVlJjYlNhaFJWZ0ZxWnp0aFAwcG5ZNTVuT2haRFFCaGN3SWU1STd6?=
 =?utf-8?B?TXorbEUxTm9yVE85T0syblNjazQxNSt4NWZlckRnWTlYbVVUbEJTS0pjSC9q?=
 =?utf-8?B?SjlBeC9KUVNOWVduREg2YmgrWk5GRk5HR2Z5UnZLUGJTWkt0eE5tUVNSTVhV?=
 =?utf-8?B?ak92ZlVTc3NGbkx6MzFsRWtKZWdYd1dUaitpeHFSUXFrc3VVbE11YTdjQ01v?=
 =?utf-8?B?VkhMUlYxMWY0V0szVWQvWUNldmEvVXI3cnU5Q1RKeE42N3RaN1EvR0xmb2NB?=
 =?utf-8?B?YjU0TEIzb2ZtVjFmdE01SHFEQm1veEFZZlJMazYrNTJOcWlrakFwMThtdXVR?=
 =?utf-8?B?ZFhoY2xYb0VoUUxncUZKLy84YkZoOEtWejdWdUw1enh4Rkt0WFlPVTJQMmJi?=
 =?utf-8?B?N3B2QzJqWGVYbUY1dG10YnVvU3UxY1ArT3l6Smk2ME1iemZ4UldtbytqaTNj?=
 =?utf-8?B?Z2I2RS9GQkc5YktZUlZmbXlaRlk0YTVXQzd1R1ZaT3EwNWI5eUo0YjAzT0xC?=
 =?utf-8?B?RHl6cDNxY2RlakcwVDRiUCszeGQzZytCdjg3THFYVHBxYyswTHdWa0szSTNJ?=
 =?utf-8?B?ZG0rTzdJWU1CY2dnbFAyT0piZDUwYWlUQVY0WFhDWlRwTkV0OCswbDVMTVds?=
 =?utf-8?B?cm5zMTZUMHhxdy8rZGhTcjBGc0dZVEd4cFo5anVxSWhuMWo2aEVBR2tvZGhI?=
 =?utf-8?B?N216ck1mVTFkeStMRjJFWXl3VWhTZjRTd0g5aGFKNEk1d1RoZ2kydHBGTS83?=
 =?utf-8?B?ZEFZS3MweCswQzVkS0FBVHdCSU5UYzJ4VDljZlFxRWNuN0pCTDJpbE4vS0kz?=
 =?utf-8?B?bXhPVEp0ZjFla1NNWFpYYnQyaXcvZnRWK2Y5RVp2dkxldFR5di9PWU1MTTFI?=
 =?utf-8?B?ZXZVMFlJbE1CVXExdjJWUDhvYTQ4YTRDVVpkSkJVTUlYVXBja1pxNjFCZGdP?=
 =?utf-8?B?RFFMZEo2U3BtcUNJRlZEdU8vN3k0WnFoZXdjbDlRUWo5eDF1bkJwcTlmdWR6?=
 =?utf-8?B?cWJtbzdnSzdGZkYzeVhWa2ZHM0FRSS93SnE1Q3dOZWd6clpyTkx3T3NXMVM5?=
 =?utf-8?B?WWk4M3pMMUQxOStiWHFmTS8wZm9wbi9UVTdWd2ZSZi9FekJJUFhNKzlIZUht?=
 =?utf-8?B?V0c1aGF5SEN4MXdmOXBheU9yU1BEWnRWTXpsMGRGYzhjZzczNy9KTWtwYlVh?=
 =?utf-8?B?Wk1FeWl0L0x6TWZET3JMc216N0k0ekcxL2JOZzNlT3BPL29lNjJ2Mm1YNVhn?=
 =?utf-8?B?d294aHU3bmlQNVI5eVVnRjZDczNwam5nMmxWMTJkWDZQZzdzUTJPelVlN3Mr?=
 =?utf-8?B?eDhYMW1YTEE4L3BtWCtvbHhuN29ER1orSEMvRGFPR3VrclJRVUlDM3JhSUpJ?=
 =?utf-8?B?T1ppOUpGQ3c4elFDL0Z6RmN1UXBKajM4SGVKR042MjNnOVFYbWNOYUVaTjZJ?=
 =?utf-8?B?aHpWWlZ6SXpvMjVvMHJZSlpOSE5LQllhUUhVeUpoY3U1L2o2dDJlSmNET3lr?=
 =?utf-8?B?blFlQnd2YVBHcjI4NTVVU21GSEEwK0hHUE9Hc3VpcWpjeXc4dnl2TEp1TjVI?=
 =?utf-8?B?dlh6MXoxVXdOZUczTkthcVFBTzRqNldPRFU1ZFE0NjZ4b0lXeHVQc1I2OFBG?=
 =?utf-8?B?TlFtV25QNFhVOW9ja0k3eHhzL1JrQXN2QURRazhXWWxUV0pneWhDMkMxSFNJ?=
 =?utf-8?B?RXB0S2NaMXlKbGZrSGRkY01UTDFvaEx2L3lNMDI3c3BSbCszRWdoRSswKzNH?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 641dd108-cf99-4225-4f08-08dd6d3939b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:11:10.6939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2vA+h0btr7aFU4SkQ4o6aaZtgf79biC7Yt8bO0+6/ZOb/x3efP9rTWIrflgmexqbfPjAyMTnu7q0X8sHQE7y830RrQlNqp660aah1mquGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8068
X-OriginatorOrg: intel.com

On 3/26/2025 8:32 PM, Chao Gao wrote:
> 
> and in send_data_chunk(), do:
> 
> 	staging.state = wait_for_transaction();
> 	return staging.state != UCODE_OK;
> 
> It is simpler and requires less code. Even better, send_data_chunk() can just
> propagate the ucode_state to its caller.

Thanks for the suggestion. To me, this is more of a stylistic choice. 
Previously, the call site had a single line:

     return wait_for_transaction();

> By the way, checkpatch.pl warns that 'msleep < 20ms can sleep for up to 20ms;
> see function description of msleep().' This makes me wonder how the 10ms
> timeout was determined but not precisely enforced. Is it arbitrary or selected
> for specific reasons?

Yes, I saw that warning. It notes that msleep(1) could sleep for longer 
than 1 ms, which I thought was acceptable. The 10 ms timeout was 
determined through discussions with the firmware team responsible for 
staging.

Thanks,
Chang
