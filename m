Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD613B791;
	Wed,  5 Feb 2025 13:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763017; cv=fail; b=NaKaIfizZXqdu0cNzdtg+1d8vRiq1gkvQIhYWBSOcYWA420etsFWYeznMXczZLRywgyKGd6glX+H/N0EGKU5Nl+1CJEp62G/xb/jYX8xyfMj8QbvFm/uljEGfuD5cAcuagwMpU7BmN5U7obXzncAoxje1pdYj8Gk9wsXj1HTncg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763017; c=relaxed/simple;
	bh=nxdVOBpkm2SUVvfN3vuWuulFYptkpknyaChn8VyK7fE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i5nIgFqDY8YibWDwqddME/7n95IhI0EU7yN/5w7BK7XVtrpVnCQuVU7pYiSa9LaZ904sfDUC/bYN9HF6tyvEEd9OmbDX8nf2jTtAULAlvlevH5wWWB7HYX0Wl+vfRPCS2CVLOWp0ViToo00cU6gSI1Q5SfXxfFYWFvNv8ClYXbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBw1nPwX; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBw1nPwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738763015; x=1770299015;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=nxdVOBpkm2SUVvfN3vuWuulFYptkpknyaChn8VyK7fE=;
  b=EBw1nPwXMwakOGj8h3RyUrxSkYMLNVz2hZzWxZnoFxoRMC7mOWvOFLvZ
   ABELwJ9e+0ruKaK1wGBxqVEyJbpDoRuBBBWEiMDLUDX5AHfVO6v+z+HKW
   JOz4ghk030u64HOK3IoGGGuZEJrpV8l6o/FVkV8U9cN33eC+eY56JKQPs
   /+4vvoo972/CIIDwJtM3V7N0BvJu4pbuqHMIh+s1u2meuDfHmxnyIXLtk
   ALPPqCZJy9SLaMuyRXrAkS/+EkOCvJVyGyQQAzA84tXfZcpOKWiDr94RJ
   3r1Gz7aLSOW/FpvhQ7j2Bca8cidp92RKE/2fosysA38DadImndfg6CA0M
   w==;
X-CSE-ConnectionGUID: 4bYrNIFDR5KVd/8mba1AWQ==
X-CSE-MsgGUID: mF7DblGUShCymjwuo/IMeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49944160"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="49944160"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 05:43:34 -0800
X-CSE-ConnectionGUID: ihUd3giLRK2LPVNO0Kasew==
X-CSE-MsgGUID: xKh+TeTqSNWgrwlaxOYMRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110691560"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 05:43:35 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 05:43:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 05:43:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 05:43:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcReEoqUv4BBkBzBURJz3OPh0d5aI2n43pWU4pisuHTOQ1zQgnbfCZBq0Fd5fEtI5vhDVup8YdvOUBzVeElkEyFEqc943CMvabz0nQG6VTr4uPGf/2YuErIvCOOe7isX6JFJCMLmikXB+wCPMtmlQ5m7e5+xZeDgri7RP+Q7KY1i7ZBJrni5toR2lCxDnDmoZMyrq/dcrrPhXOkUXA06Y1UDMXz+dQYDfwQHxeZNMdivCa/f0tmGw7Mnnz1iBR49LMo+ieg04wYQbtsMVA7CtF7vj2QJeYUZOD9CkuKEaVqJATFwbG4GQ1EZRPNhzIq4rma2NwKQgVORDNQnXgi77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxdVOBpkm2SUVvfN3vuWuulFYptkpknyaChn8VyK7fE=;
 b=LwuCOR19NHRp+inWUahEoW1Z+O2l5NBK+TBFpttAIFY6sVlEeUodM4UtYJLJoX+PNTDpujPCFbV3KO9UKNFSpY0O4BEdsO0Syaotep1fLOBNp4OchIPXpwEjDZU95aTsOItq7ZR0BqCz+nTJ26W8g9uQjgjIOXhhHrqjVpEGFbqnJDs4wmKQG+gFrifF+RqwkJ0d8X5Z2GfbxeAyfCT7hSXIyRKvBC9XTD+I5uK9qTPAWg6kV3GRyGmgxsor+VE7wwrKvdrVWBgtzIj0sCf4Iv9nHdwMvd07X5GAUPqCLjn5mWU5OgAE4JYwPKLxZDqCzKO2obNGn4jGbBJbNs1PuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by CO1PR11MB4980.namprd11.prod.outlook.com (2603:10b6:303:98::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 13:43:25 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%4]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 13:43:25 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "nirav.rabara@altera.com"
	<nirav.rabara@altera.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] arm64: dts: socfpga: agilex5: add NAND board file
Thread-Topic: [PATCH v2] arm64: dts: socfpga: agilex5: add NAND board file
Thread-Index: AQHbd7cYzRoLaQ5yvU+3Y9XsRKXcAbM4k4yAgAAeo4A=
Date: Wed, 5 Feb 2025 13:43:25 +0000
Message-ID: <BL3PR11MB6532426A08A1C84AA971E6C3A2F72@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20250205101318.1778757-1-niravkumar.l.rabara@intel.com>
 <0f77480d-e93c-44e2-ae9b-615b2368a011@kernel.org>
In-Reply-To: <0f77480d-e93c-44e2-ae9b-615b2368a011@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|CO1PR11MB4980:EE_
x-ms-office365-filtering-correlation-id: c2403807-469d-4bcb-7c40-08dd45eb106c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WnJyVTZvMmRmdEJlbEdnODdwNGF6VngyNm1rVkJ6TlBoMGJjTk5vWlpLOHpG?=
 =?utf-8?B?VnQrV05SRlZHa1o5UzcxVzNQU3FLUkRhUldXMzZJdWxDV05HTGIxOC9zQUx0?=
 =?utf-8?B?ZVRQNnBvNFhEOWFoWkg2YjIyNkU1ODhURDByNlM1azVKVUtMSWNpNVRCTm9r?=
 =?utf-8?B?RW0zL1JjSnpGME8vMzFhc056cW5MYnB0YSsrTWFXa2owQ0M3ZkJWUkVXNXRr?=
 =?utf-8?B?VVpIYmNvTFhxQmNLaGdZT1ZjandzQ1ExRjhMSWFQU21tNFA3ZjNpTEJlKzNz?=
 =?utf-8?B?b2w4SkNLL3psOXNnM3hKdjJzR05neU5uVVdOLzhCUUZiMklORFFxQkVQMnJC?=
 =?utf-8?B?QnlHTTNWK2xpTmZGYVhyQTdUTTNNRGdzeVFLNnkxSFZwQjRLSkEyMGtwUnRr?=
 =?utf-8?B?VnNkWFlPRXJGYkdnVk95Q09samUwUVcwUGU3WnhPOWtEWjZnM1pCZmVrODBI?=
 =?utf-8?B?YVFMajFYTnNyVGtVS0h6dkpKMjMyaU1HVkd1YWtHbkVYR2tzQTZlV292Tjh1?=
 =?utf-8?B?cER0VzRVZVBLbGNuQmhKUjlQMUFFOUdtbFNQdHdIV2tLVjh1QUdWU1k2Q2VH?=
 =?utf-8?B?MTBjK25RNklLMlgwNElrSmZMcVVjZThUZzBwTlkwKzdURXYzeFdsMnBLSnJy?=
 =?utf-8?B?QlBpa0lvVFM2aHkveitxZWFIcDFuSmZWeHZaWDZ2TytyZzN4TFJna0dCcEZZ?=
 =?utf-8?B?QWRjUEM5Sk1udHFvOExkK0xYM1B6Q0M2WFAwUTY1cnczMk52cHpXMTAwQ1JJ?=
 =?utf-8?B?NGNpUERrcFQwQk1lUWZReUZ0VHFWMDhDQzJSVUNwVDlvalVFMEVSNE1xMDNk?=
 =?utf-8?B?cys4OHdiY3R5L2p2ZmF4cS9LakZpUEFKVVY0Z1RXd3pibEJIYzJvUFpXMDNT?=
 =?utf-8?B?dU1IS3JCVlphaDJsSjhuL21YY1F6YTVMNHVxYjJuKy9hdWxZTC9CSlVyV0Fp?=
 =?utf-8?B?VjBEZW5SNTdsM3hLSE1SczZPNHA1aWtVL1RMV3RWRFBtNWFjeTZjNTBqU2JE?=
 =?utf-8?B?NGRMOFpmVmRhYjVJT1lmVzdLU1d1MHN0L21NMS9DMHFjOWdaM3pUTm4zZ0Q1?=
 =?utf-8?B?eW9mSzgrNGllTmZrMXlZNmRINzhyaHdoK3hKbFhtRi8rZjVzL3FCN1NXbmpG?=
 =?utf-8?B?d3F5SWpFcVQvZEZCVE9HVjVWQXAyNC9XVzUwWFIvMlRVNzA2cVdnejZkbGQr?=
 =?utf-8?B?RVBhRTFXUHFKc3RHSFZKK1prN3IvUmFSRVpYRUg4dFkxK1hmYjlWd3MySlgz?=
 =?utf-8?B?SEJBUTJKQXN4TnVsUHpxSmUweURDTDVRVmVxeVNhTWViOHFZclJVN0hZZXVN?=
 =?utf-8?B?Mm02eU5kSHE5MThKdkdBM21rcHdYK3Z3S0RjVjhLWkoyWlpJUy84M3JJWjds?=
 =?utf-8?B?SUQvOHkrR3lOWEZENmEvMVZZdUpVRHlQUmdpRHMzUlQ3UFFYWCtac3dCY0RR?=
 =?utf-8?B?eTM4YndKcE1lTVlsNVdGRE9vT3Y2MUtQZEZrclViRGZqNjlYSG1SNE5JbDBv?=
 =?utf-8?B?Q2J0eHp5V25Sb004Z1NMWTB6dmo3aFRWR0tGVlBUV0E2a2M5RGljcGZydE9O?=
 =?utf-8?B?Wk1vOUJuS3FvbmtZemZYMVRCVFJYUFpTYzdETUlqWUpuRnY2a29ET2V1L3Nt?=
 =?utf-8?B?aktFY0ZLay93MFBGbzdsRGNDNVd5eVdBRlRJNEZVNW5WVmFOalhJazVqMVZD?=
 =?utf-8?B?cWxhWlc2WEVUZW9ZaFBvdnpHNUFheGxQYnpaRjIxYW95SDBYVUFRQ0xQNElT?=
 =?utf-8?B?dVN4VjFLK3U2NUhZU0NPVDVwS1JGajl2MlVYTUdOMWU1SU1lRnRkVVgvamt6?=
 =?utf-8?B?SlpOSGRZYXpCUnpjMGFUMTBlU1BITUFxODRtMVZBd2E0cWhmWEdkbEtBZTZ5?=
 =?utf-8?B?LzJTcGxvTjB0RFkxUU5TMERXeGxROTFncmFQOXJwZU1vZGpBb24xdHkrdVZR?=
 =?utf-8?Q?LuE8hsi0Qy0VUylUX6ujeaEyrCqY9t4S?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFpZUHR3RHZwaml0ZmRCT3FiSlpaS0VRdFdoRjUxUnZyUktUUmxLNXIzbWtL?=
 =?utf-8?B?WVZzZlJOYlRaczNyTkZEUG5yUWI2N0JiaHlNTnB5S2dRMVJ5dlRMUEJDT1ly?=
 =?utf-8?B?QnF1ckJtTUZkbXMrNzFpMGtENm1wSnRKL1A2OSsvb2hzakt4cU9nTnBKb016?=
 =?utf-8?B?OVBnWDMzZTh3TU1mZk9yWXc1WG5VS1BPSVpEU2RpS3UrVjZySi9zb2FwYjJJ?=
 =?utf-8?B?YXg2K3FXTWkzbmFwK0lYd3BXZHljeHd4OHkyazYxYXVUd0JXY01oSGJOVmdj?=
 =?utf-8?B?Q2Vta1R5d2ZSYnltTWJ0bWt2dENSbEIyYkF6cXFYbEE0R0V1S1BGVUE0SnIw?=
 =?utf-8?B?YnFiOVZPMldQa0RBTnJHOWtuMVNQSFd3Y2E0UHZXc2VqWmRZcmxxWVVtZEdu?=
 =?utf-8?B?VE90QWdiZG1jQldDRjRaY0c0VnBjQVU4T0kxaHN6all4QllTUVk5TWFsMFl3?=
 =?utf-8?B?STY0bWxESUlDdVJjRlB4Wm9EK3NYNVUvLytaNnREaDVFS1drNVViVmhXckIx?=
 =?utf-8?B?UWpsY2JjOURlbHdSclcybnVoVEV4ZCtaVVhtamhpejhzUUpXUEVmRUphQ2JU?=
 =?utf-8?B?b0J0T2JOaitMWUJvbWx3ZitFUEdHcU1FWkMySFF1bjVQY1J0WkFlRTNicXN5?=
 =?utf-8?B?TGVIMjZlRE1aMFFDNDdyK1BaSE9PV0VVQlVVUytuNUwzVk5OTi81VFlndmpY?=
 =?utf-8?B?SFBXZStwMzlSM1hpM0YvenorN1U4WkV3RnlBZHBCVXFQLzhmTFdEdTR6TmVS?=
 =?utf-8?B?eXQzVDdWMVV6YmN0N0xrcUY3TVhxT2Rib2JQdXBtR3QrQW1Bak5DWUFUc3Nt?=
 =?utf-8?B?Z3pTWExVZDJMTlNyVG9wazlMTnpNTGRBWWVxRE5oa3lpTDhaN3lKdEhvcEpv?=
 =?utf-8?B?UVlueVpTdDZWQVJpbWJtOEk3b0NPbVpIcjFqVE8vL3dSZVBCRm9ybGpNYk5i?=
 =?utf-8?B?eDJhaGxjV3dmYllDS2F2NWhUWFF5bVljaHNuSFVoMVNUSWVESVdZWDZja1Vs?=
 =?utf-8?B?T25IL3MyU3NsbVZpN1ZSUk9WN25qblFtVXFFcSs3SlNRdUMvSklqUG9RUkVF?=
 =?utf-8?B?OEtvTmZwNlVGTzlkODBRbU50dENvdUlVWkh4aklNTi9RV0pRR29BZ3ZscjBo?=
 =?utf-8?B?cy9mdW5lVnFkMGhubk5SY3lFbXJJbWlrOHQ0Yk04WDU5RjdtL0ZleDc0citJ?=
 =?utf-8?B?YnB4MnVPVUtIYm5reXAyNkpmTWtHOHBocVJZQ3cxUlp2emo0NGI5NFZrMWY1?=
 =?utf-8?B?L0dxa2doS1ZYZ0dLT1dyMmsvUTh5b2JZUTdqRXRqajBTQ2ZhdDB6R0QvOW9M?=
 =?utf-8?B?dFZNb3RHYm1LREdnMEhHcm1sTmVUNllxMnVVd3psK3pveGVWTGtjWmd5MUZ0?=
 =?utf-8?B?UmVkeE9EbExOUmJpc2VRRVFYMlJRWnJwS3AwQy95K0Q3RzJiTjZEcmlEVjND?=
 =?utf-8?B?cXB5QjErM0tWUm1lTG9KUzg2TTcraG5wNnVoRGhkQmxYd1h6UEJmZDlxb3dE?=
 =?utf-8?B?VlpldXBaOTRTNmxEa21YMjBvbXNKUDRiYTQvV1d0YzZCT095Wk9TeVh2NzRV?=
 =?utf-8?B?TmhFNlZZVCsyeENPMHM2eXpFOFFMbERqM3BYdThDWmFoR2xzSmo5VGM2ZWIx?=
 =?utf-8?B?YlBabFRyaGZPRlpWcUVHem82emtZUmpVNjYzVEttMWpDN25Cc2YvaitnM0R0?=
 =?utf-8?B?RUMwcjVYZGhZQTNDV0VOVmFOblZiTWQxQXVuNjVEdThNYlhOSk1kQmdhYkxT?=
 =?utf-8?B?NGF0Qm1lSTFTUk05aHVrYzlhWUthcktWUnFJYlNKY1I2OFFWbFY5RmRYeEYy?=
 =?utf-8?B?ZVM3aXBabHIzWkptNitqMkdaMTk3TDFHNHZUTHJJM3JRYVI2UTBKMXoxS1VR?=
 =?utf-8?B?MWhPbVdYMXdtUDIxNGEvWnVLRTFJU0FWSVVNejVmUjk1RStwUjhrYjJLdkJK?=
 =?utf-8?B?cWs3WFdaWU8rUitOU2JHTnlYTlk3MGRRS0Z6ZlBHejlXR0ZTWWQvYlJic1pu?=
 =?utf-8?B?eHlvWkQ2dXd4K0JkbXhBQTNtcjRXY3krd29QaDRHaHZkOGw2K256Um5BRFhk?=
 =?utf-8?B?Wm5rcksvRi9jV0lVWW5UUWFIc3Q3V0dobnB1ZG5OaUFVSEpWRkJOSjNMcjhp?=
 =?utf-8?B?dXdaMml2akpudVhRdjY4UU01cU80OEhoamtHaklEd20xc0cwSGY3MHhPZDNs?=
 =?utf-8?B?UVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2403807-469d-4bcb-7c40-08dd45eb106c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 13:43:25.1481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5j0fi91Mv1N6GguLwZr0TBBx/PQBtQJXhI0fWJkboXjPmSG+p4pdkb21b9p8fTLEkLr4KTlE2KA+uIbmJorpKlIdVJBzwz7Jy+BHxPfmUDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4980
X-OriginatorOrg: intel.com

SGkgS3J5c3p0b2YsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIDUg
RmVicnVhcnksIDIwMjUgNzozMSBQTQ0KPiBUbzogUmFiYXJhLCBOaXJhdmt1bWFyIEwgPG5pcmF2
a3VtYXIubC5yYWJhcmFAaW50ZWwuY29tPjsgRGluaCBOZ3V5ZW4NCj4gPGRpbmd1eWVuQGtlcm5l
bC5vcmc+OyBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3Nr
aQ0KPiA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwu
b3JnPjsNCj4gbmlyYXYucmFiYXJhQGFsdGVyYS5jb207IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYyXSBhcm02NDogZHRzOiBzb2NmcGdhOiBhZ2lsZXg1OiBhZGQgTkFORCBib2FyZCBmaWxl
DQo+IA0KPiBPbiAwNS8wMi8yMDI1IDExOjEzLCBuaXJhdmt1bWFyLmwucmFiYXJhQGludGVsLmNv
bSB3cm90ZToNCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9pbnRlbC9zb2Nm
cGdhX2FnaWxleDVfc29jZGtfbmFuZC5kdHMNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvaW50
ZWwvc29jZnBnYV9hZ2lsZXg1X3NvY2RrX25hbmQuZHRzDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmNjYzliZTJjZDdjNg0KPiA+IC0tLSAvZGV2L251
bGwNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4NV9z
b2Nka19uYW5kLmR0cw0KPiA+IEBAIC0wLDAgKzEsODkgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6ICAgICBHUEwtMi4wDQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCAoQykg
MjAyNSwgQWx0ZXJhIENvcnBvcmF0aW9uICAqLyAjaW5jbHVkZQ0KPiA+ICsic29jZnBnYV9hZ2ls
ZXg1LmR0c2kiDQo+ID4gKw0KPiA+ICsvIHsNCj4gPiArCW1vZGVsID0gIlNvQ0ZQR0EgQWdpbGV4
NSBTb0NESyI7DQo+ID4gKwljb21wYXRpYmxlID0gImludGVsLHNvY2ZwZ2EtYWdpbGV4NS1zb2Nk
ayIsICJpbnRlbCxzb2NmcGdhLWFnaWxleDUiOw0KPiANCj4gDQo+IFlvdSBjYW5ub3QgdXNlIG90
aGVyIGJvYXJkcyBjb21wYXRpYmxlcy4gRGlmZmVyZW50IGRldmljZSwgZGlmZmVyZW50DQo+IGNv
bXBhdGlibGUuDQo+IA0KDQpTYW1lIEFnaWxleDUgZGV2ZWxvcG1lbnQga2l0IGJvYXJkIHN1cHBv
cnRzIGEgc2VwYXJhdGUgTkFORA0KZGF1Z2h0ZXIgY2FyZC4NCkRlZmF1bHQgZGF1Z2h0ZXIgY2Fy
ZCB3aXRoIFNETU1DIG9uIEFnaWxleDUgZGV2a2l0IHJlcXVpcmVkIHRvDQpyZXBsYWNlZCB3aXRo
IHRoaXMgTkFORCBkYXVnaHRlciBjYXJkIHRvIHVzZSBOQU5EIGZsYXNoIHdpdGgNCkFnaWxleDUg
ZGV2a2l0LiANCg0KTWF5YmUgSSBzaG91bGQgcmVwbGFjZSB0aGUgIk5BTkQgYm9hcmQiIHRvICJO
QU5EIGRhdWdodGVyIGJvYXJkIiANCmZvciB0aGUgcGF0Y2ggdGl0bGUuIA0KDQpJcyB0aGlzIHJl
YXNvbmFibGU/DQoNClRoYW5rcywNCk5pcmF2DQoNCg0K
