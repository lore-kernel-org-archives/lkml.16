Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8803E266572
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443684; cv=fail; b=r9MED70HW6vP8EFi44+pI3thBSfx7vByx/G2BWoJnV1xR8v3CnpozaBzY8B4zApHdKx4d582bxDJ3RC6P+WlB62ywUWd2UrDbloEt1HNGgB9xF55eCnbLRQsjlBiN2q35Aj4e40lm/1rWguM4HWATlwvMzQkEJDO3wUHjUuUx3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443684; c=relaxed/simple;
	bh=traJ70vw3DtikIjv4r7cHhrmpI5HwFwU5fZ9622RrFg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YwmGmWdDclhRq+kCsQ70rtKHX+vmlAKFp5/0pzXCcu/cqLL2vivNA1PaYE6q3MIqqnr3r1HWnWUV8A3QVl0zolrdj5FJyIo0DEN6w8bivawRwn99OBJXFBCZ9EYQaGPBSdWVlurPQAMaJnCY9acFu6jPvxiVvb0HCVskDa9B4aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQ4Q1TlJ; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQ4Q1TlJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745443679; x=1776979679;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=traJ70vw3DtikIjv4r7cHhrmpI5HwFwU5fZ9622RrFg=;
  b=KQ4Q1TlJqPcoW0J1KEUSuZW8xdZ1l1raOFgwT31C85yvqy7P9wbpLJSW
   AZ5mwe9FMhUFFQ+1b8sATHO8ULoIUoLXF/Gd+5LzUUR+aRkYqpb+hnXFL
   FWxkNaBNc/ZcQXA9c7P2g5SLT4oNQtdWUFW0yVcp2hTjwsZ5UhX/rH805
   H4MERBi6uqaV/zUE7HpqBVQQraQQqljq9yfrxO1jXCK2f0Oo6y5kriMLU
   MA3D/VEyWj/OzRURAdcIOaV/XnK9oAs/6WLpMrU54SXmsC69zsGqdBKtI
   m4pwbGVaUsLBGeeVHfBAcRU0VZh3Az9kOjbdpAJr2jfxqIfXOxUNBHcOv
   g==;
X-CSE-ConnectionGUID: kWdjqtihTLyA68wEL+6NnQ==
X-CSE-MsgGUID: G0RmBy1XQluvuIO+a5V6+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="49720439"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="49720439"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:27:58 -0700
X-CSE-ConnectionGUID: vUr4Ev1uSXyqiYEYeK16kA==
X-CSE-MsgGUID: DRQNF+mXTsGmnOF+yTjSuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132946481"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:27:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 14:27:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 14:27:57 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 14:27:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GA0afv4tf1z9GHZIzL64IqoV2UmUSMI8U+HWQwJzbChr53MBXbLk5zOeZu3asI9WjRZYXZ7TI8gwPR2MW+LAVbP3xp/CgxMavvrehl336Bv17nKaXsuFg303Bsbt5Lhys1lbK5mASaI+AU1E1J3bOWY+HC7vtsFlzFiDtVOykkpG8GugMxMyENZQx03w2jFaTygeoEoAbMV8g6I/e0dStfXhXS8OToNc3xFLgor/4ntqoEHdQ0XGh25x2M94q5ARlahjUmfyA3tgsb0m9w56FWKZqcKcojxkyKeodRiMwGOrfA69faNvQSk9hpZRRKizsqjY1izj/PXIVkU0j2AqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5eLat8Xpdg0SFYvQnupJlyYPm8Dn/Ud6+AX8e6flaA=;
 b=UxyJz4zybr7SOyw/nbRsLEKLR3gQgz07JjXIWJN3RCWQMwXYnMZpcoZrPGsXX5CUYizs8gVOYfze4y8yc91DoiWA16gulU49XPRuU4W9woskIKQiX1mQSYapRmyl7WizyH6C9AOyvTQocyYZ1PdLYL94ntd8PyFr3erjH06/iHtARd9YY0krJJlfGDs8jwRIXfPZ3U9mbeMkZcjyVnWoqn5uY6aKKR1qxAtV/1pZpLLbGp7QufVHf5UB5upE+mV8tFrV7jhDfT7JKCWLdmybsyqy6YC4VafDZAphQAJBMXUavkIzXVh4haj3k8X6Z/PzcxPgIA6mEZjFit0gPsLMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 21:27:48 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8655.024; Wed, 23 Apr 2025
 21:27:48 +0000
Message-ID: <240d0962-b381-479f-b3ed-4e6ce72d6570@intel.com>
Date: Wed, 23 Apr 2025 14:27:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] cpumask: add missing API and simplify
 cpumask_any_housekeeping()
To: Yury Norov <yury.norov@gmail.com>, Tony Luck <tony.luck@intel.com>,
	"Thomas Gleixner" <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	James Morse <james.morse@arm.com>
References: <20250407153856.133093-1-yury.norov@gmail.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20250407153856.133093-1-yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0330.namprd03.prod.outlook.com
 (2603:10b6:303:dd::35) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: a2580a33-0677-4ac9-c02b-08dd82adb1b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmYwNEwwcW9STHJrbm50ekhXM0lWQlZ1THNUbG1FaExoNGV5dVorWEsrdTJt?=
 =?utf-8?B?M3NYQWFLdVNuVXpQTW5QekgzellnbWRWdW5nMDZ3WXdoQW9nc1pxM055TXBI?=
 =?utf-8?B?dmZxUHV1aFkyQUV6amtlZHpSczVnS3JyM1JhZDJueVE4TU1nS0QzZmdYcVQ5?=
 =?utf-8?B?K1lWdHlVMHVnbE1SUmc2VFVVNEZ2MkVSN0hTZzROYUhSREIrbTBoWEZJZ3hJ?=
 =?utf-8?B?WVBYUDk2UGZtZ0lmVmlnaVVSOXRwekxhUEcveFlwQXoyWEFWcjhNN1M2ZzhT?=
 =?utf-8?B?YlZlOUJVUWY2V0JqUERhd1JLUVFVbVptSVJZbENwbkhqZ3dLNWVpLzUxL1ZW?=
 =?utf-8?B?Vjd3Rzcrc1BhYnFPYWg0SkJWS28zZllLNnl6QnM4YUtQTE1Sb2RsOUVXUXdL?=
 =?utf-8?B?Um11RGJEWWpsMEszSnRUZlZlOUVBcndGbnliQXBHdjRvcVJyVzBidDExRU95?=
 =?utf-8?B?eXAvRnR4YWdQVFFTbHhkSnB1QjdueDlsRDlqNEhkMDA3SXZHR0M1QzJvQ3Jm?=
 =?utf-8?B?d2x4K1JyWjZJWEU4TE1UMUlvUVd0VkI2QkQyU3cvMHpxb1VocnhmaXFhZTFx?=
 =?utf-8?B?Tk4wUXhOK29jM2Ira0xIRFQrbWg5eXBDeldmelBYT25kUExaYmdDaVBuWmhX?=
 =?utf-8?B?ai9yL1AydnFDbjljT3ZGbjJibzZBUFNDZ0dkNWp4K3l3ZGVVdDFnVnNZYzJZ?=
 =?utf-8?B?Q0sxUFA4aUVncU5YQktNbUZCUm5xWFh4bDZWUm9DWHEyejVqakJVQ1U0bkVm?=
 =?utf-8?B?dC9Lc0JteHlxY3cxYUxOV3hsVXIzRnk5TEJkRm8vcVBhTVF1T0xvSTh0cW9I?=
 =?utf-8?B?KzFMZWMrS2NCMmlQUFBEUWZmeEFNUTRrS3hWWFlobjEwc0V1UHYzaXNHcVpp?=
 =?utf-8?B?czdXajJGWlcwbjl0eVFRajdSR0JianJBNXpzbmRQai9seUMzNmE2dldZTERr?=
 =?utf-8?B?V25mSFUzdDFiSkNVb2x2aDJPSmZXUDdTMk05MUQrYUJlL0RJNWRaRUVrQVJZ?=
 =?utf-8?B?aTV0Z3ovKytUeGtKcDNwV3N0ek1GMlJWSnFoZktPbFRzWGphNVhtN20weXdF?=
 =?utf-8?B?eTl4SDgvY3hESEFiQ2JWS1FKT09ZbWR4VGI4OXFHZ0xKNERDcUxHTW4wRk1U?=
 =?utf-8?B?ZzZwdittalo0QzVCc083K014WFA2a1hPQzdmTTB0cjFwbCs0ZElLK3FJdUlT?=
 =?utf-8?B?aVcwdHFiUHRxTEtDV3ViTFp5dE9SMW5VRXFLRy9FLzFZM1BZWnBZajNjNjlW?=
 =?utf-8?B?NmIwRm5OWUhMdTZDK2pObksxWHV6MGVGZ29OZzNOZGQ5cDVlUEEya3duN3Zn?=
 =?utf-8?B?dVZiRU1WZVZYZTdjbnBJQ0d0RHIwYUNDY244eGQ0QW8zSUZEOXYrOFNPTW0y?=
 =?utf-8?B?cEdEMm9uTmtpUUg2ZUNzeGUvTWZ3QzEzZXVDYU5qbStHMG4vTG5yQ3h6VnRw?=
 =?utf-8?B?K3FneHJpcUIrWlZ2VDVIZ29teFVzS1cvYkhCS0dUUENKMXUyeFhXbjE0c2Q5?=
 =?utf-8?B?K0tjekZsRFVpaDhrZWp3M25tVzVSQ3JhWkxaalBTcWVnOFFCVUYvaXNjRzIz?=
 =?utf-8?B?RitFV0VNTmlKSlNZc09MYktGM3BjU1R5S0dwK1lBdlowZTVQUCswM2lRU1Nw?=
 =?utf-8?B?NU5oT1NhOGFkaG9sRERsOFRhallJcjdXMkhwQndJZ2szVDFLYUhzbWlRNklO?=
 =?utf-8?B?NlgvcGhVaDY0ZHdrOEJWWTZnUmtDeFhZOGZpZTZSaC9QZmNiK2NDMTVmd0pL?=
 =?utf-8?B?amswT1A4dGlzdFR0REs3ZWJyNDlVWUhSUjhMZXR0Sis5OXU5KzBVTk16Qkcz?=
 =?utf-8?B?eWpWS1lpQUNvY1FOTHR4YjN5RmM2d3BNRVoyclAxQjdWZWpsVk5yc3crVlNJ?=
 =?utf-8?B?TFJMZnV3S2p0QWFnR3lvYnVCNkJ0OHhDNXFIcUJzdTkvSEw3Z0kyeEF0Mm9j?=
 =?utf-8?B?b0lpTS83dUxCcGlOOXoxYS9meUVlNzdlM3hIOUxNSElFclpFYjZZdEhvSHkw?=
 =?utf-8?B?eHh2SWpsQzhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDREMTNnVG1HYzIzcFhVd2hXOGxDM1cvUU1XaldUbDBjSGZYVm8zUFoyQVFM?=
 =?utf-8?B?bnNmSXVsWlFiNGdYN2dObGZ5cG5YUXNHS2I5NEt4cmFrd29uVDNwSkNhb2ph?=
 =?utf-8?B?Nm1rUXI0NjQ5bmpyc256dzdBQ2hZeWVwWkk5Z3lrdktsTWpHQTBKRGxIZ2ZU?=
 =?utf-8?B?bGJCVVpVTmNpSFdKU3ZtU2lWMjBheFdpa1FoZityK1FYdWlzWFRCTGM0b1lJ?=
 =?utf-8?B?U29zME9kZ29BbXZTZ1Aya2JlTEkrQS91THN5TW05UU1kT015S2VtbEFzbHRq?=
 =?utf-8?B?TTR2a3VDNnNveDIxVXg5MFlyVC9wZi9mamdwL0JkVUM1RnRvOW5CMzYrcHRO?=
 =?utf-8?B?NnBOVVZCT1haTkszTVRyK1V2N3g0eDAvd2ZMUVJvM3pKaWV2VVIxV2lwandz?=
 =?utf-8?B?dTZLUXczdURpc1QrSnkzeFN1R0I3L2dFMlpMaEV2dTlRSFllaUp6ZHVHMFFx?=
 =?utf-8?B?Y2tkRS85R3U3dUZnYVphTC9YN01vZ25kLzlsWFJ6YUdYWnZ0L3h1NWt0MEtI?=
 =?utf-8?B?Mno5bHAvenE0aGJncGdDZ2JESXkrNi82bnc5QitpUDJSZ2diZ1VrM3RLNXFk?=
 =?utf-8?B?NlhyelNuMmFCMFFsRXpUTU1ZTGd0MEdtc0ltRXd1UzJicFZqa0FYQXoyNzJI?=
 =?utf-8?B?NVNSYUtRa3pNTWlVK0xEL2Nza1lITFUvZHRySzJOdCtMQ3NiOEZHUEFuU3JC?=
 =?utf-8?B?WWhvNEVyZDd5RWlKeFZEZEtVclZaVDRXRUJBS3AzeXIybFUrcE5FNXh1UXRr?=
 =?utf-8?B?RkxML3lNR2hOWFZ3bFh5Yjk1TWp3aEx6S3VCOGJDME1iZS9hYWdsSDR3UkRP?=
 =?utf-8?B?ckNkTjZFUVJKTzlaUXpWN281RWtVOEtWN2NUM09XcFlENEV5dTFCOENudHZR?=
 =?utf-8?B?dnZKb0pUdGczOEJveUpnYUxDWU8yelBLSHUvVWVsVG93ZjlwK3h1MHVaaVpr?=
 =?utf-8?B?TDdTTVJ0Mzd3R0JLMVZnbGphRHBNNS96RjNGZloxVTV5dUZzbUR3TzE2SWZ4?=
 =?utf-8?B?YU9tellOM1VabEhqaDlIMlZzd0s2cmlGR25PekpjQms2OHFqdFJKR0JXTS9S?=
 =?utf-8?B?emw4b0FScWhQb0hYMlhPaFhKQzhvNUhIeFVVVnZLUmMwTlI5cEhSTnFOVkxM?=
 =?utf-8?B?SGlwWTlEWSttL3UvbXhZRTdnSlFjMFpGMTBQQWtZNEp2c3BWSnYvZk5qZW1k?=
 =?utf-8?B?eU5hZTV1Q0Vsdm9NWUc3c2hiWEhqNXhvM3VYdDNrNmM2UFlnYS9DZHN1N0lD?=
 =?utf-8?B?ZUxzaGYwa3B1Y1pIYlFGbzE5aW1RNTdsMEFJdjRrWkc0TGcrNXhoaHVyckZV?=
 =?utf-8?B?SlVHZ1doL0ZDa2JEM2ZBdllSZnF3bVM1eFpLaElOazlnanl0RDhhdFFvcy9x?=
 =?utf-8?B?RVRqdlRIVllvU0lzQlNscUJ5d2tzT1dIZmtVUDFKcjlJdkJHRjQvTU9Qa3lr?=
 =?utf-8?B?ayttVHQyS1J3cHZBQlJXOTY4cjZCbk1DOEVoNU5hcTJhYkxEZWdmSjZoZDg5?=
 =?utf-8?B?N2NFdmdGVWZKOUVmZnJHdUNncXpiODVQb2lHM1ppUDVRRFVGQnlXQVRoODdy?=
 =?utf-8?B?T1BPNUtaK3l6K1NGUlFLdmZQTzZIcVNEUHV4RlNxbFVCcU5qK042c2FEN2FJ?=
 =?utf-8?B?MkxlRzZVM0dsV1VUa0ZtT21GWDNidjhxZ1dOODJTSXZUQVAvK3Q3YmJ1L0ht?=
 =?utf-8?B?YmNPbVVEQUZxMlFHaDdPSmsyYnd4VkRobUlxWHh5aDFoK242SWVPNzM4Q0xz?=
 =?utf-8?B?NGNyWE5FRXJLQ3NVSWhYUmx0STU2YkhBOGxFckFYbnFtUzhVb1Axazh4T0hG?=
 =?utf-8?B?N3BBVVQrdEliajdmUGJoT29YS0dyeGdkMGJKZVdiV1pkbkl3TmRkU0VtZkVn?=
 =?utf-8?B?anE5WHBhTHZHRWQ5UnEvU0YzZnhqRHpqeGhhZlhZRnpITE1pWnBabzlPRk5h?=
 =?utf-8?B?di9GYzFwdUdhcWhpL092UTdtVGszRmNrQU00TTMxWlQ1a3ZoRkNXdTR0WlpS?=
 =?utf-8?B?UEhVdmIrbHR2SC9mVlY2TlFhV2ljam5iR0ZTTmZpSmFpOCtQQ2I2QkFXWEpr?=
 =?utf-8?B?dzEwSTNQLzgyZ0F5alpSYlVoZ0EyYnBxTVJBdTkzMGhPMlJ6c3lWQ1NLQXc1?=
 =?utf-8?B?cVBReXdDZS9rUGRZSzVOSHBGS1RNclRZOGpoeUZtaXVKa0lMNkVVMGY5bEpN?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2580a33-0677-4ac9-c02b-08dd82adb1b8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:27:48.0775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfU3kf4EkH8Wfc0wqk0gHndV3mO42U9NqUo2oZCRt+b8XH6q0H4KUA1e9NHP84mZ5WTgUuHHa5+tGbyzlJVV3GSbRHjYlBGtx1cRV38ULWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
X-OriginatorOrg: intel.com

+James

Hi Yury,

On 4/7/25 8:38 AM, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> cpumask library missed some flavors of cpumask_any_but(), which makes
> users to workaround it by using less efficient cpumask_nth() functions.
> 
> Yury Norov (4):
>   relax cpumask_any_but()
>   find: add find_first_andnot_bit()
>   cpumask_first_andnot
>   resctrl

(sidenote: above list of patch subjects do not match the series)

Thank you very much for doing this work. This simplifies resctrl code
significantly. I do have a couple of comments that you will find in
the individual patches. 

Regarding upstreaming I would like to propose that the upstreaming of
this work be split so that resctrl changes do not go upstream
via separate trees during this cycle. I am ok with delaying the resctrl
portion of this work for a cycle. This is because we hope to include a
huge change [1] to resctrl that includes the code modified in this series.
Having these two changes meet during merge window will be inconvenient
for maintainers involved. If you require a user to upstream these new
helpers then another possibility is to upstream this work via the tip repo
if that is ok with x86 maintainers so that that huge resctrl patch is created on
top if this work.

Reinette

[1] https://lore.kernel.org/lkml/20250411164229.23413-18-james.morse@arm.com/
