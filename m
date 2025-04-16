Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F50126296
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786943; cv=fail; b=cPBGFuh8WyWTIwfHt/ordriWUoyq+JbahUY0HoLisxleb0qRf78KxfcoDlgz12QEBcP+dTlovpHraFBVrrk0ii7yfvMXE/DVZdkcEnYO+6L1OG4rx1DsLg877WFtKgh7aHVf0fpFYqWbhaUrRJ/inO795lchsIUSAqPUHflDe+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786943; c=relaxed/simple;
	bh=4FkNzKydyB1G33ZJCeyVTfEYC1wuA3XNfEFwKosLe6Y=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jq4fXtR+zTa0sNPGAbf6cQXFuLkcViWz+PSUCCSRj0C7zpjVimCHkrroVx+ppZgEfSnh0NyNCjqzukiyV4Ole0qpyHALyU/1wm2SlIKQWeiBUOL+cMv+vUEW8wblfZmbNznDideXW09xB2elol+Qu8HuhSe//IyoFSIm77ylqZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmPn+HDq; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmPn+HDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744786941; x=1776322941;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=4FkNzKydyB1G33ZJCeyVTfEYC1wuA3XNfEFwKosLe6Y=;
  b=SmPn+HDqvEJdNHs3w68p6PDGypLrKdE8SCJb5C0G799LoOfqzYIpIzYW
   mRYZPYRulw0Wwm3eHyMlXRV88HeiOjc7IkVaaBquXy9Oudr3h8720APqG
   lpYi+fqXz7UvdVosiEOYtWmZZi2tTa1ledjdrQv2jt+D+1omBsnzN5sup
   MH2ZRIG9UOEa+es6UBeK+xl9ieud9LeEYIjs4E9gPD7QVuCLvQM76Jm9n
   jkH2S2suETdjVHOU3EebbF3Ftx4NzW3Lh8/eILUCL59CJDOMMEMk562jz
   JBTbIpMGlTMc/JIJukxQ+wgZPqqbq5G+aurjAJhPRn7PQtTvAMfEQbuCz
   g==;
X-CSE-ConnectionGUID: 3AcydQCOTZ6f//4Bjc4sSQ==
X-CSE-MsgGUID: 68MUeSamQ+2Wx7NCIS/6aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56983580"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="56983580"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:02:20 -0700
X-CSE-ConnectionGUID: PsVLCxkZSpeCrQJouLHgbA==
X-CSE-MsgGUID: 3OpL94l9T0+eksnHXxAjMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130668212"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:02:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 00:02:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 00:02:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 00:02:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7i2/VjSiMXrUFzsJ8w47QEpufea3umcsudYFUiYV4rOD3TfcV+XBxkzq6uLdCftvpjhFnv3pC/GB+G6+EgczoVCphabL1s/0uWlkWMeAlyjflipONSpIb7EElOCXqyG+hDMpT3UxXD5nJr7SlkQlCJmh/qysJlJvUhyJszcYktl8XRy5Rocm5GcsgEtreGadtWSupRC2Mxjz0ZuRbTcwtflfXeqJNRwGWDoiWuC7hj+ZYpgGTMxx3KbEXMdLRGyaLmw11Z/GhL56L9ib/DhKdw4Sf7SuXPmL1hk2HCKe6EAgLmSwAfJBLtu1+aVT4BfFp5KHpeRfascIeXU142jXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5/d7qXGmSzxxtxX95/1BaGYeugfZAFmK91a1iEtObA=;
 b=dbStoufrRbXR0H7rZhY2Q2lsOvLdEGrGL8+E/X2ZeB5XuEVTIMmfLRzowQmiK36R3gI9SCjsXxZOQW3rt24m5MUIQGJ0KKjPLuFJv14tOzQMMloLi8i5BdhtbIcH+LkniQnttIdQ7AOgPnOgpXIzzMn/aNwO7ZCQqIbbgaGzU4fxNrv1ojAEYjkHjx8/lkZcONe8g2/DbBN+3fCPp+WCyvqXoFfUZIq1gRor9/2kXDkLHG6KCp34fcZuV/LQoqmwaDwFnotIWtGZwAUAG0w2Vmm5b7RgA5aLA9NpbTtgZBZP2Iu8tSRGsjlVsqfRfzo7s1pJ/86xdynbujMXTkhECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 07:01:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 07:01:35 +0000
Date: Wed, 16 Apr 2025 15:01:21 +0800
From: kernel test robot <oliver.sang@intel.com>
To: David Hildenbrand <david@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirks^H^Hski
	<luto@kernel.org>, Borislav Betkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn
	<jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet
	<corbet@lwn.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Lance Yang <ioworker0@gmail.com>, Liam Howlett <liam.howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcow
	<willy@infradead.org>, Michal Koutn <mkoutny@suse.com>, Muchun Song
	<muchun.song@linux.dev>, tejun heo <tj@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Zefan Li
	<lizefan.x@bytedance.com>, <linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [mm/rmap]  6af8cb80d3:  vm-scalability.throughput
 7.8% regression
Message-ID: <202504152235.188dcce9-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d6b644-cc46-4cb0-53a1-08dd7cb486e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/nRP/xW1toDQyg7dSEQyE3HdjrIXhB/WqQ2fZvch9rZtI/A9MJfTTMNpC2?=
 =?iso-8859-1?Q?OHCL06ao2NwghL0IFsfudygdC7i9QI4nkYbBPyXsH7Np3nTtt/ga6xs4ty?=
 =?iso-8859-1?Q?pIYFx5bEQtcgY5F6MeVh7nzz6NXh2I/q6G05SJF7eYZm92x2hlrVrhv/wc?=
 =?iso-8859-1?Q?zaNiWrcgHLMPCNZk5/WLyHpHOpICn28GQVg2orjvTYWZSpo+cOHzqlB8gz?=
 =?iso-8859-1?Q?iENrkpeHRyFy+qpltd1l+a1Ph2Gq3rfLDmZdgQa1HtQM4DLPmOQrTwJXze?=
 =?iso-8859-1?Q?lKtoAsgIkB+Pk4WW/YHiWEPuvydCE4oGyhHf/t70/KRaVyeQ0xqAZNL1gM?=
 =?iso-8859-1?Q?X2bQ7N1JNB0M+/cdnrUcxp3seUppLsnM9yWf/tieZ74ZfdjRqZGzp5CXzY?=
 =?iso-8859-1?Q?BYrM37TA3s+S7/5t+P6oebyDlZPWsXkxNZ5+HLbkbBLZLyctFBBBPQj8co?=
 =?iso-8859-1?Q?z3rA3NuVVgnDpodAxgYV6W/UvOwvMgCS3n5Dwki8wka4PVUyloamjox05Z?=
 =?iso-8859-1?Q?ra0UI29pHBRCpJ7wdTNNl7nC2kD9XBN9KmFiuI999Do9gW4w6A6xfiKJOU?=
 =?iso-8859-1?Q?iHngEJkeRgjlW1p8GA9V8CPksPTn2XKOo3zqCt+fSXVlgo+3GE5UuQoED9?=
 =?iso-8859-1?Q?6HH3LvCFxbsi1GoIULQAv1IaFxodTzyZozhulPPfd2ZsKN31v8nb2fAwee?=
 =?iso-8859-1?Q?AyeElzzKzcNAWMVYpUGiDv0ttxAlwf1BmH4n+mmsPlv5t6q+pq7W7hHiBx?=
 =?iso-8859-1?Q?SUuZrgOLSpLQ8VDcVV3fENiiWeOu/9rDvsywKBJEhwgNTT4j6vHMuFa1qw?=
 =?iso-8859-1?Q?ZosBpGG7eR3jUKgiS4HnqZwxBXP7CUdJL/CP5HCauHQv9IxatmZZNsUkN9?=
 =?iso-8859-1?Q?GP3HoSmub35/MJfl6m6eNgjEoapVCDsICATyyVBHl9rrg8bUlwTFXVaReP?=
 =?iso-8859-1?Q?mNBgMcDU7/9NMQT/BlJ0Uq3Cwo2H0Y38YaI7s4XysTZ1DCa4USZ9rTMTcJ?=
 =?iso-8859-1?Q?jAXAKSyH5FrU69REE1nT7hZGCgXxpgcqIrssm2qKGtZ2zIzOD0nvSk+xVS?=
 =?iso-8859-1?Q?XAPej/mh9TRxbNlc4p/sklDvoDD48iRgfraFfXWnLGKoSm7ZF/+4BxDbY0?=
 =?iso-8859-1?Q?LFMOAEoswKOmaAudnhh1ReaT6qO/m1vGB8pdqeWLAJWJ3wLlYqBuSw9MWB?=
 =?iso-8859-1?Q?d8VOSLzF1+ZNY07NdxAfIWny2a7UZcg8KVGXY+gWOgCu7ZpzlV+C6CHHlx?=
 =?iso-8859-1?Q?YngpdFgS+xvbL/76Q/ev8ELI94qD5wEExKOzcs23hQP/D9dHbxZenehEn+?=
 =?iso-8859-1?Q?MVmaEzI8Rq9n3H9J2VoySfbWXb6QSOJjd0EMHkqJLNU9KhTqdcmCpI5Qw2?=
 =?iso-8859-1?Q?ezTtX2waGCc+XK6wDE2PpXIHsj0WP6o4F9Lz6Lu2b8gnLbP/1YpF71oPES?=
 =?iso-8859-1?Q?KPhrAiD6w0FYjytt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oVt0ajYhIiLNTrNeEbMltoclfM2/V9aN+Z/QJyoCCA5hvpsCq0rFB5QTB5?=
 =?iso-8859-1?Q?UY5R2fUvkqJQiY0nNfZr0jECgdUzfjca7BJVvrMp7n/2eUpYIWW/W2e8nj?=
 =?iso-8859-1?Q?1JQ9vDTSuov+2LpPd+V8p4AGsc/M0xngLU6qx8x3FQfLPcupGCSnFtGcCI?=
 =?iso-8859-1?Q?Lw3WY8q2gFUXxLSUoj2iNCUAM1CwhzVXdr1V/wTYBsIuf2uFXxRa/pgZo0?=
 =?iso-8859-1?Q?+3JpZTJEaRxyR/Z/Rm9NKyqD61e304W36Ja6d5M8XcRjSx+4QEku9Pu/5e?=
 =?iso-8859-1?Q?5xx1J09ljO0emWk5L2Ls8BFordtbvHUw0Pirgb5QY32R3C1qxTqiryOLoA?=
 =?iso-8859-1?Q?7toNwNfNBGNT4+bFSX915/IKeeeRdMZA4Y/5v/m3Wju9toE4GUTxgqBRcg?=
 =?iso-8859-1?Q?OPutQYHhMDDm+jz287jQmZM2Aotp08FS2dF7SUonm1XkuY74Bsp9zf7w1D?=
 =?iso-8859-1?Q?9YLhCws0Yw5rPSFqe7+hyNVCpbwMiH24ViYaFP2YTIVUEUpz92nTtRSRFz?=
 =?iso-8859-1?Q?a452eobYwz93IR/flXRUs7f7tpjoHNx0M5UiFBsY6Ex/zZP9oL3Ok60jxm?=
 =?iso-8859-1?Q?YXinzmRzCRmIv1j4ZsQi/jbr6LrAtnq0hrqZ7czF7PvQjnySuEM/8qmfBD?=
 =?iso-8859-1?Q?xbdOdIQ7kfotpUWHLG5lTQ9mcsAUrxCb53kLNEYaxoTUedzBWqmUCOZTIg?=
 =?iso-8859-1?Q?C888x2xNywyHIRxpZv+gsVeXqMdDiK1Y7D6hHvtQhd4ySXvweS2GXTIPFR?=
 =?iso-8859-1?Q?8s+glFo7gq2ClyMehMNq4140AwSxJhhsi6QHKXRPTR6QTVeMFP4BBMn//l?=
 =?iso-8859-1?Q?FWPiIQFnjz1OuWz4QX6W2S47Ew1+qz7rpiUKkDqPzGbSd2TM2ILr2dNRyO?=
 =?iso-8859-1?Q?eOUCXy3eCjQpRB5r2lCQi4nXFGhuzxH0BOlwBWShdi66pAEOa7bO4bKFiB?=
 =?iso-8859-1?Q?xOyKIq46YogY7eoZGj4H49Rw7A/Xn0Z0j6wbudMQ2cBYtxKvpTDBqbwHBS?=
 =?iso-8859-1?Q?Khnq4Tf4ldnGfBl3NcZhzlX9u8dasU+/7lT+mwQlhkxC8IGZ3x+k3g/SQx?=
 =?iso-8859-1?Q?Z3bzaWMeL31o8V4eug64czRn+yQZQALMgE2cWa8sRxihRRCiC+oTSn9+3s?=
 =?iso-8859-1?Q?XcC6/1fdyGQXcWfuLnmTWyUaLqJsGa/BAOCtKIEQk5T9VbED63Iop2OtPl?=
 =?iso-8859-1?Q?BR0+JpG40du9eC4Jw1nm14P0Gs76lEzybDhFZvYLiHIB+CP81eBeT2BRoI?=
 =?iso-8859-1?Q?HXu7e6Lj4RRAFFzbe4PJoiNdrww+zCajOAXpOvSZXCitvpldBloQnxEbLh?=
 =?iso-8859-1?Q?zq4iKz2dHW18mP7SJbc11xDH/ctSi9RxlRWWhwyMYblxt4z4+6GWteo3Oh?=
 =?iso-8859-1?Q?fSU4JOWxWMKINY5yFH2szxharbYimCo8qAXHHsREiH0KAq8l3DWPZsCmTG?=
 =?iso-8859-1?Q?Qd8CJ9MJHyaPncNh2poHCMUqdFAg5hUkjzqqzYQHkLOas4dySa9ROBTKzI?=
 =?iso-8859-1?Q?HtjS728mCX0fIryCcpH2Le4WqM3DJhLQxqczoLfg2AcKyoUvmBFZf56JtL?=
 =?iso-8859-1?Q?LdRTRvTTYvxObHEqTESwynL7w46S51WpWBlWGf5jZY1NQ9/P2UDXXOjxWx?=
 =?iso-8859-1?Q?bFD7hSkOd4AbyL9isfKKL4XwIVYHdKYMu5DWEuWMFv+F5mOud2lo0cog?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d6b644-cc46-4cb0-53a1-08dd7cb486e0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:01:35.7446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSe0nwbjCuGXWNQlhT01NiHbCJTuENOkHvLwahdcOC3mX6H5IYo4cslAeOeACWAo2eru9ePeUnsDgonFY93XsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 7.8% regression of vm-scalability.throughput on:


commit: 6af8cb80d3a9a6bbd521d8a7c949b4eafb7dba5d ("mm/rmap: basic MM owner tracking for large folios (!hugetlb)")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: vm-scalability
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory
parameters:

	runtime: 300s
	size: 8T
	test: anon-cow-seq
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504152235.188dcce9-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250415/202504152235.188dcce9-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/8T/lkp-srf-2sp1/anon-cow-seq/vm-scalability

commit: 
  448854478a ("mm/rmap: use folio_large_nr_pages() in add/remove functions")
  6af8cb80d3 ("mm/rmap: basic MM owner tracking for large folios (!hugetlb)")

448854478ab2f477 6af8cb80d3a9a6bbd521d8a7c94 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     53400           +12.6%      60113        uptime.idle
 1.457e+10 ±  3%     +45.8%  2.125e+10 ±  3%  cpuidle..time
   9999188 ±  2%     +41.4%   14142800 ±  2%  cpuidle..usage
     19401 ±  7%     -21.8%      15176 ± 15%  perf-c2c.DRAM.local
     42430 ±  4%     +51.6%      64345 ± 12%  perf-c2c.HITM.local
     52676 ±  6%     +44.2%      75955 ± 11%  perf-c2c.HITM.total
 8.894e+08           -15.0%  7.557e+08 ±  7%  numa-numastat.node0.local_node
 8.895e+08           -15.0%  7.559e+08 ±  7%  numa-numastat.node0.numa_hit
 8.879e+08           -18.0%  7.284e+08 ±  8%  numa-numastat.node1.local_node
  8.88e+08           -18.0%  7.285e+08 ±  8%  numa-numastat.node1.numa_hit
     15.74 ±  4%     +54.4%      24.31 ±  4%  vmstat.cpu.id
    214.36           -12.0%     188.68        vmstat.procs.r
      9162            -6.0%       8609 ±  2%  vmstat.system.cs
    359131            -3.1%     347966        vmstat.system.in
     15.07 ±  4%      +8.8       23.85 ±  4%  mpstat.cpu.all.idle%
      0.67            -0.1        0.57        mpstat.cpu.all.irq%
      0.17 ±  7%      -0.0        0.14 ±  5%  mpstat.cpu.all.soft%
     75.25            -7.8       67.47        mpstat.cpu.all.sys%
      4.42            -0.9        3.52        mpstat.cpu.all.usr%
  30105953           -40.3%   17974636 ±  2%  meminfo.Active
  30105953           -40.3%   17974636 ±  2%  meminfo.Active(anon)
  28734383           -40.0%   17245061 ±  2%  meminfo.AnonPages
  88649090           +12.1%   99375037        meminfo.MemAvailable
  89179467           +12.0%   99904712        meminfo.MemFree
  42488096           -25.2%   31762847        meminfo.Memused
  73422718           -16.1%   61622071 ±  5%  meminfo.max_used_kB
  14976533 ±  2%     -40.8%    8859130 ±  2%  numa-meminfo.node0.Active
  14976533 ±  2%     -40.8%    8859130 ±  2%  numa-meminfo.node0.Active(anon)
  14404444 ±  2%     -40.1%    8625820 ±  2%  numa-meminfo.node0.AnonPages
   2961490 ± 40%     -58.4%    1231139 ±129%  numa-meminfo.node0.FilePages
  43362532 ±  2%     +16.4%   50494564 ±  3%  numa-meminfo.node0.MemFree
  22336223 ±  5%     -31.9%   15204191 ± 11%  numa-meminfo.node0.MemUsed
  15156929           -39.9%    9115542 ±  3%  numa-meminfo.node1.Active
  15156929           -39.9%    9115542 ±  3%  numa-meminfo.node1.Active(anon)
  14334430           -39.9%    8615995 ±  3%  numa-meminfo.node1.AnonPages
  31426803 ±  4%      -6.1%   29506154 ±  4%  numa-meminfo.node1.AnonPages.max
  20191977 ±  6%     -18.0%   16564588 ±  8%  numa-meminfo.node1.MemUsed
    138520           -22.3%     107667        vm-scalability.median
      3.14 ±  3%      +6.4        9.57 ±  9%  vm-scalability.median_stddev%
      2.35 ±  8%     +12.7       15.05 ±  7%  vm-scalability.stddev%
  36255698            -7.8%   33421568        vm-scalability.throughput
    589253 ±  2%     -36.1%     376589 ±  5%  vm-scalability.time.involuntary_context_switches
 1.772e+09           -16.5%   1.48e+09        vm-scalability.time.minor_page_faults
     20491           -10.6%      18325        vm-scalability.time.percent_of_cpu_this_job_got
     58690            -9.8%      52967        vm-scalability.time.system_time
      3314           -19.5%       2668        vm-scalability.time.user_time
    423126           -25.5%     315143 ±  2%  vm-scalability.time.voluntary_context_switches
 7.968e+09           -16.5%  6.652e+09        vm-scalability.workload
   3752122 ±  2%     -40.9%    2218075 ±  3%  numa-vmstat.node0.nr_active_anon
   3604567 ±  2%     -40.1%    2157950 ±  2%  numa-vmstat.node0.nr_anon_pages
    740400 ± 40%     -58.4%     307780 ±129%  numa-vmstat.node0.nr_file_pages
  10838075 ±  2%     +16.4%   12619573 ±  3%  numa-vmstat.node0.nr_free_pages
   3751375 ±  2%     -40.9%    2217819 ±  3%  numa-vmstat.node0.nr_zone_active_anon
 8.895e+08           -15.0%  7.559e+08 ±  7%  numa-vmstat.node0.numa_hit
 8.894e+08           -15.0%  7.557e+08 ±  7%  numa-vmstat.node0.numa_local
   3814298           -40.7%    2260493 ±  2%  numa-vmstat.node1.nr_active_anon
   3602611           -40.7%    2135607 ±  2%  numa-vmstat.node1.nr_anon_pages
   3813553           -40.7%    2260182 ±  2%  numa-vmstat.node1.nr_zone_active_anon
  8.88e+08           -18.0%  7.285e+08 ±  8%  numa-vmstat.node1.numa_hit
 8.879e+08           -18.0%  7.284e+08 ±  8%  numa-vmstat.node1.numa_local
  29828859 ± 10%     -25.9%   22114899 ± 12%  sched_debug.cfs_rq:/.avg_vruntime.avg
  31729867 ± 10%     -23.1%   24394442 ± 12%  sched_debug.cfs_rq:/.avg_vruntime.max
  27439158 ± 11%     -30.2%   19146267 ± 13%  sched_debug.cfs_rq:/.avg_vruntime.min
   1805955 ± 23%     -31.8%    1231121 ± 22%  sched_debug.cfs_rq:/.left_deadline.stddev
   1805948 ± 23%     -31.8%    1231114 ± 22%  sched_debug.cfs_rq:/.left_vruntime.stddev
  29828862 ± 10%     -25.9%   22114901 ± 12%  sched_debug.cfs_rq:/.min_vruntime.avg
  31729867 ± 10%     -23.1%   24394442 ± 12%  sched_debug.cfs_rq:/.min_vruntime.max
  27439158 ± 11%     -30.2%   19146267 ± 13%  sched_debug.cfs_rq:/.min_vruntime.min
   1805948 ± 23%     -31.8%    1231116 ± 22%  sched_debug.cfs_rq:/.right_vruntime.stddev
    468.50 ±  5%     -25.1%     351.00 ± 24%  sched_debug.cfs_rq:/.util_est.avg
      1538 ±  7%     -27.1%       1121 ±  7%  sched_debug.cfs_rq:/.util_est.max
    291424 ±  4%      -4.1%     279460 ±  4%  sched_debug.cpu.clock_task.min
      1210 ±  2%     +12.2%       1357 ±  3%  sched_debug.cpu.clock_task.stddev
     24329 ±  7%     -13.3%      21085 ±  6%  sched_debug.cpu.curr->pid.max
      5671 ±  7%     -11.3%       5028 ± 10%  sched_debug.cpu.nr_switches.avg
     31944 ±  6%     +25.3%      40025 ± 17%  sched_debug.cpu.nr_switches.max
      3279 ±  8%     -18.3%       2678 ±  8%  sched_debug.cpu.nr_switches.min
      3073 ±  9%     +29.1%       3967 ± 15%  sched_debug.cpu.nr_switches.stddev
   7540874           -40.6%    4480163 ±  2%  proc-vmstat.nr_active_anon
   7192890           -40.2%    4298978 ±  2%  proc-vmstat.nr_anon_pages
   2209141           +12.2%    2479543        proc-vmstat.nr_dirty_background_threshold
   4423684           +12.2%    4965150        proc-vmstat.nr_dirty_threshold
  22285247           +12.1%   24987745        proc-vmstat.nr_free_pages
     45347            -1.1%      44832        proc-vmstat.nr_kernel_stack
     34897            -8.5%      31928        proc-vmstat.nr_page_table_pages
   7540867           -40.6%    4480162 ±  2%  proc-vmstat.nr_zone_active_anon
    144536 ±  6%     +40.8%     203521 ±  9%  proc-vmstat.numa_hint_faults_local
 1.778e+09           -16.5%  1.484e+09        proc-vmstat.numa_hit
   1475274           +57.2%    2319414 ±  2%  proc-vmstat.numa_huge_pte_updates
 1.777e+09           -16.5%  1.484e+09        proc-vmstat.numa_local
    267417            -0.9%     264919        proc-vmstat.numa_other
   1726476 ±  4%    +182.5%    4877430 ±  3%  proc-vmstat.numa_pages_migrated
 7.943e+08           +51.1%    1.2e+09 ±  2%  proc-vmstat.numa_pte_updates
 1.793e+09           -16.2%  1.503e+09        proc-vmstat.pgalloc_normal
 1.774e+09           -16.5%  1.481e+09        proc-vmstat.pgfault
 1.793e+09           -16.2%  1.502e+09        proc-vmstat.pgfree
   7187712           +18.2%    8494165 ±  2%  proc-vmstat.pgmigrate_fail
   1726476 ±  4%    +182.5%    4877430 ±  3%  proc-vmstat.pgmigrate_success
    180904           -10.4%     162040        proc-vmstat.pgreuse
     13401           -16.5%      11190        proc-vmstat.thp_fault_alloc
     14046           +18.2%      16598 ±  2%  proc-vmstat.thp_migration_fail
      3199 ±  4%    +193.0%       9375 ±  4%  proc-vmstat.thp_migration_success
   3430623           -16.5%    2864565        proc-vmstat.thp_split_pmd
      8447           +16.5%       9841        proc-vmstat.unevictable_pgs_culled
      3.45           +12.3%       3.87        perf-stat.i.MPKI
 3.587e+10           -20.3%  2.859e+10        perf-stat.i.branch-instructions
      0.06            +0.0        0.10 ±  6%  perf-stat.i.branch-miss-rate%
  16449735           +19.0%   19582727        perf-stat.i.branch-misses
     54.86            +2.2       57.09        perf-stat.i.cache-miss-rate%
 4.407e+08           -11.2%  3.915e+08        perf-stat.i.cache-misses
 8.022e+08           -14.3%  6.875e+08        perf-stat.i.cache-references
      9138            -4.7%       8709 ±  2%  perf-stat.i.context-switches
      4.31           +45.0%       6.25 ±  6%  perf-stat.i.cpi
  5.52e+11            -9.4%      5e+11        perf-stat.i.cpu-cycles
    803.00            -9.9%     723.58        perf-stat.i.cpu-migrations
      1255           +28.5%       1612 ±  6%  perf-stat.i.cycles-between-cache-misses
 1.278e+11           -20.4%  1.017e+11        perf-stat.i.instructions
      0.24            -8.5%       0.22        perf-stat.i.ipc
     45.69           -16.2%      38.30        perf-stat.i.metric.K/sec
   5871870           -18.2%    4801162        perf-stat.i.minor-faults
   5871868           -18.2%    4801161        perf-stat.i.page-faults
      3.45           +11.8%       3.86        perf-stat.overall.MPKI
      0.04            +0.0        0.07        perf-stat.overall.branch-miss-rate%
     54.96            +2.0       56.96        perf-stat.overall.cache-miss-rate%
      4.32           +12.5%       4.86        perf-stat.overall.cpi
      0.23           -11.1%       0.21        perf-stat.overall.ipc
      4825            -3.0%       4679        perf-stat.overall.path-length
 3.562e+10           -19.1%  2.882e+10        perf-stat.ps.branch-instructions
  15804911           +21.0%   19125930        perf-stat.ps.branch-misses
 4.379e+08            -9.8%   3.95e+08        perf-stat.ps.cache-misses
 7.968e+08           -13.0%  6.935e+08        perf-stat.ps.cache-references
      9012            -5.3%       8538 ±  2%  perf-stat.ps.context-switches
 5.481e+11            -9.2%  4.975e+11        perf-stat.ps.cpu-cycles
    793.13           -10.7%     708.06        perf-stat.ps.cpu-migrations
 1.269e+11           -19.3%  1.024e+11        perf-stat.ps.instructions
   5836046           -16.8%    4855858        perf-stat.ps.minor-faults
   5836046           -16.8%    4855859        perf-stat.ps.page-faults
 3.845e+13           -19.0%  3.113e+13        perf-stat.total.instructions
     42.65 ±218%     -99.7%       0.11 ±191%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      0.48 ±146%     -99.8%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_cache_noprof.single_open.single_open_size.do_dentry_open
      2.29 ± 24%     -60.6%       0.90 ± 36%  perf-sched.sch_delay.avg.ms.__cond_resched.__split_huge_pmd.do_huge_pmd_wp_page.__handle_mm_fault.handle_mm_fault
      0.25 ± 89%     -93.4%       0.02 ± 59%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      4.09 ± 79%     -92.4%       0.31 ±177%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      3.78 ± 97%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      2.93 ± 26%     -64.2%       1.05 ± 24%  perf-sched.sch_delay.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      0.82 ± 26%     -49.9%       0.41 ± 52%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      3.27 ± 23%     +49.0%       4.87 ± 14%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      3.66 ± 22%     -62.4%       1.38 ± 34%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.07 ± 23%     +89.3%       0.14 ± 62%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.98 ± 10%     +30.9%       1.28 ± 23%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    170.74 ±217%     -99.9%       0.20 ±200%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
      0.87 ±161%     -99.9%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.single_open.single_open_size.do_dentry_open
     10.33 ± 20%     -51.8%       4.98 ± 36%  perf-sched.sch_delay.max.ms.__cond_resched.__split_huge_pmd.do_huge_pmd_wp_page.__handle_mm_fault.handle_mm_fault
     11.45 ± 47%     -83.9%       1.84 ±145%  perf-sched.sch_delay.max.ms.__cond_resched.change_pmd_range.isra.0.change_pud_range
      1.13 ± 96%     -98.2%       0.02 ± 54%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
     11.78 ± 66%     -95.1%       0.58 ±190%  perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     12.61 ±121%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
     73.69 ±137%     -83.0%      12.50 ± 35%  perf-sched.sch_delay.max.ms.pipe_read.vfs_read.ksys_read.do_syscall_64
      1.00 ±137%   +1001.5%      11.02 ±162%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.folio_lock_anon_vma_read
      0.09 ± 56%    +319.7%       0.37 ± 65%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.__put_anon_vma
      9.93 ± 55%     -77.0%       2.29 ±104%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     13.75 ± 31%   +1908.6%     276.09 ±203%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      9.29 ± 13%     +78.0%      16.54 ± 22%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
    818.50 ± 23%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
    164.97 ±107%    +241.3%     563.02 ± 31%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      7.60 ±  8%     -16.3%       6.36 ±  5%  perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      9.12 ±  9%     +41.1%      12.86 ±  7%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
    830.40 ± 18%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
     15.56 ±  4%     -17.7%      12.81 ±  8%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      1608 ± 19%     -81.7%     293.67 ± 15%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
      2.50 ± 68%    -100.0%       0.00        perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
     27.67 ± 70%     -84.3%       4.33 ±134%  perf-sched.wait_and_delay.count.__cond_resched.refresh_cpu_vm_stats.vmstat_update.process_one_work.worker_thread
      3154 ± 20%     -73.3%     842.50 ± 17%  perf-sched.wait_and_delay.count.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    586.50 ±  5%     +26.4%     741.50 ±  8%  perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    426.17 ± 25%     -88.3%      49.67 ±141%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      3.67 ± 20%    -100.0%       0.00        perf-sched.wait_and_delay.count.pipe_write.vfs_write.ksys_write.do_syscall_64
    946.33 ± 12%     +48.7%       1407 ± 17%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range.do_poll.constprop.0.do_sys_poll
    611.17 ±  6%     +23.9%     757.17 ±  7%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      1027 ±  3%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      1553 ±  5%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
      5.87 ± 11%    +126.7%      13.30 ± 25%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
    498.88 ± 57%    -100.0%       0.00 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_cache_noprof.single_open.single_open_size.do_dentry_open
      3.55 ±169%    +514.3%      21.79 ± 30%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_noprof.inotify_handle_inode_event.send_to_group.fsnotify
      4.09 ± 79%     -92.4%       0.31 ±179%  perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
    814.72 ± 24%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
      0.93 ± 73%     -86.9%       0.12 ±122%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
    165.07 ±106%    +240.8%     562.58 ± 31%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      6.78 ±  6%     -12.2%       5.95 ±  3%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      5.85 ±  5%     +36.7%       8.00 ±  8%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
    829.13 ± 19%     -99.9%       0.91 ±223%  perf-sched.wait_time.avg.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
     15.07 ±  4%     -17.5%      12.43 ±  7%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      6.88 ± 33%     -51.4%       3.34 ± 38%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     80.29 ± 10%     +31.1%     105.26 ± 20%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.vma_alloc_folio_noprof
    830.56 ± 44%    -100.0%       0.00 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_cache_noprof.single_open.single_open_size.do_dentry_open
      6.25 ±188%   +2184.2%     142.83 ± 55%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_noprof.inotify_handle_inode_event.send_to_group.fsnotify
     11.78 ± 66%     -95.1%       0.58 ±190%  perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      1020 ±  2%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
     14.39 ± 57%     -83.7%       2.34 ±137%  perf-sched.wait_time.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
     58.23 ± 39%     +83.4%     106.83 ± 31%  perf-sched.wait_time.max.ms.io_schedule.migration_entry_wait_on_locked.migration_entry_wait.do_swap_page
      1553 ±  5%     -99.9%       1.13 ±223%  perf-sched.wait_time.max.ms.pipe_write.vfs_write.ksys_write.do_syscall_64
     34.14 ± 80%    +138.5%      81.42 ± 38%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
    175.44 ±210%     -98.7%       2.29 ±104%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

