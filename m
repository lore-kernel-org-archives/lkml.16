Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E25A23BCF2;
	Wed, 21 May 2025 23:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747868679; cv=fail; b=lY2FcxD2XwdSytCAquef8Jz+TJfq7FLcF+O6thWw+IuvDh7KfcwJ9GX0uWiYgFMKNuTFeoYEU0Vb49CwHCrbbalZwutobruaqJlk5kzr+Y3KpF2+YGBwFfvAi+jP7lvY8PrrqeVg32F7gQr1y/DJOYtrdQS97gePYYpAD5crKcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747868679; c=relaxed/simple;
	bh=6wbpIlYw3YN0DuZiJhBBMaJdDjGl82nc/PLnFKSH/Rs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BLMFUXHL6Au5ci6DTzmMYK6mptFKYgw15TYoUIz9pYUcCpIgFy5AIzWASU1eEpoaM/CDUM6nrcsx7MLJ3OvtaZi6o5h72RQw4oGWgSHbuqWjts97A7+JysIwzbGQ9pMPEvanFY687XzpwSmhFDIqj3pztXitkQOkHuExAPja1WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8SKswMi; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8SKswMi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747868677; x=1779404677;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6wbpIlYw3YN0DuZiJhBBMaJdDjGl82nc/PLnFKSH/Rs=;
  b=A8SKswMisu3AVUgQv+XtXbWVaMuJVWFKPaEUK8+2QCPQx7PAo3FQO3CY
   IwdacLTTwNpw2dGlkgcBvF4SoJMOTZt4nLGfwt6kLGequj4W90R51K6ci
   Dk6bHTNDwS5BwnxmLSb+8KnJKxpxyZt/9st9VuM08MP4B26gKvNYbP338
   SYozr9ZdoNgYLljIrgq6lncHynhrDKGIi+gFpZB1V5g2TO7EcC0+UinE0
   tddAIHupC8UZ97ZJCNTS0g2nvBrIDEDCO0wNV7Oi2Uh2Ev/OlH9vbtn5W
   o5/GNlmTT7rIa1qYkOauvXfhPiihd059ORN0jhHFdFQCQI2YZgJiro2CP
   g==;
X-CSE-ConnectionGUID: aCEcegwpS/mdG7pkFaPMKw==
X-CSE-MsgGUID: JrdmyZaiS7+E29VJ4BZS9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49793304"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49793304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 16:04:36 -0700
X-CSE-ConnectionGUID: AJ4yxjJKQdScvOvhjE4m7g==
X-CSE-MsgGUID: TJOE8K5LSSyLemROl3uPMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140721878"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 16:04:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 16:04:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 16:04:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 16:03:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tX8EyuXAsy0zLD67enrglmnALIqaQMY9xtvy9+x2PWVRqLuaq47aXCjVv+GS13RO/WGleE/mT9tOK80LKsRYfZRzwtr+vIx+rAkEGTHSpuaT5LPIFPfzD331d0456VqBxFh76q+NLQOnlkKHBBw8pZtr5kXw9dDgY5sGM3US7Uh6F8uvTcLgCCjveYEB5Vz+LUXXV6XXRWaMeKYmu2wo/GFnEiqjppimCj501sBkWXk2TGjnJg8CXXqBnRITRqIu2q7SfYeZj8Xt+PTOyuvFslJG6yDc8+/I/sRzEenHr2t/BVVYWxdgNRWQ1Zrb4Gg7SHV940JLUsuklSlyZ5Fd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5DQPFPxg6ag09betZ+6gfnky00FNMNS37MwoYNZfDI=;
 b=voJCjENvm/PakKIBfuG5YjlgIxgQ4KhKmtywLedrGokgnjvU2u7/SVbJ2WLpBTKcxH9o+QUqUVPg5hNPAM22nSoQw2EfYcr/czBqwvjGf93c2UfWlFzWqCKUdU7SA1/K12ks4KTCN3JlA+a3It/yD3fgsVLysLgcobgS/T43dtwQoZT9EUT9BEUrCG71LWLwCA3Oa61rNrlmNZ4qCPGo6yKqrvrsLcaobeOk3KCyHkzKzmP28z8VnegJT/QJJrmlqbrsdbXR6W7MRQ1DpfTdRd8xfZnTNZYZqkISqlLfJWoVJgrk5gzQIJGNB7nxUjK5JMN25i4cAKILx4eeQrfvLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA1PR11MB8785.namprd11.prod.outlook.com (2603:10b6:208:599::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 23:03:40 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 23:03:40 +0000
Message-ID: <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
Date: Wed, 21 May 2025 16:03:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Peter Newman <peternewman@google.com>
CC: "Moger, Babu" <bmoger@amd.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<tony.luck@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <james.morse@arm.com>,
	<dave.martin@arm.com>, <fenghuay@nvidia.com>, <x86@kernel.org>,
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
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:74::14) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA1PR11MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: d4144c5e-fafe-471a-4aab-08dd98bbb9e1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGhZVFJoSFVDWGlXaUxWK3AvaDU2U0JmMFlWL1Rtbk00VzRIaVRjQTRrU2VQ?=
 =?utf-8?B?SVErMFBLb2RmUlBreEd1a0FHNE15QStrVTJvNUlBb3R3U1pGbmRsY1Rmc29X?=
 =?utf-8?B?c0Y1QnVqbDZiTEQvTFdpc2RNeXYva24wN1pmd0ZkVmdRSjEvMGtBRUFtbDVC?=
 =?utf-8?B?R0tEMHl5c0w5OXZ5MVJaOEdOOUhscUVaQjRZOVAxNzY3Z1R5bzErT0VzNURo?=
 =?utf-8?B?TDlZQjBvMFF3TzhSSHpNU0JoanFXbDJiMjBBMUhycTZJWTEzMHRjR2F4ZCtn?=
 =?utf-8?B?eDkvOGx5aHJ2bEQxS3E1clg4anFmV2tyaDA2NlpUM2M1SGhWdmRUM2pKdjVZ?=
 =?utf-8?B?WlU5Q1Y4VWJPSjkwdzJLR0pBQWI1QmRIZEZDMUIrOFVibVNiQkhLRnpSazJ4?=
 =?utf-8?B?OFh1VkgrSjV2alhCRWQ2LzdndjdPd0VWdHd0c1NQazNYczYyUVJKdHhaenJl?=
 =?utf-8?B?bTBqMzZ0VEhQN0MwSjZ1eUo3Vlp3R05FbmdUYXJFR0xtRTFwVVVCMzFRempY?=
 =?utf-8?B?em1nRmVNM0IvekxudnV1TUh2TjVTN3VEVXprN1VKWHNUNElpNU5hem14dkNS?=
 =?utf-8?B?Z3lER2d4NjZLbjhZVk1wT1VDc2dJOGtQV3N3Q3gwYlE3dXY0U2V1Nk93ank1?=
 =?utf-8?B?OHRxeDdkMzdGanl4bzk1ZHd2aHgvbXJsZzB2d3FnM3poNzdKb0t1amRLdFNi?=
 =?utf-8?B?dmYrdHdtdXU4OHRITmF1bWFpSDRHVmdFVGFVWXB3M0xveXNLQ2J3U1dEdVFs?=
 =?utf-8?B?aHZYQWdqcVVMa2lnNm5jamlOZEtVc01iMWhtSnRSamdjNFBlTzBlWUcrUlNk?=
 =?utf-8?B?SmpUeTI1cjhYTGxUUUM3RnEwUEZKTDRQSjFhOEJIWVI3RUtqSXNCZXlyK0tU?=
 =?utf-8?B?c3NheEM4T0F2RXB0eVU1K1NJN01Sd0N1QkVYQ3R0ZUVVYVJ5bmpZOFg5S0Iy?=
 =?utf-8?B?cFpibFd0UnhSTGZ3aE9CM0c5WXB6ZXo3M256WjRmMitRSE5FeU5qSklxa3Jz?=
 =?utf-8?B?Vm5XUmZCcFVyMlpEejdnbkRiZnF6dkMzMGQxcG5vdmlaVytQaElwMXFDNUdO?=
 =?utf-8?B?UXo4U2J3RE0wcmliQm5wejI4endPa09NRFhMSHVZL3oxbjNhcGVGb0Z1ZGVm?=
 =?utf-8?B?cU54V0FJcEIvbUduVERGZlV0MXZjdkpaT09EVXd2clk5VHU5WEx0eTZ0dnNC?=
 =?utf-8?B?OVk1OTQwQTd5aTI2Q2dOTElRY1U5bG9pSGtPN202Y3QyamJlaHJTZlJGME03?=
 =?utf-8?B?b2FyMU9vRXFGZURnM0FjcFlKdHkyZXhxYWRYWTVpZ2NxV0VQamlSMVF5dHpi?=
 =?utf-8?B?SnR3QTdGUW1ETG5RM3ZqZWUvTXA3eWpJQ3Q3bG85d1p2T3BUc09LeHVkLzA4?=
 =?utf-8?B?UDNpVXZUbEJkSnhrbXBsM1FXWkZDSURJWVdSZDQ2U2FOeDNjK09WZHBtbjBz?=
 =?utf-8?B?bUIzSDlkbWtJeG94VFpZNTlOSjJvM25xVFJyR0s3S1FOMjJLd3BvbjRjeTBT?=
 =?utf-8?B?M3V3MkF2M0JxaEUyNXFLd1pUOFlRRXpxWDVSMGF1bnpaZ1AxZmxYS1lXUWll?=
 =?utf-8?B?eEhKbVV6dlNnNDE3cnBIY1ZmWkE4Y0tpSTNrY3ozMUhCZ2w4R2xDMjhlSGp2?=
 =?utf-8?B?NDE2TDFBNkg2Q0VhdTYxYnBDVklYOFVnK0lIN0JDZmxsVUxBN2pMc1VWa3FM?=
 =?utf-8?B?Um9MMngyQnBTQ0plZ0QyUlhiNFo3Z3hGeDRNTnp2SFhuRjdNbFRkTndGb3V1?=
 =?utf-8?B?Y0RhaEY4eDJLVUxITmtVT0hNaUtyYTJuYzFPQWVtZDRDSDZhZXhiN0IrRjBl?=
 =?utf-8?B?YzdFdCtKbHJWWFdENTBTazd6U1l3aTBReWRSVnd1aS9BV0xXNnhpQ0h4bHNM?=
 =?utf-8?Q?eKyEJV5fLRGAa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXpUTmFJVjMreFJJWFZjQjN5bCs2WVZaRkhTUkJEdDhsZ09wWXFjdXVRaVps?=
 =?utf-8?B?SktMZURIWkx4dmJBcUZKYmdjOXFkVkg4Wm9hVVBWSXIwQ3d3WjF3ZVhITUJy?=
 =?utf-8?B?VmlJZGxCRk1FSzBDUXAxRndWeEJKRjh3L296Ym5TYnI3Umh4UkJRWjhLYzQw?=
 =?utf-8?B?N0cxZmlVWW1TSWdFb2pzNE12dGxCTkgxUThZZ3hleE5YUlc2QUxBdll2bzN5?=
 =?utf-8?B?OVNONUhxRWpxZ3Bad0NUWXBNcUV6cDZ0d1h5UGhqdFFrd3BiZnVwcTVhbk54?=
 =?utf-8?B?VXJPV1VEeHlhVy92ejMwbnhVVytuckZmcnN0bGVoT0xjSmxEMDEvQnFOT2hB?=
 =?utf-8?B?SDZyZlRPRVpQRTFlN0hvT0tpMnJVSHRLdlU0L3BzTzBXR3VzcUd0SlFsZm9k?=
 =?utf-8?B?K0lIU2IxZlMzSWJrOTVNVUV5UW55NG5zbmUreW9oMmhJVHN6VnplaXFtalhM?=
 =?utf-8?B?RldTMENqdWQrTWszWW16bHE1aGowbU03dCtFQ3JkeGhISU0xcXlQNTJpVVRo?=
 =?utf-8?B?ZDg0S0V0WGJDbG4wSFpXUkg1NURlRExYNEFDTGtxRDFiR2RIdE1ONjJnVzh6?=
 =?utf-8?B?eDdEQTg3OHhsRDdsSndQVzNvRXQzelBUS2YrczB4d1pJeno1WVFIK2VVaUgw?=
 =?utf-8?B?djI1Y1dNcDcxb1F3T0dsZVVsUnc0SXVWZEZ1dGFpS0gxOEZOVXJ3TTdONlgz?=
 =?utf-8?B?ZmlVUU1RZi83ZTluNmVzajhMM0VmWEJvZXhoeFF3ZHNYTzdWdElpaTN3KzlW?=
 =?utf-8?B?MVdoVkhlQm5lU3VxSGNZVVBBU0lRWDFMVjExQ2RzRU9Rc0dmd2NJWnNqNjU2?=
 =?utf-8?B?TnVLOGNqWDdSOHNsbFlXQjlsbEw0MzlCMEovNlpZcFI2dGZneUJRZGxzLytI?=
 =?utf-8?B?SXZDRk5aeUFoTzBuWnZvbS9UQlBNSUhWY05URFdoM0YvU04zNkpwcWdGUkQ0?=
 =?utf-8?B?WW9MUTUyMHFZcDMvUUZwM2lBdVpDN0ZNZGhKdlEwSUtjTGtIWkZ2aHVqNkJK?=
 =?utf-8?B?akRiMk4wUHpXeWovZ2hyY2FRS3RlQndjb3dTckMralpQcEZudXFmOFdZb1hv?=
 =?utf-8?B?UUh4bGl4UWNidVVoZHNYajZZMENsUzVSL1BCNFlXUDQ4bmtkNm1TR1ZDcm0z?=
 =?utf-8?B?THhQcjh5QVNWTys2YnJlZ0Y1WU8ycFAvYjV2S241aUNqM3hRQmlFaUgxTnJ1?=
 =?utf-8?B?ZEFnSU5DdU8rRkdnTmxEdURuNzVvRGNEbDYrNHJCUHg0WEFyajd3dldLQWI3?=
 =?utf-8?B?aXZDcUdCb0tYc0xldUZNejh2TXJnL3hHN1NDdWl1N3lFUnpjSndRUVdDUUJH?=
 =?utf-8?B?Rm9iOUpQNDlLRzkvbndzQnJuNUU4dkYrOG9ERVVDUDkzMk9vMVZZaTFrbU5k?=
 =?utf-8?B?TEtSQjk0cFpKTSs2WDlpd1JRbkFrT3NIaDJaQkVkcHVuR0llYmhrQjNkOHpi?=
 =?utf-8?B?aThRTTVPQVIvMEh1MHhNc2JCSFJUYTV5OXlqeTBQU203YjZYODltdHFzZ1No?=
 =?utf-8?B?Q3l5cVgyK3RtUWMvcjlBQXBkVTA2Y3FweGo2ZTIxVjFuVElyZUFsbU1MeGsv?=
 =?utf-8?B?QnVRK1hHRnRMVUVvYWp4WWVoK2R2SVdkbElJL1hMYVlmV0czRG5IVXEvMU1n?=
 =?utf-8?B?OXF5Qm4yM3VKN29MZ1VGcnpqaVU4bGliNVRlUjJrVjVOSzlqOTR4eVNqT3BL?=
 =?utf-8?B?VStvSjM4b1VsbW16Ynp3dmJzdG9EWW9CQXZId2kvbk1la1V2NDJSdnhPanRw?=
 =?utf-8?B?V005Q2pBNm5tMyt5ekdhbG5lOG5mbUM2NlNyOVArc1k0VFVZeVloNGV6U1pL?=
 =?utf-8?B?MlVYVWVpYVladnV5ZXpvMU9WTXdCQ0l4cFNqSHZabkJqck5nQlhYMGIyRHhQ?=
 =?utf-8?B?Z01ZeS91OTJFTlljUWdwemN2SytKeGxkalNQbmcrRVgyQXB2SE5seDhRaWIz?=
 =?utf-8?B?c1BmYnNRTm8rQWx1YndmMEl2RVdlNFR5dDVnTTVJQlNMeHlEV2JGQnRQbW1l?=
 =?utf-8?B?OVJlamJ4cmNvVFZJa3F3aDJBMXl6ZTZjRnhGSzRVYkVpSVNRc044QnVqMGJm?=
 =?utf-8?B?MllVSjR3WVdVN3pJTTNyV3NLWlE2ME12aG1RelBxYW9reGltUnZJdVIyRzY0?=
 =?utf-8?B?aHk5d3pub210Vy9rRFlxRGg2cURJcU0xWjZIeTR1TVBTU3ZCSjhtTjNaeW9K?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4144c5e-fafe-471a-4aab-08dd98bbb9e1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 23:03:40.4891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyQMnMVfjmOUJ+VwMhuK0dsqX3o+ciF7GhhWu+xvLn4nThj50OYAheGEBKqErM2q3aP7El0LDW2E9laJTCDbU0z1jiz5ZDSW0Y66Tzf7r80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8785
X-OriginatorOrg: intel.com

Hi Peter and Babu,

On 5/21/25 2:18 AM, Peter Newman wrote:
> Hi Babu/Reinette,
> 
> On Wed, May 21, 2025 at 1:44 AM Reinette Chatre
> <reinette.chatre@intel.com> wrote:
>>
>> Hi Babu,
>>
>> On 5/20/25 4:25 PM, Moger, Babu wrote:
>>> Hi Reinette,
>>>
>>> On 5/20/2025 1:23 PM, Reinette Chatre wrote:
>>>> Hi Babu,
>>>>
>>>> On 5/20/25 10:51 AM, Moger, Babu wrote:
>>>>> Hi Reinette,
>>>>>
>>>>> On 5/20/25 11:06, Reinette Chatre wrote:
>>>>>> Hi Babu,
>>>>>>
>>>>>> On 5/20/25 8:28 AM, Moger, Babu wrote:
>>>>>>> On 5/19/25 10:59, Peter Newman wrote:
>>>>>>>> On Fri, May 16, 2025 at 12:52 AM Babu Moger <babu.moger@amd.com> wrote:
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>>>> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
>>>>>>>>> counters available for assignment.
>>>>>>>>
>>>>>>>> Earlier I discussed with Reinette[1] what num_mbm_cntrs should
>>>>>>>> represent in a "soft-ABMC" implementation where assignment is
>>>>>>>> implemented by assigning an RMID, which would result in all events
>>>>>>>> being assigned at once.
>>>>>>>>
>>>>>>>> My main concern is how many "counters" you can assign by assigning
>>>>>>>> RMIDs. I recall Reinette proposed reporting the number of groups which
>>>>>>>> can be assigned separately from counters which can be assigned.
>>>>>>>
>>>>>>> More context may be needed here. Currently, num_mbm_cntrs indicates the
>>>>>>> number of counters available per domain, which is 32.
>>>>>>>
>>>>>>> At the moment, we can assign 2 counters to each group, meaning each RMID
>>>>>>> can be associated with 2 hardware counters. In theory, it's possible to
>>>>>>> assign all 32 hardware counters to a group—allowing one RMID to be linked
>>>>>>> with up to 32 counters. However, we currently lack the interface to
>>>>>>> support that level of assignment.
>>>>>>>
>>>>>>> For now, the plan is to support basic assignment and expand functionality
>>>>>>> later once we have the necessary data structure and requirements.
>>>>>>
>>>>>> Looks like some requirements did not make it into this implementation.
>>>>>> Do you recall the discussion that resulted in you writing [2]? Looks like
>>>>>> there is a question to Peter in there on how to determine how many "counters"
>>>>>> are available in soft-ABMC. I interpreted [3] at that time to mean that this
>>>>>> information would be available in a future AMD publication.
>>>>>
>>>>> We already have a method to determine the number of counters in soft-ABMC
>>>>> mode, which Peter has addressed [4].
>>>>>
>>>>> [4]
>>>>> https://lore.kernel.org/lkml/20250203132642.2746754-1-peternewman@google.com/
>>>>>
>>>>> This appears to be more of a workaround, and I doubt it will be included
>>>>> in any official AMD documentation. Additionally, the long-term direction
>>>>> is moving towards ABMC.
>>>>>
>>>>> I don’t believe this workaround needs to be part of the current series. It
>>>>> can be added later when soft-ABMC is implemented.
>>>>
>>>> Agreed. What about the plans described in [2]? (Thanks to Peter for
>>>> catching this!).
>>>>
>>>> It is important to keep track of requirements while working on a feature to
>>>> ensure that the implementation supports the planned use cases. Re-reading that
>>>> thread it is not clear to me how soft-ABMC's per-group assignment would look.
>>>> Could you please share how you see it progress from this implementation?
>>>> This includes the single event vs. multiple event assignment. I would like to
>>>> highlight that this is not a request for this to be supported in this implementation
>>>> but there needs to be a plan for how this can be supported on top of interfaces
>>>> established by this work.
>>>>
>>>
>>> Here’s my current understanding of soft-ABMC. Peter may have a more in-depth perspective on this.
>>>
>>> Soft-ABMC:
>>> a. num_mbm_cntrs: This is a software-defined limit based on the number of active RMIDs that can be supported. The value can be obtained using the code referenced in [4].
> 
> I would call it a hardware-defined limit that can be probed by software.
> 
> The main question is whether this file returns the exact number of
> RMIDs hardware can track or double that number (mbm_total_bytes +
> mbm_local_bytes) so that the value is always measured in events.

tl;dr: I continue [3] to find it most intuitive for num_mbm_cntrs to be the exact
number of "active" RMIDs that the system can support *and* changing the name of
the modes to help user interpret num_mbm_cntrs: "mbm_cntr_event_assign" for ABMC,
"mbm_cntr_group_assign" for soft-ABMC.

details
-------

We are now back to the previous discussion about what user can expect from
the interface. Let me try and re-cap that discussion so that we can all hopefully
get back on the same page. Please add corrections/updates where needed.

soft-ABMC
---------
  soft-ABMC manages "active" (term TBD) RMID assignment to monitor groups. When an
  "active" RMID is assigned to a monitor group then *all* MBM events (not LLC occupancy)
  in that monitor group are counted. "Active" RMID assignment can be done per domain.

  Requirement: resctrl should accurately reflect which events are counted. That is,
  we do not want resctrl to pretend to allow user to assign an "active" RMID to
  only one event in a monitor group while all events are actually counted.

  Caveat: To support rapid re-assignment of RMIDs to monitor groups, llc_occupancy
  event is disabled when soft-ABMC is enabled.

ABMC
----
  ABMC manages (hardware) counter assignment to monitor group (RMID), event pairs.
  When a hardware counter is assigned to an RMID, event pair then only that
  RMID, event is counted. Hardware counter assignment can be done per domain.


shared assignment
-----------------
A shared assignment applies to both soft-ABMC and ABMC. A user can designate a
"counter" (could be hardware counter or "active" RMID) as shared and that means
the counter within that domain is shared between different monitor groups and actual
assignment is scheduled by resctrl.  


user interface
--------------

Next, consider the interface while keeping above definitions and requirements in mind.

This series introduces (using implementation, not cover-letter):

/sys/fs/resctrl/info/L3_MON/num_mbm_cntrs 
"num_mbm_cntrs":                                                               
	The maximum number of monitoring counters (total of available and assigned
	counters) in each domain when the system supports mbm_cntr_assign mode. 

/sys/fs/resctrl/mbm_L3_assignments
"mbm_L3_assignments":                                                          
	This interface file is created when the mbm_cntr_assign mode is supported
	and shows the assignment status for each group.              

Consider "mbm_L3_assignments" first. The interface is documented for ABMC support
where it is possible to manage individual event assignment within monitor group.

For ABMC it is possible to assign just one event at a time and doing so consumes
one counter in that domain:

a) Starting state on system with 32 counters per domain, two events in default
   resource group consumes two counters in that domain:
# cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
0=30;1=32
# cat /sys/fs/resctrl/mbm_L3_assignments
mbm_total_bytes:0=e;1=_
mbm_local_bytes:0=e;1=_

b) Assign counter to mbm_local_bytes in domain 1:
# echo "mbm_local_bytes:1=e" > /sys/fs/resctrl/mbm_L3_assignments
# cat /sys/fs/resctrl/mbm_L3_assignments
mbm_total_bytes:0=e;1=_
mbm_local_bytes:0=e;1=e
# cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
0=30;1=31

The question is how this should look on soft-ABMC system. Let's say hypothetically
that on a soft-ABMC system it is possible to have 32 "active" RMIDs.

a) Starting state on system with 32 "active RMIDs" per domain, two events in default
   resource group consumes one RMID in that domain:

# cat /sys/fs/resctrl/mbm_L3_assignments
mbm_total_bytes:0=e;1=_
mbm_local_bytes:0=e;1=_

What should num_mbm_cntrs display?

Option A (counters are RMIDs):
# cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
0=31;1=32

Option B (pretend RMIDs are events):
# cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
0=62;1=64

b) Assign counter to mbm_local_bytes in domain 1:
# echo "mbm_local_bytes:1=e" > /sys/fs/resctrl/mbm_L3_assignments
# cat /sys/fs/resctrl/mbm_L3_assignments
mbm_total_bytes:0=e;1=e
mbm_local_bytes:0=e;1=e

Note that even though user requested only mbm_local_bytes to be assigned, it
actually results in both mbm_total_bytes and mbm_local_bytes to be assigned. This
ensures accurate state representation to user space but this also creates an
inconsistent user interface between soft-ABMC and ABMC since user space intends
to use the same interface but "sometimes" assigning one event results in assign
of one event while "sometimes" it results in assign of multiple events.

wrt "num_mbm_cntrs"

Option A (counters are RMIDs):
# cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
0=31;1=31

Option B (pretend RMIDs are events):
# cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
0=62;1=62 

Neither option seems ideal to me since the interface cannot be consistent
between ABMC and soft-ABMC.
As I mentioned in [2] it is not possible to hide ABMC and soft-ABMC behind
the same interface. When user space wants to monitor a particular monitor group
then it should be clear how that can be accomplished. Not knowing if
an assignment/unassignment to/from an event would impact one or all events
and whether it will consume one or multiple counters does not sound like a good
interface to me. 

As I understand current interface, user is required to know how ABMC and soft-ABMC
is implemented to be able to configure the system. For example, if user has file like:
	# cat /sys/fs/resctrl/mbm_L3_assignments
	mbm_total_bytes:0=e;1=e
	mbm_local_bytes:0=e;1=e
user must know underlying implementation to be able to manage monitoring of
events and assigning counters otherwise it will be a surprise to lose monitoring
of all events when unassigning one event.

This is why I proposed in [3] that the name of the mode reflects how user can interact
with the system. Instead of one "mbm_cntr_assign" mode there can be "mbm_cntr_event_assign"
that is used for ABMC and "mbm_cntr_group_assign" that is used for soft-ABMC. The mode should
make it clear what the system is capable of wrt counter assignments.

Considering this the interface should be clear:
num_mbm_cntrs: reflects the number of counters in each domain that can be assigned. In
"mbm_cntr_event_assign" this will be the number of counters that can be assigned to 
each event within a monitoring group, in "mbm_cntr_group_assign" this will be the number
of counters that can be assigned to entire monitoring groups impacting all MBM events.

mbm_L3_assignments: manages the counter assignment in each group. When user knows the mode
is "mbm_cntr_event_assign"/"mbm_cntr_group_assign" then it should be clear to user space how the
interface behaves wrt assignment, no surprises of multiple events impacted when
assigning/unassigning single event.

For soft-ABMC I thus find it most intuitive for num_mbm_cntrs to be the exact number
of "active" RMIDs that the system can support *and* changing the name of the modes
to help user interpret num_mbm_cntrs.

> 
> There's also the mongroup-RMID overcommit use case I described
> above[1]. On Intel we can safely assume that there are counters to
> back all RMIDs, so num_mbm_cntrs would be calculated directly from
> num_rmids.

This is about the:
	There's now more interest in Google for allowing explicit control of
	where RMIDs are assigned on Intel platforms. Even though the number of
	RMIDs implemented by hardware tends to be roughly the number of
	containers they want to support, they often still need to create
	containers when all RMIDs have already been allocated, which is not
	currently allowed. Once the container has been created and starts
	running, it's no longer possible to move its threads into a monitoring
	group whenever RMIDs should become available again, so it's important
	for resctrl to maintain an accurate task list for a container even
	when RMIDs are not available.

I see a monitor group as a collection of tasks that need to be monitored together.
The "task list" is the group of tasks that share a monitoring ID that
is required to be a valid ID since when any of the tasks are scheduled that ID is
written to the hardware. I intentionally tried to not use RMID since I believe
this is required for all archs.
I thus do not understand how a task can start running when it does not have
a valid monitoring ID. The idea of "deferred assignment" is not clear to me,
there can never be "unmonitored tasks", no? I think I am missing something here.

> I realized this use case is more difficult to implement on MPAM,
> because a PARTID is effectively a CLOSID+RMID, so deferring assigning
> a unique PARTID to a group also results in it being in a different
> allocation group. It will work if the unmonitored groups could find a
> way to share PARTIDs, but this has consequences on allocation - but
> hopefully no worse than sharing CLOSIDs on x86.
> 
> There's a lot of interest in monitoring ID overcommit in Google, so I
> think it's worth it for me to investigate the additional structural
> changes needed in resctrl (i.e., breaking the FS-level association
> between mongroups and HW monitoring IDs). Such a framework could be a
> better fit for soft-ABMC. For example, if overcommit is allowed, we
> would just report the number of simultaneous RMIDs we were able to
> probe as num_rmids. I would want the same shared assignment scheduler
> to be able to work with RMIDs and counters, though.
> 
> Thanks,
> -Peter
> 
> [1] https://lore.kernel.org/lkml/CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com/

Reinette

[2] https://lore.kernel.org/lkml/b9e48e8f-3035-4a7e-a983-ce829bd9215a@intel.com/
[3] https://lore.kernel.org/lkml/b3babdac-da08-4dfd-9544-47db31d574f5@intel.com/
