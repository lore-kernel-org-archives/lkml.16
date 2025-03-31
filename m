Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EF01B4138
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743461538; cv=fail; b=K9qPzI90+3RDAq/VvMLq+z+rkiG83G8NoFQYB8y0zdg7mSLXUVlMVsRPHJyS+4ZJ361e+RS2TJypJ74XouReXCMBQa7M33rV3Gskr4IJWlfD5s/VBByxqnB++xo2bvnFfF7tmgmCMtT19Lx9Z5Rt0yO3C/xDoOfB7tKb45gJEG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743461538; c=relaxed/simple;
	bh=n6G4HIKZbXb6js0wI8v5CdgEZbhQpocXRP7nCIOSh7g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yy1HFKJs0Y2GembsZmBssZxWuliwwLi2mhN3+zLUpPRiiuHzi9adTJ46jWGdyXveqsZWg2Hyw+L8BSggz9mnxPn+g1SWc0W9ycnSpfBrT6C2YRDsACmpOHm2PQnNuOM8Ei5aP4wfvXksh89Dc0ueTxJAjxZOPStB5tiSBpBO+18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MV6B1Gak; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MV6B1Gak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743461536; x=1774997536;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=n6G4HIKZbXb6js0wI8v5CdgEZbhQpocXRP7nCIOSh7g=;
  b=MV6B1Gak0nVz4zo//h3RB3saTYpzBg7sTwuLl2eF09tuouKtwVr+o2g6
   2vBgujYqw4zAZH1+EXL3rTiGUvggu8HKERXSRtUxKN8TGzQs8Md2Oovrm
   cIFskMj5yOOwpzkVOkjIOnuOaHetxAfdCC8tMlhMaqorRrSvP2QvDZCN/
   EMFmFSY7gte5JHMWubzTiakLxwog2x0h/kSQofl9VwTA+glQnj5bMJphS
   XVJYWgZ4CgEcZr13Wsu8sPMs2BjaM14uVv8D99/t9YwdfWehcCaNgobGU
   UpvWUX5tBttkLHMObMg0+VLy7r5EJ0y6Gl7rvfw60C3qq605xoJ08WREJ
   A==;
X-CSE-ConnectionGUID: rAFCKzLIS+OOQlwshprCIA==
X-CSE-MsgGUID: aorYLje2TPGdXZ1HxcjA+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="54962748"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="54962748"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:52:16 -0700
X-CSE-ConnectionGUID: ebuB63c4Rt+ieppIy3nAag==
X-CSE-MsgGUID: L8OhJ+DeQDiqpVDwX7FeAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="125967488"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Mar 2025 15:52:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 31 Mar 2025 15:52:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 15:52:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 15:52:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kk69NpDSxbj5Cdh3iHT0YOSylba+ZHxbkJfECf3wSa/+tg9Z4z/HcGVM9qcrxLhSENAQDCqBZMUDDeedlQzss02LDIFJKTYsTWa8LCLkvajpEfuvx5Ko4ztCeuY77dwb/8GHjHAWJtIad9VtrdkS7a0QWFHPbt202argsbEbT9wkwwhFgUus6uRo5RpO/JmJuixSo6l4VJsLuz+06Wc/LRuSpO0nemnYQoI5yl8hzUXjG33YPYW5NOJUZcSJgAMVldrUdtR+Rs+wLl0Lbu7mca3WtkdTe5KK5E4spFCUtrZH7xzrq7HiWswuRIa6C/LSd3d/8AQROj1/2H2a5bd0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6G4HIKZbXb6js0wI8v5CdgEZbhQpocXRP7nCIOSh7g=;
 b=DNdCev34UcRnIqrIJACdSGELmaWtqLbu6Mij8tZDI537sq8AdXmVMr+USD38H342xLrPtisZZ/qrUzIOxYdZgQQgiKDf1CpQFInHNKHX6qa6PstIh/3aXnX6B57VGa92P3MIc1VZoQkORkYS3Bco+gK+pLzWuWxwsziE8QsWETeiww6ZuPe3/t8yMA4k2rtrQDwFFkrYjZLsnLU4R+kykhWr9NegbcLYZHQkegS4Qynfdm3jrR3T/LUPnMBBtz7Yn5oMEvYberBK/jC7zNQwiQgBmbYCL+sviRnhw06FlutTlp9w7WPwmz85FkDJjT4ns6jFCFoP0xZiEaDEwqTgJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by CH3PR11MB8561.namprd11.prod.outlook.com (2603:10b6:610:1ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Mon, 31 Mar
 2025 22:52:13 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 22:52:13 +0000
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
Subject: Re: [PATCH 1/9] x86/nmi: Simplify unknown NMI panic handling
Thread-Topic: [PATCH 1/9] x86/nmi: Simplify unknown NMI panic handling
Thread-Index: AQHbn3LZFAmzADb8pES5PKaUpLtJU7ON4CuA
Date: Mon, 31 Mar 2025 22:52:13 +0000
Message-ID: <192fb9f452909e722cf353cfc1bbea322e2f2cd5.camel@intel.com>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
	 <20250327234629.3953536-2-sohil.mehta@intel.com>
In-Reply-To: <20250327234629.3953536-2-sohil.mehta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|CH3PR11MB8561:EE_
x-ms-office365-filtering-correlation-id: 5e9d33e7-557a-4252-ba2f-08dd70a6ad54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d0VUQkpEeTlNMjBRSEFiZ1R3VklWSTJKNlRuSzdCcmd3UWdFRlZiT2wwS3lt?=
 =?utf-8?B?bmR2QU5MM1FsWkxNbmJIUWRVU0RiVzNmYmpscnFRb3pzOXhNZTNOTkVFRHg4?=
 =?utf-8?B?VFR2aDVHS1NXQ00yWHp1R0lRYnJwbW0vOU9TdDZyME9xTU0rN0VsV2ZqTFZP?=
 =?utf-8?B?eVlLeWtIcGdpM2h4WmZKaUxveXlDbzY2WHYxcnhrcGd5Q2M0QXQwN2MrQUVk?=
 =?utf-8?B?UTZ2S2o1YXlLNjlZL2pNU09KNFpVRENiSnFLdnphWGhHcmg2NHB3RDRBZTdO?=
 =?utf-8?B?Uk9RZXlIRnhBZk1jRnJ6djA2OE16RVpGZ3BMV0NDaXJOTGFoVUh3L2ZkUFB0?=
 =?utf-8?B?NFNNYUxMUHVKTFJZSXc0UVJCd0lZQjhucU5yMEF5NGFrTEZFMXdCRzJFeHYw?=
 =?utf-8?B?cCtWTWZ6K3MxQ1p1NjUzamdYN2VwRGdhTy8vL2l4OGcrYTBzMGVVamhGSVV3?=
 =?utf-8?B?eENmTDAxcDhFTVFDdEFndlR6WGw4VkRsSHBQU0tDaGpMYURsdU1yZy9QNlJ6?=
 =?utf-8?B?ZHlJRGtMaXlJWGZyMDFOOEdqMk1RbkZqNDhKMjVDSW5wTHR3V2JXVGhORkkw?=
 =?utf-8?B?UE9tZjNYTThGdDl2eEtwT3JQdUthQ0huNlFJQUNpN0w5SEdaM0dmbGZZcEx1?=
 =?utf-8?B?Ni81Z0M3cE93VHNmcnEyTFM1cHUxL0dLTmc2aEdnK1lVQzk0VzI3Tk1NZWtJ?=
 =?utf-8?B?NTlRak5XWmlEQm9LamNSRmpEVmxsbzFta0VrcWJmUEZsQ1o1cGtQRnZTaXBI?=
 =?utf-8?B?QnlXOTFBVDdhNit0TkNrb0FDRE81TTNkbWJLdUlXQllLVGFMRGtuSW1BcHV1?=
 =?utf-8?B?K3FPaDJTM3RPb0kzZGV1MGZCY091N1RDLzJsNVR5UkJwak5TbFREUEc3RFhp?=
 =?utf-8?B?ZXRTdU5VckNqbXpJbDJGcmQ1eU43S3NEeEZqR1daN1JadU9VV2tIb2hGTUNu?=
 =?utf-8?B?dmhIdjNwMVhTN0JuaHVrcXBXU0hBdVFWTUUzdGwzTVNWRXRwT25RM3ZBWGhv?=
 =?utf-8?B?SW50eHVGR0t1S3NLS2VKUGtmc0ZyY1VJb243dGJvZVdTNnRpS0txRjdhOWNP?=
 =?utf-8?B?NWtTci84NTR2TkZzS1FqSXlEUUZPQThLQmxpSnVHOFZWSDR1a0s4L0tuYnd0?=
 =?utf-8?B?bjJSd2lpa09veFh0a0dPL3dseDlyQVl2b1BvR1BnVktRQk1ZMmIzMUpwOUVX?=
 =?utf-8?B?N3VCOGhhNll5aklBdEVmeGhZbFdzekNsTFBRcXo3R2RZcEdGbk9LTUJzQTJY?=
 =?utf-8?B?YlpnVi9BMldmQVRpSFU4V2d1aTdKMCt3YlR5MW94TUJIV0FyVHI2S0dFNDRX?=
 =?utf-8?B?MW1TRnh3WnVSbzc5bWdjRzZqSGdvc1VRYWRHRHFJKzVKK1l1Wm9nakcyUHNs?=
 =?utf-8?B?MGpFbzJJbXZiNHZ1SUZtVWQ3RGtoU1NPT3pzbnB5MVRCQ1QrNDBqVi9rdmpC?=
 =?utf-8?B?SGlJTnpJV2gxeTFpNmZVTElxWWJDekRudzdvZlh5NzJwVnJnRHpCckExbzBT?=
 =?utf-8?B?M3FMc2VqWVl6Znc1MXJhRHp1TEc3MW4rZjM4R2ZBOTBiK1FDeWJEL1hiM2tW?=
 =?utf-8?B?bEJ2K0s5S3pkMUZ4WVR4MmlLNU9qUm1zVmZRUHE0OWs5RVIvYUNSbmxVaUNP?=
 =?utf-8?B?cE9ZT2V5WFlOcy9DSFc0M0l4Y1d6Ri91MlMzam9OVi80ZSt6YWNEYlVNRnJX?=
 =?utf-8?B?RVM1ZHM2Sm4vNWsrZENVZ082aUZaWmdnQ2tkUndVZXhaUCtMTE9DOEs0bzJi?=
 =?utf-8?B?MUg2dm1yUVJYSlAySWxkTW1GaGVidTBJNE15OE5CME92QU5xNC9kb3pmRDYz?=
 =?utf-8?B?TWRYS0t6MG02a0ltUDY4SnRLYndUWms3SytXdjliejhIZlRhWVhmSm16TzhB?=
 =?utf-8?B?S2h5QzY5WWI0bzBhTUx6SEg3dFo5dERkcUdKeDlUL1VXWGlNaEJrY1JFZDIw?=
 =?utf-8?B?TVVvM2UvVVdsb0JrLzlCSmRYZmdIU2xQR2pwb3czbFB4bTQ2SENRT0U1Q3Jn?=
 =?utf-8?B?QUVDZUM3RFlnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEhsdEpzR21vVUo5emg2R3ZwU0twUlZWaDJ2YjhSMzlpUm5VVTIxcVpKOVBX?=
 =?utf-8?B?bjJrcVBDWXBEZWZEV0xvcDdHUzdVWUp5UlN5MzNueFlzN0hnK1F6SlNSOVE5?=
 =?utf-8?B?cm1DUUFoV01pdE5WUG1xUWpnNWN4QTVtVHphWExsUHNXbHR3RnVxNHZrRjRh?=
 =?utf-8?B?Z1BaYlVIaVpsWnY0WjF5U2ZTQXg5N2Q2VkZkaFpqbUh6cEZUTURPNmRUNFps?=
 =?utf-8?B?dzM1bFo1SkNzR2FhTkFtSTVQcTNPSkNPYXdLT3lkRVNpNUZDTnVFZlh0OUxW?=
 =?utf-8?B?Mi9jN1dFNTFKVmhhSVZtYkVoSStmdzVySXNJNTdsclArVG9vcWNoSzhDM0Mw?=
 =?utf-8?B?OGVBMVZNRGRSNDBKZzA3VVArMUpXMUttTFVsK1J2dXl4QzlqeUorY1o0QkhV?=
 =?utf-8?B?YTNJU1NVMmVOOTVndnl2VmYydE53RHNHOUVGM01aV3FmZVdkV3IxallGamhS?=
 =?utf-8?B?WDJ2aWhXY2ZQdW1yVzFESGtiNlFiWW9iVTh5TnVQdjUwVCtQOUZibmNWcE5r?=
 =?utf-8?B?OExHMjR5MEhCRFlzUWFQSU9QOUFKSVB6SlN6OWt1dTI5VVJxVEI5VjN2MkdW?=
 =?utf-8?B?SThCMS9MRkdtRzNTUldkZFFXTndQWmZHSlBka2ozWnhkck90Yi9RVHdmOTVZ?=
 =?utf-8?B?YU51UVBWQzgvR1NBVDN6NUhabVJPSHIzTkY0QlJLREM3MHhUNnNEbWwxZnph?=
 =?utf-8?B?bGEwcTFwTUZMaU94bnNHSmtRVUZ3d2JPaC96QWdzWFRqRG5nd0V5ZWYyOHBz?=
 =?utf-8?B?S29EUWsyVWhqQmp5ZklvTXFocjZaRHJqZXFZWkVpNXVJdlB3V09nMWVGOEps?=
 =?utf-8?B?YVhHaDUvaEJUKy9WZGRVRzA4VFU2WmxjZzFsMzRmVytBQnc3Z2hsNFgrd0tw?=
 =?utf-8?B?NVBZcXF6VFJJTENOQmNWbVlraGZqVFdhendhUnZ2OHlRUUxla1JsUFJMbnBX?=
 =?utf-8?B?QUJ5bGhyWC9PTlNJc2ZpRVAvMk93VCswREQwd1VQZU9XZkVUMnNTa2xGazQx?=
 =?utf-8?B?RCs0UGhPdmVxVlRFTTNOdTlhblRmbXYzYjlmSG1RakdWUGxMU2c2ZzNURGov?=
 =?utf-8?B?V3NHUUVoaGZrM2tIZCt2akM1QkJXcENLeUlGeWNuUldNUnVqQUNhTnhIanB3?=
 =?utf-8?B?UllmU1hxRTRkUzBHVCs4N3pPRGlBdlIvZTNwZTZnTDNKQjZxaXpWeml0ano5?=
 =?utf-8?B?RHJadk5vemJaTUlBamNhc1ZPbm5CS0xNN3pMREp1c2FjQzAxV1dzVFNhNEpM?=
 =?utf-8?B?M1V0VlU2QUtKZU5tZDBXTlpVZTl3SUlGa3A3ZmR4cWlLQlVZR1BqS3ExNU9m?=
 =?utf-8?B?RnkzalNwUVZ5YVVyRkEwa2psWExrbkkrYkNqWXhnZkFRT2UreDl4NUhyd0FU?=
 =?utf-8?B?UzM2Zm91ZVBvN0MrZEZZcm1Va2l1Q0pWbjk4WWF1T0svdnpIRDNBekdnNHpY?=
 =?utf-8?B?MlFtWUpxa21FdmFCTmw0K0ZBNUYraitmRTFrclNINWhQUzFzeU5SeG9FQlc4?=
 =?utf-8?B?WklvKzByQk56M0NDNjE1bm5mVHIxWnNyS0dTRzVDTGw1QWpzMHRiNk9Zc3VE?=
 =?utf-8?B?cnlCVGpsNFdoMnJZd21HKzRuSkVlNlU2eTEza1RJMG1TeFk2c0R1d3F0SWhM?=
 =?utf-8?B?Yk15Y2hNMmxCc1EwYUI3azlFQW9zT1lCYk1RZ0dxY0FlTHJxV3lBTm9GN1Mv?=
 =?utf-8?B?dTFQWVIrazQyTWZQbjNGY1lIdVJZVDBuR2luekVQMG5YMklPaytXOWFhM2s0?=
 =?utf-8?B?YVBaWWVUdXhTa21sYVNuZE50VXovTWxmOW4rRm4ySjlGR1RLN1h0T2FKVjRB?=
 =?utf-8?B?RStnUE9nUjdmWmdlS29LajRmR3Bpb0pMLzR4V1hpdXhWZDkxL0NqQzVibHNB?=
 =?utf-8?B?THhna01XM3lYN1BUbEVLWlhuQzYrS1k0RXpkN0M4ckxOSm53d2c4cVlsT1Bi?=
 =?utf-8?B?Y0ExMEpVTkFFb3VPZUc4bUsvTy9YVUNJeVQzZjU2NStEMHFGblBBZVBrdXFu?=
 =?utf-8?B?SFNWWSt0SC9hTEdGb3NIV2w5a2JSRmcwR3oxaWNwZThRZENkcjVtWmRkaVZI?=
 =?utf-8?B?M1ZIcTZRLzFqcG52cVlpYVZ2TXI0V0Z5TjlKbjNKQkRRVng1anJNY29JRUJa?=
 =?utf-8?Q?D/O6N+fGYBLOdh/pa8Y0lJ5LW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D907DA9165C974891EE23776ADA8DEE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9d33e7-557a-4252-ba2f-08dd70a6ad54
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 22:52:13.1276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xqG1VqrqwtuVyY6ix4AKlsiWXpVpP8Qq35K1JfQZPrpB7uGHcDWgpVBZaw0RLXrjcobbOY4R7D/aw3CgkU9D1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8561
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTAzLTI3IGF0IDIzOjQ2ICswMDAwLCBNZWh0YSwgU29oaWwgd3JvdGU6DQo+
IFRoZSB1bmtub3duX25taV9wYW5pYyB2YXJpYWJsZSBpcyB1c2VkIHRvIGNvbnRyb2wgd2hldGhl
ciB0aGUga2VybmVsDQo+IHNob3VsZCBwYW5pYyBvbiB1bmtub3duIE5NSXMuIFRoZXJlIGlzIGEg
c3lzY3RsIGVudHJ5IGZvciB0aGUgc2FtZSwgd2hpY2gNCj4gY2FuIGJlIHVzZWQgdG8gY2hhbmdl
IHRoZSBiZWhhdmlvciBhdCBydW50aW1lLg0KPiANCj4gSG93ZXZlciwgaXQgc2VlbXMgdGhhdCBp
biBzb21lIHBsYWNlcywgdGhlIG9wdGlvbiB1bm5lY2Vzc2FyaWx5IGRlcGVuZHMNCj4gb24gQ09O
RklHX1g4Nl9MT0NBTF9BUElDLiBPdGhlciBjb2RlIGluIG5taS5jIHVzZXMgdW5rbm93bl9ubWlf
cGFuaWMNCj4gd2l0aG91dCBzdWNoIGEgZGVwZW5kZW5jeS4gVGhpcyByZXN1bHRzIGluIGEgZmV3
IG1lc3N5ICNpZmRlZnMNCj4gc3BsYXR0ZXJlZCBhY3Jvc3MgdGhlIGNvZGUuIFRoZSBkZXBlbmRl
bmN5IHdhcyBsaWtlbHkgaW50cm9kdWNlIGR1ZSB0byBhDQoJCQkJCQkJXg0KCQkJCQkJCWludHJv
ZHVjZWQNCg0KDQpbLi4uXQ0KDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvc2V0dXAu
YyBiL2FyY2gveDg2L2tlcm5lbC9zZXR1cC5jDQo+IGluZGV4IGM3MTY0YThkZTk4My4uYzNlMWFl
NzM3M2U5IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYw0KPiArKysgYi9h
cmNoL3g4Ni9rZXJuZWwvc2V0dXAuYw0KPiBAQCAtNywxMCArNywxMSBAQA0KPiAgICovDQo+ICAj
aW5jbHVkZSA8bGludXgvYWNwaS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2NvbnNvbGUuaD4NCj4g
LSNpbmNsdWRlIDxsaW51eC9jcHUuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9jcmFzaF9kdW1wLmg+
DQo+ICsjaW5jbHVkZSA8bGludXgvY3B1Lmg+DQoNClRoaXMgY29kZSBjaGFuZ2UgZG9lc24ndCBz
ZWVtIHRvIGJlIGFibGUgdG8gbWFrZSB0aGUgaGVhZGVycyBpbiAiYWxwaGFiZXRpY2FsDQpvcmRl
ciIuDQoNCj4gICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwLW9wcy5oPg0KPiAgI2luY2x1ZGUgPGxp
bnV4L2VmaS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2h1Z2V0bGIuaD4NCj4gICNpbmNsdWRlIDxs
aW51eC9pbWEuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9pbml0X29oY2kxMzk0X2RtYS5oPg0KPiAg
I2luY2x1ZGUgPGxpbnV4L2luaXRyZC5oPg0KPiBAQCAtMTgsMjEgKzE5LDE5IEBADQo+ICAjaW5j
bHVkZSA8bGludXgvbWVtYmxvY2suaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wYW5pY19ub3RpZmll
ci5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3JhbmRv
bS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3Jvb3RfZGV2Lmg+DQo+IC0jaW5jbHVkZSA8bGludXgv
aHVnZXRsYi5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4L3Rib290Lmg+DQo+IC0jaW5jbHVkZSA8bGlu
dXgvdXNiL3hoY2ktZGJncC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3N0YXRpY19jYWxsLmg+DQo+
ICAjaW5jbHVkZSA8bGludXgvc3dpb3RsYi5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4L3JhbmRvbS5o
Pg0KPiArI2luY2x1ZGUgPGxpbnV4L3Rib290Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvdXNiL3ho
Y2ktZGJncC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4NCj4gIA0KPiAgI2luY2x1
ZGUgPHVhcGkvbGludXgvbW91bnQuaD4NCj4gIA0KPiAgI2luY2x1ZGUgPHhlbi94ZW4uaD4NCj4g
IA0KPiAgI2luY2x1ZGUgPGFzbS9hcGljLmg+DQo+IC0jaW5jbHVkZSA8YXNtL2VmaS5oPg0KDQpT
ZWVtcyB0aGlzIGhlYWRlciBqdXN0IGdvdCByZW1vdmVkIGhlcmUgYnV0IHdhcyBuZXZlciBhZGRl
ZCBiYWNrLg0KDQo+IC0jaW5jbHVkZSA8YXNtL251bWEuaD4NCj4gICNpbmNsdWRlIDxhc20vYmlv
c19lYmRhLmg+DQo+ICAjaW5jbHVkZSA8YXNtL2J1Z3MuaD4NCj4gICNpbmNsdWRlIDxhc20vY2Fj
aGVpbmZvLmg+DQo+IEBAIC00NywxOCArNDYsMTYgQEANCj4gICNpbmNsdWRlIDxhc20vbWNlLmg+
DQo+ICAjaW5jbHVkZSA8YXNtL21lbXR5cGUuaD4NCj4gICNpbmNsdWRlIDxhc20vbXRyci5oPg0K
PiAtI2luY2x1ZGUgPGFzbS9yZWFsbW9kZS5oPg0KPiArI2luY2x1ZGUgPGFzbS9ubWkuaD4NCj4g
KyNpbmNsdWRlIDxhc20vbnVtYS5oPg0KPiAgI2luY2x1ZGUgPGFzbS9vbHBjX29mdy5oPg0KPiAg
I2luY2x1ZGUgPGFzbS9wY2ktZGlyZWN0Lmg+DQo+ICAjaW5jbHVkZSA8YXNtL3Byb20uaD4NCj4g
ICNpbmNsdWRlIDxhc20vcHJvdG8uaD4NCj4gKyNpbmNsdWRlIDxhc20vcmVhbG1vZGUuaD4NCj4g
ICNpbmNsdWRlIDxhc20vdGhlcm1hbC5oPg0KPiAgI2luY2x1ZGUgPGFzbS91bndpbmQuaD4NCj4g
ICNpbmNsdWRlIDxhc20vdnN5c2NhbGwuaD4NCj4gLSNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+
DQo+IC0jaWYgZGVmaW5lZChDT05GSUdfWDg2X0xPQ0FMX0FQSUMpDQo+IC0jaW5jbHVkZSA8YXNt
L25taS5oPg0KPiAtI2VuZGlmDQo+ICANCg0KWy4uLl0NCg==
