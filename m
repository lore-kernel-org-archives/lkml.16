Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317FC28B3F7;
	Thu, 22 May 2025 14:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747923143; cv=fail; b=F7XJ7/gI5RqOqsJddzS9OE2z5NzWyVDamOuT623XK29Vz3pT7ecartVSBMsxMJoV2mEiNuiimc/I1eL7r9kaGg22S6vSdFFlk4zYI4EFbn2puHgQ7IhWGva7ya8jHtrVHGTmUGfO6ISfzcdvBzZdsBOJ4lcAoOGC410GWcRkFaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747923143; c=relaxed/simple;
	bh=hTbeucZJiEUYJ8sEIz8/nDFSHUpUCfOtauPP2do8M6M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P0ZTQql0PHfDkVBAJG/yz+7JmD0Wb3GbghbjJ3+Y4BtKTlcT42a+4xUyF4d6VU7otRfd3EeNZ+AN4vEoQ7mB3L15ran+o56foEuD35AFkPisKKHDLwyTq/M/ATQr1zL6LFoyMhm6adgb+0W93t+yeQLoRsmr+NzbmHX8RAu+Ztg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=S8zeo6Aq; arc=fail smtp.client-ip=40.107.21.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="S8zeo6Aq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxuxUzNEL1sUMyUuIdAFeXARZ8jz+Hqvxlee35ITp7KE60nb2O8NTLkVPACe6gnRQrsZcrSfxSGxZ2Jura6IS1TwWPTGriHNpVWxbe7cxInC1iKQIcILqLezU8Ctc5SRZ8DihN38aOn5shcf7FSPgA6gnPMvOrONkIEtehznWfUym5I5f7D5ZfYbm2MI6CB3naqbJsLK0uPhMCh/bTqtxYm5c/U0xRd3Q6SXr/hES6rj/L5McflJsvq+ln4NjpcycWe8/xexjthcE+K5heyQgYj8IIwShWjnWZMrVLJLb931oeRFsSI/RhaXpx5D6eQPPMVBrNK1hiNL/DHN0Mwi9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+Ucv8q9ExIP7YMxkcRN9yEfp0eaB6GAj7UNrBPo7fU=;
 b=FUsiF5u3yQZwVwrESYLYpO8/Z9TD19moS8XjP9b/iYAr1za7Cxa4U3d/nyNdzvTwk6yihtJtNjxVOUH83EIKXQKmfDkhpsKY+LYokOT2LR71ey96l2ZIr+IegB/6Q/xcnjPkcEJZa+tBDv8IrdLq3uwELTnF9tMya2BEPmPBNE8CYDcTOZz473xqmeHYrcFzBgl6KY0FakbwnpV4r1fxO3E0EjBwa/PAqyDFUKa6ITQEsgwCuaWhrt+C0Jagz4V+2g6Yckh+bfL5UJWa8TyXewQ15RnC2QrOinC4b1nlnovugNvl9LOjMzDnilkp+L2HuCskPDBn8TpP17xkX7yMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+Ucv8q9ExIP7YMxkcRN9yEfp0eaB6GAj7UNrBPo7fU=;
 b=S8zeo6AqlUGJTP8/8jf95yHJ1H0/V3PU2L8deEK/OMl/b+NOUpnWNW6s8TQg6dzVwHEyXeA7bHBZ5YCu5aNmpJfjWAEi+AROFvFw7a7Ukv3utAaIDgjusE5ZlcKa5JHOuVPvCw5jcnddubB0+QoJvrhFuS8d0ZputFm9zHov4Ds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU0PR04MB9657.eurprd04.prod.outlook.com (2603:10a6:10:31c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:12:15 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:12:15 +0000
Message-ID: <9e8f659d-9116-46a6-b7e7-3d4705f57ac6@cherry.de>
Date: Thu, 22 May 2025 16:12:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
To: Andrew Lunn <andrew@lunn.ch>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kever Yang <kever.yang@rock-chips.com>
References: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
 <20250521-jaguar-mezz-eth-switch-v1-2-9b5c48ebb867@cherry.de>
 <657a085c-4214-4096-8a68-047d57a40d60@lunn.ch>
 <19574942-d06b-44b0-8b6c-d3ddd94db89f@cherry.de>
 <9c99aba9-87f5-41fe-8b11-7ef27525750c@lunn.ch>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <9c99aba9-87f5-41fe-8b11-7ef27525750c@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU0PR04MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a6466e-2955-4e28-9d3e-08dd993aa763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bW83alFQODUrc3YvMVBCcjZreUdlVStwTGU3VDh4U2JLNnVmVXFEMDdSSk1G?=
 =?utf-8?B?dHpZWEE5ME1weGdOMUVuak15d055Sm1lTEI4VzFXdlBqK2pub1FSd1U2OGZC?=
 =?utf-8?B?ZVI1bHZwSktwbW9PbWxKRTdKa3UzTzY3T2FFQyt5VXgvZlhKTGl1TW1KNURt?=
 =?utf-8?B?Nm9pRnhFcmxkMStVdkN3YXhPK3BtbVJkNmFlTGtLQS9BZ2F4Q3ZoaHpoMlk5?=
 =?utf-8?B?cnVLeTJrTFNRL2tQNXBEMi9ucXZKM3hXcmk0SXUxMitKcjREaFFVU21nWDJ2?=
 =?utf-8?B?Q1NDMDBxS1I3SUc3VEpEb2N6ZmZzVTlZZ3VLUUdENmNMYzlCUSt6RHI3OW1C?=
 =?utf-8?B?UmhJTW1KOEdWRFRULzNkdmR6bmxQT0VBSk9tM25zZnNzR0VWKzlHV3BaV0Qx?=
 =?utf-8?B?enZFeVgvMk9adlJYOXlLN3NnY0xGR3RYdVFBd0FBMmxsbHFrcitPeVI1MGk2?=
 =?utf-8?B?OUZFQkgzZDd6SmhZd01VaWxEdVlCQjM2dzI5SGwzcWk4ME9sSDVLOHAxcEw2?=
 =?utf-8?B?MHExSHdqVTFPMS9UMi9Td1gwOGpSeTVFcXpOSU9JWGxIMkQrTVQyekd4emwv?=
 =?utf-8?B?YTBYY2lKSnVTUWo2VWZUQzdrOSsrT3FFQklBajVXNmlMVldmZWFnbm5neW1n?=
 =?utf-8?B?cWNMeDMzYnF6VnFSbnlUdFZrSEtEb3QwM05MYkF3R1Q1SWZjQmh6SVJIeXgv?=
 =?utf-8?B?Ky9OaXlBT0FabU4xR2dRTzdOaUtrQnV3bkR4bEtyUnVCQ1hkbldFbUdZOVVi?=
 =?utf-8?B?QWQyZU5xbG00Y1RReS9oQU1BTjFPcnBXZDBwN1o4eG05NjJNY1lVWDJKMWVC?=
 =?utf-8?B?dE1COWZoK2h2UXFmcUVYZnJ4L254RzFTUUhDUkRGRGV0OVZHOUxGbEZUcjN2?=
 =?utf-8?B?ZXpORk91SEZ4ZTJGME1vR2lEOTBGTUJNSDJnMmE0dUEzYjRCVVpkbGRzZEEz?=
 =?utf-8?B?M2c2elVIRnRwVU12NDlhS0JoN2VnaW1GZ0YzQlpEY3FURTZnZ3RvcU40cDU5?=
 =?utf-8?B?MHg4YXB4Y04ycXc0M1Vzc0JkeklHdFNhRW9DRmhNaXM3UlFiRWVwVXZpNHZm?=
 =?utf-8?B?TExQYkhQZW5kQUNNaGJJYU5DUWN0WUFOVDZ0RXdiUUlIQWdqYnlYSklGUjJN?=
 =?utf-8?B?Q0Rud0tKdnBiMms5d3U4ekxlRGYzZFN0NWtQRk8reFFnVUk3bkQyVmtpRW1K?=
 =?utf-8?B?cTlieGY1S0dKSW1yeHVFelhFSkhlUzNaSnZxQlE0OWRLeml1SkcweklkeWZL?=
 =?utf-8?B?cGtJSDk0blNXL0Y0LytpN2FneTk0ZGxGdk9vbk5nczU5Nm5GMkFORVZ1Nk5s?=
 =?utf-8?B?aHlNeWhYUTZhTFpPRVlYampqeVVnTG5uVmRQLzl0RUpGUGdzNnM4V1JrK3M2?=
 =?utf-8?B?NGIydGZDcDRrWGNyam5SUmdyUmY1dSsrTG4wSDlHQmdMSzRRaFpNVHJVQmM4?=
 =?utf-8?B?UkdJWTVza0RXcWhrUFpTOVNpT3FCZzdKRjdmdXJxYjNwM0VOMHpVaDltLzlE?=
 =?utf-8?B?M3JYN2xXN0RDUk9OeURWcExPdUFvTjJRMWR1NzRXSlE4ZTJjblhmeWxkWFlU?=
 =?utf-8?B?bEpGYkQvbVRpRHBFRFZGM0hyY2V6eHlub2N5Skk1eEJHc0FnTW1sY0RjVWJY?=
 =?utf-8?B?MXhPUWxDVnRMMzU3UkljVkFpV05FT0lxL0ZPM0lGTDBMK3ZYTndCblV1ZjRs?=
 =?utf-8?B?QkpMTHJZbHB0VjVaS3IrUHlXZkJ0cG0xWkNIOFpNQUlZLytub1p6WHQvb1JB?=
 =?utf-8?B?alg5SThyanB0aGZCOTR4UmJ1Y3ZXVTRHZ25Xb3dZdDN3M0tqMG4ySU9icFgz?=
 =?utf-8?B?MGVkYzExQW55Nm9nMnhobWtDZ3ZTR2JLKyt4dVJxZjAzenp4VDVZb0ZDTFJY?=
 =?utf-8?B?elJOc0UzYlVsYm1hL2YyMjg1T0VjTzdxYlZLa3ZHODZtT0x6WHNwcUw4OFlw?=
 =?utf-8?Q?DH6HdSRG2X4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWM2dXAzc2xlMEk0WHJIRTI2cktLczloWC9OZzBhZXhOZ0FYREdxTFZLTVNo?=
 =?utf-8?B?dytucDcwN2QxNkhTM0JNTzlMRkc5ckh2bkkzTmswY0p6cWJPMU5pbW9LR25C?=
 =?utf-8?B?bjFwNEpaQmgzcldNWVpscUZVNTJDbGMwUzN4UjRBb3pCUWJzMVpTNVFqaTRw?=
 =?utf-8?B?T0ZBMHQ2bHQrdE5OSlhPQmNGTCtaQzZsbjNrTzdEVW1ZcGRGNEpieS90bUVh?=
 =?utf-8?B?am1pTmIyL3dzRi9POHBFQmg3ZEN6K3lGaWJLMVB5S09WcTVScGtmVzgzOHIv?=
 =?utf-8?B?UUIrNE91UzRhT09GTkNJUlVyTHBXOUM3Yy82RlR6Zy94WDR6ejErQUIvYWtO?=
 =?utf-8?B?M3lQQTdJV3RXbDJQUmtRK3Jjb21iblMwcXk0VWRBeTlwZUFKRGtTYTMzVFlQ?=
 =?utf-8?B?WXJXRE9qK090bEhldjBrb3NuWS82MSt1Z0x4RTBNUW1MRHBLdmdQN0x4am53?=
 =?utf-8?B?dDR4OWp6UG5aNzBmcjkxSEovZDZib3l5OG1tNUZqdGNXamJaK0ZISVUwdlZL?=
 =?utf-8?B?WEZBU2p4dXFYMXBxMlRiL2kzUnVuSTRZem9GdDA1dEVOZXdBd3RFemVzZVA4?=
 =?utf-8?B?V01OVVpoa1doRml6WHFUQkV5U0xteklaVjE1OXlNVjQwMnhCQnRsMDJJT0xa?=
 =?utf-8?B?MitEenJlTGxTYmszVDFPZEVtTFYyVXRJTmZObUVNTEoxNVhCVUw5ZXJLWXhr?=
 =?utf-8?B?N1VCNGloWHZaL1JWUXVLMy9JMC9aY25CQXdUUWNZTkVHZ01nVzVTUndCSDl2?=
 =?utf-8?B?b09JSkxmKzlyTTN5OXlWNldSOE9yWFoydTAzVXRLblJjTTZEMFRUeVZTdWdJ?=
 =?utf-8?B?UmhIa0pXUzFwU0tmVmt2RUlyV09SN0xJWGdYZzJnQVdzMHVFcWpsNU5pMzYy?=
 =?utf-8?B?bVNucWFUU3Q5bnVoS3JWMWEzaHFqeVQwYUdXU1ZxUEpocXFHUlFKcnN0c0RB?=
 =?utf-8?B?WjdHaW03VEU3TmxzWkZMODZPODhhaVdWV1JzRFpwSCt5cVJPTDlaYjB3RWFP?=
 =?utf-8?B?akhNeU9icFBrVlVPWkpFYlVCTnZkOHRFTzlIZ2hsOVZ1eXhqMHB4ZEhORGRO?=
 =?utf-8?B?akJUU1o5MmRUc1Jab28wWkg2VGhTeFBTN1VGZC9kM09MK3dzRUNDR1EzQitW?=
 =?utf-8?B?RGl1ckk0b2pnU29kMU1QZGVpeWFKZnBiUW95Qms2YnlrSE9DUzUrcVlacHkr?=
 =?utf-8?B?cjhVRjlWbEJRMUplVnVxZm1obWo5NFpZQ3U0c0N6M1dGaDJQUXJ3dkdxS1BP?=
 =?utf-8?B?QlRTYnN5c0o2KzV0dW5JaUZMNElpSUVUQURPOFZJNndJOW5xMDZxanJ1MzZW?=
 =?utf-8?B?WVZ0VUt1Q1FtTkpQZGd2WFZDSTNtcHVhYlpvdE1RY2VTaGlsZFlPcGZtUEIw?=
 =?utf-8?B?OFZRd2U2RUxlcmdqK3lxaGhrVUZRYXdQWWt2MlBMb0VNbTJxT1pvMzZWUzB5?=
 =?utf-8?B?bS81UHlKWlMvK0Z3OWpMRVlWQnVZQ1JYblZnYXdieWNGQjF6TlFIRElzR24w?=
 =?utf-8?B?YWNCcWsvSW15NHA2Y202aHdHYjZKOHhoWVhXVTBxV2I1T1lkSytZMXNRWjE4?=
 =?utf-8?B?RGVuRzBtelhEQ3lYTkl1UXNBWGt4eTY0N2JUS29tckRHUXlFby9wNGRPRmZs?=
 =?utf-8?B?cnhkZ010a3VSN0hhMlh5TmFrNFdhNUNibGllK0NZbXpRaWdEekFHcDU4K3RB?=
 =?utf-8?B?VFpOL3NoOWdPbEowTisrSmJnQXJneXFNM2U1YWU0NXNyMkhZZGRZMXFsSkJB?=
 =?utf-8?B?WmlKOHY4U3gyLzN5K2pVMkR1aXY2WDlSckhPbm5wcjlBQmJNaXlzYWYxaU1i?=
 =?utf-8?B?OEU0NkJTTlcyN3FWQlNBZ2ZsbUZGRkFUNlFkZm9GWDM4MDlGUG9oS0pWSmJI?=
 =?utf-8?B?MTJVTGx4SXo2cXJwSCtrak95cmJ3b29qdXhUTjlPQXQ4TmI5Y3EybXl5VHh2?=
 =?utf-8?B?ayszL2RhdVIwUWV0aVh5Y1UveVZRMmtLQ1BIdTBDaEVFdXRIWnoyQTdzK3lL?=
 =?utf-8?B?azMrdnRWTCt2SENZNDlRYlNwZmNqd0pDWG9yMHdoOUxYTWQ1aGw1N09XSG5q?=
 =?utf-8?B?bGxYUGFNczZFczNYUTdTVzdGV25qQ3h3b2s1MmxYZkUwNWhaUFYyN3BmTHBI?=
 =?utf-8?B?dVRwUWpwYlVobFdYQW5lZm1aNktkSDF0NzZ5OEhkSkVvNkxBYk55Z2FoWlBB?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a6466e-2955-4e28-9d3e-08dd993aa763
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:12:15.3236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7ZPfhchFbE26aZz2ek8BKQxE8lCCRXOiWOZjuriyU+9Cs1kfxJITRqfEO2kT0riVNUbxc0Saw5GgODS3Jv0GPZadL8wPiBoxAjxfFntMMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9657

Hi Andrew,

On 5/22/25 2:50 PM, Andrew Lunn wrote:
> On Thu, May 22, 2025 at 10:18:12AM +0200, Quentin Schulz wrote:
>> Hi Andrew,
>>
>> On 5/21/25 6:25 PM, Andrew Lunn wrote:
>>>> +&gmac1 {
>>>> +	clock_in_out = "output";
>>>> +	phy-mode = "rgmii";
>>>
>>> Does the PCB have extra long clock lines to implement the 2ns delays?
>>>
>>
>> Not that I am aware no.
> 
> So 'rgmii-id' describes the hardware.
> 
>>
>> The issue here is that I believe the Linux driver actually got the whole
>> phy-mode thing wrong?
> 
> Quite possible, a few drivers do.
> 
>> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
>>
>> First, tx_delay defaults to 0x30 if absent, rx_delay to 0x10 if absent,
>> which seems a bit odd but why not.
>>
>> Then you have rk_gmac_powerup() handling the delays.
>>
>> If RGMII, then use rx_delay and tx_delay. If RGMII-ID, use neither. If
>> RGMII-RXID use tx_delay. If RGMII-TXID use rx_delay.
>>
>> This is the complete opposite of what I was expecting?
> 
> This driver, and the aspeed driver cause a lot of problems....
> 

Would the suggested change in the previous answer be acceptable to you?

@Kever, is there any way to know what the register values for 
rx_delay/tx_delay actually mean in terms of picoseconds delay added by 
the MAC maybe?

>>> Since this has a switch on the other end, its a bit more complicated
>>> with RGMII delays. Normally, the MAC does nothing and passed rgmii-id
>>> to the PHY, and the PHY then does the delays. However, here you don't
>>> have a PHY. So you have the MAC add the delays. This looks O.K. I
>>
>> The switch actually supports adding delays on the port used for DSA conduit.
> 
> That actually looks to be the simplest and correct solution. Set the
> MAC to 'rgmii-id', rx_delay and tx_delay to 0, even if they are
> ignored. And in the switch, also 'rgmii-id' and let it insert the 2ns
> delay. You can use rx-internal-delay-ps and tx-internal-delay-ps if
> you want, but it seems to default to sensible values.
> 

I don't have control on how much is inserted by the PHY as opposed to 
the MAC, so I'm wary of using a much less precise (on paper) delay. I 
have no clue if doing this in the PHY is going to put us in the center 
of the eye or not. Thanks to Rockchip's kernel tool, we are expecting to 
be in the center of the eye right now.

>> I'm a bit confused by the following sentence:
>>
>> """
>> Normally, the MAC does nothing and passed rgmii-id
>> """
>>
>> is this something that the MAC driver is supposed to do or is the subsystem
>> handling that somehow? How do I know how/when to rewrite the phy-mode passed
>> to the PHY?
> 
> A small number of MACs have hard coded delays. You cannot turn the
> delay off. So the MAC has no choice but to do the delay. 'rgmii' is
> simply not possible, so -EINVAL. For 'rgmii-id', if you pass that to
> the PHY, it will also add a delay, and 4ns in total does not work. So
> when the MAC is adding delays, it needs to mask out the delays it is
> adding before calling phy_attach() passing an rgmii mode.
> 

If I understand correctly, if phy-mode is rgmii-id in DT and the MAC is 
adding the delay, I need to force PHY_INTERFACE_MODE_RGMII phy-mode when 
attaching the PHY in the MAC device. This seems to indicate that the 
meaning of phy-mode = "rgmii" in the DT differs from phy_mode = 
PHY_INTERFACE_MODE_RGMII. The former represents the link, so rgmii means 
no delay added by either IC (MAC or PHY), but the latter is for the 
specific device with this phy_mode set and means "no delay for this 
particular device, but maybe the other end of the link adds it".

Does this also mean you cannot have mixed addition of delay? E.g. having 
1ns from MAC and 1ns from PHY? It has to be only on one of the IC?

In the comment at the bottom of the dt binding there's this following 
sentence:

# When the PCB does not implement the delays, the MAC or PHY must.  As
# such, this is software configuration, and so not described in Device
# Tree.

Why do we have two possible locations for rx-internal-delay-ps: PHY and 
MAC? This means to me the location is in some way software configuration 
since the MAC won't read the property from the PHY and vice-versa. Why 
isn't the MAC responsible for providing the delay to add to the PHY when 
attaching as well? Or are we supposed to have the same values and 
presence of the properties in the MAC and PHY? The KSZ DSA switch seems 
to be handling the delay based on the phy-mode from the DT for the DSA 
conduit and not the one it gets when being attached to the MAC, c.f. 
ksz_parse_rgmii_delay() called in ksz_switch_register() for each port in 
DT with port mode gotten with of_get_phy_mode().

Cheers,
Quentin
