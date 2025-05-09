Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2123.outbound.protection.outlook.com [40.107.21.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B32917588;
	Fri,  9 May 2025 05:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746770207; cv=fail; b=KHaiEuAg9/q9EJyblNVfsVIj44CmY5dTD3Cfj59NCCavnv/KzIbhhwHFmYglkBpISeRW4jg2T8LFZAFdDS/pCqW2MhV7ixLvCxuGeeiwPO/9yrGgnxCC1TPNxeyqJNuH/zt43gqQ/gmkSg6uPBbdD+5ikumUtReZu5qXo6kQD+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746770207; c=relaxed/simple;
	bh=PzkE2r0f1vYD+7ovK7GRa8yT8824Fb5O4m9G4cK1iqE=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ytc1Vb3t8/lDZENeS19EKrrgVY2398WkGBiCpMlkDUaV8zcB3mfoFZEAgAtlHspZoFAcKyTIEIMGb5URJynPbk5//IEi73nXZx6lndALABQd2JvMVsDNbBKdhy5mv5gwb0/vJT+rSB/hkjr4XZSz5rLVGOUlZ11XEAeeyyY+uI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=BTbK3PyF; arc=fail smtp.client-ip=40.107.21.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="BTbK3PyF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wh3rVvfP3qYW4pmk71SY56x4UGy99mgnoMugYW9Dh9w9/G8AMtbCy7N8Mld9+iZ8RU7X/jyWi0FExcyykRzgtk1i2q6yYke2wpQ/NlXibEKIGKdvQf2GS+IwfHXeFNBihanfPMLEUeydgVEwXzMuZTu6dLK5opeb95AiLJW+XHKxekTYpH6ZMBVna1g4APaiBc4z1SHXy4/YKTN7jHmiHYMabua1IU9X6tn3WcVIK9O/6OHC3WxMy4MQ2bYfJPg6XogPHT3YsX8jkBYqj9bkTBzr9gSm6dmeKtO3U7MTEU+vwUJeREzn7wfgIjquXBAmkHS2smOZ5ww1xPjD8LNgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzkE2r0f1vYD+7ovK7GRa8yT8824Fb5O4m9G4cK1iqE=;
 b=HwbPmXDWxJZjsx07AzYQ2YDHe26ZCh+/Rh9UKAR56creaLZNBpHRU+gWt0uux3zpF7Y6SGeFKSjcjKlyrPHZ2r1VFd2ERRddDydGF+iK6v0hFslizdMyyXtFxM+rLQjvahwpgSw/0Js1dNdMoE+ZOzsIVg2JCais3/qAV/qUUIsQyUjQ3f3jufFNrmb+xHUGpUbJeK+sTi81oFZ+eLv+haGV/1FOThSQnNbTKGi5DM3yfh2uGyRdFbmOh9p9WJDuoWwnRWXpPzfbYRWnxeDOl6IP5bQkq8qsF78aXff8w3v0xj/wDj59lSp2Y763SfxJfdW4FSxo18Z9sJ0iP8YueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzkE2r0f1vYD+7ovK7GRa8yT8824Fb5O4m9G4cK1iqE=;
 b=BTbK3PyFC28SZpUlEE484JNefTYmtqjLyeC97AuQluvRlIPqlJVb6VAle5AZOv5vfcqXHbfxaLEv9sFAVVlkdq36uADYHtIPygC9VMgYlvJPUw/LZmxwGiufVet7K0phtr1Ikx7+MDVULiRIqW5iywm5pneh3YepaTWoDSogMcq7PKDdx3qALbW5thRzLQsya39TMhQw0FL+2dsrfUiiowulLp5y4FJ/YSahcELR+Zf8Q6KuErOclZd0WDugqnuOk+Z0AbBiRgx7ymhU/3ImYwAJGFxuqLn5rS24EgP/qRvoG7QfQFhW5h53uejjwTMdqUVS0j6fv1DP7ku3U6moLw==
Received: from AS4P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::17)
 by VI2PR04MB11052.eurprd04.prod.outlook.com (2603:10a6:800:272::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 05:56:38 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::73) by AS4P189CA0030.outlook.office365.com
 (2603:10a6:20b:5db::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.24 via Frontend Transport; Fri,
 9 May 2025 05:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 05:56:38 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com (40.93.64.19) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 09 May 2025 05:56:37 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by DU2PR04MB8662.eurprd04.prod.outlook.com (2603:10a6:10:2dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 05:56:35 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 05:56:35 +0000
Message-ID: <d4604713-ffb3-4cb2-bcd8-14c0519ad608@topic.nl>
Date: Fri, 9 May 2025 07:56:35 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 2/2] dt-bindings: usb: ti,usb8041: Add binding for TI
 USB8044 hub controller
To: Conor Dooley <conor@kernel.org>
CC: linux-usb@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250507131143.2243079-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3e03400f-766d-4690-8f43-cbea2cac93d8@emailsignatures365.codetwo.com>
 <20250507131143.2243079-2-mike.looijmans@topic.nl>
 <20250508-prewashed-jawline-37f53c0f9429@spud>
 <583dc73e-23d3-4c8a-a457-f2bf71190e6a@topic.nl>
 <20250508-waving-sustainer-28fe228e01f8@spud>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20250508-waving-sustainer-28fe228e01f8@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P190CA0037.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::18) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|DU2PR04MB8662:EE_|AMS0EPF00000192:EE_|VI2PR04MB11052:EE_
X-MS-Office365-Filtering-Correlation-Id: ffececa0-66ef-4d09-62ab-08dd8ebe4383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NEtiM1dlazJSTllUcTF2aFc0TGhCcTl0UExHZVlVMFJvc1k5ZHBmelcrOFJt?=
 =?utf-8?B?WktRR0FVNEs4djJva2hVWTRKMkZpc0M1c0t0K01YNG1SMjUwK3czdU9zQTRV?=
 =?utf-8?B?WWxJRnc2WVp5RjM0Z0JDTVpIeXRvYzJRQUY4RGV5M29Tbm51REUrS2NpZTZi?=
 =?utf-8?B?QjZZWnRvZ1JUWFdiUjhyVU9KaWhlYW9VVTR3aXNSM0JxNUwxNlJwRXRtT1hh?=
 =?utf-8?B?QTJpVnVrbER6NEh4UzJTQjU3NzRGeHdIbmJNK29CZEhyK3dzcU4rNVRHcC9l?=
 =?utf-8?B?K0MzMnNya1cybkdkaG44WGVXd2JmcjVwd3A4V0hXbkFoUytZVlA5V0JsbjN3?=
 =?utf-8?B?dHpLOEpKWFlyeTQzVEpvZVU5QkU4NFRBZ3pRTmZvZWt6cVhLUkJ6d2Q4SGdS?=
 =?utf-8?B?bkk5Rm5MVTdSY3E4U3ZscG9CZG05LzdaRjdtcllnMmxJUzNOZzZZUmdYZ0g1?=
 =?utf-8?B?QkYxKytyWjdzekEzdUwzL3Y4ejZjVUNqZkQ1UndVOG1JQzF0b3RmYkx1RmNo?=
 =?utf-8?B?UHhVZ1crQm1aY1BrMjkrZStrQ0owRjZhN1V1S25ZZ0tNTmxMM29tK2hSNHQ3?=
 =?utf-8?B?bUhDTy8xeW4vOGRFZEQxeFJGSHpBbW1Nd1lqdjdOWURPWStpNHJQR0czSkRL?=
 =?utf-8?B?WHA4NGg2cjFmWkMwck92bE5GdENOZnU2TUZCQkJkQW5KSHpZUkRqWWMrZzRC?=
 =?utf-8?B?OUJTY3hMM1g1L1RnQlFSNll1WjdkQ3pWNXRBZHVKeHh2Y2VvL2lVTTdwck9a?=
 =?utf-8?B?UFQzNWgyOWMxdkYvTWlSV2RaanRnandFY21MTWlCa292VWxTK09IODFxdVNY?=
 =?utf-8?B?MVZuZWtyaDlHT2huUGVwNFF2NE1ma1NMN0tJV0Z6cDRNQURreUgycjAzei9j?=
 =?utf-8?B?SnB6amwwU3g5Y0JyT2tpMjd0S2trTjBSYnhNMVdTVnZhWGdZNE45V1Qza3RY?=
 =?utf-8?B?bjR0ZG9UU2w1WVVvVE04RExSR1U1aTRZM0NYdWNEMlBod1N4d3lpc0F3aGJx?=
 =?utf-8?B?M2ljamFZMURXSEtJM2lXbzlaRG5rKzBYdDY0YjFmUXE0NS9BcDc5ck1xQjA2?=
 =?utf-8?B?akJnMkwxRy9GYlJTRVNGOHhTSTdNS1JJelh4OVMwWThpRithanFkUnJVcGRr?=
 =?utf-8?B?c1E4WFBWeG9XV1Y0Mi9pU0tZcFBUSUsrSWkyMVhWYVU5SEhKdjA5Z2lVSXJz?=
 =?utf-8?B?a25FUlY2SitqQnZKSFNGbWVSTWVONDdsQ1k3aVlnenpOKzFRWlZKaEk5Q2lO?=
 =?utf-8?B?VFNqS1VQRGpUOXIyYUVUTVdkaUt4a1BxcHdhY0FDbVltUjJQajZoSnY1VVNa?=
 =?utf-8?B?SS83T0w0RTBnaFNuVksxcmtEU2tLdFFMSFBXWHVnTlA1ZGJpNTY2a2hObDZT?=
 =?utf-8?B?dnBkUFpxVTFTMTRJU3JERFRPSWhYOWdUZWhMbTFxRGFrd3l2Z0t4aWhYd24x?=
 =?utf-8?B?a1ZGL2QxdUswUzdHTkVxYW94Qk1MTUFCUktvK2pITTFPenpxM1FQQmRxenhi?=
 =?utf-8?B?REsxZjREVE9oUHZIRC9nLzJPc0tleGpSYzd1UEI0ZGRDb2FhdDRtWWdZK0Rp?=
 =?utf-8?B?eko5Tm1Sbm1KUEZuRWY4ZU5Sc3kxelBOWnNxZnJpZGhaa3dDbk4yelZ3Uzh4?=
 =?utf-8?B?MnRHSWY0b3RQMjRUd01UTWU0R21OMTFadnMzOEZNU2poZHZtd3JnUnIrQjQv?=
 =?utf-8?B?ekRNQTYyb1Zmc1cxRWZVRW4rZWk1bER5K2k5VG9BZ1MwTk9oa3R1ZzVZVU5s?=
 =?utf-8?B?amo4RTIzc25qV3pMalpMczhoa213RUN1TGMzbnJ4LzE3YUsvN2tiMWdpSTlx?=
 =?utf-8?B?V1Z2UEk5TU1BemE0eFN4L2hvREtWYjJqRVp2dURhSWw5NXBPTmNVZXY4Wko0?=
 =?utf-8?B?cyt5RkpJVWExakNVb1g2b2NCUUZtWnlNRlZ1L1FTMmZNVk52b09UaEhlZTM0?=
 =?utf-8?B?UE95b2E2OGQ0aTdzam96dERCMVhrcFpnWnhuOCsxaWFUTnZ4eTVRa2o1aE4y?=
 =?utf-8?B?dURuSml2TC9BPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8662
X-CodeTwo-MessageID: d12042e5-3b11-456a-ad81-38e911775642.20250509055637@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45c60c72-26a4-46d1-b936-08dd8ebe41ce
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|14060799003|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWhHWnhTNlZaUHZQOWJJYTRndlgwOHVTUnl5T0wzN2VYS1JjS1pUdmMwUWVS?=
 =?utf-8?B?bzVTZUI5SEY2WkNGWk5IeUM3RXphZFhlVnJlaStodEtkZHNiUDFWcEdVYkV1?=
 =?utf-8?B?NXF0R0JMejBlNnBMQ004YldwT1E3ejJxRGtOdHhwU0x2Q3VIMWZFREpTMmlw?=
 =?utf-8?B?UmkyeWJIM2g3c3VJQjdRb3JkQ0hVamtBU2swZ0l3MUZyeXRReU9JOWZ3K2Vq?=
 =?utf-8?B?ZzBMbndHeVpYaXE5cml4OEU3VlNZcXVwejI1MGNVdzRHS3Z3dUlaL00vZlpr?=
 =?utf-8?B?anlUK3pGT2phbnN0WjRadVdWR0QzLzFJQkpOVWduMlQzZjd5d1YzMUN2MEdY?=
 =?utf-8?B?MDdsRVY0ZVV5MGxkTnJtK2tNSHdHNHJIdmJYSXRHdGowSXZWbjBqRDR2TW9H?=
 =?utf-8?B?WGU1dFZTQmtsYU5naUYvaGdRN0hMVmh6NTV0cmErNFV0N21VdW1weXJjNjhJ?=
 =?utf-8?B?RzA4NzBDVmcxVkdWZTZjVkFKaWVLMGFxdkVvU0I0dGZFQ3d2KzFCRUFFWTBP?=
 =?utf-8?B?dWkyRzd0U09kbHpjbDBFMFp2R095Slo0a0xOQUd2Y1JyTVlkclpDbjB0cFV1?=
 =?utf-8?B?NVZvY0lKS0dmU2c1eW95L1BJVGl0MFh3NnkrUlkwcDRnTzBQMnhlSUtKZG1E?=
 =?utf-8?B?U3NQL3V0dkNQUU5mSUtleVE1NEtLRWh6cGFuWWtsd29aRlNVcEZkUkV2aG95?=
 =?utf-8?B?cXRFbGFFUWtzcGQ1VHVwalNCem5UQzlWcHBPUzdmTy9jM2J0TnNvU0l4bzFl?=
 =?utf-8?B?d3FjdWYzSlpLNXU4K2lsZy93QzkyakNyUzF2OUtUSlFIaStvMEJveHVnUU1Z?=
 =?utf-8?B?L3ZxYmplRVVnNFNMRUI4MXo3R2RIdWozRThQMGlVeEdXdS9zMnNFYVVwdjBB?=
 =?utf-8?B?VE9pUkVEYjZiS3FhbHNDbTRJdlhZOWlsYU5ZZVVmeHJ5aXRjR1pKUkhncjUv?=
 =?utf-8?B?VFh6L3VpaStoa2lGeWVraFdCL0luWno1bTJDMlg3SFVibVJIKzdtR1MwUFBr?=
 =?utf-8?B?cGZFOWhFU1h6MGxMZUxZeExSbVoyQy8vR01VSHJQbkhoa2pIcFNNL1lsRVIw?=
 =?utf-8?B?ZUhYQXhNQWJLckRDUFJnbUJ6dzVzYWgzWktVWE9JWU16MlNwOUk2ZW9peVJL?=
 =?utf-8?B?YlV0RmtaTGdpdWYrWEdHVUozTGtzWXE1RlNpbVo4czBPbFdEV0pqRTBMZFVp?=
 =?utf-8?B?bXNVcmdWU2Rld1BBdEQzdHJ4NFN5QTE5NUFJTXJ1bzBwVzdvdy9lbDlKK0Nu?=
 =?utf-8?B?dWF4NDVTNGpXYmU5M24wbUJHZGkzbWIrMkJjTlVSYitIS3MzemgrSHNDa3ly?=
 =?utf-8?B?N3FKbmxMU0w4alZIL0lQZ1p6WWVmUDk1dGNwOEhFZmlLeXgyTmxYcDB4YS8x?=
 =?utf-8?B?YXRUeERZZXU4YXZrNzcxb3IrcFZvRjV0blZIc1duR1V5d093WFRjdXJaV0g0?=
 =?utf-8?B?KzhVSGN6L1FqdXEwWHJVb2pIOU16YkZnRldHaG0wRDhqeWtRcndaMi9jVGVh?=
 =?utf-8?B?eEYzUGF0NUMwVkpzQm4rWjkzWjlUOElyN2tuaWh3TGI1MWxJeHQ5cFZtVEwx?=
 =?utf-8?B?MXYzRzQ5SzZRVnFBWE5MVThtWlV1SEV1QlJpTGRqRm5FMGhhSDR5bkp6MnJl?=
 =?utf-8?B?dFFHdzJrdzVHN0liVTl0YmhTWTJJbFlYYTdOMzNHekxhd2lERDBQNisxMGQr?=
 =?utf-8?B?OW1nL0g3MUs3MVFkYnZHTXNCOGJrNnJlM0k4YzZ3ekJadHlndkxrTW1jZnFq?=
 =?utf-8?B?dG5GUzNUVHVCbGF6K3psYVh5UVEyZUZnWUpTbThEUlRYU240cmdJbFY0SEZk?=
 =?utf-8?B?cWg3OEdmUlVuNkJUUXdpZlVmN0gvQW03L0w1Z1pDaEhGL21YMFh6WTc1VFlW?=
 =?utf-8?B?MjZiUFV2RGwyMTVLNWRWQStEZGZrcVE3VXRJdEs4ZXhwUjBPcjllS1NIV09z?=
 =?utf-8?B?OHJydlRxVzhEbmhGdkZOQ0VYdThYbHZDN1pqTVBNTE1ZMFlMWUxDWUI3a1hO?=
 =?utf-8?B?djM1eWxHYkhuWmtmTmQyd2oweUZ1d3dBZ2F6ajQwOVptY2haTlY0NzhNYXp4?=
 =?utf-8?Q?zAAEmY?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(14060799003)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 05:56:38.3802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffececa0-66ef-4d09-62ab-08dd8ebe4383
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11052

On 08-05-2025 17:53, Conor Dooley wrote:
> On Thu, May 08, 2025 at 05:19:03PM +0200, Mike Looijmans wrote:
>> On 08-05-2025 16:58, Conor Dooley wrote:
>>> On Wed, May 07, 2025 at 03:11:43PM +0200, Mike Looijmans wrote:
>>>> The TI USB8044 is similar to the USB8041.
>>> Similar how? Why's a fallback not suitable?
>> I don't quite understand what is meant by "fallback" here?
> A fallback compatible, since you;re using the same match data as the
> 8041.

I think it would work. It would look strange though, having to put an=20
additional vid/pid in the devicetree to make it work.


>> It's similar in that the USB8044 provides the same functionality and can=
 use
>> the same driver as the USB8041, all that is needed is to add the PID/VID
>> values.
> Is this onboard_dev_id_table table with the vid/pid used in combination
> with dt, or in-place of dt when device detection is dynamic? If the
> latter, why can't dt use a fallback compatible since the handling is
> identical to the 8041?

My basic understanding is:

The devicetree match creates a platform device that controls the reset=20
pin of the hub. It's basic task is to de-assert the reset, so the hub=20
starts negotiating. This part also works with the 8041 devicetree entry=20
(which is how I first tried to get it up and running).

The VID/PID table then matches the hub on the USB bus, which can then be=20
associated with its platform device. Since the 8044 reports a different=20
VID/PID, this part only worked when I added the entries to the tables.

--=20
Mike Looijmans



