Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CBF1DC745;
	Tue,  4 Feb 2025 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738671638; cv=fail; b=FoHP7DezN3hU64USUGfARUcEqD50mm1acEJW2Nlg8EYHsvomG5I3oI3trcFXBw01aARztgX3OCa+9H+bUgXLj6/6mHBIgsIovntyWDcP0hx+wOq+Lq27+mz3H2FOxUyQf6r+TU8KSDqHJCyMcAH7iLkoZE98LtGYF301INRxCI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738671638; c=relaxed/simple;
	bh=7OrYsoPaN1zSixvY2F5GDU7vYrqd0RFlo0+ck6sqwd4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PMlFUMrWpJ7lK2cYjNheAlP+yL7xg4Y1ee6YYgh066VcsK1RMWqA1Ne6tqLsYtM2F5TCwyM2w0LPh8Iwhlqr1yEdS0ISJEcZxhH1WfNP4wT3TwFEoPYJkovMk3aneFZYWV6dGfEa0i70DwMO8IVRbcucrd9/f9S9ZQniIrwEoxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=crbxqM5Y; arc=fail smtp.client-ip=40.107.22.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="crbxqM5Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLQfAKzyy/U7fYLN27/kutFmnBz4408E9oAnZn02FiJXyDNic0M1Cc9MVIKzMFuZF7bYwRLDtBYTz3mVBHSobukXDR6KYGptFjaRhtQk4ieToH6WGCNLr/Z0HHebqrzI0kDHrnU0P1eRMYP8zK3PhEHUNPRQNIo64mI2QDETxQhyWTiBTR7I9WNzW58SgOtbCLuJ11fnsH/aPeizkJy7d6712LIJ0zaijftmlQQW5t/oPzl7euZYmeT0if4khRInYMYGtZ85TxZBfHy0Yf3/mVYuMufmiZFkTbcSL+F9cMfVhLACh+yHmx9F7n9Kbve/9Xc4W0okBNLutI0Q+i3xbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLXMBiSSzSTG76f00hlh7mWD3FzggG1NLO/4cs+LaDc=;
 b=WNpk+dPMviMmZ4wPEwDUqaWPB/PGDjTnBHHCjkmOe4MrHn4UqwmM2KXZDVCUUIcrCP+SyysmLd7zsLuQ9jrNpru0iLeZsa+moq5KKF8phuWMQYs55/QMlyc/7upbM3JM3Vem5y56ImBvjkGNWVi9QAzHrc9ycMXfxzEh+jkxUL705EqfCXvrxhw3kJlgZZj6yjmP2xnM2aMraKCz8l+gVZ3qAcWpMqGssE+OdG7xIDSCKnnlwgBl/b/jL6q5tFyDaLq9pfz2Wpumy27xUlkBEMN96jxYXycypT9n5G9z6pWPt+JaAAENMArscLZAs00tydZKHK6+Ot1ODd4jNo+/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLXMBiSSzSTG76f00hlh7mWD3FzggG1NLO/4cs+LaDc=;
 b=crbxqM5YPAl8OI4WlB3jmVIaee+/ef3dN0hEtNUAELLmxxDNOEjs7EOjpJqXotuVz6grUQDVrLJ/ldzMMXNdvqEjk28jNEYst1dmR629FteIIr0X3fFlKixfQ+4H9e/PeFD/odtxkkw0J7DpUiJeQOFTH44TGbJdM7yhkW0rAoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8432.eurprd04.prod.outlook.com (2603:10a6:10:243::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 12:20:31 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 12:20:31 +0000
Message-ID: <3de1cc52-5579-41b1-a333-0c4e81f96fbd@cherry.de>
Date: Tue, 4 Feb 2025 13:20:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add overlay tests for Rock
 5B PCIe overlays
To: Dragan Simic <dsimic@manjaro.org>, Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
 <20250131-pre-ict-jaguar-v4-3-c971e2852e8d@cherry.de>
 <77b5d0efa6e56bb391575aeeb4d1be80@manjaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <77b5d0efa6e56bb391575aeeb4d1be80@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8432:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac892af-e362-4d32-a668-08dd45165130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGF1bEMvTnQrWGU5VUlpQVdKWDhHNVRQQUpleUtvKzNBdWFQaVN2MzBEczcx?=
 =?utf-8?B?YlJUS2drSzVQN3Q4UUh2M1YzTnN5QWtaTjNlK28ybVBvNW5MSy9FRFJMeGlj?=
 =?utf-8?B?SCtBb2xOalBwWnNnZ1lBYzY2TmhINWVrTWtkazNZVjgzcVZHNGx6Vmdtdjd4?=
 =?utf-8?B?dHMxVmJYcTNjSSt0UlNBQ2NNeENFNmw3YTgyOXNUd0F6SmMzdHM1VUxxSjlF?=
 =?utf-8?B?aFVnVnU1YVlsNzlYSkNsaFdGVmhDVkx1Um5ocW0xenVuV1lqRVRhRUtCT0FU?=
 =?utf-8?B?VlNicXg1OGg4Z283aVZVM05TbWpoUDJId0hweG52TDdkdXk4YmxpUDVPcGhG?=
 =?utf-8?B?STNSWC8vOERVUnBVREJPbEFTd3RjeVhIalFEb3FPblpoV2VmcHB0Qm1wZzVL?=
 =?utf-8?B?cmN6RkNWM29KaTdDa1IvY1g3MnNVeUsrWEU2MThDdEZ0UFBFUmJ6YWxpYkJM?=
 =?utf-8?B?OFJ0THdwMm5jNjNmcjltcENvRWVjNnVDb1BuUTdnM2FhbkVpZmpKQnFrbTRV?=
 =?utf-8?B?Mlg5WU1FR1ppOVJHNEpNZm5RSDA3RnRxUkwvSmU0QUFISmVJVGd2emFoU0pn?=
 =?utf-8?B?azJ0THh2L3Zla1ZNUFVKWkplQXRIT0d0Sm1xS3F5ZlZCVFVDL3hwL1dnUDBt?=
 =?utf-8?B?Z0xpU0F4UTNmVGxYdkZQSDZWL21hQmNlNjZnWkpQeEhLeVJtTHVnNWNDZUo1?=
 =?utf-8?B?VFNxSUVlSTdwcDAxUW01d1YyT2dHbGxIdVBDYU91ZEc0ZFRNV3FJN044emc1?=
 =?utf-8?B?YUM5dkJiZ1NrQUZBNVowZFl4T3BmczFBUTVJMERNVjRoeXk0dkZia0lIVHRX?=
 =?utf-8?B?QWRzbXNEQmExa1lmY1ZXZHlCMUhrQmgrQWFrNmhnWTlJeGlEV2NON2RtRVht?=
 =?utf-8?B?YXlqM2JLUXFLbFdUSUxzYkpGNUpDd3F5SzJleXFhMG5YR2g5N0ZGQkQxQ05D?=
 =?utf-8?B?dW9RekxxWEo0UExiVnBmTDlCUTZaMU16ZHg3b3BqeDZjeXNmVTlIczRPUjZT?=
 =?utf-8?B?NGlMV1JTNjAxWXVCNmpueTUxWC9rMmk0VW1sejYzVDJGRENQaU1HbDFXQzQw?=
 =?utf-8?B?cWdOTC81anBZcWwrbmp3TnVwaE1kQXVocERhVFV1ZmNZV3ltc0VtVVVNaEho?=
 =?utf-8?B?MEZ3MWh0RVRRa3gxYzRBS1ArbEZnSGhOTC9hNXFjbE5tN2pBRWtZbXZXZEFO?=
 =?utf-8?B?ZWhoay9UQm9SSVpYZDcrVUpHZlBQSUNYcnd0WFdxam53d3lIZnRuU3pQU3By?=
 =?utf-8?B?K0RybWNkR3pQSmtYQ3Q0YzROV0lJSFBZM3FJTy9IZUdCZXVZYWIrVHlYRVR6?=
 =?utf-8?B?QkpGWjdyUkF0Yk84U0ZpTU82ZTBxK29WSzNwOS9wUThYMEtCYWM1OGU0R2Qr?=
 =?utf-8?B?bzIzM0JadTQ5dVI1bm10azlacXNoZTU5L01ITkFvKzRpUEF4aDBGc1RhbFFF?=
 =?utf-8?B?YnVSR3p1RDNLM1F6UXRtWmY0b1Q5ZXg1UmV2ZjVxeHcvT015VC9saXVVMzky?=
 =?utf-8?B?U21IdWIwMHRQazViRzhiZXRDQUljQkFHRWJ3Ri80RnMyS0Q1ZUdML3V5ZHp5?=
 =?utf-8?B?ZlZqT09iWjhZZERaTDZNZ0hzYlFMOHFMb2ZzaUNWZXNzc3dyc3hWT0hqbGdU?=
 =?utf-8?B?TWp3c0N2Wm5oYlVGb0I5L2xlQUh2VWZJbTBKc29BN2lOdTZsTHB6L3NrTTNj?=
 =?utf-8?B?L040bTdyaCtkV1I1QlFDNFQ1OVAyMzVadUl0bDZHYzUxWHB3NmtwaE9aWFBY?=
 =?utf-8?B?THNMV05UclFsdWFMMjA2Uys5cE1FYUt5Y25UN1NvUWd6bzBFa1RNQW1uVVVY?=
 =?utf-8?B?Q0lLQzgvckhhMXFLbm5EMGdxRTQwOER5YzBibmkrUUJCZXdVMWNQUWNDaGly?=
 =?utf-8?Q?RJXGX7Rxjdta8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rm5Wc3NmSUxzNVJlZHY2cFVoUGNIUXl3WFVuNVUxUmU5dzlRQ3M0dU9nYjhX?=
 =?utf-8?B?M2VoRy9BdytjejBkM0V3Zk5Gc1dnbnJxVzRJeTJ1RU9MeEtJY2ZHZDBTMTVr?=
 =?utf-8?B?Z2FSUkdBQ1ovWElKSGFQbDEyYkZpUTJqR3JFTFAvSGNmZ1BvY1BzSk9jOWZY?=
 =?utf-8?B?c0c1ai9ab2Y3UzVMQzR1UFFjQVdNT3AyeU4yWHk2WTE2djJWcm5mRWwzMXZv?=
 =?utf-8?B?YmJ6TFJmTEtZS08rWVNjc0RsWGFKb1JnL0FRMGJlYzNpNjJORThERFNvRUMw?=
 =?utf-8?B?VGMwMmtvbFZ6aVhkcjhrbHJBMUFrOVF0SUgyL2Y3SGRTQmFXcXAyanVIQ0Mr?=
 =?utf-8?B?M2JBK1dJVCtVK0ZIM1d3TUJaNVlqT3g2RkJYczYrNi8wc1pxRUVJNXZnM1JH?=
 =?utf-8?B?SzFoTzVmb0QvekpwSnVBbkYxZ0o3NkJLdFlTQkFRK0s1dUdlMDR0Vnl1N2E3?=
 =?utf-8?B?VjlET1pOUkxpYkViaTZ4aCtjRVV5S3Z1YmN6ZUQ4aWprcUJjazA4Y25USWhO?=
 =?utf-8?B?cU1lUlRqWjFWeTYwdy9wU0tuVm9Da292aW92ZlVVdHJiYmJqallJemF0K0JV?=
 =?utf-8?B?ZzViQXVCcGVqa3NGNnZHenpseVBEWDRBcjdxRnNwQWFnSFdMeTJTRG1saEkx?=
 =?utf-8?B?SGFTUXpKZlZYRlVZdDZsRmt5bG9wN1pzZ0V4Nlk3MUZMOVJDUmVvcmUyTlVK?=
 =?utf-8?B?eDA1Rkg0MWdHU2l5Z2djNlJLUC83K0hNUGp4ZnhRdVpVajZZWjZQNThBN1ZD?=
 =?utf-8?B?UFNyczA2WHBCSno3NWJkVGFtSlNjdzZUbktsaTRrNzhsNEhzUGJYK0x4Wmth?=
 =?utf-8?B?VnJtQk1DVW1FS0xIOHlNVlNNdmtPMHM2c2RDMWlrQm8zR3BTOUs5cDZMOEFD?=
 =?utf-8?B?Wk1GdTFrQWQ4alpzLzBpOXJ1ZDlCTUVHRytGVUJYZDFQYzdDNTAwK0N3bW5x?=
 =?utf-8?B?azRlVzBZd25WS0VTRndzcXpBUVZRNFIvRGRPOFNwOXRtZ01PQ3BHeHQ4MFNI?=
 =?utf-8?B?emM4M0h6aWl1b3RnUFdKcWxnL2dnQitQNHV3VWp0M20reVpnNE96MXU0Z2Nh?=
 =?utf-8?B?WENSdnlzQ0orRHd3VmxYbUd6OTJteUZscmdNWWZnM1pLTWwvN1d6ZUEzWXZB?=
 =?utf-8?B?aDc5TzFlTEF0ZnlBVTZ6aitzZXJ0UHBrc3NxWTNaeWd1NGYwckVEakJ1QUgy?=
 =?utf-8?B?TDFZRUJnSDlvWlNhRHlURENjeG1pUkRQTWxRTktPZXVBcFViZWVUbDA0RnBO?=
 =?utf-8?B?VTFhVzZwdmUvMmNGRUtNb0Q4b1pDcVdCS254dXIxSmNJclo5akVFbTJWcTR3?=
 =?utf-8?B?UklkWnFqM0ZhdGJtci9oZXAvVnN3QkNqQjFpTWl0VDc0RnJaT3hPL0NZd3V4?=
 =?utf-8?B?ZWRoT1czS29vVlVhV0xaTkkvbHF1d21QOURvMVZsVjB6ZnF3S3lVbFdJS2JQ?=
 =?utf-8?B?cE0waVhwM2szQklDdnJoZUtzY3c2OTMybjNhaGhxL2U4QmRwcWtLRVFWK1pE?=
 =?utf-8?B?SGVhYVI1OG5Bdk1UK2x0b0NHYk1QNURIUzFFQjZMU2hIMjFZWFNIQll0Q2Nn?=
 =?utf-8?B?eHZ2MEdYVUtWOEl6U2x3UUk0QWQvK3lSTWpBSVcwMGlORW1jQlJVcnRuekNh?=
 =?utf-8?B?ZVdjbDJEdFJiWHN5U1NiNmhzbGVDWUJzSXFtV0JQSjl3UUtJTCtuS25RS3lo?=
 =?utf-8?B?b2g3dEl1dlpZMlplN2FNVnI5NHJyQ29MR3dZeWp4WlgvbFNlRVF4T2d3Nkhm?=
 =?utf-8?B?MTNpLzNRUENEcTRhU2hEcU11dTNyMUlUWGFlWHBnOG45YlY4WWJJYkZNU1NR?=
 =?utf-8?B?ck5WRkRub1lYSmJveHZrcDN5Z0RhY3J3eWpLSmlnZWxJWUtYYWhvS2NlczZ5?=
 =?utf-8?B?R3d4OUhVK2wyamdUTGlhcnlZMWJnUmpiMmZUQTFmRXlRZXNFc1R0TXloN3ZK?=
 =?utf-8?B?Y2d6VS9temt5bkUxNW5qdzhwaTQyK3pOOHJibUc1eHhJNlgyOGJWdDRSUGlS?=
 =?utf-8?B?elBITUtjME4rZm54Y0JlMFlYb1VRTmZ4OUtFOVBwZU9zWXc5TXdmVVZWaW53?=
 =?utf-8?B?eHFCaFRWOHJYMUEyL3ZiL3VUaENWalU0eVVFckJlRVNjRVhaaXZDNXJDK09I?=
 =?utf-8?B?a0hid2JYZS9IREx0Mi9NSGZWWDg2VWRMNDJ1RjZjdmlWRUhGN1c2NGh6bStZ?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac892af-e362-4d32-a668-08dd45165130
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 12:20:31.2162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEPSXRsIp9VXKtVv5nb7athd+2oj3M4bt53XhkfFus/eK+6mE/PTwz+NXo5Z0fPeGa2SIfcFiIFuw+PrQ8Ib63c76/2byB5H7/StItwunx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8432

Hi Dragan,

On 2/4/25 12:22 PM, Dragan Simic wrote:
> Hello all,
> 
> I'm sorry for being late to the party.  Please, see some important

No worries, you don't owe me feedback in a timely manner, or at all :)

> notes below;  to sum it up, we'll need to rework this a bit.
> > On 2025-01-31 11:40, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>
>> According to commit 40658534756f ("arm64: dts: rockchip: Add rock5b
>> overlays for PCIe endpoint mode"), Rock 5B can operate in PCIe endpoint
>> mode. For that to work, the rk3588-rock-5b-pcie-ep.dtbo overlay needs to
>> be applied on Rock 5B base Device Tree. If that Rock 5B is connected to
>> another Rock 5B, the latter needs to apply the
>> rk3588-rock-5b-pcie-srns.dtbo overlay.
>>
>> In order to make sure the overlays are still valid in the future, let's
>> add a validation test by applying the overlays on top of the main base
>> at build time.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Niklas Cassel <cassel@kernel.org>
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>  arch/arm64/boot/dts/rockchip/Makefile | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
>> b/arch/arm64/boot/dts/rockchip/Makefile
>> index
>> 267966ea69b194887d59e38a4220239a90a91306..ebcd16ce976ebe56a98d9685228980cd1f2f180a
>> 100644
>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>> @@ -150,8 +150,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5- 
>> plus.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
>> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
>> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
>> @@ -186,3 +184,11 @@ rk3568-wolfvision-pf5-vz-2-uhd-dtbs :=
>> rk3568-wolfvision-pf5.dtb \
>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>>  rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>>      rk3588-edgeble-neu6a-wifi.dtbo
>> +
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
>> +rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
>> +    rk3588-rock-5b-pcie-ep.dtbo
>> +
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
>> +rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
>> +    rk3588-rock-5b-pcie-srns.dtbo
> 
> After a quite lengthy excursion into the scripts/Makefile.dtbs and
> scripts/Makefile.lib files, I'm afraid that the approach taken in
> this patch isn't right.  Please allow me to explain.
> 
> Let's have a look at arch/arm64/boot/dts/ti/Makefile first, as an
> example that provides already existing DT overlay checks.  Here's
> an excerpt from that Makefile, which also provides an important cue
> by mentioning CONFIG_OF_ALL_DTBS:
> 
>    12 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
>    13 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-ov5640.dtbo
>    14 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
> 
>   135 # Build time test only, enabled by CONFIG_OF_ALL_DTBS
>   136 k3-am625-beagleplay-csi2-ov5640-dtbs := k3-am625-beagleplay.dtb \
>   137         k3-am625-beagleplay-csi2-ov5640.dtbo
>   138 k3-am625-beagleplay-csi2-tevi-ov5640-dtbs := k3-am625- 
> beagleplay.dtb \
>   139         k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
> 
>   213 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>   214         k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
> 
> As visible above, the DT overlays get added to dtb-$(CONFIG_ARCH_K3)
> as .dtbo files (not as .dtb files), while the build-time DT overlay
> tests specify the dependency chains for the overlays.
> 
> Even more importantly, the build-time overlay tests aren't supposed
> to be executed until CONFIG_OF_ALL_DTBS is selected, which actually
> gets handled at the very start of scripts/Makefile.dtbs:
> 
>     3 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
>     4 dtb-$(CONFIG_OF_ALL_DTBS) += $(dtb-)
> 

Do you have something to back your argument that build time tests should 
only be done when CONFIG_OF_ALL_DTBS is enabled? For now this seems like 
it's your interpretation of the use for the symbol. Though I agree that 
if you had any test you absolutely didn't want to run in normal times, 
hiding them behind CONFIG_OF_ALL_DTBS would be the thing to do.

> The way this patch modifies arch/arm64/boot/dts/rockchip/Makefile
> actually isn't correct, despite apparently producing the desired
> outcome, because the way it adds rk3588-rock-5b-pcie-ep.dtb and
> rk3588-rock-5b-pcie-srns.dtb (instead of adding proper .dtbo names)
> to dtb-$(CONFIG_ARCH_ROCKCHIP) effectively creates some kind of
> "phony targets" that indeed "get the job done", but unfortunately
> in a wrong way.  The "phony targets" are handled by the following
> "magic" in scripts/Makefile.dtbs:
> 
>     6 # Composite DTB (i.e. DTB constructed by overlay)
>     7 multi-dtb-y := $(call multi-search, $(dtb-y), .dtb, -dtbs)
>     8 # Primitive DTB compiled from *.dts
>     9 real-dtb-y := $(call real-search, $(dtb-y), .dtb, -dtbs)
>    10 # Base DTB that overlay is applied onto
>    11 base-dtb-y := $(filter %.dtb, $(call real-search, $(multi-dtb- 
> y), .dtb, -dtbs))
> 
>    18 targets         += $(real-dtb-y)
> 
> Let's have a look at the relevant part of the output produced when
> "make dtbs" is executed with this patch applied:
> 
>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtbo
>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb
>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtbo
>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb
> 
> Note the "OVL .*dtb" lines above, in which the ".*dtb" parts are
> the above-mentioned "phony targets".  The above-quoted "magic" in
> scripts/Makefile.dtbs is what "unfolds" those "phony targets" to 
> make them apparently produce the desired outcome, by populating
> the $(real-dtb-y) variable with "rk3588-rock-5b-pcie-ep.dtbo
> rk3588-rock-5b.dtb rk3588-rock-5b-pcie-srns.dtbo", as the proper
> .dtbo names that get passed to the dtc utility.
> 
> Even more "magic" in scripts/Makefile.dtbs "unfolds" the "phony
> targets" to have the build-time DT overlay tests performed in the
> apparently proper way, while they actually shouldn't be performed
> unless CONFIG_OF_ALL_DTBS is also selected.
> 

I understand the symbol CONFIG_OF_ALL_DTBS as "should build all DTBs for 
all architectures and do tests" and not "tests must only be run when 
CONFIG_OF_ALL_DTBS is selected". I find it so useful to test the 
application of overlays to the base DTB that I don't think it's 
necessarily a good idea to hide those behind CONFIG_OF_ALL_DTBS.

> With all this is mind, this patch should be reworked to follow
> the right approach for defining build-time DT overlay tests, which
> is illustrated in arch/arm64/boot/dts/ti/Makefile.  In particular,
> we should just add the following DT overlay test definitions to
> arch/arm64/boot/dts/rockchip/Makefile:
> 
> 174 # Build-time tests only, enabled by CONFIG_OF_ALL_DTBS
> 175 rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
> 176         rk3588-rock-5b-pcie-ep.dtbo
> 177 rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
> 178         rk3588-rock-5b-pcie-srns.dtbo
> 179 dtb- += rk3588-rock-5b-pcie-ep.dtb \
> 180         rk3588-rock-5b-pcie-srns.dtb
> 
> You'll notice that the $(dtb-) variable pretty much again contains
> the same "phony targets", but that's the way they should actually
> be used.  I'm not very happy with the way they're specified, but
> we should follow the approach from arch/arm64/boot/dts/ti/Makefile
> anyway, and possibly improve the whole thing later.
> 

What I don't like about this is that it allows to build the DTBO without 
providing a build time application test which means maintainer(s) and 
reviewer(s) need to pay even more attention to the patch than simply 
looking at it matching the patterns of how other DTBOs are built. Also, 
you now need to enable CONFIG_OF_ALL_DTBS to run the tests, which isn't 
enabled in the default defconfig for arm64. I would assume we have some 
bots building patches/master with those options enabled but it might be 
a bit too late already.

> I'd actually prefer to just have these test definitions added to the
> end of arch/arm64/boot/dts/ti/Makefile, without moving the .dtbo lines
> around.  That would keep the tests separate, which should be more
> readable when we get more of them defined.
> 

And more likely to forget about adding either the tests or the DTBO 
explicit rule.

> With the above-proposed changes in place, and with CONFIG_OF_ALL_DTBS
> selected, the relevant part of the "make dtbs" output looks like this:
> 
>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb
>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtbo
>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtbo
>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb
>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb
> 
> No more "phony targets" in the produced output. :)

Funnily enough, I would prefer to see OVL for overlays rather than DTC, 
but I guess it's just one more occurrence of developers disagreeing on 
how to name things :)

I kind of disagree with the feedback here as this only takes ti/Makefile 
as example while **all** other aarch64 Makefile have different logic, 
the one I'm using here for amlogic (meson), NXP (freescale), qcom 
(Qualcomm), Renesas, Xilinx and even Aarch32 NXP, and the one we 
currently use (no build tests) for Mediatek.

If we agree to what you suggest here we cancel the side-effect of having 
the symbols in the base DTB that this patch series introduces. This can 
go both ways, either good (DT symbols in = nothing to do for the user, 
get the base DTB and your DTBO, put in /boot and tada) or bad (DT 
symbols in = big size increase for base DTB). Moreover, enabling 
CONFIG_OF_ALL_DTBS would now generate a different DTB than when it's not 
(keeping the symbols in). If we wanted to keep the symbols in, we would 
need to modify DTC_FLAGS as well.
This could help make the decision(s) as well.

So I would say without much more context on the actual expected use for 
CONFIG_OF_ALL_DTBS that it's up to one's taste, and considering the 
precedent here, likely up to each architecture maintainers' taste.

I won't be too difficult to convince here, just want some "authority" or 
a piece of history about CONFIG_OF_ALL_DTBS that would go your 
direction, before doing the change. I believe automated build tests 
without needing to enable a symbol, and that taking DTB and DTBO from 
the build output and apply DTBO on top of DTB works without having to go 
through some length to get the symbols, are good reasons to keep it the 
way it is in this patch series.

Additionally, depending on the feedback, I assume we want to migrate all 
current architectures building DTBO to be consistent and use the same 
logic (perhaps not for Mediatek because doing so would keep the DT 
symbols in the DTB, which drastically increases the size of the DT).

Does anyone from DT maintainership have feedback to provide on what is 
expected here generally wrt building and testing DTBOs?

Does Heiko have an opinion on what he would prefer to see happening for 
Rockchip?

Cheers,
Quentin
