Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27C9250BF2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744751232; cv=fail; b=AhTkdC1ZAFsrFdn3LS5sZ57DbOehygWlDCa9yq1P4KivTD/HKlFe+Hnfu0/hmy0jS76UzFx8ITU9uohB8nebe79WDQNCMjVkuLs6/MmmbY8vWDAeSyXBwtPWFpY8pBO1Mpp/MklNM33b8Tyof2/73AKYGFzSPjE6qMihSE3kq6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744751232; c=relaxed/simple;
	bh=0mQ+m7nAAOMqmeM2QKC1FxmVQnypjWqt1Ww9rhV41ug=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RQH7ijGTuOnU7I58bi7AaGMloArXXPOW/NFGSA/Nps/zzbc1Y55ShW2XazEIYep9ZFhpwc1J9ij9XmvI7J+ReKLfk+onpJBVN3ctmegRsl0OB4FnGDrzYqXP/Iok0QiVISdhcb6R3+AqdyUWLvmL0MRS6a2S1crNr7HRCo/DEpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVluFZjq; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVluFZjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744751230; x=1776287230;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0mQ+m7nAAOMqmeM2QKC1FxmVQnypjWqt1Ww9rhV41ug=;
  b=DVluFZjqj2chpweba3yEmikJrbucpaxRS7DcCJv3DLv4/HgtM/3Tvn1h
   npcCq0T/d9GmfP+8ITEix4XcJNA5osgEm57vl+zpLDE9AXqIjEUlF7GcE
   kXa2azCVe9jDQFuhXEtJms6bRqzxdRgwZHjM+32eWbTBzGUQq3O8lPh7s
   jyMTS5d5OViB7dEEfxBnnrrL467zSnci5mDSl3A5D6xY1o5k88ZTppJQC
   F10KkLHeF7ASd9PpgamCbkzfcVr/t1TLHJAA8uSEgIhdQpL7Infw/XVid
   LU1Q7gfuL9X/pVTXxR1v03fBC3Rl6W7Ql2ZyFlYqb/MFIrQEhOikZcKos
   Q==;
X-CSE-ConnectionGUID: 97wDHU7QRWy75aoiNC1gfg==
X-CSE-MsgGUID: MKpfUoScTyi1o8LvEQY4rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57644950"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="57644950"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 14:07:08 -0700
X-CSE-ConnectionGUID: b1xyjILXT3Kgp/0rrfeeIg==
X-CSE-MsgGUID: R2pHjvfyQ/KAoLgaP+FU1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="153447405"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 14:07:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 14:07:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 14:07:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 14:07:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnK2K1emo0upIpfr7bNFLgnU8Pj15zBya/XKXJjQG4rD1TLJcB8SKrkBjb1/ygk8yrWCm5ayy4hD9timHExG+t3+TehjnnkhgESrSQXZxOrg+VlWwrWTLSKVOWuMWk56KCKRuHPbnhAepIyHRd+g7MEvM8GRVFkt5rOC/24IcXYT68gDxm+9ykvSgmCWbd3U9Y+jG1lOwylbkpdzsew2/ip96K48YOfwD6jOiror3UYny3Da/0DhdQHBkh5T5PFkDCFrkCukVGDaQiIxYfABDRnti112Xm4phDskm/qmGtlPikIQPWlH1XVa0pPDY2g0sNKCJdDFB/WCvVtO/ecaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlK5R3pkNy40Air2bZxrA5ha3rnQW2aVbymI+S2NcXw=;
 b=bCIBlz5vmEl3OA7Ptd7xk5E4nrd3Jflj3KRrYLecZNB/wVXMpNFrBK82HoIakhWitArR6QdevYyZW46C0fpNA6npUgldLsy4on+pte7rL6+P9ZwmsSDitS9nSz2mJLg+0xXxdeU535csY/gnQrQvR13jJSy5YXr4QweTpOcfruD8ZZNr8KaQnTIKGL8EnFs9fOTCKa+rtFmbelQsQ3frHKNfiYGMa/CSg4ZiWEGgXCS6lHS91uOhGCEMyj+Oftmyom7S68vFK2/baq5ZORaE3zHwAuhhef/YyXo301Qn58VKVXKb7TdQnQ08M1WJh24x3lmDEyQRL7iI4GxYkFMZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 21:06:37 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 21:06:37 +0000
Message-ID: <9f7c6c14-ba6d-48ef-baea-7c313813d513@intel.com>
Date: Tue, 15 Apr 2025 14:06:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/21] x86/resctrl: Remove the limit on the number of
 CLOSID
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
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-3-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250411164229.23413-3-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:303:2b::30) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 3340a324-826d-4c2c-6fb4-08dd7c616902
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnhuT3BsVEFRQms3V1R5SWVlYU9IbTk4eXlra3NtMWVBZ3g1WnlZNmxvOWt5?=
 =?utf-8?B?emRuNHZPblFkOHp5a1Q0dFhINzFIcVE5bm1uS2dLSlZQZk0xY2RQaE43UFM4?=
 =?utf-8?B?MnUzeFpBbjc1Q2E3YkFDU2hMOWNxS1QzUzNESk9FcnpucitTVVhIV25YNlhw?=
 =?utf-8?B?aFhFUXFQYXBwZGdaWXVCR2VEenlZYXNGNS9Td0dpTmQrd1BsUW4veGg4b1hG?=
 =?utf-8?B?Slduc3hGaHoxcm5LcXE3Y0svWUV1eVJ2WnBYK0xKc2I3akE1REhZdk5YSnc2?=
 =?utf-8?B?VXpaSWtMblVnd01Wak0wL0VrczV5UkMrMVUzQXNHWmkxMFdaTW5URk9TQXE0?=
 =?utf-8?B?WHVJQ1FPdHI4Q1NQMmNIeTYyaWJnZGZsVUNoZGFWZ3VBTXZqNEwrakVKQmZK?=
 =?utf-8?B?MHplbkxHVVF0eXJOd0h0RFNKcGt0MVZUTXJnd2RlaDdCOEhtNGFvTlpPTzU5?=
 =?utf-8?B?VVhkV0RDdDBBcmJQMXd6ckNBNllSV2IyNnZvc1lNZUhKT2RsM3RRSFFIWkt4?=
 =?utf-8?B?VHRoL3ZKMDBLK1ljaXNaeFNnVFBmODhjazVPYlVDQjROUWlycjNJNXFycW0x?=
 =?utf-8?B?VGR3N0E3Z3ltcFEzMDhMR2tRaFB6ZGhLc0xIcXVUQUhmQTBlZm1oYXZxbzZ1?=
 =?utf-8?B?YU9MMmpCSFR0dEpKVHFHRGxuOUsrR3pra2UwSlVJbGdLaCtud0tUd2RYK2p1?=
 =?utf-8?B?Y1M1ME10WGt1dmd1QkNNcjlPTjJYYkUrYUhKTk9UeU85Ky9iSnF6NGtqb1gr?=
 =?utf-8?B?a2Iram4rYi9Ob3ZDbzdHV2lwRDVGQjZzUXdNSHhaL3pYRlpiMHlaZHZ6WHdR?=
 =?utf-8?B?YjIzcFN5TXU4RmVTSTFBRWErbDdtaThGblgzM0N3YXJFYzNMUDdBV2NTcVor?=
 =?utf-8?B?ZG9KSkJxVFRZRjlFNGg4TE80b0tlZStReGp2R3hBRGJ4R2wxejhibUl3bm5E?=
 =?utf-8?B?Mnl6K0ZMRk5aU1FHQm90d0dON3BDTnMvcE04N1BJOUZwZHNNMldUMXVjS29z?=
 =?utf-8?B?YUIzbEZ1OHMxTEpNUUR3eCtFa2Q5NEw4L0gvMTZPMGFBNG5xRWc5WlgycW5v?=
 =?utf-8?B?MWxrSVo3MzBZalN0M3J0cHQ4cU5VSUJGZis5a1o2S1RkZW1GOTdtWlU4MFF3?=
 =?utf-8?B?MDNkNDV5L3lRWjFGZ0dRRVVmRWswdFNBUDRpQTU4eGhOVC9TNTRLOHQ3VWxp?=
 =?utf-8?B?bjVBOVNCWlBGVnd3cmJvOGlmREtqUlZoOUR2TzhsWG9jMms4VStKcGViZ0k4?=
 =?utf-8?B?bTZEMEdJOFhLTThjTXN2TGFMZURZMEVFdERYUFRKVHdJMGR0dkFNTXZMUkhp?=
 =?utf-8?B?RkhoVCsvUkJBOFhuZ09NZ0YycWNDbnNhNml6QVhOaXFpeDBUMmY0RXhCOS93?=
 =?utf-8?B?YjdkamdyWmx2NkxBVCtOdWVrWEtPQS9JempRZkpOVHl0S0o2SDRpOXh0TnlQ?=
 =?utf-8?B?aUV6VVdFZnhmVUZzSG44eVNjZXpZSTdJdjFPaDFHbTgzdVdUM29nVWFIdzQ0?=
 =?utf-8?B?NXorb2VwQWI3QjdCdjFVZ0Q0UGtaczJCekJXSzZpeWk0TCtGZFIrc0NSWWJF?=
 =?utf-8?B?VDlVRzRiaTJFdDNUendBb0gzZW80dWFvVlQ3TWlOMVRheDJSb1JSM0FuaDNJ?=
 =?utf-8?B?NjZ1V2svWnAxdEJUU3FZK3J0c2hrQnhrQ2QyYW5SSGxYTjUwNkIrdGFtZmZZ?=
 =?utf-8?B?aFF5TGVCV0ltM3pIaTNtVDBPSXhNMUlVdjRtbHhkUGNUYjRwV3BYMC8yclNh?=
 =?utf-8?B?OVdtWTlVS2toYThBQjE4bDMxSFpzbU1LUGNIU0syUmlxVk1aRzFjRUdkZFBi?=
 =?utf-8?B?VXlkQnN0KzZPOHhFcWpNUkhOTHlKcnM1OC9jRHF6aG5SMldvekZicGtKQlBD?=
 =?utf-8?B?NXQ3OHZEckJXSktnalNtVjFXWVhlY1MwK055M1luaElra3UvQkRsS3FCUlBj?=
 =?utf-8?Q?U7kSEYUm54w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUs0dnV6RW0zbUN0TlhnbzB2aURSSWNMUWhOT3E4OHU4UGhZMkQxb29vaitR?=
 =?utf-8?B?WmhJVndITWlleTJzZGVSSnRzQzJlZUEyVS90a3JVK1FtT2FoajFwY0lVQlQr?=
 =?utf-8?B?cE4vWFovdnF0c1dwMmRhRW1KZGs1MXFZS1IvYmJWR2RVN3M4amxOMDIwZTh6?=
 =?utf-8?B?bzZOUkVvTm9VWnZWTU9JVDA3S1ZvKzhvZjhZZlQ3ei9GWDBlcDFkSVpHTGtw?=
 =?utf-8?B?SGJqV2lMNnJtNHoxc0F1ZmtLNDRYL1M5WGJxL0ZOU01OaFZCSnMvQXJyTlZJ?=
 =?utf-8?B?ZHpzRWJVNVlRbXA1SE9nbFRDY0ZnQU53OTg0R2IxaXBwaGtqVDh1Y2JxZWxB?=
 =?utf-8?B?eDJkZWcxUUV0YjNiWVkwSDR4QmsrQkF1a2liMmFhSGZYUGNQZEdrQmxMeUtZ?=
 =?utf-8?B?cUJwVnV3bmhGSnYyRkpxNHRDcGdRU3JnMGVjaDlZNjRtcGNodUl3bk1hMlNh?=
 =?utf-8?B?d3dqQ1FzbGpQTXNuK1ErOE1VSnI2L09Na3dDNURuOU05MUFqbENWdGdxN2ZF?=
 =?utf-8?B?bXV2VmNHd3FEcFExenZ3SkZuRjBqcUZ3S3BZM0RTSHFXOVlWZ1lwNlE4Uk8x?=
 =?utf-8?B?Q1dDTTdsUnc5MHJPamw3WUdvRGVZVUE5Nm5JRm04NmRaQmlYNnUwemlweXh2?=
 =?utf-8?B?SWdHbWNzUU1zd0FaQS9wK3BRc2N4Z1JJNy9iVTRES1RKbXQ5R1ZZUWowbHJS?=
 =?utf-8?B?ajZiK0kwVGdxWnJnZ0hPbWZ2WE1sVzE5VDR2VUpKV3gxRGtoWDljVllvbzVa?=
 =?utf-8?B?V09ocVl1TXZxR0FFRmlCNDR6Y2pHbWJFYkhUc0NKb3JaTHNaOWZxZGZReGoy?=
 =?utf-8?B?Nk5VTTBrbDNWS2ZkZ0E1dktoT3hjYnIrZWxKYXZMcW1hd1krN1ppenQ0Nmkw?=
 =?utf-8?B?Zit1aVJnS1BZYjFscW1XTzBweURQSHY5NjJiK0xMZlVmSG1zcUpYdVRoQmh5?=
 =?utf-8?B?c0EvMDZjMUI2VEZYYVlMSVU1VmdKK3ZJcTRtdiszYUhTcnpTUjVNcWZRN1pi?=
 =?utf-8?B?Q1d5Qi8xR0prdVpzOS9GUmF1YTRIWmx2ZGxGeTdEazdYTGg5aWxBajFIcUhE?=
 =?utf-8?B?YXZUQy9GaUswV0FPWjJkNjQ3cWMxNmx1UlJjQVRrMVpMcHJJZWFaS3hjaEk0?=
 =?utf-8?B?aXMwR0RIL2UvaDlqZ1pBRU1vTzRncVVUZ3dXbHVIOXVRVU9SdXJjN0FCTEk0?=
 =?utf-8?B?SjFvRU0yRXJBMEd2VG43bExqZmJ5OTBQQU9Yd0JETWV0NzJheFpZOUl4VTZw?=
 =?utf-8?B?TDcxT2pkUUQ4UWxERzJBY202NkhNQ3NkYkRpZmVWeTlYdDNYV0hoZXdxTzFl?=
 =?utf-8?B?em5UMm92SGE0V0FnaEM4Q05tT3Z5djc5ZWVuWjBzTi91T20rV2dNZFZLVWd2?=
 =?utf-8?B?YkVTc3BMWU1tN0c2U09oV3Z5d24rOGZHUmxDL0hLdEFsald6SFBRSWZPakd0?=
 =?utf-8?B?SzdWTWlZWUU5VUkyU1JjMlhLejA3ZXcrc3V1NlZyWnV5V09WMWsrMkZCa1NG?=
 =?utf-8?B?RitSN2ZrNWVUTzFzc0k5cVdKUFZFdmN6OXdmWFMvbWZHMDgrWkQrQ2xzN1BM?=
 =?utf-8?B?akZDNUQ2YlBSMTNkQmZ2alhmcEtXaFFrellFVDg2RkZaWlQzNUsrQjllYnBn?=
 =?utf-8?B?QVJSNlR5UHh1S2xIUkFKamx0cTE4ZlRxR3o2RHB3a2M1ZUI5QlRvS1k2ejcr?=
 =?utf-8?B?VTFCdnFZbDZwTStoamRWUnE0TXN3MkdRWmZ6amFRaGVtdzVWUmRSMHBteith?=
 =?utf-8?B?ejZKY1lucTFsN3NkWWxkQ0pEMG8rLzVjcGJMcUJqUnJOelQ5WXAybnd3UXFL?=
 =?utf-8?B?bTFUcVZUMTRuZE1kTmoxaG5HZVJobTRZOEZyZ2s5YndzcEhDeG5PYVVJNVlO?=
 =?utf-8?B?TnVPRXBUcWZSZGduUGxRM1FvQzlJdHVoZ0V4Uzc5RTkxOG5NUUV6Nnl5V2NV?=
 =?utf-8?B?eFNLcWRmcHdTd2JNNTBnR09nMFlIUURFNVQwWEtrSWk4c2FsKzhKOERMODZV?=
 =?utf-8?B?MEZ3UXoyaWN0MjZqWGIyR2dINUxsTEFwS3FneUVVMHZSVFZSYS80SVVBVVJD?=
 =?utf-8?B?bVFlSjlYc0Nhb0tCYTdtUEU5clFYMTZQeHNGWWxRYTZUcjFETU5qcnp0bzhT?=
 =?utf-8?B?TTREM2EwQ2hJdnZZREpXK1ZWL0owa0FHdS9wNmcyMURYYTJGSkczaVQ3NkJJ?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3340a324-826d-4c2c-6fb4-08dd7c616902
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 21:06:37.3667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUq8xc/Bs79Jo48d49JqiAlP1VxTBG1yUw8Sb9Nr4N4ksA+z3m7XpXmsWB9KRNxiHRhbkmHfuC+Gdh2Lq1K/TxCUJvfsIhw/DuAAxfTDWEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
X-OriginatorOrg: intel.com

Hi James,

On 4/11/25 9:42 AM, James Morse wrote:
> From: Amit Singh Tomar <amitsinght@marvell.com>
> 
> Resctrl allocates and finds free CLOSID values using the bits of a u32.
> This restricts the number of control groups that can be created by
> user-space.
> 
> MPAM has an architectural limit of 2^16 CLOSID values, Intel x86 could
> be extended beyond 32 values. There is at least one MPAM platform which
> supports more than 32 CLOSID values.
> 
> Replace the fixed size bitmap with calls to the bitmap API to allocate
> an array of a sufficient size.
> 
> ffs() returns '1' for bit 0, hence the existing code subtracts 1 from
> the index to get the CLOSID value. find_first_bit() returns the bit
> number which does not need adjusting.
> 
> Signed-off-by: Amit Singh Tomar <amitsinght@marvell.com>
> [ morse: fixed the off-by-one in the allocator and the wrong
>  not-found value. Removed the limit. Rephrase the commit message. ]
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> ---

Thank you.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
