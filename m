Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9611DC9A3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751872120; cv=fail; b=T1PY/3kS+xlqkggANRhYlfzxb4Oz1gHlX4la1TknhGILxeKLFjmm4u3Col4xUCJfbwxoUTmR3rw4p7tl7HjHuYyoeiBdMTXjjkk9Z6MA71T4YltkwJ+M3CseYalP39ZW+iEojBub0Xy9VzMWSRND+uSlTcTA/PfVutLXaHXIfek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751872120; c=relaxed/simple;
	bh=mPpbuBNNk9trpMqrWdcQh2U3IdtKkW6XSx4mXsq9f3M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HQawBOWWf3eLKqtAk9rUxqwH8ONXuLpj1r1AwsxCoJcMd25qoWbXTMlXn3TMj2comaT+F1UsDKpb8KGo6IiWQCHZOePTXOerfnED8QKx0EwA+DgAx3L7pCfTNYu9J3yDe8vVNtKzoQMtf2vjtB3oS7mFGNJSnhhzeP7GFAyXtHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ajmmg0Y5; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ajmmg0Y5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751872119; x=1783408119;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mPpbuBNNk9trpMqrWdcQh2U3IdtKkW6XSx4mXsq9f3M=;
  b=ajmmg0Y5ogkDaUviwVr0PqSs6fMlwxBuq0/9euEtCsvGMo4BEjiOyyBI
   wSuHRwQdMINChoWyk/OCaZ44BzHlb7xtFlkziAYWxlXR9ouM/MiyVOOql
   YwNvD6rNv3B+cAKVLdFRSnixWh7PSBX8TcXuo4ytB1fNhPOM6ajOSr1z9
   kVX7dH0yJ2nWZQ4EJMJYbHLrJJSoVWtAE3WBuJKGi6tsxCkSjF+dHbfwZ
   GyEfzZwXxQFU5YVPvSD534IT4hE7LyjGBdyQUqZhOGGhDjKfvytif6hcG
   lGTti+kKn/v2XUHuR/2Wv+gu8uYIjzbgVN09qrFLINIRhgLdi4BG2+BIf
   g==;
X-CSE-ConnectionGUID: DYSOpqzHRQKYrFWHeqbNVw==
X-CSE-MsgGUID: SUuO2kvuRFyrZ1tmMiT2wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="54208179"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="54208179"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 00:08:38 -0700
X-CSE-ConnectionGUID: Q29EIelfTWqAjZjFxpeUrg==
X-CSE-MsgGUID: mRmf9twHTLCnL0w4VOEmOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="160796584"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 00:08:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 00:08:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 00:08:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 00:08:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrrF8OhDdIMhT08C1xHESeK8Z00CxKRJ9ZSqUoRDLvr1WXQTHcZiTU9TymRPcjoXKWHo99dPiecMu+JfxXTR0359rnDrYDACCVmYxvzCtfrgbggBD/HWS3Ea4oNaVwmsyGLLYxBVyh62I0R84G1dZWo+sAkATwmpWOp3+ONHunHDG7bOODqS+MPPQbU9WLRG3WVCUQUIlmEU3CQlBonD5wiqz22lukr/CmQS4l+JFe1hCe7pe651SzLq6pFbddD9BnJWcSoRYari01miT3dwoE5sQQXeARTrDMim4CC3MQ9/7aSelF0C1YMEN0e/cYUE6Fi8wrD29S/HuLD846vb+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPpbuBNNk9trpMqrWdcQh2U3IdtKkW6XSx4mXsq9f3M=;
 b=g8D1r0J46XFJfZKt6nN5uU5olSMdVc0bAuut6ScuWkRcoLdFafLOYioy2MVVhrKnC53NTmXGUma6z3+r4CDqJliMWEkK7XdgBol4rHRJ9mx8P6euiAirn5IIFitiQeu9zsVuLgavrATzl69j/CdfFcvyh3BSJCUs+VoYyYXrAglcRlrswq5kVwjc+Fzqo4SZEy8iJUun7bfsOMVXMMeHO0/cIEVfgQugCOyQ84W31imz4pEY56+yxs1forVZeRai2U0abB1qVy80a6B0hHdIuOdBFiVexdedN6c3SdUFE2UGLplwqLxFDyFA+SD+FYyVpfk8nBzFRDUfoRsGLVcLYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH0PR11MB5831.namprd11.prod.outlook.com (2603:10b6:510:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 07:08:34 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 07:08:34 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [char-misc-next v2] mei: bus: fix device leak
Thread-Topic: [char-misc-next v2] mei: bus: fix device leak
Thread-Index: AQHb5PnBD41lwh8Xa0K5qwLV+EJSerQYgVYAgAMMHgCAAAnvAIAAAS9ggAAZ14CACp7vEA==
Date: Mon, 7 Jul 2025 07:08:33 +0000
Message-ID: <CY5PR11MB636694A9C7A086AF584B7CDDED4FA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250624110520.1403597-1-alexander.usyskin@intel.com>
 <2025062836-twentieth-kudos-1148@gregkh>
 <CY5PR11MB63664DE1B93F480CCC199D8FED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025063022-riverbed-country-5c2b@gregkh>
 <CY5PR11MB6366BBFF44C7F21C24292590ED46A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2025063042-usual-acutely-0d3b@gregkh>
In-Reply-To: <2025063042-usual-acutely-0d3b@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH0PR11MB5831:EE_
x-ms-office365-filtering-correlation-id: 1fcb1694-19c5-446a-bec9-08ddbd25164d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?alVqK3h2QnZBVFpibVhFOHlCVTkrcHZkOWZKTVIxaVBhNW1aK0tlQm5kclFO?=
 =?utf-8?B?WGNoRjNITy9WSjVwbXU5SjVGTm1zZGVLaXJKRFlPZ1VjZWNXZFkyU0FjNEts?=
 =?utf-8?B?KytRbXdZZjNHb0ZseHhyeHExYzNNMUVNYzR2S3BML09sV01ldmZqZHFWSk9O?=
 =?utf-8?B?TnEvQmtQZVdQSXlpdDAxb1JIZENyNVRmNi9VdDI3MDBNWGVDdVBtVlFIcXEw?=
 =?utf-8?B?NzAwY28yZ0hIUmRpS2NKUlZDS0txN2RqaHpQWGxULzdrQ014MForY1Z6dkkr?=
 =?utf-8?B?d2JSZ3RtaFJPZXhwNjZlZEhNRjNNVS93cmQ5S3hXS0xTcG1VUVNCUGgxUlFF?=
 =?utf-8?B?enJxR0o4Sk92bExuOU9uTHBIZklKb1BtaFVBTGFFelA1N3I4RjRoQm1VSmw3?=
 =?utf-8?B?dTN2OWtreVZCNXdHTno5MEpFS3ZFWFlzeUltNml1a3hqSlE4STArZHdNQmdQ?=
 =?utf-8?B?dUc1aDhFQjVlME5xMDVUd2VUZVNwMXpBQ2NIVmxRNzNqRmFkcVV0V3pYcGEr?=
 =?utf-8?B?bHo3T2cvdGV5R3VrS1g1S0Nuandnd0NrYlNWcnJHS1JEN1JINm4yNDJ4M08w?=
 =?utf-8?B?Q2hRYUJEZTlxWm91T05hS0R1ZmlydjY1RmV2RjkzMTJzT1c1Q1pWVFFzbFZG?=
 =?utf-8?B?MDZpRG13Szl0dVdtODJmQXMzcklSeURwQUgrVElMUzhBTTZJbWxpTFJEbm11?=
 =?utf-8?B?WjN1T29XOW1pYm9jbmRnNk91WUVJc0J2VUhDQlFERXMydFc4bkY2aldUNzZn?=
 =?utf-8?B?aE42cWJaby82eWs2NExxVWZRTzlVOWZyUGxEMHErZkxWckZ0K2ErQmMvc0pP?=
 =?utf-8?B?VUtvcnJDRHE4RzJTK043UVVzRjBjQ2cvcnVBZGZlb1dQd0p6aEJKZHZQOGhu?=
 =?utf-8?B?UER2MHM3Wi9td0M2cGN2RmJXT3Nrd2NIVm8vMy8vNmRlL2F3eG5hTEthRmF5?=
 =?utf-8?B?NFFDa01ReHB4bDJtQ00rZXhVanFmLzh6Vk55T2UyODU4VDc4QjVRTkpCR3NW?=
 =?utf-8?B?bVVUSENzUWtpVkh5VGcrT0txUE5vUGYyeTQwSmJ3ZjQvVlF4WGdiYXJTR01L?=
 =?utf-8?B?VTMrVjN0MDhIaDVQVkZsWE85NUx4MTFRTG5jeFJ0TUJBeE96OEhyL05FbXlH?=
 =?utf-8?B?bEZXR1h2NUdpZER3V0VNM3J4SlpyV0FHVXhyRndtcm54Tkw4NG1EK0hMMWRv?=
 =?utf-8?B?a0pUN2hWS1pnL1QybGUzL1Vtc1dOb1hlZ1FCZVc3UW5NTVpqVkRkZE93a3VN?=
 =?utf-8?B?UGZabk82ZHBBM3NYWHZOTHJ1SE9YRjRFQXdwd3FrcXdabExIcTQ3NFhlcWhi?=
 =?utf-8?B?WUZOU3MyakhINzlRK0o3bjVPNnZjVmNvMXNxTFFXOFV1WWJ4Y21INnhCWE1k?=
 =?utf-8?B?aE1BWWk3RzY3bTRZVHFEamtaUnk0TGp3VU9HYjlpUGtEVTRaaW9QT2hoajhH?=
 =?utf-8?B?alRQNk1tOW1OR29BM29FVDdpNVBzNCt4WkhEZmsweHd4TFI0Vk51TnRmeTNr?=
 =?utf-8?B?S01TZTFNNDd4MExBNkFCajU3RkRvSEpTZzRNcGorR2JzaFpoaWZjaEZTaUhV?=
 =?utf-8?B?NjNPQ1A0dWRoTmJEclh0K2xPUUZWTTAzaWhXc3hCRy8xRzJ2cStOL09RdGFE?=
 =?utf-8?B?SkI1aVl6VnRsVCtabWtvN1dla1dCL0twbDZqdWF0TEdxMFl2Ri8zZnhsQzR6?=
 =?utf-8?B?aHhGUERFUlFHUlQ2TmdxelBQdzhGelpndjBvbkNUN1FKVFZMQnVvWVptdVVY?=
 =?utf-8?B?eFIyVzVhMWxmQzUyTUtuQzNUaWhCVmU3SGE1T2l3cHZ0TE53MjFtcmQ0NVRQ?=
 =?utf-8?B?ckh1cHFKMEVOeTcvREZqRGUwbFhlZlJBakZWUGgxMk1lN1VTa01NTHJ6QldL?=
 =?utf-8?B?dVhwSlFvQWJ2VklOYzVVR2tJNjdWTk95eXMveWRLNjFHcmdvd2RiZUIzYnhF?=
 =?utf-8?B?UVR2ZWQwd2R6TERKeUFPWmFweGJFUE5GWmV4cXdoeDBhOEtmRXdxT2tSQUdQ?=
 =?utf-8?B?Y3FvV3U3SGlBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzR5WGdvZi9MK2dHNmgvUGI2NEM4L0J3bXRrT2NWd0NKeWJmblg4VFhYUGdG?=
 =?utf-8?B?M2IxUDduYVhvMnVGUEtZVXJSNElRbFkwd1FiNEFlbW0wUE51WnRxNnI0Nlcx?=
 =?utf-8?B?VWRGYmgyd3QvZGxwcHFSdmRYT1B5Rk1iWEd1SExjcFVzNVUzenBhd2FsMkVK?=
 =?utf-8?B?ajZlN2diaE8vQXNlbTBYS2laWXJHbHBtUkJTenN4WTgvL1FiRDhhVFdSRDZ2?=
 =?utf-8?B?TGJ4akExMU5Ua2RrcDhPMVE2alRzSTJiREMzaFdmYWxPMm80VjFiYkZDWGxk?=
 =?utf-8?B?TExjeGI2d2RyYTY0UytzOWVuZWZScWpjeURBVFFlU0EwZmY3YTFOUFN5dlFk?=
 =?utf-8?B?aGt3SE1vdFRENnR5Y3haZ1BxMlA2MjFzZFlPMGQ5SGVuYVFRY0E5YWRjU1RY?=
 =?utf-8?B?L2c0OEs0cHQ3SXNqYnNHL3hORDRXQVhuQm4rR0JEM3NWNlVJYUlaeDVndnFK?=
 =?utf-8?B?czhneFRaU1JGOUdHNGxieXpJNmJCTWhSaExIRHhZL0RFYUxaajZybUpsY0FY?=
 =?utf-8?B?UUY2VXRvb095bWdCSGZVdlhya1p1UVhRYnh0Umk2V0s0WTN0TUZSZHpVeXhZ?=
 =?utf-8?B?SDdaRGVHMWpMN3czV0JzdGYxaW93N01jNmpFQVdhUjhUS2ducGlKaWJGdm4r?=
 =?utf-8?B?c3JNUExQVGZqWG5kSzJIYlFFWklZdUMxNEdYdnViV0R2WjZxU1I1NjlDejZK?=
 =?utf-8?B?cGgyV1Jma2hxM0NJV0hCS1Y3QkhjdFJRWmJoYkVNSERoUXM0aDdXYUl4Wmp1?=
 =?utf-8?B?V0E3UEtONlpsenJ1a3pKdStVVjRXUEd6dU1RN05SSWFCcWo3OTFDYWJSYVB5?=
 =?utf-8?B?ZnJWVDI3U3EwZ0RBZnIrS2FwRWQ4YmtqWThoYUV3U2ZyQVArNUZLWTZGcllF?=
 =?utf-8?B?bEh0MkVCS1BCWDY4WEkxTHhaMTh4d09Yc01SZ2lJN0xsNHJXc1dMbDN2UWIv?=
 =?utf-8?B?ZkxLUit4clRJTmJTL041M1VIakNlYi93K25MaUsyTlQ1dEFuMlBXWG9TUHFh?=
 =?utf-8?B?Nm56dnpmQ1NKOUVWSWVURGlMMHJSR1BnYUtuYkNHQ2dIQUlYcksxc2FpUmp3?=
 =?utf-8?B?SzE4bkZ2b3RUYXVhZjhXRC9vQ3U3TDVZQU82Qk0zRkZ3dFNycnlVTk04bGVM?=
 =?utf-8?B?UjFZKzFXUlJJU2UvZTFqMDhENlp1MmszeTNCYUVpSUJaRVZKYTh0emdrQ0hO?=
 =?utf-8?B?TklLWXZQMnpBQllnTWY2Ujdvak4wTmZUVTRvanhEZkZtZ2pLSFlyekx4a09U?=
 =?utf-8?B?dUtqdkc4em81STBSTFFvRkpZTmhyVUFmajJZMkVlYUNob1F1ejZEcG5SbTZV?=
 =?utf-8?B?d2hUQ3ZldjFnUVA1TXgvcTZFV3ZVeSsrblBBT3MzOUV4cXcvTkRja3c1cFFL?=
 =?utf-8?B?bmZMdURrV2N1Z0o4UW1QanNtWUhJTHpJOHFZc2JkZ0szdWxzcTNaazVkdlJ6?=
 =?utf-8?B?VDErenFkcEdpNFprSHBMMFdyWTNNYlY3R0drdXNHTUZjb0lLNGM3TUE2Mm9i?=
 =?utf-8?B?eU91Z3BDK3E3V2poclVNWXZEQjNuU1lxd2tENEhjUi9qODdLWjJrWWZvaklr?=
 =?utf-8?B?SmlieFpQNUlBRTBXNERFbTR0Y1BMVXR5VlZRWDRmUzVWUEJCQ3Y3clY3V2dz?=
 =?utf-8?B?UEJYaGdYMUFTNnBWVUEyQWhBakJPMEVuTFl6MGM5ckN3dEpBYWROUll0RnN1?=
 =?utf-8?B?dXp5V25ISUhVb2o1dS9VSG91VUY4OEUrUktvQnJ5blMvaGQ2ZWdzM1VaTGIv?=
 =?utf-8?B?YnRlSk9GVGJOK2pZQ2JzeVA2UUdXUmZBajNHbXo0SGlPMzQ1cUJ0YnVHR1JN?=
 =?utf-8?B?dFpSeEx4UUVpVjV0OFlzS2Y1Tm9Fd3dEME56VDM0WGx4MmhDS2gxWkxqU1p1?=
 =?utf-8?B?STdYdmJlQ0ZwTk92MFNMSnVGZWo4bWFqWXBPRmhqcWw4V3BwK0srL0RyUklU?=
 =?utf-8?B?WUN1NnMvNGVjT2loVW91NWZyb2RsVUVMK29CakVIOFp1MlZZNXAzM2M3a1Fn?=
 =?utf-8?B?VEFkZnhmelEvRC9NNTZpQkVHNXAySDNwSmM4TkR2L25IQk9CSUVMQlBjemNm?=
 =?utf-8?B?YXdXMGN5UXNzSzAxa3BmR0xzdEc5c2Q4WFlvWXlSNVZOVHJaTU1TS0c4ZTI3?=
 =?utf-8?Q?mNjysdAZLnx+DY0NQZb1ap6ym?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcb1694-19c5-446a-bec9-08ddbd25164d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 07:08:34.1718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDpgxwEAn3Rh0f1VF1Hkra0/3UrzBUcmQIMsy1nhVFOd+feCUAba826HO0KHYId2mEFkTngQtXsjhk9CAMaUTLVPI9qGXx1wRxyn72ME/LE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5831
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0IHYyXSBtZWk6IGJ1czogZml4IGRldmljZSBs
ZWFrDQo+IA0KPiBPbiBNb24sIEp1biAzMCwgMjAyNSBhdCAxMToyNzoxNEFNICswMDAwLCBVc3lz
a2luLCBBbGV4YW5kZXIgd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0
IHYyXSBtZWk6IGJ1czogZml4IGRldmljZSBsZWFrDQo+ID4gPg0KPiA+ID4gT24gTW9uLCBKdW4g
MzAsIDIwMjUgYXQgMTA6NTI6MDhBTSArMDAwMCwgVXN5c2tpbiwgQWxleGFuZGVyIHdyb3RlOg0K
PiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbY2hhci1taXNjLW5leHQgdjJdIG1laTogYnVzOiBmaXgg
ZGV2aWNlIGxlYWsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIFR1ZSwgSnVuIDI0LCAyMDI1IGF0
IDAyOjA1OjIwUE0gKzAzMDAsIEFsZXhhbmRlciBVc3lza2luIHdyb3RlOg0KPiA+ID4gPiA+ID4g
VGhlIGJ1cyByZXNjYW4gZnVuY3Rpb24gY3JlYXRlcyBidXMgZGV2aWNlcyBmb3IgYWxsIGNsaWVu
dHMuDQo+ID4gPiA+ID4gPiBUaGUgZml4dXAgcm91dGluZSBpcyBleGVjdXRlZCBvbiBhbGwgZGV2
aWNlcywgdW5uZWVkZWQNCj4gPiA+ID4gPiA+IGRldmljZXMgYXJlIHJlbW92ZWQgYW5kIGZ1bGx5
IGluaXRpYWxpemVkIG9uY2Ugc2V0DQo+ID4gPiA+ID4gPiBpc19hZGRlZCBmbGFnIHRvIDEuDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoZSBtZWkgYnVzIGlz
IHNvIHNwZWNpYWwgdGhhdCBpdCBoYXMgdG8gaGF2ZQ0KPiA+ID4gPiA+IHRoaXMgdHlwZSBvZiBm
bGFnLCB3aGVuIG5vIG90aGVyIGJ1cyBoYXMgdGhhdCBmb3IgaXRzIGRldmljZXMuICBUaGUgYnVz
DQo+ID4gPiA+ID4gY29kZSBzaG91bGQga25vdyBpZiB0aGUgZGV2aWNlIGhhcyBiZWVuIHByb3Bl
cmx5IGFkZGVkIG9yIG5vdCwgaWYgbm90LA0KPiA+ID4gPiA+IHRoZW4gbm8gcmVsZWFzZSBmdW5j
dGlvbiBjYW4gYmUgY2FsbGVkIGFuZCB0aGUgc3RydWN0dXJlIGlzbid0IGV2ZW4NCj4gPiA+ID4g
PiB2aWFibGUgdG8gYmUgdXNlZCBvciB0b3VjaGVkIGF0IGFsbC4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IFNvIHdoeSBpcyB0aGlzIG5lZWRlZD8NCj4gPiA+ID4NCj4gPiA+ID4gSXQgc2VlbXMgdGhh
dCBpc19hZGRlZCBjYW4gYmUgcmVwbGFjZWQgYnkgZGV2aWNlX2lzX3JlZ2lzdGVyZWQoKS4NCj4g
PiA+DQo+ID4gPiBBZ2Fpbiwgd2h5IGRvIHlvdSBuZWVkIHRvIHRyYWNrIHRoYXQ/DQo+ID4gPg0K
PiA+ID4gQnV0IHllcywgdGhhdCBzaG91bGQgd29yaywgYWx0aG91Z2ggdXNpbmcgaXQgaXMgdXN1
YWxseSBhIHNpZ24gdGhhdA0KPiA+ID4gc29tZXRoaW5nIGlzIGEgYml0IGJyb2tlbiBpbiB0aGUg
ZGVzaWduLg0KPiA+ID4NCj4gPg0KPiA+IE1laSBidXMgdXNlcyBkZXZpY2VfaW5pdGlhbGl6ZSgp
IGFuZCBkZXZpY2VfYWRkKCkgcGFpci4NCj4gPiBBZnRlciBkZXZpY2VfaW5pdGlhbGl6ZSgpIHRo
ZXJlIGFyZSBkaWZmZXJlbnQgaG9va3MgYW5kIGZpbHRlcnMgY2FsbGVkLA0KPiA+IHRoYXQgbWF5
IGxlYWQgdG8gZHJvcHBpbmcgdGhlIGRldmljZSBvciBhZGRpbmcgd2l0aCBkZXZpY2VfYWRkKCku
DQo+ID4gVGh1cywgd2Ugc2hvdWxkIHRyYWNrIGlmIGRldmljZV9hZGQoKSBpcyBjYWxsZWQgd2hl
biBkZXN0cm95aW5nIHRoZSBkZXZpY2UuDQo+ID4gTm90IHN1cmUgaWYgdGhpcyBjYW4gYmUgcmUt
YXJjaGl0ZWN0ZWQgdG8gdXNlIGRldmljZV9yZWdpc3RlcigpLg0KPiANCj4gWW91IGRvbid0IG5l
ZWQgdG8gdXNlIGRldmljZV9yZWdpc3RlcigpIGJ1dCBwZXJoYXBzIHN0b3AgaXQgd2l0aCB0aGUN
Cj4gInJlc2NhbiB0aGUgYnVzIGFuZCBhdHRlbXB0IHRvIGFkZCBhbGwgZGV2aWNlcyBhZ2FpbiIg
bG9naWMgdGhhdCBpcyBpbg0KPiBtZWlfY2xfYnVzX3Jlc2NhbigpPyAgVGhlcmUncyBubyBuZWVk
IHRvIGNhbGwgZGV2aWNlX2FkZCgpIG9uIGEgZGV2aWNlDQo+IGFuZCB0aGVuIHdheSBsYXRlciBh
dHRlbXB0IHRvIGluaXRpYWxpemUgaXQsIHJpZ2h0Pw0KPiANCj4gSnVzdCBmaW5kIGFueSBuZXcg
ZGV2aWNlcyB0aGF0IHlvdSBkb24ndCBhbHJlYWR5IGhhdmUgb24geW91ciBsaXN0IG9mDQo+IHJl
Z2lzdGVyZWQgZGV2aWNlcywgYW5kIHRoZW4gb25seSBhZGQvaW5pdGlhbGl6ZSB0aGVtLCBzaG91
bGQgYmUgYSBsb3QNCj4gc2ltcGxlciBsb2dpYyBvdmVyYWxsIHRoYW4gd2hhdCB0aGUgY29kZSBp
cyBjdXJyZW50bHkgZG9pbmcuDQo+IA0KPiBncmVnIGstaA0KDQpUaGlzIHdpbGwgcmVxdWlyZSBh
IGJpZyByZWZhY3RvcmluZy4gSSdsbCBsb29rIGhvdyB0aGF0IGNhbiBiZSBkb25lLg0KTWVhbndo
aWxlIGNhbiB0aGlzIGZpeCBiZSBtZXJnZWQgb24gY3VycmVudCBjb2RlYmFzZSBhbmQNCnJlZmFj
dG9yaW5nIHdpbGwgYmUgZG9uZSBzZXBhcmF0ZWx5Pw0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0K
DQoNCg==
