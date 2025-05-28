Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5960F19B3CB;
	Wed, 28 May 2025 23:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476140; cv=fail; b=A3DsOKoakmUtUPJELGqCVMww1Rbze0x6l+2VX38zmilpCc8T5uy21Uma4Goek/iV4jjJASnqm7R7qurMT8BVmNVXNRD+G5R4+YWi3AaT7r+s386Fvw9Bauje6CH9kIlP+5EPjNTkl/ruK33fcDCgC7DVaUmRNcjVIhd2Aiz7ZA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476140; c=relaxed/simple;
	bh=fdR7yyLYdAhRlGY3EDQgyANg4cV4HgLZIJ7ySVZM4zU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tKN5UfoLPJHAFQassfMu2fV0rUvYX664aH9fAvLw6OPJMl0DbD9McApLbyTOks613VFLXTUqBIpwngKb4c+RE88T47NFRWdeo5eLDzKGs9Kd4KS+b2fxqqSbDXqHjGA8clfnDTXuXP47lwSskcrgSq7fGwLz2jGFPB+cCqo+UBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s60VQAdN; arc=fail smtp.client-ip=40.107.93.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s60VQAdN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eP959BNXHkL2tBBdZu3mJHTeNnfM9th7L7t2TYux3zxkDLcQulQ1VzygjU1OcJjunJGPh7lm16RVE37ntBVaYlpTTfQ825ZrvNB1y9iSyxYy9dLquXS/XPwfOIxVbt3e39k76P0T9o1hlMquwNhX/VqkNFTXesQfhT84y2Lc43XXRSAwhlVOeSMxI/GTzpjUBSqNSa7mf/ouPf9JLpsnS5fu6PSyDDznuvneGzOHLSuPQ1zoRhmPk5ZIwWClQiAxph7r5yup0KarqlqWgYUzdaQF07YXTsLVPbkBcLWWhnzaiSk+e3FP7h5ptmUBZBfPwONib4y2R89RbKoZ/MoNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfPV4O1u03nJWVV6sWl0H2/AG0wf+Mhas/u3fuUxZpY=;
 b=fGXE1lwhGdiM5Mee2fWYpqEkpGuhH5uGwOa9v1v89qLPr4TnvP1hmB9/8CXOHAH+2fwmSysFxdNkl1/dBI9WKuc1tLrkpgjVTKvxeSSzaCeCTlWWRZlgvOMN6YapWD97A9l2Ncjwtru/U2hT9d4JrdNOugrzpNlGSShNAhExja6FInJC9FbVTwq+ATnngMIO8jqrTu1zM8j6/dCbfQ66kkkux9CsoDRSJ7kxKdukfOJdTgvn9UevGq1I1SLr60Ol5Z7aZEBEK7LGEnKOvL3alKlH3bXP4Vo6rKwhYHbDc/wqXHWQr7cUZgt7gstYQXS76oIkmbveG++D2tHT2yznWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfPV4O1u03nJWVV6sWl0H2/AG0wf+Mhas/u3fuUxZpY=;
 b=s60VQAdNAlz0zu1RWhyn6sqzAc8Ckbt6ECwIFmBY0URlvlaUTCx7hBzceCZ/+Cmp5OzV/vSU9r0uHCxXSJizxSXARWBuuHH5lhv5Y7FZbhuMP6mIXMFXV2VKtCD1gVnayHJGwCaBFkLQRSWNxiObvu+UgOYclT2IglyVF/6/tbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH0PR12MB8174.namprd12.prod.outlook.com (2603:10b6:510:298::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 23:48:55 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 23:48:55 +0000
Message-ID: <f2a8f8f3-9111-4dce-aee1-52f299f126d2@amd.com>
Date: Wed, 28 May 2025 18:48:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: RE: RE: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: "Luck, Tony" <tony.luck@intel.com>, Peter Newman <peternewman@google.com>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>, "x86@kernel.org"
 <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "ardb@kernel.org" <ardb@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
 "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
 "alexandre.chartre@oracle.com" <alexandre.chartre@oracle.com>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "perry.yuan@amd.com" <perry.yuan@amd.com>,
 "seanjc@google.com" <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>,
 "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
 "Li, Xin3" <xin3.li@intel.com>, "ebiggers@google.com" <ebiggers@google.com>,
 "xin@zytor.com" <xin@zytor.com>, "Mehta, Sohil" <sohil.mehta@intel.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>,
 "Eranian, Stephane" <eranian@google.com>,
 "Xiaojian.Du@amd.com" <Xiaojian.Du@amd.com>,
 "gautham.shenoy@amd.com" <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
 <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
 <SJ1PR11MB6083C5179F98E3873CA34C35FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aDDjs4PZxeouNJr0@agluck-desk3>
 <CALPaoCj7FBv_vfDp+4tgqo4p8T7Eov_Ys+CQRoAX6u43a4OTDQ@mail.gmail.com>
 <SJ1PR11MB60839776B024017D65EF4E65FC64A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <396dbfa9-37a5-495a-adaf-7ec1fe6471de@amd.com>
 <SJ1PR11MB6083A51C7607D419646DCE3BFC67A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <SJ1PR11MB6083D8A7DD982A6430C5BCA8FC67A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <SJ1PR11MB6083D8A7DD982A6430C5BCA8FC67A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::26) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH0PR12MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: edc47b72-5f82-4841-4eae-08dd9e423532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTFGN21GaCt6UERWVjIzenBaMzh0cTBwZTlJUXgrb0tkK1R6VzhlSTdFSDk2?=
 =?utf-8?B?aGVUSDk1ZE5UK1JsMkp2akZkZU1BWkZscnNlL252bjlhUE1Wc3gwM1Jsc0tY?=
 =?utf-8?B?UTh4N1R3WkhWYUhpMit5dEJMUExTQ0pjQlZ0dHpEdFFlOHREa1NoY3RRNk5N?=
 =?utf-8?B?Q3IxZEwxMHlXTjJhOWRWQkVya2NXR2Q1NmNuL0lkS2VPLzUwNGVRNi9nMjBL?=
 =?utf-8?B?RkpoclE3YlZOUlNlTXV2TEthbmpsdHpxYjFvTHJEdDlTMVBYYnRJeXpxck5J?=
 =?utf-8?B?L0xkMERYTi9JWUhCVHFlRlN4YURLQTZXaGNhMUpXUE9rcTVpM21uUjFJd3N5?=
 =?utf-8?B?OGJJNWxpY1V3MzE1NVBma0lXUTBwbmNROUNvQjhNd0pBbzg4UkVtQWkwUmRq?=
 =?utf-8?B?L0JzYzdhVG1vQVM4MXBWME5MRGl3N2N2L3AyTEIwVEdYMVVMbmZlZ3RpNS82?=
 =?utf-8?B?Y3dacmNPbW9yT2E5Qzk3RVVpSWhiUWZZWjZSTXlybGIvT2dISktjWGN2a21E?=
 =?utf-8?B?RDJDK080N1RnQkpid3VnYkI3dGVncnVrMkZYRnAyT2FhMU5pbFd3dENzenMv?=
 =?utf-8?B?NFFscWsrcldzam9sRnNXZEFuYlFpc3JFK01VVUZzbFpIc1llaEF2M1MyL0xp?=
 =?utf-8?B?R3BpKzUvR1FscUFnMDVyQ3JqY0Q3MkpaRENiMjNtZ055bm5qSCtTZ3VER2tz?=
 =?utf-8?B?ZXl4ZlJDdi9mWmNuejg2SUdXRHhEQnpZOU9yUEQ4aDArcUlacGRTWG9kc0Nh?=
 =?utf-8?B?VkpKRlpHUTJBU2dzK0lpakprVzRPWVpIQ1U1K0lidkpEcFhkd3RjUDNUN2pW?=
 =?utf-8?B?dWRTZkhkeTAxWEpqR2hCYUh6MC80djRGTTFpMkJpWWRvWGFTZlJkNDA5QjF5?=
 =?utf-8?B?djYvK3dnYUppU1c3ejdaUjJwYW0zY0hGSzY5ekhIamNVQkdic1UwQU5PV2RD?=
 =?utf-8?B?U3RueXdBMk4wVzRGZGNWMWp3ekFqSWVKQ3FIQkI3V0RTMUJ1cGNOcHJRWEF6?=
 =?utf-8?B?MGVtRGVFZmlVWWFzU0VsODZmRjVtVkNWbFR5YlNiTjZmNVh6S2VydXhHMXdm?=
 =?utf-8?B?eXRjcVVLWHp2S1EvYVN1M1BCL1J6N2hUUjA1OHRSc3plUVFNWmlIdUhOMEhZ?=
 =?utf-8?B?a1FaeE9QaEJLdExVYTB0Z28rOUN3NDhsK3Q1Y3YxeXI0NENJYjYrZThoY0Rn?=
 =?utf-8?B?bmpORzZBQ3UvQWl1QzUvcDVMR01pOFovRkpSVGxyQTgyNDNUcW94eXptS1Jn?=
 =?utf-8?B?elF5NjRZaytHTGgxbDIyWnZpdWd6Y0h6NWxSN3NLMEdhc0dySjB6MHNnWXJH?=
 =?utf-8?B?aVErM1FaTzVTT3p6WlgrNGNNbDRTTnlYckxhc1Z1eVpBbTJBOFNrTEhHYi9u?=
 =?utf-8?B?N2VQNUU1eWZQSGc5WVBqcUo0OWQ3djUxQnJ0OGFQSENZUmtRZzhuR3AzeDhx?=
 =?utf-8?B?dko3NkFJUnBXdmNpdjlGNXg1Nm5oNjN6eEZ6R0FUcXNYSzFjRmRTajNDaUxK?=
 =?utf-8?B?dkdIU2FOSm8zbEJ3a2JMYVdEK2ZvdWhaYUNhcGcvQVlBOU1KaHVYaUhjZDJ3?=
 =?utf-8?B?OHFxWFNSWi9yWnRIcTl5MWRTU2FrR0txVWJyT3hFeXZNbVRnRHdnMjF0S1Zq?=
 =?utf-8?B?M2xkV0wwSVVGUXBMNndaVVZmSXh6bThWb3pMb0FzMzJwT1N1WkRIQzdyOVkv?=
 =?utf-8?B?L0dCTExOeGZEb3o2eFF2ZGtyM3ZRcDhhcXVVbEhrc01mS2dUTTB6bm9Wai9i?=
 =?utf-8?B?ZTJUUnYwc3BmV3NOeStVb1BxdG01b2M4ZWZvT1IyTEYvNU8wMEJaNlpJWUNz?=
 =?utf-8?B?S3dLWHJ5a0ttTDVpZTJtTlhhVUFxUDlKalNyUVJFS1hqQmp6ZU5MRVhBMjlG?=
 =?utf-8?B?VWZXaUg0cENBcTIyTDUzek80VEx6cmVnK01CV2RWTVFLcHRhVmp4ZTVUalo5?=
 =?utf-8?Q?BiZ0wWpBHoU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVJEdWtKTnREODBOZlR0d24zMlJFMTBpNGZ5UlBUd0dRYUdYdCswUHFDNW1D?=
 =?utf-8?B?SkFTZm5tcnhHL3ZOU25uWnlmczdtemYvd3dYbUV0ZnQrSVdQeUU4VFppTXJW?=
 =?utf-8?B?MTZra2NRd256ZUJ3RncwMXJTVFNLNzdtTlNSZ083bFJoeXV5TTZhbUFRTXNs?=
 =?utf-8?B?TVhhSXl4WFA2SmRxby9tbEZ3aDFEQWhZelVuamkyOExpQkZGdFVTUnVNdXZW?=
 =?utf-8?B?eFlTQnR2Q2pVSCt1NlFVcGJGT1g3Z3VPOXNiSHQzdHhoQnRpYjExQzFHc1Vn?=
 =?utf-8?B?cE1MQU1LT2F1T1dJVWk2Sk9sbWVSSUF3YzNETktsQVRUK25GWEY0MjgxOXdq?=
 =?utf-8?B?bENQMkw0OEZVcW04Q2pIeXIxYzRFRWNnNmhxYXA3M3R1Y0hnSWZtQ0h0RVZD?=
 =?utf-8?B?UVhCVENrbWFRQWxFWUM3TFVnZVdQeXhSVFZNaFdBS0xqclNFSExrSjN2aUFj?=
 =?utf-8?B?TEhsUEFVM3JXWU9ua2w2UWdtVDVHZjZ5RHBCYVpaV2prZmt5WlcvMm5HdzBJ?=
 =?utf-8?B?RGtyQTY1Vm94U2I1SGpWdUo1dVhMdjJkWGNXbE9KNUtBRnozWEg5OHBHcTR1?=
 =?utf-8?B?WjNaZ3l0THQyWDdlaXhESmJSRXJ2NkUrd3d0NTdKTTkxaXRJNWhUeFBBOFdz?=
 =?utf-8?B?SFphNVU1c1YrRk1INTlnZVg5V2NMUGlKU3BoNUp4MUp5dFRoelBvcHczdFp0?=
 =?utf-8?B?OXc4RG9PbTdXU01BU2RxYVNXWHNZLzI2OUgxVkZST2drcDZtWERRMllUSWJy?=
 =?utf-8?B?T0Y5Z29SeVhwSTlrcFJnZ0trOVA1dno4QkxxSk10UEg1dGZvanBxdXE5Ky9D?=
 =?utf-8?B?N3pSbEFyamM0R2R5NGhlMlNRMXU5ci9QZWhKMkJwYndOMktvb0hscXQ4d01I?=
 =?utf-8?B?b3paMGR5SjZnZkwwSU8xN1FBYTZQQWpmb1ArZ2tnNjFncmFXUmJyUis3SFN1?=
 =?utf-8?B?ZDJtbld5TWF3amRGdmFTVjBvQlk1VXkrSTRNbno3Q2YxMEUrWDdqUHVkM3Y3?=
 =?utf-8?B?Z3Fhc2JMS0U1bGozTldTQVhZOHU4Y1dXSDBsUE1ONzBSZDlEZTNtOFlTN2to?=
 =?utf-8?B?VFpxbEpNbGJLRms3SFRDT0FlUHdTanVQZ2NGTlROcFMvd25YMFhSRkQrK3Rl?=
 =?utf-8?B?MVo5eVpDYzdSWEJQbnA0YUxTNVBUS0JmbXo2UmNsbkxGNFJJWmMvRFRMSHJs?=
 =?utf-8?B?N2tTOUxDd3dRYWQ5R0oyRkdIZE5rb0wzNTdCSFhUTzRMT0tWVmhCMUlHUito?=
 =?utf-8?B?M0Y5RG9wQnNsTGhENVZsUWVDdmJpWFZUTEFNdU1lNERnQVNpT3FwajlOa0RU?=
 =?utf-8?B?ZUNIRlRCNWhwY0l1T2RNclBYR3JaQ2ppWDNaQnk1SENLN1ZXcnQvTy9GVDFW?=
 =?utf-8?B?YnhXWnRhZmNXNmVBRjFZTDNKQWdadXdSdU1RWnEraDdnRFVXM0ZUejgrUDY3?=
 =?utf-8?B?MXVwNlVGaXF6anlRdEJkVTlzdDdLaHdqWWQ5Y1RJN1B1R1FUekw4SzFKaWIx?=
 =?utf-8?B?ZGQ5ZjluVnF4aytVc3l3Z2pQOFFPd2dhTWp3b0FuZHBlL3N5clkrRnRsdWZk?=
 =?utf-8?B?YU1vOStQWkRCeFdiTjdsdjdCWm45WExVWTZmbVZYQjViblpOSXNPeGx4U0RD?=
 =?utf-8?B?Q1NEWGNLVGYremlXeW82UW0xeUZkSGo1MXRPT1RyVjM0cjlXTHE3b204ZmY4?=
 =?utf-8?B?WDZqbEFaSnd3SVlNQXRpeEJHM0MyNVdkdTM1WC85eXFLdFJSUy9mMCtuZktw?=
 =?utf-8?B?ZFNZQkRCcTdsQklLaDRXQ3FDV0xDNEQ3RUtVZnQvTTBqeE5IU3ZudWF2SFVH?=
 =?utf-8?B?bG1VYmd4WVhYamdoaVl6aFA5cjllRG15VUllY25UeEc0T1hLS0xsZmo0eHhn?=
 =?utf-8?B?b1hVS1dMQlhhK3hER1o2UW1aclQ5NzZmbmJCY0Qyd2MvT2YvaUlSYXVmOHlH?=
 =?utf-8?B?TUVxVHVlYnFCVzJYaHVyNlZLNmtYQUcrOHJDam0zVXk4VFk0YzhGMUVJVlFT?=
 =?utf-8?B?aStaYW5JVGpxRmpDbVgzM01iSHNuVEZCUGRmUnRwZ1RvSTYzb2Njb04zYWxN?=
 =?utf-8?B?VFpPOVA5ZDFCSFMzbXlCNUpmSjZvdFNlTWZaaEdXL0RFZm51UUFydTlJMTFD?=
 =?utf-8?Q?w4cc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc47b72-5f82-4841-4eae-08dd9e423532
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 23:48:55.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AislWXTh8pBtKEoXb6Jsz9SW61acMgWtwR24aeuXmMI0UlnlLF6it/sTXjOjO8ia
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8174

Hi Tony,

On 5/28/2025 5:13 PM, Luck, Tony wrote:
>> I'll backport into my patches and then rebase the whole branch.  Hopefully should not take long.
> 
> Done and force pushed to same branch at kernel .org.
> 
> Both Peter's changes went into my 4th patch, and your patches didn't touch those functions
> so git did all the real work.
> 

I will base my v14 on top of this. Thanks
Babu
