Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D125392F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646689; cv=fail; b=ed+dRMOR/SghiOR9yf5aNdxzpT7m5yTLjI1G1MFgRnFHcSeddwoR/Ga9YlE3uCvsSTbWUUl8ngCY/ZciWW+Wh4co3PeczMjj2yhlXMzVjUtlrn1ncyn1NsPTDGzs7Sij30HA3oG6aU2+IFJWCN25XGnRV8RdCY1VHxvNg4l8fYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646689; c=relaxed/simple;
	bh=5AmOyoV5NFYaSex64hNG/02JRnnwWBApY8dAtnRFvm0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VyU+Fr+Bv9k7EOHC/ljOnyRU1XJjaNLbe15Vd9p/Shj0NZshkYvDufZJQSQ2lYUWdj6dfWjMcSixx5rQuWIT6ss5Nt2fMblYCf3E73Z8Ut8+QSvzOvbeYBaHBhSSWWVIHwmvf9P/rDAvXk91yvwt6KQTcQD7BKSl0I9ykEOCuHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBTKErbG; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBTKErbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744646687; x=1776182687;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5AmOyoV5NFYaSex64hNG/02JRnnwWBApY8dAtnRFvm0=;
  b=bBTKErbG58VpTRPCRVkhYgSqsnImKAmJjvs7d7WKdweZbO9voAW7du+Y
   TIWc4P9eTt3cnY/IU5Ex7DEG1/VOC8WPxPL9IYg26/oNiH2rZ+L7jsRtf
   +9kD7QnWNAjb0jufD2Dmp9GLQb0LHn5nLMbUtOYV0Kd9fNEHT4LMtjO2b
   5mM0J+Ux49cUzOP/sDv/HD9+YtD+DMr3H9/bAr+yeUmtBGOSO57282M1l
   SkcM/A5gs1HvjZ8buo0/1lquUp/1jeibHg3moE3yOaW6nTbG3807xjLo8
   0UM/k/j3U1xhgcqXi6wqKcgWbMTaA9qFs3xZKxqgVP+ibWfYIGLpFcvBZ
   A==;
X-CSE-ConnectionGUID: zzFOmJ94QRKo+3vcCyr3qw==
X-CSE-MsgGUID: n/DQxvikR2eTgdMrmfnNUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57118214"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="57118214"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 09:04:46 -0700
X-CSE-ConnectionGUID: G9B6w5mkRZWKbqY20uAvFg==
X-CSE-MsgGUID: uOnfAUjAS3O7+Zgc8h6yWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="135023937"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 09:04:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 09:04:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 09:04:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 09:04:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xB4X6bt1YC4wfj/r+HnkvWmM7/joU/EJwF47YAnAbKNqUJf6UTnwWNJRfwQ5EkgwVIcR0APulSzbv4IJKv42LDTS9Jft9S9jjiJTMJKpnn+HY4t7XUP04xPOGlYftcuK0YN6N2f1xTeOnoZvPZOohqqgA30TU6DGBqUrWqkvhUw7MpSYVOV2Ilylqz8Q4yw8vQ3csqEe+q+ZDGLT/EF0nFxB3gJ7O/p1A9gTeXrB6uaAS3izPTRMO+3UDTvIBx5dfSkCbKRyP/rLV/cuWEplfDhc1QHs2ijaepOjhN4JiX/h56e1KOeo4TWnJqI+5TBkk42hgOSeY+KSmrH3dY4UnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AmOyoV5NFYaSex64hNG/02JRnnwWBApY8dAtnRFvm0=;
 b=XptoXYKA3uBMvxp4Vc9n8+268c/MvZHMUyzl1oM1SMFcqNlicNaZM4b6jpW+/XPZAMpIK8+hk8w9lZVpzeZEWPNZyEWhYqfTMj0SerLoVObc36/WPre6etB/jbg75GJCzmbbZpVb4Vv/Wth3Trc8Ro326Ac4zM+1tCR2s3NJkIpKdquLHPUfPfH+JOm/lsYSdbZONTvEtX1jdOGrSMGMrCbiGz79sbiZsWKATzjtWwLcu9BrZ0VnKvfzYwNFwjE+NPDafqGzml0dZYPJmvbR3aexEXBr5qGWrhrsZxngeAiB3f8YCuNXEOvewlxxU0EorXOQlq5hxp5GcNAAD8vlyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA4PR11MB8892.namprd11.prod.outlook.com (2603:10b6:208:55c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 16:04:42 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 16:04:42 +0000
Message-ID: <2dce14d8-55b8-451e-942e-5979f1454db6@intel.com>
Date: Mon, 14 Apr 2025 09:04:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/21] x86,fs/resctrl: Move the resctrl filesystem code
 to live in /fs/resctrl
To: Fenghua Yu <fenghuay@nvidia.com>, James Morse <james.morse@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
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
 Donthineni <sdonthineni@nvidia.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-18-james.morse@arm.com>
 <f4ab6c75-f6ef-4504-9060-8ca9ab38b0aa@nvidia.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f4ab6c75-f6ef-4504-9060-8ca9ab38b0aa@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0315.namprd03.prod.outlook.com
 (2603:10b6:303:dd::20) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA4PR11MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: db39548b-1003-4528-a1d7-08dd7b6e1132
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzlQL25qVlM1WGRVRmFZYzdCK1NzNmhnRXhyeEpZM0pvYzZSVVJnMldqK29N?=
 =?utf-8?B?L3BEUjdmci9vODdqbHg1azY4NFR4N0RJZUljNnVHMG9iVWVXK0xXcERKMk9W?=
 =?utf-8?B?WjVzKzc2Y1k2S1NwdTFMa3Z4ak5ycDh1dVlvempaSEpnMEVxcnpidmJyM0F1?=
 =?utf-8?B?RDF3YWpSeTBZQU5DZjF6aVZNQTA0b282RHZ1NUJMQW1tNHpuWVVtakJ3bnVy?=
 =?utf-8?B?WUFacWlFQm01eW9JMmoyMGxSbC9UMmR4OTVUc051RHB6eEE2a2toRSs2SFh0?=
 =?utf-8?B?b0w1Nml3dWpXRG5YcnNvZnM5QlJ2NmRDREkydEJ0RUlIRlBWMmk4WmQ0dnRQ?=
 =?utf-8?B?azR4OEc3MWtGaGhsYmh0M0pZNDZ6RzVDSXhBU3o4OHFKWEJ2SE1oYktYYjJs?=
 =?utf-8?B?VDN2R1U2WnVoeDBLc3hINnZPRWhxTFBVYkdMQXNlK2IraHJMRzBkNm5odHFZ?=
 =?utf-8?B?ZU5vT1QvbzRENkozcnQ3UGh6S2VTUlpIMEQ0cEJhVENLY1F1ZVFoRVFxOUkv?=
 =?utf-8?B?VnMvVFZ3ZWdLVW1SVzZuU3JHOHQ3RG94b282UThEQVpxekdtVFhiTStWQlVw?=
 =?utf-8?B?VUg4Uk5SZ09iNkVOVFJySUhsblBhUDVNVEYyZW9DMzhWREtQejQ5ZEVQaEF1?=
 =?utf-8?B?RlMxMlJQSVBaeHYycVlzZzQ3SkFkUjJFaXhRK29LL1J2b1I1em42dmxRQldX?=
 =?utf-8?B?YU1HM0JpUks4NXgwK1RveE44RkxQUElEL0g4WGU4bFp6UEtQNzZGdjgyd3E4?=
 =?utf-8?B?OERlc29RSTdHR01VcTdITmZ2aytSNERBSklRemY0aDNaSWRtL0NrMkU5UkNV?=
 =?utf-8?B?dDBpL0xzUkhwWnBFQjhVczRWbkVTVjNEZ2dCYzRuZUFheEhaTWZKUGZBRnln?=
 =?utf-8?B?VEJqMFo4U1N6amhZOVZGclZCWUgwRk4zNmtLVWRlVjR3TEdhdmQrZFBLUmlj?=
 =?utf-8?B?R3Z2R2lFYms2Z2N0OHpBOGorZHgzTVpBQ0p1Ym1ZV21SNlU5YUdOUDJVMEdD?=
 =?utf-8?B?LzYycmpQenVCQkVXV1haN3JQSGRPMjlFWTIvQklHTk80bEVMSHdmZEtCRzhq?=
 =?utf-8?B?S1BnZ09oNHF0MGd3RUEwL2hWcVFjano3ZzJqUUZCUnRySTcxZUg3aWZPVVh4?=
 =?utf-8?B?aE5tTmdKWVI1T0xzYUM1NDhqZisvUEwrWExDNDhzQytJZFVUWmMyVDVHb0kx?=
 =?utf-8?B?ME9IdkIvRHBTSmRzUDIrb0hBVEM2QnlGbVEyRGxzZjdKbzROenFBZ2FYczJ1?=
 =?utf-8?B?UW9DM1duU1FjQmVBS25vZ0hWQVp1TDN3Szh2ZHFUbHdzQ0c0YkdPaHVtVWk4?=
 =?utf-8?B?OEpnaGw3aHd0SHpUZlk5Zk9LbzMrd2JvUmsrdlRvZTZiRGIyQ0JhZVVMVWZM?=
 =?utf-8?B?TDRmU1ZoeGxPcGF3eXBvSm50TkJJQjJ0SHRxdU9oRFpxaFg3ZmpGaUNOdjZi?=
 =?utf-8?B?Y2NEOXBLM1psbURMSkNvWVFZNThQZWxLTFJiYnFhNXlRc01JNE11bzQzK1dS?=
 =?utf-8?B?YXRVYUdoM1c2QjgxMDZLWWpaSTVNdXdlQVJCdzAwUkRDRG9sT0o3NTlnNnh4?=
 =?utf-8?B?dmZKQ25zNTV5SjdkaCtVY1YwUUlyZHRRU3BjUmZIZm9JcEdpY1lWdlV1YWtL?=
 =?utf-8?B?OC9xQXdoQnRIYkJWVitKdlFXY2xURnRmM0c1ZTRONHdMQ1YxYllQV1RyS2NW?=
 =?utf-8?B?V084VElIQ2p0N0hpV2dUYjRZTEpUVHBhbE1wU1FXMW9leEwwbWYrQnRoT0FY?=
 =?utf-8?B?ZUxsZnFxT3ZxTFBjL2EvRTU1eVVPZmN6NzhWeFlpNFR6TkFIQmdBK2FEQ1lW?=
 =?utf-8?B?L0w2aURKck1uRXlsWGZrbDgrV2p4ZkVWVU9BaTJqUnVHaXlSYWVtNTNLK2p1?=
 =?utf-8?B?SHVBcng3SDBKaXBhNGVja1pGcjJEdE4wUnBCaFNPd1dXdkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTEySFNSQnB1SUxxSkR5QmcvYVU3M0RiVnZLRXk4aG9xcXFGY2l2N2I3dDg5?=
 =?utf-8?B?dkJPQXd6R2lRYnJzeWRaKzVGeGxMRk1lb01rQWtrZXFLdk05dGVmNkdNdG1M?=
 =?utf-8?B?ODZyMzdjTUwxeFNYbG8xZGU1SDMzcUtjdCtOdm90dlRiTlBXUFhDVFE1NkZp?=
 =?utf-8?B?cHZsM0d3MCt6UlVGQ1pUalhKclRYbFZKY3FobGFEYkNwR3pqZlZDOGtqRmI4?=
 =?utf-8?B?WjNxR3BUd21zelkxM3paRGd5RjBZSGhxUGZkcmJyOGtydnZOekRCMFhVRlFC?=
 =?utf-8?B?S0FYWEt0c3h0eG1wL2ZFMFJockZkTDlLN0pMSTJwOENKa3Z3TDdUTCtId091?=
 =?utf-8?B?Y2NaeEo2NnZFNGNnWHRCSGlXMDlGWUxXTmhTbXM2bS8zMkdxQ05XNkdmRnN3?=
 =?utf-8?B?WmF2a2ZGdkc4bys2R0RNRUo1Qi9TemV5ajBrTGZPWkJSQ290L0VqekhNZ3Zn?=
 =?utf-8?B?ODlKWVVwWHpFNkpYdlg3d0RSTGpXYjlkaGdBVlpiQzc1S25STUM2bjd2VFR2?=
 =?utf-8?B?TERQWHRVWGI4MlZZMThFamptV2RqNHJhQlU3dm0zcEZweGJvMW9kVkRKRTdj?=
 =?utf-8?B?M3VrdGdkZlRPUkExOGRYS1RVRUZRMXovRncwZmIyQmQzVFgvT0diVUt4OGdW?=
 =?utf-8?B?Uk5PMm9QcFRQTHIzRWsvOEFUalZRRmwyeHpuYitqY2E4ZThlWTJZamk4S0cz?=
 =?utf-8?B?d0I1Z3FOdW9BVkpKNzZQUWVXb054cXArSTZiRTBzNkdXWDNqeHhBaTNTblVK?=
 =?utf-8?B?T0NnR3VLUzA4cjEvcFBCVU5BdTBKZWNpTGhmM3NDYlpEdDhBVmoweHBpWnFE?=
 =?utf-8?B?bitMUCsvZ3QvWnhjQzVpd0tucFcweW9qRTJ5b2Z2U1F0OGZiTkx2MEVaWVht?=
 =?utf-8?B?UkVpb1VuNE9lU1h1WGhIOS83TUlCd3ZNUElMekE5UFZjUjlJd0IxR1lCM3lL?=
 =?utf-8?B?RXJtMTBKUjgra3MvaFZPSi85aytZSFhqOWFkS1FKN3dFdHZFRlhGMm9wTmJB?=
 =?utf-8?B?Z2dIYUo4MFh3cVRWSDBPK3NYZksrQy9NZy9WcHpEdkF3YlBpcjFTZ0x1TFJn?=
 =?utf-8?B?bUg4Wk5nR0NsSHM5RnI4YVBpem9GQkxud05HQ3hMYnZXOEQ3Q2UzOVVPRUNX?=
 =?utf-8?B?NEdpVG9OWVY2eFI0NTh3aG04alVzRjdReWpCTnYvWlFsdGU5TzVXbWErc0FB?=
 =?utf-8?B?bVVmcXhMWVUySi9wSEFwemhnWlFpV1UyS2o4VERSKzNjMWNCb1c3QnZoQU1J?=
 =?utf-8?B?TVVJa0Vxdk9DYzBrbng2azVWUVdBK2hDR0E4SFdqbnFmQkVBbmgydFljWmli?=
 =?utf-8?B?bURUN0ZzbzFHc3Y4amg2eU1lWEZnbkQwelBUa2NWbHdZSnlJcy9ZNFNCVnVy?=
 =?utf-8?B?OTl4TXhOUFhCYTZwblFPb2o0ai9oV1RLOTBuVXpsSThDbzNJUm1NL2tRb0k2?=
 =?utf-8?B?ZHk1akNjdHpoSDdiMVhwcndDS29vMThlbkxWR2s3aDVRakVEVXpCb05JSlQ5?=
 =?utf-8?B?L3doVXYyeXJnaTgrQWR1WVhtS2RZOU1YYjBKbzJUMklsRjhKMGI1MGFDY3Bh?=
 =?utf-8?B?aU13MXNFd1J0cWs1elM2clVXY204Y0tiMWlMYUppT3lpVHBFQncyRUFucHhH?=
 =?utf-8?B?bXZ1dzJkSmNJL0xmTWtPc1IxcEpBMUx3K2FjNDNiZU5rTXF5VndOZXRpMFFx?=
 =?utf-8?B?aFhRT25PV29Dd1pTSmFYVTQ4ZUNhZzluNVBlQkJHeSt5RGdBN0lrUGc5dkR4?=
 =?utf-8?B?NkVDVkgzbEZFSkNVZlREbUhpa05uTVB0UXFEVVVKaWxpQVZUTDByZGczRVNE?=
 =?utf-8?B?K3dyaG56MWNwRDJTSjFCNkJHNVFENlhSOHZzeGR1M0t2aXZhVnFyZDA1M25L?=
 =?utf-8?B?WlhJMXd1aWhubHl6R1BuNkRnTXptSkVaNHo3a3FEOEpqTkllNzFNUmNrM2dr?=
 =?utf-8?B?bjZQT3NXMGJMc01SNEVHS0tCSnJkQ0FCcHZUVXNFcGk2U2ZDVHVIL0k2SWZV?=
 =?utf-8?B?OGhFYjdud1VuZlZXL0xjdi96aCtKV29VT1JvaHNYRFZJZllBMXpsdnZZWkZG?=
 =?utf-8?B?c1NkL1VXdzJBQnh3MW5xa0ZydElnTyt0NWlVOWxUOEdndGptd3Z0U1VVQStT?=
 =?utf-8?B?d0tENTRaWkZIQlNYTzQvUHpaUHppb2svcDNYQmNET0pUWG0yNURzYnc4SmNX?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db39548b-1003-4528-a1d7-08dd7b6e1132
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 16:04:42.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R47GrbQkG7xjn/7Vr04gViWjhysagQJ0eXU+W3ZswnxElyAhmvyAkCqEWqc81ntyL5TzkOWzfAiisDioHHdKkLyoqTBs7UKq8cw+Fp5SZoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8892
X-OriginatorOrg: intel.com

Hi Fenghua,

On 4/11/25 5:18 PM, Fenghua Yu wrote:

>>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  636 ---
>>   arch/x86/kernel/cpu/resctrl/internal.h        |  380 +-
>>   arch/x86/kernel/cpu/resctrl/monitor.c         |  902 +---
>>   arch/x86/kernel/cpu/resctrl/monitor_trace.h   |   18 +-
>>   arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1080 +---
>>   .../kernel/cpu/resctrl/pseudo_lock_trace.h    |    2 +
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4556 +----------------
>>   fs/resctrl/ctrlmondata.c                      |  660 +++
>>   fs/resctrl/internal.h                         |  442 ++
>>   fs/resctrl/monitor.c                          |  932 ++++
>>   fs/resctrl/monitor_trace.h                    |   33 +
>>   fs/resctrl/pseudo_lock.c                      | 1115 ++++
>>   fs/resctrl/pseudo_lock_trace.h                |   17 +
>>   fs/resctrl/rdtgroup.c                         | 4313 ++++++++++++++++
>>   14 files changed, 7668 insertions(+), 7418 deletions(-)

This patch is huge. Placing a response in the middle of it makes your feedback
very hard to find. Please trim your replies.

Reinette


