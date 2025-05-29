Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADD28FF;
	Thu, 29 May 2025 04:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748491666; cv=fail; b=CUDA/C4uQDw5ilOa8/RyvH0uknn4WQrK6xrsaWj//I6fBJSdaWfJNXkiujR7xsffaSMpay8iMpbbS6V5b+SFHn8E9Ep1NYvlRX4E46Qz/8/zb1lvbRSZXyll6S8L3fJjkBcNbMUYFQzNJA+3Y06fJScDVWnenxDFt0oHW1LIkhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748491666; c=relaxed/simple;
	bh=swI9rKZQ5b7vN+TRJoY9y1RYolxQASTnCYB6T2NPHNw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oPc0niELlBunYveiBoywXy9YXLa6VbN+8JlSZDf2rH0qIn1a9RCnlI5krrTnncYo1h5d8UEA6rBpMnTKxCexasdZc7l3C+ESuMgwPZeKxINra/DKMHZlPJYYapV1PuRPcKqk2/HYB1Dm6MSV2GaH42HzVusMOlqblic+YID6C1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T3nQnf018037;
	Wed, 28 May 2025 21:07:30 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm4n2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 21:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1OtaZHhr/p3WShWx+iAdh2SkXPNapX8iE+LqnsM6dmcFaYwHy1PPxb8IaI/rDIKnbplEWIyZXdZ5nVQHy6G7WRgG7OWbnomzYUdIv0JEbKofLMGXEe2/k+5ThyXJdtvPCKrOwQJpZ0v85xKawB786AiEn4ICr0lTIbFggmHOEZexTNUpqVNlqbQb0Z6Dzp2iNMW1am+kPhCzb5yTDtSKb46wM8Al/Odbsv2D8DD731+upcvOF93Euf2GHbbYeZi7Ch7T4+P5dhHHmxYeTNaRxnKMnZsQepshPKpxW28II8k5UGC+oTYUA0s6UkafVE+OGYvPW4V02/V+/40IIU8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swI9rKZQ5b7vN+TRJoY9y1RYolxQASTnCYB6T2NPHNw=;
 b=F5kMVq+bEKGWIxSpb6CZufHedOTvNQJdZFIaL6TkSlgn4tocBdZjMoDSD9XvGFfDvuRxMaBbkOtpcV8w6NSVVynEkEQt9MrFuhhgBVGHXkfGw3+1CReVJLqEWwX6qcWMRqgip4bvMWPmHkWK6PJdEKJ5v2HhhTXTVfeIQUZHxklKE2Jyx/iKhxigkd3Y+mNmY5YJOk91GNztxPnhVx6fZHaBe1xZfafOhv0D7QPhlnmM0IBU/FC4da/qe4oMan6f1ce2BEeK8x+f5dA7v2K+AgvCjMcWO1j2yfj8HRdQHMAH6n8VZcbU0jBN+aJSnAq9mxqRUyfBVGm3K1BImPiTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 04:07:27 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 04:07:27 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Thread-Topic: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Thread-Index: AQHbz8I6xeJIfWjuYEeXZYWwyKzMCLPn+wEAgAEDLlA=
Date: Thu, 29 May 2025 04:07:27 +0000
Message-ID:
 <CH3PR11MB877336C35ECB8432FF57C821F166A@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
 <174843567469.3636722.5654586098186872724.robh@kernel.org>
In-Reply-To: <174843567469.3636722.5654586098186872724.robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|CH3PR11MB7937:EE_
x-ms-office365-filtering-correlation-id: 2fbcc20b-789c-48a3-b25f-08dd9e665333
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1ZrNk5uS0IrMzMxclJzRXVpcWtvb21aRFEvTTMyNmMvQzI2RHovMHdWTjY2?=
 =?utf-8?B?R3htcmZadnpOQVJ1UkorYUlDWkh5NlVJK3JzdGg2RFZPRytKa0dSZk5VY3Qx?=
 =?utf-8?B?cUkvR3JCN20rd3NtZGt2MEpZSE43dGZnTVZPcnIyNW9KWHFZSXBBOW1FY2NC?=
 =?utf-8?B?TlFSZ0NRdFJ5SkFjaGJnNmR1bEorUEtIanZNdjBZc3RUVCs2WkpoYnZzL29i?=
 =?utf-8?B?YXh5NWh0UWEwNGRkVWRXV1IxZDZRRElMYzA0Q1FhcmpETTZKM2pjVXZoVTJO?=
 =?utf-8?B?djA2Q2RSMnRMcHZKbFRrM1l2UFFGUVVML0U5TEdlZWt3dkswMmtUdWxOZHBh?=
 =?utf-8?B?Y3FBRldKUEJtWFc5ZmZBb2hLbXVlWTYzRThuUzhsdGRHYk0raVFKMmgwYWVp?=
 =?utf-8?B?eEdkMDJvNW1kUEhRV0J2NDVaUHVkUGNRRDZwNTFmT0JwR2lPUmtkaGZ5OHlQ?=
 =?utf-8?B?SkRNTjQwNnJjbWRYTWMzeEVYdUdsU1Jrem03d2E4c3dhY2pJYUtRVGJ2MkZ5?=
 =?utf-8?B?RWFLVTRlM1VtbFhRbkhrc3FSM0RVNnJseDlxQVFoUjdNdXpjS1l1YjRBSERu?=
 =?utf-8?B?MStSenVsVXEwcGJCUUNWZStWa0h2SXZBY1pSejlGT1JQbXdOQ0ptOU5EYVVh?=
 =?utf-8?B?eis0M3lnYlNzVEErTWhOdStRMHAwQ1ZYZzlQSkgxTXRXd1VnTmx6aGtoRktC?=
 =?utf-8?B?U3NEQWs0V2MvQ0JIK2RNQWhMOXRlb0F5Z2VYeWM5ais4NU5qV3ZVZm5ERXVW?=
 =?utf-8?B?d0MrelVNVGE1ejdCM1pEWDR0NXJGaFhEZ21XTGJVZytJZGk4Qm85cCt2YUZJ?=
 =?utf-8?B?TXVsalFNZ3F5M0ZQKzllU1BZcVlyZlduRUt5UU53aU8zdTRyLzRkR1g3RndG?=
 =?utf-8?B?aXNjMFJabllDSVN1c2EzbDRPNUVZZ0tocGJQL3BQeFRhVzRNTVVWc3dxd2JL?=
 =?utf-8?B?NDFYdm1wM0lZS1lTcUphVFk3d3c3WWFlZzlhNlo3RDlCNXpmeGdIUHZ5Qytj?=
 =?utf-8?B?bk1mOEkxNzRVc1p3WjBNM3JMcVB5YXF6ajl1dGJ3WXBVZExjZUVON1E2VHhv?=
 =?utf-8?B?VnVYUWkwQmxVTkpBMVNJTW1SQmkxMTVaNlFnMFIzNXZ0ekVwWmdBQmtUTVF3?=
 =?utf-8?B?Y0FxRElRVHVpa1JTMzBhMWRMd3Y2T3NkbExXMElNdHlQb1BpRU1zaE5IRU56?=
 =?utf-8?B?R2o3SDlMN2lqczRuamlHNEZJY3VKQmxyV0hBRDZsaFJEbTB3dHgwbVlGVjY3?=
 =?utf-8?B?akNYMFI0emdvMHZyOEErNWE0MzFnbi9UYUlWdlhtb3FqSTRRYkxiTm9sZGpu?=
 =?utf-8?B?cXR5VGVvajJVbkdZVDNmOEdQVVRCYkQ3OSt6ZzFnbmdJQnJLQTlZclNmWUUv?=
 =?utf-8?B?R1FFd1lkUi91eEhFUUhSalhvVEJGNjB6eGp0YzBwcTZCWUNvZ1hkV2xDK1dz?=
 =?utf-8?B?Q0xnQXlORFlOUDZUSzN4aC9rY3FjQzRxaTBYZ0g3RUVrZTduRTljc21LbStz?=
 =?utf-8?B?NHhhMUduOUlNZGlqckU5QTk3OWNvWTM4Q3pjV0RGZjRXRE4rNHFPVXdmLzg3?=
 =?utf-8?B?b1hka2pQQW42eWk4Wk1TY2JmYjVCVTNqMkhQY2liWEFnMUcxWm5hU2lIeHlT?=
 =?utf-8?B?UGVDQTVSd2VScmR2U3NLUUU0b1JrL0ZGOVkvQXpIbnhQSDFKU3pLQnR5bSs4?=
 =?utf-8?B?S2RRaTBwTDcwQkFhZnJDUnRraUtBT3Fqclk1UWdqcC9rMkwyRFNLOVRTZG4x?=
 =?utf-8?B?UGVUc05GK2JiR01NOUJLVlMvaVBONUkydVB3dVlNOWUvUWhlU2ZtK3h6YlBD?=
 =?utf-8?B?UVhEZ1ROaVhzbE9XS2NJZFJvd0lsVUJRbTQ3dlYvcTZDRm5YZnQ3U2pRTGQy?=
 =?utf-8?B?N3lZeEsyR1dPSkNiMThuNTFKc01jcVNjbTdBWTdpWnBWTE04cnFxVTFrSUtQ?=
 =?utf-8?Q?E3bbo6wzMKQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vm8rSFpCMlRzSXpXUld1YytwaVQwc1J0ak0rM0NHdlhpZk5IV3lEZE9na0tE?=
 =?utf-8?B?RjY5OUcrVGFjbGJLajlSSjU3K1h3dXJ1em5uZGhtUmdCTXpVNU10cE8rd1hh?=
 =?utf-8?B?c0xTSnl0RisvaGNnb3VmdTZvUGVLQm10NFFINW9yS0E1Wm40aHdZWnVqMFdU?=
 =?utf-8?B?RTVsOUFOUXdoS2trdW1tQnMrSjN4UzJkU2MxbUoybmNrWitnVXFkWXFvMDhh?=
 =?utf-8?B?SUhtNFBVc2N4c3BZNmpOMWRaODd3SXF3Qk0zbG9UUVFwNm5wSS9saDU3Ym10?=
 =?utf-8?B?cE52QTJZejhaOUppSGdieEVWN21HcXR1M2JWTjhxTVdDK3ExSHhPeDBScWlz?=
 =?utf-8?B?QkIvL2Y5K1pxTW8xckVHalBSTVZGVHMra3J4dm11ZE04dFBiaTRTNG1KdDVN?=
 =?utf-8?B?YkRVOTB0UlBYeFc5S2d4ckN2RUlvaFNwSGkvMUZERjZBSnRxSTMrS2RocXY3?=
 =?utf-8?B?eHhuc1hMalU0UXZzQTFpOWRZZW9VZjhmcGpqY1VNMVpMTXdLd2NYcStnS0J0?=
 =?utf-8?B?cHBCVnppS0ZGT2lQRTNOVUFlZHFjWW9SNmRZWnY2dGlkc1hLV3kxZTExQzZ4?=
 =?utf-8?B?cktaWnQvM3VEOTRMZ0Q1RmJtM1RDZ1llU05oYW81a2U3cVZWU0NvdllzR2Y0?=
 =?utf-8?B?Vk5wdDZPNUd3VzA0aUQyL1BVVzdCYmtZSU9HQTVlNGlOSjVhclJQdXVtWks4?=
 =?utf-8?B?VWh0L203RkhaWkdSWW5LNE9lai9MT1ErOTRCb1NZWEVPcit6aUtQNmEyTmh5?=
 =?utf-8?B?NGh1WXpjYkt0RzZVdzg4ZGpxWXNhZmxBY2xoVUZaeTNkVHEyV0RHYzZiWHlH?=
 =?utf-8?B?T3pacTNERHFLeFF2Ykh2QVZWYWhtTGE0MkVoRmFlaytGbVJuckk3K1VMWjI5?=
 =?utf-8?B?QXZjTU5nTlJwWTZRbTA4bGlDYWlnR1ZzVzdTTnBzZXlEU3h4TkZSMnk2UHJI?=
 =?utf-8?B?OXp4cFlSSmJjYWdmSDRVUzJ3Y28rOTlWSk0yNlovSG5lV2xpcDhCMDUwS3Fq?=
 =?utf-8?B?UE1mbmcya0RzWHAvQkZWRVVId3IrcHpHSmF5RFBEUUIzbnJ6Q0U5TnN4NktR?=
 =?utf-8?B?enZJeU02emx6ZTNSOUlUTHJmZTZwaDMvSlpUZHVKakZaN2ttOE5LK0Q0UHZZ?=
 =?utf-8?B?UlRQZjJjTDhQWjA4TEN2Sll6UXFrazJabFV6M1dVRnh6MjVvb0syM2lwdEF1?=
 =?utf-8?B?ckExZ3kyZWt5VGMzeGw2OUh3YUpJQ0pvSmVjMWVkUlllVFVMVXBzYXdrVGV0?=
 =?utf-8?B?WjNpaGpXTzAxK25tTU9XSVZnbXhGZHcyMUVVbWNaVGpjTTdJczRVaWlRbEto?=
 =?utf-8?B?d1hkTC9FZU9nZDY0WmNFRjdFQkZjbWJ6ZkVKS0pUZGJMa2pqMEo4cGY3ZFVH?=
 =?utf-8?B?WkVJS1dhSzd4MFJPdHptWmg4SHl6b0dkU2o5bm9jeHdiMDBSc0kwaEdIQk1J?=
 =?utf-8?B?bk9JNEZCUkpCMWcxL2tVM0xJZmY0R0ZiVUZKSmt2b3cwdHE4L2NKUW41M3JJ?=
 =?utf-8?B?U3JkTXRzL1BqVzFRYUpBcENveXBLMGxLSmFlWXgwcCtqeEQ1RE1oc0ZKRDNa?=
 =?utf-8?B?MjFHZkhRaGJQd2hvL2R5UFkrR1JkczBpckQ5U0hDd2V6SjA4WFgyOGovRmxB?=
 =?utf-8?B?K2lyVnhjc0NZSWp5OG1pQ3hpNjZWamJKc0tMenVSekt0b1dNallNR3ByTlFt?=
 =?utf-8?B?RlMyZ3plTzZyNWdpUjRxbEIzeVdnRHBXSEdEdWl0eHF1WEhRTzRYVVhqM0xR?=
 =?utf-8?B?OXFjNWxTUzc5aWIvcWlScndSN2NCL0pyM3pjdGorVTliUnAzWStwcnVNd3ZC?=
 =?utf-8?B?L1E5cnJNblAxZnpuK2ZxTndFYVQvZHkzUjZVS2w1aWNuNHM4cElJbmxuck5a?=
 =?utf-8?B?V0tWRXdLN25EZFhWclZjbVZTbXBRZ2J2YTZnbnhpV1lyMDk1MC8vdnZjdGNr?=
 =?utf-8?B?U2RFTEVHTnhLbjN6MzRLaDdmRGZRL0FnNkNLZFYydERmMkY5TFhQZTVKeGJG?=
 =?utf-8?B?Z1QwY3pvcUloTHFhR3ZZUWFKQ3pOVW1hOURJc1dITXgyVGcybkFlRHU5SFY4?=
 =?utf-8?B?TWg1bUpWMVZLUjhGb3lzUHJIZ3B2bzBYb3I0S1BRaEFCUGVaNkllS2ZuWkdw?=
 =?utf-8?Q?YumyblS0tnZL4UKlYakHN4/3i?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbcc20b-789c-48a3-b25f-08dd9e665333
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2025 04:07:27.6084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HxiV+zO2HtL7OcNjMPY9dGYtHe1U5eXpNpxWQzEty+vRfLF/cogEOEv05Z6Dcnz01+QgppTtLF/u4t5YeiXGfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=6837dd81 cx=c_pps a=k3z6I4pdfs0t3+GLVInSVw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=8AirrxEcAAAA:8 a=JfrnYn6hAAAA:8 a=k4VtXQ1mXo0zqhUhdFUA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAzNyBTYWx0ZWRfXxrl+IGEYg5Jh IP9+CWtzd8iIydiUoIm9+ubbCaMH+ZNJl61J36nXn2q/3AvUsdyN+MaxaOvqd46ZVoMiB9gzuKs xuspG7L6AfCt7oKg6ovuxhB+GiXx5bDwBmyQshcXOHKQmVbM7sIf6zaRPEjknYkrHXlI/5u3HqF
 X5mbCZnxoyvqu3UVisS3x/00jgjSqAZCjuiD8T0aHCIPIvGsWVnFCsAIY+amXfJfle65Dg7WHOG BHTNGu6Fbw5rx9HnxWHiJbgA4LMkXb7cBDdsg61bf8utVelWOhHiO1n1RbFc0uz8U/lpui6Wvnw XRa4poMldNprdtwQgjVcY4R+8cR3sS1E5vri8WwT2nxODK/KIwzpyVWdHZtFGmb8ht2CvrHiS5V
 X5k4Q9tST7PrEyCMF5vhGw1ZGC6nz9CF0dfSiHyeggOuUinkqoN8t3YNH2I1AyQ6JxDfnvm3
X-Proofpoint-ORIG-GUID: 2N7K1YH7o5T8ihoOVilCEkX-Zl2QHSjC
X-Proofpoint-GUID: 2N7K1YH7o5T8ihoOVilCEkX-Zl2QHSjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505290037

SGkgRnJhbmssDQoNCkRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBmb3IgdGhpcyBpc3N1ZT8N
CkNvdWxkIHlvdSBwbGVhc2UgaGVscCBjaGVjayB3aGV0aGVyIHdlIG5lZWQgdG8gZml4IHRoaXMg
aXNzdWU/DQoNClRoYW5rcywNCkxJbWVuZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgTWF5IDI4LCAyMDI1IDg6MzcgUE0NCj4gVG86IExpLCBNZW5nIDxNZW5nLkxpQHdp
bmRyaXZlci5jb20+DQo+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgc2hhd25ndW9A
a2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEZyYW5rLkxpQG54
cC5jb207IGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGNvbm9yK2R0
QGtlcm5lbC5vcmc7IExpLCBNZW5nDQo+IDxNZW5nLkxpQHdpbmRyaXZlci5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIGFyY2g6IGFybTY0OiBkdHM6IGFkZCBiaWctZW5kaWFuIHByb3BlcnR5
IGJhY2sgaW50bw0KPiB3YXRjaGRvZyBub2RlDQo+IA0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIGNv
bWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2NvdW50IQ0KPiBEbyBub3QgY2xpY2sg
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVy
IGFuZA0KPiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiBPbiBXZWQsIDI4IE1heSAy
MDI1IDE5OjE3OjUxICswODAwLCBNZW5nIExpIHdyb3RlOg0KPiA+IFdoZW4gdmVyaWZ5aW5nIHdh
dGNoZG9nIGZlYXR1cmUgb24gTlhQIGxzMTA0NmFyZGIgYm9hcmQsIGl0IGRvZXNuJ3QNCj4gPiB3
b3JrLiBCZWNhdXNlIHRoZSBiaWctZW5kaWFuIGlzIGRlbGV0ZWQgYnkgYWNjaWRlbnQsIGFkZCBp
dCBiYWNrLg0KPiA+DQo+ID4gRml4ZXM6IDdjOGZmYzU1NTVjYiAoImFybTY0OiBkdHM6IGxheWVy
c2NhcGU6IHJlbW92ZSBiaWctZW5kaWFuIGZvcg0KPiA+IG1tYyBub2RlcyIpDQo+ID4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiBTaWduZWQtb2ZmLWJ5OiBNZW5nIExpIDxNZW5nLkxp
QHdpbmRyaXZlci5jb20+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2ZzbC1sczEwNDZhLmR0c2kgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQo+ID4NCj4gDQo+IA0KPiBNeSBib3QgZm91bmQgbmV3IERUQiB3YXJuaW5ncyBvbiB0
aGUgLmR0cyBmaWxlcyBhZGRlZCBvciBjaGFuZ2VkIGluIHRoaXMNCj4gc2VyaWVzLg0KPiANCj4g
U29tZSB3YXJuaW5ncyBtYXkgYmUgZnJvbSBhbiBleGlzdGluZyBTb0MgLmR0c2kuIE9yIHBlcmhh
cHMgdGhlIHdhcm5pbmdzIGFyZQ0KPiBmaXhlZCBieSBhbm90aGVyIHNlcmllcy4gVWx0aW1hdGVs
eSwgaXQgaXMgdXAgdG8gdGhlIHBsYXRmb3JtIG1haW50YWluZXIgd2hldGhlcg0KPiB0aGVzZSB3
YXJuaW5ncyBhcmUgYWNjZXB0YWJsZSBvciBub3QuIE5vIG5lZWQgdG8gcmVwbHkgdW5sZXNzIHRo
ZSBwbGF0Zm9ybQ0KPiBtYWludGFpbmVyIGhhcyBjb21tZW50cy4NCj4gDQo+IElmIHlvdSBhbHJl
YWR5IHJhbiBEVCBjaGVja3MgYW5kIGRpZG4ndCBzZWUgdGhlc2UgZXJyb3IocyksIHRoZW4gbWFr
ZSBzdXJlIGR0LQ0KPiBzY2hlbWEgaXMgdXAgdG8gZGF0ZToNCj4gDQo+ICAgcGlwMyBpbnN0YWxs
IGR0c2NoZW1hIC0tdXBncmFkZQ0KPiANCj4gDQo+IFRoaXMgcGF0Y2ggc2VyaWVzIHdhcyBhcHBs
aWVkICh1c2luZyBiNCkgdG8gYmFzZToNCj4gIEJhc2U6IGF0dGVtcHRpbmcgdG8gZ3Vlc3MgYmFz
ZS1jb21taXQuLi4NCj4gIEJhc2U6IGZhaWxlZCB0byBndWVzcyBiYXNlDQo+IA0KPiBJZiB0aGlz
IGlzIG5vdCB0aGUgY29ycmVjdCBiYXNlLCBwbGVhc2UgYWRkICdiYXNlLWNvbW1pdCcgdGFnIChv
ciB1c2UgYjQgd2hpY2gNCj4gZG9lcyB0aGlzIGF1dG9tYXRpY2FsbHkpDQo+IA0KPiBOZXcgd2Fy
bmluZ3MgcnVubmluZyAnbWFrZSBDSEVDS19EVEJTPXkgZm9yDQo+IGFyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlLycgZm9yIDIwMjUwNTI4MTExNzUxLjM1MDUyMjQtMS0NCj4gTWVuZy5MaUB3
aW5kcml2ZXIuY29tOg0KPiANCj4gYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxz
MTA0NmEtcWRzLmR0Yjogd2F0Y2hkb2dAMmFkMDAwMA0KPiAoZnNsLGlteDIxLXdkdCk6IGJpZy1l
bmRpYW46IEZhbHNlIHNjaGVtYSBkb2VzIG5vdCBhbGxvdyBUcnVlDQo+ICAgICAgICAgZnJvbSBz
Y2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy93YXRjaGRvZy9mc2wtaW14
LQ0KPiB3ZHQueWFtbCMNCj4gYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA0
NmEtZnJ3eS5kdGI6IHdhdGNoZG9nQDJhZDAwMDANCj4gKGZzbCxpbXgyMS13ZHQpOiBiaWctZW5k
aWFuOiBGYWxzZSBzY2hlbWEgZG9lcyBub3QgYWxsb3cgVHJ1ZQ0KPiAgICAgICAgIGZyb20gc2No
ZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvd2F0Y2hkb2cvZnNsLWlteC0N
Cj4gd2R0LnlhbWwjDQo+IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwNDZh
LXJkYi5kdGI6IHdhdGNoZG9nQDJhZDAwMDANCj4gKGZzbCxpbXgyMS13ZHQpOiBiaWctZW5kaWFu
OiBGYWxzZSBzY2hlbWEgZG9lcyBub3QgYWxsb3cgVHJ1ZQ0KPiAgICAgICAgIGZyb20gc2NoZW1h
ICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvd2F0Y2hkb2cvZnNsLWlteC0NCj4g
d2R0LnlhbWwjDQo+IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwNDZhLXRx
bWxzMTA0NmEtbWJsczEweHhhLmR0YjoNCj4gd2F0Y2hkb2dAMmFkMDAwMCAoZnNsLGlteDIxLXdk
dCk6IGJpZy1lbmRpYW46IEZhbHNlIHNjaGVtYSBkb2VzIG5vdA0KPiBhbGxvdyBUcnVlDQo+ICAg
ICAgICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy93YXRj
aGRvZy9mc2wtaW14LQ0KPiB3ZHQueWFtbCMNCj4gDQo+IA0KPiANCj4gDQoNCg==
