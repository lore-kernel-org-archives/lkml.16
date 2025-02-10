Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E849257427;
	Mon, 10 Feb 2025 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210280; cv=fail; b=ghwVsYJmSZbsTVwPkfCdbI4K18tONF+RsDDTmbwrECtib1uK3NkXV8f4tjRu+y0nBkbp5XI0DpphlsgFyGHuNySTHf+XTPvyTmGzs9v93z8POtPIhxmk0/QPEZQkLWwZnwolnaI3HC04mm9iMlqXBSACiZIEiw0jOPeioDFvBdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210280; c=relaxed/simple;
	bh=U2zdfEWC/QyKYYmLMTQGX1PIEl+rYgk5UY6AOIRm0aM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uElX916v6CSEmWPRfP7Z/EvMIqW1+bgaoXLTfrZlA384okBoOGWbseJOXcNonsHsoZwusjh6zIukvy+7wSk3d31iXkl7vCD/WbdYVmqPl082UyY8WDbQIO9uCoX6h2dOvxLlGfSYQfGX2pwzMOV6kWbwYhyW00qGK0S2bke4m+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=G901+8mM; arc=fail smtp.client-ip=40.107.21.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="G901+8mM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+LgbF0Yib6/vVKp5rTT1IIX7M2Z7oaWSiRsBOe7YxdRU5OdK5mdsGR1xb53PXMYJdaabxUaGQTvuh1OFmj80HNKVYvlb8IF0chwW1XFsvpThdPQB4qFL0ntTAAqe6hM+JPA3R57w3o9KMc+B0EuvVC9zO1wChWk9hjXNRmmF5gh2NqZ1QKMVLrEdrjMTdc3NXRGbYH21i07PZKe3fKjAMqxX/n3w4ANpoZCnXRREhO0CQnSXe3o0CVzz+pv+aS4LUVAjW2mY01Q0mCg1DauVWKgIMkWbFcBRFsR2Hesl4+rDu3bSmiXJbSXEcf4cwfzfIqnPiQBMeBJPBUO8xoUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCZ6SvZWN2qCFsqqdaxjH/tBOjWkFM244wFrtz1cLTs=;
 b=W0e5WEf2g1oGafKDPLvm4b1xQxnCv8un0v3m1iMb8hAkwaWdaMQ51+KaOSKhzezLO85l9qSDV0aZ/ct/5azEy6SBV4a8q7Dn19/3eg23jaCH0vIYu4Z0r509hMGH6Mb/T2rhv3pO9G21j/fYnOuECIIrLletXbhTZcXWhLFHxMo99NKl08Pl0vTE9Z5i1mfb4TMkb0PPa/1fMaKmDhHAtMOuVaON5QTBrPHXPMWWAWVjCel4ICUXPvyaQFHaGZxRriXjbZWrwpOF0vEQ5h/2KqNy7aGORX1ors2mraXHYcMDWS5byaMEJixGDCqSzxru3eVFF9eM0GFejzHyPyDfjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCZ6SvZWN2qCFsqqdaxjH/tBOjWkFM244wFrtz1cLTs=;
 b=G901+8mMeszjvf78/fQ55U2pX6dEFGcw6PBPD6BF1cpcMrJZsxt6g5BHjV24TdHh5bKzCOYxsCGt5KQNwAshAKGVDT/PVOP+n3gRm/p7ydBhA8fegS2rE3jt9S9U4qcHxOkWl5PWKSVi4wAhbGaz0GM730/B3XIQV7z1g5U0DSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB11029.eurprd04.prod.outlook.com (2603:10a6:10:590::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:57:55 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 17:57:55 +0000
Message-ID: <8d830c2c-6268-4c70-ae8a-47183b8cbace@cherry.de>
Date: Mon, 10 Feb 2025 18:57:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
To: Jagan Teki <jagan@edgeble.ai>, Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Niklas Cassel <cassel@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jonas Karlman <jonas@kwiboo.se>, Dragan Simic <dsimic@manjaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
 <CA+VMnFyom=2BmJ_nt-At6hTQP0v+Auaw-DkCVbT9mjndMmLKtQ@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CA+VMnFyom=2BmJ_nt-At6hTQP0v+Auaw-DkCVbT9mjndMmLKtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:803:64::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB11029:EE_
X-MS-Office365-Filtering-Correlation-Id: fdab3d83-d14f-4964-33b6-08dd49fc71f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnZBVkV0SE5INkE5cXNpMVM2bkkxZHdBcXVXUjV3Qkh3TUZGYlBFSG41aXZR?=
 =?utf-8?B?YnRxbVBIODFLNUJJR2R3eG5kakJEVVBBZmgwNlhRL1haYlNkanlMZGxvV0JV?=
 =?utf-8?B?ck9MMG5TV1hlRnptWHk5Q0YrM2JBRHltOWdwTHBVZ1F2Z204cWtZaDNUT2V4?=
 =?utf-8?B?MWhUc3lyZzIwRUJPVldvQmQ2U241ZVZ5WDFqUkpRNGZKYm5jVmJrYzIxMXZK?=
 =?utf-8?B?VHgzZ2tLQ3ZxU2FTM1hqaEwrUk5UN3lIam44N3BnYW4yZm92ZUU2ZGNHYVFn?=
 =?utf-8?B?SDZMMU5GREJ0YzlaUkVsck1XaEFYUCsyK0RBQlRVSWlpeUxHQWZ2b0NROThK?=
 =?utf-8?B?ME5sdDBaUmNLVTQ5cTc3bmhMTWxZZDc3dE9rS3NJSisvcTBwakJuYjFKMkpC?=
 =?utf-8?B?VUJGTnV2L3NFcFVxajZLd2dFSytKWFhMVmxXV2pBaGc2TTJkaCtjVjM1czFF?=
 =?utf-8?B?TXA1WmpGSUY2bjlaaitKZlo5OFBpTVJTbHJVVGlpZ3c3QVRNK3NlY0Zrd2RV?=
 =?utf-8?B?VDcwVGtWK3RIZWpyVUp1TTZ0TFlBQW1HWmVGOUQ2d1lSTGlPa291WjJwdmdv?=
 =?utf-8?B?ZGVBMmZEc3FIeFdUZWY3WEt1MXhzSlE0S083ZEluTm5pVCsrODljM0F1SktU?=
 =?utf-8?B?dWtoU3hNZHRzYmlIZ2VCd1FuanJxaHRWK1puQ3RjMENGbmFHNlRkaWQ5WFJT?=
 =?utf-8?B?cWUveXJPVkZPU0c1ajhnSklpZ3JXWWJsVXJ3Z0gwSFhldWFNM1dBY2VrajlO?=
 =?utf-8?B?cUNrS0lsT2p5MHhKd3NFMDNTUW1Cb0J0QWVqU1JvcHhnMVJ3QVhRS1lSa0dQ?=
 =?utf-8?B?S0tPN3dFYXFBTElkWjJ3dVhvRHJTYUNHcGtTVzNENlNvOEtKaStrVkw2cFZE?=
 =?utf-8?B?ZGZaaXZlMk5UTSt6REp1RkNRSmh6SHR5WlZWQjZnWTl4OUVGV2w1T1hIeEdU?=
 =?utf-8?B?K015a0ZoNFR0dVRLVkFsYlNKODJjZ3RnenMrVkR3UGpIbDFxcHIrT1M0STNX?=
 =?utf-8?B?bG1vWjJkL2ROZG5ZNDZEdVlBK1gwNVM0Z3pMZG1CMXcrSWRkaDM1WkFqUkZB?=
 =?utf-8?B?Q29xQW85V2NwV21Ed21wMXkwY0NmaTZtOHAraWt5cWN4eUN6WUZwMzZCSkIy?=
 =?utf-8?B?RTNLT0VNNXpNMUNhZ00rNS8vTTNtQXRMSUhyVGpSWXRha1JxZ09ZV1BEdndM?=
 =?utf-8?B?VkQ2a1FtSXhRNU9YZzJ3ZlpFaUg2SjhRZXpiU00zWkZBaVdSZUhTY3l6OS92?=
 =?utf-8?B?WUptcEd4cXNEZEVJKzlJQjBJR1hJNThFbzF0dXBzR2ttRDBnT1ZCbGVld29j?=
 =?utf-8?B?THdBeTFOeEpnb3BwUHoxeFVKWHNVaG1iZlV5cm0yd2tqbk5iTWlDUy9McTdJ?=
 =?utf-8?B?YXNxQTdZenV4dW1kSmxmOFR1cjlxM1lhbnpvYlZzcTdEUm5QOTFTNlBZYVVF?=
 =?utf-8?B?dkwwTFhXUzN5RC9XamJzVjhBQVZzK2hGVmR3QkxaVHlCekM5SktNcVZKYWV0?=
 =?utf-8?B?KzVBN3QwQksyMXcxSVNPNXlvY2ZvTGgrNkwreVNxaXFhSnExMytqTUpIR1FJ?=
 =?utf-8?B?NFZEQmFvWVc2YllEN1hOa1N6Zm56ZDBuWWNUTDIrWE9RSDhmOGFnd3VyNGFj?=
 =?utf-8?B?bGVEbW1JamZPRXNxSzAzQVIxSW51S3JSYVZEZXVzVEV5ZFphdWR1UEl4SnZo?=
 =?utf-8?B?OUF3aEFLVWt4azRBWGlxQ2drNVhLaTNKUEp6Wk81UDhFaE0rOHpxL3JkdXM5?=
 =?utf-8?B?alBTVmJ6V0tDSkdZcG5mNGpJdUd2Yk0rQVlSN2ROYXY0aW4zMnJxRVM1OVVt?=
 =?utf-8?B?MGpNNlFwRFR2UGlUc25RamYrSG8zOHhoNi91SzdZMkFGWmx2dklOZEdpUzda?=
 =?utf-8?Q?GwGiHNhIOF+IV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azVpZUJoYVlieitjcjVIbFFpR2RKY2paZkRkVlNaWTAvWFJIanpEM2UzMkpm?=
 =?utf-8?B?aW1yd3NXU1VuT0Q1ZjRFeGVIMkxESWd5ejluT0QwN0VwU3d3dkJpZ3ZJU3BY?=
 =?utf-8?B?NFU0dDVQSlRoOUpndlpIN29hdGdVS09IaU5MeTQvSFRaRFZtZGw5NVdYdTlI?=
 =?utf-8?B?MkkrT3lmOTFIdWN6NitNNDYyKzVkK3dSZW5UcnNVNjdhcTVIbGlPL0RQTFdm?=
 =?utf-8?B?ZjNoRXdqSmtJUkxxMnF4cGorTHBwRmR2ek9Pa0tLVFRONXZ4NmFiZVdnOGY2?=
 =?utf-8?B?NXQrY2RITThqczZ2OHNGYTBRLzhaOXIybGwvMmVGZSt5NFhaRTRKTGlJdmxT?=
 =?utf-8?B?bGJ5M1dGblhROWpoZkR0WEdPL2YzNGRYcFkwL0RWdXBqQmRscFd5Q2lBTlZi?=
 =?utf-8?B?M0V2Q1FLL1I5RGNNS2F0aWFRd1R5OXRzdmpFaXF2TGZBRWZFT2gxSlRuUlBD?=
 =?utf-8?B?aGp5dGp6VHRmNmF2VlNQeVIyZkhHSXIrQkNMajdFWFdpVk5GNDNmcmtqN2NC?=
 =?utf-8?B?U2xadnM5alI4RHNwN1I3ckEzTnVzZkJxTUZuTlVrVU90RGJzZjd5b2R0dU9N?=
 =?utf-8?B?ais3WUlPcjNXVjVhMHpoQ1FSYkpxbkRDRGUzbDZMckNUS0tlOCtOWnRxTGxN?=
 =?utf-8?B?YzIzV08wZSt3Znl6ZkJUbmpmRnI3S1Z1VkFSUmhOVTlZcktveUFGU3NyUEpn?=
 =?utf-8?B?YVVXY2FrYjRIQW9PT3hlVi9yQ0FyaXBDZjQ0N29mbXRFaEh0OG5kME5VZ2JM?=
 =?utf-8?B?N0VFR0VncllIUnA2emxFNlpHQTRVZTZBVzNScXh3MkVLaW1FUGs2SWg3R002?=
 =?utf-8?B?WHMyU1JLWWE1d1QxbUlSWmhFWWFxanNmMWVuZXR5eS9aenlYTDdTQ2NMRlJ3?=
 =?utf-8?B?VG5pRHhnSGIya0tONjV0S2kwVSttS2MzTmZuV0ZGOWJ5QmprVWpnT2loLzlP?=
 =?utf-8?B?Rk85VHMyZldvSVBtR3AvdklrSmFpek1MRC9iS29iUm1maThERDlOVnBQS1Nh?=
 =?utf-8?B?SVNBSk5wNnZBVTh2VmQyTXFDTm80QWREellHcTJJVlhXcldsR21ZQXQyOHRY?=
 =?utf-8?B?WlBKaWh2SDJ3OEhpRUZNUDg1QnJlVVc3L2RFQjVTSjdMTklWdGIwRTFCVEw0?=
 =?utf-8?B?eDBXdGdxSldRb3J6NnZyNmRGdkV6bmZOMXpsS0tVTjQxNTh4RGZyaTVZZWp0?=
 =?utf-8?B?aUlEbVh4Yi84L2ZleThLNFd3N1RXbnNiajgyeUVSbnhZUnZHTWxxZXord05i?=
 =?utf-8?B?M3NJdkFENGpodG5PcXR1WEdiMkpqNUFGSXhBMVhnNXE4a2ZvTkpDbEl5bDJW?=
 =?utf-8?B?UERqcy81WGhXazg0SUhZTEpEOVhha3NpS3hOQkFzK0E0ZE1MRTNRbWoyVzBB?=
 =?utf-8?B?WWZNQUpFVU5TTit2VkxENkFabitFR1Y0VzFNV0xrSzJTd2ZKZDZxU0dSVGFG?=
 =?utf-8?B?WUUxQVNIT0s4dXU0QzdGKzNPaUZBcGZza2xmUTZOT1dIME9YbEpQZ1d4QXlQ?=
 =?utf-8?B?THdXaCtVMk44RDJwcG5kaWszZFZWWUFud3hlaWxJRDY4MUUxVDhFZmhOaUxt?=
 =?utf-8?B?Y0s0b2YzNDROb3pqU1NzQktUNCtGeHNmQUVKOEpXYXZOR1UwaFdtOGtnRStw?=
 =?utf-8?B?ZXpCdVdlQnFQdkhYWnpYN0ZHMXlQeVRTWkpJbGdCa25QRHg4TlJqVjhBcEs3?=
 =?utf-8?B?UnZHRkdRTkZVS0xHcmE1L004SXZ6ZWdaR3haVm96bXA5KzVVakltMWNHMThZ?=
 =?utf-8?B?Zm80MjhhR2JCU1dmSmZTSWthazE1K2hDeFBLYk1Xc0xkNkhiUG40cnY2dXpa?=
 =?utf-8?B?U1JWNnVaRHFmWU11a3k2UmQremc3ZVFxUm43TkV3MGEzbklobDlxZE05WXVC?=
 =?utf-8?B?RWR5V0NCTmY3aVkzZXdwazh5MHg4MzlMMHA5RHB1d3ZsUmh3NWE1bjBENmFh?=
 =?utf-8?B?WWZSOHRwV1A3RHN6MHRxTUg0SEJFemJnSnRpaTRSa3NxTmMyakFtUGFWd1Rp?=
 =?utf-8?B?L1MyMlVza0lZTTd1T0Z4SnBxTmRjaFFaazZiOVduQWJ2S0tGc0VsaG51a3k3?=
 =?utf-8?B?MmlXc2VJd0luWmwrRWUydlp4cDYxZ1cvTUZQc1RNMktOOGUrZllhdTNqS2l5?=
 =?utf-8?B?TjlMR1ByZmpXMVlSODd3eEgva0hFT2VTUUxJK0NLd1NIWXl1VDVhYlAxd051?=
 =?utf-8?Q?Jjuc7SfPmE3rVCsVH2yODpw=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fdab3d83-d14f-4964-33b6-08dd49fc71f6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:57:55.0283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0sZ9xFY0SCkwopghyxAD02cvY9wnb1L5TwyHgVvomnZmIXAV7LjHmdkegdHgIBBUDSlmkyd6dV/TMI7Rh58PD7TSKmYNi4jqghlG87jeOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11029

Hi Jagan,

On 2/10/25 3:11 PM, Jagan Teki wrote:
> On Fri, 7 Feb 2025 at 20:50, Quentin Schulz <foss+kernel@0leil.net> wrote:
>>
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> The Edgeble NCM6A can have WiFi modules connected and this is handled
>> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
>> NCM6A WiFi6 Overlay")).
>>
>> In order to make sure the overlay is still valid in the future, let's
>> add a validation test by applying the overlay on top of the main base
>> at build time.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   arch/arm64/boot/dts/rockchip/Makefile | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
>> index 534e70a649eeada7f9b6f12596b83f5c47b184b4..02f98abe1df10f44f2ac27ea5f6c6e6c6334724e 100644
>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>> @@ -192,3 +192,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
>>   rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
>>          rk3568-wolfvision-pf5-display-vz.dtbo \
>>          rk3568-wolfvision-pf5-io-expander.dtbo
>> +
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>> +rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>> +       rk3588-edgeble-neu6a-wifi.dtbo
> 
> Please add neu6b-io as well, wifi dtbo is similar for it as well.
> 

Similar or identical :)?

Should the overlay be renamed if it applies to neu6b AND neu6a instead 
of implying it's only for neu6a based on the name of the overlay?

Cheers,
Quentin
