Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66753219307;
	Wed, 16 Apr 2025 18:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829588; cv=fail; b=GpiXU8/PIuH5m1W8n/rxpOy7XH+OocoizPEEYxlftYzeyf/nExrilrsY72dEeNt7gUQHHnaVUVPkhntNVWWJ9/1dgTBJXaN5bR5IUeKo2P8Z0FPVoqbgdmQS7nUKtvniLE/MxNCD70hJyIZl1qCYgdjkH6Kn2ezgjgQF0vgB8TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829588; c=relaxed/simple;
	bh=uew7P0IAjePshO6lwwCpIpmCohjsbVntLxv7RjR6KR0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X6AVLQU3ajqzkksBMGdVRhmiI/WPAuaI+ZR3rydnmbV28fh/gK/WZ9g23c6M7YA6PyigRlp1xmeaKyORpAtH5WuXlzZyQNtNLP+srNsZPtspTCrbBnoLd2hrqkbnbOQW3qfIwnraIwGyIdahLhreqpvt/6LVuMPSIU/8hw1lMvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLeJk7yc; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLeJk7yc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744829587; x=1776365587;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uew7P0IAjePshO6lwwCpIpmCohjsbVntLxv7RjR6KR0=;
  b=QLeJk7yc8mwAR64PM6fVczB6c3ev0/rYwarGLc3th2a7jZQg7MdHLJy9
   Pyi6PA7ZTWgaBvHk7Wuw5Ht2lh4rpAcc/ZWplKzeUb2yBrWSCrcc3Pz5c
   MG1zIVghd5DKQ0VnUd604XhE5ECXJ0yBxX7ZSwXeLXwU9annLhAXYiBRg
   48HAGmxylttzdUV3g1qs02igQnUeUyWX7Ai8I8RhpAO0VBUnJt72smfQk
   sJxT20XuAIGq2trpHzBy0sIelw4LNeNTxonZsNTiwTz7cD1GOiX8oHOOj
   P5e2t0TaAbImbZCRmHw5+ivrmWNn/ZfOOTy5ONjgivIVJINDw7bPkhr79
   w==;
X-CSE-ConnectionGUID: kkK+ZFCeQPSnBEpx3eIUlQ==
X-CSE-MsgGUID: 5jBAexI1SVa7OOq/aa/gHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45628618"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="45628618"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:53:05 -0700
X-CSE-ConnectionGUID: FNmUGZu6Qj2NRwqp1RSqTQ==
X-CSE-MsgGUID: PqOof7GaQCut+IjH/JeDRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130566746"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 11:53:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 11:53:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 11:53:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 11:53:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbhCgmt7YSXlo0WxjRjBFaul2ZvOys5ugVUtCTZhxTZF3Gyc7I+OV7mPZmmI63xz353t8pJbWaGWZ1CDEZC3Uu6VM8DZZqaB0CrhUlMTxp1kUZIHUwO4jKMG/CF3/qwPGGObrzh3I7m9FwuOodDmImlOlxYvWVFqS19GiZMLEHBDQJi/aN6Ajh41/qfMbXxVqQ0oQkoVi0KEoQlgo7rrjLENBS88eIFNp9m8tVIqUbBF8CEOlY9yUKn8EJhgyHORWMhNv9d57Tiz3BEUSHXE1BaXFgXI9Dn/J+H7lY0rQdJ1I4DVYMWGjUBKO7dz+XRe4iEuKJJT1To0QWZs+mjqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhQAIsH8DcjaWyTdVKHiaIlNf/fWYi17yLoB2KLLeBY=;
 b=PRwQ4UFdui20aRSVZvkiYou/txY78cviL65kobY0UiZ4EZ6c5KsfyA1vU1qWwj/zM0trlPFZWi+4b3d8EZ0I6gYlaRYONMJkPwf8Vm+RzXPwC7v+hROcrHM7Z2RmsKIFjXaZqD8hJiRJx3leSv2z8o4CIUGKMy0bg5Da+W+DN8kz4K/+2H0zoUvcToaP1f/CvKFeXF3BtGNXifB1qToRNjj8arMdW06B7oeFOUv1JGajKCdim/0nRBcLoNtdpD1Ct+W60vgnzedDbM/tOLckKGzfw6gfjx8PE1eD9KAkCIZJzLvTQksxspaX7zH1oZ+azWTOnsqtQKUAkdWecwdVXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW4PR11MB6933.namprd11.prod.outlook.com (2603:10b6:303:22a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Wed, 16 Apr
 2025 18:52:53 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 18:52:53 +0000
Message-ID: <fda6c46d-c01c-494f-a2ba-efbcb1f331b4@intel.com>
Date: Wed, 16 Apr 2025 11:52:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 20/26] x86/resctrl: Provide interface to update the
 event configurations
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <peternewman@google.com>
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
 <d18beb9ca31eb013405677792377542e609ea693.1743725907.git.babu.moger@amd.com>
 <7be35258-f913-4111-b5da-c4173615cf18@intel.com>
 <7423145d-7de7-4414-85be-b7325c01b437@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <7423145d-7de7-4414-85be-b7325c01b437@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0306.namprd03.prod.outlook.com
 (2603:10b6:303:dd::11) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW4PR11MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: d5614013-c856-492c-5d56-08dd7d17e46d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2h3WEdMR0YwY1RlMzNOOEhrL3ZDanJzcmM0QWlGcTNZV2V0SnRkZTV4TW5V?=
 =?utf-8?B?TzFtdkQ2ME9JZCtDeDJ5WTFXV002M1dHQ1NydnErdGh0Mm9UejlyQ3F6Mk9U?=
 =?utf-8?B?NFR2UlZNMjBsM09ZdmZHcGZSSEpzNzJ4VStKK2JIbHBmSWpVeDJ1b3hkK0Jl?=
 =?utf-8?B?bXZnSXlNajJlNzV5RVFpTG9wZ20rU0lWM0NGelNNeHhxL0M5TDB3TlB5Tkgw?=
 =?utf-8?B?dDIvMmNPR0IrWWJqY2pKdWVFYndCNG8vamptRWdMcUdYaWk4YS9xQnlONE00?=
 =?utf-8?B?bWZJSjBzUUtpNlc4eTYxRjlySnJkRzRCTEsvbEF0NVhKZm5LZW0vMm9UaHNt?=
 =?utf-8?B?cTVaN1grUlVNUnA3Z0JXSlZDSW1qZHZFU3h0aUg5TXB1aGN2cFg3ZzNHdXhD?=
 =?utf-8?B?ZW5tWERtSW0rc2hzd3psWDdHcHRXZmlFYjRmbFB0M0Exc2ltbWJVN0xTRXBS?=
 =?utf-8?B?Wmh6VU1QS1NPZmpWR28vTG1WbGRKbk9aaGpDNHNlb3JzcnIxelNaOXpFcU41?=
 =?utf-8?B?WW5TbnQ4Nk1Ua1pEMDhHeFY5blRWRmR5UDdIenU5V1oxQUhWVkg3U1dDTkVT?=
 =?utf-8?B?YXdMNDNYcHAzMjRJUjFrMVhWc3NCRmhoN2ZUWHprNWRzT0Evc1VDYUdJS082?=
 =?utf-8?B?eGRhQ0JGVFZ0Tm5iUDRvNklRTERMNUJJRWVrTWdYTzdSbDJGMTdleWpnekVt?=
 =?utf-8?B?N3dSY3NwODhNOWMxajdhcUtxejg1clA2UWxmeE1rK0ZtN2pMQUNxdTlKUVZ6?=
 =?utf-8?B?dStrOWxRajhkNy94ZlpmbGcvNFNKcHBCNDZXajMzcXlIMEllR2tFdTNQU1Z5?=
 =?utf-8?B?K2NWeExxdjMybzRMcFRIREEyNzJSSFpPOHpHUU9uTGtXTzZFdWZKRDNJOW1U?=
 =?utf-8?B?VnZRV2F5K0h6d1BFdEtReGFUSFd1N0VQc1lteW1Eb0R2RGdmaUhWdm9XNEo2?=
 =?utf-8?B?RmZxaWREL1lGaFJ2SVFISitKOWFGUzQ4OEVTL0xjdlFtZnBvc2dHYndvUW5s?=
 =?utf-8?B?WFNhNlU2ZTkrelBHY0NxdE9CZjZFN0dSSWUrcmxpbDczWENZQUVvdElzL1lo?=
 =?utf-8?B?bkRwR3VPaEI4aHU2WEdEb29vbEZmN0ZEQVNtYzdrbUhxeGlJZEs3L21MaUZl?=
 =?utf-8?B?YzNnRDU0d3VWSmhScmJnLzRkRm9Ib1pwRy9BVWMyRy9HeGlqYysxeDRLd0x4?=
 =?utf-8?B?YjVyT0dLcHp1UGk4aCtDRGovNnBOMG4xVHZwbEp5Skx1N3ZWUVlTOVFCYWFO?=
 =?utf-8?B?NUloMEJ5WHNYN0FnMkZ6WFhSV1ZzNHVaanpic3hWV1BadUNoUTZHR1JodEk3?=
 =?utf-8?B?RHlwT2lyMldsamRBNmlWYUZUMVhrK0dCb1BCQUR3OE5aVU5lWUtBL2JDMy9Z?=
 =?utf-8?B?Ty9RbzEwMjRZbjdHcTA5YkdNY2NJUUNpVWl5aUhYV0hzbk52TkRLbVZNYTg1?=
 =?utf-8?B?emYweFBXQk8xQzZVV0lnTGNuNTE1YUNUOUY5V1MrMSt5M0lSRE0xUUl5N21t?=
 =?utf-8?B?OTVjNEo4MzVCazBuUlViUGxqQkN3YTlvTURQTTRIZVJseERHNlhrendveFZ1?=
 =?utf-8?B?VHliL0VtQWxOZnAxM3Ric1hHNnh0RURqcmgvQzZLUEwyWWhQUW1WWHhHOVli?=
 =?utf-8?B?aWJUeGxMVjlhU0dRc1h5ZllIT1NGV1dUY0Y2VjB1ZkVTQkFRZFhSKzhxOE9x?=
 =?utf-8?B?QXdsSENucEp2eUoyNHNKK3Q2THlDQlVsbnYwcit3R2pNVHo3NGVsM3JkQk4w?=
 =?utf-8?B?dG9wblB1WlZEakdSbGhIcEhrMDhRRWpvNUlTVHJQUUJzdGZqUWV0RVZMdTZV?=
 =?utf-8?B?anVxQWFVNVdJVkJrZDgyU2diaTdsRzFkQTc4Q0gwaUZpb0FhYjZHTk5JZ0VI?=
 =?utf-8?B?V1NqWUE4RDhVKzRtTzJoYjBrUUlHVVpuRnkxNmdLSy9Ed3ZLZ2xyaUJWRjlt?=
 =?utf-8?Q?YYmIZaRmU/k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGhsNXhiYlpVTWRLSktSb0pPQUdjZkRWMGt4V3R5WmV2bU1GRHRMQm1aczNa?=
 =?utf-8?B?aHc5anJZNHh1alhXdG9mVS9DeHNkRHI0MVJjdjlYbVFXcG03UCsvQXBadm5R?=
 =?utf-8?B?QWtzR0hTN3N5aTlqYmx0RFFEbVN6Y2V1ZWwydTlNQ1FFZzYxaW9SWXZONFI1?=
 =?utf-8?B?ckxVYnZzTTJJY0g3dVNoRnJoUWpyUS9IMERjRU94RW1VQ2w2cjE3YksvWTJz?=
 =?utf-8?B?Q1lPYXZsL1B1T0VaSThFQjZ0cGsvaTdKMERJOWU1TzVrSXlyVjZaZDZnMHpH?=
 =?utf-8?B?c0Ztbm5Kdlc5dXVTYUF4Slp6ayszRS9ScnpYOUp0Nm50d2dSMUllRThWdWti?=
 =?utf-8?B?OUw0WHRzUXVkRE83VkFTbkxFc2h4RThIdFBLVlpSUmNrUEFuVTJxRldMVEdq?=
 =?utf-8?B?ekxLUHIvbWtyaHFaUGxQQTdIOURNS1FVUWVKVVIwOU93aVczL2Fpa1BvUWNn?=
 =?utf-8?B?Qm5Dc3NTaTVlNFdkbEhKQVBOREhqM1FFQXB1cElHbCtUWnl5SjBjcXQyK3Bz?=
 =?utf-8?B?TXgxQzVKd2FrSGZKbEIwN0MzalU0Sld5MXRrNndXSGtlMVRYRDhBN2tDeDFB?=
 =?utf-8?B?dUVrVGJsRVFjV1grbERMellvQlZaOWMvRWlTSU9rYTNRNkZUTXVjbldiZXdw?=
 =?utf-8?B?N0IwYXFJSFlVdC9nM3BPZVlkYnpMemd4SmdsblBhTjNpMWFUNU1EMVpIZ2VQ?=
 =?utf-8?B?UU16Tk9EZ1g5bzdBaFJRVnBFY1VmNUxOWE44T2hCdk84ZTFhVUxHekxuY2tJ?=
 =?utf-8?B?bklWem5VMHZVYWwwVnZpREhQWFU1blFFeTZHWm5tWmNJeUxYbDgvN1lnSHdi?=
 =?utf-8?B?NFNNWGQwQWVuMmwrb1l4aDJnVHQ1Z2l1VTFDSEdBdmYyZTBma2VKRnN1MU1n?=
 =?utf-8?B?cTN5TVVldm1ROG9GMWFZejZnZFkvblQvRWZNMlMwM093azVpaDRwdVlyN2s5?=
 =?utf-8?B?dWptRGxjMFU4bk5YdlV4RFlXWUJRRm14Z3NXYW1FTXhVT0MxbnR2MXFEdUdU?=
 =?utf-8?B?VmZ1VGxuRFlZMVBBcjhxV0dXVUJGR0RkT0Fsd2I0RHo5anR5VDVieEl1RXVJ?=
 =?utf-8?B?NTRGK1hNNGhJcmdOZkNPbzl1ZVJEaldYYmVjcVdzejdxMitlMi9zdytyUmpk?=
 =?utf-8?B?T3EvanRJcUh1cEZuSTV1d1ArV1FTMFVRWUFhbzg3TXdIRWk0eFowbVBuc1dS?=
 =?utf-8?B?OWY3TFpESGpUWEFtbEc1VUFkVkd5MHVTZWxIMG9zazI2K0dBMTd6V1hNTVZw?=
 =?utf-8?B?WHVFWDQ3OFdPSXlmU3Q5OTRITkpLUFR4SVdRdDhyQVZuenNuUjA2Wk5hNWFO?=
 =?utf-8?B?bmF6TEFhNW8zbWhqbk1MenZmMDVJSGFCWjFFM2YzNUZqcmY3SkhRMjRCZnox?=
 =?utf-8?B?eUJGeFVSR1pRYUpQaDJGVU1GZE5ORjNDamc1K1paTEJLa0FORENFaW5EaWht?=
 =?utf-8?B?SFN0bjVrN0k3YkZUUVdPd3BJV2FDS253N3JwUHhwdWt3cE5RK1dySnhlZDN6?=
 =?utf-8?B?Ymc2Zkx4MENkZUNKSmNNcnZaQnJ6NGxXSDFLTDFOTWdIQzhsbzFLKy9ueHRn?=
 =?utf-8?B?c21UQ0s2VWVnVjJNdG1VNkFTUVhOd3JzTXJTZWpkUlBRQjFha01ERjRxSjZo?=
 =?utf-8?B?M0l1YlBnOWxTRXNRbTBLdVZiSUo4a2NyWXhReHdXbU5qakJrWmVjRUpwYjh2?=
 =?utf-8?B?cFFGVWFwMVFPTmVJRHJOL203bi9JUHJ1ZCs2M29jcCsxbnRMY29tcFdIS0RC?=
 =?utf-8?B?K09nWmlValRYcmZsaUxHS3RGbGtvUlA5Si9PQW5paXBRS29VbnVWN0FrUXY5?=
 =?utf-8?B?dnN6cFBLdUdrUFBxSCsrQ1RlRUJpdkhZeStzUEwvRXJIQy96Q3dKOHRMREI0?=
 =?utf-8?B?dmFoY2hRQ0dwYUYrdk9JanFubnVSNE5lK2xCRml2MmJTeEprTFpwSjl2NHc2?=
 =?utf-8?B?UWhuSkQvQU04cnhScm5kUHZXSFVveC9VUnJDQWp3MjNqWGx5MGtsVWFuakk4?=
 =?utf-8?B?Zk5OVGR5RzVZNlpyY0tzYVFtajRIOFJYbDFhdiszYzFPZGxwMmVOZUFlVUJT?=
 =?utf-8?B?S3JWTHFpem1aUmJmQ2I3cHJ6SEQ0eFpSaWFUZm5QR2czSlhVYi9KZkdyMTln?=
 =?utf-8?B?STFmR3BGQUN2MlNkOHBWMS9VYUhaZkRScGJOMjZVU3NaaG9XRlVhMHlvZ0pj?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5614013-c856-492c-5d56-08dd7d17e46d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 18:52:52.8979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhbTJcp12jsXY26ZRD5ABB05r3/Ij94+8dngumN5oZKCY5Qnj+5uSYHnO5j9KE7tz1aYkRRLZJIBfucEh105OgVFJfjf9Up2KvV6JQQTbg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6933
X-OriginatorOrg: intel.com

Hi Babu,

On 4/15/25 1:37 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/11/25 17:07, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/3/25 5:18 PM, Babu Moger wrote:
>>> Users can modify the event configuration by writing to the event_filter
>>> interface file. The event configurations for mbm_cntr_assign mode are
>>> located in /sys/fs/resctrl/info/event_configs/.
>>>
>>> Update the assignments of all groups when the event configuration is
>>> modified.
>>>
>>> Example:
>>> $ cd /sys/fs/resctrl/
>>> $ echo "local_reads, local_non_temporal_writes" >
>>>   info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>>
>>> $ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>>>  local_reads, local_non_temporal_writes
>>>
>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>> ---
>>> v12: New patch to modify event configurations.
>>> ---
>>>  Documentation/arch/x86/resctrl.rst     |  10 +++
>>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 115 ++++++++++++++++++++++++-
>>>  2 files changed, 124 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>>> index 99f9f4b9b501..4e6feba6fb08 100644
>>> --- a/Documentation/arch/x86/resctrl.rst
>>> +++ b/Documentation/arch/x86/resctrl.rst
>>> @@ -335,6 +335,16 @@ with the following files:
>>>  	    # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>>>  	    local_reads, local_non_temporal_writes, local_reads_slow_memory
>>>  
>>> +	The event configuration can be modified by writing to the event_filter file within
>>> +	the configuration directory.
>>
>> Please use imperative tone.
> 
> Sure.
> 
> Basic question - Should the user doc also be in imperative mode? I thought
> it only applies to commit log.

I am not aware of a documented rule that user doc should be in imperative mode. I
requested imperative tone here because writing in this way helps to remove ambiguity
and fits with how the rest of the resctrl files are described.

Looking at this specific addition I realized that there is no initial description of
what "event_filter" contains and to make things more confusing the term "event" is
used for both the individual "events" being counted (remote_reads, local_reads, etc.) as
well as the (what will eventually be dynamic) name for collection of "events" being counted,
mbm_total_bytes and mbm_local_bytes. 

Since "event" have been used for mbm_total_bytes and mbm_local_bytes since beginning we
should try to come up with term that can describe what they are configured with.

Below is a start of trying to address this but I think more refinement is needed (other
possible terms for "transactions" could perhaps be "data sources"? ... what do you think?):

	"The read/write event_filter file contains the configuration of the event
	 that reflects which transactions(?) are being counted by it."

Reinette

