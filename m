Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62A42F235E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623822; cv=fail; b=N84rnNt52jFgmhDoZmD7s7yrOl9d8T/cJejoMjUqbARZq6HbUKX/FkPiqB9KoapaGJpJ5iWO2j81ysOGB5MnHl/znPVbRQrZ49o0g5bYMjunJ6SGfq3EL/U76PTJWdx2fh9xj9Y05cA11CsngIoi18Ltp8nW8Xz3eXs9B0L9keg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623822; c=relaxed/simple;
	bh=vElzL0F8nvGQtEOHdDBWI1oxJne9FONZFHukCiAcakI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dgKztrXrjN62QsRH3mZlMbAMHENjY/07XiMdtgAUiuzi+oWgG4MlPSkUnCh520JK2IYUrI32PhDtlIo4QozhAC8TCnpU2KuLhvN6bSPZQSEnP8IRFX/HY3b9+sNGu5DR6Z8de6GLSx2itnubkUPf2RkJJ4TppEdS1LeSQMpKbrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLyehmkU; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLyehmkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751623821; x=1783159821;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vElzL0F8nvGQtEOHdDBWI1oxJne9FONZFHukCiAcakI=;
  b=DLyehmkUXZxIJoOmMxnlm0zjOQY03IH+/D9M3lHPOv1lJV5Nh1t+C6LS
   Q6ZC39Yg2731vB+nhtlNwlhniRsSm/XS+gv7At47iilj9yNYVlGnTIu0Z
   Fbh5nacdE6E4h5pGM+Rg15V7ySENE6URoC3TT94Poa0f2QLS7TvAp/9Vy
   cAPZk8HDIizu2JNc440wtXYZJBQr0AhDZBOth3OFaBNl5eKSv2hU1iDPg
   hNxCDKeyNGovC5DzwMdB+oWPQn61KK22y7QnFjdtQc/lOe4qZ5VoRq5EP
   BhagB2WAbNHO+OsB01xglDbeQbYB6lFisp9gLIAAaVZ1QYq3RCtxUrtTj
   g==;
X-CSE-ConnectionGUID: yasdW/2wSk6cfS61wlH4tg==
X-CSE-MsgGUID: KOBIrvK0T0K8r1BC821Dpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53824325"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="53824325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 03:10:19 -0700
X-CSE-ConnectionGUID: jiePDqO/SNmeyTfBHsnT5A==
X-CSE-MsgGUID: jlL0SFwhSjW0dv/pRBe1+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="185566407"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 03:10:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 03:10:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 03:10:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 03:10:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGayXuuX0Lxg2OaLNFzBNJ5mDmjxDA6ewf4NAtlXgYeITa5ygfObP1XWGDhAyTcw1Umh97qNZHd+tJp4s0Vq8Lf4nZvgHiYOrxGY69bEzsG9oszo92bkAf46lnRYWy1ct6U7gtdPldoZp6itKCPRtFBvGYwHqrn/oTRVv/SfAwI3gu4gaEicO/Xyv1ouFLCz10eBrv0OztevM2ZNR2i+RAbmpMib4NHbOG9EpusiZ00FaemnUnKiYpJ/YJfnT3P/i7HEm0ePy8ukRNz6rvqyt0QpJY3dTr0Jwr081eD57b9l39+Cwloc0bsctJkHoPiewNpZ/eZGyA/uWr39chtI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbCk7jYfDpRirpuzXBtZjiHUt6NdR5oTJUNM/OIYKvI=;
 b=CD6iOcLe3qb/ZXYjbI5sF/j2J64cjCIOWIdcJfLnIe2iNFCVSoMiFU+HhpvOR1kpqdBqi9TKi7jRbg7lKWcQKNkzN8hkJA41/+sWsf3w9SOR+XvVy4asYZCR50OT30FGdB3ebQ8UlnVq7hF7YtuYSbdOQOi7HaF4Q33tOh4/xVXObw2JqGvFHSkwL7Ui5EledRCDdbitf9sVebHmAOVNS3KrHc7rgptzYGSf3yLyo9EVPIlnrYlD9bvAsRo/7FTpHO79d9sxoBMSmpYkn2H5QrFd9/qQaFT/Jt+pl98LSEDaPjd/+pdWNKcN2QTyFuIIZBg9qSXscrXth8es3y8s+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.16; Fri, 4 Jul 2025 10:10:01 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Fri, 4 Jul 2025
 10:10:01 +0000
Message-ID: <8c2f4839-20d5-4ac6-a52a-b0a8986781cb@intel.com>
Date: Fri, 4 Jul 2025 18:09:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
To: Shrikanth Hegde <sshegde@linux.ibm.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, "Libo
 Chen" <libo.chen@oracle.com>, Abel Wu <wuyun.abel@bytedance.com>, "Madadi
 Vineeth Reddy" <vineethr@linux.ibm.com>, Hillf Danton <hdanton@sina.com>,
	"Len Brown" <len.brown@intel.com>, <linux-kernel@vger.kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, "Gautham R .
 Shenoy" <gautham.shenoy@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
	Tim Chen <tim.c.chen@intel.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <4cde5b36-4ef3-4dc8-a540-99287d621c7f@amd.com>
 <ddb9d558-d114-41db-9d4b-296fc2ecdbb4@linux.ibm.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <ddb9d558-d114-41db-9d4b-296fc2ecdbb4@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0191.apcprd04.prod.outlook.com
 (2603:1096:4:14::29) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd4ea3c-c5a6-49db-eaf1-08ddbae2f00d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXRTenR2WENEei9YTUJKZXk3akJwNEZWMytQUlRqZDlLL0cyL1ZkRDJOQ0Nz?=
 =?utf-8?B?QlhTMGtUdTh6UDBLcUViUmVEams0NS9GbGdvYzlXaEdFZVBxTW1aa3FKdlN1?=
 =?utf-8?B?YzJmOVE5ZitNdFcvbDdZdFptTXJpN3BYYTlCVklFN2JiTjdqL2hOdDkrTGli?=
 =?utf-8?B?WXhXZG0yVS95dlZrMjE2UUhGamFoZTBUTlZCMXBDYXd4YlNrNGZBSEErOXZ4?=
 =?utf-8?B?b1VDd3pTSjl2Y3Y3Q014TzZLQkY5b0FCS1BGMUdveGIvTnRMSFBwV2ptYWhV?=
 =?utf-8?B?OVJ3WkZsQnF4U3hINkE0R1JQNk5NOC9zM1NuTTdqQy9Hckc4eS92MEtCNmRC?=
 =?utf-8?B?dXg2ckF5bm5SYnVzb3hPUlBVcTl5c0ljZWQyeGszTGNVcVg4MGE5Sm00azla?=
 =?utf-8?B?a0lFNnlXMldDMEs2YnRVMzBBSmxaRisydFY4cGthNUVDWEpIZWU4MnBaSHhk?=
 =?utf-8?B?Ny8vaHZ2M3FHbVhpUUhQcFZScHJMYnZJamRrb3EvOE5tQ2NpZGNFWE1XNnUw?=
 =?utf-8?B?NU1LZmx6T0pzS1V3SkpWK05lODZjSWJYWTNPaHJjYUZNS3U5dXIrSk9GWkU2?=
 =?utf-8?B?eUVMOXJGZEp6bnFIMmZMeU1PWkZ1RUxTTVFqV2xabW5DSitkZndieDN1L0sw?=
 =?utf-8?B?RnFSbDVQYThnUFl6YjBKMGVZL2h4UWdta0JzbmlQcGFwRk9uVVl6WkJYU2NW?=
 =?utf-8?B?cWNZNDdNWlpJeTN2WEZrQlBlMTBvbjhVa2t4eTRSb2lKb0FoUjlPWWNEZlk4?=
 =?utf-8?B?c1NBWUZIOXkvdThJdGQwSXVxMWVieEloeUxRelRpejFENVAweUdtb3VSc2Vw?=
 =?utf-8?B?RFF5TnJ6c09tZkhJemdVZGs2Q1JHb0plVitVZytqRmlPQXFtREVsNzhxdzg5?=
 =?utf-8?B?VTNvNDd5NHVBZ01LRklvdnV1TjhEMjZhR0RoN3Rja0VUTmY4RWFYVUlXZEJN?=
 =?utf-8?B?Z3BqVjEybnRSY2pnZU5HcEttZEVDWFFrYXZpTnNRYmc0bVV4ZDhMNG1zWC9n?=
 =?utf-8?B?UzdDbnIrTlZNd0RDQ2VmOGkyS0ZsMTdPKzJJT0RUM2lkVUhWdW9WQnk5K3F2?=
 =?utf-8?B?UndLMmNKalZ2aTJLaTNEV0JYU1JWanRDTkxNWTBUUzFEVHh1d2JsQmxhMUhP?=
 =?utf-8?B?WHF0WGJaRU9wSWlKUlpkQzhuZVM5ZkRSR1NPQWd5eXlJWTNtSU4wLzdIaEZN?=
 =?utf-8?B?WDF0R2ZVek5Eb09qc0pvUERZYy9JUEtSdWJZRytpb2xmSFd1MVNpVzBKdGR4?=
 =?utf-8?B?K2ZSQ3FjeVJ4czN5SlhXNk5FcGhRL2hWbCtUejNyNXJUV0ttVDh4aTZrQktv?=
 =?utf-8?B?Z3B0eGRIVDZpOUtOMXRUY1ZpWUNhVnFmbDdxKzdtZWhDdUdUL2hQQjZaWjlE?=
 =?utf-8?B?NmNQQ3NNVGRIVVFTcnM3TmljZTNyL3lobG1pdFE0UHVVWnY2OFFtdjFGSlc2?=
 =?utf-8?B?QS80OWJRY3drOUM0SlJiYnoxcU0za0JpSEVIYlkvQVk2cnk4RzdkYkZpd2da?=
 =?utf-8?B?cktxODZabm5yb1gxMDNtY0VsRGRYVmtXNDdYOGVTNndsYktEcnpvSFk5NFZ2?=
 =?utf-8?B?RFRzd1Y4MXJmUmVEN0s4RmZqNFZiWGtmSTkxM3Naa0ZHZ3BaVWc4eTlCYThG?=
 =?utf-8?B?aUpFLzdrTmRJVGhCbnhmeDdhY042U3hOTzlHUG15bE5ILzkzRGJCMDJtUVZR?=
 =?utf-8?B?bk1GVHdmRHNobzlhekpybmZkcElsckhWL0NMNDBnY2ZmZm0vK2JNeElpbUt1?=
 =?utf-8?B?bnRYd2FoN0Vyd3R5ZWFGaWxsdE82MDVFdmlBZ0l0bTljRktjSitKU3JTd1Yr?=
 =?utf-8?B?cHdFT0MwL3JJK1F6MXExRGtYb1FyWjhmemREYXByL2dkNmd6aWh0Um1VU1lv?=
 =?utf-8?B?bWMydU1VbWRycW56bnhTZVlHWTdibEUzWXlkRGRTa1Q5Z0R4bldWbXpTSVds?=
 =?utf-8?Q?H/odZNAUfmM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE1jMHJyNnFEd01ZTkVxdkhzeVlROUlIUWwrWjBBZzdkU0Y0cElDRmF4ZWhv?=
 =?utf-8?B?RGxlcFQ1OWhEZUJuYUwwb1pIZFIwdnFuTnkveHdlM3JUaGpJTHNnWjdJaW5T?=
 =?utf-8?B?dWgxVHhCUlYzbUh1TGpZbDI0V3Q4OGJOZW1QQ3FtQWlaWWJXa1hPZ0Uwd2Yx?=
 =?utf-8?B?MC9kUXBLc20rVU5UeHJXRHF5RXpPVVk4TzZoTWVrQTFJNEFtWVFZM2QwVy9K?=
 =?utf-8?B?UHdTWHBmck1ZKyt2R0h4eEROVTdvTDVZZGdzdUxYV0RsSkhCdndsSE4yS0k1?=
 =?utf-8?B?NXVuVkYrZEVKVUdJaU8yK1E0MG5PM1c1NzhKVU8ybWZSbnVjcTdWUE1KYVFW?=
 =?utf-8?B?TjZBUHZ0NWtoc0Q5dm9ZaGo0Y2RYOW94TVcxM3ZoU1lZcVRMVTVSRWRWM3h0?=
 =?utf-8?B?dW1PQWpkcHJYTFlhOXh6OWt6N093ZWoyNjhXcGZncmdXQVFhSGVxTVZRd3Zo?=
 =?utf-8?B?bS90bnd1RHVMU3NpTzZ6L3JCQXFZai8yZGpIUWxLWm5SS2owMTAyNXRDUmJV?=
 =?utf-8?B?bTJJVnJ0MzYrN0RBNXNCRGcyL2FDSlhxaW0rTURNZTBGSGdnUlpjdjkySzJR?=
 =?utf-8?B?Z3dYYlQ2Uno2KzhJQWJEcFRxa2N2cmJ1MFNyalZQRG1icFh1aDJhcVpRYmxo?=
 =?utf-8?B?WC9wUXJhTWo4ckRXUU02TXdwUitvQmhmWHJBTi84Y09lSXRSUXd0K1BGSE1s?=
 =?utf-8?B?dUgzK3BCSXpDNGJwcTE3TEU2RlhSOThabHRVaGs1WWgxdTA2ckozYlphVmZQ?=
 =?utf-8?B?WVRvejlpWjZyRCt2bDNGdXRJUGFJdklCR29BVXE4cFNVaHA4cEFGaHU0K2F5?=
 =?utf-8?B?QUF2VFFCMDdGTDBGY3FEejl4dVZ4ekNTeFg5VWNlaVcwcWh1bHVQVnR4eDJD?=
 =?utf-8?B?OE1pUjN4MjkxWENnRjlDQXVCK2Q4NlFtdnZXbTc0elpTOWZ3VHdLdG5BdjNB?=
 =?utf-8?B?NXNCeVdoa0p0SGNCTy9hK1FLY2hxNlBXWi9hWG55dDdUeGZXUkVFc3JId2ht?=
 =?utf-8?B?VUlpVHc4Tzh1VFpkSmVXeFpOalVnVHlTWGxGZngzbEJFZnUxNGkzZVJERHRq?=
 =?utf-8?B?RnZURG1Odkx1Y3IzQmM2Z3NxaDR3NHpiK08rK08rSUlvSWQyUytVdEF3UXpz?=
 =?utf-8?B?K1pMcGNEdmhxcThTTVRiMEN6R29mb3RHVGdaQVREdkJTOUFuaDRtRWJhK3Jp?=
 =?utf-8?B?NmY3MXdvOERReDRkZ3hydG9lMlI0TnVRU1ZVbExNMzg0VUFBVUxoL3VyNWtU?=
 =?utf-8?B?RVhrRE5aeWJqelpGdGREZkVJUmFETUdzZllRTkJMSGU4TVNlR0x5Nmg0OVk1?=
 =?utf-8?B?TjMvV252ZW9oeEJ2dEV2c09SS3NyN1VuSzRTTU1mYWFVNExwbDFOMVlnc21L?=
 =?utf-8?B?Ylc3SVlHVjBTSCtFZjVtV0FSZHUybWFKd1hnd0cyVjgxVGJPM2xBS1ZtK2Y0?=
 =?utf-8?B?L0NvOHdVRDRheXNQNE5qMDg5ZDh2dmtWRG9UaGZVNjRnUmhjb3ZzOTNSZWVn?=
 =?utf-8?B?ekdvRTNrV3RjNjNHWndzd2lKY0FVSkx5UGYrbDBMYkowdm9PRzhtSERxelNt?=
 =?utf-8?B?VUpOZWtwMnNRMW54RjE2a29BZlFmbHcvN0cwSGNaYzJmM3JJZVcyOWRzenB1?=
 =?utf-8?B?cXRDMW5BY0xZU01Qd0RyLzUwV2ZWbVF3bVZGQkF0RTFMdGFCcXBqandOM0dI?=
 =?utf-8?B?aVgrSWFPbFdxYU1CcTdtY1lUVlovMFB2aURZSXVBMlgwRFQwUnBoOC8vQjlQ?=
 =?utf-8?B?VnFQSnU0ZjM4TzNGMDZQSm83UjVrdnZUMEFZS0xnRnVhWnQxa2IvZnA2M0Nt?=
 =?utf-8?B?ckI3K3hZbjZ3U1o1RUYzS2t3YTRzTVc4Sk8rc3ROSFp4VWpVWkJ4elNhSldl?=
 =?utf-8?B?cmRCZHpoNjhBTVJ2QVR4aGVGd0dCQ3dHYVVNUmY1RjFSWTU4MzNUSjBUUHg5?=
 =?utf-8?B?VEVSVklpRnJIOGw1Z2Q3Wjk4bTFoeSszMHdGUno2NnI3MlNxOFJiT3h2YVoz?=
 =?utf-8?B?dU04cmsyZVpKRGhCRlJsRkIwSjZicXBnODJTUHN0eHFITTZzZlJhUE5DVlhW?=
 =?utf-8?B?cklsQXU3amJZMCtsZGh0cGU0bXhnNWpnYnBqSXpiR04zK0pIMjJ3NFZnTU5x?=
 =?utf-8?Q?AZUbCxDA2sUDMqnM1pQ6tOFD2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd4ea3c-c5a6-49db-eaf1-08ddbae2f00d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:10:01.0987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7wy6QrMEJ8fmMMcxMeZZiQFgeSVVhWBnpRJDZaz8P2Iw7nT7kWfBLIzx70RUSrXjoUL0btQ0MvhYpTU4wHSRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
X-OriginatorOrg: intel.com

On 7/4/2025 4:00 AM, Shrikanth Hegde wrote:
> 
>>
>> tl;dr
>>
>> o Benchmark that prefer co-location and run in threaded mode see
>>    a benefit including hackbench at high utilization and schbench
>>    at low utilization.
>>
>> o schbench (both new and old but particularly the old) regresses
>>    quite a bit on the tial latency metric when #workers cross the
>>    LLC size.
>>
>> o client-server benchmarks where client and servers are threads
>>    from different processes (netserver-netperf, tbench_srv-tbench,
>>    services of DeathStarBench) seem to noticeably regress due to
>>    lack of co-location between the communicating client and server.
>>
>>    Not sure if WF_SYNC can be an indicator to temporarily ignore
>>    the preferred LLC hint.
>>
>> o stream regresses in some runs where the occupancy metrics trip
>>    and assign a preferred LLC for all the stream threads bringing
>>    down performance in !50% of the runs.
>>
> 
> - When you have SMT systems, threads will go faster if they run in ST mode.
> If aggregation happens in a LLC, they might end up with lower IPC.
> 

OK, the number of SMT within a core should also be considered to
control how aggressive the aggregation is.

Regarding the regression from the stream, it was caused by the working
set size. When the working set size is 2.9G in Prateek's test scenario,
there is a regression with task aggregation. If we reduce it to a lower
value, say 512MB, the regression disappears. Therefore, we are trying to
tweak this by comparing the process's RSS with the L3 cache size.

thanks,
Chenyu

thanks,
Chenyu
