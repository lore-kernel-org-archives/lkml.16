Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9DE10E4
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748567169; cv=fail; b=hLWo5HIVI137y+ADPH+pm7/EKu8pOFHwbf4zcOJ49necHTIzzSL7ya+d+N2hZtQ5Eun7PaavsAJ008DI+4WV8MnPzgDwD/6uiIAsrSXGv7kS1DPG+oDmQ5hRYpTOkaI4j5JvX92RmT/TJX0O0yjCW1Ul+1krpOUOTtt/2M8riq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748567169; c=relaxed/simple;
	bh=NtR3vaNTx2UMO/BlHuD4zDFGTwosInzf2p35v6nuw+A=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=Gemykf1niyqgj2DU+kpuvAf84gjHxUY5oZriQuJ7+NncklorOCP7VsyUYfhGvHo7DU5qkSvkJF3zDojuajVoPRjLPpJ1X+iMCl16iqKXb2RA17o0bZrwPku+EfqxOt5ixhrGkc3/Gqd+j9xnF+fMDW6yhqvMRpGNf5a8faoUV5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTaki6aQ; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTaki6aQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748567167; x=1780103167;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=NtR3vaNTx2UMO/BlHuD4zDFGTwosInzf2p35v6nuw+A=;
  b=RTaki6aQ2meGcpeucebP8pCa33uX/LKYuIfxD/OhI07/GV0YYpYzvo6O
   dymVQRld6X2bMOyErGttfcltcaem6WSSsnmimt+cwgf/CB0hwraaR/4xL
   qcvTsnirugjujSEjG7y6EBmnvGa1FWIZi710jQ9lV/1ahjDgOVfCqaADU
   C/UzZ52GWrWERAE7eoejtRwTDnuG/QZgJMyhqqC7GtfCFJM2blbNIsDU0
   FakEecTjKINRWR5INkEfY008Wa937h02YWME+HpeVPbEa7Cf72Hu+ccoI
   aKP5khCpreX1s8jm73YLZ0Fv8030JuQdVxm8K+8cHzG0CqSyZmdZMtnJt
   w==;
X-CSE-ConnectionGUID: 63V8J3+mS2udqOErDHCrFw==
X-CSE-MsgGUID: 4MWWgE12QrKjufApLYPdkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="53277076"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="53277076"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 18:06:06 -0700
X-CSE-ConnectionGUID: xJsGGcGbRSCTg0tZYh6gtQ==
X-CSE-MsgGUID: p+sYd7fVTNKgyjVLaD7stg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="144205804"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 18:06:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 18:06:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 18:06:05 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.57)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 18:06:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGAY707nBoBY+kFlCO9CdKajl8kqwWWoXDKWhaNnNKb4FsEysjuB6EXtcwpXvrG26L5VHmJ5Sc8Ef76JLJ3ESmT26Gk8rTTiJDBRZrSuR7J7Lloa0q8BmhNx6FDEf667qjfFFTgiG2S3FyUg4uS95F/xWajLkXYkoP/CDHyWMP7Py9+nbu49jYAgCvuvKKsa9BAny8aiYLgiYLqIuAtqXdeOulMn7yd6DIxrNJj7z+FODb5vgwtijJW72uD/Ehzp2X18BqP0dEuzNBYYOTMl5kXBum8Wt8DHZ+u5Xt9x4qjR30IxHhfbnB3P8thkbIQ5lqXm0S9IkC1H3H8pKbUFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgRo4oa0y/htJaNFBMMrhaz+mFQizkVRa0TpvYaldNM=;
 b=HH84pCWTZShxxwyK0lLJZc2fP8WX8DGnV691NMkDZi+0dwbOML5trE3dv+xY6Y38r4G2KyIzS+P+Q9GpJJZlpPtR2VW0xz5njZbT9C8AldUsY6+8mB7H3EDwFbGzydvkHU2YnkBqmj1douwJMJL6fNqKa384oTgVrff6vUTWyytSGjr7H4ok4ycx9yFyVUllzVEy6PHgu4oBoE7M86+vOObJ2JI/vyUYGDQ+8j0iOD9Upeumy1m0zMc7u0POvZKIsYQaUyZoGjiPGNsEE9UwR08gibsDxTvJok37ge6nL54wPIG6aI7oRSZ5Xte4AhSGRu1pHK7k4yY+BNLNne7Ddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 01:05:21 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 01:05:21 +0000
From: <dan.j.williams@intel.com>
Date: Thu, 29 May 2025 18:05:19 -0700
To: <dan.j.williams@intel.com>, Linus Torvalds <torvalds@linux-foundation.org>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Message-ID: <6839044fe39e4_218f1005d@dwillia2-mobl4.notmuch>
In-Reply-To: <683902e2e98df_218f10017@dwillia2-mobl4.notmuch>
References: <683902e2e98df_218f10017@dwillia2-mobl4.notmuch>
Subject: Re: [GIT PULL] Trusted Security Manager (TSM) updates for 6.16
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0012.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::25) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ1PR11MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 371a1e3d-3b1b-4f7e-d698-08dd9f160d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWhhRHRCTWxsQ09EdzlXcGN5TTdnTGlMWmVDeDI5eTNZeHFsZCtJSTBxK2Ny?=
 =?utf-8?B?b2NhTUxjMmZwRlhMZmtGc3ppQWNVQzFxOUpWOWFjRFJ6ak13aHluald2YUp6?=
 =?utf-8?B?TEVKZEhrektDbUxMejl1OFZ1cFV4VDAwMFg3YWVQc0hZdW42N09vOWJKcC9E?=
 =?utf-8?B?aEpuVklOem90UDRQekZKMDJ2Zk05emJGMHZ0ZUl5YTdSWjVMUzZCYWw0Z2Zh?=
 =?utf-8?B?aFpBc3RkUUxSbzhDMWoyOThPUjU3SG5naDJSaWpXWjNZNHYvZmZJTmFKTnFE?=
 =?utf-8?B?QlNBbTZwb0RtME4vNG1vd1BaTkppZ0RVaTB2dWI5RDlNOEdDTlcwQnRGbVN0?=
 =?utf-8?B?ZFhBZTRxVGloS0g2MDZ2RzZ5R1JPRmsyMUlrV2pDQ0RhR1JzSGxkWXJXbCtS?=
 =?utf-8?B?a05QM2hpSmNCWk5zYkdFTUQ4S2xBc2lNU2I0M25BMlB5OElJYXZINzAvLy9s?=
 =?utf-8?B?MFBUVHJ5ZUNXcUJQY1hCcXlLMWErZG5FckZRcGQ2cHpSb2E4QzRmMVRLWU04?=
 =?utf-8?B?eFUxcHhUeGxteDR1YVlkc3cvZG8wYU9vNktOSkZ2TlNkTU51aDJuY0VVekxX?=
 =?utf-8?B?M1EySzNHOGhNdkpkdDliY3dGN2k2MzNwR0FGUFNrYXVSVy84ZXJ1SVoxU092?=
 =?utf-8?B?SlpQbE9VS3ZMSWZ2SWtSRSs4TDR3RStXWkUyaktZYmpmak5FNTJJNm9RaTZE?=
 =?utf-8?B?SDA3dXhsZjVUR1hiZ3YvOUxnWkVUdVFBWFpxOGVwMjRBdjhVK3Z1MXh6cUFN?=
 =?utf-8?B?U3VPQXQvM2xtS3BjRVhDZHU2R2M1SkpWY3VYQkZveWN4YXNOaEVVYUQwVFBU?=
 =?utf-8?B?dDRXTzFFaG90blcyU0FBeVZpbThLeFRaQzZRNi9LN1hOYlZ1TGFGMjFnTm4x?=
 =?utf-8?B?bmpveC9uQkhZYjVUV3VVU1ZOcVhiMU02VVlDenlXNURqMFRDci9Wc29LbDBF?=
 =?utf-8?B?Q1JZODFCVURxUmJneEtRaHNlVk8rL2lwaUcwbkt0VHEvVlRZZWtkejgvemZ6?=
 =?utf-8?B?K1ZtWGNxaHFMN25SaklMMGdsL1J4M0RTb25WWHR3RUMvaUUwSFBBblBrMFk4?=
 =?utf-8?B?M3VsRGwvOTVVRE1SdTdZOFNXWW1FVTlVYmVjRWo3V3crb1hDcHRiM0JCWW1i?=
 =?utf-8?B?TnQraEdsTXd4TmpuT3dHOWFTR0tLT2szZlhhSTJJUUtQc0pyRm1aYUdjTWRY?=
 =?utf-8?B?bzhlcGNTcERsNVlZUEUzZkZOWmVHWHUzbTVkcXRSaCtybWJzOE5tVXJ3cy9a?=
 =?utf-8?B?YnBudXlxeEs2K3g5b2E2OExZK0oyQS9wTGZSRis1Ri9ENU1FWFNvb3dIMkFI?=
 =?utf-8?B?T1lVK1hvRUxocTBoTjFkL090Z3cybjFEbDYzZHI4cUpCaVN4OWVWUi9ndERF?=
 =?utf-8?B?MmlrZVBOYVhMbG12Y3hjb0d1b0RXSmRCYy9aQWI1NjV6WXhqck9MV2VhMFRN?=
 =?utf-8?B?Y214VFhpVnVsUWliaWw5NEtlV2gzWjh5MHpvcnVGKzltUkc2cVNoZHd4Y2pa?=
 =?utf-8?B?QmRNckY2Q09uWFZva1g4N2F1ZEJpbkM2QktFODdZTGhEVkRRSDIxS2ExKzNP?=
 =?utf-8?B?WVBlaGJwdlhUR0VSQ2RGcXFTYkl6RlpuQ3F4ZkJYNDk1UHFRdFRFcWdNV0Qz?=
 =?utf-8?B?czgxdFR3bHNUSkR6VTMxeW16cWJIcUVHMEh6NVU4S2lhbUZYZzJ3bmVQWFY2?=
 =?utf-8?B?UjFpdG5vcXBORVZKQllWWlFhWEI3TTVUWFdvbUV5MGZsVVFpWXM1UTlXNHEw?=
 =?utf-8?B?bU04cTltN3JtV3JXL011dE1BbE52SWJlUjVLQnBmNjdYd1puZG1ibVNNL0F0?=
 =?utf-8?B?NEZmRnd1WDZyMmJhMVZJTm9aTGtiU1ZkY2VtWFB3SnM5RUFJYVQyUzRwNWNl?=
 =?utf-8?B?V2lnbTVGRm1MSlJTRlhYNWs2djhFelQrb2JySlVDS3dLRkluSFRRUzI1QS9N?=
 =?utf-8?Q?51YwoRy3ipU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlBndzQ1L2NjUkhSazdsWkpyZUhzZktLS3JHK2djelJYY3hNa1ZwWGd0dEZa?=
 =?utf-8?B?YzlhSjUzQ2hsSUxJaEpWZXIwUHlyOFB4SVRjTWdjbGxVY2JJN2N1Tmhlb213?=
 =?utf-8?B?TFZDeC9yOEw3Mk1kdm44bWJjU2t3bEEwNTZ5K2xiSVdkK1ZOOXBEVG9kdVNz?=
 =?utf-8?B?MXVNZE83NzhzUVZGNHc0V3luMXVNZUtTOUErWnZWZXRac1Nnc0VmZWovU0w3?=
 =?utf-8?B?L21SQWVxdnF6TE0rdmZxREk2Y2kzSHdMVUxySGJGWlBoNWlJYXJ5YmJTcHNN?=
 =?utf-8?B?WlNKb1NWVXgwSnNHL0RNaStHaU5ROUFiOWFDT2c5cldUMFAzTVFQTDVPT3BD?=
 =?utf-8?B?Lzc2WElqRDM5eExmLzZwQ3FiYjY3OUszVnhQTnA2SFhET0U2cnhmbzJKbyt2?=
 =?utf-8?B?YTNlZWtORER1SHV6SG1zMGRsQ2dnMjNqK0RTbTI5S2tVcmErdk1UL0I2dEMw?=
 =?utf-8?B?dFo0M0xFZHFwbzcvNllVa2dua2FjSFpONzF2M3VRbVlCV0xubEtlS0xPRUVY?=
 =?utf-8?B?Z2VhSXNLc0hvN3VFOEl0OHJQcUxKMlRIYW9JMDdmV2lFbnpiUG1MNlcrRTB5?=
 =?utf-8?B?WkhZZktiK1Q3aVJsZDMybXNZT1h4SHJXSjZ4UjlGSWg2WnVkRTFlOGM0NTlB?=
 =?utf-8?B?TzVxbkVMRzVFVHJ5bFFMckE2cXIvWkdMbUFXaHlnNG0rM3pBM0Z6SmJDdFRB?=
 =?utf-8?B?SmZPZjdvUmZmN082cEozTFV6bTU4d3hXa2E0WFVUK282MDlkalB2RitvUFJE?=
 =?utf-8?B?VDh4eDRpVFhEZlNKRDVUcVYvT1RCQWwvUDhrWWNpRURwMVBhRTk1V0NlZ1lY?=
 =?utf-8?B?OW5pOUMvUXd0eUN1bC9UM0hSRFdqZVlYL1VKK0RTeC9KME5MVDZ2ZGF3TUEx?=
 =?utf-8?B?cEhyWlFqMEVVRDc5R0NwUmhrNkJMOWZiMlczdmpQUGN3dWZ4Y2VJTFBHc3lK?=
 =?utf-8?B?VCtpaUJjZzd2NmJZYWp3VytXVFdmcThZdTdCd3Z5ZTJPM3NUNU5lcVhRSXl1?=
 =?utf-8?B?QzRqS2hWa0I2TUV2VUJWRzl5bGFsSG9KekJQNkRRZStHSS9oa0dsN0swd1M3?=
 =?utf-8?B?VnFLdzBXMzZqc1FRMldmeW5XblNEUFJDN3RXTkx3cmY4SFowRWVyV3B3SGVY?=
 =?utf-8?B?VUluVExHVDlPbktYeHNublF4U0JlZVdSN2lpaXVSa1VrWG1aV2tsVk9GWUk5?=
 =?utf-8?B?WFhJaXp6bS8rM3Vqcm53UDNNSSs1eWZhdE9ld3dzc2U4MUdIT2syaGxyd3Er?=
 =?utf-8?B?cndnUU9DL0dick1iT255MDZxbi9WWk5YdlQ0cXhJVW9sRWQ0aGlUV3dIWlh6?=
 =?utf-8?B?QTFUb2FUbjkwS2JzWHZNUUM0RmZzcGVrdjJmck92Uzd5OFM5Nm9ZaDlxbFVy?=
 =?utf-8?B?SVo5MkJ5ci9IdFlTRTBRNFZlWTFwbm82QmxTQm5FWDVnZ09nQnlkVkNoYkl5?=
 =?utf-8?B?WDBPR0hlaGd3aEY2V2gzS253dUgyTlcyL0ZCSnl5SGxhTkVRVzdGUlhEdmFh?=
 =?utf-8?B?MmNLL1dlTG90MDZYZS9TVFRLTFpCeFVWb05SZEsrdDRMQVowam1MSkpmRDB5?=
 =?utf-8?B?dXNjUHJVcW5rT0o4RU1OcTJ6WkowWGs2RnllNUE1eGJMWU91ZEEyYkNoU0Np?=
 =?utf-8?B?QjhiWmhjeDJtT1ZYWDI3RDdWSFVxYnE1UHQyeEVCRzgyVnRVdjU3ZWRrdk5C?=
 =?utf-8?B?V2hLNFhqTDRTekg4MDRkbWpKbnE3NFZLdFRLbkJ1aHppRWFaQ3ZOT0I4VlZm?=
 =?utf-8?B?QlFGZ2traFZKa3JUYzVGTHU4N3ZxMldTSFE4cXZIdENDOGd4cVVNSnExaTc5?=
 =?utf-8?B?WS9ueHMyamM4V29YSnFwU0ZQL1ZsbWFVWVJNQzhxQVRacmRwcTRLTzdJd3Vl?=
 =?utf-8?B?anplWnowZklaTDJMRTZOdGJXT3hRcHBRRjc3STgxbTBhWDRoLzliTUtZY0R5?=
 =?utf-8?B?TS9QSkR1LzF5d0tIdE9yNDYyNERhMVhxcWRnbTVNRUUxRXZpV1BsQ1JUR2g3?=
 =?utf-8?B?ekhCdmMyczJ4QnV5MWhKdUlRdUhneHlmcVlBeEs2S1pqbXlUak5hcDQrbm5Y?=
 =?utf-8?B?VHBBRWVtbFR3cDBnVFFwaTVVY2FZOXJXN2todXd5K2xoU3ovWUpjd2hxTDJs?=
 =?utf-8?B?cGNjWEQ2WnRJOFZwRGUybzV0bmM2ZUZyOHljbCtkNVVzNEx6MWw0ZlVNUjE0?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 371a1e3d-3b1b-4f7e-d698-08dd9f160d18
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 01:05:21.5622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHH0/DcuaWoghbMy41SMQlN2AobxqXI34sbHt1YYOFKfFV9bKG0nmjuhIe2MlZGppgPGCnANAfiIuun1wyWFZJxUCis7N6EkqauQeTvVL6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6083
X-OriginatorOrg: intel.com

dan.j.williams@ wrote:
> Hi Linus, please pull from:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-for-6.16
[..]
> ----------------------------------------------------------------
> tsm for 6.16
> 
> - Add a general sysfs scheme for publishing "Measurement" values
>   provided by the architecture's TEE Security Manager. Use it to publish
>   TDX "Runtime Measurement Registers" ("RTMRs") that either maintain a
>   hash of stored values (similar to a TPM PCR) or provide statically
>   provisioned data.  These measurements are validated by a relying party.

Note that I meant to include tags that arrived after I cut the branch.
This work is:

Tested-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
https://lore.kernel.org/linux-coco/aCWoPWMjg9rX2qPl@himmelriiki/
