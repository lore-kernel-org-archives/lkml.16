Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806EF236A9F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751455071; cv=fail; b=OsWVyRso6Gja9JO04cXn7as/38dfRO1FnVLyUUxNeqxOen0+0U+0SVB+a0YV6DP+iOQ1THmDQK92YWA0ZvnTtLG8Pwm6ktHVJPHR82mtJpVNxIhBmIcIG5VituJUcQIRO0OdkNXt048METS04a3EDR4AWASSfkPQNGZ+k+vNRCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751455071; c=relaxed/simple;
	bh=P0d1McJ3Z8PbnVttMhxETGLIPo59ptau9jq70WjINpk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tvOhYb7zH3n9XW0x/46RKUcMaJAaTmtzS070lC48Nx1zGJeldETGIOKvn9ril+gOoNcizhVwQkV+lve3MrYfN2ddf/W5gMlyEPp/fallDl7eTz/XMyHXJlOsROV5yrRMhmIUnwgIugiTWSuvfQvtLwQoJTiYWleeMz3mroLMhWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9BITiWc; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9BITiWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751455069; x=1782991069;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P0d1McJ3Z8PbnVttMhxETGLIPo59ptau9jq70WjINpk=;
  b=B9BITiWcxit42lkejpBeBdPPTh+I8K9zztEYPntWumR7/ys08WtPTabr
   0MBSAmteIn7qYJvCxpwV8VFj7EE8legOoIriEvEngOHXUjJr8f9C2avr1
   fYwNUk+0otVXPl7b2FJIx7Y7kHru+TrFuSYYzrR7aDtevfvUHk5j12MuK
   v6stewb5RskpCbkb/6zSQ4sOfXWo3Tw/zZ/XCvpr2c6kIdyRt0j5AVGRM
   O157aqFFJsh+ljUomTJSZtjdF+0aTtW4nn3zA+Vi8JCYUbn1lbQXjgHpn
   bGe5Odh+CvgMlmodkQUH3zfM2Jcg7AaermQK6ct4JfK1W3B5ZcLmh8T7y
   Q==;
X-CSE-ConnectionGUID: EezaWO9wTnCcGDqZxqbaOw==
X-CSE-MsgGUID: EkCNdj9tQIGc74iapdleqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53608440"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53608440"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:17:49 -0700
X-CSE-ConnectionGUID: Xzszitz6RQeXgRJDqznKLg==
X-CSE-MsgGUID: 2KYCZg6pT22uq+EG6hrmJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="185078917"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 04:17:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 04:17:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 04:17:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 04:17:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VP1P3uk6i3N0hPS4B9Qfd+uEGZcgjSxFd3aufiPoggrNl6yMAwoQRjtWMc1gIVz8cumwa2tWvLw43aAFzSmWuEunAIP+j8JQcAs09+L4C+6OEmQhmyGTaFop7t3n2ByR3rRTcFcth0EKYwyiQCxakTUAtcej1yDYPb8r06Qa8UoRRy+Va55US15IAo6IABCT01gYNA56VG14kXLxPgVHqPRKFG24HD7RvhP2YEc/GL9ocR+nYQ8C6/FtVFaMa0rRFER2KKMp8Fnys6UMW91tphwf81zK5S9KHdxS/ma1sXJ7FWobNBL8dDnEi28PIDxCqMYeB7yWzAvitvd3fiI1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4odLCXLjrgVzArt9dwdpZkQnS0EMt3gX+tPrqsgXwHc=;
 b=t7rYGabbaLFhWqVu19oiXio0FNirIEWHmPrwH1bYBWGm0qYen/RJcrCB0RY1C9XNJOHXw/ppXjmB3QWxPWrwYJoUkPHuhSVN5euZwRPmYb+NALZnL/H7+4bcRXK5A6FN4w7y1CGv88dmXQmc88cu49Wm4guCycmlJvij91nvOjOG2aTVDc6YZLXj+7QOtYpjBArt5IFZAcb+nvYx1NvPKR0/2kiIAySAu0Xd0N0Fe5tukjeYIiTrs3qhzXYhsetQrA3KX29sG3e9a9lyLsPghq6hntXo2TqodjDjoSXG0LOJLbOyIDGrpK8D3HXk3BYSlZ21/MsAiABd2ZmP1XALqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.38; Wed, 2 Jul
 2025 11:17:33 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Wed, 2 Jul 2025
 11:17:27 +0000
Message-ID: <0ec290aa-0e9b-49cc-9dd7-2f58c51b6d22@intel.com>
Date: Wed, 2 Jul 2025 19:17:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Kernel panic in __migrate_swap_task() on 6.16-rc2 (NULL
 pointer dereference)
To: "Aithal, Srikanth" <sraithal@amd.com>, Jirka Hladky <jhladky@redhat.com>,
	Abhigyan ghosh <zscript.team.zs@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Suneeth D <Suneeth.D@amd.com>
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
 <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
 <CAE4VaGBQnMp953tsv13s=CiaaiW+EZNuvh6dCuRA7MWbyU_Hsw@mail.gmail.com>
 <CAE4VaGAak=U-oLwXvPZsiNRnRvNL_ROKL8AJCSkCm+zPOjf2qQ@mail.gmail.com>
 <31bd3395-cfe3-4af5-bc1c-fa8d26629b93@intel.com>
 <d0b7b52b-c370-4ad7-8a03-d785f1505372@intel.com>
 <e9666935-f7af-4419-bb85-e1f041c64ea9@amd.com>
 <8a919ef6-4105-44e0-a17c-e41c1c0abbe9@amd.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <8a919ef6-4105-44e0-a17c-e41c1c0abbe9@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 5da481d0-143b-4325-c22f-08ddb95a06ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnlUSlB6aXpOek0vM1o1dlFlYldtWk5EeElMUkpyM1oxY0lOd1Rub24ya0lw?=
 =?utf-8?B?bjlvOHZNQ3NPWWpUK3BwYnEyelBvMXI5UUk0QjE1a3d3SUFPV0pXS0FRSHFv?=
 =?utf-8?B?R0RUWTJzbS9NNnFGREg0UENFeitqMGlJb3JyWGZKcEVyc0FGQnBoalYvcUU5?=
 =?utf-8?B?cTBoUWFabzVwb2RSMWc5cWJTc3RndTFWeG1vT01xVDFra21xNUZUUjZnRnhJ?=
 =?utf-8?B?dWFJTHNNMDJtNGx6MWpOWk91QmlZa2dDWEhOTDQ5bE1OVFRDNzhBU3FTcGtL?=
 =?utf-8?B?cnFkTTRSUjlCTFcrNmlCYm03M1ZHQzQ1ODBOVjlNMmNtWEJKRVFLQUlPT0Ft?=
 =?utf-8?B?d1M4MlBvb3JJZ3NnYjRPci9uSEhtMjdMY1pyeHBXZ2tiV1U5YS9weHprN05o?=
 =?utf-8?B?NTRjTktMaGx4K0VCVld3K3RsQ2xKY3JBNHcxRk1wSkowU29qYnluZjUwT2R1?=
 =?utf-8?B?NzVkSEJlVitsUzRySmNXakVtM2hZQXBWeVYxSXAvTHg5RjdPVjB4enNYQWtX?=
 =?utf-8?B?dFdMWWRXeUlxMkNCOHZxVnlPY0pRbzVEWFNkVDZKenhneW1xRUVzOWpqdnBs?=
 =?utf-8?B?WEhoL2YvVTBlemt1ZWFCMlFBekx3a2ptTXNOWkYwVGFRaTU1ZzIzQ0FPSUsx?=
 =?utf-8?B?by92dlRaNlNVdlFraVB6bU9sMTZMcUwvcHkxTkNQUVpKaEQxeDlQM3h4c0pz?=
 =?utf-8?B?WFRaT21CZHMxZlJHUEQrb1d0dzZuMFZORnhVMXNlZTZCRmdMV1JQSUw5Sm0x?=
 =?utf-8?B?TndhMitlUjFoTEZjR1BSOWVEQnhRTzVyOXhGOEYvVXkzZjd1OUh2WEhBeTA4?=
 =?utf-8?B?K0p1bWNlTEw4VktTczZac2g2UU5LcnB1bG5ET2JsTEJqSHYwWGVVdmUxOWpW?=
 =?utf-8?B?Z3NMVEhBYk5tMlE4VnlOSTBCTXlJak0wSFZFcldEbGR2RTM1SWNTV3FxeldT?=
 =?utf-8?B?M3F5c2lndGJvSElHeEw5OUQzc1dEKzFEWElkaFRoYWQyYzd6dVNUenlvOXpG?=
 =?utf-8?B?bm1yQmVCYm9jZVhSSldZcG1SM1ROZEhCRVhYZWF3c1FTSTQ0MWhYV2RJZkVY?=
 =?utf-8?B?S09SR0RqZXB0V1cvRzEra2tZcmNuTnRwaWlHQWFuZk5idUJpWStrdjBVV0Fq?=
 =?utf-8?B?cjYrVG96S2tyMC95TzBUZVpXeitWM2tUOWRuUUQ1cnJpVXNqdURmVjUzZ2Qy?=
 =?utf-8?B?MWx5Q1JjTDZ6QWcySXhzVDVCVURkcDF1Um01ZlRPZmw4dmpMdUduOG83ZnBK?=
 =?utf-8?B?eFdNbE5JQjFJaTArWnF1ajV0TkU5aUJzTHhMUGlQU3BhUytrbHpEOEVnSTV4?=
 =?utf-8?B?bzVwRFhMMEsyZkw1SjRCU3A5TCtQcXdHMTBTK04zR2JQNjlPdTZBazZoUW81?=
 =?utf-8?B?SWFRczBYSVdTUlJieGR2cm90ZUl0QUdyK05EQ3VQYnlvb0Q5akhwd0g5VUNP?=
 =?utf-8?B?ektZTFZsTTRwMDJYODltWVMvaldjNVMxNjcybFJ2V0JVbEpxR2kvRkg1S3p2?=
 =?utf-8?B?c1lIREJlSkNveUZzb2h6QnV1eFl6cm03bERYVG5lcUNTYzJFUzlubXRjNm0w?=
 =?utf-8?B?R3FhWnVzZGZEUTNjSTB0RGFSQ0djdmIyYmFZaVZNWFhYRUg2cXRwdDhJdUti?=
 =?utf-8?B?TmlQMTdNdE9OSVVPU2N2RDh3MHBtd3BlMFk0NnA4dHVnbS9ueWVWWGdyamdQ?=
 =?utf-8?B?R21wcGtzdTJoUVRyb09nczAzaGw2STExQU9IcVRVcG1xdElPM0p5enZGTnNy?=
 =?utf-8?B?YVhUMHVMR2ttMEI1Y3QzblZEYjl1aTlLb0RtT0diZGFvWHRDblBQOWdoOUNt?=
 =?utf-8?B?NDdibjcyVVpFL3lLSHo1TUQwSFRHVWtYd0xVYlZWYThITDBKazRNdGJFRDNL?=
 =?utf-8?B?TVBUUlRJOGp6aXY3L0hxWVdxSVVoa2VFWFZ2R1JxdEJDUTJnT0NuRjRtRnJB?=
 =?utf-8?Q?EDk6v2BmOuw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1VNOTdJc3FKMTI0ZmlUMGV2VUxHeExDRVQrRmcvUXdOVm0wRXlHVkdhMjRX?=
 =?utf-8?B?Tldabm05NVBpZWljRHJFWm9UY3pjZ0xsUEhvSHFMZ0VramNpTG82UElwNkFa?=
 =?utf-8?B?bDlSYTBYRWliYWhZZkwxSG43OE9yVjN1WHorczl1M2gyamM0UTg4cEUxVEU2?=
 =?utf-8?B?QTFrb3U1ZmFsTGJKakk3M0NhYjdGRCtkZ2pvMXljTUlWZWdiWEZzV1pHSE9u?=
 =?utf-8?B?YnFadEY0eVBqSzR6cDhYSWczUDA2NjlkTXBneTBCNkNhMlMvcm5sZWhZK25Q?=
 =?utf-8?B?SHFYMnZhM29DN3NFUk8zenoxN2dkaCt4QjA4Y2hFYUVlTFd3R2I4M3VvUlBt?=
 =?utf-8?B?ZFFyNlFnaTRvb1FxVldteG1UalhXNGVXSjEyRjg3aXp3OGpLYVhuTXlrYzBq?=
 =?utf-8?B?dTNvenkyaVBNaWJMT2JCdm5uN3lXR0tlVEQvbkJPM3dxKy9pbGdXcGtiMFVn?=
 =?utf-8?B?aitMOS92OVFvdVlwSVg4b1BTWDJsYjUrTitESWlMZnQ1UkJvcitydEpoUHF6?=
 =?utf-8?B?N3ZEOTZMMFB1UTR2OWV6SkhrNCs1UmlXcytJZE1UVzJEYkIra3pCaEVxVTRV?=
 =?utf-8?B?TkQvdVdWVE12Y2hmWDFhSGJGZDVkMkMwMXpOYUZlNEFKMStLT0lBMXlqYWlm?=
 =?utf-8?B?TklEc2tnTXA5d01IWEFiZHEySm5CU2FWbFV3YWdBOW1LSlJuOGhrWVduMDVT?=
 =?utf-8?B?MGgrL2pXM2UxdXFDM2cvVGV5QmVSUlZvMjJGandtQ1VjOHZLWk5aZWNTQ3p5?=
 =?utf-8?B?UElKTGZvSTNKZW9FMlNYUCtFSWxneVNybGU2U3hlbVV2TERsNUE4bGdPZDZO?=
 =?utf-8?B?OG0zL21qRi8vVDdCcStMVkxHaEwrMk9rVlZDQXo5R3NTaG85VUhjejVZTDYv?=
 =?utf-8?B?YnN1N2R0NUtFSkhHbEw2TUpyeFd2S05ZKy9VVThLQVJxbkNCWW9QcUhOdlp3?=
 =?utf-8?B?RXZlWG1neTVQdGxyeXgxWXNDbWZ4S2E1NS9URU1XM2dCVXNUMzIyanVYT0NT?=
 =?utf-8?B?cS9yd1RFWFlZeGRYTGVIeHFlVjFDQnc1OXl3OHAvOTEyN3hnRjlTUnJrMVB3?=
 =?utf-8?B?MFdrTzJnK0FKNDJnakJwb3A1RnlYU3JzVGlrKzNYNlRRTGdFbWVyQStpUExW?=
 =?utf-8?B?bVlabmQvWUc5dFQwVmgzUWwzMVVFMFVRRTM0Y09QZy9kckc2OEFJMzFSUlpz?=
 =?utf-8?B?b2FPRnE0cW92akFidHkzcDlqSDNqbnU2azN4QU8vM0dPNHkzQUEvSTcwd1JF?=
 =?utf-8?B?WnNrd2NWQ1UxTUY1MDFGSk1scFlRb3RZY0ZnZmVWMUFuR2dwbjdyd00rQkZu?=
 =?utf-8?B?QkxzRWk3dzRJUlR5cCtZVTRFZGwxQWVmY0ZLSE5jUXdGeGFid1ZkYmtUaFdv?=
 =?utf-8?B?eFArQlBNU2xKYmIzbVdENnh5bTBhUE90MmF1T2lkOUhFVERmRUIzLzZwQ1Z4?=
 =?utf-8?B?UzNHOERKT1BqWk9sUE0wZ2JSeHhuZ0lMV2NFV2ZVNUQyZzlRM3U3QzBtRzBI?=
 =?utf-8?B?emQySGFsNnJVcmVUZEpmOTA5TUNkOXdObHFPeW1pVW5rN3g1UVowcHViOWts?=
 =?utf-8?B?S0VKRythTlIrRGVlV2QrdkIyZk5uUEpBbU9rOFVDUURBbGJmNjc0ejlGazEv?=
 =?utf-8?B?d3dyOVdhdHVBbFhKTFlvcHViUlB0aHM1c0plVWViY1Q0VWpjZEFaek9aTjQr?=
 =?utf-8?B?dlZMM2tQUkF1Y2N1NWZTUHlFdEEzL1BJZCtoeFYzQXF1cDF2eEdHNkxKVml6?=
 =?utf-8?B?MDRyakNCVndWMXFPbktSUmJHeXZ2RHpBK0VFZzlRS2UwU3NoNzNJZlV6RkJi?=
 =?utf-8?B?MXdiT2Q0QUZnbmdGUlJPTWZXRUVzcnBSRnZ1UVFqUmh1TjhCbmJQMUxhYmVq?=
 =?utf-8?B?Rm0zdDVOV00rM21uVUtQVXJKNEsvaXowV0ltK2J6K3UvOVFvVlFNcnM0OHQ2?=
 =?utf-8?B?WmlhejE3UHVNUmI4Z2lIWGJkWUd5ZUR6Q21Qc1BWMEpOeURpMTVtcDU4UlZi?=
 =?utf-8?B?Y0k1dWFaNWgvN2gzT21VdW00SDFScjFsSXdYQldsZE1jNVdaK3c5VHlRa000?=
 =?utf-8?B?aERsd1FEcXZyVUEzQlhiS0xjU2ZwOGwweE9FanZZYVl4dTFmZ1BSYTdzdzVQ?=
 =?utf-8?Q?esdLQSU6mO7AQAedRvWuuqSt0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da481d0-143b-4325-c22f-08ddb95a06ad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:17:27.0843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYSIq2yCb7/tZbMUJ91gGjjh9WF+ZfZjmJyme2sebH/+56vXFsqpLZMjttvlj6JRdiVNMmlXWdITuTDSahDElQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
X-OriginatorOrg: intel.com

On 7/2/2025 3:36 PM, Aithal, Srikanth wrote:
> 
> 
> On 7/2/2025 10:02 AM, Aithal, Srikanth wrote:
>> On 6/27/2025 1:03 PM, Chen, Yu C wrote:
>>> On 6/27/2025 3:16 PM, Chen, Yu C wrote:
>>>> Hi Jirka,
>>>>
>>>> On 6/27/2025 5:46 AM, Jirka Hladky wrote:
>>>>> Hi Chen and all,
>>>>>
>>>>> we have now verified that the following commit causes a kernel panic
>>>>> discussed in this thread:
>>>>>
>>>>> ad6b26b6a0a79 sched/numa: add statistics of numa balance task
>>>>>
>>>>> Reverting this commit fixes the issue.
>>>>>
>>>>> I'm happy to help debug this further or test a proposed fix.
>>>>>
>>>>
>>>> Thanks very much for your report, it seems that there is a
>>>> race condition that when the swap task candidate was chosen,
>>>> but its mm_struct get released due to task exit, then later
>>>> when doing the task swaping, the p->mm is NULL which caused
>>>> the problem:
>>>>
>>>> CPU0                                   CPU1
>>>> :
>>>> ...
>>>> task_numa_migrate
>>>>    task_numa_find_cpu
>>>>     task_numa_compare
>>>>       # a normal task p is chosen
>>>>       env->best_task = p
>>>>
>>>>                                         # p exit:
>>>>                                         exit_signals(p);
>>>>                                            p->flags |= PF_EXITING
>>>>                                         exit_mm
>>>>                                            p->mm = NULL;
>>>>
>>>>     migrate_swap_stop
>>>>       __migrate_swap_task((arg->src_task, arg->dst_cpu)
>>>>        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP)# p->mm is NULL
>>>>
>>>> Could you please help check if the following debug patch works,
>>>
>>> Attached the patch:
>>>
>>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>>> index 8988d38d46a3..82fc966b390c 100644
>>> --- a/kernel/sched/core.c
>>> +++ b/kernel/sched/core.c
>>> @@ -3364,7 +3364,12 @@ static void __migrate_swap_task(struct 
>>> task_struct *p, int cpu)
>>>   {
>>>       __schedstat_inc(p->stats.numa_task_swapped);
>>>       count_vm_numa_event(NUMA_TASK_SWAP);
>>> -    count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>>> +    if (unlikely(!p->mm)) {
>>> +        trace_printk("!! (%d %s) flags=%lx\n", p->pid, p->comm,
>>> +                p->flags);
>>> +    } else {
>>> +        count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
>>> +    }
>>>
>>>       if (task_on_rq_queued(p)) {
>>>           struct rq *src_rq, *dst_rq;
>>
>> I was encountering the same issue as mentioned earlier in this thread, 
>> which has been recurring in our daily linux-next CI builds within our 
>> virtualization CI stream where we observed this BUG appearing randomly 
>> during the runs.
>>
>> Additionally, we were able to reproduce this issue while running the 
>> autonuma benchmark. As mentioned earlier, the BUG would occur randomly 
>> across iterations, typically between the 5th and 10th iterations.
>>
>> We consistently encountered this issue up to the 6.16.0-rc4- 
>> next-20250630 build [https://git.kernel.org/pub/scm/linux/kernel/git/ 
>> next/linux-next.git].
>>
>> After applying the aforementioned patch ontop of next-20250630 build, 
>> I tested it in our virtualization CI and with the autonuma benchmark 
>> reproducer described below, and the issue no longer occurred. The 
>> patch appears to have resolved the reported problem.
>>
>>
>> git clone https://github.com/pholasek/autonuma-benchmark.git
>> cd autonuma-benchmark
>> for i in $(seq 1 80); do bash ./start_bench.sh -s -t; done
>> Note: The server running the autonuma-benchmark must have at least two 
>> nodes.
>>
>> If the provided fix is final, please feel free to include the 
>> following Tested-by tag:
>>
>> Tested-by: Srikanth Aithal <Srikanth.Aithal@amd.com>
>> Tested-by: Suneeth D <Suneeth.D@amd.com>
>>
> 
> 
> I apologize for overlooking that this was a debug patch. With this debug 
> patch applied on top of 6.16.0-rc4-next-20250630, I am unable to 
> reproduce the issue. However, when I revert this debug patch, I 
> encounter the issue again on 6.16.0-rc4-next-20250630.
> 
> 

Thank you Aithal, this is a debug + fix patch. And Jirka has confirmed
that this helps somehow. I'll post a formal one and Cc you.

Thanks,
Chenyu
