Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C071359B71
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743475783; cv=fail; b=FyWFSE5faRl1c5y5YX/K06qwinwUQ2MC9riQb7m3v9J417yg/eMSMWNbLjnbM6ncCbzWpq3nu2FzNW93iyrsHn/Sg6teazFyDi575cG0acLKeNBTc7oilvuNb6FqwVIdZoCu7Uy1OlTCm4OFblLk6r+1CmNhzpDQhnlCi+AFtxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743475783; c=relaxed/simple;
	bh=JB8Yw3R3mgTQAx+nViqQmb/h1noRQms1d2kqop094b4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hPUMgv2tVA6BACv6o7BKC08saK5x+lLrga5Z6rVlTsCwSo+JmvD4ZjFmOeCREgjVlRE1KIwf7inIPFT88uzBj+S5NM9uFMqfNtNGkOhVtFftVRLb9U/+pA3w3AIZjUuXzlfDQNh7DN4L98EcGT/EeB0Feb0B2eDmHOb0SLlCank=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JVlgEbNv; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JVlgEbNv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDqPSRBMxuyUs1DeqpM2pTofr9iOfKxA12aKu69V5ZPseExsejOdtbU0xUxraYBCM5RUXc6I3cW53DTw/3ynUbap1AITOqIPiD9eev7IIIfbBQ95pnzNg9GGd+XiO1cVYqy/18SiT0boxfUiiglujMcIe1fJj/5bcctya8yrTYGE43ZbhZ4NRfedsBRNXrCptbjTpefsMbhe6DFb8+kwv4z5zNmJCs3nSYN+ArpmzjQX8Lg50mQ+DUvig/oQdyCivChz6iRZDntye2gQ44qOjcDGYJLKp+R7HqArjy/T5GagIWwCpatoD4VxheDvERT3nGuT1MxrQZxnyde2avHQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JB8Yw3R3mgTQAx+nViqQmb/h1noRQms1d2kqop094b4=;
 b=kNVMx1I6HybxWnU7TfAOrxHvo1ilndvGaxhmIjaUR4ATXxuMz2uaMMJiXoN7sMS4EpI4l8Q/6xpeWvCytZwDhsRV7JOz/Rgos6jcZ3PnbubPiufneqa6OQRr9lCRzlrhU9qXf9Ma2Zb42kX6chWcdnV5ZGQ75YMVA3l7Dky+z1cBUJV4ty0/uP8yITlloUPFMi5bGhFm0lvQThcCWWtiN0TZpQUOe2oVzFYjoTswYkoHHU74Lp/oBnOSqqWqjJfYo5X277f07WIclVBE9kKFFlXfPQH0WTlPZGsJ4n2iYCGSUKgbNhug+ttmM0X+v66PdiOafieg0TLuSHVk+Z0mbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JB8Yw3R3mgTQAx+nViqQmb/h1noRQms1d2kqop094b4=;
 b=JVlgEbNvAmfiIfZJUIl/8m1wYxozgyqCygbAVqbG2gc9tzj/eNeci9uNC+hu+6LtGezsKblCxjX4SKLo77o0wpGUhjpmxhVSaKVPo3YDqdzqpdhmnBdgJ0aoZHKIcKHckS0bvM1+yzpHb3C6rPrvogT8pSCLD1tJOqKocodAy7PaB5M3CMDjdcTO5IOo0Nfx1FuYQDaEAMYj878vxAC6Tzlf6m26rJsPrb7fLb6HFfyAF1qPN+0TwIDivywF3ePl/cLu6H21tIoj79BU4e5g4OzjT2biGwzGTL4vsEZ5SFm62sN2lk+M4QAEqD8y3+QgH1hk65tiSvnY0ekZ9QKZCw==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by SN7PR12MB7935.namprd12.prod.outlook.com (2603:10b6:806:349::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 02:49:39 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 02:49:38 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Yaxiong Tian <iambestgod@qq.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>, "hch@lst.de" <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>
CC: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yaxiong Tian
	<tianyaxiong@kylinos.cn>
Subject: Re: [PATCH v2 1/3] nvme: Add warning for PST table memory allocation
 failure in nvme_configure_apst
Thread-Topic: [PATCH v2 1/3] nvme: Add warning for PST table memory allocation
 failure in nvme_configure_apst
Thread-Index: AQHbn4J1bxMx/mKOY0ys0igkQXZdkbOOImYA
Date: Tue, 1 Apr 2025 02:49:38 +0000
Message-ID: <0cfd6ac7-7063-4739-a3a2-8c080c3ab02e@nvidia.com>
References: <tencent_4A5421BA11BD9C5B5BF3CEA95FD212AB3107@qq.com>
 <tencent_10073A637F934BE4C78884A0465872286C09@qq.com>
In-Reply-To: <tencent_10073A637F934BE4C78884A0465872286C09@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|SN7PR12MB7935:EE_
x-ms-office365-filtering-correlation-id: aeeacb4d-349a-4a25-8942-08dd70c7d85a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NEVKMlJXaEFpS0hFSWQxcWgvL21ZZVd3UExBRmtMcmxvZ0JqanNJamhUZFZw?=
 =?utf-8?B?dDhFWFhWbGVMdTFHSUlCUkFDam9BTTREV05EcDZVV3ZkSEJORkZmT29HTlN1?=
 =?utf-8?B?VG51RS9iMjJubzJRWG54UWVYTldhQ3gxeGU4M1hVOGNtY0w0UTVPOUhYaWZo?=
 =?utf-8?B?ck0yaHovU2xzSlY3L21PdTlCTUJQV2hhVFNzR3U4YTlvZGplekVqR0dGOWVK?=
 =?utf-8?B?dTZVY3E5aFJJQ2FybzBIcFdDVjMvTDd6RGFZZTN4bHNhRGtGMGMxQy9hM0lN?=
 =?utf-8?B?bmRXVnFOaWRMNVNuRjlybndvWnIyYnF6UkNITWR6TVVGeW1mTmhsc2hja2lO?=
 =?utf-8?B?QTdnVktqVzhKblE5Z3NiRThqelRNWFpzMC9QcGpGNERDOTVXK2svR2VHVG1a?=
 =?utf-8?B?RE1WNXQ3clc3L2toUG5mQmpLODFTOThmTGQyM2J1NGkvMHpKUTVGcmk4L1pN?=
 =?utf-8?B?TVdMOUtWQzV1cHp0RmY0eS9lclRhOTFVa1FrVjNyQ1BET0U1czlxMlk1eHdE?=
 =?utf-8?B?NzQrbzZDVTc4ckpDdEUyMWNPeFdwTW9hRDFjVUdhcDR2RWFYUjBYRkEzN0VN?=
 =?utf-8?B?bmNIWjhmNEM1SnZueUN6djFLSVEvVmUyM2ZxQ0RmREcybks2eWd3VUFyWC85?=
 =?utf-8?B?NUhYaURvWmppY2Yvby9YU0dqZUZZWHE4VWZqS3V1ZUlITUlKcVdzMWRla1dL?=
 =?utf-8?B?RzVvUTBaVjdkbUc1dW14UlZYUGUwWk13NjdyRUtuTGlobGhBcklPcGFiU2xC?=
 =?utf-8?B?MDFIcEZ1SUlaUWdZNm1xRlJUcHM4dE55c1NOWEd3dzBrczMvWWkvTzN0WERI?=
 =?utf-8?B?UmRoR25sbHBQYUxmekU2T0F6K0FlVDFCSUlRdTJ4aXZxd05kTy9KS0lrOW5N?=
 =?utf-8?B?QzJSSjl2eURlZnVVcUgwMS9FRDYrUU05cmJ6a21kQkVMdkc5cDR0NFdMcC93?=
 =?utf-8?B?ZkJlZVhpWWtrTnpseUNLUlRpYSsvZUFScXR1TzJiWDJ4dnFqV09UdkJpbzUr?=
 =?utf-8?B?SjVLK3BzMk9rbkVYczZhdmROeVhWUXkwQTcyZy9YQkp0MkYyaEZUZTZLMHJt?=
 =?utf-8?B?bWFrb041bHd1eDFVRFVIcHhaaDNnUWFMNWl0RGtDakxtSUNrQ1c5OVEyZkJS?=
 =?utf-8?B?WThvY1FFM2plNXpqRDFhU0FyTkhsNWlmYlpOMmFPY2pkZEVYcDgvbWdhR0JD?=
 =?utf-8?B?TmRNcVVSRytXY2g5RDJ6ZVdxa0RwdmhMMXFFRlRlM3BSNmpibFNFOGdpVTZG?=
 =?utf-8?B?Y2ZpMGFMVXpVc3J4NllKdlhsT1g1R05qTS91K2dwdUJHaHU3VURCeFRIbmJU?=
 =?utf-8?B?VXBvSUM3b1IzUzZ4aEl2WUpXYVRDekxlSlNhRkVrWXhrN2JXMXoxV0VPb1Jm?=
 =?utf-8?B?blBYYUEySy9GOVE2TWgwZGp2UHR5VllpbzlqRGR1NERwMDhHd2RUMFBmS2Rq?=
 =?utf-8?B?ek5OeTd2MytCNXJwYlBxdUMxZExmRDBlK3U5Mm1kbktEYzlFY3JOTGdMb0Rx?=
 =?utf-8?B?S1hvR1JDcmxVNCtmN0tUZUtaWHVTc0FvTlg5M0hGM3lFZkIvN080cjA1RC9q?=
 =?utf-8?B?b3Z0RkI2WjBsbGhiRUFrbG1hbUgrZmdtZjJqNnB5eTZhOW94NklJVUVYZVpR?=
 =?utf-8?B?cUU1bjVjWFBhRzJBK2RnK05FWmdpUEJtenhZKzRyUUkvSVZDUFA3VExmTFBr?=
 =?utf-8?B?aUMxRWM2ckg5TjRDTDVLVWhIb3ozd3IzeEdkSW0ydlZlZzlIWFkycThEVGQ4?=
 =?utf-8?B?dDFHeUptOG9WNyt3R0tyMW90Nnd6ZTZvQTZEbFZmY0cyNUJxTnJTTHpVWlIw?=
 =?utf-8?B?WHVSQUlIby9QTmVsU2pQcTQ2MTljeEkyb2JUMzZHQ1ZHWnAxd2NPWVp1K1ZL?=
 =?utf-8?B?YnpjWmwxRmxCV0FuQUlOT0Z5bE9IdjZmTEQyM0hvT1JLR3UzRHd0M0VVTE9Z?=
 =?utf-8?B?ZUU2T3BjTXlGaXYySTI0M0R1a2tpamRYbEZxRWE0S3VDTmcrNCtmRnRUQXJN?=
 =?utf-8?B?WllVMWlXNElBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0hvemhNcDdjN0xzMnU2ZDZ1cXlKeWdyNERKRWk5T081S3lCdm5peDRXSUxI?=
 =?utf-8?B?dENNWVJsM3ZPVlc5TnhDMXo1TWp0WWMwZkhVY2s2aytaS1hoMkxxUG9wZXRV?=
 =?utf-8?B?eGVBMUM5ZElpenhaSW9TYzNJSGppN3lKc2Y3THJPY0JMOVNCUDhrQUFvRTc5?=
 =?utf-8?B?QXZ2VUpzem8rQ0dMQjJEUkFKR2c5aXdySkpmOGp0UGsvWG9Uc3RzajFPa2Zq?=
 =?utf-8?B?SnRkRytUaVI0V1FMNjRqeTA0QVR0cDhGYytaUFVKK0toRFNLN09PSXVxOTA0?=
 =?utf-8?B?TmFMRk9PRm1pRDZSQUJ0TVJBWERpajQxVzNXNXBSa2xyUE04ZnBIcnB3aEhB?=
 =?utf-8?B?M3p6ZEZ5Z01jRm1vbFhrdldBR0NuYVdWOUN6aEtSWjVGYWQ3dUVHYS80VEtX?=
 =?utf-8?B?TlBQZUFkaEdEV1RITjBEMlNrTngyYTRTaVZZVlU1ZHhIdDQ2RC9lblNGeElS?=
 =?utf-8?B?ZlRTTkZCdzEvSnRzUDNkNmExUlc2ZEx6eDNuZkdXWWtVa2MxK2w0S2dDZXMv?=
 =?utf-8?B?bkwwREErZUJReEtaU1dEeGQxYUgwbWVFV2RwRUI0YzlSb3hzMnBCQmlCYm1v?=
 =?utf-8?B?VjBFeG1iN0pLY0RwOUZYbmJkaXRpSDcrbzdJaDVSQmYyYWtlRjJIcW5VYUJU?=
 =?utf-8?B?bzNxZzZyYmFTd2pMOGo2Zld3VTEyUnRkM1FwMWhEK1kxMmtacFBVMU92VVUy?=
 =?utf-8?B?WEJlUkpJKzNEVEcyc2Y1NSsvWElBaFl4RjZhdE1Eb0tRSkpuVGo1V2lXQ1RM?=
 =?utf-8?B?a1UvU3lSK3VRR3gwMVdJNjczL0hiaFNIUUZITDJqS0VoelFYTm4rNlR3SU9W?=
 =?utf-8?B?elBxUlI3eVJsWWJUWGlTQjZzTDBNSFU2bUp4d2RKY0NteGlvZCs3NTF3NTV3?=
 =?utf-8?B?RUg1Nm02ZEdaZDBndEdXYjQya3NRLzYvdW83VDV0Y09lbEdPb084RjRJZGtC?=
 =?utf-8?B?cCtENTdldDAzNnNYSEJKUGtBbWNmcHVQUytxak5lcEJkSVJRMjlFakdObkM4?=
 =?utf-8?B?dkVsUkY3RVZZblh4RVhwOHpKRE16QnhJNVNFVEw5ZHpXbmxTMXl2SGhuTE1Y?=
 =?utf-8?B?elVnd1B5czBKMUhJOW1tMzUzYnFjVUd4WFBSenNJa0QxZ0p3c21OYk1yRHVm?=
 =?utf-8?B?L0s5N2JDaUFLTEtpUEhUZTdrdnBaNzJkTktDQkhTK0NKMWFoQXdTZm9zNXo3?=
 =?utf-8?B?cy8xckxZdDBZa3NtM0s0QjF4YnZ1UEJtdVEwcHFhK2xJdk5sdFlTRGFka2J4?=
 =?utf-8?B?dXU4RHNnL2J1Ry9uVVp5MDNNVzQ3Y3M0T05BbFp3Y084L1BJODJnZWJnRG5z?=
 =?utf-8?B?NngyZ1FCVnZmbkZZQWQvTlkvcWR4bXRXMXNGMTJXN1JGcmNNTDl3eStwRElI?=
 =?utf-8?B?dEczS0ZMTjh5UlpxWDN4QVM5Znl5cHBhQ2tGNHZOUGxkZ2c3aGpLNU51dmFX?=
 =?utf-8?B?TGkvSnRlTnNsMVFVeTRuWHZLSnp1TEVMSjBJOEtJNU84Zm00U0FDNEdGT3BS?=
 =?utf-8?B?eVR5Y2RKT2VWdUxXb3BaTFhqK0hFR0xxZjhXM0xXbFBHYk5Na3BqUFJsdEJL?=
 =?utf-8?B?clBDZUdKTWZGeUJiK1MrZ0FQajRZZGsvWHhUM3lpQWs0WkI0UGpnK050elE4?=
 =?utf-8?B?czMySmR5RHgyUmszdWxhZWJMNUVVVk03TmhpckFncmVWSkdwckxDRm1teFJl?=
 =?utf-8?B?aEc5c3ZKOUFRTEdPV2dUUHA0d1Q3TEtUWHdQQWRlN3BjQmtoNDF0czNvYTRY?=
 =?utf-8?B?dzNwbStXbnhVSGlFVG4xaGQ3NzEzRmoweTYyVGZ0MmJycm9UQlZEM0phZ1la?=
 =?utf-8?B?akFDSTg5WE56NVgwanZzQ3p3b1l6L0xUK0pwckRXL0JOMGpUU2NWSVNZelpG?=
 =?utf-8?B?dFdtcXBoek95WHJCOUpGaXNxN3JMUEsrZWV2b2ZRNlZ6bTdIMU9nMnBpZ20w?=
 =?utf-8?B?UXhXcnBET3I1azI3UDVwK0wwN2lUUThvS3RIdTR3ODJHOENPVHEycmcvZzYr?=
 =?utf-8?B?L1VWMmk4RjkxdEliTllWckJCcDRGbGFNbFpzaHdvbHlzMEF1dlNnblpSeUlR?=
 =?utf-8?B?TWRNWStaTWR4MktJeWpLSm1Gd2VWd0VRcnYyZDRuTnUwTHB3QU1XdG5XSFhi?=
 =?utf-8?B?MTlDTnpQb05LUSs1cVZnSHQwb2lxRGtQWWJ4UkRFM0pORktRVmxtUjZhMUJa?=
 =?utf-8?Q?q7YBYD6haFDKfnHJnLo38V8zrUx1aVk/W5cmwto9Pk/K?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F245D669DB1994AA1941716355E5298@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeeacb4d-349a-4a25-8942-08dd70c7d85a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 02:49:38.6626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2NWFALIRcY5dRjuQae8x7xl+z1YnppVHaf19/eoD078rU80erEiZmPYLQirhkUPmAVlLaAmLbHoc6ROg826cng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7935

T24gMy8yNy8yNSAxODo0MCwgWWF4aW9uZyBUaWFuIHdyb3RlOg0KPiBGcm9tOiBZYXhpb25nIFRp
YW48dGlhbnlheGlvbmdAa3lsaW5vcy5jbj4NCj4NCj4gQ3VycmVudGx5IHRoZSBmdW5jdGlvbiBm
YWlscyBzaWxlbnRseSBvbiBQU1QgdGFibGUgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZS4NCj4g
QWRkIHdhcm5pbmcgbWVzc2FnZXMgdG8gaW1wcm92ZSBlcnJvciB2aXNpYmlsaXR5Lg0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBZYXhpb25nIFRpYW48dGlhbnlheGlvbmdAa3lsaW5vcy5jbj4NCg0Kc2Vl
bXMgdXNlZnVsIHdoaWxlIGRlYnVnZ2luZywgbG9va3MgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6IENo
YWl0YW55YSBLdWxrYXJuaSA8a2NoQG52aWRpYS5jb20+DQoNCi1jaw0KDQoNCg==
