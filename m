Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E7119E97A;
	Thu, 29 May 2025 01:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748483184; cv=fail; b=Q10063ediBlZCfDNAMFX/o+3HSF/vDYiqR4hIWKfZrgArvlvWNi/FyNWV+KE5Q0WBQLDDjkdxM0HKsMON3k/eFD1BmsJ/TtlWEoNW41IIJ7Tzez2GmHHU40YB8ubJtSDn20JNQUdUWYAeoyz57vGjiZN07zwzMeLksYN3UpdB4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748483184; c=relaxed/simple;
	bh=lUfWmVfzLtpGhbYMicU/hT/wrQg4JCYou5wQ+Jklyps=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cItHgZewPP3KGZrECwhug0pj2VgUVlkPnExM4ydUizUdfCQ8YCsNWgIR+tM0SCOSrn+YlaeOhWwTDeEhwgd7sO4dcy4b3nWErQs5X1UdUyYk+OwFeyBqzEgUN8789vKu7wNMvgvKBiEFtPqYYDffgbJkWoMxQQtLumQpT6fOKCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T1ZIvN012157;
	Wed, 28 May 2025 18:46:12 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u9d44qam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 18:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cg6Zha5ZX6VagBO2ue3fOdQkXFeWsVO9Oy8ReTsgLssjuAbyLpMr1A6JF/uoPJg5IFy27rq0ZdCYmYii0JfVKYd37VnuxGZ/G6AjBlzjfg1yyKMHvbXW6WEfIe0fu3bPA7v/XkuYN6cjVc25xw3RnG9DctyxNz3bp8Jk7RfTsVJawS7Ih3wc6n2p9LZuoMZxm/5oYjAnLnHS//930vKVcX/DvAIQyYyjkY0cshCWzTjdusunEkIOBwPQzK321ezVOTc/yLgK2ycuSlKo5gsNPyBuHr2HiBEGDut5cApPe83xZ5jUUpJiKEQcxein0lMNoD3ptFSoBq5jl7X4PatuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUfWmVfzLtpGhbYMicU/hT/wrQg4JCYou5wQ+Jklyps=;
 b=it6N9QnRQK46VH/dKlig66aqvT40jTMe82MWBih3ipRmoaYMB/uc18wLaHaPS8os9hXv3LMXaSB3XDeGhzogZRzLJVlFI5kZr99Uz5lnMFppt9RHetqDyA7YpxEIptkK/V1L/iTTbeDRyYi1ZbETc1EvwFy8sU5kTplDncnlq3LJ2VM+WphsXDbR0I6WFgZWk384cIFxGqs9vsxL6+fFXbW0eWPiD+bYjopWHyAqVrNfRvfdY3QaEBg/se44cXRlpDeDTk4LIqrAstN5rJ28DFbhC5tsKiCMIdHcx7lSIGHlxyYjB/zYuP2g9VOZndaaZK/noZLDpppqbmzhpR4RWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by IA1PR11MB6369.namprd11.prod.outlook.com (2603:10b6:208:3af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 01:46:08 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 01:46:07 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "shawnguo@kernel.org"
	<shawnguo@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Frank.Li@nxp.com"
	<Frank.Li@nxp.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Thread-Topic: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Thread-Index: AQHbz8I6xeJIfWjuYEeXZYWwyKzMCLPn8x4AgADhfrA=
Date: Thu, 29 May 2025 01:46:07 +0000
Message-ID:
 <CH3PR11MB8773E069E089C4450E9AF45FF166A@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
 <960907ec-61e5-4fcc-9980-7df1d533cd77@kernel.org>
In-Reply-To: <960907ec-61e5-4fcc-9980-7df1d533cd77@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|IA1PR11MB6369:EE_
x-ms-office365-filtering-correlation-id: 36da27dc-9b25-40c9-6b63-08dd9e5294d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dU84N0xSdk9xZnN3SzQ3YnAybXZlbWpnZVgwL3ZPRWo0YVBwK1dIeXpjZGxQ?=
 =?utf-8?B?N1p2ZFhKclk0bzUyWkhKUERMY2tuQ1hvMnlhblc4bUZ5aEtIaHRTbGl0Tmli?=
 =?utf-8?B?cUJWTkZzZWtERFdHSVJCbXRDeXBBZkhVSFgvK0N0ZG1zbGVVMmJydWJ0UVF1?=
 =?utf-8?B?ZkNmRE9Jc0srdXZmSW5TbTVTUi9qTlY0SnczdmIxbUxhMFRnbWJneWRyVHRO?=
 =?utf-8?B?VnBPaW9LcWd3bkVjQUE0YmYraVVFVlFneU83b1lpM1JEVXV5MHlnQ2FaNHc3?=
 =?utf-8?B?ZlcvakkvYkpUNHNwMnlyNzZZUUFIeTdCT0VHTmJGN1lMYTJoRTNxUFgyU29s?=
 =?utf-8?B?ZHZFV1VLV3AwMnV4ZmkzTjhlb0pkSUZqZ0RldzlkNERqWkozNkdpdFBBRTBq?=
 =?utf-8?B?cjZEQ3kzWURLK2Q4V0xTWWlEQVVDZnR1UlJ5bVVIWHdsRUwwcDVaQm9iU1c3?=
 =?utf-8?B?N0tGcVhzbm9CQzhpOUhERUlVeG9oci85eUNPTXFBTVJNWDdVN0pTbFJQU2kv?=
 =?utf-8?B?YzBMdTg4TWtmY1daVWI4ajhMSFRJMVVLR1NIR3UyV0plNllUNlRQNDdlbEtB?=
 =?utf-8?B?R3RKQVRZSERMZXpsRUM3NGRwcENZWndrQk4ydll6K3VXa3BqS2h5M21VOVFF?=
 =?utf-8?B?ZTZYTERJYzN4cWhwaytYalIxWkI5TWFWRklIczBOS0pJTHFoSXVrL1Y5RDdn?=
 =?utf-8?B?MmtXUzFnQndrOE85bncvcnFWNkM2UHl4STV5UVFJNTRDTjJFMHFONml2UVBh?=
 =?utf-8?B?b0MzZ1VhRjVnRFlUeHJ2d0RURTNoM1hGSXZPWFR2K08ybW1GNVFLT0t3cTFX?=
 =?utf-8?B?d1lHdGN0cElPN01Kbm56R0pCQzA2WGt6K0VDSWwvdzBwS1ZqNDZZMXJnUjNo?=
 =?utf-8?B?S0RiYnpmTVNPSzBENEtJWHNXM2pqSzNvbER3VGM5S0swZ0hPQzl4T2ttZGlY?=
 =?utf-8?B?R2FMNkVDeXhQMDBMdkxON2o5UmF5bHgzeXBTK0dmTVBsdjhmaXZZcTZPY09U?=
 =?utf-8?B?RkxRakgwNk1IcjI3MkYzSDFibW1VUWJqaUgzS1ZXZEg2UzZTY2xtdmdhVkIv?=
 =?utf-8?B?cnhobUdkcU9DQmhRQXdDbkZrQXdrZ2w5SWhQeHFIbHdjQnE2TEoveG9WMGhD?=
 =?utf-8?B?VTM1OUtwelBxdUlGV0k2RmdHajE0TFJrcU1XUWFyaldlRlZsUnliQzJHSXhE?=
 =?utf-8?B?SVlWcDVYK09id0hlRTBuTDFpV3RXVVdPU08xd0dZd1M5RDVDVHZZSTNlY2Rh?=
 =?utf-8?B?WHgxbGFxUlo4cTkvWnRlbXdXY1FQb3ppYjRQVnVtZ3pDZWdiaUhNR3M5UkJ2?=
 =?utf-8?B?UEhiUW41Y2EzVVhreEp6ekJGd3FXTkNvOUxYUlMwM081ek1uMlVVeWx2bThr?=
 =?utf-8?B?TWRuTWFyM0pXQ2JKN25LZHgxU3VUV1F0MlhQL1kxVnlZSVJvYjhDcmxmL1Fu?=
 =?utf-8?B?cTVDWS9aWnpGTWhabjJoZ2JsMTdFOVVCNnYxWjJ5VXA3WXJMRVF5NUYyRjRk?=
 =?utf-8?B?c3ZZNGUvL3lFWkFvVytsSmh3WEhydlZqR0hRZFRGckVQZlFvVzJNSXZ5VU9v?=
 =?utf-8?B?cTlCQzIwa3hHa1h2VHIzSmhqZ3pvUWdyV09ERHloKzJmZk1rcU15ZnRMWkRh?=
 =?utf-8?B?eGJ1K2gxMGd1TldXK3VQWDY4QUF3MVZ1cGN1bmJPdFBSb3hUYUxHZlozcjk0?=
 =?utf-8?B?QkNoY1pTY0pNMWVXOXdEYWJMYkllSUFJMkV5dXFuTmVIY1g3U0hVVGVrK0Mw?=
 =?utf-8?B?OXQ0enEveTc5Z3l3bzJrbnRlUlZyTEhqdzUwYndxcStneEJ5VmMwM0RDVndY?=
 =?utf-8?B?cC95TXZuc25KazErVU51ZHg3M0l1TkVpN0pQK1lKM3BsRGpYZW0rNzJLYmJV?=
 =?utf-8?B?NEE5elV5R2pOcnNyOVlKWTNoSmp4WmU4ZUZVUndxN2NYaHBkeFB0VzVwSDdw?=
 =?utf-8?B?VjBFYXF4YTN4Mk9DemRaZVpWQVR4dWRQRmpoa09ZZHIrL3RWS0wzWnNkYVBz?=
 =?utf-8?Q?7JZNE2/U5qnqyqXU+r6w2Xoz2Tst/c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cndDOURDNU5GeVJONkRIRm9uZTdST3NLSk92ems3QWdSS2lPTGc1OGQ2M1JN?=
 =?utf-8?B?bGQxZzM5c3YrMlVsaXJlUU0yMlVaR0NTT0ZSdVczNFE2NlFIbmxjQ2RPOVdI?=
 =?utf-8?B?Y3JRVURmbXRHSExZUEtyOXd2dkVlaWxVSFJtQWc3TDRONnFtTlRCd25vbGdL?=
 =?utf-8?B?THFrTTE1QzhxV1BzTWEyWXp4MzdsWS9xOU0ySWtNclJ2OExzSEk3SW1zcHZR?=
 =?utf-8?B?eWVGOTlveVBJdlFZWmdaZTNVMEE4SDJjRmNPcDh6WkhZYy9xdmw3UG5haXI1?=
 =?utf-8?B?bTROcUhiNy95QmQxSGVKWklKVDZBTzBZTlUwdHpiV0xBOG1VZjk3OUIxNmgy?=
 =?utf-8?B?citiVjVCK1p4bTlyTTNkK1Ruak5GQk1nRUdKZDZ5NHpHYzVGUkYrZ3FtTE9t?=
 =?utf-8?B?K0dObnBUUW5TR3NpMmJ4ekJtYzdLTk13T3lHVHFQVUw4eTdjUDc1RGhaS0FX?=
 =?utf-8?B?RTZva2hELzFrbUNHRUJabjM5Z2tjSTEzSGJ0emxkQW1sQzQ3R3k4djdFTFA5?=
 =?utf-8?B?S3NoeUpwVXF5QThRSFFURk9DeDlYUTg1TUN3Mnc0WEJzQjZnWnMwT2ROYm1s?=
 =?utf-8?B?bEl4WmVPb3FBTElDMVFUOU51SnVjQUdTTm02dEppUitKd0hwQVMvQXpRdHd3?=
 =?utf-8?B?dVZnQ25ONVkrUXFuWDllblVSbWpQSWluTkFHTzJWVm8yRWZ2a1Z4cExldjhC?=
 =?utf-8?B?ZXpzYmtWNUU1bzVjNE1rdHZCMEhFTDBkVUlkQnNaYVFCb1V0Q3V1YVdCRTF0?=
 =?utf-8?B?eC93UGJFY1p6anhocEEvcjV1Um5LNzhFbThSb09TTWd2ZnBGaS9zWW85Zldj?=
 =?utf-8?B?UUg3c1VBLzNIWXJmelMwc1ZBekZGQXo4U0ZrejdYbmkzRitwYXNSaUlZUGpE?=
 =?utf-8?B?WGJ4UHFVOHRqVXZ1Qzh3ckg5N1AxeHFyb2dVWCtlb2I5R3dxYVdmL0pvUnpN?=
 =?utf-8?B?L2RvTFdRY0h2aHFWMmx3ekM0VXRNVHpmSU0zN2RXNjZ3ZUg2S05uK08wTVV4?=
 =?utf-8?B?akdZZ0RhRWdTQk1lcnhSS2dLeCtKcFNRcCtIeXZSTmhQMjZ5VGp1akU1ekUy?=
 =?utf-8?B?YjNuY2ttNkpvMzY5TUtCNjMvQlZBSnpNN091WU1NOFpkdXRNZEZ3QXkrVnJi?=
 =?utf-8?B?MFVRMGJiL1I3Y0h5cU1jT1YxdXp0cDBVOFd2dzNZaUQ3ZytPOFhvTnpteENH?=
 =?utf-8?B?NzhsUGJ3ck5IcE4xNjNOQUhMaHp4WVdEUnd3UmtVNEFTcEc3eVc2S2hWWmdG?=
 =?utf-8?B?VUVYQ2FsYXFqV1RCSnJjdDU0Z2FJUmNuR250bkVKSTZBOW9VOWxSeTI5aDhL?=
 =?utf-8?B?cytUU0k2c0I2OXlpaURRYnhkY0Fwa25EeEU2RHJMN0kxSUZ3VU1ua1NqYTZJ?=
 =?utf-8?B?OWZLUlkwT3FHdlpoUlFRUFNwT2JuWURnSmJlb1U4VEZwSmxVUW42UnovVi9T?=
 =?utf-8?B?YkYrTk9WMVAxUjJvQ0pLZWxHQmpnS2hRNEJzZ0xjNHhrQWpFNTVJT2R3cTg3?=
 =?utf-8?B?U0ZmNlRyUlczamMzYmUzZGZEZGZ3Z3J4TE1sSS9YSUZNK0JIQ2hEbmtDdndp?=
 =?utf-8?B?blM2bEozVS9KL0ZNVFNVMDc2SklhY3E1ZWV1VHYrVlRHWWRRaXlvMWRia3dU?=
 =?utf-8?B?ZVBpWTFFNGtJUzVZREwvcXprampuWlRTcVU1UzJKVS9NdDdvVlczWHE2WDhp?=
 =?utf-8?B?d2p4SWZOenBFNGdwd2RycUJIUjNGaEdsMXE5eFVUQmNhNksrUm1kb1hNdWRt?=
 =?utf-8?B?UUlVc1Q2R1ZnMWhSYUV3ZGdXeEEwWmJZQStSRGM3bmJCcEhRMW40UlVKVEhD?=
 =?utf-8?B?Ym5XV0VFUnE5UmpzVFJyb1JvM0x1MEU3c0d2Y0RnRW5YYjN4WEh3aGMraEx0?=
 =?utf-8?B?cW1NWVZSa1V6Z3p4WktOTHBTN3drVDdPelY4ZVJPV01Vc29WdEc4eFE3TWpP?=
 =?utf-8?B?NWpTLzFURlJtcStnWHR5TlA1d1p6TXZsbEk1UnlJUEZreldoU283REhTbHpE?=
 =?utf-8?B?dTllT3dUVlpVd1NNRjloUXU1OGkyY3dmZEx2S0E5SWlUZUVlVk5pMU9hek03?=
 =?utf-8?B?WWZXY0xnaUlUWG1mSHpMNVhWeG52VVFxUC9DdnV5S0lGZTV2bXprQ2F5a3RF?=
 =?utf-8?Q?826L4itmA/a9sLPcaeE9LmPlj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36da27dc-9b25-40c9-6b63-08dd9e5294d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 01:46:07.7708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uT3f4UVjUci3wYQJQNYGbuPaa6SaTYHkBr51QpmwXyLiAxWGvrauk+CroK9JxnL+kXoySZra7TMrHyiFE5xApw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6369
X-Proofpoint-GUID: HaRigvnuYslNNeyIO5IhVrq87y6-hx3H
X-Proofpoint-ORIG-GUID: HaRigvnuYslNNeyIO5IhVrq87y6-hx3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAxNiBTYWx0ZWRfX8qY1zXIqUT62 TXzlO5aqCighfzYxTNt80BBKljipYZQx2+mDx+vmnSYXvgjx4YhOVUmjamv3X6FLM4UQ835iFVA 6j9mCoEyHIN/YVY8U+VMXDfPf2jWvJ0RYOUru52YHLBrCnn/9uPxvU/7oaMllQZDDqrXbP2Z3n1
 DU7VdyKF6Pdc0lP82fFPp1QwbFjqwmR2VkL7J3nk/hA4+4rekZVfizhfhJa0uQZ+NX8lGT1MzHJ 9pp29ppwKDdHn9oVI3VHXAQJ4t1GSo66UiVTs4fnRNQEHOD5g3rh0WvY6vDVKk1sIL2AU4ri0N4 b9cz+QBgfj3RvURuJPRC6BxLiRiZRFhb/yM4P57/kYXTpMuNkc7nZNxfld2yacKsUh93jb1XRex
 L2pHAedDA3RTCQ9+dUI0gFj5sast1r2txJPmXBDbTqVrjHIMTNr7X4wSJ7k+Ig6W4L1pjEcD
X-Authority-Analysis: v=2.4 cv=fdCty1QF c=1 sm=1 tr=0 ts=6837bc64 cx=c_pps a=08oXzaogWWciT2Q7DnPvDw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=8AirrxEcAAAA:8 a=JfrnYn6hAAAA:8 a=bmcFerI9sT0AXqtmbQoA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505290016

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAyOCwgMjAyNSA4
OjA5IFBNDQo+IFRvOiBMaSwgTWVuZyA8TWVuZy5MaUB3aW5kcml2ZXIuY29tPjsgc2hhd25ndW9A
a2VybmVsLm9yZzsNCj4gcm9iaEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOyBGcmFu
ay5MaUBueHAuY29tDQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVs
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcmNoOiBhcm02NDogZHRzOiBhZGQgYmlnLWVu
ZGlhbiBwcm9wZXJ0eSBiYWNrIGludG8NCj4gd2F0Y2hkb2cgbm9kZQ0KPiANCj4gQ0FVVElPTjog
VGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCENCj4g
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25p
emUgdGhlIHNlbmRlciBhbmQNCj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gT24g
MjgvMDUvMjAyNSAxMzoxNywgTWVuZyBMaSB3cm90ZToNCj4gPiBXaGVuIHZlcmlmeWluZyB3YXRj
aGRvZyBmZWF0dXJlIG9uIE5YUCBsczEwNDZhcmRiIGJvYXJkLCBpdCBkb2Vzbid0DQo+ID4gd29y
ay4gQmVjYXVzZSB0aGUgYmlnLWVuZGlhbiBpcyBkZWxldGVkIGJ5IGFjY2lkZW50LCBhZGQgaXQg
YmFjay4NCj4gDQo+IEl0IGlzIG5vdCByZW1vdmVkIGJ5IGFjY2lkZW50LiBJdCB3YXMgcmVtb3Zl
ZCBpbnRlbnRpb25hbGx5LiBCcmluZyBhcmd1bWVudHMNCj4gKGJpbmRpbmdzLCBoYXJkd2FyZSwg
ZHJpdmVycykgd2h5IHRoaXMgaXMgY29ycmVjdCBjaG9pY2UuDQo+IA0KDQpUaGUgZml4ZWQgcGF0
Y2ggYXV0aG9yIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoLiAgYmlnLWVuZGlhbiBwcm9wZXJ0eSBp
cyByZW1vdmVkIGJ5IGFjY2lkZW50Lg0KSSBoYXZlIHZlcmlmaWVkIHRoaXMgcGF0Y2ggb24gYmln
LWVuZGlhbiBwcm9wZXJ0eSB3aXRoIGRyaXZlciAuL2RyaXZlcnMvd2F0Y2hkb2cvaW14Ml93ZHQu
Yy4NCg0KVGhhbmtzLA0KTEltZW5nDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==
