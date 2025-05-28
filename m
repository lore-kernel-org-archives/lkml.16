Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F51211276;
	Wed, 28 May 2025 22:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470441; cv=fail; b=EA8Kc5lbJscWGDTfTwKN5Jr4DDFhLMmP+Kx7LwqMKRYiiJDnyOWqdvOBfaU0UYl6fGAFtH5I1mDcusn8vXuzVj8K6m6DS2rgB10wT7Vt8LQZTRSPY9wVXE9pssen58igMXXB0CIGMTJBqeNLMJWF6n1zpJsX22hQMy7rpF5/Hx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470441; c=relaxed/simple;
	bh=nuNqF18oNG1rkbpQ6FackXnLKtrTPnf/McLUpyI+0SQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MjtGSCNdqhRJRq+8qOSf8C/P3vetWAVOhq5f4U7sCAYcvWYJ1E0YKtU3bx5eYpJ79oiegpopNlRYGVpCXcEnmi5PgO6rAJNBEexrhVQ8JFnkzmHgGkX+LZuZiUiZa2B3hqX/WY1eDsyFcFiDkmYXA8y4lN8jPlmah21xosn/l18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDoGztjw; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDoGztjw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748470439; x=1780006439;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nuNqF18oNG1rkbpQ6FackXnLKtrTPnf/McLUpyI+0SQ=;
  b=NDoGztjweAVq7BECtK2ypEeaY7GDLxOWXhp2ZYFIE7SxHSw1xu0eBakD
   XiVJAn9BrQ9Zfeesaf0vi8dl2Coie4cd8edTI+TL3eYetS/QUOaezaLiF
   WdoSIiK9f8OqkSp9Slxh+R+DyqWmovay4WaLNA/eIq/iRAkppd/hQ1+0B
   PC+3ngN9KG89cb/itd8yWJDPmQIdNdanodNckOfYlNyd3pOB782DpNhej
   Nz3gaGcp1R1LQ63/RQAb0nzOK+KSC2D3p7P8kEStW4pEsATWW5Kw7dtdn
   Et4zIUDP84ZiCNZqYjv6KgAbJ2JbLuXRTF+P2L+qLb3SZNwqXurw2SaM2
   g==;
X-CSE-ConnectionGUID: +Pbt8IMCSiqtCPRW5NDD2w==
X-CSE-MsgGUID: Knk6cpy+Qam3sDPaBQ6qXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="73046714"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="73046714"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 15:13:58 -0700
X-CSE-ConnectionGUID: 0gEzaLiXSa+XvKVtALZnwA==
X-CSE-MsgGUID: 0YpZkxyEQSW4Ztc6OkGGsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="144346731"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 15:13:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 15:13:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 15:13:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.44)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 15:13:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LipqfMTY1YmUdLdfbECkc5o1nqC6w/OwkFLYAAt4WamvFE5aqo4hZlkyK4wG/Axb/s7i7NEz6EJTbyYXvU4UDpL6X2jtXtO1OITDlpltwRnMmMpuRcylSfNB7CQwSTh1x3vD19w+X3Mz6mFKvKUZNrLXYfg2vDkz2YdvR1m+i5LMEFErcW6JRtt+Bw6mluFK2iOacYPvp7Z1CFFprzkRY9pnrr71FjNwaWgat6fGQJo9NyDZiuDQiRlU4FdNJHO9SH3CEVI2FTLoUL+R5BhScoVqh2AGlRZVy//RvWj0sML8wHKyxIOFz9xj6FIDDuWZRLxwNe4diNUwKMmDuHtABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuNqF18oNG1rkbpQ6FackXnLKtrTPnf/McLUpyI+0SQ=;
 b=u6yNXJtqkPGOcQwPxiQHYaIoVay4JqRcsLN/N3gySh6+mdfAenwa9vFySO1Z4Z5B8lKwjqHXvke0So/7v/l4HfCYF03wGoaJvtSzB1KF3vh8c2KzQC44MX8C+MHR7OpCTz0qMixaE3rMXUNQyHSGqAK6f2bL772ivF4eD9smztCDgw3M2cDROM4TRX7a4dRjaHsPW8GcmBHWiEcFv9/pMlKdGKF5TWdD7q27akCU7BHlXyOJSWYdYVqpt3gCxNniIS3EdMSh13bim1z6Jsp8m6fn6KqM65CvaOu59uV3mTDzA0q9SHp0EiMIXZcKEr6/CO5RMHJERR69CKvgZoCwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MW6PR11MB8340.namprd11.prod.outlook.com (2603:10b6:303:23e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 22:13:53 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 22:13:53 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Moger, Babu" <bmoger@amd.com>, Peter Newman <peternewman@google.com>
CC: "Chatre, Reinette" <reinette.chatre@intel.com>, Babu Moger
	<babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"james.morse@arm.com" <james.morse@arm.com>, "dave.martin@arm.com"
	<dave.martin@arm.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"paulmck@kernel.org" <paulmck@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "ardb@kernel.org"
	<ardb@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "alexandre.chartre@oracle.com"
	<alexandre.chartre@oracle.com>, "pawan.kumar.gupta@linux.intel.com"
	<pawan.kumar.gupta@linux.intel.com>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "perry.yuan@amd.com" <perry.yuan@amd.com>,
	"seanjc@google.com" <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "kan.liang@linux.intel.com"
	<kan.liang@linux.intel.com>, "Li, Xin3" <xin3.li@intel.com>,
	"ebiggers@google.com" <ebiggers@google.com>, "xin@zytor.com" <xin@zytor.com>,
	"Mehta, Sohil" <sohil.mehta@intel.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Wieczor-Retman, Maciej"
	<maciej.wieczor-retman@intel.com>, "Eranian, Stephane" <eranian@google.com>,
	"Xiaojian.Du@amd.com" <Xiaojian.Du@amd.com>, "gautham.shenoy@amd.com"
	<gautham.shenoy@amd.com>
Subject: RE: RE: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
Thread-Topic: RE: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
Thread-Index: AQHbxexNa7lb+uglWUizC2qcUfje+LPfO3wAgAAEXRCABbSPBIACH3JwgAGSwACAAATw0IAAA7AQ
Date: Wed, 28 May 2025 22:13:53 +0000
Message-ID: <SJ1PR11MB6083D8A7DD982A6430C5BCA8FC67A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
 <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
 <SJ1PR11MB6083C5179F98E3873CA34C35FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aDDjs4PZxeouNJr0@agluck-desk3>
 <CALPaoCj7FBv_vfDp+4tgqo4p8T7Eov_Ys+CQRoAX6u43a4OTDQ@mail.gmail.com>
 <SJ1PR11MB60839776B024017D65EF4E65FC64A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <396dbfa9-37a5-495a-adaf-7ec1fe6471de@amd.com>
 <SJ1PR11MB6083A51C7607D419646DCE3BFC67A@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083A51C7607D419646DCE3BFC67A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|MW6PR11MB8340:EE_
x-ms-office365-filtering-correlation-id: 1dd5e363-45ef-4636-c4aa-08dd9e34ee6b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eWNDVnluN3QvcGtudkt0d1o3emdmYm15aGJRQzV1TW5Dd3JYS2RTc2tXQVNq?=
 =?utf-8?B?WHptcm11WlV6SEJlR2dxS3RvaU5oRWNLRllFOXZiZjc4cytnSm84U2Z1Vy9a?=
 =?utf-8?B?Tm1nQVFCNzNiNTRrVXJlVTRuTEYwNW80ck1aQ2RBTnViUXJ3ckpUWXhMbGNa?=
 =?utf-8?B?aGNENG9vY29zdHpkRjVocHdGeFNLV0xhV29JZjdIOFVyMFY4cFFlME1UV0cw?=
 =?utf-8?B?WjdNb05LZ0ZCVGZIOVViaUdYelR3K1hydFZzTnVOMm1uamNhc0FoS0kwckpn?=
 =?utf-8?B?U0hLWVU0cHNadWcxc01iRDJrV24vYW9UY0VVSFBKeldKS2pmS3JKRHBjb1Rx?=
 =?utf-8?B?SUhxcmRoQmVTQjZVbDNtN0pxTnJjMUR4S2lmMGdJczJPanVIZEJ4VE5sNkdC?=
 =?utf-8?B?UUNDNWlJd1Vxc21may9hNll2SmRLbzBCNUQxNmt6QkpncFA4RkMyNkdWaXhp?=
 =?utf-8?B?MGx1WFJCUjBBWERFYXF1N1Ixck5EMmQ1cWtiQUIvSWdNMENFWlAyUnM3MXlh?=
 =?utf-8?B?NnV6b1VQU1ViVkVQZjhIRWtWU0JvVzlCdmg5VVV5TVJCeDU3WlFQdDlVYmRa?=
 =?utf-8?B?bkFhMnd0a25xNEhTT3c5YzJlU2pRT0laQVdMRXRqZG11dElDZ3ZuOW5IUHFI?=
 =?utf-8?B?dHJPdnRNVnI5RWxXYUxnek9VcjUyT2syNFRZbEsraWllOG9jL2Q1TVI5TVYv?=
 =?utf-8?B?S1g3ZTJ0Y0lQNG8vdVlXRlplTEl0UUJTMG1KWXVud3prV2RJTWxPSUpVMExS?=
 =?utf-8?B?ZFdLNzU3SW1OSDZBZWJLYmFKbmRxMXRWL3hEUnB4c1BYaHNqYUk5clBwOWFF?=
 =?utf-8?B?UCs5TitQZXpMYzhCR1F2VUtZdlg3RUR6UzZTRmRrZFFhQ3RWbE90TFV3bHA3?=
 =?utf-8?B?YjBIVEVTN0ZXaklWaTVRUWlac2JyUHRPdUwxa3ZNN1BNbG44d2E5ZHAwdjA4?=
 =?utf-8?B?V1c2QnBYZ0t5eE9HODMzNVphT1FOWGlHcUtnODFBa3h5bzh3MGVyRGtSOHhP?=
 =?utf-8?B?V3RaU0llZWg2dEt0Mk9jdy8vcDR1RW9Oci9mWXdwZ3pXVy9vZjBjSHFkTVgr?=
 =?utf-8?B?T3RFTHZBMnNpbFZQVk1DQ3pnWDYxcXdFWWpyU1c5T25uRlFRODZWV3FjQlhx?=
 =?utf-8?B?MEM0OVBiSXkzakVNRE5ETDRiYUNsQlpRUHlPWTh4QWlCeWhRazBkMG5PMVMy?=
 =?utf-8?B?blJibTJmMWk4aWJXRlRWYjhVZkZSOURDRjJIcFFZZVZuWGdBOStlU2VnNW5T?=
 =?utf-8?B?UFdXZ2prZ2QvZHB3WnQwWmlua2RRZzNYQWUwWnFMT1pENDBXalFYaERNVXlP?=
 =?utf-8?B?SVhyT3JOM0pwd1ZDcVBTQ1ZjQXdZSkN1Z3MyQlNvck1IV0c1Uzg1MWFmVGpt?=
 =?utf-8?B?K1FhdmxOaXN1MzJENDFpRHNxSHh4eHk2K3NFWWlKalluTXR2ZUxtbXBVaVg1?=
 =?utf-8?B?bnhEM0llb1Fab0dkYklqNnRMK2pNaGtqd0thbFVXamFORkhnaXMyK2tEdnZo?=
 =?utf-8?B?cnlmU1Y3TlMyNSszeXRVWXVGczJ4UG5Wb3ljWkM4UnRaYzRDUFIxYTlYNFR1?=
 =?utf-8?B?akFHeWl6VVNuRk9PaWNNOTMwaWN4N25vRUkrcDBuOUZLeFNQN0Y5eHNvZVYw?=
 =?utf-8?B?RlRUaS9ZYmtNdkhxR0hrd0k0bzBJNDRubzFoa2RuNVQrYlJWczlUTlAxM2Ft?=
 =?utf-8?B?MElVTStHZVVmdEhDdEFFY2MxSlpyKzUxYkQ1RHg4UVhzd1JSaWtsVmdZUE9S?=
 =?utf-8?B?dnh5ZURHZWI4ZExmeHFBT1IrbWlwS0pBbWNNMWpQN0YwQkJ6Z2lOQy9VK1hF?=
 =?utf-8?B?ajd2ZFZQUXcrVTRyTm56WmZtalpjRkRXdzhsV1RYcS9Nd3JvS1BNQVZHYXpY?=
 =?utf-8?B?dyt4aEJJL2Zoa1ovWHpaaHptWklEVHJibDBZcmJ2QjloY0lPNVdpUjk1NU4y?=
 =?utf-8?B?OFpuRkw0QTlsaUxkUkNPK1RZRDlvY1NFZHIyNkg5cXBLYy9EWGZYRnYrV25W?=
 =?utf-8?B?VkUyUFZKZkxnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXFqVVNuZDM0L3dFMXc0SWJZYitGaFdIT3ltZVByclBSWXJNSHBob0tzcjZO?=
 =?utf-8?B?ODB2NDZ6dExHdjRtNitiZEFIek92RmtjenVpbFFQU0Q0ZEkyUC8rSzJGdTUw?=
 =?utf-8?B?ODVoMTMxRncvOVM0QUVFU29scTlhQlRqRWFnUkswaHlrYTNxcjdBKzlkSjl6?=
 =?utf-8?B?TmNyazI1RG43TWI5UW1hemRaK01Pck5WL0FyOUtmbkxYRkZCVVFDcFQ5ZENQ?=
 =?utf-8?B?RFppQkhNcGdRZEVBYWYxUEJLZVEyb1hBQzFoVXp5WWRGMTlSdnhkaHMvR3Zm?=
 =?utf-8?B?cHdWRXVDZXg5SjBhdTg2eGVWTURsc0NFUG0rckd0c2RlTnRlMVVBNlhVV2Vk?=
 =?utf-8?B?OUxvUWFtYkdGV0RFUmxVSUkzc1BTUnYxUncvK3gxbUlEaXN2cjg5MkhMNm9j?=
 =?utf-8?B?SGc2RDVaL3lXRUtQTzZQV0J0OXZWb2ovWUVqQUsrU0tFeWM4YzhiaTlYYnFD?=
 =?utf-8?B?QkFFZGl5WDVZZU5ETEwyVTZRdEN3M2N4MGxadDYrZERUb0xjUW1xN1dVREtZ?=
 =?utf-8?B?cHJBRUVNVll0ZkZzcFEyNDlyRDRhdURrTnlxODFEbllFVTdPbkFpVnUwU2hj?=
 =?utf-8?B?VExLWjRNYnlBWEpBMmRmYUNpNkR1SVE5aEZJQytXbVpYZnp3dmlTc1gxa3ZS?=
 =?utf-8?B?R0JsT1Y4eUJpV24xLzFPV29nODlNVTZnZTRXQkdLQW44aGpYMjJkT0hodEdv?=
 =?utf-8?B?YXNMVE54VFZPcUFMYnpuM1c5TEVKR0w5MVhMankvdkd2N1dNcWJXOGMwbXdj?=
 =?utf-8?B?eCtnL0pQWXdraVFZdmVETlF0bnc2MmhTU3BDSUxDNEdzdHd6dzhJRTZqeHdy?=
 =?utf-8?B?WnBXaU5ZTDQwdUM0UjRQZGRYRy85Z253cWkwaU0zTFdXWHVVOXRjSmxrbDJZ?=
 =?utf-8?B?SkFCNTBBZ1dtV1RPVVo2Z1pqa2xiK0RscHR6VG4yWnM4MWFtQVYvNytCb1lm?=
 =?utf-8?B?VHNlbFNLanVJMk0wdm16b1IzMW5yU1FEMU9RcnAzbGlyekd4QU85SG9LUmFE?=
 =?utf-8?B?cXhtOUsrV1hjV01IRXk0ZCtvSVhzYkMwSmZZdm43WXdvUVJqREFmZWx4UU84?=
 =?utf-8?B?UXNhYmN3MjRIU1JsQjlsMHBpSDJuTjZ6dWlyRmpxM28yenI0aks3TktEOFNN?=
 =?utf-8?B?b2VNWEVqUTNhc3ErbVMxb0tuU2hyS01XSWZ6WkNmM2JuLzg0RzBQN1pxdGhr?=
 =?utf-8?B?NmhaTEY0V0VWK2F6Z3pNZjRxTDBqMTRmMGJGZ3dsK3E4aVlKZHdJbWdUOUdM?=
 =?utf-8?B?VG9HdnpoUTVNazlFeW5Bek9wbEhCdjZPZFpYY1VUcHc4MWNXYXAxMkZ4dWNW?=
 =?utf-8?B?andiTGpWV1BkRG9iVEEyTlQ0cldVdWljOWxPYVdGa3NHYXBtd2VZcDczeFkr?=
 =?utf-8?B?WS9GTXB4VkxKU3hnVVo2bHVhd01uaWkvMk55Tm1VZk53SFNkRGQ2NEZvZEF0?=
 =?utf-8?B?ZVg0OXdKWm5BRlBTVHdBQWI3c3llcEZIdUpkb3JsZmVoWWVFT3JtTFh0RnVN?=
 =?utf-8?B?S1ZSdThnV2doL0FsWmgrSkF5WHFHYXo1dXMzS0JXZTNxK2tNeWV6NEdWMDBC?=
 =?utf-8?B?cG9QTldZdkRwMlAwUjYzRjJxOXNFeGZSNnk5K0tRYmxMZ2wrWExOczlsa1pH?=
 =?utf-8?B?aHdReStKVTR3eE9PZ0dxZ0wza3dYRVI5cVRQMENGS0tIL0R3bFBFbTY1YmRE?=
 =?utf-8?B?SFRJN2NBYzFXdkorTFJKWWplYW1ZOFU2Y0I3aDJNRkhwSG8vdWkzZ2hZMjVk?=
 =?utf-8?B?c2VKTk5qQ25Sem94c3ZKQmxOY0RjNUl1clRGL2JjVk8rdW9yR2IxVU0zdHhr?=
 =?utf-8?B?YVZIZmxlZGo2eGJ5bjVpbVNNdXlNYjB1bThuMVlEQjNUQmtnaXNDZ21CV0dv?=
 =?utf-8?B?N2RteENFMU9LSXBtUHA0M1pvbUg2R2lPcUt6ZTAwemhKaGlMaTR1VERlN3ZD?=
 =?utf-8?B?eUVIczVzMXAzL1FycVBaVmlndkFhZU9oV05ndk01a2dJRVVWWnN1aHAwd3VZ?=
 =?utf-8?B?SmVsWTV1N1I1Wm5kYnFIcnkxN1VsSG13YmRYekNZSXd4YnowR09yc0xSbUww?=
 =?utf-8?B?K3ptZE1BcmJvR1JVMFlSUHEzbVhNRlRNdkVoQVpyWGRGbHd5MXUralBzMGJD?=
 =?utf-8?Q?ZEl8uDqWeahmg6bZxTTJ3jTGo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd5e363-45ef-4636-c4aa-08dd9e34ee6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 22:13:53.1810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OjmWCcOrBKkKc15mJW4poRmXEH6xnYqrbyD3ezRVCLub5qnStt0O3weNrHTi8Thq0Ojv5M9Dxz442qH39F88mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8340
X-OriginatorOrg: intel.com

PiBJJ2xsIGJhY2twb3J0IGludG8gbXkgcGF0Y2hlcyBhbmQgdGhlbiByZWJhc2UgdGhlIHdob2xl
IGJyYW5jaC4gIEhvcGVmdWxseSBzaG91bGQgbm90IHRha2UgbG9uZy4NCg0KRG9uZSBhbmQgZm9y
Y2UgcHVzaGVkIHRvIHNhbWUgYnJhbmNoIGF0IGtlcm5lbCAub3JnLg0KDQpCb3RoIFBldGVyJ3Mg
Y2hhbmdlcyB3ZW50IGludG8gbXkgNHRoIHBhdGNoLCBhbmQgeW91ciBwYXRjaGVzIGRpZG4ndCB0
b3VjaCB0aG9zZSBmdW5jdGlvbnMNCnNvIGdpdCBkaWQgYWxsIHRoZSByZWFsIHdvcmsuDQoNCi1U
b255DQo=
