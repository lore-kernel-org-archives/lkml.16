Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB611F7904
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 22:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746744324; cv=fail; b=VhJmdPz2b9TAqfLu7NaYYoSVdGeH5cGtkwbc8N4FC83+vXDL00JziMrAW5KvAPdVoXRLqW0ZVHjAlmsvpDGKQcbKu/df9QO0eR3o9kxN/5g/EUsWVeZygq+qrpBiVTo1cbITB3hCv6vOSsAb+yL8gP6dLHj7D4dV7YKp7RW5trc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746744324; c=relaxed/simple;
	bh=EJZSGch6iHDy3yP5zAPlWrK0oqpj28/0yrwFeTj7iYw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hupscBeec9BAWQXlBE8Q3Uqm3biRVaZqjINIgzLReNPJR71pOYTwSS5KxtHsKUZm2GgIyHz1bBrOY003v8G79sJ/v1dor1pnnU5lA+NjXuBx65oXY1L5ilxLSEUtr8dr2bmpjQBT/E7KSMy0iKgq9RvAl3J4MBAosofxU4mUS3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9IXuiRJ; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9IXuiRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746744322; x=1778280322;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EJZSGch6iHDy3yP5zAPlWrK0oqpj28/0yrwFeTj7iYw=;
  b=S9IXuiRJKX/5U0c9WyGfaEBDCqOEYltKYu5F4WaKKMlCmfhNkP+UfmOm
   RMaAI/weTsb0jXaCN8u5x8l6GHa4jwX0T6Wm2/NZkAtvQzOgPQK2bO2xn
   trrXAKEkHqc6gidi+D7+SRo72aBFknZi2NFFB4jQeKqn/BGvABDXD9NmZ
   cehcGD7oS+3uAVP03LNkT5aRYMvFrcaqPu0C39mwsib/ihukTERT3wPOS
   KX70brzgeqVhxOQ3VS7khpGsNDiZtA1gPWyFKcP2Qaheg8S1mb07+XS7p
   kixtJ0PqUWK6GhI/+K4my4jUnbkvQlFSjXb2of8Yn5WjH9zZQx7jeYzGT
   w==;
X-CSE-ConnectionGUID: nqJ6zeikRa+me2MDcF81iw==
X-CSE-MsgGUID: ljvZZ11NT96W3pnEabmsGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59218161"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59218161"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:45:21 -0700
X-CSE-ConnectionGUID: w4CXeYwPRUGoBKw/imMgUA==
X-CSE-MsgGUID: C/v/zYN+SweWtrNkEqHYBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="159731839"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 15:45:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 15:45:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 15:45:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 15:45:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrdUMLe5YYSblcgUMx7LEuARPxfiZ3pwKX7Yonq+ypfE4T+uSvDAfmhG46Aa9vNcwUGzpLHXf2R58uznyjPZQChgrOSQMhw1/bk4JSVOGoWv56LL2hvtjLaFG0otqEkHPEOkNPFta5+XxcH88zNafZFlNcI6Z/r9UtWjyF73xEBOwSup5+6qY9iP5hFxApzgCUeetjaLmUuIe2IxhNdQA63cC1yPCl4XrXdkYHWk7EnCWdgAK7D+X2Gxg92in3cevEe8qoeX6ZG67UDtY1IzyebsNakCHkEvQ6RM4b5/vWjMQKohTtMqvItseIpYjgI8EPGJfKhxYSzYHWoVUsH0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtdFeiRrlCpcbHAKfLgNjVo3bnt+EKeSHv9KYVTqlZk=;
 b=fNAmRH1u5T2ZdX2/EJ3dJ61x5s60SGXZVaXut8GyCyF98eRDA78YD0t8DLS38KNqBy8QHx3OmZTNHC8ZwNTGd3F4F8LVGhqoMbQZyfA1WhSfy452X63zPnaWsS3lLaDc++LMzf5Jf7YiSIG7GuUBp4dXFFM60yRU2cjds9pCkIgFI+jFh+5X/7GDuWJcoy79iMP47KpB2pPMB8IJip/JmLqXsoZ2zxU0DF3/3fXd/a/5H/AZKk/3xJWo4RxImb5s3/wuTxNvEKNjS99OiY8wGZusIe8VZFWKjJWZbBgd+7Slmv4nB8Q5IVeJQdKwx7opqEWMvhVM2SfWiAM+9g2d9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB5007.namprd11.prod.outlook.com (2603:10b6:a03:2d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 8 May
 2025 22:45:15 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 22:45:15 +0000
Message-ID: <7c7d8278-d188-4280-a5ef-c8dfcd8387fd@intel.com>
Date: Thu, 8 May 2025 15:45:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 18/30] x86/resctrl: Fix types in
 resctrl_arch_mon_ctx_{alloc,free}() stubs
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
	<tan.shaopeng@jp.fujitsu.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-19-james.morse@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250508171858.9197-19-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB5007:EE_
X-MS-Office365-Filtering-Correlation-Id: b6759021-7e9d-477d-4167-08dd8e81ffd1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWJkVWh2VldFVFRka3ozTXFTdmJDSHFnK3ByTGI5cjkwQll4RHBQYVljTlJn?=
 =?utf-8?B?MmFpcmlwejNXb2F2bFB6N1drc0hUV29KZjlDS3BKODdlaFdqSE8yTkwrNFJr?=
 =?utf-8?B?S2RhV3ZxTDZTVjlJUlRIazQvZG5TVFNLcmMwT1EvUGNzMFhiOVNjSnZlc0Ez?=
 =?utf-8?B?dVpmb01GcTlGa3hWaWk0bXA0blE4R1lVOVdBNXcxWkM2ajVsNWUzMU1WUXFy?=
 =?utf-8?B?NGR4MmpVb2s2MnV6M2dVQVVsdXo0dllnTEJnNWtEVG9yOVdRemFhZDlFTDdp?=
 =?utf-8?B?TS9kTmxKYXhqRjVJc2FqbHFERHI3U1BTMDVhRU5SRTd3ME5jbUpXMXorYWRX?=
 =?utf-8?B?dHQyWWlIY0pObERFM00wWThFY3ZOZ1BNS2U0TmxZR21RdDVkOStkNUh1Uk54?=
 =?utf-8?B?MW43dkxIQlkySDhPVkZ5TFQvVzJJb1hDSkxCdXhHdTRDUUVTa3N4SWpmUnk3?=
 =?utf-8?B?YjQ5NHR1dmhzV3hUeTlSZHdiTW15TEJENFAzWFZRZzMyaDN4bFRpTk11Um85?=
 =?utf-8?B?TDVLSXQ0T2xHcWhyUjVPWGp3ajk0dXVlRmhSNG9GQ2tPeWl3Q291V1FHdTQ1?=
 =?utf-8?B?Z2R6YjlSOU1ZLzlGdVlJSVdSZmJQQ1FXZ1JhOW5EbFFXYy9FYXlDT1d0NlE3?=
 =?utf-8?B?TnBtVUQyOGQ1Q2h4bHNVWmpFUnk5akdPaUYvdVpJRURIV1hOSjd4NjRnZVFs?=
 =?utf-8?B?bmNLc1JWNlIweEcyaVpIaEVlZkgxWmlqVG1vcTFYbXIxWlIrUjlDblMwdFh6?=
 =?utf-8?B?SVdBc3NUd25NZVlZaXdmNlBsdVI4a0JiSXR0ZnMwWDVkNExLZU1JZW5tbFBy?=
 =?utf-8?B?akE1R01STjFBTGZEOHQzazlJdURJaTdzT0FPNlBlMzdQeWFyV2FEVnRtak1i?=
 =?utf-8?B?RDd2NytyeERTWGVnN1NyOERKNlYya1NncnVtQjQ1dW42TitsVmdQRUNUajcx?=
 =?utf-8?B?Y0IrcmY4a2N4VHdweEN3SktEZHV6TmY4dTR1NVNiWXV2SnpVZkFGVG9URmIz?=
 =?utf-8?B?Ty8rb0ZRRjFaREs1T2QwcGh3MmdLR2lEZ3B1em9rQjJObUdCeXJDRWtvcU5K?=
 =?utf-8?B?S3ZGZmZDQW5CS0xPcnJ2a3FHbTJXUnFRMXlJZHRGeFZjUVduWVU2Qys2eXZl?=
 =?utf-8?B?aWVpTjhURkh1TkEzemdZbUVoMForVExaSkl5b2kveCtuQWpiVTRBem9KNmti?=
 =?utf-8?B?NUtUZk5RM1BLUEc0WWhsa1pBdWZGRzlxUkZjVmJpQjM5dzViZElNVDd3ZDRB?=
 =?utf-8?B?Q0thVDM1SSs4TkNGZVJ3aWJHRkV3V3l0OVVIRG5LWmpVZ2J1UHpGaDhmb3ZE?=
 =?utf-8?B?Z2NHam56SE15blg1cG1HYUw3Yk9BazRvOFJJaThlMzJoRWw3SEF5ZG9LMWo0?=
 =?utf-8?B?U05oRDY2emJVRU52c21aYjVHQmF3OFo3WUhSNkd0OEl5NHRiRGg2WXdPdFIw?=
 =?utf-8?B?MElpSjlNaVhJSE9SM00za01YeVFKZVhtcnA0Sk5jUWp2OU9xajhVY001WjJy?=
 =?utf-8?B?NnJkNkYraXloeDM0UWlMeUFFc01nNnR1ZXo0SzNnOFRlWTZWeEFoVUViZlho?=
 =?utf-8?B?VUpEWnJYSXlVMEZ2dDAvNjY2U3U3SVpacjVlQU9tZ0pMZEdvZmk0b0FMaHph?=
 =?utf-8?B?eGxKWW5XZWpQSGhHNWZXMUpEdWR1SG1pRHUyQ3ZCeFNZWVp5akg2UDg3OGp4?=
 =?utf-8?B?VEo1WDhhcXc2M1B5OWJwU0FwMDBJaDFOektWUUU4cExLdW1jSEpUZEE4VlJH?=
 =?utf-8?B?K2lkRjB5T3dZaTI0YkVWanFkeXpBdzJhWGhHUjU0S3A2VnFUcWhxZmsvdVRt?=
 =?utf-8?B?Tzg3cE1GVHRyR01LMXJMZjZYREEwdTN1RzNxc2xqRjMzcEtJdFZvVHhaR1Nh?=
 =?utf-8?B?MXQ3UlBqY1ZjRXh5ODUwYXFqU1ZMdHBpem5ROWRWK2pCeFZZb3M4UVRRNGU0?=
 =?utf-8?Q?o2FAxnNUcPA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzFacE5qaVZkU296Q29VaW1ROHNva3NFWVVqTHQzeHA5RmRGSnpJSEI4YkxJ?=
 =?utf-8?B?UHhFOG9xTm5hUkpUb3VLeFVEcmpzWVNRbmdwaThNOE9FbjRpMzVDNGRCSS94?=
 =?utf-8?B?dkczSjVsWXY3MXBuNCtXaDRyaXFMQWJyaEVKbHdKN0RXVmJhMVJZSjhBanlR?=
 =?utf-8?B?bm4xMlJCV2YwYWFWS2l3ZEFIMXd5ODA0V2hQSWYwY3FtTStCK211bVNLNml5?=
 =?utf-8?B?dTRTYXIvV0VLNWlnVW14aWdNVFdlK05JTTcyTWNZdjR5dkI4UnFMZXdrem8r?=
 =?utf-8?B?cVkwRkZETHhEK1pSc0huRWRvTjBRQlozWnZEejVndEx3dkNNMHRGK0hnUXVk?=
 =?utf-8?B?K1kwWDdmTGFWMXFGVUhKV1A0Y2Q5alI1TWlBYmE5SFFVSTU4ck8zRTlleUFE?=
 =?utf-8?B?Z0dtZ29QMi9sRkFxZUlkT05CWkhLK1oxWm9xOHJHMC9YaEZubEUzQW81RzVq?=
 =?utf-8?B?dUp1cVR6VzZuYnA3TXU1UnZzd0UxcHRWeDVlUm9VYUVmdUgrMWlEVnJjcXJF?=
 =?utf-8?B?WUtUazlCOHdmcUlNNXRWK052OHorTVlzbUtqRzVCSXhpU1IyUHFDWC9nNGZJ?=
 =?utf-8?B?b2IxYjJ4MVBMSmdxZms4MjB2S0dZN2Q0aWxsaGllWFBjUU5HUDJGdkFhZmFj?=
 =?utf-8?B?WnF3M0ErUkZ0a2JYcjRnR01Lb1k4a0dsUW9Md1pwK0JOSDU3dDFONExoVjZW?=
 =?utf-8?B?bU9vY0VTR241V050a3JzMExyNnFGWW1CbHhCNStqZytJM0lOZjJRWGhqeHhC?=
 =?utf-8?B?aFB6OWJ6L1RtWW9rV1VNK09GRy9WV3JaSDJ5eUFvSi9LQmgwcncvV2hCSEZH?=
 =?utf-8?B?bUw0dWxYUG9iS2UvUWp1eFVIcGNaTVJPSTFhcHBpcTE3WUJoQ1dTY1lnMlZS?=
 =?utf-8?B?bnZMSHF2M1g1TXMzYzFOTWk3endOS3FPdkhoQ0JzYXJmbE5SU0Vva3d4cEpV?=
 =?utf-8?B?RVFKQVYrbkR2RGRDSS8yUjZiRVBrdHNVWk1jVTFqY21mSzRZUDBzd3p5RjJy?=
 =?utf-8?B?NEtZalVwaGM2UnhvMTFZU3JPQ3h4U2YzQkpFTjV4cWtJLythQlEwNnVtRHlI?=
 =?utf-8?B?RDlOTU9TcThueXJHc002WjAvOUhza3pkSks5REZGV3ZKRWQ1bUZWQ0JmNkk2?=
 =?utf-8?B?dmhrUmV2N2ZKYUhkTFVpTVQyMlRwaVNQQitGNHpvazFreTNOUlJyZHVwZ0Jx?=
 =?utf-8?B?ZitQeXN3RjVCVnFyNDNTazJzZkIxbUVidGpneU5RbU00WFU1WDZSZ3BIU2lE?=
 =?utf-8?B?L0taeHV4SG1rZGE3b3pMOGY1dDl0UmJKRlN4MEVMVHNMQUNZZnVmTFE3bXdQ?=
 =?utf-8?B?YkNkNzljbk5PaDUrU0MzS0tPZWsvdEREQTc3eGJWT01kZHlHWlg5Y0JqU21m?=
 =?utf-8?B?ZElKbTBrZkFUL0N1L0N6MmRUMTIyTUZnMC8vaTN0ZjFLdmNzWDVwTEZSUjNS?=
 =?utf-8?B?andMdVlJU2R3M0RGazRkQUd1UXlFOWJaajBUOWZLbVBpK3dnMmNSK1lJYjFC?=
 =?utf-8?B?V1FPSDdhRWdOZm85NW9TZEJOZFZQQ0E0TXFLdElub0hOUVAySGZnc3VSYkxu?=
 =?utf-8?B?b01tSWYzVS9QbUExTWZhakZUNDJuS0hpbSt0VkhiSTNWT0xQdXZFdXhVOFBy?=
 =?utf-8?B?WWQxMDBLMFRHdElDTS9DcFR1S09IbldhN3RNYnltUjFMT3lTaVRtcWpJSlkx?=
 =?utf-8?B?NWMrekh5THZ0VDduNUUvRFNqWG8vUTYrWlU2WWhkUWRpVlZ1MVc0d3ptREF2?=
 =?utf-8?B?R1g3QlBPcnJhc1ZZeHJUcC9yRU1ZR2c0ZXR3dlZBM1EvZStvTzJRN3lZbXh4?=
 =?utf-8?B?Q2dxVlAxMVMrUmcyT25WODR4YnpiV2J3bU94aDBrSW5UT1hHZ1pDRVY2OVFE?=
 =?utf-8?B?RXlua0hkNXM4b3UvTXVPUGlidGM4MndwNXBpRHAzTkZZR1pjS1VnWkVzRnhR?=
 =?utf-8?B?eGdidkNtQmp5ajlGaU11aE5PdWNmakpUYUZNN3ZDMGwwRVJzbnQwTnFhWmpX?=
 =?utf-8?B?S01yclQxczREQmRsQWhZUXhQeHROTmRMZ0FVSWk2Z2MyYTBZSHFHYVBaNUVa?=
 =?utf-8?B?R3dhSGVESFV1ODQrL000Tkx1SnpZTk5VcVQ4NUJRcHNuL1ZVblkybUczbjZy?=
 =?utf-8?B?SUxDeXFWTTZTbzRpL01rUzF4bEN0WVRPT2J4U0NNeDM1UEs2M2JyRFhkajNj?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6759021-7e9d-477d-4167-08dd8e81ffd1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 22:45:15.1549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrPiAcw9KE1TGooMbTbqTCLU6eojSCFBwUobJijo+3NFLXd9LoqtBRg1CQlzw9Oy3O1UfYFPNmQStdVveMQPgYHr6tDwvphpcb76QktaIKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5007
X-OriginatorOrg: intel.com

Hi James,

On 5/8/25 10:18 AM, James Morse wrote:
> resctrl_arch_mon_ctx_alloc() and resctrl_arch_mon_ctx_free() take an enum
> resctrl_event_id that is al;ready defined in resctrl_types.h to be

al;ready -> already

> accessible to asm/resctrl.h.
> 
> The x86 stubs take an int. Fix that.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Babu Moger <babu.moger@amd.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> ---

With typo fixed:

| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
