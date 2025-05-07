Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728317263D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746650198; cv=fail; b=Pv03sfkUyfbDAeTZcN1u3yRnwUATtW19/EaygxWX0qivm7mHs/AN9x/4tYrxmoSiM5znsZ25+2jN2X2VCZu7SK5xkXxTT3bmXujG7XK+Pg40XjG9jiUjSjnf0OytuhnwfROtHr3rQ0mIQHLqMkgCq8KOoDE0uYfBqmcRuBPLYxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746650198; c=relaxed/simple;
	bh=gaXB3Ak/4TfPtSfqU/brVtDOrtDTEiUMRHHa0Jp5cUU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aj//ZLOKa7klsdIPzmsVfMuV9P9NPcgqxcLsE5OsiksLvxgNo/vGmnz1bsHtz8s7LbfmfBQlTMtCxbek1qPJ0LILsT/JXpyeoTHeAgwe3OfFVM1uYhxcdHyAu8275JRzkK6jsImg8teStugwoH16NnQ/A171uDwzimZOP8T1j8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXanMfWP; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXanMfWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746650196; x=1778186196;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gaXB3Ak/4TfPtSfqU/brVtDOrtDTEiUMRHHa0Jp5cUU=;
  b=eXanMfWPYLwDNWnruMNGBZ0hFv7NJIHMBMxmt2jrodq5WqCRja4QvPJZ
   q846Lf+RemRYL/wZGqVLfCb21+Vbc6AcrEvv52+DaVAyDiBDhurhls/U6
   GzaDNzJSjRiTR9aAe94Oq98dT18roWRWpwcVwrKAkpneaf3euy/Yy7Vj1
   0NswP/6wZ6+AZPXk+6oigaYVWr5BeQltNDJjUtfZrzDg8LEIgnoP6PWy+
   1b4OEhSiGX5wK8+04R6jVhZRvr8/YxOhmD9omVo0X0W0xEGKsI4iv3JrT
   sWecmEkW4NVXCrwUslqTm3f+TmtG5PmZr9xHWN6BN+6xHN2F603DaOIxS
   g==;
X-CSE-ConnectionGUID: CZOqBk0bTkqsBeUx9bGwng==
X-CSE-MsgGUID: mrP9oeFkQsCE0E+sa9WbdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51062685"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="51062685"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 13:36:34 -0700
X-CSE-ConnectionGUID: 89wD0GV2QRmvwkz0nNa6Ow==
X-CSE-MsgGUID: bG9wVghnR0iiUkjsYGDtvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="137002489"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 13:36:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:36:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 13:36:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 13:36:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eehsxJNL2kAO2Y/PkCjXBYZ3QKDVXgulJJ3u1PZ141DC0ZXgHNWVsSEJjpAlZBN23gTJUyq4WQ8LOb/0zta0Wbg/TVDna/gpwTdShRvU1y9TicXMM1mdzV2QRlEqTctsBHgLElYz3mmAizjTP+kNZnA8yu5t+eHeOQrDriDgrzuDPzrVGvQrELqjjNXiCwo34PTDKfnC68NzFtz2PleGNcqJP3UpUdOULkjiwXDy9FsmTiv9m1iYNW62oYlg0nccjSvoo5GHIdoFDxCxjZZ0eonlCeu2u7b4rBpSPmwWN1C123mMMGGIiIzk5J8AFPCgcPNZYt6mht49iJEmm0tUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmh+ZWw5gdY+7X2mfgfTQV5bJqU2IRKX897FzKLeTOE=;
 b=vcqHHFzH0jek9JQoHEbJtoVG0dGOzWrfC4OaVbS5OetqWIjPNLAYpfQRcBsfsFf3XQ95m88i2dvPvbsEgxrwWe3uN4sYM1xm9xdGUwLolSir8NkEr8ZyQ89ty9p7Y1URaubV//wYbfrQ4Sv/3zqeYb+CmERiZJUqHS6ZgUahGg5FUR683hd7S7U8z0dCqzi/CigmkpZmhtwuL+WjSHuAExMyFFHckTDejN9pwYzDb/rP2jitDEmTSQhDKsnm9EyLJCwhSsUMxG2X4781MWNVVTj01+DCQ27at0akeVP8yA1LmtAYBvNDveDwMaD0C/DYUm1Vssk2VCk6WgcaFf1nZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB7682.namprd11.prod.outlook.com (2603:10b6:8:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 20:36:28 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 20:36:28 +0000
Message-ID: <a949707f-6a46-44c8-ad4c-2aca949bbd5c@intel.com>
Date: Wed, 7 May 2025 13:36:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: <babu.moger@amd.com>, James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, Dave Martin <dave.martin@arm.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Koba Ko" <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <76b16ef7-2f37-4c30-97af-1d372b7fb251@amd.com>
 <f8bf0815-4013-4485-9ed0-a5b5ffab9f26@intel.com>
 <c88ebda2-8506-466d-9687-07566b7432cb@amd.com>
 <4176222a-3583-4a4b-8968-0cabeba6008f@arm.com>
 <f73c1a2a-702b-4869-b562-82bdefc8ede9@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f73c1a2a-702b-4869-b562-82bdefc8ede9@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f03fef6-0b4a-44ea-d7c4-08dd8da6d7ed
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1ZwWDhzWkgvcUhDRWl1azYyMyt1NkRGczVTYXE1bEpxT3RHRkVHazBoMmU4?=
 =?utf-8?B?MkEvdmt4cjRXRk1aLzBVa3BwNmN1ekFhK3lHTFYveCt1bExVckpweS82TzJm?=
 =?utf-8?B?eTRUNXhCKytXZlVsaFFnQU4yb0htcjJTbjliQmVPT2ZVa045VnJkalQ1ZG9v?=
 =?utf-8?B?MnNsT0J3cWhobHhiQkFuRXZBREJPbFdkQUJXUk81Yi9FZDFURllKRWUvNFNO?=
 =?utf-8?B?TDRrSHVkaS83NE1EUCtCK09URWlGYk90bU1HaFMrUEdpeXhGOXZPU2xJV1px?=
 =?utf-8?B?SEpRSVhNZkxwdXIwaHhBWEE2ZmdUUVpWUEdsSkJvMmsrTDFMWlpPVGIwTXZR?=
 =?utf-8?B?eVlkOCs2a0VPRTgyK1JlVHdGZHJPRVh6RjE3Z0hMSlJhY05OeG5SNTRVYng0?=
 =?utf-8?B?T0w3M0Z6a0JTT1k1cjA3UHh0WDJ5dUFqdzlEODMveFFldE5hbUYwZ09Qc2lv?=
 =?utf-8?B?aHRZemNYbW8vYTdhTEg1Z2pMajVBaXcyakUvWGxXQzIzdDAySDJtNkd6azRy?=
 =?utf-8?B?c1h2Y0h0R0svN3RTOWlUUndjMkpYTmJaWHFzQVZnZGx1MjJEa0dCY3pWdmVr?=
 =?utf-8?B?QUFPY0pkOVNCZmlDaUE2NzgvaXVvelBhTUF3S296dnlXSDRTZWw1R3ZtZlNQ?=
 =?utf-8?B?WitQdVJOTHhtWkFCajNZSkJLbHFnT001S09lSGovWEhHUW5vcnhJeWFJdkpy?=
 =?utf-8?B?M1dvRVNrUThEdW5iNnRLUFpET0hXdGF5Nnd5bVBjRHkvU3V5RUd1cFJWV3N1?=
 =?utf-8?B?S055WnR6NGxPakpvdlVja1ZLVU9TdCtxSENSOGpBaWM4aElXZUVidVBRL2px?=
 =?utf-8?B?QUxZaFZxL0ZvdjgvQVdubkswcGptSEdFc0JxcG1XZzhnaGhaNlZta2ZkSDhn?=
 =?utf-8?B?V1dBeitpdmZ6UHJROWQ3dm51Z0pNY2g1eUsyU01JSDRiU0tuS3QrNHFHdURq?=
 =?utf-8?B?Y0JRQXU0VGhuVGFJQjZWUDdKOEVaWG5KRysxcXpHZEVUZEtjcThuMHp5WjhD?=
 =?utf-8?B?OFFGUTk1NWZnRmZQdUVkaU4vVnRLUk5Rb2Vqbk91T29odUMwVktNOTNJVTZn?=
 =?utf-8?B?cWgydUtFSVdGbmc3N0RHTDhua2pJQXBXRTNMV25WQWU0WFk5cnR2dzV4NnNT?=
 =?utf-8?B?T25FQU0vQnVkMG9DUFkxY1dpK3JENSsrKzh1SlVsZEVkdEs4cFBjM1MrQ1hu?=
 =?utf-8?B?Zzg2VVFmVkhGc05SQUNwcFJUQ1B3THJibS9GS1Z3MlFmdHNzZlRFZ2NzN3F6?=
 =?utf-8?B?RWc1Kzl5RXpHenhjNE9UcjNCQ1d1VG1lNHBtd2hLL2MxQzErVDNVbXcxWlVa?=
 =?utf-8?B?UERWSi9abmtCSlRQN3k4bkFRN3o3QVVIcnlZNXVVQis5dEZpVU1sRWVvUlhl?=
 =?utf-8?B?blBVT2s4VGNjRnI5TEkxdnRqK2FtZmdxZnZybjRtSmhIaWV5YWtKdFBnY0c0?=
 =?utf-8?B?RXlSV3ZvQ1dhSHZ3dXpuZlZRTndlWFdieDZPRXpsZjZTK2VIMXBOZmdYM0tV?=
 =?utf-8?B?QWFqc1MxbjJLVVhGUmFDTlJJekJPWEZheXlvV3RZUlJJU2hsM3BsMk1mS2Vk?=
 =?utf-8?B?eThReW50V0ZaNlhLeTdyTGZDTXVJdlQ5aGpXODNicUMzM1kzS0FldlRSOEkw?=
 =?utf-8?B?QXpMSGdUWDlkS3Q5WDdndmlGazMwNUd0WDVwY3BUNDhoMVoyY0RpdTlYbE96?=
 =?utf-8?B?TzkxM0hJSmNzUHUvV2J1Nmd2bDZOY0dIb01PU3VFdVdtQVhxclFuWHhJUklY?=
 =?utf-8?B?L09KUmtMekRnOHlMcnd5UGxiZy9JWU5EVzZweitXS3BvMHJpSFlCVGM1VjlF?=
 =?utf-8?B?SGpGOTNJZmtpUVZKQ1YzdG9hVWh3ZEl1RzhuNGNpUTJRMTBwTWU5dXdSTmNG?=
 =?utf-8?B?bmFwSDJvVyszUWI0RExIVlp1RUJURFpHZThUNTZVMUx0andWc09yMUZGYmdS?=
 =?utf-8?Q?lUI+i3TFFhY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDRQVnBVdHY0cThidkpHNHMvNStxeGJBdE4zWDNuR1FBVmtEQjgrNDJkd0hC?=
 =?utf-8?B?eGpzNWdxUUkyUlpOcUJNN3d5dVByVTM1bjQ3T2tZNEE2dExZYVdIdGJTUzNC?=
 =?utf-8?B?b3B3RzBKK1JMTmh3cmlOYnk3a0JKc1RDeTMrbzdLazBHdkFMOTVKSHZMLzY4?=
 =?utf-8?B?aWhBb2kyTVpwY0FDcmpWVXVYU3k4R3luQnQ3SVVUcEpBdEJVcG8raHNmV0JK?=
 =?utf-8?B?V0Y5VXNEZ3FXRE16RC9sd0trSUtDcE03dWlaZ3lzQks2TlUyNzY1ZDcyamw2?=
 =?utf-8?B?eGllRkRoQ1AzTFFVNGZqdmowMXRpeFVzZDJBMS9idkJXOUFGT3o2bmIzb2Jp?=
 =?utf-8?B?SHVGMVExd1k5OEpUYzZlMTY2Y1U1UU9Zblk4Q2pzNmErVjdhaVlPczR2czdh?=
 =?utf-8?B?QXlzUkNJT2lWR0tDOHMrTTM0THlZT3pNaEY4dGgxTW1TVDVHeklCbUhrUzVN?=
 =?utf-8?B?emhXN25CTGNiNzRMcGVuOG5SN0p2WGgxdkJURUFtSDdxcXgrNmROZXBGZTRG?=
 =?utf-8?B?YW9zditQL2RubmxvZXdrLzV2cHRnMEtiT2ZvOTJhUzBZLzhIS2l2UjRFV1dY?=
 =?utf-8?B?SmFESm5qRnlzL0lHbTdFMXVCY2s2U1FYaSs5d1FyMmc5OVVtMWFtTGJqUTBQ?=
 =?utf-8?B?STlBN0NVR2tCelRBbVRTOFJFYzBJOGVESHMzM0VrSzZBek9VSXZjYWVERFBh?=
 =?utf-8?B?dTZsZ2JNbC9ldW9FemVHTzFqY1MzVnBjSmVtYXlEeU5Oc1V3ZTR5WDNjcmJa?=
 =?utf-8?B?L25OSW1GMGhMOHV1Q2plUzlTUWRWWi93Nk5acElxdFRlRjY4eG8zTnRyZXFm?=
 =?utf-8?B?WkwydEp6Y1RaQWd0U0xya00zaVNBLzRIZnZnMTJGaHpTVmtQdHFjeE9FNlJw?=
 =?utf-8?B?RFJ4RTBRNldJREZPSytPU1dDRTE5MStCeFZqOWI2WjR6YXZDclpxYzRpU09r?=
 =?utf-8?B?RWpJcFhHY1paVjBab1Vza21tMy9KaDFOZzRoejc2MHJjWW1WcmtnTzFQUDVa?=
 =?utf-8?B?QVRydjBSdkRkbXptTFFJVmZML01XZ1hGVzEvcU5NVXFmSm4vdzlFY0I1U09X?=
 =?utf-8?B?bXE1amk1Vm5kREtHVHYrak14NDl1Q3B3V2lXTFh5eTZ0M2JKemttMjh5U2xT?=
 =?utf-8?B?ck5TVC9wUHJCb1g1c1VaQmk0bm94aGRtUlkwK0RIVGpaaVpzL2VIYmwyRFVn?=
 =?utf-8?B?RVNHUmJOZzlYL0gzM3ExVUNaaS85Q2ZpaWRabUZoNi9iaWtJand1cncrVEk0?=
 =?utf-8?B?WVRyVXpEeC9rZkxSUHU2ck1zbmhDWFdQb3dLOG1ab3M0dHNsRW9uUGJoYkFw?=
 =?utf-8?B?cUVqaGE2czZMOW9ja3R2RkFGVXYyMVJ5eStzWTM1QURQRUIyaTBmQ1ptalJY?=
 =?utf-8?B?UkszUWlxWDl0ZG1QakYvUWVnL0xTdmVaTHN2Ui8wckVreEhHbE5tYk9QOEZu?=
 =?utf-8?B?Y01QZXVwNGpFa3BMMG9mM3ovc2RrQ0RDRlM4NFlNZ3Q4YXdIQ2hKQkU4WU9E?=
 =?utf-8?B?SlNZcHRLek10OGQ3UnFKUnEwZ0ZnbmVwL2Z5VnhBeE5xL21TSTlVRGQ5MTFh?=
 =?utf-8?B?ejdQNXdPY1h2cU5tTUQvMXNJL3N5UHNiQm5wVVd3UTZRN09BeWFUS051anBj?=
 =?utf-8?B?cTVmZ0JwMVU5MWs3UHNxSnlXeTdKN1VQd2FmWTdrc1ZSVVlwVUVOdjNrd2tU?=
 =?utf-8?B?c2JqZndYVjVXRjdqNnlCT1dJdUtLNCs2MGxFMGhuVnJCcnV1bktMM3h4Z0xx?=
 =?utf-8?B?czZJRG5YbHc1REdENDJ0eGpZenF1MDVPc3JnVzFVK2EwTElHVkhZRFRWQ0N3?=
 =?utf-8?B?Sisza29hVFIwbFJlbnUrVzJ1dkw5Q1BhQ28ycDBjbHhvdkxuZkM4ZzdVQUUz?=
 =?utf-8?B?dFBGSmF2Z2tEVkc2WXd3NjFRYmcyQW9zbS9FbXdtRTcxUmlHSTVUVkxEdVRU?=
 =?utf-8?B?YjVuY2hRS2JHYUdocUphdnBPV0ExNWZRTCtSdi9KbU43bkYwZG9JNEkxV21v?=
 =?utf-8?B?QzhxeisvRDl4bzZFZzBnTkhJZG5CeDhDSXE1UmFHcy9icXVsWDdVQ2JmQWRD?=
 =?utf-8?B?R3pmK3hFYTBFV2dVSjN2L1RTR1F4RGdHeHpvVDk1OGFyckF6Tnk3SlNvTmU5?=
 =?utf-8?B?WnA1Tjl2RmQzaDNtSW5ZT0V1Ui9jQTBzMktkOTBIdENJWk1jdmZWYk5sYk9F?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f03fef6-0b4a-44ea-d7c4-08dd8da6d7ed
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:36:28.5315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajYox+KJ4tFcf7XygFmmU6qwjsinEiYgk4FM+nvzAxSDw/1vmlpimVyDWuytszS49fWqv+9MuYrSsSPAdEd1oE4Q7fpvi5ZTMHAV2vn3jYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
X-OriginatorOrg: intel.com



On 5/7/25 1:27 PM, Moger, Babu wrote:
> On 5/7/25 11:49, James Morse wrote:
>> On 02/05/2025 17:45, Moger, Babu wrote:
>>> On 5/2/25 11:30, Reinette Chatre wrote:
>>>> On 5/2/25 9:04 AM, Moger, Babu wrote:
>>>>>
>>>>> I retested the patches on a couple of AMD systems, and everything looks good.
>>>>>
>>>>> Tested-by: Babu Moger babu.moger@amd.com
>>>
>>> Correction:
>>>
>>> Tested-by: Babu Moger <babu.moger@amd.com>
>>
>> Thanks for re-testing it!
>>
>>
>>>> Thank you very much.
>>>>
>>>>>
>>>>> It's very likely that these patches will be merged before my ABMC series [1].
>>>>>
>>>>> I'm currently working on v13 of the ABMC series and considering rebasing
>>>>> it on top of James' v9. That could potentially eliminate one review cycle
>>>>> during the merge process.
>>>>>
>>>>> What are your thoughts on this approach?
>>>>
>>>> Thanks for considering this. From my viewpoint this sounds like a good plan.
>>>
>>> Welcome.
>>>
>>>> I do not have insight into James's schedule to support this but from what I
>>>> can tell this work is close to being ready for inclusion.
>>>
>>> Sure. Lets wait for James or Martin's response.
>>
>> I've got a v9 to post, rebased on top of the cpumask changes. My only question is whether
>> to post it with the tail end of patches squashed together - to save Boris having to do it.
> 
> You have few comments to address in v9. I would say post v10 with all the
> comments addressed without squashing. Give the clear instructions about
> squashing.
> 
> Let the maintainer decide how they want to handle it. Pretty sure they
> have seen these cases already. Worst case you may have to spin another
> version. My 02 cents.


I agree. I also responded to same question with 
https://lore.kernel.org/lkml/b3e31246-52d7-42b8-97f7-35925c85ddb6@intel.com/

Reinette
