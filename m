Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BE11E4110
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747171598; cv=fail; b=cBvYzEFpN82GNZ3CGFHOdiIEG90PSMdIC+jqJHDMH9kb4KxiFWzRw92rJapxVA2GuWQHOaJsEU8qFWu2Psdw9elxTZ2Ir7Y2UvKgVSDLg2nmrAsUQ/VptVERTBqKCN383GXrrTm97/1PLE50tkjjMz2HaWJu5Wx6293wUbMF2bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747171598; c=relaxed/simple;
	bh=cghjMup7l71ikoK6FYojgrmBrhTSD59fjuvXnhTSs5k=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RwXzw8pTbUkdoUbPTpdgf9duxWs7fiBZTelSnzJX/nRD7p8J12RWMi1LrfNgAsOUpc02GFIMxfn9u4nsn6PMcqlUBJimCpqWJ0FNbAP4q0vVBWMb7q2uLQoikoF7taah2Yp77vmIDz2+NJHxXZNy+WDPCfg6lg/+lXOcxuVG/VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KgDxdAzk; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KgDxdAzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747171596; x=1778707596;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cghjMup7l71ikoK6FYojgrmBrhTSD59fjuvXnhTSs5k=;
  b=KgDxdAzkVfUJ7T/q57GDrFZIRV/+Ujx4xW6jlRlvFFWV3+p6XsmoA66S
   FZZuYgdFBv1w1Ws+xqgYQdBXb3uHPy4dC0so6/cUARGXeIZ6NyYFjCPr/
   hRb9/nVurPdslHtU2hri94fz6nUS7sugM2SmhXHq6BVVlHYGTU2GzHdpN
   50ECTy4mJTpPYqnZtwdEZM/n+Wde+jGJgihQwURUKD9smUw8yWA0m3Lka
   Wt2ivCS7ucAQhZ8euvRT5MsmjduzbO25sN2PMUA41IKCZu8V+vuHxoTeE
   hXlbAmZBsTQfkfcfk6L/9RBmnN4GaNz5mizayNTHPMaqn0CSlFMNubPA9
   A==;
X-CSE-ConnectionGUID: j7nAY9G6QSC10Bz2GVR8lw==
X-CSE-MsgGUID: gw/T4lsCSA60hEzN2E4hEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59675385"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="59675385"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 14:26:35 -0700
X-CSE-ConnectionGUID: FJP7mhXlSD21P+PyVZEqag==
X-CSE-MsgGUID: TO5sBdpCQdCf1mpA0UE3MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="138340376"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 14:26:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 14:26:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 14:26:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 14:26:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vclRPG94zbSKncz7C0778PeVX8JbchPaIk96o9ydwAg+OHtGaOzLjPKLA81weW0OAqWB23gRRt/0fdc3IZiURGA0lhAI09LBmT/shulboOHmSuUTUln10OL4Psh9lM4NYFnCSoNKjFzmCIkHK4JAr+6FmJVIggv0WAZvFRDWWakzS3xhogu0G6YdzA9pb4H6p6JW+YGEF9mADAWUOgH4B/K/9S11Bt7H/+AysKOrAGX+j5xupr5dBq/q3swm0Eqkfg/4xroB9iWv8fAqhk7qNJ8G5/cW/Xspwhift1q5gSxfLvxg8xAIic+q/rHtKuxRX62b1LZu22dv6xRuhTPv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6uD+rIKzzut+DgjdAPLijEfzQk4v7UQNJgUuJAYjKY=;
 b=cmscxpn2Ve9nBsQTP6luv3k8V4muEQJx8tuJU0qYoeQKx7ku6rHWrE6OhNmyiOsM98UcOrFQAFrOK9C3JOdbxdxPTxAhaKBzHjGxQtJ71gk5AGS03IAlY6PZS2EmGK3rkxB9j3T4gmgVcMFoLL99TOfoy1AtXoskGe0nVhDrDRl4lig6b29RcM4ZgFlwMXWk3h9jFOMcLQKyrHeZeZNzBdZS9w8mLElrsRySC5FmPC347Tik42KdBhl31IZZci0nmYJbkFhXoB8WPREVX+HINcLlgFjd2jnQbRLaqL1X2I0Qv/Sk56hagx0ZzUti0Sq8J7ddoWKSOAEFOBQpij0pqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 21:26:33 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 21:26:33 +0000
Message-ID: <87bc7b73-aed0-4886-bcc5-b025a8444a26@intel.com>
Date: Tue, 13 May 2025 14:26:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 25/30] x86,fs/resctrl: Move the resctrl filesystem
 code to live in /fs/resctrl
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-26-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250513171547.15194-26-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:74::45) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM4PR11MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e25f38-4169-4827-7ec8-08dd9264d537
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0VpWm93ZHNwYWV5S2RMaERSaStJblJFQlBqNFNNN2hGSG9KMU5VVHIvVGVW?=
 =?utf-8?B?c1cvUGhycmtpOEQyM0NyMTRqUFRZL3ZxL2FPSmJBYVh3VkJsc3ZnaXZxUTBU?=
 =?utf-8?B?YXBOVmpjYS9TV0FCMjAxbXNDZU8wUGh2WE5ZRFBnbXFXbzYydU9ZblNBcGt3?=
 =?utf-8?B?VXRwSE10NmV4YkVpV0lSdWprSmg0a09MRmFQN2xRdng2dkJ5TDNUSFVZN0hp?=
 =?utf-8?B?WFhqc3pPYXRheS9SejZDcENTK1B3d1VleWpqZ3d2cThyaFR6YjJuR2ZsQ1R6?=
 =?utf-8?B?Rk5oUU5aSWVRQ0tWTlpqQ0lpTGxSUmpTb2hNSHYwcUxHKzdYZXdvUHVTQmNs?=
 =?utf-8?B?NFlMdXJxSmhIU1BMM3JUSUV0MkV2Y2xTd3ZZZ01PeVUwWW9DKzYwWWlrRkRQ?=
 =?utf-8?B?UlpnK25vRGV2bXhRNVJuOC8yQ2dOYnFydVZUaGh1OWR3Qm5nbnFWT3NjVS96?=
 =?utf-8?B?YWliNUNna2N1aVZOUmJPcGsxRUdaYUJuYnlOeE5RdUpBejZzV1JUSHVLUHpk?=
 =?utf-8?B?SW5FbVhJbS8xejFGVWpVK3dqK1BhcEM5S0ZGOG5ScTZRYUJ1eXI0a09nOWhj?=
 =?utf-8?B?ODhUNkUzM0VJM1JhYkh5ZUdnUGpLbHNvTk84K05CY2xlWEpQQjRoVGdXVHlJ?=
 =?utf-8?B?dnU0TmhOTjY4NTdrZ045bDgrVldBN1RUSTFLYVNuR1B0MkJPU3dTUzhhVlZz?=
 =?utf-8?B?ZUc0Zm14SHJ2Z0FHamI3T1pIVjFyUUFXTWpOUm5GdWN6S0M4TjVaMkFWMmxV?=
 =?utf-8?B?N0lXczhOZnNBTm9jVUlrcTZNVGVDZzJ5aWl2MGg3N0o5Z0dFU1J6RENwTkVs?=
 =?utf-8?B?WktldTBpWmErY0NZT1ZHQ0xERnBQZmhoUGxMMEZnYlQyTzc0dmdvdi8rWTFE?=
 =?utf-8?B?Zy9NMlFqdmkzS0FTNGRaUmpyYzlCS0I3U05pM2FrKys2TmtGM0RhRTNZcktv?=
 =?utf-8?B?dDd4Z1dNdkVzczAzVmJwOHRteHRKYTBpOTlPMW5HYXh2VXBvUklTczFUK3dq?=
 =?utf-8?B?bE9yUVc5bEh1NVpmcFMxY2JjMmVHT1FHTU53UlZjTDFKTWZxUGFMVk5qcU1q?=
 =?utf-8?B?TXJ1TVVLZ0hMTG1ZSE8wMitabm5FdU00a2ZnQUNrMXQ5Y3J3d2xsbndHbW4w?=
 =?utf-8?B?cWZCWnFYZnR4R3dRQmJKcWszSlRNK2djbnhuZnFzenN1NUFoZzcrNUMyVDJV?=
 =?utf-8?B?aVczLzhJV3hpY2l3eFhSVHorSlRYYTRjRHEwY0RlOVVsNkI0M1ZnRmY2cUJL?=
 =?utf-8?B?eTI3KzBiMjlvUmY4RjhRcjloRDFNb2w5V0EyTHZjLzRlYjdybEZtdENlTkcw?=
 =?utf-8?B?TWRTZ0xqcHZ2OFVFOW5VRmlwMHg5RDgyWFBHa0Mva0lDNXhycDdQODc2aWNI?=
 =?utf-8?B?ZXNuR3JtOVorcGdSOHRiazVkV0R2K0JtdnI4Ui9BbGtLZGc1bUhPMjhLSzhk?=
 =?utf-8?B?Y1RvWjRKRUZITVNzV3dycmRSZmh1YXZUdkg2WVdFQmFnRFBtQ255RUdsUlJS?=
 =?utf-8?B?NUpXdmhUQXZlRjZTKzJxRzBja3dPZ1JvRWc4U1ROL2FKTUhYaDZPdXRQVVMz?=
 =?utf-8?B?SHVDT1hUMVpzbVhJMnhYZVdZUzBzejdYNmRKREowaHA0UThUNE9nSU52Z3Zz?=
 =?utf-8?B?RUkxMEJNTUM4Y0xBTG9oNm1nVXpnbnBuSDBpMHpkeXozem9FaC9MQ0pKQkJK?=
 =?utf-8?B?b0lQM25lbGNXZk41NFgyOW1ZOWM3YzVQcjR2ZlpSSVVHNDJqdzhqZEFIYnNM?=
 =?utf-8?B?YlQ4eXFKT1c1dC9CMkN4SG9YT0JQZ1Q0b0N4Si9HeFhxMVhzTjJDYjgzb0po?=
 =?utf-8?B?ZmI5UFdtVFBMcmtUMGRVbFBoOVNvanprOTZZQTJqemJ1RHdWck1OVFROc0lD?=
 =?utf-8?B?YXZpZ2J2dlNBRng5cDhITWQxMzY4Y2w0S0tmRWdyQzlSa09iWFJOTU1pZFZo?=
 =?utf-8?Q?C8KeT1QkNTM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGs1enBSOEllWkw0T2dUdVhwZzRwWkpUR0hwMjRpOUgrKzhZYWNsaU94MDJE?=
 =?utf-8?B?SFAwSFgwcGI0WmVGeWlLclE2eUxvUUZpZHVudHZxYVlBSi9FQTFYdm1xLzlE?=
 =?utf-8?B?aDhNL1BKcEg3MGtNSnpMb0FlNHF3NndOcE1Eak4xQWtUTmJ6dkRRL3BSdzg5?=
 =?utf-8?B?cDB0WEx5U0dROVJkQk9GYXAwWXVFUHlqT3htK2s5ai84UWY2WTRWNlNTdmhE?=
 =?utf-8?B?RmdRcUdYZ1JvWDZxTmRqbDV2Z003aW85ZWNPdlgydFJ3Y3NUeVdxK2NQNFV4?=
 =?utf-8?B?T3BtOVh3SHNBWGs1SU9IRzlKdkNYb0NxRVZ0dnlGbGE3QUZEQk05RC8wcUpv?=
 =?utf-8?B?NFRnMU05K3A5M2VGdE5qS1o5TlJmL3hFSEM1bWgxdSs0MlVjQ1IyZ1UvNVdJ?=
 =?utf-8?B?dkJwNXU1QlVkQW5GWDUxa20xZjBhcklFVzh5U0NUa0JYL2FnbncyRWprSS93?=
 =?utf-8?B?cjcxRnZPdFQyY2FMOVZXdm1mZ24yank1OFpSc0dwMm4xRXF6RzhsenBvTkdT?=
 =?utf-8?B?em5OSXFSMmlCNExXeWl1M0FOUkZEOEQ5bVpjQlMrSCt1U0xBS0ZXMG5BSlhI?=
 =?utf-8?B?UFNZc3Z0YWZRRXVjWmNHeDJiRHBSbEJFMGVMRXNuNnZyZVA5aFdvbVd4bzFB?=
 =?utf-8?B?cFQ2QlNHNk16T0FONy9GSVJkSzlNdCtrSmZScXJLL2NsTFJBT1JtOUErOVNY?=
 =?utf-8?B?cVBIclFmZUxCM09ZaEZOZ1V5R0RHVTZXelR2LzRleEFUUzhDWjlmQ29BSEN1?=
 =?utf-8?B?bkUxb3ZmLzh0YnJ5TS8xcmRzOFJFV0M5TFJXZ1BVZGkvREREMFd1aVpZRDB4?=
 =?utf-8?B?eG9iRDZ6K3FKdElGSjNnQTVROW9QcFh5cGJKa2l0QnNpV3hxZjc1YXFDRWl3?=
 =?utf-8?B?UVhZVzVuM2lrMlNuenBPbmM2Kys5MUZ6NUgzS0kzek4xRkI5bEZ4aE56MmZM?=
 =?utf-8?B?YlFRcmo2aTkyMWJSNG1VY1pvbGlsRzZJdHhwaFhJbnZNcWFld05na2o3cldK?=
 =?utf-8?B?bWhPR2NhelJzaWZJRVFWUVppS0thc0hLeitzY2hUYzdBeXQyK1dzRGI0UHhn?=
 =?utf-8?B?dUFYdVkwMFB4MzloaUp6Z0s2RmNPVC80cmh3aHhQUFlDdGU0cUtNV2NkYjZ6?=
 =?utf-8?B?TmJRZWxvaEh3QmRzdDlDZ2ZLVVNXV2JFaHQ4UlBIakZNMG9MTzMyNzdCaTV2?=
 =?utf-8?B?YkUwTHlKTythQnpaaUkxeEkvdS9LTGhudWl2RHJCUEluUjlqYmp2M2tNdXpV?=
 =?utf-8?B?RFhjSEJPc1JqK0RtNm9WOWF4VjljNE1veERET1FmWGswUCsyUUhmTEJMWkNC?=
 =?utf-8?B?ckdwMkxHWGtJeVZlOWJjaGlzUzNWdDl0YlJaR0ZqVENFSklHUFpPM2RLdkdF?=
 =?utf-8?B?LzJjMHZpSTlQY1VtSGVmaU5mRWZURE9zdnliWVBwazBWdjc5dVowYXV4QmVV?=
 =?utf-8?B?TmRKYlRlcE02SjI2M0RVdHVSUHRTNXFFbVJoMU9waVhSOERwRmZzU0dIZjM1?=
 =?utf-8?B?VnYzengxSVJLODVZWnVoSG1ERWhJQTdMQnlta3FBZERnVWZ3TmRBUG13TmVY?=
 =?utf-8?B?ZlVZNEkxL2hHRXJtQTVFc21NMWEvMGVwVE1CNnVibU5jTVhpK2lFOW51cjFw?=
 =?utf-8?B?WStyallxZzNZNWZKYVFMZFZBUy9OSVhxNGhhVzhHeEZQVkZJMzZsTmJaZ3N0?=
 =?utf-8?B?VDBJa0dteVVMd2k0R29LNmN4OSswdUhSS1Q3RlFiY1dKMjhPNjI1K3AraDNQ?=
 =?utf-8?B?ZWxaRTlkNDV4RDYrK3lMeHV5TTdSalh5YVhZZURjT0ZVL2drSGx5SEtEdnNI?=
 =?utf-8?B?Q2tEZWJVUzN0dVRjMGM1cGgwTzROZlFGMllOMGZmY29XdDlOR042aExLNGhw?=
 =?utf-8?B?WUxtYjBsUmdjNHRLTlp3RUM2U255VHdKUWl6ZnZ3WEdVWFNjdWZSRkhOQU9z?=
 =?utf-8?B?NW12WmZldUl0RG1tMC9yUVdCVURHQ0N3MW53YlJKbWtySFhHanBhdGhRSVdK?=
 =?utf-8?B?dzVxdE51K2RlS1hYYWRVTDhpcDdlYTVvVUQ2M0FqKzA5VmRoeGNIQTFGVCtT?=
 =?utf-8?B?WHFSZnpjallmSnpWQUVpY1VhQWs3T1U4MXphQlltQzZCeVpLL2tKOUErWjNO?=
 =?utf-8?B?ZEo2SlhVSGxXcVNFcUZseVVoZDJGODlRRkdpOFJ1VGhETlFWNjlCUUhDNHZF?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e25f38-4169-4827-7ec8-08dd9264d537
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 21:26:32.9313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WarmNiUGZjhjETlkDVXXeGG4riurauhrbOTCLDuoip6eQK5eNI8aKw5/Dw33NdKUaBOq4ZVIp3x0m1Y82GvBJRJuXZ2e9Ify23R4sYM3Lmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
X-OriginatorOrg: intel.com

Hi James,

On 5/13/25 10:15 AM, James Morse wrote:
> Resctrl is a filesystem interface to hardware that provides cache
> allocation policy and bandwidth control for groups of tasks or CPUs.
> 
> To support more than one architecture, resctrl needs to live in /fs/.
> 
> Move the code that is concerned with the filesystem interface to
> /fs/resctrl.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
