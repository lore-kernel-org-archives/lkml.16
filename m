Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023138.outbound.protection.outlook.com [40.107.162.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AAB7DA6D;
	Tue, 22 Apr 2025 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307448; cv=fail; b=nxi3tZdPnKKMQC7X76Od1Yp3sxtsx3cnOT+kXBwmuHgE++waXjjzBbTz5jMqlwT+ms5esCPZloLSMeKXBd34kl8MsbB/QIV4bY3+Fk6gAU18eojLg3VzHvX0LgVcC39rJCj64htcGI33KOwqoqiddcaujqZIuCT5t99Pt81Spmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307448; c=relaxed/simple;
	bh=jW1cpDLb+JvJoRW9PJJNtSB/u40a84UArZEaGBE3PpI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ozpuTMlxzDj4kkPnazcGE+Pryzjtqdr0SupZatfrN38ndsEgUZsFslGwSmKDh/AxNyqihnho+FDkXY2b/D3nJ3OBbrWim0oJp30OgCU6uwF3RgKDuIvPoeKdfhQw25KKYhcC3nXMwI1d4PcEteUw3d9ahO7fSU04OI/hvRNWYi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b=VobNdLRg; arc=fail smtp.client-ip=40.107.162.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="VobNdLRg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rcv/OlwwqD1Ayl1vwEQi7dC8LTChmi3cMcpEaFHd/48H3HdSN9qBqtf5uRRYWgFsE1fG4/ZUu8U5gBXuYeZjBhoKnuszIqBSuZKuN6GEfMzD9SXJdxL4xM1DaNQfOv9sJnmMJbG0mj1vjEwGmwaWvIGs+Fgj+VA8WkKekxnUfScp8dbjTJtTdd7SdqegbyrzHX7KhbucPFhI3id8/TiXQKYh4wtarMJ/WaRh1wv2JUM1AIogOlUmIAZppN5+fmN7N00i9JEAEPFVIpvZ36kSRtUVZk6WN6mvvvBXAE0sWJmY2BVtM7Kp5EvotxEDFQ1+x8Gc24JNOBi1wioLsWiVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjM7RJ18upZGH++l/BCwgAoctKJ365ns6yuZqvS0U9Q=;
 b=ME7Tbq5soInsXSx4lZ8bDNnVNCsyzcbEg/j/enTfijPWO8LFyKhQX8AiQUxdPSe7rS0J6NC3itdWRzHrj4m3H+LhqTJZUj/g7Oa4FBttj4eGrfp2vrV0zbi5F2CcS5z4VTaW9qRQ1ws12BHwfouVeeycK1wgJm3TqVkm1HK4rrgdNfN7iRMC2Q3UK+hIDbCZKxTZYC4iuUwlwt00DSHVDpO5nQw/kWX+/jbZtHJj1p4bDlejpwHYITPKtX+8qDV4/f0AyCL4XCfGfhywHN8D0vmFp/H/LCfdVxklyi6U1ZP0yPCZFkvvqsKa6JuVRe/qbBD18LWguTySEz/FyufMsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjM7RJ18upZGH++l/BCwgAoctKJ365ns6yuZqvS0U9Q=;
 b=VobNdLRgzyCXbyw3jpzMsXwvkLfV9YsSYvmS0GTUUfUniYBvrGnsixxqkHYETGsc9Jr9k6XBhYuKyVRJ1YYUXS+2H9bxe0ocA8IUi0uwI5E5h/7vL2MwKQ+975nS0iAqduWpB2IfLs6ZC0jVBDlUakY5SFrQFputronjm7Zxrhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI0PR10MB8569.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:23a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 07:37:20 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%7]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 07:37:20 +0000
Message-ID: <af16a67d-5b51-4310-91f7-67e8e956a880@kontron.de>
Date: Tue, 22 Apr 2025 09:37:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] Add NVMEM driver for i.MX93 OTP access through
 ELE
To: Arnd Bergmann <arnd@arndb.de>, Frieder Schrempf <frieder@fris.de>,
 Peng Fan <peng.fan@nxp.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Xu Yang <xu.yang_2@nxp.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20250416142715.1042363-1-frieder@fris.de>
 <6ee90a9e-cfa0-45f5-8036-bf04cb19db46@app.fastmail.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <6ee90a9e-cfa0-45f5-8036-bf04cb19db46@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI0PR10MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 1575fefd-56f8-444b-2260-08dd817083b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlBBU29MQVMzZHRJa21BYUVGSUhYQ2VIYk5QeHR0MDdwSGlQbjUwblAzRDB3?=
 =?utf-8?B?NS9zbHZ0K3hmaUtKbEZuZ0tvRVM5bWV3Y2w1L21kdk5yY0VOd0FBRE9sbWRy?=
 =?utf-8?B?TWZJRUUvOVF2cThmYWVTQStEcmpNY093c3E5eWVYTFJDRnpFZ0dUK0d1ME92?=
 =?utf-8?B?UmFaMXFtd0l2Y2dLVDJaOVBtVGx0akN1dE9MRnZlc21kOXJGT2ZFY1ZSUEp5?=
 =?utf-8?B?RTNRMng0WTBrSlFxbGFUS2w0VWd1QkVqOTRoSDdBL2s2and5M0oxTjVCSHBt?=
 =?utf-8?B?cmVrSzVoTHU2dk9sdkp1ZitJdDc1OGl4OTJMNWdyKzkrNXZZc1Z1TnAzenpF?=
 =?utf-8?B?VCt2RzBFK3FmcUdOcEZSaFk1TDAyQ1NWaFQxSjJ5OEowZm4xQXV4Nmc4Z0s3?=
 =?utf-8?B?bnVmVkthQlpKby9icmxSVE5TNHByL1FpV3lNaHJhYWIwVjBZdUtOTmN3UWky?=
 =?utf-8?B?bmdndUNta3VUbjA1SUZ1d3VzT2RjR1hHT2RHOUw1d3pFZnMzRGlqTHpadWdy?=
 =?utf-8?B?ekovWlZmazJTS25zdThrWDJzNGhJRGdxSkZEcExKL1VESHdjOHBXV1dhZWVy?=
 =?utf-8?B?RVZDd3pHdGZYNDJxb2tSSFFzOXNmVGluL2E5TDBZSFIzM3JPZ0xNRlFFeHVt?=
 =?utf-8?B?U1ptcnIrVzlta0hOZmpoS1k2YkxCVUhBa2V1L1pIam43aWEvOGpXaU1LUFRu?=
 =?utf-8?B?TmRheU5XT2phMUJYV05SME1NTElPUmZNQ2xyRFRBcXJGcTNRWlBWU3FNZzFa?=
 =?utf-8?B?M0N0VGpDL3MrL2NJb1NKajZEdWpJT0NzcWQ4WjAyYkZQRWJ6RktZMXRLNitv?=
 =?utf-8?B?R1ZvY1YwYktUVXVyWWZzdmNqelJhQ2dIVG9XRFhVcFVKdUIxQ3UxNHk5UTNY?=
 =?utf-8?B?UDdYR1ZVbWI2MDVjbU1lKzNHRnhFMlBtVUYxM2Zwd3NKZ3RDTmJjVk5ZWUht?=
 =?utf-8?B?aStZbVBNMk1DSDU0SGRqSy9Rc29NdDA1ZDNBSzZ1NnpoSGl0RVhOL2VYNkxi?=
 =?utf-8?B?SE9pL1dtV1o0eUNqVytpL1o1MWZ6Rk8wNkRGUWRLK1NxNjVyYk05YzNZaU5F?=
 =?utf-8?B?R1hYaTJQTVNmNXpwOVQwdGZ0bHNJbGhXdS9SK2JZb3M4YlVVM0NIUEVXMWFV?=
 =?utf-8?B?eXFNSnB6UXpQcFlkM1hrVldqVFRLSzFxbzFDTCtYZnJoUXNLMVdkdENtVS9h?=
 =?utf-8?B?K29WZk01RzhOTVJUbXR3eVZXMzlqd3JlNVRyYi84REpMcnZHTUNEZ09nQXlT?=
 =?utf-8?B?b3o5eS9ESStaNlV6eThtOVJRM0l1QlMwWmhITUh2NVRRRFBwQjF0SEFobVBW?=
 =?utf-8?B?UWNDSlhNNTBKUklkbkVaTzF6am5uenpYeUhRRzh1aWpNLzVobU5IeHlaUmZS?=
 =?utf-8?B?RXpGSHJBTWVPY0ZBSmNaQU50OE1TdGRwcWFreVpNZUd4aGsvVkxYdHpWbXJH?=
 =?utf-8?B?cWxqRDE1R0ZKa2xxT3poeCtPenI3dzFmbTc3NU83NHZkQWJoRXhCZTAyb0sr?=
 =?utf-8?B?U2RMZjVGL1l2WFA0R2ZUSUYzME9VUjh6eWVxVVR6RDdjZ2ptbE9RZFdWMkRC?=
 =?utf-8?B?YmFhVmgwSWJmam1yTzI0R0creWtTZGtyR2pjZkNlNG1xbXVtcFFnZU4wNG1N?=
 =?utf-8?B?SUJFZUNlczdzNm1wZSsvZmtmNngrUERLeGU4OThzUFdqbkE4WGxqVUtUYmFH?=
 =?utf-8?B?NDdWaytBampha3cyNG02cUNVYlU0TllaN2x1b1lmWGE2bHBJV3VWaVBSS1Mr?=
 =?utf-8?B?c1JKMzBNc0tlNCtQdmI3WTk3cEE5cTNObmo0SmpaaENRbDNFOFJ1NUwzelNM?=
 =?utf-8?B?Vmt4WERQNEk2cWdGSjZGL3pmMGZHWFRqdmJJbCtFMm9EQ3pBWWtWQWxlak14?=
 =?utf-8?B?U1I3VldWd05jWkdycVdIcEdFNEFYMi8rUHdjRmxBSmdnejRQaUVIV1J6Tzlv?=
 =?utf-8?B?RGljbTZEQ0JjTmkzVlVFNW44c3ZkbEd5Q0VqdU12YWg4ZnhWY0doZzdkR2l3?=
 =?utf-8?B?Q0pYUllubzdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFFJOG8wZEVGdVRlbEpGL1hTS3k4elBscEZ5SlluK1dXMFpvYUdjekgrNnll?=
 =?utf-8?B?M2hPbEQ3NGdhVGRIZUgzVUhhR0FaMzFHMDZjNmRjdmQ5YUc5MksvZnkzcU9U?=
 =?utf-8?B?YWVaTlBqZ095TlU1L045Q1JHYWF2SUg0UmlxanFmU1JxSmZaWTBNaU84dGFq?=
 =?utf-8?B?VDNscVRPdGlYK0JwUnVRc1pzUi8xYjlpY1Fld0FINEg3OFcyZ0EwTGNuNjZo?=
 =?utf-8?B?R21WNEkwSk5RWURTVGtoT1o2U2c5V1k1NHhRakF0eUFNZEpRYWZSeXlvMTZs?=
 =?utf-8?B?aGNDbUNRTnJsR1QwQ1dlajhWNVZDY05lU1VtZjRicEsySG5RdmcwMkRkcDY0?=
 =?utf-8?B?bFVRczdUS3poVDJ2V2E3S0lqaFBpSUdMdzIxWTJjcC9xQXZMaWRsdmg5dUsz?=
 =?utf-8?B?U3FvdGJVQWYrOG54RGJDNkJ2L3RIOWNFUnFBdThqdzFOdTFKalhVbElxUFha?=
 =?utf-8?B?UVRLT0M1YWJCcHl1RFVCT0dTVHFOb2gvVi9MZEdBMC9GMFNGZk9MbjVDZG9U?=
 =?utf-8?B?ZWxhOEhXcmkvaVFJeFVTOHh3d29mRkZSY0dQMkltb1JkUnBxaThXZThHVW8r?=
 =?utf-8?B?VFNMWC9oUGYxS3djRW5DcEVOY053b3BDVG16dzRrV3NzNXdURHh2ejZ4TTdX?=
 =?utf-8?B?SWRpZ0p5b3AyZUJ1OGlZdEpDUUo4Ukg1bThGSENJTlpPbzE1UkFiMnJBMWQv?=
 =?utf-8?B?ZlZFT0dhRUd1ck5Dc0xxd1c2bm9ZUU5CUGxWWmxLWEtlQy9Tdk8zV092TGQ1?=
 =?utf-8?B?czk2S2pBQmJpWEtUaHZsRDM0ekViRUVvT1pFSzh6RFBOSkZwZkdKbStoQS83?=
 =?utf-8?B?Q0NaTEZRTlZkNU9jam1WMXpiMU5hb3Q2VTdjK1lObmFPb1NWSGZpYlllQXZh?=
 =?utf-8?B?L0RJZ01OMTF0eVpYQzJZVEtQM092SUNFNEs2RTFSUm16NXdDSysxT1g3V2Rq?=
 =?utf-8?B?ZVhpT1VZdEtQQXRwL1hlMnk1bTNlVzZaVEJodmlOWUp4bmhXUzlDUk5WUnl5?=
 =?utf-8?B?UHV0SDIxbXZ1elBnbXRpZ1NKSytRWlBBNEZjbGlxWTRHUExPa3RKbGVsRDYr?=
 =?utf-8?B?MEdYM2EreFR4Qk1lYWo4SCszV3JUSGEvWlNTZ0VtZGZUenR5VnJ6cUUyNmhU?=
 =?utf-8?B?c2ladDJZamM5ZkgrVnovMXMxdXBQaDFZekcramNZdmQybkF2OGVPdTVtai81?=
 =?utf-8?B?dGJyUkxpWFZ2aGkrZWV6eDRwbXRvbEt0b0IvSjVML2wyN0RJWjVqMHRQQjZY?=
 =?utf-8?B?czJzWEkwM2c1Z2NFc0trWkFtT2lxL0FacXR2NDd2VGpnUlFWQkgwVnZLUnVO?=
 =?utf-8?B?c3NQRVdFcHBNUjZ0TDRWL3pOYVNHeEJ2N1ZnVkQ3Y1JKR0JRV3NZaXRRdUZ2?=
 =?utf-8?B?alQ3dGxqTEpaN2tiSUZ1SDE0QXd4WGtGMUh1VDJJS3cxMVM5VFYxMDc2cHNO?=
 =?utf-8?B?cFh5UVlPVUNoTkN2RUJNaFF1ZEFFaW53U04wZ2hibHNoSjZkVmNlTjc4cnlh?=
 =?utf-8?B?MmlYTXlyMEZ3VERlTnp6enpKeGFET2dNeHAxWlJSaDFvWEVDelNDVk1ldmww?=
 =?utf-8?B?VWpIWmU2SjJ1ZnBjS0ZEcjAyeG9jcjl6dTk0YXBIekVnWFlzWTRRTmZhUlgy?=
 =?utf-8?B?TjdxSy9scjJvdWtrcHhVNjB0amptdnVlK1Y3eERpNHJRdUhVTWlaZjduV2sr?=
 =?utf-8?B?L0NjQ01RdHMzeVBNV2RmWTZsaTBBM2VnUXJvQU1adzgvVnJIRmhucVRvTnV1?=
 =?utf-8?B?MzdiRDR1VkUyZHl0SkpoeGttRnFZSkMvTStJU0VwbTRlczQxS0lsSTVwcFB0?=
 =?utf-8?B?d1dmb21RNzhVT0JDNDdEOW84L2pnVmljNFNIT0wrRnRMamppZEFDWUUzajFk?=
 =?utf-8?B?R3V1anR3Nnp5d3VLcVVjem1HYWlXRE5TVnNDQlhHcHFvL2hwWHVSdUJzTG9n?=
 =?utf-8?B?NjRyRXJ0aGNSRmN3MSswekk3VGZkVzNCQXJHL0lQTnFtYnd1aGVBb0NZM3lK?=
 =?utf-8?B?QVcwOXJwRHlKWDBmckpCd1UyeVo2SlVLekprcWo3V0ZrZzkwclBya01jZElC?=
 =?utf-8?B?N0pFMTNURnB0MzlzVWJsY1VYaWNWSnJWenVGOE1JbHJUcGw4NjdFSnl3eVpN?=
 =?utf-8?B?NXdkSHZTRTJJM1ZwNWg3amxVUC93djJhTlNFVHIrTFQrZTFIU2liNnB0Ylpl?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1575fefd-56f8-444b-2260-08dd817083b4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:37:20.3833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqLyBoH0/9StQj1PRnuxNHy8oDWic1FQvMlr2C4E87zBeKJ97GWyq/RkYzEVHGnV+ncGrrRRValgNcJPERXOXDNv2KVfcFto5rJdEsParXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8569

Am 22.04.25 um 08:40 schrieb Arnd Bergmann:
> On Wed, Apr 16, 2025, at 16:26, Frieder Schrempf wrote:
> 
>> Therefore I implemented a simple driver that uses the ELE S400 API only, as the
>> FSB access (1) doesn't provide any benefits except for that it doesn't depend
>> on the ELE firmware being available. This is used by us downstream.
>>
>> For the upstream solution I would like to have some feedback on how to move
>> on:
>>
>> 1. switch imx-ocotp-ele.c to use ELE API exclusively
>>    -> this will create a hard dependency on the ELE firmware/driver 
>> being available
> 
> Could this cause problems for real-time Linux users? Usually going
> through a firmware driver adds more latency than doing the thing
> from Linux directly, and the firmware is usually not preemptable.
> 
> In particular, programming a one-time fuse is likely a slow
> operation in hardware, so it may still be necessary to support
> both methods if there are users that need to update the fuses
> on real-time systems.

Hm, interesting thought. I can't really tell if that could end up being
a real problem, but it might just be another good argument for
supporting both methods, yes.
