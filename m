Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78C61D5CF2;
	Wed, 18 Jun 2025 04:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219435; cv=fail; b=Bf88/7mYF2wmKbA0RGJq3kVlI8+Hnc7EC41FpVU+GG+DaGDK4kw7iRLXEdFxAFAZmofQq0eexsBsPB5VS+7zgy/OrJ8PLBr73Sdp9Uvn8Qg6QwZglPWAKrTWmd3C2hxMNJBvhD3drmRaGGI78c2wZO3gSqLuuJRt+44ep7cont4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219435; c=relaxed/simple;
	bh=szjOo4fOJRq4lPv9q9w7W4eqwSbR2Adsf9n+DSW/ezs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g8LMhKHRtG1m8pwGALsigaUIVIfxfgy3gBskrN7f6Ztu5XriFNnQT4BDvzbWaeDaa+kRIgQu9RNJSug+zPFvJ/+VSTJ+fmO4TOAlrppvijABw/jf9m1uklWELsBUzmIRsw2S72egnAG6FGpapNUwmx5lmXWqUftfk/Bb14O5YzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMqYdKJO; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMqYdKJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750219434; x=1781755434;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=szjOo4fOJRq4lPv9q9w7W4eqwSbR2Adsf9n+DSW/ezs=;
  b=IMqYdKJONm2+yojRvfP6DSWKIHeVUoMSOCQCJWPGoHykRx7TUwqT/H7x
   vjiAxqemvgcqnyQTWXRBumH4oRxNkWgrgxmovZcvsgLTKcNiPIqyGCuyn
   Y8B4KeP7X/Hpocz/c6u1DvmA79fMGEykWm7+JUMayNJmavbkiBaHpxd/b
   Qm1YHyep+GucI1Vb8HcC/2Ov1k1S6Il9bRnFibc6WZ+ffwskzcIRQtQhD
   pZdZEfF9w+TGCh9wU/7Q78aPv041ONoPNftG7IqyehCVT+YCfBgKSHjsq
   +WuClLgkEV/je0Zb7JJZd6CxX0bOBL0d6zz/hfUsM27MYqome+HHYB+N2
   g==;
X-CSE-ConnectionGUID: 791yL7uRTFS2c1zAD/jtWQ==
X-CSE-MsgGUID: VEEdmhImTE64WY1b+fuXUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56095515"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="56095515"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:03:51 -0700
X-CSE-ConnectionGUID: 4BMZWD/kQ0OO8g74lqn1fg==
X-CSE-MsgGUID: Ujp9KEV1SWy7QgTPyQIdNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="154667860"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 21:03:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 21:03:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 21:03:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 21:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDlt+Z2rIPijWODTxELHGUnFKVpeYgItuWtToASGbOBzsJ7aYqlCXfyfeQ3QcWplYyDHhMJMaccX6VJIA8gPTAtRaqYuQj9J7ukBIRb7YIzUtjQ8WTjjI8IKpc9I94FUc8zZiDTozCjqwzb2cvQCfEA7BbeJH0avo+VG10ROiato+KjGwoGL4U6EJrtVUjMWZGeckJ04fOtZNvGHF2v5juk2IC7gYUQkwAxvvaHYf5SBl2H8fM68NXArJAB5Wthx+D0yb7FZdot63PhR3CMaM040WzqkUniBWPTN+9nIELW2Ir8hBziePjRzl+DiNN5PBFVjWVe0gaQjlkG1N21PwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wjBPyKpTRwczIIHHgIfW10BkRC1CAhTG40uI7da+qc=;
 b=EQ+P85OxkpLhklwkfI8gxIPv3DAxYPAoOZdc29x7QGIZuLBOZcQlOE+0O1VmasUXcEadWGSrDOolSAFldPHLyPqRvkjJ5PhaS3WAVSYsCrftbeyCl6KrZe6OdoouIUiu5uXQY3IEvl6F1hetixFQL9HXUXstTfBHZkXZ5h0IuF8PDOhwhcTn5xyi6uktn541F8z+i4Y7cWToNzhJUgAbzRDM4qPmle1WjCwIyx3qjrICmR8jwE7ceP93agZZQtsvIN+44BW9Vb212ZlossLUjumI/+3iKdlsSX1Xv1ET7GMj+c28VKzDr+XXCa//Mfcry+OFGBYMUx+wNRPVx+PNmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA4PR11MB9059.namprd11.prod.outlook.com (2603:10b6:208:560::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 04:03:19 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 18 Jun 2025
 04:03:18 +0000
Message-ID: <2dd192ae-3342-4115-bdbf-a4109dd54d89@intel.com>
Date: Tue, 17 Jun 2025 21:03:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] fs/resctrl: Modify rdt_parse_data to pass mode and
 CLOSID
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rostedt@goodmis.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<perry.yuan@amd.com>, <yosry.ahmed@linux.dev>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <peterz@infradead.org>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <sohil.mehta@intel.com>,
	<chang.seok.bae@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <ak@linux.intel.com>, <xin@zytor.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1749677012.git.babu.moger@amd.com>
 <8ffa8b31f471750464235f6df21971f7353b7015.1749677012.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <8ffa8b31f471750464235f6df21971f7353b7015.1749677012.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA4PR11MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: c04bd966-3447-41c6-44f0-08ddae1d0f26
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHRKYWkxeHpDSmlqYzVzK0hKdzFMUUVuK0pFNWZ4Sng3ZjBsNWFKNUtaN3NW?=
 =?utf-8?B?WnREMTBlMjROM054aWVuQ1hhY1JCeHFDcks5SmlrRlZzM0t1T2V0SzNJcXZI?=
 =?utf-8?B?YnRWMnZ1RlhjRTZxVzZYNUxKV3VGdklxQjNXaGY5dnFVRG1MZzZ4WFFLN3Jx?=
 =?utf-8?B?QXp2ZGNZc25CSkc5Z1lzb3NSeEVxWVVuekd4bGlCMDF1cDBnd2l5cmt1VG1P?=
 =?utf-8?B?TFRpZ3JGZUdBbXk2NWNnbkpWMllST09oMmlBUFRvdEROd0twSXVrYnN3ZDJ1?=
 =?utf-8?B?VTEvakxhN0k5OHFBclNrVzZEMFJ1bVR5MU1OMnYxRUNBMU1tR0ZHYmdCVktV?=
 =?utf-8?B?clE1dEJlWE9xTG5RNDdITlF2cy9JZ0F4RFJPazJySGlBcWpMdFpNbnlISVN0?=
 =?utf-8?B?eUtmYzNKSjJIQmdRYjk0SVBMT1pILzlXY2k5am9KZTBMSjQzQzBPZ3U2M3Zh?=
 =?utf-8?B?Umpsem9UYUkrSDl2UnNsYTUvUGkxY00ybkVjWTBqYm9najI5RjRXUThrVDNu?=
 =?utf-8?B?RzJBN0F3VTZwNDR1ck4wSHBmK1g0NUI3a3hadFROakY3NHN6YzFmZTlnU1Vs?=
 =?utf-8?B?akRJemxVNzc4eU05Ny9RRks2MkJBYXR1VkM0bWFkVU5JcGxsYU9OUGVMUk9h?=
 =?utf-8?B?aTdLRXBxdUZWTDJDRmRHVDEwKy9HSkFzcEhlMHIxM3V3bnU2Vi9BNmRCK3NF?=
 =?utf-8?B?VG15WmtOUVB6c3l3K2xURW1sL2c1UzRtWjd5ZUNiT0M1YVkxemNOc1h6c2ZY?=
 =?utf-8?B?WkNWaXZMSmt1SUkxem94aUx0SWNicDFlQmdTZE9DUXVvTnY1aVM2UWJ2NDdq?=
 =?utf-8?B?SXFpRWw3M2RFSWNpd2pXcjFXUnJ5OGtybGwrd3NHOThMQ3J4R1Vzb2ltMkZM?=
 =?utf-8?B?cndVMFlOc2pXZE00dURQenVudVBxRFl6SUxtM1JNYjMxK2I4b21oNWN1L2NE?=
 =?utf-8?B?NTF2Y0dUQzk3dEFCN2ZSVzNiOXVYSlBaSUlaYzNYbnBmenNrSHB4WWd0OTN2?=
 =?utf-8?B?cmRkYjl1Mk1rMWhGMUZLdnloQnRlYU1aUXowMWloSVB1Q2d2MjVsUUtuOEpS?=
 =?utf-8?B?dHpFcm1SbVBIcjBHWW02RjlZajRYM04yVlZLWDcyVmVlOU54dGlIYU5vQWhl?=
 =?utf-8?B?OHRxc1BlVUhhb2k3RXhuYkVKUFkxeWd5WFN0QzNiTC9iMmJDTCs1dXJ6VWhI?=
 =?utf-8?B?RHVWL0ZoQWl0aGRaeFNIcUNOb1oyd0xha0hvbW5SS1dqS1NnbVJkMmhTd3BM?=
 =?utf-8?B?RTFMNjl6TUxFZFhIa2Y0U3hJai9uczJnMUhjK0NYVkRnR0ZZeC9rQjJRcURw?=
 =?utf-8?B?M28wbFhuU1hLZk9KeWJybWthSEwwV0ZhOEJSRnNQYzA0RmlsbEMwdS9qSVdp?=
 =?utf-8?B?R1hBNjB6akFFTjliakhSLzFlTkVFc3RRMCtrMlJIdExzUUFUVG81S3p6TVN3?=
 =?utf-8?B?Q1h3dHlUbVMvQ1l4MmRRZEpxNEZKTWpFNXRENm5wUk1VODBDR2NJVWlhSU52?=
 =?utf-8?B?Q0IzMWttazdtd0hvc05ZSFVFOWVuK21IckZUWWJ1b1RjeURSZDR1Y09RY3Uv?=
 =?utf-8?B?aGp4M0ZuVDkwQUpiLzZ3NTVEOXh5aTQ3SFFIR1BZWE9LTkxUWE9mZ1lrUm9i?=
 =?utf-8?B?RmhqZ1JsTE05ckt0eXl0VGZUSUUxblJKeXF0Nnh5ekQvWmxQYUlSYmYyZFBE?=
 =?utf-8?B?UzZWOXluVkdDbXFzZEdtbEpEMGI3VGkzczRodmdvVGZIbENVS3E2V1lVNU5N?=
 =?utf-8?B?V004UE1aRTFJTmJ4eVhiZDlWVDZCTS9tNjZiYTNMWDl6ck5HRTAxK0VoLy93?=
 =?utf-8?B?cmdIRGR3cXdidjNPNGpYZWIwejY5WDFxNXhvbEF6bzRBOVZFaHBDbkhWQmRG?=
 =?utf-8?B?WEFTamZ5V1FCL1hwT1FmaXlnbXU3ZDBPdWFhQXc1dnYrTHVGS2ZnMEx3ZWs4?=
 =?utf-8?Q?d522vfihCeQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akdvbDk4WGIzeW1hZENNUENpWHdnNTNMUmVlM01tMmNoS1Z6WWxmZW03ejJZ?=
 =?utf-8?B?S1c1dko4WDdGbmNQb3VyUlpnYXBkVTd1MHppNk5VQVRhanhSUVdPSEovZkIv?=
 =?utf-8?B?SCtzbTFNV0xoUFZ2MSttblplY25WalRqcUUwQm96MFZTcWU0Rzc1UHFuZzVr?=
 =?utf-8?B?S1NBbzJnR3JHa1R3MlRFUjBaaitueGtjZC9yTHAwWmMwcjVsZ0VHRlJuZFJa?=
 =?utf-8?B?d0ROS05IVlBJOWJqKzZ2dHpZcGZxeW9JZnVLVkUvR0VOOVpidktXNHJYUStM?=
 =?utf-8?B?elFROWpqcjNySTZaZjRjVEY3SG90c0dGZUljeXR4ODVhdWJhSmdJS2QxK2JB?=
 =?utf-8?B?S3lneE5QWlJoOXB1OEVZNXJpZllwMVR3NDZqOHQ5WFB4TkFlZTg4cDMvb3B5?=
 =?utf-8?B?UzNCSG1pY3FCK0t1dlhsd0lRZkFucTZNdjJ2eSsycEhLc3VLcU1ka3N2blZX?=
 =?utf-8?B?cVo2T3pYWGhtR1dOTytnRFhBMm9jd0E3bXhEWVRvVFdTODAxUnFsYmh6NEtR?=
 =?utf-8?B?UXkxYlNaaG40c0hYL2p5enJqN2IvRjRVVjNqcEl0cUw2b05IdHFoRExVS09Q?=
 =?utf-8?B?SUZYTkpubmpQUXd4NFl0Nk85dnUrSVJnSGd2ZUx2VnlGUG9Fd1FuaDFNaVAw?=
 =?utf-8?B?dkllVTNlS1NlTHhSYW5DaGFSOHpUVzRsNUFhS2E2YnpGUEZoZ29FZ3hLc0x2?=
 =?utf-8?B?VHkwaHVBaXd5MXpWNXQvaXVKdUpnSmx1KzJ3Q3dqQUhhNHU5OG44VUlWSzZl?=
 =?utf-8?B?QkRZQWpPTlpjVFZIZXkxNVEyQ2swLy9ycHoxUVFNSjZ2TVE2RUtFMElUM0ZZ?=
 =?utf-8?B?ZHhzRUtnY0V2MEtobmpEYWR5UVBLR2J2K2VscmlLVFcwd1VYQW9qZFhQVTlm?=
 =?utf-8?B?ZmU5MEtQNlhTbmZRSnJSaENzSHlSaEd0OURQcjZncjY5eWMwR2g5QVQ3SVg3?=
 =?utf-8?B?OVFMbkM2eTlqb1p1ZWprNXZxNmZxRE12RHk2K1RjUUV2UmpJOEpmUHdQL1B5?=
 =?utf-8?B?MW1MUHRTNDloVWF3SXJIU1V2UmNGdm5tVHo3cWtZQWFPNGdkQkhFcGF0bGRy?=
 =?utf-8?B?WnNzODltM0h2NVJoOXU4TExaZFpsMnhuMEdFS092ZEpDMFdRNFNCa0IzakZW?=
 =?utf-8?B?K0pCaVdPYUFKVi9PQWQySFo1QWJDb2xSam1tUjZtRUdtdm9JRU1zdTNGcFVZ?=
 =?utf-8?B?aWNTcEd6TTdjamxlMFRoWTNJYzN0Uis4ZVVRc0p1MndsODEwcGxETlIzekRt?=
 =?utf-8?B?TU0zS3BVd0prVkNuKzQ4VExwckRuNklSOHRNVG8rdzJ4cFVxMzliM0ZZckxp?=
 =?utf-8?B?enUxS1M2b2pWN1YzbmJXSUNQSVZMY0RuTklRc3Y2SDhlMXp1T2YyRC9WYmFi?=
 =?utf-8?B?bzd5UkFZR1NJdUFuMVlzMnBQNy9vUURWRlZCNi9DL0xXeDNqSUhtY0VnNXZ6?=
 =?utf-8?B?bXZ2dUpUbUIzM2RZQzJXeitYWms3NTZJNWxuUjNGNkQzSUplK2JKa29YRXFP?=
 =?utf-8?B?ZFFaS2N0SVZGVS9BVEV3TkJaVGYxV0xqMVR6OTYvdGp5eDJoZ2h5bndBbHBW?=
 =?utf-8?B?bTU4c29DOHlQSUY3SWRPQ0hPWkFxN2ZPSjlxWEJneW9zMXc2b1FCV0l1UlBZ?=
 =?utf-8?B?bWVSQ0RxQWgwT1ovYmY5UDRiM0hhNzczV0tzcWFFMXJ2NzljNHJraFZpTEdP?=
 =?utf-8?B?WTAvVGR6cDRtdFIzVS9pcGdCK3IrL1pDWlJoZTYvOFkxQ0Z6djF2cjVsamdo?=
 =?utf-8?B?VVRuU1VzVnlxZVpsRVRlRGlmZk0wdzNNZGJicGowVFdBZ1dEK0gxS2pnT2Vz?=
 =?utf-8?B?T1BORzJmS3BuZlRsNnl2OXRWV0RLRXpOSHdsak93MWZKQjhBd1MxKy95a2NM?=
 =?utf-8?B?MHFaT2p0Ym4rcjcrZklXTlRPS28rNEZ0QmpTcE9yMFlGNVp0YTVENzNhdmhy?=
 =?utf-8?B?UGk1Z2JEb2pyUEZkRnQwRHhJK0tOL2o4UCtJQ0RqMmQ5eHBnSXptby9NS21q?=
 =?utf-8?B?d25SSHcrd2NycXd2QlhzSTBsaUw3bm5peTU4Q01iV2xubGFDM3BlQW5WZStI?=
 =?utf-8?B?UU9CcDRMeVJhUlBxa0t2QVNnVmU2cGh3US8vWU1YOUtLVXBYaUhmVzU4aVJI?=
 =?utf-8?B?UUxzVXd5TE9rSG04bW9taDdwd00zcW9MSVgyTExWekgvekU3R2tRSy9EM25z?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c04bd966-3447-41c6-44f0-08ddae1d0f26
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 04:03:18.8958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1sgcwmcBL1CMsn+fvU5VqYcho80BTw5i81dVDXY5ASqwrh7IzTsPGzhRhSxhU1x6PUI7vVm2b+IZ3bHO8QPoXSrkVTsnFEmDP6gavUAfY18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9059
X-OriginatorOrg: intel.com

Hi Babu,

On 6/11/25 2:23 PM, Babu Moger wrote:
> The functions parse_cbm() and parse_bw() require mode and CLOSID to
> validate the Capacity Bit Mask (CBM). It is passed through struct
> rdtgroup in rdt_parse_data. Instead of passing them through struct
> rdtgroup, pass mode and closid directly.

Above looks like a combination of context and solution description.
Expectation is for context, problem, and solution to be in this order
and in separate paragraphs.

> 
> This change enables parse_cbm() to be used for verifying CBM in io_alloc
> feature.

Is this the problem? It is not clear from changelog what problem is
being solved.

Also, please drop "This change" that is semantically the same as "This patch".

Reinette

