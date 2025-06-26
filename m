Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530A418BBAE;
	Thu, 26 Jun 2025 20:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750969485; cv=fail; b=tiEQjIBV8xba7SkRpjtnJUwrQLw4e8QO4l7hUzN78A9Zhe1Faxo8meDyehfmrly+BeYZGRhEJCPZRUbhxbEzbntvQfoLC/HjnFPLIfyxB/lPWI9jKFpsAC47UEjCsaZ7udJNqMRZiXomWtZlDcI/f2vsv3urBG/BY6X6RHwE8Nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750969485; c=relaxed/simple;
	bh=SdU1c9PASffDXelBbU6tdT5XbrkdCsyf86g0OMpJYrc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nXCUVwajJ3nLyGGOJPnOz7KPJpvZa9Nb12DZI89iadIdVa1SCE+v/0APfbiFosvIomfoYZnpMkC7fH6Q266E9X3SKtsxwlw1EqUXqW8PSGeP90FSngcpfTu6Iqpled5ZSTeEWObjrXreEAQMBrjMfURHcYebed5ZQZTOYGY178g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=By1fKuWE; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="By1fKuWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750969483; x=1782505483;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SdU1c9PASffDXelBbU6tdT5XbrkdCsyf86g0OMpJYrc=;
  b=By1fKuWE4f0dYVQVjDmrY5iLdcYOVtzVdziuo6u4NNiVvfurNkdWZmrj
   0SrIntZuV0BeQaIwUDZm2HcOAiWOyo4MWpGidT4HS5r0woLMvKsEfH1nB
   b0P1sIK5s0pM7Cc1Ct0sLtsbR6mBlN2imoZ68mpHrw3b3lsLMVrpPxVwI
   adxPsIe26vgZshqmS8XYDlV9bs41GJKJUIeCsfiZ3X5zI0VRgtCClLc1E
   /no4BwKHGKsCDNmpIHz53JlFaxAo7Ggas0nn2tjKsJlI1IvzX0xOSxWQ6
   4yp8xULvcXaoXDSg1XQYwRqiyga3sRrg9m+3CYqfdTclnBziE1fAVlhzK
   Q==;
X-CSE-ConnectionGUID: yOaE7d8aQ1+oUfzy/fixHA==
X-CSE-MsgGUID: bQk2RzO/SWGo/KilUx0fkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53357820"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53357820"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 13:24:42 -0700
X-CSE-ConnectionGUID: u5WKcAY9QVe1V51gXAdqiQ==
X-CSE-MsgGUID: UdspiZJpTCml1jNw4C9l+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="183647612"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 13:24:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 13:24:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 13:24:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 13:24:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gllMbdByF0SvFeKc/hBLGk5oC7WnzYZkN24OXPKVxR4kLMNusfvN0PKOxlG3sMxTUXrLphB1YVe4MTgoyPgVrk4e0AzbLyc1gABGpWijC5B9OWa6IjXJ5rpZ04B8H0AQHuudRnYUBjcpZ1/9mHU+FqO33GZHZkJeOUipoVc1UmE3gg+CuV8H3zGJks99aCUIqAimdQ3wX45TVNaubzk8FxsQ04I7SVltyTHtgOatZzrbkiZd6phF6otWzKlpnkzYKjZRRBsYrrIFoyDVlJ0RmCFMWKpufoQnPaNTPme4oTwc6yytSsv9Hd0hgxBWHeEt/0WfIvbF++WU7F5Cikh5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rc4lw2LbWXPhkpsLT/Kxvjy6TEd1KNScETC0NXQdC/I=;
 b=cKaOS3qql95LvhEsWPBF1Hie0xxclE6SX18V52bWH94sEbgiuRieG12D6lJvpx6+mewctwBufr/sOc0bz3FrmtJ4TnfaoXzGwvISc44Aky5Wr4XaxQO06TQQI0gUv8AIr/GiH0w+BVysqhYzOwHGIYJotfN5R0ttDI0OoUnEEqtPwLWknjmIFDfI5J0rhkIqMGtEdfG82jtlwDCUDMh4lHhSUpP26f0DmQJ0wlW9udnF0nBX7CB+O3pztviIHp3fm6eJdo1DkA/EG9NjMIKhhdDrLhoCWAzm5QVumoiMpxANo2mKVMdTDI+6FIqH1ZLXoJnyQ2UOe1Cp3Djlwu9sFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by SN7PR11MB6725.namprd11.prod.outlook.com (2603:10b6:806:267::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 20:24:36 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 20:24:36 +0000
Message-ID: <38e383d3-b65b-4d61-a19a-786f290ac1fb@intel.com>
Date: Thu, 26 Jun 2025 13:24:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 17/32] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
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
 <72b62da44d72938a33b58fe3e853da2e41dfd67f.1749848715.git.babu.moger@amd.com>
 <41eebfa8-34d1-4ad1-89a7-62dc372ab051@intel.com>
 <fb205a5b-0689-4d53-a272-d196d337a9e5@amd.com>
 <d12ea8e3-a7f0-4962-808c-cfed0bd72674@intel.com>
 <028b4f02-48c8-4608-b2d3-73509a989178@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <028b4f02-48c8-4608-b2d3-73509a989178@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:303:dd::10) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|SN7PR11MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: c85b4db1-7be7-437a-4f32-08ddb4ef77fa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZldCeXBKbXlvVkU0M09RbnhkRVdzKzBTdmc0T3dTcncxNGpOMDcxWG1DV09G?=
 =?utf-8?B?MXhLVVphampZKytBRGJYd3ZuNGF4ZXdsMFQwUk9WWGcvbVZ5c1JYMVNDVERS?=
 =?utf-8?B?aDBEQkNBa3phV1RrL1FjVUEwQ2J1cXdkVzQvVXRBbzJqNmpwbTZ0VDBMUGdE?=
 =?utf-8?B?M2RDbXFIK2lmNnhkMkl0L0dCd0QvaGgzWTlZQXFxUlVuWCtvdHpSQ1Rzdkxr?=
 =?utf-8?B?Y1ZOQUFGOWJqMVlrdzI2WC9lMjZGRFQyUytaanRzV29QV3VJS0NXK0g0K3FT?=
 =?utf-8?B?Skd1d0Z2N21EaXJHZ2dzVW96RGZJUUpYbGt3ZDUwTlU1c2ZEc0J3UkY2dHps?=
 =?utf-8?B?MmRjQm9DRks1VERFcUJNenJMRFdoaDlaaHByUVFieHpVeWxrajN1OFlTZFA0?=
 =?utf-8?B?bkxEWnRFYlNVKy9RV1BBeHF4VDIvcVgvNFBGVmRjeDVFVFhGR2NjY3g5dG54?=
 =?utf-8?B?M0RtQk1wL3BvV2k5UUJVRy9QTFJmYlN2VmYxbGd1RjRuNXkrM1Q1YUlKMEUr?=
 =?utf-8?B?SmdEOUw1amplRGw4RlI2dktNTXBSTnoya3dYa3NWNHNJem9OOXQwTnhZNFFB?=
 =?utf-8?B?cHZoK2FVKzVvTTdHOU9IQkd4TXJ3R01QczhDUFN1Sno5VFdNaTZWeFpnWktr?=
 =?utf-8?B?KzcyNlp4ZVF6REZESGlvMHFNSUtOUVp4RmlFZklnWk45MUJscVY2NEFRNXZ1?=
 =?utf-8?B?NTlGVGljbkw0UU8wVXpDVHhoOFYreWhZS09LWnJXT2VJSFdCQUE2YUcxM0M2?=
 =?utf-8?B?clp6Q3JXNGxLNUhoQzk5VkwyZVdpM3lWWG1NUWFDelVYWHdQWGE2b2VZQncr?=
 =?utf-8?B?cEg0cjhFRGtrUDA3a3V4NitwUjZuaUxIaVJhcUxPM0V1NUIyNzB2MXFiN2tN?=
 =?utf-8?B?eGF0QmRSVTI3SDFCK3J2MUJFZjVybW1aMkQ3M01tTlRZTFNyYzM4ZHlkQmV1?=
 =?utf-8?B?aHQ3eGRaaUszVkVNSnRKaTdsZkd1QW9sZ0lrV3pReUFma2NhT2IvVlpIZGxU?=
 =?utf-8?B?RGV1bS9idkw0NHhaWDVRSE45bytVS01aaTRXd3N2UEQwa1BRelFMeEZtNXlt?=
 =?utf-8?B?bFE4NGZvOGc5YkNxc2ZhUWlERFdVMTB3M205Q1p3dEJNN3haZUNHdURROWJS?=
 =?utf-8?B?R1NRcmtOSEZWeGFXKzZkcTVrL1lhYkJseGxpZDBCbmJSckJzNlJGY2lZS1lh?=
 =?utf-8?B?TmdnbnUrcDRPTFVLU3pudDd3aU5vYjFyRDc0bmcyaFFXWVRBd3dRQVRVc0hv?=
 =?utf-8?B?dW9xUks1dWVJT0NhL2xmdm14YkZoc1dTTnJyeHIyNEpBZjg0RmZRd2hSMmQv?=
 =?utf-8?B?UlNHbllReW1rdWE0Z0tSRVBaNjNOWDJuU241M2Iyei9Tc29wT3R6MGd3dDlw?=
 =?utf-8?B?Z2d0aXNDaWRWT2laSUNEaVAvelFuazBHYTlNc0NybGZFVU50NWNkOU0xckZq?=
 =?utf-8?B?b3kzU1A2RE9jcHBaZUZXYkx4YmxObW9Ncy9jbm5BRWZRTEh6MndxL2NrenVS?=
 =?utf-8?B?NXhQbnlidlBuZERTdDhMbHIwM1RvUU9GRGduZkdqNStLa2MvOFZxZHdwL3BT?=
 =?utf-8?B?b0VqZ2IzbW9JazR3bTVaOVkrUkkzeDB4ZlUwQUNXWFE1MVdicmYvTmNLMUI2?=
 =?utf-8?B?Z2F5QkhiR2ZUMjZ2V0pJWUNjRzU1aHhOc1RZZWlyWnZzOHltM1A5V0NXNUFX?=
 =?utf-8?B?SFc5R0Z4bTZzamFPTk44NkxEMTZnRFZOMDU2NmVQL25Nak1UV3J2cmxZdzlV?=
 =?utf-8?B?b0VwajdLWHprZjBOM1FqdTM5dXQ5R2c1RWUyWTNRbXl5b3poZmlZaWZSZlZ1?=
 =?utf-8?B?dlpSK1NodGl5UnZZeGJGRGMxNHBPaWM5c1drVTZocnlxaStxaGdJdUw2Q1RX?=
 =?utf-8?B?UnlNSkRSK250dEhwSncxVVoxSDE1eGI5ZVFjei9Dc25RMEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlNnMU5kNHlWMzljVWttQU02ZllGa2hnNTFHRFdrb3ZiNTRsczg0aVUrZnlt?=
 =?utf-8?B?RkdDN2R3S3Q3bS9FMkphWjNCdVJkb2hGTk4vQ0ZYenVDR3U3Z3hFM2RGVDJj?=
 =?utf-8?B?djhSMllEVGpULzM0b0hBUnZsWFlSSHhqRVlnUzRyL0VuK2RodlJMeUcyL2JB?=
 =?utf-8?B?cVYxbDR5NzR4RzJUWEtQNHNPVnZvRU9DODkxTEZhQ0ZqaTNJTWtSRGZsME5D?=
 =?utf-8?B?b2c3dTdTVG9LWmFkRzIzbzlVTDRiQjRTbGI5OElzZWt5SE1wSDI4Wis1RjJp?=
 =?utf-8?B?OTF0U3ZhTHRUWXBrLzhiYkJ2bmNmMXVaYjZoWVlvMzJUYzVsUUlzdnNkdS95?=
 =?utf-8?B?bExTSkRsK2dCM3JpUkRORUpTaWlXWE5NaFVONG9xdmViZ1Y0ZlltSEMvd1Ir?=
 =?utf-8?B?RGl0czBLUHBqRmlYNkV1SmFtZXIyMjRuMkhZZjc1WDcwcHpqTFFXWk9RUGZQ?=
 =?utf-8?B?RFgyR291ejJMcHMyZWhtVVo0WFhqRGY5UHZNQ1RHcWZSaWRySDhTU2JCSzc4?=
 =?utf-8?B?ZXAxUHRScTN1ZCttbHc0VHNVQmJZZG1PRXpsZ1ZaNXAyVHFQMGRVSlFzTjN3?=
 =?utf-8?B?WS83UW0vZzMzK25lM0JhOUgrdHdUSWpoZ3Z1aWhoRFE1eC9rb0pDSmY5OFRq?=
 =?utf-8?B?bS9ROWxkSnRYM09yUlhzZktNQ2NLeVNwTlVYd3lFZkNTc1dRMmNRNkIrbTJn?=
 =?utf-8?B?MnYrSDMvU3lNM3hGdEdkWWc2Y2ZwTGduZ0NaYnZWVit4ZFM4bDlBd1BwMks5?=
 =?utf-8?B?K0ZFOG5odVN6LzFwamJFanRLUklZaHZveFdXejdwcWFjWVQ0aktQb1Z6ZTR0?=
 =?utf-8?B?WXhzbHc3RlBBTnBBRkROZnBnbFBjNXlWZDhBbWJDUzJSWDhFeXZxc2tRTkdy?=
 =?utf-8?B?OE44UFl4K0hCUHJxck9lbEZ4UFlCOWpNRDlNRGYyT0JLTW91L09tYzNXUEIw?=
 =?utf-8?B?bFlYOTQ4S0JiSlU0bkFQaVZYVkgvai9nMXdyaDVDT1dnZGZ6ZlNxNWRtYmlu?=
 =?utf-8?B?b1Q4aWxUei9lL2crV3pvWXM4aXhqSnhhdjFNNUtKZEtTV2NiUDA0TkNlRGNO?=
 =?utf-8?B?a295S29EVWNKblFiTmdhVmlMb3Z2VTBlWmVyWEp3T3ExY2xwbWNZYWUraXMw?=
 =?utf-8?B?MmVreEVLWFNvcWFYdkVORm1NMjlvWjkvc2xtZ1RMRzl1Q0VmenQ0T1dtUEMv?=
 =?utf-8?B?NTI3QW5YdWJTbG44bXh6S05MUVY2Q1lodUsxemtNR0VwUTBhYklJT0tjQ3ZR?=
 =?utf-8?B?ckxnTHM0cjB6YlAxRVBoSzc5MnNJMXBvR3g1dXNoTnA4bHE3dnJvN09FWGZq?=
 =?utf-8?B?VkRycEd6MWd6aUdndWM0NWlBV044ZXVzcmNQSlhmT0JaSjJmV05HVThtb21G?=
 =?utf-8?B?eTdjb3orK0IzWmtWVmxzeGJKT29WS21CVm8zUXJ2aUYvamp0Q0JDOEVpVDhE?=
 =?utf-8?B?YjQvZzB6TG16MGdWaFc3L29BUmlMNXJtTmUrMnl1TWtSZUJOSCs1NDJYN1Ft?=
 =?utf-8?B?d2dYbFdhZkxPOUdOQ3l0VEQzRyswdW5mVDJwVWZTUGdZWVJvYk0vM0Y5YXVn?=
 =?utf-8?B?Wnp6UFRyT3Nvb3BsR3hqbWFiVVRhSGc4SFUyVEJpdFFWYU9ESFFrdG01TGlz?=
 =?utf-8?B?WDRpdm9ZNlhJbm9YeFc0SlJ4K0Z0SGoyY0hvNkRkaUJ6aTROdGFnb1JISEhJ?=
 =?utf-8?B?a0l1Y1Bkc3Y0TEN4YnFGZVpOLzJKOW1zZG5JOGlXR1drTy83UDFMODBxMDJE?=
 =?utf-8?B?R3Eva0xNZTZlOWkrOWdHRy9TUjVCTVhYNjA2NERsaDM1NUYxMHVOdFc1cjdO?=
 =?utf-8?B?UWNSNHk4UEluQ2RhMlZQUU9PMy9YZE5oWEU5RUg4OGZlcTZZTWg4dENKejBD?=
 =?utf-8?B?amt1ZGF4SlVVMjE0SUk4ODByRktuUzBQeFZYVlAza2ZPZ2JBUGV2amZheUhY?=
 =?utf-8?B?SGs4OHRTUGJja0dGVlhrM2ozamFNanE4cWtWb3JpT0NpQWpKUHJIYmw4RlNX?=
 =?utf-8?B?YU9KVGF5ajc5eHU2ZWJVWWc3Z3FjSTY3d3crQnM0Vk9URy9BVnY4U1pjVmw2?=
 =?utf-8?B?Ym5FSVV4N3BreFVoQ2hFdThvM2M2ZEtwSlVNN293RTJpOGlMdGRtdGZ0c0dm?=
 =?utf-8?B?RVliMG1GNGVNY24xclA5aXYrZDAvQmZrQklBaFJXSWJnalNnbjEwVWozbGRr?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c85b4db1-7be7-437a-4f32-08ddb4ef77fa
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 20:24:36.2026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4KJUzZbYDhSA+cqO8HgqkUSUxhbR+0c18Ij7K36rCcgC3o3J/iRNS8E7psu1XJY2nBs6HltSqdyWhE8PuDExNjJ6OLdtFf304XaIio9PQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6725
X-OriginatorOrg: intel.com

Hi Babu,

On 6/26/25 11:35 AM, Moger, Babu wrote:
> On 6/26/25 13:02, Reinette Chatre wrote:
>> On 6/26/25 10:41 AM, Moger, Babu wrote:
>>> On 6/24/25 22:03, Reinette Chatre wrote:
>>>> On 6/13/25 2:05 PM, Babu Moger wrote:
>>
>> ..
>>
>>>>> ---
>>>>>  arch/x86/kernel/cpu/resctrl/monitor.c | 38 +++++++++++++++++++++++++++
>>>>>  include/linux/resctrl.h               | 19 ++++++++++++++
>>>>>  2 files changed, 57 insertions(+)
>>>>>
>>>>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>>>>> index 0ad9c731c13e..6b0ea4b17c7a 100644
>>>>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>>>>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>>>>> @@ -444,3 +444,41 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
>>>>>  {
>>>>>  	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
>>>>>  }
>>>>> +
>>>>> +static void resctrl_abmc_config_one_amd(void *info)
>>>>> +{
>>>>> +	union l3_qos_abmc_cfg *abmc_cfg = info;
>>>>> +
>>>>> +	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Send an IPI to the domain to assign the counter to RMID, event pair.
>>>>> + */
>>>>> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>>>> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
>>>>> +			      u32 cntr_id, bool assign)
>>>>> +{
>>>>> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>>>>> +	union l3_qos_abmc_cfg abmc_cfg = { 0 };
>>>>> +	struct arch_mbm_state *am;
>>>>> +
>>>>> +	abmc_cfg.split.cfg_en = 1;
>>>>> +	abmc_cfg.split.cntr_en = assign ? 1 : 0;
>>>>> +	abmc_cfg.split.cntr_id = cntr_id;
>>>>> +	abmc_cfg.split.bw_src = rmid;
>>>>> +	if (assign)
>>>>> +		abmc_cfg.split.bw_type = resctrl_get_mon_evt_cfg(evtid);
>>>>> +
>>>>> +	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
>>>>
>>>> An optimization to consider is to direct the IPI to a housekeeping CPU.
>>>> If one exist, a further optimization could be to queue it on that CPU
>>>> instead of IPI. Your call since I am not familiar with the use cases here.
>>>> Looks like all paths leading to this is triggered by a user space action
>>>> (mount, mkdir, or write to update event config). This would require exposing
>>>> the housekeeping CPU code to arch.
>>>
>>> Do you mean something like this?
>>>
>>> cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask, RESCTRL_PICK_ANY_CPU);
>>>
>>> smp_call_on_cpu(cpu, resctrl_abmc_config_one_amd, &abmc_cfg, false);
>>
>> Please note the returned "cpu" may be nohz_full and if it is it would need
>> an IPI. Similar to mon_event_read().
>>
> 
> Yes. Got that.
> 
>>>
>>>
>>> You want to do these changes now or later?  It requires few other changes
>>> to move around the code.
>>
>> I'll leave this up to you. I think it would be ideal if cpumask_any_housekeeping()
>> can be hosted in include/linux/cpumask.h instead of moving it around within
>> resctrl.
>>
> 
> ok. It will be couple more patches to re-arrange all the related code. I
> would prefer its done separately.
> 

This is ok with me. Thank you.

Reinette

