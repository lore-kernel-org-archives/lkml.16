Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C0821B9C7;
	Fri, 11 Apr 2025 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744405501; cv=fail; b=oFW4tVbEUTn0e0hpnryIo4KDAYJGcRRdCnymo2hdI5klhmiNTu3Fv52WwysUJroO2reasdWF+ho38QejeLPPohmGTMZRw7ZuQhaYAzaWI2AO8NIruS+99L4QhgInThnONQP9BfFbHCGFmosmZTwYJkGTdHz7F8Fhso3pwXjDzTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744405501; c=relaxed/simple;
	bh=3kvFGqrHut/8nDscp7/FBnDbYsyIPevcUrwKBjVxEMY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sw7oMUH5UHE214nu/27qFU52iLEhXdZ8crbdpZPGgLmjzOUjRP7FGeCRF3sB9NVo6oGDhNFZoCMIpUEAOS8/SZb0hHigrlrQeSjaCKzaE7QOINHbzgB84K4g7FS/KWunLa0UkC5mCCcs9gHU7Db+VA4Wnp/f4xIg7R/x8yy6cWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MX/x9MnM; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MX/x9MnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744405499; x=1775941499;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3kvFGqrHut/8nDscp7/FBnDbYsyIPevcUrwKBjVxEMY=;
  b=MX/x9MnMv4/F6ht9FHA3MOgIWon5BM84OMDIoIWPZPqhNQZhOrbNV7zW
   p1HRgZjxT9gRbHLQaqlN3fqffwbVlZthSydhJZCIgHdZLqBaQJ2ZU6pux
   qA8ADNnOkRYbc+T/W+7so8hojiHMqAqMqGNbsWBBroVLFUTVGUXNn4c2f
   SopcV0ej3wPtONYARN8dpzKh5eFUZM1lrMV1EOZ78oEZBu1lIVWZ8s3J3
   PWnyDDmyQrel8CfQQQ8aPNTLxBdxTzOCBNDwRwzRXW3/RMY2Y7tNAzuMx
   INwwOwXi4qL/mJqpakvbVBFeo+wwQknAd/2cb+BfPul068VmWYomL0RKW
   w==;
X-CSE-ConnectionGUID: 0eUAeCKRQumb4lYzWvh94A==
X-CSE-MsgGUID: eHxF3Y8kTNaGo7ai9ZyrEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="57335810"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="57335810"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:04:58 -0700
X-CSE-ConnectionGUID: eLJNdZUCSCifCFebycMXRQ==
X-CSE-MsgGUID: dBz0GujUTc+a2aqx+G/qIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129297507"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:04:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 14:04:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 14:04:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 14:04:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NT21hShNPqG9GGHivw6kB8o3VOz2Ts3IF6vjBgyu5caFLcXlO09idEtWDdhkE/HAKCSi9FAWvIP/HcrOQo9IMJx3In/00KdNaS/Ljj+n9nxiiRBMwo9/UEMSnTYEHkzbNtfONWN0BerR3HBIesokQhuw2gTfvWKIMi/RpOZJMCihuiYAPj6QSASBkBMo8tCijZOehTaRLJ5qXx1aVTs8/HNHk7ycvMRt0XNqCIiUedfQEtogUt/K+aosG6zuHIWuUGh8pxPHbbk1C2NXMD6hyPT/9epFqhOFtFfqajbe3xkgYCun7WtDAmCL+azHjYxL9fJbhGjfA1fkAGuElc6CAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPr2VHHLXtF1A5VcFL9hc9/DLsTx7r6SOR20WWlNb9A=;
 b=tNWFZXsI1VZcmJnMFIphw56bFpmD4IbOileAA+mSvLTIe8hHld/EDzU6VFqvyKNeJ9IWqb/hlXuTXAdCDPqOnHHjVdGypygnaWbfquNOzsk+K1iy9x7T8wgKL3M97THyylN3ZXdWb1/TilcwkUR+hBNcjqf3tUH+abcIyflG5knaWsIbNvEXsgJCDKETwtN7ZebYszzYiUWVdi2qPkJdve+HIp1f06OZUGeJF45t3xZivJSnn/28AkdwyvyNNBMhyjC4+wiL6UVC/5fPOw13j2tOXYeVlmpvyRuWHHhnRrdiE4jwtdamb+LLLPBduroZ7BIpA6RUp/w4rEwuGSDHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by MW4PR11MB8266.namprd11.prod.outlook.com (2603:10b6:303:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.28; Fri, 11 Apr
 2025 21:04:52 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 21:04:52 +0000
Message-ID: <59fbd325-04e8-459f-a724-ae0c4536b1a5@intel.com>
Date: Fri, 11 Apr 2025 14:04:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 14/26] x86/resctrl: Add the functionality to assign
 MBM events
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <22889d46484b2393d701ce83c82f253c1454216b.1743725907.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <22889d46484b2393d701ce83c82f253c1454216b.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::19) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|MW4PR11MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b5e2ef-43d0-4296-66f2-08dd793c8088
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3BtVytveVB4VWMwMnRhZjlRL29haGJLOFFmM3J3SEVmYVNOV0phWTNqTlhr?=
 =?utf-8?B?anBBbE1zSUZZcE40S1lmMURRTmF6LzVNbEZnUXFNUzIrSUVjeG9UdkttTHU2?=
 =?utf-8?B?TFE0Nmo3MjNvanc0aVlMSUV4WFpiM2ROZVFsZ1ZjQ1NsVitISVdLNW5BaEQ4?=
 =?utf-8?B?TWVBU0w4ZXRyUkZMTGsxMDVlcmZaSEFVQnJuM2dMcDIwc0ZyZGFWcUpLS0x3?=
 =?utf-8?B?dTVhdmlSdkN6OW9qMU0xUzUwanAzaS9LTVNHUUhJU2I2eFNFVjg2S0VIV3Ax?=
 =?utf-8?B?ZU1KQ1cvczB1ZUdmR3JncFNRZ1A0VzlTZFlxckgxTEJkWVJvd3R5M2NxT3BD?=
 =?utf-8?B?T1Z5R2QrWjh4Y0ZQcmkzMVRsWVFmWlpZZXBvNUNaZWhEMmFEUXk5dFk0Y2Vi?=
 =?utf-8?B?Q0tGNmIwUUNySnQ2TFF1b3pRS3JxYXhJUGJpc0NJcUZKV2dtdDM4ZWJTWFo1?=
 =?utf-8?B?RDhVQis2VXlwV09KSVRjL21NMlFHS2lJa2lVS29aZGFlVndwOXRiK0pjSlRl?=
 =?utf-8?B?dlk4SkNURUc4QVdjMnMyenlOZC9VWWNENU84bVJCdU45R1ZUZmdzN045MVN0?=
 =?utf-8?B?Z3JmRGhvQ1E4S3Awb05uYmN1MEk4TFZ5K2VkQnE3Sk00dStUZksvdE4wUFlZ?=
 =?utf-8?B?U0REUHdIWDdKK3NRNjN4ZWMwdGxqeVI2MDRYa3QrM2pKNUNsakJzd1FIOFVR?=
 =?utf-8?B?WTdaR3hJVTEvWERQZEN5VGVmNlVXYktlRUdVS2xIQkRxdU5PY1VxRDQ1WHdH?=
 =?utf-8?B?RTVvbGpKQTlkVG5DSDV0QnV1Unp0a0JjUGd6MStRVlBaU1RnWE1MU0NlOUFW?=
 =?utf-8?B?RVlIWUM4VGdLLzl4NlZ4VWdnbTcwNGRIZVArUmlBR2pranY0cWEvQjJ5eCtt?=
 =?utf-8?B?ZFNmNURtdVI2WWkvZ2RYbUZCb1hXMHZPL2M0eStUU3hLRDAxYncrUGhoZWVt?=
 =?utf-8?B?bXN3ZzAxWDJuck1YanNKd2lTcEVTUy9ZOVdGbHYxZGFpUXdxNW92UVVuUUZ1?=
 =?utf-8?B?Nys3MXBqZzAxUE12OGdEeEFCZk1DU2pLR3JTS0gyUWplRng4cFljYytPYStM?=
 =?utf-8?B?UU40V2c5WWthSnZHbTc1NGQvWmxXVUl0SE9kaFh1dWd0MnZJSGNrZksvZGVj?=
 =?utf-8?B?d3lRTzM5YmVVMFhGUnUzNnhXTFNtRlRHQlJ4NHcySkpXRmd0b1pYMkRoRUxP?=
 =?utf-8?B?b001RUtxVGp6T0R6RVQ5WmVHajNZdVlsajhHdHpyVXUzdlB2c2dIdFJVZDJs?=
 =?utf-8?B?MDhCZ3NreFI1YTNnWXREMzRVNnBNNXJMSzFJb3U2bVd0WHVsSFFYK1lqYTRG?=
 =?utf-8?B?Y043Q1V1b1lFY0lvSitrWWp6UXFYQWtJK0pQaGtRSTNCNEpLa3daR213NnNk?=
 =?utf-8?B?Mk9scDY1eXdTbFJaeVEySWpqSDJ5a1VjVEV2Y0pqcm1JcDAxV084Z1ZFVlIy?=
 =?utf-8?B?Ry9VWmZpSktpOU0vVFBhaTdsdEUrWlZqMlpGc3dDN2NFaHdWYmV2OVB3eFdq?=
 =?utf-8?B?MkNkd1ZRQm0zNjBpODFYZENaR3JsZnozdTRQQnhId2dtY2d4TEtBTnhRVEd4?=
 =?utf-8?B?ZENaa2VjOFJBMlZWT2k2UU4yZ1QvTTV6Rmp5RnFFRXBlLzhHZ2QvSW1Lci9C?=
 =?utf-8?B?ZXNEV0tJeThBaHo3R2RIQnNQdDhTbktlVUI2N0FJeCtkQk5hV2QzVlBIbW4r?=
 =?utf-8?B?aDFtRzNIbU1Ib2tDNTR4M3lGSlUzUW9jYWNwQzNBVUpSOUU3RU1EUWdUaGxD?=
 =?utf-8?B?RS9kcGJCVVFuazVKZ2xWR3hVRUNzenNEd1VyZ0ZkNjdmOG04bUd5akF5Y2FJ?=
 =?utf-8?B?Rnd6Tzd0d3VoSldHOWJnYWxReGhHa081UXRzaTI0QXdHbWtoaEJhd0VJTDgy?=
 =?utf-8?B?YUllVDc3bTRHckJReFBzYVBFY2JKcXhRMnFOLzdYcmdQeHlhVmNkcnlpK2Vp?=
 =?utf-8?Q?r1UGsRcCiZw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzNISUFqOCtwaUxEVENOOHRmTDZGUFRYbC9ZTklaQ2IrR0MwV0ZBNHFBbTln?=
 =?utf-8?B?a3lZMURVU3F0bkp0VFdtanhNYTBXbVpFRThieGpMaVlGNmZ4ankxSjJodjlB?=
 =?utf-8?B?em5tMjZudzJseHlMRWdkTGJTdG01dmhVaTNGRm05K1RxMWhNM201K09FcjJu?=
 =?utf-8?B?SlFXU1VFNjQvdkVDdFZqZzZCREtWT212T1ZGY1lLTG5ZbGVJZUJzOUQvUTdT?=
 =?utf-8?B?aE5qUEhJQlJsUExiZlpHREthZGQxbWhNaHhVMFRMNUtCUTZWVjZHalY5cUxZ?=
 =?utf-8?B?L2FTYnAzOFJVOXg0Y3dzTlhLb0hMWW9PS0VrM2R5Z2FVaGh0SEV5Z3BBT1dj?=
 =?utf-8?B?dEM5RmwreE1mMGtZZU40VFVaUXhVVXI5MmZlSXRHSzVYVUdPT3JXd1BKdmww?=
 =?utf-8?B?WVpKYTdpM0cwZjhUVEZvZ1BaZ0M3VGxEWm54WXhmSTZiMFBFT2RrVFpNN1BL?=
 =?utf-8?B?WDBLVFdQQysxbklTU1VhbndpNUZCWGo4OVhmUTFIQjhRcEUyNG9jTEJlNlJi?=
 =?utf-8?B?cUh6MDFIUXdjdjZOWmRsUVdLWUhrcXlHRmFyWUhBcHMyYnZYbDlldzc0enJU?=
 =?utf-8?B?dkxQTHhNZ05VbWcvZ3Mrd3VkbUFNN01OdGhGNkdkVHV1M2ZwaG93V0tFY0ha?=
 =?utf-8?B?ckp0dnFHUW9ONWlRYmU2alExS0t1VmwzYnpGbUZ3R20vYUxNcXBMbE95bDFO?=
 =?utf-8?B?VG9POUhQWExUQWI1UDBYd0wwQnE3enBPQlQrVTliK2lKdWZCbGhSQ01mSHcx?=
 =?utf-8?B?aGg2cXM2bzMvRTZSSzRVaWkwS3dpK2YwUmYyVW9BaC80RzA1aFVIQ0JIWWx0?=
 =?utf-8?B?NllCYjhRVVJXZk1oVWNNcUhVZnlNTzJRVlZ4U0hueEZwRmxDVm0zVkh4WDdQ?=
 =?utf-8?B?ajNDMWkzVVMxR2Eydy92WjhDQi85VEdTdlNmUFAvaVNOMEZiTWw2Z2gvTlVZ?=
 =?utf-8?B?a0YrbGowVHZ0L3AyNWNYU015NFErazl2ZTdrbmFjMHE1OTRmSk9xQ3Z1QVMz?=
 =?utf-8?B?TS91LzNpdFhPSmgxdmlLYTlRaFgxRHZpekQ5bUR0RENlWUR2SkpSSFhPaGlC?=
 =?utf-8?B?SGVqR2FmVjJ2ZmhJRXJxTGJzUnY4eXJsMzRnS3duYTg4TmYyQzlBaWZUZVRq?=
 =?utf-8?B?SXZYdDBOTzJobFhvRThtR0UvQzhWeHIraFFSRFZBejZEbGx2Y24yUGlnNndC?=
 =?utf-8?B?N1krcjZrTzgvY2s3ZnRycEU0QnZPZldWUEFlRlFIaER6SmtBY0tBZFV0Rmlx?=
 =?utf-8?B?R2l3M3VsaVRCb2pSVFF1Qk5OdWZUYjhVeDBCTm5taGxxdDB2VTRyNVNZcVcw?=
 =?utf-8?B?R084ckpQejl3QkxPV3ZJNU9mRTMzTXRMN3NMR25ydFFWUmJnMTIrUVBGTWtw?=
 =?utf-8?B?bkxQVjl3aVV2S200ZUtwcERFTVYwZHRubWFKVnNDc1RBaGtWcVlBaU8yMnlN?=
 =?utf-8?B?YWNBaXpDRzdOd01INmIzcnlFMG9WZWlzVU93cS9oT0toeDBnODhLY1hoM05N?=
 =?utf-8?B?enJ3OUphRVNuSlJrNGpnSmh4SXkzR3R0b2grQVdsS1FwaWVNQW1iTkp1M3pH?=
 =?utf-8?B?NFBVME9kV2gzVXFzM0pJSmVhM3NoRTJmQWVOcjNuVk1GejNmMVpEbnhjOTJm?=
 =?utf-8?B?VzM1TVlBUCtsdmtidzFaaGlRSDE3QmtjK0JxZ0VLTzFab0szWFRJbTVmR2pr?=
 =?utf-8?B?OXExRmdJMVZsU0dTdUVic2hqTjdQTll3ZHB5UG5uOGtUeDNqay94ZjAyRnBW?=
 =?utf-8?B?eWgvbVZERDVRREx1clRBc0w3TnVnSGZmK3lPZFhRV0lqMkszNERxQ3BGN3Az?=
 =?utf-8?B?RHJhaVd6UlE3eUhnSWhvMTIzTXYrTWwrcWdRRnk5RytpVGVrNkxDVXVPaHV6?=
 =?utf-8?B?Vm5VejZNK2k5R0lUNkIyU3FoNU5LS0FrU0k3WXZzMCtiQXdrTW9hNmpneDNp?=
 =?utf-8?B?RGdsVG1LMlAxa053K1BjZlROSWkxRU01ZWxSZEFmWmRTeUFtQnlSblFNSFcw?=
 =?utf-8?B?ZEUyOTQySFlxVTF6UEd0d2xXUWI2SXNqZnRDS2h4VUk2L2dyOE92cnNKYkdM?=
 =?utf-8?B?eGpSUnlqdXJZblhHMVhUNmJpbmE1b0VacWluZk95VnZXYWVuWERJZWE1MzlD?=
 =?utf-8?B?dExiZWYyN0tvSkorWkZCSkNjU3N1QmJYVENDRitqKzQzTXZaQm5mUW1HQ3Zm?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b5e2ef-43d0-4296-66f2-08dd793c8088
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:04:52.0121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHZz0kifbt3Kc+Lra22SfnkutjObHqCz610hbNbSb8r0X9igbG2Ws0k0uTYO+0cgAvCAiYsI3StFU23KPH/ztP6Eov60Mtqc8ICOimcsjSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8266
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
> can be assigned to an RMID, event pair and monitor the bandwidth as long
> as it is assigned.

Above makes it sound as though multiple counters can be assigned to
an RMID, event pair.

> 
> Add the functionality to allocate and assign the counters to RMID, event
> pair in the domain.

"assign *a* counter to an RMID, event pair"?

> 
> If all the counters are in use, the kernel will log the error message
> "Unable to allocate counter in domain" in /sys/fs/resctrl/info/
> last_cmd_status when a new assignment is requested. Exit on the first
> failure when assigning counters across all the domains.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  arch/x86/kernel/cpu/resctrl/internal.h |   2 +
>  arch/x86/kernel/cpu/resctrl/monitor.c  | 124 +++++++++++++++++++++++++
>  2 files changed, 126 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 0b73ec451d2c..1a8ac511241a 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -574,6 +574,8 @@ bool closid_allocated(unsigned int closid);
>  int resctrl_find_cleanest_closid(void);
>  void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
>  unsigned int mon_event_config_index_get(u32 evtid);
> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid, u32 evt_cfg);

This is internal to resctrl fs. Why is it needed to provide both the event id
and the event configuration? Event configuration can be determined from event ID?

>  
>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 77f8662dc50b..ff55a4fe044f 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1469,3 +1469,127 @@ int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>  
>  	return 0;
>  }
> +
> +/*
> + * Configure the counter for the event, RMID pair for the domain. Reset the
> + * non-architectural state to clear all the event counters.
> + */
> +static int resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			       enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +			       u32 cntr_id, u32 evt_cfg, bool assign)
> +{
> +	struct mbm_state *m;
> +	int ret;
> +
> +	ret = resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, evt_cfg, assign);
> +	if (ret)
> +		return ret;

I understood previous discussion to conclude that resctrl_arch_config_cntr() cannot fail
and thus I expect it to return void and not need any error checking from caller.
By extension this will result in resctrl_config_cntr() returning void and should simplify
a few flows. For example, it will make it clear that re-configuring an existing counter
cannot result in that counter being freed.

> +
> +	m = get_mbm_state(d, closid, rmid, evtid);
> +	if (m)
> +		memset(m, 0, sizeof(struct mbm_state));
> +
> +	return ret;
> +}
> +

Could you please add comments to these mbm_cntr* functions to provide information
on how the cntr_cfg data structure is used? Please also include details on
callers since it seems to me as though these functions are called
from paths where assignable counters are not supported (mon_event_read()).

> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
> +		    d->cntr_cfg[cntr_id].evtid == evtid)
> +			return cntr_id;
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
> +			d->cntr_cfg[cntr_id].evtid = evtid;
> +			return cntr_id;
> +		}
> +	}
> +
> +	return -ENOSPC;
> +}
> +
> +static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
> +{
> +	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
> +}
> +
> +/*
> + * Allocate a fresh counter and configure the event if not assigned already.
> + */
> +static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid,
> +				     u32 evt_cfg)

Same here, why are both evtid and evt_cfg provided as arguments? 

> +{
> +	int cntr_id, ret = 0;
> +
> +	/*
> +	 * No need to allocate or configure if the counter is already assigned
> +	 * and the event configuration is up to date.
> +	 */
> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
> +	if (cntr_id >= 0) {
> +		if (d->cntr_cfg[cntr_id].evt_cfg == evt_cfg)
> +			return 0;
> +
> +		goto cntr_configure;
> +	}
> +
> +	cntr_id = mbm_cntr_alloc(r, d, rdtgrp, evtid);
> +	if (cntr_id <  0) {
> +		rdt_last_cmd_printf("Unable to allocate counter in domain %d\n",
> +				    d->hdr.id);

Please print resource name also.

> +		return cntr_id;
> +	}
> +
> +cntr_configure:
> +	/* Update and configure the domain with the new event configuration value */
> +	d->cntr_cfg[cntr_id].evt_cfg = evt_cfg;
> +
> +	ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
> +				  cntr_id, evt_cfg, true);
> +	if (ret) {
> +		rdt_last_cmd_printf("Assignment of event %d failed on domain %d\n",
> +				    evtid, d->hdr.id);

How is user expected to interpret the event ID (especially when looking forward
where events can be dynamic)? This should rather be the event name.

> +		mbm_cntr_free(d, cntr_id);
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * Assign a hardware counter to event @evtid of group @rdtgrp. Counter will be
> + * assigned to all the domains if @d is NULL else the counter will be assigned
> + * to @d.
> + */
> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid,
> +			      u32 evt_cfg)
> +{
> +	int ret = 0;
> +
> +	if (!d) {
> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid, evt_cfg);
> +			if (ret)
> +				return ret;
> +		}
> +	} else {
> +		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid, evt_cfg);
> +	}
> +
> +	return ret;
> +}

Reinette
