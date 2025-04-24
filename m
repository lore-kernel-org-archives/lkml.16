Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8736A1F30C4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745459424; cv=fail; b=bUJKIZBHS/eNvVGZP5lw49+9Uvo7v2WAanCC2bIyZOP23Ne/Zc3hqj1aG6L29DZAgACo9A5MERcWu9w8xPPtI6cr1osZv624juwsSGrcfHugtP7Hq++RJvERmjl1SR07cJGhr1AOhXXTR7FOkxv37LDOXG0hAV0R3S8FzMFREsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745459424; c=relaxed/simple;
	bh=UrLmSGT/YmBNbPUnoC3VTBqhCmzxVut2n4hraFLnqXw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ShQJUAU4g/qWbii/RcW8qo9JIsu1y+20ma7jteIQik0G9n785gAPf6JXUficjEwMBopwQFmkL8tBlTzXQ2SYxw4OniF3AFhrEOJ+70EiaIounzrQZk/YGdPRTM8PpQrjIJkYIXusD7KwNb42icvbQM4fB2vcAGeQVrkYqx2Ed7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etIbofUl; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etIbofUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745459420; x=1776995420;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UrLmSGT/YmBNbPUnoC3VTBqhCmzxVut2n4hraFLnqXw=;
  b=etIbofUl+FVyg+ccCTMti05PO4cXp9OhUIYq7QUjZ98rAnHiI9awCPZt
   2sozYK9MGBSahwQ71kID3wep5VNby8ylJndNRGZ1ItJkRAXG7p8JLnrE6
   WWNf/j6nSvSofxyHNRsanlQjfsBIWgspgppPY8XobUy3vmDY86dsWBOSC
   +D3z+sksB3TSL2kz2AwHOZBzwZbOirg3vR+tkYRVE04wngszkPmivn/ji
   2yg00D7iu7oVUqXuVMdIVfQZU+yU41T/DNX/Ua7DzmCIOVQ7ZmEIS2MD2
   5DgiAtOnoSuh49gHCYbd/+8LNm0WRj/JvG1kKxismwDV+l8+38BbwQDpI
   g==;
X-CSE-ConnectionGUID: HoBMba4dS6ednqT7IPDOzQ==
X-CSE-MsgGUID: jouoRWtCRDahTryCQ4Q6KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64603778"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="xz'341?scan'341,208,341";a="64603778"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 18:50:19 -0700
X-CSE-ConnectionGUID: EEmFANUsQ5WtH1zJrVNMnQ==
X-CSE-MsgGUID: QzT6Jsy6Q6eOg6qhmGMS7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="xz'341?scan'341,208,341";a="133440383"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 18:50:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 18:50:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 18:50:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 18:50:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBugVasluBKbJ6iCSMxLmM0xkVT6JVNmneHCYi+hpOzPmkw4XEDtb4qmDcNZZ3tWiXdyhY31jMhHrlhOxILXYCJDllcxw7QiNuEvOGpyfoNOtlgtFLHLwGawMsvYBU9P6PZiH0zJ3LT7UPjQEQwfGNGpiu/ZI/MmmB6jV6nQA/30RD6rmEylnnBriqdnBWqdjzkkcVKRzmLX2FjPdflyS2W8pq7AZ4WMSFlPeu2CbRg3CDtMop5w5tAGvifLQrtBzZHTxJuNkMS5HbyQ4AuvRBRjtRpx9o1UkaHJ6EjiRHgbPs7LkIZULLQo78fTRLTu5xfKdeSeATWAFdgMUVmEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7dBivozYf4QxHCNiuJQAhad/mRfsRl7EW375ArFgwU=;
 b=E1rSsAoMLJ9ObJvrCvQPrg6MKktFT3GEgguHuTObre8FG6fUXl07yVN0A0pWivs1/5jiTSQBCQkwEsx+cuqBNHBSCrek0Yv8pqCa+GPvPpKwt3mTkF3IRD5i5Cr2x86WC1jAolAJvvKYDDQWOZgC5BmToSjvrOQ9tTFdMIgtiP8eq5tgY9v8owuOPU1WnZY1VlmUG4QtykkNelkA/tXOe4AHF628KO7zganWdYtU5wsXwrlza89dDHQJCq2WidsLvd4pc/VhXLnnFYIpeny5Dze2Ij9jj8Ktv71KS0qbDyQZd5aQ95gYDoWkJJOisxPT/hW5BDPTxVfB210q2afqBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Thu, 24 Apr
 2025 01:50:13 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 01:50:13 +0000
Date: Thu, 24 Apr 2025 09:50:04 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: [linux-next:master] [rcutorture]  ddd062f753:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_updown[rcutorture]
Message-ID: <aAmYzAsE6fPz5uaB@xsang-OptiPlex-9020>
References: <202504211513.23f21a0-lkp@intel.com>
 <9db0175d-eb50-4534-969f-35afaa677927@paulmck-laptop>
 <aAcixqijvHL2ihHS@xsang-OptiPlex-9020>
 <4d8dd409-259c-4775-baf9-e272cc5238e7@paulmck-laptop>
Content-Type: multipart/mixed; boundary="WlLO+KRu1U1slT71"
Content-Disposition: inline
In-Reply-To: <4d8dd409-259c-4775-baf9-e272cc5238e7@paulmck-laptop>
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN0PR11MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b866554-6a92-49fa-9a78-08dd82d25a8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d+Uzp5rdKhp34Q85BDUwzqkkBGkVQ7ra0/Tg6Ker027IDlwxq74jVtNebxuw?=
 =?us-ascii?Q?oMh+SJsyzPM11iqzL1fZ3i7mkDtSHHUdUukHsyA7stEGwAL2K3LVofWSFyo4?=
 =?us-ascii?Q?vuzaqBeMCmEAqiZ1i7H00P2b3TYE+WuaZK2pejdJEv2RfqVCedSmzJRbWwbn?=
 =?us-ascii?Q?z6SZ/4Q/tzlVBS+kv7XpbWOR8l8B/SENt02+QYxVkc7wmAJFKxT8hiRdtn2O?=
 =?us-ascii?Q?Wi7nEyytcj2NzaMieLp/VW5YKUfYncuRbUmHc3w/mrJZgqOCmnEF6CAGkO0t?=
 =?us-ascii?Q?l/47lZoDHBzd34Vc4XkdX5JIkXs0GrPulPDawFn+0+sxJjpwj6dENkKHnhtJ?=
 =?us-ascii?Q?dnqjkA5iJXVynhevIdLw8qzI5odZ9+tabZANjXM4waDxJeYyTTyHo8TfXcBI?=
 =?us-ascii?Q?Zp3HkvHgnJeBHQaNIOFuxsd3PTF+FHMfFeJybmM6gdev440UHSi9laZXxU1i?=
 =?us-ascii?Q?UdMzw+e9GnSi1NIbB6f91Emuv65VacPLpKUYPsy2rShWDagSPUkv2vw7IS0/?=
 =?us-ascii?Q?Z7R/PiwPXcatIAqwtsQqg7glazq85DrDiZDiTcxcMTLOC4GcgpwBY3cDEzNu?=
 =?us-ascii?Q?AS5HCB4nrfbjeiKqJJIcW7Bbbp1gHohJrnOyb1JyEBtBcWgLgj/izNF1B4QO?=
 =?us-ascii?Q?l/LLzvqlTAuvDvkyp8V2d9Y/5fVFEE6n1kMk3+ZWtRDU8t5s6+Zb5a8yPYiH?=
 =?us-ascii?Q?fKMoeXoTZMkcwl1ebOVMja5nmj7YClqR6DhTNMJYoRSJhInmor7Z0NjGHHp1?=
 =?us-ascii?Q?J56CL1/JDxXd9dYkgYgT1kY4ZkXETje4ZBlPW9Hbe5yOCDhrQ07FH8njhZzn?=
 =?us-ascii?Q?DPL8K8wXh8O7U4h9DeiWXz/yP5JeBGupv9KHHDJCGVXeqMmQFzIb/JaNNe2T?=
 =?us-ascii?Q?Ok74DSti3AAFVkKqgK5N5R+al0ixyjckCUE0OYtLLgSzEMIsPqeRf8wOQ62o?=
 =?us-ascii?Q?gphzQrKJDJ31Q+eBbJuelSHURmriZ/O6gHukK2oxxbyFI7QeT0o7npxExheh?=
 =?us-ascii?Q?VNGkenaVDEAp+B+NSmubsOUydNl0t/LVvf2l2B4YLg0KOaR3/v0UPMZwDs6+?=
 =?us-ascii?Q?r0pydqz4CQltCNi0uawYn2PfKDh5fHyKy4sbrMakD6ZxahceEcZDK0f4EMYU?=
 =?us-ascii?Q?AkvSeHpaNP2qt7VxBDaegweb5wX9mNhB1LV6NAU6OE7OybwJTHGrfIUhHJAz?=
 =?us-ascii?Q?u7aP2XRKBvpIeOgHqeLbEMAHX3ctIrLR0Qks8pFqi/HNBFO0x4zxRfV6Pq6S?=
 =?us-ascii?Q?TdBnd0iFaMSbZrGwu6nJAa4y/ZSs/x/uQ4LqtIOK/k5yhBa050IVMJ8RAm9F?=
 =?us-ascii?Q?jWYnyygx7X4ZJiYGY+ozAS6KnCk1mygXeENAhVtpTO32SCAujsD/XBBTPXdS?=
 =?us-ascii?Q?cFNmN9A5+RBn180/0xnXrc+bN5zb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FkiJtDijApZ/ni/L7JF22n2KBuPcikw7PewjOViN9cXLAxIuanHCKt9mRvF+?=
 =?us-ascii?Q?QIE18eZZhYq+CFTVulG7KCjdqt/jnka+FEJ5q+qcvdTeC2AWQIZrj8mf+ZGw?=
 =?us-ascii?Q?/BmxKtDPQmb2kUKC4KN7WlktK4v8Z0iou8+C5eSM41P7vUbYixDlA2S/sE7h?=
 =?us-ascii?Q?xjydbOTyIyq9plOF7dcxkJtETCC3dYmyuAUEtEOnS7TUS/0uyOUTJEZMDRRp?=
 =?us-ascii?Q?WCaDLvDNyI6VZly4Ai+TQx+FX+osVTlInKtkJdQA+w9QSvizV1Dig1vpkAxd?=
 =?us-ascii?Q?GJ76bFyL+z2f3RahjTRusY4xH4vHN4AAQMz9lGyWN8o58v+8woESY01PazPX?=
 =?us-ascii?Q?rce/11yQ/APrFy+WeTUuTbWCLT4YRxsJ1c4YintOJlbmJ7yfaIwrDAsiRq3o?=
 =?us-ascii?Q?KyB0LbyniL139xovU/OEee9ImOpd2hZc1x19F/y10pp3ZHvvo3ClS2xsPfae?=
 =?us-ascii?Q?wTMa2zJlU0RAZ+VMBt2qNCfN4v1xPPSgWFjRltYYlgYIuqeQ09ZibuuLS/vM?=
 =?us-ascii?Q?t2X/WFrF4wE1xPeF0nvrctQT5I/nX3PMsAYNyzZ+8LYppxTiZz4OOD45Tua1?=
 =?us-ascii?Q?COw6VvF5AO/CU+DVP4iHMAyKzQye67Mdjf7Z9D9TgDk84wXnv3luOItRwL97?=
 =?us-ascii?Q?YYHE414MYmoKSpfZeJ3j5NWbdoVDa9CSC0OTKviRzqziXC89oo0hP7Cs6LbA?=
 =?us-ascii?Q?oxqsxktqjxXUn9xLhP2mdBhIOmmXe6aYljG4mZL+3UDx9LiT3kVcWvLEkOp3?=
 =?us-ascii?Q?jNTAwK5kpGHViKgnxylIT/Q3d3fWQkypSWWNnTtxtSc9qcQjyh24WJ7jY8K0?=
 =?us-ascii?Q?F24xZmlSO9Q7jXlH5xqrqT2humM5Q4a3hKGKpt88V/JJ7fz6jUZaSy800VNw?=
 =?us-ascii?Q?xCqgei39ERp2dHhWUTi3hPZUqTNC4p5uCxk2Yy+RyLcDTpoj/6IamVEghWH4?=
 =?us-ascii?Q?B/QwEuv2AfE92+02gE61ECGdLVugoFZXutX/g/uxiBYG8h4BHZKwaUFlNhhp?=
 =?us-ascii?Q?cdYp3GHMGDuLN3vLEAYXr9/bJPoDn/HiO0G5oftxCIoB+nh0ZF324Bg+GlGV?=
 =?us-ascii?Q?uMKqp4HXv0O3bNEfKf8YPOgxhqu0ngeRTVV22rSy6d/5QqM/1NUyR/FHNv3g?=
 =?us-ascii?Q?2VtlWz90In2ia9gRDWRLEtFA9e2iVYz03rHxZ53BqobO5v+c8RAa0lHr5Pzr?=
 =?us-ascii?Q?94m+0c6pqTYpzjarLaXC0vGgNQASnNoa0BRPzggIbwqhBYPpKv+1P5/Y40X8?=
 =?us-ascii?Q?vAHMvY/QxZiQboc8vSuMSZFD8/bV2jaqAKYpkWBpRIUxs6/VdkYY4ov9y8H7?=
 =?us-ascii?Q?giIx85b9E6Tjv7udiMH38EEHi7aZdC8SWyHK327I2DNVnCgSzxAWw8Cphsjm?=
 =?us-ascii?Q?UzBLU2OGeb48NOXWkSaflKv3K8hsT1XvBaF3frSJN+bd2lRQVFelTsBTGV3q?=
 =?us-ascii?Q?5sYjndq+ozQDHpuk1kKn+g03DiQ3/OJdhXceGGnJup1SCXnnlQXJ+2Bzc5GR?=
 =?us-ascii?Q?+cg/LoQh3P+t3V41mO9+CDan2CIsW/aqKh/82jC4dC7W8qGpC+hm9Vlj4NO3?=
 =?us-ascii?Q?dhxSo+75s/H7BgC84yZBoLcSZXvu9ubGDbtGwxZosoepjg1uLa+PXkG9yueZ?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b866554-6a92-49fa-9a78-08dd82d25a8b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 01:50:13.3617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ebSUjZp1jPx0XmyZvDOb55P79+bGWj9wxfMM6q7xoWo1pj9VDOMiIplzFxpBTDP2MTp040yh2tvzwzwMPnbTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6206
X-OriginatorOrg: intel.com

--WlLO+KRu1U1slT71
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

hi, Paul,

On Tue, Apr 22, 2025 at 10:54:10AM -0700, Paul E. McKenney wrote:

[...]

> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-lkp/202504211513.23f21a0-lkp@intel.com
> > > > 
> > > > 
> > > > The kernel config and materials to reproduce are available at:
> > > > https://download.01.org/0day-ci/archive/20250421/202504211513.23f21a0-lkp@intel.com
> > > 
> > > Good catch, and thank you for your testing efforts!
> > > 
> > > Does the patch at the end of this email help?
> > 
> > sorry but the patch does not help. one dmesg is attached.
> 
> And idiot here failed to check for the exact same problem at the point
> where the timer is queued, so thank you for bearing with me.
> 
> Does the patch at the end of this email (in addition to the previous
> patch) get the job done?

unfortunately, it still doesn't fix, one dmesg is attached. part of is as [2]

but I applied your two patches directly upon ddd062f753, like below:

* 1c91d0bd4809f (linux-devel/fixup-1539a7e7b61a9) further patch for ddd062f753 from Paul
* 1539a7e7b61a9 (linux-devel/fixup-ddd062f753) fix for ddd062f753 from Paul E. McKenney
* ddd062f7536cc rcutorture: Complain if an ->up_read() is delayed more than 10 seconds
* 1b983c34d5695 rcutorture: Comment invocations of tick_dep_set_task()


I noticed there are some conflicts while applying your second patch, the
1c91d0bd4809f looks like [1]. there is no "int rtorsu_cpu;" before line:
+	ktime_t rtorsu_kt;

seems your patch has a different base? I worried if my applyment has
problems. if so, could you tell me the correct base? thanks!


[1]
commit 1c91d0bd4809f9f12e61f25d881a02f25c473702 (linux-devel/fixup-1539a7e7b61a9)
Author: 0day robot <lkp@intel.com>
Date:   Wed Apr 23 10:27:51 2025 +0800

    further patch for ddd062f753 from Paul

    Signed-off-by: 0day robot <lkp@intel.com>

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index e7b5811e0e456..14cc67d436c97 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -2438,6 +2438,7 @@ rcu_torture_reader(void *arg)
 struct rcu_torture_one_read_state_updown {
        struct hrtimer rtorsu_hrt;
        bool rtorsu_inuse;
+       ktime_t rtorsu_kt;
        unsigned long rtorsu_j;
        struct torture_random_state rtorsu_trs;
        struct rcu_torture_one_read_state rtorsu_rtors;
@@ -2522,12 +2523,14 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
                schedule_timeout_idle(HZ);
                return;
        }
-       rtorsup->rtorsu_j = jiffies;
        smp_store_release(&rtorsup->rtorsu_inuse, true);
        t = torture_random(&rtorsup->rtorsu_trs) & 0xfffff; // One per million.
        if (t < 10 * 1000)
                t = 200 * 1000 * 1000;
        hrtimer_start(&rtorsup->rtorsu_hrt, t, HRTIMER_MODE_REL | HRTIMER_MODE_SOFT);
+       smp_mb(); // Sample jiffies after posting hrtimer.
+       rtorsup->rtorsu_j = jiffies;  // Not used by hrtimer handler.
+       rtorsup->rtorsu_kt = t;
 }

 /*
@@ -2548,7 +2551,9 @@ rcu_torture_updown(void *arg)
                                break;
                        j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
                        if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
-                               WARN_ON_ONCE(time_after(j, rtorsup->rtorsu_j + 10 * HZ));
+                               WARN_ONCE(time_after(j, rtorsup->rtorsu_j + 1 + HZ * 10),
+                                         "hrtimer queued at jiffies %lu for %lld ns took %lu jiffies\n", rtorsup->rtorsu_j, rtorsup->rtorsu_kt, j - rtorsup->rtorsu_j);
                                continue;
                        }
                        rcu_torture_updown_one(rtorsup);



[2]

[  168.048387][  T796] ------------[ cut here ]------------
[  168.049342][  T796] hrtimer queued at jiffies 4294952214 for 200000000 ns took 1502 jiffies
[  168.050699][  T796] WARNING: CPU: 0 PID: 796 at kernel/rcu/rcutorture.c:2555 rcu_torture_updown+0x143/0x4f0 [rcutorture]
[  168.052702][  T796] Modules linked in: rcutorture torture
[  168.054084][  T796] CPU: 0 UID: 0 PID: 796 Comm: rcu_torture_upd Not tainted 6.15.0-rc1-00010-g1c91d0bd4809 #1 NONE  e0cf54ed16af150d49bfa95e1fe661f9e9161d42
[  168.056119][  T796] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  168.058045][  T796] RIP: 0010:rcu_torture_updown+0x143/0x4f0 [rcutorture]
[  168.059229][  T796] Code: 48 c1 e8 03 42 80 3c 38 00 74 05 e8 a7 1b 49 e1 49 8b 54 2d 48 49 29 de 48 c7 c7 c0 9e 5e a0 48 89 de 4c 89 f1 e8 dd 6a c4 e0 <0f> 0b e9 d2 01 00 00 4c 89 24 24 4c 8d 34 2d 68 00 00 00 4d 01 ee
[  168.061887][  T796] RSP: 0000:ffff888152bf7e60 EFLAGS: 00210246
[  168.062804][  T796] RAX: 0000000000000000 RBX: 00000000ffffc516 RCX: 0000000000000000
[  168.064097][  T796] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[  168.065436][  T796] RBP: 0000000000002a00 R08: 0000000000000000 R09: 0000000000000000
[  168.066674][  T796] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888150812a40
[  168.067932][  T796] R13: ffff888150810000 R14: 00000000000005de R15: dffffc0000000000
[  168.069302][  T796] FS:  0000000000000000(0000) GS:ffff888424c90000(0000) knlGS:0000000000000000
[  168.070729][  T796] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  168.071772][  T796] CR2: 000000000805b740 CR3: 000000014b9ef000 CR4: 00000000000406f0
[  168.073736][  T796] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  168.075050][  T796] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  168.076319][  T796] Call Trace:
[  168.076954][  T796]  <TASK>
[  168.077552][  T796]  kthread+0x4b7/0x5e0
[  168.079269][  T796]  ? rcu_torture_updown_hrt+0x60/0x60 [rcutorture e5c5209c38907516252542c1d07dd3e619a57f4e]
[  168.080832][  T796]  ? kthread_unuse_mm+0x150/0x150
[  168.081731][  T796]  ret_from_fork+0x3c/0x70
[  168.082491][  T796]  ? kthread_unuse_mm+0x150/0x150
[  168.083328][  T796]  ret_from_fork_asm+0x11/0x20
[  168.084182][  T796]  </TASK>
[  168.084826][  T796] irq event stamp: 90885
[  168.085562][  T796] hardirqs last  enabled at (90895): [<ffffffff815a4e82>] __console_unlock+0x72/0x80
[  168.086968][  T796] hardirqs last disabled at (90904): [<ffffffff815a4e67>] __console_unlock+0x57/0x80
[  168.088472][  T796] softirqs last  enabled at (90738): [<ffffffff8148ecce>] handle_softirqs+0x5de/0x6e0
[  168.089989][  T796] softirqs last disabled at (90729): [<ffffffff8148ef41>] __irq_exit_rcu+0x61/0xc0
[  168.091310][  T796] ---[ end trace 0000000000000000 ]---

> 
> 							Thanx, Paul
> 
> [ . . . ]
> 
> > > diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> > > index 3dd213bfc6662..53f0860b3748d 100644
> > > --- a/kernel/rcu/rcutorture.c
> > > +++ b/kernel/rcu/rcutorture.c
> > > @@ -2557,6 +2557,7 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
> > >  static int
> > >  rcu_torture_updown(void *arg)
> > >  {
> > > +	unsigned long j;
> > >  	struct rcu_torture_one_read_state_updown *rtorsup;
> > >  
> > >  	VERBOSE_TOROUT_STRING("rcu_torture_updown task started");
> > > @@ -2564,8 +2565,9 @@ rcu_torture_updown(void *arg)
> > >  		for (rtorsup = updownreaders; rtorsup < &updownreaders[n_up_down]; rtorsup++) {
> > >  			if (torture_must_stop())
> > >  				break;
> > > +			j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
> > >  			if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
> > > -				WARN_ON_ONCE(time_after(jiffies, rtorsup->rtorsu_j + 10 * HZ));
> > > +				WARN_ON_ONCE(time_after(j, rtorsup->rtorsu_j + 10 * HZ));
> > >  				continue;
> > >  			}
> > >  			rcu_torture_updown_one(rtorsup);
> 
> 
> diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> index abe48ff48f54c..7268e33086eb4 100644
> --- a/kernel/rcu/rcutorture.c
> +++ b/kernel/rcu/rcutorture.c
> @@ -2449,6 +2449,7 @@ struct rcu_torture_one_read_state_updown {
>  	struct hrtimer rtorsu_hrt;
>  	bool rtorsu_inuse;
>  	int rtorsu_cpu;
> +	ktime_t rtorsu_kt;
>  	unsigned long rtorsu_j;
>  	unsigned long rtorsu_ndowns;
>  	unsigned long rtorsu_nups;
> @@ -2548,12 +2549,14 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
>  		schedule_timeout_idle(HZ);
>  		return;
>  	}
> -	rtorsup->rtorsu_j = jiffies;
>  	smp_store_release(&rtorsup->rtorsu_inuse, true);
>  	t = torture_random(&rtorsup->rtorsu_trs) & 0xfffff; // One per million.
>  	if (t < 10 * 1000)
>  		t = 200 * 1000 * 1000;
>  	hrtimer_start(&rtorsup->rtorsu_hrt, t, HRTIMER_MODE_REL | HRTIMER_MODE_SOFT);
> +	smp_mb(); // Sample jiffies after posting hrtimer.
> +	rtorsup->rtorsu_j = jiffies;  // Not used by hrtimer handler.
> +	rtorsup->rtorsu_kt = t;
>  }
>  
>  /*
> @@ -2574,7 +2577,8 @@ rcu_torture_updown(void *arg)
>  				break;
>  			j = smp_load_acquire(&jiffies); // Time before ->rtorsu_inuse.
>  			if (smp_load_acquire(&rtorsup->rtorsu_inuse)) {
> -				WARN_ON_ONCE(time_after(j, rtorsup->rtorsu_j + 10 * HZ));
> +				WARN_ONCE(time_after(j, rtorsup->rtorsu_j + 1 + HZ * 10),
> +					  "hrtimer queued at jiffies %lu for %lld ns took %lu jiffies\n", rtorsup->rtorsu_j, rtorsup->rtorsu_kt, j - rtorsup->rtorsu_j);
>  				continue;
>  			}
>  			rcu_torture_updown_one(rtorsup);

--WlLO+KRu1U1slT71
Content-Type: application/x-xz
Content-Disposition: attachment; filename="dmesg.xz"
Content-Transfer-Encoding: base64

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
bn0dscRn+wIAAAAABFla

--WlLO+KRu1U1slT71--
