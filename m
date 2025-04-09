Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9DA41C64;
	Wed,  9 Apr 2025 11:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197011; cv=fail; b=WDdwNfEr1JYEiQQUJHV9eZJDjsqhnhBB8QPFrw3BLpLULpzI+ueF7eaxe0ZRcLkaIPdZBlDqqvFnrAvyadXgWfu/vhX9h4QWR7TuI+DFzNaHbQA27qMFuWyynuBOAorybb4e5rHuuw2dg+gV4k06FXkBFCgK0jZZMit13YzfLwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197011; c=relaxed/simple;
	bh=2NDIOB81dXV6VAI9ft+KhrUzOQ0PHg6+Fi5pWSvz0KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FEAiKPH4wBGI9rn0Px0aXZt9ZCKcqsSBcHtkJIszgwXFPZFNl/1yLbP2Hnm/eDv0KO76Ymjhm9fnAMnNLsnpIep4vH0A+QhunS6v3LPPWSEp88hHkG2QwKGN5zG6jOIEC/mFIwwe38W/cQjXNgnEWmALkj/qP8QFLpnV+aQ4zVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=usdfmZLv reason="signature verification failed"; arc=fail smtp.client-ip=40.107.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="usdfmZLv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iM2cXWED99cE235Q2vs2cTk2IB57R+bVMeJ4me0KU3L/a4b0ig6VrAB3nlmwqFd2ZawSfoqqpRwYdBQohUDGIc65LgY2JVfZrK542s221a8sXALl/QxIHCcz39SWJZ2aw3ajjnKcHceclgVJ+2tPn+BhFGZubCW/Kq2gZL8LegmpBimxAJN1BubfSwyFW+Y1Z/cx6rrULHPqNXTnBysd1YvXKud5paVRNduJRYmqvRnO5HNMPcS5g986X4pUubCKZ/RSSXtw7KyEu4Qyj3AQNlnfIVSUqAXMhtYFaWgZ3x3cI+wHI96gbKkyrU4JjMhVGaNZZHCKW7zsJ4Yd0zKx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7E9FVa0K47+HDQKIbUpJWgE89GWZbHOkNOSTh7MB87k=;
 b=H5Ek+PIZ7tXtJeRFP/81uDduNFo2MOAcogDZsTbaZi/x2YiDtreUimcMFJRdWvWoPUtolD9D/RDJNr02lS4KPMY9DP5cXm/1ih+tAUyqM0fNiD75yRgSJdCbes+qPZgrDfIwgRD2sv76kEVJoV/tbpxHyP2w5C7iZv+h75u1WmjIe/wzPjfmnfixPqfST0roqduHzzAzH6dLekc7zDT2sTTOV4yJIk7GILMlU/Qg/X0PO7x2GowWYsmu8qdVO7PpnblOGU88hojfiOryjnlk93axRgtXGF47R9W3OoP2BxluUMbM8hwDISUcxWfbqq9MNpNswTvqzB1FdH3NHnFTWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E9FVa0K47+HDQKIbUpJWgE89GWZbHOkNOSTh7MB87k=;
 b=usdfmZLvZQTP4rW+FiXAyg59c8Ly+VGivN9bw8XX8+ZEQXsBJwVLgcLmtw3bn5VpUv2HkGAiyLuIp4w5Ia9jJKgYNkta72JjD4Sv/OV6B6PjwWMWIe2rWwkAlmcpb1r5WsrQ83M1MnbX+qFQyziw6B/n45hsox8WqQAdSOrai9cXeRCYtjo+1nHNQLzaNiT+vRofNtEiFBrQ6ot+aWb4SlhaHThWLOZRC5imaLehmx+c9leZMlW1DArobCJzEL+8Rc/VAokam1Q8+fhAe6s8tjHKx91ddpDqcTM43rFfUNN0exj+/V1Vdw1yUlctu78XKKVejAjrQAYW3CWzIrTN9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10458.eurprd04.prod.outlook.com (2603:10a6:10:565::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 11:10:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 11:10:05 +0000
Date: Wed, 9 Apr 2025 20:18:29 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow
 linux,code for protocol@81
Message-ID: <20250409121829.GA11949@nxa18884-linux>
References: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
 <2003940.PYKUYFuaPT@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2003940.PYKUYFuaPT@steina-w>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10458:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d57a2d8-5517-4aa5-9491-08dd775714ba
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?5BtatGmVUWRa5GdgPhGdELDiWh6a5KhGZ8H78WQovkZ3OZCC0p8cuJr/Z5?=
 =?iso-8859-1?Q?WRo9wm4cGDfuBE9sBO+d9OXJRIFL2mKygbrPdjeEyQgX3/vOHJaW7WVd/G?=
 =?iso-8859-1?Q?Va2+ovZGWI+rytf/bmsj4Z3Km6gy+IC4nGs5UhhLO17cJ4nKW1VI7MVAId?=
 =?iso-8859-1?Q?nlpiKzUdLnU2UV8VFIX7QK1RtrTgmkT3/RCEfZF/Bjif9wASth2AkJtOqK?=
 =?iso-8859-1?Q?osX1RXyz8oCl730zb2GJm4nsNmKf7P04I7pP6iyx87qbOm2n0DNkzzvqob?=
 =?iso-8859-1?Q?5my1F6p7Fd1Y0X4dYBsCPk8ilNgcRkdSfgS0zb+yFMG8U1Z/Sf9d+nxpPL?=
 =?iso-8859-1?Q?RlmdSbq8/VBoAFZUquL+ySTy8Ykq0+iCB04lOfFL2AVZvOweO7P8G2AFgx?=
 =?iso-8859-1?Q?/VDDBnaYRMe5R+XCvecP3TIxEYELOD4u3hf85osssnaPwKmVoaEtnO1qbd?=
 =?iso-8859-1?Q?z6Z5lLLKLWtJPmSB1oT5FbwrDdspwAjCQXN8SQmDyuFSgnAYzM48oeQJGA?=
 =?iso-8859-1?Q?1n7rjfxyGFoxGeTn4ujvmysogayiXC1c70r4DtBdI63YuS8dwM+aIxzLXj?=
 =?iso-8859-1?Q?uGtukg6Z0UCDZLMgxkBj/bbNErijMJH/sNOOeT5rn+JVpZE2+Eko59TqcC?=
 =?iso-8859-1?Q?4QmXu9bIBVMwZd2oMd/MCJhcp0UT+tmFTkZX78f/Ov6wEBEV8JnwUcQnIW?=
 =?iso-8859-1?Q?XAfII0/NtArrZcJXzS9jdgHUdeLJ7B61ysYSYdZHBVI90eO/EoZiJz+wR+?=
 =?iso-8859-1?Q?QwRzr5j75ohYqlQgNzHtP+Ynv3FHu+bOdmwakoYLH9f2T6lYioyc3m/4Mr?=
 =?iso-8859-1?Q?g+fELyYdWcD1LB5ehjTub1tDJtSmfCbrn162049+gqiqWzHiohlc5k2MO+?=
 =?iso-8859-1?Q?VxDk59rMpZuYtXlQxVqyiO65eF8YwpMbYIlOKykd6bmdsm9DhI5qwY/49h?=
 =?iso-8859-1?Q?IiHSBSoUxi1OS0ba07Aia/T9lwVEzqZWIi7b4RB/vs+GYLaTkBE/u0Krhf?=
 =?iso-8859-1?Q?axqifFq9LpZN2fyYXWY1O0766PFVrC041DCmcgoOe+hrXmtN2/mCCFX/cq?=
 =?iso-8859-1?Q?M3HPVXXzlb71r6CbmG9nsDE3XQQTmtW9og6gUztEJWNxO3wpB47+mHlKyC?=
 =?iso-8859-1?Q?ILB6Ndn14n0NryBHaH7lB8uPSuyitL7bP4Y7hxk98nGDt8HK9EFMHzIVpP?=
 =?iso-8859-1?Q?tp1t9/4BUVuvBkBYsN3Q5V56p4D5HVAQkT28hlDkL/UE+U1eNyFgW9l8Fm?=
 =?iso-8859-1?Q?IWlZbaj/k5j/hbbyqBockfiR1w3+refPta77LiYgrn42CpJgjuBwl+YQzv?=
 =?iso-8859-1?Q?PtTlphp7ENLXaSCFL5FRKDRfh5OQpflGD786k6Tq7AZx1v0k3qiUFOHbXd?=
 =?iso-8859-1?Q?xn2afyLaso4tCCiJRoPbv1VYj4HUEDrIkx6FPRyEz5p/UuS25zVlORXcze?=
 =?iso-8859-1?Q?MA3NJoSAsE1pj4JvVhjKYm5BLGbI/FAIR/7ySSCOU2cz+UajlZBUX8OdNZ?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?B40i31NHxMi6gF3jF3gkFVhlO0rbfHDfQaq4Sg0DAOtJjCOkj+Ah63NiuW?=
 =?iso-8859-1?Q?eNsIeTxLiHUS0ESSLZIZbhN+SaOX8EUFtw73I6bNE1594/2kTbX50gDEf2?=
 =?iso-8859-1?Q?ICl/D6yqIfeZXIV3qhxoiMUUCUDDmP5o2+EI254T+tW06jr02rk1/E3L20?=
 =?iso-8859-1?Q?YgNkWgc7/ZukUNHIZEGpxDwQ5UnJvarTM07or/X3snnUrQX+9Tvzlu6tlM?=
 =?iso-8859-1?Q?tA8dajZ3DQZiCA7vRzRMYTju/OtxACus+zso2cN35aP5StRnoh3NlRWG0I?=
 =?iso-8859-1?Q?4sBgLmvXC19h2LzW+LDEoXUxUfNKhiSbMVS2G2czA4lnWqvPWkI/+332sP?=
 =?iso-8859-1?Q?Ujn+TFNUk4Gt/+grxQcD5uck5OdOnOSwqoCvvj8Epx1iEo17hbBIEo5yuj?=
 =?iso-8859-1?Q?/H1HZVRKG0Yvd1PIq6q7hDUWWQ8622IEKUHGPaSeSut4TeA23R+Ivlf95L?=
 =?iso-8859-1?Q?ArXNZ7MCxfK0xuB7djE03BSWnqK9ZmhA/x+7yfMj8cSYVVfNzpBFwlYTa+?=
 =?iso-8859-1?Q?ovGY+qK9zdwbhl+mQ6Ioq7uYBKz7vYCBFptbbwxS87pIfjk5bCa66Cu2wN?=
 =?iso-8859-1?Q?JRvKac2D58yBH63fDIVSUJQ8Q+vFeYsi9rtu9JZjKnDwffkb33vnqFLWGi?=
 =?iso-8859-1?Q?qxcrmZwxT0/nUnYTcOODtbn8XiPZ39Hq3tSz5A1J1Cnt61MHAQCe3yIH8e?=
 =?iso-8859-1?Q?+9JV7NkFL5aEEnW9ERI5jNaIt2oX2/l7fiW1T13p969+Kz17mXfkSnH8/p?=
 =?iso-8859-1?Q?mxrw81Oqx2+xhM+1RoAQVgVuMOqpIoIEIYe+Mv6FaMHCK979CGc/9a/H4I?=
 =?iso-8859-1?Q?hS44FX4dPKS9LLWYilp/xZPjs6upMwMlGu4OV7YT+XDCAEygngx43jqj49?=
 =?iso-8859-1?Q?lrQB2A1d06sbdWO9rv78+M7gWUSzaJJOBAchMHVjUc3mZLKMhrsEOvwtrY?=
 =?iso-8859-1?Q?75gcTbSJdF5klzPGVqm/DcS1fudhJJtL8pYn3T8VogSp8Iw/eakMmJnRa4?=
 =?iso-8859-1?Q?gaX73lXjLIAnMSl+x2QD+Ly+ndRLXEqXll31oRQ6hV1HKd8jT2aueqq14l?=
 =?iso-8859-1?Q?Od2WXPYFCXuoLpZcEUzrjRWg37CckrjzsU7/m1MPC4jA55qdmj9aj0w9UW?=
 =?iso-8859-1?Q?EI66JHA2eHwk203uBzTMR4k0LvNxyjOaloED0qr+5c5jN3WMtrmZvSoHFI?=
 =?iso-8859-1?Q?EFcT9K/S2S76qWGirqlkoWD9mO0gRnyuuXL4F+ZaQKA2twrqm8NmIvm8I9?=
 =?iso-8859-1?Q?y9kbgUO2eO2f1r1VKeT6XYqjUg9R+q34ecQXQ8Iosqhij6mtFLAV0sL3B7?=
 =?iso-8859-1?Q?a7trccxtaj/Xx3Lp0cQXtpsjnbHm4wQXXovlDxutT9uOOUWxVepPkyYXO/?=
 =?iso-8859-1?Q?+tGBZdGjAiN4KMXI0OcU4YPe9ChBSUQlUuSDZEofBUMr1vooXKR5nFkUvx?=
 =?iso-8859-1?Q?8omJZGTAtPhYCW0TCDxQiV9CfjUoFBngGT757GlqFlKZYERbNqRrPrw51f?=
 =?iso-8859-1?Q?krhPksk2pNF3yueUYE+7HmYRLLSzzksRtTIhyP3DiPIuSdprS/Hp2z0Sqk?=
 =?iso-8859-1?Q?TuoxrM6+iAiMu+tDUaOw3q4leEjwRFgJSld836CxCsAB0WvFII0UHtfTCZ?=
 =?iso-8859-1?Q?g2XgGyqpoGeFMsf4GjwZVzL+NrYWKyABdz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d57a2d8-5517-4aa5-9491-08dd775714ba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:10:05.2940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIcdi8VJcloFnyDRXiVIm/b0zsLccvmunsGukmkHKqbvvZVxePhZcxwlZZj0Zs/f/GRBlll/negHdc5u3Skm9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10458

+ SCMI maintainer, Sudeep and Cristian

On Wed, Apr 09, 2025 at 12:59:50PM +0200, Alexander Stein wrote:
>Hi,
>
>Am Montag, 4. November 2024, 09:56:21 CEST schrieb Alexander Stein:
>> BBM protocol supports a single power button, supported by driver
>> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
>> using linux,code. Add a reference to this schema and add linux,code as a
>> supported property.
>> 
>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>
>Is there any other feedback or things to do here?

I see Rob already gave R-b.

Not sure this should go through Shawn's or Sudeep's tree.

Regards,
Peng

>
>Thanks
>Alexander
>
>> ---
>> Changes in v2:
>> * Added default value
>> 
>>  .../devicetree/bindings/firmware/nxp,imx95-scmi.yaml   | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
>> index 1a95010a546b1..c1b7140ee0098 100644
>> --- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
>> @@ -12,13 +12,19 @@ maintainers:
>>  
>>  properties:
>>    protocol@81:
>> -    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
>> -    unevaluatedProperties: false
>> +    type: object
>> +    allOf:
>> +      - $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
>> +      - $ref: /schemas/input/input.yaml#
>> +    additionalProperties: false
>>  
>>      properties:
>>        reg:
>>          const: 0x81
>>  
>> +      linux,code:
>> +        default: 116  # KEY_POWER
>> +
>>    protocol@84:
>>      $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
>>      unevaluatedProperties: false
>> 
>
>
>-- 
>TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
>Amtsgericht München, HRB 105018
>Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
>http://www.tq-group.com/
>
>
>
