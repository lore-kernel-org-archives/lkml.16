Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ADA1E8338;
	Fri, 13 Jun 2025 21:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749850877; cv=fail; b=WYrV5p4aPwB/WUfNCxLE3eV9Z6bhiJXsz/S8gCdfOsu8iSmodhZHMThWC+N84cl0+Ro1EzUwlm2kaGRvSNbvr/x2hbqvwC6TNcmDhX+dx0q9aZhPpzU03OzFoPekNcHeK1n/WPBo+5MGSEtGk4bwAxQ6a642Z6e66MEXonmo+X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749850877; c=relaxed/simple;
	bh=dMzJTN0LlwwnEStx8gW1bmTSz4giUz3twkwjavtqmAs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lG+zdIYfbS6PgfsOjEVvvgXCka5D3HYQsaEjiYhMSpxh9XzLo5cGuw5/fYppcgbHVqq5UF1Nk3kxKnXKYyvcyK8iJB/F71IxkWdkOFv/ukQaCLfs0oHu3wa4Fex2oUqKMP2zTsjrvvBToCHzEOeKH+ssugSNVy5Z7p2xSsZDnxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lg6o5UcB; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lg6o5UcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749850876; x=1781386876;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dMzJTN0LlwwnEStx8gW1bmTSz4giUz3twkwjavtqmAs=;
  b=Lg6o5UcB/LuAFIUtcB3J5I2V7w7PhbD1qLLyz87WSCXTe9q7MyGUOBjp
   93OYVvYAvaBNz7vgDPVgOlqfu9St/SBRLqyOWCzwxLxOafBxqkJUdlnO/
   6LkGyQ5eEiI2RaprdLkOM7brFrc/DPS22SdEwfXtaNejSB14Jn+iHPvt3
   KWOGuvFAsGMfakk10qvaz/phQqHRaf8XwMe9igdArXPa9FSMZoWDrbnXo
   6KwO7ZllrBJe8Pryb8yjRxdBX+hK+Cl7sdNPkzz1uR5xDoHr6KTS5EQ7D
   YGmkZC/q9NLmczpw4lnCVDLUNzufmQcPDhACLmJCmJXp0YO67vYEM+CXS
   w==;
X-CSE-ConnectionGUID: lcK3VegcQf+bpYj3vtRcbQ==
X-CSE-MsgGUID: AWXX5KtcQbSQxbZqpTuoLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69518647"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="69518647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 14:41:15 -0700
X-CSE-ConnectionGUID: qMKAw7LRR+2XTYN1ya6rvA==
X-CSE-MsgGUID: eX6ktp4YRAijTE/GpM1KuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="147815133"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 14:41:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 14:41:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 14:41:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.63)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 14:41:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEIs+kNoZXUYLejyMHmq6E1geGtugMZLAbhAabv27fahRXZe9hqJKyTKt+M6ZlRqLR6VSIGTOq5vhVNPA1Nkx6OiXhb+A+G4nNky0rFXjuAD/+GBPOAGEwaKYU+EsZoZ13uNjmfzizQoHITHAl4EaODwZ69N+7z/W1dmZ6MyHVXorgeLjjOrzuCIZtLaphMc0Ko6NTI53HliqtgPwFQV/XQcO7Ds+F3TbeKqEqC6TxXyfnwBN1gD9O1Fh6XkQVn871UJonq4+aKwOKEfXLan1jD8kEKEi0Ii9Os7KnCEkWvRDZSlBUVVtrIDEC/ohTlK9EAKXkt6Jt5VHrHVBJ4pCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMzJTN0LlwwnEStx8gW1bmTSz4giUz3twkwjavtqmAs=;
 b=EekFKeZMDjFuF3VCAwZXHnf3QEwqCTrMSgpIeXQlwsfRj3P2SPDw8+Li8lxzd9DfPWEnLPWWi3e+HfXp5aMtAhVB/NcYonGq6UPaXZIV1tSzOvXRCWdY5/mw+522nItqOldnmbKT1bKSzgTgpL6leWo0LUCYuF6b6yNyaYLa3S7diZI28fip4b3CcGOujvgcunw7vz3xnKTNXzzeZxRn3rykfySRNzMzxfKGrgpGPCs5v/5pJECySVu+DMNOtmk/l37Bfm0BxN9tOcgOC9STnij7R+vjPvdRAZlHbnC+0juZxryuw3N/SEyY4MegAFT30+SCCfbYvCy43zFRCiQAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 21:41:10 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 21:41:10 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Babu Moger <babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"Chatre, Reinette" <reinette.chatre@intel.com>, "Dave.Martin@arm.com"
	<Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "paulmck@kernel.org"
	<paulmck@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"ardb@kernel.org" <ardb@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "seanjc@google.com" <seanjc@google.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
	"manali.shukla@amd.com" <manali.shukla@amd.com>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "Huang, Kai" <kai.huang@intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "kan.liang@linux.intel.com"
	<kan.liang@linux.intel.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "Li, Xin3" <xin3.li@intel.com>,
	"gautham.shenoy@amd.com" <gautham.shenoy@amd.com>, "xin@zytor.com"
	<xin@zytor.com>, "Bae, Chang Seok" <chang.seok.bae@intel.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, "peternewman@google.com"
	<peternewman@google.com>, "Wieczor-Retman, Maciej"
	<maciej.wieczor-retman@intel.com>, "Eranian, Stephane" <eranian@google.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v14 00/32] fs,x86/resctrl: Support AMD Assignable
 Bandwidth Monitoring Counters (ABMC)
Thread-Topic: [PATCH v14 00/32] fs,x86/resctrl: Support AMD Assignable
 Bandwidth Monitoring Counters (ABMC)
Thread-Index: AQHb3KbxZg4IAXekYECyXyHnGpUxObQBna0Q
Date: Fri, 13 Jun 2025 21:41:09 +0000
Message-ID: <SJ1PR11MB6083DAFE4FD5A6D2712C088BFC77A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1749848714.git.babu.moger@amd.com>
In-Reply-To: <cover.1749848714.git.babu.moger@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SJ0PR11MB6573:EE_
x-ms-office365-filtering-correlation-id: b2ffdf9f-696a-451c-0c8d-08ddaac302dd
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TUNOVnl4V21MU3J6Vk9wRU9BMUFxeERHSWVxRDJnNHRQMlhET0JGcS9xZTlr?=
 =?utf-8?B?OUwrWTNKWWFpRG9iUjl6MVNvMlIxWXgzUS9BQ0Z0Y0NQOE8vSEFLYTJKeUl5?=
 =?utf-8?B?Lzlnb3pWdHlyQWl0MmxVcnFZTFJZRzllbnZKMFAxWTNDbis1MFIvNHkxUmR4?=
 =?utf-8?B?RUZhalh6S2xIb1ZhUWJiL25JZjFyRFB2T3JMT09VNjFFQ2FrbXRIRmROT3hs?=
 =?utf-8?B?UlVTWmwvUERvNWtRM3JhZ0d4Q0NjOVRheWtPZUlESDhtU0h2WndmaXVZS010?=
 =?utf-8?B?YTE0V2tmeWNWM3ZSU0txS2ZhQkNHV0F4V0U2aGZLVXdtOHdhOEMyK09TTTgv?=
 =?utf-8?B?U1ZxNXVITk8rbVZOd0Y4SXB6RGk5RGJscjN6U1hMeE42ZVA3WkJGUExEK0Vh?=
 =?utf-8?B?VmdYSE5VdzN6YU9zczlOTjAxU1dNRVhtQytiNG9KSkw2UldobG5TVWhSR0hZ?=
 =?utf-8?B?TFFHNmFoOVljN2hoSzZIVG9YRWpocm5KcXdMWlpTa0NMcXNWZ2dHbHpGaktj?=
 =?utf-8?B?ZG9XUHEzVHc5a2I5d3ZwQVQ5cHpLaTY0RDFCZFNYckJuTkpnZHAwd0puNk5K?=
 =?utf-8?B?VGRReDFXeVlCZE1HNklXdWkySUlFLzJKT2RKeGprenFLYm1YN29MTnFycnBq?=
 =?utf-8?B?ZDluVnVyaGd1MC85MDkwQzJ6MU42ZzBodnRwR0lHYkt3THJKTFN5T0owSXRa?=
 =?utf-8?B?OGFuLzlTUHVXYXdiN0xJRXNDb0lLYW0yL3h3anJDSUNyTm5ib2xQdHBOcVhz?=
 =?utf-8?B?RkpXclcza2piQnJKWEVVRWN4dFcxR05XV3QwUXhSU1ZZc3F6THNBZDlLa1I2?=
 =?utf-8?B?cWpQOFRqbllVa3pMcGFROEZnTWVNTStHOTViNGRqTGo3ckttU0p0bHNrSjg4?=
 =?utf-8?B?MTRlT2JCQ1cvVGV0Smg4akRnU0I0Q3JhZWZhbzBBc3hFTE1veE9PNkViVlQ4?=
 =?utf-8?B?S2RDZ2JKTHVYVjNCVXIzSmlpbkNzdTVKakdaKzlJYzkxZXlZMTJ3Nm9idjNM?=
 =?utf-8?B?T2xrQm1nRVplM2dUOHZhcnZPbkxqd2ZpTzNOMEQweE5nWmd2THZVV3VEZ2lX?=
 =?utf-8?B?SmdZUTA5bnJnd2RFQUg1QyttU3BIOFNLMnI2L3FDV1JSZThIWGJCTUZTb05U?=
 =?utf-8?B?aVhaVFZKWnlGVGx3NEhUZWl5c25kNzNpZWJnQmVjUlNDbmJYWW5YU1FwWGVq?=
 =?utf-8?B?V3BUMWo0SFg5YmlEZHVOWEJVbElEQjlFVC83b2RiNEx5ZmdjNzJvMU5lRno1?=
 =?utf-8?B?aFhhMkpIQ3c2WDJ1V2w3VUtpaDZ0WnhxbCtxNEpkOHpXSG1EUkdNME5vYlBJ?=
 =?utf-8?B?UExDUDBCR2UyTGlMcUdvUHZRT1R1cGFhaTNYdTN2UVBzK250d1o1cXRKeE1l?=
 =?utf-8?B?Ykg2OWRUNTZHbG9sN1BzVHZQMnJaUGdDUGthSmVqS21aaFJtUWc5NGVFVWtV?=
 =?utf-8?B?WnpBZzBRMGtvdjNWQ0F1UEN4Tmxsc3M3TFRQWGpGOXQvclg3Tkk4M3VyS0tp?=
 =?utf-8?B?S3orUlVwblYxNXpaV3VvUHl0MktVd3QxcURLNjYyYlIzNnlDcDZFdTV0VzJ4?=
 =?utf-8?B?YlRRSzV2a1pkZmhPOVRZaUc1MXN4a3NFUjRkeGtrYUlOSFRXZjlIMkgxZ2Vt?=
 =?utf-8?B?R1NMYkN3Z2kxdjhCYVQ1ZFZyaXpVUnM4ZldhcEllVjhzZXViY1dmWllNS29V?=
 =?utf-8?B?U0IrRzcvRDh2L0JMbVo0bFc2ZjZCTStxV3BZTUJFQ0s1V2pxMjR0RTNQVXBL?=
 =?utf-8?B?V2I1KzdsRmdPVzltUDk1VC9iSFZ2VHZGaDByNVZlbHVlTzJkREtRU1pnaTNH?=
 =?utf-8?B?UHFmR3hmbkdYUlhZajhpTVBpWXBHV2IvY0NJNE5vcEsxYmhEOG9UVUFoMFJp?=
 =?utf-8?B?SUxCTnpNdU81VDFZVEZRWkp4MEVOMHZ4bkJHQm51NmpTMFVoTUxaRnRoRmRm?=
 =?utf-8?B?UUQ0SFpVVmprWGd1WFBMcFF1YW5XUXVrMjFVNWdiK3NQc0xrMUlMeVdFLzhC?=
 =?utf-8?Q?c4E1IwuwFd57+zZlJFpy8L3Cw2Ua1I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHRiSVNqNEhDc0k1UjJWS0tKUEw4VjBjbU5yeGdnZVNrSmpWeXBJTCtCbDNU?=
 =?utf-8?B?QUVIazcvQXpRWGIxN1RNUlovRVpVcFEvZHBHVXpqemw1eXhtM3VVbHBtdU9Y?=
 =?utf-8?B?QzZxOHJnNkpPWUdOQ3dEL05obDhMcFJFemhQU2phMm5jWmllM2R1b1RISHph?=
 =?utf-8?B?SUphc2d0TXlWSGlDeThDS0trK1ZBNzZjV1k3NStvWWVDQkNtcUdzUDR0MHln?=
 =?utf-8?B?ODM2Vi9DTnUyOTRWaFNzYWRGaFpEUjBYMS9ocStybWZHVkJiZVFZQW8ycHNv?=
 =?utf-8?B?Mi92enFKN3crTW5xbDJ1U0F4ZmJ5WjFaaDdic2szSDZ6U0VTSHJrcDhyRXlx?=
 =?utf-8?B?dlZpQk9TeU5XK1hTQUhNVUtyVHJVN2ladnFydTBRODI5WmIrODc5V3U1MnAr?=
 =?utf-8?B?TXQwbWlLUjNOeE1RNWtGZXJtYXpFQ3dtTm9DRUdJanErdGRNVVNieGtMSmNM?=
 =?utf-8?B?bDZRNzRxU25MNlIvalVPK3JITGhDN3VpSDhocytsMEpMVGJuN0dHWTNaTEow?=
 =?utf-8?B?UXhCL0hRWEVOZWs1MmhXTG0raE1kbHZ3RURPZ2YrV0xWL3d5SjFqRHhCUHlJ?=
 =?utf-8?B?NFFQeFllUTcxVVIvT1k0QlVscGZwUmdPbmNoRGd2YnNGNVNvTU5MU1MyUzVs?=
 =?utf-8?B?ZDB2YlErVm5TOWZPVWZYd1VMOTJMb2VDSk51aTFBNUg1dTExaG13VnRXMG84?=
 =?utf-8?B?a0FEQ2tpbUVsOVl4TEJyWEl2eHVhekM1VmFINms3M0wyOE9od1d4S01aeSt5?=
 =?utf-8?B?TTR5UUtkUE5TZVdiczFJNWtzK1FFU3krK2dMSlRtL3ZSMVlpTzVhM2JvSndT?=
 =?utf-8?B?OHhUVU5ROWRyQmFFSDg4anNCaDUvcHNEOUNvdTdaV2prQk1iYzVkZlp2ZC9O?=
 =?utf-8?B?NVlxYXlXYzAya2JVNUJrUnNCUlpUU1docDFxYWIxUG5kREdTL0t0VDhQNHBv?=
 =?utf-8?B?UTJTejF2Y04rMWo0bGNkRW5sM080aEhFK1dSOFhvSmVUVGJEWitRTlF6QVNt?=
 =?utf-8?B?ZTVxeFNMOVhBYnozbXBaQ2xhNHpSNlNoTWNYeFV2K0FTYUtCemFwNUk3Ly9S?=
 =?utf-8?B?cUg4NHMrd250a2t0TnF4M0pYN2gwOGp4NlkxWjhNUEJvOGlNQXh6K0FBVE9P?=
 =?utf-8?B?SENHVXhJaXplSkpkbWxUalhKTFBhWnBjd1FNbWNRZjRJSEtkR1drL0xsT0N4?=
 =?utf-8?B?QUhuaE1iTmRjQUVLemd3dzlIZUFQeVZLeTNOZ0EzRVM0RlllM1BjM0tpZFJ3?=
 =?utf-8?B?WDBKenY1SzZYZVV2bVc2dzBVa2duZnExMWZ1cWd3R0ZDQTFXOGRnSk1pNW5H?=
 =?utf-8?B?VFFCcmdkcmNhaG9odkdaOGFMVEdiOUxQd20zaldSQkl3ZC8xaTQ2WFd2a3pa?=
 =?utf-8?B?VUxONEFUT1ozRS9BWC9ZeUZlSWFKczhGcEwrN05wSXJKa3o2K083bmNYSUxJ?=
 =?utf-8?B?bUZmY09UYlNzMWFLcTc2RnhaanZrTE9yN05tTVE2cmJlbTNENVVtNG9WWTJQ?=
 =?utf-8?B?cWhKSHRSTS9NQld3eUhJOTlueUpVS3M0eHdOWFRLdkFRTk51L29vL3V6NW1u?=
 =?utf-8?B?S0Y2Q0U3dk1zbXhFTEpWdU1UQ1pBWS9OSDRFbXhaeUZDZjdrQlpiZW1ZZmVo?=
 =?utf-8?B?UHFZSzlORkM0Z01oSzdsb2hmQ2Y0Z3Fwc1JyR2VQSndjZytReG1MUllHaE5a?=
 =?utf-8?B?R2QybXV0MUt5MnR0T1BQZWFmcnNrMG9mdFBDSCtPaWZmM3kxNjd6M2RnclN5?=
 =?utf-8?B?RHVjLzZ4RVZBU1dYMytSOUNPWENsNTU1bURHcS9yRlRqbUVxOWtjNnRuWmVG?=
 =?utf-8?B?c1ZJZjVqUEV6c1d0ZnpzOHVubDdRbjl3ZGhkcjJvM01ZcDlhcmwwV2QrMDRR?=
 =?utf-8?B?amRmR1V3d1gxZiswTFBUbGo5RG5GMDhPMzIyRVp2QXN5MUY3ZTlZNjU0RmRJ?=
 =?utf-8?B?OEI4cThtUVRzM1JFaE40cFYrdzduVm5Od3B4dXVsaWdISW1PcGFzZnVHOHBC?=
 =?utf-8?B?L2pxUG44akU5bUVqK1I3VS92TGdJTjdpbFFmb1hBZVZ1UnhSejg0dm55MVAz?=
 =?utf-8?B?VHN3TTQ2MHltT1F6V2QyUVQzMW5pQlR1enU2d2pMdmhnTkRiYi9PYVFsR0hV?=
 =?utf-8?Q?PUQbHJU/6zqpw81yI/tinuW14?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ffdf9f-696a-451c-0c8d-08ddaac302dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 21:41:09.9632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9nFaiz3rIbVlTy9HjN7/GQHjVDTpOJYang+8h89eE0ZxtvDUh7KHdo2JPN825OSHW6vUea09K714faJNhZP+jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
X-OriginatorOrg: intel.com

QmFidSwNCg0KQ29tcGlsaW5nIHdpdGggIm1ha2UgVz0xIiB5b3UgaGF2ZSBzZXZlcmFsIGtlcm5l
bGRvYyBjb21tZW50cyBvbiBuZXcgZnVuY3Rpb25zDQp0aGF0IGRvIG5vdCBkZXNjcmliZSB0aGVp
ciBwYXJhbWV0ZXJzLg0KDQpFLmcuDQoNCi8qKg0KICogcmVzY3RybF9jb25maWdfY250cigpIC0g
Q29uZmlndXJlIHRoZSBjb3VudGVyIElEIGZvciB0aGUgZXZlbnQsIFJNSUQgcGFpciBpbg0KICog
dGhlIGRvbWFpbi4NCiAqDQogKiBBc3NpZ24gdGhlIGNvdW50ZXIgaWYgQGFzc2lnbiBpcyB0cnVl
IGVsc2UgdW5hc3NpZ24gdGhlIGNvdW50ZXIuIFJlc2V0IHRoZQ0KICogYXNzb2NpYXRlZCBub24t
YXJjaGl0ZWN0dXJhbCBzdGF0ZS4NCiAqLw0Kc3RhdGljIHZvaWQgcmVzY3RybF9jb25maWdfY250
cihzdHJ1Y3QgcmR0X3Jlc291cmNlICpyLCBzdHJ1Y3QgcmR0X21vbl9kb21haW4gKmQsDQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gcmVzY3RybF9ldmVudF9pZCBldnRpZCwg
dTMyIHJtaWQsIHUzMiBjbG9zaWQsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUz
MiBjbnRyX2lkLCBib29sIGFzc2lnbikNCg0KDQpXYXJuaW5nOiBmcy9yZXNjdHJsL21vbml0b3Iu
Yzo5ODQgZnVuY3Rpb24gcGFyYW1ldGVyICdyJyBub3QgZGVzY3JpYmVkIGluICdyZXNjdHJsX2Nv
bmZpZ19jbnRyJw0KV2FybmluZzogZnMvcmVzY3RybC9tb25pdG9yLmM6OTg0IGZ1bmN0aW9uIHBh
cmFtZXRlciAnZCcgbm90IGRlc2NyaWJlZCBpbiAncmVzY3RybF9jb25maWdfY250cicNCldhcm5p
bmc6IGZzL3Jlc2N0cmwvbW9uaXRvci5jOjk4NCBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2V2dGlkJyBu
b3QgZGVzY3JpYmVkIGluICdyZXNjdHJsX2NvbmZpZ19jbnRyJw0KV2FybmluZzogZnMvcmVzY3Ry
bC9tb25pdG9yLmM6OTg0IGZ1bmN0aW9uIHBhcmFtZXRlciAncm1pZCcgbm90IGRlc2NyaWJlZCBp
biAncmVzY3RybF9jb25maWdfY250cicNCldhcm5pbmc6IGZzL3Jlc2N0cmwvbW9uaXRvci5jOjk4
NCBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2Nsb3NpZCcgbm90IGRlc2NyaWJlZCBpbiAncmVzY3RybF9j
b25maWdfY250cicNCldhcm5pbmc6IGZzL3Jlc2N0cmwvbW9uaXRvci5jOjk4NCBmdW5jdGlvbiBw
YXJhbWV0ZXIgJ2NudHJfaWQnIG5vdCBkZXNjcmliZWQgaW4gJ3Jlc2N0cmxfY29uZmlnX2NudHIn
DQpXYXJuaW5nOiBmcy9yZXNjdHJsL21vbml0b3IuYzo5ODQgZnVuY3Rpb24gcGFyYW1ldGVyICdh
c3NpZ24nIG5vdCBkZXNjcmliZWQgaW4gJ3Jlc2N0cmxfY29uZmlnX2NudHInDQoNCi1Ub255DQoN
Cg0K
