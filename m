Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B4613D244
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738895586; cv=fail; b=JR1QXAJRDn0dmp4+iIdZUTrXosvtbKYw5vcyfbN/b3CON+Bc//WW1hcP6biICvAhsuRmRaBu4ABqcJtuV0/pBz4Pu9Olo+lyIMJOowxYJApimZ5uYI0i7V3MUB8M/yD1Gt+zSiYrb2wRBJ0UATT0D6lwUpddU7IUcHZnLlq18c0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738895586; c=relaxed/simple;
	bh=G0xsiucxmrN14ImoOKk7q0f0OjXYKzUlHx4idEqZ4+c=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i0iKBV14jwGYKB5ZvvggYKXoLogzryzMhQkv0OSFji9tysnFtNSVxaD309yd0hA1txedZYiiOowtwGFzHpbMzgirmXunsZD6fl7IItQD+Kdi0E7glvFtkpi0jGUdtV1MKb2m/R44kw055hBN+36BrLejE4ngwhQF+MGmtWzZZPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KqMpQ1sk; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KqMpQ1sk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738895585; x=1770431585;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=G0xsiucxmrN14ImoOKk7q0f0OjXYKzUlHx4idEqZ4+c=;
  b=KqMpQ1sk2vkqoobt5CSX12CqVLGL9zzTxQJxFMjvievQSOmb6c42svBD
   7DZwu3lCTTT3NYt8sLNdNrfBW3f27SWV/j4ISfyqfGFlO0QYYrlVPQ0dW
   yOACBC8F4pFoRM1yPhceCfdwDfwYL8fm1P1uGaPnL9TwvltFA2fLCyzEL
   uR5zQNfvMlHJrpWAVD/9aVNhf53gbJwpxT/dZiFZjzBDarnenVe22Lzpl
   s8id+U0fS8jgY1aPVKAiu5VWV+y+PUKazWWJaHLSSd2IY2CR0060f7Xev
   KCiQAyUlcUe2BgBz1J4Frc5Mgumwa/NyiaqI0C26OMzX9P2+zmRjaYOhK
   Q==;
X-CSE-ConnectionGUID: gviDpl6MSIS7FchGoS8zGA==
X-CSE-MsgGUID: v8fbTWW9Qc+GWzVWSAVR6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43190675"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="43190675"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 18:33:04 -0800
X-CSE-ConnectionGUID: gKB0EHACQuWYjo22KT7tmg==
X-CSE-MsgGUID: rxZ5gmXsR+WSF448rUxazQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134635267"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 18:33:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 18:33:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 18:33:01 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 18:33:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8MRuO2hRf1qtCWpR/R9FbSI0aD7Wx3OXjV/PHq+dg4wHa3Br66Y902F9fr8tTUWl9zSp0BANx+Vxx5xfgeQsNKEyDSiVFJ9GojydcwsEfRrIK3jzOP8Wbpq902X+qQc1FWD2Bgdmsa/0B/hJJAOocIUS/Ahtvg++iqmoX6gXEKbWFyXU7Eb3GVwHnpbHF/XyWpc25PV5ODeOYpNwAwEqyfwEWtuM0IXemh6lNgAwHN56xN9DM9dTWDmNbQwtu1+5R1q1YWiYiElYsRZRPLdpuRX2C8pkh6o/fhi0TUri65Npt0UdvD7XRp0sE1SGMcMfgGCfISOJd+ywsx6YqhfoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgKRanXc91qPuBoPYHM2xYXy4DjWEhb/1Tqbx3w2am4=;
 b=EMJRxyZ81Y81wrjsfYNSV22zCaS20fg17aoKUQUrnjFvrbUXYfjSo6WXDIE2j4RZLfw0wiC/Evkdw7Kz336R528tlPXp3/XNU9eImoddNalJ1ZVTekMDEuMzKRQJA559N2p9Bp1URTew1aBybePoJ37rhVb7iKZN0UoIh7GbnZ41Z2VEsgCDCmJBwtlW4E59Qx/25xoAz09qM2B+ZdEChy8TT4NoF2f+FOOOJ3XhcP1S8BWGkX6wQCx4LI6Y0V+tiVcnOLEElyupkTfNaqqsbqSFSwsDgNv7KnxbyCz7RMobvX2Yoj4VueimRvbJVtAfD1hT27Ruw4VQ/QA0TnK0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by SA0PR11MB4688.namprd11.prod.outlook.com (2603:10b6:806:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 02:32:58 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57%6]) with mapi id 15.20.8398.020; Fri, 7 Feb 2025
 02:32:58 +0000
Date: Thu, 6 Feb 2025 20:32:54 -0600
From: Ira Weiny <ira.weiny@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, "Ira
 Weiny" <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	"Stephen Boyd" <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>
CC: Jerome Brunet <jbrunet@baylibre.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] driver core: auxiliary bus: add device creation
 helper
Message-ID: <67a570d64ac4c_30e1782941d@iweiny-mobl.notmuch>
References: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
 <20250206-aux-device-create-helper-v2-1-fa6a0f326527@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250206-aux-device-create-helper-v2-1-fa6a0f326527@baylibre.com>
X-ClientProxiedBy: MW4PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:303:86::15) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|SA0PR11MB4688:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e64767-e1f0-4ed4-470e-08dd471fbc29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Deo83BiabnakhLTX2p5YEqccgzPLeAdJEHJjYWe4p4oTfTnqg+tdFUssDY4g?=
 =?us-ascii?Q?gDM02MFd6eaEtsIFxU7LEXUDqYvVwXzxsna0BIzgCk+sxNn4kxdgf4fx9Vlj?=
 =?us-ascii?Q?98IxlTZiVXa06jv0J6Q6PuYpHqdeeKbcwWf+iQUaVJWgZIovIjyYtAU2FVre?=
 =?us-ascii?Q?RMbYmRAgziBnwXbEM1PBrF1kbXQcDQfwc9gEhKBeka355dSoqd7xX/jkG88M?=
 =?us-ascii?Q?hbCS9N2ZFJ8tXYZBZ1A7xmaj40fM7/+uejTp2irJuRZzuCCn6RPEWYJ6D/4X?=
 =?us-ascii?Q?84+zIrOnHGZpuoF6xgj2B9OF7/unFTXWnKLdkINI+ac049+H4mZa1eCZzyg0?=
 =?us-ascii?Q?OVrtACMRGMf/FdU+KuqsdN8GoMwJU8uDbJq8ph315mq0dzGbxLMSnlYmAkBj?=
 =?us-ascii?Q?QsE0EqsgIoMrlxb2vCFrWXOyqut5FQlf5m3+SUchlnlekTNZ9HPBTStcEydM?=
 =?us-ascii?Q?XJvjuOg44jUTZ3yfqg/5ttZd8J8vEQmtP7oJYHvPATr6eM6M9xQ8Rj2vJ2JE?=
 =?us-ascii?Q?BK4F78c7WqYCO4RNtwkt/50rXyb1tqgLhngKT47EPZDpwvL3WZsds2m3VrgC?=
 =?us-ascii?Q?5XqlK5IiQeBhtxGxiR3GR1foKY6JPhabZGNM/jKXDZDj1dMKrcUZKR4IyxvN?=
 =?us-ascii?Q?4q2WsNgBsFrzYSV9nLRRDT3iO/LvpvI90D6UtoUTbm/szK+MZOj0Lb5B2jpp?=
 =?us-ascii?Q?k2sW2uyI/v/92BJbQRM8lMBQmpieEgS3ik+5EEXz5mhwkrv7PyB5OQE/ceN6?=
 =?us-ascii?Q?aJYoKM+xazX7xaKctcRQCYpEAwESQmcWfohkdMfpWxX9LD5bNrw4I2IYcbbo?=
 =?us-ascii?Q?nllXykstBE0FzPFO6njc+Pms0h7CGFOTuBD2etXn+E2KZhTZBPn7Y6a7Fvy/?=
 =?us-ascii?Q?wiLhRrV1hKzvT6PNblOwE01zCdWps1NoQG97oh4+b22rqZ11S7ro0o/7UUS+?=
 =?us-ascii?Q?FBqfJ1iXlnKxDIDsctF8EbKsdwF3Q+0KL6OPS98vu/T3XUz4pzEnXeuwkl0u?=
 =?us-ascii?Q?UAOEujByrxz0Br9DdRnMkub9winAGrK47fv9h7uArZVuKoPDNB2R9WqAGnHG?=
 =?us-ascii?Q?jBw7bWz/Yuv5hs42asx0hswq88dv7OVqLL/C0C479WqYYh1Q0y1GGncZ7MOI?=
 =?us-ascii?Q?0k86RXdoERpgrF5YWO/OT8oRK6B0AUQ6VQ5f5LhX/M+Sn+rQeEYPE6HvvImn?=
 =?us-ascii?Q?HJDCQTHhsPtY6EB+OeNUgxqVd7U7oncDP4qu0ylaZycdtgPETJNqA0uHGIlu?=
 =?us-ascii?Q?bfHf3fRX2zj4iWreBJ3xltBuC4fJIM+2Nnw4/qqFJVwRRMrPzvBEl7041tE/?=
 =?us-ascii?Q?VxKGz8BRqERw7jjOZiPJu9H8JVVk/kK2B0yuIHAy/SUDnOTyaTGF/ihxUw8J?=
 =?us-ascii?Q?YCgdrvTmzL4vOo7X/KOazvL2Ki2N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LzBn7Kr7WKOCcuc/MViF83jvGKvbFjGvHrUkhEicuE2PaPv7/pizS2rx46VA?=
 =?us-ascii?Q?8gJYTQ3XPRXBlJPfdMlJXVT7I08XJ5MaXSNzjse6tAEixpGN8sKA35JmlL/G?=
 =?us-ascii?Q?k7DXzlqPBLPV0wZoHlL2H/fAsNrxk9LDOfwabVgvjshUmuNM7xZNYIAYALw/?=
 =?us-ascii?Q?BVrhY0gW/n+2V7KNxYlJixwRL1ZXttXNrHBeNwMWmwXJFg01andyOC/WWZwk?=
 =?us-ascii?Q?XvXebbHoUPM7xJOoLkt7jmsjTzG67PeOVjPxlxzzTKrcyYTkTXX5pU6r/yji?=
 =?us-ascii?Q?pkh4OUXtU5GFxot/ziUrkLZTmWUaJM5PU0tqlnz1J8TnXysjgrIBLXWcqaOL?=
 =?us-ascii?Q?kR/VBcw8Uc2gqTvXi/GonjL77jnwiqwEtb9u3rYabQvysZPvnOrk3xAYym83?=
 =?us-ascii?Q?xHmSet9EQTYTHZ19moatynQMf9PoESgtZjAXD7D4UNRxQJQI4+ijuAg+A2dF?=
 =?us-ascii?Q?sFfc16cwGS070eAxt2vVG00E76QyBFZ6SfkoIkjs9QbSCU/0maN3oY1rbEEU?=
 =?us-ascii?Q?EDpwGH79L2hxJ7Bqazwd28tAx1PbrBmME65w3itlRQ0x3Ut1Feo8oYUAfrTQ?=
 =?us-ascii?Q?YVJN3t5K9nWmKmq+Q78wmzcEmZvF1KC5CPenyiehpoZXc/iNV482miXP11PD?=
 =?us-ascii?Q?kdxhDAkICNpIATy3j3nJ9K0u/M/9EnJFLxIcTTmjqvlFmEay0Bc61LiDZoK8?=
 =?us-ascii?Q?VmvFUDoOR4IIWNOard23MTICdvMuPR0J8GQnL4VB/SPud2lUzudFTsUgBuQy?=
 =?us-ascii?Q?WLYCq4Dp4C+dd8Ga1B5z2rBtqVsK3vYUx8KEX0M/BcN4hoPtA9I2JaTcJKQ6?=
 =?us-ascii?Q?wAOL9ObqMVghxwjMUdl67O2YbLo3yd2w0ZYdONk7GWhDzNAwOUov0mR1p0dV?=
 =?us-ascii?Q?adjFLU5I1rZFL7HQQAoHex/bX78INKpO3DrRT+0OYmx3Y62aXmR3ZV9rTZgT?=
 =?us-ascii?Q?BSUaL/u15U+rb3HG9VW7fmPFJFOyGuS5z/Qov8HtHzBFNj5VEtrYvE7nhWnw?=
 =?us-ascii?Q?Wi8MtRWpojzFxw1PsgYYLPE+K5/DNCXuHPADWLMEsyce3xey8wAPYGozNq1I?=
 =?us-ascii?Q?GRJC22HGxH5InDygAzrkljPiHUW3Xo/1/Cl06x9IbvcGmHO2Ie0QsJKmaOOS?=
 =?us-ascii?Q?hbsfzT2iqIHwQ7cKWm9HUO81yGHhLo6A88oQrDktAG1sWCt0GaIdOtMEAK+A?=
 =?us-ascii?Q?UJQSoRAj3jy8CFAP1yR5ilKX9DXJrAvgMUl3YTouPwPMatgtefnBLLVdyMzp?=
 =?us-ascii?Q?d+CwwgA0YIrKp1/FtL2fiyaZklz086XkJozdeW5Hy5auSVNrYIVjfNzCRSyR?=
 =?us-ascii?Q?YbGMjdWVIShgkaobq8avIIE43wdPyHhdiFYIGrZMhAj3Lik3qd0hGbSDogK0?=
 =?us-ascii?Q?/SOLsZTDFuP4W1hm4TfzLVEt8HmaBKrYGNn89+3+HA/zP5WVxlZgEsjfICoa?=
 =?us-ascii?Q?rXriYTp0aPLKsRlsBl5cLlBwORpn+fW665dDoAW7GYMpGNey/KIIIKCzPeLO?=
 =?us-ascii?Q?0OHaOfwiZC68vd7sqKLb0jle6OfbQSGASMGvHWn5RgiMMhJVamr3oMQI+tqD?=
 =?us-ascii?Q?+Gv41f+OPOfyCtL5oW0bk8+o0AzqIEhKSdsp4JUE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e64767-e1f0-4ed4-470e-08dd471fbc29
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 02:32:58.5118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3q8vaIydpRQ4yyuH0RmXOB02FMwqFDs84ZQqf34DYDEka0kmK3fcCDUT6sYZetMRSInEGjpwro9t478AQ79zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4688
X-OriginatorOrg: intel.com

Jerome Brunet wrote:

[snip]

Overall this seems like a net benefit!

 9 files changed, 160 insertions(+), 348 deletions(-)

1 suggestion I can see though.

> +
> +/**
> + * devm_auxiliary_device_create - create a device on the auxiliary bus
> + * @dev: parent device
> + * @modname: module name used to create the auxiliary driver name.
> + * @devname: auxiliary bus device name
> + * @platform_data: auxiliary bus device platform data
> + * @id: auxiliary bus device id
> + *
> + * Device managed helper to create an auxiliary bus device.
> + * The device create matches driver 'modname.devname' on the auxiliary bus.
> + */
> +struct auxiliary_device *devm_auxiliary_device_create(struct device *dev,
> +						      const char *modname,
> +						      const char *devname,
> +						      void *platform_data,
> +						      int id)

Almost all of the devm_auxiliary_device_create() calls use KBUILD_MODNAME
as the modname.  It seems cleaner to wrap this in a macro like
auxiliary_device_add/__auxiliary_device_add.

Then use __devm_auxiliary_device_create() with the modname for the one
special case.

Ira
