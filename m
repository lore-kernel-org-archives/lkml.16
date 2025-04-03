Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2052.outbound.protection.outlook.com [40.107.247.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DE41A0B0E;
	Thu,  3 Apr 2025 06:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662000; cv=fail; b=t4JcqlGOp/wjG38ua4NR9HAmfkxRVuM5t3tY95k8+C1DbWErwaB3ioRvbmE2/KIv3cs3uNbMgCwk0hq4/l1But/hpWr7hN7wEtoJDiukX1H/DK3EMj728OWpsjGoIRzCZ1fkjluw4nVuVRscbKcjO+Sq3y15pFubxAP4ada+AiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662000; c=relaxed/simple;
	bh=sW/FCMvlxDvlyDzPt3vtqHAXiwh5TRQgOCwJSSJPNnQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bgg1cZUPJhZqwMopSwvepi8jSs5ndq+qLcsi7xoQgoiEgW5i4MDg/4f3iezPrpf4LcLzHZ3MBFIzXWaP/Xet6W0mtCdxLV4Grl8jr0cyHzI/5A3G8FjeQZxYmtvJaE9ISo2N5w5F4C9JGJ4wcaRU21cAWOrutU7BLsMfXBE6Lik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SmvfJBfc; arc=fail smtp.client-ip=40.107.247.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SmvfJBfc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ik0SfYV21gBrtU7AqAy/RAGfZ6eWblV7fIH0QeMa0bEQEZU7yC6zDWAzxSs7F1v6JN7g1V9tQq+NMQqD9pS2fDypnPZNBdA1ONTAlVQEnE5zTBXiEpNRveArDj84NsZPbretYGRkXzFh0u4TREn6QS8Ph8qO6pQ7rP2jQzpZ8g83WmnpfGTH3+GzLErfYpjsHe2HMTOe5/QDPEsBBqVeRapWdvM+6B+Sn4PARdLWoXVhvrxEe3UQTVRwsxsAAE6PesF1Rzvqm9WeV5Y/NOiK2wELl11qi/fOrGMFMiikKyO2ey4g5K3TSIKKZ9QDw2ydmSvmFVxx//PajuOlMuQcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xae3hdtBol3nEf5pCgV8Pv2zLEiKsM7P1OUStf2/6zk=;
 b=T+DbcbkpucJfzIfwOxmeGf1Xu0hh4gkgfbVbBSn0GnyTANbW1qb9a7H20j8AaSTx6qh6+bsBwwjU9azgYz4WO/lo/2lt1HinlGUrCJhHgo6J8C4v3p5DZ/h9KP0/pR1ndiFv0SUNYalXsZPOwxj3ShIsXGJx0QsbGmSyOvZiYRIrmokiqAhagdMMUzQTKUsgg33XscWLnnjCMsYGFZ/JkDTYKeVeni0NiqKZh2zYrPmkrzEUqew02BpblYyxGeJebaAcrbc/zEztBPCUUQgOAexikA0BwCA9gujTJ6spJDWqI8m3eyYbqnpEgVNcLCH6LQsoCs1DCADCDMs5M/mVIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xae3hdtBol3nEf5pCgV8Pv2zLEiKsM7P1OUStf2/6zk=;
 b=SmvfJBfczz6xpIVCrwDXcJ4tC63dw92RYxWSlvtpOPXmMSpBBfEgUDDhCeQaEH5N57EPHSqlwmlVirdjSLukwZbkV5rHeQXy3c4V95GIcwdkdKo6M+pV7Re9CQFlnS4nDZnZurttfk9724FaEMf1T1PL7WS+z60sL2AmH0FjhVB0O0FwBSirrCVl+Q37MRbmfnYj2ZgABxQTEkf5+/B9UTQKnegLR1DsZhT8t6M2z0G+Lg/ak9VPq1Grj00No2Sh2kSRjGtnYGGfs9cU+KzwaaccaTkY+6sskwOfc6y7KUGQ0nDtV9EIU1GtlrZVyZshxK60qfAHEHh63GCH/KqrSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by VI1PR04MB7070.eurprd04.prod.outlook.com (2603:10a6:800:123::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 06:33:15 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 06:33:15 +0000
Message-ID: <2503deb2-b993-7fd1-adf3-cafa1e7bd2f4@oss.nxp.com>
Date: Thu, 3 Apr 2025 09:33:11 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: Add NXP System Timer Module
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
 Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com,
 krzysztof.kozlowski@linaro.org, S32@nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250402090714.3548055-1-daniel.lezcano@linaro.org>
 <20250402090714.3548055-2-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250402090714.3548055-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0117.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::22) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|VI1PR04MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: f90426ee-05f2-4fd3-70bf-08dd72796a26
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHlMc0VTaW1DVDI1N2V0Ym9TRE8yMk84RW54eDFxeUtoUWdkMzhKQXRSZmNB?=
 =?utf-8?B?OFpzVy9FOXFSNDBYaEJySjI0enB6aTcwRGxYUTdSUytGT0JWK0VZVDNTOTdp?=
 =?utf-8?B?bU1HUUV0NXZncTlQbURtTWJwc3lnamxKRzFvdldpdk9DYUFzMi9HemZpWm1a?=
 =?utf-8?B?TnZENEhTT0xidTJGaTc2M1dtdDdLVm1jME9ZbjZsNW84Rm51OTB2aDJOZ2Jk?=
 =?utf-8?B?QW5ieUFkWXhseXVDSWE3VkVhRGhNSnFKZ3h5Z3p6b3pNRHFWbjdmNGxrYkxw?=
 =?utf-8?B?UDlEL0dDdjViSDU5S3doTjZ3WDJRYlBlQ0RUWFA0eHUrRmJUWU43bFdXY2Nk?=
 =?utf-8?B?K21KeEZvYis1NENHTitzOUhYZUxHcGkxSUEvampDNmR3MmwrZFphd3hPWE9n?=
 =?utf-8?B?MW9QZ1ppekgwSXlzb1R5WXVDc3M4RUpFcHc1VWdsZllLQWZUWkxLWHJ1R2pU?=
 =?utf-8?B?RWx3UmlTYnBENkpZaXgxd2JhNGxEZ1JrVS82VFY4WUZJVTE3K2VDbVBZTFNN?=
 =?utf-8?B?ZFhNeHlIUzBFVldhcDlPdVEvZUNoQ0F4ZVMvNE8rNEhlc0lyYlBvWkg5QWZx?=
 =?utf-8?B?QUQ1dHJwdXpNZTJiOW80dzN6UVpwRG5nNkhCNDYvV3RWb3FnTDlpcFZxQmY1?=
 =?utf-8?B?RitJTUp4M2pIa0pCMitJSXczSm5EK1kwUjQwcS9rR2xpV1dkbmxIbGxwUGRh?=
 =?utf-8?B?SnpxTGZhR3NucnBBSU5hQWtKZnEyR05hWmJ1KzdTUGJTaWh4YmJydUdpTUxR?=
 =?utf-8?B?M0ZuOU5qVEx5bm0zaEpXNHcwdkRIaEk4N1ZOVWE5MlJ2d3Y1S3F6SndDWXBT?=
 =?utf-8?B?clBqY3F2a2xjWWFPZThuc0kzZ0lkK3BsU0hDLzFnKzRBbE5JL3pFWHAxa3VJ?=
 =?utf-8?B?QURsOEhzdHExQmoxWTVrVVpUMDZSRTU3ampEeGF0Z0drVUhGL0l0cXdqUlQx?=
 =?utf-8?B?eEZTVUxYTjl5Z1FQbVlzUzhlRFZiclNZRGJCaXlucU1IdnA2MzVUVFdRNjBX?=
 =?utf-8?B?SmloMERRdlRNR2xnNE9nL1V0bzdNMERwUXhSVUt1RlNtT3BOZ1Bza05oaVJt?=
 =?utf-8?B?SjVLaFB3SzhqeEZFSHFCQmhDK3BmajZpdFE2dFRieWJCdnhBdVV4di9WME5t?=
 =?utf-8?B?OTNSMm1sN0lDS0dYZlRkQkduaFJRSVMrdGluQ1ZuRld1aHJ0TS9helNpdW0z?=
 =?utf-8?B?L2xkd0QrOWRwVDF3L2VLYWozUXd6UGxTT3pqZEY1dEV4Rm5mSU8xVG54K3o2?=
 =?utf-8?B?NDRxSUpEQ2hWK0gvTlF5VXp5V1M0U1UxSmtYMHBqalFkNk1ZeGJBSWJ5S1d5?=
 =?utf-8?B?SjlHZzVJNDcwVDJGSk5IeFlwOG44TUZRRHFyODRsZFhUUU9jbnFsaVR4WEJQ?=
 =?utf-8?B?MUpIYzI3RUw3MTlhT3ZTZk84Q1ZLWUhsVTdrdFd0MmNaOXFIUk9sYkJOV0Qz?=
 =?utf-8?B?Q3g3VXhuZWhoUXAvQWhNazdmU1YrRGRXa2dkMndKeWxENVhDQnBmaWRNQVZl?=
 =?utf-8?B?UlNKSDFQSWhMY3pCMzdaVFNSdHlhSHUyYmhLQVNJU0ZHa3lyVUNQK0pRSitG?=
 =?utf-8?B?NGZzczV3SEtxUGZTaUtzZHV0NG5IRjc5dnNkRk4rZ1lhSS9ScnFKTXVYSFZj?=
 =?utf-8?B?NmZwS2hLa21QZ1l2Wno4cmJ3QlJYNjVDcmJDVHBmWUdoWWdoUk1TenE5SVcz?=
 =?utf-8?B?ZDV3enloYk5ZMDJNaFZBOU9yMXpKVkJlWFVobTBjYmFzQzU2Z1RReTViSUYv?=
 =?utf-8?B?aDV3QjlNVjZHMitSY3lrTitrNFUwMENiZ1lqcVF2cDExTXMxVW1iVWVTd29B?=
 =?utf-8?B?QVEzRzJVUWxnL0tnZ2U0UjhYeS9kN3pyMHhIdmhja3RsY0lEK010ZW0vSmFL?=
 =?utf-8?Q?8L2cQBl4PHb8+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkJZWHdUaFZKZFBjbDltYzFaa2NpVVpyRGpNV1laSlAxUm02UUMvaEtZMXJ0?=
 =?utf-8?B?ai9ycmw5VVJrNUkxYjRFc25jdXRtZTE3OVgzRXdIS09BaHBKS0Z5ZjF2V2F2?=
 =?utf-8?B?Zy9lOGxuQmlUMjd4MENmeGVuUTNnb2l0U2tBT3N6cXo3QkVJUmJKTjRDb2p6?=
 =?utf-8?B?MjhVMWoxdlZhWVlYN0hiN1VoNHc1dFlzMlExV1YvZU9Ub213YytBVkNJTnFn?=
 =?utf-8?B?c3ZsWjYzeUNYci8yN2J2SkwvMzNMNUI3SmFsTkVWRmlsZS9MQy9FakYydjB0?=
 =?utf-8?B?QnVGNjQ0LzBUaUd6ellpZ2NVYzFPWUFNZm1DTnArK2RBU1dLbVFKMmIwcjdT?=
 =?utf-8?B?SzBWV1B6NU1XSWM0ZnF6aEZ0OEpDdUJZbncwcHQwbWlGOHJTZjFNNGxyOERz?=
 =?utf-8?B?N3NKUUV5WlRDaEhxWXhjckt3Mm5icDVEd2lDa0NrcUNibFRRTE0vdk9uTFdO?=
 =?utf-8?B?aGg4VGdqN1hYSkNlSy8ydVhSVXc1cEo2Wm5NdmhLRDFiNm13eTF1Ym04enhT?=
 =?utf-8?B?Z3VZaWVxTVg2VWRIaU05MkdlQVNFZmJKN2oxU0t1c3V1NXVxalBkc2JiZG1X?=
 =?utf-8?B?QXpkTUFvY0c0dVJNUzF6dTBjd0haSWwvU2VhSkd4YXBxMDlRUUQzTVdGbzdu?=
 =?utf-8?B?YUxRRkd4dWt0UlVpcnVYYWFOQkRQKzA2L080YUYwdDZaYkl6Y1RjUXE4RHgr?=
 =?utf-8?B?a09vSCtxWC85ZVhvMWJLVVlqUndrTWZLbUp5djY1UVJRdi9VUk9HL2hlaUsr?=
 =?utf-8?B?TXQxTkoyQ0pPRE1rekNyYkZUcnBOV25XbktyTU12bGQwWENsdzljR1dkaWZM?=
 =?utf-8?B?RC9uay9xczFLazBScEwvMTJoQ1FQQUdFb1V1R0pRbFZSUitHMXNtbVNsUysr?=
 =?utf-8?B?ZklKSFhsSVFHWVF3UFpBLy9MM1ZsSnRBZTR2bXhWUURlVGZFaysybXZ4TnRN?=
 =?utf-8?B?cEkrcmFla1BwOHJCMURPb1BWaEFvZ1VBc3paZ3h0M0o2TnU0aHI5MGw1SC9I?=
 =?utf-8?B?a0t2YmhPMHIvOWN4QldweGdsV2NHaWkxL1ZlREpaTnZLT09JeU1VOVN3d2JW?=
 =?utf-8?B?a3ovTkN3ZlJhUXB2V3RkaURIRmNJM0FjTWZOdHBXOUJZcTNWaWt2a0xSWE9q?=
 =?utf-8?B?RDRtKzFhL2FIVWFJa1ZUMllzYVFxbXhXQ2dRcFdsYkxacW9ISHJEUVE0MitZ?=
 =?utf-8?B?RWRnWEU3QmJWYU1iUWVoWWx3K0k1MHhaQ2xybTlEL0Z0a0psanA2enRwckVX?=
 =?utf-8?B?NG1pV3U1YmdYYWZ5OUd2MG1NU1ZTVEFhME50Z284ZCtDNy9UaC8vQzBjM1hE?=
 =?utf-8?B?Q1BoSlhyQ2lBSUovcmJUcE5NbFlxU1FWWHU0Wlk1aTY1aERVMzdlWkRPK08v?=
 =?utf-8?B?UWhnYk9CNE4xVjUzdkQxRWxNVmFlSmNyVkxUeGpReUIrZGtmd0VDV2lDekFu?=
 =?utf-8?B?eC9lY0JrWThaYkZicUtJdDhNc3JnYWZtcW1YbEVRRld6dVd4ZjgwcG9MT0c3?=
 =?utf-8?B?UU9ja2JuR3EzZ3diTlo3OVltYWtZT0N5WFFJek50VUZ6LzhrVnd6SEtPOUZC?=
 =?utf-8?B?dVhWVFJjY1A5eTNZOE0rMFVXZlUyUW03UHJoa3ltWEREYVJiVCtUZWk5Sm1U?=
 =?utf-8?B?WVh0QXFad05UazhxUFQ5cEhaRENtYTE4ZUQrUHNwNzlMUnFXVnpkL05Eb2xu?=
 =?utf-8?B?Qk5ncU9CWkhyb1lzbVZtOW1McHVGK09ZdllwMEl4aXpwVDc5U0tKVU5CaURJ?=
 =?utf-8?B?eldYRnZmRXpRdWVwQWdqdFIzeE9iSktWY2paZjZMS3VRa0NFNTlqaEgzclY3?=
 =?utf-8?B?TG96Ykh4ajI5SFIvY1ZQVUxLaFEvSlo2d29NSVlXanpBZU1INnIwY1E0cmdi?=
 =?utf-8?B?RnRxaVVuekV4dmp4VW14elBMYTF2Tk1nY2ZiZmJQQW5GMmVEcWVrTkJ3ZFpw?=
 =?utf-8?B?SDhWL0JyeW1RdjRVMFpOWndIUmlVb3BVUkI2TGJCUy9Ca3Yvbm5HSWxtWmtD?=
 =?utf-8?B?emNGNE9EQlpXUkJlNVFackxNdjhKSGlOUHB0V2FscW1sNnl2aGRCV1hjMjdC?=
 =?utf-8?B?R2tISTlScWovUmNNQUdkSEgrNjBiUm80ZmFDMjZTa3dMbWVmUCszLzhjR05X?=
 =?utf-8?B?TjI0NE1OOHdVbUhVbXQxVG9zeGk4NnoxQ2FyNGVnWVZGVExSVWNnbkg4a1dt?=
 =?utf-8?Q?wIJ+2spcBJp17aw5rx1ju+E=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90426ee-05f2-4fd3-70bf-08dd72796a26
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 06:33:15.5862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQbJ9kQ1MKzl27xtAunOFASmBjAceoqhOP8A+rmksetw1xg6nke9u3XzhdTljmVNAxTj4+a9iIyMzJCiWPTrGjCmmza58fSLG80kxvxAtEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7070

On 4/2/2025 12:07 PM, Daniel Lezcano wrote:
[ ... ]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    timer@4011c000 {
> +        compatible = "nxp,s32g2-stm";
> +        reg = <0x4011c000 0x3000>;
> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks 0x3b>;
> +    };

The S32G reference manual specifies two clocks for the STM module: one
for the registers and another for the counter itself. Shouldn't both
clocks be represented in the bindings?

-- 
Regards,
Ghennadi

