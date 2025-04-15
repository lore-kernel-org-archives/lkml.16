Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8231AF0AE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744751568; cv=fail; b=JyLkq1yqTXbTTjta9cKdz/f1VDcpXjvAPtCpIWj/0c8rIiyLYno/GRDZ82lCUmbcGPBTDrqpFWXIQCVeWCmWwhvrPagEYWrryC9d2SUOBNB7MRra28jYVW3++znpipgXS7eYk794FaJvOdLy3N9IqLrxGirz9QZJl38Mx7ZMIHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744751568; c=relaxed/simple;
	bh=ff2HssFwKHJaMw64yhNrOSo0MMCFrg3bjdVCP5AQALs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uBopvPTy5vAwJ79W9iGdJuHaor2rkLxIo/oueiGaAsdWmol3E98RL4Iwu1KJV6D2FPa1+46P1INYFsRdHD/DQnCcgzpltLbqsiLxLzWsX+hBB/Qr2esDr6i2HsOo2ZdJ0eVCBZ8gGHORTHEkeSew1xJ/S6fJm8C323dC72vAdII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFM7EcAg; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFM7EcAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744751566; x=1776287566;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ff2HssFwKHJaMw64yhNrOSo0MMCFrg3bjdVCP5AQALs=;
  b=jFM7EcAgY+/mRv2U05mnNBaMJlZ/Jay2F8DiTPLvP8gI3Oq8pDUxu46L
   oKfWdQw3qzOIfz6MMit2vAEK9FZkXGlBPsEzm5XDp18ierK/ISOwjnOLZ
   XB2HPZsNqa2RJaaN9xtbxdxTC2iruwRk5gupXRi8c8UI3VOPKNm+djICV
   kcCMQgHefGioe/cK55M4LMtb2UmfNk/+LuB6L5kdynd5CjJcdv2CXzaxW
   1mhj93oubuqVxXBPzFHE9x/IGSzz6qKy1YaI6qC/eyaKPCKPeVrNw4bA8
   EIMIAeblVKNduMwrZT2k/kO2sSzpdw8r5QusINCoJjVNFn8R0sMiARx0S
   g==;
X-CSE-ConnectionGUID: tGpwp5pzTQSWn4GCjXOzKA==
X-CSE-MsgGUID: WA17fW1zRWCrtjdrmwbakg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45995502"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="45995502"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 14:12:44 -0700
X-CSE-ConnectionGUID: MD3SmuQsTBW2vtAlnfYmEA==
X-CSE-MsgGUID: PX+t0Oh5Q1+k47cG2ckEeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="130006103"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 14:12:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 14:12:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 14:12:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 14:12:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezQkK2EUUbB1G2pDNswUlIGHQj5A83AmUnpJjd25PwnWw0U3rnIZTFeWQ3xeAwBVgz89EJrbYK4l88dgy47YkoPc+uhM62ugb1B1zhAqNa01A0v60EtKOb2HMhbOSGTKaGYacEG/LUC4U6da2dwu8fW0ysEfnmXSJt9BzXkmY7EYxi4WWH/JDy7MTEhNGkWefeap6OQx/F/aTxTbn9KGp0uDKYF1eUgRwRLA91rVJeAWvlx3pL2eu4WanUshQhGigmlqbV1TDhyL9ZY+Njg5NIjqPodmAiX70b+zdUwXmJ9v+ZJ7RTT5ENrIRVUByurd1OD8x7mFTsXH7moQrMo5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBcyD6qvuhQgB5FY1FmiFtW4DRxcLl1gLuwP9oXAnZw=;
 b=yviof9Eb9UxOIwcGrJtQOqgMUjZQr/8ZWGYBYy0Xphdr1L/yXkLMVU0ab8gfMgsTk+I0SjhR8cGVMhuSrmLlCdnspGTzBAo+x91MSqLYc5+2IjWdUPBSM3J1RjfxPCzbernUYRle2fWAtQzUfjSsMrVQ1D4uUjXrQnzeL8l50PeDhgScg9WWUOY+gZRbF6hTrT+5kbj4r5thXRq78YEZBoNtLTgfsxpCLJpmmsitei0AC8iJW1JK1D7EyNTy84Pm4BX+Af/UM4DrF++pFNnzWryhTA0Lhxc+TR+8CAVxD4PvNyYzj403+92VKq6TNZbNqqaZpaFfv9Nam9ZkvF3WSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 21:11:38 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 21:11:38 +0000
Message-ID: <45b8763a-cf8a-49bc-8b9a-0e3c188934b9@intel.com>
Date: Tue, 15 Apr 2025 14:11:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/21] x86/resctrl: Rename resctrl_sched_in() to begin
 with "resctrl_arch_"
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
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-4-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250411164229.23413-4-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: a6aaceae-e3c9-47e8-db37-08dd7c621cb8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sll2cy9pNHVGV1h6dHJRQ1RuTnRHNXRycnNIdk90czI4TjM1OHVYZ3oxSjdY?=
 =?utf-8?B?czhzZktuMkFxNUtyRmhTaWwva3ZCQnBWOVhJVklhVEwyeEdGNStuYXN5MFZk?=
 =?utf-8?B?N2N2Q1lNaURlTm04dlp4cUZiNEIxT1JJQ0Rmd015WGozeTU0dzIzZzhhdUN4?=
 =?utf-8?B?aEp1RE9XVGxHdlQyeGQxenJobDl4MkRRVmN2bTZWY3JweUZhUkZ1VFVuRFl1?=
 =?utf-8?B?UDloVm94MmlNS2dsSko0WjFWVnhOU2xnSHNzOE54eU5tOWMyU1pDUUpMZ2ZB?=
 =?utf-8?B?K0wwMktvSUcwMlQ4OE9YdXcwTXl1SGNWc2d6dHMvNU92RTFlMDM0NEU4OUp5?=
 =?utf-8?B?WElGakNWU3lONlpXbzFvQmdtcEZ4d29RT2tiZWs5K3dYeHpLV2UwS2wxWFlJ?=
 =?utf-8?B?eS80bmNXNjJCZy9CdWNvR2Naa2I5NmhGUlRjRjIzT1d1Y3J5Njd2UzVSRjBE?=
 =?utf-8?B?RWk4dGN3QkNnb0JWUUlCYXNZNzRGenoyOUJrNnovRzhQb3dScUROOWJJK0pG?=
 =?utf-8?B?MUo2YW5FQWRncytCWk5RQkFiU3RGTmcrNE03YVFnZ1lmTUxCaThwaXhOVElz?=
 =?utf-8?B?OTU5VFUwMms3K1FFMW1FSlJER1FMVHZHMjZhaXlLNGRrYms1aWtRNGVIZ2Iz?=
 =?utf-8?B?QkxZSGg2bkJhT2pwcEdpTFRuS0FqTDJBdFE2Z2pzRFJpdHAzdDZ4ZnVIU1p1?=
 =?utf-8?B?NW02a3kram5Uck81SlFzTVVWTEhHOWZvWVFpNURFNm00MG5vektVaDhyVG5m?=
 =?utf-8?B?SzZlUTZVQXFZQlUyZHhxQktIb3JRZHowOEM2OXpaMTNFNmwzakFMT20zOWRZ?=
 =?utf-8?B?UmgrSjhFZlNkRjBpL09QZHo0TkVra2FsbEkvMk9zZEUwR3JxS0RMV2dPYUdQ?=
 =?utf-8?B?OUlsY282bGg0QjlLVGQ3K0p3NUJ4UE0xS2M5ZUxWaTg0dUl2T1p5Um1CdUg5?=
 =?utf-8?B?YnR1Zis0Z1E0MUhNaG5mV3hjV2FGK3ZzSGNxVUZKTVNtaWJTZ1c5K2RjZkpx?=
 =?utf-8?B?Q210ekNCK0E5aXR6eXdBNHFPY3hiUTJrcldVbWJOZ21TanVOVlh2WFYvQXJI?=
 =?utf-8?B?QXlsa05odWFJbHNLLzZ2STIwSzdNTFJqaTZPK0t1L1ZGOTdrOFV1VW03eEJy?=
 =?utf-8?B?Tm1DbndzY3pMYlFCdjY1TWdZb005ckV1QnBLM28xb3M2VXZRMzhKWUJmTVZV?=
 =?utf-8?B?cTk4UWdJV2U5VjlhblBkVVI2NmpEOHlZQ2lCcnVBUW82b2ZPN0psUTZVVHRO?=
 =?utf-8?B?Z0twTWI2YXRhR29aOFBLNXFaZ1RnRzVDWWozTDdodzF5ZXZVU0tOVkF2d1F3?=
 =?utf-8?B?OUhVaWRJM0h2RHNUeGp6TU9aWlM2Q1FpTVNFSmt6UEt1anROVXFON3dRcTZw?=
 =?utf-8?B?NkZMcThYdzFLUDZiWmJGUG9qdnpReHNtdVczN0orK1h3bUV1Um5LSStvejE5?=
 =?utf-8?B?dlpUOW9OR2Q4QTVTQ0FoR2VtVWtobFpPa2ZxN01qUDNYNjQvRU9ZR1JKUmNL?=
 =?utf-8?B?SVFwT3lVQmxxcS9tNGY3SEtYcUF2ZW12bmh3d3l0Y2VicVFMUjcwM2JDak94?=
 =?utf-8?B?R3ZhRWZITW51L0RVanFpdXlqS1gya3dkZStJMDZaUkdwTGJ5VVJFV0c2eHl5?=
 =?utf-8?B?eVNLdktKOXcxdm5QYmNQWVhXdE9Bc3JBVHl2aVg3M1FhWjkvWjdrVmtEeXVq?=
 =?utf-8?B?U2ZUOVU2bzNmQlZwTlpIdXlrcVJiWlFobGFRWndSWjJkY3R5c2VJaUhhY0Iy?=
 =?utf-8?B?VVUzeUxhdjN6TXNEbENsSXNmYllLSEhMUG85Z25uT2hYV01nRXVGRk1RTTM0?=
 =?utf-8?B?Q1h0K3lFQ3pyazRJSU5JR3RBVVREWElrd0IzNm1EbkdXVGoxazk0bUd3SEw5?=
 =?utf-8?B?UmxUeFpmV25pcGVVSHdLQWMyVlB3U2pqLzI5VFhBWWE3Wjh2bktIMk9sM2ts?=
 =?utf-8?Q?JqVdhozxs6w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFWMEFhUUV5L3RhYmhUa1JiYUZzRnhlMzJYWDV0RjhzQmJkaFQ0bHprU1Nv?=
 =?utf-8?B?M24zRStyYXB2bDJDWlpaem5MbjBOaU5aMFE0RjFSRkFqU3NCT1NsNTRVMkxh?=
 =?utf-8?B?aGZra3ZnSmVxZmRrc2Vld08wdW41UFdLWVZNdHQxOFA1RXpyM3hNNllQcGw0?=
 =?utf-8?B?ZUgzci9zeWdheXNSUEdNRUVEdXQ4cXdVSC9BRVpRbHkxclA0cEF4d01paldP?=
 =?utf-8?B?dDdHcEdib2hzMkROT0JHYXNEMmJFem9uZmpqS015ZzRwVzJCODBQdkNhQXhq?=
 =?utf-8?B?aW5UU09ycm9BK0JDNC9kcXFoYmVqdXZSWHBubkgvaEJjcUcrbm5TaFdqV0lC?=
 =?utf-8?B?TFlzbFMzT290VUxYbEpad0V2SmxlSkQ1SHZyN1NVUFpoaE4xZ29ZdExHdU9U?=
 =?utf-8?B?c3g0WXdiTVF5QVVUYXREeW1LTGxUOVg3MUtkbS9VZjBOMEluTHQvb3IzamxU?=
 =?utf-8?B?U2E3aS84SEdTL2MxTXVMa3Bkemw5S2RsbVJ2K204dmY1dytXUFdXeEozZy8r?=
 =?utf-8?B?KzN5ZDFEalRhRzI4Q1lKb3F6OCs2NW4wa0FuY01vc3QrWEtycC9aWGpFeldB?=
 =?utf-8?B?Nmk1NUFYN3ZxUmxGUTVJbm96emZ0YWVrNFJoVEsvQkIySVRWWE5VR1p6TVN6?=
 =?utf-8?B?N1dvK0xVRTY4bVZjdlc5ZUo4SVNzSGxxL2Vnb0oxKy82MmZYRHQxbUZvNnpu?=
 =?utf-8?B?R0Y2cEh5MFB4VXlMcGkrVzlpRjZuUUkxZmlPUGJKc3dUVVhwd29EaEpTelZN?=
 =?utf-8?B?RXZXM2NxdG5JRHJUOGJxTlVmclBKMmRUdGhCdUdvYllQVVJ5SkwzWlRoUUF0?=
 =?utf-8?B?Mkp4QjRMQ0pxZDlTYkVNWEpYdHpoYUVzeWVpTVNsZW9ZazVsa01ISjhBa2ow?=
 =?utf-8?B?WXplTlBEVGo3dUVyTEMzWHRFM0gzcDFpQUIyZlp3TWlnRDB2UnFJSWx2UGdJ?=
 =?utf-8?B?VHYvQllxdkdQbWlERjlHcVk5SjRKSStxSnpGRU1HdU9pWHJjckRQWENFSWov?=
 =?utf-8?B?Q2tkZ1ZIRkgxRDh4Z0IyaHdnc2xEdTM1VjJWWVNEdlJlQWRHK3RZeEZlNG1U?=
 =?utf-8?B?V0lXdjI2VnNqWGxldDVTVk5sYjNRMTVHSElGTXRHbU9UdkxRVVNWM2l2cTJW?=
 =?utf-8?B?UzNEWHgwSExoY1Faaml0ZUFwWjlBK3JDVTJnMVczQ1RCNE9JelR1UFZTTXgv?=
 =?utf-8?B?ZzBkRVFDZGtpdVVsR1NZQTZ0d3NtUVFOejl6Mlh2ZHU5aTE5WWszajU3NVhr?=
 =?utf-8?B?UFRJUjZvdFhoTG5uYmN2dXJTM1FoMStJTXJXdHE3dXJMU2lyOEV6MWdUL1pM?=
 =?utf-8?B?TktQRXc4cEEyRUNDT3FZYjJtWDUyWm02VE4rbmdOdzdpdzlLQUVUWHRibTNV?=
 =?utf-8?B?MDJwakN0ekNmYjVyQ1dGZHNFT3crVm5mQlJGbGJZNXNuQkdMSmRXZXhMZnYw?=
 =?utf-8?B?SW5lS1RHQVpLd3ZqNFVtZ29QR3RIL2M2T0MyeDNXY2tBMHpZUEU0UXIvOFVu?=
 =?utf-8?B?VUlJYk1sMVI3WUhETzBkYTRNQThPSm5MVlJNL2RZb25XQWVwT1YrREVqZUI0?=
 =?utf-8?B?RUV0Z0dEL0duN0FjU3R0WkNrVVhCYW10R2tGUFA4NzBLdkdRaExpQ2xjajJs?=
 =?utf-8?B?Sjg3TEp6TWwxalZGRHViR25Qa0VFL2N4RldmdEpIRXJsVU45NE1wMnlTTWp2?=
 =?utf-8?B?cFJySE1jNlVHUzZDOEtFZXA2eVhMcW9KNGlmY2FoVExZRmpPdHVoYmMxcm54?=
 =?utf-8?B?LzVmeUdIOURBNUMxNHFrK1d5M0d4bkg4SDluQk9ER0NVVUFOVFRPZVFwNVNX?=
 =?utf-8?B?QWtKWlprWmhzc21salBkc3VJdUpFMnNuUXhaT01PRnJLb1RQUGRpTjU4aisx?=
 =?utf-8?B?R1gyUUkzcHlSbGRnRFd3QURob2NPZWIreHZoeCttRUE4Z3pWVGtxbU1jcVR4?=
 =?utf-8?B?YW5rRDRxK3p4UnZCQm5kZ2xUaG9UM3NKRjVEWnlyNzQ4MUlaVzJJREM0QkxH?=
 =?utf-8?B?SldFd2s5SENSendUM295c09RY1RLNGYvRjI0UXR1cGRFNmJlcm11QzR0eFRw?=
 =?utf-8?B?VnMxNUJSZ0FMWExkU2NUbzJYK1lkUmRkUkh5OVRyc0hQRk1WYlBwYVIwRXFE?=
 =?utf-8?B?bVBCZmROUXpEakJkK1RHeGpRcHNzb0tUbXE4NEU4eXZrWkZnWGVjWmY4N1Mz?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6aaceae-e3c9-47e8-db37-08dd7c621cb8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 21:11:38.8781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aSfCz4BIb9QghuCNJfWT8OzaH34uskL6DikksqocWO7EjNTKbr9jXxPOVfOlkWMix+pV1RDKPyyJaZSdvkXBFsFZqnY3kt9Q532Ci5VCQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
X-OriginatorOrg: intel.com

Hi James,

On 4/11/25 9:42 AM, James Morse wrote:
> resctrl_sched_in() loads the architecture specific CPU MSRs with the
> CLOSID and RMID values. This function was named before resctrl was
> split to have architecture specific code, and generic filesystem code.
> 
> This function is obviously architecture specific, but does not begin
> with 'resctrl_arch_', making it the odd one out in the functions an
> architecture needs to support to enable resctrl.
> 
> Rename it for consistency. This is purely cosmetic.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

This is a duplicate "Tested-by" tag for Shaopeng.

Reinette
