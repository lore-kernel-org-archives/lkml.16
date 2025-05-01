Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75328194C75
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119982; cv=fail; b=ukIGuFGuSC0v6rIkDpvDns0+HqP4p+zAMmKtPY09O3Z3rcYfbgdLe+3p1aE2KgiIS7czd1EgbbGSnE0e+ayvZq/0st3PLsbk8AJnduyNOjzEYI+u97SiVv+F2PJ4T/ReB+ZARvUhow5nUzRNrBxAgbK2NsE05akXlQwcH5zJetE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119982; c=relaxed/simple;
	bh=jGtbTnGG+1tkRjWEkbVI7dxJk5+hHrrFKy6SLsQkZH4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=soD3oa2sCMP/IPIxxRSOYP8j8YDqJJTjF8l0X6gzsMSxZfoGoiw5QJnFv4580R0qkCFt3iyLo8S2zAVcqgNwPNXg1Ge/59QBeiTq7rA5nZSz9iEzpfBZovE7lLs5btzFX5cWA94RLYn9LKE2mBw6DjGw3BA+1X9P3b7hZaCkYJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drepU3Az; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drepU3Az"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746119980; x=1777655980;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jGtbTnGG+1tkRjWEkbVI7dxJk5+hHrrFKy6SLsQkZH4=;
  b=drepU3AzdcdtF6CFnyBvHFq7TkxWJ1oYView1u0y0qr7lZNuC6Vd3ghF
   Nt5+zmfXLmrdi6E6J5/+DDDyD69XOM/bKwFJt6OiOFeXHmecfbSmvurfC
   7DjrrTtEqWosKAV6UaEK19Sxljierjeb3F8H3tDLhJ5LVTF/2BYIQM56B
   59KMayd8LmQciOwzIDdyUAqIIEmmuMbZt1mJBvJtyonpVrCbpXtEDVyr5
   X+fqaYeJSN2DuW+kvpgn4RTPs9gSw1PIIlMPjPZuCePVTdb7q3n5mnrzC
   k4euhHjrLKciXSgicrxAemElyZRpLpFs5nER8I6zSNfyo64xFa3uvnglh
   Q==;
X-CSE-ConnectionGUID: zgvfYmk3SPqSOz90rs3BrA==
X-CSE-MsgGUID: /KB8ty15QRaSa4Z87+NZgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47684045"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47684045"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:19:39 -0700
X-CSE-ConnectionGUID: 5q/OSMODQO2EbGsGMw/c2A==
X-CSE-MsgGUID: QcPCVaWcQvOQQIfznNoUlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="139572752"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:19:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:19:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:19:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:19:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKjHeVex51p8lifo2hQThKkdacEo+xakZ7h/Se6ipuQqT8ceq0q+7r7I3AWewaw7M5RRBbi4cGiN58qvCTwBTgM9tDnHQSRIlf/Sa0KdPE/8249Ycd9mT0TomNZmCmJqzuNm1cwrXEQEsujOQtvBCke4YqzV7GgVdPqIShkfgtpsw6i0WeTRENIlF1h5S1BrHusLPxCtK9VEF05jgkRKtZp1tJUlogIfNyjropAzMCId9jLKIU/PWHdgyNTbPh2v7SzouBMs26N3PNMG6/pR5lNrQrea3fzt965MJ6jfC5jTNstGkaFYG2/4l8DoYwnzk3aK+2qZdVt40IuvFU1NQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHAMexRS9KDdZjgQv1ZQs2PijFo7iyN3sj9hNYXb5tI=;
 b=JssLv+xNDczCQpoVub+3CBt79KZcSdcWuKz6jnpnYYFyfv3VL7Mk3h/Jxs0rGn6aGQvkTbT+Kxk6+laVg/O1+dNEekSpCVQZ1NOvIct1lEvjOkKdc20e3RM6sV1y1fP2xM4g9VYx6V0/D6E0GnrPwYvPiA25HUsU1fKWMB4vho7knZzg9sN8QcD6wnKLXlkMwJPKoLh5n/fSH5jsiI9hRB6Ti8uMhXVP2+i8hTRkC0S6Z6aIeHio+LS+96+Zgo6pOumHD5oQjGgX2o+rxygC9un3Iz0EA2cOqY3M5BXanCFJCLoY8HRZyY2hylnjiOp1/DdpoFgMUglWt148V3Ip3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 17:19:07 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:19:07 +0000
Message-ID: <269c7175-3226-468b-86fb-6f37da684307@intel.com>
Date: Thu, 1 May 2025 10:19:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/27] x86/resctrl: Move enum resctrl_event_id to
 resctrl.h
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-14-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-14-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:303:2a::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 74aa7841-3b90-48bb-8fb9-08dd88d4477d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajVIVGFQMVRzWFBTS2M4UXdlT3h6SWNwNk5QbnYzNmowazJGN2FNNm9iY05Z?=
 =?utf-8?B?NGVsTHY3YlFMQ1JTUm9KM0tMaEtoVGVPb1AwT2tEaGxZcWN4ajVKZjY2M05L?=
 =?utf-8?B?b2phRGhtSkJNNUhmUEJMTS9TcGRtazlTbTZLaTRMcS9jcnlvUVpVZVM3Q0JD?=
 =?utf-8?B?SzJ2UktGUkk5VExhQUw2ZGxDdEYvdysxb3I0S0xRMVRFcHFzZ1g3SzhadW1R?=
 =?utf-8?B?K21ITjJYcGVHN1cwZnV2VDh6WnhCZnk2VDF1MUplaUhqOEJ5Wk9IM245djNo?=
 =?utf-8?B?eG5adEdVL05nMzBUd2xDRytVWUFrRkxNZzZHbThyck5CMUJjQ2xvd3RhWTRS?=
 =?utf-8?B?M2Y1V2VBbndWUEY4UEd5UkFxMm1YNWkzMFJZN1pSYmZYK3pycGF2QkxMY2hY?=
 =?utf-8?B?M2p6SlZkbVBpMmIvRVhENjg0cTZkaDN0MVJYU0RTdmU3S2NYV29IZXpmdmZY?=
 =?utf-8?B?MDdKVmErT21LTFo2QmhDOHZhVVNHREhGbkJpL1dzTFdnOWpQQzJ1NUNoY2Rw?=
 =?utf-8?B?RENKL0NPSk9wWVRRb1JCYzF6VGxrRnVMNjcyYksvWEJSOGYrMVhNK3poL3U4?=
 =?utf-8?B?ZlFNSFRhOU4xd0FQYVVzNWtsejg1a3I0MFV2QjJickh1ck1TcXkxYzdoTFlw?=
 =?utf-8?B?TU1NemtvNmlRWU1rcnFkbUh5VzZBa0pyY05KSW9qWHYyK2xDQ0pKV2ZXQ0JE?=
 =?utf-8?B?NzhwOWl2bVhsZDdlKzF1MnNYNm4yL1NjcWtTaGdiK2ozdDFsOFc3VnVIU2FH?=
 =?utf-8?B?eU5EM09Pd2hDVkpqVG92ZFZJc1A3a3h6bWxPaStiOGFQNFc3MSttdUdWS09Y?=
 =?utf-8?B?SkhxQkR0eUhhYjV6UURpeWMyMjlQVy94K0VFTEZ3VzdkbnV5bjhSRURKc1Jt?=
 =?utf-8?B?TEFqNFNxMnJ0U05VamhFb3hVOVA2S1hxMEF0Nm01NGVYdld1UUNKS24xK1U5?=
 =?utf-8?B?cFZ1c3RaejFveDlndklDS0FzOU1seEYrS1dIR0duRXYyUXFaSStQNWZucGNN?=
 =?utf-8?B?cWJJbGlNUGd6YUlRM2dUSlRiS01HeUVzdmxmZnJ5ZDRVMERIWTFMMzBSc0F2?=
 =?utf-8?B?M2lrbExKSk4rNFhkU1UrRXVWa0l2aGhYWkRncjl2aFVHdzRYdzJQL2ZoTE92?=
 =?utf-8?B?eXp1S3FSUGh3WXhITHR2L0lqK2JiK2xtS3liZU50b2JlcitNQnd3cDB0V1Vv?=
 =?utf-8?B?cVloaFBGRmVlenZJeGRXcXUwRWFMWTdXV2QweC9Ba0lTTXFzRW1nWHpWUzRQ?=
 =?utf-8?B?M0Ruc3MrSTE3SU1Xb0k5enNTbEdLNFlYcFh0bjUwOE1hM1JMR0xWMUxJaUpZ?=
 =?utf-8?B?cWxTVXBIUFdNLzQyWUJ6a2hmODkvNFpUMi81OW02bVJUQ0VWRTNJK2F1REFy?=
 =?utf-8?B?VC90UC8wNjlibnZ1OE9BMnc1b3ovdWIrdlJCTXg3cG5XL2w3c0JMRm5FN3JK?=
 =?utf-8?B?ZnBBMlZZeUtMNlJ5SWVTWDQ2eGNENjFiNDJWQVJnVlZYRDVNZjFYN0xpSVF3?=
 =?utf-8?B?cTRCdU5HSUJLSkIzRHN0djlWbFlWeGo3NzBlSHZzQnhqMlVrQkhQQjVQdzk3?=
 =?utf-8?B?SXFGYy93REtaOE5mMnRmSkZTekdBWkhzQ3h0VmovOXgzL3I1Q3VRd2N2ME5R?=
 =?utf-8?B?a2wyZFVQcElwakUwaFNpOGxzWVBvV01RSHBXMEgvelRVOWtoM3RKTm5uYTgr?=
 =?utf-8?B?aCtmaUtvaHl5OEFsNE9sSEFEa21BSGRzOWZRYnFYRmlZV2NKa1ZXMWptY0dM?=
 =?utf-8?B?SVhtRDFIbjN4Tm9Ddk9peC9OcXdYMjFUNW5iMlNhcVRFSFRtNnBVc2tHVTQz?=
 =?utf-8?B?SVFsY0Z0ZUsyOXBSK1BSVEZPQytTMTY2cjRtNmtpOTBHQ2VlMWtiYzY5TjZE?=
 =?utf-8?B?ekV0T1NtazI5MEgvNHMwRWo2WDhiYllrTWFUZ01rV0dCb3l0WXAxK1JzM01v?=
 =?utf-8?Q?pHUQu7FlQNQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnFrSWJUNkc0aFl3TU9Udk1kVHZOMHFpSHVleE1wd2lYNHNhTmp4b0hCU0dj?=
 =?utf-8?B?L054K2xoMkdSKzU2VmtpVjYwTE9iWDhYSitOMlc5a2tOWXB3TVBYVXh5UmNj?=
 =?utf-8?B?UUljSVZTM1luanhCVWtqZURHdGVJZVppQklDQi8rOWZVTlRua2ZKRWZYZjdu?=
 =?utf-8?B?YzdRY3VEMEtYaFQyVmZlWHduL1FQckJqckZBbnVRazBSQUNtemVvcmxCdXBx?=
 =?utf-8?B?UlhlQ3JEai94dEJUbjZHc0dDeEpXOEVwdXMwa2t2QXNpbitlYVF4OS9tSG56?=
 =?utf-8?B?K2p1QWpxNkJWdXZVRVRBZkduZzEvSnhjcFNjTnBkallPbTdrTjNCZGk5WDFj?=
 =?utf-8?B?THBaSk01SzUvYnNzUEdpVmhmL1RRUElDMHNrNktibmMwY2RwaVNLWmY5cWlh?=
 =?utf-8?B?Y1p3Qm4vRS80dWZsQ0xZaUxUQlBzR2h5OTM5d1VmL0kxK0QvOFBsQk5oVGh2?=
 =?utf-8?B?U3Raek9CUTJJY3paS041UDJreXlpMWR0Yk9KUFF4RTd3VE12RHBZVjF4dVN5?=
 =?utf-8?B?R2JEMmNUZ1NwV1h6WEliWXN4M292WnVCZlkwalhXQUN1M09VRUl5azhZOHky?=
 =?utf-8?B?MUtNcjhROTFDdjRZWGZTLzQwN1pZVGpESlRSMXltc3IyR0Jmc0YwdXVHcWw1?=
 =?utf-8?B?N2JxeEF4Ny9XZ2srMkY5REhmVmc2c2tvQS9xaktmRHZRVnlPWlVsLzk1cGpG?=
 =?utf-8?B?dDhxdFZqWWdTaGJoZENxNVJxY1FWQnZHbG53M3FneUJSVERDZXRRSVRhL2lO?=
 =?utf-8?B?V1FTbUNnZEZPaVdMblYvUlFhZ1pWZDdOQURpdEpFOVZZZGdMeWVDWXpidjhv?=
 =?utf-8?B?RERWSjcvR2c2T3hyQlZxU0N6bVdBZmhmTzJhWmFhVXN0aDBzQUJGcFQ5Y1NO?=
 =?utf-8?B?SFcza0twOHpEV0lMU3BrVnJYQThpdm1UQzJQR3BReDhwKzhvaVBkVHhFOUNU?=
 =?utf-8?B?NmlxT1FlTC9Nc3BZdENaTkJkRGNrV0dUYk5BTncwRktqR211c25RUUhqZVNl?=
 =?utf-8?B?R0VPZVZJOFdDVTBZV1NmMGlkcitoNmk4MTErSXRFejZJVFdudmlsa04wUW1a?=
 =?utf-8?B?aitYTnNmdU1PRE5Wb0xaclBYMjkrTE5sZk5BN3JTQmZuY3ZwRVVVaEp3ci9I?=
 =?utf-8?B?UC9sMDh1SDQ5MTVVTXBLMlFZZW5ESGhiTUFLNXFOcG1RZEl1M1RxMEsrL0JZ?=
 =?utf-8?B?bkE4dm54REhLTWFNMDFVYTlreS9qWGd6OUlCb0lWSExpM29JUTRWaEFOTG8x?=
 =?utf-8?B?WkxhVlo5R1RkK3dudjA4eG5ZcDRqakhHb3NiRUFVUDRqSjV2VXBPbkZaSGZG?=
 =?utf-8?B?cWZkb0NvVWZWZlh6WUsvaDJGd285cXZHRks2ZFR3eDBKdFVEUWVvSWdSd0t3?=
 =?utf-8?B?a3lyeTRHQ2RyQWsrT3VER21DWHFoZGNjdUxVamhud2FsY29LdFhCdWQ4TGdT?=
 =?utf-8?B?TFhqMjhpd1E2MHBZbGZQbTNHQ0JVY1h3Mm41LzQwemU2Z3UvbFgxb0o5NHIw?=
 =?utf-8?B?eFNxZTArVGJyTENXYUhkTWxIclJCUStqdmljYmNxTnlFTysrQmlCcElseVgy?=
 =?utf-8?B?K0poYUZDWERBV1g2RWpKaWU1NkJWRGNUMm8xeGNYb0tlRHBkSHNGeS9adysz?=
 =?utf-8?B?azBMQzRIL2pibkdGdGpHM2xPT3BwRUhiQVpqU0xmRXJtMFk3REN5d1RwSHNi?=
 =?utf-8?B?Yzl0aE9maWNYbUVaYkVNbU1rUTN2cXdpZnlzOGhDRkFPZ2ZXRk9vTU5VOTgy?=
 =?utf-8?B?a0dSRzJ4TWs4MDF6QnNqWWxEYjNQRkJoaWViZ0dBWnhMUCtPby9hTUxkeUZI?=
 =?utf-8?B?YWlHRmlVRUM4Q0xYd1hwaXRkVmlYNDkrbkpoQSs2VFBEbW84WHdCWWVubVdH?=
 =?utf-8?B?eGtRTlN6eDY2VGVMU0xBT2pQZmljbE9MSVhuVjZMZ1pKUFBaTmtVdXBRQ05H?=
 =?utf-8?B?TFJtV2FidzY3dXVvOXRPbFMyTWRCNTM3U1VjamJvSU8zOWFCNG1RSlFjdUpy?=
 =?utf-8?B?NlpBSlVHdE56bE93RVB1ZkpoNkhrN2gva2M5THJMSmFmZ2hvOWlqNXZxeEsx?=
 =?utf-8?B?YTYzV1UyYSsrRmRKWUhTNU1HV3k4eGNGVm9uK2pIV3I3T0QrbFR6Ym83ZTJP?=
 =?utf-8?B?K3FDZDQ2L293eFloV3FrUmpTY3M4S3hiMEJaWnlwRjhRSWNWbEN4bElyMUEx?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74aa7841-3b90-48bb-8fb9-08dd88d4477d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:19:07.1999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlM5VZEdw7lxBg8Surs+8aM2AlL1YrLU20Ad4/51Env/eKmsE4b/YcRAv7HOM8uDI+uW0LVjGjhU7iuR6bHhzCWudRImEV5L5fxzt9tcAH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:37 AM, James Morse wrote:
> A previous patch moved enum resctrl_event_id into a smaller header file,

We have had trouble using "previous patch" and "next patch" in changelogs
because of how patches may be re-organized after merge and backports and such.

Considering this I'd propose something like (please feel free to improve):

  resctrl_types.h contains common types and constants to enable architectures
  to use these types in their definitions within asm/resctrl.h.
  
  enum resctrl_event_id was placed in resctrl_types.h for
  resctrl_arch_get_cdp_enabled() and resctrl_arch_set_cdp_enabled(), but
  these two functions are no longer inlined by any architecture.

  Move enum resctrl_event_id to resctrl.h.

> resctrl_types.h, so that architectures could use these types in their
> definitions of asm/resctrl.h. Specifically this was for
> resctrl_arch_get_cdp_enabled() and resctrl_arch_set_cdp_enabled().
> 
> Those two functions are no longer inlined by any architecture, so
> the enum can be moved to resctrl.h.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---

With "previous patch" addressed:
| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Thank you.

Reinette
