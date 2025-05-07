Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779D228C87A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638625; cv=fail; b=GtpN1VVm5CVEDRodt4EHg2/NFGSR+mHo1JvQRDVKBRUBKZVzjog5z8uqi+/WVZuXamH5CZtokS3S7Yq+7r/5MeH5TTRW+3/XM9TWlV8o3Qonp7t80P7GMmGFHGPcDBxK3DY0VHtdyBqf9Wq8s8bkhtxr53bhaCGCzfwkTrnSU04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638625; c=relaxed/simple;
	bh=c7RqextUuS6fSE12uGcIUqJICI4aF7heTcdrXbC7ynw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oF6+zbfNFH+gCNwHVCGtxn6TE8g+OZLh/JoTSU/iEpZa9Ndc9lA/u/+Mp+X3OObFtP08d8BF8efeT60w74mcsMvgVHWs41hjE/QHE4bapFqDMpbUFEWH2mltH/ThXwmIvPQAgo4bmYv694vSsjJdMBPYvb4viRHktisa9v+Blvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ce3uu4pY; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ce3uu4pY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746638623; x=1778174623;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=c7RqextUuS6fSE12uGcIUqJICI4aF7heTcdrXbC7ynw=;
  b=Ce3uu4pYg4lJ/sL1R7RXPDTH/5vMpucq4HD7+eDwKdbcEpzid+Gw7ApB
   gerlwc8e33plnTk7dKlBqZwsHaAk0+Q6RNP9QmqrbDRYgcAJ9fAozEAp7
   D6jyVUhbFYZqIjIvzJsGdk47f8OVZs8/a1lTbm1/B+Q2I0DpczmSrfk2u
   6prI+Y/koEIex4B/+tq6Dw+nPqktadXhCWDOkmFRp4v5RIr8fDQT/4Oyq
   CfSUvVRf6sEtBr7QJ8D0tl7o6LuKZuTUkmxdBZJslhfLzWwfKgBPG17e9
   /IQd2va8zbuM9mw0Eq5VdBWAXQN7r6Yrfoo0ewxrfx607UyP/XyZiS85b
   w==;
X-CSE-ConnectionGUID: sk8BcYdfSUC3ax9tieC/Dw==
X-CSE-MsgGUID: ixuAmtr+SIaL/ak8lXWLYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51044443"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="51044443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 10:23:42 -0700
X-CSE-ConnectionGUID: 3RA+hGWdQDuAHmrKIsgaoA==
X-CSE-MsgGUID: QXAAMfeYR369zSfX94HZuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="141224410"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 10:23:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 10:23:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 10:23:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 10:23:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8TgJ6h/yz7QvBKrfd+xEdnGjXYPM+QdMNw0DWJ98crbP6xmosErqLcjBgAFjOc19mKHDiX5N32XjkBKd0wq2bhHDWu/U/Yy9tILneW4VsEccPdyRxp+wa/mfYfmEGu4eJr0KzcYjXA3R7xwGXkvv98zxWO1XHRFQY16W9XaClVGFQ8wM6juZqb7q97zvYuFGZOKa+nilPM6wzNBugC36lEtReb9JZihvDqfldQs1KxP9tFsbB96vCJAhOwVc4KUQNVjSROxzVd8pwV+cBrbb3GkgF8d+oS1s2gZ9Llx/lN13MIxuePnEfO48DECCGVjQSO2XXQWZ/3V1+YF2e+W6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxL6k4DHZVILEYSb7CurjWBzoGC9960snG739aM8o1k=;
 b=j34fzVvgXjonPbzexnpeaPxMDEIY7NSBLDR5NbPb6X7neMlf32J7GQK1TB2Vb6QiTykkF+a1DEcjaMoF+k3b0SsATYQZBDinHnmynAOrGTqwAY2Onom0CIK3i3BTeoCS2ow2iQqHL2wGOwkWsn+5n/hr0GvxyZmlwN/LjpbXuG7kg4Y5+v1MtKiQWCAFn5VzMQ/ayfmht/I0KZAmGWpyU5VJPYZVtzcVBaqgl7aCdIsLEF7Y0nPD6tlasUpYXuOr2+Of+3w6u4Qh+YzKzhnqEYXdmr7hKaY66Q2vZYNPIBO1tsyrX+UYMD6cfhnO5pxuaBpS5JkVZtVegpP6OV5S4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH3PPFEC89C124F.namprd11.prod.outlook.com (2603:10b6:518:1::d5d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 17:23:34 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 17:23:34 +0000
Message-ID: <1faaddcd-7d1f-4dfe-9927-802639074476@intel.com>
Date: Wed, 7 May 2025 10:23:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/27] x86/resctrl: resctrl_exit() teardown resctrl but
 leave the mount point
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
	<tan.shaopeng@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-5-james.morse@arm.com>
 <669c32d0-384a-4224-87db-f8af551fd6d3@intel.com>
 <37db00d7-6839-447c-914f-31d2f4d8737d@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <37db00d7-6839-447c-914f-31d2f4d8737d@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::42) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH3PPFEC89C124F:EE_
X-MS-Office365-Filtering-Correlation-Id: eedbb004-a743-4f61-54f8-08dd8d8be550
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnBOZHhRaU1rbmY3VlVkcEQxTjJLYW1JSmc4U3N6a0UrcG5jV1M5bXBOS1Bh?=
 =?utf-8?B?Slg4WVZvMkI5UVJaL0hUWWxBN2RadVB5NFZ2bk1hKzZycGpDSS9GM0o0RzEv?=
 =?utf-8?B?eG9RVEFkVkxXYlJBRFUvSmduVWJLQndUWGRBL1ZFQWJoY3Awdmp5MUJsUUd0?=
 =?utf-8?B?Rjg1Z2IyWnkvS3M3Q3FxY3VRWWNRbXdwM1dldm5NNzFvclhqOUhXR3phOWQ3?=
 =?utf-8?B?ZFQ3NGQrclB2V0ZEcE13SSswV1NTK1poZU82L1ZJZVlNb3Q5U1c3NUtXbzFk?=
 =?utf-8?B?eGZXNk1YS3AydlZFRnJXUnBzc1Era1NTaHFiUk94WE94M1dzTGJTd05DMWVs?=
 =?utf-8?B?RlYvQVhkS2U4MlN3MVhPZW1SUkxTaEVoZ3UvTEplYm5SOENPV3lZSFlWQURG?=
 =?utf-8?B?bkFSWUlaRVRrVjVGdjhPOGdyZDA0T1UxRmh0MllwL2xieFY4b05xSnZqYkpm?=
 =?utf-8?B?VWVmL1pBVVBZMUQvZU1xbmRwejd3WkZkOElySDJaMHgxVUpDUldEY21aOVJa?=
 =?utf-8?B?VU5oUGhRRlRpa1paaVk1RjVQRjc5MW9NQy8zWmROQnhHRHdLTm14MGlDTnRa?=
 =?utf-8?B?YWR3WUJrZi9mbVVoU2w0ZSsvVEtnTkpsOHVDK2lPb2Uvc2g2cy96c2MxZTRy?=
 =?utf-8?B?QXFjd1pYRytxZDhPdVZUV1E0emYyYmE2ZVV6c3pRR1FGOVZ1L2gyQTRqc1ZN?=
 =?utf-8?B?NEZsZXNOdENSQk8wZW8zMUNZdGhNVzZWaGEwc1M1RmFyZVgyc1Uxd3pTK3py?=
 =?utf-8?B?MjZEQTg0KzRQSWNDeFdjR2NtVUxSTkxXQ0pvVHdndDZLaXZCK1dxRk9MSFdw?=
 =?utf-8?B?VkVmZzE5NjZWUlQyNWN3VDU2bk83V2dlVXdGMCtYdTUybFRRM0dzVUIwWkhN?=
 =?utf-8?B?K2xzRE1BSC9sa3p0bUtFb21oZ09MMlBBdXR2ZmxlUDNKclZjQ3psSWZhYXNF?=
 =?utf-8?B?VDZ3K1VGZXpKNU1hbEZ1VmhyVnNUY3hmeU5KY2F4WllXOTN0OGhEZXV2UmRn?=
 =?utf-8?B?akpNd0hzZ3NnYnRwcTVqWmczQ1BkMWlRemFNSllPWjlQS29oa2FjSXJYSlhW?=
 =?utf-8?B?bTBmOFFablhIcmlQcnowYWU0YW1OWHRaTEJWNVBxdGFiTVVQL3YyNGZoRGNU?=
 =?utf-8?B?d1BTQ0VNdXpDbCtvSXRKcEVCODZiTlZyTjIwTlNyU3F5K0RIWU5lTEROcWl2?=
 =?utf-8?B?c25sdTJTTUpUOS9VYnRGcllabEdHZllXUDVRVUwwelJudzlSbzFQaWl1SWlO?=
 =?utf-8?B?cENTNFlONmJKZ3VOSFdzZVdMMDdseitndXpsMzFpZUY0WFZJQ1Avd3AyUHRk?=
 =?utf-8?B?UHY0NVJOOGMxU21Ya3grUUp3cWpIeVpiMFlUOTdkZk9TaHFjL2p2Rm96RUZr?=
 =?utf-8?B?a0pPN2ovSGJFcjFQc0lpNWV2akNybm00SDNPODE0SjRJQjRYNnYrcDFnTXY1?=
 =?utf-8?B?VmJUQkhKcFFZZDUwWTNpdVc1YXpGUzJrZzZHTEVUVFd5cEJBcmVZVHh5a3Vl?=
 =?utf-8?B?Nlc4NVN5Zm9LZUgvM1VQL3orUUpqR2FoS0hnODNETGxCRHZ1NkFxa0UzSnNJ?=
 =?utf-8?B?MDBuVnpVQlVvRWxBMUVJcmhxVVpmVWI1WG9ldUtrWEFCTmRlT3dJSFNwTllM?=
 =?utf-8?B?UmhQY29RM1RqTTFWMEVzdCs1Nk5qN0RWdWhsZXRLZ01zOGo3aUN0LzYrSXlt?=
 =?utf-8?B?aSsrbjR6SUJLbDJUQUozbFhudVRtQVdlZE9xeUVtNUt4Q0ljL1Zsc2lVd2VY?=
 =?utf-8?B?ZGJYZEgzRVdnOUJZTTI4MlBHNHJYbFJRRTZmamZadmU4bXZ4RUcwNyt3b0t2?=
 =?utf-8?B?WHNxVFFJQWRBc1RyMWN2UkI2am9JdzJINVBiZW40NExuNHR6Q2lRaElBVUdC?=
 =?utf-8?B?M2xPb0pmSFFmdlRaU2JnWlhldFpjZSsyUDI3TWoxaU95K1pUdWJTclQyYStI?=
 =?utf-8?Q?auO5+MhrZew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkRIM0R2MElzWDNyOGVQUHU4T0ZBYmlCTEJXL1dwYWdBOXh0M0JNcXhVZzZD?=
 =?utf-8?B?b0xyUkxERHJqK1Q5czVtbW11SGpzVlc2WW1idU95aTBYVkRRMGN6NWp5ek0r?=
 =?utf-8?B?aDVPOHVCMUhtaGxlNU1wY3E2elpNclhuMlNWQ3NSMExDb04xaWg1T29Kd1lC?=
 =?utf-8?B?Q0FKM3RyMmZPN2dqVDdlNXBFTW41eWZjTnAzdEtKSDdUQnN5cDZTOTltVThz?=
 =?utf-8?B?dWlLY3VNYjJqdXUxdTk3eitNZmpYS0tCaGVZWWR2VzQzS1NvSFFEYWhmc1U4?=
 =?utf-8?B?VlBOaDFTTDl0cmhTVFNmL3VDMUhKMU5sZWN3K0YwOW51WUhyK01RVUxwQW9J?=
 =?utf-8?B?bXVOM1p3QjFBdXZTQXdFSzRveTR3Wm1jYmFBWm1hREdrOGUyZW82REtTWkM4?=
 =?utf-8?B?TCtKNkkxd1Rub0JwU2dtd0c2QWlxbWhYWlpvcTVtdXRuL1RkbjQ2aTNLRCt0?=
 =?utf-8?B?ZjF2RmY1YWl0aWErdzZvR2RoRDBWZlg4Sy9BWnVIOXVBZFl4Qk9PRjY2ZXJo?=
 =?utf-8?B?OWY1amtxdmN5eVFPbElyVENOcUwxenRpNzdKa2VmNi9wbEdURHhuZnJ0RDdx?=
 =?utf-8?B?V3NvSzNaek9LREJ2NCtCc2kraStMV0pIclY2KzFxVGtOSG9oYVdwODBydmlT?=
 =?utf-8?B?Uy91MitJUERGSGhIVnRZMWw0MXBTK054dERPa3BOYXpMWjdiTGJlcGlNODBQ?=
 =?utf-8?B?RURHbk9VZXo0WVBub0FPa1VBclhkSTAvTEdsSTBEQjZUczVoU1JFNXF2ZkQ3?=
 =?utf-8?B?TWlvL2pxdnprT3lVQmh0em1La1hqdi9rWm9nMXkveUdJZXY1bXZFdlhNbFl4?=
 =?utf-8?B?U0NCVThPMEx4Z09KWnNTZFRmemxYbk16dWdCZ21IOC9aL0xkR0x2dXV1c2dQ?=
 =?utf-8?B?UVRwQWtQQ0owRyswK2ZsbXNmUzM0SzhXNnY4OW1HbHZwOGpoU2NXb0lMRVpP?=
 =?utf-8?B?SDVkNE81UU9sT3I3MWh0S1BaN2RubGFpWFIzclhDdm5TMGZ0MVhxcWtJaC9r?=
 =?utf-8?B?c1hWcmRwYVZsK2Urak05N3RNUmRGUXVvd1gwamROVzNwQTNKR2xjVmt5dDNE?=
 =?utf-8?B?Y2huR2tWOTJCZHRLUVI5QzVxd1BmZmZnT0txOWNhaVM2QmtOUnNRbXhpYTZS?=
 =?utf-8?B?RTBvb1Y1eEg2OHhuUVhxY3dSckkvSno1Lzd6ZmJLTlhQSjNSU0c0QzhQSWNT?=
 =?utf-8?B?VktMZWlneTluemc5TzNUeGVkK05vTVF1dy82TmVlelcwT2NxVUsrMnVLdG5q?=
 =?utf-8?B?L3YvRjVodS9YR1BIdFE0YjZVb0o5aGhxK1NrN0Z2bXN1eVJucmFtWHlYVWFY?=
 =?utf-8?B?M3hDWGtzVGZmNlZWcHpaSGhSZ1FSVEs4a3JtMUtjWDljbW5xYjNQRnBIUFpp?=
 =?utf-8?B?YUFQVHJxY3VUOURxcldtVkk4dWFzNjdvT1VGVGszTXhuUVpweXdRS1I0R3Q1?=
 =?utf-8?B?dGduSVBHYng3R3ZON1BLaDN3QVFUU3psbGtBUnpMRUlqdkZWTnRwVEZpYkZm?=
 =?utf-8?B?dVRwUDIvOGRocC9CNFp4Z3VJL1hvYTVkU0pZSHpvaDNZZklwcWVmRm91QkJD?=
 =?utf-8?B?cTFHUlJhSk8rZVEzclJZUk9kZmZrUlZYRS9YMXNiZHRwbHlTcldiSFlHYzZw?=
 =?utf-8?B?TVI5dnVnQ0l4SjBDWTNUZWsvTVVsMlVzWGRSWnNCdENVd2dUZm5BRzFsTXlX?=
 =?utf-8?B?OERhZ0VyZDhzYnFDTkIzYmVxYlFzUkVYL3BBbHpiSS9nVnZWWmhFbDJhVFR6?=
 =?utf-8?B?RnVCbnNWM0xqeXg2bS9Jc2dZZm1nL21ZM1BDR3lQZFN5VTZsK2pFbmd2QVNU?=
 =?utf-8?B?TWFaQzNBNHlNejN6UDNZd0xQem5rQ1E4dDlEcTZTcVhJSXExU2RhbWFUVnNC?=
 =?utf-8?B?WE16MHh2UloweU5pZGxHdGVRSjlIUnJoQjZqMWVnQWttSTliUkZNOEdTQURL?=
 =?utf-8?B?M1V5dTlqakNlYTl6Q3VsNUYycFU0Mitmc2NaaHpCUWpScmVyNDA3aUxMVE52?=
 =?utf-8?B?M2dNYkZKTlVhY1ZGeGpWNUY3c2ZlR0lybm4wWE85WTZ5elhzSnJRZFUySDRv?=
 =?utf-8?B?SXE5TmJDcSttcTRFL3FyZkhyWFdNcHFDK3RBcnFxbHVWcjU4WFdzNjZlaHRm?=
 =?utf-8?B?Y0lReVRxdm1ZVTF1bXNOa292Q3NyOUxYYTVRUjFUUVZabUkxQW5hWUpuZnVE?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eedbb004-a743-4f61-54f8-08dd8d8be550
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 17:23:34.5293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkhhCurFxz6+oP35wv4/hpOAoIQIupTjWQYacp5ntkxtPwQiBUQp3cKov5s354CV2nM6K8QTkwc3WzXv/AU5f1CNDndFjlOmQjMXp4yBIOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFEC89C124F
X-OriginatorOrg: intel.com

Hi James,

On 5/7/25 9:48 AM, James Morse wrote:
> Hi Reinette,
> 
> On 01/05/2025 18:03, Reinette Chatre wrote:
>> On 4/25/25 10:37 AM, James Morse wrote:
>>> @@ -4432,23 +4445,42 @@ static bool __exit resctrl_online_domains_exist(void)
>>>  	return false;
>>>  }
>>>  
>>> -/*
>>> +/**
> 
>> Why make the switch to kernel-doc now? The benefit is not clear considering
>> resctrl_init() is not using kernel-doc.
> 
> Just the ratcheting of 'add a comment' eventually leading to 'put it in kernel-doc'
> once the comment becomes sufficiently long.

I see. Not something to pick on since resctrl surely is not consistent in this regard.

>>> + * from all resctrl_arch_ functions that can do this.
>>> + * resctrl_arch_get_resource() must continue to return struct rdt_resources
>>> + * with the correct rid field to ensure the filesystem can be unmounted.
> 
>> Is this to get through set_mba_sc() and the for_each_alloc_capable_rdt_resource(r)
>> loop in rdt_kill_sb() or is there something more subtle?
> 
> The for_each walkers, which may also get used by the arch code. I don't have an example of
> where this would go wrong, but felt it was worth noting that resctrl_arch_get_resource()
> should not return NULL for all possible resources in this case - resctrl doesn't expect
> that for any entry in the enum. Adding that error handling was too noisy, given that today
> x86 has all the resources.

I see. I also find resctrl_arch_get_resource()'s comment in include/linux/resctrl.h 
supportive of this. Having the extra note here is enforces this requirement.

> 
> Tony suggested that get changed to searching a list if the list of possible resources
> starts to grow.
> 

ack.

Reinette

