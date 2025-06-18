Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72651E503D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228403; cv=fail; b=X121hUua7blRkhqQyLz5YlSPszHE8/cFRgvCA8zF4jHLibvWVPGAvJ7EPsDp/bZ/0rt9k43pz0k2ozyQJbG4rETLf3sdZoAqbAE1t2S/fgkuhquELxiMYp3IB8rybWYLfQJ4buUr8VgSloLP+Yl3ONImjACt15FPfA0MrfS/iyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228403; c=relaxed/simple;
	bh=CEefyIIYo+Bs4GSnWpr9Cy0ggOLadXLt918u8lQvW8M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LM7f6WwyZdbBJApcM4EfOV/liI+PDqJ2BC0iZO+Hr8pfc0AwBaSO8MfOIMwyDINTV/BLg5h+cMqKbadyaATHpnWOv0W0HVcIDr0jgKWDxEh2YDrkrFvGyNQ0yrligMiFOv3uXq+idUIggnz3pp6Wx8LL4TReWVw6UaZTFNTlBDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6SVDmAi; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6SVDmAi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750228401; x=1781764401;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CEefyIIYo+Bs4GSnWpr9Cy0ggOLadXLt918u8lQvW8M=;
  b=B6SVDmAiRpP3v6ORWtncOxAukizDowUrWx7PrsnBMqK61qbb3d9qSiJL
   fDChDyCykMKxT6xJ8IHYc0oDZGK6IsG9+nj4/WtE5vksZWDBqrY9kx8aB
   bYCmqROWiYoBKgbs4VZ/rbuzEAgy+eU/z56HoI1KUr/EyB8XT2lT8KrbV
   t08v4bw736zMPGoM8hzqRWZnmIpGnqC22qBu7iN7Qx3EmzsSI+uCwkUAl
   M626SkjCzTCuuleH/WwdIs9BHROL1T3tGUzL2j5OaXzKiMelYZVb/55da
   B1XIB1/5MPUZbH60T5uu6U509NfypF7bUv6bPb/ftZkdQqeoXn5dKLL81
   w==;
X-CSE-ConnectionGUID: mnh9cvjtQ7O2i49Wh5Vt6g==
X-CSE-MsgGUID: 1IrltzU2Qqi4x54xID9ORQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63467248"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="63467248"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 23:33:20 -0700
X-CSE-ConnectionGUID: de0DQOqSRSmG1xpVuU2HwA==
X-CSE-MsgGUID: UgflP0PeQoyerMzSVhFR0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="150104087"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 23:33:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 23:33:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 23:33:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 23:33:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpkvTLzanc+1VUM25w7urXpuv3MqWVxYSHz5rVMc/uiA7fY5sDDEq0vgAujs9La4zWMO61VO2JrI2p7damK4miEiioQlbz9kclOtVJe2nQn4MdHT4CBMaWbSQN20eguT0VZYN1yN4iizgG4+X3Eaw3Jg49akkCUkNzcLzgC3UVn2pGHHmWkZ2ztxBUceICbSrA99hMBzzPkggSQ8+Wqdn4KLjIbUNcDQRPg55rWHRnsAQGbepXQIDwV30jdtcKRUK9s/UrfRyRJ1X4EF9+iDlBvFaHR9SaE19wIcbFt7IKD0WY71DgxTXLmmVrs++yLuncumGUllwk5ks4HR6a54Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEefyIIYo+Bs4GSnWpr9Cy0ggOLadXLt918u8lQvW8M=;
 b=EIXQLiauooMfShGbMlcdSJYpWsj7Z8wSX6SAt21G4/EICo0uct1WZMkvaGoKWyRsaWuVBT62lDDICzCjc/ALI1OrOLc5lTV0VvWaa1M3nLKucXn7eWyhFV1A5d8OwmZ6f6PROJC0Ui7BW4gPHgcUYGguK8G9ayo4/iQcKr9p9T42h8dve1cJ+0yVDl5+vBBc0BLOztyHfPfC7XJIQnUwU/ol5dlmh7ykkBaL1huKi+A3IRGNyUDpc213OB9Ja+BM9fgIDKwdV6mvxKvQn1UirNDPCE5vdy2KJnFr3221oXBjSnp5yv1vQLcov7eWHwb4oNDU2GnMIa3BnIvuCJp1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by LV8PR11MB8462.namprd11.prod.outlook.com (2603:10b6:408:1e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 06:33:14 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 06:33:08 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "linux@treblig.org" <linux@treblig.org>
CC: "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mei: vsc: Remove unused irq functions
Thread-Topic: [PATCH] mei: vsc: Remove unused irq functions
Thread-Index: AQHb3x+t58VOU1v7Ok+U6cyIWDS+D7QIdoRA
Date: Wed, 18 Jun 2025 06:33:08 +0000
Message-ID: <CY5PR11MB63663F220923D75D62524F05ED72A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250617003450.118751-1-linux@treblig.org>
In-Reply-To: <20250617003450.118751-1-linux@treblig.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|LV8PR11MB8462:EE_
x-ms-office365-filtering-correlation-id: b7636474-38a2-49c4-9ef9-08ddae31fd8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Qm5XMVA3dFM2MTQyTHE2bUxRZTcxOElmQTNCY09WVFUzczBrWU5EOTI0YkJH?=
 =?utf-8?B?dUJBTFF0a3k4YnVsb2R0MjZQTzZ2UUR2T3ExVkRMZFdNUnVGdXRVVnNqYlFO?=
 =?utf-8?B?ekdrOXJVbk9jTVhPVjB2R2p6MVVlUjQ2Mk5ySy9BR3ZtdmNHMTJMWlFJa3Fq?=
 =?utf-8?B?MWJJWFVlUDJzc00rbTdSOUhNY1E5NlNZUUxsVlNXUm4wOWdPOXc3N2hDOWE4?=
 =?utf-8?B?TitaR01TM1VZYnNDZloyVklBSGJ4d0QzakZjZkljMjQ3V2tEWXRzUUpPL2tz?=
 =?utf-8?B?aTNwL1RlMkY2akU2dzlSMVp0cUNmbTdLSGNnUVdxZDlZVExTL0lJQmppblpG?=
 =?utf-8?B?Uit0YXl1Zm1iMTcwWU1yTU5KWkZIdm16Y1hCdVVicUFkcks0dW5mMHVvTDJC?=
 =?utf-8?B?WUJIa2NueHJYbkdPdGgrUUxMMVoyaTBLeitaSk8zb0ROUVdxd0RETXNWRXYy?=
 =?utf-8?B?Qm9COWJIbTNkRHRYL1p1TThabk1MRjhRdytSVk9Fd2RiakxnTHZXQXVNUFVz?=
 =?utf-8?B?QTFtdjgxc2hxNzNMMkNIVU1MS3FNdXB6WURmNExHaE9FbTRMdVJTNVN6VXN2?=
 =?utf-8?B?UGlqWEdnMDcxbWI5Q2l2YXFkTkJkYUMzVWJMaE9aNUxzNmxJRDBpZXNFL1Y0?=
 =?utf-8?B?cngxVFFXQ3VqVll5TmtzTnV4cmYyY3pIR1ZIbzdoQ0pqZHMya3ZGSU9mSmo2?=
 =?utf-8?B?M0UwaG5kOUsyQ0lLMFFla3JXMWdsUzdaalQxaUlKU0ZnZC8zZURleU1VUktG?=
 =?utf-8?B?Ukt5WURLWUFPUXBTUSthWEZObldtZHZIWHBnUzlFTmd4M0lJM1plVTlsUmtE?=
 =?utf-8?B?b1lkN2tGMGUyc0FhdkphaDZiWTFHR2l1TS9jSml3Zmx4UHQxYVNTSFZNaWZj?=
 =?utf-8?B?WXJHVFhWdDBaN09xSTQ1cHQ2c2lzd1pqc2hZb0NmY25aSkNTN1ZZdlM2eEFm?=
 =?utf-8?B?WEU4Y0VKQ0dyMXZURnBrMWQ2ckxZQ244L2k0WlRMQi9CU1RTVjFNZVErTmZh?=
 =?utf-8?B?UmtIeFpqOUtFK0ZNNGx0SmwyeDJDZEg1djAxNnlZZG5tc0pXRVp0bmRRcVNp?=
 =?utf-8?B?SExGL05XTVFJUkZ3RkJmUHZhNXVCaUtlOG9QUmpIMmNVS25oZENha2oyMTNU?=
 =?utf-8?B?MUVadzFtSE1GeTVvaC9oVm9rWk9OZW9BZ0Q5c0JRRTRvNVh6aUFaUXlmS3VW?=
 =?utf-8?B?NzRxZTVnZkdrb3FVWjg4ZmdqTUZxN000cEdJc0JySnFXbVVneWw1dUk3S2VS?=
 =?utf-8?B?d1VIZG41TkhsT3hrMVJic21BaDZxZGY2cmFoWk05QU1ncHFTQytjSHo3SW9H?=
 =?utf-8?B?OEdoVEVydm82c241WU4vZmtYYzB4U0U1Mk9yU0tjR1NHTUxYa3FiR3dJZEwz?=
 =?utf-8?B?bzNab0JkRjZKVGlxTGJwaEtteUFPbDMwMW8vUU5tVnhNelY0V1k2Tm5GRVB4?=
 =?utf-8?B?eGNYV2JXYlZCams2WXVVNlRsamt2NWVodkErTEVUdEhQMENkM21IcFhPclhQ?=
 =?utf-8?B?Z0hlMWp4REQzRWx0MlVWaUMrT1dNU3JRRHN0WDZqN1pzRXh1Wjk1MWd4UkZw?=
 =?utf-8?B?clRaMWd3MFN5Wmo3R2FrcjNaQm9JZkp1ZkMyS2FsZHZkL2JIY3hhOVRlZ0dB?=
 =?utf-8?B?RzRRVEFSSmVKOVRSVjhCdDR1WkhubjNxWFZyRE5WK0xxejhXekJ3NHVQbU05?=
 =?utf-8?B?WFNpTWVIMmNkUWp1RzR3ckEvQ2tBcGxyYjYzK3M2ZmhqMVloR25GRUV0bUJO?=
 =?utf-8?B?cXB5OVNlcWhvTGN0cUV5Vnk1U09Oa2t6cDZiMmdLcm5HRjIrYXBSL3RIa29j?=
 =?utf-8?B?djI5VVpvaC9HWWRRR3NCWnBNTHJwNDZMMG1pcVhUY1JwMmwzNEhqbEh0S0pI?=
 =?utf-8?B?UmZhRFBxdHY0T25BUmVzUzdwVlkvTE9qL3hCZjRTSnRnMDgycUJsbDlWcDVN?=
 =?utf-8?B?NDB0VEZCNE1WMmQxYmZRTERSeEVoQ3h6QjFDekJHUGFpNmdPeXJHVGFwNEVU?=
 =?utf-8?Q?hsAnZVFI94iHEVcnonsUSqJjIqgVCY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qy92dnM0VVpWeE5BZVZSKy9oOThBVFhQN0Z4aVVxVllsdCtpK1FhcXErS084?=
 =?utf-8?B?N080ZkNUbE54RUtOTlQvT2V2RGsxaTZnaXJiVFZPcmMvVEVGL1lubUhxcjZj?=
 =?utf-8?B?UmoreEdCbTFwMGsraGk3dFNJbkd4Rk9CQjcrYktaY1RCTG82Qm5NSkZONXM2?=
 =?utf-8?B?VVY4aVkyOU84V0J3ODMvM2FOQUx0aE1uc0xXNkFpMW5sMHEvS2lYSHNnTGNh?=
 =?utf-8?B?cHRYYzl3M3hEWjBuc0dxR29qY2tyY1o1bTdPeEdNdk1KczVCeStkVGErV3gx?=
 =?utf-8?B?SXMrOXVYdmdxRFhvbFlPVFk0eGV5YW83SHZtTGRMckFiZDg0elBMSjMrL3RL?=
 =?utf-8?B?b2poYzZOcmNqQ09JT3ljd04rczBRcHlrSWUydXdiVzdkMk1qcXBCT1FiVjRB?=
 =?utf-8?B?VFMyY2UyUDJXMXg4RXNjZlBwWnFFSzNtdUdWM1ZKNk51VmdTNWRuV1pwRWNs?=
 =?utf-8?B?Z0VGek5hbDAyMmhmejFsNEQvYjRtc2JuT3kxa2ZFQjN6aGFSc3dqRG5UdmQ5?=
 =?utf-8?B?VkpMbHR3dnRVcFhSUnNjSG00Z3pvU2xneTZPNDVoNHN2VmljK0hnYkdGRThq?=
 =?utf-8?B?VFJTOVVkcUExR21jSkROMTBsUEVDTk0zUnJ6amNTVFRhalhMc0RldUUvNmU4?=
 =?utf-8?B?QnFLRnEyM05mWDFwWTZ1V0F3eGZLb1lydzlGcFNHQWc2TDFFY09ISU1SaExx?=
 =?utf-8?B?YWYrNlhKTVV6citEVWNGSWt0eXlHRG4xZzFvL2pOQ1R6QTBJV1RjNmFIMkts?=
 =?utf-8?B?ck10OUZGNU1QQnU5R1paQUJPTm5IZ3Vsc3ZvRHJVTCtlTVQ0VlVGZ2ZNN2pG?=
 =?utf-8?B?d2d5QWlYd1J3Nm5NSk9wWVIwdkZiQmRlVVpSWlhldHgvaUVtUzJrQlJRL0RD?=
 =?utf-8?B?RUVLbmc1SFJVUms4SktDamcxVndVUmdUR0RRNG5MUGNIbEUyemI1T3h4b2hR?=
 =?utf-8?B?aVFoN3JrZWs4L2FnRkkzYnNlc0tja3BGb2lJVDRBd05KL0M3WTI0bHpNMGlY?=
 =?utf-8?B?WlNxdzNJMEoybzVZU1ZvSnE2S0NpcmpFL2x4dmRteUhCYVB5YTUrclMyVnpC?=
 =?utf-8?B?bnpEWFREME5XSnFtM1NnY2szM1NuWnNJT3R1SE5QUmZCU2hYMDBTSm96ZzJ3?=
 =?utf-8?B?QVR1aGZBS3JHajNkL0NpcmppMDN5ZDg0NlNTUnBSN1dNanIxSVZOKzRWUXNh?=
 =?utf-8?B?NGdUdGJIcFJTS1BRZ1RPS01NcG8rdHhJNGdCVHB6bXl3bmpscEpxQVNXR2R6?=
 =?utf-8?B?dDVxd0xxeUFQSHoycEtzeWE0eVFXVzNWQzJGZFpyYkJhOUxjVVBBYlllQUND?=
 =?utf-8?B?N3ZwM3NveWpwMEowSzlYTjNjK0IxRlZIaFhLZzl1d0lpejBFUXplRmFPQlI5?=
 =?utf-8?B?Nk5YN1pQT1NxdFVhb1E5L2F2QmtPc04rVk1Eemh3MmxFcDJGSi93N3E3a3kr?=
 =?utf-8?B?eHNNVENPSkk5Ymxoa3pyY0pWRDNTcTFhMEI5WmQ2Umg1V253c1N0Z3I2bUZR?=
 =?utf-8?B?WmFLZENBWmVSYTZWV1pGMmpONk5YLzlGZ3AzTkQ0MUJqeTIwNldoYjdxR2hw?=
 =?utf-8?B?ZllRM3ZKb0hiYnIvK2JSSzhLL3FCSWgxRjY5a3NsblpMWDdBVDVkNTVEN3l2?=
 =?utf-8?B?dVcxc05DYU1iRXQxREROUHNDaUFwa0RJK2lSWUpTNmJNbEUyMnpqYjdseWVQ?=
 =?utf-8?B?SVJZQy8wVHNqczR2UW1JTjJhczFDa3NyS0xjMHhTUmlZUUU3blJDNDdQM0Z0?=
 =?utf-8?B?anpSTThHTmlCTlFKcW5RUktGVVVOUGxtNy9XOEE2OEY1d205Ty8yVkYvY3Ni?=
 =?utf-8?B?VWVIOXI1dVQ2dzRtbGw3dElMWDRrdW1yTWwxSjFyeUg3Z2JIdHh6NkNoYjln?=
 =?utf-8?B?dzlXeGE5ZHovbnlTUWM1OW9LQjhLTExUbjZadGJHL2lIWVpkTVVLUmdmdUpV?=
 =?utf-8?B?UWUzODRtQ2lTL3prQnhLVVJDK2huY3FnQWRucUNzc0I5UTdUSk1LRUVMUG1p?=
 =?utf-8?B?QmdwLytkK2NNOXM5VVlYczdkMG0xRUNoRGJQeGc0UjlsanVqcUs1K0FHRXZu?=
 =?utf-8?B?VmFYS0JJY3BFYW0yNWdvU3RkSmxtSnRkZElhM2Q4SzMxTVhjUngrMzdVQ1Z1?=
 =?utf-8?Q?Unt44kgmwFjjmElsu35lvNMgh?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b7636474-38a2-49c4-9ef9-08ddae31fd8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 06:33:08.6749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uANsJuIjDzFVR97wRGsD+H6463SskoMZHXX4Q0hcm2V77lGw8ntixNhTcJmXp5vkdeOwfKGozQKNFnJSFizeOnsHfGexwe+P0vx0ksL5KNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8462
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0hdIG1laTogdnNjOiBSZW1vdmUgdW51c2VkIGlycSBmdW5jdGlvbnMN
Cj4gDQo+IEZyb206ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8bGludXhAdHJlYmxpZy5vcmc+
DQo+IA0KPiB2c2NfdHBfcmVxdWVzdF9pcnEoKSBhbmQgdnNjX3RwX2ZyZWVfaXJxKCkgbGFzdCB1
c2VzIHdlcmUgcmVtb3ZlZCBpbiAyMDI0DQo+IGJ5DQo+IGNvbW1pdCA5YjVlMDQ1MDI5ZDggKCJt
ZWk6IHZzYzogRG9uJ3Qgc3RvcC9yZXN0YXJ0IG1laSBkZXZpY2UgZHVyaW5nDQo+IHN5c3RlbQ0K
PiBzdXNwZW5kL3Jlc3VtZSIpDQo+IA0KPiBSZW1vdmUgdGhlbS4NCj4gDQoNCkFja2VkLWJ5OiBB
bGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KDQo+IFNpZ25l
ZC1vZmYtYnk6IERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgPGxpbnV4QHRyZWJsaWcub3JnPg0KPiAt
LS0NCj4gIGRyaXZlcnMvbWlzYy9tZWkvdnNjLXRwLmMgfCAzMSAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzEgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21laS92c2MtdHAuYyBiL2RyaXZlcnMvbWlzYy9tZWkv
dnNjLXRwLmMNCj4gaW5kZXggMjY3ZDBkZTVmYWRlLi45OWE1NTQ1MWUxZmMgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvbWlzYy9tZWkvdnNjLXRwLmMNCj4gKysrIGIvZHJpdmVycy9taXNjL21laS92
c2MtdHAuYw0KPiBAQCAtNDA2LDM3ICs0MDYsNiBAQCBpbnQgdnNjX3RwX3JlZ2lzdGVyX2V2ZW50
X2NiKHN0cnVjdCB2c2NfdHAgKnRwLA0KPiB2c2NfdHBfZXZlbnRfY2JfdCBldmVudF9jYiwNCj4g
IH0NCj4gIEVYUE9SVF9TWU1CT0xfTlNfR1BMKHZzY190cF9yZWdpc3Rlcl9ldmVudF9jYiwgIlZT
Q19UUCIpOw0KPiANCj4gLS8qKg0KPiAtICogdnNjX3RwX3JlcXVlc3RfaXJxIC0gcmVxdWVzdCBp
cnEgZm9yIHZzY190cCBkZXZpY2UNCj4gLSAqIEB0cDogdnNjX3RwIGRldmljZSBoYW5kbGUNCj4g
LSAqLw0KPiAtaW50IHZzY190cF9yZXF1ZXN0X2lycShzdHJ1Y3QgdnNjX3RwICp0cCkNCj4gLXsN
Cj4gLQlzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpID0gdHAtPnNwaTsNCj4gLQlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmc3BpLT5kZXY7DQo+IC0JaW50IHJldDsNCj4gLQ0KPiAtCWlycV9zZXRfc3RhdHVz
X2ZsYWdzKHNwaS0+aXJxLCBJUlFfRElTQUJMRV9VTkxBWlkpOw0KPiAtCXJldCA9IHJlcXVlc3Rf
dGhyZWFkZWRfaXJxKHNwaS0+aXJxLCB2c2NfdHBfaXNyLCB2c2NfdHBfdGhyZWFkX2lzciwNCj4g
LQkJCQkgICBJUlFGX1RSSUdHRVJfRkFMTElORyB8IElSUUZfT05FU0hPVCwNCj4gLQkJCQkgICBk
ZXZfbmFtZShkZXYpLCB0cCk7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJldDsNCj4gLQ0K
PiAtCXJldHVybiAwOw0KPiAtfQ0KPiAtRVhQT1JUX1NZTUJPTF9OU19HUEwodnNjX3RwX3JlcXVl
c3RfaXJxLCAiVlNDX1RQIik7DQo+IC0NCj4gLS8qKg0KPiAtICogdnNjX3RwX2ZyZWVfaXJxIC0g
ZnJlZSBpcnEgZm9yIHZzY190cCBkZXZpY2UNCj4gLSAqIEB0cDogdnNjX3RwIGRldmljZSBoYW5k
bGUNCj4gLSAqLw0KPiAtdm9pZCB2c2NfdHBfZnJlZV9pcnEoc3RydWN0IHZzY190cCAqdHApDQo+
IC17DQo+IC0JZnJlZV9pcnEodHAtPnNwaS0+aXJxLCB0cCk7DQo+IC19DQo+IC1FWFBPUlRfU1lN
Qk9MX05TX0dQTCh2c2NfdHBfZnJlZV9pcnEsICJWU0NfVFAiKTsNCj4gLQ0KPiAgLyoqDQo+ICAg
KiB2c2NfdHBfaW50cl9zeW5jaHJvbml6ZSAtIHN5bmNocm9uaXplIHZzY190cCBpbnRlcnJ1cHQN
Cj4gICAqIEB0cDogdnNjX3RwIGRldmljZSBoYW5kbGUNCj4gLS0NCj4gMi40OS4wDQoNCg==
