Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDECB2DCC11;
	Fri, 23 May 2025 04:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747975544; cv=fail; b=DNpI/Cao/aJaiDZw6220NsQiv12PjnfNN4V+bQWeFyGiDrgEFXbtm+4BQFsqdSBrJnmSB2tfFL6HCqOVDECErniX8zJQ5G4UFTUbOUw8mwk4dpJhTJ0ukYPcn8WTxqBFys5QEYzaR62X2TdE8C3HuHrG2Zjg4Nuzpu9e3jz/ygU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747975544; c=relaxed/simple;
	bh=ALTjS+5UEf4gsKv4YVrsGquNJvESG2Nw0m/J/Oczl9U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UUJUx91B3UWPK1MhTpzBmboCmPKMAPF+JxVVWBqCfhPe60B1UwkDLzuYTAh0MC5DMXt1WrqHRW1vL7YYzl8iOpkfhJ9ZRSSQ4fwFenWCRfxv7MZJRqtflTh+IhyiETwGW33EDGR9FvKo76iDXpH8vK1rqDJR+3ZUWz7hP2fL/iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZcWDSEh; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZcWDSEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747975543; x=1779511543;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ALTjS+5UEf4gsKv4YVrsGquNJvESG2Nw0m/J/Oczl9U=;
  b=PZcWDSEhG/FFyYqxx4TdSTp748J5fT5apj2X6qsT02+dFm4wYl48+swt
   isEYzl8xRbj7pBH6C9jZazHm/I5/+0yMH//uKkedBTKgemJiA/KbHyIHm
   XdrGBhJFYWR9J4/jlapYbjyBF6mIQ/Zib422lHyVLiT/IceHwQPIDBazL
   Lyp9qjqbg0vUOMSR8aQDz5TLYDllmkNBeHaWESs5Xg0h7Qa4+XPpoKYZZ
   A6kdBo5y15cS4h7kSSAaeadReYaP+Di9lqY5S3nf6suXo3F05hyC8QPDI
   jdmcJD/XNZYi4Sg1pUtnROrioDkeGggv/L1N5sLNSyEvEx90O3L5gS3B+
   Q==;
X-CSE-ConnectionGUID: btCOfW06QlyeQs5BqqIaIw==
X-CSE-MsgGUID: lkH2orRPQmOilbbSps9k9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75422282"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="75422282"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 21:45:42 -0700
X-CSE-ConnectionGUID: RmsJ7X+DSryWrhO5g1KdLw==
X-CSE-MsgGUID: tKgRuoXZQ7WMTOm7WJJjXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="141003531"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 21:45:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 21:45:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 21:45:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.88)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 21:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oq3nNZG3VlcunOhlr7ntFAiNdmtwEORsA8s8/7BIdccPRbG8Achmarj4jKI42n628FDg6FOL141M9ZOYwX9MqLhYKBbG9S26as2/U0ae5CjBL1UqheSmeZzmohPXlcfQ84fsLSrFHOwphRcfDueLn/9KS9S8ISDXlAMBidZs3axCJJr8ftLUv2l16cIug88+FkAxKtOSiq4qCfNO86I2gwxCT5QQjNyF+kPUYF6ebohzqxkJr3mNgWWvjnLiotJwuogtqEIco/vChUm9XUhnh45vYuhO1mQkdkzviYYpRymVqld2KEBgAWTgUTpbYerD2ymjtog+4dS6TEXuFj6jUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rpYQ1EyOL6UREASTdN2BT6sO4WgNYNKPRz7bHQAwEo=;
 b=rX8GiwJWi7IWNTGEEjlzqfkSSXjfjr3yGZp+cOezVlptiE+JTCOp5xdIt+WGh9NO2kiGHRX9pyMgngsD2ZWg2eJfSXsgb84RxQT5w8HxjHHn8Wdx9s/rXJNK/AapR+K7PSxj1uaZCboZvSvXKAH8fKUybtaZoq7lit49Sm8QWgZEB1CdW502FrnerwXmWijtepXacY08ipQdMtcoMCvBrrf7wU6RJthYq9EcIrA57Fsck1W7qWi5L34jK9hU0viNY0xZbtUdwPFYeDGKJvKOUyVW7VLwhE8SGCs/qBfibmovqD11+tw9ZkBbLeirNcIo1aVUNFlcEH0nMT+ObizeLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV8PR11MB8582.namprd11.prod.outlook.com (2603:10b6:408:1f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 04:45:37 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 04:45:31 +0000
Message-ID: <32b93fc9-db36-459f-8b8f-ac38cc156837@intel.com>
Date: Thu, 22 May 2025 21:45:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 20/27] x86/resctrl: Provide interface to update the
 event configurations
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
 <ed1ae013a2aa8216444d1b716a1bffc7979a8883.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <ed1ae013a2aa8216444d1b716a1bffc7979a8883.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:a03:334::7) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV8PR11MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d34f736-e8d6-498b-8f43-08dd99b4a5ea
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0tsc2QzSmhrcEVnN0hldVhuZjgxMlorQmRUU1psanpSS05GV2p4UERoVXhD?=
 =?utf-8?B?eE1mVzVzRmhIR2gvVzB3VnllQjVzTzRVNlV2WXlnZjlKTU9ybURuUTllRlA1?=
 =?utf-8?B?OVJDOVZFQUpZUXlsSWVlc2lyS0t5M1dmem95a0tucUpHZllRdjdEeTREQnd0?=
 =?utf-8?B?R1FQT2ZHWk0wSjFmbkJrdTZySEJWcnFmRHNocWJSK1ZHVURxNVlCQThMV0hX?=
 =?utf-8?B?cTBvR3k2eXRSaGtOL25XY1Bya2dGbU5WdFFDQzFhaHVVMURpdmt4UHZnVW9z?=
 =?utf-8?B?MWlaNnZMTTIxWGJOWHdPL3RpRDhPSkRzMm45RnNEQ0JEN2hIcVY0eHJCWUI2?=
 =?utf-8?B?VmFMTGtZWWRSNjdhMElJQnJEVXBocWI0VFU3dlFpczRPRHpWNVhpTzFLcVQ0?=
 =?utf-8?B?QzBCNHNIZVh1L1VwVEFJSGFhaHIwQzZKMFR6cjF4ZjNUUzNoZDc1WU1ndCt1?=
 =?utf-8?B?SmF6aStrQjFHeUdEVFlNQUlJYXdrTkRaL2dRdmMxV0NSVVdSY3c5cU15TUNa?=
 =?utf-8?B?a2V4Q3JrT1ZSMTZVWlRUYUxqYURPdVFVTkU1REh2ZkxLRWFEZjN5T1JLN0JE?=
 =?utf-8?B?YUlKMW5DcFhveStJWlduNjRZUUtPZzE3VDdROGNIeTZuM0ZWNlBieHhtWlh0?=
 =?utf-8?B?encrazhiVVhaYVNBSzEvamZ4cVJwVys3eW5SUy9peitDYTV6UmNBZUk4bWg0?=
 =?utf-8?B?ZGxZN3Y5bGNvSFo0UEFVK1AzeUl0eEZOU29KQVk0QUVtVERuaUw1OVhYMndn?=
 =?utf-8?B?SkhHT0NiYlQ4S3ZZK0VsL0V5OE00TDVCNnUwU1NvV2FGTDM4bGowZ1NzQzM0?=
 =?utf-8?B?TFd0UW9aZ2JQbzVkWHUxczh6d1IxYW9TUzVzbGhxelpDZlozSFhWWStYYUk4?=
 =?utf-8?B?WExDZE9IUTFrM3NaVlF5MlBYN2E0a1k4ZDdFQU5UemEyamczUVNmcEFWK0Zv?=
 =?utf-8?B?dk8xek8rVGdVbW5WamZJVVdOZ3psa21ITjBGL24zNlFVY3dlc1VpRWk2YUNH?=
 =?utf-8?B?MkN6SWM5RXp4bUZTY1BBbXZ5blhGNDBuU3RxYzdIUlFKUG9GckxtNWFPdDg0?=
 =?utf-8?B?R0pIVjNsdktIalllTmk1TlZDYXRaTHJiVHh6amc2UFJOdzhXQVM1S1pIMGdt?=
 =?utf-8?B?dW9NK2J4aDN6M0tieStBaXAxak9xME55QUNOOUxpMFFnR1BUdFFhU0tORzdz?=
 =?utf-8?B?MFFIRlphQUszb2dDaC9pVlRsWkFFRHNXUVFSNlJleFdNcU51WDZkdW1YT0xS?=
 =?utf-8?B?WkRWYUYwK2JoNmNCVk1WdHZCMWI2bnlCTkxEK2tnRjhsSzQ4dnJraDNXdkpC?=
 =?utf-8?B?ajhJSmdXdjcyV25zWFBqYTdOY20xa3hzMmJHWkZZSmxJb2hDc3o2cVk4eFBa?=
 =?utf-8?B?ekRtOWJQSGVHM0EyVkxPVzNLTmRPS2ZUclc4YU5pTFJWSXlNWTdYbS84TXlI?=
 =?utf-8?B?OUJRdjROYys0SmR3SGxwd1NqKzRRaGNhKzEranRTbExweVRhdkI2UWNFa0J4?=
 =?utf-8?B?NnJjY2s2VDU0SlZobmFlaC9zSktsQzJhOWxFZ3RidnZJaGxWYStmQXFzTStH?=
 =?utf-8?B?UlFETGZlVUpKZm92UXExY2NsREIvMGRlUlhzOElBUzcxMjlTdTE5ZEI4OXEz?=
 =?utf-8?B?Vy9jeTE3a1R3OVZKNmJJMFduaHhKdHNuYUM1TmNDc0hKWmVCR1lBTGlYelBJ?=
 =?utf-8?B?MTBxbml6dW9lc2wrSWZMWkE0Y3NjSTEwdUpEck1saWw1Znk4UWtzSFpLRHRp?=
 =?utf-8?B?UFduU09oMjBtejUyUmZvc1ZYa1plMDk1a0QvcnIyT0QybkJHSGtYNDcyS1NV?=
 =?utf-8?B?L1dtdXRLSXR3VytvS3dkU2p4eXgwMGVZdkRpZDU1ekE1ZkR1ejdLY3Rhb3pT?=
 =?utf-8?B?bkE3NjNzdzFCTytvVkRPVmtzRE0vTUpVTTV6N2tGUWo2Y05oTTljL3VmT1lu?=
 =?utf-8?Q?zi989+bRwCo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnBCeW5EWWd0ZXFHMXNPNU9kWEhRUEF1cTc0TGNBd05JeE9mSC9JNzh2N3JX?=
 =?utf-8?B?Y1VKR1RNNXBYdE1MVFU1SWgya0F2TFZyQUs4S3lwQk9oa3Y3cmx6MEpEaER5?=
 =?utf-8?B?TkRwNUdPRktsOTdhdnBrQVZPS1U1Vkt5M0pxWUFZQTl1c0dQdUpob3dFSE5O?=
 =?utf-8?B?VWRSVDNmZEZnOWtYUHhpUmNGWU5UazlRTEp5NStKbkUvM0VqV3c0TUdlN0Rw?=
 =?utf-8?B?eTNQSGtsMi9KS05FZEpOUXU4VmorNTZXZVg3V0JFMDIyWkFnaW5YNGxIRlBv?=
 =?utf-8?B?U2liQnk5Vjk2VHFQb3VEVi8zRVpEL2VuVklSRkxOVUlhZ083Y3B1VVk0b3Rm?=
 =?utf-8?B?UHRVaFI0YjhwN2x2aTZaVjhBR2dIYmZzRkJrRVlRZUdUTkNZanh6RXRtV3hG?=
 =?utf-8?B?L0RkelQwalZNait5cEtuN0dWL0haa2RUQy9kMnRndmhxNFo1TnhEeHlBU0M4?=
 =?utf-8?B?TWlSV0VEVE12Y2hpdVVrdHVaSlNoNzNUYTFKSVkyTlhEVVd0eGtJK2NKTmFP?=
 =?utf-8?B?Nm9QM1p5cGFlSVJwNjVzSWJQSUtRbVQ1Y0c0blhWWWxEVHp5SGNIRHNDelRr?=
 =?utf-8?B?WVV4RFVOTUlCZFZLOWkwY1J0TW5aa0JqUTBTT3E3Qm1WN3RYNDJGN1RhYkh0?=
 =?utf-8?B?K28zTXRQYWJ4ZkYwaFlKclVQaWszZFpQUlFWU1p1U3JFWFZWK0VrNXVJN3o2?=
 =?utf-8?B?T1lnczQ5RTZDOGJXTU1xRjQwSE5vbnAzUXoray8wa1BibmJ3bFB4d01LT2pr?=
 =?utf-8?B?MkRrQkltODdURTR6YzZoRmR0Rnc4NmRYVEJVL3JTQ3dJaVdDaENqYTRLTEJh?=
 =?utf-8?B?RitUNmkyd1c4Y3J2Q3VrOGxta3JQT1VVS2xscWQ2QUxKc2RlTVMyWFppZkJI?=
 =?utf-8?B?YzRMQWlvZjlzbHpnelBnd3BiY2JyeFovUnpRbCtDbWxCVVVPY1c5TXR4QzBM?=
 =?utf-8?B?OEg1MTR4MXhNUER2ZVNLUW9jeE5DcFU4Ym5lSGxMdmRFWUFJVkVvWkptODZX?=
 =?utf-8?B?d0xGTkswUlcyN3ZoTUxTemFocDNrWThCTi9ZMkswUU9GSWpMYXJ0NVp0TW5N?=
 =?utf-8?B?UTJPYWlvVmFYV2FjZ0J4NWZKR3FRcVJWRDBJN1Q2OFBDTENERFNuZkROcmlY?=
 =?utf-8?B?bDVxdXBFWEgrVjdaS21JVVRzcVNrV3dTdXhEb2pvb0ZZQkV1QzZXaTg1YXBV?=
 =?utf-8?B?aWdFZjJMYXBqY2hDTXpJZzlCTUJtbHVybG9Fa2pyMktLaGhza2FKS3draFJQ?=
 =?utf-8?B?K1BNS3hvajhJMFA1SkdoTXl2NXMzZXhWTU5wK2lndXgydWxzUHRXWTNDZXlx?=
 =?utf-8?B?K1ovVzFORkZYVlh4YWFINk5NRzRhWDBSdUxWdU5FelIxMm0rdG9oOWNUVkc5?=
 =?utf-8?B?TFlvVi9FVHNLblFnOUo1eE8wQWZCU3c0U04wa254VlFYVXc2M3BMRzZOaGdo?=
 =?utf-8?B?bDVVNEs3T21pOCtRZVBmdVMrVXdiekFLYVpZVjN5ckNhbFdGL2VBNkNRempq?=
 =?utf-8?B?WDJkdDFCVTJsRmdJeHVmUzVsT1pDb3NIajVHb1UyWnVQNW9saVliTU5LU2du?=
 =?utf-8?B?Skp6QWMvYnc2YyttVkorc0t0S3pQWFVKZm9wRk5mQmlPeklDcllzbXNOT2Fz?=
 =?utf-8?B?OGRvUzVBVEZYa3B5UVp3OE56MjJ0d1A2eUR3NEQvckRvYk1CekszajhnMk5U?=
 =?utf-8?B?NUhNUW53eTJiVzJLWUZTWlZCWVVqeVFiT2FOZzlKOUEzY09KYkFwaFA4NTQx?=
 =?utf-8?B?Zng2K1ZEK1pyNUYxSjBjalJGVE5ZMEExbkJNdEx2TUpGVHY0V1RtaGRmNnNF?=
 =?utf-8?B?NWZuVURGaVF3WnhGVno0L3pmNzVxNFVFNzI3SE1IQnk1YXlxMVpMVmZmMm0z?=
 =?utf-8?B?OVhocVJWVmFRV1EzUXJWaGp3UmhwMklDanZNVzZjUEQvT0dvNi9ZYWJWOXVJ?=
 =?utf-8?B?NnplcnNoa0xUYTZ6MW1VbXBlUGFkZ2QyWHRSa2VIM3lPS1pzWE5zTHJuQlZ1?=
 =?utf-8?B?V2lXVU1KeWp4Ym5JbGJyVkNJNWNjR1FsMENPbzJLVUNQR1dCcHU3RDhnWlk1?=
 =?utf-8?B?TzlKWFBac2NaTzZsME82OVVRZStHd1pscHBWVjhwYTdjaEFLWTdSQTU4dUl2?=
 =?utf-8?B?NEtnYjAzRHpjWktlL0FmYzRrbm1PRG9yYmtITWVQZURhV3o5SWlUYy9TaEF1?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d34f736-e8d6-498b-8f43-08dd99b4a5ea
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 04:45:31.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Tdfll2ePpqJqtixBV4omGczn4Zn01W1yLyVxkv/0L0S1h3AZZHQqh3Z680wxT/Z2cnZgA1Hz5RPUNfADaMAOzgL+zOPJrVu+YxkriJQ3Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8582
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:52 PM, Babu Moger wrote:
> Users can modify the event configuration by writing to the event_filter
> interface file. The event configurations for mbm_cntr_assign mode are
> located in /sys/fs/resctrl/info/event_configs/.

heh ... looks like you also started thinking that "event_configs"
is a better name (also missing L3_MON).

> 
> Update the assignments of all groups when the event configuration is
> modified.
> 
> Example:
> $ cd /sys/fs/resctrl/
> 
> $ cat info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>   local_reads,local_non_temporal_writes,local_reads_slow_memory
> 
> $ echo "local_reads,local_non_temporal_writes" >
>   info/L3_MON/counter_configs/mbm_total_bytes/event_filter
> 
> $ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>   local_reads,local_non_temporal_writes
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v13: Updated changelog for imperative mode.
>      Added function description in the prototype.
>      Updated the user doc resctrl.rst to address few feedback.
>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>      The rdtgroup.c/monitor.c file has now been split between the FS and ARCH directories.
> 
> v12: New patch to modify event configurations.
> ---
>  Documentation/filesystems/resctrl.rst |  12 +++
>  fs/resctrl/rdtgroup.c                 | 120 +++++++++++++++++++++++++-
>  2 files changed, 131 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 4eb9f007ba3d..9923276826db 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst

...

> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index cf84e3a382ac..8c498b41be5d 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1930,6 +1930,123 @@ static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq,
>  	return 0;
>  }
>  
> +/**
> + * resctrl_group_assign - Update the counter assignments for the event in
> + *			  a group.

This name is very generic with an unexpected namespace. "rdtgroup_" prefix
is often used for a function that operates on a rdtgroup. This can thus be
"rdtgroup_assign_cntr()".

> + * @r:		Resource to which update needs to be done.
> + * @rdtgrp:	Resctrl group.
> + * @evtid:	Event ID.
> + * @evt_cfg:	Event configuration value.
> + */
> +static int resctrl_group_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
> +				enum resctrl_event_id evtid, u32 evt_cfg)
> +{
> +	struct rdt_mon_domain *d;
> +	int cntr_id;
> +
> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
> +		if (cntr_id >= 0 && d->cntr_cfg[cntr_id].evt_cfg != evt_cfg) {
> +			d->cntr_cfg[cntr_id].evt_cfg = evt_cfg;
> +			resctrl_arch_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
> +						 rdtgrp->closid, cntr_id, evt_cfg, true);
> +		}
> +	}
> +
> +	return 0;

Can just return void?

> +}
> +
> +/**
> + * resctrl_update_assign - Update the counter assignments for the event for all
> + *			   the groups.

Again very generic with "update" and "assign" that seem redundant? How about
"resctrl_assign_cntr_allrdtgrp()"?

> + * @r:		Resource to which update needs to be done.
> + * @evtid:	Event ID.
> + * @evt_cfg:	Event configuration value.

Why are both event ID and evt_cfg needed? Could just passing mon_evt simplify this?

> + */
> +static int resctrl_update_assign(struct rdt_resource *r, enum resctrl_event_id evtid,
> +				 u32 evt_cfg)
> +{
> +	struct rdtgroup *prgrp, *crgrp;
> +
> +	/* Check if the cntr_id is associated to the event type updated */

Comment does not match code.

> +	list_for_each_entry(prgrp, &rdt_all_groups, rdtgroup_list) {
> +		resctrl_group_assign(r, prgrp, evtid, evt_cfg);
> +
> +		list_for_each_entry(crgrp, &prgrp->mon.crdtgrp_list, mon.crdtgrp_list) {
> +			resctrl_group_assign(r, crgrp, evtid, evt_cfg);
> +		}

Unnecessary braces?

> +	}
> +
> +	return 0;

return void?

> +}
> +
> +static int resctrl_process_configs(char *tok, u32 *val)
> +{
> +	char *evt_str;
> +	bool found;
> +	int i;
> +
> +next_config:
> +	if (!tok || tok[0] == '\0')
> +		return 0;
> +
> +	/* Start processing the strings for each event type */

Does comment intend to describe one iteration or all iterations?
Also, "event type" -> "memory transaction"?

> +	evt_str = strim(strsep(&tok, ","));
> +	found = false;
> +	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
> +		if (!strcmp(mbm_evt_values[i].evt_name, evt_str)) {
> +			*val |=  mbm_evt_values[i].evt_val;

check spacing.

> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	if (!found) {
> +		rdt_last_cmd_printf("Invalid event type %s\n", evt_str);
> +		return -EINVAL;

Looks like this will return partially initialized data. Please use a local
variable in which to gather the new configuration and only assign that
to provided pointer on success.

> +	}
> +
> +	goto next_config;
> +}
> +
> +static ssize_t event_filter_write(struct kernfs_open_file *of, char *buf,
> +				  size_t nbytes, loff_t off)
> +{
> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +	struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
> +	u32 evt_cfg = 0;
> +	int ret = 0;
> +
> +	/* Valid input requires a trailing newline */
> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
> +		return -EINVAL;
> +
> +	buf[nbytes - 1] = '\0';
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	rdt_last_cmd_clear();
> +
> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
> +		ret = -EINVAL;
> +		goto unlock_out;

"grep goto fs/resctrl/rdtgroup.c"

> +	}
> +
> +	ret = resctrl_process_configs(buf, &evt_cfg);
> +	if (!ret && mevt->evt_val != evt_cfg) {
> +		mevt->evt_val = evt_cfg;

ah ... here it is. hmmm ... but it is mon_evt::evt_cfg, no? ah,
fixed in next patch.

I still seem to be missing something because I expected mon_evt::evt_cfg
of mbm_total_bytes and mbm_local_bytes to be initialized with a starting
default. I missed where this is done in this series.

> +		resctrl_update_assign(r, mevt->evtid, evt_cfg);
> +	}
> +
> +unlock_out:
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +
> +	return ret ?: nbytes;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -2056,9 +2173,10 @@ static struct rftype res_common_files[] = {
>  	},
>  	{
>  		.name		= "event_filter",
> -		.mode		= 0444,
> +		.mode		= 0644,
>  		.kf_ops		= &rdtgroup_kf_single_ops,
>  		.seq_show	= event_filter_show,
> +		.write		= event_filter_write,
>  	},
>  	{
>  		.name		= "mbm_assign_mode",

Reinette
