Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791CA1367;
	Wed, 25 Jun 2025 04:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825993; cv=fail; b=dKgfFN2mLeV90djpO3pIDSzwilucxlvJyDCtSiGnEcG7mzN5ifnrL1tu8k6NCllYsfi1dAGHh/KeTAF+Xzf8PWDnC8UrC/UlNQ+XSTeoXNADHFS7QsWcVojQo74zhbhhpVxJpag9adVCdBahNKoLEZMHnMyPZKugSyibfi0WdCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825993; c=relaxed/simple;
	bh=ch0w3GhPIEXVs1UNOFyonJw7jPzgxnjg8l5HXI2A5i4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mIdhRc/ryccgZWm5pwa2thlcQ3YOvS+pX5wsudHeJ9LA2mTxKMdkUCoKZ8xxVxq+XyiJmiOsvNxasmNZ2Ggv0xFyc1D0lPB3xZksgTiYZV2iPN1eVrDDLScdvhJEhI0jnYGtvDcPkm6OCYXjC1A7E2Tud4N7bSQ1Ng/gns+dh+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ekkxd3AJ; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ekkxd3AJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750825991; x=1782361991;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ch0w3GhPIEXVs1UNOFyonJw7jPzgxnjg8l5HXI2A5i4=;
  b=Ekkxd3AJO0Bc0+c4qVv7217oUmepNwcuxLixxGNXw+AvEoSeLcBZLlrP
   B4KSpaa2ANro5P6+a4kuRtK2ipF0zvB5BSzF+qkWcCXcDd6N92/ybGCI9
   pWPSvGUp+hU/3jfQxBIiOS8pjSDO67Fm3Lk9eqEnUlN9XDD2gliwkgmnh
   bVdNSACM9PINZAv5+u7kaniik9wvp8BRIqBsh5nJ5crC1+O4E5dWiwqWI
   CbaNVjTMb5RvUf9bm+V9MVH1m2nhSVK11eESex6JZDcb9gnrGn5SDqM8R
   pGVD8rBeobxG9VdY+meFkAKWv5qe6xY/KQZBjSu6WwcoxKoipTT8dA6rZ
   A==;
X-CSE-ConnectionGUID: mWH5yy8ISD6DtIeMcD+ELw==
X-CSE-MsgGUID: G2H5PoTmTBCaX5riyW2jUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="55709623"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="55709623"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 21:33:10 -0700
X-CSE-ConnectionGUID: ebgUC73jTtSKn3vQy/6vzQ==
X-CSE-MsgGUID: WrUnS+i9Qzi5NU/VHkcLmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="151521975"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 21:33:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 21:33:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 21:33:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 21:33:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwBrFJie9R4M4qGEmviJo1OuOvzKwvsLVoca5SdMA3tzaYxfA0wOjheg1fsdoGPZLO3v3mfB0wdmUo6M8lUpvNIJeera2T8QONcvYpsRi8V9NvvPce/23VnwQvnhCHPK+G2YpJ/6zU3qwStwW2/VRRutB7jV4oQ8hn4RMzEZQx+zVo3mW/zSB2OFVCN1Inq5NGp2ZjF+4wAUsKH+D+akHG6z/UreA/nDjQzdem7AfX0Ru8MD4ztYUGQ+Q5PxP79QTd8QI/JuVxaIVDRW21pKIPqrdjB76cwu/n6u5ZOO10C1/TfW5cLHJjVRnlgvonl5jrHfni3XjgmvoR8tks2/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofkpV/gzgaVCbDS3z/kQ7t52sEbS+Hd51KWmBghVWAU=;
 b=DmIR16p4VuKOQ5M2dRF3kVd7hQ0NnoqxcOyCL77B1uremSZDIozZ03dX0TzKgTxTHoTVJ47wGBGHOPc5Pukt4o5E4XFtCBKOgUaxKMAZIamdO4JqhE7e6eiEJUmVYwl2HXZfibkDP0DGpfQ6WzuZ0JeXmLFF12H4fbMOKUKeyd4Np2/boNYNP2fxUOMjXcN/5yVuBu/K+Txr6VTOoKux7sQjf4RH63OX0TK8NOEw/u4cf0i0t7/TjfntLgA28au+GbVwCwUpmYls8F7ZwzRt+FL/hYmoxP2za9k4Bl8Ay0tySd81zWgHpjzEklNWFJxsNDpk0qsPVyS4Kb1WfDtSCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS4PPF821BFB4AC.namprd11.prod.outlook.com (2603:10b6:f:fc02::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 04:32:52 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 04:32:52 +0000
Message-ID: <fd9c7ca0-1d16-49b8-b3f7-4f37cbd9060a@intel.com>
Date: Tue, 24 Jun 2025 21:32:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 23/32] fs/resctrl: Add definitions for MBM event
 configuration
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <dbd02fa64c22ec933ba27e69ded8288d4d4ae9a1.1749848715.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <dbd02fa64c22ec933ba27e69ded8288d4d4ae9a1.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS4PPF821BFB4AC:EE_
X-MS-Office365-Filtering-Correlation-Id: c09e1bf6-bcdc-45ed-f939-08ddb3a158fe
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlJwQkErb2RJRnVnN3JBQ2U2ekNRV2VIVjQzMDNYYkhvL2FaWXhQZ05iQXQ1?=
 =?utf-8?B?b0Q0YU9KSlRWV1VOWDRucnJYZHNmUFBzZUM3SkY3dFlpVE1tRHdaNmduOFlG?=
 =?utf-8?B?ekJaa0JPQ2FqSFU2TExlSlk5ME90NGVpSWVkMTloOXZjK00zU2E4eUFHMWpz?=
 =?utf-8?B?QU9HWXJFUmpNamhSaUdVTUt1cW1wWVYxZnZPdk10MjhlbWFlakFlMml3UkRp?=
 =?utf-8?B?VE1TQnZQcGlFRys5NjdJK21VcUtmVGNQeklTZ3dtS0NhMWcvaWZoMG96QUZw?=
 =?utf-8?B?a2ZRbTd4MEJhUlBlb1FLdWg4YWUzMXgxT1FtcGxrT0lQM295VlRyaGwyRTd4?=
 =?utf-8?B?WXhJa3I5QStmT0ZaUlkvSXpBRWVLTGhweFRST1FNUm92bHpLU3VuZVhwRDB6?=
 =?utf-8?B?S0pobjJBRGNBZUhvc3d0cGgrVmh1OW04cWJHYmJSNGVoZWxSa0ZjWWE3N2Vm?=
 =?utf-8?B?TmlLdVdxUFRPVXRVZ1ZzMmVUZC9hRkpIQXYveGdYVFhJZXdDZDl2UCtURjdt?=
 =?utf-8?B?Y0xQSm1wZDRTSUxzRmQyZmxjVlo1RjZRajloY3RxS3llS29FdWZwODdYek9k?=
 =?utf-8?B?V2NZQ3JtY3p1TFZqMEVqanJNZEt2c3Z3N0tuRy8xOU9aQitkd2xKQ0trMHBa?=
 =?utf-8?B?Q1pPZDlXaXhCUyttczl0S1RYZ044VG5EOGNYVUh6Wkt4b1ZlSFlKTjFGL0RI?=
 =?utf-8?B?MlJOZE5JenJYNGZLOFQ5M3A0S3FGNXdDOVEvYm1KcGc5dFh2YTVlamtuRDhq?=
 =?utf-8?B?SHdYL1pudGYyS29TVGkxQWhIRkdJZlpJYnNuUjd5Uzg4UkN1M1RtRGIrRXRp?=
 =?utf-8?B?YXU5UjR3YlN5b3czNVhhdE53dGVhcGZLL3puQktrZFJMRldNOUJiUm00VlBo?=
 =?utf-8?B?d1R4a08rRW1NRHBEVy9vUnRHWXA1ZmltWVA1NExRRkpkeUdiTVdBUlREUVNX?=
 =?utf-8?B?TEUwNDBkVWI4RE1NeHNuV3U3SmtrMSttWHBiZzloMjVUa0E4VDJqT3h4WlFE?=
 =?utf-8?B?YXNwUmRQUHFLOXNTMWQ3T2s1OGRiTk9jZDRkRjVsOHV1bjAzUjY1V21ScDdq?=
 =?utf-8?B?TGJhVy9NaG9ZQ2NRRTVhMGRnRjZmV0orUkcyOVE1ZEZKVFZiNys5Um5DVUg0?=
 =?utf-8?B?dU1SbDBOU0FnNERLWSt4WnZETnRCNG1tNVROMk9MSUdxM25JSm1UTkRvZURz?=
 =?utf-8?B?aG5Td2JETi9sZzJETVR4bTY1K01jMG54VjlxUFNFTFBwZitFY3pVNGVlQ3Ba?=
 =?utf-8?B?V0JFQTJoZDhOdWNVRXQzcFNzN1NmZ1psbUJSN3FuOVI5bjNIUytVQ2s3VlZ5?=
 =?utf-8?B?ODB3Qlg5YkhUdmZiVUQ4WGxqbEdiaU1sTXNaK2V2R1RiVTJmWU1aR1gvWGFr?=
 =?utf-8?B?dzVXdzZpcG52VHZubjFjMDh5aS9iNjZJSGRtcHRhSCtTNDdtU2JUUW5IYkNw?=
 =?utf-8?B?Qk5saHFaVVdvL3BoVVZ1T2NtSTB2b1BGUWlHSjNsQ3ZhdHBEQzBURUhzaytl?=
 =?utf-8?B?RXpKaXFoVXFlQlhTUHFnOXdqNjErQXhQeTJIYTNwYkgyWGVvbmFwKzdqVTlC?=
 =?utf-8?B?WmZuRGJQaThpcHZzL2F2clJweHIvTWNqVXNhV1JlOHNTVDljOEcrb2E2ZGdi?=
 =?utf-8?B?RklwYU96OVU0SU5NRHR6YWFiSkx3Q0hIUVd0eHBwMWZiM2pkY0pjbzFKbUNF?=
 =?utf-8?B?NU5zK0JRZmR3Y1VDVExXRHZGODZJNVNhaVEyaG1adGxwQXdBTnZoenRFYkhU?=
 =?utf-8?B?b2JJMGJnRXBZTmdJSnlubGZ5UXJrM21hYXhIcmM4dldSZTNVOHBrZ2RWam1S?=
 =?utf-8?B?MUFNMktkUWR2N0tpWFd0dWk2akJXeHNHM211Ums2Yk4rUjdPZHFJaGJFR25p?=
 =?utf-8?B?a0ZKVVBiTmo0MloxbENTMDFLblJudjdGT24vSkFsNVpOYmZSU1FjNmhHZHpa?=
 =?utf-8?Q?+UT3laF6ex8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVBnR1BtQ3JKL1JUMUx4WE54b1gwYmZPQTgyWHBzNEY2Unc3S2htNFBLN2hP?=
 =?utf-8?B?cXhhOVQ5aGovRzgxdFIvVkJ6NU1PYjkvSS9wR0xoT0dwcnpNVWNXMlJZQVNn?=
 =?utf-8?B?a3JDT3h6RHlZUFVFMk00VzdTZSs5NjNvTVVLREhGbFcyZGRyOUZ0c29uWVcx?=
 =?utf-8?B?YWhlcitxNE01aU44dEpFazg2MDhiSHhwdE5XaUFwWnU3MDE3WGJONmpGdEly?=
 =?utf-8?B?TG9KeW9saVI3aXVSbXIyc2hqdjJwNkNLNWRwL1dDMCtNeVZyb3FvTktIWUox?=
 =?utf-8?B?dCsxY2IxWmFycE5ud0JUNWFKUXc0NWszWTlsSFZ6SlRQNmoyVmJQL09FL0tT?=
 =?utf-8?B?dmpCSWFDb2Y1bEhuSmp5MVRJeXVmWFltV1ZhbDRjWnBDclAyZmVMMjRuT0pz?=
 =?utf-8?B?dFl3cXNuYUh0cDh1c3NHUVV5K1BzUW1ENUZzQ0M3R2JBSmFQS2tNUWhuNFho?=
 =?utf-8?B?ZW1KUmFncEdGRVhDNnMxUDBKTXcxMDM2YTFKNmlXSW1BeHlyZFVpaHUyVmVO?=
 =?utf-8?B?c1JobFdsL2pnZGRsckhTOHBVdUJpME01RmttNlVUZ2VlSVBUcXRYb08rckZi?=
 =?utf-8?B?NWpoUlVtM294QWJqRWlQSndHTGVHVzNXcjVhQ0N4ZlJtMktjaG4wRHltYjU1?=
 =?utf-8?B?TWFqUStCRnVGU0lUM1B2Z3p1WmliUElTQ0Y4UTZrdHRGcU5zRXc3Z1BPczJm?=
 =?utf-8?B?Nmo4TWZjMjNiUG8raWs2dk80RXVZMU0zMXpIcW1WSG83emhNeWMxWWRYUko0?=
 =?utf-8?B?cFh1WC9QYzVGR2JUb1pOUWJ4VEZsMEkxLzRobllLdDB5RmUwbDZkbVlSazJm?=
 =?utf-8?B?NnkvK1IxSlpod0x4NGFERU82Q2tLaE04SlZFNURFbUpJenc0WS9STmFYbnpD?=
 =?utf-8?B?eHZCNUVHRWRUcld2SmEzRzk5ODY5L2kzK3F1ZzQ3aEdoaFVybWxIY3lsVjds?=
 =?utf-8?B?VGwrZjRTV2cxYkREbGpEWlFoaFRTckFBTG1Dc3Q5UDh4SDV5M0ltRUhBUHhK?=
 =?utf-8?B?SFhZczZSVkRkNm1aU0FqRWhmd3dHbXg3eVE2djMyTjdFSXBnZXdlNFVKdmVv?=
 =?utf-8?B?VFpNeEkzcDdXc004TXVPT2I4U2s2MXVQdVcrbmMxUERaWDVTOGk3S20wN2pB?=
 =?utf-8?B?d2VyaWU1OGZsL3VtbUdBYUVVbmFoRnhOT0VKYVRzZVQvQStBOUVVQWFYYlhH?=
 =?utf-8?B?aWRES2pZV1ZvdFZFc0kwT243ZEZGYkZZcWlkMUNNK2kyTEhTMUVjRlRwdnRZ?=
 =?utf-8?B?WUZETU9PK2Mxd1k0MGNzUnBYa3ozclVoZjZST3JoMkxGVnBWT1B1My80cm1u?=
 =?utf-8?B?MFR5UXZqakV0WEJmVzh6Q1FNOFVvWk0yRlFXUjFIRHRQNUJQWnJjN3ZXSnVG?=
 =?utf-8?B?SzdhVTNxam9aVitycTMvdzgyeDZvZTA3Ukc5OWIreWNQK2RERWpVWUZXTWs5?=
 =?utf-8?B?QWtEV3lwUllVWVlTcXlzM0lzb25lRCtyejNLcEh5NlVmQWozMVJOL1ZrcjlZ?=
 =?utf-8?B?ZnVjelloNW5JUHdpSUNUSHhyODIxaDltWE1Ydjg0R1pxYkFKa20vclUrN3FV?=
 =?utf-8?B?bmJqRVE3UlZOL25wNGpVRWtqY3RwVUV0NUJGcE94d29LaklOLzc0aEpzL2hx?=
 =?utf-8?B?Qk9zRm1MWTk3V3hrSlkycDQ2Y0VyWXEvOEFOSWUxc1JKc0dJaEdZN0JMVFkw?=
 =?utf-8?B?QVZ3TXpISG1lbXAzdkpMVDZIaGh5ejRqRUcydUFPL2pnYlc5cENLU1BjcnBV?=
 =?utf-8?B?eStUclVtbktYbE9qbVlmT3ZLN1dGM3VEd25Zcm9TeXJVUThYS1AzMm9yOWJ2?=
 =?utf-8?B?N0ozZndzRU9tWlJDUVJxUFRSVk45cG84T3ZrY3dsd1llSy96ZlIvMGxPdFJj?=
 =?utf-8?B?ZHloK2tWVVdwK2x3MzVoWXpWM1p3dm9lYmxUU2JqS09na2JsMm5CekVEVGgr?=
 =?utf-8?B?eExDZE43RUk2RVZzYW5TSW9PY1RvV0NwcUUyQkFTRXNuN0JNamcrOEZ0VTlM?=
 =?utf-8?B?NzgxUEJqbituSHV6NitiUUU4cHdWRFJGWG1oVE9TR1lkY2w4djNWdGVNd0JS?=
 =?utf-8?B?WTQzWFJ6MkJIV0psQURlcURmc2VtbWxHV0JIWUNmNXl1MkdiN05kR3ZuTkt2?=
 =?utf-8?B?Wm54S2hDZmVTMjUwcDE1REZJZjc3RndIMzFpYzhhNmtoNncrNmtSWkFqcUt1?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c09e1bf6-bcdc-45ed-f939-08ddb3a158fe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:32:52.1835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuFCun+LHsQndWNEwEIfyZo9qELqsoBTzEXgQbWEmwYERTkFoKcXLLexzk54BYC1Fw8h33524BulPScAEA6wzckvk7d42j8r/WsiHNV0BoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF821BFB4AC
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> The "mbm_event" mode allows the user to assign a hardware counter ID to

"The "mbm_event" mode" -> "The "mbm_event" counter assignment mode"
(I'll stop noting this)

> an RMID, event pair and monitor the bandwidth as long as it is assigned.
> Additionally, the user can specify a particular type of memory
> transactions for the counter to track.

hmmm ... this is not "Additionally" since the event is used to specify
the memory transactions to track, no? Also please note mix of singular
and plural: *a* particular type of memory *transactions*.

> 
> By default, each resctrl group supports two MBM events: mbm_total_bytes
> and mbm_local_bytes. Each event corresponds to an MBM configuration that
> specifies the memory transactions being tracked by the event.

Unclear how this is relevant to this change. This is just about the
memory transactions.

> 
> Add definitions for supported memory transactions (e.g., read, write,
> etc.).

I think this changelog needs to connect that the memory transactions
defined here is what MBM events can be configured with.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
...

> ---
>  fs/resctrl/internal.h | 11 +++++++++++
>  fs/resctrl/rdtgroup.c | 14 ++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 4a7130018aa1..84a136194d9a 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -212,6 +212,17 @@ struct rdtgroup {
>  	struct pseudo_lock_region	*plr;
>  };
>  
> +/**
> + * struct mbm_config_value - Memory transaction an MBM event can be configured with.
> + * @name:	Name of memory transaction (read, write ...).
> + * @val:	The bit used to represent the memory transaction within an
> + *		event's configuration.
> + */
> +struct mbm_config_value {
> +	char	name[32];
> +	u32	val;
> +};

"value" in struct name and "val" in member seems redundant. "config"
is also very generic. How about "struct mbm_transaction"? All the
descriptions already reflect this :)

> +
>  /* rdtgroup.flags */
>  #define	RDT_DELETED		1
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 08bcca9bd8b6..5fb6a9939e23 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -75,6 +75,20 @@ static void rdtgroup_destroy_root(void);
>  
>  struct dentry *debugfs_resctrl;
>  
> +/* Number of memory transactions that an MBM event can be configured with. */
> +#define NUM_MBM_EVT_VALUES             7

I think this should be in include/linux/resctrl_types.h to be with the
values it represents. Regarding name, how about "NUM_MBM_TRANSACTIONS"?

> +
> +/* Decoded values for each type of memory transactions */
> +struct mbm_config_value mbm_config_values[NUM_MBM_EVT_VALUES] = {
> +	{"local_reads", READS_TO_LOCAL_MEM},
> +	{"remote_reads", READS_TO_REMOTE_MEM},
> +	{"local_non_temporal_writes", NON_TEMP_WRITE_TO_LOCAL_MEM},
> +	{"remote_non_temporal_writes", NON_TEMP_WRITE_TO_REMOTE_MEM},
> +	{"local_reads_slow_memory", READS_TO_LOCAL_S_MEM},
> +	{"remote_reads_slow_memory", READS_TO_REMOTE_S_MEM},
> +	{"dirty_victim_writes_all", DIRTY_VICTIMS_TO_ALL_MEM},
> +};
> +
>  /*
>   * Memory bandwidth monitoring event to use for the default CTRL_MON group
>   * and each new CTRL_MON group created by the user.  Only relevant when

Reinette
