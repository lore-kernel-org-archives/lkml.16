Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E2B3232
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743462353; cv=fail; b=RrieR0zci9LhDGN1YMWETVNZo1ej6ZokV6qJloDuiWNfH9TWy26wC/0fq3ksgntU7g22q168/Z7YeFz1THlHWpIZUvL8MLVGh0a1hm8JS9ha0HxEcp2t27VAwnzlP+UZZmzmhSkZ4zF05+fzzxk/fJCNM3Lsx265KFBdPj79hRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743462353; c=relaxed/simple;
	bh=wupWrhg+R5rPd/Effuq1lzEAZ73uZbIZEpYwcirGjaw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IXDjdLRVtrby2JrI8eDKj5b8LPFJwTi/8UCv1z4dBzNvhvKdnAxcS70nKtr4KqI/4U3QjEjV8rVFImfw/dTWKkOLWK4bUAr/+M5Rouqd3rBYQRPInUTnOsN/NTjZPkMKJDL7kHxrhO6vfxxlowXQrdLnFbofmcMfg/GEFld6QOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JwEa8vdy; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JwEa8vdy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743462353; x=1774998353;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wupWrhg+R5rPd/Effuq1lzEAZ73uZbIZEpYwcirGjaw=;
  b=JwEa8vdyNvWndktaC7BisM6NV/SAC4Q1T1v7SnsZpZbaHSiOkbjxdf75
   RJnx+lDK9lZm63kcSgpN/Xlch5CgaaMRULtXWtXVKBc0HA3bR65JSJXs6
   frQtTQlyIF0NPNx+bNJXW4d3mHcDnuS3ZaDUFyCiG5fwAsdK7a8NU3W3N
   qaPzxm8yv2o0vB9/dtf6LEdVgZY/fRYiNuJ0T0FQVphU7RmDCugfiZMpY
   MXsYvaDAKbgsNyEYC2OSvsT1FUpJYgoYdq4G92Il2769egIvywu3Pp+qi
   YVwhivvwbb0Kq++jsC4q2f1UuI/xY0n9TolG9oN6duWGRcZG3jFBG6dY4
   w==;
X-CSE-ConnectionGUID: Fv+XeQRKR5ihYs2txGs1kA==
X-CSE-MsgGUID: BvrUeEqXSby+5w6dNmwFQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55761707"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="55761707"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 16:05:52 -0700
X-CSE-ConnectionGUID: JVcKemkWTTCgIaE2MaGVXw==
X-CSE-MsgGUID: rIyb/qpGTgm5opHpf9f3TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="126184698"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 16:05:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 16:05:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 16:05:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 16:05:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ux1AlAiVd6Ph4MZj2or92hDobAXkMLtAbEMDD/nNwGYWd1q3mmZhay93VBPiPXTIaY/+9H23Rkz6185MKXfgBxTq76t42LoOex4tE7YraNcIeFK1hm//QJyn7t0btirLLG4RECxylEJIOlzVMGBhrNUsMQWXrZpyHRVHxnhcR719wYLpobWzKsOP6eVoapSRJd6H5HSeIf/TBQsAFapzzAjVP45WloLdBa1KjDjSD0N9mDBJmeYSBXYplkTGNAYWvr5e1f/S1i7rz/7WyrAKKQMH4Kii0q5Q6kchuk+7BpvTGm24/0d3zHFz3BCYy2e2u01kV/sp4Cft/uwUPzx3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wupWrhg+R5rPd/Effuq1lzEAZ73uZbIZEpYwcirGjaw=;
 b=tqgEd9Llr5iMTiBJr4wh4fC4Zp50sLjUsXpAyxLar24NmojM/TynZsqqeVLFmFbRMNKxQjMg0QXyB8DIMQ0rhNCPPBzZcoV1IAsBuXoAndkfTkwOyu5FF7pUxdSXORQBMrSK4oTydZcWBdMLLbGx/WBvxPRrjpMj3rhSJpjHhUFzXM8aJ5SjIav0sJvIlHmhwnXu1q0JtAgOqKZy744ireW99vOUiuV536fdHH9p9OirNA4dpvC7a2vYf8nserMt9iouWhYPvzBGYV1Lu6OHmXTrR5VmDjHiosLP+n0gFiJKgZgwzactdMWmTGW+MK1UguBghGO2NNgoT9Q+AbrRhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by MW4PR11MB6618.namprd11.prod.outlook.com (2603:10b6:303:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 23:05:17 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 23:05:17 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "Mehta, Sohil" <sohil.mehta@intel.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, "xin@zytor.com"
	<xin@zytor.com>, "Luck, Tony" <tony.luck@intel.com>
Subject: Re: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Thread-Topic: [PATCH 2/9] x86/nmi: Consolidate NMI panic variables
Thread-Index: AQHbn3LZZapA7fAReUqsEyYm7m1m27ON3Z8AgAAB9wCAAAQ8AA==
Date: Mon, 31 Mar 2025 23:05:17 +0000
Message-ID: <5e7d99d019c8c6c8c137018bec6ae59b512b9dfb.camel@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
	 <20250327234629.3953536-3-sohil.mehta@intel.com>
	 <5a9949a785e25dd3fa5a258917fabe3a610f4110.camel@intel.com>
	 <57f5abc9-9e3f-4053-8c5d-2d6366d669af@intel.com>
In-Reply-To: <57f5abc9-9e3f-4053-8c5d-2d6366d669af@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|MW4PR11MB6618:EE_
x-ms-office365-filtering-correlation-id: 73973bee-8fb1-463e-057d-08dd70a880e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NS96eVMrcUhOVVNsbFM3VTQ2TUQvSE9Xd3IrMUhzUnFGVFZ4NjZyT08reDh3?=
 =?utf-8?B?MXZUTm92U2kwS1cxRmhmdmMzN1VSWkROaE9nSWVWTjNQVUwvZVFRQ0tJalY4?=
 =?utf-8?B?ZEZqSml0WEs3cDlnZ0tqZVFXMkc1cTlTUUJRZ0VZRGdOaGxab3NKeTJjM3Fs?=
 =?utf-8?B?cld0R3hMMkpZbTFhK0U5WFF1QzdEcGFjSnN3NWdaZzQxUFJ2Y3NidFVWczFz?=
 =?utf-8?B?L1hmek5KQ1FOUXV6SXlzVDRSdkwxdDdRUlMrRXlCOW9SbVZCUDhCbExmd29Z?=
 =?utf-8?B?ZU5qMjIvcktLdEZQSkpOSUZ1bEN5MEJvbGNDWTFPZDhyblZld1o2dnpxeitR?=
 =?utf-8?B?Wll1TlZPMExuR1ZsY2NOL0VhTW82TENoMm5LTWVrMENEcTJVSXAxRHFPTUIw?=
 =?utf-8?B?cmVHWFR2WEZid3hUQUVNd3FiMTEyQmFKVVY0QlJOSlpoSzBnTS9EWHZrUGth?=
 =?utf-8?B?ZkpsZVBESElWQXEyQWltWHBKekRWRnVtdXBHT1JEbU1SQXRFWHZGQ3JxZGRK?=
 =?utf-8?B?QzBSdjIrZ0JBdWIxVmgzS2hvdG1JV0VKdzRraWpsRERsWXBPbThITC9DbTMz?=
 =?utf-8?B?MmswaUU3T3VoWkpXTU50aXZhUEc0ODk3OGxqUEp1eHRzcytORFZPcy9hWG1U?=
 =?utf-8?B?bm13OUtTU25YKzVHQXRHeUswcHpOQy9kRkppZ1hSeTlHQkFFdGdSSEpEQkxW?=
 =?utf-8?B?bDhSZGFJRHJ5M3g5UVZPR1JxS0cvQW1GS2EzQ09KUUljbVZBZ1Q4dGp6bG1X?=
 =?utf-8?B?czFHSlFjdzViYWw1ZlQvbmI4VnBNMlVRMjR2dmJSalNFTHVOL1A3UnI2czJT?=
 =?utf-8?B?cXRpMXV6V3lOb0gwRytubFBQUWgzWlRhbnB1YnMyOENEREhhQVBsemVVbmJC?=
 =?utf-8?B?ZUZ2V3NGZWg1MzRhT3hySUg4WEZYUkNGOU5xSDQwck5VYXkvQkNyU1lvYWRt?=
 =?utf-8?B?MkRqZlR0b1VxUllEemord0p3VW95T3FkRlNCNC9aSER3UUlVUllMOGJkSENC?=
 =?utf-8?B?ZktrY3hSaS9wWXpFK3czVk5yYmMxeFFMR0ZCQTZJSmkxUjViYzJRVk5qbVZU?=
 =?utf-8?B?eUl2ZE5TNTdMcm1VMXg4UWtXQUp0MGpQYncwYTEvbnVtbFROV1lLbzVnd0Uy?=
 =?utf-8?B?QkhZeEdqWXVoRlZ5M21kbys1Q1piZUt1OE13bG1IODZuUElzU2dGUlY0bkFy?=
 =?utf-8?B?aStkWmJ3b0wyVldYa3E4UDl1bVlNSnlhUWprWnNKQjdYL0h6UXRuZW0vOGFs?=
 =?utf-8?B?OWovSkR0YWVnWmdROVZqbDEvbllsWGhyNVZ6M0Qxc1hnOVgvUk5idUR0akta?=
 =?utf-8?B?K2RFaWlqTnZXZXNtTzhvWkhXWnJxOHEyak1mUDNtR1NHVVZJSGlhR0FpNkRL?=
 =?utf-8?B?bFNDdGtVem50QlNySTE3a1lDemsrTlJjclJWbDhrODdTYW9YUGlGSGZVZFB2?=
 =?utf-8?B?RTdJeHZPamNiS0ppZFhZQTlLd0NHTUE2cVVIMThSNW9PdVNiNDNQcFp5WUFH?=
 =?utf-8?B?Q0IrNXFqTXAvSFhSbXJGSXNoV1RQYUxQMkh6Q3RyWnFQazBiVy9oRXVrRkRn?=
 =?utf-8?B?aktQUm8yK1duOGtqWnRvTWdYT1BGYjVpWmlzYTFXVzV5Q2tSWFBUSy96YUNP?=
 =?utf-8?B?MFFrdUN0MHYybFhMQjZxQ0xMKzdWQVhXZGdQY2dFTzlyZDVKT0tSc2ovVlM1?=
 =?utf-8?B?N0ZlWHVacU9tNlNrMm5KZzluNUVrcERubUx3OXZXSWloa1djV0VGc3Q2c2hB?=
 =?utf-8?B?eHpmNE00d2o2cnVlSmtFN043eGhDaWxpQ1BUTkRFQk9PdlNiYVFSaXJCQXEv?=
 =?utf-8?B?cFA0amZyaEN6ZDgvL1l0cml4Y0gzWHkxV2VlbWUrTW9hdjJYdHdSNkRFM01z?=
 =?utf-8?B?cW5ob0cwTTUrenJPUm13MklqSzFyOStrY1BmUDZjZHVzMmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akRXenBGdjI5S1JOTjB5VHRGRXA0cC9tOWhsTmNINXlVUmFkVFJrZWhGS1B6?=
 =?utf-8?B?OHpjOFpITzNWajlyZDlmOWp2MEs0N0pLTWxDcmhzbytDS3lZdnp5cjBmK1dL?=
 =?utf-8?B?ZHdGNHE0TDh4elZOZU9rR1BwbzYxSTMrRUpDSHlXcXc1MkNMVVR3WGJvOEtS?=
 =?utf-8?B?MzBHSitoQTcyaUtwSmFIWkhIR2Y2OWhwdWZFOU9MVHRrNkNoblVEVVUvQ2dJ?=
 =?utf-8?B?am8vR0JnSEsvZDJOekpMNWg5WCtCTldGMUtqV2VSbjB3SU5aQ2NrS2RjWStj?=
 =?utf-8?B?NlFiQTd3MHl5UHdMMUpaeU1sSGZkUEZLalpUdjFLb0dKZVlkQ2dPRlRuajJj?=
 =?utf-8?B?czNpUjd2cnRmTkpXZmo4TTRaRWRsRURRRWdpT0tLZkhnbVJmRkkzcUZPbTRL?=
 =?utf-8?B?cHdUVlA1VU9NWVlVbVpKNmc5UnNubUJpR0lrMHpOTHV4a0pHdnNJRzcrUmZW?=
 =?utf-8?B?V3lVQ2N2eTVhZnRUa2lsK0Q0ZWhFeHdIL1JYSDlRZjlPUkVPTnRNK2pKNHpa?=
 =?utf-8?B?VTlaUDBJV2IvVHZaZGtSNkl0cjZXZU82M29KeEY1ZVRyOVBERmlTYVVBUmk1?=
 =?utf-8?B?NVNkUVRlU2NrVmxoaWo5TXRJMTZqTXc3RlQwZnpBcVpyVkJRRDU0MzNsRW9X?=
 =?utf-8?B?WUEyWDhOTjhUZFdVbzVua0pzczQ5b1paOGF1Z1pDQktCSkRRUDNsb2tlVkkv?=
 =?utf-8?B?RW1INTk3SCtNU1gxWlJqRmovMVphMEJGWEFpNnk5cE9vZGFyTE5wNjB1U2Iw?=
 =?utf-8?B?S3ZiK0xsbjh4emVaUC91blNxemdJYk9GL3ZvV2t2Z0ZyNmFlRmVqZkRBSDN4?=
 =?utf-8?B?L3QvcXA3VmpISEJ2bExDa1F3dWVxblZENWVidVQxWm5uTzZWaXFpeVdRcXc0?=
 =?utf-8?B?NmQ3K3pON1R1R3JRbmVscEMvaDlRcUlodmlHYTNhMUttSjQzcC9NMndQcWtn?=
 =?utf-8?B?RmFGR3ZzalhZNkRvbWF2MEVLbmdQRThkUEpWakpHOWtuSEtxbk1xS0JTaEtN?=
 =?utf-8?B?QWNQRkR4L0VlZFFRKytmdm44VUNJNlF6bXVNWkxMdS9KdUEvWWFRaEQxR2JS?=
 =?utf-8?B?b2FjWlk5WUhBVE9BT1FLVGpQbHBJdlUydTdzeUN5bUtoZ3Rna000SDBoQU9h?=
 =?utf-8?B?anN0N081QVkzNk12NmgyRGhyTmhLUmlUTkF3WWN1YUkwM1M3eUprNGVkb0gw?=
 =?utf-8?B?VTB1dVpPYWtXVnQzbVlPQndrVmllbkc0amsrdHNMNDdPUXRudHArU1dSVDBt?=
 =?utf-8?B?RDFyOGd5b0JTWWI5dVQxb3NEZ0d5TmZHdGMvUHBqQ0hQOGpFMXEzQy9hMW9v?=
 =?utf-8?B?WE9ISExMYmFlMFRocGtTWUJJcU9mUjJVS2czaVNoaXBNNFk1RWVzY04veGVr?=
 =?utf-8?B?WUt5ejVPckkvRVRyRXpaU3RMbkFjOFdyWWlTSVFIbGQvcGRGSDVPSVJnZStW?=
 =?utf-8?B?YjZnZGhDVWZldXgwL09RVWZteHd0TnZIYUgrRTNEbExIMFBBY3hMbEZwaCtx?=
 =?utf-8?B?YzZISEJHTEZwNHUxa1dzMlpiYWM5WHhrQUd0UFpNV2NYeVdLc1IxNjcrK3c4?=
 =?utf-8?B?U3c2d1VyNHRvUGhocUNMM3lBV1ZpeC9Fbll5ZUN4VU5FZ05oRnpVaVRWc0o2?=
 =?utf-8?B?NVJGUGVDZ1kxL0h6WGxHeUliZERhSHc5VXRMVktzVWRtSW9zSFpSaWdkd3FN?=
 =?utf-8?B?TTZHME1INXROUCtLMEdCcktIUXpGSXBhWkZ5MEd6TTExMlJsSjYwUmo4bzh1?=
 =?utf-8?B?aFJETkV2SzBGL28rU3ZMb2pnUlRzQXA3Mmoya0phSkJYNkZQNDc4ZWJnTUFB?=
 =?utf-8?B?LzY4dXYxVGMzSmxuMEtNcktoOWhyYTRuaHZ2NlRkR0dsc1kzcy9TcnJmQ2tQ?=
 =?utf-8?B?QmxQWGp2YzAySjNJWUJ4L2llaGZBN0U2ZXNXOG1ON3hjRHpMT2hoTFRZY0pS?=
 =?utf-8?B?aGV0bjFrbEpvV2VGVE9mZVpyTTV5Z3ZOMlVVRXc0Rk1RQlFrUVQxaEJrUG40?=
 =?utf-8?B?V29EMzdKVmtCQURiVHJmNklFTTFBVGRwWlpSQkE5QnI4Wk5yRDcyb3FPbXl6?=
 =?utf-8?B?Qk5sYWRUSjBpVnEvV3pLRkZsbGkxUVhtZ3hhZFdKeUxDNksyRmxFZUhoNWcy?=
 =?utf-8?Q?8+rchErU4z1VmfxGRcYfNhkKL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C9444E06EE8BE41AEE753D485A7040F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73973bee-8fb1-463e-057d-08dd70a880e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 23:05:17.5454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AQLTHH0gyhhkV8huELn/BY5acGYS2G0ZOKlqgV4p5Ck8oNromudBWhaVDoixGArH8nM9PfWhMfx00fMYMJxm2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6618
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI1LTAzLTMxIGF0IDE1OjUwIC0wNzAwLCBNZWh0YSwgU29oaWwgd3JvdGU6DQo+
IE9uIDMvMzEvMjAyNSAzOjQzIFBNLCBIdWFuZywgS2FpIHdyb3RlOg0KPiA+IE9uIFRodSwgMjAy
NS0wMy0yNyBhdCAyMzo0NiArMDAwMCwgTWVodGEsIFNvaGlsIHdyb3RlOg0KPiA+ID4gQ29tbWl0
IGZlZWFmNTUxMjk0NyAoIng4NjogTW92ZSBzeXNjdGxzIGludG8gYXJjaC94ODYiKQ0KPiA+IA0K
PiA+IEFGQUlDVCB0aGUgY29tbWl0IGhhc2ggaXMgd3JvbmcuICBJdCBzaG91bGQgYmUgYzMwNWE0
ZTk4Mzc4Lg0KPiA+IA0KPiANCj4gWWVzLCBzb3JyeSBhYm91dCB0aGF0LiBJIGVuZGVkIHVwIHJl
ZmVyZW5jaW5nIGEgcHJlLW1lcmdlIGR1cGxpY2F0ZQ0KPiBjb21taXQgaW4gbXkgcmVwby4NCj4g
DQo+IFRoYW5rZnVsbHksIEluZ28gZml4ZWQgaXQgd2hlbiBoZSBhcHBsaWVkIHRoZSBwYXRjaDoN
Cj4gaHR0cHM6Ly93ZWIuZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rp
cC90aXAuZ2l0L2NvbW1pdC8/aD14ODYvbm1pJmlkPTFhNWIxNWY2YjRkMTg1MDdkYzNiMjk1OGNh
MDE4NzdjZmM4ODA4ZmQNCj4gDQo+IA0KDQpBaCBJIGRpZG4ndCBrbm93IHRoaXMgc2VyaWVzIHdh
cyBtZXJnZWQuICBJIHRoaW5rIEknbGwgc3RvcCBsb29raW5nIGF0IGl0LiAgOi0pDQo=
