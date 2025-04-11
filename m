Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52845270ED8;
	Fri, 11 Apr 2025 21:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744407905; cv=fail; b=hXVut+te4QHUfWLuK6J/A/u2UqUR5Ru3+MnE1VmUx1wh15Ehg1i+f1rvW6zeP8/Kvs6wwYcQsyMQXRFAZ0VcZ4vHZZKZLouu9sO+V6BBNQcMRCRiXRfDsLe/drgbwP1InXrWxwFlE6QHduy/YiAdGlUQSNwyVC/OBiYTin9/qz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744407905; c=relaxed/simple;
	bh=ll28qyVkwaOvLxPwVcSTPo/pw8DCTbjjQflngvkORQs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DJdvegTHa4yO4VSFe5wkfR8LSoJ1cpWElAZzrG31ATOSS6ei2qQvhgEeyuFMeP3aoLbFT65voIcCSWr/GEVy8tyWoxv1xErjmb74kTzKmI+MReXTppTc2qaXSfz+JlwAt2b9xpUhQQmcT8+XSAfLQAIgsSisrVycCgd9RR84wzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORxigUX7; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORxigUX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744407903; x=1775943903;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ll28qyVkwaOvLxPwVcSTPo/pw8DCTbjjQflngvkORQs=;
  b=ORxigUX7X9/YxXDdBXAzbUYG0o5cROJ4jgtS0tWhJrx1otlUCLnSvmeO
   ag47AkrjPc592x18vbzqKys+cvHwHEPAS0aBWporsyv6e/RjwIcn85euO
   tiDacvL5pTpyGKNJoOsAS+MZ1D4Vg4w3cwk7ioA44+oLibug+7QJwKMRS
   BzjD5NHrh2DAOt9uoF5s/lM4aXgTMpO4s2esVrCSe3C8oOnhY4Mb40M+k
   QKe/t58+PqsSGmSWGxpAdBZsUnDEWDjhAJbWCiEU7CXQZWZusrxy4XsIh
   Jm9z2rMp6ZMR373n4I3gAndY1htepVmlHI+caAKwkVJI816Blxv6Pcf2p
   A==;
X-CSE-ConnectionGUID: I47PMvnLRUK07yAEB5dKOA==
X-CSE-MsgGUID: aFR31JCbT1OdKUI3v9mQSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45873375"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="45873375"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:45:02 -0700
X-CSE-ConnectionGUID: mKICuNEaQqWmNtbv2Ch0Iw==
X-CSE-MsgGUID: uq/fqCNARJaENGMeNElbnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129279877"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:45:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 14:45:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 14:45:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 14:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVBHmmQvgvpgdpSNTopC1HZoOOqnETh6mte6r8ICbk+3zTl+ZFR2OFPrp4+uvZkfgslO9oo2dbq5+iaJ77ymLiKAYZkUmwvcOjlAPOvNgwKkuryBkOMc6K1mxuZjncrCQQlmuoQtwXM3jzdPIDZuR9bieHvhG3a21JFjWIzgdWm1NoB9+P8hzrO/dLJ2LZUWzcrF4M6mBszHWrsThiQ4mkpe7Ehes4/HLLkbOM31ev85t/BvWktRn3qh2/19h+x6BylXZAtVljl0aFxSiuA7EosT1RAI20O4SsCQBUhBWtaQCwolUSUKI4Z7QU9BrvJ9LZMgtXl6Im2YvqqljS3h3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p99Rd74IYo887JxwRosBaWlZCiTL1pG2zseAzv1c0S4=;
 b=Fn1Af2p1UfiYJk/6Trt8Wr68ca5QyHeDcn1UxlOo/X9Zmotd6AbXsjy/2qs+dJDOcNkna9MIiZNlEhgiRxmG9gME+w2qNNTh6hT0iRolGiPLoQmsqZPmdXTJWK/PaQYthYNk4etTnnu4vckePPNafluOHYggf83pENSR6I7TmlKzb81xLamB1HzqJPaV94rkQYnHZxMkEkelR56FX2AuEyNio+QURVZCjwxUlTZx347kOS0ce1jEsOTYZ9S0bQiVC8bXz7mSMgpEnlNscqbzVIWF257UNvIr++U/ONd+9HUFYJ5fMf0Cxu0vlvUm7cB3/ZVJ+rrO0lgmu8brYeXJlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.37; Fri, 11 Apr
 2025 21:44:23 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 21:44:23 +0000
Message-ID: <8c3aa9cd-335e-415d-a9d3-35593fdbe812@intel.com>
Date: Fri, 11 Apr 2025 14:44:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 18/26] x86/resctrl: Add default MBM event
 configurations for mbm_cntr_assign mode
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
 <03cfb41a0b2538cb994fa0c5b0950b7280cf2eb7.1743725907.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <03cfb41a0b2538cb994fa0c5b0950b7280cf2eb7.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:303:b6::18) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a3ccf1-13c1-4fcf-c78c-08dd794205d3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG9UdXo5RjdsMEdZemdqdG9SdkRBM0pzbVhiNHZXZjBsc0FpbTNoUnJKZU9r?=
 =?utf-8?B?Vi9BamwwOERTd1d1SWxURnBiQXNqWjFZZTNZNkJSOUlib0huaWloYVFaQnpL?=
 =?utf-8?B?bi9tdFUxbVJwaUs3NFJuSmtWSGJhRzZyN0RsOXhjeUtOV3VscHFVMEU0VWdX?=
 =?utf-8?B?VFRuUWREV1ZxcnJFMHZ3UURMM0grRldqcEFKR2pXMDlxOGlFZ3cwMUFRc2U5?=
 =?utf-8?B?aGgrb3d6K3BKNE80dG5sU0RTcU81elJtNlo1MFVoS0NiM2p5ZUJ5STJKY0Nx?=
 =?utf-8?B?UUF5WmI5VWRUZnk4bldCRUVVYXVmNElnM0hBczk3dWRyL0tIQ1RKNG9ndS9p?=
 =?utf-8?B?bzdCV0FjNDU5MEUxMkRBNFEzZHpmYXVWNzBWNnlMNGx4d2k1Y2psR3RLSXl3?=
 =?utf-8?B?OTRyUlhGNGVETlZsZUd1b1FoRUhBZUNvRi9QSFhPVnRjOGxvT0l4Mi9tSVpK?=
 =?utf-8?B?SXBCeFZjbWxtL0wvYjFsQTR6YnBFZXBhYTNadkRJQjhvSjhGcWJsWDZjVlBk?=
 =?utf-8?B?TlV3TmhiSU5RNEI3UkFuYm02OEtmOWlDejJGcGRCcU9RNzBiM3dIVTRobzBn?=
 =?utf-8?B?UG8vU25OdThKd1p0RVJURDFjd2F2L1FSOWtYc21vZGZ6YjVJMlB2V0VaTTh4?=
 =?utf-8?B?KzdSbXByRXhZbWJybXkraERDQ3dkMTV2MTA1WHV6UnJ6M2cxVCtaMGZ4d1NH?=
 =?utf-8?B?ZDBwN2N4NlFIVXJSOVlDaythZXNMblpNZ2EvWVZjNGh6TFo0eUtUSmJiOTRm?=
 =?utf-8?B?NVFqbDlmb3ZtQUJRRjRCcVFibnV1M1I5Y3dkOVNSaG4yNnBJSzB4NnRWVzFn?=
 =?utf-8?B?YjdxN1hqQWtSKzJRT09EVk5mQ3NuK1l6eml6cm1sK0JiQjk4ZU1qdVhBZ0hs?=
 =?utf-8?B?dGlOYmFCWW9vcjB4VTNsWGVwNVNRNUlxR2dlQXhHQ3FpekwyZ2xXZ3ZER095?=
 =?utf-8?B?SzBucFZBd3QvWGdMWWlJSDBJcHB4ZVNhUnd0T2Zac0lCOWI4cXkzQlhyYXhG?=
 =?utf-8?B?dGh2TDkxVkFMSG11Q1JGY0I0d0hIYUJaRDhoeGNrMnJPQzIyMVJMcUtEa2hz?=
 =?utf-8?B?alNOeUNiVStUU2NteFo0a2RRYzZhSFJTWnhsOHNXZDR1TnVHUTlYOFMyLytn?=
 =?utf-8?B?cU5RZ3g3c0N3UDA0czgrRFJKdlpYdnRLbkxFS2VOYzB4TWJIc2ZHME16UWFl?=
 =?utf-8?B?eVJ2ZUxIVTQ4WlFTQXJKMzcxeXQyZ0trbnM1djNUM1F0L1VmQm1kc2U2ZTha?=
 =?utf-8?B?alNxYTdDVkEzd2tWbGJQa0NhTGJ5VDNjelNlTERDc3QyaEk2T0JrU0V3UHpx?=
 =?utf-8?B?dHhPRXJ1bVE5ZW12RHloQWRDcHh0Y3oyMFdHNjRINUxDWDhEUHNyeWJqQkZK?=
 =?utf-8?B?MHI2OWlhaUpPOGE2bHk5WVI5dXlRcE5mUDV5dE9PbXVHM01STVJOZGovMG1P?=
 =?utf-8?B?VEJ3Z202OUdiNE5TWGFGRWdrdmdZRjdPR3dzemdwcHRzNlF5NnBMN1kvN3F3?=
 =?utf-8?B?WnNjaVFGMEtodk9sWndxRjBZUWN3RVFtRk41THpaUEtuaGQ5TTNYb1Q1Y1R3?=
 =?utf-8?B?b2dveDZiSThINXk0N1M5YWMzaXNqenZ5Umo3Y1I5STA3V2kwL1c5YmNmRy81?=
 =?utf-8?B?ZlBhL2lDS2JpbGJ1ai82TXU0NDl0UmwrcTRRaDFpSFFlNzJtU2FYcldvVnVh?=
 =?utf-8?B?QUN2NnBUR1JraEJWb0VwSTIwbHRjaFpaRHlhMVdwRlpQMysyTm53SWpqbk1r?=
 =?utf-8?B?azRjdkNFR3RhR3hXN2VNUUhibmNjdWtzazlwbTRZU2ZYUy9TZGJPUHNzU0dU?=
 =?utf-8?B?Lzg5RklOcSttNlRYakZ6Um55cUpLU3ZrWW5SQ3Q0dkFkQ2UzclUxcTgwMHhU?=
 =?utf-8?B?aGczK291NTIzYm1kZzc5Mm5CMkdBbkM2S2FpUW9iOVBhUE4xQUoyYWQ5U2ZE?=
 =?utf-8?Q?5edU62bbors=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmRoY3lGT1NhSzVWaHlHR040aUhPeFRveUJkZ081OXRJREdwdExtbmJxMkZy?=
 =?utf-8?B?bkZWaUZ5dkZZMGpNN2JsVmxmd0hUbytHWXpwRWQvcWEveWhMd1Z0VSs4ZmlW?=
 =?utf-8?B?UlFQTHVGODhPSkZnTFMvSmJoR1I0TDdaanhWVEtQQkxmdDZCKzJIem9ldFJU?=
 =?utf-8?B?Q3NWc3VwckJPTThSL2U5STlibDZXemNCK1V4a3hPZzVZUWFPUmpKTE12blR1?=
 =?utf-8?B?NnFzQ0Rqall2TWlpNHZUSVNOS2V0bDY2M3FydFFnNGw4WDAxbWd1dzNnSjJQ?=
 =?utf-8?B?ODhHdnduaDNEcm12a1NBckZEYlp5UzJpd0NNcUZCekpReGtZOHhUcGg3VVpv?=
 =?utf-8?B?M2ZDZWVHYkNTTnhqNXFSeDBOMFRmSGNBc0dNMHBvT1BoOE9lY2VSRnVKWkM5?=
 =?utf-8?B?eTBzL084WUxiR0Nsc25xSUE2MGFuUmpSeWhtczB6TDhLdmxqU1NJMUZJdEcx?=
 =?utf-8?B?cmhrNUZ2M2srZ3JuejdOWjdIZ1pwVmxjTE9oSmlYT1RSZWdVVTFoRFoxZ1Ux?=
 =?utf-8?B?Z1JSclcrSERMajRWWWNlaUk3eGM5Q1RmNERUUWNtaTBadTkvMFNoV0pPQkox?=
 =?utf-8?B?cjZDOThQSzM1SEZqU2pMQjRieExaTUZtL3EraVRhMlNmalZ3cTBVeVdlTnN6?=
 =?utf-8?B?MDlMNEJYb09GYUZsekNLS2ZVMnNoOCs0WHhlVy9xMWU0Z2VHRGtzeCtxVzV2?=
 =?utf-8?B?dHBLK0MzaDBMMGJiczZvanR1RkdTK29PdGFuUGZ1dHVBNVROWVYxSDBERStL?=
 =?utf-8?B?bHdWTWdLTHowZ2FWMEkzMXFBN1R3M0U0V3NaVDEwS0IzNy9UUHVxRlFUVy9m?=
 =?utf-8?B?ZHlPWDZNcTdROUR0MjZyaURUYmpBUHlnZ2hkVmxkbjJGcWFFZUNxcnRXZWgy?=
 =?utf-8?B?SHZOQ0FnRVZ4ekg3S1hmNUhuNktLY1NmWS9SWEVKZmszbmppZlNnUEYyR2R2?=
 =?utf-8?B?T1I0UXJYajFCd2I2TGVjaVRqNWxidjdRNDBhdW5wczF0TjRveVQ1bjBjYTRu?=
 =?utf-8?B?aVJ5aXNVMXJielZkdjdFWTNtQW0rWTBaTGNCYXc4RzhCZXduQkdNTHE3Qlp2?=
 =?utf-8?B?T1lsRUo2VFdaZzAzeTBHVG12NEJBc3daMEJ2d1ZaWElqNmdVSklSSi9OVXlK?=
 =?utf-8?B?QkRWY1JkamZwQXArRkhURkFnbDI4aUVja0l5ZkM4c0czWHJrcGVMSUdXS2pL?=
 =?utf-8?B?NkdTcmg0VXFNYXQ5ZlprSG1yRnhqZGNDNkxmbjF0cjhzK0hUaVhkUHE0ZWM3?=
 =?utf-8?B?Vyt2MFFaNitxOUlRbk15RmVHWHZIcG04NVpyMWdCeFBqT2lpc0t6VWlkYUgr?=
 =?utf-8?B?QUNHOUg2ZkJSY2t5Ymo5dVZ5dWc1WEVFSVBrb2Fibm1LK0dwMjg1eEpmUHlB?=
 =?utf-8?B?WTVYMm81Rm4wOFptaTdoZHR5ZVd0cGthek1xUUFvYmp3S3FxQlpQd0VRNXpT?=
 =?utf-8?B?bHFVWTdrbUxUZ09RQ1l4MzBlenl1MkdGd01vYUcyOFRQNUt3UlN5am55ZldO?=
 =?utf-8?B?bTRrVldaTGI0WS9laFdBUFhac2pJQXNSRG1PekRORmg5NnhQZDB2OEJhaHdP?=
 =?utf-8?B?OW13WXZ4Wktpajd0SllZQ2g4Y1AyQXIrdGdqR2poZFUzVE9IRFQ3T3lvZjNB?=
 =?utf-8?B?N1F6NDM5dlVhM05sQ0RKUURUQncwdDNRaEkyQ0cySVZ0cCt1OW1DVTZxMUV4?=
 =?utf-8?B?UGxYN3NEZlQ3cW00aTRHOVVhYlVPT0tzS01TMWl3OGxKNnRvd014aC9ZeWFy?=
 =?utf-8?B?QVZyT0E1TzlBU3pWcWlueTlXdU5VT0pMeGRkVTRweE5nWG85RnJlQjcwT0tG?=
 =?utf-8?B?eXhvYWtUL3BPWGFPbVRRUUpFdngxSWZsTk5SMjIzQXhqbmUvR3JlZ2lQenIx?=
 =?utf-8?B?Q1FoRHBGUHZ4UFMyTFFnRkJCUDh3Y2x5RXhJcjhwVUY3ZmpxTTZKejF0VkVm?=
 =?utf-8?B?QWNtZElMdk9kTkYzdjdsMTdQbnFrSGhyU2FJVGJLTGFNdmVBejhLbnVSNUkz?=
 =?utf-8?B?dnhzdUNvbmpZVDhzaXBLaEVHeFFsYW5EMkYrclNyNWJ1SjdlTFV1bjBlK0hR?=
 =?utf-8?B?UUdRVnhISHp6a1lyenJxbXgwV0hYZThnWFJNWWxQWWxsdU54NFdXSUFMSFMy?=
 =?utf-8?B?MG8vRnVwalNxV2FWWCtyNWJtMFhDcjZaaVl4UWRseVZXb0RWMTBFZmlQaFZ3?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a3ccf1-13c1-4fcf-c78c-08dd794205d3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:44:23.0620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mF1GauDFCtx325wjnYwSiOE6UdVjZNvxHi1DwjdJ+1L35cUWjDTGKbPGkPMD/a1JLl2QvQ1yiTY1hyj6Md1V+lWQgTUHbkFK4UVK90VzWtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> By default, each resctrl group supports two MBM events: mbm_total_bytes
> and mbm_local_bytes. To maintain the same level of support, two default
> MBM configurations are added. These configurations will initially be used
> to set up the counters upon mounting, while users will have the option to
> modify them as needed.

This jumps in quite fast by stating that MBM configurations are added but
there is no definition of what an MBM configuration is.

> 
> Event configuration values:
> ========================================================
>  Bits    Mnemonics       Description
> ====   ========================================================
>  6       VictimBW        Dirty Victims from all types of memory
>  5       RmtSlowFill     Reads to slow memory in the non-local NUMA domain
>  4       LclSlowFill     Reads to slow memory in the local NUMA domain
>  3       RmtNTWr         Non-temporal writes to non-local NUMA domain
>  2       LclNTWr         Non-temporal writes to local NUMA domain
>  1       mtFill          Reads to memory in the non-local NUMA domain
>  0       LclFill         Reads to memory in the local NUMA domain
> ====    ========================================================

What is the purpose of the mnemonics?

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v12: New patch to support event configurations via new counter_configs
>      method.
> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 15 +++++++++++++++
>  include/linux/resctrl_types.h          | 17 +++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index d84f47db4e43..aba23e2096db 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -57,6 +57,21 @@ static struct kernfs_node *kn_mongrp;
>  /* Kernel fs node for "mon_data" directory under root */
>  static struct kernfs_node *kn_mondata;
>  
> +struct mbm_evt_value mbm_evt_values[NUM_MBM_EVT_VALUES] = {
> +	{"local_reads", 0x1},
> +	{"remote_reads", 0x2},
> +	{"local_non_temporal_writes", 0x4},
> +	{"remote_non_temporal_writes", 0x8},
> +	{"local_reads_slow_memory", 0x10},
> +	{"remote_reads_slow_memory", 0x20},
> +	{"dirty_victim_writes_all", 0x40},
> +};
> +
> +struct mbm_assign_config mbm_assign_configs[NUM_MBM_ASSIGN_CONFIGS] = {
> +	{"mbm_total_bytes", QOS_L3_MBM_TOTAL_EVENT_ID, 0x7f},
> +	{"mbm_local_bytes", QOS_L3_MBM_LOCAL_EVENT_ID, 0x15},
> +};
> +
>  /*
>   * Used to store the max resource name width to display the schemata names in
>   * a tabular format.
> diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
> index f26450b3326b..3d98c7bdb459 100644
> --- a/include/linux/resctrl_types.h
> +++ b/include/linux/resctrl_types.h

Please read changelog of f16adbaf9272 ("x86/resctrl: Move resctrl types to a separate header")
for a good explanation of what resctrl_types.h is used for.

> @@ -31,6 +31,9 @@
>  /* Max event bits supported */
>  #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
>  
> +#define NUM_MBM_EVT_VALUES		7
> +#define NUM_MBM_ASSIGN_CONFIGS		2

Please keep changes to internal header files unless required.

> +
>  enum resctrl_res_level {
>  	RDT_RESOURCE_L3,
>  	RDT_RESOURCE_L2,
> @@ -51,4 +54,18 @@ enum resctrl_event_id {
>  	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
>  };
>  
> +struct mbm_evt_value {
> +	char	evt_name[32];
> +	u32	evt_val;
> +};

I cannot see how this belongs in resctrl_types.h.

> +
> +/**
> + * struct mbm_assign_config - Configuration values

Please include a run of scripts/kernel-doc in your patch preparation steps.

The description "Configuration values" is incredibly vague.

> + */
> +struct mbm_assign_config {
> +	char			name[32];
> +	enum resctrl_event_id	evtid;
> +	u32			val;
> +};

Why is this new struct needed? It looks to me like a duplicate of struct
mon_evt with one member added. There is also already the evt_list as part
of a monitor resource that the array introduced here seems to duplicate.

Could the event configuration be made a member of struct mon_evt instead?
This exposes the need to integrate this better with BMEC support to make
clear how existing "configurable" member should used and/or expanded.

There seems more and more overlap with Tony's RMID work. Did you get a
chance to look at that?

> +
>  #endif /* __LINUX_RESCTRL_TYPES_H */

Reinette
