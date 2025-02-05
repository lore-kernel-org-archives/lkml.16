Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE721D59F;
	Wed,  5 Feb 2025 23:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797458; cv=fail; b=d2CA2vmdxA6zA+mBZnrcu3l87CpbkZAYIblv15bhJcmQOUA3mAPBKpb/gzYvS7RD4CMDPJ27AfB4cQuxF1Dicc/gcjFIOWiFSQZWrzygy8+X/6Qw5r2Fdvf4Y2lch8i5TubdLvYq9AQW9yoxM+xuQLXFE/x18i4WilMQpgdMZAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797458; c=relaxed/simple;
	bh=INFXmhZvQJn4Zup9lgpi0dwpoeLRK/g8HzU5a57v+Cw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U4vLuYxGWoyZzVWa33n6799Yd9+Bz+3ikAMtxfBvXXJxPK+so40fX/eY1u4jH1tpdbOI58eMFvVOFM33VnktiAhbRGAZlBHkmPyzfBNn47kaZkAHAKaDQMmhNFmJLMwMhKYP/NJ+o/WFVb6G15AmhuwOXYo4ABlCMyfac3+b8s4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f80IgomU; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f80IgomU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738797457; x=1770333457;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=INFXmhZvQJn4Zup9lgpi0dwpoeLRK/g8HzU5a57v+Cw=;
  b=f80IgomULxCaObHOkpSvqWKvB827Sqxpo5TKeMOTtKGBgGpFDvbSD+dV
   K9rPaf8keUJtppsRKLMNGd1mlcS/p5UvntO907RW51r6vZZhjKKd7c66A
   Jkib4qYrZXN0fwpaBCmT+o1CX5XQkhuCKjye7/dsKfs9wgtVWCLgEPCkg
   sZ1/l/huPHHZaBDd2bMtZ3NDTKTJrLjh3XcoyTE8m+/WJ7ABBWC9727FD
   DJGI8qVICoqvJesQn5mI5Db6Cq3HOvCMmOkytIz+VxELqmiIbvpqDK4zI
   /x0yGMMaBSrRx9LNinr/Du05xSbfzdHGFD+LGp4uQL2J7qecmGgjPskEt
   g==;
X-CSE-ConnectionGUID: y6ToVUBKQ6KAaAxACokr5g==
X-CSE-MsgGUID: U/VhU+PtT8u4paK69rIwiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64741038"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="64741038"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 15:17:36 -0800
X-CSE-ConnectionGUID: ZtxulEK/RXO6Ncps/I7h+Q==
X-CSE-MsgGUID: wQus0GAkQvu5d7uJhXvL7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="110879984"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 15:17:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 15:17:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 15:17:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 15:17:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dl/LR/IIQ3vPVdK7xXY2FqNASLbNSQc6LNcNXva5JSc37bjug9ueq5q5bxTrSupuBl99TH+SJdHJBGRDKoN640crlsxnOF3NFzVfU6GWShnOB4cinw1CYCAa171GFgFXiXVtjk7g3/+n2xyEdBqowepa/DEmVoO+UaXo0vEMzyoOT/yVu9uNSwECSpleLI11i3aur5K6zKt6wKs3X7sPjeULRZQx4BB+pIYN1q/uHRlo3rOE6LXXB2dLh75USBD6y2brcZUbPSFBzrdLAa+cz3iSk7S7gHyZfG+teOFxcpUe657A7gtkDTNAYuqw9lnik1y8k5zN5ayozfA6eZ9TjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F09ASgp5anBh/RzqbWtcJABpM8be32mIctT2iyAut64=;
 b=ubnNeCkAOW9flT7TEmDDxFWiBi5GX3xUULLLbYlX1funkxRmBRRYZ4FDb1cI0E8pN60xFfHVuU/G0qTOrtpmQysjfj3ScHXlaUwAriMqnfoHBKw+pAOwyhtkXVY6ykKuCMikrZsLnuX/fhOd7528F/ESfv5TZrLuI48yZD7mX3+4UdnOwIMThgZ0sGP9C6ijqSYDelUR+Q8rPCDccCnPvN/4iJTcngrvKvJSfOLGZTPZA+uwodl0uEuxrXJER/vbPFr/XpZhdrIhayYR0/LnVGHQzvHX80EniUjOAYlgqiSwMXYxRyIaEnEPC/0Z27k0MvuqTmfcnzV4SOunzRHb+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CY8PR11MB7779.namprd11.prod.outlook.com (2603:10b6:930:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 23:17:31 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 23:17:31 +0000
Message-ID: <6376ea35-4ce7-4ac1-967b-97f2728228e3@intel.com>
Date: Wed, 5 Feb 2025 15:17:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/23] x86/resctrl: Introduce interface to display
 number of monitoring counters
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <80457612b98078bd7786c73f83775e4de86c699e.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <80457612b98078bd7786c73f83775e4de86c699e.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0059.namprd16.prod.outlook.com
 (2603:10b6:907:1::36) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CY8PR11MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e8d144-9d9a-458a-1111-08dd463b4413
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnJ6dndNR0pITWUveTI5bDhqZTM5LzFZcFFyekY3aDZWSkgrTFhqdkcxUVhF?=
 =?utf-8?B?TjBHdm9RZHcxbWcxWWV4UUY3M2NVUmRIb0VmRUczcHdWenJoM3JkajNtY0NP?=
 =?utf-8?B?V0VsaEhCY1puYVlLeXNaemVHYVRJbjZJbVg2elFsaVdWdisvRTFXRGhnQTdz?=
 =?utf-8?B?NHFhVHE5NmxhRU5CaldKYjMzNTVXc0FnYzd3WlVrRFRlNDBxVHdTR3FtSFBo?=
 =?utf-8?B?cHhFZFd2TjVrU3FMY2VUVTlpQlFNM2IzWkE0bjRSdzNscHlpMHNXeW8xd0wz?=
 =?utf-8?B?ell3aWZ3QU9UUDdCeTZKc010OUFscXhyeWptLzFtd081dGZka20xb0h5eG0w?=
 =?utf-8?B?K1RGTjJ3L1NsWXZnTTRSNkpqMjhPS3BCQVVMb3ZUczIyZkpkL2JIVnVZdDMx?=
 =?utf-8?B?VFp2WTVwczkwZUE1TDIvSnFsc2htR1FnQlNBeXg3K1FXZWFzQ2ZwOHdLV0Ry?=
 =?utf-8?B?WkkxK1lxbktEc1lkUXFuZ1NKekRBdVgySEFMOW1LUlNlUUtWdDhmbjU0WXox?=
 =?utf-8?B?WVVGMUdGTFJNTXRqSHFKU0E3ek0reW4vZzFCM2pWY3RVSVNlU3JoeEhpclN2?=
 =?utf-8?B?V0IwZTgzRlJXSnVXeDBBTjFOeXZxdG9qaTB6ZCt3K0ZOQi9COWdmaVMvV0ZH?=
 =?utf-8?B?aHBmVEp3Y0xjWWpKbDhnQnkvZmlFM0pqQkdRMzZoWTI5M0NnSlBuc0ZqT2Nm?=
 =?utf-8?B?QU8wdUxYa05vK0hjMDJveDJueC9YU3lObWFmQWM2R0pOWlZEZCtWTU9zZmRj?=
 =?utf-8?B?eHJ4MDBjNjdBUTh5b2w4bWo3VWFPWHFIeVdaVjBiVnFBM1BqTTBPaDlRQ2Vu?=
 =?utf-8?B?ZnhKR1o2c21zcm5MU3pib0RKZG1KTDAxNjlLcG01SlhzaW5kWngwMHcxNldh?=
 =?utf-8?B?WWhnNFNjeWxXdWpWRHBPYzVqUWgzVVlkckFycXdhR0hXRWVzbHJMa1p3cVor?=
 =?utf-8?B?cHNKMjFORk10OGtNOUU0dk5QWjZGcUxJUkFqWDZxTTdkcHFwclpJN3AwNzlX?=
 =?utf-8?B?SWw4R3RFKzk2cDgwK0NveUJkajZyWHNrdU1WUHFwWGRKOHlRSG40YWxTanVZ?=
 =?utf-8?B?N1FFU3hRNXRSYkxhZk1sL0pDNUo4K2hLNnkvT0YrYkhaTDZJOTlhVEFZdC81?=
 =?utf-8?B?eS9VeEo2SEVXdWE1N29LdXZWeThwZHlvM080amZwRkRPRTNkOHZxcEZNZ3dO?=
 =?utf-8?B?NC9Ca1lYdDlrK3RhVVZlUGUrem5hZVZLSnZraTlPdE1ZS2JmRktqclhEOEJB?=
 =?utf-8?B?OEk5Y2VsUmg1ZzBXMFdLTUk5RnhwTnluWkFUZXVDVjFuMHVGNVRLbFpYQVE0?=
 =?utf-8?B?eTJiVnNjblpnY2xMeDgvZGQ1R2NRSVo4UmdRVXZTcm5CNFJvU2dMZk8rOHJE?=
 =?utf-8?B?aVdkNm5pUThySWZrUWRPTUpNZWJwMXB5aFNMQlNudjdyOFhPVVdBTWZicTJG?=
 =?utf-8?B?cGJ1QVlneHBVMnkzOGwzS3VibC9rSzJJRGQ2WUk1dk1ieEJuTk5TMXNMcllm?=
 =?utf-8?B?M3pKeUpXeUtLM0EwZVcwU3FOTFhZSHY0U3FPQ0dRTnhQam1hcnhNK3d0WUw4?=
 =?utf-8?B?dEhIbVB0bHk1Uk5EVXdyM1VNcnQ5YTJ2R0s2MDJVUitDRGFrNCtKeEdTc0ZZ?=
 =?utf-8?B?OHZvZUdER2NGUHM4NWhOSUpwR2UyNXJvc25sMFJHbEs4bTFhSnBtM1hvc3BQ?=
 =?utf-8?B?SVAxZk42V3lhaFRuWG5VQlFVbk9PZFpxaW9TUzJKY3l3UGMraklXakhCQlht?=
 =?utf-8?B?ZVZ2VnFBUG9KMXF4NEtEY2NKRDdOa2h6NHNmQ3MxWnd3WHZHMDhyT1JOWGt4?=
 =?utf-8?B?QmdqSEhFY1dEMFg3MVM4cUkwbVFsWE1mWDR3QkJVWHV2SVlhTU92K1FjV1B5?=
 =?utf-8?Q?1znJOmQryQPbz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGZKaFpSZ0lpcHhWN2pOUXRNNFozZGtra0xBQmdqOEFmd1dtT21MZDU5NGpY?=
 =?utf-8?B?UkJOcjdwSmppZ1Ixdkk2QlhJYW5SZ0c5bG5XdTRocmVJZXdIUVhoKytQdlI0?=
 =?utf-8?B?RVNQMGVFc0tIZ0hOT1dSRDdQM2cyNjRiREtQQ1N2STFib0srQTRyb2Vmaysv?=
 =?utf-8?B?LzZ2TXVHMDZNUVJkSUN2VjFUUU9BTWlCQ1pyakxEckN1Zi9BOEV6Wld0Sm9i?=
 =?utf-8?B?MVFWVjZkaUtUQldlTEZQRW0vMENiNzlSaXh6dEc0WE85Vzh5WTY3RFpBSE9a?=
 =?utf-8?B?NE5LOWZISmVycGtFWlVvcTlZbVlRYWpoWDkraXV4REYrQmtJZzlBdEtsN1NI?=
 =?utf-8?B?K0RVZ3EydmZHbG4zZFNTZGJZVDdMMjVpQnZneXVFaU4wbEZQdVNpRmM0KzdJ?=
 =?utf-8?B?S2JaaThEeGZSYmNVTFNxSERHWS9hR2U0bGNFbmFMbmcxT2ZsSGU2bWtNRHRF?=
 =?utf-8?B?Ny91ZTExUEU1eVBVa2dEMlZiK2sxUitTUjB1TTZyR01RVXFyb2JlUEZMR1Vw?=
 =?utf-8?B?YUZwbHRUZEV2L2pYcDlueSs4eXhZQkRLKzhxKzljcHVEa1ZTc2IvMTJRYmhE?=
 =?utf-8?B?TWZjdWFrUlZnN1F0OXhOdVJUbVdFcXQwRjhITGEwd3ZweHozTG9yOGdGbmts?=
 =?utf-8?B?bFBHOGJNNDVoZFY4eUoyd1NKVDdkeFh4eWg5K2xZT1pZSnFxNjRKVnBlaUJG?=
 =?utf-8?B?YUxJbURCcVNSWG5OQXNrSFJYd2xKUi9yUlJFakk2UmxwNDMwVEwwZGdDNlk5?=
 =?utf-8?B?QmRqQ1QvUXBQWHZYTHNWWDZlM3RxeGtLOEdrM1FuYTBxSm16YkU0cWxBdHFD?=
 =?utf-8?B?bnhrb1FqV3hFa0VpRHVqNFB1My9tMU5nTnk2dVdMdkoyTzR3eGx3N1ZOQWRk?=
 =?utf-8?B?OHpERlhQd2FqWDY1M2J1S3JmT3J3Znh1eU1mdERzQ0Z3MUpzalQrVGgzSmIy?=
 =?utf-8?B?dlhsa0x0azhER3Z5ZjNxb1ZXVjdvTlMwZkN1T0poNitGdlppZTBCSEcwWkRJ?=
 =?utf-8?B?cGJYd1NpT093VzBCeWt1aTY5MVMxaFhvUThQWG1xNXhNQ1IveG5HTGgxQ2gr?=
 =?utf-8?B?QTZXYlI0SnVYbWFqMXBCNmFHVW9IVUtGa1Q5eWhrNnRSSlYzOGY2bWdhRWR0?=
 =?utf-8?B?WmQrbzA0aEFBbHB3SWdOM1lUK3VnUUZFaVkrVHg5WERRZkh5b0VFUWlwSnIr?=
 =?utf-8?B?d1hxYTBOL2YyNUxIcmVqd3pWNlJhUmltbDViNkpaM3JSNXRkT3M2M2FVRDd0?=
 =?utf-8?B?WjNvUkdqcHVpdTBnY1YydjFzMkxPSHROZnJadFNkK1ZsOHhscm1CZTIxNUlC?=
 =?utf-8?B?N3BXSnYvS0d1SFo1NlVwNmVuUzh5cjJNMnVrZTYrd2pCVi9obmpMRklZblZ5?=
 =?utf-8?B?VkcxL2hDdjlBK3M1UmpMb0pCU1EraWdnTFFLdVpCSDRJckpJcnF3K0VoRkxC?=
 =?utf-8?B?ZHhEQ3FtRWljM0w2L2ZaRndPK1A1eDFhbHJnVzc3VmpiL1FxTlUyQXB2QURJ?=
 =?utf-8?B?Nlo3TFpLK2J1WFRRMkwyeUdPUUU3K3JuLzFFV2x6RlBvUHNjalBPOXl4dnpV?=
 =?utf-8?B?MFplMFByVUJXbEgwYWxYQmVUNUs1NDJDWkVDeVNUN3VSQ2hya3UyZStRSVEz?=
 =?utf-8?B?a2hlYkdnRy9Xem02OHl3TjNCZVJTT3lnbG1yMDdNMjBVVmFORnh6d0lRNjNX?=
 =?utf-8?B?NVBUK1NPR0RhU3pTSndFRTE4dnYwQ1ZxN1NsV3JPNFh3QXFCbmR1TGd5ODZN?=
 =?utf-8?B?RTh0ZjBpcUV6VjdFdnpReU5wK0pQelp6Tk0xRnFEdVZVM1BVL2VrOVlhVkRp?=
 =?utf-8?B?UmZERk5xNVRKUkUzY0tscDAwMm9TYzg4ODFHRHoxYjROcHhnWkprdVFPcG0w?=
 =?utf-8?B?WUFYSm1EVEd5OUJrZVFYbngwZjdEL0FpNXg4R2hTR1ZuZmxaWi9EMzZTbkR5?=
 =?utf-8?B?cUpoYTVVUXYwL3pGVGZ0WmZ1M0NSQVBoM0FKeWhUcXR6VGVLNFBoeUd0dVhk?=
 =?utf-8?B?dUdNSWVpd1NnRVlDZG5RUldTWWxKOUVSYWV0Y3BUVCtBVmdEdXRrelRQNmVZ?=
 =?utf-8?B?dmFrL2dMblJrWjlEV3duZjc4bXNHOEZkRlFSRmswZjZlUnFHTEJKcUMyMWov?=
 =?utf-8?B?NDIvRlNCMkluZDVIMU5HQUFRZkRYaGFFemNUQmRrK20wMXhUZlJFZGpHaURL?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e8d144-9d9a-458a-1111-08dd463b4413
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 23:17:31.6756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yvog1aQttC+zPsOJ9WrN7/PL+0lxWfjd8C4bAJRJ51TjDq664SNMgtG+8GoqmYvhANla5CU31vrqx3vx5tsIfuK+oQTDVWMhJCETmzsaz8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7779
X-OriginatorOrg: intel.com

Hi Babu,

On 1/22/25 12:20 PM, Babu Moger wrote:
> The mbm_cntr_assign mode provides an option to the user to assign a
> counter to an RMID, event pair and monitor the bandwidth as long as
> the counter is assigned. Number of assignments depend on number of
> monitoring counters available.
> 
> Provide the interface to display the number of monitoring counters
> supported. The resctrl file 'num_mbm_cntrs' is visible to user space
> when the system supports mbm_cntr_assign mode.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index b5defc5bce0e..31ff764deeeb 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -283,6 +283,22 @@ with the following files:
>  	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
>  	there is no counter associated with that event.
>  
> +"num_mbm_cntrs":
> +	The number of monitoring counters available for assignment when the
> +	system supports mbm_cntr_assign mode.
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> +	  32
> +
> +	The resctrl file system supports tracking up to two memory bandwidth
> +	events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
> +	Up to two counters can be assigned per monitoring group, one for each
> +	memory bandwidth event. More monitoring groups can be tracked by
> +	assigning one counter per monitoring group. However, doing so limits
> +	memory bandwidth tracking to a single memory bandwidth event per
> +	monitoring group.
> +

This text needs an update to reflect the switch to per-domain counter assignment.

Reinette
