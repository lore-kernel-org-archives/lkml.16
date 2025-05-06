Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2114.outbound.protection.outlook.com [40.107.247.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632F327B4EE;
	Tue,  6 May 2025 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544656; cv=fail; b=IZU9ezYGY5Va8NhF8Gi4zoSdWnqmajtMF1FOj14dtbuMJPB8PyD2tEc2AH4YjHNyt7G+LwSOqsrMeO33ME9uG4aoK9Px7ku6RLPY8O3JME1XCfADL2LuWtWQ6SHkHc4FDiSDjmcx1DhjHDZ+dZprD7tSWk36m+7ZfDdFNHh5/tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544656; c=relaxed/simple;
	bh=t9VClMVKxyhmAr9RgvIKHkri3qWPQmVO+nz3ALoA20A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ka7MQ3Z0lNYbcYHi18bXli2PW4Ewieu5B+b3FIIF9b4octEZxT0TEvXbIxlj+rTCsMROcsiqjIN4yJpOjmSqMPgxReTNr70tMWrxIw/MiP2Z5J2LhB4DL8T+rVC7VuibFekAvCGGK+Hctkw3OK1c3lhZMBR4oedHY8FqSolnXGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Hw56btmJ; arc=fail smtp.client-ip=40.107.247.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Hw56btmJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEE7n6N14/J9xLpFwXFl64h4nYmach/4VZJW0oNd41pXQgCGXEvtNQMAQbx6VImcZl+yai2g0iI+7pMLosB0URQXHg5AFHvaiNvAK7gsTUO9rHMT8g9uaJEEERaoiFyT0f/lvuBkk8FR1Z5/PTi/ewHq9Mo3IK5faU6DElaXEnvhNmcZqMM1JMh9zcVuJ4EXUrE+alrdtfWtKG6bT6P+0NgQC3cpdR/4Ttm7W8imCOCKF6QdUfwCQw2wTITcHvUVJULoV9Gx+/QLCHoKXgKfUrTqK108/7/3IdrWGe1opqDXY7vMzvLbnxzpKfpHvaMxbzGT7R6iufhAPH/qlrwESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa18+lL6hd7n2hzp+rSu2D29gEv5bBuLrU8cXG4hBzc=;
 b=miwVHYnFNIwjWF9uqwsg9oQfqRByMBh2I1sWkLJlBGNXRXawggGG8iwXnNl9//Yk4/sqwWY4lsJsqJuT3qKCvDqNExf2con44MALoWZdjYSGart/tz7fKPymSdyIdlMvZU48MWs80X7iL91jKY2JH/u0ROFAjgpjzUo2G881PbXHW0wTC6sMfSR+EsTrbnPNAc2VL8nUbHc6Rq7iYrNZ2Qjeu2qlFW9TUWfY9ZuSmmITOqwqB4WTCZ8Dujqc+pytaME7BlDLkzR/4VSzFZpC3RPywAG29laGSgk7nvV0LrzXpEAu2KQ71BalEeaGRFvOo3MiuU2NkmcHKSSIfH4M9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa18+lL6hd7n2hzp+rSu2D29gEv5bBuLrU8cXG4hBzc=;
 b=Hw56btmJqn2s5ugb4shR74KI9R35knImbolAXr18V5SxhXgm4OgEFXTWeio2j+TjM3EzFOWHUP3QdMKCLprkjvLUxtus8C950f8VeI2IjVJEMMLY1x0nopr2e51DNXSjRgWZwKpzdob6aniiJdRhp+fHbq0rLC7awAD98LnR1nGmdEx2tgCiMbxZuhVoadBrb6YFE0BGsmh9yzB6FGKzjOdB2jikK/k1yTsEYEbuVQtAJx4zqMARnOj7wJYSVx8Ptgi0AMAuNgC3d2a1GlSKtnk6dfS0GItmfrriL0RTDNs08kypyun3RtqGj/NWi4a+TOizsrYbyYADskCsPqPCpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by PR3P195MB0508.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:24::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 15:17:29 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::369c:a760:5bf9:8d4a%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 15:17:28 +0000
Message-ID: <98726488-4b51-46c4-ad6c-e1365635ff87@phytec.de>
Date: Tue, 6 May 2025 18:17:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: k3-am62-phycore-som: Enable
 Co-processors
To: Daniel Schultz <d.schultz@phytec.de>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
References: <20250506133604.294920-1-d.schultz@phytec.de>
 <20250506133604.294920-2-d.schultz@phytec.de>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20250506133604.294920-2-d.schultz@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0056.eurprd03.prod.outlook.com
 (2603:10a6:803:118::45) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|PR3P195MB0508:EE_
X-MS-Office365-Filtering-Correlation-Id: 76acf4ba-1185-463a-e7c2-08dd8cb11d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnNlWXBGYzZ5SytibWY0WlcxSHQ5Y3dDUWVvQ29zcGFiWGFwWVBaYXhKZDFw?=
 =?utf-8?B?eUtMZ0FEaVlVYy93ZG1XZy9lNm5ZMUZRdjJ3bGZJUWp0VmNFa3U3ZDYvY3JW?=
 =?utf-8?B?dUgxZXQvNGFWdlJlSUl2c0dtbGNzRG5QaXFyN2FnQ0JPZjcvSWkveWpzTlB4?=
 =?utf-8?B?ZjNvNjNuN3pLK3N3dWxDWlp0bzZ0ZnhBdy80SnNXM1ZUejAycVBLVmhRbmhw?=
 =?utf-8?B?ZG9lMmdHWGI4R3gxYzMzVzhSSjFvOFB3MEFtc0JBSU42TDgzV2lBUmpKWjJZ?=
 =?utf-8?B?Y3RyZG9RdjFGeC82NWVFS2Jad29HWW4yL2hWSk5wcGx1YzZVbW4zWFd1R3VH?=
 =?utf-8?B?WmRMV2w4WThKS2NjUll0QjJIVXZKYnAwbnZybHVJa204QlBSbUh1c2R6ZlV1?=
 =?utf-8?B?VW91dzM2WEFJbjJwS09NZEY2S0ZJVjg4Q0VOUUhYUEs0NTRTOEV4UVNnZi9l?=
 =?utf-8?B?eCtIRG9JdUdRejlreTJGbkhLZlVHNUwvZGtsMmQwUGFlakJLd2NxRS9KV0J3?=
 =?utf-8?B?RWY5dElRS0NzQVhnSHRVa0NoWlJqWEFxTjFacjVtc2Jzend5RFlyUmlaRHlT?=
 =?utf-8?B?WnFoRC8wREVFRU82TkJWVTIvd1RSejRxMkNxV3lha1g2Qm51cTFhb0dsU0Qy?=
 =?utf-8?B?dVc2VS9sTVc5RFpCLzRqTVdweWQyWXQ3emRxejF5bkkxVXVzYTZHelBaWTJD?=
 =?utf-8?B?Q1Y2R3JWR09uRGlhZC9NQzdNNHlTQ1JiK2Y1MzBOTHlPbmRHb2tOZTZoU2pt?=
 =?utf-8?B?UnVKaDAwZHpldUVkbGw2WDlEWUVyQUR2YzhsNi95bWVpLzNHWE9uQUFWL2hW?=
 =?utf-8?B?amNlSnZxNFpjYUlsc0FrMHZ6aVFtU2I5cSttU2xnV2VuZ0szeEVySE8reHg1?=
 =?utf-8?B?WnFFM3p0ZHU5R1F4cVBDWm4yaTBQeFQvdkUvVzNBdDVFM0VhQ1hWOGVtckhK?=
 =?utf-8?B?clpTRFVNNm5MSStoekkxMGtUZnAzdXhQY0JPejJRY2tHWU56LzcvbElteG9W?=
 =?utf-8?B?dWhmTjk0QzNIYlBHOUNhMVBpSm13dTZwK0E0VFA0ZkxrWFpLMTNKTXBxUWhs?=
 =?utf-8?B?T2IweHQvZGxDVlI4TzlOa3hMV1RkSTFpZitQSUdaeUhvc3ZXdjBWK2hhekZt?=
 =?utf-8?B?TkQzZ3ZhWHNsd0x4VXBkVWxKV0FrN1BZV09RWXdQeWRPTkpXRzJySWlLTzVG?=
 =?utf-8?B?cEl5SWJha0V3bEd4bXJicnBYWmZ1QXB6c0pvQ1lUYnZMRFBvM2MxYlp6b3Iv?=
 =?utf-8?B?bFc3Zm5ucCtpVjQybHpVN2lJMmdLakdIcUZzeVFGTkQyUnNya2plZ2QvNk5M?=
 =?utf-8?B?bHJ1aksyazRMTnZ0Mnk4bWdJeE9EL01CRHMrUE9hWnVvK2VUWHlPSE1OUnZR?=
 =?utf-8?B?SFI5U3FzVHRzNzRUOWtialY2NldjK1ZGUlM4RlNEMmswNXg4d1piTVVmSm5O?=
 =?utf-8?B?Tm00STV0NDcxNkFuYTN0QVA3bnRTUFdkY09aRk1jME5aaWc3L00wWjlENW9r?=
 =?utf-8?B?VDREeUYzeklnRnpWUE4yRk9wNXFyaGZMbkpBMmt0UHlzQTJOWEh0aHkwLzZL?=
 =?utf-8?B?ZEgybGczVnIyRDBncXhDQzQwL0NJOVNSM1ZIS1p5SFFaa0h2NWNIWGw2TThO?=
 =?utf-8?B?aFFxTmpvc00xc3plQitNbjRUUTBVUm9VOXhzTXJud1RRYlkzSGRsNnovVkdz?=
 =?utf-8?B?K1JpWVdIVlovdXYwNElkOXZ1VkVzZXFwcGhQVVI0Wm4zdGpXT1pjOURzV1pi?=
 =?utf-8?B?ckRPSkRIRDNyWmU5ekV1MjFQZWJMZ0FCNTVoaDBSNkNzS3BWVWh0NHAvaUxV?=
 =?utf-8?B?UzFTdVlFTlpnRmVOWWJzd1lveXcySERnaDhwSDJDQnZrMlAvcThVL282N2k5?=
 =?utf-8?B?Um1lSTd6enc0Wkc5aHB0c2VMK2FoOVF1MzMvMzZ4Wmpxall3V25vVXdCUHgv?=
 =?utf-8?B?R0JlUnRhTWp3SDFsVzYxMEN1YVcwOGxvYlpmKzVRRllLeHJNNTJWZlFKdzNH?=
 =?utf-8?B?dnhEcmZWS3pBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amVUQjIxNVJRTkNTVE9qMVRLUUoxai8xbW9kTk1OK2JXcVRzd0xmTHBNbzQy?=
 =?utf-8?B?ei83TTkxNW8vMXlyd1VGWW5BV0VwaWtOLzFtRm1jbFU4M09aRWFRVkwzNndO?=
 =?utf-8?B?WVNmZm13TVhqZDFsYXFQcTVJcGxMaWNkUkp6QUxsc2ttL1M4NzV1eUY4d0Rx?=
 =?utf-8?B?b1dJVERjZ1FsSitsSjJzRXdqYmg2SC81YUdsRkI5VSswMzFPYWVrZ2hzb2VE?=
 =?utf-8?B?aGZXY09yMG4zb0dXK0cyWFpXYkpFcmZ1Ym96ejZIKzZzbGs4Ty8zbWQvbmZ6?=
 =?utf-8?B?ck0xaldlM0hlU0gzczRjcHRxd1hucW5YMjJIMFJ0MENySG95UTg2YTBNNTV2?=
 =?utf-8?B?Ujk3ekFRT3lJKzNjaEVyUStTNXlmMlRKYXVKaE9tcGk3RDVWenBtWDBUempF?=
 =?utf-8?B?cTd1VnNHbVZNdVVOUFJlWVZkQ1YwZEk0RDFuQlJQWTBlVlFzT2RJT0xHcFVP?=
 =?utf-8?B?N1FZb2RLcmVjdGxodUtnM0ozWWUvb2xYQ2VCaUIwMkVUS2c1UWxIczhxQ3Bn?=
 =?utf-8?B?R2h0K1ViOXIrQkdqSDVLOUZ2QlFYVnNkRHlveWttVUtlaG9pNFJoRHJ0TSt5?=
 =?utf-8?B?YkJwY0tYWUFNME1DbU5PcERUcHpITnB5QW5MTnp3czE1c0lyczdvbmhpS0dG?=
 =?utf-8?B?R0FNMjJGSG55M0xORFgvbGRyT0F5bDdvRXowek5oc1ZERHdwVC9jenVLbVAz?=
 =?utf-8?B?bkhESGpMcmtheS9ZaGhQNHNSeHlhcks5QmF3dWhFMkJvYU9mdlFUWnRPSHBF?=
 =?utf-8?B?UEFuSmhkWlA0dVA3VHRYM2lpMWUxYUhtek9COUlQQW04ejYxdC9kQUJ0ZGdP?=
 =?utf-8?B?MFVNbUFBZkR6bGRVU1BhMUJ2cmt4ZUkyb3VuOWZERnFzanJWbGNnUkorT3RM?=
 =?utf-8?B?eC9GWEo3YlNuMEdpOHFWSWNZZk9WWFVLZTVsQ3VPRGlVZzRVWExNWndyOFVw?=
 =?utf-8?B?NFRhZUhUa0xxVkxVNDdrclNkOWJhMTdaK0I2RTdFUThjN1pVTzV3QlJkajRH?=
 =?utf-8?B?UkdSZS9CV0FhWERaMDd1VVZndlBhN081bGZ6TlN4N1lINjNkVFNzMFk5bjZS?=
 =?utf-8?B?R3NVUFlZTHdYUzBreGVINHJJTkxpbEI4eTdXY29yNjRCODlpNURicEFjZjF4?=
 =?utf-8?B?a3oxbXJXUWZCU1ZHT3NJdFFlUmlybFVnbEIwdFhRdm1tVXA4UysvSFdtMWJH?=
 =?utf-8?B?eVJGZTNZWGhDMzlNNzJjdVU0U0R5Z1puWWtocVR6aWN0aDFhUnV5UVNFMmtW?=
 =?utf-8?B?SHFYNGRLVzdpYWtNUFRpQkh1UFdhdEtsdDEwUDNKM0RnQmdWN3R2OGM3ckxH?=
 =?utf-8?B?aGdtS0tUR2x2ZGw3NDF6c0taTDZJOVlwTllHLzJzRGxpTzUwZFdTUjJXVUNz?=
 =?utf-8?B?dTMrRG81cEFscVErMDUwbUxUUkhXaTkwWGNCL3FrZUM1Q0pSeHBDVWtWZG5a?=
 =?utf-8?B?VG8wSlg2eDZ2WktzUnlGb244ZGRVcG5NT1BYNHRya2VMUnVnOHVBczhsTFdX?=
 =?utf-8?B?MVhHMjRmQUJsZGoyemdHU3RtclYxamJ1ZUJkc0ZFb1pvRVJwbkEvcXhXM09D?=
 =?utf-8?B?YzV4UHBJZk1wZUk0OVNvd1VLN3BSSE1NNG80cnNtb0pMdkxnS2FVQytjSXFT?=
 =?utf-8?B?bTN4Tlg5SjJ6NG9jSldmcWRuMW5NWG9XdHIyMHlEYXgvcHU2alV2bGNwQmUr?=
 =?utf-8?B?RHFZMjI3cTZSeE5EeXVGOG5jeTVLTncwaEwxbEtkbXdoTy9xY3JsMGJhTGNJ?=
 =?utf-8?B?S0Zjd25HS0hsUWFWZFBFUFl5UGQ2Nlo1eDZpZzlXSXVxV0s3ZWxCWVdXa21k?=
 =?utf-8?B?OVdJNHlIRjBLSGc0L0FUdGJ3SEkzWnRCYWRpMGREeFE3dHc1MXFKdlR2N3N0?=
 =?utf-8?B?Z3JHV0t3cFRiUTUrUGFTdWtkcmJLMGQxR1FVdmRpaGVsc0NTQ1ZoRWJXRU9K?=
 =?utf-8?B?SkxhdEhSRC9objZJM2xtQllBU0I1Z1pPY3lJOEFsZzV5VTZZdGp6SFNLMEFN?=
 =?utf-8?B?TnNRb010TzM4ZW43OHQzNFkvSnJ3V09weWJ5aFY4Ry82Wi9RRXZtV29DbTR1?=
 =?utf-8?B?dHE3Y09zbUNrV0FoUFVHMzd6Q3JGUHVOS1ZBL28yZ1FzbmI2UkRsZXFEMXNv?=
 =?utf-8?Q?FYVno5n/GQcXx8SHkn69a0/2n?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 76acf4ba-1185-463a-e7c2-08dd8cb11d73
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 15:17:28.8885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBPrY50jJLoZb1UJAjIIWK+IthkPIWAj5891k7kGYNH5sswawlrz5cFphz+S2Iwxo7jkEZDh5s+IBKhmiY231w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0508

Am 06.05.25 um 16:36 schrieb Daniel Schultz:
> For every remote processor, set up dedicated memory regions and
> associate the required mailbox channels. Allocate two memory areas
> per remote core: one 1MB region for vring shared buffers, and
> another for external memory used by the remote processor for its
> resource table and trace buffer.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
Reviewed-by: Wadim Egorov <w.egorov@phytec.de>

> ---
>   .../boot/dts/ti/k3-am62-phycore-som.dtsi      | 35 +++++++++++++++----
>   1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> index 55ed418c023b..3075979935d5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> @@ -64,6 +64,18 @@ mcu_m4fss_memory_region: m4f-memory@9cc00000 {
>   			no-map;
>   		};
>   
> +		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9da00000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: r5f-memory@9db00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9db00000 0x00 0xc00000>;
> +			no-map;
> +		};
> +
>   		secure_tfa_ddr: tfa@9e780000 {
>   			reg = <0x00 0x9e780000 0x00 0x80000>;
>   			alignment = <0x1000>;
> @@ -75,12 +87,6 @@ secure_ddr: optee@9e800000 {
>   			alignment = <0x1000>;
>   			no-map;
>   		};
> -
> -		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x00 0x9db00000 0x00 0x00c00000>;
> -			no-map;
> -		};
>   	};
>   
>   	vcc_5v0_som: regulator-vcc-5v0-som {
> @@ -240,10 +246,17 @@ cpsw3g_phy1: ethernet-phy@1 {
>   };
>   
>   &mailbox0_cluster0 {
> +	status = "okay";
> +
>   	mbox_m4_0: mbox-m4-0 {
>   		ti,mbox-rx = <0 0 0>;
>   		ti,mbox-tx = <1 0 0>;
>   	};
> +
> +	mbox_r5_0: mbox-r5-0 {
> +		ti,mbox-rx = <2 0 0>;
> +		ti,mbox-tx = <3 0 0>;
> +	};
>   };
>   
>   &main_pktdma {
> @@ -386,3 +399,13 @@ &sdhci0 {
>   	bootph-all;
>   	status = "okay";
>   };
> +
> +&wkup_r5fss0 {
> +	status = "okay";
> +};
> +
> +&wkup_r5fss0_core0 {
> +	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
> +	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
> +			<&wkup_r5fss0_core0_memory_region>;
> +};

