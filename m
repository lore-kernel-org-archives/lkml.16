Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2054.outbound.protection.outlook.com [40.107.104.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC82E23814E;
	Wed,  2 Apr 2025 15:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743606148; cv=fail; b=n5JA7b1sjdrpir7fMNyfLY5VagkhJZBN2A9FxFwZ4MDu+AA/jjqJavbS5/HzLjJ2TQ4V1ecCDtKAMiOtIF7EI7ZSggAazLJEdi1BqcB69wOhGTus0MYeYP48cTM1RtvaFp7aInb3ImXfVg7X41qPfpfwnRlvA4FapKNjZdvRTFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743606148; c=relaxed/simple;
	bh=HsnUFhnyTrjgRKlF0q+J622LmpmDQRdXugmoXdJjpqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fS8/LLAj4yYGELqdJ+4T+QlPNQArdeHQU591Ne1X/IguPGwWb+dQLH2RXaswsm4iXh2vUyCqK+mkZPNlSX2CgBDyYjpfkJlHdL8ICzilgCvG2EjLjoSGcwZFapaoKc/WXcgsY/PG0WQXyDtj9XtkHTQSsh8qkddxwMFBXl3e0HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MEotwqvT; arc=fail smtp.client-ip=40.107.104.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MEotwqvT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyoPNMt6IKY+/yrDqfd4PnTZT1pkGnn6ItSaDQGYeOAGcH2Lt3j5mn59YdmqA8oU/grjdFsAVlv4zlvs5viY3XpwpM1/a0i7ubV2bepd6YY3gcV22ac8tus/EieFgw5FLvG1irZFteBW0Ja9odKp0p3SDI61mMS6ggt6iQD3GOZn7IqcNpqHlu7/B5kf3EGOSqLRzxSglo5Peo9x6Mxb9NesE8CmZlZZKaxoZD13JixMvOMwCIg0xB3RDrp4ev07O5Yh2BwFcxrXyzCCaFpV24TW67iGp54xUhems/mWz4fO6WUnMeFnGaYs2xI18tdYMJhsMyxm+kGA/pTBbLDXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMPUPJa4bwMHYw3HIz5sm6Rg7dJAnrax97Q4pfQOMWU=;
 b=LGPbd0pN7I6jgTzt77P6B80FgyycM17XevDO24xqqzgkeR5YEpVBQ5rsKRMFfzqftGrFlzymGnphiW4h4DDmJfiVEdcJOipWPCkbiF2mHQozv0AB77HtbV5IRYPFTlRKx/u08CiPGnyNDgnoVa4BmpUTZQ8xEZM8ChSodEpOP1dVVbQPhI1kgD/V/14poqSj8fpbywLy6GGbiXYcTqn2Ql457wXjCTja17QlaRNk9BDV3LBeWGQk8LxiJKjsFq2edSitlmU8GwkpuUG0GbU4HkO2MaTEWjw1T8RSRyIsaCpitsKNE9eEFjlhqhRP5FTPebwOMauCpRhGE+bvmDcxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMPUPJa4bwMHYw3HIz5sm6Rg7dJAnrax97Q4pfQOMWU=;
 b=MEotwqvT9RohqxM23S/upbwTqiTeFiJIl8yv1nzezvA8SgY5Ip5VD3bKsSB6z7Ij0w1bYJUDu1wU2UGedBAH1j3fCH8q+bXD/gROGwfBMUXgPuqvK2eg/WdD8ztQANke7ZxkW+jGgwS29nlNddG+7833brKYZnT9MKNedzTqGBek6FtAUWBZtzuv6TFGp8JVTU56VhRy6Op+cBlW43bg+TBe7kHewlV3HM7WReCZYUKNdbINuUq9bBY1oedSRDzgvYgC9AvYaCLTCP6dWE8xAJLszqsy+3BEsSU+q708kDZWtvYhXI+OIykzQmMV0wFoEvY6sFCJ0jtliGypZOBf5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7997.eurprd04.prod.outlook.com (2603:10a6:102:c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Wed, 2 Apr
 2025 15:02:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 15:02:22 +0000
Date: Thu, 3 Apr 2025 00:10:37 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/7] firmware: arm_scmi: imx: Add LMM and CPU
 documentation
Message-ID: <20250402161037.GC23033@nxa18884-linux>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-1-7695f6f61cfc@nxp.com>
 <20250401-quantum-coyote-of-admiration-bf1b68@sudeepholla>
 <20250402123503.GA23033@nxa18884-linux>
 <20250402-acoustic-analytic-guan-d3cda5@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-acoustic-analytic-guan-d3cda5@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc030db-7ba7-437e-3afc-08dd71f75eb0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DKAcloq019Wu+Kp2hUg1wIeQu4FOyirRyyEWgBT5WMAgPvoc0K4SHYUSgLpA?=
 =?us-ascii?Q?d8HauuX9SfqZb+l68sLXYNcGvBWvnk8VunGbqzoAZdsYV08aqS+vSaMG9Hty?=
 =?us-ascii?Q?CgInv0iJFTUV4KDXOUXFRSv4IiWLl+2sRfprzrW7jycZpb6MIaEzkJsancVV?=
 =?us-ascii?Q?4e+US7u0IjrDbNWKwUOVKrFJjBU7iPdYT33YrYR39E5CK+2r8DKJ0bCHSGFM?=
 =?us-ascii?Q?dkjxJPaU/oUddW5Ib8nSjG3/lmVYUWaRwDicxVXmz/oLWFY0onqPWdboZMvW?=
 =?us-ascii?Q?VqCBPIj4nCKfVQC6VpR6jkOEiCU4Lr58iRoF2dBXb1YsG09ZqfhnelHM94pO?=
 =?us-ascii?Q?NGrdWqdxgL6Se4Ru2J0BwD2Zb6M8BqSgZ26wvSbZUWNYoNSI8FfzJ7YBp36p?=
 =?us-ascii?Q?NC/fvbfyJtUuh/a63hgf6f39350FxWBdgSFmqzUlNot36eSusqxCTH27948/?=
 =?us-ascii?Q?ZK5h/9ACccbW1EpFMi/2QBq1qxHTetRCKGnS7yNVZSv4UBO89AAZuhGi5Jk+?=
 =?us-ascii?Q?xnouajJzip7VnEidThNJvRtHRgfbYjC21MWD4HWe/cz0HIDxx+B9IWpV+E17?=
 =?us-ascii?Q?L0JXJ4wWE6UQWrltLVV4qHrCDVMFMSWgBxY1Qp/5V3nBplYQGbXcal+lLhdD?=
 =?us-ascii?Q?Rt5J4PRDRLKmXwrBPDxhTyRMkxqhL3jTLZA6Oq2Bp4KlOHIJmLix5BEYTZGD?=
 =?us-ascii?Q?O1kFxpzO97bk4iEIYszmjgVO9Kor16YrkQvPSLNtxwv17V6hmlecflwtpVGN?=
 =?us-ascii?Q?M9vSL57eXTXZ2Lk73/MzPu4K9W9BerOqOAO6gy0NvcC/EXHftPyq88sRxJjJ?=
 =?us-ascii?Q?oQf6+oTip3iB3B5MLHz8sOS5fp5psquvmhYeZD6jwT6loLpf6IvA5cszA09X?=
 =?us-ascii?Q?xtP+jvcfUq6kWzr6W/vxZC8KWEE4k9OI3u0ooUHSsiH2CuwYg4yNkkRvEMbd?=
 =?us-ascii?Q?OZbVvGP36xQE78zD+ajzLhHzSP2TvJEI0pdCd/jBmQ3DDvGNcwY4ioKiFqN4?=
 =?us-ascii?Q?TCkZoO39WmSx0JSI6c8HczhUgTsfEAm1q0GfkGmf5V6thx7oOqRF8RfYqHM/?=
 =?us-ascii?Q?d/d5XzUyCnWuZG3mmCzhY3tYkpc7WklybAZ+SLVDDpNsIpkjH1WT+M1f6gAK?=
 =?us-ascii?Q?poYdcZHPDt6D2pMmfm/Tqkx5tusV8kwIcWAbOa3FPYRN/iKvZUbA3oFgk1hb?=
 =?us-ascii?Q?q54UxdIxjABfbpPII9UcaO1UAJsonI45Fz6UcfrUcUcVqRZVAZLL3np3TkBU?=
 =?us-ascii?Q?BVYoPUwhu/Yp/bxNoQVd3L/LleSJQBJZe8fgn+O2t5Dn9odRCeaoc+mYvWJh?=
 =?us-ascii?Q?+XwLk5eXQtYCbNo0c64nU60uRdBH5qpBkg/GXv8F9SExXmR1HCxM6IWxzj0n?=
 =?us-ascii?Q?P7OXIEaA3Bq6j+xRdUy27HaqAjUOkYZyp8l9bcLou3i5d2aGJ5swV9bviP7y?=
 =?us-ascii?Q?YFQb51u0W0WqY2aGPtxC1q7AiKTnIeVx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2nsGymgkOvnH1CupXpd19cJIbFuySLcaV8JeSXYzreOEjEWiQdzrZfOyqLRV?=
 =?us-ascii?Q?hBZhL5l3PSRpWsmw+340JJ23OLvnKs9sQruqmTaoxwzgxHSXJEMdNVdk7F5A?=
 =?us-ascii?Q?VIJvRGj6RkdzOg+7OUCo9fyxacGauq3EC7sBPYSw1tqwYaEyR96tvQpVEBBF?=
 =?us-ascii?Q?vCGGNqaOBzWoWtb38Hd/FGZD4S5sInChwQttXocmxUQzYx3P1K9duk8k7gl/?=
 =?us-ascii?Q?KyFXWDJnPPeWYsWSvE625QSrS0IcOrrWEtBv1ic7wh+c3cSOiAkHWk0h2bKt?=
 =?us-ascii?Q?e7LUTB1iOA8KF6iPxhIV7GXHwAzIRNgSf3C0QKbuoqeADZ7VPXsEcnWOW0H4?=
 =?us-ascii?Q?4k79YuPjB8V/IvQ6YurEv7NnbLLQSkYsBSfNehGLsmq1kxcpwiwGKMIq4nx1?=
 =?us-ascii?Q?9r7PsTpHtHS9erRY5TsW6RDLozMuenLybw9rjXjK2vaFeyoOW9lXMYngNk13?=
 =?us-ascii?Q?1kRfCGxavU5CtCHa7svG5F+sNh3OpbnYFhErc7CavAIBph0qXXA/U6ad+ldU?=
 =?us-ascii?Q?HRgxhJAWJVrsf2abvadgPta7BxKNmm82LMmhwUqQnzMJbM1Sqet5v58PCwx3?=
 =?us-ascii?Q?dZHyjJmnZxsj4eBRQS53I07e3RE551qEo0WPAmRuYfR1/xL/4HjaAv/WRqye?=
 =?us-ascii?Q?AET+yuzwiUxl5kX1vNe0oR5MB4VutD9241zoEqPfN98dBqxOWZqcdXOaF4zw?=
 =?us-ascii?Q?BF07umeulZx/LZLOYCtq9ziePehNPSVvB9caoQTa/kjuqHKluENYYA2fx4Zd?=
 =?us-ascii?Q?rAcsQFgoHb9nFxF3qGAbXpLRzgAbfzBa591HNFA+TtWjAKk4smKDSBHOx1dQ?=
 =?us-ascii?Q?EYXXlJyh4SnULid7jZqteticGtjT0hN3kLAvxfsSYpolNj818pfQQtz6ylqq?=
 =?us-ascii?Q?ThMiXfef9/5+g8gCM8ZWJK/v1njarnkvSeigEYekjLWh+/Xu69AR6aROL+p7?=
 =?us-ascii?Q?xT9mEynowJMacJLDlqFTKf05uHE9nA30smMC9XYtB5zi8qPDsb0ZMbgdNkV+?=
 =?us-ascii?Q?QqAWuOu5wmqhWXQhgW4iADEJfEiRcVIqcH6GjFL6ldpoLQ8SSN7CLH/EQryw?=
 =?us-ascii?Q?Fpe6Ei2guHbouLYTiQaiw/pTOr0+vlJUzJh1NRPeRGXEYavjeFATtC5/P+/w?=
 =?us-ascii?Q?0+0gtomGsUEC1MCHKBtPuJy0kzwUs1VuZyNwoBkkox7f2Fagkj/kqpjs+QPu?=
 =?us-ascii?Q?8QxFRQ3aqFN8XsYqx2Q0IsqUuLZmgtcigU3ER3hQpAKUv64K15wbZeeQEX1h?=
 =?us-ascii?Q?ISkRTnj7bwBvay8/pIU3FRE1NeXI6aTllBhP3JLK+FpVGeWV3LTualQhJMfP?=
 =?us-ascii?Q?B3TkQJjHu+/bDNVc7Tf7FpCJbvt+FkPDjJEZGmEHNMFc2ss4CJ3kBqIAFfia?=
 =?us-ascii?Q?QRAKo1mzSYkIQXNj/uonNHqkgJbPVCFPlvgqmi74hpVFIHxYjaFEAqW82k9j?=
 =?us-ascii?Q?yy19kKntvzqpqYLkecNXRDKy5MQowz0HkfBRQjoHfm7huCXg+CmaKqu1Q3dK?=
 =?us-ascii?Q?2PdYH1c3Mw6I3uyHXqYFPkSDn4yyMziCM/AzQP55/aQVnn1uyy/AwDGRaK9H?=
 =?us-ascii?Q?OlCJum8Y589Md0jE1tU5Xa3D4YhjEtI0OlVWhIfd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc030db-7ba7-437e-3afc-08dd71f75eb0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 15:02:22.0697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iooNXMuXWv3ecQ3Q8sGj3d/mVlzZqEPYqS7OKQjSsJho9+UJgtJLSeuL9WfL7i1wKY2dRy2v5TMdTJaS7HRgGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7997

Hi Sudeep,

On Wed, Apr 02, 2025 at 12:46:14PM +0100, Sudeep Holla wrote:
>On Wed, Apr 02, 2025 at 08:35:03PM +0800, Peng Fan wrote:
>> Hi Sudeep,
>> 
>> Thanks for reviewing the patch.
>> 
>> For comments that I am not very clear, I marked with [TODO] for easily
>> jump to.
>> 
>> On Tue, Apr 01, 2025 at 03:15:46PM +0100, Sudeep Holla wrote:
>> >On Mon, Mar 03, 2025 at 10:53:22AM +0800, Peng Fan (OSS) wrote:
>> >> From: Peng Fan <peng.fan@nxp.com>
>> >> 
>> >> Add i.MX95 Logical Machine Management and CPU Protocol documentation.
>> >> 
>> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> >> ---
>> >>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 801 ++++++++++++++++++++++++
>> >>  1 file changed, 801 insertions(+)
>> >> 
>> >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> >> index b2dfd6c46ca2f5f12f0475c24cb54c060e9fa421..74326bf2ea8586282a735713e0ab7eb90ccce8ff 100644
>> >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>> >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
>
>> >> +
>> >> +PROTOCOL_MESSAGE_ATTRIBUTES
>> >> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> >> +
>> >> +message_id: 0x2
>> >> +protocol_id: 0x80
>> >> +This command is mandatory.
>> >> +
>> >
>> >For completeness add parameters here for message_id as in the spec as it is
>> >referred in the returned value and seems incomplete without it.
>> 
>> [TODO]
>> Sorry, I may not get your point here. You mean below format?
>> 
>> +------------------+-----------------------------------------------------------+
>> |message_id: 0x2
>> |protocol_id: 0x80
>> |This command is mandatory.
>> +------------------+-----------------------------------------------------------+
>> |Return values                                                                 |
>> +------------------+-----------------------------------------------------------+
>> |Name              |Description                                                |
>> +------------------+-----------------------------------------------------------+
>> |int32 status      |SUCCESS: in case the message is implemented and available  |
>> |                  |to use.                                                    |
>> |                  |NOT_FOUND: if the message identified by message_id is      |
>> |                  |invalid or not implemented                                 |
>> +------------------+-----------------------------------------------------------+
>> |uint32 attributes |Flags that are associated with a specific function in the  |
>> |                  |protocol. For all functions in this protocol, this         |
>> 
>> message_id is not put in the table, but it is list above just below
>> the protocol name. I would prefer to keep current layout and align with
>> the MISC and BBM protocol.
>>
>
>I meant why is the input parameter message_id not described in the table,
>but is referred in the return values. For completeness, just add it even
>though it may match the SCMI spec in terms of input parameter.

I will add below only for PROTOCOL_MESSAGE_ATTRIBUTES which refer message_id
in the return values. Please raise if you have concern.

+------------------+-----------------------------------------------------------+
|Parameters                                                                    |
+------------------+-----------------------------------------------------------+
|Name              |Description                                                |
+------------------+-----------------------------------------------------------+
|uint32 message_id |ID of the message, const: 0x2                              |
+------------------+-----------------------------------------------------------+
|Return values                                                                 |

...

>
>
>[...]
>
>> >> +|                     |Bit[23] Valid err ID:                                   |
>> >> +|                     |Set to 1 if the error ID field is valid.                |
>> >> +|                     |Set to 0 if the error ID field is not valid.            |
>> >> +|                     |Bits[22:8] Error ID(Agent ID of the system).            |
>> >> +|                     |Bit[7:0] Reason(WDOG, POR, FCCU and etc)                |
>> >
>> >Is there a mapping for this ?
>> 
>> I will add a note in V4:
>> See the SRESR register description in the System Reset Controller (SRC) section
>> in SoC reference mannual.
>>
>
>A reference would be good here then. I would be hard to imagine what it means
>otherwise.

Understood.

>
>> >> +
>> >> +LMM_RESET_VECTOR_SET
>> >> +~~~~~~~~~~~~~~~~~~~~
>> >> +
>> >> +message_id: 0xC
>> >> +protocol_id: 0x80
>> >> +This command is mandatory.
>> >> +
>> >
>> >I can't recall if I had asked this before. How is this different from
>> >CPU_RESET_VECTOR_SET ? Why do you need this ? Why can't you use
>> >CPU_RESET_VECTOR_SET with an additional LMM_* command.
>> >
>> >I am sure there is a valid reason. If so please document the same.
>> 
>> CPU_RESET_VECTOR_SET is for cases that M7 and A55 in the same LM.
>> LMM_RESET_VECTOR_SET is for cases that M7 and A55 in different LM.
>> M7 LM is under control of A55 LM
>>
>
>That still doesn't answer my question. I was asking why do you need this
>extra interface ? If LMM_RESET_VECTOR_SET can take both cpu id and LM id,
>it can be used even for cpus within same LM with current LM ID. Why the
>need for separate interface ?

For this one, I need check with firmware owner. loop you in
internal mail.

Thanks,
Peng

>
>Other than these 2, I am fine with your response on all other comments.
>
>-- 
>Regards,
>Sudeep
>
