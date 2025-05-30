Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD1B6EB79
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626233; cv=fail; b=qNSsOZHPIWpb03QCHOjH94NpfaRtH7tUY7OVl+NfwipuLa7MYWkZ8IfvJ0oySJCPeskuuZ0d67almRrM2iVSK/txrXoJEX3LOSJICdDUNW/tYe4hi4lH9kbIQImDE64v7FhgYIXJLABDGQmSKZJFyAvK6Sx60IS9rJI5WxA1N9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626233; c=relaxed/simple;
	bh=OTLTZBMXHB/g8xZZ96MOYrsuPoJdcmA3zWPsjX+sZfw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BUJF2Pj78guwKcqjDx2Xk8v21IF2mjnDNVkPzLG38ngydEs88H1znNkzpWQLnMOicJ7ea9FaReBx3hLQoLExuqMciS2Gk0iHQqUGOnAGhbCzA3R+d023id7dGOD2h+v+SS36bc9WuAZwKpOr0QYiZKiUy2QPIiY52ypBAKv5Kp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avsStM9A; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avsStM9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748626232; x=1780162232;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OTLTZBMXHB/g8xZZ96MOYrsuPoJdcmA3zWPsjX+sZfw=;
  b=avsStM9ApVUVfzs4iUoY2TKl51tZT7La3yR0ZYR2XRucP56Y7WOJnsHO
   hVf5rctPW3lktVJNUxW42uB4Ddat7P0JDBdduTWeuBViIW/EGF9UwaamB
   839AGewKqLBq1fCH+dS+nqDfkNpjDWeqmkETxJ7vm6Ub7PfYOwRpmOP2V
   YDoMPlx+bO8r14n85Ek51uKRQ906Ph8sWHKxu7Q97jOLAlab6ghuab0dd
   uA9gFuI0AbazcFBYFQDr231PV4q6u7Sb+TO9x5pWPaJLAipZ68OyuFj4q
   vsKavdDB7zsBx8Kv3VSfCipfn2RgfUFguoWFnoFt4KLbOqiFhBoHFIwLU
   g==;
X-CSE-ConnectionGUID: uc8eYJaBQ9yKu21MWvZRww==
X-CSE-MsgGUID: QQYlb4TzQmmAYn93FNIBzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49964459"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="49964459"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 10:30:30 -0700
X-CSE-ConnectionGUID: rt5nshh/SWS8NmbNYpCNhw==
X-CSE-MsgGUID: 16iJ3gdaTO+gwO30P7Wpmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="181132480"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 10:30:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 10:30:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 10:30:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.70)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 10:30:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYPwsYBes+ef5SPWImCmj+6r2nxJI0HxPxYkeyfUVroodXUds9OviJIy9k0ZWGO0BfDrORgh2EzKiRY0Ij9zWZEuFkZUFHb9d8C6L94HOkRYT5q1xkHGE7cyYPUu/4+qe0LaA1aziyBNrkX6GKGgf/sI9qTXXMni4fC/YHH9FyCJ/Rdj4FDXGtBNMJGovV9v1dP9TtKv0UlvNie0KDzYjDH0fRBAVqh2xcJwfxAkh05dUC+Y9wvxnYfn/IvbT32tSI4YJXoFaAl0jLC2EEC+qzdhPXZWTuYPO3HXtIlYqvPfNJT3wE85Z87xSphqvhJK9ip3w2AF6GdJv9LdpG5pjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ViqQZ8glm6nQzfchpVTmEY31vUFkv3BlJkaRo6bqvM=;
 b=D468lnkmmioQGqYliCkskTO6gSjyYvydPmSxC3FCR+oJGx2jMo70h9AcH8BCyLkD250iuxADMSNQ1KcvZci7Erow/rGPUi8CdjODNbW5o7JZAB66gwvD6rtjWowaSkw0qWv6N4DkUQbVjG1DSSgP2DpqsEUrjXUgtt/9S5guu1hwBkgfKzw7wN/nt2w46CqeTOwh0G2VYGmKEkqliixpIzbpJjGRwbvt5i+wsxKppx0+GBVZtJvR24p/p1Z2fXiVtc9v2WaIXKmwwlRb1wEoRfTq+zSFZIJyKbnoSa1TxqdOv38NBHe7KrPsJaVw/57pTpoCdXmj07BwD6e2m+E62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 30 May
 2025 17:29:44 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8769.021; Fri, 30 May 2025
 17:29:44 +0000
Message-ID: <66d209ae-a41e-42b7-ba3d-2c3a4a9abfda@intel.com>
Date: Fri, 30 May 2025 10:29:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/1] x86/resctrl: Remove unappropriate references to
 cacheinfo in the resctrl subsystem.
To: Qinyun Tan <qinyuntan@linux.alibaba.com>, Tony Luck <tony.luck@intel.com>
CC: "H . Peter Anvin" <hpa@zytor.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
References: <20250530021216.58581-1-qinyuntan@linux.alibaba.com>
 <20250530021216.58581-2-qinyuntan@linux.alibaba.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250530021216.58581-2-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MN2PR11MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: 7034d2d5-1d76-4bd4-764e-08dd9f9f9103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWxvaVRiSXU2a3JuODhiUkM5ZGFKc2kzczB4bTNudHpYWGJBYnpKVHNOMGY3?=
 =?utf-8?B?WFQ2em12am9CQURhRUlXNERpZVVnYWhZQjRRMGhCMFpaK1lnb0FtckpBV2pY?=
 =?utf-8?B?R0c3M3J3WnlTS1FTbDZtblpFS2Y1N0NjVWYyUHBCUXlYTThFN21ya1laZTFG?=
 =?utf-8?B?T1M5K2kyd2tVNjhYTXRYcDBtQWt0Zy9ONXV1ZkhUY2FjRmxaSHpmbktmcUha?=
 =?utf-8?B?R3NZKzFwck8rU0xhKytzVE5jVnlIT0wwZC93Q2VtQXhxU1VnVzltczlUcVc4?=
 =?utf-8?B?Q1lkTmJmRHVLNHhPcTlpNFNGOWVST056d2doSm5KVEo4ZXd2dW5UckhnWHhl?=
 =?utf-8?B?QWZiNmdqblRHb0JtWWlvWWZzeDNTWUY4M1ROMFI3c3lMa3pBV2JSUkFjV2w1?=
 =?utf-8?B?N0NBTVpBT2RsdEdURW5NY091Q0M2UHdaamdJQ0FEWjdvTjRUNnh0UklGR0cx?=
 =?utf-8?B?NVU0bDBIWFVzcldadXZ2OVFyQjlZZ3JJS3Q5OUdZQVVxU2JvNUpDVnRpWXlH?=
 =?utf-8?B?MHB1TTJIbGlDY0ZNRDFabnZvcW5ObVBxTG94bzVLWlFIcHk4eFZoaEhNSmpL?=
 =?utf-8?B?ZTBqVkpsbEs4Si9wRnRvT3EvaDduWmxyVUc3MGxPNXZ0dU5jUU1jNG5KUThj?=
 =?utf-8?B?RGRSUzByMWxlZ3VzS3BlOVdLRU9GZ256Y1JvcW5yLytXZWxYQ21kSVc1V0JC?=
 =?utf-8?B?MGJyMXJCTkZreXNZYjVHVDFnMHVWZWtnS1hXVzJ6QUJ6VXB5LzcydllEdTE0?=
 =?utf-8?B?Ty9naEZjMGlhUVRzNUs0M01wcjdyL3pFYW9Sa1o3aGRFb3Njd2JLRHY1eEJL?=
 =?utf-8?B?emsrcURwVjEzQ0Q5blZ5bVk3NkpBSnNpQlZ3ZEhpanB5Y1ZRdEdsRzBJSEZJ?=
 =?utf-8?B?Snl5Rk1TeTQ3ZGEzTHRTdkZjamlLdkpkUWMzRlcyMmZ4Tzk4SUVUQ0U1RFFO?=
 =?utf-8?B?dWc1SERLeDZjc0xpZmUxUWl1OFg4VURueEZiUEROcTdPVHNRQ3AvbzBMOVVV?=
 =?utf-8?B?Q1FMWkVNWGpKYUhYbzQvM2k0NVptTWVsYUVFdi9nK3NOVjdxVjhHaUNsWkVK?=
 =?utf-8?B?WGdzMktIYVJUVHNqSzgvclZzKzY1ZHgxRHZrWXlWSlRIektybGRJNU1uV1M5?=
 =?utf-8?B?SWUxVXd6bU43RFBDVHhEUHJSUjRIeURCSTZuWGZpYTBnZVdERjY3dGFBSFhP?=
 =?utf-8?B?QVBFaUY2dkxPVS9PYjE2SkRyTjR2Q21mVitZOWVzTTVFSEtBek43YnNES2N1?=
 =?utf-8?B?ZTUvVnY1Wmt2N296eWlqSVdldVVsZXc0QjhlMjNQbklDaGMxVndWdU96NE55?=
 =?utf-8?B?TTF0RDhOMnQrNFRYalVvM1U4VzAwMUdCcWVSVzBSWFp5c01tUEJ2MTVwaHJt?=
 =?utf-8?B?YURRZHcyYzJ5NGUzRWRwOHBLUXM3UzZSbWNHWHU1WTFTNlc5N3g0RXAwa1Va?=
 =?utf-8?B?ZHRMYTBydDBGL3QwVWwyWG1aYUdtYVlqcW9WaEpQL20rT1dhb0VXb2NURUY3?=
 =?utf-8?B?dGRVSUI2T3VYUVhtdFVGMEZHU3MwVVdTVHhpejFHdnZESUh1dnlwUzltQ2Fk?=
 =?utf-8?B?Ukh4RTFkcDRYN3lhdTRDZkFjd09JVjBmSUp6cUYyWXV2aWgrY0d2bDQ0R29K?=
 =?utf-8?B?MmdmS3NNa3gwMFhUVVB4MXRkN3pSWVFybXlhMWRTUWpmTEJWNjNBQ1N5RE83?=
 =?utf-8?B?NXJkRk1pRGxYQ0xmUVF3MUo5RUlvbmlIcDExSDJSQ2tjczVWalNINmZWR2pQ?=
 =?utf-8?B?cUZ6dU9seStrb202UnNnM2dIM3IxL3VsWllGTldWSlFkeE44MXR6ZzhWNHhh?=
 =?utf-8?B?YVo0b2p6M0trUjFlZlpWdHlIV3pqUmgwLzUwR25SdHRwdzFVSkMwVVE4WDBm?=
 =?utf-8?B?NlRtSUZwdjNpV3BZTm1DeFNyS1lpQTg2bThwK2FOdVRwcWVJbXFyNnVicHNt?=
 =?utf-8?Q?b0fF6lMvD9Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGhLSXI4b1RROEhHdWV1Y21XYmtjMmFXSWhQcENiZFpmSTJZVHAxNDBqOVlW?=
 =?utf-8?B?K3lBOGJpQzdFbndsd3NXbDhzK0owMjRINFZ5dksyZm9RMmdabnlud0tyalVh?=
 =?utf-8?B?enVVdlRzaldOd29WQmR2SitZQW00REtDRWxtcUlTZVdvUXRBYUpsSmV0RVYv?=
 =?utf-8?B?ZWZSRy8ycWFpSHNMZFp6UEUzUW9iVVREL0o1bkV6dXBHYVRBWlMxa0o1Y3Zh?=
 =?utf-8?B?YVVDNExYenNMcDNrOUFzdlVrNHp3SFdzUG81ZkkvalB3TFBHbDZlQldQOVBQ?=
 =?utf-8?B?MWJVNXN0ZnJTZTA5aDd0WWJnTjNZanY5MjlZcU14eWFmOVVrNUVMVVhaamkx?=
 =?utf-8?B?K1VXbEJDTjRNOTBxTHJ3NGszMEFCZE54SnF2a0llazRxc2I2Rzdzd2oxMXZv?=
 =?utf-8?B?N2k1RnpQMS9CY3VDUDZwbDh4R1kvYzArelBldTBBRVluN1diVzFGTTNjTVVm?=
 =?utf-8?B?ZTlQcVduK2hSQndrcTVPOW1qZ0RxSEFWbHd5UGlrb0d3T1lyaXllVnI5UXJt?=
 =?utf-8?B?em9YaDNReWY4ZGFHRmZ3Wm1vVXF0em5wcUJVWnM2Mmg2MHlTVDBCaHNpY0ZN?=
 =?utf-8?B?MXZVdkVoUVdrT1dJOFlSbERXS0JUTW5vYUgzVXpSM0l3LzlPcE55aTlwL2pt?=
 =?utf-8?B?SkFJQVkrUFZ1aDczNzc5TDJCZkI2ODNoSTZqRjg4TUhXK21ScERnM0h3TlpI?=
 =?utf-8?B?SlU2SVhlakJyZ1hIampxUzBBN1ZjLzBxMVJQdm5icjRkZm5yOTFTVjlrZWFa?=
 =?utf-8?B?dG5LdGFHYUZ2M21qTDBxU3FqOTJPTXY2SVZPUkdoM3lEWUlnNEh3ajZSRE5x?=
 =?utf-8?B?RUpYdGZXckxqNllVUUVDalhrcXRhWmwzMzVUak8rZnJMU2V2U2M3RjJTdmh2?=
 =?utf-8?B?UjdzNVdvRjB3MWJCUTIveE5MK1JwVDllQ3BJTXp4WEdVRVdVSHVmNFA3SWhG?=
 =?utf-8?B?QnhOWUhvQ2FBa0hiUmtScW52UDJOVXJkQjhab0RJT3RNaE0wRTJERnl6ZTBm?=
 =?utf-8?B?NlZJbGE4d254MVNNMFF2Z1BGZlZIVWlxRnFBclJScHkzSnJFaXVIVkMzNjFB?=
 =?utf-8?B?bmlJdUVvUnJJeEhTaHNUUDJpQTRxaWdJNUl5SGRUejZnS3lrMEVIYXNhRFMx?=
 =?utf-8?B?SW56eW5vcHEwM1ErMlREWnpPMC93L2paT1ZpSlNaRGU4Q0Q4cnU5eGZFbGQz?=
 =?utf-8?B?c3pJZEdmdUU1bVJJRVU4TG53UThrVDJTUUYxUHJPWWMwZWlHS3RGd0o1MFh5?=
 =?utf-8?B?TFpkRVVxdjhLbDdXQzhjdXhrOWp2cXNuclBJQW1QSkxYY1pyS3c0V1hIOS9r?=
 =?utf-8?B?b1ZOTWFmbjgwYVBuUFQzd3I5YkptTEFzSW1HRWFKWUorcVFnWkRpMFFCYlhZ?=
 =?utf-8?B?S1A0VUNQTWlZUU1aeE9TbTlDV0I2YUNzWjhFY1hTOGVGQ3BPdzNzM3k3Q1Q1?=
 =?utf-8?B?UGxhVmhid3dmMFAyc3pDSERoN0NaTVhKVnhTZFRCMDM3K2QrdWZVTm9SZlN3?=
 =?utf-8?B?VG15Ry83d2FTR2ltUFVFU1pxeWh0eVZzYlA4TkViWVdsakxqd1NyalI3TmJR?=
 =?utf-8?B?MVFOT1lodVAvTzQxWGovWjI5NzMrOGplRVBGY1NGWEZlYkpGU0tybTNWU3BI?=
 =?utf-8?B?V3U4UmptTkdVN3ZuRzM2d0lIUC8xeUtXcU5NeTE1OEl6eTJiY3l0R2VPUjZn?=
 =?utf-8?B?VW1pZnNRZDdBcnpONTcwbzVoN2loZVpOQnVBcjB0emxEdVdmWXUwUndYaHov?=
 =?utf-8?B?WURCYzVkUk9yNno2OThMdUp4Sk8vK056Z2crWTVacThqV0pTMWRxWDMvR2Zl?=
 =?utf-8?B?VzdiOGNXbDd4VmoxR1BnSXJETlNTQThiWFdBajFqbzN4VyszbHNnOFhXWExs?=
 =?utf-8?B?dlJ5RTNRNUJtcDZsaldRWG9qajVGZWt3U0x1Q2xwVmhEeFJ5L3FsWkNLZElK?=
 =?utf-8?B?TlpxWkEySjE0NkRuWlg4RSt5ZzlMUnV4YTJhc1ZQTm9ROVQrdFNjMU05amZL?=
 =?utf-8?B?aG5sTVdkTkRyK3haU1VMUzIvV1N3NEk5UCs4c1hXSDFYajJXT0pFVGtTcDhS?=
 =?utf-8?B?SGhDN1ZaUmNRL0dVa2FJdFRNa1djNTlENkdMZWVMZk1rdVZselQzdkFIMnU5?=
 =?utf-8?B?SFBwV0hNNG54K2phWUd2VjlUUWlJblRnRWhUZVErcnlRcS9ndjFvZTFuY2ww?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7034d2d5-1d76-4bd4-764e-08dd9f9f9103
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 17:29:44.2667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4FNR7aS/9FRs0SbslYFXvLThoeVutefFqlB8LzgkORxN2qNnC/X2Xzc6h37NqkFvPl8frH9ZwaN8FBpit+9qrHz1CwsUhkOTmFWyQ/P8K8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
X-OriginatorOrg: intel.com

Hi Qinyun Tan,

On 5/29/25 7:12 PM, Qinyun Tan wrote:
> In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
> structure representing a NUMA node relies on the cacheinfo interface
> (rdt_mon_domain::ci) to store L3 cache information (e.g., shared_cpu_map)
> for monitoring. The L3 cache information of a SNC NUMA node determines
> which domains are summed for the "top level" L3-scoped events.
> 
> rdt_mon_domain::ci is initialized using the first online CPU
> of a NUMA node. When this CPU goes offline, its shared_cpu_map is cleared
> to contain only the offline CPU itself.    Subsequently, attempting to read

nit: note extra spaces before "Subsequently"

> counters via smp_call_on_cpu(offline_cpu) fails (and error ignored),
> returning zero values for "top-level events" without any error indication.

nit: needs empty line here to separate the problem description and fix description into
separate paragraphs.

>   Replace the cacheinfo references in struct rdt_mon_domain and struct
> rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
> 
> rdt_domain_hdr::cpu_mask contains the online CPUs associated with that
> domain. When reading "top-level events", select a CPU from
> rdt_domain_hdr::cpu_mask and utilize its L3 shared_cpu_map to determine
> valid CPUs for reading RMID counter via the MSR interface.
> Considering all CPUs associated with the L3 cache improves the chances
> of picking a housekeeping CPU on which the counter reading work can be
> queued, avoiding an unnecessary IPI.
> 
> Fixes: 328ea68874642 ("x86/resctrl: Prepare for new Sub-NUMA Cluster (SNC) monitor files")
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> ---

The patch self did not change since v2 so Tony's "Tested-by" tag obtained
in [1] remains valid.

With spacing in changelog fixed you can also add:
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

[1] https://lore.kernel.org/lkml/SJ1PR11MB6083BEDD3F7625B52E677647FC66A@SJ1PR11MB6083.namprd11.prod.outlook.com/


