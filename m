Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C023319995D;
	Thu, 22 May 2025 20:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947417; cv=fail; b=AjdDzqYO9ox3hHsvEseGGrA5kesPSC+73Hx6PnTK3VHYqHryyd6FYTxFArPX2VcIqyCVEWDZxWuhskTW6rFoJU0QN2ss7ZeZt6d78Ro5ipOh6gtMPCpKRc8onxLvjhv9pL6d3D3ick4dFlLoP9yQT5Ncjmvpd09bZ32D9+Jtu80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947417; c=relaxed/simple;
	bh=BEzahvKVl3CzHcbgwTi/fj5XZwayRX8rqF+cd4NHOX8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WLqdfTVZsp84cDXOvjZ3Zj30hsjuGQS9wFswP3uJBuxBKFJIsIY2ur3/TgfEFcyXdn99cckqkPeNDShCSRU0QJCpnYTzhPEa1kHiu4sj6r1PNCB0C3BwwuET2TND8yxK+xkRJ3HwPcX7NNDYNC7d6V3pUH4Hwv3V5lyIUbRCfBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvTZVwbQ; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvTZVwbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747947415; x=1779483415;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BEzahvKVl3CzHcbgwTi/fj5XZwayRX8rqF+cd4NHOX8=;
  b=CvTZVwbQYgMVSX8lYf5uXzff+WFmfz2Uq2mqhyzMY4uCr7UpSgHRYvKt
   I+Bhi432E/tYtma5PY8tlJmi980erR3XXN6/N5i3JOocpJOeeHT2vMFrY
   RsPdSzqf6wYst5b1U92B3JKceu5qVKTwD8gpYn1sGrkmCI1Sdl+btP79X
   jh4ASvBMvx35syffaztfnX+C0BkLaOUq6IkhWbqC7TCICztOHwcfOVC+b
   5ozvdPFb+7EZ9XTJdvLuu+uKqNWkEAcVry1TmnqY5zLF4jm/BbaGVPhZj
   7CQttkVhpLvekMqkeO3Ghqiv6/7nVssbZPK/Klcx4PjFOX92l/DTe7rIN
   w==;
X-CSE-ConnectionGUID: GnBdNsSPSYG4i75Ya4JpOw==
X-CSE-MsgGUID: 2gNUpgAuQFu0t1CeY6aJYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49247057"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49247057"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:56:50 -0700
X-CSE-ConnectionGUID: nL2DJoStR56ohPzSRLZthQ==
X-CSE-MsgGUID: //a5ze8JQxavpmSUzs13Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="171753244"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:56:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 13:56:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 13:56:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.76) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 13:56:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRlHgCYa+2hcK1MJ5uUsx7HmD+Bl6wWCZ3TeB5W/yMAF1ijoR/lvUBXEW7fbhTzy8fyeeS8FA1DVwkpl49tQQxe2VIjuM3Nx8H8vhNniOXNKIwnDLlUtzBd1Uoi570D5zi96HRIyIqrASfahbkE0aYy1Mer1S3FmWaJLhM3bLakXz2cbXCoygaOMtCwHGieYLIDbhrEnn2bDdGxEEYHTlKvnpQ3l33U31HEdcjF6nBV0TjPPlIEBYgtZSK2nSThFWyrHNjnRyBIBwfVrukeEocrFB4Ppt/L1RdL9F8Kui3OknNGqMW1IXrIN/zZgNxEDOGM6AwggGKs7DCCMNTbj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+9o4lA5jLtlE+t1C8SWRyuKfBOVd1NDRfLY6meKDm0=;
 b=fIK4EFcY+f7CPCspO91GzMKIEhbg/tYYtDTwuxkrdN2pIjsfagSXcwH6qPZ8bbH+/mo3k4qjK3AvxzEGEcafP4iAonlmzotb2WWYeyHVy3kLo+P7HbEoGva/sPPDVNjLlY9QnE80euJgrFfTXscOrir7wuu931wXu3fYGYbTeTKJXMhY5L51I8WcGVBxmATBRaLmYkt/DCy0iUkf5NIl1F9AniS+1fojlu3FNWgVht9FyfBoJ2fGT4TievW1ugY2cMh2nk0XvF3eZmZ8yBuq6EffswH/uOoeA0U8Y0hilLifEw2sLFbQlvjq4crvbVk91kg05wQ988lxwSyYbuyNSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB5938.namprd11.prod.outlook.com (2603:10b6:a03:42d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 20:56:37 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 20:56:37 +0000
Message-ID: <fbec5f62-10cc-4b9c-87d1-7777136a792e@intel.com>
Date: Thu, 22 May 2025 13:56:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 06/27] x86/resctrl: Introduce the interface to display
 monitor mode
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <ba19163dc9de8e8a2804d1968d5251f9bc801389.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <ba19163dc9de8e8a2804d1968d5251f9bc801389.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fdfdd4e-9958-400b-fb3a-08dd99732498
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTdZVndvM3hRcmlDZVFycFBzRkVDUWtzZ3pDWHdFaG9jZndoR2F2bnhIMStr?=
 =?utf-8?B?VFlzTW1sZnZFU3JJZlpNR0RjaTJLR1VFV2RvcVhaNDg3ZDRjU09hbDdYYU15?=
 =?utf-8?B?N0JHTW5NQ3hwNDlCYVdXREs5enltenp6K0tuYmtUQ3FhZjNvVzN4NHRsVHd5?=
 =?utf-8?B?NHZvZnJ4cXZJc1pwL2orbFYyN1dhOWRZR0Y3OE13a3pVVmh6TEtvRDUydm0z?=
 =?utf-8?B?d1kxVXFLR3lsWEsxUGtDY3JZNHluNXYrUUZXandRRGtjWXdvMDNKRnY3UlpK?=
 =?utf-8?B?YzIwSUxVVmd5d1RxTEZ2NW1EbUJvQmhObVhQemo2ckk0QnZpNzhXV3F6K2RQ?=
 =?utf-8?B?ZnM5ZzVKN0ZLWm5nbktYWXhvZ2c1K0RWYWlrVVB2OWxZL1Z0K0htb1dvMW0v?=
 =?utf-8?B?NFdEV2RvUXBRQjI4VXdXbUVuQUJtZWppY1p4SFpxREVnQVhFb3VMR1lLVEVa?=
 =?utf-8?B?bU56VWYyR29TdWwyOCt5Q2l6SEE3OEpKNkRVSTJ5QjNVaTZ6aVdrd3pMek1t?=
 =?utf-8?B?c01TZ1dJUEpESjFFM0IyRUI5VlhqMEZJdUxnMkVnTGZvTWh3L29nVjM3Nith?=
 =?utf-8?B?T3N6UjZ1SXVuemdxdEZDKzdqU2s4N0lvRkpIcVpHQWlKNHRLYTJYb0lLWkQ1?=
 =?utf-8?B?K2VxbHRkQXhpYlQ5L0x5Z1hUeVR4enMvMlNTbWI3M0RnZEtvUURLd3lnaVN1?=
 =?utf-8?B?T3BQM1RhRDRVMHRGWFFhQnZwdVp5TkNhTjZ3WkR4VEViN0pXb0RyQmk5RzJY?=
 =?utf-8?B?Q1lEaGVBMGlJbCtERm41Ym9WWkFzaGlEZlZaWXJJV251Snl2eXlYWFNzQnNx?=
 =?utf-8?B?WXBGMmZ4WUNlbGxHb3g3TzQ3MktldjdNb25PSzZ0Y2htUU13dU53UUh5QVhX?=
 =?utf-8?B?eE05UFZ1TEt0eVdMaUVmd2Rlb1ZzWXpDR0hkUHAxOXowcEVQblh4TlIyU2JK?=
 =?utf-8?B?M3l3S1JwdlFzcG5IMTdyWmdyOWRZYzNRVk9yWTNueUZNSXBwTkVxZVd5RkJG?=
 =?utf-8?B?OU43b1gvMG14TGVCUzQ2d3ZIcFQ5UHlmOWt4a2ZDakxoQitrV0VJRDdoa2Zz?=
 =?utf-8?B?K2FxSCs1L3FuVGN1MlBZdG9tQm5kRjBjSmg1eTBCMnd6OXVoalNzaHNFOGpk?=
 =?utf-8?B?UiswOTFsZWFjQjhRNVhMdkNYY0hqUUtUQlRtK0VjWkhmN0NTeVFnZHBQcS9E?=
 =?utf-8?B?aEltNzBYREZpMW9ZRW1UNFdUUXljd0VVN3FWenUxRzJGYjJLMnFxUG9XSVV1?=
 =?utf-8?B?STE2Rk9SQzhDL1g1MEJ2VVpmcG1kckFVYTc3V3RZMVBsNHhwdHR3aFdmK1ZD?=
 =?utf-8?B?U3hIWTZ2VHFTL1NLOUxCK203S1Fvd0l4VUpNeUdTSnZoelBQR2htUkxoY2pa?=
 =?utf-8?B?WGwxbDVhOUlrdnU5Uk50U0pTbWg1YlNxVExobGhEU2ViZU9DVVRRWEhlOXdN?=
 =?utf-8?B?bll6YmxOOVo1K3AreVJZU0dUbXJlTThhU2lhNTNOSjVMaGVwM2lRQmgvYkZB?=
 =?utf-8?B?MFhjbTAvRUNvS1kreXdEY1ZhdUZLdS9EWjFtalVzVlQ3NFQvK21sWXJaaWZY?=
 =?utf-8?B?Q0JEMWRLTklHbERqZ2phMS82bkVsV2M5QlVFN3lPTlQxM0V6MXdIZnFjejI2?=
 =?utf-8?B?YlgwTVprcDgrSlhiR2lYMm1nWC9MemppVHp2bW94RjV2cUxKOWRtbDgyUjlp?=
 =?utf-8?B?RjdMOUtiMjRzMmpPSU80azk3bm91cFRJN3IzU0ZJNDN6VzZqQmZGYi9GSlBH?=
 =?utf-8?B?OHpPY2FWUmVKQW53MklPSHB1ak1zYkw1d09WNGNDTE5xSFNTYmlWVFkzV0tB?=
 =?utf-8?Q?aVS79MHjyspLyjWGsstkGeaM9hgH8gHtZbAYE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elM2Z0kwMllFZ2ZKN0xGejVXRE1lS2lCeHR3ek9pNG5QTTRYdEliYjhPMXM3?=
 =?utf-8?B?SERGbkpkWlBmUXB4UmxZL1MxRG5DTGh4QzM5cmpub0hYQXlMenYvUit4VDZS?=
 =?utf-8?B?dlliSGF5Uzc2YXVkWFIzZ3Q1aXM2RnBmS3BEQTJnekNwQkk4MTdaK21ObFBq?=
 =?utf-8?B?L1MzQmhMQXZwVlNrcTRpbUJyQVJpcFl2eXFScEtVMlA2cGZYT0lYUU9wTk5W?=
 =?utf-8?B?bGxqY1R1c3VDaHVtaStJTHJnb0VDTjhDNVJ2c2xNQXBmNTBHKzdjYjkrdTFS?=
 =?utf-8?B?a204U0JsQXBRODhIUUcvZ2hBZ1pQRXo4ZUloNk1hU3JsSzBJWlpIanJNTExC?=
 =?utf-8?B?Y3ZQMk1EaldLNC92M3BaYmtQOWwvdTVyRVJPSCttaUtIbUpNTlNRQm1xNSty?=
 =?utf-8?B?cHluOFFwTDFqUVJkUUxPdHdxMVZ3Yk1QaXNaVmVOOFhPQSs3R2g2RmJyK1dL?=
 =?utf-8?B?cEd4TlBWemZSTzZKMUFKWVBkbStrYmJUQXBHOFltbE9JUnNHeFE5L09qam01?=
 =?utf-8?B?Y0RNZzI1TGFDMWVsNk9yUXgzTGJzL21ucUlRc3NkbDEwK0l5bEFiYUhOaGVi?=
 =?utf-8?B?U21pQVYvSEV0dXlGaU5qbEIxRzlqM3NFL1FydS9XZk1pNVRUZkh1NnhlSVVo?=
 =?utf-8?B?aThUWGYyQ29TTG95cFZMZ01aQ29KdEF3K0xjSVV3enArcFMydFBDdDVZTWRB?=
 =?utf-8?B?TzZWbWVZRlJieWcrd08zOFZzSkNBdmc0QWhoSEUxU2hKTHI1M3A1R1owcGpI?=
 =?utf-8?B?NkpVSVBkR3hqTFphSXN1TGpndlpiQnpXektWbFpVcXM4Rm8vemtXTGZyc2ln?=
 =?utf-8?B?UUxMaGM2d3VydXBGMmtNV0ZmTVIwS3hCZW8xbWY1emNCNXR5bWVnY3dtRmNV?=
 =?utf-8?B?NktnN253SXBkckFWVHJjRERJL0QvVkYxZjI2N3BxVy9ncSs0VGp4OFVRRGJu?=
 =?utf-8?B?T1BUMFY5SjBWaXB4UmdabzlaODUwaW1hdlZoWThtTys4cnQ1eGxDdS9jSDJI?=
 =?utf-8?B?eU1Ucm16ZVQrYWFJWTJiK0puRnlLNEpkdFdmdk5tNWE2cmxGd2s2WXc1VEpL?=
 =?utf-8?B?U2FjeHFRbUordCtDZGR5YmRUZ0ZxZ0lIanhrUlpPcXdmVFE0Z0VPTGdMU0tC?=
 =?utf-8?B?endpVjBOSzArVWtFTG9XM0QxV1h5bUFpalB5OWZKWHFpdktnSWtjOHdNaVY3?=
 =?utf-8?B?ZXRXUDdONHJnZEZLQjJOVkJqZVdROUdBdWpQaFFmcE5DM3JHL0xIbHFBUDM3?=
 =?utf-8?B?d3FWTUpPQlljQzF1L0FuWittVnZVaGJrYmtxYkQ3LzZsczNEUnNQSmZIUlI5?=
 =?utf-8?B?NFpCUXBaalR4K215VnBnSDVSOGZrTXlET2hKOFpVSThaaHlraTJleC8vWk5R?=
 =?utf-8?B?aDY2cjdLNjFzb2d4STdRVTE2R1BSYzFIM1Vsdmg4ZzBYQVN1c2swUGZ5TWc2?=
 =?utf-8?B?aTBvdGk0dXpVN2hJNHlyczVINHoza0dJSTIyNURSbUJmMUlXNDU1S2pFSytq?=
 =?utf-8?B?c2RHbThpc3RSMXcwazc5TnhIZzRpc1psWjZIZXB5VlBOMWN4Zm95bTB5Y3Zk?=
 =?utf-8?B?dWgzenlPRkx5M21Ua0ZLSXNMMEZRNzJYUHdVVWFzNy9jRUpsNjdvd1R1YlQ2?=
 =?utf-8?B?dWtxVExlMi9NUGJ4ellENlE3cVdaS1dzMmx0SzRlL2hTZWg0WjZFYkk1VHNw?=
 =?utf-8?B?M2psTzJyWGxBWW9JU3A0am1FMnpGZXZwK1pReWVIaENzQmtCcXpIdzVLUFRG?=
 =?utf-8?B?bE92QTM0QUkwRkZGdyt4aUdUR09YeCtBNWVWalhEaWV3WnZDSzRtSjcrUHNt?=
 =?utf-8?B?dzRMV0llejdJeFFLd3dicEo5Z1lLeXFoTzVNcUVJeWlOdk8rYUpob20xN1l0?=
 =?utf-8?B?QUFCckRlSFlGNTI0UXFuejZMeS9VSVlvY0MrNkxWZ2xRVk1XbzR5LzlTaTRR?=
 =?utf-8?B?Vm5Qc2IvUzBXMElqOGI2ZmlDWXhrVEYzZ1hLcWtFT0swMXU3SE1BUGxWVS9N?=
 =?utf-8?B?MlBxYWc2U3IzN1FiaGVtVTZJRnlRN3l0dkxXMStvd0E5d2dPTVVwNjlzWXo4?=
 =?utf-8?B?RmF6c0VmQ3B1QWJhRFp2blJvdlAvdmt1aytrNHdEb2FvOTllWEdTeVZDUzMv?=
 =?utf-8?B?TkVub3BnTWUrbDZ6bmg5d3QxY3ZXQk9Ga3FzakMyN2dIMnQ3cUU0d1dFTGJK?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fdfdd4e-9958-400b-fb3a-08dd99732498
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 20:56:37.2749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w150ZIL6R1pNERxMYN5DeOQ+DOMKUDMHMrWGi4xWJ6ecYBa54fhAlvbx0ENKBjz7GogLmVQZ8OuT+DiZG6cjByl9gMLdHEUyTg0BQYyP7kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5938
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:51 PM, Babu Moger wrote:

No comments on changelog since I expect it to be reworked based on 
https://lore.kernel.org/lkml/7628cec8-5914-4895-8289-027e7821777e@amd.com/

> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -257,6 +257,33 @@ with the following files:
>  	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>  	    0=0x30;1=0x30;3=0x15;4=0x15
>  
> +"mbm_assign_mode":
> +	Reports the list of monitoring modes supported. The enclosed brackets

Please try to avoid unnecessary words. For example,
"Reports the list of monitoring modes supported." -> "The supported monitoring modes."

Reinette
