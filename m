Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653061CDFCE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744175621; cv=fail; b=LwZDVi6ZMZfzXpH74y2K7Z+GlrokaJMXQ3rzhcXjkWlMUZyWBttKRxTk9Jd76ts9C7cSO1634O25ymYN1GJ+9ttscyjiG15NaJNM2EjzhjU0RXy3hP93tHaRA2gmNrcNuyp3BSSsbgjkEUExcUE+IaIUu2mqT3TwDPAcc0Ao1G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744175621; c=relaxed/simple;
	bh=LH2FbW83FNFDErtJzQNVqT0yW2icYMX2s2cnl7xRqwY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=car/KvcDh6Zb1Z7Vr2eWF6a6qfCP9KaigMWMoegRqqQ4TGItjSgss4FTN9CbbnM+zj4q+oe7Efjt5c6GJ3tnXdk5eMe20mj2UjivRwFJilu0ir2YaKVgeYO3SZb8ByAra3qdeQJpLsiRHBfyzXFeez0FrzAFV2rcSnd8F4oDzGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMqJnaSc; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMqJnaSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744175620; x=1775711620;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=LH2FbW83FNFDErtJzQNVqT0yW2icYMX2s2cnl7xRqwY=;
  b=dMqJnaScvxteXYSCPOk0LwJR56sfdzjfBIfi+QVkxqcBdaSH8SaR3bIx
   PxtVPwbXGHHCjvY+y8RlqwbLcy+rS5Xe6+YM42wOTTkAbN6I9O0X5Yo9a
   WfpYI7f/TvzqHj8dbfBOD2yZEDwKuq8K3CptsepnA5pcCv+DzM08YHq8r
   3a4QmWuAYNif/lSXpWkieJ9OlI2oer7g5Hwm/OSyxLf7Q/Vod6dc05GEf
   WPHuPN5U6YNFBZ7hL53aTIf+rdP9+8/IanCfTovYaDzMQSOea+xjyTKEH
   Pcf5C7QkclUhY8XCxgpUw6Mld+fMCigmMAy/+aFp0KB7k+5ZSjv4SbdhF
   Q==;
X-CSE-ConnectionGUID: tOOhVFpxSIW2EWHkjUq3ug==
X-CSE-MsgGUID: gcDK7g2pQSqJDrgyDS418g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49476473"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="49476473"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 22:13:34 -0700
X-CSE-ConnectionGUID: I1j2eNFpR6OZ5Dj6pRGciA==
X-CSE-MsgGUID: bb4h3VDeTJGCeUIIlGGTzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="159453164"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 22:13:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 22:13:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 22:13:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 22:13:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eij+simsEfRpnHVdDjlNkMehIQeM/v4GXApeio5I6AnF3t7loSjY+2YX0XZPa1HLnyH92GrIXil5maAUXeM1hja4jGtgZNa2GOiDirzpVAgtv6wy99/mFhHVuaML5wrqNB75lIXWpzH0ETc75iM1J1RUCE1iZie6p75J3pTSXZeKGEqkcAS46jmrqH6DhTJUj8IG1e6BgPBZQ540uAgpZeOKw0slGgKRp5DgnHIYrMBkuL2SFU3aqjufEyBRzDkNPimhSczBzhS9h+V2DJGWGxPNeZzQPXwWNS9iGZaLz3t9F0N6aB5HSrQSwk6d35JZgPn29QQ7kto1t5Fo5Ilmng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH2FbW83FNFDErtJzQNVqT0yW2icYMX2s2cnl7xRqwY=;
 b=MlAbbUTpy7BGOE2q83dwr4BdTbRO2QTXbR+MWiqUKmPHi+nrEhSONWpwTMOpnFNoK2W34PK+CJcCOs1VQ7VQCNTyImj/dgKYhqmXBo/UlWQDx3jtv9liaglhjAxLR0U2JSjIgqU3lkVLl3ByCnPk5AdHnKordHC7ThL7asPa9uBQpN/poVF86I8SiIKWdACwFlyRDeWZnbuibgEKxHvWrB0DRDFSVOFvcfjtC+GUJ3HF7MKCkibUF8C2Jskoqn4cdpA9A6dkevvgXZ+Vf5/BMqyurEjZ0M+pVXwN/suSE6u5IzFtfDKnBXGf+A9Oyp3ub2aVwJLyZHvIzRqVIxKaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH7PR11MB6427.namprd11.prod.outlook.com (2603:10b6:510:1f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 05:13:10 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 05:13:10 +0000
Date: Tue, 8 Apr 2025 22:13:07 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Cedric Xing <cedric.xing@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>, "Dionna
 Amalie Glaze" <dionnaglaze@google.com>, Guorui Yu
	<guorui.yu@linux.alibaba.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v3 4/5] x86/tdx: tdx_mcall_get_report0: Return -EBUSY on
 TDCALL_OPERAND_BUSY error
Message-ID: <67f601e35845f_720529475@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
 <20250407-tdx-rtmr-v3-4-54f17bc65228@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407-tdx-rtmr-v3-4-54f17bc65228@intel.com>
X-ClientProxiedBy: MW2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:907::36)
 To PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH7PR11MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 521cb116-649a-484f-d3e0-08dd7725387b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oqqP3ElPPaqub8yBrdlPNg21HPP5gB82kIanrCRsWyqvjb3kdY5sv8wIFfJY?=
 =?us-ascii?Q?WHdbhN8w3r/of/RpmP7B18rODz3rvxDN8fQS3awQSJYhxhbY/sVJMQdx3sCR?=
 =?us-ascii?Q?jw+A9EMjcMFwfyayKo7MxnKYrLx/Amt5XvnnMBGVqwPrLL5WlWW5bYe8YKfg?=
 =?us-ascii?Q?OOa4jw6zvMaX//w5+Hj/3IuwpWz9Sk8GV5yMIU3tNx+vUsTgbaWVdi3DsWgX?=
 =?us-ascii?Q?MT77s2vLLnJUQdivm/M3N/nZZzsa0VfGFkq0ZxSVFdqQJZDO2KWPXS3dwKDW?=
 =?us-ascii?Q?WqDztkTFIXdnVikehFd7n9clD48/tUVzKzmqOiIxVKKYkJUnWhi3YYMrtOvq?=
 =?us-ascii?Q?pV6lqhVJ2SSw8jcRXdTrhIVEdPVm+ZSieBJZ9aw62csYKH7tJaVJwm+qMXAX?=
 =?us-ascii?Q?YU3t4x9LgKj2g50MeKeXVRq5Helaz6inTitiFpjaTCHQ9InJotj90dArLFFj?=
 =?us-ascii?Q?EpQXyJqxHmIZLPjvUuEtxYyX9+IHY8J1QAnLCJ1/VTgTocWUP3VaLLQjdmPS?=
 =?us-ascii?Q?hEMfYG0uIopDIg+NMrKzPs7C+tU6Z6ETSsboJfT+M+D03UGAUicFQRvcyw5N?=
 =?us-ascii?Q?a4kbGhZBS/cQoffqx+4vomFWDsW6fNgubkR30EXRLaQJrjspU0BLCY2fM2pm?=
 =?us-ascii?Q?FCYJMByRnh+HfbFIU5XKnNAZ92M/XLBOkVtBUFvCN2yb/7HzAIrt3OV44QO3?=
 =?us-ascii?Q?60oSi+ucEieVoE+IHaSvcF2gjUVRnaRvUQYlBWboYWW4kbzugd0uL52GqBCj?=
 =?us-ascii?Q?mXSRQGf6AMcnlqlfi5uvBlLEzzyVGjbD7BPE9i1rbOto/gMUqaJdkCs6AJ2L?=
 =?us-ascii?Q?m0uYKe4eihKe9SrC1fZ+ELHhR3wsunGXQoQ0qbBQ72nmClq0/b9Nt2YOi/Q1?=
 =?us-ascii?Q?hsRMbTPkVxe6BG81U+/D5ddH4wZyJ6t6Ne9ogGXat0H8vgv+mQIQD8GrFxSr?=
 =?us-ascii?Q?veoj6JNB6+XTBTUL81A1i/uoYf4lIT+UO2wmlAoOKswfXOWxyPEKhyidRbHF?=
 =?us-ascii?Q?lOFb/Fw3CiFcRN9pQItEEyMtZDMpP//csMlLfKS65pbRsgm5JVfNUF5W7QxQ?=
 =?us-ascii?Q?gXTSeVmKMATjkCat3w7nR2XlKAZ80G4G3p960LBsrkUzGlOz+6HD6MWieWNZ?=
 =?us-ascii?Q?Ds25iLxXNW+bBLUtP57DitJSmiNZcpsSaVAcJhgqRLrY/ytRWxjH6Khi1iJv?=
 =?us-ascii?Q?wyzgpmS6hXWRKsO4GmOHftwU/38Oox17FinTJHmGtV+cmIb0Ie7NTTR4aUf6?=
 =?us-ascii?Q?J21kM4cD9IQb42+tFimOerph+bvt4kcx9eSG2RIS9Nmjm4Yoc2oFqqFPm4Jv?=
 =?us-ascii?Q?hijzcqun2mAosXm38KNJC4+F8w47r5vEEh5bZcpTMOo14yvmVF3NpHAryntL?=
 =?us-ascii?Q?hkNIT641BljjUovh6z2uRsKc7OhWcVt1d6N47maxA5+AwUikrfDNDBBHfqAx?=
 =?us-ascii?Q?/SfVqgCsWnA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XsFgkJoyEsIET7XLJCrURrj+G2kiWGfo5t8j//yD7UaFlgMfJawoTo6QS1ju?=
 =?us-ascii?Q?2+wnrDfhRhExAHOyrtAk3sj2UcNGHn75GDziz8O5yYw5hwWoZeXL8fJzCTup?=
 =?us-ascii?Q?G1wuPgIoS7YLsQYtV0I4YRpqTV7d3G74HvBeQ1EE9saIjnzUmHzEUXH8eKqu?=
 =?us-ascii?Q?USEwE6OxIRWkZ4/U+qMZ3+V9ENfPL1GMxB1g2ia6DT6hRh9RU0zuF5fZu9+J?=
 =?us-ascii?Q?l3TdpmgzVUbJo/H8w7yplNXZAl4+G67XZdGVRB/LuICpJ0YrsxgNQEItHCo9?=
 =?us-ascii?Q?ivrC8wStpOwzg6W16K1F7TF8WO2M3Ipc0Tdn1nvRvgS6YCKcToZZdvQpeBa4?=
 =?us-ascii?Q?pj0SaQXvozfK1R0hPYs7bA5e9z6AutLsVzh5HmmREeytwdOJecv86A8xdFlU?=
 =?us-ascii?Q?h58RkR41ivTPHX3Pjqeieo8akgO5yUsAPo1OtcJvY5l1rfqtjy98a2VxcqEJ?=
 =?us-ascii?Q?mBpOA5VGp2x6enCSUOcGsoIFJXMCV4zqc7m8uJvaRXiAS9FjvNZPz548Z+wV?=
 =?us-ascii?Q?tp80qqQZgX6deX6jfhMAYADZVhsbwrrXcop/tLt3N+Z3dwu+Yjs8iNs5495g?=
 =?us-ascii?Q?uIjtHYLXWmwqvXl0COJAa8lHDdiA0s7PL3tKGlmH76/9f7UIjQdYuyVxfHYh?=
 =?us-ascii?Q?7fBS6OdAeJu8dprkZLJeuOCuFgwF7+3kRtzAaZ47Hk5x8j7aNDIAXre8a6pv?=
 =?us-ascii?Q?JYQ7/+4H/duf9PYD9y3pXw0GwGnAxl4nPwHe1DJkO2ubppQ89iY/zonbJ3FD?=
 =?us-ascii?Q?e00y4rzDD1eBYIKtB+0p4Swy74L9ZvbLOT+5IcjioSLIupVDUYVpWxUV0Wa0?=
 =?us-ascii?Q?2xNT1d0SfUcRf25a1tXLrhbji31p+Ebp/ThFhDPt2vcjRTV3KVP/XbvLulDK?=
 =?us-ascii?Q?sjd1X1RVLXyV9/I1STjdZVFi7D2fGreLShtO6mb+Eu9qPQOHS4cj8vkDQQVd?=
 =?us-ascii?Q?sNbPxdtLEF0/kfbbRFwDowdjkPqnjb0p9i38rw7W+fiG+dLkv5Q1YtnhcAwy?=
 =?us-ascii?Q?HZ0NuIbuKbSoinzrTvE3tSIvCjRwJEzgRBcSh0IZrZIIiK63kya3Z5JOzoaa?=
 =?us-ascii?Q?IWPXhbVgb+t840l5KdC9cXnoDa26FTYU9VE8h60HTe9H8Ip7kpt7obaZM6/y?=
 =?us-ascii?Q?YkgbFuBR2e7EvljbHQaHAyR5f9Obxu6yMBe+Hz4HRYQ6dqWMvGt9fSp6rJlU?=
 =?us-ascii?Q?+5Isb4L1lT3rW+9rNAytftbCe40FWjXzOiNx73vo4hOhpbiiwAOnZR8V7UZE?=
 =?us-ascii?Q?z03szn/SbtdlV5YWq6FheVJ7+mi6ga4VJcjxsEz7FscNRP+PXpjGPSNfd38J?=
 =?us-ascii?Q?Kj/XiCq7upOmYJqFtnZNmSF6SkM721q7REv8W864CFOGl9q5LBfD6+YZfgn+?=
 =?us-ascii?Q?Qgj2RLQpZFS+MafY3E/Y1TuOpVZH91NPF2RAbJT2cFWZwMg28feRMsGj6ZsV?=
 =?us-ascii?Q?rEiqrwhkDEZioN6Hy1Kqjkz13QEHXMljVszmEjlQApI78QWcUH/JSii93CFX?=
 =?us-ascii?Q?DtFcDZj26Hv7PRKSavqNa9TZEjpNPj5tcn1GNCd+OuFdVJPrWb6ZlY87gDE1?=
 =?us-ascii?Q?s7VSdsrSzj5FMcch+epDiTsFP9VmhLKPBXqY05qBQSWrPHde68O+6Y8u/o0G?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 521cb116-649a-484f-d3e0-08dd7725387b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 05:13:10.3019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wC9QvZp8I0l6rpvVmtye2d5Jr2cTP1mdTzfJeCFD49JP2ITd6Mnaou33HPsg9CGqHG1wX4ixdJECpBmFM7cjDEAqB+tk8FXwaUdJ8MOftzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6427
X-OriginatorOrg: intel.com

Cedric Xing wrote:
> Return `-EBUSY` from tdx_mcall_get_report0() when `TDG.MR.REPORT` returns
> `TDCALL_OPERAND_BUSY`. This enables the caller to retry obtaining a
> TDREPORT later if another VCPU is extending an RTMR concurrently.

Can this not be prevented by proper locking? Otherwise this type of
collision sounds like a kernel bug, not something that should escape to
userspace.

I.e. userspace can not reasonably know when it is safe to retry, so take
locks to ensure forward progress.
