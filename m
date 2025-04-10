Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2083.outbound.protection.outlook.com [40.107.249.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195C825E823;
	Thu, 10 Apr 2025 09:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277836; cv=fail; b=T6PdBRrUFIaOW34CIhMMhnrurG54mB5wnqpb5UgWIoe2jFNIWyrJgOZWsv2bdNhct2Zdr+GYrlai4XGlJzY2uWGRXByYA3zQYPVHE5eieAIGzRSkvHEuPk4EU7dGFrJSNG9HnB6gau58Sgbd0qgzKd8yi5cYXwcH/g9RnfysZ48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277836; c=relaxed/simple;
	bh=S4wsipP5c66eUsQdH3HwqiLQhNDL1GUTFmZfrrhsNp4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mtrziD6szbDai2ao3vAkVAfqM6+MfYiU0LgNPbjlnX0kpaywesUfYS+n2hsotTpNt9X0ADZxKw+vkcr1uOOwEv2RG58UnxjAcYXihz+xRO0fwkzrBxy6KPe6xWz6Kp2yF/fU42PCStLpuC2s8lb+lVDc9lxeBBxEG57JgyYKb6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=YY9dOodR; arc=fail smtp.client-ip=40.107.249.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="YY9dOodR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXByWCuwLoGlfVPpiDqP8u+pHiD9zZQrtEO18aifla5JQcj2fy9dlvOipFJG2Dkb4HqvCvGdGVDFrLkq+OlODuIOfU/FW2LEnuM8T36PYeq2D1B/uGJEyn1SD2kTAQOnB+OtgzDpT89kWqPORjkDmF0HewkdXAUKNWZm+bPIFq3v9wVybA9+beLiOsBgJtG24jgGmEBE2eJKUWTcGUEEDhzwls8EzagxuixOvt3UCP+KmwN4PPQ0LV0F1BMeTDhEe+PS/7elXlaNlg55W0gagjQaUnBrADGPABlBVLela00QTDgTntlwr0197FzLvUEpl/dDR+I85hr/GILkXweaOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCsAtZaY7x+heiqr7TPgurGj4fXQsDSnlbYYIQ4pOlw=;
 b=R9j2dNejbVPtwhg8BqvOYAWTXeuOQDpqAFG00Xkp+PDmnEXjpotp5Yx2TPpHNnS0OIObksLu/xN1xkr9Z/khfi4CDs36QUSK9yAMqSVQKIqtFSrgLIfpu4zQO67hw3TY9Iqhgz/1OXA5s87r8/MM3bO8YfvTyDEUbWifCTGx0bL8qPGfyyFK8slh0Q8egNtfZLhBbFHicQargsZris3nXWEQ12XZaiyRUHb7COiTpax61EH1dOvGkd3/5GH0aALtDQ1NZhmYaukqzuAMDy6r8saAKqECgCorb0Kh1EO1GYStpn6jRf8LFh85pXiGmamwkfxPGSJF/mtOXu+iz2trEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCsAtZaY7x+heiqr7TPgurGj4fXQsDSnlbYYIQ4pOlw=;
 b=YY9dOodRmG8L8yXHGTFAJCt6ebRIP1uMjPCy5+rKebOx0FLzPXZ+SPmfrVOOpiWW66r3BOSfBg/84SWILaOc08o3C5M7+hiKOgE0Xk3nLlEQvg5PLS524o/E2OdN5HPyUqWwCVzhBedcvMqgpMYPwoCTHN7dfEDBWUJr0vSLVYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS4PR04MB9575.eurprd04.prod.outlook.com (2603:10a6:20b:4fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 09:37:03 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 09:37:03 +0000
Message-ID: <4784ca8c-b6b1-4337-b2af-e8992150ec7c@cherry.de>
Date: Thu, 10 Apr 2025 11:37:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: usb: cypress,hx3: Add support for all
 variants
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?Q?=C5=81ukasz_Czechowski?= <lukasz.czechowski@thaumatec.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Klaus Goger <klaus.goger@theobroma-systems.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
 <20250326-onboard_usb_dev-v1-2-a4b0a5d1b32c@thaumatec.com>
 <20250326-fanatic-onion-5f6bf8ec97e3@spud>
 <CABd623tEGh=qtpF0h7PkRBBrR7V9EaxUv9HregqbPcLU_2Exbg@mail.gmail.com>
 <20250409-commend-brewing-7c541aec26a9@spud>
 <cc49276b-f64f-42a8-b4b4-61bde17b61e3@cherry.de>
 <20250409-glorified-crouch-837870b4d443@spud>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250409-glorified-crouch-837870b4d443@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS4PR04MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b74f858-38d3-4fc9-acfe-08dd7813401a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmRaZ0JaUEpqRWtsY1YyOFZ5MUNFNnZNQVJiTjVrNm4yOFE4RHg2QUdxOE5j?=
 =?utf-8?B?TUxIR3NlemRMK3U0d0NDbkJGbGRDM0xHV2hXNHNJdUZtWGJhRy9PcXNNdUhC?=
 =?utf-8?B?YitEMkY4cm5PRlRPSUJORytYS0F5Y1VjMXZMRTNmanNXazh0QjdITHc1RDY1?=
 =?utf-8?B?aUVkOFUzM3V4Tmx1ZXdCNTVadHAzNDdpTGlpMFhla2RQYUNZeHdTMjVZMEdo?=
 =?utf-8?B?VHZPL3o1NVlIR3NuSUZNak9tTEM2T3NybFRQWWRxdldLUHZGY25RTENZR1Fs?=
 =?utf-8?B?R0pETitPSlRoK0RyK0hReXQrN04vYTQrWUpOWSs4bEhQeXNraElsOTRqd2Zh?=
 =?utf-8?B?cTE5bFR1ZS9wYlp0SjFoR1RkNnZtbDRsdzNPL29hazRqT2tzRUhIdXIzRmpr?=
 =?utf-8?B?eUZwRWtjcXRWekFEWXF1N0JHNElySWZWQlZiOGxnOWpseURiaW1VUWMyYXMv?=
 =?utf-8?B?RnBNbjg2bkF3cHBBZlEyTUtWQkNiRmxwdlZTbHBWbTZMZmQzeHNVQ3dma1ZP?=
 =?utf-8?B?dTV4QVJKdVE2SmM4U1Fxbm1UWEo4NVZ4aExOSDN0MmlBUzdpOFpEY2ZLS2tx?=
 =?utf-8?B?MUk5UlloUndIYklNNndPemMzYnFiR1NGTk9UVFMyeFd4aXRycldHUVdtRXdH?=
 =?utf-8?B?VlFnS213ZTdwaWlkb3FTU2lPNjBMOC8yZ3pGZTVhSnl5ZTZGa0RHY0RaRHI3?=
 =?utf-8?B?L09KVWlwRXRISENNRnFNOE9NVjdRNHlQYkxReEQvWHVnQ01Ydy9lUU1lUTly?=
 =?utf-8?B?ZU91UmlCTkNZdEdsMStYU3FWd3Q5bjFWZFBkbWhqUFZVUHI0VnViaDhsYXZS?=
 =?utf-8?B?RzBza3ZsZy8wZWNRVWFSaHBkZkpzM2RhY0RjSEhHNlBEaEZ1WWU4M3Vwa3BL?=
 =?utf-8?B?UmtFdjV5UGxraFFLbWVicUtsbWhmLzhDd0M2QVl6ODVYQzVMa0NrUm5QTG82?=
 =?utf-8?B?eWtDRUhneTNIQnR3UmZ2RFNmUzhkeFlaektZeS9udksycmhYZ01INlUyV0gx?=
 =?utf-8?B?UW5vNzM1R1VWd0trVTlkUzB3amNkRE1yUStjRVhSZXFkNnJsL1M5R0U1ZkNl?=
 =?utf-8?B?SWJqbFFzWWxzTFBhWWlxRXVzU1l5WTJGN2RNeW9FZVFZWWFSdjhlK3l6ZTlt?=
 =?utf-8?B?MnV6Y3FJYU1qZEpBaUNFcGJhaHI3Vnk5MENyc3JVMFRKSjd3Rzk0YU1KY3d3?=
 =?utf-8?B?WUs4dU53NnBIdG56elR6N1owUk1Qdm01d255WXlvTFlIMUdiTG1KMzljU0la?=
 =?utf-8?B?bmJNTXc4MGYwaG1DVlVQcWhKc1F0UjRTWmo0K2dkb2VRYlVUY2NkUU9DT2hq?=
 =?utf-8?B?bU1POWVZRUU1TkNhdVg3Z0dHMnpISE1qcGFrZkdYN3p5c1dxNWdMY2FNbWFm?=
 =?utf-8?B?U1R5ME44bGxDa041a1VDUTNmNFpTcjNzRzFod21KUVQ4Y2dZVWZuMTVVbTNZ?=
 =?utf-8?B?cUlKOEgvVFh4ZzN0MmF3SUtvQXhuTTZJdGNvdWZlbGNqZExMMFZFQ1BOeGNr?=
 =?utf-8?B?a3FUTjRtbUh2ZkJueGFpd0ovVUw5WEdtRENFTllYeHZhSkhNRVZZTE9ObHpL?=
 =?utf-8?B?T0FFTjhaN3QxQUN3YUtqUDcrTHR1Vk5XS3JGeVNYam8wb0JleHg2RHVieDhk?=
 =?utf-8?B?NzVFb1BzeFZheXpGaGtVMVdZVnNqb3JxOXlYOE8wUVRwS2VXTk9udWorZElh?=
 =?utf-8?B?M3BMSnRKTllPeWlwNUJZTUM3NnFlQzcybng1a1RLNDhITXpBM0RrQkNtTkpC?=
 =?utf-8?B?UEM3MUh5dzlGZ3FXai9jSHFUR09ObktNUUVzeE1NQnRpaml3TFRWOXppWFc2?=
 =?utf-8?Q?Tv45w+ahKfHvA6XqWmL692sIbLBhSyLW3yL2U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFhtR0JuY2NNSjJJQnNxeGpsL0tac05oSFZDcTVFb3JUZGtGZU1VU094Zmxn?=
 =?utf-8?B?a25BKytSRGU3bm9kR3ZmM0FCeHVqNWExYVd0bWMzbWlHNjdSTnd0THZJdHBD?=
 =?utf-8?B?cURTY2tlcTFxbWx5SEtBbGp0MGgzdnJaZzhYSE5jRzAzMldFaHBpMTJ1QmVI?=
 =?utf-8?B?ZkZyaW4xUXBYakZqTExhOHVTbXVnUUJFY01kK0VrRmljeVVaTTd2MEg4dmJK?=
 =?utf-8?B?SzVxT215NWdCWTNuamRwMUpXTGdpdzE0RDgzc09ITHdzN0VmT29iZExIYkw1?=
 =?utf-8?B?UFgyRERSVXYwaXA5QUtRakhRNHVqZys5b1lYTHFuRzNzUjZja1lHeVFMd3Aw?=
 =?utf-8?B?TFBvRUYzeWVzY1pXM21HNkw4MW1UY0Q3RGREdk5zQUdPYWpiU2ZZSHUwcVpr?=
 =?utf-8?B?NEJSNjA3NlFtUGtSb0dsY1ZiajYzRU5WQXFHbGR1SHpCYU1pcTUvUDNWUjgr?=
 =?utf-8?B?REQrZ3B2bVBEUmZtOURrUTZYZ2R0aEZnUGI3UldPQ0ZXUEJFZkYrcUxOYnlS?=
 =?utf-8?B?bnpqb1VKeUZPMHZ2bzBEUDFlYnpNdWlROVo4NEJxZGJWU0QyaWN3NHNmNnRR?=
 =?utf-8?B?NFhaaFJGNGkyQUU4VFJhMThOOW11aER6V0JYVmlUS0dYdTNmS3c0Z3Zod21L?=
 =?utf-8?B?dEdTT3VjODVSdkFYSFpEQkxHZlppTzJKVURDTnBzWS9uR0hBYkxSVFYvejZM?=
 =?utf-8?B?WDdLRzVyMUM3YlJDSUFQNC9yS2VrdHpvZ3ovRUl4SjFZaHlSajRyaDFqR2I0?=
 =?utf-8?B?S0NnbFczY3NrWEJ5eHhTTHdlUDlBTCtvUC9iSkFkdHY0YUkxQmtDcVVFcndW?=
 =?utf-8?B?dE5kdHFIc0dqMEFXN3dGRHdiblUzYVh6MVFpSkhLVnRVeWViT2lTNWNCYmxG?=
 =?utf-8?B?cjNzeWFIcWtlSW1VbDBDSXdha3pqeXlMNEtaTDhYaEVCNnBXWG5UY081MlE3?=
 =?utf-8?B?T05JLzFTakc2dUI5bmh2VUhXd2s5S21Ra3RXbk1JWEdCZSsveW9tS3l4VTda?=
 =?utf-8?B?dE5WT3JCK3k4UGk3eCtQbEFQUlJndWdJTGRsRVh6Y293ajZyTWZVb1gramVD?=
 =?utf-8?B?NCs2TkY5eUloektMbTJGTGhPWjFOQVN4VG9BTTY4allDWXRQYm0yeVRmd0Yy?=
 =?utf-8?B?QWhDWkZjeUh4RWtZY2owN2tWbDNCbTBSYXJLaTNCRGMzMjU5SlExM211enZr?=
 =?utf-8?B?TFY5eEFqUVBSSjEvZzdoNWVERkhMdXVmQzkycUZHLzB3andKeTZPZ2kvc0ZJ?=
 =?utf-8?B?aExyTElOZ2pUa085V1ZsQlF0UzI0SDBHS0M5NTl3UlVuZFpwbjhJVThTSk5F?=
 =?utf-8?B?VUR3djhnaWNEczZiR0dGRFV6VU90WkFCeFJ0d0VJTUhRcTNiSmhrRVFNTHBV?=
 =?utf-8?B?THhxV2c2bDNlU2ZqQWZYN1pyOC91QU5nN0lYMkgzQ0RBYm1WWEZBUE0wbWtV?=
 =?utf-8?B?ODZ2MHlBeWJVUU5VM09lbVBjaWJQd3djSVVSUzZ0WWx1eFJUNlBIaWpENENQ?=
 =?utf-8?B?T2tRUExPeGlNdU9BZ1hnOFRGNzZBdUludW5iTG8wc1A3Y3FWQTNxSXU4cU1w?=
 =?utf-8?B?ODVuZXZrbUwzUEZydTlsanV2SFpnMjVUS0paK29UQjVBRjNNVko3QnZ3eUhl?=
 =?utf-8?B?V0dLQ2tTSUpvemgvd1dLUjk2dWNrRnowTWxrQnlEdDhpT2xuZTFYYjFHZVdQ?=
 =?utf-8?B?N2NtbXhNWHY5VFp2REdlMHJxQlI5VGZlYkpnejNnQmh4d1dhNHpXbDR4bEF1?=
 =?utf-8?B?dFZDOEZkbU9JQjN3cFgvU0kyV0V5bE5Sck1Jdk5FK0FIOGZQVUU2Z2RKTjMz?=
 =?utf-8?B?bnlUa2cvS24wZ0c0S1puVm5LSS90aFNncDdkeXoyTm1TSjFFSjF5MnY0djVs?=
 =?utf-8?B?SUlxbDBsZU5mMHc3eitzdk9FQUJJZThnUU1WZG44d3Vjcjl0MVg0T3dHb05p?=
 =?utf-8?B?RDE0VWFWNC90N3U1UVNWUjlTdlErS3VhSkhmbFdndTdBWDByQlFTazFJOVUw?=
 =?utf-8?B?N3pON2ZlTmt3Z3ZFN0EzQkpXcER1RFZMckhSVkJ3Z3JwcjlKdTBWckJZejVu?=
 =?utf-8?B?U3FqYnA2Zkk4M2pwYkg5MS9JaUFEU3FSOC93OFhZbG9BcThzRGFLT0tqL05t?=
 =?utf-8?B?Y0ZMZmRVWlVLWFRSZk1LVWVja0xWd3lJaU5UcVFSeS9wTGUxNEdDSlI5bDdz?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b74f858-38d3-4fc9-acfe-08dd7813401a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 09:37:03.3390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCSi2heUil+4Dqxprl4lhiXf4oRfwnD2qjugMrEkx4sQA1YFlXTdfpD5wDV9JtUf9nprHswXIBbLXOVBQJMVfBjUZTS8iTmd2GwMei59RxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9575

Hi Conor, Krzysztof, Rob,

On 4/9/25 11:27 PM, Conor Dooley wrote:
> On Wed, Apr 09, 2025 at 06:26:43PM +0200, Quentin Schulz wrote:
>> Hi Conor,
>>
>> On 4/9/25 6:18 PM, Conor Dooley wrote:
>>> On Tue, Apr 08, 2025 at 06:36:04PM +0200, Łukasz Czechowski wrote:
>>>> Hello,
>>>>
>>>> śr., 26 mar 2025 o 18:58 Conor Dooley <conor@kernel.org> napisał(a):
>>>>>
>>>>> On Wed, Mar 26, 2025 at 05:22:57PM +0100, Lukasz Czechowski wrote:
>>>>>> The Cypress HX3 hubs use different default PID value depending
>>>>>> on the variant. Update compatibles list.
>>>>>>
>>>>>> Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress HX3 USB 3.0 family")
>>>>>> Cc: stable@vger.kernel.org # 6.6
>>>>>> Cc: stable@vger.kernel.org # Backport of the patch in this series fixing product ID in onboard_dev_id_table and onboard_dev_match in drivers/usb/misc/onboard_usb_dev.{c,h} driver
>>>>>> Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
>>>>>> ---
>>>>>>    Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 6 ++++++
>>>>>>    1 file changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>>>>>> index 1033b7a4b8f9..f0b93002bd02 100644
>>>>>> --- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>>>>>> @@ -15,8 +15,14 @@ allOf:
>>>>>>    properties:
>>>>>>      compatible:
>>>>>>        enum:
>>>>>> +      - usb4b4,6500
>>>>>> +      - usb4b4,6502
>>>>>> +      - usb4b4,6503
>>>>>>          - usb4b4,6504
>>>>>>          - usb4b4,6506
>>>>>> +      - usb4b4,6507
>>>>>> +      - usb4b4,6508
>>>>>> +      - usb4b4,650a
>>>>>
>>>>> All these devices seem to have the same match data, why is a fallback
>>>>> not suitable?
>>>>>
>>>>
>>>> Thank you for the suggestion. Indeed the fallback compatible appears
>>>> to work fine in this case,
>>>> and I am able to avoid additional entries in onboard_dev_match table
>>>> as added in the first patch in this series.
>>>>
>>>> However, after I've updated the cypress,hx3.yaml schema file and
>>>> rk3399-puma.dtsi file,
>>>> I get the following warnings, when running "make dtbs_check":
>>>>
>>>> linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1:
>>>> compatible: ['usb4b4,6502', 'usb4b4,6506'] is too long
>>>>   from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
>>>> linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2:
>>>> compatible: ['usb4b4,6500', 'usb4b4,6504'] is too long
>>>>   from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
>>>>
>>>> Below is the diff of my changes:
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>>>> b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>>>> index f0b93002bd02..d6eac1213228 100644
>>>> --- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
>>>> @@ -14,15 +14,22 @@ allOf:
>>>>
>>>>    properties:
>>>>      compatible:
>>>> -    enum:
>>>> -      - usb4b4,6500
>>>> -      - usb4b4,6502
>>>> -      - usb4b4,6503
>>>> -      - usb4b4,6504
>>>> -      - usb4b4,6506
>>>> -      - usb4b4,6507
>>>> -      - usb4b4,6508
>>>> -      - usb4b4,650a
>>>> +    oneOf:
>>>> +      - enum:
>>>> +          - usb4b4,6504
>>>> +          - usb4b4,6506
>>>> +      - items:
>>>> +          - enum:
>>>> +              - usb4b4,6500
>>>> +              - usb4b4,6508
>>>> +          - const: usb4b4,6504
>>>> +      - items:
>>>> +          - enum:
>>>> +              - usb4b4,6502
>>>> +              - usb4b4,6503
>>>> +              - usb4b4,6507
>>>> +              - usb4b4,650a
>>>> +          - const: usb4b4,6506
>>>>
>>>>      reg: true
>>>>
>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
>>>> b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
>>>> index d0d867374b3f..7fac61f95fc6 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
>>>> @@ -594,14 +594,14 @@ &usbdrd_dwc3_1 {
>>>>           #size-cells = <0>;
>>>>
>>>>           hub_2_0: hub@1 {
>>>> -               compatible = "usb4b4,6502";
>>>> +               compatible = "usb4b4,6502", "usb4b4,6506";
>>>>                   reg = <1>;
>>>>                   peer-hub = <&hub_3_0>;
>>>>                   reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
>>>>           };
>>>>
>>>>           hub_3_0: hub@2 {
>>>> -               compatible = "usb4b4,6500";
>>>> +               compatible = "usb4b4,6500", "usb4b4,6504";
>>>>                   reg = <2>;
>>>>                   peer-hub = <&hub_2_0>;
>>>>                   reset-gpios = <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
>>>>
>>>>
>>>> Do you have any suggestions on how I can properly update the schema
>>>> files to avoid the above warnings?
>>>
>>> The diffs you have here look okay, not really sure what you're asking
>>> for.
>>
>> It fails dtbs_check:
>>
>> linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1:
>> compatible: ['usb4b4,6502', 'usb4b4,6506'] is too long
>>   from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
>> linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2:
>> compatible: ['usb4b4,6500', 'usb4b4,6504'] is too long
>>   from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml#
>>
>> I'm not sure we're allowed to add new errors with dtbs_check (and would like
>> to avoid it in any case).
> 
> Ah, the restriction I think comes from the usb-device binding. Maybe
> just leave it as you had it?

Thanks to some previous debugging done by Lukasz, I believe there's 
something we can do to make everybody happy.

The issue is that the usb-device binding enforces a single pattern 
string in the compatible property[1] but that isn't what usually is 
expected by the dt-core[2].

I would suggest to patch the usb-device binding so that it can accept a 
list of strings matching the given pattern.

This is the diff I'm suggesting:

"""
diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml 
b/Documentation/devicetree/bindings/usb/usb-device.yaml
index c676956810331..42c2e8d6dc06d 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -28,7 +28,9 @@ description: |

  properties:
    compatible:
-    pattern: "^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$"
+    items:
+      pattern: "^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$"
+
      description: Device nodes or combined nodes.
        "usbVID,PID", where VID is the vendor id and PID the product id.
        The textual representation of VID and PID shall be in lower case
"""

I believe this should be a reasonable change except if we really are 
only expecting the real VID PID in the compatible.

What do you think?

Cheers,
Quentin

[1] 
https://elixir.bootlin.com/linux/v6.13.7/source/Documentation/devicetree/bindings/usb/usb-device.yaml#L31
[2] 
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/dt-core.yaml#L21-L25
