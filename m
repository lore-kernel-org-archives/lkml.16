Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0CC23A9AE;
	Fri, 11 Apr 2025 21:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744405319; cv=fail; b=OkowhLQnKn53lSG3/mlJGLmFzpsWjRkuqt3yMOTzQVgU/ze2VlczOPPT68SS6gMYif9AWkqcm7NgizsBsSkTw1IBlbgFKmkIr5EfWzSTQ+yq7PbEzwkgvrilYyIvnOhbSwdxHiv77fy4UG0TVhOIZYwzTmrniAW+uQqKQ2gwIXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744405319; c=relaxed/simple;
	bh=76M9k2BxsMNG/y46gUZhRUbRiY1xC0gyy8zF3UXZSj4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Kk0MPiOmD/Qzwv3QZi+RySyv4+Y12MPRwHFiurEWPBKxg7VjjMjQJ+nbirGJ4fxi0UuG4T0CB1bfzuO+wJfa5YzrIGNiI/ZaTKZAvf5VeLUyzmLBqE0sqiA2UHObpvRRjAAXNIU51fMFEvSBS/DIpAp7bCOrkM7fRMh58vtKb8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BA6tsWuE; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BA6tsWuE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744405317; x=1775941317;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=76M9k2BxsMNG/y46gUZhRUbRiY1xC0gyy8zF3UXZSj4=;
  b=BA6tsWuEg0Z5fGPW6DUMlgWoi27dWvSawo4XMFhcRKDvrMCY44lk4t+v
   Bm++gfAxPEavbxEIf/agUVIXszprhg+gaJ/Z44XNN/vgm9lrDUCfzuysc
   hepIv2ytb3g9QhjddQRgYaNKDECddz0TxQ+rEbLlO1JNxoHvKwe/282rE
   q+9KUH6Rt6Ifh76qkj8Y1T18MfkGYVfwAmVqr+qp6MsjHyCtN+aO8qMsc
   BuXaVTSRSyb2yXg7+2J7G4oy+rlRo8UzSG2LH/xG1B8OyxYlmIYWejnkI
   r6MfSrKv4JKUW2FyWtniqlw90OE1cw+yZL/ZCi9P7GKMHGCI/XjNSq+mr
   g==;
X-CSE-ConnectionGUID: 18Lgl0EKQI++ae1gkdV4Jg==
X-CSE-MsgGUID: /hgBsh3XQF2G4VzGC6zLeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46056841"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="46056841"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:01:55 -0700
X-CSE-ConnectionGUID: L+Gad58WTIibnpuTIi+Jbg==
X-CSE-MsgGUID: Zac4Yuq3TN+u9iAsofbQpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="166484395"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:01:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 14:01:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 14:01:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 14:01:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+RKyRjr7tNCsvhrJcdj6RIdbpF/vNZdR0I5xDo7me3FuUnp1Hzp0fa99ROG/z0hRzTfyrXaoYC0Mg4ioUQ310y6yO/dQ5eWg5I08eQmVXHGPGznl4BP/Abv82Sev+lAMe+UBsSuXjXuPxdA0p30IUTZFebq3MtZTVDQoXnvq+6S4PCa7jLeKsyCnoA6zA7men22p0NAmslY46zCZKZzneJUeeNZIe7yBoQqWfvit/FYSsUfaGzgYvZG4Tlx8bM1iIOAZRvAyfgnP4ZdMESOSl15BKocLm4i+iPtzs9ykZzWRdl3s77Jjs189blVh8QCM3uydVBRopUqSHYzBT/8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQmXjab9He8oyISuZ81tgOXHuU08OUo94z8AzsZHfnw=;
 b=OaMqOWzcB1ag6/7qJANvVU+GJsNfUQG+UuTFbqowcwfe7pL6bTtTY39Oh8TZFgtxG4rZMElyxzK9h5pRneaHkjuF7BG5mDCeW7YZCIXNpDPPCiZS634rFKP0oH1+zeizmOHOD1m2DjKyt2p1Lx3OSSuTVndHhIfDcQqFOPeuOBIE/YIVHWlFhshXX5WfMK/Ja+qs3KNWLPH9H3b5WsOrZfl07HhFkWd/lsFA4DQfnfd/Zz2OXyrSUkg7FJFFtxYATgKmlbqpmnbXxkWSlRqZHio4TKSyG2ZC3UkGaQw68O9A/zqCe5nmYUcin6Niw95k5WfMMuB3I8bWdkRrOmHrTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 21:01:33 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 21:01:33 +0000
Message-ID: <cb71665f-a732-4fd9-90cf-213f5609e872@intel.com>
Date: Fri, 11 Apr 2025 14:01:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 12/26] x86/resctrl: Add data structures and
 definitions for ABMC assignment
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
 <3a15e2e5d6c8a5e9ee65b3fae48ada7eafb77628.1743725907.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <3a15e2e5d6c8a5e9ee65b3fae48ada7eafb77628.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:303:b4::30) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|PH7PR11MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 531d6223-0f29-4c3b-a18f-08dd793c09e1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Umt5LzlNS3MzZ2JjYy9aQ2ptVy9mOTRvOEtON1BybzlwVzc4dnBqYVNhc1lK?=
 =?utf-8?B?QkZHTEhVWWlTUkRBWGdPR3FaVTIxODZueVM1ekJHcnZqODRXQ2QvZWVIVkQx?=
 =?utf-8?B?RmRLYW5COWFVWUVqQ2ZXajlkd0ZTZEpBMjlwNXJsTkMvNW9SS3NJT1V0Q2Fi?=
 =?utf-8?B?NkNvY1BSbzZyZzZrdGFBVVZPclhGWE9DV3JoRTdkeXhGQnpMR3ZqeE5IQk5q?=
 =?utf-8?B?OTk1R0hXZ2FBZG1Zd1ErbEx1QWl3RmMrTlhtZ29vZ2k2WGdYVXJoaVpNZjlr?=
 =?utf-8?B?clN1VmVDbEZQSTF1TzE2OUpxOGg0T3VHRUtKdDVkQmQ2TzBCQnlzemNkKzdZ?=
 =?utf-8?B?SUpwM3p0dGJUSlFLQzdTRVY1dWhSeTVvMHNYQktJdmVuM1JkN2dnTit1K1Vh?=
 =?utf-8?B?V0lKNGpFTTBGM05jcUJoaGhjQjl3V3gwWVF6NFU5MU9QSUVzL09leVZtODRu?=
 =?utf-8?B?NlVEYmlsRlQvbUJRNzc0MVovSGpnRUJSeFBVRTNvSVovUm9VWEorOTRBelZN?=
 =?utf-8?B?WnpZR0hEL2gydXBtVStMSG52bFRNWk0xOTdRSmtzVTRiS2NGNHFZd1Q1NmNi?=
 =?utf-8?B?QVRQWU90WFZGUWpEN3ZQUUN6UUVEUU16RVE2RjVpL3p6cWYvSTU3R3RxVjVK?=
 =?utf-8?B?RklVRjFTN0dpd0JQckREaFArYTZabi9uUjJjOTZiSm1KMUV1eFgxQkFpSUU1?=
 =?utf-8?B?TE1RcEN6ZWM1TkJrQzRyQ0JmdGxyemJiZ0VEazJaeG9PN1N4TDd0VWdRSkto?=
 =?utf-8?B?a2d4Vit6em5ZVTYwVHRVOExuUmxwWUpTc0JVWWdJSThaMlNCMFpNUzdQYjFQ?=
 =?utf-8?B?eDNQYmVzZXB3ZmMzQnZpTk9UcEU1L1BDZmxMcXFZV0NIWk1FdnNLWGhSKzJN?=
 =?utf-8?B?K2JCYXJzcTMvWm9oZzZrVmc5ai9JdCtFaDdSaFVQRFU1cllDOXpGQmRxM3FR?=
 =?utf-8?B?S3RsZkhSOEVDYmJaYTZSVlJPZTVxZ1FHcFdXL3hYT1h5ZWd6QmwwcmdyNlFJ?=
 =?utf-8?B?bjBxcEY5dENIZHNhR2FwSU9KTEhNOElkQ2FkS0Z4VTJ4TXhINUY0RmlKd3J3?=
 =?utf-8?B?ajJlQXplbDFSckFUck5janBObVl3SXJhVW9oMmo2eno5YmFtelF0ajNYN0Z0?=
 =?utf-8?B?NkZJWGpHTW1DckgydHpqSmNiVXB1RjlGTFlXOG5HNFQ4cDg1UmtIN0NPK0Nj?=
 =?utf-8?B?T2RTQlZaRElOVzhCUUZIMmIxdkhpdXhJaXJCbFBDVXRHc3RRM214VXl5UFpw?=
 =?utf-8?B?RzlGenJwRVRVS2lrdGhyYW5EMkxMTTAwdDVMS2NLeDM1bjlaa2lxb3pFMkFy?=
 =?utf-8?B?YUtaemMwOHNWRlBidmRYTjljOXFwdG9sVCtHd0RqRnFVaU55VkV0MEdvRzZR?=
 =?utf-8?B?YmR0N0xKSGZlUEtWMUp3WjZGaENOTm1PTDVmbm01VklhdnhLc3I5amh0TTBS?=
 =?utf-8?B?dzFGL3U5Ym1ITUFXOGFXZEoySFduOUlQOWJ0alczNENTR2VwSUlLdE1RRFdL?=
 =?utf-8?B?blVMRXdBL0s5eURjQWVJL1o2KzRaeTdkb0RWWlNZTU1ZZFkwTUEyT3FYSWZo?=
 =?utf-8?B?OERwcHh2R0xGdG83RllhbXYxajhtUkQxYmRDdUIwT2lVa2hCTTR4cUMxSkdH?=
 =?utf-8?B?R21hZ2pBYkR0MnJ4cGhVU01TaVlnMDUxQ3hwMUlwdm5XSXY5cGRDZWJ6NVY5?=
 =?utf-8?B?MG1kTGhKeE9RSWsxQnpzMWtzQ2s0UVRZVlVZQW56dVhGRThkV29zY1ZvNjdu?=
 =?utf-8?B?bzJUcG0weU4zNjRMUC9hNkV4dnd2dmlqUHY2VE0rZTNNN0tTdHZvZUdvL05J?=
 =?utf-8?B?aGdhNkZmL2R2ZVJVd1RzUyt3aHRBR1hBNGtxVExMVXllM0pRdzFMNVRFQnc3?=
 =?utf-8?B?T0JTWi9vbkkvbkVSdkwwZjJWcGtLVmNqcklSczhwY1h4enc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3NFQjk1SmYyaDdHQ28raUJuWHFPZ3kyRUhadytjMytTZDVyNUE4d2JOelNL?=
 =?utf-8?B?d3hubUl1eDJHNGpoZTBldjMvMkRtQ1lNSlpDYnZDMkJ6WENxaFkydGlEZlAy?=
 =?utf-8?B?TVdqRkhXQVpGRmtVU25vVmpoYlpocmh1K1FvcGt5K0JGdm93TCthUU4xclAz?=
 =?utf-8?B?dDF6VStGVHlmeHA1dVZiZjExYTN1aFlvZmdneUhyV1RMaHdENHBPWVd4NGU0?=
 =?utf-8?B?SzF6SkhNQkxITTBwWnk1T0J0NGFydUQ4MXdEWmxQbjFZZEpEdE9lUHZhT3A3?=
 =?utf-8?B?SFE4M3Q2UzlHVktyb1E2NFJ2bTlicWkyQTNqYmdDZ3AvZG13cmdMK01BYWdp?=
 =?utf-8?B?MGZhNlMwTktWcHgzaXRsRHNkc01DNTdoc2hncElkZ0prVnJXdDhaOXNQRWRE?=
 =?utf-8?B?N0JQSkdDUk4vL3BaZzJDS2lhajNlYUdaVlQ0VUtiZ1JZSXBEUGRxOW1LYmhR?=
 =?utf-8?B?RzFsRk13cVl5a2NKSkZPS3gxY01tWUhkY2VJNkRjVUpCcmhjZnRJVVVMYkM4?=
 =?utf-8?B?dHRxejhiKzlobVpLTHBxSkJ1clRqNW9ZN1RpdWRSOEVTWVBlRUxGUGNWc2Rv?=
 =?utf-8?B?aGN2aXcvVXEyMWZ4SzRha3Erb3hOck4waVNGOEVzK1A1OVJ1V1dMOGhxUk9w?=
 =?utf-8?B?OHkrd3RxVzhGMmpoQ1N1UEV1VUxTK21uZ3ptZituZlpjcm5CQU11b1ExZGNH?=
 =?utf-8?B?OWk0Q0Z0dzNqWk1CZzVWMmNSZm5HMEVoS1liMXA1QzhQTW0zN0ZYWGVZM2FO?=
 =?utf-8?B?Y0duUnNuRHd3TDYxNnAvOWJUcXI5VndTL2k4cTlEdDlRYmYxa0txVkZDSktu?=
 =?utf-8?B?dFM1ZEx6TlBEWDlROWtVRGd6cjRqaVpDanlVNEZvdEJsbVJDTi9RMHpzWmxJ?=
 =?utf-8?B?OTB0Z0lOb0k2c1QwREtUc0FPV1Rvc2VmUDgrTFBCdGpxNk1qc0FUSFhYYzhF?=
 =?utf-8?B?eWViSlhPaVNXN0hQUExXWERNeVdxN0t3T3RDSk9idWRMTWZkTDY2Q0hxb0Z4?=
 =?utf-8?B?N2ZVTWVPMDhtdzdmMmh3S0o4SXZWY1dVb1krTkUweC90ZFcyNEUxdGZlNEo0?=
 =?utf-8?B?ZGtHeEVJWFk5bzNLZUUxenZUZE5UdGdsWjRTYW5McDVtbjN0bWk5eURUOVFr?=
 =?utf-8?B?UXp3WUtmVkljTU1mY01MQmN4MExReUgwbGVVVllsMEk1WS8xcUJtRjQ4UHM1?=
 =?utf-8?B?Mzd6VmFHaVRFQ1ZyYjJPWUpWY3h3MU00S1lhY1pzd2hoNmxGU1BhM3NieHJD?=
 =?utf-8?B?UVdDSW83L2lhZlBVUDNObDdVMXJWTUVOWXdVUHpuTkhEaTFZWDBSMnJJYVh3?=
 =?utf-8?B?UHcvWUNnMTFac0JsRWpNVThISnZWd2F6NWExNkdkZ3VLVVVDeHlUcTA1K2RM?=
 =?utf-8?B?R3dwWnQrNlZDTGtKWkdFV2h1akUzUUtKVVkvZkQ0SkkxWUZDalFrczg0bnFJ?=
 =?utf-8?B?MWEvYkRZYnhNRkg3ZXpLcElHTG5CRjY2aDZULzA3OWdkSkZoTjdhaHRJRk4x?=
 =?utf-8?B?TzliNG9TclprcUlCL3VmZkI0M2tSSTJrSS9GejA4bktRZW5KQlNwVlBDVCtn?=
 =?utf-8?B?KzFlNDNOeVcyUmh1aHVtRFdoczNjU1VYQ0djN2x3QlJ1UTVqazhrYTh0MG5r?=
 =?utf-8?B?Nlgrc092MEo0U3Z1NWF6Wmpjc1daVDBteWRlelVhSyt3WmlpcXRwSFFwMmxG?=
 =?utf-8?B?VS9vNWJTaWxDMlhVN0RiK29XTk9wcGF3ZzE5MlViZlJiN1crTnFnSkVDYWJP?=
 =?utf-8?B?YytielBQSHc5SG9pVTdLUHdWMDFqU0pCbFpaUjJKUjdBbXVCYWVkUnpROVlu?=
 =?utf-8?B?YTRpZWx3Z25hZVF0YUNyWTVUL01VREk0a2RadXlINGhIbWZBOGlGWDlEbDZR?=
 =?utf-8?B?MisrekN2eFBoVnFkRWNOcStnSnNqRGFzbit4QWJadGR0ZCt5VVBYNUIxV09N?=
 =?utf-8?B?OHlHOUJQTXFieE5rejlCMkZJMThKM29tYWt1dTBISVNiR2dCRnpodDFmSUl5?=
 =?utf-8?B?eTFYTXdlcnA5aE1IalpNSkVzcXNCSjdQTlY5NHA5cHE2VDVuclAxQXVCNnVZ?=
 =?utf-8?B?RUcyWlJjUkMrTnNMNHhUR1lRU09HVy95cWxMNUZjN3pvOWIzSFV6VkZBaE5O?=
 =?utf-8?B?akJuTUU0SzJ0cUFxMWZPaDVualh1Y2c5S0F4OVZ2RXoxRzdQU3dRZkQ2L3Zo?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 531d6223-0f29-4c3b-a18f-08dd793c09e1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:01:33.0186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZl+ouOODeSj+lglAsJbBrxf2JDxaaYO5GmAFU23QBUtlXyASqfY9q8SUFsNUH51wsWMiaCG/L2efPQ+7+sGONXuPXokSNxJuWrjjT0m2aA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> The ABMC feature provides an option to the user to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as the
> counter is assigned. The bandwidth events will be tracked by the hardware
> until the user changes the configuration. Each resctrl group can configure
> maximum two counters, one for total event and one for local event.
> 
> The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
> Configuration is done by setting the counter id, bandwidth source (RMID)
> and bandwidth configuration supported by BMEC (Bandwidth Monitoring Event
> Configuration).

Apart from the BMEC optimization in patch #1 and patch #2 this is the
first and only mention of BMEC dependency I see in this series while I do
not see implementation support for this. What am I missing?

Reinette
