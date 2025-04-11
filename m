Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0FC1F1906;
	Fri, 11 Apr 2025 20:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744404582; cv=fail; b=uXuggz0f6C9bYUuArHAsBv0VGX25utVLHKq6/kBdyOiStZhYfUT7BUYN/opV7tiegmCBBA3ivEEocsxSueqw5c9ouiEIDchTVrOVq910TWIHiCC1x1/NSKIKGpTt8RIzmw8kA2oBC9Jv18kQT6ZglFZ8N7+N7W7xSHHB/1232as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744404582; c=relaxed/simple;
	bh=BLLWwQgK0+g6EYT2qbc2XAhcoZX+DDRKogoHiMFK/5w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wi82Vjt5LbVaYi0H0QPzEN6Ku2vzS5QM3yRGN8YUI8AvjYuAY+Jhdiofh09fowFT1vWVEp+Zhpd8eI+O/jy0kruo0R7arIdsvk4661J8it4o26eoHTxOwRdC//mnlDW+ZlQbZdWYDLcownczbqkENEXn3gDTD1IIOkG/YNsjaI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIkOKFMb; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIkOKFMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744404581; x=1775940581;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BLLWwQgK0+g6EYT2qbc2XAhcoZX+DDRKogoHiMFK/5w=;
  b=BIkOKFMbEgma2vDJP45aPWWLHFaTflOKwqEnqwW3PThTLIyetNhVNEUG
   JCWHKQyOa8UHM27t7QKOix3X4dZ71L3wgfUz5iYn/NZcP1vX4hDAOhiY0
   KwFUJTOBSgmmhmEpt4qQnHpOXDEn6vjOv4T0RE5mnriKVpRvKJcn1ADCX
   8QRR8wcfdD5JFWdiP7+iG5zF/08gz3f8KfGrTDBfyxXrUY+qFkIPI7h28
   JdcwCmgVqYaobTGe3V5WhyCSKHIoKqCmNTaNcSFCxktwofqMP7arlRhv9
   5UJzmXVE87b75xMBp+/xi2sFlC8DetO2uaiLvomUK1MQM3j1rnazv1hJS
   g==;
X-CSE-ConnectionGUID: S9GDtL5TSwibLw5E5qVhbA==
X-CSE-MsgGUID: 6USaBdsuQUC/aKIn5KCWfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="48671861"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="48671861"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 13:49:40 -0700
X-CSE-ConnectionGUID: u8vZoYDaTO2Kp1K6+29a9w==
X-CSE-MsgGUID: l4MDAKhMTo+5eSEDXZBoZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="130276544"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 13:49:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 13:49:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 13:49:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 13:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgeEc2fku+esKlGywaOiubpM+stM1TSGfdtkucbPsfyMdK13+mdLKty5DqHcwgfPPWviyQZ/xRiN+B6plJAJCDt8IulFBg96JBpO2bHGuwELJ651v67v97vq4Ugztdg9Y9zSaZW9Ve6iDwQ4TMLuEY87f34jsw8V83z7XFg0IV7ljqENJ9ieYWf6fystyhoMc3kAbKQj+2JapbpOdHmZ0IuhmqjiqzLos2v+bi8c9HHtC5/2AaSWHKbv25o6vCUVXePrlvAcOzl44U/fm+VPBgIeUO+BgSu+WkrnNncKfAkM3sW3XDAHj0NrnCv9FX63iwxOlXfGScwaKKAA/RegNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EYZIJBhUR5MGoIcZ/SXELWSTvmF/P3YD78HMO5cnP0=;
 b=w/kxn2xDrykCG7j6IkNJSkMJgX4y/EoVqSZZg3T6pxboge1zcS4GrBWILriT7SGfrK0zoRQ+9+fp2aKSXa1apvekJI8jMjMAmHqPH2yFfiPfAcH4wjVkLxDzikTcLyeDGWlnzQ73MjPzkugNZXExGDKc2Hkex7cBjgUXKlDuqUalXJ0ExybVQ1lXB3y33KY3z64DbOLORSpR7VYR/VQg+OoZ7rYUHZULxW0p1B7dM9J+AWmlRbqhKjzCgrU1MMI2VXlJjjNYy0FTz2jRB/IOkil/wAd6qyKdf5XB/8E2oX4ki88GyqjDP+q8qBDorT8xdJs3WJ7Vy13g7U/2qTpaiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 20:49:20 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 20:49:20 +0000
Message-ID: <6faaa78e-d269-4391-bb42-5e9b936734f9@intel.com>
Date: Fri, 11 Apr 2025 13:49:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/26] x86/resctrl: Introduce mbm_total_cfg and
 mbm_local_cfg in struct rdt_hw_mon_domain
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
 <bbe371a2025d6f0bcd9151a9a4311f504c5a6a21.1743725907.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <bbe371a2025d6f0bcd9151a9a4311f504c5a6a21.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:303:8f::23) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|IA0PR11MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c48f3b9-f3b3-4dab-6092-08dd793a5531
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWR1RGx4U2xKNWpxSWZEYmNVZDNzemsxWUl3VGpKdzBRWmJrTmJwK0pEdlp4?=
 =?utf-8?B?QmJVMXNVUThxS2V3dlRpWU41cm55clpoaGs1VUo5U1h5WHFiTTc3dng0SWpR?=
 =?utf-8?B?Ym5yWW8yMWV2QjE5MXV3RkttVFc1ZFVXN3IwZzBQMXpMLzQ2dWlCSE84MW0r?=
 =?utf-8?B?dEV0bG5GU2pvTlgyZ3RsY0QyVzVTUEVPNEJBQXFTUnBLRURVc01uSlplaStE?=
 =?utf-8?B?cGhZWGZENU1zZWNOU1VkS2YxaDdDRnB5S0NGZEtXTVgwUkFSU2hFUVdxekt4?=
 =?utf-8?B?bjdiUlllb3BIUkVteFh6U3VseEJYQlRaTjc1aXlmTFRzZ2FkYm5FOGlKcm1F?=
 =?utf-8?B?TUhKaU1OdkVtNzFpcTIyMU5YU3VzaGNZU3U5OWNSN1JsVVp2ZlhmOHFWSjI0?=
 =?utf-8?B?R2NyZGlHZ1NJTmxCQWFEM1FjbHYyeEFaOFUyS0d1WXd2Y2dUTy9HRGt0K0N6?=
 =?utf-8?B?ZXpxK0E4azlqU3haVkgvL3VkYWlvcGJWY1lBVjFZLzBMaWZITEZCTE5XdHp0?=
 =?utf-8?B?cTRSQlJpOVE3TTVkUE1LV21SNDBSQUpoaTFXVzdHS2szQ0I2bEZwdWhsU2JX?=
 =?utf-8?B?bkZ4V3RiQ1RJOHA0dVJhbkQyMWZ1ek9MTFNmYVM3eHBMbHFYN0F0NlJleEVE?=
 =?utf-8?B?anpiYkNMN0dZZHdQcFdHajduUXd5TUNMekFqRi9PbTVIaGU1blhyQ1FZUnNM?=
 =?utf-8?B?R1pWUVBUY1JoZW1FbVF6Um1sVTg5VTJyMmR0bDlRSnE4ZnNDYlFNSGN4RXRm?=
 =?utf-8?B?L2tSbVk4ekkrNFRuSmQwZ2YrOEFYdWtBeWpNN0FuWlFsbHZJOHYybi9yd25G?=
 =?utf-8?B?Qlg5TktDa1ZZQ3hzVm01Y1NmY0JvMkxqcmw1QmpZMTJlMDY5a0ZrT2FGb2pV?=
 =?utf-8?B?SjZ3SzY4bGZYb3NOVEJOZHJ0OUw1aUl3ejBTMkRyVmZ2d2JEYjZmVXBXdmxY?=
 =?utf-8?B?dGJmbHpkYysrMmZra3Y5dGI3OG1jVUxPVksrY01Hem9oNVIxUzF1M3Z4UG5v?=
 =?utf-8?B?UjNUSkZ0a2pQcHppamIrYUNiQ0J0VnVHUDcrQzZiQjVvVVpYNHh5ZG0wazN3?=
 =?utf-8?B?cDRtQmR5dllUNlVyQWUwa2sxWjd1L0JjTlVZbEFDUGdzblhSZG1HNGpCRG9E?=
 =?utf-8?B?UEVvUDFvY2F2QmV0M0xPcHBxandITUpZYUF1Z2w0QTRFc0hBMHFHYklwVE9W?=
 =?utf-8?B?U3JDb2hqRU9aSjZJSHFSbmlsK2gxNWYzR3pndUZYcmJpcGpGeGJlS1hmaDJU?=
 =?utf-8?B?VkppY0hmbGRzTXNiL3NRRFlaZDMxZjhNSFRIdXQ1NnFOL1RGZzBON09jT09K?=
 =?utf-8?B?SnJrdzJJQzNPdXRqV29IY3pXTFk5RE4vdEh3ZmdKc0VKN3o3djV1Mk0zcDJt?=
 =?utf-8?B?M2FGL1pCTzZ4c0NXOHpCckZJbllLSUVCeXQ2RHc2cTNFaU0rOEF6VVM4dTZB?=
 =?utf-8?B?V0FEVGNKZUdCYjlCUjl2S0dmSjBpSXdWanRybVo1LzdYdFQ1RWdYaDlsTitw?=
 =?utf-8?B?ZElBendMaHAvTjdweDVrZlBjMndwMzUzTnFIM1hjc0lHdGl0aXlyYStSKy9u?=
 =?utf-8?B?YUZDZ1pFQVVtUURpMG9BS25MZWVNZzU0TTVPbVNkZzdmazNaMDNXcFV1dDVG?=
 =?utf-8?B?aUdCbUJjRWtqNlhKNnc2Z3ExcFl4OVN0aTNtRXg5UytqeTZWSnJ5ZE1SVnkr?=
 =?utf-8?B?cEl2T0gvVFQ5UWhvb2F0YzdNWjRFREkxSVdXMHpZMlBMc0cwMkQ3RHE1ZGdv?=
 =?utf-8?B?S0ZrMzhlSElNamdicVlkRURsZU9tdHpJdXZCK0g5V0pUS0gwejEzZy9NY09p?=
 =?utf-8?B?K3BGaFJkTWhweGdXL3M2TWZnVFVKOVVMQ2xkemN2VEpDY1FseXk3UmZkeGdT?=
 =?utf-8?B?WXBaODNnMVZwQlcrblFKMWZDY2VKRUVaYVFGV2RrdUZ1VjJoRzkzSCtKbDg3?=
 =?utf-8?Q?1zWHLg7ft8E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkxhOW1MY0xJZlh5ZnZrMUtUaW9VaW1JT2VQc25iLzRPYkpXekw1SmFtVkRM?=
 =?utf-8?B?ODAzMTRVSktUOTFreGllWXFKZEwyblZJZDVFT0ZwamZiNXc5YU4zR21PNHlG?=
 =?utf-8?B?cUIvK2hJakFlZ2t2L3R6eEJTNmlIUVdsKzVSVmRWc2pIMGdrdkl1WVBsbFZU?=
 =?utf-8?B?dGVWVFFZTDJSNmQrSHdGZjJMNjl2UVkyaHhneXQ2YWtudXZQZTNuQ0VmaUJF?=
 =?utf-8?B?cGkveE9QS3J5aGZma1ZYZWpXa282bi9IY1dqeWxMVlYvRUhGcjd3Vkppb3Nq?=
 =?utf-8?B?aWxvVktXbUdwVG85WWJMc244U09xM0QrUWRodHRZN3VmaVZnR2FOYVVlVEtC?=
 =?utf-8?B?aTVRYldxWlhXZ0tmd1kyYndjOGNmT2wzSUx2NURvcnNzYldjcHNpbWJPMnRk?=
 =?utf-8?B?WFNkak5LV2lXbzdPSk1oSlhOMlhmd0VhLytIVjE1SFgwVWVQNGl6VWdtSmJV?=
 =?utf-8?B?ZE5mc1dDZmZHcUdWdDM0MS9NOXNQeXI1OStRRFVCK1ZySXcxcUJzNkNiVzJz?=
 =?utf-8?B?ZTZjdHIrZ0p6RzRCU09hZjU2QXFCajdkWUphVEpKSkxBSHZ3cGhTaDJ3U25E?=
 =?utf-8?B?bHlZWTNYUmFkeTh3MjJKTSs5YVAvRVF1T001QUtZWWFOM1JuQ2RtZUFvdzVS?=
 =?utf-8?B?czRvU3pVTTlzM1hFOFdDRTkxelVQTit0V0xmb3VKbGc3a0t6VTNqa1Y4UnNq?=
 =?utf-8?B?N2d3THpVVXEyK2YzT3AvR2gvdFJvVktGSG1tamdsMEdFYjhXK2Q1N0RjN2xE?=
 =?utf-8?B?TGVldjNBRHBVcG1uNUxlOTNzRWFwV0pUanZjb2Q0RkVQc3BzaGwwaHBXWW43?=
 =?utf-8?B?UXNwQUZjOVBxUG11bldGY1IxbVpaUVFMUDZNOE4wM2dyTEZ2UVJtbmVTQ2tF?=
 =?utf-8?B?RGk5YVdRMlAra1loK0lTb1lkcVJyb21sT2x3RjRlV2FFcmJPT252UHNjOEpp?=
 =?utf-8?B?aEc1ck92ZVRheG9OTjNzMk56d1hrRlNJTkFseEFGUVlVaVJqN0R0V1AwYmdh?=
 =?utf-8?B?U3RrelN6RlhnVTBlVm1qZEFsQVNRcllHNmZxZ05wT0hqUjB3eXdJR214ZTFk?=
 =?utf-8?B?YWhTYktmQkZrM0YxY1dEeG1pU1N6K3UvL3Vuby9FSnp0Y1V0U0lscGJiS0pk?=
 =?utf-8?B?UUFOanFCalkxZFoydUMxY0lkdUxlRzRoTFhnSTVSWnFSTTgrMnV6TVJGY24y?=
 =?utf-8?B?OW5zR2tNUCt5Y0MvWjEzNkZwSWxaYWNNSlhUTUp0ZFlUbFYzYWJJMmU3YlZw?=
 =?utf-8?B?ampHYU9jTW4vQjVBMlE4QU43dGp3YytQMC9udlhFcnZPZ1kyVWJPem0yeUIz?=
 =?utf-8?B?YjcwY1VJbGJwamFUcDAzMkg0QitBMmZxYWF4aUc2Q1crR0o1cG9oeEJaVmp0?=
 =?utf-8?B?MVBaeitUMkRKWVV2YmFNYVVLS1dHTlhXaVZYK1BqcEVSandRKzhtVitRQytk?=
 =?utf-8?B?TVdHdDVTQnh5b3ordGRpMVYzTDZWclNrTVhONlF0ME5qTDJ0UzByL0hwd2Jh?=
 =?utf-8?B?Z3ZHdGlndzd0ZzJ5aVhlSGpCYUFxT2NOTzVhM1FFV016Q0pUMER1SmdrdkFU?=
 =?utf-8?B?WUI4N1c5SVZNK0xLODUwelVzREs4b3V6T1pTeDMzNXpBaWh6RTFxTVZXRlpw?=
 =?utf-8?B?bUwzYTVOSkgzQmQxcnAyTjV6WHplZ1FJOVhLcUNmTG8ya3Q4M1RjYWYvZzB2?=
 =?utf-8?B?REVramlnWmJ3WFRlWndEZGlLcXg4RitseXdueEwyd241MFp3bFJYdVJMVDZ6?=
 =?utf-8?B?TlZrQVVOM2xtL0NYejhEbElGUlE4VmJGL1NzZ25GRStETWFnd3p6VmNlZ25X?=
 =?utf-8?B?MTBzKzVmdnJaUjVoYWtHM2JzRUUvSlJ3QnhpcWtKcGd5Z0FSbStnNE5LWUM1?=
 =?utf-8?B?WWxBcmltdzZpREpaNlB3L3N4U1BLKytuc3d2aEFDOTVQYlJFVUVFNTlvVmd1?=
 =?utf-8?B?RlZTUUZvcnRuVm5xOTZiR0ZmZWJFK3I3YU84amllSnlIVFYyNXkxTGQyL3JU?=
 =?utf-8?B?eXB6eHo0ZkhtWHNSSTlMckRJYzdWSlFuV0liZzY3MXoyTWtRVUt4Q2pGdVds?=
 =?utf-8?B?TXZCdHJuSEVra1l0YjlhcXZ1cUZ1d1NwMVI1eEVibW1UT2tkUkxPUTEzK0FC?=
 =?utf-8?B?aXVDUFBDTmxnWG1YYWxnbUx2QlMwRmZzcWtobmYvcFlndXprZ3BpUGRBMFQ1?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c48f3b9-f3b3-4dab-6092-08dd793a5531
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 20:49:20.3302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpEc/yB/9+EbSEqHUbctaJvfl5ubZGC3ti/9wxzCiD3crLSDKCsV136NdwZDBS6wQLUD1Ug00TTFDd5297mp+/Mg//cZKaX/H1T8t5HePTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> If the BMEC (Bandwidth Monitoring Event Configuration) feature is
> supported, the bandwidth events can be configured to track specific
> events. The event configuration is domain specific. Event configurations
> are not stored in resctrl but instead always read from or written to
> hardware directly when prompted by user space.

Why is this a problem?

> 
> Read the event configuration from the hardware during domain
> initialization and store the configuration value in the rdt_hw_mon_domain
> structure for later use when the user requests to display it.

Why is this required?

This series is about adding support for ABMC while this appears to be
an optimization for BMEC. Even more, as I see it, this optimization makes
resctrl support of ABMC and BMEC confusing (more below).

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v12: Fixed the conflicts due to recent merge.
>      This patch is for BMEC and there is no dependancy on ABMC feature.

Why still do it?

>      Moved it earlier.
> 
> v11: Resolved minor conflicts due to code displacement. Actual code didnt
>      change.
> 
> v10: Conflicts due to code displacement. Actual code didnt change.
> 
> v9: Added Reviewed-by tag. No other changes.
> 
> v8: Renamed resctrl_mbm_evt_config_init() to arch_mbm_evt_config_init()
>     Minor commit message update.
> 
> v7: Fixed initializing INVALID_CONFIG_VALUE to mbm_local_cfg in case of error.
> 
> v6: Renamed resctrl_arch_mbm_evt_config -> resctrl_mbm_evt_config_init
>     Initialized value to INVALID_CONFIG_VALUE if it is not configurable.
>     Minor commit message update.
> 
> v5: Exported mon_event_config_index_get.
>     Renamed arch_domain_mbm_evt_config to resctrl_arch_mbm_evt_config.
> 
> v4: Read the configuration information from the hardware to initialize.
>     Added few commit messages.
>     Fixed the tab spaces.
> 
> v3: Minor changes related to rebase in mbm_config_write_domain.
> 
> v2: No changes.
> ---
>  arch/x86/kernel/cpu/resctrl/core.c     |  2 ++
>  arch/x86/kernel/cpu/resctrl/internal.h |  9 +++++++++
>  arch/x86/kernel/cpu/resctrl/monitor.c  | 26 ++++++++++++++++++++++++++
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c |  2 +-
>  4 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index cf29681d01e0..a28de257168f 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -558,6 +558,8 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
>  		return;
>  	}
>  
> +	arch_mbm_evt_config_init(hw_dom);
> +
>  	list_add_tail_rcu(&d->hdr.list, add_pos);
>  
>  	err = resctrl_online_mon_domain(r, d);
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index c44c5b496355..9846153aa48f 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -32,6 +32,9 @@
>   */
>  #define MBM_CNTR_WIDTH_OFFSET_MAX (62 - MBM_CNTR_WIDTH_BASE)
>  
> +#define INVALID_CONFIG_VALUE		U32_MAX
> +#define INVALID_CONFIG_INDEX		UINT_MAX
> +
>  /**
>   * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
>   *			        aren't marked nohz_full
> @@ -335,6 +338,8 @@ struct rdt_hw_ctrl_domain {
>   * @d_resctrl:	Properties exposed to the resctrl file system
>   * @arch_mbm_total:	arch private state for MBM total bandwidth
>   * @arch_mbm_local:	arch private state for MBM local bandwidth
> + * @mbm_total_cfg:	MBM total bandwidth configuration
> + * @mbm_local_cfg:	MBM local bandwidth configuration
>   *
>   * Members of this structure are accessed via helpers that provide abstraction.
>   */
> @@ -342,6 +347,8 @@ struct rdt_hw_mon_domain {
>  	struct rdt_mon_domain		d_resctrl;
>  	struct arch_mbm_state		*arch_mbm_total;
>  	struct arch_mbm_state		*arch_mbm_local;
> +	u32				mbm_total_cfg;
> +	u32				mbm_local_cfg;
>  };

This introduces an architecture managed per-domain event configuration while
the rest of the series introduces a resctrl fs managed global event configuration.
I see this as the start of a source for confusion about how events are configured since
there is no further connection between this per-domain event configuration maintained
by the architecture and the global event configuration maintained by resctrl fs.

>  
>  static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
> @@ -504,6 +511,8 @@ void resctrl_file_fflags_init(const char *config, unsigned long fflags);
>  void rdt_staged_configs_clear(void);
>  bool closid_allocated(unsigned int closid);
>  int resctrl_find_cleanest_closid(void);
> +void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
> +unsigned int mon_event_config_index_get(u32 evtid);
>  
>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index a93ed7d2a160..abd337fbd01d 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1284,6 +1284,32 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>  	return 0;
>  }
>  
> +void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom)
> +{
> +	unsigned int index;
> +	u64 msrval;
> +
> +	/*
> +	 * Read the configuration registers QOS_EVT_CFG_n, where <n> is
> +	 * the BMEC event number (EvtID).
> +	 */
> +	if (mbm_total_event.configurable) {

Please keep an eye on where things are going in the arch/fs split.
mbm_total_event is private to resctrl fs and arch code cannot reach into it.
There is the arch helper resctrl_arch_is_evt_configurable() but I also
think that this helper needs to be reconsidered in the light of ABMC.

Overall I think this ABMC support needs to consider what already exists
for BMEC support and ensure that both are supported coherently. For example,
when a monitor domain has a "MBM local bandwidth configuration" then it should
be obvious what that means.

Reinette
