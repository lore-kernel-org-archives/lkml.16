Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F4132103;
	Fri, 30 May 2025 02:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748571170; cv=fail; b=fL14fpxe33ixWWfV9tzYXzhb3LJZfnEJqriJTycmaQv9JWWnF/8AHYMlWZ+ZOTlEm8l7e4oHy5C60ybib7tDOoOAebX+FeRsQjIbgzQajObwwXJb0kTeGhA8Io+Vk0kK/a6Jq/iaREwQq7XDJMreezukUnW0q5HOnHRjccW5OD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748571170; c=relaxed/simple;
	bh=i1Pr1R8XesBaocS09bHwVcFueuB5PM6/fqG9k/DZ81I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HOtRLyjIF+5dv6M+M23/HxPgTO4fpnsIFja40jpRIl6t60nWB8g/l4uHeMyvGcTeBjaU8CvCUO0KJHuocS8Mp83WRxrlvDVj8jOHIfqEElSBtkExWU0N7V0MCIPMOWetGJrRIUbLwHNnAO9EkVO5O6sR8K3TBMV+mJIkNf+SqlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TNYVTw022807;
	Fri, 30 May 2025 02:12:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u53961my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 02:12:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYHlxlLPSwPPyhKQyE+VmTcNfN8RnoWWhofuwsxAiuRI22qG2FGjtcEP/Ujjz4spBSNtSQrC9+gavmIDRsrYWzpXXyil1ShCYGRY+T9YDESoxVtyh0XXubyahZSecLHeKd4UVy5PAe629illyEAXxNjdRBbNjnS+T0epJdNQBZgcknDo3CUQ/WHx5T+Q34bNS/Z5dNVpV55U99b17KbvXJF0K+UTiATEELvfIAoaqXfGiHdehmoJlCxb2LonPY9NEm9DNGiK2iea08BLQxexhA/aNIGkVrs7F5dlqcfdVT7YSxg+tC9kMVu9Obvj4mZWN8fO3wEQPhc1UlU8Mn51ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1Pr1R8XesBaocS09bHwVcFueuB5PM6/fqG9k/DZ81I=;
 b=AjiC0MQU3KbFUhOV0NqzY7mjUa45QQb7UuUUCsht9zEAm+JZ5egtTjQEFskaJM0mbpdcyVgjNhph3+PN+zEDCOw65AahmGmOnEfxUKS6Xvm9D9v/+aNGCeHROS2EM0hSfffWwZKgyoRsevwdn1c3ExCl1pTj2yO1tkZG+QrwDXIozDwA6xLIpf8c8DXZCuNi+c+VnxB0qoGo8//ZiFjGfFVDiT+Udd3nWVeaQr/tY0sYfPKv0ph22Xu/R7atMtPRu7WRNL+NirotxlSgXbNWlVulynRZNPepFWk+SNGzkaZe3kQaynQatWHRThBaZnKWhmY2uKc6zedZHIbGLJoJYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by MN2PR11MB4629.namprd11.prod.outlook.com (2603:10b6:208:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 30 May
 2025 02:12:22 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 02:12:20 +0000
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
Thread-Index: AQHbz8I6xeJIfWjuYEeXZYWwyKzMCLPn+wEAgAEDLlCAAMkqAIAAohLw
Date: Fri, 30 May 2025 02:12:20 +0000
Message-ID:
 <CH3PR11MB8773E3192B27DD05E145556EF161A@CH3PR11MB8773.namprd11.prod.outlook.com>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
 <174843567469.3636722.5654586098186872724.robh@kernel.org>
 <CH3PR11MB877336C35ECB8432FF57C821F166A@CH3PR11MB8773.namprd11.prod.outlook.com>
 <aDiFrp/firrNlFEY@lizhi-Precision-Tower-5810>
In-Reply-To: <aDiFrp/firrNlFEY@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|MN2PR11MB4629:EE_
x-ms-office365-filtering-correlation-id: 233cd97b-548c-4bdc-2117-08dd9f1f68a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?gb2312?B?ejBzZWFub2xGTkV5ZkMxYkFKaG9CcGMwcm9EQWVhZmp6WWFPQUEvQnJWZUth?=
 =?gb2312?B?SjZTWFk5V3hxcW1oaEF5QWlndkFUKzRURnZMOHNicC84bGcwQ3hrMGd3MDVQ?=
 =?gb2312?B?WDZjMjFTcStDUGl6SjlzUk5lZXFBWTNUT3RqK3YwRTdwanJZTHVYR0N4YXlW?=
 =?gb2312?B?Nk1OUHpNWXZSaTJnZDlzblI2aGxkY0lXZ3pGQ3dKL0lQdGhua2xOcHI1b3gz?=
 =?gb2312?B?Q05uZ0FoV1BoMkQ0V2hlNkRqdlUwVVpoVHU4NUZlTG03R0lNdmxGb0tnbFhi?=
 =?gb2312?B?VlN0K3BmQ0lhNEFFR2o1ay9NM1EveitQSWdHYWFIRWFZT2pHY0JVbkZiZ2la?=
 =?gb2312?B?NStGRlNveUdUOHh1d1UvS1MyUThZak9XbXNNUnpSUU9OaWNoaUk5VnNpRUZv?=
 =?gb2312?B?OGpGTkhmL1ZDYVdPWDQ1VEJKaXFXZHZFeUpvWXdRY2ZvOG9VZGdyYWNyZmpY?=
 =?gb2312?B?ODZzNmFrSFdqZzdudkFLMGdsYzlrWUd1d2FPRC9EK0NyRTVxaUd2eURqdDN3?=
 =?gb2312?B?WnYvMzg5bWp0eURrbWJVWExLQXFPUFJSRG9DSnloVURIU2REbGlhYWxsSDhS?=
 =?gb2312?B?cE45S0NuWDRPZTZuWUNnNnAvYXlDcTMyZnVEOXdsNGtxR2dCcmpuS0lYQjFq?=
 =?gb2312?B?UkIvVUFZYVB0MFZUMU5lMHo3eWFrMWdiTFNrYUV3aFNoMzh1TURqWFF6b3lq?=
 =?gb2312?B?d2JkRTkxKzZuaXVkUCtzbVRnNnRFdGFQK0lyTkh0eG5lOC9JcGxmTzJGaEJQ?=
 =?gb2312?B?aHNmdWRFZkVVcUJ6cGVyWjZnaWpmWVorcTB1VlpNeDJiS0J2clVVcS9BRU5S?=
 =?gb2312?B?UzRzS1dUNi96cDdrZ0lUNTBUNW9SZVE0d1dqanZlOFo4WjdZUWc1VDRJa0lt?=
 =?gb2312?B?MlpiWDRUQWNOc050dWpGejVYOW1ZTmFnWWRVc3UrOEhCeFc1M3JFVzc0OUtk?=
 =?gb2312?B?OWlVblBud05zUW5aQndYL3ZSTzBCaU5yRStjSjJWNXk1MlZvK05Lemp3ZWxL?=
 =?gb2312?B?MzhaS0FRYTJGaVRQc2ZVdW1qZGhyUXlWTVMzdlpiSkRiR1ZpRGRybE52Y2dD?=
 =?gb2312?B?azA4bXBzY3dwTDdmZGd4clFHNGJPMlNSUE1heTRxTmNzY2ZBS0FnSEpUbFVo?=
 =?gb2312?B?cVIrNE5ySU9jNS9MVGk5WlZJN0ZrZDhVaFJBanpDSUtyT2xzT1BEQ2xJUVVW?=
 =?gb2312?B?WGRMMjJUREhuR2h4R1dzV2daTEJUUTN4cEUxN0RVSkd6UHZKN2lSZE9TaHJE?=
 =?gb2312?B?bm9DdEVwUVZKUGM3eTlZVmxtMnFQWmNTQU5vZGVCOGFwYUxOY2VlUEVtb21P?=
 =?gb2312?B?dHRCQkllSW9IakRYQWtEUTFwY1ozRThrcmJxSGxYYWdyZXdtTVpjOXRNMHgw?=
 =?gb2312?B?V3B0RGtyY05MYzg2TGRZUGF4a1Y4Q25lYUxpYkVYZFVSTnJPNEt1d040bHRW?=
 =?gb2312?B?QWNwU0NkdFBHK1hORTY3T2VZVjI1UUs3bnhabVhSYllMdUREUGJNdWdWTUFJ?=
 =?gb2312?B?bzRReUtHQ2poa1NZeUg4VkRRSWJheldjMGlGTU9aaUpJRnR4L2IwaldoRlhk?=
 =?gb2312?B?amF5bTJ4UFVJUE96RjU1TEtmT3ZUNHN4cE9qTUYybzlHV1ZLZi9BYk5FSHhI?=
 =?gb2312?B?OVQ2Um1zbXEvUVBiUlhJTHpId2VjeU9UaDJ1SWFFQVI1MWxtVnpZeEt4ZkVN?=
 =?gb2312?B?WUZDUCtlUGpWOGIzbFEvN1JKekIzWGtYWWhRVkY1cUVvZlIzZkt0OStMbE9E?=
 =?gb2312?B?N1VxTnl4UWlwVkJlNU5CSXpmVVlORG1EYXBsaXpoRk9uZThreWc1TVBlNFEv?=
 =?gb2312?B?L3dWVGYzU3BWYS8wM01PLzZhL3ZLYlNWUkl2amp3ZmRxK0ltVExzSkF3dHlh?=
 =?gb2312?B?b3g2bWh5aWxEa3BpSk90alhORkxPNFV6VG1HYnMwSjBSM2FsZXhqbmtGcDcv?=
 =?gb2312?Q?ccQSZunMpyQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?SnRSMFBBL21CZDZvTng5dVR0RWdaVnNOZmNDeHJUU1RlbjYvVmk4K3lWMU1p?=
 =?gb2312?B?cTlvY0FOVzBlT2srNWpGQXhEcHRrVXhlSW11TWxXR0dWcGVkUlV6Mms0MXNI?=
 =?gb2312?B?aVJCaVVyamZXcHV3dmNmejFOcGM4L2pIK1d0REczU0hMMHYraGFFOGNUZWNo?=
 =?gb2312?B?SnVmYWcwbURFSnVZS3BROXovb28yb0NFUFlpeWxZbU9MOXNtRnc2Q01UZjlw?=
 =?gb2312?B?RUg5TmJCLzgzaEU0d0MveS9QNUVMQXhDemFYL041T0tjMlA5Q2NMci92SDlE?=
 =?gb2312?B?aGc4cDVmWlZDY1hJaEt5Vm1xRzIybHN6Q3RCcCsyQTc4NGdVNUkyNG85b3l5?=
 =?gb2312?B?SmZaUGt0L3RINVB0aWVodDkwbkIrbjR0ZDFpTWpQYjFWemxkK1BZZzdyaTlW?=
 =?gb2312?B?V0MreUZTQ21yK2ZtSFZLYlpTRTRxekd4RFY3WmczdTdyY0ZYeFIxZHR3SUp3?=
 =?gb2312?B?dU9PZWkrUG1ybFFQSmZRekFEemJ2NXNzU3I5bHBaNHdQZEszSnI1R1lhd3Q5?=
 =?gb2312?B?RzZuS0k1bGVKdmdscTBzR2QyejYyNm5YUnZpSjFRdzZ2TWJ6LzNScDVPSFQ1?=
 =?gb2312?B?aEhlS0Z4VGRSL0lhS1FKbStkWW15MFkwNFBvQ2ZON0tYQnN5VC9ZK3NUMkhS?=
 =?gb2312?B?OUovM3pjYzh2V0lQMlVydGsrbFZmUFhpUXgyY2ZqcEZURStRbjFBZDJZZmZG?=
 =?gb2312?B?d1FlZWhqQjg1Mit4SStyNktrWDBrU0RhTWNPQzhSRTM1VzBUL3FnbDJHVCtG?=
 =?gb2312?B?dXI3ZzlSMytTUDFDSXY3MklRU3c3Uml6eWx3TDd4VzhsdC9Kci9od0IwdVYr?=
 =?gb2312?B?UWFLYkN6RUFIdnFJZGpVckRLTGl3OXVNcVZyRVVwZEJjcnJpVnJkVlBiNWJO?=
 =?gb2312?B?c1pGYUpzSlJoK29xSGp4ZmpZSVZMWERHMGo0UVdMbitaTFRkTVVxK1hLRFJ3?=
 =?gb2312?B?YmZTU25ua0x0Qll2bVJlQjZ2ZkpkSDlTZUYxeDdRQS8vUllESmtGeVU1aS9i?=
 =?gb2312?B?QXZZeWovNDhMMzhGRXhtY0NCR3pSNjhaKzJJaGgrT2RySGhiRHBjVjlqMUlQ?=
 =?gb2312?B?b0FxZjhTbkR6a2pCaU92d2w0eXR5S01FMWRZeFRpcmR6YTNoak9sejY1T3N2?=
 =?gb2312?B?VUgyc2xBS1ZWRHRWT1FpcXd4eXpOY1oycXJyU1ZVc1p6WFNuNFdiMDExd3h1?=
 =?gb2312?B?T0lGdGl6V0xlWUJmUW9DTkNrR0RPdEJJVXVreGUvWnZ6NUFubk5mRXNsMzlV?=
 =?gb2312?B?Qms5WVZXT0l2ZGJIQ2ZsNHJlUTVsZjBMNVYzMFA3NXdGejdXSUU3bjEzdEdV?=
 =?gb2312?B?Z0dSdFFuckV6Z2MvOTJ0YWk2dHNYS1AvcDg4cjlielFvM0lINkVsUXJBOVAy?=
 =?gb2312?B?ZVRzYzFFbURuOVRGUXMrdC9rbnYzZGkwNjFQK2tBY0ZOalNvUXM0QzY0dTdM?=
 =?gb2312?B?SXVFVndQYm9VN3FNbHFXWkhnN3V0Q1FSMUpwbHl1eFc5bE9FaWxiNlNxNi8r?=
 =?gb2312?B?b25VQ09yUjFzMi9acjkzcEhBdDF4UUJvOW1XbzRzNFlqaHkrd3FQeS95Q2ty?=
 =?gb2312?B?aXlodzVST1QvR3h0QkdXUWhUeWc5R1dSaW41TGIrbTBzUDFkOE9iaFZNTmJF?=
 =?gb2312?B?TmxJWkF4WUdQbUdpM29GMUZkRUFZbmtGM1lub3VYNVBaczBZWHNQT3pud2NG?=
 =?gb2312?B?Yk9xT1p2ZElnYUF0OGNnaS85ZCtrR2I1VUV0Ui90QytJNjcxOFRZdm82b1lJ?=
 =?gb2312?B?ZFJTZlZhTTJ6V3lCTDZJT2dsK1V0NE5SSUJlZERhNVB3bTNJOVF3bDBlcXha?=
 =?gb2312?B?V0ZtelplM3VISGVZSWJzMFFuTmpYejk3NkV0UjZCaW9tVzBwd01lTW40VEgv?=
 =?gb2312?B?VEkzdDByUUhMSnpYa0JFT21XUFlTcE5MRGFNcFA0d2p0YmVsMmplVWVwWFNS?=
 =?gb2312?B?ajd1ZExhK0ZwUjNpeVkrc2JRTCtRSEpZRFBrRGNNNkVxQmV5VHRBOTZ5c0tu?=
 =?gb2312?B?WmV6bDI1S0YxNk1EODBMbFBMTksrL1JSWGxaUGt1d252TVA0OVlqcVBPR3JM?=
 =?gb2312?B?clFUNWh0OGhHRmYrVXkwdHBLREIvWTJGcm55NFpvallrc1l2ZG9BOUJKeWVa?=
 =?gb2312?Q?ScvpHrEG/XHV9fg/g0X2aFT36?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 233cd97b-548c-4bdc-2117-08dd9f1f68a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 02:12:20.4571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sttf8Y+JetfJlEXFxbtI9G88a3HNa2MHrleTdX77CLKQnq4Dlz1tk8O9N3JXZv+IK8D+QEvTXmy/ba84lwKb+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4629
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAxOCBTYWx0ZWRfXyzq9VblRT6dX rCjekbBe+2Jgg/D8GdxUerAj+PInaUG7CCAyjrHd5eRigdlsTDN0eoMXIUquIMgJ0UfT4dfMGda zNGp0PvR92zOW/4fT4pV1CE2MulrzB2Hn5nIW5+XGqzbT8mVKk2ReUk133WlcAbfMZ3gM9zcttN
 O0w8Zkv8WcBVGlhewseU1DHZTanerFkyoF+x60pq7PPadjZY6q1GNSlCN7y8CrI1PwAnKiNeWmW +lxi+xYzcG5c2TCriWV5H0ydwieLa0G9squexaOcUgXiAPkXBqcL3T7/UkmGiSUm1A2ozGiKKay 4F6+5JeNm9kjTJAdfovE8EPluilACrVk3+GkRiTD+aOuBaPyt6EEnVD2Pdb4ej4dtSbMA8n9wzE
 0g7N4fGLD86sRXPV3/e4Pg+3V3lBdGXLbs5A9XwBOSBeA6izNQYs3YTHl6IOwyVEe3a2jwx8
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=6839140a cx=c_pps a=WhUEUVamR7lPV9LkVsdNog==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=_l4uJm6h9gAA:10
 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=8AirrxEcAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=EbL1KYWFunGTXsRWUV0A:9 a=mFyHDrcPJccA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=ST-jHhOKWsTCqRlWije3:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 22W8FlZ53Bxas0UZiRjtkhGQkV0E-iOt
X-Proofpoint-GUID: 22W8FlZ53Bxas0UZiRjtkhGQkV0E-iOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300018

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRnJhbmsgTGkgPEZyYW5r
LmxpQG54cC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDMwLCAyMDI1IDEyOjA1IEFNDQo+IFRv
OiBMaSwgTWVuZyA8TWVuZy5MaUB3aW5kcml2ZXIuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgKEFy
bSkgPHJvYmhAa2VybmVsLm9yZz47IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBzaGF3
bmd1b0BrZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0t
DQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBjb25vcitkdEBrZXJuZWwub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0hdIGFyY2g6IGFybTY0OiBkdHM6IGFkZCBiaWctZW5kaWFuIHByb3Bl
cnR5IGJhY2sgaW50bw0KPiB3YXRjaGRvZyBub2RlDQo+IA0KPiBDQVVUSU9OOiBUaGlzIGVtYWls
IGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2NvdW50IQ0KPiBEbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2Vu
ZGVyIGFuZA0KPiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiBPbiBUaHUsIE1heSAy
OSwgMjAyNSBhdCAwNDowNzoyN0FNICswMDAwLCBMaSwgTWVuZyB3cm90ZToNCj4gPiBIaSBGcmFu
aywNCj4gPg0KPiA+IERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBmb3IgdGhpcyBpc3N1ZT8N
Cj4gPiBDb3VsZCB5b3UgcGxlYXNlIGhlbHAgY2hlY2sgd2hldGhlciB3ZSBuZWVkIHRvIGZpeCB0
aGlzIGlzc3VlPw0KPiANCj4gRml4IGJpbmRpbmcgZG9jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dhdGNoZG9nL2ZzbC1pbXgtd2R0LnlhbWwN
Cj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvZnNsLWlteC13
ZHQueWFtbA0KPiBpbmRleCAwZGE5NTNjYjcxMjcyLi44MDA2ZWZiNjllYzcxIDEwMDY0NA0KPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvZnNsLWlteC13
ZHQueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hk
b2cvZnNsLWlteC13ZHQueWFtbA0KPiBAQCAtMzYsNiArMzYsNyBAQCBwcm9wZXJ0aWVzOg0KPiAg
ICAgICAgICAgICAgICAtIGZzbCxpbXg4bXEtd2R0DQo+ICAgICAgICAgICAgICAgIC0gZnNsLGxz
MTAxMmEtd2R0DQo+ICAgICAgICAgICAgICAgIC0gZnNsLGxzMTA0M2Etd2R0DQo+ICsgICAgICAg
ICAgICAgIC0gZnNsLGxzMTA0NmEtd2R0DQo+ICAgICAgICAgICAgICAgIC0gZnNsLHZmNjEwLXdk
dA0KPiAgICAgICAgICAgIC0gY29uc3Q6IGZzbCxpbXgyMS13ZHQNCj4gDQo+IEBAIC0xMDMsNiAr
MTA0LDcgQEAgYWxsT2Y6DQo+ICAgICAgICAgICAgICAgIGVudW06DQo+ICAgICAgICAgICAgICAg
ICAgLSBmc2wsbHMxMDEyYS13ZHQNCj4gICAgICAgICAgICAgICAgICAtIGZzbCxsczEwNDNhLXdk
dA0KPiArICAgICAgICAgICAgICAgIC0gZnNsLGxzMTA0NmEtd2R0DQo+IA0KPiBmaXggZHRzaQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEw
NDZhLmR0c2kNCj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDQ2YS5k
dHNpDQo+IGluZGV4IDBiYWYyNTZiNDQwMDMuLjA5NmVkODFhOWJjNGQgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwNDZhLmR0c2kNCj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA0NmEuZHRzaQ0KPiBAQCAtNjg3
LDcgKzY4Nyw3IEBAIGxwdWFydDU6IHNlcmlhbEAyOWEwMDAwIHsNCj4gICAgICAgICAgICAgICAg
IH07DQo+IA0KPiAgICAgICAgICAgICAgICAgd2RvZzA6IHdhdGNoZG9nQDJhZDAwMDAgew0KPiAt
ICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXgyMS13ZHQiOw0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxsczEwNDZhLXdkdCIsICJm
c2wsaW14MjEtd2R0IjsNCj4gDQo+IA0KDQpJIGhhdmUgYSBxdWVzdGlvbi4NCkkgY2hlY2tlZCB0
aGUgY29kZSBvZiAuL2RyaXZlcnMvd2F0Y2hkb2cvaW14Ml93ZHQuYywgdGhlcmUgaXMgYmVsb3cg
aXRlbSBpbXgyX3dkdF9kdF9pZHNbXQ0KeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDQzYS13ZHQi
LCAuZGF0YSA9ICZpbXhfd2R0X2xlZ2FjeSB9LA0KRG8geW91IHRoaW5rIHdlIGFsc28gbmVlZCB0
byBhZGQgYW5vdGhlciBiZWxvdyBpdGVtIGZvciBsczEwNDY/DQp7IC5jb21wYXRpYmxlID0gImZz
bCxsczEwNDZhLXdkdCIsIC5kYXRhID0gJmlteF93ZHRfbGVnYWN5IH0sDQoNCkFub3RoZXIgcXVl
c3Rpb24NCkkgYWxzbyBjaGVja2VkIHRoZSBjb2RlIC4vYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvZnNsLWxzMTA0M2EuZHRzaSwgYW5kIEkgZm91bmQgb3V0IGJlbG93IGl0ZW0gaW4gd2F0
Y2hkb2dAMmFkMDAwMCBub2RlDQpjb21wYXRpYmxlID0gImZzbCxsczEwNDNhLXdkdCIsICJmc2ws
aW14MjEtd2R0IjsNCmJ1dCBpbiBpbXgyX3dkdF9kdF9pZHNbXSwgdGhlcmUgaXMgYWxzbyB0aGUg
YmVsb3cgaXRlbSwgaXQgYWxzbyBjYW4gc3VwcG9ydCB0aGUgbHMxMDQzYSBhbmQgbHMxMDQ2YSBw
bGF0Zm9ybXMNCnsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDIxLXdkdCIsIC5kYXRhID0gJmlteF93
ZHRfbGVnYWN5IH0sDQpTbywgSSB0aGluayBtYXliZSB3ZSBjYW4gcmVtb3ZlIHRoZSB7IC5jb21w
YXRpYmxlID0gImZzbCxsczEwNDNhLXdkdCIsIC5kYXRhID0gJmlteF93ZHRfbGVnYWN5IH0uDQoN
CkJhc2VkIG9uIGFib3ZlIGRlc2NyaXB0aW9uLCB0aGVyZSBhcmUgMiBzb2x1dGlvbnMsIGFkZCB7
IC5jb21wYXRpYmxlID0gImZzbCxsczEwNDZhLXdkdCIsIC5kYXRhID0gJmlteF93ZHRfbGVnYWN5
IH0sIG9yIHJlbW92ZSB7IC5jb21wYXRpYmxlID0gImZzbCxsczEwNDNhLXdkdCIsIC5kYXRhID0g
JmlteF93ZHRfbGVnYWN5IH0uDQpXaGF0IGlzIHlvdXIgc3VnZ2VzdGlvbqO/DQoNClRoYW5rcywN
CkxJbWVuZw0KDQoNCg0KPiBGcmFuaw0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IExJbWVuZw0KPiA+
DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogUm9iIEhlcnJp
bmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDI4
LCAyMDI1IDg6MzcgUE0NCj4gPiA+IFRvOiBMaSwgTWVuZyA8TWVuZy5MaUB3aW5kcml2ZXIuY29t
Pg0KPiA+ID4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBzaGF3bmd1b0BrZXJuZWwu
b3JnOyBsaW51eC0NCj4gPiA+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEZyYW5rLkxpQG54cC5j
b207IGxpbnV4LWFybS0NCj4gPiA+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBjb25vcitk
dEBrZXJuZWwub3JnOyBMaSwgTWVuZw0KPiA+ID4gPE1lbmcuTGlAd2luZHJpdmVyLmNvbT4NCj4g
PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFyY2g6IGFybTY0OiBkdHM6IGFkZCBiaWctZW5kaWFu
IHByb3BlcnR5IGJhY2sNCj4gPiA+IGludG8gd2F0Y2hkb2cgbm9kZQ0KPiA+ID4NCj4gPiA+IENB
VVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291
bnQhDQo+ID4gPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IHJlY29nbml6ZSB0aGUNCj4gPiA+IHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBz
YWZlLg0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgMjggTWF5IDIwMjUgMTk6MTc6NTEgKzA4MDAsIE1l
bmcgTGkgd3JvdGU6DQo+ID4gPiA+IFdoZW4gdmVyaWZ5aW5nIHdhdGNoZG9nIGZlYXR1cmUgb24g
TlhQIGxzMTA0NmFyZGIgYm9hcmQsIGl0DQo+ID4gPiA+IGRvZXNuJ3Qgd29yay4gQmVjYXVzZSB0
aGUgYmlnLWVuZGlhbiBpcyBkZWxldGVkIGJ5IGFjY2lkZW50LCBhZGQgaXQgYmFjay4NCj4gPiA+
ID4NCj4gPiA+ID4gRml4ZXM6IDdjOGZmYzU1NTVjYiAoImFybTY0OiBkdHM6IGxheWVyc2NhcGU6
IHJlbW92ZSBiaWctZW5kaWFuDQo+ID4gPiA+IGZvciBtbWMgbm9kZXMiKQ0KPiA+ID4gPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNZW5nIExpIDxN
ZW5nLkxpQHdpbmRyaXZlci5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA0NmEuZHRzaSB8IDEgKw0KPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+IE15
IGJvdCBmb3VuZCBuZXcgRFRCIHdhcm5pbmdzIG9uIHRoZSAuZHRzIGZpbGVzIGFkZGVkIG9yIGNo
YW5nZWQgaW4NCj4gPiA+IHRoaXMgc2VyaWVzLg0KPiA+ID4NCj4gPiA+IFNvbWUgd2FybmluZ3Mg
bWF5IGJlIGZyb20gYW4gZXhpc3RpbmcgU29DIC5kdHNpLiBPciBwZXJoYXBzIHRoZQ0KPiA+ID4g
d2FybmluZ3MgYXJlIGZpeGVkIGJ5IGFub3RoZXIgc2VyaWVzLiBVbHRpbWF0ZWx5LCBpdCBpcyB1
cCB0byB0aGUNCj4gPiA+IHBsYXRmb3JtIG1haW50YWluZXIgd2hldGhlciB0aGVzZSB3YXJuaW5n
cyBhcmUgYWNjZXB0YWJsZSBvciBub3QuIE5vDQo+ID4gPiBuZWVkIHRvIHJlcGx5IHVubGVzcyB0
aGUgcGxhdGZvcm0gbWFpbnRhaW5lciBoYXMgY29tbWVudHMuDQo+ID4gPg0KPiA+ID4gSWYgeW91
IGFscmVhZHkgcmFuIERUIGNoZWNrcyBhbmQgZGlkbid0IHNlZSB0aGVzZSBlcnJvcihzKSwgdGhl
bg0KPiA+ID4gbWFrZSBzdXJlIGR0LSBzY2hlbWEgaXMgdXAgdG8gZGF0ZToNCj4gPiA+DQo+ID4g
PiAgIHBpcDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUNCj4gPiA+DQo+ID4gPg0KPiA+ID4g
VGhpcyBwYXRjaCBzZXJpZXMgd2FzIGFwcGxpZWQgKHVzaW5nIGI0KSB0byBiYXNlOg0KPiA+ID4g
IEJhc2U6IGF0dGVtcHRpbmcgdG8gZ3Vlc3MgYmFzZS1jb21taXQuLi4NCj4gPiA+ICBCYXNlOiBm
YWlsZWQgdG8gZ3Vlc3MgYmFzZQ0KPiA+ID4NCj4gPiA+IElmIHRoaXMgaXMgbm90IHRoZSBjb3Jy
ZWN0IGJhc2UsIHBsZWFzZSBhZGQgJ2Jhc2UtY29tbWl0JyB0YWcgKG9yDQo+ID4gPiB1c2UgYjQg
d2hpY2ggZG9lcyB0aGlzIGF1dG9tYXRpY2FsbHkpDQo+ID4gPg0KPiA+ID4gTmV3IHdhcm5pbmdz
IHJ1bm5pbmcgJ21ha2UgQ0hFQ0tfRFRCUz15IGZvcg0KPiA+ID4gYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvJyBmb3IgMjAyNTA1MjgxMTE3NTEuMzUwNTIyNC0xLQ0KPiA+ID4gTWVuZy5M
aUB3aW5kcml2ZXIuY29tOg0KPiA+ID4NCj4gPiA+IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2ZzbC1sczEwNDZhLXFkcy5kdGI6IHdhdGNoZG9nQDJhZDAwMDANCj4gPiA+IChmc2wsaW14
MjEtd2R0KTogYmlnLWVuZGlhbjogRmFsc2Ugc2NoZW1hIGRvZXMgbm90IGFsbG93IFRydWUNCj4g
PiA+ICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOg0KPiA+ID4gaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvd2F0Y2hkb2cvZnNsLWlteC0NCj4gPiA+IHdkdC55YW1sIw0KPiA+ID4gYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA0NmEtZnJ3eS5kdGI6DQo+IHdhdGNoZG9n
QDJhZDAwMDANCj4gPiA+IChmc2wsaW14MjEtd2R0KTogYmlnLWVuZGlhbjogRmFsc2Ugc2NoZW1h
IGRvZXMgbm90IGFsbG93IFRydWUNCj4gPiA+ICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOg0KPiA+
ID4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvd2F0Y2hkb2cvZnNsLWlteC0NCj4gPiA+
IHdkdC55YW1sIw0KPiA+ID4gYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA0
NmEtcmRiLmR0Yjogd2F0Y2hkb2dAMmFkMDAwMA0KPiA+ID4gKGZzbCxpbXgyMS13ZHQpOiBiaWct
ZW5kaWFuOiBGYWxzZSBzY2hlbWEgZG9lcyBub3QgYWxsb3cgVHJ1ZQ0KPiA+ID4gICAgICAgICBm
cm9tIHNjaGVtYSAkaWQ6DQo+ID4gPiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy93YXRj
aGRvZy9mc2wtaW14LQ0KPiA+ID4gd2R0LnlhbWwjDQo+ID4gPiBhcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9mc2wtbHMxMDQ2YS10cW1sczEwNDZhLW1ibHMxMHh4YS5kdGI6DQo+ID4gPiB3
YXRjaGRvZ0AyYWQwMDAwIChmc2wsaW14MjEtd2R0KTogYmlnLWVuZGlhbjogRmFsc2Ugc2NoZW1h
IGRvZXMgbm90DQo+ID4gPiBhbGxvdyBUcnVlDQo+ID4gPiAgICAgICAgIGZyb20gc2NoZW1hICRp
ZDoNCj4gPiA+IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3dhdGNoZG9nL2ZzbC1pbXgt
DQo+ID4gPiB3ZHQueWFtbCMNCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4NCg==
