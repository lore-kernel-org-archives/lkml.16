Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03A7290093;
	Fri, 11 Apr 2025 20:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744405011; cv=fail; b=nYr9Dp67SMBtQpIMt/vMtPcR2IOzBepuu2px7VqL73NEY2uO4pyjTKCFxjo8F33fXCXG8Px/wpyA4PCb6rghzP3ehHXNt1Ut/Y4/tKmNdt4IlY5hNIiTCh8s2oSIlKdvvdNq6CL+ioEhFgezOttPQSod24gTM0ZkSFVLHNQWY84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744405011; c=relaxed/simple;
	bh=OdlybHoSnlMl1528olDg77NwA6EAa6vLjYSdOJaX2Nw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CoxnH4wLaSA2YqyFbLtZvAJbyPQfdKPgMoSU8x2G5B4rYYUzYNAOF4WTYtn2VAMjBD6BzM7ziucjCO0cQagFp4cot5Krh2r9xQ3hHpBGt9xZMwcb/QTAuKG6DtnyXnJblNtoPsfDJp/2AacSdFsXaSleKn6qIOBTokj21lsPe2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bc0H/HJq; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bc0H/HJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744405010; x=1775941010;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OdlybHoSnlMl1528olDg77NwA6EAa6vLjYSdOJaX2Nw=;
  b=bc0H/HJqJb+7C5VbHSHhr5EzR9srJ0758P2BUAHSQsqtC6SCzkmKT2TZ
   ke55bYH0TFRT2xhyVrMKsgSper6ZZ+x3uioGhnUO9JAfnF/ho8KtDn6qu
   AJtziAEdnUwimw+Dzat/AsMHrjSN4CRpowd5csQn7q6YkS+3s7hajgDJI
   0Clh6m/2N0c4BbVdAYTIFZhoHgjvIOBkPvUWGAc30cWVoFLVzcbhtjVyi
   XaoQjqw94kFW2w5jdqytteWyvD4QI2OaXWQXmVl0U7lv27YFWz/YX6BPi
   Ql9fWjymN8HBY+U2eF5jfWlGQ5F9dYlpFE6A8/lYaW7/dHyHSto6VPcPY
   g==;
X-CSE-ConnectionGUID: q/URTY0NQ4GjYhog998wdQ==
X-CSE-MsgGUID: /hKw7FY6R1+0YQzXLnQJdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49619145"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="49619145"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 13:56:49 -0700
X-CSE-ConnectionGUID: y4m+v/sUSuuZSyzbuA5drA==
X-CSE-MsgGUID: hB+4pMCBQKez4H+lodw5ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="134043440"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 13:56:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 13:56:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 13:56:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 13:56:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffsZRZuz+wsxPTm3gh0KEy7u6iF9hp4yz1zRXO4JuLP6wfU7QebvRptX6KKPy//L/f77s8EEK0tABSyWvrxRUUG5Wt6eRxqAAJX8xthkE7pfeKPKq10n3zZAqgitP7TM1JRkbj303lExuSjxVSnDqxcwEZwnXW27RUW/O6XnZlXx+90KxN8GMV0MXhxTiSVapbg5o+YQ0Fq7jRMXCU7LgYW/NOc8rfcgMBZjpv84WKsDI7ZjTBZg4KJIcWykFqhNupDCWKpOud0kmsOHykyuWSxMyOpAu1ZU3rB5Ey7h3Jn+wGKSB/4fvnwm4E5Qk0DH96O2uyeZR1+5FD6itdyshA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86QtCNQIbv1KDorE+N0MqF1ck+KEnt+NE1B4v+5pqTE=;
 b=GEAnfmd9M/K2sGItVnEU5wP1BDK0cCtzFjlrUjnh/7NuEgegLA7asefewWJJDCfeV/W+8R3qkwf30EdG3cohz5/qVg49Gq0T4wKRVk3zLQ19l2XQ4BCOfhqyMevRVTczwj5sds9Bz+enl8ikOyJ+O6BKSZxMoICfqVljrJNjPVqeaTg7nWhuGei8ALTPwU0/zHR6zvH/UupehqVa4mwJO7ELU0Rbrb1YMgnM56Gjd9uIUnmcD6J+5EXoG79MFqiWsKSrX0OIghkYafrItd50WgkYtjCexIHaBtfHUTPM4N2nmwkJm7++V66+LvkkDtQPHQ4eu0OQFwoZTZvXcDLxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by SA2PR11MB4889.namprd11.prod.outlook.com (2603:10b6:806:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Fri, 11 Apr
 2025 20:56:39 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 20:56:39 +0000
Message-ID: <59829882-20e4-4b94-ba46-8fa622841857@intel.com>
Date: Fri, 11 Apr 2025 13:56:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 08/26] x86/resctrl: Introduce the interface to display
 monitor mode
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
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
 <272948ba495f51acf707d48ef60d0ba35b4417a1.1743725907.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <272948ba495f51acf707d48ef60d0ba35b4417a1.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0377.namprd04.prod.outlook.com
 (2603:10b6:303:81::22) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|SA2PR11MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f12e5e-641c-4c09-0179-08dd793b5b0f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eG1nQmJ0KzNSdksyOXM0em9LMW0zdS9tc0E5M21sWTZtK2hKalhwam5WQnkz?=
 =?utf-8?B?cWhrUmVJKzRCUlhEbUhuN2E1c1BET1ZaeEFMaXBpZGV2R2wrYjRpTERhTDY3?=
 =?utf-8?B?ZGpheEt0YWV0QjlndDBWOGRTRFgzeUZGWjBRK2RFVFdCVGpWbE1pNmJoNmU0?=
 =?utf-8?B?TXlHalgyUE8xTEpISmwvcHRLRGdQdUtFV09YSDNSYThDMHpSUUZ2QnRjaXNE?=
 =?utf-8?B?VWRRd0xyVTFVbDNsTGR1OUgrS1didG85NmZZRDJaN1NrbXdYZk9RTERrYmJy?=
 =?utf-8?B?a2JoUkpRazRSdWFWL2c1dHN3Mm5SRXhsRDJTSnZPWEd0dkdiK1I2SWdNM01K?=
 =?utf-8?B?bU5OamE5L0czMWxxTkUxZ3E0VDZZcEtzQTRlTjZTS3dRSDRRYW5DNUp5MHIy?=
 =?utf-8?B?R3ZJQVlPM0g4VkFlRkdXaVhhMmN2QlhYVjZVWUZXNEVPMk5GSGN1ZUtHanVy?=
 =?utf-8?B?RDZaNW0vdmVkdGJUZDI3RzBoWHRyQnhwVW9xc2RMemNwdm1SR3hybmpYaHpE?=
 =?utf-8?B?djBjQzVuUlpJaTlPMG03aXpsWWk5RW9PVzJubWZ5TUpadVQ1blY0WDhyTkx5?=
 =?utf-8?B?NFVBay8rMEFsdkkra2pGdG1ZTnZXVmlPL3h6UmFXazk5RnNjdnpORVg3R0Z2?=
 =?utf-8?B?aVB1NjlkQTExUWRITTJ0Y2dWell1TDh1Q0ZtN1JubGFWQUYvRHFRTVArVjNN?=
 =?utf-8?B?U1p5d2MweFRWUzhMNzFuYUhSOHFkQ2xrL0tHdlFhZ1llS2lWczJYK3hudUFC?=
 =?utf-8?B?am1ORUR6dFY2QTBYRVVsVUtkb2lmM1VaYXo3YngxZUhjOW1PNVV0eFdLTUdi?=
 =?utf-8?B?K2xoSmRYVUhveXNGTG9LNitzTWJRZkNEekg0SUpXV0oxMEphTVdCRHlkaXZI?=
 =?utf-8?B?RVk5OXJhbUJvWHBqeTY2WWU0dUJmeWVGTDNuWjVBOVhtejhyMEV1bE9Yb0JP?=
 =?utf-8?B?NHZZSTV3RTFsQmZwTk5rV1JXRXJxYzFSUkV1ZFp1ZXZqbUJqUlBHN252M3Qv?=
 =?utf-8?B?M0J1NnRaVFRiVncxWGcxNXowajQ4THcvU1pENHFjRVhLMGxJTGFScGVDOUZH?=
 =?utf-8?B?RkRuTDh3Sm5LcUMvb0hOc09WRGg2N3RYNWFMZ0o2Z2RsNWt3enNRRHYxNnFu?=
 =?utf-8?B?ejFXcEp1VzBja09EYmhMRER0SWVmdWVzSDdEY1B3R2N2NFB2Mk5xeHVHRWo2?=
 =?utf-8?B?dU1rNmVzZFI3OURjWllpZUR6RU92eDNZa0dOcVFNR0NXc2xkOEdiSFh6TFha?=
 =?utf-8?B?SDYzL0l0NHM4K3A3TTEwQ21kOVVMSjM5UjNnY2Z0WFdCRm9BTlJKMm5MdWxL?=
 =?utf-8?B?M0doS2ExeTVkVlBVQWtGbHhWa3dvbXpaNHBaN3NwaGluWUZXcnAybTA0T0pO?=
 =?utf-8?B?Rm9SbFl6emJQajF2MVRqVU44V2ZMdlZMUmRDV3BTL2NaZ0hNd2hyRlN3WHZC?=
 =?utf-8?B?Q1FBK1FHTkZ1bVhYYXZPcndhSUhXSS9BUFZKbUgzWjdSd05MN1RzYXIyZnZQ?=
 =?utf-8?B?SkhsT043ZU1jd2lsdXFhZmYxd3dIRERtQzdzbFpTUXBSQ1B1c0tsZnVabVpC?=
 =?utf-8?B?bXB0aWNVMVNQcEtvdk4xcEEyS0hjRWJnQUxKdkxhZUhsZy84djdIK1hJdFdq?=
 =?utf-8?B?NGswa2s1VkVmdTlDSFptWW5kYmdLWlNVMGdqeER6eG9ZcEtXcU5rbU9FVDJM?=
 =?utf-8?B?OXhHcUZodlMvSldxMzNGTjlvcEZNOG9aQzhXdDdBZ2VHbnlHU2trWFJBWG81?=
 =?utf-8?B?T3VMZTUwZy8xVzNLcVR0TGtpM1hncGZTY01jVEJSamlKeW5WODZtTkhyQlBS?=
 =?utf-8?B?a0JRaGV0WFMvQ0lQN2ZFaWxMVEVYTk1seEdWSDRDWDF6NjlTTTRZSHlSTkRR?=
 =?utf-8?B?bzd4ejZFQjd5TUtDcmFuaGQ3bVllRkZ1ZnNGRHdkMFZIY0F2K1lXeXp5Q1p1?=
 =?utf-8?Q?bM+Oj8WAgkQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXp4UGtlN3JzYU1INkRtdlVHZTBlNDVmZjNSNktScjJzbXdzRHNNcnd3R05j?=
 =?utf-8?B?KzVIR0xEM3Q3NFdBNWZBenZuM1NIVVFRS2Z4L0ZkaUpwU2V0alRFSWJKM2F1?=
 =?utf-8?B?aVY2ZW9TSklsTWRFWUlHM3dXN1RtTXpVc3RlU0VON050TGVnUExKdTN2dmFU?=
 =?utf-8?B?L0FsUklHRVlXM05kZzdNZUpwNWdJVHY1bHZsbVNCY25nRC9HVUlxYW0wcFBI?=
 =?utf-8?B?VnBYZWhPSGxYTTlLYjlqTXA0RE1BTzIrVEtTS0xwVnBnaHZHMTFheDI2c3lB?=
 =?utf-8?B?N2p2aWZEc1BQSDA2RmlTaW55SG82S2JydTBtbVQydXJGVy82Nnc5bFdhQS93?=
 =?utf-8?B?TlZsaE9ydjd4cG1UN0RwbWtyS2pyL0xuU0I3aXBRd3U1QXo1c2V2SDQyYXlF?=
 =?utf-8?B?MUgxNG8vcUo4cmtYRDgwTUtRcG8vSHRDMExMS1UvdHpBOE1OazRmdS96ejN0?=
 =?utf-8?B?THBqMFlOSXJZNDBlbWdueUlhZ3phWXEzUjliemZYN3Rpc0NvNXJVaTlyS0lE?=
 =?utf-8?B?WVBFaEU5akhKWU5jWk5ibWFpeWJMLzZ0Y0tsTTdqTDhHdnA3S29mVGJmNUlH?=
 =?utf-8?B?cThjQWUrdFN6dUtBaXF6akpzTFk5ajdEN0gvZ0N1NG9BdEJ5ZEprK2VxbHBS?=
 =?utf-8?B?QWxTcUwzT1BtQkxTUzVtYmY3T1hTcmQ2YXJyekZGWjR5L1hwNTZjcWg5SjJU?=
 =?utf-8?B?U1dLVUt6T3FWdm1xVG1odFN0Q1dGVzJEWmNZclZKdTVHM0VsWHZzRjFrdzBD?=
 =?utf-8?B?YXlzMEdOeVNqNFJHSE4vaTNCWEp6OG8zenBVam5qbTN0TVJYK1FBbGhLb3pB?=
 =?utf-8?B?ZlBlRTdKcER3NXovaXdZQmVZMk9mblBKbUd5ZnZXdWFDZHVIdWZpQmJ2R055?=
 =?utf-8?B?dGFvbW5NK0xSQVpSK1h6TWZzNUJVN0Nic2IzRTh6YXhINS9aVmlQL1ZFcVMx?=
 =?utf-8?B?RlJ5aEFuc1VSQ3RmN0RBSzhna285M0FGZStNalVmQ3FNZDZFbUg2MVN4NGMz?=
 =?utf-8?B?SnlsbHlBb0EyUi85cDZ4dmZLNlR3akU3TDhIUmFhbTRYMnlQYVBKNlIvVnZS?=
 =?utf-8?B?aGFOU3BZazhtSXhxSGRISW1RNHFVRUtvWXRYRGY0WklzTGFsYnlyOUYyU2tr?=
 =?utf-8?B?V29ZTXdKZktPNDJNVzhDdURndWNvd0pZdlZlNTNrYURsMWtiTjQ3elpNb29i?=
 =?utf-8?B?Q1JJQXdvTlBrcFQ4SmJMNVdWS1p5TnZjdzZNVGlHVXkwQWU3LzhtazRnWnpX?=
 =?utf-8?B?dlBCenhmV3ROU3RxeU00cmlhbXJBdE16YzljREswczByQm9CSkVlZ2RDVHlZ?=
 =?utf-8?B?clVReFRTcituL3c1ZUc4RU0wYXkrQXJUV2p1R3RLbkcvTVhWY091YnhtNWRk?=
 =?utf-8?B?N053WEswNXh1YzRkRkE2cVZKdGl5c2RmbjFEbHllM1FVeWxaRitNNStjSEtr?=
 =?utf-8?B?TFM4Zzl2Y244bm5MOUtzc2syeFNrdXNWSy84Y21kL0VxcGJlay9LcHR6Zk11?=
 =?utf-8?B?RjMyQ1RNZXJnanNoTitPQmE0TStkNHd6OTFRdGlya0hHc2JTMTFSNktGUWUr?=
 =?utf-8?B?cXpLUGR2Zkp2clltR3RhMWtOYmtNRXJlTDNma29pYjBKUFpualh1ZlZOdlZy?=
 =?utf-8?B?S0lQcFpxWWFoaC9RVWtLcWc3Ym85dGFMZENMOFQ5TitubDBkUE96dWNNMmxv?=
 =?utf-8?B?RnphNlBJZWsveEpzdjZxS3grR3BPODZ2cUJnUldhRU9mS0RUL0p5bm9SZUpZ?=
 =?utf-8?B?NUNHSkh4dDdDWXF1OU95Sml2ZWVvUFlpTjhjdmxkYzEyOFUwdzZhOTlxVWVI?=
 =?utf-8?B?OHFKQmVaamlyclQ3cGI5a2NXdDN5cFdPTXFrNUZlbEFjWXMxL2paR21hN1Zs?=
 =?utf-8?B?dUFuMjc1bU0yNTdjRVNSQW8rVWkyckhXdWxzVGEvaDh1a3orbG9VSmRYZisz?=
 =?utf-8?B?QUlVcnhGMW9BbTZ2QzlST3ZWc01aZjI2ZUIzOG1YWENOTjg1T0NpZkRIdkNQ?=
 =?utf-8?B?RXFGSUdlMzBFT3VjaEd3SHdRS21UcW1rT1VUOFU2aWU5U2ZYcHlMaW9IK1Qr?=
 =?utf-8?B?Mkc5UWJZRzlyWkdYZlNXL3NmSFJSaEVUSU5JSkVpVU94SWRURWR4MXBUTWZE?=
 =?utf-8?B?Q1BoeHIvdmlxNGplaTUwZFhWMVZqUlpYcmk3bWg1b1pNUlhXV1VsaE9uZVQ1?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f12e5e-641c-4c09-0179-08dd793b5b0f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 20:56:39.5578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOjIjbVEdl/IWLCMyPYPH7C0dd8DOnB4ltcw1HL1RjfPEaA0lnqrSlHxBgK5etgZFyGbkz4iiDWOG0n0HmjbrfNU30K9XzEUzaQ6cUtTKu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4889
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> Introduce the interface file "mbm_assign_mode" to list monitor modes

Using "resctrl file" instead of "interface file" should help to make it
clear what this patch does.

> supported.
> 
> The "mbm_cntr_assign" mode provides the option to assign a counter to
> an RMID, event pair and monitor the bandwidth as long as it is assigned.
> 
> On AMD systems "mbm_cntr_assign" mode is backed by the ABMC (Assignable
> Bandwidth Monitoring Counters) hardware feature and is enabled by default.
> 
> The "default" mode is the existing monitoring mode that works without the
> explicit counter assignment, instead relying on dynamic counter assignment
> by hardware that may result in hardware not dedicating a counter resulting
> in monitoring data reads returning "Unavailable".
> 
> Provide an interface to display the monitor mode on the system.
> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> [mbm_cntr_assign]
> default
> 
> Added an IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check to handle Arm64

(needs imperative)

> platforms. On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined, whereas on
> Arm64, it is. As a result, for MPAM, the file would be either:

CONFIG_RESCTRL_ASSIGN_FIXED does not yet exist anywhere so this motivation needs
to provide stronger support for why it is used before it exists. There is a precedent
here with RESCTRL_RMID_DEPENDS_ON_CLOSID already used while it does not yet
appear in a Kconfig file. I would propose that this is motivated by noting
how it is already understood how Arm supports assignable counters this was recommended
by James to prepare for that work. Since this is user interface this
work is done early to ensure user interface is compatible with that upcoming
support. Also set folks at ease that IS_ENABLED() works as expected with a
non-existing config.


> [default]
> or
> [mbm_cntr_assign]
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v12: Minor text update in change log and user documentation.
>      Added the check CONFIG_RESCTRL_ASSIGN_FIXED to take care of arm platforms.
>      This will be defined only in arm and not in x86.
> 
> v11: Renamed rdtgroup_mbm_assign_mode_show() to resctrl_mbm_assign_mode_show().
>      Removed few texts in resctrl.rst about AMD specific information.
>      Updated few texts.
> 
> v10: Added few more text to user documentation clarify on the default mode.
> 
> v9: Updated user documentation based on comments.
> 
> v8: Commit message update.
> 
> v7: Updated the descriptions/commit log in resctrl.rst to generic text.
>     Thanks to James and Reinette.
>     Rename mbm_mode to mbm_assign_mode.
>     Introduced mutex lock in rdtgroup_mbm_mode_show().
> 
> v6: Added documentation for mbm_cntr_assign and legacy mode.
>     Moved mbm_mode fflags initialization to static initialization.
> 
> v5: Changed interface name to mbm_mode.
>     It will be always available even if ABMC feature is not supported.
>     Added description in resctrl.rst about ABMC mode.
>     Fixed display abmc and legacy consistantly.
> 
> v4: Fixed the checks for legacy and abmc mode. Default it ABMC.
> 
> v3: New patch to display ABMC capability.
> 
> ???END
> ---
>  Documentation/arch/x86/resctrl.rst     | 27 +++++++++++++++++++
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 37 ++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index fb90f08e564e..bb96b44019fe 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -257,6 +257,33 @@ with the following files:
>  	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>  	    0=0x30;1=0x30;3=0x15;4=0x15
>  
> +"mbm_assign_mode":
> +	Reports the list of monitoring modes supported. The enclosed brackets
> +	indicate which mode is enabled.
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +	  [mbm_cntr_assign]
> +	  default
> +
> +	"mbm_cntr_assign":
> +
> +	In mbm_cntr_assign mode, a monitoring event can only accumulate data
> +	while it is backed by a hardware counter. The user-space is able to
> +	specify which of the events in CTRL_MON or MON groups should have a
> +	counter assigned using the "mbm_assign_control" file. The number of

"mbm_assign_control" no longer exist.

> +	counters available is described in the "num_mbm_cntrs" file. Changing
> +	the mode may cause all counters on the resource to reset.
> +
> +	"default":
> +
> +	In default mode, resctrl assumes there is a hardware counter for each
> +	event within every CTRL_MON and MON group. On AMD platforms, it is
> +	recommended to use the mbm_cntr_assign mode, if supported, to prevent
> +	the hardware from resetting counters between reads. This can result in

"from resetting counters" -> "from re-allocating counters"?

> +	misleading values or display "Unavailable" if no counter is assigned
> +	to the event.
> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 17de38e26f94..626be6becca7 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -882,6 +882,36 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
> +					struct seq_file *s, void *v)
> +{
> +	struct rdt_resource *r = of->kn->parent->priv;
> +	bool enabled;
> +
> +	mutex_lock(&rdtgroup_mutex);
> +	enabled = resctrl_arch_mbm_cntr_assign_enabled(r);
> +
> +	if (r->mon.mbm_cntr_assignable) {
> +		if (enabled)
> +			seq_puts(s, "[mbm_cntr_assign]\n");
> +		else
> +			seq_puts(s, "[default]\n");
> +
> +		if (!IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED)) {
> +			if (enabled)
> +				seq_puts(s, "default\n");
> +			else
> +				seq_puts(s, "mbm_cntr_assign\n");
> +		}
> +	} else {
> +		seq_puts(s, "[default]\n");
> +	}
> +
> +	mutex_unlock(&rdtgroup_mutex);
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_PROC_CPU_RESCTRL
>  
>  /*
> @@ -1908,6 +1938,13 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= mbm_local_bytes_config_show,
>  		.write		= mbm_local_bytes_config_write,
>  	},
> +	{
> +		.name		= "mbm_assign_mode",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= resctrl_mbm_assign_mode_show,
> +		.fflags		= RFTYPE_MON_INFO,

Needs a RFTYPE_RES_CACHE?

> +	},
>  	{
>  		.name		= "cpus",
>  		.mode		= 0644,

Reinette
