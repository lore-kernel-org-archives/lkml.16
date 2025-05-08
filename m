Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD0E24B28
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 22:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746744283; cv=fail; b=P9VdM7Zg9T3NDUJlLbnIRvns7VkM2gVSW5jKouE9IrJhQWIeN2CeVvLXmEjbB2DvSLr16EHruuf/py4L4wBxaJeadjM8q5INGUJ6ZwVjqaM2scaAq6OiBVDu0P3BU3lqfnE1FCyzUQdW7po3sbPZOUtoN7fwyEoludV0ZKNwwZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746744283; c=relaxed/simple;
	bh=t5g0tVnDLmyyEIhZQYxX7TqQCMiVhA8WUiAh0vmn+WM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jWjCOXyNQQJOeooOOYBkLqX0yRL6np8yG6IC5J6XJ/p4LrPP7JBK+MeQfkdpGJ87ewHXuIGkpUp2xMrLgBRZL/vrng2RphWiaOLGzz/BgsmXHMl5YXkkwctNBgBe8n2WoNgzR8GLCpqZnDZ3X9GvM6rw6o50GXsGjIWgJlbcI8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXkn69mq; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXkn69mq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746744282; x=1778280282;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t5g0tVnDLmyyEIhZQYxX7TqQCMiVhA8WUiAh0vmn+WM=;
  b=AXkn69mq4oBenUGZQLrEvXkiMaGYRWXPDlzYhMxDvzYivXLOwELhJfXx
   ybc3WrHwwyPIiY82C6AANdyy16wWof7+j61pR9BslhuSxF/ITqib1kU35
   NqHx7MG2gNc39fvEgX/qWFGC5bR7rB0mLsV6NXftVZB2wlk2creMpC8Uu
   mlfL/AJ6sRIYLKjEtMN09wVuwpbyqFBpdjnLO7LUF3LY8ZFcKRe3Uhb6W
   R2N0zXkYwD0pd64F0av/48HOampk+QXpABIOlfjmesm15Ev/KX98Plyg4
   IcEks1uGTlzMF2bfQTkPJqLqjRR9CDkKkZM6rjmumIUk4V4+PCB1HbX+f
   A==;
X-CSE-ConnectionGUID: V6bnAF5JSiuPADglVIFy4w==
X-CSE-MsgGUID: AEk1TaM2TYSEtGZDh+Rfvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66088057"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="66088057"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:44:39 -0700
X-CSE-ConnectionGUID: iAFYC0szQYml9AUmVBKNbw==
X-CSE-MsgGUID: jhuwltCzQOuDXner/zuQow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="167373242"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:44:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 15:44:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 15:44:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 15:44:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWS44bqJSWD77Eh+hoSMVCFLFXH7JInBp5Y3ykhjSJP5ZgrMb3K4CZxbG+6CX2wfEC+0I0rcM+wCuyaK5PnH8IJksEveHrFiJGgnCXLcRgde4kwDiXVn2foJ0aa7gjw0ZgjXu5cqN44Vx4mjNvJez9rGzi3VjnXY9bzMP+OC5i6NP2hj6b1XzJ6inXFG7uqMWyErRid2LieY1HLrVGawtb6Ma7NwLFhkTA1XEVI9V0Z1OEb2r0VibV5n+6KQCwfmrELwIzl3yqamb1pMTZdzvv1Jf5KEyVM47F1uS3ZtIxETAYqpF3J3ZQBDQJP54I3yMMi2waW5GpEPtFKR7ZPCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1osl81mT+4mu26XRwTrKb1yHObYoFERzNWiO+FEoWvY=;
 b=SOeoGmFBwDxceDJwQWfOihgATJQIhUshPF4py4kqTLCAZWwh63F+X8JBrPcPRAx9QRUPdAfauPVZ41XOLx8pLOsXNsGXvMXO7uWEOLmpY/07ueQ88jo6+Erqxcm207CHhRTWUxmlplFENm0RckBXAOqmyxunO8drFX//9pnWv/WL0Wvo6X9ZUYOb9bcz0RRgeD+6thMdEmVAdZRnb5NacacpseaMO5rX9XgKssu9rI8LH7fFuZXHbvyB0CCbP3T2/xhC7HVgzI6iLygIO3sReGsY7f1clGTCwPRqNFVbs55oda+uph3LFPM1d+q0RiRKFYZRqaPiZf3KM0fV3QuE7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 22:44:35 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 22:44:35 +0000
Message-ID: <089b332d-75b8-4d27-9931-2e078099a867@intel.com>
Date: Thu, 8 May 2025 15:44:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/30] x86/resctrl: resctrl_exit() teardown resctrl
 but leave the mount point
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-9-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250508171858.9197-9-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0111.namprd05.prod.outlook.com
 (2603:10b6:a03:334::26) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CY8PR11MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: d66dc3f1-4a31-4017-f2df-08dd8e81e7dc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXg2OXZIQmxTS1N2eWpNOVp1Y2VFMjFaOW1XMTJrTnFqaFZRRUJYL1V0bVNu?=
 =?utf-8?B?Y1R6L3Y5aXZOdFNJamQ4SGtwalBUWnU0MEMyVFhQTUVUQjQzM3crMlBsa0JN?=
 =?utf-8?B?a0RHeTlrTzRNLzdZdnR1SjJibHpRTTdJRTlscVpZeWkrVTIwbmJ6MzJlcVYr?=
 =?utf-8?B?QnMzZHFCRENSZ3FQbnZyM0FTNm9yVnNHcmU4ZTc2UDk0cWMyMFNVT0hpM2Y2?=
 =?utf-8?B?dHZ3VFJMaVp5a3o4L3JUaVNuZG5KejRPNjlESUJTYlFaMUFOSmk3TzZ4MWNG?=
 =?utf-8?B?ZmlvdDFjR2dZY3hrMDFYbkVKUzNFZDVMWmdTYnNmRit0cXV3dEJqaFNvVG50?=
 =?utf-8?B?ODRmWC93WDhpRW5Rc3c1OHF4dXRWQzc0dnY5UGt2eWJEL0tIaVBKdFhqRFA5?=
 =?utf-8?B?cy8vUlowTEVRV0xaR2xZdFRGYzdXb0dHdXp4RXNFUnpnazU5enl0eGVsSHhs?=
 =?utf-8?B?RWdrVFJ2VUZPQ3RHejBHSlVtRVF2Qm05WHJFRlRwcW52SnNEQzZ2dmovYTI5?=
 =?utf-8?B?cmhqVFBDNEVHRWVkaENlTFhnYlZJVGxqNXUwSExOVlZOd21hOEZqMDNnL2xW?=
 =?utf-8?B?UEZRU2V2bkNpTzNMckhJa2dxWmhwVWMrWkpHNTc0cnVMTlNwbmdpWFFFNEVo?=
 =?utf-8?B?R2t2Zm5UNmhqK3crWXN6WW43QTFWeldXaFNhNEJSa0x6S1dDWXQwTG9OdHRM?=
 =?utf-8?B?SmtHaTNGakhsc1doVUZYcm5rdncxRnhRdVpQKy9ZcXFVUXlOeGZZOXY0NUNO?=
 =?utf-8?B?UmtZK1piMTB3VHp6bVdKNXZRN1I5Yzk0WUZQYnovZTg1U1d1S1NRcDR5T2RQ?=
 =?utf-8?B?MDFmUGhvWjhGOS9heEZxOEtkWUFVT3owTXByMlFIM3ZEdXRSeGo5UWZBZFA1?=
 =?utf-8?B?NnNNcWFkWElXOHdKVmhibDJ4eXIyQU5ZTUR5eEdBTzVpNVNyNTlJV1VyZUFa?=
 =?utf-8?B?NFpObExIVFNsaWVWd0xlV080akpOWUx3aHlLWFRiUXVDbXNqMUxPS1c4R3ht?=
 =?utf-8?B?TU5wTlI1TG0rSEUya3dmVExXSWlLYXJhV0Q3Sk84T1ZlSm1wdXRJOGtsRFNL?=
 =?utf-8?B?dW9UWkd3bkNBbzIvT1hWR09xOFhNc3cvUDl0QU1qb3E1dHpSQWo2ZVNSZnFW?=
 =?utf-8?B?SjNWTDhBUGRZT3gxdjJHckVXaloyTysrVWVpVk9wU0NzN1puSkgxUUZ1TUFH?=
 =?utf-8?B?emtBVlJ4QUJlYXRJeXN1ditjZ2haajNvRzBhZERkdmY4V2tQai9DVzZsdm1s?=
 =?utf-8?B?ckxOdHc5SHR6Q3NPVjZzcHFlQWhlanhvS1F0Z3VMMWpnZnQySzljUnlQdGZi?=
 =?utf-8?B?TkU5amFndkhOSUxCbjh3d2p5MG50ZGI4L2tkQXJTVHNab1Fkcy85SUkwcFE2?=
 =?utf-8?B?UFB3Yi93N3ZtV0g3NjdNd0lhRjdGdms2cTQ0YjlBVVNoTkY0MUVFTDdHUUt2?=
 =?utf-8?B?R1o4UEp6NVFwWmk4OEtJdHVJcVNOeU5EcWQrZE94Yy9CeDJ0MUROSThnYVJI?=
 =?utf-8?B?L1p1cERDYTNESVpPUFZiTFNrdXpoRlFZMnVVYmFrZitpQ3RreitSbE8wdmVZ?=
 =?utf-8?B?WWlUbmdzNnVSTFlMZUovVFZ4R0lodlpjVnNGaDltVzlHRG44TzlDdTBhV0Ro?=
 =?utf-8?B?SFR1dVRNQkcyQjRQRUtyc254QVVaZkdLVm5rRWtvVmV2N2dHMXk5enMrNm9y?=
 =?utf-8?B?b3I4WnQydjlZYncxcWRobFU3NWlZazVwT2xTTUFDbnVtaEhySGVwWVJVMCtC?=
 =?utf-8?B?Y1FrWTJ5Z08rSnU3M25ydmt2amdUZElPUnB1d2RXWlJiMnZoOHRPcndRZG5Y?=
 =?utf-8?B?WVNsSXd1RDQ1dXVLbm5BVnd2b20yVWZ5YWd3Zks3OFpnZEs2eWZidnJmTE1H?=
 =?utf-8?B?ZFVybWlSQVRraVMyY1MxbW5OcDl6V1Q5V0ZaRjhlTDlTcFBxSkVwaTRrb1Uy?=
 =?utf-8?Q?7HkbDYF8avc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjNxMnpnaFcrQTJOVEJsdzlmLzM1THlnK1IrdVdvREpTWlA3N0FIWUZ3ZDFH?=
 =?utf-8?B?S0dQenQ3ZG12RDZrNkVzdXpuMmpmemYxUWlIbnd4OEpuMm9EUXpFVWpLd1lD?=
 =?utf-8?B?Wmd5TlRqQWxKMnBZejFlTG1BaWZMZVE1bE5kUSsyak5PQlVrcjR6NkpQbkpr?=
 =?utf-8?B?Y2R3N1RzWUVnS1BOOWxtTlFpakdib0o0Yk5jcm1iRTcyd1lERmVwRUNYblU5?=
 =?utf-8?B?bndIdkl3bjJ6c0lvWFVqeGZybFRJdjNIczc2S3NJekxyUUVWay9zUXFjY05R?=
 =?utf-8?B?RXA3dWdoeDlUTHU2WHdndVlxaWYzSkZxMVBYdTN1MGYyOEJpMnpCeFdLSm16?=
 =?utf-8?B?N0NERmhSck5iTkFwV1ZqREVmRDI3citEQlY0TjlBR25aa1dVb1h1bFBSWDJv?=
 =?utf-8?B?bWJIaTF4TDkwaE1lTFUzeWZCa1VUMGRBZDRpUmlyTHF4cDFrNjNXMUJKaThp?=
 =?utf-8?B?Y01NVTJJUm1YTytPbTdCYkNDQXZmVlFCS2pTbkU1bStIWGtWbERkcHlyVXhK?=
 =?utf-8?B?WjdiZjJwd0tPWXFKRXVDOWJ3bVlWcUZPTllQd0Q1TzBzNTJ1WWQ0K2pXOUh5?=
 =?utf-8?B?YWtqalB5K2QrNzE1dE12TzFRcUFHMkZqYzgzamJ1NUNmYlRvSFVkd2pQUW8x?=
 =?utf-8?B?UkZHYzcweW52ZHFyOHlqUndpWkJCVHNxMS83UGZzTXdWZjZRc2pHQTdnTkR5?=
 =?utf-8?B?cERjc3RhOTFKYjlhSXpnQ3A1OXRDMmNHT2ZlV0dmTVBZQXpPVHdoL09NUWJs?=
 =?utf-8?B?aXBPODFuUWhzTURqM3V2RzBDTjFBUHBiWS9rM2ZVSWN1Q1dnMGhFM05vc2xj?=
 =?utf-8?B?d2NmRHZuWU5sRGRMTlBTRERhcWxKMzlEWHVhMGtWV3BLMEpzMXp4cjdLSjhL?=
 =?utf-8?B?VFJkSnZER2luQnNPa1lRa1NGbGkxUVNrZFp1NU9vVzl2cTRzOXFJcVE3bzZF?=
 =?utf-8?B?K0tTZ1lva0F2WXNEMWZsMnd3cVlubUtncWNhWVNPZ3JZTGcxSTd6ZURaQUhi?=
 =?utf-8?B?RkxGc1VXdFFUcXYxNFJrNUc2SkpYRThJTDQzRlRtYWhhYy95VXFLZG5PcFpK?=
 =?utf-8?B?NnhiMzhxR3g4Zjk0VGdPbWZ1WEpySDhRTXo1NGJnUVg0NitRNGsyUUVJVEJ6?=
 =?utf-8?B?VS8wM21jS1p1NzA2TFh4NUJCTm94VnJzU3hPN1hiZ1ZHQkdPeXZiQzkrcFNB?=
 =?utf-8?B?UHlPT1lWbjc1NFIrZTdMYXVnOXFmVFp6WE1JZStnWWkxLzluaUFiK0pXMHFK?=
 =?utf-8?B?ZFRtcFh2VW9QWE9IeVpKRXdXeTd6ZThXMS85YnplN1llK1R6dWdqTXZUOVo3?=
 =?utf-8?B?aTBPT3hWNk5TWjFvQmxnTnFjT2JIczVLSVNYNnVVVHFmYzFsdStDZ2dDMjda?=
 =?utf-8?B?WXlSOUpHQjhJMFVKMnBJU3lydktPek1wRXQ1TXk4OE5PVyttWkhyVElWQXF3?=
 =?utf-8?B?eGgxSkdXam5hRDFkTGIyUlhmVVk5MnNuNmIyUjlvblhlcDZGdk1MeFF1aXBM?=
 =?utf-8?B?bk8rOVlEcW54dnhyUDFraXNIZFFnM1BXVWJNZTdrTGJZcnlQV2E4NzhRWHZo?=
 =?utf-8?B?TjdRSENzQ1VwSUR5MmdlaTcrZ1QxWTdCWEMwQTJRUEs5RSs3a1M2L3lqU2tD?=
 =?utf-8?B?WUhoMHlyQUlXU0xOQTVJanE5ZnpoZlNSMFFoMGk1USs3MFo5OVdxT2xESlAy?=
 =?utf-8?B?SDJZckFWRUwxd1luU2Y1OGNxc3NqNGpHcEVwdnQ3TG8zS2F6YTN0VUVlbWNp?=
 =?utf-8?B?MnQ0bC8xTFlxVTVBelRQTUNVK2cvRmlHWjBZbDkwUkN6aVhWK1ZCNXhLU1ZV?=
 =?utf-8?B?K1R3V2JiK1plN1dlSVJLWmxvTE1JVmtTQUtNL2pETENkaEdXZHA3bDBQUVNl?=
 =?utf-8?B?MExlMWR5RnB2OGVSMWp1elJYMVVNOUVXS1Y0K3ZGeWZ5NHJqVlBVN0VJQ1Br?=
 =?utf-8?B?bXlaaTRGaEFPUHFFRnBRK1RzZzFaSmR0SFZhYWtFem1QNzlzNklRVEVNRW9t?=
 =?utf-8?B?SEtqWGxlZjgzaXVnK3JyVkV2eGFOVXFHVTBWTzN0WjE0OXNLMFpzeDJyVVlp?=
 =?utf-8?B?VXBSVHVHTXVRdVJIK0RiOHpFaDVaNWE5RWRFNUxkeWpXRENIZlBNclVFaWRl?=
 =?utf-8?B?dFJiaVoyK3V1Mk02VDlFb08rb085TlNoV0VhWTYxSTZhRzF0bnI4ZlBSUXpD?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d66dc3f1-4a31-4017-f2df-08dd8e81e7dc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 22:44:35.0025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUR9B4mFXf0UUcNBzX5te+kFTEv/+dMshC1rDYXHbTAGOJ1IuxK/JWl6MsCcLC7xrvXwR6BC5Fmm0xBU7A7Rzzw8s6vjHpTxncK215fFDoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7777
X-OriginatorOrg: intel.com

Hi James,

On 5/8/25 10:18 AM, James Morse wrote:
> resctrl_exit() was intended for use when the 'resctrl' module was unloaded.
> resctrl can't be built as a module, and the kernfs helpers are not exported
> so this is unlikely to change. MPAM has an error interrupt which indicates
> the MPAM driver has gone haywire. Should this occur tasks could run with
> the wrong control values, leading to bad performance for important tasks.
> In this scenario the MPAM driver will reset the hardware, but it needs
> a way to tell resctrl that no further configuration should be attempted.
> 
> In particular, moving tasks between control or monitor groups does not
> interact with the architecture code, so there is no opportunity for the
> arch code to indicate that the hardware is no-longer functioning.
> 
> Using resctrl_exit() for this leaves the system in a funny state as
> resctrl is still mounted, but cannot be un-mounted because the sysfs
> directory that is typically used has been removed. Dave Martin suggests
> this may cause systemd trouble in the future as not all filesystems
> can be unmounted.
> 
> Add calls to remove all the files and directories in resctrl, and
> remove the sysfs_remove_mount_point() call that leaves the system
> in a funny state. When triggered, this causes all the resctrl files
> to disappear. resctrl can be unmounted, but not mounted again.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

