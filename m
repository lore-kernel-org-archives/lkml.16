Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2087.outbound.protection.outlook.com [40.107.241.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F7822689C;
	Thu,  6 Feb 2025 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840051; cv=fail; b=btVcvECT64oqvPMZ9dz5SsFEWlyJn0OdtP2xx5aqInd1cZewIGVeqCjhhkjlRH6a/F3+BwbfM/J9g0Tk52rt95LmlUyG6gNZZVki52MoTPcT8jI7ktaq+MJ0P6VVARQJ+/MzdTdGhwF3ngXA0meTZD4LUENYJbXsULPiXnRfEQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840051; c=relaxed/simple;
	bh=g0V5D67KgIJXezaZxUJQb+1oas0vi+tlIixVJqHtH/o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MMKDd/Mir0czSIyHXNlTr7o9T/1lM1mxyuFi4G0oYl5/sh5nIrOz1Zs8sHVKT3/zsaS2z2qEPK73u8CWmf9r1AWbFQAqcdY+V03rl7CAhef21NK9yPnS5HFwMEE41vmSfC+r/3EpV/Hnoyp4uT85qXszpzwqDcxSQbGZ8bvbvZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Bp/dbI8h; arc=fail smtp.client-ip=40.107.241.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Bp/dbI8h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVXSVrcurN7zQeKMkzuVz+6Q9hWcsmkhw+71+iE9cV6W2sLu7xU9K3ykTqbx9fuAwmvWErfEv1QbBBUrpCYIIp//+944idsP8FvOY19qmUCOj27tZFDh7VN4iuXQJYettsuo9161yPFZFSeQQYC4Ss2zd5g/H+D8iT4Uigw+dtapV/0CJxMNmpc6Y7KHcOwdGwjaEQwV1pNI9G/pMqa7NKNrzj73Taz5MZnWDX+OCSxiLIaZKqWwUJAZMi5a+ygmoZMlw6XcOvqZq5yFZsme7OYtpceZ3WsPCsffMgJQ5xClcZMRmXn4WPtVmg1/qyMGvpkDWmw5G246xB7orohaLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3lsNBpry53bcwrVkWMVC3gpxYs32Kn+Rwp+tHKHPoQ=;
 b=FsV6pLfgGYtI7LLW6d5NEgnIDEz8qoDTcJGAbbgrRsAs9AxUcrVNZlglryraQe/FDiWPxLR45IzbygafQBG4NUTbTtEmizPIBGP0DcbNba89DAvohOO/G83ccI07aPbqnToLfsjxfusraXckRSwDjMsG1B1AzRWiPE+IhEy+/xabBvthV/keIZOdxAZ0LfzEQ3X6TqlolcucwFa6EVMzlTAlncRdVSDvWQ5qqcIa+YWAmk/jX41BoVghqBFWokNqp46DKuKukwsU9WlgLqzVnmgyChUMoW9SeMuhcNFVygYrYWTcdYwpaOpF4iF45Yu3s+Fi/7kF0VaAoN7E5LpM/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3lsNBpry53bcwrVkWMVC3gpxYs32Kn+Rwp+tHKHPoQ=;
 b=Bp/dbI8h+G+QErHf9PspLfgr3ZQUsAIR4StpBRoeLRRiaeLV8rFEvrSidiZBgMGhjX4dQ79nXONDCuFP1NS0k470p/VqwMdaPuqTExOoi4blmFF1W0cW6qlS8nQRPI3n6qaibYGkKpXthc1WswqL+BpRigmE0S8ZBd2JQ7pP3YM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10931.eurprd04.prod.outlook.com (2603:10a6:800:271::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.13; Thu, 6 Feb
 2025 11:07:23 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 11:07:23 +0000
Message-ID: <110a35c5-9450-47fb-9d5f-0ba73e290bf5@cherry.de>
Date: Thu, 6 Feb 2025 12:07:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add overlay tests for Rock
 5B PCIe overlays
To: Dragan Simic <dsimic@manjaro.org>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
 <20250131-pre-ict-jaguar-v4-3-c971e2852e8d@cherry.de>
 <77b5d0efa6e56bb391575aeeb4d1be80@manjaro.org>
 <3de1cc52-5579-41b1-a333-0c4e81f96fbd@cherry.de>
 <cb8f370474df88d1194d9ee92d3ca4e0@manjaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <cb8f370474df88d1194d9ee92d3ca4e0@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10931:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b005711-d6c1-483b-4739-08dd469e6e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YllKZ0xkSHV6dVh5ZE1DK3ZHa1plY1ExMFQ4NU5nNXk2WkVRQmdEK0JQSE1n?=
 =?utf-8?B?TmovYkFsbDREOFNTRlIvN3VjWGRvbVM4dTc0QS8rSENBT25kK3ZzOVlJY0tE?=
 =?utf-8?B?SllaTDlBKzY2dUJwWW9CQ3R0WHdmakFMTlVnSXN1NWN6a2xmQS9EODhJOWZi?=
 =?utf-8?B?aFN4ZFF4VW5CMVBLYTlDSEF3WkFzbEgvbm1VTGN6MmRyV1hIdEdWT3MyQUha?=
 =?utf-8?B?Z1kvMm16aUtpOFNhcjBSbFA3M3UzV0YxRVM3TFVJRzJBcFcveDNxYU1qbzJB?=
 =?utf-8?B?aHU0dU9PeGtCUklvREhoQXhUR1lDMHNvVDBwQVB4TmIwQUZwU0dOL1F3TG9n?=
 =?utf-8?B?b0I2Z2FHT3hhejBMbHZiK1NHbkE2TUVBbXdpVUc4RCtpbzl4UnV3aktDRkcy?=
 =?utf-8?B?aUNVQUtleGhKY2tuMDZGOGNWZjBuSkVJWjdQMldwdzRrZVYrTC8rbmdjRFA0?=
 =?utf-8?B?TEZTb1pqOUJLbVU3dGRzTlVxNE03aEZnZ3RLcno5TWN6Njc4Vlc5cDJ3bWxm?=
 =?utf-8?B?ZW1QNVdzZC80TWNrV0hlODFGOFg1UGNmWkhFOHpVcnA1WHYwbE04MnRRQzcr?=
 =?utf-8?B?NWFDWjRSMWNYS28zM3ZZb0w5M00ydS9UczZQZU4wVFVSckVERlRuUGlCc0Ru?=
 =?utf-8?B?L3lMbnZ2bGdQN0xRRExoUWhnVlNTdGVCSmRHUWdta095SmxTZFhWTWlyeGNT?=
 =?utf-8?B?MGdSTGxscmgxcXBnQjkvckptWXhObCtUY1EreS9RaWNnYjlKZGZ1WWFLSWhH?=
 =?utf-8?B?Q0ZFKzg2SXh0cXdpNHhDWkJEVmpWWDdRUnU5MmNJa2tGaXVnOGZOZ1ZLSTMx?=
 =?utf-8?B?bTlkWmNORUlKdFlvN2d3R3p0czArRGxBQTdBMU5FcjNGbWpmZ0VZWmdyVm83?=
 =?utf-8?B?UmhCN2NOMk12OVlDRUsydFRDM1VZaVVNYldMOHY3RjVST2g0dVFPNWQyV0lv?=
 =?utf-8?B?eUVhblRmeHBOL3I2anFyclVzczBQcG41czl2aTZsSTRyaDFRMlRMOGovWFpo?=
 =?utf-8?B?bEpWVTgvYmZJSzJDTWNHWGRCMStOeDg1RUdDWHpjYWpkTFhXZzRDQXRmZTBJ?=
 =?utf-8?B?YXZlbUpHdFRHbzM5cFVYZnlPVFZDL2FaMDlrMlhNMFFBTVpqRnNqUElZTk5n?=
 =?utf-8?B?NS9tUm92bmI0aHRQalVaOE9XME1SR2t4NmxRcnorR01ESEJZT1Y0dDhJakFz?=
 =?utf-8?B?cUs5NjhXRnNvbDd6aGhCMTNrMXZJSnNvT25EYWhBRVoydGFvdytySVo5U05m?=
 =?utf-8?B?NDRBbFdtMzdOZWMxUUs2Y3M3U0puNHRxTjlsZVNvWUcwdWxmLzl4ZXIrdVQ3?=
 =?utf-8?B?MEEvNmlTZ01TWWVNTlc5NDBpenZxVzRFYUtqc1JXRkhVQW1WWUNIU29aMTFt?=
 =?utf-8?B?R2F6NkVTNXM2Q0NXZysyRkJSdkdFdFQ4cXhYRjhUZTNDL2J0NUc4ZFQxOUZv?=
 =?utf-8?B?Q0Z6ZWJJTlN5ekZPMmZHaU1PUURKZzdXSVhSSHhJUU50Z3J1OGFVcndwcCt2?=
 =?utf-8?B?WFNGdUxmUVpnTmZlc05aYlk2YXNyRURLY0U5MXQzY213cndOWDVNRXAvSG5O?=
 =?utf-8?B?QVZwVHdpMEo5U1JGTXluLzExREJXOHZMc1phSEMyWG1hUGdRdnBpTDZFbktr?=
 =?utf-8?B?aWg5dHVOV2NuVldDb1BzZFNUZ0d1Z1RmdVFQUWVmZTU1dnc2VzQ2YTdva3hJ?=
 =?utf-8?B?dW9nSFJYSm91Q3hkU0l1K0dENjFycnh3dkZqMzkyTFMvMmJyNGJHWXpFSUJV?=
 =?utf-8?B?UDJ0bGxqdlByUkpodGducTgxMmdiN0U0ZllwdVdGVkRzM0VIOUd5S1hkOFRV?=
 =?utf-8?B?eEp2Y1hMd3RWWjlNSnVzbjJKL295UXMrV2ZrenBNc25ibjk4NWtTRlBxKy9S?=
 =?utf-8?Q?gVXnkQGfTHqHm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T094aTlZRXZQaUo4OWN3czNDMTFmSlhqZGYxRjNWMXRUUmV5OGNSdmkxSkZr?=
 =?utf-8?B?d1p4UFJ6TkxCVGxmOTdsem5tNG42dUMyZ0d1ZnZZS3c4VUY0cjAxdDVtQkFK?=
 =?utf-8?B?QzdjaXBPTkZSaDFMNHg1bXJqWFhMK2c1QlozUW8yZlFxdnRvMVJONkZydGIy?=
 =?utf-8?B?RWR3NWU0OURPYU4wQ200ZTF6TUo4Y0UwYzlud2xNTmlwaEFqb2dUSTc1Nktn?=
 =?utf-8?B?QS81R1BKOUh2VGc0a2FOekJ3NnNpTDJrb0FVbTlhV2lTRHV4UVE1V3BvWWxR?=
 =?utf-8?B?R1B0NWswVXY5QmxiZ2l5VXJ1MlBTdXZwd0lOYXg2d3dhOE9mWUZDWUlKSFNQ?=
 =?utf-8?B?SmNtOVFVMml2dDhjQmFNaVBhdGtHNVI0TmE4cmU1eVprQ1NEVUxKMmU1akNj?=
 =?utf-8?B?T0N6V2h2NFBEWkdpeEViN1RIYS9lM0MxOHFuOFdNOVl1WkpPTDJBbloyaFRy?=
 =?utf-8?B?TGFETEZqbElXSzVIbHZJdDdYTTZ4QUFwdmNDUE84TTZFeEFDVm1pdHdMd0Rs?=
 =?utf-8?B?TldOVTVKbnlkcjB4TkdsVDBxSU1ZMmNXc3U3QThZSWFDOW9DWm5UZmlKVEJ6?=
 =?utf-8?B?aXhTenVyNFp0MWNIVFdZVHRsMERReURxdm1BcEtZQnoveGtZaGI0UnhOOE4x?=
 =?utf-8?B?OG82dkpQOHcrbUg4eGxjcnJNamExaDIzU2ZrNWd0QzBzV2lRQ3JNdFJHNlMx?=
 =?utf-8?B?UGZjdG40VFFIcjFOc0M1UzFwdTVUbTdTMTBjZFlpS2QwWDVBMXcxZytCaGM5?=
 =?utf-8?B?ck1kbWp5aVZ1ZW1IWmM3NXlrUnc2TElZMUs3c2wyVkpPV0RvRFM2bEk0Qklr?=
 =?utf-8?B?VlUrS3hEU01FU2JsM3RnRlJRUVJqQnd4L042L2diZlNLMzVHVCtFWHRiQ0NR?=
 =?utf-8?B?M0J5QmUyTjhsTTN0SFBzQzRMZ2FtY2JBaExMQlowS2xpM1RQMkRnYmdSR25s?=
 =?utf-8?B?c1pNMTJ2elJZc2NHOWVVNTBoMG95T2J0UXMvVldZYVNZa21CSmZ3Q3oxVU5E?=
 =?utf-8?B?VG5wWnRjeGM5cjkvdVI0VkN4S1VFMFREMVJ0N1E3enV1aFpyYnMxTU9HNEw1?=
 =?utf-8?B?Uk5KYmFJak9wQjIzd1p2TUFNbUNkNXMyN01DYVZQWTFGYk5KaEdob2FnVmRG?=
 =?utf-8?B?aE1jaTZwWUxJekprK2xOTmFEM1dxdFk3UnhKL0lqSTNuRkl6SUVqQi9GUnAv?=
 =?utf-8?B?eklSbERIRDRRaUJNakNod095YTZlUDNHREpOSVY0T3R6TGVvVDE1cXV3TFZ2?=
 =?utf-8?B?MncxZ2lFZmRlWFI3M1Vod05OSjkrcFFIaVFrcmJsUkZ6S3pJRDA1YWltbUor?=
 =?utf-8?B?dGZLdnpSNVlHWmxpSmJPQmNDMGhYQUFmRUoyQy9vZFZzMThDcHpTcGdHWndx?=
 =?utf-8?B?dFEwVFRvbUJ4Z0xoNkVhK1NYckVFalZ0RHo5UmQ4OHBIdDh2NmE1b1BmeC82?=
 =?utf-8?B?dmprZVkzRG16TUZDWUZuU2NJTUJZUG1ISzk3MCt6b3RoTXgyelNRTzRLUEF1?=
 =?utf-8?B?bi9rUFVQUi9QWkU3VEJCQU5PQk5lakZEZlprVjB5WWg3NThyb3Vwd2V1ZXc5?=
 =?utf-8?B?VnZ2UkhEMk0wOE8wbkhmOGgwOStaZG45V2VNak5sL2I5TVdDYTZSbVVjRmU5?=
 =?utf-8?B?aHU5U2xtV0YxS0loZjJsM1o5NWJGeE5rN1FKTndMWHc0M2tzWnI3VmVQZWR6?=
 =?utf-8?B?UWlVZS9aa3NoaUVUa1B3ZVVZODlwMVk0dWR5dTZMbnU5SWJxakdXL0tKSUtz?=
 =?utf-8?B?YkhjZWNMV0gyTk9qQy9zNitiVmU2QXJCdXBtZ05pa1JYTWxYazNuc1N6SE5H?=
 =?utf-8?B?WFkzVFN2aVFTaHYyeUVTODdaeUc4akw4bFc5RkI4Nysybk5EQTFFWDZPT3o2?=
 =?utf-8?B?U1gyUUphN3dhRk1lVnNaM3lmU3FkY3NkVXJocUtVVkF1ZFd0V2VmLzZITlN5?=
 =?utf-8?B?b25aVjJWaTZYSjUwZC91ZzRROUVkL243YlFFdlFLaTZac1cwRkZua1NPeFU0?=
 =?utf-8?B?dkxJY2NKY2lJZnA1alZEWGROSjJ3NVl4amFUQStWOFpDenkwNG5mLzJ0VnJi?=
 =?utf-8?B?VmJOME02UEdzWmplM0tPRStSVm03d01VL2xBRFFOWVY3bm1VdGNDbWJjT3Bh?=
 =?utf-8?B?U3JnbXE5ZWpGT3ROc3JJWHM3TEkzY1V4U0xibElYRVhTZzhBelpyQXlyNFow?=
 =?utf-8?Q?r1puwrTsl5tNhHew3yjeL9M=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b005711-d6c1-483b-4739-08dd469e6e3d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 11:07:23.0905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzhY4tPWJnPUseSwiR2xmAO8xBwTiQcIMXvBlQf74EO+9CZTJoZnOy9kWFO7YLyiEXjv+bRIt1NalUOrOeTYN9yVnFEtr4rVeLofMexkLEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10931

Hi Dragan,

On 2/4/25 2:35 PM, Dragan Simic wrote:
> Hello Quentin,
> 
> On 2025-02-04 13:20, Quentin Schulz wrote:
>> On 2/4/25 12:22 PM, Dragan Simic wrote:
>>> > On 2025-01-31 11:40, Quentin Schulz wrote:

Not discussing CONFIG_OF_ALL_DTBS relevancy wrt hiding overlay tests 
behind, unrelated to this series I believe :)

[...]

>>> With the above-proposed changes in place, and with CONFIG_OF_ALL_DTBS
>>> selected, the relevant part of the "make dtbs" output looks like this:
>>>
>>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb
>>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtbo
>>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtbo
>>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb
>>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb
>>>
>>> No more "phony targets" in the produced output. :)
>>
>> Funnily enough, I would prefer to see OVL for overlays rather than
>> DTC, but I guess it's just one more occurrence of developers
>> disagreeing on how to name things :)
> 
> I actually agree with that, just like I prefer to see .dtbo files
> as additions to dtb-$(CONFIG_ARCH_XYZ).  It's all about the overlays,
> so they should be both specified and echoed back.
> 
> Moreover, we currently also have additional .dtb files with applied
> overlays left after the build and installed afterwards, which doesn't
> make much sense to me.  To me, those additional .dtb files should be
> deleted as build artefacts and not installed.
> 

I **think** it could be useful for systems without overlay support. Then 
you have a dtb which is the result of an overlay applied on top of the 
base dtb and you can replace your previous dtb with that one, and voilà.

What I don't like is that it's difficult to differentiate them from the 
"normal" base DTB or even from the DTBO (simple base DTB + overlay test 
is usually named after the overlay, and in the case of the Rock 5B test: 
rk3588-rock-5b-pcie-srns.dtbo and 
arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb), easy to pick 
the wrong one. Though that is on **me** as I could pick another name for 
the overlay test and e.g. prepend "test-ovl_" to the filename for example.

[...]

>> I won't be too difficult to convince here, just want some "authority"
>> or a piece of history about CONFIG_OF_ALL_DTBS that would go your
>> direction, before doing the change. I believe automated build tests
>> without needing to enable a symbol, and that taking DTB and DTBO from
>> the build output and apply DTBO on top of DTB works without having to
>> go through some length to get the symbols, are good reasons to keep it
>> the way it is in this patch series.
> 
> I'd like the most to perform the above-proposed "divorcing" of the DT
> overlay tests from CONFIG_OF_ALL_DTBS, so we don't have to enable any
> additional options to have the overlay tests run automatically, but
> to keep .dtbo filenames in dtb-$(CONFIG_ARCH_XYZ).  I think that would
> bring the best of both worlds, so to speak.
> 

So, just to recap:

dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo

stays and I add:

dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
	rk3568-wolfvision-pf5-display-vz.dtbo \
	rk3568-wolfvision-pf5-io-expander.dtbo

at the bottom of the Makefile. I specifically do NOT want to make this 
depend on CONFIG_OF_ALL_DTBS (by using dtb- like in ti/), so that the 
base DTB will always have the symbols in, regardless of CONFIG_OF_ALL_DTBS.

I think the redundancy is unnecessary but I guess it's worth getting 
away from implicit rules.

I can compromise on that :)

@Heiko does this work for you?

Cheers,
Quentin
