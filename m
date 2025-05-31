Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617F62376F5;
	Sat, 31 May 2025 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748682623; cv=fail; b=riCftoYfGE+Iy23xUxOcQ3RKDmZlznN2PlfhYOK8h2O46Xf5LSTz8W/IoH1h/O8ia5XaJWxD5hrtpDZc/AfFua48X2c7UD0aLmhTGqeEBEuYPnHV7HffPOnwLXYq8r4T+6HJHIhSECKHCLH05ex5KAuXVfHFb2L2brxGzBW9GvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748682623; c=relaxed/simple;
	bh=klSLInOzh4giR5nPu/LkUMC5xaMBvYwQ38QsFqj3w+s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L3EgLownk8hj0kQFS6bDZybFBQflBwBTgvFB5DIKWr1OVfOpEKUgCy08hGY0ezmpHrL/oo/rJx27sctDQZmZKqa4aBl98BPc9VbjJ0wSjZKPp9CuJjgGnbCNkMnU8Cs5jwW9INNb2kp/pOWXSiQ+718su2vaSFv200JMoPP4PD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54V8xkV3028561;
	Sat, 31 May 2025 09:10:06 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46yq00r8ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 May 2025 09:10:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2wz6k6WgVXboWkXzEQnmAtCa/1h0SS5zdhmEUQvhJF06JIs1VoxwODe1H8AQqYUcfrglf+LpRCjYPzXhcGJBexfIkSgkXGpiGJtHEdZX5jPyyK8jIvHSLY7KH+LFs52flNFWCmoQ/S+xyGJKke9Ush5hczt9hkzjsnNBp+1R1ssJLzLjY+Hz2+wPKzx0e6q1LCp2R+OtbE/y2pL8mgW/rjDcFBMpkjlt0VqCrIj2lkCUMeocMIUmMmVjCCNLpQfbCmDCQsibIyWnhECB1HdpGDZHZC8DJcldeiVED0fZku+sFfNWFD/yxKaH/djD9kosxzQb1XMBRCBZ8lj26qcVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klSLInOzh4giR5nPu/LkUMC5xaMBvYwQ38QsFqj3w+s=;
 b=CT7OsJWzHQjtdIkQrE9Y1twCejdraPr0+zw23yLEU8AiHxigH0GyZ6tzr897CoDOznd/xLn8fWQgluyOjLbpkwe4hnVnBxuovb5UF4mr+8tDEzHSHC+VLbTtTy3euSL7x5lq/4Bph14/weeTTENojb69oKRFySY1Irpn2T6gXGX8yQJ20U0Y9p4NQ9lKK+3nYagHB3MHJehl4EC38U3aiwFyOqyqJncSpmcmfZKXQU5wX5nj3/GwZZS9ALUr/0nA/xlmLQYLzCnZcnKDEY2q/0J3kdOTUyHYonTT4QKXSnCBN+SRWEdP75/1DLnrg4Kd05Koua5fHzDpGD+xngkC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by CH2PR11MB8813.namprd11.prod.outlook.com (2603:10b6:610:282::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Sat, 31 May
 2025 09:10:03 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.025; Sat, 31 May 2025
 09:10:02 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: Frank Li <Frank.li@nxp.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
Subject: RE: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Thread-Topic: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Thread-Index:
 AQHbz8I6xeJIfWjuYEeXZYWwyKzMCLPn+wEAgAEDLlCAAMkqAIAAohLwgADhKYCAAS02UA==
Date: Sat, 31 May 2025 09:10:02 +0000
Message-ID:
 <CH3PR11MB877339E63CAB05E269D7371DF160A@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
 <174843567469.3636722.5654586098186872724.robh@kernel.org>
 <CH3PR11MB877336C35ECB8432FF57C821F166A@CH3PR11MB8773.namprd11.prod.outlook.com>
 <aDiFrp/firrNlFEY@lizhi-Precision-Tower-5810>
 <CH3PR11MB8773E3192B27DD05E145556EF161A@CH3PR11MB8773.namprd11.prod.outlook.com>
 <aDnKgx2L9/LL3U4z@lizhi-Precision-Tower-5810>
In-Reply-To: <aDnKgx2L9/LL3U4z@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|CH2PR11MB8813:EE_
x-ms-office365-filtering-correlation-id: bdf012b8-11de-40b9-25b4-08dda022ed54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?utf-8?B?Vndtd2xEamJDdHg2ZUVPWmQwWEtUK3d1RktZVEl1b1QwZkJJWWdkR3pYT3Rl?=
 =?utf-8?B?VkdRWEJSWkdaVVpKZitzWi9QTzZFWDNSYU9rRjk3eHRmbHJtdGJaeUx3NzM1?=
 =?utf-8?B?SVdHWjhBTHVyajR5Nk5tK2N4TWcwZkdhUmY4UFhVVWgvL0hlczZ0UC8yOFVH?=
 =?utf-8?B?VFpJMmhRZm9rU0hxd1B1MFZJRXhUL1d3S0RLL2ZqT1ZNYzNGc0F1UjNBZk84?=
 =?utf-8?B?Tzg5WmpZKzBNMmo4blhQVENBZFhBLzhWbXVKYnVTMUFNNDdsSjZNV0IrU3Yx?=
 =?utf-8?B?bmdMaG45MGtqYWNCdU90eWNWR0RURnJoYTYyK3BRbzZaeTR0YkZTb3kwcTRY?=
 =?utf-8?B?ckhCdmNKTmJZb1U3NEl1cXBhbUNUMEFKZkozdkY4ZkU0aW5oLzc4UGhvOWRl?=
 =?utf-8?B?TU1HSHFrMjBDN0wxSmoxOXplSTg4bUphSFFWamEwZitDSi9IYjBya1pBZ1NE?=
 =?utf-8?B?ZWtQckJWTXNHb2l3bTh6c0ttY01oYUtUTFUxUW84alRyMGdNNStBT0xCTWpi?=
 =?utf-8?B?Wm8vMmNrYnJLZkpTODdZck8yTkR0eTFJZGk1SGcxeWdzTTFDSE5HWnJZamtJ?=
 =?utf-8?B?aGhTS3M3azdFNEpYYUs2SEFMcE02aXgzQlRKMDhjNEx5bldveUd0U1JDbjFr?=
 =?utf-8?B?MytmcXNqajNRK2dZSWwzYkpWQWZzS0s1U3JYaUUwN2F3V3ZyMGRhcXQ3YXlE?=
 =?utf-8?B?d2NjaS9BZzVxd2RFaUc0eDR1WmpTS25PcmJPTUtqdWM4T25Xd2tOaHo1ZXYy?=
 =?utf-8?B?ZUJMNGlqYVlEbE0xYTFkZUcxczJ2LzBMd0lTZTFiak8zSUhQU2ZpTVF2a3Nm?=
 =?utf-8?B?Yi9QZkdRVlpYc0lqSFgxbmpCWDc4SThQbmlCOXdaQlZ0djM2OHV1eVdzUzJa?=
 =?utf-8?B?ZEozR29td0dPL1dVWUxhdElCd0V4dkxVUHM5dU4vb2FtOTdrejV3K0tSVzRw?=
 =?utf-8?B?SVNRYXRMbW1oZnVIb2NYYW5MWXZxeVFjZVR1OTVaMnN0dVFBUDlkczl1bGNZ?=
 =?utf-8?B?UDFwQ29PdUpTcStQL1hqdFE4WXh4MS9BRWpITFdmUUx6N0hVMHVpOEZ2Qlc2?=
 =?utf-8?B?VmEvR2RMWFY4cTZKVjJwTDh3YVdRZndFcEhPdzJtb3UzeGhJWC8wRUhnREJK?=
 =?utf-8?B?RmJ2SEpBZW9KZmttTlZDWVVMY2xnS3Vpd2VvdDBVVk5uWWZWZFg5dnJML09l?=
 =?utf-8?B?YVFJRjFTSUxvSmlSbW9SalAwNUppRXoyd0RPaS9CRTFoRWdJT3JJYjVTeXdJ?=
 =?utf-8?B?U2J2VFJmZFNXa05LNS9XZVkzbWhmTnpFNnlYekp1WlZtYkZ1SmFuQ3JFVjVQ?=
 =?utf-8?B?UXZ4bXBWSnlNZFcrb3hZZ1JRbDNneTBCWWlLaUk5eTdjN01wRXFwNFltQ3U0?=
 =?utf-8?B?SXdqL2JkeEFDQXpEU3dnMW9QNkhpR0ZoeE9GcjRrRDZDb3JrcjdlbmFmbDc2?=
 =?utf-8?B?L2lMMmZjbjJjcFBLVUhWVnJsc0ZmNXlWRzNkUGI5eTJzVUNBZVVpcy9sbEpP?=
 =?utf-8?B?d2hGZzdyQ29RQmhYaW5zNllVMzVMYWVjQmZIVmtJOGV6YTg0bmVCQXVScG5M?=
 =?utf-8?B?djROMG5tRjArbXhYMm1BcDFjaFlyUXlRcUF3Z0pKYlFWVDU2UTNDNGlDNG4w?=
 =?utf-8?B?czlqalUxejJSdHl1WThuTExBYjJKaG0rY29hQ2xHNWY2b3ROZTM5V3Y5d252?=
 =?utf-8?B?NCt3RmViYXYrbGZFMkZRRGN5S3NyM0t0M29nOEc0czlYVkNXbUVMUXJhcW96?=
 =?utf-8?B?bkJ0QmtKcnpGY29DWU5ycmdUWWpxRFdRV2MrMXNKekRBM0FYUlh3T1ByaC9n?=
 =?utf-8?B?MEZLM3A2a3hsQThPN1VXRDlyZjBzUUdSMjJRelRZQlFNUVpJUFJVMmJMaGMv?=
 =?utf-8?B?Rmo2cXNzbHJXSmJnNS9VT1M5SjM1QmxUM3IrZkVMK3FvRGF0aS9lSlVpSEVN?=
 =?utf-8?Q?oRNz+Oqlsyw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1BiWHRob0MxMWlYbTRYS28xanBDMTFEZU81Q3pyNittN0Y3S2FCK1ZjUGpG?=
 =?utf-8?B?aEtlR0RkZWtuVWVLTXBxOENMV2JxdkV1cnZQckU1ZEZ0MWcxTHBxUjhjM0xG?=
 =?utf-8?B?Y21LT1JQZDh6dWF4a3hSbmp0Q3A3Wm5IbXhjVDRQOHVocWZJMGV6WVdNLzUy?=
 =?utf-8?B?cGR2VEw4eTNPYjBEcWJuK3k3eUFZckdEU2M1Z3Uvd1lvbEF5eklqbU9ZSkJV?=
 =?utf-8?B?WlpMY2VWeUNkVjNPVjlXZjdlRE1WZC9ZcTVHTldQLzE1Rm5Id1M1bjUvQzJs?=
 =?utf-8?B?SEhBNG1OYzRxeWJwQU9RTXZzTDMyS3pjNG9pdXR2R0ZCQjd6T0lUK2JEUFQ1?=
 =?utf-8?B?OEdWZ3NGcHFaa3A5UUlRT3dMcm9EOTF2TDJGL3FqMFNRYkNSelpXalRHdTFz?=
 =?utf-8?B?cFZsK3gvRFJWUDY0UXRJZFV1WXR3VDBVSTdka09NYkdIMFhvaExnSTJqTWpR?=
 =?utf-8?B?Z09XMng0eHFUQ0p6MW1tWEg0VXhzY2xSTGY2dDluZUwwMjlZRmdZWk95TzFT?=
 =?utf-8?B?Z2NzVlhtMFJkTmREbm5NZWIxNW44Tkg1WDNHVE5WRjNhYnRNMThUMFhGZGZU?=
 =?utf-8?B?U2dVQ25ZVmEvWDdwL0JpYVdHSXdPdXM0clNmQU9ja1lPc0drWTVDM3FyZHRw?=
 =?utf-8?B?U0Y4S2kwbzVYNlYzRHorM2JjbHBEM2hrSDdaQTJJcUNEQnhJbmt6M2ZTMm1h?=
 =?utf-8?B?aW4rc2dLcWs1MytRVElBSUVvTjdFRU9Obkd0TmZ4QkNCeVArcllSWG42SDI0?=
 =?utf-8?B?RkZhZEgyRmE0aUEwNThCbzMzdENiUFhrL3RhYUh2VTM5SEVDaGxDQ0s1TWlt?=
 =?utf-8?B?OUVTNlo4NVkyc0l5R2xVWlNmNWJ6cGV0aG5WSjBIR0cvQUQ2M1E1ZXRiT2FO?=
 =?utf-8?B?VmhBY0dINitrSW02WUJWV3B0a0NpWmF1TFZUa0JLbDFFUFJRN3ROeWVWd0NU?=
 =?utf-8?B?Nk0yaXpPUUZWc200Wm1TbHBXVUUvSThkN2ltZFNFdDdTQUY3N0EwUmh3Vng5?=
 =?utf-8?B?TElUM2pDeGc4NW9PY3pzQlFEY1MwQUtzVmtzZ0wreW1YbG1QUUMrYjlhT1Vx?=
 =?utf-8?B?cmZRdENHemp3TVd4ZWQxaEVvSkFCSm9TWXJ4V0p2WDc3VVNjc0JnWlJydzRM?=
 =?utf-8?B?RFg5Wi9qVVR5aVB1TmpVZUN3MjNmQklsb25HdUZUWjJxYkpDODd6VlJncVNm?=
 =?utf-8?B?ZmdnWGRjRnpLUEFocWFDTnpyS2VxVmZtMi9EWHNIWW1FaXllMi8yNFhZRlJE?=
 =?utf-8?B?YVEvQ1hLZnlBYzk3ZlJpRjFRbzB5VSs5NXZzZ1ZCZVJFOTNIVEpkUHdONnZw?=
 =?utf-8?B?Vnl5aGRqMUJVT3NKN2lVL0NjZERSZ21PNmkvREFaQ3NIbFkrQ2NtOE04dWRV?=
 =?utf-8?B?aHRvRG5nSjMyck9iNnJrODI3MUE3cHVhZ0R5dVJCQzVxWExPdkdYMll2YUFK?=
 =?utf-8?B?RDg1TTBDTVI4MUNJY0NMTzZqOVpmZHJ4ckF3UjNZcWt0VkE3eHVjNjJ0dXZZ?=
 =?utf-8?B?ODRGU1ErQ3BhMmlFbTFXMlZSenZ2RWx2ZSsyZTJtTFh2NHhyTllJZUtpYVVQ?=
 =?utf-8?B?VzgzenRib3AvdzNLV01qVTN0dUNoTjFuaTZYZ1Vwb3dEOE9NNHBqOGh2MnlV?=
 =?utf-8?B?aFZDMlE0RmxubmJ3U1JLMmhXamtCVHhZbVNlQWcwVlcwN3Axcm9Vblh3ZFNF?=
 =?utf-8?B?N2FqSzFsbzBzSVdTWWRsU3hQeS9oZFI4WFBwTzBGdGNiNmhXSFg5RDRpRHAx?=
 =?utf-8?B?TjBreDF0NnMvNE9qUFhXOUxXTFRpalFKcEpuZHJwMUREb01mWHVuczVqZlE3?=
 =?utf-8?B?dzBIdHVuNUxjcTkvRWN6ckVYNmdHU2U0K090bGF6WlNETUdJelFRa2F6cnlJ?=
 =?utf-8?B?Z0pqRHlyQUlmTytScXVPUWJ5OTlVZDNndmozaEc0UXRueUpTMVFQcmZnS2RC?=
 =?utf-8?B?RURCSG42ZnNSaVZ1TFk1SUlJNWcwSlMrVlZXUTREWlIzOHRjdlA2blp4T3FZ?=
 =?utf-8?B?NVBGVTFOd1JHY3pxemxBRk1Zc1lTMFdhR3ZZU2xlKzFtMUxXYVo3QVh1bWo2?=
 =?utf-8?B?SHEzTmpKODExVGZUblJCekhxNFhKRkIxcGxvM01KNHA2bE91bUhxSnp2U1FO?=
 =?utf-8?Q?iKsVKT8ofSzChX+leVAmAN+yS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf012b8-11de-40b9-25b4-08dda022ed54
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2025 09:10:02.7328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6mBLLSg7U8CpV+BStm7CogEUPm5vZNlUz1HE7Cq4ymvmzQRlvPBjn7h+e6VQvNCTtFMva0Nv3D+eW7C956KAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8813
X-Authority-Analysis: v=2.4 cv=EtXSrTcA c=1 sm=1 tr=0 ts=683ac76d cx=c_pps a=6WGvpOQPchLzK5RJBAehJQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=8AirrxEcAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=Or4K-HiavPDgvTth0TwA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=ST-jHhOKWsTCqRlWije3:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: yxtS2aWQ5AGgJvhNaxIuhrV7iOYehExE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDA4MCBTYWx0ZWRfX8jZjH6cS5PF/ riUJQY/D4U8yYB0v0CpfztwbEECXtIpdhMvU3PfO/fUpXCmjuEUNZsr64fvT9Zu+FjBe1t7jj/e VXQg3mQDGE7qKLERyPw4D0nbM+b2slnef1FeHdvKLJkfaO3HIhwmjyrkQk+EeYUu8hkY8H4vAoC
 3nJy7nbHxrDdiccQNUAnga9gYsx3+2Fjs1okZDUzIUyuTKaZrOHgAEFvSLee+y0jRcStrocgoII Ca5MixAT8CW9UiGquQPcxHkr0b8vV6gDe+DKPwMxHgGDnFtf7jur9h2MzGr6RIaSAJruiSu39k8 Qgd/2Nj2dqLbaoJRnWN2Eveeab7gQlHkCYSvBwa75bxX6XC3i4SeDRAZWl97CUERz8owJWSZpdE
 84oYFeyDl5HfvRDYK6/akXc9+ZjbZNlIQ2/PcpUHfI91wQB0AV/Ts05IghubY+tZIUA1T/Ah
X-Proofpoint-ORIG-GUID: yxtS2aWQ5AGgJvhNaxIuhrV7iOYehExE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_04,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505310080

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRnJhbmsgTGkgPEZyYW5r
LmxpQG54cC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDMwLCAyMDI1IDExOjExIFBNDQo+IFRv
OiBMaSwgTWVuZyA8TWVuZy5MaUB3aW5kcml2ZXIuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgKEFy
bSkgPHJvYmhAa2VybmVsLm9yZz47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBzaGF3
bmd1b0BrZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0t
DQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBjb25vcitkdEBrZXJuZWwub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0hdIGFyY2g6IGFybTY0OiBkdHM6IGFkZCBiaWctZW5kaWFuIHByb3Bl
cnR5IGJhY2sgaW50bw0KPiB3YXRjaGRvZyBub2RlDQo+IA0KPiBDQVVUSU9OOiBUaGlzIGVtYWls
IGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2NvdW50IQ0KPiBEbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2Vu
ZGVyIGFuZA0KPiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiBPbiBGcmksIE1heSAz
MCwgMjAyNSBhdCAwMjoxMjoyMEFNICswMDAwLCBMaSwgTWVuZyB3cm90ZToNCj4gPg0KPiA+DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogRnJhbmsgTGkgPEZy
YW5rLmxpQG54cC5jb20+DQo+ID4gPiBTZW50OiBGcmlkYXksIE1heSAzMCwgMjAyNSAxMjowNSBB
TQ0KPiA+ID4gVG86IExpLCBNZW5nIDxNZW5nLkxpQHdpbmRyaXZlci5jb20+DQo+ID4gPiBDYzog
Um9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz47IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnOw0KPiA+ID4gc2hhd25ndW9Aa2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtYXJtLQ0KPiA+ID4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGNv
bm9yK2R0QGtlcm5lbC5vcmcNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFyY2g6IGFybTY0
OiBkdHM6IGFkZCBiaWctZW5kaWFuIHByb3BlcnR5IGJhY2sNCj4gPiA+IGludG8gd2F0Y2hkb2cg
bm9kZQ0KPiA+ID4NCj4gPiA+IENBVVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBX
aW5kIFJpdmVyIGVtYWlsIGFjY291bnQhDQo+ID4gPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUNCj4gPiA+IHNlbmRlciBhbmQg
a25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiA+ID4NCj4gPiA+IE9uIFRodSwgTWF5IDI5LCAy
MDI1IGF0IDA0OjA3OjI3QU0gKzAwMDAsIExpLCBNZW5nIHdyb3RlOg0KPiA+ID4gPiBIaSBGcmFu
aywNCj4gPiA+ID4NCj4gPiA+ID4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIGZvciB0aGlz
IGlzc3VlPw0KPiA+ID4gPiBDb3VsZCB5b3UgcGxlYXNlIGhlbHAgY2hlY2sgd2hldGhlciB3ZSBu
ZWVkIHRvIGZpeCB0aGlzIGlzc3VlPw0KPiA+ID4NCj4gPiA+IEZpeCBiaW5kaW5nIGRvYw0KPiA+
ID4NCj4gPiA+IGRpZmYgLS1naXQNCj4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3dhdGNoZG9nL2ZzbC1pbXgtd2R0LnlhbWwNCj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2ZzbC1pbXgtd2R0LnlhbWwNCj4gPiA+IGluZGV4
IDBkYTk1M2NiNzEyNzIuLjgwMDZlZmI2OWVjNzEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvZnNsLWlteC13ZHQueWFtbA0KPiA+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2ZzbC1p
bXgtd2R0LnlhbWwNCj4gPiA+IEBAIC0zNiw2ICszNiw3IEBAIHByb3BlcnRpZXM6DQo+ID4gPiAg
ICAgICAgICAgICAgICAtIGZzbCxpbXg4bXEtd2R0DQo+ID4gPiAgICAgICAgICAgICAgICAtIGZz
bCxsczEwMTJhLXdkdA0KPiA+ID4gICAgICAgICAgICAgICAgLSBmc2wsbHMxMDQzYS13ZHQNCj4g
PiA+ICsgICAgICAgICAgICAgIC0gZnNsLGxzMTA0NmEtd2R0DQo+ID4gPiAgICAgICAgICAgICAg
ICAtIGZzbCx2ZjYxMC13ZHQNCj4gPiA+ICAgICAgICAgICAgLSBjb25zdDogZnNsLGlteDIxLXdk
dA0KPiA+ID4NCj4gPiA+IEBAIC0xMDMsNiArMTA0LDcgQEAgYWxsT2Y6DQo+ID4gPiAgICAgICAg
ICAgICAgICBlbnVtOg0KPiA+ID4gICAgICAgICAgICAgICAgICAtIGZzbCxsczEwMTJhLXdkdA0K
PiA+ID4gICAgICAgICAgICAgICAgICAtIGZzbCxsczEwNDNhLXdkdA0KPiA+ID4gKyAgICAgICAg
ICAgICAgICAtIGZzbCxsczEwNDZhLXdkdA0KPiA+ID4NCj4gPiA+IGZpeCBkdHNpDQo+ID4gPg0K
PiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEw
NDZhLmR0c2kNCj4gPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA0
NmEuZHRzaQ0KPiA+ID4gaW5kZXggMGJhZjI1NmI0NDAwMy4uMDk2ZWQ4MWE5YmM0ZCAxMDA2NDQN
Cj4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwNDZhLmR0
c2kNCj4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwNDZh
LmR0c2kNCj4gPiA+IEBAIC02ODcsNyArNjg3LDcgQEAgbHB1YXJ0NTogc2VyaWFsQDI5YTAwMDAg
ew0KPiA+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4gPg0KPiA+ID4gICAgICAgICAgICAgICAg
IHdkb2cwOiB3YXRjaGRvZ0AyYWQwMDAwIHsNCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiZnNsLGlteDIxLXdkdCI7DQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImZzbCxsczEwNDZhLXdkdCIsDQo+ID4gPiArICJmc2wsaW14MjEt
d2R0IjsNCj4gPiA+DQo+ID4gPg0KPiA+DQo+ID4gSSBoYXZlIGEgcXVlc3Rpb24uDQo+ID4gSSBj
aGVja2VkIHRoZSBjb2RlIG9mIC4vZHJpdmVycy93YXRjaGRvZy9pbXgyX3dkdC5jLCB0aGVyZSBp
cyBiZWxvdw0KPiA+IGl0ZW0gaW14Ml93ZHRfZHRfaWRzW10geyAuY29tcGF0aWJsZSA9ICJmc2ws
bHMxMDQzYS13ZHQiLCAuZGF0YSA9DQo+ID4gJmlteF93ZHRfbGVnYWN5IH0sIERvIHlvdSB0aGlu
ayB3ZSBhbHNvIG5lZWQgdG8gYWRkIGFub3RoZXIgYmVsb3cgaXRlbQ0KPiBmb3IgbHMxMDQ2Pw0K
PiANCj4geyAuY29tcGF0aWJsZSA9ICJmc2wsaW14MjEtd2R0IiwgLmRhdGEgPSAmaW14X3dkdF9s
ZWdhY3kgfSwgaXQgaXMgZW5vdWdoIGJ5IHVzZQ0KPiBmYWxsYmFjayBmc2wsaW14MjEtd2R0Lg0K
PiANCj4gPiB7IC5jb21wYXRpYmxlID0gImZzbCxsczEwNDZhLXdkdCIsIC5kYXRhID0gJmlteF93
ZHRfbGVnYWN5IH0sDQo+ID4NCj4gPiBBbm90aGVyIHF1ZXN0aW9uDQo+ID4gSSBhbHNvIGNoZWNr
ZWQgdGhlIGNvZGUNCj4gPiAuL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEw
NDNhLmR0c2ksIGFuZCBJIGZvdW5kIG91dA0KPiA+IGJlbG93IGl0ZW0gaW4gd2F0Y2hkb2dAMmFk
MDAwMCBub2RlIGNvbXBhdGlibGUgPSAiZnNsLGxzMTA0M2Etd2R0IiwNCj4gPiAiZnNsLGlteDIx
LXdkdCI7IGJ1dCBpbiBpbXgyX3dkdF9kdF9pZHNbXSwgdGhlcmUgaXMgYWxzbyB0aGUgYmVsb3cN
Cj4gPiBpdGVtLCBpdCBhbHNvIGNhbiBzdXBwb3J0IHRoZSBsczEwNDNhIGFuZCBsczEwNDZhIHBs
YXRmb3JtcyB7IC5jb21wYXRpYmxlID0NCj4gImZzbCxpbXgyMS13ZHQiLCAuZGF0YSA9ICZpbXhf
d2R0X2xlZ2FjeSB9LCBTbywgSSB0aGluayBtYXliZSB3ZSBjYW4gcmVtb3ZlDQo+IHRoZSB7IC5j
b21wYXRpYmxlID0gImZzbCxsczEwNDNhLXdkdCIsIC5kYXRhID0gJmlteF93ZHRfbGVnYWN5IH0u
DQo+IA0KPiBZZXMsIGJ1dCBub3QgbmVzc2VzYXJ5IHRvIGRvIHRoYXQuIGxlYXZlIGl0IGFzIGl0
Lg0KPiANCj4gPg0KPiA+IEJhc2VkIG9uIGFib3ZlIGRlc2NyaXB0aW9uLCB0aGVyZSBhcmUgMiBz
b2x1dGlvbnMsIGFkZCB7IC5jb21wYXRpYmxlID0NCj4gImZzbCxsczEwNDZhLXdkdCIsIC5kYXRh
ID0gJmlteF93ZHRfbGVnYWN5IH0sIG9yIHJlbW92ZSB7IC5jb21wYXRpYmxlID0NCj4gImZzbCxs
czEwNDNhLXdkdCIsIC5kYXRhID0gJmlteF93ZHRfbGVnYWN5IH0uDQo+ID4gV2hhdCBpcyB5b3Vy
IHN1Z2dlc3Rpb27vvJ8NCj4gDQo+IGxlYXZlIGRyaXZlciBjb2RlIHVuY2hhbmdlLiB0aGUgY3Vy
cmVudCBkcml2ZXIgY2FuIHdvcmsuDQo+IA0KDQpPayEgR290IGl0Lg0KSSBoYXZlIHNlbnQgdjIg
cGF0Y2ggcmV2aWV3Lg0KDQpUaGFua3MsDQpMaW1lbmcNCg0KPiBGcmFuaw0KPiANCj4gPg0KPiA+
IFRoYW5rcywNCj4gPiBMSW1lbmcNCj4gPg0KPiA+DQo+ID4NCj4gPiA+IEZyYW5rDQo+ID4gPiA+
DQo+ID4gPiA+IFRoYW5rcywNCj4gPiA+ID4gTEltZW5nDQo+ID4gPiA+DQo+ID4gPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPiBGcm9tOiBSb2IgSGVycmluZyAoQXJt
KSA8cm9iaEBrZXJuZWwub3JnPg0KPiA+ID4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDI4LCAy
MDI1IDg6MzcgUE0NCj4gPiA+ID4gPiBUbzogTGksIE1lbmcgPE1lbmcuTGlAd2luZHJpdmVyLmNv
bT4NCj4gPiA+ID4gPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IHNoYXduZ3VvQGtl
cm5lbC5vcmc7IGxpbnV4LQ0KPiA+ID4gPiA+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEZyYW5r
LkxpQG54cC5jb207IGxpbnV4LWFybS0NCj4gPiA+ID4gPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgTGksIE1lbmcNCj4gPiA+ID4gPiA8TWVuZy5MaUB3
aW5kcml2ZXIuY29tPg0KPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFyY2g6IGFybTY0
OiBkdHM6IGFkZCBiaWctZW5kaWFuIHByb3BlcnR5DQo+ID4gPiA+ID4gYmFjayBpbnRvIHdhdGNo
ZG9nIG5vZGUNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IENBVVRJT046IFRoaXMgZW1haWwgY29tZXMg
ZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQhDQo+ID4gPiA+ID4gRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlDQo+
ID4gPiA+ID4gc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBPbiBXZWQsIDI4IE1heSAyMDI1IDE5OjE3OjUxICswODAwLCBNZW5nIExpIHdy
b3RlOg0KPiA+ID4gPiA+ID4gV2hlbiB2ZXJpZnlpbmcgd2F0Y2hkb2cgZmVhdHVyZSBvbiBOWFAg
bHMxMDQ2YXJkYiBib2FyZCwgaXQNCj4gPiA+ID4gPiA+IGRvZXNuJ3Qgd29yay4gQmVjYXVzZSB0
aGUgYmlnLWVuZGlhbiBpcyBkZWxldGVkIGJ5IGFjY2lkZW50LCBhZGQgaXQNCj4gYmFjay4NCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBGaXhlczogN2M4ZmZjNTU1NWNiICgiYXJtNjQ6IGR0czog
bGF5ZXJzY2FwZTogcmVtb3ZlDQo+ID4gPiA+ID4gPiBiaWctZW5kaWFuIGZvciBtbWMgbm9kZXMi
KQ0KPiA+ID4gPiA+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IE1lbmcgTGkgPE1lbmcuTGlAd2luZHJpdmVyLmNvbT4NCj4gPiA+ID4gPiA+
IC0tLQ0KPiA+ID4gPiA+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEw
NDZhLmR0c2kgfCAxICsNCj4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE15IGJvdCBm
b3VuZCBuZXcgRFRCIHdhcm5pbmdzIG9uIHRoZSAuZHRzIGZpbGVzIGFkZGVkIG9yIGNoYW5nZWQN
Cj4gPiA+ID4gPiBpbiB0aGlzIHNlcmllcy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNvbWUgd2Fy
bmluZ3MgbWF5IGJlIGZyb20gYW4gZXhpc3RpbmcgU29DIC5kdHNpLiBPciBwZXJoYXBzIHRoZQ0K
PiA+ID4gPiA+IHdhcm5pbmdzIGFyZSBmaXhlZCBieSBhbm90aGVyIHNlcmllcy4gVWx0aW1hdGVs
eSwgaXQgaXMgdXAgdG8NCj4gPiA+ID4gPiB0aGUgcGxhdGZvcm0gbWFpbnRhaW5lciB3aGV0aGVy
IHRoZXNlIHdhcm5pbmdzIGFyZSBhY2NlcHRhYmxlIG9yDQo+ID4gPiA+ID4gbm90LiBObyBuZWVk
IHRvIHJlcGx5IHVubGVzcyB0aGUgcGxhdGZvcm0gbWFpbnRhaW5lciBoYXMgY29tbWVudHMuDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBJZiB5b3UgYWxyZWFkeSByYW4gRFQgY2hlY2tzIGFuZCBkaWRu
J3Qgc2VlIHRoZXNlIGVycm9yKHMpLCB0aGVuDQo+ID4gPiA+ID4gbWFrZSBzdXJlIGR0LSBzY2hl
bWEgaXMgdXAgdG8gZGF0ZToNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICAgcGlwMyBpbnN0YWxsIGR0
c2NoZW1hIC0tdXBncmFkZQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGlzIHBh
dGNoIHNlcmllcyB3YXMgYXBwbGllZCAodXNpbmcgYjQpIHRvIGJhc2U6DQo+ID4gPiA+ID4gIEJh
c2U6IGF0dGVtcHRpbmcgdG8gZ3Vlc3MgYmFzZS1jb21taXQuLi4NCj4gPiA+ID4gPiAgQmFzZTog
ZmFpbGVkIHRvIGd1ZXNzIGJhc2UNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IElmIHRoaXMgaXMgbm90
IHRoZSBjb3JyZWN0IGJhc2UsIHBsZWFzZSBhZGQgJ2Jhc2UtY29tbWl0JyB0YWcNCj4gPiA+ID4g
PiAob3IgdXNlIGI0IHdoaWNoIGRvZXMgdGhpcyBhdXRvbWF0aWNhbGx5KQ0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gTmV3IHdhcm5pbmdzIHJ1bm5pbmcgJ21ha2UgQ0hFQ0tfRFRCUz15IGZvcg0KPiA+
ID4gPiA+IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlLycgZm9yIDIwMjUwNTI4MTExNzUx
LjM1MDUyMjQtMS0NCj4gPiA+ID4gPiBNZW5nLkxpQHdpbmRyaXZlci5jb206DQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDQ2YS1xZHMu
ZHRiOg0KPiA+ID4gPiA+IHdhdGNoZG9nQDJhZDAwMDANCj4gPiA+ID4gPiAoZnNsLGlteDIxLXdk
dCk6IGJpZy1lbmRpYW46IEZhbHNlIHNjaGVtYSBkb2VzIG5vdCBhbGxvdyBUcnVlDQo+ID4gPiA+
ID4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6DQo+ID4gPiA+ID4gaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvd2F0Y2hkb2cvZnNsLWlteC0NCj4gPiA+ID4gPiB3ZHQueWFtbCMNCj4gPiA+
ID4gPiBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDQ2YS1mcnd5LmR0YjoN
Cj4gPiA+IHdhdGNoZG9nQDJhZDAwMDANCj4gPiA+ID4gPiAoZnNsLGlteDIxLXdkdCk6IGJpZy1l
bmRpYW46IEZhbHNlIHNjaGVtYSBkb2VzIG5vdCBhbGxvdyBUcnVlDQo+ID4gPiA+ID4gICAgICAg
ICBmcm9tIHNjaGVtYSAkaWQ6DQo+ID4gPiA+ID4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvd2F0Y2hkb2cvZnNsLWlteC0NCj4gPiA+ID4gPiB3ZHQueWFtbCMNCj4gPiA+ID4gPiBhcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDQ2YS1yZGIuZHRiOg0KPiA+ID4gPiA+
IHdhdGNoZG9nQDJhZDAwMDANCj4gPiA+ID4gPiAoZnNsLGlteDIxLXdkdCk6IGJpZy1lbmRpYW46
IEZhbHNlIHNjaGVtYSBkb2VzIG5vdCBhbGxvdyBUcnVlDQo+ID4gPiA+ID4gICAgICAgICBmcm9t
IHNjaGVtYSAkaWQ6DQo+ID4gPiA+ID4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvd2F0
Y2hkb2cvZnNsLWlteC0NCj4gPiA+ID4gPiB3ZHQueWFtbCMNCj4gPiA+ID4gPiBhcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDQ2YS10cW1sczEwNDZhLQ0KPiBtYmxzMTB4eGEu
ZHRiOg0KPiA+ID4gPiA+IHdhdGNoZG9nQDJhZDAwMDAgKGZzbCxpbXgyMS13ZHQpOiBiaWctZW5k
aWFuOiBGYWxzZSBzY2hlbWEgZG9lcw0KPiA+ID4gPiA+IG5vdCBhbGxvdyBUcnVlDQo+ID4gPiA+
ID4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6DQo+ID4gPiA+ID4gaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvd2F0Y2hkb2cvZnNsLWlteC0NCj4gPiA+ID4gPiB3ZHQueWFtbCMNCj4gPiA+
ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPg0K
