Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58111624D0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744344131; cv=fail; b=GnnJyX9aYC9W6OrfExgalSqPSEUg1LByufPXahs5f5t8ooUbxLGlGr440LagkUqEPs7wFY4obFXkJSyD/WmfF4BpzIHhVxK4VjNOYT2HD2hkBJYd+jBwhNDfTueYiUSCmu03a2kPvhFxgW15MEtH4lWniTx9jaK6+xUS//XW8Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744344131; c=relaxed/simple;
	bh=q+ZxtUCmcRPmcUgWAW7XvkVxBsmr0iDqFuZba4FG0to=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q7xSrJOR86mx7rvhoG9OWjivaaTe8SK/E0c8kN1+hY/6ZwcS+0mUIDLGF9VBX8a65bxxa40+ZmI8J5TaeBVktwW6z7IuRxA6lNCg0XcWPMYzVBCR36wXx57SepdBY7uo8be2DPCiylj5Q6bME7ti9ToBXG6wrG0S+F4V5XIf9zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+HVI5Wy; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+HVI5Wy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744344128; x=1775880128;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q+ZxtUCmcRPmcUgWAW7XvkVxBsmr0iDqFuZba4FG0to=;
  b=i+HVI5WyosphcqY40ClDlgtBSSWV5AhpwUuTF02+WihpTidHtduyY4qi
   hraqCoL3nZpdYhWDoDVxGRJ07aAo0VJlz6T1pfvoI/+JG2FnTWS7Cn6PJ
   Cb6toHOAPz3LA5uyoxDFt46Y9yQ1RUQ+hqDShUPmav8DEUPyBcOjRpyQ4
   i58kniD/5QajHBY4h6JGn9hZUK2khvVAt1VwGno0DqUXuEM28RhaEWXww
   NgjDgAKcza1eIBPi89lItYklbvIq26+YWhGag89gIFRMx5jFQhZ2ubknH
   MuJGeWeWulywkN/Ut5r4Mnii0+3eCLOrZgcNhk9LMEbCCjw2NZVVeGFCy
   g==;
X-CSE-ConnectionGUID: H/S1FHraTD+thnsEr34mjQ==
X-CSE-MsgGUID: L7RM4vxRSC21nGoTt6wCZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="63428083"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="63428083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 21:02:07 -0700
X-CSE-ConnectionGUID: EBSuB2nFR3exH12pR0uuxQ==
X-CSE-MsgGUID: LjlB6tPDQ7ydQ7BkFmIbAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="129076492"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 21:02:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 21:02:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 21:02:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 21:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGJuR7kU/2sgmdkX10qRyZgl5JUhnMAFjssAIDruf2SWsUdJHCfwSyyNTTOHi++UD9WXwqtJHlceRAEFbQbyi4kIQOgxKkCUOcUtfBEvrMt0Sz4cP/3MyMDPh7LHSWbm4JxvONyPzKmsHx+ImDTS/AZOPbTqW69ULfvIckkzvSw8pSe+dQztagqSVrekZq2vb8WOhXn1sXbA/qAIY1HmMicQXVBayCIVEHQzVTvDayOhWu8a6p/1cBLHyef8EL2ttCkJpoJdFo2DD0GfCnVt+x8qGaKnxy5QvAqSy1uVKQXcEn6zo693mLHDEvtkJYgH4tGBAnbnMaywYbYdRc336A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OStjKp/Fk5nF5bCyue7Q6Njx9p6daFaoK+D3sHsOPY=;
 b=AAc4KIpWi9eEyj588ULbouSJUqofW/+8ohgFKtP762t2D3tZLpWnCdYoBSJ4YR0YW0oEPZJvO+S654cA0/d9JXDP3/HsqTOTyO+1BGyZtdl2V8DtwM1klES9zZWvTbxDSMkcM+aCTh8tvoLPVlY9A3//13MXGSS+g6MvxmTr5k5yUlh7UfYeQH6au5hAXJGAJkkktt8yLIno1/zDgY+YVQ8O6MdQO9akvGUU6AVi6Mbixupw4TJNSUXdy2nGnoOti1V5vJLlqJdFe+8fCL/eS6OakURRAR4heaprrPrODnCkyL9/tT4ieq7+3NLNE8XZYwACVn2GwxUEGSxdjvn0sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6269.namprd11.prod.outlook.com (2603:10b6:8:97::14) by
 PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Fri, 11 Apr
 2025 04:02:00 +0000
Received: from DS7PR11MB6269.namprd11.prod.outlook.com
 ([fe80::af1f:dcc:49bf:1a26]) by DS7PR11MB6269.namprd11.prod.outlook.com
 ([fe80::af1f:dcc:49bf:1a26%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 04:02:00 +0000
Message-ID: <6e4b6bf2-b76d-4fd6-8ff4-48551bf28784@intel.com>
Date: Thu, 10 Apr 2025 23:01:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] tsm-mr: Add TVM Measurement Register support
To: Dan Williams <dan.j.williams@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>, "Dionna
 Amalie Glaze" <dionnaglaze@google.com>, Guorui Yu
	<guorui.yu@linux.alibaba.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
 <20250407-tdx-rtmr-v3-1-54f17bc65228@intel.com>
 <67f5bf037da7d_720529449@dwillia2-xfh.jf.intel.com.notmuch>
Content-Language: en-US
From: "Xing, Cedric" <cedric.xing@intel.com>
In-Reply-To: <67f5bf037da7d_720529449@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To DS7PR11MB6269.namprd11.prod.outlook.com
 (2603:10b6:8:97::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6269:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e2057b-3466-4cfc-5239-08dd78ad9be9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHIxTUJXcXFUZ1QrMUlXVUVUZjZaSlBoVEFMYXhGTklFZTJWVEdCZ0xjMnJt?=
 =?utf-8?B?blZUVXFkY0FScXVtVGRKaGFEODRXR2tQcUNiZENRdXA1YlBKMGI3OHpvMTlz?=
 =?utf-8?B?dk9zY0srUElRSmtzUERjUnljaGRFRkoyNGNKbnI0T0F1RjJBSXoydzRCYlZh?=
 =?utf-8?B?VlltUHk2Si9FbVdrZGxKb2M5SURqWSt1bEwxNnpnNUdwUUlCZk9sdTdLSEtv?=
 =?utf-8?B?bTY4cmQ4aEpadVJsczdOL2NJU1ZHSzEydWhPbFgwelBRZGR5VGZyb2YwR0FS?=
 =?utf-8?B?WnJXZlhtK3hZMXRhelBlVVM2YnNaMTdPeUtxUm9GOEhYbzRMRTI2b0Q3b0Np?=
 =?utf-8?B?UUhxQ0dwYzRMWHVoaFY3ZG1RYTBrWmRoRk9KaGdobWdOSHlxRGJDWTVUTXo1?=
 =?utf-8?B?S1hOcEdNYnlYV3pmTUlZdkVCK2NoMkVNdklQdUZyNWNmSDdZWXE2RlZKMHZL?=
 =?utf-8?B?bWR1N0JxVE9GbVJrVTRGbjdCQk5wTXRtc01rdDRCVjNYTDhZUGRYbGh0Mzlz?=
 =?utf-8?B?VUF6ZmEzWHJrYzUwSnQxUUlRNCtkaTN6cGw2YXJURmgwL29OVi9CQ3B4Q21X?=
 =?utf-8?B?dFZON0Z6UFNOTG9VUUp2eEF6cmtqN08xbHhoYjgyWkpwVUFlandmbFZ3MUdG?=
 =?utf-8?B?STBZblUvZUFwVEJUYk5rZlRCbEtEYVNma2luU2cvZG9qbDkvNGU3akorQTAx?=
 =?utf-8?B?UGl4c0FpTGN3UExEcGtHdjhpSWZwclRtMnJ4ZTc4REhrdm1LUUhEVUR3NUFN?=
 =?utf-8?B?Rzl2dzA3QVVTbDM0RW9uS25XdmxkT3RKeG9saXYrcGhncis5VDgzUUptZmQ2?=
 =?utf-8?B?elBPOHk3QXdKMG9IamVPT1FaZSsxY2F6ZU1uaUEzT0wxaFp4RnlzVnJ1Zllh?=
 =?utf-8?B?ZVM4bnlqdkhVK2k5anZmRHZjS2lVK2ZBNno2SUNlKzRHNGtqOFM1MHhLWG1y?=
 =?utf-8?B?Q1ZiUGhIZG14Um5pL0FqTG9PaWt6SFo2Z1ZjUENaeXdadVduRHpaWi9MMzhh?=
 =?utf-8?B?citkWGhnQVV5Q3k0WGhCVzJWb292cFhremJ0VjlDTXB2Y3lBbVQ3TURvK0VP?=
 =?utf-8?B?dkJjY0FpWDZiVW40QWZvZGMvT2xBbWpzRjBRMmVGRzY3UWhPQ1BrVm9uR0ht?=
 =?utf-8?B?WStSNm56cFpnclBWNkRmTVRSNkhhMEE3TmZseS95eHBSUnZWWWlWcnRuYmI0?=
 =?utf-8?B?aTVhalBJV0k3REtJMDRmMjNpZ2pYc3NLbXphRDlXMlZ0UEpiL2I1c2xYYW5k?=
 =?utf-8?B?OHVmWkFpbkk5bjBHQTZNRTltZkg1Qm1CV0xhWFBqZFU1UE5GSGwwMVZRSURk?=
 =?utf-8?B?RmdvRjlaMkZjK2FwUUo2Sm1KWFdiRmxwcVp5cmN3MzVwbHRBcW1LY3hQSFlo?=
 =?utf-8?B?YnVicm9hZ0tzaVFGQnZ6VDVvQ3EzNlBJUmp3OG1hV0VWNWNuaUY2UkNubVJU?=
 =?utf-8?B?by9KUFl5ckhhM2tURFlmM2pEYjNUZGh5MzBqUGlsa25OK0tNRzV0Q09vbVNC?=
 =?utf-8?B?dk50RnVINVVNTzZUOHhEWjZXYnJZZ2VtK2VrQ3VBdlppUW9jc1NrcHhUNk1a?=
 =?utf-8?B?SkluN1VaRUlkVk5oRk9oVG5jeDluM2VTc1MzU3F0SHA3OTVLZXpCa0YrcHB4?=
 =?utf-8?B?WWdhNUM1akFwS1VHMGxsYXNyRGpBTVkybE1OYzdveWoweTh2UEVMY00rM0Ry?=
 =?utf-8?B?RWJteC83U29xWjgyMEVzQWNGYTIyUlFJVVlLakdXWUJTOUdwVXpSM0I1MXUw?=
 =?utf-8?B?Q3JxYjFydkF1eTJMRExkU3NYTURyT1NZbzdYdE1mYWF2bjBtM1BMV3JoQ01i?=
 =?utf-8?B?bVd2Q1FtdGNaa0lTL1dDZTNYckIyMTh5MmxJYmlQMkxPamV3Z1U4UHVRSThv?=
 =?utf-8?B?UU4xSkxOOTgyMjJPQkkrSGRFTEdMd1h2eEJpemdPWGg2cFl1TkdiSkk5emFy?=
 =?utf-8?Q?UBj/6HH7c1kGe9tydseztYfpyan42Kyn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6269.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aysxMWRiQkp1MCtka0s5WEt3K3JEY1pOd3hTNTg3R3UxTW5iU1lxNUszZG1B?=
 =?utf-8?B?V1BmK3ZMV2dTS1lmaGpIbCswZmNwWmtKbnU5bDJCRzJ3amI5WXZyMXFLZUVj?=
 =?utf-8?B?YWhkbDNUZWxKamdzakd2ckJHNmJwRUdwa2w1WXRnd1NKem10UzQyNjJGRkc4?=
 =?utf-8?B?Nk9Kci8yWDBoS1Uwa1hGUmVwakRxdVRTVy9rWG5kYUlXcFNBSWRKMUJ5RzND?=
 =?utf-8?B?WEtwRzhHUCthQlo5Qk5VUFk4OW8xU1UwdEN6NTVFVnBsSUF3VnU0RDlMWGxM?=
 =?utf-8?B?dlRvU2lQRkZ2K1YzSnRpNUxHc0FjbjQ1YktQL0FPREg3akxyaWpVbnFtQk1w?=
 =?utf-8?B?UENqUWZ0N216aGJMdCtjdklVMXJ6dTIxUTRpR2JCS3NPZnpYVVB6YWxDTk1i?=
 =?utf-8?B?djArcUsyb25HUWVOamUyUjM2WEtHK1VCTGh4WEFvMjkxWUlHSW1NbkJYc3Q1?=
 =?utf-8?B?TXlUdjZYcGpib0VsamkxRW9LN3R5a1NuM3FHWFZjcGZLQkZpUmVEdEIxOTNa?=
 =?utf-8?B?VDd2T21qbEJxeVBhQWhGR3ZSUGwxeTlHM252M3JTQjc5TzIycVE0VXhjMDd4?=
 =?utf-8?B?aEowd0tsclkwTTFvWnZvUVJjWXpyTk5lU0dJeUd6d3JCQWZ4ZnVKeFlCZWM0?=
 =?utf-8?B?OHF4cWcxWUd0U3pDUllUZUZTRzVvR093QkI4UnNHempWdURZSXdKV2dEZnZQ?=
 =?utf-8?B?YUsrSkY0THdaa2pqa0l1akIyaXBYOWI1cDlLYmJXSlJ4N2FEVDZjOXY5ZUtm?=
 =?utf-8?B?L1hxMkIzeGFNK29KbFpwZUJxK09Xc2JSQjgySXJ0VmlhWm8ycHNxbFprNHNt?=
 =?utf-8?B?eVpWa1U0MmFNTEx0eWRjdXcrY3FyL1BmcHZ4SkpLM3cxUU96cmU4NGFUOUpM?=
 =?utf-8?B?Q0tPSHpUYjkxbncwdDlWK0IvUEx2TWQwQ3BXc09RcjhESlB6cHYwck5uaEtP?=
 =?utf-8?B?NU1lWGtyTFRVVE5UczA1OVBCK1dDQkFpOE9VbXdiblJnNWROVEdubjZxVUh6?=
 =?utf-8?B?OXBYUlBxb1BBeWFQdk1TQ1EyeStWa0hnQVk4amRQaXlyL05DRXE4VlNuYjE0?=
 =?utf-8?B?TDF0S2NlakdyV1F2Q3dwZ21mQW9LYjZ3dmNTNkZVbTN1K2tTQUJkNFlWRDNH?=
 =?utf-8?B?NzBFUTVnTHYreUFoQ1psYlNsc0Jyd1NDNW1MWm4vdG9neXpXdFFOQlF3ZW9t?=
 =?utf-8?B?ZzUwTlMwSzhLQzlSRnpBWENWazBhdTYzN2RndHhLYzljZ1hYMVNiWjlMZnRv?=
 =?utf-8?B?Q2FSa0JXUFR5QkVUT085cjdmV1hUSzlJQkdzRFY2SnZnUXNjRUpqcnluLzBX?=
 =?utf-8?B?ZGZCc2tTZE9sdStJbkwySFF5TXliTUxkdFVjOXRrM09WdXV1Q2JvU2xISFJG?=
 =?utf-8?B?R3EyNnpFdE5YdXlhUTJSVHFLZzlOdUEvZGZMUTQ5eDlybnNycGhJL05ON3ht?=
 =?utf-8?B?LzRaWmNpMW0wZjZVcUx1WUtMUTVaWS9rY05va0FaNFR1OHZZWXB6SHZQVkV0?=
 =?utf-8?B?MlF3Q1ErZVNrd1NrUldYRGVzeFdudzV0b2FTK3NzYkV6Q0tBZVhxM05RZ1lV?=
 =?utf-8?B?Q2xZWFkySFpDRzJqb21EV2ZVdkphRW9YRXQ2UzQ0NEZoQ0x4RkZJbk8vRDUw?=
 =?utf-8?B?OFJvTXMrOHFua3dYdzFpUUY3TEx3YytLSzlld1YrN0RDUlQvN2V1TkZvbmdL?=
 =?utf-8?B?azFyVkdHMGlOelZ2Y3hGc3g0TnIxeWt1OXVNdHRKVDdYQjlRaG55eUJKZ2tv?=
 =?utf-8?B?aHRoam1qUDJjZk1vdVA2dmN6T2Rnam1yQ2kxY0MyQmNiWVR6bko2aWYycWpD?=
 =?utf-8?B?SzRXY2U4bTR4ZDN5UTR5RjZKeE5xMzdHRlJLLzA1MFQrL0ZSVFJjT0hza3lN?=
 =?utf-8?B?NXUxTEFlQ3Z2b0ptVng0MGJPNExTZzZadFUvUFJKcTVMTWE4RGZrK3Q5dDZD?=
 =?utf-8?B?c3lSK0NuMERiaE1zelhCN1hPSHMxVUtBdWZPc2JOZDhyTmE1VHBqcEFhUUtZ?=
 =?utf-8?B?SUxVNWpTN2REQmJpTFVyTENPakxINERZWGF4aUFmZ1lNaUxqcTRZaU9VQWhl?=
 =?utf-8?B?eUFDd0s0eXdacTNaSzB4UllvVGRpOW9NSXJleG9YYjd5eUNrYXVGK3lEWitB?=
 =?utf-8?Q?u3rE0v6lQH2zw62W9ehe5yTbk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e2057b-3466-4cfc-5239-08dd78ad9be9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6269.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 04:02:00.0415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPVaHcMe5/ljmDtIlLZdNUC1D+vvG2D8Lnh8mXxoRjm7H2ZHFBoBoY8LwWYJ4kb3uwNqDCBVWj4sX3hsFTxSDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
X-OriginatorOrg: intel.com

On 4/8/2025 7:27 PM, Dan Williams wrote:
> Cedric Xing wrote:
[...]

>> ---
>>   MAINTAINERS                |   4 +-
>>   drivers/virt/coco/Kconfig  |   5 ++
>>   drivers/virt/coco/Makefile |   1 +
>>   drivers/virt/coco/tsm-mr.c | 209 +++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/tsm-mr.h     |  93 ++++++++++++++++++++
> 
> I note that the pending proposals for TEE I/O suggests splitting
> drivers/virt/coco/ into drivers/virt/coco/{host,guest} [1] [2] [3].
> 
> [1]: http://lore.kernel.org/174107246021.1288555.7203769833791489618.stgit@dwillia2-xfh.jf.intel.com
> [2]: http://lore.kernel.org/20250218111017.491719-8-aik@amd.com
> [3]: http://lore.kernel.org/20250218111017.491719-17-aik@amd.com
> 
> So if I take this through devsec.git I will get that rename queued and
> ask you to rebase on top of that.
> 
No problem.

[...]

>> +	/*
>> +	 * @ctx->in_sync indicates if any MRs have been written since the last
>> +	 * ctx->refresh() call. When @ctx->in_sync is false, ctx->refresh() is
>> +	 * necessary to sync the cached values of all live MRs (i.e., with
>> +	 * %TSM_MR_F_LIVE set) with the underlying hardware.
>> +	 */
> 
> Code comments should add to the understanding of the code, not simply
> restate the code in prose. So I would replace this comment with some
> non-obvious insight to aid future maintenance, something like:
> 
> /*
>   * Note that the typical read path for MRs is via an attestation report,
>   * this is why the ->write() path does not automatically ->refresh()
>   * invalidated data for TSM_MR_LIVE registers. The use case for reading
>   * back a individual hash-extending-write to an MR is for debug not
>   * attestation.
>   */
>
> ...at least an explanation like that would have helped me understand the
> locking and caching model of this implementation.
>
The reasoning behind this involves not only ->refresh() and ->write() 
but also LIVE and ->in_sync. Generally, both ->refresh() and ->write() 
could be expensive so we are trying to do only the minimum. I'll add 
comments to the definition of this context structure.

[...]

>> +static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
>> +			       const struct bin_attribute *attr, char *buffer,
>> +			       loff_t off, size_t count)
>> +{
>> +	struct tm_context *ctx;
>> +	const struct tsm_measurement_register *mr;
>> +	ssize_t rc;
>> +
>> +	/* partial writes are not supported */
>> +	if (off != 0 || count != attr->size)
>> +		return -EINVAL;
>> +
>> +	ctx = attr->private;
>> +	mr = &ctx->tm->mrs[attr - ctx->mrs];
>> +
>> +	rc = down_write_killable(&ctx->rwsem);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = ctx->tm->write(ctx->tm, mr, buffer);
> 
> There needs to be explicit ABI and driver-api documentation here for what are the
> allowed error codes that ->write() can return so as not to be confused
> with EINVAL or EINTR arising from user error or interrupt.
> 
I understand your point. But different CC archs may have arch specific 
reasons for failures. It'd be hard to whitelist all the allowed errors; 
while blacklisting EINVAL may make more sense, as users have no control 
over the input (hence cannot provide invalid input) to arch specific 
write/extend functions. I'll add to the description of ->write() in its 
kernel-doc comments.

[...]

>> +/**
>> + * tsm_mr_create_attribute_group() - creates an attribute group for measurement
>> + * registers
>> + * @tm: pointer to &struct tsm_measurements containing the MR definitions.
>> + *
>> + * This function creates attributes corresponding to the MR definitions
>> + * provided by @tm->mrs.
>> + *
>> + * The created attributes will reference @tm and its members. The caller must
>> + * not free @tm until after tsm_mr_free_attribute_group() is called.
>> + *
>> + * Context: Process context. May sleep due to memory allocation.
>> + *
>> + * Return:
>> + * * On success, the pointer to a an attribute group is returned; otherwise
>> + * * %-EINVAL - Invalid MR definitions.
>> + * * %-ENOMEM - Out of memory.
>> + */
>> +const struct attribute_group *__must_check
> 
> No need to mark this function as __must_check. That attribute is
> typically reserved for core-apis.
> 
Will remove.

>> +tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
>> +{
>> +	if (!tm->mrs)
>> +		return ERR_PTR(-EINVAL);
> 
> If you're going to check for !tm->mrs, might as well also check for !tm.
> 
Good catch! Will change.

>> +
>> +	/* aggregated length of all MR names */
>> +	size_t nlen = 0;
> 
> Typically the only exceptions for not declaring variables at the top of
> a function are for "for ()" loops and scope-based cleanup.
> 
Will move it to the top.

>> +
>> +	for (size_t i = 0; i < tm->nr_mrs; ++i) {
>> +		if ((tm->mrs[i].mr_flags & TSM_MR_F_LIVE) && !tm->refresh)
>> +			return ERR_PTR(-EINVAL);
>> +
>> +		if ((tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) && !tm->write)
>> +			return ERR_PTR(-EINVAL);
>> +
>> +		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
>> +			continue;
>> +
>> +		if (WARN_ON(tm->mrs[i].mr_hash >= HASH_ALGO__LAST))
> 
> Why potentially crash the kernel here? EINVAL should be sufficient.
> 
Agreed! Will change.

>> +			return ERR_PTR(-EINVAL);
>> +
>> +		/* MR sysfs attribute names have the form of MRNAME:HASH */
>> +		nlen += strlen(tm->mrs[i].mr_name) + 1 +
>> +			strlen(hash_algo_name[tm->mrs[i].mr_hash]) + 1;
>> +	}
>> +
>> +	/*
>> +	 * @bas and the MR name strings are combined into a single allocation
>> +	 * so that we don't have to free MR names one-by-one in
>> +	 * tsm_mr_free_attribute_group()
>> +	 */
>> +	struct bin_attribute **bas __free(kfree) =
>> +		kzalloc(sizeof(*bas) * (tm->nr_mrs + 1) + nlen, GFP_KERNEL);
>> +	struct tm_context *ctx __free(kfree) =
>> +		kzalloc(struct_size(ctx, mrs, tm->nr_mrs), GFP_KERNEL);
>> +	char *name, *end;
>> +
>> +	if (!ctx || !bas)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	/* @bas is followed immediately by MR name strings */
>> +	name = (char *)&bas[tm->nr_mrs + 1];
> 
> I looked for a helper macro for a "buffer at the end of a structure",
> but could not immediately find one. It feels like something Linux should
> already have.
> 
Given a pointer some_struct_p, the end of it will be (some_struct_p + 1) 
or &some_struct_p[1]. It'd be more readable to be wrapped by a macro for 
sure.

>> +	end = name + nlen;
>> +
>> +	for (size_t i = 0; i < tm->nr_mrs; ++i) {
>> +		bas[i] = &ctx->mrs[i];
>> +		sysfs_bin_attr_init(bas[i]);
>> +
>> +		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
>> +			bas[i]->attr.name = tm->mrs[i].mr_name;
>> +		else if (name < end) {
>> +			bas[i]->attr.name = name;
>> +			name += snprintf(name, end - name, "%s:%s",
>> +					 tm->mrs[i].mr_name,
>> +					 hash_algo_name[tm->mrs[i].mr_hash]);
>> +			++name;
>> +		} else
>> +			return ERR_PTR(-EINVAL);
>> +
>> +		/* check for duplicated MR definitions */
>> +		for (size_t j = 0; j < i; ++j)
>> +			if (!strcmp(bas[i]->attr.name, bas[j]->attr.name))
>> +				return ERR_PTR(-EINVAL);
>> +
>> +		if (tm->mrs[i].mr_flags & TSM_MR_F_READABLE) {
>> +			bas[i]->attr.mode |= 0444;
>> +			bas[i]->read_new = tm_digest_read;
>> +		}
>> +
>> +		if (tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) {
>> +			bas[i]->attr.mode |= 0220;
> 
> Typical expectation for writable attributes is 0200.
> 
Will change.

[...]

>> +/**
>> + * tsm_mr_free_attribute_group() - frees the attribute group returned by
>> + * tsm_mr_create_attribute_group()
>> + * @attr_grp: attribute group returned by tsm_mr_create_attribute_group()
>> + *
>> + * Context: Process context.
>> + */
>> +void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp)
>> +{
> 
> Related to the removal of __must_check add safety here for cases where
> someone passes in an ERR_PTR():
> 
> 	if (IS_ERR_OR_NULL(attr_grp)
> 		return;
> 
> This also makes the function amenable to scope-based cleanup.
> 
Will change.

[...]

>> +/**
>> + * struct tsm_measurement_register - describes an architectural measurement
>> + * register (MR)
>> + * @mr_name: name of the MR
>> + * @mr_value: buffer containing the current value of the MR
>> + * @mr_size: size of the MR - typically the digest size of @mr_hash
>> + * @mr_flags: bitwise OR of one or more flags, detailed below
>> + * @mr_hash: optional hash identifier defined in include/uapi/linux/hash_info.h.
>> + *
>> + * A CC guest driver encloses an array of this structure in struct
>> + * tsm_measurements to detail the measurement facility supported by the
>> + * underlying CC hardware.
>> + *
>> + * @mr_name and @mr_value must stay valid until this structure is no longer in
>> + * use.
>> + *
>> + * @mr_flags is the bitwise-OR of zero or more of the flags below.
>> + *
>> + * * %TSM_MR_F_READABLE - the sysfs attribute corresponding to this MR is readable.
>> + * * %TSM_MR_F_WRITABLE - the sysfs attribute corresponding to this MR is writable.
>> + * * %TSM_MR_F_LIVE - this MR's value may differ from the last value written, so
>> + *   must be read back from the underlying CC hardware/firmware.
> 
> Maybe use the word "extend" somewhere in this description for clarity.
> 
Will clarify.

[...]

>> +struct tsm_measurements {
>> +	const char *name;
>> +	const struct tsm_measurement_register *mrs __counted_by(nr_mrs);
> 
> I had assumed that __counted_by() is only for inline flexible arrays,
> not out-of-line dynamically allocated arrays. Are you sure this does
> what you expect?
> 
Thanks for pointing this out! I misunderstood __counted_by, and will 
remove it.

-Cedric
