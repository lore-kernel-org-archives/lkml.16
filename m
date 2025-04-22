Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11022128.outbound.protection.outlook.com [52.101.66.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AAA1D5ADC;
	Tue, 22 Apr 2025 07:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307228; cv=fail; b=f5ElaN3e1M3ECHqu890BO7rzqWYb0KuvkgA+fuiZEOPLeS36BXJFN7PfWtUYpBjB8Fg/OvcXQjp8iDWMbAHLdDLESa8Hm1drhORwsL/1VItoBteWq0Ng6Lmc2wm+uarKsIiu+nJ/RaSLZLOrPsPUsIMmzcwczfFDK1AhA3Ju41w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307228; c=relaxed/simple;
	bh=rtBSLZBMoKFMuliF2NwLMOQizlMhhtlqk6d4mRML+OY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Muc2u/hih4tpX6pJJVYz2sRpDx/u1Vv4ChOiPza3x82Nwwo6D8JccN7OSIlzJhGUwebU1eyEYzEJwQR1+S9TIPTjQCav4xxkhhcqsITTevWkkElgmJY1PVYmjsoAFD1C7R99xh06RXleO56M8haX7RcJ+dJ5hJIuoDSf5vES6Tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=Eqe7u8lk; arc=fail smtp.client-ip=52.101.66.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="Eqe7u8lk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/tnyxBTMBIB6Xf+tu6/nweHLO4QPAUBZDKNCBpmSdcd3zYYytYdoQEnP0+1Si7OYWauGgvfuMwlSss5W8LN1V21jm3UoZuCYnGrGENGiOZioyKLmPdneV+aZQf13gQmEGtwgl76519Mukul+HakIAPSawaNxb/sSRd0PdRsUEBoNhvey/5lAr6uCLConU46i/8+eBEEIgBSnM+iXzwoDIY7TOh5sDNEFVZHUTDOtHHyKxG8/ZH15Zl7p7Cmw606e1kvk8htQ1VGkqPUpIi47pOUPBSoeYKAM9iTN24QxuCnlpUne575et28kABhRavftJAaVyvi+N4DyHR6OnDK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PmySGHHTLIBx4l951X9tUXF2sioafXzk2avcpLtHZY=;
 b=rqqCX/GUDZqTB6ppLqtdnkwJytvcqj+LhLJvBij6ARr3NA6K7YHko9IbwmdE80vlGLFBUTqrUZlimjnxqb6CzwqzmackYYz931pEs5oo03AjV/PbrK5K5li9qqUHh7A8q8hxv4x/dQzwe+WNi+rfJdUApVa0Fo5Ps8IJZYox5qfPHn1MIPgkHLNaxCgQV2WDeq+KaiW0/INfUKzmJ0mnV8qiUrXYZthwmWlgOuDvxrBP/3rPZOEYDpZViKDyiXC4HVaqIZ0pV8uMfPwoq+UFmJNhvepKRaUJ3tYt8wJztyn3qOQ/0L7hO7V7z34dCX7LXTyKsbOVzSAUnJ2CtA2qRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PmySGHHTLIBx4l951X9tUXF2sioafXzk2avcpLtHZY=;
 b=Eqe7u8lklm46uTmiTsl0P73fWqOrW35Tt5hWcEomMRu1U+rmGJoD7rgDpWe2o054Au2VVkqX4LxYRt9H2pDC3OyhBuGCiDJWH7WR2n0u7+FhRVqMgGPXzAJ3FMM2dyaREdyO/FZeh+pCb9DoL8GAu+0B3yyropFnW9OrKEmDkiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PAVPR10MB7235.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 07:33:43 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%7]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 07:33:42 +0000
Message-ID: <174b5a55-77ff-42bc-a043-82f3f391b8eb@kontron.de>
Date: Tue, 22 Apr 2025 09:33:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] Add NVMEM driver for i.MX93 OTP access through
 ELE
To: Peng Fan <peng.fan@oss.nxp.com>, Frieder Schrempf <frieder@fris.de>
Cc: Peng Fan <peng.fan@nxp.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Xu Yang <xu.yang_2@nxp.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20250416142715.1042363-1-frieder@fris.de>
 <20250422043635.GA27670@nxa18884-linux>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20250422043635.GA27670@nxa18884-linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PAVPR10MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 363da02e-5dc8-4d12-4192-08dd817001c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2dCTkFHUXFvemhYcFJta3p4czdhYnNsNHpBWkY0dUZOeXhjZ291aXNUVCs3?=
 =?utf-8?B?TWQ1Rk5NanYwZldCT2NmZmliTEg0d21TTkJVUjExd2d6Szlnakg0dmYrVVJ5?=
 =?utf-8?B?QkYvRzluRndHVEU3VGJPZ0JHejBkekxxL2FlaTArOUpxaGs2dkZsQjRWdkNM?=
 =?utf-8?B?ZFVyTkFuVkl1Qk42K1BCeVE0ZUZFZVdMYk9mS3d6MWIwQlFCOWJWZWFoWnVk?=
 =?utf-8?B?NWszdmp4M01YWlV3NUd2WEZ0b0VZSW5JekltRkNQY2RKVlFqcjR1d1QxY2t0?=
 =?utf-8?B?ay92WHg1ckVKczBGODFtSmN0elp4M25pbzBicHZOZEtFaU9QdHlZNHcvU3kx?=
 =?utf-8?B?N1AveXU0VFZWSVA3dnM2cGE4QVBSbDRha2xmbEJTKzFtS2hWeVRyODZ5eTNL?=
 =?utf-8?B?Ym1MdWVvMm5ZVlZhcmIzZEY0WWEvM3hPY21hWjErMkxYcXd2cXdiRlhLV2pI?=
 =?utf-8?B?citRdnJrOHB1VEpPZ1AxRzErRGZQZVducWxaRG5nNG01L3FMVzhMeDN5Y1Jy?=
 =?utf-8?B?UGVEVk8xaHpDb1UzUiswWFV5Y25aZlNmeGxBRG5COFVUK1FqZUowcnBTd2hl?=
 =?utf-8?B?S3dZTXJDekVEc2VkS1FFREVTZVVQNkVPZHZadVdOVWNJU3BkQUxCdFF0Ymd6?=
 =?utf-8?B?VzRuM2svUEdpLzUvak9HSWxmUmJZU3RFUXVndmJNZ1l3MFJiMDhyL3JxZmlm?=
 =?utf-8?B?QllHTXdGOHNsY2oyTnFIYVkrSGZtRHRjMkptTEVMSjdpMXhZWHdyWVZWdGJL?=
 =?utf-8?B?bU5DcHpxaEdSWmI3bWJIdnFBdngxMWVpYVN3c28zU3dBSTA1ZVVCNzhLNWQx?=
 =?utf-8?B?S1JSNlR6TVVzRjRIY1lad1p2cjlqY0lXVDcvQWs5TGIrcEI2Zm5uMmE0WDl6?=
 =?utf-8?B?eVVPNkk1eGFDVndyN0lQbFV3RTAvVU1WYlRiR2ZOMnF3aDhNVnV5Q0VoTkll?=
 =?utf-8?B?aytORGxiRWNTYnUwOVl2aTFrbkQ4SzJDWGFuR2EzZzdVcVRHUnFxMWV0cWtP?=
 =?utf-8?B?ZENuREtLNVJleHFRa3Rnbm5KaVZZYTBXYzhYRXNnYm0rcWhtRzc3SGpPTFUv?=
 =?utf-8?B?UDh0Yjhxb3loSUErbi9jaWloWkxjazRYZExSZWFxRldjV1pDLzdabThpWjFK?=
 =?utf-8?B?OU9jSjdURGxURzZKcHc5NjN2UkkwTTdFQ3JYWit5N0hmQXdnOTJQcnhUdWty?=
 =?utf-8?B?aTVpeGJFQ0hHc0liM0tObW9XZFhnTjlYa1NUMnVISUVZbVM0U2E1TTRDcHky?=
 =?utf-8?B?S0l1OThDdzdqYzhpMlVReVY0b1lIN3Fnb1FCUGpOZERaSG1KRlgxYndaMDVP?=
 =?utf-8?B?U0NXR1dHOGlINmFNdGtxZDZyc2pRRzJKOFdPYWF1VDRkOElGa0pDeldtNUVi?=
 =?utf-8?B?Y2IxeHF3TDQvMWx0bFA1d0RDOFlBS210MVhSaXNOdGN0UkZLeUdGVVJPUjNJ?=
 =?utf-8?B?QWZSOEsxd09tZUNRck9pWFgrMGRudWVTSnYzaUdQeEFyWHJVVDV4UkhEbWlU?=
 =?utf-8?B?bk5HU0NvdkhBMUltSFlkMFZVTXFPWjVCSEJIUFJyVUp5NFpza0pFdFZtNE00?=
 =?utf-8?B?SlZwL1RiVEg2OWlzS04rbTZIRFJ1cTU1bTdRMktiakpaRHN6SHBTRGtUTmhM?=
 =?utf-8?B?Q1VPR1FnWmoxNVNmcEtyRXZZOFVvZGRRVjNqdTZON2JhQXJCUW1YNEdkY1lz?=
 =?utf-8?B?MjcwQlV2S2Z2dThvWFhvOXd0TmpDd1A5b2VTTFNrbkZEV2M5QTZ4ZW5zZ3d4?=
 =?utf-8?B?bm5qSUZORWdkWWh1V1BlUFBidTUzcVJTMEtUdHhrbTk4ZUV5cFJxMUFFSEgv?=
 =?utf-8?B?UzlFajZiNU1rOHJXQTVQUEVtaS9EVkF0M3dzN2czREdMd3FiajVmbnZqMUZJ?=
 =?utf-8?B?UHdvcVdZVEJDSlBZaVZqR25xand3bENERjZ5ektJc3JXaGM2K3piMFVjakh2?=
 =?utf-8?Q?imE3sTdKVN8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUpZbHRvNE1qdUNVYUxPUWV2VEJSQ3lCbGY3N2pIYnlENW1BYVpCc0REemRH?=
 =?utf-8?B?Z0NvVHJHOC9LdTBXR0tOeURJZHNwdGFYQ1hPWEtQcHhEZ2ZyclZYR2NxTHEw?=
 =?utf-8?B?OFNHU1R3RUlBT2tCakVNSlExbjJOTGRGcUYwMmF3MVVjbGlKaDhOOWpsbjBq?=
 =?utf-8?B?U1ExUEJPSzV1NkJxZWZ4S2ZDT1pyd2FzN1hUMlg1V1BpeVBoMnU1MHM3dWtJ?=
 =?utf-8?B?YTRFcENWeGFOZXpUelkyVkZmMVZ6Z29jc0xtOTNDZEdJZS84UVV4RlYwSUp1?=
 =?utf-8?B?SXZ2ek55K2hZWTQwSHdud2xBaS9vcTZWa0dhUXpVNlViMUxuaTlvRVQrTFRh?=
 =?utf-8?B?Z2R3amJTd0I3TDdmWTQ2Q3RUeFc1MS9vbGVNM0tkZ1VhdGc2V0xjNVV2WEVU?=
 =?utf-8?B?VmwvcEFlVmEySEhPMDNOQzRGUkZ1dkN6SXlIVWJESlpGUjEzQVVKRzlHNkJa?=
 =?utf-8?B?aXQwVkRhU3ZuNW45TmZMNWhFUEU5bGd1Mkl4K3BKejVVYi84YUxRRlp6U25o?=
 =?utf-8?B?bUE1NGx3Ly83Y1I1L2hjV21uT0V1dHhDZjlZanZLdENnWkh0Y0VnYWVpK2x6?=
 =?utf-8?B?UXpOcVBEM2VWMFZvaURlL0dOQmIvSnVSeVU0d2l4YUV0Z2xMUlBaa2lpeXUx?=
 =?utf-8?B?M1QwNzJUajNIVUg1NkFFZWQ2U0pOejI1czFtT0d4NU5nNjNzVTNzeHg5QTFO?=
 =?utf-8?B?TzMyYkc2dkhIRkhYWTN5cjUzWHF4RjNBRmdVSkRERFhYWm5qanlGTVZjUGZ2?=
 =?utf-8?B?Vk9kVFpSVnp2MERDVzRaWUtIK0c4S3JldXFLeWtGZTROY0h4R0wrSys3azQw?=
 =?utf-8?B?UHF0RUNocW9ZTmc0MThnTnNzNDhDYmhpLzZ1YUlzeFJ2OW9LQTZLMVI2bVJk?=
 =?utf-8?B?MURwelp2NFQxQlpTL0pKdVFpTmZmblorRlJRZjAvQXB6MU9ST0o4TTV0Rkp4?=
 =?utf-8?B?T1ltRFBoN1NlTXpHSDBxdnFTd09HQmc1NHByd05OTDJoVDZVa3JEZkRHMWxh?=
 =?utf-8?B?YkMyNVZFYXZDMUZYNEFadXBtbWRyVFE1RjVJRlVsSkFmRnJMVHJTTVJkenpF?=
 =?utf-8?B?UGpXdGpzOFdkcjd3aVBWaEJ6QVBqR1VhaE5oa2NyNCtaOEhiYnJRdlc5SUw4?=
 =?utf-8?B?WVNMYU4zWWduQkhiV29rd2xlWXcvcGluOE5HUTZwcy9ZZnE0NS9CUko3WVZY?=
 =?utf-8?B?WVNPa1kyRFJTcHErWWY0WlRuY1crR0VLbEhFdWVxaFRxSkppVTAvTllvRElx?=
 =?utf-8?B?Rk0ydUFzVHJkRUhxMjVmY243ZnczR0NXbFZSUWF0YkpuSjJodjB6NFZMeGV0?=
 =?utf-8?B?NDgyWi9CVWtrQ0grRjBOS2x1Vi9CNTRjUjJwVEZ5akpiWHBRUXhCako2K1FJ?=
 =?utf-8?B?T29JS0lhS1o5TmVhUHZjQVYrMFV3dGgyRlo1d3FXL3dSR3JLUCtRVEZrTyth?=
 =?utf-8?B?Q1FsYWJXcUZwWXMyejhmL1pIa3QrMk16Q3ZNbUFrQjVxMUg0MDg2THdIYlVW?=
 =?utf-8?B?cENjQjRPM1dDRXhUYjJESlB0VEhMUzhBM09OZFY1OGR3NTlkRlpvMFkra09h?=
 =?utf-8?B?dDZiYzJFQmxRZTZEMVlIYXVFYWlrL3o3Mlc5c2dXNmh5bmFhb3prVnVSbWVw?=
 =?utf-8?B?SXYzcktZQ2oweS82MkJtRSt5cEprNTQ2UVZsS1NaR3EyVFF3RlBES2UvbEdh?=
 =?utf-8?B?NGVSTHBCalVuY3RSTXQ1NDMxeDdWWTI2QW9iMW5tREhHQnlhMldjNUIzYXR3?=
 =?utf-8?B?bVRmYTI4ZEdUa1NMVDhRT1hFdW5SM0txWEdGZ2VUVWU0di9qWTFEVmhiUEtN?=
 =?utf-8?B?TUtlZzgrYXFsbDVRSXNkZW4zdkI2TGtFeTM3UkkxVVExUnhaRDNoc2M2bEhu?=
 =?utf-8?B?Y3VPM2hXTldMVkIyTUZPRVlrSjk0S2w1T2hFOEc1ODZhQW9jN05VcER5ekpq?=
 =?utf-8?B?Z1FNSkFVYVpWSmRTRTRMVTNXTTZnMjdoeDZnaHNoclBEakRKZzhwR2NvUS84?=
 =?utf-8?B?eTFCdldhZ0UrUjYwd0ZaR21QTjhqU3c0ckZic2JXMHJ1WnRpeFp2S2U5NlNh?=
 =?utf-8?B?Yi8xajhydkF1MFI2dmxyUk5YTnpLRkxVSWY0S2IvekxERUpSMmowelJPUTFD?=
 =?utf-8?B?c0xHSEhOZWhGR3drc1h4a1Q2OUNlSEVDSzVEdUtVbkRrYnpKSGJnK2t1S2Np?=
 =?utf-8?B?bVE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 363da02e-5dc8-4d12-4192-08dd817001c5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:33:42.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKAWfOZGtQjLTkr4WOJFjCvNlP+P7Oi1B4aZEHYggQY8Co2FgYV06XJXxh1Bkw1ikfUTxR5NVp+NqY/DsSeJJwv0y8QWErAHY5qXw7PYvA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7235

Hi Peng,

Am 22.04.25 um 08:30 schrieb Peng Fan:
> Hi Frieder,
> 
> On Wed, Apr 16, 2025 at 04:26:19PM +0200, Frieder Schrempf wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> This depends on [1] for the support of the Edgelock Secure Enclave firmware
>> driver.
>>
>> There are at least two ways to access the OTP fuses on i.MX93:
>>
>> (1) through the FSB (fuseblock) registers
>> (2) through the ELE S400 API
>>
>> There currently is a NVMEM driver imx-ocotp-ele.c that (despite its name)
>> implements (1). As the FSB only provides limited access to the OTP registers
>> (read only) it's not sufficient for all use-cases.
>>
>> It seems like imx-ocotp-ele.c was intended to be extended later to implement
>> (1) and (2) deciding on a per-fuse-register basis which of both access methods
>> should be used.
>>
>> This has some downsides:
>>
>> * the driver gets convoluted and complex
>> * the driver decides which OTP registers are accessed in which way and therefore
>>  mixes read-only and read/write access
>>
>> Therefore I implemented a simple driver that uses the ELE S400 API only, as the
>> FSB access (1) doesn't provide any benefits except for that it doesn't depend
>> on the ELE firmware being available. This is used by us downstream.
>>
>> For the upstream solution I would like to have some feedback on how to move
>> on:
>>
>> 1. switch imx-ocotp-ele.c to use ELE API exclusively
>>   -> this will create a hard dependency on the ELE firmware/driver being available
>> 2. extend imx-ocotp-ele.c to use FSB and ELE API
>>   -> make the driver use ELE API for all registers if ELE firmware/driver is available
>> 3. create separate drivers as done in this RFC
> 
> Need to confirm ELE APIs supports all fuses. If yes, switching to using ELE API
> exclusively should be ok, no need to mix FSB and ELE API. And drop the current
> FSB usage

Ok, I already compared what fuse registers I can access via FSB and ELE.
The ELE seems to cover all registers that are available via FSB so that
shouldn't be a problem.

Still, after thinking a bit more about it, option 2 above seems like the
best way to go to me.

In case someone wants to use the system without the proprietary ELE
firmware, I'd like them to not run into the obstacle of loosing read
access to the OTPs. Especially as the Ethernet driver expects the NVMEM
cells for the MAC address to be available.

I know that the ELE firmware is currently somewhat mandatory as the
bootloader uses it, but I guess it would be possible and for some people
also desirable to have a system without it.

So what I would like to have is an optional DT property for the
imx-ocotp-ele.c driver to point to the secure enclave node. If the ELE
device is available at probe time, make the driver use the ELE API
exclusively. If not, fall back to the FSB API with read-only access.

If someone wants to avoid the ELE API altogether for whatever reason,
they could remove the link to the secure enclave node in their board DT.

Thanks
Frieder

